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
-2.605008, -0.2218193, -1.478656, 1, 0, 0, 1,
-2.547051, -0.2875834, -3.26687, 1, 0.007843138, 0, 1,
-2.472299, 0.5521903, -0.539418, 1, 0.01176471, 0, 1,
-2.41063, 0.3668291, -0.7441715, 1, 0.01960784, 0, 1,
-2.351815, -1.928212, -0.947249, 1, 0.02352941, 0, 1,
-2.285857, -0.3500937, -1.902301, 1, 0.03137255, 0, 1,
-2.11615, 2.508914, 0.9829713, 1, 0.03529412, 0, 1,
-2.101906, 1.895063, -1.74674, 1, 0.04313726, 0, 1,
-2.100576, 0.8275954, -2.093346, 1, 0.04705882, 0, 1,
-2.080224, 0.54552, -0.8464966, 1, 0.05490196, 0, 1,
-1.976718, -0.6624914, -1.033904, 1, 0.05882353, 0, 1,
-1.973578, -0.541549, -3.269354, 1, 0.06666667, 0, 1,
-1.933377, -0.8583336, -1.474422, 1, 0.07058824, 0, 1,
-1.928201, -1.657727, -2.831898, 1, 0.07843138, 0, 1,
-1.912143, 0.3437165, -2.362119, 1, 0.08235294, 0, 1,
-1.895636, -0.131862, -2.20493, 1, 0.09019608, 0, 1,
-1.886972, -0.6248212, -2.788258, 1, 0.09411765, 0, 1,
-1.87338, 1.063106, -2.834805, 1, 0.1019608, 0, 1,
-1.864759, 0.500697, -1.07384, 1, 0.1098039, 0, 1,
-1.855508, 0.2027646, -3.19561, 1, 0.1137255, 0, 1,
-1.848521, -0.2218217, -0.2358493, 1, 0.1215686, 0, 1,
-1.832183, 1.153519, -1.086922, 1, 0.1254902, 0, 1,
-1.828378, -0.1927965, -2.045594, 1, 0.1333333, 0, 1,
-1.815747, 1.426178, -0.8873348, 1, 0.1372549, 0, 1,
-1.8142, -0.3609332, -1.533899, 1, 0.145098, 0, 1,
-1.812325, 0.6260166, -1.943302, 1, 0.1490196, 0, 1,
-1.805813, -0.08998742, -3.05145, 1, 0.1568628, 0, 1,
-1.794582, 1.728478, -1.84276, 1, 0.1607843, 0, 1,
-1.792574, 1.270236, -1.825669, 1, 0.1686275, 0, 1,
-1.780505, 1.362555, 0.7605537, 1, 0.172549, 0, 1,
-1.774293, 0.4571166, -0.441714, 1, 0.1803922, 0, 1,
-1.770965, -0.4943553, -3.227059, 1, 0.1843137, 0, 1,
-1.75165, 0.8468574, -2.307531, 1, 0.1921569, 0, 1,
-1.744911, 0.5609483, -1.291044, 1, 0.1960784, 0, 1,
-1.734998, -0.9291322, -1.501548, 1, 0.2039216, 0, 1,
-1.724778, 0.4191856, -0.6189244, 1, 0.2117647, 0, 1,
-1.704429, -0.04644312, -2.252867, 1, 0.2156863, 0, 1,
-1.697448, 0.03253319, -1.079257, 1, 0.2235294, 0, 1,
-1.672337, 0.5301786, -1.641346, 1, 0.227451, 0, 1,
-1.64838, 0.2208545, -0.3648329, 1, 0.2352941, 0, 1,
-1.644342, 0.7266528, -0.6709286, 1, 0.2392157, 0, 1,
-1.638945, -0.3005192, -1.611221, 1, 0.2470588, 0, 1,
-1.625222, 0.7154965, -0.3015465, 1, 0.2509804, 0, 1,
-1.609788, 0.3162387, -1.904837, 1, 0.2588235, 0, 1,
-1.59625, -0.2400882, -0.9001055, 1, 0.2627451, 0, 1,
-1.595084, -0.6007074, -3.919428, 1, 0.2705882, 0, 1,
-1.584132, 2.131652, -1.344266, 1, 0.2745098, 0, 1,
-1.575446, -0.08294682, -1.626243, 1, 0.282353, 0, 1,
-1.572204, 0.595935, -1.477452, 1, 0.2862745, 0, 1,
-1.572044, -0.569258, -1.833549, 1, 0.2941177, 0, 1,
-1.570032, 0.5008504, -0.2955942, 1, 0.3019608, 0, 1,
-1.562307, 1.005985, -0.8865691, 1, 0.3058824, 0, 1,
-1.560288, 0.951456, -2.176647, 1, 0.3137255, 0, 1,
-1.557309, -0.3811815, -0.334737, 1, 0.3176471, 0, 1,
-1.553838, -0.3319218, -2.285216, 1, 0.3254902, 0, 1,
-1.548172, 0.2311901, 0.2588797, 1, 0.3294118, 0, 1,
-1.535969, -0.3134772, -1.446606, 1, 0.3372549, 0, 1,
-1.532729, -0.1470795, -2.221728, 1, 0.3411765, 0, 1,
-1.510193, 0.1623653, -1.06209, 1, 0.3490196, 0, 1,
-1.504972, 0.1275845, -2.574379, 1, 0.3529412, 0, 1,
-1.487494, 0.5404645, -0.0003672255, 1, 0.3607843, 0, 1,
-1.476258, -0.5477657, -0.869632, 1, 0.3647059, 0, 1,
-1.46447, -0.02727545, -2.464942, 1, 0.372549, 0, 1,
-1.46331, -1.119275, -0.9245699, 1, 0.3764706, 0, 1,
-1.458639, -1.411484, -5.009573, 1, 0.3843137, 0, 1,
-1.457126, 0.6177148, -0.4516804, 1, 0.3882353, 0, 1,
-1.455351, -0.9196388, -2.777061, 1, 0.3960784, 0, 1,
-1.448579, -0.04763321, -3.189167, 1, 0.4039216, 0, 1,
-1.429008, -0.002375898, -1.858341, 1, 0.4078431, 0, 1,
-1.424767, 1.467989, -1.157102, 1, 0.4156863, 0, 1,
-1.421435, 2.242132, -0.59541, 1, 0.4196078, 0, 1,
-1.416939, 0.9033027, -0.7680955, 1, 0.427451, 0, 1,
-1.415257, 0.3637247, 0.7122452, 1, 0.4313726, 0, 1,
-1.41048, -1.598547, -2.443342, 1, 0.4392157, 0, 1,
-1.408899, -1.659583, -0.4580443, 1, 0.4431373, 0, 1,
-1.387524, 1.384349, -0.3393205, 1, 0.4509804, 0, 1,
-1.384259, -0.2518033, -2.041486, 1, 0.454902, 0, 1,
-1.380975, 0.8310919, -0.8784707, 1, 0.4627451, 0, 1,
-1.368571, -0.3982628, -1.306073, 1, 0.4666667, 0, 1,
-1.35909, -0.2188116, -1.468418, 1, 0.4745098, 0, 1,
-1.356946, -1.246913, -2.296917, 1, 0.4784314, 0, 1,
-1.356825, 0.0177715, -0.3811767, 1, 0.4862745, 0, 1,
-1.352218, 0.5390494, -1.447408, 1, 0.4901961, 0, 1,
-1.347727, 0.2466134, -1.360396, 1, 0.4980392, 0, 1,
-1.34587, -1.933646, -3.931329, 1, 0.5058824, 0, 1,
-1.34199, -0.719164, -1.575485, 1, 0.509804, 0, 1,
-1.341535, -1.752009, -3.493086, 1, 0.5176471, 0, 1,
-1.339364, -0.7182848, -2.673992, 1, 0.5215687, 0, 1,
-1.332989, -0.3020057, -0.06932459, 1, 0.5294118, 0, 1,
-1.321355, -0.1236473, -1.705878, 1, 0.5333334, 0, 1,
-1.321165, -0.1864996, -2.502177, 1, 0.5411765, 0, 1,
-1.319384, -0.6565511, -3.524091, 1, 0.5450981, 0, 1,
-1.319098, 0.8947129, -1.680937, 1, 0.5529412, 0, 1,
-1.318032, 0.07661462, -0.2378972, 1, 0.5568628, 0, 1,
-1.317683, -0.6193109, -1.319267, 1, 0.5647059, 0, 1,
-1.317295, 0.7033295, -0.9843105, 1, 0.5686275, 0, 1,
-1.314923, -1.348587, -2.520695, 1, 0.5764706, 0, 1,
-1.298823, 0.4307811, -0.3545417, 1, 0.5803922, 0, 1,
-1.28512, 0.1775348, -0.6663509, 1, 0.5882353, 0, 1,
-1.276899, -1.130418, -3.273479, 1, 0.5921569, 0, 1,
-1.275007, -1.652264, -3.601386, 1, 0.6, 0, 1,
-1.268402, 1.073196, -1.775445, 1, 0.6078432, 0, 1,
-1.266099, 0.2085701, -0.08988798, 1, 0.6117647, 0, 1,
-1.26138, 0.7674518, -0.75215, 1, 0.6196079, 0, 1,
-1.249342, 1.94505, -0.7684447, 1, 0.6235294, 0, 1,
-1.241758, 1.258373, -0.6886748, 1, 0.6313726, 0, 1,
-1.229389, -0.8871306, -2.046832, 1, 0.6352941, 0, 1,
-1.221944, 0.6379712, -1.161154, 1, 0.6431373, 0, 1,
-1.218703, 0.5446064, -0.9462208, 1, 0.6470588, 0, 1,
-1.210874, -0.369835, -1.427292, 1, 0.654902, 0, 1,
-1.197735, -0.3170894, -2.565825, 1, 0.6588235, 0, 1,
-1.19761, -0.4243204, -1.460759, 1, 0.6666667, 0, 1,
-1.197081, -1.084438, -1.802092, 1, 0.6705883, 0, 1,
-1.193007, -0.3796931, -1.354642, 1, 0.6784314, 0, 1,
-1.191169, -0.07740759, -1.072431, 1, 0.682353, 0, 1,
-1.187937, 0.2565731, -1.270007, 1, 0.6901961, 0, 1,
-1.180041, -0.5939031, -1.283994, 1, 0.6941177, 0, 1,
-1.179901, -0.927456, -2.194815, 1, 0.7019608, 0, 1,
-1.177929, -1.245632, -1.959352, 1, 0.7098039, 0, 1,
-1.168674, -0.7535735, -3.811373, 1, 0.7137255, 0, 1,
-1.160302, 0.5890673, -0.3717272, 1, 0.7215686, 0, 1,
-1.15768, 1.849845, 0.1475998, 1, 0.7254902, 0, 1,
-1.155406, -1.51306, -3.793975, 1, 0.7333333, 0, 1,
-1.153651, -0.7236768, -4.371366, 1, 0.7372549, 0, 1,
-1.149564, -1.237433, -1.30967, 1, 0.7450981, 0, 1,
-1.145504, -0.548746, -0.6449406, 1, 0.7490196, 0, 1,
-1.143073, -0.9381922, -2.919331, 1, 0.7568628, 0, 1,
-1.1333, -0.4342874, -1.931866, 1, 0.7607843, 0, 1,
-1.127097, -0.1533179, -1.403452, 1, 0.7686275, 0, 1,
-1.12192, 0.3912292, -3.194459, 1, 0.772549, 0, 1,
-1.121737, -0.5350775, -0.9292712, 1, 0.7803922, 0, 1,
-1.1171, -0.1802423, -1.624312, 1, 0.7843137, 0, 1,
-1.116462, 0.8385001, -1.992365, 1, 0.7921569, 0, 1,
-1.113236, -1.600535, -2.992979, 1, 0.7960784, 0, 1,
-1.102912, 0.1037382, -1.738998, 1, 0.8039216, 0, 1,
-1.101822, -0.2627762, -3.008545, 1, 0.8117647, 0, 1,
-1.101153, -0.02957657, -0.6114215, 1, 0.8156863, 0, 1,
-1.088658, 1.22528, -1.17088, 1, 0.8235294, 0, 1,
-1.061822, -0.6202392, -0.8944985, 1, 0.827451, 0, 1,
-1.056844, -1.124056, -3.626107, 1, 0.8352941, 0, 1,
-1.028741, 1.455569, -0.7444186, 1, 0.8392157, 0, 1,
-1.02465, -0.4221177, -1.672929, 1, 0.8470588, 0, 1,
-1.01719, 0.2713834, -1.451374, 1, 0.8509804, 0, 1,
-1.0131, 0.2937309, -0.7406132, 1, 0.8588235, 0, 1,
-1.00761, 1.689229, -1.600541, 1, 0.8627451, 0, 1,
-1.007251, -0.05128656, -0.9494193, 1, 0.8705882, 0, 1,
-1.006896, -1.202545, -4.30038, 1, 0.8745098, 0, 1,
-1.004644, -0.200192, -0.1453177, 1, 0.8823529, 0, 1,
-0.9950992, 0.6619702, -1.64715, 1, 0.8862745, 0, 1,
-0.9918333, 0.3702611, -2.379397, 1, 0.8941177, 0, 1,
-0.9911843, 0.3429816, -1.812979, 1, 0.8980392, 0, 1,
-0.9911532, 0.5561306, -1.62957, 1, 0.9058824, 0, 1,
-0.9901406, -0.9875241, -2.054538, 1, 0.9137255, 0, 1,
-0.9901006, 0.9764348, 0.1871895, 1, 0.9176471, 0, 1,
-0.9871588, -1.728086, -3.8613, 1, 0.9254902, 0, 1,
-0.9810148, -1.491555, -2.640305, 1, 0.9294118, 0, 1,
-0.9759947, 1.673036, 1.078998, 1, 0.9372549, 0, 1,
-0.9753172, 0.2180953, -1.867203, 1, 0.9411765, 0, 1,
-0.9673499, -0.00930068, -1.640373, 1, 0.9490196, 0, 1,
-0.9595366, -0.6234027, -1.153062, 1, 0.9529412, 0, 1,
-0.954809, 0.3334545, -1.469586, 1, 0.9607843, 0, 1,
-0.9514235, -2.018202, -2.091522, 1, 0.9647059, 0, 1,
-0.9488857, -0.1307251, 0.9614909, 1, 0.972549, 0, 1,
-0.9439294, -0.206322, -3.082712, 1, 0.9764706, 0, 1,
-0.9425493, -0.09760179, -2.397042, 1, 0.9843137, 0, 1,
-0.9291579, 0.6140121, 0.1997218, 1, 0.9882353, 0, 1,
-0.9252144, 1.282362, -2.618991, 1, 0.9960784, 0, 1,
-0.9205446, -0.8398948, -1.284429, 0.9960784, 1, 0, 1,
-0.9127814, -0.7779192, -3.166086, 0.9921569, 1, 0, 1,
-0.9119254, 0.008037925, -2.195666, 0.9843137, 1, 0, 1,
-0.9119198, -0.9737088, -1.738309, 0.9803922, 1, 0, 1,
-0.9112474, -0.02874649, -1.667081, 0.972549, 1, 0, 1,
-0.907523, 0.06810283, 0.1037608, 0.9686275, 1, 0, 1,
-0.9039381, 0.5597438, -3.022823, 0.9607843, 1, 0, 1,
-0.9005502, -0.5088369, -1.845298, 0.9568627, 1, 0, 1,
-0.8982628, 1.376525, -3.012925, 0.9490196, 1, 0, 1,
-0.8973342, 0.2665602, -1.73268, 0.945098, 1, 0, 1,
-0.8956763, 0.9193702, 1.061839, 0.9372549, 1, 0, 1,
-0.8953068, -1.118882, -1.660685, 0.9333333, 1, 0, 1,
-0.8942083, 0.1140669, -0.380309, 0.9254902, 1, 0, 1,
-0.8929765, 0.09592997, -3.184078, 0.9215686, 1, 0, 1,
-0.8893548, -0.7308933, -1.212293, 0.9137255, 1, 0, 1,
-0.8873901, -2.571752, -3.589847, 0.9098039, 1, 0, 1,
-0.8825005, 1.050725, -1.68802, 0.9019608, 1, 0, 1,
-0.8742887, -0.6653585, -2.652579, 0.8941177, 1, 0, 1,
-0.8666278, -0.8014482, -0.5224131, 0.8901961, 1, 0, 1,
-0.866152, -0.6587889, -2.489328, 0.8823529, 1, 0, 1,
-0.8649364, -0.9154985, -1.262547, 0.8784314, 1, 0, 1,
-0.8634944, 0.2162088, -2.15383, 0.8705882, 1, 0, 1,
-0.8594768, -0.6102026, -0.4788827, 0.8666667, 1, 0, 1,
-0.8592697, 1.009977, -0.3120868, 0.8588235, 1, 0, 1,
-0.8584074, 0.352014, -2.144985, 0.854902, 1, 0, 1,
-0.8581253, 0.7389566, -1.998298, 0.8470588, 1, 0, 1,
-0.8519692, -0.9790571, -1.474683, 0.8431373, 1, 0, 1,
-0.8511817, -1.708662, -2.435237, 0.8352941, 1, 0, 1,
-0.8460753, 0.3069603, -1.096857, 0.8313726, 1, 0, 1,
-0.8304193, -0.5589412, -2.09977, 0.8235294, 1, 0, 1,
-0.8296822, 0.1739359, -0.794817, 0.8196079, 1, 0, 1,
-0.80563, 0.6493296, -0.9154747, 0.8117647, 1, 0, 1,
-0.8042452, -1.064, -1.042809, 0.8078431, 1, 0, 1,
-0.7958727, -0.2938324, -2.011068, 0.8, 1, 0, 1,
-0.7955558, -0.7379756, -1.936009, 0.7921569, 1, 0, 1,
-0.7949243, 0.8836631, -0.7471142, 0.7882353, 1, 0, 1,
-0.7896612, 0.7377483, 0.4809888, 0.7803922, 1, 0, 1,
-0.7894481, -0.3442685, -0.4038686, 0.7764706, 1, 0, 1,
-0.7860194, 1.366642, -2.16059, 0.7686275, 1, 0, 1,
-0.7838838, -0.775234, -1.676522, 0.7647059, 1, 0, 1,
-0.7824612, -1.519804, -1.918002, 0.7568628, 1, 0, 1,
-0.7820889, 0.7738273, 0.07653958, 0.7529412, 1, 0, 1,
-0.777474, 0.06173077, -0.5122796, 0.7450981, 1, 0, 1,
-0.7736126, 0.8653359, -0.9705073, 0.7411765, 1, 0, 1,
-0.7720918, -0.1824188, -1.44115, 0.7333333, 1, 0, 1,
-0.7719925, -0.8046011, -3.620479, 0.7294118, 1, 0, 1,
-0.7702513, 1.918009, 0.1201293, 0.7215686, 1, 0, 1,
-0.7693912, 0.2969026, -1.450396, 0.7176471, 1, 0, 1,
-0.7673104, -1.654048, -2.747389, 0.7098039, 1, 0, 1,
-0.7622145, -0.869527, -3.550743, 0.7058824, 1, 0, 1,
-0.7616339, -1.399657, -1.653167, 0.6980392, 1, 0, 1,
-0.7611483, -0.3899334, -1.229596, 0.6901961, 1, 0, 1,
-0.7608332, -0.3757639, -2.080859, 0.6862745, 1, 0, 1,
-0.7603317, -1.490875, -3.745406, 0.6784314, 1, 0, 1,
-0.7600141, -1.816752, -2.619784, 0.6745098, 1, 0, 1,
-0.7587448, 0.4001053, -2.003659, 0.6666667, 1, 0, 1,
-0.7499186, -1.249819, -1.550401, 0.6627451, 1, 0, 1,
-0.7495626, 1.993226, -0.8217459, 0.654902, 1, 0, 1,
-0.7487031, -0.9915927, 0.01290316, 0.6509804, 1, 0, 1,
-0.7440907, -1.422952, -2.228496, 0.6431373, 1, 0, 1,
-0.7393215, -0.3767358, -0.640098, 0.6392157, 1, 0, 1,
-0.7390581, 1.730184, -0.1278631, 0.6313726, 1, 0, 1,
-0.736003, -1.106037, -3.033416, 0.627451, 1, 0, 1,
-0.7344261, -0.4738066, -0.2994984, 0.6196079, 1, 0, 1,
-0.7304814, -1.146279, -0.7715936, 0.6156863, 1, 0, 1,
-0.7287929, 0.3564022, -1.643618, 0.6078432, 1, 0, 1,
-0.7277873, -0.5510299, -1.689011, 0.6039216, 1, 0, 1,
-0.7269397, -0.7791668, -1.113241, 0.5960785, 1, 0, 1,
-0.7197127, 0.2992945, -0.8023083, 0.5882353, 1, 0, 1,
-0.7147025, 0.3389643, -1.12642, 0.5843138, 1, 0, 1,
-0.7106614, -0.8025016, -3.456003, 0.5764706, 1, 0, 1,
-0.6975672, 0.9477536, 0.1022372, 0.572549, 1, 0, 1,
-0.6951153, 0.5910204, -1.569151, 0.5647059, 1, 0, 1,
-0.6950016, -0.112472, -3.027559, 0.5607843, 1, 0, 1,
-0.6906581, -0.004404347, -2.04005, 0.5529412, 1, 0, 1,
-0.6870732, -2.110554, -2.535793, 0.5490196, 1, 0, 1,
-0.6852288, 0.3468858, -0.4936645, 0.5411765, 1, 0, 1,
-0.6834326, 0.8404639, -0.7476248, 0.5372549, 1, 0, 1,
-0.680639, 0.2344012, 1.518847, 0.5294118, 1, 0, 1,
-0.6806352, -1.161637, -2.521268, 0.5254902, 1, 0, 1,
-0.6805508, -0.6597034, -2.571667, 0.5176471, 1, 0, 1,
-0.6737933, 0.9501344, -1.017081, 0.5137255, 1, 0, 1,
-0.6710691, 1.139345, -0.8723142, 0.5058824, 1, 0, 1,
-0.6651095, -0.2934504, -1.95456, 0.5019608, 1, 0, 1,
-0.6643226, -0.08318305, -0.3330975, 0.4941176, 1, 0, 1,
-0.6641924, 0.3770956, -1.187172, 0.4862745, 1, 0, 1,
-0.6624976, -0.7145902, -2.966305, 0.4823529, 1, 0, 1,
-0.662443, 0.7813064, -1.023304, 0.4745098, 1, 0, 1,
-0.6607475, 2.565143, 0.2631787, 0.4705882, 1, 0, 1,
-0.6590084, 1.291764, -1.560864, 0.4627451, 1, 0, 1,
-0.6534351, -1.421899, -3.121618, 0.4588235, 1, 0, 1,
-0.6520593, 0.6614322, -1.566761, 0.4509804, 1, 0, 1,
-0.6514167, -1.563179, -3.137471, 0.4470588, 1, 0, 1,
-0.6403775, 0.5337709, -0.7238929, 0.4392157, 1, 0, 1,
-0.6369669, -0.3219295, -1.643899, 0.4352941, 1, 0, 1,
-0.6299008, 0.2025556, -1.084129, 0.427451, 1, 0, 1,
-0.6270161, 1.06998, 1.141407, 0.4235294, 1, 0, 1,
-0.6189697, -0.4266164, -1.875539, 0.4156863, 1, 0, 1,
-0.612417, 0.8236957, 0.1426879, 0.4117647, 1, 0, 1,
-0.6111627, 0.2425053, -0.4165311, 0.4039216, 1, 0, 1,
-0.6110043, -1.086613, -3.687114, 0.3960784, 1, 0, 1,
-0.6094783, -2.400453, -3.656939, 0.3921569, 1, 0, 1,
-0.605949, -1.480338, -2.490051, 0.3843137, 1, 0, 1,
-0.5986942, -2.037338, -0.8484491, 0.3803922, 1, 0, 1,
-0.597431, 1.026261, -1.068956, 0.372549, 1, 0, 1,
-0.5959381, 1.053895, 0.4541909, 0.3686275, 1, 0, 1,
-0.5959143, -0.3336486, -2.854624, 0.3607843, 1, 0, 1,
-0.5937783, -1.894453, -2.649006, 0.3568628, 1, 0, 1,
-0.5934461, -0.6543645, -3.341738, 0.3490196, 1, 0, 1,
-0.5926347, 0.3066924, -0.8089699, 0.345098, 1, 0, 1,
-0.5912518, -0.6325324, -2.36402, 0.3372549, 1, 0, 1,
-0.5889941, -0.8185843, -1.946105, 0.3333333, 1, 0, 1,
-0.5889739, -0.1775515, 0.6881904, 0.3254902, 1, 0, 1,
-0.58855, -0.5965822, 0.7253463, 0.3215686, 1, 0, 1,
-0.588058, -0.7388391, -2.940378, 0.3137255, 1, 0, 1,
-0.5869328, 0.5764937, 0.5747791, 0.3098039, 1, 0, 1,
-0.5857989, 0.2398576, -1.259405, 0.3019608, 1, 0, 1,
-0.5817595, 0.5529999, -0.1330648, 0.2941177, 1, 0, 1,
-0.5780907, 0.3233793, 0.07558358, 0.2901961, 1, 0, 1,
-0.5780033, -1.261299, -2.529924, 0.282353, 1, 0, 1,
-0.5675494, 0.8425767, 0.0176978, 0.2784314, 1, 0, 1,
-0.5635205, 0.5992336, -0.8593981, 0.2705882, 1, 0, 1,
-0.5595011, -0.4479154, -2.904857, 0.2666667, 1, 0, 1,
-0.5580918, 0.03908934, -0.2996559, 0.2588235, 1, 0, 1,
-0.5537308, 1.619918, -0.5031134, 0.254902, 1, 0, 1,
-0.5535848, 1.401925, -1.140057, 0.2470588, 1, 0, 1,
-0.5523784, -0.5950271, -4.287639, 0.2431373, 1, 0, 1,
-0.5502617, -0.6152031, -1.672404, 0.2352941, 1, 0, 1,
-0.536754, -0.03146249, -2.737079, 0.2313726, 1, 0, 1,
-0.5327386, 1.33276, 0.8204722, 0.2235294, 1, 0, 1,
-0.5312849, -0.2996653, -1.271878, 0.2196078, 1, 0, 1,
-0.5308852, 1.038821, -0.01057507, 0.2117647, 1, 0, 1,
-0.529689, -0.7235823, -2.832666, 0.2078431, 1, 0, 1,
-0.5281519, 0.4588053, 0.159712, 0.2, 1, 0, 1,
-0.5275329, -0.3559714, -2.461091, 0.1921569, 1, 0, 1,
-0.5260838, 0.2846999, 0.5979751, 0.1882353, 1, 0, 1,
-0.5233399, 0.2408342, 0.9798943, 0.1803922, 1, 0, 1,
-0.5184603, 0.3256972, 0.9576958, 0.1764706, 1, 0, 1,
-0.5182172, 0.6168916, -0.9766876, 0.1686275, 1, 0, 1,
-0.5159511, 0.4414565, -1.667528, 0.1647059, 1, 0, 1,
-0.5154505, -0.001590054, -0.6968486, 0.1568628, 1, 0, 1,
-0.5081226, -1.092318, -3.336016, 0.1529412, 1, 0, 1,
-0.5066615, 0.7490777, -0.9871039, 0.145098, 1, 0, 1,
-0.5061313, 0.1408378, -0.3843769, 0.1411765, 1, 0, 1,
-0.5027019, 1.072368, 0.1319744, 0.1333333, 1, 0, 1,
-0.5013817, -0.7768792, -3.924272, 0.1294118, 1, 0, 1,
-0.5006064, 0.3476183, -0.664366, 0.1215686, 1, 0, 1,
-0.49955, 0.04198779, -1.209547, 0.1176471, 1, 0, 1,
-0.4982922, -0.5890808, -4.330529, 0.1098039, 1, 0, 1,
-0.4981641, -0.4231281, -2.854759, 0.1058824, 1, 0, 1,
-0.4956917, -1.769767, -2.229339, 0.09803922, 1, 0, 1,
-0.4922227, 1.088208, -0.08490575, 0.09019608, 1, 0, 1,
-0.491963, -0.3000181, -1.766889, 0.08627451, 1, 0, 1,
-0.4899606, -0.2928382, -2.154176, 0.07843138, 1, 0, 1,
-0.4899561, -1.122012, -4.639084, 0.07450981, 1, 0, 1,
-0.4716709, 1.770927, 0.2528736, 0.06666667, 1, 0, 1,
-0.4701209, -0.5601093, -0.05022577, 0.0627451, 1, 0, 1,
-0.4671246, 0.8064371, -0.652142, 0.05490196, 1, 0, 1,
-0.4637502, -0.2720276, -1.426688, 0.05098039, 1, 0, 1,
-0.4608858, -1.141381, -5.208749, 0.04313726, 1, 0, 1,
-0.4605029, -0.1483983, -1.503511, 0.03921569, 1, 0, 1,
-0.450545, 2.760472, -0.392744, 0.03137255, 1, 0, 1,
-0.4486347, -0.8527149, -1.531361, 0.02745098, 1, 0, 1,
-0.4472927, 2.556614, 0.4612969, 0.01960784, 1, 0, 1,
-0.4469722, 1.090338, 1.38485, 0.01568628, 1, 0, 1,
-0.4457842, 0.3444376, -1.064131, 0.007843138, 1, 0, 1,
-0.442971, -1.115338, -1.965454, 0.003921569, 1, 0, 1,
-0.441843, 0.5409136, -1.120205, 0, 1, 0.003921569, 1,
-0.4390701, 0.01375281, -1.683175, 0, 1, 0.01176471, 1,
-0.4374765, -0.4338374, -3.904017, 0, 1, 0.01568628, 1,
-0.4327241, -1.522183, -3.599765, 0, 1, 0.02352941, 1,
-0.4207081, 1.038758, 0.5474327, 0, 1, 0.02745098, 1,
-0.4206029, 0.360589, -0.8485792, 0, 1, 0.03529412, 1,
-0.4201161, -0.4993683, -1.575134, 0, 1, 0.03921569, 1,
-0.4105173, -0.179654, -2.999894, 0, 1, 0.04705882, 1,
-0.4070705, 0.4139622, -0.1879008, 0, 1, 0.05098039, 1,
-0.406837, 0.09363103, 0.6508578, 0, 1, 0.05882353, 1,
-0.406226, -0.3330334, -2.715539, 0, 1, 0.0627451, 1,
-0.4040357, 1.6262, -0.1623484, 0, 1, 0.07058824, 1,
-0.4017662, 0.259784, -0.3185486, 0, 1, 0.07450981, 1,
-0.3961779, 0.6108484, -1.760455, 0, 1, 0.08235294, 1,
-0.3960296, 1.047484, -1.788968, 0, 1, 0.08627451, 1,
-0.3919688, -1.603994, -3.994975, 0, 1, 0.09411765, 1,
-0.3902584, 0.1342612, -0.6687382, 0, 1, 0.1019608, 1,
-0.3865163, -0.7551402, -2.426641, 0, 1, 0.1058824, 1,
-0.3784546, 0.9516055, -2.233911, 0, 1, 0.1137255, 1,
-0.3722778, 0.4400869, -0.7067379, 0, 1, 0.1176471, 1,
-0.3720868, -1.458957, -4.412329, 0, 1, 0.1254902, 1,
-0.3706796, 0.4078159, -0.2163035, 0, 1, 0.1294118, 1,
-0.3669863, -0.05940554, -0.841107, 0, 1, 0.1372549, 1,
-0.3607074, 1.159711, -0.6451795, 0, 1, 0.1411765, 1,
-0.3591494, 0.4394543, 0.6194966, 0, 1, 0.1490196, 1,
-0.3585367, -0.71123, -2.710783, 0, 1, 0.1529412, 1,
-0.3555797, 1.119528, -0.1588172, 0, 1, 0.1607843, 1,
-0.354492, -0.6315027, -2.840036, 0, 1, 0.1647059, 1,
-0.3515631, 0.1589728, -2.360306, 0, 1, 0.172549, 1,
-0.3511811, -0.2490682, -2.59877, 0, 1, 0.1764706, 1,
-0.3507009, -0.0984957, -2.465019, 0, 1, 0.1843137, 1,
-0.3500223, -1.572799, -3.038254, 0, 1, 0.1882353, 1,
-0.3494701, 0.421131, -1.873101, 0, 1, 0.1960784, 1,
-0.3479971, 0.05373085, -3.249136, 0, 1, 0.2039216, 1,
-0.3455259, -0.004304986, -0.6945913, 0, 1, 0.2078431, 1,
-0.3436032, 0.04844771, -1.917634, 0, 1, 0.2156863, 1,
-0.3425517, 1.178788, 0.1884027, 0, 1, 0.2196078, 1,
-0.3358127, -0.6519175, -2.353379, 0, 1, 0.227451, 1,
-0.3348733, -1.400378, -2.095256, 0, 1, 0.2313726, 1,
-0.334857, -1.413962, -3.56405, 0, 1, 0.2392157, 1,
-0.3340887, 1.376666, -0.9766657, 0, 1, 0.2431373, 1,
-0.3274159, -0.4702193, -1.235507, 0, 1, 0.2509804, 1,
-0.3223138, -0.2570355, -3.576121, 0, 1, 0.254902, 1,
-0.3185884, 0.4821158, -1.799565, 0, 1, 0.2627451, 1,
-0.3178335, -0.6906421, -1.65263, 0, 1, 0.2666667, 1,
-0.316702, -1.625988, -3.104294, 0, 1, 0.2745098, 1,
-0.3076768, 0.4983669, -0.5264823, 0, 1, 0.2784314, 1,
-0.3058484, 1.186931, -1.54343, 0, 1, 0.2862745, 1,
-0.3058374, 2.11171, -1.090264, 0, 1, 0.2901961, 1,
-0.3018917, -0.08486971, -2.697312, 0, 1, 0.2980392, 1,
-0.2994834, -0.2649949, -0.7154335, 0, 1, 0.3058824, 1,
-0.2964717, 0.1456487, -0.09368357, 0, 1, 0.3098039, 1,
-0.2921592, -0.5839391, -2.49654, 0, 1, 0.3176471, 1,
-0.2905577, -0.3101262, -2.571327, 0, 1, 0.3215686, 1,
-0.2899588, -1.83089, -5.08028, 0, 1, 0.3294118, 1,
-0.2865635, 0.2199101, -0.2396933, 0, 1, 0.3333333, 1,
-0.2861094, 2.326887, -0.8946626, 0, 1, 0.3411765, 1,
-0.2825247, -1.709044, -3.482251, 0, 1, 0.345098, 1,
-0.2781057, 1.421414, 1.419966, 0, 1, 0.3529412, 1,
-0.2775582, -0.09810369, -2.368091, 0, 1, 0.3568628, 1,
-0.2751724, 1.234742, 1.938798, 0, 1, 0.3647059, 1,
-0.2740992, -0.8008591, -2.219309, 0, 1, 0.3686275, 1,
-0.2715614, 0.2638572, 1.448526, 0, 1, 0.3764706, 1,
-0.2710807, 0.2445149, -0.9693513, 0, 1, 0.3803922, 1,
-0.2702357, -0.2992277, -2.100945, 0, 1, 0.3882353, 1,
-0.268746, -0.5005136, -4.680829, 0, 1, 0.3921569, 1,
-0.2682851, 2.259818, 1.087089, 0, 1, 0.4, 1,
-0.2666213, -1.326293, -3.662772, 0, 1, 0.4078431, 1,
-0.2539018, -1.902293, -1.214333, 0, 1, 0.4117647, 1,
-0.2538052, 0.8608729, 0.6104923, 0, 1, 0.4196078, 1,
-0.2501145, -1.416069, -3.831872, 0, 1, 0.4235294, 1,
-0.2499383, 1.65658, 0.5287929, 0, 1, 0.4313726, 1,
-0.2489715, -0.2785102, -2.168729, 0, 1, 0.4352941, 1,
-0.2485652, 1.352503, -0.09275317, 0, 1, 0.4431373, 1,
-0.2474197, -0.2927827, -2.232537, 0, 1, 0.4470588, 1,
-0.2473565, 0.05574754, -2.163858, 0, 1, 0.454902, 1,
-0.2435481, 0.9763286, 0.8426698, 0, 1, 0.4588235, 1,
-0.2384488, 0.1042761, -2.201242, 0, 1, 0.4666667, 1,
-0.2301488, 1.246561, 1.0049, 0, 1, 0.4705882, 1,
-0.2297083, -1.91492, -1.850633, 0, 1, 0.4784314, 1,
-0.2267158, 0.6054517, -0.1604645, 0, 1, 0.4823529, 1,
-0.2255645, 0.4946446, -1.896166, 0, 1, 0.4901961, 1,
-0.2250926, 0.2700921, -0.1488199, 0, 1, 0.4941176, 1,
-0.2237166, -1.21169, -3.274284, 0, 1, 0.5019608, 1,
-0.2192874, -0.03804007, -2.46839, 0, 1, 0.509804, 1,
-0.2092909, 1.116993, 0.587762, 0, 1, 0.5137255, 1,
-0.2040626, 0.1260454, -1.123155, 0, 1, 0.5215687, 1,
-0.2021905, 1.218916, 0.1201321, 0, 1, 0.5254902, 1,
-0.2009523, -0.1248061, -1.63639, 0, 1, 0.5333334, 1,
-0.2007453, 0.1338129, 2.356463, 0, 1, 0.5372549, 1,
-0.1985432, 0.5134776, -0.6519397, 0, 1, 0.5450981, 1,
-0.1968095, -2.084444, -3.616651, 0, 1, 0.5490196, 1,
-0.1946925, 1.639196, -0.7365011, 0, 1, 0.5568628, 1,
-0.1906325, 0.1658404, -1.107176, 0, 1, 0.5607843, 1,
-0.1903658, -0.1996053, -2.104012, 0, 1, 0.5686275, 1,
-0.1895315, 1.415261, -0.6458937, 0, 1, 0.572549, 1,
-0.1875449, -1.916397, -3.065415, 0, 1, 0.5803922, 1,
-0.186363, -1.661144, -2.617544, 0, 1, 0.5843138, 1,
-0.182905, -1.002421, -3.233525, 0, 1, 0.5921569, 1,
-0.181147, -1.859557, -2.921355, 0, 1, 0.5960785, 1,
-0.1788332, 0.7761968, -1.18258, 0, 1, 0.6039216, 1,
-0.1762313, 1.45985, 0.4993771, 0, 1, 0.6117647, 1,
-0.1733711, -1.255095, -2.947548, 0, 1, 0.6156863, 1,
-0.1705355, 0.8913289, -1.390966, 0, 1, 0.6235294, 1,
-0.1679767, -2.139975, -2.476772, 0, 1, 0.627451, 1,
-0.165903, -0.9374299, -2.30451, 0, 1, 0.6352941, 1,
-0.1630505, 1.262794, -0.07824527, 0, 1, 0.6392157, 1,
-0.1617356, 0.09177332, -0.7118199, 0, 1, 0.6470588, 1,
-0.1609864, -1.686842, -3.327139, 0, 1, 0.6509804, 1,
-0.1602485, 0.7522044, -1.874809, 0, 1, 0.6588235, 1,
-0.1567015, -1.472575, -2.235356, 0, 1, 0.6627451, 1,
-0.1537087, 0.1528087, 1.111898, 0, 1, 0.6705883, 1,
-0.1483548, 0.6781362, -1.82896, 0, 1, 0.6745098, 1,
-0.1423731, 0.6307454, 2.481074, 0, 1, 0.682353, 1,
-0.1408461, -2.443641, -3.756468, 0, 1, 0.6862745, 1,
-0.1370995, -1.791993, -3.100766, 0, 1, 0.6941177, 1,
-0.1329986, 1.466297, -0.9113708, 0, 1, 0.7019608, 1,
-0.1289642, -0.2584776, -1.28882, 0, 1, 0.7058824, 1,
-0.1287407, -1.093341, -2.820514, 0, 1, 0.7137255, 1,
-0.1279671, 0.2479555, 1.074168, 0, 1, 0.7176471, 1,
-0.126327, -1.178117, -3.437509, 0, 1, 0.7254902, 1,
-0.1230365, -1.240598, -4.356375, 0, 1, 0.7294118, 1,
-0.1183683, 0.7695528, -1.554714, 0, 1, 0.7372549, 1,
-0.1160902, -0.6585602, -1.502255, 0, 1, 0.7411765, 1,
-0.1159994, 0.1456569, -0.2005989, 0, 1, 0.7490196, 1,
-0.1153638, -0.855489, -3.23099, 0, 1, 0.7529412, 1,
-0.1153373, 0.1377171, -0.3327874, 0, 1, 0.7607843, 1,
-0.1143453, -0.7045759, -2.719856, 0, 1, 0.7647059, 1,
-0.112262, 0.4553241, -0.7316678, 0, 1, 0.772549, 1,
-0.1061496, -0.2327114, -1.223092, 0, 1, 0.7764706, 1,
-0.1053926, -0.1297316, -2.767126, 0, 1, 0.7843137, 1,
-0.104819, -0.3870758, -3.451632, 0, 1, 0.7882353, 1,
-0.1011621, 0.7206667, 0.6000447, 0, 1, 0.7960784, 1,
-0.09977399, 0.980707, -0.2258312, 0, 1, 0.8039216, 1,
-0.09014184, -0.3474542, -3.538403, 0, 1, 0.8078431, 1,
-0.08910076, 0.02385443, -2.738599, 0, 1, 0.8156863, 1,
-0.08584025, -1.209701, -3.431268, 0, 1, 0.8196079, 1,
-0.08183178, -2.298442, -2.577142, 0, 1, 0.827451, 1,
-0.08180182, 1.615969, -2.044831, 0, 1, 0.8313726, 1,
-0.07361627, 0.9817743, 0.1714348, 0, 1, 0.8392157, 1,
-0.07336549, 0.3520645, 0.8239613, 0, 1, 0.8431373, 1,
-0.07292853, -1.782323, -2.913219, 0, 1, 0.8509804, 1,
-0.06889274, 0.3948733, -0.8153821, 0, 1, 0.854902, 1,
-0.06764048, 0.06265913, -2.534864, 0, 1, 0.8627451, 1,
-0.06656177, -1.464641, -3.589778, 0, 1, 0.8666667, 1,
-0.06643123, -0.6602998, -2.826406, 0, 1, 0.8745098, 1,
-0.06412355, 0.8550363, -0.03463267, 0, 1, 0.8784314, 1,
-0.06380667, 0.1298928, -1.517125, 0, 1, 0.8862745, 1,
-0.06096834, 1.074648, -0.9426874, 0, 1, 0.8901961, 1,
-0.05891774, -0.1454361, -1.66397, 0, 1, 0.8980392, 1,
-0.05602271, 0.5354319, -2.524101, 0, 1, 0.9058824, 1,
-0.05597026, 0.4870862, -0.08182445, 0, 1, 0.9098039, 1,
-0.05549001, -0.2908797, -2.033392, 0, 1, 0.9176471, 1,
-0.04587366, -0.9564857, -6.196913, 0, 1, 0.9215686, 1,
-0.04555295, -0.7585775, -2.619106, 0, 1, 0.9294118, 1,
-0.04308933, 0.6110502, -1.003415, 0, 1, 0.9333333, 1,
-0.04214316, 0.7243597, 0.745994, 0, 1, 0.9411765, 1,
-0.03630323, -1.297961, -2.900897, 0, 1, 0.945098, 1,
-0.03476033, 0.841132, 0.746355, 0, 1, 0.9529412, 1,
-0.03030463, -0.4667002, -4.086257, 0, 1, 0.9568627, 1,
-0.02835265, 0.8650258, -0.6981831, 0, 1, 0.9647059, 1,
-0.0255055, 1.448628, 1.469379, 0, 1, 0.9686275, 1,
-0.02532787, -0.5723391, -2.369768, 0, 1, 0.9764706, 1,
-0.02204868, -0.05249066, -1.971598, 0, 1, 0.9803922, 1,
-0.02068682, -0.3408937, -2.207748, 0, 1, 0.9882353, 1,
-0.02014093, 0.214439, -0.7786443, 0, 1, 0.9921569, 1,
-0.01795136, 1.128864, 1.807483, 0, 1, 1, 1,
-0.01681611, 1.278247, 1.342843, 0, 0.9921569, 1, 1,
-0.01506052, -1.297981, -3.678846, 0, 0.9882353, 1, 1,
-0.01412946, 0.2712471, 0.03801801, 0, 0.9803922, 1, 1,
-0.00931222, 0.9728214, -0.8478188, 0, 0.9764706, 1, 1,
-0.009130789, 0.5993083, -0.4725541, 0, 0.9686275, 1, 1,
-0.007919392, -0.6118712, -3.767814, 0, 0.9647059, 1, 1,
-0.00327701, 0.5127918, -0.706752, 0, 0.9568627, 1, 1,
-0.002225389, -0.400367, -2.668803, 0, 0.9529412, 1, 1,
0.003105834, -0.1081608, 3.881485, 0, 0.945098, 1, 1,
0.003887157, -0.9841911, 2.221375, 0, 0.9411765, 1, 1,
0.004616832, 0.9078597, 0.9504469, 0, 0.9333333, 1, 1,
0.01381281, -0.8373473, 4.061554, 0, 0.9294118, 1, 1,
0.01427887, 0.1586671, -2.373023, 0, 0.9215686, 1, 1,
0.01651369, 0.20341, 0.741358, 0, 0.9176471, 1, 1,
0.01708162, 1.189995, 1.036824, 0, 0.9098039, 1, 1,
0.01754036, 0.9022624, -2.052352, 0, 0.9058824, 1, 1,
0.02319517, 1.707518, 0.4533182, 0, 0.8980392, 1, 1,
0.02367474, -0.6503165, 0.8791257, 0, 0.8901961, 1, 1,
0.02638479, 0.6526348, 0.5165714, 0, 0.8862745, 1, 1,
0.02733372, 0.3263566, 0.8688311, 0, 0.8784314, 1, 1,
0.02751337, 0.02458848, -1.427198, 0, 0.8745098, 1, 1,
0.02882694, 0.2918087, 1.754567, 0, 0.8666667, 1, 1,
0.0341248, 2.327623, -1.257032, 0, 0.8627451, 1, 1,
0.03497186, 0.2150484, 0.6402716, 0, 0.854902, 1, 1,
0.03529941, -1.365368, 2.15592, 0, 0.8509804, 1, 1,
0.0360413, 0.6824017, 1.65097, 0, 0.8431373, 1, 1,
0.03605184, 0.4476904, -0.09047016, 0, 0.8392157, 1, 1,
0.04014415, -0.9250854, 4.07016, 0, 0.8313726, 1, 1,
0.04364018, -0.7826869, 3.170998, 0, 0.827451, 1, 1,
0.04484395, -1.824407, 2.336609, 0, 0.8196079, 1, 1,
0.04805689, 0.68622, -0.7920169, 0, 0.8156863, 1, 1,
0.04855039, 0.9208947, -0.7491792, 0, 0.8078431, 1, 1,
0.05105723, 1.698529, 0.2411525, 0, 0.8039216, 1, 1,
0.05655395, 0.01770226, 0.7235603, 0, 0.7960784, 1, 1,
0.06122449, -1.724107, 1.789621, 0, 0.7882353, 1, 1,
0.06402435, -0.01443069, 2.351384, 0, 0.7843137, 1, 1,
0.06618006, 0.7381485, -0.7726282, 0, 0.7764706, 1, 1,
0.06773742, 0.4545346, 0.09859034, 0, 0.772549, 1, 1,
0.0704251, -1.030474, 1.622219, 0, 0.7647059, 1, 1,
0.07663609, -0.449012, 3.148169, 0, 0.7607843, 1, 1,
0.0797717, 0.6819789, -1.841029, 0, 0.7529412, 1, 1,
0.08038841, -1.732605, 1.725524, 0, 0.7490196, 1, 1,
0.0851979, -0.8333659, 3.272245, 0, 0.7411765, 1, 1,
0.08522451, 0.2427766, 0.5019818, 0, 0.7372549, 1, 1,
0.09283926, -1.557437, 3.465792, 0, 0.7294118, 1, 1,
0.09358336, -1.422565, 2.354342, 0, 0.7254902, 1, 1,
0.09924822, -1.642708, 4.141134, 0, 0.7176471, 1, 1,
0.1010132, 1.308397, 1.468235, 0, 0.7137255, 1, 1,
0.1037027, 0.8851748, -0.6199552, 0, 0.7058824, 1, 1,
0.1061041, 1.021238, 0.6570625, 0, 0.6980392, 1, 1,
0.1073991, -0.4423559, 1.822075, 0, 0.6941177, 1, 1,
0.1098087, 2.284838, 0.1903734, 0, 0.6862745, 1, 1,
0.1196121, 0.2880759, 0.374908, 0, 0.682353, 1, 1,
0.1240388, 0.9682609, -0.1629121, 0, 0.6745098, 1, 1,
0.1253928, -0.5594092, 2.439386, 0, 0.6705883, 1, 1,
0.1283066, 1.940408, 0.9306285, 0, 0.6627451, 1, 1,
0.1289101, -0.7347798, 2.705845, 0, 0.6588235, 1, 1,
0.1313251, -0.9715312, 3.449856, 0, 0.6509804, 1, 1,
0.131775, -0.683761, 2.184951, 0, 0.6470588, 1, 1,
0.1318721, -0.8007871, 1.259358, 0, 0.6392157, 1, 1,
0.138886, -0.4642109, 3.784704, 0, 0.6352941, 1, 1,
0.140082, 0.2040815, -0.5825607, 0, 0.627451, 1, 1,
0.1401542, 0.7062873, 2.131872, 0, 0.6235294, 1, 1,
0.1420022, 0.001145769, -0.06908267, 0, 0.6156863, 1, 1,
0.1432188, 0.7962304, 1.359643, 0, 0.6117647, 1, 1,
0.1452125, 0.2591212, 0.04331607, 0, 0.6039216, 1, 1,
0.146179, 0.07325047, 1.229358, 0, 0.5960785, 1, 1,
0.1467014, -0.1127785, 2.024649, 0, 0.5921569, 1, 1,
0.146876, 1.792351, 0.7611643, 0, 0.5843138, 1, 1,
0.1494607, -1.552309, 2.761523, 0, 0.5803922, 1, 1,
0.1516841, -0.1520868, 1.851564, 0, 0.572549, 1, 1,
0.1587077, 0.4195549, -0.5991673, 0, 0.5686275, 1, 1,
0.1603266, -0.4352051, 2.842397, 0, 0.5607843, 1, 1,
0.1617299, 0.002307079, 0.6205426, 0, 0.5568628, 1, 1,
0.1621214, 0.09832269, -0.1162348, 0, 0.5490196, 1, 1,
0.1628104, -0.8528689, 2.631532, 0, 0.5450981, 1, 1,
0.1645801, -0.2530047, 2.250319, 0, 0.5372549, 1, 1,
0.1658888, -0.6021922, 3.648573, 0, 0.5333334, 1, 1,
0.1676447, -0.8768641, 4.004071, 0, 0.5254902, 1, 1,
0.1697009, -1.181958, 3.232783, 0, 0.5215687, 1, 1,
0.1710687, 2.042117, 0.3956417, 0, 0.5137255, 1, 1,
0.1744812, 1.148392, 0.1320939, 0, 0.509804, 1, 1,
0.1757666, 0.2244541, -0.3039019, 0, 0.5019608, 1, 1,
0.1792242, 0.05213235, 0.2670786, 0, 0.4941176, 1, 1,
0.1800686, 0.3067737, -0.3116192, 0, 0.4901961, 1, 1,
0.1829793, 1.669635, -0.3649299, 0, 0.4823529, 1, 1,
0.1855546, -1.054963, 3.328044, 0, 0.4784314, 1, 1,
0.1950883, 0.7668291, 0.36884, 0, 0.4705882, 1, 1,
0.1982716, -1.438472, 3.292692, 0, 0.4666667, 1, 1,
0.1998283, 1.730883, 2.517147, 0, 0.4588235, 1, 1,
0.2003231, -0.7186176, 2.853255, 0, 0.454902, 1, 1,
0.2035458, -0.754545, 3.48747, 0, 0.4470588, 1, 1,
0.2059834, -0.6626946, 3.330768, 0, 0.4431373, 1, 1,
0.2088688, -2.261352, 3.982215, 0, 0.4352941, 1, 1,
0.2101475, 0.08489672, 0.6135529, 0, 0.4313726, 1, 1,
0.2104923, 1.33373, -1.938391, 0, 0.4235294, 1, 1,
0.2214981, 0.2452624, 3.38595, 0, 0.4196078, 1, 1,
0.2223029, -1.590969, 3.063331, 0, 0.4117647, 1, 1,
0.2223307, -0.01516851, 0.5126932, 0, 0.4078431, 1, 1,
0.224586, 0.4119855, -0.9908703, 0, 0.4, 1, 1,
0.2271002, -0.82298, 2.285501, 0, 0.3921569, 1, 1,
0.2339419, 0.1527409, 1.300766, 0, 0.3882353, 1, 1,
0.2340149, 1.506768, 1.500258, 0, 0.3803922, 1, 1,
0.2404245, -0.4987882, 0.7309337, 0, 0.3764706, 1, 1,
0.2415124, 0.02955065, 2.77049, 0, 0.3686275, 1, 1,
0.2423499, -1.232251, 2.250965, 0, 0.3647059, 1, 1,
0.244697, 1.264672, -1.393372, 0, 0.3568628, 1, 1,
0.2476586, 1.406286, -0.4013188, 0, 0.3529412, 1, 1,
0.2486427, 0.1813173, -0.278489, 0, 0.345098, 1, 1,
0.2541956, -0.8070024, 2.657737, 0, 0.3411765, 1, 1,
0.2546875, 0.3452102, 2.025176, 0, 0.3333333, 1, 1,
0.2595445, -1.895962, 4.141698, 0, 0.3294118, 1, 1,
0.2602438, 0.9980111, 0.1050259, 0, 0.3215686, 1, 1,
0.2639539, 1.007292, 1.533587, 0, 0.3176471, 1, 1,
0.2712257, -1.02208, 3.06425, 0, 0.3098039, 1, 1,
0.2713916, -2.002907, 2.313617, 0, 0.3058824, 1, 1,
0.2752688, -1.497893, 2.820239, 0, 0.2980392, 1, 1,
0.2803319, 0.864094, 1.664684, 0, 0.2901961, 1, 1,
0.2821264, -0.1892742, 2.401609, 0, 0.2862745, 1, 1,
0.2834822, -0.4628744, 2.618482, 0, 0.2784314, 1, 1,
0.2884435, -0.06016822, 1.059795, 0, 0.2745098, 1, 1,
0.2887383, 0.2897132, 0.5094634, 0, 0.2666667, 1, 1,
0.292064, 0.313479, -0.606826, 0, 0.2627451, 1, 1,
0.2924246, -0.5688699, 3.688231, 0, 0.254902, 1, 1,
0.2953605, -0.6985759, 2.189789, 0, 0.2509804, 1, 1,
0.2955156, -0.2368749, 3.163491, 0, 0.2431373, 1, 1,
0.2972219, -1.115091, 1.553774, 0, 0.2392157, 1, 1,
0.298416, -1.112137, 3.634554, 0, 0.2313726, 1, 1,
0.2984239, 0.9323627, 0.317642, 0, 0.227451, 1, 1,
0.2995941, 0.9767312, 0.1262312, 0, 0.2196078, 1, 1,
0.2996953, 0.07992992, 0.8267339, 0, 0.2156863, 1, 1,
0.3000423, -0.1943344, 2.546753, 0, 0.2078431, 1, 1,
0.3031603, -0.7650309, 2.959429, 0, 0.2039216, 1, 1,
0.306744, 0.850969, -1.230752, 0, 0.1960784, 1, 1,
0.3068216, -1.122817, 4.041842, 0, 0.1882353, 1, 1,
0.3119253, -0.4511619, 1.457541, 0, 0.1843137, 1, 1,
0.3130271, -0.8445652, 2.041218, 0, 0.1764706, 1, 1,
0.3179907, 1.004315, 0.924992, 0, 0.172549, 1, 1,
0.3220617, -0.8126022, 2.704668, 0, 0.1647059, 1, 1,
0.3238204, 1.18867, -0.7925225, 0, 0.1607843, 1, 1,
0.3281383, 0.9881827, 0.3174498, 0, 0.1529412, 1, 1,
0.3291696, 1.200382, -0.3711966, 0, 0.1490196, 1, 1,
0.3320681, 1.359698, 0.8844984, 0, 0.1411765, 1, 1,
0.3325306, 0.6170269, 0.6918173, 0, 0.1372549, 1, 1,
0.3358788, 1.039196, -0.9926166, 0, 0.1294118, 1, 1,
0.3388406, -0.1958373, 1.98915, 0, 0.1254902, 1, 1,
0.3395557, 0.408242, 0.3930712, 0, 0.1176471, 1, 1,
0.3418022, 0.3630916, 1.238406, 0, 0.1137255, 1, 1,
0.3447178, 2.358564, -1.034656, 0, 0.1058824, 1, 1,
0.3451276, -0.8690839, 4.032156, 0, 0.09803922, 1, 1,
0.3469488, 0.7717268, 0.5076939, 0, 0.09411765, 1, 1,
0.3480502, 1.007921, -1.439876, 0, 0.08627451, 1, 1,
0.3525516, 0.7902822, 0.6083261, 0, 0.08235294, 1, 1,
0.3599948, 0.1541262, 0.9136003, 0, 0.07450981, 1, 1,
0.3659004, 0.2111882, 0.501012, 0, 0.07058824, 1, 1,
0.3661676, 0.5195083, 0.6576203, 0, 0.0627451, 1, 1,
0.3665692, 0.04543066, 1.427121, 0, 0.05882353, 1, 1,
0.3700824, 0.2993295, -0.2040693, 0, 0.05098039, 1, 1,
0.3705738, -1.211725, 3.426734, 0, 0.04705882, 1, 1,
0.3784681, -1.274832, 2.697507, 0, 0.03921569, 1, 1,
0.3829731, 0.1382994, -1.679061, 0, 0.03529412, 1, 1,
0.3862672, -0.4821784, 2.052581, 0, 0.02745098, 1, 1,
0.3906144, -0.8990192, 3.444536, 0, 0.02352941, 1, 1,
0.3907716, 0.08118804, 0.9507357, 0, 0.01568628, 1, 1,
0.3910219, -1.366169, 2.360885, 0, 0.01176471, 1, 1,
0.3930986, -1.331839, 3.170478, 0, 0.003921569, 1, 1,
0.3967473, -0.7901295, 2.029043, 0.003921569, 0, 1, 1,
0.3969429, -0.077771, 0.7732385, 0.007843138, 0, 1, 1,
0.3974187, -0.9422619, 2.300193, 0.01568628, 0, 1, 1,
0.3990283, 0.8374445, 0.177342, 0.01960784, 0, 1, 1,
0.4041443, -1.443201, 1.185573, 0.02745098, 0, 1, 1,
0.4046284, 2.521233, -0.3992973, 0.03137255, 0, 1, 1,
0.4059196, -0.04741826, 1.496421, 0.03921569, 0, 1, 1,
0.4149911, -0.6115599, 4.134968, 0.04313726, 0, 1, 1,
0.4294051, 2.056404, -1.63157, 0.05098039, 0, 1, 1,
0.4305087, -0.4072883, 3.15063, 0.05490196, 0, 1, 1,
0.4310687, 0.2984017, 0.4531161, 0.0627451, 0, 1, 1,
0.4320073, -0.1847997, 1.606002, 0.06666667, 0, 1, 1,
0.4321873, -0.5295665, 1.991287, 0.07450981, 0, 1, 1,
0.4322618, -1.15721, 2.045006, 0.07843138, 0, 1, 1,
0.433638, 0.08960607, 0.2155844, 0.08627451, 0, 1, 1,
0.4343814, 1.90475, -1.015302, 0.09019608, 0, 1, 1,
0.4370078, 0.3029605, 0.6515049, 0.09803922, 0, 1, 1,
0.4371248, 0.7010679, 1.045866, 0.1058824, 0, 1, 1,
0.4372982, -0.9238381, 2.169134, 0.1098039, 0, 1, 1,
0.4375645, -1.147363, 3.971135, 0.1176471, 0, 1, 1,
0.438131, 0.6816325, 0.6107172, 0.1215686, 0, 1, 1,
0.4410535, 2.009584, -0.1299222, 0.1294118, 0, 1, 1,
0.4428546, -0.3678412, 0.9492795, 0.1333333, 0, 1, 1,
0.4442015, -0.4225105, 3.292291, 0.1411765, 0, 1, 1,
0.4505631, -0.3194497, 1.248999, 0.145098, 0, 1, 1,
0.4524834, -0.5124865, 2.518975, 0.1529412, 0, 1, 1,
0.4565249, -0.8762453, 2.492128, 0.1568628, 0, 1, 1,
0.4570029, 0.04676065, 0.283208, 0.1647059, 0, 1, 1,
0.4681668, -2.527874, 3.12366, 0.1686275, 0, 1, 1,
0.4708728, -0.322542, 2.535434, 0.1764706, 0, 1, 1,
0.4712626, 0.5195311, 1.678861, 0.1803922, 0, 1, 1,
0.4713433, -0.4457025, 2.536898, 0.1882353, 0, 1, 1,
0.4735051, 0.9692857, 1.234802, 0.1921569, 0, 1, 1,
0.4866681, -1.266966, 3.831482, 0.2, 0, 1, 1,
0.5005366, -0.9253304, 1.96501, 0.2078431, 0, 1, 1,
0.5009842, 0.1838006, -0.8733465, 0.2117647, 0, 1, 1,
0.5129651, 0.6393892, -0.001163757, 0.2196078, 0, 1, 1,
0.5164647, 0.2751297, 1.629155, 0.2235294, 0, 1, 1,
0.5174208, -0.05966087, 0.3153026, 0.2313726, 0, 1, 1,
0.5179941, -0.2407918, 1.543306, 0.2352941, 0, 1, 1,
0.5214479, -1.492205, 2.275203, 0.2431373, 0, 1, 1,
0.5226893, -0.4563861, 2.364868, 0.2470588, 0, 1, 1,
0.5228513, -1.378268, 1.6432, 0.254902, 0, 1, 1,
0.523398, 0.5988186, 0.51967, 0.2588235, 0, 1, 1,
0.5267367, 0.8485349, 0.6630967, 0.2666667, 0, 1, 1,
0.5328356, -0.2539777, 1.444867, 0.2705882, 0, 1, 1,
0.5349312, 1.717375, 2.69726, 0.2784314, 0, 1, 1,
0.536851, -0.7296788, 2.790464, 0.282353, 0, 1, 1,
0.5383235, -0.105421, 1.288683, 0.2901961, 0, 1, 1,
0.538446, 0.5196367, 1.231626, 0.2941177, 0, 1, 1,
0.5388163, -0.2102654, 1.822976, 0.3019608, 0, 1, 1,
0.5402927, 0.7747944, 0.6096779, 0.3098039, 0, 1, 1,
0.5471315, -0.6339008, 2.908896, 0.3137255, 0, 1, 1,
0.5518489, 2.634501, 1.570626, 0.3215686, 0, 1, 1,
0.5547811, -0.4274387, 0.105875, 0.3254902, 0, 1, 1,
0.5625143, 0.3463093, 1.881243, 0.3333333, 0, 1, 1,
0.5699711, 0.2274375, 1.529218, 0.3372549, 0, 1, 1,
0.5709803, -0.2267256, 2.132689, 0.345098, 0, 1, 1,
0.5790425, 1.264884, 0.6201954, 0.3490196, 0, 1, 1,
0.5900136, 0.6143767, -0.05022344, 0.3568628, 0, 1, 1,
0.5956669, -0.2370827, 2.398858, 0.3607843, 0, 1, 1,
0.5982714, 1.009302, -0.264547, 0.3686275, 0, 1, 1,
0.6062049, 0.8227086, -1.015011, 0.372549, 0, 1, 1,
0.6064236, -0.4265628, 3.451493, 0.3803922, 0, 1, 1,
0.6074134, 0.4560634, 0.4324852, 0.3843137, 0, 1, 1,
0.6087665, 0.5496334, 0.05850351, 0.3921569, 0, 1, 1,
0.6092052, 1.910542, 1.617369, 0.3960784, 0, 1, 1,
0.610037, 0.4325342, -0.6605127, 0.4039216, 0, 1, 1,
0.6121093, 0.1556468, 1.777163, 0.4117647, 0, 1, 1,
0.6144669, 2.015423, 1.741371, 0.4156863, 0, 1, 1,
0.6152824, 0.317814, 1.16026, 0.4235294, 0, 1, 1,
0.6171384, -1.235219, 3.308387, 0.427451, 0, 1, 1,
0.6202013, -0.4230158, 1.021205, 0.4352941, 0, 1, 1,
0.6247778, 0.2972488, 2.774562, 0.4392157, 0, 1, 1,
0.6258096, 0.4845204, 1.215375, 0.4470588, 0, 1, 1,
0.6266126, -0.8534676, 1.978299, 0.4509804, 0, 1, 1,
0.6295985, -0.05728052, 1.400849, 0.4588235, 0, 1, 1,
0.6304062, 1.252508, 2.321701, 0.4627451, 0, 1, 1,
0.6335227, 0.5588879, 0.4868108, 0.4705882, 0, 1, 1,
0.6381795, -0.2933468, 1.613472, 0.4745098, 0, 1, 1,
0.6384621, -0.9502629, 3.582673, 0.4823529, 0, 1, 1,
0.639245, -1.377324, 3.623757, 0.4862745, 0, 1, 1,
0.6427966, -2.004509, 1.812122, 0.4941176, 0, 1, 1,
0.6429588, -0.05160753, 1.33568, 0.5019608, 0, 1, 1,
0.6443943, 0.2527272, 2.229183, 0.5058824, 0, 1, 1,
0.6474668, 0.3766592, -0.3111851, 0.5137255, 0, 1, 1,
0.6627497, 0.7556256, 0.7655275, 0.5176471, 0, 1, 1,
0.6666003, 0.1439013, 0.372722, 0.5254902, 0, 1, 1,
0.6691866, -1.139458, 3.182857, 0.5294118, 0, 1, 1,
0.6722695, -0.7796139, 1.816674, 0.5372549, 0, 1, 1,
0.672876, -1.212068, 3.128397, 0.5411765, 0, 1, 1,
0.6826754, -0.05896317, 1.571191, 0.5490196, 0, 1, 1,
0.6921432, 2.764874, -0.4131471, 0.5529412, 0, 1, 1,
0.6957691, -0.4712714, 0.6680456, 0.5607843, 0, 1, 1,
0.7159352, 0.5814788, -0.1305073, 0.5647059, 0, 1, 1,
0.7164792, -1.778803, 4.36017, 0.572549, 0, 1, 1,
0.7194453, 0.01134727, 1.349026, 0.5764706, 0, 1, 1,
0.7234318, -1.937333, 4.964432, 0.5843138, 0, 1, 1,
0.7273337, -0.08764492, 2.084591, 0.5882353, 0, 1, 1,
0.7317109, -0.9865959, 3.500742, 0.5960785, 0, 1, 1,
0.7323028, -0.5541708, 3.021722, 0.6039216, 0, 1, 1,
0.733202, 0.2674179, 1.719468, 0.6078432, 0, 1, 1,
0.7366417, -0.5513073, 0.8774146, 0.6156863, 0, 1, 1,
0.7371376, 1.826047, 1.979416, 0.6196079, 0, 1, 1,
0.7443479, 1.555673, 1.056339, 0.627451, 0, 1, 1,
0.7539187, -0.937847, 1.486312, 0.6313726, 0, 1, 1,
0.7560885, -0.7552803, 4.448042, 0.6392157, 0, 1, 1,
0.7567681, 1.477494, -0.8956106, 0.6431373, 0, 1, 1,
0.7631399, -1.292698, 2.775934, 0.6509804, 0, 1, 1,
0.7739639, -0.2274927, 1.232904, 0.654902, 0, 1, 1,
0.7788306, -0.2258177, 2.071718, 0.6627451, 0, 1, 1,
0.7846968, 1.135303, 1.06781, 0.6666667, 0, 1, 1,
0.7853068, 1.381398, -0.2647949, 0.6745098, 0, 1, 1,
0.7901707, 1.015012, -0.6513286, 0.6784314, 0, 1, 1,
0.798147, -0.2857955, -0.1029294, 0.6862745, 0, 1, 1,
0.799124, -0.05901338, 1.167247, 0.6901961, 0, 1, 1,
0.8018435, 0.239425, 0.7607156, 0.6980392, 0, 1, 1,
0.8061032, -0.2557142, 0.9314166, 0.7058824, 0, 1, 1,
0.8084661, 0.246708, 1.924431, 0.7098039, 0, 1, 1,
0.8087679, 0.4632254, 1.356967, 0.7176471, 0, 1, 1,
0.8110242, -0.3405195, 0.6796816, 0.7215686, 0, 1, 1,
0.816398, -0.673824, 3.336755, 0.7294118, 0, 1, 1,
0.824333, -1.059259, 2.291952, 0.7333333, 0, 1, 1,
0.8267339, -0.2513475, 0.89381, 0.7411765, 0, 1, 1,
0.8292069, -0.1711955, 0.8176245, 0.7450981, 0, 1, 1,
0.8298783, 0.09017605, 3.049539, 0.7529412, 0, 1, 1,
0.8342322, -1.849707, 1.88987, 0.7568628, 0, 1, 1,
0.8375444, -1.245805, 2.58296, 0.7647059, 0, 1, 1,
0.8471802, 0.1085552, 3.26868, 0.7686275, 0, 1, 1,
0.8492194, -0.8220528, 2.594788, 0.7764706, 0, 1, 1,
0.8504169, 0.4965697, 0.8726367, 0.7803922, 0, 1, 1,
0.8531226, -0.0422871, 1.344094, 0.7882353, 0, 1, 1,
0.8538079, -1.430707, 3.217204, 0.7921569, 0, 1, 1,
0.8550007, 0.2568901, 1.077852, 0.8, 0, 1, 1,
0.8603733, -0.08318456, 1.892132, 0.8078431, 0, 1, 1,
0.8661178, 0.3703987, 0.7794703, 0.8117647, 0, 1, 1,
0.8696668, -0.593085, 4.13559, 0.8196079, 0, 1, 1,
0.8781765, 0.5825573, 2.035807, 0.8235294, 0, 1, 1,
0.8790094, -1.175436, 0.4684296, 0.8313726, 0, 1, 1,
0.8790476, -1.06121, 3.753222, 0.8352941, 0, 1, 1,
0.8830544, 0.4102184, 1.325977, 0.8431373, 0, 1, 1,
0.8848478, 0.5108246, 0.5253286, 0.8470588, 0, 1, 1,
0.8879817, 0.0240301, 2.427641, 0.854902, 0, 1, 1,
0.8921452, -0.05534962, 3.197126, 0.8588235, 0, 1, 1,
0.897456, 0.933022, 0.5128796, 0.8666667, 0, 1, 1,
0.9013718, 0.0600873, 2.008158, 0.8705882, 0, 1, 1,
0.9016113, 1.501033, 0.3735032, 0.8784314, 0, 1, 1,
0.9061414, -0.2093576, 2.593365, 0.8823529, 0, 1, 1,
0.9088374, -0.1128303, 2.619893, 0.8901961, 0, 1, 1,
0.9097561, 0.07752752, 1.93785, 0.8941177, 0, 1, 1,
0.9112002, -1.906282, 2.151272, 0.9019608, 0, 1, 1,
0.9221474, -0.4310544, 2.838038, 0.9098039, 0, 1, 1,
0.9243583, -1.801575, 3.185774, 0.9137255, 0, 1, 1,
0.9282928, 0.6592414, -0.1296122, 0.9215686, 0, 1, 1,
0.9310775, 0.3441782, 0.1740074, 0.9254902, 0, 1, 1,
0.9311922, -0.8815435, 3.039312, 0.9333333, 0, 1, 1,
0.9324358, 0.8720441, 2.977386, 0.9372549, 0, 1, 1,
0.9389303, -0.08660127, 1.107206, 0.945098, 0, 1, 1,
0.9491377, -0.1265966, 0.489206, 0.9490196, 0, 1, 1,
0.9513727, -1.123607, 3.068342, 0.9568627, 0, 1, 1,
0.9517136, -0.05360873, 0.6188489, 0.9607843, 0, 1, 1,
0.9529603, 0.6715356, 1.689362, 0.9686275, 0, 1, 1,
0.9543231, 0.887054, 1.496535, 0.972549, 0, 1, 1,
0.9550794, -1.829182, 3.197937, 0.9803922, 0, 1, 1,
0.963569, -0.3815209, 2.679487, 0.9843137, 0, 1, 1,
0.9656212, -1.966449, 2.692028, 0.9921569, 0, 1, 1,
0.9662517, -0.8557608, 2.845781, 0.9960784, 0, 1, 1,
0.9695793, 1.080154, 0.6341523, 1, 0, 0.9960784, 1,
0.9749217, -0.7851518, 1.524449, 1, 0, 0.9882353, 1,
0.9832848, 1.83969, -0.4582109, 1, 0, 0.9843137, 1,
0.983357, 0.7484968, 1.539391, 1, 0, 0.9764706, 1,
1.017554, 1.632258, 1.295011, 1, 0, 0.972549, 1,
1.02362, -1.335918, 3.7275, 1, 0, 0.9647059, 1,
1.033046, 1.099628, 0.0824036, 1, 0, 0.9607843, 1,
1.042425, -1.137337, 2.173099, 1, 0, 0.9529412, 1,
1.048067, 0.2405255, 1.03064, 1, 0, 0.9490196, 1,
1.053891, 0.9960342, 1.821318, 1, 0, 0.9411765, 1,
1.059124, -0.2902272, 2.237121, 1, 0, 0.9372549, 1,
1.063189, 0.8040292, 0.05116514, 1, 0, 0.9294118, 1,
1.071973, 0.3283389, 1.88646, 1, 0, 0.9254902, 1,
1.075179, 1.662262, 3.166109, 1, 0, 0.9176471, 1,
1.078686, 0.9196779, 3.035169, 1, 0, 0.9137255, 1,
1.08396, -0.291006, 1.863701, 1, 0, 0.9058824, 1,
1.089913, 0.3368768, 0.9573898, 1, 0, 0.9019608, 1,
1.093211, -1.019479, 2.245073, 1, 0, 0.8941177, 1,
1.095008, 0.6824736, 1.53249, 1, 0, 0.8862745, 1,
1.097572, 0.7128083, 0.06768886, 1, 0, 0.8823529, 1,
1.09994, -0.502429, 1.711903, 1, 0, 0.8745098, 1,
1.102781, -1.50091, 3.692532, 1, 0, 0.8705882, 1,
1.113183, 1.707372, 2.299815, 1, 0, 0.8627451, 1,
1.115505, -0.004759622, 1.495251, 1, 0, 0.8588235, 1,
1.119194, -0.09111361, 2.668045, 1, 0, 0.8509804, 1,
1.120117, 0.5071385, 1.528083, 1, 0, 0.8470588, 1,
1.123971, -1.056834, 2.131211, 1, 0, 0.8392157, 1,
1.128205, -2.031705, 1.952429, 1, 0, 0.8352941, 1,
1.12908, 0.7408371, 0.2683851, 1, 0, 0.827451, 1,
1.13516, -0.9566045, 1.762373, 1, 0, 0.8235294, 1,
1.136197, 0.3329394, 2.070245, 1, 0, 0.8156863, 1,
1.140049, -0.5495974, 1.77708, 1, 0, 0.8117647, 1,
1.150552, 1.030885, 0.983766, 1, 0, 0.8039216, 1,
1.151471, -0.3193161, 1.32986, 1, 0, 0.7960784, 1,
1.153772, -0.5933787, 1.537351, 1, 0, 0.7921569, 1,
1.155063, -1.044693, 1.957602, 1, 0, 0.7843137, 1,
1.158181, 0.902132, -0.0353833, 1, 0, 0.7803922, 1,
1.158674, -0.7716776, 0.9689512, 1, 0, 0.772549, 1,
1.160158, -1.234161, 3.242306, 1, 0, 0.7686275, 1,
1.162008, 0.8112881, 0.5622327, 1, 0, 0.7607843, 1,
1.166133, 0.8106632, 2.507354, 1, 0, 0.7568628, 1,
1.168273, 0.1477751, 3.443915, 1, 0, 0.7490196, 1,
1.168546, 1.316379, 0.05666532, 1, 0, 0.7450981, 1,
1.170194, 1.004417, -0.5069375, 1, 0, 0.7372549, 1,
1.17141, 0.04257749, 3.188672, 1, 0, 0.7333333, 1,
1.173869, 0.268338, 1.159634, 1, 0, 0.7254902, 1,
1.176436, 0.934654, 1.766453, 1, 0, 0.7215686, 1,
1.176994, -1.066259, 2.983114, 1, 0, 0.7137255, 1,
1.186363, -0.5256414, 1.908267, 1, 0, 0.7098039, 1,
1.188736, 1.29707, -0.1333666, 1, 0, 0.7019608, 1,
1.204614, 1.926277, 0.8566647, 1, 0, 0.6941177, 1,
1.204743, 0.283553, 2.435937, 1, 0, 0.6901961, 1,
1.205688, 0.7000986, 2.202102, 1, 0, 0.682353, 1,
1.210559, 2.159265, -0.9837808, 1, 0, 0.6784314, 1,
1.220502, -1.534123, 1.563149, 1, 0, 0.6705883, 1,
1.241247, 0.1930096, 0.008856514, 1, 0, 0.6666667, 1,
1.245906, -0.1963865, 1.877673, 1, 0, 0.6588235, 1,
1.249733, 1.76036, 0.9527055, 1, 0, 0.654902, 1,
1.252105, -0.3217806, 0.9042601, 1, 0, 0.6470588, 1,
1.259855, -0.6242931, 1.469263, 1, 0, 0.6431373, 1,
1.279946, 0.221582, 1.022233, 1, 0, 0.6352941, 1,
1.282668, -0.8474679, 3.003256, 1, 0, 0.6313726, 1,
1.282931, -0.4618142, 1.697106, 1, 0, 0.6235294, 1,
1.29016, 0.8275557, -0.3583115, 1, 0, 0.6196079, 1,
1.294817, -1.111989, 1.717142, 1, 0, 0.6117647, 1,
1.295537, -0.1491901, 2.398664, 1, 0, 0.6078432, 1,
1.295845, -1.753624, 3.011477, 1, 0, 0.6, 1,
1.301934, -0.755392, 2.813034, 1, 0, 0.5921569, 1,
1.312571, -2.488748, 2.100739, 1, 0, 0.5882353, 1,
1.323909, 0.6875736, -0.0856944, 1, 0, 0.5803922, 1,
1.32818, 0.4676204, 2.608826, 1, 0, 0.5764706, 1,
1.331696, 1.44299, 0.4054959, 1, 0, 0.5686275, 1,
1.333985, 0.4905879, 1.219628, 1, 0, 0.5647059, 1,
1.38038, -1.52101, 2.252503, 1, 0, 0.5568628, 1,
1.38707, 0.01114132, 2.212765, 1, 0, 0.5529412, 1,
1.389231, -0.5198877, 1.597879, 1, 0, 0.5450981, 1,
1.394224, -1.491745, 2.744483, 1, 0, 0.5411765, 1,
1.403297, 1.577808, -0.3885864, 1, 0, 0.5333334, 1,
1.40379, -1.508022, 2.577546, 1, 0, 0.5294118, 1,
1.407884, 1.061625, 0.3092754, 1, 0, 0.5215687, 1,
1.409775, 1.666738, 0.2015257, 1, 0, 0.5176471, 1,
1.416093, 0.5900403, 3.184074, 1, 0, 0.509804, 1,
1.442633, -0.4805589, 2.907139, 1, 0, 0.5058824, 1,
1.445045, -1.373385, 3.305371, 1, 0, 0.4980392, 1,
1.453257, 0.0053199, 0.3819124, 1, 0, 0.4901961, 1,
1.457036, 0.5402318, 1.678225, 1, 0, 0.4862745, 1,
1.467047, -0.7582435, 2.168658, 1, 0, 0.4784314, 1,
1.479804, -0.1208911, 1.480963, 1, 0, 0.4745098, 1,
1.484096, 0.8025582, 1.179929, 1, 0, 0.4666667, 1,
1.484594, -0.3428934, 3.36967, 1, 0, 0.4627451, 1,
1.488042, -0.3411651, 1.633349, 1, 0, 0.454902, 1,
1.493086, -0.0008824118, 0.9478785, 1, 0, 0.4509804, 1,
1.514903, -0.4197522, 2.727808, 1, 0, 0.4431373, 1,
1.515011, -0.5992997, 3.185298, 1, 0, 0.4392157, 1,
1.51832, 0.91189, 0.4243398, 1, 0, 0.4313726, 1,
1.525015, 0.1475163, 3.34549, 1, 0, 0.427451, 1,
1.527955, 1.307973, 0.230645, 1, 0, 0.4196078, 1,
1.533348, 0.3006835, 3.288927, 1, 0, 0.4156863, 1,
1.542525, 0.2853611, 1.071418, 1, 0, 0.4078431, 1,
1.547945, 0.5391616, 2.620499, 1, 0, 0.4039216, 1,
1.549504, -0.3508377, 2.761957, 1, 0, 0.3960784, 1,
1.560967, 0.5306953, 0.909844, 1, 0, 0.3882353, 1,
1.563528, 0.8341431, 0.4202037, 1, 0, 0.3843137, 1,
1.566505, 0.7569414, -1.229862, 1, 0, 0.3764706, 1,
1.578658, 1.148527, 0.1373292, 1, 0, 0.372549, 1,
1.590468, 1.382803, 0.8413934, 1, 0, 0.3647059, 1,
1.594558, 1.023696, 0.8607844, 1, 0, 0.3607843, 1,
1.622391, 0.06636491, 3.746679, 1, 0, 0.3529412, 1,
1.623831, -0.735271, 3.697963, 1, 0, 0.3490196, 1,
1.633459, 1.531516, 1.135226, 1, 0, 0.3411765, 1,
1.648852, -0.7846752, 3.431352, 1, 0, 0.3372549, 1,
1.654998, -1.195601, 3.546075, 1, 0, 0.3294118, 1,
1.67627, 0.224287, 0.998561, 1, 0, 0.3254902, 1,
1.697034, -0.1405662, 3.054175, 1, 0, 0.3176471, 1,
1.709074, -1.646238, 3.199929, 1, 0, 0.3137255, 1,
1.710506, 0.6369411, -0.551788, 1, 0, 0.3058824, 1,
1.713325, 0.3311511, 1.424743, 1, 0, 0.2980392, 1,
1.73019, -2.070628, 2.200186, 1, 0, 0.2941177, 1,
1.733615, -0.2908551, 1.428774, 1, 0, 0.2862745, 1,
1.769699, -0.8527387, 1.322025, 1, 0, 0.282353, 1,
1.779205, -1.158876, 5.766737, 1, 0, 0.2745098, 1,
1.788567, 0.5749403, -0.5728379, 1, 0, 0.2705882, 1,
1.795926, 1.160856, 2.433003, 1, 0, 0.2627451, 1,
1.797526, 2.161196, 0.8348209, 1, 0, 0.2588235, 1,
1.827394, -1.311018, 2.012041, 1, 0, 0.2509804, 1,
1.845435, 0.9946024, 0.7783858, 1, 0, 0.2470588, 1,
1.859536, -0.3081823, 3.044387, 1, 0, 0.2392157, 1,
1.866027, 1.579593, -1.23595, 1, 0, 0.2352941, 1,
1.878343, -0.4318585, 0.02770601, 1, 0, 0.227451, 1,
1.990128, 0.2257684, 1.808508, 1, 0, 0.2235294, 1,
2.04154, 2.331732, 1.167425, 1, 0, 0.2156863, 1,
2.044765, -1.65001, 0.3505032, 1, 0, 0.2117647, 1,
2.108843, -0.5058303, 2.712441, 1, 0, 0.2039216, 1,
2.118077, 0.6102493, 1.547345, 1, 0, 0.1960784, 1,
2.12097, 0.3208727, 1.440085, 1, 0, 0.1921569, 1,
2.150632, -0.8240249, 1.185192, 1, 0, 0.1843137, 1,
2.182786, 0.1922824, 0.3036016, 1, 0, 0.1803922, 1,
2.186031, -0.808907, 0.7371228, 1, 0, 0.172549, 1,
2.186913, 0.1808749, 1.478339, 1, 0, 0.1686275, 1,
2.187891, -1.90152, 0.1314315, 1, 0, 0.1607843, 1,
2.190662, -0.6842735, 1.713955, 1, 0, 0.1568628, 1,
2.194167, 0.6112192, 1.669939, 1, 0, 0.1490196, 1,
2.195094, 1.009161, 2.199853, 1, 0, 0.145098, 1,
2.196128, -2.277558, 4.756577, 1, 0, 0.1372549, 1,
2.207346, 0.1946983, 2.637119, 1, 0, 0.1333333, 1,
2.211326, -1.465073, 1.927767, 1, 0, 0.1254902, 1,
2.243362, -0.1526827, 0.9039913, 1, 0, 0.1215686, 1,
2.24627, 0.2159634, 1.118116, 1, 0, 0.1137255, 1,
2.272223, -0.9003044, 1.211449, 1, 0, 0.1098039, 1,
2.291677, -0.8869677, 1.870354, 1, 0, 0.1019608, 1,
2.307739, -0.1570012, 1.050593, 1, 0, 0.09411765, 1,
2.308364, -1.465594, 1.765714, 1, 0, 0.09019608, 1,
2.352705, -0.4423015, 2.70867, 1, 0, 0.08235294, 1,
2.364139, -0.6574362, 2.863799, 1, 0, 0.07843138, 1,
2.405222, -0.8757874, 1.483265, 1, 0, 0.07058824, 1,
2.417373, -0.6993715, 2.491833, 1, 0, 0.06666667, 1,
2.421659, 0.4300894, 1.172892, 1, 0, 0.05882353, 1,
2.44502, -0.1122731, 0.6064075, 1, 0, 0.05490196, 1,
2.46858, -1.533109, 2.816389, 1, 0, 0.04705882, 1,
2.504285, -0.6054618, 1.015101, 1, 0, 0.04313726, 1,
2.839309, -0.965253, 2.727147, 1, 0, 0.03529412, 1,
2.847882, 0.5592671, 2.740524, 1, 0, 0.03137255, 1,
2.869775, 0.1244365, 0.6135837, 1, 0, 0.02352941, 1,
2.939052, -1.343392, 2.014817, 1, 0, 0.01960784, 1,
2.949562, 0.4777545, 1.077081, 1, 0, 0.01176471, 1,
3.048793, 0.2997622, -0.2256515, 1, 0, 0.007843138, 1
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
0.2218925, -3.47631, -8.224751, 0, -0.5, 0.5, 0.5,
0.2218925, -3.47631, -8.224751, 1, -0.5, 0.5, 0.5,
0.2218925, -3.47631, -8.224751, 1, 1.5, 0.5, 0.5,
0.2218925, -3.47631, -8.224751, 0, 1.5, 0.5, 0.5
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
-3.563327, 0.09656072, -8.224751, 0, -0.5, 0.5, 0.5,
-3.563327, 0.09656072, -8.224751, 1, -0.5, 0.5, 0.5,
-3.563327, 0.09656072, -8.224751, 1, 1.5, 0.5, 0.5,
-3.563327, 0.09656072, -8.224751, 0, 1.5, 0.5, 0.5
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
-3.563327, -3.47631, -0.2150881, 0, -0.5, 0.5, 0.5,
-3.563327, -3.47631, -0.2150881, 1, -0.5, 0.5, 0.5,
-3.563327, -3.47631, -0.2150881, 1, 1.5, 0.5, 0.5,
-3.563327, -3.47631, -0.2150881, 0, 1.5, 0.5, 0.5
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
-2, -2.651801, -6.376368,
3, -2.651801, -6.376368,
-2, -2.651801, -6.376368,
-2, -2.78922, -6.684432,
-1, -2.651801, -6.376368,
-1, -2.78922, -6.684432,
0, -2.651801, -6.376368,
0, -2.78922, -6.684432,
1, -2.651801, -6.376368,
1, -2.78922, -6.684432,
2, -2.651801, -6.376368,
2, -2.78922, -6.684432,
3, -2.651801, -6.376368,
3, -2.78922, -6.684432
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
-2, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
-2, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
-2, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
-2, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5,
-1, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
-1, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
-1, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
-1, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5,
0, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
0, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
0, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
0, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5,
1, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
1, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
1, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
1, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5,
2, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
2, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
2, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
2, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5,
3, -3.064056, -7.30056, 0, -0.5, 0.5, 0.5,
3, -3.064056, -7.30056, 1, -0.5, 0.5, 0.5,
3, -3.064056, -7.30056, 1, 1.5, 0.5, 0.5,
3, -3.064056, -7.30056, 0, 1.5, 0.5, 0.5
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
-2.689815, -2, -6.376368,
-2.689815, 2, -6.376368,
-2.689815, -2, -6.376368,
-2.8354, -2, -6.684432,
-2.689815, -1, -6.376368,
-2.8354, -1, -6.684432,
-2.689815, 0, -6.376368,
-2.8354, 0, -6.684432,
-2.689815, 1, -6.376368,
-2.8354, 1, -6.684432,
-2.689815, 2, -6.376368,
-2.8354, 2, -6.684432
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
-3.126571, -2, -7.30056, 0, -0.5, 0.5, 0.5,
-3.126571, -2, -7.30056, 1, -0.5, 0.5, 0.5,
-3.126571, -2, -7.30056, 1, 1.5, 0.5, 0.5,
-3.126571, -2, -7.30056, 0, 1.5, 0.5, 0.5,
-3.126571, -1, -7.30056, 0, -0.5, 0.5, 0.5,
-3.126571, -1, -7.30056, 1, -0.5, 0.5, 0.5,
-3.126571, -1, -7.30056, 1, 1.5, 0.5, 0.5,
-3.126571, -1, -7.30056, 0, 1.5, 0.5, 0.5,
-3.126571, 0, -7.30056, 0, -0.5, 0.5, 0.5,
-3.126571, 0, -7.30056, 1, -0.5, 0.5, 0.5,
-3.126571, 0, -7.30056, 1, 1.5, 0.5, 0.5,
-3.126571, 0, -7.30056, 0, 1.5, 0.5, 0.5,
-3.126571, 1, -7.30056, 0, -0.5, 0.5, 0.5,
-3.126571, 1, -7.30056, 1, -0.5, 0.5, 0.5,
-3.126571, 1, -7.30056, 1, 1.5, 0.5, 0.5,
-3.126571, 1, -7.30056, 0, 1.5, 0.5, 0.5,
-3.126571, 2, -7.30056, 0, -0.5, 0.5, 0.5,
-3.126571, 2, -7.30056, 1, -0.5, 0.5, 0.5,
-3.126571, 2, -7.30056, 1, 1.5, 0.5, 0.5,
-3.126571, 2, -7.30056, 0, 1.5, 0.5, 0.5
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
-2.689815, -2.651801, -6,
-2.689815, -2.651801, 4,
-2.689815, -2.651801, -6,
-2.8354, -2.78922, -6,
-2.689815, -2.651801, -4,
-2.8354, -2.78922, -4,
-2.689815, -2.651801, -2,
-2.8354, -2.78922, -2,
-2.689815, -2.651801, 0,
-2.8354, -2.78922, 0,
-2.689815, -2.651801, 2,
-2.8354, -2.78922, 2,
-2.689815, -2.651801, 4,
-2.8354, -2.78922, 4
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
-3.126571, -3.064056, -6, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -6, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -6, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, -6, 0, 1.5, 0.5, 0.5,
-3.126571, -3.064056, -4, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -4, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -4, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, -4, 0, 1.5, 0.5, 0.5,
-3.126571, -3.064056, -2, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -2, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, -2, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, -2, 0, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 0, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 0, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 0, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 0, 0, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 2, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 2, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 2, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 2, 0, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 4, 0, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 4, 1, -0.5, 0.5, 0.5,
-3.126571, -3.064056, 4, 1, 1.5, 0.5, 0.5,
-3.126571, -3.064056, 4, 0, 1.5, 0.5, 0.5
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
-2.689815, -2.651801, -6.376368,
-2.689815, 2.844923, -6.376368,
-2.689815, -2.651801, 5.946191,
-2.689815, 2.844923, 5.946191,
-2.689815, -2.651801, -6.376368,
-2.689815, -2.651801, 5.946191,
-2.689815, 2.844923, -6.376368,
-2.689815, 2.844923, 5.946191,
-2.689815, -2.651801, -6.376368,
3.1336, -2.651801, -6.376368,
-2.689815, -2.651801, 5.946191,
3.1336, -2.651801, 5.946191,
-2.689815, 2.844923, -6.376368,
3.1336, 2.844923, -6.376368,
-2.689815, 2.844923, 5.946191,
3.1336, 2.844923, 5.946191,
3.1336, -2.651801, -6.376368,
3.1336, 2.844923, -6.376368,
3.1336, -2.651801, 5.946191,
3.1336, 2.844923, 5.946191,
3.1336, -2.651801, -6.376368,
3.1336, -2.651801, 5.946191,
3.1336, 2.844923, -6.376368,
3.1336, 2.844923, 5.946191
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
var radius = 7.847364;
var distance = 34.91381;
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
mvMatrix.translate( -0.2218925, -0.09656072, 0.2150881 );
mvMatrix.scale( 1.457001, 1.543596, 0.6885521 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91381);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Carbophos<-read.table("Carbophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.605008, -0.2218193, -1.478656, 0, 0, 1, 1, 1,
-2.547051, -0.2875834, -3.26687, 1, 0, 0, 1, 1,
-2.472299, 0.5521903, -0.539418, 1, 0, 0, 1, 1,
-2.41063, 0.3668291, -0.7441715, 1, 0, 0, 1, 1,
-2.351815, -1.928212, -0.947249, 1, 0, 0, 1, 1,
-2.285857, -0.3500937, -1.902301, 1, 0, 0, 1, 1,
-2.11615, 2.508914, 0.9829713, 0, 0, 0, 1, 1,
-2.101906, 1.895063, -1.74674, 0, 0, 0, 1, 1,
-2.100576, 0.8275954, -2.093346, 0, 0, 0, 1, 1,
-2.080224, 0.54552, -0.8464966, 0, 0, 0, 1, 1,
-1.976718, -0.6624914, -1.033904, 0, 0, 0, 1, 1,
-1.973578, -0.541549, -3.269354, 0, 0, 0, 1, 1,
-1.933377, -0.8583336, -1.474422, 0, 0, 0, 1, 1,
-1.928201, -1.657727, -2.831898, 1, 1, 1, 1, 1,
-1.912143, 0.3437165, -2.362119, 1, 1, 1, 1, 1,
-1.895636, -0.131862, -2.20493, 1, 1, 1, 1, 1,
-1.886972, -0.6248212, -2.788258, 1, 1, 1, 1, 1,
-1.87338, 1.063106, -2.834805, 1, 1, 1, 1, 1,
-1.864759, 0.500697, -1.07384, 1, 1, 1, 1, 1,
-1.855508, 0.2027646, -3.19561, 1, 1, 1, 1, 1,
-1.848521, -0.2218217, -0.2358493, 1, 1, 1, 1, 1,
-1.832183, 1.153519, -1.086922, 1, 1, 1, 1, 1,
-1.828378, -0.1927965, -2.045594, 1, 1, 1, 1, 1,
-1.815747, 1.426178, -0.8873348, 1, 1, 1, 1, 1,
-1.8142, -0.3609332, -1.533899, 1, 1, 1, 1, 1,
-1.812325, 0.6260166, -1.943302, 1, 1, 1, 1, 1,
-1.805813, -0.08998742, -3.05145, 1, 1, 1, 1, 1,
-1.794582, 1.728478, -1.84276, 1, 1, 1, 1, 1,
-1.792574, 1.270236, -1.825669, 0, 0, 1, 1, 1,
-1.780505, 1.362555, 0.7605537, 1, 0, 0, 1, 1,
-1.774293, 0.4571166, -0.441714, 1, 0, 0, 1, 1,
-1.770965, -0.4943553, -3.227059, 1, 0, 0, 1, 1,
-1.75165, 0.8468574, -2.307531, 1, 0, 0, 1, 1,
-1.744911, 0.5609483, -1.291044, 1, 0, 0, 1, 1,
-1.734998, -0.9291322, -1.501548, 0, 0, 0, 1, 1,
-1.724778, 0.4191856, -0.6189244, 0, 0, 0, 1, 1,
-1.704429, -0.04644312, -2.252867, 0, 0, 0, 1, 1,
-1.697448, 0.03253319, -1.079257, 0, 0, 0, 1, 1,
-1.672337, 0.5301786, -1.641346, 0, 0, 0, 1, 1,
-1.64838, 0.2208545, -0.3648329, 0, 0, 0, 1, 1,
-1.644342, 0.7266528, -0.6709286, 0, 0, 0, 1, 1,
-1.638945, -0.3005192, -1.611221, 1, 1, 1, 1, 1,
-1.625222, 0.7154965, -0.3015465, 1, 1, 1, 1, 1,
-1.609788, 0.3162387, -1.904837, 1, 1, 1, 1, 1,
-1.59625, -0.2400882, -0.9001055, 1, 1, 1, 1, 1,
-1.595084, -0.6007074, -3.919428, 1, 1, 1, 1, 1,
-1.584132, 2.131652, -1.344266, 1, 1, 1, 1, 1,
-1.575446, -0.08294682, -1.626243, 1, 1, 1, 1, 1,
-1.572204, 0.595935, -1.477452, 1, 1, 1, 1, 1,
-1.572044, -0.569258, -1.833549, 1, 1, 1, 1, 1,
-1.570032, 0.5008504, -0.2955942, 1, 1, 1, 1, 1,
-1.562307, 1.005985, -0.8865691, 1, 1, 1, 1, 1,
-1.560288, 0.951456, -2.176647, 1, 1, 1, 1, 1,
-1.557309, -0.3811815, -0.334737, 1, 1, 1, 1, 1,
-1.553838, -0.3319218, -2.285216, 1, 1, 1, 1, 1,
-1.548172, 0.2311901, 0.2588797, 1, 1, 1, 1, 1,
-1.535969, -0.3134772, -1.446606, 0, 0, 1, 1, 1,
-1.532729, -0.1470795, -2.221728, 1, 0, 0, 1, 1,
-1.510193, 0.1623653, -1.06209, 1, 0, 0, 1, 1,
-1.504972, 0.1275845, -2.574379, 1, 0, 0, 1, 1,
-1.487494, 0.5404645, -0.0003672255, 1, 0, 0, 1, 1,
-1.476258, -0.5477657, -0.869632, 1, 0, 0, 1, 1,
-1.46447, -0.02727545, -2.464942, 0, 0, 0, 1, 1,
-1.46331, -1.119275, -0.9245699, 0, 0, 0, 1, 1,
-1.458639, -1.411484, -5.009573, 0, 0, 0, 1, 1,
-1.457126, 0.6177148, -0.4516804, 0, 0, 0, 1, 1,
-1.455351, -0.9196388, -2.777061, 0, 0, 0, 1, 1,
-1.448579, -0.04763321, -3.189167, 0, 0, 0, 1, 1,
-1.429008, -0.002375898, -1.858341, 0, 0, 0, 1, 1,
-1.424767, 1.467989, -1.157102, 1, 1, 1, 1, 1,
-1.421435, 2.242132, -0.59541, 1, 1, 1, 1, 1,
-1.416939, 0.9033027, -0.7680955, 1, 1, 1, 1, 1,
-1.415257, 0.3637247, 0.7122452, 1, 1, 1, 1, 1,
-1.41048, -1.598547, -2.443342, 1, 1, 1, 1, 1,
-1.408899, -1.659583, -0.4580443, 1, 1, 1, 1, 1,
-1.387524, 1.384349, -0.3393205, 1, 1, 1, 1, 1,
-1.384259, -0.2518033, -2.041486, 1, 1, 1, 1, 1,
-1.380975, 0.8310919, -0.8784707, 1, 1, 1, 1, 1,
-1.368571, -0.3982628, -1.306073, 1, 1, 1, 1, 1,
-1.35909, -0.2188116, -1.468418, 1, 1, 1, 1, 1,
-1.356946, -1.246913, -2.296917, 1, 1, 1, 1, 1,
-1.356825, 0.0177715, -0.3811767, 1, 1, 1, 1, 1,
-1.352218, 0.5390494, -1.447408, 1, 1, 1, 1, 1,
-1.347727, 0.2466134, -1.360396, 1, 1, 1, 1, 1,
-1.34587, -1.933646, -3.931329, 0, 0, 1, 1, 1,
-1.34199, -0.719164, -1.575485, 1, 0, 0, 1, 1,
-1.341535, -1.752009, -3.493086, 1, 0, 0, 1, 1,
-1.339364, -0.7182848, -2.673992, 1, 0, 0, 1, 1,
-1.332989, -0.3020057, -0.06932459, 1, 0, 0, 1, 1,
-1.321355, -0.1236473, -1.705878, 1, 0, 0, 1, 1,
-1.321165, -0.1864996, -2.502177, 0, 0, 0, 1, 1,
-1.319384, -0.6565511, -3.524091, 0, 0, 0, 1, 1,
-1.319098, 0.8947129, -1.680937, 0, 0, 0, 1, 1,
-1.318032, 0.07661462, -0.2378972, 0, 0, 0, 1, 1,
-1.317683, -0.6193109, -1.319267, 0, 0, 0, 1, 1,
-1.317295, 0.7033295, -0.9843105, 0, 0, 0, 1, 1,
-1.314923, -1.348587, -2.520695, 0, 0, 0, 1, 1,
-1.298823, 0.4307811, -0.3545417, 1, 1, 1, 1, 1,
-1.28512, 0.1775348, -0.6663509, 1, 1, 1, 1, 1,
-1.276899, -1.130418, -3.273479, 1, 1, 1, 1, 1,
-1.275007, -1.652264, -3.601386, 1, 1, 1, 1, 1,
-1.268402, 1.073196, -1.775445, 1, 1, 1, 1, 1,
-1.266099, 0.2085701, -0.08988798, 1, 1, 1, 1, 1,
-1.26138, 0.7674518, -0.75215, 1, 1, 1, 1, 1,
-1.249342, 1.94505, -0.7684447, 1, 1, 1, 1, 1,
-1.241758, 1.258373, -0.6886748, 1, 1, 1, 1, 1,
-1.229389, -0.8871306, -2.046832, 1, 1, 1, 1, 1,
-1.221944, 0.6379712, -1.161154, 1, 1, 1, 1, 1,
-1.218703, 0.5446064, -0.9462208, 1, 1, 1, 1, 1,
-1.210874, -0.369835, -1.427292, 1, 1, 1, 1, 1,
-1.197735, -0.3170894, -2.565825, 1, 1, 1, 1, 1,
-1.19761, -0.4243204, -1.460759, 1, 1, 1, 1, 1,
-1.197081, -1.084438, -1.802092, 0, 0, 1, 1, 1,
-1.193007, -0.3796931, -1.354642, 1, 0, 0, 1, 1,
-1.191169, -0.07740759, -1.072431, 1, 0, 0, 1, 1,
-1.187937, 0.2565731, -1.270007, 1, 0, 0, 1, 1,
-1.180041, -0.5939031, -1.283994, 1, 0, 0, 1, 1,
-1.179901, -0.927456, -2.194815, 1, 0, 0, 1, 1,
-1.177929, -1.245632, -1.959352, 0, 0, 0, 1, 1,
-1.168674, -0.7535735, -3.811373, 0, 0, 0, 1, 1,
-1.160302, 0.5890673, -0.3717272, 0, 0, 0, 1, 1,
-1.15768, 1.849845, 0.1475998, 0, 0, 0, 1, 1,
-1.155406, -1.51306, -3.793975, 0, 0, 0, 1, 1,
-1.153651, -0.7236768, -4.371366, 0, 0, 0, 1, 1,
-1.149564, -1.237433, -1.30967, 0, 0, 0, 1, 1,
-1.145504, -0.548746, -0.6449406, 1, 1, 1, 1, 1,
-1.143073, -0.9381922, -2.919331, 1, 1, 1, 1, 1,
-1.1333, -0.4342874, -1.931866, 1, 1, 1, 1, 1,
-1.127097, -0.1533179, -1.403452, 1, 1, 1, 1, 1,
-1.12192, 0.3912292, -3.194459, 1, 1, 1, 1, 1,
-1.121737, -0.5350775, -0.9292712, 1, 1, 1, 1, 1,
-1.1171, -0.1802423, -1.624312, 1, 1, 1, 1, 1,
-1.116462, 0.8385001, -1.992365, 1, 1, 1, 1, 1,
-1.113236, -1.600535, -2.992979, 1, 1, 1, 1, 1,
-1.102912, 0.1037382, -1.738998, 1, 1, 1, 1, 1,
-1.101822, -0.2627762, -3.008545, 1, 1, 1, 1, 1,
-1.101153, -0.02957657, -0.6114215, 1, 1, 1, 1, 1,
-1.088658, 1.22528, -1.17088, 1, 1, 1, 1, 1,
-1.061822, -0.6202392, -0.8944985, 1, 1, 1, 1, 1,
-1.056844, -1.124056, -3.626107, 1, 1, 1, 1, 1,
-1.028741, 1.455569, -0.7444186, 0, 0, 1, 1, 1,
-1.02465, -0.4221177, -1.672929, 1, 0, 0, 1, 1,
-1.01719, 0.2713834, -1.451374, 1, 0, 0, 1, 1,
-1.0131, 0.2937309, -0.7406132, 1, 0, 0, 1, 1,
-1.00761, 1.689229, -1.600541, 1, 0, 0, 1, 1,
-1.007251, -0.05128656, -0.9494193, 1, 0, 0, 1, 1,
-1.006896, -1.202545, -4.30038, 0, 0, 0, 1, 1,
-1.004644, -0.200192, -0.1453177, 0, 0, 0, 1, 1,
-0.9950992, 0.6619702, -1.64715, 0, 0, 0, 1, 1,
-0.9918333, 0.3702611, -2.379397, 0, 0, 0, 1, 1,
-0.9911843, 0.3429816, -1.812979, 0, 0, 0, 1, 1,
-0.9911532, 0.5561306, -1.62957, 0, 0, 0, 1, 1,
-0.9901406, -0.9875241, -2.054538, 0, 0, 0, 1, 1,
-0.9901006, 0.9764348, 0.1871895, 1, 1, 1, 1, 1,
-0.9871588, -1.728086, -3.8613, 1, 1, 1, 1, 1,
-0.9810148, -1.491555, -2.640305, 1, 1, 1, 1, 1,
-0.9759947, 1.673036, 1.078998, 1, 1, 1, 1, 1,
-0.9753172, 0.2180953, -1.867203, 1, 1, 1, 1, 1,
-0.9673499, -0.00930068, -1.640373, 1, 1, 1, 1, 1,
-0.9595366, -0.6234027, -1.153062, 1, 1, 1, 1, 1,
-0.954809, 0.3334545, -1.469586, 1, 1, 1, 1, 1,
-0.9514235, -2.018202, -2.091522, 1, 1, 1, 1, 1,
-0.9488857, -0.1307251, 0.9614909, 1, 1, 1, 1, 1,
-0.9439294, -0.206322, -3.082712, 1, 1, 1, 1, 1,
-0.9425493, -0.09760179, -2.397042, 1, 1, 1, 1, 1,
-0.9291579, 0.6140121, 0.1997218, 1, 1, 1, 1, 1,
-0.9252144, 1.282362, -2.618991, 1, 1, 1, 1, 1,
-0.9205446, -0.8398948, -1.284429, 1, 1, 1, 1, 1,
-0.9127814, -0.7779192, -3.166086, 0, 0, 1, 1, 1,
-0.9119254, 0.008037925, -2.195666, 1, 0, 0, 1, 1,
-0.9119198, -0.9737088, -1.738309, 1, 0, 0, 1, 1,
-0.9112474, -0.02874649, -1.667081, 1, 0, 0, 1, 1,
-0.907523, 0.06810283, 0.1037608, 1, 0, 0, 1, 1,
-0.9039381, 0.5597438, -3.022823, 1, 0, 0, 1, 1,
-0.9005502, -0.5088369, -1.845298, 0, 0, 0, 1, 1,
-0.8982628, 1.376525, -3.012925, 0, 0, 0, 1, 1,
-0.8973342, 0.2665602, -1.73268, 0, 0, 0, 1, 1,
-0.8956763, 0.9193702, 1.061839, 0, 0, 0, 1, 1,
-0.8953068, -1.118882, -1.660685, 0, 0, 0, 1, 1,
-0.8942083, 0.1140669, -0.380309, 0, 0, 0, 1, 1,
-0.8929765, 0.09592997, -3.184078, 0, 0, 0, 1, 1,
-0.8893548, -0.7308933, -1.212293, 1, 1, 1, 1, 1,
-0.8873901, -2.571752, -3.589847, 1, 1, 1, 1, 1,
-0.8825005, 1.050725, -1.68802, 1, 1, 1, 1, 1,
-0.8742887, -0.6653585, -2.652579, 1, 1, 1, 1, 1,
-0.8666278, -0.8014482, -0.5224131, 1, 1, 1, 1, 1,
-0.866152, -0.6587889, -2.489328, 1, 1, 1, 1, 1,
-0.8649364, -0.9154985, -1.262547, 1, 1, 1, 1, 1,
-0.8634944, 0.2162088, -2.15383, 1, 1, 1, 1, 1,
-0.8594768, -0.6102026, -0.4788827, 1, 1, 1, 1, 1,
-0.8592697, 1.009977, -0.3120868, 1, 1, 1, 1, 1,
-0.8584074, 0.352014, -2.144985, 1, 1, 1, 1, 1,
-0.8581253, 0.7389566, -1.998298, 1, 1, 1, 1, 1,
-0.8519692, -0.9790571, -1.474683, 1, 1, 1, 1, 1,
-0.8511817, -1.708662, -2.435237, 1, 1, 1, 1, 1,
-0.8460753, 0.3069603, -1.096857, 1, 1, 1, 1, 1,
-0.8304193, -0.5589412, -2.09977, 0, 0, 1, 1, 1,
-0.8296822, 0.1739359, -0.794817, 1, 0, 0, 1, 1,
-0.80563, 0.6493296, -0.9154747, 1, 0, 0, 1, 1,
-0.8042452, -1.064, -1.042809, 1, 0, 0, 1, 1,
-0.7958727, -0.2938324, -2.011068, 1, 0, 0, 1, 1,
-0.7955558, -0.7379756, -1.936009, 1, 0, 0, 1, 1,
-0.7949243, 0.8836631, -0.7471142, 0, 0, 0, 1, 1,
-0.7896612, 0.7377483, 0.4809888, 0, 0, 0, 1, 1,
-0.7894481, -0.3442685, -0.4038686, 0, 0, 0, 1, 1,
-0.7860194, 1.366642, -2.16059, 0, 0, 0, 1, 1,
-0.7838838, -0.775234, -1.676522, 0, 0, 0, 1, 1,
-0.7824612, -1.519804, -1.918002, 0, 0, 0, 1, 1,
-0.7820889, 0.7738273, 0.07653958, 0, 0, 0, 1, 1,
-0.777474, 0.06173077, -0.5122796, 1, 1, 1, 1, 1,
-0.7736126, 0.8653359, -0.9705073, 1, 1, 1, 1, 1,
-0.7720918, -0.1824188, -1.44115, 1, 1, 1, 1, 1,
-0.7719925, -0.8046011, -3.620479, 1, 1, 1, 1, 1,
-0.7702513, 1.918009, 0.1201293, 1, 1, 1, 1, 1,
-0.7693912, 0.2969026, -1.450396, 1, 1, 1, 1, 1,
-0.7673104, -1.654048, -2.747389, 1, 1, 1, 1, 1,
-0.7622145, -0.869527, -3.550743, 1, 1, 1, 1, 1,
-0.7616339, -1.399657, -1.653167, 1, 1, 1, 1, 1,
-0.7611483, -0.3899334, -1.229596, 1, 1, 1, 1, 1,
-0.7608332, -0.3757639, -2.080859, 1, 1, 1, 1, 1,
-0.7603317, -1.490875, -3.745406, 1, 1, 1, 1, 1,
-0.7600141, -1.816752, -2.619784, 1, 1, 1, 1, 1,
-0.7587448, 0.4001053, -2.003659, 1, 1, 1, 1, 1,
-0.7499186, -1.249819, -1.550401, 1, 1, 1, 1, 1,
-0.7495626, 1.993226, -0.8217459, 0, 0, 1, 1, 1,
-0.7487031, -0.9915927, 0.01290316, 1, 0, 0, 1, 1,
-0.7440907, -1.422952, -2.228496, 1, 0, 0, 1, 1,
-0.7393215, -0.3767358, -0.640098, 1, 0, 0, 1, 1,
-0.7390581, 1.730184, -0.1278631, 1, 0, 0, 1, 1,
-0.736003, -1.106037, -3.033416, 1, 0, 0, 1, 1,
-0.7344261, -0.4738066, -0.2994984, 0, 0, 0, 1, 1,
-0.7304814, -1.146279, -0.7715936, 0, 0, 0, 1, 1,
-0.7287929, 0.3564022, -1.643618, 0, 0, 0, 1, 1,
-0.7277873, -0.5510299, -1.689011, 0, 0, 0, 1, 1,
-0.7269397, -0.7791668, -1.113241, 0, 0, 0, 1, 1,
-0.7197127, 0.2992945, -0.8023083, 0, 0, 0, 1, 1,
-0.7147025, 0.3389643, -1.12642, 0, 0, 0, 1, 1,
-0.7106614, -0.8025016, -3.456003, 1, 1, 1, 1, 1,
-0.6975672, 0.9477536, 0.1022372, 1, 1, 1, 1, 1,
-0.6951153, 0.5910204, -1.569151, 1, 1, 1, 1, 1,
-0.6950016, -0.112472, -3.027559, 1, 1, 1, 1, 1,
-0.6906581, -0.004404347, -2.04005, 1, 1, 1, 1, 1,
-0.6870732, -2.110554, -2.535793, 1, 1, 1, 1, 1,
-0.6852288, 0.3468858, -0.4936645, 1, 1, 1, 1, 1,
-0.6834326, 0.8404639, -0.7476248, 1, 1, 1, 1, 1,
-0.680639, 0.2344012, 1.518847, 1, 1, 1, 1, 1,
-0.6806352, -1.161637, -2.521268, 1, 1, 1, 1, 1,
-0.6805508, -0.6597034, -2.571667, 1, 1, 1, 1, 1,
-0.6737933, 0.9501344, -1.017081, 1, 1, 1, 1, 1,
-0.6710691, 1.139345, -0.8723142, 1, 1, 1, 1, 1,
-0.6651095, -0.2934504, -1.95456, 1, 1, 1, 1, 1,
-0.6643226, -0.08318305, -0.3330975, 1, 1, 1, 1, 1,
-0.6641924, 0.3770956, -1.187172, 0, 0, 1, 1, 1,
-0.6624976, -0.7145902, -2.966305, 1, 0, 0, 1, 1,
-0.662443, 0.7813064, -1.023304, 1, 0, 0, 1, 1,
-0.6607475, 2.565143, 0.2631787, 1, 0, 0, 1, 1,
-0.6590084, 1.291764, -1.560864, 1, 0, 0, 1, 1,
-0.6534351, -1.421899, -3.121618, 1, 0, 0, 1, 1,
-0.6520593, 0.6614322, -1.566761, 0, 0, 0, 1, 1,
-0.6514167, -1.563179, -3.137471, 0, 0, 0, 1, 1,
-0.6403775, 0.5337709, -0.7238929, 0, 0, 0, 1, 1,
-0.6369669, -0.3219295, -1.643899, 0, 0, 0, 1, 1,
-0.6299008, 0.2025556, -1.084129, 0, 0, 0, 1, 1,
-0.6270161, 1.06998, 1.141407, 0, 0, 0, 1, 1,
-0.6189697, -0.4266164, -1.875539, 0, 0, 0, 1, 1,
-0.612417, 0.8236957, 0.1426879, 1, 1, 1, 1, 1,
-0.6111627, 0.2425053, -0.4165311, 1, 1, 1, 1, 1,
-0.6110043, -1.086613, -3.687114, 1, 1, 1, 1, 1,
-0.6094783, -2.400453, -3.656939, 1, 1, 1, 1, 1,
-0.605949, -1.480338, -2.490051, 1, 1, 1, 1, 1,
-0.5986942, -2.037338, -0.8484491, 1, 1, 1, 1, 1,
-0.597431, 1.026261, -1.068956, 1, 1, 1, 1, 1,
-0.5959381, 1.053895, 0.4541909, 1, 1, 1, 1, 1,
-0.5959143, -0.3336486, -2.854624, 1, 1, 1, 1, 1,
-0.5937783, -1.894453, -2.649006, 1, 1, 1, 1, 1,
-0.5934461, -0.6543645, -3.341738, 1, 1, 1, 1, 1,
-0.5926347, 0.3066924, -0.8089699, 1, 1, 1, 1, 1,
-0.5912518, -0.6325324, -2.36402, 1, 1, 1, 1, 1,
-0.5889941, -0.8185843, -1.946105, 1, 1, 1, 1, 1,
-0.5889739, -0.1775515, 0.6881904, 1, 1, 1, 1, 1,
-0.58855, -0.5965822, 0.7253463, 0, 0, 1, 1, 1,
-0.588058, -0.7388391, -2.940378, 1, 0, 0, 1, 1,
-0.5869328, 0.5764937, 0.5747791, 1, 0, 0, 1, 1,
-0.5857989, 0.2398576, -1.259405, 1, 0, 0, 1, 1,
-0.5817595, 0.5529999, -0.1330648, 1, 0, 0, 1, 1,
-0.5780907, 0.3233793, 0.07558358, 1, 0, 0, 1, 1,
-0.5780033, -1.261299, -2.529924, 0, 0, 0, 1, 1,
-0.5675494, 0.8425767, 0.0176978, 0, 0, 0, 1, 1,
-0.5635205, 0.5992336, -0.8593981, 0, 0, 0, 1, 1,
-0.5595011, -0.4479154, -2.904857, 0, 0, 0, 1, 1,
-0.5580918, 0.03908934, -0.2996559, 0, 0, 0, 1, 1,
-0.5537308, 1.619918, -0.5031134, 0, 0, 0, 1, 1,
-0.5535848, 1.401925, -1.140057, 0, 0, 0, 1, 1,
-0.5523784, -0.5950271, -4.287639, 1, 1, 1, 1, 1,
-0.5502617, -0.6152031, -1.672404, 1, 1, 1, 1, 1,
-0.536754, -0.03146249, -2.737079, 1, 1, 1, 1, 1,
-0.5327386, 1.33276, 0.8204722, 1, 1, 1, 1, 1,
-0.5312849, -0.2996653, -1.271878, 1, 1, 1, 1, 1,
-0.5308852, 1.038821, -0.01057507, 1, 1, 1, 1, 1,
-0.529689, -0.7235823, -2.832666, 1, 1, 1, 1, 1,
-0.5281519, 0.4588053, 0.159712, 1, 1, 1, 1, 1,
-0.5275329, -0.3559714, -2.461091, 1, 1, 1, 1, 1,
-0.5260838, 0.2846999, 0.5979751, 1, 1, 1, 1, 1,
-0.5233399, 0.2408342, 0.9798943, 1, 1, 1, 1, 1,
-0.5184603, 0.3256972, 0.9576958, 1, 1, 1, 1, 1,
-0.5182172, 0.6168916, -0.9766876, 1, 1, 1, 1, 1,
-0.5159511, 0.4414565, -1.667528, 1, 1, 1, 1, 1,
-0.5154505, -0.001590054, -0.6968486, 1, 1, 1, 1, 1,
-0.5081226, -1.092318, -3.336016, 0, 0, 1, 1, 1,
-0.5066615, 0.7490777, -0.9871039, 1, 0, 0, 1, 1,
-0.5061313, 0.1408378, -0.3843769, 1, 0, 0, 1, 1,
-0.5027019, 1.072368, 0.1319744, 1, 0, 0, 1, 1,
-0.5013817, -0.7768792, -3.924272, 1, 0, 0, 1, 1,
-0.5006064, 0.3476183, -0.664366, 1, 0, 0, 1, 1,
-0.49955, 0.04198779, -1.209547, 0, 0, 0, 1, 1,
-0.4982922, -0.5890808, -4.330529, 0, 0, 0, 1, 1,
-0.4981641, -0.4231281, -2.854759, 0, 0, 0, 1, 1,
-0.4956917, -1.769767, -2.229339, 0, 0, 0, 1, 1,
-0.4922227, 1.088208, -0.08490575, 0, 0, 0, 1, 1,
-0.491963, -0.3000181, -1.766889, 0, 0, 0, 1, 1,
-0.4899606, -0.2928382, -2.154176, 0, 0, 0, 1, 1,
-0.4899561, -1.122012, -4.639084, 1, 1, 1, 1, 1,
-0.4716709, 1.770927, 0.2528736, 1, 1, 1, 1, 1,
-0.4701209, -0.5601093, -0.05022577, 1, 1, 1, 1, 1,
-0.4671246, 0.8064371, -0.652142, 1, 1, 1, 1, 1,
-0.4637502, -0.2720276, -1.426688, 1, 1, 1, 1, 1,
-0.4608858, -1.141381, -5.208749, 1, 1, 1, 1, 1,
-0.4605029, -0.1483983, -1.503511, 1, 1, 1, 1, 1,
-0.450545, 2.760472, -0.392744, 1, 1, 1, 1, 1,
-0.4486347, -0.8527149, -1.531361, 1, 1, 1, 1, 1,
-0.4472927, 2.556614, 0.4612969, 1, 1, 1, 1, 1,
-0.4469722, 1.090338, 1.38485, 1, 1, 1, 1, 1,
-0.4457842, 0.3444376, -1.064131, 1, 1, 1, 1, 1,
-0.442971, -1.115338, -1.965454, 1, 1, 1, 1, 1,
-0.441843, 0.5409136, -1.120205, 1, 1, 1, 1, 1,
-0.4390701, 0.01375281, -1.683175, 1, 1, 1, 1, 1,
-0.4374765, -0.4338374, -3.904017, 0, 0, 1, 1, 1,
-0.4327241, -1.522183, -3.599765, 1, 0, 0, 1, 1,
-0.4207081, 1.038758, 0.5474327, 1, 0, 0, 1, 1,
-0.4206029, 0.360589, -0.8485792, 1, 0, 0, 1, 1,
-0.4201161, -0.4993683, -1.575134, 1, 0, 0, 1, 1,
-0.4105173, -0.179654, -2.999894, 1, 0, 0, 1, 1,
-0.4070705, 0.4139622, -0.1879008, 0, 0, 0, 1, 1,
-0.406837, 0.09363103, 0.6508578, 0, 0, 0, 1, 1,
-0.406226, -0.3330334, -2.715539, 0, 0, 0, 1, 1,
-0.4040357, 1.6262, -0.1623484, 0, 0, 0, 1, 1,
-0.4017662, 0.259784, -0.3185486, 0, 0, 0, 1, 1,
-0.3961779, 0.6108484, -1.760455, 0, 0, 0, 1, 1,
-0.3960296, 1.047484, -1.788968, 0, 0, 0, 1, 1,
-0.3919688, -1.603994, -3.994975, 1, 1, 1, 1, 1,
-0.3902584, 0.1342612, -0.6687382, 1, 1, 1, 1, 1,
-0.3865163, -0.7551402, -2.426641, 1, 1, 1, 1, 1,
-0.3784546, 0.9516055, -2.233911, 1, 1, 1, 1, 1,
-0.3722778, 0.4400869, -0.7067379, 1, 1, 1, 1, 1,
-0.3720868, -1.458957, -4.412329, 1, 1, 1, 1, 1,
-0.3706796, 0.4078159, -0.2163035, 1, 1, 1, 1, 1,
-0.3669863, -0.05940554, -0.841107, 1, 1, 1, 1, 1,
-0.3607074, 1.159711, -0.6451795, 1, 1, 1, 1, 1,
-0.3591494, 0.4394543, 0.6194966, 1, 1, 1, 1, 1,
-0.3585367, -0.71123, -2.710783, 1, 1, 1, 1, 1,
-0.3555797, 1.119528, -0.1588172, 1, 1, 1, 1, 1,
-0.354492, -0.6315027, -2.840036, 1, 1, 1, 1, 1,
-0.3515631, 0.1589728, -2.360306, 1, 1, 1, 1, 1,
-0.3511811, -0.2490682, -2.59877, 1, 1, 1, 1, 1,
-0.3507009, -0.0984957, -2.465019, 0, 0, 1, 1, 1,
-0.3500223, -1.572799, -3.038254, 1, 0, 0, 1, 1,
-0.3494701, 0.421131, -1.873101, 1, 0, 0, 1, 1,
-0.3479971, 0.05373085, -3.249136, 1, 0, 0, 1, 1,
-0.3455259, -0.004304986, -0.6945913, 1, 0, 0, 1, 1,
-0.3436032, 0.04844771, -1.917634, 1, 0, 0, 1, 1,
-0.3425517, 1.178788, 0.1884027, 0, 0, 0, 1, 1,
-0.3358127, -0.6519175, -2.353379, 0, 0, 0, 1, 1,
-0.3348733, -1.400378, -2.095256, 0, 0, 0, 1, 1,
-0.334857, -1.413962, -3.56405, 0, 0, 0, 1, 1,
-0.3340887, 1.376666, -0.9766657, 0, 0, 0, 1, 1,
-0.3274159, -0.4702193, -1.235507, 0, 0, 0, 1, 1,
-0.3223138, -0.2570355, -3.576121, 0, 0, 0, 1, 1,
-0.3185884, 0.4821158, -1.799565, 1, 1, 1, 1, 1,
-0.3178335, -0.6906421, -1.65263, 1, 1, 1, 1, 1,
-0.316702, -1.625988, -3.104294, 1, 1, 1, 1, 1,
-0.3076768, 0.4983669, -0.5264823, 1, 1, 1, 1, 1,
-0.3058484, 1.186931, -1.54343, 1, 1, 1, 1, 1,
-0.3058374, 2.11171, -1.090264, 1, 1, 1, 1, 1,
-0.3018917, -0.08486971, -2.697312, 1, 1, 1, 1, 1,
-0.2994834, -0.2649949, -0.7154335, 1, 1, 1, 1, 1,
-0.2964717, 0.1456487, -0.09368357, 1, 1, 1, 1, 1,
-0.2921592, -0.5839391, -2.49654, 1, 1, 1, 1, 1,
-0.2905577, -0.3101262, -2.571327, 1, 1, 1, 1, 1,
-0.2899588, -1.83089, -5.08028, 1, 1, 1, 1, 1,
-0.2865635, 0.2199101, -0.2396933, 1, 1, 1, 1, 1,
-0.2861094, 2.326887, -0.8946626, 1, 1, 1, 1, 1,
-0.2825247, -1.709044, -3.482251, 1, 1, 1, 1, 1,
-0.2781057, 1.421414, 1.419966, 0, 0, 1, 1, 1,
-0.2775582, -0.09810369, -2.368091, 1, 0, 0, 1, 1,
-0.2751724, 1.234742, 1.938798, 1, 0, 0, 1, 1,
-0.2740992, -0.8008591, -2.219309, 1, 0, 0, 1, 1,
-0.2715614, 0.2638572, 1.448526, 1, 0, 0, 1, 1,
-0.2710807, 0.2445149, -0.9693513, 1, 0, 0, 1, 1,
-0.2702357, -0.2992277, -2.100945, 0, 0, 0, 1, 1,
-0.268746, -0.5005136, -4.680829, 0, 0, 0, 1, 1,
-0.2682851, 2.259818, 1.087089, 0, 0, 0, 1, 1,
-0.2666213, -1.326293, -3.662772, 0, 0, 0, 1, 1,
-0.2539018, -1.902293, -1.214333, 0, 0, 0, 1, 1,
-0.2538052, 0.8608729, 0.6104923, 0, 0, 0, 1, 1,
-0.2501145, -1.416069, -3.831872, 0, 0, 0, 1, 1,
-0.2499383, 1.65658, 0.5287929, 1, 1, 1, 1, 1,
-0.2489715, -0.2785102, -2.168729, 1, 1, 1, 1, 1,
-0.2485652, 1.352503, -0.09275317, 1, 1, 1, 1, 1,
-0.2474197, -0.2927827, -2.232537, 1, 1, 1, 1, 1,
-0.2473565, 0.05574754, -2.163858, 1, 1, 1, 1, 1,
-0.2435481, 0.9763286, 0.8426698, 1, 1, 1, 1, 1,
-0.2384488, 0.1042761, -2.201242, 1, 1, 1, 1, 1,
-0.2301488, 1.246561, 1.0049, 1, 1, 1, 1, 1,
-0.2297083, -1.91492, -1.850633, 1, 1, 1, 1, 1,
-0.2267158, 0.6054517, -0.1604645, 1, 1, 1, 1, 1,
-0.2255645, 0.4946446, -1.896166, 1, 1, 1, 1, 1,
-0.2250926, 0.2700921, -0.1488199, 1, 1, 1, 1, 1,
-0.2237166, -1.21169, -3.274284, 1, 1, 1, 1, 1,
-0.2192874, -0.03804007, -2.46839, 1, 1, 1, 1, 1,
-0.2092909, 1.116993, 0.587762, 1, 1, 1, 1, 1,
-0.2040626, 0.1260454, -1.123155, 0, 0, 1, 1, 1,
-0.2021905, 1.218916, 0.1201321, 1, 0, 0, 1, 1,
-0.2009523, -0.1248061, -1.63639, 1, 0, 0, 1, 1,
-0.2007453, 0.1338129, 2.356463, 1, 0, 0, 1, 1,
-0.1985432, 0.5134776, -0.6519397, 1, 0, 0, 1, 1,
-0.1968095, -2.084444, -3.616651, 1, 0, 0, 1, 1,
-0.1946925, 1.639196, -0.7365011, 0, 0, 0, 1, 1,
-0.1906325, 0.1658404, -1.107176, 0, 0, 0, 1, 1,
-0.1903658, -0.1996053, -2.104012, 0, 0, 0, 1, 1,
-0.1895315, 1.415261, -0.6458937, 0, 0, 0, 1, 1,
-0.1875449, -1.916397, -3.065415, 0, 0, 0, 1, 1,
-0.186363, -1.661144, -2.617544, 0, 0, 0, 1, 1,
-0.182905, -1.002421, -3.233525, 0, 0, 0, 1, 1,
-0.181147, -1.859557, -2.921355, 1, 1, 1, 1, 1,
-0.1788332, 0.7761968, -1.18258, 1, 1, 1, 1, 1,
-0.1762313, 1.45985, 0.4993771, 1, 1, 1, 1, 1,
-0.1733711, -1.255095, -2.947548, 1, 1, 1, 1, 1,
-0.1705355, 0.8913289, -1.390966, 1, 1, 1, 1, 1,
-0.1679767, -2.139975, -2.476772, 1, 1, 1, 1, 1,
-0.165903, -0.9374299, -2.30451, 1, 1, 1, 1, 1,
-0.1630505, 1.262794, -0.07824527, 1, 1, 1, 1, 1,
-0.1617356, 0.09177332, -0.7118199, 1, 1, 1, 1, 1,
-0.1609864, -1.686842, -3.327139, 1, 1, 1, 1, 1,
-0.1602485, 0.7522044, -1.874809, 1, 1, 1, 1, 1,
-0.1567015, -1.472575, -2.235356, 1, 1, 1, 1, 1,
-0.1537087, 0.1528087, 1.111898, 1, 1, 1, 1, 1,
-0.1483548, 0.6781362, -1.82896, 1, 1, 1, 1, 1,
-0.1423731, 0.6307454, 2.481074, 1, 1, 1, 1, 1,
-0.1408461, -2.443641, -3.756468, 0, 0, 1, 1, 1,
-0.1370995, -1.791993, -3.100766, 1, 0, 0, 1, 1,
-0.1329986, 1.466297, -0.9113708, 1, 0, 0, 1, 1,
-0.1289642, -0.2584776, -1.28882, 1, 0, 0, 1, 1,
-0.1287407, -1.093341, -2.820514, 1, 0, 0, 1, 1,
-0.1279671, 0.2479555, 1.074168, 1, 0, 0, 1, 1,
-0.126327, -1.178117, -3.437509, 0, 0, 0, 1, 1,
-0.1230365, -1.240598, -4.356375, 0, 0, 0, 1, 1,
-0.1183683, 0.7695528, -1.554714, 0, 0, 0, 1, 1,
-0.1160902, -0.6585602, -1.502255, 0, 0, 0, 1, 1,
-0.1159994, 0.1456569, -0.2005989, 0, 0, 0, 1, 1,
-0.1153638, -0.855489, -3.23099, 0, 0, 0, 1, 1,
-0.1153373, 0.1377171, -0.3327874, 0, 0, 0, 1, 1,
-0.1143453, -0.7045759, -2.719856, 1, 1, 1, 1, 1,
-0.112262, 0.4553241, -0.7316678, 1, 1, 1, 1, 1,
-0.1061496, -0.2327114, -1.223092, 1, 1, 1, 1, 1,
-0.1053926, -0.1297316, -2.767126, 1, 1, 1, 1, 1,
-0.104819, -0.3870758, -3.451632, 1, 1, 1, 1, 1,
-0.1011621, 0.7206667, 0.6000447, 1, 1, 1, 1, 1,
-0.09977399, 0.980707, -0.2258312, 1, 1, 1, 1, 1,
-0.09014184, -0.3474542, -3.538403, 1, 1, 1, 1, 1,
-0.08910076, 0.02385443, -2.738599, 1, 1, 1, 1, 1,
-0.08584025, -1.209701, -3.431268, 1, 1, 1, 1, 1,
-0.08183178, -2.298442, -2.577142, 1, 1, 1, 1, 1,
-0.08180182, 1.615969, -2.044831, 1, 1, 1, 1, 1,
-0.07361627, 0.9817743, 0.1714348, 1, 1, 1, 1, 1,
-0.07336549, 0.3520645, 0.8239613, 1, 1, 1, 1, 1,
-0.07292853, -1.782323, -2.913219, 1, 1, 1, 1, 1,
-0.06889274, 0.3948733, -0.8153821, 0, 0, 1, 1, 1,
-0.06764048, 0.06265913, -2.534864, 1, 0, 0, 1, 1,
-0.06656177, -1.464641, -3.589778, 1, 0, 0, 1, 1,
-0.06643123, -0.6602998, -2.826406, 1, 0, 0, 1, 1,
-0.06412355, 0.8550363, -0.03463267, 1, 0, 0, 1, 1,
-0.06380667, 0.1298928, -1.517125, 1, 0, 0, 1, 1,
-0.06096834, 1.074648, -0.9426874, 0, 0, 0, 1, 1,
-0.05891774, -0.1454361, -1.66397, 0, 0, 0, 1, 1,
-0.05602271, 0.5354319, -2.524101, 0, 0, 0, 1, 1,
-0.05597026, 0.4870862, -0.08182445, 0, 0, 0, 1, 1,
-0.05549001, -0.2908797, -2.033392, 0, 0, 0, 1, 1,
-0.04587366, -0.9564857, -6.196913, 0, 0, 0, 1, 1,
-0.04555295, -0.7585775, -2.619106, 0, 0, 0, 1, 1,
-0.04308933, 0.6110502, -1.003415, 1, 1, 1, 1, 1,
-0.04214316, 0.7243597, 0.745994, 1, 1, 1, 1, 1,
-0.03630323, -1.297961, -2.900897, 1, 1, 1, 1, 1,
-0.03476033, 0.841132, 0.746355, 1, 1, 1, 1, 1,
-0.03030463, -0.4667002, -4.086257, 1, 1, 1, 1, 1,
-0.02835265, 0.8650258, -0.6981831, 1, 1, 1, 1, 1,
-0.0255055, 1.448628, 1.469379, 1, 1, 1, 1, 1,
-0.02532787, -0.5723391, -2.369768, 1, 1, 1, 1, 1,
-0.02204868, -0.05249066, -1.971598, 1, 1, 1, 1, 1,
-0.02068682, -0.3408937, -2.207748, 1, 1, 1, 1, 1,
-0.02014093, 0.214439, -0.7786443, 1, 1, 1, 1, 1,
-0.01795136, 1.128864, 1.807483, 1, 1, 1, 1, 1,
-0.01681611, 1.278247, 1.342843, 1, 1, 1, 1, 1,
-0.01506052, -1.297981, -3.678846, 1, 1, 1, 1, 1,
-0.01412946, 0.2712471, 0.03801801, 1, 1, 1, 1, 1,
-0.00931222, 0.9728214, -0.8478188, 0, 0, 1, 1, 1,
-0.009130789, 0.5993083, -0.4725541, 1, 0, 0, 1, 1,
-0.007919392, -0.6118712, -3.767814, 1, 0, 0, 1, 1,
-0.00327701, 0.5127918, -0.706752, 1, 0, 0, 1, 1,
-0.002225389, -0.400367, -2.668803, 1, 0, 0, 1, 1,
0.003105834, -0.1081608, 3.881485, 1, 0, 0, 1, 1,
0.003887157, -0.9841911, 2.221375, 0, 0, 0, 1, 1,
0.004616832, 0.9078597, 0.9504469, 0, 0, 0, 1, 1,
0.01381281, -0.8373473, 4.061554, 0, 0, 0, 1, 1,
0.01427887, 0.1586671, -2.373023, 0, 0, 0, 1, 1,
0.01651369, 0.20341, 0.741358, 0, 0, 0, 1, 1,
0.01708162, 1.189995, 1.036824, 0, 0, 0, 1, 1,
0.01754036, 0.9022624, -2.052352, 0, 0, 0, 1, 1,
0.02319517, 1.707518, 0.4533182, 1, 1, 1, 1, 1,
0.02367474, -0.6503165, 0.8791257, 1, 1, 1, 1, 1,
0.02638479, 0.6526348, 0.5165714, 1, 1, 1, 1, 1,
0.02733372, 0.3263566, 0.8688311, 1, 1, 1, 1, 1,
0.02751337, 0.02458848, -1.427198, 1, 1, 1, 1, 1,
0.02882694, 0.2918087, 1.754567, 1, 1, 1, 1, 1,
0.0341248, 2.327623, -1.257032, 1, 1, 1, 1, 1,
0.03497186, 0.2150484, 0.6402716, 1, 1, 1, 1, 1,
0.03529941, -1.365368, 2.15592, 1, 1, 1, 1, 1,
0.0360413, 0.6824017, 1.65097, 1, 1, 1, 1, 1,
0.03605184, 0.4476904, -0.09047016, 1, 1, 1, 1, 1,
0.04014415, -0.9250854, 4.07016, 1, 1, 1, 1, 1,
0.04364018, -0.7826869, 3.170998, 1, 1, 1, 1, 1,
0.04484395, -1.824407, 2.336609, 1, 1, 1, 1, 1,
0.04805689, 0.68622, -0.7920169, 1, 1, 1, 1, 1,
0.04855039, 0.9208947, -0.7491792, 0, 0, 1, 1, 1,
0.05105723, 1.698529, 0.2411525, 1, 0, 0, 1, 1,
0.05655395, 0.01770226, 0.7235603, 1, 0, 0, 1, 1,
0.06122449, -1.724107, 1.789621, 1, 0, 0, 1, 1,
0.06402435, -0.01443069, 2.351384, 1, 0, 0, 1, 1,
0.06618006, 0.7381485, -0.7726282, 1, 0, 0, 1, 1,
0.06773742, 0.4545346, 0.09859034, 0, 0, 0, 1, 1,
0.0704251, -1.030474, 1.622219, 0, 0, 0, 1, 1,
0.07663609, -0.449012, 3.148169, 0, 0, 0, 1, 1,
0.0797717, 0.6819789, -1.841029, 0, 0, 0, 1, 1,
0.08038841, -1.732605, 1.725524, 0, 0, 0, 1, 1,
0.0851979, -0.8333659, 3.272245, 0, 0, 0, 1, 1,
0.08522451, 0.2427766, 0.5019818, 0, 0, 0, 1, 1,
0.09283926, -1.557437, 3.465792, 1, 1, 1, 1, 1,
0.09358336, -1.422565, 2.354342, 1, 1, 1, 1, 1,
0.09924822, -1.642708, 4.141134, 1, 1, 1, 1, 1,
0.1010132, 1.308397, 1.468235, 1, 1, 1, 1, 1,
0.1037027, 0.8851748, -0.6199552, 1, 1, 1, 1, 1,
0.1061041, 1.021238, 0.6570625, 1, 1, 1, 1, 1,
0.1073991, -0.4423559, 1.822075, 1, 1, 1, 1, 1,
0.1098087, 2.284838, 0.1903734, 1, 1, 1, 1, 1,
0.1196121, 0.2880759, 0.374908, 1, 1, 1, 1, 1,
0.1240388, 0.9682609, -0.1629121, 1, 1, 1, 1, 1,
0.1253928, -0.5594092, 2.439386, 1, 1, 1, 1, 1,
0.1283066, 1.940408, 0.9306285, 1, 1, 1, 1, 1,
0.1289101, -0.7347798, 2.705845, 1, 1, 1, 1, 1,
0.1313251, -0.9715312, 3.449856, 1, 1, 1, 1, 1,
0.131775, -0.683761, 2.184951, 1, 1, 1, 1, 1,
0.1318721, -0.8007871, 1.259358, 0, 0, 1, 1, 1,
0.138886, -0.4642109, 3.784704, 1, 0, 0, 1, 1,
0.140082, 0.2040815, -0.5825607, 1, 0, 0, 1, 1,
0.1401542, 0.7062873, 2.131872, 1, 0, 0, 1, 1,
0.1420022, 0.001145769, -0.06908267, 1, 0, 0, 1, 1,
0.1432188, 0.7962304, 1.359643, 1, 0, 0, 1, 1,
0.1452125, 0.2591212, 0.04331607, 0, 0, 0, 1, 1,
0.146179, 0.07325047, 1.229358, 0, 0, 0, 1, 1,
0.1467014, -0.1127785, 2.024649, 0, 0, 0, 1, 1,
0.146876, 1.792351, 0.7611643, 0, 0, 0, 1, 1,
0.1494607, -1.552309, 2.761523, 0, 0, 0, 1, 1,
0.1516841, -0.1520868, 1.851564, 0, 0, 0, 1, 1,
0.1587077, 0.4195549, -0.5991673, 0, 0, 0, 1, 1,
0.1603266, -0.4352051, 2.842397, 1, 1, 1, 1, 1,
0.1617299, 0.002307079, 0.6205426, 1, 1, 1, 1, 1,
0.1621214, 0.09832269, -0.1162348, 1, 1, 1, 1, 1,
0.1628104, -0.8528689, 2.631532, 1, 1, 1, 1, 1,
0.1645801, -0.2530047, 2.250319, 1, 1, 1, 1, 1,
0.1658888, -0.6021922, 3.648573, 1, 1, 1, 1, 1,
0.1676447, -0.8768641, 4.004071, 1, 1, 1, 1, 1,
0.1697009, -1.181958, 3.232783, 1, 1, 1, 1, 1,
0.1710687, 2.042117, 0.3956417, 1, 1, 1, 1, 1,
0.1744812, 1.148392, 0.1320939, 1, 1, 1, 1, 1,
0.1757666, 0.2244541, -0.3039019, 1, 1, 1, 1, 1,
0.1792242, 0.05213235, 0.2670786, 1, 1, 1, 1, 1,
0.1800686, 0.3067737, -0.3116192, 1, 1, 1, 1, 1,
0.1829793, 1.669635, -0.3649299, 1, 1, 1, 1, 1,
0.1855546, -1.054963, 3.328044, 1, 1, 1, 1, 1,
0.1950883, 0.7668291, 0.36884, 0, 0, 1, 1, 1,
0.1982716, -1.438472, 3.292692, 1, 0, 0, 1, 1,
0.1998283, 1.730883, 2.517147, 1, 0, 0, 1, 1,
0.2003231, -0.7186176, 2.853255, 1, 0, 0, 1, 1,
0.2035458, -0.754545, 3.48747, 1, 0, 0, 1, 1,
0.2059834, -0.6626946, 3.330768, 1, 0, 0, 1, 1,
0.2088688, -2.261352, 3.982215, 0, 0, 0, 1, 1,
0.2101475, 0.08489672, 0.6135529, 0, 0, 0, 1, 1,
0.2104923, 1.33373, -1.938391, 0, 0, 0, 1, 1,
0.2214981, 0.2452624, 3.38595, 0, 0, 0, 1, 1,
0.2223029, -1.590969, 3.063331, 0, 0, 0, 1, 1,
0.2223307, -0.01516851, 0.5126932, 0, 0, 0, 1, 1,
0.224586, 0.4119855, -0.9908703, 0, 0, 0, 1, 1,
0.2271002, -0.82298, 2.285501, 1, 1, 1, 1, 1,
0.2339419, 0.1527409, 1.300766, 1, 1, 1, 1, 1,
0.2340149, 1.506768, 1.500258, 1, 1, 1, 1, 1,
0.2404245, -0.4987882, 0.7309337, 1, 1, 1, 1, 1,
0.2415124, 0.02955065, 2.77049, 1, 1, 1, 1, 1,
0.2423499, -1.232251, 2.250965, 1, 1, 1, 1, 1,
0.244697, 1.264672, -1.393372, 1, 1, 1, 1, 1,
0.2476586, 1.406286, -0.4013188, 1, 1, 1, 1, 1,
0.2486427, 0.1813173, -0.278489, 1, 1, 1, 1, 1,
0.2541956, -0.8070024, 2.657737, 1, 1, 1, 1, 1,
0.2546875, 0.3452102, 2.025176, 1, 1, 1, 1, 1,
0.2595445, -1.895962, 4.141698, 1, 1, 1, 1, 1,
0.2602438, 0.9980111, 0.1050259, 1, 1, 1, 1, 1,
0.2639539, 1.007292, 1.533587, 1, 1, 1, 1, 1,
0.2712257, -1.02208, 3.06425, 1, 1, 1, 1, 1,
0.2713916, -2.002907, 2.313617, 0, 0, 1, 1, 1,
0.2752688, -1.497893, 2.820239, 1, 0, 0, 1, 1,
0.2803319, 0.864094, 1.664684, 1, 0, 0, 1, 1,
0.2821264, -0.1892742, 2.401609, 1, 0, 0, 1, 1,
0.2834822, -0.4628744, 2.618482, 1, 0, 0, 1, 1,
0.2884435, -0.06016822, 1.059795, 1, 0, 0, 1, 1,
0.2887383, 0.2897132, 0.5094634, 0, 0, 0, 1, 1,
0.292064, 0.313479, -0.606826, 0, 0, 0, 1, 1,
0.2924246, -0.5688699, 3.688231, 0, 0, 0, 1, 1,
0.2953605, -0.6985759, 2.189789, 0, 0, 0, 1, 1,
0.2955156, -0.2368749, 3.163491, 0, 0, 0, 1, 1,
0.2972219, -1.115091, 1.553774, 0, 0, 0, 1, 1,
0.298416, -1.112137, 3.634554, 0, 0, 0, 1, 1,
0.2984239, 0.9323627, 0.317642, 1, 1, 1, 1, 1,
0.2995941, 0.9767312, 0.1262312, 1, 1, 1, 1, 1,
0.2996953, 0.07992992, 0.8267339, 1, 1, 1, 1, 1,
0.3000423, -0.1943344, 2.546753, 1, 1, 1, 1, 1,
0.3031603, -0.7650309, 2.959429, 1, 1, 1, 1, 1,
0.306744, 0.850969, -1.230752, 1, 1, 1, 1, 1,
0.3068216, -1.122817, 4.041842, 1, 1, 1, 1, 1,
0.3119253, -0.4511619, 1.457541, 1, 1, 1, 1, 1,
0.3130271, -0.8445652, 2.041218, 1, 1, 1, 1, 1,
0.3179907, 1.004315, 0.924992, 1, 1, 1, 1, 1,
0.3220617, -0.8126022, 2.704668, 1, 1, 1, 1, 1,
0.3238204, 1.18867, -0.7925225, 1, 1, 1, 1, 1,
0.3281383, 0.9881827, 0.3174498, 1, 1, 1, 1, 1,
0.3291696, 1.200382, -0.3711966, 1, 1, 1, 1, 1,
0.3320681, 1.359698, 0.8844984, 1, 1, 1, 1, 1,
0.3325306, 0.6170269, 0.6918173, 0, 0, 1, 1, 1,
0.3358788, 1.039196, -0.9926166, 1, 0, 0, 1, 1,
0.3388406, -0.1958373, 1.98915, 1, 0, 0, 1, 1,
0.3395557, 0.408242, 0.3930712, 1, 0, 0, 1, 1,
0.3418022, 0.3630916, 1.238406, 1, 0, 0, 1, 1,
0.3447178, 2.358564, -1.034656, 1, 0, 0, 1, 1,
0.3451276, -0.8690839, 4.032156, 0, 0, 0, 1, 1,
0.3469488, 0.7717268, 0.5076939, 0, 0, 0, 1, 1,
0.3480502, 1.007921, -1.439876, 0, 0, 0, 1, 1,
0.3525516, 0.7902822, 0.6083261, 0, 0, 0, 1, 1,
0.3599948, 0.1541262, 0.9136003, 0, 0, 0, 1, 1,
0.3659004, 0.2111882, 0.501012, 0, 0, 0, 1, 1,
0.3661676, 0.5195083, 0.6576203, 0, 0, 0, 1, 1,
0.3665692, 0.04543066, 1.427121, 1, 1, 1, 1, 1,
0.3700824, 0.2993295, -0.2040693, 1, 1, 1, 1, 1,
0.3705738, -1.211725, 3.426734, 1, 1, 1, 1, 1,
0.3784681, -1.274832, 2.697507, 1, 1, 1, 1, 1,
0.3829731, 0.1382994, -1.679061, 1, 1, 1, 1, 1,
0.3862672, -0.4821784, 2.052581, 1, 1, 1, 1, 1,
0.3906144, -0.8990192, 3.444536, 1, 1, 1, 1, 1,
0.3907716, 0.08118804, 0.9507357, 1, 1, 1, 1, 1,
0.3910219, -1.366169, 2.360885, 1, 1, 1, 1, 1,
0.3930986, -1.331839, 3.170478, 1, 1, 1, 1, 1,
0.3967473, -0.7901295, 2.029043, 1, 1, 1, 1, 1,
0.3969429, -0.077771, 0.7732385, 1, 1, 1, 1, 1,
0.3974187, -0.9422619, 2.300193, 1, 1, 1, 1, 1,
0.3990283, 0.8374445, 0.177342, 1, 1, 1, 1, 1,
0.4041443, -1.443201, 1.185573, 1, 1, 1, 1, 1,
0.4046284, 2.521233, -0.3992973, 0, 0, 1, 1, 1,
0.4059196, -0.04741826, 1.496421, 1, 0, 0, 1, 1,
0.4149911, -0.6115599, 4.134968, 1, 0, 0, 1, 1,
0.4294051, 2.056404, -1.63157, 1, 0, 0, 1, 1,
0.4305087, -0.4072883, 3.15063, 1, 0, 0, 1, 1,
0.4310687, 0.2984017, 0.4531161, 1, 0, 0, 1, 1,
0.4320073, -0.1847997, 1.606002, 0, 0, 0, 1, 1,
0.4321873, -0.5295665, 1.991287, 0, 0, 0, 1, 1,
0.4322618, -1.15721, 2.045006, 0, 0, 0, 1, 1,
0.433638, 0.08960607, 0.2155844, 0, 0, 0, 1, 1,
0.4343814, 1.90475, -1.015302, 0, 0, 0, 1, 1,
0.4370078, 0.3029605, 0.6515049, 0, 0, 0, 1, 1,
0.4371248, 0.7010679, 1.045866, 0, 0, 0, 1, 1,
0.4372982, -0.9238381, 2.169134, 1, 1, 1, 1, 1,
0.4375645, -1.147363, 3.971135, 1, 1, 1, 1, 1,
0.438131, 0.6816325, 0.6107172, 1, 1, 1, 1, 1,
0.4410535, 2.009584, -0.1299222, 1, 1, 1, 1, 1,
0.4428546, -0.3678412, 0.9492795, 1, 1, 1, 1, 1,
0.4442015, -0.4225105, 3.292291, 1, 1, 1, 1, 1,
0.4505631, -0.3194497, 1.248999, 1, 1, 1, 1, 1,
0.4524834, -0.5124865, 2.518975, 1, 1, 1, 1, 1,
0.4565249, -0.8762453, 2.492128, 1, 1, 1, 1, 1,
0.4570029, 0.04676065, 0.283208, 1, 1, 1, 1, 1,
0.4681668, -2.527874, 3.12366, 1, 1, 1, 1, 1,
0.4708728, -0.322542, 2.535434, 1, 1, 1, 1, 1,
0.4712626, 0.5195311, 1.678861, 1, 1, 1, 1, 1,
0.4713433, -0.4457025, 2.536898, 1, 1, 1, 1, 1,
0.4735051, 0.9692857, 1.234802, 1, 1, 1, 1, 1,
0.4866681, -1.266966, 3.831482, 0, 0, 1, 1, 1,
0.5005366, -0.9253304, 1.96501, 1, 0, 0, 1, 1,
0.5009842, 0.1838006, -0.8733465, 1, 0, 0, 1, 1,
0.5129651, 0.6393892, -0.001163757, 1, 0, 0, 1, 1,
0.5164647, 0.2751297, 1.629155, 1, 0, 0, 1, 1,
0.5174208, -0.05966087, 0.3153026, 1, 0, 0, 1, 1,
0.5179941, -0.2407918, 1.543306, 0, 0, 0, 1, 1,
0.5214479, -1.492205, 2.275203, 0, 0, 0, 1, 1,
0.5226893, -0.4563861, 2.364868, 0, 0, 0, 1, 1,
0.5228513, -1.378268, 1.6432, 0, 0, 0, 1, 1,
0.523398, 0.5988186, 0.51967, 0, 0, 0, 1, 1,
0.5267367, 0.8485349, 0.6630967, 0, 0, 0, 1, 1,
0.5328356, -0.2539777, 1.444867, 0, 0, 0, 1, 1,
0.5349312, 1.717375, 2.69726, 1, 1, 1, 1, 1,
0.536851, -0.7296788, 2.790464, 1, 1, 1, 1, 1,
0.5383235, -0.105421, 1.288683, 1, 1, 1, 1, 1,
0.538446, 0.5196367, 1.231626, 1, 1, 1, 1, 1,
0.5388163, -0.2102654, 1.822976, 1, 1, 1, 1, 1,
0.5402927, 0.7747944, 0.6096779, 1, 1, 1, 1, 1,
0.5471315, -0.6339008, 2.908896, 1, 1, 1, 1, 1,
0.5518489, 2.634501, 1.570626, 1, 1, 1, 1, 1,
0.5547811, -0.4274387, 0.105875, 1, 1, 1, 1, 1,
0.5625143, 0.3463093, 1.881243, 1, 1, 1, 1, 1,
0.5699711, 0.2274375, 1.529218, 1, 1, 1, 1, 1,
0.5709803, -0.2267256, 2.132689, 1, 1, 1, 1, 1,
0.5790425, 1.264884, 0.6201954, 1, 1, 1, 1, 1,
0.5900136, 0.6143767, -0.05022344, 1, 1, 1, 1, 1,
0.5956669, -0.2370827, 2.398858, 1, 1, 1, 1, 1,
0.5982714, 1.009302, -0.264547, 0, 0, 1, 1, 1,
0.6062049, 0.8227086, -1.015011, 1, 0, 0, 1, 1,
0.6064236, -0.4265628, 3.451493, 1, 0, 0, 1, 1,
0.6074134, 0.4560634, 0.4324852, 1, 0, 0, 1, 1,
0.6087665, 0.5496334, 0.05850351, 1, 0, 0, 1, 1,
0.6092052, 1.910542, 1.617369, 1, 0, 0, 1, 1,
0.610037, 0.4325342, -0.6605127, 0, 0, 0, 1, 1,
0.6121093, 0.1556468, 1.777163, 0, 0, 0, 1, 1,
0.6144669, 2.015423, 1.741371, 0, 0, 0, 1, 1,
0.6152824, 0.317814, 1.16026, 0, 0, 0, 1, 1,
0.6171384, -1.235219, 3.308387, 0, 0, 0, 1, 1,
0.6202013, -0.4230158, 1.021205, 0, 0, 0, 1, 1,
0.6247778, 0.2972488, 2.774562, 0, 0, 0, 1, 1,
0.6258096, 0.4845204, 1.215375, 1, 1, 1, 1, 1,
0.6266126, -0.8534676, 1.978299, 1, 1, 1, 1, 1,
0.6295985, -0.05728052, 1.400849, 1, 1, 1, 1, 1,
0.6304062, 1.252508, 2.321701, 1, 1, 1, 1, 1,
0.6335227, 0.5588879, 0.4868108, 1, 1, 1, 1, 1,
0.6381795, -0.2933468, 1.613472, 1, 1, 1, 1, 1,
0.6384621, -0.9502629, 3.582673, 1, 1, 1, 1, 1,
0.639245, -1.377324, 3.623757, 1, 1, 1, 1, 1,
0.6427966, -2.004509, 1.812122, 1, 1, 1, 1, 1,
0.6429588, -0.05160753, 1.33568, 1, 1, 1, 1, 1,
0.6443943, 0.2527272, 2.229183, 1, 1, 1, 1, 1,
0.6474668, 0.3766592, -0.3111851, 1, 1, 1, 1, 1,
0.6627497, 0.7556256, 0.7655275, 1, 1, 1, 1, 1,
0.6666003, 0.1439013, 0.372722, 1, 1, 1, 1, 1,
0.6691866, -1.139458, 3.182857, 1, 1, 1, 1, 1,
0.6722695, -0.7796139, 1.816674, 0, 0, 1, 1, 1,
0.672876, -1.212068, 3.128397, 1, 0, 0, 1, 1,
0.6826754, -0.05896317, 1.571191, 1, 0, 0, 1, 1,
0.6921432, 2.764874, -0.4131471, 1, 0, 0, 1, 1,
0.6957691, -0.4712714, 0.6680456, 1, 0, 0, 1, 1,
0.7159352, 0.5814788, -0.1305073, 1, 0, 0, 1, 1,
0.7164792, -1.778803, 4.36017, 0, 0, 0, 1, 1,
0.7194453, 0.01134727, 1.349026, 0, 0, 0, 1, 1,
0.7234318, -1.937333, 4.964432, 0, 0, 0, 1, 1,
0.7273337, -0.08764492, 2.084591, 0, 0, 0, 1, 1,
0.7317109, -0.9865959, 3.500742, 0, 0, 0, 1, 1,
0.7323028, -0.5541708, 3.021722, 0, 0, 0, 1, 1,
0.733202, 0.2674179, 1.719468, 0, 0, 0, 1, 1,
0.7366417, -0.5513073, 0.8774146, 1, 1, 1, 1, 1,
0.7371376, 1.826047, 1.979416, 1, 1, 1, 1, 1,
0.7443479, 1.555673, 1.056339, 1, 1, 1, 1, 1,
0.7539187, -0.937847, 1.486312, 1, 1, 1, 1, 1,
0.7560885, -0.7552803, 4.448042, 1, 1, 1, 1, 1,
0.7567681, 1.477494, -0.8956106, 1, 1, 1, 1, 1,
0.7631399, -1.292698, 2.775934, 1, 1, 1, 1, 1,
0.7739639, -0.2274927, 1.232904, 1, 1, 1, 1, 1,
0.7788306, -0.2258177, 2.071718, 1, 1, 1, 1, 1,
0.7846968, 1.135303, 1.06781, 1, 1, 1, 1, 1,
0.7853068, 1.381398, -0.2647949, 1, 1, 1, 1, 1,
0.7901707, 1.015012, -0.6513286, 1, 1, 1, 1, 1,
0.798147, -0.2857955, -0.1029294, 1, 1, 1, 1, 1,
0.799124, -0.05901338, 1.167247, 1, 1, 1, 1, 1,
0.8018435, 0.239425, 0.7607156, 1, 1, 1, 1, 1,
0.8061032, -0.2557142, 0.9314166, 0, 0, 1, 1, 1,
0.8084661, 0.246708, 1.924431, 1, 0, 0, 1, 1,
0.8087679, 0.4632254, 1.356967, 1, 0, 0, 1, 1,
0.8110242, -0.3405195, 0.6796816, 1, 0, 0, 1, 1,
0.816398, -0.673824, 3.336755, 1, 0, 0, 1, 1,
0.824333, -1.059259, 2.291952, 1, 0, 0, 1, 1,
0.8267339, -0.2513475, 0.89381, 0, 0, 0, 1, 1,
0.8292069, -0.1711955, 0.8176245, 0, 0, 0, 1, 1,
0.8298783, 0.09017605, 3.049539, 0, 0, 0, 1, 1,
0.8342322, -1.849707, 1.88987, 0, 0, 0, 1, 1,
0.8375444, -1.245805, 2.58296, 0, 0, 0, 1, 1,
0.8471802, 0.1085552, 3.26868, 0, 0, 0, 1, 1,
0.8492194, -0.8220528, 2.594788, 0, 0, 0, 1, 1,
0.8504169, 0.4965697, 0.8726367, 1, 1, 1, 1, 1,
0.8531226, -0.0422871, 1.344094, 1, 1, 1, 1, 1,
0.8538079, -1.430707, 3.217204, 1, 1, 1, 1, 1,
0.8550007, 0.2568901, 1.077852, 1, 1, 1, 1, 1,
0.8603733, -0.08318456, 1.892132, 1, 1, 1, 1, 1,
0.8661178, 0.3703987, 0.7794703, 1, 1, 1, 1, 1,
0.8696668, -0.593085, 4.13559, 1, 1, 1, 1, 1,
0.8781765, 0.5825573, 2.035807, 1, 1, 1, 1, 1,
0.8790094, -1.175436, 0.4684296, 1, 1, 1, 1, 1,
0.8790476, -1.06121, 3.753222, 1, 1, 1, 1, 1,
0.8830544, 0.4102184, 1.325977, 1, 1, 1, 1, 1,
0.8848478, 0.5108246, 0.5253286, 1, 1, 1, 1, 1,
0.8879817, 0.0240301, 2.427641, 1, 1, 1, 1, 1,
0.8921452, -0.05534962, 3.197126, 1, 1, 1, 1, 1,
0.897456, 0.933022, 0.5128796, 1, 1, 1, 1, 1,
0.9013718, 0.0600873, 2.008158, 0, 0, 1, 1, 1,
0.9016113, 1.501033, 0.3735032, 1, 0, 0, 1, 1,
0.9061414, -0.2093576, 2.593365, 1, 0, 0, 1, 1,
0.9088374, -0.1128303, 2.619893, 1, 0, 0, 1, 1,
0.9097561, 0.07752752, 1.93785, 1, 0, 0, 1, 1,
0.9112002, -1.906282, 2.151272, 1, 0, 0, 1, 1,
0.9221474, -0.4310544, 2.838038, 0, 0, 0, 1, 1,
0.9243583, -1.801575, 3.185774, 0, 0, 0, 1, 1,
0.9282928, 0.6592414, -0.1296122, 0, 0, 0, 1, 1,
0.9310775, 0.3441782, 0.1740074, 0, 0, 0, 1, 1,
0.9311922, -0.8815435, 3.039312, 0, 0, 0, 1, 1,
0.9324358, 0.8720441, 2.977386, 0, 0, 0, 1, 1,
0.9389303, -0.08660127, 1.107206, 0, 0, 0, 1, 1,
0.9491377, -0.1265966, 0.489206, 1, 1, 1, 1, 1,
0.9513727, -1.123607, 3.068342, 1, 1, 1, 1, 1,
0.9517136, -0.05360873, 0.6188489, 1, 1, 1, 1, 1,
0.9529603, 0.6715356, 1.689362, 1, 1, 1, 1, 1,
0.9543231, 0.887054, 1.496535, 1, 1, 1, 1, 1,
0.9550794, -1.829182, 3.197937, 1, 1, 1, 1, 1,
0.963569, -0.3815209, 2.679487, 1, 1, 1, 1, 1,
0.9656212, -1.966449, 2.692028, 1, 1, 1, 1, 1,
0.9662517, -0.8557608, 2.845781, 1, 1, 1, 1, 1,
0.9695793, 1.080154, 0.6341523, 1, 1, 1, 1, 1,
0.9749217, -0.7851518, 1.524449, 1, 1, 1, 1, 1,
0.9832848, 1.83969, -0.4582109, 1, 1, 1, 1, 1,
0.983357, 0.7484968, 1.539391, 1, 1, 1, 1, 1,
1.017554, 1.632258, 1.295011, 1, 1, 1, 1, 1,
1.02362, -1.335918, 3.7275, 1, 1, 1, 1, 1,
1.033046, 1.099628, 0.0824036, 0, 0, 1, 1, 1,
1.042425, -1.137337, 2.173099, 1, 0, 0, 1, 1,
1.048067, 0.2405255, 1.03064, 1, 0, 0, 1, 1,
1.053891, 0.9960342, 1.821318, 1, 0, 0, 1, 1,
1.059124, -0.2902272, 2.237121, 1, 0, 0, 1, 1,
1.063189, 0.8040292, 0.05116514, 1, 0, 0, 1, 1,
1.071973, 0.3283389, 1.88646, 0, 0, 0, 1, 1,
1.075179, 1.662262, 3.166109, 0, 0, 0, 1, 1,
1.078686, 0.9196779, 3.035169, 0, 0, 0, 1, 1,
1.08396, -0.291006, 1.863701, 0, 0, 0, 1, 1,
1.089913, 0.3368768, 0.9573898, 0, 0, 0, 1, 1,
1.093211, -1.019479, 2.245073, 0, 0, 0, 1, 1,
1.095008, 0.6824736, 1.53249, 0, 0, 0, 1, 1,
1.097572, 0.7128083, 0.06768886, 1, 1, 1, 1, 1,
1.09994, -0.502429, 1.711903, 1, 1, 1, 1, 1,
1.102781, -1.50091, 3.692532, 1, 1, 1, 1, 1,
1.113183, 1.707372, 2.299815, 1, 1, 1, 1, 1,
1.115505, -0.004759622, 1.495251, 1, 1, 1, 1, 1,
1.119194, -0.09111361, 2.668045, 1, 1, 1, 1, 1,
1.120117, 0.5071385, 1.528083, 1, 1, 1, 1, 1,
1.123971, -1.056834, 2.131211, 1, 1, 1, 1, 1,
1.128205, -2.031705, 1.952429, 1, 1, 1, 1, 1,
1.12908, 0.7408371, 0.2683851, 1, 1, 1, 1, 1,
1.13516, -0.9566045, 1.762373, 1, 1, 1, 1, 1,
1.136197, 0.3329394, 2.070245, 1, 1, 1, 1, 1,
1.140049, -0.5495974, 1.77708, 1, 1, 1, 1, 1,
1.150552, 1.030885, 0.983766, 1, 1, 1, 1, 1,
1.151471, -0.3193161, 1.32986, 1, 1, 1, 1, 1,
1.153772, -0.5933787, 1.537351, 0, 0, 1, 1, 1,
1.155063, -1.044693, 1.957602, 1, 0, 0, 1, 1,
1.158181, 0.902132, -0.0353833, 1, 0, 0, 1, 1,
1.158674, -0.7716776, 0.9689512, 1, 0, 0, 1, 1,
1.160158, -1.234161, 3.242306, 1, 0, 0, 1, 1,
1.162008, 0.8112881, 0.5622327, 1, 0, 0, 1, 1,
1.166133, 0.8106632, 2.507354, 0, 0, 0, 1, 1,
1.168273, 0.1477751, 3.443915, 0, 0, 0, 1, 1,
1.168546, 1.316379, 0.05666532, 0, 0, 0, 1, 1,
1.170194, 1.004417, -0.5069375, 0, 0, 0, 1, 1,
1.17141, 0.04257749, 3.188672, 0, 0, 0, 1, 1,
1.173869, 0.268338, 1.159634, 0, 0, 0, 1, 1,
1.176436, 0.934654, 1.766453, 0, 0, 0, 1, 1,
1.176994, -1.066259, 2.983114, 1, 1, 1, 1, 1,
1.186363, -0.5256414, 1.908267, 1, 1, 1, 1, 1,
1.188736, 1.29707, -0.1333666, 1, 1, 1, 1, 1,
1.204614, 1.926277, 0.8566647, 1, 1, 1, 1, 1,
1.204743, 0.283553, 2.435937, 1, 1, 1, 1, 1,
1.205688, 0.7000986, 2.202102, 1, 1, 1, 1, 1,
1.210559, 2.159265, -0.9837808, 1, 1, 1, 1, 1,
1.220502, -1.534123, 1.563149, 1, 1, 1, 1, 1,
1.241247, 0.1930096, 0.008856514, 1, 1, 1, 1, 1,
1.245906, -0.1963865, 1.877673, 1, 1, 1, 1, 1,
1.249733, 1.76036, 0.9527055, 1, 1, 1, 1, 1,
1.252105, -0.3217806, 0.9042601, 1, 1, 1, 1, 1,
1.259855, -0.6242931, 1.469263, 1, 1, 1, 1, 1,
1.279946, 0.221582, 1.022233, 1, 1, 1, 1, 1,
1.282668, -0.8474679, 3.003256, 1, 1, 1, 1, 1,
1.282931, -0.4618142, 1.697106, 0, 0, 1, 1, 1,
1.29016, 0.8275557, -0.3583115, 1, 0, 0, 1, 1,
1.294817, -1.111989, 1.717142, 1, 0, 0, 1, 1,
1.295537, -0.1491901, 2.398664, 1, 0, 0, 1, 1,
1.295845, -1.753624, 3.011477, 1, 0, 0, 1, 1,
1.301934, -0.755392, 2.813034, 1, 0, 0, 1, 1,
1.312571, -2.488748, 2.100739, 0, 0, 0, 1, 1,
1.323909, 0.6875736, -0.0856944, 0, 0, 0, 1, 1,
1.32818, 0.4676204, 2.608826, 0, 0, 0, 1, 1,
1.331696, 1.44299, 0.4054959, 0, 0, 0, 1, 1,
1.333985, 0.4905879, 1.219628, 0, 0, 0, 1, 1,
1.38038, -1.52101, 2.252503, 0, 0, 0, 1, 1,
1.38707, 0.01114132, 2.212765, 0, 0, 0, 1, 1,
1.389231, -0.5198877, 1.597879, 1, 1, 1, 1, 1,
1.394224, -1.491745, 2.744483, 1, 1, 1, 1, 1,
1.403297, 1.577808, -0.3885864, 1, 1, 1, 1, 1,
1.40379, -1.508022, 2.577546, 1, 1, 1, 1, 1,
1.407884, 1.061625, 0.3092754, 1, 1, 1, 1, 1,
1.409775, 1.666738, 0.2015257, 1, 1, 1, 1, 1,
1.416093, 0.5900403, 3.184074, 1, 1, 1, 1, 1,
1.442633, -0.4805589, 2.907139, 1, 1, 1, 1, 1,
1.445045, -1.373385, 3.305371, 1, 1, 1, 1, 1,
1.453257, 0.0053199, 0.3819124, 1, 1, 1, 1, 1,
1.457036, 0.5402318, 1.678225, 1, 1, 1, 1, 1,
1.467047, -0.7582435, 2.168658, 1, 1, 1, 1, 1,
1.479804, -0.1208911, 1.480963, 1, 1, 1, 1, 1,
1.484096, 0.8025582, 1.179929, 1, 1, 1, 1, 1,
1.484594, -0.3428934, 3.36967, 1, 1, 1, 1, 1,
1.488042, -0.3411651, 1.633349, 0, 0, 1, 1, 1,
1.493086, -0.0008824118, 0.9478785, 1, 0, 0, 1, 1,
1.514903, -0.4197522, 2.727808, 1, 0, 0, 1, 1,
1.515011, -0.5992997, 3.185298, 1, 0, 0, 1, 1,
1.51832, 0.91189, 0.4243398, 1, 0, 0, 1, 1,
1.525015, 0.1475163, 3.34549, 1, 0, 0, 1, 1,
1.527955, 1.307973, 0.230645, 0, 0, 0, 1, 1,
1.533348, 0.3006835, 3.288927, 0, 0, 0, 1, 1,
1.542525, 0.2853611, 1.071418, 0, 0, 0, 1, 1,
1.547945, 0.5391616, 2.620499, 0, 0, 0, 1, 1,
1.549504, -0.3508377, 2.761957, 0, 0, 0, 1, 1,
1.560967, 0.5306953, 0.909844, 0, 0, 0, 1, 1,
1.563528, 0.8341431, 0.4202037, 0, 0, 0, 1, 1,
1.566505, 0.7569414, -1.229862, 1, 1, 1, 1, 1,
1.578658, 1.148527, 0.1373292, 1, 1, 1, 1, 1,
1.590468, 1.382803, 0.8413934, 1, 1, 1, 1, 1,
1.594558, 1.023696, 0.8607844, 1, 1, 1, 1, 1,
1.622391, 0.06636491, 3.746679, 1, 1, 1, 1, 1,
1.623831, -0.735271, 3.697963, 1, 1, 1, 1, 1,
1.633459, 1.531516, 1.135226, 1, 1, 1, 1, 1,
1.648852, -0.7846752, 3.431352, 1, 1, 1, 1, 1,
1.654998, -1.195601, 3.546075, 1, 1, 1, 1, 1,
1.67627, 0.224287, 0.998561, 1, 1, 1, 1, 1,
1.697034, -0.1405662, 3.054175, 1, 1, 1, 1, 1,
1.709074, -1.646238, 3.199929, 1, 1, 1, 1, 1,
1.710506, 0.6369411, -0.551788, 1, 1, 1, 1, 1,
1.713325, 0.3311511, 1.424743, 1, 1, 1, 1, 1,
1.73019, -2.070628, 2.200186, 1, 1, 1, 1, 1,
1.733615, -0.2908551, 1.428774, 0, 0, 1, 1, 1,
1.769699, -0.8527387, 1.322025, 1, 0, 0, 1, 1,
1.779205, -1.158876, 5.766737, 1, 0, 0, 1, 1,
1.788567, 0.5749403, -0.5728379, 1, 0, 0, 1, 1,
1.795926, 1.160856, 2.433003, 1, 0, 0, 1, 1,
1.797526, 2.161196, 0.8348209, 1, 0, 0, 1, 1,
1.827394, -1.311018, 2.012041, 0, 0, 0, 1, 1,
1.845435, 0.9946024, 0.7783858, 0, 0, 0, 1, 1,
1.859536, -0.3081823, 3.044387, 0, 0, 0, 1, 1,
1.866027, 1.579593, -1.23595, 0, 0, 0, 1, 1,
1.878343, -0.4318585, 0.02770601, 0, 0, 0, 1, 1,
1.990128, 0.2257684, 1.808508, 0, 0, 0, 1, 1,
2.04154, 2.331732, 1.167425, 0, 0, 0, 1, 1,
2.044765, -1.65001, 0.3505032, 1, 1, 1, 1, 1,
2.108843, -0.5058303, 2.712441, 1, 1, 1, 1, 1,
2.118077, 0.6102493, 1.547345, 1, 1, 1, 1, 1,
2.12097, 0.3208727, 1.440085, 1, 1, 1, 1, 1,
2.150632, -0.8240249, 1.185192, 1, 1, 1, 1, 1,
2.182786, 0.1922824, 0.3036016, 1, 1, 1, 1, 1,
2.186031, -0.808907, 0.7371228, 1, 1, 1, 1, 1,
2.186913, 0.1808749, 1.478339, 1, 1, 1, 1, 1,
2.187891, -1.90152, 0.1314315, 1, 1, 1, 1, 1,
2.190662, -0.6842735, 1.713955, 1, 1, 1, 1, 1,
2.194167, 0.6112192, 1.669939, 1, 1, 1, 1, 1,
2.195094, 1.009161, 2.199853, 1, 1, 1, 1, 1,
2.196128, -2.277558, 4.756577, 1, 1, 1, 1, 1,
2.207346, 0.1946983, 2.637119, 1, 1, 1, 1, 1,
2.211326, -1.465073, 1.927767, 1, 1, 1, 1, 1,
2.243362, -0.1526827, 0.9039913, 0, 0, 1, 1, 1,
2.24627, 0.2159634, 1.118116, 1, 0, 0, 1, 1,
2.272223, -0.9003044, 1.211449, 1, 0, 0, 1, 1,
2.291677, -0.8869677, 1.870354, 1, 0, 0, 1, 1,
2.307739, -0.1570012, 1.050593, 1, 0, 0, 1, 1,
2.308364, -1.465594, 1.765714, 1, 0, 0, 1, 1,
2.352705, -0.4423015, 2.70867, 0, 0, 0, 1, 1,
2.364139, -0.6574362, 2.863799, 0, 0, 0, 1, 1,
2.405222, -0.8757874, 1.483265, 0, 0, 0, 1, 1,
2.417373, -0.6993715, 2.491833, 0, 0, 0, 1, 1,
2.421659, 0.4300894, 1.172892, 0, 0, 0, 1, 1,
2.44502, -0.1122731, 0.6064075, 0, 0, 0, 1, 1,
2.46858, -1.533109, 2.816389, 0, 0, 0, 1, 1,
2.504285, -0.6054618, 1.015101, 1, 1, 1, 1, 1,
2.839309, -0.965253, 2.727147, 1, 1, 1, 1, 1,
2.847882, 0.5592671, 2.740524, 1, 1, 1, 1, 1,
2.869775, 0.1244365, 0.6135837, 1, 1, 1, 1, 1,
2.939052, -1.343392, 2.014817, 1, 1, 1, 1, 1,
2.949562, 0.4777545, 1.077081, 1, 1, 1, 1, 1,
3.048793, 0.2997622, -0.2256515, 1, 1, 1, 1, 1
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
var radius = 9.642901;
var distance = 33.87029;
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
mvMatrix.translate( -0.2218926, -0.09656072, 0.2150881 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87029);
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
