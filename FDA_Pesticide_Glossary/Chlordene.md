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
-3.614879, 0.04652413, -1.742955, 1, 0, 0, 1,
-3.363934, 2.505139, -2.561215, 1, 0.007843138, 0, 1,
-3.210672, -0.4029719, -3.852815, 1, 0.01176471, 0, 1,
-2.931067, 0.550813, -0.6965087, 1, 0.01960784, 0, 1,
-2.824228, -0.9935579, -4.085357, 1, 0.02352941, 0, 1,
-2.738941, 1.088971, -1.721082, 1, 0.03137255, 0, 1,
-2.593513, -0.3906981, -0.9257532, 1, 0.03529412, 0, 1,
-2.558525, -0.3083061, -2.005462, 1, 0.04313726, 0, 1,
-2.509269, -1.314999, -0.8606054, 1, 0.04705882, 0, 1,
-2.458286, 0.6736653, -2.599047, 1, 0.05490196, 0, 1,
-2.42692, -0.5708784, -1.861475, 1, 0.05882353, 0, 1,
-2.397806, -0.1304211, -2.040206, 1, 0.06666667, 0, 1,
-2.387976, 1.492763, 1.848365, 1, 0.07058824, 0, 1,
-2.376327, 1.311195, -1.614915, 1, 0.07843138, 0, 1,
-2.310747, 1.154751, -2.765709, 1, 0.08235294, 0, 1,
-2.300746, 0.9054782, -1.787724, 1, 0.09019608, 0, 1,
-2.147285, -0.4317749, -0.817415, 1, 0.09411765, 0, 1,
-2.136973, -0.5698743, -1.251054, 1, 0.1019608, 0, 1,
-2.128412, -0.0333804, -2.023336, 1, 0.1098039, 0, 1,
-2.065711, -1.470638, -0.9946567, 1, 0.1137255, 0, 1,
-2.041246, 0.05783855, -1.182024, 1, 0.1215686, 0, 1,
-2.038924, 0.1338823, -1.49805, 1, 0.1254902, 0, 1,
-2.035508, 0.3456577, -1.604689, 1, 0.1333333, 0, 1,
-2.03142, 1.758252, -1.002693, 1, 0.1372549, 0, 1,
-2.025422, -0.4006531, -1.582106, 1, 0.145098, 0, 1,
-2.005403, -0.9366661, -0.537925, 1, 0.1490196, 0, 1,
-2.001336, 0.390273, -1.50016, 1, 0.1568628, 0, 1,
-1.959307, 1.014219, -2.047967, 1, 0.1607843, 0, 1,
-1.958253, -1.129336, -1.527094, 1, 0.1686275, 0, 1,
-1.944173, -1.27431, -2.407391, 1, 0.172549, 0, 1,
-1.93989, 0.8183942, -0.08782095, 1, 0.1803922, 0, 1,
-1.904206, -0.1173232, -3.155166, 1, 0.1843137, 0, 1,
-1.895923, 0.1491401, -1.048766, 1, 0.1921569, 0, 1,
-1.886161, 0.5664833, -1.885129, 1, 0.1960784, 0, 1,
-1.865936, -1.771038, -3.183785, 1, 0.2039216, 0, 1,
-1.842305, 1.025206, -1.89582, 1, 0.2117647, 0, 1,
-1.839684, 0.3035074, -2.007727, 1, 0.2156863, 0, 1,
-1.819683, -1.89512, -2.504577, 1, 0.2235294, 0, 1,
-1.814338, 1.239752, -1.135458, 1, 0.227451, 0, 1,
-1.766532, -0.5391431, -1.955613, 1, 0.2352941, 0, 1,
-1.761488, -0.6705635, -3.733635, 1, 0.2392157, 0, 1,
-1.712279, -1.170459, -2.415645, 1, 0.2470588, 0, 1,
-1.711677, -0.1623501, -1.886634, 1, 0.2509804, 0, 1,
-1.675282, 0.06803198, 0.461746, 1, 0.2588235, 0, 1,
-1.654434, 1.422984, -1.550607, 1, 0.2627451, 0, 1,
-1.645046, 0.166118, -0.5665367, 1, 0.2705882, 0, 1,
-1.60168, -0.9004036, -1.684101, 1, 0.2745098, 0, 1,
-1.601306, 0.1254481, -1.521491, 1, 0.282353, 0, 1,
-1.5978, -1.793234, -5.157283, 1, 0.2862745, 0, 1,
-1.590467, 0.3331642, -0.1239479, 1, 0.2941177, 0, 1,
-1.58379, 1.005925, -0.5487034, 1, 0.3019608, 0, 1,
-1.574823, 0.2446782, -2.448204, 1, 0.3058824, 0, 1,
-1.573577, -0.4722146, -1.673416, 1, 0.3137255, 0, 1,
-1.573395, -1.07796, -2.522101, 1, 0.3176471, 0, 1,
-1.572878, 0.09862542, -3.258191, 1, 0.3254902, 0, 1,
-1.571019, -0.2533451, -1.888775, 1, 0.3294118, 0, 1,
-1.568265, 2.519955, 0.1413579, 1, 0.3372549, 0, 1,
-1.562669, -0.1299357, -0.9897984, 1, 0.3411765, 0, 1,
-1.556957, 1.121728, -0.5926172, 1, 0.3490196, 0, 1,
-1.551117, 1.040159, -0.07574574, 1, 0.3529412, 0, 1,
-1.55073, 1.418549, -2.204952, 1, 0.3607843, 0, 1,
-1.521801, -0.7750879, -1.434389, 1, 0.3647059, 0, 1,
-1.520587, 2.105806, -0.8269107, 1, 0.372549, 0, 1,
-1.516153, -1.874296, -2.273958, 1, 0.3764706, 0, 1,
-1.515831, -0.3744876, -0.04173234, 1, 0.3843137, 0, 1,
-1.5043, -0.8583683, -1.113985, 1, 0.3882353, 0, 1,
-1.50026, -0.8968763, -4.255484, 1, 0.3960784, 0, 1,
-1.497393, -0.7740675, -2.715716, 1, 0.4039216, 0, 1,
-1.496565, 0.6384476, -0.5363494, 1, 0.4078431, 0, 1,
-1.490595, 0.9896036, -0.8573785, 1, 0.4156863, 0, 1,
-1.478024, 0.6664767, -1.54425, 1, 0.4196078, 0, 1,
-1.474456, -0.04073139, -1.587257, 1, 0.427451, 0, 1,
-1.471545, 0.9176536, -0.239044, 1, 0.4313726, 0, 1,
-1.471459, -0.5148121, -0.7507874, 1, 0.4392157, 0, 1,
-1.470371, -0.7910275, -1.747951, 1, 0.4431373, 0, 1,
-1.465541, 1.510986, 0.7726241, 1, 0.4509804, 0, 1,
-1.462061, 1.111402, -0.7211934, 1, 0.454902, 0, 1,
-1.462013, 1.063137, 1.19861, 1, 0.4627451, 0, 1,
-1.455916, 1.441481, -1.497494, 1, 0.4666667, 0, 1,
-1.437629, -0.6118643, -2.149183, 1, 0.4745098, 0, 1,
-1.437076, -1.867489, -2.252789, 1, 0.4784314, 0, 1,
-1.43531, 0.1304646, -1.293504, 1, 0.4862745, 0, 1,
-1.432244, 0.2887662, -1.301658, 1, 0.4901961, 0, 1,
-1.432212, -0.4323456, 0.8000963, 1, 0.4980392, 0, 1,
-1.422736, -0.9100583, -1.148564, 1, 0.5058824, 0, 1,
-1.421271, 0.6925661, -1.084098, 1, 0.509804, 0, 1,
-1.418661, 1.285967, -1.168725, 1, 0.5176471, 0, 1,
-1.418571, 0.8169236, -1.358539, 1, 0.5215687, 0, 1,
-1.415297, -1.066542, -1.125872, 1, 0.5294118, 0, 1,
-1.411038, 1.210561, -1.406624, 1, 0.5333334, 0, 1,
-1.396859, -0.07406601, -0.8802374, 1, 0.5411765, 0, 1,
-1.392241, -1.121695, -3.020204, 1, 0.5450981, 0, 1,
-1.374788, -0.8939686, -1.594821, 1, 0.5529412, 0, 1,
-1.374539, 0.4825471, -1.490859, 1, 0.5568628, 0, 1,
-1.35904, -1.667881, -1.908404, 1, 0.5647059, 0, 1,
-1.355773, -2.052801, -2.869954, 1, 0.5686275, 0, 1,
-1.340584, 1.036087, -0.710849, 1, 0.5764706, 0, 1,
-1.328579, 0.7443584, -1.680757, 1, 0.5803922, 0, 1,
-1.328076, -0.2406836, -2.175642, 1, 0.5882353, 0, 1,
-1.323714, 0.3081696, -0.3596731, 1, 0.5921569, 0, 1,
-1.321308, 1.081725, -0.7597088, 1, 0.6, 0, 1,
-1.318267, -1.460257, -3.645899, 1, 0.6078432, 0, 1,
-1.317597, -1.403578, -2.407545, 1, 0.6117647, 0, 1,
-1.317465, 0.05324754, -1.726055, 1, 0.6196079, 0, 1,
-1.313302, 1.011791, -0.3703268, 1, 0.6235294, 0, 1,
-1.300782, -0.9875665, -2.134844, 1, 0.6313726, 0, 1,
-1.293981, -0.6509923, -2.5096, 1, 0.6352941, 0, 1,
-1.293135, 1.711085, -0.1435584, 1, 0.6431373, 0, 1,
-1.288921, -0.7643225, -0.943024, 1, 0.6470588, 0, 1,
-1.285649, -0.446703, -1.143411, 1, 0.654902, 0, 1,
-1.28518, -0.2250706, -2.799319, 1, 0.6588235, 0, 1,
-1.284831, -1.05818, -1.409561, 1, 0.6666667, 0, 1,
-1.278959, 0.2314555, -2.518504, 1, 0.6705883, 0, 1,
-1.256851, 0.000493318, -1.928024, 1, 0.6784314, 0, 1,
-1.254383, 0.4018771, -1.679332, 1, 0.682353, 0, 1,
-1.250904, -1.154848, -2.393032, 1, 0.6901961, 0, 1,
-1.249382, 0.2147327, -0.06431852, 1, 0.6941177, 0, 1,
-1.245422, 0.5796237, -1.433839, 1, 0.7019608, 0, 1,
-1.243887, 0.1015562, -2.032994, 1, 0.7098039, 0, 1,
-1.24382, 0.9737219, -0.2115557, 1, 0.7137255, 0, 1,
-1.23686, 0.2232354, -0.2950433, 1, 0.7215686, 0, 1,
-1.232983, 0.9100359, -0.6973122, 1, 0.7254902, 0, 1,
-1.212928, 0.3771726, 0.264147, 1, 0.7333333, 0, 1,
-1.203346, 0.2113734, -1.175731, 1, 0.7372549, 0, 1,
-1.1903, -0.007136067, -1.292339, 1, 0.7450981, 0, 1,
-1.188664, -0.236804, -1.17946, 1, 0.7490196, 0, 1,
-1.182976, -1.398743, -4.048392, 1, 0.7568628, 0, 1,
-1.161281, 1.123746, -0.9087037, 1, 0.7607843, 0, 1,
-1.15443, -1.333003, -3.490315, 1, 0.7686275, 0, 1,
-1.151973, 0.1388435, -1.949859, 1, 0.772549, 0, 1,
-1.148611, 0.6065471, -0.5892389, 1, 0.7803922, 0, 1,
-1.148206, 0.9707255, 0.2104611, 1, 0.7843137, 0, 1,
-1.143611, -1.752661, -2.809864, 1, 0.7921569, 0, 1,
-1.14015, 0.896015, -0.1943603, 1, 0.7960784, 0, 1,
-1.129769, -1.003398, -3.135056, 1, 0.8039216, 0, 1,
-1.118044, 0.02182384, -0.1825971, 1, 0.8117647, 0, 1,
-1.11442, -0.4231178, -3.974377, 1, 0.8156863, 0, 1,
-1.113888, -0.2090876, -1.107759, 1, 0.8235294, 0, 1,
-1.110748, 1.578947, 0.01218084, 1, 0.827451, 0, 1,
-1.105101, -1.755689, -1.100449, 1, 0.8352941, 0, 1,
-1.093134, -0.819257, -2.985115, 1, 0.8392157, 0, 1,
-1.084824, 1.525584, -0.9410065, 1, 0.8470588, 0, 1,
-1.079528, 0.9414619, 0.2718263, 1, 0.8509804, 0, 1,
-1.067704, -1.258087, -3.937651, 1, 0.8588235, 0, 1,
-1.040983, -0.03170788, -0.4826484, 1, 0.8627451, 0, 1,
-1.03659, 0.004172482, -2.531252, 1, 0.8705882, 0, 1,
-1.03598, 0.9840905, -1.112007, 1, 0.8745098, 0, 1,
-1.032431, 0.8686264, -1.398484, 1, 0.8823529, 0, 1,
-1.025821, -0.2777149, -1.916318, 1, 0.8862745, 0, 1,
-1.023701, 0.24815, -2.169269, 1, 0.8941177, 0, 1,
-1.023501, 0.8680972, -0.5245163, 1, 0.8980392, 0, 1,
-1.021893, 0.9987166, -0.30234, 1, 0.9058824, 0, 1,
-1.020407, 0.625969, -1.740907, 1, 0.9137255, 0, 1,
-1.018023, -0.2714033, -2.747139, 1, 0.9176471, 0, 1,
-1.007305, -1.211762, -2.377882, 1, 0.9254902, 0, 1,
-1.005017, -1.42244, -3.452646, 1, 0.9294118, 0, 1,
-1.003055, -0.5272946, -2.602507, 1, 0.9372549, 0, 1,
-1.000814, 0.8112956, -0.4551891, 1, 0.9411765, 0, 1,
-0.993793, -0.2645042, -1.296778, 1, 0.9490196, 0, 1,
-0.9789497, -0.9632311, -2.910949, 1, 0.9529412, 0, 1,
-0.9714326, -0.6730173, -3.274009, 1, 0.9607843, 0, 1,
-0.9684419, 0.7735623, -0.4252942, 1, 0.9647059, 0, 1,
-0.9614831, -1.45002, -1.70866, 1, 0.972549, 0, 1,
-0.9593164, 2.192602, -0.8294179, 1, 0.9764706, 0, 1,
-0.9551238, -0.1657403, -1.692058, 1, 0.9843137, 0, 1,
-0.9542024, -0.4348103, -1.760844, 1, 0.9882353, 0, 1,
-0.9538034, -1.062906, -3.03722, 1, 0.9960784, 0, 1,
-0.9525837, 0.8397026, -1.044457, 0.9960784, 1, 0, 1,
-0.9502063, 1.907702, 0.15899, 0.9921569, 1, 0, 1,
-0.9418091, 0.8227929, -1.553817, 0.9843137, 1, 0, 1,
-0.938543, -0.5231971, -3.225153, 0.9803922, 1, 0, 1,
-0.9169865, 1.919359, -0.4787945, 0.972549, 1, 0, 1,
-0.9149078, -0.4586356, -2.366186, 0.9686275, 1, 0, 1,
-0.9010704, -0.1709952, -1.521497, 0.9607843, 1, 0, 1,
-0.8960036, -0.4157239, -2.015412, 0.9568627, 1, 0, 1,
-0.8902076, -0.7489952, -2.10903, 0.9490196, 1, 0, 1,
-0.8879926, 0.5904854, -0.7366242, 0.945098, 1, 0, 1,
-0.882261, -0.2648001, -3.45489, 0.9372549, 1, 0, 1,
-0.8814648, -0.9148529, -4.032218, 0.9333333, 1, 0, 1,
-0.8813958, 1.011046, -1.439613, 0.9254902, 1, 0, 1,
-0.8778981, -1.078912, -3.136632, 0.9215686, 1, 0, 1,
-0.8774285, -0.08119852, -2.006336, 0.9137255, 1, 0, 1,
-0.8732591, -1.243951, -2.244933, 0.9098039, 1, 0, 1,
-0.8652208, -0.5538784, -1.413865, 0.9019608, 1, 0, 1,
-0.8533246, 0.2826694, -2.095833, 0.8941177, 1, 0, 1,
-0.8511768, -0.2325898, -1.437329, 0.8901961, 1, 0, 1,
-0.8495372, -0.572791, -1.297014, 0.8823529, 1, 0, 1,
-0.8476804, 0.2886397, -1.605042, 0.8784314, 1, 0, 1,
-0.8455195, 0.06954756, -1.623351, 0.8705882, 1, 0, 1,
-0.8417937, -0.5669174, -2.494743, 0.8666667, 1, 0, 1,
-0.8397176, 1.004236, -0.8473406, 0.8588235, 1, 0, 1,
-0.8374532, -1.050726, -1.888986, 0.854902, 1, 0, 1,
-0.8348715, -0.9596201, -1.167936, 0.8470588, 1, 0, 1,
-0.830762, 0.6350348, -1.046957, 0.8431373, 1, 0, 1,
-0.8306424, -0.3242578, -1.967038, 0.8352941, 1, 0, 1,
-0.8248735, 0.2269466, -0.5732531, 0.8313726, 1, 0, 1,
-0.8229047, -3.377436, -3.471598, 0.8235294, 1, 0, 1,
-0.8115643, -0.7526978, -2.694205, 0.8196079, 1, 0, 1,
-0.8100417, 1.96324, -1.048284, 0.8117647, 1, 0, 1,
-0.8096505, 0.8760391, -2.361189, 0.8078431, 1, 0, 1,
-0.809615, 1.040688, -1.107417, 0.8, 1, 0, 1,
-0.8092663, 0.01188559, -2.751233, 0.7921569, 1, 0, 1,
-0.8068842, -1.065031, -3.686949, 0.7882353, 1, 0, 1,
-0.802058, 0.08307425, -0.9588288, 0.7803922, 1, 0, 1,
-0.8014733, -0.693126, -2.744113, 0.7764706, 1, 0, 1,
-0.7955009, 0.6962762, 0.4452029, 0.7686275, 1, 0, 1,
-0.7934681, -0.8729084, -1.455175, 0.7647059, 1, 0, 1,
-0.7913448, -0.08553568, -0.2823953, 0.7568628, 1, 0, 1,
-0.789683, 1.911358, 0.4356624, 0.7529412, 1, 0, 1,
-0.7866241, 1.079313, -2.501368, 0.7450981, 1, 0, 1,
-0.7859465, 1.079422, -0.9138321, 0.7411765, 1, 0, 1,
-0.7812365, -0.06738184, -3.479794, 0.7333333, 1, 0, 1,
-0.7763169, -0.5289438, -2.866158, 0.7294118, 1, 0, 1,
-0.7639559, -0.1437589, -3.479307, 0.7215686, 1, 0, 1,
-0.7525162, 1.00493, 0.1877597, 0.7176471, 1, 0, 1,
-0.7465184, -0.42073, -1.811474, 0.7098039, 1, 0, 1,
-0.7459046, -0.3496158, -2.583236, 0.7058824, 1, 0, 1,
-0.7439375, 1.876604, -0.5509368, 0.6980392, 1, 0, 1,
-0.7399206, -0.5440492, 0.2513737, 0.6901961, 1, 0, 1,
-0.7365289, -0.4921763, -1.747901, 0.6862745, 1, 0, 1,
-0.7323083, 0.8605421, -2.215474, 0.6784314, 1, 0, 1,
-0.7304021, -0.3380455, -0.2044434, 0.6745098, 1, 0, 1,
-0.7295522, 0.728556, -1.154082, 0.6666667, 1, 0, 1,
-0.7289628, 1.54903, 0.9356179, 0.6627451, 1, 0, 1,
-0.72852, -0.3111619, -1.285319, 0.654902, 1, 0, 1,
-0.7245054, 2.825516, 0.4711688, 0.6509804, 1, 0, 1,
-0.7229887, -0.5584053, -1.52569, 0.6431373, 1, 0, 1,
-0.7188119, 1.043126, -0.8801571, 0.6392157, 1, 0, 1,
-0.7165809, 0.6951386, 0.2745586, 0.6313726, 1, 0, 1,
-0.7125816, -0.2805292, -1.676228, 0.627451, 1, 0, 1,
-0.70851, -0.1026875, -1.897998, 0.6196079, 1, 0, 1,
-0.7069504, 0.439188, -1.531991, 0.6156863, 1, 0, 1,
-0.7064799, -0.02175372, -1.296115, 0.6078432, 1, 0, 1,
-0.6998521, 0.5696524, -1.355424, 0.6039216, 1, 0, 1,
-0.69691, -0.5656273, -1.76713, 0.5960785, 1, 0, 1,
-0.6958026, -0.7245306, -3.395145, 0.5882353, 1, 0, 1,
-0.6926178, 0.008358517, -2.037616, 0.5843138, 1, 0, 1,
-0.6872889, -0.8814007, -3.443921, 0.5764706, 1, 0, 1,
-0.6867225, 1.184015, 1.850395, 0.572549, 1, 0, 1,
-0.6791978, 0.2721413, -0.7526822, 0.5647059, 1, 0, 1,
-0.6778548, -1.342523, -3.10423, 0.5607843, 1, 0, 1,
-0.6738385, -0.4677458, -2.271215, 0.5529412, 1, 0, 1,
-0.6709511, -1.036646, -2.663749, 0.5490196, 1, 0, 1,
-0.6690229, -0.7734184, -2.024722, 0.5411765, 1, 0, 1,
-0.6650035, 1.965778, 1.448681, 0.5372549, 1, 0, 1,
-0.6626747, 1.411472, -1.500633, 0.5294118, 1, 0, 1,
-0.660288, -0.6941358, -0.1487055, 0.5254902, 1, 0, 1,
-0.6547312, 1.686269, -0.3852251, 0.5176471, 1, 0, 1,
-0.6537437, -0.1062437, -2.802201, 0.5137255, 1, 0, 1,
-0.6532978, -1.760318, -3.436296, 0.5058824, 1, 0, 1,
-0.6513035, 0.289744, -2.035462, 0.5019608, 1, 0, 1,
-0.6465032, 0.07314729, -1.945135, 0.4941176, 1, 0, 1,
-0.644829, 0.03280954, -1.090966, 0.4862745, 1, 0, 1,
-0.644436, -0.9250423, -1.27631, 0.4823529, 1, 0, 1,
-0.641941, -2.103835, -4.023939, 0.4745098, 1, 0, 1,
-0.6411905, -1.091943, -2.623694, 0.4705882, 1, 0, 1,
-0.6405253, -0.04814733, -0.4745736, 0.4627451, 1, 0, 1,
-0.6334851, 0.1291214, -0.4616572, 0.4588235, 1, 0, 1,
-0.6291935, 0.118713, -0.8508556, 0.4509804, 1, 0, 1,
-0.6229298, -0.8133563, -3.617251, 0.4470588, 1, 0, 1,
-0.6217244, -0.00525849, -1.518333, 0.4392157, 1, 0, 1,
-0.6183965, -1.485114, -3.689315, 0.4352941, 1, 0, 1,
-0.6182657, 0.7549227, 0.3162983, 0.427451, 1, 0, 1,
-0.6174321, 0.541126, -1.607637, 0.4235294, 1, 0, 1,
-0.6144955, 0.8011593, -0.524564, 0.4156863, 1, 0, 1,
-0.6137168, 1.026947, -2.531167, 0.4117647, 1, 0, 1,
-0.6075696, 0.1045264, -2.218484, 0.4039216, 1, 0, 1,
-0.6052952, -0.7683565, -3.183067, 0.3960784, 1, 0, 1,
-0.601851, 0.936193, 0.5936148, 0.3921569, 1, 0, 1,
-0.6012233, 2.192108, 0.1085536, 0.3843137, 1, 0, 1,
-0.5990024, -0.5352524, -3.544529, 0.3803922, 1, 0, 1,
-0.5988368, 0.3181493, -1.122533, 0.372549, 1, 0, 1,
-0.5958502, 0.5265424, -3.56859, 0.3686275, 1, 0, 1,
-0.5918093, 0.3261107, -1.40216, 0.3607843, 1, 0, 1,
-0.5901597, -1.491505, -2.079205, 0.3568628, 1, 0, 1,
-0.5900359, 0.0925473, -0.1331576, 0.3490196, 1, 0, 1,
-0.5848133, -3.070014, -1.084168, 0.345098, 1, 0, 1,
-0.583253, 0.3122581, 1.499205, 0.3372549, 1, 0, 1,
-0.5817578, 0.9425516, 0.9238154, 0.3333333, 1, 0, 1,
-0.5811658, 1.444064, 0.2444498, 0.3254902, 1, 0, 1,
-0.5805205, 0.5919756, -3.192238, 0.3215686, 1, 0, 1,
-0.5781489, -1.962409, -2.854958, 0.3137255, 1, 0, 1,
-0.5778179, -0.7966679, -1.550652, 0.3098039, 1, 0, 1,
-0.5761265, 0.4860141, 0.3381548, 0.3019608, 1, 0, 1,
-0.5752215, 1.535477, -0.4268934, 0.2941177, 1, 0, 1,
-0.5720195, 1.920955, -0.7735384, 0.2901961, 1, 0, 1,
-0.5708885, -0.2790183, -0.9184933, 0.282353, 1, 0, 1,
-0.5702303, 0.09102695, -0.3207679, 0.2784314, 1, 0, 1,
-0.5664809, 0.07865603, -2.205452, 0.2705882, 1, 0, 1,
-0.5652609, -0.3863216, -3.378396, 0.2666667, 1, 0, 1,
-0.5610833, -1.386775, -3.446472, 0.2588235, 1, 0, 1,
-0.557495, -0.9180427, -4.821956, 0.254902, 1, 0, 1,
-0.5550379, -1.537914, -5.545495, 0.2470588, 1, 0, 1,
-0.5538259, 0.2423313, -2.082142, 0.2431373, 1, 0, 1,
-0.5492367, 1.227748, -1.054498, 0.2352941, 1, 0, 1,
-0.5430198, 0.1679976, 0.1323135, 0.2313726, 1, 0, 1,
-0.5377852, 1.165278, -1.342517, 0.2235294, 1, 0, 1,
-0.5351387, -1.41596, -2.120153, 0.2196078, 1, 0, 1,
-0.5341896, 0.9678708, -0.8477902, 0.2117647, 1, 0, 1,
-0.5330739, 0.371429, -0.9485665, 0.2078431, 1, 0, 1,
-0.5310724, -0.2706801, -1.428127, 0.2, 1, 0, 1,
-0.5308688, -0.03694327, -1.199777, 0.1921569, 1, 0, 1,
-0.5283493, 0.4044166, -2.398743, 0.1882353, 1, 0, 1,
-0.5238597, -0.3519536, -2.064194, 0.1803922, 1, 0, 1,
-0.5236973, -0.4946728, -1.36098, 0.1764706, 1, 0, 1,
-0.5161985, 0.2273835, -3.043255, 0.1686275, 1, 0, 1,
-0.5085549, -0.08610459, -2.816136, 0.1647059, 1, 0, 1,
-0.5076565, 2.093442, -0.5125142, 0.1568628, 1, 0, 1,
-0.5028782, -1.153399, -3.325259, 0.1529412, 1, 0, 1,
-0.502365, 0.746343, -3.508069, 0.145098, 1, 0, 1,
-0.5013491, -1.735213, -3.164674, 0.1411765, 1, 0, 1,
-0.5000775, 0.3417676, -1.165695, 0.1333333, 1, 0, 1,
-0.4957218, -0.3790676, -1.331704, 0.1294118, 1, 0, 1,
-0.4952176, 0.1726724, -1.330963, 0.1215686, 1, 0, 1,
-0.4933691, 0.3214958, -0.4335675, 0.1176471, 1, 0, 1,
-0.4872646, 0.5997068, -0.8176179, 0.1098039, 1, 0, 1,
-0.4859921, -0.6302787, -3.685875, 0.1058824, 1, 0, 1,
-0.4826224, -1.890531, -1.898921, 0.09803922, 1, 0, 1,
-0.4747632, 0.8430908, 0.5098134, 0.09019608, 1, 0, 1,
-0.4705249, -0.5936133, -0.9965116, 0.08627451, 1, 0, 1,
-0.4695455, -1.769746, -2.698071, 0.07843138, 1, 0, 1,
-0.4650706, -0.2205713, -2.642229, 0.07450981, 1, 0, 1,
-0.4648979, -1.039939, -3.038202, 0.06666667, 1, 0, 1,
-0.4552195, -0.5057176, -3.90089, 0.0627451, 1, 0, 1,
-0.4509239, 0.4304387, -2.246548, 0.05490196, 1, 0, 1,
-0.4509213, 0.4312072, -0.5763685, 0.05098039, 1, 0, 1,
-0.4507231, 0.2961832, -2.518257, 0.04313726, 1, 0, 1,
-0.4506596, -0.6657182, -1.72062, 0.03921569, 1, 0, 1,
-0.4466745, -0.3531747, -2.390901, 0.03137255, 1, 0, 1,
-0.4412328, 0.7636911, -1.523006, 0.02745098, 1, 0, 1,
-0.4392511, -1.126272, -2.81345, 0.01960784, 1, 0, 1,
-0.4384029, -0.2739702, -3.97027, 0.01568628, 1, 0, 1,
-0.4381461, 1.671423, 1.784748, 0.007843138, 1, 0, 1,
-0.4372659, -0.1101785, -1.150623, 0.003921569, 1, 0, 1,
-0.434068, -0.5692316, -4.134165, 0, 1, 0.003921569, 1,
-0.4328091, -0.8503115, -3.174375, 0, 1, 0.01176471, 1,
-0.4313963, -0.1691498, -2.835869, 0, 1, 0.01568628, 1,
-0.4313653, 0.7319673, -1.224081, 0, 1, 0.02352941, 1,
-0.4280409, 1.210832, 0.06125132, 0, 1, 0.02745098, 1,
-0.4261354, -1.373402, -2.138329, 0, 1, 0.03529412, 1,
-0.4255557, 0.8857514, -0.89638, 0, 1, 0.03921569, 1,
-0.4252362, -0.2472716, -0.3357352, 0, 1, 0.04705882, 1,
-0.4243754, 0.1491252, -1.337427, 0, 1, 0.05098039, 1,
-0.4231882, -0.1753753, -2.740082, 0, 1, 0.05882353, 1,
-0.4223377, 0.714753, -0.228817, 0, 1, 0.0627451, 1,
-0.419521, -1.529837, -3.7031, 0, 1, 0.07058824, 1,
-0.4120352, 1.244804, -0.1328209, 0, 1, 0.07450981, 1,
-0.4119114, 1.983914, 0.990923, 0, 1, 0.08235294, 1,
-0.4119028, 0.4854679, -1.888961, 0, 1, 0.08627451, 1,
-0.4092808, 1.355722, -1.975816, 0, 1, 0.09411765, 1,
-0.4007503, 1.080473, 1.712932, 0, 1, 0.1019608, 1,
-0.3947291, 0.8452885, -2.763953, 0, 1, 0.1058824, 1,
-0.3905919, -2.59861, -1.081361, 0, 1, 0.1137255, 1,
-0.3841994, -1.57589, -1.889232, 0, 1, 0.1176471, 1,
-0.3831762, 0.02868194, -3.636877, 0, 1, 0.1254902, 1,
-0.3820912, 1.451738, -0.1052329, 0, 1, 0.1294118, 1,
-0.3782507, -0.9790444, -1.703689, 0, 1, 0.1372549, 1,
-0.376287, 1.691644, -1.380946, 0, 1, 0.1411765, 1,
-0.3750978, -1.775619, -2.818192, 0, 1, 0.1490196, 1,
-0.3741415, -0.7957389, -1.618992, 0, 1, 0.1529412, 1,
-0.3721819, 0.5298315, -0.3738715, 0, 1, 0.1607843, 1,
-0.3693478, -0.526648, -2.438568, 0, 1, 0.1647059, 1,
-0.3661813, -0.5787122, -1.162974, 0, 1, 0.172549, 1,
-0.3652766, 1.325479, -0.4659392, 0, 1, 0.1764706, 1,
-0.3620723, 0.6233145, 0.8149278, 0, 1, 0.1843137, 1,
-0.354278, 1.615911, -0.1100811, 0, 1, 0.1882353, 1,
-0.3537577, 0.7380255, -1.599556, 0, 1, 0.1960784, 1,
-0.3522702, -0.1969578, -2.053782, 0, 1, 0.2039216, 1,
-0.351691, 0.9696521, -0.5300277, 0, 1, 0.2078431, 1,
-0.3516729, 0.7471241, -1.75145, 0, 1, 0.2156863, 1,
-0.3504367, -0.4154948, -2.338925, 0, 1, 0.2196078, 1,
-0.3459715, 0.1667626, -0.3688235, 0, 1, 0.227451, 1,
-0.3439244, 0.4202592, -1.878971, 0, 1, 0.2313726, 1,
-0.3413786, -1.781294, -1.353719, 0, 1, 0.2392157, 1,
-0.3392194, -1.19848, -1.971704, 0, 1, 0.2431373, 1,
-0.337408, 0.02919419, -2.053699, 0, 1, 0.2509804, 1,
-0.3360243, 0.5796447, -0.4075986, 0, 1, 0.254902, 1,
-0.3342418, -0.1082639, -0.7390717, 0, 1, 0.2627451, 1,
-0.3337071, -0.3659629, -3.100819, 0, 1, 0.2666667, 1,
-0.3280936, -0.4536348, -2.016997, 0, 1, 0.2745098, 1,
-0.3268684, -0.4486308, -2.634421, 0, 1, 0.2784314, 1,
-0.3184872, -0.3085061, -2.127899, 0, 1, 0.2862745, 1,
-0.3181384, -0.6166572, -3.382094, 0, 1, 0.2901961, 1,
-0.3173448, 1.662419, 0.6201895, 0, 1, 0.2980392, 1,
-0.3157616, -1.299136, -1.377159, 0, 1, 0.3058824, 1,
-0.313074, -0.4085664, -5.011002, 0, 1, 0.3098039, 1,
-0.3099498, 1.251569, -2.279457, 0, 1, 0.3176471, 1,
-0.3056728, 1.059724, -2.59697, 0, 1, 0.3215686, 1,
-0.3046012, -0.8799614, -1.130177, 0, 1, 0.3294118, 1,
-0.3044589, 0.5828485, -1.032234, 0, 1, 0.3333333, 1,
-0.3040123, -0.8469021, -0.9833279, 0, 1, 0.3411765, 1,
-0.3016192, -1.989774, -3.801347, 0, 1, 0.345098, 1,
-0.2997278, 0.428633, 0.1747237, 0, 1, 0.3529412, 1,
-0.2933097, -1.389932, -2.703951, 0, 1, 0.3568628, 1,
-0.291745, 0.7080756, -0.606271, 0, 1, 0.3647059, 1,
-0.290295, -0.7517561, -3.180684, 0, 1, 0.3686275, 1,
-0.2899524, 0.4358754, -0.8393087, 0, 1, 0.3764706, 1,
-0.2885539, -1.898135, -1.339128, 0, 1, 0.3803922, 1,
-0.2877801, -0.2675673, -1.071058, 0, 1, 0.3882353, 1,
-0.2781825, 0.3711812, 0.7039765, 0, 1, 0.3921569, 1,
-0.2773847, -0.7548754, -3.615377, 0, 1, 0.4, 1,
-0.2763921, -1.46264, -4.302958, 0, 1, 0.4078431, 1,
-0.2711195, 1.292082, -2.335812, 0, 1, 0.4117647, 1,
-0.2621788, 1.719424, 0.523914, 0, 1, 0.4196078, 1,
-0.2601537, 0.02941414, 0.0179735, 0, 1, 0.4235294, 1,
-0.2592754, -0.02368652, -2.009462, 0, 1, 0.4313726, 1,
-0.258242, -0.1382335, -4.216123, 0, 1, 0.4352941, 1,
-0.2569967, 1.328487, 0.4668277, 0, 1, 0.4431373, 1,
-0.2562253, 0.7231993, -1.080242, 0, 1, 0.4470588, 1,
-0.2552567, -0.4281853, -1.762746, 0, 1, 0.454902, 1,
-0.2542104, -1.566762, -3.342221, 0, 1, 0.4588235, 1,
-0.2539482, 1.01779, 0.4341556, 0, 1, 0.4666667, 1,
-0.252573, 0.7248966, -0.7730051, 0, 1, 0.4705882, 1,
-0.2484645, 0.227996, -1.294802, 0, 1, 0.4784314, 1,
-0.2477489, 0.7046779, -0.1195426, 0, 1, 0.4823529, 1,
-0.2471228, 0.6884906, -2.623886, 0, 1, 0.4901961, 1,
-0.2402781, 0.5553122, 0.0693092, 0, 1, 0.4941176, 1,
-0.2394594, 0.6778931, 0.8849138, 0, 1, 0.5019608, 1,
-0.2357513, -2.26204, -1.977401, 0, 1, 0.509804, 1,
-0.2341125, -0.04992128, -1.224292, 0, 1, 0.5137255, 1,
-0.2337381, 0.09404033, -1.800705, 0, 1, 0.5215687, 1,
-0.2295672, -0.4279914, -3.14468, 0, 1, 0.5254902, 1,
-0.2277544, -0.782018, -4.999272, 0, 1, 0.5333334, 1,
-0.223966, 1.165438, -1.211869, 0, 1, 0.5372549, 1,
-0.2214868, 0.3018849, -0.4721764, 0, 1, 0.5450981, 1,
-0.2211947, -0.3638573, -2.487312, 0, 1, 0.5490196, 1,
-0.215921, -1.000495, -4.066231, 0, 1, 0.5568628, 1,
-0.2111435, -0.6350329, -3.689368, 0, 1, 0.5607843, 1,
-0.203324, -0.1485398, -3.347618, 0, 1, 0.5686275, 1,
-0.1986935, 0.7127948, -1.270284, 0, 1, 0.572549, 1,
-0.1928518, 0.2253275, -0.5848708, 0, 1, 0.5803922, 1,
-0.1820743, 1.555153, -0.9271322, 0, 1, 0.5843138, 1,
-0.1809342, 0.04125144, -0.5484039, 0, 1, 0.5921569, 1,
-0.1782085, 2.73314, -0.06947036, 0, 1, 0.5960785, 1,
-0.1774668, 0.8161679, -0.9035806, 0, 1, 0.6039216, 1,
-0.1768381, 0.4434167, -0.4980468, 0, 1, 0.6117647, 1,
-0.1756895, -0.2928839, -2.098915, 0, 1, 0.6156863, 1,
-0.1640863, -1.747559, -4.574036, 0, 1, 0.6235294, 1,
-0.1612865, -0.6676297, -3.317015, 0, 1, 0.627451, 1,
-0.1607752, 1.157925, 0.0383618, 0, 1, 0.6352941, 1,
-0.1592269, 1.070396, 1.819299, 0, 1, 0.6392157, 1,
-0.1564765, -0.2163719, -1.549111, 0, 1, 0.6470588, 1,
-0.1536833, 0.5060033, -0.8184206, 0, 1, 0.6509804, 1,
-0.1514075, 1.781413, 0.245289, 0, 1, 0.6588235, 1,
-0.1499406, 0.04459249, -1.770497, 0, 1, 0.6627451, 1,
-0.1452303, -0.01752774, -1.199233, 0, 1, 0.6705883, 1,
-0.1436655, -1.871087, -2.567939, 0, 1, 0.6745098, 1,
-0.1419079, -0.07673891, -2.726108, 0, 1, 0.682353, 1,
-0.1409662, 0.6344841, 0.2022733, 0, 1, 0.6862745, 1,
-0.1380421, 0.5763142, -0.08338794, 0, 1, 0.6941177, 1,
-0.1375241, -1.159474, -2.9325, 0, 1, 0.7019608, 1,
-0.1340436, 1.463174, -1.094391, 0, 1, 0.7058824, 1,
-0.1256178, -0.683639, -3.386255, 0, 1, 0.7137255, 1,
-0.1255879, 2.098948, -0.5300609, 0, 1, 0.7176471, 1,
-0.1249875, 2.457572, 1.138183, 0, 1, 0.7254902, 1,
-0.1246311, 0.3062977, -1.805694, 0, 1, 0.7294118, 1,
-0.1198222, -0.3827375, -1.747923, 0, 1, 0.7372549, 1,
-0.1188994, 0.3774716, -1.03801, 0, 1, 0.7411765, 1,
-0.1136528, -1.159422, -2.686704, 0, 1, 0.7490196, 1,
-0.1104054, 0.4176036, -2.302199, 0, 1, 0.7529412, 1,
-0.1082176, 0.652431, 1.709414, 0, 1, 0.7607843, 1,
-0.1079781, -1.161108, -3.554064, 0, 1, 0.7647059, 1,
-0.1064936, -0.2799048, -1.7096, 0, 1, 0.772549, 1,
-0.1064522, 0.3789539, 1.61599, 0, 1, 0.7764706, 1,
-0.1055789, -0.5853209, -3.174125, 0, 1, 0.7843137, 1,
-0.104038, 0.8524776, -0.5140185, 0, 1, 0.7882353, 1,
-0.1020857, 0.5085208, -0.1212682, 0, 1, 0.7960784, 1,
-0.101389, 1.162738, -1.000776, 0, 1, 0.8039216, 1,
-0.09845643, -1.304241, -2.855663, 0, 1, 0.8078431, 1,
-0.09708413, 0.6068935, -2.403772, 0, 1, 0.8156863, 1,
-0.09645276, 0.6774519, 1.35005, 0, 1, 0.8196079, 1,
-0.09634262, -1.821312, -2.770519, 0, 1, 0.827451, 1,
-0.09468652, 1.113818, 0.08882909, 0, 1, 0.8313726, 1,
-0.09173179, -0.3208561, -3.737527, 0, 1, 0.8392157, 1,
-0.09112386, 0.72821, -0.2079766, 0, 1, 0.8431373, 1,
-0.0907179, 0.2732814, -1.266846, 0, 1, 0.8509804, 1,
-0.08758505, 1.707967, 0.8803682, 0, 1, 0.854902, 1,
-0.08648229, 0.2125665, -0.6717871, 0, 1, 0.8627451, 1,
-0.08530052, 0.2288769, -0.5778543, 0, 1, 0.8666667, 1,
-0.08483926, 0.8796454, 0.259802, 0, 1, 0.8745098, 1,
-0.08048993, 0.9076623, -0.03823623, 0, 1, 0.8784314, 1,
-0.07785592, -0.8454267, -3.644907, 0, 1, 0.8862745, 1,
-0.07686301, 0.1073114, -0.7347959, 0, 1, 0.8901961, 1,
-0.06724335, -0.8317351, -1.838274, 0, 1, 0.8980392, 1,
-0.06677573, -1.010868, -2.922168, 0, 1, 0.9058824, 1,
-0.06011179, 0.6620693, 0.02543827, 0, 1, 0.9098039, 1,
-0.05852165, -0.1163103, -2.589167, 0, 1, 0.9176471, 1,
-0.05820335, 0.5201787, -0.6982139, 0, 1, 0.9215686, 1,
-0.05239172, 0.1722042, 1.244926, 0, 1, 0.9294118, 1,
-0.0517003, 0.0671917, 0.4400644, 0, 1, 0.9333333, 1,
-0.04715281, -0.5750275, -3.057073, 0, 1, 0.9411765, 1,
-0.04602766, -0.09265719, -3.365786, 0, 1, 0.945098, 1,
-0.04281978, 0.9736496, -0.4760514, 0, 1, 0.9529412, 1,
-0.04029465, 1.178369, -0.5927118, 0, 1, 0.9568627, 1,
-0.03753367, -2.835862, -2.451998, 0, 1, 0.9647059, 1,
-0.03261446, -0.2163328, -3.54884, 0, 1, 0.9686275, 1,
-0.03229217, -2.484882, -5.123248, 0, 1, 0.9764706, 1,
-0.03152599, -1.712732, -2.830312, 0, 1, 0.9803922, 1,
-0.02829069, 1.068706, 0.9107327, 0, 1, 0.9882353, 1,
-0.02709584, -0.05395896, -3.231891, 0, 1, 0.9921569, 1,
-0.02661771, 0.1507457, -1.262772, 0, 1, 1, 1,
-0.02324811, 0.5521042, -0.9984766, 0, 0.9921569, 1, 1,
-0.0216854, 1.505521, -0.03029927, 0, 0.9882353, 1, 1,
-0.01699058, 0.2576662, 0.916514, 0, 0.9803922, 1, 1,
-0.01578735, 0.2574951, 0.1550693, 0, 0.9764706, 1, 1,
-0.01524254, 1.060265, 0.6712304, 0, 0.9686275, 1, 1,
-0.01198236, 0.5356568, -0.8626853, 0, 0.9647059, 1, 1,
-0.008857395, 0.788693, 1.102253, 0, 0.9568627, 1, 1,
-0.006607052, 1.76738, -0.4363265, 0, 0.9529412, 1, 1,
-0.006468759, -0.35681, -3.096866, 0, 0.945098, 1, 1,
-0.005528528, 0.3747154, -1.056071, 0, 0.9411765, 1, 1,
-0.003908989, 0.1524696, -0.5471991, 0, 0.9333333, 1, 1,
0.002658403, -0.8497385, 2.179533, 0, 0.9294118, 1, 1,
0.002832507, -3.685372, 3.882354, 0, 0.9215686, 1, 1,
0.003024245, 1.677933, -0.3666378, 0, 0.9176471, 1, 1,
0.005846791, -0.6578493, 3.504447, 0, 0.9098039, 1, 1,
0.006140342, 0.7657517, 1.0878, 0, 0.9058824, 1, 1,
0.006887913, -0.8963062, 3.705187, 0, 0.8980392, 1, 1,
0.01183095, 1.828246, -0.01589691, 0, 0.8901961, 1, 1,
0.01333545, 0.5900911, -0.6615216, 0, 0.8862745, 1, 1,
0.01798852, -0.4050353, 3.496103, 0, 0.8784314, 1, 1,
0.01860083, -0.09071932, 3.019865, 0, 0.8745098, 1, 1,
0.02126259, 0.7596157, 2.913856, 0, 0.8666667, 1, 1,
0.02405281, -1.72785, 3.220676, 0, 0.8627451, 1, 1,
0.0320475, 0.9056513, -1.779613, 0, 0.854902, 1, 1,
0.03373092, -1.72668, 3.064782, 0, 0.8509804, 1, 1,
0.03811244, -1.593632, 0.4498987, 0, 0.8431373, 1, 1,
0.04368077, -0.987047, 2.847167, 0, 0.8392157, 1, 1,
0.04773718, 0.6614733, -0.3003973, 0, 0.8313726, 1, 1,
0.05051401, -1.127166, 4.950756, 0, 0.827451, 1, 1,
0.05415154, 0.2146491, -0.5359462, 0, 0.8196079, 1, 1,
0.06362339, -1.105936, 2.499377, 0, 0.8156863, 1, 1,
0.06665905, -0.1993235, 1.000841, 0, 0.8078431, 1, 1,
0.06817889, -0.7646746, 3.076805, 0, 0.8039216, 1, 1,
0.0734456, 0.1075829, 0.3041988, 0, 0.7960784, 1, 1,
0.07412437, 0.425274, 0.671121, 0, 0.7882353, 1, 1,
0.07488404, 1.266244, -0.2007027, 0, 0.7843137, 1, 1,
0.0750543, -0.5195093, 4.950973, 0, 0.7764706, 1, 1,
0.0787838, -0.2593652, 4.407142, 0, 0.772549, 1, 1,
0.08141337, 0.181559, 1.191889, 0, 0.7647059, 1, 1,
0.08454517, 0.1365581, 0.9968503, 0, 0.7607843, 1, 1,
0.08478066, 1.392666, -0.4581164, 0, 0.7529412, 1, 1,
0.08480612, -1.211974, 2.347208, 0, 0.7490196, 1, 1,
0.08845735, 0.3195991, -1.077846, 0, 0.7411765, 1, 1,
0.09011563, -1.13342, 2.57139, 0, 0.7372549, 1, 1,
0.09039725, -0.3813558, 3.472244, 0, 0.7294118, 1, 1,
0.09244658, -0.940986, 2.433043, 0, 0.7254902, 1, 1,
0.09526833, -0.6971343, 2.968451, 0, 0.7176471, 1, 1,
0.09531965, 0.4648071, -0.5101725, 0, 0.7137255, 1, 1,
0.09761185, -0.6945952, 3.064842, 0, 0.7058824, 1, 1,
0.09875585, -1.234705, 2.956871, 0, 0.6980392, 1, 1,
0.09978499, 0.2906974, -0.9373456, 0, 0.6941177, 1, 1,
0.1008969, -1.065113, 1.521583, 0, 0.6862745, 1, 1,
0.1083108, 1.96072, -0.7984017, 0, 0.682353, 1, 1,
0.1108002, 0.7682084, 1.17071, 0, 0.6745098, 1, 1,
0.1131391, 0.9416486, 0.7299563, 0, 0.6705883, 1, 1,
0.1151317, -1.148026, 1.557206, 0, 0.6627451, 1, 1,
0.1187966, 0.5775455, -0.5573144, 0, 0.6588235, 1, 1,
0.1241657, 0.3543354, 1.014175, 0, 0.6509804, 1, 1,
0.1273507, 1.314415, 2.021185, 0, 0.6470588, 1, 1,
0.1280567, 1.261497, -0.863904, 0, 0.6392157, 1, 1,
0.1311883, -0.1642553, 2.258625, 0, 0.6352941, 1, 1,
0.1387129, 1.8523, -0.4353713, 0, 0.627451, 1, 1,
0.138811, -0.4364781, 2.09526, 0, 0.6235294, 1, 1,
0.1405219, 1.228068, -0.6920634, 0, 0.6156863, 1, 1,
0.1416273, 1.357534, 0.2999725, 0, 0.6117647, 1, 1,
0.1423761, -0.6423727, 4.701798, 0, 0.6039216, 1, 1,
0.1447436, -0.6583176, 2.825936, 0, 0.5960785, 1, 1,
0.1471982, -1.120393, 4.3533, 0, 0.5921569, 1, 1,
0.1497527, -0.6895843, 2.748699, 0, 0.5843138, 1, 1,
0.1571097, 0.9511496, -0.3811809, 0, 0.5803922, 1, 1,
0.1590493, 0.06130979, 1.089621, 0, 0.572549, 1, 1,
0.1630637, 2.064098, -0.0568918, 0, 0.5686275, 1, 1,
0.1668973, 0.5036528, 0.03886877, 0, 0.5607843, 1, 1,
0.1688162, -0.7860225, 2.995196, 0, 0.5568628, 1, 1,
0.1773493, 0.3294501, 1.594486, 0, 0.5490196, 1, 1,
0.1782685, -0.07925656, 2.184184, 0, 0.5450981, 1, 1,
0.1859452, 0.1998796, -0.5894911, 0, 0.5372549, 1, 1,
0.1872254, -0.6696534, 4.194753, 0, 0.5333334, 1, 1,
0.1895525, 2.067539, 1.152608, 0, 0.5254902, 1, 1,
0.191458, 1.302959, 0.4060246, 0, 0.5215687, 1, 1,
0.1963278, 0.02245379, 0.8335899, 0, 0.5137255, 1, 1,
0.1969919, 0.1297939, 2.243105, 0, 0.509804, 1, 1,
0.198282, -0.2427108, 0.5036198, 0, 0.5019608, 1, 1,
0.1985386, -0.8846441, 3.426243, 0, 0.4941176, 1, 1,
0.1994563, 0.2137851, 1.717441, 0, 0.4901961, 1, 1,
0.1996518, 0.3269999, -0.3476351, 0, 0.4823529, 1, 1,
0.2003686, -0.9801332, 2.108706, 0, 0.4784314, 1, 1,
0.2034905, 1.387639, -0.6076173, 0, 0.4705882, 1, 1,
0.2035682, 1.515936, 1.19431, 0, 0.4666667, 1, 1,
0.2072853, 1.32365, 0.8163572, 0, 0.4588235, 1, 1,
0.2073011, 1.627199, 0.1808923, 0, 0.454902, 1, 1,
0.2131545, -1.773063, 5.061745, 0, 0.4470588, 1, 1,
0.2141996, -0.6255721, 4.013664, 0, 0.4431373, 1, 1,
0.2225519, -0.1313719, 0.2465776, 0, 0.4352941, 1, 1,
0.2232326, -0.1767395, 3.26493, 0, 0.4313726, 1, 1,
0.2249051, 0.5909932, -0.1693123, 0, 0.4235294, 1, 1,
0.2337689, 2.059365, -0.2586788, 0, 0.4196078, 1, 1,
0.2366111, -0.5234338, 1.801965, 0, 0.4117647, 1, 1,
0.2387951, 1.0559, 0.4377444, 0, 0.4078431, 1, 1,
0.2389273, 0.1729122, -0.207058, 0, 0.4, 1, 1,
0.2396194, -1.014887, 3.16052, 0, 0.3921569, 1, 1,
0.2399785, 0.1637502, 0.2374596, 0, 0.3882353, 1, 1,
0.2456275, -0.2160371, 2.751128, 0, 0.3803922, 1, 1,
0.2464385, 0.4762885, -0.2658162, 0, 0.3764706, 1, 1,
0.248505, 1.291566, 0.9955598, 0, 0.3686275, 1, 1,
0.2510561, 1.4131, -0.8491819, 0, 0.3647059, 1, 1,
0.258675, -1.125885, 3.00824, 0, 0.3568628, 1, 1,
0.2592935, 0.1713514, 1.256962, 0, 0.3529412, 1, 1,
0.2598282, 1.297574, 1.516383, 0, 0.345098, 1, 1,
0.261861, 0.7751478, 1.395925, 0, 0.3411765, 1, 1,
0.2662184, -0.6243103, 1.063823, 0, 0.3333333, 1, 1,
0.266847, 0.996469, 1.906649, 0, 0.3294118, 1, 1,
0.2704798, 0.02641395, 1.173335, 0, 0.3215686, 1, 1,
0.2787582, -0.1149655, 1.219911, 0, 0.3176471, 1, 1,
0.2787879, -0.7649977, 0.1395932, 0, 0.3098039, 1, 1,
0.2814738, -0.07893525, 2.516399, 0, 0.3058824, 1, 1,
0.2825415, -0.7984295, 1.862081, 0, 0.2980392, 1, 1,
0.2843689, 1.662629, -1.714155, 0, 0.2901961, 1, 1,
0.2921416, -0.6009179, 3.416761, 0, 0.2862745, 1, 1,
0.2924864, 0.1477402, 1.226212, 0, 0.2784314, 1, 1,
0.2944711, 0.03722212, 2.811312, 0, 0.2745098, 1, 1,
0.2955683, -0.6689929, 4.040448, 0, 0.2666667, 1, 1,
0.2966819, 0.07699713, 1.619123, 0, 0.2627451, 1, 1,
0.3013649, -1.412315, 3.203371, 0, 0.254902, 1, 1,
0.3026682, 0.4578581, 0.819253, 0, 0.2509804, 1, 1,
0.3027977, 0.3020992, 0.7062865, 0, 0.2431373, 1, 1,
0.3031168, -0.8478393, 1.708972, 0, 0.2392157, 1, 1,
0.3037615, 0.1961187, 1.79265, 0, 0.2313726, 1, 1,
0.3053997, 1.617554, 0.3888383, 0, 0.227451, 1, 1,
0.3054173, -0.9849724, 3.905892, 0, 0.2196078, 1, 1,
0.3073773, 0.5026768, 0.7671477, 0, 0.2156863, 1, 1,
0.3083149, -0.7999867, 3.110986, 0, 0.2078431, 1, 1,
0.3136553, -3.053036, 3.162319, 0, 0.2039216, 1, 1,
0.3147299, 0.06958903, 1.299691, 0, 0.1960784, 1, 1,
0.3180596, 2.672952, -0.7801532, 0, 0.1882353, 1, 1,
0.319274, 0.06909885, 2.624403, 0, 0.1843137, 1, 1,
0.3198251, -1.569057, 3.686058, 0, 0.1764706, 1, 1,
0.322248, -1.151394, 3.903931, 0, 0.172549, 1, 1,
0.3239915, -0.2391002, 3.099673, 0, 0.1647059, 1, 1,
0.3259748, -1.001569, 2.543787, 0, 0.1607843, 1, 1,
0.3290729, 2.158225, 0.2863143, 0, 0.1529412, 1, 1,
0.3293378, 0.07122573, 2.365598, 0, 0.1490196, 1, 1,
0.3305639, 0.673808, -0.05281002, 0, 0.1411765, 1, 1,
0.3339692, -1.215002, 1.909903, 0, 0.1372549, 1, 1,
0.3362777, 1.772523, 0.4418025, 0, 0.1294118, 1, 1,
0.3382211, -1.598494, 2.789274, 0, 0.1254902, 1, 1,
0.3394925, 0.6635526, 0.3055373, 0, 0.1176471, 1, 1,
0.3411124, -0.2314565, 2.528555, 0, 0.1137255, 1, 1,
0.3417324, 1.195075, 0.5694676, 0, 0.1058824, 1, 1,
0.3461321, 0.4202959, -0.1110524, 0, 0.09803922, 1, 1,
0.3475802, 0.5066401, 1.221269, 0, 0.09411765, 1, 1,
0.3497307, 0.2450714, -0.09794647, 0, 0.08627451, 1, 1,
0.3499983, -0.5876976, 2.403866, 0, 0.08235294, 1, 1,
0.3502046, 1.833792, 0.1986017, 0, 0.07450981, 1, 1,
0.3515548, 1.882374, 0.06746604, 0, 0.07058824, 1, 1,
0.3526089, -0.6164743, 3.956527, 0, 0.0627451, 1, 1,
0.3538195, 1.73184, -1.391206, 0, 0.05882353, 1, 1,
0.3566201, -0.1740179, 1.849857, 0, 0.05098039, 1, 1,
0.3584312, 0.2033294, 1.519433, 0, 0.04705882, 1, 1,
0.3617335, 3.267371, 0.5497952, 0, 0.03921569, 1, 1,
0.363756, -2.758359, 3.618221, 0, 0.03529412, 1, 1,
0.3639345, 0.2038851, 1.567647, 0, 0.02745098, 1, 1,
0.3646158, 0.5224773, 0.8469547, 0, 0.02352941, 1, 1,
0.3691851, -0.93478, 2.559822, 0, 0.01568628, 1, 1,
0.3713605, -1.599592, 3.205578, 0, 0.01176471, 1, 1,
0.3736956, 0.1547984, 3.241644, 0, 0.003921569, 1, 1,
0.3740269, 0.3482682, 0.9105301, 0.003921569, 0, 1, 1,
0.3779766, -0.3746328, 3.059056, 0.007843138, 0, 1, 1,
0.3784705, -1.122483, 1.435805, 0.01568628, 0, 1, 1,
0.3797545, -1.735725, 2.180717, 0.01960784, 0, 1, 1,
0.3865672, -0.7872533, 0.9550472, 0.02745098, 0, 1, 1,
0.3883335, -1.062577, 2.99773, 0.03137255, 0, 1, 1,
0.3893157, 2.118545, 1.331415, 0.03921569, 0, 1, 1,
0.3903027, 0.1655359, 0.06426909, 0.04313726, 0, 1, 1,
0.3906784, -1.787168, 3.768711, 0.05098039, 0, 1, 1,
0.3992139, 1.720864, 1.530603, 0.05490196, 0, 1, 1,
0.4009988, -0.05870438, 1.958776, 0.0627451, 0, 1, 1,
0.4011875, -0.7028406, 3.638945, 0.06666667, 0, 1, 1,
0.4084214, -1.143, 2.948491, 0.07450981, 0, 1, 1,
0.4087424, 1.19978, -0.2472548, 0.07843138, 0, 1, 1,
0.4104795, 0.9622876, 0.8656716, 0.08627451, 0, 1, 1,
0.4151902, -0.3379822, 2.217409, 0.09019608, 0, 1, 1,
0.4307231, -0.9855543, 3.305049, 0.09803922, 0, 1, 1,
0.4389192, -0.3088728, 1.112187, 0.1058824, 0, 1, 1,
0.4400801, -0.2988803, 2.638165, 0.1098039, 0, 1, 1,
0.4403545, -1.116701, 3.833174, 0.1176471, 0, 1, 1,
0.441888, 0.6683195, 0.4466217, 0.1215686, 0, 1, 1,
0.4430974, 0.05433203, 1.868624, 0.1294118, 0, 1, 1,
0.4485195, -0.201779, 1.662867, 0.1333333, 0, 1, 1,
0.4560005, 0.382095, -0.09111831, 0.1411765, 0, 1, 1,
0.458553, -0.5829927, 2.243035, 0.145098, 0, 1, 1,
0.4599707, -0.7705396, 2.804134, 0.1529412, 0, 1, 1,
0.4619178, 1.964968, -1.123438, 0.1568628, 0, 1, 1,
0.4626609, 0.4505688, 2.520633, 0.1647059, 0, 1, 1,
0.4641539, -0.4845529, 2.231242, 0.1686275, 0, 1, 1,
0.4664089, 1.616875, -0.3336264, 0.1764706, 0, 1, 1,
0.4715421, 0.137057, 1.414007, 0.1803922, 0, 1, 1,
0.4729396, 0.2313525, 0.7016124, 0.1882353, 0, 1, 1,
0.4729931, 0.1964844, 0.4268398, 0.1921569, 0, 1, 1,
0.476067, 0.6879955, 0.4063066, 0.2, 0, 1, 1,
0.4801219, 2.054766, -1.364409, 0.2078431, 0, 1, 1,
0.4804721, -0.1470213, 1.787225, 0.2117647, 0, 1, 1,
0.491106, 0.2038957, 1.096716, 0.2196078, 0, 1, 1,
0.4911859, 2.852179, -0.7130919, 0.2235294, 0, 1, 1,
0.4961179, -1.51038, 3.584682, 0.2313726, 0, 1, 1,
0.4973503, -0.9379185, 3.329203, 0.2352941, 0, 1, 1,
0.5069929, -1.185499, 3.177076, 0.2431373, 0, 1, 1,
0.511029, 0.9960487, -0.5361027, 0.2470588, 0, 1, 1,
0.5165277, -1.161167, 3.184762, 0.254902, 0, 1, 1,
0.5172518, -0.5828934, 1.828913, 0.2588235, 0, 1, 1,
0.5180035, 1.22737, 0.2978452, 0.2666667, 0, 1, 1,
0.5198292, 2.285635, 0.5583583, 0.2705882, 0, 1, 1,
0.524949, 0.1817476, 1.339659, 0.2784314, 0, 1, 1,
0.5287877, -1.284588, 1.794434, 0.282353, 0, 1, 1,
0.5297893, -0.3008897, 1.455722, 0.2901961, 0, 1, 1,
0.5306704, -1.103383, 0.7975695, 0.2941177, 0, 1, 1,
0.5365945, 0.01477089, 4.040256, 0.3019608, 0, 1, 1,
0.537438, -0.2674164, 2.481603, 0.3098039, 0, 1, 1,
0.5404878, 0.9619358, 2.312448, 0.3137255, 0, 1, 1,
0.5431812, 0.2884266, 0.7382872, 0.3215686, 0, 1, 1,
0.5436356, 0.2949591, 2.628963, 0.3254902, 0, 1, 1,
0.5460076, 2.364974, 2.091061, 0.3333333, 0, 1, 1,
0.552752, 1.875137, 2.048796, 0.3372549, 0, 1, 1,
0.5541669, -0.1788441, 1.088317, 0.345098, 0, 1, 1,
0.5680763, -0.03809366, 1.434327, 0.3490196, 0, 1, 1,
0.573445, 0.3182062, 0.1727314, 0.3568628, 0, 1, 1,
0.5764215, 1.410286, -1.198975, 0.3607843, 0, 1, 1,
0.5797241, 1.848822, 0.02446195, 0.3686275, 0, 1, 1,
0.5915306, -0.1110605, 3.378365, 0.372549, 0, 1, 1,
0.5943695, 0.3304381, 1.064127, 0.3803922, 0, 1, 1,
0.5994297, -0.7247282, 3.461027, 0.3843137, 0, 1, 1,
0.6010734, -0.2516107, 0.9926955, 0.3921569, 0, 1, 1,
0.6015432, 0.4083686, -0.4478581, 0.3960784, 0, 1, 1,
0.6027405, 0.6570233, 0.3796153, 0.4039216, 0, 1, 1,
0.6066168, -1.176623, 3.836839, 0.4117647, 0, 1, 1,
0.6076487, -0.8829544, 1.274393, 0.4156863, 0, 1, 1,
0.6077455, -1.14888, 2.749598, 0.4235294, 0, 1, 1,
0.608496, -0.6815128, 2.064168, 0.427451, 0, 1, 1,
0.6138411, -0.1502754, 2.477909, 0.4352941, 0, 1, 1,
0.6206307, -0.256167, 1.442275, 0.4392157, 0, 1, 1,
0.6207935, 0.9057366, 0.8083687, 0.4470588, 0, 1, 1,
0.622036, -1.271996, 2.513479, 0.4509804, 0, 1, 1,
0.6269966, 1.627331, 0.4954738, 0.4588235, 0, 1, 1,
0.6332112, 0.1674192, 1.088152, 0.4627451, 0, 1, 1,
0.6341531, -0.127413, 2.458328, 0.4705882, 0, 1, 1,
0.6380934, -0.4761877, 2.230431, 0.4745098, 0, 1, 1,
0.63877, 0.04561954, 1.631947, 0.4823529, 0, 1, 1,
0.6406646, -0.6196228, 1.934497, 0.4862745, 0, 1, 1,
0.6435701, -0.05820461, 2.358279, 0.4941176, 0, 1, 1,
0.6441554, -0.7798391, 3.080838, 0.5019608, 0, 1, 1,
0.6552135, -1.340885, 1.451954, 0.5058824, 0, 1, 1,
0.6616578, -0.8801535, 3.626618, 0.5137255, 0, 1, 1,
0.6618101, 0.3504629, 1.685651, 0.5176471, 0, 1, 1,
0.6644024, -0.7193598, 3.258571, 0.5254902, 0, 1, 1,
0.6675135, 1.348377, -1.097166, 0.5294118, 0, 1, 1,
0.6692292, -0.983505, 1.789288, 0.5372549, 0, 1, 1,
0.6701834, -1.0458, 3.870214, 0.5411765, 0, 1, 1,
0.6740292, 1.015532, 2.375454, 0.5490196, 0, 1, 1,
0.682364, -0.3784404, 1.500575, 0.5529412, 0, 1, 1,
0.6862935, 0.3737508, 1.099605, 0.5607843, 0, 1, 1,
0.6879882, 1.253114, 0.827476, 0.5647059, 0, 1, 1,
0.6885398, -1.694389, 3.009357, 0.572549, 0, 1, 1,
0.6942496, 1.124031, 1.141814, 0.5764706, 0, 1, 1,
0.6966497, 0.2231611, 2.551232, 0.5843138, 0, 1, 1,
0.7090935, -0.001634811, 1.981819, 0.5882353, 0, 1, 1,
0.7125711, 1.050323, -0.1480166, 0.5960785, 0, 1, 1,
0.7129058, -1.267391, 2.952401, 0.6039216, 0, 1, 1,
0.7143636, -0.878702, 2.652529, 0.6078432, 0, 1, 1,
0.7170514, -1.49787, 3.385042, 0.6156863, 0, 1, 1,
0.7243935, 0.9635442, 0.270747, 0.6196079, 0, 1, 1,
0.7257664, -1.087272, 2.985923, 0.627451, 0, 1, 1,
0.729939, 0.3553763, -1.121483, 0.6313726, 0, 1, 1,
0.7350323, 0.7819004, -0.484792, 0.6392157, 0, 1, 1,
0.7357135, 0.4715384, 3.927228, 0.6431373, 0, 1, 1,
0.7372258, -2.257186, 3.332614, 0.6509804, 0, 1, 1,
0.7497575, 0.7944941, 0.9272736, 0.654902, 0, 1, 1,
0.7521352, -0.3875496, 2.433025, 0.6627451, 0, 1, 1,
0.7568156, -1.143957, 1.919835, 0.6666667, 0, 1, 1,
0.7612038, 1.116591, 0.08674843, 0.6745098, 0, 1, 1,
0.7651018, 0.3516031, 0.4691048, 0.6784314, 0, 1, 1,
0.766453, 1.080407, 1.198958, 0.6862745, 0, 1, 1,
0.7664928, 0.9877408, -1.812053, 0.6901961, 0, 1, 1,
0.7670429, -0.7054204, 2.882601, 0.6980392, 0, 1, 1,
0.7730042, -0.1305698, 1.413107, 0.7058824, 0, 1, 1,
0.7744416, -0.8822373, 0.4729088, 0.7098039, 0, 1, 1,
0.7876558, -1.153839, 3.716398, 0.7176471, 0, 1, 1,
0.7880456, 0.7979085, 1.561524, 0.7215686, 0, 1, 1,
0.7891225, -1.399405, 3.057373, 0.7294118, 0, 1, 1,
0.7893111, 0.2689608, 1.292789, 0.7333333, 0, 1, 1,
0.7959326, -1.687451, 4.603384, 0.7411765, 0, 1, 1,
0.8069979, -0.286845, 3.233675, 0.7450981, 0, 1, 1,
0.8128459, -1.216233, 2.521166, 0.7529412, 0, 1, 1,
0.8175845, 0.4368736, 0.1848312, 0.7568628, 0, 1, 1,
0.8204711, -0.06381117, 0.7932826, 0.7647059, 0, 1, 1,
0.8206794, -0.4631038, 1.019918, 0.7686275, 0, 1, 1,
0.8225802, -0.4566886, 2.256982, 0.7764706, 0, 1, 1,
0.8227739, 0.7281112, 0.1611458, 0.7803922, 0, 1, 1,
0.8239737, 0.9596866, 1.524554, 0.7882353, 0, 1, 1,
0.8280361, -1.021302, 3.714219, 0.7921569, 0, 1, 1,
0.8299862, -0.01402131, 0.8545573, 0.8, 0, 1, 1,
0.8323606, 0.252511, 0.4353793, 0.8078431, 0, 1, 1,
0.8355058, -1.019435, 1.958787, 0.8117647, 0, 1, 1,
0.8405806, -0.07592645, 0.9603756, 0.8196079, 0, 1, 1,
0.8450674, -0.4036643, 1.070137, 0.8235294, 0, 1, 1,
0.8558607, -0.8565332, 0.9396219, 0.8313726, 0, 1, 1,
0.8565359, 0.3820998, 1.377911, 0.8352941, 0, 1, 1,
0.858028, -1.028746, 2.68141, 0.8431373, 0, 1, 1,
0.8625387, -2.135423, 2.05147, 0.8470588, 0, 1, 1,
0.8642833, -0.3763349, 3.075915, 0.854902, 0, 1, 1,
0.872521, -0.6186779, 1.694496, 0.8588235, 0, 1, 1,
0.876242, 0.09055848, 1.460986, 0.8666667, 0, 1, 1,
0.878343, 1.494974, 0.6560543, 0.8705882, 0, 1, 1,
0.880973, -0.3409915, 1.282495, 0.8784314, 0, 1, 1,
0.8822483, -0.3084293, 1.558185, 0.8823529, 0, 1, 1,
0.8823887, -0.4429653, 0.5786293, 0.8901961, 0, 1, 1,
0.8891989, 1.867361, 1.131843, 0.8941177, 0, 1, 1,
0.8898941, -0.2063135, 0.5469038, 0.9019608, 0, 1, 1,
0.8912921, 0.9957965, 1.669922, 0.9098039, 0, 1, 1,
0.8924777, 2.158003, 2.624409, 0.9137255, 0, 1, 1,
0.8946325, 0.1045936, 1.686869, 0.9215686, 0, 1, 1,
0.8954284, -2.113971, 2.850696, 0.9254902, 0, 1, 1,
0.9004465, 0.2002955, 1.595903, 0.9333333, 0, 1, 1,
0.9042088, 0.2490915, 1.417411, 0.9372549, 0, 1, 1,
0.9054132, 1.359511, -0.3067394, 0.945098, 0, 1, 1,
0.9090118, 1.097258, 0.08206198, 0.9490196, 0, 1, 1,
0.9119107, 0.3205734, 1.340074, 0.9568627, 0, 1, 1,
0.9119951, 0.4448099, -0.7278363, 0.9607843, 0, 1, 1,
0.9162006, 1.428318, 0.06834541, 0.9686275, 0, 1, 1,
0.9164131, -0.5399947, 1.252398, 0.972549, 0, 1, 1,
0.9195623, -0.4794962, 2.138342, 0.9803922, 0, 1, 1,
0.9198489, 0.8394095, 1.057663, 0.9843137, 0, 1, 1,
0.9220596, -0.002115973, 1.194714, 0.9921569, 0, 1, 1,
0.9225871, -0.4164257, 0.4557047, 0.9960784, 0, 1, 1,
0.9242432, 0.6735261, 0.506525, 1, 0, 0.9960784, 1,
0.9251667, -0.747299, 2.564991, 1, 0, 0.9882353, 1,
0.9275138, -1.119225, 3.686351, 1, 0, 0.9843137, 1,
0.9291723, -0.6464968, 2.548433, 1, 0, 0.9764706, 1,
0.9375806, 1.584287, 1.274841, 1, 0, 0.972549, 1,
0.9380972, -1.053396, 3.633285, 1, 0, 0.9647059, 1,
0.9443185, 0.9188171, 2.187742, 1, 0, 0.9607843, 1,
0.9539151, 0.8424476, 1.016127, 1, 0, 0.9529412, 1,
0.954095, -1.424106, 1.793503, 1, 0, 0.9490196, 1,
0.956773, 0.713049, 0.3208461, 1, 0, 0.9411765, 1,
0.957396, -0.7161489, 3.216393, 1, 0, 0.9372549, 1,
0.9577998, -0.6483499, 1.633491, 1, 0, 0.9294118, 1,
0.963328, 0.02198146, 1.432731, 1, 0, 0.9254902, 1,
0.9637166, 0.3230843, 1.550849, 1, 0, 0.9176471, 1,
0.9726011, -1.527357, 2.646525, 1, 0, 0.9137255, 1,
0.9777873, -0.3288445, 1.647822, 1, 0, 0.9058824, 1,
0.9794343, 0.8257762, -0.03029342, 1, 0, 0.9019608, 1,
0.9859018, 0.5412444, 2.48189, 1, 0, 0.8941177, 1,
0.991565, -0.9506465, 2.756737, 1, 0, 0.8862745, 1,
0.9920734, -0.4365021, 1.469048, 1, 0, 0.8823529, 1,
0.9930888, 0.4255536, 0.7679006, 1, 0, 0.8745098, 1,
0.9994748, 0.9934132, 1.260928, 1, 0, 0.8705882, 1,
1.003073, -1.548105, 2.842538, 1, 0, 0.8627451, 1,
1.005659, 0.1269494, 1.442476, 1, 0, 0.8588235, 1,
1.006092, -1.574011, 1.592069, 1, 0, 0.8509804, 1,
1.006338, -1.891857, 3.014609, 1, 0, 0.8470588, 1,
1.013522, -0.06432939, 2.404699, 1, 0, 0.8392157, 1,
1.02131, 0.2394205, 2.433173, 1, 0, 0.8352941, 1,
1.021842, -2.921098, 1.305012, 1, 0, 0.827451, 1,
1.022169, 1.869532, -0.1770797, 1, 0, 0.8235294, 1,
1.022904, 0.8764859, 1.158019, 1, 0, 0.8156863, 1,
1.02626, -0.5928499, 1.38548, 1, 0, 0.8117647, 1,
1.029384, 0.4321256, 1.944409, 1, 0, 0.8039216, 1,
1.033886, 2.972074, 0.915334, 1, 0, 0.7960784, 1,
1.036799, -0.9058487, 1.208572, 1, 0, 0.7921569, 1,
1.063549, -0.8016555, 2.422611, 1, 0, 0.7843137, 1,
1.065608, 1.333643, 2.357066, 1, 0, 0.7803922, 1,
1.067482, 0.7271507, 2.561887, 1, 0, 0.772549, 1,
1.072048, -0.08634634, 2.763573, 1, 0, 0.7686275, 1,
1.080802, 0.3107367, 2.323062, 1, 0, 0.7607843, 1,
1.083468, -0.107736, 1.268341, 1, 0, 0.7568628, 1,
1.083665, -0.6410097, 2.796334, 1, 0, 0.7490196, 1,
1.094914, 0.9540091, 0.1215564, 1, 0, 0.7450981, 1,
1.103637, 1.475452, 2.363316, 1, 0, 0.7372549, 1,
1.109073, 1.199847, -0.1004914, 1, 0, 0.7333333, 1,
1.116201, 0.3201239, 2.096646, 1, 0, 0.7254902, 1,
1.12732, 0.01406628, 1.054651, 1, 0, 0.7215686, 1,
1.128054, -0.3966694, 1.466493, 1, 0, 0.7137255, 1,
1.131627, 0.2986948, -0.08269163, 1, 0, 0.7098039, 1,
1.141255, 0.7005507, 0.08608399, 1, 0, 0.7019608, 1,
1.144152, 1.183815, 1.710952, 1, 0, 0.6941177, 1,
1.154399, 0.7846128, 0.9959595, 1, 0, 0.6901961, 1,
1.157859, 0.05799125, 0.9510819, 1, 0, 0.682353, 1,
1.16072, 0.31431, 0.2952548, 1, 0, 0.6784314, 1,
1.173691, -0.619311, 2.919797, 1, 0, 0.6705883, 1,
1.180476, -1.177787, 2.091924, 1, 0, 0.6666667, 1,
1.193508, -2.819244, 1.456446, 1, 0, 0.6588235, 1,
1.19748, -0.3127893, 2.938498, 1, 0, 0.654902, 1,
1.201512, -0.3462869, 1.811709, 1, 0, 0.6470588, 1,
1.208605, -0.3192677, 1.223533, 1, 0, 0.6431373, 1,
1.2114, -1.345, 2.076573, 1, 0, 0.6352941, 1,
1.218674, -0.7582891, 4.01827, 1, 0, 0.6313726, 1,
1.220733, -0.3736635, 1.797599, 1, 0, 0.6235294, 1,
1.239656, 0.4891371, 2.014471, 1, 0, 0.6196079, 1,
1.243932, -0.1125286, 1.092189, 1, 0, 0.6117647, 1,
1.245447, 1.736323, -0.1700575, 1, 0, 0.6078432, 1,
1.254305, -0.9908729, 1.815213, 1, 0, 0.6, 1,
1.26386, -0.04273091, 1.255193, 1, 0, 0.5921569, 1,
1.265124, 0.6520894, 0.2195523, 1, 0, 0.5882353, 1,
1.265293, -0.8969128, 1.326599, 1, 0, 0.5803922, 1,
1.268999, -0.9797187, 0.7962747, 1, 0, 0.5764706, 1,
1.271869, -1.60778, 3.803575, 1, 0, 0.5686275, 1,
1.281165, 0.8640183, 0.004851081, 1, 0, 0.5647059, 1,
1.282494, 0.1844728, 1.926405, 1, 0, 0.5568628, 1,
1.294412, 0.04257372, 2.449751, 1, 0, 0.5529412, 1,
1.298986, -1.015373, 1.742921, 1, 0, 0.5450981, 1,
1.300525, 0.899216, 1.698496, 1, 0, 0.5411765, 1,
1.304279, -1.049702, 2.367142, 1, 0, 0.5333334, 1,
1.304283, -0.5157101, 1.77825, 1, 0, 0.5294118, 1,
1.306085, 1.295223, 1.845351, 1, 0, 0.5215687, 1,
1.306234, -2.075314, 3.998445, 1, 0, 0.5176471, 1,
1.307994, -0.7119369, -0.2925172, 1, 0, 0.509804, 1,
1.311375, 1.66387, 1.848406, 1, 0, 0.5058824, 1,
1.3222, -0.6723562, 1.569214, 1, 0, 0.4980392, 1,
1.334459, 0.9489485, 0.4818783, 1, 0, 0.4901961, 1,
1.337394, 0.4780855, 2.235981, 1, 0, 0.4862745, 1,
1.339626, 0.2917351, 1.669547, 1, 0, 0.4784314, 1,
1.347997, 1.511934, 1.180411, 1, 0, 0.4745098, 1,
1.351498, 1.507077, 2.048437, 1, 0, 0.4666667, 1,
1.355319, -0.2517144, 2.632154, 1, 0, 0.4627451, 1,
1.370259, -0.2472923, 0.86724, 1, 0, 0.454902, 1,
1.372918, -1.932596, 3.249367, 1, 0, 0.4509804, 1,
1.37927, 1.111508, 1.783969, 1, 0, 0.4431373, 1,
1.392906, -0.938648, 0.3488004, 1, 0, 0.4392157, 1,
1.409934, -1.200904, 3.314724, 1, 0, 0.4313726, 1,
1.410858, -1.796221, 2.10274, 1, 0, 0.427451, 1,
1.431152, -0.2070433, 2.067715, 1, 0, 0.4196078, 1,
1.434674, 0.2649032, 1.872155, 1, 0, 0.4156863, 1,
1.43754, -0.7121587, 1.171305, 1, 0, 0.4078431, 1,
1.442821, -1.35288, 2.71282, 1, 0, 0.4039216, 1,
1.444341, 0.623056, 2.494734, 1, 0, 0.3960784, 1,
1.44487, 0.9339816, 0.4627057, 1, 0, 0.3882353, 1,
1.45163, 0.3755808, 2.510225, 1, 0, 0.3843137, 1,
1.458925, 0.4969137, 2.314922, 1, 0, 0.3764706, 1,
1.460549, -1.03698, 2.056671, 1, 0, 0.372549, 1,
1.463783, -0.8925741, 0.1490277, 1, 0, 0.3647059, 1,
1.465738, 0.3300627, 2.15458, 1, 0, 0.3607843, 1,
1.485008, -0.3961301, 2.357906, 1, 0, 0.3529412, 1,
1.490312, 0.7385298, 1.560439, 1, 0, 0.3490196, 1,
1.493855, -2.060344, 1.182503, 1, 0, 0.3411765, 1,
1.503891, 0.8783013, 0.07284084, 1, 0, 0.3372549, 1,
1.51669, 1.161117, 1.036838, 1, 0, 0.3294118, 1,
1.521636, -1.727237, 3.099942, 1, 0, 0.3254902, 1,
1.533203, 1.253675, 0.3197001, 1, 0, 0.3176471, 1,
1.543216, -1.556558, 1.37039, 1, 0, 0.3137255, 1,
1.550181, 0.4153198, 0.6446, 1, 0, 0.3058824, 1,
1.551077, 1.629812, 1.086353, 1, 0, 0.2980392, 1,
1.586138, -0.2635138, 0.1770924, 1, 0, 0.2941177, 1,
1.596402, 0.5112419, 1.950725, 1, 0, 0.2862745, 1,
1.597921, 1.102837, 1.803034, 1, 0, 0.282353, 1,
1.603069, -1.863226, 3.539956, 1, 0, 0.2745098, 1,
1.649404, 1.145452, 1.047119, 1, 0, 0.2705882, 1,
1.664693, 0.5432534, 2.05003, 1, 0, 0.2627451, 1,
1.669374, 1.361871, -2.099445, 1, 0, 0.2588235, 1,
1.671232, 1.245514, 0.1562583, 1, 0, 0.2509804, 1,
1.69771, -0.5411209, 1.988748, 1, 0, 0.2470588, 1,
1.711904, 2.059005, 1.548166, 1, 0, 0.2392157, 1,
1.714578, -0.004461366, 2.271896, 1, 0, 0.2352941, 1,
1.722678, 0.2944288, 1.033556, 1, 0, 0.227451, 1,
1.731603, -0.3080419, 2.611434, 1, 0, 0.2235294, 1,
1.7436, -0.4208025, 2.105484, 1, 0, 0.2156863, 1,
1.744124, -0.7814683, 1.612373, 1, 0, 0.2117647, 1,
1.745413, 0.162753, 2.442326, 1, 0, 0.2039216, 1,
1.762169, -1.965088, 2.823087, 1, 0, 0.1960784, 1,
1.790017, 0.7264804, 1.648078, 1, 0, 0.1921569, 1,
1.792503, 0.4247344, 2.363413, 1, 0, 0.1843137, 1,
1.793216, 1.934353, 2.506275, 1, 0, 0.1803922, 1,
1.810855, -0.01662012, 0.5609895, 1, 0, 0.172549, 1,
1.850714, -1.191254, 1.947367, 1, 0, 0.1686275, 1,
1.885888, 1.074585, 0.2800235, 1, 0, 0.1607843, 1,
1.905887, -2.265474, 2.229905, 1, 0, 0.1568628, 1,
1.916429, -0.07005703, 1.253207, 1, 0, 0.1490196, 1,
1.942141, 0.0778981, 0.2858727, 1, 0, 0.145098, 1,
1.953956, -1.59099, 2.008109, 1, 0, 0.1372549, 1,
1.997753, 0.3727165, 2.343653, 1, 0, 0.1333333, 1,
2.090169, -0.3746972, 0.4426541, 1, 0, 0.1254902, 1,
2.125166, -0.890788, 4.246496, 1, 0, 0.1215686, 1,
2.149411, 1.549215, -0.6856271, 1, 0, 0.1137255, 1,
2.153668, 0.04829295, 0.650768, 1, 0, 0.1098039, 1,
2.155723, -0.3790002, 2.334639, 1, 0, 0.1019608, 1,
2.196579, -0.275494, 1.94225, 1, 0, 0.09411765, 1,
2.223098, -0.01368455, 1.978286, 1, 0, 0.09019608, 1,
2.29544, 0.4380768, 1.872114, 1, 0, 0.08235294, 1,
2.306038, 0.5644442, 0.4485812, 1, 0, 0.07843138, 1,
2.31669, 1.920301, 1.499812, 1, 0, 0.07058824, 1,
2.352044, 0.7222829, 1.464913, 1, 0, 0.06666667, 1,
2.379146, -0.8713374, 2.733651, 1, 0, 0.05882353, 1,
2.527659, -0.6878685, 2.903898, 1, 0, 0.05490196, 1,
2.533153, 0.8479072, 0.8162539, 1, 0, 0.04705882, 1,
2.624238, -0.5344037, 0.1278283, 1, 0, 0.04313726, 1,
2.631793, -0.1937807, 3.24059, 1, 0, 0.03529412, 1,
2.6463, -0.02612918, 0.5920252, 1, 0, 0.03137255, 1,
2.889562, 0.8167558, 3.007524, 1, 0, 0.02352941, 1,
2.908422, -0.2094888, 0.6696905, 1, 0, 0.01960784, 1,
3.001686, -0.6162139, 2.530777, 1, 0, 0.01176471, 1,
3.566087, 0.9367341, -0.5014355, 1, 0, 0.007843138, 1
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
-0.0243963, -4.863863, -7.343421, 0, -0.5, 0.5, 0.5,
-0.0243963, -4.863863, -7.343421, 1, -0.5, 0.5, 0.5,
-0.0243963, -4.863863, -7.343421, 1, 1.5, 0.5, 0.5,
-0.0243963, -4.863863, -7.343421, 0, 1.5, 0.5, 0.5
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
-4.832053, -0.2090008, -7.343421, 0, -0.5, 0.5, 0.5,
-4.832053, -0.2090008, -7.343421, 1, -0.5, 0.5, 0.5,
-4.832053, -0.2090008, -7.343421, 1, 1.5, 0.5, 0.5,
-4.832053, -0.2090008, -7.343421, 0, 1.5, 0.5, 0.5
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
-4.832053, -4.863863, -0.2418749, 0, -0.5, 0.5, 0.5,
-4.832053, -4.863863, -0.2418749, 1, -0.5, 0.5, 0.5,
-4.832053, -4.863863, -0.2418749, 1, 1.5, 0.5, 0.5,
-4.832053, -4.863863, -0.2418749, 0, 1.5, 0.5, 0.5
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
-2, -3.789664, -5.704603,
2, -3.789664, -5.704603,
-2, -3.789664, -5.704603,
-2, -3.968697, -5.977739,
0, -3.789664, -5.704603,
0, -3.968697, -5.977739,
2, -3.789664, -5.704603,
2, -3.968697, -5.977739
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
-2, -4.326763, -6.524013, 0, -0.5, 0.5, 0.5,
-2, -4.326763, -6.524013, 1, -0.5, 0.5, 0.5,
-2, -4.326763, -6.524013, 1, 1.5, 0.5, 0.5,
-2, -4.326763, -6.524013, 0, 1.5, 0.5, 0.5,
0, -4.326763, -6.524013, 0, -0.5, 0.5, 0.5,
0, -4.326763, -6.524013, 1, -0.5, 0.5, 0.5,
0, -4.326763, -6.524013, 1, 1.5, 0.5, 0.5,
0, -4.326763, -6.524013, 0, 1.5, 0.5, 0.5,
2, -4.326763, -6.524013, 0, -0.5, 0.5, 0.5,
2, -4.326763, -6.524013, 1, -0.5, 0.5, 0.5,
2, -4.326763, -6.524013, 1, 1.5, 0.5, 0.5,
2, -4.326763, -6.524013, 0, 1.5, 0.5, 0.5
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
-3.722594, -3, -5.704603,
-3.722594, 3, -5.704603,
-3.722594, -3, -5.704603,
-3.907503, -3, -5.977739,
-3.722594, -2, -5.704603,
-3.907503, -2, -5.977739,
-3.722594, -1, -5.704603,
-3.907503, -1, -5.977739,
-3.722594, 0, -5.704603,
-3.907503, 0, -5.977739,
-3.722594, 1, -5.704603,
-3.907503, 1, -5.977739,
-3.722594, 2, -5.704603,
-3.907503, 2, -5.977739,
-3.722594, 3, -5.704603,
-3.907503, 3, -5.977739
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
-4.277323, -3, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, -3, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, -3, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, -3, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, -2, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, -2, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, -2, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, -2, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, -1, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, -1, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, -1, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, -1, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, 0, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, 0, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, 0, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, 0, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, 1, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, 1, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, 1, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, 1, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, 2, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, 2, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, 2, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, 2, -6.524013, 0, 1.5, 0.5, 0.5,
-4.277323, 3, -6.524013, 0, -0.5, 0.5, 0.5,
-4.277323, 3, -6.524013, 1, -0.5, 0.5, 0.5,
-4.277323, 3, -6.524013, 1, 1.5, 0.5, 0.5,
-4.277323, 3, -6.524013, 0, 1.5, 0.5, 0.5
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
-3.722594, -3.789664, -4,
-3.722594, -3.789664, 4,
-3.722594, -3.789664, -4,
-3.907503, -3.968697, -4,
-3.722594, -3.789664, -2,
-3.907503, -3.968697, -2,
-3.722594, -3.789664, 0,
-3.907503, -3.968697, 0,
-3.722594, -3.789664, 2,
-3.907503, -3.968697, 2,
-3.722594, -3.789664, 4,
-3.907503, -3.968697, 4
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
-4.277323, -4.326763, -4, 0, -0.5, 0.5, 0.5,
-4.277323, -4.326763, -4, 1, -0.5, 0.5, 0.5,
-4.277323, -4.326763, -4, 1, 1.5, 0.5, 0.5,
-4.277323, -4.326763, -4, 0, 1.5, 0.5, 0.5,
-4.277323, -4.326763, -2, 0, -0.5, 0.5, 0.5,
-4.277323, -4.326763, -2, 1, -0.5, 0.5, 0.5,
-4.277323, -4.326763, -2, 1, 1.5, 0.5, 0.5,
-4.277323, -4.326763, -2, 0, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 0, 0, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 0, 1, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 0, 1, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 0, 0, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 2, 0, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 2, 1, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 2, 1, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 2, 0, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 4, 0, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 4, 1, -0.5, 0.5, 0.5,
-4.277323, -4.326763, 4, 1, 1.5, 0.5, 0.5,
-4.277323, -4.326763, 4, 0, 1.5, 0.5, 0.5
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
-3.722594, -3.789664, -5.704603,
-3.722594, 3.371662, -5.704603,
-3.722594, -3.789664, 5.220853,
-3.722594, 3.371662, 5.220853,
-3.722594, -3.789664, -5.704603,
-3.722594, -3.789664, 5.220853,
-3.722594, 3.371662, -5.704603,
-3.722594, 3.371662, 5.220853,
-3.722594, -3.789664, -5.704603,
3.673801, -3.789664, -5.704603,
-3.722594, -3.789664, 5.220853,
3.673801, -3.789664, 5.220853,
-3.722594, 3.371662, -5.704603,
3.673801, 3.371662, -5.704603,
-3.722594, 3.371662, 5.220853,
3.673801, 3.371662, 5.220853,
3.673801, -3.789664, -5.704603,
3.673801, 3.371662, -5.704603,
3.673801, -3.789664, 5.220853,
3.673801, 3.371662, 5.220853,
3.673801, -3.789664, -5.704603,
3.673801, -3.789664, 5.220853,
3.673801, 3.371662, -5.704603,
3.673801, 3.371662, 5.220853
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
var radius = 8.016058;
var distance = 35.66434;
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
mvMatrix.translate( 0.0243963, 0.2090008, 0.2418749 );
mvMatrix.scale( 1.171803, 1.210267, 0.7932958 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.66434);
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
Chlordene<-read.table("Chlordene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlordene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlordene' not found
```

```r
y<-Chlordene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlordene' not found
```

```r
z<-Chlordene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlordene' not found
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
-3.614879, 0.04652413, -1.742955, 0, 0, 1, 1, 1,
-3.363934, 2.505139, -2.561215, 1, 0, 0, 1, 1,
-3.210672, -0.4029719, -3.852815, 1, 0, 0, 1, 1,
-2.931067, 0.550813, -0.6965087, 1, 0, 0, 1, 1,
-2.824228, -0.9935579, -4.085357, 1, 0, 0, 1, 1,
-2.738941, 1.088971, -1.721082, 1, 0, 0, 1, 1,
-2.593513, -0.3906981, -0.9257532, 0, 0, 0, 1, 1,
-2.558525, -0.3083061, -2.005462, 0, 0, 0, 1, 1,
-2.509269, -1.314999, -0.8606054, 0, 0, 0, 1, 1,
-2.458286, 0.6736653, -2.599047, 0, 0, 0, 1, 1,
-2.42692, -0.5708784, -1.861475, 0, 0, 0, 1, 1,
-2.397806, -0.1304211, -2.040206, 0, 0, 0, 1, 1,
-2.387976, 1.492763, 1.848365, 0, 0, 0, 1, 1,
-2.376327, 1.311195, -1.614915, 1, 1, 1, 1, 1,
-2.310747, 1.154751, -2.765709, 1, 1, 1, 1, 1,
-2.300746, 0.9054782, -1.787724, 1, 1, 1, 1, 1,
-2.147285, -0.4317749, -0.817415, 1, 1, 1, 1, 1,
-2.136973, -0.5698743, -1.251054, 1, 1, 1, 1, 1,
-2.128412, -0.0333804, -2.023336, 1, 1, 1, 1, 1,
-2.065711, -1.470638, -0.9946567, 1, 1, 1, 1, 1,
-2.041246, 0.05783855, -1.182024, 1, 1, 1, 1, 1,
-2.038924, 0.1338823, -1.49805, 1, 1, 1, 1, 1,
-2.035508, 0.3456577, -1.604689, 1, 1, 1, 1, 1,
-2.03142, 1.758252, -1.002693, 1, 1, 1, 1, 1,
-2.025422, -0.4006531, -1.582106, 1, 1, 1, 1, 1,
-2.005403, -0.9366661, -0.537925, 1, 1, 1, 1, 1,
-2.001336, 0.390273, -1.50016, 1, 1, 1, 1, 1,
-1.959307, 1.014219, -2.047967, 1, 1, 1, 1, 1,
-1.958253, -1.129336, -1.527094, 0, 0, 1, 1, 1,
-1.944173, -1.27431, -2.407391, 1, 0, 0, 1, 1,
-1.93989, 0.8183942, -0.08782095, 1, 0, 0, 1, 1,
-1.904206, -0.1173232, -3.155166, 1, 0, 0, 1, 1,
-1.895923, 0.1491401, -1.048766, 1, 0, 0, 1, 1,
-1.886161, 0.5664833, -1.885129, 1, 0, 0, 1, 1,
-1.865936, -1.771038, -3.183785, 0, 0, 0, 1, 1,
-1.842305, 1.025206, -1.89582, 0, 0, 0, 1, 1,
-1.839684, 0.3035074, -2.007727, 0, 0, 0, 1, 1,
-1.819683, -1.89512, -2.504577, 0, 0, 0, 1, 1,
-1.814338, 1.239752, -1.135458, 0, 0, 0, 1, 1,
-1.766532, -0.5391431, -1.955613, 0, 0, 0, 1, 1,
-1.761488, -0.6705635, -3.733635, 0, 0, 0, 1, 1,
-1.712279, -1.170459, -2.415645, 1, 1, 1, 1, 1,
-1.711677, -0.1623501, -1.886634, 1, 1, 1, 1, 1,
-1.675282, 0.06803198, 0.461746, 1, 1, 1, 1, 1,
-1.654434, 1.422984, -1.550607, 1, 1, 1, 1, 1,
-1.645046, 0.166118, -0.5665367, 1, 1, 1, 1, 1,
-1.60168, -0.9004036, -1.684101, 1, 1, 1, 1, 1,
-1.601306, 0.1254481, -1.521491, 1, 1, 1, 1, 1,
-1.5978, -1.793234, -5.157283, 1, 1, 1, 1, 1,
-1.590467, 0.3331642, -0.1239479, 1, 1, 1, 1, 1,
-1.58379, 1.005925, -0.5487034, 1, 1, 1, 1, 1,
-1.574823, 0.2446782, -2.448204, 1, 1, 1, 1, 1,
-1.573577, -0.4722146, -1.673416, 1, 1, 1, 1, 1,
-1.573395, -1.07796, -2.522101, 1, 1, 1, 1, 1,
-1.572878, 0.09862542, -3.258191, 1, 1, 1, 1, 1,
-1.571019, -0.2533451, -1.888775, 1, 1, 1, 1, 1,
-1.568265, 2.519955, 0.1413579, 0, 0, 1, 1, 1,
-1.562669, -0.1299357, -0.9897984, 1, 0, 0, 1, 1,
-1.556957, 1.121728, -0.5926172, 1, 0, 0, 1, 1,
-1.551117, 1.040159, -0.07574574, 1, 0, 0, 1, 1,
-1.55073, 1.418549, -2.204952, 1, 0, 0, 1, 1,
-1.521801, -0.7750879, -1.434389, 1, 0, 0, 1, 1,
-1.520587, 2.105806, -0.8269107, 0, 0, 0, 1, 1,
-1.516153, -1.874296, -2.273958, 0, 0, 0, 1, 1,
-1.515831, -0.3744876, -0.04173234, 0, 0, 0, 1, 1,
-1.5043, -0.8583683, -1.113985, 0, 0, 0, 1, 1,
-1.50026, -0.8968763, -4.255484, 0, 0, 0, 1, 1,
-1.497393, -0.7740675, -2.715716, 0, 0, 0, 1, 1,
-1.496565, 0.6384476, -0.5363494, 0, 0, 0, 1, 1,
-1.490595, 0.9896036, -0.8573785, 1, 1, 1, 1, 1,
-1.478024, 0.6664767, -1.54425, 1, 1, 1, 1, 1,
-1.474456, -0.04073139, -1.587257, 1, 1, 1, 1, 1,
-1.471545, 0.9176536, -0.239044, 1, 1, 1, 1, 1,
-1.471459, -0.5148121, -0.7507874, 1, 1, 1, 1, 1,
-1.470371, -0.7910275, -1.747951, 1, 1, 1, 1, 1,
-1.465541, 1.510986, 0.7726241, 1, 1, 1, 1, 1,
-1.462061, 1.111402, -0.7211934, 1, 1, 1, 1, 1,
-1.462013, 1.063137, 1.19861, 1, 1, 1, 1, 1,
-1.455916, 1.441481, -1.497494, 1, 1, 1, 1, 1,
-1.437629, -0.6118643, -2.149183, 1, 1, 1, 1, 1,
-1.437076, -1.867489, -2.252789, 1, 1, 1, 1, 1,
-1.43531, 0.1304646, -1.293504, 1, 1, 1, 1, 1,
-1.432244, 0.2887662, -1.301658, 1, 1, 1, 1, 1,
-1.432212, -0.4323456, 0.8000963, 1, 1, 1, 1, 1,
-1.422736, -0.9100583, -1.148564, 0, 0, 1, 1, 1,
-1.421271, 0.6925661, -1.084098, 1, 0, 0, 1, 1,
-1.418661, 1.285967, -1.168725, 1, 0, 0, 1, 1,
-1.418571, 0.8169236, -1.358539, 1, 0, 0, 1, 1,
-1.415297, -1.066542, -1.125872, 1, 0, 0, 1, 1,
-1.411038, 1.210561, -1.406624, 1, 0, 0, 1, 1,
-1.396859, -0.07406601, -0.8802374, 0, 0, 0, 1, 1,
-1.392241, -1.121695, -3.020204, 0, 0, 0, 1, 1,
-1.374788, -0.8939686, -1.594821, 0, 0, 0, 1, 1,
-1.374539, 0.4825471, -1.490859, 0, 0, 0, 1, 1,
-1.35904, -1.667881, -1.908404, 0, 0, 0, 1, 1,
-1.355773, -2.052801, -2.869954, 0, 0, 0, 1, 1,
-1.340584, 1.036087, -0.710849, 0, 0, 0, 1, 1,
-1.328579, 0.7443584, -1.680757, 1, 1, 1, 1, 1,
-1.328076, -0.2406836, -2.175642, 1, 1, 1, 1, 1,
-1.323714, 0.3081696, -0.3596731, 1, 1, 1, 1, 1,
-1.321308, 1.081725, -0.7597088, 1, 1, 1, 1, 1,
-1.318267, -1.460257, -3.645899, 1, 1, 1, 1, 1,
-1.317597, -1.403578, -2.407545, 1, 1, 1, 1, 1,
-1.317465, 0.05324754, -1.726055, 1, 1, 1, 1, 1,
-1.313302, 1.011791, -0.3703268, 1, 1, 1, 1, 1,
-1.300782, -0.9875665, -2.134844, 1, 1, 1, 1, 1,
-1.293981, -0.6509923, -2.5096, 1, 1, 1, 1, 1,
-1.293135, 1.711085, -0.1435584, 1, 1, 1, 1, 1,
-1.288921, -0.7643225, -0.943024, 1, 1, 1, 1, 1,
-1.285649, -0.446703, -1.143411, 1, 1, 1, 1, 1,
-1.28518, -0.2250706, -2.799319, 1, 1, 1, 1, 1,
-1.284831, -1.05818, -1.409561, 1, 1, 1, 1, 1,
-1.278959, 0.2314555, -2.518504, 0, 0, 1, 1, 1,
-1.256851, 0.000493318, -1.928024, 1, 0, 0, 1, 1,
-1.254383, 0.4018771, -1.679332, 1, 0, 0, 1, 1,
-1.250904, -1.154848, -2.393032, 1, 0, 0, 1, 1,
-1.249382, 0.2147327, -0.06431852, 1, 0, 0, 1, 1,
-1.245422, 0.5796237, -1.433839, 1, 0, 0, 1, 1,
-1.243887, 0.1015562, -2.032994, 0, 0, 0, 1, 1,
-1.24382, 0.9737219, -0.2115557, 0, 0, 0, 1, 1,
-1.23686, 0.2232354, -0.2950433, 0, 0, 0, 1, 1,
-1.232983, 0.9100359, -0.6973122, 0, 0, 0, 1, 1,
-1.212928, 0.3771726, 0.264147, 0, 0, 0, 1, 1,
-1.203346, 0.2113734, -1.175731, 0, 0, 0, 1, 1,
-1.1903, -0.007136067, -1.292339, 0, 0, 0, 1, 1,
-1.188664, -0.236804, -1.17946, 1, 1, 1, 1, 1,
-1.182976, -1.398743, -4.048392, 1, 1, 1, 1, 1,
-1.161281, 1.123746, -0.9087037, 1, 1, 1, 1, 1,
-1.15443, -1.333003, -3.490315, 1, 1, 1, 1, 1,
-1.151973, 0.1388435, -1.949859, 1, 1, 1, 1, 1,
-1.148611, 0.6065471, -0.5892389, 1, 1, 1, 1, 1,
-1.148206, 0.9707255, 0.2104611, 1, 1, 1, 1, 1,
-1.143611, -1.752661, -2.809864, 1, 1, 1, 1, 1,
-1.14015, 0.896015, -0.1943603, 1, 1, 1, 1, 1,
-1.129769, -1.003398, -3.135056, 1, 1, 1, 1, 1,
-1.118044, 0.02182384, -0.1825971, 1, 1, 1, 1, 1,
-1.11442, -0.4231178, -3.974377, 1, 1, 1, 1, 1,
-1.113888, -0.2090876, -1.107759, 1, 1, 1, 1, 1,
-1.110748, 1.578947, 0.01218084, 1, 1, 1, 1, 1,
-1.105101, -1.755689, -1.100449, 1, 1, 1, 1, 1,
-1.093134, -0.819257, -2.985115, 0, 0, 1, 1, 1,
-1.084824, 1.525584, -0.9410065, 1, 0, 0, 1, 1,
-1.079528, 0.9414619, 0.2718263, 1, 0, 0, 1, 1,
-1.067704, -1.258087, -3.937651, 1, 0, 0, 1, 1,
-1.040983, -0.03170788, -0.4826484, 1, 0, 0, 1, 1,
-1.03659, 0.004172482, -2.531252, 1, 0, 0, 1, 1,
-1.03598, 0.9840905, -1.112007, 0, 0, 0, 1, 1,
-1.032431, 0.8686264, -1.398484, 0, 0, 0, 1, 1,
-1.025821, -0.2777149, -1.916318, 0, 0, 0, 1, 1,
-1.023701, 0.24815, -2.169269, 0, 0, 0, 1, 1,
-1.023501, 0.8680972, -0.5245163, 0, 0, 0, 1, 1,
-1.021893, 0.9987166, -0.30234, 0, 0, 0, 1, 1,
-1.020407, 0.625969, -1.740907, 0, 0, 0, 1, 1,
-1.018023, -0.2714033, -2.747139, 1, 1, 1, 1, 1,
-1.007305, -1.211762, -2.377882, 1, 1, 1, 1, 1,
-1.005017, -1.42244, -3.452646, 1, 1, 1, 1, 1,
-1.003055, -0.5272946, -2.602507, 1, 1, 1, 1, 1,
-1.000814, 0.8112956, -0.4551891, 1, 1, 1, 1, 1,
-0.993793, -0.2645042, -1.296778, 1, 1, 1, 1, 1,
-0.9789497, -0.9632311, -2.910949, 1, 1, 1, 1, 1,
-0.9714326, -0.6730173, -3.274009, 1, 1, 1, 1, 1,
-0.9684419, 0.7735623, -0.4252942, 1, 1, 1, 1, 1,
-0.9614831, -1.45002, -1.70866, 1, 1, 1, 1, 1,
-0.9593164, 2.192602, -0.8294179, 1, 1, 1, 1, 1,
-0.9551238, -0.1657403, -1.692058, 1, 1, 1, 1, 1,
-0.9542024, -0.4348103, -1.760844, 1, 1, 1, 1, 1,
-0.9538034, -1.062906, -3.03722, 1, 1, 1, 1, 1,
-0.9525837, 0.8397026, -1.044457, 1, 1, 1, 1, 1,
-0.9502063, 1.907702, 0.15899, 0, 0, 1, 1, 1,
-0.9418091, 0.8227929, -1.553817, 1, 0, 0, 1, 1,
-0.938543, -0.5231971, -3.225153, 1, 0, 0, 1, 1,
-0.9169865, 1.919359, -0.4787945, 1, 0, 0, 1, 1,
-0.9149078, -0.4586356, -2.366186, 1, 0, 0, 1, 1,
-0.9010704, -0.1709952, -1.521497, 1, 0, 0, 1, 1,
-0.8960036, -0.4157239, -2.015412, 0, 0, 0, 1, 1,
-0.8902076, -0.7489952, -2.10903, 0, 0, 0, 1, 1,
-0.8879926, 0.5904854, -0.7366242, 0, 0, 0, 1, 1,
-0.882261, -0.2648001, -3.45489, 0, 0, 0, 1, 1,
-0.8814648, -0.9148529, -4.032218, 0, 0, 0, 1, 1,
-0.8813958, 1.011046, -1.439613, 0, 0, 0, 1, 1,
-0.8778981, -1.078912, -3.136632, 0, 0, 0, 1, 1,
-0.8774285, -0.08119852, -2.006336, 1, 1, 1, 1, 1,
-0.8732591, -1.243951, -2.244933, 1, 1, 1, 1, 1,
-0.8652208, -0.5538784, -1.413865, 1, 1, 1, 1, 1,
-0.8533246, 0.2826694, -2.095833, 1, 1, 1, 1, 1,
-0.8511768, -0.2325898, -1.437329, 1, 1, 1, 1, 1,
-0.8495372, -0.572791, -1.297014, 1, 1, 1, 1, 1,
-0.8476804, 0.2886397, -1.605042, 1, 1, 1, 1, 1,
-0.8455195, 0.06954756, -1.623351, 1, 1, 1, 1, 1,
-0.8417937, -0.5669174, -2.494743, 1, 1, 1, 1, 1,
-0.8397176, 1.004236, -0.8473406, 1, 1, 1, 1, 1,
-0.8374532, -1.050726, -1.888986, 1, 1, 1, 1, 1,
-0.8348715, -0.9596201, -1.167936, 1, 1, 1, 1, 1,
-0.830762, 0.6350348, -1.046957, 1, 1, 1, 1, 1,
-0.8306424, -0.3242578, -1.967038, 1, 1, 1, 1, 1,
-0.8248735, 0.2269466, -0.5732531, 1, 1, 1, 1, 1,
-0.8229047, -3.377436, -3.471598, 0, 0, 1, 1, 1,
-0.8115643, -0.7526978, -2.694205, 1, 0, 0, 1, 1,
-0.8100417, 1.96324, -1.048284, 1, 0, 0, 1, 1,
-0.8096505, 0.8760391, -2.361189, 1, 0, 0, 1, 1,
-0.809615, 1.040688, -1.107417, 1, 0, 0, 1, 1,
-0.8092663, 0.01188559, -2.751233, 1, 0, 0, 1, 1,
-0.8068842, -1.065031, -3.686949, 0, 0, 0, 1, 1,
-0.802058, 0.08307425, -0.9588288, 0, 0, 0, 1, 1,
-0.8014733, -0.693126, -2.744113, 0, 0, 0, 1, 1,
-0.7955009, 0.6962762, 0.4452029, 0, 0, 0, 1, 1,
-0.7934681, -0.8729084, -1.455175, 0, 0, 0, 1, 1,
-0.7913448, -0.08553568, -0.2823953, 0, 0, 0, 1, 1,
-0.789683, 1.911358, 0.4356624, 0, 0, 0, 1, 1,
-0.7866241, 1.079313, -2.501368, 1, 1, 1, 1, 1,
-0.7859465, 1.079422, -0.9138321, 1, 1, 1, 1, 1,
-0.7812365, -0.06738184, -3.479794, 1, 1, 1, 1, 1,
-0.7763169, -0.5289438, -2.866158, 1, 1, 1, 1, 1,
-0.7639559, -0.1437589, -3.479307, 1, 1, 1, 1, 1,
-0.7525162, 1.00493, 0.1877597, 1, 1, 1, 1, 1,
-0.7465184, -0.42073, -1.811474, 1, 1, 1, 1, 1,
-0.7459046, -0.3496158, -2.583236, 1, 1, 1, 1, 1,
-0.7439375, 1.876604, -0.5509368, 1, 1, 1, 1, 1,
-0.7399206, -0.5440492, 0.2513737, 1, 1, 1, 1, 1,
-0.7365289, -0.4921763, -1.747901, 1, 1, 1, 1, 1,
-0.7323083, 0.8605421, -2.215474, 1, 1, 1, 1, 1,
-0.7304021, -0.3380455, -0.2044434, 1, 1, 1, 1, 1,
-0.7295522, 0.728556, -1.154082, 1, 1, 1, 1, 1,
-0.7289628, 1.54903, 0.9356179, 1, 1, 1, 1, 1,
-0.72852, -0.3111619, -1.285319, 0, 0, 1, 1, 1,
-0.7245054, 2.825516, 0.4711688, 1, 0, 0, 1, 1,
-0.7229887, -0.5584053, -1.52569, 1, 0, 0, 1, 1,
-0.7188119, 1.043126, -0.8801571, 1, 0, 0, 1, 1,
-0.7165809, 0.6951386, 0.2745586, 1, 0, 0, 1, 1,
-0.7125816, -0.2805292, -1.676228, 1, 0, 0, 1, 1,
-0.70851, -0.1026875, -1.897998, 0, 0, 0, 1, 1,
-0.7069504, 0.439188, -1.531991, 0, 0, 0, 1, 1,
-0.7064799, -0.02175372, -1.296115, 0, 0, 0, 1, 1,
-0.6998521, 0.5696524, -1.355424, 0, 0, 0, 1, 1,
-0.69691, -0.5656273, -1.76713, 0, 0, 0, 1, 1,
-0.6958026, -0.7245306, -3.395145, 0, 0, 0, 1, 1,
-0.6926178, 0.008358517, -2.037616, 0, 0, 0, 1, 1,
-0.6872889, -0.8814007, -3.443921, 1, 1, 1, 1, 1,
-0.6867225, 1.184015, 1.850395, 1, 1, 1, 1, 1,
-0.6791978, 0.2721413, -0.7526822, 1, 1, 1, 1, 1,
-0.6778548, -1.342523, -3.10423, 1, 1, 1, 1, 1,
-0.6738385, -0.4677458, -2.271215, 1, 1, 1, 1, 1,
-0.6709511, -1.036646, -2.663749, 1, 1, 1, 1, 1,
-0.6690229, -0.7734184, -2.024722, 1, 1, 1, 1, 1,
-0.6650035, 1.965778, 1.448681, 1, 1, 1, 1, 1,
-0.6626747, 1.411472, -1.500633, 1, 1, 1, 1, 1,
-0.660288, -0.6941358, -0.1487055, 1, 1, 1, 1, 1,
-0.6547312, 1.686269, -0.3852251, 1, 1, 1, 1, 1,
-0.6537437, -0.1062437, -2.802201, 1, 1, 1, 1, 1,
-0.6532978, -1.760318, -3.436296, 1, 1, 1, 1, 1,
-0.6513035, 0.289744, -2.035462, 1, 1, 1, 1, 1,
-0.6465032, 0.07314729, -1.945135, 1, 1, 1, 1, 1,
-0.644829, 0.03280954, -1.090966, 0, 0, 1, 1, 1,
-0.644436, -0.9250423, -1.27631, 1, 0, 0, 1, 1,
-0.641941, -2.103835, -4.023939, 1, 0, 0, 1, 1,
-0.6411905, -1.091943, -2.623694, 1, 0, 0, 1, 1,
-0.6405253, -0.04814733, -0.4745736, 1, 0, 0, 1, 1,
-0.6334851, 0.1291214, -0.4616572, 1, 0, 0, 1, 1,
-0.6291935, 0.118713, -0.8508556, 0, 0, 0, 1, 1,
-0.6229298, -0.8133563, -3.617251, 0, 0, 0, 1, 1,
-0.6217244, -0.00525849, -1.518333, 0, 0, 0, 1, 1,
-0.6183965, -1.485114, -3.689315, 0, 0, 0, 1, 1,
-0.6182657, 0.7549227, 0.3162983, 0, 0, 0, 1, 1,
-0.6174321, 0.541126, -1.607637, 0, 0, 0, 1, 1,
-0.6144955, 0.8011593, -0.524564, 0, 0, 0, 1, 1,
-0.6137168, 1.026947, -2.531167, 1, 1, 1, 1, 1,
-0.6075696, 0.1045264, -2.218484, 1, 1, 1, 1, 1,
-0.6052952, -0.7683565, -3.183067, 1, 1, 1, 1, 1,
-0.601851, 0.936193, 0.5936148, 1, 1, 1, 1, 1,
-0.6012233, 2.192108, 0.1085536, 1, 1, 1, 1, 1,
-0.5990024, -0.5352524, -3.544529, 1, 1, 1, 1, 1,
-0.5988368, 0.3181493, -1.122533, 1, 1, 1, 1, 1,
-0.5958502, 0.5265424, -3.56859, 1, 1, 1, 1, 1,
-0.5918093, 0.3261107, -1.40216, 1, 1, 1, 1, 1,
-0.5901597, -1.491505, -2.079205, 1, 1, 1, 1, 1,
-0.5900359, 0.0925473, -0.1331576, 1, 1, 1, 1, 1,
-0.5848133, -3.070014, -1.084168, 1, 1, 1, 1, 1,
-0.583253, 0.3122581, 1.499205, 1, 1, 1, 1, 1,
-0.5817578, 0.9425516, 0.9238154, 1, 1, 1, 1, 1,
-0.5811658, 1.444064, 0.2444498, 1, 1, 1, 1, 1,
-0.5805205, 0.5919756, -3.192238, 0, 0, 1, 1, 1,
-0.5781489, -1.962409, -2.854958, 1, 0, 0, 1, 1,
-0.5778179, -0.7966679, -1.550652, 1, 0, 0, 1, 1,
-0.5761265, 0.4860141, 0.3381548, 1, 0, 0, 1, 1,
-0.5752215, 1.535477, -0.4268934, 1, 0, 0, 1, 1,
-0.5720195, 1.920955, -0.7735384, 1, 0, 0, 1, 1,
-0.5708885, -0.2790183, -0.9184933, 0, 0, 0, 1, 1,
-0.5702303, 0.09102695, -0.3207679, 0, 0, 0, 1, 1,
-0.5664809, 0.07865603, -2.205452, 0, 0, 0, 1, 1,
-0.5652609, -0.3863216, -3.378396, 0, 0, 0, 1, 1,
-0.5610833, -1.386775, -3.446472, 0, 0, 0, 1, 1,
-0.557495, -0.9180427, -4.821956, 0, 0, 0, 1, 1,
-0.5550379, -1.537914, -5.545495, 0, 0, 0, 1, 1,
-0.5538259, 0.2423313, -2.082142, 1, 1, 1, 1, 1,
-0.5492367, 1.227748, -1.054498, 1, 1, 1, 1, 1,
-0.5430198, 0.1679976, 0.1323135, 1, 1, 1, 1, 1,
-0.5377852, 1.165278, -1.342517, 1, 1, 1, 1, 1,
-0.5351387, -1.41596, -2.120153, 1, 1, 1, 1, 1,
-0.5341896, 0.9678708, -0.8477902, 1, 1, 1, 1, 1,
-0.5330739, 0.371429, -0.9485665, 1, 1, 1, 1, 1,
-0.5310724, -0.2706801, -1.428127, 1, 1, 1, 1, 1,
-0.5308688, -0.03694327, -1.199777, 1, 1, 1, 1, 1,
-0.5283493, 0.4044166, -2.398743, 1, 1, 1, 1, 1,
-0.5238597, -0.3519536, -2.064194, 1, 1, 1, 1, 1,
-0.5236973, -0.4946728, -1.36098, 1, 1, 1, 1, 1,
-0.5161985, 0.2273835, -3.043255, 1, 1, 1, 1, 1,
-0.5085549, -0.08610459, -2.816136, 1, 1, 1, 1, 1,
-0.5076565, 2.093442, -0.5125142, 1, 1, 1, 1, 1,
-0.5028782, -1.153399, -3.325259, 0, 0, 1, 1, 1,
-0.502365, 0.746343, -3.508069, 1, 0, 0, 1, 1,
-0.5013491, -1.735213, -3.164674, 1, 0, 0, 1, 1,
-0.5000775, 0.3417676, -1.165695, 1, 0, 0, 1, 1,
-0.4957218, -0.3790676, -1.331704, 1, 0, 0, 1, 1,
-0.4952176, 0.1726724, -1.330963, 1, 0, 0, 1, 1,
-0.4933691, 0.3214958, -0.4335675, 0, 0, 0, 1, 1,
-0.4872646, 0.5997068, -0.8176179, 0, 0, 0, 1, 1,
-0.4859921, -0.6302787, -3.685875, 0, 0, 0, 1, 1,
-0.4826224, -1.890531, -1.898921, 0, 0, 0, 1, 1,
-0.4747632, 0.8430908, 0.5098134, 0, 0, 0, 1, 1,
-0.4705249, -0.5936133, -0.9965116, 0, 0, 0, 1, 1,
-0.4695455, -1.769746, -2.698071, 0, 0, 0, 1, 1,
-0.4650706, -0.2205713, -2.642229, 1, 1, 1, 1, 1,
-0.4648979, -1.039939, -3.038202, 1, 1, 1, 1, 1,
-0.4552195, -0.5057176, -3.90089, 1, 1, 1, 1, 1,
-0.4509239, 0.4304387, -2.246548, 1, 1, 1, 1, 1,
-0.4509213, 0.4312072, -0.5763685, 1, 1, 1, 1, 1,
-0.4507231, 0.2961832, -2.518257, 1, 1, 1, 1, 1,
-0.4506596, -0.6657182, -1.72062, 1, 1, 1, 1, 1,
-0.4466745, -0.3531747, -2.390901, 1, 1, 1, 1, 1,
-0.4412328, 0.7636911, -1.523006, 1, 1, 1, 1, 1,
-0.4392511, -1.126272, -2.81345, 1, 1, 1, 1, 1,
-0.4384029, -0.2739702, -3.97027, 1, 1, 1, 1, 1,
-0.4381461, 1.671423, 1.784748, 1, 1, 1, 1, 1,
-0.4372659, -0.1101785, -1.150623, 1, 1, 1, 1, 1,
-0.434068, -0.5692316, -4.134165, 1, 1, 1, 1, 1,
-0.4328091, -0.8503115, -3.174375, 1, 1, 1, 1, 1,
-0.4313963, -0.1691498, -2.835869, 0, 0, 1, 1, 1,
-0.4313653, 0.7319673, -1.224081, 1, 0, 0, 1, 1,
-0.4280409, 1.210832, 0.06125132, 1, 0, 0, 1, 1,
-0.4261354, -1.373402, -2.138329, 1, 0, 0, 1, 1,
-0.4255557, 0.8857514, -0.89638, 1, 0, 0, 1, 1,
-0.4252362, -0.2472716, -0.3357352, 1, 0, 0, 1, 1,
-0.4243754, 0.1491252, -1.337427, 0, 0, 0, 1, 1,
-0.4231882, -0.1753753, -2.740082, 0, 0, 0, 1, 1,
-0.4223377, 0.714753, -0.228817, 0, 0, 0, 1, 1,
-0.419521, -1.529837, -3.7031, 0, 0, 0, 1, 1,
-0.4120352, 1.244804, -0.1328209, 0, 0, 0, 1, 1,
-0.4119114, 1.983914, 0.990923, 0, 0, 0, 1, 1,
-0.4119028, 0.4854679, -1.888961, 0, 0, 0, 1, 1,
-0.4092808, 1.355722, -1.975816, 1, 1, 1, 1, 1,
-0.4007503, 1.080473, 1.712932, 1, 1, 1, 1, 1,
-0.3947291, 0.8452885, -2.763953, 1, 1, 1, 1, 1,
-0.3905919, -2.59861, -1.081361, 1, 1, 1, 1, 1,
-0.3841994, -1.57589, -1.889232, 1, 1, 1, 1, 1,
-0.3831762, 0.02868194, -3.636877, 1, 1, 1, 1, 1,
-0.3820912, 1.451738, -0.1052329, 1, 1, 1, 1, 1,
-0.3782507, -0.9790444, -1.703689, 1, 1, 1, 1, 1,
-0.376287, 1.691644, -1.380946, 1, 1, 1, 1, 1,
-0.3750978, -1.775619, -2.818192, 1, 1, 1, 1, 1,
-0.3741415, -0.7957389, -1.618992, 1, 1, 1, 1, 1,
-0.3721819, 0.5298315, -0.3738715, 1, 1, 1, 1, 1,
-0.3693478, -0.526648, -2.438568, 1, 1, 1, 1, 1,
-0.3661813, -0.5787122, -1.162974, 1, 1, 1, 1, 1,
-0.3652766, 1.325479, -0.4659392, 1, 1, 1, 1, 1,
-0.3620723, 0.6233145, 0.8149278, 0, 0, 1, 1, 1,
-0.354278, 1.615911, -0.1100811, 1, 0, 0, 1, 1,
-0.3537577, 0.7380255, -1.599556, 1, 0, 0, 1, 1,
-0.3522702, -0.1969578, -2.053782, 1, 0, 0, 1, 1,
-0.351691, 0.9696521, -0.5300277, 1, 0, 0, 1, 1,
-0.3516729, 0.7471241, -1.75145, 1, 0, 0, 1, 1,
-0.3504367, -0.4154948, -2.338925, 0, 0, 0, 1, 1,
-0.3459715, 0.1667626, -0.3688235, 0, 0, 0, 1, 1,
-0.3439244, 0.4202592, -1.878971, 0, 0, 0, 1, 1,
-0.3413786, -1.781294, -1.353719, 0, 0, 0, 1, 1,
-0.3392194, -1.19848, -1.971704, 0, 0, 0, 1, 1,
-0.337408, 0.02919419, -2.053699, 0, 0, 0, 1, 1,
-0.3360243, 0.5796447, -0.4075986, 0, 0, 0, 1, 1,
-0.3342418, -0.1082639, -0.7390717, 1, 1, 1, 1, 1,
-0.3337071, -0.3659629, -3.100819, 1, 1, 1, 1, 1,
-0.3280936, -0.4536348, -2.016997, 1, 1, 1, 1, 1,
-0.3268684, -0.4486308, -2.634421, 1, 1, 1, 1, 1,
-0.3184872, -0.3085061, -2.127899, 1, 1, 1, 1, 1,
-0.3181384, -0.6166572, -3.382094, 1, 1, 1, 1, 1,
-0.3173448, 1.662419, 0.6201895, 1, 1, 1, 1, 1,
-0.3157616, -1.299136, -1.377159, 1, 1, 1, 1, 1,
-0.313074, -0.4085664, -5.011002, 1, 1, 1, 1, 1,
-0.3099498, 1.251569, -2.279457, 1, 1, 1, 1, 1,
-0.3056728, 1.059724, -2.59697, 1, 1, 1, 1, 1,
-0.3046012, -0.8799614, -1.130177, 1, 1, 1, 1, 1,
-0.3044589, 0.5828485, -1.032234, 1, 1, 1, 1, 1,
-0.3040123, -0.8469021, -0.9833279, 1, 1, 1, 1, 1,
-0.3016192, -1.989774, -3.801347, 1, 1, 1, 1, 1,
-0.2997278, 0.428633, 0.1747237, 0, 0, 1, 1, 1,
-0.2933097, -1.389932, -2.703951, 1, 0, 0, 1, 1,
-0.291745, 0.7080756, -0.606271, 1, 0, 0, 1, 1,
-0.290295, -0.7517561, -3.180684, 1, 0, 0, 1, 1,
-0.2899524, 0.4358754, -0.8393087, 1, 0, 0, 1, 1,
-0.2885539, -1.898135, -1.339128, 1, 0, 0, 1, 1,
-0.2877801, -0.2675673, -1.071058, 0, 0, 0, 1, 1,
-0.2781825, 0.3711812, 0.7039765, 0, 0, 0, 1, 1,
-0.2773847, -0.7548754, -3.615377, 0, 0, 0, 1, 1,
-0.2763921, -1.46264, -4.302958, 0, 0, 0, 1, 1,
-0.2711195, 1.292082, -2.335812, 0, 0, 0, 1, 1,
-0.2621788, 1.719424, 0.523914, 0, 0, 0, 1, 1,
-0.2601537, 0.02941414, 0.0179735, 0, 0, 0, 1, 1,
-0.2592754, -0.02368652, -2.009462, 1, 1, 1, 1, 1,
-0.258242, -0.1382335, -4.216123, 1, 1, 1, 1, 1,
-0.2569967, 1.328487, 0.4668277, 1, 1, 1, 1, 1,
-0.2562253, 0.7231993, -1.080242, 1, 1, 1, 1, 1,
-0.2552567, -0.4281853, -1.762746, 1, 1, 1, 1, 1,
-0.2542104, -1.566762, -3.342221, 1, 1, 1, 1, 1,
-0.2539482, 1.01779, 0.4341556, 1, 1, 1, 1, 1,
-0.252573, 0.7248966, -0.7730051, 1, 1, 1, 1, 1,
-0.2484645, 0.227996, -1.294802, 1, 1, 1, 1, 1,
-0.2477489, 0.7046779, -0.1195426, 1, 1, 1, 1, 1,
-0.2471228, 0.6884906, -2.623886, 1, 1, 1, 1, 1,
-0.2402781, 0.5553122, 0.0693092, 1, 1, 1, 1, 1,
-0.2394594, 0.6778931, 0.8849138, 1, 1, 1, 1, 1,
-0.2357513, -2.26204, -1.977401, 1, 1, 1, 1, 1,
-0.2341125, -0.04992128, -1.224292, 1, 1, 1, 1, 1,
-0.2337381, 0.09404033, -1.800705, 0, 0, 1, 1, 1,
-0.2295672, -0.4279914, -3.14468, 1, 0, 0, 1, 1,
-0.2277544, -0.782018, -4.999272, 1, 0, 0, 1, 1,
-0.223966, 1.165438, -1.211869, 1, 0, 0, 1, 1,
-0.2214868, 0.3018849, -0.4721764, 1, 0, 0, 1, 1,
-0.2211947, -0.3638573, -2.487312, 1, 0, 0, 1, 1,
-0.215921, -1.000495, -4.066231, 0, 0, 0, 1, 1,
-0.2111435, -0.6350329, -3.689368, 0, 0, 0, 1, 1,
-0.203324, -0.1485398, -3.347618, 0, 0, 0, 1, 1,
-0.1986935, 0.7127948, -1.270284, 0, 0, 0, 1, 1,
-0.1928518, 0.2253275, -0.5848708, 0, 0, 0, 1, 1,
-0.1820743, 1.555153, -0.9271322, 0, 0, 0, 1, 1,
-0.1809342, 0.04125144, -0.5484039, 0, 0, 0, 1, 1,
-0.1782085, 2.73314, -0.06947036, 1, 1, 1, 1, 1,
-0.1774668, 0.8161679, -0.9035806, 1, 1, 1, 1, 1,
-0.1768381, 0.4434167, -0.4980468, 1, 1, 1, 1, 1,
-0.1756895, -0.2928839, -2.098915, 1, 1, 1, 1, 1,
-0.1640863, -1.747559, -4.574036, 1, 1, 1, 1, 1,
-0.1612865, -0.6676297, -3.317015, 1, 1, 1, 1, 1,
-0.1607752, 1.157925, 0.0383618, 1, 1, 1, 1, 1,
-0.1592269, 1.070396, 1.819299, 1, 1, 1, 1, 1,
-0.1564765, -0.2163719, -1.549111, 1, 1, 1, 1, 1,
-0.1536833, 0.5060033, -0.8184206, 1, 1, 1, 1, 1,
-0.1514075, 1.781413, 0.245289, 1, 1, 1, 1, 1,
-0.1499406, 0.04459249, -1.770497, 1, 1, 1, 1, 1,
-0.1452303, -0.01752774, -1.199233, 1, 1, 1, 1, 1,
-0.1436655, -1.871087, -2.567939, 1, 1, 1, 1, 1,
-0.1419079, -0.07673891, -2.726108, 1, 1, 1, 1, 1,
-0.1409662, 0.6344841, 0.2022733, 0, 0, 1, 1, 1,
-0.1380421, 0.5763142, -0.08338794, 1, 0, 0, 1, 1,
-0.1375241, -1.159474, -2.9325, 1, 0, 0, 1, 1,
-0.1340436, 1.463174, -1.094391, 1, 0, 0, 1, 1,
-0.1256178, -0.683639, -3.386255, 1, 0, 0, 1, 1,
-0.1255879, 2.098948, -0.5300609, 1, 0, 0, 1, 1,
-0.1249875, 2.457572, 1.138183, 0, 0, 0, 1, 1,
-0.1246311, 0.3062977, -1.805694, 0, 0, 0, 1, 1,
-0.1198222, -0.3827375, -1.747923, 0, 0, 0, 1, 1,
-0.1188994, 0.3774716, -1.03801, 0, 0, 0, 1, 1,
-0.1136528, -1.159422, -2.686704, 0, 0, 0, 1, 1,
-0.1104054, 0.4176036, -2.302199, 0, 0, 0, 1, 1,
-0.1082176, 0.652431, 1.709414, 0, 0, 0, 1, 1,
-0.1079781, -1.161108, -3.554064, 1, 1, 1, 1, 1,
-0.1064936, -0.2799048, -1.7096, 1, 1, 1, 1, 1,
-0.1064522, 0.3789539, 1.61599, 1, 1, 1, 1, 1,
-0.1055789, -0.5853209, -3.174125, 1, 1, 1, 1, 1,
-0.104038, 0.8524776, -0.5140185, 1, 1, 1, 1, 1,
-0.1020857, 0.5085208, -0.1212682, 1, 1, 1, 1, 1,
-0.101389, 1.162738, -1.000776, 1, 1, 1, 1, 1,
-0.09845643, -1.304241, -2.855663, 1, 1, 1, 1, 1,
-0.09708413, 0.6068935, -2.403772, 1, 1, 1, 1, 1,
-0.09645276, 0.6774519, 1.35005, 1, 1, 1, 1, 1,
-0.09634262, -1.821312, -2.770519, 1, 1, 1, 1, 1,
-0.09468652, 1.113818, 0.08882909, 1, 1, 1, 1, 1,
-0.09173179, -0.3208561, -3.737527, 1, 1, 1, 1, 1,
-0.09112386, 0.72821, -0.2079766, 1, 1, 1, 1, 1,
-0.0907179, 0.2732814, -1.266846, 1, 1, 1, 1, 1,
-0.08758505, 1.707967, 0.8803682, 0, 0, 1, 1, 1,
-0.08648229, 0.2125665, -0.6717871, 1, 0, 0, 1, 1,
-0.08530052, 0.2288769, -0.5778543, 1, 0, 0, 1, 1,
-0.08483926, 0.8796454, 0.259802, 1, 0, 0, 1, 1,
-0.08048993, 0.9076623, -0.03823623, 1, 0, 0, 1, 1,
-0.07785592, -0.8454267, -3.644907, 1, 0, 0, 1, 1,
-0.07686301, 0.1073114, -0.7347959, 0, 0, 0, 1, 1,
-0.06724335, -0.8317351, -1.838274, 0, 0, 0, 1, 1,
-0.06677573, -1.010868, -2.922168, 0, 0, 0, 1, 1,
-0.06011179, 0.6620693, 0.02543827, 0, 0, 0, 1, 1,
-0.05852165, -0.1163103, -2.589167, 0, 0, 0, 1, 1,
-0.05820335, 0.5201787, -0.6982139, 0, 0, 0, 1, 1,
-0.05239172, 0.1722042, 1.244926, 0, 0, 0, 1, 1,
-0.0517003, 0.0671917, 0.4400644, 1, 1, 1, 1, 1,
-0.04715281, -0.5750275, -3.057073, 1, 1, 1, 1, 1,
-0.04602766, -0.09265719, -3.365786, 1, 1, 1, 1, 1,
-0.04281978, 0.9736496, -0.4760514, 1, 1, 1, 1, 1,
-0.04029465, 1.178369, -0.5927118, 1, 1, 1, 1, 1,
-0.03753367, -2.835862, -2.451998, 1, 1, 1, 1, 1,
-0.03261446, -0.2163328, -3.54884, 1, 1, 1, 1, 1,
-0.03229217, -2.484882, -5.123248, 1, 1, 1, 1, 1,
-0.03152599, -1.712732, -2.830312, 1, 1, 1, 1, 1,
-0.02829069, 1.068706, 0.9107327, 1, 1, 1, 1, 1,
-0.02709584, -0.05395896, -3.231891, 1, 1, 1, 1, 1,
-0.02661771, 0.1507457, -1.262772, 1, 1, 1, 1, 1,
-0.02324811, 0.5521042, -0.9984766, 1, 1, 1, 1, 1,
-0.0216854, 1.505521, -0.03029927, 1, 1, 1, 1, 1,
-0.01699058, 0.2576662, 0.916514, 1, 1, 1, 1, 1,
-0.01578735, 0.2574951, 0.1550693, 0, 0, 1, 1, 1,
-0.01524254, 1.060265, 0.6712304, 1, 0, 0, 1, 1,
-0.01198236, 0.5356568, -0.8626853, 1, 0, 0, 1, 1,
-0.008857395, 0.788693, 1.102253, 1, 0, 0, 1, 1,
-0.006607052, 1.76738, -0.4363265, 1, 0, 0, 1, 1,
-0.006468759, -0.35681, -3.096866, 1, 0, 0, 1, 1,
-0.005528528, 0.3747154, -1.056071, 0, 0, 0, 1, 1,
-0.003908989, 0.1524696, -0.5471991, 0, 0, 0, 1, 1,
0.002658403, -0.8497385, 2.179533, 0, 0, 0, 1, 1,
0.002832507, -3.685372, 3.882354, 0, 0, 0, 1, 1,
0.003024245, 1.677933, -0.3666378, 0, 0, 0, 1, 1,
0.005846791, -0.6578493, 3.504447, 0, 0, 0, 1, 1,
0.006140342, 0.7657517, 1.0878, 0, 0, 0, 1, 1,
0.006887913, -0.8963062, 3.705187, 1, 1, 1, 1, 1,
0.01183095, 1.828246, -0.01589691, 1, 1, 1, 1, 1,
0.01333545, 0.5900911, -0.6615216, 1, 1, 1, 1, 1,
0.01798852, -0.4050353, 3.496103, 1, 1, 1, 1, 1,
0.01860083, -0.09071932, 3.019865, 1, 1, 1, 1, 1,
0.02126259, 0.7596157, 2.913856, 1, 1, 1, 1, 1,
0.02405281, -1.72785, 3.220676, 1, 1, 1, 1, 1,
0.0320475, 0.9056513, -1.779613, 1, 1, 1, 1, 1,
0.03373092, -1.72668, 3.064782, 1, 1, 1, 1, 1,
0.03811244, -1.593632, 0.4498987, 1, 1, 1, 1, 1,
0.04368077, -0.987047, 2.847167, 1, 1, 1, 1, 1,
0.04773718, 0.6614733, -0.3003973, 1, 1, 1, 1, 1,
0.05051401, -1.127166, 4.950756, 1, 1, 1, 1, 1,
0.05415154, 0.2146491, -0.5359462, 1, 1, 1, 1, 1,
0.06362339, -1.105936, 2.499377, 1, 1, 1, 1, 1,
0.06665905, -0.1993235, 1.000841, 0, 0, 1, 1, 1,
0.06817889, -0.7646746, 3.076805, 1, 0, 0, 1, 1,
0.0734456, 0.1075829, 0.3041988, 1, 0, 0, 1, 1,
0.07412437, 0.425274, 0.671121, 1, 0, 0, 1, 1,
0.07488404, 1.266244, -0.2007027, 1, 0, 0, 1, 1,
0.0750543, -0.5195093, 4.950973, 1, 0, 0, 1, 1,
0.0787838, -0.2593652, 4.407142, 0, 0, 0, 1, 1,
0.08141337, 0.181559, 1.191889, 0, 0, 0, 1, 1,
0.08454517, 0.1365581, 0.9968503, 0, 0, 0, 1, 1,
0.08478066, 1.392666, -0.4581164, 0, 0, 0, 1, 1,
0.08480612, -1.211974, 2.347208, 0, 0, 0, 1, 1,
0.08845735, 0.3195991, -1.077846, 0, 0, 0, 1, 1,
0.09011563, -1.13342, 2.57139, 0, 0, 0, 1, 1,
0.09039725, -0.3813558, 3.472244, 1, 1, 1, 1, 1,
0.09244658, -0.940986, 2.433043, 1, 1, 1, 1, 1,
0.09526833, -0.6971343, 2.968451, 1, 1, 1, 1, 1,
0.09531965, 0.4648071, -0.5101725, 1, 1, 1, 1, 1,
0.09761185, -0.6945952, 3.064842, 1, 1, 1, 1, 1,
0.09875585, -1.234705, 2.956871, 1, 1, 1, 1, 1,
0.09978499, 0.2906974, -0.9373456, 1, 1, 1, 1, 1,
0.1008969, -1.065113, 1.521583, 1, 1, 1, 1, 1,
0.1083108, 1.96072, -0.7984017, 1, 1, 1, 1, 1,
0.1108002, 0.7682084, 1.17071, 1, 1, 1, 1, 1,
0.1131391, 0.9416486, 0.7299563, 1, 1, 1, 1, 1,
0.1151317, -1.148026, 1.557206, 1, 1, 1, 1, 1,
0.1187966, 0.5775455, -0.5573144, 1, 1, 1, 1, 1,
0.1241657, 0.3543354, 1.014175, 1, 1, 1, 1, 1,
0.1273507, 1.314415, 2.021185, 1, 1, 1, 1, 1,
0.1280567, 1.261497, -0.863904, 0, 0, 1, 1, 1,
0.1311883, -0.1642553, 2.258625, 1, 0, 0, 1, 1,
0.1387129, 1.8523, -0.4353713, 1, 0, 0, 1, 1,
0.138811, -0.4364781, 2.09526, 1, 0, 0, 1, 1,
0.1405219, 1.228068, -0.6920634, 1, 0, 0, 1, 1,
0.1416273, 1.357534, 0.2999725, 1, 0, 0, 1, 1,
0.1423761, -0.6423727, 4.701798, 0, 0, 0, 1, 1,
0.1447436, -0.6583176, 2.825936, 0, 0, 0, 1, 1,
0.1471982, -1.120393, 4.3533, 0, 0, 0, 1, 1,
0.1497527, -0.6895843, 2.748699, 0, 0, 0, 1, 1,
0.1571097, 0.9511496, -0.3811809, 0, 0, 0, 1, 1,
0.1590493, 0.06130979, 1.089621, 0, 0, 0, 1, 1,
0.1630637, 2.064098, -0.0568918, 0, 0, 0, 1, 1,
0.1668973, 0.5036528, 0.03886877, 1, 1, 1, 1, 1,
0.1688162, -0.7860225, 2.995196, 1, 1, 1, 1, 1,
0.1773493, 0.3294501, 1.594486, 1, 1, 1, 1, 1,
0.1782685, -0.07925656, 2.184184, 1, 1, 1, 1, 1,
0.1859452, 0.1998796, -0.5894911, 1, 1, 1, 1, 1,
0.1872254, -0.6696534, 4.194753, 1, 1, 1, 1, 1,
0.1895525, 2.067539, 1.152608, 1, 1, 1, 1, 1,
0.191458, 1.302959, 0.4060246, 1, 1, 1, 1, 1,
0.1963278, 0.02245379, 0.8335899, 1, 1, 1, 1, 1,
0.1969919, 0.1297939, 2.243105, 1, 1, 1, 1, 1,
0.198282, -0.2427108, 0.5036198, 1, 1, 1, 1, 1,
0.1985386, -0.8846441, 3.426243, 1, 1, 1, 1, 1,
0.1994563, 0.2137851, 1.717441, 1, 1, 1, 1, 1,
0.1996518, 0.3269999, -0.3476351, 1, 1, 1, 1, 1,
0.2003686, -0.9801332, 2.108706, 1, 1, 1, 1, 1,
0.2034905, 1.387639, -0.6076173, 0, 0, 1, 1, 1,
0.2035682, 1.515936, 1.19431, 1, 0, 0, 1, 1,
0.2072853, 1.32365, 0.8163572, 1, 0, 0, 1, 1,
0.2073011, 1.627199, 0.1808923, 1, 0, 0, 1, 1,
0.2131545, -1.773063, 5.061745, 1, 0, 0, 1, 1,
0.2141996, -0.6255721, 4.013664, 1, 0, 0, 1, 1,
0.2225519, -0.1313719, 0.2465776, 0, 0, 0, 1, 1,
0.2232326, -0.1767395, 3.26493, 0, 0, 0, 1, 1,
0.2249051, 0.5909932, -0.1693123, 0, 0, 0, 1, 1,
0.2337689, 2.059365, -0.2586788, 0, 0, 0, 1, 1,
0.2366111, -0.5234338, 1.801965, 0, 0, 0, 1, 1,
0.2387951, 1.0559, 0.4377444, 0, 0, 0, 1, 1,
0.2389273, 0.1729122, -0.207058, 0, 0, 0, 1, 1,
0.2396194, -1.014887, 3.16052, 1, 1, 1, 1, 1,
0.2399785, 0.1637502, 0.2374596, 1, 1, 1, 1, 1,
0.2456275, -0.2160371, 2.751128, 1, 1, 1, 1, 1,
0.2464385, 0.4762885, -0.2658162, 1, 1, 1, 1, 1,
0.248505, 1.291566, 0.9955598, 1, 1, 1, 1, 1,
0.2510561, 1.4131, -0.8491819, 1, 1, 1, 1, 1,
0.258675, -1.125885, 3.00824, 1, 1, 1, 1, 1,
0.2592935, 0.1713514, 1.256962, 1, 1, 1, 1, 1,
0.2598282, 1.297574, 1.516383, 1, 1, 1, 1, 1,
0.261861, 0.7751478, 1.395925, 1, 1, 1, 1, 1,
0.2662184, -0.6243103, 1.063823, 1, 1, 1, 1, 1,
0.266847, 0.996469, 1.906649, 1, 1, 1, 1, 1,
0.2704798, 0.02641395, 1.173335, 1, 1, 1, 1, 1,
0.2787582, -0.1149655, 1.219911, 1, 1, 1, 1, 1,
0.2787879, -0.7649977, 0.1395932, 1, 1, 1, 1, 1,
0.2814738, -0.07893525, 2.516399, 0, 0, 1, 1, 1,
0.2825415, -0.7984295, 1.862081, 1, 0, 0, 1, 1,
0.2843689, 1.662629, -1.714155, 1, 0, 0, 1, 1,
0.2921416, -0.6009179, 3.416761, 1, 0, 0, 1, 1,
0.2924864, 0.1477402, 1.226212, 1, 0, 0, 1, 1,
0.2944711, 0.03722212, 2.811312, 1, 0, 0, 1, 1,
0.2955683, -0.6689929, 4.040448, 0, 0, 0, 1, 1,
0.2966819, 0.07699713, 1.619123, 0, 0, 0, 1, 1,
0.3013649, -1.412315, 3.203371, 0, 0, 0, 1, 1,
0.3026682, 0.4578581, 0.819253, 0, 0, 0, 1, 1,
0.3027977, 0.3020992, 0.7062865, 0, 0, 0, 1, 1,
0.3031168, -0.8478393, 1.708972, 0, 0, 0, 1, 1,
0.3037615, 0.1961187, 1.79265, 0, 0, 0, 1, 1,
0.3053997, 1.617554, 0.3888383, 1, 1, 1, 1, 1,
0.3054173, -0.9849724, 3.905892, 1, 1, 1, 1, 1,
0.3073773, 0.5026768, 0.7671477, 1, 1, 1, 1, 1,
0.3083149, -0.7999867, 3.110986, 1, 1, 1, 1, 1,
0.3136553, -3.053036, 3.162319, 1, 1, 1, 1, 1,
0.3147299, 0.06958903, 1.299691, 1, 1, 1, 1, 1,
0.3180596, 2.672952, -0.7801532, 1, 1, 1, 1, 1,
0.319274, 0.06909885, 2.624403, 1, 1, 1, 1, 1,
0.3198251, -1.569057, 3.686058, 1, 1, 1, 1, 1,
0.322248, -1.151394, 3.903931, 1, 1, 1, 1, 1,
0.3239915, -0.2391002, 3.099673, 1, 1, 1, 1, 1,
0.3259748, -1.001569, 2.543787, 1, 1, 1, 1, 1,
0.3290729, 2.158225, 0.2863143, 1, 1, 1, 1, 1,
0.3293378, 0.07122573, 2.365598, 1, 1, 1, 1, 1,
0.3305639, 0.673808, -0.05281002, 1, 1, 1, 1, 1,
0.3339692, -1.215002, 1.909903, 0, 0, 1, 1, 1,
0.3362777, 1.772523, 0.4418025, 1, 0, 0, 1, 1,
0.3382211, -1.598494, 2.789274, 1, 0, 0, 1, 1,
0.3394925, 0.6635526, 0.3055373, 1, 0, 0, 1, 1,
0.3411124, -0.2314565, 2.528555, 1, 0, 0, 1, 1,
0.3417324, 1.195075, 0.5694676, 1, 0, 0, 1, 1,
0.3461321, 0.4202959, -0.1110524, 0, 0, 0, 1, 1,
0.3475802, 0.5066401, 1.221269, 0, 0, 0, 1, 1,
0.3497307, 0.2450714, -0.09794647, 0, 0, 0, 1, 1,
0.3499983, -0.5876976, 2.403866, 0, 0, 0, 1, 1,
0.3502046, 1.833792, 0.1986017, 0, 0, 0, 1, 1,
0.3515548, 1.882374, 0.06746604, 0, 0, 0, 1, 1,
0.3526089, -0.6164743, 3.956527, 0, 0, 0, 1, 1,
0.3538195, 1.73184, -1.391206, 1, 1, 1, 1, 1,
0.3566201, -0.1740179, 1.849857, 1, 1, 1, 1, 1,
0.3584312, 0.2033294, 1.519433, 1, 1, 1, 1, 1,
0.3617335, 3.267371, 0.5497952, 1, 1, 1, 1, 1,
0.363756, -2.758359, 3.618221, 1, 1, 1, 1, 1,
0.3639345, 0.2038851, 1.567647, 1, 1, 1, 1, 1,
0.3646158, 0.5224773, 0.8469547, 1, 1, 1, 1, 1,
0.3691851, -0.93478, 2.559822, 1, 1, 1, 1, 1,
0.3713605, -1.599592, 3.205578, 1, 1, 1, 1, 1,
0.3736956, 0.1547984, 3.241644, 1, 1, 1, 1, 1,
0.3740269, 0.3482682, 0.9105301, 1, 1, 1, 1, 1,
0.3779766, -0.3746328, 3.059056, 1, 1, 1, 1, 1,
0.3784705, -1.122483, 1.435805, 1, 1, 1, 1, 1,
0.3797545, -1.735725, 2.180717, 1, 1, 1, 1, 1,
0.3865672, -0.7872533, 0.9550472, 1, 1, 1, 1, 1,
0.3883335, -1.062577, 2.99773, 0, 0, 1, 1, 1,
0.3893157, 2.118545, 1.331415, 1, 0, 0, 1, 1,
0.3903027, 0.1655359, 0.06426909, 1, 0, 0, 1, 1,
0.3906784, -1.787168, 3.768711, 1, 0, 0, 1, 1,
0.3992139, 1.720864, 1.530603, 1, 0, 0, 1, 1,
0.4009988, -0.05870438, 1.958776, 1, 0, 0, 1, 1,
0.4011875, -0.7028406, 3.638945, 0, 0, 0, 1, 1,
0.4084214, -1.143, 2.948491, 0, 0, 0, 1, 1,
0.4087424, 1.19978, -0.2472548, 0, 0, 0, 1, 1,
0.4104795, 0.9622876, 0.8656716, 0, 0, 0, 1, 1,
0.4151902, -0.3379822, 2.217409, 0, 0, 0, 1, 1,
0.4307231, -0.9855543, 3.305049, 0, 0, 0, 1, 1,
0.4389192, -0.3088728, 1.112187, 0, 0, 0, 1, 1,
0.4400801, -0.2988803, 2.638165, 1, 1, 1, 1, 1,
0.4403545, -1.116701, 3.833174, 1, 1, 1, 1, 1,
0.441888, 0.6683195, 0.4466217, 1, 1, 1, 1, 1,
0.4430974, 0.05433203, 1.868624, 1, 1, 1, 1, 1,
0.4485195, -0.201779, 1.662867, 1, 1, 1, 1, 1,
0.4560005, 0.382095, -0.09111831, 1, 1, 1, 1, 1,
0.458553, -0.5829927, 2.243035, 1, 1, 1, 1, 1,
0.4599707, -0.7705396, 2.804134, 1, 1, 1, 1, 1,
0.4619178, 1.964968, -1.123438, 1, 1, 1, 1, 1,
0.4626609, 0.4505688, 2.520633, 1, 1, 1, 1, 1,
0.4641539, -0.4845529, 2.231242, 1, 1, 1, 1, 1,
0.4664089, 1.616875, -0.3336264, 1, 1, 1, 1, 1,
0.4715421, 0.137057, 1.414007, 1, 1, 1, 1, 1,
0.4729396, 0.2313525, 0.7016124, 1, 1, 1, 1, 1,
0.4729931, 0.1964844, 0.4268398, 1, 1, 1, 1, 1,
0.476067, 0.6879955, 0.4063066, 0, 0, 1, 1, 1,
0.4801219, 2.054766, -1.364409, 1, 0, 0, 1, 1,
0.4804721, -0.1470213, 1.787225, 1, 0, 0, 1, 1,
0.491106, 0.2038957, 1.096716, 1, 0, 0, 1, 1,
0.4911859, 2.852179, -0.7130919, 1, 0, 0, 1, 1,
0.4961179, -1.51038, 3.584682, 1, 0, 0, 1, 1,
0.4973503, -0.9379185, 3.329203, 0, 0, 0, 1, 1,
0.5069929, -1.185499, 3.177076, 0, 0, 0, 1, 1,
0.511029, 0.9960487, -0.5361027, 0, 0, 0, 1, 1,
0.5165277, -1.161167, 3.184762, 0, 0, 0, 1, 1,
0.5172518, -0.5828934, 1.828913, 0, 0, 0, 1, 1,
0.5180035, 1.22737, 0.2978452, 0, 0, 0, 1, 1,
0.5198292, 2.285635, 0.5583583, 0, 0, 0, 1, 1,
0.524949, 0.1817476, 1.339659, 1, 1, 1, 1, 1,
0.5287877, -1.284588, 1.794434, 1, 1, 1, 1, 1,
0.5297893, -0.3008897, 1.455722, 1, 1, 1, 1, 1,
0.5306704, -1.103383, 0.7975695, 1, 1, 1, 1, 1,
0.5365945, 0.01477089, 4.040256, 1, 1, 1, 1, 1,
0.537438, -0.2674164, 2.481603, 1, 1, 1, 1, 1,
0.5404878, 0.9619358, 2.312448, 1, 1, 1, 1, 1,
0.5431812, 0.2884266, 0.7382872, 1, 1, 1, 1, 1,
0.5436356, 0.2949591, 2.628963, 1, 1, 1, 1, 1,
0.5460076, 2.364974, 2.091061, 1, 1, 1, 1, 1,
0.552752, 1.875137, 2.048796, 1, 1, 1, 1, 1,
0.5541669, -0.1788441, 1.088317, 1, 1, 1, 1, 1,
0.5680763, -0.03809366, 1.434327, 1, 1, 1, 1, 1,
0.573445, 0.3182062, 0.1727314, 1, 1, 1, 1, 1,
0.5764215, 1.410286, -1.198975, 1, 1, 1, 1, 1,
0.5797241, 1.848822, 0.02446195, 0, 0, 1, 1, 1,
0.5915306, -0.1110605, 3.378365, 1, 0, 0, 1, 1,
0.5943695, 0.3304381, 1.064127, 1, 0, 0, 1, 1,
0.5994297, -0.7247282, 3.461027, 1, 0, 0, 1, 1,
0.6010734, -0.2516107, 0.9926955, 1, 0, 0, 1, 1,
0.6015432, 0.4083686, -0.4478581, 1, 0, 0, 1, 1,
0.6027405, 0.6570233, 0.3796153, 0, 0, 0, 1, 1,
0.6066168, -1.176623, 3.836839, 0, 0, 0, 1, 1,
0.6076487, -0.8829544, 1.274393, 0, 0, 0, 1, 1,
0.6077455, -1.14888, 2.749598, 0, 0, 0, 1, 1,
0.608496, -0.6815128, 2.064168, 0, 0, 0, 1, 1,
0.6138411, -0.1502754, 2.477909, 0, 0, 0, 1, 1,
0.6206307, -0.256167, 1.442275, 0, 0, 0, 1, 1,
0.6207935, 0.9057366, 0.8083687, 1, 1, 1, 1, 1,
0.622036, -1.271996, 2.513479, 1, 1, 1, 1, 1,
0.6269966, 1.627331, 0.4954738, 1, 1, 1, 1, 1,
0.6332112, 0.1674192, 1.088152, 1, 1, 1, 1, 1,
0.6341531, -0.127413, 2.458328, 1, 1, 1, 1, 1,
0.6380934, -0.4761877, 2.230431, 1, 1, 1, 1, 1,
0.63877, 0.04561954, 1.631947, 1, 1, 1, 1, 1,
0.6406646, -0.6196228, 1.934497, 1, 1, 1, 1, 1,
0.6435701, -0.05820461, 2.358279, 1, 1, 1, 1, 1,
0.6441554, -0.7798391, 3.080838, 1, 1, 1, 1, 1,
0.6552135, -1.340885, 1.451954, 1, 1, 1, 1, 1,
0.6616578, -0.8801535, 3.626618, 1, 1, 1, 1, 1,
0.6618101, 0.3504629, 1.685651, 1, 1, 1, 1, 1,
0.6644024, -0.7193598, 3.258571, 1, 1, 1, 1, 1,
0.6675135, 1.348377, -1.097166, 1, 1, 1, 1, 1,
0.6692292, -0.983505, 1.789288, 0, 0, 1, 1, 1,
0.6701834, -1.0458, 3.870214, 1, 0, 0, 1, 1,
0.6740292, 1.015532, 2.375454, 1, 0, 0, 1, 1,
0.682364, -0.3784404, 1.500575, 1, 0, 0, 1, 1,
0.6862935, 0.3737508, 1.099605, 1, 0, 0, 1, 1,
0.6879882, 1.253114, 0.827476, 1, 0, 0, 1, 1,
0.6885398, -1.694389, 3.009357, 0, 0, 0, 1, 1,
0.6942496, 1.124031, 1.141814, 0, 0, 0, 1, 1,
0.6966497, 0.2231611, 2.551232, 0, 0, 0, 1, 1,
0.7090935, -0.001634811, 1.981819, 0, 0, 0, 1, 1,
0.7125711, 1.050323, -0.1480166, 0, 0, 0, 1, 1,
0.7129058, -1.267391, 2.952401, 0, 0, 0, 1, 1,
0.7143636, -0.878702, 2.652529, 0, 0, 0, 1, 1,
0.7170514, -1.49787, 3.385042, 1, 1, 1, 1, 1,
0.7243935, 0.9635442, 0.270747, 1, 1, 1, 1, 1,
0.7257664, -1.087272, 2.985923, 1, 1, 1, 1, 1,
0.729939, 0.3553763, -1.121483, 1, 1, 1, 1, 1,
0.7350323, 0.7819004, -0.484792, 1, 1, 1, 1, 1,
0.7357135, 0.4715384, 3.927228, 1, 1, 1, 1, 1,
0.7372258, -2.257186, 3.332614, 1, 1, 1, 1, 1,
0.7497575, 0.7944941, 0.9272736, 1, 1, 1, 1, 1,
0.7521352, -0.3875496, 2.433025, 1, 1, 1, 1, 1,
0.7568156, -1.143957, 1.919835, 1, 1, 1, 1, 1,
0.7612038, 1.116591, 0.08674843, 1, 1, 1, 1, 1,
0.7651018, 0.3516031, 0.4691048, 1, 1, 1, 1, 1,
0.766453, 1.080407, 1.198958, 1, 1, 1, 1, 1,
0.7664928, 0.9877408, -1.812053, 1, 1, 1, 1, 1,
0.7670429, -0.7054204, 2.882601, 1, 1, 1, 1, 1,
0.7730042, -0.1305698, 1.413107, 0, 0, 1, 1, 1,
0.7744416, -0.8822373, 0.4729088, 1, 0, 0, 1, 1,
0.7876558, -1.153839, 3.716398, 1, 0, 0, 1, 1,
0.7880456, 0.7979085, 1.561524, 1, 0, 0, 1, 1,
0.7891225, -1.399405, 3.057373, 1, 0, 0, 1, 1,
0.7893111, 0.2689608, 1.292789, 1, 0, 0, 1, 1,
0.7959326, -1.687451, 4.603384, 0, 0, 0, 1, 1,
0.8069979, -0.286845, 3.233675, 0, 0, 0, 1, 1,
0.8128459, -1.216233, 2.521166, 0, 0, 0, 1, 1,
0.8175845, 0.4368736, 0.1848312, 0, 0, 0, 1, 1,
0.8204711, -0.06381117, 0.7932826, 0, 0, 0, 1, 1,
0.8206794, -0.4631038, 1.019918, 0, 0, 0, 1, 1,
0.8225802, -0.4566886, 2.256982, 0, 0, 0, 1, 1,
0.8227739, 0.7281112, 0.1611458, 1, 1, 1, 1, 1,
0.8239737, 0.9596866, 1.524554, 1, 1, 1, 1, 1,
0.8280361, -1.021302, 3.714219, 1, 1, 1, 1, 1,
0.8299862, -0.01402131, 0.8545573, 1, 1, 1, 1, 1,
0.8323606, 0.252511, 0.4353793, 1, 1, 1, 1, 1,
0.8355058, -1.019435, 1.958787, 1, 1, 1, 1, 1,
0.8405806, -0.07592645, 0.9603756, 1, 1, 1, 1, 1,
0.8450674, -0.4036643, 1.070137, 1, 1, 1, 1, 1,
0.8558607, -0.8565332, 0.9396219, 1, 1, 1, 1, 1,
0.8565359, 0.3820998, 1.377911, 1, 1, 1, 1, 1,
0.858028, -1.028746, 2.68141, 1, 1, 1, 1, 1,
0.8625387, -2.135423, 2.05147, 1, 1, 1, 1, 1,
0.8642833, -0.3763349, 3.075915, 1, 1, 1, 1, 1,
0.872521, -0.6186779, 1.694496, 1, 1, 1, 1, 1,
0.876242, 0.09055848, 1.460986, 1, 1, 1, 1, 1,
0.878343, 1.494974, 0.6560543, 0, 0, 1, 1, 1,
0.880973, -0.3409915, 1.282495, 1, 0, 0, 1, 1,
0.8822483, -0.3084293, 1.558185, 1, 0, 0, 1, 1,
0.8823887, -0.4429653, 0.5786293, 1, 0, 0, 1, 1,
0.8891989, 1.867361, 1.131843, 1, 0, 0, 1, 1,
0.8898941, -0.2063135, 0.5469038, 1, 0, 0, 1, 1,
0.8912921, 0.9957965, 1.669922, 0, 0, 0, 1, 1,
0.8924777, 2.158003, 2.624409, 0, 0, 0, 1, 1,
0.8946325, 0.1045936, 1.686869, 0, 0, 0, 1, 1,
0.8954284, -2.113971, 2.850696, 0, 0, 0, 1, 1,
0.9004465, 0.2002955, 1.595903, 0, 0, 0, 1, 1,
0.9042088, 0.2490915, 1.417411, 0, 0, 0, 1, 1,
0.9054132, 1.359511, -0.3067394, 0, 0, 0, 1, 1,
0.9090118, 1.097258, 0.08206198, 1, 1, 1, 1, 1,
0.9119107, 0.3205734, 1.340074, 1, 1, 1, 1, 1,
0.9119951, 0.4448099, -0.7278363, 1, 1, 1, 1, 1,
0.9162006, 1.428318, 0.06834541, 1, 1, 1, 1, 1,
0.9164131, -0.5399947, 1.252398, 1, 1, 1, 1, 1,
0.9195623, -0.4794962, 2.138342, 1, 1, 1, 1, 1,
0.9198489, 0.8394095, 1.057663, 1, 1, 1, 1, 1,
0.9220596, -0.002115973, 1.194714, 1, 1, 1, 1, 1,
0.9225871, -0.4164257, 0.4557047, 1, 1, 1, 1, 1,
0.9242432, 0.6735261, 0.506525, 1, 1, 1, 1, 1,
0.9251667, -0.747299, 2.564991, 1, 1, 1, 1, 1,
0.9275138, -1.119225, 3.686351, 1, 1, 1, 1, 1,
0.9291723, -0.6464968, 2.548433, 1, 1, 1, 1, 1,
0.9375806, 1.584287, 1.274841, 1, 1, 1, 1, 1,
0.9380972, -1.053396, 3.633285, 1, 1, 1, 1, 1,
0.9443185, 0.9188171, 2.187742, 0, 0, 1, 1, 1,
0.9539151, 0.8424476, 1.016127, 1, 0, 0, 1, 1,
0.954095, -1.424106, 1.793503, 1, 0, 0, 1, 1,
0.956773, 0.713049, 0.3208461, 1, 0, 0, 1, 1,
0.957396, -0.7161489, 3.216393, 1, 0, 0, 1, 1,
0.9577998, -0.6483499, 1.633491, 1, 0, 0, 1, 1,
0.963328, 0.02198146, 1.432731, 0, 0, 0, 1, 1,
0.9637166, 0.3230843, 1.550849, 0, 0, 0, 1, 1,
0.9726011, -1.527357, 2.646525, 0, 0, 0, 1, 1,
0.9777873, -0.3288445, 1.647822, 0, 0, 0, 1, 1,
0.9794343, 0.8257762, -0.03029342, 0, 0, 0, 1, 1,
0.9859018, 0.5412444, 2.48189, 0, 0, 0, 1, 1,
0.991565, -0.9506465, 2.756737, 0, 0, 0, 1, 1,
0.9920734, -0.4365021, 1.469048, 1, 1, 1, 1, 1,
0.9930888, 0.4255536, 0.7679006, 1, 1, 1, 1, 1,
0.9994748, 0.9934132, 1.260928, 1, 1, 1, 1, 1,
1.003073, -1.548105, 2.842538, 1, 1, 1, 1, 1,
1.005659, 0.1269494, 1.442476, 1, 1, 1, 1, 1,
1.006092, -1.574011, 1.592069, 1, 1, 1, 1, 1,
1.006338, -1.891857, 3.014609, 1, 1, 1, 1, 1,
1.013522, -0.06432939, 2.404699, 1, 1, 1, 1, 1,
1.02131, 0.2394205, 2.433173, 1, 1, 1, 1, 1,
1.021842, -2.921098, 1.305012, 1, 1, 1, 1, 1,
1.022169, 1.869532, -0.1770797, 1, 1, 1, 1, 1,
1.022904, 0.8764859, 1.158019, 1, 1, 1, 1, 1,
1.02626, -0.5928499, 1.38548, 1, 1, 1, 1, 1,
1.029384, 0.4321256, 1.944409, 1, 1, 1, 1, 1,
1.033886, 2.972074, 0.915334, 1, 1, 1, 1, 1,
1.036799, -0.9058487, 1.208572, 0, 0, 1, 1, 1,
1.063549, -0.8016555, 2.422611, 1, 0, 0, 1, 1,
1.065608, 1.333643, 2.357066, 1, 0, 0, 1, 1,
1.067482, 0.7271507, 2.561887, 1, 0, 0, 1, 1,
1.072048, -0.08634634, 2.763573, 1, 0, 0, 1, 1,
1.080802, 0.3107367, 2.323062, 1, 0, 0, 1, 1,
1.083468, -0.107736, 1.268341, 0, 0, 0, 1, 1,
1.083665, -0.6410097, 2.796334, 0, 0, 0, 1, 1,
1.094914, 0.9540091, 0.1215564, 0, 0, 0, 1, 1,
1.103637, 1.475452, 2.363316, 0, 0, 0, 1, 1,
1.109073, 1.199847, -0.1004914, 0, 0, 0, 1, 1,
1.116201, 0.3201239, 2.096646, 0, 0, 0, 1, 1,
1.12732, 0.01406628, 1.054651, 0, 0, 0, 1, 1,
1.128054, -0.3966694, 1.466493, 1, 1, 1, 1, 1,
1.131627, 0.2986948, -0.08269163, 1, 1, 1, 1, 1,
1.141255, 0.7005507, 0.08608399, 1, 1, 1, 1, 1,
1.144152, 1.183815, 1.710952, 1, 1, 1, 1, 1,
1.154399, 0.7846128, 0.9959595, 1, 1, 1, 1, 1,
1.157859, 0.05799125, 0.9510819, 1, 1, 1, 1, 1,
1.16072, 0.31431, 0.2952548, 1, 1, 1, 1, 1,
1.173691, -0.619311, 2.919797, 1, 1, 1, 1, 1,
1.180476, -1.177787, 2.091924, 1, 1, 1, 1, 1,
1.193508, -2.819244, 1.456446, 1, 1, 1, 1, 1,
1.19748, -0.3127893, 2.938498, 1, 1, 1, 1, 1,
1.201512, -0.3462869, 1.811709, 1, 1, 1, 1, 1,
1.208605, -0.3192677, 1.223533, 1, 1, 1, 1, 1,
1.2114, -1.345, 2.076573, 1, 1, 1, 1, 1,
1.218674, -0.7582891, 4.01827, 1, 1, 1, 1, 1,
1.220733, -0.3736635, 1.797599, 0, 0, 1, 1, 1,
1.239656, 0.4891371, 2.014471, 1, 0, 0, 1, 1,
1.243932, -0.1125286, 1.092189, 1, 0, 0, 1, 1,
1.245447, 1.736323, -0.1700575, 1, 0, 0, 1, 1,
1.254305, -0.9908729, 1.815213, 1, 0, 0, 1, 1,
1.26386, -0.04273091, 1.255193, 1, 0, 0, 1, 1,
1.265124, 0.6520894, 0.2195523, 0, 0, 0, 1, 1,
1.265293, -0.8969128, 1.326599, 0, 0, 0, 1, 1,
1.268999, -0.9797187, 0.7962747, 0, 0, 0, 1, 1,
1.271869, -1.60778, 3.803575, 0, 0, 0, 1, 1,
1.281165, 0.8640183, 0.004851081, 0, 0, 0, 1, 1,
1.282494, 0.1844728, 1.926405, 0, 0, 0, 1, 1,
1.294412, 0.04257372, 2.449751, 0, 0, 0, 1, 1,
1.298986, -1.015373, 1.742921, 1, 1, 1, 1, 1,
1.300525, 0.899216, 1.698496, 1, 1, 1, 1, 1,
1.304279, -1.049702, 2.367142, 1, 1, 1, 1, 1,
1.304283, -0.5157101, 1.77825, 1, 1, 1, 1, 1,
1.306085, 1.295223, 1.845351, 1, 1, 1, 1, 1,
1.306234, -2.075314, 3.998445, 1, 1, 1, 1, 1,
1.307994, -0.7119369, -0.2925172, 1, 1, 1, 1, 1,
1.311375, 1.66387, 1.848406, 1, 1, 1, 1, 1,
1.3222, -0.6723562, 1.569214, 1, 1, 1, 1, 1,
1.334459, 0.9489485, 0.4818783, 1, 1, 1, 1, 1,
1.337394, 0.4780855, 2.235981, 1, 1, 1, 1, 1,
1.339626, 0.2917351, 1.669547, 1, 1, 1, 1, 1,
1.347997, 1.511934, 1.180411, 1, 1, 1, 1, 1,
1.351498, 1.507077, 2.048437, 1, 1, 1, 1, 1,
1.355319, -0.2517144, 2.632154, 1, 1, 1, 1, 1,
1.370259, -0.2472923, 0.86724, 0, 0, 1, 1, 1,
1.372918, -1.932596, 3.249367, 1, 0, 0, 1, 1,
1.37927, 1.111508, 1.783969, 1, 0, 0, 1, 1,
1.392906, -0.938648, 0.3488004, 1, 0, 0, 1, 1,
1.409934, -1.200904, 3.314724, 1, 0, 0, 1, 1,
1.410858, -1.796221, 2.10274, 1, 0, 0, 1, 1,
1.431152, -0.2070433, 2.067715, 0, 0, 0, 1, 1,
1.434674, 0.2649032, 1.872155, 0, 0, 0, 1, 1,
1.43754, -0.7121587, 1.171305, 0, 0, 0, 1, 1,
1.442821, -1.35288, 2.71282, 0, 0, 0, 1, 1,
1.444341, 0.623056, 2.494734, 0, 0, 0, 1, 1,
1.44487, 0.9339816, 0.4627057, 0, 0, 0, 1, 1,
1.45163, 0.3755808, 2.510225, 0, 0, 0, 1, 1,
1.458925, 0.4969137, 2.314922, 1, 1, 1, 1, 1,
1.460549, -1.03698, 2.056671, 1, 1, 1, 1, 1,
1.463783, -0.8925741, 0.1490277, 1, 1, 1, 1, 1,
1.465738, 0.3300627, 2.15458, 1, 1, 1, 1, 1,
1.485008, -0.3961301, 2.357906, 1, 1, 1, 1, 1,
1.490312, 0.7385298, 1.560439, 1, 1, 1, 1, 1,
1.493855, -2.060344, 1.182503, 1, 1, 1, 1, 1,
1.503891, 0.8783013, 0.07284084, 1, 1, 1, 1, 1,
1.51669, 1.161117, 1.036838, 1, 1, 1, 1, 1,
1.521636, -1.727237, 3.099942, 1, 1, 1, 1, 1,
1.533203, 1.253675, 0.3197001, 1, 1, 1, 1, 1,
1.543216, -1.556558, 1.37039, 1, 1, 1, 1, 1,
1.550181, 0.4153198, 0.6446, 1, 1, 1, 1, 1,
1.551077, 1.629812, 1.086353, 1, 1, 1, 1, 1,
1.586138, -0.2635138, 0.1770924, 1, 1, 1, 1, 1,
1.596402, 0.5112419, 1.950725, 0, 0, 1, 1, 1,
1.597921, 1.102837, 1.803034, 1, 0, 0, 1, 1,
1.603069, -1.863226, 3.539956, 1, 0, 0, 1, 1,
1.649404, 1.145452, 1.047119, 1, 0, 0, 1, 1,
1.664693, 0.5432534, 2.05003, 1, 0, 0, 1, 1,
1.669374, 1.361871, -2.099445, 1, 0, 0, 1, 1,
1.671232, 1.245514, 0.1562583, 0, 0, 0, 1, 1,
1.69771, -0.5411209, 1.988748, 0, 0, 0, 1, 1,
1.711904, 2.059005, 1.548166, 0, 0, 0, 1, 1,
1.714578, -0.004461366, 2.271896, 0, 0, 0, 1, 1,
1.722678, 0.2944288, 1.033556, 0, 0, 0, 1, 1,
1.731603, -0.3080419, 2.611434, 0, 0, 0, 1, 1,
1.7436, -0.4208025, 2.105484, 0, 0, 0, 1, 1,
1.744124, -0.7814683, 1.612373, 1, 1, 1, 1, 1,
1.745413, 0.162753, 2.442326, 1, 1, 1, 1, 1,
1.762169, -1.965088, 2.823087, 1, 1, 1, 1, 1,
1.790017, 0.7264804, 1.648078, 1, 1, 1, 1, 1,
1.792503, 0.4247344, 2.363413, 1, 1, 1, 1, 1,
1.793216, 1.934353, 2.506275, 1, 1, 1, 1, 1,
1.810855, -0.01662012, 0.5609895, 1, 1, 1, 1, 1,
1.850714, -1.191254, 1.947367, 1, 1, 1, 1, 1,
1.885888, 1.074585, 0.2800235, 1, 1, 1, 1, 1,
1.905887, -2.265474, 2.229905, 1, 1, 1, 1, 1,
1.916429, -0.07005703, 1.253207, 1, 1, 1, 1, 1,
1.942141, 0.0778981, 0.2858727, 1, 1, 1, 1, 1,
1.953956, -1.59099, 2.008109, 1, 1, 1, 1, 1,
1.997753, 0.3727165, 2.343653, 1, 1, 1, 1, 1,
2.090169, -0.3746972, 0.4426541, 1, 1, 1, 1, 1,
2.125166, -0.890788, 4.246496, 0, 0, 1, 1, 1,
2.149411, 1.549215, -0.6856271, 1, 0, 0, 1, 1,
2.153668, 0.04829295, 0.650768, 1, 0, 0, 1, 1,
2.155723, -0.3790002, 2.334639, 1, 0, 0, 1, 1,
2.196579, -0.275494, 1.94225, 1, 0, 0, 1, 1,
2.223098, -0.01368455, 1.978286, 1, 0, 0, 1, 1,
2.29544, 0.4380768, 1.872114, 0, 0, 0, 1, 1,
2.306038, 0.5644442, 0.4485812, 0, 0, 0, 1, 1,
2.31669, 1.920301, 1.499812, 0, 0, 0, 1, 1,
2.352044, 0.7222829, 1.464913, 0, 0, 0, 1, 1,
2.379146, -0.8713374, 2.733651, 0, 0, 0, 1, 1,
2.527659, -0.6878685, 2.903898, 0, 0, 0, 1, 1,
2.533153, 0.8479072, 0.8162539, 0, 0, 0, 1, 1,
2.624238, -0.5344037, 0.1278283, 1, 1, 1, 1, 1,
2.631793, -0.1937807, 3.24059, 1, 1, 1, 1, 1,
2.6463, -0.02612918, 0.5920252, 1, 1, 1, 1, 1,
2.889562, 0.8167558, 3.007524, 1, 1, 1, 1, 1,
2.908422, -0.2094888, 0.6696905, 1, 1, 1, 1, 1,
3.001686, -0.6162139, 2.530777, 1, 1, 1, 1, 1,
3.566087, 0.9367341, -0.5014355, 1, 1, 1, 1, 1
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
var radius = 9.890588;
var distance = 34.74027;
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
mvMatrix.translate( 0.02439618, 0.2090008, 0.2418749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74027);
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
