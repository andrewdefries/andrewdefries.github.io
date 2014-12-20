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
-3.549396, -1.035791, -0.0521377, 1, 0, 0, 1,
-3.384577, -0.5184741, -0.4057379, 1, 0.007843138, 0, 1,
-2.836365, 0.5291018, -1.476434, 1, 0.01176471, 0, 1,
-2.629153, 0.447694, -1.558712, 1, 0.01960784, 0, 1,
-2.624258, 1.019818, 0.1455735, 1, 0.02352941, 0, 1,
-2.522478, 0.8025728, -2.309841, 1, 0.03137255, 0, 1,
-2.46287, 0.446073, -2.509909, 1, 0.03529412, 0, 1,
-2.45917, 0.6344953, -0.4671224, 1, 0.04313726, 0, 1,
-2.428432, -0.5926031, -2.454306, 1, 0.04705882, 0, 1,
-2.421034, -0.03583952, -1.167053, 1, 0.05490196, 0, 1,
-2.332229, -1.889833, -1.506082, 1, 0.05882353, 0, 1,
-2.291136, 0.2916209, -1.48748, 1, 0.06666667, 0, 1,
-2.253072, 1.119598, 0.06083246, 1, 0.07058824, 0, 1,
-2.238522, 0.1324351, -1.77935, 1, 0.07843138, 0, 1,
-2.222778, 0.6054731, -0.4765985, 1, 0.08235294, 0, 1,
-2.217542, 1.290029, -1.422111, 1, 0.09019608, 0, 1,
-2.216196, 1.125286, 0.2254554, 1, 0.09411765, 0, 1,
-2.142415, 0.174844, -0.05855855, 1, 0.1019608, 0, 1,
-2.141982, -0.3592833, -3.36286, 1, 0.1098039, 0, 1,
-2.134118, -0.7454277, -2.034728, 1, 0.1137255, 0, 1,
-2.128297, -2.419825, -3.68302, 1, 0.1215686, 0, 1,
-2.102723, -1.001661, -2.28662, 1, 0.1254902, 0, 1,
-2.080369, 0.5746742, -1.342507, 1, 0.1333333, 0, 1,
-2.060338, -1.448534, -1.357257, 1, 0.1372549, 0, 1,
-2.030039, -0.9838797, -2.821354, 1, 0.145098, 0, 1,
-2.024697, 0.05372291, -1.873338, 1, 0.1490196, 0, 1,
-2.023997, 0.2303788, -1.800409, 1, 0.1568628, 0, 1,
-2.021498, -0.6405914, -3.041859, 1, 0.1607843, 0, 1,
-2.010575, 1.676348, -1.370363, 1, 0.1686275, 0, 1,
-2.006366, 0.2928921, -0.5483038, 1, 0.172549, 0, 1,
-2.00473, -0.9189531, -1.978445, 1, 0.1803922, 0, 1,
-1.990408, 0.004303983, -2.759219, 1, 0.1843137, 0, 1,
-1.984296, 0.8825298, -1.106904, 1, 0.1921569, 0, 1,
-1.969595, -0.4906133, -0.687319, 1, 0.1960784, 0, 1,
-1.968673, 0.2785224, -0.9247143, 1, 0.2039216, 0, 1,
-1.951011, 1.637146, 1.10958, 1, 0.2117647, 0, 1,
-1.950117, -0.5822372, -2.703717, 1, 0.2156863, 0, 1,
-1.947934, -1.647495, -1.766744, 1, 0.2235294, 0, 1,
-1.942914, 0.06903505, -0.8355156, 1, 0.227451, 0, 1,
-1.928591, -0.2490265, -1.195042, 1, 0.2352941, 0, 1,
-1.907491, 0.2214962, -0.02341573, 1, 0.2392157, 0, 1,
-1.890078, 0.3824381, -1.871671, 1, 0.2470588, 0, 1,
-1.875148, -0.7185006, -3.356857, 1, 0.2509804, 0, 1,
-1.842662, -0.3594961, -3.306376, 1, 0.2588235, 0, 1,
-1.835904, -0.1084452, -1.145597, 1, 0.2627451, 0, 1,
-1.835828, -0.4320581, -1.658234, 1, 0.2705882, 0, 1,
-1.827132, -0.4414713, -1.715494, 1, 0.2745098, 0, 1,
-1.810958, 0.8641382, -3.604709, 1, 0.282353, 0, 1,
-1.797109, 0.3876564, -1.944874, 1, 0.2862745, 0, 1,
-1.775646, 1.296327, 0.384989, 1, 0.2941177, 0, 1,
-1.774691, -0.4381213, 0.02945202, 1, 0.3019608, 0, 1,
-1.759103, -0.7668307, -2.359558, 1, 0.3058824, 0, 1,
-1.751449, -1.48077, -2.38431, 1, 0.3137255, 0, 1,
-1.72904, -0.06771775, -1.055345, 1, 0.3176471, 0, 1,
-1.7255, 1.806022, 1.238056, 1, 0.3254902, 0, 1,
-1.719467, -1.435227, -1.566105, 1, 0.3294118, 0, 1,
-1.703827, -0.1896344, -2.97689, 1, 0.3372549, 0, 1,
-1.694813, -0.240887, 0.5950363, 1, 0.3411765, 0, 1,
-1.692224, 0.2842221, 0.7223169, 1, 0.3490196, 0, 1,
-1.689109, 0.4058973, -2.929415, 1, 0.3529412, 0, 1,
-1.679548, 1.495974, -0.9165282, 1, 0.3607843, 0, 1,
-1.675197, 0.2974755, -3.498569, 1, 0.3647059, 0, 1,
-1.667988, 0.1368012, -1.063286, 1, 0.372549, 0, 1,
-1.661202, -1.013888, -2.506356, 1, 0.3764706, 0, 1,
-1.652886, 1.399946, -1.482381, 1, 0.3843137, 0, 1,
-1.634557, -2.09087, -2.882927, 1, 0.3882353, 0, 1,
-1.604151, 1.193744, -0.3352838, 1, 0.3960784, 0, 1,
-1.600926, -1.105816, -1.529725, 1, 0.4039216, 0, 1,
-1.57236, 0.5511905, -2.580257, 1, 0.4078431, 0, 1,
-1.559312, 0.5245519, -0.0305825, 1, 0.4156863, 0, 1,
-1.54467, 1.675921, 0.3778262, 1, 0.4196078, 0, 1,
-1.540206, -1.976484, -1.991203, 1, 0.427451, 0, 1,
-1.539516, -1.410322, -2.698155, 1, 0.4313726, 0, 1,
-1.52093, 0.3893, -1.270473, 1, 0.4392157, 0, 1,
-1.516351, 0.5815576, -1.483875, 1, 0.4431373, 0, 1,
-1.513177, -0.08338434, -0.2738371, 1, 0.4509804, 0, 1,
-1.491741, 1.321881, -2.117357, 1, 0.454902, 0, 1,
-1.489701, -0.4319858, -1.648773, 1, 0.4627451, 0, 1,
-1.487721, 1.562815, -0.2565054, 1, 0.4666667, 0, 1,
-1.486442, -0.5172911, -1.027062, 1, 0.4745098, 0, 1,
-1.458937, 0.3414383, -1.09252, 1, 0.4784314, 0, 1,
-1.445198, 0.339803, -2.065825, 1, 0.4862745, 0, 1,
-1.442981, -1.945947, -3.548116, 1, 0.4901961, 0, 1,
-1.442385, -1.003742, -1.91567, 1, 0.4980392, 0, 1,
-1.430094, -1.082506, -1.930082, 1, 0.5058824, 0, 1,
-1.4299, 0.6433706, -1.283065, 1, 0.509804, 0, 1,
-1.427627, 0.3202874, -0.7582338, 1, 0.5176471, 0, 1,
-1.418654, 0.8300982, -1.09987, 1, 0.5215687, 0, 1,
-1.415721, 0.4491335, -2.649471, 1, 0.5294118, 0, 1,
-1.410148, -0.3858781, -2.270223, 1, 0.5333334, 0, 1,
-1.401188, 0.8081591, -2.362261, 1, 0.5411765, 0, 1,
-1.394591, -0.3857141, -0.5447246, 1, 0.5450981, 0, 1,
-1.392452, -1.257474, -3.520549, 1, 0.5529412, 0, 1,
-1.386995, -0.04198999, -2.466351, 1, 0.5568628, 0, 1,
-1.384691, -0.9513875, -3.932647, 1, 0.5647059, 0, 1,
-1.377811, 0.4352234, -2.17169, 1, 0.5686275, 0, 1,
-1.359126, 0.1976144, -0.5115295, 1, 0.5764706, 0, 1,
-1.347807, -0.2709804, 0.3758485, 1, 0.5803922, 0, 1,
-1.347162, -1.005054, -3.147128, 1, 0.5882353, 0, 1,
-1.34705, 0.5409195, -0.6973032, 1, 0.5921569, 0, 1,
-1.345929, -0.3213187, -0.7536008, 1, 0.6, 0, 1,
-1.334314, 1.575251, -1.077234, 1, 0.6078432, 0, 1,
-1.327405, -0.4725464, -1.274733, 1, 0.6117647, 0, 1,
-1.312992, 1.288815, -0.654795, 1, 0.6196079, 0, 1,
-1.308506, -0.1074642, -1.886387, 1, 0.6235294, 0, 1,
-1.298247, 0.5584125, -1.359751, 1, 0.6313726, 0, 1,
-1.294782, -0.4453677, -0.8647941, 1, 0.6352941, 0, 1,
-1.292925, 0.7299368, -1.936999, 1, 0.6431373, 0, 1,
-1.2877, -0.5993409, -2.79537, 1, 0.6470588, 0, 1,
-1.276256, 0.9221015, -1.879459, 1, 0.654902, 0, 1,
-1.269732, -1.499945, -2.498059, 1, 0.6588235, 0, 1,
-1.263321, 0.6257166, -0.8531395, 1, 0.6666667, 0, 1,
-1.26206, 0.5001726, -0.4492666, 1, 0.6705883, 0, 1,
-1.259102, -0.09119541, -2.417485, 1, 0.6784314, 0, 1,
-1.256109, 0.7427538, -0.7372661, 1, 0.682353, 0, 1,
-1.252505, -0.2628263, -2.469018, 1, 0.6901961, 0, 1,
-1.249127, 0.0899612, -1.337335, 1, 0.6941177, 0, 1,
-1.246247, -1.394489, -2.307292, 1, 0.7019608, 0, 1,
-1.24539, -1.189684, -3.313505, 1, 0.7098039, 0, 1,
-1.241921, -0.1387813, -0.8031511, 1, 0.7137255, 0, 1,
-1.234593, -0.3871354, -1.572291, 1, 0.7215686, 0, 1,
-1.232517, -0.5719411, -2.447019, 1, 0.7254902, 0, 1,
-1.225326, 0.1829473, -1.295712, 1, 0.7333333, 0, 1,
-1.224775, 0.1702714, -0.937053, 1, 0.7372549, 0, 1,
-1.222331, -1.677938, -2.226896, 1, 0.7450981, 0, 1,
-1.216794, 0.2041102, 0.1691176, 1, 0.7490196, 0, 1,
-1.216201, 1.30548, -1.178581, 1, 0.7568628, 0, 1,
-1.214501, -0.6141969, -3.102461, 1, 0.7607843, 0, 1,
-1.214251, 0.4055789, -0.2035066, 1, 0.7686275, 0, 1,
-1.212661, -0.1702482, -0.08276311, 1, 0.772549, 0, 1,
-1.212532, -0.9823195, -1.477256, 1, 0.7803922, 0, 1,
-1.206893, -1.245392, -0.2356647, 1, 0.7843137, 0, 1,
-1.204947, -0.8990594, -0.7699501, 1, 0.7921569, 0, 1,
-1.19302, 0.1531638, -1.35912, 1, 0.7960784, 0, 1,
-1.192858, 0.2904046, -1.470345, 1, 0.8039216, 0, 1,
-1.190091, -0.4628481, -2.130107, 1, 0.8117647, 0, 1,
-1.180202, -0.2479576, -1.638875, 1, 0.8156863, 0, 1,
-1.174672, 0.339761, -2.079944, 1, 0.8235294, 0, 1,
-1.173327, -0.004150026, -0.7684597, 1, 0.827451, 0, 1,
-1.161027, 0.3532277, -1.872808, 1, 0.8352941, 0, 1,
-1.156962, 0.8447836, -0.9125853, 1, 0.8392157, 0, 1,
-1.154068, -0.349839, -1.310559, 1, 0.8470588, 0, 1,
-1.147705, -0.9992489, -2.476741, 1, 0.8509804, 0, 1,
-1.143271, -1.681857, -1.030781, 1, 0.8588235, 0, 1,
-1.141789, 0.6780537, -1.262788, 1, 0.8627451, 0, 1,
-1.141315, 0.5009329, -0.1853291, 1, 0.8705882, 0, 1,
-1.13523, -1.288312, -3.125422, 1, 0.8745098, 0, 1,
-1.132413, -0.5885941, -2.530793, 1, 0.8823529, 0, 1,
-1.131224, -0.4435547, -1.793342, 1, 0.8862745, 0, 1,
-1.126781, 0.04718736, 0.6917749, 1, 0.8941177, 0, 1,
-1.121904, 0.2635738, -1.373331, 1, 0.8980392, 0, 1,
-1.10764, -1.048665, -4.624079, 1, 0.9058824, 0, 1,
-1.104005, 0.8731371, 0.07075101, 1, 0.9137255, 0, 1,
-1.103452, 0.235266, -0.2815295, 1, 0.9176471, 0, 1,
-1.102436, -2.093942, -2.240175, 1, 0.9254902, 0, 1,
-1.099469, 0.9289417, -1.387139, 1, 0.9294118, 0, 1,
-1.095713, 0.01428715, -2.31028, 1, 0.9372549, 0, 1,
-1.095431, -0.7776722, -2.81338, 1, 0.9411765, 0, 1,
-1.08588, -0.06799551, -0.4387912, 1, 0.9490196, 0, 1,
-1.085604, -0.3731759, -1.47867, 1, 0.9529412, 0, 1,
-1.076629, -0.1955609, -1.344091, 1, 0.9607843, 0, 1,
-1.063914, 0.2641744, -0.9217422, 1, 0.9647059, 0, 1,
-1.062983, -0.5889205, -3.090324, 1, 0.972549, 0, 1,
-1.057703, 0.083756, -0.5700367, 1, 0.9764706, 0, 1,
-1.054954, -0.19691, -2.307165, 1, 0.9843137, 0, 1,
-1.049737, 0.5514331, -1.276412, 1, 0.9882353, 0, 1,
-1.047745, -1.617494, -2.441315, 1, 0.9960784, 0, 1,
-1.037638, 0.03817947, -2.035701, 0.9960784, 1, 0, 1,
-1.035556, 2.135695, -0.5734276, 0.9921569, 1, 0, 1,
-1.023504, 1.918956, -1.672276, 0.9843137, 1, 0, 1,
-1.007642, 1.120584, -2.31958, 0.9803922, 1, 0, 1,
-1.003484, -1.799071, -3.335924, 0.972549, 1, 0, 1,
-0.9932076, 1.677503, -1.524462, 0.9686275, 1, 0, 1,
-0.9914373, -2.28449, -1.95719, 0.9607843, 1, 0, 1,
-0.9906046, -0.2257146, -1.139877, 0.9568627, 1, 0, 1,
-0.985225, -2.223531, -2.341526, 0.9490196, 1, 0, 1,
-0.9809778, -0.583663, -1.984046, 0.945098, 1, 0, 1,
-0.9733948, -0.07535331, -1.337447, 0.9372549, 1, 0, 1,
-0.9686364, -0.2306568, -1.378333, 0.9333333, 1, 0, 1,
-0.9660082, 0.3153559, -0.7669233, 0.9254902, 1, 0, 1,
-0.9653446, 1.843233, -1.099399, 0.9215686, 1, 0, 1,
-0.9652898, 0.2749729, -3.141267, 0.9137255, 1, 0, 1,
-0.9630722, -0.1020934, -2.23101, 0.9098039, 1, 0, 1,
-0.9489202, -0.1426352, -1.933259, 0.9019608, 1, 0, 1,
-0.9427856, 0.3568534, -1.858429, 0.8941177, 1, 0, 1,
-0.9321831, 0.8985158, -1.525232, 0.8901961, 1, 0, 1,
-0.9316862, -0.2304943, -1.992186, 0.8823529, 1, 0, 1,
-0.9213948, -1.167886, -1.602756, 0.8784314, 1, 0, 1,
-0.9041467, 0.04638944, -1.802692, 0.8705882, 1, 0, 1,
-0.9040604, -0.2801938, -1.372795, 0.8666667, 1, 0, 1,
-0.9026248, -0.7192205, -2.168025, 0.8588235, 1, 0, 1,
-0.8917471, 0.4735656, -1.332522, 0.854902, 1, 0, 1,
-0.8917193, -0.6329636, -2.83837, 0.8470588, 1, 0, 1,
-0.8907227, -1.666838, -3.551555, 0.8431373, 1, 0, 1,
-0.8864985, -1.263637, -3.630703, 0.8352941, 1, 0, 1,
-0.8827505, -2.808066, -1.588023, 0.8313726, 1, 0, 1,
-0.8816064, 0.6518797, 0.2113194, 0.8235294, 1, 0, 1,
-0.8757674, -0.1712263, -1.074895, 0.8196079, 1, 0, 1,
-0.8737, -0.1479726, -1.926586, 0.8117647, 1, 0, 1,
-0.8712311, -1.219847, -3.641377, 0.8078431, 1, 0, 1,
-0.8707168, -0.9494387, -1.737475, 0.8, 1, 0, 1,
-0.869396, -0.06969957, -0.4311744, 0.7921569, 1, 0, 1,
-0.8615032, -1.594697, -2.903054, 0.7882353, 1, 0, 1,
-0.8611779, -0.05567837, -1.050451, 0.7803922, 1, 0, 1,
-0.8423458, 0.53633, -0.9067556, 0.7764706, 1, 0, 1,
-0.8413778, 0.4096178, -0.4626268, 0.7686275, 1, 0, 1,
-0.8405014, -0.3855851, -1.83495, 0.7647059, 1, 0, 1,
-0.8358657, -0.5351963, -2.437069, 0.7568628, 1, 0, 1,
-0.8339099, -0.2733064, -1.804688, 0.7529412, 1, 0, 1,
-0.8241238, -0.6622488, -2.180593, 0.7450981, 1, 0, 1,
-0.815544, 0.4195485, -0.9330352, 0.7411765, 1, 0, 1,
-0.8154329, -0.3535118, -1.187213, 0.7333333, 1, 0, 1,
-0.8136892, 1.766415, -0.4774365, 0.7294118, 1, 0, 1,
-0.8092337, -0.4737647, -3.00206, 0.7215686, 1, 0, 1,
-0.8050795, -0.2210595, 0.8113019, 0.7176471, 1, 0, 1,
-0.7964592, 1.069384, -0.2465716, 0.7098039, 1, 0, 1,
-0.7956228, -1.326666, -2.198775, 0.7058824, 1, 0, 1,
-0.7956023, 2.76681, -0.6348247, 0.6980392, 1, 0, 1,
-0.7923895, -1.233766, -0.5463492, 0.6901961, 1, 0, 1,
-0.7880903, 0.2057002, -2.573811, 0.6862745, 1, 0, 1,
-0.785891, 1.653937, -0.07168811, 0.6784314, 1, 0, 1,
-0.7851743, 0.5651815, -0.6090068, 0.6745098, 1, 0, 1,
-0.7830498, -1.371558, -2.908937, 0.6666667, 1, 0, 1,
-0.7820606, 0.09219701, -3.126093, 0.6627451, 1, 0, 1,
-0.7749444, -0.8812276, -4.166367, 0.654902, 1, 0, 1,
-0.7719997, 1.385599, -0.6510959, 0.6509804, 1, 0, 1,
-0.7695333, -1.347639, -1.911514, 0.6431373, 1, 0, 1,
-0.7685757, -1.300338, -3.650896, 0.6392157, 1, 0, 1,
-0.7681534, 2.64836, -0.2946975, 0.6313726, 1, 0, 1,
-0.7597235, 0.07359891, -2.223834, 0.627451, 1, 0, 1,
-0.7583546, 1.517233, -3.461993, 0.6196079, 1, 0, 1,
-0.7582898, 0.9296811, -0.9428196, 0.6156863, 1, 0, 1,
-0.7533531, 0.4012755, -2.332453, 0.6078432, 1, 0, 1,
-0.7510707, -0.4242564, -2.209383, 0.6039216, 1, 0, 1,
-0.7465554, -1.232963, -2.227621, 0.5960785, 1, 0, 1,
-0.7416796, -0.5723155, -3.071923, 0.5882353, 1, 0, 1,
-0.7410184, -0.03382178, -1.433997, 0.5843138, 1, 0, 1,
-0.7372801, -0.3029548, -2.306512, 0.5764706, 1, 0, 1,
-0.7368963, -0.8260419, -3.138157, 0.572549, 1, 0, 1,
-0.7363064, -0.3165985, -2.438614, 0.5647059, 1, 0, 1,
-0.7331508, -0.03746892, -1.615451, 0.5607843, 1, 0, 1,
-0.7276543, -1.244362, -1.587843, 0.5529412, 1, 0, 1,
-0.7267147, -0.02394927, -2.781492, 0.5490196, 1, 0, 1,
-0.7260721, 1.067412, 0.01774608, 0.5411765, 1, 0, 1,
-0.7228881, -1.8669, -2.907464, 0.5372549, 1, 0, 1,
-0.7227823, -0.6979166, -1.673729, 0.5294118, 1, 0, 1,
-0.7217162, 1.564218, -0.5748378, 0.5254902, 1, 0, 1,
-0.7204965, 2.007085, -0.007289221, 0.5176471, 1, 0, 1,
-0.7188527, -0.4777558, -3.56351, 0.5137255, 1, 0, 1,
-0.71828, -1.107543, -2.612227, 0.5058824, 1, 0, 1,
-0.7157493, 0.1869297, -1.72381, 0.5019608, 1, 0, 1,
-0.7081426, -0.1753688, -3.087651, 0.4941176, 1, 0, 1,
-0.7004977, -0.5038832, -3.269313, 0.4862745, 1, 0, 1,
-0.6979008, 0.7071747, -1.401207, 0.4823529, 1, 0, 1,
-0.6957679, 0.04930912, -1.238826, 0.4745098, 1, 0, 1,
-0.6882842, 1.027278, -1.041203, 0.4705882, 1, 0, 1,
-0.6848277, -1.384451, -1.734279, 0.4627451, 1, 0, 1,
-0.6829549, 0.3758462, -1.651473, 0.4588235, 1, 0, 1,
-0.675788, -0.1888346, -2.21464, 0.4509804, 1, 0, 1,
-0.6741916, 1.025095, -0.5598021, 0.4470588, 1, 0, 1,
-0.6720783, 1.278536, -1.170872, 0.4392157, 1, 0, 1,
-0.6662884, -0.2260602, -3.735965, 0.4352941, 1, 0, 1,
-0.6646424, -0.672304, -1.624461, 0.427451, 1, 0, 1,
-0.6625701, -0.6441629, -2.626856, 0.4235294, 1, 0, 1,
-0.6557351, 0.01858234, -0.3711481, 0.4156863, 1, 0, 1,
-0.6554627, 0.4086101, -0.6163498, 0.4117647, 1, 0, 1,
-0.6491077, -0.614718, -2.805411, 0.4039216, 1, 0, 1,
-0.6390609, -0.5407261, -3.900954, 0.3960784, 1, 0, 1,
-0.6370621, -2.760545, -3.821107, 0.3921569, 1, 0, 1,
-0.6370549, -0.629402, -2.557744, 0.3843137, 1, 0, 1,
-0.6341282, -1.104747, -2.701474, 0.3803922, 1, 0, 1,
-0.6332356, 0.1109813, -3.081276, 0.372549, 1, 0, 1,
-0.6284018, 1.02661, 1.096052, 0.3686275, 1, 0, 1,
-0.6274987, -1.268118, -2.363754, 0.3607843, 1, 0, 1,
-0.6273755, -0.7174159, -3.519186, 0.3568628, 1, 0, 1,
-0.6265035, -0.1229235, -2.411779, 0.3490196, 1, 0, 1,
-0.6233976, 0.07981744, 0.5739708, 0.345098, 1, 0, 1,
-0.622734, 1.661259, -0.330133, 0.3372549, 1, 0, 1,
-0.6155064, 0.8693007, 0.3247801, 0.3333333, 1, 0, 1,
-0.6066194, 0.2716182, -1.864799, 0.3254902, 1, 0, 1,
-0.603869, -0.3892487, -1.761473, 0.3215686, 1, 0, 1,
-0.6028864, 1.11892, 0.1667195, 0.3137255, 1, 0, 1,
-0.5977234, 0.7417046, 1.502185, 0.3098039, 1, 0, 1,
-0.5933048, 1.627809, -1.041294, 0.3019608, 1, 0, 1,
-0.5924489, -1.056105, -1.707179, 0.2941177, 1, 0, 1,
-0.5862219, 1.324914, 0.6458012, 0.2901961, 1, 0, 1,
-0.5813805, -0.2700007, -2.02651, 0.282353, 1, 0, 1,
-0.5809916, -0.5467476, -2.026873, 0.2784314, 1, 0, 1,
-0.5805289, -0.1181379, -2.341688, 0.2705882, 1, 0, 1,
-0.5801483, 0.979982, -0.2514477, 0.2666667, 1, 0, 1,
-0.5793667, 0.3561316, -1.401713, 0.2588235, 1, 0, 1,
-0.578043, 0.6779651, 1.263826, 0.254902, 1, 0, 1,
-0.576747, 0.2045589, -0.3064207, 0.2470588, 1, 0, 1,
-0.5757253, 0.004121873, -1.500816, 0.2431373, 1, 0, 1,
-0.5742189, 2.142368, -0.1406727, 0.2352941, 1, 0, 1,
-0.5692418, 0.5255569, -1.029766, 0.2313726, 1, 0, 1,
-0.5683304, 0.1249246, -1.234279, 0.2235294, 1, 0, 1,
-0.5668957, 0.3319803, 0.5577827, 0.2196078, 1, 0, 1,
-0.5652342, 0.3310942, -1.184922, 0.2117647, 1, 0, 1,
-0.5650461, -0.9410938, -3.331321, 0.2078431, 1, 0, 1,
-0.5520139, 0.06860158, -2.01943, 0.2, 1, 0, 1,
-0.5519747, 0.4143273, -0.5493678, 0.1921569, 1, 0, 1,
-0.5504823, -0.2359166, -2.971627, 0.1882353, 1, 0, 1,
-0.5490422, -1.157015, -3.225102, 0.1803922, 1, 0, 1,
-0.5479708, 0.9417844, -0.1151113, 0.1764706, 1, 0, 1,
-0.5465745, 0.6396457, -2.256734, 0.1686275, 1, 0, 1,
-0.5458716, -0.2284349, -1.900351, 0.1647059, 1, 0, 1,
-0.5448731, 0.9621574, 0.03499443, 0.1568628, 1, 0, 1,
-0.5179674, 1.214208, -2.205153, 0.1529412, 1, 0, 1,
-0.5081034, -0.3012979, -2.284335, 0.145098, 1, 0, 1,
-0.5030138, 0.7947522, -0.8026283, 0.1411765, 1, 0, 1,
-0.5001144, -0.298647, -1.900232, 0.1333333, 1, 0, 1,
-0.4988374, -0.2833798, -1.369944, 0.1294118, 1, 0, 1,
-0.4956564, -1.33301, -3.567462, 0.1215686, 1, 0, 1,
-0.4944923, -0.5153221, -2.313369, 0.1176471, 1, 0, 1,
-0.4939373, -0.1320995, -1.823819, 0.1098039, 1, 0, 1,
-0.4935409, 0.4876692, -0.9197419, 0.1058824, 1, 0, 1,
-0.4932377, 0.892773, -0.7505784, 0.09803922, 1, 0, 1,
-0.492174, 0.01102506, -1.898494, 0.09019608, 1, 0, 1,
-0.4915824, -0.7270366, 0.2006773, 0.08627451, 1, 0, 1,
-0.4899665, -1.830523, -4.717867, 0.07843138, 1, 0, 1,
-0.4891208, 1.338444, -0.3381161, 0.07450981, 1, 0, 1,
-0.4868699, 0.4674207, -1.127979, 0.06666667, 1, 0, 1,
-0.4846987, -0.7165605, -5.041376, 0.0627451, 1, 0, 1,
-0.480867, 1.248285, -2.10173, 0.05490196, 1, 0, 1,
-0.4782236, -0.5892152, -0.6729787, 0.05098039, 1, 0, 1,
-0.4753789, -0.71435, -2.042886, 0.04313726, 1, 0, 1,
-0.4664817, -0.5195108, -2.753393, 0.03921569, 1, 0, 1,
-0.4646606, 1.083168, -0.7921384, 0.03137255, 1, 0, 1,
-0.4589306, -0.08204292, -1.285933, 0.02745098, 1, 0, 1,
-0.4586464, -0.554176, -1.669178, 0.01960784, 1, 0, 1,
-0.4580757, 0.5088928, 0.484831, 0.01568628, 1, 0, 1,
-0.4572031, 0.6631944, -1.696985, 0.007843138, 1, 0, 1,
-0.4485472, -0.9869459, -3.13121, 0.003921569, 1, 0, 1,
-0.4431013, -0.7661497, -2.637197, 0, 1, 0.003921569, 1,
-0.4419808, -0.9761062, -3.122247, 0, 1, 0.01176471, 1,
-0.4410947, -0.2642648, -2.617903, 0, 1, 0.01568628, 1,
-0.4404478, 1.100497, 0.3803906, 0, 1, 0.02352941, 1,
-0.4392697, 2.490234, -0.2624634, 0, 1, 0.02745098, 1,
-0.4373249, -0.7803579, -3.206198, 0, 1, 0.03529412, 1,
-0.4353084, 0.8922611, -0.8513644, 0, 1, 0.03921569, 1,
-0.434954, -1.144929, -3.815593, 0, 1, 0.04705882, 1,
-0.4346766, -1.556629, -5.359138, 0, 1, 0.05098039, 1,
-0.4292194, -0.6872616, -2.957324, 0, 1, 0.05882353, 1,
-0.4224943, 1.614471, -0.08689272, 0, 1, 0.0627451, 1,
-0.4174904, 0.6179579, -1.762366, 0, 1, 0.07058824, 1,
-0.4161204, -0.7278042, -4.114863, 0, 1, 0.07450981, 1,
-0.4124107, 0.07927666, -1.970876, 0, 1, 0.08235294, 1,
-0.4107142, -0.3548948, -1.64993, 0, 1, 0.08627451, 1,
-0.4072717, -0.9579518, -2.175561, 0, 1, 0.09411765, 1,
-0.4029285, 1.559084, 0.1276471, 0, 1, 0.1019608, 1,
-0.3973345, 1.628776, -0.01826756, 0, 1, 0.1058824, 1,
-0.3952968, -0.5058561, -4.514034, 0, 1, 0.1137255, 1,
-0.3879713, 0.5386018, -0.1019671, 0, 1, 0.1176471, 1,
-0.3879247, 0.9131823, -2.498836, 0, 1, 0.1254902, 1,
-0.3867811, -0.4862458, -3.743605, 0, 1, 0.1294118, 1,
-0.3827493, -0.2566961, -2.477539, 0, 1, 0.1372549, 1,
-0.3728787, 0.3344508, -0.994027, 0, 1, 0.1411765, 1,
-0.3727296, -0.6475269, -2.77575, 0, 1, 0.1490196, 1,
-0.3698913, -0.9069926, -1.317586, 0, 1, 0.1529412, 1,
-0.363227, 1.758591, 0.4904988, 0, 1, 0.1607843, 1,
-0.3610699, -0.7395788, -2.973105, 0, 1, 0.1647059, 1,
-0.3604591, 0.0753239, -1.325954, 0, 1, 0.172549, 1,
-0.3582726, 0.1202946, -0.1514215, 0, 1, 0.1764706, 1,
-0.3577964, 1.133388, -0.1793992, 0, 1, 0.1843137, 1,
-0.3575687, -0.8228755, -0.9635175, 0, 1, 0.1882353, 1,
-0.3562784, 0.08521643, -1.859568, 0, 1, 0.1960784, 1,
-0.3533634, 1.221429, 0.5071173, 0, 1, 0.2039216, 1,
-0.3449372, -1.478599, -3.429561, 0, 1, 0.2078431, 1,
-0.3421465, 0.7729449, -0.9169827, 0, 1, 0.2156863, 1,
-0.3405507, 0.5651144, -1.171167, 0, 1, 0.2196078, 1,
-0.3391569, 1.164145, -0.2722777, 0, 1, 0.227451, 1,
-0.3372138, -1.794607, -3.506427, 0, 1, 0.2313726, 1,
-0.3349942, 1.933478, -1.393758, 0, 1, 0.2392157, 1,
-0.334988, 0.88221, -2.056639, 0, 1, 0.2431373, 1,
-0.333602, 0.387567, 0.1066848, 0, 1, 0.2509804, 1,
-0.3287301, -1.408032, -1.272658, 0, 1, 0.254902, 1,
-0.3204227, 0.0844469, -1.704958, 0, 1, 0.2627451, 1,
-0.3189023, -0.6512017, -2.972045, 0, 1, 0.2666667, 1,
-0.3074673, -1.657675, -3.340587, 0, 1, 0.2745098, 1,
-0.3064903, 0.9394799, 0.1434249, 0, 1, 0.2784314, 1,
-0.3054259, -1.008962, -2.125442, 0, 1, 0.2862745, 1,
-0.3050193, 1.020588, -0.3882408, 0, 1, 0.2901961, 1,
-0.2994679, 1.326235, -0.07853755, 0, 1, 0.2980392, 1,
-0.2982103, 0.009716433, 0.3500017, 0, 1, 0.3058824, 1,
-0.2937349, 0.08097791, -2.695964, 0, 1, 0.3098039, 1,
-0.2870393, 0.2569633, -1.031093, 0, 1, 0.3176471, 1,
-0.2799071, -0.5238568, -3.111098, 0, 1, 0.3215686, 1,
-0.2785353, 1.339192, 1.551103, 0, 1, 0.3294118, 1,
-0.2738631, 0.7503929, -0.7059267, 0, 1, 0.3333333, 1,
-0.272865, 0.5256262, -2.755844, 0, 1, 0.3411765, 1,
-0.2710838, 0.6184127, -0.01755506, 0, 1, 0.345098, 1,
-0.270266, 0.1735454, -3.036599, 0, 1, 0.3529412, 1,
-0.2690372, 1.806365, -1.343683, 0, 1, 0.3568628, 1,
-0.2684635, -0.5386316, -3.81545, 0, 1, 0.3647059, 1,
-0.2647513, 0.3976626, -0.245777, 0, 1, 0.3686275, 1,
-0.2633982, 0.09656224, -2.251959, 0, 1, 0.3764706, 1,
-0.2621195, -2.349355, -3.363147, 0, 1, 0.3803922, 1,
-0.2559972, -0.8589949, -2.445579, 0, 1, 0.3882353, 1,
-0.2504446, -0.7824621, -2.400374, 0, 1, 0.3921569, 1,
-0.2486725, -0.5962844, -2.12785, 0, 1, 0.4, 1,
-0.247651, 0.3876668, 0.6781422, 0, 1, 0.4078431, 1,
-0.2474534, 0.4999853, -1.543583, 0, 1, 0.4117647, 1,
-0.2458303, 0.5007105, -1.050823, 0, 1, 0.4196078, 1,
-0.2445253, -0.5263867, -1.826236, 0, 1, 0.4235294, 1,
-0.242715, 1.697805, 0.3225553, 0, 1, 0.4313726, 1,
-0.2319963, 0.5374018, -1.765164, 0, 1, 0.4352941, 1,
-0.2291705, 0.7437118, -1.915184, 0, 1, 0.4431373, 1,
-0.2272965, 0.6080087, -0.4047686, 0, 1, 0.4470588, 1,
-0.2229305, -2.451065, -2.665109, 0, 1, 0.454902, 1,
-0.2218949, -0.6496744, -1.559649, 0, 1, 0.4588235, 1,
-0.2199989, 1.096038, -0.06524811, 0, 1, 0.4666667, 1,
-0.2198123, -1.501017, -2.159755, 0, 1, 0.4705882, 1,
-0.2185869, -1.030804, -1.773436, 0, 1, 0.4784314, 1,
-0.2161492, -0.4093606, -3.807164, 0, 1, 0.4823529, 1,
-0.2140224, -1.387935, -4.197032, 0, 1, 0.4901961, 1,
-0.2137952, 0.5433194, -2.180561, 0, 1, 0.4941176, 1,
-0.2111087, 2.048156, -0.5943455, 0, 1, 0.5019608, 1,
-0.2031578, 0.6710775, 0.3213805, 0, 1, 0.509804, 1,
-0.2020375, 0.5031916, -0.3122428, 0, 1, 0.5137255, 1,
-0.1999971, 1.705382, -2.430208, 0, 1, 0.5215687, 1,
-0.1968074, -0.6696794, -1.872767, 0, 1, 0.5254902, 1,
-0.1946073, -0.1498655, -2.440175, 0, 1, 0.5333334, 1,
-0.1903272, -0.3484533, -2.806995, 0, 1, 0.5372549, 1,
-0.1891366, -0.09428166, -1.347687, 0, 1, 0.5450981, 1,
-0.188141, -1.264153, -2.704075, 0, 1, 0.5490196, 1,
-0.1881278, -0.9327287, -2.630049, 0, 1, 0.5568628, 1,
-0.1874899, 0.09227155, -0.2723672, 0, 1, 0.5607843, 1,
-0.1871382, 1.44147, 1.148862, 0, 1, 0.5686275, 1,
-0.1852227, 0.08452909, -2.934028, 0, 1, 0.572549, 1,
-0.1816495, -0.8709934, -0.4948168, 0, 1, 0.5803922, 1,
-0.1781942, 0.9470912, 1.834696, 0, 1, 0.5843138, 1,
-0.1765038, 1.039305, 2.074086, 0, 1, 0.5921569, 1,
-0.1731462, 1.510585, 0.2979591, 0, 1, 0.5960785, 1,
-0.1704261, 0.03003691, -0.2714421, 0, 1, 0.6039216, 1,
-0.1687288, -0.084953, -2.221061, 0, 1, 0.6117647, 1,
-0.1661527, 1.533572, -0.4691683, 0, 1, 0.6156863, 1,
-0.1656659, 0.1980869, -1.648906, 0, 1, 0.6235294, 1,
-0.1626523, 0.5702372, 0.6300527, 0, 1, 0.627451, 1,
-0.1614478, -2.747033, -3.880926, 0, 1, 0.6352941, 1,
-0.1614437, 0.1585703, -1.505568, 0, 1, 0.6392157, 1,
-0.1603369, -0.1095064, -2.266244, 0, 1, 0.6470588, 1,
-0.1584569, 0.5340677, 0.6416561, 0, 1, 0.6509804, 1,
-0.1563372, 2.479593, -1.395447, 0, 1, 0.6588235, 1,
-0.1563067, -1.054805, -1.235606, 0, 1, 0.6627451, 1,
-0.1518472, 1.046559, 0.08203647, 0, 1, 0.6705883, 1,
-0.1509426, 0.5239415, -0.3400989, 0, 1, 0.6745098, 1,
-0.1496208, 0.7248809, -0.1825209, 0, 1, 0.682353, 1,
-0.1466387, -1.111698, -1.771124, 0, 1, 0.6862745, 1,
-0.1464166, -0.4342953, -3.194562, 0, 1, 0.6941177, 1,
-0.1462819, -0.09112243, -4.098033, 0, 1, 0.7019608, 1,
-0.1462099, 0.5744576, 0.4732177, 0, 1, 0.7058824, 1,
-0.1460343, -0.9574224, -2.585919, 0, 1, 0.7137255, 1,
-0.1446776, 0.3609441, -0.2433874, 0, 1, 0.7176471, 1,
-0.1419208, -0.39902, -2.488265, 0, 1, 0.7254902, 1,
-0.1401604, 0.3326657, -0.6533477, 0, 1, 0.7294118, 1,
-0.1397955, -0.2202145, -2.153452, 0, 1, 0.7372549, 1,
-0.1341533, -0.5774511, -2.149888, 0, 1, 0.7411765, 1,
-0.1332482, -0.2714694, -1.8205, 0, 1, 0.7490196, 1,
-0.132661, 0.9552514, -0.3455831, 0, 1, 0.7529412, 1,
-0.1294085, 0.686501, 1.350199, 0, 1, 0.7607843, 1,
-0.1289603, 1.129541, 1.005997, 0, 1, 0.7647059, 1,
-0.1281964, -0.9168752, -3.548325, 0, 1, 0.772549, 1,
-0.1249258, -0.3843333, -4.21249, 0, 1, 0.7764706, 1,
-0.1246906, -0.7876224, -2.16912, 0, 1, 0.7843137, 1,
-0.1157106, -0.2104502, -3.196604, 0, 1, 0.7882353, 1,
-0.1150463, 2.586813, -0.9366114, 0, 1, 0.7960784, 1,
-0.1147297, 1.861183, -0.3643966, 0, 1, 0.8039216, 1,
-0.1113434, -0.9599726, -2.564724, 0, 1, 0.8078431, 1,
-0.1064349, 1.204091, 0.5783579, 0, 1, 0.8156863, 1,
-0.1057037, -1.123341, -2.953994, 0, 1, 0.8196079, 1,
-0.1052633, 0.1138458, -2.348047, 0, 1, 0.827451, 1,
-0.09900536, -0.7530151, -1.987586, 0, 1, 0.8313726, 1,
-0.09899447, 0.08293552, -1.776193, 0, 1, 0.8392157, 1,
-0.09722486, -0.3372887, -2.599545, 0, 1, 0.8431373, 1,
-0.09478834, 0.2204862, -0.02158664, 0, 1, 0.8509804, 1,
-0.09468118, 0.7636818, -0.3767131, 0, 1, 0.854902, 1,
-0.0939588, 0.7378617, -1.576435, 0, 1, 0.8627451, 1,
-0.08235372, 0.6857648, -1.313514, 0, 1, 0.8666667, 1,
-0.08176424, -0.1605108, -0.9013929, 0, 1, 0.8745098, 1,
-0.08013146, 1.03642, -0.8381488, 0, 1, 0.8784314, 1,
-0.07218233, 0.3023576, -0.391234, 0, 1, 0.8862745, 1,
-0.06621116, 1.813181, 0.9492074, 0, 1, 0.8901961, 1,
-0.06328149, -1.436105, -3.396442, 0, 1, 0.8980392, 1,
-0.06043611, 0.1739199, -0.7712243, 0, 1, 0.9058824, 1,
-0.06029171, -1.627676, -3.746931, 0, 1, 0.9098039, 1,
-0.05741994, 1.046781, 0.04859195, 0, 1, 0.9176471, 1,
-0.05717291, -0.09626738, -2.721425, 0, 1, 0.9215686, 1,
-0.05565425, -0.009318505, -3.179683, 0, 1, 0.9294118, 1,
-0.05554266, 2.448555, -0.9042509, 0, 1, 0.9333333, 1,
-0.05349185, 0.7076741, -0.05172483, 0, 1, 0.9411765, 1,
-0.05148594, 1.711745, 1.29447, 0, 1, 0.945098, 1,
-0.04669315, 0.6006112, 1.529707, 0, 1, 0.9529412, 1,
-0.04354692, 0.1715407, -1.594458, 0, 1, 0.9568627, 1,
-0.03996515, -0.6413062, -3.164773, 0, 1, 0.9647059, 1,
-0.03963569, 0.694862, -0.6621185, 0, 1, 0.9686275, 1,
-0.03802279, 0.3589968, -0.2222051, 0, 1, 0.9764706, 1,
-0.03552354, 0.269039, 1.722516, 0, 1, 0.9803922, 1,
-0.02914601, 2.312558, -0.3698952, 0, 1, 0.9882353, 1,
-0.02895159, 0.003115034, -0.9710312, 0, 1, 0.9921569, 1,
-0.02819853, 1.427006, 0.06573357, 0, 1, 1, 1,
-0.02640644, -0.9251071, -3.203849, 0, 0.9921569, 1, 1,
-0.0250485, 0.6837144, 0.6973516, 0, 0.9882353, 1, 1,
-0.02205858, -0.2144362, -4.561084, 0, 0.9803922, 1, 1,
-0.01760132, -0.2076505, -1.990144, 0, 0.9764706, 1, 1,
-0.0148188, 1.441882, -0.3466269, 0, 0.9686275, 1, 1,
-0.01114212, -0.5441346, -2.554613, 0, 0.9647059, 1, 1,
-0.001399903, -1.596486, -1.40577, 0, 0.9568627, 1, 1,
0.0002932004, -1.181203, 3.709833, 0, 0.9529412, 1, 1,
0.001250174, -0.3535183, 4.615516, 0, 0.945098, 1, 1,
0.00245733, 2.000104, -0.07680263, 0, 0.9411765, 1, 1,
0.005105655, -0.02469242, 0.9752933, 0, 0.9333333, 1, 1,
0.01542355, 0.9391744, -0.8771737, 0, 0.9294118, 1, 1,
0.01560439, 1.090524, -0.7174029, 0, 0.9215686, 1, 1,
0.01728391, 1.206825, 0.7841936, 0, 0.9176471, 1, 1,
0.0198384, 0.01308195, 1.582808, 0, 0.9098039, 1, 1,
0.02395, -0.7163031, 5.263439, 0, 0.9058824, 1, 1,
0.0243172, -1.571102, 2.581924, 0, 0.8980392, 1, 1,
0.02457589, -0.6775802, 4.006361, 0, 0.8901961, 1, 1,
0.02694869, 0.1777229, 1.168001, 0, 0.8862745, 1, 1,
0.02902177, -0.1951651, 1.290476, 0, 0.8784314, 1, 1,
0.03202871, -0.9935011, 2.582554, 0, 0.8745098, 1, 1,
0.03495838, 1.508745, -0.2655046, 0, 0.8666667, 1, 1,
0.03768799, -0.3740708, 2.396415, 0, 0.8627451, 1, 1,
0.0442945, 0.0687892, -0.1026604, 0, 0.854902, 1, 1,
0.04475035, -0.3043714, 4.455983, 0, 0.8509804, 1, 1,
0.05219753, -1.215166, 2.522107, 0, 0.8431373, 1, 1,
0.05324096, 1.065171, -0.2122419, 0, 0.8392157, 1, 1,
0.05590444, 0.4309823, 0.3454434, 0, 0.8313726, 1, 1,
0.05755412, -1.814087, 3.34998, 0, 0.827451, 1, 1,
0.05795778, 0.04554151, 0.1202818, 0, 0.8196079, 1, 1,
0.06277958, -1.570269, 2.404352, 0, 0.8156863, 1, 1,
0.06433082, 0.5941674, 0.96748, 0, 0.8078431, 1, 1,
0.06508595, -1.458936, 3.77708, 0, 0.8039216, 1, 1,
0.06650871, -0.4522813, 1.717491, 0, 0.7960784, 1, 1,
0.06650914, -2.332316, 3.438342, 0, 0.7882353, 1, 1,
0.0739774, -1.039868, 3.344517, 0, 0.7843137, 1, 1,
0.07445365, 0.6554417, 0.5254439, 0, 0.7764706, 1, 1,
0.07996359, -2.567771, 3.298827, 0, 0.772549, 1, 1,
0.08055144, 0.5293099, 0.2606245, 0, 0.7647059, 1, 1,
0.08232842, -0.2688737, 3.357945, 0, 0.7607843, 1, 1,
0.08298912, -0.3416432, 2.842794, 0, 0.7529412, 1, 1,
0.08496892, 1.900799, 0.1427795, 0, 0.7490196, 1, 1,
0.08605221, 0.6023875, 0.7116125, 0, 0.7411765, 1, 1,
0.08605301, -1.937478, 2.14565, 0, 0.7372549, 1, 1,
0.08647611, 1.253401, -0.8435097, 0, 0.7294118, 1, 1,
0.08661207, 0.6985241, -0.5143075, 0, 0.7254902, 1, 1,
0.0883804, 0.404636, -0.6390668, 0, 0.7176471, 1, 1,
0.09097297, 0.9345295, -0.08217859, 0, 0.7137255, 1, 1,
0.09438813, 0.3953273, 0.02435033, 0, 0.7058824, 1, 1,
0.09540886, -0.8948668, 3.579333, 0, 0.6980392, 1, 1,
0.0960061, -1.004295, 3.033467, 0, 0.6941177, 1, 1,
0.1036869, 0.7459475, 0.4758928, 0, 0.6862745, 1, 1,
0.110955, -1.62288, 4.671463, 0, 0.682353, 1, 1,
0.1112521, 0.9419678, -0.7749705, 0, 0.6745098, 1, 1,
0.118229, 0.8807264, 0.9066141, 0, 0.6705883, 1, 1,
0.1198333, 0.3650208, 0.1409334, 0, 0.6627451, 1, 1,
0.1208488, -0.5400295, 2.101187, 0, 0.6588235, 1, 1,
0.1228056, 0.3357357, -0.1850705, 0, 0.6509804, 1, 1,
0.1230007, 0.845383, 0.8568125, 0, 0.6470588, 1, 1,
0.1237703, -0.1394868, 3.516475, 0, 0.6392157, 1, 1,
0.1260933, -0.4155388, 3.161959, 0, 0.6352941, 1, 1,
0.1283016, -0.8645707, 2.84631, 0, 0.627451, 1, 1,
0.1295609, -0.5310643, 3.381928, 0, 0.6235294, 1, 1,
0.1362009, 1.860875, 0.7790651, 0, 0.6156863, 1, 1,
0.1365277, -0.4883189, 2.14694, 0, 0.6117647, 1, 1,
0.1368545, 1.24312, 2.460264, 0, 0.6039216, 1, 1,
0.1370871, 0.3995114, -0.8733734, 0, 0.5960785, 1, 1,
0.1383856, -0.04356357, 3.07649, 0, 0.5921569, 1, 1,
0.1399103, -1.718318, 3.66795, 0, 0.5843138, 1, 1,
0.1399873, 1.567207, 0.1310106, 0, 0.5803922, 1, 1,
0.1420458, -0.05229111, 1.017067, 0, 0.572549, 1, 1,
0.1446188, -0.1836657, 1.872286, 0, 0.5686275, 1, 1,
0.1447244, 0.4364553, 0.1264389, 0, 0.5607843, 1, 1,
0.1472304, 0.3707152, -0.4477185, 0, 0.5568628, 1, 1,
0.1472462, 1.514581, -0.3599556, 0, 0.5490196, 1, 1,
0.148859, -0.2574593, 1.922618, 0, 0.5450981, 1, 1,
0.1503372, -0.0666455, 2.787008, 0, 0.5372549, 1, 1,
0.1510897, -1.118771, 1.607845, 0, 0.5333334, 1, 1,
0.1516482, -0.9821964, 2.555758, 0, 0.5254902, 1, 1,
0.1525716, -0.06119225, 1.052773, 0, 0.5215687, 1, 1,
0.154333, 0.8973873, 1.924508, 0, 0.5137255, 1, 1,
0.1552879, -0.4370393, 1.027134, 0, 0.509804, 1, 1,
0.1586788, 1.364801, 2.394483, 0, 0.5019608, 1, 1,
0.1588954, -1.564499, 5.609541, 0, 0.4941176, 1, 1,
0.1590406, -0.8618066, 3.489713, 0, 0.4901961, 1, 1,
0.1596346, 1.271906, -0.04589643, 0, 0.4823529, 1, 1,
0.1663106, -2.368966, 2.450722, 0, 0.4784314, 1, 1,
0.1717013, -0.6848404, 2.239349, 0, 0.4705882, 1, 1,
0.1723568, -0.7851085, 3.478207, 0, 0.4666667, 1, 1,
0.173752, -1.147481, 2.368654, 0, 0.4588235, 1, 1,
0.1753818, 0.5989968, -0.09478491, 0, 0.454902, 1, 1,
0.1785227, 2.29403, 0.862604, 0, 0.4470588, 1, 1,
0.1787596, 1.117119, -2.320784, 0, 0.4431373, 1, 1,
0.1793189, -0.04412047, 2.239946, 0, 0.4352941, 1, 1,
0.1805344, -0.3116394, 2.408281, 0, 0.4313726, 1, 1,
0.1829703, -1.63965, 1.610046, 0, 0.4235294, 1, 1,
0.1836061, 0.2674884, 1.388816, 0, 0.4196078, 1, 1,
0.1836454, -0.02278647, 2.361698, 0, 0.4117647, 1, 1,
0.1863818, 0.7260241, -0.05018146, 0, 0.4078431, 1, 1,
0.187572, -1.387152, 2.006227, 0, 0.4, 1, 1,
0.1900908, -0.3345826, 2.568031, 0, 0.3921569, 1, 1,
0.1944429, -0.7847459, 4.645598, 0, 0.3882353, 1, 1,
0.1950866, 1.062728, 1.65844, 0, 0.3803922, 1, 1,
0.1953777, 0.5681046, 0.283426, 0, 0.3764706, 1, 1,
0.1992945, 1.465859, -1.934437, 0, 0.3686275, 1, 1,
0.199555, 0.1873811, -0.2123972, 0, 0.3647059, 1, 1,
0.2055486, 0.04474203, 3.053704, 0, 0.3568628, 1, 1,
0.213082, 1.203475, -0.400749, 0, 0.3529412, 1, 1,
0.2146859, -0.3374248, 2.744741, 0, 0.345098, 1, 1,
0.2155844, -0.433533, 2.65979, 0, 0.3411765, 1, 1,
0.2176346, -0.4400084, 2.483008, 0, 0.3333333, 1, 1,
0.2201121, 1.21811, 1.04315, 0, 0.3294118, 1, 1,
0.2202871, 3.212472, 0.9061275, 0, 0.3215686, 1, 1,
0.2203543, 0.1382957, 0.1735641, 0, 0.3176471, 1, 1,
0.2227717, -0.451449, 3.158499, 0, 0.3098039, 1, 1,
0.2266219, -0.6966963, 2.953134, 0, 0.3058824, 1, 1,
0.2339526, 1.770352, -0.6106508, 0, 0.2980392, 1, 1,
0.2351502, 0.3542923, 0.3504239, 0, 0.2901961, 1, 1,
0.2378064, 1.36908, -0.009087033, 0, 0.2862745, 1, 1,
0.243336, 0.1992161, 0.4025904, 0, 0.2784314, 1, 1,
0.2434613, 1.40507, 0.5906232, 0, 0.2745098, 1, 1,
0.243861, -0.9155841, 2.141027, 0, 0.2666667, 1, 1,
0.2459832, -1.161794, 1.039363, 0, 0.2627451, 1, 1,
0.2527843, -1.993693, 2.499731, 0, 0.254902, 1, 1,
0.2579355, 1.856149, -1.13231, 0, 0.2509804, 1, 1,
0.2599431, -2.16783, 3.352444, 0, 0.2431373, 1, 1,
0.260047, 0.9457793, -0.4381171, 0, 0.2392157, 1, 1,
0.2604682, -0.2778454, 3.393396, 0, 0.2313726, 1, 1,
0.2615859, -1.348339, 3.265243, 0, 0.227451, 1, 1,
0.2624544, 1.223204, 1.537516, 0, 0.2196078, 1, 1,
0.265451, 0.3017502, 0.0767835, 0, 0.2156863, 1, 1,
0.2655515, -0.9127428, 2.566955, 0, 0.2078431, 1, 1,
0.270334, 1.807964, 2.078621, 0, 0.2039216, 1, 1,
0.2734816, -0.2057798, 2.483411, 0, 0.1960784, 1, 1,
0.2764128, -2.754264, 3.557992, 0, 0.1882353, 1, 1,
0.2769071, 1.940359, -1.496306, 0, 0.1843137, 1, 1,
0.2801364, 1.247616, -0.7086108, 0, 0.1764706, 1, 1,
0.2846017, 1.066581, -0.2048418, 0, 0.172549, 1, 1,
0.2904957, -0.2107461, 2.731057, 0, 0.1647059, 1, 1,
0.2934172, 0.6579238, 1.723631, 0, 0.1607843, 1, 1,
0.2949816, 1.163758, 1.02769, 0, 0.1529412, 1, 1,
0.2952797, -1.46058, 4.470411, 0, 0.1490196, 1, 1,
0.3019592, -1.125907, 3.490443, 0, 0.1411765, 1, 1,
0.3037466, 0.005493784, 3.76389, 0, 0.1372549, 1, 1,
0.3050807, 0.8801139, 0.4200433, 0, 0.1294118, 1, 1,
0.3080108, -0.3190865, 3.204925, 0, 0.1254902, 1, 1,
0.3094354, -0.264634, 2.638299, 0, 0.1176471, 1, 1,
0.3098002, 0.4448799, 0.4853593, 0, 0.1137255, 1, 1,
0.3125441, -0.6009248, 2.998071, 0, 0.1058824, 1, 1,
0.3128288, 1.267569, 0.723414, 0, 0.09803922, 1, 1,
0.3136156, 0.4925044, 3.18249, 0, 0.09411765, 1, 1,
0.314958, -0.5329124, 2.475108, 0, 0.08627451, 1, 1,
0.3151977, -0.4624296, 1.759561, 0, 0.08235294, 1, 1,
0.3161264, -1.013035, 1.812341, 0, 0.07450981, 1, 1,
0.317761, 2.295622, 0.6964037, 0, 0.07058824, 1, 1,
0.3187759, 0.06744153, 1.542506, 0, 0.0627451, 1, 1,
0.3278933, 0.7436524, 1.562104, 0, 0.05882353, 1, 1,
0.3301171, -2.404631, 3.051266, 0, 0.05098039, 1, 1,
0.3316862, 0.726953, 0.7688485, 0, 0.04705882, 1, 1,
0.3317401, -1.98314, 3.68463, 0, 0.03921569, 1, 1,
0.3358314, -0.4591281, 1.901089, 0, 0.03529412, 1, 1,
0.3378036, -0.1587277, 2.129252, 0, 0.02745098, 1, 1,
0.3379599, 2.654908, -1.303634, 0, 0.02352941, 1, 1,
0.3406123, -0.1372058, 1.497626, 0, 0.01568628, 1, 1,
0.3574254, 1.501484, -0.3187407, 0, 0.01176471, 1, 1,
0.360594, 0.505408, 0.8833717, 0, 0.003921569, 1, 1,
0.3612319, 0.09466258, 2.137743, 0.003921569, 0, 1, 1,
0.3622519, 0.3198667, -0.121587, 0.007843138, 0, 1, 1,
0.3658953, 0.6713044, -0.3587736, 0.01568628, 0, 1, 1,
0.3679214, -0.04930795, 1.927978, 0.01960784, 0, 1, 1,
0.3704183, -1.262852, 2.062792, 0.02745098, 0, 1, 1,
0.3705905, -0.2934038, 0.5452459, 0.03137255, 0, 1, 1,
0.3713287, 0.4892169, 1.647278, 0.03921569, 0, 1, 1,
0.3942339, 0.659362, 2.064458, 0.04313726, 0, 1, 1,
0.3965841, 1.884202, 1.187913, 0.05098039, 0, 1, 1,
0.3966056, -1.181475, 5.252638, 0.05490196, 0, 1, 1,
0.3969949, 0.543562, 1.391452, 0.0627451, 0, 1, 1,
0.3974655, 0.3890041, -0.7736844, 0.06666667, 0, 1, 1,
0.397627, 1.529809, 1.84848, 0.07450981, 0, 1, 1,
0.4040094, 0.6168636, 1.15191, 0.07843138, 0, 1, 1,
0.4071051, -1.562335, 2.041708, 0.08627451, 0, 1, 1,
0.4074501, 1.320513, 0.008003211, 0.09019608, 0, 1, 1,
0.4093966, 0.8361321, 0.1782442, 0.09803922, 0, 1, 1,
0.4095221, 0.6026904, -0.928315, 0.1058824, 0, 1, 1,
0.4149317, 0.7730253, 1.36226, 0.1098039, 0, 1, 1,
0.4177945, 0.647347, -0.1280643, 0.1176471, 0, 1, 1,
0.4186437, 0.3502153, 2.250218, 0.1215686, 0, 1, 1,
0.4188138, 0.2092701, 0.3907552, 0.1294118, 0, 1, 1,
0.4210166, 0.1728422, 0.976442, 0.1333333, 0, 1, 1,
0.4259287, -0.9854058, 1.95818, 0.1411765, 0, 1, 1,
0.4275495, -0.4796031, 4.247231, 0.145098, 0, 1, 1,
0.4353102, 0.7182314, 1.532408, 0.1529412, 0, 1, 1,
0.4368252, 0.7776988, -0.05835928, 0.1568628, 0, 1, 1,
0.4398549, -0.9848366, 3.643476, 0.1647059, 0, 1, 1,
0.4404635, -0.5757367, 2.598036, 0.1686275, 0, 1, 1,
0.4419153, -1.718497, 2.253719, 0.1764706, 0, 1, 1,
0.4454033, 0.6827656, 0.4340163, 0.1803922, 0, 1, 1,
0.445496, 1.664829, 1.452749, 0.1882353, 0, 1, 1,
0.4540131, -1.393447, 4.008018, 0.1921569, 0, 1, 1,
0.4558121, 0.3525137, 0.0639214, 0.2, 0, 1, 1,
0.4559426, 0.4618873, 1.143313, 0.2078431, 0, 1, 1,
0.4584143, 0.941026, -1.487436, 0.2117647, 0, 1, 1,
0.4595733, -0.4387268, 4.010738, 0.2196078, 0, 1, 1,
0.4622946, -0.4213722, 3.804792, 0.2235294, 0, 1, 1,
0.4643372, 1.673425, 0.1457183, 0.2313726, 0, 1, 1,
0.4661861, -1.413085, 3.30312, 0.2352941, 0, 1, 1,
0.468318, -1.545194, 0.7724013, 0.2431373, 0, 1, 1,
0.4707758, -1.301268, 3.116947, 0.2470588, 0, 1, 1,
0.4708158, -0.7906444, 1.604452, 0.254902, 0, 1, 1,
0.4708472, -1.218942, 3.340046, 0.2588235, 0, 1, 1,
0.4713519, -0.9636663, 3.403452, 0.2666667, 0, 1, 1,
0.4716302, 0.07331772, 0.6849974, 0.2705882, 0, 1, 1,
0.4810019, 0.2338434, 1.8825, 0.2784314, 0, 1, 1,
0.4837933, -0.176415, 0.8037332, 0.282353, 0, 1, 1,
0.4841622, 0.4384245, 2.031319, 0.2901961, 0, 1, 1,
0.4881748, 0.07000403, 2.269574, 0.2941177, 0, 1, 1,
0.4935866, -0.07691083, 1.532802, 0.3019608, 0, 1, 1,
0.5019789, -1.800264, 3.064395, 0.3098039, 0, 1, 1,
0.5090119, -0.09136331, 1.253591, 0.3137255, 0, 1, 1,
0.5128201, -0.2093002, 2.88326, 0.3215686, 0, 1, 1,
0.5201361, 0.1407461, 1.674434, 0.3254902, 0, 1, 1,
0.5299228, -0.410576, 1.230622, 0.3333333, 0, 1, 1,
0.5318272, -0.4733592, 2.814533, 0.3372549, 0, 1, 1,
0.5338031, -0.5350234, 2.109721, 0.345098, 0, 1, 1,
0.5347858, 1.150249, -0.8515641, 0.3490196, 0, 1, 1,
0.5366194, -1.162706, 1.245844, 0.3568628, 0, 1, 1,
0.5445961, -0.3624663, 0.9050378, 0.3607843, 0, 1, 1,
0.5448108, -0.5480092, 3.453217, 0.3686275, 0, 1, 1,
0.5510761, 0.1857506, 1.55417, 0.372549, 0, 1, 1,
0.5554145, -0.5303462, 1.440687, 0.3803922, 0, 1, 1,
0.5574629, 0.4351717, 0.6635441, 0.3843137, 0, 1, 1,
0.5612645, 1.084876, -0.1664981, 0.3921569, 0, 1, 1,
0.5620627, 1.352162, 1.080382, 0.3960784, 0, 1, 1,
0.5633101, 0.6561516, 1.574773, 0.4039216, 0, 1, 1,
0.5735517, 1.227572, 1.018011, 0.4117647, 0, 1, 1,
0.5812756, 1.522001, 1.121843, 0.4156863, 0, 1, 1,
0.5914843, -1.023085, 3.422527, 0.4235294, 0, 1, 1,
0.5946739, -0.2628028, 1.35349, 0.427451, 0, 1, 1,
0.5950324, -0.2396071, 1.229852, 0.4352941, 0, 1, 1,
0.5978862, -1.338205, 1.814603, 0.4392157, 0, 1, 1,
0.599853, 0.2447043, 1.155549, 0.4470588, 0, 1, 1,
0.60516, 0.1689293, 2.519259, 0.4509804, 0, 1, 1,
0.6051928, -0.03510958, 2.057795, 0.4588235, 0, 1, 1,
0.6106965, 2.161014, -0.2718483, 0.4627451, 0, 1, 1,
0.6113897, -0.05781478, 1.68785, 0.4705882, 0, 1, 1,
0.6189535, -0.9060814, 2.807626, 0.4745098, 0, 1, 1,
0.6225326, -0.3919199, 1.098419, 0.4823529, 0, 1, 1,
0.6246115, 0.6262662, 0.5355224, 0.4862745, 0, 1, 1,
0.625862, -0.7092059, 2.192164, 0.4941176, 0, 1, 1,
0.628683, 0.2451872, 1.060691, 0.5019608, 0, 1, 1,
0.6291721, 0.2330857, 0.9397333, 0.5058824, 0, 1, 1,
0.6358542, 0.6989039, -0.393251, 0.5137255, 0, 1, 1,
0.6369141, -1.473928, 3.076979, 0.5176471, 0, 1, 1,
0.6381937, -1.274606, 1.300211, 0.5254902, 0, 1, 1,
0.6386421, -1.093376, 2.118895, 0.5294118, 0, 1, 1,
0.6394811, -0.07050345, 2.564947, 0.5372549, 0, 1, 1,
0.6455602, -0.2796122, 2.249716, 0.5411765, 0, 1, 1,
0.6608782, 0.4669866, 1.699927, 0.5490196, 0, 1, 1,
0.6655179, 0.6680275, 2.207781, 0.5529412, 0, 1, 1,
0.6687187, -0.3569089, 1.588777, 0.5607843, 0, 1, 1,
0.6701295, -0.9801083, 0.2240796, 0.5647059, 0, 1, 1,
0.6711875, 0.7482424, 2.413261, 0.572549, 0, 1, 1,
0.6830551, -0.706814, 3.468541, 0.5764706, 0, 1, 1,
0.6857014, -0.5692053, 1.636835, 0.5843138, 0, 1, 1,
0.6892599, 0.2295723, 0.1763421, 0.5882353, 0, 1, 1,
0.6897171, -0.8796971, 2.74499, 0.5960785, 0, 1, 1,
0.689832, 0.3387609, 1.301868, 0.6039216, 0, 1, 1,
0.6910018, -0.5647659, 3.023182, 0.6078432, 0, 1, 1,
0.6929164, -0.5161538, 0.7131066, 0.6156863, 0, 1, 1,
0.700306, 0.153303, 0.5144326, 0.6196079, 0, 1, 1,
0.7013819, 1.411344, 0.6411369, 0.627451, 0, 1, 1,
0.7029498, -1.493157, 3.950094, 0.6313726, 0, 1, 1,
0.7085912, -0.3296535, 0.6331497, 0.6392157, 0, 1, 1,
0.710787, 0.8682509, -0.3501672, 0.6431373, 0, 1, 1,
0.7123784, -0.2487528, 1.985594, 0.6509804, 0, 1, 1,
0.7146112, 0.8696612, 2.246794, 0.654902, 0, 1, 1,
0.7283863, 0.07923274, -0.634414, 0.6627451, 0, 1, 1,
0.7329883, 0.6082262, 0.8383812, 0.6666667, 0, 1, 1,
0.734032, -1.657954, 2.990879, 0.6745098, 0, 1, 1,
0.7350352, -1.824155, 2.288111, 0.6784314, 0, 1, 1,
0.7365268, -0.806614, 1.123333, 0.6862745, 0, 1, 1,
0.7366772, -0.8604883, 2.228306, 0.6901961, 0, 1, 1,
0.7375962, -0.2147838, 2.004036, 0.6980392, 0, 1, 1,
0.740585, -0.4997443, 2.396781, 0.7058824, 0, 1, 1,
0.7471554, -0.865244, 4.407561, 0.7098039, 0, 1, 1,
0.748017, 1.079173, 1.264931, 0.7176471, 0, 1, 1,
0.7496963, -3.154, 2.453594, 0.7215686, 0, 1, 1,
0.7500975, -0.75468, 3.290911, 0.7294118, 0, 1, 1,
0.7528723, 0.52909, 0.4196611, 0.7333333, 0, 1, 1,
0.7533036, 0.4176098, 2.469181, 0.7411765, 0, 1, 1,
0.7580472, -0.5568258, 2.939998, 0.7450981, 0, 1, 1,
0.7588434, 1.01222, 2.115845, 0.7529412, 0, 1, 1,
0.7665421, -0.6392426, 3.308504, 0.7568628, 0, 1, 1,
0.7669643, -0.8427681, 2.435619, 0.7647059, 0, 1, 1,
0.7689256, -0.3029585, 2.470046, 0.7686275, 0, 1, 1,
0.7728919, -0.508867, 3.028716, 0.7764706, 0, 1, 1,
0.7760544, -1.226965, 2.509061, 0.7803922, 0, 1, 1,
0.7834368, 0.4147619, -0.1207784, 0.7882353, 0, 1, 1,
0.7875358, -0.2811679, 1.063016, 0.7921569, 0, 1, 1,
0.7887747, -0.605538, 2.210764, 0.8, 0, 1, 1,
0.7891498, 0.04619529, 1.581191, 0.8078431, 0, 1, 1,
0.7980562, -3.152596, 2.554662, 0.8117647, 0, 1, 1,
0.7981184, -0.1688495, 1.728539, 0.8196079, 0, 1, 1,
0.8004156, 1.3778, 0.2417701, 0.8235294, 0, 1, 1,
0.8015852, -1.017214, 2.151857, 0.8313726, 0, 1, 1,
0.8091401, -1.27427, 2.81295, 0.8352941, 0, 1, 1,
0.8159672, 1.571932, -0.7177005, 0.8431373, 0, 1, 1,
0.8214022, 1.89899, 0.7579672, 0.8470588, 0, 1, 1,
0.825027, -0.6036372, 2.534583, 0.854902, 0, 1, 1,
0.8256614, -0.381174, 1.569451, 0.8588235, 0, 1, 1,
0.830483, 0.5340677, 2.58551, 0.8666667, 0, 1, 1,
0.8364543, 1.107043, -1.497465, 0.8705882, 0, 1, 1,
0.8452846, 0.04418027, 2.605129, 0.8784314, 0, 1, 1,
0.8487455, 0.538536, 1.895159, 0.8823529, 0, 1, 1,
0.8533876, -1.511769, 1.844297, 0.8901961, 0, 1, 1,
0.8538357, -1.183932, 3.362268, 0.8941177, 0, 1, 1,
0.8561706, 0.2084694, 0.7410237, 0.9019608, 0, 1, 1,
0.8598689, 0.2643748, -0.6608577, 0.9098039, 0, 1, 1,
0.861035, -1.395653, 0.6341545, 0.9137255, 0, 1, 1,
0.8645189, -0.9834676, 1.731927, 0.9215686, 0, 1, 1,
0.8721612, 0.1978457, 0.9832709, 0.9254902, 0, 1, 1,
0.8724216, 0.4830304, 1.569462, 0.9333333, 0, 1, 1,
0.8775175, 0.8016829, -0.5715067, 0.9372549, 0, 1, 1,
0.8797199, -0.07226411, 3.783712, 0.945098, 0, 1, 1,
0.8803037, -0.6233756, 1.01914, 0.9490196, 0, 1, 1,
0.8943366, 1.430211, 2.026809, 0.9568627, 0, 1, 1,
0.8964392, -0.1819532, 2.637017, 0.9607843, 0, 1, 1,
0.8964444, 1.779254, -0.971494, 0.9686275, 0, 1, 1,
0.9022567, -1.095804, 1.496113, 0.972549, 0, 1, 1,
0.9036667, -0.3429302, 2.194758, 0.9803922, 0, 1, 1,
0.9041055, 0.1294342, 2.039743, 0.9843137, 0, 1, 1,
0.9041774, 0.911723, 1.137575, 0.9921569, 0, 1, 1,
0.9043784, -0.5597101, 2.897307, 0.9960784, 0, 1, 1,
0.9094372, 0.4646257, 1.440932, 1, 0, 0.9960784, 1,
0.910072, 0.7262545, 2.238516, 1, 0, 0.9882353, 1,
0.9152443, -1.640895, 2.750914, 1, 0, 0.9843137, 1,
0.9201089, -2.220595, 3.787309, 1, 0, 0.9764706, 1,
0.9306489, 0.7517157, 2.090639, 1, 0, 0.972549, 1,
0.931698, -0.8420932, 1.59793, 1, 0, 0.9647059, 1,
0.9360531, 0.386152, 2.450862, 1, 0, 0.9607843, 1,
0.9389081, 0.4301854, 1.291575, 1, 0, 0.9529412, 1,
0.9408526, -1.301237, 2.071734, 1, 0, 0.9490196, 1,
0.9426122, 0.01822414, 1.601655, 1, 0, 0.9411765, 1,
0.9431612, 0.1351471, 1.406026, 1, 0, 0.9372549, 1,
0.9453583, 0.7111169, 0.8245224, 1, 0, 0.9294118, 1,
0.9454648, 0.04426909, 0.3591138, 1, 0, 0.9254902, 1,
0.9555315, 0.1949695, 1.291492, 1, 0, 0.9176471, 1,
0.964855, 2.46472, 2.346189, 1, 0, 0.9137255, 1,
0.9757434, 1.287874, -0.7286198, 1, 0, 0.9058824, 1,
0.9761574, 0.02425792, 2.994393, 1, 0, 0.9019608, 1,
0.9767536, 1.660016, -0.2361267, 1, 0, 0.8941177, 1,
0.9771258, -1.616254, 3.784373, 1, 0, 0.8862745, 1,
0.9817775, 0.3672409, -0.4193644, 1, 0, 0.8823529, 1,
0.9908048, 1.745725, -2.137594, 1, 0, 0.8745098, 1,
1.00787, 1.121834, 0.7523381, 1, 0, 0.8705882, 1,
1.01116, 1.087386, 0.7591109, 1, 0, 0.8627451, 1,
1.015254, 2.296448, -1.571744, 1, 0, 0.8588235, 1,
1.017686, 0.4487606, 0.409618, 1, 0, 0.8509804, 1,
1.017896, -0.5352153, 1.954412, 1, 0, 0.8470588, 1,
1.024215, 0.359142, 1.572701, 1, 0, 0.8392157, 1,
1.02673, 1.751715, -0.6726649, 1, 0, 0.8352941, 1,
1.027964, 0.4249614, 0.09240827, 1, 0, 0.827451, 1,
1.030969, -2.101211, 3.274185, 1, 0, 0.8235294, 1,
1.037066, 0.3890094, -0.7029049, 1, 0, 0.8156863, 1,
1.047531, 1.171462, 0.8184326, 1, 0, 0.8117647, 1,
1.04831, -2.223438, 1.301687, 1, 0, 0.8039216, 1,
1.054467, -0.3599938, 2.811846, 1, 0, 0.7960784, 1,
1.056805, -0.5609174, 0.8480076, 1, 0, 0.7921569, 1,
1.05992, 1.083552, 2.77222, 1, 0, 0.7843137, 1,
1.061409, -0.3976254, 3.044897, 1, 0, 0.7803922, 1,
1.0615, -0.1555254, 3.320223, 1, 0, 0.772549, 1,
1.070478, 1.105845, 0.8802504, 1, 0, 0.7686275, 1,
1.073153, -1.027842, 2.764118, 1, 0, 0.7607843, 1,
1.076421, 0.161957, 1.472501, 1, 0, 0.7568628, 1,
1.077057, -0.450134, 2.106107, 1, 0, 0.7490196, 1,
1.082182, -0.6225033, 2.334206, 1, 0, 0.7450981, 1,
1.089165, -0.4916274, 0.6540981, 1, 0, 0.7372549, 1,
1.090784, 0.2258846, 1.223475, 1, 0, 0.7333333, 1,
1.096543, -0.6220005, 1.413112, 1, 0, 0.7254902, 1,
1.114974, 0.369013, 2.039345, 1, 0, 0.7215686, 1,
1.124724, 1.254783, -0.04962593, 1, 0, 0.7137255, 1,
1.141786, 0.8809457, 2.140856, 1, 0, 0.7098039, 1,
1.141931, 1.188178, 0.2816159, 1, 0, 0.7019608, 1,
1.141967, 1.403836, 0.9526656, 1, 0, 0.6941177, 1,
1.142659, -0.6055935, 1.146134, 1, 0, 0.6901961, 1,
1.144039, -1.578685, 2.58768, 1, 0, 0.682353, 1,
1.147435, 0.6120538, 1.176549, 1, 0, 0.6784314, 1,
1.152401, 0.7845249, 1.42171, 1, 0, 0.6705883, 1,
1.154423, 1.079689, 0.6245143, 1, 0, 0.6666667, 1,
1.155456, 1.315243, 0.4882078, 1, 0, 0.6588235, 1,
1.156404, 1.061661, 0.338945, 1, 0, 0.654902, 1,
1.1606, -0.6749014, 2.397456, 1, 0, 0.6470588, 1,
1.164478, -0.5923599, 1.739062, 1, 0, 0.6431373, 1,
1.176467, 0.1671823, 2.725302, 1, 0, 0.6352941, 1,
1.18296, -0.9993358, 2.436641, 1, 0, 0.6313726, 1,
1.184826, 1.469351, 0.911275, 1, 0, 0.6235294, 1,
1.19297, 0.09715535, 0.9104034, 1, 0, 0.6196079, 1,
1.199558, -0.4267159, 1.720935, 1, 0, 0.6117647, 1,
1.201315, -0.07349656, 0.4661072, 1, 0, 0.6078432, 1,
1.201413, -1.031468, 3.05184, 1, 0, 0.6, 1,
1.205374, -0.6235986, 4.652352, 1, 0, 0.5921569, 1,
1.222109, 0.7485452, 0.08102901, 1, 0, 0.5882353, 1,
1.230986, 2.557862, 1.644447, 1, 0, 0.5803922, 1,
1.232255, 0.7247263, 0.1852662, 1, 0, 0.5764706, 1,
1.236412, -0.5656576, 0.5722709, 1, 0, 0.5686275, 1,
1.236459, -1.003259, 4.87846, 1, 0, 0.5647059, 1,
1.238421, -1.916591, 1.510098, 1, 0, 0.5568628, 1,
1.24168, 1.046777, 0.615428, 1, 0, 0.5529412, 1,
1.243981, 1.33589, 2.395118, 1, 0, 0.5450981, 1,
1.253626, 0.1441924, -2.256881, 1, 0, 0.5411765, 1,
1.262472, 0.9395666, 0.04382764, 1, 0, 0.5333334, 1,
1.271367, 0.6090207, 1.111014, 1, 0, 0.5294118, 1,
1.281681, -1.547837, 3.394993, 1, 0, 0.5215687, 1,
1.285582, 0.9335559, 1.903898, 1, 0, 0.5176471, 1,
1.287809, -0.2601213, 2.446213, 1, 0, 0.509804, 1,
1.294504, -0.5789613, 0.5368449, 1, 0, 0.5058824, 1,
1.29557, 0.03733857, 1.634927, 1, 0, 0.4980392, 1,
1.307677, -0.01027074, 2.547236, 1, 0, 0.4901961, 1,
1.308498, 0.7906128, 2.63097, 1, 0, 0.4862745, 1,
1.314938, -2.129938, 2.983019, 1, 0, 0.4784314, 1,
1.318787, -1.233629, 3.354529, 1, 0, 0.4745098, 1,
1.31933, -0.2902475, 2.310071, 1, 0, 0.4666667, 1,
1.332316, -0.5754088, 0.2704298, 1, 0, 0.4627451, 1,
1.343395, 0.2755038, 2.246612, 1, 0, 0.454902, 1,
1.354532, -0.2139252, 1.570317, 1, 0, 0.4509804, 1,
1.376013, 1.867025, 1.373916, 1, 0, 0.4431373, 1,
1.377057, -0.1334251, 0.9348876, 1, 0, 0.4392157, 1,
1.389639, 0.06428689, -0.7876771, 1, 0, 0.4313726, 1,
1.390302, -1.105665, -0.2625464, 1, 0, 0.427451, 1,
1.396512, -0.4148066, 2.412736, 1, 0, 0.4196078, 1,
1.403235, -0.0237087, 2.311397, 1, 0, 0.4156863, 1,
1.407636, -0.572996, 2.067774, 1, 0, 0.4078431, 1,
1.409849, 0.6239765, 0.9172419, 1, 0, 0.4039216, 1,
1.41327, -0.2050678, 1.775897, 1, 0, 0.3960784, 1,
1.434011, 0.425549, 1.903988, 1, 0, 0.3882353, 1,
1.435365, -0.08287497, 1.196494, 1, 0, 0.3843137, 1,
1.446685, 0.2397466, 1.076923, 1, 0, 0.3764706, 1,
1.454021, -0.9021537, 0.8193032, 1, 0, 0.372549, 1,
1.459268, 0.4043033, 0.344776, 1, 0, 0.3647059, 1,
1.459846, 1.943792, 0.1385417, 1, 0, 0.3607843, 1,
1.474577, 2.187286, -0.1819307, 1, 0, 0.3529412, 1,
1.478492, 0.009065032, 3.183665, 1, 0, 0.3490196, 1,
1.478697, -0.3962386, 0.6618407, 1, 0, 0.3411765, 1,
1.479316, 0.6290367, 2.44226, 1, 0, 0.3372549, 1,
1.4799, 0.1404708, 1.187018, 1, 0, 0.3294118, 1,
1.506785, 0.2015951, -0.436527, 1, 0, 0.3254902, 1,
1.523162, -0.09915072, 1.331889, 1, 0, 0.3176471, 1,
1.538912, 1.740767, 1.394818, 1, 0, 0.3137255, 1,
1.540228, -2.510911, 1.975983, 1, 0, 0.3058824, 1,
1.562964, 2.328228, 0.8781933, 1, 0, 0.2980392, 1,
1.569561, 0.8505955, 1.804742, 1, 0, 0.2941177, 1,
1.586331, -1.317886, 3.970188, 1, 0, 0.2862745, 1,
1.591045, 0.3329735, 0.5142882, 1, 0, 0.282353, 1,
1.595745, 0.8454897, 1.467941, 1, 0, 0.2745098, 1,
1.595939, 2.44759, -0.4190573, 1, 0, 0.2705882, 1,
1.605372, -0.2827236, 1.770463, 1, 0, 0.2627451, 1,
1.607547, -0.8931658, 2.039467, 1, 0, 0.2588235, 1,
1.608805, 0.7320915, 1.055631, 1, 0, 0.2509804, 1,
1.618434, -0.2787746, 1.005556, 1, 0, 0.2470588, 1,
1.639775, 1.146107, 0.0008188156, 1, 0, 0.2392157, 1,
1.660655, 0.298385, 2.227445, 1, 0, 0.2352941, 1,
1.673373, 1.223879, 0.9186732, 1, 0, 0.227451, 1,
1.679981, 0.666072, -0.1264059, 1, 0, 0.2235294, 1,
1.682001, 0.212573, 1.784516, 1, 0, 0.2156863, 1,
1.692474, -1.435607, 4.754976, 1, 0, 0.2117647, 1,
1.697605, 0.8976729, 2.630435, 1, 0, 0.2039216, 1,
1.701004, 2.170399, 0.0367796, 1, 0, 0.1960784, 1,
1.708109, 0.5358456, 2.173347, 1, 0, 0.1921569, 1,
1.711394, -0.9291421, 2.812235, 1, 0, 0.1843137, 1,
1.711665, -0.05139539, 0.7224469, 1, 0, 0.1803922, 1,
1.716489, 0.2064475, 0.1503693, 1, 0, 0.172549, 1,
1.739236, 1.623233, 0.1659251, 1, 0, 0.1686275, 1,
1.761754, -0.5332629, 2.545782, 1, 0, 0.1607843, 1,
1.781092, -1.590483, 0.5805569, 1, 0, 0.1568628, 1,
1.805971, 0.3312823, 1.400002, 1, 0, 0.1490196, 1,
1.826107, -0.4710012, 2.284775, 1, 0, 0.145098, 1,
1.831693, -0.274193, 0.6805003, 1, 0, 0.1372549, 1,
1.8357, 0.4811243, 1.663254, 1, 0, 0.1333333, 1,
1.837063, -0.1875664, 2.975543, 1, 0, 0.1254902, 1,
1.846579, 1.087736, -0.8265329, 1, 0, 0.1215686, 1,
1.867275, 0.250205, 1.695679, 1, 0, 0.1137255, 1,
1.872823, -0.228982, 2.354382, 1, 0, 0.1098039, 1,
1.872893, -1.381759, 3.387878, 1, 0, 0.1019608, 1,
1.874773, -0.8118035, 1.906569, 1, 0, 0.09411765, 1,
1.87788, 0.2256451, -0.2309145, 1, 0, 0.09019608, 1,
1.883252, 1.094444, 0.4705193, 1, 0, 0.08235294, 1,
1.883297, -0.8140031, 2.722715, 1, 0, 0.07843138, 1,
1.895251, 1.47783, 1.428563, 1, 0, 0.07058824, 1,
1.913489, 1.582446, 1.534437, 1, 0, 0.06666667, 1,
1.929151, -0.3367823, -0.05791013, 1, 0, 0.05882353, 1,
1.95293, 0.4499205, 2.730059, 1, 0, 0.05490196, 1,
2.038225, -0.3085297, 0.1618647, 1, 0, 0.04705882, 1,
2.060374, 1.418698, 1.078978, 1, 0, 0.04313726, 1,
2.293033, -0.6843663, 2.563998, 1, 0, 0.03529412, 1,
2.557889, -2.20221, 1.449891, 1, 0, 0.03137255, 1,
2.596613, 1.197345, 1.715645, 1, 0, 0.02352941, 1,
2.616998, -1.394516, 1.646639, 1, 0, 0.01960784, 1,
2.711876, -0.8851977, 2.008706, 1, 0, 0.01176471, 1,
3.00241, -1.322337, 1.866055, 1, 0, 0.007843138, 1
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
-0.2734933, -4.233117, -7.218329, 0, -0.5, 0.5, 0.5,
-0.2734933, -4.233117, -7.218329, 1, -0.5, 0.5, 0.5,
-0.2734933, -4.233117, -7.218329, 1, 1.5, 0.5, 0.5,
-0.2734933, -4.233117, -7.218329, 0, 1.5, 0.5, 0.5
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
-4.659927, 0.02923596, -7.218329, 0, -0.5, 0.5, 0.5,
-4.659927, 0.02923596, -7.218329, 1, -0.5, 0.5, 0.5,
-4.659927, 0.02923596, -7.218329, 1, 1.5, 0.5, 0.5,
-4.659927, 0.02923596, -7.218329, 0, 1.5, 0.5, 0.5
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
-4.659927, -4.233117, 0.1252017, 0, -0.5, 0.5, 0.5,
-4.659927, -4.233117, 0.1252017, 1, -0.5, 0.5, 0.5,
-4.659927, -4.233117, 0.1252017, 1, 1.5, 0.5, 0.5,
-4.659927, -4.233117, 0.1252017, 0, 1.5, 0.5, 0.5
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
-3, -3.249497, -5.523668,
3, -3.249497, -5.523668,
-3, -3.249497, -5.523668,
-3, -3.413434, -5.806112,
-2, -3.249497, -5.523668,
-2, -3.413434, -5.806112,
-1, -3.249497, -5.523668,
-1, -3.413434, -5.806112,
0, -3.249497, -5.523668,
0, -3.413434, -5.806112,
1, -3.249497, -5.523668,
1, -3.413434, -5.806112,
2, -3.249497, -5.523668,
2, -3.413434, -5.806112,
3, -3.249497, -5.523668,
3, -3.413434, -5.806112
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
-3, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
-3, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
-3, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
-3, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
-2, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
-2, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
-2, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
-2, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
-1, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
-1, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
-1, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
-1, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
0, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
0, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
0, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
0, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
1, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
1, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
1, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
1, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
2, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
2, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
2, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
2, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5,
3, -3.741307, -6.370999, 0, -0.5, 0.5, 0.5,
3, -3.741307, -6.370999, 1, -0.5, 0.5, 0.5,
3, -3.741307, -6.370999, 1, 1.5, 0.5, 0.5,
3, -3.741307, -6.370999, 0, 1.5, 0.5, 0.5
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
-3.647673, -3, -5.523668,
-3.647673, 3, -5.523668,
-3.647673, -3, -5.523668,
-3.816382, -3, -5.806112,
-3.647673, -2, -5.523668,
-3.816382, -2, -5.806112,
-3.647673, -1, -5.523668,
-3.816382, -1, -5.806112,
-3.647673, 0, -5.523668,
-3.816382, 0, -5.806112,
-3.647673, 1, -5.523668,
-3.816382, 1, -5.806112,
-3.647673, 2, -5.523668,
-3.816382, 2, -5.806112,
-3.647673, 3, -5.523668,
-3.816382, 3, -5.806112
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
-4.1538, -3, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, -3, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, -3, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, -3, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, -2, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, -2, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, -2, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, -2, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, -1, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, -1, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, -1, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, -1, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, 0, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, 0, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, 0, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, 0, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, 1, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, 1, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, 1, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, 1, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, 2, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, 2, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, 2, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, 2, -6.370999, 0, 1.5, 0.5, 0.5,
-4.1538, 3, -6.370999, 0, -0.5, 0.5, 0.5,
-4.1538, 3, -6.370999, 1, -0.5, 0.5, 0.5,
-4.1538, 3, -6.370999, 1, 1.5, 0.5, 0.5,
-4.1538, 3, -6.370999, 0, 1.5, 0.5, 0.5
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
-3.647673, -3.249497, -4,
-3.647673, -3.249497, 4,
-3.647673, -3.249497, -4,
-3.816382, -3.413434, -4,
-3.647673, -3.249497, -2,
-3.816382, -3.413434, -2,
-3.647673, -3.249497, 0,
-3.816382, -3.413434, 0,
-3.647673, -3.249497, 2,
-3.816382, -3.413434, 2,
-3.647673, -3.249497, 4,
-3.816382, -3.413434, 4
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
-4.1538, -3.741307, -4, 0, -0.5, 0.5, 0.5,
-4.1538, -3.741307, -4, 1, -0.5, 0.5, 0.5,
-4.1538, -3.741307, -4, 1, 1.5, 0.5, 0.5,
-4.1538, -3.741307, -4, 0, 1.5, 0.5, 0.5,
-4.1538, -3.741307, -2, 0, -0.5, 0.5, 0.5,
-4.1538, -3.741307, -2, 1, -0.5, 0.5, 0.5,
-4.1538, -3.741307, -2, 1, 1.5, 0.5, 0.5,
-4.1538, -3.741307, -2, 0, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 0, 0, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 0, 1, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 0, 1, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 0, 0, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 2, 0, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 2, 1, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 2, 1, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 2, 0, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 4, 0, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 4, 1, -0.5, 0.5, 0.5,
-4.1538, -3.741307, 4, 1, 1.5, 0.5, 0.5,
-4.1538, -3.741307, 4, 0, 1.5, 0.5, 0.5
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
-3.647673, -3.249497, -5.523668,
-3.647673, 3.307969, -5.523668,
-3.647673, -3.249497, 5.774072,
-3.647673, 3.307969, 5.774072,
-3.647673, -3.249497, -5.523668,
-3.647673, -3.249497, 5.774072,
-3.647673, 3.307969, -5.523668,
-3.647673, 3.307969, 5.774072,
-3.647673, -3.249497, -5.523668,
3.100687, -3.249497, -5.523668,
-3.647673, -3.249497, 5.774072,
3.100687, -3.249497, 5.774072,
-3.647673, 3.307969, -5.523668,
3.100687, 3.307969, -5.523668,
-3.647673, 3.307969, 5.774072,
3.100687, 3.307969, 5.774072,
3.100687, -3.249497, -5.523668,
3.100687, 3.307969, -5.523668,
3.100687, -3.249497, 5.774072,
3.100687, 3.307969, 5.774072,
3.100687, -3.249497, -5.523668,
3.100687, -3.249497, 5.774072,
3.100687, 3.307969, -5.523668,
3.100687, 3.307969, 5.774072
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
var radius = 7.851142;
var distance = 34.93062;
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
mvMatrix.translate( 0.2734933, -0.02923596, -0.1252017 );
mvMatrix.scale( 1.257907, 1.294526, 0.7513723 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93062);
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
Chlorbufam<-read.table("Chlorbufam.xyz")
```

```
## Error in read.table("Chlorbufam.xyz"): no lines available in input
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
-3.549396, -1.035791, -0.0521377, 0, 0, 1, 1, 1,
-3.384577, -0.5184741, -0.4057379, 1, 0, 0, 1, 1,
-2.836365, 0.5291018, -1.476434, 1, 0, 0, 1, 1,
-2.629153, 0.447694, -1.558712, 1, 0, 0, 1, 1,
-2.624258, 1.019818, 0.1455735, 1, 0, 0, 1, 1,
-2.522478, 0.8025728, -2.309841, 1, 0, 0, 1, 1,
-2.46287, 0.446073, -2.509909, 0, 0, 0, 1, 1,
-2.45917, 0.6344953, -0.4671224, 0, 0, 0, 1, 1,
-2.428432, -0.5926031, -2.454306, 0, 0, 0, 1, 1,
-2.421034, -0.03583952, -1.167053, 0, 0, 0, 1, 1,
-2.332229, -1.889833, -1.506082, 0, 0, 0, 1, 1,
-2.291136, 0.2916209, -1.48748, 0, 0, 0, 1, 1,
-2.253072, 1.119598, 0.06083246, 0, 0, 0, 1, 1,
-2.238522, 0.1324351, -1.77935, 1, 1, 1, 1, 1,
-2.222778, 0.6054731, -0.4765985, 1, 1, 1, 1, 1,
-2.217542, 1.290029, -1.422111, 1, 1, 1, 1, 1,
-2.216196, 1.125286, 0.2254554, 1, 1, 1, 1, 1,
-2.142415, 0.174844, -0.05855855, 1, 1, 1, 1, 1,
-2.141982, -0.3592833, -3.36286, 1, 1, 1, 1, 1,
-2.134118, -0.7454277, -2.034728, 1, 1, 1, 1, 1,
-2.128297, -2.419825, -3.68302, 1, 1, 1, 1, 1,
-2.102723, -1.001661, -2.28662, 1, 1, 1, 1, 1,
-2.080369, 0.5746742, -1.342507, 1, 1, 1, 1, 1,
-2.060338, -1.448534, -1.357257, 1, 1, 1, 1, 1,
-2.030039, -0.9838797, -2.821354, 1, 1, 1, 1, 1,
-2.024697, 0.05372291, -1.873338, 1, 1, 1, 1, 1,
-2.023997, 0.2303788, -1.800409, 1, 1, 1, 1, 1,
-2.021498, -0.6405914, -3.041859, 1, 1, 1, 1, 1,
-2.010575, 1.676348, -1.370363, 0, 0, 1, 1, 1,
-2.006366, 0.2928921, -0.5483038, 1, 0, 0, 1, 1,
-2.00473, -0.9189531, -1.978445, 1, 0, 0, 1, 1,
-1.990408, 0.004303983, -2.759219, 1, 0, 0, 1, 1,
-1.984296, 0.8825298, -1.106904, 1, 0, 0, 1, 1,
-1.969595, -0.4906133, -0.687319, 1, 0, 0, 1, 1,
-1.968673, 0.2785224, -0.9247143, 0, 0, 0, 1, 1,
-1.951011, 1.637146, 1.10958, 0, 0, 0, 1, 1,
-1.950117, -0.5822372, -2.703717, 0, 0, 0, 1, 1,
-1.947934, -1.647495, -1.766744, 0, 0, 0, 1, 1,
-1.942914, 0.06903505, -0.8355156, 0, 0, 0, 1, 1,
-1.928591, -0.2490265, -1.195042, 0, 0, 0, 1, 1,
-1.907491, 0.2214962, -0.02341573, 0, 0, 0, 1, 1,
-1.890078, 0.3824381, -1.871671, 1, 1, 1, 1, 1,
-1.875148, -0.7185006, -3.356857, 1, 1, 1, 1, 1,
-1.842662, -0.3594961, -3.306376, 1, 1, 1, 1, 1,
-1.835904, -0.1084452, -1.145597, 1, 1, 1, 1, 1,
-1.835828, -0.4320581, -1.658234, 1, 1, 1, 1, 1,
-1.827132, -0.4414713, -1.715494, 1, 1, 1, 1, 1,
-1.810958, 0.8641382, -3.604709, 1, 1, 1, 1, 1,
-1.797109, 0.3876564, -1.944874, 1, 1, 1, 1, 1,
-1.775646, 1.296327, 0.384989, 1, 1, 1, 1, 1,
-1.774691, -0.4381213, 0.02945202, 1, 1, 1, 1, 1,
-1.759103, -0.7668307, -2.359558, 1, 1, 1, 1, 1,
-1.751449, -1.48077, -2.38431, 1, 1, 1, 1, 1,
-1.72904, -0.06771775, -1.055345, 1, 1, 1, 1, 1,
-1.7255, 1.806022, 1.238056, 1, 1, 1, 1, 1,
-1.719467, -1.435227, -1.566105, 1, 1, 1, 1, 1,
-1.703827, -0.1896344, -2.97689, 0, 0, 1, 1, 1,
-1.694813, -0.240887, 0.5950363, 1, 0, 0, 1, 1,
-1.692224, 0.2842221, 0.7223169, 1, 0, 0, 1, 1,
-1.689109, 0.4058973, -2.929415, 1, 0, 0, 1, 1,
-1.679548, 1.495974, -0.9165282, 1, 0, 0, 1, 1,
-1.675197, 0.2974755, -3.498569, 1, 0, 0, 1, 1,
-1.667988, 0.1368012, -1.063286, 0, 0, 0, 1, 1,
-1.661202, -1.013888, -2.506356, 0, 0, 0, 1, 1,
-1.652886, 1.399946, -1.482381, 0, 0, 0, 1, 1,
-1.634557, -2.09087, -2.882927, 0, 0, 0, 1, 1,
-1.604151, 1.193744, -0.3352838, 0, 0, 0, 1, 1,
-1.600926, -1.105816, -1.529725, 0, 0, 0, 1, 1,
-1.57236, 0.5511905, -2.580257, 0, 0, 0, 1, 1,
-1.559312, 0.5245519, -0.0305825, 1, 1, 1, 1, 1,
-1.54467, 1.675921, 0.3778262, 1, 1, 1, 1, 1,
-1.540206, -1.976484, -1.991203, 1, 1, 1, 1, 1,
-1.539516, -1.410322, -2.698155, 1, 1, 1, 1, 1,
-1.52093, 0.3893, -1.270473, 1, 1, 1, 1, 1,
-1.516351, 0.5815576, -1.483875, 1, 1, 1, 1, 1,
-1.513177, -0.08338434, -0.2738371, 1, 1, 1, 1, 1,
-1.491741, 1.321881, -2.117357, 1, 1, 1, 1, 1,
-1.489701, -0.4319858, -1.648773, 1, 1, 1, 1, 1,
-1.487721, 1.562815, -0.2565054, 1, 1, 1, 1, 1,
-1.486442, -0.5172911, -1.027062, 1, 1, 1, 1, 1,
-1.458937, 0.3414383, -1.09252, 1, 1, 1, 1, 1,
-1.445198, 0.339803, -2.065825, 1, 1, 1, 1, 1,
-1.442981, -1.945947, -3.548116, 1, 1, 1, 1, 1,
-1.442385, -1.003742, -1.91567, 1, 1, 1, 1, 1,
-1.430094, -1.082506, -1.930082, 0, 0, 1, 1, 1,
-1.4299, 0.6433706, -1.283065, 1, 0, 0, 1, 1,
-1.427627, 0.3202874, -0.7582338, 1, 0, 0, 1, 1,
-1.418654, 0.8300982, -1.09987, 1, 0, 0, 1, 1,
-1.415721, 0.4491335, -2.649471, 1, 0, 0, 1, 1,
-1.410148, -0.3858781, -2.270223, 1, 0, 0, 1, 1,
-1.401188, 0.8081591, -2.362261, 0, 0, 0, 1, 1,
-1.394591, -0.3857141, -0.5447246, 0, 0, 0, 1, 1,
-1.392452, -1.257474, -3.520549, 0, 0, 0, 1, 1,
-1.386995, -0.04198999, -2.466351, 0, 0, 0, 1, 1,
-1.384691, -0.9513875, -3.932647, 0, 0, 0, 1, 1,
-1.377811, 0.4352234, -2.17169, 0, 0, 0, 1, 1,
-1.359126, 0.1976144, -0.5115295, 0, 0, 0, 1, 1,
-1.347807, -0.2709804, 0.3758485, 1, 1, 1, 1, 1,
-1.347162, -1.005054, -3.147128, 1, 1, 1, 1, 1,
-1.34705, 0.5409195, -0.6973032, 1, 1, 1, 1, 1,
-1.345929, -0.3213187, -0.7536008, 1, 1, 1, 1, 1,
-1.334314, 1.575251, -1.077234, 1, 1, 1, 1, 1,
-1.327405, -0.4725464, -1.274733, 1, 1, 1, 1, 1,
-1.312992, 1.288815, -0.654795, 1, 1, 1, 1, 1,
-1.308506, -0.1074642, -1.886387, 1, 1, 1, 1, 1,
-1.298247, 0.5584125, -1.359751, 1, 1, 1, 1, 1,
-1.294782, -0.4453677, -0.8647941, 1, 1, 1, 1, 1,
-1.292925, 0.7299368, -1.936999, 1, 1, 1, 1, 1,
-1.2877, -0.5993409, -2.79537, 1, 1, 1, 1, 1,
-1.276256, 0.9221015, -1.879459, 1, 1, 1, 1, 1,
-1.269732, -1.499945, -2.498059, 1, 1, 1, 1, 1,
-1.263321, 0.6257166, -0.8531395, 1, 1, 1, 1, 1,
-1.26206, 0.5001726, -0.4492666, 0, 0, 1, 1, 1,
-1.259102, -0.09119541, -2.417485, 1, 0, 0, 1, 1,
-1.256109, 0.7427538, -0.7372661, 1, 0, 0, 1, 1,
-1.252505, -0.2628263, -2.469018, 1, 0, 0, 1, 1,
-1.249127, 0.0899612, -1.337335, 1, 0, 0, 1, 1,
-1.246247, -1.394489, -2.307292, 1, 0, 0, 1, 1,
-1.24539, -1.189684, -3.313505, 0, 0, 0, 1, 1,
-1.241921, -0.1387813, -0.8031511, 0, 0, 0, 1, 1,
-1.234593, -0.3871354, -1.572291, 0, 0, 0, 1, 1,
-1.232517, -0.5719411, -2.447019, 0, 0, 0, 1, 1,
-1.225326, 0.1829473, -1.295712, 0, 0, 0, 1, 1,
-1.224775, 0.1702714, -0.937053, 0, 0, 0, 1, 1,
-1.222331, -1.677938, -2.226896, 0, 0, 0, 1, 1,
-1.216794, 0.2041102, 0.1691176, 1, 1, 1, 1, 1,
-1.216201, 1.30548, -1.178581, 1, 1, 1, 1, 1,
-1.214501, -0.6141969, -3.102461, 1, 1, 1, 1, 1,
-1.214251, 0.4055789, -0.2035066, 1, 1, 1, 1, 1,
-1.212661, -0.1702482, -0.08276311, 1, 1, 1, 1, 1,
-1.212532, -0.9823195, -1.477256, 1, 1, 1, 1, 1,
-1.206893, -1.245392, -0.2356647, 1, 1, 1, 1, 1,
-1.204947, -0.8990594, -0.7699501, 1, 1, 1, 1, 1,
-1.19302, 0.1531638, -1.35912, 1, 1, 1, 1, 1,
-1.192858, 0.2904046, -1.470345, 1, 1, 1, 1, 1,
-1.190091, -0.4628481, -2.130107, 1, 1, 1, 1, 1,
-1.180202, -0.2479576, -1.638875, 1, 1, 1, 1, 1,
-1.174672, 0.339761, -2.079944, 1, 1, 1, 1, 1,
-1.173327, -0.004150026, -0.7684597, 1, 1, 1, 1, 1,
-1.161027, 0.3532277, -1.872808, 1, 1, 1, 1, 1,
-1.156962, 0.8447836, -0.9125853, 0, 0, 1, 1, 1,
-1.154068, -0.349839, -1.310559, 1, 0, 0, 1, 1,
-1.147705, -0.9992489, -2.476741, 1, 0, 0, 1, 1,
-1.143271, -1.681857, -1.030781, 1, 0, 0, 1, 1,
-1.141789, 0.6780537, -1.262788, 1, 0, 0, 1, 1,
-1.141315, 0.5009329, -0.1853291, 1, 0, 0, 1, 1,
-1.13523, -1.288312, -3.125422, 0, 0, 0, 1, 1,
-1.132413, -0.5885941, -2.530793, 0, 0, 0, 1, 1,
-1.131224, -0.4435547, -1.793342, 0, 0, 0, 1, 1,
-1.126781, 0.04718736, 0.6917749, 0, 0, 0, 1, 1,
-1.121904, 0.2635738, -1.373331, 0, 0, 0, 1, 1,
-1.10764, -1.048665, -4.624079, 0, 0, 0, 1, 1,
-1.104005, 0.8731371, 0.07075101, 0, 0, 0, 1, 1,
-1.103452, 0.235266, -0.2815295, 1, 1, 1, 1, 1,
-1.102436, -2.093942, -2.240175, 1, 1, 1, 1, 1,
-1.099469, 0.9289417, -1.387139, 1, 1, 1, 1, 1,
-1.095713, 0.01428715, -2.31028, 1, 1, 1, 1, 1,
-1.095431, -0.7776722, -2.81338, 1, 1, 1, 1, 1,
-1.08588, -0.06799551, -0.4387912, 1, 1, 1, 1, 1,
-1.085604, -0.3731759, -1.47867, 1, 1, 1, 1, 1,
-1.076629, -0.1955609, -1.344091, 1, 1, 1, 1, 1,
-1.063914, 0.2641744, -0.9217422, 1, 1, 1, 1, 1,
-1.062983, -0.5889205, -3.090324, 1, 1, 1, 1, 1,
-1.057703, 0.083756, -0.5700367, 1, 1, 1, 1, 1,
-1.054954, -0.19691, -2.307165, 1, 1, 1, 1, 1,
-1.049737, 0.5514331, -1.276412, 1, 1, 1, 1, 1,
-1.047745, -1.617494, -2.441315, 1, 1, 1, 1, 1,
-1.037638, 0.03817947, -2.035701, 1, 1, 1, 1, 1,
-1.035556, 2.135695, -0.5734276, 0, 0, 1, 1, 1,
-1.023504, 1.918956, -1.672276, 1, 0, 0, 1, 1,
-1.007642, 1.120584, -2.31958, 1, 0, 0, 1, 1,
-1.003484, -1.799071, -3.335924, 1, 0, 0, 1, 1,
-0.9932076, 1.677503, -1.524462, 1, 0, 0, 1, 1,
-0.9914373, -2.28449, -1.95719, 1, 0, 0, 1, 1,
-0.9906046, -0.2257146, -1.139877, 0, 0, 0, 1, 1,
-0.985225, -2.223531, -2.341526, 0, 0, 0, 1, 1,
-0.9809778, -0.583663, -1.984046, 0, 0, 0, 1, 1,
-0.9733948, -0.07535331, -1.337447, 0, 0, 0, 1, 1,
-0.9686364, -0.2306568, -1.378333, 0, 0, 0, 1, 1,
-0.9660082, 0.3153559, -0.7669233, 0, 0, 0, 1, 1,
-0.9653446, 1.843233, -1.099399, 0, 0, 0, 1, 1,
-0.9652898, 0.2749729, -3.141267, 1, 1, 1, 1, 1,
-0.9630722, -0.1020934, -2.23101, 1, 1, 1, 1, 1,
-0.9489202, -0.1426352, -1.933259, 1, 1, 1, 1, 1,
-0.9427856, 0.3568534, -1.858429, 1, 1, 1, 1, 1,
-0.9321831, 0.8985158, -1.525232, 1, 1, 1, 1, 1,
-0.9316862, -0.2304943, -1.992186, 1, 1, 1, 1, 1,
-0.9213948, -1.167886, -1.602756, 1, 1, 1, 1, 1,
-0.9041467, 0.04638944, -1.802692, 1, 1, 1, 1, 1,
-0.9040604, -0.2801938, -1.372795, 1, 1, 1, 1, 1,
-0.9026248, -0.7192205, -2.168025, 1, 1, 1, 1, 1,
-0.8917471, 0.4735656, -1.332522, 1, 1, 1, 1, 1,
-0.8917193, -0.6329636, -2.83837, 1, 1, 1, 1, 1,
-0.8907227, -1.666838, -3.551555, 1, 1, 1, 1, 1,
-0.8864985, -1.263637, -3.630703, 1, 1, 1, 1, 1,
-0.8827505, -2.808066, -1.588023, 1, 1, 1, 1, 1,
-0.8816064, 0.6518797, 0.2113194, 0, 0, 1, 1, 1,
-0.8757674, -0.1712263, -1.074895, 1, 0, 0, 1, 1,
-0.8737, -0.1479726, -1.926586, 1, 0, 0, 1, 1,
-0.8712311, -1.219847, -3.641377, 1, 0, 0, 1, 1,
-0.8707168, -0.9494387, -1.737475, 1, 0, 0, 1, 1,
-0.869396, -0.06969957, -0.4311744, 1, 0, 0, 1, 1,
-0.8615032, -1.594697, -2.903054, 0, 0, 0, 1, 1,
-0.8611779, -0.05567837, -1.050451, 0, 0, 0, 1, 1,
-0.8423458, 0.53633, -0.9067556, 0, 0, 0, 1, 1,
-0.8413778, 0.4096178, -0.4626268, 0, 0, 0, 1, 1,
-0.8405014, -0.3855851, -1.83495, 0, 0, 0, 1, 1,
-0.8358657, -0.5351963, -2.437069, 0, 0, 0, 1, 1,
-0.8339099, -0.2733064, -1.804688, 0, 0, 0, 1, 1,
-0.8241238, -0.6622488, -2.180593, 1, 1, 1, 1, 1,
-0.815544, 0.4195485, -0.9330352, 1, 1, 1, 1, 1,
-0.8154329, -0.3535118, -1.187213, 1, 1, 1, 1, 1,
-0.8136892, 1.766415, -0.4774365, 1, 1, 1, 1, 1,
-0.8092337, -0.4737647, -3.00206, 1, 1, 1, 1, 1,
-0.8050795, -0.2210595, 0.8113019, 1, 1, 1, 1, 1,
-0.7964592, 1.069384, -0.2465716, 1, 1, 1, 1, 1,
-0.7956228, -1.326666, -2.198775, 1, 1, 1, 1, 1,
-0.7956023, 2.76681, -0.6348247, 1, 1, 1, 1, 1,
-0.7923895, -1.233766, -0.5463492, 1, 1, 1, 1, 1,
-0.7880903, 0.2057002, -2.573811, 1, 1, 1, 1, 1,
-0.785891, 1.653937, -0.07168811, 1, 1, 1, 1, 1,
-0.7851743, 0.5651815, -0.6090068, 1, 1, 1, 1, 1,
-0.7830498, -1.371558, -2.908937, 1, 1, 1, 1, 1,
-0.7820606, 0.09219701, -3.126093, 1, 1, 1, 1, 1,
-0.7749444, -0.8812276, -4.166367, 0, 0, 1, 1, 1,
-0.7719997, 1.385599, -0.6510959, 1, 0, 0, 1, 1,
-0.7695333, -1.347639, -1.911514, 1, 0, 0, 1, 1,
-0.7685757, -1.300338, -3.650896, 1, 0, 0, 1, 1,
-0.7681534, 2.64836, -0.2946975, 1, 0, 0, 1, 1,
-0.7597235, 0.07359891, -2.223834, 1, 0, 0, 1, 1,
-0.7583546, 1.517233, -3.461993, 0, 0, 0, 1, 1,
-0.7582898, 0.9296811, -0.9428196, 0, 0, 0, 1, 1,
-0.7533531, 0.4012755, -2.332453, 0, 0, 0, 1, 1,
-0.7510707, -0.4242564, -2.209383, 0, 0, 0, 1, 1,
-0.7465554, -1.232963, -2.227621, 0, 0, 0, 1, 1,
-0.7416796, -0.5723155, -3.071923, 0, 0, 0, 1, 1,
-0.7410184, -0.03382178, -1.433997, 0, 0, 0, 1, 1,
-0.7372801, -0.3029548, -2.306512, 1, 1, 1, 1, 1,
-0.7368963, -0.8260419, -3.138157, 1, 1, 1, 1, 1,
-0.7363064, -0.3165985, -2.438614, 1, 1, 1, 1, 1,
-0.7331508, -0.03746892, -1.615451, 1, 1, 1, 1, 1,
-0.7276543, -1.244362, -1.587843, 1, 1, 1, 1, 1,
-0.7267147, -0.02394927, -2.781492, 1, 1, 1, 1, 1,
-0.7260721, 1.067412, 0.01774608, 1, 1, 1, 1, 1,
-0.7228881, -1.8669, -2.907464, 1, 1, 1, 1, 1,
-0.7227823, -0.6979166, -1.673729, 1, 1, 1, 1, 1,
-0.7217162, 1.564218, -0.5748378, 1, 1, 1, 1, 1,
-0.7204965, 2.007085, -0.007289221, 1, 1, 1, 1, 1,
-0.7188527, -0.4777558, -3.56351, 1, 1, 1, 1, 1,
-0.71828, -1.107543, -2.612227, 1, 1, 1, 1, 1,
-0.7157493, 0.1869297, -1.72381, 1, 1, 1, 1, 1,
-0.7081426, -0.1753688, -3.087651, 1, 1, 1, 1, 1,
-0.7004977, -0.5038832, -3.269313, 0, 0, 1, 1, 1,
-0.6979008, 0.7071747, -1.401207, 1, 0, 0, 1, 1,
-0.6957679, 0.04930912, -1.238826, 1, 0, 0, 1, 1,
-0.6882842, 1.027278, -1.041203, 1, 0, 0, 1, 1,
-0.6848277, -1.384451, -1.734279, 1, 0, 0, 1, 1,
-0.6829549, 0.3758462, -1.651473, 1, 0, 0, 1, 1,
-0.675788, -0.1888346, -2.21464, 0, 0, 0, 1, 1,
-0.6741916, 1.025095, -0.5598021, 0, 0, 0, 1, 1,
-0.6720783, 1.278536, -1.170872, 0, 0, 0, 1, 1,
-0.6662884, -0.2260602, -3.735965, 0, 0, 0, 1, 1,
-0.6646424, -0.672304, -1.624461, 0, 0, 0, 1, 1,
-0.6625701, -0.6441629, -2.626856, 0, 0, 0, 1, 1,
-0.6557351, 0.01858234, -0.3711481, 0, 0, 0, 1, 1,
-0.6554627, 0.4086101, -0.6163498, 1, 1, 1, 1, 1,
-0.6491077, -0.614718, -2.805411, 1, 1, 1, 1, 1,
-0.6390609, -0.5407261, -3.900954, 1, 1, 1, 1, 1,
-0.6370621, -2.760545, -3.821107, 1, 1, 1, 1, 1,
-0.6370549, -0.629402, -2.557744, 1, 1, 1, 1, 1,
-0.6341282, -1.104747, -2.701474, 1, 1, 1, 1, 1,
-0.6332356, 0.1109813, -3.081276, 1, 1, 1, 1, 1,
-0.6284018, 1.02661, 1.096052, 1, 1, 1, 1, 1,
-0.6274987, -1.268118, -2.363754, 1, 1, 1, 1, 1,
-0.6273755, -0.7174159, -3.519186, 1, 1, 1, 1, 1,
-0.6265035, -0.1229235, -2.411779, 1, 1, 1, 1, 1,
-0.6233976, 0.07981744, 0.5739708, 1, 1, 1, 1, 1,
-0.622734, 1.661259, -0.330133, 1, 1, 1, 1, 1,
-0.6155064, 0.8693007, 0.3247801, 1, 1, 1, 1, 1,
-0.6066194, 0.2716182, -1.864799, 1, 1, 1, 1, 1,
-0.603869, -0.3892487, -1.761473, 0, 0, 1, 1, 1,
-0.6028864, 1.11892, 0.1667195, 1, 0, 0, 1, 1,
-0.5977234, 0.7417046, 1.502185, 1, 0, 0, 1, 1,
-0.5933048, 1.627809, -1.041294, 1, 0, 0, 1, 1,
-0.5924489, -1.056105, -1.707179, 1, 0, 0, 1, 1,
-0.5862219, 1.324914, 0.6458012, 1, 0, 0, 1, 1,
-0.5813805, -0.2700007, -2.02651, 0, 0, 0, 1, 1,
-0.5809916, -0.5467476, -2.026873, 0, 0, 0, 1, 1,
-0.5805289, -0.1181379, -2.341688, 0, 0, 0, 1, 1,
-0.5801483, 0.979982, -0.2514477, 0, 0, 0, 1, 1,
-0.5793667, 0.3561316, -1.401713, 0, 0, 0, 1, 1,
-0.578043, 0.6779651, 1.263826, 0, 0, 0, 1, 1,
-0.576747, 0.2045589, -0.3064207, 0, 0, 0, 1, 1,
-0.5757253, 0.004121873, -1.500816, 1, 1, 1, 1, 1,
-0.5742189, 2.142368, -0.1406727, 1, 1, 1, 1, 1,
-0.5692418, 0.5255569, -1.029766, 1, 1, 1, 1, 1,
-0.5683304, 0.1249246, -1.234279, 1, 1, 1, 1, 1,
-0.5668957, 0.3319803, 0.5577827, 1, 1, 1, 1, 1,
-0.5652342, 0.3310942, -1.184922, 1, 1, 1, 1, 1,
-0.5650461, -0.9410938, -3.331321, 1, 1, 1, 1, 1,
-0.5520139, 0.06860158, -2.01943, 1, 1, 1, 1, 1,
-0.5519747, 0.4143273, -0.5493678, 1, 1, 1, 1, 1,
-0.5504823, -0.2359166, -2.971627, 1, 1, 1, 1, 1,
-0.5490422, -1.157015, -3.225102, 1, 1, 1, 1, 1,
-0.5479708, 0.9417844, -0.1151113, 1, 1, 1, 1, 1,
-0.5465745, 0.6396457, -2.256734, 1, 1, 1, 1, 1,
-0.5458716, -0.2284349, -1.900351, 1, 1, 1, 1, 1,
-0.5448731, 0.9621574, 0.03499443, 1, 1, 1, 1, 1,
-0.5179674, 1.214208, -2.205153, 0, 0, 1, 1, 1,
-0.5081034, -0.3012979, -2.284335, 1, 0, 0, 1, 1,
-0.5030138, 0.7947522, -0.8026283, 1, 0, 0, 1, 1,
-0.5001144, -0.298647, -1.900232, 1, 0, 0, 1, 1,
-0.4988374, -0.2833798, -1.369944, 1, 0, 0, 1, 1,
-0.4956564, -1.33301, -3.567462, 1, 0, 0, 1, 1,
-0.4944923, -0.5153221, -2.313369, 0, 0, 0, 1, 1,
-0.4939373, -0.1320995, -1.823819, 0, 0, 0, 1, 1,
-0.4935409, 0.4876692, -0.9197419, 0, 0, 0, 1, 1,
-0.4932377, 0.892773, -0.7505784, 0, 0, 0, 1, 1,
-0.492174, 0.01102506, -1.898494, 0, 0, 0, 1, 1,
-0.4915824, -0.7270366, 0.2006773, 0, 0, 0, 1, 1,
-0.4899665, -1.830523, -4.717867, 0, 0, 0, 1, 1,
-0.4891208, 1.338444, -0.3381161, 1, 1, 1, 1, 1,
-0.4868699, 0.4674207, -1.127979, 1, 1, 1, 1, 1,
-0.4846987, -0.7165605, -5.041376, 1, 1, 1, 1, 1,
-0.480867, 1.248285, -2.10173, 1, 1, 1, 1, 1,
-0.4782236, -0.5892152, -0.6729787, 1, 1, 1, 1, 1,
-0.4753789, -0.71435, -2.042886, 1, 1, 1, 1, 1,
-0.4664817, -0.5195108, -2.753393, 1, 1, 1, 1, 1,
-0.4646606, 1.083168, -0.7921384, 1, 1, 1, 1, 1,
-0.4589306, -0.08204292, -1.285933, 1, 1, 1, 1, 1,
-0.4586464, -0.554176, -1.669178, 1, 1, 1, 1, 1,
-0.4580757, 0.5088928, 0.484831, 1, 1, 1, 1, 1,
-0.4572031, 0.6631944, -1.696985, 1, 1, 1, 1, 1,
-0.4485472, -0.9869459, -3.13121, 1, 1, 1, 1, 1,
-0.4431013, -0.7661497, -2.637197, 1, 1, 1, 1, 1,
-0.4419808, -0.9761062, -3.122247, 1, 1, 1, 1, 1,
-0.4410947, -0.2642648, -2.617903, 0, 0, 1, 1, 1,
-0.4404478, 1.100497, 0.3803906, 1, 0, 0, 1, 1,
-0.4392697, 2.490234, -0.2624634, 1, 0, 0, 1, 1,
-0.4373249, -0.7803579, -3.206198, 1, 0, 0, 1, 1,
-0.4353084, 0.8922611, -0.8513644, 1, 0, 0, 1, 1,
-0.434954, -1.144929, -3.815593, 1, 0, 0, 1, 1,
-0.4346766, -1.556629, -5.359138, 0, 0, 0, 1, 1,
-0.4292194, -0.6872616, -2.957324, 0, 0, 0, 1, 1,
-0.4224943, 1.614471, -0.08689272, 0, 0, 0, 1, 1,
-0.4174904, 0.6179579, -1.762366, 0, 0, 0, 1, 1,
-0.4161204, -0.7278042, -4.114863, 0, 0, 0, 1, 1,
-0.4124107, 0.07927666, -1.970876, 0, 0, 0, 1, 1,
-0.4107142, -0.3548948, -1.64993, 0, 0, 0, 1, 1,
-0.4072717, -0.9579518, -2.175561, 1, 1, 1, 1, 1,
-0.4029285, 1.559084, 0.1276471, 1, 1, 1, 1, 1,
-0.3973345, 1.628776, -0.01826756, 1, 1, 1, 1, 1,
-0.3952968, -0.5058561, -4.514034, 1, 1, 1, 1, 1,
-0.3879713, 0.5386018, -0.1019671, 1, 1, 1, 1, 1,
-0.3879247, 0.9131823, -2.498836, 1, 1, 1, 1, 1,
-0.3867811, -0.4862458, -3.743605, 1, 1, 1, 1, 1,
-0.3827493, -0.2566961, -2.477539, 1, 1, 1, 1, 1,
-0.3728787, 0.3344508, -0.994027, 1, 1, 1, 1, 1,
-0.3727296, -0.6475269, -2.77575, 1, 1, 1, 1, 1,
-0.3698913, -0.9069926, -1.317586, 1, 1, 1, 1, 1,
-0.363227, 1.758591, 0.4904988, 1, 1, 1, 1, 1,
-0.3610699, -0.7395788, -2.973105, 1, 1, 1, 1, 1,
-0.3604591, 0.0753239, -1.325954, 1, 1, 1, 1, 1,
-0.3582726, 0.1202946, -0.1514215, 1, 1, 1, 1, 1,
-0.3577964, 1.133388, -0.1793992, 0, 0, 1, 1, 1,
-0.3575687, -0.8228755, -0.9635175, 1, 0, 0, 1, 1,
-0.3562784, 0.08521643, -1.859568, 1, 0, 0, 1, 1,
-0.3533634, 1.221429, 0.5071173, 1, 0, 0, 1, 1,
-0.3449372, -1.478599, -3.429561, 1, 0, 0, 1, 1,
-0.3421465, 0.7729449, -0.9169827, 1, 0, 0, 1, 1,
-0.3405507, 0.5651144, -1.171167, 0, 0, 0, 1, 1,
-0.3391569, 1.164145, -0.2722777, 0, 0, 0, 1, 1,
-0.3372138, -1.794607, -3.506427, 0, 0, 0, 1, 1,
-0.3349942, 1.933478, -1.393758, 0, 0, 0, 1, 1,
-0.334988, 0.88221, -2.056639, 0, 0, 0, 1, 1,
-0.333602, 0.387567, 0.1066848, 0, 0, 0, 1, 1,
-0.3287301, -1.408032, -1.272658, 0, 0, 0, 1, 1,
-0.3204227, 0.0844469, -1.704958, 1, 1, 1, 1, 1,
-0.3189023, -0.6512017, -2.972045, 1, 1, 1, 1, 1,
-0.3074673, -1.657675, -3.340587, 1, 1, 1, 1, 1,
-0.3064903, 0.9394799, 0.1434249, 1, 1, 1, 1, 1,
-0.3054259, -1.008962, -2.125442, 1, 1, 1, 1, 1,
-0.3050193, 1.020588, -0.3882408, 1, 1, 1, 1, 1,
-0.2994679, 1.326235, -0.07853755, 1, 1, 1, 1, 1,
-0.2982103, 0.009716433, 0.3500017, 1, 1, 1, 1, 1,
-0.2937349, 0.08097791, -2.695964, 1, 1, 1, 1, 1,
-0.2870393, 0.2569633, -1.031093, 1, 1, 1, 1, 1,
-0.2799071, -0.5238568, -3.111098, 1, 1, 1, 1, 1,
-0.2785353, 1.339192, 1.551103, 1, 1, 1, 1, 1,
-0.2738631, 0.7503929, -0.7059267, 1, 1, 1, 1, 1,
-0.272865, 0.5256262, -2.755844, 1, 1, 1, 1, 1,
-0.2710838, 0.6184127, -0.01755506, 1, 1, 1, 1, 1,
-0.270266, 0.1735454, -3.036599, 0, 0, 1, 1, 1,
-0.2690372, 1.806365, -1.343683, 1, 0, 0, 1, 1,
-0.2684635, -0.5386316, -3.81545, 1, 0, 0, 1, 1,
-0.2647513, 0.3976626, -0.245777, 1, 0, 0, 1, 1,
-0.2633982, 0.09656224, -2.251959, 1, 0, 0, 1, 1,
-0.2621195, -2.349355, -3.363147, 1, 0, 0, 1, 1,
-0.2559972, -0.8589949, -2.445579, 0, 0, 0, 1, 1,
-0.2504446, -0.7824621, -2.400374, 0, 0, 0, 1, 1,
-0.2486725, -0.5962844, -2.12785, 0, 0, 0, 1, 1,
-0.247651, 0.3876668, 0.6781422, 0, 0, 0, 1, 1,
-0.2474534, 0.4999853, -1.543583, 0, 0, 0, 1, 1,
-0.2458303, 0.5007105, -1.050823, 0, 0, 0, 1, 1,
-0.2445253, -0.5263867, -1.826236, 0, 0, 0, 1, 1,
-0.242715, 1.697805, 0.3225553, 1, 1, 1, 1, 1,
-0.2319963, 0.5374018, -1.765164, 1, 1, 1, 1, 1,
-0.2291705, 0.7437118, -1.915184, 1, 1, 1, 1, 1,
-0.2272965, 0.6080087, -0.4047686, 1, 1, 1, 1, 1,
-0.2229305, -2.451065, -2.665109, 1, 1, 1, 1, 1,
-0.2218949, -0.6496744, -1.559649, 1, 1, 1, 1, 1,
-0.2199989, 1.096038, -0.06524811, 1, 1, 1, 1, 1,
-0.2198123, -1.501017, -2.159755, 1, 1, 1, 1, 1,
-0.2185869, -1.030804, -1.773436, 1, 1, 1, 1, 1,
-0.2161492, -0.4093606, -3.807164, 1, 1, 1, 1, 1,
-0.2140224, -1.387935, -4.197032, 1, 1, 1, 1, 1,
-0.2137952, 0.5433194, -2.180561, 1, 1, 1, 1, 1,
-0.2111087, 2.048156, -0.5943455, 1, 1, 1, 1, 1,
-0.2031578, 0.6710775, 0.3213805, 1, 1, 1, 1, 1,
-0.2020375, 0.5031916, -0.3122428, 1, 1, 1, 1, 1,
-0.1999971, 1.705382, -2.430208, 0, 0, 1, 1, 1,
-0.1968074, -0.6696794, -1.872767, 1, 0, 0, 1, 1,
-0.1946073, -0.1498655, -2.440175, 1, 0, 0, 1, 1,
-0.1903272, -0.3484533, -2.806995, 1, 0, 0, 1, 1,
-0.1891366, -0.09428166, -1.347687, 1, 0, 0, 1, 1,
-0.188141, -1.264153, -2.704075, 1, 0, 0, 1, 1,
-0.1881278, -0.9327287, -2.630049, 0, 0, 0, 1, 1,
-0.1874899, 0.09227155, -0.2723672, 0, 0, 0, 1, 1,
-0.1871382, 1.44147, 1.148862, 0, 0, 0, 1, 1,
-0.1852227, 0.08452909, -2.934028, 0, 0, 0, 1, 1,
-0.1816495, -0.8709934, -0.4948168, 0, 0, 0, 1, 1,
-0.1781942, 0.9470912, 1.834696, 0, 0, 0, 1, 1,
-0.1765038, 1.039305, 2.074086, 0, 0, 0, 1, 1,
-0.1731462, 1.510585, 0.2979591, 1, 1, 1, 1, 1,
-0.1704261, 0.03003691, -0.2714421, 1, 1, 1, 1, 1,
-0.1687288, -0.084953, -2.221061, 1, 1, 1, 1, 1,
-0.1661527, 1.533572, -0.4691683, 1, 1, 1, 1, 1,
-0.1656659, 0.1980869, -1.648906, 1, 1, 1, 1, 1,
-0.1626523, 0.5702372, 0.6300527, 1, 1, 1, 1, 1,
-0.1614478, -2.747033, -3.880926, 1, 1, 1, 1, 1,
-0.1614437, 0.1585703, -1.505568, 1, 1, 1, 1, 1,
-0.1603369, -0.1095064, -2.266244, 1, 1, 1, 1, 1,
-0.1584569, 0.5340677, 0.6416561, 1, 1, 1, 1, 1,
-0.1563372, 2.479593, -1.395447, 1, 1, 1, 1, 1,
-0.1563067, -1.054805, -1.235606, 1, 1, 1, 1, 1,
-0.1518472, 1.046559, 0.08203647, 1, 1, 1, 1, 1,
-0.1509426, 0.5239415, -0.3400989, 1, 1, 1, 1, 1,
-0.1496208, 0.7248809, -0.1825209, 1, 1, 1, 1, 1,
-0.1466387, -1.111698, -1.771124, 0, 0, 1, 1, 1,
-0.1464166, -0.4342953, -3.194562, 1, 0, 0, 1, 1,
-0.1462819, -0.09112243, -4.098033, 1, 0, 0, 1, 1,
-0.1462099, 0.5744576, 0.4732177, 1, 0, 0, 1, 1,
-0.1460343, -0.9574224, -2.585919, 1, 0, 0, 1, 1,
-0.1446776, 0.3609441, -0.2433874, 1, 0, 0, 1, 1,
-0.1419208, -0.39902, -2.488265, 0, 0, 0, 1, 1,
-0.1401604, 0.3326657, -0.6533477, 0, 0, 0, 1, 1,
-0.1397955, -0.2202145, -2.153452, 0, 0, 0, 1, 1,
-0.1341533, -0.5774511, -2.149888, 0, 0, 0, 1, 1,
-0.1332482, -0.2714694, -1.8205, 0, 0, 0, 1, 1,
-0.132661, 0.9552514, -0.3455831, 0, 0, 0, 1, 1,
-0.1294085, 0.686501, 1.350199, 0, 0, 0, 1, 1,
-0.1289603, 1.129541, 1.005997, 1, 1, 1, 1, 1,
-0.1281964, -0.9168752, -3.548325, 1, 1, 1, 1, 1,
-0.1249258, -0.3843333, -4.21249, 1, 1, 1, 1, 1,
-0.1246906, -0.7876224, -2.16912, 1, 1, 1, 1, 1,
-0.1157106, -0.2104502, -3.196604, 1, 1, 1, 1, 1,
-0.1150463, 2.586813, -0.9366114, 1, 1, 1, 1, 1,
-0.1147297, 1.861183, -0.3643966, 1, 1, 1, 1, 1,
-0.1113434, -0.9599726, -2.564724, 1, 1, 1, 1, 1,
-0.1064349, 1.204091, 0.5783579, 1, 1, 1, 1, 1,
-0.1057037, -1.123341, -2.953994, 1, 1, 1, 1, 1,
-0.1052633, 0.1138458, -2.348047, 1, 1, 1, 1, 1,
-0.09900536, -0.7530151, -1.987586, 1, 1, 1, 1, 1,
-0.09899447, 0.08293552, -1.776193, 1, 1, 1, 1, 1,
-0.09722486, -0.3372887, -2.599545, 1, 1, 1, 1, 1,
-0.09478834, 0.2204862, -0.02158664, 1, 1, 1, 1, 1,
-0.09468118, 0.7636818, -0.3767131, 0, 0, 1, 1, 1,
-0.0939588, 0.7378617, -1.576435, 1, 0, 0, 1, 1,
-0.08235372, 0.6857648, -1.313514, 1, 0, 0, 1, 1,
-0.08176424, -0.1605108, -0.9013929, 1, 0, 0, 1, 1,
-0.08013146, 1.03642, -0.8381488, 1, 0, 0, 1, 1,
-0.07218233, 0.3023576, -0.391234, 1, 0, 0, 1, 1,
-0.06621116, 1.813181, 0.9492074, 0, 0, 0, 1, 1,
-0.06328149, -1.436105, -3.396442, 0, 0, 0, 1, 1,
-0.06043611, 0.1739199, -0.7712243, 0, 0, 0, 1, 1,
-0.06029171, -1.627676, -3.746931, 0, 0, 0, 1, 1,
-0.05741994, 1.046781, 0.04859195, 0, 0, 0, 1, 1,
-0.05717291, -0.09626738, -2.721425, 0, 0, 0, 1, 1,
-0.05565425, -0.009318505, -3.179683, 0, 0, 0, 1, 1,
-0.05554266, 2.448555, -0.9042509, 1, 1, 1, 1, 1,
-0.05349185, 0.7076741, -0.05172483, 1, 1, 1, 1, 1,
-0.05148594, 1.711745, 1.29447, 1, 1, 1, 1, 1,
-0.04669315, 0.6006112, 1.529707, 1, 1, 1, 1, 1,
-0.04354692, 0.1715407, -1.594458, 1, 1, 1, 1, 1,
-0.03996515, -0.6413062, -3.164773, 1, 1, 1, 1, 1,
-0.03963569, 0.694862, -0.6621185, 1, 1, 1, 1, 1,
-0.03802279, 0.3589968, -0.2222051, 1, 1, 1, 1, 1,
-0.03552354, 0.269039, 1.722516, 1, 1, 1, 1, 1,
-0.02914601, 2.312558, -0.3698952, 1, 1, 1, 1, 1,
-0.02895159, 0.003115034, -0.9710312, 1, 1, 1, 1, 1,
-0.02819853, 1.427006, 0.06573357, 1, 1, 1, 1, 1,
-0.02640644, -0.9251071, -3.203849, 1, 1, 1, 1, 1,
-0.0250485, 0.6837144, 0.6973516, 1, 1, 1, 1, 1,
-0.02205858, -0.2144362, -4.561084, 1, 1, 1, 1, 1,
-0.01760132, -0.2076505, -1.990144, 0, 0, 1, 1, 1,
-0.0148188, 1.441882, -0.3466269, 1, 0, 0, 1, 1,
-0.01114212, -0.5441346, -2.554613, 1, 0, 0, 1, 1,
-0.001399903, -1.596486, -1.40577, 1, 0, 0, 1, 1,
0.0002932004, -1.181203, 3.709833, 1, 0, 0, 1, 1,
0.001250174, -0.3535183, 4.615516, 1, 0, 0, 1, 1,
0.00245733, 2.000104, -0.07680263, 0, 0, 0, 1, 1,
0.005105655, -0.02469242, 0.9752933, 0, 0, 0, 1, 1,
0.01542355, 0.9391744, -0.8771737, 0, 0, 0, 1, 1,
0.01560439, 1.090524, -0.7174029, 0, 0, 0, 1, 1,
0.01728391, 1.206825, 0.7841936, 0, 0, 0, 1, 1,
0.0198384, 0.01308195, 1.582808, 0, 0, 0, 1, 1,
0.02395, -0.7163031, 5.263439, 0, 0, 0, 1, 1,
0.0243172, -1.571102, 2.581924, 1, 1, 1, 1, 1,
0.02457589, -0.6775802, 4.006361, 1, 1, 1, 1, 1,
0.02694869, 0.1777229, 1.168001, 1, 1, 1, 1, 1,
0.02902177, -0.1951651, 1.290476, 1, 1, 1, 1, 1,
0.03202871, -0.9935011, 2.582554, 1, 1, 1, 1, 1,
0.03495838, 1.508745, -0.2655046, 1, 1, 1, 1, 1,
0.03768799, -0.3740708, 2.396415, 1, 1, 1, 1, 1,
0.0442945, 0.0687892, -0.1026604, 1, 1, 1, 1, 1,
0.04475035, -0.3043714, 4.455983, 1, 1, 1, 1, 1,
0.05219753, -1.215166, 2.522107, 1, 1, 1, 1, 1,
0.05324096, 1.065171, -0.2122419, 1, 1, 1, 1, 1,
0.05590444, 0.4309823, 0.3454434, 1, 1, 1, 1, 1,
0.05755412, -1.814087, 3.34998, 1, 1, 1, 1, 1,
0.05795778, 0.04554151, 0.1202818, 1, 1, 1, 1, 1,
0.06277958, -1.570269, 2.404352, 1, 1, 1, 1, 1,
0.06433082, 0.5941674, 0.96748, 0, 0, 1, 1, 1,
0.06508595, -1.458936, 3.77708, 1, 0, 0, 1, 1,
0.06650871, -0.4522813, 1.717491, 1, 0, 0, 1, 1,
0.06650914, -2.332316, 3.438342, 1, 0, 0, 1, 1,
0.0739774, -1.039868, 3.344517, 1, 0, 0, 1, 1,
0.07445365, 0.6554417, 0.5254439, 1, 0, 0, 1, 1,
0.07996359, -2.567771, 3.298827, 0, 0, 0, 1, 1,
0.08055144, 0.5293099, 0.2606245, 0, 0, 0, 1, 1,
0.08232842, -0.2688737, 3.357945, 0, 0, 0, 1, 1,
0.08298912, -0.3416432, 2.842794, 0, 0, 0, 1, 1,
0.08496892, 1.900799, 0.1427795, 0, 0, 0, 1, 1,
0.08605221, 0.6023875, 0.7116125, 0, 0, 0, 1, 1,
0.08605301, -1.937478, 2.14565, 0, 0, 0, 1, 1,
0.08647611, 1.253401, -0.8435097, 1, 1, 1, 1, 1,
0.08661207, 0.6985241, -0.5143075, 1, 1, 1, 1, 1,
0.0883804, 0.404636, -0.6390668, 1, 1, 1, 1, 1,
0.09097297, 0.9345295, -0.08217859, 1, 1, 1, 1, 1,
0.09438813, 0.3953273, 0.02435033, 1, 1, 1, 1, 1,
0.09540886, -0.8948668, 3.579333, 1, 1, 1, 1, 1,
0.0960061, -1.004295, 3.033467, 1, 1, 1, 1, 1,
0.1036869, 0.7459475, 0.4758928, 1, 1, 1, 1, 1,
0.110955, -1.62288, 4.671463, 1, 1, 1, 1, 1,
0.1112521, 0.9419678, -0.7749705, 1, 1, 1, 1, 1,
0.118229, 0.8807264, 0.9066141, 1, 1, 1, 1, 1,
0.1198333, 0.3650208, 0.1409334, 1, 1, 1, 1, 1,
0.1208488, -0.5400295, 2.101187, 1, 1, 1, 1, 1,
0.1228056, 0.3357357, -0.1850705, 1, 1, 1, 1, 1,
0.1230007, 0.845383, 0.8568125, 1, 1, 1, 1, 1,
0.1237703, -0.1394868, 3.516475, 0, 0, 1, 1, 1,
0.1260933, -0.4155388, 3.161959, 1, 0, 0, 1, 1,
0.1283016, -0.8645707, 2.84631, 1, 0, 0, 1, 1,
0.1295609, -0.5310643, 3.381928, 1, 0, 0, 1, 1,
0.1362009, 1.860875, 0.7790651, 1, 0, 0, 1, 1,
0.1365277, -0.4883189, 2.14694, 1, 0, 0, 1, 1,
0.1368545, 1.24312, 2.460264, 0, 0, 0, 1, 1,
0.1370871, 0.3995114, -0.8733734, 0, 0, 0, 1, 1,
0.1383856, -0.04356357, 3.07649, 0, 0, 0, 1, 1,
0.1399103, -1.718318, 3.66795, 0, 0, 0, 1, 1,
0.1399873, 1.567207, 0.1310106, 0, 0, 0, 1, 1,
0.1420458, -0.05229111, 1.017067, 0, 0, 0, 1, 1,
0.1446188, -0.1836657, 1.872286, 0, 0, 0, 1, 1,
0.1447244, 0.4364553, 0.1264389, 1, 1, 1, 1, 1,
0.1472304, 0.3707152, -0.4477185, 1, 1, 1, 1, 1,
0.1472462, 1.514581, -0.3599556, 1, 1, 1, 1, 1,
0.148859, -0.2574593, 1.922618, 1, 1, 1, 1, 1,
0.1503372, -0.0666455, 2.787008, 1, 1, 1, 1, 1,
0.1510897, -1.118771, 1.607845, 1, 1, 1, 1, 1,
0.1516482, -0.9821964, 2.555758, 1, 1, 1, 1, 1,
0.1525716, -0.06119225, 1.052773, 1, 1, 1, 1, 1,
0.154333, 0.8973873, 1.924508, 1, 1, 1, 1, 1,
0.1552879, -0.4370393, 1.027134, 1, 1, 1, 1, 1,
0.1586788, 1.364801, 2.394483, 1, 1, 1, 1, 1,
0.1588954, -1.564499, 5.609541, 1, 1, 1, 1, 1,
0.1590406, -0.8618066, 3.489713, 1, 1, 1, 1, 1,
0.1596346, 1.271906, -0.04589643, 1, 1, 1, 1, 1,
0.1663106, -2.368966, 2.450722, 1, 1, 1, 1, 1,
0.1717013, -0.6848404, 2.239349, 0, 0, 1, 1, 1,
0.1723568, -0.7851085, 3.478207, 1, 0, 0, 1, 1,
0.173752, -1.147481, 2.368654, 1, 0, 0, 1, 1,
0.1753818, 0.5989968, -0.09478491, 1, 0, 0, 1, 1,
0.1785227, 2.29403, 0.862604, 1, 0, 0, 1, 1,
0.1787596, 1.117119, -2.320784, 1, 0, 0, 1, 1,
0.1793189, -0.04412047, 2.239946, 0, 0, 0, 1, 1,
0.1805344, -0.3116394, 2.408281, 0, 0, 0, 1, 1,
0.1829703, -1.63965, 1.610046, 0, 0, 0, 1, 1,
0.1836061, 0.2674884, 1.388816, 0, 0, 0, 1, 1,
0.1836454, -0.02278647, 2.361698, 0, 0, 0, 1, 1,
0.1863818, 0.7260241, -0.05018146, 0, 0, 0, 1, 1,
0.187572, -1.387152, 2.006227, 0, 0, 0, 1, 1,
0.1900908, -0.3345826, 2.568031, 1, 1, 1, 1, 1,
0.1944429, -0.7847459, 4.645598, 1, 1, 1, 1, 1,
0.1950866, 1.062728, 1.65844, 1, 1, 1, 1, 1,
0.1953777, 0.5681046, 0.283426, 1, 1, 1, 1, 1,
0.1992945, 1.465859, -1.934437, 1, 1, 1, 1, 1,
0.199555, 0.1873811, -0.2123972, 1, 1, 1, 1, 1,
0.2055486, 0.04474203, 3.053704, 1, 1, 1, 1, 1,
0.213082, 1.203475, -0.400749, 1, 1, 1, 1, 1,
0.2146859, -0.3374248, 2.744741, 1, 1, 1, 1, 1,
0.2155844, -0.433533, 2.65979, 1, 1, 1, 1, 1,
0.2176346, -0.4400084, 2.483008, 1, 1, 1, 1, 1,
0.2201121, 1.21811, 1.04315, 1, 1, 1, 1, 1,
0.2202871, 3.212472, 0.9061275, 1, 1, 1, 1, 1,
0.2203543, 0.1382957, 0.1735641, 1, 1, 1, 1, 1,
0.2227717, -0.451449, 3.158499, 1, 1, 1, 1, 1,
0.2266219, -0.6966963, 2.953134, 0, 0, 1, 1, 1,
0.2339526, 1.770352, -0.6106508, 1, 0, 0, 1, 1,
0.2351502, 0.3542923, 0.3504239, 1, 0, 0, 1, 1,
0.2378064, 1.36908, -0.009087033, 1, 0, 0, 1, 1,
0.243336, 0.1992161, 0.4025904, 1, 0, 0, 1, 1,
0.2434613, 1.40507, 0.5906232, 1, 0, 0, 1, 1,
0.243861, -0.9155841, 2.141027, 0, 0, 0, 1, 1,
0.2459832, -1.161794, 1.039363, 0, 0, 0, 1, 1,
0.2527843, -1.993693, 2.499731, 0, 0, 0, 1, 1,
0.2579355, 1.856149, -1.13231, 0, 0, 0, 1, 1,
0.2599431, -2.16783, 3.352444, 0, 0, 0, 1, 1,
0.260047, 0.9457793, -0.4381171, 0, 0, 0, 1, 1,
0.2604682, -0.2778454, 3.393396, 0, 0, 0, 1, 1,
0.2615859, -1.348339, 3.265243, 1, 1, 1, 1, 1,
0.2624544, 1.223204, 1.537516, 1, 1, 1, 1, 1,
0.265451, 0.3017502, 0.0767835, 1, 1, 1, 1, 1,
0.2655515, -0.9127428, 2.566955, 1, 1, 1, 1, 1,
0.270334, 1.807964, 2.078621, 1, 1, 1, 1, 1,
0.2734816, -0.2057798, 2.483411, 1, 1, 1, 1, 1,
0.2764128, -2.754264, 3.557992, 1, 1, 1, 1, 1,
0.2769071, 1.940359, -1.496306, 1, 1, 1, 1, 1,
0.2801364, 1.247616, -0.7086108, 1, 1, 1, 1, 1,
0.2846017, 1.066581, -0.2048418, 1, 1, 1, 1, 1,
0.2904957, -0.2107461, 2.731057, 1, 1, 1, 1, 1,
0.2934172, 0.6579238, 1.723631, 1, 1, 1, 1, 1,
0.2949816, 1.163758, 1.02769, 1, 1, 1, 1, 1,
0.2952797, -1.46058, 4.470411, 1, 1, 1, 1, 1,
0.3019592, -1.125907, 3.490443, 1, 1, 1, 1, 1,
0.3037466, 0.005493784, 3.76389, 0, 0, 1, 1, 1,
0.3050807, 0.8801139, 0.4200433, 1, 0, 0, 1, 1,
0.3080108, -0.3190865, 3.204925, 1, 0, 0, 1, 1,
0.3094354, -0.264634, 2.638299, 1, 0, 0, 1, 1,
0.3098002, 0.4448799, 0.4853593, 1, 0, 0, 1, 1,
0.3125441, -0.6009248, 2.998071, 1, 0, 0, 1, 1,
0.3128288, 1.267569, 0.723414, 0, 0, 0, 1, 1,
0.3136156, 0.4925044, 3.18249, 0, 0, 0, 1, 1,
0.314958, -0.5329124, 2.475108, 0, 0, 0, 1, 1,
0.3151977, -0.4624296, 1.759561, 0, 0, 0, 1, 1,
0.3161264, -1.013035, 1.812341, 0, 0, 0, 1, 1,
0.317761, 2.295622, 0.6964037, 0, 0, 0, 1, 1,
0.3187759, 0.06744153, 1.542506, 0, 0, 0, 1, 1,
0.3278933, 0.7436524, 1.562104, 1, 1, 1, 1, 1,
0.3301171, -2.404631, 3.051266, 1, 1, 1, 1, 1,
0.3316862, 0.726953, 0.7688485, 1, 1, 1, 1, 1,
0.3317401, -1.98314, 3.68463, 1, 1, 1, 1, 1,
0.3358314, -0.4591281, 1.901089, 1, 1, 1, 1, 1,
0.3378036, -0.1587277, 2.129252, 1, 1, 1, 1, 1,
0.3379599, 2.654908, -1.303634, 1, 1, 1, 1, 1,
0.3406123, -0.1372058, 1.497626, 1, 1, 1, 1, 1,
0.3574254, 1.501484, -0.3187407, 1, 1, 1, 1, 1,
0.360594, 0.505408, 0.8833717, 1, 1, 1, 1, 1,
0.3612319, 0.09466258, 2.137743, 1, 1, 1, 1, 1,
0.3622519, 0.3198667, -0.121587, 1, 1, 1, 1, 1,
0.3658953, 0.6713044, -0.3587736, 1, 1, 1, 1, 1,
0.3679214, -0.04930795, 1.927978, 1, 1, 1, 1, 1,
0.3704183, -1.262852, 2.062792, 1, 1, 1, 1, 1,
0.3705905, -0.2934038, 0.5452459, 0, 0, 1, 1, 1,
0.3713287, 0.4892169, 1.647278, 1, 0, 0, 1, 1,
0.3942339, 0.659362, 2.064458, 1, 0, 0, 1, 1,
0.3965841, 1.884202, 1.187913, 1, 0, 0, 1, 1,
0.3966056, -1.181475, 5.252638, 1, 0, 0, 1, 1,
0.3969949, 0.543562, 1.391452, 1, 0, 0, 1, 1,
0.3974655, 0.3890041, -0.7736844, 0, 0, 0, 1, 1,
0.397627, 1.529809, 1.84848, 0, 0, 0, 1, 1,
0.4040094, 0.6168636, 1.15191, 0, 0, 0, 1, 1,
0.4071051, -1.562335, 2.041708, 0, 0, 0, 1, 1,
0.4074501, 1.320513, 0.008003211, 0, 0, 0, 1, 1,
0.4093966, 0.8361321, 0.1782442, 0, 0, 0, 1, 1,
0.4095221, 0.6026904, -0.928315, 0, 0, 0, 1, 1,
0.4149317, 0.7730253, 1.36226, 1, 1, 1, 1, 1,
0.4177945, 0.647347, -0.1280643, 1, 1, 1, 1, 1,
0.4186437, 0.3502153, 2.250218, 1, 1, 1, 1, 1,
0.4188138, 0.2092701, 0.3907552, 1, 1, 1, 1, 1,
0.4210166, 0.1728422, 0.976442, 1, 1, 1, 1, 1,
0.4259287, -0.9854058, 1.95818, 1, 1, 1, 1, 1,
0.4275495, -0.4796031, 4.247231, 1, 1, 1, 1, 1,
0.4353102, 0.7182314, 1.532408, 1, 1, 1, 1, 1,
0.4368252, 0.7776988, -0.05835928, 1, 1, 1, 1, 1,
0.4398549, -0.9848366, 3.643476, 1, 1, 1, 1, 1,
0.4404635, -0.5757367, 2.598036, 1, 1, 1, 1, 1,
0.4419153, -1.718497, 2.253719, 1, 1, 1, 1, 1,
0.4454033, 0.6827656, 0.4340163, 1, 1, 1, 1, 1,
0.445496, 1.664829, 1.452749, 1, 1, 1, 1, 1,
0.4540131, -1.393447, 4.008018, 1, 1, 1, 1, 1,
0.4558121, 0.3525137, 0.0639214, 0, 0, 1, 1, 1,
0.4559426, 0.4618873, 1.143313, 1, 0, 0, 1, 1,
0.4584143, 0.941026, -1.487436, 1, 0, 0, 1, 1,
0.4595733, -0.4387268, 4.010738, 1, 0, 0, 1, 1,
0.4622946, -0.4213722, 3.804792, 1, 0, 0, 1, 1,
0.4643372, 1.673425, 0.1457183, 1, 0, 0, 1, 1,
0.4661861, -1.413085, 3.30312, 0, 0, 0, 1, 1,
0.468318, -1.545194, 0.7724013, 0, 0, 0, 1, 1,
0.4707758, -1.301268, 3.116947, 0, 0, 0, 1, 1,
0.4708158, -0.7906444, 1.604452, 0, 0, 0, 1, 1,
0.4708472, -1.218942, 3.340046, 0, 0, 0, 1, 1,
0.4713519, -0.9636663, 3.403452, 0, 0, 0, 1, 1,
0.4716302, 0.07331772, 0.6849974, 0, 0, 0, 1, 1,
0.4810019, 0.2338434, 1.8825, 1, 1, 1, 1, 1,
0.4837933, -0.176415, 0.8037332, 1, 1, 1, 1, 1,
0.4841622, 0.4384245, 2.031319, 1, 1, 1, 1, 1,
0.4881748, 0.07000403, 2.269574, 1, 1, 1, 1, 1,
0.4935866, -0.07691083, 1.532802, 1, 1, 1, 1, 1,
0.5019789, -1.800264, 3.064395, 1, 1, 1, 1, 1,
0.5090119, -0.09136331, 1.253591, 1, 1, 1, 1, 1,
0.5128201, -0.2093002, 2.88326, 1, 1, 1, 1, 1,
0.5201361, 0.1407461, 1.674434, 1, 1, 1, 1, 1,
0.5299228, -0.410576, 1.230622, 1, 1, 1, 1, 1,
0.5318272, -0.4733592, 2.814533, 1, 1, 1, 1, 1,
0.5338031, -0.5350234, 2.109721, 1, 1, 1, 1, 1,
0.5347858, 1.150249, -0.8515641, 1, 1, 1, 1, 1,
0.5366194, -1.162706, 1.245844, 1, 1, 1, 1, 1,
0.5445961, -0.3624663, 0.9050378, 1, 1, 1, 1, 1,
0.5448108, -0.5480092, 3.453217, 0, 0, 1, 1, 1,
0.5510761, 0.1857506, 1.55417, 1, 0, 0, 1, 1,
0.5554145, -0.5303462, 1.440687, 1, 0, 0, 1, 1,
0.5574629, 0.4351717, 0.6635441, 1, 0, 0, 1, 1,
0.5612645, 1.084876, -0.1664981, 1, 0, 0, 1, 1,
0.5620627, 1.352162, 1.080382, 1, 0, 0, 1, 1,
0.5633101, 0.6561516, 1.574773, 0, 0, 0, 1, 1,
0.5735517, 1.227572, 1.018011, 0, 0, 0, 1, 1,
0.5812756, 1.522001, 1.121843, 0, 0, 0, 1, 1,
0.5914843, -1.023085, 3.422527, 0, 0, 0, 1, 1,
0.5946739, -0.2628028, 1.35349, 0, 0, 0, 1, 1,
0.5950324, -0.2396071, 1.229852, 0, 0, 0, 1, 1,
0.5978862, -1.338205, 1.814603, 0, 0, 0, 1, 1,
0.599853, 0.2447043, 1.155549, 1, 1, 1, 1, 1,
0.60516, 0.1689293, 2.519259, 1, 1, 1, 1, 1,
0.6051928, -0.03510958, 2.057795, 1, 1, 1, 1, 1,
0.6106965, 2.161014, -0.2718483, 1, 1, 1, 1, 1,
0.6113897, -0.05781478, 1.68785, 1, 1, 1, 1, 1,
0.6189535, -0.9060814, 2.807626, 1, 1, 1, 1, 1,
0.6225326, -0.3919199, 1.098419, 1, 1, 1, 1, 1,
0.6246115, 0.6262662, 0.5355224, 1, 1, 1, 1, 1,
0.625862, -0.7092059, 2.192164, 1, 1, 1, 1, 1,
0.628683, 0.2451872, 1.060691, 1, 1, 1, 1, 1,
0.6291721, 0.2330857, 0.9397333, 1, 1, 1, 1, 1,
0.6358542, 0.6989039, -0.393251, 1, 1, 1, 1, 1,
0.6369141, -1.473928, 3.076979, 1, 1, 1, 1, 1,
0.6381937, -1.274606, 1.300211, 1, 1, 1, 1, 1,
0.6386421, -1.093376, 2.118895, 1, 1, 1, 1, 1,
0.6394811, -0.07050345, 2.564947, 0, 0, 1, 1, 1,
0.6455602, -0.2796122, 2.249716, 1, 0, 0, 1, 1,
0.6608782, 0.4669866, 1.699927, 1, 0, 0, 1, 1,
0.6655179, 0.6680275, 2.207781, 1, 0, 0, 1, 1,
0.6687187, -0.3569089, 1.588777, 1, 0, 0, 1, 1,
0.6701295, -0.9801083, 0.2240796, 1, 0, 0, 1, 1,
0.6711875, 0.7482424, 2.413261, 0, 0, 0, 1, 1,
0.6830551, -0.706814, 3.468541, 0, 0, 0, 1, 1,
0.6857014, -0.5692053, 1.636835, 0, 0, 0, 1, 1,
0.6892599, 0.2295723, 0.1763421, 0, 0, 0, 1, 1,
0.6897171, -0.8796971, 2.74499, 0, 0, 0, 1, 1,
0.689832, 0.3387609, 1.301868, 0, 0, 0, 1, 1,
0.6910018, -0.5647659, 3.023182, 0, 0, 0, 1, 1,
0.6929164, -0.5161538, 0.7131066, 1, 1, 1, 1, 1,
0.700306, 0.153303, 0.5144326, 1, 1, 1, 1, 1,
0.7013819, 1.411344, 0.6411369, 1, 1, 1, 1, 1,
0.7029498, -1.493157, 3.950094, 1, 1, 1, 1, 1,
0.7085912, -0.3296535, 0.6331497, 1, 1, 1, 1, 1,
0.710787, 0.8682509, -0.3501672, 1, 1, 1, 1, 1,
0.7123784, -0.2487528, 1.985594, 1, 1, 1, 1, 1,
0.7146112, 0.8696612, 2.246794, 1, 1, 1, 1, 1,
0.7283863, 0.07923274, -0.634414, 1, 1, 1, 1, 1,
0.7329883, 0.6082262, 0.8383812, 1, 1, 1, 1, 1,
0.734032, -1.657954, 2.990879, 1, 1, 1, 1, 1,
0.7350352, -1.824155, 2.288111, 1, 1, 1, 1, 1,
0.7365268, -0.806614, 1.123333, 1, 1, 1, 1, 1,
0.7366772, -0.8604883, 2.228306, 1, 1, 1, 1, 1,
0.7375962, -0.2147838, 2.004036, 1, 1, 1, 1, 1,
0.740585, -0.4997443, 2.396781, 0, 0, 1, 1, 1,
0.7471554, -0.865244, 4.407561, 1, 0, 0, 1, 1,
0.748017, 1.079173, 1.264931, 1, 0, 0, 1, 1,
0.7496963, -3.154, 2.453594, 1, 0, 0, 1, 1,
0.7500975, -0.75468, 3.290911, 1, 0, 0, 1, 1,
0.7528723, 0.52909, 0.4196611, 1, 0, 0, 1, 1,
0.7533036, 0.4176098, 2.469181, 0, 0, 0, 1, 1,
0.7580472, -0.5568258, 2.939998, 0, 0, 0, 1, 1,
0.7588434, 1.01222, 2.115845, 0, 0, 0, 1, 1,
0.7665421, -0.6392426, 3.308504, 0, 0, 0, 1, 1,
0.7669643, -0.8427681, 2.435619, 0, 0, 0, 1, 1,
0.7689256, -0.3029585, 2.470046, 0, 0, 0, 1, 1,
0.7728919, -0.508867, 3.028716, 0, 0, 0, 1, 1,
0.7760544, -1.226965, 2.509061, 1, 1, 1, 1, 1,
0.7834368, 0.4147619, -0.1207784, 1, 1, 1, 1, 1,
0.7875358, -0.2811679, 1.063016, 1, 1, 1, 1, 1,
0.7887747, -0.605538, 2.210764, 1, 1, 1, 1, 1,
0.7891498, 0.04619529, 1.581191, 1, 1, 1, 1, 1,
0.7980562, -3.152596, 2.554662, 1, 1, 1, 1, 1,
0.7981184, -0.1688495, 1.728539, 1, 1, 1, 1, 1,
0.8004156, 1.3778, 0.2417701, 1, 1, 1, 1, 1,
0.8015852, -1.017214, 2.151857, 1, 1, 1, 1, 1,
0.8091401, -1.27427, 2.81295, 1, 1, 1, 1, 1,
0.8159672, 1.571932, -0.7177005, 1, 1, 1, 1, 1,
0.8214022, 1.89899, 0.7579672, 1, 1, 1, 1, 1,
0.825027, -0.6036372, 2.534583, 1, 1, 1, 1, 1,
0.8256614, -0.381174, 1.569451, 1, 1, 1, 1, 1,
0.830483, 0.5340677, 2.58551, 1, 1, 1, 1, 1,
0.8364543, 1.107043, -1.497465, 0, 0, 1, 1, 1,
0.8452846, 0.04418027, 2.605129, 1, 0, 0, 1, 1,
0.8487455, 0.538536, 1.895159, 1, 0, 0, 1, 1,
0.8533876, -1.511769, 1.844297, 1, 0, 0, 1, 1,
0.8538357, -1.183932, 3.362268, 1, 0, 0, 1, 1,
0.8561706, 0.2084694, 0.7410237, 1, 0, 0, 1, 1,
0.8598689, 0.2643748, -0.6608577, 0, 0, 0, 1, 1,
0.861035, -1.395653, 0.6341545, 0, 0, 0, 1, 1,
0.8645189, -0.9834676, 1.731927, 0, 0, 0, 1, 1,
0.8721612, 0.1978457, 0.9832709, 0, 0, 0, 1, 1,
0.8724216, 0.4830304, 1.569462, 0, 0, 0, 1, 1,
0.8775175, 0.8016829, -0.5715067, 0, 0, 0, 1, 1,
0.8797199, -0.07226411, 3.783712, 0, 0, 0, 1, 1,
0.8803037, -0.6233756, 1.01914, 1, 1, 1, 1, 1,
0.8943366, 1.430211, 2.026809, 1, 1, 1, 1, 1,
0.8964392, -0.1819532, 2.637017, 1, 1, 1, 1, 1,
0.8964444, 1.779254, -0.971494, 1, 1, 1, 1, 1,
0.9022567, -1.095804, 1.496113, 1, 1, 1, 1, 1,
0.9036667, -0.3429302, 2.194758, 1, 1, 1, 1, 1,
0.9041055, 0.1294342, 2.039743, 1, 1, 1, 1, 1,
0.9041774, 0.911723, 1.137575, 1, 1, 1, 1, 1,
0.9043784, -0.5597101, 2.897307, 1, 1, 1, 1, 1,
0.9094372, 0.4646257, 1.440932, 1, 1, 1, 1, 1,
0.910072, 0.7262545, 2.238516, 1, 1, 1, 1, 1,
0.9152443, -1.640895, 2.750914, 1, 1, 1, 1, 1,
0.9201089, -2.220595, 3.787309, 1, 1, 1, 1, 1,
0.9306489, 0.7517157, 2.090639, 1, 1, 1, 1, 1,
0.931698, -0.8420932, 1.59793, 1, 1, 1, 1, 1,
0.9360531, 0.386152, 2.450862, 0, 0, 1, 1, 1,
0.9389081, 0.4301854, 1.291575, 1, 0, 0, 1, 1,
0.9408526, -1.301237, 2.071734, 1, 0, 0, 1, 1,
0.9426122, 0.01822414, 1.601655, 1, 0, 0, 1, 1,
0.9431612, 0.1351471, 1.406026, 1, 0, 0, 1, 1,
0.9453583, 0.7111169, 0.8245224, 1, 0, 0, 1, 1,
0.9454648, 0.04426909, 0.3591138, 0, 0, 0, 1, 1,
0.9555315, 0.1949695, 1.291492, 0, 0, 0, 1, 1,
0.964855, 2.46472, 2.346189, 0, 0, 0, 1, 1,
0.9757434, 1.287874, -0.7286198, 0, 0, 0, 1, 1,
0.9761574, 0.02425792, 2.994393, 0, 0, 0, 1, 1,
0.9767536, 1.660016, -0.2361267, 0, 0, 0, 1, 1,
0.9771258, -1.616254, 3.784373, 0, 0, 0, 1, 1,
0.9817775, 0.3672409, -0.4193644, 1, 1, 1, 1, 1,
0.9908048, 1.745725, -2.137594, 1, 1, 1, 1, 1,
1.00787, 1.121834, 0.7523381, 1, 1, 1, 1, 1,
1.01116, 1.087386, 0.7591109, 1, 1, 1, 1, 1,
1.015254, 2.296448, -1.571744, 1, 1, 1, 1, 1,
1.017686, 0.4487606, 0.409618, 1, 1, 1, 1, 1,
1.017896, -0.5352153, 1.954412, 1, 1, 1, 1, 1,
1.024215, 0.359142, 1.572701, 1, 1, 1, 1, 1,
1.02673, 1.751715, -0.6726649, 1, 1, 1, 1, 1,
1.027964, 0.4249614, 0.09240827, 1, 1, 1, 1, 1,
1.030969, -2.101211, 3.274185, 1, 1, 1, 1, 1,
1.037066, 0.3890094, -0.7029049, 1, 1, 1, 1, 1,
1.047531, 1.171462, 0.8184326, 1, 1, 1, 1, 1,
1.04831, -2.223438, 1.301687, 1, 1, 1, 1, 1,
1.054467, -0.3599938, 2.811846, 1, 1, 1, 1, 1,
1.056805, -0.5609174, 0.8480076, 0, 0, 1, 1, 1,
1.05992, 1.083552, 2.77222, 1, 0, 0, 1, 1,
1.061409, -0.3976254, 3.044897, 1, 0, 0, 1, 1,
1.0615, -0.1555254, 3.320223, 1, 0, 0, 1, 1,
1.070478, 1.105845, 0.8802504, 1, 0, 0, 1, 1,
1.073153, -1.027842, 2.764118, 1, 0, 0, 1, 1,
1.076421, 0.161957, 1.472501, 0, 0, 0, 1, 1,
1.077057, -0.450134, 2.106107, 0, 0, 0, 1, 1,
1.082182, -0.6225033, 2.334206, 0, 0, 0, 1, 1,
1.089165, -0.4916274, 0.6540981, 0, 0, 0, 1, 1,
1.090784, 0.2258846, 1.223475, 0, 0, 0, 1, 1,
1.096543, -0.6220005, 1.413112, 0, 0, 0, 1, 1,
1.114974, 0.369013, 2.039345, 0, 0, 0, 1, 1,
1.124724, 1.254783, -0.04962593, 1, 1, 1, 1, 1,
1.141786, 0.8809457, 2.140856, 1, 1, 1, 1, 1,
1.141931, 1.188178, 0.2816159, 1, 1, 1, 1, 1,
1.141967, 1.403836, 0.9526656, 1, 1, 1, 1, 1,
1.142659, -0.6055935, 1.146134, 1, 1, 1, 1, 1,
1.144039, -1.578685, 2.58768, 1, 1, 1, 1, 1,
1.147435, 0.6120538, 1.176549, 1, 1, 1, 1, 1,
1.152401, 0.7845249, 1.42171, 1, 1, 1, 1, 1,
1.154423, 1.079689, 0.6245143, 1, 1, 1, 1, 1,
1.155456, 1.315243, 0.4882078, 1, 1, 1, 1, 1,
1.156404, 1.061661, 0.338945, 1, 1, 1, 1, 1,
1.1606, -0.6749014, 2.397456, 1, 1, 1, 1, 1,
1.164478, -0.5923599, 1.739062, 1, 1, 1, 1, 1,
1.176467, 0.1671823, 2.725302, 1, 1, 1, 1, 1,
1.18296, -0.9993358, 2.436641, 1, 1, 1, 1, 1,
1.184826, 1.469351, 0.911275, 0, 0, 1, 1, 1,
1.19297, 0.09715535, 0.9104034, 1, 0, 0, 1, 1,
1.199558, -0.4267159, 1.720935, 1, 0, 0, 1, 1,
1.201315, -0.07349656, 0.4661072, 1, 0, 0, 1, 1,
1.201413, -1.031468, 3.05184, 1, 0, 0, 1, 1,
1.205374, -0.6235986, 4.652352, 1, 0, 0, 1, 1,
1.222109, 0.7485452, 0.08102901, 0, 0, 0, 1, 1,
1.230986, 2.557862, 1.644447, 0, 0, 0, 1, 1,
1.232255, 0.7247263, 0.1852662, 0, 0, 0, 1, 1,
1.236412, -0.5656576, 0.5722709, 0, 0, 0, 1, 1,
1.236459, -1.003259, 4.87846, 0, 0, 0, 1, 1,
1.238421, -1.916591, 1.510098, 0, 0, 0, 1, 1,
1.24168, 1.046777, 0.615428, 0, 0, 0, 1, 1,
1.243981, 1.33589, 2.395118, 1, 1, 1, 1, 1,
1.253626, 0.1441924, -2.256881, 1, 1, 1, 1, 1,
1.262472, 0.9395666, 0.04382764, 1, 1, 1, 1, 1,
1.271367, 0.6090207, 1.111014, 1, 1, 1, 1, 1,
1.281681, -1.547837, 3.394993, 1, 1, 1, 1, 1,
1.285582, 0.9335559, 1.903898, 1, 1, 1, 1, 1,
1.287809, -0.2601213, 2.446213, 1, 1, 1, 1, 1,
1.294504, -0.5789613, 0.5368449, 1, 1, 1, 1, 1,
1.29557, 0.03733857, 1.634927, 1, 1, 1, 1, 1,
1.307677, -0.01027074, 2.547236, 1, 1, 1, 1, 1,
1.308498, 0.7906128, 2.63097, 1, 1, 1, 1, 1,
1.314938, -2.129938, 2.983019, 1, 1, 1, 1, 1,
1.318787, -1.233629, 3.354529, 1, 1, 1, 1, 1,
1.31933, -0.2902475, 2.310071, 1, 1, 1, 1, 1,
1.332316, -0.5754088, 0.2704298, 1, 1, 1, 1, 1,
1.343395, 0.2755038, 2.246612, 0, 0, 1, 1, 1,
1.354532, -0.2139252, 1.570317, 1, 0, 0, 1, 1,
1.376013, 1.867025, 1.373916, 1, 0, 0, 1, 1,
1.377057, -0.1334251, 0.9348876, 1, 0, 0, 1, 1,
1.389639, 0.06428689, -0.7876771, 1, 0, 0, 1, 1,
1.390302, -1.105665, -0.2625464, 1, 0, 0, 1, 1,
1.396512, -0.4148066, 2.412736, 0, 0, 0, 1, 1,
1.403235, -0.0237087, 2.311397, 0, 0, 0, 1, 1,
1.407636, -0.572996, 2.067774, 0, 0, 0, 1, 1,
1.409849, 0.6239765, 0.9172419, 0, 0, 0, 1, 1,
1.41327, -0.2050678, 1.775897, 0, 0, 0, 1, 1,
1.434011, 0.425549, 1.903988, 0, 0, 0, 1, 1,
1.435365, -0.08287497, 1.196494, 0, 0, 0, 1, 1,
1.446685, 0.2397466, 1.076923, 1, 1, 1, 1, 1,
1.454021, -0.9021537, 0.8193032, 1, 1, 1, 1, 1,
1.459268, 0.4043033, 0.344776, 1, 1, 1, 1, 1,
1.459846, 1.943792, 0.1385417, 1, 1, 1, 1, 1,
1.474577, 2.187286, -0.1819307, 1, 1, 1, 1, 1,
1.478492, 0.009065032, 3.183665, 1, 1, 1, 1, 1,
1.478697, -0.3962386, 0.6618407, 1, 1, 1, 1, 1,
1.479316, 0.6290367, 2.44226, 1, 1, 1, 1, 1,
1.4799, 0.1404708, 1.187018, 1, 1, 1, 1, 1,
1.506785, 0.2015951, -0.436527, 1, 1, 1, 1, 1,
1.523162, -0.09915072, 1.331889, 1, 1, 1, 1, 1,
1.538912, 1.740767, 1.394818, 1, 1, 1, 1, 1,
1.540228, -2.510911, 1.975983, 1, 1, 1, 1, 1,
1.562964, 2.328228, 0.8781933, 1, 1, 1, 1, 1,
1.569561, 0.8505955, 1.804742, 1, 1, 1, 1, 1,
1.586331, -1.317886, 3.970188, 0, 0, 1, 1, 1,
1.591045, 0.3329735, 0.5142882, 1, 0, 0, 1, 1,
1.595745, 0.8454897, 1.467941, 1, 0, 0, 1, 1,
1.595939, 2.44759, -0.4190573, 1, 0, 0, 1, 1,
1.605372, -0.2827236, 1.770463, 1, 0, 0, 1, 1,
1.607547, -0.8931658, 2.039467, 1, 0, 0, 1, 1,
1.608805, 0.7320915, 1.055631, 0, 0, 0, 1, 1,
1.618434, -0.2787746, 1.005556, 0, 0, 0, 1, 1,
1.639775, 1.146107, 0.0008188156, 0, 0, 0, 1, 1,
1.660655, 0.298385, 2.227445, 0, 0, 0, 1, 1,
1.673373, 1.223879, 0.9186732, 0, 0, 0, 1, 1,
1.679981, 0.666072, -0.1264059, 0, 0, 0, 1, 1,
1.682001, 0.212573, 1.784516, 0, 0, 0, 1, 1,
1.692474, -1.435607, 4.754976, 1, 1, 1, 1, 1,
1.697605, 0.8976729, 2.630435, 1, 1, 1, 1, 1,
1.701004, 2.170399, 0.0367796, 1, 1, 1, 1, 1,
1.708109, 0.5358456, 2.173347, 1, 1, 1, 1, 1,
1.711394, -0.9291421, 2.812235, 1, 1, 1, 1, 1,
1.711665, -0.05139539, 0.7224469, 1, 1, 1, 1, 1,
1.716489, 0.2064475, 0.1503693, 1, 1, 1, 1, 1,
1.739236, 1.623233, 0.1659251, 1, 1, 1, 1, 1,
1.761754, -0.5332629, 2.545782, 1, 1, 1, 1, 1,
1.781092, -1.590483, 0.5805569, 1, 1, 1, 1, 1,
1.805971, 0.3312823, 1.400002, 1, 1, 1, 1, 1,
1.826107, -0.4710012, 2.284775, 1, 1, 1, 1, 1,
1.831693, -0.274193, 0.6805003, 1, 1, 1, 1, 1,
1.8357, 0.4811243, 1.663254, 1, 1, 1, 1, 1,
1.837063, -0.1875664, 2.975543, 1, 1, 1, 1, 1,
1.846579, 1.087736, -0.8265329, 0, 0, 1, 1, 1,
1.867275, 0.250205, 1.695679, 1, 0, 0, 1, 1,
1.872823, -0.228982, 2.354382, 1, 0, 0, 1, 1,
1.872893, -1.381759, 3.387878, 1, 0, 0, 1, 1,
1.874773, -0.8118035, 1.906569, 1, 0, 0, 1, 1,
1.87788, 0.2256451, -0.2309145, 1, 0, 0, 1, 1,
1.883252, 1.094444, 0.4705193, 0, 0, 0, 1, 1,
1.883297, -0.8140031, 2.722715, 0, 0, 0, 1, 1,
1.895251, 1.47783, 1.428563, 0, 0, 0, 1, 1,
1.913489, 1.582446, 1.534437, 0, 0, 0, 1, 1,
1.929151, -0.3367823, -0.05791013, 0, 0, 0, 1, 1,
1.95293, 0.4499205, 2.730059, 0, 0, 0, 1, 1,
2.038225, -0.3085297, 0.1618647, 0, 0, 0, 1, 1,
2.060374, 1.418698, 1.078978, 1, 1, 1, 1, 1,
2.293033, -0.6843663, 2.563998, 1, 1, 1, 1, 1,
2.557889, -2.20221, 1.449891, 1, 1, 1, 1, 1,
2.596613, 1.197345, 1.715645, 1, 1, 1, 1, 1,
2.616998, -1.394516, 1.646639, 1, 1, 1, 1, 1,
2.711876, -0.8851977, 2.008706, 1, 1, 1, 1, 1,
3.00241, -1.322337, 1.866055, 1, 1, 1, 1, 1
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
var radius = 9.704311;
var distance = 34.08598;
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
mvMatrix.translate( 0.2734933, -0.02923608, -0.1252017 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.08598);
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
