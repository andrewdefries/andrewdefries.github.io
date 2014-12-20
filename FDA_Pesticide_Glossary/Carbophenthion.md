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
-2.984133, -1.077681, -2.34722, 1, 0, 0, 1,
-2.719781, 0.607044, -1.476002, 1, 0.007843138, 0, 1,
-2.675437, -0.6234217, -1.507657, 1, 0.01176471, 0, 1,
-2.634609, -0.3145661, -2.096476, 1, 0.01960784, 0, 1,
-2.574532, 1.125807, -2.203832, 1, 0.02352941, 0, 1,
-2.554391, -0.4440936, -1.567953, 1, 0.03137255, 0, 1,
-2.48154, 0.2875631, -2.030916, 1, 0.03529412, 0, 1,
-2.481417, 0.4662995, -0.6327418, 1, 0.04313726, 0, 1,
-2.472549, 0.1932144, -1.512836, 1, 0.04705882, 0, 1,
-2.385334, 2.14274, -1.73931, 1, 0.05490196, 0, 1,
-2.298126, -1.902822, -3.700818, 1, 0.05882353, 0, 1,
-2.253248, 1.202286, -3.064584, 1, 0.06666667, 0, 1,
-2.243263, 0.225619, -0.690786, 1, 0.07058824, 0, 1,
-2.236876, -0.3719499, -3.923897, 1, 0.07843138, 0, 1,
-2.219992, -0.9610339, -2.726936, 1, 0.08235294, 0, 1,
-2.216671, -2.001263, -2.437306, 1, 0.09019608, 0, 1,
-2.176676, 1.080416, -0.9715415, 1, 0.09411765, 0, 1,
-2.139342, 1.727404, -0.5762405, 1, 0.1019608, 0, 1,
-2.129114, 0.9216615, -0.2493982, 1, 0.1098039, 0, 1,
-2.103669, -1.726329, -3.486606, 1, 0.1137255, 0, 1,
-2.094895, -0.1499383, -3.033512, 1, 0.1215686, 0, 1,
-2.084753, 1.127443, -0.8691249, 1, 0.1254902, 0, 1,
-2.081009, -0.01273891, -1.048075, 1, 0.1333333, 0, 1,
-2.055587, -0.04312129, 0.491574, 1, 0.1372549, 0, 1,
-2.037472, -0.2240712, -1.856395, 1, 0.145098, 0, 1,
-2.016124, -0.6245875, -1.381995, 1, 0.1490196, 0, 1,
-2.015895, -1.734052, -1.725741, 1, 0.1568628, 0, 1,
-2.008776, -1.129518, -3.039252, 1, 0.1607843, 0, 1,
-1.955793, 0.17576, -1.538438, 1, 0.1686275, 0, 1,
-1.949474, 0.3709418, -1.207293, 1, 0.172549, 0, 1,
-1.91231, -0.5348626, -3.652396, 1, 0.1803922, 0, 1,
-1.911802, -0.5240456, -2.517532, 1, 0.1843137, 0, 1,
-1.910935, -0.6712694, 0.2915214, 1, 0.1921569, 0, 1,
-1.891992, -0.2190115, -2.508436, 1, 0.1960784, 0, 1,
-1.860025, 1.372347, -0.1939224, 1, 0.2039216, 0, 1,
-1.8374, -1.220985, -2.402552, 1, 0.2117647, 0, 1,
-1.778053, 0.4037401, -2.456498, 1, 0.2156863, 0, 1,
-1.763259, 0.7724239, -2.221391, 1, 0.2235294, 0, 1,
-1.75974, 0.9573629, -1.319355, 1, 0.227451, 0, 1,
-1.756283, -1.266457, -2.342927, 1, 0.2352941, 0, 1,
-1.733035, 1.080222, -1.555923, 1, 0.2392157, 0, 1,
-1.720449, -1.579647, -1.736762, 1, 0.2470588, 0, 1,
-1.712117, -1.451748, -4.449527, 1, 0.2509804, 0, 1,
-1.711167, -0.2585077, -2.770892, 1, 0.2588235, 0, 1,
-1.696321, -0.007871267, -2.451651, 1, 0.2627451, 0, 1,
-1.689339, -0.7157817, -0.5823286, 1, 0.2705882, 0, 1,
-1.681392, 0.3303081, -2.135339, 1, 0.2745098, 0, 1,
-1.68042, 0.08168773, -1.798587, 1, 0.282353, 0, 1,
-1.676603, 0.07523046, -0.5967957, 1, 0.2862745, 0, 1,
-1.670456, -0.6574727, -2.710383, 1, 0.2941177, 0, 1,
-1.668959, 1.312141, -0.9168006, 1, 0.3019608, 0, 1,
-1.64646, -0.4038014, -2.402479, 1, 0.3058824, 0, 1,
-1.641629, 0.2062425, -2.412262, 1, 0.3137255, 0, 1,
-1.637702, -0.2136888, -1.882533, 1, 0.3176471, 0, 1,
-1.636345, -0.01280013, -0.8708947, 1, 0.3254902, 0, 1,
-1.632766, 0.2273625, -1.229804, 1, 0.3294118, 0, 1,
-1.616201, 0.3160516, -2.15079, 1, 0.3372549, 0, 1,
-1.589201, -0.9193369, -2.308571, 1, 0.3411765, 0, 1,
-1.588198, 0.7661474, -1.017199, 1, 0.3490196, 0, 1,
-1.586414, -0.5488081, -0.3937762, 1, 0.3529412, 0, 1,
-1.577838, 0.7299634, -0.5855038, 1, 0.3607843, 0, 1,
-1.556959, 0.1067576, -2.007661, 1, 0.3647059, 0, 1,
-1.550812, -0.6624372, -2.434009, 1, 0.372549, 0, 1,
-1.542349, 0.3695144, -2.688175, 1, 0.3764706, 0, 1,
-1.540534, 1.840692, -0.8173342, 1, 0.3843137, 0, 1,
-1.530182, 1.412152, -3.014104, 1, 0.3882353, 0, 1,
-1.526047, -2.686049, -3.170939, 1, 0.3960784, 0, 1,
-1.520519, 0.2373846, -2.322651, 1, 0.4039216, 0, 1,
-1.517618, -1.270899, -2.748676, 1, 0.4078431, 0, 1,
-1.496824, -0.3382961, -2.583534, 1, 0.4156863, 0, 1,
-1.480851, 1.436659, 1.420172, 1, 0.4196078, 0, 1,
-1.475818, -0.1495391, -1.338063, 1, 0.427451, 0, 1,
-1.468964, -0.9611827, -2.542732, 1, 0.4313726, 0, 1,
-1.465554, 0.6342717, -1.724457, 1, 0.4392157, 0, 1,
-1.448387, -1.46165, -2.983768, 1, 0.4431373, 0, 1,
-1.447123, -1.496762, -2.123422, 1, 0.4509804, 0, 1,
-1.438173, 0.2499183, -3.082015, 1, 0.454902, 0, 1,
-1.428481, -1.654616, -4.040005, 1, 0.4627451, 0, 1,
-1.425175, 1.139409, -0.6950915, 1, 0.4666667, 0, 1,
-1.419438, 1.21811, -0.2356399, 1, 0.4745098, 0, 1,
-1.401052, 2.032095, -1.264418, 1, 0.4784314, 0, 1,
-1.400416, 0.2476241, -0.8004598, 1, 0.4862745, 0, 1,
-1.398094, -1.221799, -3.381345, 1, 0.4901961, 0, 1,
-1.389013, 0.04757945, -2.731365, 1, 0.4980392, 0, 1,
-1.378863, 1.600315, -2.001833, 1, 0.5058824, 0, 1,
-1.37472, 0.1511352, -0.9784827, 1, 0.509804, 0, 1,
-1.360153, 0.1949496, -2.328504, 1, 0.5176471, 0, 1,
-1.357712, -0.2511852, -1.065619, 1, 0.5215687, 0, 1,
-1.354298, -0.6157776, -1.581746, 1, 0.5294118, 0, 1,
-1.350649, -0.5340459, -1.430086, 1, 0.5333334, 0, 1,
-1.343731, 1.086026, -0.112037, 1, 0.5411765, 0, 1,
-1.334215, -0.9012117, -3.333179, 1, 0.5450981, 0, 1,
-1.329163, -0.8449438, -2.088996, 1, 0.5529412, 0, 1,
-1.32625, 0.5840231, -3.447044, 1, 0.5568628, 0, 1,
-1.32422, -0.06179387, -1.217595, 1, 0.5647059, 0, 1,
-1.310904, -2.114417, -2.514442, 1, 0.5686275, 0, 1,
-1.309305, 1.914219, 1.707878, 1, 0.5764706, 0, 1,
-1.305385, 1.877951, -0.3465768, 1, 0.5803922, 0, 1,
-1.304716, -1.288594, -2.079041, 1, 0.5882353, 0, 1,
-1.292447, -0.2439602, -2.387122, 1, 0.5921569, 0, 1,
-1.287052, 0.01815487, -1.608265, 1, 0.6, 0, 1,
-1.282344, 1.08469, -1.111454, 1, 0.6078432, 0, 1,
-1.280962, 1.03061, 0.1472699, 1, 0.6117647, 0, 1,
-1.278708, 1.173057, -0.6067358, 1, 0.6196079, 0, 1,
-1.27471, -0.0890746, -1.045852, 1, 0.6235294, 0, 1,
-1.270874, -1.759716, -2.406272, 1, 0.6313726, 0, 1,
-1.269223, 0.17906, -2.463881, 1, 0.6352941, 0, 1,
-1.262065, -0.08143427, -3.102956, 1, 0.6431373, 0, 1,
-1.254997, -0.05338418, -1.996577, 1, 0.6470588, 0, 1,
-1.254291, 0.1026055, -0.6937221, 1, 0.654902, 0, 1,
-1.253509, -0.4533648, -2.308956, 1, 0.6588235, 0, 1,
-1.249356, -0.640543, -1.313851, 1, 0.6666667, 0, 1,
-1.247048, -0.4445291, -1.868634, 1, 0.6705883, 0, 1,
-1.239173, 0.4698848, -0.4484713, 1, 0.6784314, 0, 1,
-1.228755, -2.153259, -0.4172399, 1, 0.682353, 0, 1,
-1.227131, -1.538029, -2.463941, 1, 0.6901961, 0, 1,
-1.226343, 1.333321, -2.124388, 1, 0.6941177, 0, 1,
-1.225317, 1.02676, 0.8404675, 1, 0.7019608, 0, 1,
-1.223305, -0.5020692, -0.2895262, 1, 0.7098039, 0, 1,
-1.219594, -1.22876, -2.468357, 1, 0.7137255, 0, 1,
-1.218173, -0.8838392, -2.398372, 1, 0.7215686, 0, 1,
-1.214505, -0.6836206, -1.36783, 1, 0.7254902, 0, 1,
-1.211036, 1.407625, -0.131686, 1, 0.7333333, 0, 1,
-1.207465, 0.7594396, -0.2090971, 1, 0.7372549, 0, 1,
-1.20628, -0.7392077, -3.916925, 1, 0.7450981, 0, 1,
-1.190289, -1.988127, -3.231806, 1, 0.7490196, 0, 1,
-1.187669, -0.2477159, -1.724916, 1, 0.7568628, 0, 1,
-1.185812, 0.6283352, -0.6899462, 1, 0.7607843, 0, 1,
-1.184964, 0.3090779, -1.77545, 1, 0.7686275, 0, 1,
-1.182978, -0.2912786, -2.439412, 1, 0.772549, 0, 1,
-1.176694, -0.9143262, -3.401286, 1, 0.7803922, 0, 1,
-1.169526, -0.2726859, -1.328718, 1, 0.7843137, 0, 1,
-1.164608, 0.1482013, -2.269527, 1, 0.7921569, 0, 1,
-1.162445, 0.1932506, 2.083528, 1, 0.7960784, 0, 1,
-1.160802, 1.389418, -1.442317, 1, 0.8039216, 0, 1,
-1.150764, 1.215098, -0.580615, 1, 0.8117647, 0, 1,
-1.143752, -1.31901, -2.484915, 1, 0.8156863, 0, 1,
-1.140648, 1.06078, -0.6391779, 1, 0.8235294, 0, 1,
-1.138421, 0.2029359, -1.798007, 1, 0.827451, 0, 1,
-1.136977, -0.1646298, -0.6449713, 1, 0.8352941, 0, 1,
-1.134967, 0.02640396, -3.893962, 1, 0.8392157, 0, 1,
-1.133352, -0.9169841, -2.016757, 1, 0.8470588, 0, 1,
-1.13055, 0.3298676, -0.9337253, 1, 0.8509804, 0, 1,
-1.125886, -1.212676, -2.246359, 1, 0.8588235, 0, 1,
-1.120579, -1.023396, -2.5811, 1, 0.8627451, 0, 1,
-1.10682, -1.084544, -4.531459, 1, 0.8705882, 0, 1,
-1.101728, 0.8338805, -2.013819, 1, 0.8745098, 0, 1,
-1.094349, 1.2782, 0.3568327, 1, 0.8823529, 0, 1,
-1.088082, 0.3081988, -1.099191, 1, 0.8862745, 0, 1,
-1.087705, -1.196952, -3.9843, 1, 0.8941177, 0, 1,
-1.078941, 0.4446254, -2.338412, 1, 0.8980392, 0, 1,
-1.076844, -0.633388, -4.825881, 1, 0.9058824, 0, 1,
-1.076156, 0.5564782, -2.783963, 1, 0.9137255, 0, 1,
-1.073725, -0.8012518, -2.276151, 1, 0.9176471, 0, 1,
-1.072305, -0.1149479, -1.552596, 1, 0.9254902, 0, 1,
-1.055497, -1.942461, -2.861208, 1, 0.9294118, 0, 1,
-1.045346, -0.4841529, -1.457142, 1, 0.9372549, 0, 1,
-1.04334, 3.323853, -2.237592, 1, 0.9411765, 0, 1,
-1.039204, 2.527723, -2.157057, 1, 0.9490196, 0, 1,
-1.037315, -0.6695903, -2.53672, 1, 0.9529412, 0, 1,
-1.031394, -0.6769682, -3.479638, 1, 0.9607843, 0, 1,
-1.028661, 0.8076689, 1.090782, 1, 0.9647059, 0, 1,
-1.023445, -0.9826901, -1.896462, 1, 0.972549, 0, 1,
-1.021036, 2.552163, -0.7215391, 1, 0.9764706, 0, 1,
-1.014243, -1.181641, -2.104404, 1, 0.9843137, 0, 1,
-1.014158, -0.124455, 0.5718629, 1, 0.9882353, 0, 1,
-1.010562, -1.369975, -1.49437, 1, 0.9960784, 0, 1,
-1.007406, 1.080037, -2.766692, 0.9960784, 1, 0, 1,
-1.002395, 1.113878, 1.010567, 0.9921569, 1, 0, 1,
-0.9960249, -0.9668394, -2.705863, 0.9843137, 1, 0, 1,
-0.9886094, 1.645226, -0.3260133, 0.9803922, 1, 0, 1,
-0.984194, -0.8074787, -2.987283, 0.972549, 1, 0, 1,
-0.974716, 0.09061015, 0.1068617, 0.9686275, 1, 0, 1,
-0.9706116, 0.7271152, -0.5598329, 0.9607843, 1, 0, 1,
-0.9659016, 0.7041891, 0.9152804, 0.9568627, 1, 0, 1,
-0.964803, -0.9743071, -1.949272, 0.9490196, 1, 0, 1,
-0.9597329, 0.4106249, -1.358696, 0.945098, 1, 0, 1,
-0.9573434, 0.08604632, -1.839091, 0.9372549, 1, 0, 1,
-0.9483425, -0.1797286, -0.2965429, 0.9333333, 1, 0, 1,
-0.9473447, -0.5217195, -0.2487282, 0.9254902, 1, 0, 1,
-0.9466035, -1.620073, -2.996871, 0.9215686, 1, 0, 1,
-0.9447907, 0.8164281, -0.07833825, 0.9137255, 1, 0, 1,
-0.9438511, 1.023221, -0.1390104, 0.9098039, 1, 0, 1,
-0.9206406, 1.256073, 0.06273337, 0.9019608, 1, 0, 1,
-0.9204453, 0.08364554, -1.575729, 0.8941177, 1, 0, 1,
-0.9195988, -0.2958995, -3.016012, 0.8901961, 1, 0, 1,
-0.9111018, -0.008180209, -1.311415, 0.8823529, 1, 0, 1,
-0.9097984, -1.684432, -2.753107, 0.8784314, 1, 0, 1,
-0.9007989, 0.545778, -1.625879, 0.8705882, 1, 0, 1,
-0.8933765, -0.9812751, -1.038846, 0.8666667, 1, 0, 1,
-0.8907924, 0.1974158, -3.218595, 0.8588235, 1, 0, 1,
-0.8905547, 0.514715, -0.6077169, 0.854902, 1, 0, 1,
-0.8836447, -0.7753622, -3.641222, 0.8470588, 1, 0, 1,
-0.8814787, -1.504259, -3.1345, 0.8431373, 1, 0, 1,
-0.8781483, -0.8785281, -2.582606, 0.8352941, 1, 0, 1,
-0.8757358, 0.7650278, -1.024047, 0.8313726, 1, 0, 1,
-0.8756105, -0.4106652, -1.419559, 0.8235294, 1, 0, 1,
-0.8745248, -0.7457637, -0.5495318, 0.8196079, 1, 0, 1,
-0.8666229, 1.534236, -0.46627, 0.8117647, 1, 0, 1,
-0.8644234, -0.2224772, -1.226325, 0.8078431, 1, 0, 1,
-0.8609574, 0.2816793, -2.384158, 0.8, 1, 0, 1,
-0.8546077, -0.2917646, -2.038647, 0.7921569, 1, 0, 1,
-0.8541977, -1.266424, -5.155698, 0.7882353, 1, 0, 1,
-0.8523673, 0.9755015, -1.330018, 0.7803922, 1, 0, 1,
-0.8504878, -1.913521, -3.714082, 0.7764706, 1, 0, 1,
-0.8426186, 0.3755672, -1.239919, 0.7686275, 1, 0, 1,
-0.8300827, -1.720989, -3.636068, 0.7647059, 1, 0, 1,
-0.8279939, -0.1942906, -2.478825, 0.7568628, 1, 0, 1,
-0.8195925, -1.159046, -3.393896, 0.7529412, 1, 0, 1,
-0.8153214, 0.2814755, 0.1080737, 0.7450981, 1, 0, 1,
-0.8138099, -0.0987692, -2.43809, 0.7411765, 1, 0, 1,
-0.8074378, -0.9621875, -2.733268, 0.7333333, 1, 0, 1,
-0.8043698, 0.5510256, 0.5988244, 0.7294118, 1, 0, 1,
-0.8027555, 0.02644188, -2.584599, 0.7215686, 1, 0, 1,
-0.8003916, 0.3999669, -0.5150692, 0.7176471, 1, 0, 1,
-0.8002158, -0.3315783, -3.384769, 0.7098039, 1, 0, 1,
-0.7988204, -0.3070045, -3.002372, 0.7058824, 1, 0, 1,
-0.7963979, -0.6928228, -2.934114, 0.6980392, 1, 0, 1,
-0.7958669, -0.4765426, -2.473166, 0.6901961, 1, 0, 1,
-0.7903258, -0.09137826, -1.024199, 0.6862745, 1, 0, 1,
-0.7871733, 0.8160816, 0.04504899, 0.6784314, 1, 0, 1,
-0.7771332, 0.006065363, -0.2354617, 0.6745098, 1, 0, 1,
-0.7767069, -0.5550835, -1.901789, 0.6666667, 1, 0, 1,
-0.7753058, 0.2446347, -1.424173, 0.6627451, 1, 0, 1,
-0.7751659, 0.6773547, 0.3180788, 0.654902, 1, 0, 1,
-0.7715539, -0.3059024, -1.363194, 0.6509804, 1, 0, 1,
-0.7690756, 0.6284869, -0.4296419, 0.6431373, 1, 0, 1,
-0.768131, -0.967043, -0.9519004, 0.6392157, 1, 0, 1,
-0.7652943, 0.4180576, -0.2289024, 0.6313726, 1, 0, 1,
-0.7650717, -0.2375673, -1.137436, 0.627451, 1, 0, 1,
-0.7633833, 1.687044, 0.0497035, 0.6196079, 1, 0, 1,
-0.7488361, 0.4824697, -2.531861, 0.6156863, 1, 0, 1,
-0.7482781, -0.9463927, -2.272602, 0.6078432, 1, 0, 1,
-0.7449257, 0.9606858, 0.6040121, 0.6039216, 1, 0, 1,
-0.7404813, 0.3916385, -0.06606483, 0.5960785, 1, 0, 1,
-0.7394382, 1.193031, 0.2735706, 0.5882353, 1, 0, 1,
-0.737781, 1.499452, 0.6916872, 0.5843138, 1, 0, 1,
-0.7251039, -0.248777, -1.911257, 0.5764706, 1, 0, 1,
-0.720354, -0.8263733, -3.899779, 0.572549, 1, 0, 1,
-0.7199755, -0.05644099, -3.16255, 0.5647059, 1, 0, 1,
-0.7176939, 0.4129613, -0.1670362, 0.5607843, 1, 0, 1,
-0.7097203, 1.446974, -1.315423, 0.5529412, 1, 0, 1,
-0.7076376, 1.733098, -2.105811, 0.5490196, 1, 0, 1,
-0.7073976, 0.3212387, -1.833127, 0.5411765, 1, 0, 1,
-0.7045149, 0.6086454, -1.480932, 0.5372549, 1, 0, 1,
-0.6994428, 1.991382, 0.2934354, 0.5294118, 1, 0, 1,
-0.6976391, 0.6593682, -1.036412, 0.5254902, 1, 0, 1,
-0.6970491, -0.4972416, -0.08228156, 0.5176471, 1, 0, 1,
-0.696501, -1.997467, -2.924386, 0.5137255, 1, 0, 1,
-0.6923041, 0.01411933, -1.594984, 0.5058824, 1, 0, 1,
-0.6910629, -0.7166122, -1.007651, 0.5019608, 1, 0, 1,
-0.6906173, 0.4387977, -0.3846394, 0.4941176, 1, 0, 1,
-0.6829225, -0.411671, -5.300092, 0.4862745, 1, 0, 1,
-0.6804357, -1.902492, -3.605198, 0.4823529, 1, 0, 1,
-0.6724115, 0.3738928, -2.051008, 0.4745098, 1, 0, 1,
-0.670553, 0.3175139, -2.63132, 0.4705882, 1, 0, 1,
-0.6705415, -0.7597201, -3.035329, 0.4627451, 1, 0, 1,
-0.6623939, 1.819359, -0.4865784, 0.4588235, 1, 0, 1,
-0.6622698, 0.395166, -0.7790891, 0.4509804, 1, 0, 1,
-0.6603763, 0.2127057, 1.139542, 0.4470588, 1, 0, 1,
-0.6592416, 1.264638, 3.35083, 0.4392157, 1, 0, 1,
-0.6569003, 1.041531, -0.949372, 0.4352941, 1, 0, 1,
-0.6523808, 1.007383, -1.080724, 0.427451, 1, 0, 1,
-0.6522189, 1.82647, 0.9233367, 0.4235294, 1, 0, 1,
-0.6511952, 0.8799869, 0.287706, 0.4156863, 1, 0, 1,
-0.6493865, -0.4762349, -3.245359, 0.4117647, 1, 0, 1,
-0.64455, -0.622292, -3.749293, 0.4039216, 1, 0, 1,
-0.63863, -0.4667602, -2.738831, 0.3960784, 1, 0, 1,
-0.6379017, -0.8535544, -1.737799, 0.3921569, 1, 0, 1,
-0.6327857, 0.9034847, -1.377234, 0.3843137, 1, 0, 1,
-0.6289321, 1.39255, 0.0540996, 0.3803922, 1, 0, 1,
-0.6281623, -1.121741, -2.097039, 0.372549, 1, 0, 1,
-0.6277968, -0.5540385, -2.6429, 0.3686275, 1, 0, 1,
-0.6267945, 1.456878, -0.9069211, 0.3607843, 1, 0, 1,
-0.6219141, -1.566606, -0.3228154, 0.3568628, 1, 0, 1,
-0.6217296, -0.7599875, -1.781815, 0.3490196, 1, 0, 1,
-0.6196409, -0.2735642, 0.03541038, 0.345098, 1, 0, 1,
-0.6161198, 1.108955, -0.396385, 0.3372549, 1, 0, 1,
-0.6134348, -0.6428531, -0.7857389, 0.3333333, 1, 0, 1,
-0.6129706, 1.798492, -0.3397723, 0.3254902, 1, 0, 1,
-0.61098, -0.3324762, -1.712784, 0.3215686, 1, 0, 1,
-0.6105934, 1.009434, -0.4594356, 0.3137255, 1, 0, 1,
-0.6092755, 0.6951891, -0.6677469, 0.3098039, 1, 0, 1,
-0.6087112, -1.360002, -1.055811, 0.3019608, 1, 0, 1,
-0.6042249, -0.2313105, -2.08222, 0.2941177, 1, 0, 1,
-0.5997966, -0.4263636, -2.995398, 0.2901961, 1, 0, 1,
-0.5982737, -0.2169828, -2.242251, 0.282353, 1, 0, 1,
-0.5968975, -1.43899, -3.329919, 0.2784314, 1, 0, 1,
-0.5938084, 2.418427, -0.4827003, 0.2705882, 1, 0, 1,
-0.586926, -1.242507, -1.579593, 0.2666667, 1, 0, 1,
-0.5845156, 1.2562, 0.04946852, 0.2588235, 1, 0, 1,
-0.5837724, -0.1587428, -1.615389, 0.254902, 1, 0, 1,
-0.5797806, -1.090083, -1.235169, 0.2470588, 1, 0, 1,
-0.5768851, 0.04103743, -1.382168, 0.2431373, 1, 0, 1,
-0.572171, 0.3124938, -3.299313, 0.2352941, 1, 0, 1,
-0.5716339, 0.4776902, -1.790854, 0.2313726, 1, 0, 1,
-0.5660965, -0.9774681, -2.481079, 0.2235294, 1, 0, 1,
-0.5659087, 0.00994813, -1.796074, 0.2196078, 1, 0, 1,
-0.5624487, 0.3791054, -0.4083838, 0.2117647, 1, 0, 1,
-0.5576824, 1.532517, -0.5008927, 0.2078431, 1, 0, 1,
-0.5503986, -0.3622749, -2.109122, 0.2, 1, 0, 1,
-0.5502381, 0.01317243, -2.063738, 0.1921569, 1, 0, 1,
-0.5448995, -2.039729, -4.563308, 0.1882353, 1, 0, 1,
-0.5376993, 0.7285132, -2.29062, 0.1803922, 1, 0, 1,
-0.5372519, 0.2221604, -2.305576, 0.1764706, 1, 0, 1,
-0.5362834, 1.183036, -0.8998359, 0.1686275, 1, 0, 1,
-0.5235379, -1.565878, -2.755736, 0.1647059, 1, 0, 1,
-0.5154031, -0.06189199, -2.503778, 0.1568628, 1, 0, 1,
-0.512917, -0.9025396, -4.270092, 0.1529412, 1, 0, 1,
-0.51256, -0.2920876, -2.131354, 0.145098, 1, 0, 1,
-0.5093433, -0.6299319, -0.5266729, 0.1411765, 1, 0, 1,
-0.505984, 0.8460261, -0.7296755, 0.1333333, 1, 0, 1,
-0.5053205, 1.102797, -1.584478, 0.1294118, 1, 0, 1,
-0.5034795, 0.6453431, -1.518298, 0.1215686, 1, 0, 1,
-0.5003377, -0.4306831, -1.376333, 0.1176471, 1, 0, 1,
-0.4994618, 0.7953958, 0.1034401, 0.1098039, 1, 0, 1,
-0.4992115, 0.9930014, -1.775295, 0.1058824, 1, 0, 1,
-0.4976387, -0.4314958, -3.737378, 0.09803922, 1, 0, 1,
-0.4880737, 0.1820071, -1.550888, 0.09019608, 1, 0, 1,
-0.4877271, -0.7028828, -3.162719, 0.08627451, 1, 0, 1,
-0.4873727, -0.4946558, -3.867892, 0.07843138, 1, 0, 1,
-0.4839421, 0.9763464, -2.277314, 0.07450981, 1, 0, 1,
-0.4816481, 0.5391444, 0.1680318, 0.06666667, 1, 0, 1,
-0.4670682, -1.090854, -2.027851, 0.0627451, 1, 0, 1,
-0.4629044, 0.04293797, -0.6696175, 0.05490196, 1, 0, 1,
-0.4628303, -1.185436, -4.058399, 0.05098039, 1, 0, 1,
-0.460363, 0.8992474, -0.2870376, 0.04313726, 1, 0, 1,
-0.4598062, -0.6598302, -3.173208, 0.03921569, 1, 0, 1,
-0.4587159, 0.3184457, -1.130959, 0.03137255, 1, 0, 1,
-0.4551608, -1.051718, -2.550508, 0.02745098, 1, 0, 1,
-0.4517791, 0.4742501, -0.1385393, 0.01960784, 1, 0, 1,
-0.4502945, 1.539385, -0.9989824, 0.01568628, 1, 0, 1,
-0.4481767, -1.463958, -1.830688, 0.007843138, 1, 0, 1,
-0.448039, 0.9991217, -0.9497424, 0.003921569, 1, 0, 1,
-0.4467007, 1.471328, -1.203739, 0, 1, 0.003921569, 1,
-0.4438638, -0.1016138, -1.580178, 0, 1, 0.01176471, 1,
-0.4413515, 2.179521, -1.194937, 0, 1, 0.01568628, 1,
-0.4396545, -0.1511549, -1.364612, 0, 1, 0.02352941, 1,
-0.4382966, 0.5398814, -0.8647631, 0, 1, 0.02745098, 1,
-0.4370179, -0.7645323, -2.598426, 0, 1, 0.03529412, 1,
-0.4339203, 2.198776, 0.2638759, 0, 1, 0.03921569, 1,
-0.4333952, 0.7575831, 0.1538735, 0, 1, 0.04705882, 1,
-0.4330533, -1.006237, -5.113575, 0, 1, 0.05098039, 1,
-0.4314729, 0.7855274, 0.8363838, 0, 1, 0.05882353, 1,
-0.4311574, 1.152869, -0.4647092, 0, 1, 0.0627451, 1,
-0.42646, -1.454189, -3.23259, 0, 1, 0.07058824, 1,
-0.4248176, -1.377776, -2.869523, 0, 1, 0.07450981, 1,
-0.4234311, -1.878948, -3.638306, 0, 1, 0.08235294, 1,
-0.4232932, 0.4364926, -2.598873, 0, 1, 0.08627451, 1,
-0.4230024, 0.242254, -0.3512042, 0, 1, 0.09411765, 1,
-0.4225455, 0.1410699, -1.189229, 0, 1, 0.1019608, 1,
-0.422062, -1.063346, -3.408818, 0, 1, 0.1058824, 1,
-0.4215734, -0.1121493, -1.58803, 0, 1, 0.1137255, 1,
-0.4206451, -0.04083573, -0.9847189, 0, 1, 0.1176471, 1,
-0.4194848, 0.4472135, -0.4817117, 0, 1, 0.1254902, 1,
-0.4190421, -1.599706, -3.309622, 0, 1, 0.1294118, 1,
-0.4151458, -0.8257031, -2.785117, 0, 1, 0.1372549, 1,
-0.4132851, 0.3493565, 1.053247, 0, 1, 0.1411765, 1,
-0.4092372, 0.6160551, -1.107822, 0, 1, 0.1490196, 1,
-0.4083566, 1.124931, -0.2615741, 0, 1, 0.1529412, 1,
-0.4080772, 0.0110116, -0.5298672, 0, 1, 0.1607843, 1,
-0.4054068, 0.8446832, 0.2880377, 0, 1, 0.1647059, 1,
-0.3935627, -1.168661, -2.126029, 0, 1, 0.172549, 1,
-0.3909153, 0.466554, -0.6364816, 0, 1, 0.1764706, 1,
-0.3902672, 0.2115629, -1.079571, 0, 1, 0.1843137, 1,
-0.3849618, 1.331806, -1.990837, 0, 1, 0.1882353, 1,
-0.3837087, -1.053622, -2.617826, 0, 1, 0.1960784, 1,
-0.3833161, 1.935936, -0.349704, 0, 1, 0.2039216, 1,
-0.3707695, -0.9522032, -3.732816, 0, 1, 0.2078431, 1,
-0.3635556, 1.224351, 0.9543002, 0, 1, 0.2156863, 1,
-0.3613868, -0.3630669, -2.600969, 0, 1, 0.2196078, 1,
-0.3582942, 0.8221739, -0.9515128, 0, 1, 0.227451, 1,
-0.3484271, 2.439596, 0.07239363, 0, 1, 0.2313726, 1,
-0.3475727, -0.2442701, -3.010889, 0, 1, 0.2392157, 1,
-0.3470507, -0.841031, -2.207443, 0, 1, 0.2431373, 1,
-0.3439858, 1.200098, -1.745734, 0, 1, 0.2509804, 1,
-0.3420911, -0.8383928, -2.947575, 0, 1, 0.254902, 1,
-0.3375036, 0.5746457, -0.8168558, 0, 1, 0.2627451, 1,
-0.3330886, 1.345311, -1.719015, 0, 1, 0.2666667, 1,
-0.3313299, 1.111905, -0.1798965, 0, 1, 0.2745098, 1,
-0.3305374, -0.1688449, -4.154926, 0, 1, 0.2784314, 1,
-0.3288499, 1.026791, 0.7092348, 0, 1, 0.2862745, 1,
-0.3282559, -0.04044987, -1.398741, 0, 1, 0.2901961, 1,
-0.3267747, 0.3101697, -2.492376, 0, 1, 0.2980392, 1,
-0.3251174, 1.212409, -0.4146347, 0, 1, 0.3058824, 1,
-0.3239989, -0.4733786, -1.511911, 0, 1, 0.3098039, 1,
-0.3207628, 0.1818436, -1.434519, 0, 1, 0.3176471, 1,
-0.3164266, 0.6822159, -1.311967, 0, 1, 0.3215686, 1,
-0.3151877, 0.3447083, -1.437682, 0, 1, 0.3294118, 1,
-0.313632, 0.2659875, -1.591356, 0, 1, 0.3333333, 1,
-0.3125767, 0.9665043, -1.55003, 0, 1, 0.3411765, 1,
-0.3118618, -1.301912, -0.9582429, 0, 1, 0.345098, 1,
-0.3077943, -0.9675553, -2.43016, 0, 1, 0.3529412, 1,
-0.3053819, 0.3393821, -0.7402508, 0, 1, 0.3568628, 1,
-0.3040756, 2.370599, 0.8570187, 0, 1, 0.3647059, 1,
-0.3026791, -0.8557013, -2.635013, 0, 1, 0.3686275, 1,
-0.3017626, -0.2290517, -3.750902, 0, 1, 0.3764706, 1,
-0.297756, -0.7331944, -3.540412, 0, 1, 0.3803922, 1,
-0.2969684, -0.5819622, -3.331473, 0, 1, 0.3882353, 1,
-0.2836108, -0.511124, -3.042721, 0, 1, 0.3921569, 1,
-0.2835271, 1.098624, -0.2728663, 0, 1, 0.4, 1,
-0.282012, 0.7087249, -0.07828657, 0, 1, 0.4078431, 1,
-0.272995, 1.303464, -0.737828, 0, 1, 0.4117647, 1,
-0.2715518, 0.2433399, -0.7783629, 0, 1, 0.4196078, 1,
-0.2710839, -0.3489878, -3.077742, 0, 1, 0.4235294, 1,
-0.271054, 0.09594108, -1.184387, 0, 1, 0.4313726, 1,
-0.2707324, 0.5176364, -0.06506863, 0, 1, 0.4352941, 1,
-0.2681637, -0.8232111, -3.027499, 0, 1, 0.4431373, 1,
-0.2644378, 0.5429479, -0.896861, 0, 1, 0.4470588, 1,
-0.259767, 0.590691, -0.6561965, 0, 1, 0.454902, 1,
-0.2589959, -0.6282182, -2.469817, 0, 1, 0.4588235, 1,
-0.2545898, -0.05656809, -1.592812, 0, 1, 0.4666667, 1,
-0.249145, -0.1184142, -0.3080296, 0, 1, 0.4705882, 1,
-0.2474772, -0.8281746, -3.216192, 0, 1, 0.4784314, 1,
-0.2463725, 0.8453193, -1.579237, 0, 1, 0.4823529, 1,
-0.2430975, -0.4940107, -2.982859, 0, 1, 0.4901961, 1,
-0.2428402, 1.066109, -0.3794667, 0, 1, 0.4941176, 1,
-0.240553, -0.4230118, -2.51709, 0, 1, 0.5019608, 1,
-0.2384612, 0.8220975, -0.08596222, 0, 1, 0.509804, 1,
-0.2336408, -1.757239, -2.658236, 0, 1, 0.5137255, 1,
-0.2295498, 0.3884552, -1.413032, 0, 1, 0.5215687, 1,
-0.2238482, -0.9577794, -2.939291, 0, 1, 0.5254902, 1,
-0.2226446, 0.7611057, 0.8007041, 0, 1, 0.5333334, 1,
-0.218552, -1.226943, -2.244296, 0, 1, 0.5372549, 1,
-0.2182824, 0.977339, -0.2176645, 0, 1, 0.5450981, 1,
-0.2179245, 1.574777, -0.01244113, 0, 1, 0.5490196, 1,
-0.217881, -1.285908, -2.574909, 0, 1, 0.5568628, 1,
-0.2176621, -2.361945, -2.609673, 0, 1, 0.5607843, 1,
-0.2150304, -1.002169, -1.849454, 0, 1, 0.5686275, 1,
-0.2136121, 1.422436, 2.227284, 0, 1, 0.572549, 1,
-0.2133898, -0.7789947, -2.803571, 0, 1, 0.5803922, 1,
-0.2132355, -0.6389254, -3.788468, 0, 1, 0.5843138, 1,
-0.2050106, -0.2037135, -1.097396, 0, 1, 0.5921569, 1,
-0.2025227, -0.2067858, -1.529799, 0, 1, 0.5960785, 1,
-0.2017644, 1.116779, -0.8628914, 0, 1, 0.6039216, 1,
-0.2009991, -1.760422, -0.7825255, 0, 1, 0.6117647, 1,
-0.2007651, 0.1654076, -3.907653, 0, 1, 0.6156863, 1,
-0.1959746, -0.9186851, -3.297685, 0, 1, 0.6235294, 1,
-0.1930635, -0.3153533, -2.42394, 0, 1, 0.627451, 1,
-0.1920119, -0.5199884, -2.998041, 0, 1, 0.6352941, 1,
-0.1906128, -1.289947, -2.731874, 0, 1, 0.6392157, 1,
-0.1894367, -0.5185615, -1.131207, 0, 1, 0.6470588, 1,
-0.1879371, -0.2214445, -3.961484, 0, 1, 0.6509804, 1,
-0.1833843, -0.7294929, -1.489617, 0, 1, 0.6588235, 1,
-0.1825569, 1.401492, 0.06308079, 0, 1, 0.6627451, 1,
-0.1816965, -0.2413317, -3.659595, 0, 1, 0.6705883, 1,
-0.1806125, 2.017012, -0.04477732, 0, 1, 0.6745098, 1,
-0.1789226, -0.1160085, -0.9398382, 0, 1, 0.682353, 1,
-0.175405, -0.6707277, -2.424651, 0, 1, 0.6862745, 1,
-0.1731671, -1.396655, -2.190466, 0, 1, 0.6941177, 1,
-0.1700314, -1.40588, -1.279305, 0, 1, 0.7019608, 1,
-0.1695218, -0.4489553, -3.982073, 0, 1, 0.7058824, 1,
-0.1657781, -0.005794811, 0.2449664, 0, 1, 0.7137255, 1,
-0.1652565, -0.5440118, -1.376469, 0, 1, 0.7176471, 1,
-0.1606473, 2.267298, -0.4502938, 0, 1, 0.7254902, 1,
-0.1584442, 0.1929279, -0.7462599, 0, 1, 0.7294118, 1,
-0.1575664, 1.224522, -0.3723975, 0, 1, 0.7372549, 1,
-0.1558264, -1.073212, -2.070702, 0, 1, 0.7411765, 1,
-0.1516711, -1.269237, -3.004194, 0, 1, 0.7490196, 1,
-0.1501224, 2.180223, -1.016962, 0, 1, 0.7529412, 1,
-0.1465604, 0.5132096, 1.413448, 0, 1, 0.7607843, 1,
-0.1461258, 0.9490622, -0.7128952, 0, 1, 0.7647059, 1,
-0.141194, -0.1554715, -2.325871, 0, 1, 0.772549, 1,
-0.1338246, 1.316941, -0.230536, 0, 1, 0.7764706, 1,
-0.1329707, -0.1939239, -0.7751887, 0, 1, 0.7843137, 1,
-0.1326667, -0.1801073, -1.042559, 0, 1, 0.7882353, 1,
-0.1310014, 0.8182151, -0.6316779, 0, 1, 0.7960784, 1,
-0.1289293, -0.7100382, -1.223019, 0, 1, 0.8039216, 1,
-0.1239501, -0.709233, -2.741501, 0, 1, 0.8078431, 1,
-0.1162046, -1.063207, -4.27768, 0, 1, 0.8156863, 1,
-0.113948, 1.515013, 0.2484903, 0, 1, 0.8196079, 1,
-0.1138424, 1.050951, -0.2776837, 0, 1, 0.827451, 1,
-0.1096867, -2.111163, -4.140103, 0, 1, 0.8313726, 1,
-0.1086934, 1.688604, -0.4022208, 0, 1, 0.8392157, 1,
-0.108586, -0.2379532, -2.304178, 0, 1, 0.8431373, 1,
-0.1078448, 0.1149426, -0.6113782, 0, 1, 0.8509804, 1,
-0.1076325, -0.9290929, -4.981161, 0, 1, 0.854902, 1,
-0.1074172, 0.1847412, 1.778239, 0, 1, 0.8627451, 1,
-0.1006532, -0.5103841, -3.292877, 0, 1, 0.8666667, 1,
-0.09848259, 0.3371517, 1.876894, 0, 1, 0.8745098, 1,
-0.07022372, -0.3263607, -3.132286, 0, 1, 0.8784314, 1,
-0.06878423, 0.4982238, 0.1072952, 0, 1, 0.8862745, 1,
-0.06498691, 0.6282782, -0.4569855, 0, 1, 0.8901961, 1,
-0.06328638, 0.9729658, 1.47238, 0, 1, 0.8980392, 1,
-0.0612381, -0.7800551, -2.198284, 0, 1, 0.9058824, 1,
-0.06048979, -0.905697, -3.348481, 0, 1, 0.9098039, 1,
-0.05979535, -0.7970977, -3.035658, 0, 1, 0.9176471, 1,
-0.05777974, 0.06922185, -1.175835, 0, 1, 0.9215686, 1,
-0.05633317, -0.3978105, -3.621648, 0, 1, 0.9294118, 1,
-0.05620669, 0.09181406, -0.3343076, 0, 1, 0.9333333, 1,
-0.05615708, 0.4682371, 1.279703, 0, 1, 0.9411765, 1,
-0.05414978, 2.124086, -1.153692, 0, 1, 0.945098, 1,
-0.05398419, -0.5986822, -2.781891, 0, 1, 0.9529412, 1,
-0.05107958, -0.2532152, -1.388155, 0, 1, 0.9568627, 1,
-0.03227586, -0.1124144, -2.127322, 0, 1, 0.9647059, 1,
-0.03224649, 0.9697962, 0.5740177, 0, 1, 0.9686275, 1,
-0.02033293, 0.1084403, 1.000483, 0, 1, 0.9764706, 1,
-0.01276444, -0.3877872, -2.579225, 0, 1, 0.9803922, 1,
-0.01183594, 0.3021248, 1.370989, 0, 1, 0.9882353, 1,
-0.01149462, -1.227432, -4.247674, 0, 1, 0.9921569, 1,
-0.01028082, -0.2034093, -1.386943, 0, 1, 1, 1,
-0.009113946, -0.9297677, -2.033164, 0, 0.9921569, 1, 1,
-0.003245117, 2.784183, -0.1458302, 0, 0.9882353, 1, 1,
0.0009637516, 0.8427321, -0.6970255, 0, 0.9803922, 1, 1,
0.004737122, -0.6450474, 2.449849, 0, 0.9764706, 1, 1,
0.006038013, 0.6765708, 0.9817706, 0, 0.9686275, 1, 1,
0.006143789, -0.2675636, 3.760749, 0, 0.9647059, 1, 1,
0.007336978, 1.26097, -0.7544933, 0, 0.9568627, 1, 1,
0.00880149, 1.513847, 1.069099, 0, 0.9529412, 1, 1,
0.01187428, -1.872766, 3.143382, 0, 0.945098, 1, 1,
0.01559314, 0.6210008, -1.148031, 0, 0.9411765, 1, 1,
0.01571568, 1.458475, 0.5639462, 0, 0.9333333, 1, 1,
0.01783356, 0.6055497, 1.035545, 0, 0.9294118, 1, 1,
0.01831762, -0.5682018, 2.321742, 0, 0.9215686, 1, 1,
0.0243469, -1.148874, 2.364495, 0, 0.9176471, 1, 1,
0.02626041, 0.6624653, 1.166189, 0, 0.9098039, 1, 1,
0.02741234, 0.09965616, -0.1434844, 0, 0.9058824, 1, 1,
0.03207384, 0.5849072, -0.990114, 0, 0.8980392, 1, 1,
0.03232696, -1.903693, 3.031304, 0, 0.8901961, 1, 1,
0.03251098, -0.7876887, 3.286667, 0, 0.8862745, 1, 1,
0.032741, -0.4477549, 4.925442, 0, 0.8784314, 1, 1,
0.033335, -0.6215864, 3.175654, 0, 0.8745098, 1, 1,
0.03505525, 0.02196137, 0.1482429, 0, 0.8666667, 1, 1,
0.04049299, -2.297204, 3.242689, 0, 0.8627451, 1, 1,
0.04058938, 0.2405324, 1.778291, 0, 0.854902, 1, 1,
0.04304455, -0.4393139, 3.804599, 0, 0.8509804, 1, 1,
0.0439337, 0.6870665, 1.616006, 0, 0.8431373, 1, 1,
0.05001973, 1.083098, 1.16632, 0, 0.8392157, 1, 1,
0.05137254, -1.311769, 1.928373, 0, 0.8313726, 1, 1,
0.05275092, 2.123957, -0.6329849, 0, 0.827451, 1, 1,
0.05625356, 1.218002, 1.555813, 0, 0.8196079, 1, 1,
0.05811539, -0.1710933, 2.624083, 0, 0.8156863, 1, 1,
0.05876542, -1.01902, 3.871826, 0, 0.8078431, 1, 1,
0.06052515, -0.5293286, 2.667621, 0, 0.8039216, 1, 1,
0.0608259, 1.449647, -1.014663, 0, 0.7960784, 1, 1,
0.06319156, -1.785713, 2.203924, 0, 0.7882353, 1, 1,
0.06380238, -0.9645652, 2.707339, 0, 0.7843137, 1, 1,
0.06555955, -0.804029, 2.746717, 0, 0.7764706, 1, 1,
0.07126512, 1.116392, -1.305788, 0, 0.772549, 1, 1,
0.07129773, 0.3598667, -0.6538974, 0, 0.7647059, 1, 1,
0.07416454, -0.3617696, 3.372064, 0, 0.7607843, 1, 1,
0.07678944, -0.2153577, 2.375679, 0, 0.7529412, 1, 1,
0.08119407, 0.4503921, -0.7304021, 0, 0.7490196, 1, 1,
0.08143481, -1.649498, 2.863035, 0, 0.7411765, 1, 1,
0.08306907, -1.561723, 2.170698, 0, 0.7372549, 1, 1,
0.08352137, -1.018086, 2.02499, 0, 0.7294118, 1, 1,
0.08410712, 1.152917, 0.226125, 0, 0.7254902, 1, 1,
0.0853677, -0.748324, 4.485144, 0, 0.7176471, 1, 1,
0.08749188, 0.1726555, -0.03343023, 0, 0.7137255, 1, 1,
0.08899309, -0.8134722, 3.880136, 0, 0.7058824, 1, 1,
0.09164611, -0.08105429, 2.949529, 0, 0.6980392, 1, 1,
0.09184024, 0.3518179, 1.119464, 0, 0.6941177, 1, 1,
0.09230358, -0.9166154, 1.990945, 0, 0.6862745, 1, 1,
0.09401216, -2.65741, 2.562751, 0, 0.682353, 1, 1,
0.09883911, -0.8808064, 4.579713, 0, 0.6745098, 1, 1,
0.1048793, 0.9761388, -0.9601526, 0, 0.6705883, 1, 1,
0.1111945, -0.3854024, 3.431276, 0, 0.6627451, 1, 1,
0.1133754, 0.7164016, -1.167778, 0, 0.6588235, 1, 1,
0.1134585, -0.1172731, 4.275806, 0, 0.6509804, 1, 1,
0.1137305, -0.175539, 2.534409, 0, 0.6470588, 1, 1,
0.1143843, 0.7268916, -0.3900406, 0, 0.6392157, 1, 1,
0.1152497, 0.4165135, -0.6802158, 0, 0.6352941, 1, 1,
0.118576, 1.758848, -0.8793084, 0, 0.627451, 1, 1,
0.1212932, -1.022025, 3.523961, 0, 0.6235294, 1, 1,
0.121811, -0.1716231, 1.643007, 0, 0.6156863, 1, 1,
0.122406, 0.5035906, 0.0679423, 0, 0.6117647, 1, 1,
0.122693, 0.2827234, 1.342873, 0, 0.6039216, 1, 1,
0.122847, -1.331123, 1.212643, 0, 0.5960785, 1, 1,
0.1240594, 0.5632487, -1.272997, 0, 0.5921569, 1, 1,
0.1254492, -0.152326, 2.245658, 0, 0.5843138, 1, 1,
0.1288111, 1.851983, 0.9990656, 0, 0.5803922, 1, 1,
0.1302817, -0.04833513, 2.047842, 0, 0.572549, 1, 1,
0.13312, 1.542872, 1.289491, 0, 0.5686275, 1, 1,
0.134156, 0.8786266, -0.6742939, 0, 0.5607843, 1, 1,
0.1352414, -1.105853, 2.043397, 0, 0.5568628, 1, 1,
0.1391581, -1.390813, 3.603455, 0, 0.5490196, 1, 1,
0.1391654, 1.513789, 1.307966, 0, 0.5450981, 1, 1,
0.1417514, -0.1306096, 2.067702, 0, 0.5372549, 1, 1,
0.1469004, 1.266794, 1.268129, 0, 0.5333334, 1, 1,
0.1543332, 1.959434, 1.69197, 0, 0.5254902, 1, 1,
0.1544276, 1.145658, 0.9710864, 0, 0.5215687, 1, 1,
0.1572439, -0.4520186, 2.731862, 0, 0.5137255, 1, 1,
0.1595143, -1.149046, 3.244018, 0, 0.509804, 1, 1,
0.1609646, 1.064097, -1.25778, 0, 0.5019608, 1, 1,
0.1686001, 0.4509632, 0.982243, 0, 0.4941176, 1, 1,
0.1696922, 0.5824801, 0.3843667, 0, 0.4901961, 1, 1,
0.170656, -0.172324, 3.77337, 0, 0.4823529, 1, 1,
0.1715318, 2.719055, 2.053779, 0, 0.4784314, 1, 1,
0.1744547, -0.2439828, 3.744131, 0, 0.4705882, 1, 1,
0.1785372, -2.022098, 5.539467, 0, 0.4666667, 1, 1,
0.1851386, -1.719078, 5.287033, 0, 0.4588235, 1, 1,
0.1852462, 1.445835, 1.174311, 0, 0.454902, 1, 1,
0.1891344, -0.5280305, 2.915956, 0, 0.4470588, 1, 1,
0.1928051, -0.07074512, 1.118507, 0, 0.4431373, 1, 1,
0.1947562, 0.2679601, 1.723889, 0, 0.4352941, 1, 1,
0.1965172, 0.9476923, -0.8696814, 0, 0.4313726, 1, 1,
0.2001447, -0.06142852, 1.548169, 0, 0.4235294, 1, 1,
0.2006564, -1.269627, 4.376647, 0, 0.4196078, 1, 1,
0.2017081, 0.6938879, -0.009496101, 0, 0.4117647, 1, 1,
0.2022275, -0.3891443, 4.672252, 0, 0.4078431, 1, 1,
0.2046872, 1.960439, 0.5901065, 0, 0.4, 1, 1,
0.2062517, 0.3541059, 1.332688, 0, 0.3921569, 1, 1,
0.2112861, -0.8201516, 1.877277, 0, 0.3882353, 1, 1,
0.2121734, 1.048928, 1.087786, 0, 0.3803922, 1, 1,
0.214339, -0.2010266, 1.194035, 0, 0.3764706, 1, 1,
0.2143941, -0.5833421, 4.552166, 0, 0.3686275, 1, 1,
0.2169901, 1.51663, -0.5512577, 0, 0.3647059, 1, 1,
0.2230257, 0.5174469, -0.4904935, 0, 0.3568628, 1, 1,
0.2233456, 0.6925521, 0.1359678, 0, 0.3529412, 1, 1,
0.2261112, 0.2798851, 1.437446, 0, 0.345098, 1, 1,
0.2336706, -0.2484945, 3.444946, 0, 0.3411765, 1, 1,
0.2361899, -0.8675803, 2.430112, 0, 0.3333333, 1, 1,
0.2361968, -0.4616568, 2.037393, 0, 0.3294118, 1, 1,
0.2382582, 1.366805, 1.252747, 0, 0.3215686, 1, 1,
0.2397223, 1.320692, -0.1485363, 0, 0.3176471, 1, 1,
0.2406911, 0.5401402, 0.8454946, 0, 0.3098039, 1, 1,
0.2465894, 0.5598257, -0.0882313, 0, 0.3058824, 1, 1,
0.2468061, -0.3755916, 2.85362, 0, 0.2980392, 1, 1,
0.2506863, -1.654933, 1.859271, 0, 0.2901961, 1, 1,
0.2514517, 0.9339116, 1.166802, 0, 0.2862745, 1, 1,
0.2528521, -0.4355723, 2.981005, 0, 0.2784314, 1, 1,
0.2540549, -0.08085373, 1.812862, 0, 0.2745098, 1, 1,
0.2555552, -0.9311553, 3.791042, 0, 0.2666667, 1, 1,
0.2561373, -0.4890961, 2.410115, 0, 0.2627451, 1, 1,
0.2596968, 1.872603, 0.3033609, 0, 0.254902, 1, 1,
0.2623738, -0.9720788, 3.196588, 0, 0.2509804, 1, 1,
0.2631979, -0.005552791, -0.3148695, 0, 0.2431373, 1, 1,
0.2632767, -0.05687014, 0.5732923, 0, 0.2392157, 1, 1,
0.2641141, -0.6738108, 1.843078, 0, 0.2313726, 1, 1,
0.2661764, -0.3647309, 3.287547, 0, 0.227451, 1, 1,
0.2692474, 0.309663, 0.7356171, 0, 0.2196078, 1, 1,
0.2698577, -0.3407195, 3.341422, 0, 0.2156863, 1, 1,
0.276402, -0.1382971, 1.11738, 0, 0.2078431, 1, 1,
0.2785935, -0.07881252, 2.39761, 0, 0.2039216, 1, 1,
0.2829168, -0.02440838, 0.6874905, 0, 0.1960784, 1, 1,
0.2913816, 0.38873, 1.052847, 0, 0.1882353, 1, 1,
0.2946315, 0.4447313, 0.7272607, 0, 0.1843137, 1, 1,
0.2975482, 0.3656315, 0.5704845, 0, 0.1764706, 1, 1,
0.298005, -1.187067, 2.761193, 0, 0.172549, 1, 1,
0.2991501, 1.539216, 1.240189, 0, 0.1647059, 1, 1,
0.301394, -0.5329636, 2.047742, 0, 0.1607843, 1, 1,
0.3018472, -2.686309, 3.266232, 0, 0.1529412, 1, 1,
0.3023092, 2.629636, -1.858103, 0, 0.1490196, 1, 1,
0.3035755, 0.6861596, 0.4471715, 0, 0.1411765, 1, 1,
0.3044792, -0.5721769, 2.736878, 0, 0.1372549, 1, 1,
0.3045971, -3.843268, 4.251296, 0, 0.1294118, 1, 1,
0.304725, -0.187784, 0.7429117, 0, 0.1254902, 1, 1,
0.3052203, 0.005275777, 2.160763, 0, 0.1176471, 1, 1,
0.3187414, 0.01322592, 2.587813, 0, 0.1137255, 1, 1,
0.3248581, 0.6699333, 1.37495, 0, 0.1058824, 1, 1,
0.3252192, 0.5965508, -0.4616, 0, 0.09803922, 1, 1,
0.3311277, -0.6369335, 4.520272, 0, 0.09411765, 1, 1,
0.3318556, -0.01359034, 1.476803, 0, 0.08627451, 1, 1,
0.3392648, -1.029246, 1.119842, 0, 0.08235294, 1, 1,
0.3409024, 2.17172, 0.8899151, 0, 0.07450981, 1, 1,
0.3418587, 0.3356236, 1.748016, 0, 0.07058824, 1, 1,
0.3447317, 0.7996085, 1.36371, 0, 0.0627451, 1, 1,
0.3479361, -0.2464689, 2.552236, 0, 0.05882353, 1, 1,
0.3521175, -0.6829214, 1.979325, 0, 0.05098039, 1, 1,
0.3568535, 0.6849755, 0.9862747, 0, 0.04705882, 1, 1,
0.3571904, 0.3045272, -0.04028312, 0, 0.03921569, 1, 1,
0.3582338, 1.185022, 1.369652, 0, 0.03529412, 1, 1,
0.3591741, -0.7761325, 2.496564, 0, 0.02745098, 1, 1,
0.3609652, 1.395918, 0.6483786, 0, 0.02352941, 1, 1,
0.3680121, 0.7606907, -0.4442114, 0, 0.01568628, 1, 1,
0.3694091, 1.753942, -0.2582789, 0, 0.01176471, 1, 1,
0.3708817, 0.6639845, 1.395221, 0, 0.003921569, 1, 1,
0.3719299, -0.08373547, 1.089318, 0.003921569, 0, 1, 1,
0.3744358, 0.4632305, 1.355972, 0.007843138, 0, 1, 1,
0.3748999, 0.9634826, 1.256153, 0.01568628, 0, 1, 1,
0.374962, 1.347189, 0.7770696, 0.01960784, 0, 1, 1,
0.3751953, 1.82251, -0.1000337, 0.02745098, 0, 1, 1,
0.3786813, 0.9968912, -0.3694552, 0.03137255, 0, 1, 1,
0.378717, 0.9155042, 1.308153, 0.03921569, 0, 1, 1,
0.3790895, -0.2669002, -0.7188941, 0.04313726, 0, 1, 1,
0.3791096, 1.686194, -0.4507843, 0.05098039, 0, 1, 1,
0.3805098, -0.2827972, 2.404752, 0.05490196, 0, 1, 1,
0.3806986, -0.1419329, 2.389101, 0.0627451, 0, 1, 1,
0.3844773, 1.002764, 1.600503, 0.06666667, 0, 1, 1,
0.3905138, -2.15902, 2.558827, 0.07450981, 0, 1, 1,
0.3935193, -0.9911634, 2.964906, 0.07843138, 0, 1, 1,
0.3937572, 0.0288216, -1.643981, 0.08627451, 0, 1, 1,
0.3951879, -0.2104011, 1.250414, 0.09019608, 0, 1, 1,
0.4014575, -0.1720276, 1.549258, 0.09803922, 0, 1, 1,
0.4089605, -0.4879693, 3.394712, 0.1058824, 0, 1, 1,
0.4110586, 0.2580242, 0.9362864, 0.1098039, 0, 1, 1,
0.4212945, -0.8511661, 0.8337893, 0.1176471, 0, 1, 1,
0.4248647, -1.385109, 1.593332, 0.1215686, 0, 1, 1,
0.4262079, -0.7766758, 0.6986327, 0.1294118, 0, 1, 1,
0.4264814, -1.119118, 3.846525, 0.1333333, 0, 1, 1,
0.4272527, -0.1805182, 1.907684, 0.1411765, 0, 1, 1,
0.4292816, -0.3450151, 1.618184, 0.145098, 0, 1, 1,
0.4323929, 0.2786582, 1.992473, 0.1529412, 0, 1, 1,
0.4327669, -1.171621, 4.271915, 0.1568628, 0, 1, 1,
0.4328909, -0.1985983, 2.668533, 0.1647059, 0, 1, 1,
0.4330168, 1.136689, 0.3348212, 0.1686275, 0, 1, 1,
0.4347081, 0.3709874, 1.649294, 0.1764706, 0, 1, 1,
0.4354373, 2.904469, 1.491375, 0.1803922, 0, 1, 1,
0.4405095, 0.9210281, -0.1158843, 0.1882353, 0, 1, 1,
0.4423369, -0.1169473, 1.57177, 0.1921569, 0, 1, 1,
0.4426056, 1.863259, 0.3538043, 0.2, 0, 1, 1,
0.4486816, -0.6843553, 3.618217, 0.2078431, 0, 1, 1,
0.4554774, -0.2092995, 2.85912, 0.2117647, 0, 1, 1,
0.4565608, 1.473253, -0.5255144, 0.2196078, 0, 1, 1,
0.4598839, -1.103145, 2.340551, 0.2235294, 0, 1, 1,
0.460504, 1.078022, 1.582674, 0.2313726, 0, 1, 1,
0.4649043, 1.006422, 0.7229663, 0.2352941, 0, 1, 1,
0.4690446, -0.9305494, 3.088888, 0.2431373, 0, 1, 1,
0.4696862, -0.09209616, 1.283376, 0.2470588, 0, 1, 1,
0.4708561, -1.47021, 2.644716, 0.254902, 0, 1, 1,
0.4744084, 1.395731, -0.2780719, 0.2588235, 0, 1, 1,
0.4754313, 0.2705634, 2.295231, 0.2666667, 0, 1, 1,
0.4848729, -0.5450721, 2.54858, 0.2705882, 0, 1, 1,
0.4851552, -1.654183, 2.640235, 0.2784314, 0, 1, 1,
0.4883064, -0.4539666, 4.117686, 0.282353, 0, 1, 1,
0.4883204, -0.4609617, 3.191422, 0.2901961, 0, 1, 1,
0.4954234, -0.1180749, 1.702287, 0.2941177, 0, 1, 1,
0.5016469, 0.01629445, 0.9772322, 0.3019608, 0, 1, 1,
0.502556, -0.2745935, 3.10065, 0.3098039, 0, 1, 1,
0.5027807, 0.5325083, -0.4666783, 0.3137255, 0, 1, 1,
0.5059288, 0.1143251, 1.027304, 0.3215686, 0, 1, 1,
0.5060885, -0.08522441, 2.790424, 0.3254902, 0, 1, 1,
0.5098926, -0.06520756, 1.684729, 0.3333333, 0, 1, 1,
0.5108639, 0.3673337, 0.8123741, 0.3372549, 0, 1, 1,
0.52346, -0.5098135, 3.925293, 0.345098, 0, 1, 1,
0.5237181, -0.287145, 2.247188, 0.3490196, 0, 1, 1,
0.5255214, -0.1515421, 0.5704116, 0.3568628, 0, 1, 1,
0.5338697, 0.3753941, 1.432845, 0.3607843, 0, 1, 1,
0.5348767, 0.3373445, -1.268214, 0.3686275, 0, 1, 1,
0.5450052, -0.3669965, 1.944416, 0.372549, 0, 1, 1,
0.5456418, 0.2212473, 1.786148, 0.3803922, 0, 1, 1,
0.549424, -0.1182095, 0.4601855, 0.3843137, 0, 1, 1,
0.5510425, 1.440949, -0.1488593, 0.3921569, 0, 1, 1,
0.5586114, -0.06688184, 1.07924, 0.3960784, 0, 1, 1,
0.5590225, 1.549012, -0.8967386, 0.4039216, 0, 1, 1,
0.5668471, -1.542494, 1.671642, 0.4117647, 0, 1, 1,
0.5733365, -0.6333853, 1.983572, 0.4156863, 0, 1, 1,
0.5762919, 0.7105114, 1.987001, 0.4235294, 0, 1, 1,
0.581365, 0.2634483, 1.767347, 0.427451, 0, 1, 1,
0.5854833, -0.01621099, 2.628251, 0.4352941, 0, 1, 1,
0.585859, 0.3524585, 1.52457, 0.4392157, 0, 1, 1,
0.5918686, 1.348994, -0.835768, 0.4470588, 0, 1, 1,
0.5933768, 0.2282452, 2.14983, 0.4509804, 0, 1, 1,
0.5937654, 0.1999726, 0.8026627, 0.4588235, 0, 1, 1,
0.595769, -0.6521316, 1.793593, 0.4627451, 0, 1, 1,
0.597029, 2.377052, 0.8916408, 0.4705882, 0, 1, 1,
0.5981139, 0.1647861, 0.3643101, 0.4745098, 0, 1, 1,
0.6057808, -1.05003, 3.061753, 0.4823529, 0, 1, 1,
0.6082051, 0.3264337, 0.1855707, 0.4862745, 0, 1, 1,
0.6087072, 0.9496107, 1.023252, 0.4941176, 0, 1, 1,
0.6158596, -0.5188891, 2.597133, 0.5019608, 0, 1, 1,
0.6170222, -0.589047, 3.103245, 0.5058824, 0, 1, 1,
0.6214566, 0.0623095, 0.3130712, 0.5137255, 0, 1, 1,
0.62409, -1.266175, 1.758829, 0.5176471, 0, 1, 1,
0.6259263, 0.4660411, 0.1801085, 0.5254902, 0, 1, 1,
0.6272703, -0.2474097, 1.298455, 0.5294118, 0, 1, 1,
0.6279101, -0.4989864, 1.904268, 0.5372549, 0, 1, 1,
0.6282751, 1.25591, -0.525843, 0.5411765, 0, 1, 1,
0.6305165, -0.05871038, 0.9828086, 0.5490196, 0, 1, 1,
0.6369786, 1.720212, -0.5133684, 0.5529412, 0, 1, 1,
0.6392282, 1.036027, -0.1262031, 0.5607843, 0, 1, 1,
0.6402276, 0.5675505, 1.03087, 0.5647059, 0, 1, 1,
0.6658317, -1.574698, 2.938968, 0.572549, 0, 1, 1,
0.6683118, -0.3579668, 2.169868, 0.5764706, 0, 1, 1,
0.6688632, 0.6668545, 0.3981825, 0.5843138, 0, 1, 1,
0.6691766, -0.825089, 0.3648344, 0.5882353, 0, 1, 1,
0.6694321, -0.06931543, 2.304278, 0.5960785, 0, 1, 1,
0.675479, 0.5557181, -1.065308, 0.6039216, 0, 1, 1,
0.6815864, -0.7685691, 0.6462741, 0.6078432, 0, 1, 1,
0.6842166, 0.1851014, 0.8729487, 0.6156863, 0, 1, 1,
0.6852229, -1.657881, 2.424709, 0.6196079, 0, 1, 1,
0.6886225, 0.5147865, 1.934229, 0.627451, 0, 1, 1,
0.6939378, -0.7031886, 0.5927956, 0.6313726, 0, 1, 1,
0.6988411, 1.530223, -1.777822, 0.6392157, 0, 1, 1,
0.7008469, 0.923335, 1.089335, 0.6431373, 0, 1, 1,
0.7060952, -1.360873, 2.665103, 0.6509804, 0, 1, 1,
0.7082133, 0.5323502, 0.7784998, 0.654902, 0, 1, 1,
0.7108691, -1.004897, 3.897105, 0.6627451, 0, 1, 1,
0.7123838, -1.280495, 2.167569, 0.6666667, 0, 1, 1,
0.7228318, -1.192668, 2.69679, 0.6745098, 0, 1, 1,
0.7249973, 0.1043206, 2.478576, 0.6784314, 0, 1, 1,
0.728075, 1.138286, -0.2846406, 0.6862745, 0, 1, 1,
0.7313861, 1.770252, 0.2538534, 0.6901961, 0, 1, 1,
0.7324881, 0.860927, -0.2554463, 0.6980392, 0, 1, 1,
0.7355717, -0.03858581, 1.832829, 0.7058824, 0, 1, 1,
0.7367817, -0.9737495, 0.4942294, 0.7098039, 0, 1, 1,
0.7402722, -1.042797, 1.472763, 0.7176471, 0, 1, 1,
0.7418834, -0.002793367, 2.716799, 0.7215686, 0, 1, 1,
0.7441797, -1.148046, 1.765013, 0.7294118, 0, 1, 1,
0.7520627, -1.938033, 1.580973, 0.7333333, 0, 1, 1,
0.7549343, -1.092096, 1.835197, 0.7411765, 0, 1, 1,
0.7564468, 0.5487868, 1.346063, 0.7450981, 0, 1, 1,
0.7584842, 0.8682658, 0.5100862, 0.7529412, 0, 1, 1,
0.7586519, -0.1981777, 2.673017, 0.7568628, 0, 1, 1,
0.7613572, -1.011918, 2.310949, 0.7647059, 0, 1, 1,
0.7773473, -1.124785, 2.388231, 0.7686275, 0, 1, 1,
0.7817665, -1.172015, 2.52122, 0.7764706, 0, 1, 1,
0.790416, -0.8948489, 2.85196, 0.7803922, 0, 1, 1,
0.7927816, 1.082584, 1.390474, 0.7882353, 0, 1, 1,
0.8008785, -0.4864503, 2.730524, 0.7921569, 0, 1, 1,
0.8052312, 0.05605753, 0.6545544, 0.8, 0, 1, 1,
0.8082964, -0.604288, 1.971171, 0.8078431, 0, 1, 1,
0.8088886, -0.5172276, 2.236395, 0.8117647, 0, 1, 1,
0.8114684, 0.9336868, 0.7287961, 0.8196079, 0, 1, 1,
0.8121788, 0.7627625, 0.8223219, 0.8235294, 0, 1, 1,
0.8144563, 0.828812, 0.2681421, 0.8313726, 0, 1, 1,
0.8154885, 1.358341, -0.3411204, 0.8352941, 0, 1, 1,
0.8164195, -0.6380911, 2.017555, 0.8431373, 0, 1, 1,
0.8238739, -1.851034, 2.145657, 0.8470588, 0, 1, 1,
0.8248275, -0.518155, 1.080473, 0.854902, 0, 1, 1,
0.8274743, 1.13583, -0.3307016, 0.8588235, 0, 1, 1,
0.8280571, 1.838848, -0.3744712, 0.8666667, 0, 1, 1,
0.8313966, 0.4758065, 1.539393, 0.8705882, 0, 1, 1,
0.8314365, -0.0990577, 1.566142, 0.8784314, 0, 1, 1,
0.8325174, 1.110329, 2.115635, 0.8823529, 0, 1, 1,
0.8373285, 1.769871, -0.03858275, 0.8901961, 0, 1, 1,
0.8390695, -0.1139427, 2.237828, 0.8941177, 0, 1, 1,
0.8449537, -0.2132962, 0.07887187, 0.9019608, 0, 1, 1,
0.8455136, -1.300414, 1.721569, 0.9098039, 0, 1, 1,
0.8460357, 0.3552507, -0.6768536, 0.9137255, 0, 1, 1,
0.8504664, 1.004252, 1.234715, 0.9215686, 0, 1, 1,
0.8512514, 0.6449783, 0.5218099, 0.9254902, 0, 1, 1,
0.8608795, 0.2368405, 0.4964209, 0.9333333, 0, 1, 1,
0.8622811, -1.941437, 2.814598, 0.9372549, 0, 1, 1,
0.8661118, 1.138041, -0.4973316, 0.945098, 0, 1, 1,
0.8728722, -0.2840984, 1.857946, 0.9490196, 0, 1, 1,
0.8745021, 0.8286203, 0.6540756, 0.9568627, 0, 1, 1,
0.9017099, -0.3107458, 3.114657, 0.9607843, 0, 1, 1,
0.9043311, -0.8185417, 2.536117, 0.9686275, 0, 1, 1,
0.9063274, -0.01227731, 1.879319, 0.972549, 0, 1, 1,
0.9182398, 0.1083518, 0.5421188, 0.9803922, 0, 1, 1,
0.9288319, -2.543749, 4.166842, 0.9843137, 0, 1, 1,
0.9308279, 1.426675, 0.6678038, 0.9921569, 0, 1, 1,
0.9380749, -0.3300186, 1.523309, 0.9960784, 0, 1, 1,
0.9466198, 0.09761159, 3.657861, 1, 0, 0.9960784, 1,
0.9489354, -0.4960837, 2.199209, 1, 0, 0.9882353, 1,
0.9601857, -0.1557001, 0.5522336, 1, 0, 0.9843137, 1,
0.9661988, 0.3405711, 2.973837, 1, 0, 0.9764706, 1,
0.9681991, 0.1820896, 0.8501536, 1, 0, 0.972549, 1,
0.9705389, -0.0980157, 1.906394, 1, 0, 0.9647059, 1,
0.9711967, -0.5081926, 2.10903, 1, 0, 0.9607843, 1,
0.9796446, -0.7135761, 2.443402, 1, 0, 0.9529412, 1,
0.9822434, 0.1897458, 1.031178, 1, 0, 0.9490196, 1,
0.9849215, -0.1855705, -0.2348688, 1, 0, 0.9411765, 1,
0.9855809, -0.7674939, 1.33584, 1, 0, 0.9372549, 1,
0.9865881, 0.3271221, 0.3931168, 1, 0, 0.9294118, 1,
0.9895784, 0.5197504, 0.9960631, 1, 0, 0.9254902, 1,
0.9916289, 0.3851534, 2.090513, 1, 0, 0.9176471, 1,
0.9933611, 0.04983756, 0.7831352, 1, 0, 0.9137255, 1,
0.9953035, 0.8704655, -0.4306728, 1, 0, 0.9058824, 1,
0.9972138, 0.1807667, 2.383354, 1, 0, 0.9019608, 1,
0.9996904, -0.5405322, 1.202472, 1, 0, 0.8941177, 1,
1.003201, -0.8729228, 2.341153, 1, 0, 0.8862745, 1,
1.006255, 0.5140108, 1.682833, 1, 0, 0.8823529, 1,
1.024666, -0.4922281, 1.2503, 1, 0, 0.8745098, 1,
1.033828, -0.5895001, 1.716577, 1, 0, 0.8705882, 1,
1.043656, 0.0883387, 1.026623, 1, 0, 0.8627451, 1,
1.05924, -0.7972811, -0.8542462, 1, 0, 0.8588235, 1,
1.062108, -0.2957055, 2.609866, 1, 0, 0.8509804, 1,
1.068012, 0.246153, 2.090203, 1, 0, 0.8470588, 1,
1.073474, -1.103378, 2.576836, 1, 0, 0.8392157, 1,
1.082176, -0.472141, 3.789568, 1, 0, 0.8352941, 1,
1.082953, 1.289434, 1.09984, 1, 0, 0.827451, 1,
1.09119, 1.216803, 0.728052, 1, 0, 0.8235294, 1,
1.099016, -2.256437, 6.061555, 1, 0, 0.8156863, 1,
1.100829, 1.592054, 1.917415, 1, 0, 0.8117647, 1,
1.106143, -0.4264768, 3.507522, 1, 0, 0.8039216, 1,
1.111108, 0.2263502, 0.3809207, 1, 0, 0.7960784, 1,
1.123957, 0.8123976, -0.7539403, 1, 0, 0.7921569, 1,
1.129788, -0.6874098, 2.744383, 1, 0, 0.7843137, 1,
1.132949, 0.7018011, 1.267351, 1, 0, 0.7803922, 1,
1.134421, -1.792518, 2.398953, 1, 0, 0.772549, 1,
1.139119, -0.225115, 1.010723, 1, 0, 0.7686275, 1,
1.14294, 0.8931386, -0.3338247, 1, 0, 0.7607843, 1,
1.149331, 0.472767, 1.019467, 1, 0, 0.7568628, 1,
1.151277, -1.44961, 1.548681, 1, 0, 0.7490196, 1,
1.155431, -0.3531787, -0.03821217, 1, 0, 0.7450981, 1,
1.15921, 0.1512196, 0.9711461, 1, 0, 0.7372549, 1,
1.162, -1.716285, 2.941081, 1, 0, 0.7333333, 1,
1.168001, -0.5149187, 2.086087, 1, 0, 0.7254902, 1,
1.176326, 0.2062321, 0.4037531, 1, 0, 0.7215686, 1,
1.185534, 0.4580385, -1.442914, 1, 0, 0.7137255, 1,
1.189731, 0.8773981, 1.107248, 1, 0, 0.7098039, 1,
1.193235, 0.2715164, 2.299185, 1, 0, 0.7019608, 1,
1.194832, -0.3503675, 2.915036, 1, 0, 0.6941177, 1,
1.195575, -1.328528, 3.773175, 1, 0, 0.6901961, 1,
1.198748, 0.4689091, 0.8027115, 1, 0, 0.682353, 1,
1.208808, 0.3665893, 2.78896, 1, 0, 0.6784314, 1,
1.211371, -0.2799394, 1.640816, 1, 0, 0.6705883, 1,
1.220485, -0.2817597, 2.871064, 1, 0, 0.6666667, 1,
1.227007, 0.6551649, -0.03615341, 1, 0, 0.6588235, 1,
1.227308, -0.7211476, 2.002955, 1, 0, 0.654902, 1,
1.230128, -1.319463, 1.999527, 1, 0, 0.6470588, 1,
1.231798, 0.03836221, 0.7975032, 1, 0, 0.6431373, 1,
1.239215, 1.785854, -0.002436788, 1, 0, 0.6352941, 1,
1.243878, 0.4683107, 3.195715, 1, 0, 0.6313726, 1,
1.245661, 0.7360129, 1.633354, 1, 0, 0.6235294, 1,
1.273577, 0.9242136, 0.8534068, 1, 0, 0.6196079, 1,
1.277414, 0.1493329, 3.40181, 1, 0, 0.6117647, 1,
1.280525, -1.926162, 1.47813, 1, 0, 0.6078432, 1,
1.288483, 1.214802, 0.9841737, 1, 0, 0.6, 1,
1.289644, -0.107822, -0.4047643, 1, 0, 0.5921569, 1,
1.290094, 0.3009233, 1.345527, 1, 0, 0.5882353, 1,
1.302557, 0.05742316, 1.619203, 1, 0, 0.5803922, 1,
1.308663, -0.6079811, 2.56313, 1, 0, 0.5764706, 1,
1.30913, -0.1113675, 1.577087, 1, 0, 0.5686275, 1,
1.309639, 0.5176219, 1.479452, 1, 0, 0.5647059, 1,
1.310772, 0.435225, -0.09820155, 1, 0, 0.5568628, 1,
1.318374, -1.807471, 3.350115, 1, 0, 0.5529412, 1,
1.319087, -1.147444, 1.680434, 1, 0, 0.5450981, 1,
1.335973, 0.07550824, 1.982835, 1, 0, 0.5411765, 1,
1.347077, 0.2260469, 4.031714, 1, 0, 0.5333334, 1,
1.349071, 0.5361621, 0.5621898, 1, 0, 0.5294118, 1,
1.35057, -0.9052045, 3.363245, 1, 0, 0.5215687, 1,
1.372945, -1.089606, 2.912253, 1, 0, 0.5176471, 1,
1.383348, -1.275625, 1.222874, 1, 0, 0.509804, 1,
1.386773, -1.101713, 1.46599, 1, 0, 0.5058824, 1,
1.395794, 1.617023, 1.070954, 1, 0, 0.4980392, 1,
1.397807, -0.2615927, 1.054226, 1, 0, 0.4901961, 1,
1.403206, -1.570276, 1.007948, 1, 0, 0.4862745, 1,
1.405524, 1.561995, 0.9197982, 1, 0, 0.4784314, 1,
1.406539, -0.4683367, 2.483326, 1, 0, 0.4745098, 1,
1.412196, -1.598653, 2.304478, 1, 0, 0.4666667, 1,
1.419833, 1.23039, 1.108135, 1, 0, 0.4627451, 1,
1.429366, -0.4766231, 1.129717, 1, 0, 0.454902, 1,
1.439664, -0.01517057, 2.01268, 1, 0, 0.4509804, 1,
1.447754, -0.5613218, 2.331671, 1, 0, 0.4431373, 1,
1.455212, -1.409179, 2.206331, 1, 0, 0.4392157, 1,
1.456402, 0.9870203, 1.565175, 1, 0, 0.4313726, 1,
1.463999, 1.097756, 0.03745033, 1, 0, 0.427451, 1,
1.476703, -2.706174, 2.102999, 1, 0, 0.4196078, 1,
1.484047, -0.6280082, 0.8875455, 1, 0, 0.4156863, 1,
1.488263, -1.734495, 0.966919, 1, 0, 0.4078431, 1,
1.492573, 0.3038957, 3.074775, 1, 0, 0.4039216, 1,
1.494644, -0.941928, 1.222636, 1, 0, 0.3960784, 1,
1.512433, 1.33119, 0.7370875, 1, 0, 0.3882353, 1,
1.51783, -0.6316897, 2.906922, 1, 0, 0.3843137, 1,
1.524507, 0.5731722, 2.772972, 1, 0, 0.3764706, 1,
1.533004, -0.4017628, 3.071316, 1, 0, 0.372549, 1,
1.53363, 0.8109257, 0.7020215, 1, 0, 0.3647059, 1,
1.534266, -0.6846448, 1.861784, 1, 0, 0.3607843, 1,
1.539247, -0.2889507, 0.9413198, 1, 0, 0.3529412, 1,
1.547645, 0.1044263, 1.430094, 1, 0, 0.3490196, 1,
1.547932, 0.7496582, 1.128712, 1, 0, 0.3411765, 1,
1.555165, 0.5842251, 2.577079, 1, 0, 0.3372549, 1,
1.569577, -0.3504032, 1.012506, 1, 0, 0.3294118, 1,
1.574783, -1.492046, 1.795073, 1, 0, 0.3254902, 1,
1.585389, -0.8918634, 3.593309, 1, 0, 0.3176471, 1,
1.589495, -0.6606191, 1.900523, 1, 0, 0.3137255, 1,
1.590723, -0.01270741, 1.267534, 1, 0, 0.3058824, 1,
1.60624, -0.7833555, 3.107895, 1, 0, 0.2980392, 1,
1.629753, 0.2010721, 1.811212, 1, 0, 0.2941177, 1,
1.630181, -1.977598, 2.94536, 1, 0, 0.2862745, 1,
1.635247, 1.723405, 1.854607, 1, 0, 0.282353, 1,
1.637249, 1.718807, 1.112977, 1, 0, 0.2745098, 1,
1.647787, 2.751332, 0.8920655, 1, 0, 0.2705882, 1,
1.665925, 0.8525019, 0.8809558, 1, 0, 0.2627451, 1,
1.666827, -0.5106448, 2.524936, 1, 0, 0.2588235, 1,
1.682926, -0.1016683, 0.08751743, 1, 0, 0.2509804, 1,
1.685794, 0.4294463, 2.788832, 1, 0, 0.2470588, 1,
1.688525, 1.074674, 1.442483, 1, 0, 0.2392157, 1,
1.705282, 2.010991, 2.373391, 1, 0, 0.2352941, 1,
1.712334, 0.06678742, 0.9158046, 1, 0, 0.227451, 1,
1.719207, -1.075456, 2.122298, 1, 0, 0.2235294, 1,
1.723156, -0.9927405, 2.0614, 1, 0, 0.2156863, 1,
1.727648, 0.6042067, 1.473077, 1, 0, 0.2117647, 1,
1.760707, -1.033764, 2.056442, 1, 0, 0.2039216, 1,
1.791292, 0.08720884, 0.2860233, 1, 0, 0.1960784, 1,
1.793384, -0.09231009, 1.606257, 1, 0, 0.1921569, 1,
1.805601, -1.777175, 2.169756, 1, 0, 0.1843137, 1,
1.809159, -1.723274, 2.271216, 1, 0, 0.1803922, 1,
1.811039, -0.1151908, 1.163837, 1, 0, 0.172549, 1,
1.823336, 1.161101, 0.6004546, 1, 0, 0.1686275, 1,
1.844557, -0.2672401, 2.845106, 1, 0, 0.1607843, 1,
1.868941, 0.7170063, 1.165046, 1, 0, 0.1568628, 1,
1.880814, 0.003540739, 1.514653, 1, 0, 0.1490196, 1,
1.915113, -2.132239, 2.385875, 1, 0, 0.145098, 1,
1.930356, -2.487677, 3.365773, 1, 0, 0.1372549, 1,
1.939868, -1.480098, 3.572056, 1, 0, 0.1333333, 1,
1.949467, -1.514477, 1.446474, 1, 0, 0.1254902, 1,
1.950444, 0.4035636, 3.35722, 1, 0, 0.1215686, 1,
1.988918, 0.2496933, 1.037107, 1, 0, 0.1137255, 1,
2.018351, -0.6356406, 1.900409, 1, 0, 0.1098039, 1,
2.020751, -0.9629957, 2.380088, 1, 0, 0.1019608, 1,
2.053273, -1.477774, 3.408036, 1, 0, 0.09411765, 1,
2.054842, 0.399545, 1.42665, 1, 0, 0.09019608, 1,
2.062079, 0.1337847, 0.7517256, 1, 0, 0.08235294, 1,
2.06547, -0.9165685, 1.162133, 1, 0, 0.07843138, 1,
2.069974, -0.6648433, 2.9773, 1, 0, 0.07058824, 1,
2.079588, -0.4247848, 1.086381, 1, 0, 0.06666667, 1,
2.106963, -0.5441406, 0.7412251, 1, 0, 0.05882353, 1,
2.155912, -2.412537, 3.49105, 1, 0, 0.05490196, 1,
2.156309, -0.4911315, 1.332766, 1, 0, 0.04705882, 1,
2.162726, 0.5079325, 2.433917, 1, 0, 0.04313726, 1,
2.284245, 0.08479469, -1.302942, 1, 0, 0.03529412, 1,
2.30178, -0.4900989, 1.883078, 1, 0, 0.03137255, 1,
2.303345, 0.1866248, -0.2203433, 1, 0, 0.02352941, 1,
2.452099, -1.190796, 0.5751809, 1, 0, 0.01960784, 1,
2.843696, -0.7278891, 1.619443, 1, 0, 0.01176471, 1,
3.985332, -0.3405568, 1.921663, 1, 0, 0.007843138, 1
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
0.5005991, -5.058095, -7.225891, 0, -0.5, 0.5, 0.5,
0.5005991, -5.058095, -7.225891, 1, -0.5, 0.5, 0.5,
0.5005991, -5.058095, -7.225891, 1, 1.5, 0.5, 0.5,
0.5005991, -5.058095, -7.225891, 0, 1.5, 0.5, 0.5
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
-4.165458, -0.2597077, -7.225891, 0, -0.5, 0.5, 0.5,
-4.165458, -0.2597077, -7.225891, 1, -0.5, 0.5, 0.5,
-4.165458, -0.2597077, -7.225891, 1, 1.5, 0.5, 0.5,
-4.165458, -0.2597077, -7.225891, 0, 1.5, 0.5, 0.5
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
-4.165458, -5.058095, 0.3807316, 0, -0.5, 0.5, 0.5,
-4.165458, -5.058095, 0.3807316, 1, -0.5, 0.5, 0.5,
-4.165458, -5.058095, 0.3807316, 1, 1.5, 0.5, 0.5,
-4.165458, -5.058095, 0.3807316, 0, 1.5, 0.5, 0.5
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
-2, -3.950775, -5.470516,
3, -3.950775, -5.470516,
-2, -3.950775, -5.470516,
-2, -4.135328, -5.763079,
-1, -3.950775, -5.470516,
-1, -4.135328, -5.763079,
0, -3.950775, -5.470516,
0, -4.135328, -5.763079,
1, -3.950775, -5.470516,
1, -4.135328, -5.763079,
2, -3.950775, -5.470516,
2, -4.135328, -5.763079,
3, -3.950775, -5.470516,
3, -4.135328, -5.763079
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
-2, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
-2, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
-2, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
-2, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5,
-1, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
-1, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
-1, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
-1, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5,
0, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
0, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
0, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
0, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5,
1, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
1, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
1, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
1, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5,
2, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
2, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
2, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
2, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5,
3, -4.504435, -6.348204, 0, -0.5, 0.5, 0.5,
3, -4.504435, -6.348204, 1, -0.5, 0.5, 0.5,
3, -4.504435, -6.348204, 1, 1.5, 0.5, 0.5,
3, -4.504435, -6.348204, 0, 1.5, 0.5, 0.5
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
-3.088675, -2, -5.470516,
-3.088675, 2, -5.470516,
-3.088675, -2, -5.470516,
-3.268139, -2, -5.763079,
-3.088675, 0, -5.470516,
-3.268139, 0, -5.763079,
-3.088675, 2, -5.470516,
-3.268139, 2, -5.763079
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
-3.627067, -2, -6.348204, 0, -0.5, 0.5, 0.5,
-3.627067, -2, -6.348204, 1, -0.5, 0.5, 0.5,
-3.627067, -2, -6.348204, 1, 1.5, 0.5, 0.5,
-3.627067, -2, -6.348204, 0, 1.5, 0.5, 0.5,
-3.627067, 0, -6.348204, 0, -0.5, 0.5, 0.5,
-3.627067, 0, -6.348204, 1, -0.5, 0.5, 0.5,
-3.627067, 0, -6.348204, 1, 1.5, 0.5, 0.5,
-3.627067, 0, -6.348204, 0, 1.5, 0.5, 0.5,
-3.627067, 2, -6.348204, 0, -0.5, 0.5, 0.5,
-3.627067, 2, -6.348204, 1, -0.5, 0.5, 0.5,
-3.627067, 2, -6.348204, 1, 1.5, 0.5, 0.5,
-3.627067, 2, -6.348204, 0, 1.5, 0.5, 0.5
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
-3.088675, -3.950775, -4,
-3.088675, -3.950775, 6,
-3.088675, -3.950775, -4,
-3.268139, -4.135328, -4,
-3.088675, -3.950775, -2,
-3.268139, -4.135328, -2,
-3.088675, -3.950775, 0,
-3.268139, -4.135328, 0,
-3.088675, -3.950775, 2,
-3.268139, -4.135328, 2,
-3.088675, -3.950775, 4,
-3.268139, -4.135328, 4,
-3.088675, -3.950775, 6,
-3.268139, -4.135328, 6
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
-3.627067, -4.504435, -4, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, -4, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, -4, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, -4, 0, 1.5, 0.5, 0.5,
-3.627067, -4.504435, -2, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, -2, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, -2, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, -2, 0, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 0, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 0, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 0, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 0, 0, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 2, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 2, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 2, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 2, 0, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 4, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 4, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 4, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 4, 0, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 6, 0, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 6, 1, -0.5, 0.5, 0.5,
-3.627067, -4.504435, 6, 1, 1.5, 0.5, 0.5,
-3.627067, -4.504435, 6, 0, 1.5, 0.5, 0.5
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
-3.088675, -3.950775, -5.470516,
-3.088675, 3.431359, -5.470516,
-3.088675, -3.950775, 6.231979,
-3.088675, 3.431359, 6.231979,
-3.088675, -3.950775, -5.470516,
-3.088675, -3.950775, 6.231979,
-3.088675, 3.431359, -5.470516,
-3.088675, 3.431359, 6.231979,
-3.088675, -3.950775, -5.470516,
4.089874, -3.950775, -5.470516,
-3.088675, -3.950775, 6.231979,
4.089874, -3.950775, 6.231979,
-3.088675, 3.431359, -5.470516,
4.089874, 3.431359, -5.470516,
-3.088675, 3.431359, 6.231979,
4.089874, 3.431359, 6.231979,
4.089874, -3.950775, -5.470516,
4.089874, 3.431359, -5.470516,
4.089874, -3.950775, 6.231979,
4.089874, 3.431359, 6.231979,
4.089874, -3.950775, -5.470516,
4.089874, -3.950775, 6.231979,
4.089874, 3.431359, -5.470516,
4.089874, 3.431359, 6.231979
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
var radius = 8.32352;
var distance = 37.03228;
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
mvMatrix.translate( -0.5005991, 0.2597077, -0.3807316 );
mvMatrix.scale( 1.253673, 1.219099, 0.7690285 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.03228);
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
Carbophenthion<-read.table("Carbophenthion.xyz")
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
-2.984133, -1.077681, -2.34722, 0, 0, 1, 1, 1,
-2.719781, 0.607044, -1.476002, 1, 0, 0, 1, 1,
-2.675437, -0.6234217, -1.507657, 1, 0, 0, 1, 1,
-2.634609, -0.3145661, -2.096476, 1, 0, 0, 1, 1,
-2.574532, 1.125807, -2.203832, 1, 0, 0, 1, 1,
-2.554391, -0.4440936, -1.567953, 1, 0, 0, 1, 1,
-2.48154, 0.2875631, -2.030916, 0, 0, 0, 1, 1,
-2.481417, 0.4662995, -0.6327418, 0, 0, 0, 1, 1,
-2.472549, 0.1932144, -1.512836, 0, 0, 0, 1, 1,
-2.385334, 2.14274, -1.73931, 0, 0, 0, 1, 1,
-2.298126, -1.902822, -3.700818, 0, 0, 0, 1, 1,
-2.253248, 1.202286, -3.064584, 0, 0, 0, 1, 1,
-2.243263, 0.225619, -0.690786, 0, 0, 0, 1, 1,
-2.236876, -0.3719499, -3.923897, 1, 1, 1, 1, 1,
-2.219992, -0.9610339, -2.726936, 1, 1, 1, 1, 1,
-2.216671, -2.001263, -2.437306, 1, 1, 1, 1, 1,
-2.176676, 1.080416, -0.9715415, 1, 1, 1, 1, 1,
-2.139342, 1.727404, -0.5762405, 1, 1, 1, 1, 1,
-2.129114, 0.9216615, -0.2493982, 1, 1, 1, 1, 1,
-2.103669, -1.726329, -3.486606, 1, 1, 1, 1, 1,
-2.094895, -0.1499383, -3.033512, 1, 1, 1, 1, 1,
-2.084753, 1.127443, -0.8691249, 1, 1, 1, 1, 1,
-2.081009, -0.01273891, -1.048075, 1, 1, 1, 1, 1,
-2.055587, -0.04312129, 0.491574, 1, 1, 1, 1, 1,
-2.037472, -0.2240712, -1.856395, 1, 1, 1, 1, 1,
-2.016124, -0.6245875, -1.381995, 1, 1, 1, 1, 1,
-2.015895, -1.734052, -1.725741, 1, 1, 1, 1, 1,
-2.008776, -1.129518, -3.039252, 1, 1, 1, 1, 1,
-1.955793, 0.17576, -1.538438, 0, 0, 1, 1, 1,
-1.949474, 0.3709418, -1.207293, 1, 0, 0, 1, 1,
-1.91231, -0.5348626, -3.652396, 1, 0, 0, 1, 1,
-1.911802, -0.5240456, -2.517532, 1, 0, 0, 1, 1,
-1.910935, -0.6712694, 0.2915214, 1, 0, 0, 1, 1,
-1.891992, -0.2190115, -2.508436, 1, 0, 0, 1, 1,
-1.860025, 1.372347, -0.1939224, 0, 0, 0, 1, 1,
-1.8374, -1.220985, -2.402552, 0, 0, 0, 1, 1,
-1.778053, 0.4037401, -2.456498, 0, 0, 0, 1, 1,
-1.763259, 0.7724239, -2.221391, 0, 0, 0, 1, 1,
-1.75974, 0.9573629, -1.319355, 0, 0, 0, 1, 1,
-1.756283, -1.266457, -2.342927, 0, 0, 0, 1, 1,
-1.733035, 1.080222, -1.555923, 0, 0, 0, 1, 1,
-1.720449, -1.579647, -1.736762, 1, 1, 1, 1, 1,
-1.712117, -1.451748, -4.449527, 1, 1, 1, 1, 1,
-1.711167, -0.2585077, -2.770892, 1, 1, 1, 1, 1,
-1.696321, -0.007871267, -2.451651, 1, 1, 1, 1, 1,
-1.689339, -0.7157817, -0.5823286, 1, 1, 1, 1, 1,
-1.681392, 0.3303081, -2.135339, 1, 1, 1, 1, 1,
-1.68042, 0.08168773, -1.798587, 1, 1, 1, 1, 1,
-1.676603, 0.07523046, -0.5967957, 1, 1, 1, 1, 1,
-1.670456, -0.6574727, -2.710383, 1, 1, 1, 1, 1,
-1.668959, 1.312141, -0.9168006, 1, 1, 1, 1, 1,
-1.64646, -0.4038014, -2.402479, 1, 1, 1, 1, 1,
-1.641629, 0.2062425, -2.412262, 1, 1, 1, 1, 1,
-1.637702, -0.2136888, -1.882533, 1, 1, 1, 1, 1,
-1.636345, -0.01280013, -0.8708947, 1, 1, 1, 1, 1,
-1.632766, 0.2273625, -1.229804, 1, 1, 1, 1, 1,
-1.616201, 0.3160516, -2.15079, 0, 0, 1, 1, 1,
-1.589201, -0.9193369, -2.308571, 1, 0, 0, 1, 1,
-1.588198, 0.7661474, -1.017199, 1, 0, 0, 1, 1,
-1.586414, -0.5488081, -0.3937762, 1, 0, 0, 1, 1,
-1.577838, 0.7299634, -0.5855038, 1, 0, 0, 1, 1,
-1.556959, 0.1067576, -2.007661, 1, 0, 0, 1, 1,
-1.550812, -0.6624372, -2.434009, 0, 0, 0, 1, 1,
-1.542349, 0.3695144, -2.688175, 0, 0, 0, 1, 1,
-1.540534, 1.840692, -0.8173342, 0, 0, 0, 1, 1,
-1.530182, 1.412152, -3.014104, 0, 0, 0, 1, 1,
-1.526047, -2.686049, -3.170939, 0, 0, 0, 1, 1,
-1.520519, 0.2373846, -2.322651, 0, 0, 0, 1, 1,
-1.517618, -1.270899, -2.748676, 0, 0, 0, 1, 1,
-1.496824, -0.3382961, -2.583534, 1, 1, 1, 1, 1,
-1.480851, 1.436659, 1.420172, 1, 1, 1, 1, 1,
-1.475818, -0.1495391, -1.338063, 1, 1, 1, 1, 1,
-1.468964, -0.9611827, -2.542732, 1, 1, 1, 1, 1,
-1.465554, 0.6342717, -1.724457, 1, 1, 1, 1, 1,
-1.448387, -1.46165, -2.983768, 1, 1, 1, 1, 1,
-1.447123, -1.496762, -2.123422, 1, 1, 1, 1, 1,
-1.438173, 0.2499183, -3.082015, 1, 1, 1, 1, 1,
-1.428481, -1.654616, -4.040005, 1, 1, 1, 1, 1,
-1.425175, 1.139409, -0.6950915, 1, 1, 1, 1, 1,
-1.419438, 1.21811, -0.2356399, 1, 1, 1, 1, 1,
-1.401052, 2.032095, -1.264418, 1, 1, 1, 1, 1,
-1.400416, 0.2476241, -0.8004598, 1, 1, 1, 1, 1,
-1.398094, -1.221799, -3.381345, 1, 1, 1, 1, 1,
-1.389013, 0.04757945, -2.731365, 1, 1, 1, 1, 1,
-1.378863, 1.600315, -2.001833, 0, 0, 1, 1, 1,
-1.37472, 0.1511352, -0.9784827, 1, 0, 0, 1, 1,
-1.360153, 0.1949496, -2.328504, 1, 0, 0, 1, 1,
-1.357712, -0.2511852, -1.065619, 1, 0, 0, 1, 1,
-1.354298, -0.6157776, -1.581746, 1, 0, 0, 1, 1,
-1.350649, -0.5340459, -1.430086, 1, 0, 0, 1, 1,
-1.343731, 1.086026, -0.112037, 0, 0, 0, 1, 1,
-1.334215, -0.9012117, -3.333179, 0, 0, 0, 1, 1,
-1.329163, -0.8449438, -2.088996, 0, 0, 0, 1, 1,
-1.32625, 0.5840231, -3.447044, 0, 0, 0, 1, 1,
-1.32422, -0.06179387, -1.217595, 0, 0, 0, 1, 1,
-1.310904, -2.114417, -2.514442, 0, 0, 0, 1, 1,
-1.309305, 1.914219, 1.707878, 0, 0, 0, 1, 1,
-1.305385, 1.877951, -0.3465768, 1, 1, 1, 1, 1,
-1.304716, -1.288594, -2.079041, 1, 1, 1, 1, 1,
-1.292447, -0.2439602, -2.387122, 1, 1, 1, 1, 1,
-1.287052, 0.01815487, -1.608265, 1, 1, 1, 1, 1,
-1.282344, 1.08469, -1.111454, 1, 1, 1, 1, 1,
-1.280962, 1.03061, 0.1472699, 1, 1, 1, 1, 1,
-1.278708, 1.173057, -0.6067358, 1, 1, 1, 1, 1,
-1.27471, -0.0890746, -1.045852, 1, 1, 1, 1, 1,
-1.270874, -1.759716, -2.406272, 1, 1, 1, 1, 1,
-1.269223, 0.17906, -2.463881, 1, 1, 1, 1, 1,
-1.262065, -0.08143427, -3.102956, 1, 1, 1, 1, 1,
-1.254997, -0.05338418, -1.996577, 1, 1, 1, 1, 1,
-1.254291, 0.1026055, -0.6937221, 1, 1, 1, 1, 1,
-1.253509, -0.4533648, -2.308956, 1, 1, 1, 1, 1,
-1.249356, -0.640543, -1.313851, 1, 1, 1, 1, 1,
-1.247048, -0.4445291, -1.868634, 0, 0, 1, 1, 1,
-1.239173, 0.4698848, -0.4484713, 1, 0, 0, 1, 1,
-1.228755, -2.153259, -0.4172399, 1, 0, 0, 1, 1,
-1.227131, -1.538029, -2.463941, 1, 0, 0, 1, 1,
-1.226343, 1.333321, -2.124388, 1, 0, 0, 1, 1,
-1.225317, 1.02676, 0.8404675, 1, 0, 0, 1, 1,
-1.223305, -0.5020692, -0.2895262, 0, 0, 0, 1, 1,
-1.219594, -1.22876, -2.468357, 0, 0, 0, 1, 1,
-1.218173, -0.8838392, -2.398372, 0, 0, 0, 1, 1,
-1.214505, -0.6836206, -1.36783, 0, 0, 0, 1, 1,
-1.211036, 1.407625, -0.131686, 0, 0, 0, 1, 1,
-1.207465, 0.7594396, -0.2090971, 0, 0, 0, 1, 1,
-1.20628, -0.7392077, -3.916925, 0, 0, 0, 1, 1,
-1.190289, -1.988127, -3.231806, 1, 1, 1, 1, 1,
-1.187669, -0.2477159, -1.724916, 1, 1, 1, 1, 1,
-1.185812, 0.6283352, -0.6899462, 1, 1, 1, 1, 1,
-1.184964, 0.3090779, -1.77545, 1, 1, 1, 1, 1,
-1.182978, -0.2912786, -2.439412, 1, 1, 1, 1, 1,
-1.176694, -0.9143262, -3.401286, 1, 1, 1, 1, 1,
-1.169526, -0.2726859, -1.328718, 1, 1, 1, 1, 1,
-1.164608, 0.1482013, -2.269527, 1, 1, 1, 1, 1,
-1.162445, 0.1932506, 2.083528, 1, 1, 1, 1, 1,
-1.160802, 1.389418, -1.442317, 1, 1, 1, 1, 1,
-1.150764, 1.215098, -0.580615, 1, 1, 1, 1, 1,
-1.143752, -1.31901, -2.484915, 1, 1, 1, 1, 1,
-1.140648, 1.06078, -0.6391779, 1, 1, 1, 1, 1,
-1.138421, 0.2029359, -1.798007, 1, 1, 1, 1, 1,
-1.136977, -0.1646298, -0.6449713, 1, 1, 1, 1, 1,
-1.134967, 0.02640396, -3.893962, 0, 0, 1, 1, 1,
-1.133352, -0.9169841, -2.016757, 1, 0, 0, 1, 1,
-1.13055, 0.3298676, -0.9337253, 1, 0, 0, 1, 1,
-1.125886, -1.212676, -2.246359, 1, 0, 0, 1, 1,
-1.120579, -1.023396, -2.5811, 1, 0, 0, 1, 1,
-1.10682, -1.084544, -4.531459, 1, 0, 0, 1, 1,
-1.101728, 0.8338805, -2.013819, 0, 0, 0, 1, 1,
-1.094349, 1.2782, 0.3568327, 0, 0, 0, 1, 1,
-1.088082, 0.3081988, -1.099191, 0, 0, 0, 1, 1,
-1.087705, -1.196952, -3.9843, 0, 0, 0, 1, 1,
-1.078941, 0.4446254, -2.338412, 0, 0, 0, 1, 1,
-1.076844, -0.633388, -4.825881, 0, 0, 0, 1, 1,
-1.076156, 0.5564782, -2.783963, 0, 0, 0, 1, 1,
-1.073725, -0.8012518, -2.276151, 1, 1, 1, 1, 1,
-1.072305, -0.1149479, -1.552596, 1, 1, 1, 1, 1,
-1.055497, -1.942461, -2.861208, 1, 1, 1, 1, 1,
-1.045346, -0.4841529, -1.457142, 1, 1, 1, 1, 1,
-1.04334, 3.323853, -2.237592, 1, 1, 1, 1, 1,
-1.039204, 2.527723, -2.157057, 1, 1, 1, 1, 1,
-1.037315, -0.6695903, -2.53672, 1, 1, 1, 1, 1,
-1.031394, -0.6769682, -3.479638, 1, 1, 1, 1, 1,
-1.028661, 0.8076689, 1.090782, 1, 1, 1, 1, 1,
-1.023445, -0.9826901, -1.896462, 1, 1, 1, 1, 1,
-1.021036, 2.552163, -0.7215391, 1, 1, 1, 1, 1,
-1.014243, -1.181641, -2.104404, 1, 1, 1, 1, 1,
-1.014158, -0.124455, 0.5718629, 1, 1, 1, 1, 1,
-1.010562, -1.369975, -1.49437, 1, 1, 1, 1, 1,
-1.007406, 1.080037, -2.766692, 1, 1, 1, 1, 1,
-1.002395, 1.113878, 1.010567, 0, 0, 1, 1, 1,
-0.9960249, -0.9668394, -2.705863, 1, 0, 0, 1, 1,
-0.9886094, 1.645226, -0.3260133, 1, 0, 0, 1, 1,
-0.984194, -0.8074787, -2.987283, 1, 0, 0, 1, 1,
-0.974716, 0.09061015, 0.1068617, 1, 0, 0, 1, 1,
-0.9706116, 0.7271152, -0.5598329, 1, 0, 0, 1, 1,
-0.9659016, 0.7041891, 0.9152804, 0, 0, 0, 1, 1,
-0.964803, -0.9743071, -1.949272, 0, 0, 0, 1, 1,
-0.9597329, 0.4106249, -1.358696, 0, 0, 0, 1, 1,
-0.9573434, 0.08604632, -1.839091, 0, 0, 0, 1, 1,
-0.9483425, -0.1797286, -0.2965429, 0, 0, 0, 1, 1,
-0.9473447, -0.5217195, -0.2487282, 0, 0, 0, 1, 1,
-0.9466035, -1.620073, -2.996871, 0, 0, 0, 1, 1,
-0.9447907, 0.8164281, -0.07833825, 1, 1, 1, 1, 1,
-0.9438511, 1.023221, -0.1390104, 1, 1, 1, 1, 1,
-0.9206406, 1.256073, 0.06273337, 1, 1, 1, 1, 1,
-0.9204453, 0.08364554, -1.575729, 1, 1, 1, 1, 1,
-0.9195988, -0.2958995, -3.016012, 1, 1, 1, 1, 1,
-0.9111018, -0.008180209, -1.311415, 1, 1, 1, 1, 1,
-0.9097984, -1.684432, -2.753107, 1, 1, 1, 1, 1,
-0.9007989, 0.545778, -1.625879, 1, 1, 1, 1, 1,
-0.8933765, -0.9812751, -1.038846, 1, 1, 1, 1, 1,
-0.8907924, 0.1974158, -3.218595, 1, 1, 1, 1, 1,
-0.8905547, 0.514715, -0.6077169, 1, 1, 1, 1, 1,
-0.8836447, -0.7753622, -3.641222, 1, 1, 1, 1, 1,
-0.8814787, -1.504259, -3.1345, 1, 1, 1, 1, 1,
-0.8781483, -0.8785281, -2.582606, 1, 1, 1, 1, 1,
-0.8757358, 0.7650278, -1.024047, 1, 1, 1, 1, 1,
-0.8756105, -0.4106652, -1.419559, 0, 0, 1, 1, 1,
-0.8745248, -0.7457637, -0.5495318, 1, 0, 0, 1, 1,
-0.8666229, 1.534236, -0.46627, 1, 0, 0, 1, 1,
-0.8644234, -0.2224772, -1.226325, 1, 0, 0, 1, 1,
-0.8609574, 0.2816793, -2.384158, 1, 0, 0, 1, 1,
-0.8546077, -0.2917646, -2.038647, 1, 0, 0, 1, 1,
-0.8541977, -1.266424, -5.155698, 0, 0, 0, 1, 1,
-0.8523673, 0.9755015, -1.330018, 0, 0, 0, 1, 1,
-0.8504878, -1.913521, -3.714082, 0, 0, 0, 1, 1,
-0.8426186, 0.3755672, -1.239919, 0, 0, 0, 1, 1,
-0.8300827, -1.720989, -3.636068, 0, 0, 0, 1, 1,
-0.8279939, -0.1942906, -2.478825, 0, 0, 0, 1, 1,
-0.8195925, -1.159046, -3.393896, 0, 0, 0, 1, 1,
-0.8153214, 0.2814755, 0.1080737, 1, 1, 1, 1, 1,
-0.8138099, -0.0987692, -2.43809, 1, 1, 1, 1, 1,
-0.8074378, -0.9621875, -2.733268, 1, 1, 1, 1, 1,
-0.8043698, 0.5510256, 0.5988244, 1, 1, 1, 1, 1,
-0.8027555, 0.02644188, -2.584599, 1, 1, 1, 1, 1,
-0.8003916, 0.3999669, -0.5150692, 1, 1, 1, 1, 1,
-0.8002158, -0.3315783, -3.384769, 1, 1, 1, 1, 1,
-0.7988204, -0.3070045, -3.002372, 1, 1, 1, 1, 1,
-0.7963979, -0.6928228, -2.934114, 1, 1, 1, 1, 1,
-0.7958669, -0.4765426, -2.473166, 1, 1, 1, 1, 1,
-0.7903258, -0.09137826, -1.024199, 1, 1, 1, 1, 1,
-0.7871733, 0.8160816, 0.04504899, 1, 1, 1, 1, 1,
-0.7771332, 0.006065363, -0.2354617, 1, 1, 1, 1, 1,
-0.7767069, -0.5550835, -1.901789, 1, 1, 1, 1, 1,
-0.7753058, 0.2446347, -1.424173, 1, 1, 1, 1, 1,
-0.7751659, 0.6773547, 0.3180788, 0, 0, 1, 1, 1,
-0.7715539, -0.3059024, -1.363194, 1, 0, 0, 1, 1,
-0.7690756, 0.6284869, -0.4296419, 1, 0, 0, 1, 1,
-0.768131, -0.967043, -0.9519004, 1, 0, 0, 1, 1,
-0.7652943, 0.4180576, -0.2289024, 1, 0, 0, 1, 1,
-0.7650717, -0.2375673, -1.137436, 1, 0, 0, 1, 1,
-0.7633833, 1.687044, 0.0497035, 0, 0, 0, 1, 1,
-0.7488361, 0.4824697, -2.531861, 0, 0, 0, 1, 1,
-0.7482781, -0.9463927, -2.272602, 0, 0, 0, 1, 1,
-0.7449257, 0.9606858, 0.6040121, 0, 0, 0, 1, 1,
-0.7404813, 0.3916385, -0.06606483, 0, 0, 0, 1, 1,
-0.7394382, 1.193031, 0.2735706, 0, 0, 0, 1, 1,
-0.737781, 1.499452, 0.6916872, 0, 0, 0, 1, 1,
-0.7251039, -0.248777, -1.911257, 1, 1, 1, 1, 1,
-0.720354, -0.8263733, -3.899779, 1, 1, 1, 1, 1,
-0.7199755, -0.05644099, -3.16255, 1, 1, 1, 1, 1,
-0.7176939, 0.4129613, -0.1670362, 1, 1, 1, 1, 1,
-0.7097203, 1.446974, -1.315423, 1, 1, 1, 1, 1,
-0.7076376, 1.733098, -2.105811, 1, 1, 1, 1, 1,
-0.7073976, 0.3212387, -1.833127, 1, 1, 1, 1, 1,
-0.7045149, 0.6086454, -1.480932, 1, 1, 1, 1, 1,
-0.6994428, 1.991382, 0.2934354, 1, 1, 1, 1, 1,
-0.6976391, 0.6593682, -1.036412, 1, 1, 1, 1, 1,
-0.6970491, -0.4972416, -0.08228156, 1, 1, 1, 1, 1,
-0.696501, -1.997467, -2.924386, 1, 1, 1, 1, 1,
-0.6923041, 0.01411933, -1.594984, 1, 1, 1, 1, 1,
-0.6910629, -0.7166122, -1.007651, 1, 1, 1, 1, 1,
-0.6906173, 0.4387977, -0.3846394, 1, 1, 1, 1, 1,
-0.6829225, -0.411671, -5.300092, 0, 0, 1, 1, 1,
-0.6804357, -1.902492, -3.605198, 1, 0, 0, 1, 1,
-0.6724115, 0.3738928, -2.051008, 1, 0, 0, 1, 1,
-0.670553, 0.3175139, -2.63132, 1, 0, 0, 1, 1,
-0.6705415, -0.7597201, -3.035329, 1, 0, 0, 1, 1,
-0.6623939, 1.819359, -0.4865784, 1, 0, 0, 1, 1,
-0.6622698, 0.395166, -0.7790891, 0, 0, 0, 1, 1,
-0.6603763, 0.2127057, 1.139542, 0, 0, 0, 1, 1,
-0.6592416, 1.264638, 3.35083, 0, 0, 0, 1, 1,
-0.6569003, 1.041531, -0.949372, 0, 0, 0, 1, 1,
-0.6523808, 1.007383, -1.080724, 0, 0, 0, 1, 1,
-0.6522189, 1.82647, 0.9233367, 0, 0, 0, 1, 1,
-0.6511952, 0.8799869, 0.287706, 0, 0, 0, 1, 1,
-0.6493865, -0.4762349, -3.245359, 1, 1, 1, 1, 1,
-0.64455, -0.622292, -3.749293, 1, 1, 1, 1, 1,
-0.63863, -0.4667602, -2.738831, 1, 1, 1, 1, 1,
-0.6379017, -0.8535544, -1.737799, 1, 1, 1, 1, 1,
-0.6327857, 0.9034847, -1.377234, 1, 1, 1, 1, 1,
-0.6289321, 1.39255, 0.0540996, 1, 1, 1, 1, 1,
-0.6281623, -1.121741, -2.097039, 1, 1, 1, 1, 1,
-0.6277968, -0.5540385, -2.6429, 1, 1, 1, 1, 1,
-0.6267945, 1.456878, -0.9069211, 1, 1, 1, 1, 1,
-0.6219141, -1.566606, -0.3228154, 1, 1, 1, 1, 1,
-0.6217296, -0.7599875, -1.781815, 1, 1, 1, 1, 1,
-0.6196409, -0.2735642, 0.03541038, 1, 1, 1, 1, 1,
-0.6161198, 1.108955, -0.396385, 1, 1, 1, 1, 1,
-0.6134348, -0.6428531, -0.7857389, 1, 1, 1, 1, 1,
-0.6129706, 1.798492, -0.3397723, 1, 1, 1, 1, 1,
-0.61098, -0.3324762, -1.712784, 0, 0, 1, 1, 1,
-0.6105934, 1.009434, -0.4594356, 1, 0, 0, 1, 1,
-0.6092755, 0.6951891, -0.6677469, 1, 0, 0, 1, 1,
-0.6087112, -1.360002, -1.055811, 1, 0, 0, 1, 1,
-0.6042249, -0.2313105, -2.08222, 1, 0, 0, 1, 1,
-0.5997966, -0.4263636, -2.995398, 1, 0, 0, 1, 1,
-0.5982737, -0.2169828, -2.242251, 0, 0, 0, 1, 1,
-0.5968975, -1.43899, -3.329919, 0, 0, 0, 1, 1,
-0.5938084, 2.418427, -0.4827003, 0, 0, 0, 1, 1,
-0.586926, -1.242507, -1.579593, 0, 0, 0, 1, 1,
-0.5845156, 1.2562, 0.04946852, 0, 0, 0, 1, 1,
-0.5837724, -0.1587428, -1.615389, 0, 0, 0, 1, 1,
-0.5797806, -1.090083, -1.235169, 0, 0, 0, 1, 1,
-0.5768851, 0.04103743, -1.382168, 1, 1, 1, 1, 1,
-0.572171, 0.3124938, -3.299313, 1, 1, 1, 1, 1,
-0.5716339, 0.4776902, -1.790854, 1, 1, 1, 1, 1,
-0.5660965, -0.9774681, -2.481079, 1, 1, 1, 1, 1,
-0.5659087, 0.00994813, -1.796074, 1, 1, 1, 1, 1,
-0.5624487, 0.3791054, -0.4083838, 1, 1, 1, 1, 1,
-0.5576824, 1.532517, -0.5008927, 1, 1, 1, 1, 1,
-0.5503986, -0.3622749, -2.109122, 1, 1, 1, 1, 1,
-0.5502381, 0.01317243, -2.063738, 1, 1, 1, 1, 1,
-0.5448995, -2.039729, -4.563308, 1, 1, 1, 1, 1,
-0.5376993, 0.7285132, -2.29062, 1, 1, 1, 1, 1,
-0.5372519, 0.2221604, -2.305576, 1, 1, 1, 1, 1,
-0.5362834, 1.183036, -0.8998359, 1, 1, 1, 1, 1,
-0.5235379, -1.565878, -2.755736, 1, 1, 1, 1, 1,
-0.5154031, -0.06189199, -2.503778, 1, 1, 1, 1, 1,
-0.512917, -0.9025396, -4.270092, 0, 0, 1, 1, 1,
-0.51256, -0.2920876, -2.131354, 1, 0, 0, 1, 1,
-0.5093433, -0.6299319, -0.5266729, 1, 0, 0, 1, 1,
-0.505984, 0.8460261, -0.7296755, 1, 0, 0, 1, 1,
-0.5053205, 1.102797, -1.584478, 1, 0, 0, 1, 1,
-0.5034795, 0.6453431, -1.518298, 1, 0, 0, 1, 1,
-0.5003377, -0.4306831, -1.376333, 0, 0, 0, 1, 1,
-0.4994618, 0.7953958, 0.1034401, 0, 0, 0, 1, 1,
-0.4992115, 0.9930014, -1.775295, 0, 0, 0, 1, 1,
-0.4976387, -0.4314958, -3.737378, 0, 0, 0, 1, 1,
-0.4880737, 0.1820071, -1.550888, 0, 0, 0, 1, 1,
-0.4877271, -0.7028828, -3.162719, 0, 0, 0, 1, 1,
-0.4873727, -0.4946558, -3.867892, 0, 0, 0, 1, 1,
-0.4839421, 0.9763464, -2.277314, 1, 1, 1, 1, 1,
-0.4816481, 0.5391444, 0.1680318, 1, 1, 1, 1, 1,
-0.4670682, -1.090854, -2.027851, 1, 1, 1, 1, 1,
-0.4629044, 0.04293797, -0.6696175, 1, 1, 1, 1, 1,
-0.4628303, -1.185436, -4.058399, 1, 1, 1, 1, 1,
-0.460363, 0.8992474, -0.2870376, 1, 1, 1, 1, 1,
-0.4598062, -0.6598302, -3.173208, 1, 1, 1, 1, 1,
-0.4587159, 0.3184457, -1.130959, 1, 1, 1, 1, 1,
-0.4551608, -1.051718, -2.550508, 1, 1, 1, 1, 1,
-0.4517791, 0.4742501, -0.1385393, 1, 1, 1, 1, 1,
-0.4502945, 1.539385, -0.9989824, 1, 1, 1, 1, 1,
-0.4481767, -1.463958, -1.830688, 1, 1, 1, 1, 1,
-0.448039, 0.9991217, -0.9497424, 1, 1, 1, 1, 1,
-0.4467007, 1.471328, -1.203739, 1, 1, 1, 1, 1,
-0.4438638, -0.1016138, -1.580178, 1, 1, 1, 1, 1,
-0.4413515, 2.179521, -1.194937, 0, 0, 1, 1, 1,
-0.4396545, -0.1511549, -1.364612, 1, 0, 0, 1, 1,
-0.4382966, 0.5398814, -0.8647631, 1, 0, 0, 1, 1,
-0.4370179, -0.7645323, -2.598426, 1, 0, 0, 1, 1,
-0.4339203, 2.198776, 0.2638759, 1, 0, 0, 1, 1,
-0.4333952, 0.7575831, 0.1538735, 1, 0, 0, 1, 1,
-0.4330533, -1.006237, -5.113575, 0, 0, 0, 1, 1,
-0.4314729, 0.7855274, 0.8363838, 0, 0, 0, 1, 1,
-0.4311574, 1.152869, -0.4647092, 0, 0, 0, 1, 1,
-0.42646, -1.454189, -3.23259, 0, 0, 0, 1, 1,
-0.4248176, -1.377776, -2.869523, 0, 0, 0, 1, 1,
-0.4234311, -1.878948, -3.638306, 0, 0, 0, 1, 1,
-0.4232932, 0.4364926, -2.598873, 0, 0, 0, 1, 1,
-0.4230024, 0.242254, -0.3512042, 1, 1, 1, 1, 1,
-0.4225455, 0.1410699, -1.189229, 1, 1, 1, 1, 1,
-0.422062, -1.063346, -3.408818, 1, 1, 1, 1, 1,
-0.4215734, -0.1121493, -1.58803, 1, 1, 1, 1, 1,
-0.4206451, -0.04083573, -0.9847189, 1, 1, 1, 1, 1,
-0.4194848, 0.4472135, -0.4817117, 1, 1, 1, 1, 1,
-0.4190421, -1.599706, -3.309622, 1, 1, 1, 1, 1,
-0.4151458, -0.8257031, -2.785117, 1, 1, 1, 1, 1,
-0.4132851, 0.3493565, 1.053247, 1, 1, 1, 1, 1,
-0.4092372, 0.6160551, -1.107822, 1, 1, 1, 1, 1,
-0.4083566, 1.124931, -0.2615741, 1, 1, 1, 1, 1,
-0.4080772, 0.0110116, -0.5298672, 1, 1, 1, 1, 1,
-0.4054068, 0.8446832, 0.2880377, 1, 1, 1, 1, 1,
-0.3935627, -1.168661, -2.126029, 1, 1, 1, 1, 1,
-0.3909153, 0.466554, -0.6364816, 1, 1, 1, 1, 1,
-0.3902672, 0.2115629, -1.079571, 0, 0, 1, 1, 1,
-0.3849618, 1.331806, -1.990837, 1, 0, 0, 1, 1,
-0.3837087, -1.053622, -2.617826, 1, 0, 0, 1, 1,
-0.3833161, 1.935936, -0.349704, 1, 0, 0, 1, 1,
-0.3707695, -0.9522032, -3.732816, 1, 0, 0, 1, 1,
-0.3635556, 1.224351, 0.9543002, 1, 0, 0, 1, 1,
-0.3613868, -0.3630669, -2.600969, 0, 0, 0, 1, 1,
-0.3582942, 0.8221739, -0.9515128, 0, 0, 0, 1, 1,
-0.3484271, 2.439596, 0.07239363, 0, 0, 0, 1, 1,
-0.3475727, -0.2442701, -3.010889, 0, 0, 0, 1, 1,
-0.3470507, -0.841031, -2.207443, 0, 0, 0, 1, 1,
-0.3439858, 1.200098, -1.745734, 0, 0, 0, 1, 1,
-0.3420911, -0.8383928, -2.947575, 0, 0, 0, 1, 1,
-0.3375036, 0.5746457, -0.8168558, 1, 1, 1, 1, 1,
-0.3330886, 1.345311, -1.719015, 1, 1, 1, 1, 1,
-0.3313299, 1.111905, -0.1798965, 1, 1, 1, 1, 1,
-0.3305374, -0.1688449, -4.154926, 1, 1, 1, 1, 1,
-0.3288499, 1.026791, 0.7092348, 1, 1, 1, 1, 1,
-0.3282559, -0.04044987, -1.398741, 1, 1, 1, 1, 1,
-0.3267747, 0.3101697, -2.492376, 1, 1, 1, 1, 1,
-0.3251174, 1.212409, -0.4146347, 1, 1, 1, 1, 1,
-0.3239989, -0.4733786, -1.511911, 1, 1, 1, 1, 1,
-0.3207628, 0.1818436, -1.434519, 1, 1, 1, 1, 1,
-0.3164266, 0.6822159, -1.311967, 1, 1, 1, 1, 1,
-0.3151877, 0.3447083, -1.437682, 1, 1, 1, 1, 1,
-0.313632, 0.2659875, -1.591356, 1, 1, 1, 1, 1,
-0.3125767, 0.9665043, -1.55003, 1, 1, 1, 1, 1,
-0.3118618, -1.301912, -0.9582429, 1, 1, 1, 1, 1,
-0.3077943, -0.9675553, -2.43016, 0, 0, 1, 1, 1,
-0.3053819, 0.3393821, -0.7402508, 1, 0, 0, 1, 1,
-0.3040756, 2.370599, 0.8570187, 1, 0, 0, 1, 1,
-0.3026791, -0.8557013, -2.635013, 1, 0, 0, 1, 1,
-0.3017626, -0.2290517, -3.750902, 1, 0, 0, 1, 1,
-0.297756, -0.7331944, -3.540412, 1, 0, 0, 1, 1,
-0.2969684, -0.5819622, -3.331473, 0, 0, 0, 1, 1,
-0.2836108, -0.511124, -3.042721, 0, 0, 0, 1, 1,
-0.2835271, 1.098624, -0.2728663, 0, 0, 0, 1, 1,
-0.282012, 0.7087249, -0.07828657, 0, 0, 0, 1, 1,
-0.272995, 1.303464, -0.737828, 0, 0, 0, 1, 1,
-0.2715518, 0.2433399, -0.7783629, 0, 0, 0, 1, 1,
-0.2710839, -0.3489878, -3.077742, 0, 0, 0, 1, 1,
-0.271054, 0.09594108, -1.184387, 1, 1, 1, 1, 1,
-0.2707324, 0.5176364, -0.06506863, 1, 1, 1, 1, 1,
-0.2681637, -0.8232111, -3.027499, 1, 1, 1, 1, 1,
-0.2644378, 0.5429479, -0.896861, 1, 1, 1, 1, 1,
-0.259767, 0.590691, -0.6561965, 1, 1, 1, 1, 1,
-0.2589959, -0.6282182, -2.469817, 1, 1, 1, 1, 1,
-0.2545898, -0.05656809, -1.592812, 1, 1, 1, 1, 1,
-0.249145, -0.1184142, -0.3080296, 1, 1, 1, 1, 1,
-0.2474772, -0.8281746, -3.216192, 1, 1, 1, 1, 1,
-0.2463725, 0.8453193, -1.579237, 1, 1, 1, 1, 1,
-0.2430975, -0.4940107, -2.982859, 1, 1, 1, 1, 1,
-0.2428402, 1.066109, -0.3794667, 1, 1, 1, 1, 1,
-0.240553, -0.4230118, -2.51709, 1, 1, 1, 1, 1,
-0.2384612, 0.8220975, -0.08596222, 1, 1, 1, 1, 1,
-0.2336408, -1.757239, -2.658236, 1, 1, 1, 1, 1,
-0.2295498, 0.3884552, -1.413032, 0, 0, 1, 1, 1,
-0.2238482, -0.9577794, -2.939291, 1, 0, 0, 1, 1,
-0.2226446, 0.7611057, 0.8007041, 1, 0, 0, 1, 1,
-0.218552, -1.226943, -2.244296, 1, 0, 0, 1, 1,
-0.2182824, 0.977339, -0.2176645, 1, 0, 0, 1, 1,
-0.2179245, 1.574777, -0.01244113, 1, 0, 0, 1, 1,
-0.217881, -1.285908, -2.574909, 0, 0, 0, 1, 1,
-0.2176621, -2.361945, -2.609673, 0, 0, 0, 1, 1,
-0.2150304, -1.002169, -1.849454, 0, 0, 0, 1, 1,
-0.2136121, 1.422436, 2.227284, 0, 0, 0, 1, 1,
-0.2133898, -0.7789947, -2.803571, 0, 0, 0, 1, 1,
-0.2132355, -0.6389254, -3.788468, 0, 0, 0, 1, 1,
-0.2050106, -0.2037135, -1.097396, 0, 0, 0, 1, 1,
-0.2025227, -0.2067858, -1.529799, 1, 1, 1, 1, 1,
-0.2017644, 1.116779, -0.8628914, 1, 1, 1, 1, 1,
-0.2009991, -1.760422, -0.7825255, 1, 1, 1, 1, 1,
-0.2007651, 0.1654076, -3.907653, 1, 1, 1, 1, 1,
-0.1959746, -0.9186851, -3.297685, 1, 1, 1, 1, 1,
-0.1930635, -0.3153533, -2.42394, 1, 1, 1, 1, 1,
-0.1920119, -0.5199884, -2.998041, 1, 1, 1, 1, 1,
-0.1906128, -1.289947, -2.731874, 1, 1, 1, 1, 1,
-0.1894367, -0.5185615, -1.131207, 1, 1, 1, 1, 1,
-0.1879371, -0.2214445, -3.961484, 1, 1, 1, 1, 1,
-0.1833843, -0.7294929, -1.489617, 1, 1, 1, 1, 1,
-0.1825569, 1.401492, 0.06308079, 1, 1, 1, 1, 1,
-0.1816965, -0.2413317, -3.659595, 1, 1, 1, 1, 1,
-0.1806125, 2.017012, -0.04477732, 1, 1, 1, 1, 1,
-0.1789226, -0.1160085, -0.9398382, 1, 1, 1, 1, 1,
-0.175405, -0.6707277, -2.424651, 0, 0, 1, 1, 1,
-0.1731671, -1.396655, -2.190466, 1, 0, 0, 1, 1,
-0.1700314, -1.40588, -1.279305, 1, 0, 0, 1, 1,
-0.1695218, -0.4489553, -3.982073, 1, 0, 0, 1, 1,
-0.1657781, -0.005794811, 0.2449664, 1, 0, 0, 1, 1,
-0.1652565, -0.5440118, -1.376469, 1, 0, 0, 1, 1,
-0.1606473, 2.267298, -0.4502938, 0, 0, 0, 1, 1,
-0.1584442, 0.1929279, -0.7462599, 0, 0, 0, 1, 1,
-0.1575664, 1.224522, -0.3723975, 0, 0, 0, 1, 1,
-0.1558264, -1.073212, -2.070702, 0, 0, 0, 1, 1,
-0.1516711, -1.269237, -3.004194, 0, 0, 0, 1, 1,
-0.1501224, 2.180223, -1.016962, 0, 0, 0, 1, 1,
-0.1465604, 0.5132096, 1.413448, 0, 0, 0, 1, 1,
-0.1461258, 0.9490622, -0.7128952, 1, 1, 1, 1, 1,
-0.141194, -0.1554715, -2.325871, 1, 1, 1, 1, 1,
-0.1338246, 1.316941, -0.230536, 1, 1, 1, 1, 1,
-0.1329707, -0.1939239, -0.7751887, 1, 1, 1, 1, 1,
-0.1326667, -0.1801073, -1.042559, 1, 1, 1, 1, 1,
-0.1310014, 0.8182151, -0.6316779, 1, 1, 1, 1, 1,
-0.1289293, -0.7100382, -1.223019, 1, 1, 1, 1, 1,
-0.1239501, -0.709233, -2.741501, 1, 1, 1, 1, 1,
-0.1162046, -1.063207, -4.27768, 1, 1, 1, 1, 1,
-0.113948, 1.515013, 0.2484903, 1, 1, 1, 1, 1,
-0.1138424, 1.050951, -0.2776837, 1, 1, 1, 1, 1,
-0.1096867, -2.111163, -4.140103, 1, 1, 1, 1, 1,
-0.1086934, 1.688604, -0.4022208, 1, 1, 1, 1, 1,
-0.108586, -0.2379532, -2.304178, 1, 1, 1, 1, 1,
-0.1078448, 0.1149426, -0.6113782, 1, 1, 1, 1, 1,
-0.1076325, -0.9290929, -4.981161, 0, 0, 1, 1, 1,
-0.1074172, 0.1847412, 1.778239, 1, 0, 0, 1, 1,
-0.1006532, -0.5103841, -3.292877, 1, 0, 0, 1, 1,
-0.09848259, 0.3371517, 1.876894, 1, 0, 0, 1, 1,
-0.07022372, -0.3263607, -3.132286, 1, 0, 0, 1, 1,
-0.06878423, 0.4982238, 0.1072952, 1, 0, 0, 1, 1,
-0.06498691, 0.6282782, -0.4569855, 0, 0, 0, 1, 1,
-0.06328638, 0.9729658, 1.47238, 0, 0, 0, 1, 1,
-0.0612381, -0.7800551, -2.198284, 0, 0, 0, 1, 1,
-0.06048979, -0.905697, -3.348481, 0, 0, 0, 1, 1,
-0.05979535, -0.7970977, -3.035658, 0, 0, 0, 1, 1,
-0.05777974, 0.06922185, -1.175835, 0, 0, 0, 1, 1,
-0.05633317, -0.3978105, -3.621648, 0, 0, 0, 1, 1,
-0.05620669, 0.09181406, -0.3343076, 1, 1, 1, 1, 1,
-0.05615708, 0.4682371, 1.279703, 1, 1, 1, 1, 1,
-0.05414978, 2.124086, -1.153692, 1, 1, 1, 1, 1,
-0.05398419, -0.5986822, -2.781891, 1, 1, 1, 1, 1,
-0.05107958, -0.2532152, -1.388155, 1, 1, 1, 1, 1,
-0.03227586, -0.1124144, -2.127322, 1, 1, 1, 1, 1,
-0.03224649, 0.9697962, 0.5740177, 1, 1, 1, 1, 1,
-0.02033293, 0.1084403, 1.000483, 1, 1, 1, 1, 1,
-0.01276444, -0.3877872, -2.579225, 1, 1, 1, 1, 1,
-0.01183594, 0.3021248, 1.370989, 1, 1, 1, 1, 1,
-0.01149462, -1.227432, -4.247674, 1, 1, 1, 1, 1,
-0.01028082, -0.2034093, -1.386943, 1, 1, 1, 1, 1,
-0.009113946, -0.9297677, -2.033164, 1, 1, 1, 1, 1,
-0.003245117, 2.784183, -0.1458302, 1, 1, 1, 1, 1,
0.0009637516, 0.8427321, -0.6970255, 1, 1, 1, 1, 1,
0.004737122, -0.6450474, 2.449849, 0, 0, 1, 1, 1,
0.006038013, 0.6765708, 0.9817706, 1, 0, 0, 1, 1,
0.006143789, -0.2675636, 3.760749, 1, 0, 0, 1, 1,
0.007336978, 1.26097, -0.7544933, 1, 0, 0, 1, 1,
0.00880149, 1.513847, 1.069099, 1, 0, 0, 1, 1,
0.01187428, -1.872766, 3.143382, 1, 0, 0, 1, 1,
0.01559314, 0.6210008, -1.148031, 0, 0, 0, 1, 1,
0.01571568, 1.458475, 0.5639462, 0, 0, 0, 1, 1,
0.01783356, 0.6055497, 1.035545, 0, 0, 0, 1, 1,
0.01831762, -0.5682018, 2.321742, 0, 0, 0, 1, 1,
0.0243469, -1.148874, 2.364495, 0, 0, 0, 1, 1,
0.02626041, 0.6624653, 1.166189, 0, 0, 0, 1, 1,
0.02741234, 0.09965616, -0.1434844, 0, 0, 0, 1, 1,
0.03207384, 0.5849072, -0.990114, 1, 1, 1, 1, 1,
0.03232696, -1.903693, 3.031304, 1, 1, 1, 1, 1,
0.03251098, -0.7876887, 3.286667, 1, 1, 1, 1, 1,
0.032741, -0.4477549, 4.925442, 1, 1, 1, 1, 1,
0.033335, -0.6215864, 3.175654, 1, 1, 1, 1, 1,
0.03505525, 0.02196137, 0.1482429, 1, 1, 1, 1, 1,
0.04049299, -2.297204, 3.242689, 1, 1, 1, 1, 1,
0.04058938, 0.2405324, 1.778291, 1, 1, 1, 1, 1,
0.04304455, -0.4393139, 3.804599, 1, 1, 1, 1, 1,
0.0439337, 0.6870665, 1.616006, 1, 1, 1, 1, 1,
0.05001973, 1.083098, 1.16632, 1, 1, 1, 1, 1,
0.05137254, -1.311769, 1.928373, 1, 1, 1, 1, 1,
0.05275092, 2.123957, -0.6329849, 1, 1, 1, 1, 1,
0.05625356, 1.218002, 1.555813, 1, 1, 1, 1, 1,
0.05811539, -0.1710933, 2.624083, 1, 1, 1, 1, 1,
0.05876542, -1.01902, 3.871826, 0, 0, 1, 1, 1,
0.06052515, -0.5293286, 2.667621, 1, 0, 0, 1, 1,
0.0608259, 1.449647, -1.014663, 1, 0, 0, 1, 1,
0.06319156, -1.785713, 2.203924, 1, 0, 0, 1, 1,
0.06380238, -0.9645652, 2.707339, 1, 0, 0, 1, 1,
0.06555955, -0.804029, 2.746717, 1, 0, 0, 1, 1,
0.07126512, 1.116392, -1.305788, 0, 0, 0, 1, 1,
0.07129773, 0.3598667, -0.6538974, 0, 0, 0, 1, 1,
0.07416454, -0.3617696, 3.372064, 0, 0, 0, 1, 1,
0.07678944, -0.2153577, 2.375679, 0, 0, 0, 1, 1,
0.08119407, 0.4503921, -0.7304021, 0, 0, 0, 1, 1,
0.08143481, -1.649498, 2.863035, 0, 0, 0, 1, 1,
0.08306907, -1.561723, 2.170698, 0, 0, 0, 1, 1,
0.08352137, -1.018086, 2.02499, 1, 1, 1, 1, 1,
0.08410712, 1.152917, 0.226125, 1, 1, 1, 1, 1,
0.0853677, -0.748324, 4.485144, 1, 1, 1, 1, 1,
0.08749188, 0.1726555, -0.03343023, 1, 1, 1, 1, 1,
0.08899309, -0.8134722, 3.880136, 1, 1, 1, 1, 1,
0.09164611, -0.08105429, 2.949529, 1, 1, 1, 1, 1,
0.09184024, 0.3518179, 1.119464, 1, 1, 1, 1, 1,
0.09230358, -0.9166154, 1.990945, 1, 1, 1, 1, 1,
0.09401216, -2.65741, 2.562751, 1, 1, 1, 1, 1,
0.09883911, -0.8808064, 4.579713, 1, 1, 1, 1, 1,
0.1048793, 0.9761388, -0.9601526, 1, 1, 1, 1, 1,
0.1111945, -0.3854024, 3.431276, 1, 1, 1, 1, 1,
0.1133754, 0.7164016, -1.167778, 1, 1, 1, 1, 1,
0.1134585, -0.1172731, 4.275806, 1, 1, 1, 1, 1,
0.1137305, -0.175539, 2.534409, 1, 1, 1, 1, 1,
0.1143843, 0.7268916, -0.3900406, 0, 0, 1, 1, 1,
0.1152497, 0.4165135, -0.6802158, 1, 0, 0, 1, 1,
0.118576, 1.758848, -0.8793084, 1, 0, 0, 1, 1,
0.1212932, -1.022025, 3.523961, 1, 0, 0, 1, 1,
0.121811, -0.1716231, 1.643007, 1, 0, 0, 1, 1,
0.122406, 0.5035906, 0.0679423, 1, 0, 0, 1, 1,
0.122693, 0.2827234, 1.342873, 0, 0, 0, 1, 1,
0.122847, -1.331123, 1.212643, 0, 0, 0, 1, 1,
0.1240594, 0.5632487, -1.272997, 0, 0, 0, 1, 1,
0.1254492, -0.152326, 2.245658, 0, 0, 0, 1, 1,
0.1288111, 1.851983, 0.9990656, 0, 0, 0, 1, 1,
0.1302817, -0.04833513, 2.047842, 0, 0, 0, 1, 1,
0.13312, 1.542872, 1.289491, 0, 0, 0, 1, 1,
0.134156, 0.8786266, -0.6742939, 1, 1, 1, 1, 1,
0.1352414, -1.105853, 2.043397, 1, 1, 1, 1, 1,
0.1391581, -1.390813, 3.603455, 1, 1, 1, 1, 1,
0.1391654, 1.513789, 1.307966, 1, 1, 1, 1, 1,
0.1417514, -0.1306096, 2.067702, 1, 1, 1, 1, 1,
0.1469004, 1.266794, 1.268129, 1, 1, 1, 1, 1,
0.1543332, 1.959434, 1.69197, 1, 1, 1, 1, 1,
0.1544276, 1.145658, 0.9710864, 1, 1, 1, 1, 1,
0.1572439, -0.4520186, 2.731862, 1, 1, 1, 1, 1,
0.1595143, -1.149046, 3.244018, 1, 1, 1, 1, 1,
0.1609646, 1.064097, -1.25778, 1, 1, 1, 1, 1,
0.1686001, 0.4509632, 0.982243, 1, 1, 1, 1, 1,
0.1696922, 0.5824801, 0.3843667, 1, 1, 1, 1, 1,
0.170656, -0.172324, 3.77337, 1, 1, 1, 1, 1,
0.1715318, 2.719055, 2.053779, 1, 1, 1, 1, 1,
0.1744547, -0.2439828, 3.744131, 0, 0, 1, 1, 1,
0.1785372, -2.022098, 5.539467, 1, 0, 0, 1, 1,
0.1851386, -1.719078, 5.287033, 1, 0, 0, 1, 1,
0.1852462, 1.445835, 1.174311, 1, 0, 0, 1, 1,
0.1891344, -0.5280305, 2.915956, 1, 0, 0, 1, 1,
0.1928051, -0.07074512, 1.118507, 1, 0, 0, 1, 1,
0.1947562, 0.2679601, 1.723889, 0, 0, 0, 1, 1,
0.1965172, 0.9476923, -0.8696814, 0, 0, 0, 1, 1,
0.2001447, -0.06142852, 1.548169, 0, 0, 0, 1, 1,
0.2006564, -1.269627, 4.376647, 0, 0, 0, 1, 1,
0.2017081, 0.6938879, -0.009496101, 0, 0, 0, 1, 1,
0.2022275, -0.3891443, 4.672252, 0, 0, 0, 1, 1,
0.2046872, 1.960439, 0.5901065, 0, 0, 0, 1, 1,
0.2062517, 0.3541059, 1.332688, 1, 1, 1, 1, 1,
0.2112861, -0.8201516, 1.877277, 1, 1, 1, 1, 1,
0.2121734, 1.048928, 1.087786, 1, 1, 1, 1, 1,
0.214339, -0.2010266, 1.194035, 1, 1, 1, 1, 1,
0.2143941, -0.5833421, 4.552166, 1, 1, 1, 1, 1,
0.2169901, 1.51663, -0.5512577, 1, 1, 1, 1, 1,
0.2230257, 0.5174469, -0.4904935, 1, 1, 1, 1, 1,
0.2233456, 0.6925521, 0.1359678, 1, 1, 1, 1, 1,
0.2261112, 0.2798851, 1.437446, 1, 1, 1, 1, 1,
0.2336706, -0.2484945, 3.444946, 1, 1, 1, 1, 1,
0.2361899, -0.8675803, 2.430112, 1, 1, 1, 1, 1,
0.2361968, -0.4616568, 2.037393, 1, 1, 1, 1, 1,
0.2382582, 1.366805, 1.252747, 1, 1, 1, 1, 1,
0.2397223, 1.320692, -0.1485363, 1, 1, 1, 1, 1,
0.2406911, 0.5401402, 0.8454946, 1, 1, 1, 1, 1,
0.2465894, 0.5598257, -0.0882313, 0, 0, 1, 1, 1,
0.2468061, -0.3755916, 2.85362, 1, 0, 0, 1, 1,
0.2506863, -1.654933, 1.859271, 1, 0, 0, 1, 1,
0.2514517, 0.9339116, 1.166802, 1, 0, 0, 1, 1,
0.2528521, -0.4355723, 2.981005, 1, 0, 0, 1, 1,
0.2540549, -0.08085373, 1.812862, 1, 0, 0, 1, 1,
0.2555552, -0.9311553, 3.791042, 0, 0, 0, 1, 1,
0.2561373, -0.4890961, 2.410115, 0, 0, 0, 1, 1,
0.2596968, 1.872603, 0.3033609, 0, 0, 0, 1, 1,
0.2623738, -0.9720788, 3.196588, 0, 0, 0, 1, 1,
0.2631979, -0.005552791, -0.3148695, 0, 0, 0, 1, 1,
0.2632767, -0.05687014, 0.5732923, 0, 0, 0, 1, 1,
0.2641141, -0.6738108, 1.843078, 0, 0, 0, 1, 1,
0.2661764, -0.3647309, 3.287547, 1, 1, 1, 1, 1,
0.2692474, 0.309663, 0.7356171, 1, 1, 1, 1, 1,
0.2698577, -0.3407195, 3.341422, 1, 1, 1, 1, 1,
0.276402, -0.1382971, 1.11738, 1, 1, 1, 1, 1,
0.2785935, -0.07881252, 2.39761, 1, 1, 1, 1, 1,
0.2829168, -0.02440838, 0.6874905, 1, 1, 1, 1, 1,
0.2913816, 0.38873, 1.052847, 1, 1, 1, 1, 1,
0.2946315, 0.4447313, 0.7272607, 1, 1, 1, 1, 1,
0.2975482, 0.3656315, 0.5704845, 1, 1, 1, 1, 1,
0.298005, -1.187067, 2.761193, 1, 1, 1, 1, 1,
0.2991501, 1.539216, 1.240189, 1, 1, 1, 1, 1,
0.301394, -0.5329636, 2.047742, 1, 1, 1, 1, 1,
0.3018472, -2.686309, 3.266232, 1, 1, 1, 1, 1,
0.3023092, 2.629636, -1.858103, 1, 1, 1, 1, 1,
0.3035755, 0.6861596, 0.4471715, 1, 1, 1, 1, 1,
0.3044792, -0.5721769, 2.736878, 0, 0, 1, 1, 1,
0.3045971, -3.843268, 4.251296, 1, 0, 0, 1, 1,
0.304725, -0.187784, 0.7429117, 1, 0, 0, 1, 1,
0.3052203, 0.005275777, 2.160763, 1, 0, 0, 1, 1,
0.3187414, 0.01322592, 2.587813, 1, 0, 0, 1, 1,
0.3248581, 0.6699333, 1.37495, 1, 0, 0, 1, 1,
0.3252192, 0.5965508, -0.4616, 0, 0, 0, 1, 1,
0.3311277, -0.6369335, 4.520272, 0, 0, 0, 1, 1,
0.3318556, -0.01359034, 1.476803, 0, 0, 0, 1, 1,
0.3392648, -1.029246, 1.119842, 0, 0, 0, 1, 1,
0.3409024, 2.17172, 0.8899151, 0, 0, 0, 1, 1,
0.3418587, 0.3356236, 1.748016, 0, 0, 0, 1, 1,
0.3447317, 0.7996085, 1.36371, 0, 0, 0, 1, 1,
0.3479361, -0.2464689, 2.552236, 1, 1, 1, 1, 1,
0.3521175, -0.6829214, 1.979325, 1, 1, 1, 1, 1,
0.3568535, 0.6849755, 0.9862747, 1, 1, 1, 1, 1,
0.3571904, 0.3045272, -0.04028312, 1, 1, 1, 1, 1,
0.3582338, 1.185022, 1.369652, 1, 1, 1, 1, 1,
0.3591741, -0.7761325, 2.496564, 1, 1, 1, 1, 1,
0.3609652, 1.395918, 0.6483786, 1, 1, 1, 1, 1,
0.3680121, 0.7606907, -0.4442114, 1, 1, 1, 1, 1,
0.3694091, 1.753942, -0.2582789, 1, 1, 1, 1, 1,
0.3708817, 0.6639845, 1.395221, 1, 1, 1, 1, 1,
0.3719299, -0.08373547, 1.089318, 1, 1, 1, 1, 1,
0.3744358, 0.4632305, 1.355972, 1, 1, 1, 1, 1,
0.3748999, 0.9634826, 1.256153, 1, 1, 1, 1, 1,
0.374962, 1.347189, 0.7770696, 1, 1, 1, 1, 1,
0.3751953, 1.82251, -0.1000337, 1, 1, 1, 1, 1,
0.3786813, 0.9968912, -0.3694552, 0, 0, 1, 1, 1,
0.378717, 0.9155042, 1.308153, 1, 0, 0, 1, 1,
0.3790895, -0.2669002, -0.7188941, 1, 0, 0, 1, 1,
0.3791096, 1.686194, -0.4507843, 1, 0, 0, 1, 1,
0.3805098, -0.2827972, 2.404752, 1, 0, 0, 1, 1,
0.3806986, -0.1419329, 2.389101, 1, 0, 0, 1, 1,
0.3844773, 1.002764, 1.600503, 0, 0, 0, 1, 1,
0.3905138, -2.15902, 2.558827, 0, 0, 0, 1, 1,
0.3935193, -0.9911634, 2.964906, 0, 0, 0, 1, 1,
0.3937572, 0.0288216, -1.643981, 0, 0, 0, 1, 1,
0.3951879, -0.2104011, 1.250414, 0, 0, 0, 1, 1,
0.4014575, -0.1720276, 1.549258, 0, 0, 0, 1, 1,
0.4089605, -0.4879693, 3.394712, 0, 0, 0, 1, 1,
0.4110586, 0.2580242, 0.9362864, 1, 1, 1, 1, 1,
0.4212945, -0.8511661, 0.8337893, 1, 1, 1, 1, 1,
0.4248647, -1.385109, 1.593332, 1, 1, 1, 1, 1,
0.4262079, -0.7766758, 0.6986327, 1, 1, 1, 1, 1,
0.4264814, -1.119118, 3.846525, 1, 1, 1, 1, 1,
0.4272527, -0.1805182, 1.907684, 1, 1, 1, 1, 1,
0.4292816, -0.3450151, 1.618184, 1, 1, 1, 1, 1,
0.4323929, 0.2786582, 1.992473, 1, 1, 1, 1, 1,
0.4327669, -1.171621, 4.271915, 1, 1, 1, 1, 1,
0.4328909, -0.1985983, 2.668533, 1, 1, 1, 1, 1,
0.4330168, 1.136689, 0.3348212, 1, 1, 1, 1, 1,
0.4347081, 0.3709874, 1.649294, 1, 1, 1, 1, 1,
0.4354373, 2.904469, 1.491375, 1, 1, 1, 1, 1,
0.4405095, 0.9210281, -0.1158843, 1, 1, 1, 1, 1,
0.4423369, -0.1169473, 1.57177, 1, 1, 1, 1, 1,
0.4426056, 1.863259, 0.3538043, 0, 0, 1, 1, 1,
0.4486816, -0.6843553, 3.618217, 1, 0, 0, 1, 1,
0.4554774, -0.2092995, 2.85912, 1, 0, 0, 1, 1,
0.4565608, 1.473253, -0.5255144, 1, 0, 0, 1, 1,
0.4598839, -1.103145, 2.340551, 1, 0, 0, 1, 1,
0.460504, 1.078022, 1.582674, 1, 0, 0, 1, 1,
0.4649043, 1.006422, 0.7229663, 0, 0, 0, 1, 1,
0.4690446, -0.9305494, 3.088888, 0, 0, 0, 1, 1,
0.4696862, -0.09209616, 1.283376, 0, 0, 0, 1, 1,
0.4708561, -1.47021, 2.644716, 0, 0, 0, 1, 1,
0.4744084, 1.395731, -0.2780719, 0, 0, 0, 1, 1,
0.4754313, 0.2705634, 2.295231, 0, 0, 0, 1, 1,
0.4848729, -0.5450721, 2.54858, 0, 0, 0, 1, 1,
0.4851552, -1.654183, 2.640235, 1, 1, 1, 1, 1,
0.4883064, -0.4539666, 4.117686, 1, 1, 1, 1, 1,
0.4883204, -0.4609617, 3.191422, 1, 1, 1, 1, 1,
0.4954234, -0.1180749, 1.702287, 1, 1, 1, 1, 1,
0.5016469, 0.01629445, 0.9772322, 1, 1, 1, 1, 1,
0.502556, -0.2745935, 3.10065, 1, 1, 1, 1, 1,
0.5027807, 0.5325083, -0.4666783, 1, 1, 1, 1, 1,
0.5059288, 0.1143251, 1.027304, 1, 1, 1, 1, 1,
0.5060885, -0.08522441, 2.790424, 1, 1, 1, 1, 1,
0.5098926, -0.06520756, 1.684729, 1, 1, 1, 1, 1,
0.5108639, 0.3673337, 0.8123741, 1, 1, 1, 1, 1,
0.52346, -0.5098135, 3.925293, 1, 1, 1, 1, 1,
0.5237181, -0.287145, 2.247188, 1, 1, 1, 1, 1,
0.5255214, -0.1515421, 0.5704116, 1, 1, 1, 1, 1,
0.5338697, 0.3753941, 1.432845, 1, 1, 1, 1, 1,
0.5348767, 0.3373445, -1.268214, 0, 0, 1, 1, 1,
0.5450052, -0.3669965, 1.944416, 1, 0, 0, 1, 1,
0.5456418, 0.2212473, 1.786148, 1, 0, 0, 1, 1,
0.549424, -0.1182095, 0.4601855, 1, 0, 0, 1, 1,
0.5510425, 1.440949, -0.1488593, 1, 0, 0, 1, 1,
0.5586114, -0.06688184, 1.07924, 1, 0, 0, 1, 1,
0.5590225, 1.549012, -0.8967386, 0, 0, 0, 1, 1,
0.5668471, -1.542494, 1.671642, 0, 0, 0, 1, 1,
0.5733365, -0.6333853, 1.983572, 0, 0, 0, 1, 1,
0.5762919, 0.7105114, 1.987001, 0, 0, 0, 1, 1,
0.581365, 0.2634483, 1.767347, 0, 0, 0, 1, 1,
0.5854833, -0.01621099, 2.628251, 0, 0, 0, 1, 1,
0.585859, 0.3524585, 1.52457, 0, 0, 0, 1, 1,
0.5918686, 1.348994, -0.835768, 1, 1, 1, 1, 1,
0.5933768, 0.2282452, 2.14983, 1, 1, 1, 1, 1,
0.5937654, 0.1999726, 0.8026627, 1, 1, 1, 1, 1,
0.595769, -0.6521316, 1.793593, 1, 1, 1, 1, 1,
0.597029, 2.377052, 0.8916408, 1, 1, 1, 1, 1,
0.5981139, 0.1647861, 0.3643101, 1, 1, 1, 1, 1,
0.6057808, -1.05003, 3.061753, 1, 1, 1, 1, 1,
0.6082051, 0.3264337, 0.1855707, 1, 1, 1, 1, 1,
0.6087072, 0.9496107, 1.023252, 1, 1, 1, 1, 1,
0.6158596, -0.5188891, 2.597133, 1, 1, 1, 1, 1,
0.6170222, -0.589047, 3.103245, 1, 1, 1, 1, 1,
0.6214566, 0.0623095, 0.3130712, 1, 1, 1, 1, 1,
0.62409, -1.266175, 1.758829, 1, 1, 1, 1, 1,
0.6259263, 0.4660411, 0.1801085, 1, 1, 1, 1, 1,
0.6272703, -0.2474097, 1.298455, 1, 1, 1, 1, 1,
0.6279101, -0.4989864, 1.904268, 0, 0, 1, 1, 1,
0.6282751, 1.25591, -0.525843, 1, 0, 0, 1, 1,
0.6305165, -0.05871038, 0.9828086, 1, 0, 0, 1, 1,
0.6369786, 1.720212, -0.5133684, 1, 0, 0, 1, 1,
0.6392282, 1.036027, -0.1262031, 1, 0, 0, 1, 1,
0.6402276, 0.5675505, 1.03087, 1, 0, 0, 1, 1,
0.6658317, -1.574698, 2.938968, 0, 0, 0, 1, 1,
0.6683118, -0.3579668, 2.169868, 0, 0, 0, 1, 1,
0.6688632, 0.6668545, 0.3981825, 0, 0, 0, 1, 1,
0.6691766, -0.825089, 0.3648344, 0, 0, 0, 1, 1,
0.6694321, -0.06931543, 2.304278, 0, 0, 0, 1, 1,
0.675479, 0.5557181, -1.065308, 0, 0, 0, 1, 1,
0.6815864, -0.7685691, 0.6462741, 0, 0, 0, 1, 1,
0.6842166, 0.1851014, 0.8729487, 1, 1, 1, 1, 1,
0.6852229, -1.657881, 2.424709, 1, 1, 1, 1, 1,
0.6886225, 0.5147865, 1.934229, 1, 1, 1, 1, 1,
0.6939378, -0.7031886, 0.5927956, 1, 1, 1, 1, 1,
0.6988411, 1.530223, -1.777822, 1, 1, 1, 1, 1,
0.7008469, 0.923335, 1.089335, 1, 1, 1, 1, 1,
0.7060952, -1.360873, 2.665103, 1, 1, 1, 1, 1,
0.7082133, 0.5323502, 0.7784998, 1, 1, 1, 1, 1,
0.7108691, -1.004897, 3.897105, 1, 1, 1, 1, 1,
0.7123838, -1.280495, 2.167569, 1, 1, 1, 1, 1,
0.7228318, -1.192668, 2.69679, 1, 1, 1, 1, 1,
0.7249973, 0.1043206, 2.478576, 1, 1, 1, 1, 1,
0.728075, 1.138286, -0.2846406, 1, 1, 1, 1, 1,
0.7313861, 1.770252, 0.2538534, 1, 1, 1, 1, 1,
0.7324881, 0.860927, -0.2554463, 1, 1, 1, 1, 1,
0.7355717, -0.03858581, 1.832829, 0, 0, 1, 1, 1,
0.7367817, -0.9737495, 0.4942294, 1, 0, 0, 1, 1,
0.7402722, -1.042797, 1.472763, 1, 0, 0, 1, 1,
0.7418834, -0.002793367, 2.716799, 1, 0, 0, 1, 1,
0.7441797, -1.148046, 1.765013, 1, 0, 0, 1, 1,
0.7520627, -1.938033, 1.580973, 1, 0, 0, 1, 1,
0.7549343, -1.092096, 1.835197, 0, 0, 0, 1, 1,
0.7564468, 0.5487868, 1.346063, 0, 0, 0, 1, 1,
0.7584842, 0.8682658, 0.5100862, 0, 0, 0, 1, 1,
0.7586519, -0.1981777, 2.673017, 0, 0, 0, 1, 1,
0.7613572, -1.011918, 2.310949, 0, 0, 0, 1, 1,
0.7773473, -1.124785, 2.388231, 0, 0, 0, 1, 1,
0.7817665, -1.172015, 2.52122, 0, 0, 0, 1, 1,
0.790416, -0.8948489, 2.85196, 1, 1, 1, 1, 1,
0.7927816, 1.082584, 1.390474, 1, 1, 1, 1, 1,
0.8008785, -0.4864503, 2.730524, 1, 1, 1, 1, 1,
0.8052312, 0.05605753, 0.6545544, 1, 1, 1, 1, 1,
0.8082964, -0.604288, 1.971171, 1, 1, 1, 1, 1,
0.8088886, -0.5172276, 2.236395, 1, 1, 1, 1, 1,
0.8114684, 0.9336868, 0.7287961, 1, 1, 1, 1, 1,
0.8121788, 0.7627625, 0.8223219, 1, 1, 1, 1, 1,
0.8144563, 0.828812, 0.2681421, 1, 1, 1, 1, 1,
0.8154885, 1.358341, -0.3411204, 1, 1, 1, 1, 1,
0.8164195, -0.6380911, 2.017555, 1, 1, 1, 1, 1,
0.8238739, -1.851034, 2.145657, 1, 1, 1, 1, 1,
0.8248275, -0.518155, 1.080473, 1, 1, 1, 1, 1,
0.8274743, 1.13583, -0.3307016, 1, 1, 1, 1, 1,
0.8280571, 1.838848, -0.3744712, 1, 1, 1, 1, 1,
0.8313966, 0.4758065, 1.539393, 0, 0, 1, 1, 1,
0.8314365, -0.0990577, 1.566142, 1, 0, 0, 1, 1,
0.8325174, 1.110329, 2.115635, 1, 0, 0, 1, 1,
0.8373285, 1.769871, -0.03858275, 1, 0, 0, 1, 1,
0.8390695, -0.1139427, 2.237828, 1, 0, 0, 1, 1,
0.8449537, -0.2132962, 0.07887187, 1, 0, 0, 1, 1,
0.8455136, -1.300414, 1.721569, 0, 0, 0, 1, 1,
0.8460357, 0.3552507, -0.6768536, 0, 0, 0, 1, 1,
0.8504664, 1.004252, 1.234715, 0, 0, 0, 1, 1,
0.8512514, 0.6449783, 0.5218099, 0, 0, 0, 1, 1,
0.8608795, 0.2368405, 0.4964209, 0, 0, 0, 1, 1,
0.8622811, -1.941437, 2.814598, 0, 0, 0, 1, 1,
0.8661118, 1.138041, -0.4973316, 0, 0, 0, 1, 1,
0.8728722, -0.2840984, 1.857946, 1, 1, 1, 1, 1,
0.8745021, 0.8286203, 0.6540756, 1, 1, 1, 1, 1,
0.9017099, -0.3107458, 3.114657, 1, 1, 1, 1, 1,
0.9043311, -0.8185417, 2.536117, 1, 1, 1, 1, 1,
0.9063274, -0.01227731, 1.879319, 1, 1, 1, 1, 1,
0.9182398, 0.1083518, 0.5421188, 1, 1, 1, 1, 1,
0.9288319, -2.543749, 4.166842, 1, 1, 1, 1, 1,
0.9308279, 1.426675, 0.6678038, 1, 1, 1, 1, 1,
0.9380749, -0.3300186, 1.523309, 1, 1, 1, 1, 1,
0.9466198, 0.09761159, 3.657861, 1, 1, 1, 1, 1,
0.9489354, -0.4960837, 2.199209, 1, 1, 1, 1, 1,
0.9601857, -0.1557001, 0.5522336, 1, 1, 1, 1, 1,
0.9661988, 0.3405711, 2.973837, 1, 1, 1, 1, 1,
0.9681991, 0.1820896, 0.8501536, 1, 1, 1, 1, 1,
0.9705389, -0.0980157, 1.906394, 1, 1, 1, 1, 1,
0.9711967, -0.5081926, 2.10903, 0, 0, 1, 1, 1,
0.9796446, -0.7135761, 2.443402, 1, 0, 0, 1, 1,
0.9822434, 0.1897458, 1.031178, 1, 0, 0, 1, 1,
0.9849215, -0.1855705, -0.2348688, 1, 0, 0, 1, 1,
0.9855809, -0.7674939, 1.33584, 1, 0, 0, 1, 1,
0.9865881, 0.3271221, 0.3931168, 1, 0, 0, 1, 1,
0.9895784, 0.5197504, 0.9960631, 0, 0, 0, 1, 1,
0.9916289, 0.3851534, 2.090513, 0, 0, 0, 1, 1,
0.9933611, 0.04983756, 0.7831352, 0, 0, 0, 1, 1,
0.9953035, 0.8704655, -0.4306728, 0, 0, 0, 1, 1,
0.9972138, 0.1807667, 2.383354, 0, 0, 0, 1, 1,
0.9996904, -0.5405322, 1.202472, 0, 0, 0, 1, 1,
1.003201, -0.8729228, 2.341153, 0, 0, 0, 1, 1,
1.006255, 0.5140108, 1.682833, 1, 1, 1, 1, 1,
1.024666, -0.4922281, 1.2503, 1, 1, 1, 1, 1,
1.033828, -0.5895001, 1.716577, 1, 1, 1, 1, 1,
1.043656, 0.0883387, 1.026623, 1, 1, 1, 1, 1,
1.05924, -0.7972811, -0.8542462, 1, 1, 1, 1, 1,
1.062108, -0.2957055, 2.609866, 1, 1, 1, 1, 1,
1.068012, 0.246153, 2.090203, 1, 1, 1, 1, 1,
1.073474, -1.103378, 2.576836, 1, 1, 1, 1, 1,
1.082176, -0.472141, 3.789568, 1, 1, 1, 1, 1,
1.082953, 1.289434, 1.09984, 1, 1, 1, 1, 1,
1.09119, 1.216803, 0.728052, 1, 1, 1, 1, 1,
1.099016, -2.256437, 6.061555, 1, 1, 1, 1, 1,
1.100829, 1.592054, 1.917415, 1, 1, 1, 1, 1,
1.106143, -0.4264768, 3.507522, 1, 1, 1, 1, 1,
1.111108, 0.2263502, 0.3809207, 1, 1, 1, 1, 1,
1.123957, 0.8123976, -0.7539403, 0, 0, 1, 1, 1,
1.129788, -0.6874098, 2.744383, 1, 0, 0, 1, 1,
1.132949, 0.7018011, 1.267351, 1, 0, 0, 1, 1,
1.134421, -1.792518, 2.398953, 1, 0, 0, 1, 1,
1.139119, -0.225115, 1.010723, 1, 0, 0, 1, 1,
1.14294, 0.8931386, -0.3338247, 1, 0, 0, 1, 1,
1.149331, 0.472767, 1.019467, 0, 0, 0, 1, 1,
1.151277, -1.44961, 1.548681, 0, 0, 0, 1, 1,
1.155431, -0.3531787, -0.03821217, 0, 0, 0, 1, 1,
1.15921, 0.1512196, 0.9711461, 0, 0, 0, 1, 1,
1.162, -1.716285, 2.941081, 0, 0, 0, 1, 1,
1.168001, -0.5149187, 2.086087, 0, 0, 0, 1, 1,
1.176326, 0.2062321, 0.4037531, 0, 0, 0, 1, 1,
1.185534, 0.4580385, -1.442914, 1, 1, 1, 1, 1,
1.189731, 0.8773981, 1.107248, 1, 1, 1, 1, 1,
1.193235, 0.2715164, 2.299185, 1, 1, 1, 1, 1,
1.194832, -0.3503675, 2.915036, 1, 1, 1, 1, 1,
1.195575, -1.328528, 3.773175, 1, 1, 1, 1, 1,
1.198748, 0.4689091, 0.8027115, 1, 1, 1, 1, 1,
1.208808, 0.3665893, 2.78896, 1, 1, 1, 1, 1,
1.211371, -0.2799394, 1.640816, 1, 1, 1, 1, 1,
1.220485, -0.2817597, 2.871064, 1, 1, 1, 1, 1,
1.227007, 0.6551649, -0.03615341, 1, 1, 1, 1, 1,
1.227308, -0.7211476, 2.002955, 1, 1, 1, 1, 1,
1.230128, -1.319463, 1.999527, 1, 1, 1, 1, 1,
1.231798, 0.03836221, 0.7975032, 1, 1, 1, 1, 1,
1.239215, 1.785854, -0.002436788, 1, 1, 1, 1, 1,
1.243878, 0.4683107, 3.195715, 1, 1, 1, 1, 1,
1.245661, 0.7360129, 1.633354, 0, 0, 1, 1, 1,
1.273577, 0.9242136, 0.8534068, 1, 0, 0, 1, 1,
1.277414, 0.1493329, 3.40181, 1, 0, 0, 1, 1,
1.280525, -1.926162, 1.47813, 1, 0, 0, 1, 1,
1.288483, 1.214802, 0.9841737, 1, 0, 0, 1, 1,
1.289644, -0.107822, -0.4047643, 1, 0, 0, 1, 1,
1.290094, 0.3009233, 1.345527, 0, 0, 0, 1, 1,
1.302557, 0.05742316, 1.619203, 0, 0, 0, 1, 1,
1.308663, -0.6079811, 2.56313, 0, 0, 0, 1, 1,
1.30913, -0.1113675, 1.577087, 0, 0, 0, 1, 1,
1.309639, 0.5176219, 1.479452, 0, 0, 0, 1, 1,
1.310772, 0.435225, -0.09820155, 0, 0, 0, 1, 1,
1.318374, -1.807471, 3.350115, 0, 0, 0, 1, 1,
1.319087, -1.147444, 1.680434, 1, 1, 1, 1, 1,
1.335973, 0.07550824, 1.982835, 1, 1, 1, 1, 1,
1.347077, 0.2260469, 4.031714, 1, 1, 1, 1, 1,
1.349071, 0.5361621, 0.5621898, 1, 1, 1, 1, 1,
1.35057, -0.9052045, 3.363245, 1, 1, 1, 1, 1,
1.372945, -1.089606, 2.912253, 1, 1, 1, 1, 1,
1.383348, -1.275625, 1.222874, 1, 1, 1, 1, 1,
1.386773, -1.101713, 1.46599, 1, 1, 1, 1, 1,
1.395794, 1.617023, 1.070954, 1, 1, 1, 1, 1,
1.397807, -0.2615927, 1.054226, 1, 1, 1, 1, 1,
1.403206, -1.570276, 1.007948, 1, 1, 1, 1, 1,
1.405524, 1.561995, 0.9197982, 1, 1, 1, 1, 1,
1.406539, -0.4683367, 2.483326, 1, 1, 1, 1, 1,
1.412196, -1.598653, 2.304478, 1, 1, 1, 1, 1,
1.419833, 1.23039, 1.108135, 1, 1, 1, 1, 1,
1.429366, -0.4766231, 1.129717, 0, 0, 1, 1, 1,
1.439664, -0.01517057, 2.01268, 1, 0, 0, 1, 1,
1.447754, -0.5613218, 2.331671, 1, 0, 0, 1, 1,
1.455212, -1.409179, 2.206331, 1, 0, 0, 1, 1,
1.456402, 0.9870203, 1.565175, 1, 0, 0, 1, 1,
1.463999, 1.097756, 0.03745033, 1, 0, 0, 1, 1,
1.476703, -2.706174, 2.102999, 0, 0, 0, 1, 1,
1.484047, -0.6280082, 0.8875455, 0, 0, 0, 1, 1,
1.488263, -1.734495, 0.966919, 0, 0, 0, 1, 1,
1.492573, 0.3038957, 3.074775, 0, 0, 0, 1, 1,
1.494644, -0.941928, 1.222636, 0, 0, 0, 1, 1,
1.512433, 1.33119, 0.7370875, 0, 0, 0, 1, 1,
1.51783, -0.6316897, 2.906922, 0, 0, 0, 1, 1,
1.524507, 0.5731722, 2.772972, 1, 1, 1, 1, 1,
1.533004, -0.4017628, 3.071316, 1, 1, 1, 1, 1,
1.53363, 0.8109257, 0.7020215, 1, 1, 1, 1, 1,
1.534266, -0.6846448, 1.861784, 1, 1, 1, 1, 1,
1.539247, -0.2889507, 0.9413198, 1, 1, 1, 1, 1,
1.547645, 0.1044263, 1.430094, 1, 1, 1, 1, 1,
1.547932, 0.7496582, 1.128712, 1, 1, 1, 1, 1,
1.555165, 0.5842251, 2.577079, 1, 1, 1, 1, 1,
1.569577, -0.3504032, 1.012506, 1, 1, 1, 1, 1,
1.574783, -1.492046, 1.795073, 1, 1, 1, 1, 1,
1.585389, -0.8918634, 3.593309, 1, 1, 1, 1, 1,
1.589495, -0.6606191, 1.900523, 1, 1, 1, 1, 1,
1.590723, -0.01270741, 1.267534, 1, 1, 1, 1, 1,
1.60624, -0.7833555, 3.107895, 1, 1, 1, 1, 1,
1.629753, 0.2010721, 1.811212, 1, 1, 1, 1, 1,
1.630181, -1.977598, 2.94536, 0, 0, 1, 1, 1,
1.635247, 1.723405, 1.854607, 1, 0, 0, 1, 1,
1.637249, 1.718807, 1.112977, 1, 0, 0, 1, 1,
1.647787, 2.751332, 0.8920655, 1, 0, 0, 1, 1,
1.665925, 0.8525019, 0.8809558, 1, 0, 0, 1, 1,
1.666827, -0.5106448, 2.524936, 1, 0, 0, 1, 1,
1.682926, -0.1016683, 0.08751743, 0, 0, 0, 1, 1,
1.685794, 0.4294463, 2.788832, 0, 0, 0, 1, 1,
1.688525, 1.074674, 1.442483, 0, 0, 0, 1, 1,
1.705282, 2.010991, 2.373391, 0, 0, 0, 1, 1,
1.712334, 0.06678742, 0.9158046, 0, 0, 0, 1, 1,
1.719207, -1.075456, 2.122298, 0, 0, 0, 1, 1,
1.723156, -0.9927405, 2.0614, 0, 0, 0, 1, 1,
1.727648, 0.6042067, 1.473077, 1, 1, 1, 1, 1,
1.760707, -1.033764, 2.056442, 1, 1, 1, 1, 1,
1.791292, 0.08720884, 0.2860233, 1, 1, 1, 1, 1,
1.793384, -0.09231009, 1.606257, 1, 1, 1, 1, 1,
1.805601, -1.777175, 2.169756, 1, 1, 1, 1, 1,
1.809159, -1.723274, 2.271216, 1, 1, 1, 1, 1,
1.811039, -0.1151908, 1.163837, 1, 1, 1, 1, 1,
1.823336, 1.161101, 0.6004546, 1, 1, 1, 1, 1,
1.844557, -0.2672401, 2.845106, 1, 1, 1, 1, 1,
1.868941, 0.7170063, 1.165046, 1, 1, 1, 1, 1,
1.880814, 0.003540739, 1.514653, 1, 1, 1, 1, 1,
1.915113, -2.132239, 2.385875, 1, 1, 1, 1, 1,
1.930356, -2.487677, 3.365773, 1, 1, 1, 1, 1,
1.939868, -1.480098, 3.572056, 1, 1, 1, 1, 1,
1.949467, -1.514477, 1.446474, 1, 1, 1, 1, 1,
1.950444, 0.4035636, 3.35722, 0, 0, 1, 1, 1,
1.988918, 0.2496933, 1.037107, 1, 0, 0, 1, 1,
2.018351, -0.6356406, 1.900409, 1, 0, 0, 1, 1,
2.020751, -0.9629957, 2.380088, 1, 0, 0, 1, 1,
2.053273, -1.477774, 3.408036, 1, 0, 0, 1, 1,
2.054842, 0.399545, 1.42665, 1, 0, 0, 1, 1,
2.062079, 0.1337847, 0.7517256, 0, 0, 0, 1, 1,
2.06547, -0.9165685, 1.162133, 0, 0, 0, 1, 1,
2.069974, -0.6648433, 2.9773, 0, 0, 0, 1, 1,
2.079588, -0.4247848, 1.086381, 0, 0, 0, 1, 1,
2.106963, -0.5441406, 0.7412251, 0, 0, 0, 1, 1,
2.155912, -2.412537, 3.49105, 0, 0, 0, 1, 1,
2.156309, -0.4911315, 1.332766, 0, 0, 0, 1, 1,
2.162726, 0.5079325, 2.433917, 1, 1, 1, 1, 1,
2.284245, 0.08479469, -1.302942, 1, 1, 1, 1, 1,
2.30178, -0.4900989, 1.883078, 1, 1, 1, 1, 1,
2.303345, 0.1866248, -0.2203433, 1, 1, 1, 1, 1,
2.452099, -1.190796, 0.5751809, 1, 1, 1, 1, 1,
2.843696, -0.7278891, 1.619443, 1, 1, 1, 1, 1,
3.985332, -0.3405568, 1.921663, 1, 1, 1, 1, 1
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
var radius = 10.18645;
var distance = 35.77949;
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
mvMatrix.translate( -0.500599, 0.2597077, -0.3807316 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.77949);
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
