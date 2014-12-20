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
-3.462143, 0.6870544, 0.9216921, 1, 0, 0, 1,
-3.089526, -1.057673, -2.418882, 1, 0.007843138, 0, 1,
-2.890996, -1.776919, -2.048215, 1, 0.01176471, 0, 1,
-2.61446, 1.381667, -0.8071436, 1, 0.01960784, 0, 1,
-2.518124, 0.9759347, -1.26423, 1, 0.02352941, 0, 1,
-2.409706, 0.5412054, -1.916016, 1, 0.03137255, 0, 1,
-2.299765, 1.03994, -1.757697, 1, 0.03529412, 0, 1,
-2.184423, 0.2619409, -0.8951899, 1, 0.04313726, 0, 1,
-2.176393, 2.026719, -1.673639, 1, 0.04705882, 0, 1,
-2.167148, -0.3067928, -2.071554, 1, 0.05490196, 0, 1,
-2.164131, -0.8498676, -2.187235, 1, 0.05882353, 0, 1,
-2.146297, 1.085739, -0.9116132, 1, 0.06666667, 0, 1,
-2.074336, -0.3590155, -1.29501, 1, 0.07058824, 0, 1,
-2.073617, -0.03556319, -1.375691, 1, 0.07843138, 0, 1,
-2.072775, -0.3772976, -1.256445, 1, 0.08235294, 0, 1,
-2.063227, -0.06253928, -2.248927, 1, 0.09019608, 0, 1,
-2.056018, 1.361969, -0.5583246, 1, 0.09411765, 0, 1,
-1.99659, 0.6705208, -0.003053356, 1, 0.1019608, 0, 1,
-1.99338, -1.750806, -0.9707449, 1, 0.1098039, 0, 1,
-1.983788, 1.160507, -2.876526, 1, 0.1137255, 0, 1,
-1.981586, 1.930543, -0.1039574, 1, 0.1215686, 0, 1,
-1.981032, -0.9187365, -3.008758, 1, 0.1254902, 0, 1,
-1.976188, 1.480478, -0.3707727, 1, 0.1333333, 0, 1,
-1.957378, 0.3247173, -3.19879, 1, 0.1372549, 0, 1,
-1.957321, 0.4259877, -2.433286, 1, 0.145098, 0, 1,
-1.939398, -0.1124197, -1.720808, 1, 0.1490196, 0, 1,
-1.936266, 1.103196, -1.362621, 1, 0.1568628, 0, 1,
-1.928352, -0.1911965, -3.802103, 1, 0.1607843, 0, 1,
-1.897111, 0.2150189, -3.447324, 1, 0.1686275, 0, 1,
-1.888141, -0.4379394, -1.063764, 1, 0.172549, 0, 1,
-1.884207, -0.7657745, -0.2364394, 1, 0.1803922, 0, 1,
-1.86854, -0.9150078, -1.09966, 1, 0.1843137, 0, 1,
-1.853854, 1.125029, 0.7655596, 1, 0.1921569, 0, 1,
-1.845001, -0.6292098, -3.299691, 1, 0.1960784, 0, 1,
-1.832934, -0.6232692, -1.48154, 1, 0.2039216, 0, 1,
-1.831481, 1.758374, 0.3588222, 1, 0.2117647, 0, 1,
-1.824144, -0.5054048, -2.784344, 1, 0.2156863, 0, 1,
-1.793223, 0.7807141, -0.4168989, 1, 0.2235294, 0, 1,
-1.79252, -0.6916474, -3.457733, 1, 0.227451, 0, 1,
-1.790125, 0.1899104, -2.252923, 1, 0.2352941, 0, 1,
-1.768169, -0.878525, -1.618155, 1, 0.2392157, 0, 1,
-1.751994, -0.4121671, -1.602521, 1, 0.2470588, 0, 1,
-1.751062, -0.01634533, -1.892924, 1, 0.2509804, 0, 1,
-1.722397, -1.189742, -2.064494, 1, 0.2588235, 0, 1,
-1.688654, -0.4860618, -2.716985, 1, 0.2627451, 0, 1,
-1.685597, -0.2591977, -1.370634, 1, 0.2705882, 0, 1,
-1.68062, -0.09458899, -0.2253118, 1, 0.2745098, 0, 1,
-1.679568, 1.635809, -0.4352963, 1, 0.282353, 0, 1,
-1.664746, 1.126049, -1.876502, 1, 0.2862745, 0, 1,
-1.646322, 1.742921, -0.1509189, 1, 0.2941177, 0, 1,
-1.642687, 0.4005693, -1.625625, 1, 0.3019608, 0, 1,
-1.642372, -1.542614, -2.208183, 1, 0.3058824, 0, 1,
-1.638718, -1.705491, -2.549699, 1, 0.3137255, 0, 1,
-1.638708, -1.302149, -3.505662, 1, 0.3176471, 0, 1,
-1.61667, -2.033277, -1.981243, 1, 0.3254902, 0, 1,
-1.599585, 1.240433, -0.7310835, 1, 0.3294118, 0, 1,
-1.597674, -0.7193849, -0.5894908, 1, 0.3372549, 0, 1,
-1.593048, 2.190504, -1.893582, 1, 0.3411765, 0, 1,
-1.592865, -1.364573, -1.82032, 1, 0.3490196, 0, 1,
-1.590325, -0.4131287, -2.244098, 1, 0.3529412, 0, 1,
-1.571588, -1.034415, -1.828197, 1, 0.3607843, 0, 1,
-1.559946, 0.855321, -2.440168, 1, 0.3647059, 0, 1,
-1.538854, -1.307268, -2.650072, 1, 0.372549, 0, 1,
-1.535027, 0.1354458, -1.099085, 1, 0.3764706, 0, 1,
-1.534606, -0.3728982, -2.890588, 1, 0.3843137, 0, 1,
-1.512244, -1.372444, -0.7987486, 1, 0.3882353, 0, 1,
-1.508932, -0.4522771, -2.235714, 1, 0.3960784, 0, 1,
-1.498818, -1.111996, -2.676062, 1, 0.4039216, 0, 1,
-1.498631, 0.517535, -2.315016, 1, 0.4078431, 0, 1,
-1.495094, -0.5628307, -1.514394, 1, 0.4156863, 0, 1,
-1.473402, 0.3225534, -0.2053171, 1, 0.4196078, 0, 1,
-1.466951, -1.422082, -2.409003, 1, 0.427451, 0, 1,
-1.465482, 0.1822708, -1.015138, 1, 0.4313726, 0, 1,
-1.454805, -1.284351, -2.202788, 1, 0.4392157, 0, 1,
-1.435405, -0.3642823, -3.005315, 1, 0.4431373, 0, 1,
-1.424754, 0.1748584, -2.685494, 1, 0.4509804, 0, 1,
-1.413249, -0.03155844, -0.9534552, 1, 0.454902, 0, 1,
-1.409094, -1.013252, -3.316867, 1, 0.4627451, 0, 1,
-1.403747, 0.7154815, -0.09208225, 1, 0.4666667, 0, 1,
-1.390211, -0.598644, -2.881279, 1, 0.4745098, 0, 1,
-1.384879, -1.049685, -2.60476, 1, 0.4784314, 0, 1,
-1.379654, -0.3886831, -1.795638, 1, 0.4862745, 0, 1,
-1.376448, -1.692346, -3.074335, 1, 0.4901961, 0, 1,
-1.373133, 1.31903, -1.82276, 1, 0.4980392, 0, 1,
-1.349896, -0.2212251, -2.139199, 1, 0.5058824, 0, 1,
-1.348266, -1.914298, -2.493693, 1, 0.509804, 0, 1,
-1.33117, 0.2753751, -0.8817964, 1, 0.5176471, 0, 1,
-1.329326, -0.04648255, -1.260932, 1, 0.5215687, 0, 1,
-1.327198, -1.45479, -1.955088, 1, 0.5294118, 0, 1,
-1.324458, 0.7656022, -1.572672, 1, 0.5333334, 0, 1,
-1.322593, 1.256016, -2.945049, 1, 0.5411765, 0, 1,
-1.317039, 0.1593252, -2.423377, 1, 0.5450981, 0, 1,
-1.314423, 0.6174942, -3.171471, 1, 0.5529412, 0, 1,
-1.313969, -1.270391, -1.546323, 1, 0.5568628, 0, 1,
-1.310751, 1.270194, -0.6419858, 1, 0.5647059, 0, 1,
-1.309959, 0.8499173, 0.1132722, 1, 0.5686275, 0, 1,
-1.302966, 0.0933927, -1.008253, 1, 0.5764706, 0, 1,
-1.299013, 0.5247558, -0.6611511, 1, 0.5803922, 0, 1,
-1.295883, 1.041011, -0.7187791, 1, 0.5882353, 0, 1,
-1.295748, 1.103661, 0.2008356, 1, 0.5921569, 0, 1,
-1.289759, -0.9470403, -1.51689, 1, 0.6, 0, 1,
-1.289269, -0.1339103, -2.843916, 1, 0.6078432, 0, 1,
-1.286074, 0.1179719, -2.407813, 1, 0.6117647, 0, 1,
-1.285599, -0.7139954, -2.133843, 1, 0.6196079, 0, 1,
-1.281886, 0.1276185, -3.164604, 1, 0.6235294, 0, 1,
-1.279665, -1.303622, -1.535478, 1, 0.6313726, 0, 1,
-1.277568, -0.5821334, -2.103788, 1, 0.6352941, 0, 1,
-1.275826, 0.2807766, -3.053856, 1, 0.6431373, 0, 1,
-1.261902, -1.134285, -2.668149, 1, 0.6470588, 0, 1,
-1.255897, 0.2851163, -3.152919, 1, 0.654902, 0, 1,
-1.251345, 1.70343, 1.39877, 1, 0.6588235, 0, 1,
-1.249799, 0.2152345, -0.6395206, 1, 0.6666667, 0, 1,
-1.236922, 0.2595155, 0.08773644, 1, 0.6705883, 0, 1,
-1.232643, -0.5011742, -1.759638, 1, 0.6784314, 0, 1,
-1.212472, 0.2685262, -1.043069, 1, 0.682353, 0, 1,
-1.205682, 0.1408054, -0.7580481, 1, 0.6901961, 0, 1,
-1.203197, 0.5258857, -1.301896, 1, 0.6941177, 0, 1,
-1.194252, 1.080501, 0.6325761, 1, 0.7019608, 0, 1,
-1.186421, 0.6023345, -1.499992, 1, 0.7098039, 0, 1,
-1.182917, -0.2217905, 0.5299439, 1, 0.7137255, 0, 1,
-1.180887, -0.1483996, -3.436972, 1, 0.7215686, 0, 1,
-1.175079, 0.61103, -0.6866507, 1, 0.7254902, 0, 1,
-1.17298, -1.270273, -0.6120892, 1, 0.7333333, 0, 1,
-1.169574, 1.056358, -1.090433, 1, 0.7372549, 0, 1,
-1.168264, 1.344913, -0.9796606, 1, 0.7450981, 0, 1,
-1.163304, -0.7746814, -0.4799058, 1, 0.7490196, 0, 1,
-1.160812, 0.687232, -0.4275547, 1, 0.7568628, 0, 1,
-1.160717, -0.2780854, -3.473599, 1, 0.7607843, 0, 1,
-1.155951, -1.574487, -1.769396, 1, 0.7686275, 0, 1,
-1.143351, -0.1053144, -1.493551, 1, 0.772549, 0, 1,
-1.141237, -0.6216164, -0.2820499, 1, 0.7803922, 0, 1,
-1.129377, 0.3796975, -1.804766, 1, 0.7843137, 0, 1,
-1.127687, -0.07529856, -1.642348, 1, 0.7921569, 0, 1,
-1.127222, 0.9415346, 0.2793788, 1, 0.7960784, 0, 1,
-1.12634, 0.5183684, -1.330556, 1, 0.8039216, 0, 1,
-1.117492, -2.139217, -3.291799, 1, 0.8117647, 0, 1,
-1.113676, -2.225927, -3.700697, 1, 0.8156863, 0, 1,
-1.105687, 0.1128795, -1.407446, 1, 0.8235294, 0, 1,
-1.095665, -0.1225292, -2.092787, 1, 0.827451, 0, 1,
-1.090874, 0.6710579, -2.778977, 1, 0.8352941, 0, 1,
-1.083174, 1.668367, 0.334758, 1, 0.8392157, 0, 1,
-1.07973, 0.4522028, -2.247873, 1, 0.8470588, 0, 1,
-1.0757, -2.054883, -2.257654, 1, 0.8509804, 0, 1,
-1.075629, 0.5634508, -0.8002405, 1, 0.8588235, 0, 1,
-1.071, 0.1590707, -1.444828, 1, 0.8627451, 0, 1,
-1.063266, -1.91118, -0.5571629, 1, 0.8705882, 0, 1,
-1.057989, 0.8024259, -1.915893, 1, 0.8745098, 0, 1,
-1.047167, -1.285363, -3.118663, 1, 0.8823529, 0, 1,
-1.040728, -1.059601, -3.435655, 1, 0.8862745, 0, 1,
-1.040315, -0.3942328, -1.395903, 1, 0.8941177, 0, 1,
-1.040298, 1.038089, 1.448537, 1, 0.8980392, 0, 1,
-1.039528, 0.9538882, -0.05591214, 1, 0.9058824, 0, 1,
-1.038943, 0.5728836, 0.04941889, 1, 0.9137255, 0, 1,
-1.023762, 0.4584448, -1.63692, 1, 0.9176471, 0, 1,
-1.02097, 0.331812, -1.144217, 1, 0.9254902, 0, 1,
-1.016692, 0.4398704, -0.3913154, 1, 0.9294118, 0, 1,
-1.01501, 0.2455577, -1.395956, 1, 0.9372549, 0, 1,
-1.012275, 0.7297251, -0.09459192, 1, 0.9411765, 0, 1,
-0.9950809, -0.8619273, -0.08815096, 1, 0.9490196, 0, 1,
-0.9936212, -0.6638424, -1.693649, 1, 0.9529412, 0, 1,
-0.992633, -0.02550594, -0.3582655, 1, 0.9607843, 0, 1,
-0.9921915, 1.804957, -0.2341687, 1, 0.9647059, 0, 1,
-0.9897166, 1.517228, -0.2219566, 1, 0.972549, 0, 1,
-0.9856333, -1.428445, -1.155664, 1, 0.9764706, 0, 1,
-0.9856232, 0.9325979, -0.1043751, 1, 0.9843137, 0, 1,
-0.9824493, -0.6635301, -2.159053, 1, 0.9882353, 0, 1,
-0.9802561, -1.702798, -2.820379, 1, 0.9960784, 0, 1,
-0.9791713, 1.22, -2.041114, 0.9960784, 1, 0, 1,
-0.9788674, 0.08664707, -2.020011, 0.9921569, 1, 0, 1,
-0.9771295, -1.022483, -2.979352, 0.9843137, 1, 0, 1,
-0.975597, 2.704904, -1.933562, 0.9803922, 1, 0, 1,
-0.9726844, -1.423789, -1.153716, 0.972549, 1, 0, 1,
-0.9666367, -0.824892, -1.086654, 0.9686275, 1, 0, 1,
-0.9647996, 1.723375, -1.154621, 0.9607843, 1, 0, 1,
-0.9637507, -2.042325, -3.459489, 0.9568627, 1, 0, 1,
-0.9543129, 0.7769924, 0.4846254, 0.9490196, 1, 0, 1,
-0.9513168, -0.05505569, -2.387624, 0.945098, 1, 0, 1,
-0.9446114, 1.03717, 0.08073922, 0.9372549, 1, 0, 1,
-0.9398605, -0.624747, -1.524666, 0.9333333, 1, 0, 1,
-0.9327685, -0.08693181, -1.549856, 0.9254902, 1, 0, 1,
-0.9291235, 0.3670044, -0.5939239, 0.9215686, 1, 0, 1,
-0.9284468, -0.6414388, -3.324965, 0.9137255, 1, 0, 1,
-0.9276842, 0.4120975, -0.1767633, 0.9098039, 1, 0, 1,
-0.9260913, 0.4419331, -1.688187, 0.9019608, 1, 0, 1,
-0.9258764, -1.602147, -2.98788, 0.8941177, 1, 0, 1,
-0.9247139, 1.597604, -0.7698817, 0.8901961, 1, 0, 1,
-0.918098, 1.071821, 0.7757905, 0.8823529, 1, 0, 1,
-0.9112729, -0.3819078, -2.677822, 0.8784314, 1, 0, 1,
-0.9033816, -1.53238, -4.048942, 0.8705882, 1, 0, 1,
-0.8931302, -0.7588872, -1.127898, 0.8666667, 1, 0, 1,
-0.891317, -1.642107, -3.810915, 0.8588235, 1, 0, 1,
-0.8874125, -1.359533, -2.415619, 0.854902, 1, 0, 1,
-0.8832324, -1.461704, -2.7568, 0.8470588, 1, 0, 1,
-0.8798947, 0.2339153, -2.015379, 0.8431373, 1, 0, 1,
-0.8691724, 1.018156, 0.4896678, 0.8352941, 1, 0, 1,
-0.8669498, 0.7919683, -1.155365, 0.8313726, 1, 0, 1,
-0.8636003, -0.1123323, -0.1055008, 0.8235294, 1, 0, 1,
-0.8624144, -0.4692851, -0.3577821, 0.8196079, 1, 0, 1,
-0.862026, 0.1320342, -1.316616, 0.8117647, 1, 0, 1,
-0.8581895, -0.6604713, -0.7412286, 0.8078431, 1, 0, 1,
-0.856593, -0.2937967, -1.501562, 0.8, 1, 0, 1,
-0.8559666, -0.1860569, -2.506986, 0.7921569, 1, 0, 1,
-0.8518931, -2.550491, -3.832989, 0.7882353, 1, 0, 1,
-0.8513491, 1.203127, -1.554944, 0.7803922, 1, 0, 1,
-0.850145, 1.130452, -1.907032, 0.7764706, 1, 0, 1,
-0.8440531, -1.387083, -1.133058, 0.7686275, 1, 0, 1,
-0.8382877, -0.8710785, -1.783106, 0.7647059, 1, 0, 1,
-0.8336346, 1.875068, -2.463295, 0.7568628, 1, 0, 1,
-0.8233793, 0.2710052, -2.590497, 0.7529412, 1, 0, 1,
-0.8225394, 0.03984169, -0.6347523, 0.7450981, 1, 0, 1,
-0.8185223, -0.1631312, -2.25109, 0.7411765, 1, 0, 1,
-0.8125615, -1.3714, -3.183022, 0.7333333, 1, 0, 1,
-0.8108022, -0.05465263, -2.755686, 0.7294118, 1, 0, 1,
-0.8106487, -0.2748156, -1.483522, 0.7215686, 1, 0, 1,
-0.8085165, -0.8433706, -3.016662, 0.7176471, 1, 0, 1,
-0.806725, 0.8758436, -0.6983503, 0.7098039, 1, 0, 1,
-0.7925878, -2.821837, -1.811473, 0.7058824, 1, 0, 1,
-0.7922618, 0.1677066, -2.083241, 0.6980392, 1, 0, 1,
-0.7871801, -0.8669702, -1.642657, 0.6901961, 1, 0, 1,
-0.7814208, 0.1784488, -0.8097568, 0.6862745, 1, 0, 1,
-0.7749876, -0.7699324, -2.538977, 0.6784314, 1, 0, 1,
-0.771117, 0.7641942, -0.5981983, 0.6745098, 1, 0, 1,
-0.7711152, 0.2217471, -1.951966, 0.6666667, 1, 0, 1,
-0.7668223, -0.2104165, -0.6024094, 0.6627451, 1, 0, 1,
-0.7590749, -1.83254, -4.295058, 0.654902, 1, 0, 1,
-0.7560599, 0.1884025, -2.005063, 0.6509804, 1, 0, 1,
-0.7547249, -0.5631208, -4.142785, 0.6431373, 1, 0, 1,
-0.7541426, -1.479908, -3.807984, 0.6392157, 1, 0, 1,
-0.7539722, 0.8992956, -0.5372687, 0.6313726, 1, 0, 1,
-0.7536111, -0.164259, -1.679967, 0.627451, 1, 0, 1,
-0.7525667, 1.084056, -1.966782, 0.6196079, 1, 0, 1,
-0.7504419, 1.147245, 0.8477427, 0.6156863, 1, 0, 1,
-0.7478371, 0.636143, -0.1610194, 0.6078432, 1, 0, 1,
-0.7437142, -0.5482383, -3.276452, 0.6039216, 1, 0, 1,
-0.7425216, -1.262302, -3.064858, 0.5960785, 1, 0, 1,
-0.7398469, -0.001996783, -1.558422, 0.5882353, 1, 0, 1,
-0.7394727, -0.9454888, -1.447156, 0.5843138, 1, 0, 1,
-0.723175, 0.07132677, -1.013913, 0.5764706, 1, 0, 1,
-0.7205999, 0.1310292, -1.628837, 0.572549, 1, 0, 1,
-0.7139755, 1.046836, -0.4184134, 0.5647059, 1, 0, 1,
-0.7074412, -0.1174317, -2.081194, 0.5607843, 1, 0, 1,
-0.697216, 0.8496336, -1.055898, 0.5529412, 1, 0, 1,
-0.6964977, -0.4745458, 1.299511, 0.5490196, 1, 0, 1,
-0.6958526, -0.3601231, -0.7001219, 0.5411765, 1, 0, 1,
-0.6943753, 0.02429002, -0.4777461, 0.5372549, 1, 0, 1,
-0.6927427, -0.9194056, -3.105704, 0.5294118, 1, 0, 1,
-0.6906421, 0.2516646, -1.356894, 0.5254902, 1, 0, 1,
-0.6875474, -0.1386049, -2.154768, 0.5176471, 1, 0, 1,
-0.6855657, -0.8959875, -2.376623, 0.5137255, 1, 0, 1,
-0.685387, -0.8426442, -3.567017, 0.5058824, 1, 0, 1,
-0.6794097, 0.4778959, -2.690308, 0.5019608, 1, 0, 1,
-0.6789373, 0.2486162, -3.052556, 0.4941176, 1, 0, 1,
-0.6776013, -0.2313303, -2.323889, 0.4862745, 1, 0, 1,
-0.6617255, 0.1052387, -0.9556044, 0.4823529, 1, 0, 1,
-0.6604776, -0.3039527, -1.991638, 0.4745098, 1, 0, 1,
-0.6585673, -0.7187618, -2.738454, 0.4705882, 1, 0, 1,
-0.6582615, -2.038956, -3.776521, 0.4627451, 1, 0, 1,
-0.651113, 0.7031771, -0.8091613, 0.4588235, 1, 0, 1,
-0.6508634, 1.238653, -0.5351751, 0.4509804, 1, 0, 1,
-0.6492872, 1.179555, 0.9715955, 0.4470588, 1, 0, 1,
-0.6442326, 0.3246374, -2.995615, 0.4392157, 1, 0, 1,
-0.6427314, 0.3129261, -1.116464, 0.4352941, 1, 0, 1,
-0.6410095, -0.8733028, -3.587092, 0.427451, 1, 0, 1,
-0.6392554, 1.529041, -0.1821362, 0.4235294, 1, 0, 1,
-0.6264188, 1.983985, 0.6773208, 0.4156863, 1, 0, 1,
-0.6254836, -0.2154597, -1.127275, 0.4117647, 1, 0, 1,
-0.619766, -1.029908, -2.066429, 0.4039216, 1, 0, 1,
-0.6179516, 0.5056854, -1.208625, 0.3960784, 1, 0, 1,
-0.615431, -0.9040696, -2.779206, 0.3921569, 1, 0, 1,
-0.6066709, 0.8990635, -0.2078846, 0.3843137, 1, 0, 1,
-0.6052665, 0.5791042, -2.48574, 0.3803922, 1, 0, 1,
-0.6051505, 2.055846, -1.796406, 0.372549, 1, 0, 1,
-0.6012084, 0.1319459, -1.751891, 0.3686275, 1, 0, 1,
-0.59949, -0.9313862, -3.124726, 0.3607843, 1, 0, 1,
-0.5987125, -1.314395, -2.050737, 0.3568628, 1, 0, 1,
-0.5956349, -1.576977, -3.091296, 0.3490196, 1, 0, 1,
-0.5944988, 0.5149643, 1.279727, 0.345098, 1, 0, 1,
-0.5934179, 0.1914014, -0.9078363, 0.3372549, 1, 0, 1,
-0.5921825, 0.8247886, -2.98957, 0.3333333, 1, 0, 1,
-0.5893851, -0.4010497, -1.561924, 0.3254902, 1, 0, 1,
-0.5870889, 2.105615, 1.665548, 0.3215686, 1, 0, 1,
-0.5854252, -0.6191164, -3.134244, 0.3137255, 1, 0, 1,
-0.5820067, -0.2145872, -1.700182, 0.3098039, 1, 0, 1,
-0.5796017, 1.520397, 0.2073693, 0.3019608, 1, 0, 1,
-0.5728231, -1.352532, -3.773107, 0.2941177, 1, 0, 1,
-0.5708559, -0.3030152, -2.263553, 0.2901961, 1, 0, 1,
-0.5692243, 0.0393153, -2.188903, 0.282353, 1, 0, 1,
-0.5674329, -0.02497704, -2.296854, 0.2784314, 1, 0, 1,
-0.5672137, 0.8583893, 0.9334611, 0.2705882, 1, 0, 1,
-0.5619844, 0.5242367, -0.9517834, 0.2666667, 1, 0, 1,
-0.5609229, 0.3195096, -0.3349303, 0.2588235, 1, 0, 1,
-0.5561414, 0.04004251, -1.380951, 0.254902, 1, 0, 1,
-0.5448387, -1.328483, -3.408788, 0.2470588, 1, 0, 1,
-0.5346795, 1.021139, 1.73614, 0.2431373, 1, 0, 1,
-0.5338724, -0.8409351, -2.585937, 0.2352941, 1, 0, 1,
-0.5337102, -0.9248606, -4.211379, 0.2313726, 1, 0, 1,
-0.5328693, -0.3327286, -3.027927, 0.2235294, 1, 0, 1,
-0.5319204, 0.2525538, -1.465888, 0.2196078, 1, 0, 1,
-0.5318859, -0.1488945, -2.196562, 0.2117647, 1, 0, 1,
-0.5258522, 1.231938, -0.4415959, 0.2078431, 1, 0, 1,
-0.517615, -0.1955251, -0.2931474, 0.2, 1, 0, 1,
-0.515418, -0.2868003, -3.45623, 0.1921569, 1, 0, 1,
-0.5148938, -1.691607, -2.398411, 0.1882353, 1, 0, 1,
-0.5128325, -2.142931, -3.540742, 0.1803922, 1, 0, 1,
-0.5104414, 0.9077313, 0.09953126, 0.1764706, 1, 0, 1,
-0.5091304, -0.820925, -3.35976, 0.1686275, 1, 0, 1,
-0.5060312, -0.7023036, -2.791518, 0.1647059, 1, 0, 1,
-0.5042217, -1.453763, -2.879065, 0.1568628, 1, 0, 1,
-0.5026979, 1.163846, -0.5078082, 0.1529412, 1, 0, 1,
-0.4964327, -1.040562, -2.97142, 0.145098, 1, 0, 1,
-0.493736, 1.165759, 1.142286, 0.1411765, 1, 0, 1,
-0.4901459, 0.2473914, -2.019198, 0.1333333, 1, 0, 1,
-0.488847, 1.685081, 0.08471926, 0.1294118, 1, 0, 1,
-0.4860933, -0.9710731, -2.029824, 0.1215686, 1, 0, 1,
-0.485699, -1.062806, -2.957698, 0.1176471, 1, 0, 1,
-0.4848354, -0.5926524, -4.963871, 0.1098039, 1, 0, 1,
-0.4836374, 1.49096, 0.283351, 0.1058824, 1, 0, 1,
-0.4808741, -0.6890848, -2.686495, 0.09803922, 1, 0, 1,
-0.4792219, -1.155948, -1.900953, 0.09019608, 1, 0, 1,
-0.478676, -1.154347, -3.297255, 0.08627451, 1, 0, 1,
-0.4763916, -0.245035, -2.301835, 0.07843138, 1, 0, 1,
-0.4702803, -0.4277147, -2.628256, 0.07450981, 1, 0, 1,
-0.4651327, -1.100041, -2.833732, 0.06666667, 1, 0, 1,
-0.4559152, -0.07445534, -2.019429, 0.0627451, 1, 0, 1,
-0.4558556, 0.771853, 0.4995349, 0.05490196, 1, 0, 1,
-0.451065, -0.4221137, -1.796887, 0.05098039, 1, 0, 1,
-0.4508774, -1.059754, -2.696684, 0.04313726, 1, 0, 1,
-0.4495772, 1.016706, 0.765135, 0.03921569, 1, 0, 1,
-0.4417323, -1.278837, -2.499796, 0.03137255, 1, 0, 1,
-0.4410825, 0.3031509, -0.9863958, 0.02745098, 1, 0, 1,
-0.4389878, -0.5768276, -2.797422, 0.01960784, 1, 0, 1,
-0.4332588, -1.297808, -2.639956, 0.01568628, 1, 0, 1,
-0.4286713, 0.8964378, 0.987843, 0.007843138, 1, 0, 1,
-0.4284571, -1.57735, -3.502239, 0.003921569, 1, 0, 1,
-0.4210849, -0.4101675, -4.223395, 0, 1, 0.003921569, 1,
-0.4171993, 0.6077765, -1.539604, 0, 1, 0.01176471, 1,
-0.4131917, 1.112337, -1.758236, 0, 1, 0.01568628, 1,
-0.4124271, 0.8815464, 0.8021126, 0, 1, 0.02352941, 1,
-0.4115478, 1.594138, 0.2728809, 0, 1, 0.02745098, 1,
-0.4078796, 0.7035434, 0.4072129, 0, 1, 0.03529412, 1,
-0.406174, -0.8850661, -2.163592, 0, 1, 0.03921569, 1,
-0.4055976, -3.09495, -3.143996, 0, 1, 0.04705882, 1,
-0.4013193, 0.3172567, -1.443659, 0, 1, 0.05098039, 1,
-0.3955615, 1.136595, -1.805182, 0, 1, 0.05882353, 1,
-0.3947063, 0.07985619, -2.392788, 0, 1, 0.0627451, 1,
-0.3902462, 0.2247954, -3.164427, 0, 1, 0.07058824, 1,
-0.389676, 0.5912054, 0.6131479, 0, 1, 0.07450981, 1,
-0.3893416, -0.1762162, -1.864667, 0, 1, 0.08235294, 1,
-0.3844393, -0.6402912, -3.487892, 0, 1, 0.08627451, 1,
-0.3826379, -0.3434651, -3.389602, 0, 1, 0.09411765, 1,
-0.3812758, 0.3288518, -1.20217, 0, 1, 0.1019608, 1,
-0.3793292, 1.237069, -0.09589529, 0, 1, 0.1058824, 1,
-0.3755057, -0.1992157, -2.318312, 0, 1, 0.1137255, 1,
-0.3749659, 1.318382, -0.1914647, 0, 1, 0.1176471, 1,
-0.3667331, 0.7032439, -0.8255476, 0, 1, 0.1254902, 1,
-0.3662114, 0.636545, -1.008824, 0, 1, 0.1294118, 1,
-0.3641172, 0.09906616, -0.5937452, 0, 1, 0.1372549, 1,
-0.3503999, 0.4199837, -1.239304, 0, 1, 0.1411765, 1,
-0.3439078, -0.1677336, -1.137463, 0, 1, 0.1490196, 1,
-0.3433394, -1.054757, -2.624135, 0, 1, 0.1529412, 1,
-0.3420224, -0.2485045, -3.14911, 0, 1, 0.1607843, 1,
-0.3418909, -0.8099323, -2.983304, 0, 1, 0.1647059, 1,
-0.3332867, -0.1589072, -2.275975, 0, 1, 0.172549, 1,
-0.328783, 0.1996296, -0.6213871, 0, 1, 0.1764706, 1,
-0.3282229, -0.4441659, -2.022467, 0, 1, 0.1843137, 1,
-0.3260549, -0.9324332, -2.656663, 0, 1, 0.1882353, 1,
-0.3249794, 1.076613, -0.3827453, 0, 1, 0.1960784, 1,
-0.3237565, -0.9628864, -3.919897, 0, 1, 0.2039216, 1,
-0.3234625, 0.632388, -0.7567528, 0, 1, 0.2078431, 1,
-0.3210278, 0.2066802, -0.7873329, 0, 1, 0.2156863, 1,
-0.3160354, -0.7303125, -1.743318, 0, 1, 0.2196078, 1,
-0.3140704, 0.2772121, -1.397081, 0, 1, 0.227451, 1,
-0.3135698, -0.5085008, -1.554752, 0, 1, 0.2313726, 1,
-0.3129323, 0.08216923, -1.454453, 0, 1, 0.2392157, 1,
-0.311872, -1.711313, -2.548923, 0, 1, 0.2431373, 1,
-0.310936, 0.1722743, 0.3564689, 0, 1, 0.2509804, 1,
-0.3088836, -1.724097, -3.026486, 0, 1, 0.254902, 1,
-0.3078659, -1.526321, -1.303097, 0, 1, 0.2627451, 1,
-0.3064509, 0.1495786, -1.587733, 0, 1, 0.2666667, 1,
-0.3049878, 0.1840446, -2.111813, 0, 1, 0.2745098, 1,
-0.3013592, -0.8788146, -2.490461, 0, 1, 0.2784314, 1,
-0.2967028, 1.765157, -0.3061619, 0, 1, 0.2862745, 1,
-0.2956073, -0.02649612, -1.079217, 0, 1, 0.2901961, 1,
-0.2945138, 0.6725469, -1.585935, 0, 1, 0.2980392, 1,
-0.29432, -0.5508804, -1.928469, 0, 1, 0.3058824, 1,
-0.2888494, 1.434284, -0.2983646, 0, 1, 0.3098039, 1,
-0.288738, 0.1091968, -2.49587, 0, 1, 0.3176471, 1,
-0.2829707, -2.816765, -2.629996, 0, 1, 0.3215686, 1,
-0.2779118, -0.3147752, -2.786679, 0, 1, 0.3294118, 1,
-0.2735535, 0.780087, -1.711913, 0, 1, 0.3333333, 1,
-0.2693397, 0.4025733, 0.3234245, 0, 1, 0.3411765, 1,
-0.2672164, 1.689348, 1.403237, 0, 1, 0.345098, 1,
-0.2634041, 0.4842082, -1.135533, 0, 1, 0.3529412, 1,
-0.2631785, -1.27005, -2.891711, 0, 1, 0.3568628, 1,
-0.2625259, 1.397018, 1.265962, 0, 1, 0.3647059, 1,
-0.261845, 0.565128, 0.5198211, 0, 1, 0.3686275, 1,
-0.2580776, -0.4583072, -4.121801, 0, 1, 0.3764706, 1,
-0.2578377, -0.1626577, -0.9756141, 0, 1, 0.3803922, 1,
-0.2490736, 0.1442034, -1.040609, 0, 1, 0.3882353, 1,
-0.2467724, -0.4711686, -2.041501, 0, 1, 0.3921569, 1,
-0.2457008, 0.839514, -0.7368427, 0, 1, 0.4, 1,
-0.2444586, -0.03893818, -1.980378, 0, 1, 0.4078431, 1,
-0.2394751, -0.5721134, -3.384348, 0, 1, 0.4117647, 1,
-0.2383762, -0.2861451, -2.941682, 0, 1, 0.4196078, 1,
-0.2374593, 0.1320694, -0.4621004, 0, 1, 0.4235294, 1,
-0.2372767, 0.1056906, -2.358629, 0, 1, 0.4313726, 1,
-0.2351187, -1.319184, -2.04234, 0, 1, 0.4352941, 1,
-0.233868, 1.220253, 0.6279265, 0, 1, 0.4431373, 1,
-0.2299237, -0.1424535, -2.277888, 0, 1, 0.4470588, 1,
-0.2191887, -0.1970205, -2.661872, 0, 1, 0.454902, 1,
-0.2173698, 0.8856225, 0.8160421, 0, 1, 0.4588235, 1,
-0.210824, 0.3967526, 0.1290079, 0, 1, 0.4666667, 1,
-0.2056194, -0.4099818, -1.993103, 0, 1, 0.4705882, 1,
-0.2045299, 0.8727502, -0.2273704, 0, 1, 0.4784314, 1,
-0.202855, -0.4382851, -2.556452, 0, 1, 0.4823529, 1,
-0.2023463, 1.392295, 0.3688253, 0, 1, 0.4901961, 1,
-0.2001744, 1.375856, 0.4472286, 0, 1, 0.4941176, 1,
-0.1961975, -0.3792686, -5.028681, 0, 1, 0.5019608, 1,
-0.1891258, 1.88501, 1.472016, 0, 1, 0.509804, 1,
-0.188698, 0.9611546, 0.03088879, 0, 1, 0.5137255, 1,
-0.1885221, -0.7186673, -2.166766, 0, 1, 0.5215687, 1,
-0.1884733, 0.05496549, -1.292418, 0, 1, 0.5254902, 1,
-0.1878165, 0.6056565, -0.007861867, 0, 1, 0.5333334, 1,
-0.1867341, -0.3238598, -2.187672, 0, 1, 0.5372549, 1,
-0.1814969, 0.9297662, 0.04429857, 0, 1, 0.5450981, 1,
-0.1810545, -1.980071, -3.294624, 0, 1, 0.5490196, 1,
-0.1803107, 0.07175519, -2.568692, 0, 1, 0.5568628, 1,
-0.177167, 1.301093, 0.9510964, 0, 1, 0.5607843, 1,
-0.177107, 0.2575856, -1.234617, 0, 1, 0.5686275, 1,
-0.1750152, -0.7943565, -3.612447, 0, 1, 0.572549, 1,
-0.1716833, -0.4912816, -1.944544, 0, 1, 0.5803922, 1,
-0.1716203, 1.613938, -0.4868536, 0, 1, 0.5843138, 1,
-0.1714056, -0.6791078, -3.241936, 0, 1, 0.5921569, 1,
-0.1713685, -1.440439, -4.402934, 0, 1, 0.5960785, 1,
-0.1664652, 0.781454, -0.5790023, 0, 1, 0.6039216, 1,
-0.1642223, -1.587051, -3.097477, 0, 1, 0.6117647, 1,
-0.1581308, -0.9884104, -1.604582, 0, 1, 0.6156863, 1,
-0.1525082, -0.1666854, -2.205423, 0, 1, 0.6235294, 1,
-0.1500132, -1.868022, -1.597139, 0, 1, 0.627451, 1,
-0.1451571, 1.62555, 0.2423869, 0, 1, 0.6352941, 1,
-0.1437626, -0.3800514, -2.802095, 0, 1, 0.6392157, 1,
-0.1424849, 0.7463191, -1.363171, 0, 1, 0.6470588, 1,
-0.1385935, 0.2472391, 2.480076, 0, 1, 0.6509804, 1,
-0.1383997, 0.4464627, -0.2702212, 0, 1, 0.6588235, 1,
-0.1353848, 1.371968, -0.393906, 0, 1, 0.6627451, 1,
-0.1322764, 0.1037121, 1.381594, 0, 1, 0.6705883, 1,
-0.1322686, -1.050944, -4.373103, 0, 1, 0.6745098, 1,
-0.1316533, 0.6424568, 1.064003, 0, 1, 0.682353, 1,
-0.130816, 0.850967, -2.811942, 0, 1, 0.6862745, 1,
-0.1289334, 1.433957, -1.254905, 0, 1, 0.6941177, 1,
-0.1234721, -0.4657195, -1.139532, 0, 1, 0.7019608, 1,
-0.1134105, -0.3134228, -3.235884, 0, 1, 0.7058824, 1,
-0.1133565, -0.1236896, -2.153591, 0, 1, 0.7137255, 1,
-0.1127634, -0.0314713, -0.4095959, 0, 1, 0.7176471, 1,
-0.111048, 1.374786, 0.1420382, 0, 1, 0.7254902, 1,
-0.1087908, 0.2855467, 0.6655061, 0, 1, 0.7294118, 1,
-0.1083448, -1.587077, -3.737866, 0, 1, 0.7372549, 1,
-0.1075902, -0.393853, -3.04495, 0, 1, 0.7411765, 1,
-0.1056364, 1.046266, 0.5335804, 0, 1, 0.7490196, 1,
-0.1028264, 2.038915, -0.5659422, 0, 1, 0.7529412, 1,
-0.09794178, 0.3034427, -1.872954, 0, 1, 0.7607843, 1,
-0.09730019, -0.3194302, -1.813402, 0, 1, 0.7647059, 1,
-0.09520496, 0.001526237, -3.114598, 0, 1, 0.772549, 1,
-0.08772253, -0.6001685, -2.618183, 0, 1, 0.7764706, 1,
-0.08667713, 1.037598, -1.493593, 0, 1, 0.7843137, 1,
-0.08595636, -0.2354432, -2.827572, 0, 1, 0.7882353, 1,
-0.08186016, -1.054623, -2.835983, 0, 1, 0.7960784, 1,
-0.08074655, 0.925516, -0.3552348, 0, 1, 0.8039216, 1,
-0.08055998, -0.7504637, -3.143016, 0, 1, 0.8078431, 1,
-0.07634971, 0.9178791, 1.037889, 0, 1, 0.8156863, 1,
-0.07355974, -1.040426, -3.911981, 0, 1, 0.8196079, 1,
-0.0688042, -0.4274287, -4.589614, 0, 1, 0.827451, 1,
-0.06769603, 0.4040223, 0.542845, 0, 1, 0.8313726, 1,
-0.06711885, 0.6398764, -0.2763298, 0, 1, 0.8392157, 1,
-0.06560305, -1.66304, -2.28883, 0, 1, 0.8431373, 1,
-0.05902781, 0.3922618, -0.05373269, 0, 1, 0.8509804, 1,
-0.05673413, 1.200936, -0.9577754, 0, 1, 0.854902, 1,
-0.05572649, 0.7780793, 0.6166056, 0, 1, 0.8627451, 1,
-0.05490837, -0.2456686, -1.775237, 0, 1, 0.8666667, 1,
-0.05391874, -0.3145359, -3.072773, 0, 1, 0.8745098, 1,
-0.05091249, -1.63689, -0.3234199, 0, 1, 0.8784314, 1,
-0.04069937, 1.061258, -0.9022743, 0, 1, 0.8862745, 1,
-0.03921449, -1.088835, -2.331071, 0, 1, 0.8901961, 1,
-0.03633497, -1.020741, -1.279681, 0, 1, 0.8980392, 1,
-0.02969158, 2.545287, -0.669333, 0, 1, 0.9058824, 1,
-0.02947926, 1.392041, -1.292235, 0, 1, 0.9098039, 1,
-0.02792696, 0.9711897, -0.4125131, 0, 1, 0.9176471, 1,
-0.02229498, -0.2611339, -0.8480669, 0, 1, 0.9215686, 1,
-0.02108192, -0.9601198, -3.529428, 0, 1, 0.9294118, 1,
-0.02012344, 1.490982, -0.2657092, 0, 1, 0.9333333, 1,
-0.01686906, -0.6983546, -3.614818, 0, 1, 0.9411765, 1,
-0.01325005, 0.1096431, -0.31995, 0, 1, 0.945098, 1,
-0.007867672, 1.881521, -0.225509, 0, 1, 0.9529412, 1,
0.0007303084, 0.2580296, -1.098791, 0, 1, 0.9568627, 1,
0.002093225, 1.2508, -0.8002993, 0, 1, 0.9647059, 1,
0.004898741, -1.083818, 4.076453, 0, 1, 0.9686275, 1,
0.008454857, 1.129837, -0.4746901, 0, 1, 0.9764706, 1,
0.008616788, -0.8826681, 3.115778, 0, 1, 0.9803922, 1,
0.009990431, 0.3607033, 0.2348276, 0, 1, 0.9882353, 1,
0.0114137, 0.3725214, 0.6535011, 0, 1, 0.9921569, 1,
0.02207777, -0.678273, 0.9663572, 0, 1, 1, 1,
0.03032864, 0.1256989, 0.4271445, 0, 0.9921569, 1, 1,
0.03212993, 0.1859145, -0.3087896, 0, 0.9882353, 1, 1,
0.03783315, -1.020315, 2.41559, 0, 0.9803922, 1, 1,
0.04319309, -0.7099445, 3.313874, 0, 0.9764706, 1, 1,
0.04384659, 0.5659214, -0.411055, 0, 0.9686275, 1, 1,
0.04454779, 1.460259, -1.131302, 0, 0.9647059, 1, 1,
0.04578551, 0.3818526, -1.473184, 0, 0.9568627, 1, 1,
0.04738325, -0.3203711, 3.217262, 0, 0.9529412, 1, 1,
0.0579837, 1.176988, -0.1836013, 0, 0.945098, 1, 1,
0.06586976, -0.8881903, 3.272136, 0, 0.9411765, 1, 1,
0.06871502, 1.069911, 1.291679, 0, 0.9333333, 1, 1,
0.07051385, -1.092852, 3.648402, 0, 0.9294118, 1, 1,
0.07123794, 0.2837517, 1.276599, 0, 0.9215686, 1, 1,
0.07131224, 0.4578132, -1.227351, 0, 0.9176471, 1, 1,
0.0739136, 0.8161936, -0.5928439, 0, 0.9098039, 1, 1,
0.07483739, -0.8601745, 1.853722, 0, 0.9058824, 1, 1,
0.07691715, 0.8856508, -0.6415492, 0, 0.8980392, 1, 1,
0.07882807, -0.40298, 2.546178, 0, 0.8901961, 1, 1,
0.08570597, -0.3989162, 2.48761, 0, 0.8862745, 1, 1,
0.09106886, 2.105462, -0.07408313, 0, 0.8784314, 1, 1,
0.09151872, -0.5478134, 3.313044, 0, 0.8745098, 1, 1,
0.09576809, 0.1282291, -0.2646044, 0, 0.8666667, 1, 1,
0.09761579, -0.2538486, 2.516557, 0, 0.8627451, 1, 1,
0.09782214, -2.11971, 2.615074, 0, 0.854902, 1, 1,
0.1017871, 0.737775, -0.1011074, 0, 0.8509804, 1, 1,
0.1045768, 0.9153581, -0.3803127, 0, 0.8431373, 1, 1,
0.1056471, 0.2631157, 1.371098, 0, 0.8392157, 1, 1,
0.1057539, 0.2238226, -0.4870385, 0, 0.8313726, 1, 1,
0.108315, 0.3742606, 3.543569, 0, 0.827451, 1, 1,
0.1171925, 1.088135, -0.314953, 0, 0.8196079, 1, 1,
0.1250695, 0.309498, -0.8208426, 0, 0.8156863, 1, 1,
0.1254492, 0.1788722, -0.208593, 0, 0.8078431, 1, 1,
0.127352, 2.140113, 0.2029401, 0, 0.8039216, 1, 1,
0.1291955, -0.02349826, 3.350821, 0, 0.7960784, 1, 1,
0.1294855, 0.5933017, -0.04308604, 0, 0.7882353, 1, 1,
0.131768, 1.164516, -0.9818325, 0, 0.7843137, 1, 1,
0.1320097, -0.3391222, 3.336695, 0, 0.7764706, 1, 1,
0.132668, 0.2365555, 2.782689, 0, 0.772549, 1, 1,
0.132686, -1.733848, 2.735619, 0, 0.7647059, 1, 1,
0.1327007, 0.4383992, 0.1250196, 0, 0.7607843, 1, 1,
0.1399794, -1.32417, 1.608889, 0, 0.7529412, 1, 1,
0.1420129, -0.1006826, 1.722048, 0, 0.7490196, 1, 1,
0.1475092, -1.274592, 4.757533, 0, 0.7411765, 1, 1,
0.1475702, 0.401215, 1.755851, 0, 0.7372549, 1, 1,
0.1487297, -0.7589958, 2.310089, 0, 0.7294118, 1, 1,
0.150722, -1.746397, 3.445936, 0, 0.7254902, 1, 1,
0.1509462, 0.9376338, 0.07113922, 0, 0.7176471, 1, 1,
0.1538754, -1.607814, 3.819249, 0, 0.7137255, 1, 1,
0.1566656, 0.4472842, 1.884014, 0, 0.7058824, 1, 1,
0.1579777, -1.257813, 4.336502, 0, 0.6980392, 1, 1,
0.1584804, -0.1939929, 0.2188315, 0, 0.6941177, 1, 1,
0.160026, 0.3394928, 2.085803, 0, 0.6862745, 1, 1,
0.1618504, 0.3918351, 0.4325006, 0, 0.682353, 1, 1,
0.1632867, -0.6438984, 3.490642, 0, 0.6745098, 1, 1,
0.1639274, 0.02658728, 2.311357, 0, 0.6705883, 1, 1,
0.1642438, 0.8588519, 2.191627, 0, 0.6627451, 1, 1,
0.1649285, -0.9309208, 4.17219, 0, 0.6588235, 1, 1,
0.1662861, 0.9732683, -0.8202723, 0, 0.6509804, 1, 1,
0.1664004, -0.9123341, 2.595512, 0, 0.6470588, 1, 1,
0.1689768, -0.07224675, 4.041463, 0, 0.6392157, 1, 1,
0.1694908, 0.8611825, 2.676097, 0, 0.6352941, 1, 1,
0.1713614, -0.6576112, 4.663426, 0, 0.627451, 1, 1,
0.1731538, 1.687809, 0.6914409, 0, 0.6235294, 1, 1,
0.1733884, 1.527258, -1.411598, 0, 0.6156863, 1, 1,
0.173584, 0.04658969, 0.3074098, 0, 0.6117647, 1, 1,
0.174168, 0.1596748, -0.9625449, 0, 0.6039216, 1, 1,
0.1744593, -0.3715716, 4.648631, 0, 0.5960785, 1, 1,
0.1761952, -2.659604, 2.75036, 0, 0.5921569, 1, 1,
0.1776814, 1.010852, 0.2716356, 0, 0.5843138, 1, 1,
0.1800445, -0.6926862, 2.224564, 0, 0.5803922, 1, 1,
0.1804142, 0.643155, -0.3140718, 0, 0.572549, 1, 1,
0.1837491, -0.2704737, 2.127948, 0, 0.5686275, 1, 1,
0.1871476, 0.6459362, 0.4394557, 0, 0.5607843, 1, 1,
0.1874825, 0.389719, 1.301712, 0, 0.5568628, 1, 1,
0.1899484, -0.9418808, 2.932901, 0, 0.5490196, 1, 1,
0.1915282, 1.237706, 0.4605029, 0, 0.5450981, 1, 1,
0.1969105, -0.2514264, 3.38727, 0, 0.5372549, 1, 1,
0.1974203, -1.019185, 2.856525, 0, 0.5333334, 1, 1,
0.2049018, 0.2892591, 1.300271, 0, 0.5254902, 1, 1,
0.2056779, -1.075326, 3.027026, 0, 0.5215687, 1, 1,
0.2093363, -0.4311209, 3.179415, 0, 0.5137255, 1, 1,
0.2099242, 1.066621, -0.4669779, 0, 0.509804, 1, 1,
0.2123019, 0.9594653, -2.075719, 0, 0.5019608, 1, 1,
0.2212944, -2.124892, 4.637857, 0, 0.4941176, 1, 1,
0.223521, -1.28407, 5.349924, 0, 0.4901961, 1, 1,
0.2252874, -3.056339, 3.480288, 0, 0.4823529, 1, 1,
0.2314899, -0.2568679, 3.086186, 0, 0.4784314, 1, 1,
0.2335654, 0.8973646, -0.6999318, 0, 0.4705882, 1, 1,
0.2355649, 1.207384, -0.6166412, 0, 0.4666667, 1, 1,
0.2357322, -0.6251148, 4.431357, 0, 0.4588235, 1, 1,
0.2396879, 0.9334335, -1.669717, 0, 0.454902, 1, 1,
0.2408907, -0.7964194, 2.917828, 0, 0.4470588, 1, 1,
0.2469581, -1.371042, 4.859253, 0, 0.4431373, 1, 1,
0.2525175, 0.8406366, 1.602213, 0, 0.4352941, 1, 1,
0.255529, 0.6387357, -1.632692, 0, 0.4313726, 1, 1,
0.2563777, -0.3746104, 1.820817, 0, 0.4235294, 1, 1,
0.2576455, -1.767662, 3.479024, 0, 0.4196078, 1, 1,
0.265005, 0.07322089, 1.568052, 0, 0.4117647, 1, 1,
0.2731215, -1.620039, 4.979931, 0, 0.4078431, 1, 1,
0.2743197, -0.9734382, 0.9213949, 0, 0.4, 1, 1,
0.2756966, -0.1529218, 2.104496, 0, 0.3921569, 1, 1,
0.2767412, 1.109014, -0.6476494, 0, 0.3882353, 1, 1,
0.2767717, -0.2693379, 3.100155, 0, 0.3803922, 1, 1,
0.27699, 0.8412591, 0.6762781, 0, 0.3764706, 1, 1,
0.2824487, 0.574478, 0.3656374, 0, 0.3686275, 1, 1,
0.2830826, -1.409035, 5.563582, 0, 0.3647059, 1, 1,
0.2840403, 0.2394153, 1.195976, 0, 0.3568628, 1, 1,
0.2843499, -0.03086363, 2.546622, 0, 0.3529412, 1, 1,
0.2851188, -2.052555, 1.707727, 0, 0.345098, 1, 1,
0.285674, 1.198384, -0.6868073, 0, 0.3411765, 1, 1,
0.2859794, 0.6373085, 1.148897, 0, 0.3333333, 1, 1,
0.2871659, 0.107176, 2.150564, 0, 0.3294118, 1, 1,
0.2900206, 0.1249362, 0.287836, 0, 0.3215686, 1, 1,
0.2954966, -1.18914, 4.514833, 0, 0.3176471, 1, 1,
0.2960209, 1.161625, 1.972096, 0, 0.3098039, 1, 1,
0.2968311, -0.3575915, 2.406111, 0, 0.3058824, 1, 1,
0.3008206, 1.033694, 0.3218391, 0, 0.2980392, 1, 1,
0.3040242, 1.682947, -0.5840772, 0, 0.2901961, 1, 1,
0.3040922, -0.6201411, 2.264711, 0, 0.2862745, 1, 1,
0.306588, -0.9625792, 2.655441, 0, 0.2784314, 1, 1,
0.3094653, 1.281882, 1.03056, 0, 0.2745098, 1, 1,
0.3097042, -0.1274011, 1.430672, 0, 0.2666667, 1, 1,
0.309905, 0.937589, 0.8414125, 0, 0.2627451, 1, 1,
0.3118488, 0.2031585, 0.3406641, 0, 0.254902, 1, 1,
0.3154587, -0.4953435, 3.751814, 0, 0.2509804, 1, 1,
0.3165065, 0.3462039, 1.964976, 0, 0.2431373, 1, 1,
0.3206134, 1.418381, 0.7728926, 0, 0.2392157, 1, 1,
0.3215982, 0.5324199, -0.4556448, 0, 0.2313726, 1, 1,
0.3305478, -0.6182021, 1.061613, 0, 0.227451, 1, 1,
0.333014, -0.3882308, 3.786738, 0, 0.2196078, 1, 1,
0.3390265, -0.3594973, 1.957167, 0, 0.2156863, 1, 1,
0.340162, -0.8756317, 3.237822, 0, 0.2078431, 1, 1,
0.3407472, -0.1863123, 2.898632, 0, 0.2039216, 1, 1,
0.344116, -0.4489375, 2.848962, 0, 0.1960784, 1, 1,
0.349965, 0.5111707, 1.232262, 0, 0.1882353, 1, 1,
0.3511175, -3.656848, 3.142184, 0, 0.1843137, 1, 1,
0.3561097, -0.9496999, 4.300967, 0, 0.1764706, 1, 1,
0.3584154, -0.05176221, -0.5215714, 0, 0.172549, 1, 1,
0.3595026, 1.200778, 1.652595, 0, 0.1647059, 1, 1,
0.3595969, -0.5959908, 3.267424, 0, 0.1607843, 1, 1,
0.3606091, 0.7632679, 1.240606, 0, 0.1529412, 1, 1,
0.3616114, -0.1573728, 3.651028, 0, 0.1490196, 1, 1,
0.3629324, 0.2074046, -0.5775885, 0, 0.1411765, 1, 1,
0.3675665, -1.008733, 3.460897, 0, 0.1372549, 1, 1,
0.3677811, -1.057135, 2.657863, 0, 0.1294118, 1, 1,
0.3687551, 1.382018, 1.05841, 0, 0.1254902, 1, 1,
0.3698202, 2.025755, 0.7657987, 0, 0.1176471, 1, 1,
0.3711296, -0.2910801, 2.60222, 0, 0.1137255, 1, 1,
0.3712279, -1.626528, 1.725699, 0, 0.1058824, 1, 1,
0.3790565, -1.007687, 3.008506, 0, 0.09803922, 1, 1,
0.3873165, -0.3772712, 3.129619, 0, 0.09411765, 1, 1,
0.3905841, -0.4878574, 1.323503, 0, 0.08627451, 1, 1,
0.3908732, -1.145237, 1.681481, 0, 0.08235294, 1, 1,
0.3949296, 2.284757, 1.258488, 0, 0.07450981, 1, 1,
0.3978334, -0.8751696, 3.685448, 0, 0.07058824, 1, 1,
0.3979247, 0.007876782, 1.019429, 0, 0.0627451, 1, 1,
0.3984281, -0.5370488, 3.102369, 0, 0.05882353, 1, 1,
0.4048675, -0.02209654, 3.006178, 0, 0.05098039, 1, 1,
0.4091015, -0.5769615, 2.510264, 0, 0.04705882, 1, 1,
0.4115363, -1.013999, 3.276119, 0, 0.03921569, 1, 1,
0.4122365, 0.09185776, 2.462938, 0, 0.03529412, 1, 1,
0.4152516, -0.7224517, 2.226125, 0, 0.02745098, 1, 1,
0.4157061, -0.5121961, 1.726259, 0, 0.02352941, 1, 1,
0.4181098, -0.4279388, 3.177231, 0, 0.01568628, 1, 1,
0.4206418, 0.8226886, -1.160547, 0, 0.01176471, 1, 1,
0.4296021, 0.6572702, 0.3634959, 0, 0.003921569, 1, 1,
0.4309364, -1.32003, 1.16104, 0.003921569, 0, 1, 1,
0.4309775, 1.610315, 0.175438, 0.007843138, 0, 1, 1,
0.4309931, 0.4455176, 3.044251, 0.01568628, 0, 1, 1,
0.4346071, 1.119523, 0.08177339, 0.01960784, 0, 1, 1,
0.4380811, -1.01745, 2.239017, 0.02745098, 0, 1, 1,
0.4474916, 0.006023183, 0.7304249, 0.03137255, 0, 1, 1,
0.4513986, -2.066181, 2.473181, 0.03921569, 0, 1, 1,
0.4597176, -0.5964906, 3.790818, 0.04313726, 0, 1, 1,
0.4608193, 0.3719668, 0.6699792, 0.05098039, 0, 1, 1,
0.4644165, 0.6711091, 0.4176404, 0.05490196, 0, 1, 1,
0.473344, -0.8573556, 2.676651, 0.0627451, 0, 1, 1,
0.4733661, -0.9458474, 3.503285, 0.06666667, 0, 1, 1,
0.4750157, 0.5820516, 0.1108629, 0.07450981, 0, 1, 1,
0.4755709, -0.4310684, 2.586004, 0.07843138, 0, 1, 1,
0.4763187, -0.3554002, 2.39835, 0.08627451, 0, 1, 1,
0.4770069, -1.079821, 0.9420472, 0.09019608, 0, 1, 1,
0.4774896, -0.08321245, 1.892704, 0.09803922, 0, 1, 1,
0.4803395, 0.03890919, -0.4789993, 0.1058824, 0, 1, 1,
0.490467, 1.200894, -0.7376616, 0.1098039, 0, 1, 1,
0.490792, -0.5696021, 1.85713, 0.1176471, 0, 1, 1,
0.4934231, -0.4121444, 2.28628, 0.1215686, 0, 1, 1,
0.4961248, -0.8941412, 4.514822, 0.1294118, 0, 1, 1,
0.4993145, -0.4422983, 0.4150741, 0.1333333, 0, 1, 1,
0.5010176, -0.4297251, 2.957035, 0.1411765, 0, 1, 1,
0.5023747, -0.2518878, 4.229539, 0.145098, 0, 1, 1,
0.5027574, 0.5485561, 2.524395, 0.1529412, 0, 1, 1,
0.5061741, 0.8336833, 0.2842183, 0.1568628, 0, 1, 1,
0.5165139, -0.6657404, 2.338017, 0.1647059, 0, 1, 1,
0.5189419, -0.5195922, 3.407673, 0.1686275, 0, 1, 1,
0.520413, 1.176093, 0.6702532, 0.1764706, 0, 1, 1,
0.5210431, 0.1542579, 2.100032, 0.1803922, 0, 1, 1,
0.5250101, -0.02336328, -0.2276013, 0.1882353, 0, 1, 1,
0.5253586, 1.293444, 0.6041352, 0.1921569, 0, 1, 1,
0.5265102, 0.01238304, 2.65975, 0.2, 0, 1, 1,
0.5315018, 0.1324348, 4.078658, 0.2078431, 0, 1, 1,
0.5351219, 1.281511, -0.2094415, 0.2117647, 0, 1, 1,
0.5407514, 1.284125, -0.08261442, 0.2196078, 0, 1, 1,
0.5440233, 0.6134492, 1.480493, 0.2235294, 0, 1, 1,
0.5440243, -0.3331793, 3.28732, 0.2313726, 0, 1, 1,
0.5452468, 0.2638795, 1.555475, 0.2352941, 0, 1, 1,
0.5481303, 0.8268247, -0.29085, 0.2431373, 0, 1, 1,
0.548482, -1.054935, 2.113254, 0.2470588, 0, 1, 1,
0.5502185, 0.2718966, 1.725883, 0.254902, 0, 1, 1,
0.5553975, 0.008782523, 1.308085, 0.2588235, 0, 1, 1,
0.5597327, 0.004920991, 1.667585, 0.2666667, 0, 1, 1,
0.5632559, 0.3492611, -0.06553239, 0.2705882, 0, 1, 1,
0.5634241, 0.4543222, 0.9926943, 0.2784314, 0, 1, 1,
0.5665863, -0.2659544, 2.923248, 0.282353, 0, 1, 1,
0.5671675, 0.8719509, 2.220678, 0.2901961, 0, 1, 1,
0.5693789, 1.651825, 1.389649, 0.2941177, 0, 1, 1,
0.5709913, -1.417883, 2.057692, 0.3019608, 0, 1, 1,
0.5723364, 0.9600213, -1.624257, 0.3098039, 0, 1, 1,
0.5730087, -1.097161, 2.168779, 0.3137255, 0, 1, 1,
0.5795734, 1.455697, 0.1644654, 0.3215686, 0, 1, 1,
0.5854052, 0.5589463, 1.431948, 0.3254902, 0, 1, 1,
0.5866277, -0.9114304, 5.052337, 0.3333333, 0, 1, 1,
0.5879065, -2.153652, 3.942134, 0.3372549, 0, 1, 1,
0.5992524, -0.5937631, 3.102355, 0.345098, 0, 1, 1,
0.6082315, 1.131563, 0.8742065, 0.3490196, 0, 1, 1,
0.6133564, -1.154248, 2.428954, 0.3568628, 0, 1, 1,
0.6140637, -1.245953, 1.662864, 0.3607843, 0, 1, 1,
0.6143718, -0.09981398, 2.296562, 0.3686275, 0, 1, 1,
0.6148652, -0.3396297, 1.931186, 0.372549, 0, 1, 1,
0.6187592, -0.1339453, 2.275662, 0.3803922, 0, 1, 1,
0.6202493, 1.015664, 1.438333, 0.3843137, 0, 1, 1,
0.6244956, -0.1621516, 1.13794, 0.3921569, 0, 1, 1,
0.6274759, -0.6211506, 0.8793804, 0.3960784, 0, 1, 1,
0.6300352, 0.6894343, 2.042525, 0.4039216, 0, 1, 1,
0.6318551, 1.307097, -0.3266154, 0.4117647, 0, 1, 1,
0.6401181, -1.881636, 1.686421, 0.4156863, 0, 1, 1,
0.6509685, -0.6690815, 1.666082, 0.4235294, 0, 1, 1,
0.6511395, -0.7442126, 3.205218, 0.427451, 0, 1, 1,
0.6536113, -0.7531003, 2.636756, 0.4352941, 0, 1, 1,
0.6575918, 0.04938778, 2.346475, 0.4392157, 0, 1, 1,
0.6694381, -2.228164, 1.568038, 0.4470588, 0, 1, 1,
0.6707979, -0.04153373, 2.707423, 0.4509804, 0, 1, 1,
0.6750053, -0.3888296, 0.4125591, 0.4588235, 0, 1, 1,
0.6764106, -0.5127819, 1.543798, 0.4627451, 0, 1, 1,
0.6792355, -0.8705233, 2.123976, 0.4705882, 0, 1, 1,
0.6796572, -0.318504, 0.8352442, 0.4745098, 0, 1, 1,
0.6800227, 0.4225003, 2.496087, 0.4823529, 0, 1, 1,
0.6836607, 1.305315, 0.3966315, 0.4862745, 0, 1, 1,
0.6866425, 1.618713, 1.423549, 0.4941176, 0, 1, 1,
0.6888745, -0.2672637, 2.746274, 0.5019608, 0, 1, 1,
0.6938967, 0.2065274, 2.304888, 0.5058824, 0, 1, 1,
0.6942065, -1.016933, 3.128552, 0.5137255, 0, 1, 1,
0.6983927, -1.352712, 3.524668, 0.5176471, 0, 1, 1,
0.6989675, -1.777364, 2.144773, 0.5254902, 0, 1, 1,
0.7011461, -1.168597, 2.906975, 0.5294118, 0, 1, 1,
0.7046714, -0.01832288, 0.7324464, 0.5372549, 0, 1, 1,
0.7047217, -0.294659, 1.550305, 0.5411765, 0, 1, 1,
0.7062907, 0.2505153, 1.782184, 0.5490196, 0, 1, 1,
0.7068083, -1.165238, 0.8548869, 0.5529412, 0, 1, 1,
0.7076488, -1.217723, 3.859465, 0.5607843, 0, 1, 1,
0.7102384, 0.767728, 1.908638, 0.5647059, 0, 1, 1,
0.7151532, 0.02550196, 1.967433, 0.572549, 0, 1, 1,
0.7230141, 0.8616742, -0.9637047, 0.5764706, 0, 1, 1,
0.7342254, -1.611997, 1.952855, 0.5843138, 0, 1, 1,
0.7427823, -3.20253, 4.128439, 0.5882353, 0, 1, 1,
0.7445042, 2.240553, 1.463973, 0.5960785, 0, 1, 1,
0.7465076, 0.4188617, 1.860036, 0.6039216, 0, 1, 1,
0.7503138, -0.1045932, 3.54358, 0.6078432, 0, 1, 1,
0.752388, 0.6431282, 0.4981351, 0.6156863, 0, 1, 1,
0.7524348, -0.4147649, 2.600303, 0.6196079, 0, 1, 1,
0.7525673, 1.058085, 1.0005, 0.627451, 0, 1, 1,
0.7597523, -0.380201, 2.069859, 0.6313726, 0, 1, 1,
0.7693855, -0.02707694, 1.376693, 0.6392157, 0, 1, 1,
0.769917, -0.7923729, 1.813599, 0.6431373, 0, 1, 1,
0.7721253, 1.571074, 0.7129838, 0.6509804, 0, 1, 1,
0.7731149, 0.2007883, 2.427469, 0.654902, 0, 1, 1,
0.7751184, 0.2024743, 0.479978, 0.6627451, 0, 1, 1,
0.7794044, -0.1001981, 1.139791, 0.6666667, 0, 1, 1,
0.7832578, 0.133576, 1.598165, 0.6745098, 0, 1, 1,
0.7847944, 0.2697566, 3.052173, 0.6784314, 0, 1, 1,
0.7889916, 0.4924549, 0.3953377, 0.6862745, 0, 1, 1,
0.8004982, 1.477213, 1.317858, 0.6901961, 0, 1, 1,
0.8019535, -1.745946, 3.433237, 0.6980392, 0, 1, 1,
0.8022381, 0.5947691, 2.878096, 0.7058824, 0, 1, 1,
0.8084669, -0.03848029, 1.749365, 0.7098039, 0, 1, 1,
0.8156393, -0.3585441, 0.624859, 0.7176471, 0, 1, 1,
0.815824, -3.348803, 2.791897, 0.7215686, 0, 1, 1,
0.8171421, 1.13606, 0.907218, 0.7294118, 0, 1, 1,
0.8181848, -1.534417, 4.414183, 0.7333333, 0, 1, 1,
0.8200379, 0.2501628, 0.2304406, 0.7411765, 0, 1, 1,
0.8225428, -0.645753, 1.904568, 0.7450981, 0, 1, 1,
0.8246798, -0.2974424, 3.164174, 0.7529412, 0, 1, 1,
0.8265497, -0.5055491, 1.769635, 0.7568628, 0, 1, 1,
0.8338472, -0.1879716, 1.589149, 0.7647059, 0, 1, 1,
0.8343645, -0.7804851, 2.14781, 0.7686275, 0, 1, 1,
0.8351819, -1.270054, 0.1452761, 0.7764706, 0, 1, 1,
0.8384851, 1.120779, 1.07889, 0.7803922, 0, 1, 1,
0.8392863, 0.6461679, 2.476017, 0.7882353, 0, 1, 1,
0.8396503, 0.5734805, 0.3577486, 0.7921569, 0, 1, 1,
0.8398496, 0.1081606, 0.6629828, 0.8, 0, 1, 1,
0.841465, 0.02154656, 1.878536, 0.8078431, 0, 1, 1,
0.8453752, -0.294654, 3.77668, 0.8117647, 0, 1, 1,
0.8480973, 1.01173, 0.07281218, 0.8196079, 0, 1, 1,
0.8506368, 2.182594, 1.437261, 0.8235294, 0, 1, 1,
0.8582551, 0.7266931, 0.134628, 0.8313726, 0, 1, 1,
0.8590642, 1.62371, 0.5532265, 0.8352941, 0, 1, 1,
0.8618472, -0.5914949, 1.370138, 0.8431373, 0, 1, 1,
0.8673891, -0.7176728, 2.575136, 0.8470588, 0, 1, 1,
0.870209, -0.4475667, 2.471593, 0.854902, 0, 1, 1,
0.874017, 0.8532033, 0.6445359, 0.8588235, 0, 1, 1,
0.8822708, -0.5283528, 1.368402, 0.8666667, 0, 1, 1,
0.8840855, -1.832397, 2.24246, 0.8705882, 0, 1, 1,
0.8842214, -0.4678812, 0.9097039, 0.8784314, 0, 1, 1,
0.8900925, -0.9038969, 2.24506, 0.8823529, 0, 1, 1,
0.8905561, -1.060541, 3.144816, 0.8901961, 0, 1, 1,
0.8933741, -0.2573762, 2.384237, 0.8941177, 0, 1, 1,
0.8937507, -2.145001, 2.655423, 0.9019608, 0, 1, 1,
0.8943371, 1.139156, -0.1151301, 0.9098039, 0, 1, 1,
0.8988422, -0.477058, 2.524254, 0.9137255, 0, 1, 1,
0.8993871, 0.8453612, 1.312971, 0.9215686, 0, 1, 1,
0.9019328, 0.2050574, 0.9401324, 0.9254902, 0, 1, 1,
0.9027789, 0.4754587, -1.756854, 0.9333333, 0, 1, 1,
0.9111326, -1.554157, 2.046027, 0.9372549, 0, 1, 1,
0.9113204, -0.1315245, 2.485828, 0.945098, 0, 1, 1,
0.9123584, -0.2666816, 3.823819, 0.9490196, 0, 1, 1,
0.9139349, 0.5755351, -0.1770151, 0.9568627, 0, 1, 1,
0.91637, -0.1707264, 1.320499, 0.9607843, 0, 1, 1,
0.918491, -0.004862384, 0.02743074, 0.9686275, 0, 1, 1,
0.9201498, -0.4379402, 2.600789, 0.972549, 0, 1, 1,
0.9307897, 2.33319, 0.1813227, 0.9803922, 0, 1, 1,
0.9328834, 0.7356877, 0.1902814, 0.9843137, 0, 1, 1,
0.934164, -0.384774, 2.403391, 0.9921569, 0, 1, 1,
0.9476268, -1.049377, 2.120187, 0.9960784, 0, 1, 1,
0.9478709, 1.025852, -0.01250759, 1, 0, 0.9960784, 1,
0.9506488, -0.1919135, 1.420235, 1, 0, 0.9882353, 1,
0.9604149, 0.5687786, 0.7616913, 1, 0, 0.9843137, 1,
0.9692049, -0.1773435, 3.142481, 1, 0, 0.9764706, 1,
0.9785442, -0.2039634, 2.136395, 1, 0, 0.972549, 1,
0.9788838, -0.4121034, 3.025475, 1, 0, 0.9647059, 1,
0.983353, -1.462231, 0.515865, 1, 0, 0.9607843, 1,
0.9866341, -0.4349928, 1.668456, 1, 0, 0.9529412, 1,
0.9928538, 0.3021073, 0.5330895, 1, 0, 0.9490196, 1,
0.9993657, -0.1942626, 2.787095, 1, 0, 0.9411765, 1,
1.001334, 0.9028148, 1.036662, 1, 0, 0.9372549, 1,
1.004994, -0.4771142, 2.127163, 1, 0, 0.9294118, 1,
1.009653, 0.0550212, 2.854506, 1, 0, 0.9254902, 1,
1.033165, -0.3588371, 0.6473125, 1, 0, 0.9176471, 1,
1.034906, -0.05527028, -1.324003, 1, 0, 0.9137255, 1,
1.042082, 0.5933831, 0.2630593, 1, 0, 0.9058824, 1,
1.047677, 0.175093, 1.788844, 1, 0, 0.9019608, 1,
1.049233, -1.084618, 1.436767, 1, 0, 0.8941177, 1,
1.053457, 0.2761293, 0.2717921, 1, 0, 0.8862745, 1,
1.061175, -0.05047007, 0.9900586, 1, 0, 0.8823529, 1,
1.063798, -0.3638099, 1.849463, 1, 0, 0.8745098, 1,
1.063853, -0.4050641, 1.084399, 1, 0, 0.8705882, 1,
1.06711, 0.1922216, 1.507974, 1, 0, 0.8627451, 1,
1.067273, -0.7012486, 1.296569, 1, 0, 0.8588235, 1,
1.081306, -1.301961, 1.225455, 1, 0, 0.8509804, 1,
1.093925, -0.9236899, 1.056726, 1, 0, 0.8470588, 1,
1.102439, -0.2605784, 1.349728, 1, 0, 0.8392157, 1,
1.104291, 0.3499726, 1.546276, 1, 0, 0.8352941, 1,
1.105938, 1.535374, 1.249859, 1, 0, 0.827451, 1,
1.108066, -0.6852047, 2.831825, 1, 0, 0.8235294, 1,
1.108955, 0.3088454, 1.930864, 1, 0, 0.8156863, 1,
1.127421, -1.696329, 2.719967, 1, 0, 0.8117647, 1,
1.128607, -0.6538159, 1.096357, 1, 0, 0.8039216, 1,
1.132311, -1.763702, 2.221229, 1, 0, 0.7960784, 1,
1.135094, -0.6880002, 1.862316, 1, 0, 0.7921569, 1,
1.152568, -0.4553595, 1.534353, 1, 0, 0.7843137, 1,
1.153891, 0.8071415, 1.595274, 1, 0, 0.7803922, 1,
1.156645, -1.439742, 1.232822, 1, 0, 0.772549, 1,
1.168504, 0.9796934, 1.346249, 1, 0, 0.7686275, 1,
1.175089, 1.521208, -0.2536775, 1, 0, 0.7607843, 1,
1.176473, 1.060985, 0.9169651, 1, 0, 0.7568628, 1,
1.179719, 1.102588, 0.2674525, 1, 0, 0.7490196, 1,
1.181472, 0.08387011, -0.7014496, 1, 0, 0.7450981, 1,
1.183466, -0.8390442, 4.32083, 1, 0, 0.7372549, 1,
1.187938, -0.7417942, 1.730735, 1, 0, 0.7333333, 1,
1.190007, -0.3640051, 0.7634863, 1, 0, 0.7254902, 1,
1.191405, -1.334926, 3.506915, 1, 0, 0.7215686, 1,
1.194408, -0.560536, 3.906152, 1, 0, 0.7137255, 1,
1.196091, -1.606037, 2.00496, 1, 0, 0.7098039, 1,
1.212298, -0.2152513, 0.4522612, 1, 0, 0.7019608, 1,
1.212783, 1.732999, 0.4783974, 1, 0, 0.6941177, 1,
1.229877, -0.03991371, 3.796708, 1, 0, 0.6901961, 1,
1.23067, 0.5077688, 2.118322, 1, 0, 0.682353, 1,
1.237591, -0.5688417, 2.801962, 1, 0, 0.6784314, 1,
1.250956, 1.07149, 1.971275, 1, 0, 0.6705883, 1,
1.260657, -0.8251708, 0.9013042, 1, 0, 0.6666667, 1,
1.265206, -0.1358475, 1.44847, 1, 0, 0.6588235, 1,
1.272388, 0.4216249, -1.052227, 1, 0, 0.654902, 1,
1.273558, -0.1667718, 1.597626, 1, 0, 0.6470588, 1,
1.276539, 0.08617637, 1.919265, 1, 0, 0.6431373, 1,
1.281453, -1.033597, 2.816876, 1, 0, 0.6352941, 1,
1.290829, 0.7519873, 1.141904, 1, 0, 0.6313726, 1,
1.291032, 0.3276776, 0.2816939, 1, 0, 0.6235294, 1,
1.293162, 0.2636785, 2.915647, 1, 0, 0.6196079, 1,
1.295644, -0.5819399, 1.582276, 1, 0, 0.6117647, 1,
1.295857, 0.718215, 1.834448, 1, 0, 0.6078432, 1,
1.307349, -0.2626798, 0.804815, 1, 0, 0.6, 1,
1.310343, 0.1737694, 3.294159, 1, 0, 0.5921569, 1,
1.316866, -0.5929613, 1.494873, 1, 0, 0.5882353, 1,
1.322244, 0.3350435, 0.9520436, 1, 0, 0.5803922, 1,
1.330366, 1.591709, 0.8362701, 1, 0, 0.5764706, 1,
1.334804, -2.690841, 0.9379081, 1, 0, 0.5686275, 1,
1.340142, -1.638123, 2.373529, 1, 0, 0.5647059, 1,
1.340291, 0.9764465, 3.048277, 1, 0, 0.5568628, 1,
1.348337, 1.530385, -0.6617178, 1, 0, 0.5529412, 1,
1.351335, 0.4117561, -0.4821208, 1, 0, 0.5450981, 1,
1.357086, -1.045522, 2.221586, 1, 0, 0.5411765, 1,
1.357916, 1.574011, -1.123507, 1, 0, 0.5333334, 1,
1.360631, 1.238291, 1.191272, 1, 0, 0.5294118, 1,
1.366153, -0.5971754, 3.191952, 1, 0, 0.5215687, 1,
1.371746, -0.3494329, 2.161188, 1, 0, 0.5176471, 1,
1.371795, 0.06320047, 2.717984, 1, 0, 0.509804, 1,
1.380154, 0.9760283, -0.3668432, 1, 0, 0.5058824, 1,
1.382541, 0.4386837, 1.791658, 1, 0, 0.4980392, 1,
1.382611, 0.3953367, 3.560238, 1, 0, 0.4901961, 1,
1.382757, -0.8485848, 1.590088, 1, 0, 0.4862745, 1,
1.385118, 1.147741, 1.29853, 1, 0, 0.4784314, 1,
1.387712, -0.2877238, 3.615382, 1, 0, 0.4745098, 1,
1.411202, -0.6280878, 1.659348, 1, 0, 0.4666667, 1,
1.415864, -0.92434, 2.001093, 1, 0, 0.4627451, 1,
1.42022, -0.6940366, 2.579341, 1, 0, 0.454902, 1,
1.42735, 0.8011929, 0.6423914, 1, 0, 0.4509804, 1,
1.438891, -0.2555726, 2.874326, 1, 0, 0.4431373, 1,
1.443614, -1.092874, 0.783933, 1, 0, 0.4392157, 1,
1.459067, -0.5689573, 0.4265067, 1, 0, 0.4313726, 1,
1.466878, -2.077886, 3.61376, 1, 0, 0.427451, 1,
1.473817, -0.1673586, 2.68251, 1, 0, 0.4196078, 1,
1.476181, 1.315549, 2.094095, 1, 0, 0.4156863, 1,
1.478717, -0.7648509, -0.001981834, 1, 0, 0.4078431, 1,
1.48543, -1.353235, 1.543588, 1, 0, 0.4039216, 1,
1.49426, -0.4088866, 2.556864, 1, 0, 0.3960784, 1,
1.498999, -0.4483982, 0.285296, 1, 0, 0.3882353, 1,
1.506749, 0.1627197, 1.05145, 1, 0, 0.3843137, 1,
1.515108, -0.7746254, 2.419254, 1, 0, 0.3764706, 1,
1.517863, 0.3895169, 1.33739, 1, 0, 0.372549, 1,
1.52496, -0.7045537, 0.7586966, 1, 0, 0.3647059, 1,
1.542384, 0.4333013, -0.5509326, 1, 0, 0.3607843, 1,
1.555123, -0.86176, 2.571796, 1, 0, 0.3529412, 1,
1.555405, -0.9820194, 2.802028, 1, 0, 0.3490196, 1,
1.557956, -1.125001, 2.903022, 1, 0, 0.3411765, 1,
1.56444, -0.2229591, -1.359079, 1, 0, 0.3372549, 1,
1.565345, 1.050816, 1.403584, 1, 0, 0.3294118, 1,
1.586373, -0.2266676, 2.997821, 1, 0, 0.3254902, 1,
1.593045, -1.511772, 2.910801, 1, 0, 0.3176471, 1,
1.593146, -2.269387, 0.4599397, 1, 0, 0.3137255, 1,
1.603795, -0.04878143, 1.434861, 1, 0, 0.3058824, 1,
1.610694, 1.293033, 0.6119426, 1, 0, 0.2980392, 1,
1.617377, 1.848228, -0.4163653, 1, 0, 0.2941177, 1,
1.620134, 0.6606558, -0.4045167, 1, 0, 0.2862745, 1,
1.624727, 2.317526, 1.733769, 1, 0, 0.282353, 1,
1.628054, -2.164398, 2.391883, 1, 0, 0.2745098, 1,
1.639956, 0.9440483, -0.5237976, 1, 0, 0.2705882, 1,
1.649164, -2.610795, 0.8070762, 1, 0, 0.2627451, 1,
1.663998, 1.641884, 0.4719952, 1, 0, 0.2588235, 1,
1.669897, 0.4852002, 2.063032, 1, 0, 0.2509804, 1,
1.672139, -0.2987142, 0.6681038, 1, 0, 0.2470588, 1,
1.682421, -0.933664, 1.874658, 1, 0, 0.2392157, 1,
1.701322, 0.3903809, 2.336256, 1, 0, 0.2352941, 1,
1.718999, 1.15291, 0.5574212, 1, 0, 0.227451, 1,
1.729276, 1.553238, 2.268666, 1, 0, 0.2235294, 1,
1.734389, 1.477191, -0.6939712, 1, 0, 0.2156863, 1,
1.749623, 1.458759, 0.9782414, 1, 0, 0.2117647, 1,
1.774361, -0.07696113, 3.371795, 1, 0, 0.2039216, 1,
1.778188, -1.883762, 1.550421, 1, 0, 0.1960784, 1,
1.791194, -1.486748, 2.121186, 1, 0, 0.1921569, 1,
1.817531, -2.39437, 4.558783, 1, 0, 0.1843137, 1,
1.840307, 1.836594, 0.007928114, 1, 0, 0.1803922, 1,
1.848486, 1.235888, 1.770353, 1, 0, 0.172549, 1,
1.859958, -1.528613, 1.360902, 1, 0, 0.1686275, 1,
1.869391, 0.6413511, 2.583364, 1, 0, 0.1607843, 1,
1.873878, 0.6425447, 0.555251, 1, 0, 0.1568628, 1,
1.902053, 1.752918, 0.6336201, 1, 0, 0.1490196, 1,
1.909651, 0.03839003, 1.929994, 1, 0, 0.145098, 1,
1.916093, -0.6391202, 1.280993, 1, 0, 0.1372549, 1,
1.925675, 1.043002, 1.651154, 1, 0, 0.1333333, 1,
1.927223, -1.628029, 0.4961092, 1, 0, 0.1254902, 1,
1.950569, -0.420197, 2.453762, 1, 0, 0.1215686, 1,
1.99986, 0.5228403, 0.3534361, 1, 0, 0.1137255, 1,
2.004136, 0.5282168, 1.754148, 1, 0, 0.1098039, 1,
2.005976, 0.3241575, 2.769826, 1, 0, 0.1019608, 1,
2.045213, -0.0369573, 1.735579, 1, 0, 0.09411765, 1,
2.090986, 0.5984179, 2.219208, 1, 0, 0.09019608, 1,
2.098159, 1.969637, 0.7136281, 1, 0, 0.08235294, 1,
2.129247, -1.620163, 0.9653085, 1, 0, 0.07843138, 1,
2.131889, -1.69878, 1.736956, 1, 0, 0.07058824, 1,
2.148401, -0.647591, 1.182309, 1, 0, 0.06666667, 1,
2.182448, 0.01679623, 3.262169, 1, 0, 0.05882353, 1,
2.281012, 0.3314314, 1.764975, 1, 0, 0.05490196, 1,
2.361225, -0.9375737, 1.722501, 1, 0, 0.04705882, 1,
2.363566, -1.013549, 0.5781586, 1, 0, 0.04313726, 1,
2.370015, 0.4714297, 0.7404089, 1, 0, 0.03529412, 1,
2.384475, -0.8392575, 1.617156, 1, 0, 0.03137255, 1,
2.443427, -0.7479573, 1.916469, 1, 0, 0.02352941, 1,
2.547987, 0.3638969, 1.841187, 1, 0, 0.01960784, 1,
2.597081, -0.03874709, 3.127907, 1, 0, 0.01176471, 1,
3.145868, 0.1102857, 3.170655, 1, 0, 0.007843138, 1
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
-0.1581379, -4.735166, -6.824069, 0, -0.5, 0.5, 0.5,
-0.1581379, -4.735166, -6.824069, 1, -0.5, 0.5, 0.5,
-0.1581379, -4.735166, -6.824069, 1, 1.5, 0.5, 0.5,
-0.1581379, -4.735166, -6.824069, 0, 1.5, 0.5, 0.5
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
-4.582201, -0.4759721, -6.824069, 0, -0.5, 0.5, 0.5,
-4.582201, -0.4759721, -6.824069, 1, -0.5, 0.5, 0.5,
-4.582201, -0.4759721, -6.824069, 1, 1.5, 0.5, 0.5,
-4.582201, -0.4759721, -6.824069, 0, 1.5, 0.5, 0.5
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
-4.582201, -4.735166, 0.2674508, 0, -0.5, 0.5, 0.5,
-4.582201, -4.735166, 0.2674508, 1, -0.5, 0.5, 0.5,
-4.582201, -4.735166, 0.2674508, 1, 1.5, 0.5, 0.5,
-4.582201, -4.735166, 0.2674508, 0, 1.5, 0.5, 0.5
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
-3, -3.752275, -5.187565,
3, -3.752275, -5.187565,
-3, -3.752275, -5.187565,
-3, -3.91609, -5.460316,
-2, -3.752275, -5.187565,
-2, -3.91609, -5.460316,
-1, -3.752275, -5.187565,
-1, -3.91609, -5.460316,
0, -3.752275, -5.187565,
0, -3.91609, -5.460316,
1, -3.752275, -5.187565,
1, -3.91609, -5.460316,
2, -3.752275, -5.187565,
2, -3.91609, -5.460316,
3, -3.752275, -5.187565,
3, -3.91609, -5.460316
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
-3, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
-3, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
-3, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
-3, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
-2, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
-2, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
-2, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
-2, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
-1, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
-1, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
-1, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
-1, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
0, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
0, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
0, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
0, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
1, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
1, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
1, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
1, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
2, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
2, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
2, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
2, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5,
3, -4.24372, -6.005817, 0, -0.5, 0.5, 0.5,
3, -4.24372, -6.005817, 1, -0.5, 0.5, 0.5,
3, -4.24372, -6.005817, 1, 1.5, 0.5, 0.5,
3, -4.24372, -6.005817, 0, 1.5, 0.5, 0.5
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
-3.561264, -3, -5.187565,
-3.561264, 2, -5.187565,
-3.561264, -3, -5.187565,
-3.73142, -3, -5.460316,
-3.561264, -2, -5.187565,
-3.73142, -2, -5.460316,
-3.561264, -1, -5.187565,
-3.73142, -1, -5.460316,
-3.561264, 0, -5.187565,
-3.73142, 0, -5.460316,
-3.561264, 1, -5.187565,
-3.73142, 1, -5.460316,
-3.561264, 2, -5.187565,
-3.73142, 2, -5.460316
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
-4.071733, -3, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, -3, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, -3, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, -3, -6.005817, 0, 1.5, 0.5, 0.5,
-4.071733, -2, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, -2, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, -2, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, -2, -6.005817, 0, 1.5, 0.5, 0.5,
-4.071733, -1, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, -1, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, -1, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, -1, -6.005817, 0, 1.5, 0.5, 0.5,
-4.071733, 0, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, 0, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, 0, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, 0, -6.005817, 0, 1.5, 0.5, 0.5,
-4.071733, 1, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, 1, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, 1, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, 1, -6.005817, 0, 1.5, 0.5, 0.5,
-4.071733, 2, -6.005817, 0, -0.5, 0.5, 0.5,
-4.071733, 2, -6.005817, 1, -0.5, 0.5, 0.5,
-4.071733, 2, -6.005817, 1, 1.5, 0.5, 0.5,
-4.071733, 2, -6.005817, 0, 1.5, 0.5, 0.5
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
-3.561264, -3.752275, -4,
-3.561264, -3.752275, 4,
-3.561264, -3.752275, -4,
-3.73142, -3.91609, -4,
-3.561264, -3.752275, -2,
-3.73142, -3.91609, -2,
-3.561264, -3.752275, 0,
-3.73142, -3.91609, 0,
-3.561264, -3.752275, 2,
-3.73142, -3.91609, 2,
-3.561264, -3.752275, 4,
-3.73142, -3.91609, 4
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
-4.071733, -4.24372, -4, 0, -0.5, 0.5, 0.5,
-4.071733, -4.24372, -4, 1, -0.5, 0.5, 0.5,
-4.071733, -4.24372, -4, 1, 1.5, 0.5, 0.5,
-4.071733, -4.24372, -4, 0, 1.5, 0.5, 0.5,
-4.071733, -4.24372, -2, 0, -0.5, 0.5, 0.5,
-4.071733, -4.24372, -2, 1, -0.5, 0.5, 0.5,
-4.071733, -4.24372, -2, 1, 1.5, 0.5, 0.5,
-4.071733, -4.24372, -2, 0, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 0, 0, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 0, 1, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 0, 1, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 0, 0, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 2, 0, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 2, 1, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 2, 1, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 2, 0, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 4, 0, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 4, 1, -0.5, 0.5, 0.5,
-4.071733, -4.24372, 4, 1, 1.5, 0.5, 0.5,
-4.071733, -4.24372, 4, 0, 1.5, 0.5, 0.5
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
-3.561264, -3.752275, -5.187565,
-3.561264, 2.800331, -5.187565,
-3.561264, -3.752275, 5.722466,
-3.561264, 2.800331, 5.722466,
-3.561264, -3.752275, -5.187565,
-3.561264, -3.752275, 5.722466,
-3.561264, 2.800331, -5.187565,
-3.561264, 2.800331, 5.722466,
-3.561264, -3.752275, -5.187565,
3.244988, -3.752275, -5.187565,
-3.561264, -3.752275, 5.722466,
3.244988, -3.752275, 5.722466,
-3.561264, 2.800331, -5.187565,
3.244988, 2.800331, -5.187565,
-3.561264, 2.800331, 5.722466,
3.244988, 2.800331, 5.722466,
3.244988, -3.752275, -5.187565,
3.244988, 2.800331, -5.187565,
3.244988, -3.752275, 5.722466,
3.244988, 2.800331, 5.722466,
3.244988, -3.752275, -5.187565,
3.244988, -3.752275, 5.722466,
3.244988, 2.800331, -5.187565,
3.244988, 2.800331, 5.722466
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
var radius = 7.706553;
var distance = 34.28732;
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
mvMatrix.translate( 0.1581379, 0.4759721, -0.2674508 );
mvMatrix.scale( 1.224239, 1.271628, 0.7637445 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.28732);
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
Chlorbenside<-read.table("Chlorbenside.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.462143, 0.6870544, 0.9216921, 0, 0, 1, 1, 1,
-3.089526, -1.057673, -2.418882, 1, 0, 0, 1, 1,
-2.890996, -1.776919, -2.048215, 1, 0, 0, 1, 1,
-2.61446, 1.381667, -0.8071436, 1, 0, 0, 1, 1,
-2.518124, 0.9759347, -1.26423, 1, 0, 0, 1, 1,
-2.409706, 0.5412054, -1.916016, 1, 0, 0, 1, 1,
-2.299765, 1.03994, -1.757697, 0, 0, 0, 1, 1,
-2.184423, 0.2619409, -0.8951899, 0, 0, 0, 1, 1,
-2.176393, 2.026719, -1.673639, 0, 0, 0, 1, 1,
-2.167148, -0.3067928, -2.071554, 0, 0, 0, 1, 1,
-2.164131, -0.8498676, -2.187235, 0, 0, 0, 1, 1,
-2.146297, 1.085739, -0.9116132, 0, 0, 0, 1, 1,
-2.074336, -0.3590155, -1.29501, 0, 0, 0, 1, 1,
-2.073617, -0.03556319, -1.375691, 1, 1, 1, 1, 1,
-2.072775, -0.3772976, -1.256445, 1, 1, 1, 1, 1,
-2.063227, -0.06253928, -2.248927, 1, 1, 1, 1, 1,
-2.056018, 1.361969, -0.5583246, 1, 1, 1, 1, 1,
-1.99659, 0.6705208, -0.003053356, 1, 1, 1, 1, 1,
-1.99338, -1.750806, -0.9707449, 1, 1, 1, 1, 1,
-1.983788, 1.160507, -2.876526, 1, 1, 1, 1, 1,
-1.981586, 1.930543, -0.1039574, 1, 1, 1, 1, 1,
-1.981032, -0.9187365, -3.008758, 1, 1, 1, 1, 1,
-1.976188, 1.480478, -0.3707727, 1, 1, 1, 1, 1,
-1.957378, 0.3247173, -3.19879, 1, 1, 1, 1, 1,
-1.957321, 0.4259877, -2.433286, 1, 1, 1, 1, 1,
-1.939398, -0.1124197, -1.720808, 1, 1, 1, 1, 1,
-1.936266, 1.103196, -1.362621, 1, 1, 1, 1, 1,
-1.928352, -0.1911965, -3.802103, 1, 1, 1, 1, 1,
-1.897111, 0.2150189, -3.447324, 0, 0, 1, 1, 1,
-1.888141, -0.4379394, -1.063764, 1, 0, 0, 1, 1,
-1.884207, -0.7657745, -0.2364394, 1, 0, 0, 1, 1,
-1.86854, -0.9150078, -1.09966, 1, 0, 0, 1, 1,
-1.853854, 1.125029, 0.7655596, 1, 0, 0, 1, 1,
-1.845001, -0.6292098, -3.299691, 1, 0, 0, 1, 1,
-1.832934, -0.6232692, -1.48154, 0, 0, 0, 1, 1,
-1.831481, 1.758374, 0.3588222, 0, 0, 0, 1, 1,
-1.824144, -0.5054048, -2.784344, 0, 0, 0, 1, 1,
-1.793223, 0.7807141, -0.4168989, 0, 0, 0, 1, 1,
-1.79252, -0.6916474, -3.457733, 0, 0, 0, 1, 1,
-1.790125, 0.1899104, -2.252923, 0, 0, 0, 1, 1,
-1.768169, -0.878525, -1.618155, 0, 0, 0, 1, 1,
-1.751994, -0.4121671, -1.602521, 1, 1, 1, 1, 1,
-1.751062, -0.01634533, -1.892924, 1, 1, 1, 1, 1,
-1.722397, -1.189742, -2.064494, 1, 1, 1, 1, 1,
-1.688654, -0.4860618, -2.716985, 1, 1, 1, 1, 1,
-1.685597, -0.2591977, -1.370634, 1, 1, 1, 1, 1,
-1.68062, -0.09458899, -0.2253118, 1, 1, 1, 1, 1,
-1.679568, 1.635809, -0.4352963, 1, 1, 1, 1, 1,
-1.664746, 1.126049, -1.876502, 1, 1, 1, 1, 1,
-1.646322, 1.742921, -0.1509189, 1, 1, 1, 1, 1,
-1.642687, 0.4005693, -1.625625, 1, 1, 1, 1, 1,
-1.642372, -1.542614, -2.208183, 1, 1, 1, 1, 1,
-1.638718, -1.705491, -2.549699, 1, 1, 1, 1, 1,
-1.638708, -1.302149, -3.505662, 1, 1, 1, 1, 1,
-1.61667, -2.033277, -1.981243, 1, 1, 1, 1, 1,
-1.599585, 1.240433, -0.7310835, 1, 1, 1, 1, 1,
-1.597674, -0.7193849, -0.5894908, 0, 0, 1, 1, 1,
-1.593048, 2.190504, -1.893582, 1, 0, 0, 1, 1,
-1.592865, -1.364573, -1.82032, 1, 0, 0, 1, 1,
-1.590325, -0.4131287, -2.244098, 1, 0, 0, 1, 1,
-1.571588, -1.034415, -1.828197, 1, 0, 0, 1, 1,
-1.559946, 0.855321, -2.440168, 1, 0, 0, 1, 1,
-1.538854, -1.307268, -2.650072, 0, 0, 0, 1, 1,
-1.535027, 0.1354458, -1.099085, 0, 0, 0, 1, 1,
-1.534606, -0.3728982, -2.890588, 0, 0, 0, 1, 1,
-1.512244, -1.372444, -0.7987486, 0, 0, 0, 1, 1,
-1.508932, -0.4522771, -2.235714, 0, 0, 0, 1, 1,
-1.498818, -1.111996, -2.676062, 0, 0, 0, 1, 1,
-1.498631, 0.517535, -2.315016, 0, 0, 0, 1, 1,
-1.495094, -0.5628307, -1.514394, 1, 1, 1, 1, 1,
-1.473402, 0.3225534, -0.2053171, 1, 1, 1, 1, 1,
-1.466951, -1.422082, -2.409003, 1, 1, 1, 1, 1,
-1.465482, 0.1822708, -1.015138, 1, 1, 1, 1, 1,
-1.454805, -1.284351, -2.202788, 1, 1, 1, 1, 1,
-1.435405, -0.3642823, -3.005315, 1, 1, 1, 1, 1,
-1.424754, 0.1748584, -2.685494, 1, 1, 1, 1, 1,
-1.413249, -0.03155844, -0.9534552, 1, 1, 1, 1, 1,
-1.409094, -1.013252, -3.316867, 1, 1, 1, 1, 1,
-1.403747, 0.7154815, -0.09208225, 1, 1, 1, 1, 1,
-1.390211, -0.598644, -2.881279, 1, 1, 1, 1, 1,
-1.384879, -1.049685, -2.60476, 1, 1, 1, 1, 1,
-1.379654, -0.3886831, -1.795638, 1, 1, 1, 1, 1,
-1.376448, -1.692346, -3.074335, 1, 1, 1, 1, 1,
-1.373133, 1.31903, -1.82276, 1, 1, 1, 1, 1,
-1.349896, -0.2212251, -2.139199, 0, 0, 1, 1, 1,
-1.348266, -1.914298, -2.493693, 1, 0, 0, 1, 1,
-1.33117, 0.2753751, -0.8817964, 1, 0, 0, 1, 1,
-1.329326, -0.04648255, -1.260932, 1, 0, 0, 1, 1,
-1.327198, -1.45479, -1.955088, 1, 0, 0, 1, 1,
-1.324458, 0.7656022, -1.572672, 1, 0, 0, 1, 1,
-1.322593, 1.256016, -2.945049, 0, 0, 0, 1, 1,
-1.317039, 0.1593252, -2.423377, 0, 0, 0, 1, 1,
-1.314423, 0.6174942, -3.171471, 0, 0, 0, 1, 1,
-1.313969, -1.270391, -1.546323, 0, 0, 0, 1, 1,
-1.310751, 1.270194, -0.6419858, 0, 0, 0, 1, 1,
-1.309959, 0.8499173, 0.1132722, 0, 0, 0, 1, 1,
-1.302966, 0.0933927, -1.008253, 0, 0, 0, 1, 1,
-1.299013, 0.5247558, -0.6611511, 1, 1, 1, 1, 1,
-1.295883, 1.041011, -0.7187791, 1, 1, 1, 1, 1,
-1.295748, 1.103661, 0.2008356, 1, 1, 1, 1, 1,
-1.289759, -0.9470403, -1.51689, 1, 1, 1, 1, 1,
-1.289269, -0.1339103, -2.843916, 1, 1, 1, 1, 1,
-1.286074, 0.1179719, -2.407813, 1, 1, 1, 1, 1,
-1.285599, -0.7139954, -2.133843, 1, 1, 1, 1, 1,
-1.281886, 0.1276185, -3.164604, 1, 1, 1, 1, 1,
-1.279665, -1.303622, -1.535478, 1, 1, 1, 1, 1,
-1.277568, -0.5821334, -2.103788, 1, 1, 1, 1, 1,
-1.275826, 0.2807766, -3.053856, 1, 1, 1, 1, 1,
-1.261902, -1.134285, -2.668149, 1, 1, 1, 1, 1,
-1.255897, 0.2851163, -3.152919, 1, 1, 1, 1, 1,
-1.251345, 1.70343, 1.39877, 1, 1, 1, 1, 1,
-1.249799, 0.2152345, -0.6395206, 1, 1, 1, 1, 1,
-1.236922, 0.2595155, 0.08773644, 0, 0, 1, 1, 1,
-1.232643, -0.5011742, -1.759638, 1, 0, 0, 1, 1,
-1.212472, 0.2685262, -1.043069, 1, 0, 0, 1, 1,
-1.205682, 0.1408054, -0.7580481, 1, 0, 0, 1, 1,
-1.203197, 0.5258857, -1.301896, 1, 0, 0, 1, 1,
-1.194252, 1.080501, 0.6325761, 1, 0, 0, 1, 1,
-1.186421, 0.6023345, -1.499992, 0, 0, 0, 1, 1,
-1.182917, -0.2217905, 0.5299439, 0, 0, 0, 1, 1,
-1.180887, -0.1483996, -3.436972, 0, 0, 0, 1, 1,
-1.175079, 0.61103, -0.6866507, 0, 0, 0, 1, 1,
-1.17298, -1.270273, -0.6120892, 0, 0, 0, 1, 1,
-1.169574, 1.056358, -1.090433, 0, 0, 0, 1, 1,
-1.168264, 1.344913, -0.9796606, 0, 0, 0, 1, 1,
-1.163304, -0.7746814, -0.4799058, 1, 1, 1, 1, 1,
-1.160812, 0.687232, -0.4275547, 1, 1, 1, 1, 1,
-1.160717, -0.2780854, -3.473599, 1, 1, 1, 1, 1,
-1.155951, -1.574487, -1.769396, 1, 1, 1, 1, 1,
-1.143351, -0.1053144, -1.493551, 1, 1, 1, 1, 1,
-1.141237, -0.6216164, -0.2820499, 1, 1, 1, 1, 1,
-1.129377, 0.3796975, -1.804766, 1, 1, 1, 1, 1,
-1.127687, -0.07529856, -1.642348, 1, 1, 1, 1, 1,
-1.127222, 0.9415346, 0.2793788, 1, 1, 1, 1, 1,
-1.12634, 0.5183684, -1.330556, 1, 1, 1, 1, 1,
-1.117492, -2.139217, -3.291799, 1, 1, 1, 1, 1,
-1.113676, -2.225927, -3.700697, 1, 1, 1, 1, 1,
-1.105687, 0.1128795, -1.407446, 1, 1, 1, 1, 1,
-1.095665, -0.1225292, -2.092787, 1, 1, 1, 1, 1,
-1.090874, 0.6710579, -2.778977, 1, 1, 1, 1, 1,
-1.083174, 1.668367, 0.334758, 0, 0, 1, 1, 1,
-1.07973, 0.4522028, -2.247873, 1, 0, 0, 1, 1,
-1.0757, -2.054883, -2.257654, 1, 0, 0, 1, 1,
-1.075629, 0.5634508, -0.8002405, 1, 0, 0, 1, 1,
-1.071, 0.1590707, -1.444828, 1, 0, 0, 1, 1,
-1.063266, -1.91118, -0.5571629, 1, 0, 0, 1, 1,
-1.057989, 0.8024259, -1.915893, 0, 0, 0, 1, 1,
-1.047167, -1.285363, -3.118663, 0, 0, 0, 1, 1,
-1.040728, -1.059601, -3.435655, 0, 0, 0, 1, 1,
-1.040315, -0.3942328, -1.395903, 0, 0, 0, 1, 1,
-1.040298, 1.038089, 1.448537, 0, 0, 0, 1, 1,
-1.039528, 0.9538882, -0.05591214, 0, 0, 0, 1, 1,
-1.038943, 0.5728836, 0.04941889, 0, 0, 0, 1, 1,
-1.023762, 0.4584448, -1.63692, 1, 1, 1, 1, 1,
-1.02097, 0.331812, -1.144217, 1, 1, 1, 1, 1,
-1.016692, 0.4398704, -0.3913154, 1, 1, 1, 1, 1,
-1.01501, 0.2455577, -1.395956, 1, 1, 1, 1, 1,
-1.012275, 0.7297251, -0.09459192, 1, 1, 1, 1, 1,
-0.9950809, -0.8619273, -0.08815096, 1, 1, 1, 1, 1,
-0.9936212, -0.6638424, -1.693649, 1, 1, 1, 1, 1,
-0.992633, -0.02550594, -0.3582655, 1, 1, 1, 1, 1,
-0.9921915, 1.804957, -0.2341687, 1, 1, 1, 1, 1,
-0.9897166, 1.517228, -0.2219566, 1, 1, 1, 1, 1,
-0.9856333, -1.428445, -1.155664, 1, 1, 1, 1, 1,
-0.9856232, 0.9325979, -0.1043751, 1, 1, 1, 1, 1,
-0.9824493, -0.6635301, -2.159053, 1, 1, 1, 1, 1,
-0.9802561, -1.702798, -2.820379, 1, 1, 1, 1, 1,
-0.9791713, 1.22, -2.041114, 1, 1, 1, 1, 1,
-0.9788674, 0.08664707, -2.020011, 0, 0, 1, 1, 1,
-0.9771295, -1.022483, -2.979352, 1, 0, 0, 1, 1,
-0.975597, 2.704904, -1.933562, 1, 0, 0, 1, 1,
-0.9726844, -1.423789, -1.153716, 1, 0, 0, 1, 1,
-0.9666367, -0.824892, -1.086654, 1, 0, 0, 1, 1,
-0.9647996, 1.723375, -1.154621, 1, 0, 0, 1, 1,
-0.9637507, -2.042325, -3.459489, 0, 0, 0, 1, 1,
-0.9543129, 0.7769924, 0.4846254, 0, 0, 0, 1, 1,
-0.9513168, -0.05505569, -2.387624, 0, 0, 0, 1, 1,
-0.9446114, 1.03717, 0.08073922, 0, 0, 0, 1, 1,
-0.9398605, -0.624747, -1.524666, 0, 0, 0, 1, 1,
-0.9327685, -0.08693181, -1.549856, 0, 0, 0, 1, 1,
-0.9291235, 0.3670044, -0.5939239, 0, 0, 0, 1, 1,
-0.9284468, -0.6414388, -3.324965, 1, 1, 1, 1, 1,
-0.9276842, 0.4120975, -0.1767633, 1, 1, 1, 1, 1,
-0.9260913, 0.4419331, -1.688187, 1, 1, 1, 1, 1,
-0.9258764, -1.602147, -2.98788, 1, 1, 1, 1, 1,
-0.9247139, 1.597604, -0.7698817, 1, 1, 1, 1, 1,
-0.918098, 1.071821, 0.7757905, 1, 1, 1, 1, 1,
-0.9112729, -0.3819078, -2.677822, 1, 1, 1, 1, 1,
-0.9033816, -1.53238, -4.048942, 1, 1, 1, 1, 1,
-0.8931302, -0.7588872, -1.127898, 1, 1, 1, 1, 1,
-0.891317, -1.642107, -3.810915, 1, 1, 1, 1, 1,
-0.8874125, -1.359533, -2.415619, 1, 1, 1, 1, 1,
-0.8832324, -1.461704, -2.7568, 1, 1, 1, 1, 1,
-0.8798947, 0.2339153, -2.015379, 1, 1, 1, 1, 1,
-0.8691724, 1.018156, 0.4896678, 1, 1, 1, 1, 1,
-0.8669498, 0.7919683, -1.155365, 1, 1, 1, 1, 1,
-0.8636003, -0.1123323, -0.1055008, 0, 0, 1, 1, 1,
-0.8624144, -0.4692851, -0.3577821, 1, 0, 0, 1, 1,
-0.862026, 0.1320342, -1.316616, 1, 0, 0, 1, 1,
-0.8581895, -0.6604713, -0.7412286, 1, 0, 0, 1, 1,
-0.856593, -0.2937967, -1.501562, 1, 0, 0, 1, 1,
-0.8559666, -0.1860569, -2.506986, 1, 0, 0, 1, 1,
-0.8518931, -2.550491, -3.832989, 0, 0, 0, 1, 1,
-0.8513491, 1.203127, -1.554944, 0, 0, 0, 1, 1,
-0.850145, 1.130452, -1.907032, 0, 0, 0, 1, 1,
-0.8440531, -1.387083, -1.133058, 0, 0, 0, 1, 1,
-0.8382877, -0.8710785, -1.783106, 0, 0, 0, 1, 1,
-0.8336346, 1.875068, -2.463295, 0, 0, 0, 1, 1,
-0.8233793, 0.2710052, -2.590497, 0, 0, 0, 1, 1,
-0.8225394, 0.03984169, -0.6347523, 1, 1, 1, 1, 1,
-0.8185223, -0.1631312, -2.25109, 1, 1, 1, 1, 1,
-0.8125615, -1.3714, -3.183022, 1, 1, 1, 1, 1,
-0.8108022, -0.05465263, -2.755686, 1, 1, 1, 1, 1,
-0.8106487, -0.2748156, -1.483522, 1, 1, 1, 1, 1,
-0.8085165, -0.8433706, -3.016662, 1, 1, 1, 1, 1,
-0.806725, 0.8758436, -0.6983503, 1, 1, 1, 1, 1,
-0.7925878, -2.821837, -1.811473, 1, 1, 1, 1, 1,
-0.7922618, 0.1677066, -2.083241, 1, 1, 1, 1, 1,
-0.7871801, -0.8669702, -1.642657, 1, 1, 1, 1, 1,
-0.7814208, 0.1784488, -0.8097568, 1, 1, 1, 1, 1,
-0.7749876, -0.7699324, -2.538977, 1, 1, 1, 1, 1,
-0.771117, 0.7641942, -0.5981983, 1, 1, 1, 1, 1,
-0.7711152, 0.2217471, -1.951966, 1, 1, 1, 1, 1,
-0.7668223, -0.2104165, -0.6024094, 1, 1, 1, 1, 1,
-0.7590749, -1.83254, -4.295058, 0, 0, 1, 1, 1,
-0.7560599, 0.1884025, -2.005063, 1, 0, 0, 1, 1,
-0.7547249, -0.5631208, -4.142785, 1, 0, 0, 1, 1,
-0.7541426, -1.479908, -3.807984, 1, 0, 0, 1, 1,
-0.7539722, 0.8992956, -0.5372687, 1, 0, 0, 1, 1,
-0.7536111, -0.164259, -1.679967, 1, 0, 0, 1, 1,
-0.7525667, 1.084056, -1.966782, 0, 0, 0, 1, 1,
-0.7504419, 1.147245, 0.8477427, 0, 0, 0, 1, 1,
-0.7478371, 0.636143, -0.1610194, 0, 0, 0, 1, 1,
-0.7437142, -0.5482383, -3.276452, 0, 0, 0, 1, 1,
-0.7425216, -1.262302, -3.064858, 0, 0, 0, 1, 1,
-0.7398469, -0.001996783, -1.558422, 0, 0, 0, 1, 1,
-0.7394727, -0.9454888, -1.447156, 0, 0, 0, 1, 1,
-0.723175, 0.07132677, -1.013913, 1, 1, 1, 1, 1,
-0.7205999, 0.1310292, -1.628837, 1, 1, 1, 1, 1,
-0.7139755, 1.046836, -0.4184134, 1, 1, 1, 1, 1,
-0.7074412, -0.1174317, -2.081194, 1, 1, 1, 1, 1,
-0.697216, 0.8496336, -1.055898, 1, 1, 1, 1, 1,
-0.6964977, -0.4745458, 1.299511, 1, 1, 1, 1, 1,
-0.6958526, -0.3601231, -0.7001219, 1, 1, 1, 1, 1,
-0.6943753, 0.02429002, -0.4777461, 1, 1, 1, 1, 1,
-0.6927427, -0.9194056, -3.105704, 1, 1, 1, 1, 1,
-0.6906421, 0.2516646, -1.356894, 1, 1, 1, 1, 1,
-0.6875474, -0.1386049, -2.154768, 1, 1, 1, 1, 1,
-0.6855657, -0.8959875, -2.376623, 1, 1, 1, 1, 1,
-0.685387, -0.8426442, -3.567017, 1, 1, 1, 1, 1,
-0.6794097, 0.4778959, -2.690308, 1, 1, 1, 1, 1,
-0.6789373, 0.2486162, -3.052556, 1, 1, 1, 1, 1,
-0.6776013, -0.2313303, -2.323889, 0, 0, 1, 1, 1,
-0.6617255, 0.1052387, -0.9556044, 1, 0, 0, 1, 1,
-0.6604776, -0.3039527, -1.991638, 1, 0, 0, 1, 1,
-0.6585673, -0.7187618, -2.738454, 1, 0, 0, 1, 1,
-0.6582615, -2.038956, -3.776521, 1, 0, 0, 1, 1,
-0.651113, 0.7031771, -0.8091613, 1, 0, 0, 1, 1,
-0.6508634, 1.238653, -0.5351751, 0, 0, 0, 1, 1,
-0.6492872, 1.179555, 0.9715955, 0, 0, 0, 1, 1,
-0.6442326, 0.3246374, -2.995615, 0, 0, 0, 1, 1,
-0.6427314, 0.3129261, -1.116464, 0, 0, 0, 1, 1,
-0.6410095, -0.8733028, -3.587092, 0, 0, 0, 1, 1,
-0.6392554, 1.529041, -0.1821362, 0, 0, 0, 1, 1,
-0.6264188, 1.983985, 0.6773208, 0, 0, 0, 1, 1,
-0.6254836, -0.2154597, -1.127275, 1, 1, 1, 1, 1,
-0.619766, -1.029908, -2.066429, 1, 1, 1, 1, 1,
-0.6179516, 0.5056854, -1.208625, 1, 1, 1, 1, 1,
-0.615431, -0.9040696, -2.779206, 1, 1, 1, 1, 1,
-0.6066709, 0.8990635, -0.2078846, 1, 1, 1, 1, 1,
-0.6052665, 0.5791042, -2.48574, 1, 1, 1, 1, 1,
-0.6051505, 2.055846, -1.796406, 1, 1, 1, 1, 1,
-0.6012084, 0.1319459, -1.751891, 1, 1, 1, 1, 1,
-0.59949, -0.9313862, -3.124726, 1, 1, 1, 1, 1,
-0.5987125, -1.314395, -2.050737, 1, 1, 1, 1, 1,
-0.5956349, -1.576977, -3.091296, 1, 1, 1, 1, 1,
-0.5944988, 0.5149643, 1.279727, 1, 1, 1, 1, 1,
-0.5934179, 0.1914014, -0.9078363, 1, 1, 1, 1, 1,
-0.5921825, 0.8247886, -2.98957, 1, 1, 1, 1, 1,
-0.5893851, -0.4010497, -1.561924, 1, 1, 1, 1, 1,
-0.5870889, 2.105615, 1.665548, 0, 0, 1, 1, 1,
-0.5854252, -0.6191164, -3.134244, 1, 0, 0, 1, 1,
-0.5820067, -0.2145872, -1.700182, 1, 0, 0, 1, 1,
-0.5796017, 1.520397, 0.2073693, 1, 0, 0, 1, 1,
-0.5728231, -1.352532, -3.773107, 1, 0, 0, 1, 1,
-0.5708559, -0.3030152, -2.263553, 1, 0, 0, 1, 1,
-0.5692243, 0.0393153, -2.188903, 0, 0, 0, 1, 1,
-0.5674329, -0.02497704, -2.296854, 0, 0, 0, 1, 1,
-0.5672137, 0.8583893, 0.9334611, 0, 0, 0, 1, 1,
-0.5619844, 0.5242367, -0.9517834, 0, 0, 0, 1, 1,
-0.5609229, 0.3195096, -0.3349303, 0, 0, 0, 1, 1,
-0.5561414, 0.04004251, -1.380951, 0, 0, 0, 1, 1,
-0.5448387, -1.328483, -3.408788, 0, 0, 0, 1, 1,
-0.5346795, 1.021139, 1.73614, 1, 1, 1, 1, 1,
-0.5338724, -0.8409351, -2.585937, 1, 1, 1, 1, 1,
-0.5337102, -0.9248606, -4.211379, 1, 1, 1, 1, 1,
-0.5328693, -0.3327286, -3.027927, 1, 1, 1, 1, 1,
-0.5319204, 0.2525538, -1.465888, 1, 1, 1, 1, 1,
-0.5318859, -0.1488945, -2.196562, 1, 1, 1, 1, 1,
-0.5258522, 1.231938, -0.4415959, 1, 1, 1, 1, 1,
-0.517615, -0.1955251, -0.2931474, 1, 1, 1, 1, 1,
-0.515418, -0.2868003, -3.45623, 1, 1, 1, 1, 1,
-0.5148938, -1.691607, -2.398411, 1, 1, 1, 1, 1,
-0.5128325, -2.142931, -3.540742, 1, 1, 1, 1, 1,
-0.5104414, 0.9077313, 0.09953126, 1, 1, 1, 1, 1,
-0.5091304, -0.820925, -3.35976, 1, 1, 1, 1, 1,
-0.5060312, -0.7023036, -2.791518, 1, 1, 1, 1, 1,
-0.5042217, -1.453763, -2.879065, 1, 1, 1, 1, 1,
-0.5026979, 1.163846, -0.5078082, 0, 0, 1, 1, 1,
-0.4964327, -1.040562, -2.97142, 1, 0, 0, 1, 1,
-0.493736, 1.165759, 1.142286, 1, 0, 0, 1, 1,
-0.4901459, 0.2473914, -2.019198, 1, 0, 0, 1, 1,
-0.488847, 1.685081, 0.08471926, 1, 0, 0, 1, 1,
-0.4860933, -0.9710731, -2.029824, 1, 0, 0, 1, 1,
-0.485699, -1.062806, -2.957698, 0, 0, 0, 1, 1,
-0.4848354, -0.5926524, -4.963871, 0, 0, 0, 1, 1,
-0.4836374, 1.49096, 0.283351, 0, 0, 0, 1, 1,
-0.4808741, -0.6890848, -2.686495, 0, 0, 0, 1, 1,
-0.4792219, -1.155948, -1.900953, 0, 0, 0, 1, 1,
-0.478676, -1.154347, -3.297255, 0, 0, 0, 1, 1,
-0.4763916, -0.245035, -2.301835, 0, 0, 0, 1, 1,
-0.4702803, -0.4277147, -2.628256, 1, 1, 1, 1, 1,
-0.4651327, -1.100041, -2.833732, 1, 1, 1, 1, 1,
-0.4559152, -0.07445534, -2.019429, 1, 1, 1, 1, 1,
-0.4558556, 0.771853, 0.4995349, 1, 1, 1, 1, 1,
-0.451065, -0.4221137, -1.796887, 1, 1, 1, 1, 1,
-0.4508774, -1.059754, -2.696684, 1, 1, 1, 1, 1,
-0.4495772, 1.016706, 0.765135, 1, 1, 1, 1, 1,
-0.4417323, -1.278837, -2.499796, 1, 1, 1, 1, 1,
-0.4410825, 0.3031509, -0.9863958, 1, 1, 1, 1, 1,
-0.4389878, -0.5768276, -2.797422, 1, 1, 1, 1, 1,
-0.4332588, -1.297808, -2.639956, 1, 1, 1, 1, 1,
-0.4286713, 0.8964378, 0.987843, 1, 1, 1, 1, 1,
-0.4284571, -1.57735, -3.502239, 1, 1, 1, 1, 1,
-0.4210849, -0.4101675, -4.223395, 1, 1, 1, 1, 1,
-0.4171993, 0.6077765, -1.539604, 1, 1, 1, 1, 1,
-0.4131917, 1.112337, -1.758236, 0, 0, 1, 1, 1,
-0.4124271, 0.8815464, 0.8021126, 1, 0, 0, 1, 1,
-0.4115478, 1.594138, 0.2728809, 1, 0, 0, 1, 1,
-0.4078796, 0.7035434, 0.4072129, 1, 0, 0, 1, 1,
-0.406174, -0.8850661, -2.163592, 1, 0, 0, 1, 1,
-0.4055976, -3.09495, -3.143996, 1, 0, 0, 1, 1,
-0.4013193, 0.3172567, -1.443659, 0, 0, 0, 1, 1,
-0.3955615, 1.136595, -1.805182, 0, 0, 0, 1, 1,
-0.3947063, 0.07985619, -2.392788, 0, 0, 0, 1, 1,
-0.3902462, 0.2247954, -3.164427, 0, 0, 0, 1, 1,
-0.389676, 0.5912054, 0.6131479, 0, 0, 0, 1, 1,
-0.3893416, -0.1762162, -1.864667, 0, 0, 0, 1, 1,
-0.3844393, -0.6402912, -3.487892, 0, 0, 0, 1, 1,
-0.3826379, -0.3434651, -3.389602, 1, 1, 1, 1, 1,
-0.3812758, 0.3288518, -1.20217, 1, 1, 1, 1, 1,
-0.3793292, 1.237069, -0.09589529, 1, 1, 1, 1, 1,
-0.3755057, -0.1992157, -2.318312, 1, 1, 1, 1, 1,
-0.3749659, 1.318382, -0.1914647, 1, 1, 1, 1, 1,
-0.3667331, 0.7032439, -0.8255476, 1, 1, 1, 1, 1,
-0.3662114, 0.636545, -1.008824, 1, 1, 1, 1, 1,
-0.3641172, 0.09906616, -0.5937452, 1, 1, 1, 1, 1,
-0.3503999, 0.4199837, -1.239304, 1, 1, 1, 1, 1,
-0.3439078, -0.1677336, -1.137463, 1, 1, 1, 1, 1,
-0.3433394, -1.054757, -2.624135, 1, 1, 1, 1, 1,
-0.3420224, -0.2485045, -3.14911, 1, 1, 1, 1, 1,
-0.3418909, -0.8099323, -2.983304, 1, 1, 1, 1, 1,
-0.3332867, -0.1589072, -2.275975, 1, 1, 1, 1, 1,
-0.328783, 0.1996296, -0.6213871, 1, 1, 1, 1, 1,
-0.3282229, -0.4441659, -2.022467, 0, 0, 1, 1, 1,
-0.3260549, -0.9324332, -2.656663, 1, 0, 0, 1, 1,
-0.3249794, 1.076613, -0.3827453, 1, 0, 0, 1, 1,
-0.3237565, -0.9628864, -3.919897, 1, 0, 0, 1, 1,
-0.3234625, 0.632388, -0.7567528, 1, 0, 0, 1, 1,
-0.3210278, 0.2066802, -0.7873329, 1, 0, 0, 1, 1,
-0.3160354, -0.7303125, -1.743318, 0, 0, 0, 1, 1,
-0.3140704, 0.2772121, -1.397081, 0, 0, 0, 1, 1,
-0.3135698, -0.5085008, -1.554752, 0, 0, 0, 1, 1,
-0.3129323, 0.08216923, -1.454453, 0, 0, 0, 1, 1,
-0.311872, -1.711313, -2.548923, 0, 0, 0, 1, 1,
-0.310936, 0.1722743, 0.3564689, 0, 0, 0, 1, 1,
-0.3088836, -1.724097, -3.026486, 0, 0, 0, 1, 1,
-0.3078659, -1.526321, -1.303097, 1, 1, 1, 1, 1,
-0.3064509, 0.1495786, -1.587733, 1, 1, 1, 1, 1,
-0.3049878, 0.1840446, -2.111813, 1, 1, 1, 1, 1,
-0.3013592, -0.8788146, -2.490461, 1, 1, 1, 1, 1,
-0.2967028, 1.765157, -0.3061619, 1, 1, 1, 1, 1,
-0.2956073, -0.02649612, -1.079217, 1, 1, 1, 1, 1,
-0.2945138, 0.6725469, -1.585935, 1, 1, 1, 1, 1,
-0.29432, -0.5508804, -1.928469, 1, 1, 1, 1, 1,
-0.2888494, 1.434284, -0.2983646, 1, 1, 1, 1, 1,
-0.288738, 0.1091968, -2.49587, 1, 1, 1, 1, 1,
-0.2829707, -2.816765, -2.629996, 1, 1, 1, 1, 1,
-0.2779118, -0.3147752, -2.786679, 1, 1, 1, 1, 1,
-0.2735535, 0.780087, -1.711913, 1, 1, 1, 1, 1,
-0.2693397, 0.4025733, 0.3234245, 1, 1, 1, 1, 1,
-0.2672164, 1.689348, 1.403237, 1, 1, 1, 1, 1,
-0.2634041, 0.4842082, -1.135533, 0, 0, 1, 1, 1,
-0.2631785, -1.27005, -2.891711, 1, 0, 0, 1, 1,
-0.2625259, 1.397018, 1.265962, 1, 0, 0, 1, 1,
-0.261845, 0.565128, 0.5198211, 1, 0, 0, 1, 1,
-0.2580776, -0.4583072, -4.121801, 1, 0, 0, 1, 1,
-0.2578377, -0.1626577, -0.9756141, 1, 0, 0, 1, 1,
-0.2490736, 0.1442034, -1.040609, 0, 0, 0, 1, 1,
-0.2467724, -0.4711686, -2.041501, 0, 0, 0, 1, 1,
-0.2457008, 0.839514, -0.7368427, 0, 0, 0, 1, 1,
-0.2444586, -0.03893818, -1.980378, 0, 0, 0, 1, 1,
-0.2394751, -0.5721134, -3.384348, 0, 0, 0, 1, 1,
-0.2383762, -0.2861451, -2.941682, 0, 0, 0, 1, 1,
-0.2374593, 0.1320694, -0.4621004, 0, 0, 0, 1, 1,
-0.2372767, 0.1056906, -2.358629, 1, 1, 1, 1, 1,
-0.2351187, -1.319184, -2.04234, 1, 1, 1, 1, 1,
-0.233868, 1.220253, 0.6279265, 1, 1, 1, 1, 1,
-0.2299237, -0.1424535, -2.277888, 1, 1, 1, 1, 1,
-0.2191887, -0.1970205, -2.661872, 1, 1, 1, 1, 1,
-0.2173698, 0.8856225, 0.8160421, 1, 1, 1, 1, 1,
-0.210824, 0.3967526, 0.1290079, 1, 1, 1, 1, 1,
-0.2056194, -0.4099818, -1.993103, 1, 1, 1, 1, 1,
-0.2045299, 0.8727502, -0.2273704, 1, 1, 1, 1, 1,
-0.202855, -0.4382851, -2.556452, 1, 1, 1, 1, 1,
-0.2023463, 1.392295, 0.3688253, 1, 1, 1, 1, 1,
-0.2001744, 1.375856, 0.4472286, 1, 1, 1, 1, 1,
-0.1961975, -0.3792686, -5.028681, 1, 1, 1, 1, 1,
-0.1891258, 1.88501, 1.472016, 1, 1, 1, 1, 1,
-0.188698, 0.9611546, 0.03088879, 1, 1, 1, 1, 1,
-0.1885221, -0.7186673, -2.166766, 0, 0, 1, 1, 1,
-0.1884733, 0.05496549, -1.292418, 1, 0, 0, 1, 1,
-0.1878165, 0.6056565, -0.007861867, 1, 0, 0, 1, 1,
-0.1867341, -0.3238598, -2.187672, 1, 0, 0, 1, 1,
-0.1814969, 0.9297662, 0.04429857, 1, 0, 0, 1, 1,
-0.1810545, -1.980071, -3.294624, 1, 0, 0, 1, 1,
-0.1803107, 0.07175519, -2.568692, 0, 0, 0, 1, 1,
-0.177167, 1.301093, 0.9510964, 0, 0, 0, 1, 1,
-0.177107, 0.2575856, -1.234617, 0, 0, 0, 1, 1,
-0.1750152, -0.7943565, -3.612447, 0, 0, 0, 1, 1,
-0.1716833, -0.4912816, -1.944544, 0, 0, 0, 1, 1,
-0.1716203, 1.613938, -0.4868536, 0, 0, 0, 1, 1,
-0.1714056, -0.6791078, -3.241936, 0, 0, 0, 1, 1,
-0.1713685, -1.440439, -4.402934, 1, 1, 1, 1, 1,
-0.1664652, 0.781454, -0.5790023, 1, 1, 1, 1, 1,
-0.1642223, -1.587051, -3.097477, 1, 1, 1, 1, 1,
-0.1581308, -0.9884104, -1.604582, 1, 1, 1, 1, 1,
-0.1525082, -0.1666854, -2.205423, 1, 1, 1, 1, 1,
-0.1500132, -1.868022, -1.597139, 1, 1, 1, 1, 1,
-0.1451571, 1.62555, 0.2423869, 1, 1, 1, 1, 1,
-0.1437626, -0.3800514, -2.802095, 1, 1, 1, 1, 1,
-0.1424849, 0.7463191, -1.363171, 1, 1, 1, 1, 1,
-0.1385935, 0.2472391, 2.480076, 1, 1, 1, 1, 1,
-0.1383997, 0.4464627, -0.2702212, 1, 1, 1, 1, 1,
-0.1353848, 1.371968, -0.393906, 1, 1, 1, 1, 1,
-0.1322764, 0.1037121, 1.381594, 1, 1, 1, 1, 1,
-0.1322686, -1.050944, -4.373103, 1, 1, 1, 1, 1,
-0.1316533, 0.6424568, 1.064003, 1, 1, 1, 1, 1,
-0.130816, 0.850967, -2.811942, 0, 0, 1, 1, 1,
-0.1289334, 1.433957, -1.254905, 1, 0, 0, 1, 1,
-0.1234721, -0.4657195, -1.139532, 1, 0, 0, 1, 1,
-0.1134105, -0.3134228, -3.235884, 1, 0, 0, 1, 1,
-0.1133565, -0.1236896, -2.153591, 1, 0, 0, 1, 1,
-0.1127634, -0.0314713, -0.4095959, 1, 0, 0, 1, 1,
-0.111048, 1.374786, 0.1420382, 0, 0, 0, 1, 1,
-0.1087908, 0.2855467, 0.6655061, 0, 0, 0, 1, 1,
-0.1083448, -1.587077, -3.737866, 0, 0, 0, 1, 1,
-0.1075902, -0.393853, -3.04495, 0, 0, 0, 1, 1,
-0.1056364, 1.046266, 0.5335804, 0, 0, 0, 1, 1,
-0.1028264, 2.038915, -0.5659422, 0, 0, 0, 1, 1,
-0.09794178, 0.3034427, -1.872954, 0, 0, 0, 1, 1,
-0.09730019, -0.3194302, -1.813402, 1, 1, 1, 1, 1,
-0.09520496, 0.001526237, -3.114598, 1, 1, 1, 1, 1,
-0.08772253, -0.6001685, -2.618183, 1, 1, 1, 1, 1,
-0.08667713, 1.037598, -1.493593, 1, 1, 1, 1, 1,
-0.08595636, -0.2354432, -2.827572, 1, 1, 1, 1, 1,
-0.08186016, -1.054623, -2.835983, 1, 1, 1, 1, 1,
-0.08074655, 0.925516, -0.3552348, 1, 1, 1, 1, 1,
-0.08055998, -0.7504637, -3.143016, 1, 1, 1, 1, 1,
-0.07634971, 0.9178791, 1.037889, 1, 1, 1, 1, 1,
-0.07355974, -1.040426, -3.911981, 1, 1, 1, 1, 1,
-0.0688042, -0.4274287, -4.589614, 1, 1, 1, 1, 1,
-0.06769603, 0.4040223, 0.542845, 1, 1, 1, 1, 1,
-0.06711885, 0.6398764, -0.2763298, 1, 1, 1, 1, 1,
-0.06560305, -1.66304, -2.28883, 1, 1, 1, 1, 1,
-0.05902781, 0.3922618, -0.05373269, 1, 1, 1, 1, 1,
-0.05673413, 1.200936, -0.9577754, 0, 0, 1, 1, 1,
-0.05572649, 0.7780793, 0.6166056, 1, 0, 0, 1, 1,
-0.05490837, -0.2456686, -1.775237, 1, 0, 0, 1, 1,
-0.05391874, -0.3145359, -3.072773, 1, 0, 0, 1, 1,
-0.05091249, -1.63689, -0.3234199, 1, 0, 0, 1, 1,
-0.04069937, 1.061258, -0.9022743, 1, 0, 0, 1, 1,
-0.03921449, -1.088835, -2.331071, 0, 0, 0, 1, 1,
-0.03633497, -1.020741, -1.279681, 0, 0, 0, 1, 1,
-0.02969158, 2.545287, -0.669333, 0, 0, 0, 1, 1,
-0.02947926, 1.392041, -1.292235, 0, 0, 0, 1, 1,
-0.02792696, 0.9711897, -0.4125131, 0, 0, 0, 1, 1,
-0.02229498, -0.2611339, -0.8480669, 0, 0, 0, 1, 1,
-0.02108192, -0.9601198, -3.529428, 0, 0, 0, 1, 1,
-0.02012344, 1.490982, -0.2657092, 1, 1, 1, 1, 1,
-0.01686906, -0.6983546, -3.614818, 1, 1, 1, 1, 1,
-0.01325005, 0.1096431, -0.31995, 1, 1, 1, 1, 1,
-0.007867672, 1.881521, -0.225509, 1, 1, 1, 1, 1,
0.0007303084, 0.2580296, -1.098791, 1, 1, 1, 1, 1,
0.002093225, 1.2508, -0.8002993, 1, 1, 1, 1, 1,
0.004898741, -1.083818, 4.076453, 1, 1, 1, 1, 1,
0.008454857, 1.129837, -0.4746901, 1, 1, 1, 1, 1,
0.008616788, -0.8826681, 3.115778, 1, 1, 1, 1, 1,
0.009990431, 0.3607033, 0.2348276, 1, 1, 1, 1, 1,
0.0114137, 0.3725214, 0.6535011, 1, 1, 1, 1, 1,
0.02207777, -0.678273, 0.9663572, 1, 1, 1, 1, 1,
0.03032864, 0.1256989, 0.4271445, 1, 1, 1, 1, 1,
0.03212993, 0.1859145, -0.3087896, 1, 1, 1, 1, 1,
0.03783315, -1.020315, 2.41559, 1, 1, 1, 1, 1,
0.04319309, -0.7099445, 3.313874, 0, 0, 1, 1, 1,
0.04384659, 0.5659214, -0.411055, 1, 0, 0, 1, 1,
0.04454779, 1.460259, -1.131302, 1, 0, 0, 1, 1,
0.04578551, 0.3818526, -1.473184, 1, 0, 0, 1, 1,
0.04738325, -0.3203711, 3.217262, 1, 0, 0, 1, 1,
0.0579837, 1.176988, -0.1836013, 1, 0, 0, 1, 1,
0.06586976, -0.8881903, 3.272136, 0, 0, 0, 1, 1,
0.06871502, 1.069911, 1.291679, 0, 0, 0, 1, 1,
0.07051385, -1.092852, 3.648402, 0, 0, 0, 1, 1,
0.07123794, 0.2837517, 1.276599, 0, 0, 0, 1, 1,
0.07131224, 0.4578132, -1.227351, 0, 0, 0, 1, 1,
0.0739136, 0.8161936, -0.5928439, 0, 0, 0, 1, 1,
0.07483739, -0.8601745, 1.853722, 0, 0, 0, 1, 1,
0.07691715, 0.8856508, -0.6415492, 1, 1, 1, 1, 1,
0.07882807, -0.40298, 2.546178, 1, 1, 1, 1, 1,
0.08570597, -0.3989162, 2.48761, 1, 1, 1, 1, 1,
0.09106886, 2.105462, -0.07408313, 1, 1, 1, 1, 1,
0.09151872, -0.5478134, 3.313044, 1, 1, 1, 1, 1,
0.09576809, 0.1282291, -0.2646044, 1, 1, 1, 1, 1,
0.09761579, -0.2538486, 2.516557, 1, 1, 1, 1, 1,
0.09782214, -2.11971, 2.615074, 1, 1, 1, 1, 1,
0.1017871, 0.737775, -0.1011074, 1, 1, 1, 1, 1,
0.1045768, 0.9153581, -0.3803127, 1, 1, 1, 1, 1,
0.1056471, 0.2631157, 1.371098, 1, 1, 1, 1, 1,
0.1057539, 0.2238226, -0.4870385, 1, 1, 1, 1, 1,
0.108315, 0.3742606, 3.543569, 1, 1, 1, 1, 1,
0.1171925, 1.088135, -0.314953, 1, 1, 1, 1, 1,
0.1250695, 0.309498, -0.8208426, 1, 1, 1, 1, 1,
0.1254492, 0.1788722, -0.208593, 0, 0, 1, 1, 1,
0.127352, 2.140113, 0.2029401, 1, 0, 0, 1, 1,
0.1291955, -0.02349826, 3.350821, 1, 0, 0, 1, 1,
0.1294855, 0.5933017, -0.04308604, 1, 0, 0, 1, 1,
0.131768, 1.164516, -0.9818325, 1, 0, 0, 1, 1,
0.1320097, -0.3391222, 3.336695, 1, 0, 0, 1, 1,
0.132668, 0.2365555, 2.782689, 0, 0, 0, 1, 1,
0.132686, -1.733848, 2.735619, 0, 0, 0, 1, 1,
0.1327007, 0.4383992, 0.1250196, 0, 0, 0, 1, 1,
0.1399794, -1.32417, 1.608889, 0, 0, 0, 1, 1,
0.1420129, -0.1006826, 1.722048, 0, 0, 0, 1, 1,
0.1475092, -1.274592, 4.757533, 0, 0, 0, 1, 1,
0.1475702, 0.401215, 1.755851, 0, 0, 0, 1, 1,
0.1487297, -0.7589958, 2.310089, 1, 1, 1, 1, 1,
0.150722, -1.746397, 3.445936, 1, 1, 1, 1, 1,
0.1509462, 0.9376338, 0.07113922, 1, 1, 1, 1, 1,
0.1538754, -1.607814, 3.819249, 1, 1, 1, 1, 1,
0.1566656, 0.4472842, 1.884014, 1, 1, 1, 1, 1,
0.1579777, -1.257813, 4.336502, 1, 1, 1, 1, 1,
0.1584804, -0.1939929, 0.2188315, 1, 1, 1, 1, 1,
0.160026, 0.3394928, 2.085803, 1, 1, 1, 1, 1,
0.1618504, 0.3918351, 0.4325006, 1, 1, 1, 1, 1,
0.1632867, -0.6438984, 3.490642, 1, 1, 1, 1, 1,
0.1639274, 0.02658728, 2.311357, 1, 1, 1, 1, 1,
0.1642438, 0.8588519, 2.191627, 1, 1, 1, 1, 1,
0.1649285, -0.9309208, 4.17219, 1, 1, 1, 1, 1,
0.1662861, 0.9732683, -0.8202723, 1, 1, 1, 1, 1,
0.1664004, -0.9123341, 2.595512, 1, 1, 1, 1, 1,
0.1689768, -0.07224675, 4.041463, 0, 0, 1, 1, 1,
0.1694908, 0.8611825, 2.676097, 1, 0, 0, 1, 1,
0.1713614, -0.6576112, 4.663426, 1, 0, 0, 1, 1,
0.1731538, 1.687809, 0.6914409, 1, 0, 0, 1, 1,
0.1733884, 1.527258, -1.411598, 1, 0, 0, 1, 1,
0.173584, 0.04658969, 0.3074098, 1, 0, 0, 1, 1,
0.174168, 0.1596748, -0.9625449, 0, 0, 0, 1, 1,
0.1744593, -0.3715716, 4.648631, 0, 0, 0, 1, 1,
0.1761952, -2.659604, 2.75036, 0, 0, 0, 1, 1,
0.1776814, 1.010852, 0.2716356, 0, 0, 0, 1, 1,
0.1800445, -0.6926862, 2.224564, 0, 0, 0, 1, 1,
0.1804142, 0.643155, -0.3140718, 0, 0, 0, 1, 1,
0.1837491, -0.2704737, 2.127948, 0, 0, 0, 1, 1,
0.1871476, 0.6459362, 0.4394557, 1, 1, 1, 1, 1,
0.1874825, 0.389719, 1.301712, 1, 1, 1, 1, 1,
0.1899484, -0.9418808, 2.932901, 1, 1, 1, 1, 1,
0.1915282, 1.237706, 0.4605029, 1, 1, 1, 1, 1,
0.1969105, -0.2514264, 3.38727, 1, 1, 1, 1, 1,
0.1974203, -1.019185, 2.856525, 1, 1, 1, 1, 1,
0.2049018, 0.2892591, 1.300271, 1, 1, 1, 1, 1,
0.2056779, -1.075326, 3.027026, 1, 1, 1, 1, 1,
0.2093363, -0.4311209, 3.179415, 1, 1, 1, 1, 1,
0.2099242, 1.066621, -0.4669779, 1, 1, 1, 1, 1,
0.2123019, 0.9594653, -2.075719, 1, 1, 1, 1, 1,
0.2212944, -2.124892, 4.637857, 1, 1, 1, 1, 1,
0.223521, -1.28407, 5.349924, 1, 1, 1, 1, 1,
0.2252874, -3.056339, 3.480288, 1, 1, 1, 1, 1,
0.2314899, -0.2568679, 3.086186, 1, 1, 1, 1, 1,
0.2335654, 0.8973646, -0.6999318, 0, 0, 1, 1, 1,
0.2355649, 1.207384, -0.6166412, 1, 0, 0, 1, 1,
0.2357322, -0.6251148, 4.431357, 1, 0, 0, 1, 1,
0.2396879, 0.9334335, -1.669717, 1, 0, 0, 1, 1,
0.2408907, -0.7964194, 2.917828, 1, 0, 0, 1, 1,
0.2469581, -1.371042, 4.859253, 1, 0, 0, 1, 1,
0.2525175, 0.8406366, 1.602213, 0, 0, 0, 1, 1,
0.255529, 0.6387357, -1.632692, 0, 0, 0, 1, 1,
0.2563777, -0.3746104, 1.820817, 0, 0, 0, 1, 1,
0.2576455, -1.767662, 3.479024, 0, 0, 0, 1, 1,
0.265005, 0.07322089, 1.568052, 0, 0, 0, 1, 1,
0.2731215, -1.620039, 4.979931, 0, 0, 0, 1, 1,
0.2743197, -0.9734382, 0.9213949, 0, 0, 0, 1, 1,
0.2756966, -0.1529218, 2.104496, 1, 1, 1, 1, 1,
0.2767412, 1.109014, -0.6476494, 1, 1, 1, 1, 1,
0.2767717, -0.2693379, 3.100155, 1, 1, 1, 1, 1,
0.27699, 0.8412591, 0.6762781, 1, 1, 1, 1, 1,
0.2824487, 0.574478, 0.3656374, 1, 1, 1, 1, 1,
0.2830826, -1.409035, 5.563582, 1, 1, 1, 1, 1,
0.2840403, 0.2394153, 1.195976, 1, 1, 1, 1, 1,
0.2843499, -0.03086363, 2.546622, 1, 1, 1, 1, 1,
0.2851188, -2.052555, 1.707727, 1, 1, 1, 1, 1,
0.285674, 1.198384, -0.6868073, 1, 1, 1, 1, 1,
0.2859794, 0.6373085, 1.148897, 1, 1, 1, 1, 1,
0.2871659, 0.107176, 2.150564, 1, 1, 1, 1, 1,
0.2900206, 0.1249362, 0.287836, 1, 1, 1, 1, 1,
0.2954966, -1.18914, 4.514833, 1, 1, 1, 1, 1,
0.2960209, 1.161625, 1.972096, 1, 1, 1, 1, 1,
0.2968311, -0.3575915, 2.406111, 0, 0, 1, 1, 1,
0.3008206, 1.033694, 0.3218391, 1, 0, 0, 1, 1,
0.3040242, 1.682947, -0.5840772, 1, 0, 0, 1, 1,
0.3040922, -0.6201411, 2.264711, 1, 0, 0, 1, 1,
0.306588, -0.9625792, 2.655441, 1, 0, 0, 1, 1,
0.3094653, 1.281882, 1.03056, 1, 0, 0, 1, 1,
0.3097042, -0.1274011, 1.430672, 0, 0, 0, 1, 1,
0.309905, 0.937589, 0.8414125, 0, 0, 0, 1, 1,
0.3118488, 0.2031585, 0.3406641, 0, 0, 0, 1, 1,
0.3154587, -0.4953435, 3.751814, 0, 0, 0, 1, 1,
0.3165065, 0.3462039, 1.964976, 0, 0, 0, 1, 1,
0.3206134, 1.418381, 0.7728926, 0, 0, 0, 1, 1,
0.3215982, 0.5324199, -0.4556448, 0, 0, 0, 1, 1,
0.3305478, -0.6182021, 1.061613, 1, 1, 1, 1, 1,
0.333014, -0.3882308, 3.786738, 1, 1, 1, 1, 1,
0.3390265, -0.3594973, 1.957167, 1, 1, 1, 1, 1,
0.340162, -0.8756317, 3.237822, 1, 1, 1, 1, 1,
0.3407472, -0.1863123, 2.898632, 1, 1, 1, 1, 1,
0.344116, -0.4489375, 2.848962, 1, 1, 1, 1, 1,
0.349965, 0.5111707, 1.232262, 1, 1, 1, 1, 1,
0.3511175, -3.656848, 3.142184, 1, 1, 1, 1, 1,
0.3561097, -0.9496999, 4.300967, 1, 1, 1, 1, 1,
0.3584154, -0.05176221, -0.5215714, 1, 1, 1, 1, 1,
0.3595026, 1.200778, 1.652595, 1, 1, 1, 1, 1,
0.3595969, -0.5959908, 3.267424, 1, 1, 1, 1, 1,
0.3606091, 0.7632679, 1.240606, 1, 1, 1, 1, 1,
0.3616114, -0.1573728, 3.651028, 1, 1, 1, 1, 1,
0.3629324, 0.2074046, -0.5775885, 1, 1, 1, 1, 1,
0.3675665, -1.008733, 3.460897, 0, 0, 1, 1, 1,
0.3677811, -1.057135, 2.657863, 1, 0, 0, 1, 1,
0.3687551, 1.382018, 1.05841, 1, 0, 0, 1, 1,
0.3698202, 2.025755, 0.7657987, 1, 0, 0, 1, 1,
0.3711296, -0.2910801, 2.60222, 1, 0, 0, 1, 1,
0.3712279, -1.626528, 1.725699, 1, 0, 0, 1, 1,
0.3790565, -1.007687, 3.008506, 0, 0, 0, 1, 1,
0.3873165, -0.3772712, 3.129619, 0, 0, 0, 1, 1,
0.3905841, -0.4878574, 1.323503, 0, 0, 0, 1, 1,
0.3908732, -1.145237, 1.681481, 0, 0, 0, 1, 1,
0.3949296, 2.284757, 1.258488, 0, 0, 0, 1, 1,
0.3978334, -0.8751696, 3.685448, 0, 0, 0, 1, 1,
0.3979247, 0.007876782, 1.019429, 0, 0, 0, 1, 1,
0.3984281, -0.5370488, 3.102369, 1, 1, 1, 1, 1,
0.4048675, -0.02209654, 3.006178, 1, 1, 1, 1, 1,
0.4091015, -0.5769615, 2.510264, 1, 1, 1, 1, 1,
0.4115363, -1.013999, 3.276119, 1, 1, 1, 1, 1,
0.4122365, 0.09185776, 2.462938, 1, 1, 1, 1, 1,
0.4152516, -0.7224517, 2.226125, 1, 1, 1, 1, 1,
0.4157061, -0.5121961, 1.726259, 1, 1, 1, 1, 1,
0.4181098, -0.4279388, 3.177231, 1, 1, 1, 1, 1,
0.4206418, 0.8226886, -1.160547, 1, 1, 1, 1, 1,
0.4296021, 0.6572702, 0.3634959, 1, 1, 1, 1, 1,
0.4309364, -1.32003, 1.16104, 1, 1, 1, 1, 1,
0.4309775, 1.610315, 0.175438, 1, 1, 1, 1, 1,
0.4309931, 0.4455176, 3.044251, 1, 1, 1, 1, 1,
0.4346071, 1.119523, 0.08177339, 1, 1, 1, 1, 1,
0.4380811, -1.01745, 2.239017, 1, 1, 1, 1, 1,
0.4474916, 0.006023183, 0.7304249, 0, 0, 1, 1, 1,
0.4513986, -2.066181, 2.473181, 1, 0, 0, 1, 1,
0.4597176, -0.5964906, 3.790818, 1, 0, 0, 1, 1,
0.4608193, 0.3719668, 0.6699792, 1, 0, 0, 1, 1,
0.4644165, 0.6711091, 0.4176404, 1, 0, 0, 1, 1,
0.473344, -0.8573556, 2.676651, 1, 0, 0, 1, 1,
0.4733661, -0.9458474, 3.503285, 0, 0, 0, 1, 1,
0.4750157, 0.5820516, 0.1108629, 0, 0, 0, 1, 1,
0.4755709, -0.4310684, 2.586004, 0, 0, 0, 1, 1,
0.4763187, -0.3554002, 2.39835, 0, 0, 0, 1, 1,
0.4770069, -1.079821, 0.9420472, 0, 0, 0, 1, 1,
0.4774896, -0.08321245, 1.892704, 0, 0, 0, 1, 1,
0.4803395, 0.03890919, -0.4789993, 0, 0, 0, 1, 1,
0.490467, 1.200894, -0.7376616, 1, 1, 1, 1, 1,
0.490792, -0.5696021, 1.85713, 1, 1, 1, 1, 1,
0.4934231, -0.4121444, 2.28628, 1, 1, 1, 1, 1,
0.4961248, -0.8941412, 4.514822, 1, 1, 1, 1, 1,
0.4993145, -0.4422983, 0.4150741, 1, 1, 1, 1, 1,
0.5010176, -0.4297251, 2.957035, 1, 1, 1, 1, 1,
0.5023747, -0.2518878, 4.229539, 1, 1, 1, 1, 1,
0.5027574, 0.5485561, 2.524395, 1, 1, 1, 1, 1,
0.5061741, 0.8336833, 0.2842183, 1, 1, 1, 1, 1,
0.5165139, -0.6657404, 2.338017, 1, 1, 1, 1, 1,
0.5189419, -0.5195922, 3.407673, 1, 1, 1, 1, 1,
0.520413, 1.176093, 0.6702532, 1, 1, 1, 1, 1,
0.5210431, 0.1542579, 2.100032, 1, 1, 1, 1, 1,
0.5250101, -0.02336328, -0.2276013, 1, 1, 1, 1, 1,
0.5253586, 1.293444, 0.6041352, 1, 1, 1, 1, 1,
0.5265102, 0.01238304, 2.65975, 0, 0, 1, 1, 1,
0.5315018, 0.1324348, 4.078658, 1, 0, 0, 1, 1,
0.5351219, 1.281511, -0.2094415, 1, 0, 0, 1, 1,
0.5407514, 1.284125, -0.08261442, 1, 0, 0, 1, 1,
0.5440233, 0.6134492, 1.480493, 1, 0, 0, 1, 1,
0.5440243, -0.3331793, 3.28732, 1, 0, 0, 1, 1,
0.5452468, 0.2638795, 1.555475, 0, 0, 0, 1, 1,
0.5481303, 0.8268247, -0.29085, 0, 0, 0, 1, 1,
0.548482, -1.054935, 2.113254, 0, 0, 0, 1, 1,
0.5502185, 0.2718966, 1.725883, 0, 0, 0, 1, 1,
0.5553975, 0.008782523, 1.308085, 0, 0, 0, 1, 1,
0.5597327, 0.004920991, 1.667585, 0, 0, 0, 1, 1,
0.5632559, 0.3492611, -0.06553239, 0, 0, 0, 1, 1,
0.5634241, 0.4543222, 0.9926943, 1, 1, 1, 1, 1,
0.5665863, -0.2659544, 2.923248, 1, 1, 1, 1, 1,
0.5671675, 0.8719509, 2.220678, 1, 1, 1, 1, 1,
0.5693789, 1.651825, 1.389649, 1, 1, 1, 1, 1,
0.5709913, -1.417883, 2.057692, 1, 1, 1, 1, 1,
0.5723364, 0.9600213, -1.624257, 1, 1, 1, 1, 1,
0.5730087, -1.097161, 2.168779, 1, 1, 1, 1, 1,
0.5795734, 1.455697, 0.1644654, 1, 1, 1, 1, 1,
0.5854052, 0.5589463, 1.431948, 1, 1, 1, 1, 1,
0.5866277, -0.9114304, 5.052337, 1, 1, 1, 1, 1,
0.5879065, -2.153652, 3.942134, 1, 1, 1, 1, 1,
0.5992524, -0.5937631, 3.102355, 1, 1, 1, 1, 1,
0.6082315, 1.131563, 0.8742065, 1, 1, 1, 1, 1,
0.6133564, -1.154248, 2.428954, 1, 1, 1, 1, 1,
0.6140637, -1.245953, 1.662864, 1, 1, 1, 1, 1,
0.6143718, -0.09981398, 2.296562, 0, 0, 1, 1, 1,
0.6148652, -0.3396297, 1.931186, 1, 0, 0, 1, 1,
0.6187592, -0.1339453, 2.275662, 1, 0, 0, 1, 1,
0.6202493, 1.015664, 1.438333, 1, 0, 0, 1, 1,
0.6244956, -0.1621516, 1.13794, 1, 0, 0, 1, 1,
0.6274759, -0.6211506, 0.8793804, 1, 0, 0, 1, 1,
0.6300352, 0.6894343, 2.042525, 0, 0, 0, 1, 1,
0.6318551, 1.307097, -0.3266154, 0, 0, 0, 1, 1,
0.6401181, -1.881636, 1.686421, 0, 0, 0, 1, 1,
0.6509685, -0.6690815, 1.666082, 0, 0, 0, 1, 1,
0.6511395, -0.7442126, 3.205218, 0, 0, 0, 1, 1,
0.6536113, -0.7531003, 2.636756, 0, 0, 0, 1, 1,
0.6575918, 0.04938778, 2.346475, 0, 0, 0, 1, 1,
0.6694381, -2.228164, 1.568038, 1, 1, 1, 1, 1,
0.6707979, -0.04153373, 2.707423, 1, 1, 1, 1, 1,
0.6750053, -0.3888296, 0.4125591, 1, 1, 1, 1, 1,
0.6764106, -0.5127819, 1.543798, 1, 1, 1, 1, 1,
0.6792355, -0.8705233, 2.123976, 1, 1, 1, 1, 1,
0.6796572, -0.318504, 0.8352442, 1, 1, 1, 1, 1,
0.6800227, 0.4225003, 2.496087, 1, 1, 1, 1, 1,
0.6836607, 1.305315, 0.3966315, 1, 1, 1, 1, 1,
0.6866425, 1.618713, 1.423549, 1, 1, 1, 1, 1,
0.6888745, -0.2672637, 2.746274, 1, 1, 1, 1, 1,
0.6938967, 0.2065274, 2.304888, 1, 1, 1, 1, 1,
0.6942065, -1.016933, 3.128552, 1, 1, 1, 1, 1,
0.6983927, -1.352712, 3.524668, 1, 1, 1, 1, 1,
0.6989675, -1.777364, 2.144773, 1, 1, 1, 1, 1,
0.7011461, -1.168597, 2.906975, 1, 1, 1, 1, 1,
0.7046714, -0.01832288, 0.7324464, 0, 0, 1, 1, 1,
0.7047217, -0.294659, 1.550305, 1, 0, 0, 1, 1,
0.7062907, 0.2505153, 1.782184, 1, 0, 0, 1, 1,
0.7068083, -1.165238, 0.8548869, 1, 0, 0, 1, 1,
0.7076488, -1.217723, 3.859465, 1, 0, 0, 1, 1,
0.7102384, 0.767728, 1.908638, 1, 0, 0, 1, 1,
0.7151532, 0.02550196, 1.967433, 0, 0, 0, 1, 1,
0.7230141, 0.8616742, -0.9637047, 0, 0, 0, 1, 1,
0.7342254, -1.611997, 1.952855, 0, 0, 0, 1, 1,
0.7427823, -3.20253, 4.128439, 0, 0, 0, 1, 1,
0.7445042, 2.240553, 1.463973, 0, 0, 0, 1, 1,
0.7465076, 0.4188617, 1.860036, 0, 0, 0, 1, 1,
0.7503138, -0.1045932, 3.54358, 0, 0, 0, 1, 1,
0.752388, 0.6431282, 0.4981351, 1, 1, 1, 1, 1,
0.7524348, -0.4147649, 2.600303, 1, 1, 1, 1, 1,
0.7525673, 1.058085, 1.0005, 1, 1, 1, 1, 1,
0.7597523, -0.380201, 2.069859, 1, 1, 1, 1, 1,
0.7693855, -0.02707694, 1.376693, 1, 1, 1, 1, 1,
0.769917, -0.7923729, 1.813599, 1, 1, 1, 1, 1,
0.7721253, 1.571074, 0.7129838, 1, 1, 1, 1, 1,
0.7731149, 0.2007883, 2.427469, 1, 1, 1, 1, 1,
0.7751184, 0.2024743, 0.479978, 1, 1, 1, 1, 1,
0.7794044, -0.1001981, 1.139791, 1, 1, 1, 1, 1,
0.7832578, 0.133576, 1.598165, 1, 1, 1, 1, 1,
0.7847944, 0.2697566, 3.052173, 1, 1, 1, 1, 1,
0.7889916, 0.4924549, 0.3953377, 1, 1, 1, 1, 1,
0.8004982, 1.477213, 1.317858, 1, 1, 1, 1, 1,
0.8019535, -1.745946, 3.433237, 1, 1, 1, 1, 1,
0.8022381, 0.5947691, 2.878096, 0, 0, 1, 1, 1,
0.8084669, -0.03848029, 1.749365, 1, 0, 0, 1, 1,
0.8156393, -0.3585441, 0.624859, 1, 0, 0, 1, 1,
0.815824, -3.348803, 2.791897, 1, 0, 0, 1, 1,
0.8171421, 1.13606, 0.907218, 1, 0, 0, 1, 1,
0.8181848, -1.534417, 4.414183, 1, 0, 0, 1, 1,
0.8200379, 0.2501628, 0.2304406, 0, 0, 0, 1, 1,
0.8225428, -0.645753, 1.904568, 0, 0, 0, 1, 1,
0.8246798, -0.2974424, 3.164174, 0, 0, 0, 1, 1,
0.8265497, -0.5055491, 1.769635, 0, 0, 0, 1, 1,
0.8338472, -0.1879716, 1.589149, 0, 0, 0, 1, 1,
0.8343645, -0.7804851, 2.14781, 0, 0, 0, 1, 1,
0.8351819, -1.270054, 0.1452761, 0, 0, 0, 1, 1,
0.8384851, 1.120779, 1.07889, 1, 1, 1, 1, 1,
0.8392863, 0.6461679, 2.476017, 1, 1, 1, 1, 1,
0.8396503, 0.5734805, 0.3577486, 1, 1, 1, 1, 1,
0.8398496, 0.1081606, 0.6629828, 1, 1, 1, 1, 1,
0.841465, 0.02154656, 1.878536, 1, 1, 1, 1, 1,
0.8453752, -0.294654, 3.77668, 1, 1, 1, 1, 1,
0.8480973, 1.01173, 0.07281218, 1, 1, 1, 1, 1,
0.8506368, 2.182594, 1.437261, 1, 1, 1, 1, 1,
0.8582551, 0.7266931, 0.134628, 1, 1, 1, 1, 1,
0.8590642, 1.62371, 0.5532265, 1, 1, 1, 1, 1,
0.8618472, -0.5914949, 1.370138, 1, 1, 1, 1, 1,
0.8673891, -0.7176728, 2.575136, 1, 1, 1, 1, 1,
0.870209, -0.4475667, 2.471593, 1, 1, 1, 1, 1,
0.874017, 0.8532033, 0.6445359, 1, 1, 1, 1, 1,
0.8822708, -0.5283528, 1.368402, 1, 1, 1, 1, 1,
0.8840855, -1.832397, 2.24246, 0, 0, 1, 1, 1,
0.8842214, -0.4678812, 0.9097039, 1, 0, 0, 1, 1,
0.8900925, -0.9038969, 2.24506, 1, 0, 0, 1, 1,
0.8905561, -1.060541, 3.144816, 1, 0, 0, 1, 1,
0.8933741, -0.2573762, 2.384237, 1, 0, 0, 1, 1,
0.8937507, -2.145001, 2.655423, 1, 0, 0, 1, 1,
0.8943371, 1.139156, -0.1151301, 0, 0, 0, 1, 1,
0.8988422, -0.477058, 2.524254, 0, 0, 0, 1, 1,
0.8993871, 0.8453612, 1.312971, 0, 0, 0, 1, 1,
0.9019328, 0.2050574, 0.9401324, 0, 0, 0, 1, 1,
0.9027789, 0.4754587, -1.756854, 0, 0, 0, 1, 1,
0.9111326, -1.554157, 2.046027, 0, 0, 0, 1, 1,
0.9113204, -0.1315245, 2.485828, 0, 0, 0, 1, 1,
0.9123584, -0.2666816, 3.823819, 1, 1, 1, 1, 1,
0.9139349, 0.5755351, -0.1770151, 1, 1, 1, 1, 1,
0.91637, -0.1707264, 1.320499, 1, 1, 1, 1, 1,
0.918491, -0.004862384, 0.02743074, 1, 1, 1, 1, 1,
0.9201498, -0.4379402, 2.600789, 1, 1, 1, 1, 1,
0.9307897, 2.33319, 0.1813227, 1, 1, 1, 1, 1,
0.9328834, 0.7356877, 0.1902814, 1, 1, 1, 1, 1,
0.934164, -0.384774, 2.403391, 1, 1, 1, 1, 1,
0.9476268, -1.049377, 2.120187, 1, 1, 1, 1, 1,
0.9478709, 1.025852, -0.01250759, 1, 1, 1, 1, 1,
0.9506488, -0.1919135, 1.420235, 1, 1, 1, 1, 1,
0.9604149, 0.5687786, 0.7616913, 1, 1, 1, 1, 1,
0.9692049, -0.1773435, 3.142481, 1, 1, 1, 1, 1,
0.9785442, -0.2039634, 2.136395, 1, 1, 1, 1, 1,
0.9788838, -0.4121034, 3.025475, 1, 1, 1, 1, 1,
0.983353, -1.462231, 0.515865, 0, 0, 1, 1, 1,
0.9866341, -0.4349928, 1.668456, 1, 0, 0, 1, 1,
0.9928538, 0.3021073, 0.5330895, 1, 0, 0, 1, 1,
0.9993657, -0.1942626, 2.787095, 1, 0, 0, 1, 1,
1.001334, 0.9028148, 1.036662, 1, 0, 0, 1, 1,
1.004994, -0.4771142, 2.127163, 1, 0, 0, 1, 1,
1.009653, 0.0550212, 2.854506, 0, 0, 0, 1, 1,
1.033165, -0.3588371, 0.6473125, 0, 0, 0, 1, 1,
1.034906, -0.05527028, -1.324003, 0, 0, 0, 1, 1,
1.042082, 0.5933831, 0.2630593, 0, 0, 0, 1, 1,
1.047677, 0.175093, 1.788844, 0, 0, 0, 1, 1,
1.049233, -1.084618, 1.436767, 0, 0, 0, 1, 1,
1.053457, 0.2761293, 0.2717921, 0, 0, 0, 1, 1,
1.061175, -0.05047007, 0.9900586, 1, 1, 1, 1, 1,
1.063798, -0.3638099, 1.849463, 1, 1, 1, 1, 1,
1.063853, -0.4050641, 1.084399, 1, 1, 1, 1, 1,
1.06711, 0.1922216, 1.507974, 1, 1, 1, 1, 1,
1.067273, -0.7012486, 1.296569, 1, 1, 1, 1, 1,
1.081306, -1.301961, 1.225455, 1, 1, 1, 1, 1,
1.093925, -0.9236899, 1.056726, 1, 1, 1, 1, 1,
1.102439, -0.2605784, 1.349728, 1, 1, 1, 1, 1,
1.104291, 0.3499726, 1.546276, 1, 1, 1, 1, 1,
1.105938, 1.535374, 1.249859, 1, 1, 1, 1, 1,
1.108066, -0.6852047, 2.831825, 1, 1, 1, 1, 1,
1.108955, 0.3088454, 1.930864, 1, 1, 1, 1, 1,
1.127421, -1.696329, 2.719967, 1, 1, 1, 1, 1,
1.128607, -0.6538159, 1.096357, 1, 1, 1, 1, 1,
1.132311, -1.763702, 2.221229, 1, 1, 1, 1, 1,
1.135094, -0.6880002, 1.862316, 0, 0, 1, 1, 1,
1.152568, -0.4553595, 1.534353, 1, 0, 0, 1, 1,
1.153891, 0.8071415, 1.595274, 1, 0, 0, 1, 1,
1.156645, -1.439742, 1.232822, 1, 0, 0, 1, 1,
1.168504, 0.9796934, 1.346249, 1, 0, 0, 1, 1,
1.175089, 1.521208, -0.2536775, 1, 0, 0, 1, 1,
1.176473, 1.060985, 0.9169651, 0, 0, 0, 1, 1,
1.179719, 1.102588, 0.2674525, 0, 0, 0, 1, 1,
1.181472, 0.08387011, -0.7014496, 0, 0, 0, 1, 1,
1.183466, -0.8390442, 4.32083, 0, 0, 0, 1, 1,
1.187938, -0.7417942, 1.730735, 0, 0, 0, 1, 1,
1.190007, -0.3640051, 0.7634863, 0, 0, 0, 1, 1,
1.191405, -1.334926, 3.506915, 0, 0, 0, 1, 1,
1.194408, -0.560536, 3.906152, 1, 1, 1, 1, 1,
1.196091, -1.606037, 2.00496, 1, 1, 1, 1, 1,
1.212298, -0.2152513, 0.4522612, 1, 1, 1, 1, 1,
1.212783, 1.732999, 0.4783974, 1, 1, 1, 1, 1,
1.229877, -0.03991371, 3.796708, 1, 1, 1, 1, 1,
1.23067, 0.5077688, 2.118322, 1, 1, 1, 1, 1,
1.237591, -0.5688417, 2.801962, 1, 1, 1, 1, 1,
1.250956, 1.07149, 1.971275, 1, 1, 1, 1, 1,
1.260657, -0.8251708, 0.9013042, 1, 1, 1, 1, 1,
1.265206, -0.1358475, 1.44847, 1, 1, 1, 1, 1,
1.272388, 0.4216249, -1.052227, 1, 1, 1, 1, 1,
1.273558, -0.1667718, 1.597626, 1, 1, 1, 1, 1,
1.276539, 0.08617637, 1.919265, 1, 1, 1, 1, 1,
1.281453, -1.033597, 2.816876, 1, 1, 1, 1, 1,
1.290829, 0.7519873, 1.141904, 1, 1, 1, 1, 1,
1.291032, 0.3276776, 0.2816939, 0, 0, 1, 1, 1,
1.293162, 0.2636785, 2.915647, 1, 0, 0, 1, 1,
1.295644, -0.5819399, 1.582276, 1, 0, 0, 1, 1,
1.295857, 0.718215, 1.834448, 1, 0, 0, 1, 1,
1.307349, -0.2626798, 0.804815, 1, 0, 0, 1, 1,
1.310343, 0.1737694, 3.294159, 1, 0, 0, 1, 1,
1.316866, -0.5929613, 1.494873, 0, 0, 0, 1, 1,
1.322244, 0.3350435, 0.9520436, 0, 0, 0, 1, 1,
1.330366, 1.591709, 0.8362701, 0, 0, 0, 1, 1,
1.334804, -2.690841, 0.9379081, 0, 0, 0, 1, 1,
1.340142, -1.638123, 2.373529, 0, 0, 0, 1, 1,
1.340291, 0.9764465, 3.048277, 0, 0, 0, 1, 1,
1.348337, 1.530385, -0.6617178, 0, 0, 0, 1, 1,
1.351335, 0.4117561, -0.4821208, 1, 1, 1, 1, 1,
1.357086, -1.045522, 2.221586, 1, 1, 1, 1, 1,
1.357916, 1.574011, -1.123507, 1, 1, 1, 1, 1,
1.360631, 1.238291, 1.191272, 1, 1, 1, 1, 1,
1.366153, -0.5971754, 3.191952, 1, 1, 1, 1, 1,
1.371746, -0.3494329, 2.161188, 1, 1, 1, 1, 1,
1.371795, 0.06320047, 2.717984, 1, 1, 1, 1, 1,
1.380154, 0.9760283, -0.3668432, 1, 1, 1, 1, 1,
1.382541, 0.4386837, 1.791658, 1, 1, 1, 1, 1,
1.382611, 0.3953367, 3.560238, 1, 1, 1, 1, 1,
1.382757, -0.8485848, 1.590088, 1, 1, 1, 1, 1,
1.385118, 1.147741, 1.29853, 1, 1, 1, 1, 1,
1.387712, -0.2877238, 3.615382, 1, 1, 1, 1, 1,
1.411202, -0.6280878, 1.659348, 1, 1, 1, 1, 1,
1.415864, -0.92434, 2.001093, 1, 1, 1, 1, 1,
1.42022, -0.6940366, 2.579341, 0, 0, 1, 1, 1,
1.42735, 0.8011929, 0.6423914, 1, 0, 0, 1, 1,
1.438891, -0.2555726, 2.874326, 1, 0, 0, 1, 1,
1.443614, -1.092874, 0.783933, 1, 0, 0, 1, 1,
1.459067, -0.5689573, 0.4265067, 1, 0, 0, 1, 1,
1.466878, -2.077886, 3.61376, 1, 0, 0, 1, 1,
1.473817, -0.1673586, 2.68251, 0, 0, 0, 1, 1,
1.476181, 1.315549, 2.094095, 0, 0, 0, 1, 1,
1.478717, -0.7648509, -0.001981834, 0, 0, 0, 1, 1,
1.48543, -1.353235, 1.543588, 0, 0, 0, 1, 1,
1.49426, -0.4088866, 2.556864, 0, 0, 0, 1, 1,
1.498999, -0.4483982, 0.285296, 0, 0, 0, 1, 1,
1.506749, 0.1627197, 1.05145, 0, 0, 0, 1, 1,
1.515108, -0.7746254, 2.419254, 1, 1, 1, 1, 1,
1.517863, 0.3895169, 1.33739, 1, 1, 1, 1, 1,
1.52496, -0.7045537, 0.7586966, 1, 1, 1, 1, 1,
1.542384, 0.4333013, -0.5509326, 1, 1, 1, 1, 1,
1.555123, -0.86176, 2.571796, 1, 1, 1, 1, 1,
1.555405, -0.9820194, 2.802028, 1, 1, 1, 1, 1,
1.557956, -1.125001, 2.903022, 1, 1, 1, 1, 1,
1.56444, -0.2229591, -1.359079, 1, 1, 1, 1, 1,
1.565345, 1.050816, 1.403584, 1, 1, 1, 1, 1,
1.586373, -0.2266676, 2.997821, 1, 1, 1, 1, 1,
1.593045, -1.511772, 2.910801, 1, 1, 1, 1, 1,
1.593146, -2.269387, 0.4599397, 1, 1, 1, 1, 1,
1.603795, -0.04878143, 1.434861, 1, 1, 1, 1, 1,
1.610694, 1.293033, 0.6119426, 1, 1, 1, 1, 1,
1.617377, 1.848228, -0.4163653, 1, 1, 1, 1, 1,
1.620134, 0.6606558, -0.4045167, 0, 0, 1, 1, 1,
1.624727, 2.317526, 1.733769, 1, 0, 0, 1, 1,
1.628054, -2.164398, 2.391883, 1, 0, 0, 1, 1,
1.639956, 0.9440483, -0.5237976, 1, 0, 0, 1, 1,
1.649164, -2.610795, 0.8070762, 1, 0, 0, 1, 1,
1.663998, 1.641884, 0.4719952, 1, 0, 0, 1, 1,
1.669897, 0.4852002, 2.063032, 0, 0, 0, 1, 1,
1.672139, -0.2987142, 0.6681038, 0, 0, 0, 1, 1,
1.682421, -0.933664, 1.874658, 0, 0, 0, 1, 1,
1.701322, 0.3903809, 2.336256, 0, 0, 0, 1, 1,
1.718999, 1.15291, 0.5574212, 0, 0, 0, 1, 1,
1.729276, 1.553238, 2.268666, 0, 0, 0, 1, 1,
1.734389, 1.477191, -0.6939712, 0, 0, 0, 1, 1,
1.749623, 1.458759, 0.9782414, 1, 1, 1, 1, 1,
1.774361, -0.07696113, 3.371795, 1, 1, 1, 1, 1,
1.778188, -1.883762, 1.550421, 1, 1, 1, 1, 1,
1.791194, -1.486748, 2.121186, 1, 1, 1, 1, 1,
1.817531, -2.39437, 4.558783, 1, 1, 1, 1, 1,
1.840307, 1.836594, 0.007928114, 1, 1, 1, 1, 1,
1.848486, 1.235888, 1.770353, 1, 1, 1, 1, 1,
1.859958, -1.528613, 1.360902, 1, 1, 1, 1, 1,
1.869391, 0.6413511, 2.583364, 1, 1, 1, 1, 1,
1.873878, 0.6425447, 0.555251, 1, 1, 1, 1, 1,
1.902053, 1.752918, 0.6336201, 1, 1, 1, 1, 1,
1.909651, 0.03839003, 1.929994, 1, 1, 1, 1, 1,
1.916093, -0.6391202, 1.280993, 1, 1, 1, 1, 1,
1.925675, 1.043002, 1.651154, 1, 1, 1, 1, 1,
1.927223, -1.628029, 0.4961092, 1, 1, 1, 1, 1,
1.950569, -0.420197, 2.453762, 0, 0, 1, 1, 1,
1.99986, 0.5228403, 0.3534361, 1, 0, 0, 1, 1,
2.004136, 0.5282168, 1.754148, 1, 0, 0, 1, 1,
2.005976, 0.3241575, 2.769826, 1, 0, 0, 1, 1,
2.045213, -0.0369573, 1.735579, 1, 0, 0, 1, 1,
2.090986, 0.5984179, 2.219208, 1, 0, 0, 1, 1,
2.098159, 1.969637, 0.7136281, 0, 0, 0, 1, 1,
2.129247, -1.620163, 0.9653085, 0, 0, 0, 1, 1,
2.131889, -1.69878, 1.736956, 0, 0, 0, 1, 1,
2.148401, -0.647591, 1.182309, 0, 0, 0, 1, 1,
2.182448, 0.01679623, 3.262169, 0, 0, 0, 1, 1,
2.281012, 0.3314314, 1.764975, 0, 0, 0, 1, 1,
2.361225, -0.9375737, 1.722501, 0, 0, 0, 1, 1,
2.363566, -1.013549, 0.5781586, 1, 1, 1, 1, 1,
2.370015, 0.4714297, 0.7404089, 1, 1, 1, 1, 1,
2.384475, -0.8392575, 1.617156, 1, 1, 1, 1, 1,
2.443427, -0.7479573, 1.916469, 1, 1, 1, 1, 1,
2.547987, 0.3638969, 1.841187, 1, 1, 1, 1, 1,
2.597081, -0.03874709, 3.127907, 1, 1, 1, 1, 1,
3.145868, 0.1102857, 3.170655, 1, 1, 1, 1, 1
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
var radius = 9.567184;
var distance = 33.60433;
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
mvMatrix.translate( 0.158138, 0.4759721, -0.2674508 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60433);
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
