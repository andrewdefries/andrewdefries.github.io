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
-3.559113, -0.8377437, -2.733731, 1, 0, 0, 1,
-3.386001, 0.4826104, -1.052832, 1, 0.007843138, 0, 1,
-3.358215, 1.177277, -1.147235, 1, 0.01176471, 0, 1,
-2.999703, -0.7062351, -1.361796, 1, 0.01960784, 0, 1,
-2.535921, 1.162183, -2.234413, 1, 0.02352941, 0, 1,
-2.517627, 0.6913288, -2.091451, 1, 0.03137255, 0, 1,
-2.424988, -1.882862, -0.197709, 1, 0.03529412, 0, 1,
-2.420998, -0.4665573, -1.606368, 1, 0.04313726, 0, 1,
-2.384439, -0.1072378, -1.158897, 1, 0.04705882, 0, 1,
-2.350886, 1.688284, -1.972278, 1, 0.05490196, 0, 1,
-2.298922, 0.9789582, 0.1263367, 1, 0.05882353, 0, 1,
-2.283535, 0.2098849, -2.232548, 1, 0.06666667, 0, 1,
-2.259708, -1.361511, -2.465181, 1, 0.07058824, 0, 1,
-2.222002, 0.5447603, -0.4296223, 1, 0.07843138, 0, 1,
-2.205074, 0.5359046, -1.47197, 1, 0.08235294, 0, 1,
-2.164789, 0.3000759, 0.4511812, 1, 0.09019608, 0, 1,
-2.155794, 0.7688617, -0.6204877, 1, 0.09411765, 0, 1,
-2.131403, -0.425734, -1.235997, 1, 0.1019608, 0, 1,
-2.091642, 1.640243, -1.914011, 1, 0.1098039, 0, 1,
-2.065094, -0.6781366, -0.595135, 1, 0.1137255, 0, 1,
-2.054155, 0.8543332, -1.694783, 1, 0.1215686, 0, 1,
-2.054068, -0.5447698, -1.995297, 1, 0.1254902, 0, 1,
-2.053709, -0.3841658, -1.324608, 1, 0.1333333, 0, 1,
-2.013536, -0.2283862, -0.6288526, 1, 0.1372549, 0, 1,
-1.981683, 0.1107554, -1.260187, 1, 0.145098, 0, 1,
-1.975964, 0.1204604, -2.092777, 1, 0.1490196, 0, 1,
-1.959614, -0.2119043, 0.2170663, 1, 0.1568628, 0, 1,
-1.955953, -0.003172372, -1.585082, 1, 0.1607843, 0, 1,
-1.924034, -0.5498129, -2.011268, 1, 0.1686275, 0, 1,
-1.915395, -0.6583563, -2.485371, 1, 0.172549, 0, 1,
-1.914077, -0.1405234, -1.957733, 1, 0.1803922, 0, 1,
-1.897532, -0.623698, -0.3129216, 1, 0.1843137, 0, 1,
-1.891831, -1.46333, -3.004869, 1, 0.1921569, 0, 1,
-1.852936, -1.012518, -0.7821333, 1, 0.1960784, 0, 1,
-1.845637, 1.165693, -1.409694, 1, 0.2039216, 0, 1,
-1.837965, -0.07714413, -1.009711, 1, 0.2117647, 0, 1,
-1.833279, -0.04774171, 0.3039965, 1, 0.2156863, 0, 1,
-1.828784, -0.1995062, -1.842614, 1, 0.2235294, 0, 1,
-1.819069, 0.6277364, -1.08989, 1, 0.227451, 0, 1,
-1.817972, -0.9813061, -2.092163, 1, 0.2352941, 0, 1,
-1.812267, -0.01116587, -3.107943, 1, 0.2392157, 0, 1,
-1.802789, -1.293597, -2.690231, 1, 0.2470588, 0, 1,
-1.800816, -0.3731546, -1.73246, 1, 0.2509804, 0, 1,
-1.777943, -0.2741495, -2.397797, 1, 0.2588235, 0, 1,
-1.767857, 0.4352391, -0.1163485, 1, 0.2627451, 0, 1,
-1.767387, -0.9203399, -1.288793, 1, 0.2705882, 0, 1,
-1.764472, 1.466361, 0.1675496, 1, 0.2745098, 0, 1,
-1.760115, 0.4401048, -2.785481, 1, 0.282353, 0, 1,
-1.754479, 0.2822636, -2.52038, 1, 0.2862745, 0, 1,
-1.754433, 1.377678, -0.462328, 1, 0.2941177, 0, 1,
-1.73451, -0.6158972, -3.037207, 1, 0.3019608, 0, 1,
-1.722353, 0.7030948, -3.49785, 1, 0.3058824, 0, 1,
-1.709689, 0.7607312, 0.3777665, 1, 0.3137255, 0, 1,
-1.701355, 0.6607913, -1.407568, 1, 0.3176471, 0, 1,
-1.69964, 0.1029359, -3.508058, 1, 0.3254902, 0, 1,
-1.676314, -0.6348503, -1.496368, 1, 0.3294118, 0, 1,
-1.673856, -1.092905, -0.4547056, 1, 0.3372549, 0, 1,
-1.650424, -0.1019073, -1.465781, 1, 0.3411765, 0, 1,
-1.640267, -0.5718135, -3.042517, 1, 0.3490196, 0, 1,
-1.621232, -0.3592247, -2.060097, 1, 0.3529412, 0, 1,
-1.619186, -2.315542, -3.368992, 1, 0.3607843, 0, 1,
-1.6148, 0.8775969, 1.769112, 1, 0.3647059, 0, 1,
-1.597901, -1.773513, -1.222366, 1, 0.372549, 0, 1,
-1.597644, -0.1187592, 0.1329688, 1, 0.3764706, 0, 1,
-1.574332, -0.2800206, -1.222855, 1, 0.3843137, 0, 1,
-1.572579, 1.110948, -1.129463, 1, 0.3882353, 0, 1,
-1.567265, 0.6406184, -2.666749, 1, 0.3960784, 0, 1,
-1.563857, 1.438722, 1.152688, 1, 0.4039216, 0, 1,
-1.536126, -1.397449, -2.548923, 1, 0.4078431, 0, 1,
-1.533756, 0.4387521, -0.1488208, 1, 0.4156863, 0, 1,
-1.522389, 0.4098038, -0.7468289, 1, 0.4196078, 0, 1,
-1.519645, -0.8350676, -0.1703702, 1, 0.427451, 0, 1,
-1.51881, -1.149604, -1.632533, 1, 0.4313726, 0, 1,
-1.509202, 1.634995, -2.01789, 1, 0.4392157, 0, 1,
-1.5054, 2.091059, -0.8942487, 1, 0.4431373, 0, 1,
-1.499281, -0.0219928, -2.198558, 1, 0.4509804, 0, 1,
-1.499134, -2.040841, -2.742211, 1, 0.454902, 0, 1,
-1.485834, -0.9447889, -1.543997, 1, 0.4627451, 0, 1,
-1.479111, 0.01251907, -0.7897698, 1, 0.4666667, 0, 1,
-1.479064, 0.09970105, -2.745281, 1, 0.4745098, 0, 1,
-1.470484, -0.3585695, -1.722566, 1, 0.4784314, 0, 1,
-1.453621, 0.4112318, -1.375436, 1, 0.4862745, 0, 1,
-1.432684, -0.6581513, -1.418165, 1, 0.4901961, 0, 1,
-1.432046, -2.470212, -3.79085, 1, 0.4980392, 0, 1,
-1.421599, 0.04796145, -4.460203, 1, 0.5058824, 0, 1,
-1.417808, 0.2826677, 0.1816882, 1, 0.509804, 0, 1,
-1.416551, 0.1453784, -2.606608, 1, 0.5176471, 0, 1,
-1.405003, 0.3363482, -2.538326, 1, 0.5215687, 0, 1,
-1.396104, -0.9316607, -1.171681, 1, 0.5294118, 0, 1,
-1.394146, -0.2772114, -3.721527, 1, 0.5333334, 0, 1,
-1.392647, -0.6449088, -1.106201, 1, 0.5411765, 0, 1,
-1.380226, 0.2087967, -0.3339901, 1, 0.5450981, 0, 1,
-1.379743, -0.5211064, -1.376405, 1, 0.5529412, 0, 1,
-1.370914, -1.111169, -1.42791, 1, 0.5568628, 0, 1,
-1.357403, -0.8792799, -2.51731, 1, 0.5647059, 0, 1,
-1.354997, 0.1926409, -1.287675, 1, 0.5686275, 0, 1,
-1.349053, -0.225792, -2.243759, 1, 0.5764706, 0, 1,
-1.33757, -0.04433933, -2.841604, 1, 0.5803922, 0, 1,
-1.333174, 0.1465669, -1.671688, 1, 0.5882353, 0, 1,
-1.33249, -1.851597, -2.316546, 1, 0.5921569, 0, 1,
-1.326162, -0.1387979, -2.213196, 1, 0.6, 0, 1,
-1.324603, -1.631664, -1.908108, 1, 0.6078432, 0, 1,
-1.320815, 1.22001, -2.677378, 1, 0.6117647, 0, 1,
-1.309721, -1.129013, -2.552908, 1, 0.6196079, 0, 1,
-1.30527, 1.320221, 0.8465874, 1, 0.6235294, 0, 1,
-1.299901, 1.014874, -3.301683, 1, 0.6313726, 0, 1,
-1.285583, -0.1699608, -3.077316, 1, 0.6352941, 0, 1,
-1.28457, -0.6795101, -3.831526, 1, 0.6431373, 0, 1,
-1.284162, 0.7150694, -0.6280342, 1, 0.6470588, 0, 1,
-1.276431, 1.27432, -2.400555, 1, 0.654902, 0, 1,
-1.273764, -0.3670468, -2.180701, 1, 0.6588235, 0, 1,
-1.271189, 1.459285, -1.734325, 1, 0.6666667, 0, 1,
-1.270043, -1.297685, -4.666232, 1, 0.6705883, 0, 1,
-1.265909, 0.3680725, -1.30359, 1, 0.6784314, 0, 1,
-1.252577, 0.6425704, -1.29852, 1, 0.682353, 0, 1,
-1.248903, 1.590258, 0.7403487, 1, 0.6901961, 0, 1,
-1.241529, -0.1180052, -2.055557, 1, 0.6941177, 0, 1,
-1.239804, -0.8579418, -3.564908, 1, 0.7019608, 0, 1,
-1.239716, 0.2622089, -1.482144, 1, 0.7098039, 0, 1,
-1.239082, 0.04283049, -2.598307, 1, 0.7137255, 0, 1,
-1.236436, -0.0479106, -2.37328, 1, 0.7215686, 0, 1,
-1.227034, 0.4994428, -0.9725858, 1, 0.7254902, 0, 1,
-1.226579, -0.4189779, -2.485583, 1, 0.7333333, 0, 1,
-1.224736, -1.192743, -2.956004, 1, 0.7372549, 0, 1,
-1.222927, -1.04958, -3.606141, 1, 0.7450981, 0, 1,
-1.22069, -0.1054578, -0.1829937, 1, 0.7490196, 0, 1,
-1.212311, -1.285207, -3.674686, 1, 0.7568628, 0, 1,
-1.211868, 0.3377214, -1.035174, 1, 0.7607843, 0, 1,
-1.210428, -0.03673691, -1.827083, 1, 0.7686275, 0, 1,
-1.208539, -1.54661, -1.08252, 1, 0.772549, 0, 1,
-1.204178, -0.4165298, -0.571659, 1, 0.7803922, 0, 1,
-1.193976, -0.9923575, -1.710435, 1, 0.7843137, 0, 1,
-1.185894, -0.4163741, -2.755753, 1, 0.7921569, 0, 1,
-1.185396, 0.2740209, -0.7772756, 1, 0.7960784, 0, 1,
-1.182641, -0.9628192, -2.165241, 1, 0.8039216, 0, 1,
-1.17743, 0.1519849, -0.3508144, 1, 0.8117647, 0, 1,
-1.174175, -1.559436, -4.077678, 1, 0.8156863, 0, 1,
-1.167141, 0.3035121, -2.128113, 1, 0.8235294, 0, 1,
-1.163572, -0.2699262, -3.120892, 1, 0.827451, 0, 1,
-1.155617, -0.7541571, -2.083628, 1, 0.8352941, 0, 1,
-1.15009, 0.360077, -0.7065398, 1, 0.8392157, 0, 1,
-1.148837, -0.05787504, -1.493262, 1, 0.8470588, 0, 1,
-1.148424, -1.212773, -1.556945, 1, 0.8509804, 0, 1,
-1.140572, 1.202786, -0.4426862, 1, 0.8588235, 0, 1,
-1.140437, 0.8950545, -2.368189, 1, 0.8627451, 0, 1,
-1.121945, 0.9476873, 0.02214468, 1, 0.8705882, 0, 1,
-1.120594, -1.651468, -3.248185, 1, 0.8745098, 0, 1,
-1.118497, -0.7528965, -2.374866, 1, 0.8823529, 0, 1,
-1.117188, 0.01681191, -1.878269, 1, 0.8862745, 0, 1,
-1.101649, -1.847418, -2.628234, 1, 0.8941177, 0, 1,
-1.101531, -0.9886152, -3.092854, 1, 0.8980392, 0, 1,
-1.100291, -0.3263843, -1.758454, 1, 0.9058824, 0, 1,
-1.094142, -0.2887872, -4.766439, 1, 0.9137255, 0, 1,
-1.088196, -0.120846, -2.559638, 1, 0.9176471, 0, 1,
-1.088066, 0.3174732, -0.7612072, 1, 0.9254902, 0, 1,
-1.08303, -0.6875752, -0.3319284, 1, 0.9294118, 0, 1,
-1.080221, -0.8147219, -1.284637, 1, 0.9372549, 0, 1,
-1.075459, 0.8595271, -1.026066, 1, 0.9411765, 0, 1,
-1.071483, -2.261885, -3.39852, 1, 0.9490196, 0, 1,
-1.070806, 0.3572892, -0.05752981, 1, 0.9529412, 0, 1,
-1.061236, 0.9673951, -0.811375, 1, 0.9607843, 0, 1,
-1.043353, -1.270232, -2.345966, 1, 0.9647059, 0, 1,
-1.02972, -0.5028828, -2.525059, 1, 0.972549, 0, 1,
-1.029501, 0.7075185, -0.1107038, 1, 0.9764706, 0, 1,
-1.025865, -0.1481336, -2.951551, 1, 0.9843137, 0, 1,
-1.022303, -1.079161, -2.753942, 1, 0.9882353, 0, 1,
-1.017282, -1.03121, -1.689092, 1, 0.9960784, 0, 1,
-1.016777, 0.4453139, -0.5291004, 0.9960784, 1, 0, 1,
-1.009512, -1.600616, -2.872818, 0.9921569, 1, 0, 1,
-1.007389, 1.188569, -0.9522847, 0.9843137, 1, 0, 1,
-1.001712, -1.207569, -2.889355, 0.9803922, 1, 0, 1,
-0.9895945, 0.1043201, -0.8755593, 0.972549, 1, 0, 1,
-0.9815156, -0.8374285, -3.596686, 0.9686275, 1, 0, 1,
-0.9790089, 0.5174388, -2.950857, 0.9607843, 1, 0, 1,
-0.9732028, -1.540507, -3.760657, 0.9568627, 1, 0, 1,
-0.9691132, 0.9307895, -1.758119, 0.9490196, 1, 0, 1,
-0.966229, -1.095737, -3.35058, 0.945098, 1, 0, 1,
-0.963377, 0.4513186, 0.1221813, 0.9372549, 1, 0, 1,
-0.9599274, -0.4764562, -1.22682, 0.9333333, 1, 0, 1,
-0.9498577, 0.8810883, -1.540257, 0.9254902, 1, 0, 1,
-0.9493086, -0.9068878, -3.741476, 0.9215686, 1, 0, 1,
-0.9466363, 0.1170924, 0.6798993, 0.9137255, 1, 0, 1,
-0.9371887, 0.4037996, -2.603446, 0.9098039, 1, 0, 1,
-0.9319043, 1.210523, -0.2004683, 0.9019608, 1, 0, 1,
-0.9293929, 0.1234169, -0.9267839, 0.8941177, 1, 0, 1,
-0.9149442, 1.300758, -2.006906, 0.8901961, 1, 0, 1,
-0.9135315, -0.3181061, -2.581673, 0.8823529, 1, 0, 1,
-0.9085797, 1.059509, -0.6398847, 0.8784314, 1, 0, 1,
-0.905196, 0.4932625, -0.8522516, 0.8705882, 1, 0, 1,
-0.9003769, -3.588995, -2.130168, 0.8666667, 1, 0, 1,
-0.8983385, 0.6260998, -0.2510874, 0.8588235, 1, 0, 1,
-0.8914645, -0.3131447, -2.66829, 0.854902, 1, 0, 1,
-0.8844721, 1.217212, -0.4944915, 0.8470588, 1, 0, 1,
-0.8833331, -0.3382699, -1.310217, 0.8431373, 1, 0, 1,
-0.8832985, 0.1355703, -2.14369, 0.8352941, 1, 0, 1,
-0.8823924, 0.4856742, -1.560649, 0.8313726, 1, 0, 1,
-0.8818615, -1.078933, -2.626255, 0.8235294, 1, 0, 1,
-0.8818499, 0.04795766, -4.165215, 0.8196079, 1, 0, 1,
-0.8818206, 1.10402, 1.739799, 0.8117647, 1, 0, 1,
-0.8723211, 1.236589, 0.4643368, 0.8078431, 1, 0, 1,
-0.8705406, -0.07511544, -2.256387, 0.8, 1, 0, 1,
-0.8668395, 0.02439448, -3.122308, 0.7921569, 1, 0, 1,
-0.8638852, -0.7742515, -3.256733, 0.7882353, 1, 0, 1,
-0.8606434, -0.2114799, -3.094677, 0.7803922, 1, 0, 1,
-0.8555918, 0.1828618, -1.050442, 0.7764706, 1, 0, 1,
-0.8475081, -0.4016542, -2.559523, 0.7686275, 1, 0, 1,
-0.8439601, -2.236903, -2.863404, 0.7647059, 1, 0, 1,
-0.8382861, 1.17851, -0.5288462, 0.7568628, 1, 0, 1,
-0.8325392, -1.310942, -2.451307, 0.7529412, 1, 0, 1,
-0.8209919, 0.7266582, -2.570761, 0.7450981, 1, 0, 1,
-0.8175607, 0.3773597, -0.7811175, 0.7411765, 1, 0, 1,
-0.8165989, -0.3138497, 0.1207753, 0.7333333, 1, 0, 1,
-0.8128531, 1.569896, -1.17073, 0.7294118, 1, 0, 1,
-0.8124728, 1.029667, -0.2944389, 0.7215686, 1, 0, 1,
-0.7967639, -1.00423, -2.396488, 0.7176471, 1, 0, 1,
-0.7928746, 0.09538449, -1.98036, 0.7098039, 1, 0, 1,
-0.7915675, -0.4578727, -0.6319977, 0.7058824, 1, 0, 1,
-0.7898731, 1.682532, 1.096383, 0.6980392, 1, 0, 1,
-0.7869374, 0.2297669, -1.415386, 0.6901961, 1, 0, 1,
-0.7790763, 0.3985535, -1.833831, 0.6862745, 1, 0, 1,
-0.7729019, -0.5847389, -0.9351469, 0.6784314, 1, 0, 1,
-0.7724625, -0.4184864, -1.19971, 0.6745098, 1, 0, 1,
-0.7701918, -0.4196512, -1.931129, 0.6666667, 1, 0, 1,
-0.7599323, -0.2479112, -1.711258, 0.6627451, 1, 0, 1,
-0.7576402, 0.575936, -0.2490681, 0.654902, 1, 0, 1,
-0.7501991, -1.021084, -1.73747, 0.6509804, 1, 0, 1,
-0.7500541, 0.3978766, -0.8640996, 0.6431373, 1, 0, 1,
-0.7493376, 1.720611, -0.3402426, 0.6392157, 1, 0, 1,
-0.7444532, 0.9618342, -2.506105, 0.6313726, 1, 0, 1,
-0.7413935, 0.1164152, 1.056522, 0.627451, 1, 0, 1,
-0.7395611, -0.2729184, -4.127163, 0.6196079, 1, 0, 1,
-0.7371516, 0.1058468, -0.1510297, 0.6156863, 1, 0, 1,
-0.7366974, -0.5804112, -4.353184, 0.6078432, 1, 0, 1,
-0.7361048, -0.6081652, -1.866328, 0.6039216, 1, 0, 1,
-0.7344099, 3.244786, -0.1451312, 0.5960785, 1, 0, 1,
-0.7328461, -0.9197509, 0.1103537, 0.5882353, 1, 0, 1,
-0.7288921, -0.4927265, -3.80902, 0.5843138, 1, 0, 1,
-0.7201416, -0.06606225, -2.770644, 0.5764706, 1, 0, 1,
-0.7185133, 0.5383341, -0.2760462, 0.572549, 1, 0, 1,
-0.7141869, -1.21513, -3.286711, 0.5647059, 1, 0, 1,
-0.7141543, 0.420973, -1.992515, 0.5607843, 1, 0, 1,
-0.711974, -0.157698, -1.24262, 0.5529412, 1, 0, 1,
-0.710364, -0.65911, -3.101101, 0.5490196, 1, 0, 1,
-0.7086253, 0.5296537, -0.9805078, 0.5411765, 1, 0, 1,
-0.7044991, -2.596807, -4.123746, 0.5372549, 1, 0, 1,
-0.6989206, -0.8433502, -3.680246, 0.5294118, 1, 0, 1,
-0.6968403, 0.674646, -0.767797, 0.5254902, 1, 0, 1,
-0.6957116, 0.2574157, -0.3905157, 0.5176471, 1, 0, 1,
-0.6928748, -1.067536, -2.200711, 0.5137255, 1, 0, 1,
-0.6923313, -0.7509773, -1.794328, 0.5058824, 1, 0, 1,
-0.665493, -0.336275, -2.330508, 0.5019608, 1, 0, 1,
-0.6623874, -0.4094504, -1.402825, 0.4941176, 1, 0, 1,
-0.6579614, -0.3080523, -2.019647, 0.4862745, 1, 0, 1,
-0.656379, 0.3434673, -0.2532814, 0.4823529, 1, 0, 1,
-0.6502766, -0.03276533, -2.330524, 0.4745098, 1, 0, 1,
-0.6500821, 1.269403, 1.089941, 0.4705882, 1, 0, 1,
-0.6481134, -0.9944908, -2.92191, 0.4627451, 1, 0, 1,
-0.6444498, 1.843846, -1.061798, 0.4588235, 1, 0, 1,
-0.644042, -0.02291322, -2.452027, 0.4509804, 1, 0, 1,
-0.6431743, 0.2063184, -0.986299, 0.4470588, 1, 0, 1,
-0.6413203, 0.1777336, -2.074531, 0.4392157, 1, 0, 1,
-0.6391071, -1.227168, -3.218834, 0.4352941, 1, 0, 1,
-0.6385028, 0.8144374, -2.416977, 0.427451, 1, 0, 1,
-0.6358017, 1.975587, -0.4228096, 0.4235294, 1, 0, 1,
-0.6352821, -0.924064, -2.181367, 0.4156863, 1, 0, 1,
-0.6296363, -0.07180988, -0.9355302, 0.4117647, 1, 0, 1,
-0.623577, 0.852367, -1.547718, 0.4039216, 1, 0, 1,
-0.6228186, -0.3496043, -1.823046, 0.3960784, 1, 0, 1,
-0.6220177, 0.5096942, -2.49265, 0.3921569, 1, 0, 1,
-0.6219729, 0.6290016, -0.7321647, 0.3843137, 1, 0, 1,
-0.6214406, -0.7201323, -2.600672, 0.3803922, 1, 0, 1,
-0.6201879, -0.1351556, -4.371243, 0.372549, 1, 0, 1,
-0.6182186, -0.04131642, -0.3256026, 0.3686275, 1, 0, 1,
-0.6174821, 0.3885663, 1.573103, 0.3607843, 1, 0, 1,
-0.6164415, -0.9509574, -1.084309, 0.3568628, 1, 0, 1,
-0.6156903, 0.9480951, -1.295012, 0.3490196, 1, 0, 1,
-0.6078759, 2.519024, -1.020544, 0.345098, 1, 0, 1,
-0.5995411, 0.438982, -1.449992, 0.3372549, 1, 0, 1,
-0.5989861, -1.61826, -2.946972, 0.3333333, 1, 0, 1,
-0.5959936, 0.9932058, -1.508038, 0.3254902, 1, 0, 1,
-0.592805, 0.2040787, -0.4542246, 0.3215686, 1, 0, 1,
-0.5888991, 1.042151, -0.8245549, 0.3137255, 1, 0, 1,
-0.5749707, -0.6232337, -3.902528, 0.3098039, 1, 0, 1,
-0.5738065, -0.239657, -0.8398273, 0.3019608, 1, 0, 1,
-0.5680425, 1.7671, 0.8575988, 0.2941177, 1, 0, 1,
-0.5649617, 0.9820828, -1.168504, 0.2901961, 1, 0, 1,
-0.5607428, -0.5126241, -3.706961, 0.282353, 1, 0, 1,
-0.5590687, -0.8607079, -2.519444, 0.2784314, 1, 0, 1,
-0.555721, 0.3650292, -1.856646, 0.2705882, 1, 0, 1,
-0.5483006, -0.5000268, -3.48645, 0.2666667, 1, 0, 1,
-0.5447786, 0.1693076, 1.152847, 0.2588235, 1, 0, 1,
-0.5434718, 0.1483513, -1.503766, 0.254902, 1, 0, 1,
-0.5357599, 0.4674834, 0.2351504, 0.2470588, 1, 0, 1,
-0.5328482, 0.593234, -0.3843465, 0.2431373, 1, 0, 1,
-0.5296284, 0.3842651, -1.320536, 0.2352941, 1, 0, 1,
-0.5261668, -0.8011448, -0.6082224, 0.2313726, 1, 0, 1,
-0.5234284, 0.594816, 0.327508, 0.2235294, 1, 0, 1,
-0.5215976, -0.4468267, -0.8377571, 0.2196078, 1, 0, 1,
-0.5180622, -0.6806263, -3.379463, 0.2117647, 1, 0, 1,
-0.5165963, 0.2194296, -2.338071, 0.2078431, 1, 0, 1,
-0.5163609, -0.4037032, -3.852209, 0.2, 1, 0, 1,
-0.5159549, 0.3214284, -1.165625, 0.1921569, 1, 0, 1,
-0.5153946, -1.161883, -2.195108, 0.1882353, 1, 0, 1,
-0.5129163, -0.404319, -2.272084, 0.1803922, 1, 0, 1,
-0.5107976, 1.276417, -0.3512582, 0.1764706, 1, 0, 1,
-0.505766, 1.069549, 2.551774, 0.1686275, 1, 0, 1,
-0.4971547, 0.9260735, -1.322863, 0.1647059, 1, 0, 1,
-0.4957913, -0.1848152, -1.000573, 0.1568628, 1, 0, 1,
-0.4943431, 0.7028224, -1.198434, 0.1529412, 1, 0, 1,
-0.4910043, -0.3549691, -1.581674, 0.145098, 1, 0, 1,
-0.4775772, -1.80092, -2.94182, 0.1411765, 1, 0, 1,
-0.4771267, 0.3831773, -2.145161, 0.1333333, 1, 0, 1,
-0.4767006, -0.2194362, -0.8097637, 0.1294118, 1, 0, 1,
-0.4754403, 0.01438359, -0.6504385, 0.1215686, 1, 0, 1,
-0.4748847, -0.4840541, -0.2877945, 0.1176471, 1, 0, 1,
-0.4708702, 0.7796468, -0.7070852, 0.1098039, 1, 0, 1,
-0.4629537, -0.1921018, -2.650078, 0.1058824, 1, 0, 1,
-0.4592316, 0.6001093, -0.4700482, 0.09803922, 1, 0, 1,
-0.4536324, -1.303434, -3.069266, 0.09019608, 1, 0, 1,
-0.4443786, 9.568987e-05, -1.744309, 0.08627451, 1, 0, 1,
-0.4427496, 1.207652, 1.00578, 0.07843138, 1, 0, 1,
-0.4409652, -2.126856, -3.268213, 0.07450981, 1, 0, 1,
-0.4386661, -0.1103361, -3.157356, 0.06666667, 1, 0, 1,
-0.4381126, 0.05533205, -0.7454776, 0.0627451, 1, 0, 1,
-0.4367486, 0.3165337, -2.40934, 0.05490196, 1, 0, 1,
-0.4310666, -0.05432018, -0.617659, 0.05098039, 1, 0, 1,
-0.4309025, -1.02959, -3.594764, 0.04313726, 1, 0, 1,
-0.4264333, -1.536847, -2.619487, 0.03921569, 1, 0, 1,
-0.4210897, 1.444278, -0.6985962, 0.03137255, 1, 0, 1,
-0.4201949, 0.4643902, 0.8974437, 0.02745098, 1, 0, 1,
-0.4178028, -0.9070721, -3.068757, 0.01960784, 1, 0, 1,
-0.4142999, 1.095669, -1.196275, 0.01568628, 1, 0, 1,
-0.4120939, -1.833447, -3.795316, 0.007843138, 1, 0, 1,
-0.4089291, 2.407444, -0.7997202, 0.003921569, 1, 0, 1,
-0.4082141, 0.3544505, -0.7499023, 0, 1, 0.003921569, 1,
-0.4070424, 0.3111106, -1.894697, 0, 1, 0.01176471, 1,
-0.4056815, 0.07467736, -2.917065, 0, 1, 0.01568628, 1,
-0.4020175, 0.05392439, -1.981821, 0, 1, 0.02352941, 1,
-0.3999336, -0.7680561, -4.537872, 0, 1, 0.02745098, 1,
-0.3927689, 0.7922855, -0.1492894, 0, 1, 0.03529412, 1,
-0.3915468, 0.8275843, -1.301288, 0, 1, 0.03921569, 1,
-0.3898539, 0.2805831, -0.685224, 0, 1, 0.04705882, 1,
-0.3887424, 0.4073505, -2.23719, 0, 1, 0.05098039, 1,
-0.3841538, 0.308146, -0.1133658, 0, 1, 0.05882353, 1,
-0.3817334, -0.3483078, -2.264771, 0, 1, 0.0627451, 1,
-0.3811125, 1.26915, -0.5137904, 0, 1, 0.07058824, 1,
-0.3801943, 0.1799151, 0.05917644, 0, 1, 0.07450981, 1,
-0.3779402, -0.4849791, -2.956366, 0, 1, 0.08235294, 1,
-0.3769942, 0.6405327, -2.550987, 0, 1, 0.08627451, 1,
-0.3760403, -1.352509, -4.526511, 0, 1, 0.09411765, 1,
-0.3750678, 0.6327533, -0.5614317, 0, 1, 0.1019608, 1,
-0.3742349, -0.08855859, -1.676326, 0, 1, 0.1058824, 1,
-0.3702715, 1.205416, -1.142343, 0, 1, 0.1137255, 1,
-0.3694403, -1.52311, -3.654621, 0, 1, 0.1176471, 1,
-0.3680676, -0.120195, -1.162248, 0, 1, 0.1254902, 1,
-0.3665324, 1.902526, -0.1581154, 0, 1, 0.1294118, 1,
-0.3652495, 0.451419, 0.7550285, 0, 1, 0.1372549, 1,
-0.3634346, -1.475204, -3.831636, 0, 1, 0.1411765, 1,
-0.3606551, 0.6087409, 1.885828, 0, 1, 0.1490196, 1,
-0.35879, 0.8501005, -0.5407296, 0, 1, 0.1529412, 1,
-0.3567321, -0.1250848, -1.089479, 0, 1, 0.1607843, 1,
-0.3509817, 0.2482206, -2.424252, 0, 1, 0.1647059, 1,
-0.3501866, 0.05749358, -1.967197, 0, 1, 0.172549, 1,
-0.3494157, -1.89789, -3.897382, 0, 1, 0.1764706, 1,
-0.3471335, 0.1326644, -2.351335, 0, 1, 0.1843137, 1,
-0.3464591, -1.199383, -4.801242, 0, 1, 0.1882353, 1,
-0.3452294, 0.769967, -0.913197, 0, 1, 0.1960784, 1,
-0.3427894, 0.8709946, 0.8772966, 0, 1, 0.2039216, 1,
-0.3408825, 0.2812406, 0.8350533, 0, 1, 0.2078431, 1,
-0.3389573, 0.4886805, 0.8315403, 0, 1, 0.2156863, 1,
-0.3367111, -0.7398213, -2.122548, 0, 1, 0.2196078, 1,
-0.3365582, -1.284005, -3.786117, 0, 1, 0.227451, 1,
-0.3348362, -0.3245852, -1.706224, 0, 1, 0.2313726, 1,
-0.333211, -0.8261256, -2.603216, 0, 1, 0.2392157, 1,
-0.3285686, 0.2964439, -1.77932, 0, 1, 0.2431373, 1,
-0.3232416, 0.09745294, -0.3446232, 0, 1, 0.2509804, 1,
-0.3208942, -0.6381279, -4.076382, 0, 1, 0.254902, 1,
-0.3198343, -1.136767, -1.71025, 0, 1, 0.2627451, 1,
-0.3187608, 0.09302768, -2.489437, 0, 1, 0.2666667, 1,
-0.3180489, 0.9037322, -0.8556044, 0, 1, 0.2745098, 1,
-0.3150816, 0.3288567, -0.6833907, 0, 1, 0.2784314, 1,
-0.3121374, -1.041337, -1.998577, 0, 1, 0.2862745, 1,
-0.3093274, 0.5500922, 2.048697, 0, 1, 0.2901961, 1,
-0.3051356, -1.13101, -3.068549, 0, 1, 0.2980392, 1,
-0.303403, 0.5889478, -1.641589, 0, 1, 0.3058824, 1,
-0.2994092, 0.5709372, 0.4641677, 0, 1, 0.3098039, 1,
-0.2956403, 0.1741166, -1.724257, 0, 1, 0.3176471, 1,
-0.2931351, -0.4369529, -4.981027, 0, 1, 0.3215686, 1,
-0.2877432, -0.5778983, -1.540554, 0, 1, 0.3294118, 1,
-0.2842966, -0.8359371, -2.776356, 0, 1, 0.3333333, 1,
-0.2833994, -0.9675221, -4.440226, 0, 1, 0.3411765, 1,
-0.2822644, 1.363652, -0.8744485, 0, 1, 0.345098, 1,
-0.280998, 0.9927502, 1.443962, 0, 1, 0.3529412, 1,
-0.2805756, 0.2477211, -1.903511, 0, 1, 0.3568628, 1,
-0.2758114, 0.3362135, -0.5381787, 0, 1, 0.3647059, 1,
-0.2741921, -0.241508, -1.971454, 0, 1, 0.3686275, 1,
-0.2723972, 0.01732228, -0.8795757, 0, 1, 0.3764706, 1,
-0.2688648, -0.6248133, -2.523674, 0, 1, 0.3803922, 1,
-0.2653311, -2.977925, -3.936117, 0, 1, 0.3882353, 1,
-0.262078, -2.440432, -2.026871, 0, 1, 0.3921569, 1,
-0.2585475, -0.8628312, -1.561368, 0, 1, 0.4, 1,
-0.2524693, 0.6096593, 0.6517866, 0, 1, 0.4078431, 1,
-0.2431141, 1.021597, 0.9760922, 0, 1, 0.4117647, 1,
-0.2338339, -0.5512763, -4.186809, 0, 1, 0.4196078, 1,
-0.2335879, 0.2935364, -0.583877, 0, 1, 0.4235294, 1,
-0.2306843, 0.1386802, -0.9194962, 0, 1, 0.4313726, 1,
-0.2282775, 1.322565, -1.336704, 0, 1, 0.4352941, 1,
-0.2272302, 1.143841, -0.07673579, 0, 1, 0.4431373, 1,
-0.2182097, -0.4106653, -3.289858, 0, 1, 0.4470588, 1,
-0.215183, -0.2444557, -3.36865, 0, 1, 0.454902, 1,
-0.2115933, 0.211046, 1.041922, 0, 1, 0.4588235, 1,
-0.2084804, -0.2693298, -0.8832519, 0, 1, 0.4666667, 1,
-0.2055273, 0.8206632, -0.5255367, 0, 1, 0.4705882, 1,
-0.2048232, 0.03333246, -1.042171, 0, 1, 0.4784314, 1,
-0.2029564, -0.1534761, -1.954739, 0, 1, 0.4823529, 1,
-0.2021351, -0.1942128, -2.275845, 0, 1, 0.4901961, 1,
-0.2003024, 0.2569086, -1.509153, 0, 1, 0.4941176, 1,
-0.1965642, -0.532097, -1.843845, 0, 1, 0.5019608, 1,
-0.1910928, 0.299154, -1.147467, 0, 1, 0.509804, 1,
-0.1844659, 1.753944, 1.799843, 0, 1, 0.5137255, 1,
-0.1843935, -0.03728435, -2.435977, 0, 1, 0.5215687, 1,
-0.1836908, 0.02818526, -2.747252, 0, 1, 0.5254902, 1,
-0.1830811, -0.4733605, -2.735215, 0, 1, 0.5333334, 1,
-0.1812172, -1.052336, -2.09366, 0, 1, 0.5372549, 1,
-0.1793773, 0.3524702, -0.02936392, 0, 1, 0.5450981, 1,
-0.179309, 0.6854399, -0.02524489, 0, 1, 0.5490196, 1,
-0.1773643, -0.5761418, -3.203546, 0, 1, 0.5568628, 1,
-0.1760044, 1.776203, -1.624575, 0, 1, 0.5607843, 1,
-0.175068, -0.06123328, -1.248768, 0, 1, 0.5686275, 1,
-0.1741687, 0.8587953, 0.3434532, 0, 1, 0.572549, 1,
-0.1729734, -0.3880247, -3.310678, 0, 1, 0.5803922, 1,
-0.1715386, 0.7230377, -0.6002397, 0, 1, 0.5843138, 1,
-0.1677682, -1.418581, -3.337157, 0, 1, 0.5921569, 1,
-0.1675546, -0.5366302, -1.957666, 0, 1, 0.5960785, 1,
-0.1632966, 2.078368, 0.7986, 0, 1, 0.6039216, 1,
-0.1598172, 0.1051905, -0.5393618, 0, 1, 0.6117647, 1,
-0.1569845, -0.008864303, -0.6448544, 0, 1, 0.6156863, 1,
-0.1546369, 1.101779, -0.9977866, 0, 1, 0.6235294, 1,
-0.1534533, -0.6249542, -2.894911, 0, 1, 0.627451, 1,
-0.1525303, 1.244018, 0.06354307, 0, 1, 0.6352941, 1,
-0.1523862, 0.05706548, -1.484344, 0, 1, 0.6392157, 1,
-0.1477065, -0.6596447, -2.524916, 0, 1, 0.6470588, 1,
-0.1465041, -0.239172, -2.435461, 0, 1, 0.6509804, 1,
-0.1454945, 0.6917908, -0.4182801, 0, 1, 0.6588235, 1,
-0.1447052, -0.7488559, -2.041786, 0, 1, 0.6627451, 1,
-0.1441257, -0.7776902, -2.494677, 0, 1, 0.6705883, 1,
-0.1421268, -1.164419, -2.250899, 0, 1, 0.6745098, 1,
-0.1412129, 1.256034, 2.231211, 0, 1, 0.682353, 1,
-0.1352533, -1.175676, -3.331559, 0, 1, 0.6862745, 1,
-0.134149, -0.9640115, -0.6374112, 0, 1, 0.6941177, 1,
-0.1323545, -0.8828191, -3.397534, 0, 1, 0.7019608, 1,
-0.1314108, 0.2267081, 0.3753001, 0, 1, 0.7058824, 1,
-0.1299663, -0.6325482, -1.67704, 0, 1, 0.7137255, 1,
-0.1296801, -0.1564051, -2.86068, 0, 1, 0.7176471, 1,
-0.1277276, 1.109487, 0.8339675, 0, 1, 0.7254902, 1,
-0.1275678, 0.3396781, 0.0002594092, 0, 1, 0.7294118, 1,
-0.1246312, 0.6414757, -0.61588, 0, 1, 0.7372549, 1,
-0.1229283, -0.1095996, -0.9617202, 0, 1, 0.7411765, 1,
-0.1229116, -0.5164776, -4.543447, 0, 1, 0.7490196, 1,
-0.1217482, -0.370439, -4.201701, 0, 1, 0.7529412, 1,
-0.1197895, -1.635332, -3.760114, 0, 1, 0.7607843, 1,
-0.116193, -0.2613333, -3.072845, 0, 1, 0.7647059, 1,
-0.1125275, 1.593809, -0.8019282, 0, 1, 0.772549, 1,
-0.1069564, -0.7376602, -3.030556, 0, 1, 0.7764706, 1,
-0.1050323, 0.4627061, -0.3257444, 0, 1, 0.7843137, 1,
-0.09109889, -0.9251965, -3.495563, 0, 1, 0.7882353, 1,
-0.08927604, -0.5622466, -3.579293, 0, 1, 0.7960784, 1,
-0.08710153, 0.114761, 0.08665133, 0, 1, 0.8039216, 1,
-0.08498377, 0.4364153, 1.87773, 0, 1, 0.8078431, 1,
-0.08404532, 0.7398405, -1.82804, 0, 1, 0.8156863, 1,
-0.08345413, -0.007087963, -2.42422, 0, 1, 0.8196079, 1,
-0.08140635, -0.1358603, -0.8814206, 0, 1, 0.827451, 1,
-0.07816751, -2.924384, -3.718167, 0, 1, 0.8313726, 1,
-0.07668619, -0.6667145, -2.740948, 0, 1, 0.8392157, 1,
-0.0722758, 0.614053, -0.008831423, 0, 1, 0.8431373, 1,
-0.07179821, -0.3345287, -3.288266, 0, 1, 0.8509804, 1,
-0.06773832, -0.7089276, -2.632392, 0, 1, 0.854902, 1,
-0.06767458, -2.45421, -3.633454, 0, 1, 0.8627451, 1,
-0.06738725, -0.1994989, -3.609682, 0, 1, 0.8666667, 1,
-0.05827805, -0.9286711, -4.769819, 0, 1, 0.8745098, 1,
-0.05601884, 1.639638, 1.790803, 0, 1, 0.8784314, 1,
-0.0552962, 0.903573, -0.9367369, 0, 1, 0.8862745, 1,
-0.05355746, -0.2364015, -2.50691, 0, 1, 0.8901961, 1,
-0.05219369, 1.418797, -1.967092, 0, 1, 0.8980392, 1,
-0.05180933, 1.580211, 0.09800298, 0, 1, 0.9058824, 1,
-0.05075786, -2.059993, -2.776343, 0, 1, 0.9098039, 1,
-0.05064569, 0.9405257, 0.385462, 0, 1, 0.9176471, 1,
-0.04765658, 0.09999228, -0.1733052, 0, 1, 0.9215686, 1,
-0.04196552, 1.385095, 0.3692899, 0, 1, 0.9294118, 1,
-0.04160444, 0.3551607, -0.3407762, 0, 1, 0.9333333, 1,
-0.03760944, 0.8646246, -1.642254, 0, 1, 0.9411765, 1,
-0.03650716, -0.06469876, -1.598915, 0, 1, 0.945098, 1,
-0.03380058, 0.1458777, -0.8255703, 0, 1, 0.9529412, 1,
-0.03330008, 0.7584088, -0.5061359, 0, 1, 0.9568627, 1,
-0.03212821, 0.05041255, 0.03001088, 0, 1, 0.9647059, 1,
-0.0309478, -0.3021609, -3.49293, 0, 1, 0.9686275, 1,
-0.02843945, -0.3660486, -2.667839, 0, 1, 0.9764706, 1,
-0.02531831, 0.8146922, -1.199764, 0, 1, 0.9803922, 1,
-0.01993134, 0.7913718, 0.9803596, 0, 1, 0.9882353, 1,
-0.01879298, 0.7563038, -0.4350765, 0, 1, 0.9921569, 1,
-0.01874932, 0.6044027, -1.198639, 0, 1, 1, 1,
-0.01852825, -1.583842, -4.500884, 0, 0.9921569, 1, 1,
-0.01825882, 1.472063, 1.980042, 0, 0.9882353, 1, 1,
-0.0179643, -0.05197236, -3.094849, 0, 0.9803922, 1, 1,
-0.01381371, -0.1252658, -4.470016, 0, 0.9764706, 1, 1,
-0.01246257, 0.6098263, 1.230886, 0, 0.9686275, 1, 1,
-0.01189773, -0.3404526, -2.231007, 0, 0.9647059, 1, 1,
-0.01045259, 0.03778543, -1.992443, 0, 0.9568627, 1, 1,
-0.009185275, 0.04054089, 0.929962, 0, 0.9529412, 1, 1,
-0.005150806, 1.663593, 0.6766133, 0, 0.945098, 1, 1,
-0.005051042, 0.6370307, 0.8320261, 0, 0.9411765, 1, 1,
-0.0003032762, -0.4242283, -3.806782, 0, 0.9333333, 1, 1,
0.009825279, 0.6775143, 0.6258792, 0, 0.9294118, 1, 1,
0.01151078, -0.5830551, 2.222055, 0, 0.9215686, 1, 1,
0.0140278, 2.395447, 0.7210755, 0, 0.9176471, 1, 1,
0.01510028, -1.113649, 5.033502, 0, 0.9098039, 1, 1,
0.01765658, 0.3839163, -0.3357744, 0, 0.9058824, 1, 1,
0.01988069, 1.038408, 0.4694627, 0, 0.8980392, 1, 1,
0.02199863, -0.9883576, 2.167261, 0, 0.8901961, 1, 1,
0.02375745, 0.3185747, 1.694222, 0, 0.8862745, 1, 1,
0.02620783, 2.992241, -2.532052, 0, 0.8784314, 1, 1,
0.02765932, -0.7921197, 3.888649, 0, 0.8745098, 1, 1,
0.02789737, -0.1051341, 2.73516, 0, 0.8666667, 1, 1,
0.03031832, 0.3346542, -0.5180222, 0, 0.8627451, 1, 1,
0.0344783, 0.007008761, 2.585509, 0, 0.854902, 1, 1,
0.03809819, 0.224206, -1.996728, 0, 0.8509804, 1, 1,
0.03835469, 0.1753912, 1.901234, 0, 0.8431373, 1, 1,
0.04432393, 0.1476425, -1.187811, 0, 0.8392157, 1, 1,
0.04881441, -0.5771686, 2.923611, 0, 0.8313726, 1, 1,
0.0545174, -0.3138246, 3.763643, 0, 0.827451, 1, 1,
0.05643246, -0.5193242, 1.74217, 0, 0.8196079, 1, 1,
0.05677938, 1.602538, -0.2153409, 0, 0.8156863, 1, 1,
0.05719296, -0.4786198, 1.842147, 0, 0.8078431, 1, 1,
0.06659774, 0.8132163, 0.13365, 0, 0.8039216, 1, 1,
0.06818476, 0.5059471, -0.8536442, 0, 0.7960784, 1, 1,
0.06907594, -1.065338, 3.133185, 0, 0.7882353, 1, 1,
0.07374323, -1.76836, 3.881604, 0, 0.7843137, 1, 1,
0.07381577, -0.8691381, 3.64132, 0, 0.7764706, 1, 1,
0.07640369, -0.3228456, 3.48843, 0, 0.772549, 1, 1,
0.08338441, 0.7733946, -0.3404097, 0, 0.7647059, 1, 1,
0.08393636, -0.346202, 3.201233, 0, 0.7607843, 1, 1,
0.08671106, -0.2540013, 0.5867226, 0, 0.7529412, 1, 1,
0.08724581, 0.6549274, 1.577352, 0, 0.7490196, 1, 1,
0.08782649, -1.485228, 5.023971, 0, 0.7411765, 1, 1,
0.09148531, -2.164361, 1.484957, 0, 0.7372549, 1, 1,
0.0977523, 0.9396127, -0.8908677, 0, 0.7294118, 1, 1,
0.09901702, 0.2086662, 1.520341, 0, 0.7254902, 1, 1,
0.1018926, 1.547621, -0.8086034, 0, 0.7176471, 1, 1,
0.1021668, 0.1028734, -0.6413685, 0, 0.7137255, 1, 1,
0.1055621, 0.02435913, 0.8174148, 0, 0.7058824, 1, 1,
0.1076495, -1.046337, 3.683286, 0, 0.6980392, 1, 1,
0.1079203, 0.4211729, 0.02062111, 0, 0.6941177, 1, 1,
0.1091385, 0.5055685, 1.024259, 0, 0.6862745, 1, 1,
0.1104681, 1.001854, -0.3019232, 0, 0.682353, 1, 1,
0.1133261, 0.03856646, 0.5736607, 0, 0.6745098, 1, 1,
0.1133549, 1.573352, 0.02435898, 0, 0.6705883, 1, 1,
0.1133752, 0.8889509, 0.4246551, 0, 0.6627451, 1, 1,
0.1139112, 0.8784806, 0.1191689, 0, 0.6588235, 1, 1,
0.1145024, -0.3762366, 4.281405, 0, 0.6509804, 1, 1,
0.1172118, 1.731623, -1.138572, 0, 0.6470588, 1, 1,
0.1182318, -1.307387, 1.882368, 0, 0.6392157, 1, 1,
0.1194316, -0.7525171, 1.533029, 0, 0.6352941, 1, 1,
0.1214921, -0.950373, 2.238569, 0, 0.627451, 1, 1,
0.1234599, 1.252419, -0.2383292, 0, 0.6235294, 1, 1,
0.1300749, 0.5687034, -0.04598356, 0, 0.6156863, 1, 1,
0.1312039, 0.1770883, 1.75061, 0, 0.6117647, 1, 1,
0.1337826, 0.04797899, 0.07334188, 0, 0.6039216, 1, 1,
0.1365028, -0.6798184, 0.9256661, 0, 0.5960785, 1, 1,
0.1379172, 2.362634, -0.9552951, 0, 0.5921569, 1, 1,
0.1401537, 0.2951037, -0.4459397, 0, 0.5843138, 1, 1,
0.1403778, -1.064491, 2.31602, 0, 0.5803922, 1, 1,
0.1413869, 0.5777373, 1.410925, 0, 0.572549, 1, 1,
0.1417308, 0.8431205, -0.8194766, 0, 0.5686275, 1, 1,
0.1420501, -0.7785267, 2.202007, 0, 0.5607843, 1, 1,
0.1423283, 0.4927281, 0.5737745, 0, 0.5568628, 1, 1,
0.1465967, 1.000063, 0.3498735, 0, 0.5490196, 1, 1,
0.146953, -0.4098912, 2.008374, 0, 0.5450981, 1, 1,
0.148806, 0.286598, -0.7376863, 0, 0.5372549, 1, 1,
0.1489256, 0.3560672, -2.380659, 0, 0.5333334, 1, 1,
0.1500862, -0.7860855, 2.242678, 0, 0.5254902, 1, 1,
0.1512021, -0.8708789, 2.798182, 0, 0.5215687, 1, 1,
0.15581, -0.1727864, 2.818359, 0, 0.5137255, 1, 1,
0.1568122, -0.9779027, 3.669, 0, 0.509804, 1, 1,
0.1572807, -0.3066593, 1.832374, 0, 0.5019608, 1, 1,
0.1643472, -0.06403851, 2.178595, 0, 0.4941176, 1, 1,
0.1686827, -0.5092114, 2.498296, 0, 0.4901961, 1, 1,
0.1705582, -0.2408949, 3.227378, 0, 0.4823529, 1, 1,
0.1728517, 0.4485415, -1.069791, 0, 0.4784314, 1, 1,
0.1733576, -0.5468729, 4.039315, 0, 0.4705882, 1, 1,
0.1746276, -1.125788, 3.520656, 0, 0.4666667, 1, 1,
0.1747821, 0.04043982, 2.218272, 0, 0.4588235, 1, 1,
0.17732, 0.453761, -0.7356585, 0, 0.454902, 1, 1,
0.1795209, 0.345092, 1.284318, 0, 0.4470588, 1, 1,
0.1805188, -1.087456, 3.862003, 0, 0.4431373, 1, 1,
0.1886908, -0.05968931, 2.19382, 0, 0.4352941, 1, 1,
0.1896972, 0.3383362, 1.380598, 0, 0.4313726, 1, 1,
0.1930853, 1.296622, -0.5310513, 0, 0.4235294, 1, 1,
0.1996938, 0.4202003, 1.428992, 0, 0.4196078, 1, 1,
0.2007979, 0.3925796, -0.7658876, 0, 0.4117647, 1, 1,
0.2032485, -0.752758, 5.522293, 0, 0.4078431, 1, 1,
0.203336, 0.152534, 0.5351413, 0, 0.4, 1, 1,
0.2043458, -1.13977, 3.735163, 0, 0.3921569, 1, 1,
0.2054908, 0.09697863, 1.639931, 0, 0.3882353, 1, 1,
0.2067525, 1.148457, 1.203167, 0, 0.3803922, 1, 1,
0.2092864, -0.105881, 1.952342, 0, 0.3764706, 1, 1,
0.2093471, 0.4398252, 1.13426, 0, 0.3686275, 1, 1,
0.2117955, -1.568219, 2.45998, 0, 0.3647059, 1, 1,
0.2137896, -0.1098024, 2.837146, 0, 0.3568628, 1, 1,
0.2150738, 0.307423, 1.987367, 0, 0.3529412, 1, 1,
0.2222128, -0.001983706, 2.426197, 0, 0.345098, 1, 1,
0.2243856, 0.4454995, 1.321741, 0, 0.3411765, 1, 1,
0.2271452, -2.085487, 3.73572, 0, 0.3333333, 1, 1,
0.2395024, -1.384903, 1.825237, 0, 0.3294118, 1, 1,
0.2396417, 0.1021887, 2.348539, 0, 0.3215686, 1, 1,
0.2441291, 1.466067, -0.04139022, 0, 0.3176471, 1, 1,
0.246976, -1.155421, 2.592754, 0, 0.3098039, 1, 1,
0.2471077, -0.1280744, 1.187254, 0, 0.3058824, 1, 1,
0.2482607, 2.482103, -0.5519853, 0, 0.2980392, 1, 1,
0.2489021, 0.548886, 2.162902, 0, 0.2901961, 1, 1,
0.2529002, 1.211604, -0.378684, 0, 0.2862745, 1, 1,
0.2579895, 0.04302815, 2.177908, 0, 0.2784314, 1, 1,
0.2599052, -0.3694436, 3.878918, 0, 0.2745098, 1, 1,
0.2641881, 0.9772518, -1.31933, 0, 0.2666667, 1, 1,
0.2661952, 1.636795, -0.08706372, 0, 0.2627451, 1, 1,
0.2702278, -0.1039702, 3.395652, 0, 0.254902, 1, 1,
0.2716685, 1.254683, 0.9688547, 0, 0.2509804, 1, 1,
0.2717213, -0.1791344, 2.127353, 0, 0.2431373, 1, 1,
0.2719589, 1.87481, 0.1030933, 0, 0.2392157, 1, 1,
0.2782998, 0.1185855, 0.490523, 0, 0.2313726, 1, 1,
0.2792389, -0.1431093, 1.408899, 0, 0.227451, 1, 1,
0.2808244, -1.971061, 3.456316, 0, 0.2196078, 1, 1,
0.2838663, 0.2334805, 0.3348753, 0, 0.2156863, 1, 1,
0.2867253, 1.339131, -0.1334591, 0, 0.2078431, 1, 1,
0.2877522, -0.1123646, 2.175928, 0, 0.2039216, 1, 1,
0.2885061, -0.5091183, 4.070318, 0, 0.1960784, 1, 1,
0.2898111, 0.2118145, 0.4320998, 0, 0.1882353, 1, 1,
0.291119, 0.767782, 0.7096084, 0, 0.1843137, 1, 1,
0.2919832, 0.949738, -0.6282976, 0, 0.1764706, 1, 1,
0.2969879, -1.523924, 3.067615, 0, 0.172549, 1, 1,
0.2977266, -0.7835106, 2.545131, 0, 0.1647059, 1, 1,
0.2982719, -0.008780932, -0.2068387, 0, 0.1607843, 1, 1,
0.3021386, -0.849704, 1.903713, 0, 0.1529412, 1, 1,
0.3050204, 1.067804, 0.7180337, 0, 0.1490196, 1, 1,
0.3135078, -1.416258, 3.245712, 0, 0.1411765, 1, 1,
0.3144269, -0.6150133, 1.146271, 0, 0.1372549, 1, 1,
0.3150141, -0.5906677, 3.107269, 0, 0.1294118, 1, 1,
0.31591, 0.3108599, 1.142258, 0, 0.1254902, 1, 1,
0.3208536, 0.07163931, 2.431836, 0, 0.1176471, 1, 1,
0.3225683, 0.6035362, 1.004825, 0, 0.1137255, 1, 1,
0.3245464, 0.6192865, 1.701068, 0, 0.1058824, 1, 1,
0.3271473, 0.6779059, 2.041076, 0, 0.09803922, 1, 1,
0.3305247, -0.3225322, 5.591034, 0, 0.09411765, 1, 1,
0.3418064, 0.9824485, 0.9654937, 0, 0.08627451, 1, 1,
0.3448277, -1.445047, 3.480392, 0, 0.08235294, 1, 1,
0.3454058, -0.3006446, 2.830275, 0, 0.07450981, 1, 1,
0.3501613, 0.1467175, 2.017103, 0, 0.07058824, 1, 1,
0.3528811, 0.4458703, 0.7085773, 0, 0.0627451, 1, 1,
0.3538386, 1.324287, 2.259945, 0, 0.05882353, 1, 1,
0.3539781, 0.7967777, 0.9273735, 0, 0.05098039, 1, 1,
0.3547912, -0.5494118, 2.846511, 0, 0.04705882, 1, 1,
0.3557408, -0.2602115, 1.960812, 0, 0.03921569, 1, 1,
0.360858, 1.12658, 0.5080847, 0, 0.03529412, 1, 1,
0.36549, -0.9871866, 3.51013, 0, 0.02745098, 1, 1,
0.3672878, 0.5346383, 0.3446937, 0, 0.02352941, 1, 1,
0.3707986, -1.606026, 0.6854591, 0, 0.01568628, 1, 1,
0.3737172, 2.469033, -0.1719878, 0, 0.01176471, 1, 1,
0.3810185, 0.1745496, 0.6153095, 0, 0.003921569, 1, 1,
0.3825785, 0.09028179, -0.05867593, 0.003921569, 0, 1, 1,
0.3911409, -0.8249257, 1.613735, 0.007843138, 0, 1, 1,
0.3924728, 1.089482, 0.8100569, 0.01568628, 0, 1, 1,
0.3929279, 0.1427704, -0.1883959, 0.01960784, 0, 1, 1,
0.4047768, 0.5621447, 2.187835, 0.02745098, 0, 1, 1,
0.4056967, 1.258772, -0.7812167, 0.03137255, 0, 1, 1,
0.4076208, 0.6178957, 0.03094988, 0.03921569, 0, 1, 1,
0.4081209, -1.784495, 3.14375, 0.04313726, 0, 1, 1,
0.4097733, -0.2679884, 2.893641, 0.05098039, 0, 1, 1,
0.4134352, 1.910478, -0.6095052, 0.05490196, 0, 1, 1,
0.4137225, -1.312506, 3.847349, 0.0627451, 0, 1, 1,
0.4140377, -1.012269, 1.444623, 0.06666667, 0, 1, 1,
0.4142467, -0.6018188, 2.527813, 0.07450981, 0, 1, 1,
0.4168551, -0.5843005, 1.302303, 0.07843138, 0, 1, 1,
0.4187264, -0.4670332, 3.628475, 0.08627451, 0, 1, 1,
0.423127, -0.5625124, 4.417342, 0.09019608, 0, 1, 1,
0.4242706, 1.553171, 2.287711, 0.09803922, 0, 1, 1,
0.4282982, 0.2499675, 0.4856376, 0.1058824, 0, 1, 1,
0.4291603, -0.2258295, 2.285202, 0.1098039, 0, 1, 1,
0.4292936, -1.349343, 1.575809, 0.1176471, 0, 1, 1,
0.4388988, -0.9435449, 1.566814, 0.1215686, 0, 1, 1,
0.4424663, -1.72068, 3.12826, 0.1294118, 0, 1, 1,
0.4436214, -1.414515, 2.884724, 0.1333333, 0, 1, 1,
0.4458293, 1.196352, -0.1409411, 0.1411765, 0, 1, 1,
0.4493475, -0.8582347, 3.687844, 0.145098, 0, 1, 1,
0.4529193, -0.1812702, 2.632115, 0.1529412, 0, 1, 1,
0.4550477, -1.025004, 2.206763, 0.1568628, 0, 1, 1,
0.4565388, 0.3413543, 0.1438108, 0.1647059, 0, 1, 1,
0.4579566, 0.9367008, -0.5015026, 0.1686275, 0, 1, 1,
0.4663551, 2.020098, 0.6245059, 0.1764706, 0, 1, 1,
0.469007, -0.3997138, 4.131686, 0.1803922, 0, 1, 1,
0.4703479, -0.4202191, 3.053249, 0.1882353, 0, 1, 1,
0.4720031, -0.2577966, 0.4788233, 0.1921569, 0, 1, 1,
0.4809962, 0.6753005, 0.9399152, 0.2, 0, 1, 1,
0.4831705, 1.711947, 0.1375548, 0.2078431, 0, 1, 1,
0.4932603, 0.7363148, -0.1205295, 0.2117647, 0, 1, 1,
0.5004122, -0.517975, 3.026116, 0.2196078, 0, 1, 1,
0.506635, 0.3377122, 0.9005404, 0.2235294, 0, 1, 1,
0.5067088, -0.03415478, 1.069042, 0.2313726, 0, 1, 1,
0.5072964, 1.137559, 0.9002572, 0.2352941, 0, 1, 1,
0.5087345, -1.22795, 2.466274, 0.2431373, 0, 1, 1,
0.5092546, -0.3968412, 2.221895, 0.2470588, 0, 1, 1,
0.5093707, 0.6483139, 0.5842128, 0.254902, 0, 1, 1,
0.5240699, 0.04799686, 1.755951, 0.2588235, 0, 1, 1,
0.5327756, -0.778118, 1.373764, 0.2666667, 0, 1, 1,
0.5365883, 0.640048, 0.2200626, 0.2705882, 0, 1, 1,
0.5400848, -0.1605233, 1.975721, 0.2784314, 0, 1, 1,
0.5410966, -0.9278653, 1.319542, 0.282353, 0, 1, 1,
0.5412248, 0.7863806, 1.583527, 0.2901961, 0, 1, 1,
0.5471662, 1.234686, 0.1913206, 0.2941177, 0, 1, 1,
0.5485335, -0.1091018, 1.018057, 0.3019608, 0, 1, 1,
0.5505561, -1.754979, 3.377442, 0.3098039, 0, 1, 1,
0.5511339, -1.809125, 2.362827, 0.3137255, 0, 1, 1,
0.555815, -1.018862, 2.550796, 0.3215686, 0, 1, 1,
0.5567046, 2.739528, 0.4833945, 0.3254902, 0, 1, 1,
0.5658564, -1.111954, 2.680491, 0.3333333, 0, 1, 1,
0.5665084, -0.9939535, 3.385922, 0.3372549, 0, 1, 1,
0.566655, -0.8510079, 1.393173, 0.345098, 0, 1, 1,
0.5693516, -1.357638, 2.414616, 0.3490196, 0, 1, 1,
0.5701159, 0.7476731, 1.685724, 0.3568628, 0, 1, 1,
0.5795704, 1.106116, -0.5042536, 0.3607843, 0, 1, 1,
0.5817828, -0.9879364, 2.462219, 0.3686275, 0, 1, 1,
0.5834371, 0.55005, 1.522105, 0.372549, 0, 1, 1,
0.5837774, -0.2270389, -0.05346479, 0.3803922, 0, 1, 1,
0.5863858, 0.15615, 1.91264, 0.3843137, 0, 1, 1,
0.5881727, -1.575889, 4.074807, 0.3921569, 0, 1, 1,
0.5975325, 1.00377, 0.5533904, 0.3960784, 0, 1, 1,
0.5987069, -0.4395888, 2.6445, 0.4039216, 0, 1, 1,
0.5998583, -1.057953, 3.441896, 0.4117647, 0, 1, 1,
0.5999094, 0.385022, 1.063771, 0.4156863, 0, 1, 1,
0.6052615, -0.05541954, 2.312105, 0.4235294, 0, 1, 1,
0.6077631, -0.6886281, 3.569146, 0.427451, 0, 1, 1,
0.6121547, 1.307607, 0.1584577, 0.4352941, 0, 1, 1,
0.6181055, -0.5794982, 1.172416, 0.4392157, 0, 1, 1,
0.6200625, 0.4657326, 0.1737439, 0.4470588, 0, 1, 1,
0.6210471, -1.449366, 0.9353542, 0.4509804, 0, 1, 1,
0.6215367, 0.2426734, 2.702837, 0.4588235, 0, 1, 1,
0.6224532, 0.8881706, -0.4592998, 0.4627451, 0, 1, 1,
0.6234899, 0.7584572, 0.3358886, 0.4705882, 0, 1, 1,
0.6240399, -1.816984, 2.287971, 0.4745098, 0, 1, 1,
0.6259323, -0.7293455, 1.697893, 0.4823529, 0, 1, 1,
0.6266919, -1.647331, 2.34801, 0.4862745, 0, 1, 1,
0.6307414, -0.6388077, 1.886655, 0.4941176, 0, 1, 1,
0.6332416, -0.1890637, 1.621047, 0.5019608, 0, 1, 1,
0.6385339, 0.7311075, 0.6695228, 0.5058824, 0, 1, 1,
0.6412629, -0.7127998, 3.056396, 0.5137255, 0, 1, 1,
0.6470443, 1.861561, -1.022033, 0.5176471, 0, 1, 1,
0.6476809, 1.165207, 2.093763, 0.5254902, 0, 1, 1,
0.6479698, -0.06237532, 0.9442431, 0.5294118, 0, 1, 1,
0.6491988, -1.568908, 0.7855951, 0.5372549, 0, 1, 1,
0.6507458, 1.628669, -0.006016138, 0.5411765, 0, 1, 1,
0.6529289, -2.115535, 2.001335, 0.5490196, 0, 1, 1,
0.6562665, -0.2223641, 1.530711, 0.5529412, 0, 1, 1,
0.6574357, -1.131044, 1.283976, 0.5607843, 0, 1, 1,
0.6586511, -0.381962, 0.9521956, 0.5647059, 0, 1, 1,
0.6643421, 1.101139, 1.750511, 0.572549, 0, 1, 1,
0.6677591, 0.5913855, 0.3164834, 0.5764706, 0, 1, 1,
0.6710675, -0.163205, 0.7519702, 0.5843138, 0, 1, 1,
0.6722043, 0.9649173, 1.985553, 0.5882353, 0, 1, 1,
0.6744663, 0.4120862, 0.3763543, 0.5960785, 0, 1, 1,
0.6757559, -0.221114, 2.264304, 0.6039216, 0, 1, 1,
0.6762854, -1.167038, 3.404779, 0.6078432, 0, 1, 1,
0.6779413, -2.065848, 1.823485, 0.6156863, 0, 1, 1,
0.6857126, -1.117271, 2.134606, 0.6196079, 0, 1, 1,
0.6857628, 0.4450265, 0.703722, 0.627451, 0, 1, 1,
0.7026328, -0.5635838, 2.582049, 0.6313726, 0, 1, 1,
0.7041463, -0.8730481, 3.752211, 0.6392157, 0, 1, 1,
0.7042647, -0.348891, 2.543804, 0.6431373, 0, 1, 1,
0.7051204, -1.477774, 2.353122, 0.6509804, 0, 1, 1,
0.7073668, 1.741023, 0.6077406, 0.654902, 0, 1, 1,
0.713084, 2.127679, 2.634174, 0.6627451, 0, 1, 1,
0.7169345, 0.2992086, 3.240369, 0.6666667, 0, 1, 1,
0.7179864, 0.8450387, 1.026119, 0.6745098, 0, 1, 1,
0.7282515, -0.6833561, 2.432202, 0.6784314, 0, 1, 1,
0.72949, 1.953508, 0.1276269, 0.6862745, 0, 1, 1,
0.7317536, 0.6811588, 0.8447752, 0.6901961, 0, 1, 1,
0.7318487, 0.9771222, -0.3023084, 0.6980392, 0, 1, 1,
0.7345052, 0.2030552, 2.084637, 0.7058824, 0, 1, 1,
0.7350085, 0.5496473, 2.829375, 0.7098039, 0, 1, 1,
0.7373216, 0.5285807, 0.7807595, 0.7176471, 0, 1, 1,
0.7387993, 0.4212544, 2.830432, 0.7215686, 0, 1, 1,
0.7393607, -1.562218, 2.71962, 0.7294118, 0, 1, 1,
0.7396173, 0.1787767, 1.534782, 0.7333333, 0, 1, 1,
0.7399055, 1.740848, 0.01128924, 0.7411765, 0, 1, 1,
0.7422753, -1.327786, 1.877246, 0.7450981, 0, 1, 1,
0.7495229, 1.967553, -0.5592393, 0.7529412, 0, 1, 1,
0.7535173, -0.09663924, 3.051812, 0.7568628, 0, 1, 1,
0.7536091, 0.7247722, 1.290383, 0.7647059, 0, 1, 1,
0.7713175, -2.332151, 3.112054, 0.7686275, 0, 1, 1,
0.7717344, -0.3165358, 2.058959, 0.7764706, 0, 1, 1,
0.7757609, 0.27274, -0.6516095, 0.7803922, 0, 1, 1,
0.7765771, 0.8197241, 0.475768, 0.7882353, 0, 1, 1,
0.7766221, 0.3156139, 1.583919, 0.7921569, 0, 1, 1,
0.7767642, 0.7171478, 1.929861, 0.8, 0, 1, 1,
0.7850448, -0.7003816, 1.897689, 0.8078431, 0, 1, 1,
0.7868827, 1.360004, -0.1029155, 0.8117647, 0, 1, 1,
0.792071, 0.2465874, -0.1784726, 0.8196079, 0, 1, 1,
0.7944507, 1.934367, -0.195084, 0.8235294, 0, 1, 1,
0.7949519, -1.340908, 3.104219, 0.8313726, 0, 1, 1,
0.7982288, -0.3271151, 1.370924, 0.8352941, 0, 1, 1,
0.8134652, -0.3291839, 1.868237, 0.8431373, 0, 1, 1,
0.8151786, -0.2354134, 0.6874037, 0.8470588, 0, 1, 1,
0.8178329, -0.6160806, 3.520293, 0.854902, 0, 1, 1,
0.8246014, -0.1164913, 2.9463, 0.8588235, 0, 1, 1,
0.8275574, 0.5531534, 3.26014, 0.8666667, 0, 1, 1,
0.8342116, 0.1958348, 0.9410875, 0.8705882, 0, 1, 1,
0.8391927, 0.724067, 1.574816, 0.8784314, 0, 1, 1,
0.8509439, 0.3870608, 0.203416, 0.8823529, 0, 1, 1,
0.8536491, 2.013467, 0.9615102, 0.8901961, 0, 1, 1,
0.8536511, -0.5602047, 1.609381, 0.8941177, 0, 1, 1,
0.8553652, -0.1750877, 1.267116, 0.9019608, 0, 1, 1,
0.8648162, 0.1616294, 0.7179841, 0.9098039, 0, 1, 1,
0.8664781, -0.1462496, -1.685856, 0.9137255, 0, 1, 1,
0.8708577, 1.535879, -0.5247917, 0.9215686, 0, 1, 1,
0.889069, -0.1292423, 1.293283, 0.9254902, 0, 1, 1,
0.8891808, 1.048442, 1.838398, 0.9333333, 0, 1, 1,
0.8964512, 0.6319005, 0.6469684, 0.9372549, 0, 1, 1,
0.9002466, -0.4374841, 2.763487, 0.945098, 0, 1, 1,
0.9015645, -1.04483, 2.580131, 0.9490196, 0, 1, 1,
0.9028565, 0.1862298, 0.6390975, 0.9568627, 0, 1, 1,
0.9030321, -2.251802, 1.917755, 0.9607843, 0, 1, 1,
0.9037541, 1.163304, -1.356538, 0.9686275, 0, 1, 1,
0.9163613, -0.5260109, 3.199364, 0.972549, 0, 1, 1,
0.9264913, -1.326015, 3.895063, 0.9803922, 0, 1, 1,
0.9269878, 0.1563129, 0.02831815, 0.9843137, 0, 1, 1,
0.9302763, -1.35088, 3.188381, 0.9921569, 0, 1, 1,
0.9368547, -1.271997, 3.621207, 0.9960784, 0, 1, 1,
0.9396914, 1.120367, 1.600043, 1, 0, 0.9960784, 1,
0.9400515, -1.793931, 3.402848, 1, 0, 0.9882353, 1,
0.9444312, -0.6279341, 2.740981, 1, 0, 0.9843137, 1,
0.9459988, -0.09775029, 1.850642, 1, 0, 0.9764706, 1,
0.9465747, -1.047734, 3.887603, 1, 0, 0.972549, 1,
0.9541466, -0.4719294, 3.335853, 1, 0, 0.9647059, 1,
0.9555473, 0.3332612, 1.027738, 1, 0, 0.9607843, 1,
0.9583306, 1.092911, 0.4707582, 1, 0, 0.9529412, 1,
0.96017, 0.1379787, 2.108071, 1, 0, 0.9490196, 1,
0.961226, 0.5922173, -0.9032958, 1, 0, 0.9411765, 1,
0.9662598, 1.794226, 2.49435, 1, 0, 0.9372549, 1,
0.9677833, 0.6157791, 0.6430589, 1, 0, 0.9294118, 1,
0.96867, -0.8944773, 0.6680543, 1, 0, 0.9254902, 1,
0.9737512, -0.6030058, 0.3002136, 1, 0, 0.9176471, 1,
0.9933245, 0.67907, -0.3304578, 1, 0, 0.9137255, 1,
1.014857, -2.038486, 2.54156, 1, 0, 0.9058824, 1,
1.017032, 1.340953, 0.9859419, 1, 0, 0.9019608, 1,
1.017078, -0.4045339, 2.216825, 1, 0, 0.8941177, 1,
1.021054, 1.647778, 0.8757865, 1, 0, 0.8862745, 1,
1.022078, -0.1370128, 0.8926057, 1, 0, 0.8823529, 1,
1.022211, -0.2686631, 2.113224, 1, 0, 0.8745098, 1,
1.043482, 0.3816547, 2.359094, 1, 0, 0.8705882, 1,
1.043972, 0.7997147, 0.6661552, 1, 0, 0.8627451, 1,
1.047237, -1.167905, 0.8453784, 1, 0, 0.8588235, 1,
1.047711, 0.09576777, 0.7961814, 1, 0, 0.8509804, 1,
1.056711, -1.020501, 3.60005, 1, 0, 0.8470588, 1,
1.063181, 1.770682, -0.04683067, 1, 0, 0.8392157, 1,
1.073503, -0.2992515, 2.861206, 1, 0, 0.8352941, 1,
1.07837, -1.586815, 2.135832, 1, 0, 0.827451, 1,
1.079355, 1.70356, 2.63984, 1, 0, 0.8235294, 1,
1.079804, 0.051561, 0.309161, 1, 0, 0.8156863, 1,
1.080802, 0.940278, -0.2706917, 1, 0, 0.8117647, 1,
1.083856, 1.611125, 2.19482, 1, 0, 0.8039216, 1,
1.086163, 1.103231, 1.087799, 1, 0, 0.7960784, 1,
1.090489, 0.3684356, 0.4242976, 1, 0, 0.7921569, 1,
1.097609, -1.233096, 1.970285, 1, 0, 0.7843137, 1,
1.099084, 1.806249, -1.0797, 1, 0, 0.7803922, 1,
1.099577, 1.872415, -1.609524, 1, 0, 0.772549, 1,
1.104619, 0.0646852, 2.561867, 1, 0, 0.7686275, 1,
1.104714, 0.3919381, 2.652093, 1, 0, 0.7607843, 1,
1.113447, 2.115719, 0.1849815, 1, 0, 0.7568628, 1,
1.121204, -0.5389112, 1.627841, 1, 0, 0.7490196, 1,
1.126825, -1.404091, 1.347526, 1, 0, 0.7450981, 1,
1.127074, 0.8858104, 0.06269623, 1, 0, 0.7372549, 1,
1.131213, 2.132127, 0.2896692, 1, 0, 0.7333333, 1,
1.134177, -1.100267, 3.570874, 1, 0, 0.7254902, 1,
1.134679, 1.19138, 2.571049, 1, 0, 0.7215686, 1,
1.137051, -0.795485, 0.9537644, 1, 0, 0.7137255, 1,
1.139087, -2.13292, 2.814326, 1, 0, 0.7098039, 1,
1.141896, -0.9650647, 1.561944, 1, 0, 0.7019608, 1,
1.146695, -0.4144875, 1.356252, 1, 0, 0.6941177, 1,
1.152798, 0.3847481, 1.992146, 1, 0, 0.6901961, 1,
1.152973, 0.05707691, 0.9550845, 1, 0, 0.682353, 1,
1.158781, 1.810077, 1.111636, 1, 0, 0.6784314, 1,
1.160455, 0.6989973, -0.2345376, 1, 0, 0.6705883, 1,
1.163816, 0.5458, 0.4474878, 1, 0, 0.6666667, 1,
1.171421, 0.9163427, 0.01392862, 1, 0, 0.6588235, 1,
1.179905, -0.1366897, 2.022886, 1, 0, 0.654902, 1,
1.187784, 0.1283403, 0.734257, 1, 0, 0.6470588, 1,
1.196946, -0.8160759, 2.87008, 1, 0, 0.6431373, 1,
1.198288, 0.5316449, 1.513487, 1, 0, 0.6352941, 1,
1.200515, 1.049708, 1.228313, 1, 0, 0.6313726, 1,
1.203199, -0.3385994, 1.462364, 1, 0, 0.6235294, 1,
1.204338, -0.5605848, 1.749694, 1, 0, 0.6196079, 1,
1.211634, 0.3852931, 1.936345, 1, 0, 0.6117647, 1,
1.217556, -1.335215, 2.904166, 1, 0, 0.6078432, 1,
1.220452, 1.781213, 0.5892413, 1, 0, 0.6, 1,
1.229173, 1.037841, -0.1005749, 1, 0, 0.5921569, 1,
1.229839, 2.397323, 1.646254, 1, 0, 0.5882353, 1,
1.243748, 0.2685733, 0.2238326, 1, 0, 0.5803922, 1,
1.245857, 0.4607159, 1.194625, 1, 0, 0.5764706, 1,
1.258049, -1.948334, 0.7210625, 1, 0, 0.5686275, 1,
1.260874, 0.5586286, 0.07564029, 1, 0, 0.5647059, 1,
1.264025, -1.846429, 2.19848, 1, 0, 0.5568628, 1,
1.266713, 1.054714, 0.350041, 1, 0, 0.5529412, 1,
1.271703, -0.9341292, 1.726963, 1, 0, 0.5450981, 1,
1.279939, 0.05562069, 0.7992176, 1, 0, 0.5411765, 1,
1.284435, 0.8890647, 0.08048203, 1, 0, 0.5333334, 1,
1.288739, -0.3050447, 3.007585, 1, 0, 0.5294118, 1,
1.29329, 0.4596337, -0.123979, 1, 0, 0.5215687, 1,
1.298623, -0.8703394, 2.996098, 1, 0, 0.5176471, 1,
1.298798, 0.2471793, 2.038529, 1, 0, 0.509804, 1,
1.30143, 1.172315, 0.6480902, 1, 0, 0.5058824, 1,
1.302568, -0.03605404, 2.277867, 1, 0, 0.4980392, 1,
1.311876, -1.190755, 3.44131, 1, 0, 0.4901961, 1,
1.316814, -0.4265028, 0.7266301, 1, 0, 0.4862745, 1,
1.31919, 0.07071893, 2.175589, 1, 0, 0.4784314, 1,
1.323014, 1.394413, 0.09878906, 1, 0, 0.4745098, 1,
1.323744, 1.519617, 0.24676, 1, 0, 0.4666667, 1,
1.348921, 0.8630146, -0.1237069, 1, 0, 0.4627451, 1,
1.361423, -0.993476, 1.104097, 1, 0, 0.454902, 1,
1.362131, 0.5924557, 0.1859592, 1, 0, 0.4509804, 1,
1.363746, 1.679493, 1.854094, 1, 0, 0.4431373, 1,
1.375778, -0.1224172, 2.584839, 1, 0, 0.4392157, 1,
1.383487, -1.616498, 2.603761, 1, 0, 0.4313726, 1,
1.392989, 0.6137576, 1.119223, 1, 0, 0.427451, 1,
1.411619, 0.6039902, 2.781363, 1, 0, 0.4196078, 1,
1.415166, -0.3886883, 2.830272, 1, 0, 0.4156863, 1,
1.419344, 0.4278965, -0.03936424, 1, 0, 0.4078431, 1,
1.419754, 0.2470329, 1.363002, 1, 0, 0.4039216, 1,
1.431247, -1.710184, 2.214984, 1, 0, 0.3960784, 1,
1.433711, -0.3382501, 0.843734, 1, 0, 0.3882353, 1,
1.434263, -0.4175947, 1.511651, 1, 0, 0.3843137, 1,
1.43725, -0.7486852, 2.647191, 1, 0, 0.3764706, 1,
1.437621, 2.254213, -1.576315, 1, 0, 0.372549, 1,
1.437915, 0.6500164, 0.9753739, 1, 0, 0.3647059, 1,
1.439108, 0.3893654, -0.04351757, 1, 0, 0.3607843, 1,
1.439794, -0.9704286, 2.30969, 1, 0, 0.3529412, 1,
1.446275, -1.875502, 1.968456, 1, 0, 0.3490196, 1,
1.4471, 0.4555827, 0.7407894, 1, 0, 0.3411765, 1,
1.451038, 0.4734231, -0.3246855, 1, 0, 0.3372549, 1,
1.462821, 0.4163583, 0.5566044, 1, 0, 0.3294118, 1,
1.464649, 2.193524, 2.255014, 1, 0, 0.3254902, 1,
1.466511, -0.1291323, 0.9147811, 1, 0, 0.3176471, 1,
1.498983, 1.198269, 0.2818495, 1, 0, 0.3137255, 1,
1.523315, -0.877328, 2.677852, 1, 0, 0.3058824, 1,
1.542524, 1.261807, 1.333649, 1, 0, 0.2980392, 1,
1.554806, 2.443137, -0.1738952, 1, 0, 0.2941177, 1,
1.556283, -0.5433912, 2.026649, 1, 0, 0.2862745, 1,
1.564539, -0.2133171, 1.280533, 1, 0, 0.282353, 1,
1.570982, -1.462666, 2.304211, 1, 0, 0.2745098, 1,
1.591209, 1.128127, -0.1614508, 1, 0, 0.2705882, 1,
1.616046, 1.486719, 0.7728253, 1, 0, 0.2627451, 1,
1.619652, 0.2825203, 0.9301226, 1, 0, 0.2588235, 1,
1.642002, 0.8295062, 1.263932, 1, 0, 0.2509804, 1,
1.665303, 0.4555977, -1.009258, 1, 0, 0.2470588, 1,
1.6657, 0.6521171, 1.766738, 1, 0, 0.2392157, 1,
1.673093, 0.1958197, 0.5356077, 1, 0, 0.2352941, 1,
1.68147, 0.9938459, 1.662933, 1, 0, 0.227451, 1,
1.717357, 0.2846269, 1.71563, 1, 0, 0.2235294, 1,
1.724659, 1.211858, 1.425084, 1, 0, 0.2156863, 1,
1.767988, 0.1067135, 0.8328753, 1, 0, 0.2117647, 1,
1.778904, 1.164942, -0.3365456, 1, 0, 0.2039216, 1,
1.805872, -1.00293, 1.474589, 1, 0, 0.1960784, 1,
1.811775, -1.563928, 3.087258, 1, 0, 0.1921569, 1,
1.825049, -0.3046994, 1.477873, 1, 0, 0.1843137, 1,
1.834083, -0.5203007, 2.192554, 1, 0, 0.1803922, 1,
1.856376, 1.243219, 1.234023, 1, 0, 0.172549, 1,
1.856617, 1.108302, 0.723959, 1, 0, 0.1686275, 1,
1.86882, 1.463142, -0.1560378, 1, 0, 0.1607843, 1,
1.878813, -0.05990458, 2.07758, 1, 0, 0.1568628, 1,
1.894855, -0.9557414, 0.4202321, 1, 0, 0.1490196, 1,
1.935239, -1.355827, 1.312299, 1, 0, 0.145098, 1,
1.941608, 1.347223, -0.01704331, 1, 0, 0.1372549, 1,
1.996648, 0.7099803, 1.001054, 1, 0, 0.1333333, 1,
1.99671, 0.3319318, 3.297, 1, 0, 0.1254902, 1,
2.006795, -0.185613, 3.689495, 1, 0, 0.1215686, 1,
2.023456, 2.184436, 0.9157023, 1, 0, 0.1137255, 1,
2.03948, 0.04481974, 1.416629, 1, 0, 0.1098039, 1,
2.075045, -0.9228148, 3.559482, 1, 0, 0.1019608, 1,
2.104369, -0.2669532, 0.5114869, 1, 0, 0.09411765, 1,
2.148061, 0.7152099, 0.04709158, 1, 0, 0.09019608, 1,
2.176427, 0.9341168, 2.570287, 1, 0, 0.08235294, 1,
2.236505, -0.3331777, 1.574001, 1, 0, 0.07843138, 1,
2.239951, 0.7334976, 2.07642, 1, 0, 0.07058824, 1,
2.278614, 0.7774741, 1.818455, 1, 0, 0.06666667, 1,
2.283814, -0.0849625, 1.767213, 1, 0, 0.05882353, 1,
2.30663, -1.59593, 2.062983, 1, 0, 0.05490196, 1,
2.348559, 0.4185141, 0.5185673, 1, 0, 0.04705882, 1,
2.387851, -0.1785915, 2.290394, 1, 0, 0.04313726, 1,
2.415289, 0.2309235, 2.148805, 1, 0, 0.03529412, 1,
2.440157, -1.354861, 2.108424, 1, 0, 0.03137255, 1,
2.513239, -0.4720841, 0.5082597, 1, 0, 0.02352941, 1,
2.554163, -0.5740529, 3.183065, 1, 0, 0.01960784, 1,
2.663741, 1.509403, 2.004812, 1, 0, 0.01176471, 1,
3.363288, -1.145186, 1.748792, 1, 0, 0.007843138, 1
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
-0.09791243, -4.747321, -6.772992, 0, -0.5, 0.5, 0.5,
-0.09791243, -4.747321, -6.772992, 1, -0.5, 0.5, 0.5,
-0.09791243, -4.747321, -6.772992, 1, 1.5, 0.5, 0.5,
-0.09791243, -4.747321, -6.772992, 0, 1.5, 0.5, 0.5
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
-4.73246, -0.1721046, -6.772992, 0, -0.5, 0.5, 0.5,
-4.73246, -0.1721046, -6.772992, 1, -0.5, 0.5, 0.5,
-4.73246, -0.1721046, -6.772992, 1, 1.5, 0.5, 0.5,
-4.73246, -0.1721046, -6.772992, 0, 1.5, 0.5, 0.5
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
-4.73246, -4.747321, 0.3050034, 0, -0.5, 0.5, 0.5,
-4.73246, -4.747321, 0.3050034, 1, -0.5, 0.5, 0.5,
-4.73246, -4.747321, 0.3050034, 1, 1.5, 0.5, 0.5,
-4.73246, -4.747321, 0.3050034, 0, 1.5, 0.5, 0.5
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
-3, -3.691502, -5.139608,
3, -3.691502, -5.139608,
-3, -3.691502, -5.139608,
-3, -3.867472, -5.411839,
-2, -3.691502, -5.139608,
-2, -3.867472, -5.411839,
-1, -3.691502, -5.139608,
-1, -3.867472, -5.411839,
0, -3.691502, -5.139608,
0, -3.867472, -5.411839,
1, -3.691502, -5.139608,
1, -3.867472, -5.411839,
2, -3.691502, -5.139608,
2, -3.867472, -5.411839,
3, -3.691502, -5.139608,
3, -3.867472, -5.411839
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
-3, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
-3, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
-3, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
-3, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
-2, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
-2, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
-2, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
-2, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
-1, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
-1, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
-1, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
-1, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
0, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
0, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
0, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
0, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
1, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
1, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
1, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
1, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
2, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
2, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
2, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
2, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5,
3, -4.219411, -5.9563, 0, -0.5, 0.5, 0.5,
3, -4.219411, -5.9563, 1, -0.5, 0.5, 0.5,
3, -4.219411, -5.9563, 1, 1.5, 0.5, 0.5,
3, -4.219411, -5.9563, 0, 1.5, 0.5, 0.5
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
-3.662949, -3, -5.139608,
-3.662949, 3, -5.139608,
-3.662949, -3, -5.139608,
-3.841201, -3, -5.411839,
-3.662949, -2, -5.139608,
-3.841201, -2, -5.411839,
-3.662949, -1, -5.139608,
-3.841201, -1, -5.411839,
-3.662949, 0, -5.139608,
-3.841201, 0, -5.411839,
-3.662949, 1, -5.139608,
-3.841201, 1, -5.411839,
-3.662949, 2, -5.139608,
-3.841201, 2, -5.411839,
-3.662949, 3, -5.139608,
-3.841201, 3, -5.411839
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
-4.197705, -3, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, -3, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, -3, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, -3, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, -2, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, -2, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, -2, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, -2, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, -1, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, -1, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, -1, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, -1, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, 0, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, 0, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, 0, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, 0, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, 1, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, 1, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, 1, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, 1, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, 2, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, 2, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, 2, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, 2, -5.9563, 0, 1.5, 0.5, 0.5,
-4.197705, 3, -5.9563, 0, -0.5, 0.5, 0.5,
-4.197705, 3, -5.9563, 1, -0.5, 0.5, 0.5,
-4.197705, 3, -5.9563, 1, 1.5, 0.5, 0.5,
-4.197705, 3, -5.9563, 0, 1.5, 0.5, 0.5
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
-3.662949, -3.691502, -4,
-3.662949, -3.691502, 4,
-3.662949, -3.691502, -4,
-3.841201, -3.867472, -4,
-3.662949, -3.691502, -2,
-3.841201, -3.867472, -2,
-3.662949, -3.691502, 0,
-3.841201, -3.867472, 0,
-3.662949, -3.691502, 2,
-3.841201, -3.867472, 2,
-3.662949, -3.691502, 4,
-3.841201, -3.867472, 4
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
-4.197705, -4.219411, -4, 0, -0.5, 0.5, 0.5,
-4.197705, -4.219411, -4, 1, -0.5, 0.5, 0.5,
-4.197705, -4.219411, -4, 1, 1.5, 0.5, 0.5,
-4.197705, -4.219411, -4, 0, 1.5, 0.5, 0.5,
-4.197705, -4.219411, -2, 0, -0.5, 0.5, 0.5,
-4.197705, -4.219411, -2, 1, -0.5, 0.5, 0.5,
-4.197705, -4.219411, -2, 1, 1.5, 0.5, 0.5,
-4.197705, -4.219411, -2, 0, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 0, 0, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 0, 1, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 0, 1, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 0, 0, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 2, 0, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 2, 1, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 2, 1, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 2, 0, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 4, 0, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 4, 1, -0.5, 0.5, 0.5,
-4.197705, -4.219411, 4, 1, 1.5, 0.5, 0.5,
-4.197705, -4.219411, 4, 0, 1.5, 0.5, 0.5
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
-3.662949, -3.691502, -5.139608,
-3.662949, 3.347293, -5.139608,
-3.662949, -3.691502, 5.749615,
-3.662949, 3.347293, 5.749615,
-3.662949, -3.691502, -5.139608,
-3.662949, -3.691502, 5.749615,
-3.662949, 3.347293, -5.139608,
-3.662949, 3.347293, 5.749615,
-3.662949, -3.691502, -5.139608,
3.467124, -3.691502, -5.139608,
-3.662949, -3.691502, 5.749615,
3.467124, -3.691502, 5.749615,
-3.662949, 3.347293, -5.139608,
3.467124, 3.347293, -5.139608,
-3.662949, 3.347293, 5.749615,
3.467124, 3.347293, 5.749615,
3.467124, -3.691502, -5.139608,
3.467124, 3.347293, -5.139608,
3.467124, -3.691502, 5.749615,
3.467124, 3.347293, 5.749615,
3.467124, -3.691502, -5.139608,
3.467124, -3.691502, 5.749615,
3.467124, 3.347293, -5.139608,
3.467124, 3.347293, 5.749615
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
var radius = 7.901429;
var distance = 35.15434;
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
mvMatrix.translate( 0.09791243, 0.1721046, -0.3050034 );
mvMatrix.scale( 1.198189, 1.213728, 0.7845536 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.15434);
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
Chlordane<-read.table("Chlordane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlordane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlordane' not found
```

```r
y<-Chlordane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlordane' not found
```

```r
z<-Chlordane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlordane' not found
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
-3.559113, -0.8377437, -2.733731, 0, 0, 1, 1, 1,
-3.386001, 0.4826104, -1.052832, 1, 0, 0, 1, 1,
-3.358215, 1.177277, -1.147235, 1, 0, 0, 1, 1,
-2.999703, -0.7062351, -1.361796, 1, 0, 0, 1, 1,
-2.535921, 1.162183, -2.234413, 1, 0, 0, 1, 1,
-2.517627, 0.6913288, -2.091451, 1, 0, 0, 1, 1,
-2.424988, -1.882862, -0.197709, 0, 0, 0, 1, 1,
-2.420998, -0.4665573, -1.606368, 0, 0, 0, 1, 1,
-2.384439, -0.1072378, -1.158897, 0, 0, 0, 1, 1,
-2.350886, 1.688284, -1.972278, 0, 0, 0, 1, 1,
-2.298922, 0.9789582, 0.1263367, 0, 0, 0, 1, 1,
-2.283535, 0.2098849, -2.232548, 0, 0, 0, 1, 1,
-2.259708, -1.361511, -2.465181, 0, 0, 0, 1, 1,
-2.222002, 0.5447603, -0.4296223, 1, 1, 1, 1, 1,
-2.205074, 0.5359046, -1.47197, 1, 1, 1, 1, 1,
-2.164789, 0.3000759, 0.4511812, 1, 1, 1, 1, 1,
-2.155794, 0.7688617, -0.6204877, 1, 1, 1, 1, 1,
-2.131403, -0.425734, -1.235997, 1, 1, 1, 1, 1,
-2.091642, 1.640243, -1.914011, 1, 1, 1, 1, 1,
-2.065094, -0.6781366, -0.595135, 1, 1, 1, 1, 1,
-2.054155, 0.8543332, -1.694783, 1, 1, 1, 1, 1,
-2.054068, -0.5447698, -1.995297, 1, 1, 1, 1, 1,
-2.053709, -0.3841658, -1.324608, 1, 1, 1, 1, 1,
-2.013536, -0.2283862, -0.6288526, 1, 1, 1, 1, 1,
-1.981683, 0.1107554, -1.260187, 1, 1, 1, 1, 1,
-1.975964, 0.1204604, -2.092777, 1, 1, 1, 1, 1,
-1.959614, -0.2119043, 0.2170663, 1, 1, 1, 1, 1,
-1.955953, -0.003172372, -1.585082, 1, 1, 1, 1, 1,
-1.924034, -0.5498129, -2.011268, 0, 0, 1, 1, 1,
-1.915395, -0.6583563, -2.485371, 1, 0, 0, 1, 1,
-1.914077, -0.1405234, -1.957733, 1, 0, 0, 1, 1,
-1.897532, -0.623698, -0.3129216, 1, 0, 0, 1, 1,
-1.891831, -1.46333, -3.004869, 1, 0, 0, 1, 1,
-1.852936, -1.012518, -0.7821333, 1, 0, 0, 1, 1,
-1.845637, 1.165693, -1.409694, 0, 0, 0, 1, 1,
-1.837965, -0.07714413, -1.009711, 0, 0, 0, 1, 1,
-1.833279, -0.04774171, 0.3039965, 0, 0, 0, 1, 1,
-1.828784, -0.1995062, -1.842614, 0, 0, 0, 1, 1,
-1.819069, 0.6277364, -1.08989, 0, 0, 0, 1, 1,
-1.817972, -0.9813061, -2.092163, 0, 0, 0, 1, 1,
-1.812267, -0.01116587, -3.107943, 0, 0, 0, 1, 1,
-1.802789, -1.293597, -2.690231, 1, 1, 1, 1, 1,
-1.800816, -0.3731546, -1.73246, 1, 1, 1, 1, 1,
-1.777943, -0.2741495, -2.397797, 1, 1, 1, 1, 1,
-1.767857, 0.4352391, -0.1163485, 1, 1, 1, 1, 1,
-1.767387, -0.9203399, -1.288793, 1, 1, 1, 1, 1,
-1.764472, 1.466361, 0.1675496, 1, 1, 1, 1, 1,
-1.760115, 0.4401048, -2.785481, 1, 1, 1, 1, 1,
-1.754479, 0.2822636, -2.52038, 1, 1, 1, 1, 1,
-1.754433, 1.377678, -0.462328, 1, 1, 1, 1, 1,
-1.73451, -0.6158972, -3.037207, 1, 1, 1, 1, 1,
-1.722353, 0.7030948, -3.49785, 1, 1, 1, 1, 1,
-1.709689, 0.7607312, 0.3777665, 1, 1, 1, 1, 1,
-1.701355, 0.6607913, -1.407568, 1, 1, 1, 1, 1,
-1.69964, 0.1029359, -3.508058, 1, 1, 1, 1, 1,
-1.676314, -0.6348503, -1.496368, 1, 1, 1, 1, 1,
-1.673856, -1.092905, -0.4547056, 0, 0, 1, 1, 1,
-1.650424, -0.1019073, -1.465781, 1, 0, 0, 1, 1,
-1.640267, -0.5718135, -3.042517, 1, 0, 0, 1, 1,
-1.621232, -0.3592247, -2.060097, 1, 0, 0, 1, 1,
-1.619186, -2.315542, -3.368992, 1, 0, 0, 1, 1,
-1.6148, 0.8775969, 1.769112, 1, 0, 0, 1, 1,
-1.597901, -1.773513, -1.222366, 0, 0, 0, 1, 1,
-1.597644, -0.1187592, 0.1329688, 0, 0, 0, 1, 1,
-1.574332, -0.2800206, -1.222855, 0, 0, 0, 1, 1,
-1.572579, 1.110948, -1.129463, 0, 0, 0, 1, 1,
-1.567265, 0.6406184, -2.666749, 0, 0, 0, 1, 1,
-1.563857, 1.438722, 1.152688, 0, 0, 0, 1, 1,
-1.536126, -1.397449, -2.548923, 0, 0, 0, 1, 1,
-1.533756, 0.4387521, -0.1488208, 1, 1, 1, 1, 1,
-1.522389, 0.4098038, -0.7468289, 1, 1, 1, 1, 1,
-1.519645, -0.8350676, -0.1703702, 1, 1, 1, 1, 1,
-1.51881, -1.149604, -1.632533, 1, 1, 1, 1, 1,
-1.509202, 1.634995, -2.01789, 1, 1, 1, 1, 1,
-1.5054, 2.091059, -0.8942487, 1, 1, 1, 1, 1,
-1.499281, -0.0219928, -2.198558, 1, 1, 1, 1, 1,
-1.499134, -2.040841, -2.742211, 1, 1, 1, 1, 1,
-1.485834, -0.9447889, -1.543997, 1, 1, 1, 1, 1,
-1.479111, 0.01251907, -0.7897698, 1, 1, 1, 1, 1,
-1.479064, 0.09970105, -2.745281, 1, 1, 1, 1, 1,
-1.470484, -0.3585695, -1.722566, 1, 1, 1, 1, 1,
-1.453621, 0.4112318, -1.375436, 1, 1, 1, 1, 1,
-1.432684, -0.6581513, -1.418165, 1, 1, 1, 1, 1,
-1.432046, -2.470212, -3.79085, 1, 1, 1, 1, 1,
-1.421599, 0.04796145, -4.460203, 0, 0, 1, 1, 1,
-1.417808, 0.2826677, 0.1816882, 1, 0, 0, 1, 1,
-1.416551, 0.1453784, -2.606608, 1, 0, 0, 1, 1,
-1.405003, 0.3363482, -2.538326, 1, 0, 0, 1, 1,
-1.396104, -0.9316607, -1.171681, 1, 0, 0, 1, 1,
-1.394146, -0.2772114, -3.721527, 1, 0, 0, 1, 1,
-1.392647, -0.6449088, -1.106201, 0, 0, 0, 1, 1,
-1.380226, 0.2087967, -0.3339901, 0, 0, 0, 1, 1,
-1.379743, -0.5211064, -1.376405, 0, 0, 0, 1, 1,
-1.370914, -1.111169, -1.42791, 0, 0, 0, 1, 1,
-1.357403, -0.8792799, -2.51731, 0, 0, 0, 1, 1,
-1.354997, 0.1926409, -1.287675, 0, 0, 0, 1, 1,
-1.349053, -0.225792, -2.243759, 0, 0, 0, 1, 1,
-1.33757, -0.04433933, -2.841604, 1, 1, 1, 1, 1,
-1.333174, 0.1465669, -1.671688, 1, 1, 1, 1, 1,
-1.33249, -1.851597, -2.316546, 1, 1, 1, 1, 1,
-1.326162, -0.1387979, -2.213196, 1, 1, 1, 1, 1,
-1.324603, -1.631664, -1.908108, 1, 1, 1, 1, 1,
-1.320815, 1.22001, -2.677378, 1, 1, 1, 1, 1,
-1.309721, -1.129013, -2.552908, 1, 1, 1, 1, 1,
-1.30527, 1.320221, 0.8465874, 1, 1, 1, 1, 1,
-1.299901, 1.014874, -3.301683, 1, 1, 1, 1, 1,
-1.285583, -0.1699608, -3.077316, 1, 1, 1, 1, 1,
-1.28457, -0.6795101, -3.831526, 1, 1, 1, 1, 1,
-1.284162, 0.7150694, -0.6280342, 1, 1, 1, 1, 1,
-1.276431, 1.27432, -2.400555, 1, 1, 1, 1, 1,
-1.273764, -0.3670468, -2.180701, 1, 1, 1, 1, 1,
-1.271189, 1.459285, -1.734325, 1, 1, 1, 1, 1,
-1.270043, -1.297685, -4.666232, 0, 0, 1, 1, 1,
-1.265909, 0.3680725, -1.30359, 1, 0, 0, 1, 1,
-1.252577, 0.6425704, -1.29852, 1, 0, 0, 1, 1,
-1.248903, 1.590258, 0.7403487, 1, 0, 0, 1, 1,
-1.241529, -0.1180052, -2.055557, 1, 0, 0, 1, 1,
-1.239804, -0.8579418, -3.564908, 1, 0, 0, 1, 1,
-1.239716, 0.2622089, -1.482144, 0, 0, 0, 1, 1,
-1.239082, 0.04283049, -2.598307, 0, 0, 0, 1, 1,
-1.236436, -0.0479106, -2.37328, 0, 0, 0, 1, 1,
-1.227034, 0.4994428, -0.9725858, 0, 0, 0, 1, 1,
-1.226579, -0.4189779, -2.485583, 0, 0, 0, 1, 1,
-1.224736, -1.192743, -2.956004, 0, 0, 0, 1, 1,
-1.222927, -1.04958, -3.606141, 0, 0, 0, 1, 1,
-1.22069, -0.1054578, -0.1829937, 1, 1, 1, 1, 1,
-1.212311, -1.285207, -3.674686, 1, 1, 1, 1, 1,
-1.211868, 0.3377214, -1.035174, 1, 1, 1, 1, 1,
-1.210428, -0.03673691, -1.827083, 1, 1, 1, 1, 1,
-1.208539, -1.54661, -1.08252, 1, 1, 1, 1, 1,
-1.204178, -0.4165298, -0.571659, 1, 1, 1, 1, 1,
-1.193976, -0.9923575, -1.710435, 1, 1, 1, 1, 1,
-1.185894, -0.4163741, -2.755753, 1, 1, 1, 1, 1,
-1.185396, 0.2740209, -0.7772756, 1, 1, 1, 1, 1,
-1.182641, -0.9628192, -2.165241, 1, 1, 1, 1, 1,
-1.17743, 0.1519849, -0.3508144, 1, 1, 1, 1, 1,
-1.174175, -1.559436, -4.077678, 1, 1, 1, 1, 1,
-1.167141, 0.3035121, -2.128113, 1, 1, 1, 1, 1,
-1.163572, -0.2699262, -3.120892, 1, 1, 1, 1, 1,
-1.155617, -0.7541571, -2.083628, 1, 1, 1, 1, 1,
-1.15009, 0.360077, -0.7065398, 0, 0, 1, 1, 1,
-1.148837, -0.05787504, -1.493262, 1, 0, 0, 1, 1,
-1.148424, -1.212773, -1.556945, 1, 0, 0, 1, 1,
-1.140572, 1.202786, -0.4426862, 1, 0, 0, 1, 1,
-1.140437, 0.8950545, -2.368189, 1, 0, 0, 1, 1,
-1.121945, 0.9476873, 0.02214468, 1, 0, 0, 1, 1,
-1.120594, -1.651468, -3.248185, 0, 0, 0, 1, 1,
-1.118497, -0.7528965, -2.374866, 0, 0, 0, 1, 1,
-1.117188, 0.01681191, -1.878269, 0, 0, 0, 1, 1,
-1.101649, -1.847418, -2.628234, 0, 0, 0, 1, 1,
-1.101531, -0.9886152, -3.092854, 0, 0, 0, 1, 1,
-1.100291, -0.3263843, -1.758454, 0, 0, 0, 1, 1,
-1.094142, -0.2887872, -4.766439, 0, 0, 0, 1, 1,
-1.088196, -0.120846, -2.559638, 1, 1, 1, 1, 1,
-1.088066, 0.3174732, -0.7612072, 1, 1, 1, 1, 1,
-1.08303, -0.6875752, -0.3319284, 1, 1, 1, 1, 1,
-1.080221, -0.8147219, -1.284637, 1, 1, 1, 1, 1,
-1.075459, 0.8595271, -1.026066, 1, 1, 1, 1, 1,
-1.071483, -2.261885, -3.39852, 1, 1, 1, 1, 1,
-1.070806, 0.3572892, -0.05752981, 1, 1, 1, 1, 1,
-1.061236, 0.9673951, -0.811375, 1, 1, 1, 1, 1,
-1.043353, -1.270232, -2.345966, 1, 1, 1, 1, 1,
-1.02972, -0.5028828, -2.525059, 1, 1, 1, 1, 1,
-1.029501, 0.7075185, -0.1107038, 1, 1, 1, 1, 1,
-1.025865, -0.1481336, -2.951551, 1, 1, 1, 1, 1,
-1.022303, -1.079161, -2.753942, 1, 1, 1, 1, 1,
-1.017282, -1.03121, -1.689092, 1, 1, 1, 1, 1,
-1.016777, 0.4453139, -0.5291004, 1, 1, 1, 1, 1,
-1.009512, -1.600616, -2.872818, 0, 0, 1, 1, 1,
-1.007389, 1.188569, -0.9522847, 1, 0, 0, 1, 1,
-1.001712, -1.207569, -2.889355, 1, 0, 0, 1, 1,
-0.9895945, 0.1043201, -0.8755593, 1, 0, 0, 1, 1,
-0.9815156, -0.8374285, -3.596686, 1, 0, 0, 1, 1,
-0.9790089, 0.5174388, -2.950857, 1, 0, 0, 1, 1,
-0.9732028, -1.540507, -3.760657, 0, 0, 0, 1, 1,
-0.9691132, 0.9307895, -1.758119, 0, 0, 0, 1, 1,
-0.966229, -1.095737, -3.35058, 0, 0, 0, 1, 1,
-0.963377, 0.4513186, 0.1221813, 0, 0, 0, 1, 1,
-0.9599274, -0.4764562, -1.22682, 0, 0, 0, 1, 1,
-0.9498577, 0.8810883, -1.540257, 0, 0, 0, 1, 1,
-0.9493086, -0.9068878, -3.741476, 0, 0, 0, 1, 1,
-0.9466363, 0.1170924, 0.6798993, 1, 1, 1, 1, 1,
-0.9371887, 0.4037996, -2.603446, 1, 1, 1, 1, 1,
-0.9319043, 1.210523, -0.2004683, 1, 1, 1, 1, 1,
-0.9293929, 0.1234169, -0.9267839, 1, 1, 1, 1, 1,
-0.9149442, 1.300758, -2.006906, 1, 1, 1, 1, 1,
-0.9135315, -0.3181061, -2.581673, 1, 1, 1, 1, 1,
-0.9085797, 1.059509, -0.6398847, 1, 1, 1, 1, 1,
-0.905196, 0.4932625, -0.8522516, 1, 1, 1, 1, 1,
-0.9003769, -3.588995, -2.130168, 1, 1, 1, 1, 1,
-0.8983385, 0.6260998, -0.2510874, 1, 1, 1, 1, 1,
-0.8914645, -0.3131447, -2.66829, 1, 1, 1, 1, 1,
-0.8844721, 1.217212, -0.4944915, 1, 1, 1, 1, 1,
-0.8833331, -0.3382699, -1.310217, 1, 1, 1, 1, 1,
-0.8832985, 0.1355703, -2.14369, 1, 1, 1, 1, 1,
-0.8823924, 0.4856742, -1.560649, 1, 1, 1, 1, 1,
-0.8818615, -1.078933, -2.626255, 0, 0, 1, 1, 1,
-0.8818499, 0.04795766, -4.165215, 1, 0, 0, 1, 1,
-0.8818206, 1.10402, 1.739799, 1, 0, 0, 1, 1,
-0.8723211, 1.236589, 0.4643368, 1, 0, 0, 1, 1,
-0.8705406, -0.07511544, -2.256387, 1, 0, 0, 1, 1,
-0.8668395, 0.02439448, -3.122308, 1, 0, 0, 1, 1,
-0.8638852, -0.7742515, -3.256733, 0, 0, 0, 1, 1,
-0.8606434, -0.2114799, -3.094677, 0, 0, 0, 1, 1,
-0.8555918, 0.1828618, -1.050442, 0, 0, 0, 1, 1,
-0.8475081, -0.4016542, -2.559523, 0, 0, 0, 1, 1,
-0.8439601, -2.236903, -2.863404, 0, 0, 0, 1, 1,
-0.8382861, 1.17851, -0.5288462, 0, 0, 0, 1, 1,
-0.8325392, -1.310942, -2.451307, 0, 0, 0, 1, 1,
-0.8209919, 0.7266582, -2.570761, 1, 1, 1, 1, 1,
-0.8175607, 0.3773597, -0.7811175, 1, 1, 1, 1, 1,
-0.8165989, -0.3138497, 0.1207753, 1, 1, 1, 1, 1,
-0.8128531, 1.569896, -1.17073, 1, 1, 1, 1, 1,
-0.8124728, 1.029667, -0.2944389, 1, 1, 1, 1, 1,
-0.7967639, -1.00423, -2.396488, 1, 1, 1, 1, 1,
-0.7928746, 0.09538449, -1.98036, 1, 1, 1, 1, 1,
-0.7915675, -0.4578727, -0.6319977, 1, 1, 1, 1, 1,
-0.7898731, 1.682532, 1.096383, 1, 1, 1, 1, 1,
-0.7869374, 0.2297669, -1.415386, 1, 1, 1, 1, 1,
-0.7790763, 0.3985535, -1.833831, 1, 1, 1, 1, 1,
-0.7729019, -0.5847389, -0.9351469, 1, 1, 1, 1, 1,
-0.7724625, -0.4184864, -1.19971, 1, 1, 1, 1, 1,
-0.7701918, -0.4196512, -1.931129, 1, 1, 1, 1, 1,
-0.7599323, -0.2479112, -1.711258, 1, 1, 1, 1, 1,
-0.7576402, 0.575936, -0.2490681, 0, 0, 1, 1, 1,
-0.7501991, -1.021084, -1.73747, 1, 0, 0, 1, 1,
-0.7500541, 0.3978766, -0.8640996, 1, 0, 0, 1, 1,
-0.7493376, 1.720611, -0.3402426, 1, 0, 0, 1, 1,
-0.7444532, 0.9618342, -2.506105, 1, 0, 0, 1, 1,
-0.7413935, 0.1164152, 1.056522, 1, 0, 0, 1, 1,
-0.7395611, -0.2729184, -4.127163, 0, 0, 0, 1, 1,
-0.7371516, 0.1058468, -0.1510297, 0, 0, 0, 1, 1,
-0.7366974, -0.5804112, -4.353184, 0, 0, 0, 1, 1,
-0.7361048, -0.6081652, -1.866328, 0, 0, 0, 1, 1,
-0.7344099, 3.244786, -0.1451312, 0, 0, 0, 1, 1,
-0.7328461, -0.9197509, 0.1103537, 0, 0, 0, 1, 1,
-0.7288921, -0.4927265, -3.80902, 0, 0, 0, 1, 1,
-0.7201416, -0.06606225, -2.770644, 1, 1, 1, 1, 1,
-0.7185133, 0.5383341, -0.2760462, 1, 1, 1, 1, 1,
-0.7141869, -1.21513, -3.286711, 1, 1, 1, 1, 1,
-0.7141543, 0.420973, -1.992515, 1, 1, 1, 1, 1,
-0.711974, -0.157698, -1.24262, 1, 1, 1, 1, 1,
-0.710364, -0.65911, -3.101101, 1, 1, 1, 1, 1,
-0.7086253, 0.5296537, -0.9805078, 1, 1, 1, 1, 1,
-0.7044991, -2.596807, -4.123746, 1, 1, 1, 1, 1,
-0.6989206, -0.8433502, -3.680246, 1, 1, 1, 1, 1,
-0.6968403, 0.674646, -0.767797, 1, 1, 1, 1, 1,
-0.6957116, 0.2574157, -0.3905157, 1, 1, 1, 1, 1,
-0.6928748, -1.067536, -2.200711, 1, 1, 1, 1, 1,
-0.6923313, -0.7509773, -1.794328, 1, 1, 1, 1, 1,
-0.665493, -0.336275, -2.330508, 1, 1, 1, 1, 1,
-0.6623874, -0.4094504, -1.402825, 1, 1, 1, 1, 1,
-0.6579614, -0.3080523, -2.019647, 0, 0, 1, 1, 1,
-0.656379, 0.3434673, -0.2532814, 1, 0, 0, 1, 1,
-0.6502766, -0.03276533, -2.330524, 1, 0, 0, 1, 1,
-0.6500821, 1.269403, 1.089941, 1, 0, 0, 1, 1,
-0.6481134, -0.9944908, -2.92191, 1, 0, 0, 1, 1,
-0.6444498, 1.843846, -1.061798, 1, 0, 0, 1, 1,
-0.644042, -0.02291322, -2.452027, 0, 0, 0, 1, 1,
-0.6431743, 0.2063184, -0.986299, 0, 0, 0, 1, 1,
-0.6413203, 0.1777336, -2.074531, 0, 0, 0, 1, 1,
-0.6391071, -1.227168, -3.218834, 0, 0, 0, 1, 1,
-0.6385028, 0.8144374, -2.416977, 0, 0, 0, 1, 1,
-0.6358017, 1.975587, -0.4228096, 0, 0, 0, 1, 1,
-0.6352821, -0.924064, -2.181367, 0, 0, 0, 1, 1,
-0.6296363, -0.07180988, -0.9355302, 1, 1, 1, 1, 1,
-0.623577, 0.852367, -1.547718, 1, 1, 1, 1, 1,
-0.6228186, -0.3496043, -1.823046, 1, 1, 1, 1, 1,
-0.6220177, 0.5096942, -2.49265, 1, 1, 1, 1, 1,
-0.6219729, 0.6290016, -0.7321647, 1, 1, 1, 1, 1,
-0.6214406, -0.7201323, -2.600672, 1, 1, 1, 1, 1,
-0.6201879, -0.1351556, -4.371243, 1, 1, 1, 1, 1,
-0.6182186, -0.04131642, -0.3256026, 1, 1, 1, 1, 1,
-0.6174821, 0.3885663, 1.573103, 1, 1, 1, 1, 1,
-0.6164415, -0.9509574, -1.084309, 1, 1, 1, 1, 1,
-0.6156903, 0.9480951, -1.295012, 1, 1, 1, 1, 1,
-0.6078759, 2.519024, -1.020544, 1, 1, 1, 1, 1,
-0.5995411, 0.438982, -1.449992, 1, 1, 1, 1, 1,
-0.5989861, -1.61826, -2.946972, 1, 1, 1, 1, 1,
-0.5959936, 0.9932058, -1.508038, 1, 1, 1, 1, 1,
-0.592805, 0.2040787, -0.4542246, 0, 0, 1, 1, 1,
-0.5888991, 1.042151, -0.8245549, 1, 0, 0, 1, 1,
-0.5749707, -0.6232337, -3.902528, 1, 0, 0, 1, 1,
-0.5738065, -0.239657, -0.8398273, 1, 0, 0, 1, 1,
-0.5680425, 1.7671, 0.8575988, 1, 0, 0, 1, 1,
-0.5649617, 0.9820828, -1.168504, 1, 0, 0, 1, 1,
-0.5607428, -0.5126241, -3.706961, 0, 0, 0, 1, 1,
-0.5590687, -0.8607079, -2.519444, 0, 0, 0, 1, 1,
-0.555721, 0.3650292, -1.856646, 0, 0, 0, 1, 1,
-0.5483006, -0.5000268, -3.48645, 0, 0, 0, 1, 1,
-0.5447786, 0.1693076, 1.152847, 0, 0, 0, 1, 1,
-0.5434718, 0.1483513, -1.503766, 0, 0, 0, 1, 1,
-0.5357599, 0.4674834, 0.2351504, 0, 0, 0, 1, 1,
-0.5328482, 0.593234, -0.3843465, 1, 1, 1, 1, 1,
-0.5296284, 0.3842651, -1.320536, 1, 1, 1, 1, 1,
-0.5261668, -0.8011448, -0.6082224, 1, 1, 1, 1, 1,
-0.5234284, 0.594816, 0.327508, 1, 1, 1, 1, 1,
-0.5215976, -0.4468267, -0.8377571, 1, 1, 1, 1, 1,
-0.5180622, -0.6806263, -3.379463, 1, 1, 1, 1, 1,
-0.5165963, 0.2194296, -2.338071, 1, 1, 1, 1, 1,
-0.5163609, -0.4037032, -3.852209, 1, 1, 1, 1, 1,
-0.5159549, 0.3214284, -1.165625, 1, 1, 1, 1, 1,
-0.5153946, -1.161883, -2.195108, 1, 1, 1, 1, 1,
-0.5129163, -0.404319, -2.272084, 1, 1, 1, 1, 1,
-0.5107976, 1.276417, -0.3512582, 1, 1, 1, 1, 1,
-0.505766, 1.069549, 2.551774, 1, 1, 1, 1, 1,
-0.4971547, 0.9260735, -1.322863, 1, 1, 1, 1, 1,
-0.4957913, -0.1848152, -1.000573, 1, 1, 1, 1, 1,
-0.4943431, 0.7028224, -1.198434, 0, 0, 1, 1, 1,
-0.4910043, -0.3549691, -1.581674, 1, 0, 0, 1, 1,
-0.4775772, -1.80092, -2.94182, 1, 0, 0, 1, 1,
-0.4771267, 0.3831773, -2.145161, 1, 0, 0, 1, 1,
-0.4767006, -0.2194362, -0.8097637, 1, 0, 0, 1, 1,
-0.4754403, 0.01438359, -0.6504385, 1, 0, 0, 1, 1,
-0.4748847, -0.4840541, -0.2877945, 0, 0, 0, 1, 1,
-0.4708702, 0.7796468, -0.7070852, 0, 0, 0, 1, 1,
-0.4629537, -0.1921018, -2.650078, 0, 0, 0, 1, 1,
-0.4592316, 0.6001093, -0.4700482, 0, 0, 0, 1, 1,
-0.4536324, -1.303434, -3.069266, 0, 0, 0, 1, 1,
-0.4443786, 9.568987e-05, -1.744309, 0, 0, 0, 1, 1,
-0.4427496, 1.207652, 1.00578, 0, 0, 0, 1, 1,
-0.4409652, -2.126856, -3.268213, 1, 1, 1, 1, 1,
-0.4386661, -0.1103361, -3.157356, 1, 1, 1, 1, 1,
-0.4381126, 0.05533205, -0.7454776, 1, 1, 1, 1, 1,
-0.4367486, 0.3165337, -2.40934, 1, 1, 1, 1, 1,
-0.4310666, -0.05432018, -0.617659, 1, 1, 1, 1, 1,
-0.4309025, -1.02959, -3.594764, 1, 1, 1, 1, 1,
-0.4264333, -1.536847, -2.619487, 1, 1, 1, 1, 1,
-0.4210897, 1.444278, -0.6985962, 1, 1, 1, 1, 1,
-0.4201949, 0.4643902, 0.8974437, 1, 1, 1, 1, 1,
-0.4178028, -0.9070721, -3.068757, 1, 1, 1, 1, 1,
-0.4142999, 1.095669, -1.196275, 1, 1, 1, 1, 1,
-0.4120939, -1.833447, -3.795316, 1, 1, 1, 1, 1,
-0.4089291, 2.407444, -0.7997202, 1, 1, 1, 1, 1,
-0.4082141, 0.3544505, -0.7499023, 1, 1, 1, 1, 1,
-0.4070424, 0.3111106, -1.894697, 1, 1, 1, 1, 1,
-0.4056815, 0.07467736, -2.917065, 0, 0, 1, 1, 1,
-0.4020175, 0.05392439, -1.981821, 1, 0, 0, 1, 1,
-0.3999336, -0.7680561, -4.537872, 1, 0, 0, 1, 1,
-0.3927689, 0.7922855, -0.1492894, 1, 0, 0, 1, 1,
-0.3915468, 0.8275843, -1.301288, 1, 0, 0, 1, 1,
-0.3898539, 0.2805831, -0.685224, 1, 0, 0, 1, 1,
-0.3887424, 0.4073505, -2.23719, 0, 0, 0, 1, 1,
-0.3841538, 0.308146, -0.1133658, 0, 0, 0, 1, 1,
-0.3817334, -0.3483078, -2.264771, 0, 0, 0, 1, 1,
-0.3811125, 1.26915, -0.5137904, 0, 0, 0, 1, 1,
-0.3801943, 0.1799151, 0.05917644, 0, 0, 0, 1, 1,
-0.3779402, -0.4849791, -2.956366, 0, 0, 0, 1, 1,
-0.3769942, 0.6405327, -2.550987, 0, 0, 0, 1, 1,
-0.3760403, -1.352509, -4.526511, 1, 1, 1, 1, 1,
-0.3750678, 0.6327533, -0.5614317, 1, 1, 1, 1, 1,
-0.3742349, -0.08855859, -1.676326, 1, 1, 1, 1, 1,
-0.3702715, 1.205416, -1.142343, 1, 1, 1, 1, 1,
-0.3694403, -1.52311, -3.654621, 1, 1, 1, 1, 1,
-0.3680676, -0.120195, -1.162248, 1, 1, 1, 1, 1,
-0.3665324, 1.902526, -0.1581154, 1, 1, 1, 1, 1,
-0.3652495, 0.451419, 0.7550285, 1, 1, 1, 1, 1,
-0.3634346, -1.475204, -3.831636, 1, 1, 1, 1, 1,
-0.3606551, 0.6087409, 1.885828, 1, 1, 1, 1, 1,
-0.35879, 0.8501005, -0.5407296, 1, 1, 1, 1, 1,
-0.3567321, -0.1250848, -1.089479, 1, 1, 1, 1, 1,
-0.3509817, 0.2482206, -2.424252, 1, 1, 1, 1, 1,
-0.3501866, 0.05749358, -1.967197, 1, 1, 1, 1, 1,
-0.3494157, -1.89789, -3.897382, 1, 1, 1, 1, 1,
-0.3471335, 0.1326644, -2.351335, 0, 0, 1, 1, 1,
-0.3464591, -1.199383, -4.801242, 1, 0, 0, 1, 1,
-0.3452294, 0.769967, -0.913197, 1, 0, 0, 1, 1,
-0.3427894, 0.8709946, 0.8772966, 1, 0, 0, 1, 1,
-0.3408825, 0.2812406, 0.8350533, 1, 0, 0, 1, 1,
-0.3389573, 0.4886805, 0.8315403, 1, 0, 0, 1, 1,
-0.3367111, -0.7398213, -2.122548, 0, 0, 0, 1, 1,
-0.3365582, -1.284005, -3.786117, 0, 0, 0, 1, 1,
-0.3348362, -0.3245852, -1.706224, 0, 0, 0, 1, 1,
-0.333211, -0.8261256, -2.603216, 0, 0, 0, 1, 1,
-0.3285686, 0.2964439, -1.77932, 0, 0, 0, 1, 1,
-0.3232416, 0.09745294, -0.3446232, 0, 0, 0, 1, 1,
-0.3208942, -0.6381279, -4.076382, 0, 0, 0, 1, 1,
-0.3198343, -1.136767, -1.71025, 1, 1, 1, 1, 1,
-0.3187608, 0.09302768, -2.489437, 1, 1, 1, 1, 1,
-0.3180489, 0.9037322, -0.8556044, 1, 1, 1, 1, 1,
-0.3150816, 0.3288567, -0.6833907, 1, 1, 1, 1, 1,
-0.3121374, -1.041337, -1.998577, 1, 1, 1, 1, 1,
-0.3093274, 0.5500922, 2.048697, 1, 1, 1, 1, 1,
-0.3051356, -1.13101, -3.068549, 1, 1, 1, 1, 1,
-0.303403, 0.5889478, -1.641589, 1, 1, 1, 1, 1,
-0.2994092, 0.5709372, 0.4641677, 1, 1, 1, 1, 1,
-0.2956403, 0.1741166, -1.724257, 1, 1, 1, 1, 1,
-0.2931351, -0.4369529, -4.981027, 1, 1, 1, 1, 1,
-0.2877432, -0.5778983, -1.540554, 1, 1, 1, 1, 1,
-0.2842966, -0.8359371, -2.776356, 1, 1, 1, 1, 1,
-0.2833994, -0.9675221, -4.440226, 1, 1, 1, 1, 1,
-0.2822644, 1.363652, -0.8744485, 1, 1, 1, 1, 1,
-0.280998, 0.9927502, 1.443962, 0, 0, 1, 1, 1,
-0.2805756, 0.2477211, -1.903511, 1, 0, 0, 1, 1,
-0.2758114, 0.3362135, -0.5381787, 1, 0, 0, 1, 1,
-0.2741921, -0.241508, -1.971454, 1, 0, 0, 1, 1,
-0.2723972, 0.01732228, -0.8795757, 1, 0, 0, 1, 1,
-0.2688648, -0.6248133, -2.523674, 1, 0, 0, 1, 1,
-0.2653311, -2.977925, -3.936117, 0, 0, 0, 1, 1,
-0.262078, -2.440432, -2.026871, 0, 0, 0, 1, 1,
-0.2585475, -0.8628312, -1.561368, 0, 0, 0, 1, 1,
-0.2524693, 0.6096593, 0.6517866, 0, 0, 0, 1, 1,
-0.2431141, 1.021597, 0.9760922, 0, 0, 0, 1, 1,
-0.2338339, -0.5512763, -4.186809, 0, 0, 0, 1, 1,
-0.2335879, 0.2935364, -0.583877, 0, 0, 0, 1, 1,
-0.2306843, 0.1386802, -0.9194962, 1, 1, 1, 1, 1,
-0.2282775, 1.322565, -1.336704, 1, 1, 1, 1, 1,
-0.2272302, 1.143841, -0.07673579, 1, 1, 1, 1, 1,
-0.2182097, -0.4106653, -3.289858, 1, 1, 1, 1, 1,
-0.215183, -0.2444557, -3.36865, 1, 1, 1, 1, 1,
-0.2115933, 0.211046, 1.041922, 1, 1, 1, 1, 1,
-0.2084804, -0.2693298, -0.8832519, 1, 1, 1, 1, 1,
-0.2055273, 0.8206632, -0.5255367, 1, 1, 1, 1, 1,
-0.2048232, 0.03333246, -1.042171, 1, 1, 1, 1, 1,
-0.2029564, -0.1534761, -1.954739, 1, 1, 1, 1, 1,
-0.2021351, -0.1942128, -2.275845, 1, 1, 1, 1, 1,
-0.2003024, 0.2569086, -1.509153, 1, 1, 1, 1, 1,
-0.1965642, -0.532097, -1.843845, 1, 1, 1, 1, 1,
-0.1910928, 0.299154, -1.147467, 1, 1, 1, 1, 1,
-0.1844659, 1.753944, 1.799843, 1, 1, 1, 1, 1,
-0.1843935, -0.03728435, -2.435977, 0, 0, 1, 1, 1,
-0.1836908, 0.02818526, -2.747252, 1, 0, 0, 1, 1,
-0.1830811, -0.4733605, -2.735215, 1, 0, 0, 1, 1,
-0.1812172, -1.052336, -2.09366, 1, 0, 0, 1, 1,
-0.1793773, 0.3524702, -0.02936392, 1, 0, 0, 1, 1,
-0.179309, 0.6854399, -0.02524489, 1, 0, 0, 1, 1,
-0.1773643, -0.5761418, -3.203546, 0, 0, 0, 1, 1,
-0.1760044, 1.776203, -1.624575, 0, 0, 0, 1, 1,
-0.175068, -0.06123328, -1.248768, 0, 0, 0, 1, 1,
-0.1741687, 0.8587953, 0.3434532, 0, 0, 0, 1, 1,
-0.1729734, -0.3880247, -3.310678, 0, 0, 0, 1, 1,
-0.1715386, 0.7230377, -0.6002397, 0, 0, 0, 1, 1,
-0.1677682, -1.418581, -3.337157, 0, 0, 0, 1, 1,
-0.1675546, -0.5366302, -1.957666, 1, 1, 1, 1, 1,
-0.1632966, 2.078368, 0.7986, 1, 1, 1, 1, 1,
-0.1598172, 0.1051905, -0.5393618, 1, 1, 1, 1, 1,
-0.1569845, -0.008864303, -0.6448544, 1, 1, 1, 1, 1,
-0.1546369, 1.101779, -0.9977866, 1, 1, 1, 1, 1,
-0.1534533, -0.6249542, -2.894911, 1, 1, 1, 1, 1,
-0.1525303, 1.244018, 0.06354307, 1, 1, 1, 1, 1,
-0.1523862, 0.05706548, -1.484344, 1, 1, 1, 1, 1,
-0.1477065, -0.6596447, -2.524916, 1, 1, 1, 1, 1,
-0.1465041, -0.239172, -2.435461, 1, 1, 1, 1, 1,
-0.1454945, 0.6917908, -0.4182801, 1, 1, 1, 1, 1,
-0.1447052, -0.7488559, -2.041786, 1, 1, 1, 1, 1,
-0.1441257, -0.7776902, -2.494677, 1, 1, 1, 1, 1,
-0.1421268, -1.164419, -2.250899, 1, 1, 1, 1, 1,
-0.1412129, 1.256034, 2.231211, 1, 1, 1, 1, 1,
-0.1352533, -1.175676, -3.331559, 0, 0, 1, 1, 1,
-0.134149, -0.9640115, -0.6374112, 1, 0, 0, 1, 1,
-0.1323545, -0.8828191, -3.397534, 1, 0, 0, 1, 1,
-0.1314108, 0.2267081, 0.3753001, 1, 0, 0, 1, 1,
-0.1299663, -0.6325482, -1.67704, 1, 0, 0, 1, 1,
-0.1296801, -0.1564051, -2.86068, 1, 0, 0, 1, 1,
-0.1277276, 1.109487, 0.8339675, 0, 0, 0, 1, 1,
-0.1275678, 0.3396781, 0.0002594092, 0, 0, 0, 1, 1,
-0.1246312, 0.6414757, -0.61588, 0, 0, 0, 1, 1,
-0.1229283, -0.1095996, -0.9617202, 0, 0, 0, 1, 1,
-0.1229116, -0.5164776, -4.543447, 0, 0, 0, 1, 1,
-0.1217482, -0.370439, -4.201701, 0, 0, 0, 1, 1,
-0.1197895, -1.635332, -3.760114, 0, 0, 0, 1, 1,
-0.116193, -0.2613333, -3.072845, 1, 1, 1, 1, 1,
-0.1125275, 1.593809, -0.8019282, 1, 1, 1, 1, 1,
-0.1069564, -0.7376602, -3.030556, 1, 1, 1, 1, 1,
-0.1050323, 0.4627061, -0.3257444, 1, 1, 1, 1, 1,
-0.09109889, -0.9251965, -3.495563, 1, 1, 1, 1, 1,
-0.08927604, -0.5622466, -3.579293, 1, 1, 1, 1, 1,
-0.08710153, 0.114761, 0.08665133, 1, 1, 1, 1, 1,
-0.08498377, 0.4364153, 1.87773, 1, 1, 1, 1, 1,
-0.08404532, 0.7398405, -1.82804, 1, 1, 1, 1, 1,
-0.08345413, -0.007087963, -2.42422, 1, 1, 1, 1, 1,
-0.08140635, -0.1358603, -0.8814206, 1, 1, 1, 1, 1,
-0.07816751, -2.924384, -3.718167, 1, 1, 1, 1, 1,
-0.07668619, -0.6667145, -2.740948, 1, 1, 1, 1, 1,
-0.0722758, 0.614053, -0.008831423, 1, 1, 1, 1, 1,
-0.07179821, -0.3345287, -3.288266, 1, 1, 1, 1, 1,
-0.06773832, -0.7089276, -2.632392, 0, 0, 1, 1, 1,
-0.06767458, -2.45421, -3.633454, 1, 0, 0, 1, 1,
-0.06738725, -0.1994989, -3.609682, 1, 0, 0, 1, 1,
-0.05827805, -0.9286711, -4.769819, 1, 0, 0, 1, 1,
-0.05601884, 1.639638, 1.790803, 1, 0, 0, 1, 1,
-0.0552962, 0.903573, -0.9367369, 1, 0, 0, 1, 1,
-0.05355746, -0.2364015, -2.50691, 0, 0, 0, 1, 1,
-0.05219369, 1.418797, -1.967092, 0, 0, 0, 1, 1,
-0.05180933, 1.580211, 0.09800298, 0, 0, 0, 1, 1,
-0.05075786, -2.059993, -2.776343, 0, 0, 0, 1, 1,
-0.05064569, 0.9405257, 0.385462, 0, 0, 0, 1, 1,
-0.04765658, 0.09999228, -0.1733052, 0, 0, 0, 1, 1,
-0.04196552, 1.385095, 0.3692899, 0, 0, 0, 1, 1,
-0.04160444, 0.3551607, -0.3407762, 1, 1, 1, 1, 1,
-0.03760944, 0.8646246, -1.642254, 1, 1, 1, 1, 1,
-0.03650716, -0.06469876, -1.598915, 1, 1, 1, 1, 1,
-0.03380058, 0.1458777, -0.8255703, 1, 1, 1, 1, 1,
-0.03330008, 0.7584088, -0.5061359, 1, 1, 1, 1, 1,
-0.03212821, 0.05041255, 0.03001088, 1, 1, 1, 1, 1,
-0.0309478, -0.3021609, -3.49293, 1, 1, 1, 1, 1,
-0.02843945, -0.3660486, -2.667839, 1, 1, 1, 1, 1,
-0.02531831, 0.8146922, -1.199764, 1, 1, 1, 1, 1,
-0.01993134, 0.7913718, 0.9803596, 1, 1, 1, 1, 1,
-0.01879298, 0.7563038, -0.4350765, 1, 1, 1, 1, 1,
-0.01874932, 0.6044027, -1.198639, 1, 1, 1, 1, 1,
-0.01852825, -1.583842, -4.500884, 1, 1, 1, 1, 1,
-0.01825882, 1.472063, 1.980042, 1, 1, 1, 1, 1,
-0.0179643, -0.05197236, -3.094849, 1, 1, 1, 1, 1,
-0.01381371, -0.1252658, -4.470016, 0, 0, 1, 1, 1,
-0.01246257, 0.6098263, 1.230886, 1, 0, 0, 1, 1,
-0.01189773, -0.3404526, -2.231007, 1, 0, 0, 1, 1,
-0.01045259, 0.03778543, -1.992443, 1, 0, 0, 1, 1,
-0.009185275, 0.04054089, 0.929962, 1, 0, 0, 1, 1,
-0.005150806, 1.663593, 0.6766133, 1, 0, 0, 1, 1,
-0.005051042, 0.6370307, 0.8320261, 0, 0, 0, 1, 1,
-0.0003032762, -0.4242283, -3.806782, 0, 0, 0, 1, 1,
0.009825279, 0.6775143, 0.6258792, 0, 0, 0, 1, 1,
0.01151078, -0.5830551, 2.222055, 0, 0, 0, 1, 1,
0.0140278, 2.395447, 0.7210755, 0, 0, 0, 1, 1,
0.01510028, -1.113649, 5.033502, 0, 0, 0, 1, 1,
0.01765658, 0.3839163, -0.3357744, 0, 0, 0, 1, 1,
0.01988069, 1.038408, 0.4694627, 1, 1, 1, 1, 1,
0.02199863, -0.9883576, 2.167261, 1, 1, 1, 1, 1,
0.02375745, 0.3185747, 1.694222, 1, 1, 1, 1, 1,
0.02620783, 2.992241, -2.532052, 1, 1, 1, 1, 1,
0.02765932, -0.7921197, 3.888649, 1, 1, 1, 1, 1,
0.02789737, -0.1051341, 2.73516, 1, 1, 1, 1, 1,
0.03031832, 0.3346542, -0.5180222, 1, 1, 1, 1, 1,
0.0344783, 0.007008761, 2.585509, 1, 1, 1, 1, 1,
0.03809819, 0.224206, -1.996728, 1, 1, 1, 1, 1,
0.03835469, 0.1753912, 1.901234, 1, 1, 1, 1, 1,
0.04432393, 0.1476425, -1.187811, 1, 1, 1, 1, 1,
0.04881441, -0.5771686, 2.923611, 1, 1, 1, 1, 1,
0.0545174, -0.3138246, 3.763643, 1, 1, 1, 1, 1,
0.05643246, -0.5193242, 1.74217, 1, 1, 1, 1, 1,
0.05677938, 1.602538, -0.2153409, 1, 1, 1, 1, 1,
0.05719296, -0.4786198, 1.842147, 0, 0, 1, 1, 1,
0.06659774, 0.8132163, 0.13365, 1, 0, 0, 1, 1,
0.06818476, 0.5059471, -0.8536442, 1, 0, 0, 1, 1,
0.06907594, -1.065338, 3.133185, 1, 0, 0, 1, 1,
0.07374323, -1.76836, 3.881604, 1, 0, 0, 1, 1,
0.07381577, -0.8691381, 3.64132, 1, 0, 0, 1, 1,
0.07640369, -0.3228456, 3.48843, 0, 0, 0, 1, 1,
0.08338441, 0.7733946, -0.3404097, 0, 0, 0, 1, 1,
0.08393636, -0.346202, 3.201233, 0, 0, 0, 1, 1,
0.08671106, -0.2540013, 0.5867226, 0, 0, 0, 1, 1,
0.08724581, 0.6549274, 1.577352, 0, 0, 0, 1, 1,
0.08782649, -1.485228, 5.023971, 0, 0, 0, 1, 1,
0.09148531, -2.164361, 1.484957, 0, 0, 0, 1, 1,
0.0977523, 0.9396127, -0.8908677, 1, 1, 1, 1, 1,
0.09901702, 0.2086662, 1.520341, 1, 1, 1, 1, 1,
0.1018926, 1.547621, -0.8086034, 1, 1, 1, 1, 1,
0.1021668, 0.1028734, -0.6413685, 1, 1, 1, 1, 1,
0.1055621, 0.02435913, 0.8174148, 1, 1, 1, 1, 1,
0.1076495, -1.046337, 3.683286, 1, 1, 1, 1, 1,
0.1079203, 0.4211729, 0.02062111, 1, 1, 1, 1, 1,
0.1091385, 0.5055685, 1.024259, 1, 1, 1, 1, 1,
0.1104681, 1.001854, -0.3019232, 1, 1, 1, 1, 1,
0.1133261, 0.03856646, 0.5736607, 1, 1, 1, 1, 1,
0.1133549, 1.573352, 0.02435898, 1, 1, 1, 1, 1,
0.1133752, 0.8889509, 0.4246551, 1, 1, 1, 1, 1,
0.1139112, 0.8784806, 0.1191689, 1, 1, 1, 1, 1,
0.1145024, -0.3762366, 4.281405, 1, 1, 1, 1, 1,
0.1172118, 1.731623, -1.138572, 1, 1, 1, 1, 1,
0.1182318, -1.307387, 1.882368, 0, 0, 1, 1, 1,
0.1194316, -0.7525171, 1.533029, 1, 0, 0, 1, 1,
0.1214921, -0.950373, 2.238569, 1, 0, 0, 1, 1,
0.1234599, 1.252419, -0.2383292, 1, 0, 0, 1, 1,
0.1300749, 0.5687034, -0.04598356, 1, 0, 0, 1, 1,
0.1312039, 0.1770883, 1.75061, 1, 0, 0, 1, 1,
0.1337826, 0.04797899, 0.07334188, 0, 0, 0, 1, 1,
0.1365028, -0.6798184, 0.9256661, 0, 0, 0, 1, 1,
0.1379172, 2.362634, -0.9552951, 0, 0, 0, 1, 1,
0.1401537, 0.2951037, -0.4459397, 0, 0, 0, 1, 1,
0.1403778, -1.064491, 2.31602, 0, 0, 0, 1, 1,
0.1413869, 0.5777373, 1.410925, 0, 0, 0, 1, 1,
0.1417308, 0.8431205, -0.8194766, 0, 0, 0, 1, 1,
0.1420501, -0.7785267, 2.202007, 1, 1, 1, 1, 1,
0.1423283, 0.4927281, 0.5737745, 1, 1, 1, 1, 1,
0.1465967, 1.000063, 0.3498735, 1, 1, 1, 1, 1,
0.146953, -0.4098912, 2.008374, 1, 1, 1, 1, 1,
0.148806, 0.286598, -0.7376863, 1, 1, 1, 1, 1,
0.1489256, 0.3560672, -2.380659, 1, 1, 1, 1, 1,
0.1500862, -0.7860855, 2.242678, 1, 1, 1, 1, 1,
0.1512021, -0.8708789, 2.798182, 1, 1, 1, 1, 1,
0.15581, -0.1727864, 2.818359, 1, 1, 1, 1, 1,
0.1568122, -0.9779027, 3.669, 1, 1, 1, 1, 1,
0.1572807, -0.3066593, 1.832374, 1, 1, 1, 1, 1,
0.1643472, -0.06403851, 2.178595, 1, 1, 1, 1, 1,
0.1686827, -0.5092114, 2.498296, 1, 1, 1, 1, 1,
0.1705582, -0.2408949, 3.227378, 1, 1, 1, 1, 1,
0.1728517, 0.4485415, -1.069791, 1, 1, 1, 1, 1,
0.1733576, -0.5468729, 4.039315, 0, 0, 1, 1, 1,
0.1746276, -1.125788, 3.520656, 1, 0, 0, 1, 1,
0.1747821, 0.04043982, 2.218272, 1, 0, 0, 1, 1,
0.17732, 0.453761, -0.7356585, 1, 0, 0, 1, 1,
0.1795209, 0.345092, 1.284318, 1, 0, 0, 1, 1,
0.1805188, -1.087456, 3.862003, 1, 0, 0, 1, 1,
0.1886908, -0.05968931, 2.19382, 0, 0, 0, 1, 1,
0.1896972, 0.3383362, 1.380598, 0, 0, 0, 1, 1,
0.1930853, 1.296622, -0.5310513, 0, 0, 0, 1, 1,
0.1996938, 0.4202003, 1.428992, 0, 0, 0, 1, 1,
0.2007979, 0.3925796, -0.7658876, 0, 0, 0, 1, 1,
0.2032485, -0.752758, 5.522293, 0, 0, 0, 1, 1,
0.203336, 0.152534, 0.5351413, 0, 0, 0, 1, 1,
0.2043458, -1.13977, 3.735163, 1, 1, 1, 1, 1,
0.2054908, 0.09697863, 1.639931, 1, 1, 1, 1, 1,
0.2067525, 1.148457, 1.203167, 1, 1, 1, 1, 1,
0.2092864, -0.105881, 1.952342, 1, 1, 1, 1, 1,
0.2093471, 0.4398252, 1.13426, 1, 1, 1, 1, 1,
0.2117955, -1.568219, 2.45998, 1, 1, 1, 1, 1,
0.2137896, -0.1098024, 2.837146, 1, 1, 1, 1, 1,
0.2150738, 0.307423, 1.987367, 1, 1, 1, 1, 1,
0.2222128, -0.001983706, 2.426197, 1, 1, 1, 1, 1,
0.2243856, 0.4454995, 1.321741, 1, 1, 1, 1, 1,
0.2271452, -2.085487, 3.73572, 1, 1, 1, 1, 1,
0.2395024, -1.384903, 1.825237, 1, 1, 1, 1, 1,
0.2396417, 0.1021887, 2.348539, 1, 1, 1, 1, 1,
0.2441291, 1.466067, -0.04139022, 1, 1, 1, 1, 1,
0.246976, -1.155421, 2.592754, 1, 1, 1, 1, 1,
0.2471077, -0.1280744, 1.187254, 0, 0, 1, 1, 1,
0.2482607, 2.482103, -0.5519853, 1, 0, 0, 1, 1,
0.2489021, 0.548886, 2.162902, 1, 0, 0, 1, 1,
0.2529002, 1.211604, -0.378684, 1, 0, 0, 1, 1,
0.2579895, 0.04302815, 2.177908, 1, 0, 0, 1, 1,
0.2599052, -0.3694436, 3.878918, 1, 0, 0, 1, 1,
0.2641881, 0.9772518, -1.31933, 0, 0, 0, 1, 1,
0.2661952, 1.636795, -0.08706372, 0, 0, 0, 1, 1,
0.2702278, -0.1039702, 3.395652, 0, 0, 0, 1, 1,
0.2716685, 1.254683, 0.9688547, 0, 0, 0, 1, 1,
0.2717213, -0.1791344, 2.127353, 0, 0, 0, 1, 1,
0.2719589, 1.87481, 0.1030933, 0, 0, 0, 1, 1,
0.2782998, 0.1185855, 0.490523, 0, 0, 0, 1, 1,
0.2792389, -0.1431093, 1.408899, 1, 1, 1, 1, 1,
0.2808244, -1.971061, 3.456316, 1, 1, 1, 1, 1,
0.2838663, 0.2334805, 0.3348753, 1, 1, 1, 1, 1,
0.2867253, 1.339131, -0.1334591, 1, 1, 1, 1, 1,
0.2877522, -0.1123646, 2.175928, 1, 1, 1, 1, 1,
0.2885061, -0.5091183, 4.070318, 1, 1, 1, 1, 1,
0.2898111, 0.2118145, 0.4320998, 1, 1, 1, 1, 1,
0.291119, 0.767782, 0.7096084, 1, 1, 1, 1, 1,
0.2919832, 0.949738, -0.6282976, 1, 1, 1, 1, 1,
0.2969879, -1.523924, 3.067615, 1, 1, 1, 1, 1,
0.2977266, -0.7835106, 2.545131, 1, 1, 1, 1, 1,
0.2982719, -0.008780932, -0.2068387, 1, 1, 1, 1, 1,
0.3021386, -0.849704, 1.903713, 1, 1, 1, 1, 1,
0.3050204, 1.067804, 0.7180337, 1, 1, 1, 1, 1,
0.3135078, -1.416258, 3.245712, 1, 1, 1, 1, 1,
0.3144269, -0.6150133, 1.146271, 0, 0, 1, 1, 1,
0.3150141, -0.5906677, 3.107269, 1, 0, 0, 1, 1,
0.31591, 0.3108599, 1.142258, 1, 0, 0, 1, 1,
0.3208536, 0.07163931, 2.431836, 1, 0, 0, 1, 1,
0.3225683, 0.6035362, 1.004825, 1, 0, 0, 1, 1,
0.3245464, 0.6192865, 1.701068, 1, 0, 0, 1, 1,
0.3271473, 0.6779059, 2.041076, 0, 0, 0, 1, 1,
0.3305247, -0.3225322, 5.591034, 0, 0, 0, 1, 1,
0.3418064, 0.9824485, 0.9654937, 0, 0, 0, 1, 1,
0.3448277, -1.445047, 3.480392, 0, 0, 0, 1, 1,
0.3454058, -0.3006446, 2.830275, 0, 0, 0, 1, 1,
0.3501613, 0.1467175, 2.017103, 0, 0, 0, 1, 1,
0.3528811, 0.4458703, 0.7085773, 0, 0, 0, 1, 1,
0.3538386, 1.324287, 2.259945, 1, 1, 1, 1, 1,
0.3539781, 0.7967777, 0.9273735, 1, 1, 1, 1, 1,
0.3547912, -0.5494118, 2.846511, 1, 1, 1, 1, 1,
0.3557408, -0.2602115, 1.960812, 1, 1, 1, 1, 1,
0.360858, 1.12658, 0.5080847, 1, 1, 1, 1, 1,
0.36549, -0.9871866, 3.51013, 1, 1, 1, 1, 1,
0.3672878, 0.5346383, 0.3446937, 1, 1, 1, 1, 1,
0.3707986, -1.606026, 0.6854591, 1, 1, 1, 1, 1,
0.3737172, 2.469033, -0.1719878, 1, 1, 1, 1, 1,
0.3810185, 0.1745496, 0.6153095, 1, 1, 1, 1, 1,
0.3825785, 0.09028179, -0.05867593, 1, 1, 1, 1, 1,
0.3911409, -0.8249257, 1.613735, 1, 1, 1, 1, 1,
0.3924728, 1.089482, 0.8100569, 1, 1, 1, 1, 1,
0.3929279, 0.1427704, -0.1883959, 1, 1, 1, 1, 1,
0.4047768, 0.5621447, 2.187835, 1, 1, 1, 1, 1,
0.4056967, 1.258772, -0.7812167, 0, 0, 1, 1, 1,
0.4076208, 0.6178957, 0.03094988, 1, 0, 0, 1, 1,
0.4081209, -1.784495, 3.14375, 1, 0, 0, 1, 1,
0.4097733, -0.2679884, 2.893641, 1, 0, 0, 1, 1,
0.4134352, 1.910478, -0.6095052, 1, 0, 0, 1, 1,
0.4137225, -1.312506, 3.847349, 1, 0, 0, 1, 1,
0.4140377, -1.012269, 1.444623, 0, 0, 0, 1, 1,
0.4142467, -0.6018188, 2.527813, 0, 0, 0, 1, 1,
0.4168551, -0.5843005, 1.302303, 0, 0, 0, 1, 1,
0.4187264, -0.4670332, 3.628475, 0, 0, 0, 1, 1,
0.423127, -0.5625124, 4.417342, 0, 0, 0, 1, 1,
0.4242706, 1.553171, 2.287711, 0, 0, 0, 1, 1,
0.4282982, 0.2499675, 0.4856376, 0, 0, 0, 1, 1,
0.4291603, -0.2258295, 2.285202, 1, 1, 1, 1, 1,
0.4292936, -1.349343, 1.575809, 1, 1, 1, 1, 1,
0.4388988, -0.9435449, 1.566814, 1, 1, 1, 1, 1,
0.4424663, -1.72068, 3.12826, 1, 1, 1, 1, 1,
0.4436214, -1.414515, 2.884724, 1, 1, 1, 1, 1,
0.4458293, 1.196352, -0.1409411, 1, 1, 1, 1, 1,
0.4493475, -0.8582347, 3.687844, 1, 1, 1, 1, 1,
0.4529193, -0.1812702, 2.632115, 1, 1, 1, 1, 1,
0.4550477, -1.025004, 2.206763, 1, 1, 1, 1, 1,
0.4565388, 0.3413543, 0.1438108, 1, 1, 1, 1, 1,
0.4579566, 0.9367008, -0.5015026, 1, 1, 1, 1, 1,
0.4663551, 2.020098, 0.6245059, 1, 1, 1, 1, 1,
0.469007, -0.3997138, 4.131686, 1, 1, 1, 1, 1,
0.4703479, -0.4202191, 3.053249, 1, 1, 1, 1, 1,
0.4720031, -0.2577966, 0.4788233, 1, 1, 1, 1, 1,
0.4809962, 0.6753005, 0.9399152, 0, 0, 1, 1, 1,
0.4831705, 1.711947, 0.1375548, 1, 0, 0, 1, 1,
0.4932603, 0.7363148, -0.1205295, 1, 0, 0, 1, 1,
0.5004122, -0.517975, 3.026116, 1, 0, 0, 1, 1,
0.506635, 0.3377122, 0.9005404, 1, 0, 0, 1, 1,
0.5067088, -0.03415478, 1.069042, 1, 0, 0, 1, 1,
0.5072964, 1.137559, 0.9002572, 0, 0, 0, 1, 1,
0.5087345, -1.22795, 2.466274, 0, 0, 0, 1, 1,
0.5092546, -0.3968412, 2.221895, 0, 0, 0, 1, 1,
0.5093707, 0.6483139, 0.5842128, 0, 0, 0, 1, 1,
0.5240699, 0.04799686, 1.755951, 0, 0, 0, 1, 1,
0.5327756, -0.778118, 1.373764, 0, 0, 0, 1, 1,
0.5365883, 0.640048, 0.2200626, 0, 0, 0, 1, 1,
0.5400848, -0.1605233, 1.975721, 1, 1, 1, 1, 1,
0.5410966, -0.9278653, 1.319542, 1, 1, 1, 1, 1,
0.5412248, 0.7863806, 1.583527, 1, 1, 1, 1, 1,
0.5471662, 1.234686, 0.1913206, 1, 1, 1, 1, 1,
0.5485335, -0.1091018, 1.018057, 1, 1, 1, 1, 1,
0.5505561, -1.754979, 3.377442, 1, 1, 1, 1, 1,
0.5511339, -1.809125, 2.362827, 1, 1, 1, 1, 1,
0.555815, -1.018862, 2.550796, 1, 1, 1, 1, 1,
0.5567046, 2.739528, 0.4833945, 1, 1, 1, 1, 1,
0.5658564, -1.111954, 2.680491, 1, 1, 1, 1, 1,
0.5665084, -0.9939535, 3.385922, 1, 1, 1, 1, 1,
0.566655, -0.8510079, 1.393173, 1, 1, 1, 1, 1,
0.5693516, -1.357638, 2.414616, 1, 1, 1, 1, 1,
0.5701159, 0.7476731, 1.685724, 1, 1, 1, 1, 1,
0.5795704, 1.106116, -0.5042536, 1, 1, 1, 1, 1,
0.5817828, -0.9879364, 2.462219, 0, 0, 1, 1, 1,
0.5834371, 0.55005, 1.522105, 1, 0, 0, 1, 1,
0.5837774, -0.2270389, -0.05346479, 1, 0, 0, 1, 1,
0.5863858, 0.15615, 1.91264, 1, 0, 0, 1, 1,
0.5881727, -1.575889, 4.074807, 1, 0, 0, 1, 1,
0.5975325, 1.00377, 0.5533904, 1, 0, 0, 1, 1,
0.5987069, -0.4395888, 2.6445, 0, 0, 0, 1, 1,
0.5998583, -1.057953, 3.441896, 0, 0, 0, 1, 1,
0.5999094, 0.385022, 1.063771, 0, 0, 0, 1, 1,
0.6052615, -0.05541954, 2.312105, 0, 0, 0, 1, 1,
0.6077631, -0.6886281, 3.569146, 0, 0, 0, 1, 1,
0.6121547, 1.307607, 0.1584577, 0, 0, 0, 1, 1,
0.6181055, -0.5794982, 1.172416, 0, 0, 0, 1, 1,
0.6200625, 0.4657326, 0.1737439, 1, 1, 1, 1, 1,
0.6210471, -1.449366, 0.9353542, 1, 1, 1, 1, 1,
0.6215367, 0.2426734, 2.702837, 1, 1, 1, 1, 1,
0.6224532, 0.8881706, -0.4592998, 1, 1, 1, 1, 1,
0.6234899, 0.7584572, 0.3358886, 1, 1, 1, 1, 1,
0.6240399, -1.816984, 2.287971, 1, 1, 1, 1, 1,
0.6259323, -0.7293455, 1.697893, 1, 1, 1, 1, 1,
0.6266919, -1.647331, 2.34801, 1, 1, 1, 1, 1,
0.6307414, -0.6388077, 1.886655, 1, 1, 1, 1, 1,
0.6332416, -0.1890637, 1.621047, 1, 1, 1, 1, 1,
0.6385339, 0.7311075, 0.6695228, 1, 1, 1, 1, 1,
0.6412629, -0.7127998, 3.056396, 1, 1, 1, 1, 1,
0.6470443, 1.861561, -1.022033, 1, 1, 1, 1, 1,
0.6476809, 1.165207, 2.093763, 1, 1, 1, 1, 1,
0.6479698, -0.06237532, 0.9442431, 1, 1, 1, 1, 1,
0.6491988, -1.568908, 0.7855951, 0, 0, 1, 1, 1,
0.6507458, 1.628669, -0.006016138, 1, 0, 0, 1, 1,
0.6529289, -2.115535, 2.001335, 1, 0, 0, 1, 1,
0.6562665, -0.2223641, 1.530711, 1, 0, 0, 1, 1,
0.6574357, -1.131044, 1.283976, 1, 0, 0, 1, 1,
0.6586511, -0.381962, 0.9521956, 1, 0, 0, 1, 1,
0.6643421, 1.101139, 1.750511, 0, 0, 0, 1, 1,
0.6677591, 0.5913855, 0.3164834, 0, 0, 0, 1, 1,
0.6710675, -0.163205, 0.7519702, 0, 0, 0, 1, 1,
0.6722043, 0.9649173, 1.985553, 0, 0, 0, 1, 1,
0.6744663, 0.4120862, 0.3763543, 0, 0, 0, 1, 1,
0.6757559, -0.221114, 2.264304, 0, 0, 0, 1, 1,
0.6762854, -1.167038, 3.404779, 0, 0, 0, 1, 1,
0.6779413, -2.065848, 1.823485, 1, 1, 1, 1, 1,
0.6857126, -1.117271, 2.134606, 1, 1, 1, 1, 1,
0.6857628, 0.4450265, 0.703722, 1, 1, 1, 1, 1,
0.7026328, -0.5635838, 2.582049, 1, 1, 1, 1, 1,
0.7041463, -0.8730481, 3.752211, 1, 1, 1, 1, 1,
0.7042647, -0.348891, 2.543804, 1, 1, 1, 1, 1,
0.7051204, -1.477774, 2.353122, 1, 1, 1, 1, 1,
0.7073668, 1.741023, 0.6077406, 1, 1, 1, 1, 1,
0.713084, 2.127679, 2.634174, 1, 1, 1, 1, 1,
0.7169345, 0.2992086, 3.240369, 1, 1, 1, 1, 1,
0.7179864, 0.8450387, 1.026119, 1, 1, 1, 1, 1,
0.7282515, -0.6833561, 2.432202, 1, 1, 1, 1, 1,
0.72949, 1.953508, 0.1276269, 1, 1, 1, 1, 1,
0.7317536, 0.6811588, 0.8447752, 1, 1, 1, 1, 1,
0.7318487, 0.9771222, -0.3023084, 1, 1, 1, 1, 1,
0.7345052, 0.2030552, 2.084637, 0, 0, 1, 1, 1,
0.7350085, 0.5496473, 2.829375, 1, 0, 0, 1, 1,
0.7373216, 0.5285807, 0.7807595, 1, 0, 0, 1, 1,
0.7387993, 0.4212544, 2.830432, 1, 0, 0, 1, 1,
0.7393607, -1.562218, 2.71962, 1, 0, 0, 1, 1,
0.7396173, 0.1787767, 1.534782, 1, 0, 0, 1, 1,
0.7399055, 1.740848, 0.01128924, 0, 0, 0, 1, 1,
0.7422753, -1.327786, 1.877246, 0, 0, 0, 1, 1,
0.7495229, 1.967553, -0.5592393, 0, 0, 0, 1, 1,
0.7535173, -0.09663924, 3.051812, 0, 0, 0, 1, 1,
0.7536091, 0.7247722, 1.290383, 0, 0, 0, 1, 1,
0.7713175, -2.332151, 3.112054, 0, 0, 0, 1, 1,
0.7717344, -0.3165358, 2.058959, 0, 0, 0, 1, 1,
0.7757609, 0.27274, -0.6516095, 1, 1, 1, 1, 1,
0.7765771, 0.8197241, 0.475768, 1, 1, 1, 1, 1,
0.7766221, 0.3156139, 1.583919, 1, 1, 1, 1, 1,
0.7767642, 0.7171478, 1.929861, 1, 1, 1, 1, 1,
0.7850448, -0.7003816, 1.897689, 1, 1, 1, 1, 1,
0.7868827, 1.360004, -0.1029155, 1, 1, 1, 1, 1,
0.792071, 0.2465874, -0.1784726, 1, 1, 1, 1, 1,
0.7944507, 1.934367, -0.195084, 1, 1, 1, 1, 1,
0.7949519, -1.340908, 3.104219, 1, 1, 1, 1, 1,
0.7982288, -0.3271151, 1.370924, 1, 1, 1, 1, 1,
0.8134652, -0.3291839, 1.868237, 1, 1, 1, 1, 1,
0.8151786, -0.2354134, 0.6874037, 1, 1, 1, 1, 1,
0.8178329, -0.6160806, 3.520293, 1, 1, 1, 1, 1,
0.8246014, -0.1164913, 2.9463, 1, 1, 1, 1, 1,
0.8275574, 0.5531534, 3.26014, 1, 1, 1, 1, 1,
0.8342116, 0.1958348, 0.9410875, 0, 0, 1, 1, 1,
0.8391927, 0.724067, 1.574816, 1, 0, 0, 1, 1,
0.8509439, 0.3870608, 0.203416, 1, 0, 0, 1, 1,
0.8536491, 2.013467, 0.9615102, 1, 0, 0, 1, 1,
0.8536511, -0.5602047, 1.609381, 1, 0, 0, 1, 1,
0.8553652, -0.1750877, 1.267116, 1, 0, 0, 1, 1,
0.8648162, 0.1616294, 0.7179841, 0, 0, 0, 1, 1,
0.8664781, -0.1462496, -1.685856, 0, 0, 0, 1, 1,
0.8708577, 1.535879, -0.5247917, 0, 0, 0, 1, 1,
0.889069, -0.1292423, 1.293283, 0, 0, 0, 1, 1,
0.8891808, 1.048442, 1.838398, 0, 0, 0, 1, 1,
0.8964512, 0.6319005, 0.6469684, 0, 0, 0, 1, 1,
0.9002466, -0.4374841, 2.763487, 0, 0, 0, 1, 1,
0.9015645, -1.04483, 2.580131, 1, 1, 1, 1, 1,
0.9028565, 0.1862298, 0.6390975, 1, 1, 1, 1, 1,
0.9030321, -2.251802, 1.917755, 1, 1, 1, 1, 1,
0.9037541, 1.163304, -1.356538, 1, 1, 1, 1, 1,
0.9163613, -0.5260109, 3.199364, 1, 1, 1, 1, 1,
0.9264913, -1.326015, 3.895063, 1, 1, 1, 1, 1,
0.9269878, 0.1563129, 0.02831815, 1, 1, 1, 1, 1,
0.9302763, -1.35088, 3.188381, 1, 1, 1, 1, 1,
0.9368547, -1.271997, 3.621207, 1, 1, 1, 1, 1,
0.9396914, 1.120367, 1.600043, 1, 1, 1, 1, 1,
0.9400515, -1.793931, 3.402848, 1, 1, 1, 1, 1,
0.9444312, -0.6279341, 2.740981, 1, 1, 1, 1, 1,
0.9459988, -0.09775029, 1.850642, 1, 1, 1, 1, 1,
0.9465747, -1.047734, 3.887603, 1, 1, 1, 1, 1,
0.9541466, -0.4719294, 3.335853, 1, 1, 1, 1, 1,
0.9555473, 0.3332612, 1.027738, 0, 0, 1, 1, 1,
0.9583306, 1.092911, 0.4707582, 1, 0, 0, 1, 1,
0.96017, 0.1379787, 2.108071, 1, 0, 0, 1, 1,
0.961226, 0.5922173, -0.9032958, 1, 0, 0, 1, 1,
0.9662598, 1.794226, 2.49435, 1, 0, 0, 1, 1,
0.9677833, 0.6157791, 0.6430589, 1, 0, 0, 1, 1,
0.96867, -0.8944773, 0.6680543, 0, 0, 0, 1, 1,
0.9737512, -0.6030058, 0.3002136, 0, 0, 0, 1, 1,
0.9933245, 0.67907, -0.3304578, 0, 0, 0, 1, 1,
1.014857, -2.038486, 2.54156, 0, 0, 0, 1, 1,
1.017032, 1.340953, 0.9859419, 0, 0, 0, 1, 1,
1.017078, -0.4045339, 2.216825, 0, 0, 0, 1, 1,
1.021054, 1.647778, 0.8757865, 0, 0, 0, 1, 1,
1.022078, -0.1370128, 0.8926057, 1, 1, 1, 1, 1,
1.022211, -0.2686631, 2.113224, 1, 1, 1, 1, 1,
1.043482, 0.3816547, 2.359094, 1, 1, 1, 1, 1,
1.043972, 0.7997147, 0.6661552, 1, 1, 1, 1, 1,
1.047237, -1.167905, 0.8453784, 1, 1, 1, 1, 1,
1.047711, 0.09576777, 0.7961814, 1, 1, 1, 1, 1,
1.056711, -1.020501, 3.60005, 1, 1, 1, 1, 1,
1.063181, 1.770682, -0.04683067, 1, 1, 1, 1, 1,
1.073503, -0.2992515, 2.861206, 1, 1, 1, 1, 1,
1.07837, -1.586815, 2.135832, 1, 1, 1, 1, 1,
1.079355, 1.70356, 2.63984, 1, 1, 1, 1, 1,
1.079804, 0.051561, 0.309161, 1, 1, 1, 1, 1,
1.080802, 0.940278, -0.2706917, 1, 1, 1, 1, 1,
1.083856, 1.611125, 2.19482, 1, 1, 1, 1, 1,
1.086163, 1.103231, 1.087799, 1, 1, 1, 1, 1,
1.090489, 0.3684356, 0.4242976, 0, 0, 1, 1, 1,
1.097609, -1.233096, 1.970285, 1, 0, 0, 1, 1,
1.099084, 1.806249, -1.0797, 1, 0, 0, 1, 1,
1.099577, 1.872415, -1.609524, 1, 0, 0, 1, 1,
1.104619, 0.0646852, 2.561867, 1, 0, 0, 1, 1,
1.104714, 0.3919381, 2.652093, 1, 0, 0, 1, 1,
1.113447, 2.115719, 0.1849815, 0, 0, 0, 1, 1,
1.121204, -0.5389112, 1.627841, 0, 0, 0, 1, 1,
1.126825, -1.404091, 1.347526, 0, 0, 0, 1, 1,
1.127074, 0.8858104, 0.06269623, 0, 0, 0, 1, 1,
1.131213, 2.132127, 0.2896692, 0, 0, 0, 1, 1,
1.134177, -1.100267, 3.570874, 0, 0, 0, 1, 1,
1.134679, 1.19138, 2.571049, 0, 0, 0, 1, 1,
1.137051, -0.795485, 0.9537644, 1, 1, 1, 1, 1,
1.139087, -2.13292, 2.814326, 1, 1, 1, 1, 1,
1.141896, -0.9650647, 1.561944, 1, 1, 1, 1, 1,
1.146695, -0.4144875, 1.356252, 1, 1, 1, 1, 1,
1.152798, 0.3847481, 1.992146, 1, 1, 1, 1, 1,
1.152973, 0.05707691, 0.9550845, 1, 1, 1, 1, 1,
1.158781, 1.810077, 1.111636, 1, 1, 1, 1, 1,
1.160455, 0.6989973, -0.2345376, 1, 1, 1, 1, 1,
1.163816, 0.5458, 0.4474878, 1, 1, 1, 1, 1,
1.171421, 0.9163427, 0.01392862, 1, 1, 1, 1, 1,
1.179905, -0.1366897, 2.022886, 1, 1, 1, 1, 1,
1.187784, 0.1283403, 0.734257, 1, 1, 1, 1, 1,
1.196946, -0.8160759, 2.87008, 1, 1, 1, 1, 1,
1.198288, 0.5316449, 1.513487, 1, 1, 1, 1, 1,
1.200515, 1.049708, 1.228313, 1, 1, 1, 1, 1,
1.203199, -0.3385994, 1.462364, 0, 0, 1, 1, 1,
1.204338, -0.5605848, 1.749694, 1, 0, 0, 1, 1,
1.211634, 0.3852931, 1.936345, 1, 0, 0, 1, 1,
1.217556, -1.335215, 2.904166, 1, 0, 0, 1, 1,
1.220452, 1.781213, 0.5892413, 1, 0, 0, 1, 1,
1.229173, 1.037841, -0.1005749, 1, 0, 0, 1, 1,
1.229839, 2.397323, 1.646254, 0, 0, 0, 1, 1,
1.243748, 0.2685733, 0.2238326, 0, 0, 0, 1, 1,
1.245857, 0.4607159, 1.194625, 0, 0, 0, 1, 1,
1.258049, -1.948334, 0.7210625, 0, 0, 0, 1, 1,
1.260874, 0.5586286, 0.07564029, 0, 0, 0, 1, 1,
1.264025, -1.846429, 2.19848, 0, 0, 0, 1, 1,
1.266713, 1.054714, 0.350041, 0, 0, 0, 1, 1,
1.271703, -0.9341292, 1.726963, 1, 1, 1, 1, 1,
1.279939, 0.05562069, 0.7992176, 1, 1, 1, 1, 1,
1.284435, 0.8890647, 0.08048203, 1, 1, 1, 1, 1,
1.288739, -0.3050447, 3.007585, 1, 1, 1, 1, 1,
1.29329, 0.4596337, -0.123979, 1, 1, 1, 1, 1,
1.298623, -0.8703394, 2.996098, 1, 1, 1, 1, 1,
1.298798, 0.2471793, 2.038529, 1, 1, 1, 1, 1,
1.30143, 1.172315, 0.6480902, 1, 1, 1, 1, 1,
1.302568, -0.03605404, 2.277867, 1, 1, 1, 1, 1,
1.311876, -1.190755, 3.44131, 1, 1, 1, 1, 1,
1.316814, -0.4265028, 0.7266301, 1, 1, 1, 1, 1,
1.31919, 0.07071893, 2.175589, 1, 1, 1, 1, 1,
1.323014, 1.394413, 0.09878906, 1, 1, 1, 1, 1,
1.323744, 1.519617, 0.24676, 1, 1, 1, 1, 1,
1.348921, 0.8630146, -0.1237069, 1, 1, 1, 1, 1,
1.361423, -0.993476, 1.104097, 0, 0, 1, 1, 1,
1.362131, 0.5924557, 0.1859592, 1, 0, 0, 1, 1,
1.363746, 1.679493, 1.854094, 1, 0, 0, 1, 1,
1.375778, -0.1224172, 2.584839, 1, 0, 0, 1, 1,
1.383487, -1.616498, 2.603761, 1, 0, 0, 1, 1,
1.392989, 0.6137576, 1.119223, 1, 0, 0, 1, 1,
1.411619, 0.6039902, 2.781363, 0, 0, 0, 1, 1,
1.415166, -0.3886883, 2.830272, 0, 0, 0, 1, 1,
1.419344, 0.4278965, -0.03936424, 0, 0, 0, 1, 1,
1.419754, 0.2470329, 1.363002, 0, 0, 0, 1, 1,
1.431247, -1.710184, 2.214984, 0, 0, 0, 1, 1,
1.433711, -0.3382501, 0.843734, 0, 0, 0, 1, 1,
1.434263, -0.4175947, 1.511651, 0, 0, 0, 1, 1,
1.43725, -0.7486852, 2.647191, 1, 1, 1, 1, 1,
1.437621, 2.254213, -1.576315, 1, 1, 1, 1, 1,
1.437915, 0.6500164, 0.9753739, 1, 1, 1, 1, 1,
1.439108, 0.3893654, -0.04351757, 1, 1, 1, 1, 1,
1.439794, -0.9704286, 2.30969, 1, 1, 1, 1, 1,
1.446275, -1.875502, 1.968456, 1, 1, 1, 1, 1,
1.4471, 0.4555827, 0.7407894, 1, 1, 1, 1, 1,
1.451038, 0.4734231, -0.3246855, 1, 1, 1, 1, 1,
1.462821, 0.4163583, 0.5566044, 1, 1, 1, 1, 1,
1.464649, 2.193524, 2.255014, 1, 1, 1, 1, 1,
1.466511, -0.1291323, 0.9147811, 1, 1, 1, 1, 1,
1.498983, 1.198269, 0.2818495, 1, 1, 1, 1, 1,
1.523315, -0.877328, 2.677852, 1, 1, 1, 1, 1,
1.542524, 1.261807, 1.333649, 1, 1, 1, 1, 1,
1.554806, 2.443137, -0.1738952, 1, 1, 1, 1, 1,
1.556283, -0.5433912, 2.026649, 0, 0, 1, 1, 1,
1.564539, -0.2133171, 1.280533, 1, 0, 0, 1, 1,
1.570982, -1.462666, 2.304211, 1, 0, 0, 1, 1,
1.591209, 1.128127, -0.1614508, 1, 0, 0, 1, 1,
1.616046, 1.486719, 0.7728253, 1, 0, 0, 1, 1,
1.619652, 0.2825203, 0.9301226, 1, 0, 0, 1, 1,
1.642002, 0.8295062, 1.263932, 0, 0, 0, 1, 1,
1.665303, 0.4555977, -1.009258, 0, 0, 0, 1, 1,
1.6657, 0.6521171, 1.766738, 0, 0, 0, 1, 1,
1.673093, 0.1958197, 0.5356077, 0, 0, 0, 1, 1,
1.68147, 0.9938459, 1.662933, 0, 0, 0, 1, 1,
1.717357, 0.2846269, 1.71563, 0, 0, 0, 1, 1,
1.724659, 1.211858, 1.425084, 0, 0, 0, 1, 1,
1.767988, 0.1067135, 0.8328753, 1, 1, 1, 1, 1,
1.778904, 1.164942, -0.3365456, 1, 1, 1, 1, 1,
1.805872, -1.00293, 1.474589, 1, 1, 1, 1, 1,
1.811775, -1.563928, 3.087258, 1, 1, 1, 1, 1,
1.825049, -0.3046994, 1.477873, 1, 1, 1, 1, 1,
1.834083, -0.5203007, 2.192554, 1, 1, 1, 1, 1,
1.856376, 1.243219, 1.234023, 1, 1, 1, 1, 1,
1.856617, 1.108302, 0.723959, 1, 1, 1, 1, 1,
1.86882, 1.463142, -0.1560378, 1, 1, 1, 1, 1,
1.878813, -0.05990458, 2.07758, 1, 1, 1, 1, 1,
1.894855, -0.9557414, 0.4202321, 1, 1, 1, 1, 1,
1.935239, -1.355827, 1.312299, 1, 1, 1, 1, 1,
1.941608, 1.347223, -0.01704331, 1, 1, 1, 1, 1,
1.996648, 0.7099803, 1.001054, 1, 1, 1, 1, 1,
1.99671, 0.3319318, 3.297, 1, 1, 1, 1, 1,
2.006795, -0.185613, 3.689495, 0, 0, 1, 1, 1,
2.023456, 2.184436, 0.9157023, 1, 0, 0, 1, 1,
2.03948, 0.04481974, 1.416629, 1, 0, 0, 1, 1,
2.075045, -0.9228148, 3.559482, 1, 0, 0, 1, 1,
2.104369, -0.2669532, 0.5114869, 1, 0, 0, 1, 1,
2.148061, 0.7152099, 0.04709158, 1, 0, 0, 1, 1,
2.176427, 0.9341168, 2.570287, 0, 0, 0, 1, 1,
2.236505, -0.3331777, 1.574001, 0, 0, 0, 1, 1,
2.239951, 0.7334976, 2.07642, 0, 0, 0, 1, 1,
2.278614, 0.7774741, 1.818455, 0, 0, 0, 1, 1,
2.283814, -0.0849625, 1.767213, 0, 0, 0, 1, 1,
2.30663, -1.59593, 2.062983, 0, 0, 0, 1, 1,
2.348559, 0.4185141, 0.5185673, 0, 0, 0, 1, 1,
2.387851, -0.1785915, 2.290394, 1, 1, 1, 1, 1,
2.415289, 0.2309235, 2.148805, 1, 1, 1, 1, 1,
2.440157, -1.354861, 2.108424, 1, 1, 1, 1, 1,
2.513239, -0.4720841, 0.5082597, 1, 1, 1, 1, 1,
2.554163, -0.5740529, 3.183065, 1, 1, 1, 1, 1,
2.663741, 1.509403, 2.004812, 1, 1, 1, 1, 1,
3.363288, -1.145186, 1.748792, 1, 1, 1, 1, 1
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
var radius = 9.772398;
var distance = 34.32513;
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
mvMatrix.translate( 0.09791255, 0.1721044, -0.3050034 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32513);
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