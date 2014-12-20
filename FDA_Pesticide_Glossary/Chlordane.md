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
-3.629993, 0.3963944, -2.864648, 1, 0, 0, 1,
-2.881957, -0.9833494, -2.889163, 1, 0.007843138, 0, 1,
-2.713242, -0.03835074, -0.6627647, 1, 0.01176471, 0, 1,
-2.681379, -0.456387, -2.246939, 1, 0.01960784, 0, 1,
-2.574862, -0.1850708, -2.643657, 1, 0.02352941, 0, 1,
-2.425658, 0.7527537, -2.541837, 1, 0.03137255, 0, 1,
-2.372661, -0.769955, -1.726172, 1, 0.03529412, 0, 1,
-2.350432, 0.6007326, -2.341536, 1, 0.04313726, 0, 1,
-2.348157, -0.05312711, -2.097543, 1, 0.04705882, 0, 1,
-2.304951, -0.3699574, -4.216201, 1, 0.05490196, 0, 1,
-2.262874, 0.7579287, -0.6999871, 1, 0.05882353, 0, 1,
-2.247292, -1.168181, -2.209185, 1, 0.06666667, 0, 1,
-2.206462, -0.1556922, -2.6042, 1, 0.07058824, 0, 1,
-2.157937, 1.004255, 0.5573062, 1, 0.07843138, 0, 1,
-2.15528, -0.4588189, -1.973133, 1, 0.08235294, 0, 1,
-2.132812, 0.9523115, -0.6047356, 1, 0.09019608, 0, 1,
-2.117072, 0.7993483, -0.27622, 1, 0.09411765, 0, 1,
-2.106798, -1.007031, -1.714485, 1, 0.1019608, 0, 1,
-2.068393, -1.928473, -2.46206, 1, 0.1098039, 0, 1,
-2.040033, 1.453426, -1.149574, 1, 0.1137255, 0, 1,
-2.025009, -0.8221092, -1.430554, 1, 0.1215686, 0, 1,
-2.009542, -0.7854714, -1.556284, 1, 0.1254902, 0, 1,
-1.944747, -0.7987506, -3.054278, 1, 0.1333333, 0, 1,
-1.925488, -1.302047, -2.276739, 1, 0.1372549, 0, 1,
-1.845058, 1.510432, -0.3885652, 1, 0.145098, 0, 1,
-1.839819, -0.6745695, 0.0486844, 1, 0.1490196, 0, 1,
-1.832018, -0.222273, -2.712881, 1, 0.1568628, 0, 1,
-1.828952, -1.48177, -2.164374, 1, 0.1607843, 0, 1,
-1.813674, -0.3885305, -3.362303, 1, 0.1686275, 0, 1,
-1.80474, -0.4571438, -0.7240322, 1, 0.172549, 0, 1,
-1.79305, 1.358101, 0.5284615, 1, 0.1803922, 0, 1,
-1.784585, -1.057288, -4.007904, 1, 0.1843137, 0, 1,
-1.779853, -1.192288, -2.37921, 1, 0.1921569, 0, 1,
-1.773903, -0.1164178, -2.324362, 1, 0.1960784, 0, 1,
-1.769657, 1.130071, -2.378778, 1, 0.2039216, 0, 1,
-1.760069, 1.24182, -3.075283, 1, 0.2117647, 0, 1,
-1.74185, -0.635224, -0.6413296, 1, 0.2156863, 0, 1,
-1.737673, 0.6093143, -1.85839, 1, 0.2235294, 0, 1,
-1.722588, -0.3222694, -3.143147, 1, 0.227451, 0, 1,
-1.708073, -1.301808, -2.448418, 1, 0.2352941, 0, 1,
-1.700505, 1.139187, -0.9492445, 1, 0.2392157, 0, 1,
-1.692757, 0.7380853, -1.622656, 1, 0.2470588, 0, 1,
-1.688739, 1.65047, -1.566645, 1, 0.2509804, 0, 1,
-1.675929, -0.03188648, -0.8704638, 1, 0.2588235, 0, 1,
-1.661615, 0.8804079, -0.7725586, 1, 0.2627451, 0, 1,
-1.659242, 0.6820111, 0.02693116, 1, 0.2705882, 0, 1,
-1.656894, -1.306387, -2.300166, 1, 0.2745098, 0, 1,
-1.652287, -0.04252749, -2.160001, 1, 0.282353, 0, 1,
-1.640383, 0.2288264, -3.074347, 1, 0.2862745, 0, 1,
-1.636553, -0.1871718, -1.363842, 1, 0.2941177, 0, 1,
-1.633647, 2.261855, 0.04743642, 1, 0.3019608, 0, 1,
-1.625358, 0.9319921, -1.306977, 1, 0.3058824, 0, 1,
-1.624454, 0.7482197, -1.938243, 1, 0.3137255, 0, 1,
-1.621115, -1.112166, -3.202316, 1, 0.3176471, 0, 1,
-1.619843, 0.6585494, -0.32014, 1, 0.3254902, 0, 1,
-1.61981, 1.491127, -0.8522424, 1, 0.3294118, 0, 1,
-1.61793, 0.4465122, -3.640226, 1, 0.3372549, 0, 1,
-1.617269, -0.616043, -0.7979575, 1, 0.3411765, 0, 1,
-1.616904, -1.15047, -1.258978, 1, 0.3490196, 0, 1,
-1.606355, 0.8005201, -2.777799, 1, 0.3529412, 0, 1,
-1.605408, -0.593806, -0.7798206, 1, 0.3607843, 0, 1,
-1.604717, -0.2140896, -1.833391, 1, 0.3647059, 0, 1,
-1.599985, -0.9772568, -2.227016, 1, 0.372549, 0, 1,
-1.592801, -1.261744, -1.262949, 1, 0.3764706, 0, 1,
-1.582038, 1.104712, -0.8343847, 1, 0.3843137, 0, 1,
-1.581287, -0.5938051, -2.197333, 1, 0.3882353, 0, 1,
-1.561566, -2.108298, -3.026955, 1, 0.3960784, 0, 1,
-1.56118, -0.3500115, -2.761567, 1, 0.4039216, 0, 1,
-1.561169, 0.8198036, -2.522528, 1, 0.4078431, 0, 1,
-1.555065, 0.6693361, -1.316456, 1, 0.4156863, 0, 1,
-1.554428, -0.5221944, -0.9719823, 1, 0.4196078, 0, 1,
-1.546823, -0.4998717, -1.441172, 1, 0.427451, 0, 1,
-1.545711, -0.1089775, -2.158695, 1, 0.4313726, 0, 1,
-1.543213, -1.415769, -2.947559, 1, 0.4392157, 0, 1,
-1.542415, -0.2758552, -4.470164, 1, 0.4431373, 0, 1,
-1.539081, 1.371551, -0.7460963, 1, 0.4509804, 0, 1,
-1.534014, -0.008225699, -0.843066, 1, 0.454902, 0, 1,
-1.516176, 0.05264092, -0.7923764, 1, 0.4627451, 0, 1,
-1.494188, -0.1598246, -1.165592, 1, 0.4666667, 0, 1,
-1.491138, 0.7555904, -1.482488, 1, 0.4745098, 0, 1,
-1.466846, 1.504297, -1.433986, 1, 0.4784314, 0, 1,
-1.46667, -1.29993, -3.66197, 1, 0.4862745, 0, 1,
-1.449253, 0.5142114, -0.8842964, 1, 0.4901961, 0, 1,
-1.445646, 2.857917, -0.6874557, 1, 0.4980392, 0, 1,
-1.431234, -1.511196, -4.023992, 1, 0.5058824, 0, 1,
-1.429742, -1.571227, -1.809338, 1, 0.509804, 0, 1,
-1.423856, 0.6112063, -2.108077, 1, 0.5176471, 0, 1,
-1.418319, 0.2366851, 0.5591972, 1, 0.5215687, 0, 1,
-1.415934, -1.157577, -2.377337, 1, 0.5294118, 0, 1,
-1.411985, -0.5596399, -1.528152, 1, 0.5333334, 0, 1,
-1.406032, 0.8446885, -0.1169186, 1, 0.5411765, 0, 1,
-1.400867, 1.057693, -0.6136518, 1, 0.5450981, 0, 1,
-1.392434, -0.4029758, -1.63395, 1, 0.5529412, 0, 1,
-1.389271, -1.144838, -0.6923395, 1, 0.5568628, 0, 1,
-1.37576, 0.8139179, -2.095509, 1, 0.5647059, 0, 1,
-1.372911, 0.06145971, -0.9689007, 1, 0.5686275, 0, 1,
-1.372389, -0.6770323, -3.413097, 1, 0.5764706, 0, 1,
-1.370856, 0.2450978, -2.501519, 1, 0.5803922, 0, 1,
-1.369445, 0.5790801, -2.810085, 1, 0.5882353, 0, 1,
-1.359017, 0.1153436, -2.683568, 1, 0.5921569, 0, 1,
-1.3481, -0.820837, -3.343987, 1, 0.6, 0, 1,
-1.346051, 0.232127, -1.636984, 1, 0.6078432, 0, 1,
-1.34262, -2.538642, -3.071652, 1, 0.6117647, 0, 1,
-1.330386, 0.354086, -0.2990386, 1, 0.6196079, 0, 1,
-1.320402, -0.7149792, -0.3265879, 1, 0.6235294, 0, 1,
-1.310768, -0.01116588, -1.408216, 1, 0.6313726, 0, 1,
-1.309648, 0.5052276, -1.007855, 1, 0.6352941, 0, 1,
-1.294524, -0.7953621, -2.093905, 1, 0.6431373, 0, 1,
-1.283765, -0.4565428, -1.55624, 1, 0.6470588, 0, 1,
-1.271362, 0.03472304, -1.134018, 1, 0.654902, 0, 1,
-1.26503, -0.3960483, -2.864941, 1, 0.6588235, 0, 1,
-1.252348, -0.6255249, -2.507921, 1, 0.6666667, 0, 1,
-1.248919, -0.1554989, -3.042387, 1, 0.6705883, 0, 1,
-1.232403, -0.9298565, -2.514983, 1, 0.6784314, 0, 1,
-1.230996, -1.720009, -2.403663, 1, 0.682353, 0, 1,
-1.228047, 1.729211, 0.2877857, 1, 0.6901961, 0, 1,
-1.224702, -0.4405038, -2.302006, 1, 0.6941177, 0, 1,
-1.223905, 1.877797, 1.446559, 1, 0.7019608, 0, 1,
-1.217784, 0.3635895, -0.5605918, 1, 0.7098039, 0, 1,
-1.215147, 0.5391253, -0.6865304, 1, 0.7137255, 0, 1,
-1.210402, -0.5095576, -1.331049, 1, 0.7215686, 0, 1,
-1.204082, -0.8661886, -1.07924, 1, 0.7254902, 0, 1,
-1.2036, -0.09763734, -2.550822, 1, 0.7333333, 0, 1,
-1.191361, 1.812427, -0.6111259, 1, 0.7372549, 0, 1,
-1.189334, -1.226637, -1.954329, 1, 0.7450981, 0, 1,
-1.18764, 0.6230804, -0.3445586, 1, 0.7490196, 0, 1,
-1.186639, -0.1496398, -1.703476, 1, 0.7568628, 0, 1,
-1.171088, 0.2039201, -2.378621, 1, 0.7607843, 0, 1,
-1.151939, 2.310486, -0.5295284, 1, 0.7686275, 0, 1,
-1.149977, 1.390449, -1.810523, 1, 0.772549, 0, 1,
-1.140735, -0.1866838, -1.151178, 1, 0.7803922, 0, 1,
-1.135308, 1.191581, -1.950708, 1, 0.7843137, 0, 1,
-1.13479, 0.4319052, 1.184314, 1, 0.7921569, 0, 1,
-1.131335, 1.636261, -1.62533, 1, 0.7960784, 0, 1,
-1.127736, 0.8786302, -0.7570162, 1, 0.8039216, 0, 1,
-1.127307, 1.564559, -1.285302, 1, 0.8117647, 0, 1,
-1.112822, -1.045241, -1.931889, 1, 0.8156863, 0, 1,
-1.111154, -4.100804, -3.992101, 1, 0.8235294, 0, 1,
-1.104476, 0.9108268, -0.09921005, 1, 0.827451, 0, 1,
-1.103213, -0.195548, -0.843178, 1, 0.8352941, 0, 1,
-1.102107, 0.172179, -2.490005, 1, 0.8392157, 0, 1,
-1.097611, -0.6197089, -4.017495, 1, 0.8470588, 0, 1,
-1.097175, 0.2958135, -1.912888, 1, 0.8509804, 0, 1,
-1.095839, 0.09717599, -2.086182, 1, 0.8588235, 0, 1,
-1.09553, -0.08123896, -2.027411, 1, 0.8627451, 0, 1,
-1.094414, 0.1087677, -0.5158919, 1, 0.8705882, 0, 1,
-1.093096, 1.722816, 0.215227, 1, 0.8745098, 0, 1,
-1.083041, 0.7085042, -1.861511, 1, 0.8823529, 0, 1,
-1.080508, -0.4934354, -0.07883726, 1, 0.8862745, 0, 1,
-1.070182, -1.064229, -1.603126, 1, 0.8941177, 0, 1,
-1.068758, -1.0149, -3.714137, 1, 0.8980392, 0, 1,
-1.067339, 1.592774, -0.6540807, 1, 0.9058824, 0, 1,
-1.067059, 1.661895, -0.1891268, 1, 0.9137255, 0, 1,
-1.066431, -1.040662, -1.685029, 1, 0.9176471, 0, 1,
-1.064814, -0.8924099, -3.492508, 1, 0.9254902, 0, 1,
-1.063381, 1.112932, 0.01194322, 1, 0.9294118, 0, 1,
-1.057336, -1.301196, -1.33535, 1, 0.9372549, 0, 1,
-1.047178, -0.8059244, -1.333562, 1, 0.9411765, 0, 1,
-1.04445, -0.967609, -1.785653, 1, 0.9490196, 0, 1,
-1.043934, 0.02169639, -0.86399, 1, 0.9529412, 0, 1,
-1.042196, -0.6292492, -3.795858, 1, 0.9607843, 0, 1,
-1.021392, 0.7900546, -0.6055956, 1, 0.9647059, 0, 1,
-1.018163, 0.1923007, -2.307493, 1, 0.972549, 0, 1,
-1.017117, 0.9114907, -2.72262, 1, 0.9764706, 0, 1,
-1.015421, 0.6069662, -2.527436, 1, 0.9843137, 0, 1,
-1.01409, -0.1574872, -2.690855, 1, 0.9882353, 0, 1,
-1.013096, 1.033046, -1.61052, 1, 0.9960784, 0, 1,
-1.007966, -0.560342, -2.610609, 0.9960784, 1, 0, 1,
-1.004063, 1.306162, -0.5828003, 0.9921569, 1, 0, 1,
-0.9981803, -0.9159978, -3.42348, 0.9843137, 1, 0, 1,
-0.9948502, 0.4541374, 0.7452458, 0.9803922, 1, 0, 1,
-0.9792081, -0.4230469, -1.275149, 0.972549, 1, 0, 1,
-0.9663038, 0.9644594, -0.4217054, 0.9686275, 1, 0, 1,
-0.9629767, 1.237999, -0.8595055, 0.9607843, 1, 0, 1,
-0.9608739, 1.123998, -0.7111434, 0.9568627, 1, 0, 1,
-0.9601479, 0.1911322, -0.5662475, 0.9490196, 1, 0, 1,
-0.9593002, 0.7824823, 0.6680623, 0.945098, 1, 0, 1,
-0.9590943, -0.9316542, -1.710727, 0.9372549, 1, 0, 1,
-0.9584823, 0.2096918, -2.404018, 0.9333333, 1, 0, 1,
-0.9583163, 0.1339546, -0.4000006, 0.9254902, 1, 0, 1,
-0.951087, -0.5397384, -1.894449, 0.9215686, 1, 0, 1,
-0.9471071, 0.1505324, -0.2198437, 0.9137255, 1, 0, 1,
-0.9439445, 0.9329262, -0.01935055, 0.9098039, 1, 0, 1,
-0.9428193, 1.585014, 0.4566182, 0.9019608, 1, 0, 1,
-0.9375983, 0.3243997, -0.7436116, 0.8941177, 1, 0, 1,
-0.9285122, -0.4651612, -1.044833, 0.8901961, 1, 0, 1,
-0.9277887, -1.13895, -2.650209, 0.8823529, 1, 0, 1,
-0.9216633, -0.2382641, -2.633564, 0.8784314, 1, 0, 1,
-0.9134097, 0.3193794, 0.1561071, 0.8705882, 1, 0, 1,
-0.9119559, -0.1788899, -2.979689, 0.8666667, 1, 0, 1,
-0.9080837, -1.398842, -2.055004, 0.8588235, 1, 0, 1,
-0.9080586, -0.3158453, -0.9556836, 0.854902, 1, 0, 1,
-0.9078637, -0.3143538, -1.541038, 0.8470588, 1, 0, 1,
-0.9070218, 0.4386202, -1.210078, 0.8431373, 1, 0, 1,
-0.904138, -0.8150303, -4.672668, 0.8352941, 1, 0, 1,
-0.8982847, -0.8731392, -0.865873, 0.8313726, 1, 0, 1,
-0.8971179, -0.5530941, -1.703606, 0.8235294, 1, 0, 1,
-0.8969625, -0.01894728, -1.965005, 0.8196079, 1, 0, 1,
-0.8854495, 0.6868115, -0.2854489, 0.8117647, 1, 0, 1,
-0.8799937, 0.006906057, -1.436718, 0.8078431, 1, 0, 1,
-0.8778147, 0.04260099, 0.7167556, 0.8, 1, 0, 1,
-0.8775896, 1.36175, -1.19999, 0.7921569, 1, 0, 1,
-0.8710629, 0.5910679, -0.5789476, 0.7882353, 1, 0, 1,
-0.8618465, -0.4267055, -4.200383, 0.7803922, 1, 0, 1,
-0.8607146, 0.8077782, -2.631896, 0.7764706, 1, 0, 1,
-0.8590489, 1.530248, 1.034215, 0.7686275, 1, 0, 1,
-0.8557239, 0.1660946, -1.199721, 0.7647059, 1, 0, 1,
-0.8511695, 0.3820561, -1.730596, 0.7568628, 1, 0, 1,
-0.8500749, 0.2547203, -0.2135569, 0.7529412, 1, 0, 1,
-0.8488512, -0.9920098, -2.33419, 0.7450981, 1, 0, 1,
-0.8366995, 0.0352518, -0.9386031, 0.7411765, 1, 0, 1,
-0.8345003, 0.4839167, 0.6346644, 0.7333333, 1, 0, 1,
-0.8340371, 0.2283439, -1.485068, 0.7294118, 1, 0, 1,
-0.831126, 2.010658, -0.4114878, 0.7215686, 1, 0, 1,
-0.8292377, -1.329616, -3.243434, 0.7176471, 1, 0, 1,
-0.8233342, 2.001486, 0.2352499, 0.7098039, 1, 0, 1,
-0.8223609, -1.543206, -3.659554, 0.7058824, 1, 0, 1,
-0.817295, -1.132742, -2.872195, 0.6980392, 1, 0, 1,
-0.815924, -0.7374991, -2.738304, 0.6901961, 1, 0, 1,
-0.8109805, -2.681587, -3.562267, 0.6862745, 1, 0, 1,
-0.8102112, -0.1212973, -2.220034, 0.6784314, 1, 0, 1,
-0.8094525, -0.01164968, -1.724554, 0.6745098, 1, 0, 1,
-0.8050548, -1.794767, -2.6828, 0.6666667, 1, 0, 1,
-0.8020339, 0.8490074, 0.4128363, 0.6627451, 1, 0, 1,
-0.80029, 0.414843, 1.118277, 0.654902, 1, 0, 1,
-0.7997848, 1.274299, 0.9275143, 0.6509804, 1, 0, 1,
-0.7982752, -0.0829165, -2.301944, 0.6431373, 1, 0, 1,
-0.7931656, 2.096036, 0.1045766, 0.6392157, 1, 0, 1,
-0.7879916, 0.8762616, -2.08322, 0.6313726, 1, 0, 1,
-0.7830098, -0.02631403, -1.437419, 0.627451, 1, 0, 1,
-0.7806923, 0.6123628, -0.4916223, 0.6196079, 1, 0, 1,
-0.7806061, -0.6136416, -2.186561, 0.6156863, 1, 0, 1,
-0.7801944, 0.1306606, -2.384402, 0.6078432, 1, 0, 1,
-0.7790592, 1.405602, -1.813263, 0.6039216, 1, 0, 1,
-0.7778973, -0.1426136, -3.377489, 0.5960785, 1, 0, 1,
-0.7743651, -1.193022, -1.61164, 0.5882353, 1, 0, 1,
-0.7731701, -1.432089, -3.168597, 0.5843138, 1, 0, 1,
-0.7572158, -0.4614865, -0.1319807, 0.5764706, 1, 0, 1,
-0.7550056, 0.2364097, -0.9509267, 0.572549, 1, 0, 1,
-0.754644, -1.009787, -3.074574, 0.5647059, 1, 0, 1,
-0.7534487, 0.6686066, -1.718668, 0.5607843, 1, 0, 1,
-0.7524849, -0.4938171, -2.84902, 0.5529412, 1, 0, 1,
-0.7484306, -1.843165, -1.414316, 0.5490196, 1, 0, 1,
-0.7475985, 1.091263, -2.041129, 0.5411765, 1, 0, 1,
-0.7429805, -0.774686, -0.7259032, 0.5372549, 1, 0, 1,
-0.7427614, 0.5006013, -0.8788413, 0.5294118, 1, 0, 1,
-0.7426822, 0.5364479, -0.6657468, 0.5254902, 1, 0, 1,
-0.7373735, 2.010942, -0.9683017, 0.5176471, 1, 0, 1,
-0.7332907, 0.382949, -1.328672, 0.5137255, 1, 0, 1,
-0.7310377, 0.4004519, 0.7376681, 0.5058824, 1, 0, 1,
-0.7251948, -0.08989921, -3.007158, 0.5019608, 1, 0, 1,
-0.7214924, -1.490433, -2.327169, 0.4941176, 1, 0, 1,
-0.7210915, 0.2907517, -0.9796891, 0.4862745, 1, 0, 1,
-0.7194393, 1.067374, -1.719763, 0.4823529, 1, 0, 1,
-0.7176751, -0.6874509, -2.513705, 0.4745098, 1, 0, 1,
-0.7175267, -0.6583309, -0.3870152, 0.4705882, 1, 0, 1,
-0.7151529, -0.7132851, -2.130718, 0.4627451, 1, 0, 1,
-0.7038015, -1.290408, -2.080995, 0.4588235, 1, 0, 1,
-0.7025244, 0.280375, -2.662206, 0.4509804, 1, 0, 1,
-0.7018926, 1.353033, -1.01597, 0.4470588, 1, 0, 1,
-0.6969573, -1.153719, -1.1142, 0.4392157, 1, 0, 1,
-0.6948527, 0.9471895, -0.48428, 0.4352941, 1, 0, 1,
-0.6947299, -0.1946852, -0.05474681, 0.427451, 1, 0, 1,
-0.6945114, 0.5067248, -0.8431858, 0.4235294, 1, 0, 1,
-0.6879188, -0.1315851, -2.93351, 0.4156863, 1, 0, 1,
-0.6803811, -0.9239012, -1.990287, 0.4117647, 1, 0, 1,
-0.6752366, 2.476247, -0.6703889, 0.4039216, 1, 0, 1,
-0.6746252, 0.1290472, -1.161977, 0.3960784, 1, 0, 1,
-0.661732, 1.521717, -1.244694, 0.3921569, 1, 0, 1,
-0.6598085, -1.092771, -2.594531, 0.3843137, 1, 0, 1,
-0.6595047, -1.423929, -3.268281, 0.3803922, 1, 0, 1,
-0.659382, 0.3034837, -2.06269, 0.372549, 1, 0, 1,
-0.6584167, -0.3943865, -0.8063501, 0.3686275, 1, 0, 1,
-0.6524071, -0.6146356, -1.968111, 0.3607843, 1, 0, 1,
-0.652009, 2.029635, 0.8077363, 0.3568628, 1, 0, 1,
-0.6505043, -0.2968185, -1.993629, 0.3490196, 1, 0, 1,
-0.6463101, -0.9776514, -3.513133, 0.345098, 1, 0, 1,
-0.6417876, 1.954622, -0.2994149, 0.3372549, 1, 0, 1,
-0.634142, 0.2623443, -1.199926, 0.3333333, 1, 0, 1,
-0.6307092, -3.049372, -5.091686, 0.3254902, 1, 0, 1,
-0.6285989, -0.5584906, -2.889571, 0.3215686, 1, 0, 1,
-0.6277379, -2.117264, -2.241102, 0.3137255, 1, 0, 1,
-0.6273308, 0.2928472, -1.821837, 0.3098039, 1, 0, 1,
-0.6272513, 2.530202, -0.6554435, 0.3019608, 1, 0, 1,
-0.626895, 1.447879, -0.4566505, 0.2941177, 1, 0, 1,
-0.6262779, 0.6131808, 0.05406588, 0.2901961, 1, 0, 1,
-0.6261794, -0.5589582, -2.392367, 0.282353, 1, 0, 1,
-0.6255629, -0.4556255, -1.945303, 0.2784314, 1, 0, 1,
-0.6253617, 1.331367, 0.1453185, 0.2705882, 1, 0, 1,
-0.6237284, -1.113601, -3.35389, 0.2666667, 1, 0, 1,
-0.620532, 0.07877851, -0.9465511, 0.2588235, 1, 0, 1,
-0.6063939, 1.671221, -0.4610808, 0.254902, 1, 0, 1,
-0.606082, -0.5752932, -2.120356, 0.2470588, 1, 0, 1,
-0.6028655, 0.179609, -0.8971087, 0.2431373, 1, 0, 1,
-0.5956846, 1.044941, -2.042759, 0.2352941, 1, 0, 1,
-0.5954773, 0.5540488, 0.2938729, 0.2313726, 1, 0, 1,
-0.5948012, -1.440077, -3.648584, 0.2235294, 1, 0, 1,
-0.5927065, -0.8424445, -1.114889, 0.2196078, 1, 0, 1,
-0.5892478, -0.3769727, -2.109072, 0.2117647, 1, 0, 1,
-0.5845222, -0.6332258, -1.651906, 0.2078431, 1, 0, 1,
-0.5826172, -2.263021, -3.854655, 0.2, 1, 0, 1,
-0.5768747, 0.6296456, -2.055867, 0.1921569, 1, 0, 1,
-0.5716287, -1.17361, -4.288632, 0.1882353, 1, 0, 1,
-0.5668315, -0.9913951, -1.438847, 0.1803922, 1, 0, 1,
-0.564413, 0.2280852, -1.766994, 0.1764706, 1, 0, 1,
-0.5622485, 0.4200664, -0.8378153, 0.1686275, 1, 0, 1,
-0.5619093, 0.6790276, 0.3205687, 0.1647059, 1, 0, 1,
-0.5583331, -2.125931, -2.773998, 0.1568628, 1, 0, 1,
-0.5560979, -0.3199933, 0.3355514, 0.1529412, 1, 0, 1,
-0.555891, -1.210316, -4.967103, 0.145098, 1, 0, 1,
-0.5540385, -0.4293027, -1.602856, 0.1411765, 1, 0, 1,
-0.5517882, 1.477145, -0.3364463, 0.1333333, 1, 0, 1,
-0.5516773, 0.9523789, 1.130035, 0.1294118, 1, 0, 1,
-0.5495242, -0.2693858, -1.322778, 0.1215686, 1, 0, 1,
-0.5448247, 0.3058872, 0.2945109, 0.1176471, 1, 0, 1,
-0.5433533, -1.000506, -1.298345, 0.1098039, 1, 0, 1,
-0.5382369, 0.3912693, -1.479012, 0.1058824, 1, 0, 1,
-0.5290972, 0.04806091, -2.84906, 0.09803922, 1, 0, 1,
-0.517803, 0.6498941, 0.3052362, 0.09019608, 1, 0, 1,
-0.5174008, -0.07675942, -2.132732, 0.08627451, 1, 0, 1,
-0.515324, 2.473588, 0.5231832, 0.07843138, 1, 0, 1,
-0.5134599, 0.7861008, -1.360301, 0.07450981, 1, 0, 1,
-0.5118034, -0.5224717, -3.289658, 0.06666667, 1, 0, 1,
-0.5087942, 0.6432514, -1.517911, 0.0627451, 1, 0, 1,
-0.506586, -1.060153, -3.748759, 0.05490196, 1, 0, 1,
-0.4986527, 0.043786, -1.365842, 0.05098039, 1, 0, 1,
-0.497628, -0.4080911, -2.649049, 0.04313726, 1, 0, 1,
-0.4964749, 0.2998528, -2.069885, 0.03921569, 1, 0, 1,
-0.4952115, 0.4071797, -1.141117, 0.03137255, 1, 0, 1,
-0.4886109, 1.74394, -1.988522, 0.02745098, 1, 0, 1,
-0.4857051, 1.348319, -0.5614452, 0.01960784, 1, 0, 1,
-0.4840455, -1.11207, -1.488135, 0.01568628, 1, 0, 1,
-0.4817795, 0.0967489, 0.7716295, 0.007843138, 1, 0, 1,
-0.4812071, -0.3392482, -2.163662, 0.003921569, 1, 0, 1,
-0.4777745, 1.66226, -0.8030728, 0, 1, 0.003921569, 1,
-0.4773732, 1.468748, -2.194911, 0, 1, 0.01176471, 1,
-0.4722067, -0.7682232, -1.72464, 0, 1, 0.01568628, 1,
-0.4707919, -1.691569, -2.755646, 0, 1, 0.02352941, 1,
-0.4675884, -2.222812, -3.537923, 0, 1, 0.02745098, 1,
-0.4626928, 0.5486605, 0.5770111, 0, 1, 0.03529412, 1,
-0.4611115, 0.7217171, 0.907865, 0, 1, 0.03921569, 1,
-0.4594961, 0.7311775, 0.4044785, 0, 1, 0.04705882, 1,
-0.4577034, -0.155836, -1.16906, 0, 1, 0.05098039, 1,
-0.4553739, -0.7849979, -2.158037, 0, 1, 0.05882353, 1,
-0.4487778, 0.6574461, 0.3257885, 0, 1, 0.0627451, 1,
-0.4481092, 0.5914761, -0.01175912, 0, 1, 0.07058824, 1,
-0.4478601, -2.548113, -2.81749, 0, 1, 0.07450981, 1,
-0.4441582, 0.6555622, -1.19773, 0, 1, 0.08235294, 1,
-0.4402879, 0.2678893, -0.2523905, 0, 1, 0.08627451, 1,
-0.4374779, -0.5842099, -4.735118, 0, 1, 0.09411765, 1,
-0.4373903, -1.156509, -2.224776, 0, 1, 0.1019608, 1,
-0.4357331, -2.313235, -2.71361, 0, 1, 0.1058824, 1,
-0.4350561, 0.8353235, -0.187365, 0, 1, 0.1137255, 1,
-0.4326365, 0.7760949, -1.817875, 0, 1, 0.1176471, 1,
-0.4317809, -0.355266, -1.271018, 0, 1, 0.1254902, 1,
-0.4298913, 0.352621, -3.991986, 0, 1, 0.1294118, 1,
-0.4286934, -0.7755848, -3.285907, 0, 1, 0.1372549, 1,
-0.4281144, -0.1602185, -0.994309, 0, 1, 0.1411765, 1,
-0.4273159, -0.2825921, -2.117119, 0, 1, 0.1490196, 1,
-0.4265945, -0.4752861, -3.854156, 0, 1, 0.1529412, 1,
-0.4254287, 0.2228688, -2.595234, 0, 1, 0.1607843, 1,
-0.4249364, 0.8473717, -1.17539, 0, 1, 0.1647059, 1,
-0.4170199, 0.5750533, -0.6139715, 0, 1, 0.172549, 1,
-0.4141823, 0.4841297, -0.727782, 0, 1, 0.1764706, 1,
-0.4125682, 0.8663674, 1.44432, 0, 1, 0.1843137, 1,
-0.4091009, -0.6371436, -3.837036, 0, 1, 0.1882353, 1,
-0.4060077, -0.3676946, -1.095802, 0, 1, 0.1960784, 1,
-0.4058678, 1.046196, 0.54199, 0, 1, 0.2039216, 1,
-0.3997101, 0.1921488, -1.035292, 0, 1, 0.2078431, 1,
-0.3966367, -0.4011753, -4.149122, 0, 1, 0.2156863, 1,
-0.3914933, 0.5515084, 0.8380324, 0, 1, 0.2196078, 1,
-0.3912418, 0.08204315, -1.369507, 0, 1, 0.227451, 1,
-0.3908546, -1.828817, -2.90162, 0, 1, 0.2313726, 1,
-0.3870033, -1.184553, -2.585158, 0, 1, 0.2392157, 1,
-0.3848595, 1.586171, 0.1705074, 0, 1, 0.2431373, 1,
-0.3833672, -2.66572, -3.34012, 0, 1, 0.2509804, 1,
-0.3822516, -1.402649, -5.080341, 0, 1, 0.254902, 1,
-0.3804846, -2.515859, -2.77989, 0, 1, 0.2627451, 1,
-0.3773817, 2.404892, -0.241753, 0, 1, 0.2666667, 1,
-0.376273, -0.6761305, -3.846031, 0, 1, 0.2745098, 1,
-0.3749565, -1.791205, -3.613698, 0, 1, 0.2784314, 1,
-0.3745346, -0.4345579, -0.7912186, 0, 1, 0.2862745, 1,
-0.370044, 0.4463505, -2.848797, 0, 1, 0.2901961, 1,
-0.366979, -0.9345376, -3.692379, 0, 1, 0.2980392, 1,
-0.3639054, -1.47837, -2.589671, 0, 1, 0.3058824, 1,
-0.3588673, -1.176306, -3.836233, 0, 1, 0.3098039, 1,
-0.3518511, -0.4586121, -2.983315, 0, 1, 0.3176471, 1,
-0.3518104, 0.8287984, -0.1485956, 0, 1, 0.3215686, 1,
-0.3482462, 0.01641842, -3.379586, 0, 1, 0.3294118, 1,
-0.3447205, -1.267753, -0.8826666, 0, 1, 0.3333333, 1,
-0.3441224, 0.7444907, 0.1635311, 0, 1, 0.3411765, 1,
-0.3439834, -1.148012, -1.798776, 0, 1, 0.345098, 1,
-0.3420154, 1.126835, 0.8093952, 0, 1, 0.3529412, 1,
-0.3407275, 0.06245715, -1.777449, 0, 1, 0.3568628, 1,
-0.3405058, 1.138472, -1.751799, 0, 1, 0.3647059, 1,
-0.3391009, -0.7307353, -2.117829, 0, 1, 0.3686275, 1,
-0.3336606, 1.675751, 1.122033, 0, 1, 0.3764706, 1,
-0.3324317, -1.878393, -3.959439, 0, 1, 0.3803922, 1,
-0.3306014, -0.1975061, -4.182022, 0, 1, 0.3882353, 1,
-0.3291554, -0.78069, -2.757324, 0, 1, 0.3921569, 1,
-0.3281874, -0.7586038, -2.650635, 0, 1, 0.4, 1,
-0.3278534, 0.41701, -0.6770573, 0, 1, 0.4078431, 1,
-0.326288, 0.1423449, -2.140841, 0, 1, 0.4117647, 1,
-0.3214209, -1.30626, -2.717364, 0, 1, 0.4196078, 1,
-0.3211944, -1.808107, -3.699465, 0, 1, 0.4235294, 1,
-0.3185998, -0.1535718, -3.079219, 0, 1, 0.4313726, 1,
-0.3156276, 0.1215897, -1.473733, 0, 1, 0.4352941, 1,
-0.3145974, -1.31124, -0.9113842, 0, 1, 0.4431373, 1,
-0.3102381, -1.128565, -2.099054, 0, 1, 0.4470588, 1,
-0.3027695, 0.3187355, 1.358822, 0, 1, 0.454902, 1,
-0.3026386, -0.548511, -1.114956, 0, 1, 0.4588235, 1,
-0.2994573, 1.690027, 0.09279924, 0, 1, 0.4666667, 1,
-0.2973812, 1.488787, -2.265604, 0, 1, 0.4705882, 1,
-0.2918856, 1.207129, -0.4864373, 0, 1, 0.4784314, 1,
-0.2879445, -0.5682489, -2.767539, 0, 1, 0.4823529, 1,
-0.2876789, 0.06123739, -0.4609025, 0, 1, 0.4901961, 1,
-0.2842506, -1.007462, -4.178946, 0, 1, 0.4941176, 1,
-0.2831115, 0.01997072, -1.454336, 0, 1, 0.5019608, 1,
-0.2778888, 0.6854053, -0.4418048, 0, 1, 0.509804, 1,
-0.2727836, 0.02921308, -1.445994, 0, 1, 0.5137255, 1,
-0.2674055, 1.250151, -0.9097294, 0, 1, 0.5215687, 1,
-0.2671096, 0.5072623, -0.5629752, 0, 1, 0.5254902, 1,
-0.2669155, 1.686661, -1.290785, 0, 1, 0.5333334, 1,
-0.2598476, 0.3969127, -1.514838, 0, 1, 0.5372549, 1,
-0.2572147, 0.6448254, 0.373627, 0, 1, 0.5450981, 1,
-0.2523948, -1.916086, -3.552594, 0, 1, 0.5490196, 1,
-0.2508085, 2.609292, 1.232985, 0, 1, 0.5568628, 1,
-0.2506629, -0.04218332, -0.9789917, 0, 1, 0.5607843, 1,
-0.2454981, 0.6392012, -0.6443186, 0, 1, 0.5686275, 1,
-0.241744, -1.336824, -3.407566, 0, 1, 0.572549, 1,
-0.2411568, -0.327557, -3.028044, 0, 1, 0.5803922, 1,
-0.2377367, 0.4060721, 0.2837898, 0, 1, 0.5843138, 1,
-0.2353933, 1.009074, 0.2213983, 0, 1, 0.5921569, 1,
-0.234469, 0.2192835, -1.726316, 0, 1, 0.5960785, 1,
-0.2336907, -0.0632743, -2.527809, 0, 1, 0.6039216, 1,
-0.2335213, -0.7158721, -2.199247, 0, 1, 0.6117647, 1,
-0.2328973, 2.051388, -0.5776891, 0, 1, 0.6156863, 1,
-0.2301143, -2.259303, -1.781419, 0, 1, 0.6235294, 1,
-0.2171861, -0.2316801, -3.116429, 0, 1, 0.627451, 1,
-0.2161975, -0.5134109, -2.492668, 0, 1, 0.6352941, 1,
-0.2158878, 0.3995743, -0.01443395, 0, 1, 0.6392157, 1,
-0.2142664, -2.379833, -1.918161, 0, 1, 0.6470588, 1,
-0.2131846, -1.3057, -5.040732, 0, 1, 0.6509804, 1,
-0.2119983, -0.5877187, -1.235456, 0, 1, 0.6588235, 1,
-0.2110841, 0.4307736, -1.133108, 0, 1, 0.6627451, 1,
-0.210085, 1.046808, -0.5258576, 0, 1, 0.6705883, 1,
-0.2092337, 0.06037485, -1.706138, 0, 1, 0.6745098, 1,
-0.207633, 0.3057059, -0.1219403, 0, 1, 0.682353, 1,
-0.2074009, 0.2939678, 0.614764, 0, 1, 0.6862745, 1,
-0.2042597, -0.1829269, -2.062844, 0, 1, 0.6941177, 1,
-0.2017519, -1.055331, -2.243919, 0, 1, 0.7019608, 1,
-0.2000087, -1.07334, -3.401734, 0, 1, 0.7058824, 1,
-0.1997115, -1.651012, -4.01189, 0, 1, 0.7137255, 1,
-0.1996862, 1.414963, 0.9862577, 0, 1, 0.7176471, 1,
-0.1995884, 0.0651755, -1.524513, 0, 1, 0.7254902, 1,
-0.196766, 0.3267457, -2.096473, 0, 1, 0.7294118, 1,
-0.1930007, -0.05415871, -3.299962, 0, 1, 0.7372549, 1,
-0.1921065, -1.275937, -4.053895, 0, 1, 0.7411765, 1,
-0.1918766, 1.663031, 0.6453533, 0, 1, 0.7490196, 1,
-0.1841865, 0.9400679, 0.6948559, 0, 1, 0.7529412, 1,
-0.1795534, 0.5408822, -1.287132, 0, 1, 0.7607843, 1,
-0.1788695, -0.5907944, -2.096956, 0, 1, 0.7647059, 1,
-0.1775732, -0.04637146, -1.495016, 0, 1, 0.772549, 1,
-0.1773203, 0.4520526, 0.4736671, 0, 1, 0.7764706, 1,
-0.173535, 0.3108672, 0.5297677, 0, 1, 0.7843137, 1,
-0.171397, 1.448762, 1.145423, 0, 1, 0.7882353, 1,
-0.1684839, 1.199542, 0.6676468, 0, 1, 0.7960784, 1,
-0.1616699, 0.4565707, -0.4604965, 0, 1, 0.8039216, 1,
-0.1608603, -0.1999459, -2.890019, 0, 1, 0.8078431, 1,
-0.1502832, -0.2232845, -4.056444, 0, 1, 0.8156863, 1,
-0.1440981, -0.724817, -3.246761, 0, 1, 0.8196079, 1,
-0.1373951, 0.3754682, 0.4455468, 0, 1, 0.827451, 1,
-0.1321787, 1.100523, 0.3219337, 0, 1, 0.8313726, 1,
-0.1300306, 0.1846316, 0.3560554, 0, 1, 0.8392157, 1,
-0.1276782, -0.193517, -3.877189, 0, 1, 0.8431373, 1,
-0.127308, -0.6306635, -3.04634, 0, 1, 0.8509804, 1,
-0.123117, 1.061537, -1.971482, 0, 1, 0.854902, 1,
-0.1193851, -0.254399, -1.840191, 0, 1, 0.8627451, 1,
-0.1170108, -0.03725374, -1.871075, 0, 1, 0.8666667, 1,
-0.116127, -0.1187186, -1.236215, 0, 1, 0.8745098, 1,
-0.1154428, -0.1170738, -1.880687, 0, 1, 0.8784314, 1,
-0.1140178, 0.06266265, 0.3799698, 0, 1, 0.8862745, 1,
-0.1113363, 0.6956426, 1.541082, 0, 1, 0.8901961, 1,
-0.1111359, -1.618795, -3.02893, 0, 1, 0.8980392, 1,
-0.1029986, -1.797631, -2.844907, 0, 1, 0.9058824, 1,
-0.1005767, -1.057315, -2.271632, 0, 1, 0.9098039, 1,
-0.09808512, 1.06587, -0.08546923, 0, 1, 0.9176471, 1,
-0.09794641, 0.2367255, -0.887399, 0, 1, 0.9215686, 1,
-0.09590302, 0.1006612, -1.001688, 0, 1, 0.9294118, 1,
-0.09517739, 0.8044617, 0.6056752, 0, 1, 0.9333333, 1,
-0.09492582, 0.7252761, 0.9748346, 0, 1, 0.9411765, 1,
-0.09452862, -1.208578, -4.05498, 0, 1, 0.945098, 1,
-0.08808863, -0.9748027, -2.766807, 0, 1, 0.9529412, 1,
-0.08780329, 1.515846, 1.15706, 0, 1, 0.9568627, 1,
-0.08647671, -0.8487068, -4.235647, 0, 1, 0.9647059, 1,
-0.0861192, 1.212521, -1.622984, 0, 1, 0.9686275, 1,
-0.08070691, 1.260196, 1.761039, 0, 1, 0.9764706, 1,
-0.07947897, -0.9143031, -2.714765, 0, 1, 0.9803922, 1,
-0.07728904, -0.2114079, -0.7918041, 0, 1, 0.9882353, 1,
-0.07500801, 0.8852625, -0.1618587, 0, 1, 0.9921569, 1,
-0.07432485, -0.1871828, -2.209368, 0, 1, 1, 1,
-0.07395467, -1.015158, -2.452187, 0, 0.9921569, 1, 1,
-0.07326704, 0.4022959, -1.497378, 0, 0.9882353, 1, 1,
-0.07221991, -0.03421703, -1.456077, 0, 0.9803922, 1, 1,
-0.07193688, 0.2254013, 0.2417129, 0, 0.9764706, 1, 1,
-0.07135197, 0.4512278, 0.5895796, 0, 0.9686275, 1, 1,
-0.07078165, 0.1985941, 0.4665782, 0, 0.9647059, 1, 1,
-0.07054959, 0.05043016, -1.663083, 0, 0.9568627, 1, 1,
-0.06927128, -0.7503103, -1.702703, 0, 0.9529412, 1, 1,
-0.06755992, 0.2201955, 0.613295, 0, 0.945098, 1, 1,
-0.06354877, -0.4544736, -2.428391, 0, 0.9411765, 1, 1,
-0.05224476, 0.125781, -1.67308, 0, 0.9333333, 1, 1,
-0.04635711, 0.2779774, 0.7373565, 0, 0.9294118, 1, 1,
-0.04071827, 0.05432048, 0.1317931, 0, 0.9215686, 1, 1,
-0.03165151, -0.5462734, -3.12946, 0, 0.9176471, 1, 1,
-0.03083559, 0.6166973, 0.04190848, 0, 0.9098039, 1, 1,
-0.02658241, -0.09120864, -3.563323, 0, 0.9058824, 1, 1,
-0.02416565, 0.3345776, 0.7826049, 0, 0.8980392, 1, 1,
-0.01516899, -1.318542, -3.624095, 0, 0.8901961, 1, 1,
-0.005646589, 0.3161156, 0.5792373, 0, 0.8862745, 1, 1,
0.002604909, -0.9436947, 1.810615, 0, 0.8784314, 1, 1,
0.002609387, -0.8329898, 3.090219, 0, 0.8745098, 1, 1,
0.002957602, -1.225388, 2.068556, 0, 0.8666667, 1, 1,
0.003258754, 0.072389, -0.0257999, 0, 0.8627451, 1, 1,
0.006540108, -0.3201134, 2.066242, 0, 0.854902, 1, 1,
0.006869368, 1.424904, -1.110263, 0, 0.8509804, 1, 1,
0.01146123, 1.3801, -0.6050889, 0, 0.8431373, 1, 1,
0.01291246, -1.103032, 3.577087, 0, 0.8392157, 1, 1,
0.01483741, 0.8800251, -0.2038549, 0, 0.8313726, 1, 1,
0.01521228, -0.4729726, 3.728571, 0, 0.827451, 1, 1,
0.01891009, -0.8743445, 3.050552, 0, 0.8196079, 1, 1,
0.02050526, -1.214209, 3.110991, 0, 0.8156863, 1, 1,
0.02373441, -0.7130238, 3.681606, 0, 0.8078431, 1, 1,
0.02399273, 0.3220226, 0.4782787, 0, 0.8039216, 1, 1,
0.02607562, 0.3390682, -0.7055983, 0, 0.7960784, 1, 1,
0.03147882, 0.8136026, -1.016365, 0, 0.7882353, 1, 1,
0.03282639, 1.356705, -0.4954337, 0, 0.7843137, 1, 1,
0.03403221, 0.6531314, -0.02958404, 0, 0.7764706, 1, 1,
0.04282389, 0.04157319, 2.322535, 0, 0.772549, 1, 1,
0.04313477, 2.254433, -1.466181, 0, 0.7647059, 1, 1,
0.0560238, -0.7173, 2.898391, 0, 0.7607843, 1, 1,
0.05796765, 1.802954, 0.09779264, 0, 0.7529412, 1, 1,
0.05840549, 0.1572863, 0.2997082, 0, 0.7490196, 1, 1,
0.06098826, -0.8136135, 3.720213, 0, 0.7411765, 1, 1,
0.06160539, 0.2235112, -0.1367005, 0, 0.7372549, 1, 1,
0.06282602, 1.063837, -0.8291882, 0, 0.7294118, 1, 1,
0.06362064, -1.230728, 2.860783, 0, 0.7254902, 1, 1,
0.06952853, 0.3114522, -1.035615, 0, 0.7176471, 1, 1,
0.07219064, -0.9570453, 3.658435, 0, 0.7137255, 1, 1,
0.08076991, 0.3987195, -0.2401836, 0, 0.7058824, 1, 1,
0.0843259, -0.3892378, 3.321381, 0, 0.6980392, 1, 1,
0.08617702, -1.158082, 3.665846, 0, 0.6941177, 1, 1,
0.09214883, 0.2902288, 0.3410574, 0, 0.6862745, 1, 1,
0.09284428, -1.287657, 4.065033, 0, 0.682353, 1, 1,
0.09369594, -1.337111, 1.330599, 0, 0.6745098, 1, 1,
0.09684066, -0.326772, 2.269674, 0, 0.6705883, 1, 1,
0.09702199, 0.4676252, 0.7328091, 0, 0.6627451, 1, 1,
0.09729181, -2.082193, 2.366781, 0, 0.6588235, 1, 1,
0.09878944, 0.3721159, 2.650846, 0, 0.6509804, 1, 1,
0.09912852, 0.5648429, -0.6538585, 0, 0.6470588, 1, 1,
0.102946, -0.09437704, 2.91593, 0, 0.6392157, 1, 1,
0.1077963, 0.8150535, -0.449342, 0, 0.6352941, 1, 1,
0.1202455, -1.197837, 4.745093, 0, 0.627451, 1, 1,
0.1207117, 0.3950771, 0.6409508, 0, 0.6235294, 1, 1,
0.1276186, 0.770624, 0.6545924, 0, 0.6156863, 1, 1,
0.1290742, -1.945932, 2.977877, 0, 0.6117647, 1, 1,
0.1304839, 0.2595186, 0.8760687, 0, 0.6039216, 1, 1,
0.1325479, 0.09994319, 0.8207742, 0, 0.5960785, 1, 1,
0.133442, 1.249606, 1.365017, 0, 0.5921569, 1, 1,
0.1362443, -0.07935442, 3.513643, 0, 0.5843138, 1, 1,
0.1403336, -1.139695, 3.137355, 0, 0.5803922, 1, 1,
0.1423705, -1.600491, 3.347868, 0, 0.572549, 1, 1,
0.1436288, 0.9490153, -0.4538402, 0, 0.5686275, 1, 1,
0.1491846, 1.101727, -0.1682912, 0, 0.5607843, 1, 1,
0.1498699, -0.8483841, 1.169486, 0, 0.5568628, 1, 1,
0.1514415, 1.316463, -1.258793, 0, 0.5490196, 1, 1,
0.1558263, 0.2133825, 0.7590035, 0, 0.5450981, 1, 1,
0.1584932, -1.023871, 2.566006, 0, 0.5372549, 1, 1,
0.16137, 0.8419835, 1.356635, 0, 0.5333334, 1, 1,
0.1614532, 0.2172062, 2.413198, 0, 0.5254902, 1, 1,
0.1623264, -1.3176, 2.220721, 0, 0.5215687, 1, 1,
0.1634512, -0.8810557, 1.645338, 0, 0.5137255, 1, 1,
0.1634637, 1.282157, 2.389897, 0, 0.509804, 1, 1,
0.1667254, -1.423122, 3.034695, 0, 0.5019608, 1, 1,
0.1694645, 1.422474, 0.8981912, 0, 0.4941176, 1, 1,
0.1704077, 0.2380683, 0.2870226, 0, 0.4901961, 1, 1,
0.1705865, -0.08234245, 2.694208, 0, 0.4823529, 1, 1,
0.1723711, 0.706122, -0.8325988, 0, 0.4784314, 1, 1,
0.178175, 1.217255, 0.1509125, 0, 0.4705882, 1, 1,
0.1806671, 0.5793761, 1.748536, 0, 0.4666667, 1, 1,
0.185122, 0.2627848, 0.402596, 0, 0.4588235, 1, 1,
0.1902516, -0.3719863, 2.290351, 0, 0.454902, 1, 1,
0.1963773, 1.342207, -0.1800009, 0, 0.4470588, 1, 1,
0.1993718, 0.6448936, -0.2559284, 0, 0.4431373, 1, 1,
0.2052554, 1.580359, -0.6223589, 0, 0.4352941, 1, 1,
0.2073131, 1.917537, -1.01087, 0, 0.4313726, 1, 1,
0.2092206, -0.4075671, 0.8610731, 0, 0.4235294, 1, 1,
0.2229635, -0.03358803, 0.5890098, 0, 0.4196078, 1, 1,
0.2262398, 0.7286058, -1.847415, 0, 0.4117647, 1, 1,
0.2393868, 1.199398, 0.1064694, 0, 0.4078431, 1, 1,
0.2431024, -0.8095934, 3.596233, 0, 0.4, 1, 1,
0.2484474, 1.201996, 0.02937404, 0, 0.3921569, 1, 1,
0.2498603, -1.485491, 5.472129, 0, 0.3882353, 1, 1,
0.2614766, -2.31883, 4.546719, 0, 0.3803922, 1, 1,
0.2637812, 1.232025, 0.2868813, 0, 0.3764706, 1, 1,
0.2657444, -0.3993208, 1.803335, 0, 0.3686275, 1, 1,
0.2662106, -0.7520702, 3.474115, 0, 0.3647059, 1, 1,
0.2722593, 0.607601, 0.1173668, 0, 0.3568628, 1, 1,
0.2729551, 2.510059, -0.6443467, 0, 0.3529412, 1, 1,
0.2771216, 0.2255229, 0.5521343, 0, 0.345098, 1, 1,
0.2812794, -0.8679649, 1.894336, 0, 0.3411765, 1, 1,
0.2843995, 1.167087, 0.4604915, 0, 0.3333333, 1, 1,
0.2869789, -0.7903872, 3.356116, 0, 0.3294118, 1, 1,
0.2870938, 1.780765, -0.1580395, 0, 0.3215686, 1, 1,
0.2881374, 0.937534, -1.164807, 0, 0.3176471, 1, 1,
0.2887643, -0.197262, 1.373532, 0, 0.3098039, 1, 1,
0.2945709, -0.06937562, 2.380951, 0, 0.3058824, 1, 1,
0.2964702, -1.178363, 2.129742, 0, 0.2980392, 1, 1,
0.2989406, -0.1420379, 1.908739, 0, 0.2901961, 1, 1,
0.3008467, -0.8276787, 1.311945, 0, 0.2862745, 1, 1,
0.3032958, 0.8643752, -1.6949, 0, 0.2784314, 1, 1,
0.3059877, 0.708391, 0.9397168, 0, 0.2745098, 1, 1,
0.3107303, -1.313462, 2.423927, 0, 0.2666667, 1, 1,
0.3130503, -0.4872424, 2.147666, 0, 0.2627451, 1, 1,
0.3132436, -1.092763, 1.987922, 0, 0.254902, 1, 1,
0.3164639, 1.537077, 1.436183, 0, 0.2509804, 1, 1,
0.3188354, -1.259287, 2.304989, 0, 0.2431373, 1, 1,
0.320401, -0.3876518, 0.4296173, 0, 0.2392157, 1, 1,
0.3288988, 0.5869098, -0.1728993, 0, 0.2313726, 1, 1,
0.3329583, 0.8397414, 0.8727838, 0, 0.227451, 1, 1,
0.3330763, 0.1349344, 2.091831, 0, 0.2196078, 1, 1,
0.333326, -0.2787169, 1.733975, 0, 0.2156863, 1, 1,
0.334657, -1.686523, 3.539194, 0, 0.2078431, 1, 1,
0.3359463, -0.9581305, 2.990456, 0, 0.2039216, 1, 1,
0.3404227, -0.8781731, 1.852173, 0, 0.1960784, 1, 1,
0.3532763, 0.01450943, 0.4287521, 0, 0.1882353, 1, 1,
0.3536269, -0.360307, 2.794169, 0, 0.1843137, 1, 1,
0.3544101, -0.3084159, 2.879017, 0, 0.1764706, 1, 1,
0.3564075, -1.078577, 1.60086, 0, 0.172549, 1, 1,
0.3632946, 0.9403486, 1.877372, 0, 0.1647059, 1, 1,
0.3637036, -0.127947, 1.08728, 0, 0.1607843, 1, 1,
0.3649164, -0.3369566, 2.150158, 0, 0.1529412, 1, 1,
0.3667638, -0.6971415, 2.012553, 0, 0.1490196, 1, 1,
0.3685369, 0.4610257, 2.310443, 0, 0.1411765, 1, 1,
0.3741992, -1.029297, 0.7720718, 0, 0.1372549, 1, 1,
0.3749622, 1.123255, -1.640516, 0, 0.1294118, 1, 1,
0.3762362, -0.9159462, 3.659923, 0, 0.1254902, 1, 1,
0.3789367, -0.03468885, 1.504736, 0, 0.1176471, 1, 1,
0.3807982, -0.4979102, 3.005343, 0, 0.1137255, 1, 1,
0.3847326, 0.1978198, 0.6940715, 0, 0.1058824, 1, 1,
0.3917199, 0.5702405, 2.362168, 0, 0.09803922, 1, 1,
0.4003517, -0.8777149, 3.147985, 0, 0.09411765, 1, 1,
0.401619, 1.148754, 0.716631, 0, 0.08627451, 1, 1,
0.4040581, -0.6324027, 2.36883, 0, 0.08235294, 1, 1,
0.4127463, -0.8158906, 3.247211, 0, 0.07450981, 1, 1,
0.4152575, 0.8127707, 0.2993609, 0, 0.07058824, 1, 1,
0.4175041, 1.231051, 0.5315511, 0, 0.0627451, 1, 1,
0.4183517, 0.5314642, -0.7738433, 0, 0.05882353, 1, 1,
0.4184551, -0.2308225, 2.603997, 0, 0.05098039, 1, 1,
0.4201428, -1.945358, 1.903118, 0, 0.04705882, 1, 1,
0.4212045, 0.4706813, 0.2903642, 0, 0.03921569, 1, 1,
0.4248765, 0.3534269, 1.84858, 0, 0.03529412, 1, 1,
0.4250615, -0.3161681, 2.653284, 0, 0.02745098, 1, 1,
0.4279286, 0.3394452, 0.9811838, 0, 0.02352941, 1, 1,
0.4292442, -1.092721, 2.1656, 0, 0.01568628, 1, 1,
0.4306827, 0.9585683, 0.7091339, 0, 0.01176471, 1, 1,
0.4361737, -1.074483, 2.698681, 0, 0.003921569, 1, 1,
0.4394524, -1.226607, 3.381073, 0.003921569, 0, 1, 1,
0.441323, -1.408138, 2.759388, 0.007843138, 0, 1, 1,
0.4421622, -1.303213, 3.687648, 0.01568628, 0, 1, 1,
0.444708, -0.1708309, 4.248353, 0.01960784, 0, 1, 1,
0.4501576, 0.04259026, 1.88559, 0.02745098, 0, 1, 1,
0.4512183, -0.1503503, 1.340898, 0.03137255, 0, 1, 1,
0.451603, -1.998863, 1.282237, 0.03921569, 0, 1, 1,
0.4540577, -0.52541, 3.590008, 0.04313726, 0, 1, 1,
0.4672297, -0.3855255, 3.4386, 0.05098039, 0, 1, 1,
0.4686565, -0.7297638, 1.537262, 0.05490196, 0, 1, 1,
0.4699998, 0.9954638, 0.5611638, 0.0627451, 0, 1, 1,
0.4757191, 0.8581349, 1.191547, 0.06666667, 0, 1, 1,
0.4759579, 0.5225562, 0.3259354, 0.07450981, 0, 1, 1,
0.4799834, 0.3520192, 1.114208, 0.07843138, 0, 1, 1,
0.4815693, 1.532338, 0.7554628, 0.08627451, 0, 1, 1,
0.4839216, 1.387798, -0.3892395, 0.09019608, 0, 1, 1,
0.4848795, 1.487831, 0.2176667, 0.09803922, 0, 1, 1,
0.4865856, -1.617027, 3.803266, 0.1058824, 0, 1, 1,
0.4901165, 0.4590635, 1.251119, 0.1098039, 0, 1, 1,
0.4955166, -1.406242, 2.581267, 0.1176471, 0, 1, 1,
0.4976979, -0.6763535, 1.631293, 0.1215686, 0, 1, 1,
0.4983681, 1.21914, 0.1874089, 0.1294118, 0, 1, 1,
0.5063034, 0.923545, 0.01945928, 0.1333333, 0, 1, 1,
0.5065767, 0.8694978, -0.7147219, 0.1411765, 0, 1, 1,
0.5066822, -0.7217569, 2.952872, 0.145098, 0, 1, 1,
0.5087516, -0.9825678, 3.841287, 0.1529412, 0, 1, 1,
0.5205559, -0.8931418, 2.423249, 0.1568628, 0, 1, 1,
0.527211, 0.9179473, -0.5587748, 0.1647059, 0, 1, 1,
0.5279146, -1.546003, 2.244463, 0.1686275, 0, 1, 1,
0.5279595, -0.2278955, 3.296477, 0.1764706, 0, 1, 1,
0.5301892, -0.7921894, 3.358152, 0.1803922, 0, 1, 1,
0.5350394, 0.2721364, 2.942987, 0.1882353, 0, 1, 1,
0.5363411, -2.244698, 2.832666, 0.1921569, 0, 1, 1,
0.5389325, -0.7243031, 2.59142, 0.2, 0, 1, 1,
0.5401172, 0.1405964, 0.8872343, 0.2078431, 0, 1, 1,
0.5441602, -0.3478471, 0.172388, 0.2117647, 0, 1, 1,
0.5446125, 0.4453033, 0.7775155, 0.2196078, 0, 1, 1,
0.5471774, 1.16977, 0.1063357, 0.2235294, 0, 1, 1,
0.5536623, 0.3782289, 2.63254, 0.2313726, 0, 1, 1,
0.565173, -0.0009713042, 1.911649, 0.2352941, 0, 1, 1,
0.5687022, 1.954869, 0.4586357, 0.2431373, 0, 1, 1,
0.5693312, 1.284474, 0.215389, 0.2470588, 0, 1, 1,
0.5721205, 0.5930886, 0.03137904, 0.254902, 0, 1, 1,
0.5748959, 0.8203966, -1.179196, 0.2588235, 0, 1, 1,
0.575397, -1.174977, 2.767274, 0.2666667, 0, 1, 1,
0.5765393, -1.30124, 2.95118, 0.2705882, 0, 1, 1,
0.5793164, 0.9883367, -1.686331, 0.2784314, 0, 1, 1,
0.5795876, -0.6910894, 1.559405, 0.282353, 0, 1, 1,
0.5803463, 0.6323881, 1.892487, 0.2901961, 0, 1, 1,
0.5839363, 1.51499, -0.2959682, 0.2941177, 0, 1, 1,
0.5851296, 0.04934643, -0.3649165, 0.3019608, 0, 1, 1,
0.5945172, -0.3220059, 2.216713, 0.3098039, 0, 1, 1,
0.5947951, 0.3805301, 2.796979, 0.3137255, 0, 1, 1,
0.5958278, -1.255425, 2.337311, 0.3215686, 0, 1, 1,
0.5967768, -0.287606, 2.2891, 0.3254902, 0, 1, 1,
0.5972832, 0.5708309, 0.02901868, 0.3333333, 0, 1, 1,
0.5999447, -0.2411025, 2.862942, 0.3372549, 0, 1, 1,
0.6023425, 0.4121624, 1.622048, 0.345098, 0, 1, 1,
0.6023709, -0.5381606, 1.810467, 0.3490196, 0, 1, 1,
0.6026598, -1.854931, 3.084797, 0.3568628, 0, 1, 1,
0.6075736, -1.25613, 1.071085, 0.3607843, 0, 1, 1,
0.6115721, -0.7835851, 1.589525, 0.3686275, 0, 1, 1,
0.6148143, -0.8115605, 3.140798, 0.372549, 0, 1, 1,
0.6178297, 1.825488, -1.255489, 0.3803922, 0, 1, 1,
0.6196206, 0.8209992, 0.03608018, 0.3843137, 0, 1, 1,
0.62963, 0.8159818, -0.9096169, 0.3921569, 0, 1, 1,
0.630861, 0.4233231, 1.669914, 0.3960784, 0, 1, 1,
0.6311103, 1.555786, 1.000011, 0.4039216, 0, 1, 1,
0.6361613, 0.6911092, -1.100406, 0.4117647, 0, 1, 1,
0.6398978, 1.056592, 2.351323, 0.4156863, 0, 1, 1,
0.6538554, -1.750467, 3.660973, 0.4235294, 0, 1, 1,
0.661476, 0.1726078, 0.9972035, 0.427451, 0, 1, 1,
0.6614988, -0.4376599, 2.413678, 0.4352941, 0, 1, 1,
0.6636392, -0.4696703, 2.314504, 0.4392157, 0, 1, 1,
0.6653158, 1.005692, 1.268591, 0.4470588, 0, 1, 1,
0.6678271, -0.3914083, 2.220035, 0.4509804, 0, 1, 1,
0.6702253, -0.4795949, 1.000122, 0.4588235, 0, 1, 1,
0.6705896, -0.5343716, 4.018936, 0.4627451, 0, 1, 1,
0.6713514, -1.671058, 1.644652, 0.4705882, 0, 1, 1,
0.6716413, 0.4787341, 0.3701645, 0.4745098, 0, 1, 1,
0.672282, -0.5086306, 0.9279138, 0.4823529, 0, 1, 1,
0.6737127, 0.7094584, -0.4226085, 0.4862745, 0, 1, 1,
0.6792812, 1.754266, 0.8283219, 0.4941176, 0, 1, 1,
0.6793447, -0.5452694, 2.110174, 0.5019608, 0, 1, 1,
0.6805449, -0.1503072, 3.269166, 0.5058824, 0, 1, 1,
0.6845106, -1.057098, 3.333363, 0.5137255, 0, 1, 1,
0.6895883, -1.469411, 2.047274, 0.5176471, 0, 1, 1,
0.6945217, 0.6463124, 1.077187, 0.5254902, 0, 1, 1,
0.6970751, -0.6933997, 3.70358, 0.5294118, 0, 1, 1,
0.6998193, 0.1013881, 0.8761277, 0.5372549, 0, 1, 1,
0.7102854, -1.038696, 4.026344, 0.5411765, 0, 1, 1,
0.7106085, 1.472554, 1.778681, 0.5490196, 0, 1, 1,
0.7127957, -0.5031983, 2.541994, 0.5529412, 0, 1, 1,
0.7129078, -0.495515, 1.753839, 0.5607843, 0, 1, 1,
0.7146305, 0.1082989, 2.444077, 0.5647059, 0, 1, 1,
0.715668, 0.994432, 2.050524, 0.572549, 0, 1, 1,
0.721154, 0.05563942, 1.49039, 0.5764706, 0, 1, 1,
0.7256423, -0.1105952, 0.6693072, 0.5843138, 0, 1, 1,
0.7270879, 0.2328435, 1.254928, 0.5882353, 0, 1, 1,
0.7314574, 1.847227, -0.02369598, 0.5960785, 0, 1, 1,
0.7322189, 0.09695272, 2.395778, 0.6039216, 0, 1, 1,
0.7325073, -0.7436085, 1.711414, 0.6078432, 0, 1, 1,
0.7331171, -0.8288579, 1.662466, 0.6156863, 0, 1, 1,
0.7420464, 0.06450895, 1.813423, 0.6196079, 0, 1, 1,
0.7479244, -0.3385581, 1.791659, 0.627451, 0, 1, 1,
0.7500368, 0.02405513, 2.429057, 0.6313726, 0, 1, 1,
0.7527984, 0.6536735, 0.7877327, 0.6392157, 0, 1, 1,
0.7597827, 1.454052, 1.157818, 0.6431373, 0, 1, 1,
0.7656137, -0.8359609, 1.966502, 0.6509804, 0, 1, 1,
0.7676504, 0.9577661, -0.03211345, 0.654902, 0, 1, 1,
0.7713809, -0.03279936, 1.432299, 0.6627451, 0, 1, 1,
0.7768875, 1.746408, -0.8033057, 0.6666667, 0, 1, 1,
0.7795611, 0.6450484, 0.8316805, 0.6745098, 0, 1, 1,
0.7950685, 1.770441, 0.3761528, 0.6784314, 0, 1, 1,
0.7984338, 1.146973, 1.465168, 0.6862745, 0, 1, 1,
0.802159, 0.1775028, 1.151075, 0.6901961, 0, 1, 1,
0.8130831, 1.413638, 0.5808082, 0.6980392, 0, 1, 1,
0.8160315, -1.873509, 2.388516, 0.7058824, 0, 1, 1,
0.818312, 0.7363126, -0.5322509, 0.7098039, 0, 1, 1,
0.8222672, 0.5349703, -0.02867211, 0.7176471, 0, 1, 1,
0.8241884, 0.2768458, 3.651126, 0.7215686, 0, 1, 1,
0.8280464, -0.2451264, 0.4417045, 0.7294118, 0, 1, 1,
0.8282608, 1.292793, 0.9625823, 0.7333333, 0, 1, 1,
0.8299872, 0.7097083, 1.316663, 0.7411765, 0, 1, 1,
0.8305664, 1.402427, 3.052261, 0.7450981, 0, 1, 1,
0.8317468, -0.3202688, 0.2487205, 0.7529412, 0, 1, 1,
0.8324919, 0.7579814, 1.17616, 0.7568628, 0, 1, 1,
0.8362952, -1.774556, 4.488211, 0.7647059, 0, 1, 1,
0.8380189, 0.6496608, 0.4790219, 0.7686275, 0, 1, 1,
0.8459422, -0.02184353, 2.962669, 0.7764706, 0, 1, 1,
0.8506127, 0.1205525, 1.154106, 0.7803922, 0, 1, 1,
0.8515289, 0.3323635, 2.411002, 0.7882353, 0, 1, 1,
0.8522838, -2.002602, 2.854229, 0.7921569, 0, 1, 1,
0.8527772, -1.174211, 3.308631, 0.8, 0, 1, 1,
0.858536, -1.30319, 3.156867, 0.8078431, 0, 1, 1,
0.8587432, 0.06007363, 1.889408, 0.8117647, 0, 1, 1,
0.8592521, -0.6438425, 1.454431, 0.8196079, 0, 1, 1,
0.8619117, 0.3867988, 1.321078, 0.8235294, 0, 1, 1,
0.8631347, -1.290194, 2.051982, 0.8313726, 0, 1, 1,
0.8712604, -0.4018051, 1.975512, 0.8352941, 0, 1, 1,
0.875063, -0.6917161, 3.182959, 0.8431373, 0, 1, 1,
0.8758267, -1.934475, 1.663016, 0.8470588, 0, 1, 1,
0.8773107, 0.1808966, 1.438377, 0.854902, 0, 1, 1,
0.8797247, -0.2279219, 2.364045, 0.8588235, 0, 1, 1,
0.8812404, 1.175135, 1.367492, 0.8666667, 0, 1, 1,
0.8834832, -0.4779709, 1.406298, 0.8705882, 0, 1, 1,
0.8860688, 0.9988909, 1.53358, 0.8784314, 0, 1, 1,
0.8916039, -0.04629651, 0.6514693, 0.8823529, 0, 1, 1,
0.892647, -0.1706904, 0.6822857, 0.8901961, 0, 1, 1,
0.8948216, -0.1356652, 0.1328229, 0.8941177, 0, 1, 1,
0.9008377, -0.388333, 2.15049, 0.9019608, 0, 1, 1,
0.9052945, -1.098187, -0.2243974, 0.9098039, 0, 1, 1,
0.9066274, -0.3713354, 3.430732, 0.9137255, 0, 1, 1,
0.9079421, -0.04272655, 2.061704, 0.9215686, 0, 1, 1,
0.9143078, 0.8060817, 1.71725, 0.9254902, 0, 1, 1,
0.9157771, -0.5183173, 1.738855, 0.9333333, 0, 1, 1,
0.9226674, 0.4633848, 0.7375648, 0.9372549, 0, 1, 1,
0.9233032, 0.3456059, 0.3566089, 0.945098, 0, 1, 1,
0.9249144, 0.8897859, -1.646457, 0.9490196, 0, 1, 1,
0.9257247, 0.8794438, 2.832119, 0.9568627, 0, 1, 1,
0.9317232, -0.3216399, 2.785419, 0.9607843, 0, 1, 1,
0.9351151, -0.4388278, 2.405371, 0.9686275, 0, 1, 1,
0.9355185, 0.7562358, 1.512688, 0.972549, 0, 1, 1,
0.9398395, -0.2350072, 1.720804, 0.9803922, 0, 1, 1,
0.9423448, 1.190919, 1.344108, 0.9843137, 0, 1, 1,
0.9436262, 1.31274, 0.7106636, 0.9921569, 0, 1, 1,
0.9450284, -1.189203, 0.6752822, 0.9960784, 0, 1, 1,
0.9487393, 1.062374, -0.2446781, 1, 0, 0.9960784, 1,
0.9503143, -2.510328, 2.433787, 1, 0, 0.9882353, 1,
0.9529161, -0.5521744, 2.607755, 1, 0, 0.9843137, 1,
0.9532582, 0.6910024, 0.1703125, 1, 0, 0.9764706, 1,
0.9534189, -0.5045043, 2.534347, 1, 0, 0.972549, 1,
0.9569493, -0.4142719, 2.557496, 1, 0, 0.9647059, 1,
0.960439, 0.6428864, 2.044107, 1, 0, 0.9607843, 1,
0.9629726, -1.256043, 0.9793195, 1, 0, 0.9529412, 1,
0.9641015, -0.6466453, 3.183876, 1, 0, 0.9490196, 1,
0.967356, -0.4296787, 2.650154, 1, 0, 0.9411765, 1,
0.9695729, -0.4501319, 4.129038, 1, 0, 0.9372549, 1,
0.976827, -0.01122104, 0.8262944, 1, 0, 0.9294118, 1,
0.9784046, -0.9049088, 3.253381, 1, 0, 0.9254902, 1,
0.9791646, -1.994122, 2.723754, 1, 0, 0.9176471, 1,
0.9909629, -0.05396784, 1.498941, 1, 0, 0.9137255, 1,
0.9912623, -0.9830484, 2.97313, 1, 0, 0.9058824, 1,
0.9961048, -0.3929694, 1.579605, 1, 0, 0.9019608, 1,
0.9970673, -0.007401886, 1.048419, 1, 0, 0.8941177, 1,
0.9995395, -1.309859, 1.742713, 1, 0, 0.8862745, 1,
1.021514, -0.9105192, 3.385859, 1, 0, 0.8823529, 1,
1.022329, 2.109999, 1.183877, 1, 0, 0.8745098, 1,
1.026317, 2.121953, -1.133239, 1, 0, 0.8705882, 1,
1.026869, -0.1547192, 2.246467, 1, 0, 0.8627451, 1,
1.027333, 1.27697, 1.134127, 1, 0, 0.8588235, 1,
1.027577, 1.029564, -0.07943321, 1, 0, 0.8509804, 1,
1.033111, 1.264504, 1.815452, 1, 0, 0.8470588, 1,
1.041785, -0.1167733, 1.429822, 1, 0, 0.8392157, 1,
1.042148, -0.8377007, 1.081636, 1, 0, 0.8352941, 1,
1.047721, 0.5294379, 0.7696781, 1, 0, 0.827451, 1,
1.049431, -0.2501577, 1.755978, 1, 0, 0.8235294, 1,
1.051939, -0.2792945, 0.6058628, 1, 0, 0.8156863, 1,
1.05331, 0.2056719, 2.668393, 1, 0, 0.8117647, 1,
1.054517, -0.05014635, 1.839115, 1, 0, 0.8039216, 1,
1.057528, -0.4891933, 3.227988, 1, 0, 0.7960784, 1,
1.065145, -0.3635087, 2.065941, 1, 0, 0.7921569, 1,
1.078473, -0.3631671, 1.638012, 1, 0, 0.7843137, 1,
1.084087, -0.04631663, 1.709135, 1, 0, 0.7803922, 1,
1.084691, 1.501869, -0.7222941, 1, 0, 0.772549, 1,
1.085946, 2.795579, -0.3820463, 1, 0, 0.7686275, 1,
1.088615, 0.9670318, -1.333341, 1, 0, 0.7607843, 1,
1.09321, 0.5030852, 1.251707, 1, 0, 0.7568628, 1,
1.093342, 0.2816615, 0.9828293, 1, 0, 0.7490196, 1,
1.099429, -2.46803, 3.254966, 1, 0, 0.7450981, 1,
1.099682, -0.6288414, 2.522595, 1, 0, 0.7372549, 1,
1.105541, 0.3975677, 1.672889, 1, 0, 0.7333333, 1,
1.109072, 0.4920122, 1.467955, 1, 0, 0.7254902, 1,
1.118063, -0.4466024, 2.644408, 1, 0, 0.7215686, 1,
1.131073, 1.191369, 0.432869, 1, 0, 0.7137255, 1,
1.144244, 0.3273774, 0.9467066, 1, 0, 0.7098039, 1,
1.17451, 0.1308261, 2.459959, 1, 0, 0.7019608, 1,
1.174856, -0.4402016, 1.927578, 1, 0, 0.6941177, 1,
1.182217, -1.344059, 1.42372, 1, 0, 0.6901961, 1,
1.187523, -0.07510043, 1.359292, 1, 0, 0.682353, 1,
1.190889, -0.7931777, 2.139574, 1, 0, 0.6784314, 1,
1.19179, -0.3227786, 2.39751, 1, 0, 0.6705883, 1,
1.199688, -0.7838997, 2.178736, 1, 0, 0.6666667, 1,
1.200548, -0.6122993, 2.597938, 1, 0, 0.6588235, 1,
1.201886, 1.549143, 0.7724984, 1, 0, 0.654902, 1,
1.213571, -1.363661, 2.98475, 1, 0, 0.6470588, 1,
1.219527, -0.3186591, 2.101948, 1, 0, 0.6431373, 1,
1.220773, 1.231683, -0.06136673, 1, 0, 0.6352941, 1,
1.22529, 0.3127604, -0.08362629, 1, 0, 0.6313726, 1,
1.230305, -0.9312007, 2.279221, 1, 0, 0.6235294, 1,
1.242219, 0.4009944, 1.088693, 1, 0, 0.6196079, 1,
1.246408, 0.2745565, 0.6580047, 1, 0, 0.6117647, 1,
1.260621, 0.7458801, 1.574744, 1, 0, 0.6078432, 1,
1.262163, -0.9432304, 1.735927, 1, 0, 0.6, 1,
1.271378, -0.4504614, 2.163381, 1, 0, 0.5921569, 1,
1.28495, 0.03567219, 1.343062, 1, 0, 0.5882353, 1,
1.286982, -0.8453199, 2.715209, 1, 0, 0.5803922, 1,
1.297894, 1.069163, 0.6887063, 1, 0, 0.5764706, 1,
1.306119, -1.912637, 0.8157325, 1, 0, 0.5686275, 1,
1.319626, -0.3649969, 0.308392, 1, 0, 0.5647059, 1,
1.330232, 0.9373395, 0.3602426, 1, 0, 0.5568628, 1,
1.331156, -0.5317606, 2.26475, 1, 0, 0.5529412, 1,
1.335793, 0.5334387, -1.488203, 1, 0, 0.5450981, 1,
1.341533, -0.8523207, 1.508917, 1, 0, 0.5411765, 1,
1.371284, 1.713983, 0.8347427, 1, 0, 0.5333334, 1,
1.375502, 1.925825, 1.518327, 1, 0, 0.5294118, 1,
1.383978, -0.1471682, 1.77314, 1, 0, 0.5215687, 1,
1.391338, -1.266315, 0.5669217, 1, 0, 0.5176471, 1,
1.396854, -0.7258201, 3.748867, 1, 0, 0.509804, 1,
1.401488, 0.9576174, 0.5266608, 1, 0, 0.5058824, 1,
1.40215, -0.7532673, 1.040898, 1, 0, 0.4980392, 1,
1.405356, 1.997588, 0.4723381, 1, 0, 0.4901961, 1,
1.405549, 0.002878227, 1.745596, 1, 0, 0.4862745, 1,
1.406785, -0.184202, 0.9374103, 1, 0, 0.4784314, 1,
1.464168, 0.1269098, 1.697481, 1, 0, 0.4745098, 1,
1.470319, -0.2115267, 0.4455044, 1, 0, 0.4666667, 1,
1.471133, -0.4373131, 1.517386, 1, 0, 0.4627451, 1,
1.473713, 0.8893754, -0.8163915, 1, 0, 0.454902, 1,
1.495564, -0.1784797, 1.574851, 1, 0, 0.4509804, 1,
1.501526, 1.041982, 1.446869, 1, 0, 0.4431373, 1,
1.501705, -0.02400607, 0.4498741, 1, 0, 0.4392157, 1,
1.519611, 1.225615, 0.4921753, 1, 0, 0.4313726, 1,
1.524403, -0.6294066, 2.820697, 1, 0, 0.427451, 1,
1.539095, -0.5193357, 3.660727, 1, 0, 0.4196078, 1,
1.560316, 0.8193454, 1.690746, 1, 0, 0.4156863, 1,
1.563358, -0.1630422, 1.769668, 1, 0, 0.4078431, 1,
1.567792, 0.5038918, 2.34321, 1, 0, 0.4039216, 1,
1.568072, 0.4626151, 1.169321, 1, 0, 0.3960784, 1,
1.576583, 2.510296, 2.954528, 1, 0, 0.3882353, 1,
1.590001, -2.09547, 4.168437, 1, 0, 0.3843137, 1,
1.591396, -0.9067152, 2.138159, 1, 0, 0.3764706, 1,
1.607599, 0.05994935, 0.7325693, 1, 0, 0.372549, 1,
1.609051, -0.4470426, 2.553488, 1, 0, 0.3647059, 1,
1.614896, -1.835831, 1.810701, 1, 0, 0.3607843, 1,
1.615424, -0.8041975, 2.334818, 1, 0, 0.3529412, 1,
1.616325, -1.220071, 1.854591, 1, 0, 0.3490196, 1,
1.618281, -0.2951343, 2.085267, 1, 0, 0.3411765, 1,
1.622713, 0.8686081, 0.8100601, 1, 0, 0.3372549, 1,
1.636162, -0.4371459, 3.168768, 1, 0, 0.3294118, 1,
1.637737, -1.022183, 2.030932, 1, 0, 0.3254902, 1,
1.647784, 0.2608587, 0.9620677, 1, 0, 0.3176471, 1,
1.654378, -2.234629, 1.565369, 1, 0, 0.3137255, 1,
1.661372, 0.9457105, 0.9398109, 1, 0, 0.3058824, 1,
1.663368, -0.7131716, 1.443097, 1, 0, 0.2980392, 1,
1.689034, -0.2416574, 2.289048, 1, 0, 0.2941177, 1,
1.689633, -1.002993, 1.680103, 1, 0, 0.2862745, 1,
1.700388, 1.081591, 0.4808875, 1, 0, 0.282353, 1,
1.705481, -0.4610684, 2.697268, 1, 0, 0.2745098, 1,
1.731025, 0.09818139, 0.194962, 1, 0, 0.2705882, 1,
1.74064, 0.7739407, 2.162537, 1, 0, 0.2627451, 1,
1.748247, 1.865924, -0.5949326, 1, 0, 0.2588235, 1,
1.770548, 0.2324634, 4.287036, 1, 0, 0.2509804, 1,
1.777926, 0.3234154, 0.4493332, 1, 0, 0.2470588, 1,
1.786334, 0.0700157, 1.700475, 1, 0, 0.2392157, 1,
1.806583, -1.077003, 2.449975, 1, 0, 0.2352941, 1,
1.809564, -0.3607484, 0.8235304, 1, 0, 0.227451, 1,
1.847408, -0.1143248, 0.2382099, 1, 0, 0.2235294, 1,
1.894253, 0.05184548, 1.116624, 1, 0, 0.2156863, 1,
1.902191, -0.8072512, 1.544931, 1, 0, 0.2117647, 1,
1.90462, 0.07001267, 3.420299, 1, 0, 0.2039216, 1,
1.918838, -0.4504423, 0.0224013, 1, 0, 0.1960784, 1,
1.964881, -0.6080631, 2.241129, 1, 0, 0.1921569, 1,
1.967434, 0.4049875, 1.302914, 1, 0, 0.1843137, 1,
1.969757, 0.05143134, -0.167465, 1, 0, 0.1803922, 1,
1.979746, -0.586512, 2.713346, 1, 0, 0.172549, 1,
1.995982, 0.2836951, 0.2785353, 1, 0, 0.1686275, 1,
2.02408, -0.5579457, 3.151084, 1, 0, 0.1607843, 1,
2.042746, 1.074736, -1.392844, 1, 0, 0.1568628, 1,
2.043873, -0.3217287, 1.172041, 1, 0, 0.1490196, 1,
2.071126, -0.5995333, 1.572178, 1, 0, 0.145098, 1,
2.076363, 1.858796, -0.1259715, 1, 0, 0.1372549, 1,
2.087084, -0.08889015, 0.8375521, 1, 0, 0.1333333, 1,
2.101626, -0.3913534, 2.064863, 1, 0, 0.1254902, 1,
2.107139, -0.6340516, 0.8943085, 1, 0, 0.1215686, 1,
2.13782, -0.3054719, 0.9001332, 1, 0, 0.1137255, 1,
2.15983, -0.3215684, 1.436416, 1, 0, 0.1098039, 1,
2.192609, -0.5607903, 0.1643984, 1, 0, 0.1019608, 1,
2.247807, 1.633899, 1.967752, 1, 0, 0.09411765, 1,
2.270839, -0.2056315, 2.392178, 1, 0, 0.09019608, 1,
2.289378, -1.138727, 0.3969192, 1, 0, 0.08235294, 1,
2.32981, -0.334102, -0.6041825, 1, 0, 0.07843138, 1,
2.341173, -1.257751, 0.3825985, 1, 0, 0.07058824, 1,
2.354609, -0.03452109, 1.61818, 1, 0, 0.06666667, 1,
2.408478, 0.6470474, 0.7565403, 1, 0, 0.05882353, 1,
2.41564, 0.3045555, 0.5657175, 1, 0, 0.05490196, 1,
2.415771, -0.08881864, 1.715523, 1, 0, 0.04705882, 1,
2.417575, -0.3006521, 1.897987, 1, 0, 0.04313726, 1,
2.456, -2.402304, 1.802431, 1, 0, 0.03529412, 1,
2.491881, 0.02439868, 1.725558, 1, 0, 0.03137255, 1,
2.665933, 1.41258, 0.657191, 1, 0, 0.02352941, 1,
2.848451, -1.331551, 2.950944, 1, 0, 0.01960784, 1,
3.264384, -0.891, 1.440759, 1, 0, 0.01176471, 1,
3.505794, -0.3989835, 3.106759, 1, 0, 0.007843138, 1
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
-0.06209922, -5.280308, -6.882252, 0, -0.5, 0.5, 0.5,
-0.06209922, -5.280308, -6.882252, 1, -0.5, 0.5, 0.5,
-0.06209922, -5.280308, -6.882252, 1, 1.5, 0.5, 0.5,
-0.06209922, -5.280308, -6.882252, 0, 1.5, 0.5, 0.5
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
-4.839509, -0.6214435, -6.882252, 0, -0.5, 0.5, 0.5,
-4.839509, -0.6214435, -6.882252, 1, -0.5, 0.5, 0.5,
-4.839509, -0.6214435, -6.882252, 1, 1.5, 0.5, 0.5,
-4.839509, -0.6214435, -6.882252, 0, 1.5, 0.5, 0.5
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
-4.839509, -5.280308, 0.1902215, 0, -0.5, 0.5, 0.5,
-4.839509, -5.280308, 0.1902215, 1, -0.5, 0.5, 0.5,
-4.839509, -5.280308, 0.1902215, 1, 1.5, 0.5, 0.5,
-4.839509, -5.280308, 0.1902215, 0, 1.5, 0.5, 0.5
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
-2, -4.205185, -5.250143,
2, -4.205185, -5.250143,
-2, -4.205185, -5.250143,
-2, -4.384372, -5.522161,
0, -4.205185, -5.250143,
0, -4.384372, -5.522161,
2, -4.205185, -5.250143,
2, -4.384372, -5.522161
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
-2, -4.742746, -6.066198, 0, -0.5, 0.5, 0.5,
-2, -4.742746, -6.066198, 1, -0.5, 0.5, 0.5,
-2, -4.742746, -6.066198, 1, 1.5, 0.5, 0.5,
-2, -4.742746, -6.066198, 0, 1.5, 0.5, 0.5,
0, -4.742746, -6.066198, 0, -0.5, 0.5, 0.5,
0, -4.742746, -6.066198, 1, -0.5, 0.5, 0.5,
0, -4.742746, -6.066198, 1, 1.5, 0.5, 0.5,
0, -4.742746, -6.066198, 0, 1.5, 0.5, 0.5,
2, -4.742746, -6.066198, 0, -0.5, 0.5, 0.5,
2, -4.742746, -6.066198, 1, -0.5, 0.5, 0.5,
2, -4.742746, -6.066198, 1, 1.5, 0.5, 0.5,
2, -4.742746, -6.066198, 0, 1.5, 0.5, 0.5
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
-3.73703, -4, -5.250143,
-3.73703, 2, -5.250143,
-3.73703, -4, -5.250143,
-3.920776, -4, -5.522161,
-3.73703, -3, -5.250143,
-3.920776, -3, -5.522161,
-3.73703, -2, -5.250143,
-3.920776, -2, -5.522161,
-3.73703, -1, -5.250143,
-3.920776, -1, -5.522161,
-3.73703, 0, -5.250143,
-3.920776, 0, -5.522161,
-3.73703, 1, -5.250143,
-3.920776, 1, -5.522161,
-3.73703, 2, -5.250143,
-3.920776, 2, -5.522161
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
"-4",
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
-4.288269, -4, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, -4, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, -4, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, -4, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, -3, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, -3, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, -3, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, -3, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, -2, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, -2, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, -2, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, -2, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, -1, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, -1, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, -1, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, -1, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, 0, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, 0, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, 0, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, 0, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, 1, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, 1, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, 1, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, 1, -6.066198, 0, 1.5, 0.5, 0.5,
-4.288269, 2, -6.066198, 0, -0.5, 0.5, 0.5,
-4.288269, 2, -6.066198, 1, -0.5, 0.5, 0.5,
-4.288269, 2, -6.066198, 1, 1.5, 0.5, 0.5,
-4.288269, 2, -6.066198, 0, 1.5, 0.5, 0.5
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
-3.73703, -4.205185, -4,
-3.73703, -4.205185, 4,
-3.73703, -4.205185, -4,
-3.920776, -4.384372, -4,
-3.73703, -4.205185, -2,
-3.920776, -4.384372, -2,
-3.73703, -4.205185, 0,
-3.920776, -4.384372, 0,
-3.73703, -4.205185, 2,
-3.920776, -4.384372, 2,
-3.73703, -4.205185, 4,
-3.920776, -4.384372, 4
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
-4.288269, -4.742746, -4, 0, -0.5, 0.5, 0.5,
-4.288269, -4.742746, -4, 1, -0.5, 0.5, 0.5,
-4.288269, -4.742746, -4, 1, 1.5, 0.5, 0.5,
-4.288269, -4.742746, -4, 0, 1.5, 0.5, 0.5,
-4.288269, -4.742746, -2, 0, -0.5, 0.5, 0.5,
-4.288269, -4.742746, -2, 1, -0.5, 0.5, 0.5,
-4.288269, -4.742746, -2, 1, 1.5, 0.5, 0.5,
-4.288269, -4.742746, -2, 0, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 0, 0, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 0, 1, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 0, 1, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 0, 0, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 2, 0, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 2, 1, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 2, 1, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 2, 0, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 4, 0, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 4, 1, -0.5, 0.5, 0.5,
-4.288269, -4.742746, 4, 1, 1.5, 0.5, 0.5,
-4.288269, -4.742746, 4, 0, 1.5, 0.5, 0.5
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
-3.73703, -4.205185, -5.250143,
-3.73703, 2.962298, -5.250143,
-3.73703, -4.205185, 5.630586,
-3.73703, 2.962298, 5.630586,
-3.73703, -4.205185, -5.250143,
-3.73703, -4.205185, 5.630586,
-3.73703, 2.962298, -5.250143,
-3.73703, 2.962298, 5.630586,
-3.73703, -4.205185, -5.250143,
3.612831, -4.205185, -5.250143,
-3.73703, -4.205185, 5.630586,
3.612831, -4.205185, 5.630586,
-3.73703, 2.962298, -5.250143,
3.612831, 2.962298, -5.250143,
-3.73703, 2.962298, 5.630586,
3.612831, 2.962298, 5.630586,
3.612831, -4.205185, -5.250143,
3.612831, 2.962298, -5.250143,
3.612831, -4.205185, 5.630586,
3.612831, 2.962298, 5.630586,
3.612831, -4.205185, -5.250143,
3.612831, -4.205185, 5.630586,
3.612831, 2.962298, -5.250143,
3.612831, 2.962298, 5.630586
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
var radius = 7.988027;
var distance = 35.53963;
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
mvMatrix.translate( 0.06209922, 0.6214435, -0.1902215 );
mvMatrix.scale( 1.175099, 1.204999, 0.7937714 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.53963);
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
Chlordane<-read.table("Chlordane.xyz")
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
-3.629993, 0.3963944, -2.864648, 0, 0, 1, 1, 1,
-2.881957, -0.9833494, -2.889163, 1, 0, 0, 1, 1,
-2.713242, -0.03835074, -0.6627647, 1, 0, 0, 1, 1,
-2.681379, -0.456387, -2.246939, 1, 0, 0, 1, 1,
-2.574862, -0.1850708, -2.643657, 1, 0, 0, 1, 1,
-2.425658, 0.7527537, -2.541837, 1, 0, 0, 1, 1,
-2.372661, -0.769955, -1.726172, 0, 0, 0, 1, 1,
-2.350432, 0.6007326, -2.341536, 0, 0, 0, 1, 1,
-2.348157, -0.05312711, -2.097543, 0, 0, 0, 1, 1,
-2.304951, -0.3699574, -4.216201, 0, 0, 0, 1, 1,
-2.262874, 0.7579287, -0.6999871, 0, 0, 0, 1, 1,
-2.247292, -1.168181, -2.209185, 0, 0, 0, 1, 1,
-2.206462, -0.1556922, -2.6042, 0, 0, 0, 1, 1,
-2.157937, 1.004255, 0.5573062, 1, 1, 1, 1, 1,
-2.15528, -0.4588189, -1.973133, 1, 1, 1, 1, 1,
-2.132812, 0.9523115, -0.6047356, 1, 1, 1, 1, 1,
-2.117072, 0.7993483, -0.27622, 1, 1, 1, 1, 1,
-2.106798, -1.007031, -1.714485, 1, 1, 1, 1, 1,
-2.068393, -1.928473, -2.46206, 1, 1, 1, 1, 1,
-2.040033, 1.453426, -1.149574, 1, 1, 1, 1, 1,
-2.025009, -0.8221092, -1.430554, 1, 1, 1, 1, 1,
-2.009542, -0.7854714, -1.556284, 1, 1, 1, 1, 1,
-1.944747, -0.7987506, -3.054278, 1, 1, 1, 1, 1,
-1.925488, -1.302047, -2.276739, 1, 1, 1, 1, 1,
-1.845058, 1.510432, -0.3885652, 1, 1, 1, 1, 1,
-1.839819, -0.6745695, 0.0486844, 1, 1, 1, 1, 1,
-1.832018, -0.222273, -2.712881, 1, 1, 1, 1, 1,
-1.828952, -1.48177, -2.164374, 1, 1, 1, 1, 1,
-1.813674, -0.3885305, -3.362303, 0, 0, 1, 1, 1,
-1.80474, -0.4571438, -0.7240322, 1, 0, 0, 1, 1,
-1.79305, 1.358101, 0.5284615, 1, 0, 0, 1, 1,
-1.784585, -1.057288, -4.007904, 1, 0, 0, 1, 1,
-1.779853, -1.192288, -2.37921, 1, 0, 0, 1, 1,
-1.773903, -0.1164178, -2.324362, 1, 0, 0, 1, 1,
-1.769657, 1.130071, -2.378778, 0, 0, 0, 1, 1,
-1.760069, 1.24182, -3.075283, 0, 0, 0, 1, 1,
-1.74185, -0.635224, -0.6413296, 0, 0, 0, 1, 1,
-1.737673, 0.6093143, -1.85839, 0, 0, 0, 1, 1,
-1.722588, -0.3222694, -3.143147, 0, 0, 0, 1, 1,
-1.708073, -1.301808, -2.448418, 0, 0, 0, 1, 1,
-1.700505, 1.139187, -0.9492445, 0, 0, 0, 1, 1,
-1.692757, 0.7380853, -1.622656, 1, 1, 1, 1, 1,
-1.688739, 1.65047, -1.566645, 1, 1, 1, 1, 1,
-1.675929, -0.03188648, -0.8704638, 1, 1, 1, 1, 1,
-1.661615, 0.8804079, -0.7725586, 1, 1, 1, 1, 1,
-1.659242, 0.6820111, 0.02693116, 1, 1, 1, 1, 1,
-1.656894, -1.306387, -2.300166, 1, 1, 1, 1, 1,
-1.652287, -0.04252749, -2.160001, 1, 1, 1, 1, 1,
-1.640383, 0.2288264, -3.074347, 1, 1, 1, 1, 1,
-1.636553, -0.1871718, -1.363842, 1, 1, 1, 1, 1,
-1.633647, 2.261855, 0.04743642, 1, 1, 1, 1, 1,
-1.625358, 0.9319921, -1.306977, 1, 1, 1, 1, 1,
-1.624454, 0.7482197, -1.938243, 1, 1, 1, 1, 1,
-1.621115, -1.112166, -3.202316, 1, 1, 1, 1, 1,
-1.619843, 0.6585494, -0.32014, 1, 1, 1, 1, 1,
-1.61981, 1.491127, -0.8522424, 1, 1, 1, 1, 1,
-1.61793, 0.4465122, -3.640226, 0, 0, 1, 1, 1,
-1.617269, -0.616043, -0.7979575, 1, 0, 0, 1, 1,
-1.616904, -1.15047, -1.258978, 1, 0, 0, 1, 1,
-1.606355, 0.8005201, -2.777799, 1, 0, 0, 1, 1,
-1.605408, -0.593806, -0.7798206, 1, 0, 0, 1, 1,
-1.604717, -0.2140896, -1.833391, 1, 0, 0, 1, 1,
-1.599985, -0.9772568, -2.227016, 0, 0, 0, 1, 1,
-1.592801, -1.261744, -1.262949, 0, 0, 0, 1, 1,
-1.582038, 1.104712, -0.8343847, 0, 0, 0, 1, 1,
-1.581287, -0.5938051, -2.197333, 0, 0, 0, 1, 1,
-1.561566, -2.108298, -3.026955, 0, 0, 0, 1, 1,
-1.56118, -0.3500115, -2.761567, 0, 0, 0, 1, 1,
-1.561169, 0.8198036, -2.522528, 0, 0, 0, 1, 1,
-1.555065, 0.6693361, -1.316456, 1, 1, 1, 1, 1,
-1.554428, -0.5221944, -0.9719823, 1, 1, 1, 1, 1,
-1.546823, -0.4998717, -1.441172, 1, 1, 1, 1, 1,
-1.545711, -0.1089775, -2.158695, 1, 1, 1, 1, 1,
-1.543213, -1.415769, -2.947559, 1, 1, 1, 1, 1,
-1.542415, -0.2758552, -4.470164, 1, 1, 1, 1, 1,
-1.539081, 1.371551, -0.7460963, 1, 1, 1, 1, 1,
-1.534014, -0.008225699, -0.843066, 1, 1, 1, 1, 1,
-1.516176, 0.05264092, -0.7923764, 1, 1, 1, 1, 1,
-1.494188, -0.1598246, -1.165592, 1, 1, 1, 1, 1,
-1.491138, 0.7555904, -1.482488, 1, 1, 1, 1, 1,
-1.466846, 1.504297, -1.433986, 1, 1, 1, 1, 1,
-1.46667, -1.29993, -3.66197, 1, 1, 1, 1, 1,
-1.449253, 0.5142114, -0.8842964, 1, 1, 1, 1, 1,
-1.445646, 2.857917, -0.6874557, 1, 1, 1, 1, 1,
-1.431234, -1.511196, -4.023992, 0, 0, 1, 1, 1,
-1.429742, -1.571227, -1.809338, 1, 0, 0, 1, 1,
-1.423856, 0.6112063, -2.108077, 1, 0, 0, 1, 1,
-1.418319, 0.2366851, 0.5591972, 1, 0, 0, 1, 1,
-1.415934, -1.157577, -2.377337, 1, 0, 0, 1, 1,
-1.411985, -0.5596399, -1.528152, 1, 0, 0, 1, 1,
-1.406032, 0.8446885, -0.1169186, 0, 0, 0, 1, 1,
-1.400867, 1.057693, -0.6136518, 0, 0, 0, 1, 1,
-1.392434, -0.4029758, -1.63395, 0, 0, 0, 1, 1,
-1.389271, -1.144838, -0.6923395, 0, 0, 0, 1, 1,
-1.37576, 0.8139179, -2.095509, 0, 0, 0, 1, 1,
-1.372911, 0.06145971, -0.9689007, 0, 0, 0, 1, 1,
-1.372389, -0.6770323, -3.413097, 0, 0, 0, 1, 1,
-1.370856, 0.2450978, -2.501519, 1, 1, 1, 1, 1,
-1.369445, 0.5790801, -2.810085, 1, 1, 1, 1, 1,
-1.359017, 0.1153436, -2.683568, 1, 1, 1, 1, 1,
-1.3481, -0.820837, -3.343987, 1, 1, 1, 1, 1,
-1.346051, 0.232127, -1.636984, 1, 1, 1, 1, 1,
-1.34262, -2.538642, -3.071652, 1, 1, 1, 1, 1,
-1.330386, 0.354086, -0.2990386, 1, 1, 1, 1, 1,
-1.320402, -0.7149792, -0.3265879, 1, 1, 1, 1, 1,
-1.310768, -0.01116588, -1.408216, 1, 1, 1, 1, 1,
-1.309648, 0.5052276, -1.007855, 1, 1, 1, 1, 1,
-1.294524, -0.7953621, -2.093905, 1, 1, 1, 1, 1,
-1.283765, -0.4565428, -1.55624, 1, 1, 1, 1, 1,
-1.271362, 0.03472304, -1.134018, 1, 1, 1, 1, 1,
-1.26503, -0.3960483, -2.864941, 1, 1, 1, 1, 1,
-1.252348, -0.6255249, -2.507921, 1, 1, 1, 1, 1,
-1.248919, -0.1554989, -3.042387, 0, 0, 1, 1, 1,
-1.232403, -0.9298565, -2.514983, 1, 0, 0, 1, 1,
-1.230996, -1.720009, -2.403663, 1, 0, 0, 1, 1,
-1.228047, 1.729211, 0.2877857, 1, 0, 0, 1, 1,
-1.224702, -0.4405038, -2.302006, 1, 0, 0, 1, 1,
-1.223905, 1.877797, 1.446559, 1, 0, 0, 1, 1,
-1.217784, 0.3635895, -0.5605918, 0, 0, 0, 1, 1,
-1.215147, 0.5391253, -0.6865304, 0, 0, 0, 1, 1,
-1.210402, -0.5095576, -1.331049, 0, 0, 0, 1, 1,
-1.204082, -0.8661886, -1.07924, 0, 0, 0, 1, 1,
-1.2036, -0.09763734, -2.550822, 0, 0, 0, 1, 1,
-1.191361, 1.812427, -0.6111259, 0, 0, 0, 1, 1,
-1.189334, -1.226637, -1.954329, 0, 0, 0, 1, 1,
-1.18764, 0.6230804, -0.3445586, 1, 1, 1, 1, 1,
-1.186639, -0.1496398, -1.703476, 1, 1, 1, 1, 1,
-1.171088, 0.2039201, -2.378621, 1, 1, 1, 1, 1,
-1.151939, 2.310486, -0.5295284, 1, 1, 1, 1, 1,
-1.149977, 1.390449, -1.810523, 1, 1, 1, 1, 1,
-1.140735, -0.1866838, -1.151178, 1, 1, 1, 1, 1,
-1.135308, 1.191581, -1.950708, 1, 1, 1, 1, 1,
-1.13479, 0.4319052, 1.184314, 1, 1, 1, 1, 1,
-1.131335, 1.636261, -1.62533, 1, 1, 1, 1, 1,
-1.127736, 0.8786302, -0.7570162, 1, 1, 1, 1, 1,
-1.127307, 1.564559, -1.285302, 1, 1, 1, 1, 1,
-1.112822, -1.045241, -1.931889, 1, 1, 1, 1, 1,
-1.111154, -4.100804, -3.992101, 1, 1, 1, 1, 1,
-1.104476, 0.9108268, -0.09921005, 1, 1, 1, 1, 1,
-1.103213, -0.195548, -0.843178, 1, 1, 1, 1, 1,
-1.102107, 0.172179, -2.490005, 0, 0, 1, 1, 1,
-1.097611, -0.6197089, -4.017495, 1, 0, 0, 1, 1,
-1.097175, 0.2958135, -1.912888, 1, 0, 0, 1, 1,
-1.095839, 0.09717599, -2.086182, 1, 0, 0, 1, 1,
-1.09553, -0.08123896, -2.027411, 1, 0, 0, 1, 1,
-1.094414, 0.1087677, -0.5158919, 1, 0, 0, 1, 1,
-1.093096, 1.722816, 0.215227, 0, 0, 0, 1, 1,
-1.083041, 0.7085042, -1.861511, 0, 0, 0, 1, 1,
-1.080508, -0.4934354, -0.07883726, 0, 0, 0, 1, 1,
-1.070182, -1.064229, -1.603126, 0, 0, 0, 1, 1,
-1.068758, -1.0149, -3.714137, 0, 0, 0, 1, 1,
-1.067339, 1.592774, -0.6540807, 0, 0, 0, 1, 1,
-1.067059, 1.661895, -0.1891268, 0, 0, 0, 1, 1,
-1.066431, -1.040662, -1.685029, 1, 1, 1, 1, 1,
-1.064814, -0.8924099, -3.492508, 1, 1, 1, 1, 1,
-1.063381, 1.112932, 0.01194322, 1, 1, 1, 1, 1,
-1.057336, -1.301196, -1.33535, 1, 1, 1, 1, 1,
-1.047178, -0.8059244, -1.333562, 1, 1, 1, 1, 1,
-1.04445, -0.967609, -1.785653, 1, 1, 1, 1, 1,
-1.043934, 0.02169639, -0.86399, 1, 1, 1, 1, 1,
-1.042196, -0.6292492, -3.795858, 1, 1, 1, 1, 1,
-1.021392, 0.7900546, -0.6055956, 1, 1, 1, 1, 1,
-1.018163, 0.1923007, -2.307493, 1, 1, 1, 1, 1,
-1.017117, 0.9114907, -2.72262, 1, 1, 1, 1, 1,
-1.015421, 0.6069662, -2.527436, 1, 1, 1, 1, 1,
-1.01409, -0.1574872, -2.690855, 1, 1, 1, 1, 1,
-1.013096, 1.033046, -1.61052, 1, 1, 1, 1, 1,
-1.007966, -0.560342, -2.610609, 1, 1, 1, 1, 1,
-1.004063, 1.306162, -0.5828003, 0, 0, 1, 1, 1,
-0.9981803, -0.9159978, -3.42348, 1, 0, 0, 1, 1,
-0.9948502, 0.4541374, 0.7452458, 1, 0, 0, 1, 1,
-0.9792081, -0.4230469, -1.275149, 1, 0, 0, 1, 1,
-0.9663038, 0.9644594, -0.4217054, 1, 0, 0, 1, 1,
-0.9629767, 1.237999, -0.8595055, 1, 0, 0, 1, 1,
-0.9608739, 1.123998, -0.7111434, 0, 0, 0, 1, 1,
-0.9601479, 0.1911322, -0.5662475, 0, 0, 0, 1, 1,
-0.9593002, 0.7824823, 0.6680623, 0, 0, 0, 1, 1,
-0.9590943, -0.9316542, -1.710727, 0, 0, 0, 1, 1,
-0.9584823, 0.2096918, -2.404018, 0, 0, 0, 1, 1,
-0.9583163, 0.1339546, -0.4000006, 0, 0, 0, 1, 1,
-0.951087, -0.5397384, -1.894449, 0, 0, 0, 1, 1,
-0.9471071, 0.1505324, -0.2198437, 1, 1, 1, 1, 1,
-0.9439445, 0.9329262, -0.01935055, 1, 1, 1, 1, 1,
-0.9428193, 1.585014, 0.4566182, 1, 1, 1, 1, 1,
-0.9375983, 0.3243997, -0.7436116, 1, 1, 1, 1, 1,
-0.9285122, -0.4651612, -1.044833, 1, 1, 1, 1, 1,
-0.9277887, -1.13895, -2.650209, 1, 1, 1, 1, 1,
-0.9216633, -0.2382641, -2.633564, 1, 1, 1, 1, 1,
-0.9134097, 0.3193794, 0.1561071, 1, 1, 1, 1, 1,
-0.9119559, -0.1788899, -2.979689, 1, 1, 1, 1, 1,
-0.9080837, -1.398842, -2.055004, 1, 1, 1, 1, 1,
-0.9080586, -0.3158453, -0.9556836, 1, 1, 1, 1, 1,
-0.9078637, -0.3143538, -1.541038, 1, 1, 1, 1, 1,
-0.9070218, 0.4386202, -1.210078, 1, 1, 1, 1, 1,
-0.904138, -0.8150303, -4.672668, 1, 1, 1, 1, 1,
-0.8982847, -0.8731392, -0.865873, 1, 1, 1, 1, 1,
-0.8971179, -0.5530941, -1.703606, 0, 0, 1, 1, 1,
-0.8969625, -0.01894728, -1.965005, 1, 0, 0, 1, 1,
-0.8854495, 0.6868115, -0.2854489, 1, 0, 0, 1, 1,
-0.8799937, 0.006906057, -1.436718, 1, 0, 0, 1, 1,
-0.8778147, 0.04260099, 0.7167556, 1, 0, 0, 1, 1,
-0.8775896, 1.36175, -1.19999, 1, 0, 0, 1, 1,
-0.8710629, 0.5910679, -0.5789476, 0, 0, 0, 1, 1,
-0.8618465, -0.4267055, -4.200383, 0, 0, 0, 1, 1,
-0.8607146, 0.8077782, -2.631896, 0, 0, 0, 1, 1,
-0.8590489, 1.530248, 1.034215, 0, 0, 0, 1, 1,
-0.8557239, 0.1660946, -1.199721, 0, 0, 0, 1, 1,
-0.8511695, 0.3820561, -1.730596, 0, 0, 0, 1, 1,
-0.8500749, 0.2547203, -0.2135569, 0, 0, 0, 1, 1,
-0.8488512, -0.9920098, -2.33419, 1, 1, 1, 1, 1,
-0.8366995, 0.0352518, -0.9386031, 1, 1, 1, 1, 1,
-0.8345003, 0.4839167, 0.6346644, 1, 1, 1, 1, 1,
-0.8340371, 0.2283439, -1.485068, 1, 1, 1, 1, 1,
-0.831126, 2.010658, -0.4114878, 1, 1, 1, 1, 1,
-0.8292377, -1.329616, -3.243434, 1, 1, 1, 1, 1,
-0.8233342, 2.001486, 0.2352499, 1, 1, 1, 1, 1,
-0.8223609, -1.543206, -3.659554, 1, 1, 1, 1, 1,
-0.817295, -1.132742, -2.872195, 1, 1, 1, 1, 1,
-0.815924, -0.7374991, -2.738304, 1, 1, 1, 1, 1,
-0.8109805, -2.681587, -3.562267, 1, 1, 1, 1, 1,
-0.8102112, -0.1212973, -2.220034, 1, 1, 1, 1, 1,
-0.8094525, -0.01164968, -1.724554, 1, 1, 1, 1, 1,
-0.8050548, -1.794767, -2.6828, 1, 1, 1, 1, 1,
-0.8020339, 0.8490074, 0.4128363, 1, 1, 1, 1, 1,
-0.80029, 0.414843, 1.118277, 0, 0, 1, 1, 1,
-0.7997848, 1.274299, 0.9275143, 1, 0, 0, 1, 1,
-0.7982752, -0.0829165, -2.301944, 1, 0, 0, 1, 1,
-0.7931656, 2.096036, 0.1045766, 1, 0, 0, 1, 1,
-0.7879916, 0.8762616, -2.08322, 1, 0, 0, 1, 1,
-0.7830098, -0.02631403, -1.437419, 1, 0, 0, 1, 1,
-0.7806923, 0.6123628, -0.4916223, 0, 0, 0, 1, 1,
-0.7806061, -0.6136416, -2.186561, 0, 0, 0, 1, 1,
-0.7801944, 0.1306606, -2.384402, 0, 0, 0, 1, 1,
-0.7790592, 1.405602, -1.813263, 0, 0, 0, 1, 1,
-0.7778973, -0.1426136, -3.377489, 0, 0, 0, 1, 1,
-0.7743651, -1.193022, -1.61164, 0, 0, 0, 1, 1,
-0.7731701, -1.432089, -3.168597, 0, 0, 0, 1, 1,
-0.7572158, -0.4614865, -0.1319807, 1, 1, 1, 1, 1,
-0.7550056, 0.2364097, -0.9509267, 1, 1, 1, 1, 1,
-0.754644, -1.009787, -3.074574, 1, 1, 1, 1, 1,
-0.7534487, 0.6686066, -1.718668, 1, 1, 1, 1, 1,
-0.7524849, -0.4938171, -2.84902, 1, 1, 1, 1, 1,
-0.7484306, -1.843165, -1.414316, 1, 1, 1, 1, 1,
-0.7475985, 1.091263, -2.041129, 1, 1, 1, 1, 1,
-0.7429805, -0.774686, -0.7259032, 1, 1, 1, 1, 1,
-0.7427614, 0.5006013, -0.8788413, 1, 1, 1, 1, 1,
-0.7426822, 0.5364479, -0.6657468, 1, 1, 1, 1, 1,
-0.7373735, 2.010942, -0.9683017, 1, 1, 1, 1, 1,
-0.7332907, 0.382949, -1.328672, 1, 1, 1, 1, 1,
-0.7310377, 0.4004519, 0.7376681, 1, 1, 1, 1, 1,
-0.7251948, -0.08989921, -3.007158, 1, 1, 1, 1, 1,
-0.7214924, -1.490433, -2.327169, 1, 1, 1, 1, 1,
-0.7210915, 0.2907517, -0.9796891, 0, 0, 1, 1, 1,
-0.7194393, 1.067374, -1.719763, 1, 0, 0, 1, 1,
-0.7176751, -0.6874509, -2.513705, 1, 0, 0, 1, 1,
-0.7175267, -0.6583309, -0.3870152, 1, 0, 0, 1, 1,
-0.7151529, -0.7132851, -2.130718, 1, 0, 0, 1, 1,
-0.7038015, -1.290408, -2.080995, 1, 0, 0, 1, 1,
-0.7025244, 0.280375, -2.662206, 0, 0, 0, 1, 1,
-0.7018926, 1.353033, -1.01597, 0, 0, 0, 1, 1,
-0.6969573, -1.153719, -1.1142, 0, 0, 0, 1, 1,
-0.6948527, 0.9471895, -0.48428, 0, 0, 0, 1, 1,
-0.6947299, -0.1946852, -0.05474681, 0, 0, 0, 1, 1,
-0.6945114, 0.5067248, -0.8431858, 0, 0, 0, 1, 1,
-0.6879188, -0.1315851, -2.93351, 0, 0, 0, 1, 1,
-0.6803811, -0.9239012, -1.990287, 1, 1, 1, 1, 1,
-0.6752366, 2.476247, -0.6703889, 1, 1, 1, 1, 1,
-0.6746252, 0.1290472, -1.161977, 1, 1, 1, 1, 1,
-0.661732, 1.521717, -1.244694, 1, 1, 1, 1, 1,
-0.6598085, -1.092771, -2.594531, 1, 1, 1, 1, 1,
-0.6595047, -1.423929, -3.268281, 1, 1, 1, 1, 1,
-0.659382, 0.3034837, -2.06269, 1, 1, 1, 1, 1,
-0.6584167, -0.3943865, -0.8063501, 1, 1, 1, 1, 1,
-0.6524071, -0.6146356, -1.968111, 1, 1, 1, 1, 1,
-0.652009, 2.029635, 0.8077363, 1, 1, 1, 1, 1,
-0.6505043, -0.2968185, -1.993629, 1, 1, 1, 1, 1,
-0.6463101, -0.9776514, -3.513133, 1, 1, 1, 1, 1,
-0.6417876, 1.954622, -0.2994149, 1, 1, 1, 1, 1,
-0.634142, 0.2623443, -1.199926, 1, 1, 1, 1, 1,
-0.6307092, -3.049372, -5.091686, 1, 1, 1, 1, 1,
-0.6285989, -0.5584906, -2.889571, 0, 0, 1, 1, 1,
-0.6277379, -2.117264, -2.241102, 1, 0, 0, 1, 1,
-0.6273308, 0.2928472, -1.821837, 1, 0, 0, 1, 1,
-0.6272513, 2.530202, -0.6554435, 1, 0, 0, 1, 1,
-0.626895, 1.447879, -0.4566505, 1, 0, 0, 1, 1,
-0.6262779, 0.6131808, 0.05406588, 1, 0, 0, 1, 1,
-0.6261794, -0.5589582, -2.392367, 0, 0, 0, 1, 1,
-0.6255629, -0.4556255, -1.945303, 0, 0, 0, 1, 1,
-0.6253617, 1.331367, 0.1453185, 0, 0, 0, 1, 1,
-0.6237284, -1.113601, -3.35389, 0, 0, 0, 1, 1,
-0.620532, 0.07877851, -0.9465511, 0, 0, 0, 1, 1,
-0.6063939, 1.671221, -0.4610808, 0, 0, 0, 1, 1,
-0.606082, -0.5752932, -2.120356, 0, 0, 0, 1, 1,
-0.6028655, 0.179609, -0.8971087, 1, 1, 1, 1, 1,
-0.5956846, 1.044941, -2.042759, 1, 1, 1, 1, 1,
-0.5954773, 0.5540488, 0.2938729, 1, 1, 1, 1, 1,
-0.5948012, -1.440077, -3.648584, 1, 1, 1, 1, 1,
-0.5927065, -0.8424445, -1.114889, 1, 1, 1, 1, 1,
-0.5892478, -0.3769727, -2.109072, 1, 1, 1, 1, 1,
-0.5845222, -0.6332258, -1.651906, 1, 1, 1, 1, 1,
-0.5826172, -2.263021, -3.854655, 1, 1, 1, 1, 1,
-0.5768747, 0.6296456, -2.055867, 1, 1, 1, 1, 1,
-0.5716287, -1.17361, -4.288632, 1, 1, 1, 1, 1,
-0.5668315, -0.9913951, -1.438847, 1, 1, 1, 1, 1,
-0.564413, 0.2280852, -1.766994, 1, 1, 1, 1, 1,
-0.5622485, 0.4200664, -0.8378153, 1, 1, 1, 1, 1,
-0.5619093, 0.6790276, 0.3205687, 1, 1, 1, 1, 1,
-0.5583331, -2.125931, -2.773998, 1, 1, 1, 1, 1,
-0.5560979, -0.3199933, 0.3355514, 0, 0, 1, 1, 1,
-0.555891, -1.210316, -4.967103, 1, 0, 0, 1, 1,
-0.5540385, -0.4293027, -1.602856, 1, 0, 0, 1, 1,
-0.5517882, 1.477145, -0.3364463, 1, 0, 0, 1, 1,
-0.5516773, 0.9523789, 1.130035, 1, 0, 0, 1, 1,
-0.5495242, -0.2693858, -1.322778, 1, 0, 0, 1, 1,
-0.5448247, 0.3058872, 0.2945109, 0, 0, 0, 1, 1,
-0.5433533, -1.000506, -1.298345, 0, 0, 0, 1, 1,
-0.5382369, 0.3912693, -1.479012, 0, 0, 0, 1, 1,
-0.5290972, 0.04806091, -2.84906, 0, 0, 0, 1, 1,
-0.517803, 0.6498941, 0.3052362, 0, 0, 0, 1, 1,
-0.5174008, -0.07675942, -2.132732, 0, 0, 0, 1, 1,
-0.515324, 2.473588, 0.5231832, 0, 0, 0, 1, 1,
-0.5134599, 0.7861008, -1.360301, 1, 1, 1, 1, 1,
-0.5118034, -0.5224717, -3.289658, 1, 1, 1, 1, 1,
-0.5087942, 0.6432514, -1.517911, 1, 1, 1, 1, 1,
-0.506586, -1.060153, -3.748759, 1, 1, 1, 1, 1,
-0.4986527, 0.043786, -1.365842, 1, 1, 1, 1, 1,
-0.497628, -0.4080911, -2.649049, 1, 1, 1, 1, 1,
-0.4964749, 0.2998528, -2.069885, 1, 1, 1, 1, 1,
-0.4952115, 0.4071797, -1.141117, 1, 1, 1, 1, 1,
-0.4886109, 1.74394, -1.988522, 1, 1, 1, 1, 1,
-0.4857051, 1.348319, -0.5614452, 1, 1, 1, 1, 1,
-0.4840455, -1.11207, -1.488135, 1, 1, 1, 1, 1,
-0.4817795, 0.0967489, 0.7716295, 1, 1, 1, 1, 1,
-0.4812071, -0.3392482, -2.163662, 1, 1, 1, 1, 1,
-0.4777745, 1.66226, -0.8030728, 1, 1, 1, 1, 1,
-0.4773732, 1.468748, -2.194911, 1, 1, 1, 1, 1,
-0.4722067, -0.7682232, -1.72464, 0, 0, 1, 1, 1,
-0.4707919, -1.691569, -2.755646, 1, 0, 0, 1, 1,
-0.4675884, -2.222812, -3.537923, 1, 0, 0, 1, 1,
-0.4626928, 0.5486605, 0.5770111, 1, 0, 0, 1, 1,
-0.4611115, 0.7217171, 0.907865, 1, 0, 0, 1, 1,
-0.4594961, 0.7311775, 0.4044785, 1, 0, 0, 1, 1,
-0.4577034, -0.155836, -1.16906, 0, 0, 0, 1, 1,
-0.4553739, -0.7849979, -2.158037, 0, 0, 0, 1, 1,
-0.4487778, 0.6574461, 0.3257885, 0, 0, 0, 1, 1,
-0.4481092, 0.5914761, -0.01175912, 0, 0, 0, 1, 1,
-0.4478601, -2.548113, -2.81749, 0, 0, 0, 1, 1,
-0.4441582, 0.6555622, -1.19773, 0, 0, 0, 1, 1,
-0.4402879, 0.2678893, -0.2523905, 0, 0, 0, 1, 1,
-0.4374779, -0.5842099, -4.735118, 1, 1, 1, 1, 1,
-0.4373903, -1.156509, -2.224776, 1, 1, 1, 1, 1,
-0.4357331, -2.313235, -2.71361, 1, 1, 1, 1, 1,
-0.4350561, 0.8353235, -0.187365, 1, 1, 1, 1, 1,
-0.4326365, 0.7760949, -1.817875, 1, 1, 1, 1, 1,
-0.4317809, -0.355266, -1.271018, 1, 1, 1, 1, 1,
-0.4298913, 0.352621, -3.991986, 1, 1, 1, 1, 1,
-0.4286934, -0.7755848, -3.285907, 1, 1, 1, 1, 1,
-0.4281144, -0.1602185, -0.994309, 1, 1, 1, 1, 1,
-0.4273159, -0.2825921, -2.117119, 1, 1, 1, 1, 1,
-0.4265945, -0.4752861, -3.854156, 1, 1, 1, 1, 1,
-0.4254287, 0.2228688, -2.595234, 1, 1, 1, 1, 1,
-0.4249364, 0.8473717, -1.17539, 1, 1, 1, 1, 1,
-0.4170199, 0.5750533, -0.6139715, 1, 1, 1, 1, 1,
-0.4141823, 0.4841297, -0.727782, 1, 1, 1, 1, 1,
-0.4125682, 0.8663674, 1.44432, 0, 0, 1, 1, 1,
-0.4091009, -0.6371436, -3.837036, 1, 0, 0, 1, 1,
-0.4060077, -0.3676946, -1.095802, 1, 0, 0, 1, 1,
-0.4058678, 1.046196, 0.54199, 1, 0, 0, 1, 1,
-0.3997101, 0.1921488, -1.035292, 1, 0, 0, 1, 1,
-0.3966367, -0.4011753, -4.149122, 1, 0, 0, 1, 1,
-0.3914933, 0.5515084, 0.8380324, 0, 0, 0, 1, 1,
-0.3912418, 0.08204315, -1.369507, 0, 0, 0, 1, 1,
-0.3908546, -1.828817, -2.90162, 0, 0, 0, 1, 1,
-0.3870033, -1.184553, -2.585158, 0, 0, 0, 1, 1,
-0.3848595, 1.586171, 0.1705074, 0, 0, 0, 1, 1,
-0.3833672, -2.66572, -3.34012, 0, 0, 0, 1, 1,
-0.3822516, -1.402649, -5.080341, 0, 0, 0, 1, 1,
-0.3804846, -2.515859, -2.77989, 1, 1, 1, 1, 1,
-0.3773817, 2.404892, -0.241753, 1, 1, 1, 1, 1,
-0.376273, -0.6761305, -3.846031, 1, 1, 1, 1, 1,
-0.3749565, -1.791205, -3.613698, 1, 1, 1, 1, 1,
-0.3745346, -0.4345579, -0.7912186, 1, 1, 1, 1, 1,
-0.370044, 0.4463505, -2.848797, 1, 1, 1, 1, 1,
-0.366979, -0.9345376, -3.692379, 1, 1, 1, 1, 1,
-0.3639054, -1.47837, -2.589671, 1, 1, 1, 1, 1,
-0.3588673, -1.176306, -3.836233, 1, 1, 1, 1, 1,
-0.3518511, -0.4586121, -2.983315, 1, 1, 1, 1, 1,
-0.3518104, 0.8287984, -0.1485956, 1, 1, 1, 1, 1,
-0.3482462, 0.01641842, -3.379586, 1, 1, 1, 1, 1,
-0.3447205, -1.267753, -0.8826666, 1, 1, 1, 1, 1,
-0.3441224, 0.7444907, 0.1635311, 1, 1, 1, 1, 1,
-0.3439834, -1.148012, -1.798776, 1, 1, 1, 1, 1,
-0.3420154, 1.126835, 0.8093952, 0, 0, 1, 1, 1,
-0.3407275, 0.06245715, -1.777449, 1, 0, 0, 1, 1,
-0.3405058, 1.138472, -1.751799, 1, 0, 0, 1, 1,
-0.3391009, -0.7307353, -2.117829, 1, 0, 0, 1, 1,
-0.3336606, 1.675751, 1.122033, 1, 0, 0, 1, 1,
-0.3324317, -1.878393, -3.959439, 1, 0, 0, 1, 1,
-0.3306014, -0.1975061, -4.182022, 0, 0, 0, 1, 1,
-0.3291554, -0.78069, -2.757324, 0, 0, 0, 1, 1,
-0.3281874, -0.7586038, -2.650635, 0, 0, 0, 1, 1,
-0.3278534, 0.41701, -0.6770573, 0, 0, 0, 1, 1,
-0.326288, 0.1423449, -2.140841, 0, 0, 0, 1, 1,
-0.3214209, -1.30626, -2.717364, 0, 0, 0, 1, 1,
-0.3211944, -1.808107, -3.699465, 0, 0, 0, 1, 1,
-0.3185998, -0.1535718, -3.079219, 1, 1, 1, 1, 1,
-0.3156276, 0.1215897, -1.473733, 1, 1, 1, 1, 1,
-0.3145974, -1.31124, -0.9113842, 1, 1, 1, 1, 1,
-0.3102381, -1.128565, -2.099054, 1, 1, 1, 1, 1,
-0.3027695, 0.3187355, 1.358822, 1, 1, 1, 1, 1,
-0.3026386, -0.548511, -1.114956, 1, 1, 1, 1, 1,
-0.2994573, 1.690027, 0.09279924, 1, 1, 1, 1, 1,
-0.2973812, 1.488787, -2.265604, 1, 1, 1, 1, 1,
-0.2918856, 1.207129, -0.4864373, 1, 1, 1, 1, 1,
-0.2879445, -0.5682489, -2.767539, 1, 1, 1, 1, 1,
-0.2876789, 0.06123739, -0.4609025, 1, 1, 1, 1, 1,
-0.2842506, -1.007462, -4.178946, 1, 1, 1, 1, 1,
-0.2831115, 0.01997072, -1.454336, 1, 1, 1, 1, 1,
-0.2778888, 0.6854053, -0.4418048, 1, 1, 1, 1, 1,
-0.2727836, 0.02921308, -1.445994, 1, 1, 1, 1, 1,
-0.2674055, 1.250151, -0.9097294, 0, 0, 1, 1, 1,
-0.2671096, 0.5072623, -0.5629752, 1, 0, 0, 1, 1,
-0.2669155, 1.686661, -1.290785, 1, 0, 0, 1, 1,
-0.2598476, 0.3969127, -1.514838, 1, 0, 0, 1, 1,
-0.2572147, 0.6448254, 0.373627, 1, 0, 0, 1, 1,
-0.2523948, -1.916086, -3.552594, 1, 0, 0, 1, 1,
-0.2508085, 2.609292, 1.232985, 0, 0, 0, 1, 1,
-0.2506629, -0.04218332, -0.9789917, 0, 0, 0, 1, 1,
-0.2454981, 0.6392012, -0.6443186, 0, 0, 0, 1, 1,
-0.241744, -1.336824, -3.407566, 0, 0, 0, 1, 1,
-0.2411568, -0.327557, -3.028044, 0, 0, 0, 1, 1,
-0.2377367, 0.4060721, 0.2837898, 0, 0, 0, 1, 1,
-0.2353933, 1.009074, 0.2213983, 0, 0, 0, 1, 1,
-0.234469, 0.2192835, -1.726316, 1, 1, 1, 1, 1,
-0.2336907, -0.0632743, -2.527809, 1, 1, 1, 1, 1,
-0.2335213, -0.7158721, -2.199247, 1, 1, 1, 1, 1,
-0.2328973, 2.051388, -0.5776891, 1, 1, 1, 1, 1,
-0.2301143, -2.259303, -1.781419, 1, 1, 1, 1, 1,
-0.2171861, -0.2316801, -3.116429, 1, 1, 1, 1, 1,
-0.2161975, -0.5134109, -2.492668, 1, 1, 1, 1, 1,
-0.2158878, 0.3995743, -0.01443395, 1, 1, 1, 1, 1,
-0.2142664, -2.379833, -1.918161, 1, 1, 1, 1, 1,
-0.2131846, -1.3057, -5.040732, 1, 1, 1, 1, 1,
-0.2119983, -0.5877187, -1.235456, 1, 1, 1, 1, 1,
-0.2110841, 0.4307736, -1.133108, 1, 1, 1, 1, 1,
-0.210085, 1.046808, -0.5258576, 1, 1, 1, 1, 1,
-0.2092337, 0.06037485, -1.706138, 1, 1, 1, 1, 1,
-0.207633, 0.3057059, -0.1219403, 1, 1, 1, 1, 1,
-0.2074009, 0.2939678, 0.614764, 0, 0, 1, 1, 1,
-0.2042597, -0.1829269, -2.062844, 1, 0, 0, 1, 1,
-0.2017519, -1.055331, -2.243919, 1, 0, 0, 1, 1,
-0.2000087, -1.07334, -3.401734, 1, 0, 0, 1, 1,
-0.1997115, -1.651012, -4.01189, 1, 0, 0, 1, 1,
-0.1996862, 1.414963, 0.9862577, 1, 0, 0, 1, 1,
-0.1995884, 0.0651755, -1.524513, 0, 0, 0, 1, 1,
-0.196766, 0.3267457, -2.096473, 0, 0, 0, 1, 1,
-0.1930007, -0.05415871, -3.299962, 0, 0, 0, 1, 1,
-0.1921065, -1.275937, -4.053895, 0, 0, 0, 1, 1,
-0.1918766, 1.663031, 0.6453533, 0, 0, 0, 1, 1,
-0.1841865, 0.9400679, 0.6948559, 0, 0, 0, 1, 1,
-0.1795534, 0.5408822, -1.287132, 0, 0, 0, 1, 1,
-0.1788695, -0.5907944, -2.096956, 1, 1, 1, 1, 1,
-0.1775732, -0.04637146, -1.495016, 1, 1, 1, 1, 1,
-0.1773203, 0.4520526, 0.4736671, 1, 1, 1, 1, 1,
-0.173535, 0.3108672, 0.5297677, 1, 1, 1, 1, 1,
-0.171397, 1.448762, 1.145423, 1, 1, 1, 1, 1,
-0.1684839, 1.199542, 0.6676468, 1, 1, 1, 1, 1,
-0.1616699, 0.4565707, -0.4604965, 1, 1, 1, 1, 1,
-0.1608603, -0.1999459, -2.890019, 1, 1, 1, 1, 1,
-0.1502832, -0.2232845, -4.056444, 1, 1, 1, 1, 1,
-0.1440981, -0.724817, -3.246761, 1, 1, 1, 1, 1,
-0.1373951, 0.3754682, 0.4455468, 1, 1, 1, 1, 1,
-0.1321787, 1.100523, 0.3219337, 1, 1, 1, 1, 1,
-0.1300306, 0.1846316, 0.3560554, 1, 1, 1, 1, 1,
-0.1276782, -0.193517, -3.877189, 1, 1, 1, 1, 1,
-0.127308, -0.6306635, -3.04634, 1, 1, 1, 1, 1,
-0.123117, 1.061537, -1.971482, 0, 0, 1, 1, 1,
-0.1193851, -0.254399, -1.840191, 1, 0, 0, 1, 1,
-0.1170108, -0.03725374, -1.871075, 1, 0, 0, 1, 1,
-0.116127, -0.1187186, -1.236215, 1, 0, 0, 1, 1,
-0.1154428, -0.1170738, -1.880687, 1, 0, 0, 1, 1,
-0.1140178, 0.06266265, 0.3799698, 1, 0, 0, 1, 1,
-0.1113363, 0.6956426, 1.541082, 0, 0, 0, 1, 1,
-0.1111359, -1.618795, -3.02893, 0, 0, 0, 1, 1,
-0.1029986, -1.797631, -2.844907, 0, 0, 0, 1, 1,
-0.1005767, -1.057315, -2.271632, 0, 0, 0, 1, 1,
-0.09808512, 1.06587, -0.08546923, 0, 0, 0, 1, 1,
-0.09794641, 0.2367255, -0.887399, 0, 0, 0, 1, 1,
-0.09590302, 0.1006612, -1.001688, 0, 0, 0, 1, 1,
-0.09517739, 0.8044617, 0.6056752, 1, 1, 1, 1, 1,
-0.09492582, 0.7252761, 0.9748346, 1, 1, 1, 1, 1,
-0.09452862, -1.208578, -4.05498, 1, 1, 1, 1, 1,
-0.08808863, -0.9748027, -2.766807, 1, 1, 1, 1, 1,
-0.08780329, 1.515846, 1.15706, 1, 1, 1, 1, 1,
-0.08647671, -0.8487068, -4.235647, 1, 1, 1, 1, 1,
-0.0861192, 1.212521, -1.622984, 1, 1, 1, 1, 1,
-0.08070691, 1.260196, 1.761039, 1, 1, 1, 1, 1,
-0.07947897, -0.9143031, -2.714765, 1, 1, 1, 1, 1,
-0.07728904, -0.2114079, -0.7918041, 1, 1, 1, 1, 1,
-0.07500801, 0.8852625, -0.1618587, 1, 1, 1, 1, 1,
-0.07432485, -0.1871828, -2.209368, 1, 1, 1, 1, 1,
-0.07395467, -1.015158, -2.452187, 1, 1, 1, 1, 1,
-0.07326704, 0.4022959, -1.497378, 1, 1, 1, 1, 1,
-0.07221991, -0.03421703, -1.456077, 1, 1, 1, 1, 1,
-0.07193688, 0.2254013, 0.2417129, 0, 0, 1, 1, 1,
-0.07135197, 0.4512278, 0.5895796, 1, 0, 0, 1, 1,
-0.07078165, 0.1985941, 0.4665782, 1, 0, 0, 1, 1,
-0.07054959, 0.05043016, -1.663083, 1, 0, 0, 1, 1,
-0.06927128, -0.7503103, -1.702703, 1, 0, 0, 1, 1,
-0.06755992, 0.2201955, 0.613295, 1, 0, 0, 1, 1,
-0.06354877, -0.4544736, -2.428391, 0, 0, 0, 1, 1,
-0.05224476, 0.125781, -1.67308, 0, 0, 0, 1, 1,
-0.04635711, 0.2779774, 0.7373565, 0, 0, 0, 1, 1,
-0.04071827, 0.05432048, 0.1317931, 0, 0, 0, 1, 1,
-0.03165151, -0.5462734, -3.12946, 0, 0, 0, 1, 1,
-0.03083559, 0.6166973, 0.04190848, 0, 0, 0, 1, 1,
-0.02658241, -0.09120864, -3.563323, 0, 0, 0, 1, 1,
-0.02416565, 0.3345776, 0.7826049, 1, 1, 1, 1, 1,
-0.01516899, -1.318542, -3.624095, 1, 1, 1, 1, 1,
-0.005646589, 0.3161156, 0.5792373, 1, 1, 1, 1, 1,
0.002604909, -0.9436947, 1.810615, 1, 1, 1, 1, 1,
0.002609387, -0.8329898, 3.090219, 1, 1, 1, 1, 1,
0.002957602, -1.225388, 2.068556, 1, 1, 1, 1, 1,
0.003258754, 0.072389, -0.0257999, 1, 1, 1, 1, 1,
0.006540108, -0.3201134, 2.066242, 1, 1, 1, 1, 1,
0.006869368, 1.424904, -1.110263, 1, 1, 1, 1, 1,
0.01146123, 1.3801, -0.6050889, 1, 1, 1, 1, 1,
0.01291246, -1.103032, 3.577087, 1, 1, 1, 1, 1,
0.01483741, 0.8800251, -0.2038549, 1, 1, 1, 1, 1,
0.01521228, -0.4729726, 3.728571, 1, 1, 1, 1, 1,
0.01891009, -0.8743445, 3.050552, 1, 1, 1, 1, 1,
0.02050526, -1.214209, 3.110991, 1, 1, 1, 1, 1,
0.02373441, -0.7130238, 3.681606, 0, 0, 1, 1, 1,
0.02399273, 0.3220226, 0.4782787, 1, 0, 0, 1, 1,
0.02607562, 0.3390682, -0.7055983, 1, 0, 0, 1, 1,
0.03147882, 0.8136026, -1.016365, 1, 0, 0, 1, 1,
0.03282639, 1.356705, -0.4954337, 1, 0, 0, 1, 1,
0.03403221, 0.6531314, -0.02958404, 1, 0, 0, 1, 1,
0.04282389, 0.04157319, 2.322535, 0, 0, 0, 1, 1,
0.04313477, 2.254433, -1.466181, 0, 0, 0, 1, 1,
0.0560238, -0.7173, 2.898391, 0, 0, 0, 1, 1,
0.05796765, 1.802954, 0.09779264, 0, 0, 0, 1, 1,
0.05840549, 0.1572863, 0.2997082, 0, 0, 0, 1, 1,
0.06098826, -0.8136135, 3.720213, 0, 0, 0, 1, 1,
0.06160539, 0.2235112, -0.1367005, 0, 0, 0, 1, 1,
0.06282602, 1.063837, -0.8291882, 1, 1, 1, 1, 1,
0.06362064, -1.230728, 2.860783, 1, 1, 1, 1, 1,
0.06952853, 0.3114522, -1.035615, 1, 1, 1, 1, 1,
0.07219064, -0.9570453, 3.658435, 1, 1, 1, 1, 1,
0.08076991, 0.3987195, -0.2401836, 1, 1, 1, 1, 1,
0.0843259, -0.3892378, 3.321381, 1, 1, 1, 1, 1,
0.08617702, -1.158082, 3.665846, 1, 1, 1, 1, 1,
0.09214883, 0.2902288, 0.3410574, 1, 1, 1, 1, 1,
0.09284428, -1.287657, 4.065033, 1, 1, 1, 1, 1,
0.09369594, -1.337111, 1.330599, 1, 1, 1, 1, 1,
0.09684066, -0.326772, 2.269674, 1, 1, 1, 1, 1,
0.09702199, 0.4676252, 0.7328091, 1, 1, 1, 1, 1,
0.09729181, -2.082193, 2.366781, 1, 1, 1, 1, 1,
0.09878944, 0.3721159, 2.650846, 1, 1, 1, 1, 1,
0.09912852, 0.5648429, -0.6538585, 1, 1, 1, 1, 1,
0.102946, -0.09437704, 2.91593, 0, 0, 1, 1, 1,
0.1077963, 0.8150535, -0.449342, 1, 0, 0, 1, 1,
0.1202455, -1.197837, 4.745093, 1, 0, 0, 1, 1,
0.1207117, 0.3950771, 0.6409508, 1, 0, 0, 1, 1,
0.1276186, 0.770624, 0.6545924, 1, 0, 0, 1, 1,
0.1290742, -1.945932, 2.977877, 1, 0, 0, 1, 1,
0.1304839, 0.2595186, 0.8760687, 0, 0, 0, 1, 1,
0.1325479, 0.09994319, 0.8207742, 0, 0, 0, 1, 1,
0.133442, 1.249606, 1.365017, 0, 0, 0, 1, 1,
0.1362443, -0.07935442, 3.513643, 0, 0, 0, 1, 1,
0.1403336, -1.139695, 3.137355, 0, 0, 0, 1, 1,
0.1423705, -1.600491, 3.347868, 0, 0, 0, 1, 1,
0.1436288, 0.9490153, -0.4538402, 0, 0, 0, 1, 1,
0.1491846, 1.101727, -0.1682912, 1, 1, 1, 1, 1,
0.1498699, -0.8483841, 1.169486, 1, 1, 1, 1, 1,
0.1514415, 1.316463, -1.258793, 1, 1, 1, 1, 1,
0.1558263, 0.2133825, 0.7590035, 1, 1, 1, 1, 1,
0.1584932, -1.023871, 2.566006, 1, 1, 1, 1, 1,
0.16137, 0.8419835, 1.356635, 1, 1, 1, 1, 1,
0.1614532, 0.2172062, 2.413198, 1, 1, 1, 1, 1,
0.1623264, -1.3176, 2.220721, 1, 1, 1, 1, 1,
0.1634512, -0.8810557, 1.645338, 1, 1, 1, 1, 1,
0.1634637, 1.282157, 2.389897, 1, 1, 1, 1, 1,
0.1667254, -1.423122, 3.034695, 1, 1, 1, 1, 1,
0.1694645, 1.422474, 0.8981912, 1, 1, 1, 1, 1,
0.1704077, 0.2380683, 0.2870226, 1, 1, 1, 1, 1,
0.1705865, -0.08234245, 2.694208, 1, 1, 1, 1, 1,
0.1723711, 0.706122, -0.8325988, 1, 1, 1, 1, 1,
0.178175, 1.217255, 0.1509125, 0, 0, 1, 1, 1,
0.1806671, 0.5793761, 1.748536, 1, 0, 0, 1, 1,
0.185122, 0.2627848, 0.402596, 1, 0, 0, 1, 1,
0.1902516, -0.3719863, 2.290351, 1, 0, 0, 1, 1,
0.1963773, 1.342207, -0.1800009, 1, 0, 0, 1, 1,
0.1993718, 0.6448936, -0.2559284, 1, 0, 0, 1, 1,
0.2052554, 1.580359, -0.6223589, 0, 0, 0, 1, 1,
0.2073131, 1.917537, -1.01087, 0, 0, 0, 1, 1,
0.2092206, -0.4075671, 0.8610731, 0, 0, 0, 1, 1,
0.2229635, -0.03358803, 0.5890098, 0, 0, 0, 1, 1,
0.2262398, 0.7286058, -1.847415, 0, 0, 0, 1, 1,
0.2393868, 1.199398, 0.1064694, 0, 0, 0, 1, 1,
0.2431024, -0.8095934, 3.596233, 0, 0, 0, 1, 1,
0.2484474, 1.201996, 0.02937404, 1, 1, 1, 1, 1,
0.2498603, -1.485491, 5.472129, 1, 1, 1, 1, 1,
0.2614766, -2.31883, 4.546719, 1, 1, 1, 1, 1,
0.2637812, 1.232025, 0.2868813, 1, 1, 1, 1, 1,
0.2657444, -0.3993208, 1.803335, 1, 1, 1, 1, 1,
0.2662106, -0.7520702, 3.474115, 1, 1, 1, 1, 1,
0.2722593, 0.607601, 0.1173668, 1, 1, 1, 1, 1,
0.2729551, 2.510059, -0.6443467, 1, 1, 1, 1, 1,
0.2771216, 0.2255229, 0.5521343, 1, 1, 1, 1, 1,
0.2812794, -0.8679649, 1.894336, 1, 1, 1, 1, 1,
0.2843995, 1.167087, 0.4604915, 1, 1, 1, 1, 1,
0.2869789, -0.7903872, 3.356116, 1, 1, 1, 1, 1,
0.2870938, 1.780765, -0.1580395, 1, 1, 1, 1, 1,
0.2881374, 0.937534, -1.164807, 1, 1, 1, 1, 1,
0.2887643, -0.197262, 1.373532, 1, 1, 1, 1, 1,
0.2945709, -0.06937562, 2.380951, 0, 0, 1, 1, 1,
0.2964702, -1.178363, 2.129742, 1, 0, 0, 1, 1,
0.2989406, -0.1420379, 1.908739, 1, 0, 0, 1, 1,
0.3008467, -0.8276787, 1.311945, 1, 0, 0, 1, 1,
0.3032958, 0.8643752, -1.6949, 1, 0, 0, 1, 1,
0.3059877, 0.708391, 0.9397168, 1, 0, 0, 1, 1,
0.3107303, -1.313462, 2.423927, 0, 0, 0, 1, 1,
0.3130503, -0.4872424, 2.147666, 0, 0, 0, 1, 1,
0.3132436, -1.092763, 1.987922, 0, 0, 0, 1, 1,
0.3164639, 1.537077, 1.436183, 0, 0, 0, 1, 1,
0.3188354, -1.259287, 2.304989, 0, 0, 0, 1, 1,
0.320401, -0.3876518, 0.4296173, 0, 0, 0, 1, 1,
0.3288988, 0.5869098, -0.1728993, 0, 0, 0, 1, 1,
0.3329583, 0.8397414, 0.8727838, 1, 1, 1, 1, 1,
0.3330763, 0.1349344, 2.091831, 1, 1, 1, 1, 1,
0.333326, -0.2787169, 1.733975, 1, 1, 1, 1, 1,
0.334657, -1.686523, 3.539194, 1, 1, 1, 1, 1,
0.3359463, -0.9581305, 2.990456, 1, 1, 1, 1, 1,
0.3404227, -0.8781731, 1.852173, 1, 1, 1, 1, 1,
0.3532763, 0.01450943, 0.4287521, 1, 1, 1, 1, 1,
0.3536269, -0.360307, 2.794169, 1, 1, 1, 1, 1,
0.3544101, -0.3084159, 2.879017, 1, 1, 1, 1, 1,
0.3564075, -1.078577, 1.60086, 1, 1, 1, 1, 1,
0.3632946, 0.9403486, 1.877372, 1, 1, 1, 1, 1,
0.3637036, -0.127947, 1.08728, 1, 1, 1, 1, 1,
0.3649164, -0.3369566, 2.150158, 1, 1, 1, 1, 1,
0.3667638, -0.6971415, 2.012553, 1, 1, 1, 1, 1,
0.3685369, 0.4610257, 2.310443, 1, 1, 1, 1, 1,
0.3741992, -1.029297, 0.7720718, 0, 0, 1, 1, 1,
0.3749622, 1.123255, -1.640516, 1, 0, 0, 1, 1,
0.3762362, -0.9159462, 3.659923, 1, 0, 0, 1, 1,
0.3789367, -0.03468885, 1.504736, 1, 0, 0, 1, 1,
0.3807982, -0.4979102, 3.005343, 1, 0, 0, 1, 1,
0.3847326, 0.1978198, 0.6940715, 1, 0, 0, 1, 1,
0.3917199, 0.5702405, 2.362168, 0, 0, 0, 1, 1,
0.4003517, -0.8777149, 3.147985, 0, 0, 0, 1, 1,
0.401619, 1.148754, 0.716631, 0, 0, 0, 1, 1,
0.4040581, -0.6324027, 2.36883, 0, 0, 0, 1, 1,
0.4127463, -0.8158906, 3.247211, 0, 0, 0, 1, 1,
0.4152575, 0.8127707, 0.2993609, 0, 0, 0, 1, 1,
0.4175041, 1.231051, 0.5315511, 0, 0, 0, 1, 1,
0.4183517, 0.5314642, -0.7738433, 1, 1, 1, 1, 1,
0.4184551, -0.2308225, 2.603997, 1, 1, 1, 1, 1,
0.4201428, -1.945358, 1.903118, 1, 1, 1, 1, 1,
0.4212045, 0.4706813, 0.2903642, 1, 1, 1, 1, 1,
0.4248765, 0.3534269, 1.84858, 1, 1, 1, 1, 1,
0.4250615, -0.3161681, 2.653284, 1, 1, 1, 1, 1,
0.4279286, 0.3394452, 0.9811838, 1, 1, 1, 1, 1,
0.4292442, -1.092721, 2.1656, 1, 1, 1, 1, 1,
0.4306827, 0.9585683, 0.7091339, 1, 1, 1, 1, 1,
0.4361737, -1.074483, 2.698681, 1, 1, 1, 1, 1,
0.4394524, -1.226607, 3.381073, 1, 1, 1, 1, 1,
0.441323, -1.408138, 2.759388, 1, 1, 1, 1, 1,
0.4421622, -1.303213, 3.687648, 1, 1, 1, 1, 1,
0.444708, -0.1708309, 4.248353, 1, 1, 1, 1, 1,
0.4501576, 0.04259026, 1.88559, 1, 1, 1, 1, 1,
0.4512183, -0.1503503, 1.340898, 0, 0, 1, 1, 1,
0.451603, -1.998863, 1.282237, 1, 0, 0, 1, 1,
0.4540577, -0.52541, 3.590008, 1, 0, 0, 1, 1,
0.4672297, -0.3855255, 3.4386, 1, 0, 0, 1, 1,
0.4686565, -0.7297638, 1.537262, 1, 0, 0, 1, 1,
0.4699998, 0.9954638, 0.5611638, 1, 0, 0, 1, 1,
0.4757191, 0.8581349, 1.191547, 0, 0, 0, 1, 1,
0.4759579, 0.5225562, 0.3259354, 0, 0, 0, 1, 1,
0.4799834, 0.3520192, 1.114208, 0, 0, 0, 1, 1,
0.4815693, 1.532338, 0.7554628, 0, 0, 0, 1, 1,
0.4839216, 1.387798, -0.3892395, 0, 0, 0, 1, 1,
0.4848795, 1.487831, 0.2176667, 0, 0, 0, 1, 1,
0.4865856, -1.617027, 3.803266, 0, 0, 0, 1, 1,
0.4901165, 0.4590635, 1.251119, 1, 1, 1, 1, 1,
0.4955166, -1.406242, 2.581267, 1, 1, 1, 1, 1,
0.4976979, -0.6763535, 1.631293, 1, 1, 1, 1, 1,
0.4983681, 1.21914, 0.1874089, 1, 1, 1, 1, 1,
0.5063034, 0.923545, 0.01945928, 1, 1, 1, 1, 1,
0.5065767, 0.8694978, -0.7147219, 1, 1, 1, 1, 1,
0.5066822, -0.7217569, 2.952872, 1, 1, 1, 1, 1,
0.5087516, -0.9825678, 3.841287, 1, 1, 1, 1, 1,
0.5205559, -0.8931418, 2.423249, 1, 1, 1, 1, 1,
0.527211, 0.9179473, -0.5587748, 1, 1, 1, 1, 1,
0.5279146, -1.546003, 2.244463, 1, 1, 1, 1, 1,
0.5279595, -0.2278955, 3.296477, 1, 1, 1, 1, 1,
0.5301892, -0.7921894, 3.358152, 1, 1, 1, 1, 1,
0.5350394, 0.2721364, 2.942987, 1, 1, 1, 1, 1,
0.5363411, -2.244698, 2.832666, 1, 1, 1, 1, 1,
0.5389325, -0.7243031, 2.59142, 0, 0, 1, 1, 1,
0.5401172, 0.1405964, 0.8872343, 1, 0, 0, 1, 1,
0.5441602, -0.3478471, 0.172388, 1, 0, 0, 1, 1,
0.5446125, 0.4453033, 0.7775155, 1, 0, 0, 1, 1,
0.5471774, 1.16977, 0.1063357, 1, 0, 0, 1, 1,
0.5536623, 0.3782289, 2.63254, 1, 0, 0, 1, 1,
0.565173, -0.0009713042, 1.911649, 0, 0, 0, 1, 1,
0.5687022, 1.954869, 0.4586357, 0, 0, 0, 1, 1,
0.5693312, 1.284474, 0.215389, 0, 0, 0, 1, 1,
0.5721205, 0.5930886, 0.03137904, 0, 0, 0, 1, 1,
0.5748959, 0.8203966, -1.179196, 0, 0, 0, 1, 1,
0.575397, -1.174977, 2.767274, 0, 0, 0, 1, 1,
0.5765393, -1.30124, 2.95118, 0, 0, 0, 1, 1,
0.5793164, 0.9883367, -1.686331, 1, 1, 1, 1, 1,
0.5795876, -0.6910894, 1.559405, 1, 1, 1, 1, 1,
0.5803463, 0.6323881, 1.892487, 1, 1, 1, 1, 1,
0.5839363, 1.51499, -0.2959682, 1, 1, 1, 1, 1,
0.5851296, 0.04934643, -0.3649165, 1, 1, 1, 1, 1,
0.5945172, -0.3220059, 2.216713, 1, 1, 1, 1, 1,
0.5947951, 0.3805301, 2.796979, 1, 1, 1, 1, 1,
0.5958278, -1.255425, 2.337311, 1, 1, 1, 1, 1,
0.5967768, -0.287606, 2.2891, 1, 1, 1, 1, 1,
0.5972832, 0.5708309, 0.02901868, 1, 1, 1, 1, 1,
0.5999447, -0.2411025, 2.862942, 1, 1, 1, 1, 1,
0.6023425, 0.4121624, 1.622048, 1, 1, 1, 1, 1,
0.6023709, -0.5381606, 1.810467, 1, 1, 1, 1, 1,
0.6026598, -1.854931, 3.084797, 1, 1, 1, 1, 1,
0.6075736, -1.25613, 1.071085, 1, 1, 1, 1, 1,
0.6115721, -0.7835851, 1.589525, 0, 0, 1, 1, 1,
0.6148143, -0.8115605, 3.140798, 1, 0, 0, 1, 1,
0.6178297, 1.825488, -1.255489, 1, 0, 0, 1, 1,
0.6196206, 0.8209992, 0.03608018, 1, 0, 0, 1, 1,
0.62963, 0.8159818, -0.9096169, 1, 0, 0, 1, 1,
0.630861, 0.4233231, 1.669914, 1, 0, 0, 1, 1,
0.6311103, 1.555786, 1.000011, 0, 0, 0, 1, 1,
0.6361613, 0.6911092, -1.100406, 0, 0, 0, 1, 1,
0.6398978, 1.056592, 2.351323, 0, 0, 0, 1, 1,
0.6538554, -1.750467, 3.660973, 0, 0, 0, 1, 1,
0.661476, 0.1726078, 0.9972035, 0, 0, 0, 1, 1,
0.6614988, -0.4376599, 2.413678, 0, 0, 0, 1, 1,
0.6636392, -0.4696703, 2.314504, 0, 0, 0, 1, 1,
0.6653158, 1.005692, 1.268591, 1, 1, 1, 1, 1,
0.6678271, -0.3914083, 2.220035, 1, 1, 1, 1, 1,
0.6702253, -0.4795949, 1.000122, 1, 1, 1, 1, 1,
0.6705896, -0.5343716, 4.018936, 1, 1, 1, 1, 1,
0.6713514, -1.671058, 1.644652, 1, 1, 1, 1, 1,
0.6716413, 0.4787341, 0.3701645, 1, 1, 1, 1, 1,
0.672282, -0.5086306, 0.9279138, 1, 1, 1, 1, 1,
0.6737127, 0.7094584, -0.4226085, 1, 1, 1, 1, 1,
0.6792812, 1.754266, 0.8283219, 1, 1, 1, 1, 1,
0.6793447, -0.5452694, 2.110174, 1, 1, 1, 1, 1,
0.6805449, -0.1503072, 3.269166, 1, 1, 1, 1, 1,
0.6845106, -1.057098, 3.333363, 1, 1, 1, 1, 1,
0.6895883, -1.469411, 2.047274, 1, 1, 1, 1, 1,
0.6945217, 0.6463124, 1.077187, 1, 1, 1, 1, 1,
0.6970751, -0.6933997, 3.70358, 1, 1, 1, 1, 1,
0.6998193, 0.1013881, 0.8761277, 0, 0, 1, 1, 1,
0.7102854, -1.038696, 4.026344, 1, 0, 0, 1, 1,
0.7106085, 1.472554, 1.778681, 1, 0, 0, 1, 1,
0.7127957, -0.5031983, 2.541994, 1, 0, 0, 1, 1,
0.7129078, -0.495515, 1.753839, 1, 0, 0, 1, 1,
0.7146305, 0.1082989, 2.444077, 1, 0, 0, 1, 1,
0.715668, 0.994432, 2.050524, 0, 0, 0, 1, 1,
0.721154, 0.05563942, 1.49039, 0, 0, 0, 1, 1,
0.7256423, -0.1105952, 0.6693072, 0, 0, 0, 1, 1,
0.7270879, 0.2328435, 1.254928, 0, 0, 0, 1, 1,
0.7314574, 1.847227, -0.02369598, 0, 0, 0, 1, 1,
0.7322189, 0.09695272, 2.395778, 0, 0, 0, 1, 1,
0.7325073, -0.7436085, 1.711414, 0, 0, 0, 1, 1,
0.7331171, -0.8288579, 1.662466, 1, 1, 1, 1, 1,
0.7420464, 0.06450895, 1.813423, 1, 1, 1, 1, 1,
0.7479244, -0.3385581, 1.791659, 1, 1, 1, 1, 1,
0.7500368, 0.02405513, 2.429057, 1, 1, 1, 1, 1,
0.7527984, 0.6536735, 0.7877327, 1, 1, 1, 1, 1,
0.7597827, 1.454052, 1.157818, 1, 1, 1, 1, 1,
0.7656137, -0.8359609, 1.966502, 1, 1, 1, 1, 1,
0.7676504, 0.9577661, -0.03211345, 1, 1, 1, 1, 1,
0.7713809, -0.03279936, 1.432299, 1, 1, 1, 1, 1,
0.7768875, 1.746408, -0.8033057, 1, 1, 1, 1, 1,
0.7795611, 0.6450484, 0.8316805, 1, 1, 1, 1, 1,
0.7950685, 1.770441, 0.3761528, 1, 1, 1, 1, 1,
0.7984338, 1.146973, 1.465168, 1, 1, 1, 1, 1,
0.802159, 0.1775028, 1.151075, 1, 1, 1, 1, 1,
0.8130831, 1.413638, 0.5808082, 1, 1, 1, 1, 1,
0.8160315, -1.873509, 2.388516, 0, 0, 1, 1, 1,
0.818312, 0.7363126, -0.5322509, 1, 0, 0, 1, 1,
0.8222672, 0.5349703, -0.02867211, 1, 0, 0, 1, 1,
0.8241884, 0.2768458, 3.651126, 1, 0, 0, 1, 1,
0.8280464, -0.2451264, 0.4417045, 1, 0, 0, 1, 1,
0.8282608, 1.292793, 0.9625823, 1, 0, 0, 1, 1,
0.8299872, 0.7097083, 1.316663, 0, 0, 0, 1, 1,
0.8305664, 1.402427, 3.052261, 0, 0, 0, 1, 1,
0.8317468, -0.3202688, 0.2487205, 0, 0, 0, 1, 1,
0.8324919, 0.7579814, 1.17616, 0, 0, 0, 1, 1,
0.8362952, -1.774556, 4.488211, 0, 0, 0, 1, 1,
0.8380189, 0.6496608, 0.4790219, 0, 0, 0, 1, 1,
0.8459422, -0.02184353, 2.962669, 0, 0, 0, 1, 1,
0.8506127, 0.1205525, 1.154106, 1, 1, 1, 1, 1,
0.8515289, 0.3323635, 2.411002, 1, 1, 1, 1, 1,
0.8522838, -2.002602, 2.854229, 1, 1, 1, 1, 1,
0.8527772, -1.174211, 3.308631, 1, 1, 1, 1, 1,
0.858536, -1.30319, 3.156867, 1, 1, 1, 1, 1,
0.8587432, 0.06007363, 1.889408, 1, 1, 1, 1, 1,
0.8592521, -0.6438425, 1.454431, 1, 1, 1, 1, 1,
0.8619117, 0.3867988, 1.321078, 1, 1, 1, 1, 1,
0.8631347, -1.290194, 2.051982, 1, 1, 1, 1, 1,
0.8712604, -0.4018051, 1.975512, 1, 1, 1, 1, 1,
0.875063, -0.6917161, 3.182959, 1, 1, 1, 1, 1,
0.8758267, -1.934475, 1.663016, 1, 1, 1, 1, 1,
0.8773107, 0.1808966, 1.438377, 1, 1, 1, 1, 1,
0.8797247, -0.2279219, 2.364045, 1, 1, 1, 1, 1,
0.8812404, 1.175135, 1.367492, 1, 1, 1, 1, 1,
0.8834832, -0.4779709, 1.406298, 0, 0, 1, 1, 1,
0.8860688, 0.9988909, 1.53358, 1, 0, 0, 1, 1,
0.8916039, -0.04629651, 0.6514693, 1, 0, 0, 1, 1,
0.892647, -0.1706904, 0.6822857, 1, 0, 0, 1, 1,
0.8948216, -0.1356652, 0.1328229, 1, 0, 0, 1, 1,
0.9008377, -0.388333, 2.15049, 1, 0, 0, 1, 1,
0.9052945, -1.098187, -0.2243974, 0, 0, 0, 1, 1,
0.9066274, -0.3713354, 3.430732, 0, 0, 0, 1, 1,
0.9079421, -0.04272655, 2.061704, 0, 0, 0, 1, 1,
0.9143078, 0.8060817, 1.71725, 0, 0, 0, 1, 1,
0.9157771, -0.5183173, 1.738855, 0, 0, 0, 1, 1,
0.9226674, 0.4633848, 0.7375648, 0, 0, 0, 1, 1,
0.9233032, 0.3456059, 0.3566089, 0, 0, 0, 1, 1,
0.9249144, 0.8897859, -1.646457, 1, 1, 1, 1, 1,
0.9257247, 0.8794438, 2.832119, 1, 1, 1, 1, 1,
0.9317232, -0.3216399, 2.785419, 1, 1, 1, 1, 1,
0.9351151, -0.4388278, 2.405371, 1, 1, 1, 1, 1,
0.9355185, 0.7562358, 1.512688, 1, 1, 1, 1, 1,
0.9398395, -0.2350072, 1.720804, 1, 1, 1, 1, 1,
0.9423448, 1.190919, 1.344108, 1, 1, 1, 1, 1,
0.9436262, 1.31274, 0.7106636, 1, 1, 1, 1, 1,
0.9450284, -1.189203, 0.6752822, 1, 1, 1, 1, 1,
0.9487393, 1.062374, -0.2446781, 1, 1, 1, 1, 1,
0.9503143, -2.510328, 2.433787, 1, 1, 1, 1, 1,
0.9529161, -0.5521744, 2.607755, 1, 1, 1, 1, 1,
0.9532582, 0.6910024, 0.1703125, 1, 1, 1, 1, 1,
0.9534189, -0.5045043, 2.534347, 1, 1, 1, 1, 1,
0.9569493, -0.4142719, 2.557496, 1, 1, 1, 1, 1,
0.960439, 0.6428864, 2.044107, 0, 0, 1, 1, 1,
0.9629726, -1.256043, 0.9793195, 1, 0, 0, 1, 1,
0.9641015, -0.6466453, 3.183876, 1, 0, 0, 1, 1,
0.967356, -0.4296787, 2.650154, 1, 0, 0, 1, 1,
0.9695729, -0.4501319, 4.129038, 1, 0, 0, 1, 1,
0.976827, -0.01122104, 0.8262944, 1, 0, 0, 1, 1,
0.9784046, -0.9049088, 3.253381, 0, 0, 0, 1, 1,
0.9791646, -1.994122, 2.723754, 0, 0, 0, 1, 1,
0.9909629, -0.05396784, 1.498941, 0, 0, 0, 1, 1,
0.9912623, -0.9830484, 2.97313, 0, 0, 0, 1, 1,
0.9961048, -0.3929694, 1.579605, 0, 0, 0, 1, 1,
0.9970673, -0.007401886, 1.048419, 0, 0, 0, 1, 1,
0.9995395, -1.309859, 1.742713, 0, 0, 0, 1, 1,
1.021514, -0.9105192, 3.385859, 1, 1, 1, 1, 1,
1.022329, 2.109999, 1.183877, 1, 1, 1, 1, 1,
1.026317, 2.121953, -1.133239, 1, 1, 1, 1, 1,
1.026869, -0.1547192, 2.246467, 1, 1, 1, 1, 1,
1.027333, 1.27697, 1.134127, 1, 1, 1, 1, 1,
1.027577, 1.029564, -0.07943321, 1, 1, 1, 1, 1,
1.033111, 1.264504, 1.815452, 1, 1, 1, 1, 1,
1.041785, -0.1167733, 1.429822, 1, 1, 1, 1, 1,
1.042148, -0.8377007, 1.081636, 1, 1, 1, 1, 1,
1.047721, 0.5294379, 0.7696781, 1, 1, 1, 1, 1,
1.049431, -0.2501577, 1.755978, 1, 1, 1, 1, 1,
1.051939, -0.2792945, 0.6058628, 1, 1, 1, 1, 1,
1.05331, 0.2056719, 2.668393, 1, 1, 1, 1, 1,
1.054517, -0.05014635, 1.839115, 1, 1, 1, 1, 1,
1.057528, -0.4891933, 3.227988, 1, 1, 1, 1, 1,
1.065145, -0.3635087, 2.065941, 0, 0, 1, 1, 1,
1.078473, -0.3631671, 1.638012, 1, 0, 0, 1, 1,
1.084087, -0.04631663, 1.709135, 1, 0, 0, 1, 1,
1.084691, 1.501869, -0.7222941, 1, 0, 0, 1, 1,
1.085946, 2.795579, -0.3820463, 1, 0, 0, 1, 1,
1.088615, 0.9670318, -1.333341, 1, 0, 0, 1, 1,
1.09321, 0.5030852, 1.251707, 0, 0, 0, 1, 1,
1.093342, 0.2816615, 0.9828293, 0, 0, 0, 1, 1,
1.099429, -2.46803, 3.254966, 0, 0, 0, 1, 1,
1.099682, -0.6288414, 2.522595, 0, 0, 0, 1, 1,
1.105541, 0.3975677, 1.672889, 0, 0, 0, 1, 1,
1.109072, 0.4920122, 1.467955, 0, 0, 0, 1, 1,
1.118063, -0.4466024, 2.644408, 0, 0, 0, 1, 1,
1.131073, 1.191369, 0.432869, 1, 1, 1, 1, 1,
1.144244, 0.3273774, 0.9467066, 1, 1, 1, 1, 1,
1.17451, 0.1308261, 2.459959, 1, 1, 1, 1, 1,
1.174856, -0.4402016, 1.927578, 1, 1, 1, 1, 1,
1.182217, -1.344059, 1.42372, 1, 1, 1, 1, 1,
1.187523, -0.07510043, 1.359292, 1, 1, 1, 1, 1,
1.190889, -0.7931777, 2.139574, 1, 1, 1, 1, 1,
1.19179, -0.3227786, 2.39751, 1, 1, 1, 1, 1,
1.199688, -0.7838997, 2.178736, 1, 1, 1, 1, 1,
1.200548, -0.6122993, 2.597938, 1, 1, 1, 1, 1,
1.201886, 1.549143, 0.7724984, 1, 1, 1, 1, 1,
1.213571, -1.363661, 2.98475, 1, 1, 1, 1, 1,
1.219527, -0.3186591, 2.101948, 1, 1, 1, 1, 1,
1.220773, 1.231683, -0.06136673, 1, 1, 1, 1, 1,
1.22529, 0.3127604, -0.08362629, 1, 1, 1, 1, 1,
1.230305, -0.9312007, 2.279221, 0, 0, 1, 1, 1,
1.242219, 0.4009944, 1.088693, 1, 0, 0, 1, 1,
1.246408, 0.2745565, 0.6580047, 1, 0, 0, 1, 1,
1.260621, 0.7458801, 1.574744, 1, 0, 0, 1, 1,
1.262163, -0.9432304, 1.735927, 1, 0, 0, 1, 1,
1.271378, -0.4504614, 2.163381, 1, 0, 0, 1, 1,
1.28495, 0.03567219, 1.343062, 0, 0, 0, 1, 1,
1.286982, -0.8453199, 2.715209, 0, 0, 0, 1, 1,
1.297894, 1.069163, 0.6887063, 0, 0, 0, 1, 1,
1.306119, -1.912637, 0.8157325, 0, 0, 0, 1, 1,
1.319626, -0.3649969, 0.308392, 0, 0, 0, 1, 1,
1.330232, 0.9373395, 0.3602426, 0, 0, 0, 1, 1,
1.331156, -0.5317606, 2.26475, 0, 0, 0, 1, 1,
1.335793, 0.5334387, -1.488203, 1, 1, 1, 1, 1,
1.341533, -0.8523207, 1.508917, 1, 1, 1, 1, 1,
1.371284, 1.713983, 0.8347427, 1, 1, 1, 1, 1,
1.375502, 1.925825, 1.518327, 1, 1, 1, 1, 1,
1.383978, -0.1471682, 1.77314, 1, 1, 1, 1, 1,
1.391338, -1.266315, 0.5669217, 1, 1, 1, 1, 1,
1.396854, -0.7258201, 3.748867, 1, 1, 1, 1, 1,
1.401488, 0.9576174, 0.5266608, 1, 1, 1, 1, 1,
1.40215, -0.7532673, 1.040898, 1, 1, 1, 1, 1,
1.405356, 1.997588, 0.4723381, 1, 1, 1, 1, 1,
1.405549, 0.002878227, 1.745596, 1, 1, 1, 1, 1,
1.406785, -0.184202, 0.9374103, 1, 1, 1, 1, 1,
1.464168, 0.1269098, 1.697481, 1, 1, 1, 1, 1,
1.470319, -0.2115267, 0.4455044, 1, 1, 1, 1, 1,
1.471133, -0.4373131, 1.517386, 1, 1, 1, 1, 1,
1.473713, 0.8893754, -0.8163915, 0, 0, 1, 1, 1,
1.495564, -0.1784797, 1.574851, 1, 0, 0, 1, 1,
1.501526, 1.041982, 1.446869, 1, 0, 0, 1, 1,
1.501705, -0.02400607, 0.4498741, 1, 0, 0, 1, 1,
1.519611, 1.225615, 0.4921753, 1, 0, 0, 1, 1,
1.524403, -0.6294066, 2.820697, 1, 0, 0, 1, 1,
1.539095, -0.5193357, 3.660727, 0, 0, 0, 1, 1,
1.560316, 0.8193454, 1.690746, 0, 0, 0, 1, 1,
1.563358, -0.1630422, 1.769668, 0, 0, 0, 1, 1,
1.567792, 0.5038918, 2.34321, 0, 0, 0, 1, 1,
1.568072, 0.4626151, 1.169321, 0, 0, 0, 1, 1,
1.576583, 2.510296, 2.954528, 0, 0, 0, 1, 1,
1.590001, -2.09547, 4.168437, 0, 0, 0, 1, 1,
1.591396, -0.9067152, 2.138159, 1, 1, 1, 1, 1,
1.607599, 0.05994935, 0.7325693, 1, 1, 1, 1, 1,
1.609051, -0.4470426, 2.553488, 1, 1, 1, 1, 1,
1.614896, -1.835831, 1.810701, 1, 1, 1, 1, 1,
1.615424, -0.8041975, 2.334818, 1, 1, 1, 1, 1,
1.616325, -1.220071, 1.854591, 1, 1, 1, 1, 1,
1.618281, -0.2951343, 2.085267, 1, 1, 1, 1, 1,
1.622713, 0.8686081, 0.8100601, 1, 1, 1, 1, 1,
1.636162, -0.4371459, 3.168768, 1, 1, 1, 1, 1,
1.637737, -1.022183, 2.030932, 1, 1, 1, 1, 1,
1.647784, 0.2608587, 0.9620677, 1, 1, 1, 1, 1,
1.654378, -2.234629, 1.565369, 1, 1, 1, 1, 1,
1.661372, 0.9457105, 0.9398109, 1, 1, 1, 1, 1,
1.663368, -0.7131716, 1.443097, 1, 1, 1, 1, 1,
1.689034, -0.2416574, 2.289048, 1, 1, 1, 1, 1,
1.689633, -1.002993, 1.680103, 0, 0, 1, 1, 1,
1.700388, 1.081591, 0.4808875, 1, 0, 0, 1, 1,
1.705481, -0.4610684, 2.697268, 1, 0, 0, 1, 1,
1.731025, 0.09818139, 0.194962, 1, 0, 0, 1, 1,
1.74064, 0.7739407, 2.162537, 1, 0, 0, 1, 1,
1.748247, 1.865924, -0.5949326, 1, 0, 0, 1, 1,
1.770548, 0.2324634, 4.287036, 0, 0, 0, 1, 1,
1.777926, 0.3234154, 0.4493332, 0, 0, 0, 1, 1,
1.786334, 0.0700157, 1.700475, 0, 0, 0, 1, 1,
1.806583, -1.077003, 2.449975, 0, 0, 0, 1, 1,
1.809564, -0.3607484, 0.8235304, 0, 0, 0, 1, 1,
1.847408, -0.1143248, 0.2382099, 0, 0, 0, 1, 1,
1.894253, 0.05184548, 1.116624, 0, 0, 0, 1, 1,
1.902191, -0.8072512, 1.544931, 1, 1, 1, 1, 1,
1.90462, 0.07001267, 3.420299, 1, 1, 1, 1, 1,
1.918838, -0.4504423, 0.0224013, 1, 1, 1, 1, 1,
1.964881, -0.6080631, 2.241129, 1, 1, 1, 1, 1,
1.967434, 0.4049875, 1.302914, 1, 1, 1, 1, 1,
1.969757, 0.05143134, -0.167465, 1, 1, 1, 1, 1,
1.979746, -0.586512, 2.713346, 1, 1, 1, 1, 1,
1.995982, 0.2836951, 0.2785353, 1, 1, 1, 1, 1,
2.02408, -0.5579457, 3.151084, 1, 1, 1, 1, 1,
2.042746, 1.074736, -1.392844, 1, 1, 1, 1, 1,
2.043873, -0.3217287, 1.172041, 1, 1, 1, 1, 1,
2.071126, -0.5995333, 1.572178, 1, 1, 1, 1, 1,
2.076363, 1.858796, -0.1259715, 1, 1, 1, 1, 1,
2.087084, -0.08889015, 0.8375521, 1, 1, 1, 1, 1,
2.101626, -0.3913534, 2.064863, 1, 1, 1, 1, 1,
2.107139, -0.6340516, 0.8943085, 0, 0, 1, 1, 1,
2.13782, -0.3054719, 0.9001332, 1, 0, 0, 1, 1,
2.15983, -0.3215684, 1.436416, 1, 0, 0, 1, 1,
2.192609, -0.5607903, 0.1643984, 1, 0, 0, 1, 1,
2.247807, 1.633899, 1.967752, 1, 0, 0, 1, 1,
2.270839, -0.2056315, 2.392178, 1, 0, 0, 1, 1,
2.289378, -1.138727, 0.3969192, 0, 0, 0, 1, 1,
2.32981, -0.334102, -0.6041825, 0, 0, 0, 1, 1,
2.341173, -1.257751, 0.3825985, 0, 0, 0, 1, 1,
2.354609, -0.03452109, 1.61818, 0, 0, 0, 1, 1,
2.408478, 0.6470474, 0.7565403, 0, 0, 0, 1, 1,
2.41564, 0.3045555, 0.5657175, 0, 0, 0, 1, 1,
2.415771, -0.08881864, 1.715523, 0, 0, 0, 1, 1,
2.417575, -0.3006521, 1.897987, 1, 1, 1, 1, 1,
2.456, -2.402304, 1.802431, 1, 1, 1, 1, 1,
2.491881, 0.02439868, 1.725558, 1, 1, 1, 1, 1,
2.665933, 1.41258, 0.657191, 1, 1, 1, 1, 1,
2.848451, -1.331551, 2.950944, 1, 1, 1, 1, 1,
3.264384, -0.891, 1.440759, 1, 1, 1, 1, 1,
3.505794, -0.3989835, 3.106759, 1, 1, 1, 1, 1
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
var radius = 9.862816;
var distance = 34.64272;
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
mvMatrix.translate( 0.06209898, 0.6214435, -0.1902215 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64272);
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
