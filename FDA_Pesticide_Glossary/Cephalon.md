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
-3.459351, -0.2508043, -2.744656, 1, 0, 0, 1,
-3.45425, -0.584568, -2.430758, 1, 0.007843138, 0, 1,
-3.080552, 0.6063787, -0.5801125, 1, 0.01176471, 0, 1,
-2.884199, -1.456015, -2.18277, 1, 0.01960784, 0, 1,
-2.772784, -0.2441854, -0.2163519, 1, 0.02352941, 0, 1,
-2.770365, -0.5802835, -1.719951, 1, 0.03137255, 0, 1,
-2.669825, -0.5308667, -2.141561, 1, 0.03529412, 0, 1,
-2.524733, 0.5946493, -1.472925, 1, 0.04313726, 0, 1,
-2.51594, -1.051007, -2.222067, 1, 0.04705882, 0, 1,
-2.509027, -2.699592, -0.2860875, 1, 0.05490196, 0, 1,
-2.507252, -1.363571, -2.948367, 1, 0.05882353, 0, 1,
-2.252199, -0.4238972, -3.859066, 1, 0.06666667, 0, 1,
-2.183391, -0.2295043, -1.948339, 1, 0.07058824, 0, 1,
-2.09319, -1.325407, -2.53142, 1, 0.07843138, 0, 1,
-2.077933, -1.189038, -1.100553, 1, 0.08235294, 0, 1,
-2.064686, 0.8947369, -2.302113, 1, 0.09019608, 0, 1,
-2.062837, 0.7745928, -1.85633, 1, 0.09411765, 0, 1,
-2.052266, -0.2526805, -2.69662, 1, 0.1019608, 0, 1,
-2.018374, 0.1826233, -1.318842, 1, 0.1098039, 0, 1,
-1.945055, -1.170119, -0.5178427, 1, 0.1137255, 0, 1,
-1.943744, -0.05591119, -2.120755, 1, 0.1215686, 0, 1,
-1.934094, 1.647289, 0.4443913, 1, 0.1254902, 0, 1,
-1.92395, 2.034539, -2.045999, 1, 0.1333333, 0, 1,
-1.914961, 1.924867, -0.4729225, 1, 0.1372549, 0, 1,
-1.888283, 0.3897644, -0.7462113, 1, 0.145098, 0, 1,
-1.885133, -0.1003103, -1.910977, 1, 0.1490196, 0, 1,
-1.857264, -0.2913859, 0.08809424, 1, 0.1568628, 0, 1,
-1.848871, 0.4079594, -0.9122632, 1, 0.1607843, 0, 1,
-1.847524, -0.4711137, -2.95314, 1, 0.1686275, 0, 1,
-1.844931, -0.06695136, -0.2395664, 1, 0.172549, 0, 1,
-1.838464, -0.8643219, -1.952507, 1, 0.1803922, 0, 1,
-1.837914, 0.04936559, -1.455426, 1, 0.1843137, 0, 1,
-1.831799, -1.998758, -2.215067, 1, 0.1921569, 0, 1,
-1.831369, -0.0285295, -0.6501898, 1, 0.1960784, 0, 1,
-1.827378, 1.936354, -0.2425281, 1, 0.2039216, 0, 1,
-1.826973, -0.1934147, -0.6462344, 1, 0.2117647, 0, 1,
-1.824983, -1.228349, 0.05602457, 1, 0.2156863, 0, 1,
-1.824478, -0.4816279, -2.170049, 1, 0.2235294, 0, 1,
-1.765364, 0.5953045, -0.07511817, 1, 0.227451, 0, 1,
-1.756085, -2.677954, -2.145831, 1, 0.2352941, 0, 1,
-1.751858, -1.290971, -1.808553, 1, 0.2392157, 0, 1,
-1.732443, 0.3135941, -3.251585, 1, 0.2470588, 0, 1,
-1.706397, 0.09908648, -1.033337, 1, 0.2509804, 0, 1,
-1.687863, 0.3869382, -0.6540059, 1, 0.2588235, 0, 1,
-1.686669, 0.463905, -0.9872437, 1, 0.2627451, 0, 1,
-1.682868, 0.9302357, -3.079071, 1, 0.2705882, 0, 1,
-1.678727, 0.3917294, 0.2896418, 1, 0.2745098, 0, 1,
-1.67826, -1.425482, -3.635499, 1, 0.282353, 0, 1,
-1.678222, -2.47045, -1.104517, 1, 0.2862745, 0, 1,
-1.674146, 0.3958493, -1.384976, 1, 0.2941177, 0, 1,
-1.671944, -0.1501925, -0.01148184, 1, 0.3019608, 0, 1,
-1.66571, 0.1643978, -1.480716, 1, 0.3058824, 0, 1,
-1.664955, -0.08688837, -1.902597, 1, 0.3137255, 0, 1,
-1.630298, 0.415786, -1.752298, 1, 0.3176471, 0, 1,
-1.627038, -1.884768, -3.990506, 1, 0.3254902, 0, 1,
-1.615689, 0.6980789, -0.3100984, 1, 0.3294118, 0, 1,
-1.598781, 1.398278, -2.662299, 1, 0.3372549, 0, 1,
-1.596729, 0.04548914, -3.245845, 1, 0.3411765, 0, 1,
-1.58797, -0.08380838, -1.44777, 1, 0.3490196, 0, 1,
-1.584135, 1.065509, -2.130096, 1, 0.3529412, 0, 1,
-1.576398, 0.3003536, -2.096078, 1, 0.3607843, 0, 1,
-1.566625, 0.2743838, -0.0116526, 1, 0.3647059, 0, 1,
-1.564376, -0.7611259, -3.339591, 1, 0.372549, 0, 1,
-1.557961, 0.3237618, -1.77777, 1, 0.3764706, 0, 1,
-1.555693, -0.5565494, -2.217279, 1, 0.3843137, 0, 1,
-1.55356, -0.8777881, -0.7213514, 1, 0.3882353, 0, 1,
-1.550623, -1.082169, -2.968212, 1, 0.3960784, 0, 1,
-1.546977, -1.194392, -1.813872, 1, 0.4039216, 0, 1,
-1.543841, 0.6378732, 0.2708134, 1, 0.4078431, 0, 1,
-1.539246, 0.4566077, -0.2546301, 1, 0.4156863, 0, 1,
-1.536512, 1.130932, -0.5338712, 1, 0.4196078, 0, 1,
-1.525078, -0.0259567, -1.752568, 1, 0.427451, 0, 1,
-1.508202, 0.6887636, -1.439503, 1, 0.4313726, 0, 1,
-1.50219, -1.564397, -1.597254, 1, 0.4392157, 0, 1,
-1.49972, 1.128536, -0.9308537, 1, 0.4431373, 0, 1,
-1.475355, -0.3850518, -1.751884, 1, 0.4509804, 0, 1,
-1.467965, 0.4854554, -1.701303, 1, 0.454902, 0, 1,
-1.462682, -0.9203655, -2.73082, 1, 0.4627451, 0, 1,
-1.441784, 1.033779, 1.163907, 1, 0.4666667, 0, 1,
-1.437021, 1.543239, -0.6489286, 1, 0.4745098, 0, 1,
-1.436278, 0.7978715, 0.5165673, 1, 0.4784314, 0, 1,
-1.42691, 0.8259298, -2.844051, 1, 0.4862745, 0, 1,
-1.426062, -0.8077089, -1.20617, 1, 0.4901961, 0, 1,
-1.423559, 0.2375192, -1.48, 1, 0.4980392, 0, 1,
-1.419586, -0.04262546, -1.221253, 1, 0.5058824, 0, 1,
-1.411958, -1.221429, -3.398491, 1, 0.509804, 0, 1,
-1.406747, -0.1575124, -2.196154, 1, 0.5176471, 0, 1,
-1.393415, -1.07296, -1.503108, 1, 0.5215687, 0, 1,
-1.391944, 1.955344, -0.767406, 1, 0.5294118, 0, 1,
-1.391794, -1.76764, -4.07036, 1, 0.5333334, 0, 1,
-1.379364, 0.9612644, 0.2764227, 1, 0.5411765, 0, 1,
-1.364226, -0.7478752, -3.156674, 1, 0.5450981, 0, 1,
-1.361517, -0.1382969, -0.9594631, 1, 0.5529412, 0, 1,
-1.348821, -0.9562139, -3.948059, 1, 0.5568628, 0, 1,
-1.339064, 0.1010229, -0.8893182, 1, 0.5647059, 0, 1,
-1.321466, 0.7083762, -0.5182062, 1, 0.5686275, 0, 1,
-1.305995, -0.3016981, -2.147934, 1, 0.5764706, 0, 1,
-1.299031, -0.2638861, 0.4757869, 1, 0.5803922, 0, 1,
-1.288149, -0.3858327, 0.005236457, 1, 0.5882353, 0, 1,
-1.281495, -0.1248318, -1.859613, 1, 0.5921569, 0, 1,
-1.271231, -0.3504449, -0.07662895, 1, 0.6, 0, 1,
-1.269486, -1.951134, -4.816895, 1, 0.6078432, 0, 1,
-1.263639, 0.7819417, -0.4974854, 1, 0.6117647, 0, 1,
-1.244266, -0.03156484, -1.114621, 1, 0.6196079, 0, 1,
-1.239946, 0.5564061, -1.265775, 1, 0.6235294, 0, 1,
-1.228707, 0.8694143, -0.01867147, 1, 0.6313726, 0, 1,
-1.21295, 0.1828664, -0.3951125, 1, 0.6352941, 0, 1,
-1.202589, 0.1758982, -1.8305, 1, 0.6431373, 0, 1,
-1.163593, -0.06213281, -1.661806, 1, 0.6470588, 0, 1,
-1.159243, 0.1716877, -1.038456, 1, 0.654902, 0, 1,
-1.155427, 1.30788, -0.5503191, 1, 0.6588235, 0, 1,
-1.154916, -1.611607, -3.974211, 1, 0.6666667, 0, 1,
-1.148422, 1.467179, -2.056648, 1, 0.6705883, 0, 1,
-1.146283, 1.085869, -2.401144, 1, 0.6784314, 0, 1,
-1.144778, -0.3599364, -2.640628, 1, 0.682353, 0, 1,
-1.142228, 0.2963109, -1.739119, 1, 0.6901961, 0, 1,
-1.139541, 1.402495, -0.4037865, 1, 0.6941177, 0, 1,
-1.123251, -0.9661598, -3.486975, 1, 0.7019608, 0, 1,
-1.121787, 0.1827107, 0.2488919, 1, 0.7098039, 0, 1,
-1.120558, -0.1784891, -1.177366, 1, 0.7137255, 0, 1,
-1.115114, 0.0301787, -1.661296, 1, 0.7215686, 0, 1,
-1.113575, 0.5352256, -1.827922, 1, 0.7254902, 0, 1,
-1.110647, 0.183366, -1.336465, 1, 0.7333333, 0, 1,
-1.109763, 1.161819, -1.026609, 1, 0.7372549, 0, 1,
-1.104096, 0.6182449, -0.03773465, 1, 0.7450981, 0, 1,
-1.097878, -0.4283251, -1.677831, 1, 0.7490196, 0, 1,
-1.097473, -0.5597144, -1.948379, 1, 0.7568628, 0, 1,
-1.09662, -0.3185896, -0.9707728, 1, 0.7607843, 0, 1,
-1.094385, -0.4137034, -2.769551, 1, 0.7686275, 0, 1,
-1.093911, 0.5355743, -1.753058, 1, 0.772549, 0, 1,
-1.073696, 1.750853, -0.3886324, 1, 0.7803922, 0, 1,
-1.073602, -0.3814706, -2.24905, 1, 0.7843137, 0, 1,
-1.073357, 2.128936, -0.5678552, 1, 0.7921569, 0, 1,
-1.065185, -0.2904602, -1.777552, 1, 0.7960784, 0, 1,
-1.062431, 0.001975673, -1.23646, 1, 0.8039216, 0, 1,
-1.05913, 0.8202335, -1.876227, 1, 0.8117647, 0, 1,
-1.058253, -0.7634186, -1.864236, 1, 0.8156863, 0, 1,
-1.046662, -0.1164611, -1.015767, 1, 0.8235294, 0, 1,
-1.031185, -0.2392594, -2.653284, 1, 0.827451, 0, 1,
-1.030734, 0.0880435, -2.651943, 1, 0.8352941, 0, 1,
-1.029278, -1.427086, -4.042226, 1, 0.8392157, 0, 1,
-1.029093, -0.20859, -0.480489, 1, 0.8470588, 0, 1,
-1.025642, 0.7056949, -1.739437, 1, 0.8509804, 0, 1,
-1.021087, 1.06761, 0.04316733, 1, 0.8588235, 0, 1,
-1.02039, 0.08495845, -0.5082603, 1, 0.8627451, 0, 1,
-1.017657, -0.9013342, -1.78159, 1, 0.8705882, 0, 1,
-1.000598, -0.05617218, 0.1288313, 1, 0.8745098, 0, 1,
-0.9991921, 0.5496877, -0.3143723, 1, 0.8823529, 0, 1,
-0.9987961, -0.3881428, -2.497472, 1, 0.8862745, 0, 1,
-0.9981364, -0.269237, -2.491752, 1, 0.8941177, 0, 1,
-0.9866118, -1.194304, -2.068733, 1, 0.8980392, 0, 1,
-0.9822099, -1.035432, -3.394493, 1, 0.9058824, 0, 1,
-0.9766049, 1.823023, -0.100994, 1, 0.9137255, 0, 1,
-0.9722629, 0.3127303, 0.9296409, 1, 0.9176471, 0, 1,
-0.9643965, 0.2664019, -1.018003, 1, 0.9254902, 0, 1,
-0.9623961, -0.9688983, -1.344785, 1, 0.9294118, 0, 1,
-0.9601632, 0.8600532, -1.881344, 1, 0.9372549, 0, 1,
-0.9584909, 2.232417, -1.108859, 1, 0.9411765, 0, 1,
-0.9520175, 0.07541066, -1.123144, 1, 0.9490196, 0, 1,
-0.9469775, 1.591739, -1.180653, 1, 0.9529412, 0, 1,
-0.9456784, 1.274907, -1.598778, 1, 0.9607843, 0, 1,
-0.9447061, -1.67168, -2.052374, 1, 0.9647059, 0, 1,
-0.9419608, -0.7614889, -2.126207, 1, 0.972549, 0, 1,
-0.9402287, 0.5821791, -0.5129246, 1, 0.9764706, 0, 1,
-0.9388051, -0.2617145, -0.4140488, 1, 0.9843137, 0, 1,
-0.9337654, -0.723257, -5.146433, 1, 0.9882353, 0, 1,
-0.9315554, 1.469105, -2.014798, 1, 0.9960784, 0, 1,
-0.9302945, 0.8414325, -1.413978, 0.9960784, 1, 0, 1,
-0.9297023, -0.3901333, -3.764053, 0.9921569, 1, 0, 1,
-0.9176475, 0.443739, -0.9124073, 0.9843137, 1, 0, 1,
-0.90827, 0.4623224, 0.295006, 0.9803922, 1, 0, 1,
-0.9067215, -2.285961, -0.9684218, 0.972549, 1, 0, 1,
-0.9037094, -1.289169, -1.802323, 0.9686275, 1, 0, 1,
-0.9025901, 0.06087646, -2.051143, 0.9607843, 1, 0, 1,
-0.8987508, -0.8301815, -2.084167, 0.9568627, 1, 0, 1,
-0.8819916, 0.5895122, 0.03030444, 0.9490196, 1, 0, 1,
-0.8776488, -0.110361, -2.29848, 0.945098, 1, 0, 1,
-0.8774676, 0.9468874, -0.5733163, 0.9372549, 1, 0, 1,
-0.8759962, -0.8489169, -2.772182, 0.9333333, 1, 0, 1,
-0.8742117, -1.889761, -4.225143, 0.9254902, 1, 0, 1,
-0.8731741, -0.1259047, -1.980419, 0.9215686, 1, 0, 1,
-0.872955, -1.73694, -2.969816, 0.9137255, 1, 0, 1,
-0.8710328, 0.7673529, -0.5064901, 0.9098039, 1, 0, 1,
-0.8656926, 0.1017742, 0.2207093, 0.9019608, 1, 0, 1,
-0.858411, -0.8558689, -2.781483, 0.8941177, 1, 0, 1,
-0.8550252, -1.040322, -2.383287, 0.8901961, 1, 0, 1,
-0.853976, -1.322578, -2.455453, 0.8823529, 1, 0, 1,
-0.853039, -0.6021415, -2.530589, 0.8784314, 1, 0, 1,
-0.8464907, -0.2264323, -0.1521128, 0.8705882, 1, 0, 1,
-0.8429102, -1.252266, -3.830153, 0.8666667, 1, 0, 1,
-0.8305212, -1.116831, -3.065372, 0.8588235, 1, 0, 1,
-0.8284782, 0.4013835, 0.09962467, 0.854902, 1, 0, 1,
-0.8278928, 0.2947832, -0.6916937, 0.8470588, 1, 0, 1,
-0.8273551, -0.622215, -2.710514, 0.8431373, 1, 0, 1,
-0.8246379, 0.8584948, -1.431198, 0.8352941, 1, 0, 1,
-0.8221044, 0.6366739, -1.392722, 0.8313726, 1, 0, 1,
-0.8220482, 0.4805864, -0.3248879, 0.8235294, 1, 0, 1,
-0.8152073, -0.4407072, -2.38155, 0.8196079, 1, 0, 1,
-0.8150649, 1.036775, -0.8375715, 0.8117647, 1, 0, 1,
-0.8145056, -1.102978, -2.958282, 0.8078431, 1, 0, 1,
-0.8022932, 0.1056909, -2.043053, 0.8, 1, 0, 1,
-0.801626, -2.701315, -3.084124, 0.7921569, 1, 0, 1,
-0.796469, -1.572887, -3.218242, 0.7882353, 1, 0, 1,
-0.7964522, -1.668058, -2.811268, 0.7803922, 1, 0, 1,
-0.7961037, -1.774337, -2.082663, 0.7764706, 1, 0, 1,
-0.7919492, 1.431098, -0.8072758, 0.7686275, 1, 0, 1,
-0.7912722, 0.3962983, -0.4279416, 0.7647059, 1, 0, 1,
-0.7894629, 0.3199694, -2.625328, 0.7568628, 1, 0, 1,
-0.7817452, -0.2721691, -1.513231, 0.7529412, 1, 0, 1,
-0.7717357, 0.2806118, -0.7036964, 0.7450981, 1, 0, 1,
-0.7687328, -1.420044, -2.70086, 0.7411765, 1, 0, 1,
-0.7582276, 0.1042771, -1.66144, 0.7333333, 1, 0, 1,
-0.7537176, 0.8726852, 0.7871106, 0.7294118, 1, 0, 1,
-0.7512621, 1.061631, -0.653833, 0.7215686, 1, 0, 1,
-0.747328, -2.520028, -3.23183, 0.7176471, 1, 0, 1,
-0.7423363, -0.01343493, -2.889948, 0.7098039, 1, 0, 1,
-0.7414843, -1.032058, -1.932129, 0.7058824, 1, 0, 1,
-0.7399708, 0.3120988, -0.1751441, 0.6980392, 1, 0, 1,
-0.7385429, 0.4043253, -2.064109, 0.6901961, 1, 0, 1,
-0.7370667, -0.8383546, -2.056613, 0.6862745, 1, 0, 1,
-0.7349187, -0.7487072, -1.194453, 0.6784314, 1, 0, 1,
-0.7289596, -0.1726623, -1.508773, 0.6745098, 1, 0, 1,
-0.7242987, -0.7229356, -2.306233, 0.6666667, 1, 0, 1,
-0.7198544, -1.797342, -1.559993, 0.6627451, 1, 0, 1,
-0.7176093, 0.406596, -1.744681, 0.654902, 1, 0, 1,
-0.7117688, 0.8204888, -2.309451, 0.6509804, 1, 0, 1,
-0.7071242, 1.083775, -0.4624285, 0.6431373, 1, 0, 1,
-0.702451, 0.08218613, -0.3764458, 0.6392157, 1, 0, 1,
-0.7016873, -1.186416, -2.912086, 0.6313726, 1, 0, 1,
-0.6996487, -0.7306682, -1.278253, 0.627451, 1, 0, 1,
-0.6949993, 0.4316992, -0.8979729, 0.6196079, 1, 0, 1,
-0.6884542, -0.9645479, -3.345256, 0.6156863, 1, 0, 1,
-0.6857492, -1.517321, -3.77723, 0.6078432, 1, 0, 1,
-0.6808697, -0.1032293, -0.6097342, 0.6039216, 1, 0, 1,
-0.680075, 0.3761507, -1.216454, 0.5960785, 1, 0, 1,
-0.6759036, -0.6455651, -2.106777, 0.5882353, 1, 0, 1,
-0.6752564, 2.168006, -1.82779, 0.5843138, 1, 0, 1,
-0.6726395, 0.2730242, -0.09690587, 0.5764706, 1, 0, 1,
-0.6660836, -0.922582, -2.770077, 0.572549, 1, 0, 1,
-0.6657837, 1.956897, -0.9996994, 0.5647059, 1, 0, 1,
-0.6611581, -0.894628, -2.435339, 0.5607843, 1, 0, 1,
-0.6554615, -0.6481705, -2.157131, 0.5529412, 1, 0, 1,
-0.6554171, -0.7536286, -1.342419, 0.5490196, 1, 0, 1,
-0.6532131, 0.3223299, -0.3975453, 0.5411765, 1, 0, 1,
-0.6517105, -0.3009063, -2.135672, 0.5372549, 1, 0, 1,
-0.6493482, 1.382186, 1.589857, 0.5294118, 1, 0, 1,
-0.6471319, 0.46762, -2.008215, 0.5254902, 1, 0, 1,
-0.6439056, -0.4632896, -2.019324, 0.5176471, 1, 0, 1,
-0.6422647, 1.574912, 1.30154, 0.5137255, 1, 0, 1,
-0.6422302, -1.042348, -4.607688, 0.5058824, 1, 0, 1,
-0.6419743, -0.4014756, -0.7269436, 0.5019608, 1, 0, 1,
-0.6375852, 1.243911, 0.2911365, 0.4941176, 1, 0, 1,
-0.6358714, -1.147579, -3.002238, 0.4862745, 1, 0, 1,
-0.6348212, 0.5372608, -0.8819517, 0.4823529, 1, 0, 1,
-0.6341096, 0.8106846, -1.619311, 0.4745098, 1, 0, 1,
-0.6340368, -0.9675257, -3.224813, 0.4705882, 1, 0, 1,
-0.6295325, 1.534952, 0.499509, 0.4627451, 1, 0, 1,
-0.6243158, -0.1546571, -1.54828, 0.4588235, 1, 0, 1,
-0.6217111, 0.040321, -1.248842, 0.4509804, 1, 0, 1,
-0.6205828, 0.1404086, -0.5015777, 0.4470588, 1, 0, 1,
-0.6130909, 0.332605, -2.027261, 0.4392157, 1, 0, 1,
-0.6124993, -0.1941162, -0.06259757, 0.4352941, 1, 0, 1,
-0.605204, 1.099267, -1.163922, 0.427451, 1, 0, 1,
-0.6026378, -0.3441184, -2.321942, 0.4235294, 1, 0, 1,
-0.6008657, -1.875026, -1.694556, 0.4156863, 1, 0, 1,
-0.596773, 0.02318281, -0.9331364, 0.4117647, 1, 0, 1,
-0.5955124, 1.63572, 0.04547272, 0.4039216, 1, 0, 1,
-0.5921907, 0.1887925, -2.567642, 0.3960784, 1, 0, 1,
-0.5883446, 0.579421, -2.342311, 0.3921569, 1, 0, 1,
-0.5866459, 1.251506, 0.1546773, 0.3843137, 1, 0, 1,
-0.5863554, 0.08166609, -1.797076, 0.3803922, 1, 0, 1,
-0.5856023, -0.7741281, -1.837093, 0.372549, 1, 0, 1,
-0.5785757, 1.173756, 0.6026712, 0.3686275, 1, 0, 1,
-0.5761546, 1.699443, 0.6548853, 0.3607843, 1, 0, 1,
-0.5753987, 1.35243, 1.301586, 0.3568628, 1, 0, 1,
-0.5728353, 2.473258, -0.5390468, 0.3490196, 1, 0, 1,
-0.5724836, 1.083785, -1.026266, 0.345098, 1, 0, 1,
-0.5715024, -1.139395, -3.12709, 0.3372549, 1, 0, 1,
-0.5705138, 1.034281, -0.4012524, 0.3333333, 1, 0, 1,
-0.5684102, -1.834947, -1.457347, 0.3254902, 1, 0, 1,
-0.5673498, 1.78278, 0.9636604, 0.3215686, 1, 0, 1,
-0.565889, -0.758563, -2.152868, 0.3137255, 1, 0, 1,
-0.5652371, -1.036021, -4.250753, 0.3098039, 1, 0, 1,
-0.5625764, -0.4743324, -1.964743, 0.3019608, 1, 0, 1,
-0.5593531, 0.1149942, -1.855897, 0.2941177, 1, 0, 1,
-0.5564767, -0.3758607, -0.5051663, 0.2901961, 1, 0, 1,
-0.5554818, -1.03358, -2.889323, 0.282353, 1, 0, 1,
-0.5514281, 0.4241132, -2.2236, 0.2784314, 1, 0, 1,
-0.5504308, 1.839905, -1.229234, 0.2705882, 1, 0, 1,
-0.5482076, 1.782394, 1.719839, 0.2666667, 1, 0, 1,
-0.5454413, 0.7849202, -1.385264, 0.2588235, 1, 0, 1,
-0.5427839, 0.4000057, -0.448706, 0.254902, 1, 0, 1,
-0.5418521, -0.1751607, -1.957636, 0.2470588, 1, 0, 1,
-0.5377674, 0.7053994, -0.7869532, 0.2431373, 1, 0, 1,
-0.5337307, -0.9359388, -2.589191, 0.2352941, 1, 0, 1,
-0.5305073, 0.01846836, -2.685718, 0.2313726, 1, 0, 1,
-0.5266446, -0.9453437, -4.532016, 0.2235294, 1, 0, 1,
-0.5180958, 0.08591951, -0.5701095, 0.2196078, 1, 0, 1,
-0.5147433, -1.66515, -0.752134, 0.2117647, 1, 0, 1,
-0.5136113, 0.931592, -1.116103, 0.2078431, 1, 0, 1,
-0.513508, 0.6756538, -0.481438, 0.2, 1, 0, 1,
-0.4972423, 1.197434, -0.8074066, 0.1921569, 1, 0, 1,
-0.4884833, 0.3012037, 0.002026448, 0.1882353, 1, 0, 1,
-0.4879557, -1.588849, -2.095257, 0.1803922, 1, 0, 1,
-0.4843776, -0.4717675, -0.8549735, 0.1764706, 1, 0, 1,
-0.483252, 1.298832, 0.1765539, 0.1686275, 1, 0, 1,
-0.4823607, 0.9195395, 0.1182741, 0.1647059, 1, 0, 1,
-0.4673247, -0.4082308, -0.08419725, 0.1568628, 1, 0, 1,
-0.4640181, 2.062484, -0.6069158, 0.1529412, 1, 0, 1,
-0.4587979, -1.836926, -1.546395, 0.145098, 1, 0, 1,
-0.4584769, 1.265857, 0.6794201, 0.1411765, 1, 0, 1,
-0.4583652, 0.3058048, -1.701743, 0.1333333, 1, 0, 1,
-0.4583201, 0.7128694, -0.5122749, 0.1294118, 1, 0, 1,
-0.4578868, 0.784246, -1.259175, 0.1215686, 1, 0, 1,
-0.4558882, 0.4469948, -1.023094, 0.1176471, 1, 0, 1,
-0.4484921, -0.653177, -1.424791, 0.1098039, 1, 0, 1,
-0.4453648, -2.291178, -2.945967, 0.1058824, 1, 0, 1,
-0.4406276, 0.5332026, -1.752009, 0.09803922, 1, 0, 1,
-0.4391166, -0.7918895, -3.981249, 0.09019608, 1, 0, 1,
-0.4386208, 0.8867353, -0.4190671, 0.08627451, 1, 0, 1,
-0.4375772, -1.9677, -1.143515, 0.07843138, 1, 0, 1,
-0.4355997, -0.7084333, -1.227835, 0.07450981, 1, 0, 1,
-0.427159, -0.2428951, -1.992736, 0.06666667, 1, 0, 1,
-0.4264042, 0.7670308, 1.705833, 0.0627451, 1, 0, 1,
-0.4241061, -0.9090523, -0.9537063, 0.05490196, 1, 0, 1,
-0.4235713, 1.421616, -1.576634, 0.05098039, 1, 0, 1,
-0.4194842, 2.194566, -0.9274581, 0.04313726, 1, 0, 1,
-0.4174101, -0.7774361, -1.913247, 0.03921569, 1, 0, 1,
-0.4135195, 0.5585837, 0.6376346, 0.03137255, 1, 0, 1,
-0.4116659, 0.08531157, -0.7355943, 0.02745098, 1, 0, 1,
-0.4092156, 0.1388254, -2.161139, 0.01960784, 1, 0, 1,
-0.4090633, 0.1364483, -2.047526, 0.01568628, 1, 0, 1,
-0.4080935, -0.8453717, -3.971942, 0.007843138, 1, 0, 1,
-0.4076188, -0.1068361, -0.8747491, 0.003921569, 1, 0, 1,
-0.4064398, 0.7554228, -1.2983, 0, 1, 0.003921569, 1,
-0.405527, -2.361784, -3.478081, 0, 1, 0.01176471, 1,
-0.4047678, -1.199218, -4.01996, 0, 1, 0.01568628, 1,
-0.4001275, -0.4868258, -3.84525, 0, 1, 0.02352941, 1,
-0.3888704, -0.5122729, -1.809598, 0, 1, 0.02745098, 1,
-0.3847921, -0.4324905, -2.299154, 0, 1, 0.03529412, 1,
-0.3786818, 0.5445758, -0.6731071, 0, 1, 0.03921569, 1,
-0.3778894, 0.430927, -1.14328, 0, 1, 0.04705882, 1,
-0.365805, 0.2514999, -3.581477, 0, 1, 0.05098039, 1,
-0.3634472, 1.12967, 0.3443848, 0, 1, 0.05882353, 1,
-0.3634217, 0.1528454, -0.363014, 0, 1, 0.0627451, 1,
-0.361203, 0.2540313, -1.867711, 0, 1, 0.07058824, 1,
-0.3607103, -0.2705129, -0.3355468, 0, 1, 0.07450981, 1,
-0.3591258, 0.1681385, -2.773397, 0, 1, 0.08235294, 1,
-0.3552329, -0.4161343, -2.341113, 0, 1, 0.08627451, 1,
-0.3533452, -0.7393244, -4.272237, 0, 1, 0.09411765, 1,
-0.3523823, -0.1549675, -2.793608, 0, 1, 0.1019608, 1,
-0.3519462, -1.486697, -4.000209, 0, 1, 0.1058824, 1,
-0.3486433, 0.617509, -0.9672494, 0, 1, 0.1137255, 1,
-0.3465212, 0.3186962, -1.021566, 0, 1, 0.1176471, 1,
-0.346506, 0.5628479, -0.3305334, 0, 1, 0.1254902, 1,
-0.343704, 0.09714741, -1.853244, 0, 1, 0.1294118, 1,
-0.34021, -0.9728278, -2.809591, 0, 1, 0.1372549, 1,
-0.3375206, 0.9270374, 1.068503, 0, 1, 0.1411765, 1,
-0.3365167, -1.073891, -5.126348, 0, 1, 0.1490196, 1,
-0.3336505, -2.220483, -2.082737, 0, 1, 0.1529412, 1,
-0.3261542, 0.6543997, -1.393997, 0, 1, 0.1607843, 1,
-0.3222537, 0.1119256, -1.075255, 0, 1, 0.1647059, 1,
-0.3219206, -0.2904838, -2.939419, 0, 1, 0.172549, 1,
-0.3203929, -1.23114, -2.823097, 0, 1, 0.1764706, 1,
-0.3154122, 1.629027, -0.6592012, 0, 1, 0.1843137, 1,
-0.3129661, 0.1586295, 0.6065211, 0, 1, 0.1882353, 1,
-0.312803, -1.749235, -3.592439, 0, 1, 0.1960784, 1,
-0.3077521, 0.8566232, -0.1529264, 0, 1, 0.2039216, 1,
-0.2997278, -0.1910379, -2.433272, 0, 1, 0.2078431, 1,
-0.2973918, -0.4194708, -1.249661, 0, 1, 0.2156863, 1,
-0.2960315, -0.398804, -3.581227, 0, 1, 0.2196078, 1,
-0.295431, -1.514667, -1.875469, 0, 1, 0.227451, 1,
-0.2877926, -0.2845803, -1.271079, 0, 1, 0.2313726, 1,
-0.2821004, -0.8455794, -1.408791, 0, 1, 0.2392157, 1,
-0.2773718, -1.558885, -4.516153, 0, 1, 0.2431373, 1,
-0.2742138, -0.07269038, -0.6493943, 0, 1, 0.2509804, 1,
-0.2714057, -0.6137633, -1.827302, 0, 1, 0.254902, 1,
-0.2690462, -1.732961, -1.797848, 0, 1, 0.2627451, 1,
-0.2681537, -1.850277, -3.017776, 0, 1, 0.2666667, 1,
-0.2654604, 0.02347511, -1.850605, 0, 1, 0.2745098, 1,
-0.2618347, 0.1719559, -1.153882, 0, 1, 0.2784314, 1,
-0.2605207, -0.5029797, -3.013022, 0, 1, 0.2862745, 1,
-0.2557534, 0.08108103, -1.086897, 0, 1, 0.2901961, 1,
-0.2502203, -1.377736, -2.235065, 0, 1, 0.2980392, 1,
-0.2501585, -0.6681964, -3.387185, 0, 1, 0.3058824, 1,
-0.2482565, -0.5402735, -3.249171, 0, 1, 0.3098039, 1,
-0.2452333, 1.308581, -0.1023584, 0, 1, 0.3176471, 1,
-0.2440182, -0.9352669, -2.349861, 0, 1, 0.3215686, 1,
-0.2439902, -0.4028512, -2.651845, 0, 1, 0.3294118, 1,
-0.2349466, 1.561576, 1.585081, 0, 1, 0.3333333, 1,
-0.2343202, -1.101225, -2.022178, 0, 1, 0.3411765, 1,
-0.2321642, 0.9895594, -1.278212, 0, 1, 0.345098, 1,
-0.2297189, -0.3187473, -4.001279, 0, 1, 0.3529412, 1,
-0.2295104, -0.03526086, -1.070167, 0, 1, 0.3568628, 1,
-0.2261569, -0.5771682, -2.585376, 0, 1, 0.3647059, 1,
-0.2165399, 0.931493, 1.217399, 0, 1, 0.3686275, 1,
-0.215416, -1.146553, -2.428319, 0, 1, 0.3764706, 1,
-0.2153351, -0.4513236, -2.480037, 0, 1, 0.3803922, 1,
-0.2133589, 1.591054, -0.8215345, 0, 1, 0.3882353, 1,
-0.2087678, -0.8825607, -3.610196, 0, 1, 0.3921569, 1,
-0.2085567, -1.070067, -3.577812, 0, 1, 0.4, 1,
-0.2031015, -0.6138948, -3.016048, 0, 1, 0.4078431, 1,
-0.2023313, -1.397157, -2.924618, 0, 1, 0.4117647, 1,
-0.1984971, -1.263882, -2.504122, 0, 1, 0.4196078, 1,
-0.1981073, -0.9443941, -1.384585, 0, 1, 0.4235294, 1,
-0.1963554, -1.303196, -3.800895, 0, 1, 0.4313726, 1,
-0.1893478, 0.1471093, -1.730257, 0, 1, 0.4352941, 1,
-0.1869263, 0.05390076, -3.120929, 0, 1, 0.4431373, 1,
-0.1855214, -1.5652, -3.396995, 0, 1, 0.4470588, 1,
-0.1849294, -1.407126, -3.100065, 0, 1, 0.454902, 1,
-0.1819989, 0.2960282, -0.3693036, 0, 1, 0.4588235, 1,
-0.1760444, -0.7408705, -1.337776, 0, 1, 0.4666667, 1,
-0.1758947, 3.203513, -2.114839, 0, 1, 0.4705882, 1,
-0.1742326, -0.9325563, -3.670678, 0, 1, 0.4784314, 1,
-0.1685897, 0.4772817, 0.6710028, 0, 1, 0.4823529, 1,
-0.1662923, -0.47723, -2.558808, 0, 1, 0.4901961, 1,
-0.1658506, 0.3786458, -0.1234112, 0, 1, 0.4941176, 1,
-0.1651305, 0.1382259, -1.05485, 0, 1, 0.5019608, 1,
-0.1646964, 0.8779336, 0.9351279, 0, 1, 0.509804, 1,
-0.1582642, 0.4246283, 0.002624347, 0, 1, 0.5137255, 1,
-0.1523979, 0.2791987, -0.844891, 0, 1, 0.5215687, 1,
-0.1520977, 1.410075, -1.889845, 0, 1, 0.5254902, 1,
-0.1518755, 1.17221, 0.2303959, 0, 1, 0.5333334, 1,
-0.1449469, -2.144042, -3.483021, 0, 1, 0.5372549, 1,
-0.1358734, -1.182454, -2.7886, 0, 1, 0.5450981, 1,
-0.1280364, -0.1558528, -2.142119, 0, 1, 0.5490196, 1,
-0.1276365, 0.3453735, -0.7944652, 0, 1, 0.5568628, 1,
-0.1270886, -0.4534239, -1.999972, 0, 1, 0.5607843, 1,
-0.1263798, -0.3014749, -3.065979, 0, 1, 0.5686275, 1,
-0.1249365, 0.4102912, -0.07770016, 0, 1, 0.572549, 1,
-0.1223201, 1.092845, -0.6357671, 0, 1, 0.5803922, 1,
-0.1216802, 0.8414028, -0.5237073, 0, 1, 0.5843138, 1,
-0.1214693, 0.09930915, -2.777524, 0, 1, 0.5921569, 1,
-0.1209581, 1.611238, 1.009382, 0, 1, 0.5960785, 1,
-0.1152038, -0.0347774, -1.685312, 0, 1, 0.6039216, 1,
-0.1151007, 0.7611134, -1.232704, 0, 1, 0.6117647, 1,
-0.11507, -0.5488403, -1.627294, 0, 1, 0.6156863, 1,
-0.1145647, -0.8062325, -2.601337, 0, 1, 0.6235294, 1,
-0.1102457, -0.8405301, -4.262557, 0, 1, 0.627451, 1,
-0.1095196, -1.677304, -3.663083, 0, 1, 0.6352941, 1,
-0.1077733, -1.09606, -1.498316, 0, 1, 0.6392157, 1,
-0.1029757, 0.2542454, 0.9795741, 0, 1, 0.6470588, 1,
-0.102428, 0.8104461, -0.3625799, 0, 1, 0.6509804, 1,
-0.09407791, 0.3982944, 0.08553555, 0, 1, 0.6588235, 1,
-0.08879448, 0.9505054, -0.3184355, 0, 1, 0.6627451, 1,
-0.0864559, 0.3003154, -2.700386, 0, 1, 0.6705883, 1,
-0.08351607, 0.381253, -0.199244, 0, 1, 0.6745098, 1,
-0.08196457, 0.513888, -0.3240482, 0, 1, 0.682353, 1,
-0.0813913, 1.332873, 1.957667, 0, 1, 0.6862745, 1,
-0.07825074, 0.04302255, -0.9061025, 0, 1, 0.6941177, 1,
-0.07607523, -0.3264195, -3.701967, 0, 1, 0.7019608, 1,
-0.07606557, -0.8262755, -3.245069, 0, 1, 0.7058824, 1,
-0.07521059, 0.5333688, 0.5830712, 0, 1, 0.7137255, 1,
-0.07369638, 0.790431, 1.241731, 0, 1, 0.7176471, 1,
-0.07198028, -0.153124, -2.715779, 0, 1, 0.7254902, 1,
-0.06917299, 1.081219, 0.897884, 0, 1, 0.7294118, 1,
-0.06916969, -1.244341, -3.272715, 0, 1, 0.7372549, 1,
-0.06875324, 0.9492372, 0.4261813, 0, 1, 0.7411765, 1,
-0.05880059, 0.9401401, 1.025173, 0, 1, 0.7490196, 1,
-0.05600754, -0.2768698, -4.045099, 0, 1, 0.7529412, 1,
-0.05141281, -1.477538, -5.262341, 0, 1, 0.7607843, 1,
-0.05064161, 0.2240102, 0.02590986, 0, 1, 0.7647059, 1,
-0.04723949, -1.854781, -1.154652, 0, 1, 0.772549, 1,
-0.04411391, -0.6449637, -1.731549, 0, 1, 0.7764706, 1,
-0.04168038, -0.296989, -2.11279, 0, 1, 0.7843137, 1,
-0.03651404, 0.9385334, -1.082417, 0, 1, 0.7882353, 1,
-0.03645638, 0.07488937, 0.3473349, 0, 1, 0.7960784, 1,
-0.03628823, 0.3419487, 0.1528717, 0, 1, 0.8039216, 1,
-0.03533436, -1.603037, -3.727478, 0, 1, 0.8078431, 1,
-0.02667401, 1.256292, -2.281462, 0, 1, 0.8156863, 1,
-0.02588001, 0.1947039, 0.2563517, 0, 1, 0.8196079, 1,
-0.02579296, -0.7516248, -2.473084, 0, 1, 0.827451, 1,
-0.02065343, -1.135967, -0.5856215, 0, 1, 0.8313726, 1,
-0.01952143, -0.2944763, -3.461205, 0, 1, 0.8392157, 1,
-0.019231, -1.007702, -4.725566, 0, 1, 0.8431373, 1,
-0.01539867, 0.7422171, -0.06278726, 0, 1, 0.8509804, 1,
-0.01512822, 1.577397, 0.4198381, 0, 1, 0.854902, 1,
-0.01088729, -0.09419477, -3.075076, 0, 1, 0.8627451, 1,
-0.0088232, -1.217241, -3.37599, 0, 1, 0.8666667, 1,
-0.007016842, 1.520171, -0.4260414, 0, 1, 0.8745098, 1,
-0.003953953, 0.9090626, -0.5519475, 0, 1, 0.8784314, 1,
-0.001086702, 1.508294, -0.8852153, 0, 1, 0.8862745, 1,
0.004580575, -0.4020188, 0.5151461, 0, 1, 0.8901961, 1,
0.005505185, -0.4238166, 3.329812, 0, 1, 0.8980392, 1,
0.01096406, -1.746251, 3.695147, 0, 1, 0.9058824, 1,
0.01245621, 0.8116208, -0.4713169, 0, 1, 0.9098039, 1,
0.01275672, -0.4235848, 2.65031, 0, 1, 0.9176471, 1,
0.01281837, -0.400126, 5.445269, 0, 1, 0.9215686, 1,
0.01431791, -0.3607087, 3.54842, 0, 1, 0.9294118, 1,
0.01871893, 2.268097, -0.5877923, 0, 1, 0.9333333, 1,
0.01902203, -0.9756466, 4.199237, 0, 1, 0.9411765, 1,
0.01913377, 0.1576284, 1.09463, 0, 1, 0.945098, 1,
0.01976677, -0.08009472, 4.052699, 0, 1, 0.9529412, 1,
0.02337919, 0.849683, 0.7701691, 0, 1, 0.9568627, 1,
0.0242804, 1.012304, 0.004315902, 0, 1, 0.9647059, 1,
0.02508493, 1.163441, -0.7458819, 0, 1, 0.9686275, 1,
0.02634368, -1.251738, 2.217549, 0, 1, 0.9764706, 1,
0.02904618, -0.7104115, 2.352407, 0, 1, 0.9803922, 1,
0.03170778, -0.6273174, 4.331101, 0, 1, 0.9882353, 1,
0.03461531, 0.04773686, 1.691738, 0, 1, 0.9921569, 1,
0.03670418, 0.6935433, -0.3772531, 0, 1, 1, 1,
0.04032772, -1.411886, 3.029065, 0, 0.9921569, 1, 1,
0.05076822, 0.03828996, 1.105519, 0, 0.9882353, 1, 1,
0.05155119, -0.05818772, 2.610943, 0, 0.9803922, 1, 1,
0.05166229, 0.1709846, -0.6926607, 0, 0.9764706, 1, 1,
0.05282783, 0.6761908, 0.08328407, 0, 0.9686275, 1, 1,
0.05681705, -1.656523, 4.0813, 0, 0.9647059, 1, 1,
0.05698813, 1.096585, 1.906661, 0, 0.9568627, 1, 1,
0.05934537, -1.03293, 2.647832, 0, 0.9529412, 1, 1,
0.06262755, -2.132437, 2.33753, 0, 0.945098, 1, 1,
0.06411798, 1.374685, 0.4770465, 0, 0.9411765, 1, 1,
0.06490422, 0.1801884, -1.180719, 0, 0.9333333, 1, 1,
0.06554918, 0.4249777, 0.4020513, 0, 0.9294118, 1, 1,
0.06733223, -0.3345896, 3.355221, 0, 0.9215686, 1, 1,
0.0695193, -0.9417172, 3.569621, 0, 0.9176471, 1, 1,
0.07074279, -0.7506166, 2.341223, 0, 0.9098039, 1, 1,
0.07178994, 0.06510665, 2.007376, 0, 0.9058824, 1, 1,
0.0722719, 1.145691, -1.892733, 0, 0.8980392, 1, 1,
0.0733068, -0.3599541, 3.145333, 0, 0.8901961, 1, 1,
0.07981168, 0.9719732, 1.167198, 0, 0.8862745, 1, 1,
0.08097205, -0.362912, 3.117692, 0, 0.8784314, 1, 1,
0.08130161, 0.2139429, 1.683043, 0, 0.8745098, 1, 1,
0.08296578, -1.830437, 4.779119, 0, 0.8666667, 1, 1,
0.08469699, 0.7051212, -0.1962845, 0, 0.8627451, 1, 1,
0.08661374, 0.2501696, 0.4282532, 0, 0.854902, 1, 1,
0.08865274, -1.498904, 2.725043, 0, 0.8509804, 1, 1,
0.09241742, -1.532485, 3.861866, 0, 0.8431373, 1, 1,
0.0936266, 0.1525028, -1.392378, 0, 0.8392157, 1, 1,
0.09455211, -0.7611906, 1.582021, 0, 0.8313726, 1, 1,
0.09458385, -0.08730128, 4.362755, 0, 0.827451, 1, 1,
0.09552727, 1.592635, -1.347115, 0, 0.8196079, 1, 1,
0.09629257, 0.4117672, -1.275535, 0, 0.8156863, 1, 1,
0.1011204, -1.033669, 2.697512, 0, 0.8078431, 1, 1,
0.1011908, -0.2262413, 2.878094, 0, 0.8039216, 1, 1,
0.1028809, 0.8354681, 0.9602249, 0, 0.7960784, 1, 1,
0.1036714, 0.4471651, 1.517829, 0, 0.7882353, 1, 1,
0.1087408, 1.285029, -1.762591, 0, 0.7843137, 1, 1,
0.109333, -1.470586, 5.417055, 0, 0.7764706, 1, 1,
0.1110394, 0.2751219, 2.09577, 0, 0.772549, 1, 1,
0.1139301, 0.1990493, -0.09342627, 0, 0.7647059, 1, 1,
0.1141423, -0.914327, 2.460168, 0, 0.7607843, 1, 1,
0.1160047, -0.469779, 3.169351, 0, 0.7529412, 1, 1,
0.1188613, -0.4810595, 4.663138, 0, 0.7490196, 1, 1,
0.1195017, 1.509256, 1.004773, 0, 0.7411765, 1, 1,
0.1198982, 1.855137, 1.440349, 0, 0.7372549, 1, 1,
0.1223631, -0.779924, 2.298988, 0, 0.7294118, 1, 1,
0.1224846, 0.8648618, 0.08200274, 0, 0.7254902, 1, 1,
0.1245984, 1.671127, -0.01859923, 0, 0.7176471, 1, 1,
0.1271442, -0.836358, 2.529982, 0, 0.7137255, 1, 1,
0.1286891, -1.11735, 3.91684, 0, 0.7058824, 1, 1,
0.136802, -1.255148, 2.570102, 0, 0.6980392, 1, 1,
0.1442836, 1.994102, 1.414849, 0, 0.6941177, 1, 1,
0.1459583, -0.6192641, 2.602867, 0, 0.6862745, 1, 1,
0.1488242, 0.4187343, 0.9453824, 0, 0.682353, 1, 1,
0.1490474, 0.4142139, 1.062179, 0, 0.6745098, 1, 1,
0.1519564, 0.01689636, 0.5416726, 0, 0.6705883, 1, 1,
0.152489, 1.126572, 0.8921146, 0, 0.6627451, 1, 1,
0.1530256, -0.2507617, 2.401222, 0, 0.6588235, 1, 1,
0.1541059, -0.8922956, 2.590978, 0, 0.6509804, 1, 1,
0.1552279, 0.9020151, 0.3424744, 0, 0.6470588, 1, 1,
0.1552283, 0.728986, -0.173461, 0, 0.6392157, 1, 1,
0.1571844, -2.727324, 3.830151, 0, 0.6352941, 1, 1,
0.1619777, 3.484854, 1.056816, 0, 0.627451, 1, 1,
0.1622987, 1.148032, -1.138841, 0, 0.6235294, 1, 1,
0.1647965, 1.156456, 1.259902, 0, 0.6156863, 1, 1,
0.1662504, 0.6552255, -1.280952, 0, 0.6117647, 1, 1,
0.1670236, 0.02548212, 1.590626, 0, 0.6039216, 1, 1,
0.1678053, -0.2333886, 2.42594, 0, 0.5960785, 1, 1,
0.1761743, 0.7428377, 0.4026074, 0, 0.5921569, 1, 1,
0.1769883, 1.187214, -0.353705, 0, 0.5843138, 1, 1,
0.1796209, -1.710197, 1.452722, 0, 0.5803922, 1, 1,
0.1808394, -2.176682, 4.141784, 0, 0.572549, 1, 1,
0.1816311, 0.5662087, -0.1548595, 0, 0.5686275, 1, 1,
0.1850563, 0.2455065, 2.084593, 0, 0.5607843, 1, 1,
0.1850705, 0.3973703, -0.9657164, 0, 0.5568628, 1, 1,
0.1851116, 1.088749, 0.6444712, 0, 0.5490196, 1, 1,
0.1853359, -0.519159, 3.87199, 0, 0.5450981, 1, 1,
0.1857419, -0.0957965, 2.439294, 0, 0.5372549, 1, 1,
0.1878461, 2.095003, 0.5492175, 0, 0.5333334, 1, 1,
0.1896794, -0.8437353, 1.247605, 0, 0.5254902, 1, 1,
0.1903798, -1.099512, 4.360783, 0, 0.5215687, 1, 1,
0.1920189, 0.2633159, 1.308555, 0, 0.5137255, 1, 1,
0.1959934, 0.3782555, -0.09279248, 0, 0.509804, 1, 1,
0.1975795, -0.2153279, 1.373584, 0, 0.5019608, 1, 1,
0.1985462, -1.544192, 2.673039, 0, 0.4941176, 1, 1,
0.1986154, 0.3503706, -0.658432, 0, 0.4901961, 1, 1,
0.1994868, 0.6754291, -0.2410173, 0, 0.4823529, 1, 1,
0.2007141, -0.01377446, 2.466002, 0, 0.4784314, 1, 1,
0.2014927, -2.165756, 4.053948, 0, 0.4705882, 1, 1,
0.2015287, -0.2819952, 2.229129, 0, 0.4666667, 1, 1,
0.2072945, 0.2433766, 1.924215, 0, 0.4588235, 1, 1,
0.2100641, -0.328025, 4.097923, 0, 0.454902, 1, 1,
0.2118285, 0.5069289, 1.2397, 0, 0.4470588, 1, 1,
0.2140395, 1.38305, 0.6426786, 0, 0.4431373, 1, 1,
0.2202816, 0.9736812, 0.422241, 0, 0.4352941, 1, 1,
0.220615, -0.9334189, 3.769254, 0, 0.4313726, 1, 1,
0.2274437, 1.568223, -0.4484996, 0, 0.4235294, 1, 1,
0.2294916, 0.708757, 0.2191696, 0, 0.4196078, 1, 1,
0.2299003, 0.125363, 0.862472, 0, 0.4117647, 1, 1,
0.2299612, -0.1409102, 2.129568, 0, 0.4078431, 1, 1,
0.2351092, 0.05134198, 0.6764861, 0, 0.4, 1, 1,
0.2352927, 0.2562871, 1.625167, 0, 0.3921569, 1, 1,
0.2372012, 1.890768, 0.9776636, 0, 0.3882353, 1, 1,
0.2372877, -0.8777825, 2.575837, 0, 0.3803922, 1, 1,
0.2402041, -0.7166832, 2.984238, 0, 0.3764706, 1, 1,
0.2484406, 0.1660063, 0.2483819, 0, 0.3686275, 1, 1,
0.2493974, 1.148195, -0.4953034, 0, 0.3647059, 1, 1,
0.2505247, -0.9475381, 3.106058, 0, 0.3568628, 1, 1,
0.2533389, -0.7773623, 1.836866, 0, 0.3529412, 1, 1,
0.2538152, 0.4489783, 0.4511029, 0, 0.345098, 1, 1,
0.2622201, 0.7472331, 0.4288729, 0, 0.3411765, 1, 1,
0.2652044, 0.8403412, 1.464817, 0, 0.3333333, 1, 1,
0.2678588, 0.8004727, -0.2494023, 0, 0.3294118, 1, 1,
0.2678717, 0.5757871, -0.6481587, 0, 0.3215686, 1, 1,
0.2688816, 0.8850535, -0.2633118, 0, 0.3176471, 1, 1,
0.2707564, -0.1784528, 3.443966, 0, 0.3098039, 1, 1,
0.2715058, -1.978799, 2.771429, 0, 0.3058824, 1, 1,
0.2760442, -0.7407147, 2.958869, 0, 0.2980392, 1, 1,
0.2785665, -0.3419591, 2.109296, 0, 0.2901961, 1, 1,
0.2791029, -0.6314533, 2.19479, 0, 0.2862745, 1, 1,
0.283803, 0.02506559, -0.5534356, 0, 0.2784314, 1, 1,
0.2838603, -0.1040589, 2.999728, 0, 0.2745098, 1, 1,
0.284511, 2.464008, -0.831978, 0, 0.2666667, 1, 1,
0.285251, -1.301022, 3.731519, 0, 0.2627451, 1, 1,
0.2901847, -0.3550915, 3.53446, 0, 0.254902, 1, 1,
0.2904319, -1.004529, 3.134352, 0, 0.2509804, 1, 1,
0.2906285, -0.4520727, 1.778548, 0, 0.2431373, 1, 1,
0.2906455, -0.3546116, 2.669173, 0, 0.2392157, 1, 1,
0.2908, 0.5886246, -0.6405894, 0, 0.2313726, 1, 1,
0.2925017, -0.5433535, 3.159988, 0, 0.227451, 1, 1,
0.2958281, -0.1444177, 0.6552221, 0, 0.2196078, 1, 1,
0.298, 0.8632644, -0.1350863, 0, 0.2156863, 1, 1,
0.3041342, 1.870684, 0.01156538, 0, 0.2078431, 1, 1,
0.3095044, -1.251769, 1.083759, 0, 0.2039216, 1, 1,
0.3129213, -0.7877735, 3.178457, 0, 0.1960784, 1, 1,
0.3131762, -0.7166635, 3.999005, 0, 0.1882353, 1, 1,
0.3158321, -0.1709866, 3.127058, 0, 0.1843137, 1, 1,
0.3171817, 0.647352, -0.4461137, 0, 0.1764706, 1, 1,
0.3179156, 0.5153172, 1.451123, 0, 0.172549, 1, 1,
0.3248869, 1.072911, -0.9635767, 0, 0.1647059, 1, 1,
0.3261549, -1.468285, 4.231255, 0, 0.1607843, 1, 1,
0.3262835, 0.3354894, -0.7060083, 0, 0.1529412, 1, 1,
0.3306491, -0.4328125, 0.03208286, 0, 0.1490196, 1, 1,
0.3392234, -0.3726277, 2.654186, 0, 0.1411765, 1, 1,
0.3402991, -0.9660498, 3.597695, 0, 0.1372549, 1, 1,
0.3450435, 0.7787508, 0.01212399, 0, 0.1294118, 1, 1,
0.3452378, -0.1804141, 1.190892, 0, 0.1254902, 1, 1,
0.3455941, 1.607513, 0.1970296, 0, 0.1176471, 1, 1,
0.3477087, 1.084945, -0.1129314, 0, 0.1137255, 1, 1,
0.3481143, -0.2504191, 2.581595, 0, 0.1058824, 1, 1,
0.3491965, 0.2378344, 0.9355542, 0, 0.09803922, 1, 1,
0.3499299, 0.3838882, 0.4563791, 0, 0.09411765, 1, 1,
0.3520662, -1.041512, 4.531813, 0, 0.08627451, 1, 1,
0.3527785, 0.9511778, -0.2381589, 0, 0.08235294, 1, 1,
0.3592457, -0.5457001, 3.938086, 0, 0.07450981, 1, 1,
0.3641359, 1.207801, 0.2338054, 0, 0.07058824, 1, 1,
0.367037, -1.18954, 4.365498, 0, 0.0627451, 1, 1,
0.3698867, 0.4534729, 1.866114, 0, 0.05882353, 1, 1,
0.3728679, 0.138438, 0.4294089, 0, 0.05098039, 1, 1,
0.3833091, -0.112938, 1.981241, 0, 0.04705882, 1, 1,
0.38508, -1.259797, 1.671245, 0, 0.03921569, 1, 1,
0.3871453, 1.286551, 1.022432, 0, 0.03529412, 1, 1,
0.3876657, -0.3535277, 1.616775, 0, 0.02745098, 1, 1,
0.3896293, -0.461876, 2.205337, 0, 0.02352941, 1, 1,
0.3901703, 0.3725226, 1.446602, 0, 0.01568628, 1, 1,
0.3916306, -0.667824, 3.835063, 0, 0.01176471, 1, 1,
0.3926815, 1.466684, 0.5524285, 0, 0.003921569, 1, 1,
0.3942877, 2.45786, 0.1809075, 0.003921569, 0, 1, 1,
0.3953344, 0.2646722, 1.53641, 0.007843138, 0, 1, 1,
0.3965531, -0.3201261, 2.796751, 0.01568628, 0, 1, 1,
0.3971409, 0.2084387, 1.748459, 0.01960784, 0, 1, 1,
0.4056594, -1.367505, 1.536983, 0.02745098, 0, 1, 1,
0.41284, -1.118083, 2.75964, 0.03137255, 0, 1, 1,
0.4144255, 0.4209605, -0.3134509, 0.03921569, 0, 1, 1,
0.4151098, -1.267807, 2.272716, 0.04313726, 0, 1, 1,
0.4161258, -1.061989, 2.694555, 0.05098039, 0, 1, 1,
0.4203985, -0.8020453, 2.186411, 0.05490196, 0, 1, 1,
0.4279256, 0.4706375, -0.3953267, 0.0627451, 0, 1, 1,
0.4303099, 1.033791, 0.3300454, 0.06666667, 0, 1, 1,
0.4324606, -0.6435605, 0.6075915, 0.07450981, 0, 1, 1,
0.4341399, -0.03010623, 1.140129, 0.07843138, 0, 1, 1,
0.4372492, 0.5216091, 0.9262459, 0.08627451, 0, 1, 1,
0.4380232, 0.3746399, -0.5898933, 0.09019608, 0, 1, 1,
0.4384515, 0.2892265, 0.9125476, 0.09803922, 0, 1, 1,
0.4395005, 0.7012401, -1.005519, 0.1058824, 0, 1, 1,
0.4400318, 0.1187355, 1.052619, 0.1098039, 0, 1, 1,
0.4409319, -0.2623999, 0.6235701, 0.1176471, 0, 1, 1,
0.4427576, -0.462902, 2.441168, 0.1215686, 0, 1, 1,
0.4498342, 0.2379793, 1.360609, 0.1294118, 0, 1, 1,
0.4500312, 0.7751057, 1.653954, 0.1333333, 0, 1, 1,
0.454129, 0.5228525, 0.873967, 0.1411765, 0, 1, 1,
0.4582058, -1.272717, 1.745601, 0.145098, 0, 1, 1,
0.4583496, -0.01849535, 2.184212, 0.1529412, 0, 1, 1,
0.4658864, 0.8436225, 1.687435, 0.1568628, 0, 1, 1,
0.482272, 0.001217503, 1.048063, 0.1647059, 0, 1, 1,
0.4844968, 0.7964245, 0.2672132, 0.1686275, 0, 1, 1,
0.4923919, 1.405915, -2.057781, 0.1764706, 0, 1, 1,
0.4931106, 0.8125055, -1.057241, 0.1803922, 0, 1, 1,
0.494918, -0.389964, 2.882936, 0.1882353, 0, 1, 1,
0.4980048, 1.104278, -0.6750609, 0.1921569, 0, 1, 1,
0.5016367, 2.163895, 0.2398963, 0.2, 0, 1, 1,
0.5029285, -1.760119, 1.288637, 0.2078431, 0, 1, 1,
0.5121178, 0.8539609, 0.6724203, 0.2117647, 0, 1, 1,
0.5127162, 1.034907, 0.2983397, 0.2196078, 0, 1, 1,
0.518205, 0.432331, 0.6772773, 0.2235294, 0, 1, 1,
0.5193041, -0.3399972, 4.412886, 0.2313726, 0, 1, 1,
0.5288637, -2.236923, 5.642678, 0.2352941, 0, 1, 1,
0.5290099, 0.7623407, -0.9204876, 0.2431373, 0, 1, 1,
0.5295455, 0.2389268, 0.8614851, 0.2470588, 0, 1, 1,
0.5307119, -1.534431, 2.01454, 0.254902, 0, 1, 1,
0.5317671, 1.289869, 0.06971725, 0.2588235, 0, 1, 1,
0.539481, -0.299975, 2.428004, 0.2666667, 0, 1, 1,
0.5403142, 1.057865, 0.5146278, 0.2705882, 0, 1, 1,
0.5445585, -0.7610784, -0.6139241, 0.2784314, 0, 1, 1,
0.5462943, -1.909794, 2.559004, 0.282353, 0, 1, 1,
0.54649, 0.3084266, 1.572086, 0.2901961, 0, 1, 1,
0.5465753, 0.9571129, 0.7028204, 0.2941177, 0, 1, 1,
0.5517037, -0.6356103, 3.41241, 0.3019608, 0, 1, 1,
0.5536593, -0.319085, 2.675348, 0.3098039, 0, 1, 1,
0.5547025, -0.5827793, 1.6239, 0.3137255, 0, 1, 1,
0.5547766, -1.985099, 4.340353, 0.3215686, 0, 1, 1,
0.5549442, 1.43165, -1.98574, 0.3254902, 0, 1, 1,
0.5550609, -0.4791848, 0.1317153, 0.3333333, 0, 1, 1,
0.5558607, 0.1897948, 0.5435963, 0.3372549, 0, 1, 1,
0.5561242, 0.5900929, 0.8130015, 0.345098, 0, 1, 1,
0.5568544, 0.3607573, 0.4038596, 0.3490196, 0, 1, 1,
0.5613855, 0.5750719, -0.6289712, 0.3568628, 0, 1, 1,
0.5668169, -1.196306, 2.903542, 0.3607843, 0, 1, 1,
0.5681484, -1.1714, 1.927786, 0.3686275, 0, 1, 1,
0.5703086, 0.6286718, -0.5481834, 0.372549, 0, 1, 1,
0.5706341, -0.2242164, 0.9394746, 0.3803922, 0, 1, 1,
0.5706412, 0.218196, 0.4309143, 0.3843137, 0, 1, 1,
0.5713828, 0.8755009, 1.004567, 0.3921569, 0, 1, 1,
0.571518, -0.7339703, 1.479346, 0.3960784, 0, 1, 1,
0.5791278, 0.1036867, 1.231911, 0.4039216, 0, 1, 1,
0.5799029, -0.9184576, 0.9350078, 0.4117647, 0, 1, 1,
0.5818774, 0.3361712, 1.252543, 0.4156863, 0, 1, 1,
0.583429, 0.3905566, -0.07262975, 0.4235294, 0, 1, 1,
0.583616, -0.1457767, 2.917593, 0.427451, 0, 1, 1,
0.5928702, -0.3903385, 2.997718, 0.4352941, 0, 1, 1,
0.6095917, -0.3110454, 1.853575, 0.4392157, 0, 1, 1,
0.6148778, 0.5182496, 1.371131, 0.4470588, 0, 1, 1,
0.6177489, 0.3166868, -0.5557655, 0.4509804, 0, 1, 1,
0.6220534, -0.6065877, 0.416954, 0.4588235, 0, 1, 1,
0.6246414, -0.9414631, 3.59805, 0.4627451, 0, 1, 1,
0.6253704, 1.130271, -0.1323477, 0.4705882, 0, 1, 1,
0.6279448, 0.6782329, 0.1322076, 0.4745098, 0, 1, 1,
0.6300949, -0.7494935, 0.7912332, 0.4823529, 0, 1, 1,
0.6314537, 0.03323862, 1.020586, 0.4862745, 0, 1, 1,
0.6323611, 0.2542657, 1.509729, 0.4941176, 0, 1, 1,
0.63275, -0.7960645, 4.656656, 0.5019608, 0, 1, 1,
0.6362876, -1.277853, 3.28753, 0.5058824, 0, 1, 1,
0.6407325, 0.7322184, -0.1431991, 0.5137255, 0, 1, 1,
0.6431399, -0.2818545, 0.7258362, 0.5176471, 0, 1, 1,
0.644178, 0.651618, 0.3969837, 0.5254902, 0, 1, 1,
0.6467927, -1.517358, 2.618543, 0.5294118, 0, 1, 1,
0.6473181, 1.034728, -0.2926333, 0.5372549, 0, 1, 1,
0.647427, 1.816457, -0.7780014, 0.5411765, 0, 1, 1,
0.6504387, 0.2604286, 1.589371, 0.5490196, 0, 1, 1,
0.6625177, -0.3708423, 1.193139, 0.5529412, 0, 1, 1,
0.6660173, 0.133961, 2.143496, 0.5607843, 0, 1, 1,
0.6661028, -0.1035599, 1.297556, 0.5647059, 0, 1, 1,
0.6679707, 0.8048145, 0.8274225, 0.572549, 0, 1, 1,
0.6689838, 0.9092591, -0.08359861, 0.5764706, 0, 1, 1,
0.6690645, 0.0881279, 0.9150344, 0.5843138, 0, 1, 1,
0.6721132, 0.6603314, 1.839994, 0.5882353, 0, 1, 1,
0.675958, 0.3636612, -1.13384, 0.5960785, 0, 1, 1,
0.687245, -0.1981428, 1.688235, 0.6039216, 0, 1, 1,
0.6925768, 0.04344009, 2.22721, 0.6078432, 0, 1, 1,
0.6940517, 1.163085, 0.2253711, 0.6156863, 0, 1, 1,
0.6944076, 0.5588999, 0.6885788, 0.6196079, 0, 1, 1,
0.6984833, 0.6367314, 0.9656367, 0.627451, 0, 1, 1,
0.698984, -0.41107, 2.631753, 0.6313726, 0, 1, 1,
0.7008616, 0.1677218, 1.306229, 0.6392157, 0, 1, 1,
0.70481, 1.154217, -0.8571028, 0.6431373, 0, 1, 1,
0.708172, 1.077238, 0.3920788, 0.6509804, 0, 1, 1,
0.716602, 0.8146991, -0.5297754, 0.654902, 0, 1, 1,
0.7166166, -0.3805968, 2.727425, 0.6627451, 0, 1, 1,
0.7172167, 0.0860685, 1.639176, 0.6666667, 0, 1, 1,
0.7185863, 0.5261643, 0.18133, 0.6745098, 0, 1, 1,
0.7215484, -0.9760487, 0.7788353, 0.6784314, 0, 1, 1,
0.7231665, 0.8476288, 0.1273169, 0.6862745, 0, 1, 1,
0.7353597, 1.079277, 0.1394239, 0.6901961, 0, 1, 1,
0.7361841, 0.215634, -0.51797, 0.6980392, 0, 1, 1,
0.7412218, -0.05813625, 2.898777, 0.7058824, 0, 1, 1,
0.7420609, 0.2967958, 1.294856, 0.7098039, 0, 1, 1,
0.7427456, 0.9854721, 0.6486169, 0.7176471, 0, 1, 1,
0.7443826, -2.18951, 2.887649, 0.7215686, 0, 1, 1,
0.7468156, 0.2733607, 1.90132, 0.7294118, 0, 1, 1,
0.7477091, 0.8182904, 2.169093, 0.7333333, 0, 1, 1,
0.754332, -1.173939, 2.140719, 0.7411765, 0, 1, 1,
0.7554672, -0.7821206, 1.748553, 0.7450981, 0, 1, 1,
0.7556334, 0.2198038, 0.6742176, 0.7529412, 0, 1, 1,
0.7583002, 0.5181688, 0.04412455, 0.7568628, 0, 1, 1,
0.7585632, 0.5810698, -0.5767257, 0.7647059, 0, 1, 1,
0.7623605, 0.7828137, 1.257734, 0.7686275, 0, 1, 1,
0.7636489, 0.6601884, 0.4549409, 0.7764706, 0, 1, 1,
0.7659611, 0.4325728, 2.462941, 0.7803922, 0, 1, 1,
0.7679937, 0.2501581, 2.011437, 0.7882353, 0, 1, 1,
0.7717727, 0.5060963, 1.652532, 0.7921569, 0, 1, 1,
0.7778684, 0.59456, 2.251999, 0.8, 0, 1, 1,
0.783277, 0.8734186, -0.5544815, 0.8078431, 0, 1, 1,
0.7838197, 0.01070277, 0.8446446, 0.8117647, 0, 1, 1,
0.7895257, -0.6286908, 2.585636, 0.8196079, 0, 1, 1,
0.7943823, -0.4107375, 2.82751, 0.8235294, 0, 1, 1,
0.7955784, -0.6313832, 2.813019, 0.8313726, 0, 1, 1,
0.798245, -0.2544524, 1.204059, 0.8352941, 0, 1, 1,
0.7983038, 1.178992, -0.3544625, 0.8431373, 0, 1, 1,
0.7986948, 2.04776, 1.343615, 0.8470588, 0, 1, 1,
0.8034437, -0.155132, 1.230493, 0.854902, 0, 1, 1,
0.8039166, 0.0771457, 2.030536, 0.8588235, 0, 1, 1,
0.8049873, 1.464844, 0.04730813, 0.8666667, 0, 1, 1,
0.8079207, -0.391214, 2.422375, 0.8705882, 0, 1, 1,
0.8084268, 0.06042753, -1.052375, 0.8784314, 0, 1, 1,
0.8098895, -0.9752244, 3.305543, 0.8823529, 0, 1, 1,
0.8212836, -2.14772, 2.966559, 0.8901961, 0, 1, 1,
0.823844, 0.7915334, 0.8941757, 0.8941177, 0, 1, 1,
0.8274978, -0.8852517, 2.689373, 0.9019608, 0, 1, 1,
0.828243, -0.9672334, 2.141017, 0.9098039, 0, 1, 1,
0.830323, 0.6030777, -0.05814867, 0.9137255, 0, 1, 1,
0.8316797, 0.7337386, 2.280846, 0.9215686, 0, 1, 1,
0.833672, 0.5626085, 0.5988067, 0.9254902, 0, 1, 1,
0.8384991, -0.8951167, 2.506518, 0.9333333, 0, 1, 1,
0.8404167, 1.658399, 1.054073, 0.9372549, 0, 1, 1,
0.8418795, -0.4472313, 1.127822, 0.945098, 0, 1, 1,
0.8433481, 0.1654925, 2.994599, 0.9490196, 0, 1, 1,
0.8437843, 1.26509, -0.247565, 0.9568627, 0, 1, 1,
0.8465044, 0.6160173, 0.2457218, 0.9607843, 0, 1, 1,
0.8498033, 0.09386805, 2.081694, 0.9686275, 0, 1, 1,
0.8523276, -0.7145669, 3.271197, 0.972549, 0, 1, 1,
0.8534019, -0.230686, 1.190966, 0.9803922, 0, 1, 1,
0.854088, -0.1301739, 0.3702978, 0.9843137, 0, 1, 1,
0.8547316, -1.5179, 1.525519, 0.9921569, 0, 1, 1,
0.8553014, -0.7712148, 1.27175, 0.9960784, 0, 1, 1,
0.8595082, 0.5101885, 1.096638, 1, 0, 0.9960784, 1,
0.8607866, -0.3289745, 2.001064, 1, 0, 0.9882353, 1,
0.8629045, 0.1648062, 1.875093, 1, 0, 0.9843137, 1,
0.8644567, -1.246751, 2.132342, 1, 0, 0.9764706, 1,
0.8664069, 0.7740265, 0.5154524, 1, 0, 0.972549, 1,
0.8747203, -1.19778, 1.156656, 1, 0, 0.9647059, 1,
0.8808616, -0.910547, 2.676654, 1, 0, 0.9607843, 1,
0.8831464, 0.07892542, 3.224138, 1, 0, 0.9529412, 1,
0.9004716, -0.3496724, 2.100878, 1, 0, 0.9490196, 1,
0.9167279, 0.3169241, 1.1794, 1, 0, 0.9411765, 1,
0.9205815, 0.3466951, 0.6683459, 1, 0, 0.9372549, 1,
0.9208608, -1.598908, 3.615505, 1, 0, 0.9294118, 1,
0.9252505, -1.856542, 2.333775, 1, 0, 0.9254902, 1,
0.9361271, -0.4066977, 2.78146, 1, 0, 0.9176471, 1,
0.9365655, 1.22546, 0.6274277, 1, 0, 0.9137255, 1,
0.9373329, 0.944874, 0.4826043, 1, 0, 0.9058824, 1,
0.9399537, -1.232473, 1.686991, 1, 0, 0.9019608, 1,
0.9417818, -0.3294992, 0.304767, 1, 0, 0.8941177, 1,
0.9430608, 1.922912, -0.4788171, 1, 0, 0.8862745, 1,
0.9476814, 0.0272571, 0.8383576, 1, 0, 0.8823529, 1,
0.9499215, 0.3119299, 1.001312, 1, 0, 0.8745098, 1,
0.9522274, 1.260187, 0.5412262, 1, 0, 0.8705882, 1,
0.9583567, 0.818637, 1.135556, 1, 0, 0.8627451, 1,
0.9613379, 0.9193947, 1.09512, 1, 0, 0.8588235, 1,
0.9639081, -0.9114928, 1.2949, 1, 0, 0.8509804, 1,
0.9642181, -1.681112, 2.381747, 1, 0, 0.8470588, 1,
0.972154, 0.4946018, 1.33093, 1, 0, 0.8392157, 1,
0.9770913, 1.014567, 0.2421927, 1, 0, 0.8352941, 1,
0.9774362, 1.508304, -0.04865247, 1, 0, 0.827451, 1,
0.9791397, 1.595636, -1.12783, 1, 0, 0.8235294, 1,
0.9834802, -0.3807871, 0.6005648, 1, 0, 0.8156863, 1,
0.9881445, -3.484018, 3.680092, 1, 0, 0.8117647, 1,
0.9954549, 0.2701186, 2.002035, 1, 0, 0.8039216, 1,
0.9979145, 0.7868557, 1.268661, 1, 0, 0.7960784, 1,
0.9987443, 0.8170704, 1.718943, 1, 0, 0.7921569, 1,
1.009114, 0.2054603, 2.428154, 1, 0, 0.7843137, 1,
1.010357, -1.409241, 3.70085, 1, 0, 0.7803922, 1,
1.010529, -0.3040349, 0.3375879, 1, 0, 0.772549, 1,
1.019302, 0.2133636, 1.085025, 1, 0, 0.7686275, 1,
1.021402, 0.5430195, 0.5476724, 1, 0, 0.7607843, 1,
1.026784, -0.174358, 0.5036195, 1, 0, 0.7568628, 1,
1.030865, -0.4433276, 1.87767, 1, 0, 0.7490196, 1,
1.03335, -0.2913471, 0.1373281, 1, 0, 0.7450981, 1,
1.038397, -0.1834637, 3.607187, 1, 0, 0.7372549, 1,
1.045682, -1.264374, 2.892403, 1, 0, 0.7333333, 1,
1.045695, -1.094266, 2.482388, 1, 0, 0.7254902, 1,
1.046469, 0.8377671, 1.751646, 1, 0, 0.7215686, 1,
1.061887, 0.02632706, 0.8481548, 1, 0, 0.7137255, 1,
1.066323, 0.0162625, 0.5467166, 1, 0, 0.7098039, 1,
1.0674, 0.8937019, 0.2506848, 1, 0, 0.7019608, 1,
1.068424, -0.3720018, 2.777107, 1, 0, 0.6941177, 1,
1.0733, -0.824935, 2.489457, 1, 0, 0.6901961, 1,
1.079423, -1.302406, 3.463849, 1, 0, 0.682353, 1,
1.08771, -0.7738171, 1.606933, 1, 0, 0.6784314, 1,
1.088381, 0.03760376, 1.990638, 1, 0, 0.6705883, 1,
1.091844, -0.5255595, 1.626476, 1, 0, 0.6666667, 1,
1.09299, 1.405792, 1.734409, 1, 0, 0.6588235, 1,
1.093887, 0.4417066, 0.383795, 1, 0, 0.654902, 1,
1.097094, -1.318567, 2.909956, 1, 0, 0.6470588, 1,
1.105296, 0.1368154, 0.5796898, 1, 0, 0.6431373, 1,
1.112784, -0.7190101, 1.036791, 1, 0, 0.6352941, 1,
1.114102, 0.7661016, 2.399948, 1, 0, 0.6313726, 1,
1.116451, -1.102774, 2.182396, 1, 0, 0.6235294, 1,
1.120332, -1.196048, 2.651036, 1, 0, 0.6196079, 1,
1.134882, 0.4368888, 0.8615894, 1, 0, 0.6117647, 1,
1.135029, 1.052197, 0.3189504, 1, 0, 0.6078432, 1,
1.135407, 0.440826, 1.161351, 1, 0, 0.6, 1,
1.138336, -1.245744, 1.560626, 1, 0, 0.5921569, 1,
1.140621, -1.235119, 3.676536, 1, 0, 0.5882353, 1,
1.147991, 0.608241, 2.343301, 1, 0, 0.5803922, 1,
1.151705, 0.3755656, 2.812331, 1, 0, 0.5764706, 1,
1.156574, -0.1079364, 0.7518292, 1, 0, 0.5686275, 1,
1.15925, 0.09637991, 1.52119, 1, 0, 0.5647059, 1,
1.162851, -0.7897491, 3.041498, 1, 0, 0.5568628, 1,
1.170527, -0.4250277, 1.616708, 1, 0, 0.5529412, 1,
1.170643, -0.3942411, 2.403035, 1, 0, 0.5450981, 1,
1.174526, -0.1697254, -0.3808514, 1, 0, 0.5411765, 1,
1.178653, 2.110174, 0.9529851, 1, 0, 0.5333334, 1,
1.182524, -0.4116252, 1.579674, 1, 0, 0.5294118, 1,
1.190557, -0.200958, 0.4989324, 1, 0, 0.5215687, 1,
1.193486, -0.9323609, 1.569869, 1, 0, 0.5176471, 1,
1.19513, -0.1302922, 2.705051, 1, 0, 0.509804, 1,
1.207999, -1.12638, 2.859439, 1, 0, 0.5058824, 1,
1.211852, 0.04231322, 0.3825924, 1, 0, 0.4980392, 1,
1.215937, 0.437866, 2.45063, 1, 0, 0.4901961, 1,
1.224517, -0.6282582, 2.033953, 1, 0, 0.4862745, 1,
1.23066, 0.2010712, 1.880557, 1, 0, 0.4784314, 1,
1.249275, 0.4673751, 0.4955364, 1, 0, 0.4745098, 1,
1.255357, 0.3996325, -0.02344816, 1, 0, 0.4666667, 1,
1.273068, -0.6030458, 2.149051, 1, 0, 0.4627451, 1,
1.276814, -0.1244865, 3.230747, 1, 0, 0.454902, 1,
1.278592, 0.074189, 2.484168, 1, 0, 0.4509804, 1,
1.279357, -0.7915159, 2.288894, 1, 0, 0.4431373, 1,
1.280506, 0.7813111, 0.1130133, 1, 0, 0.4392157, 1,
1.287104, -0.01596235, 0.9225388, 1, 0, 0.4313726, 1,
1.28911, -0.7707771, 3.880411, 1, 0, 0.427451, 1,
1.294424, -0.110741, 1.715667, 1, 0, 0.4196078, 1,
1.302536, 0.4399603, 1.433213, 1, 0, 0.4156863, 1,
1.318939, -1.808716, 3.72814, 1, 0, 0.4078431, 1,
1.321053, 0.05171873, 2.023833, 1, 0, 0.4039216, 1,
1.325415, 0.2824028, 1.263324, 1, 0, 0.3960784, 1,
1.332231, 0.01579311, -0.2684916, 1, 0, 0.3882353, 1,
1.339668, -1.632947, 3.096216, 1, 0, 0.3843137, 1,
1.346239, 0.1868314, 1.377806, 1, 0, 0.3764706, 1,
1.365381, 0.8953723, -0.1603947, 1, 0, 0.372549, 1,
1.396434, 0.8082196, 1.776259, 1, 0, 0.3647059, 1,
1.399332, -0.7267728, 2.045603, 1, 0, 0.3607843, 1,
1.401227, -0.6303471, 0.9442316, 1, 0, 0.3529412, 1,
1.407083, 1.125674, 0.7468289, 1, 0, 0.3490196, 1,
1.415355, 0.4568164, 1.070724, 1, 0, 0.3411765, 1,
1.421725, 0.3719399, -0.03844032, 1, 0, 0.3372549, 1,
1.433155, -1.848415, 1.895989, 1, 0, 0.3294118, 1,
1.440433, -1.262702, 1.04597, 1, 0, 0.3254902, 1,
1.447744, 0.05617967, 1.273364, 1, 0, 0.3176471, 1,
1.484268, -2.128795, 2.722165, 1, 0, 0.3137255, 1,
1.489694, 0.8916734, 1.760127, 1, 0, 0.3058824, 1,
1.491555, 1.106966, -0.4357915, 1, 0, 0.2980392, 1,
1.491882, -1.324952, 2.07584, 1, 0, 0.2941177, 1,
1.498054, 0.2686282, 1.35427, 1, 0, 0.2862745, 1,
1.498337, 0.3812647, 0.7736832, 1, 0, 0.282353, 1,
1.514027, 0.1465734, 0.601675, 1, 0, 0.2745098, 1,
1.540188, 1.450558, 0.5757722, 1, 0, 0.2705882, 1,
1.545124, -1.076078, 0.2742057, 1, 0, 0.2627451, 1,
1.548803, 1.319023, 2.072407, 1, 0, 0.2588235, 1,
1.549593, 0.5926934, 0.6409767, 1, 0, 0.2509804, 1,
1.550186, 0.1911695, 1.091953, 1, 0, 0.2470588, 1,
1.554938, -1.138973, 1.925696, 1, 0, 0.2392157, 1,
1.559678, -0.5915388, 2.442855, 1, 0, 0.2352941, 1,
1.582051, -0.4921624, 0.568403, 1, 0, 0.227451, 1,
1.616112, 0.1910072, 1.36162, 1, 0, 0.2235294, 1,
1.643079, -0.6704513, 1.420554, 1, 0, 0.2156863, 1,
1.645997, 1.812407, -0.5661882, 1, 0, 0.2117647, 1,
1.652357, 2.178411, 1.99833, 1, 0, 0.2039216, 1,
1.653959, 1.264041, 0.6362817, 1, 0, 0.1960784, 1,
1.65655, -0.4073217, 1.738145, 1, 0, 0.1921569, 1,
1.685964, 0.7475863, 1.503988, 1, 0, 0.1843137, 1,
1.702232, -0.2534883, 2.588878, 1, 0, 0.1803922, 1,
1.712521, 1.177207, -0.7125005, 1, 0, 0.172549, 1,
1.745772, -0.5889556, 0.5970107, 1, 0, 0.1686275, 1,
1.752183, 0.05142746, 1.945833, 1, 0, 0.1607843, 1,
1.765689, 0.5870374, 1.505487, 1, 0, 0.1568628, 1,
1.76665, 0.1005951, 2.236871, 1, 0, 0.1490196, 1,
1.781442, -1.155039, 2.482173, 1, 0, 0.145098, 1,
1.797647, 0.1539145, 0.2976301, 1, 0, 0.1372549, 1,
1.814682, -0.1067001, 3.678344, 1, 0, 0.1333333, 1,
1.83084, 1.780978, 0.04554992, 1, 0, 0.1254902, 1,
1.869406, 1.473541, 1.764466, 1, 0, 0.1215686, 1,
1.91763, -1.268331, 3.126018, 1, 0, 0.1137255, 1,
1.934825, -0.7152852, 2.101219, 1, 0, 0.1098039, 1,
1.952877, -0.4456337, 2.365878, 1, 0, 0.1019608, 1,
1.97648, -1.97753, 3.295278, 1, 0, 0.09411765, 1,
2.000446, -0.6005734, 4.061814, 1, 0, 0.09019608, 1,
2.182784, -1.50268, 1.273689, 1, 0, 0.08235294, 1,
2.19215, 0.1197633, 1.590342, 1, 0, 0.07843138, 1,
2.201886, 0.5163208, 0.5968332, 1, 0, 0.07058824, 1,
2.236348, -1.430146, 5.374941, 1, 0, 0.06666667, 1,
2.377618, -0.6095683, 2.090864, 1, 0, 0.05882353, 1,
2.392812, -0.4952567, 1.187428, 1, 0, 0.05490196, 1,
2.412394, -1.021276, 2.308097, 1, 0, 0.04705882, 1,
2.514815, -0.5164846, 3.81439, 1, 0, 0.04313726, 1,
2.619519, -1.481795, 2.121742, 1, 0, 0.03529412, 1,
2.740428, 1.330941, 1.256605, 1, 0, 0.03137255, 1,
2.768904, 1.069382, 0.9735204, 1, 0, 0.02352941, 1,
2.772121, 0.5761753, 0.9838493, 1, 0, 0.01960784, 1,
2.795571, 2.135738, 1.422943, 1, 0, 0.01176471, 1,
2.818089, 0.5298023, 0.5856822, 1, 0, 0.007843138, 1
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
-0.3206309, -4.665242, -7.110743, 0, -0.5, 0.5, 0.5,
-0.3206309, -4.665242, -7.110743, 1, -0.5, 0.5, 0.5,
-0.3206309, -4.665242, -7.110743, 1, 1.5, 0.5, 0.5,
-0.3206309, -4.665242, -7.110743, 0, 1.5, 0.5, 0.5
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
-4.523377, 0.0004177094, -7.110743, 0, -0.5, 0.5, 0.5,
-4.523377, 0.0004177094, -7.110743, 1, -0.5, 0.5, 0.5,
-4.523377, 0.0004177094, -7.110743, 1, 1.5, 0.5, 0.5,
-4.523377, 0.0004177094, -7.110743, 0, 1.5, 0.5, 0.5
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
-4.523377, -4.665242, 0.1901684, 0, -0.5, 0.5, 0.5,
-4.523377, -4.665242, 0.1901684, 1, -0.5, 0.5, 0.5,
-4.523377, -4.665242, 0.1901684, 1, 1.5, 0.5, 0.5,
-4.523377, -4.665242, 0.1901684, 0, 1.5, 0.5, 0.5
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
-3, -3.588551, -5.425917,
2, -3.588551, -5.425917,
-3, -3.588551, -5.425917,
-3, -3.768, -5.706721,
-2, -3.588551, -5.425917,
-2, -3.768, -5.706721,
-1, -3.588551, -5.425917,
-1, -3.768, -5.706721,
0, -3.588551, -5.425917,
0, -3.768, -5.706721,
1, -3.588551, -5.425917,
1, -3.768, -5.706721,
2, -3.588551, -5.425917,
2, -3.768, -5.706721
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
-3, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
-3, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
-3, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
-3, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5,
-2, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
-2, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
-2, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
-2, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5,
-1, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
-1, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
-1, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
-1, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5,
0, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
0, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
0, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
0, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5,
1, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
1, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
1, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
1, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5,
2, -4.126896, -6.26833, 0, -0.5, 0.5, 0.5,
2, -4.126896, -6.26833, 1, -0.5, 0.5, 0.5,
2, -4.126896, -6.26833, 1, 1.5, 0.5, 0.5,
2, -4.126896, -6.26833, 0, 1.5, 0.5, 0.5
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
-3.553512, -3, -5.425917,
-3.553512, 3, -5.425917,
-3.553512, -3, -5.425917,
-3.715157, -3, -5.706721,
-3.553512, -2, -5.425917,
-3.715157, -2, -5.706721,
-3.553512, -1, -5.425917,
-3.715157, -1, -5.706721,
-3.553512, 0, -5.425917,
-3.715157, 0, -5.706721,
-3.553512, 1, -5.425917,
-3.715157, 1, -5.706721,
-3.553512, 2, -5.425917,
-3.715157, 2, -5.706721,
-3.553512, 3, -5.425917,
-3.715157, 3, -5.706721
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
-4.038445, -3, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, -3, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, -3, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, -3, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, -2, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, -2, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, -2, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, -2, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, -1, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, -1, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, -1, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, -1, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, 0, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, 0, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, 0, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, 0, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, 1, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, 1, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, 1, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, 1, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, 2, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, 2, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, 2, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, 2, -6.26833, 0, 1.5, 0.5, 0.5,
-4.038445, 3, -6.26833, 0, -0.5, 0.5, 0.5,
-4.038445, 3, -6.26833, 1, -0.5, 0.5, 0.5,
-4.038445, 3, -6.26833, 1, 1.5, 0.5, 0.5,
-4.038445, 3, -6.26833, 0, 1.5, 0.5, 0.5
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
-3.553512, -3.588551, -4,
-3.553512, -3.588551, 4,
-3.553512, -3.588551, -4,
-3.715157, -3.768, -4,
-3.553512, -3.588551, -2,
-3.715157, -3.768, -2,
-3.553512, -3.588551, 0,
-3.715157, -3.768, 0,
-3.553512, -3.588551, 2,
-3.715157, -3.768, 2,
-3.553512, -3.588551, 4,
-3.715157, -3.768, 4
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
-4.038445, -4.126896, -4, 0, -0.5, 0.5, 0.5,
-4.038445, -4.126896, -4, 1, -0.5, 0.5, 0.5,
-4.038445, -4.126896, -4, 1, 1.5, 0.5, 0.5,
-4.038445, -4.126896, -4, 0, 1.5, 0.5, 0.5,
-4.038445, -4.126896, -2, 0, -0.5, 0.5, 0.5,
-4.038445, -4.126896, -2, 1, -0.5, 0.5, 0.5,
-4.038445, -4.126896, -2, 1, 1.5, 0.5, 0.5,
-4.038445, -4.126896, -2, 0, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 0, 0, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 0, 1, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 0, 1, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 0, 0, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 2, 0, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 2, 1, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 2, 1, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 2, 0, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 4, 0, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 4, 1, -0.5, 0.5, 0.5,
-4.038445, -4.126896, 4, 1, 1.5, 0.5, 0.5,
-4.038445, -4.126896, 4, 0, 1.5, 0.5, 0.5
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
-3.553512, -3.588551, -5.425917,
-3.553512, 3.589386, -5.425917,
-3.553512, -3.588551, 5.806253,
-3.553512, 3.589386, 5.806253,
-3.553512, -3.588551, -5.425917,
-3.553512, -3.588551, 5.806253,
-3.553512, 3.589386, -5.425917,
-3.553512, 3.589386, 5.806253,
-3.553512, -3.588551, -5.425917,
2.912251, -3.588551, -5.425917,
-3.553512, -3.588551, 5.806253,
2.912251, -3.588551, 5.806253,
-3.553512, 3.589386, -5.425917,
2.912251, 3.589386, -5.425917,
-3.553512, 3.589386, 5.806253,
2.912251, 3.589386, 5.806253,
2.912251, -3.588551, -5.425917,
2.912251, 3.589386, -5.425917,
2.912251, -3.588551, 5.806253,
2.912251, 3.589386, 5.806253,
2.912251, -3.588551, -5.425917,
2.912251, -3.588551, 5.806253,
2.912251, 3.589386, -5.425917,
2.912251, 3.589386, 5.806253
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
var radius = 7.911036;
var distance = 35.19709;
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
mvMatrix.translate( 0.3206309, -0.0004177094, -0.1901684 );
mvMatrix.scale( 1.322901, 1.191647, 0.761524 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.19709);
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
Cephalon<-read.table("Cephalon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cephalon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cephalon' not found
```

```r
y<-Cephalon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cephalon' not found
```

```r
z<-Cephalon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cephalon' not found
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
-3.459351, -0.2508043, -2.744656, 0, 0, 1, 1, 1,
-3.45425, -0.584568, -2.430758, 1, 0, 0, 1, 1,
-3.080552, 0.6063787, -0.5801125, 1, 0, 0, 1, 1,
-2.884199, -1.456015, -2.18277, 1, 0, 0, 1, 1,
-2.772784, -0.2441854, -0.2163519, 1, 0, 0, 1, 1,
-2.770365, -0.5802835, -1.719951, 1, 0, 0, 1, 1,
-2.669825, -0.5308667, -2.141561, 0, 0, 0, 1, 1,
-2.524733, 0.5946493, -1.472925, 0, 0, 0, 1, 1,
-2.51594, -1.051007, -2.222067, 0, 0, 0, 1, 1,
-2.509027, -2.699592, -0.2860875, 0, 0, 0, 1, 1,
-2.507252, -1.363571, -2.948367, 0, 0, 0, 1, 1,
-2.252199, -0.4238972, -3.859066, 0, 0, 0, 1, 1,
-2.183391, -0.2295043, -1.948339, 0, 0, 0, 1, 1,
-2.09319, -1.325407, -2.53142, 1, 1, 1, 1, 1,
-2.077933, -1.189038, -1.100553, 1, 1, 1, 1, 1,
-2.064686, 0.8947369, -2.302113, 1, 1, 1, 1, 1,
-2.062837, 0.7745928, -1.85633, 1, 1, 1, 1, 1,
-2.052266, -0.2526805, -2.69662, 1, 1, 1, 1, 1,
-2.018374, 0.1826233, -1.318842, 1, 1, 1, 1, 1,
-1.945055, -1.170119, -0.5178427, 1, 1, 1, 1, 1,
-1.943744, -0.05591119, -2.120755, 1, 1, 1, 1, 1,
-1.934094, 1.647289, 0.4443913, 1, 1, 1, 1, 1,
-1.92395, 2.034539, -2.045999, 1, 1, 1, 1, 1,
-1.914961, 1.924867, -0.4729225, 1, 1, 1, 1, 1,
-1.888283, 0.3897644, -0.7462113, 1, 1, 1, 1, 1,
-1.885133, -0.1003103, -1.910977, 1, 1, 1, 1, 1,
-1.857264, -0.2913859, 0.08809424, 1, 1, 1, 1, 1,
-1.848871, 0.4079594, -0.9122632, 1, 1, 1, 1, 1,
-1.847524, -0.4711137, -2.95314, 0, 0, 1, 1, 1,
-1.844931, -0.06695136, -0.2395664, 1, 0, 0, 1, 1,
-1.838464, -0.8643219, -1.952507, 1, 0, 0, 1, 1,
-1.837914, 0.04936559, -1.455426, 1, 0, 0, 1, 1,
-1.831799, -1.998758, -2.215067, 1, 0, 0, 1, 1,
-1.831369, -0.0285295, -0.6501898, 1, 0, 0, 1, 1,
-1.827378, 1.936354, -0.2425281, 0, 0, 0, 1, 1,
-1.826973, -0.1934147, -0.6462344, 0, 0, 0, 1, 1,
-1.824983, -1.228349, 0.05602457, 0, 0, 0, 1, 1,
-1.824478, -0.4816279, -2.170049, 0, 0, 0, 1, 1,
-1.765364, 0.5953045, -0.07511817, 0, 0, 0, 1, 1,
-1.756085, -2.677954, -2.145831, 0, 0, 0, 1, 1,
-1.751858, -1.290971, -1.808553, 0, 0, 0, 1, 1,
-1.732443, 0.3135941, -3.251585, 1, 1, 1, 1, 1,
-1.706397, 0.09908648, -1.033337, 1, 1, 1, 1, 1,
-1.687863, 0.3869382, -0.6540059, 1, 1, 1, 1, 1,
-1.686669, 0.463905, -0.9872437, 1, 1, 1, 1, 1,
-1.682868, 0.9302357, -3.079071, 1, 1, 1, 1, 1,
-1.678727, 0.3917294, 0.2896418, 1, 1, 1, 1, 1,
-1.67826, -1.425482, -3.635499, 1, 1, 1, 1, 1,
-1.678222, -2.47045, -1.104517, 1, 1, 1, 1, 1,
-1.674146, 0.3958493, -1.384976, 1, 1, 1, 1, 1,
-1.671944, -0.1501925, -0.01148184, 1, 1, 1, 1, 1,
-1.66571, 0.1643978, -1.480716, 1, 1, 1, 1, 1,
-1.664955, -0.08688837, -1.902597, 1, 1, 1, 1, 1,
-1.630298, 0.415786, -1.752298, 1, 1, 1, 1, 1,
-1.627038, -1.884768, -3.990506, 1, 1, 1, 1, 1,
-1.615689, 0.6980789, -0.3100984, 1, 1, 1, 1, 1,
-1.598781, 1.398278, -2.662299, 0, 0, 1, 1, 1,
-1.596729, 0.04548914, -3.245845, 1, 0, 0, 1, 1,
-1.58797, -0.08380838, -1.44777, 1, 0, 0, 1, 1,
-1.584135, 1.065509, -2.130096, 1, 0, 0, 1, 1,
-1.576398, 0.3003536, -2.096078, 1, 0, 0, 1, 1,
-1.566625, 0.2743838, -0.0116526, 1, 0, 0, 1, 1,
-1.564376, -0.7611259, -3.339591, 0, 0, 0, 1, 1,
-1.557961, 0.3237618, -1.77777, 0, 0, 0, 1, 1,
-1.555693, -0.5565494, -2.217279, 0, 0, 0, 1, 1,
-1.55356, -0.8777881, -0.7213514, 0, 0, 0, 1, 1,
-1.550623, -1.082169, -2.968212, 0, 0, 0, 1, 1,
-1.546977, -1.194392, -1.813872, 0, 0, 0, 1, 1,
-1.543841, 0.6378732, 0.2708134, 0, 0, 0, 1, 1,
-1.539246, 0.4566077, -0.2546301, 1, 1, 1, 1, 1,
-1.536512, 1.130932, -0.5338712, 1, 1, 1, 1, 1,
-1.525078, -0.0259567, -1.752568, 1, 1, 1, 1, 1,
-1.508202, 0.6887636, -1.439503, 1, 1, 1, 1, 1,
-1.50219, -1.564397, -1.597254, 1, 1, 1, 1, 1,
-1.49972, 1.128536, -0.9308537, 1, 1, 1, 1, 1,
-1.475355, -0.3850518, -1.751884, 1, 1, 1, 1, 1,
-1.467965, 0.4854554, -1.701303, 1, 1, 1, 1, 1,
-1.462682, -0.9203655, -2.73082, 1, 1, 1, 1, 1,
-1.441784, 1.033779, 1.163907, 1, 1, 1, 1, 1,
-1.437021, 1.543239, -0.6489286, 1, 1, 1, 1, 1,
-1.436278, 0.7978715, 0.5165673, 1, 1, 1, 1, 1,
-1.42691, 0.8259298, -2.844051, 1, 1, 1, 1, 1,
-1.426062, -0.8077089, -1.20617, 1, 1, 1, 1, 1,
-1.423559, 0.2375192, -1.48, 1, 1, 1, 1, 1,
-1.419586, -0.04262546, -1.221253, 0, 0, 1, 1, 1,
-1.411958, -1.221429, -3.398491, 1, 0, 0, 1, 1,
-1.406747, -0.1575124, -2.196154, 1, 0, 0, 1, 1,
-1.393415, -1.07296, -1.503108, 1, 0, 0, 1, 1,
-1.391944, 1.955344, -0.767406, 1, 0, 0, 1, 1,
-1.391794, -1.76764, -4.07036, 1, 0, 0, 1, 1,
-1.379364, 0.9612644, 0.2764227, 0, 0, 0, 1, 1,
-1.364226, -0.7478752, -3.156674, 0, 0, 0, 1, 1,
-1.361517, -0.1382969, -0.9594631, 0, 0, 0, 1, 1,
-1.348821, -0.9562139, -3.948059, 0, 0, 0, 1, 1,
-1.339064, 0.1010229, -0.8893182, 0, 0, 0, 1, 1,
-1.321466, 0.7083762, -0.5182062, 0, 0, 0, 1, 1,
-1.305995, -0.3016981, -2.147934, 0, 0, 0, 1, 1,
-1.299031, -0.2638861, 0.4757869, 1, 1, 1, 1, 1,
-1.288149, -0.3858327, 0.005236457, 1, 1, 1, 1, 1,
-1.281495, -0.1248318, -1.859613, 1, 1, 1, 1, 1,
-1.271231, -0.3504449, -0.07662895, 1, 1, 1, 1, 1,
-1.269486, -1.951134, -4.816895, 1, 1, 1, 1, 1,
-1.263639, 0.7819417, -0.4974854, 1, 1, 1, 1, 1,
-1.244266, -0.03156484, -1.114621, 1, 1, 1, 1, 1,
-1.239946, 0.5564061, -1.265775, 1, 1, 1, 1, 1,
-1.228707, 0.8694143, -0.01867147, 1, 1, 1, 1, 1,
-1.21295, 0.1828664, -0.3951125, 1, 1, 1, 1, 1,
-1.202589, 0.1758982, -1.8305, 1, 1, 1, 1, 1,
-1.163593, -0.06213281, -1.661806, 1, 1, 1, 1, 1,
-1.159243, 0.1716877, -1.038456, 1, 1, 1, 1, 1,
-1.155427, 1.30788, -0.5503191, 1, 1, 1, 1, 1,
-1.154916, -1.611607, -3.974211, 1, 1, 1, 1, 1,
-1.148422, 1.467179, -2.056648, 0, 0, 1, 1, 1,
-1.146283, 1.085869, -2.401144, 1, 0, 0, 1, 1,
-1.144778, -0.3599364, -2.640628, 1, 0, 0, 1, 1,
-1.142228, 0.2963109, -1.739119, 1, 0, 0, 1, 1,
-1.139541, 1.402495, -0.4037865, 1, 0, 0, 1, 1,
-1.123251, -0.9661598, -3.486975, 1, 0, 0, 1, 1,
-1.121787, 0.1827107, 0.2488919, 0, 0, 0, 1, 1,
-1.120558, -0.1784891, -1.177366, 0, 0, 0, 1, 1,
-1.115114, 0.0301787, -1.661296, 0, 0, 0, 1, 1,
-1.113575, 0.5352256, -1.827922, 0, 0, 0, 1, 1,
-1.110647, 0.183366, -1.336465, 0, 0, 0, 1, 1,
-1.109763, 1.161819, -1.026609, 0, 0, 0, 1, 1,
-1.104096, 0.6182449, -0.03773465, 0, 0, 0, 1, 1,
-1.097878, -0.4283251, -1.677831, 1, 1, 1, 1, 1,
-1.097473, -0.5597144, -1.948379, 1, 1, 1, 1, 1,
-1.09662, -0.3185896, -0.9707728, 1, 1, 1, 1, 1,
-1.094385, -0.4137034, -2.769551, 1, 1, 1, 1, 1,
-1.093911, 0.5355743, -1.753058, 1, 1, 1, 1, 1,
-1.073696, 1.750853, -0.3886324, 1, 1, 1, 1, 1,
-1.073602, -0.3814706, -2.24905, 1, 1, 1, 1, 1,
-1.073357, 2.128936, -0.5678552, 1, 1, 1, 1, 1,
-1.065185, -0.2904602, -1.777552, 1, 1, 1, 1, 1,
-1.062431, 0.001975673, -1.23646, 1, 1, 1, 1, 1,
-1.05913, 0.8202335, -1.876227, 1, 1, 1, 1, 1,
-1.058253, -0.7634186, -1.864236, 1, 1, 1, 1, 1,
-1.046662, -0.1164611, -1.015767, 1, 1, 1, 1, 1,
-1.031185, -0.2392594, -2.653284, 1, 1, 1, 1, 1,
-1.030734, 0.0880435, -2.651943, 1, 1, 1, 1, 1,
-1.029278, -1.427086, -4.042226, 0, 0, 1, 1, 1,
-1.029093, -0.20859, -0.480489, 1, 0, 0, 1, 1,
-1.025642, 0.7056949, -1.739437, 1, 0, 0, 1, 1,
-1.021087, 1.06761, 0.04316733, 1, 0, 0, 1, 1,
-1.02039, 0.08495845, -0.5082603, 1, 0, 0, 1, 1,
-1.017657, -0.9013342, -1.78159, 1, 0, 0, 1, 1,
-1.000598, -0.05617218, 0.1288313, 0, 0, 0, 1, 1,
-0.9991921, 0.5496877, -0.3143723, 0, 0, 0, 1, 1,
-0.9987961, -0.3881428, -2.497472, 0, 0, 0, 1, 1,
-0.9981364, -0.269237, -2.491752, 0, 0, 0, 1, 1,
-0.9866118, -1.194304, -2.068733, 0, 0, 0, 1, 1,
-0.9822099, -1.035432, -3.394493, 0, 0, 0, 1, 1,
-0.9766049, 1.823023, -0.100994, 0, 0, 0, 1, 1,
-0.9722629, 0.3127303, 0.9296409, 1, 1, 1, 1, 1,
-0.9643965, 0.2664019, -1.018003, 1, 1, 1, 1, 1,
-0.9623961, -0.9688983, -1.344785, 1, 1, 1, 1, 1,
-0.9601632, 0.8600532, -1.881344, 1, 1, 1, 1, 1,
-0.9584909, 2.232417, -1.108859, 1, 1, 1, 1, 1,
-0.9520175, 0.07541066, -1.123144, 1, 1, 1, 1, 1,
-0.9469775, 1.591739, -1.180653, 1, 1, 1, 1, 1,
-0.9456784, 1.274907, -1.598778, 1, 1, 1, 1, 1,
-0.9447061, -1.67168, -2.052374, 1, 1, 1, 1, 1,
-0.9419608, -0.7614889, -2.126207, 1, 1, 1, 1, 1,
-0.9402287, 0.5821791, -0.5129246, 1, 1, 1, 1, 1,
-0.9388051, -0.2617145, -0.4140488, 1, 1, 1, 1, 1,
-0.9337654, -0.723257, -5.146433, 1, 1, 1, 1, 1,
-0.9315554, 1.469105, -2.014798, 1, 1, 1, 1, 1,
-0.9302945, 0.8414325, -1.413978, 1, 1, 1, 1, 1,
-0.9297023, -0.3901333, -3.764053, 0, 0, 1, 1, 1,
-0.9176475, 0.443739, -0.9124073, 1, 0, 0, 1, 1,
-0.90827, 0.4623224, 0.295006, 1, 0, 0, 1, 1,
-0.9067215, -2.285961, -0.9684218, 1, 0, 0, 1, 1,
-0.9037094, -1.289169, -1.802323, 1, 0, 0, 1, 1,
-0.9025901, 0.06087646, -2.051143, 1, 0, 0, 1, 1,
-0.8987508, -0.8301815, -2.084167, 0, 0, 0, 1, 1,
-0.8819916, 0.5895122, 0.03030444, 0, 0, 0, 1, 1,
-0.8776488, -0.110361, -2.29848, 0, 0, 0, 1, 1,
-0.8774676, 0.9468874, -0.5733163, 0, 0, 0, 1, 1,
-0.8759962, -0.8489169, -2.772182, 0, 0, 0, 1, 1,
-0.8742117, -1.889761, -4.225143, 0, 0, 0, 1, 1,
-0.8731741, -0.1259047, -1.980419, 0, 0, 0, 1, 1,
-0.872955, -1.73694, -2.969816, 1, 1, 1, 1, 1,
-0.8710328, 0.7673529, -0.5064901, 1, 1, 1, 1, 1,
-0.8656926, 0.1017742, 0.2207093, 1, 1, 1, 1, 1,
-0.858411, -0.8558689, -2.781483, 1, 1, 1, 1, 1,
-0.8550252, -1.040322, -2.383287, 1, 1, 1, 1, 1,
-0.853976, -1.322578, -2.455453, 1, 1, 1, 1, 1,
-0.853039, -0.6021415, -2.530589, 1, 1, 1, 1, 1,
-0.8464907, -0.2264323, -0.1521128, 1, 1, 1, 1, 1,
-0.8429102, -1.252266, -3.830153, 1, 1, 1, 1, 1,
-0.8305212, -1.116831, -3.065372, 1, 1, 1, 1, 1,
-0.8284782, 0.4013835, 0.09962467, 1, 1, 1, 1, 1,
-0.8278928, 0.2947832, -0.6916937, 1, 1, 1, 1, 1,
-0.8273551, -0.622215, -2.710514, 1, 1, 1, 1, 1,
-0.8246379, 0.8584948, -1.431198, 1, 1, 1, 1, 1,
-0.8221044, 0.6366739, -1.392722, 1, 1, 1, 1, 1,
-0.8220482, 0.4805864, -0.3248879, 0, 0, 1, 1, 1,
-0.8152073, -0.4407072, -2.38155, 1, 0, 0, 1, 1,
-0.8150649, 1.036775, -0.8375715, 1, 0, 0, 1, 1,
-0.8145056, -1.102978, -2.958282, 1, 0, 0, 1, 1,
-0.8022932, 0.1056909, -2.043053, 1, 0, 0, 1, 1,
-0.801626, -2.701315, -3.084124, 1, 0, 0, 1, 1,
-0.796469, -1.572887, -3.218242, 0, 0, 0, 1, 1,
-0.7964522, -1.668058, -2.811268, 0, 0, 0, 1, 1,
-0.7961037, -1.774337, -2.082663, 0, 0, 0, 1, 1,
-0.7919492, 1.431098, -0.8072758, 0, 0, 0, 1, 1,
-0.7912722, 0.3962983, -0.4279416, 0, 0, 0, 1, 1,
-0.7894629, 0.3199694, -2.625328, 0, 0, 0, 1, 1,
-0.7817452, -0.2721691, -1.513231, 0, 0, 0, 1, 1,
-0.7717357, 0.2806118, -0.7036964, 1, 1, 1, 1, 1,
-0.7687328, -1.420044, -2.70086, 1, 1, 1, 1, 1,
-0.7582276, 0.1042771, -1.66144, 1, 1, 1, 1, 1,
-0.7537176, 0.8726852, 0.7871106, 1, 1, 1, 1, 1,
-0.7512621, 1.061631, -0.653833, 1, 1, 1, 1, 1,
-0.747328, -2.520028, -3.23183, 1, 1, 1, 1, 1,
-0.7423363, -0.01343493, -2.889948, 1, 1, 1, 1, 1,
-0.7414843, -1.032058, -1.932129, 1, 1, 1, 1, 1,
-0.7399708, 0.3120988, -0.1751441, 1, 1, 1, 1, 1,
-0.7385429, 0.4043253, -2.064109, 1, 1, 1, 1, 1,
-0.7370667, -0.8383546, -2.056613, 1, 1, 1, 1, 1,
-0.7349187, -0.7487072, -1.194453, 1, 1, 1, 1, 1,
-0.7289596, -0.1726623, -1.508773, 1, 1, 1, 1, 1,
-0.7242987, -0.7229356, -2.306233, 1, 1, 1, 1, 1,
-0.7198544, -1.797342, -1.559993, 1, 1, 1, 1, 1,
-0.7176093, 0.406596, -1.744681, 0, 0, 1, 1, 1,
-0.7117688, 0.8204888, -2.309451, 1, 0, 0, 1, 1,
-0.7071242, 1.083775, -0.4624285, 1, 0, 0, 1, 1,
-0.702451, 0.08218613, -0.3764458, 1, 0, 0, 1, 1,
-0.7016873, -1.186416, -2.912086, 1, 0, 0, 1, 1,
-0.6996487, -0.7306682, -1.278253, 1, 0, 0, 1, 1,
-0.6949993, 0.4316992, -0.8979729, 0, 0, 0, 1, 1,
-0.6884542, -0.9645479, -3.345256, 0, 0, 0, 1, 1,
-0.6857492, -1.517321, -3.77723, 0, 0, 0, 1, 1,
-0.6808697, -0.1032293, -0.6097342, 0, 0, 0, 1, 1,
-0.680075, 0.3761507, -1.216454, 0, 0, 0, 1, 1,
-0.6759036, -0.6455651, -2.106777, 0, 0, 0, 1, 1,
-0.6752564, 2.168006, -1.82779, 0, 0, 0, 1, 1,
-0.6726395, 0.2730242, -0.09690587, 1, 1, 1, 1, 1,
-0.6660836, -0.922582, -2.770077, 1, 1, 1, 1, 1,
-0.6657837, 1.956897, -0.9996994, 1, 1, 1, 1, 1,
-0.6611581, -0.894628, -2.435339, 1, 1, 1, 1, 1,
-0.6554615, -0.6481705, -2.157131, 1, 1, 1, 1, 1,
-0.6554171, -0.7536286, -1.342419, 1, 1, 1, 1, 1,
-0.6532131, 0.3223299, -0.3975453, 1, 1, 1, 1, 1,
-0.6517105, -0.3009063, -2.135672, 1, 1, 1, 1, 1,
-0.6493482, 1.382186, 1.589857, 1, 1, 1, 1, 1,
-0.6471319, 0.46762, -2.008215, 1, 1, 1, 1, 1,
-0.6439056, -0.4632896, -2.019324, 1, 1, 1, 1, 1,
-0.6422647, 1.574912, 1.30154, 1, 1, 1, 1, 1,
-0.6422302, -1.042348, -4.607688, 1, 1, 1, 1, 1,
-0.6419743, -0.4014756, -0.7269436, 1, 1, 1, 1, 1,
-0.6375852, 1.243911, 0.2911365, 1, 1, 1, 1, 1,
-0.6358714, -1.147579, -3.002238, 0, 0, 1, 1, 1,
-0.6348212, 0.5372608, -0.8819517, 1, 0, 0, 1, 1,
-0.6341096, 0.8106846, -1.619311, 1, 0, 0, 1, 1,
-0.6340368, -0.9675257, -3.224813, 1, 0, 0, 1, 1,
-0.6295325, 1.534952, 0.499509, 1, 0, 0, 1, 1,
-0.6243158, -0.1546571, -1.54828, 1, 0, 0, 1, 1,
-0.6217111, 0.040321, -1.248842, 0, 0, 0, 1, 1,
-0.6205828, 0.1404086, -0.5015777, 0, 0, 0, 1, 1,
-0.6130909, 0.332605, -2.027261, 0, 0, 0, 1, 1,
-0.6124993, -0.1941162, -0.06259757, 0, 0, 0, 1, 1,
-0.605204, 1.099267, -1.163922, 0, 0, 0, 1, 1,
-0.6026378, -0.3441184, -2.321942, 0, 0, 0, 1, 1,
-0.6008657, -1.875026, -1.694556, 0, 0, 0, 1, 1,
-0.596773, 0.02318281, -0.9331364, 1, 1, 1, 1, 1,
-0.5955124, 1.63572, 0.04547272, 1, 1, 1, 1, 1,
-0.5921907, 0.1887925, -2.567642, 1, 1, 1, 1, 1,
-0.5883446, 0.579421, -2.342311, 1, 1, 1, 1, 1,
-0.5866459, 1.251506, 0.1546773, 1, 1, 1, 1, 1,
-0.5863554, 0.08166609, -1.797076, 1, 1, 1, 1, 1,
-0.5856023, -0.7741281, -1.837093, 1, 1, 1, 1, 1,
-0.5785757, 1.173756, 0.6026712, 1, 1, 1, 1, 1,
-0.5761546, 1.699443, 0.6548853, 1, 1, 1, 1, 1,
-0.5753987, 1.35243, 1.301586, 1, 1, 1, 1, 1,
-0.5728353, 2.473258, -0.5390468, 1, 1, 1, 1, 1,
-0.5724836, 1.083785, -1.026266, 1, 1, 1, 1, 1,
-0.5715024, -1.139395, -3.12709, 1, 1, 1, 1, 1,
-0.5705138, 1.034281, -0.4012524, 1, 1, 1, 1, 1,
-0.5684102, -1.834947, -1.457347, 1, 1, 1, 1, 1,
-0.5673498, 1.78278, 0.9636604, 0, 0, 1, 1, 1,
-0.565889, -0.758563, -2.152868, 1, 0, 0, 1, 1,
-0.5652371, -1.036021, -4.250753, 1, 0, 0, 1, 1,
-0.5625764, -0.4743324, -1.964743, 1, 0, 0, 1, 1,
-0.5593531, 0.1149942, -1.855897, 1, 0, 0, 1, 1,
-0.5564767, -0.3758607, -0.5051663, 1, 0, 0, 1, 1,
-0.5554818, -1.03358, -2.889323, 0, 0, 0, 1, 1,
-0.5514281, 0.4241132, -2.2236, 0, 0, 0, 1, 1,
-0.5504308, 1.839905, -1.229234, 0, 0, 0, 1, 1,
-0.5482076, 1.782394, 1.719839, 0, 0, 0, 1, 1,
-0.5454413, 0.7849202, -1.385264, 0, 0, 0, 1, 1,
-0.5427839, 0.4000057, -0.448706, 0, 0, 0, 1, 1,
-0.5418521, -0.1751607, -1.957636, 0, 0, 0, 1, 1,
-0.5377674, 0.7053994, -0.7869532, 1, 1, 1, 1, 1,
-0.5337307, -0.9359388, -2.589191, 1, 1, 1, 1, 1,
-0.5305073, 0.01846836, -2.685718, 1, 1, 1, 1, 1,
-0.5266446, -0.9453437, -4.532016, 1, 1, 1, 1, 1,
-0.5180958, 0.08591951, -0.5701095, 1, 1, 1, 1, 1,
-0.5147433, -1.66515, -0.752134, 1, 1, 1, 1, 1,
-0.5136113, 0.931592, -1.116103, 1, 1, 1, 1, 1,
-0.513508, 0.6756538, -0.481438, 1, 1, 1, 1, 1,
-0.4972423, 1.197434, -0.8074066, 1, 1, 1, 1, 1,
-0.4884833, 0.3012037, 0.002026448, 1, 1, 1, 1, 1,
-0.4879557, -1.588849, -2.095257, 1, 1, 1, 1, 1,
-0.4843776, -0.4717675, -0.8549735, 1, 1, 1, 1, 1,
-0.483252, 1.298832, 0.1765539, 1, 1, 1, 1, 1,
-0.4823607, 0.9195395, 0.1182741, 1, 1, 1, 1, 1,
-0.4673247, -0.4082308, -0.08419725, 1, 1, 1, 1, 1,
-0.4640181, 2.062484, -0.6069158, 0, 0, 1, 1, 1,
-0.4587979, -1.836926, -1.546395, 1, 0, 0, 1, 1,
-0.4584769, 1.265857, 0.6794201, 1, 0, 0, 1, 1,
-0.4583652, 0.3058048, -1.701743, 1, 0, 0, 1, 1,
-0.4583201, 0.7128694, -0.5122749, 1, 0, 0, 1, 1,
-0.4578868, 0.784246, -1.259175, 1, 0, 0, 1, 1,
-0.4558882, 0.4469948, -1.023094, 0, 0, 0, 1, 1,
-0.4484921, -0.653177, -1.424791, 0, 0, 0, 1, 1,
-0.4453648, -2.291178, -2.945967, 0, 0, 0, 1, 1,
-0.4406276, 0.5332026, -1.752009, 0, 0, 0, 1, 1,
-0.4391166, -0.7918895, -3.981249, 0, 0, 0, 1, 1,
-0.4386208, 0.8867353, -0.4190671, 0, 0, 0, 1, 1,
-0.4375772, -1.9677, -1.143515, 0, 0, 0, 1, 1,
-0.4355997, -0.7084333, -1.227835, 1, 1, 1, 1, 1,
-0.427159, -0.2428951, -1.992736, 1, 1, 1, 1, 1,
-0.4264042, 0.7670308, 1.705833, 1, 1, 1, 1, 1,
-0.4241061, -0.9090523, -0.9537063, 1, 1, 1, 1, 1,
-0.4235713, 1.421616, -1.576634, 1, 1, 1, 1, 1,
-0.4194842, 2.194566, -0.9274581, 1, 1, 1, 1, 1,
-0.4174101, -0.7774361, -1.913247, 1, 1, 1, 1, 1,
-0.4135195, 0.5585837, 0.6376346, 1, 1, 1, 1, 1,
-0.4116659, 0.08531157, -0.7355943, 1, 1, 1, 1, 1,
-0.4092156, 0.1388254, -2.161139, 1, 1, 1, 1, 1,
-0.4090633, 0.1364483, -2.047526, 1, 1, 1, 1, 1,
-0.4080935, -0.8453717, -3.971942, 1, 1, 1, 1, 1,
-0.4076188, -0.1068361, -0.8747491, 1, 1, 1, 1, 1,
-0.4064398, 0.7554228, -1.2983, 1, 1, 1, 1, 1,
-0.405527, -2.361784, -3.478081, 1, 1, 1, 1, 1,
-0.4047678, -1.199218, -4.01996, 0, 0, 1, 1, 1,
-0.4001275, -0.4868258, -3.84525, 1, 0, 0, 1, 1,
-0.3888704, -0.5122729, -1.809598, 1, 0, 0, 1, 1,
-0.3847921, -0.4324905, -2.299154, 1, 0, 0, 1, 1,
-0.3786818, 0.5445758, -0.6731071, 1, 0, 0, 1, 1,
-0.3778894, 0.430927, -1.14328, 1, 0, 0, 1, 1,
-0.365805, 0.2514999, -3.581477, 0, 0, 0, 1, 1,
-0.3634472, 1.12967, 0.3443848, 0, 0, 0, 1, 1,
-0.3634217, 0.1528454, -0.363014, 0, 0, 0, 1, 1,
-0.361203, 0.2540313, -1.867711, 0, 0, 0, 1, 1,
-0.3607103, -0.2705129, -0.3355468, 0, 0, 0, 1, 1,
-0.3591258, 0.1681385, -2.773397, 0, 0, 0, 1, 1,
-0.3552329, -0.4161343, -2.341113, 0, 0, 0, 1, 1,
-0.3533452, -0.7393244, -4.272237, 1, 1, 1, 1, 1,
-0.3523823, -0.1549675, -2.793608, 1, 1, 1, 1, 1,
-0.3519462, -1.486697, -4.000209, 1, 1, 1, 1, 1,
-0.3486433, 0.617509, -0.9672494, 1, 1, 1, 1, 1,
-0.3465212, 0.3186962, -1.021566, 1, 1, 1, 1, 1,
-0.346506, 0.5628479, -0.3305334, 1, 1, 1, 1, 1,
-0.343704, 0.09714741, -1.853244, 1, 1, 1, 1, 1,
-0.34021, -0.9728278, -2.809591, 1, 1, 1, 1, 1,
-0.3375206, 0.9270374, 1.068503, 1, 1, 1, 1, 1,
-0.3365167, -1.073891, -5.126348, 1, 1, 1, 1, 1,
-0.3336505, -2.220483, -2.082737, 1, 1, 1, 1, 1,
-0.3261542, 0.6543997, -1.393997, 1, 1, 1, 1, 1,
-0.3222537, 0.1119256, -1.075255, 1, 1, 1, 1, 1,
-0.3219206, -0.2904838, -2.939419, 1, 1, 1, 1, 1,
-0.3203929, -1.23114, -2.823097, 1, 1, 1, 1, 1,
-0.3154122, 1.629027, -0.6592012, 0, 0, 1, 1, 1,
-0.3129661, 0.1586295, 0.6065211, 1, 0, 0, 1, 1,
-0.312803, -1.749235, -3.592439, 1, 0, 0, 1, 1,
-0.3077521, 0.8566232, -0.1529264, 1, 0, 0, 1, 1,
-0.2997278, -0.1910379, -2.433272, 1, 0, 0, 1, 1,
-0.2973918, -0.4194708, -1.249661, 1, 0, 0, 1, 1,
-0.2960315, -0.398804, -3.581227, 0, 0, 0, 1, 1,
-0.295431, -1.514667, -1.875469, 0, 0, 0, 1, 1,
-0.2877926, -0.2845803, -1.271079, 0, 0, 0, 1, 1,
-0.2821004, -0.8455794, -1.408791, 0, 0, 0, 1, 1,
-0.2773718, -1.558885, -4.516153, 0, 0, 0, 1, 1,
-0.2742138, -0.07269038, -0.6493943, 0, 0, 0, 1, 1,
-0.2714057, -0.6137633, -1.827302, 0, 0, 0, 1, 1,
-0.2690462, -1.732961, -1.797848, 1, 1, 1, 1, 1,
-0.2681537, -1.850277, -3.017776, 1, 1, 1, 1, 1,
-0.2654604, 0.02347511, -1.850605, 1, 1, 1, 1, 1,
-0.2618347, 0.1719559, -1.153882, 1, 1, 1, 1, 1,
-0.2605207, -0.5029797, -3.013022, 1, 1, 1, 1, 1,
-0.2557534, 0.08108103, -1.086897, 1, 1, 1, 1, 1,
-0.2502203, -1.377736, -2.235065, 1, 1, 1, 1, 1,
-0.2501585, -0.6681964, -3.387185, 1, 1, 1, 1, 1,
-0.2482565, -0.5402735, -3.249171, 1, 1, 1, 1, 1,
-0.2452333, 1.308581, -0.1023584, 1, 1, 1, 1, 1,
-0.2440182, -0.9352669, -2.349861, 1, 1, 1, 1, 1,
-0.2439902, -0.4028512, -2.651845, 1, 1, 1, 1, 1,
-0.2349466, 1.561576, 1.585081, 1, 1, 1, 1, 1,
-0.2343202, -1.101225, -2.022178, 1, 1, 1, 1, 1,
-0.2321642, 0.9895594, -1.278212, 1, 1, 1, 1, 1,
-0.2297189, -0.3187473, -4.001279, 0, 0, 1, 1, 1,
-0.2295104, -0.03526086, -1.070167, 1, 0, 0, 1, 1,
-0.2261569, -0.5771682, -2.585376, 1, 0, 0, 1, 1,
-0.2165399, 0.931493, 1.217399, 1, 0, 0, 1, 1,
-0.215416, -1.146553, -2.428319, 1, 0, 0, 1, 1,
-0.2153351, -0.4513236, -2.480037, 1, 0, 0, 1, 1,
-0.2133589, 1.591054, -0.8215345, 0, 0, 0, 1, 1,
-0.2087678, -0.8825607, -3.610196, 0, 0, 0, 1, 1,
-0.2085567, -1.070067, -3.577812, 0, 0, 0, 1, 1,
-0.2031015, -0.6138948, -3.016048, 0, 0, 0, 1, 1,
-0.2023313, -1.397157, -2.924618, 0, 0, 0, 1, 1,
-0.1984971, -1.263882, -2.504122, 0, 0, 0, 1, 1,
-0.1981073, -0.9443941, -1.384585, 0, 0, 0, 1, 1,
-0.1963554, -1.303196, -3.800895, 1, 1, 1, 1, 1,
-0.1893478, 0.1471093, -1.730257, 1, 1, 1, 1, 1,
-0.1869263, 0.05390076, -3.120929, 1, 1, 1, 1, 1,
-0.1855214, -1.5652, -3.396995, 1, 1, 1, 1, 1,
-0.1849294, -1.407126, -3.100065, 1, 1, 1, 1, 1,
-0.1819989, 0.2960282, -0.3693036, 1, 1, 1, 1, 1,
-0.1760444, -0.7408705, -1.337776, 1, 1, 1, 1, 1,
-0.1758947, 3.203513, -2.114839, 1, 1, 1, 1, 1,
-0.1742326, -0.9325563, -3.670678, 1, 1, 1, 1, 1,
-0.1685897, 0.4772817, 0.6710028, 1, 1, 1, 1, 1,
-0.1662923, -0.47723, -2.558808, 1, 1, 1, 1, 1,
-0.1658506, 0.3786458, -0.1234112, 1, 1, 1, 1, 1,
-0.1651305, 0.1382259, -1.05485, 1, 1, 1, 1, 1,
-0.1646964, 0.8779336, 0.9351279, 1, 1, 1, 1, 1,
-0.1582642, 0.4246283, 0.002624347, 1, 1, 1, 1, 1,
-0.1523979, 0.2791987, -0.844891, 0, 0, 1, 1, 1,
-0.1520977, 1.410075, -1.889845, 1, 0, 0, 1, 1,
-0.1518755, 1.17221, 0.2303959, 1, 0, 0, 1, 1,
-0.1449469, -2.144042, -3.483021, 1, 0, 0, 1, 1,
-0.1358734, -1.182454, -2.7886, 1, 0, 0, 1, 1,
-0.1280364, -0.1558528, -2.142119, 1, 0, 0, 1, 1,
-0.1276365, 0.3453735, -0.7944652, 0, 0, 0, 1, 1,
-0.1270886, -0.4534239, -1.999972, 0, 0, 0, 1, 1,
-0.1263798, -0.3014749, -3.065979, 0, 0, 0, 1, 1,
-0.1249365, 0.4102912, -0.07770016, 0, 0, 0, 1, 1,
-0.1223201, 1.092845, -0.6357671, 0, 0, 0, 1, 1,
-0.1216802, 0.8414028, -0.5237073, 0, 0, 0, 1, 1,
-0.1214693, 0.09930915, -2.777524, 0, 0, 0, 1, 1,
-0.1209581, 1.611238, 1.009382, 1, 1, 1, 1, 1,
-0.1152038, -0.0347774, -1.685312, 1, 1, 1, 1, 1,
-0.1151007, 0.7611134, -1.232704, 1, 1, 1, 1, 1,
-0.11507, -0.5488403, -1.627294, 1, 1, 1, 1, 1,
-0.1145647, -0.8062325, -2.601337, 1, 1, 1, 1, 1,
-0.1102457, -0.8405301, -4.262557, 1, 1, 1, 1, 1,
-0.1095196, -1.677304, -3.663083, 1, 1, 1, 1, 1,
-0.1077733, -1.09606, -1.498316, 1, 1, 1, 1, 1,
-0.1029757, 0.2542454, 0.9795741, 1, 1, 1, 1, 1,
-0.102428, 0.8104461, -0.3625799, 1, 1, 1, 1, 1,
-0.09407791, 0.3982944, 0.08553555, 1, 1, 1, 1, 1,
-0.08879448, 0.9505054, -0.3184355, 1, 1, 1, 1, 1,
-0.0864559, 0.3003154, -2.700386, 1, 1, 1, 1, 1,
-0.08351607, 0.381253, -0.199244, 1, 1, 1, 1, 1,
-0.08196457, 0.513888, -0.3240482, 1, 1, 1, 1, 1,
-0.0813913, 1.332873, 1.957667, 0, 0, 1, 1, 1,
-0.07825074, 0.04302255, -0.9061025, 1, 0, 0, 1, 1,
-0.07607523, -0.3264195, -3.701967, 1, 0, 0, 1, 1,
-0.07606557, -0.8262755, -3.245069, 1, 0, 0, 1, 1,
-0.07521059, 0.5333688, 0.5830712, 1, 0, 0, 1, 1,
-0.07369638, 0.790431, 1.241731, 1, 0, 0, 1, 1,
-0.07198028, -0.153124, -2.715779, 0, 0, 0, 1, 1,
-0.06917299, 1.081219, 0.897884, 0, 0, 0, 1, 1,
-0.06916969, -1.244341, -3.272715, 0, 0, 0, 1, 1,
-0.06875324, 0.9492372, 0.4261813, 0, 0, 0, 1, 1,
-0.05880059, 0.9401401, 1.025173, 0, 0, 0, 1, 1,
-0.05600754, -0.2768698, -4.045099, 0, 0, 0, 1, 1,
-0.05141281, -1.477538, -5.262341, 0, 0, 0, 1, 1,
-0.05064161, 0.2240102, 0.02590986, 1, 1, 1, 1, 1,
-0.04723949, -1.854781, -1.154652, 1, 1, 1, 1, 1,
-0.04411391, -0.6449637, -1.731549, 1, 1, 1, 1, 1,
-0.04168038, -0.296989, -2.11279, 1, 1, 1, 1, 1,
-0.03651404, 0.9385334, -1.082417, 1, 1, 1, 1, 1,
-0.03645638, 0.07488937, 0.3473349, 1, 1, 1, 1, 1,
-0.03628823, 0.3419487, 0.1528717, 1, 1, 1, 1, 1,
-0.03533436, -1.603037, -3.727478, 1, 1, 1, 1, 1,
-0.02667401, 1.256292, -2.281462, 1, 1, 1, 1, 1,
-0.02588001, 0.1947039, 0.2563517, 1, 1, 1, 1, 1,
-0.02579296, -0.7516248, -2.473084, 1, 1, 1, 1, 1,
-0.02065343, -1.135967, -0.5856215, 1, 1, 1, 1, 1,
-0.01952143, -0.2944763, -3.461205, 1, 1, 1, 1, 1,
-0.019231, -1.007702, -4.725566, 1, 1, 1, 1, 1,
-0.01539867, 0.7422171, -0.06278726, 1, 1, 1, 1, 1,
-0.01512822, 1.577397, 0.4198381, 0, 0, 1, 1, 1,
-0.01088729, -0.09419477, -3.075076, 1, 0, 0, 1, 1,
-0.0088232, -1.217241, -3.37599, 1, 0, 0, 1, 1,
-0.007016842, 1.520171, -0.4260414, 1, 0, 0, 1, 1,
-0.003953953, 0.9090626, -0.5519475, 1, 0, 0, 1, 1,
-0.001086702, 1.508294, -0.8852153, 1, 0, 0, 1, 1,
0.004580575, -0.4020188, 0.5151461, 0, 0, 0, 1, 1,
0.005505185, -0.4238166, 3.329812, 0, 0, 0, 1, 1,
0.01096406, -1.746251, 3.695147, 0, 0, 0, 1, 1,
0.01245621, 0.8116208, -0.4713169, 0, 0, 0, 1, 1,
0.01275672, -0.4235848, 2.65031, 0, 0, 0, 1, 1,
0.01281837, -0.400126, 5.445269, 0, 0, 0, 1, 1,
0.01431791, -0.3607087, 3.54842, 0, 0, 0, 1, 1,
0.01871893, 2.268097, -0.5877923, 1, 1, 1, 1, 1,
0.01902203, -0.9756466, 4.199237, 1, 1, 1, 1, 1,
0.01913377, 0.1576284, 1.09463, 1, 1, 1, 1, 1,
0.01976677, -0.08009472, 4.052699, 1, 1, 1, 1, 1,
0.02337919, 0.849683, 0.7701691, 1, 1, 1, 1, 1,
0.0242804, 1.012304, 0.004315902, 1, 1, 1, 1, 1,
0.02508493, 1.163441, -0.7458819, 1, 1, 1, 1, 1,
0.02634368, -1.251738, 2.217549, 1, 1, 1, 1, 1,
0.02904618, -0.7104115, 2.352407, 1, 1, 1, 1, 1,
0.03170778, -0.6273174, 4.331101, 1, 1, 1, 1, 1,
0.03461531, 0.04773686, 1.691738, 1, 1, 1, 1, 1,
0.03670418, 0.6935433, -0.3772531, 1, 1, 1, 1, 1,
0.04032772, -1.411886, 3.029065, 1, 1, 1, 1, 1,
0.05076822, 0.03828996, 1.105519, 1, 1, 1, 1, 1,
0.05155119, -0.05818772, 2.610943, 1, 1, 1, 1, 1,
0.05166229, 0.1709846, -0.6926607, 0, 0, 1, 1, 1,
0.05282783, 0.6761908, 0.08328407, 1, 0, 0, 1, 1,
0.05681705, -1.656523, 4.0813, 1, 0, 0, 1, 1,
0.05698813, 1.096585, 1.906661, 1, 0, 0, 1, 1,
0.05934537, -1.03293, 2.647832, 1, 0, 0, 1, 1,
0.06262755, -2.132437, 2.33753, 1, 0, 0, 1, 1,
0.06411798, 1.374685, 0.4770465, 0, 0, 0, 1, 1,
0.06490422, 0.1801884, -1.180719, 0, 0, 0, 1, 1,
0.06554918, 0.4249777, 0.4020513, 0, 0, 0, 1, 1,
0.06733223, -0.3345896, 3.355221, 0, 0, 0, 1, 1,
0.0695193, -0.9417172, 3.569621, 0, 0, 0, 1, 1,
0.07074279, -0.7506166, 2.341223, 0, 0, 0, 1, 1,
0.07178994, 0.06510665, 2.007376, 0, 0, 0, 1, 1,
0.0722719, 1.145691, -1.892733, 1, 1, 1, 1, 1,
0.0733068, -0.3599541, 3.145333, 1, 1, 1, 1, 1,
0.07981168, 0.9719732, 1.167198, 1, 1, 1, 1, 1,
0.08097205, -0.362912, 3.117692, 1, 1, 1, 1, 1,
0.08130161, 0.2139429, 1.683043, 1, 1, 1, 1, 1,
0.08296578, -1.830437, 4.779119, 1, 1, 1, 1, 1,
0.08469699, 0.7051212, -0.1962845, 1, 1, 1, 1, 1,
0.08661374, 0.2501696, 0.4282532, 1, 1, 1, 1, 1,
0.08865274, -1.498904, 2.725043, 1, 1, 1, 1, 1,
0.09241742, -1.532485, 3.861866, 1, 1, 1, 1, 1,
0.0936266, 0.1525028, -1.392378, 1, 1, 1, 1, 1,
0.09455211, -0.7611906, 1.582021, 1, 1, 1, 1, 1,
0.09458385, -0.08730128, 4.362755, 1, 1, 1, 1, 1,
0.09552727, 1.592635, -1.347115, 1, 1, 1, 1, 1,
0.09629257, 0.4117672, -1.275535, 1, 1, 1, 1, 1,
0.1011204, -1.033669, 2.697512, 0, 0, 1, 1, 1,
0.1011908, -0.2262413, 2.878094, 1, 0, 0, 1, 1,
0.1028809, 0.8354681, 0.9602249, 1, 0, 0, 1, 1,
0.1036714, 0.4471651, 1.517829, 1, 0, 0, 1, 1,
0.1087408, 1.285029, -1.762591, 1, 0, 0, 1, 1,
0.109333, -1.470586, 5.417055, 1, 0, 0, 1, 1,
0.1110394, 0.2751219, 2.09577, 0, 0, 0, 1, 1,
0.1139301, 0.1990493, -0.09342627, 0, 0, 0, 1, 1,
0.1141423, -0.914327, 2.460168, 0, 0, 0, 1, 1,
0.1160047, -0.469779, 3.169351, 0, 0, 0, 1, 1,
0.1188613, -0.4810595, 4.663138, 0, 0, 0, 1, 1,
0.1195017, 1.509256, 1.004773, 0, 0, 0, 1, 1,
0.1198982, 1.855137, 1.440349, 0, 0, 0, 1, 1,
0.1223631, -0.779924, 2.298988, 1, 1, 1, 1, 1,
0.1224846, 0.8648618, 0.08200274, 1, 1, 1, 1, 1,
0.1245984, 1.671127, -0.01859923, 1, 1, 1, 1, 1,
0.1271442, -0.836358, 2.529982, 1, 1, 1, 1, 1,
0.1286891, -1.11735, 3.91684, 1, 1, 1, 1, 1,
0.136802, -1.255148, 2.570102, 1, 1, 1, 1, 1,
0.1442836, 1.994102, 1.414849, 1, 1, 1, 1, 1,
0.1459583, -0.6192641, 2.602867, 1, 1, 1, 1, 1,
0.1488242, 0.4187343, 0.9453824, 1, 1, 1, 1, 1,
0.1490474, 0.4142139, 1.062179, 1, 1, 1, 1, 1,
0.1519564, 0.01689636, 0.5416726, 1, 1, 1, 1, 1,
0.152489, 1.126572, 0.8921146, 1, 1, 1, 1, 1,
0.1530256, -0.2507617, 2.401222, 1, 1, 1, 1, 1,
0.1541059, -0.8922956, 2.590978, 1, 1, 1, 1, 1,
0.1552279, 0.9020151, 0.3424744, 1, 1, 1, 1, 1,
0.1552283, 0.728986, -0.173461, 0, 0, 1, 1, 1,
0.1571844, -2.727324, 3.830151, 1, 0, 0, 1, 1,
0.1619777, 3.484854, 1.056816, 1, 0, 0, 1, 1,
0.1622987, 1.148032, -1.138841, 1, 0, 0, 1, 1,
0.1647965, 1.156456, 1.259902, 1, 0, 0, 1, 1,
0.1662504, 0.6552255, -1.280952, 1, 0, 0, 1, 1,
0.1670236, 0.02548212, 1.590626, 0, 0, 0, 1, 1,
0.1678053, -0.2333886, 2.42594, 0, 0, 0, 1, 1,
0.1761743, 0.7428377, 0.4026074, 0, 0, 0, 1, 1,
0.1769883, 1.187214, -0.353705, 0, 0, 0, 1, 1,
0.1796209, -1.710197, 1.452722, 0, 0, 0, 1, 1,
0.1808394, -2.176682, 4.141784, 0, 0, 0, 1, 1,
0.1816311, 0.5662087, -0.1548595, 0, 0, 0, 1, 1,
0.1850563, 0.2455065, 2.084593, 1, 1, 1, 1, 1,
0.1850705, 0.3973703, -0.9657164, 1, 1, 1, 1, 1,
0.1851116, 1.088749, 0.6444712, 1, 1, 1, 1, 1,
0.1853359, -0.519159, 3.87199, 1, 1, 1, 1, 1,
0.1857419, -0.0957965, 2.439294, 1, 1, 1, 1, 1,
0.1878461, 2.095003, 0.5492175, 1, 1, 1, 1, 1,
0.1896794, -0.8437353, 1.247605, 1, 1, 1, 1, 1,
0.1903798, -1.099512, 4.360783, 1, 1, 1, 1, 1,
0.1920189, 0.2633159, 1.308555, 1, 1, 1, 1, 1,
0.1959934, 0.3782555, -0.09279248, 1, 1, 1, 1, 1,
0.1975795, -0.2153279, 1.373584, 1, 1, 1, 1, 1,
0.1985462, -1.544192, 2.673039, 1, 1, 1, 1, 1,
0.1986154, 0.3503706, -0.658432, 1, 1, 1, 1, 1,
0.1994868, 0.6754291, -0.2410173, 1, 1, 1, 1, 1,
0.2007141, -0.01377446, 2.466002, 1, 1, 1, 1, 1,
0.2014927, -2.165756, 4.053948, 0, 0, 1, 1, 1,
0.2015287, -0.2819952, 2.229129, 1, 0, 0, 1, 1,
0.2072945, 0.2433766, 1.924215, 1, 0, 0, 1, 1,
0.2100641, -0.328025, 4.097923, 1, 0, 0, 1, 1,
0.2118285, 0.5069289, 1.2397, 1, 0, 0, 1, 1,
0.2140395, 1.38305, 0.6426786, 1, 0, 0, 1, 1,
0.2202816, 0.9736812, 0.422241, 0, 0, 0, 1, 1,
0.220615, -0.9334189, 3.769254, 0, 0, 0, 1, 1,
0.2274437, 1.568223, -0.4484996, 0, 0, 0, 1, 1,
0.2294916, 0.708757, 0.2191696, 0, 0, 0, 1, 1,
0.2299003, 0.125363, 0.862472, 0, 0, 0, 1, 1,
0.2299612, -0.1409102, 2.129568, 0, 0, 0, 1, 1,
0.2351092, 0.05134198, 0.6764861, 0, 0, 0, 1, 1,
0.2352927, 0.2562871, 1.625167, 1, 1, 1, 1, 1,
0.2372012, 1.890768, 0.9776636, 1, 1, 1, 1, 1,
0.2372877, -0.8777825, 2.575837, 1, 1, 1, 1, 1,
0.2402041, -0.7166832, 2.984238, 1, 1, 1, 1, 1,
0.2484406, 0.1660063, 0.2483819, 1, 1, 1, 1, 1,
0.2493974, 1.148195, -0.4953034, 1, 1, 1, 1, 1,
0.2505247, -0.9475381, 3.106058, 1, 1, 1, 1, 1,
0.2533389, -0.7773623, 1.836866, 1, 1, 1, 1, 1,
0.2538152, 0.4489783, 0.4511029, 1, 1, 1, 1, 1,
0.2622201, 0.7472331, 0.4288729, 1, 1, 1, 1, 1,
0.2652044, 0.8403412, 1.464817, 1, 1, 1, 1, 1,
0.2678588, 0.8004727, -0.2494023, 1, 1, 1, 1, 1,
0.2678717, 0.5757871, -0.6481587, 1, 1, 1, 1, 1,
0.2688816, 0.8850535, -0.2633118, 1, 1, 1, 1, 1,
0.2707564, -0.1784528, 3.443966, 1, 1, 1, 1, 1,
0.2715058, -1.978799, 2.771429, 0, 0, 1, 1, 1,
0.2760442, -0.7407147, 2.958869, 1, 0, 0, 1, 1,
0.2785665, -0.3419591, 2.109296, 1, 0, 0, 1, 1,
0.2791029, -0.6314533, 2.19479, 1, 0, 0, 1, 1,
0.283803, 0.02506559, -0.5534356, 1, 0, 0, 1, 1,
0.2838603, -0.1040589, 2.999728, 1, 0, 0, 1, 1,
0.284511, 2.464008, -0.831978, 0, 0, 0, 1, 1,
0.285251, -1.301022, 3.731519, 0, 0, 0, 1, 1,
0.2901847, -0.3550915, 3.53446, 0, 0, 0, 1, 1,
0.2904319, -1.004529, 3.134352, 0, 0, 0, 1, 1,
0.2906285, -0.4520727, 1.778548, 0, 0, 0, 1, 1,
0.2906455, -0.3546116, 2.669173, 0, 0, 0, 1, 1,
0.2908, 0.5886246, -0.6405894, 0, 0, 0, 1, 1,
0.2925017, -0.5433535, 3.159988, 1, 1, 1, 1, 1,
0.2958281, -0.1444177, 0.6552221, 1, 1, 1, 1, 1,
0.298, 0.8632644, -0.1350863, 1, 1, 1, 1, 1,
0.3041342, 1.870684, 0.01156538, 1, 1, 1, 1, 1,
0.3095044, -1.251769, 1.083759, 1, 1, 1, 1, 1,
0.3129213, -0.7877735, 3.178457, 1, 1, 1, 1, 1,
0.3131762, -0.7166635, 3.999005, 1, 1, 1, 1, 1,
0.3158321, -0.1709866, 3.127058, 1, 1, 1, 1, 1,
0.3171817, 0.647352, -0.4461137, 1, 1, 1, 1, 1,
0.3179156, 0.5153172, 1.451123, 1, 1, 1, 1, 1,
0.3248869, 1.072911, -0.9635767, 1, 1, 1, 1, 1,
0.3261549, -1.468285, 4.231255, 1, 1, 1, 1, 1,
0.3262835, 0.3354894, -0.7060083, 1, 1, 1, 1, 1,
0.3306491, -0.4328125, 0.03208286, 1, 1, 1, 1, 1,
0.3392234, -0.3726277, 2.654186, 1, 1, 1, 1, 1,
0.3402991, -0.9660498, 3.597695, 0, 0, 1, 1, 1,
0.3450435, 0.7787508, 0.01212399, 1, 0, 0, 1, 1,
0.3452378, -0.1804141, 1.190892, 1, 0, 0, 1, 1,
0.3455941, 1.607513, 0.1970296, 1, 0, 0, 1, 1,
0.3477087, 1.084945, -0.1129314, 1, 0, 0, 1, 1,
0.3481143, -0.2504191, 2.581595, 1, 0, 0, 1, 1,
0.3491965, 0.2378344, 0.9355542, 0, 0, 0, 1, 1,
0.3499299, 0.3838882, 0.4563791, 0, 0, 0, 1, 1,
0.3520662, -1.041512, 4.531813, 0, 0, 0, 1, 1,
0.3527785, 0.9511778, -0.2381589, 0, 0, 0, 1, 1,
0.3592457, -0.5457001, 3.938086, 0, 0, 0, 1, 1,
0.3641359, 1.207801, 0.2338054, 0, 0, 0, 1, 1,
0.367037, -1.18954, 4.365498, 0, 0, 0, 1, 1,
0.3698867, 0.4534729, 1.866114, 1, 1, 1, 1, 1,
0.3728679, 0.138438, 0.4294089, 1, 1, 1, 1, 1,
0.3833091, -0.112938, 1.981241, 1, 1, 1, 1, 1,
0.38508, -1.259797, 1.671245, 1, 1, 1, 1, 1,
0.3871453, 1.286551, 1.022432, 1, 1, 1, 1, 1,
0.3876657, -0.3535277, 1.616775, 1, 1, 1, 1, 1,
0.3896293, -0.461876, 2.205337, 1, 1, 1, 1, 1,
0.3901703, 0.3725226, 1.446602, 1, 1, 1, 1, 1,
0.3916306, -0.667824, 3.835063, 1, 1, 1, 1, 1,
0.3926815, 1.466684, 0.5524285, 1, 1, 1, 1, 1,
0.3942877, 2.45786, 0.1809075, 1, 1, 1, 1, 1,
0.3953344, 0.2646722, 1.53641, 1, 1, 1, 1, 1,
0.3965531, -0.3201261, 2.796751, 1, 1, 1, 1, 1,
0.3971409, 0.2084387, 1.748459, 1, 1, 1, 1, 1,
0.4056594, -1.367505, 1.536983, 1, 1, 1, 1, 1,
0.41284, -1.118083, 2.75964, 0, 0, 1, 1, 1,
0.4144255, 0.4209605, -0.3134509, 1, 0, 0, 1, 1,
0.4151098, -1.267807, 2.272716, 1, 0, 0, 1, 1,
0.4161258, -1.061989, 2.694555, 1, 0, 0, 1, 1,
0.4203985, -0.8020453, 2.186411, 1, 0, 0, 1, 1,
0.4279256, 0.4706375, -0.3953267, 1, 0, 0, 1, 1,
0.4303099, 1.033791, 0.3300454, 0, 0, 0, 1, 1,
0.4324606, -0.6435605, 0.6075915, 0, 0, 0, 1, 1,
0.4341399, -0.03010623, 1.140129, 0, 0, 0, 1, 1,
0.4372492, 0.5216091, 0.9262459, 0, 0, 0, 1, 1,
0.4380232, 0.3746399, -0.5898933, 0, 0, 0, 1, 1,
0.4384515, 0.2892265, 0.9125476, 0, 0, 0, 1, 1,
0.4395005, 0.7012401, -1.005519, 0, 0, 0, 1, 1,
0.4400318, 0.1187355, 1.052619, 1, 1, 1, 1, 1,
0.4409319, -0.2623999, 0.6235701, 1, 1, 1, 1, 1,
0.4427576, -0.462902, 2.441168, 1, 1, 1, 1, 1,
0.4498342, 0.2379793, 1.360609, 1, 1, 1, 1, 1,
0.4500312, 0.7751057, 1.653954, 1, 1, 1, 1, 1,
0.454129, 0.5228525, 0.873967, 1, 1, 1, 1, 1,
0.4582058, -1.272717, 1.745601, 1, 1, 1, 1, 1,
0.4583496, -0.01849535, 2.184212, 1, 1, 1, 1, 1,
0.4658864, 0.8436225, 1.687435, 1, 1, 1, 1, 1,
0.482272, 0.001217503, 1.048063, 1, 1, 1, 1, 1,
0.4844968, 0.7964245, 0.2672132, 1, 1, 1, 1, 1,
0.4923919, 1.405915, -2.057781, 1, 1, 1, 1, 1,
0.4931106, 0.8125055, -1.057241, 1, 1, 1, 1, 1,
0.494918, -0.389964, 2.882936, 1, 1, 1, 1, 1,
0.4980048, 1.104278, -0.6750609, 1, 1, 1, 1, 1,
0.5016367, 2.163895, 0.2398963, 0, 0, 1, 1, 1,
0.5029285, -1.760119, 1.288637, 1, 0, 0, 1, 1,
0.5121178, 0.8539609, 0.6724203, 1, 0, 0, 1, 1,
0.5127162, 1.034907, 0.2983397, 1, 0, 0, 1, 1,
0.518205, 0.432331, 0.6772773, 1, 0, 0, 1, 1,
0.5193041, -0.3399972, 4.412886, 1, 0, 0, 1, 1,
0.5288637, -2.236923, 5.642678, 0, 0, 0, 1, 1,
0.5290099, 0.7623407, -0.9204876, 0, 0, 0, 1, 1,
0.5295455, 0.2389268, 0.8614851, 0, 0, 0, 1, 1,
0.5307119, -1.534431, 2.01454, 0, 0, 0, 1, 1,
0.5317671, 1.289869, 0.06971725, 0, 0, 0, 1, 1,
0.539481, -0.299975, 2.428004, 0, 0, 0, 1, 1,
0.5403142, 1.057865, 0.5146278, 0, 0, 0, 1, 1,
0.5445585, -0.7610784, -0.6139241, 1, 1, 1, 1, 1,
0.5462943, -1.909794, 2.559004, 1, 1, 1, 1, 1,
0.54649, 0.3084266, 1.572086, 1, 1, 1, 1, 1,
0.5465753, 0.9571129, 0.7028204, 1, 1, 1, 1, 1,
0.5517037, -0.6356103, 3.41241, 1, 1, 1, 1, 1,
0.5536593, -0.319085, 2.675348, 1, 1, 1, 1, 1,
0.5547025, -0.5827793, 1.6239, 1, 1, 1, 1, 1,
0.5547766, -1.985099, 4.340353, 1, 1, 1, 1, 1,
0.5549442, 1.43165, -1.98574, 1, 1, 1, 1, 1,
0.5550609, -0.4791848, 0.1317153, 1, 1, 1, 1, 1,
0.5558607, 0.1897948, 0.5435963, 1, 1, 1, 1, 1,
0.5561242, 0.5900929, 0.8130015, 1, 1, 1, 1, 1,
0.5568544, 0.3607573, 0.4038596, 1, 1, 1, 1, 1,
0.5613855, 0.5750719, -0.6289712, 1, 1, 1, 1, 1,
0.5668169, -1.196306, 2.903542, 1, 1, 1, 1, 1,
0.5681484, -1.1714, 1.927786, 0, 0, 1, 1, 1,
0.5703086, 0.6286718, -0.5481834, 1, 0, 0, 1, 1,
0.5706341, -0.2242164, 0.9394746, 1, 0, 0, 1, 1,
0.5706412, 0.218196, 0.4309143, 1, 0, 0, 1, 1,
0.5713828, 0.8755009, 1.004567, 1, 0, 0, 1, 1,
0.571518, -0.7339703, 1.479346, 1, 0, 0, 1, 1,
0.5791278, 0.1036867, 1.231911, 0, 0, 0, 1, 1,
0.5799029, -0.9184576, 0.9350078, 0, 0, 0, 1, 1,
0.5818774, 0.3361712, 1.252543, 0, 0, 0, 1, 1,
0.583429, 0.3905566, -0.07262975, 0, 0, 0, 1, 1,
0.583616, -0.1457767, 2.917593, 0, 0, 0, 1, 1,
0.5928702, -0.3903385, 2.997718, 0, 0, 0, 1, 1,
0.6095917, -0.3110454, 1.853575, 0, 0, 0, 1, 1,
0.6148778, 0.5182496, 1.371131, 1, 1, 1, 1, 1,
0.6177489, 0.3166868, -0.5557655, 1, 1, 1, 1, 1,
0.6220534, -0.6065877, 0.416954, 1, 1, 1, 1, 1,
0.6246414, -0.9414631, 3.59805, 1, 1, 1, 1, 1,
0.6253704, 1.130271, -0.1323477, 1, 1, 1, 1, 1,
0.6279448, 0.6782329, 0.1322076, 1, 1, 1, 1, 1,
0.6300949, -0.7494935, 0.7912332, 1, 1, 1, 1, 1,
0.6314537, 0.03323862, 1.020586, 1, 1, 1, 1, 1,
0.6323611, 0.2542657, 1.509729, 1, 1, 1, 1, 1,
0.63275, -0.7960645, 4.656656, 1, 1, 1, 1, 1,
0.6362876, -1.277853, 3.28753, 1, 1, 1, 1, 1,
0.6407325, 0.7322184, -0.1431991, 1, 1, 1, 1, 1,
0.6431399, -0.2818545, 0.7258362, 1, 1, 1, 1, 1,
0.644178, 0.651618, 0.3969837, 1, 1, 1, 1, 1,
0.6467927, -1.517358, 2.618543, 1, 1, 1, 1, 1,
0.6473181, 1.034728, -0.2926333, 0, 0, 1, 1, 1,
0.647427, 1.816457, -0.7780014, 1, 0, 0, 1, 1,
0.6504387, 0.2604286, 1.589371, 1, 0, 0, 1, 1,
0.6625177, -0.3708423, 1.193139, 1, 0, 0, 1, 1,
0.6660173, 0.133961, 2.143496, 1, 0, 0, 1, 1,
0.6661028, -0.1035599, 1.297556, 1, 0, 0, 1, 1,
0.6679707, 0.8048145, 0.8274225, 0, 0, 0, 1, 1,
0.6689838, 0.9092591, -0.08359861, 0, 0, 0, 1, 1,
0.6690645, 0.0881279, 0.9150344, 0, 0, 0, 1, 1,
0.6721132, 0.6603314, 1.839994, 0, 0, 0, 1, 1,
0.675958, 0.3636612, -1.13384, 0, 0, 0, 1, 1,
0.687245, -0.1981428, 1.688235, 0, 0, 0, 1, 1,
0.6925768, 0.04344009, 2.22721, 0, 0, 0, 1, 1,
0.6940517, 1.163085, 0.2253711, 1, 1, 1, 1, 1,
0.6944076, 0.5588999, 0.6885788, 1, 1, 1, 1, 1,
0.6984833, 0.6367314, 0.9656367, 1, 1, 1, 1, 1,
0.698984, -0.41107, 2.631753, 1, 1, 1, 1, 1,
0.7008616, 0.1677218, 1.306229, 1, 1, 1, 1, 1,
0.70481, 1.154217, -0.8571028, 1, 1, 1, 1, 1,
0.708172, 1.077238, 0.3920788, 1, 1, 1, 1, 1,
0.716602, 0.8146991, -0.5297754, 1, 1, 1, 1, 1,
0.7166166, -0.3805968, 2.727425, 1, 1, 1, 1, 1,
0.7172167, 0.0860685, 1.639176, 1, 1, 1, 1, 1,
0.7185863, 0.5261643, 0.18133, 1, 1, 1, 1, 1,
0.7215484, -0.9760487, 0.7788353, 1, 1, 1, 1, 1,
0.7231665, 0.8476288, 0.1273169, 1, 1, 1, 1, 1,
0.7353597, 1.079277, 0.1394239, 1, 1, 1, 1, 1,
0.7361841, 0.215634, -0.51797, 1, 1, 1, 1, 1,
0.7412218, -0.05813625, 2.898777, 0, 0, 1, 1, 1,
0.7420609, 0.2967958, 1.294856, 1, 0, 0, 1, 1,
0.7427456, 0.9854721, 0.6486169, 1, 0, 0, 1, 1,
0.7443826, -2.18951, 2.887649, 1, 0, 0, 1, 1,
0.7468156, 0.2733607, 1.90132, 1, 0, 0, 1, 1,
0.7477091, 0.8182904, 2.169093, 1, 0, 0, 1, 1,
0.754332, -1.173939, 2.140719, 0, 0, 0, 1, 1,
0.7554672, -0.7821206, 1.748553, 0, 0, 0, 1, 1,
0.7556334, 0.2198038, 0.6742176, 0, 0, 0, 1, 1,
0.7583002, 0.5181688, 0.04412455, 0, 0, 0, 1, 1,
0.7585632, 0.5810698, -0.5767257, 0, 0, 0, 1, 1,
0.7623605, 0.7828137, 1.257734, 0, 0, 0, 1, 1,
0.7636489, 0.6601884, 0.4549409, 0, 0, 0, 1, 1,
0.7659611, 0.4325728, 2.462941, 1, 1, 1, 1, 1,
0.7679937, 0.2501581, 2.011437, 1, 1, 1, 1, 1,
0.7717727, 0.5060963, 1.652532, 1, 1, 1, 1, 1,
0.7778684, 0.59456, 2.251999, 1, 1, 1, 1, 1,
0.783277, 0.8734186, -0.5544815, 1, 1, 1, 1, 1,
0.7838197, 0.01070277, 0.8446446, 1, 1, 1, 1, 1,
0.7895257, -0.6286908, 2.585636, 1, 1, 1, 1, 1,
0.7943823, -0.4107375, 2.82751, 1, 1, 1, 1, 1,
0.7955784, -0.6313832, 2.813019, 1, 1, 1, 1, 1,
0.798245, -0.2544524, 1.204059, 1, 1, 1, 1, 1,
0.7983038, 1.178992, -0.3544625, 1, 1, 1, 1, 1,
0.7986948, 2.04776, 1.343615, 1, 1, 1, 1, 1,
0.8034437, -0.155132, 1.230493, 1, 1, 1, 1, 1,
0.8039166, 0.0771457, 2.030536, 1, 1, 1, 1, 1,
0.8049873, 1.464844, 0.04730813, 1, 1, 1, 1, 1,
0.8079207, -0.391214, 2.422375, 0, 0, 1, 1, 1,
0.8084268, 0.06042753, -1.052375, 1, 0, 0, 1, 1,
0.8098895, -0.9752244, 3.305543, 1, 0, 0, 1, 1,
0.8212836, -2.14772, 2.966559, 1, 0, 0, 1, 1,
0.823844, 0.7915334, 0.8941757, 1, 0, 0, 1, 1,
0.8274978, -0.8852517, 2.689373, 1, 0, 0, 1, 1,
0.828243, -0.9672334, 2.141017, 0, 0, 0, 1, 1,
0.830323, 0.6030777, -0.05814867, 0, 0, 0, 1, 1,
0.8316797, 0.7337386, 2.280846, 0, 0, 0, 1, 1,
0.833672, 0.5626085, 0.5988067, 0, 0, 0, 1, 1,
0.8384991, -0.8951167, 2.506518, 0, 0, 0, 1, 1,
0.8404167, 1.658399, 1.054073, 0, 0, 0, 1, 1,
0.8418795, -0.4472313, 1.127822, 0, 0, 0, 1, 1,
0.8433481, 0.1654925, 2.994599, 1, 1, 1, 1, 1,
0.8437843, 1.26509, -0.247565, 1, 1, 1, 1, 1,
0.8465044, 0.6160173, 0.2457218, 1, 1, 1, 1, 1,
0.8498033, 0.09386805, 2.081694, 1, 1, 1, 1, 1,
0.8523276, -0.7145669, 3.271197, 1, 1, 1, 1, 1,
0.8534019, -0.230686, 1.190966, 1, 1, 1, 1, 1,
0.854088, -0.1301739, 0.3702978, 1, 1, 1, 1, 1,
0.8547316, -1.5179, 1.525519, 1, 1, 1, 1, 1,
0.8553014, -0.7712148, 1.27175, 1, 1, 1, 1, 1,
0.8595082, 0.5101885, 1.096638, 1, 1, 1, 1, 1,
0.8607866, -0.3289745, 2.001064, 1, 1, 1, 1, 1,
0.8629045, 0.1648062, 1.875093, 1, 1, 1, 1, 1,
0.8644567, -1.246751, 2.132342, 1, 1, 1, 1, 1,
0.8664069, 0.7740265, 0.5154524, 1, 1, 1, 1, 1,
0.8747203, -1.19778, 1.156656, 1, 1, 1, 1, 1,
0.8808616, -0.910547, 2.676654, 0, 0, 1, 1, 1,
0.8831464, 0.07892542, 3.224138, 1, 0, 0, 1, 1,
0.9004716, -0.3496724, 2.100878, 1, 0, 0, 1, 1,
0.9167279, 0.3169241, 1.1794, 1, 0, 0, 1, 1,
0.9205815, 0.3466951, 0.6683459, 1, 0, 0, 1, 1,
0.9208608, -1.598908, 3.615505, 1, 0, 0, 1, 1,
0.9252505, -1.856542, 2.333775, 0, 0, 0, 1, 1,
0.9361271, -0.4066977, 2.78146, 0, 0, 0, 1, 1,
0.9365655, 1.22546, 0.6274277, 0, 0, 0, 1, 1,
0.9373329, 0.944874, 0.4826043, 0, 0, 0, 1, 1,
0.9399537, -1.232473, 1.686991, 0, 0, 0, 1, 1,
0.9417818, -0.3294992, 0.304767, 0, 0, 0, 1, 1,
0.9430608, 1.922912, -0.4788171, 0, 0, 0, 1, 1,
0.9476814, 0.0272571, 0.8383576, 1, 1, 1, 1, 1,
0.9499215, 0.3119299, 1.001312, 1, 1, 1, 1, 1,
0.9522274, 1.260187, 0.5412262, 1, 1, 1, 1, 1,
0.9583567, 0.818637, 1.135556, 1, 1, 1, 1, 1,
0.9613379, 0.9193947, 1.09512, 1, 1, 1, 1, 1,
0.9639081, -0.9114928, 1.2949, 1, 1, 1, 1, 1,
0.9642181, -1.681112, 2.381747, 1, 1, 1, 1, 1,
0.972154, 0.4946018, 1.33093, 1, 1, 1, 1, 1,
0.9770913, 1.014567, 0.2421927, 1, 1, 1, 1, 1,
0.9774362, 1.508304, -0.04865247, 1, 1, 1, 1, 1,
0.9791397, 1.595636, -1.12783, 1, 1, 1, 1, 1,
0.9834802, -0.3807871, 0.6005648, 1, 1, 1, 1, 1,
0.9881445, -3.484018, 3.680092, 1, 1, 1, 1, 1,
0.9954549, 0.2701186, 2.002035, 1, 1, 1, 1, 1,
0.9979145, 0.7868557, 1.268661, 1, 1, 1, 1, 1,
0.9987443, 0.8170704, 1.718943, 0, 0, 1, 1, 1,
1.009114, 0.2054603, 2.428154, 1, 0, 0, 1, 1,
1.010357, -1.409241, 3.70085, 1, 0, 0, 1, 1,
1.010529, -0.3040349, 0.3375879, 1, 0, 0, 1, 1,
1.019302, 0.2133636, 1.085025, 1, 0, 0, 1, 1,
1.021402, 0.5430195, 0.5476724, 1, 0, 0, 1, 1,
1.026784, -0.174358, 0.5036195, 0, 0, 0, 1, 1,
1.030865, -0.4433276, 1.87767, 0, 0, 0, 1, 1,
1.03335, -0.2913471, 0.1373281, 0, 0, 0, 1, 1,
1.038397, -0.1834637, 3.607187, 0, 0, 0, 1, 1,
1.045682, -1.264374, 2.892403, 0, 0, 0, 1, 1,
1.045695, -1.094266, 2.482388, 0, 0, 0, 1, 1,
1.046469, 0.8377671, 1.751646, 0, 0, 0, 1, 1,
1.061887, 0.02632706, 0.8481548, 1, 1, 1, 1, 1,
1.066323, 0.0162625, 0.5467166, 1, 1, 1, 1, 1,
1.0674, 0.8937019, 0.2506848, 1, 1, 1, 1, 1,
1.068424, -0.3720018, 2.777107, 1, 1, 1, 1, 1,
1.0733, -0.824935, 2.489457, 1, 1, 1, 1, 1,
1.079423, -1.302406, 3.463849, 1, 1, 1, 1, 1,
1.08771, -0.7738171, 1.606933, 1, 1, 1, 1, 1,
1.088381, 0.03760376, 1.990638, 1, 1, 1, 1, 1,
1.091844, -0.5255595, 1.626476, 1, 1, 1, 1, 1,
1.09299, 1.405792, 1.734409, 1, 1, 1, 1, 1,
1.093887, 0.4417066, 0.383795, 1, 1, 1, 1, 1,
1.097094, -1.318567, 2.909956, 1, 1, 1, 1, 1,
1.105296, 0.1368154, 0.5796898, 1, 1, 1, 1, 1,
1.112784, -0.7190101, 1.036791, 1, 1, 1, 1, 1,
1.114102, 0.7661016, 2.399948, 1, 1, 1, 1, 1,
1.116451, -1.102774, 2.182396, 0, 0, 1, 1, 1,
1.120332, -1.196048, 2.651036, 1, 0, 0, 1, 1,
1.134882, 0.4368888, 0.8615894, 1, 0, 0, 1, 1,
1.135029, 1.052197, 0.3189504, 1, 0, 0, 1, 1,
1.135407, 0.440826, 1.161351, 1, 0, 0, 1, 1,
1.138336, -1.245744, 1.560626, 1, 0, 0, 1, 1,
1.140621, -1.235119, 3.676536, 0, 0, 0, 1, 1,
1.147991, 0.608241, 2.343301, 0, 0, 0, 1, 1,
1.151705, 0.3755656, 2.812331, 0, 0, 0, 1, 1,
1.156574, -0.1079364, 0.7518292, 0, 0, 0, 1, 1,
1.15925, 0.09637991, 1.52119, 0, 0, 0, 1, 1,
1.162851, -0.7897491, 3.041498, 0, 0, 0, 1, 1,
1.170527, -0.4250277, 1.616708, 0, 0, 0, 1, 1,
1.170643, -0.3942411, 2.403035, 1, 1, 1, 1, 1,
1.174526, -0.1697254, -0.3808514, 1, 1, 1, 1, 1,
1.178653, 2.110174, 0.9529851, 1, 1, 1, 1, 1,
1.182524, -0.4116252, 1.579674, 1, 1, 1, 1, 1,
1.190557, -0.200958, 0.4989324, 1, 1, 1, 1, 1,
1.193486, -0.9323609, 1.569869, 1, 1, 1, 1, 1,
1.19513, -0.1302922, 2.705051, 1, 1, 1, 1, 1,
1.207999, -1.12638, 2.859439, 1, 1, 1, 1, 1,
1.211852, 0.04231322, 0.3825924, 1, 1, 1, 1, 1,
1.215937, 0.437866, 2.45063, 1, 1, 1, 1, 1,
1.224517, -0.6282582, 2.033953, 1, 1, 1, 1, 1,
1.23066, 0.2010712, 1.880557, 1, 1, 1, 1, 1,
1.249275, 0.4673751, 0.4955364, 1, 1, 1, 1, 1,
1.255357, 0.3996325, -0.02344816, 1, 1, 1, 1, 1,
1.273068, -0.6030458, 2.149051, 1, 1, 1, 1, 1,
1.276814, -0.1244865, 3.230747, 0, 0, 1, 1, 1,
1.278592, 0.074189, 2.484168, 1, 0, 0, 1, 1,
1.279357, -0.7915159, 2.288894, 1, 0, 0, 1, 1,
1.280506, 0.7813111, 0.1130133, 1, 0, 0, 1, 1,
1.287104, -0.01596235, 0.9225388, 1, 0, 0, 1, 1,
1.28911, -0.7707771, 3.880411, 1, 0, 0, 1, 1,
1.294424, -0.110741, 1.715667, 0, 0, 0, 1, 1,
1.302536, 0.4399603, 1.433213, 0, 0, 0, 1, 1,
1.318939, -1.808716, 3.72814, 0, 0, 0, 1, 1,
1.321053, 0.05171873, 2.023833, 0, 0, 0, 1, 1,
1.325415, 0.2824028, 1.263324, 0, 0, 0, 1, 1,
1.332231, 0.01579311, -0.2684916, 0, 0, 0, 1, 1,
1.339668, -1.632947, 3.096216, 0, 0, 0, 1, 1,
1.346239, 0.1868314, 1.377806, 1, 1, 1, 1, 1,
1.365381, 0.8953723, -0.1603947, 1, 1, 1, 1, 1,
1.396434, 0.8082196, 1.776259, 1, 1, 1, 1, 1,
1.399332, -0.7267728, 2.045603, 1, 1, 1, 1, 1,
1.401227, -0.6303471, 0.9442316, 1, 1, 1, 1, 1,
1.407083, 1.125674, 0.7468289, 1, 1, 1, 1, 1,
1.415355, 0.4568164, 1.070724, 1, 1, 1, 1, 1,
1.421725, 0.3719399, -0.03844032, 1, 1, 1, 1, 1,
1.433155, -1.848415, 1.895989, 1, 1, 1, 1, 1,
1.440433, -1.262702, 1.04597, 1, 1, 1, 1, 1,
1.447744, 0.05617967, 1.273364, 1, 1, 1, 1, 1,
1.484268, -2.128795, 2.722165, 1, 1, 1, 1, 1,
1.489694, 0.8916734, 1.760127, 1, 1, 1, 1, 1,
1.491555, 1.106966, -0.4357915, 1, 1, 1, 1, 1,
1.491882, -1.324952, 2.07584, 1, 1, 1, 1, 1,
1.498054, 0.2686282, 1.35427, 0, 0, 1, 1, 1,
1.498337, 0.3812647, 0.7736832, 1, 0, 0, 1, 1,
1.514027, 0.1465734, 0.601675, 1, 0, 0, 1, 1,
1.540188, 1.450558, 0.5757722, 1, 0, 0, 1, 1,
1.545124, -1.076078, 0.2742057, 1, 0, 0, 1, 1,
1.548803, 1.319023, 2.072407, 1, 0, 0, 1, 1,
1.549593, 0.5926934, 0.6409767, 0, 0, 0, 1, 1,
1.550186, 0.1911695, 1.091953, 0, 0, 0, 1, 1,
1.554938, -1.138973, 1.925696, 0, 0, 0, 1, 1,
1.559678, -0.5915388, 2.442855, 0, 0, 0, 1, 1,
1.582051, -0.4921624, 0.568403, 0, 0, 0, 1, 1,
1.616112, 0.1910072, 1.36162, 0, 0, 0, 1, 1,
1.643079, -0.6704513, 1.420554, 0, 0, 0, 1, 1,
1.645997, 1.812407, -0.5661882, 1, 1, 1, 1, 1,
1.652357, 2.178411, 1.99833, 1, 1, 1, 1, 1,
1.653959, 1.264041, 0.6362817, 1, 1, 1, 1, 1,
1.65655, -0.4073217, 1.738145, 1, 1, 1, 1, 1,
1.685964, 0.7475863, 1.503988, 1, 1, 1, 1, 1,
1.702232, -0.2534883, 2.588878, 1, 1, 1, 1, 1,
1.712521, 1.177207, -0.7125005, 1, 1, 1, 1, 1,
1.745772, -0.5889556, 0.5970107, 1, 1, 1, 1, 1,
1.752183, 0.05142746, 1.945833, 1, 1, 1, 1, 1,
1.765689, 0.5870374, 1.505487, 1, 1, 1, 1, 1,
1.76665, 0.1005951, 2.236871, 1, 1, 1, 1, 1,
1.781442, -1.155039, 2.482173, 1, 1, 1, 1, 1,
1.797647, 0.1539145, 0.2976301, 1, 1, 1, 1, 1,
1.814682, -0.1067001, 3.678344, 1, 1, 1, 1, 1,
1.83084, 1.780978, 0.04554992, 1, 1, 1, 1, 1,
1.869406, 1.473541, 1.764466, 0, 0, 1, 1, 1,
1.91763, -1.268331, 3.126018, 1, 0, 0, 1, 1,
1.934825, -0.7152852, 2.101219, 1, 0, 0, 1, 1,
1.952877, -0.4456337, 2.365878, 1, 0, 0, 1, 1,
1.97648, -1.97753, 3.295278, 1, 0, 0, 1, 1,
2.000446, -0.6005734, 4.061814, 1, 0, 0, 1, 1,
2.182784, -1.50268, 1.273689, 0, 0, 0, 1, 1,
2.19215, 0.1197633, 1.590342, 0, 0, 0, 1, 1,
2.201886, 0.5163208, 0.5968332, 0, 0, 0, 1, 1,
2.236348, -1.430146, 5.374941, 0, 0, 0, 1, 1,
2.377618, -0.6095683, 2.090864, 0, 0, 0, 1, 1,
2.392812, -0.4952567, 1.187428, 0, 0, 0, 1, 1,
2.412394, -1.021276, 2.308097, 0, 0, 0, 1, 1,
2.514815, -0.5164846, 3.81439, 1, 1, 1, 1, 1,
2.619519, -1.481795, 2.121742, 1, 1, 1, 1, 1,
2.740428, 1.330941, 1.256605, 1, 1, 1, 1, 1,
2.768904, 1.069382, 0.9735204, 1, 1, 1, 1, 1,
2.772121, 0.5761753, 0.9838493, 1, 1, 1, 1, 1,
2.795571, 2.135738, 1.422943, 1, 1, 1, 1, 1,
2.818089, 0.5298023, 0.5856822, 1, 1, 1, 1, 1
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
var radius = 9.769217;
var distance = 34.31396;
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
mvMatrix.translate( 0.3206308, -0.0004177094, -0.1901684 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31396);
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