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
-2.731518, 1.243674, -0.7350113, 1, 0, 0, 1,
-2.622162, -0.5153908, -2.179117, 1, 0.007843138, 0, 1,
-2.550608, -0.3847421, -1.655563, 1, 0.01176471, 0, 1,
-2.477513, -0.508829, -1.417165, 1, 0.01960784, 0, 1,
-2.445889, 0.7071968, -1.788926, 1, 0.02352941, 0, 1,
-2.395314, -0.09057655, -3.096519, 1, 0.03137255, 0, 1,
-2.36977, 0.02768539, -0.4328344, 1, 0.03529412, 0, 1,
-2.363664, -0.6221238, -1.513652, 1, 0.04313726, 0, 1,
-2.268888, 0.6540239, 1.081213, 1, 0.04705882, 0, 1,
-2.24681, 1.301665, 0.1024633, 1, 0.05490196, 0, 1,
-2.145141, -1.540904, -1.143303, 1, 0.05882353, 0, 1,
-2.079413, 0.8260011, -0.8430662, 1, 0.06666667, 0, 1,
-2.05695, -0.2950003, -1.993903, 1, 0.07058824, 0, 1,
-2.055449, 1.18349, -1.39945, 1, 0.07843138, 0, 1,
-2.025658, -0.5091611, -1.318362, 1, 0.08235294, 0, 1,
-2.009828, -0.0006459222, -3.775027, 1, 0.09019608, 0, 1,
-1.99158, 0.561425, 0.2675482, 1, 0.09411765, 0, 1,
-1.983858, -2.015975, -2.473573, 1, 0.1019608, 0, 1,
-1.973485, 1.14554, -0.0605993, 1, 0.1098039, 0, 1,
-1.948555, 1.053116, -1.60148, 1, 0.1137255, 0, 1,
-1.945207, -0.1308309, -1.187367, 1, 0.1215686, 0, 1,
-1.916634, -0.4502684, -3.309827, 1, 0.1254902, 0, 1,
-1.912977, 0.5699711, -1.148333, 1, 0.1333333, 0, 1,
-1.899505, 1.167899, -0.4384263, 1, 0.1372549, 0, 1,
-1.846156, 0.1330959, -1.044576, 1, 0.145098, 0, 1,
-1.836624, 0.009002333, -2.709295, 1, 0.1490196, 0, 1,
-1.825568, 1.251637, -1.935062, 1, 0.1568628, 0, 1,
-1.798909, -1.167918, -1.3973, 1, 0.1607843, 0, 1,
-1.791218, 0.7452768, -1.191136, 1, 0.1686275, 0, 1,
-1.767652, -0.3914645, -1.805784, 1, 0.172549, 0, 1,
-1.747157, -0.3022169, -1.345493, 1, 0.1803922, 0, 1,
-1.745528, 0.1808114, -1.155647, 1, 0.1843137, 0, 1,
-1.722256, -1.350081, -2.25566, 1, 0.1921569, 0, 1,
-1.721229, -0.6510688, -1.181263, 1, 0.1960784, 0, 1,
-1.714998, 0.4064537, -1.006067, 1, 0.2039216, 0, 1,
-1.690292, -0.3215262, -1.49205, 1, 0.2117647, 0, 1,
-1.686704, 0.4281017, -0.8101556, 1, 0.2156863, 0, 1,
-1.673653, 1.590048, -0.7690947, 1, 0.2235294, 0, 1,
-1.660712, 0.6956249, -1.43306, 1, 0.227451, 0, 1,
-1.648874, -0.4933275, -1.890874, 1, 0.2352941, 0, 1,
-1.647642, -0.1851954, -2.503978, 1, 0.2392157, 0, 1,
-1.644463, -0.4337067, -2.094874, 1, 0.2470588, 0, 1,
-1.641756, -2.348202, -1.688797, 1, 0.2509804, 0, 1,
-1.633761, -0.3376309, -2.631921, 1, 0.2588235, 0, 1,
-1.631764, 0.5097811, -2.568806, 1, 0.2627451, 0, 1,
-1.631325, -2.15781, -2.956234, 1, 0.2705882, 0, 1,
-1.595356, -1.633862, -2.79664, 1, 0.2745098, 0, 1,
-1.591944, -0.1996394, -0.5121935, 1, 0.282353, 0, 1,
-1.591125, 0.02000645, -1.155195, 1, 0.2862745, 0, 1,
-1.58573, 1.345744, -0.009683856, 1, 0.2941177, 0, 1,
-1.561126, 0.2312526, 0.04230777, 1, 0.3019608, 0, 1,
-1.557204, -0.3260867, -2.106749, 1, 0.3058824, 0, 1,
-1.552516, 1.254346, 0.4845084, 1, 0.3137255, 0, 1,
-1.551269, 0.2272338, -1.042448, 1, 0.3176471, 0, 1,
-1.550605, -0.8944634, -3.057636, 1, 0.3254902, 0, 1,
-1.549009, -0.8834419, -1.9307, 1, 0.3294118, 0, 1,
-1.538422, -0.3326105, -2.319908, 1, 0.3372549, 0, 1,
-1.530074, -0.2038867, -2.005661, 1, 0.3411765, 0, 1,
-1.525938, -1.405655, -2.063452, 1, 0.3490196, 0, 1,
-1.525859, 0.3863064, -1.115976, 1, 0.3529412, 0, 1,
-1.511708, 0.3663255, -1.348691, 1, 0.3607843, 0, 1,
-1.505635, 0.1216998, -2.017807, 1, 0.3647059, 0, 1,
-1.47599, 0.08072381, 0.04022473, 1, 0.372549, 0, 1,
-1.473794, 0.2601498, -2.400065, 1, 0.3764706, 0, 1,
-1.472542, -0.7730575, -2.009082, 1, 0.3843137, 0, 1,
-1.455571, -1.296265, -2.012373, 1, 0.3882353, 0, 1,
-1.450438, 0.1670419, -1.442297, 1, 0.3960784, 0, 1,
-1.440812, 1.954427, -2.245014, 1, 0.4039216, 0, 1,
-1.430242, -1.029494, -1.926315, 1, 0.4078431, 0, 1,
-1.414597, -1.246036, -2.21073, 1, 0.4156863, 0, 1,
-1.413988, -0.6686162, -1.474647, 1, 0.4196078, 0, 1,
-1.407114, -0.696125, -1.434031, 1, 0.427451, 0, 1,
-1.407018, 1.491235, -0.2544295, 1, 0.4313726, 0, 1,
-1.39637, 0.2960633, -2.240279, 1, 0.4392157, 0, 1,
-1.392368, -0.009333129, -2.11072, 1, 0.4431373, 0, 1,
-1.375987, 2.552857, -0.1993934, 1, 0.4509804, 0, 1,
-1.372352, -1.232207, -4.256173, 1, 0.454902, 0, 1,
-1.360327, 0.9500904, -1.054383, 1, 0.4627451, 0, 1,
-1.358236, -0.7126575, -1.855791, 1, 0.4666667, 0, 1,
-1.356381, 0.8986199, -1.026512, 1, 0.4745098, 0, 1,
-1.34686, -0.4369705, -1.369621, 1, 0.4784314, 0, 1,
-1.34507, -1.370576, -5.045586, 1, 0.4862745, 0, 1,
-1.334053, 0.416029, -0.8064796, 1, 0.4901961, 0, 1,
-1.332725, -2.318248, -4.660831, 1, 0.4980392, 0, 1,
-1.325683, 0.02602764, -1.896602, 1, 0.5058824, 0, 1,
-1.315204, 0.7883955, -1.967893, 1, 0.509804, 0, 1,
-1.303641, 0.7706761, -0.4635141, 1, 0.5176471, 0, 1,
-1.29741, -0.3689437, -3.227646, 1, 0.5215687, 0, 1,
-1.292075, -0.3479055, -1.563756, 1, 0.5294118, 0, 1,
-1.289043, -0.1286756, 0.04852713, 1, 0.5333334, 0, 1,
-1.284437, 0.6385764, -1.625559, 1, 0.5411765, 0, 1,
-1.280241, 0.2946221, -2.863473, 1, 0.5450981, 0, 1,
-1.278285, -1.330443, -2.376417, 1, 0.5529412, 0, 1,
-1.272848, 1.693502, -0.2962257, 1, 0.5568628, 0, 1,
-1.263793, 1.110247, 0.9545243, 1, 0.5647059, 0, 1,
-1.256301, 2.044817, -1.013182, 1, 0.5686275, 0, 1,
-1.25429, -1.049318, -2.28004, 1, 0.5764706, 0, 1,
-1.249594, -0.4676408, -2.999645, 1, 0.5803922, 0, 1,
-1.239576, 0.9623023, 0.369836, 1, 0.5882353, 0, 1,
-1.238585, 1.536431, -1.641708, 1, 0.5921569, 0, 1,
-1.236695, 1.137715, -1.414536, 1, 0.6, 0, 1,
-1.232586, -0.1489279, -1.696318, 1, 0.6078432, 0, 1,
-1.224996, 0.9345424, 0.9824035, 1, 0.6117647, 0, 1,
-1.224723, -1.136597, -2.712, 1, 0.6196079, 0, 1,
-1.224496, 0.9226429, -0.5489448, 1, 0.6235294, 0, 1,
-1.213881, 0.7203557, 1.124299, 1, 0.6313726, 0, 1,
-1.205348, 0.3821484, -2.103856, 1, 0.6352941, 0, 1,
-1.205222, -1.37895, -1.90204, 1, 0.6431373, 0, 1,
-1.192294, 1.30701, 0.4617368, 1, 0.6470588, 0, 1,
-1.187645, -0.8323863, -1.760414, 1, 0.654902, 0, 1,
-1.187057, 0.3171192, -2.621598, 1, 0.6588235, 0, 1,
-1.176785, -1.004695, -1.54706, 1, 0.6666667, 0, 1,
-1.176758, 0.2852155, -0.670617, 1, 0.6705883, 0, 1,
-1.172937, 2.502616, -0.6581444, 1, 0.6784314, 0, 1,
-1.16046, 1.046642, 1.274129, 1, 0.682353, 0, 1,
-1.15633, 0.4863096, -0.7136763, 1, 0.6901961, 0, 1,
-1.149648, 0.3370682, 1.073881, 1, 0.6941177, 0, 1,
-1.145346, -1.61116, -1.103174, 1, 0.7019608, 0, 1,
-1.143873, -1.367211, -1.263497, 1, 0.7098039, 0, 1,
-1.142282, 0.5938703, -1.383904, 1, 0.7137255, 0, 1,
-1.138017, 1.383027, -0.6772692, 1, 0.7215686, 0, 1,
-1.134713, -0.7254391, -1.653464, 1, 0.7254902, 0, 1,
-1.132646, -0.2166689, -2.236554, 1, 0.7333333, 0, 1,
-1.132317, -0.8284515, -1.579654, 1, 0.7372549, 0, 1,
-1.122138, -0.5849329, -2.179113, 1, 0.7450981, 0, 1,
-1.116876, 0.1714737, -1.009596, 1, 0.7490196, 0, 1,
-1.116842, -0.1542264, -1.671083, 1, 0.7568628, 0, 1,
-1.112515, -0.7003396, -1.898364, 1, 0.7607843, 0, 1,
-1.109559, 1.020187, -0.2824594, 1, 0.7686275, 0, 1,
-1.109124, 1.803878, 0.4270351, 1, 0.772549, 0, 1,
-1.107908, -0.6833326, -1.34657, 1, 0.7803922, 0, 1,
-1.090649, 0.3366677, 0.8918843, 1, 0.7843137, 0, 1,
-1.086452, -0.6881757, -1.87401, 1, 0.7921569, 0, 1,
-1.084453, 0.1147257, -0.7112012, 1, 0.7960784, 0, 1,
-1.078767, -0.9156064, -2.225307, 1, 0.8039216, 0, 1,
-1.076368, -0.8928562, -1.879762, 1, 0.8117647, 0, 1,
-1.07408, 0.4765245, -0.7342918, 1, 0.8156863, 0, 1,
-1.066611, 0.6350083, 0.1161319, 1, 0.8235294, 0, 1,
-1.06244, 1.311226, -0.6995523, 1, 0.827451, 0, 1,
-1.059183, 0.3097026, 0.05242416, 1, 0.8352941, 0, 1,
-1.050324, -1.382229, -3.520132, 1, 0.8392157, 0, 1,
-1.034312, 0.7413974, -0.8915476, 1, 0.8470588, 0, 1,
-1.024641, 0.5500715, -1.127558, 1, 0.8509804, 0, 1,
-1.023199, 0.02463998, -2.629321, 1, 0.8588235, 0, 1,
-1.016679, 0.3967223, -1.438635, 1, 0.8627451, 0, 1,
-1.01068, -0.07797902, -3.133548, 1, 0.8705882, 0, 1,
-0.990196, 0.4830872, -0.7462896, 1, 0.8745098, 0, 1,
-0.9866785, -0.137631, -1.540301, 1, 0.8823529, 0, 1,
-0.9850582, -1.06191, -2.044465, 1, 0.8862745, 0, 1,
-0.9834672, 1.147941, -0.0920843, 1, 0.8941177, 0, 1,
-0.9694509, 0.359222, -2.452644, 1, 0.8980392, 0, 1,
-0.9683139, -1.081272, -2.213522, 1, 0.9058824, 0, 1,
-0.961714, -0.78335, -1.267645, 1, 0.9137255, 0, 1,
-0.9387988, -0.4515842, -1.605856, 1, 0.9176471, 0, 1,
-0.9385155, -0.03015417, -1.414494, 1, 0.9254902, 0, 1,
-0.9384117, 0.9651295, -0.4994843, 1, 0.9294118, 0, 1,
-0.9376705, 0.5037501, -0.3568368, 1, 0.9372549, 0, 1,
-0.9364397, 1.536321, -1.156826, 1, 0.9411765, 0, 1,
-0.9353841, -0.7003821, -1.286387, 1, 0.9490196, 0, 1,
-0.9337743, -1.081526, -2.165319, 1, 0.9529412, 0, 1,
-0.9336645, -1.189388, -1.503396, 1, 0.9607843, 0, 1,
-0.9308906, 1.124946, -0.4702106, 1, 0.9647059, 0, 1,
-0.92743, 0.4407877, -0.8306798, 1, 0.972549, 0, 1,
-0.927393, -0.3001773, -0.9043264, 1, 0.9764706, 0, 1,
-0.924149, -0.6338941, -1.981803, 1, 0.9843137, 0, 1,
-0.9166105, -0.5281664, -2.865234, 1, 0.9882353, 0, 1,
-0.9150245, 2.567194, 0.4970978, 1, 0.9960784, 0, 1,
-0.9143887, 1.914926, -1.848011, 0.9960784, 1, 0, 1,
-0.9053186, -0.1420797, -2.208726, 0.9921569, 1, 0, 1,
-0.9017992, -0.09762719, -3.628102, 0.9843137, 1, 0, 1,
-0.8987855, 1.273717, 0.4500653, 0.9803922, 1, 0, 1,
-0.8967741, -0.05604879, -0.4599322, 0.972549, 1, 0, 1,
-0.8949691, 0.1912514, -0.984291, 0.9686275, 1, 0, 1,
-0.8910528, -2.26859, -3.12821, 0.9607843, 1, 0, 1,
-0.8892798, 1.698455, -0.2495087, 0.9568627, 1, 0, 1,
-0.8889484, 0.8180426, 1.112004, 0.9490196, 1, 0, 1,
-0.8874233, 0.2224783, -0.8774667, 0.945098, 1, 0, 1,
-0.8869103, -0.06053483, -3.433907, 0.9372549, 1, 0, 1,
-0.8856666, -2.095233, -2.92436, 0.9333333, 1, 0, 1,
-0.8811212, 0.2648164, -3.191709, 0.9254902, 1, 0, 1,
-0.8775322, 0.5452938, 0.7498215, 0.9215686, 1, 0, 1,
-0.8756278, 0.3241842, 0.2884262, 0.9137255, 1, 0, 1,
-0.8713264, -0.6556081, -0.8244628, 0.9098039, 1, 0, 1,
-0.8642914, 1.835425, 0.343858, 0.9019608, 1, 0, 1,
-0.863746, -0.5999237, -4.037766, 0.8941177, 1, 0, 1,
-0.8592424, -0.3145978, -1.627472, 0.8901961, 1, 0, 1,
-0.8562341, -0.9028158, -2.266703, 0.8823529, 1, 0, 1,
-0.8552316, 0.2414074, 0.6254601, 0.8784314, 1, 0, 1,
-0.8532319, -1.903086, -3.219913, 0.8705882, 1, 0, 1,
-0.8530977, -0.2516647, -1.301477, 0.8666667, 1, 0, 1,
-0.8494413, 0.2483814, -1.042624, 0.8588235, 1, 0, 1,
-0.8426641, 0.6125407, -0.3598855, 0.854902, 1, 0, 1,
-0.8405764, 0.444955, -1.021074, 0.8470588, 1, 0, 1,
-0.8385944, 0.2767588, -0.8093676, 0.8431373, 1, 0, 1,
-0.8362167, 2.158304, -0.684214, 0.8352941, 1, 0, 1,
-0.8335267, -1.540222, -4.771236, 0.8313726, 1, 0, 1,
-0.8296378, -1.202239, -2.933381, 0.8235294, 1, 0, 1,
-0.828563, 1.198329, -1.120718, 0.8196079, 1, 0, 1,
-0.8282024, 0.9694853, -1.455859, 0.8117647, 1, 0, 1,
-0.8224592, -0.2339103, -1.371209, 0.8078431, 1, 0, 1,
-0.8159814, -0.620053, -1.502811, 0.8, 1, 0, 1,
-0.8087257, -3.886746, -4.209921, 0.7921569, 1, 0, 1,
-0.8042952, -0.6542045, -2.155751, 0.7882353, 1, 0, 1,
-0.7942123, -0.5725486, -2.396545, 0.7803922, 1, 0, 1,
-0.7908247, -0.6894935, -2.668376, 0.7764706, 1, 0, 1,
-0.7847711, 0.4530864, -1.747256, 0.7686275, 1, 0, 1,
-0.7805969, -0.7075441, -2.015468, 0.7647059, 1, 0, 1,
-0.7742872, 0.1179121, -1.662526, 0.7568628, 1, 0, 1,
-0.7648583, 0.2004049, -1.595303, 0.7529412, 1, 0, 1,
-0.7618046, 0.4384598, 0.8415616, 0.7450981, 1, 0, 1,
-0.7606483, -0.9273407, -1.1136, 0.7411765, 1, 0, 1,
-0.7578107, 2.126905, -0.4472693, 0.7333333, 1, 0, 1,
-0.7540572, -0.7770685, -2.548328, 0.7294118, 1, 0, 1,
-0.752617, 0.5843646, 0.6452827, 0.7215686, 1, 0, 1,
-0.7494581, -0.2378578, -1.925074, 0.7176471, 1, 0, 1,
-0.747381, 1.727402, -1.211796, 0.7098039, 1, 0, 1,
-0.7431874, -1.040755, -1.942818, 0.7058824, 1, 0, 1,
-0.7401617, 1.002108, -0.7296083, 0.6980392, 1, 0, 1,
-0.7356474, 0.7293184, -0.005750532, 0.6901961, 1, 0, 1,
-0.7303905, -0.2076367, -1.78538, 0.6862745, 1, 0, 1,
-0.7285747, -1.625587, -3.051145, 0.6784314, 1, 0, 1,
-0.7283041, 0.4393066, -0.1613206, 0.6745098, 1, 0, 1,
-0.7227292, -1.194818, -4.120998, 0.6666667, 1, 0, 1,
-0.7225341, 0.8475212, -1.423477, 0.6627451, 1, 0, 1,
-0.7224644, 0.8901005, -2.098822, 0.654902, 1, 0, 1,
-0.7215829, 0.5463256, 0.4463342, 0.6509804, 1, 0, 1,
-0.7207833, 0.9081898, -0.1115615, 0.6431373, 1, 0, 1,
-0.7196331, -0.1081067, -1.445452, 0.6392157, 1, 0, 1,
-0.719155, -1.274339, -3.388073, 0.6313726, 1, 0, 1,
-0.7184975, 1.047508, -1.645027, 0.627451, 1, 0, 1,
-0.7136077, -0.6266317, -1.556992, 0.6196079, 1, 0, 1,
-0.7131028, 1.327206, -2.664751, 0.6156863, 1, 0, 1,
-0.7102658, 1.047828, -0.2015473, 0.6078432, 1, 0, 1,
-0.7085886, 0.5307661, -0.8264441, 0.6039216, 1, 0, 1,
-0.7041569, 0.8758813, -1.501184, 0.5960785, 1, 0, 1,
-0.7027767, -2.131545, -2.906747, 0.5882353, 1, 0, 1,
-0.7021829, -0.2814753, -2.222634, 0.5843138, 1, 0, 1,
-0.690772, 2.23329, -1.14922, 0.5764706, 1, 0, 1,
-0.6851552, -0.09698054, -0.8102991, 0.572549, 1, 0, 1,
-0.6848435, 0.619424, -0.9380395, 0.5647059, 1, 0, 1,
-0.6836053, 1.576488, -0.7522435, 0.5607843, 1, 0, 1,
-0.6775813, 0.2998126, 0.1049916, 0.5529412, 1, 0, 1,
-0.6759577, -0.3807838, -3.739214, 0.5490196, 1, 0, 1,
-0.6736864, -0.5414661, -3.43685, 0.5411765, 1, 0, 1,
-0.6736487, -0.3648622, -1.446355, 0.5372549, 1, 0, 1,
-0.6726611, 2.269607, 0.7622212, 0.5294118, 1, 0, 1,
-0.6723711, 0.3203267, -1.471354, 0.5254902, 1, 0, 1,
-0.6666219, 0.702507, -0.3356874, 0.5176471, 1, 0, 1,
-0.6640606, -1.165322, -1.790903, 0.5137255, 1, 0, 1,
-0.663047, -0.51483, -2.290995, 0.5058824, 1, 0, 1,
-0.6617194, -0.7802068, -1.200172, 0.5019608, 1, 0, 1,
-0.6598886, -0.8053403, -0.8815328, 0.4941176, 1, 0, 1,
-0.6540091, -0.4755186, -4.302537, 0.4862745, 1, 0, 1,
-0.6515245, 0.2201402, -1.573142, 0.4823529, 1, 0, 1,
-0.6500089, -0.546837, -2.955391, 0.4745098, 1, 0, 1,
-0.6472323, -0.1469684, -2.437255, 0.4705882, 1, 0, 1,
-0.6443939, -1.102165, 0.1249197, 0.4627451, 1, 0, 1,
-0.6436688, 0.3437612, -0.3980397, 0.4588235, 1, 0, 1,
-0.6422123, 1.324467, 0.5877544, 0.4509804, 1, 0, 1,
-0.6368096, -0.12505, 1.01644, 0.4470588, 1, 0, 1,
-0.6364014, 0.5168186, -1.061758, 0.4392157, 1, 0, 1,
-0.6334091, -0.9292743, -2.199407, 0.4352941, 1, 0, 1,
-0.6294937, -0.5981548, -1.997139, 0.427451, 1, 0, 1,
-0.623301, 1.436262, -0.6466092, 0.4235294, 1, 0, 1,
-0.6229147, -0.3431623, -2.279932, 0.4156863, 1, 0, 1,
-0.6153207, -0.5756313, -3.148979, 0.4117647, 1, 0, 1,
-0.6099155, 1.025828, -1.444676, 0.4039216, 1, 0, 1,
-0.6040646, -1.235874, -2.999747, 0.3960784, 1, 0, 1,
-0.5980746, 0.5709071, -0.1535592, 0.3921569, 1, 0, 1,
-0.597111, -1.897074, -2.627378, 0.3843137, 1, 0, 1,
-0.5939084, 0.1578628, -1.734776, 0.3803922, 1, 0, 1,
-0.5915704, 0.2653208, -0.1759586, 0.372549, 1, 0, 1,
-0.5889799, 1.606372, 0.2503952, 0.3686275, 1, 0, 1,
-0.5816945, 0.3188604, -1.079476, 0.3607843, 1, 0, 1,
-0.5805871, 0.9224415, -0.099528, 0.3568628, 1, 0, 1,
-0.578986, -0.1736966, -2.266191, 0.3490196, 1, 0, 1,
-0.5772383, -0.5800481, -2.091906, 0.345098, 1, 0, 1,
-0.5753444, 0.4509648, -1.414669, 0.3372549, 1, 0, 1,
-0.5692418, 0.08460266, 0.6117779, 0.3333333, 1, 0, 1,
-0.5651237, 0.7357196, -0.4816274, 0.3254902, 1, 0, 1,
-0.5595142, -0.6727523, -2.847076, 0.3215686, 1, 0, 1,
-0.5594631, 0.2865854, -1.249679, 0.3137255, 1, 0, 1,
-0.5576271, -0.4294343, -3.210346, 0.3098039, 1, 0, 1,
-0.5549001, -0.4715417, -3.188211, 0.3019608, 1, 0, 1,
-0.554072, 0.111714, -2.122291, 0.2941177, 1, 0, 1,
-0.5538712, -0.2715609, -1.005812, 0.2901961, 1, 0, 1,
-0.5426267, 0.5749112, -1.154542, 0.282353, 1, 0, 1,
-0.539334, -0.1041172, -0.3183199, 0.2784314, 1, 0, 1,
-0.5358657, 0.1360147, -1.971768, 0.2705882, 1, 0, 1,
-0.5349194, 0.5185257, -0.24394, 0.2666667, 1, 0, 1,
-0.5280726, -1.174722, -1.847841, 0.2588235, 1, 0, 1,
-0.5205036, 0.2907155, -1.53421, 0.254902, 1, 0, 1,
-0.5202237, -0.5559471, -1.378245, 0.2470588, 1, 0, 1,
-0.5104381, 1.105925, -0.1042754, 0.2431373, 1, 0, 1,
-0.505111, -0.9390754, -2.13748, 0.2352941, 1, 0, 1,
-0.5007147, -0.1323123, -0.833899, 0.2313726, 1, 0, 1,
-0.4985889, 1.663923, -0.2977046, 0.2235294, 1, 0, 1,
-0.4943508, -0.1336559, -1.835711, 0.2196078, 1, 0, 1,
-0.4930437, -0.8589604, -0.5316433, 0.2117647, 1, 0, 1,
-0.4912465, -0.1944726, -2.188337, 0.2078431, 1, 0, 1,
-0.4871464, 0.5200945, -1.282726, 0.2, 1, 0, 1,
-0.4815922, -0.1818818, -1.571249, 0.1921569, 1, 0, 1,
-0.4718981, -1.360886, -1.698765, 0.1882353, 1, 0, 1,
-0.4708134, 0.8678793, 0.9182453, 0.1803922, 1, 0, 1,
-0.4678516, -0.7446494, -4.043591, 0.1764706, 1, 0, 1,
-0.4642219, -0.2032293, -1.855761, 0.1686275, 1, 0, 1,
-0.4619016, 1.690861, -1.950744, 0.1647059, 1, 0, 1,
-0.4610399, 0.04233554, -1.870039, 0.1568628, 1, 0, 1,
-0.4609398, 1.395699, -0.7610984, 0.1529412, 1, 0, 1,
-0.4515405, 0.6218054, -0.4103343, 0.145098, 1, 0, 1,
-0.4476361, -0.3017951, -3.111335, 0.1411765, 1, 0, 1,
-0.4459517, 1.036399, -0.3228222, 0.1333333, 1, 0, 1,
-0.4349876, 2.553989, -1.953748, 0.1294118, 1, 0, 1,
-0.434312, 0.6293611, -0.1939551, 0.1215686, 1, 0, 1,
-0.4312054, -0.8469247, -2.394418, 0.1176471, 1, 0, 1,
-0.4256756, 0.3681431, -0.6609489, 0.1098039, 1, 0, 1,
-0.4249333, -0.7554475, -2.336292, 0.1058824, 1, 0, 1,
-0.4249273, 0.0698869, -0.8674546, 0.09803922, 1, 0, 1,
-0.4247536, 0.7784667, -1.140876, 0.09019608, 1, 0, 1,
-0.4242727, -0.5045125, -2.163879, 0.08627451, 1, 0, 1,
-0.4228988, -1.547058, -1.185576, 0.07843138, 1, 0, 1,
-0.4196951, -1.490032, -4.497149, 0.07450981, 1, 0, 1,
-0.4148281, 0.1754964, -0.2001175, 0.06666667, 1, 0, 1,
-0.413867, 0.125663, -1.649889, 0.0627451, 1, 0, 1,
-0.4085319, 0.1989277, -0.9425805, 0.05490196, 1, 0, 1,
-0.408267, -0.2392873, -0.5355872, 0.05098039, 1, 0, 1,
-0.4077463, 0.9301778, -0.2020217, 0.04313726, 1, 0, 1,
-0.4071764, -0.5241095, -0.9021877, 0.03921569, 1, 0, 1,
-0.3955395, -0.00933897, -2.427076, 0.03137255, 1, 0, 1,
-0.3913285, -0.1941605, -2.080893, 0.02745098, 1, 0, 1,
-0.3892821, -0.7554925, -2.724404, 0.01960784, 1, 0, 1,
-0.3854185, -0.1713702, -2.335529, 0.01568628, 1, 0, 1,
-0.3814291, -0.3791251, 0.4047093, 0.007843138, 1, 0, 1,
-0.3812229, 1.909433, 0.2598421, 0.003921569, 1, 0, 1,
-0.378846, 0.1794512, -0.625253, 0, 1, 0.003921569, 1,
-0.3782223, -0.9609737, -4.703551, 0, 1, 0.01176471, 1,
-0.3748215, -0.5679495, -3.908019, 0, 1, 0.01568628, 1,
-0.3696149, 0.1619368, -1.079954, 0, 1, 0.02352941, 1,
-0.3646755, 0.9371385, -0.820378, 0, 1, 0.02745098, 1,
-0.3611169, -0.05360647, -3.280948, 0, 1, 0.03529412, 1,
-0.3599016, -1.051456, -3.007716, 0, 1, 0.03921569, 1,
-0.3598684, 0.3076639, -2.272912, 0, 1, 0.04705882, 1,
-0.3574629, -0.2479676, -1.66066, 0, 1, 0.05098039, 1,
-0.3555215, 0.1101335, -0.3868501, 0, 1, 0.05882353, 1,
-0.3534811, 0.4038715, -0.155691, 0, 1, 0.0627451, 1,
-0.3493723, -0.1801832, -2.028181, 0, 1, 0.07058824, 1,
-0.3292907, -0.7784663, -2.213512, 0, 1, 0.07450981, 1,
-0.3188271, 0.5335466, 0.9264782, 0, 1, 0.08235294, 1,
-0.3181119, 0.1938208, -1.134842, 0, 1, 0.08627451, 1,
-0.3163, 0.5437716, 2.101429, 0, 1, 0.09411765, 1,
-0.3154025, 1.009715, 0.2292318, 0, 1, 0.1019608, 1,
-0.3150224, 0.7208218, -0.5761939, 0, 1, 0.1058824, 1,
-0.3116398, 0.3344902, -0.9090389, 0, 1, 0.1137255, 1,
-0.3098213, 1.203164, -0.6460973, 0, 1, 0.1176471, 1,
-0.3050646, -0.2519912, -1.778892, 0, 1, 0.1254902, 1,
-0.3043607, -1.035205, -4.181472, 0, 1, 0.1294118, 1,
-0.3020881, 1.928128, -0.04918937, 0, 1, 0.1372549, 1,
-0.3005848, 0.4265491, 1.209624, 0, 1, 0.1411765, 1,
-0.2973929, 1.146584, -0.3410152, 0, 1, 0.1490196, 1,
-0.296382, 0.8365327, 0.5884375, 0, 1, 0.1529412, 1,
-0.2926972, -0.4267338, -2.002522, 0, 1, 0.1607843, 1,
-0.2925399, -0.4706627, -2.737565, 0, 1, 0.1647059, 1,
-0.2923374, 0.09298539, -1.209824, 0, 1, 0.172549, 1,
-0.2907471, 0.8832261, 1.507011, 0, 1, 0.1764706, 1,
-0.2885395, -0.6473661, -1.685239, 0, 1, 0.1843137, 1,
-0.2864115, 0.725452, 0.4050967, 0, 1, 0.1882353, 1,
-0.2845053, 0.248704, -1.05907, 0, 1, 0.1960784, 1,
-0.2817566, 0.606985, 0.5364305, 0, 1, 0.2039216, 1,
-0.2788245, -1.210372, -3.684206, 0, 1, 0.2078431, 1,
-0.2755615, 0.4273486, 0.5606555, 0, 1, 0.2156863, 1,
-0.2703791, -0.3337744, -3.567426, 0, 1, 0.2196078, 1,
-0.2684466, -0.363045, -2.589919, 0, 1, 0.227451, 1,
-0.2680157, 0.6458993, 0.08322376, 0, 1, 0.2313726, 1,
-0.2670284, 0.2691578, -0.3575953, 0, 1, 0.2392157, 1,
-0.266161, -0.7774761, -2.241004, 0, 1, 0.2431373, 1,
-0.2648817, -0.4522131, -0.9851204, 0, 1, 0.2509804, 1,
-0.2610291, -0.4436749, -2.322966, 0, 1, 0.254902, 1,
-0.2607563, 0.3548504, -0.5907675, 0, 1, 0.2627451, 1,
-0.2601481, 0.7712845, 0.6792992, 0, 1, 0.2666667, 1,
-0.2597235, 1.815613, 1.032384, 0, 1, 0.2745098, 1,
-0.2592523, -0.4579164, -2.09091, 0, 1, 0.2784314, 1,
-0.2566833, -1.545065, -3.59001, 0, 1, 0.2862745, 1,
-0.254932, 0.7022949, 0.5795264, 0, 1, 0.2901961, 1,
-0.2537444, 1.100045, 0.3013928, 0, 1, 0.2980392, 1,
-0.2481066, 0.2912876, -0.2971944, 0, 1, 0.3058824, 1,
-0.2467396, -0.2298286, -2.158765, 0, 1, 0.3098039, 1,
-0.2384503, -0.2401579, -2.445708, 0, 1, 0.3176471, 1,
-0.2381333, 0.8719489, 0.6132608, 0, 1, 0.3215686, 1,
-0.2366214, 0.6434097, 1.217269, 0, 1, 0.3294118, 1,
-0.2343927, -0.4872948, -3.635123, 0, 1, 0.3333333, 1,
-0.2343223, -0.2147193, 0.341132, 0, 1, 0.3411765, 1,
-0.2338025, -0.342603, -0.1793313, 0, 1, 0.345098, 1,
-0.2306918, -0.9897398, -4.475878, 0, 1, 0.3529412, 1,
-0.2301185, -0.9658005, -2.426125, 0, 1, 0.3568628, 1,
-0.2273748, -0.7752049, -3.112642, 0, 1, 0.3647059, 1,
-0.2263374, 0.5188999, 0.1482223, 0, 1, 0.3686275, 1,
-0.2235266, -0.5513899, -1.818788, 0, 1, 0.3764706, 1,
-0.2192397, 1.072915, -0.171056, 0, 1, 0.3803922, 1,
-0.2172525, 0.08556816, -1.61191, 0, 1, 0.3882353, 1,
-0.2148385, 0.7795822, -0.5870743, 0, 1, 0.3921569, 1,
-0.2101214, -0.06918631, -1.253114, 0, 1, 0.4, 1,
-0.2016141, 0.9127662, -0.6447027, 0, 1, 0.4078431, 1,
-0.1984769, -0.222495, -2.385713, 0, 1, 0.4117647, 1,
-0.192663, -0.4535012, -2.352971, 0, 1, 0.4196078, 1,
-0.1919378, 0.6106802, 0.1925977, 0, 1, 0.4235294, 1,
-0.1825977, -1.362711, -3.06351, 0, 1, 0.4313726, 1,
-0.1814068, 0.6278992, 0.02623576, 0, 1, 0.4352941, 1,
-0.1804587, -0.9535112, -1.328977, 0, 1, 0.4431373, 1,
-0.1793388, -0.518758, -1.59701, 0, 1, 0.4470588, 1,
-0.1770101, 0.8322836, -0.7401845, 0, 1, 0.454902, 1,
-0.1750427, -1.23596, -2.023863, 0, 1, 0.4588235, 1,
-0.1734339, 1.348143, -0.2156133, 0, 1, 0.4666667, 1,
-0.1725924, 0.834927, -0.7843236, 0, 1, 0.4705882, 1,
-0.170751, 0.7263879, -0.1394592, 0, 1, 0.4784314, 1,
-0.170378, -0.8928379, -2.209605, 0, 1, 0.4823529, 1,
-0.1693049, 0.9396258, -0.7105544, 0, 1, 0.4901961, 1,
-0.1690139, 2.186525, 0.5619056, 0, 1, 0.4941176, 1,
-0.1667543, -2.254497, -3.838119, 0, 1, 0.5019608, 1,
-0.1647023, 0.4328375, -0.2347922, 0, 1, 0.509804, 1,
-0.1577388, -0.868905, -3.383483, 0, 1, 0.5137255, 1,
-0.1577309, 0.4045836, -1.915169, 0, 1, 0.5215687, 1,
-0.1512986, -1.47147, -3.564918, 0, 1, 0.5254902, 1,
-0.150131, -2.17169, -2.832496, 0, 1, 0.5333334, 1,
-0.1460584, -0.284458, -2.24845, 0, 1, 0.5372549, 1,
-0.1460482, 2.141256, 0.6311103, 0, 1, 0.5450981, 1,
-0.1444063, 0.7363414, 0.5068002, 0, 1, 0.5490196, 1,
-0.1436733, -1.063673, -0.7521166, 0, 1, 0.5568628, 1,
-0.1386308, 1.512254, 0.8126052, 0, 1, 0.5607843, 1,
-0.1365304, 0.7261406, 0.5769979, 0, 1, 0.5686275, 1,
-0.13426, 0.248891, -0.7514219, 0, 1, 0.572549, 1,
-0.1308996, -1.251138, -1.419173, 0, 1, 0.5803922, 1,
-0.1301864, 1.522893, -1.226683, 0, 1, 0.5843138, 1,
-0.1286436, 0.9917096, 0.6384544, 0, 1, 0.5921569, 1,
-0.1228419, -0.4867154, -1.214026, 0, 1, 0.5960785, 1,
-0.1205906, -0.2485443, -3.727644, 0, 1, 0.6039216, 1,
-0.1199704, 0.4976858, -0.3990145, 0, 1, 0.6117647, 1,
-0.1189083, -1.204979, -2.69714, 0, 1, 0.6156863, 1,
-0.118817, 0.9648075, 0.04986752, 0, 1, 0.6235294, 1,
-0.11686, 0.5447585, -0.6205463, 0, 1, 0.627451, 1,
-0.1153678, -0.6753011, -2.731097, 0, 1, 0.6352941, 1,
-0.1151267, -2.140276, -3.942457, 0, 1, 0.6392157, 1,
-0.1132867, -0.3461354, -3.581746, 0, 1, 0.6470588, 1,
-0.1094817, -0.6813766, -2.440351, 0, 1, 0.6509804, 1,
-0.1067853, -2.599376, -3.926491, 0, 1, 0.6588235, 1,
-0.1063077, 0.3246043, 0.7326233, 0, 1, 0.6627451, 1,
-0.1030681, -0.1321573, -0.7959462, 0, 1, 0.6705883, 1,
-0.1028639, -0.04503221, -1.281698, 0, 1, 0.6745098, 1,
-0.09765539, 0.08300928, -1.226338, 0, 1, 0.682353, 1,
-0.09247217, 1.207408, -2.067394, 0, 1, 0.6862745, 1,
-0.09130028, 0.2198415, -1.027274, 0, 1, 0.6941177, 1,
-0.08598971, 1.197681, -1.43415, 0, 1, 0.7019608, 1,
-0.08578783, 0.2725199, 1.157666, 0, 1, 0.7058824, 1,
-0.08517774, -0.2116263, -3.630185, 0, 1, 0.7137255, 1,
-0.08242913, -0.505276, -2.45994, 0, 1, 0.7176471, 1,
-0.08033589, -1.35812, -1.947001, 0, 1, 0.7254902, 1,
-0.0773842, 1.839898, 1.219262, 0, 1, 0.7294118, 1,
-0.06849097, -1.172776, -2.97505, 0, 1, 0.7372549, 1,
-0.0682902, 1.793891, -0.03268164, 0, 1, 0.7411765, 1,
-0.06691963, 0.06131643, -0.8185623, 0, 1, 0.7490196, 1,
-0.06682133, -0.2546125, -3.772553, 0, 1, 0.7529412, 1,
-0.06528029, 1.812909, 0.6576489, 0, 1, 0.7607843, 1,
-0.06324745, 0.06439485, 0.3277686, 0, 1, 0.7647059, 1,
-0.05577999, -0.6535652, -1.893757, 0, 1, 0.772549, 1,
-0.05417528, 0.2037002, -0.647316, 0, 1, 0.7764706, 1,
-0.05383236, 1.203944, -0.4990267, 0, 1, 0.7843137, 1,
-0.05110605, 0.9537839, 1.307647, 0, 1, 0.7882353, 1,
-0.05035913, 0.3922213, 0.8519419, 0, 1, 0.7960784, 1,
-0.04269461, 1.005689, -1.505999, 0, 1, 0.8039216, 1,
-0.03699707, -0.04510914, -1.370327, 0, 1, 0.8078431, 1,
-0.03562622, -1.695665, -3.675056, 0, 1, 0.8156863, 1,
-0.03481079, -1.319028, -3.138826, 0, 1, 0.8196079, 1,
-0.03160499, -1.49304, -2.63528, 0, 1, 0.827451, 1,
-0.03121915, -0.02255444, -1.364926, 0, 1, 0.8313726, 1,
-0.03118235, -0.2677214, -4.406788, 0, 1, 0.8392157, 1,
-0.02851059, 0.6125427, -1.694739, 0, 1, 0.8431373, 1,
-0.02495535, -1.352622, -4.380287, 0, 1, 0.8509804, 1,
-0.02450449, 0.8052421, -0.4488708, 0, 1, 0.854902, 1,
-0.02347025, 1.035442, 0.2315688, 0, 1, 0.8627451, 1,
-0.02114495, 0.5320378, -1.233101, 0, 1, 0.8666667, 1,
-0.01932276, -1.2801, -2.450256, 0, 1, 0.8745098, 1,
-0.01812193, -1.99302, -2.857603, 0, 1, 0.8784314, 1,
-0.01247288, 0.5360253, 0.3951042, 0, 1, 0.8862745, 1,
-0.01137711, -0.3881644, -1.355718, 0, 1, 0.8901961, 1,
-0.009528076, 0.3830055, -0.6090723, 0, 1, 0.8980392, 1,
-0.005233413, -0.5455115, -3.100002, 0, 1, 0.9058824, 1,
-0.005055827, -1.013714, -1.762373, 0, 1, 0.9098039, 1,
0.0003791728, -0.7990664, 2.889539, 0, 1, 0.9176471, 1,
0.000599583, -0.7338168, 4.372855, 0, 1, 0.9215686, 1,
0.002101975, 2.245445, 0.8233687, 0, 1, 0.9294118, 1,
0.002497729, 0.8269091, -1.281662, 0, 1, 0.9333333, 1,
0.004397034, 0.4826843, -1.041472, 0, 1, 0.9411765, 1,
0.009381005, 0.9209711, 0.3219242, 0, 1, 0.945098, 1,
0.01226759, 0.384764, -0.2786781, 0, 1, 0.9529412, 1,
0.01434609, -0.09061633, 3.49036, 0, 1, 0.9568627, 1,
0.01483786, -1.008578, 2.127118, 0, 1, 0.9647059, 1,
0.02343655, 0.7082097, 0.8733361, 0, 1, 0.9686275, 1,
0.02754466, -0.4707803, 1.906162, 0, 1, 0.9764706, 1,
0.03635611, 1.51358, 0.1042254, 0, 1, 0.9803922, 1,
0.03674624, -0.547891, 2.874279, 0, 1, 0.9882353, 1,
0.0412216, 0.8014759, 0.314593, 0, 1, 0.9921569, 1,
0.04340039, -0.1659207, 3.703786, 0, 1, 1, 1,
0.04828893, -0.8010263, 3.189317, 0, 0.9921569, 1, 1,
0.05431727, 0.8788341, 0.9646001, 0, 0.9882353, 1, 1,
0.05803498, 0.3588348, -0.07151493, 0, 0.9803922, 1, 1,
0.0601678, 0.3634031, 0.3108154, 0, 0.9764706, 1, 1,
0.06246589, -2.644353, 3.449618, 0, 0.9686275, 1, 1,
0.06854813, -0.2056873, 1.552459, 0, 0.9647059, 1, 1,
0.06915437, 0.4972632, 0.2417102, 0, 0.9568627, 1, 1,
0.07202978, 2.038846, -0.1825338, 0, 0.9529412, 1, 1,
0.0728307, -1.383436, 2.871821, 0, 0.945098, 1, 1,
0.07722279, 1.167499, 0.01062379, 0, 0.9411765, 1, 1,
0.08001656, 0.2066211, 0.436408, 0, 0.9333333, 1, 1,
0.08560397, 1.737523, 1.96548, 0, 0.9294118, 1, 1,
0.086257, 0.3469454, 1.337491, 0, 0.9215686, 1, 1,
0.08635903, -0.4103729, 4.468097, 0, 0.9176471, 1, 1,
0.09136637, 0.1076365, 1.210585, 0, 0.9098039, 1, 1,
0.09683555, -1.491501, 2.056339, 0, 0.9058824, 1, 1,
0.09828261, 0.7914485, -1.383953, 0, 0.8980392, 1, 1,
0.09831842, 0.1962609, 0.9783374, 0, 0.8901961, 1, 1,
0.09947091, -0.2171888, 3.612709, 0, 0.8862745, 1, 1,
0.1029999, 0.761475, 0.1563184, 0, 0.8784314, 1, 1,
0.1034768, 1.431708, 2.084226, 0, 0.8745098, 1, 1,
0.1042379, 0.7315413, -0.8377416, 0, 0.8666667, 1, 1,
0.1072276, -0.5409016, 1.442036, 0, 0.8627451, 1, 1,
0.1099254, 0.5062808, 1.652107, 0, 0.854902, 1, 1,
0.1111379, 0.6793954, -1.197351, 0, 0.8509804, 1, 1,
0.1114815, 0.2592611, -0.1278771, 0, 0.8431373, 1, 1,
0.1150144, 1.282962, 0.7930535, 0, 0.8392157, 1, 1,
0.1186942, -0.5171068, 3.602903, 0, 0.8313726, 1, 1,
0.1194391, -0.6280186, 4.065143, 0, 0.827451, 1, 1,
0.119657, -0.8527298, 1.869217, 0, 0.8196079, 1, 1,
0.1198173, 0.2475226, 0.2832449, 0, 0.8156863, 1, 1,
0.1207209, 0.6586108, -0.3212233, 0, 0.8078431, 1, 1,
0.1224791, 0.830068, -1.515702, 0, 0.8039216, 1, 1,
0.1288739, 0.4063582, 2.944496, 0, 0.7960784, 1, 1,
0.1291094, -0.05641172, 3.125056, 0, 0.7882353, 1, 1,
0.1326307, 2.002421, 1.300343, 0, 0.7843137, 1, 1,
0.1364085, -1.589418, 4.664708, 0, 0.7764706, 1, 1,
0.1366811, -1.37541, 3.250558, 0, 0.772549, 1, 1,
0.138472, -1.150572, 1.09306, 0, 0.7647059, 1, 1,
0.1388301, -0.6343023, 4.633781, 0, 0.7607843, 1, 1,
0.1389884, 1.538733, 1.182871, 0, 0.7529412, 1, 1,
0.1414187, 0.9607138, 0.07638887, 0, 0.7490196, 1, 1,
0.1463478, 0.3578483, 1.138689, 0, 0.7411765, 1, 1,
0.1478872, 0.1533318, 1.337577, 0, 0.7372549, 1, 1,
0.1528242, 0.9242074, -0.4519268, 0, 0.7294118, 1, 1,
0.1552434, -1.350492, 2.297253, 0, 0.7254902, 1, 1,
0.1591952, 0.8600291, -0.03281627, 0, 0.7176471, 1, 1,
0.160874, 1.483969, 0.7220611, 0, 0.7137255, 1, 1,
0.1645907, -0.2054056, 2.099941, 0, 0.7058824, 1, 1,
0.1659866, -0.9156073, 3.24212, 0, 0.6980392, 1, 1,
0.1679462, 1.30652, -0.5978689, 0, 0.6941177, 1, 1,
0.1693054, 0.06814213, 1.642101, 0, 0.6862745, 1, 1,
0.1709597, -1.247312, 2.581601, 0, 0.682353, 1, 1,
0.1769739, 1.364727, -0.5445941, 0, 0.6745098, 1, 1,
0.1800311, -0.5616563, 1.91364, 0, 0.6705883, 1, 1,
0.1822429, -0.1465027, 2.842953, 0, 0.6627451, 1, 1,
0.1874189, 0.5549848, -2.176934, 0, 0.6588235, 1, 1,
0.1880215, -0.8476751, 3.393331, 0, 0.6509804, 1, 1,
0.1912137, -1.384943, 1.997575, 0, 0.6470588, 1, 1,
0.1912342, -0.7267621, 3.050306, 0, 0.6392157, 1, 1,
0.1937152, -0.09125712, 3.080439, 0, 0.6352941, 1, 1,
0.1939771, 0.7790253, 0.5975376, 0, 0.627451, 1, 1,
0.1940349, -0.1869465, 1.281757, 0, 0.6235294, 1, 1,
0.1952471, -0.8635359, 2.701418, 0, 0.6156863, 1, 1,
0.1957978, 1.126601, 2.933908, 0, 0.6117647, 1, 1,
0.2005044, -0.2443625, 2.918562, 0, 0.6039216, 1, 1,
0.2015582, 0.3134678, 0.7189065, 0, 0.5960785, 1, 1,
0.2032102, 0.3704037, 2.442908, 0, 0.5921569, 1, 1,
0.204682, 1.393415, 2.930334, 0, 0.5843138, 1, 1,
0.2051539, 1.151579, 0.8223034, 0, 0.5803922, 1, 1,
0.2070771, -1.620872, 2.340055, 0, 0.572549, 1, 1,
0.2083167, -1.198939, 3.646083, 0, 0.5686275, 1, 1,
0.2099156, 0.2762138, 0.08478722, 0, 0.5607843, 1, 1,
0.2153911, -0.6129284, 3.044761, 0, 0.5568628, 1, 1,
0.2204251, 0.2699132, 1.46144, 0, 0.5490196, 1, 1,
0.2230756, -0.1181311, 0.6589007, 0, 0.5450981, 1, 1,
0.2237847, 0.9777716, 1.046447, 0, 0.5372549, 1, 1,
0.227644, 1.168007, 1.42886, 0, 0.5333334, 1, 1,
0.2324061, 0.8986263, -0.771495, 0, 0.5254902, 1, 1,
0.2329379, 1.076122, -0.1039971, 0, 0.5215687, 1, 1,
0.2364685, -0.04340974, 0.06176541, 0, 0.5137255, 1, 1,
0.2407621, -2.314577, 4.733105, 0, 0.509804, 1, 1,
0.2414323, 0.9106541, 0.1384677, 0, 0.5019608, 1, 1,
0.2475337, -1.484459, 2.292341, 0, 0.4941176, 1, 1,
0.2508617, -0.7189847, 3.006564, 0, 0.4901961, 1, 1,
0.2512721, -0.1505009, 2.912495, 0, 0.4823529, 1, 1,
0.2519995, 2.642272, 1.105357, 0, 0.4784314, 1, 1,
0.2528369, -1.12877, 3.194036, 0, 0.4705882, 1, 1,
0.2543412, 1.153045, 1.268673, 0, 0.4666667, 1, 1,
0.2560831, 2.283907, -0.1602024, 0, 0.4588235, 1, 1,
0.262255, 0.4397058, 0.1919135, 0, 0.454902, 1, 1,
0.2653984, -1.097518, 4.172099, 0, 0.4470588, 1, 1,
0.2672754, -0.1145176, 1.441575, 0, 0.4431373, 1, 1,
0.2733528, -0.6024362, 1.520295, 0, 0.4352941, 1, 1,
0.2746081, -0.4938542, 1.787437, 0, 0.4313726, 1, 1,
0.2759743, 1.239095, -0.2648327, 0, 0.4235294, 1, 1,
0.2843002, 2.618423, 0.8657457, 0, 0.4196078, 1, 1,
0.2905285, -1.770694, 3.865452, 0, 0.4117647, 1, 1,
0.2909114, -0.9039165, 2.606086, 0, 0.4078431, 1, 1,
0.2915733, 0.2757332, 1.679242, 0, 0.4, 1, 1,
0.2937406, 0.03950537, 3.234795, 0, 0.3921569, 1, 1,
0.2945501, -0.7877215, 2.604281, 0, 0.3882353, 1, 1,
0.2945759, 0.08657955, 2.473946, 0, 0.3803922, 1, 1,
0.2952924, 0.5771429, 3.054598, 0, 0.3764706, 1, 1,
0.2979423, 1.718484, -2.221792, 0, 0.3686275, 1, 1,
0.2991585, 0.5396251, -0.4780901, 0, 0.3647059, 1, 1,
0.3019319, -0.867536, 3.050566, 0, 0.3568628, 1, 1,
0.3059811, 0.09365822, -0.8342227, 0, 0.3529412, 1, 1,
0.3113164, -0.06108489, 2.957411, 0, 0.345098, 1, 1,
0.3122496, 0.7046073, 0.1491528, 0, 0.3411765, 1, 1,
0.313703, -1.038558, 3.867655, 0, 0.3333333, 1, 1,
0.316444, -0.05088231, 2.26523, 0, 0.3294118, 1, 1,
0.3210076, -0.4585094, 1.382873, 0, 0.3215686, 1, 1,
0.3244964, 0.4319143, 1.442276, 0, 0.3176471, 1, 1,
0.3245809, 0.1427225, 0.7769841, 0, 0.3098039, 1, 1,
0.3254577, 0.4208547, 0.9409476, 0, 0.3058824, 1, 1,
0.3255413, -0.1297271, 1.502494, 0, 0.2980392, 1, 1,
0.3261892, -2.646614, 1.473104, 0, 0.2901961, 1, 1,
0.328817, 0.4652869, -0.917407, 0, 0.2862745, 1, 1,
0.3315634, 1.429027, 1.47868, 0, 0.2784314, 1, 1,
0.336801, 0.1076871, 1.96774, 0, 0.2745098, 1, 1,
0.3454408, 1.574318, 0.5870764, 0, 0.2666667, 1, 1,
0.3454833, 0.7061313, 0.4209037, 0, 0.2627451, 1, 1,
0.3462807, -0.2289479, 2.744294, 0, 0.254902, 1, 1,
0.3528111, 1.070406, 1.209281, 0, 0.2509804, 1, 1,
0.3557731, 0.1202099, 0.1994493, 0, 0.2431373, 1, 1,
0.3595023, 0.5678995, 1.327601, 0, 0.2392157, 1, 1,
0.3613398, -0.9987239, 1.300499, 0, 0.2313726, 1, 1,
0.3624601, 1.196975, 1.862458, 0, 0.227451, 1, 1,
0.3689817, 0.5760853, -0.6000468, 0, 0.2196078, 1, 1,
0.3716372, -0.2934071, 2.847561, 0, 0.2156863, 1, 1,
0.3739149, 0.1818298, 2.004524, 0, 0.2078431, 1, 1,
0.3740602, -0.1916533, 2.285306, 0, 0.2039216, 1, 1,
0.3747008, 1.28603, -0.04788705, 0, 0.1960784, 1, 1,
0.3765566, -0.2058451, 3.058962, 0, 0.1882353, 1, 1,
0.3855811, -0.8350553, 1.702166, 0, 0.1843137, 1, 1,
0.385974, 0.7842683, 0.7434359, 0, 0.1764706, 1, 1,
0.3868482, -1.07276, 3.5192, 0, 0.172549, 1, 1,
0.3880693, 0.8236765, -1.617343, 0, 0.1647059, 1, 1,
0.3916661, -1.447165, 3.186207, 0, 0.1607843, 1, 1,
0.3917011, 1.568459, 0.4833121, 0, 0.1529412, 1, 1,
0.3931067, 1.008306, -0.09356809, 0, 0.1490196, 1, 1,
0.4012475, -1.15739, 3.813737, 0, 0.1411765, 1, 1,
0.4016108, 0.5587196, -0.2328579, 0, 0.1372549, 1, 1,
0.4033187, -1.024546, 3.325975, 0, 0.1294118, 1, 1,
0.4067876, -0.003629805, 1.940055, 0, 0.1254902, 1, 1,
0.4068922, -1.235921, 2.781948, 0, 0.1176471, 1, 1,
0.4175469, -0.01042565, 1.190925, 0, 0.1137255, 1, 1,
0.4187676, 1.476427, 1.350969, 0, 0.1058824, 1, 1,
0.4187908, -0.3193475, 2.442868, 0, 0.09803922, 1, 1,
0.4203357, 0.3999023, 1.327311, 0, 0.09411765, 1, 1,
0.4244463, 0.3499762, 0.3403821, 0, 0.08627451, 1, 1,
0.4258315, 0.913892, 1.121696, 0, 0.08235294, 1, 1,
0.4290561, 0.2904601, 1.351862, 0, 0.07450981, 1, 1,
0.4290876, 1.267587, 1.452653, 0, 0.07058824, 1, 1,
0.4320673, -1.617001, 1.691749, 0, 0.0627451, 1, 1,
0.4324405, 1.363888, -1.139948, 0, 0.05882353, 1, 1,
0.4432805, 0.3206385, 0.4909242, 0, 0.05098039, 1, 1,
0.44508, -1.799585, 3.586659, 0, 0.04705882, 1, 1,
0.4465814, 1.196101, 0.633765, 0, 0.03921569, 1, 1,
0.4518108, 0.3668897, 0.5648616, 0, 0.03529412, 1, 1,
0.45613, 1.480726, -1.232628, 0, 0.02745098, 1, 1,
0.459493, -0.6070001, 2.452386, 0, 0.02352941, 1, 1,
0.4609866, 0.08176664, 1.658033, 0, 0.01568628, 1, 1,
0.4611906, -0.2953049, 0.9115232, 0, 0.01176471, 1, 1,
0.4652578, -3.112242, 2.85346, 0, 0.003921569, 1, 1,
0.4671752, -0.1228332, 1.495063, 0.003921569, 0, 1, 1,
0.4694127, -0.3909871, 2.185486, 0.007843138, 0, 1, 1,
0.4697609, 0.03835034, 1.692751, 0.01568628, 0, 1, 1,
0.4731727, 1.015548, 0.8133085, 0.01960784, 0, 1, 1,
0.473727, -0.5981814, 3.356122, 0.02745098, 0, 1, 1,
0.4745185, 0.5429837, 0.2652392, 0.03137255, 0, 1, 1,
0.4762815, 1.349006, 0.207042, 0.03921569, 0, 1, 1,
0.4820846, -0.207474, 2.707323, 0.04313726, 0, 1, 1,
0.4895583, -0.0195524, 3.220931, 0.05098039, 0, 1, 1,
0.4916774, 0.1347482, 0.8856463, 0.05490196, 0, 1, 1,
0.4923735, 1.120752, -1.328843, 0.0627451, 0, 1, 1,
0.4930111, 0.4468197, 1.348624, 0.06666667, 0, 1, 1,
0.4939732, 2.223624, 0.3853844, 0.07450981, 0, 1, 1,
0.496249, -0.3499284, 3.240952, 0.07843138, 0, 1, 1,
0.4971372, -3.422262, 2.992339, 0.08627451, 0, 1, 1,
0.5085968, 0.1896321, 2.029293, 0.09019608, 0, 1, 1,
0.5113817, 0.3211591, 2.662219, 0.09803922, 0, 1, 1,
0.5115355, 1.190387, 0.237221, 0.1058824, 0, 1, 1,
0.516206, -0.3002652, 1.573666, 0.1098039, 0, 1, 1,
0.5185397, 0.7172002, -0.2915887, 0.1176471, 0, 1, 1,
0.5212312, 0.7799842, 1.825463, 0.1215686, 0, 1, 1,
0.5230433, 0.9691328, 1.422567, 0.1294118, 0, 1, 1,
0.525203, 0.0908737, 1.40215, 0.1333333, 0, 1, 1,
0.5262343, -1.526712, 4.006185, 0.1411765, 0, 1, 1,
0.5315481, 1.347356, 2.591926, 0.145098, 0, 1, 1,
0.5333729, -0.8696677, 3.511538, 0.1529412, 0, 1, 1,
0.5391586, 0.09304862, 0.6001346, 0.1568628, 0, 1, 1,
0.5431355, -2.259859, 1.949198, 0.1647059, 0, 1, 1,
0.5482862, 0.6869851, -1.432763, 0.1686275, 0, 1, 1,
0.5519693, -1.922915, 3.591945, 0.1764706, 0, 1, 1,
0.5579029, -0.4596971, 4.322384, 0.1803922, 0, 1, 1,
0.5614443, -0.6003838, 2.542456, 0.1882353, 0, 1, 1,
0.5626491, -1.378535, 1.502992, 0.1921569, 0, 1, 1,
0.5628804, 0.6158388, 1.219657, 0.2, 0, 1, 1,
0.5633591, 0.6891941, 1.795788, 0.2078431, 0, 1, 1,
0.5642008, 0.08692692, 1.538665, 0.2117647, 0, 1, 1,
0.5716218, 0.6146589, 0.8490732, 0.2196078, 0, 1, 1,
0.5723213, 0.5614071, 0.305042, 0.2235294, 0, 1, 1,
0.575595, -0.6847998, 2.689627, 0.2313726, 0, 1, 1,
0.5769978, -0.2366645, 0.6004118, 0.2352941, 0, 1, 1,
0.5781751, 1.681284, -0.5604308, 0.2431373, 0, 1, 1,
0.5808259, -1.499463, 4.796027, 0.2470588, 0, 1, 1,
0.5850304, -1.728721, 3.323137, 0.254902, 0, 1, 1,
0.5874323, -0.6392462, 1.562063, 0.2588235, 0, 1, 1,
0.5916508, 0.7759596, 0.9122542, 0.2666667, 0, 1, 1,
0.5929127, 1.279916, 0.4604853, 0.2705882, 0, 1, 1,
0.6023781, -1.699138, 1.839413, 0.2784314, 0, 1, 1,
0.6053349, 0.6754801, 1.188049, 0.282353, 0, 1, 1,
0.6055544, -0.5947146, 3.966424, 0.2901961, 0, 1, 1,
0.6073921, 1.591387, 0.9373613, 0.2941177, 0, 1, 1,
0.6090692, 0.6922277, 0.262343, 0.3019608, 0, 1, 1,
0.6114383, 0.06068201, 2.84363, 0.3098039, 0, 1, 1,
0.6144791, 0.336983, 1.72152, 0.3137255, 0, 1, 1,
0.6151502, 0.6859285, -0.5638173, 0.3215686, 0, 1, 1,
0.6188484, -0.313302, 1.391277, 0.3254902, 0, 1, 1,
0.6205572, 0.3380863, 0.6818703, 0.3333333, 0, 1, 1,
0.6278342, -1.518359, 2.260834, 0.3372549, 0, 1, 1,
0.634501, -0.5758854, 2.372871, 0.345098, 0, 1, 1,
0.6352593, 1.589323, 1.132871, 0.3490196, 0, 1, 1,
0.6387894, 0.1303784, 0.5291041, 0.3568628, 0, 1, 1,
0.6424362, 0.6291236, 2.241237, 0.3607843, 0, 1, 1,
0.6528917, -1.858423, 4.67285, 0.3686275, 0, 1, 1,
0.6702302, 1.098745, -0.6395358, 0.372549, 0, 1, 1,
0.6710387, -0.9080935, 2.40594, 0.3803922, 0, 1, 1,
0.6771619, -0.4368125, 3.634082, 0.3843137, 0, 1, 1,
0.6777499, 0.7447168, 0.9540822, 0.3921569, 0, 1, 1,
0.6841879, 0.1072816, 3.151126, 0.3960784, 0, 1, 1,
0.6896272, -0.751633, 2.079619, 0.4039216, 0, 1, 1,
0.6930298, 0.6065299, -0.7460858, 0.4117647, 0, 1, 1,
0.6934794, 0.2910867, 1.898955, 0.4156863, 0, 1, 1,
0.7010457, -2.646453, 2.108467, 0.4235294, 0, 1, 1,
0.7022808, 0.1337825, 0.3626155, 0.427451, 0, 1, 1,
0.7051706, 0.6066471, 0.4356975, 0.4352941, 0, 1, 1,
0.7060434, 0.7336997, 0.338793, 0.4392157, 0, 1, 1,
0.7075432, 0.5469478, 1.345834, 0.4470588, 0, 1, 1,
0.708816, -0.6658313, 2.467169, 0.4509804, 0, 1, 1,
0.7115155, -1.666028, 2.190507, 0.4588235, 0, 1, 1,
0.7232875, -0.7557067, 2.255677, 0.4627451, 0, 1, 1,
0.7255294, 0.2859618, 1.431398, 0.4705882, 0, 1, 1,
0.7256767, 1.050242, 0.0191922, 0.4745098, 0, 1, 1,
0.7296647, -1.595558, 2.515285, 0.4823529, 0, 1, 1,
0.7318922, -2.677701, 2.958453, 0.4862745, 0, 1, 1,
0.7330105, 0.01066499, 1.071478, 0.4941176, 0, 1, 1,
0.7375194, -0.9735115, 3.684656, 0.5019608, 0, 1, 1,
0.7375372, -1.395206, 5.620006, 0.5058824, 0, 1, 1,
0.7390234, -1.240141, 3.126883, 0.5137255, 0, 1, 1,
0.7440416, -2.929857, 2.799012, 0.5176471, 0, 1, 1,
0.747919, 1.64804, 1.321331, 0.5254902, 0, 1, 1,
0.7491413, 0.6297179, 1.998379, 0.5294118, 0, 1, 1,
0.7491677, 0.1171155, 1.260779, 0.5372549, 0, 1, 1,
0.7506996, -0.2067474, 0.4766815, 0.5411765, 0, 1, 1,
0.751179, 1.430793, 0.6212021, 0.5490196, 0, 1, 1,
0.7529853, 0.1957732, 1.137691, 0.5529412, 0, 1, 1,
0.7541825, -0.7999017, 2.475919, 0.5607843, 0, 1, 1,
0.7593836, -1.69148, 1.644492, 0.5647059, 0, 1, 1,
0.7615265, 0.231128, 0.4046587, 0.572549, 0, 1, 1,
0.7639692, 0.7121753, 3.129357, 0.5764706, 0, 1, 1,
0.7645755, 0.8636827, 1.050503, 0.5843138, 0, 1, 1,
0.766099, 1.380079, 0.9230043, 0.5882353, 0, 1, 1,
0.7734188, -2.333179, 3.120972, 0.5960785, 0, 1, 1,
0.7750041, -1.013947, 2.054342, 0.6039216, 0, 1, 1,
0.7769884, -0.942158, 2.450273, 0.6078432, 0, 1, 1,
0.7800819, -0.3350115, 0.203023, 0.6156863, 0, 1, 1,
0.7806967, -0.9749486, 3.611336, 0.6196079, 0, 1, 1,
0.7885287, -1.537036, 3.339887, 0.627451, 0, 1, 1,
0.7890012, 0.6127077, 1.37163, 0.6313726, 0, 1, 1,
0.7895618, -2.323326, 2.889984, 0.6392157, 0, 1, 1,
0.7897821, -1.319123, 2.453277, 0.6431373, 0, 1, 1,
0.7919249, -0.8150997, 3.333262, 0.6509804, 0, 1, 1,
0.7932375, -0.6145183, 1.759612, 0.654902, 0, 1, 1,
0.7956722, -1.635223, 2.962449, 0.6627451, 0, 1, 1,
0.7961146, -0.3013798, 2.756855, 0.6666667, 0, 1, 1,
0.7995266, -0.2237363, 2.517459, 0.6745098, 0, 1, 1,
0.8039435, -0.378569, 3.248096, 0.6784314, 0, 1, 1,
0.8077281, -0.1919786, 0.5382228, 0.6862745, 0, 1, 1,
0.8079747, -0.5800542, 1.190552, 0.6901961, 0, 1, 1,
0.8103881, 2.037312, 0.828958, 0.6980392, 0, 1, 1,
0.8125612, 0.400196, 1.667364, 0.7058824, 0, 1, 1,
0.8150249, 1.020491, -0.3277376, 0.7098039, 0, 1, 1,
0.8157951, -1.486208, 2.27379, 0.7176471, 0, 1, 1,
0.8167791, 1.344029, -0.6715041, 0.7215686, 0, 1, 1,
0.8177367, 0.4399645, 1.628121, 0.7294118, 0, 1, 1,
0.8192344, 0.6057221, 0.2117406, 0.7333333, 0, 1, 1,
0.8206686, -0.502795, 1.105059, 0.7411765, 0, 1, 1,
0.8250523, -0.1907381, 0.7461911, 0.7450981, 0, 1, 1,
0.8263835, -0.1841528, 2.825254, 0.7529412, 0, 1, 1,
0.8265225, 0.02053013, 0.4997962, 0.7568628, 0, 1, 1,
0.8316306, 0.5826361, 0.6530011, 0.7647059, 0, 1, 1,
0.8322973, 0.449649, 2.770862, 0.7686275, 0, 1, 1,
0.8345695, 0.6345201, 1.455886, 0.7764706, 0, 1, 1,
0.8375772, 2.796834, 1.411264, 0.7803922, 0, 1, 1,
0.8444197, -0.09517568, 1.256296, 0.7882353, 0, 1, 1,
0.8473355, -1.131618, 2.760621, 0.7921569, 0, 1, 1,
0.8476118, -0.807237, 3.502108, 0.8, 0, 1, 1,
0.8572494, 1.388446, 0.752077, 0.8078431, 0, 1, 1,
0.858236, -0.02245396, 2.218725, 0.8117647, 0, 1, 1,
0.861526, 0.7330124, 1.737867, 0.8196079, 0, 1, 1,
0.8711821, -0.2734538, 3.837877, 0.8235294, 0, 1, 1,
0.8794371, -0.9394997, 1.980187, 0.8313726, 0, 1, 1,
0.8798916, -0.9952281, 2.100129, 0.8352941, 0, 1, 1,
0.881333, -0.9771779, 2.893433, 0.8431373, 0, 1, 1,
0.8875672, 0.3148241, 1.86962, 0.8470588, 0, 1, 1,
0.8934322, -1.093611, 2.944178, 0.854902, 0, 1, 1,
0.8960817, -0.9719422, 2.205568, 0.8588235, 0, 1, 1,
0.9092181, -1.213659, 3.255614, 0.8666667, 0, 1, 1,
0.9160898, 0.4207373, 1.042207, 0.8705882, 0, 1, 1,
0.923258, 0.8145471, 0.1565846, 0.8784314, 0, 1, 1,
0.9267947, -1.49635, 2.80586, 0.8823529, 0, 1, 1,
0.9446693, 0.4332255, 1.687993, 0.8901961, 0, 1, 1,
0.9500076, 0.3077722, 0.0256159, 0.8941177, 0, 1, 1,
0.9597945, 1.057905, 0.08120291, 0.9019608, 0, 1, 1,
0.9653962, 1.405723, -0.7670331, 0.9098039, 0, 1, 1,
0.9661158, -0.1178523, 0.6129957, 0.9137255, 0, 1, 1,
0.9682024, 1.040059, 2.659812, 0.9215686, 0, 1, 1,
0.9693663, 1.517219, -2.3294, 0.9254902, 0, 1, 1,
0.9728864, 0.1249177, 1.656571, 0.9333333, 0, 1, 1,
0.9736899, 1.078417, -0.7532854, 0.9372549, 0, 1, 1,
0.9757908, 0.04069165, 1.127221, 0.945098, 0, 1, 1,
0.9844116, -0.2650919, 1.054884, 0.9490196, 0, 1, 1,
0.9890786, -0.5577954, 0.793761, 0.9568627, 0, 1, 1,
0.9894451, 1.177361, -0.5876134, 0.9607843, 0, 1, 1,
0.9931079, 0.05733641, 2.342315, 0.9686275, 0, 1, 1,
0.9963223, -0.07985387, 1.233801, 0.972549, 0, 1, 1,
1.001689, -0.6052909, 1.622225, 0.9803922, 0, 1, 1,
1.002255, 0.5220378, 1.299654, 0.9843137, 0, 1, 1,
1.004649, 0.5614344, 1.72683, 0.9921569, 0, 1, 1,
1.019991, 0.713128, 0.9712248, 0.9960784, 0, 1, 1,
1.02528, -2.455215, 3.721951, 1, 0, 0.9960784, 1,
1.026203, 0.1546293, 1.962382, 1, 0, 0.9882353, 1,
1.031463, 1.913334, 0.6356934, 1, 0, 0.9843137, 1,
1.039499, 0.1492532, 1.517283, 1, 0, 0.9764706, 1,
1.050431, -1.300578, 2.428351, 1, 0, 0.972549, 1,
1.052425, 1.216954, 0.9386916, 1, 0, 0.9647059, 1,
1.052669, -1.546338, 3.293448, 1, 0, 0.9607843, 1,
1.054502, -2.154343, 3.712198, 1, 0, 0.9529412, 1,
1.055253, -0.6050777, 1.444069, 1, 0, 0.9490196, 1,
1.057374, 0.5948063, 3.025275, 1, 0, 0.9411765, 1,
1.059657, -2.273573, 3.38161, 1, 0, 0.9372549, 1,
1.059939, -0.05552934, 0.6712471, 1, 0, 0.9294118, 1,
1.090795, 0.7714868, 1.897216, 1, 0, 0.9254902, 1,
1.110498, -0.2675621, 0.2335373, 1, 0, 0.9176471, 1,
1.110807, 0.7740309, 0.2280862, 1, 0, 0.9137255, 1,
1.112876, 1.425191, -1.337247, 1, 0, 0.9058824, 1,
1.112895, -0.7849836, 2.2858, 1, 0, 0.9019608, 1,
1.117887, 0.7750561, 1.017285, 1, 0, 0.8941177, 1,
1.126237, -0.2302209, 2.517251, 1, 0, 0.8862745, 1,
1.126248, 0.883054, 0.7427619, 1, 0, 0.8823529, 1,
1.127625, 0.3901618, 2.254003, 1, 0, 0.8745098, 1,
1.128159, -0.5817006, 2.104066, 1, 0, 0.8705882, 1,
1.13844, -0.5967796, 2.161088, 1, 0, 0.8627451, 1,
1.139629, -1.347931, 2.265257, 1, 0, 0.8588235, 1,
1.140881, -0.640063, 2.757008, 1, 0, 0.8509804, 1,
1.158996, -0.8879325, 4.309258, 1, 0, 0.8470588, 1,
1.16127, 1.550275, 0.1539953, 1, 0, 0.8392157, 1,
1.168411, 0.7217585, 1.092894, 1, 0, 0.8352941, 1,
1.17762, 1.690782, 0.9460527, 1, 0, 0.827451, 1,
1.205137, -0.4714628, 1.291121, 1, 0, 0.8235294, 1,
1.207443, -1.217522, 1.847109, 1, 0, 0.8156863, 1,
1.210669, 0.9117274, 0.7503551, 1, 0, 0.8117647, 1,
1.217047, 0.3889495, 0.6363406, 1, 0, 0.8039216, 1,
1.219304, 1.986371, 1.891034, 1, 0, 0.7960784, 1,
1.223561, -0.037434, -0.3697556, 1, 0, 0.7921569, 1,
1.234778, 0.4519357, -0.7328804, 1, 0, 0.7843137, 1,
1.243806, -0.03625644, 0.1308341, 1, 0, 0.7803922, 1,
1.251186, 1.051764, -0.970794, 1, 0, 0.772549, 1,
1.254118, -0.8204716, 1.505899, 1, 0, 0.7686275, 1,
1.259577, 0.556365, 1.198549, 1, 0, 0.7607843, 1,
1.26023, 0.7898937, 1.204718, 1, 0, 0.7568628, 1,
1.262087, 0.1157094, 0.8267654, 1, 0, 0.7490196, 1,
1.264639, -0.367999, 1.741494, 1, 0, 0.7450981, 1,
1.266342, 0.0448129, 2.769121, 1, 0, 0.7372549, 1,
1.266411, -0.1717534, 2.24752, 1, 0, 0.7333333, 1,
1.275169, -1.158986, 1.132231, 1, 0, 0.7254902, 1,
1.284289, -0.4229329, 0.6038292, 1, 0, 0.7215686, 1,
1.291212, 0.4222113, 2.632799, 1, 0, 0.7137255, 1,
1.297212, 1.77631, 2.75124, 1, 0, 0.7098039, 1,
1.301615, 1.300913, 0.9678758, 1, 0, 0.7019608, 1,
1.302322, 1.046482, 0.2747004, 1, 0, 0.6941177, 1,
1.305585, -0.06089075, -0.06460926, 1, 0, 0.6901961, 1,
1.307256, 1.503671, -0.7929183, 1, 0, 0.682353, 1,
1.315861, 0.9088903, 1.09734, 1, 0, 0.6784314, 1,
1.316449, 0.654502, -0.3649736, 1, 0, 0.6705883, 1,
1.317085, 0.1447183, 0.1966528, 1, 0, 0.6666667, 1,
1.323923, 0.1228571, 2.631244, 1, 0, 0.6588235, 1,
1.324096, -0.9486274, 2.286444, 1, 0, 0.654902, 1,
1.330212, 0.6272804, 0.3503706, 1, 0, 0.6470588, 1,
1.330565, -1.302417, 2.483653, 1, 0, 0.6431373, 1,
1.355733, -0.4511733, 1.78585, 1, 0, 0.6352941, 1,
1.356175, -0.7706667, 2.062722, 1, 0, 0.6313726, 1,
1.356997, -1.519784, 2.3592, 1, 0, 0.6235294, 1,
1.357665, -0.8200797, 1.995821, 1, 0, 0.6196079, 1,
1.36031, -0.7793638, 1.86563, 1, 0, 0.6117647, 1,
1.36154, -2.554671, 3.490307, 1, 0, 0.6078432, 1,
1.362273, 1.16343, 1.140108, 1, 0, 0.6, 1,
1.364494, 0.1126312, 2.253667, 1, 0, 0.5921569, 1,
1.370966, -0.170535, 2.058786, 1, 0, 0.5882353, 1,
1.371369, 1.015538, 1.034794, 1, 0, 0.5803922, 1,
1.377905, -0.4983203, 3.415981, 1, 0, 0.5764706, 1,
1.387861, -1.355232, 1.653538, 1, 0, 0.5686275, 1,
1.39308, -0.526222, 3.288417, 1, 0, 0.5647059, 1,
1.419456, -0.7424682, 0.1575722, 1, 0, 0.5568628, 1,
1.421582, -0.0274847, 3.24369, 1, 0, 0.5529412, 1,
1.426933, -0.4573923, 1.34487, 1, 0, 0.5450981, 1,
1.430297, -0.2039177, 0.6260413, 1, 0, 0.5411765, 1,
1.431984, 0.4717326, -0.08492088, 1, 0, 0.5333334, 1,
1.438853, -0.6476532, 3.419115, 1, 0, 0.5294118, 1,
1.444224, -0.5804064, 3.527019, 1, 0, 0.5215687, 1,
1.472144, -0.03052703, 0.7751227, 1, 0, 0.5176471, 1,
1.477727, -0.3587691, 2.934241, 1, 0, 0.509804, 1,
1.478392, -1.10901, 0.342628, 1, 0, 0.5058824, 1,
1.483068, -1.174755, 2.430773, 1, 0, 0.4980392, 1,
1.484068, 1.089317, 2.083175, 1, 0, 0.4901961, 1,
1.495078, -0.5059654, 2.730798, 1, 0, 0.4862745, 1,
1.500183, 0.2279349, 1.808533, 1, 0, 0.4784314, 1,
1.505531, 1.028794, 1.28261, 1, 0, 0.4745098, 1,
1.509911, 0.2193536, -0.8740861, 1, 0, 0.4666667, 1,
1.510503, -0.3697075, 1.187957, 1, 0, 0.4627451, 1,
1.514226, 0.296083, 0.9980199, 1, 0, 0.454902, 1,
1.523985, 0.1987403, 0.5942191, 1, 0, 0.4509804, 1,
1.524958, 1.638091, 1.401993, 1, 0, 0.4431373, 1,
1.526062, -1.081221, 2.222439, 1, 0, 0.4392157, 1,
1.530763, 2.030892, -0.1941765, 1, 0, 0.4313726, 1,
1.554968, 0.4104528, 2.85773, 1, 0, 0.427451, 1,
1.557122, -0.01582233, 3.049575, 1, 0, 0.4196078, 1,
1.56398, -0.6092151, -0.05720527, 1, 0, 0.4156863, 1,
1.571081, 0.005451644, 1.965615, 1, 0, 0.4078431, 1,
1.5719, -0.4138435, 2.147655, 1, 0, 0.4039216, 1,
1.581975, -0.5858016, 1.380659, 1, 0, 0.3960784, 1,
1.590909, -0.7123089, 2.027745, 1, 0, 0.3882353, 1,
1.595448, -1.001318, 1.973943, 1, 0, 0.3843137, 1,
1.602237, 0.8628151, 1.628284, 1, 0, 0.3764706, 1,
1.605317, 1.633732, 0.01648791, 1, 0, 0.372549, 1,
1.60834, 0.486844, 0.02929004, 1, 0, 0.3647059, 1,
1.617639, 0.7238745, 1.26627, 1, 0, 0.3607843, 1,
1.638005, 0.1890619, 1.626562, 1, 0, 0.3529412, 1,
1.644904, 0.08447134, 0.7398305, 1, 0, 0.3490196, 1,
1.656079, 1.600808, 1.176978, 1, 0, 0.3411765, 1,
1.667245, 1.1583, 0.554644, 1, 0, 0.3372549, 1,
1.670453, -0.08389726, 0.8689035, 1, 0, 0.3294118, 1,
1.679413, 0.7173054, 0.7707787, 1, 0, 0.3254902, 1,
1.682594, 0.8108234, 2.081751, 1, 0, 0.3176471, 1,
1.68369, 0.3757566, -1.959867, 1, 0, 0.3137255, 1,
1.685433, 0.007678211, 1.941527, 1, 0, 0.3058824, 1,
1.688641, -2.575398, 2.64, 1, 0, 0.2980392, 1,
1.699326, 1.27303, -0.4981517, 1, 0, 0.2941177, 1,
1.701359, 0.4443775, 1.233924, 1, 0, 0.2862745, 1,
1.702359, -1.806709, 2.210244, 1, 0, 0.282353, 1,
1.706597, 0.6033064, 1.010676, 1, 0, 0.2745098, 1,
1.711709, -1.055401, 1.717979, 1, 0, 0.2705882, 1,
1.720918, -0.7401198, 3.170529, 1, 0, 0.2627451, 1,
1.729966, 0.3947811, 2.79185, 1, 0, 0.2588235, 1,
1.730788, 0.1131148, 1.235541, 1, 0, 0.2509804, 1,
1.73824, 1.906441, 2.202799, 1, 0, 0.2470588, 1,
1.743126, 0.4345872, 0.3771819, 1, 0, 0.2392157, 1,
1.749074, -0.5987136, 2.02751, 1, 0, 0.2352941, 1,
1.763153, 1.082006, 0.5116171, 1, 0, 0.227451, 1,
1.763311, 0.2304071, 0.8032622, 1, 0, 0.2235294, 1,
1.794735, -0.7282169, 2.101303, 1, 0, 0.2156863, 1,
1.796679, 0.5191301, 0.9256856, 1, 0, 0.2117647, 1,
1.808006, -2.603167, 1.130736, 1, 0, 0.2039216, 1,
1.810299, -0.9438089, 0.7547261, 1, 0, 0.1960784, 1,
1.814579, -0.04194755, 4.489836, 1, 0, 0.1921569, 1,
1.815592, 0.7706177, 0.514644, 1, 0, 0.1843137, 1,
1.817619, 0.4762114, 0.0381509, 1, 0, 0.1803922, 1,
1.818317, -0.6829467, 0.80477, 1, 0, 0.172549, 1,
1.831687, -1.238962, 3.198281, 1, 0, 0.1686275, 1,
1.884818, -1.569564, 2.923881, 1, 0, 0.1607843, 1,
1.894721, 0.03668504, 4.147076, 1, 0, 0.1568628, 1,
1.89978, -0.8705545, 1.192527, 1, 0, 0.1490196, 1,
1.902866, -1.443814, 1.991626, 1, 0, 0.145098, 1,
1.932445, -2.389706, 3.057855, 1, 0, 0.1372549, 1,
1.950262, -1.975579, 0.6169715, 1, 0, 0.1333333, 1,
2.023118, -1.508994, 2.147651, 1, 0, 0.1254902, 1,
2.052969, -1.826062, 3.362324, 1, 0, 0.1215686, 1,
2.055012, 0.8040305, 2.354515, 1, 0, 0.1137255, 1,
2.069944, 0.6861746, -0.3421337, 1, 0, 0.1098039, 1,
2.07035, 0.1379658, 1.522651, 1, 0, 0.1019608, 1,
2.092832, 2.037673, -0.3703228, 1, 0, 0.09411765, 1,
2.103558, 0.7750304, 2.197391, 1, 0, 0.09019608, 1,
2.135567, 1.683475, -0.376667, 1, 0, 0.08235294, 1,
2.159015, -0.7287018, 3.293766, 1, 0, 0.07843138, 1,
2.19075, -1.647544, 2.094172, 1, 0, 0.07058824, 1,
2.19427, -1.045154, 2.16004, 1, 0, 0.06666667, 1,
2.228802, 1.292188, 3.533434, 1, 0, 0.05882353, 1,
2.264451, 0.09555686, 0.3468569, 1, 0, 0.05490196, 1,
2.264924, -1.607634, 2.838053, 1, 0, 0.04705882, 1,
2.296177, 0.7185258, -1.222006, 1, 0, 0.04313726, 1,
2.383438, 1.105888, -0.7463671, 1, 0, 0.03529412, 1,
2.472466, -0.4624118, 1.864915, 1, 0, 0.03137255, 1,
2.501529, 0.005864954, -0.7749972, 1, 0, 0.02352941, 1,
2.670081, 0.5070385, 0.3336246, 1, 0, 0.01960784, 1,
3.102628, -0.3664264, 1.297306, 1, 0, 0.01176471, 1,
3.275581, -0.3449022, -0.513003, 1, 0, 0.007843138, 1
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
0.2720318, -5.019613, -6.853404, 0, -0.5, 0.5, 0.5,
0.2720318, -5.019613, -6.853404, 1, -0.5, 0.5, 0.5,
0.2720318, -5.019613, -6.853404, 1, 1.5, 0.5, 0.5,
0.2720318, -5.019613, -6.853404, 0, 1.5, 0.5, 0.5
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
-3.749721, -0.5449561, -6.853404, 0, -0.5, 0.5, 0.5,
-3.749721, -0.5449561, -6.853404, 1, -0.5, 0.5, 0.5,
-3.749721, -0.5449561, -6.853404, 1, 1.5, 0.5, 0.5,
-3.749721, -0.5449561, -6.853404, 0, 1.5, 0.5, 0.5
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
-3.749721, -5.019613, 0.2872097, 0, -0.5, 0.5, 0.5,
-3.749721, -5.019613, 0.2872097, 1, -0.5, 0.5, 0.5,
-3.749721, -5.019613, 0.2872097, 1, 1.5, 0.5, 0.5,
-3.749721, -5.019613, 0.2872097, 0, 1.5, 0.5, 0.5
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
-2, -3.987, -5.20557,
3, -3.987, -5.20557,
-2, -3.987, -5.20557,
-2, -4.159102, -5.480209,
-1, -3.987, -5.20557,
-1, -4.159102, -5.480209,
0, -3.987, -5.20557,
0, -4.159102, -5.480209,
1, -3.987, -5.20557,
1, -4.159102, -5.480209,
2, -3.987, -5.20557,
2, -4.159102, -5.480209,
3, -3.987, -5.20557,
3, -4.159102, -5.480209
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
-2, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
-2, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
-2, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
-2, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5,
-1, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
-1, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
-1, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
-1, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5,
0, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
0, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
0, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
0, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5,
1, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
1, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
1, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
1, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5,
2, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
2, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
2, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
2, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5,
3, -4.503306, -6.029487, 0, -0.5, 0.5, 0.5,
3, -4.503306, -6.029487, 1, -0.5, 0.5, 0.5,
3, -4.503306, -6.029487, 1, 1.5, 0.5, 0.5,
3, -4.503306, -6.029487, 0, 1.5, 0.5, 0.5
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
-2.821624, -3, -5.20557,
-2.821624, 2, -5.20557,
-2.821624, -3, -5.20557,
-2.976307, -3, -5.480209,
-2.821624, -2, -5.20557,
-2.976307, -2, -5.480209,
-2.821624, -1, -5.20557,
-2.976307, -1, -5.480209,
-2.821624, 0, -5.20557,
-2.976307, 0, -5.480209,
-2.821624, 1, -5.20557,
-2.976307, 1, -5.480209,
-2.821624, 2, -5.20557,
-2.976307, 2, -5.480209
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
-3.285672, -3, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, -3, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, -3, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, -3, -6.029487, 0, 1.5, 0.5, 0.5,
-3.285672, -2, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, -2, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, -2, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, -2, -6.029487, 0, 1.5, 0.5, 0.5,
-3.285672, -1, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, -1, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, -1, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, -1, -6.029487, 0, 1.5, 0.5, 0.5,
-3.285672, 0, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, 0, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, 0, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, 0, -6.029487, 0, 1.5, 0.5, 0.5,
-3.285672, 1, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, 1, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, 1, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, 1, -6.029487, 0, 1.5, 0.5, 0.5,
-3.285672, 2, -6.029487, 0, -0.5, 0.5, 0.5,
-3.285672, 2, -6.029487, 1, -0.5, 0.5, 0.5,
-3.285672, 2, -6.029487, 1, 1.5, 0.5, 0.5,
-3.285672, 2, -6.029487, 0, 1.5, 0.5, 0.5
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
-2.821624, -3.987, -4,
-2.821624, -3.987, 4,
-2.821624, -3.987, -4,
-2.976307, -4.159102, -4,
-2.821624, -3.987, -2,
-2.976307, -4.159102, -2,
-2.821624, -3.987, 0,
-2.976307, -4.159102, 0,
-2.821624, -3.987, 2,
-2.976307, -4.159102, 2,
-2.821624, -3.987, 4,
-2.976307, -4.159102, 4
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
-3.285672, -4.503306, -4, 0, -0.5, 0.5, 0.5,
-3.285672, -4.503306, -4, 1, -0.5, 0.5, 0.5,
-3.285672, -4.503306, -4, 1, 1.5, 0.5, 0.5,
-3.285672, -4.503306, -4, 0, 1.5, 0.5, 0.5,
-3.285672, -4.503306, -2, 0, -0.5, 0.5, 0.5,
-3.285672, -4.503306, -2, 1, -0.5, 0.5, 0.5,
-3.285672, -4.503306, -2, 1, 1.5, 0.5, 0.5,
-3.285672, -4.503306, -2, 0, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 0, 0, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 0, 1, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 0, 1, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 0, 0, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 2, 0, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 2, 1, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 2, 1, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 2, 0, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 4, 0, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 4, 1, -0.5, 0.5, 0.5,
-3.285672, -4.503306, 4, 1, 1.5, 0.5, 0.5,
-3.285672, -4.503306, 4, 0, 1.5, 0.5, 0.5
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
-2.821624, -3.987, -5.20557,
-2.821624, 2.897088, -5.20557,
-2.821624, -3.987, 5.77999,
-2.821624, 2.897088, 5.77999,
-2.821624, -3.987, -5.20557,
-2.821624, -3.987, 5.77999,
-2.821624, 2.897088, -5.20557,
-2.821624, 2.897088, 5.77999,
-2.821624, -3.987, -5.20557,
3.365688, -3.987, -5.20557,
-2.821624, -3.987, 5.77999,
3.365688, -3.987, 5.77999,
-2.821624, 2.897088, -5.20557,
3.365688, 2.897088, -5.20557,
-2.821624, 2.897088, 5.77999,
3.365688, 2.897088, 5.77999,
3.365688, -3.987, -5.20557,
3.365688, 2.897088, -5.20557,
3.365688, -3.987, 5.77999,
3.365688, 2.897088, 5.77999,
3.365688, -3.987, -5.20557,
3.365688, -3.987, 5.77999,
3.365688, 2.897088, -5.20557,
3.365688, 2.897088, 5.77999
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
var radius = 7.670683;
var distance = 34.12774;
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
mvMatrix.translate( -0.2720318, 0.5449561, -0.2872097 );
mvMatrix.scale( 1.340436, 1.204763, 0.7549632 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12774);
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
Carbophos<-read.table("Carbophos.xyz")
```

```
## Error in read.table("Carbophos.xyz"): no lines available in input
```

```r
x<-Carbophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbophos' not found
```

```r
y<-Carbophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbophos' not found
```

```r
z<-Carbophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbophos' not found
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
-2.731518, 1.243674, -0.7350113, 0, 0, 1, 1, 1,
-2.622162, -0.5153908, -2.179117, 1, 0, 0, 1, 1,
-2.550608, -0.3847421, -1.655563, 1, 0, 0, 1, 1,
-2.477513, -0.508829, -1.417165, 1, 0, 0, 1, 1,
-2.445889, 0.7071968, -1.788926, 1, 0, 0, 1, 1,
-2.395314, -0.09057655, -3.096519, 1, 0, 0, 1, 1,
-2.36977, 0.02768539, -0.4328344, 0, 0, 0, 1, 1,
-2.363664, -0.6221238, -1.513652, 0, 0, 0, 1, 1,
-2.268888, 0.6540239, 1.081213, 0, 0, 0, 1, 1,
-2.24681, 1.301665, 0.1024633, 0, 0, 0, 1, 1,
-2.145141, -1.540904, -1.143303, 0, 0, 0, 1, 1,
-2.079413, 0.8260011, -0.8430662, 0, 0, 0, 1, 1,
-2.05695, -0.2950003, -1.993903, 0, 0, 0, 1, 1,
-2.055449, 1.18349, -1.39945, 1, 1, 1, 1, 1,
-2.025658, -0.5091611, -1.318362, 1, 1, 1, 1, 1,
-2.009828, -0.0006459222, -3.775027, 1, 1, 1, 1, 1,
-1.99158, 0.561425, 0.2675482, 1, 1, 1, 1, 1,
-1.983858, -2.015975, -2.473573, 1, 1, 1, 1, 1,
-1.973485, 1.14554, -0.0605993, 1, 1, 1, 1, 1,
-1.948555, 1.053116, -1.60148, 1, 1, 1, 1, 1,
-1.945207, -0.1308309, -1.187367, 1, 1, 1, 1, 1,
-1.916634, -0.4502684, -3.309827, 1, 1, 1, 1, 1,
-1.912977, 0.5699711, -1.148333, 1, 1, 1, 1, 1,
-1.899505, 1.167899, -0.4384263, 1, 1, 1, 1, 1,
-1.846156, 0.1330959, -1.044576, 1, 1, 1, 1, 1,
-1.836624, 0.009002333, -2.709295, 1, 1, 1, 1, 1,
-1.825568, 1.251637, -1.935062, 1, 1, 1, 1, 1,
-1.798909, -1.167918, -1.3973, 1, 1, 1, 1, 1,
-1.791218, 0.7452768, -1.191136, 0, 0, 1, 1, 1,
-1.767652, -0.3914645, -1.805784, 1, 0, 0, 1, 1,
-1.747157, -0.3022169, -1.345493, 1, 0, 0, 1, 1,
-1.745528, 0.1808114, -1.155647, 1, 0, 0, 1, 1,
-1.722256, -1.350081, -2.25566, 1, 0, 0, 1, 1,
-1.721229, -0.6510688, -1.181263, 1, 0, 0, 1, 1,
-1.714998, 0.4064537, -1.006067, 0, 0, 0, 1, 1,
-1.690292, -0.3215262, -1.49205, 0, 0, 0, 1, 1,
-1.686704, 0.4281017, -0.8101556, 0, 0, 0, 1, 1,
-1.673653, 1.590048, -0.7690947, 0, 0, 0, 1, 1,
-1.660712, 0.6956249, -1.43306, 0, 0, 0, 1, 1,
-1.648874, -0.4933275, -1.890874, 0, 0, 0, 1, 1,
-1.647642, -0.1851954, -2.503978, 0, 0, 0, 1, 1,
-1.644463, -0.4337067, -2.094874, 1, 1, 1, 1, 1,
-1.641756, -2.348202, -1.688797, 1, 1, 1, 1, 1,
-1.633761, -0.3376309, -2.631921, 1, 1, 1, 1, 1,
-1.631764, 0.5097811, -2.568806, 1, 1, 1, 1, 1,
-1.631325, -2.15781, -2.956234, 1, 1, 1, 1, 1,
-1.595356, -1.633862, -2.79664, 1, 1, 1, 1, 1,
-1.591944, -0.1996394, -0.5121935, 1, 1, 1, 1, 1,
-1.591125, 0.02000645, -1.155195, 1, 1, 1, 1, 1,
-1.58573, 1.345744, -0.009683856, 1, 1, 1, 1, 1,
-1.561126, 0.2312526, 0.04230777, 1, 1, 1, 1, 1,
-1.557204, -0.3260867, -2.106749, 1, 1, 1, 1, 1,
-1.552516, 1.254346, 0.4845084, 1, 1, 1, 1, 1,
-1.551269, 0.2272338, -1.042448, 1, 1, 1, 1, 1,
-1.550605, -0.8944634, -3.057636, 1, 1, 1, 1, 1,
-1.549009, -0.8834419, -1.9307, 1, 1, 1, 1, 1,
-1.538422, -0.3326105, -2.319908, 0, 0, 1, 1, 1,
-1.530074, -0.2038867, -2.005661, 1, 0, 0, 1, 1,
-1.525938, -1.405655, -2.063452, 1, 0, 0, 1, 1,
-1.525859, 0.3863064, -1.115976, 1, 0, 0, 1, 1,
-1.511708, 0.3663255, -1.348691, 1, 0, 0, 1, 1,
-1.505635, 0.1216998, -2.017807, 1, 0, 0, 1, 1,
-1.47599, 0.08072381, 0.04022473, 0, 0, 0, 1, 1,
-1.473794, 0.2601498, -2.400065, 0, 0, 0, 1, 1,
-1.472542, -0.7730575, -2.009082, 0, 0, 0, 1, 1,
-1.455571, -1.296265, -2.012373, 0, 0, 0, 1, 1,
-1.450438, 0.1670419, -1.442297, 0, 0, 0, 1, 1,
-1.440812, 1.954427, -2.245014, 0, 0, 0, 1, 1,
-1.430242, -1.029494, -1.926315, 0, 0, 0, 1, 1,
-1.414597, -1.246036, -2.21073, 1, 1, 1, 1, 1,
-1.413988, -0.6686162, -1.474647, 1, 1, 1, 1, 1,
-1.407114, -0.696125, -1.434031, 1, 1, 1, 1, 1,
-1.407018, 1.491235, -0.2544295, 1, 1, 1, 1, 1,
-1.39637, 0.2960633, -2.240279, 1, 1, 1, 1, 1,
-1.392368, -0.009333129, -2.11072, 1, 1, 1, 1, 1,
-1.375987, 2.552857, -0.1993934, 1, 1, 1, 1, 1,
-1.372352, -1.232207, -4.256173, 1, 1, 1, 1, 1,
-1.360327, 0.9500904, -1.054383, 1, 1, 1, 1, 1,
-1.358236, -0.7126575, -1.855791, 1, 1, 1, 1, 1,
-1.356381, 0.8986199, -1.026512, 1, 1, 1, 1, 1,
-1.34686, -0.4369705, -1.369621, 1, 1, 1, 1, 1,
-1.34507, -1.370576, -5.045586, 1, 1, 1, 1, 1,
-1.334053, 0.416029, -0.8064796, 1, 1, 1, 1, 1,
-1.332725, -2.318248, -4.660831, 1, 1, 1, 1, 1,
-1.325683, 0.02602764, -1.896602, 0, 0, 1, 1, 1,
-1.315204, 0.7883955, -1.967893, 1, 0, 0, 1, 1,
-1.303641, 0.7706761, -0.4635141, 1, 0, 0, 1, 1,
-1.29741, -0.3689437, -3.227646, 1, 0, 0, 1, 1,
-1.292075, -0.3479055, -1.563756, 1, 0, 0, 1, 1,
-1.289043, -0.1286756, 0.04852713, 1, 0, 0, 1, 1,
-1.284437, 0.6385764, -1.625559, 0, 0, 0, 1, 1,
-1.280241, 0.2946221, -2.863473, 0, 0, 0, 1, 1,
-1.278285, -1.330443, -2.376417, 0, 0, 0, 1, 1,
-1.272848, 1.693502, -0.2962257, 0, 0, 0, 1, 1,
-1.263793, 1.110247, 0.9545243, 0, 0, 0, 1, 1,
-1.256301, 2.044817, -1.013182, 0, 0, 0, 1, 1,
-1.25429, -1.049318, -2.28004, 0, 0, 0, 1, 1,
-1.249594, -0.4676408, -2.999645, 1, 1, 1, 1, 1,
-1.239576, 0.9623023, 0.369836, 1, 1, 1, 1, 1,
-1.238585, 1.536431, -1.641708, 1, 1, 1, 1, 1,
-1.236695, 1.137715, -1.414536, 1, 1, 1, 1, 1,
-1.232586, -0.1489279, -1.696318, 1, 1, 1, 1, 1,
-1.224996, 0.9345424, 0.9824035, 1, 1, 1, 1, 1,
-1.224723, -1.136597, -2.712, 1, 1, 1, 1, 1,
-1.224496, 0.9226429, -0.5489448, 1, 1, 1, 1, 1,
-1.213881, 0.7203557, 1.124299, 1, 1, 1, 1, 1,
-1.205348, 0.3821484, -2.103856, 1, 1, 1, 1, 1,
-1.205222, -1.37895, -1.90204, 1, 1, 1, 1, 1,
-1.192294, 1.30701, 0.4617368, 1, 1, 1, 1, 1,
-1.187645, -0.8323863, -1.760414, 1, 1, 1, 1, 1,
-1.187057, 0.3171192, -2.621598, 1, 1, 1, 1, 1,
-1.176785, -1.004695, -1.54706, 1, 1, 1, 1, 1,
-1.176758, 0.2852155, -0.670617, 0, 0, 1, 1, 1,
-1.172937, 2.502616, -0.6581444, 1, 0, 0, 1, 1,
-1.16046, 1.046642, 1.274129, 1, 0, 0, 1, 1,
-1.15633, 0.4863096, -0.7136763, 1, 0, 0, 1, 1,
-1.149648, 0.3370682, 1.073881, 1, 0, 0, 1, 1,
-1.145346, -1.61116, -1.103174, 1, 0, 0, 1, 1,
-1.143873, -1.367211, -1.263497, 0, 0, 0, 1, 1,
-1.142282, 0.5938703, -1.383904, 0, 0, 0, 1, 1,
-1.138017, 1.383027, -0.6772692, 0, 0, 0, 1, 1,
-1.134713, -0.7254391, -1.653464, 0, 0, 0, 1, 1,
-1.132646, -0.2166689, -2.236554, 0, 0, 0, 1, 1,
-1.132317, -0.8284515, -1.579654, 0, 0, 0, 1, 1,
-1.122138, -0.5849329, -2.179113, 0, 0, 0, 1, 1,
-1.116876, 0.1714737, -1.009596, 1, 1, 1, 1, 1,
-1.116842, -0.1542264, -1.671083, 1, 1, 1, 1, 1,
-1.112515, -0.7003396, -1.898364, 1, 1, 1, 1, 1,
-1.109559, 1.020187, -0.2824594, 1, 1, 1, 1, 1,
-1.109124, 1.803878, 0.4270351, 1, 1, 1, 1, 1,
-1.107908, -0.6833326, -1.34657, 1, 1, 1, 1, 1,
-1.090649, 0.3366677, 0.8918843, 1, 1, 1, 1, 1,
-1.086452, -0.6881757, -1.87401, 1, 1, 1, 1, 1,
-1.084453, 0.1147257, -0.7112012, 1, 1, 1, 1, 1,
-1.078767, -0.9156064, -2.225307, 1, 1, 1, 1, 1,
-1.076368, -0.8928562, -1.879762, 1, 1, 1, 1, 1,
-1.07408, 0.4765245, -0.7342918, 1, 1, 1, 1, 1,
-1.066611, 0.6350083, 0.1161319, 1, 1, 1, 1, 1,
-1.06244, 1.311226, -0.6995523, 1, 1, 1, 1, 1,
-1.059183, 0.3097026, 0.05242416, 1, 1, 1, 1, 1,
-1.050324, -1.382229, -3.520132, 0, 0, 1, 1, 1,
-1.034312, 0.7413974, -0.8915476, 1, 0, 0, 1, 1,
-1.024641, 0.5500715, -1.127558, 1, 0, 0, 1, 1,
-1.023199, 0.02463998, -2.629321, 1, 0, 0, 1, 1,
-1.016679, 0.3967223, -1.438635, 1, 0, 0, 1, 1,
-1.01068, -0.07797902, -3.133548, 1, 0, 0, 1, 1,
-0.990196, 0.4830872, -0.7462896, 0, 0, 0, 1, 1,
-0.9866785, -0.137631, -1.540301, 0, 0, 0, 1, 1,
-0.9850582, -1.06191, -2.044465, 0, 0, 0, 1, 1,
-0.9834672, 1.147941, -0.0920843, 0, 0, 0, 1, 1,
-0.9694509, 0.359222, -2.452644, 0, 0, 0, 1, 1,
-0.9683139, -1.081272, -2.213522, 0, 0, 0, 1, 1,
-0.961714, -0.78335, -1.267645, 0, 0, 0, 1, 1,
-0.9387988, -0.4515842, -1.605856, 1, 1, 1, 1, 1,
-0.9385155, -0.03015417, -1.414494, 1, 1, 1, 1, 1,
-0.9384117, 0.9651295, -0.4994843, 1, 1, 1, 1, 1,
-0.9376705, 0.5037501, -0.3568368, 1, 1, 1, 1, 1,
-0.9364397, 1.536321, -1.156826, 1, 1, 1, 1, 1,
-0.9353841, -0.7003821, -1.286387, 1, 1, 1, 1, 1,
-0.9337743, -1.081526, -2.165319, 1, 1, 1, 1, 1,
-0.9336645, -1.189388, -1.503396, 1, 1, 1, 1, 1,
-0.9308906, 1.124946, -0.4702106, 1, 1, 1, 1, 1,
-0.92743, 0.4407877, -0.8306798, 1, 1, 1, 1, 1,
-0.927393, -0.3001773, -0.9043264, 1, 1, 1, 1, 1,
-0.924149, -0.6338941, -1.981803, 1, 1, 1, 1, 1,
-0.9166105, -0.5281664, -2.865234, 1, 1, 1, 1, 1,
-0.9150245, 2.567194, 0.4970978, 1, 1, 1, 1, 1,
-0.9143887, 1.914926, -1.848011, 1, 1, 1, 1, 1,
-0.9053186, -0.1420797, -2.208726, 0, 0, 1, 1, 1,
-0.9017992, -0.09762719, -3.628102, 1, 0, 0, 1, 1,
-0.8987855, 1.273717, 0.4500653, 1, 0, 0, 1, 1,
-0.8967741, -0.05604879, -0.4599322, 1, 0, 0, 1, 1,
-0.8949691, 0.1912514, -0.984291, 1, 0, 0, 1, 1,
-0.8910528, -2.26859, -3.12821, 1, 0, 0, 1, 1,
-0.8892798, 1.698455, -0.2495087, 0, 0, 0, 1, 1,
-0.8889484, 0.8180426, 1.112004, 0, 0, 0, 1, 1,
-0.8874233, 0.2224783, -0.8774667, 0, 0, 0, 1, 1,
-0.8869103, -0.06053483, -3.433907, 0, 0, 0, 1, 1,
-0.8856666, -2.095233, -2.92436, 0, 0, 0, 1, 1,
-0.8811212, 0.2648164, -3.191709, 0, 0, 0, 1, 1,
-0.8775322, 0.5452938, 0.7498215, 0, 0, 0, 1, 1,
-0.8756278, 0.3241842, 0.2884262, 1, 1, 1, 1, 1,
-0.8713264, -0.6556081, -0.8244628, 1, 1, 1, 1, 1,
-0.8642914, 1.835425, 0.343858, 1, 1, 1, 1, 1,
-0.863746, -0.5999237, -4.037766, 1, 1, 1, 1, 1,
-0.8592424, -0.3145978, -1.627472, 1, 1, 1, 1, 1,
-0.8562341, -0.9028158, -2.266703, 1, 1, 1, 1, 1,
-0.8552316, 0.2414074, 0.6254601, 1, 1, 1, 1, 1,
-0.8532319, -1.903086, -3.219913, 1, 1, 1, 1, 1,
-0.8530977, -0.2516647, -1.301477, 1, 1, 1, 1, 1,
-0.8494413, 0.2483814, -1.042624, 1, 1, 1, 1, 1,
-0.8426641, 0.6125407, -0.3598855, 1, 1, 1, 1, 1,
-0.8405764, 0.444955, -1.021074, 1, 1, 1, 1, 1,
-0.8385944, 0.2767588, -0.8093676, 1, 1, 1, 1, 1,
-0.8362167, 2.158304, -0.684214, 1, 1, 1, 1, 1,
-0.8335267, -1.540222, -4.771236, 1, 1, 1, 1, 1,
-0.8296378, -1.202239, -2.933381, 0, 0, 1, 1, 1,
-0.828563, 1.198329, -1.120718, 1, 0, 0, 1, 1,
-0.8282024, 0.9694853, -1.455859, 1, 0, 0, 1, 1,
-0.8224592, -0.2339103, -1.371209, 1, 0, 0, 1, 1,
-0.8159814, -0.620053, -1.502811, 1, 0, 0, 1, 1,
-0.8087257, -3.886746, -4.209921, 1, 0, 0, 1, 1,
-0.8042952, -0.6542045, -2.155751, 0, 0, 0, 1, 1,
-0.7942123, -0.5725486, -2.396545, 0, 0, 0, 1, 1,
-0.7908247, -0.6894935, -2.668376, 0, 0, 0, 1, 1,
-0.7847711, 0.4530864, -1.747256, 0, 0, 0, 1, 1,
-0.7805969, -0.7075441, -2.015468, 0, 0, 0, 1, 1,
-0.7742872, 0.1179121, -1.662526, 0, 0, 0, 1, 1,
-0.7648583, 0.2004049, -1.595303, 0, 0, 0, 1, 1,
-0.7618046, 0.4384598, 0.8415616, 1, 1, 1, 1, 1,
-0.7606483, -0.9273407, -1.1136, 1, 1, 1, 1, 1,
-0.7578107, 2.126905, -0.4472693, 1, 1, 1, 1, 1,
-0.7540572, -0.7770685, -2.548328, 1, 1, 1, 1, 1,
-0.752617, 0.5843646, 0.6452827, 1, 1, 1, 1, 1,
-0.7494581, -0.2378578, -1.925074, 1, 1, 1, 1, 1,
-0.747381, 1.727402, -1.211796, 1, 1, 1, 1, 1,
-0.7431874, -1.040755, -1.942818, 1, 1, 1, 1, 1,
-0.7401617, 1.002108, -0.7296083, 1, 1, 1, 1, 1,
-0.7356474, 0.7293184, -0.005750532, 1, 1, 1, 1, 1,
-0.7303905, -0.2076367, -1.78538, 1, 1, 1, 1, 1,
-0.7285747, -1.625587, -3.051145, 1, 1, 1, 1, 1,
-0.7283041, 0.4393066, -0.1613206, 1, 1, 1, 1, 1,
-0.7227292, -1.194818, -4.120998, 1, 1, 1, 1, 1,
-0.7225341, 0.8475212, -1.423477, 1, 1, 1, 1, 1,
-0.7224644, 0.8901005, -2.098822, 0, 0, 1, 1, 1,
-0.7215829, 0.5463256, 0.4463342, 1, 0, 0, 1, 1,
-0.7207833, 0.9081898, -0.1115615, 1, 0, 0, 1, 1,
-0.7196331, -0.1081067, -1.445452, 1, 0, 0, 1, 1,
-0.719155, -1.274339, -3.388073, 1, 0, 0, 1, 1,
-0.7184975, 1.047508, -1.645027, 1, 0, 0, 1, 1,
-0.7136077, -0.6266317, -1.556992, 0, 0, 0, 1, 1,
-0.7131028, 1.327206, -2.664751, 0, 0, 0, 1, 1,
-0.7102658, 1.047828, -0.2015473, 0, 0, 0, 1, 1,
-0.7085886, 0.5307661, -0.8264441, 0, 0, 0, 1, 1,
-0.7041569, 0.8758813, -1.501184, 0, 0, 0, 1, 1,
-0.7027767, -2.131545, -2.906747, 0, 0, 0, 1, 1,
-0.7021829, -0.2814753, -2.222634, 0, 0, 0, 1, 1,
-0.690772, 2.23329, -1.14922, 1, 1, 1, 1, 1,
-0.6851552, -0.09698054, -0.8102991, 1, 1, 1, 1, 1,
-0.6848435, 0.619424, -0.9380395, 1, 1, 1, 1, 1,
-0.6836053, 1.576488, -0.7522435, 1, 1, 1, 1, 1,
-0.6775813, 0.2998126, 0.1049916, 1, 1, 1, 1, 1,
-0.6759577, -0.3807838, -3.739214, 1, 1, 1, 1, 1,
-0.6736864, -0.5414661, -3.43685, 1, 1, 1, 1, 1,
-0.6736487, -0.3648622, -1.446355, 1, 1, 1, 1, 1,
-0.6726611, 2.269607, 0.7622212, 1, 1, 1, 1, 1,
-0.6723711, 0.3203267, -1.471354, 1, 1, 1, 1, 1,
-0.6666219, 0.702507, -0.3356874, 1, 1, 1, 1, 1,
-0.6640606, -1.165322, -1.790903, 1, 1, 1, 1, 1,
-0.663047, -0.51483, -2.290995, 1, 1, 1, 1, 1,
-0.6617194, -0.7802068, -1.200172, 1, 1, 1, 1, 1,
-0.6598886, -0.8053403, -0.8815328, 1, 1, 1, 1, 1,
-0.6540091, -0.4755186, -4.302537, 0, 0, 1, 1, 1,
-0.6515245, 0.2201402, -1.573142, 1, 0, 0, 1, 1,
-0.6500089, -0.546837, -2.955391, 1, 0, 0, 1, 1,
-0.6472323, -0.1469684, -2.437255, 1, 0, 0, 1, 1,
-0.6443939, -1.102165, 0.1249197, 1, 0, 0, 1, 1,
-0.6436688, 0.3437612, -0.3980397, 1, 0, 0, 1, 1,
-0.6422123, 1.324467, 0.5877544, 0, 0, 0, 1, 1,
-0.6368096, -0.12505, 1.01644, 0, 0, 0, 1, 1,
-0.6364014, 0.5168186, -1.061758, 0, 0, 0, 1, 1,
-0.6334091, -0.9292743, -2.199407, 0, 0, 0, 1, 1,
-0.6294937, -0.5981548, -1.997139, 0, 0, 0, 1, 1,
-0.623301, 1.436262, -0.6466092, 0, 0, 0, 1, 1,
-0.6229147, -0.3431623, -2.279932, 0, 0, 0, 1, 1,
-0.6153207, -0.5756313, -3.148979, 1, 1, 1, 1, 1,
-0.6099155, 1.025828, -1.444676, 1, 1, 1, 1, 1,
-0.6040646, -1.235874, -2.999747, 1, 1, 1, 1, 1,
-0.5980746, 0.5709071, -0.1535592, 1, 1, 1, 1, 1,
-0.597111, -1.897074, -2.627378, 1, 1, 1, 1, 1,
-0.5939084, 0.1578628, -1.734776, 1, 1, 1, 1, 1,
-0.5915704, 0.2653208, -0.1759586, 1, 1, 1, 1, 1,
-0.5889799, 1.606372, 0.2503952, 1, 1, 1, 1, 1,
-0.5816945, 0.3188604, -1.079476, 1, 1, 1, 1, 1,
-0.5805871, 0.9224415, -0.099528, 1, 1, 1, 1, 1,
-0.578986, -0.1736966, -2.266191, 1, 1, 1, 1, 1,
-0.5772383, -0.5800481, -2.091906, 1, 1, 1, 1, 1,
-0.5753444, 0.4509648, -1.414669, 1, 1, 1, 1, 1,
-0.5692418, 0.08460266, 0.6117779, 1, 1, 1, 1, 1,
-0.5651237, 0.7357196, -0.4816274, 1, 1, 1, 1, 1,
-0.5595142, -0.6727523, -2.847076, 0, 0, 1, 1, 1,
-0.5594631, 0.2865854, -1.249679, 1, 0, 0, 1, 1,
-0.5576271, -0.4294343, -3.210346, 1, 0, 0, 1, 1,
-0.5549001, -0.4715417, -3.188211, 1, 0, 0, 1, 1,
-0.554072, 0.111714, -2.122291, 1, 0, 0, 1, 1,
-0.5538712, -0.2715609, -1.005812, 1, 0, 0, 1, 1,
-0.5426267, 0.5749112, -1.154542, 0, 0, 0, 1, 1,
-0.539334, -0.1041172, -0.3183199, 0, 0, 0, 1, 1,
-0.5358657, 0.1360147, -1.971768, 0, 0, 0, 1, 1,
-0.5349194, 0.5185257, -0.24394, 0, 0, 0, 1, 1,
-0.5280726, -1.174722, -1.847841, 0, 0, 0, 1, 1,
-0.5205036, 0.2907155, -1.53421, 0, 0, 0, 1, 1,
-0.5202237, -0.5559471, -1.378245, 0, 0, 0, 1, 1,
-0.5104381, 1.105925, -0.1042754, 1, 1, 1, 1, 1,
-0.505111, -0.9390754, -2.13748, 1, 1, 1, 1, 1,
-0.5007147, -0.1323123, -0.833899, 1, 1, 1, 1, 1,
-0.4985889, 1.663923, -0.2977046, 1, 1, 1, 1, 1,
-0.4943508, -0.1336559, -1.835711, 1, 1, 1, 1, 1,
-0.4930437, -0.8589604, -0.5316433, 1, 1, 1, 1, 1,
-0.4912465, -0.1944726, -2.188337, 1, 1, 1, 1, 1,
-0.4871464, 0.5200945, -1.282726, 1, 1, 1, 1, 1,
-0.4815922, -0.1818818, -1.571249, 1, 1, 1, 1, 1,
-0.4718981, -1.360886, -1.698765, 1, 1, 1, 1, 1,
-0.4708134, 0.8678793, 0.9182453, 1, 1, 1, 1, 1,
-0.4678516, -0.7446494, -4.043591, 1, 1, 1, 1, 1,
-0.4642219, -0.2032293, -1.855761, 1, 1, 1, 1, 1,
-0.4619016, 1.690861, -1.950744, 1, 1, 1, 1, 1,
-0.4610399, 0.04233554, -1.870039, 1, 1, 1, 1, 1,
-0.4609398, 1.395699, -0.7610984, 0, 0, 1, 1, 1,
-0.4515405, 0.6218054, -0.4103343, 1, 0, 0, 1, 1,
-0.4476361, -0.3017951, -3.111335, 1, 0, 0, 1, 1,
-0.4459517, 1.036399, -0.3228222, 1, 0, 0, 1, 1,
-0.4349876, 2.553989, -1.953748, 1, 0, 0, 1, 1,
-0.434312, 0.6293611, -0.1939551, 1, 0, 0, 1, 1,
-0.4312054, -0.8469247, -2.394418, 0, 0, 0, 1, 1,
-0.4256756, 0.3681431, -0.6609489, 0, 0, 0, 1, 1,
-0.4249333, -0.7554475, -2.336292, 0, 0, 0, 1, 1,
-0.4249273, 0.0698869, -0.8674546, 0, 0, 0, 1, 1,
-0.4247536, 0.7784667, -1.140876, 0, 0, 0, 1, 1,
-0.4242727, -0.5045125, -2.163879, 0, 0, 0, 1, 1,
-0.4228988, -1.547058, -1.185576, 0, 0, 0, 1, 1,
-0.4196951, -1.490032, -4.497149, 1, 1, 1, 1, 1,
-0.4148281, 0.1754964, -0.2001175, 1, 1, 1, 1, 1,
-0.413867, 0.125663, -1.649889, 1, 1, 1, 1, 1,
-0.4085319, 0.1989277, -0.9425805, 1, 1, 1, 1, 1,
-0.408267, -0.2392873, -0.5355872, 1, 1, 1, 1, 1,
-0.4077463, 0.9301778, -0.2020217, 1, 1, 1, 1, 1,
-0.4071764, -0.5241095, -0.9021877, 1, 1, 1, 1, 1,
-0.3955395, -0.00933897, -2.427076, 1, 1, 1, 1, 1,
-0.3913285, -0.1941605, -2.080893, 1, 1, 1, 1, 1,
-0.3892821, -0.7554925, -2.724404, 1, 1, 1, 1, 1,
-0.3854185, -0.1713702, -2.335529, 1, 1, 1, 1, 1,
-0.3814291, -0.3791251, 0.4047093, 1, 1, 1, 1, 1,
-0.3812229, 1.909433, 0.2598421, 1, 1, 1, 1, 1,
-0.378846, 0.1794512, -0.625253, 1, 1, 1, 1, 1,
-0.3782223, -0.9609737, -4.703551, 1, 1, 1, 1, 1,
-0.3748215, -0.5679495, -3.908019, 0, 0, 1, 1, 1,
-0.3696149, 0.1619368, -1.079954, 1, 0, 0, 1, 1,
-0.3646755, 0.9371385, -0.820378, 1, 0, 0, 1, 1,
-0.3611169, -0.05360647, -3.280948, 1, 0, 0, 1, 1,
-0.3599016, -1.051456, -3.007716, 1, 0, 0, 1, 1,
-0.3598684, 0.3076639, -2.272912, 1, 0, 0, 1, 1,
-0.3574629, -0.2479676, -1.66066, 0, 0, 0, 1, 1,
-0.3555215, 0.1101335, -0.3868501, 0, 0, 0, 1, 1,
-0.3534811, 0.4038715, -0.155691, 0, 0, 0, 1, 1,
-0.3493723, -0.1801832, -2.028181, 0, 0, 0, 1, 1,
-0.3292907, -0.7784663, -2.213512, 0, 0, 0, 1, 1,
-0.3188271, 0.5335466, 0.9264782, 0, 0, 0, 1, 1,
-0.3181119, 0.1938208, -1.134842, 0, 0, 0, 1, 1,
-0.3163, 0.5437716, 2.101429, 1, 1, 1, 1, 1,
-0.3154025, 1.009715, 0.2292318, 1, 1, 1, 1, 1,
-0.3150224, 0.7208218, -0.5761939, 1, 1, 1, 1, 1,
-0.3116398, 0.3344902, -0.9090389, 1, 1, 1, 1, 1,
-0.3098213, 1.203164, -0.6460973, 1, 1, 1, 1, 1,
-0.3050646, -0.2519912, -1.778892, 1, 1, 1, 1, 1,
-0.3043607, -1.035205, -4.181472, 1, 1, 1, 1, 1,
-0.3020881, 1.928128, -0.04918937, 1, 1, 1, 1, 1,
-0.3005848, 0.4265491, 1.209624, 1, 1, 1, 1, 1,
-0.2973929, 1.146584, -0.3410152, 1, 1, 1, 1, 1,
-0.296382, 0.8365327, 0.5884375, 1, 1, 1, 1, 1,
-0.2926972, -0.4267338, -2.002522, 1, 1, 1, 1, 1,
-0.2925399, -0.4706627, -2.737565, 1, 1, 1, 1, 1,
-0.2923374, 0.09298539, -1.209824, 1, 1, 1, 1, 1,
-0.2907471, 0.8832261, 1.507011, 1, 1, 1, 1, 1,
-0.2885395, -0.6473661, -1.685239, 0, 0, 1, 1, 1,
-0.2864115, 0.725452, 0.4050967, 1, 0, 0, 1, 1,
-0.2845053, 0.248704, -1.05907, 1, 0, 0, 1, 1,
-0.2817566, 0.606985, 0.5364305, 1, 0, 0, 1, 1,
-0.2788245, -1.210372, -3.684206, 1, 0, 0, 1, 1,
-0.2755615, 0.4273486, 0.5606555, 1, 0, 0, 1, 1,
-0.2703791, -0.3337744, -3.567426, 0, 0, 0, 1, 1,
-0.2684466, -0.363045, -2.589919, 0, 0, 0, 1, 1,
-0.2680157, 0.6458993, 0.08322376, 0, 0, 0, 1, 1,
-0.2670284, 0.2691578, -0.3575953, 0, 0, 0, 1, 1,
-0.266161, -0.7774761, -2.241004, 0, 0, 0, 1, 1,
-0.2648817, -0.4522131, -0.9851204, 0, 0, 0, 1, 1,
-0.2610291, -0.4436749, -2.322966, 0, 0, 0, 1, 1,
-0.2607563, 0.3548504, -0.5907675, 1, 1, 1, 1, 1,
-0.2601481, 0.7712845, 0.6792992, 1, 1, 1, 1, 1,
-0.2597235, 1.815613, 1.032384, 1, 1, 1, 1, 1,
-0.2592523, -0.4579164, -2.09091, 1, 1, 1, 1, 1,
-0.2566833, -1.545065, -3.59001, 1, 1, 1, 1, 1,
-0.254932, 0.7022949, 0.5795264, 1, 1, 1, 1, 1,
-0.2537444, 1.100045, 0.3013928, 1, 1, 1, 1, 1,
-0.2481066, 0.2912876, -0.2971944, 1, 1, 1, 1, 1,
-0.2467396, -0.2298286, -2.158765, 1, 1, 1, 1, 1,
-0.2384503, -0.2401579, -2.445708, 1, 1, 1, 1, 1,
-0.2381333, 0.8719489, 0.6132608, 1, 1, 1, 1, 1,
-0.2366214, 0.6434097, 1.217269, 1, 1, 1, 1, 1,
-0.2343927, -0.4872948, -3.635123, 1, 1, 1, 1, 1,
-0.2343223, -0.2147193, 0.341132, 1, 1, 1, 1, 1,
-0.2338025, -0.342603, -0.1793313, 1, 1, 1, 1, 1,
-0.2306918, -0.9897398, -4.475878, 0, 0, 1, 1, 1,
-0.2301185, -0.9658005, -2.426125, 1, 0, 0, 1, 1,
-0.2273748, -0.7752049, -3.112642, 1, 0, 0, 1, 1,
-0.2263374, 0.5188999, 0.1482223, 1, 0, 0, 1, 1,
-0.2235266, -0.5513899, -1.818788, 1, 0, 0, 1, 1,
-0.2192397, 1.072915, -0.171056, 1, 0, 0, 1, 1,
-0.2172525, 0.08556816, -1.61191, 0, 0, 0, 1, 1,
-0.2148385, 0.7795822, -0.5870743, 0, 0, 0, 1, 1,
-0.2101214, -0.06918631, -1.253114, 0, 0, 0, 1, 1,
-0.2016141, 0.9127662, -0.6447027, 0, 0, 0, 1, 1,
-0.1984769, -0.222495, -2.385713, 0, 0, 0, 1, 1,
-0.192663, -0.4535012, -2.352971, 0, 0, 0, 1, 1,
-0.1919378, 0.6106802, 0.1925977, 0, 0, 0, 1, 1,
-0.1825977, -1.362711, -3.06351, 1, 1, 1, 1, 1,
-0.1814068, 0.6278992, 0.02623576, 1, 1, 1, 1, 1,
-0.1804587, -0.9535112, -1.328977, 1, 1, 1, 1, 1,
-0.1793388, -0.518758, -1.59701, 1, 1, 1, 1, 1,
-0.1770101, 0.8322836, -0.7401845, 1, 1, 1, 1, 1,
-0.1750427, -1.23596, -2.023863, 1, 1, 1, 1, 1,
-0.1734339, 1.348143, -0.2156133, 1, 1, 1, 1, 1,
-0.1725924, 0.834927, -0.7843236, 1, 1, 1, 1, 1,
-0.170751, 0.7263879, -0.1394592, 1, 1, 1, 1, 1,
-0.170378, -0.8928379, -2.209605, 1, 1, 1, 1, 1,
-0.1693049, 0.9396258, -0.7105544, 1, 1, 1, 1, 1,
-0.1690139, 2.186525, 0.5619056, 1, 1, 1, 1, 1,
-0.1667543, -2.254497, -3.838119, 1, 1, 1, 1, 1,
-0.1647023, 0.4328375, -0.2347922, 1, 1, 1, 1, 1,
-0.1577388, -0.868905, -3.383483, 1, 1, 1, 1, 1,
-0.1577309, 0.4045836, -1.915169, 0, 0, 1, 1, 1,
-0.1512986, -1.47147, -3.564918, 1, 0, 0, 1, 1,
-0.150131, -2.17169, -2.832496, 1, 0, 0, 1, 1,
-0.1460584, -0.284458, -2.24845, 1, 0, 0, 1, 1,
-0.1460482, 2.141256, 0.6311103, 1, 0, 0, 1, 1,
-0.1444063, 0.7363414, 0.5068002, 1, 0, 0, 1, 1,
-0.1436733, -1.063673, -0.7521166, 0, 0, 0, 1, 1,
-0.1386308, 1.512254, 0.8126052, 0, 0, 0, 1, 1,
-0.1365304, 0.7261406, 0.5769979, 0, 0, 0, 1, 1,
-0.13426, 0.248891, -0.7514219, 0, 0, 0, 1, 1,
-0.1308996, -1.251138, -1.419173, 0, 0, 0, 1, 1,
-0.1301864, 1.522893, -1.226683, 0, 0, 0, 1, 1,
-0.1286436, 0.9917096, 0.6384544, 0, 0, 0, 1, 1,
-0.1228419, -0.4867154, -1.214026, 1, 1, 1, 1, 1,
-0.1205906, -0.2485443, -3.727644, 1, 1, 1, 1, 1,
-0.1199704, 0.4976858, -0.3990145, 1, 1, 1, 1, 1,
-0.1189083, -1.204979, -2.69714, 1, 1, 1, 1, 1,
-0.118817, 0.9648075, 0.04986752, 1, 1, 1, 1, 1,
-0.11686, 0.5447585, -0.6205463, 1, 1, 1, 1, 1,
-0.1153678, -0.6753011, -2.731097, 1, 1, 1, 1, 1,
-0.1151267, -2.140276, -3.942457, 1, 1, 1, 1, 1,
-0.1132867, -0.3461354, -3.581746, 1, 1, 1, 1, 1,
-0.1094817, -0.6813766, -2.440351, 1, 1, 1, 1, 1,
-0.1067853, -2.599376, -3.926491, 1, 1, 1, 1, 1,
-0.1063077, 0.3246043, 0.7326233, 1, 1, 1, 1, 1,
-0.1030681, -0.1321573, -0.7959462, 1, 1, 1, 1, 1,
-0.1028639, -0.04503221, -1.281698, 1, 1, 1, 1, 1,
-0.09765539, 0.08300928, -1.226338, 1, 1, 1, 1, 1,
-0.09247217, 1.207408, -2.067394, 0, 0, 1, 1, 1,
-0.09130028, 0.2198415, -1.027274, 1, 0, 0, 1, 1,
-0.08598971, 1.197681, -1.43415, 1, 0, 0, 1, 1,
-0.08578783, 0.2725199, 1.157666, 1, 0, 0, 1, 1,
-0.08517774, -0.2116263, -3.630185, 1, 0, 0, 1, 1,
-0.08242913, -0.505276, -2.45994, 1, 0, 0, 1, 1,
-0.08033589, -1.35812, -1.947001, 0, 0, 0, 1, 1,
-0.0773842, 1.839898, 1.219262, 0, 0, 0, 1, 1,
-0.06849097, -1.172776, -2.97505, 0, 0, 0, 1, 1,
-0.0682902, 1.793891, -0.03268164, 0, 0, 0, 1, 1,
-0.06691963, 0.06131643, -0.8185623, 0, 0, 0, 1, 1,
-0.06682133, -0.2546125, -3.772553, 0, 0, 0, 1, 1,
-0.06528029, 1.812909, 0.6576489, 0, 0, 0, 1, 1,
-0.06324745, 0.06439485, 0.3277686, 1, 1, 1, 1, 1,
-0.05577999, -0.6535652, -1.893757, 1, 1, 1, 1, 1,
-0.05417528, 0.2037002, -0.647316, 1, 1, 1, 1, 1,
-0.05383236, 1.203944, -0.4990267, 1, 1, 1, 1, 1,
-0.05110605, 0.9537839, 1.307647, 1, 1, 1, 1, 1,
-0.05035913, 0.3922213, 0.8519419, 1, 1, 1, 1, 1,
-0.04269461, 1.005689, -1.505999, 1, 1, 1, 1, 1,
-0.03699707, -0.04510914, -1.370327, 1, 1, 1, 1, 1,
-0.03562622, -1.695665, -3.675056, 1, 1, 1, 1, 1,
-0.03481079, -1.319028, -3.138826, 1, 1, 1, 1, 1,
-0.03160499, -1.49304, -2.63528, 1, 1, 1, 1, 1,
-0.03121915, -0.02255444, -1.364926, 1, 1, 1, 1, 1,
-0.03118235, -0.2677214, -4.406788, 1, 1, 1, 1, 1,
-0.02851059, 0.6125427, -1.694739, 1, 1, 1, 1, 1,
-0.02495535, -1.352622, -4.380287, 1, 1, 1, 1, 1,
-0.02450449, 0.8052421, -0.4488708, 0, 0, 1, 1, 1,
-0.02347025, 1.035442, 0.2315688, 1, 0, 0, 1, 1,
-0.02114495, 0.5320378, -1.233101, 1, 0, 0, 1, 1,
-0.01932276, -1.2801, -2.450256, 1, 0, 0, 1, 1,
-0.01812193, -1.99302, -2.857603, 1, 0, 0, 1, 1,
-0.01247288, 0.5360253, 0.3951042, 1, 0, 0, 1, 1,
-0.01137711, -0.3881644, -1.355718, 0, 0, 0, 1, 1,
-0.009528076, 0.3830055, -0.6090723, 0, 0, 0, 1, 1,
-0.005233413, -0.5455115, -3.100002, 0, 0, 0, 1, 1,
-0.005055827, -1.013714, -1.762373, 0, 0, 0, 1, 1,
0.0003791728, -0.7990664, 2.889539, 0, 0, 0, 1, 1,
0.000599583, -0.7338168, 4.372855, 0, 0, 0, 1, 1,
0.002101975, 2.245445, 0.8233687, 0, 0, 0, 1, 1,
0.002497729, 0.8269091, -1.281662, 1, 1, 1, 1, 1,
0.004397034, 0.4826843, -1.041472, 1, 1, 1, 1, 1,
0.009381005, 0.9209711, 0.3219242, 1, 1, 1, 1, 1,
0.01226759, 0.384764, -0.2786781, 1, 1, 1, 1, 1,
0.01434609, -0.09061633, 3.49036, 1, 1, 1, 1, 1,
0.01483786, -1.008578, 2.127118, 1, 1, 1, 1, 1,
0.02343655, 0.7082097, 0.8733361, 1, 1, 1, 1, 1,
0.02754466, -0.4707803, 1.906162, 1, 1, 1, 1, 1,
0.03635611, 1.51358, 0.1042254, 1, 1, 1, 1, 1,
0.03674624, -0.547891, 2.874279, 1, 1, 1, 1, 1,
0.0412216, 0.8014759, 0.314593, 1, 1, 1, 1, 1,
0.04340039, -0.1659207, 3.703786, 1, 1, 1, 1, 1,
0.04828893, -0.8010263, 3.189317, 1, 1, 1, 1, 1,
0.05431727, 0.8788341, 0.9646001, 1, 1, 1, 1, 1,
0.05803498, 0.3588348, -0.07151493, 1, 1, 1, 1, 1,
0.0601678, 0.3634031, 0.3108154, 0, 0, 1, 1, 1,
0.06246589, -2.644353, 3.449618, 1, 0, 0, 1, 1,
0.06854813, -0.2056873, 1.552459, 1, 0, 0, 1, 1,
0.06915437, 0.4972632, 0.2417102, 1, 0, 0, 1, 1,
0.07202978, 2.038846, -0.1825338, 1, 0, 0, 1, 1,
0.0728307, -1.383436, 2.871821, 1, 0, 0, 1, 1,
0.07722279, 1.167499, 0.01062379, 0, 0, 0, 1, 1,
0.08001656, 0.2066211, 0.436408, 0, 0, 0, 1, 1,
0.08560397, 1.737523, 1.96548, 0, 0, 0, 1, 1,
0.086257, 0.3469454, 1.337491, 0, 0, 0, 1, 1,
0.08635903, -0.4103729, 4.468097, 0, 0, 0, 1, 1,
0.09136637, 0.1076365, 1.210585, 0, 0, 0, 1, 1,
0.09683555, -1.491501, 2.056339, 0, 0, 0, 1, 1,
0.09828261, 0.7914485, -1.383953, 1, 1, 1, 1, 1,
0.09831842, 0.1962609, 0.9783374, 1, 1, 1, 1, 1,
0.09947091, -0.2171888, 3.612709, 1, 1, 1, 1, 1,
0.1029999, 0.761475, 0.1563184, 1, 1, 1, 1, 1,
0.1034768, 1.431708, 2.084226, 1, 1, 1, 1, 1,
0.1042379, 0.7315413, -0.8377416, 1, 1, 1, 1, 1,
0.1072276, -0.5409016, 1.442036, 1, 1, 1, 1, 1,
0.1099254, 0.5062808, 1.652107, 1, 1, 1, 1, 1,
0.1111379, 0.6793954, -1.197351, 1, 1, 1, 1, 1,
0.1114815, 0.2592611, -0.1278771, 1, 1, 1, 1, 1,
0.1150144, 1.282962, 0.7930535, 1, 1, 1, 1, 1,
0.1186942, -0.5171068, 3.602903, 1, 1, 1, 1, 1,
0.1194391, -0.6280186, 4.065143, 1, 1, 1, 1, 1,
0.119657, -0.8527298, 1.869217, 1, 1, 1, 1, 1,
0.1198173, 0.2475226, 0.2832449, 1, 1, 1, 1, 1,
0.1207209, 0.6586108, -0.3212233, 0, 0, 1, 1, 1,
0.1224791, 0.830068, -1.515702, 1, 0, 0, 1, 1,
0.1288739, 0.4063582, 2.944496, 1, 0, 0, 1, 1,
0.1291094, -0.05641172, 3.125056, 1, 0, 0, 1, 1,
0.1326307, 2.002421, 1.300343, 1, 0, 0, 1, 1,
0.1364085, -1.589418, 4.664708, 1, 0, 0, 1, 1,
0.1366811, -1.37541, 3.250558, 0, 0, 0, 1, 1,
0.138472, -1.150572, 1.09306, 0, 0, 0, 1, 1,
0.1388301, -0.6343023, 4.633781, 0, 0, 0, 1, 1,
0.1389884, 1.538733, 1.182871, 0, 0, 0, 1, 1,
0.1414187, 0.9607138, 0.07638887, 0, 0, 0, 1, 1,
0.1463478, 0.3578483, 1.138689, 0, 0, 0, 1, 1,
0.1478872, 0.1533318, 1.337577, 0, 0, 0, 1, 1,
0.1528242, 0.9242074, -0.4519268, 1, 1, 1, 1, 1,
0.1552434, -1.350492, 2.297253, 1, 1, 1, 1, 1,
0.1591952, 0.8600291, -0.03281627, 1, 1, 1, 1, 1,
0.160874, 1.483969, 0.7220611, 1, 1, 1, 1, 1,
0.1645907, -0.2054056, 2.099941, 1, 1, 1, 1, 1,
0.1659866, -0.9156073, 3.24212, 1, 1, 1, 1, 1,
0.1679462, 1.30652, -0.5978689, 1, 1, 1, 1, 1,
0.1693054, 0.06814213, 1.642101, 1, 1, 1, 1, 1,
0.1709597, -1.247312, 2.581601, 1, 1, 1, 1, 1,
0.1769739, 1.364727, -0.5445941, 1, 1, 1, 1, 1,
0.1800311, -0.5616563, 1.91364, 1, 1, 1, 1, 1,
0.1822429, -0.1465027, 2.842953, 1, 1, 1, 1, 1,
0.1874189, 0.5549848, -2.176934, 1, 1, 1, 1, 1,
0.1880215, -0.8476751, 3.393331, 1, 1, 1, 1, 1,
0.1912137, -1.384943, 1.997575, 1, 1, 1, 1, 1,
0.1912342, -0.7267621, 3.050306, 0, 0, 1, 1, 1,
0.1937152, -0.09125712, 3.080439, 1, 0, 0, 1, 1,
0.1939771, 0.7790253, 0.5975376, 1, 0, 0, 1, 1,
0.1940349, -0.1869465, 1.281757, 1, 0, 0, 1, 1,
0.1952471, -0.8635359, 2.701418, 1, 0, 0, 1, 1,
0.1957978, 1.126601, 2.933908, 1, 0, 0, 1, 1,
0.2005044, -0.2443625, 2.918562, 0, 0, 0, 1, 1,
0.2015582, 0.3134678, 0.7189065, 0, 0, 0, 1, 1,
0.2032102, 0.3704037, 2.442908, 0, 0, 0, 1, 1,
0.204682, 1.393415, 2.930334, 0, 0, 0, 1, 1,
0.2051539, 1.151579, 0.8223034, 0, 0, 0, 1, 1,
0.2070771, -1.620872, 2.340055, 0, 0, 0, 1, 1,
0.2083167, -1.198939, 3.646083, 0, 0, 0, 1, 1,
0.2099156, 0.2762138, 0.08478722, 1, 1, 1, 1, 1,
0.2153911, -0.6129284, 3.044761, 1, 1, 1, 1, 1,
0.2204251, 0.2699132, 1.46144, 1, 1, 1, 1, 1,
0.2230756, -0.1181311, 0.6589007, 1, 1, 1, 1, 1,
0.2237847, 0.9777716, 1.046447, 1, 1, 1, 1, 1,
0.227644, 1.168007, 1.42886, 1, 1, 1, 1, 1,
0.2324061, 0.8986263, -0.771495, 1, 1, 1, 1, 1,
0.2329379, 1.076122, -0.1039971, 1, 1, 1, 1, 1,
0.2364685, -0.04340974, 0.06176541, 1, 1, 1, 1, 1,
0.2407621, -2.314577, 4.733105, 1, 1, 1, 1, 1,
0.2414323, 0.9106541, 0.1384677, 1, 1, 1, 1, 1,
0.2475337, -1.484459, 2.292341, 1, 1, 1, 1, 1,
0.2508617, -0.7189847, 3.006564, 1, 1, 1, 1, 1,
0.2512721, -0.1505009, 2.912495, 1, 1, 1, 1, 1,
0.2519995, 2.642272, 1.105357, 1, 1, 1, 1, 1,
0.2528369, -1.12877, 3.194036, 0, 0, 1, 1, 1,
0.2543412, 1.153045, 1.268673, 1, 0, 0, 1, 1,
0.2560831, 2.283907, -0.1602024, 1, 0, 0, 1, 1,
0.262255, 0.4397058, 0.1919135, 1, 0, 0, 1, 1,
0.2653984, -1.097518, 4.172099, 1, 0, 0, 1, 1,
0.2672754, -0.1145176, 1.441575, 1, 0, 0, 1, 1,
0.2733528, -0.6024362, 1.520295, 0, 0, 0, 1, 1,
0.2746081, -0.4938542, 1.787437, 0, 0, 0, 1, 1,
0.2759743, 1.239095, -0.2648327, 0, 0, 0, 1, 1,
0.2843002, 2.618423, 0.8657457, 0, 0, 0, 1, 1,
0.2905285, -1.770694, 3.865452, 0, 0, 0, 1, 1,
0.2909114, -0.9039165, 2.606086, 0, 0, 0, 1, 1,
0.2915733, 0.2757332, 1.679242, 0, 0, 0, 1, 1,
0.2937406, 0.03950537, 3.234795, 1, 1, 1, 1, 1,
0.2945501, -0.7877215, 2.604281, 1, 1, 1, 1, 1,
0.2945759, 0.08657955, 2.473946, 1, 1, 1, 1, 1,
0.2952924, 0.5771429, 3.054598, 1, 1, 1, 1, 1,
0.2979423, 1.718484, -2.221792, 1, 1, 1, 1, 1,
0.2991585, 0.5396251, -0.4780901, 1, 1, 1, 1, 1,
0.3019319, -0.867536, 3.050566, 1, 1, 1, 1, 1,
0.3059811, 0.09365822, -0.8342227, 1, 1, 1, 1, 1,
0.3113164, -0.06108489, 2.957411, 1, 1, 1, 1, 1,
0.3122496, 0.7046073, 0.1491528, 1, 1, 1, 1, 1,
0.313703, -1.038558, 3.867655, 1, 1, 1, 1, 1,
0.316444, -0.05088231, 2.26523, 1, 1, 1, 1, 1,
0.3210076, -0.4585094, 1.382873, 1, 1, 1, 1, 1,
0.3244964, 0.4319143, 1.442276, 1, 1, 1, 1, 1,
0.3245809, 0.1427225, 0.7769841, 1, 1, 1, 1, 1,
0.3254577, 0.4208547, 0.9409476, 0, 0, 1, 1, 1,
0.3255413, -0.1297271, 1.502494, 1, 0, 0, 1, 1,
0.3261892, -2.646614, 1.473104, 1, 0, 0, 1, 1,
0.328817, 0.4652869, -0.917407, 1, 0, 0, 1, 1,
0.3315634, 1.429027, 1.47868, 1, 0, 0, 1, 1,
0.336801, 0.1076871, 1.96774, 1, 0, 0, 1, 1,
0.3454408, 1.574318, 0.5870764, 0, 0, 0, 1, 1,
0.3454833, 0.7061313, 0.4209037, 0, 0, 0, 1, 1,
0.3462807, -0.2289479, 2.744294, 0, 0, 0, 1, 1,
0.3528111, 1.070406, 1.209281, 0, 0, 0, 1, 1,
0.3557731, 0.1202099, 0.1994493, 0, 0, 0, 1, 1,
0.3595023, 0.5678995, 1.327601, 0, 0, 0, 1, 1,
0.3613398, -0.9987239, 1.300499, 0, 0, 0, 1, 1,
0.3624601, 1.196975, 1.862458, 1, 1, 1, 1, 1,
0.3689817, 0.5760853, -0.6000468, 1, 1, 1, 1, 1,
0.3716372, -0.2934071, 2.847561, 1, 1, 1, 1, 1,
0.3739149, 0.1818298, 2.004524, 1, 1, 1, 1, 1,
0.3740602, -0.1916533, 2.285306, 1, 1, 1, 1, 1,
0.3747008, 1.28603, -0.04788705, 1, 1, 1, 1, 1,
0.3765566, -0.2058451, 3.058962, 1, 1, 1, 1, 1,
0.3855811, -0.8350553, 1.702166, 1, 1, 1, 1, 1,
0.385974, 0.7842683, 0.7434359, 1, 1, 1, 1, 1,
0.3868482, -1.07276, 3.5192, 1, 1, 1, 1, 1,
0.3880693, 0.8236765, -1.617343, 1, 1, 1, 1, 1,
0.3916661, -1.447165, 3.186207, 1, 1, 1, 1, 1,
0.3917011, 1.568459, 0.4833121, 1, 1, 1, 1, 1,
0.3931067, 1.008306, -0.09356809, 1, 1, 1, 1, 1,
0.4012475, -1.15739, 3.813737, 1, 1, 1, 1, 1,
0.4016108, 0.5587196, -0.2328579, 0, 0, 1, 1, 1,
0.4033187, -1.024546, 3.325975, 1, 0, 0, 1, 1,
0.4067876, -0.003629805, 1.940055, 1, 0, 0, 1, 1,
0.4068922, -1.235921, 2.781948, 1, 0, 0, 1, 1,
0.4175469, -0.01042565, 1.190925, 1, 0, 0, 1, 1,
0.4187676, 1.476427, 1.350969, 1, 0, 0, 1, 1,
0.4187908, -0.3193475, 2.442868, 0, 0, 0, 1, 1,
0.4203357, 0.3999023, 1.327311, 0, 0, 0, 1, 1,
0.4244463, 0.3499762, 0.3403821, 0, 0, 0, 1, 1,
0.4258315, 0.913892, 1.121696, 0, 0, 0, 1, 1,
0.4290561, 0.2904601, 1.351862, 0, 0, 0, 1, 1,
0.4290876, 1.267587, 1.452653, 0, 0, 0, 1, 1,
0.4320673, -1.617001, 1.691749, 0, 0, 0, 1, 1,
0.4324405, 1.363888, -1.139948, 1, 1, 1, 1, 1,
0.4432805, 0.3206385, 0.4909242, 1, 1, 1, 1, 1,
0.44508, -1.799585, 3.586659, 1, 1, 1, 1, 1,
0.4465814, 1.196101, 0.633765, 1, 1, 1, 1, 1,
0.4518108, 0.3668897, 0.5648616, 1, 1, 1, 1, 1,
0.45613, 1.480726, -1.232628, 1, 1, 1, 1, 1,
0.459493, -0.6070001, 2.452386, 1, 1, 1, 1, 1,
0.4609866, 0.08176664, 1.658033, 1, 1, 1, 1, 1,
0.4611906, -0.2953049, 0.9115232, 1, 1, 1, 1, 1,
0.4652578, -3.112242, 2.85346, 1, 1, 1, 1, 1,
0.4671752, -0.1228332, 1.495063, 1, 1, 1, 1, 1,
0.4694127, -0.3909871, 2.185486, 1, 1, 1, 1, 1,
0.4697609, 0.03835034, 1.692751, 1, 1, 1, 1, 1,
0.4731727, 1.015548, 0.8133085, 1, 1, 1, 1, 1,
0.473727, -0.5981814, 3.356122, 1, 1, 1, 1, 1,
0.4745185, 0.5429837, 0.2652392, 0, 0, 1, 1, 1,
0.4762815, 1.349006, 0.207042, 1, 0, 0, 1, 1,
0.4820846, -0.207474, 2.707323, 1, 0, 0, 1, 1,
0.4895583, -0.0195524, 3.220931, 1, 0, 0, 1, 1,
0.4916774, 0.1347482, 0.8856463, 1, 0, 0, 1, 1,
0.4923735, 1.120752, -1.328843, 1, 0, 0, 1, 1,
0.4930111, 0.4468197, 1.348624, 0, 0, 0, 1, 1,
0.4939732, 2.223624, 0.3853844, 0, 0, 0, 1, 1,
0.496249, -0.3499284, 3.240952, 0, 0, 0, 1, 1,
0.4971372, -3.422262, 2.992339, 0, 0, 0, 1, 1,
0.5085968, 0.1896321, 2.029293, 0, 0, 0, 1, 1,
0.5113817, 0.3211591, 2.662219, 0, 0, 0, 1, 1,
0.5115355, 1.190387, 0.237221, 0, 0, 0, 1, 1,
0.516206, -0.3002652, 1.573666, 1, 1, 1, 1, 1,
0.5185397, 0.7172002, -0.2915887, 1, 1, 1, 1, 1,
0.5212312, 0.7799842, 1.825463, 1, 1, 1, 1, 1,
0.5230433, 0.9691328, 1.422567, 1, 1, 1, 1, 1,
0.525203, 0.0908737, 1.40215, 1, 1, 1, 1, 1,
0.5262343, -1.526712, 4.006185, 1, 1, 1, 1, 1,
0.5315481, 1.347356, 2.591926, 1, 1, 1, 1, 1,
0.5333729, -0.8696677, 3.511538, 1, 1, 1, 1, 1,
0.5391586, 0.09304862, 0.6001346, 1, 1, 1, 1, 1,
0.5431355, -2.259859, 1.949198, 1, 1, 1, 1, 1,
0.5482862, 0.6869851, -1.432763, 1, 1, 1, 1, 1,
0.5519693, -1.922915, 3.591945, 1, 1, 1, 1, 1,
0.5579029, -0.4596971, 4.322384, 1, 1, 1, 1, 1,
0.5614443, -0.6003838, 2.542456, 1, 1, 1, 1, 1,
0.5626491, -1.378535, 1.502992, 1, 1, 1, 1, 1,
0.5628804, 0.6158388, 1.219657, 0, 0, 1, 1, 1,
0.5633591, 0.6891941, 1.795788, 1, 0, 0, 1, 1,
0.5642008, 0.08692692, 1.538665, 1, 0, 0, 1, 1,
0.5716218, 0.6146589, 0.8490732, 1, 0, 0, 1, 1,
0.5723213, 0.5614071, 0.305042, 1, 0, 0, 1, 1,
0.575595, -0.6847998, 2.689627, 1, 0, 0, 1, 1,
0.5769978, -0.2366645, 0.6004118, 0, 0, 0, 1, 1,
0.5781751, 1.681284, -0.5604308, 0, 0, 0, 1, 1,
0.5808259, -1.499463, 4.796027, 0, 0, 0, 1, 1,
0.5850304, -1.728721, 3.323137, 0, 0, 0, 1, 1,
0.5874323, -0.6392462, 1.562063, 0, 0, 0, 1, 1,
0.5916508, 0.7759596, 0.9122542, 0, 0, 0, 1, 1,
0.5929127, 1.279916, 0.4604853, 0, 0, 0, 1, 1,
0.6023781, -1.699138, 1.839413, 1, 1, 1, 1, 1,
0.6053349, 0.6754801, 1.188049, 1, 1, 1, 1, 1,
0.6055544, -0.5947146, 3.966424, 1, 1, 1, 1, 1,
0.6073921, 1.591387, 0.9373613, 1, 1, 1, 1, 1,
0.6090692, 0.6922277, 0.262343, 1, 1, 1, 1, 1,
0.6114383, 0.06068201, 2.84363, 1, 1, 1, 1, 1,
0.6144791, 0.336983, 1.72152, 1, 1, 1, 1, 1,
0.6151502, 0.6859285, -0.5638173, 1, 1, 1, 1, 1,
0.6188484, -0.313302, 1.391277, 1, 1, 1, 1, 1,
0.6205572, 0.3380863, 0.6818703, 1, 1, 1, 1, 1,
0.6278342, -1.518359, 2.260834, 1, 1, 1, 1, 1,
0.634501, -0.5758854, 2.372871, 1, 1, 1, 1, 1,
0.6352593, 1.589323, 1.132871, 1, 1, 1, 1, 1,
0.6387894, 0.1303784, 0.5291041, 1, 1, 1, 1, 1,
0.6424362, 0.6291236, 2.241237, 1, 1, 1, 1, 1,
0.6528917, -1.858423, 4.67285, 0, 0, 1, 1, 1,
0.6702302, 1.098745, -0.6395358, 1, 0, 0, 1, 1,
0.6710387, -0.9080935, 2.40594, 1, 0, 0, 1, 1,
0.6771619, -0.4368125, 3.634082, 1, 0, 0, 1, 1,
0.6777499, 0.7447168, 0.9540822, 1, 0, 0, 1, 1,
0.6841879, 0.1072816, 3.151126, 1, 0, 0, 1, 1,
0.6896272, -0.751633, 2.079619, 0, 0, 0, 1, 1,
0.6930298, 0.6065299, -0.7460858, 0, 0, 0, 1, 1,
0.6934794, 0.2910867, 1.898955, 0, 0, 0, 1, 1,
0.7010457, -2.646453, 2.108467, 0, 0, 0, 1, 1,
0.7022808, 0.1337825, 0.3626155, 0, 0, 0, 1, 1,
0.7051706, 0.6066471, 0.4356975, 0, 0, 0, 1, 1,
0.7060434, 0.7336997, 0.338793, 0, 0, 0, 1, 1,
0.7075432, 0.5469478, 1.345834, 1, 1, 1, 1, 1,
0.708816, -0.6658313, 2.467169, 1, 1, 1, 1, 1,
0.7115155, -1.666028, 2.190507, 1, 1, 1, 1, 1,
0.7232875, -0.7557067, 2.255677, 1, 1, 1, 1, 1,
0.7255294, 0.2859618, 1.431398, 1, 1, 1, 1, 1,
0.7256767, 1.050242, 0.0191922, 1, 1, 1, 1, 1,
0.7296647, -1.595558, 2.515285, 1, 1, 1, 1, 1,
0.7318922, -2.677701, 2.958453, 1, 1, 1, 1, 1,
0.7330105, 0.01066499, 1.071478, 1, 1, 1, 1, 1,
0.7375194, -0.9735115, 3.684656, 1, 1, 1, 1, 1,
0.7375372, -1.395206, 5.620006, 1, 1, 1, 1, 1,
0.7390234, -1.240141, 3.126883, 1, 1, 1, 1, 1,
0.7440416, -2.929857, 2.799012, 1, 1, 1, 1, 1,
0.747919, 1.64804, 1.321331, 1, 1, 1, 1, 1,
0.7491413, 0.6297179, 1.998379, 1, 1, 1, 1, 1,
0.7491677, 0.1171155, 1.260779, 0, 0, 1, 1, 1,
0.7506996, -0.2067474, 0.4766815, 1, 0, 0, 1, 1,
0.751179, 1.430793, 0.6212021, 1, 0, 0, 1, 1,
0.7529853, 0.1957732, 1.137691, 1, 0, 0, 1, 1,
0.7541825, -0.7999017, 2.475919, 1, 0, 0, 1, 1,
0.7593836, -1.69148, 1.644492, 1, 0, 0, 1, 1,
0.7615265, 0.231128, 0.4046587, 0, 0, 0, 1, 1,
0.7639692, 0.7121753, 3.129357, 0, 0, 0, 1, 1,
0.7645755, 0.8636827, 1.050503, 0, 0, 0, 1, 1,
0.766099, 1.380079, 0.9230043, 0, 0, 0, 1, 1,
0.7734188, -2.333179, 3.120972, 0, 0, 0, 1, 1,
0.7750041, -1.013947, 2.054342, 0, 0, 0, 1, 1,
0.7769884, -0.942158, 2.450273, 0, 0, 0, 1, 1,
0.7800819, -0.3350115, 0.203023, 1, 1, 1, 1, 1,
0.7806967, -0.9749486, 3.611336, 1, 1, 1, 1, 1,
0.7885287, -1.537036, 3.339887, 1, 1, 1, 1, 1,
0.7890012, 0.6127077, 1.37163, 1, 1, 1, 1, 1,
0.7895618, -2.323326, 2.889984, 1, 1, 1, 1, 1,
0.7897821, -1.319123, 2.453277, 1, 1, 1, 1, 1,
0.7919249, -0.8150997, 3.333262, 1, 1, 1, 1, 1,
0.7932375, -0.6145183, 1.759612, 1, 1, 1, 1, 1,
0.7956722, -1.635223, 2.962449, 1, 1, 1, 1, 1,
0.7961146, -0.3013798, 2.756855, 1, 1, 1, 1, 1,
0.7995266, -0.2237363, 2.517459, 1, 1, 1, 1, 1,
0.8039435, -0.378569, 3.248096, 1, 1, 1, 1, 1,
0.8077281, -0.1919786, 0.5382228, 1, 1, 1, 1, 1,
0.8079747, -0.5800542, 1.190552, 1, 1, 1, 1, 1,
0.8103881, 2.037312, 0.828958, 1, 1, 1, 1, 1,
0.8125612, 0.400196, 1.667364, 0, 0, 1, 1, 1,
0.8150249, 1.020491, -0.3277376, 1, 0, 0, 1, 1,
0.8157951, -1.486208, 2.27379, 1, 0, 0, 1, 1,
0.8167791, 1.344029, -0.6715041, 1, 0, 0, 1, 1,
0.8177367, 0.4399645, 1.628121, 1, 0, 0, 1, 1,
0.8192344, 0.6057221, 0.2117406, 1, 0, 0, 1, 1,
0.8206686, -0.502795, 1.105059, 0, 0, 0, 1, 1,
0.8250523, -0.1907381, 0.7461911, 0, 0, 0, 1, 1,
0.8263835, -0.1841528, 2.825254, 0, 0, 0, 1, 1,
0.8265225, 0.02053013, 0.4997962, 0, 0, 0, 1, 1,
0.8316306, 0.5826361, 0.6530011, 0, 0, 0, 1, 1,
0.8322973, 0.449649, 2.770862, 0, 0, 0, 1, 1,
0.8345695, 0.6345201, 1.455886, 0, 0, 0, 1, 1,
0.8375772, 2.796834, 1.411264, 1, 1, 1, 1, 1,
0.8444197, -0.09517568, 1.256296, 1, 1, 1, 1, 1,
0.8473355, -1.131618, 2.760621, 1, 1, 1, 1, 1,
0.8476118, -0.807237, 3.502108, 1, 1, 1, 1, 1,
0.8572494, 1.388446, 0.752077, 1, 1, 1, 1, 1,
0.858236, -0.02245396, 2.218725, 1, 1, 1, 1, 1,
0.861526, 0.7330124, 1.737867, 1, 1, 1, 1, 1,
0.8711821, -0.2734538, 3.837877, 1, 1, 1, 1, 1,
0.8794371, -0.9394997, 1.980187, 1, 1, 1, 1, 1,
0.8798916, -0.9952281, 2.100129, 1, 1, 1, 1, 1,
0.881333, -0.9771779, 2.893433, 1, 1, 1, 1, 1,
0.8875672, 0.3148241, 1.86962, 1, 1, 1, 1, 1,
0.8934322, -1.093611, 2.944178, 1, 1, 1, 1, 1,
0.8960817, -0.9719422, 2.205568, 1, 1, 1, 1, 1,
0.9092181, -1.213659, 3.255614, 1, 1, 1, 1, 1,
0.9160898, 0.4207373, 1.042207, 0, 0, 1, 1, 1,
0.923258, 0.8145471, 0.1565846, 1, 0, 0, 1, 1,
0.9267947, -1.49635, 2.80586, 1, 0, 0, 1, 1,
0.9446693, 0.4332255, 1.687993, 1, 0, 0, 1, 1,
0.9500076, 0.3077722, 0.0256159, 1, 0, 0, 1, 1,
0.9597945, 1.057905, 0.08120291, 1, 0, 0, 1, 1,
0.9653962, 1.405723, -0.7670331, 0, 0, 0, 1, 1,
0.9661158, -0.1178523, 0.6129957, 0, 0, 0, 1, 1,
0.9682024, 1.040059, 2.659812, 0, 0, 0, 1, 1,
0.9693663, 1.517219, -2.3294, 0, 0, 0, 1, 1,
0.9728864, 0.1249177, 1.656571, 0, 0, 0, 1, 1,
0.9736899, 1.078417, -0.7532854, 0, 0, 0, 1, 1,
0.9757908, 0.04069165, 1.127221, 0, 0, 0, 1, 1,
0.9844116, -0.2650919, 1.054884, 1, 1, 1, 1, 1,
0.9890786, -0.5577954, 0.793761, 1, 1, 1, 1, 1,
0.9894451, 1.177361, -0.5876134, 1, 1, 1, 1, 1,
0.9931079, 0.05733641, 2.342315, 1, 1, 1, 1, 1,
0.9963223, -0.07985387, 1.233801, 1, 1, 1, 1, 1,
1.001689, -0.6052909, 1.622225, 1, 1, 1, 1, 1,
1.002255, 0.5220378, 1.299654, 1, 1, 1, 1, 1,
1.004649, 0.5614344, 1.72683, 1, 1, 1, 1, 1,
1.019991, 0.713128, 0.9712248, 1, 1, 1, 1, 1,
1.02528, -2.455215, 3.721951, 1, 1, 1, 1, 1,
1.026203, 0.1546293, 1.962382, 1, 1, 1, 1, 1,
1.031463, 1.913334, 0.6356934, 1, 1, 1, 1, 1,
1.039499, 0.1492532, 1.517283, 1, 1, 1, 1, 1,
1.050431, -1.300578, 2.428351, 1, 1, 1, 1, 1,
1.052425, 1.216954, 0.9386916, 1, 1, 1, 1, 1,
1.052669, -1.546338, 3.293448, 0, 0, 1, 1, 1,
1.054502, -2.154343, 3.712198, 1, 0, 0, 1, 1,
1.055253, -0.6050777, 1.444069, 1, 0, 0, 1, 1,
1.057374, 0.5948063, 3.025275, 1, 0, 0, 1, 1,
1.059657, -2.273573, 3.38161, 1, 0, 0, 1, 1,
1.059939, -0.05552934, 0.6712471, 1, 0, 0, 1, 1,
1.090795, 0.7714868, 1.897216, 0, 0, 0, 1, 1,
1.110498, -0.2675621, 0.2335373, 0, 0, 0, 1, 1,
1.110807, 0.7740309, 0.2280862, 0, 0, 0, 1, 1,
1.112876, 1.425191, -1.337247, 0, 0, 0, 1, 1,
1.112895, -0.7849836, 2.2858, 0, 0, 0, 1, 1,
1.117887, 0.7750561, 1.017285, 0, 0, 0, 1, 1,
1.126237, -0.2302209, 2.517251, 0, 0, 0, 1, 1,
1.126248, 0.883054, 0.7427619, 1, 1, 1, 1, 1,
1.127625, 0.3901618, 2.254003, 1, 1, 1, 1, 1,
1.128159, -0.5817006, 2.104066, 1, 1, 1, 1, 1,
1.13844, -0.5967796, 2.161088, 1, 1, 1, 1, 1,
1.139629, -1.347931, 2.265257, 1, 1, 1, 1, 1,
1.140881, -0.640063, 2.757008, 1, 1, 1, 1, 1,
1.158996, -0.8879325, 4.309258, 1, 1, 1, 1, 1,
1.16127, 1.550275, 0.1539953, 1, 1, 1, 1, 1,
1.168411, 0.7217585, 1.092894, 1, 1, 1, 1, 1,
1.17762, 1.690782, 0.9460527, 1, 1, 1, 1, 1,
1.205137, -0.4714628, 1.291121, 1, 1, 1, 1, 1,
1.207443, -1.217522, 1.847109, 1, 1, 1, 1, 1,
1.210669, 0.9117274, 0.7503551, 1, 1, 1, 1, 1,
1.217047, 0.3889495, 0.6363406, 1, 1, 1, 1, 1,
1.219304, 1.986371, 1.891034, 1, 1, 1, 1, 1,
1.223561, -0.037434, -0.3697556, 0, 0, 1, 1, 1,
1.234778, 0.4519357, -0.7328804, 1, 0, 0, 1, 1,
1.243806, -0.03625644, 0.1308341, 1, 0, 0, 1, 1,
1.251186, 1.051764, -0.970794, 1, 0, 0, 1, 1,
1.254118, -0.8204716, 1.505899, 1, 0, 0, 1, 1,
1.259577, 0.556365, 1.198549, 1, 0, 0, 1, 1,
1.26023, 0.7898937, 1.204718, 0, 0, 0, 1, 1,
1.262087, 0.1157094, 0.8267654, 0, 0, 0, 1, 1,
1.264639, -0.367999, 1.741494, 0, 0, 0, 1, 1,
1.266342, 0.0448129, 2.769121, 0, 0, 0, 1, 1,
1.266411, -0.1717534, 2.24752, 0, 0, 0, 1, 1,
1.275169, -1.158986, 1.132231, 0, 0, 0, 1, 1,
1.284289, -0.4229329, 0.6038292, 0, 0, 0, 1, 1,
1.291212, 0.4222113, 2.632799, 1, 1, 1, 1, 1,
1.297212, 1.77631, 2.75124, 1, 1, 1, 1, 1,
1.301615, 1.300913, 0.9678758, 1, 1, 1, 1, 1,
1.302322, 1.046482, 0.2747004, 1, 1, 1, 1, 1,
1.305585, -0.06089075, -0.06460926, 1, 1, 1, 1, 1,
1.307256, 1.503671, -0.7929183, 1, 1, 1, 1, 1,
1.315861, 0.9088903, 1.09734, 1, 1, 1, 1, 1,
1.316449, 0.654502, -0.3649736, 1, 1, 1, 1, 1,
1.317085, 0.1447183, 0.1966528, 1, 1, 1, 1, 1,
1.323923, 0.1228571, 2.631244, 1, 1, 1, 1, 1,
1.324096, -0.9486274, 2.286444, 1, 1, 1, 1, 1,
1.330212, 0.6272804, 0.3503706, 1, 1, 1, 1, 1,
1.330565, -1.302417, 2.483653, 1, 1, 1, 1, 1,
1.355733, -0.4511733, 1.78585, 1, 1, 1, 1, 1,
1.356175, -0.7706667, 2.062722, 1, 1, 1, 1, 1,
1.356997, -1.519784, 2.3592, 0, 0, 1, 1, 1,
1.357665, -0.8200797, 1.995821, 1, 0, 0, 1, 1,
1.36031, -0.7793638, 1.86563, 1, 0, 0, 1, 1,
1.36154, -2.554671, 3.490307, 1, 0, 0, 1, 1,
1.362273, 1.16343, 1.140108, 1, 0, 0, 1, 1,
1.364494, 0.1126312, 2.253667, 1, 0, 0, 1, 1,
1.370966, -0.170535, 2.058786, 0, 0, 0, 1, 1,
1.371369, 1.015538, 1.034794, 0, 0, 0, 1, 1,
1.377905, -0.4983203, 3.415981, 0, 0, 0, 1, 1,
1.387861, -1.355232, 1.653538, 0, 0, 0, 1, 1,
1.39308, -0.526222, 3.288417, 0, 0, 0, 1, 1,
1.419456, -0.7424682, 0.1575722, 0, 0, 0, 1, 1,
1.421582, -0.0274847, 3.24369, 0, 0, 0, 1, 1,
1.426933, -0.4573923, 1.34487, 1, 1, 1, 1, 1,
1.430297, -0.2039177, 0.6260413, 1, 1, 1, 1, 1,
1.431984, 0.4717326, -0.08492088, 1, 1, 1, 1, 1,
1.438853, -0.6476532, 3.419115, 1, 1, 1, 1, 1,
1.444224, -0.5804064, 3.527019, 1, 1, 1, 1, 1,
1.472144, -0.03052703, 0.7751227, 1, 1, 1, 1, 1,
1.477727, -0.3587691, 2.934241, 1, 1, 1, 1, 1,
1.478392, -1.10901, 0.342628, 1, 1, 1, 1, 1,
1.483068, -1.174755, 2.430773, 1, 1, 1, 1, 1,
1.484068, 1.089317, 2.083175, 1, 1, 1, 1, 1,
1.495078, -0.5059654, 2.730798, 1, 1, 1, 1, 1,
1.500183, 0.2279349, 1.808533, 1, 1, 1, 1, 1,
1.505531, 1.028794, 1.28261, 1, 1, 1, 1, 1,
1.509911, 0.2193536, -0.8740861, 1, 1, 1, 1, 1,
1.510503, -0.3697075, 1.187957, 1, 1, 1, 1, 1,
1.514226, 0.296083, 0.9980199, 0, 0, 1, 1, 1,
1.523985, 0.1987403, 0.5942191, 1, 0, 0, 1, 1,
1.524958, 1.638091, 1.401993, 1, 0, 0, 1, 1,
1.526062, -1.081221, 2.222439, 1, 0, 0, 1, 1,
1.530763, 2.030892, -0.1941765, 1, 0, 0, 1, 1,
1.554968, 0.4104528, 2.85773, 1, 0, 0, 1, 1,
1.557122, -0.01582233, 3.049575, 0, 0, 0, 1, 1,
1.56398, -0.6092151, -0.05720527, 0, 0, 0, 1, 1,
1.571081, 0.005451644, 1.965615, 0, 0, 0, 1, 1,
1.5719, -0.4138435, 2.147655, 0, 0, 0, 1, 1,
1.581975, -0.5858016, 1.380659, 0, 0, 0, 1, 1,
1.590909, -0.7123089, 2.027745, 0, 0, 0, 1, 1,
1.595448, -1.001318, 1.973943, 0, 0, 0, 1, 1,
1.602237, 0.8628151, 1.628284, 1, 1, 1, 1, 1,
1.605317, 1.633732, 0.01648791, 1, 1, 1, 1, 1,
1.60834, 0.486844, 0.02929004, 1, 1, 1, 1, 1,
1.617639, 0.7238745, 1.26627, 1, 1, 1, 1, 1,
1.638005, 0.1890619, 1.626562, 1, 1, 1, 1, 1,
1.644904, 0.08447134, 0.7398305, 1, 1, 1, 1, 1,
1.656079, 1.600808, 1.176978, 1, 1, 1, 1, 1,
1.667245, 1.1583, 0.554644, 1, 1, 1, 1, 1,
1.670453, -0.08389726, 0.8689035, 1, 1, 1, 1, 1,
1.679413, 0.7173054, 0.7707787, 1, 1, 1, 1, 1,
1.682594, 0.8108234, 2.081751, 1, 1, 1, 1, 1,
1.68369, 0.3757566, -1.959867, 1, 1, 1, 1, 1,
1.685433, 0.007678211, 1.941527, 1, 1, 1, 1, 1,
1.688641, -2.575398, 2.64, 1, 1, 1, 1, 1,
1.699326, 1.27303, -0.4981517, 1, 1, 1, 1, 1,
1.701359, 0.4443775, 1.233924, 0, 0, 1, 1, 1,
1.702359, -1.806709, 2.210244, 1, 0, 0, 1, 1,
1.706597, 0.6033064, 1.010676, 1, 0, 0, 1, 1,
1.711709, -1.055401, 1.717979, 1, 0, 0, 1, 1,
1.720918, -0.7401198, 3.170529, 1, 0, 0, 1, 1,
1.729966, 0.3947811, 2.79185, 1, 0, 0, 1, 1,
1.730788, 0.1131148, 1.235541, 0, 0, 0, 1, 1,
1.73824, 1.906441, 2.202799, 0, 0, 0, 1, 1,
1.743126, 0.4345872, 0.3771819, 0, 0, 0, 1, 1,
1.749074, -0.5987136, 2.02751, 0, 0, 0, 1, 1,
1.763153, 1.082006, 0.5116171, 0, 0, 0, 1, 1,
1.763311, 0.2304071, 0.8032622, 0, 0, 0, 1, 1,
1.794735, -0.7282169, 2.101303, 0, 0, 0, 1, 1,
1.796679, 0.5191301, 0.9256856, 1, 1, 1, 1, 1,
1.808006, -2.603167, 1.130736, 1, 1, 1, 1, 1,
1.810299, -0.9438089, 0.7547261, 1, 1, 1, 1, 1,
1.814579, -0.04194755, 4.489836, 1, 1, 1, 1, 1,
1.815592, 0.7706177, 0.514644, 1, 1, 1, 1, 1,
1.817619, 0.4762114, 0.0381509, 1, 1, 1, 1, 1,
1.818317, -0.6829467, 0.80477, 1, 1, 1, 1, 1,
1.831687, -1.238962, 3.198281, 1, 1, 1, 1, 1,
1.884818, -1.569564, 2.923881, 1, 1, 1, 1, 1,
1.894721, 0.03668504, 4.147076, 1, 1, 1, 1, 1,
1.89978, -0.8705545, 1.192527, 1, 1, 1, 1, 1,
1.902866, -1.443814, 1.991626, 1, 1, 1, 1, 1,
1.932445, -2.389706, 3.057855, 1, 1, 1, 1, 1,
1.950262, -1.975579, 0.6169715, 1, 1, 1, 1, 1,
2.023118, -1.508994, 2.147651, 1, 1, 1, 1, 1,
2.052969, -1.826062, 3.362324, 0, 0, 1, 1, 1,
2.055012, 0.8040305, 2.354515, 1, 0, 0, 1, 1,
2.069944, 0.6861746, -0.3421337, 1, 0, 0, 1, 1,
2.07035, 0.1379658, 1.522651, 1, 0, 0, 1, 1,
2.092832, 2.037673, -0.3703228, 1, 0, 0, 1, 1,
2.103558, 0.7750304, 2.197391, 1, 0, 0, 1, 1,
2.135567, 1.683475, -0.376667, 0, 0, 0, 1, 1,
2.159015, -0.7287018, 3.293766, 0, 0, 0, 1, 1,
2.19075, -1.647544, 2.094172, 0, 0, 0, 1, 1,
2.19427, -1.045154, 2.16004, 0, 0, 0, 1, 1,
2.228802, 1.292188, 3.533434, 0, 0, 0, 1, 1,
2.264451, 0.09555686, 0.3468569, 0, 0, 0, 1, 1,
2.264924, -1.607634, 2.838053, 0, 0, 0, 1, 1,
2.296177, 0.7185258, -1.222006, 1, 1, 1, 1, 1,
2.383438, 1.105888, -0.7463671, 1, 1, 1, 1, 1,
2.472466, -0.4624118, 1.864915, 1, 1, 1, 1, 1,
2.501529, 0.005864954, -0.7749972, 1, 1, 1, 1, 1,
2.670081, 0.5070385, 0.3336246, 1, 1, 1, 1, 1,
3.102628, -0.3664264, 1.297306, 1, 1, 1, 1, 1,
3.275581, -0.3449022, -0.513003, 1, 1, 1, 1, 1
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
var radius = 9.525254;
var distance = 33.45705;
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
mvMatrix.translate( -0.2720319, 0.5449562, -0.2872097 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45705);
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
