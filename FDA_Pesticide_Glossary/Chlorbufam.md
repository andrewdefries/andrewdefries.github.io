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
-3.281265, -0.4934116, -0.5072622, 1, 0, 0, 1,
-3.028075, 0.7781767, -0.7940716, 1, 0.007843138, 0, 1,
-2.901121, 2.170998, 0.6064167, 1, 0.01176471, 0, 1,
-2.883112, 0.3307465, -2.947402, 1, 0.01960784, 0, 1,
-2.75773, -0.9117989, -3.012685, 1, 0.02352941, 0, 1,
-2.570615, 0.4417643, -0.1010069, 1, 0.03137255, 0, 1,
-2.518514, 0.3156615, -1.236086, 1, 0.03529412, 0, 1,
-2.510878, -2.332834, -2.621305, 1, 0.04313726, 0, 1,
-2.503751, 0.9777792, -0.262406, 1, 0.04705882, 0, 1,
-2.496995, -1.040421, -1.294769, 1, 0.05490196, 0, 1,
-2.49232, 1.610933, -1.989373, 1, 0.05882353, 0, 1,
-2.463547, 1.711202, -0.9239381, 1, 0.06666667, 0, 1,
-2.383142, -0.3551032, -1.740869, 1, 0.07058824, 0, 1,
-2.343799, 0.09515911, -0.6209785, 1, 0.07843138, 0, 1,
-2.308031, 0.7215587, -1.010715, 1, 0.08235294, 0, 1,
-2.255377, 2.648249, -2.430223, 1, 0.09019608, 0, 1,
-2.234672, 2.117485, -0.7777426, 1, 0.09411765, 0, 1,
-2.193119, -1.571704, -0.4645368, 1, 0.1019608, 0, 1,
-2.188347, 1.692759, 1.031056, 1, 0.1098039, 0, 1,
-2.166276, -2.329099, -0.8357642, 1, 0.1137255, 0, 1,
-2.13044, -1.600968, -2.923593, 1, 0.1215686, 0, 1,
-2.104972, 2.281905, -0.7119084, 1, 0.1254902, 0, 1,
-2.090539, -0.7087114, -2.466321, 1, 0.1333333, 0, 1,
-2.076796, 1.262041, -2.544232, 1, 0.1372549, 0, 1,
-2.055746, -0.5440829, -1.602462, 1, 0.145098, 0, 1,
-2.018347, 0.1390358, -2.884738, 1, 0.1490196, 0, 1,
-1.977616, 1.230852, -0.4326461, 1, 0.1568628, 0, 1,
-1.960415, 1.42884, -1.787233, 1, 0.1607843, 0, 1,
-1.945806, 0.1781156, 0.165329, 1, 0.1686275, 0, 1,
-1.924949, -0.8946122, -1.831683, 1, 0.172549, 0, 1,
-1.91692, -0.881833, -0.8111065, 1, 0.1803922, 0, 1,
-1.905954, 0.5541258, -1.736957, 1, 0.1843137, 0, 1,
-1.904196, -0.744826, -2.948191, 1, 0.1921569, 0, 1,
-1.87101, 1.321708, -1.750314, 1, 0.1960784, 0, 1,
-1.862923, 1.271968, -2.391639, 1, 0.2039216, 0, 1,
-1.849497, -0.7035844, -2.381242, 1, 0.2117647, 0, 1,
-1.848538, -1.18547, -2.443414, 1, 0.2156863, 0, 1,
-1.81631, 0.4474718, -2.796149, 1, 0.2235294, 0, 1,
-1.803433, 1.951507, -0.9178881, 1, 0.227451, 0, 1,
-1.789126, 0.1438769, -1.654371, 1, 0.2352941, 0, 1,
-1.779623, -0.9712544, -2.18719, 1, 0.2392157, 0, 1,
-1.769669, -2.656116, -2.923742, 1, 0.2470588, 0, 1,
-1.729765, 0.4857267, -0.3228922, 1, 0.2509804, 0, 1,
-1.721557, -0.04332381, -2.063904, 1, 0.2588235, 0, 1,
-1.719816, 1.080411, -0.8403901, 1, 0.2627451, 0, 1,
-1.704443, -0.2944315, -2.70126, 1, 0.2705882, 0, 1,
-1.696312, -0.3353057, -0.9363694, 1, 0.2745098, 0, 1,
-1.672968, -0.5223182, -0.7566985, 1, 0.282353, 0, 1,
-1.670761, -1.41449, -3.145963, 1, 0.2862745, 0, 1,
-1.669393, 1.11952, -1.117118, 1, 0.2941177, 0, 1,
-1.666956, 1.449721, -0.1738274, 1, 0.3019608, 0, 1,
-1.666932, -0.9079828, -1.843968, 1, 0.3058824, 0, 1,
-1.65639, -1.892234, -2.71071, 1, 0.3137255, 0, 1,
-1.647951, 2.878058, 1.125016, 1, 0.3176471, 0, 1,
-1.644936, 0.1421543, -1.010552, 1, 0.3254902, 0, 1,
-1.620435, -0.3061309, -2.282062, 1, 0.3294118, 0, 1,
-1.61474, 2.087806, -2.398536, 1, 0.3372549, 0, 1,
-1.60118, 0.4941866, -1.50948, 1, 0.3411765, 0, 1,
-1.595598, -0.5522507, -3.599424, 1, 0.3490196, 0, 1,
-1.578055, -0.6310391, -2.424609, 1, 0.3529412, 0, 1,
-1.576893, 1.82155, -1.023878, 1, 0.3607843, 0, 1,
-1.576701, 0.6675819, -0.906005, 1, 0.3647059, 0, 1,
-1.5741, 0.4976089, -1.307522, 1, 0.372549, 0, 1,
-1.569348, 0.2004728, -1.158816, 1, 0.3764706, 0, 1,
-1.551041, -0.03787354, -0.6674408, 1, 0.3843137, 0, 1,
-1.550902, -0.3341522, -0.8218336, 1, 0.3882353, 0, 1,
-1.549982, -0.9574642, -3.221962, 1, 0.3960784, 0, 1,
-1.536438, 0.5596253, -0.8025173, 1, 0.4039216, 0, 1,
-1.528466, 1.05067, -1.324365, 1, 0.4078431, 0, 1,
-1.515719, -0.2620445, -1.83498, 1, 0.4156863, 0, 1,
-1.514056, 1.845852, -0.1437464, 1, 0.4196078, 0, 1,
-1.506599, 1.149057, -0.6758486, 1, 0.427451, 0, 1,
-1.500322, -0.3672016, -1.38354, 1, 0.4313726, 0, 1,
-1.490504, 2.279254, -0.2975128, 1, 0.4392157, 0, 1,
-1.470992, 0.5485146, -1.39571, 1, 0.4431373, 0, 1,
-1.464117, -1.924625, -2.665828, 1, 0.4509804, 0, 1,
-1.45736, -0.8289317, -1.710985, 1, 0.454902, 0, 1,
-1.45532, -0.02278039, -2.470637, 1, 0.4627451, 0, 1,
-1.455254, -1.023451, -1.168988, 1, 0.4666667, 0, 1,
-1.444111, -0.6482344, -3.831524, 1, 0.4745098, 0, 1,
-1.440435, 1.186128, -1.14901, 1, 0.4784314, 0, 1,
-1.437249, -0.367301, -2.019957, 1, 0.4862745, 0, 1,
-1.434006, 0.5713546, -1.580387, 1, 0.4901961, 0, 1,
-1.429837, 0.09074455, -2.179472, 1, 0.4980392, 0, 1,
-1.423743, -0.7485254, -2.197448, 1, 0.5058824, 0, 1,
-1.41507, -0.5063989, -2.497892, 1, 0.509804, 0, 1,
-1.411206, -0.01073458, -0.6173665, 1, 0.5176471, 0, 1,
-1.393702, 1.060594, -0.7991376, 1, 0.5215687, 0, 1,
-1.384481, 1.831478, -0.9835688, 1, 0.5294118, 0, 1,
-1.382132, -1.904182, -2.560223, 1, 0.5333334, 0, 1,
-1.37395, 0.7441845, -2.412942, 1, 0.5411765, 0, 1,
-1.358844, -0.1480496, -1.166065, 1, 0.5450981, 0, 1,
-1.358804, 0.2708855, -2.974301, 1, 0.5529412, 0, 1,
-1.352324, -0.9633853, -3.324929, 1, 0.5568628, 0, 1,
-1.348073, -0.9522478, -2.722835, 1, 0.5647059, 0, 1,
-1.347859, -1.338854, -1.750265, 1, 0.5686275, 0, 1,
-1.341918, 0.2047479, -2.567279, 1, 0.5764706, 0, 1,
-1.337386, 1.520375, -2.223444, 1, 0.5803922, 0, 1,
-1.330356, -0.8655193, 0.7717134, 1, 0.5882353, 0, 1,
-1.316787, 0.51459, -0.2682602, 1, 0.5921569, 0, 1,
-1.30296, -0.7636184, -2.465078, 1, 0.6, 0, 1,
-1.290904, -2.327685, -2.374531, 1, 0.6078432, 0, 1,
-1.289482, 1.065579, 0.963448, 1, 0.6117647, 0, 1,
-1.288763, 0.8136345, -1.141148, 1, 0.6196079, 0, 1,
-1.287865, -0.893868, -1.941698, 1, 0.6235294, 0, 1,
-1.283833, -1.336297, -1.8362, 1, 0.6313726, 0, 1,
-1.269009, 0.785401, -2.274757, 1, 0.6352941, 0, 1,
-1.257781, 0.1739422, -3.517697, 1, 0.6431373, 0, 1,
-1.252373, 1.26146, -1.431393, 1, 0.6470588, 0, 1,
-1.233752, -1.635139, -2.415422, 1, 0.654902, 0, 1,
-1.229904, 1.18939, -1.041871, 1, 0.6588235, 0, 1,
-1.221565, 1.117064, -0.1608956, 1, 0.6666667, 0, 1,
-1.221349, 1.110138, -0.8123497, 1, 0.6705883, 0, 1,
-1.220334, -0.7605595, -2.831382, 1, 0.6784314, 0, 1,
-1.219744, 0.9299815, -0.5630626, 1, 0.682353, 0, 1,
-1.211881, 0.7821087, -0.6173031, 1, 0.6901961, 0, 1,
-1.205946, 0.8707485, -1.076907, 1, 0.6941177, 0, 1,
-1.196954, -0.2472034, -0.4959542, 1, 0.7019608, 0, 1,
-1.195196, 1.044014, -2.062379, 1, 0.7098039, 0, 1,
-1.189776, -2.098488, -2.46807, 1, 0.7137255, 0, 1,
-1.175802, 0.5389208, -0.8148798, 1, 0.7215686, 0, 1,
-1.157722, 0.6572371, -0.3355238, 1, 0.7254902, 0, 1,
-1.151501, 0.2973228, -1.255721, 1, 0.7333333, 0, 1,
-1.150602, 0.6499534, -2.002998, 1, 0.7372549, 0, 1,
-1.144278, 0.823795, -1.699135, 1, 0.7450981, 0, 1,
-1.143619, 0.04917457, -0.5554299, 1, 0.7490196, 0, 1,
-1.140086, -0.8625852, -1.549177, 1, 0.7568628, 0, 1,
-1.135174, -0.123672, -1.486312, 1, 0.7607843, 0, 1,
-1.131378, 0.5861185, -1.018798, 1, 0.7686275, 0, 1,
-1.12989, 0.6892126, -1.543393, 1, 0.772549, 0, 1,
-1.124499, 2.476811, -1.091011, 1, 0.7803922, 0, 1,
-1.123068, -0.6632299, -1.747892, 1, 0.7843137, 0, 1,
-1.122624, 1.381309, 0.08120515, 1, 0.7921569, 0, 1,
-1.116143, 0.2098275, -0.7948168, 1, 0.7960784, 0, 1,
-1.111235, 0.04509734, -0.694901, 1, 0.8039216, 0, 1,
-1.109654, 0.3265711, -2.404907, 1, 0.8117647, 0, 1,
-1.108019, -0.05664096, -2.024373, 1, 0.8156863, 0, 1,
-1.099277, -0.2685263, -3.254442, 1, 0.8235294, 0, 1,
-1.097765, 0.02115528, -1.679238, 1, 0.827451, 0, 1,
-1.095415, 0.5183792, -0.4196956, 1, 0.8352941, 0, 1,
-1.094915, -0.3324859, 1.898661e-06, 1, 0.8392157, 0, 1,
-1.083517, 0.1367911, -1.208503, 1, 0.8470588, 0, 1,
-1.082327, 0.7965482, -0.005798719, 1, 0.8509804, 0, 1,
-1.080385, -0.4876516, -2.407664, 1, 0.8588235, 0, 1,
-1.064299, 1.198029, -2.420922, 1, 0.8627451, 0, 1,
-1.063129, -0.4622293, -3.399147, 1, 0.8705882, 0, 1,
-1.058814, -0.890094, -2.618446, 1, 0.8745098, 0, 1,
-1.057624, -1.021653, -2.427756, 1, 0.8823529, 0, 1,
-1.05069, 1.560579, -1.070675, 1, 0.8862745, 0, 1,
-1.04921, -0.3000695, -1.924313, 1, 0.8941177, 0, 1,
-1.0471, -0.385597, -2.371866, 1, 0.8980392, 0, 1,
-1.03921, -0.301717, -1.174271, 1, 0.9058824, 0, 1,
-1.037661, 1.289735, -1.411191, 1, 0.9137255, 0, 1,
-1.026656, 1.081429, -0.1234715, 1, 0.9176471, 0, 1,
-1.025043, -0.02690507, -1.631718, 1, 0.9254902, 0, 1,
-1.022806, 0.04741375, -1.993775, 1, 0.9294118, 0, 1,
-1.019372, 0.07621403, -1.976942, 1, 0.9372549, 0, 1,
-1.016165, -0.8171557, -4.660187, 1, 0.9411765, 0, 1,
-1.015622, -3.122527, -3.564457, 1, 0.9490196, 0, 1,
-0.9966728, -0.9972533, -1.94842, 1, 0.9529412, 0, 1,
-0.9869384, -1.815391, -2.043313, 1, 0.9607843, 0, 1,
-0.9851951, -1.272489, -2.944836, 1, 0.9647059, 0, 1,
-0.9798909, 1.58745, -2.624346, 1, 0.972549, 0, 1,
-0.9781373, 0.9031255, -0.7470964, 1, 0.9764706, 0, 1,
-0.9759956, 0.2051324, -2.086652, 1, 0.9843137, 0, 1,
-0.9716626, 0.5465741, 0.5021237, 1, 0.9882353, 0, 1,
-0.9675614, 0.8358252, -1.2406, 1, 0.9960784, 0, 1,
-0.963406, 0.3463398, -2.735758, 0.9960784, 1, 0, 1,
-0.9615775, -0.5586907, -3.110396, 0.9921569, 1, 0, 1,
-0.9584498, 0.09495074, -0.9068691, 0.9843137, 1, 0, 1,
-0.9569539, -1.736844, -4.108355, 0.9803922, 1, 0, 1,
-0.9514742, -0.9236441, -2.741386, 0.972549, 1, 0, 1,
-0.9440644, 0.8515208, -0.9799424, 0.9686275, 1, 0, 1,
-0.9410858, -0.9033042, -2.924336, 0.9607843, 1, 0, 1,
-0.9305764, 1.33569, -0.2909219, 0.9568627, 1, 0, 1,
-0.9256065, -0.5366078, -1.37352, 0.9490196, 1, 0, 1,
-0.908088, 0.1864186, -0.4333313, 0.945098, 1, 0, 1,
-0.9058493, 0.8906311, -0.9962358, 0.9372549, 1, 0, 1,
-0.9019704, 0.1452014, -0.9479669, 0.9333333, 1, 0, 1,
-0.890331, 0.9341889, -0.7625678, 0.9254902, 1, 0, 1,
-0.8893352, -0.1062367, -1.336779, 0.9215686, 1, 0, 1,
-0.8840099, 0.01719731, -0.05680491, 0.9137255, 1, 0, 1,
-0.8675126, 0.3483688, -2.230194, 0.9098039, 1, 0, 1,
-0.8665208, 0.166122, -1.130402, 0.9019608, 1, 0, 1,
-0.8644264, -0.1429488, -1.157114, 0.8941177, 1, 0, 1,
-0.8628333, 1.160287, -1.200858, 0.8901961, 1, 0, 1,
-0.8541784, 0.2480669, -1.37526, 0.8823529, 1, 0, 1,
-0.852713, 1.605458, -0.07510054, 0.8784314, 1, 0, 1,
-0.8421106, 0.4124881, -4.605863, 0.8705882, 1, 0, 1,
-0.8357572, -1.749583, -4.617609, 0.8666667, 1, 0, 1,
-0.8344659, -1.940041, -3.267061, 0.8588235, 1, 0, 1,
-0.8319204, -1.655288, -3.460586, 0.854902, 1, 0, 1,
-0.8309468, 0.0135349, -2.279218, 0.8470588, 1, 0, 1,
-0.829682, -0.006369401, -3.558284, 0.8431373, 1, 0, 1,
-0.8267682, 0.4753469, -0.700877, 0.8352941, 1, 0, 1,
-0.8142198, 1.12339, -1.723291, 0.8313726, 1, 0, 1,
-0.8129863, -1.531382, -4.496635, 0.8235294, 1, 0, 1,
-0.8086268, -0.1763086, -2.050675, 0.8196079, 1, 0, 1,
-0.8070713, 1.074448, 0.1821698, 0.8117647, 1, 0, 1,
-0.8069897, -0.9007764, -0.748526, 0.8078431, 1, 0, 1,
-0.8008785, 2.463918, -1.183448, 0.8, 1, 0, 1,
-0.7949319, 0.6238835, 0.9442245, 0.7921569, 1, 0, 1,
-0.7935991, -0.1629616, 0.6149515, 0.7882353, 1, 0, 1,
-0.7872232, -0.5082683, -3.033848, 0.7803922, 1, 0, 1,
-0.7844701, -0.3421467, -1.610951, 0.7764706, 1, 0, 1,
-0.7781132, 0.5953227, -0.3284294, 0.7686275, 1, 0, 1,
-0.7779172, -1.026548, -2.919601, 0.7647059, 1, 0, 1,
-0.7775136, -0.7058152, -0.6629555, 0.7568628, 1, 0, 1,
-0.7714214, -0.5341368, -2.524794, 0.7529412, 1, 0, 1,
-0.7702033, -1.72897, -3.177577, 0.7450981, 1, 0, 1,
-0.769483, -0.3966017, -3.486397, 0.7411765, 1, 0, 1,
-0.7667036, 0.1050187, -0.7181253, 0.7333333, 1, 0, 1,
-0.764283, -1.593591, -3.21539, 0.7294118, 1, 0, 1,
-0.7636814, 0.9847725, -0.7409914, 0.7215686, 1, 0, 1,
-0.7632605, 0.1278297, -2.316509, 0.7176471, 1, 0, 1,
-0.7608531, 0.7470411, -2.42426, 0.7098039, 1, 0, 1,
-0.7576352, -0.3406525, -1.52944, 0.7058824, 1, 0, 1,
-0.7562805, -0.8277275, -3.870073, 0.6980392, 1, 0, 1,
-0.7551948, 1.376888, -4.037259, 0.6901961, 1, 0, 1,
-0.7529044, -1.003972, -3.112543, 0.6862745, 1, 0, 1,
-0.751302, -0.2051563, -1.298551, 0.6784314, 1, 0, 1,
-0.7502625, 1.248509, 0.1426944, 0.6745098, 1, 0, 1,
-0.7486452, 0.1418138, -2.957633, 0.6666667, 1, 0, 1,
-0.7385351, -1.296405, -2.954366, 0.6627451, 1, 0, 1,
-0.7377012, -0.1198452, -0.7298986, 0.654902, 1, 0, 1,
-0.7359857, -0.6817851, -4.477827, 0.6509804, 1, 0, 1,
-0.732549, 0.01333543, -1.539259, 0.6431373, 1, 0, 1,
-0.7298961, 0.2346332, -0.5288337, 0.6392157, 1, 0, 1,
-0.7256663, -1.798242, -4.477745, 0.6313726, 1, 0, 1,
-0.7196289, -0.8333691, -1.828859, 0.627451, 1, 0, 1,
-0.7193326, 0.4114145, 0.7296839, 0.6196079, 1, 0, 1,
-0.7131099, -1.318996, -3.991738, 0.6156863, 1, 0, 1,
-0.712557, -1.991331, -3.481641, 0.6078432, 1, 0, 1,
-0.7110119, -0.3253717, -2.989222, 0.6039216, 1, 0, 1,
-0.7064497, -0.8202938, -1.882823, 0.5960785, 1, 0, 1,
-0.6992652, 0.08735916, -0.01911142, 0.5882353, 1, 0, 1,
-0.6919266, 0.3918254, -0.1707339, 0.5843138, 1, 0, 1,
-0.6877295, 0.5893373, -1.323905, 0.5764706, 1, 0, 1,
-0.6870697, -1.055621, -3.584079, 0.572549, 1, 0, 1,
-0.6850936, 1.15478, 0.09961063, 0.5647059, 1, 0, 1,
-0.6689767, -0.7996101, -2.94026, 0.5607843, 1, 0, 1,
-0.6651591, -2.048235, -2.798019, 0.5529412, 1, 0, 1,
-0.6638507, 0.8300598, -1.631067, 0.5490196, 1, 0, 1,
-0.6621687, 1.875521, 0.902681, 0.5411765, 1, 0, 1,
-0.6585622, -2.994442, -4.215031, 0.5372549, 1, 0, 1,
-0.6572226, -0.9327642, -3.10548, 0.5294118, 1, 0, 1,
-0.6425137, 0.4113593, -2.072956, 0.5254902, 1, 0, 1,
-0.639517, 1.014273, -1.43332, 0.5176471, 1, 0, 1,
-0.6390412, 0.2980095, -0.4987142, 0.5137255, 1, 0, 1,
-0.6375487, -1.38081, -3.629314, 0.5058824, 1, 0, 1,
-0.6346221, 0.7605717, -0.8758973, 0.5019608, 1, 0, 1,
-0.633405, -0.9203382, -3.112233, 0.4941176, 1, 0, 1,
-0.6327047, 0.08056015, -2.624753, 0.4862745, 1, 0, 1,
-0.6290022, -0.002282226, -2.860231, 0.4823529, 1, 0, 1,
-0.6253272, 0.1311039, -2.370019, 0.4745098, 1, 0, 1,
-0.6209074, 0.3987784, -0.5161711, 0.4705882, 1, 0, 1,
-0.6176061, 0.7389469, -1.787163, 0.4627451, 1, 0, 1,
-0.6173381, -0.6497732, -0.2031735, 0.4588235, 1, 0, 1,
-0.6152596, -0.188034, -0.2721339, 0.4509804, 1, 0, 1,
-0.6147816, -0.6620632, -1.794166, 0.4470588, 1, 0, 1,
-0.6125158, 2.053371, -1.043892, 0.4392157, 1, 0, 1,
-0.6069847, -1.170665, -4.369494, 0.4352941, 1, 0, 1,
-0.6027206, 1.88121, 0.2441813, 0.427451, 1, 0, 1,
-0.6004624, 1.031988, -1.033766, 0.4235294, 1, 0, 1,
-0.5949625, 2.609607, 0.6696823, 0.4156863, 1, 0, 1,
-0.5918579, -0.07488657, -2.764076, 0.4117647, 1, 0, 1,
-0.5898607, -1.326532, -2.738131, 0.4039216, 1, 0, 1,
-0.5867646, -0.6762554, -3.237911, 0.3960784, 1, 0, 1,
-0.5845007, 0.9537677, -2.209412, 0.3921569, 1, 0, 1,
-0.5816055, 0.006717284, -3.202139, 0.3843137, 1, 0, 1,
-0.5781946, 0.2550599, -1.696236, 0.3803922, 1, 0, 1,
-0.5780007, 1.280238, -0.9038548, 0.372549, 1, 0, 1,
-0.5779303, -0.4142745, -1.723502, 0.3686275, 1, 0, 1,
-0.574947, 2.834462, 0.9532316, 0.3607843, 1, 0, 1,
-0.5664182, 1.442974, 0.7827363, 0.3568628, 1, 0, 1,
-0.5644461, 0.1420436, -1.482132, 0.3490196, 1, 0, 1,
-0.5639801, 0.7673781, -1.369019, 0.345098, 1, 0, 1,
-0.5635256, -0.432909, -1.71695, 0.3372549, 1, 0, 1,
-0.5627663, 1.954051, -0.4857632, 0.3333333, 1, 0, 1,
-0.5614074, 0.3804919, -2.819914, 0.3254902, 1, 0, 1,
-0.5585143, -0.1197499, -1.719946, 0.3215686, 1, 0, 1,
-0.5563402, -0.2954598, -1.058014, 0.3137255, 1, 0, 1,
-0.5519611, 0.04213143, -1.946483, 0.3098039, 1, 0, 1,
-0.548936, 0.06497988, -1.478326, 0.3019608, 1, 0, 1,
-0.547671, 2.103664, 0.1015037, 0.2941177, 1, 0, 1,
-0.5456253, 1.197725, -0.8707468, 0.2901961, 1, 0, 1,
-0.5413357, -0.8156163, -2.156558, 0.282353, 1, 0, 1,
-0.5412344, 1.033039, 0.9238293, 0.2784314, 1, 0, 1,
-0.5396116, 0.4586936, -0.982114, 0.2705882, 1, 0, 1,
-0.5323443, 1.218516, -1.103981, 0.2666667, 1, 0, 1,
-0.5313743, 0.2893757, -1.342427, 0.2588235, 1, 0, 1,
-0.5310786, -0.344478, -3.605527, 0.254902, 1, 0, 1,
-0.5300585, -0.5774276, -1.828641, 0.2470588, 1, 0, 1,
-0.5296389, -1.434265, -1.852845, 0.2431373, 1, 0, 1,
-0.5263449, -0.3933654, -2.487687, 0.2352941, 1, 0, 1,
-0.52522, 0.2849894, -2.430043, 0.2313726, 1, 0, 1,
-0.5143398, -0.3700612, -3.038291, 0.2235294, 1, 0, 1,
-0.5076743, -1.028135, -2.526176, 0.2196078, 1, 0, 1,
-0.5006771, 0.7326587, -1.276952, 0.2117647, 1, 0, 1,
-0.5006617, -1.021713, -4.049491, 0.2078431, 1, 0, 1,
-0.4974942, -1.171793, -4.758514, 0.2, 1, 0, 1,
-0.4958417, 0.9025142, -1.353087, 0.1921569, 1, 0, 1,
-0.4949459, -0.5231634, -0.2618597, 0.1882353, 1, 0, 1,
-0.4948077, 0.1781943, -1.817528, 0.1803922, 1, 0, 1,
-0.4944317, -1.051587, -3.483037, 0.1764706, 1, 0, 1,
-0.4932962, 1.062798, -0.09045447, 0.1686275, 1, 0, 1,
-0.4928299, 0.5776187, -0.3301564, 0.1647059, 1, 0, 1,
-0.4913198, -0.8782536, -4.410461, 0.1568628, 1, 0, 1,
-0.4863342, 1.762335, 1.132706, 0.1529412, 1, 0, 1,
-0.4851967, -1.086312, -2.815648, 0.145098, 1, 0, 1,
-0.4804953, -0.3979441, -4.780584, 0.1411765, 1, 0, 1,
-0.4788976, -0.5548686, -2.268887, 0.1333333, 1, 0, 1,
-0.4714898, -0.05750284, -1.727133, 0.1294118, 1, 0, 1,
-0.4714849, -0.3238662, -1.127069, 0.1215686, 1, 0, 1,
-0.4710052, 1.428313, 0.03890359, 0.1176471, 1, 0, 1,
-0.4698941, 0.9384397, 0.1982879, 0.1098039, 1, 0, 1,
-0.4667157, -1.307245, -1.736353, 0.1058824, 1, 0, 1,
-0.4659382, -0.919625, -2.70361, 0.09803922, 1, 0, 1,
-0.4591219, 0.6481681, -0.6530092, 0.09019608, 1, 0, 1,
-0.4590092, 0.9541516, -0.5149287, 0.08627451, 1, 0, 1,
-0.4571288, 0.4014217, -0.5846685, 0.07843138, 1, 0, 1,
-0.4548795, 0.1317131, -0.2713298, 0.07450981, 1, 0, 1,
-0.4548061, 0.2131499, -0.7928531, 0.06666667, 1, 0, 1,
-0.4504149, 1.469606, -0.1300747, 0.0627451, 1, 0, 1,
-0.4473448, -0.668946, -1.70341, 0.05490196, 1, 0, 1,
-0.4472117, 0.9882183, -1.434682, 0.05098039, 1, 0, 1,
-0.4468099, 2.161735, -0.6559784, 0.04313726, 1, 0, 1,
-0.4465913, -0.670772, -3.717242, 0.03921569, 1, 0, 1,
-0.4433772, 1.332626, 0.4947913, 0.03137255, 1, 0, 1,
-0.4422763, 0.5558221, -0.3812723, 0.02745098, 1, 0, 1,
-0.4357471, 0.4118412, -1.108868, 0.01960784, 1, 0, 1,
-0.433627, -0.9187639, -1.866247, 0.01568628, 1, 0, 1,
-0.4304129, 0.3196355, -1.795877, 0.007843138, 1, 0, 1,
-0.4244792, -0.8177924, -2.789634, 0.003921569, 1, 0, 1,
-0.4230125, -0.06345253, -2.042073, 0, 1, 0.003921569, 1,
-0.4224843, 0.3557864, 1.624476, 0, 1, 0.01176471, 1,
-0.4201029, -0.5813128, -2.548992, 0, 1, 0.01568628, 1,
-0.4176171, -0.832276, -4.91272, 0, 1, 0.02352941, 1,
-0.4167953, -0.8777393, -3.376395, 0, 1, 0.02745098, 1,
-0.4131298, 0.1253598, -0.3129209, 0, 1, 0.03529412, 1,
-0.4124393, 0.8933292, 0.3235326, 0, 1, 0.03921569, 1,
-0.4093779, 0.7416494, 0.8829788, 0, 1, 0.04705882, 1,
-0.4059998, 2.365068, -0.2076422, 0, 1, 0.05098039, 1,
-0.3995377, -0.9786065, -2.850946, 0, 1, 0.05882353, 1,
-0.3932548, 0.1812556, -2.192551, 0, 1, 0.0627451, 1,
-0.390334, -1.328731, -5.419498, 0, 1, 0.07058824, 1,
-0.3889048, 1.715131, 0.2730749, 0, 1, 0.07450981, 1,
-0.3792676, -0.2285165, -1.36466, 0, 1, 0.08235294, 1,
-0.3792279, -0.02578417, -3.398579, 0, 1, 0.08627451, 1,
-0.3762991, 1.332392, 1.550467, 0, 1, 0.09411765, 1,
-0.3719936, -0.1574515, -0.5991627, 0, 1, 0.1019608, 1,
-0.3663364, 0.2704777, 0.4831684, 0, 1, 0.1058824, 1,
-0.3643368, -0.9330484, -1.671035, 0, 1, 0.1137255, 1,
-0.3622536, 1.089461, -1.057125, 0, 1, 0.1176471, 1,
-0.3611082, -0.2417602, -1.94384, 0, 1, 0.1254902, 1,
-0.3570226, -0.4953434, -1.038609, 0, 1, 0.1294118, 1,
-0.3524293, -1.053055, -1.427615, 0, 1, 0.1372549, 1,
-0.3490607, 1.349851, -0.3887213, 0, 1, 0.1411765, 1,
-0.3489417, -1.278007, -1.464787, 0, 1, 0.1490196, 1,
-0.3481919, 0.8032098, -1.210747, 0, 1, 0.1529412, 1,
-0.34774, 1.462514, 1.693023, 0, 1, 0.1607843, 1,
-0.3476793, -0.2166156, -1.820952, 0, 1, 0.1647059, 1,
-0.3437732, -1.054774, -3.370997, 0, 1, 0.172549, 1,
-0.3341976, -1.352976, -1.174608, 0, 1, 0.1764706, 1,
-0.3322127, 0.4512663, -0.8963624, 0, 1, 0.1843137, 1,
-0.3281422, -1.46002, -4.728254, 0, 1, 0.1882353, 1,
-0.3204742, -0.6641113, -2.038726, 0, 1, 0.1960784, 1,
-0.3184592, -1.81574, -4.291292, 0, 1, 0.2039216, 1,
-0.3133626, -0.08805785, -2.289964, 0, 1, 0.2078431, 1,
-0.3088294, -0.5811719, -2.940624, 0, 1, 0.2156863, 1,
-0.3067584, -2.089244, -2.987568, 0, 1, 0.2196078, 1,
-0.3059539, -0.2836914, -3.40058, 0, 1, 0.227451, 1,
-0.3036353, -0.2303919, -1.940868, 0, 1, 0.2313726, 1,
-0.296775, 0.4509399, -0.8182006, 0, 1, 0.2392157, 1,
-0.2963147, 2.310717, 0.7340121, 0, 1, 0.2431373, 1,
-0.2962705, 0.4767538, -0.8437327, 0, 1, 0.2509804, 1,
-0.2937765, -0.4244399, -1.757364, 0, 1, 0.254902, 1,
-0.2927638, 1.341165, 0.3024237, 0, 1, 0.2627451, 1,
-0.2925439, 0.01698096, -1.444025, 0, 1, 0.2666667, 1,
-0.2902994, -0.4243117, -3.346452, 0, 1, 0.2745098, 1,
-0.2902803, 0.1414135, -2.444305, 0, 1, 0.2784314, 1,
-0.2893369, -0.2547463, -2.499393, 0, 1, 0.2862745, 1,
-0.2855148, -0.4434468, -3.347892, 0, 1, 0.2901961, 1,
-0.2853091, 0.4847766, -0.3100438, 0, 1, 0.2980392, 1,
-0.2848846, -0.7809961, -3.251532, 0, 1, 0.3058824, 1,
-0.2843878, -0.3097723, -1.447443, 0, 1, 0.3098039, 1,
-0.2836083, 0.6489009, -2.753475, 0, 1, 0.3176471, 1,
-0.2800033, 1.813421, -0.25945, 0, 1, 0.3215686, 1,
-0.2782929, -0.5830907, -3.196339, 0, 1, 0.3294118, 1,
-0.2765708, 0.1393225, 1.073327, 0, 1, 0.3333333, 1,
-0.2732271, 1.016727, -0.9589501, 0, 1, 0.3411765, 1,
-0.2732131, -0.2698775, -1.546357, 0, 1, 0.345098, 1,
-0.2727571, 0.1734202, -0.3970385, 0, 1, 0.3529412, 1,
-0.262646, 0.1978792, -1.650066, 0, 1, 0.3568628, 1,
-0.2593672, -0.5831394, -1.514331, 0, 1, 0.3647059, 1,
-0.2575481, 1.265587, -0.3504863, 0, 1, 0.3686275, 1,
-0.2571427, -0.05426189, -0.6309258, 0, 1, 0.3764706, 1,
-0.254033, -0.8770556, -2.498458, 0, 1, 0.3803922, 1,
-0.2466491, 0.03969585, -1.303947, 0, 1, 0.3882353, 1,
-0.2442918, 1.027767, -1.452405, 0, 1, 0.3921569, 1,
-0.2407941, 1.146095, 0.2831682, 0, 1, 0.4, 1,
-0.2383982, 0.1628393, -1.310924, 0, 1, 0.4078431, 1,
-0.2380143, -0.6927782, -3.550798, 0, 1, 0.4117647, 1,
-0.2370362, 1.565219, 2.412832, 0, 1, 0.4196078, 1,
-0.235482, -0.8017385, -3.850246, 0, 1, 0.4235294, 1,
-0.235434, -0.5436195, -3.817866, 0, 1, 0.4313726, 1,
-0.2348541, 1.029038, 0.7816532, 0, 1, 0.4352941, 1,
-0.2346414, -0.779863, -2.273333, 0, 1, 0.4431373, 1,
-0.2325458, 0.5988083, -0.9139153, 0, 1, 0.4470588, 1,
-0.2307757, 0.2871494, -0.9470243, 0, 1, 0.454902, 1,
-0.2293966, 1.011973, 0.4290433, 0, 1, 0.4588235, 1,
-0.2257935, -0.4642888, -3.409461, 0, 1, 0.4666667, 1,
-0.2257539, 1.315219, -0.3186913, 0, 1, 0.4705882, 1,
-0.21783, -0.7437906, -1.504088, 0, 1, 0.4784314, 1,
-0.2144718, 1.510491, 0.6736517, 0, 1, 0.4823529, 1,
-0.2101913, -2.003808, -1.601236, 0, 1, 0.4901961, 1,
-0.2090811, 1.851316, -1.111167, 0, 1, 0.4941176, 1,
-0.2024447, -0.3327124, -2.74682, 0, 1, 0.5019608, 1,
-0.1992622, -0.9384685, -1.120465, 0, 1, 0.509804, 1,
-0.1976135, 0.2404137, -0.3761415, 0, 1, 0.5137255, 1,
-0.1972412, -0.8957897, -3.208355, 0, 1, 0.5215687, 1,
-0.1887708, 0.8580651, -0.3315096, 0, 1, 0.5254902, 1,
-0.1883177, -1.574461, -3.339568, 0, 1, 0.5333334, 1,
-0.1855381, 1.155223, 0.2025949, 0, 1, 0.5372549, 1,
-0.1791442, -1.106582, -4.504316, 0, 1, 0.5450981, 1,
-0.1778796, 0.005095674, -1.554648, 0, 1, 0.5490196, 1,
-0.1763974, 0.3201197, -0.2686663, 0, 1, 0.5568628, 1,
-0.1749899, -0.7345916, -2.905396, 0, 1, 0.5607843, 1,
-0.1731031, 0.08647217, -1.20924, 0, 1, 0.5686275, 1,
-0.1725716, -0.8074664, -3.949175, 0, 1, 0.572549, 1,
-0.1717542, 1.536468, 1.458154, 0, 1, 0.5803922, 1,
-0.1706421, 0.3743762, 0.5117106, 0, 1, 0.5843138, 1,
-0.1688497, -0.7539347, -2.050397, 0, 1, 0.5921569, 1,
-0.1678795, -0.8408116, -2.299, 0, 1, 0.5960785, 1,
-0.1661771, 0.5761061, -1.356649, 0, 1, 0.6039216, 1,
-0.165777, 0.1664549, -3.163685, 0, 1, 0.6117647, 1,
-0.1650813, -2.475081, -2.620744, 0, 1, 0.6156863, 1,
-0.162851, 1.449024, 0.7660813, 0, 1, 0.6235294, 1,
-0.1616124, -0.5639594, -3.123719, 0, 1, 0.627451, 1,
-0.1598951, 0.4667911, 0.8161824, 0, 1, 0.6352941, 1,
-0.1550871, 2.322562, -0.9675795, 0, 1, 0.6392157, 1,
-0.1524979, 1.049416, -0.5815161, 0, 1, 0.6470588, 1,
-0.1516192, -0.3460416, -2.909241, 0, 1, 0.6509804, 1,
-0.1489221, 2.079854, -1.286548, 0, 1, 0.6588235, 1,
-0.1463019, 0.2634723, 2.346428, 0, 1, 0.6627451, 1,
-0.1406513, -0.3343205, -2.274909, 0, 1, 0.6705883, 1,
-0.1405187, 2.475913, -0.1340176, 0, 1, 0.6745098, 1,
-0.1350529, -1.102342, -3.633419, 0, 1, 0.682353, 1,
-0.1343773, -0.01492466, -2.144507, 0, 1, 0.6862745, 1,
-0.1332616, -0.5300136, -2.460697, 0, 1, 0.6941177, 1,
-0.1298088, 0.6726658, 0.2276336, 0, 1, 0.7019608, 1,
-0.1291457, -0.02702704, -2.602702, 0, 1, 0.7058824, 1,
-0.1289695, -1.499009, -3.900543, 0, 1, 0.7137255, 1,
-0.1283072, 0.5868114, -0.424431, 0, 1, 0.7176471, 1,
-0.1282376, 1.632336, -0.1236442, 0, 1, 0.7254902, 1,
-0.1209403, -1.862768, -2.798288, 0, 1, 0.7294118, 1,
-0.114397, -0.3487314, -3.247394, 0, 1, 0.7372549, 1,
-0.1134572, -1.175301, -1.655321, 0, 1, 0.7411765, 1,
-0.1092524, -2.005451, -3.039462, 0, 1, 0.7490196, 1,
-0.108171, -0.5552385, -2.98031, 0, 1, 0.7529412, 1,
-0.1056361, 0.203382, 0.3580682, 0, 1, 0.7607843, 1,
-0.1033205, 1.710293, 0.03190826, 0, 1, 0.7647059, 1,
-0.1026371, 1.456371, -0.1334605, 0, 1, 0.772549, 1,
-0.1022714, 0.1194507, -1.988888, 0, 1, 0.7764706, 1,
-0.1008546, -0.3105522, -3.309034, 0, 1, 0.7843137, 1,
-0.09719256, -2.111845, -4.217722, 0, 1, 0.7882353, 1,
-0.09329539, -0.3507725, -2.73535, 0, 1, 0.7960784, 1,
-0.08701846, 0.04525371, -1.429716, 0, 1, 0.8039216, 1,
-0.0829051, -0.2852082, -2.855368, 0, 1, 0.8078431, 1,
-0.08285615, -0.1228488, -3.303149, 0, 1, 0.8156863, 1,
-0.08265699, -0.6418448, -1.188936, 0, 1, 0.8196079, 1,
-0.08173812, -0.1640025, -4.53246, 0, 1, 0.827451, 1,
-0.07549802, -0.1180087, -3.041701, 0, 1, 0.8313726, 1,
-0.07439378, 1.356931, 0.4375888, 0, 1, 0.8392157, 1,
-0.06920023, -0.5470208, -2.851098, 0, 1, 0.8431373, 1,
-0.06910426, -0.2497499, -3.475578, 0, 1, 0.8509804, 1,
-0.06249015, 0.2751894, -0.9830997, 0, 1, 0.854902, 1,
-0.05789557, 1.599938, -0.8224057, 0, 1, 0.8627451, 1,
-0.05712319, -0.6351734, -2.125457, 0, 1, 0.8666667, 1,
-0.05674966, 0.2219312, 0.3694367, 0, 1, 0.8745098, 1,
-0.0553022, 0.4420805, 1.01221, 0, 1, 0.8784314, 1,
-0.05522369, 0.1303665, -0.0706673, 0, 1, 0.8862745, 1,
-0.05056783, -0.7681696, -3.402467, 0, 1, 0.8901961, 1,
-0.04916518, -1.478792, -5.295958, 0, 1, 0.8980392, 1,
-0.04642534, -1.089352, -3.796163, 0, 1, 0.9058824, 1,
-0.04506443, -2.301467, -4.579279, 0, 1, 0.9098039, 1,
-0.04416203, -1.723319, -2.441738, 0, 1, 0.9176471, 1,
-0.03942034, -0.1412044, -1.548086, 0, 1, 0.9215686, 1,
-0.03922944, 0.08500867, -1.346938, 0, 1, 0.9294118, 1,
-0.03497338, 0.1813604, -0.3616361, 0, 1, 0.9333333, 1,
-0.03173858, -1.108107, -3.337611, 0, 1, 0.9411765, 1,
-0.02827822, 0.247489, -0.5468143, 0, 1, 0.945098, 1,
-0.02707799, 1.596685, 0.3925947, 0, 1, 0.9529412, 1,
-0.02649969, 1.978337, -0.02437589, 0, 1, 0.9568627, 1,
-0.02474045, -0.927773, -4.793599, 0, 1, 0.9647059, 1,
-0.02078298, -0.04437364, -3.502624, 0, 1, 0.9686275, 1,
-0.02028625, 0.433224, 0.0871538, 0, 1, 0.9764706, 1,
-0.01864944, 0.8208157, -0.585304, 0, 1, 0.9803922, 1,
-0.01748627, -0.3344519, -2.31886, 0, 1, 0.9882353, 1,
-0.01607765, -1.448821, -2.901731, 0, 1, 0.9921569, 1,
-0.01576835, -0.619893, -4.518375, 0, 1, 1, 1,
-0.01415949, -1.069884, -2.986273, 0, 0.9921569, 1, 1,
-0.01012897, -2.237232, -3.45278, 0, 0.9882353, 1, 1,
-0.009607978, -0.4656245, -1.674123, 0, 0.9803922, 1, 1,
-0.003993642, 0.5717064, 1.445678, 0, 0.9764706, 1, 1,
-0.002537447, 1.250689, -0.4970614, 0, 0.9686275, 1, 1,
0.006543244, 0.098724, -0.6987522, 0, 0.9647059, 1, 1,
0.01098229, 1.19076, 1.450921, 0, 0.9568627, 1, 1,
0.01749293, 1.344793, -0.7263503, 0, 0.9529412, 1, 1,
0.02069554, -0.9060982, 3.142814, 0, 0.945098, 1, 1,
0.0216479, -0.8042823, 2.726438, 0, 0.9411765, 1, 1,
0.02394612, -0.817515, 3.572616, 0, 0.9333333, 1, 1,
0.02547025, 1.579029, 1.844519, 0, 0.9294118, 1, 1,
0.0286928, 0.4746276, -0.5286653, 0, 0.9215686, 1, 1,
0.02934248, -0.7095261, 4.082793, 0, 0.9176471, 1, 1,
0.04176851, 1.396789, -1.618335, 0, 0.9098039, 1, 1,
0.04272131, -0.254939, 2.220421, 0, 0.9058824, 1, 1,
0.04317186, 0.4741977, 0.8589415, 0, 0.8980392, 1, 1,
0.05000298, -1.37063, 2.870333, 0, 0.8901961, 1, 1,
0.05067472, -0.01691753, 1.610437, 0, 0.8862745, 1, 1,
0.0525489, -1.706772, 2.979728, 0, 0.8784314, 1, 1,
0.05613535, 2.462472, -0.2616904, 0, 0.8745098, 1, 1,
0.05801937, 1.427864, -1.401464, 0, 0.8666667, 1, 1,
0.06047429, -2.379674, 1.970888, 0, 0.8627451, 1, 1,
0.06577826, 1.772375, 2.742385, 0, 0.854902, 1, 1,
0.06793667, -0.3411057, 4.446856, 0, 0.8509804, 1, 1,
0.06866357, 1.607768, 1.341988, 0, 0.8431373, 1, 1,
0.06956435, -0.04714828, 2.829942, 0, 0.8392157, 1, 1,
0.07074403, 1.055788, 0.5489237, 0, 0.8313726, 1, 1,
0.07314648, -0.8429143, 2.273117, 0, 0.827451, 1, 1,
0.07315877, -0.4024611, 2.42949, 0, 0.8196079, 1, 1,
0.07374858, 0.4474032, -0.6161911, 0, 0.8156863, 1, 1,
0.07609433, -0.6286242, 3.454263, 0, 0.8078431, 1, 1,
0.078212, -0.3474613, 2.152808, 0, 0.8039216, 1, 1,
0.07951357, -0.8142112, 2.566176, 0, 0.7960784, 1, 1,
0.08589265, 0.9360723, 1.924956, 0, 0.7882353, 1, 1,
0.08781715, 1.14369, 0.05928996, 0, 0.7843137, 1, 1,
0.08783724, 0.5099112, -0.262069, 0, 0.7764706, 1, 1,
0.09074787, -0.03083386, 3.384751, 0, 0.772549, 1, 1,
0.0944095, -1.222274, 2.582139, 0, 0.7647059, 1, 1,
0.09462211, -0.9400507, 2.205358, 0, 0.7607843, 1, 1,
0.1000358, 0.7774808, -0.6436427, 0, 0.7529412, 1, 1,
0.1023778, 0.3197348, -0.7570336, 0, 0.7490196, 1, 1,
0.1118018, 0.1739975, -0.1500897, 0, 0.7411765, 1, 1,
0.1126979, -0.7072867, 2.525554, 0, 0.7372549, 1, 1,
0.1167568, -1.254901, 3.424967, 0, 0.7294118, 1, 1,
0.1170197, -0.7662444, 4.693561, 0, 0.7254902, 1, 1,
0.1176023, -0.1919017, 2.445696, 0, 0.7176471, 1, 1,
0.12644, -0.3178047, 3.901831, 0, 0.7137255, 1, 1,
0.127402, 1.124221, -0.2892021, 0, 0.7058824, 1, 1,
0.1282318, 1.871517, 0.4735236, 0, 0.6980392, 1, 1,
0.131782, -0.5233325, 4.272242, 0, 0.6941177, 1, 1,
0.1318464, -0.7659072, 2.115246, 0, 0.6862745, 1, 1,
0.13854, -1.083582, 1.988572, 0, 0.682353, 1, 1,
0.1403044, 1.044053, -0.6864726, 0, 0.6745098, 1, 1,
0.1406258, 1.512918, 0.4212833, 0, 0.6705883, 1, 1,
0.1502697, 0.05595244, 1.303883, 0, 0.6627451, 1, 1,
0.153852, -0.4623421, 2.949763, 0, 0.6588235, 1, 1,
0.1568199, -1.569951, 2.490146, 0, 0.6509804, 1, 1,
0.159918, -0.08929759, 1.307031, 0, 0.6470588, 1, 1,
0.1693029, 1.149132, 0.277816, 0, 0.6392157, 1, 1,
0.1757978, 1.452843, -0.5016124, 0, 0.6352941, 1, 1,
0.183632, -0.3722173, 1.333563, 0, 0.627451, 1, 1,
0.1850635, 0.1919344, -0.3059242, 0, 0.6235294, 1, 1,
0.1862254, -0.1981358, 3.107472, 0, 0.6156863, 1, 1,
0.1864238, -1.874104, 3.490309, 0, 0.6117647, 1, 1,
0.1881322, -1.724385, 3.841405, 0, 0.6039216, 1, 1,
0.1887669, -0.3725965, 2.829472, 0, 0.5960785, 1, 1,
0.1889817, 0.01195495, 0.7943096, 0, 0.5921569, 1, 1,
0.1895898, -0.501616, 2.944311, 0, 0.5843138, 1, 1,
0.1930624, 1.301693, -1.009726, 0, 0.5803922, 1, 1,
0.1954233, 0.2139198, 0.1444509, 0, 0.572549, 1, 1,
0.1962075, -1.431724, 3.386619, 0, 0.5686275, 1, 1,
0.2065975, 1.180317, 0.3568291, 0, 0.5607843, 1, 1,
0.2093602, -0.4416577, 2.59861, 0, 0.5568628, 1, 1,
0.210936, 0.3196458, 1.088495, 0, 0.5490196, 1, 1,
0.2127688, 0.2166565, 0.567364, 0, 0.5450981, 1, 1,
0.2137952, -1.922391, 2.5242, 0, 0.5372549, 1, 1,
0.2162717, 0.8746223, 1.02625, 0, 0.5333334, 1, 1,
0.2208997, 1.672629, -0.3157183, 0, 0.5254902, 1, 1,
0.22254, -0.1278166, 5.264364, 0, 0.5215687, 1, 1,
0.2246834, 1.800798, -0.09765857, 0, 0.5137255, 1, 1,
0.226607, 0.2609348, -0.1267798, 0, 0.509804, 1, 1,
0.228002, 0.1341663, 0.1915181, 0, 0.5019608, 1, 1,
0.2285016, 0.04695009, 0.6864712, 0, 0.4941176, 1, 1,
0.2293415, 0.03386468, 1.583706, 0, 0.4901961, 1, 1,
0.2324667, -0.3712982, 2.262954, 0, 0.4823529, 1, 1,
0.2340254, 1.291856, 0.676452, 0, 0.4784314, 1, 1,
0.242229, 1.316322, -1.32516, 0, 0.4705882, 1, 1,
0.2449092, 0.7249505, 0.8537916, 0, 0.4666667, 1, 1,
0.2459958, -1.328311, 2.877898, 0, 0.4588235, 1, 1,
0.2516479, 0.07450334, 3.029694, 0, 0.454902, 1, 1,
0.2538338, -0.5748537, 2.153881, 0, 0.4470588, 1, 1,
0.2549667, 0.6210769, -0.3553228, 0, 0.4431373, 1, 1,
0.2560212, -0.947015, 2.190341, 0, 0.4352941, 1, 1,
0.2578133, -0.0466297, 2.782633, 0, 0.4313726, 1, 1,
0.2578174, -0.8947544, 5.730148, 0, 0.4235294, 1, 1,
0.2579889, 0.5914801, -0.2034826, 0, 0.4196078, 1, 1,
0.2618633, 0.7034748, 0.4942, 0, 0.4117647, 1, 1,
0.2672442, 0.04423798, 0.2744319, 0, 0.4078431, 1, 1,
0.2690344, 0.4407966, -1.232962, 0, 0.4, 1, 1,
0.2710299, 0.1659029, 0.9340644, 0, 0.3921569, 1, 1,
0.2742313, 0.6425147, 0.8938376, 0, 0.3882353, 1, 1,
0.2798382, 0.7263061, -0.03125622, 0, 0.3803922, 1, 1,
0.2829043, -1.154051, 2.226747, 0, 0.3764706, 1, 1,
0.2849602, -1.542741, 3.320114, 0, 0.3686275, 1, 1,
0.289306, 0.02912918, 1.22888, 0, 0.3647059, 1, 1,
0.2915628, 0.1591917, 3.918974, 0, 0.3568628, 1, 1,
0.2953612, 0.8904202, -0.2188397, 0, 0.3529412, 1, 1,
0.2984595, -1.327547, 3.012307, 0, 0.345098, 1, 1,
0.2984847, -0.919948, 1.91249, 0, 0.3411765, 1, 1,
0.2988384, 0.7138478, 1.728388, 0, 0.3333333, 1, 1,
0.2990193, -0.5209162, 3.566445, 0, 0.3294118, 1, 1,
0.2994323, 0.6972857, 0.3261901, 0, 0.3215686, 1, 1,
0.3008614, 1.316473, -2.623096, 0, 0.3176471, 1, 1,
0.3023025, 0.2496662, 1.82305, 0, 0.3098039, 1, 1,
0.3038501, -0.006001486, 2.99026, 0, 0.3058824, 1, 1,
0.304368, -0.8268771, 1.762392, 0, 0.2980392, 1, 1,
0.3062876, -0.4525527, 2.782196, 0, 0.2901961, 1, 1,
0.3136736, -0.3618847, 2.069592, 0, 0.2862745, 1, 1,
0.3157303, -0.9711293, 2.486791, 0, 0.2784314, 1, 1,
0.3201438, 0.9184767, 1.599054, 0, 0.2745098, 1, 1,
0.3227251, -0.4195304, 2.487663, 0, 0.2666667, 1, 1,
0.3243757, -0.4083681, 4.723787, 0, 0.2627451, 1, 1,
0.3267806, -0.9519604, 2.929418, 0, 0.254902, 1, 1,
0.3319182, -0.2279289, 0.7107533, 0, 0.2509804, 1, 1,
0.3375013, 1.11797, 0.3085387, 0, 0.2431373, 1, 1,
0.3435431, -0.5311113, 3.109213, 0, 0.2392157, 1, 1,
0.3480252, -0.2933742, 4.050379, 0, 0.2313726, 1, 1,
0.3526976, 0.1767021, 0.5930495, 0, 0.227451, 1, 1,
0.358089, 1.705564, 0.8654628, 0, 0.2196078, 1, 1,
0.3596365, -0.6075143, 3.959809, 0, 0.2156863, 1, 1,
0.3655728, 0.0545119, 2.870392, 0, 0.2078431, 1, 1,
0.3682927, 0.9073955, -0.6498961, 0, 0.2039216, 1, 1,
0.3696846, 1.818218, 0.3484533, 0, 0.1960784, 1, 1,
0.3710011, 1.368766, -0.1093072, 0, 0.1882353, 1, 1,
0.3737044, 0.2828917, 1.708731, 0, 0.1843137, 1, 1,
0.3739871, -1.152748, 4.116971, 0, 0.1764706, 1, 1,
0.3765593, -1.090653, 2.384672, 0, 0.172549, 1, 1,
0.3767692, -0.6146431, 3.021114, 0, 0.1647059, 1, 1,
0.3782293, 1.175222, 0.8092675, 0, 0.1607843, 1, 1,
0.3787878, -1.460011, 3.191179, 0, 0.1529412, 1, 1,
0.3835841, -1.498209, 3.757766, 0, 0.1490196, 1, 1,
0.3840956, 0.9592394, -1.959493, 0, 0.1411765, 1, 1,
0.3844538, 1.525471, -2.102747, 0, 0.1372549, 1, 1,
0.3903601, 1.346999, 0.8020377, 0, 0.1294118, 1, 1,
0.392506, 0.9948208, 1.833608, 0, 0.1254902, 1, 1,
0.3952579, 0.9797815, -0.0449581, 0, 0.1176471, 1, 1,
0.3975797, -1.167978, 1.537238, 0, 0.1137255, 1, 1,
0.3981763, -0.799757, 3.573782, 0, 0.1058824, 1, 1,
0.398304, -0.2386662, 2.75632, 0, 0.09803922, 1, 1,
0.3984105, 1.902272, -0.5668163, 0, 0.09411765, 1, 1,
0.4005477, -0.3223754, 2.26126, 0, 0.08627451, 1, 1,
0.4020565, -0.7756812, 3.820826, 0, 0.08235294, 1, 1,
0.4042902, -1.037211, 3.024912, 0, 0.07450981, 1, 1,
0.4068555, 1.125642, 1.913414, 0, 0.07058824, 1, 1,
0.4074889, -0.05837814, 2.173607, 0, 0.0627451, 1, 1,
0.4132268, -1.304388, 1.2611, 0, 0.05882353, 1, 1,
0.4161778, -0.4288218, 4.779408, 0, 0.05098039, 1, 1,
0.4164991, 0.9000144, -0.6042933, 0, 0.04705882, 1, 1,
0.4274834, -0.2726232, 3.049667, 0, 0.03921569, 1, 1,
0.4300112, 0.5336815, 1.469334, 0, 0.03529412, 1, 1,
0.4319521, -0.8927075, 3.657186, 0, 0.02745098, 1, 1,
0.4391077, -0.1197001, 1.316356, 0, 0.02352941, 1, 1,
0.4415309, 1.148998, -0.5523615, 0, 0.01568628, 1, 1,
0.4432504, -1.788616, 3.240009, 0, 0.01176471, 1, 1,
0.4438166, -2.167503, 5.036164, 0, 0.003921569, 1, 1,
0.4458338, 1.782818, -2.09355, 0.003921569, 0, 1, 1,
0.4518832, 0.7711905, -1.861694, 0.007843138, 0, 1, 1,
0.4525328, -0.3032165, 1.711396, 0.01568628, 0, 1, 1,
0.4549377, -1.204342, -0.008798468, 0.01960784, 0, 1, 1,
0.4554045, 0.7245524, -1.053147, 0.02745098, 0, 1, 1,
0.4554824, -0.02845209, 2.484465, 0.03137255, 0, 1, 1,
0.4587017, -1.934465, 3.624466, 0.03921569, 0, 1, 1,
0.4627079, -0.1849002, 1.579718, 0.04313726, 0, 1, 1,
0.4732218, -0.116233, 3.270443, 0.05098039, 0, 1, 1,
0.4770714, 1.210416, -0.7781277, 0.05490196, 0, 1, 1,
0.4795922, -0.4221803, 2.714586, 0.0627451, 0, 1, 1,
0.4805593, 0.5186783, 1.109789, 0.06666667, 0, 1, 1,
0.4816775, 1.14129, -1.16175, 0.07450981, 0, 1, 1,
0.4926512, -1.292208, 3.104253, 0.07843138, 0, 1, 1,
0.492864, 1.923907, -0.3626462, 0.08627451, 0, 1, 1,
0.4946012, 0.1454142, 2.167688, 0.09019608, 0, 1, 1,
0.4959614, -1.303317, 3.750822, 0.09803922, 0, 1, 1,
0.4989526, 0.4091848, 0.2311798, 0.1058824, 0, 1, 1,
0.5009759, 0.668149, 1.760996, 0.1098039, 0, 1, 1,
0.5024264, 1.22504, 1.195676, 0.1176471, 0, 1, 1,
0.5052044, -0.7001395, 2.712766, 0.1215686, 0, 1, 1,
0.5052441, 0.7966911, 1.538265, 0.1294118, 0, 1, 1,
0.5080013, 0.5579659, 0.8413572, 0.1333333, 0, 1, 1,
0.5084733, 0.3826059, 1.150735, 0.1411765, 0, 1, 1,
0.5087759, 0.5777628, 0.2448061, 0.145098, 0, 1, 1,
0.5136384, -1.335625, 2.162818, 0.1529412, 0, 1, 1,
0.5149837, 1.458639, -0.8385763, 0.1568628, 0, 1, 1,
0.5183522, 0.06689557, 0.1586448, 0.1647059, 0, 1, 1,
0.5188869, -0.43153, 5.237868, 0.1686275, 0, 1, 1,
0.5210394, 0.453947, -1.3844, 0.1764706, 0, 1, 1,
0.5229889, 1.247834, -0.6024829, 0.1803922, 0, 1, 1,
0.5243193, -0.02083004, 1.562189, 0.1882353, 0, 1, 1,
0.5270144, 1.958829, 1.461709, 0.1921569, 0, 1, 1,
0.5279425, 1.057501, 1.600883, 0.2, 0, 1, 1,
0.5299427, -3.864592e-05, 2.35745, 0.2078431, 0, 1, 1,
0.5310054, -2.232672, 2.229407, 0.2117647, 0, 1, 1,
0.5316942, -0.9435315, 4.768993, 0.2196078, 0, 1, 1,
0.5373212, 0.06186017, 1.95553, 0.2235294, 0, 1, 1,
0.5375834, -1.480555, 2.195282, 0.2313726, 0, 1, 1,
0.5507068, 0.6144041, 1.308799, 0.2352941, 0, 1, 1,
0.5543912, -0.4196065, 0.6598187, 0.2431373, 0, 1, 1,
0.5663267, -1.523504, 4.732905, 0.2470588, 0, 1, 1,
0.5665394, 0.7912945, 0.1601643, 0.254902, 0, 1, 1,
0.5691257, -1.742202, 1.821668, 0.2588235, 0, 1, 1,
0.569853, -0.2888348, 2.029105, 0.2666667, 0, 1, 1,
0.5713343, -0.6864668, 2.300347, 0.2705882, 0, 1, 1,
0.5719827, 1.204836, 0.4206344, 0.2784314, 0, 1, 1,
0.5796552, 1.056699, -0.1778739, 0.282353, 0, 1, 1,
0.5806414, -1.392153, 3.305088, 0.2901961, 0, 1, 1,
0.5887168, 0.8065651, 1.498734, 0.2941177, 0, 1, 1,
0.5910122, 0.9199452, 2.613396, 0.3019608, 0, 1, 1,
0.5940167, -0.3703195, 0.641135, 0.3098039, 0, 1, 1,
0.5945472, -0.7094781, 2.466241, 0.3137255, 0, 1, 1,
0.5946447, 0.2267476, 1.809524, 0.3215686, 0, 1, 1,
0.6016914, 0.8876796, 0.1480819, 0.3254902, 0, 1, 1,
0.6082049, 0.6487514, 1.559101, 0.3333333, 0, 1, 1,
0.6097796, -0.5886589, 2.429452, 0.3372549, 0, 1, 1,
0.6130794, 1.0166, 2.095843, 0.345098, 0, 1, 1,
0.6178502, 0.5843138, 1.967443, 0.3490196, 0, 1, 1,
0.6203156, -0.2778463, 2.849237, 0.3568628, 0, 1, 1,
0.6222201, -0.07899292, -0.5738575, 0.3607843, 0, 1, 1,
0.6225637, 0.3208743, 1.804614, 0.3686275, 0, 1, 1,
0.625066, -0.9969198, 1.699859, 0.372549, 0, 1, 1,
0.6258932, 0.2794062, 2.180494, 0.3803922, 0, 1, 1,
0.6293503, -1.201701, 0.1833412, 0.3843137, 0, 1, 1,
0.6345639, -0.1942455, 3.364773, 0.3921569, 0, 1, 1,
0.6421704, 0.4810885, -0.3097767, 0.3960784, 0, 1, 1,
0.6486691, 1.136697, -0.2497726, 0.4039216, 0, 1, 1,
0.6526877, -1.464427, 2.962802, 0.4117647, 0, 1, 1,
0.6562963, -0.04641574, 1.812529, 0.4156863, 0, 1, 1,
0.6609165, -2.163147, 1.091512, 0.4235294, 0, 1, 1,
0.661764, 0.7714265, 0.4642923, 0.427451, 0, 1, 1,
0.6642906, 0.7034463, 0.2823939, 0.4352941, 0, 1, 1,
0.6643434, 0.3911919, 1.27993, 0.4392157, 0, 1, 1,
0.6646466, 2.213446, -0.5296235, 0.4470588, 0, 1, 1,
0.6685914, -1.153036, 3.152827, 0.4509804, 0, 1, 1,
0.6695348, -1.092561, 3.354593, 0.4588235, 0, 1, 1,
0.672621, 1.172813, 0.6673385, 0.4627451, 0, 1, 1,
0.6736969, -0.3491698, 2.572717, 0.4705882, 0, 1, 1,
0.6746077, -1.455408, 0.5981032, 0.4745098, 0, 1, 1,
0.6749683, 0.4503961, 0.9645983, 0.4823529, 0, 1, 1,
0.677005, 0.09301146, 1.422282, 0.4862745, 0, 1, 1,
0.6783487, -1.864856, 2.781239, 0.4941176, 0, 1, 1,
0.6785423, 0.2745224, 0.4553921, 0.5019608, 0, 1, 1,
0.6794949, 1.119412, -0.008561072, 0.5058824, 0, 1, 1,
0.6808069, -0.1460738, -0.7342663, 0.5137255, 0, 1, 1,
0.6836793, 2.646777, 0.6059264, 0.5176471, 0, 1, 1,
0.6935328, 0.2205248, 2.246423, 0.5254902, 0, 1, 1,
0.6948085, 1.283066, 0.9633431, 0.5294118, 0, 1, 1,
0.6980774, -0.4922456, 2.068971, 0.5372549, 0, 1, 1,
0.7030803, -0.802071, 1.746916, 0.5411765, 0, 1, 1,
0.7043275, -0.777003, 2.854751, 0.5490196, 0, 1, 1,
0.7095104, -0.1487495, 1.244088, 0.5529412, 0, 1, 1,
0.7133701, -1.803367, 1.528301, 0.5607843, 0, 1, 1,
0.7137146, -0.4337769, 1.786191, 0.5647059, 0, 1, 1,
0.7152737, 0.2817776, 0.6791602, 0.572549, 0, 1, 1,
0.7184908, -1.621983, 0.9403837, 0.5764706, 0, 1, 1,
0.7257919, -1.809903, 2.033462, 0.5843138, 0, 1, 1,
0.7269729, -0.4057797, 1.37409, 0.5882353, 0, 1, 1,
0.7279953, 0.755441, 0.7561948, 0.5960785, 0, 1, 1,
0.7287305, 1.847363, 1.644346, 0.6039216, 0, 1, 1,
0.7391216, 2.051865, -0.2608945, 0.6078432, 0, 1, 1,
0.7420669, 0.09629389, -1.710593, 0.6156863, 0, 1, 1,
0.74479, -0.6880055, 3.196346, 0.6196079, 0, 1, 1,
0.7458773, 0.6192192, 1.778003, 0.627451, 0, 1, 1,
0.7500947, 0.1454692, 2.90162, 0.6313726, 0, 1, 1,
0.761577, 1.041134, 1.276973, 0.6392157, 0, 1, 1,
0.764328, -2.39127, 4.102234, 0.6431373, 0, 1, 1,
0.7645372, -0.03355166, 1.346363, 0.6509804, 0, 1, 1,
0.7672846, 0.1173322, 1.014477, 0.654902, 0, 1, 1,
0.768824, -1.513791, 3.352901, 0.6627451, 0, 1, 1,
0.7757202, -0.02537451, 1.456414, 0.6666667, 0, 1, 1,
0.7767538, 0.8805271, 0.9453635, 0.6745098, 0, 1, 1,
0.7769526, 0.7110806, 1.409605, 0.6784314, 0, 1, 1,
0.7793747, -0.3568936, 0.6263531, 0.6862745, 0, 1, 1,
0.7821728, 0.08485367, 1.069163, 0.6901961, 0, 1, 1,
0.7842779, 1.412572, 0.4368615, 0.6980392, 0, 1, 1,
0.7885596, -1.013454, 2.695924, 0.7058824, 0, 1, 1,
0.7895322, 0.2560308, 3.903184, 0.7098039, 0, 1, 1,
0.7898837, -0.2088024, 2.343687, 0.7176471, 0, 1, 1,
0.7967649, -0.2744698, 2.235468, 0.7215686, 0, 1, 1,
0.798408, 1.868243, 0.08112005, 0.7294118, 0, 1, 1,
0.8049622, -0.3486577, 2.635551, 0.7333333, 0, 1, 1,
0.819378, -0.2887943, 3.490559, 0.7411765, 0, 1, 1,
0.8236995, -0.1217472, 1.134868, 0.7450981, 0, 1, 1,
0.8263255, -0.2034136, 1.546015, 0.7529412, 0, 1, 1,
0.8310633, -0.1049889, 4.479841, 0.7568628, 0, 1, 1,
0.8387097, -0.7738377, 2.602192, 0.7647059, 0, 1, 1,
0.8404415, -1.583308, 2.066239, 0.7686275, 0, 1, 1,
0.846903, 0.7211447, 1.413125, 0.7764706, 0, 1, 1,
0.8479476, 1.45323, 1.316632, 0.7803922, 0, 1, 1,
0.8589497, 0.3630144, 2.28012, 0.7882353, 0, 1, 1,
0.8607087, 1.26882, 2.064321, 0.7921569, 0, 1, 1,
0.8674445, -1.174749, 3.035697, 0.8, 0, 1, 1,
0.8676415, 0.7596007, 1.763639, 0.8078431, 0, 1, 1,
0.8680937, 0.7869648, -1.625649, 0.8117647, 0, 1, 1,
0.8704284, 0.08792465, 2.062249, 0.8196079, 0, 1, 1,
0.8716123, -0.4687558, 2.804959, 0.8235294, 0, 1, 1,
0.8737232, 0.7248557, 1.536863, 0.8313726, 0, 1, 1,
0.8740842, 0.250566, 2.242093, 0.8352941, 0, 1, 1,
0.874245, -0.06879186, 2.55933, 0.8431373, 0, 1, 1,
0.8811405, 0.9137077, -0.5990192, 0.8470588, 0, 1, 1,
0.881411, 0.9379243, 0.1354656, 0.854902, 0, 1, 1,
0.8821875, 1.493993, 0.4551549, 0.8588235, 0, 1, 1,
0.8873352, -1.401406, 2.018746, 0.8666667, 0, 1, 1,
0.891764, 0.03512949, 1.418335, 0.8705882, 0, 1, 1,
0.8923068, 1.95697, -1.037403, 0.8784314, 0, 1, 1,
0.8970921, 1.205915, 2.761944, 0.8823529, 0, 1, 1,
0.899194, -0.3803189, 1.83363, 0.8901961, 0, 1, 1,
0.9044987, 0.664133, 1.797086, 0.8941177, 0, 1, 1,
0.9107875, 0.09082032, 2.078318, 0.9019608, 0, 1, 1,
0.9220529, 0.5541028, 1.53361, 0.9098039, 0, 1, 1,
0.9269513, -0.8167265, 3.494703, 0.9137255, 0, 1, 1,
0.9364438, 0.209523, 1.564145, 0.9215686, 0, 1, 1,
0.9369283, 0.03459863, 1.554972, 0.9254902, 0, 1, 1,
0.9547018, -0.7969952, 2.291432, 0.9333333, 0, 1, 1,
0.9568979, 0.6261146, 0.7144266, 0.9372549, 0, 1, 1,
0.9607071, 0.4210782, 1.030465, 0.945098, 0, 1, 1,
0.9704955, -0.7557127, 2.704654, 0.9490196, 0, 1, 1,
0.9721823, -0.3970433, 2.063807, 0.9568627, 0, 1, 1,
0.9731706, -0.6765341, 1.735296, 0.9607843, 0, 1, 1,
0.9744535, -0.08667306, 2.452548, 0.9686275, 0, 1, 1,
0.9748229, 0.7769904, -0.8815622, 0.972549, 0, 1, 1,
0.9785617, -0.3716294, 3.025727, 0.9803922, 0, 1, 1,
0.9806598, -0.9640434, 2.785404, 0.9843137, 0, 1, 1,
0.9870561, -1.6209, 3.699292, 0.9921569, 0, 1, 1,
0.9939733, 0.4196871, -0.240295, 0.9960784, 0, 1, 1,
0.9939801, -1.51546, 1.889457, 1, 0, 0.9960784, 1,
0.9955343, -2.381488, 2.459509, 1, 0, 0.9882353, 1,
0.9955965, 1.807122, 1.127371, 1, 0, 0.9843137, 1,
0.9962562, -0.06434458, 1.904317, 1, 0, 0.9764706, 1,
0.9983276, -0.056752, 0.03343151, 1, 0, 0.972549, 1,
1.000026, -0.1640916, 1.709702, 1, 0, 0.9647059, 1,
1.004451, 0.3524852, 2.621496, 1, 0, 0.9607843, 1,
1.012487, -0.04117683, 1.774379, 1, 0, 0.9529412, 1,
1.014785, 0.7255287, 1.206476, 1, 0, 0.9490196, 1,
1.017975, -0.6586712, 1.221779, 1, 0, 0.9411765, 1,
1.019612, 1.43894, -0.2319384, 1, 0, 0.9372549, 1,
1.023729, -0.7503814, 1.247469, 1, 0, 0.9294118, 1,
1.02576, -1.094163, 1.585497, 1, 0, 0.9254902, 1,
1.027759, -0.7379652, 1.919333, 1, 0, 0.9176471, 1,
1.028524, -0.2499059, 1.295462, 1, 0, 0.9137255, 1,
1.039554, -0.6018431, 0.371729, 1, 0, 0.9058824, 1,
1.040873, -0.4154409, 1.568215, 1, 0, 0.9019608, 1,
1.043344, 0.405424, 2.747997, 1, 0, 0.8941177, 1,
1.053894, -1.340381, 1.924099, 1, 0, 0.8862745, 1,
1.060198, -1.358534, 0.8455303, 1, 0, 0.8823529, 1,
1.061388, 1.707916, -1.150114, 1, 0, 0.8745098, 1,
1.073214, -0.4520999, -0.4394846, 1, 0, 0.8705882, 1,
1.075566, 0.6398758, -0.3314331, 1, 0, 0.8627451, 1,
1.075722, -1.233135, 3.491622, 1, 0, 0.8588235, 1,
1.076229, 0.3137541, 1.557491, 1, 0, 0.8509804, 1,
1.077865, 0.382744, -0.09942528, 1, 0, 0.8470588, 1,
1.082505, 1.901348, -1.329279, 1, 0, 0.8392157, 1,
1.088882, 0.6690642, 1.591949, 1, 0, 0.8352941, 1,
1.091672, -1.738754, 3.005651, 1, 0, 0.827451, 1,
1.093724, 0.3080251, 0.4254844, 1, 0, 0.8235294, 1,
1.097906, 0.6389264, 0.1049491, 1, 0, 0.8156863, 1,
1.098243, -0.5949292, 4.36841, 1, 0, 0.8117647, 1,
1.100737, 0.5326152, 1.347524, 1, 0, 0.8039216, 1,
1.110861, -0.4919592, 3.050688, 1, 0, 0.7960784, 1,
1.110875, -0.6253895, 2.142952, 1, 0, 0.7921569, 1,
1.113158, 1.041895, -0.587165, 1, 0, 0.7843137, 1,
1.118406, -0.1837249, 2.219485, 1, 0, 0.7803922, 1,
1.12374, -0.2468797, 1.722544, 1, 0, 0.772549, 1,
1.13192, 0.594715, 1.090117, 1, 0, 0.7686275, 1,
1.145298, 0.3768306, 1.136082, 1, 0, 0.7607843, 1,
1.164766, -0.9592992, 2.457398, 1, 0, 0.7568628, 1,
1.178725, -0.131198, 0.7903013, 1, 0, 0.7490196, 1,
1.183074, 1.074017, 0.2706417, 1, 0, 0.7450981, 1,
1.186955, 1.186345, 0.6445757, 1, 0, 0.7372549, 1,
1.189132, 1.542717, 2.266245, 1, 0, 0.7333333, 1,
1.191487, -1.347975, -0.08053907, 1, 0, 0.7254902, 1,
1.19162, -0.2341011, 1.29299, 1, 0, 0.7215686, 1,
1.192864, 0.1113424, 1.99456, 1, 0, 0.7137255, 1,
1.196442, 0.07589178, 2.103381, 1, 0, 0.7098039, 1,
1.197197, -0.5919462, 3.423755, 1, 0, 0.7019608, 1,
1.208176, -1.882985, 2.209723, 1, 0, 0.6941177, 1,
1.210666, 1.909688, 0.2540271, 1, 0, 0.6901961, 1,
1.211365, 0.8112422, 1.205149, 1, 0, 0.682353, 1,
1.212394, 0.570879, 1.9711, 1, 0, 0.6784314, 1,
1.223926, 0.9915217, -0.3966343, 1, 0, 0.6705883, 1,
1.225505, 0.6651847, -0.09594163, 1, 0, 0.6666667, 1,
1.228194, 0.6160106, 1.871567, 1, 0, 0.6588235, 1,
1.230029, 0.7481646, 0.4848695, 1, 0, 0.654902, 1,
1.231192, -0.278097, 3.492333, 1, 0, 0.6470588, 1,
1.233412, 0.7740543, 1.128227, 1, 0, 0.6431373, 1,
1.241931, -0.4447446, 0.8364503, 1, 0, 0.6352941, 1,
1.245463, -0.7324016, 3.27806, 1, 0, 0.6313726, 1,
1.245912, 0.5968814, 2.739062, 1, 0, 0.6235294, 1,
1.246574, 2.028207, -0.9714606, 1, 0, 0.6196079, 1,
1.258526, 1.192204, 0.35563, 1, 0, 0.6117647, 1,
1.267309, 0.6122604, 1.521072, 1, 0, 0.6078432, 1,
1.275941, 0.1640986, 1.891279, 1, 0, 0.6, 1,
1.276018, -0.8676682, 1.755001, 1, 0, 0.5921569, 1,
1.286595, -0.1966032, 2.934884, 1, 0, 0.5882353, 1,
1.288083, -1.263927, 2.908884, 1, 0, 0.5803922, 1,
1.288274, 0.6717025, 1.228424, 1, 0, 0.5764706, 1,
1.290608, 1.504358, 0.8199859, 1, 0, 0.5686275, 1,
1.299471, 1.116263, 0.4024607, 1, 0, 0.5647059, 1,
1.302974, 0.4116337, 0.7334659, 1, 0, 0.5568628, 1,
1.327998, 1.057092, -0.05327401, 1, 0, 0.5529412, 1,
1.328921, 0.2694479, 1.905442, 1, 0, 0.5450981, 1,
1.332524, 1.459533, 0.9928439, 1, 0, 0.5411765, 1,
1.333225, 0.2799094, 1.985803, 1, 0, 0.5333334, 1,
1.334792, 0.7337222, 0.2218438, 1, 0, 0.5294118, 1,
1.343484, -0.6064636, 1.93645, 1, 0, 0.5215687, 1,
1.34556, -0.6013825, 1.705897, 1, 0, 0.5176471, 1,
1.351914, 0.4865084, 1.571778, 1, 0, 0.509804, 1,
1.357125, 0.2545174, 2.383788, 1, 0, 0.5058824, 1,
1.364564, 0.02452114, 1.528499, 1, 0, 0.4980392, 1,
1.374725, 0.3985674, -0.9273653, 1, 0, 0.4901961, 1,
1.382386, 1.077131, 0.8864465, 1, 0, 0.4862745, 1,
1.383462, -0.119151, 2.311094, 1, 0, 0.4784314, 1,
1.385965, -0.5441553, 1.523672, 1, 0, 0.4745098, 1,
1.391082, 1.617069, -1.351432, 1, 0, 0.4666667, 1,
1.397863, -1.214494, 3.364491, 1, 0, 0.4627451, 1,
1.399643, -0.9140108, 3.03221, 1, 0, 0.454902, 1,
1.412455, 1.506416, 1.652929, 1, 0, 0.4509804, 1,
1.432629, 1.712479, 0.5635486, 1, 0, 0.4431373, 1,
1.444293, -0.1806357, 0.9728187, 1, 0, 0.4392157, 1,
1.469153, 1.896507, 1.338308, 1, 0, 0.4313726, 1,
1.471787, 0.4253512, 0.8007929, 1, 0, 0.427451, 1,
1.487776, 0.3718952, -0.2125852, 1, 0, 0.4196078, 1,
1.488139, 0.9666044, 0.7121865, 1, 0, 0.4156863, 1,
1.488283, -0.0884577, 0.6720629, 1, 0, 0.4078431, 1,
1.489346, 0.05703195, -0.05155447, 1, 0, 0.4039216, 1,
1.505263, -0.2880136, 1.907971, 1, 0, 0.3960784, 1,
1.512051, 1.346549, -0.9308093, 1, 0, 0.3882353, 1,
1.517213, 0.2814941, -0.5827039, 1, 0, 0.3843137, 1,
1.530787, 0.9531907, 1.092888, 1, 0, 0.3764706, 1,
1.547382, 0.2631294, 2.303129, 1, 0, 0.372549, 1,
1.548082, 1.470592, 0.430741, 1, 0, 0.3647059, 1,
1.591655, -0.5923771, 2.800519, 1, 0, 0.3607843, 1,
1.594829, -0.1335524, 2.368717, 1, 0, 0.3529412, 1,
1.596188, 0.33269, 1.271389, 1, 0, 0.3490196, 1,
1.599328, 0.005230222, 1.668174, 1, 0, 0.3411765, 1,
1.599751, -0.3036228, 1.528473, 1, 0, 0.3372549, 1,
1.602931, 2.034449, -2.351588, 1, 0, 0.3294118, 1,
1.628896, -0.7953702, 1.005724, 1, 0, 0.3254902, 1,
1.632789, 0.08253815, 2.202351, 1, 0, 0.3176471, 1,
1.639221, 1.646923, 0.1656817, 1, 0, 0.3137255, 1,
1.646563, 1.310237, 1.343135, 1, 0, 0.3058824, 1,
1.646648, 0.8316044, 0.4498908, 1, 0, 0.2980392, 1,
1.647936, 0.4934818, 2.465584, 1, 0, 0.2941177, 1,
1.651583, 0.2415112, 2.335662, 1, 0, 0.2862745, 1,
1.665844, 0.5101104, 2.812079, 1, 0, 0.282353, 1,
1.668126, -0.8706557, 2.098304, 1, 0, 0.2745098, 1,
1.670693, -0.6048457, 2.436281, 1, 0, 0.2705882, 1,
1.695526, 0.2445368, 1.611618, 1, 0, 0.2627451, 1,
1.698907, -0.09624505, 0.9744727, 1, 0, 0.2588235, 1,
1.721996, -0.5390258, 1.599118, 1, 0, 0.2509804, 1,
1.751753, -0.2293864, 1.683457, 1, 0, 0.2470588, 1,
1.753416, 0.1873925, 0.2556894, 1, 0, 0.2392157, 1,
1.760963, 1.347615, 3.274679, 1, 0, 0.2352941, 1,
1.769201, -1.005517, 2.54468, 1, 0, 0.227451, 1,
1.791255, 0.3638653, 1.056983, 1, 0, 0.2235294, 1,
1.800879, 0.01159106, 1.292096, 1, 0, 0.2156863, 1,
1.801631, -0.178431, 0.5781264, 1, 0, 0.2117647, 1,
1.818959, -0.2264457, 1.852786, 1, 0, 0.2039216, 1,
1.819631, -0.5475312, 3.597726, 1, 0, 0.1960784, 1,
1.821545, 1.396262, -0.2798781, 1, 0, 0.1921569, 1,
1.826079, -1.520052, 2.704756, 1, 0, 0.1843137, 1,
1.853196, 1.005574, 0.9837319, 1, 0, 0.1803922, 1,
1.858439, -1.530905, 0.2617078, 1, 0, 0.172549, 1,
1.879879, 0.1960152, 1.035989, 1, 0, 0.1686275, 1,
1.88009, -3.015427, -1.549293, 1, 0, 0.1607843, 1,
1.894701, -1.349426, 2.76976, 1, 0, 0.1568628, 1,
1.898315, -0.5806569, 1.34287, 1, 0, 0.1490196, 1,
1.929627, -1.727711, 1.526638, 1, 0, 0.145098, 1,
1.944312, -0.3835048, 0.9677921, 1, 0, 0.1372549, 1,
1.950501, 0.4444358, 1.006119, 1, 0, 0.1333333, 1,
1.993663, -1.302151, 2.765179, 1, 0, 0.1254902, 1,
2.016781, 1.143305, 1.087231, 1, 0, 0.1215686, 1,
2.032531, -1.080641, 2.497339, 1, 0, 0.1137255, 1,
2.034664, 1.854803, -0.1044722, 1, 0, 0.1098039, 1,
2.098464, 0.09018773, -0.4628609, 1, 0, 0.1019608, 1,
2.099663, -0.48878, 1.929161, 1, 0, 0.09411765, 1,
2.124544, 1.371309, 0.4662118, 1, 0, 0.09019608, 1,
2.183817, -0.8623809, 1.226687, 1, 0, 0.08235294, 1,
2.21506, -0.2772859, 1.982972, 1, 0, 0.07843138, 1,
2.260384, 0.1722936, -1.209044, 1, 0, 0.07058824, 1,
2.274507, 1.511786, 0.04615761, 1, 0, 0.06666667, 1,
2.332358, -1.098366, 1.865615, 1, 0, 0.05882353, 1,
2.362395, -0.1193666, 2.483299, 1, 0, 0.05490196, 1,
2.384578, 1.480064, 1.23058, 1, 0, 0.04705882, 1,
2.389492, -0.4101723, 1.709359, 1, 0, 0.04313726, 1,
2.484275, 1.739898, 2.393425, 1, 0, 0.03529412, 1,
2.640513, -0.595612, 2.122219, 1, 0, 0.03137255, 1,
2.723877, -0.05732629, 0.8826572, 1, 0, 0.02352941, 1,
2.831333, 0.5340272, 0.7102417, 1, 0, 0.01960784, 1,
2.8482, 0.7123611, 2.591983, 1, 0, 0.01176471, 1,
3.016422, -0.6401995, 1.763361, 1, 0, 0.007843138, 1
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
-0.1324215, -4.139626, -7.309363, 0, -0.5, 0.5, 0.5,
-0.1324215, -4.139626, -7.309363, 1, -0.5, 0.5, 0.5,
-0.1324215, -4.139626, -7.309363, 1, 1.5, 0.5, 0.5,
-0.1324215, -4.139626, -7.309363, 0, 1.5, 0.5, 0.5
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
-4.348723, -0.1222342, -7.309363, 0, -0.5, 0.5, 0.5,
-4.348723, -0.1222342, -7.309363, 1, -0.5, 0.5, 0.5,
-4.348723, -0.1222342, -7.309363, 1, 1.5, 0.5, 0.5,
-4.348723, -0.1222342, -7.309363, 0, 1.5, 0.5, 0.5
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
-4.348723, -4.139626, 0.1553249, 0, -0.5, 0.5, 0.5,
-4.348723, -4.139626, 0.1553249, 1, -0.5, 0.5, 0.5,
-4.348723, -4.139626, 0.1553249, 1, 1.5, 0.5, 0.5,
-4.348723, -4.139626, 0.1553249, 0, 1.5, 0.5, 0.5
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
-3, -3.212536, -5.586743,
3, -3.212536, -5.586743,
-3, -3.212536, -5.586743,
-3, -3.367051, -5.873847,
-2, -3.212536, -5.586743,
-2, -3.367051, -5.873847,
-1, -3.212536, -5.586743,
-1, -3.367051, -5.873847,
0, -3.212536, -5.586743,
0, -3.367051, -5.873847,
1, -3.212536, -5.586743,
1, -3.367051, -5.873847,
2, -3.212536, -5.586743,
2, -3.367051, -5.873847,
3, -3.212536, -5.586743,
3, -3.367051, -5.873847
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
-3, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
-3, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
-3, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
-3, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
-2, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
-2, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
-2, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
-2, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
-1, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
-1, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
-1, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
-1, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
0, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
0, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
0, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
0, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
1, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
1, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
1, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
1, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
2, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
2, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
2, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
2, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5,
3, -3.676081, -6.448053, 0, -0.5, 0.5, 0.5,
3, -3.676081, -6.448053, 1, -0.5, 0.5, 0.5,
3, -3.676081, -6.448053, 1, 1.5, 0.5, 0.5,
3, -3.676081, -6.448053, 0, 1.5, 0.5, 0.5
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
-3.37573, -3, -5.586743,
-3.37573, 2, -5.586743,
-3.37573, -3, -5.586743,
-3.537896, -3, -5.873847,
-3.37573, -2, -5.586743,
-3.537896, -2, -5.873847,
-3.37573, -1, -5.586743,
-3.537896, -1, -5.873847,
-3.37573, 0, -5.586743,
-3.537896, 0, -5.873847,
-3.37573, 1, -5.586743,
-3.537896, 1, -5.873847,
-3.37573, 2, -5.586743,
-3.537896, 2, -5.873847
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
-3.862227, -3, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, -3, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, -3, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, -3, -6.448053, 0, 1.5, 0.5, 0.5,
-3.862227, -2, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, -2, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, -2, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, -2, -6.448053, 0, 1.5, 0.5, 0.5,
-3.862227, -1, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, -1, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, -1, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, -1, -6.448053, 0, 1.5, 0.5, 0.5,
-3.862227, 0, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, 0, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, 0, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, 0, -6.448053, 0, 1.5, 0.5, 0.5,
-3.862227, 1, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, 1, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, 1, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, 1, -6.448053, 0, 1.5, 0.5, 0.5,
-3.862227, 2, -6.448053, 0, -0.5, 0.5, 0.5,
-3.862227, 2, -6.448053, 1, -0.5, 0.5, 0.5,
-3.862227, 2, -6.448053, 1, 1.5, 0.5, 0.5,
-3.862227, 2, -6.448053, 0, 1.5, 0.5, 0.5
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
-3.37573, -3.212536, -4,
-3.37573, -3.212536, 4,
-3.37573, -3.212536, -4,
-3.537896, -3.367051, -4,
-3.37573, -3.212536, -2,
-3.537896, -3.367051, -2,
-3.37573, -3.212536, 0,
-3.537896, -3.367051, 0,
-3.37573, -3.212536, 2,
-3.537896, -3.367051, 2,
-3.37573, -3.212536, 4,
-3.537896, -3.367051, 4
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
-3.862227, -3.676081, -4, 0, -0.5, 0.5, 0.5,
-3.862227, -3.676081, -4, 1, -0.5, 0.5, 0.5,
-3.862227, -3.676081, -4, 1, 1.5, 0.5, 0.5,
-3.862227, -3.676081, -4, 0, 1.5, 0.5, 0.5,
-3.862227, -3.676081, -2, 0, -0.5, 0.5, 0.5,
-3.862227, -3.676081, -2, 1, -0.5, 0.5, 0.5,
-3.862227, -3.676081, -2, 1, 1.5, 0.5, 0.5,
-3.862227, -3.676081, -2, 0, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 0, 0, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 0, 1, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 0, 1, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 0, 0, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 2, 0, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 2, 1, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 2, 1, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 2, 0, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 4, 0, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 4, 1, -0.5, 0.5, 0.5,
-3.862227, -3.676081, 4, 1, 1.5, 0.5, 0.5,
-3.862227, -3.676081, 4, 0, 1.5, 0.5, 0.5
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
-3.37573, -3.212536, -5.586743,
-3.37573, 2.968067, -5.586743,
-3.37573, -3.212536, 5.897393,
-3.37573, 2.968067, 5.897393,
-3.37573, -3.212536, -5.586743,
-3.37573, -3.212536, 5.897393,
-3.37573, 2.968067, -5.586743,
-3.37573, 2.968067, 5.897393,
-3.37573, -3.212536, -5.586743,
3.110887, -3.212536, -5.586743,
-3.37573, -3.212536, 5.897393,
3.110887, -3.212536, 5.897393,
-3.37573, 2.968067, -5.586743,
3.110887, 2.968067, -5.586743,
-3.37573, 2.968067, 5.897393,
3.110887, 2.968067, 5.897393,
3.110887, -3.212536, -5.586743,
3.110887, 2.968067, -5.586743,
3.110887, -3.212536, 5.897393,
3.110887, 2.968067, 5.897393,
3.110887, -3.212536, -5.586743,
3.110887, -3.212536, 5.897393,
3.110887, 2.968067, -5.586743,
3.110887, 2.968067, 5.897393
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
var radius = 7.777835;
var distance = 34.60446;
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
mvMatrix.translate( 0.1324215, 0.1222342, -0.1553249 );
mvMatrix.scale( 1.296446, 1.360635, 0.7322751 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60446);
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
Chlorbufam<-read.table("Chlorbufam.xyz")
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
-3.281265, -0.4934116, -0.5072622, 0, 0, 1, 1, 1,
-3.028075, 0.7781767, -0.7940716, 1, 0, 0, 1, 1,
-2.901121, 2.170998, 0.6064167, 1, 0, 0, 1, 1,
-2.883112, 0.3307465, -2.947402, 1, 0, 0, 1, 1,
-2.75773, -0.9117989, -3.012685, 1, 0, 0, 1, 1,
-2.570615, 0.4417643, -0.1010069, 1, 0, 0, 1, 1,
-2.518514, 0.3156615, -1.236086, 0, 0, 0, 1, 1,
-2.510878, -2.332834, -2.621305, 0, 0, 0, 1, 1,
-2.503751, 0.9777792, -0.262406, 0, 0, 0, 1, 1,
-2.496995, -1.040421, -1.294769, 0, 0, 0, 1, 1,
-2.49232, 1.610933, -1.989373, 0, 0, 0, 1, 1,
-2.463547, 1.711202, -0.9239381, 0, 0, 0, 1, 1,
-2.383142, -0.3551032, -1.740869, 0, 0, 0, 1, 1,
-2.343799, 0.09515911, -0.6209785, 1, 1, 1, 1, 1,
-2.308031, 0.7215587, -1.010715, 1, 1, 1, 1, 1,
-2.255377, 2.648249, -2.430223, 1, 1, 1, 1, 1,
-2.234672, 2.117485, -0.7777426, 1, 1, 1, 1, 1,
-2.193119, -1.571704, -0.4645368, 1, 1, 1, 1, 1,
-2.188347, 1.692759, 1.031056, 1, 1, 1, 1, 1,
-2.166276, -2.329099, -0.8357642, 1, 1, 1, 1, 1,
-2.13044, -1.600968, -2.923593, 1, 1, 1, 1, 1,
-2.104972, 2.281905, -0.7119084, 1, 1, 1, 1, 1,
-2.090539, -0.7087114, -2.466321, 1, 1, 1, 1, 1,
-2.076796, 1.262041, -2.544232, 1, 1, 1, 1, 1,
-2.055746, -0.5440829, -1.602462, 1, 1, 1, 1, 1,
-2.018347, 0.1390358, -2.884738, 1, 1, 1, 1, 1,
-1.977616, 1.230852, -0.4326461, 1, 1, 1, 1, 1,
-1.960415, 1.42884, -1.787233, 1, 1, 1, 1, 1,
-1.945806, 0.1781156, 0.165329, 0, 0, 1, 1, 1,
-1.924949, -0.8946122, -1.831683, 1, 0, 0, 1, 1,
-1.91692, -0.881833, -0.8111065, 1, 0, 0, 1, 1,
-1.905954, 0.5541258, -1.736957, 1, 0, 0, 1, 1,
-1.904196, -0.744826, -2.948191, 1, 0, 0, 1, 1,
-1.87101, 1.321708, -1.750314, 1, 0, 0, 1, 1,
-1.862923, 1.271968, -2.391639, 0, 0, 0, 1, 1,
-1.849497, -0.7035844, -2.381242, 0, 0, 0, 1, 1,
-1.848538, -1.18547, -2.443414, 0, 0, 0, 1, 1,
-1.81631, 0.4474718, -2.796149, 0, 0, 0, 1, 1,
-1.803433, 1.951507, -0.9178881, 0, 0, 0, 1, 1,
-1.789126, 0.1438769, -1.654371, 0, 0, 0, 1, 1,
-1.779623, -0.9712544, -2.18719, 0, 0, 0, 1, 1,
-1.769669, -2.656116, -2.923742, 1, 1, 1, 1, 1,
-1.729765, 0.4857267, -0.3228922, 1, 1, 1, 1, 1,
-1.721557, -0.04332381, -2.063904, 1, 1, 1, 1, 1,
-1.719816, 1.080411, -0.8403901, 1, 1, 1, 1, 1,
-1.704443, -0.2944315, -2.70126, 1, 1, 1, 1, 1,
-1.696312, -0.3353057, -0.9363694, 1, 1, 1, 1, 1,
-1.672968, -0.5223182, -0.7566985, 1, 1, 1, 1, 1,
-1.670761, -1.41449, -3.145963, 1, 1, 1, 1, 1,
-1.669393, 1.11952, -1.117118, 1, 1, 1, 1, 1,
-1.666956, 1.449721, -0.1738274, 1, 1, 1, 1, 1,
-1.666932, -0.9079828, -1.843968, 1, 1, 1, 1, 1,
-1.65639, -1.892234, -2.71071, 1, 1, 1, 1, 1,
-1.647951, 2.878058, 1.125016, 1, 1, 1, 1, 1,
-1.644936, 0.1421543, -1.010552, 1, 1, 1, 1, 1,
-1.620435, -0.3061309, -2.282062, 1, 1, 1, 1, 1,
-1.61474, 2.087806, -2.398536, 0, 0, 1, 1, 1,
-1.60118, 0.4941866, -1.50948, 1, 0, 0, 1, 1,
-1.595598, -0.5522507, -3.599424, 1, 0, 0, 1, 1,
-1.578055, -0.6310391, -2.424609, 1, 0, 0, 1, 1,
-1.576893, 1.82155, -1.023878, 1, 0, 0, 1, 1,
-1.576701, 0.6675819, -0.906005, 1, 0, 0, 1, 1,
-1.5741, 0.4976089, -1.307522, 0, 0, 0, 1, 1,
-1.569348, 0.2004728, -1.158816, 0, 0, 0, 1, 1,
-1.551041, -0.03787354, -0.6674408, 0, 0, 0, 1, 1,
-1.550902, -0.3341522, -0.8218336, 0, 0, 0, 1, 1,
-1.549982, -0.9574642, -3.221962, 0, 0, 0, 1, 1,
-1.536438, 0.5596253, -0.8025173, 0, 0, 0, 1, 1,
-1.528466, 1.05067, -1.324365, 0, 0, 0, 1, 1,
-1.515719, -0.2620445, -1.83498, 1, 1, 1, 1, 1,
-1.514056, 1.845852, -0.1437464, 1, 1, 1, 1, 1,
-1.506599, 1.149057, -0.6758486, 1, 1, 1, 1, 1,
-1.500322, -0.3672016, -1.38354, 1, 1, 1, 1, 1,
-1.490504, 2.279254, -0.2975128, 1, 1, 1, 1, 1,
-1.470992, 0.5485146, -1.39571, 1, 1, 1, 1, 1,
-1.464117, -1.924625, -2.665828, 1, 1, 1, 1, 1,
-1.45736, -0.8289317, -1.710985, 1, 1, 1, 1, 1,
-1.45532, -0.02278039, -2.470637, 1, 1, 1, 1, 1,
-1.455254, -1.023451, -1.168988, 1, 1, 1, 1, 1,
-1.444111, -0.6482344, -3.831524, 1, 1, 1, 1, 1,
-1.440435, 1.186128, -1.14901, 1, 1, 1, 1, 1,
-1.437249, -0.367301, -2.019957, 1, 1, 1, 1, 1,
-1.434006, 0.5713546, -1.580387, 1, 1, 1, 1, 1,
-1.429837, 0.09074455, -2.179472, 1, 1, 1, 1, 1,
-1.423743, -0.7485254, -2.197448, 0, 0, 1, 1, 1,
-1.41507, -0.5063989, -2.497892, 1, 0, 0, 1, 1,
-1.411206, -0.01073458, -0.6173665, 1, 0, 0, 1, 1,
-1.393702, 1.060594, -0.7991376, 1, 0, 0, 1, 1,
-1.384481, 1.831478, -0.9835688, 1, 0, 0, 1, 1,
-1.382132, -1.904182, -2.560223, 1, 0, 0, 1, 1,
-1.37395, 0.7441845, -2.412942, 0, 0, 0, 1, 1,
-1.358844, -0.1480496, -1.166065, 0, 0, 0, 1, 1,
-1.358804, 0.2708855, -2.974301, 0, 0, 0, 1, 1,
-1.352324, -0.9633853, -3.324929, 0, 0, 0, 1, 1,
-1.348073, -0.9522478, -2.722835, 0, 0, 0, 1, 1,
-1.347859, -1.338854, -1.750265, 0, 0, 0, 1, 1,
-1.341918, 0.2047479, -2.567279, 0, 0, 0, 1, 1,
-1.337386, 1.520375, -2.223444, 1, 1, 1, 1, 1,
-1.330356, -0.8655193, 0.7717134, 1, 1, 1, 1, 1,
-1.316787, 0.51459, -0.2682602, 1, 1, 1, 1, 1,
-1.30296, -0.7636184, -2.465078, 1, 1, 1, 1, 1,
-1.290904, -2.327685, -2.374531, 1, 1, 1, 1, 1,
-1.289482, 1.065579, 0.963448, 1, 1, 1, 1, 1,
-1.288763, 0.8136345, -1.141148, 1, 1, 1, 1, 1,
-1.287865, -0.893868, -1.941698, 1, 1, 1, 1, 1,
-1.283833, -1.336297, -1.8362, 1, 1, 1, 1, 1,
-1.269009, 0.785401, -2.274757, 1, 1, 1, 1, 1,
-1.257781, 0.1739422, -3.517697, 1, 1, 1, 1, 1,
-1.252373, 1.26146, -1.431393, 1, 1, 1, 1, 1,
-1.233752, -1.635139, -2.415422, 1, 1, 1, 1, 1,
-1.229904, 1.18939, -1.041871, 1, 1, 1, 1, 1,
-1.221565, 1.117064, -0.1608956, 1, 1, 1, 1, 1,
-1.221349, 1.110138, -0.8123497, 0, 0, 1, 1, 1,
-1.220334, -0.7605595, -2.831382, 1, 0, 0, 1, 1,
-1.219744, 0.9299815, -0.5630626, 1, 0, 0, 1, 1,
-1.211881, 0.7821087, -0.6173031, 1, 0, 0, 1, 1,
-1.205946, 0.8707485, -1.076907, 1, 0, 0, 1, 1,
-1.196954, -0.2472034, -0.4959542, 1, 0, 0, 1, 1,
-1.195196, 1.044014, -2.062379, 0, 0, 0, 1, 1,
-1.189776, -2.098488, -2.46807, 0, 0, 0, 1, 1,
-1.175802, 0.5389208, -0.8148798, 0, 0, 0, 1, 1,
-1.157722, 0.6572371, -0.3355238, 0, 0, 0, 1, 1,
-1.151501, 0.2973228, -1.255721, 0, 0, 0, 1, 1,
-1.150602, 0.6499534, -2.002998, 0, 0, 0, 1, 1,
-1.144278, 0.823795, -1.699135, 0, 0, 0, 1, 1,
-1.143619, 0.04917457, -0.5554299, 1, 1, 1, 1, 1,
-1.140086, -0.8625852, -1.549177, 1, 1, 1, 1, 1,
-1.135174, -0.123672, -1.486312, 1, 1, 1, 1, 1,
-1.131378, 0.5861185, -1.018798, 1, 1, 1, 1, 1,
-1.12989, 0.6892126, -1.543393, 1, 1, 1, 1, 1,
-1.124499, 2.476811, -1.091011, 1, 1, 1, 1, 1,
-1.123068, -0.6632299, -1.747892, 1, 1, 1, 1, 1,
-1.122624, 1.381309, 0.08120515, 1, 1, 1, 1, 1,
-1.116143, 0.2098275, -0.7948168, 1, 1, 1, 1, 1,
-1.111235, 0.04509734, -0.694901, 1, 1, 1, 1, 1,
-1.109654, 0.3265711, -2.404907, 1, 1, 1, 1, 1,
-1.108019, -0.05664096, -2.024373, 1, 1, 1, 1, 1,
-1.099277, -0.2685263, -3.254442, 1, 1, 1, 1, 1,
-1.097765, 0.02115528, -1.679238, 1, 1, 1, 1, 1,
-1.095415, 0.5183792, -0.4196956, 1, 1, 1, 1, 1,
-1.094915, -0.3324859, 1.898661e-06, 0, 0, 1, 1, 1,
-1.083517, 0.1367911, -1.208503, 1, 0, 0, 1, 1,
-1.082327, 0.7965482, -0.005798719, 1, 0, 0, 1, 1,
-1.080385, -0.4876516, -2.407664, 1, 0, 0, 1, 1,
-1.064299, 1.198029, -2.420922, 1, 0, 0, 1, 1,
-1.063129, -0.4622293, -3.399147, 1, 0, 0, 1, 1,
-1.058814, -0.890094, -2.618446, 0, 0, 0, 1, 1,
-1.057624, -1.021653, -2.427756, 0, 0, 0, 1, 1,
-1.05069, 1.560579, -1.070675, 0, 0, 0, 1, 1,
-1.04921, -0.3000695, -1.924313, 0, 0, 0, 1, 1,
-1.0471, -0.385597, -2.371866, 0, 0, 0, 1, 1,
-1.03921, -0.301717, -1.174271, 0, 0, 0, 1, 1,
-1.037661, 1.289735, -1.411191, 0, 0, 0, 1, 1,
-1.026656, 1.081429, -0.1234715, 1, 1, 1, 1, 1,
-1.025043, -0.02690507, -1.631718, 1, 1, 1, 1, 1,
-1.022806, 0.04741375, -1.993775, 1, 1, 1, 1, 1,
-1.019372, 0.07621403, -1.976942, 1, 1, 1, 1, 1,
-1.016165, -0.8171557, -4.660187, 1, 1, 1, 1, 1,
-1.015622, -3.122527, -3.564457, 1, 1, 1, 1, 1,
-0.9966728, -0.9972533, -1.94842, 1, 1, 1, 1, 1,
-0.9869384, -1.815391, -2.043313, 1, 1, 1, 1, 1,
-0.9851951, -1.272489, -2.944836, 1, 1, 1, 1, 1,
-0.9798909, 1.58745, -2.624346, 1, 1, 1, 1, 1,
-0.9781373, 0.9031255, -0.7470964, 1, 1, 1, 1, 1,
-0.9759956, 0.2051324, -2.086652, 1, 1, 1, 1, 1,
-0.9716626, 0.5465741, 0.5021237, 1, 1, 1, 1, 1,
-0.9675614, 0.8358252, -1.2406, 1, 1, 1, 1, 1,
-0.963406, 0.3463398, -2.735758, 1, 1, 1, 1, 1,
-0.9615775, -0.5586907, -3.110396, 0, 0, 1, 1, 1,
-0.9584498, 0.09495074, -0.9068691, 1, 0, 0, 1, 1,
-0.9569539, -1.736844, -4.108355, 1, 0, 0, 1, 1,
-0.9514742, -0.9236441, -2.741386, 1, 0, 0, 1, 1,
-0.9440644, 0.8515208, -0.9799424, 1, 0, 0, 1, 1,
-0.9410858, -0.9033042, -2.924336, 1, 0, 0, 1, 1,
-0.9305764, 1.33569, -0.2909219, 0, 0, 0, 1, 1,
-0.9256065, -0.5366078, -1.37352, 0, 0, 0, 1, 1,
-0.908088, 0.1864186, -0.4333313, 0, 0, 0, 1, 1,
-0.9058493, 0.8906311, -0.9962358, 0, 0, 0, 1, 1,
-0.9019704, 0.1452014, -0.9479669, 0, 0, 0, 1, 1,
-0.890331, 0.9341889, -0.7625678, 0, 0, 0, 1, 1,
-0.8893352, -0.1062367, -1.336779, 0, 0, 0, 1, 1,
-0.8840099, 0.01719731, -0.05680491, 1, 1, 1, 1, 1,
-0.8675126, 0.3483688, -2.230194, 1, 1, 1, 1, 1,
-0.8665208, 0.166122, -1.130402, 1, 1, 1, 1, 1,
-0.8644264, -0.1429488, -1.157114, 1, 1, 1, 1, 1,
-0.8628333, 1.160287, -1.200858, 1, 1, 1, 1, 1,
-0.8541784, 0.2480669, -1.37526, 1, 1, 1, 1, 1,
-0.852713, 1.605458, -0.07510054, 1, 1, 1, 1, 1,
-0.8421106, 0.4124881, -4.605863, 1, 1, 1, 1, 1,
-0.8357572, -1.749583, -4.617609, 1, 1, 1, 1, 1,
-0.8344659, -1.940041, -3.267061, 1, 1, 1, 1, 1,
-0.8319204, -1.655288, -3.460586, 1, 1, 1, 1, 1,
-0.8309468, 0.0135349, -2.279218, 1, 1, 1, 1, 1,
-0.829682, -0.006369401, -3.558284, 1, 1, 1, 1, 1,
-0.8267682, 0.4753469, -0.700877, 1, 1, 1, 1, 1,
-0.8142198, 1.12339, -1.723291, 1, 1, 1, 1, 1,
-0.8129863, -1.531382, -4.496635, 0, 0, 1, 1, 1,
-0.8086268, -0.1763086, -2.050675, 1, 0, 0, 1, 1,
-0.8070713, 1.074448, 0.1821698, 1, 0, 0, 1, 1,
-0.8069897, -0.9007764, -0.748526, 1, 0, 0, 1, 1,
-0.8008785, 2.463918, -1.183448, 1, 0, 0, 1, 1,
-0.7949319, 0.6238835, 0.9442245, 1, 0, 0, 1, 1,
-0.7935991, -0.1629616, 0.6149515, 0, 0, 0, 1, 1,
-0.7872232, -0.5082683, -3.033848, 0, 0, 0, 1, 1,
-0.7844701, -0.3421467, -1.610951, 0, 0, 0, 1, 1,
-0.7781132, 0.5953227, -0.3284294, 0, 0, 0, 1, 1,
-0.7779172, -1.026548, -2.919601, 0, 0, 0, 1, 1,
-0.7775136, -0.7058152, -0.6629555, 0, 0, 0, 1, 1,
-0.7714214, -0.5341368, -2.524794, 0, 0, 0, 1, 1,
-0.7702033, -1.72897, -3.177577, 1, 1, 1, 1, 1,
-0.769483, -0.3966017, -3.486397, 1, 1, 1, 1, 1,
-0.7667036, 0.1050187, -0.7181253, 1, 1, 1, 1, 1,
-0.764283, -1.593591, -3.21539, 1, 1, 1, 1, 1,
-0.7636814, 0.9847725, -0.7409914, 1, 1, 1, 1, 1,
-0.7632605, 0.1278297, -2.316509, 1, 1, 1, 1, 1,
-0.7608531, 0.7470411, -2.42426, 1, 1, 1, 1, 1,
-0.7576352, -0.3406525, -1.52944, 1, 1, 1, 1, 1,
-0.7562805, -0.8277275, -3.870073, 1, 1, 1, 1, 1,
-0.7551948, 1.376888, -4.037259, 1, 1, 1, 1, 1,
-0.7529044, -1.003972, -3.112543, 1, 1, 1, 1, 1,
-0.751302, -0.2051563, -1.298551, 1, 1, 1, 1, 1,
-0.7502625, 1.248509, 0.1426944, 1, 1, 1, 1, 1,
-0.7486452, 0.1418138, -2.957633, 1, 1, 1, 1, 1,
-0.7385351, -1.296405, -2.954366, 1, 1, 1, 1, 1,
-0.7377012, -0.1198452, -0.7298986, 0, 0, 1, 1, 1,
-0.7359857, -0.6817851, -4.477827, 1, 0, 0, 1, 1,
-0.732549, 0.01333543, -1.539259, 1, 0, 0, 1, 1,
-0.7298961, 0.2346332, -0.5288337, 1, 0, 0, 1, 1,
-0.7256663, -1.798242, -4.477745, 1, 0, 0, 1, 1,
-0.7196289, -0.8333691, -1.828859, 1, 0, 0, 1, 1,
-0.7193326, 0.4114145, 0.7296839, 0, 0, 0, 1, 1,
-0.7131099, -1.318996, -3.991738, 0, 0, 0, 1, 1,
-0.712557, -1.991331, -3.481641, 0, 0, 0, 1, 1,
-0.7110119, -0.3253717, -2.989222, 0, 0, 0, 1, 1,
-0.7064497, -0.8202938, -1.882823, 0, 0, 0, 1, 1,
-0.6992652, 0.08735916, -0.01911142, 0, 0, 0, 1, 1,
-0.6919266, 0.3918254, -0.1707339, 0, 0, 0, 1, 1,
-0.6877295, 0.5893373, -1.323905, 1, 1, 1, 1, 1,
-0.6870697, -1.055621, -3.584079, 1, 1, 1, 1, 1,
-0.6850936, 1.15478, 0.09961063, 1, 1, 1, 1, 1,
-0.6689767, -0.7996101, -2.94026, 1, 1, 1, 1, 1,
-0.6651591, -2.048235, -2.798019, 1, 1, 1, 1, 1,
-0.6638507, 0.8300598, -1.631067, 1, 1, 1, 1, 1,
-0.6621687, 1.875521, 0.902681, 1, 1, 1, 1, 1,
-0.6585622, -2.994442, -4.215031, 1, 1, 1, 1, 1,
-0.6572226, -0.9327642, -3.10548, 1, 1, 1, 1, 1,
-0.6425137, 0.4113593, -2.072956, 1, 1, 1, 1, 1,
-0.639517, 1.014273, -1.43332, 1, 1, 1, 1, 1,
-0.6390412, 0.2980095, -0.4987142, 1, 1, 1, 1, 1,
-0.6375487, -1.38081, -3.629314, 1, 1, 1, 1, 1,
-0.6346221, 0.7605717, -0.8758973, 1, 1, 1, 1, 1,
-0.633405, -0.9203382, -3.112233, 1, 1, 1, 1, 1,
-0.6327047, 0.08056015, -2.624753, 0, 0, 1, 1, 1,
-0.6290022, -0.002282226, -2.860231, 1, 0, 0, 1, 1,
-0.6253272, 0.1311039, -2.370019, 1, 0, 0, 1, 1,
-0.6209074, 0.3987784, -0.5161711, 1, 0, 0, 1, 1,
-0.6176061, 0.7389469, -1.787163, 1, 0, 0, 1, 1,
-0.6173381, -0.6497732, -0.2031735, 1, 0, 0, 1, 1,
-0.6152596, -0.188034, -0.2721339, 0, 0, 0, 1, 1,
-0.6147816, -0.6620632, -1.794166, 0, 0, 0, 1, 1,
-0.6125158, 2.053371, -1.043892, 0, 0, 0, 1, 1,
-0.6069847, -1.170665, -4.369494, 0, 0, 0, 1, 1,
-0.6027206, 1.88121, 0.2441813, 0, 0, 0, 1, 1,
-0.6004624, 1.031988, -1.033766, 0, 0, 0, 1, 1,
-0.5949625, 2.609607, 0.6696823, 0, 0, 0, 1, 1,
-0.5918579, -0.07488657, -2.764076, 1, 1, 1, 1, 1,
-0.5898607, -1.326532, -2.738131, 1, 1, 1, 1, 1,
-0.5867646, -0.6762554, -3.237911, 1, 1, 1, 1, 1,
-0.5845007, 0.9537677, -2.209412, 1, 1, 1, 1, 1,
-0.5816055, 0.006717284, -3.202139, 1, 1, 1, 1, 1,
-0.5781946, 0.2550599, -1.696236, 1, 1, 1, 1, 1,
-0.5780007, 1.280238, -0.9038548, 1, 1, 1, 1, 1,
-0.5779303, -0.4142745, -1.723502, 1, 1, 1, 1, 1,
-0.574947, 2.834462, 0.9532316, 1, 1, 1, 1, 1,
-0.5664182, 1.442974, 0.7827363, 1, 1, 1, 1, 1,
-0.5644461, 0.1420436, -1.482132, 1, 1, 1, 1, 1,
-0.5639801, 0.7673781, -1.369019, 1, 1, 1, 1, 1,
-0.5635256, -0.432909, -1.71695, 1, 1, 1, 1, 1,
-0.5627663, 1.954051, -0.4857632, 1, 1, 1, 1, 1,
-0.5614074, 0.3804919, -2.819914, 1, 1, 1, 1, 1,
-0.5585143, -0.1197499, -1.719946, 0, 0, 1, 1, 1,
-0.5563402, -0.2954598, -1.058014, 1, 0, 0, 1, 1,
-0.5519611, 0.04213143, -1.946483, 1, 0, 0, 1, 1,
-0.548936, 0.06497988, -1.478326, 1, 0, 0, 1, 1,
-0.547671, 2.103664, 0.1015037, 1, 0, 0, 1, 1,
-0.5456253, 1.197725, -0.8707468, 1, 0, 0, 1, 1,
-0.5413357, -0.8156163, -2.156558, 0, 0, 0, 1, 1,
-0.5412344, 1.033039, 0.9238293, 0, 0, 0, 1, 1,
-0.5396116, 0.4586936, -0.982114, 0, 0, 0, 1, 1,
-0.5323443, 1.218516, -1.103981, 0, 0, 0, 1, 1,
-0.5313743, 0.2893757, -1.342427, 0, 0, 0, 1, 1,
-0.5310786, -0.344478, -3.605527, 0, 0, 0, 1, 1,
-0.5300585, -0.5774276, -1.828641, 0, 0, 0, 1, 1,
-0.5296389, -1.434265, -1.852845, 1, 1, 1, 1, 1,
-0.5263449, -0.3933654, -2.487687, 1, 1, 1, 1, 1,
-0.52522, 0.2849894, -2.430043, 1, 1, 1, 1, 1,
-0.5143398, -0.3700612, -3.038291, 1, 1, 1, 1, 1,
-0.5076743, -1.028135, -2.526176, 1, 1, 1, 1, 1,
-0.5006771, 0.7326587, -1.276952, 1, 1, 1, 1, 1,
-0.5006617, -1.021713, -4.049491, 1, 1, 1, 1, 1,
-0.4974942, -1.171793, -4.758514, 1, 1, 1, 1, 1,
-0.4958417, 0.9025142, -1.353087, 1, 1, 1, 1, 1,
-0.4949459, -0.5231634, -0.2618597, 1, 1, 1, 1, 1,
-0.4948077, 0.1781943, -1.817528, 1, 1, 1, 1, 1,
-0.4944317, -1.051587, -3.483037, 1, 1, 1, 1, 1,
-0.4932962, 1.062798, -0.09045447, 1, 1, 1, 1, 1,
-0.4928299, 0.5776187, -0.3301564, 1, 1, 1, 1, 1,
-0.4913198, -0.8782536, -4.410461, 1, 1, 1, 1, 1,
-0.4863342, 1.762335, 1.132706, 0, 0, 1, 1, 1,
-0.4851967, -1.086312, -2.815648, 1, 0, 0, 1, 1,
-0.4804953, -0.3979441, -4.780584, 1, 0, 0, 1, 1,
-0.4788976, -0.5548686, -2.268887, 1, 0, 0, 1, 1,
-0.4714898, -0.05750284, -1.727133, 1, 0, 0, 1, 1,
-0.4714849, -0.3238662, -1.127069, 1, 0, 0, 1, 1,
-0.4710052, 1.428313, 0.03890359, 0, 0, 0, 1, 1,
-0.4698941, 0.9384397, 0.1982879, 0, 0, 0, 1, 1,
-0.4667157, -1.307245, -1.736353, 0, 0, 0, 1, 1,
-0.4659382, -0.919625, -2.70361, 0, 0, 0, 1, 1,
-0.4591219, 0.6481681, -0.6530092, 0, 0, 0, 1, 1,
-0.4590092, 0.9541516, -0.5149287, 0, 0, 0, 1, 1,
-0.4571288, 0.4014217, -0.5846685, 0, 0, 0, 1, 1,
-0.4548795, 0.1317131, -0.2713298, 1, 1, 1, 1, 1,
-0.4548061, 0.2131499, -0.7928531, 1, 1, 1, 1, 1,
-0.4504149, 1.469606, -0.1300747, 1, 1, 1, 1, 1,
-0.4473448, -0.668946, -1.70341, 1, 1, 1, 1, 1,
-0.4472117, 0.9882183, -1.434682, 1, 1, 1, 1, 1,
-0.4468099, 2.161735, -0.6559784, 1, 1, 1, 1, 1,
-0.4465913, -0.670772, -3.717242, 1, 1, 1, 1, 1,
-0.4433772, 1.332626, 0.4947913, 1, 1, 1, 1, 1,
-0.4422763, 0.5558221, -0.3812723, 1, 1, 1, 1, 1,
-0.4357471, 0.4118412, -1.108868, 1, 1, 1, 1, 1,
-0.433627, -0.9187639, -1.866247, 1, 1, 1, 1, 1,
-0.4304129, 0.3196355, -1.795877, 1, 1, 1, 1, 1,
-0.4244792, -0.8177924, -2.789634, 1, 1, 1, 1, 1,
-0.4230125, -0.06345253, -2.042073, 1, 1, 1, 1, 1,
-0.4224843, 0.3557864, 1.624476, 1, 1, 1, 1, 1,
-0.4201029, -0.5813128, -2.548992, 0, 0, 1, 1, 1,
-0.4176171, -0.832276, -4.91272, 1, 0, 0, 1, 1,
-0.4167953, -0.8777393, -3.376395, 1, 0, 0, 1, 1,
-0.4131298, 0.1253598, -0.3129209, 1, 0, 0, 1, 1,
-0.4124393, 0.8933292, 0.3235326, 1, 0, 0, 1, 1,
-0.4093779, 0.7416494, 0.8829788, 1, 0, 0, 1, 1,
-0.4059998, 2.365068, -0.2076422, 0, 0, 0, 1, 1,
-0.3995377, -0.9786065, -2.850946, 0, 0, 0, 1, 1,
-0.3932548, 0.1812556, -2.192551, 0, 0, 0, 1, 1,
-0.390334, -1.328731, -5.419498, 0, 0, 0, 1, 1,
-0.3889048, 1.715131, 0.2730749, 0, 0, 0, 1, 1,
-0.3792676, -0.2285165, -1.36466, 0, 0, 0, 1, 1,
-0.3792279, -0.02578417, -3.398579, 0, 0, 0, 1, 1,
-0.3762991, 1.332392, 1.550467, 1, 1, 1, 1, 1,
-0.3719936, -0.1574515, -0.5991627, 1, 1, 1, 1, 1,
-0.3663364, 0.2704777, 0.4831684, 1, 1, 1, 1, 1,
-0.3643368, -0.9330484, -1.671035, 1, 1, 1, 1, 1,
-0.3622536, 1.089461, -1.057125, 1, 1, 1, 1, 1,
-0.3611082, -0.2417602, -1.94384, 1, 1, 1, 1, 1,
-0.3570226, -0.4953434, -1.038609, 1, 1, 1, 1, 1,
-0.3524293, -1.053055, -1.427615, 1, 1, 1, 1, 1,
-0.3490607, 1.349851, -0.3887213, 1, 1, 1, 1, 1,
-0.3489417, -1.278007, -1.464787, 1, 1, 1, 1, 1,
-0.3481919, 0.8032098, -1.210747, 1, 1, 1, 1, 1,
-0.34774, 1.462514, 1.693023, 1, 1, 1, 1, 1,
-0.3476793, -0.2166156, -1.820952, 1, 1, 1, 1, 1,
-0.3437732, -1.054774, -3.370997, 1, 1, 1, 1, 1,
-0.3341976, -1.352976, -1.174608, 1, 1, 1, 1, 1,
-0.3322127, 0.4512663, -0.8963624, 0, 0, 1, 1, 1,
-0.3281422, -1.46002, -4.728254, 1, 0, 0, 1, 1,
-0.3204742, -0.6641113, -2.038726, 1, 0, 0, 1, 1,
-0.3184592, -1.81574, -4.291292, 1, 0, 0, 1, 1,
-0.3133626, -0.08805785, -2.289964, 1, 0, 0, 1, 1,
-0.3088294, -0.5811719, -2.940624, 1, 0, 0, 1, 1,
-0.3067584, -2.089244, -2.987568, 0, 0, 0, 1, 1,
-0.3059539, -0.2836914, -3.40058, 0, 0, 0, 1, 1,
-0.3036353, -0.2303919, -1.940868, 0, 0, 0, 1, 1,
-0.296775, 0.4509399, -0.8182006, 0, 0, 0, 1, 1,
-0.2963147, 2.310717, 0.7340121, 0, 0, 0, 1, 1,
-0.2962705, 0.4767538, -0.8437327, 0, 0, 0, 1, 1,
-0.2937765, -0.4244399, -1.757364, 0, 0, 0, 1, 1,
-0.2927638, 1.341165, 0.3024237, 1, 1, 1, 1, 1,
-0.2925439, 0.01698096, -1.444025, 1, 1, 1, 1, 1,
-0.2902994, -0.4243117, -3.346452, 1, 1, 1, 1, 1,
-0.2902803, 0.1414135, -2.444305, 1, 1, 1, 1, 1,
-0.2893369, -0.2547463, -2.499393, 1, 1, 1, 1, 1,
-0.2855148, -0.4434468, -3.347892, 1, 1, 1, 1, 1,
-0.2853091, 0.4847766, -0.3100438, 1, 1, 1, 1, 1,
-0.2848846, -0.7809961, -3.251532, 1, 1, 1, 1, 1,
-0.2843878, -0.3097723, -1.447443, 1, 1, 1, 1, 1,
-0.2836083, 0.6489009, -2.753475, 1, 1, 1, 1, 1,
-0.2800033, 1.813421, -0.25945, 1, 1, 1, 1, 1,
-0.2782929, -0.5830907, -3.196339, 1, 1, 1, 1, 1,
-0.2765708, 0.1393225, 1.073327, 1, 1, 1, 1, 1,
-0.2732271, 1.016727, -0.9589501, 1, 1, 1, 1, 1,
-0.2732131, -0.2698775, -1.546357, 1, 1, 1, 1, 1,
-0.2727571, 0.1734202, -0.3970385, 0, 0, 1, 1, 1,
-0.262646, 0.1978792, -1.650066, 1, 0, 0, 1, 1,
-0.2593672, -0.5831394, -1.514331, 1, 0, 0, 1, 1,
-0.2575481, 1.265587, -0.3504863, 1, 0, 0, 1, 1,
-0.2571427, -0.05426189, -0.6309258, 1, 0, 0, 1, 1,
-0.254033, -0.8770556, -2.498458, 1, 0, 0, 1, 1,
-0.2466491, 0.03969585, -1.303947, 0, 0, 0, 1, 1,
-0.2442918, 1.027767, -1.452405, 0, 0, 0, 1, 1,
-0.2407941, 1.146095, 0.2831682, 0, 0, 0, 1, 1,
-0.2383982, 0.1628393, -1.310924, 0, 0, 0, 1, 1,
-0.2380143, -0.6927782, -3.550798, 0, 0, 0, 1, 1,
-0.2370362, 1.565219, 2.412832, 0, 0, 0, 1, 1,
-0.235482, -0.8017385, -3.850246, 0, 0, 0, 1, 1,
-0.235434, -0.5436195, -3.817866, 1, 1, 1, 1, 1,
-0.2348541, 1.029038, 0.7816532, 1, 1, 1, 1, 1,
-0.2346414, -0.779863, -2.273333, 1, 1, 1, 1, 1,
-0.2325458, 0.5988083, -0.9139153, 1, 1, 1, 1, 1,
-0.2307757, 0.2871494, -0.9470243, 1, 1, 1, 1, 1,
-0.2293966, 1.011973, 0.4290433, 1, 1, 1, 1, 1,
-0.2257935, -0.4642888, -3.409461, 1, 1, 1, 1, 1,
-0.2257539, 1.315219, -0.3186913, 1, 1, 1, 1, 1,
-0.21783, -0.7437906, -1.504088, 1, 1, 1, 1, 1,
-0.2144718, 1.510491, 0.6736517, 1, 1, 1, 1, 1,
-0.2101913, -2.003808, -1.601236, 1, 1, 1, 1, 1,
-0.2090811, 1.851316, -1.111167, 1, 1, 1, 1, 1,
-0.2024447, -0.3327124, -2.74682, 1, 1, 1, 1, 1,
-0.1992622, -0.9384685, -1.120465, 1, 1, 1, 1, 1,
-0.1976135, 0.2404137, -0.3761415, 1, 1, 1, 1, 1,
-0.1972412, -0.8957897, -3.208355, 0, 0, 1, 1, 1,
-0.1887708, 0.8580651, -0.3315096, 1, 0, 0, 1, 1,
-0.1883177, -1.574461, -3.339568, 1, 0, 0, 1, 1,
-0.1855381, 1.155223, 0.2025949, 1, 0, 0, 1, 1,
-0.1791442, -1.106582, -4.504316, 1, 0, 0, 1, 1,
-0.1778796, 0.005095674, -1.554648, 1, 0, 0, 1, 1,
-0.1763974, 0.3201197, -0.2686663, 0, 0, 0, 1, 1,
-0.1749899, -0.7345916, -2.905396, 0, 0, 0, 1, 1,
-0.1731031, 0.08647217, -1.20924, 0, 0, 0, 1, 1,
-0.1725716, -0.8074664, -3.949175, 0, 0, 0, 1, 1,
-0.1717542, 1.536468, 1.458154, 0, 0, 0, 1, 1,
-0.1706421, 0.3743762, 0.5117106, 0, 0, 0, 1, 1,
-0.1688497, -0.7539347, -2.050397, 0, 0, 0, 1, 1,
-0.1678795, -0.8408116, -2.299, 1, 1, 1, 1, 1,
-0.1661771, 0.5761061, -1.356649, 1, 1, 1, 1, 1,
-0.165777, 0.1664549, -3.163685, 1, 1, 1, 1, 1,
-0.1650813, -2.475081, -2.620744, 1, 1, 1, 1, 1,
-0.162851, 1.449024, 0.7660813, 1, 1, 1, 1, 1,
-0.1616124, -0.5639594, -3.123719, 1, 1, 1, 1, 1,
-0.1598951, 0.4667911, 0.8161824, 1, 1, 1, 1, 1,
-0.1550871, 2.322562, -0.9675795, 1, 1, 1, 1, 1,
-0.1524979, 1.049416, -0.5815161, 1, 1, 1, 1, 1,
-0.1516192, -0.3460416, -2.909241, 1, 1, 1, 1, 1,
-0.1489221, 2.079854, -1.286548, 1, 1, 1, 1, 1,
-0.1463019, 0.2634723, 2.346428, 1, 1, 1, 1, 1,
-0.1406513, -0.3343205, -2.274909, 1, 1, 1, 1, 1,
-0.1405187, 2.475913, -0.1340176, 1, 1, 1, 1, 1,
-0.1350529, -1.102342, -3.633419, 1, 1, 1, 1, 1,
-0.1343773, -0.01492466, -2.144507, 0, 0, 1, 1, 1,
-0.1332616, -0.5300136, -2.460697, 1, 0, 0, 1, 1,
-0.1298088, 0.6726658, 0.2276336, 1, 0, 0, 1, 1,
-0.1291457, -0.02702704, -2.602702, 1, 0, 0, 1, 1,
-0.1289695, -1.499009, -3.900543, 1, 0, 0, 1, 1,
-0.1283072, 0.5868114, -0.424431, 1, 0, 0, 1, 1,
-0.1282376, 1.632336, -0.1236442, 0, 0, 0, 1, 1,
-0.1209403, -1.862768, -2.798288, 0, 0, 0, 1, 1,
-0.114397, -0.3487314, -3.247394, 0, 0, 0, 1, 1,
-0.1134572, -1.175301, -1.655321, 0, 0, 0, 1, 1,
-0.1092524, -2.005451, -3.039462, 0, 0, 0, 1, 1,
-0.108171, -0.5552385, -2.98031, 0, 0, 0, 1, 1,
-0.1056361, 0.203382, 0.3580682, 0, 0, 0, 1, 1,
-0.1033205, 1.710293, 0.03190826, 1, 1, 1, 1, 1,
-0.1026371, 1.456371, -0.1334605, 1, 1, 1, 1, 1,
-0.1022714, 0.1194507, -1.988888, 1, 1, 1, 1, 1,
-0.1008546, -0.3105522, -3.309034, 1, 1, 1, 1, 1,
-0.09719256, -2.111845, -4.217722, 1, 1, 1, 1, 1,
-0.09329539, -0.3507725, -2.73535, 1, 1, 1, 1, 1,
-0.08701846, 0.04525371, -1.429716, 1, 1, 1, 1, 1,
-0.0829051, -0.2852082, -2.855368, 1, 1, 1, 1, 1,
-0.08285615, -0.1228488, -3.303149, 1, 1, 1, 1, 1,
-0.08265699, -0.6418448, -1.188936, 1, 1, 1, 1, 1,
-0.08173812, -0.1640025, -4.53246, 1, 1, 1, 1, 1,
-0.07549802, -0.1180087, -3.041701, 1, 1, 1, 1, 1,
-0.07439378, 1.356931, 0.4375888, 1, 1, 1, 1, 1,
-0.06920023, -0.5470208, -2.851098, 1, 1, 1, 1, 1,
-0.06910426, -0.2497499, -3.475578, 1, 1, 1, 1, 1,
-0.06249015, 0.2751894, -0.9830997, 0, 0, 1, 1, 1,
-0.05789557, 1.599938, -0.8224057, 1, 0, 0, 1, 1,
-0.05712319, -0.6351734, -2.125457, 1, 0, 0, 1, 1,
-0.05674966, 0.2219312, 0.3694367, 1, 0, 0, 1, 1,
-0.0553022, 0.4420805, 1.01221, 1, 0, 0, 1, 1,
-0.05522369, 0.1303665, -0.0706673, 1, 0, 0, 1, 1,
-0.05056783, -0.7681696, -3.402467, 0, 0, 0, 1, 1,
-0.04916518, -1.478792, -5.295958, 0, 0, 0, 1, 1,
-0.04642534, -1.089352, -3.796163, 0, 0, 0, 1, 1,
-0.04506443, -2.301467, -4.579279, 0, 0, 0, 1, 1,
-0.04416203, -1.723319, -2.441738, 0, 0, 0, 1, 1,
-0.03942034, -0.1412044, -1.548086, 0, 0, 0, 1, 1,
-0.03922944, 0.08500867, -1.346938, 0, 0, 0, 1, 1,
-0.03497338, 0.1813604, -0.3616361, 1, 1, 1, 1, 1,
-0.03173858, -1.108107, -3.337611, 1, 1, 1, 1, 1,
-0.02827822, 0.247489, -0.5468143, 1, 1, 1, 1, 1,
-0.02707799, 1.596685, 0.3925947, 1, 1, 1, 1, 1,
-0.02649969, 1.978337, -0.02437589, 1, 1, 1, 1, 1,
-0.02474045, -0.927773, -4.793599, 1, 1, 1, 1, 1,
-0.02078298, -0.04437364, -3.502624, 1, 1, 1, 1, 1,
-0.02028625, 0.433224, 0.0871538, 1, 1, 1, 1, 1,
-0.01864944, 0.8208157, -0.585304, 1, 1, 1, 1, 1,
-0.01748627, -0.3344519, -2.31886, 1, 1, 1, 1, 1,
-0.01607765, -1.448821, -2.901731, 1, 1, 1, 1, 1,
-0.01576835, -0.619893, -4.518375, 1, 1, 1, 1, 1,
-0.01415949, -1.069884, -2.986273, 1, 1, 1, 1, 1,
-0.01012897, -2.237232, -3.45278, 1, 1, 1, 1, 1,
-0.009607978, -0.4656245, -1.674123, 1, 1, 1, 1, 1,
-0.003993642, 0.5717064, 1.445678, 0, 0, 1, 1, 1,
-0.002537447, 1.250689, -0.4970614, 1, 0, 0, 1, 1,
0.006543244, 0.098724, -0.6987522, 1, 0, 0, 1, 1,
0.01098229, 1.19076, 1.450921, 1, 0, 0, 1, 1,
0.01749293, 1.344793, -0.7263503, 1, 0, 0, 1, 1,
0.02069554, -0.9060982, 3.142814, 1, 0, 0, 1, 1,
0.0216479, -0.8042823, 2.726438, 0, 0, 0, 1, 1,
0.02394612, -0.817515, 3.572616, 0, 0, 0, 1, 1,
0.02547025, 1.579029, 1.844519, 0, 0, 0, 1, 1,
0.0286928, 0.4746276, -0.5286653, 0, 0, 0, 1, 1,
0.02934248, -0.7095261, 4.082793, 0, 0, 0, 1, 1,
0.04176851, 1.396789, -1.618335, 0, 0, 0, 1, 1,
0.04272131, -0.254939, 2.220421, 0, 0, 0, 1, 1,
0.04317186, 0.4741977, 0.8589415, 1, 1, 1, 1, 1,
0.05000298, -1.37063, 2.870333, 1, 1, 1, 1, 1,
0.05067472, -0.01691753, 1.610437, 1, 1, 1, 1, 1,
0.0525489, -1.706772, 2.979728, 1, 1, 1, 1, 1,
0.05613535, 2.462472, -0.2616904, 1, 1, 1, 1, 1,
0.05801937, 1.427864, -1.401464, 1, 1, 1, 1, 1,
0.06047429, -2.379674, 1.970888, 1, 1, 1, 1, 1,
0.06577826, 1.772375, 2.742385, 1, 1, 1, 1, 1,
0.06793667, -0.3411057, 4.446856, 1, 1, 1, 1, 1,
0.06866357, 1.607768, 1.341988, 1, 1, 1, 1, 1,
0.06956435, -0.04714828, 2.829942, 1, 1, 1, 1, 1,
0.07074403, 1.055788, 0.5489237, 1, 1, 1, 1, 1,
0.07314648, -0.8429143, 2.273117, 1, 1, 1, 1, 1,
0.07315877, -0.4024611, 2.42949, 1, 1, 1, 1, 1,
0.07374858, 0.4474032, -0.6161911, 1, 1, 1, 1, 1,
0.07609433, -0.6286242, 3.454263, 0, 0, 1, 1, 1,
0.078212, -0.3474613, 2.152808, 1, 0, 0, 1, 1,
0.07951357, -0.8142112, 2.566176, 1, 0, 0, 1, 1,
0.08589265, 0.9360723, 1.924956, 1, 0, 0, 1, 1,
0.08781715, 1.14369, 0.05928996, 1, 0, 0, 1, 1,
0.08783724, 0.5099112, -0.262069, 1, 0, 0, 1, 1,
0.09074787, -0.03083386, 3.384751, 0, 0, 0, 1, 1,
0.0944095, -1.222274, 2.582139, 0, 0, 0, 1, 1,
0.09462211, -0.9400507, 2.205358, 0, 0, 0, 1, 1,
0.1000358, 0.7774808, -0.6436427, 0, 0, 0, 1, 1,
0.1023778, 0.3197348, -0.7570336, 0, 0, 0, 1, 1,
0.1118018, 0.1739975, -0.1500897, 0, 0, 0, 1, 1,
0.1126979, -0.7072867, 2.525554, 0, 0, 0, 1, 1,
0.1167568, -1.254901, 3.424967, 1, 1, 1, 1, 1,
0.1170197, -0.7662444, 4.693561, 1, 1, 1, 1, 1,
0.1176023, -0.1919017, 2.445696, 1, 1, 1, 1, 1,
0.12644, -0.3178047, 3.901831, 1, 1, 1, 1, 1,
0.127402, 1.124221, -0.2892021, 1, 1, 1, 1, 1,
0.1282318, 1.871517, 0.4735236, 1, 1, 1, 1, 1,
0.131782, -0.5233325, 4.272242, 1, 1, 1, 1, 1,
0.1318464, -0.7659072, 2.115246, 1, 1, 1, 1, 1,
0.13854, -1.083582, 1.988572, 1, 1, 1, 1, 1,
0.1403044, 1.044053, -0.6864726, 1, 1, 1, 1, 1,
0.1406258, 1.512918, 0.4212833, 1, 1, 1, 1, 1,
0.1502697, 0.05595244, 1.303883, 1, 1, 1, 1, 1,
0.153852, -0.4623421, 2.949763, 1, 1, 1, 1, 1,
0.1568199, -1.569951, 2.490146, 1, 1, 1, 1, 1,
0.159918, -0.08929759, 1.307031, 1, 1, 1, 1, 1,
0.1693029, 1.149132, 0.277816, 0, 0, 1, 1, 1,
0.1757978, 1.452843, -0.5016124, 1, 0, 0, 1, 1,
0.183632, -0.3722173, 1.333563, 1, 0, 0, 1, 1,
0.1850635, 0.1919344, -0.3059242, 1, 0, 0, 1, 1,
0.1862254, -0.1981358, 3.107472, 1, 0, 0, 1, 1,
0.1864238, -1.874104, 3.490309, 1, 0, 0, 1, 1,
0.1881322, -1.724385, 3.841405, 0, 0, 0, 1, 1,
0.1887669, -0.3725965, 2.829472, 0, 0, 0, 1, 1,
0.1889817, 0.01195495, 0.7943096, 0, 0, 0, 1, 1,
0.1895898, -0.501616, 2.944311, 0, 0, 0, 1, 1,
0.1930624, 1.301693, -1.009726, 0, 0, 0, 1, 1,
0.1954233, 0.2139198, 0.1444509, 0, 0, 0, 1, 1,
0.1962075, -1.431724, 3.386619, 0, 0, 0, 1, 1,
0.2065975, 1.180317, 0.3568291, 1, 1, 1, 1, 1,
0.2093602, -0.4416577, 2.59861, 1, 1, 1, 1, 1,
0.210936, 0.3196458, 1.088495, 1, 1, 1, 1, 1,
0.2127688, 0.2166565, 0.567364, 1, 1, 1, 1, 1,
0.2137952, -1.922391, 2.5242, 1, 1, 1, 1, 1,
0.2162717, 0.8746223, 1.02625, 1, 1, 1, 1, 1,
0.2208997, 1.672629, -0.3157183, 1, 1, 1, 1, 1,
0.22254, -0.1278166, 5.264364, 1, 1, 1, 1, 1,
0.2246834, 1.800798, -0.09765857, 1, 1, 1, 1, 1,
0.226607, 0.2609348, -0.1267798, 1, 1, 1, 1, 1,
0.228002, 0.1341663, 0.1915181, 1, 1, 1, 1, 1,
0.2285016, 0.04695009, 0.6864712, 1, 1, 1, 1, 1,
0.2293415, 0.03386468, 1.583706, 1, 1, 1, 1, 1,
0.2324667, -0.3712982, 2.262954, 1, 1, 1, 1, 1,
0.2340254, 1.291856, 0.676452, 1, 1, 1, 1, 1,
0.242229, 1.316322, -1.32516, 0, 0, 1, 1, 1,
0.2449092, 0.7249505, 0.8537916, 1, 0, 0, 1, 1,
0.2459958, -1.328311, 2.877898, 1, 0, 0, 1, 1,
0.2516479, 0.07450334, 3.029694, 1, 0, 0, 1, 1,
0.2538338, -0.5748537, 2.153881, 1, 0, 0, 1, 1,
0.2549667, 0.6210769, -0.3553228, 1, 0, 0, 1, 1,
0.2560212, -0.947015, 2.190341, 0, 0, 0, 1, 1,
0.2578133, -0.0466297, 2.782633, 0, 0, 0, 1, 1,
0.2578174, -0.8947544, 5.730148, 0, 0, 0, 1, 1,
0.2579889, 0.5914801, -0.2034826, 0, 0, 0, 1, 1,
0.2618633, 0.7034748, 0.4942, 0, 0, 0, 1, 1,
0.2672442, 0.04423798, 0.2744319, 0, 0, 0, 1, 1,
0.2690344, 0.4407966, -1.232962, 0, 0, 0, 1, 1,
0.2710299, 0.1659029, 0.9340644, 1, 1, 1, 1, 1,
0.2742313, 0.6425147, 0.8938376, 1, 1, 1, 1, 1,
0.2798382, 0.7263061, -0.03125622, 1, 1, 1, 1, 1,
0.2829043, -1.154051, 2.226747, 1, 1, 1, 1, 1,
0.2849602, -1.542741, 3.320114, 1, 1, 1, 1, 1,
0.289306, 0.02912918, 1.22888, 1, 1, 1, 1, 1,
0.2915628, 0.1591917, 3.918974, 1, 1, 1, 1, 1,
0.2953612, 0.8904202, -0.2188397, 1, 1, 1, 1, 1,
0.2984595, -1.327547, 3.012307, 1, 1, 1, 1, 1,
0.2984847, -0.919948, 1.91249, 1, 1, 1, 1, 1,
0.2988384, 0.7138478, 1.728388, 1, 1, 1, 1, 1,
0.2990193, -0.5209162, 3.566445, 1, 1, 1, 1, 1,
0.2994323, 0.6972857, 0.3261901, 1, 1, 1, 1, 1,
0.3008614, 1.316473, -2.623096, 1, 1, 1, 1, 1,
0.3023025, 0.2496662, 1.82305, 1, 1, 1, 1, 1,
0.3038501, -0.006001486, 2.99026, 0, 0, 1, 1, 1,
0.304368, -0.8268771, 1.762392, 1, 0, 0, 1, 1,
0.3062876, -0.4525527, 2.782196, 1, 0, 0, 1, 1,
0.3136736, -0.3618847, 2.069592, 1, 0, 0, 1, 1,
0.3157303, -0.9711293, 2.486791, 1, 0, 0, 1, 1,
0.3201438, 0.9184767, 1.599054, 1, 0, 0, 1, 1,
0.3227251, -0.4195304, 2.487663, 0, 0, 0, 1, 1,
0.3243757, -0.4083681, 4.723787, 0, 0, 0, 1, 1,
0.3267806, -0.9519604, 2.929418, 0, 0, 0, 1, 1,
0.3319182, -0.2279289, 0.7107533, 0, 0, 0, 1, 1,
0.3375013, 1.11797, 0.3085387, 0, 0, 0, 1, 1,
0.3435431, -0.5311113, 3.109213, 0, 0, 0, 1, 1,
0.3480252, -0.2933742, 4.050379, 0, 0, 0, 1, 1,
0.3526976, 0.1767021, 0.5930495, 1, 1, 1, 1, 1,
0.358089, 1.705564, 0.8654628, 1, 1, 1, 1, 1,
0.3596365, -0.6075143, 3.959809, 1, 1, 1, 1, 1,
0.3655728, 0.0545119, 2.870392, 1, 1, 1, 1, 1,
0.3682927, 0.9073955, -0.6498961, 1, 1, 1, 1, 1,
0.3696846, 1.818218, 0.3484533, 1, 1, 1, 1, 1,
0.3710011, 1.368766, -0.1093072, 1, 1, 1, 1, 1,
0.3737044, 0.2828917, 1.708731, 1, 1, 1, 1, 1,
0.3739871, -1.152748, 4.116971, 1, 1, 1, 1, 1,
0.3765593, -1.090653, 2.384672, 1, 1, 1, 1, 1,
0.3767692, -0.6146431, 3.021114, 1, 1, 1, 1, 1,
0.3782293, 1.175222, 0.8092675, 1, 1, 1, 1, 1,
0.3787878, -1.460011, 3.191179, 1, 1, 1, 1, 1,
0.3835841, -1.498209, 3.757766, 1, 1, 1, 1, 1,
0.3840956, 0.9592394, -1.959493, 1, 1, 1, 1, 1,
0.3844538, 1.525471, -2.102747, 0, 0, 1, 1, 1,
0.3903601, 1.346999, 0.8020377, 1, 0, 0, 1, 1,
0.392506, 0.9948208, 1.833608, 1, 0, 0, 1, 1,
0.3952579, 0.9797815, -0.0449581, 1, 0, 0, 1, 1,
0.3975797, -1.167978, 1.537238, 1, 0, 0, 1, 1,
0.3981763, -0.799757, 3.573782, 1, 0, 0, 1, 1,
0.398304, -0.2386662, 2.75632, 0, 0, 0, 1, 1,
0.3984105, 1.902272, -0.5668163, 0, 0, 0, 1, 1,
0.4005477, -0.3223754, 2.26126, 0, 0, 0, 1, 1,
0.4020565, -0.7756812, 3.820826, 0, 0, 0, 1, 1,
0.4042902, -1.037211, 3.024912, 0, 0, 0, 1, 1,
0.4068555, 1.125642, 1.913414, 0, 0, 0, 1, 1,
0.4074889, -0.05837814, 2.173607, 0, 0, 0, 1, 1,
0.4132268, -1.304388, 1.2611, 1, 1, 1, 1, 1,
0.4161778, -0.4288218, 4.779408, 1, 1, 1, 1, 1,
0.4164991, 0.9000144, -0.6042933, 1, 1, 1, 1, 1,
0.4274834, -0.2726232, 3.049667, 1, 1, 1, 1, 1,
0.4300112, 0.5336815, 1.469334, 1, 1, 1, 1, 1,
0.4319521, -0.8927075, 3.657186, 1, 1, 1, 1, 1,
0.4391077, -0.1197001, 1.316356, 1, 1, 1, 1, 1,
0.4415309, 1.148998, -0.5523615, 1, 1, 1, 1, 1,
0.4432504, -1.788616, 3.240009, 1, 1, 1, 1, 1,
0.4438166, -2.167503, 5.036164, 1, 1, 1, 1, 1,
0.4458338, 1.782818, -2.09355, 1, 1, 1, 1, 1,
0.4518832, 0.7711905, -1.861694, 1, 1, 1, 1, 1,
0.4525328, -0.3032165, 1.711396, 1, 1, 1, 1, 1,
0.4549377, -1.204342, -0.008798468, 1, 1, 1, 1, 1,
0.4554045, 0.7245524, -1.053147, 1, 1, 1, 1, 1,
0.4554824, -0.02845209, 2.484465, 0, 0, 1, 1, 1,
0.4587017, -1.934465, 3.624466, 1, 0, 0, 1, 1,
0.4627079, -0.1849002, 1.579718, 1, 0, 0, 1, 1,
0.4732218, -0.116233, 3.270443, 1, 0, 0, 1, 1,
0.4770714, 1.210416, -0.7781277, 1, 0, 0, 1, 1,
0.4795922, -0.4221803, 2.714586, 1, 0, 0, 1, 1,
0.4805593, 0.5186783, 1.109789, 0, 0, 0, 1, 1,
0.4816775, 1.14129, -1.16175, 0, 0, 0, 1, 1,
0.4926512, -1.292208, 3.104253, 0, 0, 0, 1, 1,
0.492864, 1.923907, -0.3626462, 0, 0, 0, 1, 1,
0.4946012, 0.1454142, 2.167688, 0, 0, 0, 1, 1,
0.4959614, -1.303317, 3.750822, 0, 0, 0, 1, 1,
0.4989526, 0.4091848, 0.2311798, 0, 0, 0, 1, 1,
0.5009759, 0.668149, 1.760996, 1, 1, 1, 1, 1,
0.5024264, 1.22504, 1.195676, 1, 1, 1, 1, 1,
0.5052044, -0.7001395, 2.712766, 1, 1, 1, 1, 1,
0.5052441, 0.7966911, 1.538265, 1, 1, 1, 1, 1,
0.5080013, 0.5579659, 0.8413572, 1, 1, 1, 1, 1,
0.5084733, 0.3826059, 1.150735, 1, 1, 1, 1, 1,
0.5087759, 0.5777628, 0.2448061, 1, 1, 1, 1, 1,
0.5136384, -1.335625, 2.162818, 1, 1, 1, 1, 1,
0.5149837, 1.458639, -0.8385763, 1, 1, 1, 1, 1,
0.5183522, 0.06689557, 0.1586448, 1, 1, 1, 1, 1,
0.5188869, -0.43153, 5.237868, 1, 1, 1, 1, 1,
0.5210394, 0.453947, -1.3844, 1, 1, 1, 1, 1,
0.5229889, 1.247834, -0.6024829, 1, 1, 1, 1, 1,
0.5243193, -0.02083004, 1.562189, 1, 1, 1, 1, 1,
0.5270144, 1.958829, 1.461709, 1, 1, 1, 1, 1,
0.5279425, 1.057501, 1.600883, 0, 0, 1, 1, 1,
0.5299427, -3.864592e-05, 2.35745, 1, 0, 0, 1, 1,
0.5310054, -2.232672, 2.229407, 1, 0, 0, 1, 1,
0.5316942, -0.9435315, 4.768993, 1, 0, 0, 1, 1,
0.5373212, 0.06186017, 1.95553, 1, 0, 0, 1, 1,
0.5375834, -1.480555, 2.195282, 1, 0, 0, 1, 1,
0.5507068, 0.6144041, 1.308799, 0, 0, 0, 1, 1,
0.5543912, -0.4196065, 0.6598187, 0, 0, 0, 1, 1,
0.5663267, -1.523504, 4.732905, 0, 0, 0, 1, 1,
0.5665394, 0.7912945, 0.1601643, 0, 0, 0, 1, 1,
0.5691257, -1.742202, 1.821668, 0, 0, 0, 1, 1,
0.569853, -0.2888348, 2.029105, 0, 0, 0, 1, 1,
0.5713343, -0.6864668, 2.300347, 0, 0, 0, 1, 1,
0.5719827, 1.204836, 0.4206344, 1, 1, 1, 1, 1,
0.5796552, 1.056699, -0.1778739, 1, 1, 1, 1, 1,
0.5806414, -1.392153, 3.305088, 1, 1, 1, 1, 1,
0.5887168, 0.8065651, 1.498734, 1, 1, 1, 1, 1,
0.5910122, 0.9199452, 2.613396, 1, 1, 1, 1, 1,
0.5940167, -0.3703195, 0.641135, 1, 1, 1, 1, 1,
0.5945472, -0.7094781, 2.466241, 1, 1, 1, 1, 1,
0.5946447, 0.2267476, 1.809524, 1, 1, 1, 1, 1,
0.6016914, 0.8876796, 0.1480819, 1, 1, 1, 1, 1,
0.6082049, 0.6487514, 1.559101, 1, 1, 1, 1, 1,
0.6097796, -0.5886589, 2.429452, 1, 1, 1, 1, 1,
0.6130794, 1.0166, 2.095843, 1, 1, 1, 1, 1,
0.6178502, 0.5843138, 1.967443, 1, 1, 1, 1, 1,
0.6203156, -0.2778463, 2.849237, 1, 1, 1, 1, 1,
0.6222201, -0.07899292, -0.5738575, 1, 1, 1, 1, 1,
0.6225637, 0.3208743, 1.804614, 0, 0, 1, 1, 1,
0.625066, -0.9969198, 1.699859, 1, 0, 0, 1, 1,
0.6258932, 0.2794062, 2.180494, 1, 0, 0, 1, 1,
0.6293503, -1.201701, 0.1833412, 1, 0, 0, 1, 1,
0.6345639, -0.1942455, 3.364773, 1, 0, 0, 1, 1,
0.6421704, 0.4810885, -0.3097767, 1, 0, 0, 1, 1,
0.6486691, 1.136697, -0.2497726, 0, 0, 0, 1, 1,
0.6526877, -1.464427, 2.962802, 0, 0, 0, 1, 1,
0.6562963, -0.04641574, 1.812529, 0, 0, 0, 1, 1,
0.6609165, -2.163147, 1.091512, 0, 0, 0, 1, 1,
0.661764, 0.7714265, 0.4642923, 0, 0, 0, 1, 1,
0.6642906, 0.7034463, 0.2823939, 0, 0, 0, 1, 1,
0.6643434, 0.3911919, 1.27993, 0, 0, 0, 1, 1,
0.6646466, 2.213446, -0.5296235, 1, 1, 1, 1, 1,
0.6685914, -1.153036, 3.152827, 1, 1, 1, 1, 1,
0.6695348, -1.092561, 3.354593, 1, 1, 1, 1, 1,
0.672621, 1.172813, 0.6673385, 1, 1, 1, 1, 1,
0.6736969, -0.3491698, 2.572717, 1, 1, 1, 1, 1,
0.6746077, -1.455408, 0.5981032, 1, 1, 1, 1, 1,
0.6749683, 0.4503961, 0.9645983, 1, 1, 1, 1, 1,
0.677005, 0.09301146, 1.422282, 1, 1, 1, 1, 1,
0.6783487, -1.864856, 2.781239, 1, 1, 1, 1, 1,
0.6785423, 0.2745224, 0.4553921, 1, 1, 1, 1, 1,
0.6794949, 1.119412, -0.008561072, 1, 1, 1, 1, 1,
0.6808069, -0.1460738, -0.7342663, 1, 1, 1, 1, 1,
0.6836793, 2.646777, 0.6059264, 1, 1, 1, 1, 1,
0.6935328, 0.2205248, 2.246423, 1, 1, 1, 1, 1,
0.6948085, 1.283066, 0.9633431, 1, 1, 1, 1, 1,
0.6980774, -0.4922456, 2.068971, 0, 0, 1, 1, 1,
0.7030803, -0.802071, 1.746916, 1, 0, 0, 1, 1,
0.7043275, -0.777003, 2.854751, 1, 0, 0, 1, 1,
0.7095104, -0.1487495, 1.244088, 1, 0, 0, 1, 1,
0.7133701, -1.803367, 1.528301, 1, 0, 0, 1, 1,
0.7137146, -0.4337769, 1.786191, 1, 0, 0, 1, 1,
0.7152737, 0.2817776, 0.6791602, 0, 0, 0, 1, 1,
0.7184908, -1.621983, 0.9403837, 0, 0, 0, 1, 1,
0.7257919, -1.809903, 2.033462, 0, 0, 0, 1, 1,
0.7269729, -0.4057797, 1.37409, 0, 0, 0, 1, 1,
0.7279953, 0.755441, 0.7561948, 0, 0, 0, 1, 1,
0.7287305, 1.847363, 1.644346, 0, 0, 0, 1, 1,
0.7391216, 2.051865, -0.2608945, 0, 0, 0, 1, 1,
0.7420669, 0.09629389, -1.710593, 1, 1, 1, 1, 1,
0.74479, -0.6880055, 3.196346, 1, 1, 1, 1, 1,
0.7458773, 0.6192192, 1.778003, 1, 1, 1, 1, 1,
0.7500947, 0.1454692, 2.90162, 1, 1, 1, 1, 1,
0.761577, 1.041134, 1.276973, 1, 1, 1, 1, 1,
0.764328, -2.39127, 4.102234, 1, 1, 1, 1, 1,
0.7645372, -0.03355166, 1.346363, 1, 1, 1, 1, 1,
0.7672846, 0.1173322, 1.014477, 1, 1, 1, 1, 1,
0.768824, -1.513791, 3.352901, 1, 1, 1, 1, 1,
0.7757202, -0.02537451, 1.456414, 1, 1, 1, 1, 1,
0.7767538, 0.8805271, 0.9453635, 1, 1, 1, 1, 1,
0.7769526, 0.7110806, 1.409605, 1, 1, 1, 1, 1,
0.7793747, -0.3568936, 0.6263531, 1, 1, 1, 1, 1,
0.7821728, 0.08485367, 1.069163, 1, 1, 1, 1, 1,
0.7842779, 1.412572, 0.4368615, 1, 1, 1, 1, 1,
0.7885596, -1.013454, 2.695924, 0, 0, 1, 1, 1,
0.7895322, 0.2560308, 3.903184, 1, 0, 0, 1, 1,
0.7898837, -0.2088024, 2.343687, 1, 0, 0, 1, 1,
0.7967649, -0.2744698, 2.235468, 1, 0, 0, 1, 1,
0.798408, 1.868243, 0.08112005, 1, 0, 0, 1, 1,
0.8049622, -0.3486577, 2.635551, 1, 0, 0, 1, 1,
0.819378, -0.2887943, 3.490559, 0, 0, 0, 1, 1,
0.8236995, -0.1217472, 1.134868, 0, 0, 0, 1, 1,
0.8263255, -0.2034136, 1.546015, 0, 0, 0, 1, 1,
0.8310633, -0.1049889, 4.479841, 0, 0, 0, 1, 1,
0.8387097, -0.7738377, 2.602192, 0, 0, 0, 1, 1,
0.8404415, -1.583308, 2.066239, 0, 0, 0, 1, 1,
0.846903, 0.7211447, 1.413125, 0, 0, 0, 1, 1,
0.8479476, 1.45323, 1.316632, 1, 1, 1, 1, 1,
0.8589497, 0.3630144, 2.28012, 1, 1, 1, 1, 1,
0.8607087, 1.26882, 2.064321, 1, 1, 1, 1, 1,
0.8674445, -1.174749, 3.035697, 1, 1, 1, 1, 1,
0.8676415, 0.7596007, 1.763639, 1, 1, 1, 1, 1,
0.8680937, 0.7869648, -1.625649, 1, 1, 1, 1, 1,
0.8704284, 0.08792465, 2.062249, 1, 1, 1, 1, 1,
0.8716123, -0.4687558, 2.804959, 1, 1, 1, 1, 1,
0.8737232, 0.7248557, 1.536863, 1, 1, 1, 1, 1,
0.8740842, 0.250566, 2.242093, 1, 1, 1, 1, 1,
0.874245, -0.06879186, 2.55933, 1, 1, 1, 1, 1,
0.8811405, 0.9137077, -0.5990192, 1, 1, 1, 1, 1,
0.881411, 0.9379243, 0.1354656, 1, 1, 1, 1, 1,
0.8821875, 1.493993, 0.4551549, 1, 1, 1, 1, 1,
0.8873352, -1.401406, 2.018746, 1, 1, 1, 1, 1,
0.891764, 0.03512949, 1.418335, 0, 0, 1, 1, 1,
0.8923068, 1.95697, -1.037403, 1, 0, 0, 1, 1,
0.8970921, 1.205915, 2.761944, 1, 0, 0, 1, 1,
0.899194, -0.3803189, 1.83363, 1, 0, 0, 1, 1,
0.9044987, 0.664133, 1.797086, 1, 0, 0, 1, 1,
0.9107875, 0.09082032, 2.078318, 1, 0, 0, 1, 1,
0.9220529, 0.5541028, 1.53361, 0, 0, 0, 1, 1,
0.9269513, -0.8167265, 3.494703, 0, 0, 0, 1, 1,
0.9364438, 0.209523, 1.564145, 0, 0, 0, 1, 1,
0.9369283, 0.03459863, 1.554972, 0, 0, 0, 1, 1,
0.9547018, -0.7969952, 2.291432, 0, 0, 0, 1, 1,
0.9568979, 0.6261146, 0.7144266, 0, 0, 0, 1, 1,
0.9607071, 0.4210782, 1.030465, 0, 0, 0, 1, 1,
0.9704955, -0.7557127, 2.704654, 1, 1, 1, 1, 1,
0.9721823, -0.3970433, 2.063807, 1, 1, 1, 1, 1,
0.9731706, -0.6765341, 1.735296, 1, 1, 1, 1, 1,
0.9744535, -0.08667306, 2.452548, 1, 1, 1, 1, 1,
0.9748229, 0.7769904, -0.8815622, 1, 1, 1, 1, 1,
0.9785617, -0.3716294, 3.025727, 1, 1, 1, 1, 1,
0.9806598, -0.9640434, 2.785404, 1, 1, 1, 1, 1,
0.9870561, -1.6209, 3.699292, 1, 1, 1, 1, 1,
0.9939733, 0.4196871, -0.240295, 1, 1, 1, 1, 1,
0.9939801, -1.51546, 1.889457, 1, 1, 1, 1, 1,
0.9955343, -2.381488, 2.459509, 1, 1, 1, 1, 1,
0.9955965, 1.807122, 1.127371, 1, 1, 1, 1, 1,
0.9962562, -0.06434458, 1.904317, 1, 1, 1, 1, 1,
0.9983276, -0.056752, 0.03343151, 1, 1, 1, 1, 1,
1.000026, -0.1640916, 1.709702, 1, 1, 1, 1, 1,
1.004451, 0.3524852, 2.621496, 0, 0, 1, 1, 1,
1.012487, -0.04117683, 1.774379, 1, 0, 0, 1, 1,
1.014785, 0.7255287, 1.206476, 1, 0, 0, 1, 1,
1.017975, -0.6586712, 1.221779, 1, 0, 0, 1, 1,
1.019612, 1.43894, -0.2319384, 1, 0, 0, 1, 1,
1.023729, -0.7503814, 1.247469, 1, 0, 0, 1, 1,
1.02576, -1.094163, 1.585497, 0, 0, 0, 1, 1,
1.027759, -0.7379652, 1.919333, 0, 0, 0, 1, 1,
1.028524, -0.2499059, 1.295462, 0, 0, 0, 1, 1,
1.039554, -0.6018431, 0.371729, 0, 0, 0, 1, 1,
1.040873, -0.4154409, 1.568215, 0, 0, 0, 1, 1,
1.043344, 0.405424, 2.747997, 0, 0, 0, 1, 1,
1.053894, -1.340381, 1.924099, 0, 0, 0, 1, 1,
1.060198, -1.358534, 0.8455303, 1, 1, 1, 1, 1,
1.061388, 1.707916, -1.150114, 1, 1, 1, 1, 1,
1.073214, -0.4520999, -0.4394846, 1, 1, 1, 1, 1,
1.075566, 0.6398758, -0.3314331, 1, 1, 1, 1, 1,
1.075722, -1.233135, 3.491622, 1, 1, 1, 1, 1,
1.076229, 0.3137541, 1.557491, 1, 1, 1, 1, 1,
1.077865, 0.382744, -0.09942528, 1, 1, 1, 1, 1,
1.082505, 1.901348, -1.329279, 1, 1, 1, 1, 1,
1.088882, 0.6690642, 1.591949, 1, 1, 1, 1, 1,
1.091672, -1.738754, 3.005651, 1, 1, 1, 1, 1,
1.093724, 0.3080251, 0.4254844, 1, 1, 1, 1, 1,
1.097906, 0.6389264, 0.1049491, 1, 1, 1, 1, 1,
1.098243, -0.5949292, 4.36841, 1, 1, 1, 1, 1,
1.100737, 0.5326152, 1.347524, 1, 1, 1, 1, 1,
1.110861, -0.4919592, 3.050688, 1, 1, 1, 1, 1,
1.110875, -0.6253895, 2.142952, 0, 0, 1, 1, 1,
1.113158, 1.041895, -0.587165, 1, 0, 0, 1, 1,
1.118406, -0.1837249, 2.219485, 1, 0, 0, 1, 1,
1.12374, -0.2468797, 1.722544, 1, 0, 0, 1, 1,
1.13192, 0.594715, 1.090117, 1, 0, 0, 1, 1,
1.145298, 0.3768306, 1.136082, 1, 0, 0, 1, 1,
1.164766, -0.9592992, 2.457398, 0, 0, 0, 1, 1,
1.178725, -0.131198, 0.7903013, 0, 0, 0, 1, 1,
1.183074, 1.074017, 0.2706417, 0, 0, 0, 1, 1,
1.186955, 1.186345, 0.6445757, 0, 0, 0, 1, 1,
1.189132, 1.542717, 2.266245, 0, 0, 0, 1, 1,
1.191487, -1.347975, -0.08053907, 0, 0, 0, 1, 1,
1.19162, -0.2341011, 1.29299, 0, 0, 0, 1, 1,
1.192864, 0.1113424, 1.99456, 1, 1, 1, 1, 1,
1.196442, 0.07589178, 2.103381, 1, 1, 1, 1, 1,
1.197197, -0.5919462, 3.423755, 1, 1, 1, 1, 1,
1.208176, -1.882985, 2.209723, 1, 1, 1, 1, 1,
1.210666, 1.909688, 0.2540271, 1, 1, 1, 1, 1,
1.211365, 0.8112422, 1.205149, 1, 1, 1, 1, 1,
1.212394, 0.570879, 1.9711, 1, 1, 1, 1, 1,
1.223926, 0.9915217, -0.3966343, 1, 1, 1, 1, 1,
1.225505, 0.6651847, -0.09594163, 1, 1, 1, 1, 1,
1.228194, 0.6160106, 1.871567, 1, 1, 1, 1, 1,
1.230029, 0.7481646, 0.4848695, 1, 1, 1, 1, 1,
1.231192, -0.278097, 3.492333, 1, 1, 1, 1, 1,
1.233412, 0.7740543, 1.128227, 1, 1, 1, 1, 1,
1.241931, -0.4447446, 0.8364503, 1, 1, 1, 1, 1,
1.245463, -0.7324016, 3.27806, 1, 1, 1, 1, 1,
1.245912, 0.5968814, 2.739062, 0, 0, 1, 1, 1,
1.246574, 2.028207, -0.9714606, 1, 0, 0, 1, 1,
1.258526, 1.192204, 0.35563, 1, 0, 0, 1, 1,
1.267309, 0.6122604, 1.521072, 1, 0, 0, 1, 1,
1.275941, 0.1640986, 1.891279, 1, 0, 0, 1, 1,
1.276018, -0.8676682, 1.755001, 1, 0, 0, 1, 1,
1.286595, -0.1966032, 2.934884, 0, 0, 0, 1, 1,
1.288083, -1.263927, 2.908884, 0, 0, 0, 1, 1,
1.288274, 0.6717025, 1.228424, 0, 0, 0, 1, 1,
1.290608, 1.504358, 0.8199859, 0, 0, 0, 1, 1,
1.299471, 1.116263, 0.4024607, 0, 0, 0, 1, 1,
1.302974, 0.4116337, 0.7334659, 0, 0, 0, 1, 1,
1.327998, 1.057092, -0.05327401, 0, 0, 0, 1, 1,
1.328921, 0.2694479, 1.905442, 1, 1, 1, 1, 1,
1.332524, 1.459533, 0.9928439, 1, 1, 1, 1, 1,
1.333225, 0.2799094, 1.985803, 1, 1, 1, 1, 1,
1.334792, 0.7337222, 0.2218438, 1, 1, 1, 1, 1,
1.343484, -0.6064636, 1.93645, 1, 1, 1, 1, 1,
1.34556, -0.6013825, 1.705897, 1, 1, 1, 1, 1,
1.351914, 0.4865084, 1.571778, 1, 1, 1, 1, 1,
1.357125, 0.2545174, 2.383788, 1, 1, 1, 1, 1,
1.364564, 0.02452114, 1.528499, 1, 1, 1, 1, 1,
1.374725, 0.3985674, -0.9273653, 1, 1, 1, 1, 1,
1.382386, 1.077131, 0.8864465, 1, 1, 1, 1, 1,
1.383462, -0.119151, 2.311094, 1, 1, 1, 1, 1,
1.385965, -0.5441553, 1.523672, 1, 1, 1, 1, 1,
1.391082, 1.617069, -1.351432, 1, 1, 1, 1, 1,
1.397863, -1.214494, 3.364491, 1, 1, 1, 1, 1,
1.399643, -0.9140108, 3.03221, 0, 0, 1, 1, 1,
1.412455, 1.506416, 1.652929, 1, 0, 0, 1, 1,
1.432629, 1.712479, 0.5635486, 1, 0, 0, 1, 1,
1.444293, -0.1806357, 0.9728187, 1, 0, 0, 1, 1,
1.469153, 1.896507, 1.338308, 1, 0, 0, 1, 1,
1.471787, 0.4253512, 0.8007929, 1, 0, 0, 1, 1,
1.487776, 0.3718952, -0.2125852, 0, 0, 0, 1, 1,
1.488139, 0.9666044, 0.7121865, 0, 0, 0, 1, 1,
1.488283, -0.0884577, 0.6720629, 0, 0, 0, 1, 1,
1.489346, 0.05703195, -0.05155447, 0, 0, 0, 1, 1,
1.505263, -0.2880136, 1.907971, 0, 0, 0, 1, 1,
1.512051, 1.346549, -0.9308093, 0, 0, 0, 1, 1,
1.517213, 0.2814941, -0.5827039, 0, 0, 0, 1, 1,
1.530787, 0.9531907, 1.092888, 1, 1, 1, 1, 1,
1.547382, 0.2631294, 2.303129, 1, 1, 1, 1, 1,
1.548082, 1.470592, 0.430741, 1, 1, 1, 1, 1,
1.591655, -0.5923771, 2.800519, 1, 1, 1, 1, 1,
1.594829, -0.1335524, 2.368717, 1, 1, 1, 1, 1,
1.596188, 0.33269, 1.271389, 1, 1, 1, 1, 1,
1.599328, 0.005230222, 1.668174, 1, 1, 1, 1, 1,
1.599751, -0.3036228, 1.528473, 1, 1, 1, 1, 1,
1.602931, 2.034449, -2.351588, 1, 1, 1, 1, 1,
1.628896, -0.7953702, 1.005724, 1, 1, 1, 1, 1,
1.632789, 0.08253815, 2.202351, 1, 1, 1, 1, 1,
1.639221, 1.646923, 0.1656817, 1, 1, 1, 1, 1,
1.646563, 1.310237, 1.343135, 1, 1, 1, 1, 1,
1.646648, 0.8316044, 0.4498908, 1, 1, 1, 1, 1,
1.647936, 0.4934818, 2.465584, 1, 1, 1, 1, 1,
1.651583, 0.2415112, 2.335662, 0, 0, 1, 1, 1,
1.665844, 0.5101104, 2.812079, 1, 0, 0, 1, 1,
1.668126, -0.8706557, 2.098304, 1, 0, 0, 1, 1,
1.670693, -0.6048457, 2.436281, 1, 0, 0, 1, 1,
1.695526, 0.2445368, 1.611618, 1, 0, 0, 1, 1,
1.698907, -0.09624505, 0.9744727, 1, 0, 0, 1, 1,
1.721996, -0.5390258, 1.599118, 0, 0, 0, 1, 1,
1.751753, -0.2293864, 1.683457, 0, 0, 0, 1, 1,
1.753416, 0.1873925, 0.2556894, 0, 0, 0, 1, 1,
1.760963, 1.347615, 3.274679, 0, 0, 0, 1, 1,
1.769201, -1.005517, 2.54468, 0, 0, 0, 1, 1,
1.791255, 0.3638653, 1.056983, 0, 0, 0, 1, 1,
1.800879, 0.01159106, 1.292096, 0, 0, 0, 1, 1,
1.801631, -0.178431, 0.5781264, 1, 1, 1, 1, 1,
1.818959, -0.2264457, 1.852786, 1, 1, 1, 1, 1,
1.819631, -0.5475312, 3.597726, 1, 1, 1, 1, 1,
1.821545, 1.396262, -0.2798781, 1, 1, 1, 1, 1,
1.826079, -1.520052, 2.704756, 1, 1, 1, 1, 1,
1.853196, 1.005574, 0.9837319, 1, 1, 1, 1, 1,
1.858439, -1.530905, 0.2617078, 1, 1, 1, 1, 1,
1.879879, 0.1960152, 1.035989, 1, 1, 1, 1, 1,
1.88009, -3.015427, -1.549293, 1, 1, 1, 1, 1,
1.894701, -1.349426, 2.76976, 1, 1, 1, 1, 1,
1.898315, -0.5806569, 1.34287, 1, 1, 1, 1, 1,
1.929627, -1.727711, 1.526638, 1, 1, 1, 1, 1,
1.944312, -0.3835048, 0.9677921, 1, 1, 1, 1, 1,
1.950501, 0.4444358, 1.006119, 1, 1, 1, 1, 1,
1.993663, -1.302151, 2.765179, 1, 1, 1, 1, 1,
2.016781, 1.143305, 1.087231, 0, 0, 1, 1, 1,
2.032531, -1.080641, 2.497339, 1, 0, 0, 1, 1,
2.034664, 1.854803, -0.1044722, 1, 0, 0, 1, 1,
2.098464, 0.09018773, -0.4628609, 1, 0, 0, 1, 1,
2.099663, -0.48878, 1.929161, 1, 0, 0, 1, 1,
2.124544, 1.371309, 0.4662118, 1, 0, 0, 1, 1,
2.183817, -0.8623809, 1.226687, 0, 0, 0, 1, 1,
2.21506, -0.2772859, 1.982972, 0, 0, 0, 1, 1,
2.260384, 0.1722936, -1.209044, 0, 0, 0, 1, 1,
2.274507, 1.511786, 0.04615761, 0, 0, 0, 1, 1,
2.332358, -1.098366, 1.865615, 0, 0, 0, 1, 1,
2.362395, -0.1193666, 2.483299, 0, 0, 0, 1, 1,
2.384578, 1.480064, 1.23058, 0, 0, 0, 1, 1,
2.389492, -0.4101723, 1.709359, 1, 1, 1, 1, 1,
2.484275, 1.739898, 2.393425, 1, 1, 1, 1, 1,
2.640513, -0.595612, 2.122219, 1, 1, 1, 1, 1,
2.723877, -0.05732629, 0.8826572, 1, 1, 1, 1, 1,
2.831333, 0.5340272, 0.7102417, 1, 1, 1, 1, 1,
2.8482, 0.7123611, 2.591983, 1, 1, 1, 1, 1,
3.016422, -0.6401995, 1.763361, 1, 1, 1, 1, 1
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
var radius = 9.61752;
var distance = 33.78113;
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
mvMatrix.translate( 0.1324215, 0.1222343, -0.1553249 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78113);
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
