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
-3.235632, 1.402406, -1.708957, 1, 0, 0, 1,
-2.980681, -0.006482, -1.898664, 1, 0.007843138, 0, 1,
-2.787212, 0.3348488, -2.73324, 1, 0.01176471, 0, 1,
-2.68114, 1.830303, -0.9815873, 1, 0.01960784, 0, 1,
-2.602699, 1.157063, -1.664127, 1, 0.02352941, 0, 1,
-2.528157, -0.003924442, -2.312546, 1, 0.03137255, 0, 1,
-2.517115, 0.8891455, 0.4358925, 1, 0.03529412, 0, 1,
-2.457222, 0.7571605, -1.604325, 1, 0.04313726, 0, 1,
-2.427429, 1.434558, 0.2700203, 1, 0.04705882, 0, 1,
-2.423791, 0.1630795, -1.756826, 1, 0.05490196, 0, 1,
-2.341187, 1.326538, 0.06378012, 1, 0.05882353, 0, 1,
-2.315799, -1.710209, -1.457565, 1, 0.06666667, 0, 1,
-2.201338, 0.2763775, -0.7842658, 1, 0.07058824, 0, 1,
-2.194157, -0.8983557, -2.592574, 1, 0.07843138, 0, 1,
-2.194074, 0.4705248, -2.112867, 1, 0.08235294, 0, 1,
-2.176933, 0.5543402, 0.006143142, 1, 0.09019608, 0, 1,
-2.149443, 1.709053, -2.370173, 1, 0.09411765, 0, 1,
-2.132635, 1.897671, -1.081874, 1, 0.1019608, 0, 1,
-2.092289, -0.6932924, -4.048139, 1, 0.1098039, 0, 1,
-2.059312, 0.5699971, -1.009025, 1, 0.1137255, 0, 1,
-1.958922, 0.5627975, 0.02507717, 1, 0.1215686, 0, 1,
-1.956107, -0.4532565, -2.526322, 1, 0.1254902, 0, 1,
-1.953928, -1.778186, -1.821804, 1, 0.1333333, 0, 1,
-1.929465, 0.05177433, -2.39881, 1, 0.1372549, 0, 1,
-1.914889, -0.7299643, -3.058858, 1, 0.145098, 0, 1,
-1.882311, -0.359475, -2.18564, 1, 0.1490196, 0, 1,
-1.881512, 0.2575651, -2.654887, 1, 0.1568628, 0, 1,
-1.878597, 1.095942, -1.798386, 1, 0.1607843, 0, 1,
-1.868248, -1.050733, 0.3079438, 1, 0.1686275, 0, 1,
-1.858333, 1.846253, -1.792714, 1, 0.172549, 0, 1,
-1.854274, -0.03712727, -1.298015, 1, 0.1803922, 0, 1,
-1.851888, 1.08127, -2.034424, 1, 0.1843137, 0, 1,
-1.842335, 0.5865251, -1.970055, 1, 0.1921569, 0, 1,
-1.825374, 0.04180028, -1.4321, 1, 0.1960784, 0, 1,
-1.808856, -2.372191, -2.056924, 1, 0.2039216, 0, 1,
-1.807442, -0.02248661, 0.0684837, 1, 0.2117647, 0, 1,
-1.798792, -1.067948, -2.953405, 1, 0.2156863, 0, 1,
-1.798485, 1.350071, 0.565663, 1, 0.2235294, 0, 1,
-1.784175, -1.112777, -2.379974, 1, 0.227451, 0, 1,
-1.770695, 0.3715514, -0.9191505, 1, 0.2352941, 0, 1,
-1.750049, -1.284565, -0.8288972, 1, 0.2392157, 0, 1,
-1.750028, -0.35681, -4.079196, 1, 0.2470588, 0, 1,
-1.729437, -0.2726023, -1.030923, 1, 0.2509804, 0, 1,
-1.72649, 0.2776039, -3.499096, 1, 0.2588235, 0, 1,
-1.707445, -0.1413406, -2.200753, 1, 0.2627451, 0, 1,
-1.690316, 0.2495166, -2.820467, 1, 0.2705882, 0, 1,
-1.676129, -0.8502622, -1.418802, 1, 0.2745098, 0, 1,
-1.66616, -0.1569572, -1.928071, 1, 0.282353, 0, 1,
-1.664128, -0.001058236, -1.493804, 1, 0.2862745, 0, 1,
-1.663626, 2.065457, 0.1391056, 1, 0.2941177, 0, 1,
-1.635145, 0.5028993, -2.850986, 1, 0.3019608, 0, 1,
-1.628005, 0.3914781, -2.104164, 1, 0.3058824, 0, 1,
-1.625744, 0.1434427, -0.5996019, 1, 0.3137255, 0, 1,
-1.621106, -0.1043271, -1.945152, 1, 0.3176471, 0, 1,
-1.618311, 0.853878, -1.268257, 1, 0.3254902, 0, 1,
-1.615468, -0.1840898, -0.8347363, 1, 0.3294118, 0, 1,
-1.612241, 0.05219421, -1.432763, 1, 0.3372549, 0, 1,
-1.610239, -1.076097, -0.8574534, 1, 0.3411765, 0, 1,
-1.607214, 0.1435635, -0.2799166, 1, 0.3490196, 0, 1,
-1.605711, 1.105401, 0.3371013, 1, 0.3529412, 0, 1,
-1.604884, 0.2650196, -1.638807, 1, 0.3607843, 0, 1,
-1.600411, 0.2554539, -1.981056, 1, 0.3647059, 0, 1,
-1.599808, -0.3723503, -2.870406, 1, 0.372549, 0, 1,
-1.599808, -1.343806, -1.868721, 1, 0.3764706, 0, 1,
-1.598945, -0.08927348, -2.23747, 1, 0.3843137, 0, 1,
-1.598442, 0.7208881, 0.06415944, 1, 0.3882353, 0, 1,
-1.59725, 0.6526855, -1.017622, 1, 0.3960784, 0, 1,
-1.596477, -0.1696774, -2.167833, 1, 0.4039216, 0, 1,
-1.591043, 0.2480493, 0.04611737, 1, 0.4078431, 0, 1,
-1.590592, -0.615575, -2.814002, 1, 0.4156863, 0, 1,
-1.590176, -0.4738652, -0.01508029, 1, 0.4196078, 0, 1,
-1.567242, -1.160001, -3.060768, 1, 0.427451, 0, 1,
-1.561457, -1.31262, -2.951699, 1, 0.4313726, 0, 1,
-1.55683, -1.67367, -3.960199, 1, 0.4392157, 0, 1,
-1.548515, -0.4695006, -2.327252, 1, 0.4431373, 0, 1,
-1.539534, 0.0684379, -0.9481316, 1, 0.4509804, 0, 1,
-1.526933, -0.7721082, -1.02272, 1, 0.454902, 0, 1,
-1.522928, 1.372086, 0.1782813, 1, 0.4627451, 0, 1,
-1.521409, 0.7749975, -1.513585, 1, 0.4666667, 0, 1,
-1.51564, 1.311808, -1.818486, 1, 0.4745098, 0, 1,
-1.507396, 1.61808, -1.700136, 1, 0.4784314, 0, 1,
-1.502039, 0.4201615, -1.578292, 1, 0.4862745, 0, 1,
-1.495008, -0.3517417, -0.8922414, 1, 0.4901961, 0, 1,
-1.492978, 0.5986769, -0.6833841, 1, 0.4980392, 0, 1,
-1.4828, -0.7379785, -0.9325652, 1, 0.5058824, 0, 1,
-1.469398, 1.515551, 0.09306245, 1, 0.509804, 0, 1,
-1.467768, -0.07555792, -4.162553, 1, 0.5176471, 0, 1,
-1.466212, -0.2098299, -1.950078, 1, 0.5215687, 0, 1,
-1.458115, -0.9346811, -2.055723, 1, 0.5294118, 0, 1,
-1.450515, 0.952908, -1.262331, 1, 0.5333334, 0, 1,
-1.445067, -0.3136328, -1.671211, 1, 0.5411765, 0, 1,
-1.442049, -1.563685, -2.862536, 1, 0.5450981, 0, 1,
-1.434259, -0.08645824, -0.643244, 1, 0.5529412, 0, 1,
-1.418409, -0.5084177, -3.722056, 1, 0.5568628, 0, 1,
-1.407585, 0.2380314, -0.128757, 1, 0.5647059, 0, 1,
-1.392089, 0.05074354, -1.129987, 1, 0.5686275, 0, 1,
-1.389646, -1.623738, -2.26627, 1, 0.5764706, 0, 1,
-1.389106, -1.908776, -1.729012, 1, 0.5803922, 0, 1,
-1.380173, 0.4693653, -0.2971642, 1, 0.5882353, 0, 1,
-1.361264, 0.9491101, -2.146687, 1, 0.5921569, 0, 1,
-1.361002, -0.2749591, -2.275251, 1, 0.6, 0, 1,
-1.356111, -0.6611395, -1.588513, 1, 0.6078432, 0, 1,
-1.353454, -0.8711509, -1.568642, 1, 0.6117647, 0, 1,
-1.350863, 0.102244, -1.885125, 1, 0.6196079, 0, 1,
-1.331114, 0.431669, -0.6960239, 1, 0.6235294, 0, 1,
-1.325418, 0.3901947, -2.512518, 1, 0.6313726, 0, 1,
-1.319166, -0.5894358, -3.325353, 1, 0.6352941, 0, 1,
-1.315735, 0.5751182, -1.002277, 1, 0.6431373, 0, 1,
-1.315218, -2.177945, -3.928601, 1, 0.6470588, 0, 1,
-1.313295, 0.4765804, -1.312063, 1, 0.654902, 0, 1,
-1.312359, -0.5630015, -1.108597, 1, 0.6588235, 0, 1,
-1.311777, -0.4527282, -0.8846388, 1, 0.6666667, 0, 1,
-1.288642, 0.3278526, -0.3532239, 1, 0.6705883, 0, 1,
-1.279049, 1.286981, -0.08033989, 1, 0.6784314, 0, 1,
-1.268869, 0.5860928, -2.022744, 1, 0.682353, 0, 1,
-1.263692, -0.2811589, -1.883521, 1, 0.6901961, 0, 1,
-1.261834, -0.1739831, -2.623971, 1, 0.6941177, 0, 1,
-1.252845, 1.110355, -1.137904, 1, 0.7019608, 0, 1,
-1.252449, 0.270331, 0.002038642, 1, 0.7098039, 0, 1,
-1.251889, 0.5723997, -1.032573, 1, 0.7137255, 0, 1,
-1.239774, -0.1822205, -2.482107, 1, 0.7215686, 0, 1,
-1.237231, 0.7201299, -1.013631, 1, 0.7254902, 0, 1,
-1.228203, 0.5916185, -0.2262376, 1, 0.7333333, 0, 1,
-1.221738, 0.3352405, -1.202061, 1, 0.7372549, 0, 1,
-1.213838, -2.771036, -3.595296, 1, 0.7450981, 0, 1,
-1.209525, 0.134568, -1.159058, 1, 0.7490196, 0, 1,
-1.199764, 1.898897, -0.08204448, 1, 0.7568628, 0, 1,
-1.198154, -0.3595216, 0.9212549, 1, 0.7607843, 0, 1,
-1.195881, -0.2927356, -2.227212, 1, 0.7686275, 0, 1,
-1.190476, -0.01411377, -2.339719, 1, 0.772549, 0, 1,
-1.187407, 1.272798, -1.233047, 1, 0.7803922, 0, 1,
-1.185782, 1.062883, -2.448654, 1, 0.7843137, 0, 1,
-1.18279, -1.530414, -3.568347, 1, 0.7921569, 0, 1,
-1.177916, -0.09662085, -1.009985, 1, 0.7960784, 0, 1,
-1.17491, -0.8423387, -1.401166, 1, 0.8039216, 0, 1,
-1.167397, -0.9506865, -1.818209, 1, 0.8117647, 0, 1,
-1.166703, 1.50958, -2.610892, 1, 0.8156863, 0, 1,
-1.156539, 0.5760581, -1.325841, 1, 0.8235294, 0, 1,
-1.148846, 0.409291, -3.167049, 1, 0.827451, 0, 1,
-1.138603, -0.3320039, -0.2078943, 1, 0.8352941, 0, 1,
-1.134105, -0.3594147, -2.464568, 1, 0.8392157, 0, 1,
-1.129198, -0.5585905, -2.961159, 1, 0.8470588, 0, 1,
-1.126085, -0.7735355, -2.544766, 1, 0.8509804, 0, 1,
-1.122952, -0.08710335, -1.61365, 1, 0.8588235, 0, 1,
-1.121577, -1.086545, -1.087696, 1, 0.8627451, 0, 1,
-1.121347, -0.02985574, -1.628262, 1, 0.8705882, 0, 1,
-1.118987, 0.652262, -1.634755, 1, 0.8745098, 0, 1,
-1.118872, -2.605062, -3.59404, 1, 0.8823529, 0, 1,
-1.113101, -1.145442, -2.515223, 1, 0.8862745, 0, 1,
-1.111701, 0.4461668, -0.7882407, 1, 0.8941177, 0, 1,
-1.109866, -0.7121951, -3.487476, 1, 0.8980392, 0, 1,
-1.108249, 1.66655, -0.3733671, 1, 0.9058824, 0, 1,
-1.102516, -0.2974159, -1.883853, 1, 0.9137255, 0, 1,
-1.101503, 0.004373949, -2.018107, 1, 0.9176471, 0, 1,
-1.096078, -0.156714, -0.3124813, 1, 0.9254902, 0, 1,
-1.085212, -1.348174, -1.172517, 1, 0.9294118, 0, 1,
-1.069708, 1.161103, 0.4250376, 1, 0.9372549, 0, 1,
-1.069271, 1.313551, -0.9512242, 1, 0.9411765, 0, 1,
-1.064746, 2.171697, -1.138387, 1, 0.9490196, 0, 1,
-1.06231, 0.5124701, 0.136089, 1, 0.9529412, 0, 1,
-1.060592, -1.007255, -4.301707, 1, 0.9607843, 0, 1,
-1.055732, -0.3848137, -2.651556, 1, 0.9647059, 0, 1,
-1.053773, -0.4495678, -1.466361, 1, 0.972549, 0, 1,
-1.052873, 1.525476, -0.1405836, 1, 0.9764706, 0, 1,
-1.051445, 1.581093, -0.8480638, 1, 0.9843137, 0, 1,
-1.04968, -1.235467, -3.066614, 1, 0.9882353, 0, 1,
-1.047342, -1.238501, -3.000849, 1, 0.9960784, 0, 1,
-1.044276, 1.964249, -0.3424335, 0.9960784, 1, 0, 1,
-1.040148, 0.2968354, -0.5594728, 0.9921569, 1, 0, 1,
-1.031805, 1.430183, -1.02879, 0.9843137, 1, 0, 1,
-1.027704, 1.026239, 0.1445258, 0.9803922, 1, 0, 1,
-1.025225, 1.152117, -0.3147224, 0.972549, 1, 0, 1,
-1.020821, -0.8345782, -1.582128, 0.9686275, 1, 0, 1,
-1.019605, 0.07320099, -1.410841, 0.9607843, 1, 0, 1,
-1.015393, -1.343163, -3.394001, 0.9568627, 1, 0, 1,
-1.00896, -0.1873413, -2.271141, 0.9490196, 1, 0, 1,
-1.007867, -0.2436407, -1.340487, 0.945098, 1, 0, 1,
-1.001315, 0.3469867, -0.00218199, 0.9372549, 1, 0, 1,
-0.9985239, -0.8491942, -4.906084, 0.9333333, 1, 0, 1,
-0.9975877, 1.594685, -2.258666, 0.9254902, 1, 0, 1,
-0.9962082, -1.991455, -3.963019, 0.9215686, 1, 0, 1,
-0.9919789, -0.4029118, -0.4650034, 0.9137255, 1, 0, 1,
-0.9884745, -0.7291194, -2.686635, 0.9098039, 1, 0, 1,
-0.9768604, -0.08893342, -2.354769, 0.9019608, 1, 0, 1,
-0.97632, -1.186205, -3.968908, 0.8941177, 1, 0, 1,
-0.9762515, 1.400308, 0.5176064, 0.8901961, 1, 0, 1,
-0.9740841, -0.6607144, -2.512497, 0.8823529, 1, 0, 1,
-0.97213, -0.4340941, -0.2712162, 0.8784314, 1, 0, 1,
-0.9681303, -0.2380867, -2.196709, 0.8705882, 1, 0, 1,
-0.9670213, 0.5551952, -1.930901, 0.8666667, 1, 0, 1,
-0.9643651, -1.30394, -4.128269, 0.8588235, 1, 0, 1,
-0.9637813, -0.2057806, -2.104507, 0.854902, 1, 0, 1,
-0.9614518, -0.3974129, -3.655931, 0.8470588, 1, 0, 1,
-0.951008, 1.461395, -1.884338, 0.8431373, 1, 0, 1,
-0.9499456, -0.8302284, -4.811679, 0.8352941, 1, 0, 1,
-0.9483587, -0.5309874, -3.772852, 0.8313726, 1, 0, 1,
-0.9426574, 1.281461, -1.529399, 0.8235294, 1, 0, 1,
-0.9366347, 0.2666134, -0.8292812, 0.8196079, 1, 0, 1,
-0.931587, 0.1192888, -0.2410771, 0.8117647, 1, 0, 1,
-0.9301558, -0.4238823, -2.5618, 0.8078431, 1, 0, 1,
-0.9294227, 0.6037518, -0.9774123, 0.8, 1, 0, 1,
-0.927709, -0.5160529, -2.071388, 0.7921569, 1, 0, 1,
-0.9245755, 0.8089808, -1.703954, 0.7882353, 1, 0, 1,
-0.9228894, -0.9780623, -2.193074, 0.7803922, 1, 0, 1,
-0.9214095, -1.621118, -1.60562, 0.7764706, 1, 0, 1,
-0.9175262, -0.2252437, -0.9011204, 0.7686275, 1, 0, 1,
-0.9174302, -1.916877, -2.964915, 0.7647059, 1, 0, 1,
-0.9088761, 0.9844949, -2.925136, 0.7568628, 1, 0, 1,
-0.8969432, -0.2456375, -2.858442, 0.7529412, 1, 0, 1,
-0.8931254, -0.06619526, -1.355497, 0.7450981, 1, 0, 1,
-0.8913134, -0.08195947, -2.052462, 0.7411765, 1, 0, 1,
-0.8911256, 0.3500865, -1.008893, 0.7333333, 1, 0, 1,
-0.8904229, -0.5582337, -1.916279, 0.7294118, 1, 0, 1,
-0.8864939, -0.1969525, -1.486936, 0.7215686, 1, 0, 1,
-0.885716, -0.06103156, -3.604493, 0.7176471, 1, 0, 1,
-0.8835224, -0.9110422, -2.495521, 0.7098039, 1, 0, 1,
-0.8783805, 0.01261649, -2.069398, 0.7058824, 1, 0, 1,
-0.8783703, -0.7000161, -1.702742, 0.6980392, 1, 0, 1,
-0.8750979, -2.770549, -1.968047, 0.6901961, 1, 0, 1,
-0.8748401, 0.5844653, 0.1793359, 0.6862745, 1, 0, 1,
-0.8715573, 0.177744, -1.595628, 0.6784314, 1, 0, 1,
-0.8664978, -0.5882202, -1.342294, 0.6745098, 1, 0, 1,
-0.858193, 0.7088906, -0.6045818, 0.6666667, 1, 0, 1,
-0.8545108, -1.156854, -2.853617, 0.6627451, 1, 0, 1,
-0.8477589, -0.5587741, -1.44523, 0.654902, 1, 0, 1,
-0.8471716, -1.088587, -4.208258, 0.6509804, 1, 0, 1,
-0.8457987, -1.539459, -1.009, 0.6431373, 1, 0, 1,
-0.8419334, -0.3123413, -3.015312, 0.6392157, 1, 0, 1,
-0.8411013, -0.8221071, -1.284643, 0.6313726, 1, 0, 1,
-0.8401886, 0.4357006, -0.9293671, 0.627451, 1, 0, 1,
-0.8318645, 0.8724561, 0.1693, 0.6196079, 1, 0, 1,
-0.8315242, -1.838811, -2.400776, 0.6156863, 1, 0, 1,
-0.82831, 0.1902417, -3.554295, 0.6078432, 1, 0, 1,
-0.8253136, 0.7543741, -0.07501274, 0.6039216, 1, 0, 1,
-0.8247099, 0.5893018, -1.407701, 0.5960785, 1, 0, 1,
-0.8231819, 0.187545, -2.282782, 0.5882353, 1, 0, 1,
-0.8197764, 0.651187, -1.185008, 0.5843138, 1, 0, 1,
-0.81238, -1.434582, -2.566623, 0.5764706, 1, 0, 1,
-0.8121633, -1.328103, -3.870137, 0.572549, 1, 0, 1,
-0.8106274, -0.169152, -0.207383, 0.5647059, 1, 0, 1,
-0.806447, -0.9066195, -2.266561, 0.5607843, 1, 0, 1,
-0.8050502, 0.6598169, -1.650776, 0.5529412, 1, 0, 1,
-0.8040808, -0.03263568, -2.010561, 0.5490196, 1, 0, 1,
-0.8011068, -0.3622312, -2.558487, 0.5411765, 1, 0, 1,
-0.7997866, 0.783334, -0.7723108, 0.5372549, 1, 0, 1,
-0.7955415, 0.7140378, -1.872161, 0.5294118, 1, 0, 1,
-0.7936899, -2.067179, -1.630274, 0.5254902, 1, 0, 1,
-0.7925963, -1.76081, -3.41396, 0.5176471, 1, 0, 1,
-0.7914851, -1.066936, -2.495489, 0.5137255, 1, 0, 1,
-0.7908415, 2.657529, -0.2976512, 0.5058824, 1, 0, 1,
-0.7888763, -0.3493895, -2.789395, 0.5019608, 1, 0, 1,
-0.7856488, 1.216658, -1.226382, 0.4941176, 1, 0, 1,
-0.7838909, 0.7899415, -2.134669, 0.4862745, 1, 0, 1,
-0.7746531, -1.242926, -4.70476, 0.4823529, 1, 0, 1,
-0.7662366, -1.323111, -0.3412837, 0.4745098, 1, 0, 1,
-0.761863, 0.6520969, -0.9723918, 0.4705882, 1, 0, 1,
-0.7617674, 0.6103875, -1.013619, 0.4627451, 1, 0, 1,
-0.7591597, -0.9432629, -4.58787, 0.4588235, 1, 0, 1,
-0.7584413, -0.8142178, -4.253775, 0.4509804, 1, 0, 1,
-0.7547684, -0.1391889, -1.348748, 0.4470588, 1, 0, 1,
-0.7518812, 0.9179225, -0.6107132, 0.4392157, 1, 0, 1,
-0.7447528, 1.041322, -0.5635574, 0.4352941, 1, 0, 1,
-0.7375817, 0.1641349, -1.585629, 0.427451, 1, 0, 1,
-0.7355088, -0.1583128, -1.049381, 0.4235294, 1, 0, 1,
-0.722888, -1.299405, -2.899352, 0.4156863, 1, 0, 1,
-0.7226432, 0.5325383, -0.5242038, 0.4117647, 1, 0, 1,
-0.7174174, -0.5388224, -3.47774, 0.4039216, 1, 0, 1,
-0.7102988, -0.9119837, -3.364288, 0.3960784, 1, 0, 1,
-0.7025142, 0.5988061, -0.5067834, 0.3921569, 1, 0, 1,
-0.7019975, 0.7422504, -1.727877, 0.3843137, 1, 0, 1,
-0.7006003, 0.2375339, -1.711664, 0.3803922, 1, 0, 1,
-0.6995584, 0.4398568, -1.313946, 0.372549, 1, 0, 1,
-0.6975313, 1.284747, 0.3227837, 0.3686275, 1, 0, 1,
-0.6946595, 2.326102, -0.9799381, 0.3607843, 1, 0, 1,
-0.6788813, 0.5013793, -2.626215, 0.3568628, 1, 0, 1,
-0.6781337, -0.7450565, -1.989811, 0.3490196, 1, 0, 1,
-0.6774698, -0.1515985, -1.380373, 0.345098, 1, 0, 1,
-0.6737835, -1.374152, -2.718186, 0.3372549, 1, 0, 1,
-0.6714913, -0.4034925, -3.711794, 0.3333333, 1, 0, 1,
-0.6701587, 0.1257341, 0.5260707, 0.3254902, 1, 0, 1,
-0.6671811, -0.3979391, -2.641875, 0.3215686, 1, 0, 1,
-0.6661006, -1.496977, -1.637002, 0.3137255, 1, 0, 1,
-0.6641065, 0.4478329, -0.4046689, 0.3098039, 1, 0, 1,
-0.6629482, -1.469263, -5.534933, 0.3019608, 1, 0, 1,
-0.6583001, 1.274651, -2.076108, 0.2941177, 1, 0, 1,
-0.6580701, -0.71533, -1.11576, 0.2901961, 1, 0, 1,
-0.6549327, 1.172921, -0.1375931, 0.282353, 1, 0, 1,
-0.6521813, -0.7619104, -0.9451457, 0.2784314, 1, 0, 1,
-0.6516429, -0.6480357, -2.4357, 0.2705882, 1, 0, 1,
-0.6453903, 0.4432095, -0.6603506, 0.2666667, 1, 0, 1,
-0.6404187, -0.9213498, -1.638389, 0.2588235, 1, 0, 1,
-0.6326485, -0.3079303, -4.46593, 0.254902, 1, 0, 1,
-0.6275403, 0.448082, -0.8595604, 0.2470588, 1, 0, 1,
-0.6243218, 0.06179604, -1.485945, 0.2431373, 1, 0, 1,
-0.6219053, -1.178295, -1.791108, 0.2352941, 1, 0, 1,
-0.6210726, -1.044813, -1.989507, 0.2313726, 1, 0, 1,
-0.6189843, 0.6435281, -1.011004, 0.2235294, 1, 0, 1,
-0.6188743, -0.8471772, -2.576975, 0.2196078, 1, 0, 1,
-0.616282, 0.7450519, -0.492894, 0.2117647, 1, 0, 1,
-0.6082792, 1.22031, -1.030841, 0.2078431, 1, 0, 1,
-0.5986203, -0.7211038, -2.26398, 0.2, 1, 0, 1,
-0.5946226, 1.41449, 0.02045831, 0.1921569, 1, 0, 1,
-0.5919311, 0.6512965, -0.0263869, 0.1882353, 1, 0, 1,
-0.5837262, 0.2034268, -1.953393, 0.1803922, 1, 0, 1,
-0.5834308, 0.6999711, 1.301339, 0.1764706, 1, 0, 1,
-0.5826696, 0.3897511, -1.926469, 0.1686275, 1, 0, 1,
-0.582005, -1.080461, -2.644594, 0.1647059, 1, 0, 1,
-0.576826, 0.9911597, -0.6827157, 0.1568628, 1, 0, 1,
-0.5761468, 0.05459436, -0.5361056, 0.1529412, 1, 0, 1,
-0.5733341, 0.41866, -0.2687108, 0.145098, 1, 0, 1,
-0.5688255, -0.6071142, -1.564829, 0.1411765, 1, 0, 1,
-0.562972, -0.6364459, -1.119825, 0.1333333, 1, 0, 1,
-0.5591719, -0.3502229, -1.260508, 0.1294118, 1, 0, 1,
-0.5582994, -1.027299, -3.309427, 0.1215686, 1, 0, 1,
-0.552988, 1.228008, -1.189094, 0.1176471, 1, 0, 1,
-0.5458857, -0.1143613, -0.104092, 0.1098039, 1, 0, 1,
-0.5451666, -0.7501289, -4.505241, 0.1058824, 1, 0, 1,
-0.5422933, 1.485908, 0.2004204, 0.09803922, 1, 0, 1,
-0.5380524, 0.9664537, -0.3439665, 0.09019608, 1, 0, 1,
-0.5374521, 0.1686596, -1.579773, 0.08627451, 1, 0, 1,
-0.5353166, -1.658186, -2.359601, 0.07843138, 1, 0, 1,
-0.5344434, -0.5006542, -1.344936, 0.07450981, 1, 0, 1,
-0.5329934, -1.164353, -3.332026, 0.06666667, 1, 0, 1,
-0.5239435, 0.9034994, -1.837565, 0.0627451, 1, 0, 1,
-0.520947, -0.9044256, -1.717711, 0.05490196, 1, 0, 1,
-0.5171124, 0.7563153, -2.585284, 0.05098039, 1, 0, 1,
-0.5160282, -1.279023, -2.774415, 0.04313726, 1, 0, 1,
-0.5146544, 0.7232269, 0.6088203, 0.03921569, 1, 0, 1,
-0.5046261, -0.5781139, -1.977192, 0.03137255, 1, 0, 1,
-0.5031536, 0.6482261, -1.2013, 0.02745098, 1, 0, 1,
-0.500982, -1.565466, -3.688091, 0.01960784, 1, 0, 1,
-0.4982893, 0.4808073, -0.762616, 0.01568628, 1, 0, 1,
-0.4939328, 0.003137739, -1.971618, 0.007843138, 1, 0, 1,
-0.4931477, 0.3548106, 0.04089395, 0.003921569, 1, 0, 1,
-0.4915547, -0.8803205, -2.049745, 0, 1, 0.003921569, 1,
-0.4904386, -0.01037551, -3.241482, 0, 1, 0.01176471, 1,
-0.4903869, 0.8174245, -0.8917707, 0, 1, 0.01568628, 1,
-0.4883473, -0.3929319, -3.832217, 0, 1, 0.02352941, 1,
-0.4881238, -2.340816, -4.12269, 0, 1, 0.02745098, 1,
-0.4869939, 1.020395, -0.3905295, 0, 1, 0.03529412, 1,
-0.4842453, 0.3358732, -0.5969821, 0, 1, 0.03921569, 1,
-0.4814608, -0.4466207, -1.552096, 0, 1, 0.04705882, 1,
-0.4807722, -1.565197, -5.485241, 0, 1, 0.05098039, 1,
-0.4731341, -0.7829434, -3.792079, 0, 1, 0.05882353, 1,
-0.4571498, 0.1652354, -0.2205509, 0, 1, 0.0627451, 1,
-0.4552548, -0.8232226, -2.961923, 0, 1, 0.07058824, 1,
-0.4546308, 0.3517479, -0.1341498, 0, 1, 0.07450981, 1,
-0.4495668, 1.52481, 0.8309076, 0, 1, 0.08235294, 1,
-0.4493622, 0.9855337, 0.2651168, 0, 1, 0.08627451, 1,
-0.4486878, 1.908566, 0.2072359, 0, 1, 0.09411765, 1,
-0.445988, -0.1414182, -1.50126, 0, 1, 0.1019608, 1,
-0.4454706, -0.1157134, -1.405418, 0, 1, 0.1058824, 1,
-0.4414327, 0.1661754, -1.633633, 0, 1, 0.1137255, 1,
-0.4405235, 2.678907, 1.565918, 0, 1, 0.1176471, 1,
-0.4369375, 0.8456656, -1.100101, 0, 1, 0.1254902, 1,
-0.4354947, -0.186292, -2.672586, 0, 1, 0.1294118, 1,
-0.4334854, 1.827146, -0.8153215, 0, 1, 0.1372549, 1,
-0.4276156, 0.5120689, 0.8637217, 0, 1, 0.1411765, 1,
-0.4273274, -1.032547, -2.387633, 0, 1, 0.1490196, 1,
-0.4183619, 1.272056, -1.761556, 0, 1, 0.1529412, 1,
-0.4178543, 0.4043335, 0.3195838, 0, 1, 0.1607843, 1,
-0.4173995, 1.316006, -0.2794866, 0, 1, 0.1647059, 1,
-0.4071043, 0.5728534, -0.7197125, 0, 1, 0.172549, 1,
-0.4056275, -2.745179, -3.867187, 0, 1, 0.1764706, 1,
-0.4051061, 1.055993, 1.348821, 0, 1, 0.1843137, 1,
-0.4030248, -1.536617, -3.636985, 0, 1, 0.1882353, 1,
-0.4016491, 0.1929583, -0.8395575, 0, 1, 0.1960784, 1,
-0.4006769, 0.02089237, -4.394625, 0, 1, 0.2039216, 1,
-0.3941899, -0.4312165, -2.426119, 0, 1, 0.2078431, 1,
-0.391196, 0.1493754, -2.231667, 0, 1, 0.2156863, 1,
-0.3799315, 0.5625226, 0.4179196, 0, 1, 0.2196078, 1,
-0.379696, -0.1732637, -1.170966, 0, 1, 0.227451, 1,
-0.3756428, -0.2455578, -0.9380952, 0, 1, 0.2313726, 1,
-0.3735346, -0.4752457, -2.814594, 0, 1, 0.2392157, 1,
-0.3733208, 1.47315, -1.165744, 0, 1, 0.2431373, 1,
-0.3729628, 0.3455677, 0.3043145, 0, 1, 0.2509804, 1,
-0.3726317, 0.2565996, -1.151326, 0, 1, 0.254902, 1,
-0.3706415, -0.5536109, -3.203225, 0, 1, 0.2627451, 1,
-0.3637294, 0.5489558, -0.2003445, 0, 1, 0.2666667, 1,
-0.3565903, -0.5115684, -4.918495, 0, 1, 0.2745098, 1,
-0.3548135, -1.19213, -3.110147, 0, 1, 0.2784314, 1,
-0.3523206, -0.6934224, -3.321157, 0, 1, 0.2862745, 1,
-0.3517469, -0.7485199, -3.642016, 0, 1, 0.2901961, 1,
-0.3491776, 1.590359, -0.9725656, 0, 1, 0.2980392, 1,
-0.3456482, -1.006838, -2.252404, 0, 1, 0.3058824, 1,
-0.3434919, -2.132658, -1.551063, 0, 1, 0.3098039, 1,
-0.3430658, 0.557896, -1.545066, 0, 1, 0.3176471, 1,
-0.3414749, -1.363771, -4.092015, 0, 1, 0.3215686, 1,
-0.3336198, 0.6466264, -1.045391, 0, 1, 0.3294118, 1,
-0.3330291, -0.5211575, -0.7488632, 0, 1, 0.3333333, 1,
-0.3325519, -0.09658878, -1.793294, 0, 1, 0.3411765, 1,
-0.3325067, -0.2663639, -3.292837, 0, 1, 0.345098, 1,
-0.3300584, -0.2038617, -1.197932, 0, 1, 0.3529412, 1,
-0.3281215, -1.064417, -3.676072, 0, 1, 0.3568628, 1,
-0.3276126, -1.573368, -2.295726, 0, 1, 0.3647059, 1,
-0.3235314, 1.240596, -1.441661, 0, 1, 0.3686275, 1,
-0.3225567, 1.20454, -0.1084625, 0, 1, 0.3764706, 1,
-0.3217772, 0.6853115, -0.6861355, 0, 1, 0.3803922, 1,
-0.3190964, -1.180923, -0.9517644, 0, 1, 0.3882353, 1,
-0.3169046, 0.431202, -0.8890013, 0, 1, 0.3921569, 1,
-0.3157861, -0.6362262, -3.208795, 0, 1, 0.4, 1,
-0.2991133, 0.1218255, -0.8961517, 0, 1, 0.4078431, 1,
-0.29263, -1.340053, -3.317997, 0, 1, 0.4117647, 1,
-0.2818011, -1.467511, -4.3029, 0, 1, 0.4196078, 1,
-0.2736556, 0.8164173, -1.835708, 0, 1, 0.4235294, 1,
-0.270961, 0.6056129, -1.866322, 0, 1, 0.4313726, 1,
-0.2624825, -0.05256109, -2.802165, 0, 1, 0.4352941, 1,
-0.2611014, 2.402104, -0.7622876, 0, 1, 0.4431373, 1,
-0.2566473, -1.247875, -2.102929, 0, 1, 0.4470588, 1,
-0.2533787, -0.1767474, -2.589629, 0, 1, 0.454902, 1,
-0.2522769, -0.680644, -2.026386, 0, 1, 0.4588235, 1,
-0.2496753, -1.299842, -3.039188, 0, 1, 0.4666667, 1,
-0.2454824, -1.172499, -1.941645, 0, 1, 0.4705882, 1,
-0.2421395, 1.021248, 0.4531021, 0, 1, 0.4784314, 1,
-0.2402048, -1.358941, -1.493138, 0, 1, 0.4823529, 1,
-0.2348293, 1.65616, 0.1174632, 0, 1, 0.4901961, 1,
-0.2274296, -0.1409277, -3.25873, 0, 1, 0.4941176, 1,
-0.222791, 1.772809, -2.156686, 0, 1, 0.5019608, 1,
-0.2223207, 1.404726, 0.2768116, 0, 1, 0.509804, 1,
-0.2197433, 1.735093, 0.2673513, 0, 1, 0.5137255, 1,
-0.2159611, -0.810443, -2.544406, 0, 1, 0.5215687, 1,
-0.2135179, -1.268501, -1.856329, 0, 1, 0.5254902, 1,
-0.2111272, -0.5286238, -1.7951, 0, 1, 0.5333334, 1,
-0.208055, -0.7744353, -2.113619, 0, 1, 0.5372549, 1,
-0.2064394, -0.3135941, -2.846635, 0, 1, 0.5450981, 1,
-0.206063, 0.5240833, -0.3199129, 0, 1, 0.5490196, 1,
-0.2040741, 0.3997205, -1.610943, 0, 1, 0.5568628, 1,
-0.202356, -0.0230819, -2.055052, 0, 1, 0.5607843, 1,
-0.1984755, 1.326525, 0.3019833, 0, 1, 0.5686275, 1,
-0.1942585, 0.3751886, -0.09253231, 0, 1, 0.572549, 1,
-0.1935044, 0.25152, 0.7389486, 0, 1, 0.5803922, 1,
-0.1877799, 0.4199902, -0.800632, 0, 1, 0.5843138, 1,
-0.187681, 0.8720592, -3.05293, 0, 1, 0.5921569, 1,
-0.1824853, 0.156095, -0.7282887, 0, 1, 0.5960785, 1,
-0.1746789, 0.2572997, -2.062534, 0, 1, 0.6039216, 1,
-0.174538, -0.6192601, -3.14236, 0, 1, 0.6117647, 1,
-0.1733113, 0.952595, -0.3622381, 0, 1, 0.6156863, 1,
-0.1688388, -1.278708, -3.774858, 0, 1, 0.6235294, 1,
-0.1616258, 2.818999, -0.2365764, 0, 1, 0.627451, 1,
-0.155825, -0.3232687, -2.729322, 0, 1, 0.6352941, 1,
-0.1555512, -0.2974688, -3.039753, 0, 1, 0.6392157, 1,
-0.1533055, 1.558382, -1.193099, 0, 1, 0.6470588, 1,
-0.1511164, -1.117592, -2.593127, 0, 1, 0.6509804, 1,
-0.148318, 0.4685856, 0.05989438, 0, 1, 0.6588235, 1,
-0.1442582, 1.191361, -1.139161, 0, 1, 0.6627451, 1,
-0.1321998, -1.29321, -2.852899, 0, 1, 0.6705883, 1,
-0.1268617, -0.3771952, -1.811717, 0, 1, 0.6745098, 1,
-0.1231719, 1.014107, -0.5561857, 0, 1, 0.682353, 1,
-0.1230927, -1.352582, -3.043595, 0, 1, 0.6862745, 1,
-0.1177555, -2.10763, -2.002776, 0, 1, 0.6941177, 1,
-0.1129701, -1.378068, -2.874439, 0, 1, 0.7019608, 1,
-0.1101663, -0.8162215, -4.291222, 0, 1, 0.7058824, 1,
-0.1065065, 1.329125, 0.4598969, 0, 1, 0.7137255, 1,
-0.1030651, 0.2110854, -1.29221, 0, 1, 0.7176471, 1,
-0.1025867, 0.3020601, 0.4941233, 0, 1, 0.7254902, 1,
-0.1007277, 0.8572544, -1.27033, 0, 1, 0.7294118, 1,
-0.1002785, 1.267131, -0.1429411, 0, 1, 0.7372549, 1,
-0.09570254, 0.7035728, 0.5710967, 0, 1, 0.7411765, 1,
-0.09462924, -0.6483757, -4.588712, 0, 1, 0.7490196, 1,
-0.0941883, -0.4200422, -1.948289, 0, 1, 0.7529412, 1,
-0.09292045, -0.1905685, -2.670971, 0, 1, 0.7607843, 1,
-0.08742943, -0.1857676, -3.228593, 0, 1, 0.7647059, 1,
-0.08680861, 0.3348323, -0.589146, 0, 1, 0.772549, 1,
-0.08526986, -0.3271913, -2.050702, 0, 1, 0.7764706, 1,
-0.08504381, -0.7268926, -3.154016, 0, 1, 0.7843137, 1,
-0.0840489, 0.1633569, -0.3677375, 0, 1, 0.7882353, 1,
-0.08244408, 0.3883903, 0.04977892, 0, 1, 0.7960784, 1,
-0.08206336, -0.5244893, -1.982648, 0, 1, 0.8039216, 1,
-0.07784133, -1.45181, -1.143084, 0, 1, 0.8078431, 1,
-0.06672076, -0.4216803, -4.883798, 0, 1, 0.8156863, 1,
-0.06660329, 1.063845, 0.02241382, 0, 1, 0.8196079, 1,
-0.06624846, -0.9610335, -2.205241, 0, 1, 0.827451, 1,
-0.05968774, 1.508814, 0.5823337, 0, 1, 0.8313726, 1,
-0.05680113, 0.7217841, 1.520628, 0, 1, 0.8392157, 1,
-0.05454564, 0.0007381122, -0.13035, 0, 1, 0.8431373, 1,
-0.05407548, 1.194528, -0.2403579, 0, 1, 0.8509804, 1,
-0.05160926, 0.1071598, -1.844601, 0, 1, 0.854902, 1,
-0.05071647, -0.854939, -4.428262, 0, 1, 0.8627451, 1,
-0.04906172, 0.08608828, -0.8779145, 0, 1, 0.8666667, 1,
-0.04874304, -0.5793828, -3.61828, 0, 1, 0.8745098, 1,
-0.04770952, 0.7666168, 0.2734329, 0, 1, 0.8784314, 1,
-0.04755621, -1.224355, -3.791407, 0, 1, 0.8862745, 1,
-0.04647773, 2.163491, 0.06173079, 0, 1, 0.8901961, 1,
-0.04638289, -0.4800996, -3.034963, 0, 1, 0.8980392, 1,
-0.04012734, -0.2847629, -2.254929, 0, 1, 0.9058824, 1,
-0.03842985, 0.550696, -0.0675232, 0, 1, 0.9098039, 1,
-0.03826513, 0.07022136, -1.069386, 0, 1, 0.9176471, 1,
-0.0382314, -0.7554794, -3.375607, 0, 1, 0.9215686, 1,
-0.03570174, 1.08812, 0.5063305, 0, 1, 0.9294118, 1,
-0.03519642, -1.275544, -3.39707, 0, 1, 0.9333333, 1,
-0.03398093, 2.343605, 0.2371868, 0, 1, 0.9411765, 1,
-0.03334312, -1.507017, -4.069868, 0, 1, 0.945098, 1,
-0.03279736, -0.4591506, -2.887719, 0, 1, 0.9529412, 1,
-0.03145031, -0.1641568, -4.329939, 0, 1, 0.9568627, 1,
-0.03112805, 0.04065454, -0.4780645, 0, 1, 0.9647059, 1,
-0.03084405, -1.42341, -3.26519, 0, 1, 0.9686275, 1,
-0.02971406, -1.100412, -5.094104, 0, 1, 0.9764706, 1,
-0.02820547, -0.04562009, -3.029823, 0, 1, 0.9803922, 1,
-0.02568765, 1.490058, -0.4302112, 0, 1, 0.9882353, 1,
-0.02218616, -0.6960808, -2.582138, 0, 1, 0.9921569, 1,
-0.01786744, 1.700567, -0.8630532, 0, 1, 1, 1,
-0.01715609, 0.3237195, -1.309424, 0, 0.9921569, 1, 1,
-0.01251605, -0.4459958, -4.218523, 0, 0.9882353, 1, 1,
-0.0111714, -0.555995, -2.108743, 0, 0.9803922, 1, 1,
-0.008547616, 0.9181545, 0.8274054, 0, 0.9764706, 1, 1,
-0.007178138, 0.04910368, 0.3303047, 0, 0.9686275, 1, 1,
-0.001948349, -2.060826, -3.723418, 0, 0.9647059, 1, 1,
0.006516322, 2.689359, 1.772674, 0, 0.9568627, 1, 1,
0.006545932, 2.882403, 1.876633, 0, 0.9529412, 1, 1,
0.006970812, 0.5506659, 0.5036393, 0, 0.945098, 1, 1,
0.007648725, 1.362767, 1.570282, 0, 0.9411765, 1, 1,
0.01037652, -0.9585168, 3.514123, 0, 0.9333333, 1, 1,
0.01242135, -0.9887344, 3.06865, 0, 0.9294118, 1, 1,
0.0154491, 1.111283, -1.428681, 0, 0.9215686, 1, 1,
0.01558108, 0.1512732, -0.7697381, 0, 0.9176471, 1, 1,
0.01572073, -0.5014122, 1.563635, 0, 0.9098039, 1, 1,
0.01755, 0.05227314, 2.078784, 0, 0.9058824, 1, 1,
0.01955428, -1.023882, 3.624861, 0, 0.8980392, 1, 1,
0.02104551, -1.475406, 3.11131, 0, 0.8901961, 1, 1,
0.02742381, 0.735564, -0.1661445, 0, 0.8862745, 1, 1,
0.0292586, 0.09512732, -0.9210702, 0, 0.8784314, 1, 1,
0.02959954, 0.5355763, -1.331907, 0, 0.8745098, 1, 1,
0.02963173, -0.8358977, 2.780259, 0, 0.8666667, 1, 1,
0.03138852, -1.310477, 2.340804, 0, 0.8627451, 1, 1,
0.03185262, -0.3511962, 4.902866, 0, 0.854902, 1, 1,
0.03522445, 1.988426, 0.3397581, 0, 0.8509804, 1, 1,
0.03645858, 0.03228112, 2.158836, 0, 0.8431373, 1, 1,
0.03775107, -0.5792, 3.880108, 0, 0.8392157, 1, 1,
0.0420773, -0.7452845, 2.286271, 0, 0.8313726, 1, 1,
0.04317226, -0.01381493, 1.037411, 0, 0.827451, 1, 1,
0.04808154, 0.4628024, 0.7899296, 0, 0.8196079, 1, 1,
0.0530185, -0.699568, 2.477531, 0, 0.8156863, 1, 1,
0.05698121, -0.2288844, 2.514985, 0, 0.8078431, 1, 1,
0.05895043, 2.141985, 0.1587225, 0, 0.8039216, 1, 1,
0.06007375, 1.234498, -0.830962, 0, 0.7960784, 1, 1,
0.06028366, 0.6312066, -0.5732719, 0, 0.7882353, 1, 1,
0.06400674, -0.6036266, 4.875964, 0, 0.7843137, 1, 1,
0.0643338, 2.069652, 1.933462, 0, 0.7764706, 1, 1,
0.06998747, -0.02559631, 2.885935, 0, 0.772549, 1, 1,
0.07301386, -1.017808, 3.457133, 0, 0.7647059, 1, 1,
0.07560546, 0.1951762, 0.6847765, 0, 0.7607843, 1, 1,
0.07562046, 0.4760289, 1.520591, 0, 0.7529412, 1, 1,
0.075721, 0.3690627, -0.3318816, 0, 0.7490196, 1, 1,
0.07724183, -1.27377, 3.123173, 0, 0.7411765, 1, 1,
0.08697598, 1.841309, -0.6539649, 0, 0.7372549, 1, 1,
0.0881079, -0.6844313, 3.540854, 0, 0.7294118, 1, 1,
0.08924522, -1.579562, 3.359406, 0, 0.7254902, 1, 1,
0.0900104, -0.7155363, 2.356153, 0, 0.7176471, 1, 1,
0.09086046, 1.248041, 0.1936834, 0, 0.7137255, 1, 1,
0.09203426, -0.2016151, 0.9680672, 0, 0.7058824, 1, 1,
0.09224284, -2.695635, 0.8532248, 0, 0.6980392, 1, 1,
0.09310667, 1.457653, 1.527844, 0, 0.6941177, 1, 1,
0.09766218, -0.2048207, 3.47395, 0, 0.6862745, 1, 1,
0.09848125, 0.6384544, 0.04785383, 0, 0.682353, 1, 1,
0.09852066, -0.8990253, 1.147805, 0, 0.6745098, 1, 1,
0.1066154, 1.521007, 1.311031, 0, 0.6705883, 1, 1,
0.1086038, 0.456119, 0.1380757, 0, 0.6627451, 1, 1,
0.1101159, -1.436028, 3.441223, 0, 0.6588235, 1, 1,
0.1114161, 1.652514, 1.31163, 0, 0.6509804, 1, 1,
0.1125521, -1.491206, 3.828329, 0, 0.6470588, 1, 1,
0.1128792, 0.53846, 0.8657275, 0, 0.6392157, 1, 1,
0.1135953, -0.4828802, 2.911337, 0, 0.6352941, 1, 1,
0.1148866, -0.4635115, 4.538515, 0, 0.627451, 1, 1,
0.1160071, 0.8899426, -1.735964, 0, 0.6235294, 1, 1,
0.1160497, 0.09894931, 2.323849, 0, 0.6156863, 1, 1,
0.1189007, 2.273813, -2.690654, 0, 0.6117647, 1, 1,
0.1192615, 0.3240149, 1.02697, 0, 0.6039216, 1, 1,
0.1229574, -1.38023, 3.38263, 0, 0.5960785, 1, 1,
0.1250176, 0.1259401, -0.5819333, 0, 0.5921569, 1, 1,
0.1264147, -0.05169563, 1.437452, 0, 0.5843138, 1, 1,
0.1270569, 0.08544782, 1.164179, 0, 0.5803922, 1, 1,
0.1299476, 0.2768251, 0.3640627, 0, 0.572549, 1, 1,
0.1300494, 0.6945223, -0.4953351, 0, 0.5686275, 1, 1,
0.1364765, -1.456611, 2.313243, 0, 0.5607843, 1, 1,
0.1377678, -0.3593655, 2.021541, 0, 0.5568628, 1, 1,
0.1392604, 0.6978038, 0.5205281, 0, 0.5490196, 1, 1,
0.1412263, -0.5981532, 2.344198, 0, 0.5450981, 1, 1,
0.1444685, 0.4541837, -0.4307381, 0, 0.5372549, 1, 1,
0.144855, -2.308402, 3.345731, 0, 0.5333334, 1, 1,
0.1456135, 0.9834651, 0.6684514, 0, 0.5254902, 1, 1,
0.1458933, -0.7802875, 5.231067, 0, 0.5215687, 1, 1,
0.1462975, -0.7835827, 0.2605956, 0, 0.5137255, 1, 1,
0.1497511, 1.416085, 1.271275, 0, 0.509804, 1, 1,
0.1510282, -0.8638254, 2.828965, 0, 0.5019608, 1, 1,
0.1561111, 0.6385051, 0.7878109, 0, 0.4941176, 1, 1,
0.1716717, 1.444525, 0.951047, 0, 0.4901961, 1, 1,
0.1765996, -1.104774, 2.195177, 0, 0.4823529, 1, 1,
0.1766447, 1.558082, -0.6700315, 0, 0.4784314, 1, 1,
0.1767429, -0.06075356, 2.128615, 0, 0.4705882, 1, 1,
0.1769579, 0.3620895, 2.137677, 0, 0.4666667, 1, 1,
0.1770262, -0.3433333, 1.209245, 0, 0.4588235, 1, 1,
0.1775513, 1.310796, 0.1030111, 0, 0.454902, 1, 1,
0.1793217, -0.05161931, 2.15413, 0, 0.4470588, 1, 1,
0.1858221, -0.6990713, 1.96921, 0, 0.4431373, 1, 1,
0.1864912, 0.243843, 1.350974, 0, 0.4352941, 1, 1,
0.188013, 2.040505, 0.4999134, 0, 0.4313726, 1, 1,
0.1913791, -0.004792185, 0.509818, 0, 0.4235294, 1, 1,
0.1927723, -1.547953, 3.705378, 0, 0.4196078, 1, 1,
0.193819, 0.2550343, 0.5456629, 0, 0.4117647, 1, 1,
0.1958769, -0.3369928, 3.727409, 0, 0.4078431, 1, 1,
0.1972165, -0.05927929, 2.817875, 0, 0.4, 1, 1,
0.1985228, -1.16469, 3.02999, 0, 0.3921569, 1, 1,
0.2032567, -1.808217, 3.985478, 0, 0.3882353, 1, 1,
0.2035195, 1.333522, 0.1211585, 0, 0.3803922, 1, 1,
0.2067144, 0.9894192, 0.5372883, 0, 0.3764706, 1, 1,
0.2099254, -0.3314576, 1.112992, 0, 0.3686275, 1, 1,
0.2106064, -1.114604, 2.056875, 0, 0.3647059, 1, 1,
0.2129692, 0.9351827, 1.138795, 0, 0.3568628, 1, 1,
0.2194487, 0.6575502, -0.1076937, 0, 0.3529412, 1, 1,
0.2200123, 0.8379295, -0.600633, 0, 0.345098, 1, 1,
0.2228519, -1.22308, 3.625069, 0, 0.3411765, 1, 1,
0.2265573, -0.3457797, 4.815946, 0, 0.3333333, 1, 1,
0.2276467, -1.499537, 0.8579521, 0, 0.3294118, 1, 1,
0.2284035, -1.134533, 4.04481, 0, 0.3215686, 1, 1,
0.2319789, 1.528202, -0.2846636, 0, 0.3176471, 1, 1,
0.2359269, 2.143101, 0.2463278, 0, 0.3098039, 1, 1,
0.2372014, -0.7892758, 1.796209, 0, 0.3058824, 1, 1,
0.2391539, -1.494877, 2.356593, 0, 0.2980392, 1, 1,
0.2394823, 0.5445392, 1.205052, 0, 0.2901961, 1, 1,
0.2398968, 0.976318, -0.3148954, 0, 0.2862745, 1, 1,
0.2403084, 0.2653913, -0.2894679, 0, 0.2784314, 1, 1,
0.240368, -1.942211, 4.259367, 0, 0.2745098, 1, 1,
0.2458474, -0.5896164, 2.64019, 0, 0.2666667, 1, 1,
0.2525729, 3.000428, -0.3605549, 0, 0.2627451, 1, 1,
0.2540342, -0.521866, 4.512672, 0, 0.254902, 1, 1,
0.256949, 0.7812415, -0.7142719, 0, 0.2509804, 1, 1,
0.2653765, -0.2207544, 1.686644, 0, 0.2431373, 1, 1,
0.2671866, 1.442576, 0.2431626, 0, 0.2392157, 1, 1,
0.27708, -1.818042, 3.905011, 0, 0.2313726, 1, 1,
0.2803833, -1.710425, 2.384231, 0, 0.227451, 1, 1,
0.2840624, 1.566397, -1.073791, 0, 0.2196078, 1, 1,
0.2852578, -1.759581, 4.694267, 0, 0.2156863, 1, 1,
0.2865162, -0.148838, 1.892391, 0, 0.2078431, 1, 1,
0.2893653, -0.6766672, 3.843842, 0, 0.2039216, 1, 1,
0.2905481, -1.808866, 3.757656, 0, 0.1960784, 1, 1,
0.2923383, 1.700159, -2.265929, 0, 0.1882353, 1, 1,
0.3013547, 0.7772984, 0.4517834, 0, 0.1843137, 1, 1,
0.3061959, 0.03358067, 2.77031, 0, 0.1764706, 1, 1,
0.3081164, -0.3749191, 2.82221, 0, 0.172549, 1, 1,
0.312121, 0.1969287, 0.2498821, 0, 0.1647059, 1, 1,
0.3157829, 0.833569, 0.7599117, 0, 0.1607843, 1, 1,
0.3208941, 1.056505, 1.98549, 0, 0.1529412, 1, 1,
0.3260755, 0.3266307, 0.6110621, 0, 0.1490196, 1, 1,
0.32845, -1.236417, 2.290853, 0, 0.1411765, 1, 1,
0.3298763, 0.6523402, 0.3637952, 0, 0.1372549, 1, 1,
0.3318805, -0.05482291, 2.250957, 0, 0.1294118, 1, 1,
0.3322667, -0.5764013, 3.266483, 0, 0.1254902, 1, 1,
0.3330897, 0.6319442, 0.7528053, 0, 0.1176471, 1, 1,
0.3339063, 2.639665, 0.3465193, 0, 0.1137255, 1, 1,
0.3349099, -0.8605249, 1.651527, 0, 0.1058824, 1, 1,
0.3361878, 1.577432, 0.8288986, 0, 0.09803922, 1, 1,
0.3395905, -0.4869107, 1.105399, 0, 0.09411765, 1, 1,
0.3435298, -0.1647025, 1.520111, 0, 0.08627451, 1, 1,
0.3443817, -1.549922, 2.879316, 0, 0.08235294, 1, 1,
0.344851, -0.3610412, 0.9193851, 0, 0.07450981, 1, 1,
0.3459228, 0.3166101, -0.3441353, 0, 0.07058824, 1, 1,
0.346546, -0.495797, 3.621907, 0, 0.0627451, 1, 1,
0.3468616, -0.5573657, 4.493532, 0, 0.05882353, 1, 1,
0.3483447, 0.3425433, 1.833066, 0, 0.05098039, 1, 1,
0.3504185, 1.545591, 2.703133, 0, 0.04705882, 1, 1,
0.3506373, -2.071733, 3.341649, 0, 0.03921569, 1, 1,
0.3515588, 1.056438, 1.244393, 0, 0.03529412, 1, 1,
0.3518846, 0.1933954, 1.901743, 0, 0.02745098, 1, 1,
0.3599364, 0.5581519, 0.1503145, 0, 0.02352941, 1, 1,
0.3601359, 0.2200628, 0.02310596, 0, 0.01568628, 1, 1,
0.3623004, 1.103701, 0.8443859, 0, 0.01176471, 1, 1,
0.3672256, 1.237107, -1.245162, 0, 0.003921569, 1, 1,
0.3702706, -0.6447168, 2.63155, 0.003921569, 0, 1, 1,
0.3709493, 0.4818962, 0.6497669, 0.007843138, 0, 1, 1,
0.3721985, 0.7351431, -0.5503622, 0.01568628, 0, 1, 1,
0.3749104, 0.7538975, 0.6363404, 0.01960784, 0, 1, 1,
0.3777539, 1.782218, -1.508026, 0.02745098, 0, 1, 1,
0.3807078, 0.5656046, 0.5595189, 0.03137255, 0, 1, 1,
0.3817925, 1.776992, 0.3800792, 0.03921569, 0, 1, 1,
0.3836243, -0.6009374, 2.76288, 0.04313726, 0, 1, 1,
0.3985794, 1.281924, 0.3963127, 0.05098039, 0, 1, 1,
0.3996095, 0.1586793, 1.293893, 0.05490196, 0, 1, 1,
0.400283, -1.3102, 4.56341, 0.0627451, 0, 1, 1,
0.4078647, -0.7197128, 1.94775, 0.06666667, 0, 1, 1,
0.4144692, -0.2660765, 1.989822, 0.07450981, 0, 1, 1,
0.4159047, 0.7340474, -0.7860161, 0.07843138, 0, 1, 1,
0.4202477, 0.7527705, 1.767556, 0.08627451, 0, 1, 1,
0.4219918, -1.542019, 0.9665633, 0.09019608, 0, 1, 1,
0.4222414, 0.2398455, 0.6614156, 0.09803922, 0, 1, 1,
0.4266459, -0.1120453, 2.385483, 0.1058824, 0, 1, 1,
0.4292385, -1.740887, 2.001203, 0.1098039, 0, 1, 1,
0.4346152, 0.9236549, 0.1476183, 0.1176471, 0, 1, 1,
0.435881, -0.03487824, 3.698526, 0.1215686, 0, 1, 1,
0.4393648, 1.127883, 0.8594654, 0.1294118, 0, 1, 1,
0.4447617, 0.5004991, 2.739836, 0.1333333, 0, 1, 1,
0.4453265, 1.173148, 1.280636, 0.1411765, 0, 1, 1,
0.4477563, 0.07153824, 1.503879, 0.145098, 0, 1, 1,
0.4481688, 0.3224504, 2.373126, 0.1529412, 0, 1, 1,
0.4520119, 0.3688181, 0.4645666, 0.1568628, 0, 1, 1,
0.4550782, 0.2460247, -1.872397, 0.1647059, 0, 1, 1,
0.4562318, -0.06871766, 3.582558, 0.1686275, 0, 1, 1,
0.4589614, 1.286997, -1.000582, 0.1764706, 0, 1, 1,
0.4607311, -0.4963029, 2.86755, 0.1803922, 0, 1, 1,
0.4608142, -0.1812521, 3.513924, 0.1882353, 0, 1, 1,
0.4642834, 1.099873, 2.623456, 0.1921569, 0, 1, 1,
0.468607, -1.000898, 2.368743, 0.2, 0, 1, 1,
0.468904, 0.8100749, 0.9938332, 0.2078431, 0, 1, 1,
0.4705622, -0.0631925, 1.260206, 0.2117647, 0, 1, 1,
0.4765959, 0.1786975, 2.248069, 0.2196078, 0, 1, 1,
0.4775973, 1.531041, -0.04347071, 0.2235294, 0, 1, 1,
0.4840668, 0.2258168, 1.582747, 0.2313726, 0, 1, 1,
0.4857154, 1.270874, 0.1372682, 0.2352941, 0, 1, 1,
0.4857849, 1.970629, -0.08500611, 0.2431373, 0, 1, 1,
0.4887396, 1.994057, 0.02568637, 0.2470588, 0, 1, 1,
0.502438, 0.07817981, 0.6139878, 0.254902, 0, 1, 1,
0.5038025, 0.2090259, 1.046908, 0.2588235, 0, 1, 1,
0.5055996, 0.2398168, 3.322685, 0.2666667, 0, 1, 1,
0.5061157, 0.1127028, 1.831663, 0.2705882, 0, 1, 1,
0.5140335, 0.07083796, 3.084557, 0.2784314, 0, 1, 1,
0.5183719, -0.9707804, 4.517184, 0.282353, 0, 1, 1,
0.5192266, -0.5356604, 0.8278882, 0.2901961, 0, 1, 1,
0.5244241, 1.967818, 0.5550265, 0.2941177, 0, 1, 1,
0.5291609, -2.065532, 3.849702, 0.3019608, 0, 1, 1,
0.531902, -0.3561128, 1.769921, 0.3098039, 0, 1, 1,
0.5319465, 0.7955233, -0.893216, 0.3137255, 0, 1, 1,
0.5334343, -1.569635, 5.744828, 0.3215686, 0, 1, 1,
0.5402587, -1.22417, 5.090002, 0.3254902, 0, 1, 1,
0.5433024, 1.163478, 1.015608, 0.3333333, 0, 1, 1,
0.5437622, 0.217387, 3.268161, 0.3372549, 0, 1, 1,
0.5442884, 1.139797, 0.5212659, 0.345098, 0, 1, 1,
0.5508376, -0.5908405, 2.215247, 0.3490196, 0, 1, 1,
0.5552902, -0.0680184, 4.593581, 0.3568628, 0, 1, 1,
0.5590346, 0.2039286, 1.904185, 0.3607843, 0, 1, 1,
0.5596848, 0.1050635, 0.3430549, 0.3686275, 0, 1, 1,
0.5622579, 1.077423, 0.3467704, 0.372549, 0, 1, 1,
0.5635736, -2.104214, 3.356781, 0.3803922, 0, 1, 1,
0.5646883, 0.7852048, 2.397574, 0.3843137, 0, 1, 1,
0.568278, -0.3161995, 2.438726, 0.3921569, 0, 1, 1,
0.5734623, -1.138479, 2.127246, 0.3960784, 0, 1, 1,
0.5778833, -0.7348104, 2.461393, 0.4039216, 0, 1, 1,
0.5786955, 0.5285686, 0.7764108, 0.4117647, 0, 1, 1,
0.586561, -0.8136809, 2.919312, 0.4156863, 0, 1, 1,
0.5880613, -0.304802, 1.086668, 0.4235294, 0, 1, 1,
0.5909622, -1.188496, 2.193194, 0.427451, 0, 1, 1,
0.5926933, -0.4769653, 4.303667, 0.4352941, 0, 1, 1,
0.59642, 1.091678, -0.8649837, 0.4392157, 0, 1, 1,
0.5977921, 0.5655366, 1.12554, 0.4470588, 0, 1, 1,
0.6027802, -0.2701346, 3.358149, 0.4509804, 0, 1, 1,
0.6028031, -0.6032805, 1.345173, 0.4588235, 0, 1, 1,
0.6062693, 1.632725, 0.6096318, 0.4627451, 0, 1, 1,
0.6083503, -0.461813, 2.944869, 0.4705882, 0, 1, 1,
0.610713, -2.33396, 3.95851, 0.4745098, 0, 1, 1,
0.6114405, -0.6179309, 1.190854, 0.4823529, 0, 1, 1,
0.6116841, -1.035426, 4.122035, 0.4862745, 0, 1, 1,
0.6125491, 1.509265, 0.3894437, 0.4941176, 0, 1, 1,
0.616981, -0.2162568, 0.7210327, 0.5019608, 0, 1, 1,
0.6227294, -0.08371431, 2.844375, 0.5058824, 0, 1, 1,
0.6274783, 1.491724, 1.488253, 0.5137255, 0, 1, 1,
0.6279857, 0.4523514, 1.752324, 0.5176471, 0, 1, 1,
0.6302871, 0.5417188, 1.578229, 0.5254902, 0, 1, 1,
0.634887, -0.3011511, 1.0397, 0.5294118, 0, 1, 1,
0.6359975, -0.4601938, 3.562609, 0.5372549, 0, 1, 1,
0.6368104, -0.1212471, 3.621824, 0.5411765, 0, 1, 1,
0.6390694, -1.714596, 1.633942, 0.5490196, 0, 1, 1,
0.642543, -0.2355621, 2.60633, 0.5529412, 0, 1, 1,
0.6434045, -1.851339, 3.057364, 0.5607843, 0, 1, 1,
0.6447095, -1.667839, 2.593952, 0.5647059, 0, 1, 1,
0.6493088, 0.9622164, -0.8642427, 0.572549, 0, 1, 1,
0.655041, 2.139621, 0.4448649, 0.5764706, 0, 1, 1,
0.6610876, -0.5407375, 3.138946, 0.5843138, 0, 1, 1,
0.6639448, 0.2087384, 0.7338177, 0.5882353, 0, 1, 1,
0.6688603, 0.3611959, 0.1836387, 0.5960785, 0, 1, 1,
0.6797978, -2.474706, 4.516115, 0.6039216, 0, 1, 1,
0.687587, -0.6804644, 2.887153, 0.6078432, 0, 1, 1,
0.6919196, -0.2481603, 2.296998, 0.6156863, 0, 1, 1,
0.6928337, -0.1639363, 2.372078, 0.6196079, 0, 1, 1,
0.6952119, 0.4917618, 0.8198208, 0.627451, 0, 1, 1,
0.7043049, -1.953784, 1.500153, 0.6313726, 0, 1, 1,
0.7048559, -0.7916255, 2.058239, 0.6392157, 0, 1, 1,
0.7072544, 2.156446, -1.004005, 0.6431373, 0, 1, 1,
0.7133995, -0.4115552, 1.015702, 0.6509804, 0, 1, 1,
0.7158427, -0.2131031, 1.767376, 0.654902, 0, 1, 1,
0.7171743, -0.8065704, 3.196153, 0.6627451, 0, 1, 1,
0.7204913, -0.7329614, 1.826925, 0.6666667, 0, 1, 1,
0.7249405, -0.6910173, 2.982656, 0.6745098, 0, 1, 1,
0.7273972, 0.0002348546, 0.5014102, 0.6784314, 0, 1, 1,
0.7328358, 0.7651657, 0.03405549, 0.6862745, 0, 1, 1,
0.7340063, 0.1405579, 2.291923, 0.6901961, 0, 1, 1,
0.7348908, -0.8726954, 0.1552238, 0.6980392, 0, 1, 1,
0.7447013, 0.4808971, 0.8230402, 0.7058824, 0, 1, 1,
0.7486598, -0.1559229, 0.8766289, 0.7098039, 0, 1, 1,
0.7526618, 0.1619175, 3.649215, 0.7176471, 0, 1, 1,
0.7556797, -1.757896, 3.351711, 0.7215686, 0, 1, 1,
0.7566158, 1.079319, 1.169965, 0.7294118, 0, 1, 1,
0.7578652, -0.2823926, 2.95822, 0.7333333, 0, 1, 1,
0.7579179, -0.0147638, 1.492956, 0.7411765, 0, 1, 1,
0.7579179, 2.030812, 0.894942, 0.7450981, 0, 1, 1,
0.7615215, -0.3157139, 1.034091, 0.7529412, 0, 1, 1,
0.7660941, 0.02110148, 1.051618, 0.7568628, 0, 1, 1,
0.7673765, -0.4261482, 2.563083, 0.7647059, 0, 1, 1,
0.7742347, 0.4414884, 3.115448, 0.7686275, 0, 1, 1,
0.7747455, 0.7217762, 3.322749, 0.7764706, 0, 1, 1,
0.7861072, -1.320786, 3.491324, 0.7803922, 0, 1, 1,
0.7880877, 0.8668035, 1.602839, 0.7882353, 0, 1, 1,
0.7992363, 0.2721311, 0.6094499, 0.7921569, 0, 1, 1,
0.8104697, -0.4437077, 0.4413683, 0.8, 0, 1, 1,
0.8119357, -1.710568, 2.736459, 0.8078431, 0, 1, 1,
0.8136675, -0.01188621, 3.357779, 0.8117647, 0, 1, 1,
0.8176555, -0.084953, 2.155398, 0.8196079, 0, 1, 1,
0.821371, -0.3575574, 1.86158, 0.8235294, 0, 1, 1,
0.8253608, 1.352238, 1.702199, 0.8313726, 0, 1, 1,
0.8283449, -0.2495756, 2.814634, 0.8352941, 0, 1, 1,
0.8317738, -0.3301976, 1.297135, 0.8431373, 0, 1, 1,
0.8323538, -0.1712339, 2.758283, 0.8470588, 0, 1, 1,
0.8327906, -0.3425873, 1.485393, 0.854902, 0, 1, 1,
0.8341935, -0.5063511, 1.908387, 0.8588235, 0, 1, 1,
0.8375547, -0.1126738, 1.017663, 0.8666667, 0, 1, 1,
0.8420075, 0.9030688, -0.4621002, 0.8705882, 0, 1, 1,
0.8524022, 1.310891, -1.291466, 0.8784314, 0, 1, 1,
0.858758, -0.3279764, 1.377793, 0.8823529, 0, 1, 1,
0.8591259, 0.6016037, 2.191653, 0.8901961, 0, 1, 1,
0.8692546, -0.2074946, 2.033763, 0.8941177, 0, 1, 1,
0.8790337, -0.9539118, 2.968667, 0.9019608, 0, 1, 1,
0.8892881, -0.2052902, 3.467261, 0.9098039, 0, 1, 1,
0.8942346, 2.099824, 1.444362, 0.9137255, 0, 1, 1,
0.9041662, 0.608402, 1.406824, 0.9215686, 0, 1, 1,
0.9069992, 1.176363, 0.3940556, 0.9254902, 0, 1, 1,
0.9113066, 1.040629, -1.089347, 0.9333333, 0, 1, 1,
0.9152632, -1.746331, 2.083584, 0.9372549, 0, 1, 1,
0.9222547, 0.1864384, 0.9775533, 0.945098, 0, 1, 1,
0.9285589, 0.3939171, 0.7820169, 0.9490196, 0, 1, 1,
0.9327129, 0.2080763, 2.995146, 0.9568627, 0, 1, 1,
0.93405, -0.499036, 2.005981, 0.9607843, 0, 1, 1,
0.9341515, -0.7409124, 1.849805, 0.9686275, 0, 1, 1,
0.9368647, -1.226041, 1.948014, 0.972549, 0, 1, 1,
0.9369206, 0.6387275, 1.831165, 0.9803922, 0, 1, 1,
0.9429479, 0.5961006, -0.6364309, 0.9843137, 0, 1, 1,
0.9468912, 0.2837582, 0.7634217, 0.9921569, 0, 1, 1,
0.9492303, 0.4672903, 1.433242, 0.9960784, 0, 1, 1,
0.9525656, 0.4890878, 0.9079966, 1, 0, 0.9960784, 1,
0.9636032, -1.410349, 3.219868, 1, 0, 0.9882353, 1,
0.9736274, 0.4554075, 0.8168914, 1, 0, 0.9843137, 1,
0.9739528, -0.9201425, 2.074491, 1, 0, 0.9764706, 1,
0.9760305, 0.518513, 1.270015, 1, 0, 0.972549, 1,
0.9768528, 0.09980711, 1.231912, 1, 0, 0.9647059, 1,
0.979459, 0.8524764, 0.1132143, 1, 0, 0.9607843, 1,
0.9914675, -0.3474778, 1.62795, 1, 0, 0.9529412, 1,
0.9953361, 1.471891, 1.2769, 1, 0, 0.9490196, 1,
0.9960169, -0.3355017, 1.965451, 1, 0, 0.9411765, 1,
0.9964661, -0.916697, 3.399594, 1, 0, 0.9372549, 1,
0.9969617, -0.4037388, 3.702979, 1, 0, 0.9294118, 1,
1.006715, 0.8793786, -0.08240864, 1, 0, 0.9254902, 1,
1.012969, -0.5928869, 1.44838, 1, 0, 0.9176471, 1,
1.018899, 0.3888322, 1.578286, 1, 0, 0.9137255, 1,
1.021239, -2.399364, 3.397472, 1, 0, 0.9058824, 1,
1.023123, 1.534818, 1.600578, 1, 0, 0.9019608, 1,
1.032272, 0.3065281, -0.0678057, 1, 0, 0.8941177, 1,
1.036688, 0.9735771, 0.4445279, 1, 0, 0.8862745, 1,
1.038394, -0.6297138, 2.902068, 1, 0, 0.8823529, 1,
1.041475, -0.5770869, 1.704244, 1, 0, 0.8745098, 1,
1.0436, 1.793338, -0.4700858, 1, 0, 0.8705882, 1,
1.046301, 0.2319606, 0.7792524, 1, 0, 0.8627451, 1,
1.047703, -0.698482, 2.056517, 1, 0, 0.8588235, 1,
1.050877, 0.2411801, 0.9426696, 1, 0, 0.8509804, 1,
1.051379, -0.1934436, 2.109629, 1, 0, 0.8470588, 1,
1.058497, 1.265521, -0.1287101, 1, 0, 0.8392157, 1,
1.059049, 1.360469, 1.236626, 1, 0, 0.8352941, 1,
1.061372, -1.372159, 2.42609, 1, 0, 0.827451, 1,
1.071907, 0.4041262, 1.013921, 1, 0, 0.8235294, 1,
1.073091, 0.2643073, 1.776652, 1, 0, 0.8156863, 1,
1.073338, -0.8326867, 2.858059, 1, 0, 0.8117647, 1,
1.075303, 0.5416101, -0.8097628, 1, 0, 0.8039216, 1,
1.075758, -1.232766, 1.997552, 1, 0, 0.7960784, 1,
1.080631, -1.893347, 3.381646, 1, 0, 0.7921569, 1,
1.087752, -0.3540842, 1.674299, 1, 0, 0.7843137, 1,
1.089782, -1.711545, 3.285302, 1, 0, 0.7803922, 1,
1.093618, 0.1357736, 0.6797289, 1, 0, 0.772549, 1,
1.094327, 1.19478, 1.052163, 1, 0, 0.7686275, 1,
1.103779, 1.667464, -0.3921424, 1, 0, 0.7607843, 1,
1.10709, 0.8645556, 1.624266, 1, 0, 0.7568628, 1,
1.113466, 1.289406, 2.249026, 1, 0, 0.7490196, 1,
1.121454, -0.2936037, 2.197669, 1, 0, 0.7450981, 1,
1.12505, 0.5569936, 1.038391, 1, 0, 0.7372549, 1,
1.128713, 0.09973934, 1.506739, 1, 0, 0.7333333, 1,
1.136579, -0.6082131, 2.459077, 1, 0, 0.7254902, 1,
1.142596, -0.448886, 1.101735, 1, 0, 0.7215686, 1,
1.145332, 1.630232, 1.128627, 1, 0, 0.7137255, 1,
1.153179, 1.115271, 0.9145149, 1, 0, 0.7098039, 1,
1.155059, 0.8933468, 1.829525, 1, 0, 0.7019608, 1,
1.166363, -0.8805257, 1.194241, 1, 0, 0.6941177, 1,
1.16703, 0.731113, 1.482749, 1, 0, 0.6901961, 1,
1.16714, -1.8424, 1.81496, 1, 0, 0.682353, 1,
1.170745, 0.2558971, 3.009513, 1, 0, 0.6784314, 1,
1.174452, -0.337322, 1.322452, 1, 0, 0.6705883, 1,
1.182688, -0.3724407, 2.636671, 1, 0, 0.6666667, 1,
1.184916, -0.3321947, 2.970523, 1, 0, 0.6588235, 1,
1.187225, -0.3084718, 1.929221, 1, 0, 0.654902, 1,
1.187504, -0.08939517, 0.9049563, 1, 0, 0.6470588, 1,
1.189485, 0.8227492, 0.9565846, 1, 0, 0.6431373, 1,
1.204907, -0.6068457, 1.823122, 1, 0, 0.6352941, 1,
1.205165, -0.301576, 1.60756, 1, 0, 0.6313726, 1,
1.208343, -0.03610364, 1.700798, 1, 0, 0.6235294, 1,
1.209441, 3.142405, 0.9695191, 1, 0, 0.6196079, 1,
1.222289, 0.7853549, 1.464738, 1, 0, 0.6117647, 1,
1.228232, -0.3785633, 1.613648, 1, 0, 0.6078432, 1,
1.238395, 0.8997343, 3.309861, 1, 0, 0.6, 1,
1.247567, -0.3772051, 2.933901, 1, 0, 0.5921569, 1,
1.247809, -0.3359019, 1.826109, 1, 0, 0.5882353, 1,
1.256139, 0.4323694, 1.054894, 1, 0, 0.5803922, 1,
1.258953, 1.44788, 0.570785, 1, 0, 0.5764706, 1,
1.263833, 1.038486, 0.4877851, 1, 0, 0.5686275, 1,
1.273435, 0.8928871, 0.4609371, 1, 0, 0.5647059, 1,
1.294621, -1.172129, -0.8977832, 1, 0, 0.5568628, 1,
1.295835, 0.3489518, 0.911943, 1, 0, 0.5529412, 1,
1.297721, 0.854646, -0.480076, 1, 0, 0.5450981, 1,
1.303899, -1.269969, 1.951101, 1, 0, 0.5411765, 1,
1.306196, 0.07180256, 1.941116, 1, 0, 0.5333334, 1,
1.308879, -1.449266, 2.095031, 1, 0, 0.5294118, 1,
1.309505, 1.773461, 0.6518702, 1, 0, 0.5215687, 1,
1.315488, 1.218458, -1.94771, 1, 0, 0.5176471, 1,
1.316463, -0.3016868, 2.539458, 1, 0, 0.509804, 1,
1.322272, 0.2061102, 1.376093, 1, 0, 0.5058824, 1,
1.324738, 0.132024, 0.5350992, 1, 0, 0.4980392, 1,
1.325253, 0.3754243, 0.3525876, 1, 0, 0.4901961, 1,
1.331604, -0.7421744, 1.112673, 1, 0, 0.4862745, 1,
1.33346, -1.338286, 2.580909, 1, 0, 0.4784314, 1,
1.338778, -0.308623, 3.098749, 1, 0, 0.4745098, 1,
1.338843, -0.0508995, -0.3803168, 1, 0, 0.4666667, 1,
1.339082, -0.03282799, 1.710914, 1, 0, 0.4627451, 1,
1.349366, -0.006964019, 1.135187, 1, 0, 0.454902, 1,
1.36315, -0.3557196, -0.1499378, 1, 0, 0.4509804, 1,
1.375689, -1.990166, 0.6313269, 1, 0, 0.4431373, 1,
1.383321, 1.001004, 2.519744, 1, 0, 0.4392157, 1,
1.39158, 0.9624956, 0.5701953, 1, 0, 0.4313726, 1,
1.391615, 1.140452, -0.1125623, 1, 0, 0.427451, 1,
1.396151, 0.1875513, 1.52336, 1, 0, 0.4196078, 1,
1.400045, 0.5853146, 2.354337, 1, 0, 0.4156863, 1,
1.400527, -0.1599117, 1.383073, 1, 0, 0.4078431, 1,
1.41079, 0.7791258, -0.6722316, 1, 0, 0.4039216, 1,
1.425477, -0.6207278, 1.496221, 1, 0, 0.3960784, 1,
1.438311, 0.09279799, -0.1314054, 1, 0, 0.3882353, 1,
1.439036, -0.6151586, 1.619425, 1, 0, 0.3843137, 1,
1.449765, 0.7134773, 1.927867, 1, 0, 0.3764706, 1,
1.450708, -2.884648, 2.019979, 1, 0, 0.372549, 1,
1.450896, -0.4605564, 3.723722, 1, 0, 0.3647059, 1,
1.4607, 1.417267, -1.211625, 1, 0, 0.3607843, 1,
1.462373, -0.3562352, 1.779475, 1, 0, 0.3529412, 1,
1.465932, 1.294862, 1.993354, 1, 0, 0.3490196, 1,
1.477029, -0.7071222, 1.721877, 1, 0, 0.3411765, 1,
1.486327, 0.9612623, 0.04193341, 1, 0, 0.3372549, 1,
1.488556, -1.078098, 2.94515, 1, 0, 0.3294118, 1,
1.492033, -0.1253692, 1.136309, 1, 0, 0.3254902, 1,
1.496965, 0.7703713, 1.82852, 1, 0, 0.3176471, 1,
1.499296, 1.429355, 1.616496, 1, 0, 0.3137255, 1,
1.515374, 2.295153, -0.2243733, 1, 0, 0.3058824, 1,
1.516944, -2.583182, 3.105405, 1, 0, 0.2980392, 1,
1.520807, 1.006222, 0.3667759, 1, 0, 0.2941177, 1,
1.528771, -0.6375232, 3.145491, 1, 0, 0.2862745, 1,
1.54214, 1.759454, 0.7170353, 1, 0, 0.282353, 1,
1.544205, -0.4280529, 1.634227, 1, 0, 0.2745098, 1,
1.54872, 1.498693, -1.027952, 1, 0, 0.2705882, 1,
1.563502, -1.484813, 2.342038, 1, 0, 0.2627451, 1,
1.567738, -1.394989, 3.097469, 1, 0, 0.2588235, 1,
1.593679, 2.644888, -0.848155, 1, 0, 0.2509804, 1,
1.598496, 1.102324, 0.5003774, 1, 0, 0.2470588, 1,
1.602045, -0.2198926, 0.8259954, 1, 0, 0.2392157, 1,
1.628675, 0.7328261, 0.1225447, 1, 0, 0.2352941, 1,
1.642922, -1.142014, 2.690814, 1, 0, 0.227451, 1,
1.648375, 1.055761, -0.7026788, 1, 0, 0.2235294, 1,
1.652468, -0.5384567, 1.313823, 1, 0, 0.2156863, 1,
1.654254, 0.1954632, 0.4610907, 1, 0, 0.2117647, 1,
1.686106, 2.299045, 2.229098, 1, 0, 0.2039216, 1,
1.713117, -0.8005486, 2.103019, 1, 0, 0.1960784, 1,
1.7195, 0.07907978, 0.5335726, 1, 0, 0.1921569, 1,
1.720221, 0.05146418, 1.354588, 1, 0, 0.1843137, 1,
1.747278, -1.425844, 3.243083, 1, 0, 0.1803922, 1,
1.776059, -1.497709, 2.810282, 1, 0, 0.172549, 1,
1.77905, 1.088324, 1.184001, 1, 0, 0.1686275, 1,
1.78211, -0.5119643, -0.714465, 1, 0, 0.1607843, 1,
1.791064, 1.310913, -1.001187, 1, 0, 0.1568628, 1,
1.811909, -0.3271754, 1.633098, 1, 0, 0.1490196, 1,
1.829258, -0.234429, 1.583583, 1, 0, 0.145098, 1,
1.868003, -0.8353081, 3.099468, 1, 0, 0.1372549, 1,
1.873541, 0.2888144, 2.497963, 1, 0, 0.1333333, 1,
1.874757, 0.9426159, 1.091088, 1, 0, 0.1254902, 1,
1.883611, -0.1324685, 2.479165, 1, 0, 0.1215686, 1,
1.887988, 1.667623, 0.7399039, 1, 0, 0.1137255, 1,
1.954576, 1.036755, 0.6708642, 1, 0, 0.1098039, 1,
1.957222, 1.68688, -1.17069, 1, 0, 0.1019608, 1,
1.989692, -0.07452399, 0.5561807, 1, 0, 0.09411765, 1,
2.079109, -0.4448674, 0.7743722, 1, 0, 0.09019608, 1,
2.094317, -0.1480078, 2.431625, 1, 0, 0.08235294, 1,
2.104278, 0.4639235, 1.07028, 1, 0, 0.07843138, 1,
2.125096, 0.8566906, 1.78043, 1, 0, 0.07058824, 1,
2.246354, 0.5426856, 2.077754, 1, 0, 0.06666667, 1,
2.253123, 0.3407849, 1.27445, 1, 0, 0.05882353, 1,
2.279378, -0.02473698, 2.222297, 1, 0, 0.05490196, 1,
2.359104, 0.4499639, 1.426286, 1, 0, 0.04705882, 1,
2.377348, -1.844687, 1.137352, 1, 0, 0.04313726, 1,
2.396959, 0.3502259, 0.4174291, 1, 0, 0.03529412, 1,
2.435883, -0.4690794, 1.357671, 1, 0, 0.03137255, 1,
2.440675, 2.544458, 1.831874, 1, 0, 0.02352941, 1,
2.53444, -0.8972729, 0.2147493, 1, 0, 0.01960784, 1,
2.616409, -0.5398005, 1.231164, 1, 0, 0.01176471, 1,
3.227057, 0.3311866, 1.805012, 1, 0, 0.007843138, 1
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
-0.004287601, -3.906233, -7.446853, 0, -0.5, 0.5, 0.5,
-0.004287601, -3.906233, -7.446853, 1, -0.5, 0.5, 0.5,
-0.004287601, -3.906233, -7.446853, 1, 1.5, 0.5, 0.5,
-0.004287601, -3.906233, -7.446853, 0, 1.5, 0.5, 0.5
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
-4.331058, 0.1288784, -7.446853, 0, -0.5, 0.5, 0.5,
-4.331058, 0.1288784, -7.446853, 1, -0.5, 0.5, 0.5,
-4.331058, 0.1288784, -7.446853, 1, 1.5, 0.5, 0.5,
-4.331058, 0.1288784, -7.446853, 0, 1.5, 0.5, 0.5
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
-4.331058, -3.906233, 0.1049473, 0, -0.5, 0.5, 0.5,
-4.331058, -3.906233, 0.1049473, 1, -0.5, 0.5, 0.5,
-4.331058, -3.906233, 0.1049473, 1, 1.5, 0.5, 0.5,
-4.331058, -3.906233, 0.1049473, 0, 1.5, 0.5, 0.5
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
-3, -2.975054, -5.70413,
3, -2.975054, -5.70413,
-3, -2.975054, -5.70413,
-3, -3.13025, -5.994583,
-2, -2.975054, -5.70413,
-2, -3.13025, -5.994583,
-1, -2.975054, -5.70413,
-1, -3.13025, -5.994583,
0, -2.975054, -5.70413,
0, -3.13025, -5.994583,
1, -2.975054, -5.70413,
1, -3.13025, -5.994583,
2, -2.975054, -5.70413,
2, -3.13025, -5.994583,
3, -2.975054, -5.70413,
3, -3.13025, -5.994583
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
-3, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
-3, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
-3, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
-3, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
-2, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
-2, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
-2, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
-2, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
-1, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
-1, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
-1, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
-1, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
0, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
0, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
0, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
0, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
1, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
1, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
1, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
1, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
2, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
2, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
2, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
2, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5,
3, -3.440644, -6.575491, 0, -0.5, 0.5, 0.5,
3, -3.440644, -6.575491, 1, -0.5, 0.5, 0.5,
3, -3.440644, -6.575491, 1, 1.5, 0.5, 0.5,
3, -3.440644, -6.575491, 0, 1.5, 0.5, 0.5
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
-3.332572, -2, -5.70413,
-3.332572, 3, -5.70413,
-3.332572, -2, -5.70413,
-3.498986, -2, -5.994583,
-3.332572, -1, -5.70413,
-3.498986, -1, -5.994583,
-3.332572, 0, -5.70413,
-3.498986, 0, -5.994583,
-3.332572, 1, -5.70413,
-3.498986, 1, -5.994583,
-3.332572, 2, -5.70413,
-3.498986, 2, -5.994583,
-3.332572, 3, -5.70413,
-3.498986, 3, -5.994583
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
-3.831815, -2, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, -2, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, -2, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, -2, -6.575491, 0, 1.5, 0.5, 0.5,
-3.831815, -1, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, -1, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, -1, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, -1, -6.575491, 0, 1.5, 0.5, 0.5,
-3.831815, 0, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, 0, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, 0, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, 0, -6.575491, 0, 1.5, 0.5, 0.5,
-3.831815, 1, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, 1, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, 1, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, 1, -6.575491, 0, 1.5, 0.5, 0.5,
-3.831815, 2, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, 2, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, 2, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, 2, -6.575491, 0, 1.5, 0.5, 0.5,
-3.831815, 3, -6.575491, 0, -0.5, 0.5, 0.5,
-3.831815, 3, -6.575491, 1, -0.5, 0.5, 0.5,
-3.831815, 3, -6.575491, 1, 1.5, 0.5, 0.5,
-3.831815, 3, -6.575491, 0, 1.5, 0.5, 0.5
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
-3.332572, -2.975054, -4,
-3.332572, -2.975054, 4,
-3.332572, -2.975054, -4,
-3.498986, -3.13025, -4,
-3.332572, -2.975054, -2,
-3.498986, -3.13025, -2,
-3.332572, -2.975054, 0,
-3.498986, -3.13025, 0,
-3.332572, -2.975054, 2,
-3.498986, -3.13025, 2,
-3.332572, -2.975054, 4,
-3.498986, -3.13025, 4
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
-3.831815, -3.440644, -4, 0, -0.5, 0.5, 0.5,
-3.831815, -3.440644, -4, 1, -0.5, 0.5, 0.5,
-3.831815, -3.440644, -4, 1, 1.5, 0.5, 0.5,
-3.831815, -3.440644, -4, 0, 1.5, 0.5, 0.5,
-3.831815, -3.440644, -2, 0, -0.5, 0.5, 0.5,
-3.831815, -3.440644, -2, 1, -0.5, 0.5, 0.5,
-3.831815, -3.440644, -2, 1, 1.5, 0.5, 0.5,
-3.831815, -3.440644, -2, 0, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 0, 0, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 0, 1, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 0, 1, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 0, 0, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 2, 0, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 2, 1, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 2, 1, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 2, 0, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 4, 0, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 4, 1, -0.5, 0.5, 0.5,
-3.831815, -3.440644, 4, 1, 1.5, 0.5, 0.5,
-3.831815, -3.440644, 4, 0, 1.5, 0.5, 0.5
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
-3.332572, -2.975054, -5.70413,
-3.332572, 3.23281, -5.70413,
-3.332572, -2.975054, 5.914024,
-3.332572, 3.23281, 5.914024,
-3.332572, -2.975054, -5.70413,
-3.332572, -2.975054, 5.914024,
-3.332572, 3.23281, -5.70413,
-3.332572, 3.23281, 5.914024,
-3.332572, -2.975054, -5.70413,
3.323997, -2.975054, -5.70413,
-3.332572, -2.975054, 5.914024,
3.323997, -2.975054, 5.914024,
-3.332572, 3.23281, -5.70413,
3.323997, 3.23281, -5.70413,
-3.332572, 3.23281, 5.914024,
3.323997, 3.23281, 5.914024,
3.323997, -2.975054, -5.70413,
3.323997, 3.23281, -5.70413,
3.323997, -2.975054, 5.914024,
3.323997, 3.23281, 5.914024,
3.323997, -2.975054, -5.70413,
3.323997, -2.975054, 5.914024,
3.323997, 3.23281, -5.70413,
3.323997, 3.23281, 5.914024
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
var radius = 7.881036;
var distance = 35.06361;
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
mvMatrix.translate( 0.004287601, -0.1288784, -0.1049473 );
mvMatrix.scale( 1.280108, 1.372635, 0.7334324 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06361);
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
Carbosulfan<-read.table("Carbosulfan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbosulfan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbosulfan' not found
```

```r
y<-Carbosulfan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbosulfan' not found
```

```r
z<-Carbosulfan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbosulfan' not found
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
-3.235632, 1.402406, -1.708957, 0, 0, 1, 1, 1,
-2.980681, -0.006482, -1.898664, 1, 0, 0, 1, 1,
-2.787212, 0.3348488, -2.73324, 1, 0, 0, 1, 1,
-2.68114, 1.830303, -0.9815873, 1, 0, 0, 1, 1,
-2.602699, 1.157063, -1.664127, 1, 0, 0, 1, 1,
-2.528157, -0.003924442, -2.312546, 1, 0, 0, 1, 1,
-2.517115, 0.8891455, 0.4358925, 0, 0, 0, 1, 1,
-2.457222, 0.7571605, -1.604325, 0, 0, 0, 1, 1,
-2.427429, 1.434558, 0.2700203, 0, 0, 0, 1, 1,
-2.423791, 0.1630795, -1.756826, 0, 0, 0, 1, 1,
-2.341187, 1.326538, 0.06378012, 0, 0, 0, 1, 1,
-2.315799, -1.710209, -1.457565, 0, 0, 0, 1, 1,
-2.201338, 0.2763775, -0.7842658, 0, 0, 0, 1, 1,
-2.194157, -0.8983557, -2.592574, 1, 1, 1, 1, 1,
-2.194074, 0.4705248, -2.112867, 1, 1, 1, 1, 1,
-2.176933, 0.5543402, 0.006143142, 1, 1, 1, 1, 1,
-2.149443, 1.709053, -2.370173, 1, 1, 1, 1, 1,
-2.132635, 1.897671, -1.081874, 1, 1, 1, 1, 1,
-2.092289, -0.6932924, -4.048139, 1, 1, 1, 1, 1,
-2.059312, 0.5699971, -1.009025, 1, 1, 1, 1, 1,
-1.958922, 0.5627975, 0.02507717, 1, 1, 1, 1, 1,
-1.956107, -0.4532565, -2.526322, 1, 1, 1, 1, 1,
-1.953928, -1.778186, -1.821804, 1, 1, 1, 1, 1,
-1.929465, 0.05177433, -2.39881, 1, 1, 1, 1, 1,
-1.914889, -0.7299643, -3.058858, 1, 1, 1, 1, 1,
-1.882311, -0.359475, -2.18564, 1, 1, 1, 1, 1,
-1.881512, 0.2575651, -2.654887, 1, 1, 1, 1, 1,
-1.878597, 1.095942, -1.798386, 1, 1, 1, 1, 1,
-1.868248, -1.050733, 0.3079438, 0, 0, 1, 1, 1,
-1.858333, 1.846253, -1.792714, 1, 0, 0, 1, 1,
-1.854274, -0.03712727, -1.298015, 1, 0, 0, 1, 1,
-1.851888, 1.08127, -2.034424, 1, 0, 0, 1, 1,
-1.842335, 0.5865251, -1.970055, 1, 0, 0, 1, 1,
-1.825374, 0.04180028, -1.4321, 1, 0, 0, 1, 1,
-1.808856, -2.372191, -2.056924, 0, 0, 0, 1, 1,
-1.807442, -0.02248661, 0.0684837, 0, 0, 0, 1, 1,
-1.798792, -1.067948, -2.953405, 0, 0, 0, 1, 1,
-1.798485, 1.350071, 0.565663, 0, 0, 0, 1, 1,
-1.784175, -1.112777, -2.379974, 0, 0, 0, 1, 1,
-1.770695, 0.3715514, -0.9191505, 0, 0, 0, 1, 1,
-1.750049, -1.284565, -0.8288972, 0, 0, 0, 1, 1,
-1.750028, -0.35681, -4.079196, 1, 1, 1, 1, 1,
-1.729437, -0.2726023, -1.030923, 1, 1, 1, 1, 1,
-1.72649, 0.2776039, -3.499096, 1, 1, 1, 1, 1,
-1.707445, -0.1413406, -2.200753, 1, 1, 1, 1, 1,
-1.690316, 0.2495166, -2.820467, 1, 1, 1, 1, 1,
-1.676129, -0.8502622, -1.418802, 1, 1, 1, 1, 1,
-1.66616, -0.1569572, -1.928071, 1, 1, 1, 1, 1,
-1.664128, -0.001058236, -1.493804, 1, 1, 1, 1, 1,
-1.663626, 2.065457, 0.1391056, 1, 1, 1, 1, 1,
-1.635145, 0.5028993, -2.850986, 1, 1, 1, 1, 1,
-1.628005, 0.3914781, -2.104164, 1, 1, 1, 1, 1,
-1.625744, 0.1434427, -0.5996019, 1, 1, 1, 1, 1,
-1.621106, -0.1043271, -1.945152, 1, 1, 1, 1, 1,
-1.618311, 0.853878, -1.268257, 1, 1, 1, 1, 1,
-1.615468, -0.1840898, -0.8347363, 1, 1, 1, 1, 1,
-1.612241, 0.05219421, -1.432763, 0, 0, 1, 1, 1,
-1.610239, -1.076097, -0.8574534, 1, 0, 0, 1, 1,
-1.607214, 0.1435635, -0.2799166, 1, 0, 0, 1, 1,
-1.605711, 1.105401, 0.3371013, 1, 0, 0, 1, 1,
-1.604884, 0.2650196, -1.638807, 1, 0, 0, 1, 1,
-1.600411, 0.2554539, -1.981056, 1, 0, 0, 1, 1,
-1.599808, -0.3723503, -2.870406, 0, 0, 0, 1, 1,
-1.599808, -1.343806, -1.868721, 0, 0, 0, 1, 1,
-1.598945, -0.08927348, -2.23747, 0, 0, 0, 1, 1,
-1.598442, 0.7208881, 0.06415944, 0, 0, 0, 1, 1,
-1.59725, 0.6526855, -1.017622, 0, 0, 0, 1, 1,
-1.596477, -0.1696774, -2.167833, 0, 0, 0, 1, 1,
-1.591043, 0.2480493, 0.04611737, 0, 0, 0, 1, 1,
-1.590592, -0.615575, -2.814002, 1, 1, 1, 1, 1,
-1.590176, -0.4738652, -0.01508029, 1, 1, 1, 1, 1,
-1.567242, -1.160001, -3.060768, 1, 1, 1, 1, 1,
-1.561457, -1.31262, -2.951699, 1, 1, 1, 1, 1,
-1.55683, -1.67367, -3.960199, 1, 1, 1, 1, 1,
-1.548515, -0.4695006, -2.327252, 1, 1, 1, 1, 1,
-1.539534, 0.0684379, -0.9481316, 1, 1, 1, 1, 1,
-1.526933, -0.7721082, -1.02272, 1, 1, 1, 1, 1,
-1.522928, 1.372086, 0.1782813, 1, 1, 1, 1, 1,
-1.521409, 0.7749975, -1.513585, 1, 1, 1, 1, 1,
-1.51564, 1.311808, -1.818486, 1, 1, 1, 1, 1,
-1.507396, 1.61808, -1.700136, 1, 1, 1, 1, 1,
-1.502039, 0.4201615, -1.578292, 1, 1, 1, 1, 1,
-1.495008, -0.3517417, -0.8922414, 1, 1, 1, 1, 1,
-1.492978, 0.5986769, -0.6833841, 1, 1, 1, 1, 1,
-1.4828, -0.7379785, -0.9325652, 0, 0, 1, 1, 1,
-1.469398, 1.515551, 0.09306245, 1, 0, 0, 1, 1,
-1.467768, -0.07555792, -4.162553, 1, 0, 0, 1, 1,
-1.466212, -0.2098299, -1.950078, 1, 0, 0, 1, 1,
-1.458115, -0.9346811, -2.055723, 1, 0, 0, 1, 1,
-1.450515, 0.952908, -1.262331, 1, 0, 0, 1, 1,
-1.445067, -0.3136328, -1.671211, 0, 0, 0, 1, 1,
-1.442049, -1.563685, -2.862536, 0, 0, 0, 1, 1,
-1.434259, -0.08645824, -0.643244, 0, 0, 0, 1, 1,
-1.418409, -0.5084177, -3.722056, 0, 0, 0, 1, 1,
-1.407585, 0.2380314, -0.128757, 0, 0, 0, 1, 1,
-1.392089, 0.05074354, -1.129987, 0, 0, 0, 1, 1,
-1.389646, -1.623738, -2.26627, 0, 0, 0, 1, 1,
-1.389106, -1.908776, -1.729012, 1, 1, 1, 1, 1,
-1.380173, 0.4693653, -0.2971642, 1, 1, 1, 1, 1,
-1.361264, 0.9491101, -2.146687, 1, 1, 1, 1, 1,
-1.361002, -0.2749591, -2.275251, 1, 1, 1, 1, 1,
-1.356111, -0.6611395, -1.588513, 1, 1, 1, 1, 1,
-1.353454, -0.8711509, -1.568642, 1, 1, 1, 1, 1,
-1.350863, 0.102244, -1.885125, 1, 1, 1, 1, 1,
-1.331114, 0.431669, -0.6960239, 1, 1, 1, 1, 1,
-1.325418, 0.3901947, -2.512518, 1, 1, 1, 1, 1,
-1.319166, -0.5894358, -3.325353, 1, 1, 1, 1, 1,
-1.315735, 0.5751182, -1.002277, 1, 1, 1, 1, 1,
-1.315218, -2.177945, -3.928601, 1, 1, 1, 1, 1,
-1.313295, 0.4765804, -1.312063, 1, 1, 1, 1, 1,
-1.312359, -0.5630015, -1.108597, 1, 1, 1, 1, 1,
-1.311777, -0.4527282, -0.8846388, 1, 1, 1, 1, 1,
-1.288642, 0.3278526, -0.3532239, 0, 0, 1, 1, 1,
-1.279049, 1.286981, -0.08033989, 1, 0, 0, 1, 1,
-1.268869, 0.5860928, -2.022744, 1, 0, 0, 1, 1,
-1.263692, -0.2811589, -1.883521, 1, 0, 0, 1, 1,
-1.261834, -0.1739831, -2.623971, 1, 0, 0, 1, 1,
-1.252845, 1.110355, -1.137904, 1, 0, 0, 1, 1,
-1.252449, 0.270331, 0.002038642, 0, 0, 0, 1, 1,
-1.251889, 0.5723997, -1.032573, 0, 0, 0, 1, 1,
-1.239774, -0.1822205, -2.482107, 0, 0, 0, 1, 1,
-1.237231, 0.7201299, -1.013631, 0, 0, 0, 1, 1,
-1.228203, 0.5916185, -0.2262376, 0, 0, 0, 1, 1,
-1.221738, 0.3352405, -1.202061, 0, 0, 0, 1, 1,
-1.213838, -2.771036, -3.595296, 0, 0, 0, 1, 1,
-1.209525, 0.134568, -1.159058, 1, 1, 1, 1, 1,
-1.199764, 1.898897, -0.08204448, 1, 1, 1, 1, 1,
-1.198154, -0.3595216, 0.9212549, 1, 1, 1, 1, 1,
-1.195881, -0.2927356, -2.227212, 1, 1, 1, 1, 1,
-1.190476, -0.01411377, -2.339719, 1, 1, 1, 1, 1,
-1.187407, 1.272798, -1.233047, 1, 1, 1, 1, 1,
-1.185782, 1.062883, -2.448654, 1, 1, 1, 1, 1,
-1.18279, -1.530414, -3.568347, 1, 1, 1, 1, 1,
-1.177916, -0.09662085, -1.009985, 1, 1, 1, 1, 1,
-1.17491, -0.8423387, -1.401166, 1, 1, 1, 1, 1,
-1.167397, -0.9506865, -1.818209, 1, 1, 1, 1, 1,
-1.166703, 1.50958, -2.610892, 1, 1, 1, 1, 1,
-1.156539, 0.5760581, -1.325841, 1, 1, 1, 1, 1,
-1.148846, 0.409291, -3.167049, 1, 1, 1, 1, 1,
-1.138603, -0.3320039, -0.2078943, 1, 1, 1, 1, 1,
-1.134105, -0.3594147, -2.464568, 0, 0, 1, 1, 1,
-1.129198, -0.5585905, -2.961159, 1, 0, 0, 1, 1,
-1.126085, -0.7735355, -2.544766, 1, 0, 0, 1, 1,
-1.122952, -0.08710335, -1.61365, 1, 0, 0, 1, 1,
-1.121577, -1.086545, -1.087696, 1, 0, 0, 1, 1,
-1.121347, -0.02985574, -1.628262, 1, 0, 0, 1, 1,
-1.118987, 0.652262, -1.634755, 0, 0, 0, 1, 1,
-1.118872, -2.605062, -3.59404, 0, 0, 0, 1, 1,
-1.113101, -1.145442, -2.515223, 0, 0, 0, 1, 1,
-1.111701, 0.4461668, -0.7882407, 0, 0, 0, 1, 1,
-1.109866, -0.7121951, -3.487476, 0, 0, 0, 1, 1,
-1.108249, 1.66655, -0.3733671, 0, 0, 0, 1, 1,
-1.102516, -0.2974159, -1.883853, 0, 0, 0, 1, 1,
-1.101503, 0.004373949, -2.018107, 1, 1, 1, 1, 1,
-1.096078, -0.156714, -0.3124813, 1, 1, 1, 1, 1,
-1.085212, -1.348174, -1.172517, 1, 1, 1, 1, 1,
-1.069708, 1.161103, 0.4250376, 1, 1, 1, 1, 1,
-1.069271, 1.313551, -0.9512242, 1, 1, 1, 1, 1,
-1.064746, 2.171697, -1.138387, 1, 1, 1, 1, 1,
-1.06231, 0.5124701, 0.136089, 1, 1, 1, 1, 1,
-1.060592, -1.007255, -4.301707, 1, 1, 1, 1, 1,
-1.055732, -0.3848137, -2.651556, 1, 1, 1, 1, 1,
-1.053773, -0.4495678, -1.466361, 1, 1, 1, 1, 1,
-1.052873, 1.525476, -0.1405836, 1, 1, 1, 1, 1,
-1.051445, 1.581093, -0.8480638, 1, 1, 1, 1, 1,
-1.04968, -1.235467, -3.066614, 1, 1, 1, 1, 1,
-1.047342, -1.238501, -3.000849, 1, 1, 1, 1, 1,
-1.044276, 1.964249, -0.3424335, 1, 1, 1, 1, 1,
-1.040148, 0.2968354, -0.5594728, 0, 0, 1, 1, 1,
-1.031805, 1.430183, -1.02879, 1, 0, 0, 1, 1,
-1.027704, 1.026239, 0.1445258, 1, 0, 0, 1, 1,
-1.025225, 1.152117, -0.3147224, 1, 0, 0, 1, 1,
-1.020821, -0.8345782, -1.582128, 1, 0, 0, 1, 1,
-1.019605, 0.07320099, -1.410841, 1, 0, 0, 1, 1,
-1.015393, -1.343163, -3.394001, 0, 0, 0, 1, 1,
-1.00896, -0.1873413, -2.271141, 0, 0, 0, 1, 1,
-1.007867, -0.2436407, -1.340487, 0, 0, 0, 1, 1,
-1.001315, 0.3469867, -0.00218199, 0, 0, 0, 1, 1,
-0.9985239, -0.8491942, -4.906084, 0, 0, 0, 1, 1,
-0.9975877, 1.594685, -2.258666, 0, 0, 0, 1, 1,
-0.9962082, -1.991455, -3.963019, 0, 0, 0, 1, 1,
-0.9919789, -0.4029118, -0.4650034, 1, 1, 1, 1, 1,
-0.9884745, -0.7291194, -2.686635, 1, 1, 1, 1, 1,
-0.9768604, -0.08893342, -2.354769, 1, 1, 1, 1, 1,
-0.97632, -1.186205, -3.968908, 1, 1, 1, 1, 1,
-0.9762515, 1.400308, 0.5176064, 1, 1, 1, 1, 1,
-0.9740841, -0.6607144, -2.512497, 1, 1, 1, 1, 1,
-0.97213, -0.4340941, -0.2712162, 1, 1, 1, 1, 1,
-0.9681303, -0.2380867, -2.196709, 1, 1, 1, 1, 1,
-0.9670213, 0.5551952, -1.930901, 1, 1, 1, 1, 1,
-0.9643651, -1.30394, -4.128269, 1, 1, 1, 1, 1,
-0.9637813, -0.2057806, -2.104507, 1, 1, 1, 1, 1,
-0.9614518, -0.3974129, -3.655931, 1, 1, 1, 1, 1,
-0.951008, 1.461395, -1.884338, 1, 1, 1, 1, 1,
-0.9499456, -0.8302284, -4.811679, 1, 1, 1, 1, 1,
-0.9483587, -0.5309874, -3.772852, 1, 1, 1, 1, 1,
-0.9426574, 1.281461, -1.529399, 0, 0, 1, 1, 1,
-0.9366347, 0.2666134, -0.8292812, 1, 0, 0, 1, 1,
-0.931587, 0.1192888, -0.2410771, 1, 0, 0, 1, 1,
-0.9301558, -0.4238823, -2.5618, 1, 0, 0, 1, 1,
-0.9294227, 0.6037518, -0.9774123, 1, 0, 0, 1, 1,
-0.927709, -0.5160529, -2.071388, 1, 0, 0, 1, 1,
-0.9245755, 0.8089808, -1.703954, 0, 0, 0, 1, 1,
-0.9228894, -0.9780623, -2.193074, 0, 0, 0, 1, 1,
-0.9214095, -1.621118, -1.60562, 0, 0, 0, 1, 1,
-0.9175262, -0.2252437, -0.9011204, 0, 0, 0, 1, 1,
-0.9174302, -1.916877, -2.964915, 0, 0, 0, 1, 1,
-0.9088761, 0.9844949, -2.925136, 0, 0, 0, 1, 1,
-0.8969432, -0.2456375, -2.858442, 0, 0, 0, 1, 1,
-0.8931254, -0.06619526, -1.355497, 1, 1, 1, 1, 1,
-0.8913134, -0.08195947, -2.052462, 1, 1, 1, 1, 1,
-0.8911256, 0.3500865, -1.008893, 1, 1, 1, 1, 1,
-0.8904229, -0.5582337, -1.916279, 1, 1, 1, 1, 1,
-0.8864939, -0.1969525, -1.486936, 1, 1, 1, 1, 1,
-0.885716, -0.06103156, -3.604493, 1, 1, 1, 1, 1,
-0.8835224, -0.9110422, -2.495521, 1, 1, 1, 1, 1,
-0.8783805, 0.01261649, -2.069398, 1, 1, 1, 1, 1,
-0.8783703, -0.7000161, -1.702742, 1, 1, 1, 1, 1,
-0.8750979, -2.770549, -1.968047, 1, 1, 1, 1, 1,
-0.8748401, 0.5844653, 0.1793359, 1, 1, 1, 1, 1,
-0.8715573, 0.177744, -1.595628, 1, 1, 1, 1, 1,
-0.8664978, -0.5882202, -1.342294, 1, 1, 1, 1, 1,
-0.858193, 0.7088906, -0.6045818, 1, 1, 1, 1, 1,
-0.8545108, -1.156854, -2.853617, 1, 1, 1, 1, 1,
-0.8477589, -0.5587741, -1.44523, 0, 0, 1, 1, 1,
-0.8471716, -1.088587, -4.208258, 1, 0, 0, 1, 1,
-0.8457987, -1.539459, -1.009, 1, 0, 0, 1, 1,
-0.8419334, -0.3123413, -3.015312, 1, 0, 0, 1, 1,
-0.8411013, -0.8221071, -1.284643, 1, 0, 0, 1, 1,
-0.8401886, 0.4357006, -0.9293671, 1, 0, 0, 1, 1,
-0.8318645, 0.8724561, 0.1693, 0, 0, 0, 1, 1,
-0.8315242, -1.838811, -2.400776, 0, 0, 0, 1, 1,
-0.82831, 0.1902417, -3.554295, 0, 0, 0, 1, 1,
-0.8253136, 0.7543741, -0.07501274, 0, 0, 0, 1, 1,
-0.8247099, 0.5893018, -1.407701, 0, 0, 0, 1, 1,
-0.8231819, 0.187545, -2.282782, 0, 0, 0, 1, 1,
-0.8197764, 0.651187, -1.185008, 0, 0, 0, 1, 1,
-0.81238, -1.434582, -2.566623, 1, 1, 1, 1, 1,
-0.8121633, -1.328103, -3.870137, 1, 1, 1, 1, 1,
-0.8106274, -0.169152, -0.207383, 1, 1, 1, 1, 1,
-0.806447, -0.9066195, -2.266561, 1, 1, 1, 1, 1,
-0.8050502, 0.6598169, -1.650776, 1, 1, 1, 1, 1,
-0.8040808, -0.03263568, -2.010561, 1, 1, 1, 1, 1,
-0.8011068, -0.3622312, -2.558487, 1, 1, 1, 1, 1,
-0.7997866, 0.783334, -0.7723108, 1, 1, 1, 1, 1,
-0.7955415, 0.7140378, -1.872161, 1, 1, 1, 1, 1,
-0.7936899, -2.067179, -1.630274, 1, 1, 1, 1, 1,
-0.7925963, -1.76081, -3.41396, 1, 1, 1, 1, 1,
-0.7914851, -1.066936, -2.495489, 1, 1, 1, 1, 1,
-0.7908415, 2.657529, -0.2976512, 1, 1, 1, 1, 1,
-0.7888763, -0.3493895, -2.789395, 1, 1, 1, 1, 1,
-0.7856488, 1.216658, -1.226382, 1, 1, 1, 1, 1,
-0.7838909, 0.7899415, -2.134669, 0, 0, 1, 1, 1,
-0.7746531, -1.242926, -4.70476, 1, 0, 0, 1, 1,
-0.7662366, -1.323111, -0.3412837, 1, 0, 0, 1, 1,
-0.761863, 0.6520969, -0.9723918, 1, 0, 0, 1, 1,
-0.7617674, 0.6103875, -1.013619, 1, 0, 0, 1, 1,
-0.7591597, -0.9432629, -4.58787, 1, 0, 0, 1, 1,
-0.7584413, -0.8142178, -4.253775, 0, 0, 0, 1, 1,
-0.7547684, -0.1391889, -1.348748, 0, 0, 0, 1, 1,
-0.7518812, 0.9179225, -0.6107132, 0, 0, 0, 1, 1,
-0.7447528, 1.041322, -0.5635574, 0, 0, 0, 1, 1,
-0.7375817, 0.1641349, -1.585629, 0, 0, 0, 1, 1,
-0.7355088, -0.1583128, -1.049381, 0, 0, 0, 1, 1,
-0.722888, -1.299405, -2.899352, 0, 0, 0, 1, 1,
-0.7226432, 0.5325383, -0.5242038, 1, 1, 1, 1, 1,
-0.7174174, -0.5388224, -3.47774, 1, 1, 1, 1, 1,
-0.7102988, -0.9119837, -3.364288, 1, 1, 1, 1, 1,
-0.7025142, 0.5988061, -0.5067834, 1, 1, 1, 1, 1,
-0.7019975, 0.7422504, -1.727877, 1, 1, 1, 1, 1,
-0.7006003, 0.2375339, -1.711664, 1, 1, 1, 1, 1,
-0.6995584, 0.4398568, -1.313946, 1, 1, 1, 1, 1,
-0.6975313, 1.284747, 0.3227837, 1, 1, 1, 1, 1,
-0.6946595, 2.326102, -0.9799381, 1, 1, 1, 1, 1,
-0.6788813, 0.5013793, -2.626215, 1, 1, 1, 1, 1,
-0.6781337, -0.7450565, -1.989811, 1, 1, 1, 1, 1,
-0.6774698, -0.1515985, -1.380373, 1, 1, 1, 1, 1,
-0.6737835, -1.374152, -2.718186, 1, 1, 1, 1, 1,
-0.6714913, -0.4034925, -3.711794, 1, 1, 1, 1, 1,
-0.6701587, 0.1257341, 0.5260707, 1, 1, 1, 1, 1,
-0.6671811, -0.3979391, -2.641875, 0, 0, 1, 1, 1,
-0.6661006, -1.496977, -1.637002, 1, 0, 0, 1, 1,
-0.6641065, 0.4478329, -0.4046689, 1, 0, 0, 1, 1,
-0.6629482, -1.469263, -5.534933, 1, 0, 0, 1, 1,
-0.6583001, 1.274651, -2.076108, 1, 0, 0, 1, 1,
-0.6580701, -0.71533, -1.11576, 1, 0, 0, 1, 1,
-0.6549327, 1.172921, -0.1375931, 0, 0, 0, 1, 1,
-0.6521813, -0.7619104, -0.9451457, 0, 0, 0, 1, 1,
-0.6516429, -0.6480357, -2.4357, 0, 0, 0, 1, 1,
-0.6453903, 0.4432095, -0.6603506, 0, 0, 0, 1, 1,
-0.6404187, -0.9213498, -1.638389, 0, 0, 0, 1, 1,
-0.6326485, -0.3079303, -4.46593, 0, 0, 0, 1, 1,
-0.6275403, 0.448082, -0.8595604, 0, 0, 0, 1, 1,
-0.6243218, 0.06179604, -1.485945, 1, 1, 1, 1, 1,
-0.6219053, -1.178295, -1.791108, 1, 1, 1, 1, 1,
-0.6210726, -1.044813, -1.989507, 1, 1, 1, 1, 1,
-0.6189843, 0.6435281, -1.011004, 1, 1, 1, 1, 1,
-0.6188743, -0.8471772, -2.576975, 1, 1, 1, 1, 1,
-0.616282, 0.7450519, -0.492894, 1, 1, 1, 1, 1,
-0.6082792, 1.22031, -1.030841, 1, 1, 1, 1, 1,
-0.5986203, -0.7211038, -2.26398, 1, 1, 1, 1, 1,
-0.5946226, 1.41449, 0.02045831, 1, 1, 1, 1, 1,
-0.5919311, 0.6512965, -0.0263869, 1, 1, 1, 1, 1,
-0.5837262, 0.2034268, -1.953393, 1, 1, 1, 1, 1,
-0.5834308, 0.6999711, 1.301339, 1, 1, 1, 1, 1,
-0.5826696, 0.3897511, -1.926469, 1, 1, 1, 1, 1,
-0.582005, -1.080461, -2.644594, 1, 1, 1, 1, 1,
-0.576826, 0.9911597, -0.6827157, 1, 1, 1, 1, 1,
-0.5761468, 0.05459436, -0.5361056, 0, 0, 1, 1, 1,
-0.5733341, 0.41866, -0.2687108, 1, 0, 0, 1, 1,
-0.5688255, -0.6071142, -1.564829, 1, 0, 0, 1, 1,
-0.562972, -0.6364459, -1.119825, 1, 0, 0, 1, 1,
-0.5591719, -0.3502229, -1.260508, 1, 0, 0, 1, 1,
-0.5582994, -1.027299, -3.309427, 1, 0, 0, 1, 1,
-0.552988, 1.228008, -1.189094, 0, 0, 0, 1, 1,
-0.5458857, -0.1143613, -0.104092, 0, 0, 0, 1, 1,
-0.5451666, -0.7501289, -4.505241, 0, 0, 0, 1, 1,
-0.5422933, 1.485908, 0.2004204, 0, 0, 0, 1, 1,
-0.5380524, 0.9664537, -0.3439665, 0, 0, 0, 1, 1,
-0.5374521, 0.1686596, -1.579773, 0, 0, 0, 1, 1,
-0.5353166, -1.658186, -2.359601, 0, 0, 0, 1, 1,
-0.5344434, -0.5006542, -1.344936, 1, 1, 1, 1, 1,
-0.5329934, -1.164353, -3.332026, 1, 1, 1, 1, 1,
-0.5239435, 0.9034994, -1.837565, 1, 1, 1, 1, 1,
-0.520947, -0.9044256, -1.717711, 1, 1, 1, 1, 1,
-0.5171124, 0.7563153, -2.585284, 1, 1, 1, 1, 1,
-0.5160282, -1.279023, -2.774415, 1, 1, 1, 1, 1,
-0.5146544, 0.7232269, 0.6088203, 1, 1, 1, 1, 1,
-0.5046261, -0.5781139, -1.977192, 1, 1, 1, 1, 1,
-0.5031536, 0.6482261, -1.2013, 1, 1, 1, 1, 1,
-0.500982, -1.565466, -3.688091, 1, 1, 1, 1, 1,
-0.4982893, 0.4808073, -0.762616, 1, 1, 1, 1, 1,
-0.4939328, 0.003137739, -1.971618, 1, 1, 1, 1, 1,
-0.4931477, 0.3548106, 0.04089395, 1, 1, 1, 1, 1,
-0.4915547, -0.8803205, -2.049745, 1, 1, 1, 1, 1,
-0.4904386, -0.01037551, -3.241482, 1, 1, 1, 1, 1,
-0.4903869, 0.8174245, -0.8917707, 0, 0, 1, 1, 1,
-0.4883473, -0.3929319, -3.832217, 1, 0, 0, 1, 1,
-0.4881238, -2.340816, -4.12269, 1, 0, 0, 1, 1,
-0.4869939, 1.020395, -0.3905295, 1, 0, 0, 1, 1,
-0.4842453, 0.3358732, -0.5969821, 1, 0, 0, 1, 1,
-0.4814608, -0.4466207, -1.552096, 1, 0, 0, 1, 1,
-0.4807722, -1.565197, -5.485241, 0, 0, 0, 1, 1,
-0.4731341, -0.7829434, -3.792079, 0, 0, 0, 1, 1,
-0.4571498, 0.1652354, -0.2205509, 0, 0, 0, 1, 1,
-0.4552548, -0.8232226, -2.961923, 0, 0, 0, 1, 1,
-0.4546308, 0.3517479, -0.1341498, 0, 0, 0, 1, 1,
-0.4495668, 1.52481, 0.8309076, 0, 0, 0, 1, 1,
-0.4493622, 0.9855337, 0.2651168, 0, 0, 0, 1, 1,
-0.4486878, 1.908566, 0.2072359, 1, 1, 1, 1, 1,
-0.445988, -0.1414182, -1.50126, 1, 1, 1, 1, 1,
-0.4454706, -0.1157134, -1.405418, 1, 1, 1, 1, 1,
-0.4414327, 0.1661754, -1.633633, 1, 1, 1, 1, 1,
-0.4405235, 2.678907, 1.565918, 1, 1, 1, 1, 1,
-0.4369375, 0.8456656, -1.100101, 1, 1, 1, 1, 1,
-0.4354947, -0.186292, -2.672586, 1, 1, 1, 1, 1,
-0.4334854, 1.827146, -0.8153215, 1, 1, 1, 1, 1,
-0.4276156, 0.5120689, 0.8637217, 1, 1, 1, 1, 1,
-0.4273274, -1.032547, -2.387633, 1, 1, 1, 1, 1,
-0.4183619, 1.272056, -1.761556, 1, 1, 1, 1, 1,
-0.4178543, 0.4043335, 0.3195838, 1, 1, 1, 1, 1,
-0.4173995, 1.316006, -0.2794866, 1, 1, 1, 1, 1,
-0.4071043, 0.5728534, -0.7197125, 1, 1, 1, 1, 1,
-0.4056275, -2.745179, -3.867187, 1, 1, 1, 1, 1,
-0.4051061, 1.055993, 1.348821, 0, 0, 1, 1, 1,
-0.4030248, -1.536617, -3.636985, 1, 0, 0, 1, 1,
-0.4016491, 0.1929583, -0.8395575, 1, 0, 0, 1, 1,
-0.4006769, 0.02089237, -4.394625, 1, 0, 0, 1, 1,
-0.3941899, -0.4312165, -2.426119, 1, 0, 0, 1, 1,
-0.391196, 0.1493754, -2.231667, 1, 0, 0, 1, 1,
-0.3799315, 0.5625226, 0.4179196, 0, 0, 0, 1, 1,
-0.379696, -0.1732637, -1.170966, 0, 0, 0, 1, 1,
-0.3756428, -0.2455578, -0.9380952, 0, 0, 0, 1, 1,
-0.3735346, -0.4752457, -2.814594, 0, 0, 0, 1, 1,
-0.3733208, 1.47315, -1.165744, 0, 0, 0, 1, 1,
-0.3729628, 0.3455677, 0.3043145, 0, 0, 0, 1, 1,
-0.3726317, 0.2565996, -1.151326, 0, 0, 0, 1, 1,
-0.3706415, -0.5536109, -3.203225, 1, 1, 1, 1, 1,
-0.3637294, 0.5489558, -0.2003445, 1, 1, 1, 1, 1,
-0.3565903, -0.5115684, -4.918495, 1, 1, 1, 1, 1,
-0.3548135, -1.19213, -3.110147, 1, 1, 1, 1, 1,
-0.3523206, -0.6934224, -3.321157, 1, 1, 1, 1, 1,
-0.3517469, -0.7485199, -3.642016, 1, 1, 1, 1, 1,
-0.3491776, 1.590359, -0.9725656, 1, 1, 1, 1, 1,
-0.3456482, -1.006838, -2.252404, 1, 1, 1, 1, 1,
-0.3434919, -2.132658, -1.551063, 1, 1, 1, 1, 1,
-0.3430658, 0.557896, -1.545066, 1, 1, 1, 1, 1,
-0.3414749, -1.363771, -4.092015, 1, 1, 1, 1, 1,
-0.3336198, 0.6466264, -1.045391, 1, 1, 1, 1, 1,
-0.3330291, -0.5211575, -0.7488632, 1, 1, 1, 1, 1,
-0.3325519, -0.09658878, -1.793294, 1, 1, 1, 1, 1,
-0.3325067, -0.2663639, -3.292837, 1, 1, 1, 1, 1,
-0.3300584, -0.2038617, -1.197932, 0, 0, 1, 1, 1,
-0.3281215, -1.064417, -3.676072, 1, 0, 0, 1, 1,
-0.3276126, -1.573368, -2.295726, 1, 0, 0, 1, 1,
-0.3235314, 1.240596, -1.441661, 1, 0, 0, 1, 1,
-0.3225567, 1.20454, -0.1084625, 1, 0, 0, 1, 1,
-0.3217772, 0.6853115, -0.6861355, 1, 0, 0, 1, 1,
-0.3190964, -1.180923, -0.9517644, 0, 0, 0, 1, 1,
-0.3169046, 0.431202, -0.8890013, 0, 0, 0, 1, 1,
-0.3157861, -0.6362262, -3.208795, 0, 0, 0, 1, 1,
-0.2991133, 0.1218255, -0.8961517, 0, 0, 0, 1, 1,
-0.29263, -1.340053, -3.317997, 0, 0, 0, 1, 1,
-0.2818011, -1.467511, -4.3029, 0, 0, 0, 1, 1,
-0.2736556, 0.8164173, -1.835708, 0, 0, 0, 1, 1,
-0.270961, 0.6056129, -1.866322, 1, 1, 1, 1, 1,
-0.2624825, -0.05256109, -2.802165, 1, 1, 1, 1, 1,
-0.2611014, 2.402104, -0.7622876, 1, 1, 1, 1, 1,
-0.2566473, -1.247875, -2.102929, 1, 1, 1, 1, 1,
-0.2533787, -0.1767474, -2.589629, 1, 1, 1, 1, 1,
-0.2522769, -0.680644, -2.026386, 1, 1, 1, 1, 1,
-0.2496753, -1.299842, -3.039188, 1, 1, 1, 1, 1,
-0.2454824, -1.172499, -1.941645, 1, 1, 1, 1, 1,
-0.2421395, 1.021248, 0.4531021, 1, 1, 1, 1, 1,
-0.2402048, -1.358941, -1.493138, 1, 1, 1, 1, 1,
-0.2348293, 1.65616, 0.1174632, 1, 1, 1, 1, 1,
-0.2274296, -0.1409277, -3.25873, 1, 1, 1, 1, 1,
-0.222791, 1.772809, -2.156686, 1, 1, 1, 1, 1,
-0.2223207, 1.404726, 0.2768116, 1, 1, 1, 1, 1,
-0.2197433, 1.735093, 0.2673513, 1, 1, 1, 1, 1,
-0.2159611, -0.810443, -2.544406, 0, 0, 1, 1, 1,
-0.2135179, -1.268501, -1.856329, 1, 0, 0, 1, 1,
-0.2111272, -0.5286238, -1.7951, 1, 0, 0, 1, 1,
-0.208055, -0.7744353, -2.113619, 1, 0, 0, 1, 1,
-0.2064394, -0.3135941, -2.846635, 1, 0, 0, 1, 1,
-0.206063, 0.5240833, -0.3199129, 1, 0, 0, 1, 1,
-0.2040741, 0.3997205, -1.610943, 0, 0, 0, 1, 1,
-0.202356, -0.0230819, -2.055052, 0, 0, 0, 1, 1,
-0.1984755, 1.326525, 0.3019833, 0, 0, 0, 1, 1,
-0.1942585, 0.3751886, -0.09253231, 0, 0, 0, 1, 1,
-0.1935044, 0.25152, 0.7389486, 0, 0, 0, 1, 1,
-0.1877799, 0.4199902, -0.800632, 0, 0, 0, 1, 1,
-0.187681, 0.8720592, -3.05293, 0, 0, 0, 1, 1,
-0.1824853, 0.156095, -0.7282887, 1, 1, 1, 1, 1,
-0.1746789, 0.2572997, -2.062534, 1, 1, 1, 1, 1,
-0.174538, -0.6192601, -3.14236, 1, 1, 1, 1, 1,
-0.1733113, 0.952595, -0.3622381, 1, 1, 1, 1, 1,
-0.1688388, -1.278708, -3.774858, 1, 1, 1, 1, 1,
-0.1616258, 2.818999, -0.2365764, 1, 1, 1, 1, 1,
-0.155825, -0.3232687, -2.729322, 1, 1, 1, 1, 1,
-0.1555512, -0.2974688, -3.039753, 1, 1, 1, 1, 1,
-0.1533055, 1.558382, -1.193099, 1, 1, 1, 1, 1,
-0.1511164, -1.117592, -2.593127, 1, 1, 1, 1, 1,
-0.148318, 0.4685856, 0.05989438, 1, 1, 1, 1, 1,
-0.1442582, 1.191361, -1.139161, 1, 1, 1, 1, 1,
-0.1321998, -1.29321, -2.852899, 1, 1, 1, 1, 1,
-0.1268617, -0.3771952, -1.811717, 1, 1, 1, 1, 1,
-0.1231719, 1.014107, -0.5561857, 1, 1, 1, 1, 1,
-0.1230927, -1.352582, -3.043595, 0, 0, 1, 1, 1,
-0.1177555, -2.10763, -2.002776, 1, 0, 0, 1, 1,
-0.1129701, -1.378068, -2.874439, 1, 0, 0, 1, 1,
-0.1101663, -0.8162215, -4.291222, 1, 0, 0, 1, 1,
-0.1065065, 1.329125, 0.4598969, 1, 0, 0, 1, 1,
-0.1030651, 0.2110854, -1.29221, 1, 0, 0, 1, 1,
-0.1025867, 0.3020601, 0.4941233, 0, 0, 0, 1, 1,
-0.1007277, 0.8572544, -1.27033, 0, 0, 0, 1, 1,
-0.1002785, 1.267131, -0.1429411, 0, 0, 0, 1, 1,
-0.09570254, 0.7035728, 0.5710967, 0, 0, 0, 1, 1,
-0.09462924, -0.6483757, -4.588712, 0, 0, 0, 1, 1,
-0.0941883, -0.4200422, -1.948289, 0, 0, 0, 1, 1,
-0.09292045, -0.1905685, -2.670971, 0, 0, 0, 1, 1,
-0.08742943, -0.1857676, -3.228593, 1, 1, 1, 1, 1,
-0.08680861, 0.3348323, -0.589146, 1, 1, 1, 1, 1,
-0.08526986, -0.3271913, -2.050702, 1, 1, 1, 1, 1,
-0.08504381, -0.7268926, -3.154016, 1, 1, 1, 1, 1,
-0.0840489, 0.1633569, -0.3677375, 1, 1, 1, 1, 1,
-0.08244408, 0.3883903, 0.04977892, 1, 1, 1, 1, 1,
-0.08206336, -0.5244893, -1.982648, 1, 1, 1, 1, 1,
-0.07784133, -1.45181, -1.143084, 1, 1, 1, 1, 1,
-0.06672076, -0.4216803, -4.883798, 1, 1, 1, 1, 1,
-0.06660329, 1.063845, 0.02241382, 1, 1, 1, 1, 1,
-0.06624846, -0.9610335, -2.205241, 1, 1, 1, 1, 1,
-0.05968774, 1.508814, 0.5823337, 1, 1, 1, 1, 1,
-0.05680113, 0.7217841, 1.520628, 1, 1, 1, 1, 1,
-0.05454564, 0.0007381122, -0.13035, 1, 1, 1, 1, 1,
-0.05407548, 1.194528, -0.2403579, 1, 1, 1, 1, 1,
-0.05160926, 0.1071598, -1.844601, 0, 0, 1, 1, 1,
-0.05071647, -0.854939, -4.428262, 1, 0, 0, 1, 1,
-0.04906172, 0.08608828, -0.8779145, 1, 0, 0, 1, 1,
-0.04874304, -0.5793828, -3.61828, 1, 0, 0, 1, 1,
-0.04770952, 0.7666168, 0.2734329, 1, 0, 0, 1, 1,
-0.04755621, -1.224355, -3.791407, 1, 0, 0, 1, 1,
-0.04647773, 2.163491, 0.06173079, 0, 0, 0, 1, 1,
-0.04638289, -0.4800996, -3.034963, 0, 0, 0, 1, 1,
-0.04012734, -0.2847629, -2.254929, 0, 0, 0, 1, 1,
-0.03842985, 0.550696, -0.0675232, 0, 0, 0, 1, 1,
-0.03826513, 0.07022136, -1.069386, 0, 0, 0, 1, 1,
-0.0382314, -0.7554794, -3.375607, 0, 0, 0, 1, 1,
-0.03570174, 1.08812, 0.5063305, 0, 0, 0, 1, 1,
-0.03519642, -1.275544, -3.39707, 1, 1, 1, 1, 1,
-0.03398093, 2.343605, 0.2371868, 1, 1, 1, 1, 1,
-0.03334312, -1.507017, -4.069868, 1, 1, 1, 1, 1,
-0.03279736, -0.4591506, -2.887719, 1, 1, 1, 1, 1,
-0.03145031, -0.1641568, -4.329939, 1, 1, 1, 1, 1,
-0.03112805, 0.04065454, -0.4780645, 1, 1, 1, 1, 1,
-0.03084405, -1.42341, -3.26519, 1, 1, 1, 1, 1,
-0.02971406, -1.100412, -5.094104, 1, 1, 1, 1, 1,
-0.02820547, -0.04562009, -3.029823, 1, 1, 1, 1, 1,
-0.02568765, 1.490058, -0.4302112, 1, 1, 1, 1, 1,
-0.02218616, -0.6960808, -2.582138, 1, 1, 1, 1, 1,
-0.01786744, 1.700567, -0.8630532, 1, 1, 1, 1, 1,
-0.01715609, 0.3237195, -1.309424, 1, 1, 1, 1, 1,
-0.01251605, -0.4459958, -4.218523, 1, 1, 1, 1, 1,
-0.0111714, -0.555995, -2.108743, 1, 1, 1, 1, 1,
-0.008547616, 0.9181545, 0.8274054, 0, 0, 1, 1, 1,
-0.007178138, 0.04910368, 0.3303047, 1, 0, 0, 1, 1,
-0.001948349, -2.060826, -3.723418, 1, 0, 0, 1, 1,
0.006516322, 2.689359, 1.772674, 1, 0, 0, 1, 1,
0.006545932, 2.882403, 1.876633, 1, 0, 0, 1, 1,
0.006970812, 0.5506659, 0.5036393, 1, 0, 0, 1, 1,
0.007648725, 1.362767, 1.570282, 0, 0, 0, 1, 1,
0.01037652, -0.9585168, 3.514123, 0, 0, 0, 1, 1,
0.01242135, -0.9887344, 3.06865, 0, 0, 0, 1, 1,
0.0154491, 1.111283, -1.428681, 0, 0, 0, 1, 1,
0.01558108, 0.1512732, -0.7697381, 0, 0, 0, 1, 1,
0.01572073, -0.5014122, 1.563635, 0, 0, 0, 1, 1,
0.01755, 0.05227314, 2.078784, 0, 0, 0, 1, 1,
0.01955428, -1.023882, 3.624861, 1, 1, 1, 1, 1,
0.02104551, -1.475406, 3.11131, 1, 1, 1, 1, 1,
0.02742381, 0.735564, -0.1661445, 1, 1, 1, 1, 1,
0.0292586, 0.09512732, -0.9210702, 1, 1, 1, 1, 1,
0.02959954, 0.5355763, -1.331907, 1, 1, 1, 1, 1,
0.02963173, -0.8358977, 2.780259, 1, 1, 1, 1, 1,
0.03138852, -1.310477, 2.340804, 1, 1, 1, 1, 1,
0.03185262, -0.3511962, 4.902866, 1, 1, 1, 1, 1,
0.03522445, 1.988426, 0.3397581, 1, 1, 1, 1, 1,
0.03645858, 0.03228112, 2.158836, 1, 1, 1, 1, 1,
0.03775107, -0.5792, 3.880108, 1, 1, 1, 1, 1,
0.0420773, -0.7452845, 2.286271, 1, 1, 1, 1, 1,
0.04317226, -0.01381493, 1.037411, 1, 1, 1, 1, 1,
0.04808154, 0.4628024, 0.7899296, 1, 1, 1, 1, 1,
0.0530185, -0.699568, 2.477531, 1, 1, 1, 1, 1,
0.05698121, -0.2288844, 2.514985, 0, 0, 1, 1, 1,
0.05895043, 2.141985, 0.1587225, 1, 0, 0, 1, 1,
0.06007375, 1.234498, -0.830962, 1, 0, 0, 1, 1,
0.06028366, 0.6312066, -0.5732719, 1, 0, 0, 1, 1,
0.06400674, -0.6036266, 4.875964, 1, 0, 0, 1, 1,
0.0643338, 2.069652, 1.933462, 1, 0, 0, 1, 1,
0.06998747, -0.02559631, 2.885935, 0, 0, 0, 1, 1,
0.07301386, -1.017808, 3.457133, 0, 0, 0, 1, 1,
0.07560546, 0.1951762, 0.6847765, 0, 0, 0, 1, 1,
0.07562046, 0.4760289, 1.520591, 0, 0, 0, 1, 1,
0.075721, 0.3690627, -0.3318816, 0, 0, 0, 1, 1,
0.07724183, -1.27377, 3.123173, 0, 0, 0, 1, 1,
0.08697598, 1.841309, -0.6539649, 0, 0, 0, 1, 1,
0.0881079, -0.6844313, 3.540854, 1, 1, 1, 1, 1,
0.08924522, -1.579562, 3.359406, 1, 1, 1, 1, 1,
0.0900104, -0.7155363, 2.356153, 1, 1, 1, 1, 1,
0.09086046, 1.248041, 0.1936834, 1, 1, 1, 1, 1,
0.09203426, -0.2016151, 0.9680672, 1, 1, 1, 1, 1,
0.09224284, -2.695635, 0.8532248, 1, 1, 1, 1, 1,
0.09310667, 1.457653, 1.527844, 1, 1, 1, 1, 1,
0.09766218, -0.2048207, 3.47395, 1, 1, 1, 1, 1,
0.09848125, 0.6384544, 0.04785383, 1, 1, 1, 1, 1,
0.09852066, -0.8990253, 1.147805, 1, 1, 1, 1, 1,
0.1066154, 1.521007, 1.311031, 1, 1, 1, 1, 1,
0.1086038, 0.456119, 0.1380757, 1, 1, 1, 1, 1,
0.1101159, -1.436028, 3.441223, 1, 1, 1, 1, 1,
0.1114161, 1.652514, 1.31163, 1, 1, 1, 1, 1,
0.1125521, -1.491206, 3.828329, 1, 1, 1, 1, 1,
0.1128792, 0.53846, 0.8657275, 0, 0, 1, 1, 1,
0.1135953, -0.4828802, 2.911337, 1, 0, 0, 1, 1,
0.1148866, -0.4635115, 4.538515, 1, 0, 0, 1, 1,
0.1160071, 0.8899426, -1.735964, 1, 0, 0, 1, 1,
0.1160497, 0.09894931, 2.323849, 1, 0, 0, 1, 1,
0.1189007, 2.273813, -2.690654, 1, 0, 0, 1, 1,
0.1192615, 0.3240149, 1.02697, 0, 0, 0, 1, 1,
0.1229574, -1.38023, 3.38263, 0, 0, 0, 1, 1,
0.1250176, 0.1259401, -0.5819333, 0, 0, 0, 1, 1,
0.1264147, -0.05169563, 1.437452, 0, 0, 0, 1, 1,
0.1270569, 0.08544782, 1.164179, 0, 0, 0, 1, 1,
0.1299476, 0.2768251, 0.3640627, 0, 0, 0, 1, 1,
0.1300494, 0.6945223, -0.4953351, 0, 0, 0, 1, 1,
0.1364765, -1.456611, 2.313243, 1, 1, 1, 1, 1,
0.1377678, -0.3593655, 2.021541, 1, 1, 1, 1, 1,
0.1392604, 0.6978038, 0.5205281, 1, 1, 1, 1, 1,
0.1412263, -0.5981532, 2.344198, 1, 1, 1, 1, 1,
0.1444685, 0.4541837, -0.4307381, 1, 1, 1, 1, 1,
0.144855, -2.308402, 3.345731, 1, 1, 1, 1, 1,
0.1456135, 0.9834651, 0.6684514, 1, 1, 1, 1, 1,
0.1458933, -0.7802875, 5.231067, 1, 1, 1, 1, 1,
0.1462975, -0.7835827, 0.2605956, 1, 1, 1, 1, 1,
0.1497511, 1.416085, 1.271275, 1, 1, 1, 1, 1,
0.1510282, -0.8638254, 2.828965, 1, 1, 1, 1, 1,
0.1561111, 0.6385051, 0.7878109, 1, 1, 1, 1, 1,
0.1716717, 1.444525, 0.951047, 1, 1, 1, 1, 1,
0.1765996, -1.104774, 2.195177, 1, 1, 1, 1, 1,
0.1766447, 1.558082, -0.6700315, 1, 1, 1, 1, 1,
0.1767429, -0.06075356, 2.128615, 0, 0, 1, 1, 1,
0.1769579, 0.3620895, 2.137677, 1, 0, 0, 1, 1,
0.1770262, -0.3433333, 1.209245, 1, 0, 0, 1, 1,
0.1775513, 1.310796, 0.1030111, 1, 0, 0, 1, 1,
0.1793217, -0.05161931, 2.15413, 1, 0, 0, 1, 1,
0.1858221, -0.6990713, 1.96921, 1, 0, 0, 1, 1,
0.1864912, 0.243843, 1.350974, 0, 0, 0, 1, 1,
0.188013, 2.040505, 0.4999134, 0, 0, 0, 1, 1,
0.1913791, -0.004792185, 0.509818, 0, 0, 0, 1, 1,
0.1927723, -1.547953, 3.705378, 0, 0, 0, 1, 1,
0.193819, 0.2550343, 0.5456629, 0, 0, 0, 1, 1,
0.1958769, -0.3369928, 3.727409, 0, 0, 0, 1, 1,
0.1972165, -0.05927929, 2.817875, 0, 0, 0, 1, 1,
0.1985228, -1.16469, 3.02999, 1, 1, 1, 1, 1,
0.2032567, -1.808217, 3.985478, 1, 1, 1, 1, 1,
0.2035195, 1.333522, 0.1211585, 1, 1, 1, 1, 1,
0.2067144, 0.9894192, 0.5372883, 1, 1, 1, 1, 1,
0.2099254, -0.3314576, 1.112992, 1, 1, 1, 1, 1,
0.2106064, -1.114604, 2.056875, 1, 1, 1, 1, 1,
0.2129692, 0.9351827, 1.138795, 1, 1, 1, 1, 1,
0.2194487, 0.6575502, -0.1076937, 1, 1, 1, 1, 1,
0.2200123, 0.8379295, -0.600633, 1, 1, 1, 1, 1,
0.2228519, -1.22308, 3.625069, 1, 1, 1, 1, 1,
0.2265573, -0.3457797, 4.815946, 1, 1, 1, 1, 1,
0.2276467, -1.499537, 0.8579521, 1, 1, 1, 1, 1,
0.2284035, -1.134533, 4.04481, 1, 1, 1, 1, 1,
0.2319789, 1.528202, -0.2846636, 1, 1, 1, 1, 1,
0.2359269, 2.143101, 0.2463278, 1, 1, 1, 1, 1,
0.2372014, -0.7892758, 1.796209, 0, 0, 1, 1, 1,
0.2391539, -1.494877, 2.356593, 1, 0, 0, 1, 1,
0.2394823, 0.5445392, 1.205052, 1, 0, 0, 1, 1,
0.2398968, 0.976318, -0.3148954, 1, 0, 0, 1, 1,
0.2403084, 0.2653913, -0.2894679, 1, 0, 0, 1, 1,
0.240368, -1.942211, 4.259367, 1, 0, 0, 1, 1,
0.2458474, -0.5896164, 2.64019, 0, 0, 0, 1, 1,
0.2525729, 3.000428, -0.3605549, 0, 0, 0, 1, 1,
0.2540342, -0.521866, 4.512672, 0, 0, 0, 1, 1,
0.256949, 0.7812415, -0.7142719, 0, 0, 0, 1, 1,
0.2653765, -0.2207544, 1.686644, 0, 0, 0, 1, 1,
0.2671866, 1.442576, 0.2431626, 0, 0, 0, 1, 1,
0.27708, -1.818042, 3.905011, 0, 0, 0, 1, 1,
0.2803833, -1.710425, 2.384231, 1, 1, 1, 1, 1,
0.2840624, 1.566397, -1.073791, 1, 1, 1, 1, 1,
0.2852578, -1.759581, 4.694267, 1, 1, 1, 1, 1,
0.2865162, -0.148838, 1.892391, 1, 1, 1, 1, 1,
0.2893653, -0.6766672, 3.843842, 1, 1, 1, 1, 1,
0.2905481, -1.808866, 3.757656, 1, 1, 1, 1, 1,
0.2923383, 1.700159, -2.265929, 1, 1, 1, 1, 1,
0.3013547, 0.7772984, 0.4517834, 1, 1, 1, 1, 1,
0.3061959, 0.03358067, 2.77031, 1, 1, 1, 1, 1,
0.3081164, -0.3749191, 2.82221, 1, 1, 1, 1, 1,
0.312121, 0.1969287, 0.2498821, 1, 1, 1, 1, 1,
0.3157829, 0.833569, 0.7599117, 1, 1, 1, 1, 1,
0.3208941, 1.056505, 1.98549, 1, 1, 1, 1, 1,
0.3260755, 0.3266307, 0.6110621, 1, 1, 1, 1, 1,
0.32845, -1.236417, 2.290853, 1, 1, 1, 1, 1,
0.3298763, 0.6523402, 0.3637952, 0, 0, 1, 1, 1,
0.3318805, -0.05482291, 2.250957, 1, 0, 0, 1, 1,
0.3322667, -0.5764013, 3.266483, 1, 0, 0, 1, 1,
0.3330897, 0.6319442, 0.7528053, 1, 0, 0, 1, 1,
0.3339063, 2.639665, 0.3465193, 1, 0, 0, 1, 1,
0.3349099, -0.8605249, 1.651527, 1, 0, 0, 1, 1,
0.3361878, 1.577432, 0.8288986, 0, 0, 0, 1, 1,
0.3395905, -0.4869107, 1.105399, 0, 0, 0, 1, 1,
0.3435298, -0.1647025, 1.520111, 0, 0, 0, 1, 1,
0.3443817, -1.549922, 2.879316, 0, 0, 0, 1, 1,
0.344851, -0.3610412, 0.9193851, 0, 0, 0, 1, 1,
0.3459228, 0.3166101, -0.3441353, 0, 0, 0, 1, 1,
0.346546, -0.495797, 3.621907, 0, 0, 0, 1, 1,
0.3468616, -0.5573657, 4.493532, 1, 1, 1, 1, 1,
0.3483447, 0.3425433, 1.833066, 1, 1, 1, 1, 1,
0.3504185, 1.545591, 2.703133, 1, 1, 1, 1, 1,
0.3506373, -2.071733, 3.341649, 1, 1, 1, 1, 1,
0.3515588, 1.056438, 1.244393, 1, 1, 1, 1, 1,
0.3518846, 0.1933954, 1.901743, 1, 1, 1, 1, 1,
0.3599364, 0.5581519, 0.1503145, 1, 1, 1, 1, 1,
0.3601359, 0.2200628, 0.02310596, 1, 1, 1, 1, 1,
0.3623004, 1.103701, 0.8443859, 1, 1, 1, 1, 1,
0.3672256, 1.237107, -1.245162, 1, 1, 1, 1, 1,
0.3702706, -0.6447168, 2.63155, 1, 1, 1, 1, 1,
0.3709493, 0.4818962, 0.6497669, 1, 1, 1, 1, 1,
0.3721985, 0.7351431, -0.5503622, 1, 1, 1, 1, 1,
0.3749104, 0.7538975, 0.6363404, 1, 1, 1, 1, 1,
0.3777539, 1.782218, -1.508026, 1, 1, 1, 1, 1,
0.3807078, 0.5656046, 0.5595189, 0, 0, 1, 1, 1,
0.3817925, 1.776992, 0.3800792, 1, 0, 0, 1, 1,
0.3836243, -0.6009374, 2.76288, 1, 0, 0, 1, 1,
0.3985794, 1.281924, 0.3963127, 1, 0, 0, 1, 1,
0.3996095, 0.1586793, 1.293893, 1, 0, 0, 1, 1,
0.400283, -1.3102, 4.56341, 1, 0, 0, 1, 1,
0.4078647, -0.7197128, 1.94775, 0, 0, 0, 1, 1,
0.4144692, -0.2660765, 1.989822, 0, 0, 0, 1, 1,
0.4159047, 0.7340474, -0.7860161, 0, 0, 0, 1, 1,
0.4202477, 0.7527705, 1.767556, 0, 0, 0, 1, 1,
0.4219918, -1.542019, 0.9665633, 0, 0, 0, 1, 1,
0.4222414, 0.2398455, 0.6614156, 0, 0, 0, 1, 1,
0.4266459, -0.1120453, 2.385483, 0, 0, 0, 1, 1,
0.4292385, -1.740887, 2.001203, 1, 1, 1, 1, 1,
0.4346152, 0.9236549, 0.1476183, 1, 1, 1, 1, 1,
0.435881, -0.03487824, 3.698526, 1, 1, 1, 1, 1,
0.4393648, 1.127883, 0.8594654, 1, 1, 1, 1, 1,
0.4447617, 0.5004991, 2.739836, 1, 1, 1, 1, 1,
0.4453265, 1.173148, 1.280636, 1, 1, 1, 1, 1,
0.4477563, 0.07153824, 1.503879, 1, 1, 1, 1, 1,
0.4481688, 0.3224504, 2.373126, 1, 1, 1, 1, 1,
0.4520119, 0.3688181, 0.4645666, 1, 1, 1, 1, 1,
0.4550782, 0.2460247, -1.872397, 1, 1, 1, 1, 1,
0.4562318, -0.06871766, 3.582558, 1, 1, 1, 1, 1,
0.4589614, 1.286997, -1.000582, 1, 1, 1, 1, 1,
0.4607311, -0.4963029, 2.86755, 1, 1, 1, 1, 1,
0.4608142, -0.1812521, 3.513924, 1, 1, 1, 1, 1,
0.4642834, 1.099873, 2.623456, 1, 1, 1, 1, 1,
0.468607, -1.000898, 2.368743, 0, 0, 1, 1, 1,
0.468904, 0.8100749, 0.9938332, 1, 0, 0, 1, 1,
0.4705622, -0.0631925, 1.260206, 1, 0, 0, 1, 1,
0.4765959, 0.1786975, 2.248069, 1, 0, 0, 1, 1,
0.4775973, 1.531041, -0.04347071, 1, 0, 0, 1, 1,
0.4840668, 0.2258168, 1.582747, 1, 0, 0, 1, 1,
0.4857154, 1.270874, 0.1372682, 0, 0, 0, 1, 1,
0.4857849, 1.970629, -0.08500611, 0, 0, 0, 1, 1,
0.4887396, 1.994057, 0.02568637, 0, 0, 0, 1, 1,
0.502438, 0.07817981, 0.6139878, 0, 0, 0, 1, 1,
0.5038025, 0.2090259, 1.046908, 0, 0, 0, 1, 1,
0.5055996, 0.2398168, 3.322685, 0, 0, 0, 1, 1,
0.5061157, 0.1127028, 1.831663, 0, 0, 0, 1, 1,
0.5140335, 0.07083796, 3.084557, 1, 1, 1, 1, 1,
0.5183719, -0.9707804, 4.517184, 1, 1, 1, 1, 1,
0.5192266, -0.5356604, 0.8278882, 1, 1, 1, 1, 1,
0.5244241, 1.967818, 0.5550265, 1, 1, 1, 1, 1,
0.5291609, -2.065532, 3.849702, 1, 1, 1, 1, 1,
0.531902, -0.3561128, 1.769921, 1, 1, 1, 1, 1,
0.5319465, 0.7955233, -0.893216, 1, 1, 1, 1, 1,
0.5334343, -1.569635, 5.744828, 1, 1, 1, 1, 1,
0.5402587, -1.22417, 5.090002, 1, 1, 1, 1, 1,
0.5433024, 1.163478, 1.015608, 1, 1, 1, 1, 1,
0.5437622, 0.217387, 3.268161, 1, 1, 1, 1, 1,
0.5442884, 1.139797, 0.5212659, 1, 1, 1, 1, 1,
0.5508376, -0.5908405, 2.215247, 1, 1, 1, 1, 1,
0.5552902, -0.0680184, 4.593581, 1, 1, 1, 1, 1,
0.5590346, 0.2039286, 1.904185, 1, 1, 1, 1, 1,
0.5596848, 0.1050635, 0.3430549, 0, 0, 1, 1, 1,
0.5622579, 1.077423, 0.3467704, 1, 0, 0, 1, 1,
0.5635736, -2.104214, 3.356781, 1, 0, 0, 1, 1,
0.5646883, 0.7852048, 2.397574, 1, 0, 0, 1, 1,
0.568278, -0.3161995, 2.438726, 1, 0, 0, 1, 1,
0.5734623, -1.138479, 2.127246, 1, 0, 0, 1, 1,
0.5778833, -0.7348104, 2.461393, 0, 0, 0, 1, 1,
0.5786955, 0.5285686, 0.7764108, 0, 0, 0, 1, 1,
0.586561, -0.8136809, 2.919312, 0, 0, 0, 1, 1,
0.5880613, -0.304802, 1.086668, 0, 0, 0, 1, 1,
0.5909622, -1.188496, 2.193194, 0, 0, 0, 1, 1,
0.5926933, -0.4769653, 4.303667, 0, 0, 0, 1, 1,
0.59642, 1.091678, -0.8649837, 0, 0, 0, 1, 1,
0.5977921, 0.5655366, 1.12554, 1, 1, 1, 1, 1,
0.6027802, -0.2701346, 3.358149, 1, 1, 1, 1, 1,
0.6028031, -0.6032805, 1.345173, 1, 1, 1, 1, 1,
0.6062693, 1.632725, 0.6096318, 1, 1, 1, 1, 1,
0.6083503, -0.461813, 2.944869, 1, 1, 1, 1, 1,
0.610713, -2.33396, 3.95851, 1, 1, 1, 1, 1,
0.6114405, -0.6179309, 1.190854, 1, 1, 1, 1, 1,
0.6116841, -1.035426, 4.122035, 1, 1, 1, 1, 1,
0.6125491, 1.509265, 0.3894437, 1, 1, 1, 1, 1,
0.616981, -0.2162568, 0.7210327, 1, 1, 1, 1, 1,
0.6227294, -0.08371431, 2.844375, 1, 1, 1, 1, 1,
0.6274783, 1.491724, 1.488253, 1, 1, 1, 1, 1,
0.6279857, 0.4523514, 1.752324, 1, 1, 1, 1, 1,
0.6302871, 0.5417188, 1.578229, 1, 1, 1, 1, 1,
0.634887, -0.3011511, 1.0397, 1, 1, 1, 1, 1,
0.6359975, -0.4601938, 3.562609, 0, 0, 1, 1, 1,
0.6368104, -0.1212471, 3.621824, 1, 0, 0, 1, 1,
0.6390694, -1.714596, 1.633942, 1, 0, 0, 1, 1,
0.642543, -0.2355621, 2.60633, 1, 0, 0, 1, 1,
0.6434045, -1.851339, 3.057364, 1, 0, 0, 1, 1,
0.6447095, -1.667839, 2.593952, 1, 0, 0, 1, 1,
0.6493088, 0.9622164, -0.8642427, 0, 0, 0, 1, 1,
0.655041, 2.139621, 0.4448649, 0, 0, 0, 1, 1,
0.6610876, -0.5407375, 3.138946, 0, 0, 0, 1, 1,
0.6639448, 0.2087384, 0.7338177, 0, 0, 0, 1, 1,
0.6688603, 0.3611959, 0.1836387, 0, 0, 0, 1, 1,
0.6797978, -2.474706, 4.516115, 0, 0, 0, 1, 1,
0.687587, -0.6804644, 2.887153, 0, 0, 0, 1, 1,
0.6919196, -0.2481603, 2.296998, 1, 1, 1, 1, 1,
0.6928337, -0.1639363, 2.372078, 1, 1, 1, 1, 1,
0.6952119, 0.4917618, 0.8198208, 1, 1, 1, 1, 1,
0.7043049, -1.953784, 1.500153, 1, 1, 1, 1, 1,
0.7048559, -0.7916255, 2.058239, 1, 1, 1, 1, 1,
0.7072544, 2.156446, -1.004005, 1, 1, 1, 1, 1,
0.7133995, -0.4115552, 1.015702, 1, 1, 1, 1, 1,
0.7158427, -0.2131031, 1.767376, 1, 1, 1, 1, 1,
0.7171743, -0.8065704, 3.196153, 1, 1, 1, 1, 1,
0.7204913, -0.7329614, 1.826925, 1, 1, 1, 1, 1,
0.7249405, -0.6910173, 2.982656, 1, 1, 1, 1, 1,
0.7273972, 0.0002348546, 0.5014102, 1, 1, 1, 1, 1,
0.7328358, 0.7651657, 0.03405549, 1, 1, 1, 1, 1,
0.7340063, 0.1405579, 2.291923, 1, 1, 1, 1, 1,
0.7348908, -0.8726954, 0.1552238, 1, 1, 1, 1, 1,
0.7447013, 0.4808971, 0.8230402, 0, 0, 1, 1, 1,
0.7486598, -0.1559229, 0.8766289, 1, 0, 0, 1, 1,
0.7526618, 0.1619175, 3.649215, 1, 0, 0, 1, 1,
0.7556797, -1.757896, 3.351711, 1, 0, 0, 1, 1,
0.7566158, 1.079319, 1.169965, 1, 0, 0, 1, 1,
0.7578652, -0.2823926, 2.95822, 1, 0, 0, 1, 1,
0.7579179, -0.0147638, 1.492956, 0, 0, 0, 1, 1,
0.7579179, 2.030812, 0.894942, 0, 0, 0, 1, 1,
0.7615215, -0.3157139, 1.034091, 0, 0, 0, 1, 1,
0.7660941, 0.02110148, 1.051618, 0, 0, 0, 1, 1,
0.7673765, -0.4261482, 2.563083, 0, 0, 0, 1, 1,
0.7742347, 0.4414884, 3.115448, 0, 0, 0, 1, 1,
0.7747455, 0.7217762, 3.322749, 0, 0, 0, 1, 1,
0.7861072, -1.320786, 3.491324, 1, 1, 1, 1, 1,
0.7880877, 0.8668035, 1.602839, 1, 1, 1, 1, 1,
0.7992363, 0.2721311, 0.6094499, 1, 1, 1, 1, 1,
0.8104697, -0.4437077, 0.4413683, 1, 1, 1, 1, 1,
0.8119357, -1.710568, 2.736459, 1, 1, 1, 1, 1,
0.8136675, -0.01188621, 3.357779, 1, 1, 1, 1, 1,
0.8176555, -0.084953, 2.155398, 1, 1, 1, 1, 1,
0.821371, -0.3575574, 1.86158, 1, 1, 1, 1, 1,
0.8253608, 1.352238, 1.702199, 1, 1, 1, 1, 1,
0.8283449, -0.2495756, 2.814634, 1, 1, 1, 1, 1,
0.8317738, -0.3301976, 1.297135, 1, 1, 1, 1, 1,
0.8323538, -0.1712339, 2.758283, 1, 1, 1, 1, 1,
0.8327906, -0.3425873, 1.485393, 1, 1, 1, 1, 1,
0.8341935, -0.5063511, 1.908387, 1, 1, 1, 1, 1,
0.8375547, -0.1126738, 1.017663, 1, 1, 1, 1, 1,
0.8420075, 0.9030688, -0.4621002, 0, 0, 1, 1, 1,
0.8524022, 1.310891, -1.291466, 1, 0, 0, 1, 1,
0.858758, -0.3279764, 1.377793, 1, 0, 0, 1, 1,
0.8591259, 0.6016037, 2.191653, 1, 0, 0, 1, 1,
0.8692546, -0.2074946, 2.033763, 1, 0, 0, 1, 1,
0.8790337, -0.9539118, 2.968667, 1, 0, 0, 1, 1,
0.8892881, -0.2052902, 3.467261, 0, 0, 0, 1, 1,
0.8942346, 2.099824, 1.444362, 0, 0, 0, 1, 1,
0.9041662, 0.608402, 1.406824, 0, 0, 0, 1, 1,
0.9069992, 1.176363, 0.3940556, 0, 0, 0, 1, 1,
0.9113066, 1.040629, -1.089347, 0, 0, 0, 1, 1,
0.9152632, -1.746331, 2.083584, 0, 0, 0, 1, 1,
0.9222547, 0.1864384, 0.9775533, 0, 0, 0, 1, 1,
0.9285589, 0.3939171, 0.7820169, 1, 1, 1, 1, 1,
0.9327129, 0.2080763, 2.995146, 1, 1, 1, 1, 1,
0.93405, -0.499036, 2.005981, 1, 1, 1, 1, 1,
0.9341515, -0.7409124, 1.849805, 1, 1, 1, 1, 1,
0.9368647, -1.226041, 1.948014, 1, 1, 1, 1, 1,
0.9369206, 0.6387275, 1.831165, 1, 1, 1, 1, 1,
0.9429479, 0.5961006, -0.6364309, 1, 1, 1, 1, 1,
0.9468912, 0.2837582, 0.7634217, 1, 1, 1, 1, 1,
0.9492303, 0.4672903, 1.433242, 1, 1, 1, 1, 1,
0.9525656, 0.4890878, 0.9079966, 1, 1, 1, 1, 1,
0.9636032, -1.410349, 3.219868, 1, 1, 1, 1, 1,
0.9736274, 0.4554075, 0.8168914, 1, 1, 1, 1, 1,
0.9739528, -0.9201425, 2.074491, 1, 1, 1, 1, 1,
0.9760305, 0.518513, 1.270015, 1, 1, 1, 1, 1,
0.9768528, 0.09980711, 1.231912, 1, 1, 1, 1, 1,
0.979459, 0.8524764, 0.1132143, 0, 0, 1, 1, 1,
0.9914675, -0.3474778, 1.62795, 1, 0, 0, 1, 1,
0.9953361, 1.471891, 1.2769, 1, 0, 0, 1, 1,
0.9960169, -0.3355017, 1.965451, 1, 0, 0, 1, 1,
0.9964661, -0.916697, 3.399594, 1, 0, 0, 1, 1,
0.9969617, -0.4037388, 3.702979, 1, 0, 0, 1, 1,
1.006715, 0.8793786, -0.08240864, 0, 0, 0, 1, 1,
1.012969, -0.5928869, 1.44838, 0, 0, 0, 1, 1,
1.018899, 0.3888322, 1.578286, 0, 0, 0, 1, 1,
1.021239, -2.399364, 3.397472, 0, 0, 0, 1, 1,
1.023123, 1.534818, 1.600578, 0, 0, 0, 1, 1,
1.032272, 0.3065281, -0.0678057, 0, 0, 0, 1, 1,
1.036688, 0.9735771, 0.4445279, 0, 0, 0, 1, 1,
1.038394, -0.6297138, 2.902068, 1, 1, 1, 1, 1,
1.041475, -0.5770869, 1.704244, 1, 1, 1, 1, 1,
1.0436, 1.793338, -0.4700858, 1, 1, 1, 1, 1,
1.046301, 0.2319606, 0.7792524, 1, 1, 1, 1, 1,
1.047703, -0.698482, 2.056517, 1, 1, 1, 1, 1,
1.050877, 0.2411801, 0.9426696, 1, 1, 1, 1, 1,
1.051379, -0.1934436, 2.109629, 1, 1, 1, 1, 1,
1.058497, 1.265521, -0.1287101, 1, 1, 1, 1, 1,
1.059049, 1.360469, 1.236626, 1, 1, 1, 1, 1,
1.061372, -1.372159, 2.42609, 1, 1, 1, 1, 1,
1.071907, 0.4041262, 1.013921, 1, 1, 1, 1, 1,
1.073091, 0.2643073, 1.776652, 1, 1, 1, 1, 1,
1.073338, -0.8326867, 2.858059, 1, 1, 1, 1, 1,
1.075303, 0.5416101, -0.8097628, 1, 1, 1, 1, 1,
1.075758, -1.232766, 1.997552, 1, 1, 1, 1, 1,
1.080631, -1.893347, 3.381646, 0, 0, 1, 1, 1,
1.087752, -0.3540842, 1.674299, 1, 0, 0, 1, 1,
1.089782, -1.711545, 3.285302, 1, 0, 0, 1, 1,
1.093618, 0.1357736, 0.6797289, 1, 0, 0, 1, 1,
1.094327, 1.19478, 1.052163, 1, 0, 0, 1, 1,
1.103779, 1.667464, -0.3921424, 1, 0, 0, 1, 1,
1.10709, 0.8645556, 1.624266, 0, 0, 0, 1, 1,
1.113466, 1.289406, 2.249026, 0, 0, 0, 1, 1,
1.121454, -0.2936037, 2.197669, 0, 0, 0, 1, 1,
1.12505, 0.5569936, 1.038391, 0, 0, 0, 1, 1,
1.128713, 0.09973934, 1.506739, 0, 0, 0, 1, 1,
1.136579, -0.6082131, 2.459077, 0, 0, 0, 1, 1,
1.142596, -0.448886, 1.101735, 0, 0, 0, 1, 1,
1.145332, 1.630232, 1.128627, 1, 1, 1, 1, 1,
1.153179, 1.115271, 0.9145149, 1, 1, 1, 1, 1,
1.155059, 0.8933468, 1.829525, 1, 1, 1, 1, 1,
1.166363, -0.8805257, 1.194241, 1, 1, 1, 1, 1,
1.16703, 0.731113, 1.482749, 1, 1, 1, 1, 1,
1.16714, -1.8424, 1.81496, 1, 1, 1, 1, 1,
1.170745, 0.2558971, 3.009513, 1, 1, 1, 1, 1,
1.174452, -0.337322, 1.322452, 1, 1, 1, 1, 1,
1.182688, -0.3724407, 2.636671, 1, 1, 1, 1, 1,
1.184916, -0.3321947, 2.970523, 1, 1, 1, 1, 1,
1.187225, -0.3084718, 1.929221, 1, 1, 1, 1, 1,
1.187504, -0.08939517, 0.9049563, 1, 1, 1, 1, 1,
1.189485, 0.8227492, 0.9565846, 1, 1, 1, 1, 1,
1.204907, -0.6068457, 1.823122, 1, 1, 1, 1, 1,
1.205165, -0.301576, 1.60756, 1, 1, 1, 1, 1,
1.208343, -0.03610364, 1.700798, 0, 0, 1, 1, 1,
1.209441, 3.142405, 0.9695191, 1, 0, 0, 1, 1,
1.222289, 0.7853549, 1.464738, 1, 0, 0, 1, 1,
1.228232, -0.3785633, 1.613648, 1, 0, 0, 1, 1,
1.238395, 0.8997343, 3.309861, 1, 0, 0, 1, 1,
1.247567, -0.3772051, 2.933901, 1, 0, 0, 1, 1,
1.247809, -0.3359019, 1.826109, 0, 0, 0, 1, 1,
1.256139, 0.4323694, 1.054894, 0, 0, 0, 1, 1,
1.258953, 1.44788, 0.570785, 0, 0, 0, 1, 1,
1.263833, 1.038486, 0.4877851, 0, 0, 0, 1, 1,
1.273435, 0.8928871, 0.4609371, 0, 0, 0, 1, 1,
1.294621, -1.172129, -0.8977832, 0, 0, 0, 1, 1,
1.295835, 0.3489518, 0.911943, 0, 0, 0, 1, 1,
1.297721, 0.854646, -0.480076, 1, 1, 1, 1, 1,
1.303899, -1.269969, 1.951101, 1, 1, 1, 1, 1,
1.306196, 0.07180256, 1.941116, 1, 1, 1, 1, 1,
1.308879, -1.449266, 2.095031, 1, 1, 1, 1, 1,
1.309505, 1.773461, 0.6518702, 1, 1, 1, 1, 1,
1.315488, 1.218458, -1.94771, 1, 1, 1, 1, 1,
1.316463, -0.3016868, 2.539458, 1, 1, 1, 1, 1,
1.322272, 0.2061102, 1.376093, 1, 1, 1, 1, 1,
1.324738, 0.132024, 0.5350992, 1, 1, 1, 1, 1,
1.325253, 0.3754243, 0.3525876, 1, 1, 1, 1, 1,
1.331604, -0.7421744, 1.112673, 1, 1, 1, 1, 1,
1.33346, -1.338286, 2.580909, 1, 1, 1, 1, 1,
1.338778, -0.308623, 3.098749, 1, 1, 1, 1, 1,
1.338843, -0.0508995, -0.3803168, 1, 1, 1, 1, 1,
1.339082, -0.03282799, 1.710914, 1, 1, 1, 1, 1,
1.349366, -0.006964019, 1.135187, 0, 0, 1, 1, 1,
1.36315, -0.3557196, -0.1499378, 1, 0, 0, 1, 1,
1.375689, -1.990166, 0.6313269, 1, 0, 0, 1, 1,
1.383321, 1.001004, 2.519744, 1, 0, 0, 1, 1,
1.39158, 0.9624956, 0.5701953, 1, 0, 0, 1, 1,
1.391615, 1.140452, -0.1125623, 1, 0, 0, 1, 1,
1.396151, 0.1875513, 1.52336, 0, 0, 0, 1, 1,
1.400045, 0.5853146, 2.354337, 0, 0, 0, 1, 1,
1.400527, -0.1599117, 1.383073, 0, 0, 0, 1, 1,
1.41079, 0.7791258, -0.6722316, 0, 0, 0, 1, 1,
1.425477, -0.6207278, 1.496221, 0, 0, 0, 1, 1,
1.438311, 0.09279799, -0.1314054, 0, 0, 0, 1, 1,
1.439036, -0.6151586, 1.619425, 0, 0, 0, 1, 1,
1.449765, 0.7134773, 1.927867, 1, 1, 1, 1, 1,
1.450708, -2.884648, 2.019979, 1, 1, 1, 1, 1,
1.450896, -0.4605564, 3.723722, 1, 1, 1, 1, 1,
1.4607, 1.417267, -1.211625, 1, 1, 1, 1, 1,
1.462373, -0.3562352, 1.779475, 1, 1, 1, 1, 1,
1.465932, 1.294862, 1.993354, 1, 1, 1, 1, 1,
1.477029, -0.7071222, 1.721877, 1, 1, 1, 1, 1,
1.486327, 0.9612623, 0.04193341, 1, 1, 1, 1, 1,
1.488556, -1.078098, 2.94515, 1, 1, 1, 1, 1,
1.492033, -0.1253692, 1.136309, 1, 1, 1, 1, 1,
1.496965, 0.7703713, 1.82852, 1, 1, 1, 1, 1,
1.499296, 1.429355, 1.616496, 1, 1, 1, 1, 1,
1.515374, 2.295153, -0.2243733, 1, 1, 1, 1, 1,
1.516944, -2.583182, 3.105405, 1, 1, 1, 1, 1,
1.520807, 1.006222, 0.3667759, 1, 1, 1, 1, 1,
1.528771, -0.6375232, 3.145491, 0, 0, 1, 1, 1,
1.54214, 1.759454, 0.7170353, 1, 0, 0, 1, 1,
1.544205, -0.4280529, 1.634227, 1, 0, 0, 1, 1,
1.54872, 1.498693, -1.027952, 1, 0, 0, 1, 1,
1.563502, -1.484813, 2.342038, 1, 0, 0, 1, 1,
1.567738, -1.394989, 3.097469, 1, 0, 0, 1, 1,
1.593679, 2.644888, -0.848155, 0, 0, 0, 1, 1,
1.598496, 1.102324, 0.5003774, 0, 0, 0, 1, 1,
1.602045, -0.2198926, 0.8259954, 0, 0, 0, 1, 1,
1.628675, 0.7328261, 0.1225447, 0, 0, 0, 1, 1,
1.642922, -1.142014, 2.690814, 0, 0, 0, 1, 1,
1.648375, 1.055761, -0.7026788, 0, 0, 0, 1, 1,
1.652468, -0.5384567, 1.313823, 0, 0, 0, 1, 1,
1.654254, 0.1954632, 0.4610907, 1, 1, 1, 1, 1,
1.686106, 2.299045, 2.229098, 1, 1, 1, 1, 1,
1.713117, -0.8005486, 2.103019, 1, 1, 1, 1, 1,
1.7195, 0.07907978, 0.5335726, 1, 1, 1, 1, 1,
1.720221, 0.05146418, 1.354588, 1, 1, 1, 1, 1,
1.747278, -1.425844, 3.243083, 1, 1, 1, 1, 1,
1.776059, -1.497709, 2.810282, 1, 1, 1, 1, 1,
1.77905, 1.088324, 1.184001, 1, 1, 1, 1, 1,
1.78211, -0.5119643, -0.714465, 1, 1, 1, 1, 1,
1.791064, 1.310913, -1.001187, 1, 1, 1, 1, 1,
1.811909, -0.3271754, 1.633098, 1, 1, 1, 1, 1,
1.829258, -0.234429, 1.583583, 1, 1, 1, 1, 1,
1.868003, -0.8353081, 3.099468, 1, 1, 1, 1, 1,
1.873541, 0.2888144, 2.497963, 1, 1, 1, 1, 1,
1.874757, 0.9426159, 1.091088, 1, 1, 1, 1, 1,
1.883611, -0.1324685, 2.479165, 0, 0, 1, 1, 1,
1.887988, 1.667623, 0.7399039, 1, 0, 0, 1, 1,
1.954576, 1.036755, 0.6708642, 1, 0, 0, 1, 1,
1.957222, 1.68688, -1.17069, 1, 0, 0, 1, 1,
1.989692, -0.07452399, 0.5561807, 1, 0, 0, 1, 1,
2.079109, -0.4448674, 0.7743722, 1, 0, 0, 1, 1,
2.094317, -0.1480078, 2.431625, 0, 0, 0, 1, 1,
2.104278, 0.4639235, 1.07028, 0, 0, 0, 1, 1,
2.125096, 0.8566906, 1.78043, 0, 0, 0, 1, 1,
2.246354, 0.5426856, 2.077754, 0, 0, 0, 1, 1,
2.253123, 0.3407849, 1.27445, 0, 0, 0, 1, 1,
2.279378, -0.02473698, 2.222297, 0, 0, 0, 1, 1,
2.359104, 0.4499639, 1.426286, 0, 0, 0, 1, 1,
2.377348, -1.844687, 1.137352, 1, 1, 1, 1, 1,
2.396959, 0.3502259, 0.4174291, 1, 1, 1, 1, 1,
2.435883, -0.4690794, 1.357671, 1, 1, 1, 1, 1,
2.440675, 2.544458, 1.831874, 1, 1, 1, 1, 1,
2.53444, -0.8972729, 0.2147493, 1, 1, 1, 1, 1,
2.616409, -0.5398005, 1.231164, 1, 1, 1, 1, 1,
3.227057, 0.3311866, 1.805012, 1, 1, 1, 1, 1
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
var radius = 9.721205;
var distance = 34.14532;
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
mvMatrix.translate( 0.00428772, -0.1288784, -0.1049473 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14532);
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