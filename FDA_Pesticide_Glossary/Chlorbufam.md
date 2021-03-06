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
-3.585773, -0.6831921, -1.160906, 1, 0, 0, 1,
-3.051821, -0.9652546, -2.674387, 1, 0.007843138, 0, 1,
-3.046995, 0.2262206, -3.005668, 1, 0.01176471, 0, 1,
-2.592266, -0.0453042, -1.127689, 1, 0.01960784, 0, 1,
-2.474655, 0.01050497, -1.473279, 1, 0.02352941, 0, 1,
-2.429814, -0.3711276, -2.07564, 1, 0.03137255, 0, 1,
-2.418965, 0.7865059, -1.966508, 1, 0.03529412, 0, 1,
-2.402995, -0.3634851, -1.62892, 1, 0.04313726, 0, 1,
-2.347013, -1.321005, -2.023914, 1, 0.04705882, 0, 1,
-2.281293, 0.8876731, -1.132692, 1, 0.05490196, 0, 1,
-2.261349, 0.8533289, -3.377053, 1, 0.05882353, 0, 1,
-2.227044, -0.554285, -1.811931, 1, 0.06666667, 0, 1,
-2.210849, -1.420307, -2.608846, 1, 0.07058824, 0, 1,
-2.139459, 0.4134542, -0.6596491, 1, 0.07843138, 0, 1,
-2.091857, 0.2100565, -1.630823, 1, 0.08235294, 0, 1,
-2.07615, 0.4970119, -1.036581, 1, 0.09019608, 0, 1,
-2.056625, -0.9893093, -2.16291, 1, 0.09411765, 0, 1,
-2.020741, -0.5470198, -3.505583, 1, 0.1019608, 0, 1,
-2.011791, -0.1422691, -3.281833, 1, 0.1098039, 0, 1,
-1.96973, -0.1131027, -0.7674124, 1, 0.1137255, 0, 1,
-1.95417, -1.706943, -0.8945577, 1, 0.1215686, 0, 1,
-1.93857, 0.814539, -0.9557557, 1, 0.1254902, 0, 1,
-1.883638, 0.1202453, -2.383749, 1, 0.1333333, 0, 1,
-1.875041, -0.526985, -1.470172, 1, 0.1372549, 0, 1,
-1.805984, 1.361456, -2.050772, 1, 0.145098, 0, 1,
-1.800878, -0.2802103, -1.476758, 1, 0.1490196, 0, 1,
-1.786954, -1.0389, -1.740286, 1, 0.1568628, 0, 1,
-1.782227, -1.597362, -1.571952, 1, 0.1607843, 0, 1,
-1.773502, 1.06111, -0.246346, 1, 0.1686275, 0, 1,
-1.772578, 0.4420659, -1.409894, 1, 0.172549, 0, 1,
-1.771669, 2.449483, -0.6688443, 1, 0.1803922, 0, 1,
-1.767239, 0.1555094, -1.253805, 1, 0.1843137, 0, 1,
-1.763375, 1.133314, -2.07967, 1, 0.1921569, 0, 1,
-1.757082, 0.06637378, -0.6002799, 1, 0.1960784, 0, 1,
-1.74858, 0.8866733, 0.5733375, 1, 0.2039216, 0, 1,
-1.732945, -0.8150429, -1.107351, 1, 0.2117647, 0, 1,
-1.72203, 0.5444605, -0.8094154, 1, 0.2156863, 0, 1,
-1.691049, -0.4840035, -0.225098, 1, 0.2235294, 0, 1,
-1.681541, 0.3741577, -0.211843, 1, 0.227451, 0, 1,
-1.675219, -0.5501093, -4.030209, 1, 0.2352941, 0, 1,
-1.675215, 1.248993, -0.82594, 1, 0.2392157, 0, 1,
-1.675188, 1.058166, 0.2666454, 1, 0.2470588, 0, 1,
-1.660386, 0.9190104, -1.380845, 1, 0.2509804, 0, 1,
-1.659405, -1.917312, -2.598583, 1, 0.2588235, 0, 1,
-1.654962, -1.694333, -1.660965, 1, 0.2627451, 0, 1,
-1.652636, -0.6870291, -3.119284, 1, 0.2705882, 0, 1,
-1.652047, 0.1058942, -3.005946, 1, 0.2745098, 0, 1,
-1.634466, 0.1774039, -2.674159, 1, 0.282353, 0, 1,
-1.631555, -0.772724, -0.9854775, 1, 0.2862745, 0, 1,
-1.626431, -0.1879714, -2.876289, 1, 0.2941177, 0, 1,
-1.619601, 0.6969761, -1.774323, 1, 0.3019608, 0, 1,
-1.615862, -0.176691, -1.474332, 1, 0.3058824, 0, 1,
-1.582768, 0.5403982, -1.822812, 1, 0.3137255, 0, 1,
-1.543561, 0.4140506, 0.6000775, 1, 0.3176471, 0, 1,
-1.543299, -0.8711651, -0.8261575, 1, 0.3254902, 0, 1,
-1.537967, 2.297536, 1.314313, 1, 0.3294118, 0, 1,
-1.516484, 0.441715, -2.859548, 1, 0.3372549, 0, 1,
-1.516391, 0.5235025, 0.9433751, 1, 0.3411765, 0, 1,
-1.513753, -0.195127, -1.636142, 1, 0.3490196, 0, 1,
-1.513253, -0.1937378, -0.827756, 1, 0.3529412, 0, 1,
-1.51316, -1.533946, -3.128021, 1, 0.3607843, 0, 1,
-1.504553, -0.1947178, -2.879241, 1, 0.3647059, 0, 1,
-1.489552, 1.894837, -2.875462, 1, 0.372549, 0, 1,
-1.483072, -0.2201225, -1.248174, 1, 0.3764706, 0, 1,
-1.477485, -0.2605758, -0.5155408, 1, 0.3843137, 0, 1,
-1.468204, 0.4394025, -0.2649786, 1, 0.3882353, 0, 1,
-1.465004, -0.1072103, -3.467453, 1, 0.3960784, 0, 1,
-1.455896, 0.07196363, -0.7065918, 1, 0.4039216, 0, 1,
-1.455111, -0.5579225, -1.598989, 1, 0.4078431, 0, 1,
-1.430379, 0.03663644, -1.674136, 1, 0.4156863, 0, 1,
-1.429536, 1.554367, -2.114992, 1, 0.4196078, 0, 1,
-1.418186, -0.8093615, -1.073916, 1, 0.427451, 0, 1,
-1.414954, -0.5078173, -1.438213, 1, 0.4313726, 0, 1,
-1.408968, 1.764143, 0.1034824, 1, 0.4392157, 0, 1,
-1.397, -1.430701, -2.203285, 1, 0.4431373, 0, 1,
-1.394484, 1.51717, -2.430957, 1, 0.4509804, 0, 1,
-1.391358, 0.4517052, -1.380942, 1, 0.454902, 0, 1,
-1.389589, 0.3272198, -0.7117848, 1, 0.4627451, 0, 1,
-1.386495, 0.3270956, -1.46778, 1, 0.4666667, 0, 1,
-1.383968, -0.4281095, -1.982186, 1, 0.4745098, 0, 1,
-1.369828, -0.9412161, -2.277153, 1, 0.4784314, 0, 1,
-1.364458, -1.300825, -3.47379, 1, 0.4862745, 0, 1,
-1.353759, 0.9773222, 1.310897, 1, 0.4901961, 0, 1,
-1.329225, 1.323883, -0.4770537, 1, 0.4980392, 0, 1,
-1.327561, -0.2321182, -0.5115472, 1, 0.5058824, 0, 1,
-1.325637, 0.6604084, -3.005729, 1, 0.509804, 0, 1,
-1.319208, 1.40761, -1.774937, 1, 0.5176471, 0, 1,
-1.290608, 0.3430651, -1.381799, 1, 0.5215687, 0, 1,
-1.288756, -1.49449, -3.642939, 1, 0.5294118, 0, 1,
-1.283358, -0.2531231, -2.288872, 1, 0.5333334, 0, 1,
-1.282332, -0.2686811, -0.4840991, 1, 0.5411765, 0, 1,
-1.274439, -0.4175585, -3.649442, 1, 0.5450981, 0, 1,
-1.271425, -0.3294197, -2.685829, 1, 0.5529412, 0, 1,
-1.264073, -1.15405, -3.884746, 1, 0.5568628, 0, 1,
-1.253487, -0.7349817, -2.159096, 1, 0.5647059, 0, 1,
-1.252282, -0.3848825, -2.011868, 1, 0.5686275, 0, 1,
-1.251788, 0.09504817, -0.9850984, 1, 0.5764706, 0, 1,
-1.243756, -0.5502982, -3.861006, 1, 0.5803922, 0, 1,
-1.240833, -1.012808, 0.214086, 1, 0.5882353, 0, 1,
-1.224339, 0.4353585, -1.086512, 1, 0.5921569, 0, 1,
-1.219571, 1.425504, -0.3966405, 1, 0.6, 0, 1,
-1.215095, -0.02816857, -1.826786, 1, 0.6078432, 0, 1,
-1.208534, 1.265418, -0.4974301, 1, 0.6117647, 0, 1,
-1.194543, 2.667234, -0.7186401, 1, 0.6196079, 0, 1,
-1.192654, -1.176605, -1.6329, 1, 0.6235294, 0, 1,
-1.186435, 0.5550944, -2.157574, 1, 0.6313726, 0, 1,
-1.185069, 1.504686, -1.460563, 1, 0.6352941, 0, 1,
-1.181834, -1.703943, -0.7125539, 1, 0.6431373, 0, 1,
-1.175002, -0.8364529, -2.905354, 1, 0.6470588, 0, 1,
-1.173934, 0.7188427, -0.4395316, 1, 0.654902, 0, 1,
-1.172961, -1.583398, -0.6782436, 1, 0.6588235, 0, 1,
-1.172305, 1.555782, -2.03039, 1, 0.6666667, 0, 1,
-1.160002, 0.5979408, -1.83043, 1, 0.6705883, 0, 1,
-1.15717, -0.7733548, -2.255924, 1, 0.6784314, 0, 1,
-1.155467, 1.113621, -1.981173, 1, 0.682353, 0, 1,
-1.135928, -1.108066, -1.518766, 1, 0.6901961, 0, 1,
-1.132531, -1.046205, -0.3085721, 1, 0.6941177, 0, 1,
-1.126333, 0.6611124, -1.100433, 1, 0.7019608, 0, 1,
-1.120113, -2.679777, -3.743089, 1, 0.7098039, 0, 1,
-1.119268, 0.2962234, -1.83073, 1, 0.7137255, 0, 1,
-1.118213, -0.2633961, -1.990443, 1, 0.7215686, 0, 1,
-1.112261, 0.7885492, 0.4795383, 1, 0.7254902, 0, 1,
-1.111669, 2.616542, -0.3218991, 1, 0.7333333, 0, 1,
-1.107463, -1.272337, -3.49507, 1, 0.7372549, 0, 1,
-1.106464, -0.2794549, -3.281936, 1, 0.7450981, 0, 1,
-1.103392, 0.3155863, -2.979909, 1, 0.7490196, 0, 1,
-1.102104, -0.05992575, -3.845232, 1, 0.7568628, 0, 1,
-1.095964, -0.1028872, -0.03017969, 1, 0.7607843, 0, 1,
-1.092044, 0.9322717, -2.493645, 1, 0.7686275, 0, 1,
-1.084603, 0.03734299, -4.178763, 1, 0.772549, 0, 1,
-1.068968, 0.9984775, -1.754814, 1, 0.7803922, 0, 1,
-1.068747, -0.2443534, -4.419672, 1, 0.7843137, 0, 1,
-1.068488, 0.06378078, -2.515575, 1, 0.7921569, 0, 1,
-1.067159, -1.159884, -3.089391, 1, 0.7960784, 0, 1,
-1.065198, 0.7915792, -1.125344, 1, 0.8039216, 0, 1,
-1.062595, 0.6331208, 0.2903073, 1, 0.8117647, 0, 1,
-1.052485, 1.217148, 1.271158, 1, 0.8156863, 0, 1,
-1.05248, -0.1422093, -1.796883, 1, 0.8235294, 0, 1,
-1.043554, -0.09277767, -2.991786, 1, 0.827451, 0, 1,
-1.023866, -0.05408062, -3.530843, 1, 0.8352941, 0, 1,
-1.02123, -0.621605, -1.141375, 1, 0.8392157, 0, 1,
-1.019156, 0.004732314, -1.033566, 1, 0.8470588, 0, 1,
-1.018192, -2.335752, -3.450448, 1, 0.8509804, 0, 1,
-1.01678, -0.08696146, -1.342759, 1, 0.8588235, 0, 1,
-1.004291, -0.3132994, -0.9019393, 1, 0.8627451, 0, 1,
-1.002307, -1.774877, -3.540176, 1, 0.8705882, 0, 1,
-0.9945276, -0.5643103, -1.898473, 1, 0.8745098, 0, 1,
-0.9890679, 1.21686, -0.4853546, 1, 0.8823529, 0, 1,
-0.977809, 1.853829, -0.02808155, 1, 0.8862745, 0, 1,
-0.9765074, -1.078831, -3.553793, 1, 0.8941177, 0, 1,
-0.9742639, -1.098696, -2.079635, 1, 0.8980392, 0, 1,
-0.9698702, 1.458044, -1.483945, 1, 0.9058824, 0, 1,
-0.9676465, -2.452114, -1.82039, 1, 0.9137255, 0, 1,
-0.9655451, 1.642666, 1.36979, 1, 0.9176471, 0, 1,
-0.9594029, 0.3577794, -0.3060101, 1, 0.9254902, 0, 1,
-0.9552063, -1.343705, -1.315836, 1, 0.9294118, 0, 1,
-0.9486638, -1.878848, -0.9728951, 1, 0.9372549, 0, 1,
-0.9383327, 0.252911, -2.424083, 1, 0.9411765, 0, 1,
-0.9352942, -0.8411304, -2.730285, 1, 0.9490196, 0, 1,
-0.9351146, 1.597572, 0.8411264, 1, 0.9529412, 0, 1,
-0.9297594, -1.748831, -1.547711, 1, 0.9607843, 0, 1,
-0.9261735, -1.003805, -2.031112, 1, 0.9647059, 0, 1,
-0.9203826, 1.264663, -0.2576492, 1, 0.972549, 0, 1,
-0.9134908, -1.532555, -3.769725, 1, 0.9764706, 0, 1,
-0.9066411, 0.9551811, -0.4799855, 1, 0.9843137, 0, 1,
-0.9057979, 1.028081, -1.189377, 1, 0.9882353, 0, 1,
-0.9010189, -1.200773, -2.252624, 1, 0.9960784, 0, 1,
-0.9000485, 0.1797901, -0.432606, 0.9960784, 1, 0, 1,
-0.8987696, -0.07164804, -3.672004, 0.9921569, 1, 0, 1,
-0.8971031, 1.05399, -1.114245, 0.9843137, 1, 0, 1,
-0.8968614, -0.175375, -0.103758, 0.9803922, 1, 0, 1,
-0.8959695, -0.1733736, -1.936056, 0.972549, 1, 0, 1,
-0.8917696, 0.7971707, -0.7307709, 0.9686275, 1, 0, 1,
-0.8872371, 0.4203894, 0.08639086, 0.9607843, 1, 0, 1,
-0.8865192, 0.469029, -0.3032104, 0.9568627, 1, 0, 1,
-0.8827109, -1.925871, -1.038453, 0.9490196, 1, 0, 1,
-0.8800356, -0.6053587, -2.095585, 0.945098, 1, 0, 1,
-0.875801, -1.275243, -2.483489, 0.9372549, 1, 0, 1,
-0.8739071, -0.5269012, -3.250349, 0.9333333, 1, 0, 1,
-0.8727531, 0.1177448, -1.328394, 0.9254902, 1, 0, 1,
-0.8644269, -1.393249, -3.262133, 0.9215686, 1, 0, 1,
-0.8624259, 0.2010948, -1.705194, 0.9137255, 1, 0, 1,
-0.8527715, -0.6783452, -3.405976, 0.9098039, 1, 0, 1,
-0.8486439, 0.8125641, 0.06217409, 0.9019608, 1, 0, 1,
-0.8457549, -1.132445, -2.211906, 0.8941177, 1, 0, 1,
-0.841716, -0.5121234, -3.380928, 0.8901961, 1, 0, 1,
-0.8390408, -1.940458, -3.355553, 0.8823529, 1, 0, 1,
-0.8387229, -1.441552, -3.949767, 0.8784314, 1, 0, 1,
-0.8372598, -0.2315847, -2.293447, 0.8705882, 1, 0, 1,
-0.825805, 0.1753067, -1.910885, 0.8666667, 1, 0, 1,
-0.8248281, 0.2812893, -1.222202, 0.8588235, 1, 0, 1,
-0.8180569, 1.491985, -0.3032603, 0.854902, 1, 0, 1,
-0.815715, -2.233256, -3.235726, 0.8470588, 1, 0, 1,
-0.8116706, 0.07263868, -3.07345, 0.8431373, 1, 0, 1,
-0.803902, -0.9744929, -2.398617, 0.8352941, 1, 0, 1,
-0.8027937, 0.4923052, -3.451511, 0.8313726, 1, 0, 1,
-0.8025132, -1.192092, -4.672902, 0.8235294, 1, 0, 1,
-0.7966649, -0.0875893, -0.9574011, 0.8196079, 1, 0, 1,
-0.7876872, 1.535766, 0.9132531, 0.8117647, 1, 0, 1,
-0.7819568, -1.316121, -2.524602, 0.8078431, 1, 0, 1,
-0.7770835, -0.894829, -1.172046, 0.8, 1, 0, 1,
-0.7769757, 1.674402, -0.9247382, 0.7921569, 1, 0, 1,
-0.7763067, 1.920654, -0.3865238, 0.7882353, 1, 0, 1,
-0.7762895, -0.6501321, -1.602991, 0.7803922, 1, 0, 1,
-0.7751324, -0.5982099, -1.293018, 0.7764706, 1, 0, 1,
-0.7685371, -0.201368, -1.321522, 0.7686275, 1, 0, 1,
-0.7528139, 0.5578982, -0.9443706, 0.7647059, 1, 0, 1,
-0.751851, 1.055164, -0.4285379, 0.7568628, 1, 0, 1,
-0.7464085, 0.9787443, 0.4326964, 0.7529412, 1, 0, 1,
-0.7446411, 0.0459044, -2.620153, 0.7450981, 1, 0, 1,
-0.7427531, -1.373358, -3.046622, 0.7411765, 1, 0, 1,
-0.7402917, 0.1873627, -2.595625, 0.7333333, 1, 0, 1,
-0.7394304, -1.040504, -2.870762, 0.7294118, 1, 0, 1,
-0.7380764, -0.04053282, -1.213074, 0.7215686, 1, 0, 1,
-0.7343581, 1.04544, -0.4354431, 0.7176471, 1, 0, 1,
-0.7318742, 0.556262, -0.9115098, 0.7098039, 1, 0, 1,
-0.7310131, -0.1699578, -3.46826, 0.7058824, 1, 0, 1,
-0.726307, 0.7302059, -0.6156862, 0.6980392, 1, 0, 1,
-0.7262045, 0.9683522, 0.2568038, 0.6901961, 1, 0, 1,
-0.7238976, 1.468186, -1.919424, 0.6862745, 1, 0, 1,
-0.722317, 0.002561431, -1.50516, 0.6784314, 1, 0, 1,
-0.7158654, 0.03369894, -1.88378, 0.6745098, 1, 0, 1,
-0.7092533, -0.8101232, -2.326703, 0.6666667, 1, 0, 1,
-0.7051951, 0.2648388, -1.287652, 0.6627451, 1, 0, 1,
-0.7003113, -0.5392042, -1.785207, 0.654902, 1, 0, 1,
-0.6899953, 0.5816456, -0.3225316, 0.6509804, 1, 0, 1,
-0.6888306, 0.01107303, -2.381159, 0.6431373, 1, 0, 1,
-0.687029, -0.8670726, -1.796475, 0.6392157, 1, 0, 1,
-0.6850145, -1.445269, -3.710875, 0.6313726, 1, 0, 1,
-0.6849567, -1.421708, -1.063346, 0.627451, 1, 0, 1,
-0.6819002, 1.039825, -1.460747, 0.6196079, 1, 0, 1,
-0.6768839, -0.7296563, -3.934577, 0.6156863, 1, 0, 1,
-0.6743298, -1.947589, -2.223442, 0.6078432, 1, 0, 1,
-0.669682, -0.9477431, -3.107835, 0.6039216, 1, 0, 1,
-0.6650655, 0.608273, -1.579859, 0.5960785, 1, 0, 1,
-0.6618949, 0.7224444, 2.3224, 0.5882353, 1, 0, 1,
-0.6607751, 0.3692318, 0.4836456, 0.5843138, 1, 0, 1,
-0.6596103, 1.967075, 0.9708755, 0.5764706, 1, 0, 1,
-0.6574752, 0.4937464, -0.9822291, 0.572549, 1, 0, 1,
-0.654143, 0.1810675, -1.719648, 0.5647059, 1, 0, 1,
-0.6523794, -0.4109077, -2.194691, 0.5607843, 1, 0, 1,
-0.6511729, 1.937931, -0.0493472, 0.5529412, 1, 0, 1,
-0.65022, -0.3197256, -2.395749, 0.5490196, 1, 0, 1,
-0.6457166, 0.5068688, -0.8208223, 0.5411765, 1, 0, 1,
-0.6445811, -0.1009299, -2.355265, 0.5372549, 1, 0, 1,
-0.6351902, 2.383026, 0.7070965, 0.5294118, 1, 0, 1,
-0.6340684, 0.4243457, 0.1048296, 0.5254902, 1, 0, 1,
-0.6318731, 0.2686867, -1.181914, 0.5176471, 1, 0, 1,
-0.6264765, -0.8008662, -3.243568, 0.5137255, 1, 0, 1,
-0.6213155, 1.934365, -1.314098, 0.5058824, 1, 0, 1,
-0.6211022, -0.7526559, -3.398397, 0.5019608, 1, 0, 1,
-0.6200144, 0.3484416, -0.4945397, 0.4941176, 1, 0, 1,
-0.6177607, -0.06161958, -2.291645, 0.4862745, 1, 0, 1,
-0.6167867, 0.9796613, -0.1481708, 0.4823529, 1, 0, 1,
-0.6154737, -0.3484197, -3.459664, 0.4745098, 1, 0, 1,
-0.604022, 0.4070207, -2.113017, 0.4705882, 1, 0, 1,
-0.5971728, 1.4546, -0.08768059, 0.4627451, 1, 0, 1,
-0.5947301, 1.615629, 1.558167, 0.4588235, 1, 0, 1,
-0.5943887, -1.718806, -2.273647, 0.4509804, 1, 0, 1,
-0.5939763, 0.401345, -2.388687, 0.4470588, 1, 0, 1,
-0.5930917, 0.4742397, -1.503931, 0.4392157, 1, 0, 1,
-0.5929393, 0.6380065, 0.03755386, 0.4352941, 1, 0, 1,
-0.5920704, -1.522484, -2.026908, 0.427451, 1, 0, 1,
-0.5877516, 0.5156534, -0.6928603, 0.4235294, 1, 0, 1,
-0.5833608, 0.4574341, -1.951739, 0.4156863, 1, 0, 1,
-0.5756954, 0.2209485, -1.188444, 0.4117647, 1, 0, 1,
-0.5755429, 0.9330513, -2.690297, 0.4039216, 1, 0, 1,
-0.5742004, -0.8491472, -2.239728, 0.3960784, 1, 0, 1,
-0.5705385, 0.1365385, -2.530826, 0.3921569, 1, 0, 1,
-0.5624127, -0.6259512, -1.989786, 0.3843137, 1, 0, 1,
-0.5620402, 1.624837, -0.6478622, 0.3803922, 1, 0, 1,
-0.5614906, 0.2223511, -1.507143, 0.372549, 1, 0, 1,
-0.5588654, -0.2673089, -0.8012319, 0.3686275, 1, 0, 1,
-0.556864, -0.8854419, -3.071389, 0.3607843, 1, 0, 1,
-0.5539443, -0.2384109, -0.7396805, 0.3568628, 1, 0, 1,
-0.5526574, 0.4072624, -1.241303, 0.3490196, 1, 0, 1,
-0.5507343, 0.7521511, 0.8279322, 0.345098, 1, 0, 1,
-0.5503619, -0.369814, -2.473417, 0.3372549, 1, 0, 1,
-0.5498871, -0.6797841, 1.316481, 0.3333333, 1, 0, 1,
-0.5474432, -0.1646058, -3.950988, 0.3254902, 1, 0, 1,
-0.5447657, 0.2024222, -1.785953, 0.3215686, 1, 0, 1,
-0.5424824, 0.4178959, -0.1490281, 0.3137255, 1, 0, 1,
-0.5371506, 0.2931202, -1.369045, 0.3098039, 1, 0, 1,
-0.5361549, -0.1074451, -0.4362905, 0.3019608, 1, 0, 1,
-0.5359632, 1.183224, -2.111407, 0.2941177, 1, 0, 1,
-0.5330231, 1.480359, 0.3970678, 0.2901961, 1, 0, 1,
-0.5320381, -0.2186112, -0.1058702, 0.282353, 1, 0, 1,
-0.5313714, 0.7832989, -2.500877, 0.2784314, 1, 0, 1,
-0.5272557, -0.03952734, -0.2822898, 0.2705882, 1, 0, 1,
-0.5271374, -1.561904, -2.267899, 0.2666667, 1, 0, 1,
-0.5263373, 0.3242561, -2.626389, 0.2588235, 1, 0, 1,
-0.5253927, 1.364304, -1.124989, 0.254902, 1, 0, 1,
-0.5131027, -0.5738121, -3.117307, 0.2470588, 1, 0, 1,
-0.5127774, 0.4729231, -2.815842, 0.2431373, 1, 0, 1,
-0.5098607, 0.2899664, -1.16631, 0.2352941, 1, 0, 1,
-0.5086384, 0.2752582, -2.588999, 0.2313726, 1, 0, 1,
-0.4931495, 1.0783, -0.72182, 0.2235294, 1, 0, 1,
-0.4931141, -0.8362059, -3.964671, 0.2196078, 1, 0, 1,
-0.4924135, 0.6165706, -0.3814447, 0.2117647, 1, 0, 1,
-0.4858286, 0.7940957, -0.846119, 0.2078431, 1, 0, 1,
-0.4839845, 0.939679, -2.775806, 0.2, 1, 0, 1,
-0.4828512, 0.115209, -1.275704, 0.1921569, 1, 0, 1,
-0.4754402, -0.9132071, -2.583644, 0.1882353, 1, 0, 1,
-0.4705422, -0.6381242, -2.036259, 0.1803922, 1, 0, 1,
-0.4695834, 1.896082, -0.4576075, 0.1764706, 1, 0, 1,
-0.4681672, 0.0851813, -1.424195, 0.1686275, 1, 0, 1,
-0.467485, 0.1328956, -1.37421, 0.1647059, 1, 0, 1,
-0.4656947, 0.4873594, -0.6503552, 0.1568628, 1, 0, 1,
-0.4654506, 1.875858, -1.115824, 0.1529412, 1, 0, 1,
-0.4646614, 0.4194992, -0.2731991, 0.145098, 1, 0, 1,
-0.4632726, -0.02446595, -1.168091, 0.1411765, 1, 0, 1,
-0.4498847, -0.09088603, -0.7107806, 0.1333333, 1, 0, 1,
-0.449092, 0.1401123, -1.816998, 0.1294118, 1, 0, 1,
-0.4469233, -1.229502, -4.925321, 0.1215686, 1, 0, 1,
-0.4463177, -0.2990813, -2.312306, 0.1176471, 1, 0, 1,
-0.4453924, 0.8655122, -0.7812178, 0.1098039, 1, 0, 1,
-0.4451611, 1.369219, -0.4749025, 0.1058824, 1, 0, 1,
-0.4451394, -0.6569646, -3.422288, 0.09803922, 1, 0, 1,
-0.4372747, 0.1577607, -1.829078, 0.09019608, 1, 0, 1,
-0.4339469, 0.3572448, -1.869166, 0.08627451, 1, 0, 1,
-0.4307609, 0.1768823, -2.689281, 0.07843138, 1, 0, 1,
-0.4260138, -0.3995971, -3.143608, 0.07450981, 1, 0, 1,
-0.4233706, -1.569511, -2.525274, 0.06666667, 1, 0, 1,
-0.4203585, -0.9828872, -1.85102, 0.0627451, 1, 0, 1,
-0.4153752, 0.7376392, -0.3474757, 0.05490196, 1, 0, 1,
-0.4144777, -1.105686, -2.763756, 0.05098039, 1, 0, 1,
-0.4081306, 0.646346, -0.2786232, 0.04313726, 1, 0, 1,
-0.406428, 2.217246, 0.8474752, 0.03921569, 1, 0, 1,
-0.4030931, -0.3777104, -0.7196711, 0.03137255, 1, 0, 1,
-0.4000203, -2.134638, -1.996999, 0.02745098, 1, 0, 1,
-0.397465, 1.005775, 1.796171, 0.01960784, 1, 0, 1,
-0.3943544, -0.7859786, -1.647452, 0.01568628, 1, 0, 1,
-0.3928561, -0.7737191, -1.225053, 0.007843138, 1, 0, 1,
-0.3882626, -0.2432091, -3.142955, 0.003921569, 1, 0, 1,
-0.3846613, 0.1684777, 0.1726954, 0, 1, 0.003921569, 1,
-0.3845322, 0.3031014, -2.006865, 0, 1, 0.01176471, 1,
-0.3827338, -0.01263373, -2.542295, 0, 1, 0.01568628, 1,
-0.3804241, -0.9343852, -3.298894, 0, 1, 0.02352941, 1,
-0.3803131, -0.892108, -4.110543, 0, 1, 0.02745098, 1,
-0.3786688, -1.024358, -3.468364, 0, 1, 0.03529412, 1,
-0.3756506, 2.496496, -0.402568, 0, 1, 0.03921569, 1,
-0.3749807, 0.2989541, -0.9821621, 0, 1, 0.04705882, 1,
-0.3748648, -0.318699, -3.142217, 0, 1, 0.05098039, 1,
-0.3717497, 0.3528069, 0.4853027, 0, 1, 0.05882353, 1,
-0.3600149, 2.541379, -0.4101195, 0, 1, 0.0627451, 1,
-0.3571315, -0.1524145, -0.4006917, 0, 1, 0.07058824, 1,
-0.3536145, -1.485942, -2.728342, 0, 1, 0.07450981, 1,
-0.3518748, -1.043569, -2.291955, 0, 1, 0.08235294, 1,
-0.3509908, 0.3078581, -0.8095727, 0, 1, 0.08627451, 1,
-0.3500949, -0.05894126, -1.666735, 0, 1, 0.09411765, 1,
-0.3469751, -0.2414884, -1.607054, 0, 1, 0.1019608, 1,
-0.3462234, -0.4189837, 0.2337327, 0, 1, 0.1058824, 1,
-0.3461354, 0.1000072, 0.5547581, 0, 1, 0.1137255, 1,
-0.3440155, 0.4073691, -2.234349, 0, 1, 0.1176471, 1,
-0.3415231, -0.6229119, -3.804558, 0, 1, 0.1254902, 1,
-0.3390622, -0.0553486, -1.646127, 0, 1, 0.1294118, 1,
-0.3323223, -0.3015885, -2.545193, 0, 1, 0.1372549, 1,
-0.3307682, 0.8023681, 1.215006, 0, 1, 0.1411765, 1,
-0.3305151, -1.149966, -3.022331, 0, 1, 0.1490196, 1,
-0.3278831, -1.298523, -3.064517, 0, 1, 0.1529412, 1,
-0.3266114, -0.1991306, -1.727318, 0, 1, 0.1607843, 1,
-0.3201183, -0.7892077, -1.966279, 0, 1, 0.1647059, 1,
-0.3127848, 0.6781443, -0.7035149, 0, 1, 0.172549, 1,
-0.3123822, 2.262975, -1.034841, 0, 1, 0.1764706, 1,
-0.3123101, -1.066889, -3.410921, 0, 1, 0.1843137, 1,
-0.3115996, -1.591926, -2.554903, 0, 1, 0.1882353, 1,
-0.3098187, 1.006176, -0.6032558, 0, 1, 0.1960784, 1,
-0.3081729, 1.129752, 2.536605, 0, 1, 0.2039216, 1,
-0.3080582, -1.043162, -0.6083958, 0, 1, 0.2078431, 1,
-0.3036036, 0.8916879, -0.4001554, 0, 1, 0.2156863, 1,
-0.3024818, -0.8278911, -3.624104, 0, 1, 0.2196078, 1,
-0.3023969, 1.925333, -0.3488973, 0, 1, 0.227451, 1,
-0.3021697, 0.3127424, -1.405045, 0, 1, 0.2313726, 1,
-0.2949682, 1.03125, 0.1089024, 0, 1, 0.2392157, 1,
-0.2913998, -1.356559, -3.394185, 0, 1, 0.2431373, 1,
-0.2840958, -0.06543116, -1.530951, 0, 1, 0.2509804, 1,
-0.2836048, -0.7232342, -3.533531, 0, 1, 0.254902, 1,
-0.2803978, 0.356185, -0.6747233, 0, 1, 0.2627451, 1,
-0.2781246, 1.041837, -1.413896, 0, 1, 0.2666667, 1,
-0.2751788, 1.065427, 0.212994, 0, 1, 0.2745098, 1,
-0.2751779, 0.2694096, -0.2493665, 0, 1, 0.2784314, 1,
-0.2716243, 0.7429141, 0.8660758, 0, 1, 0.2862745, 1,
-0.2700245, 0.7581618, -1.344858, 0, 1, 0.2901961, 1,
-0.2683285, -0.4904664, -3.952175, 0, 1, 0.2980392, 1,
-0.2565377, -0.5900543, -4.098968, 0, 1, 0.3058824, 1,
-0.2555082, 0.2552172, -0.5732099, 0, 1, 0.3098039, 1,
-0.2552935, 0.9901369, -0.5162578, 0, 1, 0.3176471, 1,
-0.2536235, 0.781148, -0.4110786, 0, 1, 0.3215686, 1,
-0.2523883, -0.7334611, -2.169242, 0, 1, 0.3294118, 1,
-0.2515574, -1.84467, -3.824623, 0, 1, 0.3333333, 1,
-0.2492816, 1.526658, -0.3408999, 0, 1, 0.3411765, 1,
-0.2445373, -0.7717497, -2.761128, 0, 1, 0.345098, 1,
-0.2415687, -1.895214, -2.658031, 0, 1, 0.3529412, 1,
-0.2403276, -0.005055454, -1.677588, 0, 1, 0.3568628, 1,
-0.2403183, 1.344223, 0.3397517, 0, 1, 0.3647059, 1,
-0.236137, -1.106357, -1.925471, 0, 1, 0.3686275, 1,
-0.2344183, -1.019257, -1.866981, 0, 1, 0.3764706, 1,
-0.2326861, 0.9260553, 1.15705, 0, 1, 0.3803922, 1,
-0.227746, -0.01646905, -1.504505, 0, 1, 0.3882353, 1,
-0.2261217, 0.2860426, 0.1441935, 0, 1, 0.3921569, 1,
-0.2245203, -0.009322802, -0.7976575, 0, 1, 0.4, 1,
-0.2228824, -0.03242519, -2.563012, 0, 1, 0.4078431, 1,
-0.2225482, -0.9519902, -3.625717, 0, 1, 0.4117647, 1,
-0.220425, 2.046748, -0.4569437, 0, 1, 0.4196078, 1,
-0.2201871, 0.6540583, 0.5876273, 0, 1, 0.4235294, 1,
-0.2194666, 0.4786746, 1.343497, 0, 1, 0.4313726, 1,
-0.21869, -0.2889463, -1.9481, 0, 1, 0.4352941, 1,
-0.2182247, 1.566281, 0.08406075, 0, 1, 0.4431373, 1,
-0.2178032, 0.2402878, -0.09469242, 0, 1, 0.4470588, 1,
-0.2154578, -0.1519304, -2.017382, 0, 1, 0.454902, 1,
-0.2147399, 1.514743, -0.7351196, 0, 1, 0.4588235, 1,
-0.2123, 0.4097316, 0.2346853, 0, 1, 0.4666667, 1,
-0.2080217, -1.236049, -2.003423, 0, 1, 0.4705882, 1,
-0.2016793, 0.0729689, -0.9122649, 0, 1, 0.4784314, 1,
-0.1963328, 0.006077375, -2.128379, 0, 1, 0.4823529, 1,
-0.1949452, 0.9688314, -1.481701, 0, 1, 0.4901961, 1,
-0.1866985, 0.08906549, -1.856134, 0, 1, 0.4941176, 1,
-0.1858811, -0.9503451, -2.23088, 0, 1, 0.5019608, 1,
-0.1856401, 0.9670261, 1.008856, 0, 1, 0.509804, 1,
-0.1829209, 1.345421, -0.1781599, 0, 1, 0.5137255, 1,
-0.1812219, -0.706448, -2.454606, 0, 1, 0.5215687, 1,
-0.1783128, 1.254658, -0.2410851, 0, 1, 0.5254902, 1,
-0.1739058, -0.8606792, -2.372586, 0, 1, 0.5333334, 1,
-0.1687693, -3.595566, -2.641364, 0, 1, 0.5372549, 1,
-0.1652083, -0.5374377, -4.154274, 0, 1, 0.5450981, 1,
-0.1646752, -0.6017326, -3.483406, 0, 1, 0.5490196, 1,
-0.1622067, -0.1268128, -2.144864, 0, 1, 0.5568628, 1,
-0.1598665, 0.2358911, 0.9308875, 0, 1, 0.5607843, 1,
-0.1451192, -1.736898, -3.305236, 0, 1, 0.5686275, 1,
-0.1429788, 0.1961562, 0.3268565, 0, 1, 0.572549, 1,
-0.1429377, 1.620124, -1.56692, 0, 1, 0.5803922, 1,
-0.1421324, -0.9433711, -1.78518, 0, 1, 0.5843138, 1,
-0.1386759, -0.7120948, -1.617105, 0, 1, 0.5921569, 1,
-0.1361761, 1.229202, 0.3379416, 0, 1, 0.5960785, 1,
-0.1347207, 0.4507171, 0.06832191, 0, 1, 0.6039216, 1,
-0.133679, 0.4649999, -0.004221329, 0, 1, 0.6117647, 1,
-0.1306896, -0.8719574, -2.975387, 0, 1, 0.6156863, 1,
-0.1272402, -0.162165, -4.607587, 0, 1, 0.6235294, 1,
-0.1253261, 0.2790921, -0.5449899, 0, 1, 0.627451, 1,
-0.1252279, 0.4338396, 1.138656, 0, 1, 0.6352941, 1,
-0.1231083, 1.442705, -1.781125, 0, 1, 0.6392157, 1,
-0.1207528, 1.430508, 0.6049891, 0, 1, 0.6470588, 1,
-0.1207161, 0.00387048, -1.566414, 0, 1, 0.6509804, 1,
-0.1205295, 0.3963564, -0.8958996, 0, 1, 0.6588235, 1,
-0.1170235, -0.01677458, -1.914796, 0, 1, 0.6627451, 1,
-0.109135, 2.11421, -1.030306, 0, 1, 0.6705883, 1,
-0.1059119, 0.6855103, -0.2952953, 0, 1, 0.6745098, 1,
-0.1052093, 0.6797457, -0.2343277, 0, 1, 0.682353, 1,
-0.1007742, -0.9926559, -2.203649, 0, 1, 0.6862745, 1,
-0.1007512, -2.487643, -2.727618, 0, 1, 0.6941177, 1,
-0.1006247, -1.934307, -2.46476, 0, 1, 0.7019608, 1,
-0.100255, 0.08752422, -2.816381, 0, 1, 0.7058824, 1,
-0.09754618, 0.7975249, 1.415515, 0, 1, 0.7137255, 1,
-0.09629601, 0.6579121, 0.1216891, 0, 1, 0.7176471, 1,
-0.09610642, 0.381852, -0.6350005, 0, 1, 0.7254902, 1,
-0.09608823, 1.8591, -0.470441, 0, 1, 0.7294118, 1,
-0.08665414, 1.127883, 0.1783183, 0, 1, 0.7372549, 1,
-0.08316743, -0.4452067, -2.953968, 0, 1, 0.7411765, 1,
-0.08143447, -0.6910045, -1.772934, 0, 1, 0.7490196, 1,
-0.08044614, 0.4348784, -0.3502255, 0, 1, 0.7529412, 1,
-0.06838784, 0.3082848, 0.6417682, 0, 1, 0.7607843, 1,
-0.06377941, 0.3209507, 0.09440329, 0, 1, 0.7647059, 1,
-0.05747881, 0.0437627, -1.043027, 0, 1, 0.772549, 1,
-0.0561243, -0.8791918, -3.012676, 0, 1, 0.7764706, 1,
-0.05508125, -0.4965529, -2.210487, 0, 1, 0.7843137, 1,
-0.05467785, 0.944117, -0.6619744, 0, 1, 0.7882353, 1,
-0.05222597, 1.106794, 0.6790931, 0, 1, 0.7960784, 1,
-0.05178086, -0.1996295, -3.644009, 0, 1, 0.8039216, 1,
-0.05125891, -1.757077, -4.317547, 0, 1, 0.8078431, 1,
-0.05040591, 0.4359845, -0.1992261, 0, 1, 0.8156863, 1,
-0.05004503, -0.1195262, -3.739594, 0, 1, 0.8196079, 1,
-0.04855915, -0.5750594, -2.166832, 0, 1, 0.827451, 1,
-0.04584876, 0.8274748, 0.1028371, 0, 1, 0.8313726, 1,
-0.04352148, 1.123891, -1.796613, 0, 1, 0.8392157, 1,
-0.0432792, -0.4215139, -3.923135, 0, 1, 0.8431373, 1,
-0.04283774, -0.7427351, -2.59205, 0, 1, 0.8509804, 1,
-0.04156236, -0.4406052, -3.0321, 0, 1, 0.854902, 1,
-0.03732368, 2.640472, 0.1996785, 0, 1, 0.8627451, 1,
-0.03700468, 0.1084368, -0.4228293, 0, 1, 0.8666667, 1,
-0.0365562, -1.531016, -2.402996, 0, 1, 0.8745098, 1,
-0.035346, 0.2748359, -0.3830687, 0, 1, 0.8784314, 1,
-0.03478323, 1.359096, -0.4196654, 0, 1, 0.8862745, 1,
-0.02714756, 1.931208, 1.473525, 0, 1, 0.8901961, 1,
-0.02593508, 1.985418, 0.01345971, 0, 1, 0.8980392, 1,
-0.02558667, -0.3702754, -2.938998, 0, 1, 0.9058824, 1,
-0.01793573, -1.687916, -2.093081, 0, 1, 0.9098039, 1,
-0.0169601, 0.009276215, -1.980157, 0, 1, 0.9176471, 1,
-0.01398522, 1.293938, -1.213856, 0, 1, 0.9215686, 1,
-0.01219171, 1.584638, 1.118623, 0, 1, 0.9294118, 1,
-0.01210259, 0.08332734, -0.5054548, 0, 1, 0.9333333, 1,
-0.009541822, 1.712554, 1.717105, 0, 1, 0.9411765, 1,
-0.007359837, -0.3407494, -2.790889, 0, 1, 0.945098, 1,
-0.006138054, -0.4837852, -2.675637, 0, 1, 0.9529412, 1,
-0.005925908, -0.8603848, -4.462053, 0, 1, 0.9568627, 1,
-0.001980576, 0.008682203, 0.1193473, 0, 1, 0.9647059, 1,
-0.001491776, -0.4347209, -2.520144, 0, 1, 0.9686275, 1,
0.003385579, 0.01319566, -1.605832, 0, 1, 0.9764706, 1,
0.007296694, 0.9491339, 0.9574959, 0, 1, 0.9803922, 1,
0.007762869, 0.494495, 1.18243, 0, 1, 0.9882353, 1,
0.009752871, -0.9707627, 3.866484, 0, 1, 0.9921569, 1,
0.01124739, 0.1622056, 0.4410834, 0, 1, 1, 1,
0.01193445, 1.258876, 0.8472728, 0, 0.9921569, 1, 1,
0.01203691, 1.615029, -1.120666, 0, 0.9882353, 1, 1,
0.01246346, 0.3196234, -0.7173647, 0, 0.9803922, 1, 1,
0.01280496, 0.8615767, -0.7192628, 0, 0.9764706, 1, 1,
0.01495149, -0.3673069, 4.427032, 0, 0.9686275, 1, 1,
0.01554548, -0.6178548, 1.44944, 0, 0.9647059, 1, 1,
0.02231671, 1.015365, -0.01753376, 0, 0.9568627, 1, 1,
0.02452793, -1.1079, 2.319491, 0, 0.9529412, 1, 1,
0.02575191, -2.04515, 3.97378, 0, 0.945098, 1, 1,
0.02807126, 0.04006862, -0.7365352, 0, 0.9411765, 1, 1,
0.03647704, -0.2208175, 3.387603, 0, 0.9333333, 1, 1,
0.03682933, 1.21364, 1.018864, 0, 0.9294118, 1, 1,
0.03811524, -0.629634, 4.105091, 0, 0.9215686, 1, 1,
0.04069451, -0.7544561, 2.277799, 0, 0.9176471, 1, 1,
0.04246926, -0.8743976, 1.879579, 0, 0.9098039, 1, 1,
0.04422172, 1.951825, -1.693703, 0, 0.9058824, 1, 1,
0.04422774, 1.235044, -0.2224343, 0, 0.8980392, 1, 1,
0.04772077, 1.12291, -0.4816623, 0, 0.8901961, 1, 1,
0.04923157, -1.249831, 3.518959, 0, 0.8862745, 1, 1,
0.05123203, -0.07116922, 3.895109, 0, 0.8784314, 1, 1,
0.05382885, -0.7128474, 3.130518, 0, 0.8745098, 1, 1,
0.05719278, -0.5003293, 1.807581, 0, 0.8666667, 1, 1,
0.05935251, -0.7744845, 3.938305, 0, 0.8627451, 1, 1,
0.0610356, -0.2381268, 1.706147, 0, 0.854902, 1, 1,
0.06145769, 0.1223966, 0.6868578, 0, 0.8509804, 1, 1,
0.06670026, -0.4344988, 4.152977, 0, 0.8431373, 1, 1,
0.06730344, -0.215073, 1.676172, 0, 0.8392157, 1, 1,
0.06912442, 2.557286, 1.141532, 0, 0.8313726, 1, 1,
0.0694896, -0.5248793, 2.545787, 0, 0.827451, 1, 1,
0.07095668, -1.133101, 2.50421, 0, 0.8196079, 1, 1,
0.07370061, -1.279403, 1.098032, 0, 0.8156863, 1, 1,
0.07536223, 0.1732394, -0.2534516, 0, 0.8078431, 1, 1,
0.07680215, -1.126488, 3.425482, 0, 0.8039216, 1, 1,
0.08430029, -0.2146223, 3.252981, 0, 0.7960784, 1, 1,
0.08589365, -0.22113, 2.69066, 0, 0.7882353, 1, 1,
0.08715555, -0.1950393, 2.234374, 0, 0.7843137, 1, 1,
0.09115227, 0.1461511, 1.179354, 0, 0.7764706, 1, 1,
0.0936048, 0.3231127, 0.6521937, 0, 0.772549, 1, 1,
0.09767944, -0.3589455, 3.990211, 0, 0.7647059, 1, 1,
0.1001637, -1.340814, 2.58375, 0, 0.7607843, 1, 1,
0.1007742, -0.9384185, 2.878315, 0, 0.7529412, 1, 1,
0.1044774, -0.6645322, 3.495585, 0, 0.7490196, 1, 1,
0.1105407, 0.4784245, -0.4697692, 0, 0.7411765, 1, 1,
0.1125512, 1.296005, 0.6683522, 0, 0.7372549, 1, 1,
0.1155692, 1.627674, 0.5411307, 0, 0.7294118, 1, 1,
0.1180017, -0.5249295, 3.70967, 0, 0.7254902, 1, 1,
0.1249666, -1.159971, 2.175071, 0, 0.7176471, 1, 1,
0.1262882, -0.6194831, 0.7942088, 0, 0.7137255, 1, 1,
0.127422, -0.7841833, 2.950501, 0, 0.7058824, 1, 1,
0.1275895, 0.792418, 0.8086179, 0, 0.6980392, 1, 1,
0.1373976, 0.3928209, 1.727402, 0, 0.6941177, 1, 1,
0.1375137, -2.446498, 2.209216, 0, 0.6862745, 1, 1,
0.1402319, 0.3378827, 0.7056622, 0, 0.682353, 1, 1,
0.1424732, 1.077204, -0.2083128, 0, 0.6745098, 1, 1,
0.1425054, -0.356586, 1.805285, 0, 0.6705883, 1, 1,
0.1431673, -1.171494, 3.076873, 0, 0.6627451, 1, 1,
0.1447962, -1.494059, 2.149514, 0, 0.6588235, 1, 1,
0.1491021, 1.278609, 0.8943576, 0, 0.6509804, 1, 1,
0.1513239, 1.30236, -0.278668, 0, 0.6470588, 1, 1,
0.1522077, 1.519152, 1.837347, 0, 0.6392157, 1, 1,
0.1537355, -0.5477163, 4.811713, 0, 0.6352941, 1, 1,
0.1549271, 0.9166131, -0.9829949, 0, 0.627451, 1, 1,
0.157166, 0.8526976, 1.73022, 0, 0.6235294, 1, 1,
0.1586947, -0.370437, 1.968885, 0, 0.6156863, 1, 1,
0.1589561, -0.5493217, 2.415997, 0, 0.6117647, 1, 1,
0.1594763, 0.05973889, 0.8351517, 0, 0.6039216, 1, 1,
0.1602222, -0.7427588, 2.066477, 0, 0.5960785, 1, 1,
0.1628145, 0.2639452, -1.34885, 0, 0.5921569, 1, 1,
0.1643559, 1.403413, 0.5476997, 0, 0.5843138, 1, 1,
0.1650763, 0.8057564, 1.920474, 0, 0.5803922, 1, 1,
0.1658411, 0.6072353, -0.1412732, 0, 0.572549, 1, 1,
0.1694926, 0.2061296, 0.6911035, 0, 0.5686275, 1, 1,
0.1722067, -1.540654, 4.111598, 0, 0.5607843, 1, 1,
0.1732923, 0.552431, 0.4584693, 0, 0.5568628, 1, 1,
0.1748607, 0.5325155, 0.4724503, 0, 0.5490196, 1, 1,
0.1779549, 1.070518, 0.1308931, 0, 0.5450981, 1, 1,
0.1807026, -0.3571789, 2.306548, 0, 0.5372549, 1, 1,
0.1809043, -1.134152, 3.179324, 0, 0.5333334, 1, 1,
0.1840096, -0.5462905, 2.704413, 0, 0.5254902, 1, 1,
0.1896774, -0.6463154, 2.98421, 0, 0.5215687, 1, 1,
0.1913305, -0.07979357, 0.2603186, 0, 0.5137255, 1, 1,
0.1961983, 1.242064, -1.042691, 0, 0.509804, 1, 1,
0.1976868, 1.377937, 1.126894, 0, 0.5019608, 1, 1,
0.1994991, -1.553913, 2.673439, 0, 0.4941176, 1, 1,
0.2000042, -0.03396144, 1.6679, 0, 0.4901961, 1, 1,
0.2029903, 1.058954, -0.06866527, 0, 0.4823529, 1, 1,
0.2099878, -1.139281, 3.225347, 0, 0.4784314, 1, 1,
0.2103831, 1.52008, 0.4265289, 0, 0.4705882, 1, 1,
0.2156476, 0.9075557, 0.2999375, 0, 0.4666667, 1, 1,
0.2167838, -0.8976573, 2.143197, 0, 0.4588235, 1, 1,
0.2356715, 1.373488, 0.7304579, 0, 0.454902, 1, 1,
0.2380675, -1.292476, 1.579842, 0, 0.4470588, 1, 1,
0.2402997, 0.04342881, 1.42915, 0, 0.4431373, 1, 1,
0.2420035, 2.109538, 0.6464115, 0, 0.4352941, 1, 1,
0.2423079, 0.6404098, -0.1087796, 0, 0.4313726, 1, 1,
0.2426579, -0.477745, 1.832126, 0, 0.4235294, 1, 1,
0.2449734, 1.497728, 0.6030709, 0, 0.4196078, 1, 1,
0.2466479, -0.9116245, 2.779064, 0, 0.4117647, 1, 1,
0.2488323, -1.530028, 2.554883, 0, 0.4078431, 1, 1,
0.2506049, 0.627298, 0.5342348, 0, 0.4, 1, 1,
0.2518954, -0.6229768, 3.382798, 0, 0.3921569, 1, 1,
0.2578371, -0.375913, 2.870449, 0, 0.3882353, 1, 1,
0.2624115, -0.1360819, 1.270947, 0, 0.3803922, 1, 1,
0.262444, -0.2701072, 3.484265, 0, 0.3764706, 1, 1,
0.2639072, 0.5744189, 1.034625, 0, 0.3686275, 1, 1,
0.2658222, -0.4642455, 1.514244, 0, 0.3647059, 1, 1,
0.268007, 1.008867, -0.6331694, 0, 0.3568628, 1, 1,
0.2726755, 0.7253579, -0.566126, 0, 0.3529412, 1, 1,
0.2736114, -0.1391292, 1.872414, 0, 0.345098, 1, 1,
0.2754261, 1.315678, 2.685033, 0, 0.3411765, 1, 1,
0.2757228, -2.868399, 3.450906, 0, 0.3333333, 1, 1,
0.2769288, 0.6495617, 0.3046138, 0, 0.3294118, 1, 1,
0.2774124, -0.6237612, 3.736236, 0, 0.3215686, 1, 1,
0.2775489, 0.9747221, 0.7489198, 0, 0.3176471, 1, 1,
0.2776919, -0.637702, 3.789675, 0, 0.3098039, 1, 1,
0.2799088, -0.5420471, 2.080618, 0, 0.3058824, 1, 1,
0.2814944, 0.1463577, 0.4529021, 0, 0.2980392, 1, 1,
0.2896512, 0.131406, 0.22159, 0, 0.2901961, 1, 1,
0.29145, 1.468165, 0.5507962, 0, 0.2862745, 1, 1,
0.2919637, 0.6034376, -1.737823, 0, 0.2784314, 1, 1,
0.294906, 0.3063201, 1.221778, 0, 0.2745098, 1, 1,
0.2983207, -0.6556164, 1.161926, 0, 0.2666667, 1, 1,
0.2992453, 0.4715361, 0.8564934, 0, 0.2627451, 1, 1,
0.2997016, 0.495446, 0.1485108, 0, 0.254902, 1, 1,
0.3054253, 0.5185887, 2.442929, 0, 0.2509804, 1, 1,
0.3126816, -1.52328, 1.624524, 0, 0.2431373, 1, 1,
0.3157475, -0.1695728, 0.9690719, 0, 0.2392157, 1, 1,
0.3208584, -0.1090449, 0.7331841, 0, 0.2313726, 1, 1,
0.3212596, -0.5242716, 2.913974, 0, 0.227451, 1, 1,
0.3215528, -0.01413738, 2.991209, 0, 0.2196078, 1, 1,
0.3216138, 2.614129, -1.48112, 0, 0.2156863, 1, 1,
0.323338, 0.4917206, 0.4727362, 0, 0.2078431, 1, 1,
0.3262669, -0.2759657, 1.957659, 0, 0.2039216, 1, 1,
0.3268574, -0.1302468, 0.8834475, 0, 0.1960784, 1, 1,
0.3286552, 3.40294, -0.00321537, 0, 0.1882353, 1, 1,
0.3322428, -1.820398, 4.119478, 0, 0.1843137, 1, 1,
0.332691, -0.2129615, 1.800504, 0, 0.1764706, 1, 1,
0.3344213, -0.2732348, 2.362793, 0, 0.172549, 1, 1,
0.3382551, 1.807464, 0.6379532, 0, 0.1647059, 1, 1,
0.3480093, -0.2627179, 3.766678, 0, 0.1607843, 1, 1,
0.3489816, -0.0404207, 3.976289, 0, 0.1529412, 1, 1,
0.3491532, 0.4211085, 1.678074, 0, 0.1490196, 1, 1,
0.3548168, 0.6328654, 0.6073398, 0, 0.1411765, 1, 1,
0.3588706, -1.108866, 1.667028, 0, 0.1372549, 1, 1,
0.361809, -1.238114, 2.635839, 0, 0.1294118, 1, 1,
0.3620984, -1.071535, 1.934994, 0, 0.1254902, 1, 1,
0.3702562, 0.1573638, 0.883908, 0, 0.1176471, 1, 1,
0.3710737, -0.05482183, 2.627594, 0, 0.1137255, 1, 1,
0.3722441, 0.8797895, 0.02109646, 0, 0.1058824, 1, 1,
0.3740259, -0.08791517, 1.638478, 0, 0.09803922, 1, 1,
0.3751121, -1.587447, 3.153265, 0, 0.09411765, 1, 1,
0.3754413, 0.2290696, 0.3853225, 0, 0.08627451, 1, 1,
0.3758219, 0.04823687, 0.820514, 0, 0.08235294, 1, 1,
0.3773537, 0.8341694, 0.02847302, 0, 0.07450981, 1, 1,
0.3800526, 0.642589, 0.6216586, 0, 0.07058824, 1, 1,
0.3809063, -0.3524016, 2.956624, 0, 0.0627451, 1, 1,
0.3870514, -1.053671, 2.563473, 0, 0.05882353, 1, 1,
0.3903825, -0.05218958, 3.548099, 0, 0.05098039, 1, 1,
0.3903997, -0.4439172, 2.938008, 0, 0.04705882, 1, 1,
0.3907806, -0.4764591, -0.02698005, 0, 0.03921569, 1, 1,
0.3911152, 1.642332, -1.043911, 0, 0.03529412, 1, 1,
0.3934683, -0.5779843, 2.24194, 0, 0.02745098, 1, 1,
0.4025621, -0.8468272, 1.130816, 0, 0.02352941, 1, 1,
0.4081758, 0.06975152, 2.478478, 0, 0.01568628, 1, 1,
0.4119625, 0.6502841, 1.226331, 0, 0.01176471, 1, 1,
0.4160213, -0.8808685, 1.474163, 0, 0.003921569, 1, 1,
0.4166276, 0.1171004, 0.8281243, 0.003921569, 0, 1, 1,
0.4176589, 0.6055782, 1.167921, 0.007843138, 0, 1, 1,
0.4189593, 0.7911104, -0.7476362, 0.01568628, 0, 1, 1,
0.4273281, -0.8717278, 2.785032, 0.01960784, 0, 1, 1,
0.4286339, -1.281035, 2.871209, 0.02745098, 0, 1, 1,
0.4312098, -0.002105081, 2.701844, 0.03137255, 0, 1, 1,
0.4343557, 1.589726, 0.7288442, 0.03921569, 0, 1, 1,
0.4358052, 0.1782918, 2.448245, 0.04313726, 0, 1, 1,
0.4496943, 0.2512554, 0.3617478, 0.05098039, 0, 1, 1,
0.4523512, 1.205737, -0.3101992, 0.05490196, 0, 1, 1,
0.4589009, -0.1362926, 2.583173, 0.0627451, 0, 1, 1,
0.4590063, -0.2786262, 0.2655701, 0.06666667, 0, 1, 1,
0.4611002, -0.09852128, 2.636481, 0.07450981, 0, 1, 1,
0.4620817, 0.2124971, 0.7642605, 0.07843138, 0, 1, 1,
0.4632752, 0.3525299, 1.155745, 0.08627451, 0, 1, 1,
0.4646955, 0.8398612, 1.99028, 0.09019608, 0, 1, 1,
0.4683651, -1.613321, 3.295606, 0.09803922, 0, 1, 1,
0.4685796, 0.4351038, 0.1862967, 0.1058824, 0, 1, 1,
0.4712296, 0.3306429, -2.328543, 0.1098039, 0, 1, 1,
0.4727632, 0.9662994, 0.1434838, 0.1176471, 0, 1, 1,
0.4773166, 1.129669, 0.3487341, 0.1215686, 0, 1, 1,
0.4777064, -0.2595518, 1.87812, 0.1294118, 0, 1, 1,
0.48425, -0.7076613, 1.333343, 0.1333333, 0, 1, 1,
0.4845924, -0.7554008, 1.44693, 0.1411765, 0, 1, 1,
0.4847255, 0.7158958, -1.124324, 0.145098, 0, 1, 1,
0.4856142, 0.3608786, 0.8042406, 0.1529412, 0, 1, 1,
0.4873962, -1.437413, 2.668948, 0.1568628, 0, 1, 1,
0.4878368, 0.1804735, 1.672783, 0.1647059, 0, 1, 1,
0.4884583, 0.5934709, -0.1051732, 0.1686275, 0, 1, 1,
0.4914565, -0.2365207, 1.23861, 0.1764706, 0, 1, 1,
0.4937861, 0.1106827, -0.2041997, 0.1803922, 0, 1, 1,
0.499978, 0.8940098, -0.1571574, 0.1882353, 0, 1, 1,
0.5017182, -0.05154263, 1.857823, 0.1921569, 0, 1, 1,
0.504082, 0.2477151, 1.314504, 0.2, 0, 1, 1,
0.5096416, -0.1412126, 1.821191, 0.2078431, 0, 1, 1,
0.5126812, 0.05077203, 2.246112, 0.2117647, 0, 1, 1,
0.5153869, -0.3323035, 3.049161, 0.2196078, 0, 1, 1,
0.5164764, 0.2509262, 1.382294, 0.2235294, 0, 1, 1,
0.5185414, -2.47033, 2.890751, 0.2313726, 0, 1, 1,
0.5220547, 2.052385, -1.140002, 0.2352941, 0, 1, 1,
0.5234463, 0.3968398, 0.3271506, 0.2431373, 0, 1, 1,
0.5243849, -0.5912994, 1.939407, 0.2470588, 0, 1, 1,
0.5285779, -1.450579, 3.302438, 0.254902, 0, 1, 1,
0.529727, 1.099955, 1.64415, 0.2588235, 0, 1, 1,
0.5317167, 0.205508, 0.6384526, 0.2666667, 0, 1, 1,
0.5414839, -1.035596, 3.33298, 0.2705882, 0, 1, 1,
0.5453663, -0.2834568, 2.565069, 0.2784314, 0, 1, 1,
0.5492011, 0.8398572, 1.49894, 0.282353, 0, 1, 1,
0.5539725, -0.4679643, 0.03152372, 0.2901961, 0, 1, 1,
0.5567694, 0.3715026, 0.3292099, 0.2941177, 0, 1, 1,
0.5649881, 0.3322255, -0.2271007, 0.3019608, 0, 1, 1,
0.5663959, -2.312047, 3.872468, 0.3098039, 0, 1, 1,
0.5704725, 0.01658572, 1.582487, 0.3137255, 0, 1, 1,
0.5721129, -1.320976, 3.833479, 0.3215686, 0, 1, 1,
0.5794207, 0.3914911, 1.678273, 0.3254902, 0, 1, 1,
0.5808514, 0.1097831, 0.5980816, 0.3333333, 0, 1, 1,
0.5948577, -2.042048, 2.520013, 0.3372549, 0, 1, 1,
0.5984915, 0.7349994, 0.3766329, 0.345098, 0, 1, 1,
0.5987497, -0.8380002, 2.157231, 0.3490196, 0, 1, 1,
0.6034727, -1.308449, 2.666248, 0.3568628, 0, 1, 1,
0.6111213, -1.360424, 2.329219, 0.3607843, 0, 1, 1,
0.6120132, 0.3776495, 1.792709, 0.3686275, 0, 1, 1,
0.6133813, -0.4937327, 1.33407, 0.372549, 0, 1, 1,
0.6199877, 0.7723644, -1.514911, 0.3803922, 0, 1, 1,
0.6250596, -0.9811289, 0.2297094, 0.3843137, 0, 1, 1,
0.6264469, -2.061397, 3.88427, 0.3921569, 0, 1, 1,
0.6272408, 1.402108, 0.1640368, 0.3960784, 0, 1, 1,
0.6288286, -0.7097769, 2.872496, 0.4039216, 0, 1, 1,
0.6292698, 0.7594193, 1.234008, 0.4117647, 0, 1, 1,
0.6295319, 0.1073797, 1.996507, 0.4156863, 0, 1, 1,
0.6306131, -0.3849334, 1.527266, 0.4235294, 0, 1, 1,
0.63485, -0.8315711, 0.7922204, 0.427451, 0, 1, 1,
0.6390629, 0.5988333, -0.1459768, 0.4352941, 0, 1, 1,
0.6400003, -0.6995466, 0.8814867, 0.4392157, 0, 1, 1,
0.6410295, 1.151948, 1.522824, 0.4470588, 0, 1, 1,
0.6411167, -0.3801793, 0.9832922, 0.4509804, 0, 1, 1,
0.6482328, -2.534948, 2.400404, 0.4588235, 0, 1, 1,
0.6483012, 0.8157338, 0.8894418, 0.4627451, 0, 1, 1,
0.6487243, -0.4812386, 0.4036434, 0.4705882, 0, 1, 1,
0.6488489, -0.6816283, 2.093885, 0.4745098, 0, 1, 1,
0.6536289, -0.7837355, 1.628782, 0.4823529, 0, 1, 1,
0.6562861, -2.047477, 2.407922, 0.4862745, 0, 1, 1,
0.6628639, 0.9464741, 2.258176, 0.4941176, 0, 1, 1,
0.665439, -0.949007, 1.496185, 0.5019608, 0, 1, 1,
0.6737714, 0.4961508, -0.7253394, 0.5058824, 0, 1, 1,
0.6745993, 0.2431809, 1.750881, 0.5137255, 0, 1, 1,
0.6748958, -0.6533771, 2.810282, 0.5176471, 0, 1, 1,
0.6793901, -0.09697691, 3.434831, 0.5254902, 0, 1, 1,
0.6870186, -0.5203158, 0.7861846, 0.5294118, 0, 1, 1,
0.699621, -0.1133177, -0.1954575, 0.5372549, 0, 1, 1,
0.703316, -0.7015138, 2.700132, 0.5411765, 0, 1, 1,
0.7033755, -0.7761533, 1.619879, 0.5490196, 0, 1, 1,
0.7053595, 0.2596043, 2.304173, 0.5529412, 0, 1, 1,
0.7096707, -1.527317, 3.841807, 0.5607843, 0, 1, 1,
0.7135397, -0.5221207, 1.161783, 0.5647059, 0, 1, 1,
0.7186736, 0.4282249, -0.3998963, 0.572549, 0, 1, 1,
0.7410057, -0.4367416, 4.413369, 0.5764706, 0, 1, 1,
0.7440969, 0.7829524, 0.627732, 0.5843138, 0, 1, 1,
0.7515951, 1.584833, 1.753402, 0.5882353, 0, 1, 1,
0.7545582, 0.9855136, 1.543347, 0.5960785, 0, 1, 1,
0.7606009, -0.6972335, 1.6122, 0.6039216, 0, 1, 1,
0.7651021, 0.4280109, 1.688246, 0.6078432, 0, 1, 1,
0.7727842, -0.08356911, 0.01682514, 0.6156863, 0, 1, 1,
0.7767996, 1.836175, 0.2050611, 0.6196079, 0, 1, 1,
0.7771943, 0.4936161, 2.397234, 0.627451, 0, 1, 1,
0.7791892, -0.06020277, 0.2265678, 0.6313726, 0, 1, 1,
0.7796187, 0.3553949, 1.295592, 0.6392157, 0, 1, 1,
0.7800462, -0.2935306, 1.538553, 0.6431373, 0, 1, 1,
0.7805606, -0.1322784, 0.7666974, 0.6509804, 0, 1, 1,
0.7832323, 1.582966, -2.243371, 0.654902, 0, 1, 1,
0.783648, 0.2743188, 2.500985, 0.6627451, 0, 1, 1,
0.7836719, -0.4769255, 1.827973, 0.6666667, 0, 1, 1,
0.7837932, -0.3884563, 3.767551, 0.6745098, 0, 1, 1,
0.784599, 0.4347119, 0.001415263, 0.6784314, 0, 1, 1,
0.7853521, 0.124404, 2.885593, 0.6862745, 0, 1, 1,
0.7992759, -0.07804349, 0.3749866, 0.6901961, 0, 1, 1,
0.8088725, 0.7966414, 1.108801, 0.6980392, 0, 1, 1,
0.8111235, -0.1904448, 1.52269, 0.7058824, 0, 1, 1,
0.8113414, -0.4020505, 2.429312, 0.7098039, 0, 1, 1,
0.811498, -0.5079247, 2.840806, 0.7176471, 0, 1, 1,
0.8118706, 0.8627646, 0.1977292, 0.7215686, 0, 1, 1,
0.8154294, -0.4262101, 2.813141, 0.7294118, 0, 1, 1,
0.8171672, -0.5828646, 0.09647486, 0.7333333, 0, 1, 1,
0.8181053, 0.7299333, 1.100447, 0.7411765, 0, 1, 1,
0.8208837, 0.5364916, 1.117306, 0.7450981, 0, 1, 1,
0.8237035, 1.31004, -2.107979, 0.7529412, 0, 1, 1,
0.8313177, 1.888773, 0.8572472, 0.7568628, 0, 1, 1,
0.831879, -0.9556994, 3.122131, 0.7647059, 0, 1, 1,
0.8341731, 0.002194054, 1.464673, 0.7686275, 0, 1, 1,
0.8350421, 1.20841, 2.481606, 0.7764706, 0, 1, 1,
0.8407251, 0.6954325, 0.7891917, 0.7803922, 0, 1, 1,
0.8602212, -0.9535953, 3.596898, 0.7882353, 0, 1, 1,
0.8616332, 1.063534, 0.2979586, 0.7921569, 0, 1, 1,
0.8625787, -1.041561, 4.308438, 0.8, 0, 1, 1,
0.868502, -2.366051, 2.57206, 0.8078431, 0, 1, 1,
0.8688876, 1.714384, 0.839248, 0.8117647, 0, 1, 1,
0.8705806, 1.125827, 1.748171, 0.8196079, 0, 1, 1,
0.8711731, 0.4877414, 0.8941578, 0.8235294, 0, 1, 1,
0.8736433, 0.9036547, 1.275715, 0.8313726, 0, 1, 1,
0.8743255, 1.651788, -0.3904905, 0.8352941, 0, 1, 1,
0.8750463, -0.04098224, 0.4882874, 0.8431373, 0, 1, 1,
0.877288, -0.9897608, 3.443503, 0.8470588, 0, 1, 1,
0.8790993, -2.066431, 3.412247, 0.854902, 0, 1, 1,
0.8830281, -0.2060949, 2.215374, 0.8588235, 0, 1, 1,
0.8841116, 0.2776675, -1.549615, 0.8666667, 0, 1, 1,
0.8862004, -1.907804, 3.310389, 0.8705882, 0, 1, 1,
0.8930361, 1.456409, -0.6545409, 0.8784314, 0, 1, 1,
0.8947684, -1.387961, 2.913928, 0.8823529, 0, 1, 1,
0.8958445, -0.2663089, 1.379464, 0.8901961, 0, 1, 1,
0.8975877, -0.03464609, -1.008672, 0.8941177, 0, 1, 1,
0.9125897, -0.1444285, 0.6711337, 0.9019608, 0, 1, 1,
0.9139118, -1.501406, 3.709495, 0.9098039, 0, 1, 1,
0.9154784, -0.4431528, 0.7306074, 0.9137255, 0, 1, 1,
0.9205343, -1.078422, 3.409933, 0.9215686, 0, 1, 1,
0.9218988, -2.788499, 2.251074, 0.9254902, 0, 1, 1,
0.9238368, 0.00612227, 1.421785, 0.9333333, 0, 1, 1,
0.9246667, 0.2894938, 0.7080382, 0.9372549, 0, 1, 1,
0.9296265, -0.8188578, 3.818335, 0.945098, 0, 1, 1,
0.936204, 0.3849539, 2.410684, 0.9490196, 0, 1, 1,
0.9368568, -1.128457, 3.384939, 0.9568627, 0, 1, 1,
0.9410132, 0.6253769, -0.1162817, 0.9607843, 0, 1, 1,
0.9412885, 2.266971, 0.7727039, 0.9686275, 0, 1, 1,
0.9501609, 0.381795, 2.011483, 0.972549, 0, 1, 1,
0.9530467, 0.1976047, 0.4064568, 0.9803922, 0, 1, 1,
0.9582399, -0.3058063, 0.7056555, 0.9843137, 0, 1, 1,
0.9597848, 1.749941, 1.17132, 0.9921569, 0, 1, 1,
0.9631062, 0.5469561, 0.489675, 0.9960784, 0, 1, 1,
0.9634666, -1.128337, 2.569355, 1, 0, 0.9960784, 1,
0.9670435, 0.6738148, 0.387917, 1, 0, 0.9882353, 1,
0.9683483, -0.569363, 1.766, 1, 0, 0.9843137, 1,
0.9703408, 0.2186144, 1.331432, 1, 0, 0.9764706, 1,
0.9793927, 0.08836703, 0.8688264, 1, 0, 0.972549, 1,
0.9810594, -0.9387249, 3.323224, 1, 0, 0.9647059, 1,
0.9856672, -0.1808387, 1.346467, 1, 0, 0.9607843, 1,
0.9902021, 0.04659694, 1.24079, 1, 0, 0.9529412, 1,
0.9952965, 0.5131986, 1.655074, 1, 0, 0.9490196, 1,
0.9976739, -0.866977, 2.876844, 1, 0, 0.9411765, 1,
0.9987782, -0.1215759, 1.000794, 1, 0, 0.9372549, 1,
1.00444, 0.1663747, 1.599413, 1, 0, 0.9294118, 1,
1.009678, 1.362784, 0.5164706, 1, 0, 0.9254902, 1,
1.018232, 0.7139322, 0.1829942, 1, 0, 0.9176471, 1,
1.026425, -0.5309391, 3.91343, 1, 0, 0.9137255, 1,
1.031271, -1.219832, 3.168028, 1, 0, 0.9058824, 1,
1.036804, 0.1709992, -0.115082, 1, 0, 0.9019608, 1,
1.039314, -1.367366, 1.615629, 1, 0, 0.8941177, 1,
1.040377, 0.3655385, 1.296205, 1, 0, 0.8862745, 1,
1.044504, 0.8001341, 0.3789796, 1, 0, 0.8823529, 1,
1.044898, 1.384195, 0.3934121, 1, 0, 0.8745098, 1,
1.045756, -0.926534, 2.579222, 1, 0, 0.8705882, 1,
1.048616, -0.2737329, 1.301321, 1, 0, 0.8627451, 1,
1.049587, 2.682273, -2.231808, 1, 0, 0.8588235, 1,
1.052829, -1.672835, 2.414727, 1, 0, 0.8509804, 1,
1.054422, -0.5062091, 2.143655, 1, 0, 0.8470588, 1,
1.059484, -1.146369, 2.381563, 1, 0, 0.8392157, 1,
1.062033, 0.1787203, 2.379071, 1, 0, 0.8352941, 1,
1.070722, -0.1929356, 0.8367544, 1, 0, 0.827451, 1,
1.078901, 1.441688, -0.8005824, 1, 0, 0.8235294, 1,
1.079913, -1.088403, 3.590675, 1, 0, 0.8156863, 1,
1.080788, -0.6720479, 2.577642, 1, 0, 0.8117647, 1,
1.085474, 1.774318, 2.278981, 1, 0, 0.8039216, 1,
1.094136, -1.936439, 3.424497, 1, 0, 0.7960784, 1,
1.095269, -0.03669193, 2.445227, 1, 0, 0.7921569, 1,
1.097914, -0.6226669, 1.097207, 1, 0, 0.7843137, 1,
1.098658, -0.1558429, 1.564178, 1, 0, 0.7803922, 1,
1.106169, 0.4047305, 2.466075, 1, 0, 0.772549, 1,
1.107677, -1.618556, 1.702016, 1, 0, 0.7686275, 1,
1.114591, -0.9222477, 2.045573, 1, 0, 0.7607843, 1,
1.117474, -0.6687137, 1.904444, 1, 0, 0.7568628, 1,
1.123967, -0.03557585, 2.470225, 1, 0, 0.7490196, 1,
1.124649, 0.1114228, 2.024075, 1, 0, 0.7450981, 1,
1.129774, 0.6777915, 0.6011598, 1, 0, 0.7372549, 1,
1.132053, -0.422917, 0.7726866, 1, 0, 0.7333333, 1,
1.134393, -0.4190867, 0.6540156, 1, 0, 0.7254902, 1,
1.150756, 0.0533743, 1.846463, 1, 0, 0.7215686, 1,
1.158974, 0.5033807, 3.146514, 1, 0, 0.7137255, 1,
1.159953, 0.1249697, 0.6862917, 1, 0, 0.7098039, 1,
1.161367, -0.9156931, 2.151453, 1, 0, 0.7019608, 1,
1.170839, 0.8645551, -0.182466, 1, 0, 0.6941177, 1,
1.175035, -0.3175064, 2.508768, 1, 0, 0.6901961, 1,
1.196442, -1.042751, 1.370161, 1, 0, 0.682353, 1,
1.207317, -0.6435754, 1.291544, 1, 0, 0.6784314, 1,
1.211944, -1.227338, 4.233592, 1, 0, 0.6705883, 1,
1.212891, -0.38909, 1.059138, 1, 0, 0.6666667, 1,
1.218344, -0.1530814, 1.604304, 1, 0, 0.6588235, 1,
1.219507, -0.6622727, 0.7942644, 1, 0, 0.654902, 1,
1.225866, 0.1552715, 0.1143274, 1, 0, 0.6470588, 1,
1.229323, 0.3570712, 2.970741, 1, 0, 0.6431373, 1,
1.258253, 0.520432, -0.1229522, 1, 0, 0.6352941, 1,
1.271905, 0.2394761, 0.3252853, 1, 0, 0.6313726, 1,
1.27373, 0.6142419, 1.311981, 1, 0, 0.6235294, 1,
1.27651, -7.576859e-05, 1.370421, 1, 0, 0.6196079, 1,
1.277009, 0.09862037, 0.1119685, 1, 0, 0.6117647, 1,
1.279615, 0.03414609, 2.244497, 1, 0, 0.6078432, 1,
1.28628, 1.92543, -0.4918323, 1, 0, 0.6, 1,
1.287211, 0.7667729, 1.376224, 1, 0, 0.5921569, 1,
1.292377, 0.4571681, 0.3621159, 1, 0, 0.5882353, 1,
1.299082, -1.504267, 1.640684, 1, 0, 0.5803922, 1,
1.302307, -0.5235893, 1.18788, 1, 0, 0.5764706, 1,
1.303008, 0.4284466, -0.1858425, 1, 0, 0.5686275, 1,
1.304318, 1.01798, 2.181075, 1, 0, 0.5647059, 1,
1.30522, 0.5713908, 2.43085, 1, 0, 0.5568628, 1,
1.325867, 0.2728534, 0.1794421, 1, 0, 0.5529412, 1,
1.32882, -0.301877, 2.09196, 1, 0, 0.5450981, 1,
1.329852, 0.4103861, 0.7901418, 1, 0, 0.5411765, 1,
1.34381, -1.24788, 2.196291, 1, 0, 0.5333334, 1,
1.346794, 0.02229137, -0.9808892, 1, 0, 0.5294118, 1,
1.348793, -0.9950387, 2.758088, 1, 0, 0.5215687, 1,
1.349079, 0.3684462, 2.660429, 1, 0, 0.5176471, 1,
1.352991, 0.6712028, 3.016143, 1, 0, 0.509804, 1,
1.358723, 1.012779, 0.64223, 1, 0, 0.5058824, 1,
1.36421, 0.2775023, 2.107056, 1, 0, 0.4980392, 1,
1.367773, 0.9618438, 1.170333, 1, 0, 0.4901961, 1,
1.371446, -0.9850854, 0.9328249, 1, 0, 0.4862745, 1,
1.373171, 0.3584142, 2.072902, 1, 0, 0.4784314, 1,
1.37481, -1.212358, 1.510096, 1, 0, 0.4745098, 1,
1.376003, -0.6916943, 0.7984869, 1, 0, 0.4666667, 1,
1.380584, 1.96817, -0.4167598, 1, 0, 0.4627451, 1,
1.386753, -0.6383692, 2.017341, 1, 0, 0.454902, 1,
1.393589, 0.6466713, 2.19719, 1, 0, 0.4509804, 1,
1.401893, 1.867329, 0.6196223, 1, 0, 0.4431373, 1,
1.411231, -0.2799761, 1.701288, 1, 0, 0.4392157, 1,
1.411847, 0.3828146, 0.7744364, 1, 0, 0.4313726, 1,
1.41443, 2.033105, 1.646682, 1, 0, 0.427451, 1,
1.431474, -1.248929, 2.841854, 1, 0, 0.4196078, 1,
1.439677, 1.161514, -1.989631, 1, 0, 0.4156863, 1,
1.440057, 0.2135051, 1.348693, 1, 0, 0.4078431, 1,
1.44184, 2.499647, -1.205888, 1, 0, 0.4039216, 1,
1.447859, 0.7297072, 1.864117, 1, 0, 0.3960784, 1,
1.481058, -1.358448, 2.593796, 1, 0, 0.3882353, 1,
1.483734, 0.6574321, 2.292724, 1, 0, 0.3843137, 1,
1.488085, -0.4391488, 2.55073, 1, 0, 0.3764706, 1,
1.499448, 1.38638, 0.4896935, 1, 0, 0.372549, 1,
1.507436, 0.945355, 2.268288, 1, 0, 0.3647059, 1,
1.510091, -0.8234664, 0.8525557, 1, 0, 0.3607843, 1,
1.528889, 0.5005386, 0.6051939, 1, 0, 0.3529412, 1,
1.530484, 1.848483, 1.467122, 1, 0, 0.3490196, 1,
1.531817, 0.04238823, 2.915896, 1, 0, 0.3411765, 1,
1.546608, 0.4348256, 2.447147, 1, 0, 0.3372549, 1,
1.547741, 0.4934014, 0.6003929, 1, 0, 0.3294118, 1,
1.555938, -0.4553333, 1.160642, 1, 0, 0.3254902, 1,
1.565949, 0.6506134, 2.276887, 1, 0, 0.3176471, 1,
1.582854, 0.9476852, 2.054463, 1, 0, 0.3137255, 1,
1.604276, 0.5626155, 1.390534, 1, 0, 0.3058824, 1,
1.605513, 1.929878, -0.07978988, 1, 0, 0.2980392, 1,
1.609081, 1.705465, -1.038457, 1, 0, 0.2941177, 1,
1.614673, 0.2486378, 0.7962376, 1, 0, 0.2862745, 1,
1.621824, -0.5067763, 1.628471, 1, 0, 0.282353, 1,
1.645338, 1.153001, 0.3117282, 1, 0, 0.2745098, 1,
1.65649, -1.39181, 3.262777, 1, 0, 0.2705882, 1,
1.660246, -0.3763291, 2.372025, 1, 0, 0.2627451, 1,
1.66067, 1.45225, 0.3469503, 1, 0, 0.2588235, 1,
1.675351, -1.467844, 1.966415, 1, 0, 0.2509804, 1,
1.693716, 0.8503983, -0.2482156, 1, 0, 0.2470588, 1,
1.69856, -0.04217686, 0.3838182, 1, 0, 0.2392157, 1,
1.731384, -0.2493426, 0.2157056, 1, 0, 0.2352941, 1,
1.740868, 0.4791218, 1.853871, 1, 0, 0.227451, 1,
1.745414, 0.00838706, 1.955873, 1, 0, 0.2235294, 1,
1.756284, 0.7372546, 1.722194, 1, 0, 0.2156863, 1,
1.770511, -0.3070022, 0.2996149, 1, 0, 0.2117647, 1,
1.778054, -0.9182944, 2.293492, 1, 0, 0.2039216, 1,
1.796055, -1.670615, 2.452164, 1, 0, 0.1960784, 1,
1.827103, 1.850529, 0.9627928, 1, 0, 0.1921569, 1,
1.853707, 1.750323, 0.2026317, 1, 0, 0.1843137, 1,
1.867518, 1.272835, 1.491593, 1, 0, 0.1803922, 1,
1.886724, -0.5163472, 1.996439, 1, 0, 0.172549, 1,
1.91986, -0.3260309, 2.949484, 1, 0, 0.1686275, 1,
1.925277, 0.7749542, 0.269272, 1, 0, 0.1607843, 1,
1.937897, 1.783697, 0.01457483, 1, 0, 0.1568628, 1,
1.971612, 0.2117502, 1.928311, 1, 0, 0.1490196, 1,
1.983542, 0.03219283, 1.792799, 1, 0, 0.145098, 1,
1.98717, -2.435621, 3.033524, 1, 0, 0.1372549, 1,
1.999937, 0.5244002, 0.08902944, 1, 0, 0.1333333, 1,
2.0463, 0.5413412, 2.543016, 1, 0, 0.1254902, 1,
2.059314, -0.8156353, 1.232092, 1, 0, 0.1215686, 1,
2.073624, -0.1522537, 0.4782008, 1, 0, 0.1137255, 1,
2.074142, -0.2107563, 3.822433, 1, 0, 0.1098039, 1,
2.100645, -0.637737, 2.06099, 1, 0, 0.1019608, 1,
2.121561, 0.1490588, 1.421642, 1, 0, 0.09411765, 1,
2.122426, 0.2830629, 1.238604, 1, 0, 0.09019608, 1,
2.135903, 0.1440677, 1.253486, 1, 0, 0.08235294, 1,
2.164043, 0.7310788, 2.21575, 1, 0, 0.07843138, 1,
2.175987, 0.1153987, 1.816101, 1, 0, 0.07058824, 1,
2.197982, 0.9311241, 2.615194, 1, 0, 0.06666667, 1,
2.258863, -0.2928741, 0.7375214, 1, 0, 0.05882353, 1,
2.297482, 0.8730398, 1.254002, 1, 0, 0.05490196, 1,
2.428061, 1.917642, 0.5175043, 1, 0, 0.04705882, 1,
2.461215, -0.3054816, 0.8929709, 1, 0, 0.04313726, 1,
2.512627, 0.1394546, 4.022171, 1, 0, 0.03529412, 1,
2.645287, 0.5291005, 0.7315349, 1, 0, 0.03137255, 1,
2.669774, 0.4383764, 2.346414, 1, 0, 0.02352941, 1,
2.862374, 0.8133023, 0.3427222, 1, 0, 0.01960784, 1,
3.009599, -1.55891, 2.023301, 1, 0, 0.01176471, 1,
3.166077, -0.6660125, 0.7310533, 1, 0, 0.007843138, 1
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
-0.2098479, -4.781813, -6.575748, 0, -0.5, 0.5, 0.5,
-0.2098479, -4.781813, -6.575748, 1, -0.5, 0.5, 0.5,
-0.2098479, -4.781813, -6.575748, 1, 1.5, 0.5, 0.5,
-0.2098479, -4.781813, -6.575748, 0, 1.5, 0.5, 0.5
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
-4.730212, -0.096313, -6.575748, 0, -0.5, 0.5, 0.5,
-4.730212, -0.096313, -6.575748, 1, -0.5, 0.5, 0.5,
-4.730212, -0.096313, -6.575748, 1, 1.5, 0.5, 0.5,
-4.730212, -0.096313, -6.575748, 0, 1.5, 0.5, 0.5
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
-4.730212, -4.781813, -0.05680394, 0, -0.5, 0.5, 0.5,
-4.730212, -4.781813, -0.05680394, 1, -0.5, 0.5, 0.5,
-4.730212, -4.781813, -0.05680394, 1, 1.5, 0.5, 0.5,
-4.730212, -4.781813, -0.05680394, 0, 1.5, 0.5, 0.5
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
-3, -3.700544, -5.071377,
3, -3.700544, -5.071377,
-3, -3.700544, -5.071377,
-3, -3.880755, -5.322105,
-2, -3.700544, -5.071377,
-2, -3.880755, -5.322105,
-1, -3.700544, -5.071377,
-1, -3.880755, -5.322105,
0, -3.700544, -5.071377,
0, -3.880755, -5.322105,
1, -3.700544, -5.071377,
1, -3.880755, -5.322105,
2, -3.700544, -5.071377,
2, -3.880755, -5.322105,
3, -3.700544, -5.071377,
3, -3.880755, -5.322105
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
-3, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
-3, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
-3, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
-3, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
-2, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
-2, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
-2, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
-2, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
-1, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
-1, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
-1, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
-1, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
0, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
0, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
0, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
0, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
1, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
1, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
1, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
1, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
2, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
2, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
2, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
2, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5,
3, -4.241178, -5.823563, 0, -0.5, 0.5, 0.5,
3, -4.241178, -5.823563, 1, -0.5, 0.5, 0.5,
3, -4.241178, -5.823563, 1, 1.5, 0.5, 0.5,
3, -4.241178, -5.823563, 0, 1.5, 0.5, 0.5
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
-3.687051, -3, -5.071377,
-3.687051, 3, -5.071377,
-3.687051, -3, -5.071377,
-3.860911, -3, -5.322105,
-3.687051, -2, -5.071377,
-3.860911, -2, -5.322105,
-3.687051, -1, -5.071377,
-3.860911, -1, -5.322105,
-3.687051, 0, -5.071377,
-3.860911, 0, -5.322105,
-3.687051, 1, -5.071377,
-3.860911, 1, -5.322105,
-3.687051, 2, -5.071377,
-3.860911, 2, -5.322105,
-3.687051, 3, -5.071377,
-3.860911, 3, -5.322105
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
-4.208631, -3, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, -3, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, -3, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, -3, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, -2, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, -2, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, -2, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, -2, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, -1, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, -1, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, -1, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, -1, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, 0, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, 0, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, 0, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, 0, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, 1, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, 1, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, 1, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, 1, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, 2, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, 2, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, 2, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, 2, -5.823563, 0, 1.5, 0.5, 0.5,
-4.208631, 3, -5.823563, 0, -0.5, 0.5, 0.5,
-4.208631, 3, -5.823563, 1, -0.5, 0.5, 0.5,
-4.208631, 3, -5.823563, 1, 1.5, 0.5, 0.5,
-4.208631, 3, -5.823563, 0, 1.5, 0.5, 0.5
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
-3.687051, -3.700544, -4,
-3.687051, -3.700544, 4,
-3.687051, -3.700544, -4,
-3.860911, -3.880755, -4,
-3.687051, -3.700544, -2,
-3.860911, -3.880755, -2,
-3.687051, -3.700544, 0,
-3.860911, -3.880755, 0,
-3.687051, -3.700544, 2,
-3.860911, -3.880755, 2,
-3.687051, -3.700544, 4,
-3.860911, -3.880755, 4
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
-4.208631, -4.241178, -4, 0, -0.5, 0.5, 0.5,
-4.208631, -4.241178, -4, 1, -0.5, 0.5, 0.5,
-4.208631, -4.241178, -4, 1, 1.5, 0.5, 0.5,
-4.208631, -4.241178, -4, 0, 1.5, 0.5, 0.5,
-4.208631, -4.241178, -2, 0, -0.5, 0.5, 0.5,
-4.208631, -4.241178, -2, 1, -0.5, 0.5, 0.5,
-4.208631, -4.241178, -2, 1, 1.5, 0.5, 0.5,
-4.208631, -4.241178, -2, 0, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 0, 0, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 0, 1, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 0, 1, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 0, 0, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 2, 0, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 2, 1, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 2, 1, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 2, 0, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 4, 0, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 4, 1, -0.5, 0.5, 0.5,
-4.208631, -4.241178, 4, 1, 1.5, 0.5, 0.5,
-4.208631, -4.241178, 4, 0, 1.5, 0.5, 0.5
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
-3.687051, -3.700544, -5.071377,
-3.687051, 3.507918, -5.071377,
-3.687051, -3.700544, 4.957769,
-3.687051, 3.507918, 4.957769,
-3.687051, -3.700544, -5.071377,
-3.687051, -3.700544, 4.957769,
-3.687051, 3.507918, -5.071377,
-3.687051, 3.507918, 4.957769,
-3.687051, -3.700544, -5.071377,
3.267355, -3.700544, -5.071377,
-3.687051, -3.700544, 4.957769,
3.267355, -3.700544, 4.957769,
-3.687051, 3.507918, -5.071377,
3.267355, 3.507918, -5.071377,
-3.687051, 3.507918, 4.957769,
3.267355, 3.507918, 4.957769,
3.267355, -3.700544, -5.071377,
3.267355, 3.507918, -5.071377,
3.267355, -3.700544, 4.957769,
3.267355, 3.507918, 4.957769,
3.267355, -3.700544, -5.071377,
3.267355, -3.700544, 4.957769,
3.267355, 3.507918, -5.071377,
3.267355, 3.507918, 4.957769
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
var radius = 7.568776;
var distance = 33.67434;
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
mvMatrix.translate( 0.2098479, 0.096313, 0.05680394 );
mvMatrix.scale( 1.176737, 1.135264, 0.8159727 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.67434);
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
Chlorbufam<-read.table("Chlorbufam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorbufam$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbufam' not found
```

```r
y<-Chlorbufam$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbufam' not found
```

```r
z<-Chlorbufam$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorbufam' not found
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
-3.585773, -0.6831921, -1.160906, 0, 0, 1, 1, 1,
-3.051821, -0.9652546, -2.674387, 1, 0, 0, 1, 1,
-3.046995, 0.2262206, -3.005668, 1, 0, 0, 1, 1,
-2.592266, -0.0453042, -1.127689, 1, 0, 0, 1, 1,
-2.474655, 0.01050497, -1.473279, 1, 0, 0, 1, 1,
-2.429814, -0.3711276, -2.07564, 1, 0, 0, 1, 1,
-2.418965, 0.7865059, -1.966508, 0, 0, 0, 1, 1,
-2.402995, -0.3634851, -1.62892, 0, 0, 0, 1, 1,
-2.347013, -1.321005, -2.023914, 0, 0, 0, 1, 1,
-2.281293, 0.8876731, -1.132692, 0, 0, 0, 1, 1,
-2.261349, 0.8533289, -3.377053, 0, 0, 0, 1, 1,
-2.227044, -0.554285, -1.811931, 0, 0, 0, 1, 1,
-2.210849, -1.420307, -2.608846, 0, 0, 0, 1, 1,
-2.139459, 0.4134542, -0.6596491, 1, 1, 1, 1, 1,
-2.091857, 0.2100565, -1.630823, 1, 1, 1, 1, 1,
-2.07615, 0.4970119, -1.036581, 1, 1, 1, 1, 1,
-2.056625, -0.9893093, -2.16291, 1, 1, 1, 1, 1,
-2.020741, -0.5470198, -3.505583, 1, 1, 1, 1, 1,
-2.011791, -0.1422691, -3.281833, 1, 1, 1, 1, 1,
-1.96973, -0.1131027, -0.7674124, 1, 1, 1, 1, 1,
-1.95417, -1.706943, -0.8945577, 1, 1, 1, 1, 1,
-1.93857, 0.814539, -0.9557557, 1, 1, 1, 1, 1,
-1.883638, 0.1202453, -2.383749, 1, 1, 1, 1, 1,
-1.875041, -0.526985, -1.470172, 1, 1, 1, 1, 1,
-1.805984, 1.361456, -2.050772, 1, 1, 1, 1, 1,
-1.800878, -0.2802103, -1.476758, 1, 1, 1, 1, 1,
-1.786954, -1.0389, -1.740286, 1, 1, 1, 1, 1,
-1.782227, -1.597362, -1.571952, 1, 1, 1, 1, 1,
-1.773502, 1.06111, -0.246346, 0, 0, 1, 1, 1,
-1.772578, 0.4420659, -1.409894, 1, 0, 0, 1, 1,
-1.771669, 2.449483, -0.6688443, 1, 0, 0, 1, 1,
-1.767239, 0.1555094, -1.253805, 1, 0, 0, 1, 1,
-1.763375, 1.133314, -2.07967, 1, 0, 0, 1, 1,
-1.757082, 0.06637378, -0.6002799, 1, 0, 0, 1, 1,
-1.74858, 0.8866733, 0.5733375, 0, 0, 0, 1, 1,
-1.732945, -0.8150429, -1.107351, 0, 0, 0, 1, 1,
-1.72203, 0.5444605, -0.8094154, 0, 0, 0, 1, 1,
-1.691049, -0.4840035, -0.225098, 0, 0, 0, 1, 1,
-1.681541, 0.3741577, -0.211843, 0, 0, 0, 1, 1,
-1.675219, -0.5501093, -4.030209, 0, 0, 0, 1, 1,
-1.675215, 1.248993, -0.82594, 0, 0, 0, 1, 1,
-1.675188, 1.058166, 0.2666454, 1, 1, 1, 1, 1,
-1.660386, 0.9190104, -1.380845, 1, 1, 1, 1, 1,
-1.659405, -1.917312, -2.598583, 1, 1, 1, 1, 1,
-1.654962, -1.694333, -1.660965, 1, 1, 1, 1, 1,
-1.652636, -0.6870291, -3.119284, 1, 1, 1, 1, 1,
-1.652047, 0.1058942, -3.005946, 1, 1, 1, 1, 1,
-1.634466, 0.1774039, -2.674159, 1, 1, 1, 1, 1,
-1.631555, -0.772724, -0.9854775, 1, 1, 1, 1, 1,
-1.626431, -0.1879714, -2.876289, 1, 1, 1, 1, 1,
-1.619601, 0.6969761, -1.774323, 1, 1, 1, 1, 1,
-1.615862, -0.176691, -1.474332, 1, 1, 1, 1, 1,
-1.582768, 0.5403982, -1.822812, 1, 1, 1, 1, 1,
-1.543561, 0.4140506, 0.6000775, 1, 1, 1, 1, 1,
-1.543299, -0.8711651, -0.8261575, 1, 1, 1, 1, 1,
-1.537967, 2.297536, 1.314313, 1, 1, 1, 1, 1,
-1.516484, 0.441715, -2.859548, 0, 0, 1, 1, 1,
-1.516391, 0.5235025, 0.9433751, 1, 0, 0, 1, 1,
-1.513753, -0.195127, -1.636142, 1, 0, 0, 1, 1,
-1.513253, -0.1937378, -0.827756, 1, 0, 0, 1, 1,
-1.51316, -1.533946, -3.128021, 1, 0, 0, 1, 1,
-1.504553, -0.1947178, -2.879241, 1, 0, 0, 1, 1,
-1.489552, 1.894837, -2.875462, 0, 0, 0, 1, 1,
-1.483072, -0.2201225, -1.248174, 0, 0, 0, 1, 1,
-1.477485, -0.2605758, -0.5155408, 0, 0, 0, 1, 1,
-1.468204, 0.4394025, -0.2649786, 0, 0, 0, 1, 1,
-1.465004, -0.1072103, -3.467453, 0, 0, 0, 1, 1,
-1.455896, 0.07196363, -0.7065918, 0, 0, 0, 1, 1,
-1.455111, -0.5579225, -1.598989, 0, 0, 0, 1, 1,
-1.430379, 0.03663644, -1.674136, 1, 1, 1, 1, 1,
-1.429536, 1.554367, -2.114992, 1, 1, 1, 1, 1,
-1.418186, -0.8093615, -1.073916, 1, 1, 1, 1, 1,
-1.414954, -0.5078173, -1.438213, 1, 1, 1, 1, 1,
-1.408968, 1.764143, 0.1034824, 1, 1, 1, 1, 1,
-1.397, -1.430701, -2.203285, 1, 1, 1, 1, 1,
-1.394484, 1.51717, -2.430957, 1, 1, 1, 1, 1,
-1.391358, 0.4517052, -1.380942, 1, 1, 1, 1, 1,
-1.389589, 0.3272198, -0.7117848, 1, 1, 1, 1, 1,
-1.386495, 0.3270956, -1.46778, 1, 1, 1, 1, 1,
-1.383968, -0.4281095, -1.982186, 1, 1, 1, 1, 1,
-1.369828, -0.9412161, -2.277153, 1, 1, 1, 1, 1,
-1.364458, -1.300825, -3.47379, 1, 1, 1, 1, 1,
-1.353759, 0.9773222, 1.310897, 1, 1, 1, 1, 1,
-1.329225, 1.323883, -0.4770537, 1, 1, 1, 1, 1,
-1.327561, -0.2321182, -0.5115472, 0, 0, 1, 1, 1,
-1.325637, 0.6604084, -3.005729, 1, 0, 0, 1, 1,
-1.319208, 1.40761, -1.774937, 1, 0, 0, 1, 1,
-1.290608, 0.3430651, -1.381799, 1, 0, 0, 1, 1,
-1.288756, -1.49449, -3.642939, 1, 0, 0, 1, 1,
-1.283358, -0.2531231, -2.288872, 1, 0, 0, 1, 1,
-1.282332, -0.2686811, -0.4840991, 0, 0, 0, 1, 1,
-1.274439, -0.4175585, -3.649442, 0, 0, 0, 1, 1,
-1.271425, -0.3294197, -2.685829, 0, 0, 0, 1, 1,
-1.264073, -1.15405, -3.884746, 0, 0, 0, 1, 1,
-1.253487, -0.7349817, -2.159096, 0, 0, 0, 1, 1,
-1.252282, -0.3848825, -2.011868, 0, 0, 0, 1, 1,
-1.251788, 0.09504817, -0.9850984, 0, 0, 0, 1, 1,
-1.243756, -0.5502982, -3.861006, 1, 1, 1, 1, 1,
-1.240833, -1.012808, 0.214086, 1, 1, 1, 1, 1,
-1.224339, 0.4353585, -1.086512, 1, 1, 1, 1, 1,
-1.219571, 1.425504, -0.3966405, 1, 1, 1, 1, 1,
-1.215095, -0.02816857, -1.826786, 1, 1, 1, 1, 1,
-1.208534, 1.265418, -0.4974301, 1, 1, 1, 1, 1,
-1.194543, 2.667234, -0.7186401, 1, 1, 1, 1, 1,
-1.192654, -1.176605, -1.6329, 1, 1, 1, 1, 1,
-1.186435, 0.5550944, -2.157574, 1, 1, 1, 1, 1,
-1.185069, 1.504686, -1.460563, 1, 1, 1, 1, 1,
-1.181834, -1.703943, -0.7125539, 1, 1, 1, 1, 1,
-1.175002, -0.8364529, -2.905354, 1, 1, 1, 1, 1,
-1.173934, 0.7188427, -0.4395316, 1, 1, 1, 1, 1,
-1.172961, -1.583398, -0.6782436, 1, 1, 1, 1, 1,
-1.172305, 1.555782, -2.03039, 1, 1, 1, 1, 1,
-1.160002, 0.5979408, -1.83043, 0, 0, 1, 1, 1,
-1.15717, -0.7733548, -2.255924, 1, 0, 0, 1, 1,
-1.155467, 1.113621, -1.981173, 1, 0, 0, 1, 1,
-1.135928, -1.108066, -1.518766, 1, 0, 0, 1, 1,
-1.132531, -1.046205, -0.3085721, 1, 0, 0, 1, 1,
-1.126333, 0.6611124, -1.100433, 1, 0, 0, 1, 1,
-1.120113, -2.679777, -3.743089, 0, 0, 0, 1, 1,
-1.119268, 0.2962234, -1.83073, 0, 0, 0, 1, 1,
-1.118213, -0.2633961, -1.990443, 0, 0, 0, 1, 1,
-1.112261, 0.7885492, 0.4795383, 0, 0, 0, 1, 1,
-1.111669, 2.616542, -0.3218991, 0, 0, 0, 1, 1,
-1.107463, -1.272337, -3.49507, 0, 0, 0, 1, 1,
-1.106464, -0.2794549, -3.281936, 0, 0, 0, 1, 1,
-1.103392, 0.3155863, -2.979909, 1, 1, 1, 1, 1,
-1.102104, -0.05992575, -3.845232, 1, 1, 1, 1, 1,
-1.095964, -0.1028872, -0.03017969, 1, 1, 1, 1, 1,
-1.092044, 0.9322717, -2.493645, 1, 1, 1, 1, 1,
-1.084603, 0.03734299, -4.178763, 1, 1, 1, 1, 1,
-1.068968, 0.9984775, -1.754814, 1, 1, 1, 1, 1,
-1.068747, -0.2443534, -4.419672, 1, 1, 1, 1, 1,
-1.068488, 0.06378078, -2.515575, 1, 1, 1, 1, 1,
-1.067159, -1.159884, -3.089391, 1, 1, 1, 1, 1,
-1.065198, 0.7915792, -1.125344, 1, 1, 1, 1, 1,
-1.062595, 0.6331208, 0.2903073, 1, 1, 1, 1, 1,
-1.052485, 1.217148, 1.271158, 1, 1, 1, 1, 1,
-1.05248, -0.1422093, -1.796883, 1, 1, 1, 1, 1,
-1.043554, -0.09277767, -2.991786, 1, 1, 1, 1, 1,
-1.023866, -0.05408062, -3.530843, 1, 1, 1, 1, 1,
-1.02123, -0.621605, -1.141375, 0, 0, 1, 1, 1,
-1.019156, 0.004732314, -1.033566, 1, 0, 0, 1, 1,
-1.018192, -2.335752, -3.450448, 1, 0, 0, 1, 1,
-1.01678, -0.08696146, -1.342759, 1, 0, 0, 1, 1,
-1.004291, -0.3132994, -0.9019393, 1, 0, 0, 1, 1,
-1.002307, -1.774877, -3.540176, 1, 0, 0, 1, 1,
-0.9945276, -0.5643103, -1.898473, 0, 0, 0, 1, 1,
-0.9890679, 1.21686, -0.4853546, 0, 0, 0, 1, 1,
-0.977809, 1.853829, -0.02808155, 0, 0, 0, 1, 1,
-0.9765074, -1.078831, -3.553793, 0, 0, 0, 1, 1,
-0.9742639, -1.098696, -2.079635, 0, 0, 0, 1, 1,
-0.9698702, 1.458044, -1.483945, 0, 0, 0, 1, 1,
-0.9676465, -2.452114, -1.82039, 0, 0, 0, 1, 1,
-0.9655451, 1.642666, 1.36979, 1, 1, 1, 1, 1,
-0.9594029, 0.3577794, -0.3060101, 1, 1, 1, 1, 1,
-0.9552063, -1.343705, -1.315836, 1, 1, 1, 1, 1,
-0.9486638, -1.878848, -0.9728951, 1, 1, 1, 1, 1,
-0.9383327, 0.252911, -2.424083, 1, 1, 1, 1, 1,
-0.9352942, -0.8411304, -2.730285, 1, 1, 1, 1, 1,
-0.9351146, 1.597572, 0.8411264, 1, 1, 1, 1, 1,
-0.9297594, -1.748831, -1.547711, 1, 1, 1, 1, 1,
-0.9261735, -1.003805, -2.031112, 1, 1, 1, 1, 1,
-0.9203826, 1.264663, -0.2576492, 1, 1, 1, 1, 1,
-0.9134908, -1.532555, -3.769725, 1, 1, 1, 1, 1,
-0.9066411, 0.9551811, -0.4799855, 1, 1, 1, 1, 1,
-0.9057979, 1.028081, -1.189377, 1, 1, 1, 1, 1,
-0.9010189, -1.200773, -2.252624, 1, 1, 1, 1, 1,
-0.9000485, 0.1797901, -0.432606, 1, 1, 1, 1, 1,
-0.8987696, -0.07164804, -3.672004, 0, 0, 1, 1, 1,
-0.8971031, 1.05399, -1.114245, 1, 0, 0, 1, 1,
-0.8968614, -0.175375, -0.103758, 1, 0, 0, 1, 1,
-0.8959695, -0.1733736, -1.936056, 1, 0, 0, 1, 1,
-0.8917696, 0.7971707, -0.7307709, 1, 0, 0, 1, 1,
-0.8872371, 0.4203894, 0.08639086, 1, 0, 0, 1, 1,
-0.8865192, 0.469029, -0.3032104, 0, 0, 0, 1, 1,
-0.8827109, -1.925871, -1.038453, 0, 0, 0, 1, 1,
-0.8800356, -0.6053587, -2.095585, 0, 0, 0, 1, 1,
-0.875801, -1.275243, -2.483489, 0, 0, 0, 1, 1,
-0.8739071, -0.5269012, -3.250349, 0, 0, 0, 1, 1,
-0.8727531, 0.1177448, -1.328394, 0, 0, 0, 1, 1,
-0.8644269, -1.393249, -3.262133, 0, 0, 0, 1, 1,
-0.8624259, 0.2010948, -1.705194, 1, 1, 1, 1, 1,
-0.8527715, -0.6783452, -3.405976, 1, 1, 1, 1, 1,
-0.8486439, 0.8125641, 0.06217409, 1, 1, 1, 1, 1,
-0.8457549, -1.132445, -2.211906, 1, 1, 1, 1, 1,
-0.841716, -0.5121234, -3.380928, 1, 1, 1, 1, 1,
-0.8390408, -1.940458, -3.355553, 1, 1, 1, 1, 1,
-0.8387229, -1.441552, -3.949767, 1, 1, 1, 1, 1,
-0.8372598, -0.2315847, -2.293447, 1, 1, 1, 1, 1,
-0.825805, 0.1753067, -1.910885, 1, 1, 1, 1, 1,
-0.8248281, 0.2812893, -1.222202, 1, 1, 1, 1, 1,
-0.8180569, 1.491985, -0.3032603, 1, 1, 1, 1, 1,
-0.815715, -2.233256, -3.235726, 1, 1, 1, 1, 1,
-0.8116706, 0.07263868, -3.07345, 1, 1, 1, 1, 1,
-0.803902, -0.9744929, -2.398617, 1, 1, 1, 1, 1,
-0.8027937, 0.4923052, -3.451511, 1, 1, 1, 1, 1,
-0.8025132, -1.192092, -4.672902, 0, 0, 1, 1, 1,
-0.7966649, -0.0875893, -0.9574011, 1, 0, 0, 1, 1,
-0.7876872, 1.535766, 0.9132531, 1, 0, 0, 1, 1,
-0.7819568, -1.316121, -2.524602, 1, 0, 0, 1, 1,
-0.7770835, -0.894829, -1.172046, 1, 0, 0, 1, 1,
-0.7769757, 1.674402, -0.9247382, 1, 0, 0, 1, 1,
-0.7763067, 1.920654, -0.3865238, 0, 0, 0, 1, 1,
-0.7762895, -0.6501321, -1.602991, 0, 0, 0, 1, 1,
-0.7751324, -0.5982099, -1.293018, 0, 0, 0, 1, 1,
-0.7685371, -0.201368, -1.321522, 0, 0, 0, 1, 1,
-0.7528139, 0.5578982, -0.9443706, 0, 0, 0, 1, 1,
-0.751851, 1.055164, -0.4285379, 0, 0, 0, 1, 1,
-0.7464085, 0.9787443, 0.4326964, 0, 0, 0, 1, 1,
-0.7446411, 0.0459044, -2.620153, 1, 1, 1, 1, 1,
-0.7427531, -1.373358, -3.046622, 1, 1, 1, 1, 1,
-0.7402917, 0.1873627, -2.595625, 1, 1, 1, 1, 1,
-0.7394304, -1.040504, -2.870762, 1, 1, 1, 1, 1,
-0.7380764, -0.04053282, -1.213074, 1, 1, 1, 1, 1,
-0.7343581, 1.04544, -0.4354431, 1, 1, 1, 1, 1,
-0.7318742, 0.556262, -0.9115098, 1, 1, 1, 1, 1,
-0.7310131, -0.1699578, -3.46826, 1, 1, 1, 1, 1,
-0.726307, 0.7302059, -0.6156862, 1, 1, 1, 1, 1,
-0.7262045, 0.9683522, 0.2568038, 1, 1, 1, 1, 1,
-0.7238976, 1.468186, -1.919424, 1, 1, 1, 1, 1,
-0.722317, 0.002561431, -1.50516, 1, 1, 1, 1, 1,
-0.7158654, 0.03369894, -1.88378, 1, 1, 1, 1, 1,
-0.7092533, -0.8101232, -2.326703, 1, 1, 1, 1, 1,
-0.7051951, 0.2648388, -1.287652, 1, 1, 1, 1, 1,
-0.7003113, -0.5392042, -1.785207, 0, 0, 1, 1, 1,
-0.6899953, 0.5816456, -0.3225316, 1, 0, 0, 1, 1,
-0.6888306, 0.01107303, -2.381159, 1, 0, 0, 1, 1,
-0.687029, -0.8670726, -1.796475, 1, 0, 0, 1, 1,
-0.6850145, -1.445269, -3.710875, 1, 0, 0, 1, 1,
-0.6849567, -1.421708, -1.063346, 1, 0, 0, 1, 1,
-0.6819002, 1.039825, -1.460747, 0, 0, 0, 1, 1,
-0.6768839, -0.7296563, -3.934577, 0, 0, 0, 1, 1,
-0.6743298, -1.947589, -2.223442, 0, 0, 0, 1, 1,
-0.669682, -0.9477431, -3.107835, 0, 0, 0, 1, 1,
-0.6650655, 0.608273, -1.579859, 0, 0, 0, 1, 1,
-0.6618949, 0.7224444, 2.3224, 0, 0, 0, 1, 1,
-0.6607751, 0.3692318, 0.4836456, 0, 0, 0, 1, 1,
-0.6596103, 1.967075, 0.9708755, 1, 1, 1, 1, 1,
-0.6574752, 0.4937464, -0.9822291, 1, 1, 1, 1, 1,
-0.654143, 0.1810675, -1.719648, 1, 1, 1, 1, 1,
-0.6523794, -0.4109077, -2.194691, 1, 1, 1, 1, 1,
-0.6511729, 1.937931, -0.0493472, 1, 1, 1, 1, 1,
-0.65022, -0.3197256, -2.395749, 1, 1, 1, 1, 1,
-0.6457166, 0.5068688, -0.8208223, 1, 1, 1, 1, 1,
-0.6445811, -0.1009299, -2.355265, 1, 1, 1, 1, 1,
-0.6351902, 2.383026, 0.7070965, 1, 1, 1, 1, 1,
-0.6340684, 0.4243457, 0.1048296, 1, 1, 1, 1, 1,
-0.6318731, 0.2686867, -1.181914, 1, 1, 1, 1, 1,
-0.6264765, -0.8008662, -3.243568, 1, 1, 1, 1, 1,
-0.6213155, 1.934365, -1.314098, 1, 1, 1, 1, 1,
-0.6211022, -0.7526559, -3.398397, 1, 1, 1, 1, 1,
-0.6200144, 0.3484416, -0.4945397, 1, 1, 1, 1, 1,
-0.6177607, -0.06161958, -2.291645, 0, 0, 1, 1, 1,
-0.6167867, 0.9796613, -0.1481708, 1, 0, 0, 1, 1,
-0.6154737, -0.3484197, -3.459664, 1, 0, 0, 1, 1,
-0.604022, 0.4070207, -2.113017, 1, 0, 0, 1, 1,
-0.5971728, 1.4546, -0.08768059, 1, 0, 0, 1, 1,
-0.5947301, 1.615629, 1.558167, 1, 0, 0, 1, 1,
-0.5943887, -1.718806, -2.273647, 0, 0, 0, 1, 1,
-0.5939763, 0.401345, -2.388687, 0, 0, 0, 1, 1,
-0.5930917, 0.4742397, -1.503931, 0, 0, 0, 1, 1,
-0.5929393, 0.6380065, 0.03755386, 0, 0, 0, 1, 1,
-0.5920704, -1.522484, -2.026908, 0, 0, 0, 1, 1,
-0.5877516, 0.5156534, -0.6928603, 0, 0, 0, 1, 1,
-0.5833608, 0.4574341, -1.951739, 0, 0, 0, 1, 1,
-0.5756954, 0.2209485, -1.188444, 1, 1, 1, 1, 1,
-0.5755429, 0.9330513, -2.690297, 1, 1, 1, 1, 1,
-0.5742004, -0.8491472, -2.239728, 1, 1, 1, 1, 1,
-0.5705385, 0.1365385, -2.530826, 1, 1, 1, 1, 1,
-0.5624127, -0.6259512, -1.989786, 1, 1, 1, 1, 1,
-0.5620402, 1.624837, -0.6478622, 1, 1, 1, 1, 1,
-0.5614906, 0.2223511, -1.507143, 1, 1, 1, 1, 1,
-0.5588654, -0.2673089, -0.8012319, 1, 1, 1, 1, 1,
-0.556864, -0.8854419, -3.071389, 1, 1, 1, 1, 1,
-0.5539443, -0.2384109, -0.7396805, 1, 1, 1, 1, 1,
-0.5526574, 0.4072624, -1.241303, 1, 1, 1, 1, 1,
-0.5507343, 0.7521511, 0.8279322, 1, 1, 1, 1, 1,
-0.5503619, -0.369814, -2.473417, 1, 1, 1, 1, 1,
-0.5498871, -0.6797841, 1.316481, 1, 1, 1, 1, 1,
-0.5474432, -0.1646058, -3.950988, 1, 1, 1, 1, 1,
-0.5447657, 0.2024222, -1.785953, 0, 0, 1, 1, 1,
-0.5424824, 0.4178959, -0.1490281, 1, 0, 0, 1, 1,
-0.5371506, 0.2931202, -1.369045, 1, 0, 0, 1, 1,
-0.5361549, -0.1074451, -0.4362905, 1, 0, 0, 1, 1,
-0.5359632, 1.183224, -2.111407, 1, 0, 0, 1, 1,
-0.5330231, 1.480359, 0.3970678, 1, 0, 0, 1, 1,
-0.5320381, -0.2186112, -0.1058702, 0, 0, 0, 1, 1,
-0.5313714, 0.7832989, -2.500877, 0, 0, 0, 1, 1,
-0.5272557, -0.03952734, -0.2822898, 0, 0, 0, 1, 1,
-0.5271374, -1.561904, -2.267899, 0, 0, 0, 1, 1,
-0.5263373, 0.3242561, -2.626389, 0, 0, 0, 1, 1,
-0.5253927, 1.364304, -1.124989, 0, 0, 0, 1, 1,
-0.5131027, -0.5738121, -3.117307, 0, 0, 0, 1, 1,
-0.5127774, 0.4729231, -2.815842, 1, 1, 1, 1, 1,
-0.5098607, 0.2899664, -1.16631, 1, 1, 1, 1, 1,
-0.5086384, 0.2752582, -2.588999, 1, 1, 1, 1, 1,
-0.4931495, 1.0783, -0.72182, 1, 1, 1, 1, 1,
-0.4931141, -0.8362059, -3.964671, 1, 1, 1, 1, 1,
-0.4924135, 0.6165706, -0.3814447, 1, 1, 1, 1, 1,
-0.4858286, 0.7940957, -0.846119, 1, 1, 1, 1, 1,
-0.4839845, 0.939679, -2.775806, 1, 1, 1, 1, 1,
-0.4828512, 0.115209, -1.275704, 1, 1, 1, 1, 1,
-0.4754402, -0.9132071, -2.583644, 1, 1, 1, 1, 1,
-0.4705422, -0.6381242, -2.036259, 1, 1, 1, 1, 1,
-0.4695834, 1.896082, -0.4576075, 1, 1, 1, 1, 1,
-0.4681672, 0.0851813, -1.424195, 1, 1, 1, 1, 1,
-0.467485, 0.1328956, -1.37421, 1, 1, 1, 1, 1,
-0.4656947, 0.4873594, -0.6503552, 1, 1, 1, 1, 1,
-0.4654506, 1.875858, -1.115824, 0, 0, 1, 1, 1,
-0.4646614, 0.4194992, -0.2731991, 1, 0, 0, 1, 1,
-0.4632726, -0.02446595, -1.168091, 1, 0, 0, 1, 1,
-0.4498847, -0.09088603, -0.7107806, 1, 0, 0, 1, 1,
-0.449092, 0.1401123, -1.816998, 1, 0, 0, 1, 1,
-0.4469233, -1.229502, -4.925321, 1, 0, 0, 1, 1,
-0.4463177, -0.2990813, -2.312306, 0, 0, 0, 1, 1,
-0.4453924, 0.8655122, -0.7812178, 0, 0, 0, 1, 1,
-0.4451611, 1.369219, -0.4749025, 0, 0, 0, 1, 1,
-0.4451394, -0.6569646, -3.422288, 0, 0, 0, 1, 1,
-0.4372747, 0.1577607, -1.829078, 0, 0, 0, 1, 1,
-0.4339469, 0.3572448, -1.869166, 0, 0, 0, 1, 1,
-0.4307609, 0.1768823, -2.689281, 0, 0, 0, 1, 1,
-0.4260138, -0.3995971, -3.143608, 1, 1, 1, 1, 1,
-0.4233706, -1.569511, -2.525274, 1, 1, 1, 1, 1,
-0.4203585, -0.9828872, -1.85102, 1, 1, 1, 1, 1,
-0.4153752, 0.7376392, -0.3474757, 1, 1, 1, 1, 1,
-0.4144777, -1.105686, -2.763756, 1, 1, 1, 1, 1,
-0.4081306, 0.646346, -0.2786232, 1, 1, 1, 1, 1,
-0.406428, 2.217246, 0.8474752, 1, 1, 1, 1, 1,
-0.4030931, -0.3777104, -0.7196711, 1, 1, 1, 1, 1,
-0.4000203, -2.134638, -1.996999, 1, 1, 1, 1, 1,
-0.397465, 1.005775, 1.796171, 1, 1, 1, 1, 1,
-0.3943544, -0.7859786, -1.647452, 1, 1, 1, 1, 1,
-0.3928561, -0.7737191, -1.225053, 1, 1, 1, 1, 1,
-0.3882626, -0.2432091, -3.142955, 1, 1, 1, 1, 1,
-0.3846613, 0.1684777, 0.1726954, 1, 1, 1, 1, 1,
-0.3845322, 0.3031014, -2.006865, 1, 1, 1, 1, 1,
-0.3827338, -0.01263373, -2.542295, 0, 0, 1, 1, 1,
-0.3804241, -0.9343852, -3.298894, 1, 0, 0, 1, 1,
-0.3803131, -0.892108, -4.110543, 1, 0, 0, 1, 1,
-0.3786688, -1.024358, -3.468364, 1, 0, 0, 1, 1,
-0.3756506, 2.496496, -0.402568, 1, 0, 0, 1, 1,
-0.3749807, 0.2989541, -0.9821621, 1, 0, 0, 1, 1,
-0.3748648, -0.318699, -3.142217, 0, 0, 0, 1, 1,
-0.3717497, 0.3528069, 0.4853027, 0, 0, 0, 1, 1,
-0.3600149, 2.541379, -0.4101195, 0, 0, 0, 1, 1,
-0.3571315, -0.1524145, -0.4006917, 0, 0, 0, 1, 1,
-0.3536145, -1.485942, -2.728342, 0, 0, 0, 1, 1,
-0.3518748, -1.043569, -2.291955, 0, 0, 0, 1, 1,
-0.3509908, 0.3078581, -0.8095727, 0, 0, 0, 1, 1,
-0.3500949, -0.05894126, -1.666735, 1, 1, 1, 1, 1,
-0.3469751, -0.2414884, -1.607054, 1, 1, 1, 1, 1,
-0.3462234, -0.4189837, 0.2337327, 1, 1, 1, 1, 1,
-0.3461354, 0.1000072, 0.5547581, 1, 1, 1, 1, 1,
-0.3440155, 0.4073691, -2.234349, 1, 1, 1, 1, 1,
-0.3415231, -0.6229119, -3.804558, 1, 1, 1, 1, 1,
-0.3390622, -0.0553486, -1.646127, 1, 1, 1, 1, 1,
-0.3323223, -0.3015885, -2.545193, 1, 1, 1, 1, 1,
-0.3307682, 0.8023681, 1.215006, 1, 1, 1, 1, 1,
-0.3305151, -1.149966, -3.022331, 1, 1, 1, 1, 1,
-0.3278831, -1.298523, -3.064517, 1, 1, 1, 1, 1,
-0.3266114, -0.1991306, -1.727318, 1, 1, 1, 1, 1,
-0.3201183, -0.7892077, -1.966279, 1, 1, 1, 1, 1,
-0.3127848, 0.6781443, -0.7035149, 1, 1, 1, 1, 1,
-0.3123822, 2.262975, -1.034841, 1, 1, 1, 1, 1,
-0.3123101, -1.066889, -3.410921, 0, 0, 1, 1, 1,
-0.3115996, -1.591926, -2.554903, 1, 0, 0, 1, 1,
-0.3098187, 1.006176, -0.6032558, 1, 0, 0, 1, 1,
-0.3081729, 1.129752, 2.536605, 1, 0, 0, 1, 1,
-0.3080582, -1.043162, -0.6083958, 1, 0, 0, 1, 1,
-0.3036036, 0.8916879, -0.4001554, 1, 0, 0, 1, 1,
-0.3024818, -0.8278911, -3.624104, 0, 0, 0, 1, 1,
-0.3023969, 1.925333, -0.3488973, 0, 0, 0, 1, 1,
-0.3021697, 0.3127424, -1.405045, 0, 0, 0, 1, 1,
-0.2949682, 1.03125, 0.1089024, 0, 0, 0, 1, 1,
-0.2913998, -1.356559, -3.394185, 0, 0, 0, 1, 1,
-0.2840958, -0.06543116, -1.530951, 0, 0, 0, 1, 1,
-0.2836048, -0.7232342, -3.533531, 0, 0, 0, 1, 1,
-0.2803978, 0.356185, -0.6747233, 1, 1, 1, 1, 1,
-0.2781246, 1.041837, -1.413896, 1, 1, 1, 1, 1,
-0.2751788, 1.065427, 0.212994, 1, 1, 1, 1, 1,
-0.2751779, 0.2694096, -0.2493665, 1, 1, 1, 1, 1,
-0.2716243, 0.7429141, 0.8660758, 1, 1, 1, 1, 1,
-0.2700245, 0.7581618, -1.344858, 1, 1, 1, 1, 1,
-0.2683285, -0.4904664, -3.952175, 1, 1, 1, 1, 1,
-0.2565377, -0.5900543, -4.098968, 1, 1, 1, 1, 1,
-0.2555082, 0.2552172, -0.5732099, 1, 1, 1, 1, 1,
-0.2552935, 0.9901369, -0.5162578, 1, 1, 1, 1, 1,
-0.2536235, 0.781148, -0.4110786, 1, 1, 1, 1, 1,
-0.2523883, -0.7334611, -2.169242, 1, 1, 1, 1, 1,
-0.2515574, -1.84467, -3.824623, 1, 1, 1, 1, 1,
-0.2492816, 1.526658, -0.3408999, 1, 1, 1, 1, 1,
-0.2445373, -0.7717497, -2.761128, 1, 1, 1, 1, 1,
-0.2415687, -1.895214, -2.658031, 0, 0, 1, 1, 1,
-0.2403276, -0.005055454, -1.677588, 1, 0, 0, 1, 1,
-0.2403183, 1.344223, 0.3397517, 1, 0, 0, 1, 1,
-0.236137, -1.106357, -1.925471, 1, 0, 0, 1, 1,
-0.2344183, -1.019257, -1.866981, 1, 0, 0, 1, 1,
-0.2326861, 0.9260553, 1.15705, 1, 0, 0, 1, 1,
-0.227746, -0.01646905, -1.504505, 0, 0, 0, 1, 1,
-0.2261217, 0.2860426, 0.1441935, 0, 0, 0, 1, 1,
-0.2245203, -0.009322802, -0.7976575, 0, 0, 0, 1, 1,
-0.2228824, -0.03242519, -2.563012, 0, 0, 0, 1, 1,
-0.2225482, -0.9519902, -3.625717, 0, 0, 0, 1, 1,
-0.220425, 2.046748, -0.4569437, 0, 0, 0, 1, 1,
-0.2201871, 0.6540583, 0.5876273, 0, 0, 0, 1, 1,
-0.2194666, 0.4786746, 1.343497, 1, 1, 1, 1, 1,
-0.21869, -0.2889463, -1.9481, 1, 1, 1, 1, 1,
-0.2182247, 1.566281, 0.08406075, 1, 1, 1, 1, 1,
-0.2178032, 0.2402878, -0.09469242, 1, 1, 1, 1, 1,
-0.2154578, -0.1519304, -2.017382, 1, 1, 1, 1, 1,
-0.2147399, 1.514743, -0.7351196, 1, 1, 1, 1, 1,
-0.2123, 0.4097316, 0.2346853, 1, 1, 1, 1, 1,
-0.2080217, -1.236049, -2.003423, 1, 1, 1, 1, 1,
-0.2016793, 0.0729689, -0.9122649, 1, 1, 1, 1, 1,
-0.1963328, 0.006077375, -2.128379, 1, 1, 1, 1, 1,
-0.1949452, 0.9688314, -1.481701, 1, 1, 1, 1, 1,
-0.1866985, 0.08906549, -1.856134, 1, 1, 1, 1, 1,
-0.1858811, -0.9503451, -2.23088, 1, 1, 1, 1, 1,
-0.1856401, 0.9670261, 1.008856, 1, 1, 1, 1, 1,
-0.1829209, 1.345421, -0.1781599, 1, 1, 1, 1, 1,
-0.1812219, -0.706448, -2.454606, 0, 0, 1, 1, 1,
-0.1783128, 1.254658, -0.2410851, 1, 0, 0, 1, 1,
-0.1739058, -0.8606792, -2.372586, 1, 0, 0, 1, 1,
-0.1687693, -3.595566, -2.641364, 1, 0, 0, 1, 1,
-0.1652083, -0.5374377, -4.154274, 1, 0, 0, 1, 1,
-0.1646752, -0.6017326, -3.483406, 1, 0, 0, 1, 1,
-0.1622067, -0.1268128, -2.144864, 0, 0, 0, 1, 1,
-0.1598665, 0.2358911, 0.9308875, 0, 0, 0, 1, 1,
-0.1451192, -1.736898, -3.305236, 0, 0, 0, 1, 1,
-0.1429788, 0.1961562, 0.3268565, 0, 0, 0, 1, 1,
-0.1429377, 1.620124, -1.56692, 0, 0, 0, 1, 1,
-0.1421324, -0.9433711, -1.78518, 0, 0, 0, 1, 1,
-0.1386759, -0.7120948, -1.617105, 0, 0, 0, 1, 1,
-0.1361761, 1.229202, 0.3379416, 1, 1, 1, 1, 1,
-0.1347207, 0.4507171, 0.06832191, 1, 1, 1, 1, 1,
-0.133679, 0.4649999, -0.004221329, 1, 1, 1, 1, 1,
-0.1306896, -0.8719574, -2.975387, 1, 1, 1, 1, 1,
-0.1272402, -0.162165, -4.607587, 1, 1, 1, 1, 1,
-0.1253261, 0.2790921, -0.5449899, 1, 1, 1, 1, 1,
-0.1252279, 0.4338396, 1.138656, 1, 1, 1, 1, 1,
-0.1231083, 1.442705, -1.781125, 1, 1, 1, 1, 1,
-0.1207528, 1.430508, 0.6049891, 1, 1, 1, 1, 1,
-0.1207161, 0.00387048, -1.566414, 1, 1, 1, 1, 1,
-0.1205295, 0.3963564, -0.8958996, 1, 1, 1, 1, 1,
-0.1170235, -0.01677458, -1.914796, 1, 1, 1, 1, 1,
-0.109135, 2.11421, -1.030306, 1, 1, 1, 1, 1,
-0.1059119, 0.6855103, -0.2952953, 1, 1, 1, 1, 1,
-0.1052093, 0.6797457, -0.2343277, 1, 1, 1, 1, 1,
-0.1007742, -0.9926559, -2.203649, 0, 0, 1, 1, 1,
-0.1007512, -2.487643, -2.727618, 1, 0, 0, 1, 1,
-0.1006247, -1.934307, -2.46476, 1, 0, 0, 1, 1,
-0.100255, 0.08752422, -2.816381, 1, 0, 0, 1, 1,
-0.09754618, 0.7975249, 1.415515, 1, 0, 0, 1, 1,
-0.09629601, 0.6579121, 0.1216891, 1, 0, 0, 1, 1,
-0.09610642, 0.381852, -0.6350005, 0, 0, 0, 1, 1,
-0.09608823, 1.8591, -0.470441, 0, 0, 0, 1, 1,
-0.08665414, 1.127883, 0.1783183, 0, 0, 0, 1, 1,
-0.08316743, -0.4452067, -2.953968, 0, 0, 0, 1, 1,
-0.08143447, -0.6910045, -1.772934, 0, 0, 0, 1, 1,
-0.08044614, 0.4348784, -0.3502255, 0, 0, 0, 1, 1,
-0.06838784, 0.3082848, 0.6417682, 0, 0, 0, 1, 1,
-0.06377941, 0.3209507, 0.09440329, 1, 1, 1, 1, 1,
-0.05747881, 0.0437627, -1.043027, 1, 1, 1, 1, 1,
-0.0561243, -0.8791918, -3.012676, 1, 1, 1, 1, 1,
-0.05508125, -0.4965529, -2.210487, 1, 1, 1, 1, 1,
-0.05467785, 0.944117, -0.6619744, 1, 1, 1, 1, 1,
-0.05222597, 1.106794, 0.6790931, 1, 1, 1, 1, 1,
-0.05178086, -0.1996295, -3.644009, 1, 1, 1, 1, 1,
-0.05125891, -1.757077, -4.317547, 1, 1, 1, 1, 1,
-0.05040591, 0.4359845, -0.1992261, 1, 1, 1, 1, 1,
-0.05004503, -0.1195262, -3.739594, 1, 1, 1, 1, 1,
-0.04855915, -0.5750594, -2.166832, 1, 1, 1, 1, 1,
-0.04584876, 0.8274748, 0.1028371, 1, 1, 1, 1, 1,
-0.04352148, 1.123891, -1.796613, 1, 1, 1, 1, 1,
-0.0432792, -0.4215139, -3.923135, 1, 1, 1, 1, 1,
-0.04283774, -0.7427351, -2.59205, 1, 1, 1, 1, 1,
-0.04156236, -0.4406052, -3.0321, 0, 0, 1, 1, 1,
-0.03732368, 2.640472, 0.1996785, 1, 0, 0, 1, 1,
-0.03700468, 0.1084368, -0.4228293, 1, 0, 0, 1, 1,
-0.0365562, -1.531016, -2.402996, 1, 0, 0, 1, 1,
-0.035346, 0.2748359, -0.3830687, 1, 0, 0, 1, 1,
-0.03478323, 1.359096, -0.4196654, 1, 0, 0, 1, 1,
-0.02714756, 1.931208, 1.473525, 0, 0, 0, 1, 1,
-0.02593508, 1.985418, 0.01345971, 0, 0, 0, 1, 1,
-0.02558667, -0.3702754, -2.938998, 0, 0, 0, 1, 1,
-0.01793573, -1.687916, -2.093081, 0, 0, 0, 1, 1,
-0.0169601, 0.009276215, -1.980157, 0, 0, 0, 1, 1,
-0.01398522, 1.293938, -1.213856, 0, 0, 0, 1, 1,
-0.01219171, 1.584638, 1.118623, 0, 0, 0, 1, 1,
-0.01210259, 0.08332734, -0.5054548, 1, 1, 1, 1, 1,
-0.009541822, 1.712554, 1.717105, 1, 1, 1, 1, 1,
-0.007359837, -0.3407494, -2.790889, 1, 1, 1, 1, 1,
-0.006138054, -0.4837852, -2.675637, 1, 1, 1, 1, 1,
-0.005925908, -0.8603848, -4.462053, 1, 1, 1, 1, 1,
-0.001980576, 0.008682203, 0.1193473, 1, 1, 1, 1, 1,
-0.001491776, -0.4347209, -2.520144, 1, 1, 1, 1, 1,
0.003385579, 0.01319566, -1.605832, 1, 1, 1, 1, 1,
0.007296694, 0.9491339, 0.9574959, 1, 1, 1, 1, 1,
0.007762869, 0.494495, 1.18243, 1, 1, 1, 1, 1,
0.009752871, -0.9707627, 3.866484, 1, 1, 1, 1, 1,
0.01124739, 0.1622056, 0.4410834, 1, 1, 1, 1, 1,
0.01193445, 1.258876, 0.8472728, 1, 1, 1, 1, 1,
0.01203691, 1.615029, -1.120666, 1, 1, 1, 1, 1,
0.01246346, 0.3196234, -0.7173647, 1, 1, 1, 1, 1,
0.01280496, 0.8615767, -0.7192628, 0, 0, 1, 1, 1,
0.01495149, -0.3673069, 4.427032, 1, 0, 0, 1, 1,
0.01554548, -0.6178548, 1.44944, 1, 0, 0, 1, 1,
0.02231671, 1.015365, -0.01753376, 1, 0, 0, 1, 1,
0.02452793, -1.1079, 2.319491, 1, 0, 0, 1, 1,
0.02575191, -2.04515, 3.97378, 1, 0, 0, 1, 1,
0.02807126, 0.04006862, -0.7365352, 0, 0, 0, 1, 1,
0.03647704, -0.2208175, 3.387603, 0, 0, 0, 1, 1,
0.03682933, 1.21364, 1.018864, 0, 0, 0, 1, 1,
0.03811524, -0.629634, 4.105091, 0, 0, 0, 1, 1,
0.04069451, -0.7544561, 2.277799, 0, 0, 0, 1, 1,
0.04246926, -0.8743976, 1.879579, 0, 0, 0, 1, 1,
0.04422172, 1.951825, -1.693703, 0, 0, 0, 1, 1,
0.04422774, 1.235044, -0.2224343, 1, 1, 1, 1, 1,
0.04772077, 1.12291, -0.4816623, 1, 1, 1, 1, 1,
0.04923157, -1.249831, 3.518959, 1, 1, 1, 1, 1,
0.05123203, -0.07116922, 3.895109, 1, 1, 1, 1, 1,
0.05382885, -0.7128474, 3.130518, 1, 1, 1, 1, 1,
0.05719278, -0.5003293, 1.807581, 1, 1, 1, 1, 1,
0.05935251, -0.7744845, 3.938305, 1, 1, 1, 1, 1,
0.0610356, -0.2381268, 1.706147, 1, 1, 1, 1, 1,
0.06145769, 0.1223966, 0.6868578, 1, 1, 1, 1, 1,
0.06670026, -0.4344988, 4.152977, 1, 1, 1, 1, 1,
0.06730344, -0.215073, 1.676172, 1, 1, 1, 1, 1,
0.06912442, 2.557286, 1.141532, 1, 1, 1, 1, 1,
0.0694896, -0.5248793, 2.545787, 1, 1, 1, 1, 1,
0.07095668, -1.133101, 2.50421, 1, 1, 1, 1, 1,
0.07370061, -1.279403, 1.098032, 1, 1, 1, 1, 1,
0.07536223, 0.1732394, -0.2534516, 0, 0, 1, 1, 1,
0.07680215, -1.126488, 3.425482, 1, 0, 0, 1, 1,
0.08430029, -0.2146223, 3.252981, 1, 0, 0, 1, 1,
0.08589365, -0.22113, 2.69066, 1, 0, 0, 1, 1,
0.08715555, -0.1950393, 2.234374, 1, 0, 0, 1, 1,
0.09115227, 0.1461511, 1.179354, 1, 0, 0, 1, 1,
0.0936048, 0.3231127, 0.6521937, 0, 0, 0, 1, 1,
0.09767944, -0.3589455, 3.990211, 0, 0, 0, 1, 1,
0.1001637, -1.340814, 2.58375, 0, 0, 0, 1, 1,
0.1007742, -0.9384185, 2.878315, 0, 0, 0, 1, 1,
0.1044774, -0.6645322, 3.495585, 0, 0, 0, 1, 1,
0.1105407, 0.4784245, -0.4697692, 0, 0, 0, 1, 1,
0.1125512, 1.296005, 0.6683522, 0, 0, 0, 1, 1,
0.1155692, 1.627674, 0.5411307, 1, 1, 1, 1, 1,
0.1180017, -0.5249295, 3.70967, 1, 1, 1, 1, 1,
0.1249666, -1.159971, 2.175071, 1, 1, 1, 1, 1,
0.1262882, -0.6194831, 0.7942088, 1, 1, 1, 1, 1,
0.127422, -0.7841833, 2.950501, 1, 1, 1, 1, 1,
0.1275895, 0.792418, 0.8086179, 1, 1, 1, 1, 1,
0.1373976, 0.3928209, 1.727402, 1, 1, 1, 1, 1,
0.1375137, -2.446498, 2.209216, 1, 1, 1, 1, 1,
0.1402319, 0.3378827, 0.7056622, 1, 1, 1, 1, 1,
0.1424732, 1.077204, -0.2083128, 1, 1, 1, 1, 1,
0.1425054, -0.356586, 1.805285, 1, 1, 1, 1, 1,
0.1431673, -1.171494, 3.076873, 1, 1, 1, 1, 1,
0.1447962, -1.494059, 2.149514, 1, 1, 1, 1, 1,
0.1491021, 1.278609, 0.8943576, 1, 1, 1, 1, 1,
0.1513239, 1.30236, -0.278668, 1, 1, 1, 1, 1,
0.1522077, 1.519152, 1.837347, 0, 0, 1, 1, 1,
0.1537355, -0.5477163, 4.811713, 1, 0, 0, 1, 1,
0.1549271, 0.9166131, -0.9829949, 1, 0, 0, 1, 1,
0.157166, 0.8526976, 1.73022, 1, 0, 0, 1, 1,
0.1586947, -0.370437, 1.968885, 1, 0, 0, 1, 1,
0.1589561, -0.5493217, 2.415997, 1, 0, 0, 1, 1,
0.1594763, 0.05973889, 0.8351517, 0, 0, 0, 1, 1,
0.1602222, -0.7427588, 2.066477, 0, 0, 0, 1, 1,
0.1628145, 0.2639452, -1.34885, 0, 0, 0, 1, 1,
0.1643559, 1.403413, 0.5476997, 0, 0, 0, 1, 1,
0.1650763, 0.8057564, 1.920474, 0, 0, 0, 1, 1,
0.1658411, 0.6072353, -0.1412732, 0, 0, 0, 1, 1,
0.1694926, 0.2061296, 0.6911035, 0, 0, 0, 1, 1,
0.1722067, -1.540654, 4.111598, 1, 1, 1, 1, 1,
0.1732923, 0.552431, 0.4584693, 1, 1, 1, 1, 1,
0.1748607, 0.5325155, 0.4724503, 1, 1, 1, 1, 1,
0.1779549, 1.070518, 0.1308931, 1, 1, 1, 1, 1,
0.1807026, -0.3571789, 2.306548, 1, 1, 1, 1, 1,
0.1809043, -1.134152, 3.179324, 1, 1, 1, 1, 1,
0.1840096, -0.5462905, 2.704413, 1, 1, 1, 1, 1,
0.1896774, -0.6463154, 2.98421, 1, 1, 1, 1, 1,
0.1913305, -0.07979357, 0.2603186, 1, 1, 1, 1, 1,
0.1961983, 1.242064, -1.042691, 1, 1, 1, 1, 1,
0.1976868, 1.377937, 1.126894, 1, 1, 1, 1, 1,
0.1994991, -1.553913, 2.673439, 1, 1, 1, 1, 1,
0.2000042, -0.03396144, 1.6679, 1, 1, 1, 1, 1,
0.2029903, 1.058954, -0.06866527, 1, 1, 1, 1, 1,
0.2099878, -1.139281, 3.225347, 1, 1, 1, 1, 1,
0.2103831, 1.52008, 0.4265289, 0, 0, 1, 1, 1,
0.2156476, 0.9075557, 0.2999375, 1, 0, 0, 1, 1,
0.2167838, -0.8976573, 2.143197, 1, 0, 0, 1, 1,
0.2356715, 1.373488, 0.7304579, 1, 0, 0, 1, 1,
0.2380675, -1.292476, 1.579842, 1, 0, 0, 1, 1,
0.2402997, 0.04342881, 1.42915, 1, 0, 0, 1, 1,
0.2420035, 2.109538, 0.6464115, 0, 0, 0, 1, 1,
0.2423079, 0.6404098, -0.1087796, 0, 0, 0, 1, 1,
0.2426579, -0.477745, 1.832126, 0, 0, 0, 1, 1,
0.2449734, 1.497728, 0.6030709, 0, 0, 0, 1, 1,
0.2466479, -0.9116245, 2.779064, 0, 0, 0, 1, 1,
0.2488323, -1.530028, 2.554883, 0, 0, 0, 1, 1,
0.2506049, 0.627298, 0.5342348, 0, 0, 0, 1, 1,
0.2518954, -0.6229768, 3.382798, 1, 1, 1, 1, 1,
0.2578371, -0.375913, 2.870449, 1, 1, 1, 1, 1,
0.2624115, -0.1360819, 1.270947, 1, 1, 1, 1, 1,
0.262444, -0.2701072, 3.484265, 1, 1, 1, 1, 1,
0.2639072, 0.5744189, 1.034625, 1, 1, 1, 1, 1,
0.2658222, -0.4642455, 1.514244, 1, 1, 1, 1, 1,
0.268007, 1.008867, -0.6331694, 1, 1, 1, 1, 1,
0.2726755, 0.7253579, -0.566126, 1, 1, 1, 1, 1,
0.2736114, -0.1391292, 1.872414, 1, 1, 1, 1, 1,
0.2754261, 1.315678, 2.685033, 1, 1, 1, 1, 1,
0.2757228, -2.868399, 3.450906, 1, 1, 1, 1, 1,
0.2769288, 0.6495617, 0.3046138, 1, 1, 1, 1, 1,
0.2774124, -0.6237612, 3.736236, 1, 1, 1, 1, 1,
0.2775489, 0.9747221, 0.7489198, 1, 1, 1, 1, 1,
0.2776919, -0.637702, 3.789675, 1, 1, 1, 1, 1,
0.2799088, -0.5420471, 2.080618, 0, 0, 1, 1, 1,
0.2814944, 0.1463577, 0.4529021, 1, 0, 0, 1, 1,
0.2896512, 0.131406, 0.22159, 1, 0, 0, 1, 1,
0.29145, 1.468165, 0.5507962, 1, 0, 0, 1, 1,
0.2919637, 0.6034376, -1.737823, 1, 0, 0, 1, 1,
0.294906, 0.3063201, 1.221778, 1, 0, 0, 1, 1,
0.2983207, -0.6556164, 1.161926, 0, 0, 0, 1, 1,
0.2992453, 0.4715361, 0.8564934, 0, 0, 0, 1, 1,
0.2997016, 0.495446, 0.1485108, 0, 0, 0, 1, 1,
0.3054253, 0.5185887, 2.442929, 0, 0, 0, 1, 1,
0.3126816, -1.52328, 1.624524, 0, 0, 0, 1, 1,
0.3157475, -0.1695728, 0.9690719, 0, 0, 0, 1, 1,
0.3208584, -0.1090449, 0.7331841, 0, 0, 0, 1, 1,
0.3212596, -0.5242716, 2.913974, 1, 1, 1, 1, 1,
0.3215528, -0.01413738, 2.991209, 1, 1, 1, 1, 1,
0.3216138, 2.614129, -1.48112, 1, 1, 1, 1, 1,
0.323338, 0.4917206, 0.4727362, 1, 1, 1, 1, 1,
0.3262669, -0.2759657, 1.957659, 1, 1, 1, 1, 1,
0.3268574, -0.1302468, 0.8834475, 1, 1, 1, 1, 1,
0.3286552, 3.40294, -0.00321537, 1, 1, 1, 1, 1,
0.3322428, -1.820398, 4.119478, 1, 1, 1, 1, 1,
0.332691, -0.2129615, 1.800504, 1, 1, 1, 1, 1,
0.3344213, -0.2732348, 2.362793, 1, 1, 1, 1, 1,
0.3382551, 1.807464, 0.6379532, 1, 1, 1, 1, 1,
0.3480093, -0.2627179, 3.766678, 1, 1, 1, 1, 1,
0.3489816, -0.0404207, 3.976289, 1, 1, 1, 1, 1,
0.3491532, 0.4211085, 1.678074, 1, 1, 1, 1, 1,
0.3548168, 0.6328654, 0.6073398, 1, 1, 1, 1, 1,
0.3588706, -1.108866, 1.667028, 0, 0, 1, 1, 1,
0.361809, -1.238114, 2.635839, 1, 0, 0, 1, 1,
0.3620984, -1.071535, 1.934994, 1, 0, 0, 1, 1,
0.3702562, 0.1573638, 0.883908, 1, 0, 0, 1, 1,
0.3710737, -0.05482183, 2.627594, 1, 0, 0, 1, 1,
0.3722441, 0.8797895, 0.02109646, 1, 0, 0, 1, 1,
0.3740259, -0.08791517, 1.638478, 0, 0, 0, 1, 1,
0.3751121, -1.587447, 3.153265, 0, 0, 0, 1, 1,
0.3754413, 0.2290696, 0.3853225, 0, 0, 0, 1, 1,
0.3758219, 0.04823687, 0.820514, 0, 0, 0, 1, 1,
0.3773537, 0.8341694, 0.02847302, 0, 0, 0, 1, 1,
0.3800526, 0.642589, 0.6216586, 0, 0, 0, 1, 1,
0.3809063, -0.3524016, 2.956624, 0, 0, 0, 1, 1,
0.3870514, -1.053671, 2.563473, 1, 1, 1, 1, 1,
0.3903825, -0.05218958, 3.548099, 1, 1, 1, 1, 1,
0.3903997, -0.4439172, 2.938008, 1, 1, 1, 1, 1,
0.3907806, -0.4764591, -0.02698005, 1, 1, 1, 1, 1,
0.3911152, 1.642332, -1.043911, 1, 1, 1, 1, 1,
0.3934683, -0.5779843, 2.24194, 1, 1, 1, 1, 1,
0.4025621, -0.8468272, 1.130816, 1, 1, 1, 1, 1,
0.4081758, 0.06975152, 2.478478, 1, 1, 1, 1, 1,
0.4119625, 0.6502841, 1.226331, 1, 1, 1, 1, 1,
0.4160213, -0.8808685, 1.474163, 1, 1, 1, 1, 1,
0.4166276, 0.1171004, 0.8281243, 1, 1, 1, 1, 1,
0.4176589, 0.6055782, 1.167921, 1, 1, 1, 1, 1,
0.4189593, 0.7911104, -0.7476362, 1, 1, 1, 1, 1,
0.4273281, -0.8717278, 2.785032, 1, 1, 1, 1, 1,
0.4286339, -1.281035, 2.871209, 1, 1, 1, 1, 1,
0.4312098, -0.002105081, 2.701844, 0, 0, 1, 1, 1,
0.4343557, 1.589726, 0.7288442, 1, 0, 0, 1, 1,
0.4358052, 0.1782918, 2.448245, 1, 0, 0, 1, 1,
0.4496943, 0.2512554, 0.3617478, 1, 0, 0, 1, 1,
0.4523512, 1.205737, -0.3101992, 1, 0, 0, 1, 1,
0.4589009, -0.1362926, 2.583173, 1, 0, 0, 1, 1,
0.4590063, -0.2786262, 0.2655701, 0, 0, 0, 1, 1,
0.4611002, -0.09852128, 2.636481, 0, 0, 0, 1, 1,
0.4620817, 0.2124971, 0.7642605, 0, 0, 0, 1, 1,
0.4632752, 0.3525299, 1.155745, 0, 0, 0, 1, 1,
0.4646955, 0.8398612, 1.99028, 0, 0, 0, 1, 1,
0.4683651, -1.613321, 3.295606, 0, 0, 0, 1, 1,
0.4685796, 0.4351038, 0.1862967, 0, 0, 0, 1, 1,
0.4712296, 0.3306429, -2.328543, 1, 1, 1, 1, 1,
0.4727632, 0.9662994, 0.1434838, 1, 1, 1, 1, 1,
0.4773166, 1.129669, 0.3487341, 1, 1, 1, 1, 1,
0.4777064, -0.2595518, 1.87812, 1, 1, 1, 1, 1,
0.48425, -0.7076613, 1.333343, 1, 1, 1, 1, 1,
0.4845924, -0.7554008, 1.44693, 1, 1, 1, 1, 1,
0.4847255, 0.7158958, -1.124324, 1, 1, 1, 1, 1,
0.4856142, 0.3608786, 0.8042406, 1, 1, 1, 1, 1,
0.4873962, -1.437413, 2.668948, 1, 1, 1, 1, 1,
0.4878368, 0.1804735, 1.672783, 1, 1, 1, 1, 1,
0.4884583, 0.5934709, -0.1051732, 1, 1, 1, 1, 1,
0.4914565, -0.2365207, 1.23861, 1, 1, 1, 1, 1,
0.4937861, 0.1106827, -0.2041997, 1, 1, 1, 1, 1,
0.499978, 0.8940098, -0.1571574, 1, 1, 1, 1, 1,
0.5017182, -0.05154263, 1.857823, 1, 1, 1, 1, 1,
0.504082, 0.2477151, 1.314504, 0, 0, 1, 1, 1,
0.5096416, -0.1412126, 1.821191, 1, 0, 0, 1, 1,
0.5126812, 0.05077203, 2.246112, 1, 0, 0, 1, 1,
0.5153869, -0.3323035, 3.049161, 1, 0, 0, 1, 1,
0.5164764, 0.2509262, 1.382294, 1, 0, 0, 1, 1,
0.5185414, -2.47033, 2.890751, 1, 0, 0, 1, 1,
0.5220547, 2.052385, -1.140002, 0, 0, 0, 1, 1,
0.5234463, 0.3968398, 0.3271506, 0, 0, 0, 1, 1,
0.5243849, -0.5912994, 1.939407, 0, 0, 0, 1, 1,
0.5285779, -1.450579, 3.302438, 0, 0, 0, 1, 1,
0.529727, 1.099955, 1.64415, 0, 0, 0, 1, 1,
0.5317167, 0.205508, 0.6384526, 0, 0, 0, 1, 1,
0.5414839, -1.035596, 3.33298, 0, 0, 0, 1, 1,
0.5453663, -0.2834568, 2.565069, 1, 1, 1, 1, 1,
0.5492011, 0.8398572, 1.49894, 1, 1, 1, 1, 1,
0.5539725, -0.4679643, 0.03152372, 1, 1, 1, 1, 1,
0.5567694, 0.3715026, 0.3292099, 1, 1, 1, 1, 1,
0.5649881, 0.3322255, -0.2271007, 1, 1, 1, 1, 1,
0.5663959, -2.312047, 3.872468, 1, 1, 1, 1, 1,
0.5704725, 0.01658572, 1.582487, 1, 1, 1, 1, 1,
0.5721129, -1.320976, 3.833479, 1, 1, 1, 1, 1,
0.5794207, 0.3914911, 1.678273, 1, 1, 1, 1, 1,
0.5808514, 0.1097831, 0.5980816, 1, 1, 1, 1, 1,
0.5948577, -2.042048, 2.520013, 1, 1, 1, 1, 1,
0.5984915, 0.7349994, 0.3766329, 1, 1, 1, 1, 1,
0.5987497, -0.8380002, 2.157231, 1, 1, 1, 1, 1,
0.6034727, -1.308449, 2.666248, 1, 1, 1, 1, 1,
0.6111213, -1.360424, 2.329219, 1, 1, 1, 1, 1,
0.6120132, 0.3776495, 1.792709, 0, 0, 1, 1, 1,
0.6133813, -0.4937327, 1.33407, 1, 0, 0, 1, 1,
0.6199877, 0.7723644, -1.514911, 1, 0, 0, 1, 1,
0.6250596, -0.9811289, 0.2297094, 1, 0, 0, 1, 1,
0.6264469, -2.061397, 3.88427, 1, 0, 0, 1, 1,
0.6272408, 1.402108, 0.1640368, 1, 0, 0, 1, 1,
0.6288286, -0.7097769, 2.872496, 0, 0, 0, 1, 1,
0.6292698, 0.7594193, 1.234008, 0, 0, 0, 1, 1,
0.6295319, 0.1073797, 1.996507, 0, 0, 0, 1, 1,
0.6306131, -0.3849334, 1.527266, 0, 0, 0, 1, 1,
0.63485, -0.8315711, 0.7922204, 0, 0, 0, 1, 1,
0.6390629, 0.5988333, -0.1459768, 0, 0, 0, 1, 1,
0.6400003, -0.6995466, 0.8814867, 0, 0, 0, 1, 1,
0.6410295, 1.151948, 1.522824, 1, 1, 1, 1, 1,
0.6411167, -0.3801793, 0.9832922, 1, 1, 1, 1, 1,
0.6482328, -2.534948, 2.400404, 1, 1, 1, 1, 1,
0.6483012, 0.8157338, 0.8894418, 1, 1, 1, 1, 1,
0.6487243, -0.4812386, 0.4036434, 1, 1, 1, 1, 1,
0.6488489, -0.6816283, 2.093885, 1, 1, 1, 1, 1,
0.6536289, -0.7837355, 1.628782, 1, 1, 1, 1, 1,
0.6562861, -2.047477, 2.407922, 1, 1, 1, 1, 1,
0.6628639, 0.9464741, 2.258176, 1, 1, 1, 1, 1,
0.665439, -0.949007, 1.496185, 1, 1, 1, 1, 1,
0.6737714, 0.4961508, -0.7253394, 1, 1, 1, 1, 1,
0.6745993, 0.2431809, 1.750881, 1, 1, 1, 1, 1,
0.6748958, -0.6533771, 2.810282, 1, 1, 1, 1, 1,
0.6793901, -0.09697691, 3.434831, 1, 1, 1, 1, 1,
0.6870186, -0.5203158, 0.7861846, 1, 1, 1, 1, 1,
0.699621, -0.1133177, -0.1954575, 0, 0, 1, 1, 1,
0.703316, -0.7015138, 2.700132, 1, 0, 0, 1, 1,
0.7033755, -0.7761533, 1.619879, 1, 0, 0, 1, 1,
0.7053595, 0.2596043, 2.304173, 1, 0, 0, 1, 1,
0.7096707, -1.527317, 3.841807, 1, 0, 0, 1, 1,
0.7135397, -0.5221207, 1.161783, 1, 0, 0, 1, 1,
0.7186736, 0.4282249, -0.3998963, 0, 0, 0, 1, 1,
0.7410057, -0.4367416, 4.413369, 0, 0, 0, 1, 1,
0.7440969, 0.7829524, 0.627732, 0, 0, 0, 1, 1,
0.7515951, 1.584833, 1.753402, 0, 0, 0, 1, 1,
0.7545582, 0.9855136, 1.543347, 0, 0, 0, 1, 1,
0.7606009, -0.6972335, 1.6122, 0, 0, 0, 1, 1,
0.7651021, 0.4280109, 1.688246, 0, 0, 0, 1, 1,
0.7727842, -0.08356911, 0.01682514, 1, 1, 1, 1, 1,
0.7767996, 1.836175, 0.2050611, 1, 1, 1, 1, 1,
0.7771943, 0.4936161, 2.397234, 1, 1, 1, 1, 1,
0.7791892, -0.06020277, 0.2265678, 1, 1, 1, 1, 1,
0.7796187, 0.3553949, 1.295592, 1, 1, 1, 1, 1,
0.7800462, -0.2935306, 1.538553, 1, 1, 1, 1, 1,
0.7805606, -0.1322784, 0.7666974, 1, 1, 1, 1, 1,
0.7832323, 1.582966, -2.243371, 1, 1, 1, 1, 1,
0.783648, 0.2743188, 2.500985, 1, 1, 1, 1, 1,
0.7836719, -0.4769255, 1.827973, 1, 1, 1, 1, 1,
0.7837932, -0.3884563, 3.767551, 1, 1, 1, 1, 1,
0.784599, 0.4347119, 0.001415263, 1, 1, 1, 1, 1,
0.7853521, 0.124404, 2.885593, 1, 1, 1, 1, 1,
0.7992759, -0.07804349, 0.3749866, 1, 1, 1, 1, 1,
0.8088725, 0.7966414, 1.108801, 1, 1, 1, 1, 1,
0.8111235, -0.1904448, 1.52269, 0, 0, 1, 1, 1,
0.8113414, -0.4020505, 2.429312, 1, 0, 0, 1, 1,
0.811498, -0.5079247, 2.840806, 1, 0, 0, 1, 1,
0.8118706, 0.8627646, 0.1977292, 1, 0, 0, 1, 1,
0.8154294, -0.4262101, 2.813141, 1, 0, 0, 1, 1,
0.8171672, -0.5828646, 0.09647486, 1, 0, 0, 1, 1,
0.8181053, 0.7299333, 1.100447, 0, 0, 0, 1, 1,
0.8208837, 0.5364916, 1.117306, 0, 0, 0, 1, 1,
0.8237035, 1.31004, -2.107979, 0, 0, 0, 1, 1,
0.8313177, 1.888773, 0.8572472, 0, 0, 0, 1, 1,
0.831879, -0.9556994, 3.122131, 0, 0, 0, 1, 1,
0.8341731, 0.002194054, 1.464673, 0, 0, 0, 1, 1,
0.8350421, 1.20841, 2.481606, 0, 0, 0, 1, 1,
0.8407251, 0.6954325, 0.7891917, 1, 1, 1, 1, 1,
0.8602212, -0.9535953, 3.596898, 1, 1, 1, 1, 1,
0.8616332, 1.063534, 0.2979586, 1, 1, 1, 1, 1,
0.8625787, -1.041561, 4.308438, 1, 1, 1, 1, 1,
0.868502, -2.366051, 2.57206, 1, 1, 1, 1, 1,
0.8688876, 1.714384, 0.839248, 1, 1, 1, 1, 1,
0.8705806, 1.125827, 1.748171, 1, 1, 1, 1, 1,
0.8711731, 0.4877414, 0.8941578, 1, 1, 1, 1, 1,
0.8736433, 0.9036547, 1.275715, 1, 1, 1, 1, 1,
0.8743255, 1.651788, -0.3904905, 1, 1, 1, 1, 1,
0.8750463, -0.04098224, 0.4882874, 1, 1, 1, 1, 1,
0.877288, -0.9897608, 3.443503, 1, 1, 1, 1, 1,
0.8790993, -2.066431, 3.412247, 1, 1, 1, 1, 1,
0.8830281, -0.2060949, 2.215374, 1, 1, 1, 1, 1,
0.8841116, 0.2776675, -1.549615, 1, 1, 1, 1, 1,
0.8862004, -1.907804, 3.310389, 0, 0, 1, 1, 1,
0.8930361, 1.456409, -0.6545409, 1, 0, 0, 1, 1,
0.8947684, -1.387961, 2.913928, 1, 0, 0, 1, 1,
0.8958445, -0.2663089, 1.379464, 1, 0, 0, 1, 1,
0.8975877, -0.03464609, -1.008672, 1, 0, 0, 1, 1,
0.9125897, -0.1444285, 0.6711337, 1, 0, 0, 1, 1,
0.9139118, -1.501406, 3.709495, 0, 0, 0, 1, 1,
0.9154784, -0.4431528, 0.7306074, 0, 0, 0, 1, 1,
0.9205343, -1.078422, 3.409933, 0, 0, 0, 1, 1,
0.9218988, -2.788499, 2.251074, 0, 0, 0, 1, 1,
0.9238368, 0.00612227, 1.421785, 0, 0, 0, 1, 1,
0.9246667, 0.2894938, 0.7080382, 0, 0, 0, 1, 1,
0.9296265, -0.8188578, 3.818335, 0, 0, 0, 1, 1,
0.936204, 0.3849539, 2.410684, 1, 1, 1, 1, 1,
0.9368568, -1.128457, 3.384939, 1, 1, 1, 1, 1,
0.9410132, 0.6253769, -0.1162817, 1, 1, 1, 1, 1,
0.9412885, 2.266971, 0.7727039, 1, 1, 1, 1, 1,
0.9501609, 0.381795, 2.011483, 1, 1, 1, 1, 1,
0.9530467, 0.1976047, 0.4064568, 1, 1, 1, 1, 1,
0.9582399, -0.3058063, 0.7056555, 1, 1, 1, 1, 1,
0.9597848, 1.749941, 1.17132, 1, 1, 1, 1, 1,
0.9631062, 0.5469561, 0.489675, 1, 1, 1, 1, 1,
0.9634666, -1.128337, 2.569355, 1, 1, 1, 1, 1,
0.9670435, 0.6738148, 0.387917, 1, 1, 1, 1, 1,
0.9683483, -0.569363, 1.766, 1, 1, 1, 1, 1,
0.9703408, 0.2186144, 1.331432, 1, 1, 1, 1, 1,
0.9793927, 0.08836703, 0.8688264, 1, 1, 1, 1, 1,
0.9810594, -0.9387249, 3.323224, 1, 1, 1, 1, 1,
0.9856672, -0.1808387, 1.346467, 0, 0, 1, 1, 1,
0.9902021, 0.04659694, 1.24079, 1, 0, 0, 1, 1,
0.9952965, 0.5131986, 1.655074, 1, 0, 0, 1, 1,
0.9976739, -0.866977, 2.876844, 1, 0, 0, 1, 1,
0.9987782, -0.1215759, 1.000794, 1, 0, 0, 1, 1,
1.00444, 0.1663747, 1.599413, 1, 0, 0, 1, 1,
1.009678, 1.362784, 0.5164706, 0, 0, 0, 1, 1,
1.018232, 0.7139322, 0.1829942, 0, 0, 0, 1, 1,
1.026425, -0.5309391, 3.91343, 0, 0, 0, 1, 1,
1.031271, -1.219832, 3.168028, 0, 0, 0, 1, 1,
1.036804, 0.1709992, -0.115082, 0, 0, 0, 1, 1,
1.039314, -1.367366, 1.615629, 0, 0, 0, 1, 1,
1.040377, 0.3655385, 1.296205, 0, 0, 0, 1, 1,
1.044504, 0.8001341, 0.3789796, 1, 1, 1, 1, 1,
1.044898, 1.384195, 0.3934121, 1, 1, 1, 1, 1,
1.045756, -0.926534, 2.579222, 1, 1, 1, 1, 1,
1.048616, -0.2737329, 1.301321, 1, 1, 1, 1, 1,
1.049587, 2.682273, -2.231808, 1, 1, 1, 1, 1,
1.052829, -1.672835, 2.414727, 1, 1, 1, 1, 1,
1.054422, -0.5062091, 2.143655, 1, 1, 1, 1, 1,
1.059484, -1.146369, 2.381563, 1, 1, 1, 1, 1,
1.062033, 0.1787203, 2.379071, 1, 1, 1, 1, 1,
1.070722, -0.1929356, 0.8367544, 1, 1, 1, 1, 1,
1.078901, 1.441688, -0.8005824, 1, 1, 1, 1, 1,
1.079913, -1.088403, 3.590675, 1, 1, 1, 1, 1,
1.080788, -0.6720479, 2.577642, 1, 1, 1, 1, 1,
1.085474, 1.774318, 2.278981, 1, 1, 1, 1, 1,
1.094136, -1.936439, 3.424497, 1, 1, 1, 1, 1,
1.095269, -0.03669193, 2.445227, 0, 0, 1, 1, 1,
1.097914, -0.6226669, 1.097207, 1, 0, 0, 1, 1,
1.098658, -0.1558429, 1.564178, 1, 0, 0, 1, 1,
1.106169, 0.4047305, 2.466075, 1, 0, 0, 1, 1,
1.107677, -1.618556, 1.702016, 1, 0, 0, 1, 1,
1.114591, -0.9222477, 2.045573, 1, 0, 0, 1, 1,
1.117474, -0.6687137, 1.904444, 0, 0, 0, 1, 1,
1.123967, -0.03557585, 2.470225, 0, 0, 0, 1, 1,
1.124649, 0.1114228, 2.024075, 0, 0, 0, 1, 1,
1.129774, 0.6777915, 0.6011598, 0, 0, 0, 1, 1,
1.132053, -0.422917, 0.7726866, 0, 0, 0, 1, 1,
1.134393, -0.4190867, 0.6540156, 0, 0, 0, 1, 1,
1.150756, 0.0533743, 1.846463, 0, 0, 0, 1, 1,
1.158974, 0.5033807, 3.146514, 1, 1, 1, 1, 1,
1.159953, 0.1249697, 0.6862917, 1, 1, 1, 1, 1,
1.161367, -0.9156931, 2.151453, 1, 1, 1, 1, 1,
1.170839, 0.8645551, -0.182466, 1, 1, 1, 1, 1,
1.175035, -0.3175064, 2.508768, 1, 1, 1, 1, 1,
1.196442, -1.042751, 1.370161, 1, 1, 1, 1, 1,
1.207317, -0.6435754, 1.291544, 1, 1, 1, 1, 1,
1.211944, -1.227338, 4.233592, 1, 1, 1, 1, 1,
1.212891, -0.38909, 1.059138, 1, 1, 1, 1, 1,
1.218344, -0.1530814, 1.604304, 1, 1, 1, 1, 1,
1.219507, -0.6622727, 0.7942644, 1, 1, 1, 1, 1,
1.225866, 0.1552715, 0.1143274, 1, 1, 1, 1, 1,
1.229323, 0.3570712, 2.970741, 1, 1, 1, 1, 1,
1.258253, 0.520432, -0.1229522, 1, 1, 1, 1, 1,
1.271905, 0.2394761, 0.3252853, 1, 1, 1, 1, 1,
1.27373, 0.6142419, 1.311981, 0, 0, 1, 1, 1,
1.27651, -7.576859e-05, 1.370421, 1, 0, 0, 1, 1,
1.277009, 0.09862037, 0.1119685, 1, 0, 0, 1, 1,
1.279615, 0.03414609, 2.244497, 1, 0, 0, 1, 1,
1.28628, 1.92543, -0.4918323, 1, 0, 0, 1, 1,
1.287211, 0.7667729, 1.376224, 1, 0, 0, 1, 1,
1.292377, 0.4571681, 0.3621159, 0, 0, 0, 1, 1,
1.299082, -1.504267, 1.640684, 0, 0, 0, 1, 1,
1.302307, -0.5235893, 1.18788, 0, 0, 0, 1, 1,
1.303008, 0.4284466, -0.1858425, 0, 0, 0, 1, 1,
1.304318, 1.01798, 2.181075, 0, 0, 0, 1, 1,
1.30522, 0.5713908, 2.43085, 0, 0, 0, 1, 1,
1.325867, 0.2728534, 0.1794421, 0, 0, 0, 1, 1,
1.32882, -0.301877, 2.09196, 1, 1, 1, 1, 1,
1.329852, 0.4103861, 0.7901418, 1, 1, 1, 1, 1,
1.34381, -1.24788, 2.196291, 1, 1, 1, 1, 1,
1.346794, 0.02229137, -0.9808892, 1, 1, 1, 1, 1,
1.348793, -0.9950387, 2.758088, 1, 1, 1, 1, 1,
1.349079, 0.3684462, 2.660429, 1, 1, 1, 1, 1,
1.352991, 0.6712028, 3.016143, 1, 1, 1, 1, 1,
1.358723, 1.012779, 0.64223, 1, 1, 1, 1, 1,
1.36421, 0.2775023, 2.107056, 1, 1, 1, 1, 1,
1.367773, 0.9618438, 1.170333, 1, 1, 1, 1, 1,
1.371446, -0.9850854, 0.9328249, 1, 1, 1, 1, 1,
1.373171, 0.3584142, 2.072902, 1, 1, 1, 1, 1,
1.37481, -1.212358, 1.510096, 1, 1, 1, 1, 1,
1.376003, -0.6916943, 0.7984869, 1, 1, 1, 1, 1,
1.380584, 1.96817, -0.4167598, 1, 1, 1, 1, 1,
1.386753, -0.6383692, 2.017341, 0, 0, 1, 1, 1,
1.393589, 0.6466713, 2.19719, 1, 0, 0, 1, 1,
1.401893, 1.867329, 0.6196223, 1, 0, 0, 1, 1,
1.411231, -0.2799761, 1.701288, 1, 0, 0, 1, 1,
1.411847, 0.3828146, 0.7744364, 1, 0, 0, 1, 1,
1.41443, 2.033105, 1.646682, 1, 0, 0, 1, 1,
1.431474, -1.248929, 2.841854, 0, 0, 0, 1, 1,
1.439677, 1.161514, -1.989631, 0, 0, 0, 1, 1,
1.440057, 0.2135051, 1.348693, 0, 0, 0, 1, 1,
1.44184, 2.499647, -1.205888, 0, 0, 0, 1, 1,
1.447859, 0.7297072, 1.864117, 0, 0, 0, 1, 1,
1.481058, -1.358448, 2.593796, 0, 0, 0, 1, 1,
1.483734, 0.6574321, 2.292724, 0, 0, 0, 1, 1,
1.488085, -0.4391488, 2.55073, 1, 1, 1, 1, 1,
1.499448, 1.38638, 0.4896935, 1, 1, 1, 1, 1,
1.507436, 0.945355, 2.268288, 1, 1, 1, 1, 1,
1.510091, -0.8234664, 0.8525557, 1, 1, 1, 1, 1,
1.528889, 0.5005386, 0.6051939, 1, 1, 1, 1, 1,
1.530484, 1.848483, 1.467122, 1, 1, 1, 1, 1,
1.531817, 0.04238823, 2.915896, 1, 1, 1, 1, 1,
1.546608, 0.4348256, 2.447147, 1, 1, 1, 1, 1,
1.547741, 0.4934014, 0.6003929, 1, 1, 1, 1, 1,
1.555938, -0.4553333, 1.160642, 1, 1, 1, 1, 1,
1.565949, 0.6506134, 2.276887, 1, 1, 1, 1, 1,
1.582854, 0.9476852, 2.054463, 1, 1, 1, 1, 1,
1.604276, 0.5626155, 1.390534, 1, 1, 1, 1, 1,
1.605513, 1.929878, -0.07978988, 1, 1, 1, 1, 1,
1.609081, 1.705465, -1.038457, 1, 1, 1, 1, 1,
1.614673, 0.2486378, 0.7962376, 0, 0, 1, 1, 1,
1.621824, -0.5067763, 1.628471, 1, 0, 0, 1, 1,
1.645338, 1.153001, 0.3117282, 1, 0, 0, 1, 1,
1.65649, -1.39181, 3.262777, 1, 0, 0, 1, 1,
1.660246, -0.3763291, 2.372025, 1, 0, 0, 1, 1,
1.66067, 1.45225, 0.3469503, 1, 0, 0, 1, 1,
1.675351, -1.467844, 1.966415, 0, 0, 0, 1, 1,
1.693716, 0.8503983, -0.2482156, 0, 0, 0, 1, 1,
1.69856, -0.04217686, 0.3838182, 0, 0, 0, 1, 1,
1.731384, -0.2493426, 0.2157056, 0, 0, 0, 1, 1,
1.740868, 0.4791218, 1.853871, 0, 0, 0, 1, 1,
1.745414, 0.00838706, 1.955873, 0, 0, 0, 1, 1,
1.756284, 0.7372546, 1.722194, 0, 0, 0, 1, 1,
1.770511, -0.3070022, 0.2996149, 1, 1, 1, 1, 1,
1.778054, -0.9182944, 2.293492, 1, 1, 1, 1, 1,
1.796055, -1.670615, 2.452164, 1, 1, 1, 1, 1,
1.827103, 1.850529, 0.9627928, 1, 1, 1, 1, 1,
1.853707, 1.750323, 0.2026317, 1, 1, 1, 1, 1,
1.867518, 1.272835, 1.491593, 1, 1, 1, 1, 1,
1.886724, -0.5163472, 1.996439, 1, 1, 1, 1, 1,
1.91986, -0.3260309, 2.949484, 1, 1, 1, 1, 1,
1.925277, 0.7749542, 0.269272, 1, 1, 1, 1, 1,
1.937897, 1.783697, 0.01457483, 1, 1, 1, 1, 1,
1.971612, 0.2117502, 1.928311, 1, 1, 1, 1, 1,
1.983542, 0.03219283, 1.792799, 1, 1, 1, 1, 1,
1.98717, -2.435621, 3.033524, 1, 1, 1, 1, 1,
1.999937, 0.5244002, 0.08902944, 1, 1, 1, 1, 1,
2.0463, 0.5413412, 2.543016, 1, 1, 1, 1, 1,
2.059314, -0.8156353, 1.232092, 0, 0, 1, 1, 1,
2.073624, -0.1522537, 0.4782008, 1, 0, 0, 1, 1,
2.074142, -0.2107563, 3.822433, 1, 0, 0, 1, 1,
2.100645, -0.637737, 2.06099, 1, 0, 0, 1, 1,
2.121561, 0.1490588, 1.421642, 1, 0, 0, 1, 1,
2.122426, 0.2830629, 1.238604, 1, 0, 0, 1, 1,
2.135903, 0.1440677, 1.253486, 0, 0, 0, 1, 1,
2.164043, 0.7310788, 2.21575, 0, 0, 0, 1, 1,
2.175987, 0.1153987, 1.816101, 0, 0, 0, 1, 1,
2.197982, 0.9311241, 2.615194, 0, 0, 0, 1, 1,
2.258863, -0.2928741, 0.7375214, 0, 0, 0, 1, 1,
2.297482, 0.8730398, 1.254002, 0, 0, 0, 1, 1,
2.428061, 1.917642, 0.5175043, 0, 0, 0, 1, 1,
2.461215, -0.3054816, 0.8929709, 1, 1, 1, 1, 1,
2.512627, 0.1394546, 4.022171, 1, 1, 1, 1, 1,
2.645287, 0.5291005, 0.7315349, 1, 1, 1, 1, 1,
2.669774, 0.4383764, 2.346414, 1, 1, 1, 1, 1,
2.862374, 0.8133023, 0.3427222, 1, 1, 1, 1, 1,
3.009599, -1.55891, 2.023301, 1, 1, 1, 1, 1,
3.166077, -0.6660125, 0.7310533, 1, 1, 1, 1, 1
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
var radius = 9.451778;
var distance = 33.19897;
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
mvMatrix.translate( 0.2098479, 0.096313, 0.05680394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19897);
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
