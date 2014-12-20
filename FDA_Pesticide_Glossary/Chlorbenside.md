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
-3.777106, -1.464589, -2.925401, 1, 0, 0, 1,
-3.255337, 1.002535, -1.44505, 1, 0.007843138, 0, 1,
-2.843669, -0.0965144, -2.61366, 1, 0.01176471, 0, 1,
-2.632919, 1.377248, -1.041951, 1, 0.01960784, 0, 1,
-2.624241, 0.7992719, -1.115926, 1, 0.02352941, 0, 1,
-2.470275, 1.68275, -1.226102, 1, 0.03137255, 0, 1,
-2.435163, -0.3202615, 0.08922256, 1, 0.03529412, 0, 1,
-2.352042, 2.237282, 0.2970932, 1, 0.04313726, 0, 1,
-2.343609, 0.6329591, 1.320454, 1, 0.04705882, 0, 1,
-2.266057, -1.515695, -1.721812, 1, 0.05490196, 0, 1,
-2.222897, 0.4554725, -1.709129, 1, 0.05882353, 0, 1,
-2.195526, -0.2669016, -0.9131289, 1, 0.06666667, 0, 1,
-2.173106, 0.2742442, -1.123375, 1, 0.07058824, 0, 1,
-2.15363, -0.6320765, -0.8393446, 1, 0.07843138, 0, 1,
-2.134598, -1.045919, -3.276545, 1, 0.08235294, 0, 1,
-2.127689, -0.2888657, -0.7654641, 1, 0.09019608, 0, 1,
-2.103289, 0.2000684, -1.320301, 1, 0.09411765, 0, 1,
-2.061376, -0.7832941, -2.012143, 1, 0.1019608, 0, 1,
-2.028965, 0.7198769, -2.047993, 1, 0.1098039, 0, 1,
-2.026753, 0.3293942, -1.571704, 1, 0.1137255, 0, 1,
-2.02321, -0.8295954, -1.713511, 1, 0.1215686, 0, 1,
-2.00653, 1.05954, 0.08423503, 1, 0.1254902, 0, 1,
-1.9289, -0.3846518, -1.291399, 1, 0.1333333, 0, 1,
-1.918782, 0.7199157, -2.398458, 1, 0.1372549, 0, 1,
-1.897928, -1.482539, -2.634866, 1, 0.145098, 0, 1,
-1.89307, -0.9836521, -2.41575, 1, 0.1490196, 0, 1,
-1.892492, -0.6043805, -2.001237, 1, 0.1568628, 0, 1,
-1.874146, -1.15236, -1.367515, 1, 0.1607843, 0, 1,
-1.866958, 0.4276449, -1.205399, 1, 0.1686275, 0, 1,
-1.865983, -0.09129668, -0.7040038, 1, 0.172549, 0, 1,
-1.841557, -0.447114, -2.722161, 1, 0.1803922, 0, 1,
-1.833036, 0.3021178, -2.569163, 1, 0.1843137, 0, 1,
-1.830985, 0.05114803, -1.642269, 1, 0.1921569, 0, 1,
-1.820899, 0.2577986, 0.2512265, 1, 0.1960784, 0, 1,
-1.807173, 0.09353325, -2.530219, 1, 0.2039216, 0, 1,
-1.806658, -0.4198506, -3.694969, 1, 0.2117647, 0, 1,
-1.795091, 0.8032374, -1.937902, 1, 0.2156863, 0, 1,
-1.77965, -0.2922068, -1.656267, 1, 0.2235294, 0, 1,
-1.754766, -0.7825556, -1.743665, 1, 0.227451, 0, 1,
-1.749132, -0.7912045, -2.375433, 1, 0.2352941, 0, 1,
-1.729632, -0.04768739, -3.475741, 1, 0.2392157, 0, 1,
-1.697307, 0.1609288, -0.6033354, 1, 0.2470588, 0, 1,
-1.695743, 0.2178671, -0.8890609, 1, 0.2509804, 0, 1,
-1.671879, -1.296795, -1.084851, 1, 0.2588235, 0, 1,
-1.671059, 0.4494115, -2.543371, 1, 0.2627451, 0, 1,
-1.659454, -0.8763223, -0.201958, 1, 0.2705882, 0, 1,
-1.628869, 1.501977, -1.646039, 1, 0.2745098, 0, 1,
-1.628741, 0.8778252, -2.484782, 1, 0.282353, 0, 1,
-1.627811, 0.1845349, -0.5600784, 1, 0.2862745, 0, 1,
-1.626714, -1.060991, -1.914231, 1, 0.2941177, 0, 1,
-1.619819, -0.4930201, -3.066323, 1, 0.3019608, 0, 1,
-1.605698, 2.188919, -0.6601174, 1, 0.3058824, 0, 1,
-1.589721, -0.9911347, -1.978415, 1, 0.3137255, 0, 1,
-1.58652, -1.065382, -1.391124, 1, 0.3176471, 0, 1,
-1.571869, -0.4062687, -1.414273, 1, 0.3254902, 0, 1,
-1.570555, 2.067836, -2.78824, 1, 0.3294118, 0, 1,
-1.562452, -0.5402845, -0.9182526, 1, 0.3372549, 0, 1,
-1.557506, 0.8438619, -1.710151, 1, 0.3411765, 0, 1,
-1.556986, -0.1767615, -1.169708, 1, 0.3490196, 0, 1,
-1.542743, -0.9829033, -0.9927171, 1, 0.3529412, 0, 1,
-1.529329, -0.9804264, -2.662513, 1, 0.3607843, 0, 1,
-1.52907, -0.9006184, -1.745829, 1, 0.3647059, 0, 1,
-1.52065, -0.3315392, -1.860853, 1, 0.372549, 0, 1,
-1.514688, 0.3726698, -0.6212029, 1, 0.3764706, 0, 1,
-1.507784, 1.407877, -3.215794, 1, 0.3843137, 0, 1,
-1.507576, -2.269686, -0.06678931, 1, 0.3882353, 0, 1,
-1.503246, 0.340038, -0.2955368, 1, 0.3960784, 0, 1,
-1.498246, 0.5053332, -1.396855, 1, 0.4039216, 0, 1,
-1.492966, -0.0142616, -2.233754, 1, 0.4078431, 0, 1,
-1.47543, 1.156306, -2.37239, 1, 0.4156863, 0, 1,
-1.465258, 1.229759, -0.6405445, 1, 0.4196078, 0, 1,
-1.441426, 0.2372245, -1.418291, 1, 0.427451, 0, 1,
-1.432731, -0.523182, -0.6227807, 1, 0.4313726, 0, 1,
-1.43014, 0.3727038, -2.421699, 1, 0.4392157, 0, 1,
-1.426222, 0.1738635, -1.161179, 1, 0.4431373, 0, 1,
-1.422135, 0.5283363, -1.214582, 1, 0.4509804, 0, 1,
-1.421565, -0.5752069, -1.929038, 1, 0.454902, 0, 1,
-1.416356, 0.07793488, -1.367683, 1, 0.4627451, 0, 1,
-1.38954, 0.2354103, -0.3289642, 1, 0.4666667, 0, 1,
-1.389045, -0.2535122, -1.403505, 1, 0.4745098, 0, 1,
-1.379447, 0.2671514, -1.241504, 1, 0.4784314, 0, 1,
-1.378111, 0.507453, -1.181085, 1, 0.4862745, 0, 1,
-1.373211, 1.124734, -1.59806, 1, 0.4901961, 0, 1,
-1.372073, -0.5374781, -0.9097142, 1, 0.4980392, 0, 1,
-1.363602, -0.7374122, -2.070728, 1, 0.5058824, 0, 1,
-1.352666, 0.7370449, -0.6911219, 1, 0.509804, 0, 1,
-1.348095, -0.6197754, -1.363321, 1, 0.5176471, 0, 1,
-1.341131, 1.190383, -0.5724313, 1, 0.5215687, 0, 1,
-1.324916, 0.724794, -1.351152, 1, 0.5294118, 0, 1,
-1.322017, -1.063374, -1.124175, 1, 0.5333334, 0, 1,
-1.320862, -0.3397755, -1.583668, 1, 0.5411765, 0, 1,
-1.309269, 0.05578944, -4.584321, 1, 0.5450981, 0, 1,
-1.307125, -1.48386, -2.900486, 1, 0.5529412, 0, 1,
-1.305611, 0.6412631, -0.2019295, 1, 0.5568628, 0, 1,
-1.300851, -0.2186135, -1.934023, 1, 0.5647059, 0, 1,
-1.297521, 2.753759, 0.1483513, 1, 0.5686275, 0, 1,
-1.290044, 0.475189, -0.2205834, 1, 0.5764706, 0, 1,
-1.285534, 0.2339978, -0.2055135, 1, 0.5803922, 0, 1,
-1.282849, 0.3731627, -1.708951, 1, 0.5882353, 0, 1,
-1.282247, 0.02291495, -2.033288, 1, 0.5921569, 0, 1,
-1.281603, -0.9832314, -2.996662, 1, 0.6, 0, 1,
-1.281445, -0.3853799, -0.6369883, 1, 0.6078432, 0, 1,
-1.277384, 3.062113, -0.1869675, 1, 0.6117647, 0, 1,
-1.269395, 0.295807, 1.223949, 1, 0.6196079, 0, 1,
-1.269217, -0.4062614, -0.3049917, 1, 0.6235294, 0, 1,
-1.264068, 0.9727396, 0.0267433, 1, 0.6313726, 0, 1,
-1.261754, -1.465895, -2.846487, 1, 0.6352941, 0, 1,
-1.25989, -1.058933, -3.119293, 1, 0.6431373, 0, 1,
-1.255334, 0.8393288, -1.592964, 1, 0.6470588, 0, 1,
-1.241858, -0.846065, -1.269956, 1, 0.654902, 0, 1,
-1.236543, -0.7437556, -1.214035, 1, 0.6588235, 0, 1,
-1.230853, -0.1268274, -1.362523, 1, 0.6666667, 0, 1,
-1.225417, 0.3420857, -0.2917151, 1, 0.6705883, 0, 1,
-1.220967, 1.139558, -2.377763, 1, 0.6784314, 0, 1,
-1.216173, 0.9507123, -1.745469, 1, 0.682353, 0, 1,
-1.213366, -1.034061, -0.8622898, 1, 0.6901961, 0, 1,
-1.210985, 0.8812956, -0.6485761, 1, 0.6941177, 0, 1,
-1.207453, 0.9875555, 0.03883925, 1, 0.7019608, 0, 1,
-1.200532, -1.172449, -2.802474, 1, 0.7098039, 0, 1,
-1.198886, -1.334604, -2.127971, 1, 0.7137255, 0, 1,
-1.197494, 0.8778561, -1.085869, 1, 0.7215686, 0, 1,
-1.195373, -0.7422601, -2.97076, 1, 0.7254902, 0, 1,
-1.1921, 1.319018, -1.034703, 1, 0.7333333, 0, 1,
-1.190655, 1.447798, 0.4106532, 1, 0.7372549, 0, 1,
-1.187534, 0.1423438, -1.004705, 1, 0.7450981, 0, 1,
-1.187532, 0.3385582, -0.9990577, 1, 0.7490196, 0, 1,
-1.181218, 0.5164104, -2.398376, 1, 0.7568628, 0, 1,
-1.180376, -2.455995, -1.312516, 1, 0.7607843, 0, 1,
-1.173719, 0.1359066, 0.9177982, 1, 0.7686275, 0, 1,
-1.158614, -1.17743, -2.114889, 1, 0.772549, 0, 1,
-1.146516, 1.227245, -1.618659, 1, 0.7803922, 0, 1,
-1.144724, 1.073846, -0.9342069, 1, 0.7843137, 0, 1,
-1.13833, -1.029418, -2.511971, 1, 0.7921569, 0, 1,
-1.138034, 0.06651863, 0.3690198, 1, 0.7960784, 0, 1,
-1.137743, 1.327924, 1.718397, 1, 0.8039216, 0, 1,
-1.132623, 1.426277, -0.6638339, 1, 0.8117647, 0, 1,
-1.128459, 0.468836, -1.333289, 1, 0.8156863, 0, 1,
-1.124566, -0.0259915, -1.857117, 1, 0.8235294, 0, 1,
-1.122977, 1.055921, -0.2702472, 1, 0.827451, 0, 1,
-1.120124, 0.3451759, -0.9656546, 1, 0.8352941, 0, 1,
-1.112796, 0.2177612, -1.297195, 1, 0.8392157, 0, 1,
-1.109146, -1.157828, -2.92712, 1, 0.8470588, 0, 1,
-1.108775, -0.01245298, -2.289701, 1, 0.8509804, 0, 1,
-1.10278, -0.7742906, -3.85074, 1, 0.8588235, 0, 1,
-1.097491, -0.7499937, -2.154463, 1, 0.8627451, 0, 1,
-1.096442, 0.3974203, -2.351315, 1, 0.8705882, 0, 1,
-1.095513, 1.680437, -0.2562306, 1, 0.8745098, 0, 1,
-1.091801, 2.10098, -0.7634281, 1, 0.8823529, 0, 1,
-1.090494, -0.2481293, -1.645686, 1, 0.8862745, 0, 1,
-1.087777, -0.371524, -1.261962, 1, 0.8941177, 0, 1,
-1.082914, -0.7597585, -2.774878, 1, 0.8980392, 0, 1,
-1.079687, 0.05394569, -3.090579, 1, 0.9058824, 0, 1,
-1.076439, 1.412202, -0.2959993, 1, 0.9137255, 0, 1,
-1.068096, 1.153276, -1.480377, 1, 0.9176471, 0, 1,
-1.061547, 1.80359, -0.7447742, 1, 0.9254902, 0, 1,
-1.059568, 0.8124378, -0.792494, 1, 0.9294118, 0, 1,
-1.058587, -0.8242371, -2.563358, 1, 0.9372549, 0, 1,
-1.054603, -0.1537721, -3.087094, 1, 0.9411765, 0, 1,
-1.046156, -1.475452, -3.929067, 1, 0.9490196, 0, 1,
-1.040258, 0.4547263, -1.853717, 1, 0.9529412, 0, 1,
-1.033774, -0.5516717, -3.917154, 1, 0.9607843, 0, 1,
-1.007948, -1.571195, -1.596341, 1, 0.9647059, 0, 1,
-1.006255, -0.6585077, -3.324904, 1, 0.972549, 0, 1,
-1.003101, -0.8260854, -2.568693, 1, 0.9764706, 0, 1,
-1.002055, -0.6529868, -3.183828, 1, 0.9843137, 0, 1,
-1.001177, 0.2413323, -2.315029, 1, 0.9882353, 0, 1,
-0.99819, -1.290586, -2.265855, 1, 0.9960784, 0, 1,
-0.9969538, 0.7671317, -1.045311, 0.9960784, 1, 0, 1,
-0.9952851, 0.8052159, -0.1639906, 0.9921569, 1, 0, 1,
-0.9892615, -0.1324408, -1.190853, 0.9843137, 1, 0, 1,
-0.9887769, -1.701118, -2.408571, 0.9803922, 1, 0, 1,
-0.9858943, -0.3669373, -4.463091, 0.972549, 1, 0, 1,
-0.9784398, -0.5892237, -2.409698, 0.9686275, 1, 0, 1,
-0.9665991, -0.8630427, -2.070984, 0.9607843, 1, 0, 1,
-0.9665571, -1.522228, -3.154516, 0.9568627, 1, 0, 1,
-0.9625605, -0.4121875, -2.780265, 0.9490196, 1, 0, 1,
-0.9608169, 0.1472066, -1.769763, 0.945098, 1, 0, 1,
-0.9592481, -0.2356209, -2.204804, 0.9372549, 1, 0, 1,
-0.9547774, 0.8307791, -1.168628, 0.9333333, 1, 0, 1,
-0.9515726, -0.1735553, -1.656319, 0.9254902, 1, 0, 1,
-0.950874, -0.5861889, -0.4530703, 0.9215686, 1, 0, 1,
-0.942156, 1.508974, 0.8150038, 0.9137255, 1, 0, 1,
-0.9392802, 1.07615, -1.419889, 0.9098039, 1, 0, 1,
-0.9353732, -0.5592875, -1.448752, 0.9019608, 1, 0, 1,
-0.9338716, 0.2727559, -1.666341, 0.8941177, 1, 0, 1,
-0.9333217, 0.6613843, -1.072026, 0.8901961, 1, 0, 1,
-0.9312667, 0.8634466, -2.061555, 0.8823529, 1, 0, 1,
-0.9142434, 1.311928, -1.862945, 0.8784314, 1, 0, 1,
-0.9081483, 0.0181983, -0.1951104, 0.8705882, 1, 0, 1,
-0.9076092, -1.886822, -3.164592, 0.8666667, 1, 0, 1,
-0.9010078, -0.7078461, -2.198616, 0.8588235, 1, 0, 1,
-0.8999511, -0.1129604, -0.558879, 0.854902, 1, 0, 1,
-0.8980337, 0.6501678, -2.176299, 0.8470588, 1, 0, 1,
-0.8934584, 1.843885, 1.016442, 0.8431373, 1, 0, 1,
-0.8881271, -1.171018, -3.471788, 0.8352941, 1, 0, 1,
-0.8872569, -0.6284054, -1.196907, 0.8313726, 1, 0, 1,
-0.8863366, 1.337623, -2.312937, 0.8235294, 1, 0, 1,
-0.8826259, -0.2607087, -1.582903, 0.8196079, 1, 0, 1,
-0.8806781, -1.821605, -4.011347, 0.8117647, 1, 0, 1,
-0.8791711, 1.180083, 1.845232, 0.8078431, 1, 0, 1,
-0.8769408, -1.39402, -2.443553, 0.8, 1, 0, 1,
-0.8694749, -0.1855772, -2.240132, 0.7921569, 1, 0, 1,
-0.866717, -0.5639281, -2.084096, 0.7882353, 1, 0, 1,
-0.8665647, -0.7404742, -2.371637, 0.7803922, 1, 0, 1,
-0.8612764, -0.1362744, 0.02358498, 0.7764706, 1, 0, 1,
-0.8590927, 0.2206374, -2.7232, 0.7686275, 1, 0, 1,
-0.8561715, 1.418053, -0.3422312, 0.7647059, 1, 0, 1,
-0.8476602, -1.978806, -3.23831, 0.7568628, 1, 0, 1,
-0.847358, 0.5581861, -1.060025, 0.7529412, 1, 0, 1,
-0.8395996, 0.1502358, -1.107068, 0.7450981, 1, 0, 1,
-0.8387895, -0.5087347, -1.889216, 0.7411765, 1, 0, 1,
-0.8366969, 1.000977, -1.786072, 0.7333333, 1, 0, 1,
-0.829115, 1.063663, -0.5650436, 0.7294118, 1, 0, 1,
-0.8238817, -0.7014327, -3.37882, 0.7215686, 1, 0, 1,
-0.8217005, -1.268042, -3.395535, 0.7176471, 1, 0, 1,
-0.8129885, 1.263119, -2.165332, 0.7098039, 1, 0, 1,
-0.8086244, -0.5439212, -2.416092, 0.7058824, 1, 0, 1,
-0.7940144, 1.307247, -0.1613006, 0.6980392, 1, 0, 1,
-0.7929414, -0.09614899, -1.341245, 0.6901961, 1, 0, 1,
-0.7908727, -1.279052, -0.7458605, 0.6862745, 1, 0, 1,
-0.7886724, 0.3341768, -1.981585, 0.6784314, 1, 0, 1,
-0.7823729, 0.5989882, -1.649708, 0.6745098, 1, 0, 1,
-0.7786447, 0.2766626, -1.699312, 0.6666667, 1, 0, 1,
-0.7782642, -2.041829, -1.334715, 0.6627451, 1, 0, 1,
-0.7778191, -0.1257927, -3.004826, 0.654902, 1, 0, 1,
-0.7770488, -0.07914872, -2.202809, 0.6509804, 1, 0, 1,
-0.7725741, 0.9350303, 0.8453099, 0.6431373, 1, 0, 1,
-0.7687718, 1.115678, -1.590141, 0.6392157, 1, 0, 1,
-0.7674668, -0.434228, -3.572112, 0.6313726, 1, 0, 1,
-0.7632092, 0.9630302, -1.71386, 0.627451, 1, 0, 1,
-0.7585335, 0.3595227, -1.614866, 0.6196079, 1, 0, 1,
-0.7516097, 0.6582627, -2.268523, 0.6156863, 1, 0, 1,
-0.7500852, 0.5601639, -0.9741791, 0.6078432, 1, 0, 1,
-0.7490936, 0.64591, -0.7256073, 0.6039216, 1, 0, 1,
-0.7469521, 2.170953, 1.093678, 0.5960785, 1, 0, 1,
-0.7445498, -1.258336, -2.23512, 0.5882353, 1, 0, 1,
-0.7430721, -0.437403, -2.517167, 0.5843138, 1, 0, 1,
-0.7408969, 0.8175106, -1.52024, 0.5764706, 1, 0, 1,
-0.740373, 1.276667, -0.06880779, 0.572549, 1, 0, 1,
-0.7401282, 0.9761767, -0.7695122, 0.5647059, 1, 0, 1,
-0.7358453, 0.2985876, 0.172376, 0.5607843, 1, 0, 1,
-0.7350203, -1.015471, 0.1938338, 0.5529412, 1, 0, 1,
-0.7346029, -0.7411119, -2.270004, 0.5490196, 1, 0, 1,
-0.7302092, 1.268139, -0.3417819, 0.5411765, 1, 0, 1,
-0.7225396, -0.106113, -2.553354, 0.5372549, 1, 0, 1,
-0.7182729, -0.4726992, -2.606714, 0.5294118, 1, 0, 1,
-0.7170129, 0.4183728, 0.9115265, 0.5254902, 1, 0, 1,
-0.7109665, 1.133254, -0.488745, 0.5176471, 1, 0, 1,
-0.7078053, 0.4192441, -1.420215, 0.5137255, 1, 0, 1,
-0.7064952, 0.9083906, -0.3115528, 0.5058824, 1, 0, 1,
-0.7064153, -1.001783, -2.919526, 0.5019608, 1, 0, 1,
-0.7063063, -0.5802162, -1.623848, 0.4941176, 1, 0, 1,
-0.7006869, -1.125019, -3.469827, 0.4862745, 1, 0, 1,
-0.6963679, 0.139624, -1.574232, 0.4823529, 1, 0, 1,
-0.6941034, 0.3368476, -0.2417358, 0.4745098, 1, 0, 1,
-0.6850454, -1.580886, 0.09889761, 0.4705882, 1, 0, 1,
-0.6752525, -0.9333154, -1.328687, 0.4627451, 1, 0, 1,
-0.6724041, -1.257032, -0.5241329, 0.4588235, 1, 0, 1,
-0.6704323, -0.1804534, -0.9772311, 0.4509804, 1, 0, 1,
-0.6697937, 1.095495, -1.093802, 0.4470588, 1, 0, 1,
-0.6685195, -0.7291445, -2.213928, 0.4392157, 1, 0, 1,
-0.66664, 0.2038917, -2.020337, 0.4352941, 1, 0, 1,
-0.6646804, 2.896285, -0.6970866, 0.427451, 1, 0, 1,
-0.6644381, -2.194419, -2.651355, 0.4235294, 1, 0, 1,
-0.664212, -0.3768614, -2.864425, 0.4156863, 1, 0, 1,
-0.6620767, -0.8898567, -2.867716, 0.4117647, 1, 0, 1,
-0.6570797, -0.6043449, -1.453858, 0.4039216, 1, 0, 1,
-0.656561, -0.1177962, -2.30121, 0.3960784, 1, 0, 1,
-0.6549005, -0.8979353, -2.169542, 0.3921569, 1, 0, 1,
-0.6512986, 0.2773597, -0.9681804, 0.3843137, 1, 0, 1,
-0.6511595, -0.9476419, -1.679032, 0.3803922, 1, 0, 1,
-0.6502315, -0.614126, -2.642871, 0.372549, 1, 0, 1,
-0.6456932, -0.010613, -1.76199, 0.3686275, 1, 0, 1,
-0.6397256, -0.7968635, -1.942551, 0.3607843, 1, 0, 1,
-0.6395213, -0.3790238, -2.593394, 0.3568628, 1, 0, 1,
-0.6368694, -0.07863732, -2.119499, 0.3490196, 1, 0, 1,
-0.6289732, -1.335346, -3.48439, 0.345098, 1, 0, 1,
-0.627355, -0.5230305, -1.474096, 0.3372549, 1, 0, 1,
-0.6176718, -0.03368258, -1.143613, 0.3333333, 1, 0, 1,
-0.6129211, -1.18317, -3.079185, 0.3254902, 1, 0, 1,
-0.6114412, -0.1241368, -1.844203, 0.3215686, 1, 0, 1,
-0.6088098, 0.6723742, -1.692078, 0.3137255, 1, 0, 1,
-0.6058121, -0.2872341, -1.763847, 0.3098039, 1, 0, 1,
-0.59878, 0.6945292, -0.5706403, 0.3019608, 1, 0, 1,
-0.5921778, -0.3466206, -1.475744, 0.2941177, 1, 0, 1,
-0.5804039, 1.614133, -0.9485154, 0.2901961, 1, 0, 1,
-0.5784692, 0.01549547, -2.90057, 0.282353, 1, 0, 1,
-0.5700946, -0.4319086, -1.697299, 0.2784314, 1, 0, 1,
-0.5658942, 0.7069703, -2.52876, 0.2705882, 1, 0, 1,
-0.5614337, -0.5864424, -4.050072, 0.2666667, 1, 0, 1,
-0.5611925, -0.718633, -1.418576, 0.2588235, 1, 0, 1,
-0.5606187, 0.2325768, -0.8219874, 0.254902, 1, 0, 1,
-0.5602188, 0.3487737, -2.611528, 0.2470588, 1, 0, 1,
-0.5593464, -0.5322675, -2.327369, 0.2431373, 1, 0, 1,
-0.5574496, 1.106125, 0.9145672, 0.2352941, 1, 0, 1,
-0.5562512, 1.242302, -1.250401, 0.2313726, 1, 0, 1,
-0.5515833, -0.1362486, -1.098982, 0.2235294, 1, 0, 1,
-0.549666, 0.638172, -0.5368314, 0.2196078, 1, 0, 1,
-0.5462446, 1.366853, 0.01532555, 0.2117647, 1, 0, 1,
-0.5451207, -1.510517, -1.447025, 0.2078431, 1, 0, 1,
-0.5361755, 0.658829, -1.13897, 0.2, 1, 0, 1,
-0.5358198, -1.150685, -3.357341, 0.1921569, 1, 0, 1,
-0.53268, 1.327759, 0.6656822, 0.1882353, 1, 0, 1,
-0.5293253, 0.7721761, -0.02672702, 0.1803922, 1, 0, 1,
-0.5219903, 0.5134334, -2.68784, 0.1764706, 1, 0, 1,
-0.5190589, -0.5264159, -3.094952, 0.1686275, 1, 0, 1,
-0.5093251, 2.341406, 0.8620806, 0.1647059, 1, 0, 1,
-0.5055179, 1.106386, -0.1412146, 0.1568628, 1, 0, 1,
-0.502205, 0.9380953, -0.4536208, 0.1529412, 1, 0, 1,
-0.4989423, 2.06796, 1.000708, 0.145098, 1, 0, 1,
-0.4921913, 0.07378933, -1.348723, 0.1411765, 1, 0, 1,
-0.4908216, 0.6415979, -1.303874, 0.1333333, 1, 0, 1,
-0.4872853, -0.7528548, -3.591143, 0.1294118, 1, 0, 1,
-0.4863072, -0.2918257, -3.066449, 0.1215686, 1, 0, 1,
-0.4838173, -1.179435, -2.231694, 0.1176471, 1, 0, 1,
-0.4754412, -0.1280179, -2.895098, 0.1098039, 1, 0, 1,
-0.474979, 0.7091267, 0.6436539, 0.1058824, 1, 0, 1,
-0.4748829, -0.4181594, -0.453598, 0.09803922, 1, 0, 1,
-0.4734823, -1.139693, -4.307786, 0.09019608, 1, 0, 1,
-0.4726758, -1.022322, -2.457013, 0.08627451, 1, 0, 1,
-0.466893, -0.44972, -1.632911, 0.07843138, 1, 0, 1,
-0.4655019, 0.3698706, 0.6509537, 0.07450981, 1, 0, 1,
-0.4643325, -3.257434, -4.32313, 0.06666667, 1, 0, 1,
-0.4616155, 1.273662, -0.5484641, 0.0627451, 1, 0, 1,
-0.4573255, -0.7345182, -3.612562, 0.05490196, 1, 0, 1,
-0.4469403, 0.8158712, -0.5423242, 0.05098039, 1, 0, 1,
-0.4365202, -0.5140489, -1.599007, 0.04313726, 1, 0, 1,
-0.4320423, -0.5740668, -0.7536026, 0.03921569, 1, 0, 1,
-0.431218, -0.4008272, -1.249779, 0.03137255, 1, 0, 1,
-0.4311481, 1.749402, 0.3192315, 0.02745098, 1, 0, 1,
-0.4299234, 0.4863968, -1.355744, 0.01960784, 1, 0, 1,
-0.4285685, 0.003785387, -1.924082, 0.01568628, 1, 0, 1,
-0.4278961, -0.651903, -1.05879, 0.007843138, 1, 0, 1,
-0.4268824, 0.8915913, -0.1540472, 0.003921569, 1, 0, 1,
-0.4203986, 0.7928162, -1.347903, 0, 1, 0.003921569, 1,
-0.4203972, 1.300263, 0.2723976, 0, 1, 0.01176471, 1,
-0.4171492, -1.507478, -3.986485, 0, 1, 0.01568628, 1,
-0.4137617, -0.4112059, -3.624797, 0, 1, 0.02352941, 1,
-0.4089317, -0.717737, -4.424373, 0, 1, 0.02745098, 1,
-0.4082238, -0.1622408, -2.536249, 0, 1, 0.03529412, 1,
-0.4013289, 2.22316, -0.2084102, 0, 1, 0.03921569, 1,
-0.3969203, 0.005149203, -1.567496, 0, 1, 0.04705882, 1,
-0.3964987, 0.653956, 1.038959, 0, 1, 0.05098039, 1,
-0.3937787, -0.4524472, -3.928533, 0, 1, 0.05882353, 1,
-0.392972, 1.11485, -0.4088083, 0, 1, 0.0627451, 1,
-0.3883755, 0.08630095, -1.279014, 0, 1, 0.07058824, 1,
-0.3872752, 0.008385072, 0.4885812, 0, 1, 0.07450981, 1,
-0.3837314, 0.643226, -0.6383511, 0, 1, 0.08235294, 1,
-0.3802991, -1.494528, -3.352766, 0, 1, 0.08627451, 1,
-0.3802294, 1.147676, -1.905664, 0, 1, 0.09411765, 1,
-0.3748569, 0.1402934, -1.42923, 0, 1, 0.1019608, 1,
-0.3742208, -0.03340517, -2.801365, 0, 1, 0.1058824, 1,
-0.374197, 1.049793, 0.0315115, 0, 1, 0.1137255, 1,
-0.3699877, -0.1062327, -1.834025, 0, 1, 0.1176471, 1,
-0.369036, -0.9947003, -1.797454, 0, 1, 0.1254902, 1,
-0.3686956, -1.289321, -2.885011, 0, 1, 0.1294118, 1,
-0.3673291, -1.829258, -3.857243, 0, 1, 0.1372549, 1,
-0.3657101, -1.322707, -4.600349, 0, 1, 0.1411765, 1,
-0.3656361, -1.615283, -1.23799, 0, 1, 0.1490196, 1,
-0.3617637, -0.425299, -3.549069, 0, 1, 0.1529412, 1,
-0.3599232, -0.6572354, -1.778392, 0, 1, 0.1607843, 1,
-0.3574724, -1.386374, -4.214943, 0, 1, 0.1647059, 1,
-0.3554109, 0.08675635, -0.3318558, 0, 1, 0.172549, 1,
-0.3545521, 0.8321541, 1.035841, 0, 1, 0.1764706, 1,
-0.3528672, 0.8280469, -0.9931065, 0, 1, 0.1843137, 1,
-0.3526747, -0.5840638, -4.247018, 0, 1, 0.1882353, 1,
-0.3468534, 2.170495, -0.5160786, 0, 1, 0.1960784, 1,
-0.3426714, 0.4986072, -3.825141, 0, 1, 0.2039216, 1,
-0.3415708, 1.80215, -0.5817288, 0, 1, 0.2078431, 1,
-0.3350784, 2.367195, -0.8004698, 0, 1, 0.2156863, 1,
-0.3316129, -0.4332284, -2.743812, 0, 1, 0.2196078, 1,
-0.3306572, 0.638181, -0.5470076, 0, 1, 0.227451, 1,
-0.3280589, -0.7656614, -3.409036, 0, 1, 0.2313726, 1,
-0.3204485, 1.422321, 0.1806401, 0, 1, 0.2392157, 1,
-0.3179064, -0.222673, -2.880589, 0, 1, 0.2431373, 1,
-0.3094476, 0.8970605, 0.4544533, 0, 1, 0.2509804, 1,
-0.306899, -1.537102, -1.315945, 0, 1, 0.254902, 1,
-0.3041662, -0.3558579, -2.204814, 0, 1, 0.2627451, 1,
-0.3037544, -0.6973612, -3.865534, 0, 1, 0.2666667, 1,
-0.297503, -0.4035369, -1.698596, 0, 1, 0.2745098, 1,
-0.2962408, 1.280738, -0.6951606, 0, 1, 0.2784314, 1,
-0.2902505, 0.656226, -2.173175, 0, 1, 0.2862745, 1,
-0.289905, -0.5408605, -2.852354, 0, 1, 0.2901961, 1,
-0.2811209, -0.0003990951, -1.098427, 0, 1, 0.2980392, 1,
-0.276024, -3.941, -2.964612, 0, 1, 0.3058824, 1,
-0.2741979, -0.02277514, 0.7751595, 0, 1, 0.3098039, 1,
-0.2736531, 1.368031, 0.9370615, 0, 1, 0.3176471, 1,
-0.2731585, 0.7288928, -0.5058972, 0, 1, 0.3215686, 1,
-0.2720179, -1.571805, -3.573971, 0, 1, 0.3294118, 1,
-0.2717266, -0.6070693, -2.478556, 0, 1, 0.3333333, 1,
-0.271641, 0.9681984, -0.5879881, 0, 1, 0.3411765, 1,
-0.268151, -0.4795204, -0.7470928, 0, 1, 0.345098, 1,
-0.2675868, -1.311926, -2.295792, 0, 1, 0.3529412, 1,
-0.265515, -1.207646, -3.607929, 0, 1, 0.3568628, 1,
-0.2643297, 1.559349, 0.3078329, 0, 1, 0.3647059, 1,
-0.2615381, 1.095642, 0.03986175, 0, 1, 0.3686275, 1,
-0.2610606, 0.6468179, -1.336506, 0, 1, 0.3764706, 1,
-0.2573188, 0.400754, -1.302558, 0, 1, 0.3803922, 1,
-0.2561616, 0.3001437, -1.06038, 0, 1, 0.3882353, 1,
-0.256135, 0.4344611, -1.219017, 0, 1, 0.3921569, 1,
-0.2540029, 0.02593745, -0.7700872, 0, 1, 0.4, 1,
-0.253508, 0.9078813, -0.1528366, 0, 1, 0.4078431, 1,
-0.252794, -2.54283, -3.729973, 0, 1, 0.4117647, 1,
-0.2500964, -0.8988654, -2.577371, 0, 1, 0.4196078, 1,
-0.246312, -0.7314029, -2.452582, 0, 1, 0.4235294, 1,
-0.2452678, 0.8470618, -1.343576, 0, 1, 0.4313726, 1,
-0.2425818, -1.174316, -3.40102, 0, 1, 0.4352941, 1,
-0.241474, -0.3290773, -3.017643, 0, 1, 0.4431373, 1,
-0.2409599, -0.009668703, -1.050822, 0, 1, 0.4470588, 1,
-0.2379005, -1.125005, -1.633865, 0, 1, 0.454902, 1,
-0.2332276, 2.129388, 0.2239844, 0, 1, 0.4588235, 1,
-0.2243754, -0.02725155, -1.956181, 0, 1, 0.4666667, 1,
-0.2206235, 0.1348458, -0.868323, 0, 1, 0.4705882, 1,
-0.2176262, -0.7431875, -1.377958, 0, 1, 0.4784314, 1,
-0.2132168, 0.4832319, -2.28348, 0, 1, 0.4823529, 1,
-0.2104219, 0.681548, -2.044239, 0, 1, 0.4901961, 1,
-0.2027632, -0.6295736, -3.59722, 0, 1, 0.4941176, 1,
-0.2022566, -0.172591, -1.83288, 0, 1, 0.5019608, 1,
-0.1955552, 1.133667, -1.85359, 0, 1, 0.509804, 1,
-0.1898139, 0.4459329, 1.901436, 0, 1, 0.5137255, 1,
-0.1879293, 0.2776777, -1.077073, 0, 1, 0.5215687, 1,
-0.1833573, 1.146912, 1.445102, 0, 1, 0.5254902, 1,
-0.1790475, 0.00480467, -1.37152, 0, 1, 0.5333334, 1,
-0.1789036, -1.048798, -3.556843, 0, 1, 0.5372549, 1,
-0.1787134, 0.8244621, -0.001816092, 0, 1, 0.5450981, 1,
-0.1783687, 0.9385338, -0.7297655, 0, 1, 0.5490196, 1,
-0.1773985, 1.468058, -0.6526569, 0, 1, 0.5568628, 1,
-0.1747064, 0.1271186, -2.478086, 0, 1, 0.5607843, 1,
-0.1746439, 0.1885789, 0.1715998, 0, 1, 0.5686275, 1,
-0.173996, 0.1081802, -1.956595, 0, 1, 0.572549, 1,
-0.1703785, -1.260152, -3.502393, 0, 1, 0.5803922, 1,
-0.1701814, 0.289702, -1.595264, 0, 1, 0.5843138, 1,
-0.1600712, 1.357465, 1.121405, 0, 1, 0.5921569, 1,
-0.1581459, 1.716472, -1.175536, 0, 1, 0.5960785, 1,
-0.154029, 1.983927, 0.5671319, 0, 1, 0.6039216, 1,
-0.1537272, -0.9592275, -3.858088, 0, 1, 0.6117647, 1,
-0.1481705, -0.6715171, -2.68049, 0, 1, 0.6156863, 1,
-0.1399547, -0.115239, -2.352732, 0, 1, 0.6235294, 1,
-0.1384581, 0.9006394, -0.3094066, 0, 1, 0.627451, 1,
-0.1377184, -0.3135216, -0.9427034, 0, 1, 0.6352941, 1,
-0.1355594, 0.3501777, -0.05233272, 0, 1, 0.6392157, 1,
-0.1344286, 0.545343, 0.3607976, 0, 1, 0.6470588, 1,
-0.1341285, -1.684681, -3.551101, 0, 1, 0.6509804, 1,
-0.1325085, 0.1309022, -3.488447, 0, 1, 0.6588235, 1,
-0.126842, 0.2672644, 0.08989768, 0, 1, 0.6627451, 1,
-0.1250433, -0.8378926, -3.385669, 0, 1, 0.6705883, 1,
-0.1243023, -0.313967, -3.632243, 0, 1, 0.6745098, 1,
-0.1231395, 0.0203538, -2.145938, 0, 1, 0.682353, 1,
-0.1218925, -0.815686, -3.74738, 0, 1, 0.6862745, 1,
-0.1198411, 1.859546, 0.8590843, 0, 1, 0.6941177, 1,
-0.1143445, -0.5444366, -3.680222, 0, 1, 0.7019608, 1,
-0.1093006, 1.336919, 1.045657, 0, 1, 0.7058824, 1,
-0.1078488, 0.1125434, -0.7314395, 0, 1, 0.7137255, 1,
-0.1025749, 0.4190298, -0.04958639, 0, 1, 0.7176471, 1,
-0.09898956, -1.159201, -2.254985, 0, 1, 0.7254902, 1,
-0.09855074, -1.810965, -3.66844, 0, 1, 0.7294118, 1,
-0.09833236, 0.2424181, -1.614332, 0, 1, 0.7372549, 1,
-0.08958904, -0.5608066, -3.1673, 0, 1, 0.7411765, 1,
-0.08930187, -0.203734, -2.768352, 0, 1, 0.7490196, 1,
-0.08610804, 0.2780941, 0.5355163, 0, 1, 0.7529412, 1,
-0.08455097, 0.3635611, 1.241671, 0, 1, 0.7607843, 1,
-0.0841254, 0.2024609, -1.160309, 0, 1, 0.7647059, 1,
-0.08029199, 1.126305, 1.94014, 0, 1, 0.772549, 1,
-0.0801992, -0.06846863, -4.765257, 0, 1, 0.7764706, 1,
-0.07878861, -1.374532, -3.161587, 0, 1, 0.7843137, 1,
-0.07420813, -0.6379619, -2.576165, 0, 1, 0.7882353, 1,
-0.06929086, 0.645266, -0.4187703, 0, 1, 0.7960784, 1,
-0.06643265, 0.2301998, 0.02694898, 0, 1, 0.8039216, 1,
-0.06475767, 1.0969, 0.06790519, 0, 1, 0.8078431, 1,
-0.0614829, 1.677382, -2.211949, 0, 1, 0.8156863, 1,
-0.06132792, -1.719389, -3.303068, 0, 1, 0.8196079, 1,
-0.06068614, 0.7184081, -0.6352649, 0, 1, 0.827451, 1,
-0.05318467, -0.5431484, -2.177881, 0, 1, 0.8313726, 1,
-0.04425471, -0.5256841, -1.713813, 0, 1, 0.8392157, 1,
-0.04096568, -1.275257, -3.878593, 0, 1, 0.8431373, 1,
-0.04076753, -1.753915, -3.303989, 0, 1, 0.8509804, 1,
-0.03787617, 0.1766925, 0.7455348, 0, 1, 0.854902, 1,
-0.03353623, 0.09338126, -0.8697246, 0, 1, 0.8627451, 1,
-0.03176522, 0.02390065, -0.06361315, 0, 1, 0.8666667, 1,
-0.03088851, 0.6293025, 2.069507, 0, 1, 0.8745098, 1,
-0.02736094, -1.154071, -2.894817, 0, 1, 0.8784314, 1,
-0.02421583, 1.300545, -0.03798445, 0, 1, 0.8862745, 1,
-0.02278521, 0.0934279, 0.04305023, 0, 1, 0.8901961, 1,
-0.02149229, 0.6912429, 0.4919274, 0, 1, 0.8980392, 1,
-0.01865846, 0.1600897, 1.573514, 0, 1, 0.9058824, 1,
-0.0186398, -0.5045831, -4.63622, 0, 1, 0.9098039, 1,
-0.00332686, -1.295909, -3.742463, 0, 1, 0.9176471, 1,
-0.002496623, 1.097472, -0.8445994, 0, 1, 0.9215686, 1,
0.003287776, 1.676185, 1.405638, 0, 1, 0.9294118, 1,
0.00372914, -0.4428829, 2.840633, 0, 1, 0.9333333, 1,
0.008416062, 0.07232316, 0.01825648, 0, 1, 0.9411765, 1,
0.02035077, 1.434454, -0.9187292, 0, 1, 0.945098, 1,
0.02184863, -1.411872, 2.018122, 0, 1, 0.9529412, 1,
0.02236162, -0.6124501, 3.199103, 0, 1, 0.9568627, 1,
0.02297528, -0.6995289, 2.815237, 0, 1, 0.9647059, 1,
0.02464152, -0.248235, 3.818669, 0, 1, 0.9686275, 1,
0.02532024, -0.9944443, 4.237991, 0, 1, 0.9764706, 1,
0.02624363, 2.365765, 0.630384, 0, 1, 0.9803922, 1,
0.0289029, -0.9027734, 5.270852, 0, 1, 0.9882353, 1,
0.02989813, 1.663647, 1.378299, 0, 1, 0.9921569, 1,
0.03090118, 1.432841, -1.562696, 0, 1, 1, 1,
0.03155229, -0.8112614, 3.669007, 0, 0.9921569, 1, 1,
0.03277088, -0.2123472, 2.445642, 0, 0.9882353, 1, 1,
0.03346445, 1.558243, -1.471342, 0, 0.9803922, 1, 1,
0.04045661, 0.5125548, 0.7058566, 0, 0.9764706, 1, 1,
0.04125587, 0.6233163, 0.1552653, 0, 0.9686275, 1, 1,
0.04369239, 0.6877766, 1.559386, 0, 0.9647059, 1, 1,
0.04375174, -0.2787167, 2.749306, 0, 0.9568627, 1, 1,
0.04625238, 1.549856, -0.8924459, 0, 0.9529412, 1, 1,
0.04860999, 0.4004495, 0.16578, 0, 0.945098, 1, 1,
0.05098571, -0.6680234, 2.087244, 0, 0.9411765, 1, 1,
0.05437834, 0.5620839, 1.482773, 0, 0.9333333, 1, 1,
0.05443995, 1.051963, -1.496365, 0, 0.9294118, 1, 1,
0.06053839, -1.648313, 2.955874, 0, 0.9215686, 1, 1,
0.06273209, -0.3761629, 2.167491, 0, 0.9176471, 1, 1,
0.06931466, -0.3953313, 3.886776, 0, 0.9098039, 1, 1,
0.07041483, -1.106662, 2.768301, 0, 0.9058824, 1, 1,
0.07253293, -0.8570106, 3.065999, 0, 0.8980392, 1, 1,
0.07419103, -1.201103, 2.642739, 0, 0.8901961, 1, 1,
0.07459039, -0.7756063, 3.604999, 0, 0.8862745, 1, 1,
0.07636935, 1.473511, 0.1281643, 0, 0.8784314, 1, 1,
0.0766159, -0.2528189, 4.082806, 0, 0.8745098, 1, 1,
0.07698503, 0.07198117, 2.30825, 0, 0.8666667, 1, 1,
0.08233233, 0.8489625, 0.5476168, 0, 0.8627451, 1, 1,
0.08645722, 0.3508706, -0.2063679, 0, 0.854902, 1, 1,
0.088763, 0.3084465, -1.511979, 0, 0.8509804, 1, 1,
0.09055905, -1.795638, 2.590175, 0, 0.8431373, 1, 1,
0.09575372, -0.7596757, 4.367723, 0, 0.8392157, 1, 1,
0.09625223, 0.4240439, 0.1728939, 0, 0.8313726, 1, 1,
0.09658519, -0.4654849, 3.36129, 0, 0.827451, 1, 1,
0.09978367, 1.025772, 1.090125, 0, 0.8196079, 1, 1,
0.1047348, 0.4171419, -0.2712449, 0, 0.8156863, 1, 1,
0.1061487, -2.418039, 3.209541, 0, 0.8078431, 1, 1,
0.1071209, 0.721105, -0.4581871, 0, 0.8039216, 1, 1,
0.1085776, 0.543012, 0.4495761, 0, 0.7960784, 1, 1,
0.1111719, 0.9752211, -0.2513948, 0, 0.7882353, 1, 1,
0.1115496, 0.8915733, 1.492984, 0, 0.7843137, 1, 1,
0.1125818, 1.2107, 0.812592, 0, 0.7764706, 1, 1,
0.1148954, 0.3998057, 0.4646916, 0, 0.772549, 1, 1,
0.1179498, -1.179553, 2.533521, 0, 0.7647059, 1, 1,
0.1187654, 0.6029029, -0.9037864, 0, 0.7607843, 1, 1,
0.1386443, -1.019951, 1.657642, 0, 0.7529412, 1, 1,
0.1392405, 3.097268, 0.6928244, 0, 0.7490196, 1, 1,
0.1445497, 1.223255, 1.046313, 0, 0.7411765, 1, 1,
0.1454057, -0.2745234, 1.76123, 0, 0.7372549, 1, 1,
0.1460029, 0.8306796, -1.081888, 0, 0.7294118, 1, 1,
0.1479948, -0.8801261, 2.683792, 0, 0.7254902, 1, 1,
0.153371, 1.628623, 2.318514, 0, 0.7176471, 1, 1,
0.1549983, 0.944511, -0.9289461, 0, 0.7137255, 1, 1,
0.1551836, 0.1297071, 1.352389, 0, 0.7058824, 1, 1,
0.1577851, 0.4017985, 0.05320897, 0, 0.6980392, 1, 1,
0.1591392, 1.054835, 0.3410722, 0, 0.6941177, 1, 1,
0.1592521, 1.114195, -0.6358825, 0, 0.6862745, 1, 1,
0.1630038, 0.4273537, 1.396507, 0, 0.682353, 1, 1,
0.1639395, 1.320271, -0.8191543, 0, 0.6745098, 1, 1,
0.1658437, -0.981319, 3.218089, 0, 0.6705883, 1, 1,
0.1673765, 0.746367, 1.51386, 0, 0.6627451, 1, 1,
0.1681089, 1.503696, -0.2985287, 0, 0.6588235, 1, 1,
0.1687222, 0.741478, 0.01021859, 0, 0.6509804, 1, 1,
0.1697113, 1.298195, -0.2535374, 0, 0.6470588, 1, 1,
0.1748766, 0.4562694, 0.6215727, 0, 0.6392157, 1, 1,
0.1784964, -0.1215487, 2.026021, 0, 0.6352941, 1, 1,
0.1791672, -0.7477373, 3.055031, 0, 0.627451, 1, 1,
0.1876558, 0.9394547, -0.4702523, 0, 0.6235294, 1, 1,
0.1927985, -0.6314176, 2.553033, 0, 0.6156863, 1, 1,
0.1977596, 0.2566749, 0.4876444, 0, 0.6117647, 1, 1,
0.199538, 1.092794, -0.6777486, 0, 0.6039216, 1, 1,
0.2016403, -1.449138, 3.384221, 0, 0.5960785, 1, 1,
0.2024432, 1.258473, 0.5558323, 0, 0.5921569, 1, 1,
0.2063843, -0.8461386, 2.586866, 0, 0.5843138, 1, 1,
0.2178255, 0.9513844, 0.1475978, 0, 0.5803922, 1, 1,
0.2238947, -0.8526849, 1.720751, 0, 0.572549, 1, 1,
0.2309594, 0.246035, 1.424253, 0, 0.5686275, 1, 1,
0.2350224, -2.324725, 3.384113, 0, 0.5607843, 1, 1,
0.238721, -3.015757, 2.514853, 0, 0.5568628, 1, 1,
0.2390166, 0.01852921, 1.751934, 0, 0.5490196, 1, 1,
0.2390321, -0.4311678, 3.379101, 0, 0.5450981, 1, 1,
0.2422026, -0.1621563, 2.696961, 0, 0.5372549, 1, 1,
0.2438834, -0.1983538, 0.5392725, 0, 0.5333334, 1, 1,
0.2455087, -0.2996435, 2.943889, 0, 0.5254902, 1, 1,
0.2472596, -0.4346015, 1.873038, 0, 0.5215687, 1, 1,
0.2477302, 1.807253, 1.246906, 0, 0.5137255, 1, 1,
0.2479565, 1.553514, 0.4439981, 0, 0.509804, 1, 1,
0.2492735, -0.04166381, 3.986527, 0, 0.5019608, 1, 1,
0.2514381, 0.03915442, 0.852971, 0, 0.4941176, 1, 1,
0.2523712, 0.03098361, 0.591442, 0, 0.4901961, 1, 1,
0.2524499, -0.1678743, 1.214841, 0, 0.4823529, 1, 1,
0.2547702, 0.2322436, 2.845909, 0, 0.4784314, 1, 1,
0.2572483, -0.1690864, 1.944499, 0, 0.4705882, 1, 1,
0.2573589, -0.2661159, 2.642756, 0, 0.4666667, 1, 1,
0.2578678, 0.3970382, 0.4052638, 0, 0.4588235, 1, 1,
0.2584479, 1.519655, 1.263054, 0, 0.454902, 1, 1,
0.2593527, -0.3069669, 2.591051, 0, 0.4470588, 1, 1,
0.2637953, -0.1876853, 1.842191, 0, 0.4431373, 1, 1,
0.2642277, 0.8624734, 0.9186583, 0, 0.4352941, 1, 1,
0.2696794, 0.9269358, -0.2318497, 0, 0.4313726, 1, 1,
0.2708171, -0.7653407, 2.787689, 0, 0.4235294, 1, 1,
0.271865, -1.069455, 5.055669, 0, 0.4196078, 1, 1,
0.2737547, 0.6967563, -0.5297528, 0, 0.4117647, 1, 1,
0.2754305, 0.5143256, 0.475566, 0, 0.4078431, 1, 1,
0.2787573, -1.059304, 3.483539, 0, 0.4, 1, 1,
0.2829158, -1.253413, 4.21207, 0, 0.3921569, 1, 1,
0.2831478, 0.1942526, 2.21559, 0, 0.3882353, 1, 1,
0.2850547, -0.7785144, 2.623996, 0, 0.3803922, 1, 1,
0.2868291, 0.9740517, -0.7985129, 0, 0.3764706, 1, 1,
0.2891863, -0.9611444, 1.842857, 0, 0.3686275, 1, 1,
0.290723, -0.2212342, 2.819775, 0, 0.3647059, 1, 1,
0.2973959, -0.2692352, 1.508635, 0, 0.3568628, 1, 1,
0.2988589, -0.08434481, 1.545567, 0, 0.3529412, 1, 1,
0.3001629, 1.275091, 0.4703287, 0, 0.345098, 1, 1,
0.301115, -1.083458, 1.632593, 0, 0.3411765, 1, 1,
0.3017856, 0.9993052, -0.2332803, 0, 0.3333333, 1, 1,
0.3020371, -0.04821874, -0.1338696, 0, 0.3294118, 1, 1,
0.3050274, -1.786599, 0.8379006, 0, 0.3215686, 1, 1,
0.3053758, -0.8922424, 3.055587, 0, 0.3176471, 1, 1,
0.3076588, -0.8194805, 2.426126, 0, 0.3098039, 1, 1,
0.3093364, -0.4437263, 1.466723, 0, 0.3058824, 1, 1,
0.3096507, 0.253877, 1.793563, 0, 0.2980392, 1, 1,
0.3119215, -0.329646, 2.513613, 0, 0.2901961, 1, 1,
0.3166526, -0.2184938, 3.869207, 0, 0.2862745, 1, 1,
0.3183421, 1.156606, 0.7070147, 0, 0.2784314, 1, 1,
0.320222, 1.255031, -0.3780458, 0, 0.2745098, 1, 1,
0.3208328, 0.322459, 1.776501, 0, 0.2666667, 1, 1,
0.3215672, 0.1115903, 3.421048, 0, 0.2627451, 1, 1,
0.3231052, -0.8310437, 3.464042, 0, 0.254902, 1, 1,
0.3236454, 2.225163, -0.7807306, 0, 0.2509804, 1, 1,
0.323724, -0.1123767, 1.39129, 0, 0.2431373, 1, 1,
0.3251041, 1.576524, 0.810594, 0, 0.2392157, 1, 1,
0.3253866, 0.7017459, -0.05280388, 0, 0.2313726, 1, 1,
0.3266563, 0.8013567, 1.816114, 0, 0.227451, 1, 1,
0.3282337, -1.339201, 2.155825, 0, 0.2196078, 1, 1,
0.3367642, 1.570076, 0.16118, 0, 0.2156863, 1, 1,
0.3371561, 0.06427534, 1.905492, 0, 0.2078431, 1, 1,
0.3374512, 0.006700102, 3.995802, 0, 0.2039216, 1, 1,
0.3395195, -1.405831, 2.418064, 0, 0.1960784, 1, 1,
0.3400174, 1.291296, -0.9229194, 0, 0.1882353, 1, 1,
0.3405246, 0.4956498, 0.9079819, 0, 0.1843137, 1, 1,
0.3561839, -0.150468, 0.9023883, 0, 0.1764706, 1, 1,
0.3582754, 1.503829, -1.272125, 0, 0.172549, 1, 1,
0.3590811, -0.854205, 2.391406, 0, 0.1647059, 1, 1,
0.3592336, 0.191251, 2.434617, 0, 0.1607843, 1, 1,
0.3696193, -1.512911, 2.667481, 0, 0.1529412, 1, 1,
0.3738162, 2.113146, 0.3456979, 0, 0.1490196, 1, 1,
0.3740236, 1.312578, 1.487253, 0, 0.1411765, 1, 1,
0.3759389, 0.04198057, 3.199766, 0, 0.1372549, 1, 1,
0.3785628, 0.7092569, 0.6207882, 0, 0.1294118, 1, 1,
0.3797401, 0.6889218, 0.1451589, 0, 0.1254902, 1, 1,
0.3800025, -2.20035, 3.314686, 0, 0.1176471, 1, 1,
0.3837936, 1.382449, -1.278197, 0, 0.1137255, 1, 1,
0.3847036, 1.317841, 0.8611488, 0, 0.1058824, 1, 1,
0.3853301, 0.2685744, -0.1652739, 0, 0.09803922, 1, 1,
0.3853692, -1.403646, 5.540281, 0, 0.09411765, 1, 1,
0.3862744, 2.116377, -2.768284, 0, 0.08627451, 1, 1,
0.3879074, 0.5607657, 1.991762, 0, 0.08235294, 1, 1,
0.3947974, -0.2519749, 0.8961366, 0, 0.07450981, 1, 1,
0.3949417, 0.1897233, 2.850842, 0, 0.07058824, 1, 1,
0.397782, -0.8658913, 3.046775, 0, 0.0627451, 1, 1,
0.3986202, -0.3266415, 2.462464, 0, 0.05882353, 1, 1,
0.4000995, -1.223866, 1.914591, 0, 0.05098039, 1, 1,
0.4023466, -1.156469, 3.055707, 0, 0.04705882, 1, 1,
0.4052858, 2.32759, -0.05406697, 0, 0.03921569, 1, 1,
0.4142338, 1.291261, 0.9188841, 0, 0.03529412, 1, 1,
0.4150038, -1.46711, 2.067485, 0, 0.02745098, 1, 1,
0.415835, -1.583774, 2.558961, 0, 0.02352941, 1, 1,
0.416201, 0.2535808, 1.485911, 0, 0.01568628, 1, 1,
0.4173208, -0.5813507, 2.246125, 0, 0.01176471, 1, 1,
0.417544, 0.4039938, 1.373157, 0, 0.003921569, 1, 1,
0.4195394, 0.5145397, 1.658055, 0.003921569, 0, 1, 1,
0.4240278, -0.06086989, 0.7214481, 0.007843138, 0, 1, 1,
0.4265892, 0.1714195, 1.822538, 0.01568628, 0, 1, 1,
0.4272164, -1.630064, 2.218986, 0.01960784, 0, 1, 1,
0.4291725, 0.582023, 1.035677, 0.02745098, 0, 1, 1,
0.4307988, 0.04223425, 2.716232, 0.03137255, 0, 1, 1,
0.4309734, -1.127065, 4.034384, 0.03921569, 0, 1, 1,
0.4327138, -0.6725891, 2.666951, 0.04313726, 0, 1, 1,
0.4337126, -0.4929802, 3.412392, 0.05098039, 0, 1, 1,
0.4337772, -0.1016627, 1.953602, 0.05490196, 0, 1, 1,
0.4487661, 1.058709, -0.8030258, 0.0627451, 0, 1, 1,
0.449308, 0.663047, -0.06111424, 0.06666667, 0, 1, 1,
0.4506015, 0.9683663, -0.5183659, 0.07450981, 0, 1, 1,
0.4516189, 1.752641, -2.170257, 0.07843138, 0, 1, 1,
0.4527944, -0.9299111, 4.414308, 0.08627451, 0, 1, 1,
0.4538427, 0.2207682, 1.139681, 0.09019608, 0, 1, 1,
0.4593241, 0.8630327, 0.912681, 0.09803922, 0, 1, 1,
0.464846, -0.7285774, 1.4986, 0.1058824, 0, 1, 1,
0.4664031, -1.059748, 2.237648, 0.1098039, 0, 1, 1,
0.4664906, -0.1226754, 2.122414, 0.1176471, 0, 1, 1,
0.4691822, 1.897567, 1.151201, 0.1215686, 0, 1, 1,
0.4691973, 1.427396, 0.8841929, 0.1294118, 0, 1, 1,
0.4709472, 1.297498, 0.4098614, 0.1333333, 0, 1, 1,
0.4709892, 0.5801866, 0.9076862, 0.1411765, 0, 1, 1,
0.4712228, 0.6440887, 0.5835961, 0.145098, 0, 1, 1,
0.4714323, -0.3613686, 2.047801, 0.1529412, 0, 1, 1,
0.4717915, 0.4439266, 1.375486, 0.1568628, 0, 1, 1,
0.4735045, -0.6006353, 2.194886, 0.1647059, 0, 1, 1,
0.4746721, 0.7444174, -1.144472, 0.1686275, 0, 1, 1,
0.4774776, 0.8107803, -0.9681234, 0.1764706, 0, 1, 1,
0.4799639, 0.639116, 0.0002372338, 0.1803922, 0, 1, 1,
0.4812694, -0.2716965, 1.689999, 0.1882353, 0, 1, 1,
0.4856765, 0.9235781, 1.254929, 0.1921569, 0, 1, 1,
0.4886054, -0.3494202, 3.343039, 0.2, 0, 1, 1,
0.5020314, -1.59658, 2.269703, 0.2078431, 0, 1, 1,
0.5021975, -0.3909629, 3.287328, 0.2117647, 0, 1, 1,
0.5039372, 0.6787196, 1.744796, 0.2196078, 0, 1, 1,
0.505729, 0.304346, 1.384751, 0.2235294, 0, 1, 1,
0.5095955, -1.477935, 2.821136, 0.2313726, 0, 1, 1,
0.5145646, -1.089134, 1.0356, 0.2352941, 0, 1, 1,
0.5221231, -0.7939516, 1.414313, 0.2431373, 0, 1, 1,
0.5231647, -0.9310678, 1.958948, 0.2470588, 0, 1, 1,
0.5360559, -0.647481, 4.449195, 0.254902, 0, 1, 1,
0.5371349, 0.6299112, 1.671336, 0.2588235, 0, 1, 1,
0.5377926, 0.4311422, -0.7239031, 0.2666667, 0, 1, 1,
0.5383678, 0.1525132, 2.266645, 0.2705882, 0, 1, 1,
0.5473707, 0.05448185, 1.23648, 0.2784314, 0, 1, 1,
0.5498006, 0.3418703, 2.293386, 0.282353, 0, 1, 1,
0.5545073, 1.006014, 0.9836164, 0.2901961, 0, 1, 1,
0.5550477, -1.403504, 3.743095, 0.2941177, 0, 1, 1,
0.5602428, -0.2676786, 1.85574, 0.3019608, 0, 1, 1,
0.5605851, -0.5899506, 2.376761, 0.3098039, 0, 1, 1,
0.5632736, -0.6318854, 1.769731, 0.3137255, 0, 1, 1,
0.5691405, -0.3511808, 0.6455318, 0.3215686, 0, 1, 1,
0.5709983, -1.530247, 1.799375, 0.3254902, 0, 1, 1,
0.5729887, -1.083092, 4.047216, 0.3333333, 0, 1, 1,
0.5737746, 0.7452658, 0.284694, 0.3372549, 0, 1, 1,
0.5759907, 0.3974913, 0.4481138, 0.345098, 0, 1, 1,
0.576105, 0.3243938, 0.002482818, 0.3490196, 0, 1, 1,
0.5762079, -1.060508, 2.318761, 0.3568628, 0, 1, 1,
0.5856848, -0.09611826, 0.01840997, 0.3607843, 0, 1, 1,
0.5885201, 0.2748165, 1.421753, 0.3686275, 0, 1, 1,
0.5910541, 2.051745, 1.31576, 0.372549, 0, 1, 1,
0.5955723, 1.326024, -0.9841959, 0.3803922, 0, 1, 1,
0.5971038, 0.3682972, 1.994695, 0.3843137, 0, 1, 1,
0.5982323, -0.8113506, 2.832769, 0.3921569, 0, 1, 1,
0.6025383, 1.284283, 0.3010691, 0.3960784, 0, 1, 1,
0.6037132, -1.255071, 0.8538966, 0.4039216, 0, 1, 1,
0.6069816, -0.8865259, 3.515595, 0.4117647, 0, 1, 1,
0.6122214, 0.2031451, 1.19784, 0.4156863, 0, 1, 1,
0.6138522, 0.4570366, 0.009472184, 0.4235294, 0, 1, 1,
0.6223024, 1.286512, 0.1744178, 0.427451, 0, 1, 1,
0.6225792, 0.8345143, 0.8457358, 0.4352941, 0, 1, 1,
0.6241209, 0.2903908, 1.211961, 0.4392157, 0, 1, 1,
0.6276362, 0.8668371, 1.245486, 0.4470588, 0, 1, 1,
0.63105, 2.211782, -0.9375035, 0.4509804, 0, 1, 1,
0.6341425, 1.22925, 2.184988, 0.4588235, 0, 1, 1,
0.6408895, 0.9882247, 0.7244354, 0.4627451, 0, 1, 1,
0.6424183, 0.1846386, 1.413536, 0.4705882, 0, 1, 1,
0.6444535, 0.6094645, 4.667973, 0.4745098, 0, 1, 1,
0.6498545, -1.679249, 1.245382, 0.4823529, 0, 1, 1,
0.6582476, 0.6726889, 2.156099, 0.4862745, 0, 1, 1,
0.6599591, 0.2264656, -0.7659418, 0.4941176, 0, 1, 1,
0.66019, 1.844142, 1.142808, 0.5019608, 0, 1, 1,
0.6653717, 0.2615723, 0.6635904, 0.5058824, 0, 1, 1,
0.6707746, -1.929497, 3.093426, 0.5137255, 0, 1, 1,
0.6747649, 0.1750892, 2.915154, 0.5176471, 0, 1, 1,
0.6866418, -1.2261, 3.084064, 0.5254902, 0, 1, 1,
0.6935133, -1.491285, 3.06769, 0.5294118, 0, 1, 1,
0.6981545, 0.2970017, 1.252469, 0.5372549, 0, 1, 1,
0.6993007, 1.331056, -0.4330213, 0.5411765, 0, 1, 1,
0.7004457, -0.0004006066, 0.7222738, 0.5490196, 0, 1, 1,
0.7013716, 0.9826897, -0.9877312, 0.5529412, 0, 1, 1,
0.7054855, -2.691968, 2.502254, 0.5607843, 0, 1, 1,
0.7081367, 0.5370728, 0.01523825, 0.5647059, 0, 1, 1,
0.713987, 1.399712, -0.4243179, 0.572549, 0, 1, 1,
0.7156738, -0.9799063, 2.817579, 0.5764706, 0, 1, 1,
0.7223514, -0.6039371, 1.431884, 0.5843138, 0, 1, 1,
0.7245439, -0.6060106, 2.038305, 0.5882353, 0, 1, 1,
0.7320606, -0.6472798, 1.875633, 0.5960785, 0, 1, 1,
0.7367728, 2.27768, -0.01093179, 0.6039216, 0, 1, 1,
0.7444584, -0.4865405, 2.774209, 0.6078432, 0, 1, 1,
0.7449904, -0.9193859, 1.902159, 0.6156863, 0, 1, 1,
0.7573867, -0.5344741, 3.184674, 0.6196079, 0, 1, 1,
0.7646375, -0.2857791, 0.4341072, 0.627451, 0, 1, 1,
0.7659059, 1.545933, -0.7529815, 0.6313726, 0, 1, 1,
0.7670384, -0.4613545, 2.183574, 0.6392157, 0, 1, 1,
0.7712966, -1.761794, 1.550298, 0.6431373, 0, 1, 1,
0.7739298, 1.063442, 0.9258915, 0.6509804, 0, 1, 1,
0.7812231, -0.6219032, 1.455178, 0.654902, 0, 1, 1,
0.7862709, 1.416533, 1.483318, 0.6627451, 0, 1, 1,
0.7870673, -1.729083, 2.09018, 0.6666667, 0, 1, 1,
0.7884719, -0.924858, 2.762016, 0.6745098, 0, 1, 1,
0.7920145, 1.997784, -1.416799, 0.6784314, 0, 1, 1,
0.7950632, 0.1911522, 1.737017, 0.6862745, 0, 1, 1,
0.8038, 1.33782, 2.643673, 0.6901961, 0, 1, 1,
0.8052303, 0.1109597, 0.7182994, 0.6980392, 0, 1, 1,
0.8065095, 0.8658301, -0.2824983, 0.7058824, 0, 1, 1,
0.81182, -0.4547204, 1.738896, 0.7098039, 0, 1, 1,
0.812295, 0.2782398, 1.040751, 0.7176471, 0, 1, 1,
0.8126116, -0.148882, 0.1952526, 0.7215686, 0, 1, 1,
0.8142021, 0.5555083, 0.7177182, 0.7294118, 0, 1, 1,
0.8252212, -0.2088625, 2.471689, 0.7333333, 0, 1, 1,
0.8270851, -0.7427388, 2.237395, 0.7411765, 0, 1, 1,
0.8307916, 0.1649213, 0.9371761, 0.7450981, 0, 1, 1,
0.8342747, -0.3801324, 2.022508, 0.7529412, 0, 1, 1,
0.8435131, -0.276056, 2.389818, 0.7568628, 0, 1, 1,
0.8435975, -0.1116301, 2.447347, 0.7647059, 0, 1, 1,
0.8466212, 0.4026406, 1.413058, 0.7686275, 0, 1, 1,
0.848349, 1.133914, 1.996059, 0.7764706, 0, 1, 1,
0.8525134, 0.7736503, -0.7137781, 0.7803922, 0, 1, 1,
0.8585172, -0.4761734, 3.553611, 0.7882353, 0, 1, 1,
0.8656186, -2.180962, 2.818519, 0.7921569, 0, 1, 1,
0.8746325, -3.076508, 2.664468, 0.8, 0, 1, 1,
0.8777689, 0.3823457, 3.133241, 0.8078431, 0, 1, 1,
0.8813288, 0.7674521, 0.5461147, 0.8117647, 0, 1, 1,
0.8851881, -1.693312, 2.3709, 0.8196079, 0, 1, 1,
0.8893576, -0.5649921, 2.766962, 0.8235294, 0, 1, 1,
0.892746, 1.200207, 0.2808728, 0.8313726, 0, 1, 1,
0.8928813, 0.8821996, 0.7986484, 0.8352941, 0, 1, 1,
0.89527, 0.2624983, 2.532766, 0.8431373, 0, 1, 1,
0.8963262, 0.1862066, 0.8496946, 0.8470588, 0, 1, 1,
0.8999178, 0.05851775, 2.219205, 0.854902, 0, 1, 1,
0.9018808, -0.6477746, 2.033813, 0.8588235, 0, 1, 1,
0.9041337, -0.7240928, 2.210606, 0.8666667, 0, 1, 1,
0.9061487, 0.2122721, -0.1634646, 0.8705882, 0, 1, 1,
0.9094457, 0.2810842, 2.888502, 0.8784314, 0, 1, 1,
0.9138893, -0.880509, 2.312622, 0.8823529, 0, 1, 1,
0.9187057, 0.2233524, 0.9816645, 0.8901961, 0, 1, 1,
0.9250151, -2.285938, 1.253866, 0.8941177, 0, 1, 1,
0.9289157, -1.105667, 2.859241, 0.9019608, 0, 1, 1,
0.9297918, -1.854245, 3.62035, 0.9098039, 0, 1, 1,
0.9298042, 1.066771, 2.622722, 0.9137255, 0, 1, 1,
0.9317279, -0.5305411, 2.690109, 0.9215686, 0, 1, 1,
0.9323817, 1.035267, -1.917285, 0.9254902, 0, 1, 1,
0.9400945, -0.4088076, 3.038023, 0.9333333, 0, 1, 1,
0.9404423, -0.548188, 2.976036, 0.9372549, 0, 1, 1,
0.9404936, 0.8506823, 0.8850845, 0.945098, 0, 1, 1,
0.9550752, -0.831957, 1.830558, 0.9490196, 0, 1, 1,
0.9582071, 0.7192248, 1.634936, 0.9568627, 0, 1, 1,
0.9620025, 1.338773, 2.075415, 0.9607843, 0, 1, 1,
0.9680146, 0.5318189, 0.4948227, 0.9686275, 0, 1, 1,
0.9731244, 1.144544, 2.145949, 0.972549, 0, 1, 1,
0.9742461, -0.1525149, 0.7104792, 0.9803922, 0, 1, 1,
0.9773239, 0.7333965, 2.141849, 0.9843137, 0, 1, 1,
0.9915981, 1.260138, 0.8577173, 0.9921569, 0, 1, 1,
1.000437, 0.9726518, 0.655585, 0.9960784, 0, 1, 1,
1.002342, 0.9633879, 1.741774, 1, 0, 0.9960784, 1,
1.005617, 1.310229, 1.328377, 1, 0, 0.9882353, 1,
1.007306, 0.1039954, 0.6434652, 1, 0, 0.9843137, 1,
1.011775, -0.9622535, 2.535699, 1, 0, 0.9764706, 1,
1.014254, -0.4125841, 1.18679, 1, 0, 0.972549, 1,
1.014291, -0.3526768, 0.7855738, 1, 0, 0.9647059, 1,
1.017444, 2.759945, 1.448348, 1, 0, 0.9607843, 1,
1.019736, 0.7640147, 0.7637616, 1, 0, 0.9529412, 1,
1.021625, -0.2114348, 3.214116, 1, 0, 0.9490196, 1,
1.022574, -0.2217738, 2.43296, 1, 0, 0.9411765, 1,
1.026429, 0.5930572, -0.6123093, 1, 0, 0.9372549, 1,
1.028268, -0.4864626, 3.94123, 1, 0, 0.9294118, 1,
1.031467, -1.881033, 2.606954, 1, 0, 0.9254902, 1,
1.040873, -0.1861878, 2.237408, 1, 0, 0.9176471, 1,
1.045661, 0.2823879, 2.211923, 1, 0, 0.9137255, 1,
1.048034, 0.9598524, -0.03449848, 1, 0, 0.9058824, 1,
1.049221, 0.6092193, 0.6487659, 1, 0, 0.9019608, 1,
1.051247, -0.2500841, 1.9147, 1, 0, 0.8941177, 1,
1.053155, 0.6342371, 1.696973, 1, 0, 0.8862745, 1,
1.058955, -0.7131486, 3.675991, 1, 0, 0.8823529, 1,
1.061769, -0.711069, 2.663491, 1, 0, 0.8745098, 1,
1.062071, -0.685887, 3.985306, 1, 0, 0.8705882, 1,
1.063653, 1.75389, 0.6181465, 1, 0, 0.8627451, 1,
1.073819, -0.7316629, 1.99799, 1, 0, 0.8588235, 1,
1.080367, -1.139265, 3.486682, 1, 0, 0.8509804, 1,
1.083138, -1.075049, 2.740117, 1, 0, 0.8470588, 1,
1.086529, 0.1127748, 2.708419, 1, 0, 0.8392157, 1,
1.089278, 1.359672, -0.9220167, 1, 0, 0.8352941, 1,
1.091639, 1.286102, 1.144976, 1, 0, 0.827451, 1,
1.098304, 0.925408, -0.2921474, 1, 0, 0.8235294, 1,
1.10373, 1.172003, -0.116289, 1, 0, 0.8156863, 1,
1.113456, 0.3360687, 3.758739, 1, 0, 0.8117647, 1,
1.114578, -0.2870849, 1.832375, 1, 0, 0.8039216, 1,
1.115965, 0.04627126, 0.8806087, 1, 0, 0.7960784, 1,
1.116075, -0.3026368, 1.265781, 1, 0, 0.7921569, 1,
1.124896, -0.4119852, 1.688329, 1, 0, 0.7843137, 1,
1.128702, 0.5297173, 1.904041, 1, 0, 0.7803922, 1,
1.130331, 0.8463474, 2.115748, 1, 0, 0.772549, 1,
1.130782, 0.2249942, 0.8306512, 1, 0, 0.7686275, 1,
1.130886, -0.4525122, 1.201842, 1, 0, 0.7607843, 1,
1.132217, -0.3737708, 3.603015, 1, 0, 0.7568628, 1,
1.134613, 1.219842, 2.623754, 1, 0, 0.7490196, 1,
1.140493, 0.3388467, 2.496954, 1, 0, 0.7450981, 1,
1.145161, 0.869342, 0.2211613, 1, 0, 0.7372549, 1,
1.148368, -0.07479624, 1.408412, 1, 0, 0.7333333, 1,
1.149345, -0.8393026, 3.766338, 1, 0, 0.7254902, 1,
1.176012, 0.464049, 1.713385, 1, 0, 0.7215686, 1,
1.177598, 1.280992, 0.6104069, 1, 0, 0.7137255, 1,
1.179528, -0.6515988, 1.414109, 1, 0, 0.7098039, 1,
1.180443, -0.6165199, 0.5095893, 1, 0, 0.7019608, 1,
1.197758, 0.1325458, 1.843738, 1, 0, 0.6941177, 1,
1.203414, -0.1875233, 1.28725, 1, 0, 0.6901961, 1,
1.212866, 0.552652, 1.693266, 1, 0, 0.682353, 1,
1.228234, -1.320236, 3.09148, 1, 0, 0.6784314, 1,
1.228443, 1.015494, 0.3830203, 1, 0, 0.6705883, 1,
1.230271, -0.4332387, 0.5032818, 1, 0, 0.6666667, 1,
1.232934, 0.4306323, 1.58294, 1, 0, 0.6588235, 1,
1.234577, -0.5301782, 1.046786, 1, 0, 0.654902, 1,
1.238233, -0.3028597, 3.531541, 1, 0, 0.6470588, 1,
1.239268, 0.5863686, 1.7419, 1, 0, 0.6431373, 1,
1.241263, -1.553092, 2.069527, 1, 0, 0.6352941, 1,
1.244167, 0.633261, -0.3857798, 1, 0, 0.6313726, 1,
1.254698, -1.827551, 2.035947, 1, 0, 0.6235294, 1,
1.260088, -2.021118, 3.671702, 1, 0, 0.6196079, 1,
1.265599, -1.463574, 2.713035, 1, 0, 0.6117647, 1,
1.265877, -1.268301, 3.417733, 1, 0, 0.6078432, 1,
1.269834, 1.389021, 1.210801, 1, 0, 0.6, 1,
1.285427, 0.8588645, 0.3261693, 1, 0, 0.5921569, 1,
1.290139, 1.961054, 1.597398, 1, 0, 0.5882353, 1,
1.296879, 0.06434915, 2.620341, 1, 0, 0.5803922, 1,
1.298719, -0.9900261, 2.898677, 1, 0, 0.5764706, 1,
1.301979, -0.6367556, 1.400724, 1, 0, 0.5686275, 1,
1.30325, 0.1650848, 2.063521, 1, 0, 0.5647059, 1,
1.314277, 0.8046873, 0.5172462, 1, 0, 0.5568628, 1,
1.317628, 1.557972, -0.5701536, 1, 0, 0.5529412, 1,
1.321502, 0.9090095, -0.4474754, 1, 0, 0.5450981, 1,
1.32395, 0.03586868, 0.6037328, 1, 0, 0.5411765, 1,
1.325428, 0.7461919, 3.172243, 1, 0, 0.5333334, 1,
1.330613, 0.8108471, 1.705737, 1, 0, 0.5294118, 1,
1.358722, 0.5244349, 1.320536, 1, 0, 0.5215687, 1,
1.374774, 0.4721338, 1.909809, 1, 0, 0.5176471, 1,
1.389683, 0.4212954, 0.7760577, 1, 0, 0.509804, 1,
1.393372, -0.346504, 2.752602, 1, 0, 0.5058824, 1,
1.398779, 0.3359743, 1.578325, 1, 0, 0.4980392, 1,
1.412023, 0.1322005, 0.02102522, 1, 0, 0.4901961, 1,
1.413238, -1.32872, 2.954938, 1, 0, 0.4862745, 1,
1.425484, 1.344672, 0.8117675, 1, 0, 0.4784314, 1,
1.434835, -0.1766481, 2.392617, 1, 0, 0.4745098, 1,
1.437425, -0.7359685, 1.784984, 1, 0, 0.4666667, 1,
1.445375, -1.06999, 1.3157, 1, 0, 0.4627451, 1,
1.459944, 0.5170694, 1.256473, 1, 0, 0.454902, 1,
1.471261, -0.1064837, 1.265577, 1, 0, 0.4509804, 1,
1.478202, 0.5942745, 1.31212, 1, 0, 0.4431373, 1,
1.485723, -3.206599, 2.836329, 1, 0, 0.4392157, 1,
1.490905, -0.3493909, 0.5219667, 1, 0, 0.4313726, 1,
1.513976, 2.305948, -0.3063587, 1, 0, 0.427451, 1,
1.51709, 0.1488385, 3.514419, 1, 0, 0.4196078, 1,
1.556559, 0.04703099, 1.131234, 1, 0, 0.4156863, 1,
1.564579, 2.001889, 0.7293974, 1, 0, 0.4078431, 1,
1.569734, -1.21428, 3.191188, 1, 0, 0.4039216, 1,
1.576321, -0.5771074, 3.427463, 1, 0, 0.3960784, 1,
1.600352, 0.643349, 0.877184, 1, 0, 0.3882353, 1,
1.609031, -1.059522, 1.739121, 1, 0, 0.3843137, 1,
1.612889, 1.033967, 1.295941, 1, 0, 0.3764706, 1,
1.620106, 0.1717334, 1.089958, 1, 0, 0.372549, 1,
1.625692, -0.1617534, 1.996774, 1, 0, 0.3647059, 1,
1.627941, -0.8890815, 0.6818545, 1, 0, 0.3607843, 1,
1.63452, -2.149081, 2.656183, 1, 0, 0.3529412, 1,
1.635754, -1.137315, 2.277417, 1, 0, 0.3490196, 1,
1.637226, -0.4572473, 2.298613, 1, 0, 0.3411765, 1,
1.638159, -0.1909131, 0.4406126, 1, 0, 0.3372549, 1,
1.651801, 0.2637856, 0.820462, 1, 0, 0.3294118, 1,
1.679264, 0.06969365, 0.4313652, 1, 0, 0.3254902, 1,
1.689482, -0.04365417, 1.212637, 1, 0, 0.3176471, 1,
1.698096, -1.109339, -0.05454706, 1, 0, 0.3137255, 1,
1.708711, 0.8420326, -0.4516977, 1, 0, 0.3058824, 1,
1.716035, -0.9730334, 1.388569, 1, 0, 0.2980392, 1,
1.717991, -0.5306756, 1.868688, 1, 0, 0.2941177, 1,
1.725966, 1.759931, 1.403457, 1, 0, 0.2862745, 1,
1.729655, -0.7011666, 1.733739, 1, 0, 0.282353, 1,
1.745963, -1.510915, 3.761953, 1, 0, 0.2745098, 1,
1.747237, -0.2723204, 1.032699, 1, 0, 0.2705882, 1,
1.754129, -0.9379227, 3.207834, 1, 0, 0.2627451, 1,
1.757085, 0.5129601, 1.725323, 1, 0, 0.2588235, 1,
1.759558, -0.2945388, 1.682868, 1, 0, 0.2509804, 1,
1.760287, 1.099406, 1.418795, 1, 0, 0.2470588, 1,
1.778785, 1.540076, -0.6065146, 1, 0, 0.2392157, 1,
1.793201, 0.7700788, 2.839216, 1, 0, 0.2352941, 1,
1.830563, 1.435028, 0.348076, 1, 0, 0.227451, 1,
1.837112, -0.7525206, 0.3488129, 1, 0, 0.2235294, 1,
1.839022, -1.002725, 3.21314, 1, 0, 0.2156863, 1,
1.898303, 0.6260458, 1.393704, 1, 0, 0.2117647, 1,
1.903399, 0.6658163, -0.9262409, 1, 0, 0.2039216, 1,
1.9075, -0.4419582, 2.024479, 1, 0, 0.1960784, 1,
1.937471, 0.2674867, 3.589705, 1, 0, 0.1921569, 1,
1.957624, -1.151675, 1.751762, 1, 0, 0.1843137, 1,
1.957978, -0.146063, 2.096016, 1, 0, 0.1803922, 1,
1.969493, -0.5708359, 0.6959448, 1, 0, 0.172549, 1,
1.974375, 0.4986777, 0.8122848, 1, 0, 0.1686275, 1,
1.979246, 2.276705, 1.906891, 1, 0, 0.1607843, 1,
2.023064, 0.7168195, 1.426597, 1, 0, 0.1568628, 1,
2.042402, -2.127756, 1.745811, 1, 0, 0.1490196, 1,
2.044887, 1.088607, 0.8649818, 1, 0, 0.145098, 1,
2.11526, 1.193258, 1.991429, 1, 0, 0.1372549, 1,
2.123156, 0.5796979, 1.321137, 1, 0, 0.1333333, 1,
2.123734, 1.198038, 1.517706, 1, 0, 0.1254902, 1,
2.134374, -0.416364, 2.062745, 1, 0, 0.1215686, 1,
2.200573, -1.358388, 0.6599616, 1, 0, 0.1137255, 1,
2.228357, 1.538287, 0.8066113, 1, 0, 0.1098039, 1,
2.238193, -0.7782148, 1.886064, 1, 0, 0.1019608, 1,
2.280757, 0.8447902, 0.9364067, 1, 0, 0.09411765, 1,
2.324945, 0.1029798, 3.714548, 1, 0, 0.09019608, 1,
2.332071, -0.7315282, 3.736933, 1, 0, 0.08235294, 1,
2.354321, 1.343662, 0.429551, 1, 0, 0.07843138, 1,
2.442594, -0.1538437, 2.073702, 1, 0, 0.07058824, 1,
2.482554, 1.084898, 0.261539, 1, 0, 0.06666667, 1,
2.574708, -0.5855389, 1.080686, 1, 0, 0.05882353, 1,
2.677781, -0.2441474, 1.877703, 1, 0, 0.05490196, 1,
2.679534, 0.3120045, 1.667654, 1, 0, 0.04705882, 1,
2.732428, -1.508698, 0.7747216, 1, 0, 0.04313726, 1,
2.742129, 0.2958347, 2.096606, 1, 0, 0.03529412, 1,
2.758009, -0.7215413, 3.724806, 1, 0, 0.03137255, 1,
2.941093, 0.1838028, 0.4530316, 1, 0, 0.02352941, 1,
3.260916, 3.064423, 0.7115172, 1, 0, 0.01960784, 1,
3.408964, -0.2728098, 3.499687, 1, 0, 0.01176471, 1,
3.466404, 0.310084, 0.7481256, 1, 0, 0.007843138, 1
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
-0.155351, -5.133986, -6.512045, 0, -0.5, 0.5, 0.5,
-0.155351, -5.133986, -6.512045, 1, -0.5, 0.5, 0.5,
-0.155351, -5.133986, -6.512045, 1, 1.5, 0.5, 0.5,
-0.155351, -5.133986, -6.512045, 0, 1.5, 0.5, 0.5
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
-5.004881, -0.4218657, -6.512045, 0, -0.5, 0.5, 0.5,
-5.004881, -0.4218657, -6.512045, 1, -0.5, 0.5, 0.5,
-5.004881, -0.4218657, -6.512045, 1, 1.5, 0.5, 0.5,
-5.004881, -0.4218657, -6.512045, 0, 1.5, 0.5, 0.5
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
-5.004881, -5.133986, 0.3875122, 0, -0.5, 0.5, 0.5,
-5.004881, -5.133986, 0.3875122, 1, -0.5, 0.5, 0.5,
-5.004881, -5.133986, 0.3875122, 1, 1.5, 0.5, 0.5,
-5.004881, -5.133986, 0.3875122, 0, 1.5, 0.5, 0.5
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
-2, -4.046574, -4.91984,
2, -4.046574, -4.91984,
-2, -4.046574, -4.91984,
-2, -4.227809, -5.185207,
0, -4.046574, -4.91984,
0, -4.227809, -5.185207,
2, -4.046574, -4.91984,
2, -4.227809, -5.185207
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
"0",
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
-2, -4.59028, -5.715943, 0, -0.5, 0.5, 0.5,
-2, -4.59028, -5.715943, 1, -0.5, 0.5, 0.5,
-2, -4.59028, -5.715943, 1, 1.5, 0.5, 0.5,
-2, -4.59028, -5.715943, 0, 1.5, 0.5, 0.5,
0, -4.59028, -5.715943, 0, -0.5, 0.5, 0.5,
0, -4.59028, -5.715943, 1, -0.5, 0.5, 0.5,
0, -4.59028, -5.715943, 1, 1.5, 0.5, 0.5,
0, -4.59028, -5.715943, 0, 1.5, 0.5, 0.5,
2, -4.59028, -5.715943, 0, -0.5, 0.5, 0.5,
2, -4.59028, -5.715943, 1, -0.5, 0.5, 0.5,
2, -4.59028, -5.715943, 1, 1.5, 0.5, 0.5,
2, -4.59028, -5.715943, 0, 1.5, 0.5, 0.5
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
-3.885758, -2, -4.91984,
-3.885758, 2, -4.91984,
-3.885758, -2, -4.91984,
-4.072279, -2, -5.185207,
-3.885758, 0, -4.91984,
-4.072279, 0, -5.185207,
-3.885758, 2, -4.91984,
-4.072279, 2, -5.185207
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
-4.44532, -2, -5.715943, 0, -0.5, 0.5, 0.5,
-4.44532, -2, -5.715943, 1, -0.5, 0.5, 0.5,
-4.44532, -2, -5.715943, 1, 1.5, 0.5, 0.5,
-4.44532, -2, -5.715943, 0, 1.5, 0.5, 0.5,
-4.44532, 0, -5.715943, 0, -0.5, 0.5, 0.5,
-4.44532, 0, -5.715943, 1, -0.5, 0.5, 0.5,
-4.44532, 0, -5.715943, 1, 1.5, 0.5, 0.5,
-4.44532, 0, -5.715943, 0, 1.5, 0.5, 0.5,
-4.44532, 2, -5.715943, 0, -0.5, 0.5, 0.5,
-4.44532, 2, -5.715943, 1, -0.5, 0.5, 0.5,
-4.44532, 2, -5.715943, 1, 1.5, 0.5, 0.5,
-4.44532, 2, -5.715943, 0, 1.5, 0.5, 0.5
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
-3.885758, -4.046574, -4,
-3.885758, -4.046574, 4,
-3.885758, -4.046574, -4,
-4.072279, -4.227809, -4,
-3.885758, -4.046574, -2,
-4.072279, -4.227809, -2,
-3.885758, -4.046574, 0,
-4.072279, -4.227809, 0,
-3.885758, -4.046574, 2,
-4.072279, -4.227809, 2,
-3.885758, -4.046574, 4,
-4.072279, -4.227809, 4
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
-4.44532, -4.59028, -4, 0, -0.5, 0.5, 0.5,
-4.44532, -4.59028, -4, 1, -0.5, 0.5, 0.5,
-4.44532, -4.59028, -4, 1, 1.5, 0.5, 0.5,
-4.44532, -4.59028, -4, 0, 1.5, 0.5, 0.5,
-4.44532, -4.59028, -2, 0, -0.5, 0.5, 0.5,
-4.44532, -4.59028, -2, 1, -0.5, 0.5, 0.5,
-4.44532, -4.59028, -2, 1, 1.5, 0.5, 0.5,
-4.44532, -4.59028, -2, 0, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 0, 0, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 0, 1, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 0, 1, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 0, 0, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 2, 0, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 2, 1, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 2, 1, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 2, 0, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 4, 0, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 4, 1, -0.5, 0.5, 0.5,
-4.44532, -4.59028, 4, 1, 1.5, 0.5, 0.5,
-4.44532, -4.59028, 4, 0, 1.5, 0.5, 0.5
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
-3.885758, -4.046574, -4.91984,
-3.885758, 3.202842, -4.91984,
-3.885758, -4.046574, 5.694864,
-3.885758, 3.202842, 5.694864,
-3.885758, -4.046574, -4.91984,
-3.885758, -4.046574, 5.694864,
-3.885758, 3.202842, -4.91984,
-3.885758, 3.202842, 5.694864,
-3.885758, -4.046574, -4.91984,
3.575056, -4.046574, -4.91984,
-3.885758, -4.046574, 5.694864,
3.575056, -4.046574, 5.694864,
-3.885758, 3.202842, -4.91984,
3.575056, 3.202842, -4.91984,
-3.885758, 3.202842, 5.694864,
3.575056, 3.202842, 5.694864,
3.575056, -4.046574, -4.91984,
3.575056, 3.202842, -4.91984,
3.575056, -4.046574, 5.694864,
3.575056, 3.202842, 5.694864,
3.575056, -4.046574, -4.91984,
3.575056, -4.046574, 5.694864,
3.575056, 3.202842, -4.91984,
3.575056, 3.202842, 5.694864
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
var radius = 7.936211;
var distance = 35.3091;
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
mvMatrix.translate( 0.155351, 0.4218657, -0.3875122 );
mvMatrix.scale( 1.150114, 1.183652, 0.8083869 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.3091);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Chlorbenside<-read.table("Chlorbenside.xyz")
```

```
## Error in read.table("Chlorbenside.xyz"): no lines available in input
```

```r
x<-Chlorbenside$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbenside' not found
```

```r
y<-Chlorbenside$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbenside' not found
```

```r
z<-Chlorbenside$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbenside' not found
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
-3.777106, -1.464589, -2.925401, 0, 0, 1, 1, 1,
-3.255337, 1.002535, -1.44505, 1, 0, 0, 1, 1,
-2.843669, -0.0965144, -2.61366, 1, 0, 0, 1, 1,
-2.632919, 1.377248, -1.041951, 1, 0, 0, 1, 1,
-2.624241, 0.7992719, -1.115926, 1, 0, 0, 1, 1,
-2.470275, 1.68275, -1.226102, 1, 0, 0, 1, 1,
-2.435163, -0.3202615, 0.08922256, 0, 0, 0, 1, 1,
-2.352042, 2.237282, 0.2970932, 0, 0, 0, 1, 1,
-2.343609, 0.6329591, 1.320454, 0, 0, 0, 1, 1,
-2.266057, -1.515695, -1.721812, 0, 0, 0, 1, 1,
-2.222897, 0.4554725, -1.709129, 0, 0, 0, 1, 1,
-2.195526, -0.2669016, -0.9131289, 0, 0, 0, 1, 1,
-2.173106, 0.2742442, -1.123375, 0, 0, 0, 1, 1,
-2.15363, -0.6320765, -0.8393446, 1, 1, 1, 1, 1,
-2.134598, -1.045919, -3.276545, 1, 1, 1, 1, 1,
-2.127689, -0.2888657, -0.7654641, 1, 1, 1, 1, 1,
-2.103289, 0.2000684, -1.320301, 1, 1, 1, 1, 1,
-2.061376, -0.7832941, -2.012143, 1, 1, 1, 1, 1,
-2.028965, 0.7198769, -2.047993, 1, 1, 1, 1, 1,
-2.026753, 0.3293942, -1.571704, 1, 1, 1, 1, 1,
-2.02321, -0.8295954, -1.713511, 1, 1, 1, 1, 1,
-2.00653, 1.05954, 0.08423503, 1, 1, 1, 1, 1,
-1.9289, -0.3846518, -1.291399, 1, 1, 1, 1, 1,
-1.918782, 0.7199157, -2.398458, 1, 1, 1, 1, 1,
-1.897928, -1.482539, -2.634866, 1, 1, 1, 1, 1,
-1.89307, -0.9836521, -2.41575, 1, 1, 1, 1, 1,
-1.892492, -0.6043805, -2.001237, 1, 1, 1, 1, 1,
-1.874146, -1.15236, -1.367515, 1, 1, 1, 1, 1,
-1.866958, 0.4276449, -1.205399, 0, 0, 1, 1, 1,
-1.865983, -0.09129668, -0.7040038, 1, 0, 0, 1, 1,
-1.841557, -0.447114, -2.722161, 1, 0, 0, 1, 1,
-1.833036, 0.3021178, -2.569163, 1, 0, 0, 1, 1,
-1.830985, 0.05114803, -1.642269, 1, 0, 0, 1, 1,
-1.820899, 0.2577986, 0.2512265, 1, 0, 0, 1, 1,
-1.807173, 0.09353325, -2.530219, 0, 0, 0, 1, 1,
-1.806658, -0.4198506, -3.694969, 0, 0, 0, 1, 1,
-1.795091, 0.8032374, -1.937902, 0, 0, 0, 1, 1,
-1.77965, -0.2922068, -1.656267, 0, 0, 0, 1, 1,
-1.754766, -0.7825556, -1.743665, 0, 0, 0, 1, 1,
-1.749132, -0.7912045, -2.375433, 0, 0, 0, 1, 1,
-1.729632, -0.04768739, -3.475741, 0, 0, 0, 1, 1,
-1.697307, 0.1609288, -0.6033354, 1, 1, 1, 1, 1,
-1.695743, 0.2178671, -0.8890609, 1, 1, 1, 1, 1,
-1.671879, -1.296795, -1.084851, 1, 1, 1, 1, 1,
-1.671059, 0.4494115, -2.543371, 1, 1, 1, 1, 1,
-1.659454, -0.8763223, -0.201958, 1, 1, 1, 1, 1,
-1.628869, 1.501977, -1.646039, 1, 1, 1, 1, 1,
-1.628741, 0.8778252, -2.484782, 1, 1, 1, 1, 1,
-1.627811, 0.1845349, -0.5600784, 1, 1, 1, 1, 1,
-1.626714, -1.060991, -1.914231, 1, 1, 1, 1, 1,
-1.619819, -0.4930201, -3.066323, 1, 1, 1, 1, 1,
-1.605698, 2.188919, -0.6601174, 1, 1, 1, 1, 1,
-1.589721, -0.9911347, -1.978415, 1, 1, 1, 1, 1,
-1.58652, -1.065382, -1.391124, 1, 1, 1, 1, 1,
-1.571869, -0.4062687, -1.414273, 1, 1, 1, 1, 1,
-1.570555, 2.067836, -2.78824, 1, 1, 1, 1, 1,
-1.562452, -0.5402845, -0.9182526, 0, 0, 1, 1, 1,
-1.557506, 0.8438619, -1.710151, 1, 0, 0, 1, 1,
-1.556986, -0.1767615, -1.169708, 1, 0, 0, 1, 1,
-1.542743, -0.9829033, -0.9927171, 1, 0, 0, 1, 1,
-1.529329, -0.9804264, -2.662513, 1, 0, 0, 1, 1,
-1.52907, -0.9006184, -1.745829, 1, 0, 0, 1, 1,
-1.52065, -0.3315392, -1.860853, 0, 0, 0, 1, 1,
-1.514688, 0.3726698, -0.6212029, 0, 0, 0, 1, 1,
-1.507784, 1.407877, -3.215794, 0, 0, 0, 1, 1,
-1.507576, -2.269686, -0.06678931, 0, 0, 0, 1, 1,
-1.503246, 0.340038, -0.2955368, 0, 0, 0, 1, 1,
-1.498246, 0.5053332, -1.396855, 0, 0, 0, 1, 1,
-1.492966, -0.0142616, -2.233754, 0, 0, 0, 1, 1,
-1.47543, 1.156306, -2.37239, 1, 1, 1, 1, 1,
-1.465258, 1.229759, -0.6405445, 1, 1, 1, 1, 1,
-1.441426, 0.2372245, -1.418291, 1, 1, 1, 1, 1,
-1.432731, -0.523182, -0.6227807, 1, 1, 1, 1, 1,
-1.43014, 0.3727038, -2.421699, 1, 1, 1, 1, 1,
-1.426222, 0.1738635, -1.161179, 1, 1, 1, 1, 1,
-1.422135, 0.5283363, -1.214582, 1, 1, 1, 1, 1,
-1.421565, -0.5752069, -1.929038, 1, 1, 1, 1, 1,
-1.416356, 0.07793488, -1.367683, 1, 1, 1, 1, 1,
-1.38954, 0.2354103, -0.3289642, 1, 1, 1, 1, 1,
-1.389045, -0.2535122, -1.403505, 1, 1, 1, 1, 1,
-1.379447, 0.2671514, -1.241504, 1, 1, 1, 1, 1,
-1.378111, 0.507453, -1.181085, 1, 1, 1, 1, 1,
-1.373211, 1.124734, -1.59806, 1, 1, 1, 1, 1,
-1.372073, -0.5374781, -0.9097142, 1, 1, 1, 1, 1,
-1.363602, -0.7374122, -2.070728, 0, 0, 1, 1, 1,
-1.352666, 0.7370449, -0.6911219, 1, 0, 0, 1, 1,
-1.348095, -0.6197754, -1.363321, 1, 0, 0, 1, 1,
-1.341131, 1.190383, -0.5724313, 1, 0, 0, 1, 1,
-1.324916, 0.724794, -1.351152, 1, 0, 0, 1, 1,
-1.322017, -1.063374, -1.124175, 1, 0, 0, 1, 1,
-1.320862, -0.3397755, -1.583668, 0, 0, 0, 1, 1,
-1.309269, 0.05578944, -4.584321, 0, 0, 0, 1, 1,
-1.307125, -1.48386, -2.900486, 0, 0, 0, 1, 1,
-1.305611, 0.6412631, -0.2019295, 0, 0, 0, 1, 1,
-1.300851, -0.2186135, -1.934023, 0, 0, 0, 1, 1,
-1.297521, 2.753759, 0.1483513, 0, 0, 0, 1, 1,
-1.290044, 0.475189, -0.2205834, 0, 0, 0, 1, 1,
-1.285534, 0.2339978, -0.2055135, 1, 1, 1, 1, 1,
-1.282849, 0.3731627, -1.708951, 1, 1, 1, 1, 1,
-1.282247, 0.02291495, -2.033288, 1, 1, 1, 1, 1,
-1.281603, -0.9832314, -2.996662, 1, 1, 1, 1, 1,
-1.281445, -0.3853799, -0.6369883, 1, 1, 1, 1, 1,
-1.277384, 3.062113, -0.1869675, 1, 1, 1, 1, 1,
-1.269395, 0.295807, 1.223949, 1, 1, 1, 1, 1,
-1.269217, -0.4062614, -0.3049917, 1, 1, 1, 1, 1,
-1.264068, 0.9727396, 0.0267433, 1, 1, 1, 1, 1,
-1.261754, -1.465895, -2.846487, 1, 1, 1, 1, 1,
-1.25989, -1.058933, -3.119293, 1, 1, 1, 1, 1,
-1.255334, 0.8393288, -1.592964, 1, 1, 1, 1, 1,
-1.241858, -0.846065, -1.269956, 1, 1, 1, 1, 1,
-1.236543, -0.7437556, -1.214035, 1, 1, 1, 1, 1,
-1.230853, -0.1268274, -1.362523, 1, 1, 1, 1, 1,
-1.225417, 0.3420857, -0.2917151, 0, 0, 1, 1, 1,
-1.220967, 1.139558, -2.377763, 1, 0, 0, 1, 1,
-1.216173, 0.9507123, -1.745469, 1, 0, 0, 1, 1,
-1.213366, -1.034061, -0.8622898, 1, 0, 0, 1, 1,
-1.210985, 0.8812956, -0.6485761, 1, 0, 0, 1, 1,
-1.207453, 0.9875555, 0.03883925, 1, 0, 0, 1, 1,
-1.200532, -1.172449, -2.802474, 0, 0, 0, 1, 1,
-1.198886, -1.334604, -2.127971, 0, 0, 0, 1, 1,
-1.197494, 0.8778561, -1.085869, 0, 0, 0, 1, 1,
-1.195373, -0.7422601, -2.97076, 0, 0, 0, 1, 1,
-1.1921, 1.319018, -1.034703, 0, 0, 0, 1, 1,
-1.190655, 1.447798, 0.4106532, 0, 0, 0, 1, 1,
-1.187534, 0.1423438, -1.004705, 0, 0, 0, 1, 1,
-1.187532, 0.3385582, -0.9990577, 1, 1, 1, 1, 1,
-1.181218, 0.5164104, -2.398376, 1, 1, 1, 1, 1,
-1.180376, -2.455995, -1.312516, 1, 1, 1, 1, 1,
-1.173719, 0.1359066, 0.9177982, 1, 1, 1, 1, 1,
-1.158614, -1.17743, -2.114889, 1, 1, 1, 1, 1,
-1.146516, 1.227245, -1.618659, 1, 1, 1, 1, 1,
-1.144724, 1.073846, -0.9342069, 1, 1, 1, 1, 1,
-1.13833, -1.029418, -2.511971, 1, 1, 1, 1, 1,
-1.138034, 0.06651863, 0.3690198, 1, 1, 1, 1, 1,
-1.137743, 1.327924, 1.718397, 1, 1, 1, 1, 1,
-1.132623, 1.426277, -0.6638339, 1, 1, 1, 1, 1,
-1.128459, 0.468836, -1.333289, 1, 1, 1, 1, 1,
-1.124566, -0.0259915, -1.857117, 1, 1, 1, 1, 1,
-1.122977, 1.055921, -0.2702472, 1, 1, 1, 1, 1,
-1.120124, 0.3451759, -0.9656546, 1, 1, 1, 1, 1,
-1.112796, 0.2177612, -1.297195, 0, 0, 1, 1, 1,
-1.109146, -1.157828, -2.92712, 1, 0, 0, 1, 1,
-1.108775, -0.01245298, -2.289701, 1, 0, 0, 1, 1,
-1.10278, -0.7742906, -3.85074, 1, 0, 0, 1, 1,
-1.097491, -0.7499937, -2.154463, 1, 0, 0, 1, 1,
-1.096442, 0.3974203, -2.351315, 1, 0, 0, 1, 1,
-1.095513, 1.680437, -0.2562306, 0, 0, 0, 1, 1,
-1.091801, 2.10098, -0.7634281, 0, 0, 0, 1, 1,
-1.090494, -0.2481293, -1.645686, 0, 0, 0, 1, 1,
-1.087777, -0.371524, -1.261962, 0, 0, 0, 1, 1,
-1.082914, -0.7597585, -2.774878, 0, 0, 0, 1, 1,
-1.079687, 0.05394569, -3.090579, 0, 0, 0, 1, 1,
-1.076439, 1.412202, -0.2959993, 0, 0, 0, 1, 1,
-1.068096, 1.153276, -1.480377, 1, 1, 1, 1, 1,
-1.061547, 1.80359, -0.7447742, 1, 1, 1, 1, 1,
-1.059568, 0.8124378, -0.792494, 1, 1, 1, 1, 1,
-1.058587, -0.8242371, -2.563358, 1, 1, 1, 1, 1,
-1.054603, -0.1537721, -3.087094, 1, 1, 1, 1, 1,
-1.046156, -1.475452, -3.929067, 1, 1, 1, 1, 1,
-1.040258, 0.4547263, -1.853717, 1, 1, 1, 1, 1,
-1.033774, -0.5516717, -3.917154, 1, 1, 1, 1, 1,
-1.007948, -1.571195, -1.596341, 1, 1, 1, 1, 1,
-1.006255, -0.6585077, -3.324904, 1, 1, 1, 1, 1,
-1.003101, -0.8260854, -2.568693, 1, 1, 1, 1, 1,
-1.002055, -0.6529868, -3.183828, 1, 1, 1, 1, 1,
-1.001177, 0.2413323, -2.315029, 1, 1, 1, 1, 1,
-0.99819, -1.290586, -2.265855, 1, 1, 1, 1, 1,
-0.9969538, 0.7671317, -1.045311, 1, 1, 1, 1, 1,
-0.9952851, 0.8052159, -0.1639906, 0, 0, 1, 1, 1,
-0.9892615, -0.1324408, -1.190853, 1, 0, 0, 1, 1,
-0.9887769, -1.701118, -2.408571, 1, 0, 0, 1, 1,
-0.9858943, -0.3669373, -4.463091, 1, 0, 0, 1, 1,
-0.9784398, -0.5892237, -2.409698, 1, 0, 0, 1, 1,
-0.9665991, -0.8630427, -2.070984, 1, 0, 0, 1, 1,
-0.9665571, -1.522228, -3.154516, 0, 0, 0, 1, 1,
-0.9625605, -0.4121875, -2.780265, 0, 0, 0, 1, 1,
-0.9608169, 0.1472066, -1.769763, 0, 0, 0, 1, 1,
-0.9592481, -0.2356209, -2.204804, 0, 0, 0, 1, 1,
-0.9547774, 0.8307791, -1.168628, 0, 0, 0, 1, 1,
-0.9515726, -0.1735553, -1.656319, 0, 0, 0, 1, 1,
-0.950874, -0.5861889, -0.4530703, 0, 0, 0, 1, 1,
-0.942156, 1.508974, 0.8150038, 1, 1, 1, 1, 1,
-0.9392802, 1.07615, -1.419889, 1, 1, 1, 1, 1,
-0.9353732, -0.5592875, -1.448752, 1, 1, 1, 1, 1,
-0.9338716, 0.2727559, -1.666341, 1, 1, 1, 1, 1,
-0.9333217, 0.6613843, -1.072026, 1, 1, 1, 1, 1,
-0.9312667, 0.8634466, -2.061555, 1, 1, 1, 1, 1,
-0.9142434, 1.311928, -1.862945, 1, 1, 1, 1, 1,
-0.9081483, 0.0181983, -0.1951104, 1, 1, 1, 1, 1,
-0.9076092, -1.886822, -3.164592, 1, 1, 1, 1, 1,
-0.9010078, -0.7078461, -2.198616, 1, 1, 1, 1, 1,
-0.8999511, -0.1129604, -0.558879, 1, 1, 1, 1, 1,
-0.8980337, 0.6501678, -2.176299, 1, 1, 1, 1, 1,
-0.8934584, 1.843885, 1.016442, 1, 1, 1, 1, 1,
-0.8881271, -1.171018, -3.471788, 1, 1, 1, 1, 1,
-0.8872569, -0.6284054, -1.196907, 1, 1, 1, 1, 1,
-0.8863366, 1.337623, -2.312937, 0, 0, 1, 1, 1,
-0.8826259, -0.2607087, -1.582903, 1, 0, 0, 1, 1,
-0.8806781, -1.821605, -4.011347, 1, 0, 0, 1, 1,
-0.8791711, 1.180083, 1.845232, 1, 0, 0, 1, 1,
-0.8769408, -1.39402, -2.443553, 1, 0, 0, 1, 1,
-0.8694749, -0.1855772, -2.240132, 1, 0, 0, 1, 1,
-0.866717, -0.5639281, -2.084096, 0, 0, 0, 1, 1,
-0.8665647, -0.7404742, -2.371637, 0, 0, 0, 1, 1,
-0.8612764, -0.1362744, 0.02358498, 0, 0, 0, 1, 1,
-0.8590927, 0.2206374, -2.7232, 0, 0, 0, 1, 1,
-0.8561715, 1.418053, -0.3422312, 0, 0, 0, 1, 1,
-0.8476602, -1.978806, -3.23831, 0, 0, 0, 1, 1,
-0.847358, 0.5581861, -1.060025, 0, 0, 0, 1, 1,
-0.8395996, 0.1502358, -1.107068, 1, 1, 1, 1, 1,
-0.8387895, -0.5087347, -1.889216, 1, 1, 1, 1, 1,
-0.8366969, 1.000977, -1.786072, 1, 1, 1, 1, 1,
-0.829115, 1.063663, -0.5650436, 1, 1, 1, 1, 1,
-0.8238817, -0.7014327, -3.37882, 1, 1, 1, 1, 1,
-0.8217005, -1.268042, -3.395535, 1, 1, 1, 1, 1,
-0.8129885, 1.263119, -2.165332, 1, 1, 1, 1, 1,
-0.8086244, -0.5439212, -2.416092, 1, 1, 1, 1, 1,
-0.7940144, 1.307247, -0.1613006, 1, 1, 1, 1, 1,
-0.7929414, -0.09614899, -1.341245, 1, 1, 1, 1, 1,
-0.7908727, -1.279052, -0.7458605, 1, 1, 1, 1, 1,
-0.7886724, 0.3341768, -1.981585, 1, 1, 1, 1, 1,
-0.7823729, 0.5989882, -1.649708, 1, 1, 1, 1, 1,
-0.7786447, 0.2766626, -1.699312, 1, 1, 1, 1, 1,
-0.7782642, -2.041829, -1.334715, 1, 1, 1, 1, 1,
-0.7778191, -0.1257927, -3.004826, 0, 0, 1, 1, 1,
-0.7770488, -0.07914872, -2.202809, 1, 0, 0, 1, 1,
-0.7725741, 0.9350303, 0.8453099, 1, 0, 0, 1, 1,
-0.7687718, 1.115678, -1.590141, 1, 0, 0, 1, 1,
-0.7674668, -0.434228, -3.572112, 1, 0, 0, 1, 1,
-0.7632092, 0.9630302, -1.71386, 1, 0, 0, 1, 1,
-0.7585335, 0.3595227, -1.614866, 0, 0, 0, 1, 1,
-0.7516097, 0.6582627, -2.268523, 0, 0, 0, 1, 1,
-0.7500852, 0.5601639, -0.9741791, 0, 0, 0, 1, 1,
-0.7490936, 0.64591, -0.7256073, 0, 0, 0, 1, 1,
-0.7469521, 2.170953, 1.093678, 0, 0, 0, 1, 1,
-0.7445498, -1.258336, -2.23512, 0, 0, 0, 1, 1,
-0.7430721, -0.437403, -2.517167, 0, 0, 0, 1, 1,
-0.7408969, 0.8175106, -1.52024, 1, 1, 1, 1, 1,
-0.740373, 1.276667, -0.06880779, 1, 1, 1, 1, 1,
-0.7401282, 0.9761767, -0.7695122, 1, 1, 1, 1, 1,
-0.7358453, 0.2985876, 0.172376, 1, 1, 1, 1, 1,
-0.7350203, -1.015471, 0.1938338, 1, 1, 1, 1, 1,
-0.7346029, -0.7411119, -2.270004, 1, 1, 1, 1, 1,
-0.7302092, 1.268139, -0.3417819, 1, 1, 1, 1, 1,
-0.7225396, -0.106113, -2.553354, 1, 1, 1, 1, 1,
-0.7182729, -0.4726992, -2.606714, 1, 1, 1, 1, 1,
-0.7170129, 0.4183728, 0.9115265, 1, 1, 1, 1, 1,
-0.7109665, 1.133254, -0.488745, 1, 1, 1, 1, 1,
-0.7078053, 0.4192441, -1.420215, 1, 1, 1, 1, 1,
-0.7064952, 0.9083906, -0.3115528, 1, 1, 1, 1, 1,
-0.7064153, -1.001783, -2.919526, 1, 1, 1, 1, 1,
-0.7063063, -0.5802162, -1.623848, 1, 1, 1, 1, 1,
-0.7006869, -1.125019, -3.469827, 0, 0, 1, 1, 1,
-0.6963679, 0.139624, -1.574232, 1, 0, 0, 1, 1,
-0.6941034, 0.3368476, -0.2417358, 1, 0, 0, 1, 1,
-0.6850454, -1.580886, 0.09889761, 1, 0, 0, 1, 1,
-0.6752525, -0.9333154, -1.328687, 1, 0, 0, 1, 1,
-0.6724041, -1.257032, -0.5241329, 1, 0, 0, 1, 1,
-0.6704323, -0.1804534, -0.9772311, 0, 0, 0, 1, 1,
-0.6697937, 1.095495, -1.093802, 0, 0, 0, 1, 1,
-0.6685195, -0.7291445, -2.213928, 0, 0, 0, 1, 1,
-0.66664, 0.2038917, -2.020337, 0, 0, 0, 1, 1,
-0.6646804, 2.896285, -0.6970866, 0, 0, 0, 1, 1,
-0.6644381, -2.194419, -2.651355, 0, 0, 0, 1, 1,
-0.664212, -0.3768614, -2.864425, 0, 0, 0, 1, 1,
-0.6620767, -0.8898567, -2.867716, 1, 1, 1, 1, 1,
-0.6570797, -0.6043449, -1.453858, 1, 1, 1, 1, 1,
-0.656561, -0.1177962, -2.30121, 1, 1, 1, 1, 1,
-0.6549005, -0.8979353, -2.169542, 1, 1, 1, 1, 1,
-0.6512986, 0.2773597, -0.9681804, 1, 1, 1, 1, 1,
-0.6511595, -0.9476419, -1.679032, 1, 1, 1, 1, 1,
-0.6502315, -0.614126, -2.642871, 1, 1, 1, 1, 1,
-0.6456932, -0.010613, -1.76199, 1, 1, 1, 1, 1,
-0.6397256, -0.7968635, -1.942551, 1, 1, 1, 1, 1,
-0.6395213, -0.3790238, -2.593394, 1, 1, 1, 1, 1,
-0.6368694, -0.07863732, -2.119499, 1, 1, 1, 1, 1,
-0.6289732, -1.335346, -3.48439, 1, 1, 1, 1, 1,
-0.627355, -0.5230305, -1.474096, 1, 1, 1, 1, 1,
-0.6176718, -0.03368258, -1.143613, 1, 1, 1, 1, 1,
-0.6129211, -1.18317, -3.079185, 1, 1, 1, 1, 1,
-0.6114412, -0.1241368, -1.844203, 0, 0, 1, 1, 1,
-0.6088098, 0.6723742, -1.692078, 1, 0, 0, 1, 1,
-0.6058121, -0.2872341, -1.763847, 1, 0, 0, 1, 1,
-0.59878, 0.6945292, -0.5706403, 1, 0, 0, 1, 1,
-0.5921778, -0.3466206, -1.475744, 1, 0, 0, 1, 1,
-0.5804039, 1.614133, -0.9485154, 1, 0, 0, 1, 1,
-0.5784692, 0.01549547, -2.90057, 0, 0, 0, 1, 1,
-0.5700946, -0.4319086, -1.697299, 0, 0, 0, 1, 1,
-0.5658942, 0.7069703, -2.52876, 0, 0, 0, 1, 1,
-0.5614337, -0.5864424, -4.050072, 0, 0, 0, 1, 1,
-0.5611925, -0.718633, -1.418576, 0, 0, 0, 1, 1,
-0.5606187, 0.2325768, -0.8219874, 0, 0, 0, 1, 1,
-0.5602188, 0.3487737, -2.611528, 0, 0, 0, 1, 1,
-0.5593464, -0.5322675, -2.327369, 1, 1, 1, 1, 1,
-0.5574496, 1.106125, 0.9145672, 1, 1, 1, 1, 1,
-0.5562512, 1.242302, -1.250401, 1, 1, 1, 1, 1,
-0.5515833, -0.1362486, -1.098982, 1, 1, 1, 1, 1,
-0.549666, 0.638172, -0.5368314, 1, 1, 1, 1, 1,
-0.5462446, 1.366853, 0.01532555, 1, 1, 1, 1, 1,
-0.5451207, -1.510517, -1.447025, 1, 1, 1, 1, 1,
-0.5361755, 0.658829, -1.13897, 1, 1, 1, 1, 1,
-0.5358198, -1.150685, -3.357341, 1, 1, 1, 1, 1,
-0.53268, 1.327759, 0.6656822, 1, 1, 1, 1, 1,
-0.5293253, 0.7721761, -0.02672702, 1, 1, 1, 1, 1,
-0.5219903, 0.5134334, -2.68784, 1, 1, 1, 1, 1,
-0.5190589, -0.5264159, -3.094952, 1, 1, 1, 1, 1,
-0.5093251, 2.341406, 0.8620806, 1, 1, 1, 1, 1,
-0.5055179, 1.106386, -0.1412146, 1, 1, 1, 1, 1,
-0.502205, 0.9380953, -0.4536208, 0, 0, 1, 1, 1,
-0.4989423, 2.06796, 1.000708, 1, 0, 0, 1, 1,
-0.4921913, 0.07378933, -1.348723, 1, 0, 0, 1, 1,
-0.4908216, 0.6415979, -1.303874, 1, 0, 0, 1, 1,
-0.4872853, -0.7528548, -3.591143, 1, 0, 0, 1, 1,
-0.4863072, -0.2918257, -3.066449, 1, 0, 0, 1, 1,
-0.4838173, -1.179435, -2.231694, 0, 0, 0, 1, 1,
-0.4754412, -0.1280179, -2.895098, 0, 0, 0, 1, 1,
-0.474979, 0.7091267, 0.6436539, 0, 0, 0, 1, 1,
-0.4748829, -0.4181594, -0.453598, 0, 0, 0, 1, 1,
-0.4734823, -1.139693, -4.307786, 0, 0, 0, 1, 1,
-0.4726758, -1.022322, -2.457013, 0, 0, 0, 1, 1,
-0.466893, -0.44972, -1.632911, 0, 0, 0, 1, 1,
-0.4655019, 0.3698706, 0.6509537, 1, 1, 1, 1, 1,
-0.4643325, -3.257434, -4.32313, 1, 1, 1, 1, 1,
-0.4616155, 1.273662, -0.5484641, 1, 1, 1, 1, 1,
-0.4573255, -0.7345182, -3.612562, 1, 1, 1, 1, 1,
-0.4469403, 0.8158712, -0.5423242, 1, 1, 1, 1, 1,
-0.4365202, -0.5140489, -1.599007, 1, 1, 1, 1, 1,
-0.4320423, -0.5740668, -0.7536026, 1, 1, 1, 1, 1,
-0.431218, -0.4008272, -1.249779, 1, 1, 1, 1, 1,
-0.4311481, 1.749402, 0.3192315, 1, 1, 1, 1, 1,
-0.4299234, 0.4863968, -1.355744, 1, 1, 1, 1, 1,
-0.4285685, 0.003785387, -1.924082, 1, 1, 1, 1, 1,
-0.4278961, -0.651903, -1.05879, 1, 1, 1, 1, 1,
-0.4268824, 0.8915913, -0.1540472, 1, 1, 1, 1, 1,
-0.4203986, 0.7928162, -1.347903, 1, 1, 1, 1, 1,
-0.4203972, 1.300263, 0.2723976, 1, 1, 1, 1, 1,
-0.4171492, -1.507478, -3.986485, 0, 0, 1, 1, 1,
-0.4137617, -0.4112059, -3.624797, 1, 0, 0, 1, 1,
-0.4089317, -0.717737, -4.424373, 1, 0, 0, 1, 1,
-0.4082238, -0.1622408, -2.536249, 1, 0, 0, 1, 1,
-0.4013289, 2.22316, -0.2084102, 1, 0, 0, 1, 1,
-0.3969203, 0.005149203, -1.567496, 1, 0, 0, 1, 1,
-0.3964987, 0.653956, 1.038959, 0, 0, 0, 1, 1,
-0.3937787, -0.4524472, -3.928533, 0, 0, 0, 1, 1,
-0.392972, 1.11485, -0.4088083, 0, 0, 0, 1, 1,
-0.3883755, 0.08630095, -1.279014, 0, 0, 0, 1, 1,
-0.3872752, 0.008385072, 0.4885812, 0, 0, 0, 1, 1,
-0.3837314, 0.643226, -0.6383511, 0, 0, 0, 1, 1,
-0.3802991, -1.494528, -3.352766, 0, 0, 0, 1, 1,
-0.3802294, 1.147676, -1.905664, 1, 1, 1, 1, 1,
-0.3748569, 0.1402934, -1.42923, 1, 1, 1, 1, 1,
-0.3742208, -0.03340517, -2.801365, 1, 1, 1, 1, 1,
-0.374197, 1.049793, 0.0315115, 1, 1, 1, 1, 1,
-0.3699877, -0.1062327, -1.834025, 1, 1, 1, 1, 1,
-0.369036, -0.9947003, -1.797454, 1, 1, 1, 1, 1,
-0.3686956, -1.289321, -2.885011, 1, 1, 1, 1, 1,
-0.3673291, -1.829258, -3.857243, 1, 1, 1, 1, 1,
-0.3657101, -1.322707, -4.600349, 1, 1, 1, 1, 1,
-0.3656361, -1.615283, -1.23799, 1, 1, 1, 1, 1,
-0.3617637, -0.425299, -3.549069, 1, 1, 1, 1, 1,
-0.3599232, -0.6572354, -1.778392, 1, 1, 1, 1, 1,
-0.3574724, -1.386374, -4.214943, 1, 1, 1, 1, 1,
-0.3554109, 0.08675635, -0.3318558, 1, 1, 1, 1, 1,
-0.3545521, 0.8321541, 1.035841, 1, 1, 1, 1, 1,
-0.3528672, 0.8280469, -0.9931065, 0, 0, 1, 1, 1,
-0.3526747, -0.5840638, -4.247018, 1, 0, 0, 1, 1,
-0.3468534, 2.170495, -0.5160786, 1, 0, 0, 1, 1,
-0.3426714, 0.4986072, -3.825141, 1, 0, 0, 1, 1,
-0.3415708, 1.80215, -0.5817288, 1, 0, 0, 1, 1,
-0.3350784, 2.367195, -0.8004698, 1, 0, 0, 1, 1,
-0.3316129, -0.4332284, -2.743812, 0, 0, 0, 1, 1,
-0.3306572, 0.638181, -0.5470076, 0, 0, 0, 1, 1,
-0.3280589, -0.7656614, -3.409036, 0, 0, 0, 1, 1,
-0.3204485, 1.422321, 0.1806401, 0, 0, 0, 1, 1,
-0.3179064, -0.222673, -2.880589, 0, 0, 0, 1, 1,
-0.3094476, 0.8970605, 0.4544533, 0, 0, 0, 1, 1,
-0.306899, -1.537102, -1.315945, 0, 0, 0, 1, 1,
-0.3041662, -0.3558579, -2.204814, 1, 1, 1, 1, 1,
-0.3037544, -0.6973612, -3.865534, 1, 1, 1, 1, 1,
-0.297503, -0.4035369, -1.698596, 1, 1, 1, 1, 1,
-0.2962408, 1.280738, -0.6951606, 1, 1, 1, 1, 1,
-0.2902505, 0.656226, -2.173175, 1, 1, 1, 1, 1,
-0.289905, -0.5408605, -2.852354, 1, 1, 1, 1, 1,
-0.2811209, -0.0003990951, -1.098427, 1, 1, 1, 1, 1,
-0.276024, -3.941, -2.964612, 1, 1, 1, 1, 1,
-0.2741979, -0.02277514, 0.7751595, 1, 1, 1, 1, 1,
-0.2736531, 1.368031, 0.9370615, 1, 1, 1, 1, 1,
-0.2731585, 0.7288928, -0.5058972, 1, 1, 1, 1, 1,
-0.2720179, -1.571805, -3.573971, 1, 1, 1, 1, 1,
-0.2717266, -0.6070693, -2.478556, 1, 1, 1, 1, 1,
-0.271641, 0.9681984, -0.5879881, 1, 1, 1, 1, 1,
-0.268151, -0.4795204, -0.7470928, 1, 1, 1, 1, 1,
-0.2675868, -1.311926, -2.295792, 0, 0, 1, 1, 1,
-0.265515, -1.207646, -3.607929, 1, 0, 0, 1, 1,
-0.2643297, 1.559349, 0.3078329, 1, 0, 0, 1, 1,
-0.2615381, 1.095642, 0.03986175, 1, 0, 0, 1, 1,
-0.2610606, 0.6468179, -1.336506, 1, 0, 0, 1, 1,
-0.2573188, 0.400754, -1.302558, 1, 0, 0, 1, 1,
-0.2561616, 0.3001437, -1.06038, 0, 0, 0, 1, 1,
-0.256135, 0.4344611, -1.219017, 0, 0, 0, 1, 1,
-0.2540029, 0.02593745, -0.7700872, 0, 0, 0, 1, 1,
-0.253508, 0.9078813, -0.1528366, 0, 0, 0, 1, 1,
-0.252794, -2.54283, -3.729973, 0, 0, 0, 1, 1,
-0.2500964, -0.8988654, -2.577371, 0, 0, 0, 1, 1,
-0.246312, -0.7314029, -2.452582, 0, 0, 0, 1, 1,
-0.2452678, 0.8470618, -1.343576, 1, 1, 1, 1, 1,
-0.2425818, -1.174316, -3.40102, 1, 1, 1, 1, 1,
-0.241474, -0.3290773, -3.017643, 1, 1, 1, 1, 1,
-0.2409599, -0.009668703, -1.050822, 1, 1, 1, 1, 1,
-0.2379005, -1.125005, -1.633865, 1, 1, 1, 1, 1,
-0.2332276, 2.129388, 0.2239844, 1, 1, 1, 1, 1,
-0.2243754, -0.02725155, -1.956181, 1, 1, 1, 1, 1,
-0.2206235, 0.1348458, -0.868323, 1, 1, 1, 1, 1,
-0.2176262, -0.7431875, -1.377958, 1, 1, 1, 1, 1,
-0.2132168, 0.4832319, -2.28348, 1, 1, 1, 1, 1,
-0.2104219, 0.681548, -2.044239, 1, 1, 1, 1, 1,
-0.2027632, -0.6295736, -3.59722, 1, 1, 1, 1, 1,
-0.2022566, -0.172591, -1.83288, 1, 1, 1, 1, 1,
-0.1955552, 1.133667, -1.85359, 1, 1, 1, 1, 1,
-0.1898139, 0.4459329, 1.901436, 1, 1, 1, 1, 1,
-0.1879293, 0.2776777, -1.077073, 0, 0, 1, 1, 1,
-0.1833573, 1.146912, 1.445102, 1, 0, 0, 1, 1,
-0.1790475, 0.00480467, -1.37152, 1, 0, 0, 1, 1,
-0.1789036, -1.048798, -3.556843, 1, 0, 0, 1, 1,
-0.1787134, 0.8244621, -0.001816092, 1, 0, 0, 1, 1,
-0.1783687, 0.9385338, -0.7297655, 1, 0, 0, 1, 1,
-0.1773985, 1.468058, -0.6526569, 0, 0, 0, 1, 1,
-0.1747064, 0.1271186, -2.478086, 0, 0, 0, 1, 1,
-0.1746439, 0.1885789, 0.1715998, 0, 0, 0, 1, 1,
-0.173996, 0.1081802, -1.956595, 0, 0, 0, 1, 1,
-0.1703785, -1.260152, -3.502393, 0, 0, 0, 1, 1,
-0.1701814, 0.289702, -1.595264, 0, 0, 0, 1, 1,
-0.1600712, 1.357465, 1.121405, 0, 0, 0, 1, 1,
-0.1581459, 1.716472, -1.175536, 1, 1, 1, 1, 1,
-0.154029, 1.983927, 0.5671319, 1, 1, 1, 1, 1,
-0.1537272, -0.9592275, -3.858088, 1, 1, 1, 1, 1,
-0.1481705, -0.6715171, -2.68049, 1, 1, 1, 1, 1,
-0.1399547, -0.115239, -2.352732, 1, 1, 1, 1, 1,
-0.1384581, 0.9006394, -0.3094066, 1, 1, 1, 1, 1,
-0.1377184, -0.3135216, -0.9427034, 1, 1, 1, 1, 1,
-0.1355594, 0.3501777, -0.05233272, 1, 1, 1, 1, 1,
-0.1344286, 0.545343, 0.3607976, 1, 1, 1, 1, 1,
-0.1341285, -1.684681, -3.551101, 1, 1, 1, 1, 1,
-0.1325085, 0.1309022, -3.488447, 1, 1, 1, 1, 1,
-0.126842, 0.2672644, 0.08989768, 1, 1, 1, 1, 1,
-0.1250433, -0.8378926, -3.385669, 1, 1, 1, 1, 1,
-0.1243023, -0.313967, -3.632243, 1, 1, 1, 1, 1,
-0.1231395, 0.0203538, -2.145938, 1, 1, 1, 1, 1,
-0.1218925, -0.815686, -3.74738, 0, 0, 1, 1, 1,
-0.1198411, 1.859546, 0.8590843, 1, 0, 0, 1, 1,
-0.1143445, -0.5444366, -3.680222, 1, 0, 0, 1, 1,
-0.1093006, 1.336919, 1.045657, 1, 0, 0, 1, 1,
-0.1078488, 0.1125434, -0.7314395, 1, 0, 0, 1, 1,
-0.1025749, 0.4190298, -0.04958639, 1, 0, 0, 1, 1,
-0.09898956, -1.159201, -2.254985, 0, 0, 0, 1, 1,
-0.09855074, -1.810965, -3.66844, 0, 0, 0, 1, 1,
-0.09833236, 0.2424181, -1.614332, 0, 0, 0, 1, 1,
-0.08958904, -0.5608066, -3.1673, 0, 0, 0, 1, 1,
-0.08930187, -0.203734, -2.768352, 0, 0, 0, 1, 1,
-0.08610804, 0.2780941, 0.5355163, 0, 0, 0, 1, 1,
-0.08455097, 0.3635611, 1.241671, 0, 0, 0, 1, 1,
-0.0841254, 0.2024609, -1.160309, 1, 1, 1, 1, 1,
-0.08029199, 1.126305, 1.94014, 1, 1, 1, 1, 1,
-0.0801992, -0.06846863, -4.765257, 1, 1, 1, 1, 1,
-0.07878861, -1.374532, -3.161587, 1, 1, 1, 1, 1,
-0.07420813, -0.6379619, -2.576165, 1, 1, 1, 1, 1,
-0.06929086, 0.645266, -0.4187703, 1, 1, 1, 1, 1,
-0.06643265, 0.2301998, 0.02694898, 1, 1, 1, 1, 1,
-0.06475767, 1.0969, 0.06790519, 1, 1, 1, 1, 1,
-0.0614829, 1.677382, -2.211949, 1, 1, 1, 1, 1,
-0.06132792, -1.719389, -3.303068, 1, 1, 1, 1, 1,
-0.06068614, 0.7184081, -0.6352649, 1, 1, 1, 1, 1,
-0.05318467, -0.5431484, -2.177881, 1, 1, 1, 1, 1,
-0.04425471, -0.5256841, -1.713813, 1, 1, 1, 1, 1,
-0.04096568, -1.275257, -3.878593, 1, 1, 1, 1, 1,
-0.04076753, -1.753915, -3.303989, 1, 1, 1, 1, 1,
-0.03787617, 0.1766925, 0.7455348, 0, 0, 1, 1, 1,
-0.03353623, 0.09338126, -0.8697246, 1, 0, 0, 1, 1,
-0.03176522, 0.02390065, -0.06361315, 1, 0, 0, 1, 1,
-0.03088851, 0.6293025, 2.069507, 1, 0, 0, 1, 1,
-0.02736094, -1.154071, -2.894817, 1, 0, 0, 1, 1,
-0.02421583, 1.300545, -0.03798445, 1, 0, 0, 1, 1,
-0.02278521, 0.0934279, 0.04305023, 0, 0, 0, 1, 1,
-0.02149229, 0.6912429, 0.4919274, 0, 0, 0, 1, 1,
-0.01865846, 0.1600897, 1.573514, 0, 0, 0, 1, 1,
-0.0186398, -0.5045831, -4.63622, 0, 0, 0, 1, 1,
-0.00332686, -1.295909, -3.742463, 0, 0, 0, 1, 1,
-0.002496623, 1.097472, -0.8445994, 0, 0, 0, 1, 1,
0.003287776, 1.676185, 1.405638, 0, 0, 0, 1, 1,
0.00372914, -0.4428829, 2.840633, 1, 1, 1, 1, 1,
0.008416062, 0.07232316, 0.01825648, 1, 1, 1, 1, 1,
0.02035077, 1.434454, -0.9187292, 1, 1, 1, 1, 1,
0.02184863, -1.411872, 2.018122, 1, 1, 1, 1, 1,
0.02236162, -0.6124501, 3.199103, 1, 1, 1, 1, 1,
0.02297528, -0.6995289, 2.815237, 1, 1, 1, 1, 1,
0.02464152, -0.248235, 3.818669, 1, 1, 1, 1, 1,
0.02532024, -0.9944443, 4.237991, 1, 1, 1, 1, 1,
0.02624363, 2.365765, 0.630384, 1, 1, 1, 1, 1,
0.0289029, -0.9027734, 5.270852, 1, 1, 1, 1, 1,
0.02989813, 1.663647, 1.378299, 1, 1, 1, 1, 1,
0.03090118, 1.432841, -1.562696, 1, 1, 1, 1, 1,
0.03155229, -0.8112614, 3.669007, 1, 1, 1, 1, 1,
0.03277088, -0.2123472, 2.445642, 1, 1, 1, 1, 1,
0.03346445, 1.558243, -1.471342, 1, 1, 1, 1, 1,
0.04045661, 0.5125548, 0.7058566, 0, 0, 1, 1, 1,
0.04125587, 0.6233163, 0.1552653, 1, 0, 0, 1, 1,
0.04369239, 0.6877766, 1.559386, 1, 0, 0, 1, 1,
0.04375174, -0.2787167, 2.749306, 1, 0, 0, 1, 1,
0.04625238, 1.549856, -0.8924459, 1, 0, 0, 1, 1,
0.04860999, 0.4004495, 0.16578, 1, 0, 0, 1, 1,
0.05098571, -0.6680234, 2.087244, 0, 0, 0, 1, 1,
0.05437834, 0.5620839, 1.482773, 0, 0, 0, 1, 1,
0.05443995, 1.051963, -1.496365, 0, 0, 0, 1, 1,
0.06053839, -1.648313, 2.955874, 0, 0, 0, 1, 1,
0.06273209, -0.3761629, 2.167491, 0, 0, 0, 1, 1,
0.06931466, -0.3953313, 3.886776, 0, 0, 0, 1, 1,
0.07041483, -1.106662, 2.768301, 0, 0, 0, 1, 1,
0.07253293, -0.8570106, 3.065999, 1, 1, 1, 1, 1,
0.07419103, -1.201103, 2.642739, 1, 1, 1, 1, 1,
0.07459039, -0.7756063, 3.604999, 1, 1, 1, 1, 1,
0.07636935, 1.473511, 0.1281643, 1, 1, 1, 1, 1,
0.0766159, -0.2528189, 4.082806, 1, 1, 1, 1, 1,
0.07698503, 0.07198117, 2.30825, 1, 1, 1, 1, 1,
0.08233233, 0.8489625, 0.5476168, 1, 1, 1, 1, 1,
0.08645722, 0.3508706, -0.2063679, 1, 1, 1, 1, 1,
0.088763, 0.3084465, -1.511979, 1, 1, 1, 1, 1,
0.09055905, -1.795638, 2.590175, 1, 1, 1, 1, 1,
0.09575372, -0.7596757, 4.367723, 1, 1, 1, 1, 1,
0.09625223, 0.4240439, 0.1728939, 1, 1, 1, 1, 1,
0.09658519, -0.4654849, 3.36129, 1, 1, 1, 1, 1,
0.09978367, 1.025772, 1.090125, 1, 1, 1, 1, 1,
0.1047348, 0.4171419, -0.2712449, 1, 1, 1, 1, 1,
0.1061487, -2.418039, 3.209541, 0, 0, 1, 1, 1,
0.1071209, 0.721105, -0.4581871, 1, 0, 0, 1, 1,
0.1085776, 0.543012, 0.4495761, 1, 0, 0, 1, 1,
0.1111719, 0.9752211, -0.2513948, 1, 0, 0, 1, 1,
0.1115496, 0.8915733, 1.492984, 1, 0, 0, 1, 1,
0.1125818, 1.2107, 0.812592, 1, 0, 0, 1, 1,
0.1148954, 0.3998057, 0.4646916, 0, 0, 0, 1, 1,
0.1179498, -1.179553, 2.533521, 0, 0, 0, 1, 1,
0.1187654, 0.6029029, -0.9037864, 0, 0, 0, 1, 1,
0.1386443, -1.019951, 1.657642, 0, 0, 0, 1, 1,
0.1392405, 3.097268, 0.6928244, 0, 0, 0, 1, 1,
0.1445497, 1.223255, 1.046313, 0, 0, 0, 1, 1,
0.1454057, -0.2745234, 1.76123, 0, 0, 0, 1, 1,
0.1460029, 0.8306796, -1.081888, 1, 1, 1, 1, 1,
0.1479948, -0.8801261, 2.683792, 1, 1, 1, 1, 1,
0.153371, 1.628623, 2.318514, 1, 1, 1, 1, 1,
0.1549983, 0.944511, -0.9289461, 1, 1, 1, 1, 1,
0.1551836, 0.1297071, 1.352389, 1, 1, 1, 1, 1,
0.1577851, 0.4017985, 0.05320897, 1, 1, 1, 1, 1,
0.1591392, 1.054835, 0.3410722, 1, 1, 1, 1, 1,
0.1592521, 1.114195, -0.6358825, 1, 1, 1, 1, 1,
0.1630038, 0.4273537, 1.396507, 1, 1, 1, 1, 1,
0.1639395, 1.320271, -0.8191543, 1, 1, 1, 1, 1,
0.1658437, -0.981319, 3.218089, 1, 1, 1, 1, 1,
0.1673765, 0.746367, 1.51386, 1, 1, 1, 1, 1,
0.1681089, 1.503696, -0.2985287, 1, 1, 1, 1, 1,
0.1687222, 0.741478, 0.01021859, 1, 1, 1, 1, 1,
0.1697113, 1.298195, -0.2535374, 1, 1, 1, 1, 1,
0.1748766, 0.4562694, 0.6215727, 0, 0, 1, 1, 1,
0.1784964, -0.1215487, 2.026021, 1, 0, 0, 1, 1,
0.1791672, -0.7477373, 3.055031, 1, 0, 0, 1, 1,
0.1876558, 0.9394547, -0.4702523, 1, 0, 0, 1, 1,
0.1927985, -0.6314176, 2.553033, 1, 0, 0, 1, 1,
0.1977596, 0.2566749, 0.4876444, 1, 0, 0, 1, 1,
0.199538, 1.092794, -0.6777486, 0, 0, 0, 1, 1,
0.2016403, -1.449138, 3.384221, 0, 0, 0, 1, 1,
0.2024432, 1.258473, 0.5558323, 0, 0, 0, 1, 1,
0.2063843, -0.8461386, 2.586866, 0, 0, 0, 1, 1,
0.2178255, 0.9513844, 0.1475978, 0, 0, 0, 1, 1,
0.2238947, -0.8526849, 1.720751, 0, 0, 0, 1, 1,
0.2309594, 0.246035, 1.424253, 0, 0, 0, 1, 1,
0.2350224, -2.324725, 3.384113, 1, 1, 1, 1, 1,
0.238721, -3.015757, 2.514853, 1, 1, 1, 1, 1,
0.2390166, 0.01852921, 1.751934, 1, 1, 1, 1, 1,
0.2390321, -0.4311678, 3.379101, 1, 1, 1, 1, 1,
0.2422026, -0.1621563, 2.696961, 1, 1, 1, 1, 1,
0.2438834, -0.1983538, 0.5392725, 1, 1, 1, 1, 1,
0.2455087, -0.2996435, 2.943889, 1, 1, 1, 1, 1,
0.2472596, -0.4346015, 1.873038, 1, 1, 1, 1, 1,
0.2477302, 1.807253, 1.246906, 1, 1, 1, 1, 1,
0.2479565, 1.553514, 0.4439981, 1, 1, 1, 1, 1,
0.2492735, -0.04166381, 3.986527, 1, 1, 1, 1, 1,
0.2514381, 0.03915442, 0.852971, 1, 1, 1, 1, 1,
0.2523712, 0.03098361, 0.591442, 1, 1, 1, 1, 1,
0.2524499, -0.1678743, 1.214841, 1, 1, 1, 1, 1,
0.2547702, 0.2322436, 2.845909, 1, 1, 1, 1, 1,
0.2572483, -0.1690864, 1.944499, 0, 0, 1, 1, 1,
0.2573589, -0.2661159, 2.642756, 1, 0, 0, 1, 1,
0.2578678, 0.3970382, 0.4052638, 1, 0, 0, 1, 1,
0.2584479, 1.519655, 1.263054, 1, 0, 0, 1, 1,
0.2593527, -0.3069669, 2.591051, 1, 0, 0, 1, 1,
0.2637953, -0.1876853, 1.842191, 1, 0, 0, 1, 1,
0.2642277, 0.8624734, 0.9186583, 0, 0, 0, 1, 1,
0.2696794, 0.9269358, -0.2318497, 0, 0, 0, 1, 1,
0.2708171, -0.7653407, 2.787689, 0, 0, 0, 1, 1,
0.271865, -1.069455, 5.055669, 0, 0, 0, 1, 1,
0.2737547, 0.6967563, -0.5297528, 0, 0, 0, 1, 1,
0.2754305, 0.5143256, 0.475566, 0, 0, 0, 1, 1,
0.2787573, -1.059304, 3.483539, 0, 0, 0, 1, 1,
0.2829158, -1.253413, 4.21207, 1, 1, 1, 1, 1,
0.2831478, 0.1942526, 2.21559, 1, 1, 1, 1, 1,
0.2850547, -0.7785144, 2.623996, 1, 1, 1, 1, 1,
0.2868291, 0.9740517, -0.7985129, 1, 1, 1, 1, 1,
0.2891863, -0.9611444, 1.842857, 1, 1, 1, 1, 1,
0.290723, -0.2212342, 2.819775, 1, 1, 1, 1, 1,
0.2973959, -0.2692352, 1.508635, 1, 1, 1, 1, 1,
0.2988589, -0.08434481, 1.545567, 1, 1, 1, 1, 1,
0.3001629, 1.275091, 0.4703287, 1, 1, 1, 1, 1,
0.301115, -1.083458, 1.632593, 1, 1, 1, 1, 1,
0.3017856, 0.9993052, -0.2332803, 1, 1, 1, 1, 1,
0.3020371, -0.04821874, -0.1338696, 1, 1, 1, 1, 1,
0.3050274, -1.786599, 0.8379006, 1, 1, 1, 1, 1,
0.3053758, -0.8922424, 3.055587, 1, 1, 1, 1, 1,
0.3076588, -0.8194805, 2.426126, 1, 1, 1, 1, 1,
0.3093364, -0.4437263, 1.466723, 0, 0, 1, 1, 1,
0.3096507, 0.253877, 1.793563, 1, 0, 0, 1, 1,
0.3119215, -0.329646, 2.513613, 1, 0, 0, 1, 1,
0.3166526, -0.2184938, 3.869207, 1, 0, 0, 1, 1,
0.3183421, 1.156606, 0.7070147, 1, 0, 0, 1, 1,
0.320222, 1.255031, -0.3780458, 1, 0, 0, 1, 1,
0.3208328, 0.322459, 1.776501, 0, 0, 0, 1, 1,
0.3215672, 0.1115903, 3.421048, 0, 0, 0, 1, 1,
0.3231052, -0.8310437, 3.464042, 0, 0, 0, 1, 1,
0.3236454, 2.225163, -0.7807306, 0, 0, 0, 1, 1,
0.323724, -0.1123767, 1.39129, 0, 0, 0, 1, 1,
0.3251041, 1.576524, 0.810594, 0, 0, 0, 1, 1,
0.3253866, 0.7017459, -0.05280388, 0, 0, 0, 1, 1,
0.3266563, 0.8013567, 1.816114, 1, 1, 1, 1, 1,
0.3282337, -1.339201, 2.155825, 1, 1, 1, 1, 1,
0.3367642, 1.570076, 0.16118, 1, 1, 1, 1, 1,
0.3371561, 0.06427534, 1.905492, 1, 1, 1, 1, 1,
0.3374512, 0.006700102, 3.995802, 1, 1, 1, 1, 1,
0.3395195, -1.405831, 2.418064, 1, 1, 1, 1, 1,
0.3400174, 1.291296, -0.9229194, 1, 1, 1, 1, 1,
0.3405246, 0.4956498, 0.9079819, 1, 1, 1, 1, 1,
0.3561839, -0.150468, 0.9023883, 1, 1, 1, 1, 1,
0.3582754, 1.503829, -1.272125, 1, 1, 1, 1, 1,
0.3590811, -0.854205, 2.391406, 1, 1, 1, 1, 1,
0.3592336, 0.191251, 2.434617, 1, 1, 1, 1, 1,
0.3696193, -1.512911, 2.667481, 1, 1, 1, 1, 1,
0.3738162, 2.113146, 0.3456979, 1, 1, 1, 1, 1,
0.3740236, 1.312578, 1.487253, 1, 1, 1, 1, 1,
0.3759389, 0.04198057, 3.199766, 0, 0, 1, 1, 1,
0.3785628, 0.7092569, 0.6207882, 1, 0, 0, 1, 1,
0.3797401, 0.6889218, 0.1451589, 1, 0, 0, 1, 1,
0.3800025, -2.20035, 3.314686, 1, 0, 0, 1, 1,
0.3837936, 1.382449, -1.278197, 1, 0, 0, 1, 1,
0.3847036, 1.317841, 0.8611488, 1, 0, 0, 1, 1,
0.3853301, 0.2685744, -0.1652739, 0, 0, 0, 1, 1,
0.3853692, -1.403646, 5.540281, 0, 0, 0, 1, 1,
0.3862744, 2.116377, -2.768284, 0, 0, 0, 1, 1,
0.3879074, 0.5607657, 1.991762, 0, 0, 0, 1, 1,
0.3947974, -0.2519749, 0.8961366, 0, 0, 0, 1, 1,
0.3949417, 0.1897233, 2.850842, 0, 0, 0, 1, 1,
0.397782, -0.8658913, 3.046775, 0, 0, 0, 1, 1,
0.3986202, -0.3266415, 2.462464, 1, 1, 1, 1, 1,
0.4000995, -1.223866, 1.914591, 1, 1, 1, 1, 1,
0.4023466, -1.156469, 3.055707, 1, 1, 1, 1, 1,
0.4052858, 2.32759, -0.05406697, 1, 1, 1, 1, 1,
0.4142338, 1.291261, 0.9188841, 1, 1, 1, 1, 1,
0.4150038, -1.46711, 2.067485, 1, 1, 1, 1, 1,
0.415835, -1.583774, 2.558961, 1, 1, 1, 1, 1,
0.416201, 0.2535808, 1.485911, 1, 1, 1, 1, 1,
0.4173208, -0.5813507, 2.246125, 1, 1, 1, 1, 1,
0.417544, 0.4039938, 1.373157, 1, 1, 1, 1, 1,
0.4195394, 0.5145397, 1.658055, 1, 1, 1, 1, 1,
0.4240278, -0.06086989, 0.7214481, 1, 1, 1, 1, 1,
0.4265892, 0.1714195, 1.822538, 1, 1, 1, 1, 1,
0.4272164, -1.630064, 2.218986, 1, 1, 1, 1, 1,
0.4291725, 0.582023, 1.035677, 1, 1, 1, 1, 1,
0.4307988, 0.04223425, 2.716232, 0, 0, 1, 1, 1,
0.4309734, -1.127065, 4.034384, 1, 0, 0, 1, 1,
0.4327138, -0.6725891, 2.666951, 1, 0, 0, 1, 1,
0.4337126, -0.4929802, 3.412392, 1, 0, 0, 1, 1,
0.4337772, -0.1016627, 1.953602, 1, 0, 0, 1, 1,
0.4487661, 1.058709, -0.8030258, 1, 0, 0, 1, 1,
0.449308, 0.663047, -0.06111424, 0, 0, 0, 1, 1,
0.4506015, 0.9683663, -0.5183659, 0, 0, 0, 1, 1,
0.4516189, 1.752641, -2.170257, 0, 0, 0, 1, 1,
0.4527944, -0.9299111, 4.414308, 0, 0, 0, 1, 1,
0.4538427, 0.2207682, 1.139681, 0, 0, 0, 1, 1,
0.4593241, 0.8630327, 0.912681, 0, 0, 0, 1, 1,
0.464846, -0.7285774, 1.4986, 0, 0, 0, 1, 1,
0.4664031, -1.059748, 2.237648, 1, 1, 1, 1, 1,
0.4664906, -0.1226754, 2.122414, 1, 1, 1, 1, 1,
0.4691822, 1.897567, 1.151201, 1, 1, 1, 1, 1,
0.4691973, 1.427396, 0.8841929, 1, 1, 1, 1, 1,
0.4709472, 1.297498, 0.4098614, 1, 1, 1, 1, 1,
0.4709892, 0.5801866, 0.9076862, 1, 1, 1, 1, 1,
0.4712228, 0.6440887, 0.5835961, 1, 1, 1, 1, 1,
0.4714323, -0.3613686, 2.047801, 1, 1, 1, 1, 1,
0.4717915, 0.4439266, 1.375486, 1, 1, 1, 1, 1,
0.4735045, -0.6006353, 2.194886, 1, 1, 1, 1, 1,
0.4746721, 0.7444174, -1.144472, 1, 1, 1, 1, 1,
0.4774776, 0.8107803, -0.9681234, 1, 1, 1, 1, 1,
0.4799639, 0.639116, 0.0002372338, 1, 1, 1, 1, 1,
0.4812694, -0.2716965, 1.689999, 1, 1, 1, 1, 1,
0.4856765, 0.9235781, 1.254929, 1, 1, 1, 1, 1,
0.4886054, -0.3494202, 3.343039, 0, 0, 1, 1, 1,
0.5020314, -1.59658, 2.269703, 1, 0, 0, 1, 1,
0.5021975, -0.3909629, 3.287328, 1, 0, 0, 1, 1,
0.5039372, 0.6787196, 1.744796, 1, 0, 0, 1, 1,
0.505729, 0.304346, 1.384751, 1, 0, 0, 1, 1,
0.5095955, -1.477935, 2.821136, 1, 0, 0, 1, 1,
0.5145646, -1.089134, 1.0356, 0, 0, 0, 1, 1,
0.5221231, -0.7939516, 1.414313, 0, 0, 0, 1, 1,
0.5231647, -0.9310678, 1.958948, 0, 0, 0, 1, 1,
0.5360559, -0.647481, 4.449195, 0, 0, 0, 1, 1,
0.5371349, 0.6299112, 1.671336, 0, 0, 0, 1, 1,
0.5377926, 0.4311422, -0.7239031, 0, 0, 0, 1, 1,
0.5383678, 0.1525132, 2.266645, 0, 0, 0, 1, 1,
0.5473707, 0.05448185, 1.23648, 1, 1, 1, 1, 1,
0.5498006, 0.3418703, 2.293386, 1, 1, 1, 1, 1,
0.5545073, 1.006014, 0.9836164, 1, 1, 1, 1, 1,
0.5550477, -1.403504, 3.743095, 1, 1, 1, 1, 1,
0.5602428, -0.2676786, 1.85574, 1, 1, 1, 1, 1,
0.5605851, -0.5899506, 2.376761, 1, 1, 1, 1, 1,
0.5632736, -0.6318854, 1.769731, 1, 1, 1, 1, 1,
0.5691405, -0.3511808, 0.6455318, 1, 1, 1, 1, 1,
0.5709983, -1.530247, 1.799375, 1, 1, 1, 1, 1,
0.5729887, -1.083092, 4.047216, 1, 1, 1, 1, 1,
0.5737746, 0.7452658, 0.284694, 1, 1, 1, 1, 1,
0.5759907, 0.3974913, 0.4481138, 1, 1, 1, 1, 1,
0.576105, 0.3243938, 0.002482818, 1, 1, 1, 1, 1,
0.5762079, -1.060508, 2.318761, 1, 1, 1, 1, 1,
0.5856848, -0.09611826, 0.01840997, 1, 1, 1, 1, 1,
0.5885201, 0.2748165, 1.421753, 0, 0, 1, 1, 1,
0.5910541, 2.051745, 1.31576, 1, 0, 0, 1, 1,
0.5955723, 1.326024, -0.9841959, 1, 0, 0, 1, 1,
0.5971038, 0.3682972, 1.994695, 1, 0, 0, 1, 1,
0.5982323, -0.8113506, 2.832769, 1, 0, 0, 1, 1,
0.6025383, 1.284283, 0.3010691, 1, 0, 0, 1, 1,
0.6037132, -1.255071, 0.8538966, 0, 0, 0, 1, 1,
0.6069816, -0.8865259, 3.515595, 0, 0, 0, 1, 1,
0.6122214, 0.2031451, 1.19784, 0, 0, 0, 1, 1,
0.6138522, 0.4570366, 0.009472184, 0, 0, 0, 1, 1,
0.6223024, 1.286512, 0.1744178, 0, 0, 0, 1, 1,
0.6225792, 0.8345143, 0.8457358, 0, 0, 0, 1, 1,
0.6241209, 0.2903908, 1.211961, 0, 0, 0, 1, 1,
0.6276362, 0.8668371, 1.245486, 1, 1, 1, 1, 1,
0.63105, 2.211782, -0.9375035, 1, 1, 1, 1, 1,
0.6341425, 1.22925, 2.184988, 1, 1, 1, 1, 1,
0.6408895, 0.9882247, 0.7244354, 1, 1, 1, 1, 1,
0.6424183, 0.1846386, 1.413536, 1, 1, 1, 1, 1,
0.6444535, 0.6094645, 4.667973, 1, 1, 1, 1, 1,
0.6498545, -1.679249, 1.245382, 1, 1, 1, 1, 1,
0.6582476, 0.6726889, 2.156099, 1, 1, 1, 1, 1,
0.6599591, 0.2264656, -0.7659418, 1, 1, 1, 1, 1,
0.66019, 1.844142, 1.142808, 1, 1, 1, 1, 1,
0.6653717, 0.2615723, 0.6635904, 1, 1, 1, 1, 1,
0.6707746, -1.929497, 3.093426, 1, 1, 1, 1, 1,
0.6747649, 0.1750892, 2.915154, 1, 1, 1, 1, 1,
0.6866418, -1.2261, 3.084064, 1, 1, 1, 1, 1,
0.6935133, -1.491285, 3.06769, 1, 1, 1, 1, 1,
0.6981545, 0.2970017, 1.252469, 0, 0, 1, 1, 1,
0.6993007, 1.331056, -0.4330213, 1, 0, 0, 1, 1,
0.7004457, -0.0004006066, 0.7222738, 1, 0, 0, 1, 1,
0.7013716, 0.9826897, -0.9877312, 1, 0, 0, 1, 1,
0.7054855, -2.691968, 2.502254, 1, 0, 0, 1, 1,
0.7081367, 0.5370728, 0.01523825, 1, 0, 0, 1, 1,
0.713987, 1.399712, -0.4243179, 0, 0, 0, 1, 1,
0.7156738, -0.9799063, 2.817579, 0, 0, 0, 1, 1,
0.7223514, -0.6039371, 1.431884, 0, 0, 0, 1, 1,
0.7245439, -0.6060106, 2.038305, 0, 0, 0, 1, 1,
0.7320606, -0.6472798, 1.875633, 0, 0, 0, 1, 1,
0.7367728, 2.27768, -0.01093179, 0, 0, 0, 1, 1,
0.7444584, -0.4865405, 2.774209, 0, 0, 0, 1, 1,
0.7449904, -0.9193859, 1.902159, 1, 1, 1, 1, 1,
0.7573867, -0.5344741, 3.184674, 1, 1, 1, 1, 1,
0.7646375, -0.2857791, 0.4341072, 1, 1, 1, 1, 1,
0.7659059, 1.545933, -0.7529815, 1, 1, 1, 1, 1,
0.7670384, -0.4613545, 2.183574, 1, 1, 1, 1, 1,
0.7712966, -1.761794, 1.550298, 1, 1, 1, 1, 1,
0.7739298, 1.063442, 0.9258915, 1, 1, 1, 1, 1,
0.7812231, -0.6219032, 1.455178, 1, 1, 1, 1, 1,
0.7862709, 1.416533, 1.483318, 1, 1, 1, 1, 1,
0.7870673, -1.729083, 2.09018, 1, 1, 1, 1, 1,
0.7884719, -0.924858, 2.762016, 1, 1, 1, 1, 1,
0.7920145, 1.997784, -1.416799, 1, 1, 1, 1, 1,
0.7950632, 0.1911522, 1.737017, 1, 1, 1, 1, 1,
0.8038, 1.33782, 2.643673, 1, 1, 1, 1, 1,
0.8052303, 0.1109597, 0.7182994, 1, 1, 1, 1, 1,
0.8065095, 0.8658301, -0.2824983, 0, 0, 1, 1, 1,
0.81182, -0.4547204, 1.738896, 1, 0, 0, 1, 1,
0.812295, 0.2782398, 1.040751, 1, 0, 0, 1, 1,
0.8126116, -0.148882, 0.1952526, 1, 0, 0, 1, 1,
0.8142021, 0.5555083, 0.7177182, 1, 0, 0, 1, 1,
0.8252212, -0.2088625, 2.471689, 1, 0, 0, 1, 1,
0.8270851, -0.7427388, 2.237395, 0, 0, 0, 1, 1,
0.8307916, 0.1649213, 0.9371761, 0, 0, 0, 1, 1,
0.8342747, -0.3801324, 2.022508, 0, 0, 0, 1, 1,
0.8435131, -0.276056, 2.389818, 0, 0, 0, 1, 1,
0.8435975, -0.1116301, 2.447347, 0, 0, 0, 1, 1,
0.8466212, 0.4026406, 1.413058, 0, 0, 0, 1, 1,
0.848349, 1.133914, 1.996059, 0, 0, 0, 1, 1,
0.8525134, 0.7736503, -0.7137781, 1, 1, 1, 1, 1,
0.8585172, -0.4761734, 3.553611, 1, 1, 1, 1, 1,
0.8656186, -2.180962, 2.818519, 1, 1, 1, 1, 1,
0.8746325, -3.076508, 2.664468, 1, 1, 1, 1, 1,
0.8777689, 0.3823457, 3.133241, 1, 1, 1, 1, 1,
0.8813288, 0.7674521, 0.5461147, 1, 1, 1, 1, 1,
0.8851881, -1.693312, 2.3709, 1, 1, 1, 1, 1,
0.8893576, -0.5649921, 2.766962, 1, 1, 1, 1, 1,
0.892746, 1.200207, 0.2808728, 1, 1, 1, 1, 1,
0.8928813, 0.8821996, 0.7986484, 1, 1, 1, 1, 1,
0.89527, 0.2624983, 2.532766, 1, 1, 1, 1, 1,
0.8963262, 0.1862066, 0.8496946, 1, 1, 1, 1, 1,
0.8999178, 0.05851775, 2.219205, 1, 1, 1, 1, 1,
0.9018808, -0.6477746, 2.033813, 1, 1, 1, 1, 1,
0.9041337, -0.7240928, 2.210606, 1, 1, 1, 1, 1,
0.9061487, 0.2122721, -0.1634646, 0, 0, 1, 1, 1,
0.9094457, 0.2810842, 2.888502, 1, 0, 0, 1, 1,
0.9138893, -0.880509, 2.312622, 1, 0, 0, 1, 1,
0.9187057, 0.2233524, 0.9816645, 1, 0, 0, 1, 1,
0.9250151, -2.285938, 1.253866, 1, 0, 0, 1, 1,
0.9289157, -1.105667, 2.859241, 1, 0, 0, 1, 1,
0.9297918, -1.854245, 3.62035, 0, 0, 0, 1, 1,
0.9298042, 1.066771, 2.622722, 0, 0, 0, 1, 1,
0.9317279, -0.5305411, 2.690109, 0, 0, 0, 1, 1,
0.9323817, 1.035267, -1.917285, 0, 0, 0, 1, 1,
0.9400945, -0.4088076, 3.038023, 0, 0, 0, 1, 1,
0.9404423, -0.548188, 2.976036, 0, 0, 0, 1, 1,
0.9404936, 0.8506823, 0.8850845, 0, 0, 0, 1, 1,
0.9550752, -0.831957, 1.830558, 1, 1, 1, 1, 1,
0.9582071, 0.7192248, 1.634936, 1, 1, 1, 1, 1,
0.9620025, 1.338773, 2.075415, 1, 1, 1, 1, 1,
0.9680146, 0.5318189, 0.4948227, 1, 1, 1, 1, 1,
0.9731244, 1.144544, 2.145949, 1, 1, 1, 1, 1,
0.9742461, -0.1525149, 0.7104792, 1, 1, 1, 1, 1,
0.9773239, 0.7333965, 2.141849, 1, 1, 1, 1, 1,
0.9915981, 1.260138, 0.8577173, 1, 1, 1, 1, 1,
1.000437, 0.9726518, 0.655585, 1, 1, 1, 1, 1,
1.002342, 0.9633879, 1.741774, 1, 1, 1, 1, 1,
1.005617, 1.310229, 1.328377, 1, 1, 1, 1, 1,
1.007306, 0.1039954, 0.6434652, 1, 1, 1, 1, 1,
1.011775, -0.9622535, 2.535699, 1, 1, 1, 1, 1,
1.014254, -0.4125841, 1.18679, 1, 1, 1, 1, 1,
1.014291, -0.3526768, 0.7855738, 1, 1, 1, 1, 1,
1.017444, 2.759945, 1.448348, 0, 0, 1, 1, 1,
1.019736, 0.7640147, 0.7637616, 1, 0, 0, 1, 1,
1.021625, -0.2114348, 3.214116, 1, 0, 0, 1, 1,
1.022574, -0.2217738, 2.43296, 1, 0, 0, 1, 1,
1.026429, 0.5930572, -0.6123093, 1, 0, 0, 1, 1,
1.028268, -0.4864626, 3.94123, 1, 0, 0, 1, 1,
1.031467, -1.881033, 2.606954, 0, 0, 0, 1, 1,
1.040873, -0.1861878, 2.237408, 0, 0, 0, 1, 1,
1.045661, 0.2823879, 2.211923, 0, 0, 0, 1, 1,
1.048034, 0.9598524, -0.03449848, 0, 0, 0, 1, 1,
1.049221, 0.6092193, 0.6487659, 0, 0, 0, 1, 1,
1.051247, -0.2500841, 1.9147, 0, 0, 0, 1, 1,
1.053155, 0.6342371, 1.696973, 0, 0, 0, 1, 1,
1.058955, -0.7131486, 3.675991, 1, 1, 1, 1, 1,
1.061769, -0.711069, 2.663491, 1, 1, 1, 1, 1,
1.062071, -0.685887, 3.985306, 1, 1, 1, 1, 1,
1.063653, 1.75389, 0.6181465, 1, 1, 1, 1, 1,
1.073819, -0.7316629, 1.99799, 1, 1, 1, 1, 1,
1.080367, -1.139265, 3.486682, 1, 1, 1, 1, 1,
1.083138, -1.075049, 2.740117, 1, 1, 1, 1, 1,
1.086529, 0.1127748, 2.708419, 1, 1, 1, 1, 1,
1.089278, 1.359672, -0.9220167, 1, 1, 1, 1, 1,
1.091639, 1.286102, 1.144976, 1, 1, 1, 1, 1,
1.098304, 0.925408, -0.2921474, 1, 1, 1, 1, 1,
1.10373, 1.172003, -0.116289, 1, 1, 1, 1, 1,
1.113456, 0.3360687, 3.758739, 1, 1, 1, 1, 1,
1.114578, -0.2870849, 1.832375, 1, 1, 1, 1, 1,
1.115965, 0.04627126, 0.8806087, 1, 1, 1, 1, 1,
1.116075, -0.3026368, 1.265781, 0, 0, 1, 1, 1,
1.124896, -0.4119852, 1.688329, 1, 0, 0, 1, 1,
1.128702, 0.5297173, 1.904041, 1, 0, 0, 1, 1,
1.130331, 0.8463474, 2.115748, 1, 0, 0, 1, 1,
1.130782, 0.2249942, 0.8306512, 1, 0, 0, 1, 1,
1.130886, -0.4525122, 1.201842, 1, 0, 0, 1, 1,
1.132217, -0.3737708, 3.603015, 0, 0, 0, 1, 1,
1.134613, 1.219842, 2.623754, 0, 0, 0, 1, 1,
1.140493, 0.3388467, 2.496954, 0, 0, 0, 1, 1,
1.145161, 0.869342, 0.2211613, 0, 0, 0, 1, 1,
1.148368, -0.07479624, 1.408412, 0, 0, 0, 1, 1,
1.149345, -0.8393026, 3.766338, 0, 0, 0, 1, 1,
1.176012, 0.464049, 1.713385, 0, 0, 0, 1, 1,
1.177598, 1.280992, 0.6104069, 1, 1, 1, 1, 1,
1.179528, -0.6515988, 1.414109, 1, 1, 1, 1, 1,
1.180443, -0.6165199, 0.5095893, 1, 1, 1, 1, 1,
1.197758, 0.1325458, 1.843738, 1, 1, 1, 1, 1,
1.203414, -0.1875233, 1.28725, 1, 1, 1, 1, 1,
1.212866, 0.552652, 1.693266, 1, 1, 1, 1, 1,
1.228234, -1.320236, 3.09148, 1, 1, 1, 1, 1,
1.228443, 1.015494, 0.3830203, 1, 1, 1, 1, 1,
1.230271, -0.4332387, 0.5032818, 1, 1, 1, 1, 1,
1.232934, 0.4306323, 1.58294, 1, 1, 1, 1, 1,
1.234577, -0.5301782, 1.046786, 1, 1, 1, 1, 1,
1.238233, -0.3028597, 3.531541, 1, 1, 1, 1, 1,
1.239268, 0.5863686, 1.7419, 1, 1, 1, 1, 1,
1.241263, -1.553092, 2.069527, 1, 1, 1, 1, 1,
1.244167, 0.633261, -0.3857798, 1, 1, 1, 1, 1,
1.254698, -1.827551, 2.035947, 0, 0, 1, 1, 1,
1.260088, -2.021118, 3.671702, 1, 0, 0, 1, 1,
1.265599, -1.463574, 2.713035, 1, 0, 0, 1, 1,
1.265877, -1.268301, 3.417733, 1, 0, 0, 1, 1,
1.269834, 1.389021, 1.210801, 1, 0, 0, 1, 1,
1.285427, 0.8588645, 0.3261693, 1, 0, 0, 1, 1,
1.290139, 1.961054, 1.597398, 0, 0, 0, 1, 1,
1.296879, 0.06434915, 2.620341, 0, 0, 0, 1, 1,
1.298719, -0.9900261, 2.898677, 0, 0, 0, 1, 1,
1.301979, -0.6367556, 1.400724, 0, 0, 0, 1, 1,
1.30325, 0.1650848, 2.063521, 0, 0, 0, 1, 1,
1.314277, 0.8046873, 0.5172462, 0, 0, 0, 1, 1,
1.317628, 1.557972, -0.5701536, 0, 0, 0, 1, 1,
1.321502, 0.9090095, -0.4474754, 1, 1, 1, 1, 1,
1.32395, 0.03586868, 0.6037328, 1, 1, 1, 1, 1,
1.325428, 0.7461919, 3.172243, 1, 1, 1, 1, 1,
1.330613, 0.8108471, 1.705737, 1, 1, 1, 1, 1,
1.358722, 0.5244349, 1.320536, 1, 1, 1, 1, 1,
1.374774, 0.4721338, 1.909809, 1, 1, 1, 1, 1,
1.389683, 0.4212954, 0.7760577, 1, 1, 1, 1, 1,
1.393372, -0.346504, 2.752602, 1, 1, 1, 1, 1,
1.398779, 0.3359743, 1.578325, 1, 1, 1, 1, 1,
1.412023, 0.1322005, 0.02102522, 1, 1, 1, 1, 1,
1.413238, -1.32872, 2.954938, 1, 1, 1, 1, 1,
1.425484, 1.344672, 0.8117675, 1, 1, 1, 1, 1,
1.434835, -0.1766481, 2.392617, 1, 1, 1, 1, 1,
1.437425, -0.7359685, 1.784984, 1, 1, 1, 1, 1,
1.445375, -1.06999, 1.3157, 1, 1, 1, 1, 1,
1.459944, 0.5170694, 1.256473, 0, 0, 1, 1, 1,
1.471261, -0.1064837, 1.265577, 1, 0, 0, 1, 1,
1.478202, 0.5942745, 1.31212, 1, 0, 0, 1, 1,
1.485723, -3.206599, 2.836329, 1, 0, 0, 1, 1,
1.490905, -0.3493909, 0.5219667, 1, 0, 0, 1, 1,
1.513976, 2.305948, -0.3063587, 1, 0, 0, 1, 1,
1.51709, 0.1488385, 3.514419, 0, 0, 0, 1, 1,
1.556559, 0.04703099, 1.131234, 0, 0, 0, 1, 1,
1.564579, 2.001889, 0.7293974, 0, 0, 0, 1, 1,
1.569734, -1.21428, 3.191188, 0, 0, 0, 1, 1,
1.576321, -0.5771074, 3.427463, 0, 0, 0, 1, 1,
1.600352, 0.643349, 0.877184, 0, 0, 0, 1, 1,
1.609031, -1.059522, 1.739121, 0, 0, 0, 1, 1,
1.612889, 1.033967, 1.295941, 1, 1, 1, 1, 1,
1.620106, 0.1717334, 1.089958, 1, 1, 1, 1, 1,
1.625692, -0.1617534, 1.996774, 1, 1, 1, 1, 1,
1.627941, -0.8890815, 0.6818545, 1, 1, 1, 1, 1,
1.63452, -2.149081, 2.656183, 1, 1, 1, 1, 1,
1.635754, -1.137315, 2.277417, 1, 1, 1, 1, 1,
1.637226, -0.4572473, 2.298613, 1, 1, 1, 1, 1,
1.638159, -0.1909131, 0.4406126, 1, 1, 1, 1, 1,
1.651801, 0.2637856, 0.820462, 1, 1, 1, 1, 1,
1.679264, 0.06969365, 0.4313652, 1, 1, 1, 1, 1,
1.689482, -0.04365417, 1.212637, 1, 1, 1, 1, 1,
1.698096, -1.109339, -0.05454706, 1, 1, 1, 1, 1,
1.708711, 0.8420326, -0.4516977, 1, 1, 1, 1, 1,
1.716035, -0.9730334, 1.388569, 1, 1, 1, 1, 1,
1.717991, -0.5306756, 1.868688, 1, 1, 1, 1, 1,
1.725966, 1.759931, 1.403457, 0, 0, 1, 1, 1,
1.729655, -0.7011666, 1.733739, 1, 0, 0, 1, 1,
1.745963, -1.510915, 3.761953, 1, 0, 0, 1, 1,
1.747237, -0.2723204, 1.032699, 1, 0, 0, 1, 1,
1.754129, -0.9379227, 3.207834, 1, 0, 0, 1, 1,
1.757085, 0.5129601, 1.725323, 1, 0, 0, 1, 1,
1.759558, -0.2945388, 1.682868, 0, 0, 0, 1, 1,
1.760287, 1.099406, 1.418795, 0, 0, 0, 1, 1,
1.778785, 1.540076, -0.6065146, 0, 0, 0, 1, 1,
1.793201, 0.7700788, 2.839216, 0, 0, 0, 1, 1,
1.830563, 1.435028, 0.348076, 0, 0, 0, 1, 1,
1.837112, -0.7525206, 0.3488129, 0, 0, 0, 1, 1,
1.839022, -1.002725, 3.21314, 0, 0, 0, 1, 1,
1.898303, 0.6260458, 1.393704, 1, 1, 1, 1, 1,
1.903399, 0.6658163, -0.9262409, 1, 1, 1, 1, 1,
1.9075, -0.4419582, 2.024479, 1, 1, 1, 1, 1,
1.937471, 0.2674867, 3.589705, 1, 1, 1, 1, 1,
1.957624, -1.151675, 1.751762, 1, 1, 1, 1, 1,
1.957978, -0.146063, 2.096016, 1, 1, 1, 1, 1,
1.969493, -0.5708359, 0.6959448, 1, 1, 1, 1, 1,
1.974375, 0.4986777, 0.8122848, 1, 1, 1, 1, 1,
1.979246, 2.276705, 1.906891, 1, 1, 1, 1, 1,
2.023064, 0.7168195, 1.426597, 1, 1, 1, 1, 1,
2.042402, -2.127756, 1.745811, 1, 1, 1, 1, 1,
2.044887, 1.088607, 0.8649818, 1, 1, 1, 1, 1,
2.11526, 1.193258, 1.991429, 1, 1, 1, 1, 1,
2.123156, 0.5796979, 1.321137, 1, 1, 1, 1, 1,
2.123734, 1.198038, 1.517706, 1, 1, 1, 1, 1,
2.134374, -0.416364, 2.062745, 0, 0, 1, 1, 1,
2.200573, -1.358388, 0.6599616, 1, 0, 0, 1, 1,
2.228357, 1.538287, 0.8066113, 1, 0, 0, 1, 1,
2.238193, -0.7782148, 1.886064, 1, 0, 0, 1, 1,
2.280757, 0.8447902, 0.9364067, 1, 0, 0, 1, 1,
2.324945, 0.1029798, 3.714548, 1, 0, 0, 1, 1,
2.332071, -0.7315282, 3.736933, 0, 0, 0, 1, 1,
2.354321, 1.343662, 0.429551, 0, 0, 0, 1, 1,
2.442594, -0.1538437, 2.073702, 0, 0, 0, 1, 1,
2.482554, 1.084898, 0.261539, 0, 0, 0, 1, 1,
2.574708, -0.5855389, 1.080686, 0, 0, 0, 1, 1,
2.677781, -0.2441474, 1.877703, 0, 0, 0, 1, 1,
2.679534, 0.3120045, 1.667654, 0, 0, 0, 1, 1,
2.732428, -1.508698, 0.7747216, 1, 1, 1, 1, 1,
2.742129, 0.2958347, 2.096606, 1, 1, 1, 1, 1,
2.758009, -0.7215413, 3.724806, 1, 1, 1, 1, 1,
2.941093, 0.1838028, 0.4530316, 1, 1, 1, 1, 1,
3.260916, 3.064423, 0.7115172, 1, 1, 1, 1, 1,
3.408964, -0.2728098, 3.499687, 1, 1, 1, 1, 1,
3.466404, 0.310084, 0.7481256, 1, 1, 1, 1, 1
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
var radius = 9.816522;
var distance = 34.48012;
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
mvMatrix.translate( 0.1553509, 0.4218659, -0.3875122 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.48012);
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
