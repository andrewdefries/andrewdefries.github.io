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
-3.1946, -1.85958, -4.384472, 1, 0, 0, 1,
-2.857564, -0.941842, -1.535819, 1, 0.007843138, 0, 1,
-2.723481, 0.7092447, -1.779013, 1, 0.01176471, 0, 1,
-2.605012, -0.3051243, -0.9861567, 1, 0.01960784, 0, 1,
-2.597405, -0.1965947, -1.649164, 1, 0.02352941, 0, 1,
-2.526489, -1.330759, -3.220303, 1, 0.03137255, 0, 1,
-2.525375, 1.087708, -2.596078, 1, 0.03529412, 0, 1,
-2.523652, 1.053044, -1.634913, 1, 0.04313726, 0, 1,
-2.435565, 1.023207, -0.5856694, 1, 0.04705882, 0, 1,
-2.337645, -0.20854, -3.080178, 1, 0.05490196, 0, 1,
-2.257154, 0.1815338, -1.975507, 1, 0.05882353, 0, 1,
-2.249143, 0.9880226, -1.22395, 1, 0.06666667, 0, 1,
-2.236685, -0.009627764, -2.204538, 1, 0.07058824, 0, 1,
-2.231477, -0.5983855, -0.3096519, 1, 0.07843138, 0, 1,
-2.23074, 1.500137, -1.01862, 1, 0.08235294, 0, 1,
-2.230366, -0.3917245, -1.531567, 1, 0.09019608, 0, 1,
-2.207183, 0.7793928, -1.391694, 1, 0.09411765, 0, 1,
-2.18844, -0.1334494, -2.904131, 1, 0.1019608, 0, 1,
-2.18141, -0.02146573, -2.929568, 1, 0.1098039, 0, 1,
-2.173712, 0.4405847, -0.7485793, 1, 0.1137255, 0, 1,
-2.165551, -1.113683, -2.070737, 1, 0.1215686, 0, 1,
-2.156838, -0.431635, -1.002603, 1, 0.1254902, 0, 1,
-2.142015, 1.166836, -0.2210661, 1, 0.1333333, 0, 1,
-2.037753, -0.1054327, -2.05673, 1, 0.1372549, 0, 1,
-2.012147, 1.539122, -0.7829171, 1, 0.145098, 0, 1,
-2.007663, -1.000294, -2.135046, 1, 0.1490196, 0, 1,
-1.999998, -0.9868793, -2.110957, 1, 0.1568628, 0, 1,
-1.985942, 1.141618, -1.29531, 1, 0.1607843, 0, 1,
-1.985597, 0.4387336, 0.2625628, 1, 0.1686275, 0, 1,
-1.972713, 1.435809, -0.4014605, 1, 0.172549, 0, 1,
-1.914955, -0.5932154, -3.01701, 1, 0.1803922, 0, 1,
-1.882335, 0.3560922, -1.297904, 1, 0.1843137, 0, 1,
-1.872357, 1.243894, -2.714624, 1, 0.1921569, 0, 1,
-1.87014, -0.8287393, -1.299238, 1, 0.1960784, 0, 1,
-1.855209, -0.4708928, -1.072936, 1, 0.2039216, 0, 1,
-1.843543, 0.3565587, -0.9724054, 1, 0.2117647, 0, 1,
-1.792889, 1.666611, 0.01762062, 1, 0.2156863, 0, 1,
-1.748689, 0.552032, -0.1912463, 1, 0.2235294, 0, 1,
-1.733505, 2.215789, 0.08444472, 1, 0.227451, 0, 1,
-1.725747, -1.988624, -3.354597, 1, 0.2352941, 0, 1,
-1.723615, 0.6228428, -1.988965, 1, 0.2392157, 0, 1,
-1.719697, 1.239252, -1.501004, 1, 0.2470588, 0, 1,
-1.713458, -1.533494, -2.657002, 1, 0.2509804, 0, 1,
-1.698169, -1.643222, -3.109808, 1, 0.2588235, 0, 1,
-1.696359, -1.133007, -2.09234, 1, 0.2627451, 0, 1,
-1.688644, -1.182254, -1.465059, 1, 0.2705882, 0, 1,
-1.684684, -0.7984918, -2.506462, 1, 0.2745098, 0, 1,
-1.684305, 1.310492, -2.927573, 1, 0.282353, 0, 1,
-1.678411, 2.254452, -0.4833587, 1, 0.2862745, 0, 1,
-1.662734, 0.8906696, -1.822547, 1, 0.2941177, 0, 1,
-1.66175, -6.634425e-05, -3.42986, 1, 0.3019608, 0, 1,
-1.632376, -0.3245673, -1.370327, 1, 0.3058824, 0, 1,
-1.613551, -0.0004422643, -0.6967925, 1, 0.3137255, 0, 1,
-1.584155, 0.8799813, -1.179146, 1, 0.3176471, 0, 1,
-1.56179, -0.6230277, -2.118215, 1, 0.3254902, 0, 1,
-1.560503, -0.6715685, -0.9988936, 1, 0.3294118, 0, 1,
-1.558836, -0.04933641, -1.167675, 1, 0.3372549, 0, 1,
-1.55603, -0.6135224, -1.807028, 1, 0.3411765, 0, 1,
-1.552984, 2.178628, -2.125925, 1, 0.3490196, 0, 1,
-1.552592, -1.032735, -2.696076, 1, 0.3529412, 0, 1,
-1.539709, -0.02576731, -1.64495, 1, 0.3607843, 0, 1,
-1.536745, -0.9049632, -1.9142, 1, 0.3647059, 0, 1,
-1.536355, 1.548996, 0.05923909, 1, 0.372549, 0, 1,
-1.530746, 0.515058, -2.552371, 1, 0.3764706, 0, 1,
-1.521493, -0.2315316, -4.182785, 1, 0.3843137, 0, 1,
-1.513627, 0.4404349, -1.488132, 1, 0.3882353, 0, 1,
-1.482138, -1.144517, -1.271043, 1, 0.3960784, 0, 1,
-1.467846, 0.1790602, -1.701347, 1, 0.4039216, 0, 1,
-1.466172, 0.2654797, -1.433613, 1, 0.4078431, 0, 1,
-1.464281, -0.191137, -2.439545, 1, 0.4156863, 0, 1,
-1.440828, -0.8339248, -1.685262, 1, 0.4196078, 0, 1,
-1.437892, 0.3611814, -0.7347718, 1, 0.427451, 0, 1,
-1.429659, 0.4973901, -0.3068153, 1, 0.4313726, 0, 1,
-1.427456, -0.01177789, -1.220807, 1, 0.4392157, 0, 1,
-1.421723, 0.5900975, -0.2745194, 1, 0.4431373, 0, 1,
-1.406934, 1.749747, -1.446927, 1, 0.4509804, 0, 1,
-1.400683, 0.653508, -0.1522227, 1, 0.454902, 0, 1,
-1.389915, -1.816631, -1.864696, 1, 0.4627451, 0, 1,
-1.387686, 0.8963241, -1.645283, 1, 0.4666667, 0, 1,
-1.375551, 1.445354, -1.199856, 1, 0.4745098, 0, 1,
-1.369941, -0.9716409, -0.584838, 1, 0.4784314, 0, 1,
-1.369206, 2.128635, 0.7295664, 1, 0.4862745, 0, 1,
-1.357924, 0.144774, -2.669909, 1, 0.4901961, 0, 1,
-1.350379, 1.778736, -0.876963, 1, 0.4980392, 0, 1,
-1.342191, 0.6241862, -1.314909, 1, 0.5058824, 0, 1,
-1.341969, -0.2024574, -2.067366, 1, 0.509804, 0, 1,
-1.339273, -1.596192, -4.182181, 1, 0.5176471, 0, 1,
-1.335647, -1.364321, -3.567244, 1, 0.5215687, 0, 1,
-1.329782, 1.366662, -1.006747, 1, 0.5294118, 0, 1,
-1.326755, -0.5902693, -2.445452, 1, 0.5333334, 0, 1,
-1.321203, -0.5902183, -2.706292, 1, 0.5411765, 0, 1,
-1.297815, -0.8365131, -1.384805, 1, 0.5450981, 0, 1,
-1.284136, 0.9109943, -2.231297, 1, 0.5529412, 0, 1,
-1.283045, 0.7370783, -0.2393164, 1, 0.5568628, 0, 1,
-1.276003, -0.4227588, -0.9091686, 1, 0.5647059, 0, 1,
-1.257622, 0.2968247, -1.03677, 1, 0.5686275, 0, 1,
-1.255126, 1.832445, -1.231417, 1, 0.5764706, 0, 1,
-1.250407, 1.343958, -1.343084, 1, 0.5803922, 0, 1,
-1.248838, 0.5003844, 0.5789921, 1, 0.5882353, 0, 1,
-1.246944, 1.798076, -0.6320106, 1, 0.5921569, 0, 1,
-1.246305, -0.6137295, -3.202979, 1, 0.6, 0, 1,
-1.245629, -0.9408147, -2.967201, 1, 0.6078432, 0, 1,
-1.242649, 1.050688, -1.846724, 1, 0.6117647, 0, 1,
-1.232567, -0.8422217, -0.3758824, 1, 0.6196079, 0, 1,
-1.231416, -1.025323, -3.598329, 1, 0.6235294, 0, 1,
-1.230192, -1.801884, -2.114434, 1, 0.6313726, 0, 1,
-1.229953, -2.214306, -1.698522, 1, 0.6352941, 0, 1,
-1.228953, 1.320234, -1.936445, 1, 0.6431373, 0, 1,
-1.225538, 0.132352, -2.137793, 1, 0.6470588, 0, 1,
-1.222482, -3.3941, -2.272025, 1, 0.654902, 0, 1,
-1.206206, 0.4547713, -1.028665, 1, 0.6588235, 0, 1,
-1.204495, 0.2501015, -2.072416, 1, 0.6666667, 0, 1,
-1.203469, 0.04139127, -2.628195, 1, 0.6705883, 0, 1,
-1.196607, 0.5595275, -0.3900112, 1, 0.6784314, 0, 1,
-1.196236, -0.4408915, -1.833225, 1, 0.682353, 0, 1,
-1.186367, -1.896929, -2.548038, 1, 0.6901961, 0, 1,
-1.182279, 0.6749907, 0.06429645, 1, 0.6941177, 0, 1,
-1.180285, 0.5260045, -0.03960008, 1, 0.7019608, 0, 1,
-1.179121, 0.5430096, -0.1170601, 1, 0.7098039, 0, 1,
-1.178317, 0.9803939, -2.031126, 1, 0.7137255, 0, 1,
-1.177253, -0.5500935, -1.754639, 1, 0.7215686, 0, 1,
-1.175063, -1.51161, -0.5135064, 1, 0.7254902, 0, 1,
-1.169666, 1.132531, -0.3216591, 1, 0.7333333, 0, 1,
-1.165773, 1.157714, -2.176614, 1, 0.7372549, 0, 1,
-1.165249, -0.1795404, -1.538566, 1, 0.7450981, 0, 1,
-1.147846, 0.005036675, -2.202963, 1, 0.7490196, 0, 1,
-1.138412, 0.6587407, -0.7733489, 1, 0.7568628, 0, 1,
-1.121658, 0.2761637, -1.3604, 1, 0.7607843, 0, 1,
-1.115889, -1.387039, -1.894559, 1, 0.7686275, 0, 1,
-1.10753, -1.022366, -3.276651, 1, 0.772549, 0, 1,
-1.105518, 2.325052, -0.5355265, 1, 0.7803922, 0, 1,
-1.089984, -0.77385, -2.444723, 1, 0.7843137, 0, 1,
-1.089366, -0.9921063, -2.243049, 1, 0.7921569, 0, 1,
-1.08499, -0.02446581, -1.996357, 1, 0.7960784, 0, 1,
-1.071696, -0.8133279, -3.547885, 1, 0.8039216, 0, 1,
-1.062391, 2.070372, -1.811254, 1, 0.8117647, 0, 1,
-1.058855, 0.6220297, 0.3797159, 1, 0.8156863, 0, 1,
-1.055169, -0.6595397, -2.905776, 1, 0.8235294, 0, 1,
-1.048465, -0.2207758, -1.099785, 1, 0.827451, 0, 1,
-1.043173, 1.412795, -0.2392333, 1, 0.8352941, 0, 1,
-1.036044, 1.255239, -0.1138261, 1, 0.8392157, 0, 1,
-1.031901, -1.117356, -1.573145, 1, 0.8470588, 0, 1,
-1.025962, 0.02842096, -2.573178, 1, 0.8509804, 0, 1,
-1.025762, 0.2099254, -2.702736, 1, 0.8588235, 0, 1,
-1.022678, -1.120603, -2.27098, 1, 0.8627451, 0, 1,
-1.022034, -0.829173, -2.148168, 1, 0.8705882, 0, 1,
-1.018546, -1.640806, -1.809976, 1, 0.8745098, 0, 1,
-0.9874269, 0.3071851, 0.05342123, 1, 0.8823529, 0, 1,
-0.9821051, 1.220457, -0.2820362, 1, 0.8862745, 0, 1,
-0.9784245, -0.9291729, -2.299503, 1, 0.8941177, 0, 1,
-0.9740057, 0.2695179, -1.629292, 1, 0.8980392, 0, 1,
-0.9725878, -0.7607427, -1.437605, 1, 0.9058824, 0, 1,
-0.9684351, -0.9200782, -3.616114, 1, 0.9137255, 0, 1,
-0.9652649, -2.267841, -1.808556, 1, 0.9176471, 0, 1,
-0.9612893, -0.8859636, -2.8004, 1, 0.9254902, 0, 1,
-0.9556903, 0.6328629, -1.869027, 1, 0.9294118, 0, 1,
-0.9529066, -1.709023, -3.159716, 1, 0.9372549, 0, 1,
-0.9375883, 0.8736002, -0.1599473, 1, 0.9411765, 0, 1,
-0.9333394, -0.1762304, -2.026115, 1, 0.9490196, 0, 1,
-0.9328866, -1.307857, -2.305599, 1, 0.9529412, 0, 1,
-0.9292042, 1.828933, -1.341624, 1, 0.9607843, 0, 1,
-0.927192, 0.2622424, -2.831158, 1, 0.9647059, 0, 1,
-0.923974, -0.08046839, -3.066014, 1, 0.972549, 0, 1,
-0.9183893, -1.263082, -1.115835, 1, 0.9764706, 0, 1,
-0.9182825, 1.936427, -0.9374069, 1, 0.9843137, 0, 1,
-0.9147449, -0.3615651, -0.7234452, 1, 0.9882353, 0, 1,
-0.9135648, 0.127294, -1.784878, 1, 0.9960784, 0, 1,
-0.9063385, -0.2161247, -1.777897, 0.9960784, 1, 0, 1,
-0.8984973, 0.8859076, -1.169998, 0.9921569, 1, 0, 1,
-0.8774315, -1.012147, -3.030123, 0.9843137, 1, 0, 1,
-0.8752361, -1.745231, -2.254189, 0.9803922, 1, 0, 1,
-0.8666287, -0.5384066, -1.180565, 0.972549, 1, 0, 1,
-0.8665646, 2.372524, -0.7695634, 0.9686275, 1, 0, 1,
-0.8628042, -1.659174, -2.595545, 0.9607843, 1, 0, 1,
-0.8585487, 0.563251, -0.5801901, 0.9568627, 1, 0, 1,
-0.8563411, 1.493339, 1.142432, 0.9490196, 1, 0, 1,
-0.8553059, -0.2260665, -2.027559, 0.945098, 1, 0, 1,
-0.8531759, 1.406281, -0.3019658, 0.9372549, 1, 0, 1,
-0.8499606, 0.06151212, -2.281719, 0.9333333, 1, 0, 1,
-0.849271, 0.6514477, 0.05119599, 0.9254902, 1, 0, 1,
-0.8468522, 0.9056855, -0.2846367, 0.9215686, 1, 0, 1,
-0.8408597, -0.3220546, -1.770991, 0.9137255, 1, 0, 1,
-0.8343859, 0.3833663, 0.0804384, 0.9098039, 1, 0, 1,
-0.826175, 0.5650664, -1.637567, 0.9019608, 1, 0, 1,
-0.8232359, -0.5067849, -2.578567, 0.8941177, 1, 0, 1,
-0.8178594, 0.450798, 0.2145778, 0.8901961, 1, 0, 1,
-0.8065045, -0.7003797, -2.501423, 0.8823529, 1, 0, 1,
-0.8045343, 1.5693, -0.2422622, 0.8784314, 1, 0, 1,
-0.8021432, 0.6774107, -2.394042, 0.8705882, 1, 0, 1,
-0.7969511, -0.3974888, -2.376119, 0.8666667, 1, 0, 1,
-0.7941644, 0.1013331, -1.755423, 0.8588235, 1, 0, 1,
-0.7884745, -0.679455, -3.076438, 0.854902, 1, 0, 1,
-0.7852274, 0.8396379, -0.8360466, 0.8470588, 1, 0, 1,
-0.7808702, 0.6322063, -1.741566, 0.8431373, 1, 0, 1,
-0.7781692, 0.4585485, -1.166056, 0.8352941, 1, 0, 1,
-0.7781503, -0.2746507, -2.17706, 0.8313726, 1, 0, 1,
-0.7756419, 0.2680829, 0.9464023, 0.8235294, 1, 0, 1,
-0.768739, 0.2871335, -1.664796, 0.8196079, 1, 0, 1,
-0.7650782, 0.8729494, 0.4538385, 0.8117647, 1, 0, 1,
-0.7605937, 0.714016, -1.011761, 0.8078431, 1, 0, 1,
-0.7585811, -0.8237341, -1.265913, 0.8, 1, 0, 1,
-0.7576074, 0.9671088, -1.009956, 0.7921569, 1, 0, 1,
-0.7549447, -0.8658251, -4.080048, 0.7882353, 1, 0, 1,
-0.7516336, 0.09935316, -2.291917, 0.7803922, 1, 0, 1,
-0.7392281, 1.412694, 0.5493754, 0.7764706, 1, 0, 1,
-0.7368096, -0.09053663, -1.47348, 0.7686275, 1, 0, 1,
-0.7223517, -0.0009813164, -1.354289, 0.7647059, 1, 0, 1,
-0.7199895, -0.4994642, -3.059328, 0.7568628, 1, 0, 1,
-0.7160406, 0.6986482, -1.40545, 0.7529412, 1, 0, 1,
-0.7134814, 0.2139411, -0.1887697, 0.7450981, 1, 0, 1,
-0.7130505, 1.520935, 0.746296, 0.7411765, 1, 0, 1,
-0.7114069, -2.203898, -2.216252, 0.7333333, 1, 0, 1,
-0.7052524, 1.177608, -1.865315, 0.7294118, 1, 0, 1,
-0.7043124, 1.276448, -1.148052, 0.7215686, 1, 0, 1,
-0.7027735, 0.2763071, -1.401655, 0.7176471, 1, 0, 1,
-0.7010314, -0.4594684, -2.587821, 0.7098039, 1, 0, 1,
-0.6983413, -0.9013696, -2.160044, 0.7058824, 1, 0, 1,
-0.6873519, -1.561062, -3.858258, 0.6980392, 1, 0, 1,
-0.6869572, 0.4585022, -0.03751495, 0.6901961, 1, 0, 1,
-0.6794924, -0.4149196, -1.807644, 0.6862745, 1, 0, 1,
-0.6766745, -0.8406316, -2.528724, 0.6784314, 1, 0, 1,
-0.6759251, -0.2899287, -3.112517, 0.6745098, 1, 0, 1,
-0.6753536, 1.072795, -1.176635, 0.6666667, 1, 0, 1,
-0.669161, -0.08137254, -2.473207, 0.6627451, 1, 0, 1,
-0.6676401, -0.2287402, -2.297658, 0.654902, 1, 0, 1,
-0.662966, 0.176176, -0.3548957, 0.6509804, 1, 0, 1,
-0.6616728, -1.563917, -2.198343, 0.6431373, 1, 0, 1,
-0.6568376, -0.06754435, -1.059383, 0.6392157, 1, 0, 1,
-0.6463807, 0.6754688, -1.278291, 0.6313726, 1, 0, 1,
-0.6454864, 0.2731094, -2.469743, 0.627451, 1, 0, 1,
-0.6446576, -0.2643312, 0.15348, 0.6196079, 1, 0, 1,
-0.6353458, 0.8555362, 0.3972479, 0.6156863, 1, 0, 1,
-0.6351712, -0.3278855, -1.951524, 0.6078432, 1, 0, 1,
-0.6296737, -1.930166, -2.488867, 0.6039216, 1, 0, 1,
-0.6268747, 0.2970174, -0.4280726, 0.5960785, 1, 0, 1,
-0.6260302, -0.54961, -2.284508, 0.5882353, 1, 0, 1,
-0.6245944, -0.9933836, -3.349602, 0.5843138, 1, 0, 1,
-0.6245888, -2.082661, -2.66794, 0.5764706, 1, 0, 1,
-0.6198766, 1.383263, 1.312928, 0.572549, 1, 0, 1,
-0.6186252, -1.805267, -4.079663, 0.5647059, 1, 0, 1,
-0.6145457, -0.7433796, -3.156597, 0.5607843, 1, 0, 1,
-0.6142688, -0.1893299, -3.393257, 0.5529412, 1, 0, 1,
-0.6116624, 2.243147, 0.1443445, 0.5490196, 1, 0, 1,
-0.6076084, 1.16227, 1.307702, 0.5411765, 1, 0, 1,
-0.5994164, 0.1060974, -1.516148, 0.5372549, 1, 0, 1,
-0.5962801, -1.512663, -3.099773, 0.5294118, 1, 0, 1,
-0.5941945, 0.5986441, -2.694469, 0.5254902, 1, 0, 1,
-0.5902399, 0.9875459, -0.8815501, 0.5176471, 1, 0, 1,
-0.5897925, 0.8356439, -0.07974321, 0.5137255, 1, 0, 1,
-0.5894294, 0.01545959, -1.394862, 0.5058824, 1, 0, 1,
-0.5789307, 0.3191146, -0.1010017, 0.5019608, 1, 0, 1,
-0.5761378, -0.004005169, -0.8727139, 0.4941176, 1, 0, 1,
-0.5757022, 0.4292694, -1.622683, 0.4862745, 1, 0, 1,
-0.5745139, -0.3095027, -2.510537, 0.4823529, 1, 0, 1,
-0.5729651, -0.04067342, -1.684992, 0.4745098, 1, 0, 1,
-0.5669314, -0.4516427, -3.480595, 0.4705882, 1, 0, 1,
-0.5660645, -0.6741857, -3.67683, 0.4627451, 1, 0, 1,
-0.5660058, -2.376842, -3.764184, 0.4588235, 1, 0, 1,
-0.5632716, -0.1456221, -2.954525, 0.4509804, 1, 0, 1,
-0.5560697, -0.5532741, -2.608215, 0.4470588, 1, 0, 1,
-0.5558592, 0.5898617, -2.549671, 0.4392157, 1, 0, 1,
-0.5513419, -0.7879946, -1.914079, 0.4352941, 1, 0, 1,
-0.5511053, 1.872499, 0.9939428, 0.427451, 1, 0, 1,
-0.5509208, -0.9393692, -3.102045, 0.4235294, 1, 0, 1,
-0.5435157, 0.2971483, -1.850629, 0.4156863, 1, 0, 1,
-0.5390445, 0.3017188, -2.216718, 0.4117647, 1, 0, 1,
-0.539018, 0.2897142, -1.016668, 0.4039216, 1, 0, 1,
-0.5345349, -1.48164, -1.381201, 0.3960784, 1, 0, 1,
-0.5295376, -0.5869607, -2.336773, 0.3921569, 1, 0, 1,
-0.5284187, -0.2456893, -0.4442176, 0.3843137, 1, 0, 1,
-0.5238844, -1.605579, -1.864607, 0.3803922, 1, 0, 1,
-0.5208766, -0.04375818, -2.003953, 0.372549, 1, 0, 1,
-0.5208057, 1.060744, -0.009979947, 0.3686275, 1, 0, 1,
-0.5163831, 0.008525014, -1.041512, 0.3607843, 1, 0, 1,
-0.5104602, 0.9748513, -0.7966694, 0.3568628, 1, 0, 1,
-0.508417, 1.589902, 0.105863, 0.3490196, 1, 0, 1,
-0.5053161, -0.06740149, -1.802798, 0.345098, 1, 0, 1,
-0.5038989, -0.3134305, -2.689581, 0.3372549, 1, 0, 1,
-0.4969305, 0.05935353, -1.484969, 0.3333333, 1, 0, 1,
-0.4958611, -0.2430675, -1.676679, 0.3254902, 1, 0, 1,
-0.4948862, -0.4930418, -1.938557, 0.3215686, 1, 0, 1,
-0.4920787, 0.6713672, -0.3509704, 0.3137255, 1, 0, 1,
-0.4886098, 0.2658938, -0.7131168, 0.3098039, 1, 0, 1,
-0.4822509, -0.5574178, -1.743333, 0.3019608, 1, 0, 1,
-0.4809822, 1.294913, 0.263044, 0.2941177, 1, 0, 1,
-0.4808957, -0.2909734, -1.413087, 0.2901961, 1, 0, 1,
-0.4772357, 0.7357993, -0.6166425, 0.282353, 1, 0, 1,
-0.4725383, 1.236427, -0.5320488, 0.2784314, 1, 0, 1,
-0.4664481, 0.1871203, -1.084661, 0.2705882, 1, 0, 1,
-0.4660254, -1.052552, -2.37516, 0.2666667, 1, 0, 1,
-0.4569093, 0.1706053, -1.986399, 0.2588235, 1, 0, 1,
-0.455664, 1.133027, -0.6460245, 0.254902, 1, 0, 1,
-0.4532493, -1.58841, -2.452705, 0.2470588, 1, 0, 1,
-0.4454311, -0.9117295, -2.575424, 0.2431373, 1, 0, 1,
-0.4450988, -0.5268896, -1.746443, 0.2352941, 1, 0, 1,
-0.4421243, -2.483541, -2.892616, 0.2313726, 1, 0, 1,
-0.4338842, 0.5046402, 0.1891735, 0.2235294, 1, 0, 1,
-0.4305621, -0.1067366, -1.340121, 0.2196078, 1, 0, 1,
-0.4303975, 0.5106649, 0.643952, 0.2117647, 1, 0, 1,
-0.4260925, -2.10647, -4.565686, 0.2078431, 1, 0, 1,
-0.4219553, -0.3886384, -3.80848, 0.2, 1, 0, 1,
-0.4140408, 0.7180477, -0.6347261, 0.1921569, 1, 0, 1,
-0.4070213, 0.1218767, -0.6051076, 0.1882353, 1, 0, 1,
-0.4060172, -0.8457861, -2.515021, 0.1803922, 1, 0, 1,
-0.405393, -0.9703605, -1.309342, 0.1764706, 1, 0, 1,
-0.4031933, 0.7290108, -0.7983239, 0.1686275, 1, 0, 1,
-0.4027593, -0.758129, -3.202084, 0.1647059, 1, 0, 1,
-0.4009006, -0.2503932, -3.628185, 0.1568628, 1, 0, 1,
-0.3998474, 1.86148, -0.4442634, 0.1529412, 1, 0, 1,
-0.3993983, -0.8364069, -2.936265, 0.145098, 1, 0, 1,
-0.3970716, -0.2512769, -1.209905, 0.1411765, 1, 0, 1,
-0.3967757, -0.2643733, -0.6138057, 0.1333333, 1, 0, 1,
-0.3934045, -0.4232662, -4.258695, 0.1294118, 1, 0, 1,
-0.3912644, -1.832933, -2.640768, 0.1215686, 1, 0, 1,
-0.3850188, -1.052163, -5.205853, 0.1176471, 1, 0, 1,
-0.3836353, -1.053731, -3.546514, 0.1098039, 1, 0, 1,
-0.3808462, 0.07653583, -2.369058, 0.1058824, 1, 0, 1,
-0.380265, -0.3856088, -2.050407, 0.09803922, 1, 0, 1,
-0.3735862, -0.4958968, -1.904663, 0.09019608, 1, 0, 1,
-0.3734035, 0.2177254, -2.394942, 0.08627451, 1, 0, 1,
-0.3731172, -0.9548842, -2.89946, 0.07843138, 1, 0, 1,
-0.3715502, -0.1692154, -2.739668, 0.07450981, 1, 0, 1,
-0.3686859, -0.1002955, -2.857628, 0.06666667, 1, 0, 1,
-0.3669135, -0.3536993, -3.694608, 0.0627451, 1, 0, 1,
-0.3628758, -0.5555252, -3.064527, 0.05490196, 1, 0, 1,
-0.3627068, -0.8073848, -3.190631, 0.05098039, 1, 0, 1,
-0.3573081, 1.614838, -2.665788, 0.04313726, 1, 0, 1,
-0.3469961, 0.1903592, -2.010719, 0.03921569, 1, 0, 1,
-0.346763, 0.01964874, -2.884352, 0.03137255, 1, 0, 1,
-0.3453119, -0.03523782, -1.252137, 0.02745098, 1, 0, 1,
-0.3446682, -0.8772855, -2.200325, 0.01960784, 1, 0, 1,
-0.3401063, -0.7621822, -1.976935, 0.01568628, 1, 0, 1,
-0.338899, 1.509269, -1.456225, 0.007843138, 1, 0, 1,
-0.3356929, -2.210257, -3.766565, 0.003921569, 1, 0, 1,
-0.3345546, -0.3511906, -1.512552, 0, 1, 0.003921569, 1,
-0.3308833, -0.55623, -2.91737, 0, 1, 0.01176471, 1,
-0.329398, -0.6625597, -3.116927, 0, 1, 0.01568628, 1,
-0.3289137, 1.260024, 0.6152797, 0, 1, 0.02352941, 1,
-0.3278801, -0.6460154, -3.107182, 0, 1, 0.02745098, 1,
-0.3229355, 0.2537987, -1.396691, 0, 1, 0.03529412, 1,
-0.3204968, 1.72181, 0.06974139, 0, 1, 0.03921569, 1,
-0.3192552, -0.1715944, -3.421008, 0, 1, 0.04705882, 1,
-0.3180504, -0.5950021, -3.391638, 0, 1, 0.05098039, 1,
-0.3141647, -0.8206661, -1.967064, 0, 1, 0.05882353, 1,
-0.3120175, 2.078764, -1.441305, 0, 1, 0.0627451, 1,
-0.310201, -1.052069, -2.531813, 0, 1, 0.07058824, 1,
-0.3074405, 0.3928292, 1.487586, 0, 1, 0.07450981, 1,
-0.3042856, 0.2801071, -2.691777, 0, 1, 0.08235294, 1,
-0.3025084, -1.271369, -4.409412, 0, 1, 0.08627451, 1,
-0.3007177, -2.287357, -3.225187, 0, 1, 0.09411765, 1,
-0.2999498, 1.331084, -0.3584695, 0, 1, 0.1019608, 1,
-0.2989106, -1.698054, -3.030709, 0, 1, 0.1058824, 1,
-0.2953737, 3.256675, 0.3934419, 0, 1, 0.1137255, 1,
-0.2939317, -0.26559, -1.782992, 0, 1, 0.1176471, 1,
-0.2918938, 1.478515, -0.01222112, 0, 1, 0.1254902, 1,
-0.2916142, 1.571067, -1.794272, 0, 1, 0.1294118, 1,
-0.291067, -0.1432467, -1.276191, 0, 1, 0.1372549, 1,
-0.2910561, 0.3210748, -1.026381, 0, 1, 0.1411765, 1,
-0.2884212, -2.291291, -3.236714, 0, 1, 0.1490196, 1,
-0.2790896, -0.2864261, -2.450678, 0, 1, 0.1529412, 1,
-0.2758046, -1.067369, -3.293462, 0, 1, 0.1607843, 1,
-0.2737792, 1.12193, 0.3530267, 0, 1, 0.1647059, 1,
-0.2718232, 0.9019457, -2.371763, 0, 1, 0.172549, 1,
-0.2707013, 0.5086187, 0.01894619, 0, 1, 0.1764706, 1,
-0.2659746, -1.000425, -2.932031, 0, 1, 0.1843137, 1,
-0.2636017, 0.06830016, -1.542215, 0, 1, 0.1882353, 1,
-0.2624435, -0.2115096, -2.227977, 0, 1, 0.1960784, 1,
-0.2588101, 1.101714, 1.021761, 0, 1, 0.2039216, 1,
-0.2580881, 0.7904093, -0.9045662, 0, 1, 0.2078431, 1,
-0.2569947, 0.5245081, -0.3501756, 0, 1, 0.2156863, 1,
-0.2538322, 1.16706, -0.4089556, 0, 1, 0.2196078, 1,
-0.2516997, -0.06910913, -2.076831, 0, 1, 0.227451, 1,
-0.2500959, 0.6385208, -0.7212094, 0, 1, 0.2313726, 1,
-0.2467252, 0.9682179, -0.5720407, 0, 1, 0.2392157, 1,
-0.2444806, -0.07073773, -0.07133969, 0, 1, 0.2431373, 1,
-0.2441115, 0.06174409, -0.8120468, 0, 1, 0.2509804, 1,
-0.2420918, -1.361099, -4.87785, 0, 1, 0.254902, 1,
-0.2403668, -1.045367, -3.933621, 0, 1, 0.2627451, 1,
-0.2399298, 1.496692, 0.1365196, 0, 1, 0.2666667, 1,
-0.2353137, 1.592566, 1.03574, 0, 1, 0.2745098, 1,
-0.2345087, -2.070354, -4.53795, 0, 1, 0.2784314, 1,
-0.2333515, -0.6980036, -4.415489, 0, 1, 0.2862745, 1,
-0.2324244, 0.0676268, -1.114592, 0, 1, 0.2901961, 1,
-0.2323794, 0.6726893, 0.5415173, 0, 1, 0.2980392, 1,
-0.2312363, 1.45609, -0.08963772, 0, 1, 0.3058824, 1,
-0.2304719, -0.2249317, -2.936337, 0, 1, 0.3098039, 1,
-0.2297621, -0.8773465, -1.875198, 0, 1, 0.3176471, 1,
-0.2285769, 0.5278201, -0.5759994, 0, 1, 0.3215686, 1,
-0.227584, 0.1493062, -1.289778, 0, 1, 0.3294118, 1,
-0.2270758, -1.565603, -2.964767, 0, 1, 0.3333333, 1,
-0.2220235, -2.071713, -1.070355, 0, 1, 0.3411765, 1,
-0.221732, 0.5998659, -0.08422805, 0, 1, 0.345098, 1,
-0.2202161, 0.5937389, -1.730417, 0, 1, 0.3529412, 1,
-0.2184861, 0.3904448, -0.6240483, 0, 1, 0.3568628, 1,
-0.2183387, 1.503392, -1.122109, 0, 1, 0.3647059, 1,
-0.2141903, -1.571622, -4.985365, 0, 1, 0.3686275, 1,
-0.2140352, 1.426491, 2.445523, 0, 1, 0.3764706, 1,
-0.2110991, -0.405105, -4.334713, 0, 1, 0.3803922, 1,
-0.2108853, -0.1145224, -1.503907, 0, 1, 0.3882353, 1,
-0.20884, -0.5328976, -1.369435, 0, 1, 0.3921569, 1,
-0.2051266, -0.559779, -2.510491, 0, 1, 0.4, 1,
-0.2015775, -0.03576198, -2.423164, 0, 1, 0.4078431, 1,
-0.201468, 0.320992, -1.593656, 0, 1, 0.4117647, 1,
-0.1978133, 1.027443, -1.19605, 0, 1, 0.4196078, 1,
-0.1978015, 0.6973713, 0.8234337, 0, 1, 0.4235294, 1,
-0.1974235, -0.623779, -2.533239, 0, 1, 0.4313726, 1,
-0.1965031, 0.2346334, -0.1332761, 0, 1, 0.4352941, 1,
-0.1963165, 1.393084, 0.3929094, 0, 1, 0.4431373, 1,
-0.1944554, -0.5919924, -2.454706, 0, 1, 0.4470588, 1,
-0.1905394, 1.289995, -0.7376637, 0, 1, 0.454902, 1,
-0.188502, -0.9287642, -3.071935, 0, 1, 0.4588235, 1,
-0.1857548, 0.4759097, -0.6067456, 0, 1, 0.4666667, 1,
-0.1855548, 0.7101161, -1.085877, 0, 1, 0.4705882, 1,
-0.1827272, 2.219709, -0.3851773, 0, 1, 0.4784314, 1,
-0.182672, -0.2725528, -1.556659, 0, 1, 0.4823529, 1,
-0.1795609, -0.8011185, -4.456587, 0, 1, 0.4901961, 1,
-0.1764719, -0.001947541, -1.432531, 0, 1, 0.4941176, 1,
-0.1649809, -0.956032, -3.491107, 0, 1, 0.5019608, 1,
-0.1563898, 0.7481439, 0.9617536, 0, 1, 0.509804, 1,
-0.1543898, -0.004987197, 0.2375777, 0, 1, 0.5137255, 1,
-0.15302, 0.529384, -0.2068284, 0, 1, 0.5215687, 1,
-0.1487506, -1.26475, -2.074484, 0, 1, 0.5254902, 1,
-0.1479052, 0.1439386, -0.2571257, 0, 1, 0.5333334, 1,
-0.1471295, -0.6964327, -2.377468, 0, 1, 0.5372549, 1,
-0.1420041, 0.4808455, 0.2149167, 0, 1, 0.5450981, 1,
-0.1416266, 1.47833, -0.2200291, 0, 1, 0.5490196, 1,
-0.1381977, -1.232077, -2.422414, 0, 1, 0.5568628, 1,
-0.1311589, -0.8638252, -4.107871, 0, 1, 0.5607843, 1,
-0.1307086, 0.6457104, -0.6962704, 0, 1, 0.5686275, 1,
-0.125685, -1.341752, -3.440004, 0, 1, 0.572549, 1,
-0.1251264, 2.169134, -0.5508165, 0, 1, 0.5803922, 1,
-0.118646, 0.9546637, 0.1729638, 0, 1, 0.5843138, 1,
-0.1157802, 1.643674, -1.989369, 0, 1, 0.5921569, 1,
-0.1156927, -1.073516, -2.881823, 0, 1, 0.5960785, 1,
-0.1133746, 0.668676, -1.170603, 0, 1, 0.6039216, 1,
-0.1063771, 1.49703, 1.04922, 0, 1, 0.6117647, 1,
-0.1055182, 0.5722306, -2.1245, 0, 1, 0.6156863, 1,
-0.1029151, 1.006378, 1.017709, 0, 1, 0.6235294, 1,
-0.09819116, 0.2400346, 0.04533969, 0, 1, 0.627451, 1,
-0.09609394, 0.6835767, 0.4411121, 0, 1, 0.6352941, 1,
-0.09511467, 0.2784682, -0.01992291, 0, 1, 0.6392157, 1,
-0.09369642, 0.4147031, 0.3112468, 0, 1, 0.6470588, 1,
-0.09135915, -0.2006509, -1.031567, 0, 1, 0.6509804, 1,
-0.0875384, -1.191886, -3.850034, 0, 1, 0.6588235, 1,
-0.08738318, -0.4404168, -2.449679, 0, 1, 0.6627451, 1,
-0.08079055, -0.4094504, -1.716721, 0, 1, 0.6705883, 1,
-0.07891974, 0.9774351, 0.6410194, 0, 1, 0.6745098, 1,
-0.07658777, -0.6351491, -2.147031, 0, 1, 0.682353, 1,
-0.07495127, -0.3211497, -3.64728, 0, 1, 0.6862745, 1,
-0.06904967, -0.04422034, -3.2086, 0, 1, 0.6941177, 1,
-0.06841992, 0.5282918, -0.8142527, 0, 1, 0.7019608, 1,
-0.06807975, 0.5447009, 0.5157918, 0, 1, 0.7058824, 1,
-0.0673326, -0.5732352, -2.970909, 0, 1, 0.7137255, 1,
-0.06694891, 1.200896, 1.592132, 0, 1, 0.7176471, 1,
-0.06661681, -1.454417, -4.570635, 0, 1, 0.7254902, 1,
-0.06561828, -0.5478913, -4.250105, 0, 1, 0.7294118, 1,
-0.06440344, 3.110821, -0.6933023, 0, 1, 0.7372549, 1,
-0.06267543, -1.090983, -3.301904, 0, 1, 0.7411765, 1,
-0.06146871, 0.9891813, 0.7479304, 0, 1, 0.7490196, 1,
-0.05996248, 0.8411278, -0.3771352, 0, 1, 0.7529412, 1,
-0.0596335, -0.1994549, -2.866009, 0, 1, 0.7607843, 1,
-0.05288434, -1.206221, -3.752482, 0, 1, 0.7647059, 1,
-0.05262022, -0.568688, -4.732357, 0, 1, 0.772549, 1,
-0.05149706, -1.611425, -1.688129, 0, 1, 0.7764706, 1,
-0.05071951, 1.05864, -0.6432589, 0, 1, 0.7843137, 1,
-0.04957841, -0.462613, -2.794384, 0, 1, 0.7882353, 1,
-0.04809189, 0.9070879, 1.282975, 0, 1, 0.7960784, 1,
-0.04407731, -0.3131424, -2.999879, 0, 1, 0.8039216, 1,
-0.04131445, 0.3766524, 0.2534474, 0, 1, 0.8078431, 1,
-0.04010889, 0.03373677, 0.05483683, 0, 1, 0.8156863, 1,
-0.03911688, 0.3582494, -0.8531975, 0, 1, 0.8196079, 1,
-0.03811594, -0.5320221, -3.430434, 0, 1, 0.827451, 1,
-0.0377802, 0.2310116, -0.6102697, 0, 1, 0.8313726, 1,
-0.03319499, 1.758245, 0.8683485, 0, 1, 0.8392157, 1,
-0.03289313, -0.0603397, -2.751443, 0, 1, 0.8431373, 1,
-0.03270783, -0.1231275, -3.861671, 0, 1, 0.8509804, 1,
-0.0326041, -0.987809, -4.868897, 0, 1, 0.854902, 1,
-0.03010233, -1.31082, -2.750876, 0, 1, 0.8627451, 1,
-0.02922855, 0.3899762, -0.09986732, 0, 1, 0.8666667, 1,
-0.0283671, -0.3078049, -2.463343, 0, 1, 0.8745098, 1,
-0.02644465, 1.856873, 0.9351954, 0, 1, 0.8784314, 1,
-0.02066077, -2.130272, -1.643132, 0, 1, 0.8862745, 1,
-0.01899096, -0.2787738, -3.098593, 0, 1, 0.8901961, 1,
-0.01306531, -0.3738189, -3.901088, 0, 1, 0.8980392, 1,
-0.01180139, -0.007544368, -2.519062, 0, 1, 0.9058824, 1,
-0.00867944, 0.5544239, 0.8746108, 0, 1, 0.9098039, 1,
-0.006845085, 1.014568, -0.5247428, 0, 1, 0.9176471, 1,
-0.005420103, 0.1171903, 0.995629, 0, 1, 0.9215686, 1,
0.0005829476, -0.216575, 2.175795, 0, 1, 0.9294118, 1,
0.001240644, -0.168588, 2.249701, 0, 1, 0.9333333, 1,
0.003618816, -0.8945823, 2.357097, 0, 1, 0.9411765, 1,
0.01292427, 0.003530975, -0.0235569, 0, 1, 0.945098, 1,
0.01380544, 0.01448321, 1.682429, 0, 1, 0.9529412, 1,
0.0163621, 0.2940609, -0.7535576, 0, 1, 0.9568627, 1,
0.01676857, 0.6947817, 1.044864, 0, 1, 0.9647059, 1,
0.01876944, -0.114259, 3.577729, 0, 1, 0.9686275, 1,
0.02232592, 2.186103, 0.4325602, 0, 1, 0.9764706, 1,
0.02325467, -0.8931847, 3.066352, 0, 1, 0.9803922, 1,
0.0239329, 0.8042381, 0.8018985, 0, 1, 0.9882353, 1,
0.02554406, -0.1732315, 3.937975, 0, 1, 0.9921569, 1,
0.02903471, 0.02907486, 3.241785, 0, 1, 1, 1,
0.03022621, 1.369071, 0.8086857, 0, 0.9921569, 1, 1,
0.03448487, 0.02938351, 1.879707, 0, 0.9882353, 1, 1,
0.03604719, -0.1027447, 3.686769, 0, 0.9803922, 1, 1,
0.03631338, -0.1701273, 3.08514, 0, 0.9764706, 1, 1,
0.03698399, -0.252937, 3.175828, 0, 0.9686275, 1, 1,
0.03821531, -0.01682829, 3.450289, 0, 0.9647059, 1, 1,
0.04330615, -0.4895404, -0.3504041, 0, 0.9568627, 1, 1,
0.04651659, -1.259326, 3.020331, 0, 0.9529412, 1, 1,
0.05205056, 3.421346, 0.4610255, 0, 0.945098, 1, 1,
0.05295775, -0.5342934, 3.174022, 0, 0.9411765, 1, 1,
0.05411665, 1.411661, -0.5203523, 0, 0.9333333, 1, 1,
0.06743935, -0.1303221, 3.229315, 0, 0.9294118, 1, 1,
0.07248406, -0.6700859, 1.937787, 0, 0.9215686, 1, 1,
0.07462656, 0.2368314, 0.3571572, 0, 0.9176471, 1, 1,
0.07547101, -0.005803995, 0.004167548, 0, 0.9098039, 1, 1,
0.07634243, 1.093655, -0.3139719, 0, 0.9058824, 1, 1,
0.07807854, -0.02293147, -1.555228, 0, 0.8980392, 1, 1,
0.07894208, -0.4656611, 2.044605, 0, 0.8901961, 1, 1,
0.07967491, 0.07329702, 0.9671289, 0, 0.8862745, 1, 1,
0.07973231, -1.940126, 3.450739, 0, 0.8784314, 1, 1,
0.08184456, 0.1232666, 0.7456478, 0, 0.8745098, 1, 1,
0.09149475, -0.06914675, 3.882145, 0, 0.8666667, 1, 1,
0.09326603, -0.07391394, 1.65282, 0, 0.8627451, 1, 1,
0.09407546, 0.6266471, -0.4657055, 0, 0.854902, 1, 1,
0.09541711, 2.045123, 0.4932741, 0, 0.8509804, 1, 1,
0.0968025, 0.6798325, 1.163966, 0, 0.8431373, 1, 1,
0.09934098, -0.9646504, 1.443236, 0, 0.8392157, 1, 1,
0.1000452, 1.609827, -0.9911917, 0, 0.8313726, 1, 1,
0.1053043, -1.730541, 2.513138, 0, 0.827451, 1, 1,
0.1117338, -0.8851898, 4.871625, 0, 0.8196079, 1, 1,
0.1138119, -0.6242734, 2.931624, 0, 0.8156863, 1, 1,
0.1160542, -1.529637, 2.527616, 0, 0.8078431, 1, 1,
0.1178262, 0.5250235, 0.1913697, 0, 0.8039216, 1, 1,
0.1187689, -0.467, 3.390614, 0, 0.7960784, 1, 1,
0.1220638, 1.537351, 0.8338561, 0, 0.7882353, 1, 1,
0.1288984, -0.5597699, 4.071652, 0, 0.7843137, 1, 1,
0.1296303, 0.3702742, 2.306935, 0, 0.7764706, 1, 1,
0.1374209, 0.6960207, 1.041556, 0, 0.772549, 1, 1,
0.1376794, 1.173521, -0.05651063, 0, 0.7647059, 1, 1,
0.1382781, 0.9340186, 1.691586, 0, 0.7607843, 1, 1,
0.1422268, 0.5941964, 0.7349805, 0, 0.7529412, 1, 1,
0.1448151, 1.3256, 0.4632919, 0, 0.7490196, 1, 1,
0.1466483, -0.03530766, 1.010588, 0, 0.7411765, 1, 1,
0.1480871, -0.2542561, 4.98791, 0, 0.7372549, 1, 1,
0.1515304, -0.2730988, 1.028715, 0, 0.7294118, 1, 1,
0.1527288, 0.7087405, -0.6082057, 0, 0.7254902, 1, 1,
0.156126, 0.9086314, -1.557842, 0, 0.7176471, 1, 1,
0.1596517, -0.4522559, 3.441794, 0, 0.7137255, 1, 1,
0.1597269, 0.1873754, 1.636523, 0, 0.7058824, 1, 1,
0.1668683, -1.620377, 1.67237, 0, 0.6980392, 1, 1,
0.1669065, 1.916256, -1.034436, 0, 0.6941177, 1, 1,
0.1690565, -0.5987892, 4.031608, 0, 0.6862745, 1, 1,
0.17112, 1.828305, 0.8628519, 0, 0.682353, 1, 1,
0.1724148, -1.316112, 1.312946, 0, 0.6745098, 1, 1,
0.174571, -2.01827, 3.550478, 0, 0.6705883, 1, 1,
0.1755798, 0.6800449, -0.9066563, 0, 0.6627451, 1, 1,
0.1765807, -1.342747, 3.440374, 0, 0.6588235, 1, 1,
0.1788795, -0.3788103, 2.030582, 0, 0.6509804, 1, 1,
0.1801664, 0.3223813, 0.4919302, 0, 0.6470588, 1, 1,
0.1854811, -0.3727899, 1.701235, 0, 0.6392157, 1, 1,
0.1866997, -2.114923, 2.96724, 0, 0.6352941, 1, 1,
0.1893739, -1.223481, 2.915269, 0, 0.627451, 1, 1,
0.1914697, 0.05606088, -0.3296691, 0, 0.6235294, 1, 1,
0.1918148, 0.5304957, 0.6861175, 0, 0.6156863, 1, 1,
0.1930232, 1.335985, 2.61562, 0, 0.6117647, 1, 1,
0.1950116, -0.7103726, 2.235573, 0, 0.6039216, 1, 1,
0.2023313, 0.8014899, 0.4276975, 0, 0.5960785, 1, 1,
0.203175, -1.272672, 2.761766, 0, 0.5921569, 1, 1,
0.2048015, 0.5695976, 1.063814, 0, 0.5843138, 1, 1,
0.2075821, 0.1347276, 1.775932, 0, 0.5803922, 1, 1,
0.2097896, -1.283692, 1.996148, 0, 0.572549, 1, 1,
0.2131801, 1.257936, -0.4709021, 0, 0.5686275, 1, 1,
0.2150234, 0.5567644, 0.7677414, 0, 0.5607843, 1, 1,
0.216285, 1.712688, -1.251972, 0, 0.5568628, 1, 1,
0.2173807, 0.7316033, -0.2017754, 0, 0.5490196, 1, 1,
0.2188627, 0.5194647, 0.25005, 0, 0.5450981, 1, 1,
0.2205774, 1.173726, 0.7990785, 0, 0.5372549, 1, 1,
0.2212797, 0.4488041, -0.411337, 0, 0.5333334, 1, 1,
0.2272854, -1.068437, 1.96948, 0, 0.5254902, 1, 1,
0.234217, -1.207283, 4.199239, 0, 0.5215687, 1, 1,
0.2406525, 0.1413099, 0.4077255, 0, 0.5137255, 1, 1,
0.2413083, 0.6643192, 0.1171952, 0, 0.509804, 1, 1,
0.2431656, -0.3545717, 3.533317, 0, 0.5019608, 1, 1,
0.2488718, -0.1235928, 1.467422, 0, 0.4941176, 1, 1,
0.2503248, -0.2949679, 2.915633, 0, 0.4901961, 1, 1,
0.2508831, 0.3211285, 1.192259, 0, 0.4823529, 1, 1,
0.2612304, 0.9688438, 1.304386, 0, 0.4784314, 1, 1,
0.2614454, -1.284404, 2.069747, 0, 0.4705882, 1, 1,
0.2634158, 0.3908276, 0.8311124, 0, 0.4666667, 1, 1,
0.2640702, -1.200369, 1.890126, 0, 0.4588235, 1, 1,
0.2668768, 0.1652234, 1.035632, 0, 0.454902, 1, 1,
0.2682588, 0.7592071, 0.2052629, 0, 0.4470588, 1, 1,
0.271586, -2.022878, 2.866554, 0, 0.4431373, 1, 1,
0.2752578, -0.4800166, 2.686496, 0, 0.4352941, 1, 1,
0.2753284, 2.157163, 0.3019132, 0, 0.4313726, 1, 1,
0.2775537, -0.707408, 1.471551, 0, 0.4235294, 1, 1,
0.2776287, -0.1702673, 1.263815, 0, 0.4196078, 1, 1,
0.2803126, 0.6644477, 0.3888996, 0, 0.4117647, 1, 1,
0.2822935, 0.2561018, 0.4885885, 0, 0.4078431, 1, 1,
0.2825036, 0.3323378, 0.5451627, 0, 0.4, 1, 1,
0.2860901, -0.2523311, 2.561253, 0, 0.3921569, 1, 1,
0.2875639, 0.04506458, 0.06903628, 0, 0.3882353, 1, 1,
0.2902016, -1.017509, 3.514682, 0, 0.3803922, 1, 1,
0.2937401, -1.034821, 4.778795, 0, 0.3764706, 1, 1,
0.2963473, 0.2105632, 0.4916298, 0, 0.3686275, 1, 1,
0.3017652, 1.424425, -0.1879332, 0, 0.3647059, 1, 1,
0.3018915, 0.2722778, 0.2915649, 0, 0.3568628, 1, 1,
0.3093252, -0.396334, 3.917023, 0, 0.3529412, 1, 1,
0.3157451, -0.8932343, 3.945779, 0, 0.345098, 1, 1,
0.3193624, 0.8555995, 0.0320766, 0, 0.3411765, 1, 1,
0.3236101, -0.1163649, 2.016336, 0, 0.3333333, 1, 1,
0.3250651, -1.079935, 2.199656, 0, 0.3294118, 1, 1,
0.3271497, 1.444231, 0.3790452, 0, 0.3215686, 1, 1,
0.3284551, 0.5943272, 0.02630459, 0, 0.3176471, 1, 1,
0.3292846, -0.1876383, 2.219019, 0, 0.3098039, 1, 1,
0.3317059, 0.6683856, 1.415287, 0, 0.3058824, 1, 1,
0.3343057, 1.440409, 0.004570479, 0, 0.2980392, 1, 1,
0.3374888, -0.5946417, 3.046286, 0, 0.2901961, 1, 1,
0.3399271, 1.073843, 1.688847, 0, 0.2862745, 1, 1,
0.3443433, -0.8083801, 2.117842, 0, 0.2784314, 1, 1,
0.3445369, -0.3444557, 2.405249, 0, 0.2745098, 1, 1,
0.3445906, -0.6623344, 2.190566, 0, 0.2666667, 1, 1,
0.3449078, 0.3278309, 0.4495547, 0, 0.2627451, 1, 1,
0.3449971, 0.3931074, 0.179247, 0, 0.254902, 1, 1,
0.3540969, -0.3574228, 0.622412, 0, 0.2509804, 1, 1,
0.3557157, -2.012875, 1.480446, 0, 0.2431373, 1, 1,
0.3575208, -0.7078899, 3.670938, 0, 0.2392157, 1, 1,
0.3583626, 0.6711367, 0.7434877, 0, 0.2313726, 1, 1,
0.3593995, 1.125358, -1.652994, 0, 0.227451, 1, 1,
0.3602196, 0.5447034, 0.2668492, 0, 0.2196078, 1, 1,
0.3625617, 2.100198, 0.8127752, 0, 0.2156863, 1, 1,
0.3670217, 0.3227225, 2.265741, 0, 0.2078431, 1, 1,
0.370479, 2.39621, 0.18783, 0, 0.2039216, 1, 1,
0.3798608, -0.09339663, 1.613224, 0, 0.1960784, 1, 1,
0.384156, -0.9632625, 1.653968, 0, 0.1882353, 1, 1,
0.3890981, 0.9055374, 2.03883, 0, 0.1843137, 1, 1,
0.3917964, 1.008187, 0.2446364, 0, 0.1764706, 1, 1,
0.3925101, -0.7704297, 2.899936, 0, 0.172549, 1, 1,
0.39259, 1.475188, 0.4567147, 0, 0.1647059, 1, 1,
0.3928215, 0.9830767, 1.327853, 0, 0.1607843, 1, 1,
0.3962095, 0.312543, 1.065638, 0, 0.1529412, 1, 1,
0.3975236, 0.5839479, 0.5987586, 0, 0.1490196, 1, 1,
0.3979783, 0.1114244, 0.6609609, 0, 0.1411765, 1, 1,
0.4012828, 0.9815854, 0.9936298, 0, 0.1372549, 1, 1,
0.4017658, 0.7389628, -0.5215791, 0, 0.1294118, 1, 1,
0.4021321, -0.6674846, 2.312356, 0, 0.1254902, 1, 1,
0.4032296, 0.6070542, 0.7768504, 0, 0.1176471, 1, 1,
0.4151316, 0.2918499, 0.07465992, 0, 0.1137255, 1, 1,
0.4169185, 1.197631, 3.030977, 0, 0.1058824, 1, 1,
0.4171181, -0.5307286, 1.648879, 0, 0.09803922, 1, 1,
0.4220932, -0.7122827, 2.861294, 0, 0.09411765, 1, 1,
0.422485, 1.254059, -0.3460926, 0, 0.08627451, 1, 1,
0.4250364, 0.9950075, -0.09917346, 0, 0.08235294, 1, 1,
0.4269029, 0.1962406, 1.339664, 0, 0.07450981, 1, 1,
0.4283105, 0.9548125, 0.06610831, 0, 0.07058824, 1, 1,
0.4332797, 0.7779582, 0.6147789, 0, 0.0627451, 1, 1,
0.435975, 0.1343564, 0.1481423, 0, 0.05882353, 1, 1,
0.4406371, 1.269558, 0.4718076, 0, 0.05098039, 1, 1,
0.4431628, -0.5302414, 2.288632, 0, 0.04705882, 1, 1,
0.4474041, -1.505984, 1.861907, 0, 0.03921569, 1, 1,
0.4478921, 0.1320272, 1.122947, 0, 0.03529412, 1, 1,
0.4503226, 0.4792669, 1.788642, 0, 0.02745098, 1, 1,
0.4568574, -0.0961758, 1.85141, 0, 0.02352941, 1, 1,
0.459042, -0.5937961, 3.363045, 0, 0.01568628, 1, 1,
0.4631919, 0.3913415, -0.6936278, 0, 0.01176471, 1, 1,
0.4668316, 1.664715, -1.26155, 0, 0.003921569, 1, 1,
0.4711909, -1.747949, 4.366068, 0.003921569, 0, 1, 1,
0.4777888, -0.479177, 3.458451, 0.007843138, 0, 1, 1,
0.4790114, -0.3103897, 2.190339, 0.01568628, 0, 1, 1,
0.4841682, -0.9404991, 3.916092, 0.01960784, 0, 1, 1,
0.4846566, -0.6217564, 2.551958, 0.02745098, 0, 1, 1,
0.4857605, 0.8344482, -0.3837007, 0.03137255, 0, 1, 1,
0.4864354, 1.486571, 1.089568, 0.03921569, 0, 1, 1,
0.4876655, 2.774106, -0.4951658, 0.04313726, 0, 1, 1,
0.4887369, 0.3359636, 1.055745, 0.05098039, 0, 1, 1,
0.4892583, -0.9803114, 2.999633, 0.05490196, 0, 1, 1,
0.4898531, -0.6529554, 3.742931, 0.0627451, 0, 1, 1,
0.4913145, -1.700265, 3.729621, 0.06666667, 0, 1, 1,
0.4945114, -0.1751829, 2.035968, 0.07450981, 0, 1, 1,
0.4989482, -2.027043, 2.727612, 0.07843138, 0, 1, 1,
0.5019931, 1.20408, 0.1793944, 0.08627451, 0, 1, 1,
0.5056607, -0.8540236, 1.186122, 0.09019608, 0, 1, 1,
0.5086571, 0.5777, 1.389164, 0.09803922, 0, 1, 1,
0.5095342, -1.944722, 1.535915, 0.1058824, 0, 1, 1,
0.5123304, 0.2100254, 0.6216128, 0.1098039, 0, 1, 1,
0.5136939, -0.7310454, 0.706554, 0.1176471, 0, 1, 1,
0.5145535, 0.5561325, -0.5882354, 0.1215686, 0, 1, 1,
0.5162702, 0.1759795, 1.402084, 0.1294118, 0, 1, 1,
0.5166474, 0.8041649, 1.538121, 0.1333333, 0, 1, 1,
0.5169603, -0.5833698, 1.463281, 0.1411765, 0, 1, 1,
0.527217, 1.41454, 1.298501, 0.145098, 0, 1, 1,
0.5285008, -2.356831, 3.197813, 0.1529412, 0, 1, 1,
0.5309463, -0.2508293, 1.667559, 0.1568628, 0, 1, 1,
0.532733, -0.2463187, 2.199883, 0.1647059, 0, 1, 1,
0.5351908, 2.093341, 2.038714, 0.1686275, 0, 1, 1,
0.5360889, 0.809109, 1.508752, 0.1764706, 0, 1, 1,
0.5376394, 0.6968492, -0.145579, 0.1803922, 0, 1, 1,
0.540101, -2.426984, 3.516402, 0.1882353, 0, 1, 1,
0.5406842, -0.4715175, 3.372094, 0.1921569, 0, 1, 1,
0.5451708, 2.702988, 0.3428277, 0.2, 0, 1, 1,
0.5457119, -0.1134951, 2.116599, 0.2078431, 0, 1, 1,
0.5459902, -0.1349825, 1.315318, 0.2117647, 0, 1, 1,
0.5462519, -1.823579, 3.872101, 0.2196078, 0, 1, 1,
0.5466339, -1.344045, 3.222051, 0.2235294, 0, 1, 1,
0.5495177, -3.305995, 2.870533, 0.2313726, 0, 1, 1,
0.5522988, -0.9289996, 3.112844, 0.2352941, 0, 1, 1,
0.5571029, -0.2942924, 2.344913, 0.2431373, 0, 1, 1,
0.5674223, -0.6165714, 3.363765, 0.2470588, 0, 1, 1,
0.5756168, 2.1368, -0.8558469, 0.254902, 0, 1, 1,
0.575695, 0.5213709, 0.276892, 0.2588235, 0, 1, 1,
0.5778232, -0.2942794, 2.636376, 0.2666667, 0, 1, 1,
0.5808055, 1.776601, 1.226035, 0.2705882, 0, 1, 1,
0.5810624, -1.832861, 2.605192, 0.2784314, 0, 1, 1,
0.583274, -1.141186, 2.328527, 0.282353, 0, 1, 1,
0.5978889, 1.317165, -0.09245505, 0.2901961, 0, 1, 1,
0.5995137, 0.5605408, 2.472432, 0.2941177, 0, 1, 1,
0.6078995, 0.9985615, 1.559266, 0.3019608, 0, 1, 1,
0.6084673, -0.166713, 2.484257, 0.3098039, 0, 1, 1,
0.614687, 0.679781, 1.56722, 0.3137255, 0, 1, 1,
0.6156662, 0.229417, 1.282073, 0.3215686, 0, 1, 1,
0.6179332, -1.060383, 1.914643, 0.3254902, 0, 1, 1,
0.6181778, -0.3358009, 2.42302, 0.3333333, 0, 1, 1,
0.6189314, -0.06500687, -0.0396455, 0.3372549, 0, 1, 1,
0.6257857, -0.8174477, 2.382357, 0.345098, 0, 1, 1,
0.6301947, 0.2723224, 1.482441, 0.3490196, 0, 1, 1,
0.6321256, -1.00815, 1.47169, 0.3568628, 0, 1, 1,
0.6322798, -1.078869, 3.579648, 0.3607843, 0, 1, 1,
0.6347524, -0.0940518, 2.251327, 0.3686275, 0, 1, 1,
0.6364588, -1.044809, 3.1947, 0.372549, 0, 1, 1,
0.6373632, -1.113859, 3.573959, 0.3803922, 0, 1, 1,
0.6402004, -1.304339, 3.088612, 0.3843137, 0, 1, 1,
0.6430609, -0.4198887, 2.26891, 0.3921569, 0, 1, 1,
0.6462837, 0.0113124, 3.15176, 0.3960784, 0, 1, 1,
0.6492927, 0.7080843, -0.8349407, 0.4039216, 0, 1, 1,
0.6509692, -1.559121, 2.215489, 0.4117647, 0, 1, 1,
0.6541128, -0.5392447, 2.277503, 0.4156863, 0, 1, 1,
0.6572334, -1.665284, 3.004948, 0.4235294, 0, 1, 1,
0.6609409, 0.9383649, 1.149616, 0.427451, 0, 1, 1,
0.6641626, 0.05487208, 1.838362, 0.4352941, 0, 1, 1,
0.6659697, 0.7638478, -0.1405031, 0.4392157, 0, 1, 1,
0.6679911, 0.5563303, -0.9985207, 0.4470588, 0, 1, 1,
0.6695104, -0.9598862, 2.362565, 0.4509804, 0, 1, 1,
0.6706327, 2.476575, -0.7916679, 0.4588235, 0, 1, 1,
0.675164, -0.3404979, 1.422199, 0.4627451, 0, 1, 1,
0.675656, 0.977678, -0.7613029, 0.4705882, 0, 1, 1,
0.6763495, -1.517463, 3.691824, 0.4745098, 0, 1, 1,
0.6793117, 0.6408798, 1.201288, 0.4823529, 0, 1, 1,
0.6794813, -0.5927697, 1.282567, 0.4862745, 0, 1, 1,
0.6804586, -0.08221673, 1.671592, 0.4941176, 0, 1, 1,
0.6808192, -0.6796036, 2.535392, 0.5019608, 0, 1, 1,
0.6840691, -2.358607, 1.988502, 0.5058824, 0, 1, 1,
0.6938345, -0.7486854, 3.686783, 0.5137255, 0, 1, 1,
0.6959034, -1.839723, 3.506086, 0.5176471, 0, 1, 1,
0.7004744, 1.327511, 2.397173, 0.5254902, 0, 1, 1,
0.7006903, -0.8851078, 2.806632, 0.5294118, 0, 1, 1,
0.7037656, 0.3324748, -0.3115094, 0.5372549, 0, 1, 1,
0.7052341, -0.8750907, 2.031428, 0.5411765, 0, 1, 1,
0.7077107, 0.8279185, 1.052287, 0.5490196, 0, 1, 1,
0.7165756, 0.4825427, 1.035201, 0.5529412, 0, 1, 1,
0.718651, -2.544386, 3.007833, 0.5607843, 0, 1, 1,
0.7229304, 1.712202, -0.5975189, 0.5647059, 0, 1, 1,
0.7277579, 0.565066, 1.485797, 0.572549, 0, 1, 1,
0.7370342, 0.6314464, -1.429599, 0.5764706, 0, 1, 1,
0.7505796, -0.2631885, 2.177319, 0.5843138, 0, 1, 1,
0.7514929, 0.6327814, 1.254698, 0.5882353, 0, 1, 1,
0.7519823, 1.082409, 0.192607, 0.5960785, 0, 1, 1,
0.7553527, 0.5895487, -0.2059797, 0.6039216, 0, 1, 1,
0.761207, 0.8471456, -1.67473, 0.6078432, 0, 1, 1,
0.7642117, 0.4234129, 0.617726, 0.6156863, 0, 1, 1,
0.7650758, 0.9033658, 1.996225, 0.6196079, 0, 1, 1,
0.7705094, 1.630489, 0.953603, 0.627451, 0, 1, 1,
0.7732653, 1.287851, 0.606235, 0.6313726, 0, 1, 1,
0.7736897, 0.6859102, -0.2872011, 0.6392157, 0, 1, 1,
0.7812982, 0.7170292, -0.4013452, 0.6431373, 0, 1, 1,
0.7835058, -1.521822, 4.20262, 0.6509804, 0, 1, 1,
0.7859449, -0.760162, 2.897518, 0.654902, 0, 1, 1,
0.7926965, -2.317831, 2.215086, 0.6627451, 0, 1, 1,
0.7932879, 0.2822185, 0.4156118, 0.6666667, 0, 1, 1,
0.7966439, -0.0939151, -0.5720878, 0.6745098, 0, 1, 1,
0.8010996, -0.3008181, 1.70886, 0.6784314, 0, 1, 1,
0.8016437, -0.03659878, 2.046708, 0.6862745, 0, 1, 1,
0.8065608, 1.684296, -1.415369, 0.6901961, 0, 1, 1,
0.8099998, -0.6794891, 0.8454486, 0.6980392, 0, 1, 1,
0.8136367, -0.4565088, 2.131065, 0.7058824, 0, 1, 1,
0.8151808, -0.07419018, 1.641802, 0.7098039, 0, 1, 1,
0.8177883, -0.01415349, 0.8763134, 0.7176471, 0, 1, 1,
0.8260797, -1.025906, 1.971913, 0.7215686, 0, 1, 1,
0.8277522, -1.66288, 3.750168, 0.7294118, 0, 1, 1,
0.8361208, -0.3611785, 2.565721, 0.7333333, 0, 1, 1,
0.8410798, -0.2160356, 0.1881476, 0.7411765, 0, 1, 1,
0.8469035, 1.020515, -0.3026171, 0.7450981, 0, 1, 1,
0.8493316, -1.199158, 2.861565, 0.7529412, 0, 1, 1,
0.8493804, -0.166173, 1.161957, 0.7568628, 0, 1, 1,
0.8519067, 1.01899, 2.186241, 0.7647059, 0, 1, 1,
0.8597509, 0.8947387, 2.016345, 0.7686275, 0, 1, 1,
0.8614654, 0.5482445, 0.6632053, 0.7764706, 0, 1, 1,
0.8653277, -0.7583142, 1.98922, 0.7803922, 0, 1, 1,
0.8739721, -0.4791354, 2.389299, 0.7882353, 0, 1, 1,
0.8803476, -0.155817, 2.834319, 0.7921569, 0, 1, 1,
0.8813964, -1.183438, 3.278254, 0.8, 0, 1, 1,
0.8820512, -0.06621694, 1.998798, 0.8078431, 0, 1, 1,
0.8851753, 0.07469101, 1.673106, 0.8117647, 0, 1, 1,
0.8895119, -0.008772391, 1.363113, 0.8196079, 0, 1, 1,
0.891203, 0.1268248, 1.633704, 0.8235294, 0, 1, 1,
0.9005393, 0.9556733, 0.8124599, 0.8313726, 0, 1, 1,
0.9028668, 1.865598, 0.3099492, 0.8352941, 0, 1, 1,
0.9029175, 0.911276, 1.387334, 0.8431373, 0, 1, 1,
0.9201084, 1.48708, 1.214458, 0.8470588, 0, 1, 1,
0.9259751, -0.2047797, 1.30042, 0.854902, 0, 1, 1,
0.930499, -1.316064, 2.637047, 0.8588235, 0, 1, 1,
0.9328903, 0.3371585, -0.4546692, 0.8666667, 0, 1, 1,
0.9389823, 0.3732891, 1.087039, 0.8705882, 0, 1, 1,
0.9439201, -1.445639, 3.922522, 0.8784314, 0, 1, 1,
0.9454675, -1.460366, 1.395509, 0.8823529, 0, 1, 1,
0.9581402, -0.04212136, 1.214592, 0.8901961, 0, 1, 1,
0.9595319, 0.379491, 1.09804, 0.8941177, 0, 1, 1,
0.9645692, 0.2426179, 1.6335, 0.9019608, 0, 1, 1,
0.9685095, -0.05363402, 2.035894, 0.9098039, 0, 1, 1,
0.9705957, -1.26903, 1.959021, 0.9137255, 0, 1, 1,
0.9797959, 0.06148127, 1.606384, 0.9215686, 0, 1, 1,
0.9936789, 0.1698987, 1.562935, 0.9254902, 0, 1, 1,
0.9946154, 0.3692641, 0.8978154, 0.9333333, 0, 1, 1,
1.00271, 1.193023, 0.2674035, 0.9372549, 0, 1, 1,
1.006285, 0.7505526, 0.7860468, 0.945098, 0, 1, 1,
1.012766, 1.026067, 1.722778, 0.9490196, 0, 1, 1,
1.027918, 0.5184118, 1.411679, 0.9568627, 0, 1, 1,
1.036939, 1.353249, 1.500665, 0.9607843, 0, 1, 1,
1.038144, 1.115497, 1.652627, 0.9686275, 0, 1, 1,
1.040257, -1.298554, 1.214073, 0.972549, 0, 1, 1,
1.046413, 1.238002, 2.616069, 0.9803922, 0, 1, 1,
1.0474, 1.315018, 0.8130392, 0.9843137, 0, 1, 1,
1.048477, -0.313998, 2.832856, 0.9921569, 0, 1, 1,
1.048909, -0.4549004, 1.675712, 0.9960784, 0, 1, 1,
1.053009, 0.1349807, 1.829655, 1, 0, 0.9960784, 1,
1.053161, -0.8176747, 1.509057, 1, 0, 0.9882353, 1,
1.057379, -0.3222303, 1.963738, 1, 0, 0.9843137, 1,
1.060209, -0.7468387, 2.991148, 1, 0, 0.9764706, 1,
1.060303, 0.9761651, 0.7555572, 1, 0, 0.972549, 1,
1.073179, 1.315641, -0.3209109, 1, 0, 0.9647059, 1,
1.074738, -0.5334589, 0.4763117, 1, 0, 0.9607843, 1,
1.076745, -0.7604355, 2.796329, 1, 0, 0.9529412, 1,
1.083481, -0.6389344, 2.511528, 1, 0, 0.9490196, 1,
1.08656, 0.6343341, 1.489079, 1, 0, 0.9411765, 1,
1.091084, 1.26398, -0.331584, 1, 0, 0.9372549, 1,
1.094633, -0.6742588, 2.614382, 1, 0, 0.9294118, 1,
1.094695, 0.4906891, 2.312587, 1, 0, 0.9254902, 1,
1.097136, 0.539766, -0.2120712, 1, 0, 0.9176471, 1,
1.098264, -0.9695877, 3.277922, 1, 0, 0.9137255, 1,
1.099216, -0.4077109, 1.513303, 1, 0, 0.9058824, 1,
1.102761, -2.501297, 2.962512, 1, 0, 0.9019608, 1,
1.105743, -0.2000807, 2.310518, 1, 0, 0.8941177, 1,
1.106481, 1.317354, -1.210687, 1, 0, 0.8862745, 1,
1.109829, -0.2577492, 2.610438, 1, 0, 0.8823529, 1,
1.111893, 0.2096478, 1.740037, 1, 0, 0.8745098, 1,
1.122029, 0.4571434, 3.921621, 1, 0, 0.8705882, 1,
1.127484, -0.2693755, 2.716361, 1, 0, 0.8627451, 1,
1.131666, 2.404396, -1.056317, 1, 0, 0.8588235, 1,
1.131915, 0.6442379, 0.1380847, 1, 0, 0.8509804, 1,
1.136227, 0.3271141, -0.3658255, 1, 0, 0.8470588, 1,
1.149015, -1.515541, 2.441235, 1, 0, 0.8392157, 1,
1.1593, -0.7358015, 1.453148, 1, 0, 0.8352941, 1,
1.160299, 1.216557, -0.2427983, 1, 0, 0.827451, 1,
1.161293, -0.492381, 2.488275, 1, 0, 0.8235294, 1,
1.162707, -0.3073387, 0.9902913, 1, 0, 0.8156863, 1,
1.170351, 0.9714706, 1.81344, 1, 0, 0.8117647, 1,
1.174545, -0.6810622, 1.076824, 1, 0, 0.8039216, 1,
1.181272, -1.179277, 3.216309, 1, 0, 0.7960784, 1,
1.181767, -1.168888, 2.341542, 1, 0, 0.7921569, 1,
1.182514, -0.3551942, 2.780931, 1, 0, 0.7843137, 1,
1.182988, 1.400738, 2.529876, 1, 0, 0.7803922, 1,
1.187379, 0.3483221, 1.64066, 1, 0, 0.772549, 1,
1.189237, -0.7025995, 0.8086113, 1, 0, 0.7686275, 1,
1.191224, 0.1371626, 2.623023, 1, 0, 0.7607843, 1,
1.198903, 2.330757, 1.220083, 1, 0, 0.7568628, 1,
1.200024, 0.5662559, 0.1281503, 1, 0, 0.7490196, 1,
1.200106, 0.607308, -0.03089332, 1, 0, 0.7450981, 1,
1.204532, 0.8975891, 2.974109, 1, 0, 0.7372549, 1,
1.214643, -0.8092469, 1.362602, 1, 0, 0.7333333, 1,
1.21503, -0.2661929, 1.850246, 1, 0, 0.7254902, 1,
1.215655, -1.937105, 2.575537, 1, 0, 0.7215686, 1,
1.218606, -0.8925693, 1.567225, 1, 0, 0.7137255, 1,
1.21943, 1.036507, 0.7925609, 1, 0, 0.7098039, 1,
1.235763, -0.5095446, 1.778127, 1, 0, 0.7019608, 1,
1.24312, 1.017689, 0.9866129, 1, 0, 0.6941177, 1,
1.243208, -0.1382213, 1.028549, 1, 0, 0.6901961, 1,
1.24332, 0.9488199, 1.370451, 1, 0, 0.682353, 1,
1.255169, -0.9303702, 1.784059, 1, 0, 0.6784314, 1,
1.269064, -1.374472, 2.437883, 1, 0, 0.6705883, 1,
1.277886, -0.8014961, 1.351684, 1, 0, 0.6666667, 1,
1.285345, -1.467675, 2.409784, 1, 0, 0.6588235, 1,
1.286397, -0.9308704, 2.581425, 1, 0, 0.654902, 1,
1.288725, -0.2711923, 1.540384, 1, 0, 0.6470588, 1,
1.296578, 0.1807894, 2.214947, 1, 0, 0.6431373, 1,
1.307996, -0.4775282, 2.881548, 1, 0, 0.6352941, 1,
1.308429, -0.7212784, 3.295903, 1, 0, 0.6313726, 1,
1.311744, 1.575607, 1.371447, 1, 0, 0.6235294, 1,
1.318356, -0.8806005, 2.998141, 1, 0, 0.6196079, 1,
1.330203, -0.1307281, 2.33164, 1, 0, 0.6117647, 1,
1.330574, 0.5307885, 1.824212, 1, 0, 0.6078432, 1,
1.335705, 0.2563414, 3.028055, 1, 0, 0.6, 1,
1.357998, 1.009601, 1.037368, 1, 0, 0.5921569, 1,
1.359391, -0.9499217, 4.210688, 1, 0, 0.5882353, 1,
1.368316, -0.8915649, 2.222013, 1, 0, 0.5803922, 1,
1.387975, -0.5942933, 2.728459, 1, 0, 0.5764706, 1,
1.388764, 1.174351, 1.553139, 1, 0, 0.5686275, 1,
1.39391, -1.326775, 3.941911, 1, 0, 0.5647059, 1,
1.394904, 1.498332, 0.6044587, 1, 0, 0.5568628, 1,
1.399026, 0.02460865, 2.249236, 1, 0, 0.5529412, 1,
1.399568, 0.4587446, 0.1146071, 1, 0, 0.5450981, 1,
1.399568, -0.2576121, 1.015206, 1, 0, 0.5411765, 1,
1.403775, -0.7409599, 2.397719, 1, 0, 0.5333334, 1,
1.405802, 0.5731096, -0.2633702, 1, 0, 0.5294118, 1,
1.406642, -0.3628245, 1.485948, 1, 0, 0.5215687, 1,
1.410028, -1.985027, 1.078063, 1, 0, 0.5176471, 1,
1.414063, 0.30387, 0.7767786, 1, 0, 0.509804, 1,
1.414653, 0.04469004, 1.936797, 1, 0, 0.5058824, 1,
1.415729, -0.652841, 1.887601, 1, 0, 0.4980392, 1,
1.415933, -0.3966911, 1.761135, 1, 0, 0.4901961, 1,
1.41743, -0.9512327, 1.817864, 1, 0, 0.4862745, 1,
1.420099, -0.1794094, 2.797012, 1, 0, 0.4784314, 1,
1.431189, -1.040488, 2.447111, 1, 0, 0.4745098, 1,
1.43245, -0.8095466, 1.302014, 1, 0, 0.4666667, 1,
1.441084, -1.497764, 2.827485, 1, 0, 0.4627451, 1,
1.448313, -0.4503341, 1.674103, 1, 0, 0.454902, 1,
1.451687, 0.2440488, 1.301026, 1, 0, 0.4509804, 1,
1.453756, -0.1323033, 1.299, 1, 0, 0.4431373, 1,
1.468982, 1.477518, 1.592042, 1, 0, 0.4392157, 1,
1.474087, -1.170724, 2.093338, 1, 0, 0.4313726, 1,
1.476602, 0.561434, 0.5318716, 1, 0, 0.427451, 1,
1.489113, -0.3687417, 1.945649, 1, 0, 0.4196078, 1,
1.491001, 0.08989559, 1.3937, 1, 0, 0.4156863, 1,
1.500596, 0.9430876, 0.5549638, 1, 0, 0.4078431, 1,
1.504623, 1.219848, 0.894105, 1, 0, 0.4039216, 1,
1.506086, 0.9820301, 0.6836721, 1, 0, 0.3960784, 1,
1.545881, -0.2302518, 0.2184253, 1, 0, 0.3882353, 1,
1.556696, 0.883016, 0.6641018, 1, 0, 0.3843137, 1,
1.558119, -0.8645182, 2.259933, 1, 0, 0.3764706, 1,
1.575088, -2.656947, 3.13664, 1, 0, 0.372549, 1,
1.581475, -1.041341, 2.492723, 1, 0, 0.3647059, 1,
1.627651, -0.6175597, 1.802094, 1, 0, 0.3607843, 1,
1.644083, 0.3466401, 2.948473, 1, 0, 0.3529412, 1,
1.664108, -0.03009662, 2.631795, 1, 0, 0.3490196, 1,
1.668096, -0.8905981, 3.068846, 1, 0, 0.3411765, 1,
1.676695, 0.9850444, 1.396095, 1, 0, 0.3372549, 1,
1.686416, 1.028446, 2.336086, 1, 0, 0.3294118, 1,
1.69643, 0.784151, 1.058473, 1, 0, 0.3254902, 1,
1.709083, 1.972816, 1.493041, 1, 0, 0.3176471, 1,
1.711299, -0.1813613, 1.745566, 1, 0, 0.3137255, 1,
1.713559, 1.497167, 0.511244, 1, 0, 0.3058824, 1,
1.731684, -1.08969, 3.220939, 1, 0, 0.2980392, 1,
1.733685, -0.7756722, 0.8777008, 1, 0, 0.2941177, 1,
1.736675, -1.226442, 4.146229, 1, 0, 0.2862745, 1,
1.738021, 0.840039, 2.403679, 1, 0, 0.282353, 1,
1.751964, 1.067387, -1.512395, 1, 0, 0.2745098, 1,
1.752691, 0.05102243, 2.894312, 1, 0, 0.2705882, 1,
1.759365, -1.142633, 2.543959, 1, 0, 0.2627451, 1,
1.762253, 0.8621995, 1.665768, 1, 0, 0.2588235, 1,
1.800385, 1.559306, 0.8839394, 1, 0, 0.2509804, 1,
1.815299, 0.8728438, 1.61308, 1, 0, 0.2470588, 1,
1.842717, -0.0008702285, 1.430207, 1, 0, 0.2392157, 1,
1.857682, 0.560187, 1.517165, 1, 0, 0.2352941, 1,
1.859569, -1.094756, 0.6609287, 1, 0, 0.227451, 1,
1.895816, -0.2578206, 2.800408, 1, 0, 0.2235294, 1,
1.897944, -0.4269615, 1.49319, 1, 0, 0.2156863, 1,
1.936338, -0.5526555, 1.157207, 1, 0, 0.2117647, 1,
1.974449, 0.5919884, 1.554127, 1, 0, 0.2039216, 1,
1.976565, 0.1045978, 0.9850873, 1, 0, 0.1960784, 1,
1.986236, 0.5051584, 1.2818, 1, 0, 0.1921569, 1,
2.006989, -0.2581543, 1.308467, 1, 0, 0.1843137, 1,
2.019288, -0.3064151, 2.201023, 1, 0, 0.1803922, 1,
2.049301, -1.742031, 2.181032, 1, 0, 0.172549, 1,
2.051601, -0.3875321, 3.488936, 1, 0, 0.1686275, 1,
2.055626, 0.2689505, 1.816952, 1, 0, 0.1607843, 1,
2.066637, 1.86683, 0.0002045365, 1, 0, 0.1568628, 1,
2.081182, -1.875361, 2.297778, 1, 0, 0.1490196, 1,
2.091607, 0.1723297, 1.756917, 1, 0, 0.145098, 1,
2.11424, -1.106683, 4.796702, 1, 0, 0.1372549, 1,
2.131978, -0.9488926, 3.05826, 1, 0, 0.1333333, 1,
2.176086, 0.1219183, 1.489871, 1, 0, 0.1254902, 1,
2.181105, 0.8577399, 0.3544086, 1, 0, 0.1215686, 1,
2.181213, 1.330909, 1.653578, 1, 0, 0.1137255, 1,
2.210875, -0.1781089, 2.150481, 1, 0, 0.1098039, 1,
2.214085, 1.513732, 0.9119202, 1, 0, 0.1019608, 1,
2.24039, 0.01937882, 2.383293, 1, 0, 0.09411765, 1,
2.294575, 0.5822508, 1.06678, 1, 0, 0.09019608, 1,
2.295224, -1.648713, 2.573938, 1, 0, 0.08235294, 1,
2.362597, 0.7398359, 0.8439716, 1, 0, 0.07843138, 1,
2.397517, -1.313477, 0.7962131, 1, 0, 0.07058824, 1,
2.518954, -0.6957142, 3.083503, 1, 0, 0.06666667, 1,
2.523417, 1.051281, 3.09243, 1, 0, 0.05882353, 1,
2.529973, -0.354968, 1.163233, 1, 0, 0.05490196, 1,
2.609478, 0.02207643, 2.583672, 1, 0, 0.04705882, 1,
2.62301, -0.6885151, 2.024786, 1, 0, 0.04313726, 1,
2.671428, 0.6050982, 2.460732, 1, 0, 0.03529412, 1,
2.755455, -0.02808159, -0.4674353, 1, 0, 0.03137255, 1,
2.949075, 0.6600145, 1.32374, 1, 0, 0.02352941, 1,
3.102547, -0.3763114, 0.7749854, 1, 0, 0.01960784, 1,
3.613166, -0.795262, 1.497567, 1, 0, 0.01176471, 1,
3.646997, -0.3227819, 2.422465, 1, 0, 0.007843138, 1
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
0.2261984, -4.549318, -6.933696, 0, -0.5, 0.5, 0.5,
0.2261984, -4.549318, -6.933696, 1, -0.5, 0.5, 0.5,
0.2261984, -4.549318, -6.933696, 1, 1.5, 0.5, 0.5,
0.2261984, -4.549318, -6.933696, 0, 1.5, 0.5, 0.5
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
-4.354251, 0.01362312, -6.933696, 0, -0.5, 0.5, 0.5,
-4.354251, 0.01362312, -6.933696, 1, -0.5, 0.5, 0.5,
-4.354251, 0.01362312, -6.933696, 1, 1.5, 0.5, 0.5,
-4.354251, 0.01362312, -6.933696, 0, 1.5, 0.5, 0.5
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
-4.354251, -4.549318, -0.1089718, 0, -0.5, 0.5, 0.5,
-4.354251, -4.549318, -0.1089718, 1, -0.5, 0.5, 0.5,
-4.354251, -4.549318, -0.1089718, 1, 1.5, 0.5, 0.5,
-4.354251, -4.549318, -0.1089718, 0, 1.5, 0.5, 0.5
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
-3, -3.496332, -5.35876,
3, -3.496332, -5.35876,
-3, -3.496332, -5.35876,
-3, -3.671829, -5.621249,
-2, -3.496332, -5.35876,
-2, -3.671829, -5.621249,
-1, -3.496332, -5.35876,
-1, -3.671829, -5.621249,
0, -3.496332, -5.35876,
0, -3.671829, -5.621249,
1, -3.496332, -5.35876,
1, -3.671829, -5.621249,
2, -3.496332, -5.35876,
2, -3.671829, -5.621249,
3, -3.496332, -5.35876,
3, -3.671829, -5.621249
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
-3, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
-3, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
-3, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
-3, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
-2, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
-2, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
-2, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
-2, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
-1, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
-1, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
-1, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
-1, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
0, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
0, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
0, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
0, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
1, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
1, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
1, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
1, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
2, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
2, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
2, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
2, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5,
3, -4.022825, -6.146228, 0, -0.5, 0.5, 0.5,
3, -4.022825, -6.146228, 1, -0.5, 0.5, 0.5,
3, -4.022825, -6.146228, 1, 1.5, 0.5, 0.5,
3, -4.022825, -6.146228, 0, 1.5, 0.5, 0.5
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
-3.297224, -3, -5.35876,
-3.297224, 3, -5.35876,
-3.297224, -3, -5.35876,
-3.473395, -3, -5.621249,
-3.297224, -2, -5.35876,
-3.473395, -2, -5.621249,
-3.297224, -1, -5.35876,
-3.473395, -1, -5.621249,
-3.297224, 0, -5.35876,
-3.473395, 0, -5.621249,
-3.297224, 1, -5.35876,
-3.473395, 1, -5.621249,
-3.297224, 2, -5.35876,
-3.473395, 2, -5.621249,
-3.297224, 3, -5.35876,
-3.473395, 3, -5.621249
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
-3.825737, -3, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, -3, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, -3, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, -3, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, -2, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, -2, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, -2, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, -2, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, -1, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, -1, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, -1, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, -1, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, 0, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, 0, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, 0, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, 0, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, 1, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, 1, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, 1, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, 1, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, 2, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, 2, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, 2, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, 2, -6.146228, 0, 1.5, 0.5, 0.5,
-3.825737, 3, -6.146228, 0, -0.5, 0.5, 0.5,
-3.825737, 3, -6.146228, 1, -0.5, 0.5, 0.5,
-3.825737, 3, -6.146228, 1, 1.5, 0.5, 0.5,
-3.825737, 3, -6.146228, 0, 1.5, 0.5, 0.5
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
-3.297224, -3.496332, -4,
-3.297224, -3.496332, 4,
-3.297224, -3.496332, -4,
-3.473395, -3.671829, -4,
-3.297224, -3.496332, -2,
-3.473395, -3.671829, -2,
-3.297224, -3.496332, 0,
-3.473395, -3.671829, 0,
-3.297224, -3.496332, 2,
-3.473395, -3.671829, 2,
-3.297224, -3.496332, 4,
-3.473395, -3.671829, 4
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
-3.825737, -4.022825, -4, 0, -0.5, 0.5, 0.5,
-3.825737, -4.022825, -4, 1, -0.5, 0.5, 0.5,
-3.825737, -4.022825, -4, 1, 1.5, 0.5, 0.5,
-3.825737, -4.022825, -4, 0, 1.5, 0.5, 0.5,
-3.825737, -4.022825, -2, 0, -0.5, 0.5, 0.5,
-3.825737, -4.022825, -2, 1, -0.5, 0.5, 0.5,
-3.825737, -4.022825, -2, 1, 1.5, 0.5, 0.5,
-3.825737, -4.022825, -2, 0, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 0, 0, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 0, 1, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 0, 1, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 0, 0, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 2, 0, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 2, 1, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 2, 1, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 2, 0, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 4, 0, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 4, 1, -0.5, 0.5, 0.5,
-3.825737, -4.022825, 4, 1, 1.5, 0.5, 0.5,
-3.825737, -4.022825, 4, 0, 1.5, 0.5, 0.5
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
-3.297224, -3.496332, -5.35876,
-3.297224, 3.523578, -5.35876,
-3.297224, -3.496332, 5.140816,
-3.297224, 3.523578, 5.140816,
-3.297224, -3.496332, -5.35876,
-3.297224, -3.496332, 5.140816,
-3.297224, 3.523578, -5.35876,
-3.297224, 3.523578, 5.140816,
-3.297224, -3.496332, -5.35876,
3.749621, -3.496332, -5.35876,
-3.297224, -3.496332, 5.140816,
3.749621, -3.496332, 5.140816,
-3.297224, 3.523578, -5.35876,
3.749621, 3.523578, -5.35876,
-3.297224, 3.523578, 5.140816,
3.749621, 3.523578, 5.140816,
3.749621, -3.496332, -5.35876,
3.749621, 3.523578, -5.35876,
3.749621, -3.496332, 5.140816,
3.749621, 3.523578, 5.140816,
3.749621, -3.496332, -5.35876,
3.749621, -3.496332, 5.140816,
3.749621, 3.523578, -5.35876,
3.749621, 3.523578, 5.140816
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
var radius = 7.722959;
var distance = 34.36032;
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
mvMatrix.translate( -0.2261984, -0.01362312, 0.1089718 );
mvMatrix.scale( 1.184958, 1.189505, 0.7952906 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36032);
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
Carbosulfan<-read.table("Carbosulfan.xyz")
```

```
## Error in read.table("Carbosulfan.xyz"): no lines available in input
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
-3.1946, -1.85958, -4.384472, 0, 0, 1, 1, 1,
-2.857564, -0.941842, -1.535819, 1, 0, 0, 1, 1,
-2.723481, 0.7092447, -1.779013, 1, 0, 0, 1, 1,
-2.605012, -0.3051243, -0.9861567, 1, 0, 0, 1, 1,
-2.597405, -0.1965947, -1.649164, 1, 0, 0, 1, 1,
-2.526489, -1.330759, -3.220303, 1, 0, 0, 1, 1,
-2.525375, 1.087708, -2.596078, 0, 0, 0, 1, 1,
-2.523652, 1.053044, -1.634913, 0, 0, 0, 1, 1,
-2.435565, 1.023207, -0.5856694, 0, 0, 0, 1, 1,
-2.337645, -0.20854, -3.080178, 0, 0, 0, 1, 1,
-2.257154, 0.1815338, -1.975507, 0, 0, 0, 1, 1,
-2.249143, 0.9880226, -1.22395, 0, 0, 0, 1, 1,
-2.236685, -0.009627764, -2.204538, 0, 0, 0, 1, 1,
-2.231477, -0.5983855, -0.3096519, 1, 1, 1, 1, 1,
-2.23074, 1.500137, -1.01862, 1, 1, 1, 1, 1,
-2.230366, -0.3917245, -1.531567, 1, 1, 1, 1, 1,
-2.207183, 0.7793928, -1.391694, 1, 1, 1, 1, 1,
-2.18844, -0.1334494, -2.904131, 1, 1, 1, 1, 1,
-2.18141, -0.02146573, -2.929568, 1, 1, 1, 1, 1,
-2.173712, 0.4405847, -0.7485793, 1, 1, 1, 1, 1,
-2.165551, -1.113683, -2.070737, 1, 1, 1, 1, 1,
-2.156838, -0.431635, -1.002603, 1, 1, 1, 1, 1,
-2.142015, 1.166836, -0.2210661, 1, 1, 1, 1, 1,
-2.037753, -0.1054327, -2.05673, 1, 1, 1, 1, 1,
-2.012147, 1.539122, -0.7829171, 1, 1, 1, 1, 1,
-2.007663, -1.000294, -2.135046, 1, 1, 1, 1, 1,
-1.999998, -0.9868793, -2.110957, 1, 1, 1, 1, 1,
-1.985942, 1.141618, -1.29531, 1, 1, 1, 1, 1,
-1.985597, 0.4387336, 0.2625628, 0, 0, 1, 1, 1,
-1.972713, 1.435809, -0.4014605, 1, 0, 0, 1, 1,
-1.914955, -0.5932154, -3.01701, 1, 0, 0, 1, 1,
-1.882335, 0.3560922, -1.297904, 1, 0, 0, 1, 1,
-1.872357, 1.243894, -2.714624, 1, 0, 0, 1, 1,
-1.87014, -0.8287393, -1.299238, 1, 0, 0, 1, 1,
-1.855209, -0.4708928, -1.072936, 0, 0, 0, 1, 1,
-1.843543, 0.3565587, -0.9724054, 0, 0, 0, 1, 1,
-1.792889, 1.666611, 0.01762062, 0, 0, 0, 1, 1,
-1.748689, 0.552032, -0.1912463, 0, 0, 0, 1, 1,
-1.733505, 2.215789, 0.08444472, 0, 0, 0, 1, 1,
-1.725747, -1.988624, -3.354597, 0, 0, 0, 1, 1,
-1.723615, 0.6228428, -1.988965, 0, 0, 0, 1, 1,
-1.719697, 1.239252, -1.501004, 1, 1, 1, 1, 1,
-1.713458, -1.533494, -2.657002, 1, 1, 1, 1, 1,
-1.698169, -1.643222, -3.109808, 1, 1, 1, 1, 1,
-1.696359, -1.133007, -2.09234, 1, 1, 1, 1, 1,
-1.688644, -1.182254, -1.465059, 1, 1, 1, 1, 1,
-1.684684, -0.7984918, -2.506462, 1, 1, 1, 1, 1,
-1.684305, 1.310492, -2.927573, 1, 1, 1, 1, 1,
-1.678411, 2.254452, -0.4833587, 1, 1, 1, 1, 1,
-1.662734, 0.8906696, -1.822547, 1, 1, 1, 1, 1,
-1.66175, -6.634425e-05, -3.42986, 1, 1, 1, 1, 1,
-1.632376, -0.3245673, -1.370327, 1, 1, 1, 1, 1,
-1.613551, -0.0004422643, -0.6967925, 1, 1, 1, 1, 1,
-1.584155, 0.8799813, -1.179146, 1, 1, 1, 1, 1,
-1.56179, -0.6230277, -2.118215, 1, 1, 1, 1, 1,
-1.560503, -0.6715685, -0.9988936, 1, 1, 1, 1, 1,
-1.558836, -0.04933641, -1.167675, 0, 0, 1, 1, 1,
-1.55603, -0.6135224, -1.807028, 1, 0, 0, 1, 1,
-1.552984, 2.178628, -2.125925, 1, 0, 0, 1, 1,
-1.552592, -1.032735, -2.696076, 1, 0, 0, 1, 1,
-1.539709, -0.02576731, -1.64495, 1, 0, 0, 1, 1,
-1.536745, -0.9049632, -1.9142, 1, 0, 0, 1, 1,
-1.536355, 1.548996, 0.05923909, 0, 0, 0, 1, 1,
-1.530746, 0.515058, -2.552371, 0, 0, 0, 1, 1,
-1.521493, -0.2315316, -4.182785, 0, 0, 0, 1, 1,
-1.513627, 0.4404349, -1.488132, 0, 0, 0, 1, 1,
-1.482138, -1.144517, -1.271043, 0, 0, 0, 1, 1,
-1.467846, 0.1790602, -1.701347, 0, 0, 0, 1, 1,
-1.466172, 0.2654797, -1.433613, 0, 0, 0, 1, 1,
-1.464281, -0.191137, -2.439545, 1, 1, 1, 1, 1,
-1.440828, -0.8339248, -1.685262, 1, 1, 1, 1, 1,
-1.437892, 0.3611814, -0.7347718, 1, 1, 1, 1, 1,
-1.429659, 0.4973901, -0.3068153, 1, 1, 1, 1, 1,
-1.427456, -0.01177789, -1.220807, 1, 1, 1, 1, 1,
-1.421723, 0.5900975, -0.2745194, 1, 1, 1, 1, 1,
-1.406934, 1.749747, -1.446927, 1, 1, 1, 1, 1,
-1.400683, 0.653508, -0.1522227, 1, 1, 1, 1, 1,
-1.389915, -1.816631, -1.864696, 1, 1, 1, 1, 1,
-1.387686, 0.8963241, -1.645283, 1, 1, 1, 1, 1,
-1.375551, 1.445354, -1.199856, 1, 1, 1, 1, 1,
-1.369941, -0.9716409, -0.584838, 1, 1, 1, 1, 1,
-1.369206, 2.128635, 0.7295664, 1, 1, 1, 1, 1,
-1.357924, 0.144774, -2.669909, 1, 1, 1, 1, 1,
-1.350379, 1.778736, -0.876963, 1, 1, 1, 1, 1,
-1.342191, 0.6241862, -1.314909, 0, 0, 1, 1, 1,
-1.341969, -0.2024574, -2.067366, 1, 0, 0, 1, 1,
-1.339273, -1.596192, -4.182181, 1, 0, 0, 1, 1,
-1.335647, -1.364321, -3.567244, 1, 0, 0, 1, 1,
-1.329782, 1.366662, -1.006747, 1, 0, 0, 1, 1,
-1.326755, -0.5902693, -2.445452, 1, 0, 0, 1, 1,
-1.321203, -0.5902183, -2.706292, 0, 0, 0, 1, 1,
-1.297815, -0.8365131, -1.384805, 0, 0, 0, 1, 1,
-1.284136, 0.9109943, -2.231297, 0, 0, 0, 1, 1,
-1.283045, 0.7370783, -0.2393164, 0, 0, 0, 1, 1,
-1.276003, -0.4227588, -0.9091686, 0, 0, 0, 1, 1,
-1.257622, 0.2968247, -1.03677, 0, 0, 0, 1, 1,
-1.255126, 1.832445, -1.231417, 0, 0, 0, 1, 1,
-1.250407, 1.343958, -1.343084, 1, 1, 1, 1, 1,
-1.248838, 0.5003844, 0.5789921, 1, 1, 1, 1, 1,
-1.246944, 1.798076, -0.6320106, 1, 1, 1, 1, 1,
-1.246305, -0.6137295, -3.202979, 1, 1, 1, 1, 1,
-1.245629, -0.9408147, -2.967201, 1, 1, 1, 1, 1,
-1.242649, 1.050688, -1.846724, 1, 1, 1, 1, 1,
-1.232567, -0.8422217, -0.3758824, 1, 1, 1, 1, 1,
-1.231416, -1.025323, -3.598329, 1, 1, 1, 1, 1,
-1.230192, -1.801884, -2.114434, 1, 1, 1, 1, 1,
-1.229953, -2.214306, -1.698522, 1, 1, 1, 1, 1,
-1.228953, 1.320234, -1.936445, 1, 1, 1, 1, 1,
-1.225538, 0.132352, -2.137793, 1, 1, 1, 1, 1,
-1.222482, -3.3941, -2.272025, 1, 1, 1, 1, 1,
-1.206206, 0.4547713, -1.028665, 1, 1, 1, 1, 1,
-1.204495, 0.2501015, -2.072416, 1, 1, 1, 1, 1,
-1.203469, 0.04139127, -2.628195, 0, 0, 1, 1, 1,
-1.196607, 0.5595275, -0.3900112, 1, 0, 0, 1, 1,
-1.196236, -0.4408915, -1.833225, 1, 0, 0, 1, 1,
-1.186367, -1.896929, -2.548038, 1, 0, 0, 1, 1,
-1.182279, 0.6749907, 0.06429645, 1, 0, 0, 1, 1,
-1.180285, 0.5260045, -0.03960008, 1, 0, 0, 1, 1,
-1.179121, 0.5430096, -0.1170601, 0, 0, 0, 1, 1,
-1.178317, 0.9803939, -2.031126, 0, 0, 0, 1, 1,
-1.177253, -0.5500935, -1.754639, 0, 0, 0, 1, 1,
-1.175063, -1.51161, -0.5135064, 0, 0, 0, 1, 1,
-1.169666, 1.132531, -0.3216591, 0, 0, 0, 1, 1,
-1.165773, 1.157714, -2.176614, 0, 0, 0, 1, 1,
-1.165249, -0.1795404, -1.538566, 0, 0, 0, 1, 1,
-1.147846, 0.005036675, -2.202963, 1, 1, 1, 1, 1,
-1.138412, 0.6587407, -0.7733489, 1, 1, 1, 1, 1,
-1.121658, 0.2761637, -1.3604, 1, 1, 1, 1, 1,
-1.115889, -1.387039, -1.894559, 1, 1, 1, 1, 1,
-1.10753, -1.022366, -3.276651, 1, 1, 1, 1, 1,
-1.105518, 2.325052, -0.5355265, 1, 1, 1, 1, 1,
-1.089984, -0.77385, -2.444723, 1, 1, 1, 1, 1,
-1.089366, -0.9921063, -2.243049, 1, 1, 1, 1, 1,
-1.08499, -0.02446581, -1.996357, 1, 1, 1, 1, 1,
-1.071696, -0.8133279, -3.547885, 1, 1, 1, 1, 1,
-1.062391, 2.070372, -1.811254, 1, 1, 1, 1, 1,
-1.058855, 0.6220297, 0.3797159, 1, 1, 1, 1, 1,
-1.055169, -0.6595397, -2.905776, 1, 1, 1, 1, 1,
-1.048465, -0.2207758, -1.099785, 1, 1, 1, 1, 1,
-1.043173, 1.412795, -0.2392333, 1, 1, 1, 1, 1,
-1.036044, 1.255239, -0.1138261, 0, 0, 1, 1, 1,
-1.031901, -1.117356, -1.573145, 1, 0, 0, 1, 1,
-1.025962, 0.02842096, -2.573178, 1, 0, 0, 1, 1,
-1.025762, 0.2099254, -2.702736, 1, 0, 0, 1, 1,
-1.022678, -1.120603, -2.27098, 1, 0, 0, 1, 1,
-1.022034, -0.829173, -2.148168, 1, 0, 0, 1, 1,
-1.018546, -1.640806, -1.809976, 0, 0, 0, 1, 1,
-0.9874269, 0.3071851, 0.05342123, 0, 0, 0, 1, 1,
-0.9821051, 1.220457, -0.2820362, 0, 0, 0, 1, 1,
-0.9784245, -0.9291729, -2.299503, 0, 0, 0, 1, 1,
-0.9740057, 0.2695179, -1.629292, 0, 0, 0, 1, 1,
-0.9725878, -0.7607427, -1.437605, 0, 0, 0, 1, 1,
-0.9684351, -0.9200782, -3.616114, 0, 0, 0, 1, 1,
-0.9652649, -2.267841, -1.808556, 1, 1, 1, 1, 1,
-0.9612893, -0.8859636, -2.8004, 1, 1, 1, 1, 1,
-0.9556903, 0.6328629, -1.869027, 1, 1, 1, 1, 1,
-0.9529066, -1.709023, -3.159716, 1, 1, 1, 1, 1,
-0.9375883, 0.8736002, -0.1599473, 1, 1, 1, 1, 1,
-0.9333394, -0.1762304, -2.026115, 1, 1, 1, 1, 1,
-0.9328866, -1.307857, -2.305599, 1, 1, 1, 1, 1,
-0.9292042, 1.828933, -1.341624, 1, 1, 1, 1, 1,
-0.927192, 0.2622424, -2.831158, 1, 1, 1, 1, 1,
-0.923974, -0.08046839, -3.066014, 1, 1, 1, 1, 1,
-0.9183893, -1.263082, -1.115835, 1, 1, 1, 1, 1,
-0.9182825, 1.936427, -0.9374069, 1, 1, 1, 1, 1,
-0.9147449, -0.3615651, -0.7234452, 1, 1, 1, 1, 1,
-0.9135648, 0.127294, -1.784878, 1, 1, 1, 1, 1,
-0.9063385, -0.2161247, -1.777897, 1, 1, 1, 1, 1,
-0.8984973, 0.8859076, -1.169998, 0, 0, 1, 1, 1,
-0.8774315, -1.012147, -3.030123, 1, 0, 0, 1, 1,
-0.8752361, -1.745231, -2.254189, 1, 0, 0, 1, 1,
-0.8666287, -0.5384066, -1.180565, 1, 0, 0, 1, 1,
-0.8665646, 2.372524, -0.7695634, 1, 0, 0, 1, 1,
-0.8628042, -1.659174, -2.595545, 1, 0, 0, 1, 1,
-0.8585487, 0.563251, -0.5801901, 0, 0, 0, 1, 1,
-0.8563411, 1.493339, 1.142432, 0, 0, 0, 1, 1,
-0.8553059, -0.2260665, -2.027559, 0, 0, 0, 1, 1,
-0.8531759, 1.406281, -0.3019658, 0, 0, 0, 1, 1,
-0.8499606, 0.06151212, -2.281719, 0, 0, 0, 1, 1,
-0.849271, 0.6514477, 0.05119599, 0, 0, 0, 1, 1,
-0.8468522, 0.9056855, -0.2846367, 0, 0, 0, 1, 1,
-0.8408597, -0.3220546, -1.770991, 1, 1, 1, 1, 1,
-0.8343859, 0.3833663, 0.0804384, 1, 1, 1, 1, 1,
-0.826175, 0.5650664, -1.637567, 1, 1, 1, 1, 1,
-0.8232359, -0.5067849, -2.578567, 1, 1, 1, 1, 1,
-0.8178594, 0.450798, 0.2145778, 1, 1, 1, 1, 1,
-0.8065045, -0.7003797, -2.501423, 1, 1, 1, 1, 1,
-0.8045343, 1.5693, -0.2422622, 1, 1, 1, 1, 1,
-0.8021432, 0.6774107, -2.394042, 1, 1, 1, 1, 1,
-0.7969511, -0.3974888, -2.376119, 1, 1, 1, 1, 1,
-0.7941644, 0.1013331, -1.755423, 1, 1, 1, 1, 1,
-0.7884745, -0.679455, -3.076438, 1, 1, 1, 1, 1,
-0.7852274, 0.8396379, -0.8360466, 1, 1, 1, 1, 1,
-0.7808702, 0.6322063, -1.741566, 1, 1, 1, 1, 1,
-0.7781692, 0.4585485, -1.166056, 1, 1, 1, 1, 1,
-0.7781503, -0.2746507, -2.17706, 1, 1, 1, 1, 1,
-0.7756419, 0.2680829, 0.9464023, 0, 0, 1, 1, 1,
-0.768739, 0.2871335, -1.664796, 1, 0, 0, 1, 1,
-0.7650782, 0.8729494, 0.4538385, 1, 0, 0, 1, 1,
-0.7605937, 0.714016, -1.011761, 1, 0, 0, 1, 1,
-0.7585811, -0.8237341, -1.265913, 1, 0, 0, 1, 1,
-0.7576074, 0.9671088, -1.009956, 1, 0, 0, 1, 1,
-0.7549447, -0.8658251, -4.080048, 0, 0, 0, 1, 1,
-0.7516336, 0.09935316, -2.291917, 0, 0, 0, 1, 1,
-0.7392281, 1.412694, 0.5493754, 0, 0, 0, 1, 1,
-0.7368096, -0.09053663, -1.47348, 0, 0, 0, 1, 1,
-0.7223517, -0.0009813164, -1.354289, 0, 0, 0, 1, 1,
-0.7199895, -0.4994642, -3.059328, 0, 0, 0, 1, 1,
-0.7160406, 0.6986482, -1.40545, 0, 0, 0, 1, 1,
-0.7134814, 0.2139411, -0.1887697, 1, 1, 1, 1, 1,
-0.7130505, 1.520935, 0.746296, 1, 1, 1, 1, 1,
-0.7114069, -2.203898, -2.216252, 1, 1, 1, 1, 1,
-0.7052524, 1.177608, -1.865315, 1, 1, 1, 1, 1,
-0.7043124, 1.276448, -1.148052, 1, 1, 1, 1, 1,
-0.7027735, 0.2763071, -1.401655, 1, 1, 1, 1, 1,
-0.7010314, -0.4594684, -2.587821, 1, 1, 1, 1, 1,
-0.6983413, -0.9013696, -2.160044, 1, 1, 1, 1, 1,
-0.6873519, -1.561062, -3.858258, 1, 1, 1, 1, 1,
-0.6869572, 0.4585022, -0.03751495, 1, 1, 1, 1, 1,
-0.6794924, -0.4149196, -1.807644, 1, 1, 1, 1, 1,
-0.6766745, -0.8406316, -2.528724, 1, 1, 1, 1, 1,
-0.6759251, -0.2899287, -3.112517, 1, 1, 1, 1, 1,
-0.6753536, 1.072795, -1.176635, 1, 1, 1, 1, 1,
-0.669161, -0.08137254, -2.473207, 1, 1, 1, 1, 1,
-0.6676401, -0.2287402, -2.297658, 0, 0, 1, 1, 1,
-0.662966, 0.176176, -0.3548957, 1, 0, 0, 1, 1,
-0.6616728, -1.563917, -2.198343, 1, 0, 0, 1, 1,
-0.6568376, -0.06754435, -1.059383, 1, 0, 0, 1, 1,
-0.6463807, 0.6754688, -1.278291, 1, 0, 0, 1, 1,
-0.6454864, 0.2731094, -2.469743, 1, 0, 0, 1, 1,
-0.6446576, -0.2643312, 0.15348, 0, 0, 0, 1, 1,
-0.6353458, 0.8555362, 0.3972479, 0, 0, 0, 1, 1,
-0.6351712, -0.3278855, -1.951524, 0, 0, 0, 1, 1,
-0.6296737, -1.930166, -2.488867, 0, 0, 0, 1, 1,
-0.6268747, 0.2970174, -0.4280726, 0, 0, 0, 1, 1,
-0.6260302, -0.54961, -2.284508, 0, 0, 0, 1, 1,
-0.6245944, -0.9933836, -3.349602, 0, 0, 0, 1, 1,
-0.6245888, -2.082661, -2.66794, 1, 1, 1, 1, 1,
-0.6198766, 1.383263, 1.312928, 1, 1, 1, 1, 1,
-0.6186252, -1.805267, -4.079663, 1, 1, 1, 1, 1,
-0.6145457, -0.7433796, -3.156597, 1, 1, 1, 1, 1,
-0.6142688, -0.1893299, -3.393257, 1, 1, 1, 1, 1,
-0.6116624, 2.243147, 0.1443445, 1, 1, 1, 1, 1,
-0.6076084, 1.16227, 1.307702, 1, 1, 1, 1, 1,
-0.5994164, 0.1060974, -1.516148, 1, 1, 1, 1, 1,
-0.5962801, -1.512663, -3.099773, 1, 1, 1, 1, 1,
-0.5941945, 0.5986441, -2.694469, 1, 1, 1, 1, 1,
-0.5902399, 0.9875459, -0.8815501, 1, 1, 1, 1, 1,
-0.5897925, 0.8356439, -0.07974321, 1, 1, 1, 1, 1,
-0.5894294, 0.01545959, -1.394862, 1, 1, 1, 1, 1,
-0.5789307, 0.3191146, -0.1010017, 1, 1, 1, 1, 1,
-0.5761378, -0.004005169, -0.8727139, 1, 1, 1, 1, 1,
-0.5757022, 0.4292694, -1.622683, 0, 0, 1, 1, 1,
-0.5745139, -0.3095027, -2.510537, 1, 0, 0, 1, 1,
-0.5729651, -0.04067342, -1.684992, 1, 0, 0, 1, 1,
-0.5669314, -0.4516427, -3.480595, 1, 0, 0, 1, 1,
-0.5660645, -0.6741857, -3.67683, 1, 0, 0, 1, 1,
-0.5660058, -2.376842, -3.764184, 1, 0, 0, 1, 1,
-0.5632716, -0.1456221, -2.954525, 0, 0, 0, 1, 1,
-0.5560697, -0.5532741, -2.608215, 0, 0, 0, 1, 1,
-0.5558592, 0.5898617, -2.549671, 0, 0, 0, 1, 1,
-0.5513419, -0.7879946, -1.914079, 0, 0, 0, 1, 1,
-0.5511053, 1.872499, 0.9939428, 0, 0, 0, 1, 1,
-0.5509208, -0.9393692, -3.102045, 0, 0, 0, 1, 1,
-0.5435157, 0.2971483, -1.850629, 0, 0, 0, 1, 1,
-0.5390445, 0.3017188, -2.216718, 1, 1, 1, 1, 1,
-0.539018, 0.2897142, -1.016668, 1, 1, 1, 1, 1,
-0.5345349, -1.48164, -1.381201, 1, 1, 1, 1, 1,
-0.5295376, -0.5869607, -2.336773, 1, 1, 1, 1, 1,
-0.5284187, -0.2456893, -0.4442176, 1, 1, 1, 1, 1,
-0.5238844, -1.605579, -1.864607, 1, 1, 1, 1, 1,
-0.5208766, -0.04375818, -2.003953, 1, 1, 1, 1, 1,
-0.5208057, 1.060744, -0.009979947, 1, 1, 1, 1, 1,
-0.5163831, 0.008525014, -1.041512, 1, 1, 1, 1, 1,
-0.5104602, 0.9748513, -0.7966694, 1, 1, 1, 1, 1,
-0.508417, 1.589902, 0.105863, 1, 1, 1, 1, 1,
-0.5053161, -0.06740149, -1.802798, 1, 1, 1, 1, 1,
-0.5038989, -0.3134305, -2.689581, 1, 1, 1, 1, 1,
-0.4969305, 0.05935353, -1.484969, 1, 1, 1, 1, 1,
-0.4958611, -0.2430675, -1.676679, 1, 1, 1, 1, 1,
-0.4948862, -0.4930418, -1.938557, 0, 0, 1, 1, 1,
-0.4920787, 0.6713672, -0.3509704, 1, 0, 0, 1, 1,
-0.4886098, 0.2658938, -0.7131168, 1, 0, 0, 1, 1,
-0.4822509, -0.5574178, -1.743333, 1, 0, 0, 1, 1,
-0.4809822, 1.294913, 0.263044, 1, 0, 0, 1, 1,
-0.4808957, -0.2909734, -1.413087, 1, 0, 0, 1, 1,
-0.4772357, 0.7357993, -0.6166425, 0, 0, 0, 1, 1,
-0.4725383, 1.236427, -0.5320488, 0, 0, 0, 1, 1,
-0.4664481, 0.1871203, -1.084661, 0, 0, 0, 1, 1,
-0.4660254, -1.052552, -2.37516, 0, 0, 0, 1, 1,
-0.4569093, 0.1706053, -1.986399, 0, 0, 0, 1, 1,
-0.455664, 1.133027, -0.6460245, 0, 0, 0, 1, 1,
-0.4532493, -1.58841, -2.452705, 0, 0, 0, 1, 1,
-0.4454311, -0.9117295, -2.575424, 1, 1, 1, 1, 1,
-0.4450988, -0.5268896, -1.746443, 1, 1, 1, 1, 1,
-0.4421243, -2.483541, -2.892616, 1, 1, 1, 1, 1,
-0.4338842, 0.5046402, 0.1891735, 1, 1, 1, 1, 1,
-0.4305621, -0.1067366, -1.340121, 1, 1, 1, 1, 1,
-0.4303975, 0.5106649, 0.643952, 1, 1, 1, 1, 1,
-0.4260925, -2.10647, -4.565686, 1, 1, 1, 1, 1,
-0.4219553, -0.3886384, -3.80848, 1, 1, 1, 1, 1,
-0.4140408, 0.7180477, -0.6347261, 1, 1, 1, 1, 1,
-0.4070213, 0.1218767, -0.6051076, 1, 1, 1, 1, 1,
-0.4060172, -0.8457861, -2.515021, 1, 1, 1, 1, 1,
-0.405393, -0.9703605, -1.309342, 1, 1, 1, 1, 1,
-0.4031933, 0.7290108, -0.7983239, 1, 1, 1, 1, 1,
-0.4027593, -0.758129, -3.202084, 1, 1, 1, 1, 1,
-0.4009006, -0.2503932, -3.628185, 1, 1, 1, 1, 1,
-0.3998474, 1.86148, -0.4442634, 0, 0, 1, 1, 1,
-0.3993983, -0.8364069, -2.936265, 1, 0, 0, 1, 1,
-0.3970716, -0.2512769, -1.209905, 1, 0, 0, 1, 1,
-0.3967757, -0.2643733, -0.6138057, 1, 0, 0, 1, 1,
-0.3934045, -0.4232662, -4.258695, 1, 0, 0, 1, 1,
-0.3912644, -1.832933, -2.640768, 1, 0, 0, 1, 1,
-0.3850188, -1.052163, -5.205853, 0, 0, 0, 1, 1,
-0.3836353, -1.053731, -3.546514, 0, 0, 0, 1, 1,
-0.3808462, 0.07653583, -2.369058, 0, 0, 0, 1, 1,
-0.380265, -0.3856088, -2.050407, 0, 0, 0, 1, 1,
-0.3735862, -0.4958968, -1.904663, 0, 0, 0, 1, 1,
-0.3734035, 0.2177254, -2.394942, 0, 0, 0, 1, 1,
-0.3731172, -0.9548842, -2.89946, 0, 0, 0, 1, 1,
-0.3715502, -0.1692154, -2.739668, 1, 1, 1, 1, 1,
-0.3686859, -0.1002955, -2.857628, 1, 1, 1, 1, 1,
-0.3669135, -0.3536993, -3.694608, 1, 1, 1, 1, 1,
-0.3628758, -0.5555252, -3.064527, 1, 1, 1, 1, 1,
-0.3627068, -0.8073848, -3.190631, 1, 1, 1, 1, 1,
-0.3573081, 1.614838, -2.665788, 1, 1, 1, 1, 1,
-0.3469961, 0.1903592, -2.010719, 1, 1, 1, 1, 1,
-0.346763, 0.01964874, -2.884352, 1, 1, 1, 1, 1,
-0.3453119, -0.03523782, -1.252137, 1, 1, 1, 1, 1,
-0.3446682, -0.8772855, -2.200325, 1, 1, 1, 1, 1,
-0.3401063, -0.7621822, -1.976935, 1, 1, 1, 1, 1,
-0.338899, 1.509269, -1.456225, 1, 1, 1, 1, 1,
-0.3356929, -2.210257, -3.766565, 1, 1, 1, 1, 1,
-0.3345546, -0.3511906, -1.512552, 1, 1, 1, 1, 1,
-0.3308833, -0.55623, -2.91737, 1, 1, 1, 1, 1,
-0.329398, -0.6625597, -3.116927, 0, 0, 1, 1, 1,
-0.3289137, 1.260024, 0.6152797, 1, 0, 0, 1, 1,
-0.3278801, -0.6460154, -3.107182, 1, 0, 0, 1, 1,
-0.3229355, 0.2537987, -1.396691, 1, 0, 0, 1, 1,
-0.3204968, 1.72181, 0.06974139, 1, 0, 0, 1, 1,
-0.3192552, -0.1715944, -3.421008, 1, 0, 0, 1, 1,
-0.3180504, -0.5950021, -3.391638, 0, 0, 0, 1, 1,
-0.3141647, -0.8206661, -1.967064, 0, 0, 0, 1, 1,
-0.3120175, 2.078764, -1.441305, 0, 0, 0, 1, 1,
-0.310201, -1.052069, -2.531813, 0, 0, 0, 1, 1,
-0.3074405, 0.3928292, 1.487586, 0, 0, 0, 1, 1,
-0.3042856, 0.2801071, -2.691777, 0, 0, 0, 1, 1,
-0.3025084, -1.271369, -4.409412, 0, 0, 0, 1, 1,
-0.3007177, -2.287357, -3.225187, 1, 1, 1, 1, 1,
-0.2999498, 1.331084, -0.3584695, 1, 1, 1, 1, 1,
-0.2989106, -1.698054, -3.030709, 1, 1, 1, 1, 1,
-0.2953737, 3.256675, 0.3934419, 1, 1, 1, 1, 1,
-0.2939317, -0.26559, -1.782992, 1, 1, 1, 1, 1,
-0.2918938, 1.478515, -0.01222112, 1, 1, 1, 1, 1,
-0.2916142, 1.571067, -1.794272, 1, 1, 1, 1, 1,
-0.291067, -0.1432467, -1.276191, 1, 1, 1, 1, 1,
-0.2910561, 0.3210748, -1.026381, 1, 1, 1, 1, 1,
-0.2884212, -2.291291, -3.236714, 1, 1, 1, 1, 1,
-0.2790896, -0.2864261, -2.450678, 1, 1, 1, 1, 1,
-0.2758046, -1.067369, -3.293462, 1, 1, 1, 1, 1,
-0.2737792, 1.12193, 0.3530267, 1, 1, 1, 1, 1,
-0.2718232, 0.9019457, -2.371763, 1, 1, 1, 1, 1,
-0.2707013, 0.5086187, 0.01894619, 1, 1, 1, 1, 1,
-0.2659746, -1.000425, -2.932031, 0, 0, 1, 1, 1,
-0.2636017, 0.06830016, -1.542215, 1, 0, 0, 1, 1,
-0.2624435, -0.2115096, -2.227977, 1, 0, 0, 1, 1,
-0.2588101, 1.101714, 1.021761, 1, 0, 0, 1, 1,
-0.2580881, 0.7904093, -0.9045662, 1, 0, 0, 1, 1,
-0.2569947, 0.5245081, -0.3501756, 1, 0, 0, 1, 1,
-0.2538322, 1.16706, -0.4089556, 0, 0, 0, 1, 1,
-0.2516997, -0.06910913, -2.076831, 0, 0, 0, 1, 1,
-0.2500959, 0.6385208, -0.7212094, 0, 0, 0, 1, 1,
-0.2467252, 0.9682179, -0.5720407, 0, 0, 0, 1, 1,
-0.2444806, -0.07073773, -0.07133969, 0, 0, 0, 1, 1,
-0.2441115, 0.06174409, -0.8120468, 0, 0, 0, 1, 1,
-0.2420918, -1.361099, -4.87785, 0, 0, 0, 1, 1,
-0.2403668, -1.045367, -3.933621, 1, 1, 1, 1, 1,
-0.2399298, 1.496692, 0.1365196, 1, 1, 1, 1, 1,
-0.2353137, 1.592566, 1.03574, 1, 1, 1, 1, 1,
-0.2345087, -2.070354, -4.53795, 1, 1, 1, 1, 1,
-0.2333515, -0.6980036, -4.415489, 1, 1, 1, 1, 1,
-0.2324244, 0.0676268, -1.114592, 1, 1, 1, 1, 1,
-0.2323794, 0.6726893, 0.5415173, 1, 1, 1, 1, 1,
-0.2312363, 1.45609, -0.08963772, 1, 1, 1, 1, 1,
-0.2304719, -0.2249317, -2.936337, 1, 1, 1, 1, 1,
-0.2297621, -0.8773465, -1.875198, 1, 1, 1, 1, 1,
-0.2285769, 0.5278201, -0.5759994, 1, 1, 1, 1, 1,
-0.227584, 0.1493062, -1.289778, 1, 1, 1, 1, 1,
-0.2270758, -1.565603, -2.964767, 1, 1, 1, 1, 1,
-0.2220235, -2.071713, -1.070355, 1, 1, 1, 1, 1,
-0.221732, 0.5998659, -0.08422805, 1, 1, 1, 1, 1,
-0.2202161, 0.5937389, -1.730417, 0, 0, 1, 1, 1,
-0.2184861, 0.3904448, -0.6240483, 1, 0, 0, 1, 1,
-0.2183387, 1.503392, -1.122109, 1, 0, 0, 1, 1,
-0.2141903, -1.571622, -4.985365, 1, 0, 0, 1, 1,
-0.2140352, 1.426491, 2.445523, 1, 0, 0, 1, 1,
-0.2110991, -0.405105, -4.334713, 1, 0, 0, 1, 1,
-0.2108853, -0.1145224, -1.503907, 0, 0, 0, 1, 1,
-0.20884, -0.5328976, -1.369435, 0, 0, 0, 1, 1,
-0.2051266, -0.559779, -2.510491, 0, 0, 0, 1, 1,
-0.2015775, -0.03576198, -2.423164, 0, 0, 0, 1, 1,
-0.201468, 0.320992, -1.593656, 0, 0, 0, 1, 1,
-0.1978133, 1.027443, -1.19605, 0, 0, 0, 1, 1,
-0.1978015, 0.6973713, 0.8234337, 0, 0, 0, 1, 1,
-0.1974235, -0.623779, -2.533239, 1, 1, 1, 1, 1,
-0.1965031, 0.2346334, -0.1332761, 1, 1, 1, 1, 1,
-0.1963165, 1.393084, 0.3929094, 1, 1, 1, 1, 1,
-0.1944554, -0.5919924, -2.454706, 1, 1, 1, 1, 1,
-0.1905394, 1.289995, -0.7376637, 1, 1, 1, 1, 1,
-0.188502, -0.9287642, -3.071935, 1, 1, 1, 1, 1,
-0.1857548, 0.4759097, -0.6067456, 1, 1, 1, 1, 1,
-0.1855548, 0.7101161, -1.085877, 1, 1, 1, 1, 1,
-0.1827272, 2.219709, -0.3851773, 1, 1, 1, 1, 1,
-0.182672, -0.2725528, -1.556659, 1, 1, 1, 1, 1,
-0.1795609, -0.8011185, -4.456587, 1, 1, 1, 1, 1,
-0.1764719, -0.001947541, -1.432531, 1, 1, 1, 1, 1,
-0.1649809, -0.956032, -3.491107, 1, 1, 1, 1, 1,
-0.1563898, 0.7481439, 0.9617536, 1, 1, 1, 1, 1,
-0.1543898, -0.004987197, 0.2375777, 1, 1, 1, 1, 1,
-0.15302, 0.529384, -0.2068284, 0, 0, 1, 1, 1,
-0.1487506, -1.26475, -2.074484, 1, 0, 0, 1, 1,
-0.1479052, 0.1439386, -0.2571257, 1, 0, 0, 1, 1,
-0.1471295, -0.6964327, -2.377468, 1, 0, 0, 1, 1,
-0.1420041, 0.4808455, 0.2149167, 1, 0, 0, 1, 1,
-0.1416266, 1.47833, -0.2200291, 1, 0, 0, 1, 1,
-0.1381977, -1.232077, -2.422414, 0, 0, 0, 1, 1,
-0.1311589, -0.8638252, -4.107871, 0, 0, 0, 1, 1,
-0.1307086, 0.6457104, -0.6962704, 0, 0, 0, 1, 1,
-0.125685, -1.341752, -3.440004, 0, 0, 0, 1, 1,
-0.1251264, 2.169134, -0.5508165, 0, 0, 0, 1, 1,
-0.118646, 0.9546637, 0.1729638, 0, 0, 0, 1, 1,
-0.1157802, 1.643674, -1.989369, 0, 0, 0, 1, 1,
-0.1156927, -1.073516, -2.881823, 1, 1, 1, 1, 1,
-0.1133746, 0.668676, -1.170603, 1, 1, 1, 1, 1,
-0.1063771, 1.49703, 1.04922, 1, 1, 1, 1, 1,
-0.1055182, 0.5722306, -2.1245, 1, 1, 1, 1, 1,
-0.1029151, 1.006378, 1.017709, 1, 1, 1, 1, 1,
-0.09819116, 0.2400346, 0.04533969, 1, 1, 1, 1, 1,
-0.09609394, 0.6835767, 0.4411121, 1, 1, 1, 1, 1,
-0.09511467, 0.2784682, -0.01992291, 1, 1, 1, 1, 1,
-0.09369642, 0.4147031, 0.3112468, 1, 1, 1, 1, 1,
-0.09135915, -0.2006509, -1.031567, 1, 1, 1, 1, 1,
-0.0875384, -1.191886, -3.850034, 1, 1, 1, 1, 1,
-0.08738318, -0.4404168, -2.449679, 1, 1, 1, 1, 1,
-0.08079055, -0.4094504, -1.716721, 1, 1, 1, 1, 1,
-0.07891974, 0.9774351, 0.6410194, 1, 1, 1, 1, 1,
-0.07658777, -0.6351491, -2.147031, 1, 1, 1, 1, 1,
-0.07495127, -0.3211497, -3.64728, 0, 0, 1, 1, 1,
-0.06904967, -0.04422034, -3.2086, 1, 0, 0, 1, 1,
-0.06841992, 0.5282918, -0.8142527, 1, 0, 0, 1, 1,
-0.06807975, 0.5447009, 0.5157918, 1, 0, 0, 1, 1,
-0.0673326, -0.5732352, -2.970909, 1, 0, 0, 1, 1,
-0.06694891, 1.200896, 1.592132, 1, 0, 0, 1, 1,
-0.06661681, -1.454417, -4.570635, 0, 0, 0, 1, 1,
-0.06561828, -0.5478913, -4.250105, 0, 0, 0, 1, 1,
-0.06440344, 3.110821, -0.6933023, 0, 0, 0, 1, 1,
-0.06267543, -1.090983, -3.301904, 0, 0, 0, 1, 1,
-0.06146871, 0.9891813, 0.7479304, 0, 0, 0, 1, 1,
-0.05996248, 0.8411278, -0.3771352, 0, 0, 0, 1, 1,
-0.0596335, -0.1994549, -2.866009, 0, 0, 0, 1, 1,
-0.05288434, -1.206221, -3.752482, 1, 1, 1, 1, 1,
-0.05262022, -0.568688, -4.732357, 1, 1, 1, 1, 1,
-0.05149706, -1.611425, -1.688129, 1, 1, 1, 1, 1,
-0.05071951, 1.05864, -0.6432589, 1, 1, 1, 1, 1,
-0.04957841, -0.462613, -2.794384, 1, 1, 1, 1, 1,
-0.04809189, 0.9070879, 1.282975, 1, 1, 1, 1, 1,
-0.04407731, -0.3131424, -2.999879, 1, 1, 1, 1, 1,
-0.04131445, 0.3766524, 0.2534474, 1, 1, 1, 1, 1,
-0.04010889, 0.03373677, 0.05483683, 1, 1, 1, 1, 1,
-0.03911688, 0.3582494, -0.8531975, 1, 1, 1, 1, 1,
-0.03811594, -0.5320221, -3.430434, 1, 1, 1, 1, 1,
-0.0377802, 0.2310116, -0.6102697, 1, 1, 1, 1, 1,
-0.03319499, 1.758245, 0.8683485, 1, 1, 1, 1, 1,
-0.03289313, -0.0603397, -2.751443, 1, 1, 1, 1, 1,
-0.03270783, -0.1231275, -3.861671, 1, 1, 1, 1, 1,
-0.0326041, -0.987809, -4.868897, 0, 0, 1, 1, 1,
-0.03010233, -1.31082, -2.750876, 1, 0, 0, 1, 1,
-0.02922855, 0.3899762, -0.09986732, 1, 0, 0, 1, 1,
-0.0283671, -0.3078049, -2.463343, 1, 0, 0, 1, 1,
-0.02644465, 1.856873, 0.9351954, 1, 0, 0, 1, 1,
-0.02066077, -2.130272, -1.643132, 1, 0, 0, 1, 1,
-0.01899096, -0.2787738, -3.098593, 0, 0, 0, 1, 1,
-0.01306531, -0.3738189, -3.901088, 0, 0, 0, 1, 1,
-0.01180139, -0.007544368, -2.519062, 0, 0, 0, 1, 1,
-0.00867944, 0.5544239, 0.8746108, 0, 0, 0, 1, 1,
-0.006845085, 1.014568, -0.5247428, 0, 0, 0, 1, 1,
-0.005420103, 0.1171903, 0.995629, 0, 0, 0, 1, 1,
0.0005829476, -0.216575, 2.175795, 0, 0, 0, 1, 1,
0.001240644, -0.168588, 2.249701, 1, 1, 1, 1, 1,
0.003618816, -0.8945823, 2.357097, 1, 1, 1, 1, 1,
0.01292427, 0.003530975, -0.0235569, 1, 1, 1, 1, 1,
0.01380544, 0.01448321, 1.682429, 1, 1, 1, 1, 1,
0.0163621, 0.2940609, -0.7535576, 1, 1, 1, 1, 1,
0.01676857, 0.6947817, 1.044864, 1, 1, 1, 1, 1,
0.01876944, -0.114259, 3.577729, 1, 1, 1, 1, 1,
0.02232592, 2.186103, 0.4325602, 1, 1, 1, 1, 1,
0.02325467, -0.8931847, 3.066352, 1, 1, 1, 1, 1,
0.0239329, 0.8042381, 0.8018985, 1, 1, 1, 1, 1,
0.02554406, -0.1732315, 3.937975, 1, 1, 1, 1, 1,
0.02903471, 0.02907486, 3.241785, 1, 1, 1, 1, 1,
0.03022621, 1.369071, 0.8086857, 1, 1, 1, 1, 1,
0.03448487, 0.02938351, 1.879707, 1, 1, 1, 1, 1,
0.03604719, -0.1027447, 3.686769, 1, 1, 1, 1, 1,
0.03631338, -0.1701273, 3.08514, 0, 0, 1, 1, 1,
0.03698399, -0.252937, 3.175828, 1, 0, 0, 1, 1,
0.03821531, -0.01682829, 3.450289, 1, 0, 0, 1, 1,
0.04330615, -0.4895404, -0.3504041, 1, 0, 0, 1, 1,
0.04651659, -1.259326, 3.020331, 1, 0, 0, 1, 1,
0.05205056, 3.421346, 0.4610255, 1, 0, 0, 1, 1,
0.05295775, -0.5342934, 3.174022, 0, 0, 0, 1, 1,
0.05411665, 1.411661, -0.5203523, 0, 0, 0, 1, 1,
0.06743935, -0.1303221, 3.229315, 0, 0, 0, 1, 1,
0.07248406, -0.6700859, 1.937787, 0, 0, 0, 1, 1,
0.07462656, 0.2368314, 0.3571572, 0, 0, 0, 1, 1,
0.07547101, -0.005803995, 0.004167548, 0, 0, 0, 1, 1,
0.07634243, 1.093655, -0.3139719, 0, 0, 0, 1, 1,
0.07807854, -0.02293147, -1.555228, 1, 1, 1, 1, 1,
0.07894208, -0.4656611, 2.044605, 1, 1, 1, 1, 1,
0.07967491, 0.07329702, 0.9671289, 1, 1, 1, 1, 1,
0.07973231, -1.940126, 3.450739, 1, 1, 1, 1, 1,
0.08184456, 0.1232666, 0.7456478, 1, 1, 1, 1, 1,
0.09149475, -0.06914675, 3.882145, 1, 1, 1, 1, 1,
0.09326603, -0.07391394, 1.65282, 1, 1, 1, 1, 1,
0.09407546, 0.6266471, -0.4657055, 1, 1, 1, 1, 1,
0.09541711, 2.045123, 0.4932741, 1, 1, 1, 1, 1,
0.0968025, 0.6798325, 1.163966, 1, 1, 1, 1, 1,
0.09934098, -0.9646504, 1.443236, 1, 1, 1, 1, 1,
0.1000452, 1.609827, -0.9911917, 1, 1, 1, 1, 1,
0.1053043, -1.730541, 2.513138, 1, 1, 1, 1, 1,
0.1117338, -0.8851898, 4.871625, 1, 1, 1, 1, 1,
0.1138119, -0.6242734, 2.931624, 1, 1, 1, 1, 1,
0.1160542, -1.529637, 2.527616, 0, 0, 1, 1, 1,
0.1178262, 0.5250235, 0.1913697, 1, 0, 0, 1, 1,
0.1187689, -0.467, 3.390614, 1, 0, 0, 1, 1,
0.1220638, 1.537351, 0.8338561, 1, 0, 0, 1, 1,
0.1288984, -0.5597699, 4.071652, 1, 0, 0, 1, 1,
0.1296303, 0.3702742, 2.306935, 1, 0, 0, 1, 1,
0.1374209, 0.6960207, 1.041556, 0, 0, 0, 1, 1,
0.1376794, 1.173521, -0.05651063, 0, 0, 0, 1, 1,
0.1382781, 0.9340186, 1.691586, 0, 0, 0, 1, 1,
0.1422268, 0.5941964, 0.7349805, 0, 0, 0, 1, 1,
0.1448151, 1.3256, 0.4632919, 0, 0, 0, 1, 1,
0.1466483, -0.03530766, 1.010588, 0, 0, 0, 1, 1,
0.1480871, -0.2542561, 4.98791, 0, 0, 0, 1, 1,
0.1515304, -0.2730988, 1.028715, 1, 1, 1, 1, 1,
0.1527288, 0.7087405, -0.6082057, 1, 1, 1, 1, 1,
0.156126, 0.9086314, -1.557842, 1, 1, 1, 1, 1,
0.1596517, -0.4522559, 3.441794, 1, 1, 1, 1, 1,
0.1597269, 0.1873754, 1.636523, 1, 1, 1, 1, 1,
0.1668683, -1.620377, 1.67237, 1, 1, 1, 1, 1,
0.1669065, 1.916256, -1.034436, 1, 1, 1, 1, 1,
0.1690565, -0.5987892, 4.031608, 1, 1, 1, 1, 1,
0.17112, 1.828305, 0.8628519, 1, 1, 1, 1, 1,
0.1724148, -1.316112, 1.312946, 1, 1, 1, 1, 1,
0.174571, -2.01827, 3.550478, 1, 1, 1, 1, 1,
0.1755798, 0.6800449, -0.9066563, 1, 1, 1, 1, 1,
0.1765807, -1.342747, 3.440374, 1, 1, 1, 1, 1,
0.1788795, -0.3788103, 2.030582, 1, 1, 1, 1, 1,
0.1801664, 0.3223813, 0.4919302, 1, 1, 1, 1, 1,
0.1854811, -0.3727899, 1.701235, 0, 0, 1, 1, 1,
0.1866997, -2.114923, 2.96724, 1, 0, 0, 1, 1,
0.1893739, -1.223481, 2.915269, 1, 0, 0, 1, 1,
0.1914697, 0.05606088, -0.3296691, 1, 0, 0, 1, 1,
0.1918148, 0.5304957, 0.6861175, 1, 0, 0, 1, 1,
0.1930232, 1.335985, 2.61562, 1, 0, 0, 1, 1,
0.1950116, -0.7103726, 2.235573, 0, 0, 0, 1, 1,
0.2023313, 0.8014899, 0.4276975, 0, 0, 0, 1, 1,
0.203175, -1.272672, 2.761766, 0, 0, 0, 1, 1,
0.2048015, 0.5695976, 1.063814, 0, 0, 0, 1, 1,
0.2075821, 0.1347276, 1.775932, 0, 0, 0, 1, 1,
0.2097896, -1.283692, 1.996148, 0, 0, 0, 1, 1,
0.2131801, 1.257936, -0.4709021, 0, 0, 0, 1, 1,
0.2150234, 0.5567644, 0.7677414, 1, 1, 1, 1, 1,
0.216285, 1.712688, -1.251972, 1, 1, 1, 1, 1,
0.2173807, 0.7316033, -0.2017754, 1, 1, 1, 1, 1,
0.2188627, 0.5194647, 0.25005, 1, 1, 1, 1, 1,
0.2205774, 1.173726, 0.7990785, 1, 1, 1, 1, 1,
0.2212797, 0.4488041, -0.411337, 1, 1, 1, 1, 1,
0.2272854, -1.068437, 1.96948, 1, 1, 1, 1, 1,
0.234217, -1.207283, 4.199239, 1, 1, 1, 1, 1,
0.2406525, 0.1413099, 0.4077255, 1, 1, 1, 1, 1,
0.2413083, 0.6643192, 0.1171952, 1, 1, 1, 1, 1,
0.2431656, -0.3545717, 3.533317, 1, 1, 1, 1, 1,
0.2488718, -0.1235928, 1.467422, 1, 1, 1, 1, 1,
0.2503248, -0.2949679, 2.915633, 1, 1, 1, 1, 1,
0.2508831, 0.3211285, 1.192259, 1, 1, 1, 1, 1,
0.2612304, 0.9688438, 1.304386, 1, 1, 1, 1, 1,
0.2614454, -1.284404, 2.069747, 0, 0, 1, 1, 1,
0.2634158, 0.3908276, 0.8311124, 1, 0, 0, 1, 1,
0.2640702, -1.200369, 1.890126, 1, 0, 0, 1, 1,
0.2668768, 0.1652234, 1.035632, 1, 0, 0, 1, 1,
0.2682588, 0.7592071, 0.2052629, 1, 0, 0, 1, 1,
0.271586, -2.022878, 2.866554, 1, 0, 0, 1, 1,
0.2752578, -0.4800166, 2.686496, 0, 0, 0, 1, 1,
0.2753284, 2.157163, 0.3019132, 0, 0, 0, 1, 1,
0.2775537, -0.707408, 1.471551, 0, 0, 0, 1, 1,
0.2776287, -0.1702673, 1.263815, 0, 0, 0, 1, 1,
0.2803126, 0.6644477, 0.3888996, 0, 0, 0, 1, 1,
0.2822935, 0.2561018, 0.4885885, 0, 0, 0, 1, 1,
0.2825036, 0.3323378, 0.5451627, 0, 0, 0, 1, 1,
0.2860901, -0.2523311, 2.561253, 1, 1, 1, 1, 1,
0.2875639, 0.04506458, 0.06903628, 1, 1, 1, 1, 1,
0.2902016, -1.017509, 3.514682, 1, 1, 1, 1, 1,
0.2937401, -1.034821, 4.778795, 1, 1, 1, 1, 1,
0.2963473, 0.2105632, 0.4916298, 1, 1, 1, 1, 1,
0.3017652, 1.424425, -0.1879332, 1, 1, 1, 1, 1,
0.3018915, 0.2722778, 0.2915649, 1, 1, 1, 1, 1,
0.3093252, -0.396334, 3.917023, 1, 1, 1, 1, 1,
0.3157451, -0.8932343, 3.945779, 1, 1, 1, 1, 1,
0.3193624, 0.8555995, 0.0320766, 1, 1, 1, 1, 1,
0.3236101, -0.1163649, 2.016336, 1, 1, 1, 1, 1,
0.3250651, -1.079935, 2.199656, 1, 1, 1, 1, 1,
0.3271497, 1.444231, 0.3790452, 1, 1, 1, 1, 1,
0.3284551, 0.5943272, 0.02630459, 1, 1, 1, 1, 1,
0.3292846, -0.1876383, 2.219019, 1, 1, 1, 1, 1,
0.3317059, 0.6683856, 1.415287, 0, 0, 1, 1, 1,
0.3343057, 1.440409, 0.004570479, 1, 0, 0, 1, 1,
0.3374888, -0.5946417, 3.046286, 1, 0, 0, 1, 1,
0.3399271, 1.073843, 1.688847, 1, 0, 0, 1, 1,
0.3443433, -0.8083801, 2.117842, 1, 0, 0, 1, 1,
0.3445369, -0.3444557, 2.405249, 1, 0, 0, 1, 1,
0.3445906, -0.6623344, 2.190566, 0, 0, 0, 1, 1,
0.3449078, 0.3278309, 0.4495547, 0, 0, 0, 1, 1,
0.3449971, 0.3931074, 0.179247, 0, 0, 0, 1, 1,
0.3540969, -0.3574228, 0.622412, 0, 0, 0, 1, 1,
0.3557157, -2.012875, 1.480446, 0, 0, 0, 1, 1,
0.3575208, -0.7078899, 3.670938, 0, 0, 0, 1, 1,
0.3583626, 0.6711367, 0.7434877, 0, 0, 0, 1, 1,
0.3593995, 1.125358, -1.652994, 1, 1, 1, 1, 1,
0.3602196, 0.5447034, 0.2668492, 1, 1, 1, 1, 1,
0.3625617, 2.100198, 0.8127752, 1, 1, 1, 1, 1,
0.3670217, 0.3227225, 2.265741, 1, 1, 1, 1, 1,
0.370479, 2.39621, 0.18783, 1, 1, 1, 1, 1,
0.3798608, -0.09339663, 1.613224, 1, 1, 1, 1, 1,
0.384156, -0.9632625, 1.653968, 1, 1, 1, 1, 1,
0.3890981, 0.9055374, 2.03883, 1, 1, 1, 1, 1,
0.3917964, 1.008187, 0.2446364, 1, 1, 1, 1, 1,
0.3925101, -0.7704297, 2.899936, 1, 1, 1, 1, 1,
0.39259, 1.475188, 0.4567147, 1, 1, 1, 1, 1,
0.3928215, 0.9830767, 1.327853, 1, 1, 1, 1, 1,
0.3962095, 0.312543, 1.065638, 1, 1, 1, 1, 1,
0.3975236, 0.5839479, 0.5987586, 1, 1, 1, 1, 1,
0.3979783, 0.1114244, 0.6609609, 1, 1, 1, 1, 1,
0.4012828, 0.9815854, 0.9936298, 0, 0, 1, 1, 1,
0.4017658, 0.7389628, -0.5215791, 1, 0, 0, 1, 1,
0.4021321, -0.6674846, 2.312356, 1, 0, 0, 1, 1,
0.4032296, 0.6070542, 0.7768504, 1, 0, 0, 1, 1,
0.4151316, 0.2918499, 0.07465992, 1, 0, 0, 1, 1,
0.4169185, 1.197631, 3.030977, 1, 0, 0, 1, 1,
0.4171181, -0.5307286, 1.648879, 0, 0, 0, 1, 1,
0.4220932, -0.7122827, 2.861294, 0, 0, 0, 1, 1,
0.422485, 1.254059, -0.3460926, 0, 0, 0, 1, 1,
0.4250364, 0.9950075, -0.09917346, 0, 0, 0, 1, 1,
0.4269029, 0.1962406, 1.339664, 0, 0, 0, 1, 1,
0.4283105, 0.9548125, 0.06610831, 0, 0, 0, 1, 1,
0.4332797, 0.7779582, 0.6147789, 0, 0, 0, 1, 1,
0.435975, 0.1343564, 0.1481423, 1, 1, 1, 1, 1,
0.4406371, 1.269558, 0.4718076, 1, 1, 1, 1, 1,
0.4431628, -0.5302414, 2.288632, 1, 1, 1, 1, 1,
0.4474041, -1.505984, 1.861907, 1, 1, 1, 1, 1,
0.4478921, 0.1320272, 1.122947, 1, 1, 1, 1, 1,
0.4503226, 0.4792669, 1.788642, 1, 1, 1, 1, 1,
0.4568574, -0.0961758, 1.85141, 1, 1, 1, 1, 1,
0.459042, -0.5937961, 3.363045, 1, 1, 1, 1, 1,
0.4631919, 0.3913415, -0.6936278, 1, 1, 1, 1, 1,
0.4668316, 1.664715, -1.26155, 1, 1, 1, 1, 1,
0.4711909, -1.747949, 4.366068, 1, 1, 1, 1, 1,
0.4777888, -0.479177, 3.458451, 1, 1, 1, 1, 1,
0.4790114, -0.3103897, 2.190339, 1, 1, 1, 1, 1,
0.4841682, -0.9404991, 3.916092, 1, 1, 1, 1, 1,
0.4846566, -0.6217564, 2.551958, 1, 1, 1, 1, 1,
0.4857605, 0.8344482, -0.3837007, 0, 0, 1, 1, 1,
0.4864354, 1.486571, 1.089568, 1, 0, 0, 1, 1,
0.4876655, 2.774106, -0.4951658, 1, 0, 0, 1, 1,
0.4887369, 0.3359636, 1.055745, 1, 0, 0, 1, 1,
0.4892583, -0.9803114, 2.999633, 1, 0, 0, 1, 1,
0.4898531, -0.6529554, 3.742931, 1, 0, 0, 1, 1,
0.4913145, -1.700265, 3.729621, 0, 0, 0, 1, 1,
0.4945114, -0.1751829, 2.035968, 0, 0, 0, 1, 1,
0.4989482, -2.027043, 2.727612, 0, 0, 0, 1, 1,
0.5019931, 1.20408, 0.1793944, 0, 0, 0, 1, 1,
0.5056607, -0.8540236, 1.186122, 0, 0, 0, 1, 1,
0.5086571, 0.5777, 1.389164, 0, 0, 0, 1, 1,
0.5095342, -1.944722, 1.535915, 0, 0, 0, 1, 1,
0.5123304, 0.2100254, 0.6216128, 1, 1, 1, 1, 1,
0.5136939, -0.7310454, 0.706554, 1, 1, 1, 1, 1,
0.5145535, 0.5561325, -0.5882354, 1, 1, 1, 1, 1,
0.5162702, 0.1759795, 1.402084, 1, 1, 1, 1, 1,
0.5166474, 0.8041649, 1.538121, 1, 1, 1, 1, 1,
0.5169603, -0.5833698, 1.463281, 1, 1, 1, 1, 1,
0.527217, 1.41454, 1.298501, 1, 1, 1, 1, 1,
0.5285008, -2.356831, 3.197813, 1, 1, 1, 1, 1,
0.5309463, -0.2508293, 1.667559, 1, 1, 1, 1, 1,
0.532733, -0.2463187, 2.199883, 1, 1, 1, 1, 1,
0.5351908, 2.093341, 2.038714, 1, 1, 1, 1, 1,
0.5360889, 0.809109, 1.508752, 1, 1, 1, 1, 1,
0.5376394, 0.6968492, -0.145579, 1, 1, 1, 1, 1,
0.540101, -2.426984, 3.516402, 1, 1, 1, 1, 1,
0.5406842, -0.4715175, 3.372094, 1, 1, 1, 1, 1,
0.5451708, 2.702988, 0.3428277, 0, 0, 1, 1, 1,
0.5457119, -0.1134951, 2.116599, 1, 0, 0, 1, 1,
0.5459902, -0.1349825, 1.315318, 1, 0, 0, 1, 1,
0.5462519, -1.823579, 3.872101, 1, 0, 0, 1, 1,
0.5466339, -1.344045, 3.222051, 1, 0, 0, 1, 1,
0.5495177, -3.305995, 2.870533, 1, 0, 0, 1, 1,
0.5522988, -0.9289996, 3.112844, 0, 0, 0, 1, 1,
0.5571029, -0.2942924, 2.344913, 0, 0, 0, 1, 1,
0.5674223, -0.6165714, 3.363765, 0, 0, 0, 1, 1,
0.5756168, 2.1368, -0.8558469, 0, 0, 0, 1, 1,
0.575695, 0.5213709, 0.276892, 0, 0, 0, 1, 1,
0.5778232, -0.2942794, 2.636376, 0, 0, 0, 1, 1,
0.5808055, 1.776601, 1.226035, 0, 0, 0, 1, 1,
0.5810624, -1.832861, 2.605192, 1, 1, 1, 1, 1,
0.583274, -1.141186, 2.328527, 1, 1, 1, 1, 1,
0.5978889, 1.317165, -0.09245505, 1, 1, 1, 1, 1,
0.5995137, 0.5605408, 2.472432, 1, 1, 1, 1, 1,
0.6078995, 0.9985615, 1.559266, 1, 1, 1, 1, 1,
0.6084673, -0.166713, 2.484257, 1, 1, 1, 1, 1,
0.614687, 0.679781, 1.56722, 1, 1, 1, 1, 1,
0.6156662, 0.229417, 1.282073, 1, 1, 1, 1, 1,
0.6179332, -1.060383, 1.914643, 1, 1, 1, 1, 1,
0.6181778, -0.3358009, 2.42302, 1, 1, 1, 1, 1,
0.6189314, -0.06500687, -0.0396455, 1, 1, 1, 1, 1,
0.6257857, -0.8174477, 2.382357, 1, 1, 1, 1, 1,
0.6301947, 0.2723224, 1.482441, 1, 1, 1, 1, 1,
0.6321256, -1.00815, 1.47169, 1, 1, 1, 1, 1,
0.6322798, -1.078869, 3.579648, 1, 1, 1, 1, 1,
0.6347524, -0.0940518, 2.251327, 0, 0, 1, 1, 1,
0.6364588, -1.044809, 3.1947, 1, 0, 0, 1, 1,
0.6373632, -1.113859, 3.573959, 1, 0, 0, 1, 1,
0.6402004, -1.304339, 3.088612, 1, 0, 0, 1, 1,
0.6430609, -0.4198887, 2.26891, 1, 0, 0, 1, 1,
0.6462837, 0.0113124, 3.15176, 1, 0, 0, 1, 1,
0.6492927, 0.7080843, -0.8349407, 0, 0, 0, 1, 1,
0.6509692, -1.559121, 2.215489, 0, 0, 0, 1, 1,
0.6541128, -0.5392447, 2.277503, 0, 0, 0, 1, 1,
0.6572334, -1.665284, 3.004948, 0, 0, 0, 1, 1,
0.6609409, 0.9383649, 1.149616, 0, 0, 0, 1, 1,
0.6641626, 0.05487208, 1.838362, 0, 0, 0, 1, 1,
0.6659697, 0.7638478, -0.1405031, 0, 0, 0, 1, 1,
0.6679911, 0.5563303, -0.9985207, 1, 1, 1, 1, 1,
0.6695104, -0.9598862, 2.362565, 1, 1, 1, 1, 1,
0.6706327, 2.476575, -0.7916679, 1, 1, 1, 1, 1,
0.675164, -0.3404979, 1.422199, 1, 1, 1, 1, 1,
0.675656, 0.977678, -0.7613029, 1, 1, 1, 1, 1,
0.6763495, -1.517463, 3.691824, 1, 1, 1, 1, 1,
0.6793117, 0.6408798, 1.201288, 1, 1, 1, 1, 1,
0.6794813, -0.5927697, 1.282567, 1, 1, 1, 1, 1,
0.6804586, -0.08221673, 1.671592, 1, 1, 1, 1, 1,
0.6808192, -0.6796036, 2.535392, 1, 1, 1, 1, 1,
0.6840691, -2.358607, 1.988502, 1, 1, 1, 1, 1,
0.6938345, -0.7486854, 3.686783, 1, 1, 1, 1, 1,
0.6959034, -1.839723, 3.506086, 1, 1, 1, 1, 1,
0.7004744, 1.327511, 2.397173, 1, 1, 1, 1, 1,
0.7006903, -0.8851078, 2.806632, 1, 1, 1, 1, 1,
0.7037656, 0.3324748, -0.3115094, 0, 0, 1, 1, 1,
0.7052341, -0.8750907, 2.031428, 1, 0, 0, 1, 1,
0.7077107, 0.8279185, 1.052287, 1, 0, 0, 1, 1,
0.7165756, 0.4825427, 1.035201, 1, 0, 0, 1, 1,
0.718651, -2.544386, 3.007833, 1, 0, 0, 1, 1,
0.7229304, 1.712202, -0.5975189, 1, 0, 0, 1, 1,
0.7277579, 0.565066, 1.485797, 0, 0, 0, 1, 1,
0.7370342, 0.6314464, -1.429599, 0, 0, 0, 1, 1,
0.7505796, -0.2631885, 2.177319, 0, 0, 0, 1, 1,
0.7514929, 0.6327814, 1.254698, 0, 0, 0, 1, 1,
0.7519823, 1.082409, 0.192607, 0, 0, 0, 1, 1,
0.7553527, 0.5895487, -0.2059797, 0, 0, 0, 1, 1,
0.761207, 0.8471456, -1.67473, 0, 0, 0, 1, 1,
0.7642117, 0.4234129, 0.617726, 1, 1, 1, 1, 1,
0.7650758, 0.9033658, 1.996225, 1, 1, 1, 1, 1,
0.7705094, 1.630489, 0.953603, 1, 1, 1, 1, 1,
0.7732653, 1.287851, 0.606235, 1, 1, 1, 1, 1,
0.7736897, 0.6859102, -0.2872011, 1, 1, 1, 1, 1,
0.7812982, 0.7170292, -0.4013452, 1, 1, 1, 1, 1,
0.7835058, -1.521822, 4.20262, 1, 1, 1, 1, 1,
0.7859449, -0.760162, 2.897518, 1, 1, 1, 1, 1,
0.7926965, -2.317831, 2.215086, 1, 1, 1, 1, 1,
0.7932879, 0.2822185, 0.4156118, 1, 1, 1, 1, 1,
0.7966439, -0.0939151, -0.5720878, 1, 1, 1, 1, 1,
0.8010996, -0.3008181, 1.70886, 1, 1, 1, 1, 1,
0.8016437, -0.03659878, 2.046708, 1, 1, 1, 1, 1,
0.8065608, 1.684296, -1.415369, 1, 1, 1, 1, 1,
0.8099998, -0.6794891, 0.8454486, 1, 1, 1, 1, 1,
0.8136367, -0.4565088, 2.131065, 0, 0, 1, 1, 1,
0.8151808, -0.07419018, 1.641802, 1, 0, 0, 1, 1,
0.8177883, -0.01415349, 0.8763134, 1, 0, 0, 1, 1,
0.8260797, -1.025906, 1.971913, 1, 0, 0, 1, 1,
0.8277522, -1.66288, 3.750168, 1, 0, 0, 1, 1,
0.8361208, -0.3611785, 2.565721, 1, 0, 0, 1, 1,
0.8410798, -0.2160356, 0.1881476, 0, 0, 0, 1, 1,
0.8469035, 1.020515, -0.3026171, 0, 0, 0, 1, 1,
0.8493316, -1.199158, 2.861565, 0, 0, 0, 1, 1,
0.8493804, -0.166173, 1.161957, 0, 0, 0, 1, 1,
0.8519067, 1.01899, 2.186241, 0, 0, 0, 1, 1,
0.8597509, 0.8947387, 2.016345, 0, 0, 0, 1, 1,
0.8614654, 0.5482445, 0.6632053, 0, 0, 0, 1, 1,
0.8653277, -0.7583142, 1.98922, 1, 1, 1, 1, 1,
0.8739721, -0.4791354, 2.389299, 1, 1, 1, 1, 1,
0.8803476, -0.155817, 2.834319, 1, 1, 1, 1, 1,
0.8813964, -1.183438, 3.278254, 1, 1, 1, 1, 1,
0.8820512, -0.06621694, 1.998798, 1, 1, 1, 1, 1,
0.8851753, 0.07469101, 1.673106, 1, 1, 1, 1, 1,
0.8895119, -0.008772391, 1.363113, 1, 1, 1, 1, 1,
0.891203, 0.1268248, 1.633704, 1, 1, 1, 1, 1,
0.9005393, 0.9556733, 0.8124599, 1, 1, 1, 1, 1,
0.9028668, 1.865598, 0.3099492, 1, 1, 1, 1, 1,
0.9029175, 0.911276, 1.387334, 1, 1, 1, 1, 1,
0.9201084, 1.48708, 1.214458, 1, 1, 1, 1, 1,
0.9259751, -0.2047797, 1.30042, 1, 1, 1, 1, 1,
0.930499, -1.316064, 2.637047, 1, 1, 1, 1, 1,
0.9328903, 0.3371585, -0.4546692, 1, 1, 1, 1, 1,
0.9389823, 0.3732891, 1.087039, 0, 0, 1, 1, 1,
0.9439201, -1.445639, 3.922522, 1, 0, 0, 1, 1,
0.9454675, -1.460366, 1.395509, 1, 0, 0, 1, 1,
0.9581402, -0.04212136, 1.214592, 1, 0, 0, 1, 1,
0.9595319, 0.379491, 1.09804, 1, 0, 0, 1, 1,
0.9645692, 0.2426179, 1.6335, 1, 0, 0, 1, 1,
0.9685095, -0.05363402, 2.035894, 0, 0, 0, 1, 1,
0.9705957, -1.26903, 1.959021, 0, 0, 0, 1, 1,
0.9797959, 0.06148127, 1.606384, 0, 0, 0, 1, 1,
0.9936789, 0.1698987, 1.562935, 0, 0, 0, 1, 1,
0.9946154, 0.3692641, 0.8978154, 0, 0, 0, 1, 1,
1.00271, 1.193023, 0.2674035, 0, 0, 0, 1, 1,
1.006285, 0.7505526, 0.7860468, 0, 0, 0, 1, 1,
1.012766, 1.026067, 1.722778, 1, 1, 1, 1, 1,
1.027918, 0.5184118, 1.411679, 1, 1, 1, 1, 1,
1.036939, 1.353249, 1.500665, 1, 1, 1, 1, 1,
1.038144, 1.115497, 1.652627, 1, 1, 1, 1, 1,
1.040257, -1.298554, 1.214073, 1, 1, 1, 1, 1,
1.046413, 1.238002, 2.616069, 1, 1, 1, 1, 1,
1.0474, 1.315018, 0.8130392, 1, 1, 1, 1, 1,
1.048477, -0.313998, 2.832856, 1, 1, 1, 1, 1,
1.048909, -0.4549004, 1.675712, 1, 1, 1, 1, 1,
1.053009, 0.1349807, 1.829655, 1, 1, 1, 1, 1,
1.053161, -0.8176747, 1.509057, 1, 1, 1, 1, 1,
1.057379, -0.3222303, 1.963738, 1, 1, 1, 1, 1,
1.060209, -0.7468387, 2.991148, 1, 1, 1, 1, 1,
1.060303, 0.9761651, 0.7555572, 1, 1, 1, 1, 1,
1.073179, 1.315641, -0.3209109, 1, 1, 1, 1, 1,
1.074738, -0.5334589, 0.4763117, 0, 0, 1, 1, 1,
1.076745, -0.7604355, 2.796329, 1, 0, 0, 1, 1,
1.083481, -0.6389344, 2.511528, 1, 0, 0, 1, 1,
1.08656, 0.6343341, 1.489079, 1, 0, 0, 1, 1,
1.091084, 1.26398, -0.331584, 1, 0, 0, 1, 1,
1.094633, -0.6742588, 2.614382, 1, 0, 0, 1, 1,
1.094695, 0.4906891, 2.312587, 0, 0, 0, 1, 1,
1.097136, 0.539766, -0.2120712, 0, 0, 0, 1, 1,
1.098264, -0.9695877, 3.277922, 0, 0, 0, 1, 1,
1.099216, -0.4077109, 1.513303, 0, 0, 0, 1, 1,
1.102761, -2.501297, 2.962512, 0, 0, 0, 1, 1,
1.105743, -0.2000807, 2.310518, 0, 0, 0, 1, 1,
1.106481, 1.317354, -1.210687, 0, 0, 0, 1, 1,
1.109829, -0.2577492, 2.610438, 1, 1, 1, 1, 1,
1.111893, 0.2096478, 1.740037, 1, 1, 1, 1, 1,
1.122029, 0.4571434, 3.921621, 1, 1, 1, 1, 1,
1.127484, -0.2693755, 2.716361, 1, 1, 1, 1, 1,
1.131666, 2.404396, -1.056317, 1, 1, 1, 1, 1,
1.131915, 0.6442379, 0.1380847, 1, 1, 1, 1, 1,
1.136227, 0.3271141, -0.3658255, 1, 1, 1, 1, 1,
1.149015, -1.515541, 2.441235, 1, 1, 1, 1, 1,
1.1593, -0.7358015, 1.453148, 1, 1, 1, 1, 1,
1.160299, 1.216557, -0.2427983, 1, 1, 1, 1, 1,
1.161293, -0.492381, 2.488275, 1, 1, 1, 1, 1,
1.162707, -0.3073387, 0.9902913, 1, 1, 1, 1, 1,
1.170351, 0.9714706, 1.81344, 1, 1, 1, 1, 1,
1.174545, -0.6810622, 1.076824, 1, 1, 1, 1, 1,
1.181272, -1.179277, 3.216309, 1, 1, 1, 1, 1,
1.181767, -1.168888, 2.341542, 0, 0, 1, 1, 1,
1.182514, -0.3551942, 2.780931, 1, 0, 0, 1, 1,
1.182988, 1.400738, 2.529876, 1, 0, 0, 1, 1,
1.187379, 0.3483221, 1.64066, 1, 0, 0, 1, 1,
1.189237, -0.7025995, 0.8086113, 1, 0, 0, 1, 1,
1.191224, 0.1371626, 2.623023, 1, 0, 0, 1, 1,
1.198903, 2.330757, 1.220083, 0, 0, 0, 1, 1,
1.200024, 0.5662559, 0.1281503, 0, 0, 0, 1, 1,
1.200106, 0.607308, -0.03089332, 0, 0, 0, 1, 1,
1.204532, 0.8975891, 2.974109, 0, 0, 0, 1, 1,
1.214643, -0.8092469, 1.362602, 0, 0, 0, 1, 1,
1.21503, -0.2661929, 1.850246, 0, 0, 0, 1, 1,
1.215655, -1.937105, 2.575537, 0, 0, 0, 1, 1,
1.218606, -0.8925693, 1.567225, 1, 1, 1, 1, 1,
1.21943, 1.036507, 0.7925609, 1, 1, 1, 1, 1,
1.235763, -0.5095446, 1.778127, 1, 1, 1, 1, 1,
1.24312, 1.017689, 0.9866129, 1, 1, 1, 1, 1,
1.243208, -0.1382213, 1.028549, 1, 1, 1, 1, 1,
1.24332, 0.9488199, 1.370451, 1, 1, 1, 1, 1,
1.255169, -0.9303702, 1.784059, 1, 1, 1, 1, 1,
1.269064, -1.374472, 2.437883, 1, 1, 1, 1, 1,
1.277886, -0.8014961, 1.351684, 1, 1, 1, 1, 1,
1.285345, -1.467675, 2.409784, 1, 1, 1, 1, 1,
1.286397, -0.9308704, 2.581425, 1, 1, 1, 1, 1,
1.288725, -0.2711923, 1.540384, 1, 1, 1, 1, 1,
1.296578, 0.1807894, 2.214947, 1, 1, 1, 1, 1,
1.307996, -0.4775282, 2.881548, 1, 1, 1, 1, 1,
1.308429, -0.7212784, 3.295903, 1, 1, 1, 1, 1,
1.311744, 1.575607, 1.371447, 0, 0, 1, 1, 1,
1.318356, -0.8806005, 2.998141, 1, 0, 0, 1, 1,
1.330203, -0.1307281, 2.33164, 1, 0, 0, 1, 1,
1.330574, 0.5307885, 1.824212, 1, 0, 0, 1, 1,
1.335705, 0.2563414, 3.028055, 1, 0, 0, 1, 1,
1.357998, 1.009601, 1.037368, 1, 0, 0, 1, 1,
1.359391, -0.9499217, 4.210688, 0, 0, 0, 1, 1,
1.368316, -0.8915649, 2.222013, 0, 0, 0, 1, 1,
1.387975, -0.5942933, 2.728459, 0, 0, 0, 1, 1,
1.388764, 1.174351, 1.553139, 0, 0, 0, 1, 1,
1.39391, -1.326775, 3.941911, 0, 0, 0, 1, 1,
1.394904, 1.498332, 0.6044587, 0, 0, 0, 1, 1,
1.399026, 0.02460865, 2.249236, 0, 0, 0, 1, 1,
1.399568, 0.4587446, 0.1146071, 1, 1, 1, 1, 1,
1.399568, -0.2576121, 1.015206, 1, 1, 1, 1, 1,
1.403775, -0.7409599, 2.397719, 1, 1, 1, 1, 1,
1.405802, 0.5731096, -0.2633702, 1, 1, 1, 1, 1,
1.406642, -0.3628245, 1.485948, 1, 1, 1, 1, 1,
1.410028, -1.985027, 1.078063, 1, 1, 1, 1, 1,
1.414063, 0.30387, 0.7767786, 1, 1, 1, 1, 1,
1.414653, 0.04469004, 1.936797, 1, 1, 1, 1, 1,
1.415729, -0.652841, 1.887601, 1, 1, 1, 1, 1,
1.415933, -0.3966911, 1.761135, 1, 1, 1, 1, 1,
1.41743, -0.9512327, 1.817864, 1, 1, 1, 1, 1,
1.420099, -0.1794094, 2.797012, 1, 1, 1, 1, 1,
1.431189, -1.040488, 2.447111, 1, 1, 1, 1, 1,
1.43245, -0.8095466, 1.302014, 1, 1, 1, 1, 1,
1.441084, -1.497764, 2.827485, 1, 1, 1, 1, 1,
1.448313, -0.4503341, 1.674103, 0, 0, 1, 1, 1,
1.451687, 0.2440488, 1.301026, 1, 0, 0, 1, 1,
1.453756, -0.1323033, 1.299, 1, 0, 0, 1, 1,
1.468982, 1.477518, 1.592042, 1, 0, 0, 1, 1,
1.474087, -1.170724, 2.093338, 1, 0, 0, 1, 1,
1.476602, 0.561434, 0.5318716, 1, 0, 0, 1, 1,
1.489113, -0.3687417, 1.945649, 0, 0, 0, 1, 1,
1.491001, 0.08989559, 1.3937, 0, 0, 0, 1, 1,
1.500596, 0.9430876, 0.5549638, 0, 0, 0, 1, 1,
1.504623, 1.219848, 0.894105, 0, 0, 0, 1, 1,
1.506086, 0.9820301, 0.6836721, 0, 0, 0, 1, 1,
1.545881, -0.2302518, 0.2184253, 0, 0, 0, 1, 1,
1.556696, 0.883016, 0.6641018, 0, 0, 0, 1, 1,
1.558119, -0.8645182, 2.259933, 1, 1, 1, 1, 1,
1.575088, -2.656947, 3.13664, 1, 1, 1, 1, 1,
1.581475, -1.041341, 2.492723, 1, 1, 1, 1, 1,
1.627651, -0.6175597, 1.802094, 1, 1, 1, 1, 1,
1.644083, 0.3466401, 2.948473, 1, 1, 1, 1, 1,
1.664108, -0.03009662, 2.631795, 1, 1, 1, 1, 1,
1.668096, -0.8905981, 3.068846, 1, 1, 1, 1, 1,
1.676695, 0.9850444, 1.396095, 1, 1, 1, 1, 1,
1.686416, 1.028446, 2.336086, 1, 1, 1, 1, 1,
1.69643, 0.784151, 1.058473, 1, 1, 1, 1, 1,
1.709083, 1.972816, 1.493041, 1, 1, 1, 1, 1,
1.711299, -0.1813613, 1.745566, 1, 1, 1, 1, 1,
1.713559, 1.497167, 0.511244, 1, 1, 1, 1, 1,
1.731684, -1.08969, 3.220939, 1, 1, 1, 1, 1,
1.733685, -0.7756722, 0.8777008, 1, 1, 1, 1, 1,
1.736675, -1.226442, 4.146229, 0, 0, 1, 1, 1,
1.738021, 0.840039, 2.403679, 1, 0, 0, 1, 1,
1.751964, 1.067387, -1.512395, 1, 0, 0, 1, 1,
1.752691, 0.05102243, 2.894312, 1, 0, 0, 1, 1,
1.759365, -1.142633, 2.543959, 1, 0, 0, 1, 1,
1.762253, 0.8621995, 1.665768, 1, 0, 0, 1, 1,
1.800385, 1.559306, 0.8839394, 0, 0, 0, 1, 1,
1.815299, 0.8728438, 1.61308, 0, 0, 0, 1, 1,
1.842717, -0.0008702285, 1.430207, 0, 0, 0, 1, 1,
1.857682, 0.560187, 1.517165, 0, 0, 0, 1, 1,
1.859569, -1.094756, 0.6609287, 0, 0, 0, 1, 1,
1.895816, -0.2578206, 2.800408, 0, 0, 0, 1, 1,
1.897944, -0.4269615, 1.49319, 0, 0, 0, 1, 1,
1.936338, -0.5526555, 1.157207, 1, 1, 1, 1, 1,
1.974449, 0.5919884, 1.554127, 1, 1, 1, 1, 1,
1.976565, 0.1045978, 0.9850873, 1, 1, 1, 1, 1,
1.986236, 0.5051584, 1.2818, 1, 1, 1, 1, 1,
2.006989, -0.2581543, 1.308467, 1, 1, 1, 1, 1,
2.019288, -0.3064151, 2.201023, 1, 1, 1, 1, 1,
2.049301, -1.742031, 2.181032, 1, 1, 1, 1, 1,
2.051601, -0.3875321, 3.488936, 1, 1, 1, 1, 1,
2.055626, 0.2689505, 1.816952, 1, 1, 1, 1, 1,
2.066637, 1.86683, 0.0002045365, 1, 1, 1, 1, 1,
2.081182, -1.875361, 2.297778, 1, 1, 1, 1, 1,
2.091607, 0.1723297, 1.756917, 1, 1, 1, 1, 1,
2.11424, -1.106683, 4.796702, 1, 1, 1, 1, 1,
2.131978, -0.9488926, 3.05826, 1, 1, 1, 1, 1,
2.176086, 0.1219183, 1.489871, 1, 1, 1, 1, 1,
2.181105, 0.8577399, 0.3544086, 0, 0, 1, 1, 1,
2.181213, 1.330909, 1.653578, 1, 0, 0, 1, 1,
2.210875, -0.1781089, 2.150481, 1, 0, 0, 1, 1,
2.214085, 1.513732, 0.9119202, 1, 0, 0, 1, 1,
2.24039, 0.01937882, 2.383293, 1, 0, 0, 1, 1,
2.294575, 0.5822508, 1.06678, 1, 0, 0, 1, 1,
2.295224, -1.648713, 2.573938, 0, 0, 0, 1, 1,
2.362597, 0.7398359, 0.8439716, 0, 0, 0, 1, 1,
2.397517, -1.313477, 0.7962131, 0, 0, 0, 1, 1,
2.518954, -0.6957142, 3.083503, 0, 0, 0, 1, 1,
2.523417, 1.051281, 3.09243, 0, 0, 0, 1, 1,
2.529973, -0.354968, 1.163233, 0, 0, 0, 1, 1,
2.609478, 0.02207643, 2.583672, 0, 0, 0, 1, 1,
2.62301, -0.6885151, 2.024786, 1, 1, 1, 1, 1,
2.671428, 0.6050982, 2.460732, 1, 1, 1, 1, 1,
2.755455, -0.02808159, -0.4674353, 1, 1, 1, 1, 1,
2.949075, 0.6600145, 1.32374, 1, 1, 1, 1, 1,
3.102547, -0.3763114, 0.7749854, 1, 1, 1, 1, 1,
3.613166, -0.795262, 1.497567, 1, 1, 1, 1, 1,
3.646997, -0.3227819, 2.422465, 1, 1, 1, 1, 1
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
var radius = 9.598624;
var distance = 33.71476;
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
mvMatrix.translate( -0.2261984, -0.013623, 0.1089718 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71476);
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
