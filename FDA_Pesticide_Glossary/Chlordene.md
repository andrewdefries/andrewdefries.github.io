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
-3.134512, 1.133785, -2.465526, 1, 0, 0, 1,
-2.793215, -1.034754, -1.885948, 1, 0.007843138, 0, 1,
-2.532343, -0.6184196, -3.006135, 1, 0.01176471, 0, 1,
-2.473654, 0.05758016, -1.434898, 1, 0.01960784, 0, 1,
-2.46681, -0.6628951, -3.400964, 1, 0.02352941, 0, 1,
-2.387676, -2.416155, -3.012016, 1, 0.03137255, 0, 1,
-2.376014, 1.973599, 0.2211213, 1, 0.03529412, 0, 1,
-2.307136, 0.8373456, -0.9841851, 1, 0.04313726, 0, 1,
-2.297653, 0.5405807, -0.2832998, 1, 0.04705882, 0, 1,
-2.255347, 1.649954, -0.3875417, 1, 0.05490196, 0, 1,
-2.230607, 0.2039626, -1.3637, 1, 0.05882353, 0, 1,
-2.186633, 1.072091, -1.835771, 1, 0.06666667, 0, 1,
-2.176232, 0.6841187, -1.665057, 1, 0.07058824, 0, 1,
-2.147032, -0.4555122, -2.347325, 1, 0.07843138, 0, 1,
-2.139336, 0.125021, -0.7672179, 1, 0.08235294, 0, 1,
-2.133534, 1.458067, -2.434675, 1, 0.09019608, 0, 1,
-2.115287, 0.3507664, -1.552057, 1, 0.09411765, 0, 1,
-2.098948, -1.633634, -2.209203, 1, 0.1019608, 0, 1,
-2.09363, -0.02088803, -2.833753, 1, 0.1098039, 0, 1,
-2.090731, 1.729382, -0.145721, 1, 0.1137255, 0, 1,
-2.068582, -0.4409892, -2.041672, 1, 0.1215686, 0, 1,
-2.06236, 0.8174624, -1.301018, 1, 0.1254902, 0, 1,
-1.962746, -0.4041337, -0.8146554, 1, 0.1333333, 0, 1,
-1.9543, -1.303946, -3.339644, 1, 0.1372549, 0, 1,
-1.938063, 0.3993777, -1.653502, 1, 0.145098, 0, 1,
-1.935638, 1.312764, 0.2540658, 1, 0.1490196, 0, 1,
-1.930619, -0.1359413, -3.332318, 1, 0.1568628, 0, 1,
-1.928183, 1.476133, -0.03201935, 1, 0.1607843, 0, 1,
-1.922204, -0.08555916, -0.7610142, 1, 0.1686275, 0, 1,
-1.881723, 1.150466, -1.679844, 1, 0.172549, 0, 1,
-1.865876, 1.484868, 0.5406424, 1, 0.1803922, 0, 1,
-1.860866, -0.2871931, -1.119393, 1, 0.1843137, 0, 1,
-1.860471, -1.231698, -1.99592, 1, 0.1921569, 0, 1,
-1.844235, -0.4759059, -2.378371, 1, 0.1960784, 0, 1,
-1.842158, 2.527687, -0.2714874, 1, 0.2039216, 0, 1,
-1.8412, 0.4820719, -0.6837421, 1, 0.2117647, 0, 1,
-1.840077, -0.1311134, -0.3310364, 1, 0.2156863, 0, 1,
-1.820909, -0.5633332, 0.8537384, 1, 0.2235294, 0, 1,
-1.817861, -0.8791804, -0.9350811, 1, 0.227451, 0, 1,
-1.805167, -1.276374, -3.162568, 1, 0.2352941, 0, 1,
-1.803117, -0.7062303, -0.9654769, 1, 0.2392157, 0, 1,
-1.801178, -0.5428672, -1.383301, 1, 0.2470588, 0, 1,
-1.7993, -0.3724646, -3.076714, 1, 0.2509804, 0, 1,
-1.795026, 0.6788734, -0.8992689, 1, 0.2588235, 0, 1,
-1.778738, -1.095999, -2.305547, 1, 0.2627451, 0, 1,
-1.772402, 1.913715, -1.190241, 1, 0.2705882, 0, 1,
-1.765632, 0.4744236, -0.8261687, 1, 0.2745098, 0, 1,
-1.721363, 1.669565, -2.230414, 1, 0.282353, 0, 1,
-1.718162, -0.4383462, -1.95769, 1, 0.2862745, 0, 1,
-1.691274, 0.1345939, -3.217592, 1, 0.2941177, 0, 1,
-1.684357, 0.3049143, -2.039541, 1, 0.3019608, 0, 1,
-1.68305, 0.2884899, -0.5122768, 1, 0.3058824, 0, 1,
-1.675727, 0.267353, -2.959593, 1, 0.3137255, 0, 1,
-1.672233, 1.254025, -0.6921827, 1, 0.3176471, 0, 1,
-1.666238, -1.217876, -1.634875, 1, 0.3254902, 0, 1,
-1.655792, 0.822138, -0.7235522, 1, 0.3294118, 0, 1,
-1.646643, 0.4498866, 1.328076, 1, 0.3372549, 0, 1,
-1.644894, 1.067941, -1.108921, 1, 0.3411765, 0, 1,
-1.641539, -1.420415, -2.77962, 1, 0.3490196, 0, 1,
-1.640623, -1.153064, -2.011213, 1, 0.3529412, 0, 1,
-1.634783, -1.564415, -3.347051, 1, 0.3607843, 0, 1,
-1.628367, -0.5915072, -3.942162, 1, 0.3647059, 0, 1,
-1.626997, -0.6139987, -1.090356, 1, 0.372549, 0, 1,
-1.623528, -0.5976778, -1.479984, 1, 0.3764706, 0, 1,
-1.622946, 1.289543, -2.376714, 1, 0.3843137, 0, 1,
-1.620135, 0.1882362, -0.9993731, 1, 0.3882353, 0, 1,
-1.617062, 1.313702, -3.011444, 1, 0.3960784, 0, 1,
-1.60972, 0.7360691, -0.882933, 1, 0.4039216, 0, 1,
-1.605734, 0.3680762, -1.821039, 1, 0.4078431, 0, 1,
-1.596332, -0.8356057, -2.134604, 1, 0.4156863, 0, 1,
-1.588555, -1.15182, -1.83707, 1, 0.4196078, 0, 1,
-1.587565, -0.8316886, -2.764412, 1, 0.427451, 0, 1,
-1.576757, -0.7456119, -0.9695584, 1, 0.4313726, 0, 1,
-1.555078, 0.1624887, -1.077727, 1, 0.4392157, 0, 1,
-1.549138, 1.325218, -2.161051, 1, 0.4431373, 0, 1,
-1.54654, 1.068465, -0.1962081, 1, 0.4509804, 0, 1,
-1.542866, -0.7113349, -0.6233326, 1, 0.454902, 0, 1,
-1.531734, -0.4345365, -3.532479, 1, 0.4627451, 0, 1,
-1.526894, 0.4344015, -1.347521, 1, 0.4666667, 0, 1,
-1.526664, 0.5765243, -0.4067675, 1, 0.4745098, 0, 1,
-1.524108, 0.05777999, -0.8398924, 1, 0.4784314, 0, 1,
-1.511825, -0.1867937, -1.446993, 1, 0.4862745, 0, 1,
-1.507144, 1.153286, -0.7701742, 1, 0.4901961, 0, 1,
-1.501277, 0.9884837, 0.2505784, 1, 0.4980392, 0, 1,
-1.50127, -0.03911772, -0.9346294, 1, 0.5058824, 0, 1,
-1.482176, 1.071252, -1.323959, 1, 0.509804, 0, 1,
-1.477636, 1.22744, -1.018988, 1, 0.5176471, 0, 1,
-1.474282, 0.06231205, -0.7657144, 1, 0.5215687, 0, 1,
-1.472795, 0.3255336, -0.7251772, 1, 0.5294118, 0, 1,
-1.471744, -0.2426212, -2.267138, 1, 0.5333334, 0, 1,
-1.466514, -1.338574, -2.748101, 1, 0.5411765, 0, 1,
-1.463927, -0.3245021, -0.8140909, 1, 0.5450981, 0, 1,
-1.441289, 0.9278751, -1.985121, 1, 0.5529412, 0, 1,
-1.42342, 0.3671396, -1.010883, 1, 0.5568628, 0, 1,
-1.418025, 1.640474, -0.1836172, 1, 0.5647059, 0, 1,
-1.417268, -0.3936546, -3.463554, 1, 0.5686275, 0, 1,
-1.415619, 0.8192176, -0.01033484, 1, 0.5764706, 0, 1,
-1.403548, 0.5578204, -0.3909479, 1, 0.5803922, 0, 1,
-1.397604, -1.655877, -2.454428, 1, 0.5882353, 0, 1,
-1.394943, 0.7584792, -1.481513, 1, 0.5921569, 0, 1,
-1.394279, -0.1668378, -5.290563, 1, 0.6, 0, 1,
-1.379904, -1.133051, -1.270385, 1, 0.6078432, 0, 1,
-1.370123, -0.9110627, -4.223296, 1, 0.6117647, 0, 1,
-1.344327, -0.1239643, -2.406991, 1, 0.6196079, 0, 1,
-1.33219, 1.397371, 0.2887393, 1, 0.6235294, 0, 1,
-1.327071, -0.8829545, -0.7862736, 1, 0.6313726, 0, 1,
-1.324776, -0.5499834, -2.534259, 1, 0.6352941, 0, 1,
-1.324068, 0.7711701, -0.7266001, 1, 0.6431373, 0, 1,
-1.323783, 0.6459207, -0.6149195, 1, 0.6470588, 0, 1,
-1.320314, 0.2117271, -0.5782341, 1, 0.654902, 0, 1,
-1.31166, 1.101416, -1.067586, 1, 0.6588235, 0, 1,
-1.310701, -1.00788, -4.3561, 1, 0.6666667, 0, 1,
-1.298677, -0.7519887, -1.029826, 1, 0.6705883, 0, 1,
-1.291961, -1.809262, -3.973556, 1, 0.6784314, 0, 1,
-1.290487, 0.4988775, -2.103483, 1, 0.682353, 0, 1,
-1.289445, 1.386325, -0.8219151, 1, 0.6901961, 0, 1,
-1.276723, 0.8662609, -2.002963, 1, 0.6941177, 0, 1,
-1.263571, -0.01676092, -3.406551, 1, 0.7019608, 0, 1,
-1.26184, -2.685863, -3.40395, 1, 0.7098039, 0, 1,
-1.25995, -1.496539, -1.749679, 1, 0.7137255, 0, 1,
-1.250739, -0.3006731, -0.5331656, 1, 0.7215686, 0, 1,
-1.246852, 0.5020998, -1.521937, 1, 0.7254902, 0, 1,
-1.225166, -1.441923, -3.970824, 1, 0.7333333, 0, 1,
-1.214155, -0.159081, -1.231428, 1, 0.7372549, 0, 1,
-1.212257, -0.4097463, -2.775412, 1, 0.7450981, 0, 1,
-1.207556, 1.637304, 1.480974, 1, 0.7490196, 0, 1,
-1.205931, -0.5888189, -1.475259, 1, 0.7568628, 0, 1,
-1.204683, 0.04874914, -1.380599, 1, 0.7607843, 0, 1,
-1.20063, 1.189847, -0.7857611, 1, 0.7686275, 0, 1,
-1.193103, 0.02141989, -0.7826391, 1, 0.772549, 0, 1,
-1.189104, -0.1776153, -1.939076, 1, 0.7803922, 0, 1,
-1.1853, 0.7389509, 0.05710875, 1, 0.7843137, 0, 1,
-1.184583, -1.05365, -1.611488, 1, 0.7921569, 0, 1,
-1.181741, 0.2061992, -1.837679, 1, 0.7960784, 0, 1,
-1.179785, 0.977852, -2.775393, 1, 0.8039216, 0, 1,
-1.179443, 1.417912, -3.523382, 1, 0.8117647, 0, 1,
-1.169407, -1.474903, -0.9313465, 1, 0.8156863, 0, 1,
-1.166544, -0.1309629, 0.02587558, 1, 0.8235294, 0, 1,
-1.166002, 0.3583315, -1.040039, 1, 0.827451, 0, 1,
-1.165896, 0.3943208, -2.729119, 1, 0.8352941, 0, 1,
-1.141424, 1.385943, -0.04109909, 1, 0.8392157, 0, 1,
-1.138209, 0.7016986, 0.2083635, 1, 0.8470588, 0, 1,
-1.138153, 0.6854, -1.355282, 1, 0.8509804, 0, 1,
-1.134065, 0.7455001, -1.08816, 1, 0.8588235, 0, 1,
-1.12552, -0.08392318, -2.907866, 1, 0.8627451, 0, 1,
-1.115816, -0.1345626, -0.3505574, 1, 0.8705882, 0, 1,
-1.113166, -1.491217, -2.251193, 1, 0.8745098, 0, 1,
-1.10891, 0.02179924, -1.491625, 1, 0.8823529, 0, 1,
-1.095494, 1.804997, 0.1792487, 1, 0.8862745, 0, 1,
-1.089019, -0.1028762, -1.254048, 1, 0.8941177, 0, 1,
-1.088614, 0.5943072, -1.064199, 1, 0.8980392, 0, 1,
-1.086999, -0.5010024, -2.654366, 1, 0.9058824, 0, 1,
-1.081789, -0.1726297, -2.151701, 1, 0.9137255, 0, 1,
-1.077114, 1.321326, -2.836687, 1, 0.9176471, 0, 1,
-1.06802, 0.3033532, -0.7676544, 1, 0.9254902, 0, 1,
-1.066484, 0.1612956, -3.031697, 1, 0.9294118, 0, 1,
-1.065148, -1.585028, -1.828543, 1, 0.9372549, 0, 1,
-1.060531, -0.001619228, -0.4915876, 1, 0.9411765, 0, 1,
-1.058644, -0.05351913, -2.13095, 1, 0.9490196, 0, 1,
-1.04659, -1.390825, -3.448771, 1, 0.9529412, 0, 1,
-1.043597, -0.6880091, -1.80863, 1, 0.9607843, 0, 1,
-1.040163, -1.017107, -1.513792, 1, 0.9647059, 0, 1,
-1.039179, 1.187788, -0.8251117, 1, 0.972549, 0, 1,
-1.038459, 1.880615, -1.329761, 1, 0.9764706, 0, 1,
-1.03655, -0.9181153, -0.3418518, 1, 0.9843137, 0, 1,
-1.031633, -0.3655808, -1.557408, 1, 0.9882353, 0, 1,
-1.023338, -0.2936865, -2.159759, 1, 0.9960784, 0, 1,
-1.022542, 0.1347637, -2.862182, 0.9960784, 1, 0, 1,
-1.011909, 0.1371129, -1.554917, 0.9921569, 1, 0, 1,
-1.010155, 1.058817, -1.132159, 0.9843137, 1, 0, 1,
-1.00884, -0.4565937, -2.763982, 0.9803922, 1, 0, 1,
-1.003013, 0.1596924, -3.165712, 0.972549, 1, 0, 1,
-0.9927844, 0.3401818, -1.75827, 0.9686275, 1, 0, 1,
-0.981282, 0.4550314, -1.717764, 0.9607843, 1, 0, 1,
-0.9749206, 0.4469562, -1.683473, 0.9568627, 1, 0, 1,
-0.9747827, 0.5009462, -0.6144676, 0.9490196, 1, 0, 1,
-0.9738023, -1.028116, -2.522037, 0.945098, 1, 0, 1,
-0.9660896, 0.5457682, -0.3672166, 0.9372549, 1, 0, 1,
-0.955391, -0.2343584, -1.856003, 0.9333333, 1, 0, 1,
-0.9539424, -0.04352889, -1.239637, 0.9254902, 1, 0, 1,
-0.9440537, 2.106753, -0.8836412, 0.9215686, 1, 0, 1,
-0.942634, -0.24221, -0.5208545, 0.9137255, 1, 0, 1,
-0.9275326, 1.754012, -2.072335, 0.9098039, 1, 0, 1,
-0.9272771, -1.474149, -2.059062, 0.9019608, 1, 0, 1,
-0.9267415, -0.07642058, -3.142243, 0.8941177, 1, 0, 1,
-0.9222695, -0.03105211, -1.77427, 0.8901961, 1, 0, 1,
-0.9220179, -0.3239908, -2.674715, 0.8823529, 1, 0, 1,
-0.9183937, 0.04319272, -2.03887, 0.8784314, 1, 0, 1,
-0.9171314, 0.1540174, -0.8366634, 0.8705882, 1, 0, 1,
-0.9142238, -0.2051467, -0.08141433, 0.8666667, 1, 0, 1,
-0.9042707, -0.1931804, -1.972563, 0.8588235, 1, 0, 1,
-0.9007246, 0.1065133, -3.422598, 0.854902, 1, 0, 1,
-0.8925263, 0.6755783, -1.167198, 0.8470588, 1, 0, 1,
-0.8912574, 0.6728087, 0.006157945, 0.8431373, 1, 0, 1,
-0.8894335, 1.489429, -0.01862361, 0.8352941, 1, 0, 1,
-0.8894156, -0.998606, -1.495219, 0.8313726, 1, 0, 1,
-0.8886963, -0.6662351, -2.894344, 0.8235294, 1, 0, 1,
-0.887168, -0.2927585, -1.279266, 0.8196079, 1, 0, 1,
-0.8857784, 0.7775376, -0.8639413, 0.8117647, 1, 0, 1,
-0.8834569, -0.161441, -2.599673, 0.8078431, 1, 0, 1,
-0.8827344, 3.072068, 0.3207545, 0.8, 1, 0, 1,
-0.8746114, 0.1244705, -1.546821, 0.7921569, 1, 0, 1,
-0.8733162, 0.5918175, -0.8103878, 0.7882353, 1, 0, 1,
-0.8719478, 1.056282, -1.088211, 0.7803922, 1, 0, 1,
-0.8666015, 1.852062, 1.32837, 0.7764706, 1, 0, 1,
-0.866163, 1.217187, 0.1654112, 0.7686275, 1, 0, 1,
-0.8636173, 0.7339396, -0.02867824, 0.7647059, 1, 0, 1,
-0.8594748, -0.2715258, -2.893423, 0.7568628, 1, 0, 1,
-0.8553363, -0.8511747, -4.090014, 0.7529412, 1, 0, 1,
-0.8517106, 1.061533, -2.470893, 0.7450981, 1, 0, 1,
-0.8471035, -0.5071865, -1.212199, 0.7411765, 1, 0, 1,
-0.8377235, -1.031806, -2.345118, 0.7333333, 1, 0, 1,
-0.835409, 0.8763757, -0.3937728, 0.7294118, 1, 0, 1,
-0.8311648, -2.118959, -2.07825, 0.7215686, 1, 0, 1,
-0.8283792, 0.2698606, -3.403481, 0.7176471, 1, 0, 1,
-0.8268661, -1.051032, -2.707642, 0.7098039, 1, 0, 1,
-0.8247293, -1.984753, -3.841424, 0.7058824, 1, 0, 1,
-0.8201352, -1.066239, -3.10927, 0.6980392, 1, 0, 1,
-0.8151456, 1.437348, -0.611199, 0.6901961, 1, 0, 1,
-0.8139307, -0.1506823, 0.1544996, 0.6862745, 1, 0, 1,
-0.8094442, -0.06957719, -1.630364, 0.6784314, 1, 0, 1,
-0.8039535, 0.7407615, -0.792061, 0.6745098, 1, 0, 1,
-0.801946, 0.2248778, -1.299436, 0.6666667, 1, 0, 1,
-0.7982563, -0.5927904, -1.46302, 0.6627451, 1, 0, 1,
-0.7927635, 0.7431597, -1.904173, 0.654902, 1, 0, 1,
-0.7862217, 1.616837, -0.2452448, 0.6509804, 1, 0, 1,
-0.7765545, -1.313198, -1.82295, 0.6431373, 1, 0, 1,
-0.7752997, -0.01801471, 1.154517, 0.6392157, 1, 0, 1,
-0.7691175, -1.104898, -2.335128, 0.6313726, 1, 0, 1,
-0.7679246, 1.372687, -0.8422939, 0.627451, 1, 0, 1,
-0.7640506, 0.07205953, -1.223162, 0.6196079, 1, 0, 1,
-0.7639836, 1.292235, 0.1783915, 0.6156863, 1, 0, 1,
-0.7639121, 1.98542, 0.2498381, 0.6078432, 1, 0, 1,
-0.759792, -0.1138599, -0.8492967, 0.6039216, 1, 0, 1,
-0.7503912, 0.7376081, 0.2003885, 0.5960785, 1, 0, 1,
-0.7463229, -0.4207655, -2.046848, 0.5882353, 1, 0, 1,
-0.7459418, -0.9534175, -0.7264163, 0.5843138, 1, 0, 1,
-0.7442514, -0.2228301, -1.745551, 0.5764706, 1, 0, 1,
-0.7407922, 0.1064069, -2.221563, 0.572549, 1, 0, 1,
-0.7395204, 0.05511444, -1.440473, 0.5647059, 1, 0, 1,
-0.7367041, -0.06378856, -1.944784, 0.5607843, 1, 0, 1,
-0.7362646, -1.191192, -1.84469, 0.5529412, 1, 0, 1,
-0.7278922, 2.171867, 0.5380735, 0.5490196, 1, 0, 1,
-0.7278371, -0.9440287, -3.014966, 0.5411765, 1, 0, 1,
-0.7270169, -0.5192993, -1.615342, 0.5372549, 1, 0, 1,
-0.7262599, 0.04571706, -1.634194, 0.5294118, 1, 0, 1,
-0.7245975, -0.1935905, -1.943152, 0.5254902, 1, 0, 1,
-0.722636, -0.1224344, -1.784455, 0.5176471, 1, 0, 1,
-0.7187878, 0.2187629, -2.034997, 0.5137255, 1, 0, 1,
-0.7169612, 0.02712214, -1.199739, 0.5058824, 1, 0, 1,
-0.7101099, -0.4635314, -3.021375, 0.5019608, 1, 0, 1,
-0.7097055, 0.7051418, -1.45237, 0.4941176, 1, 0, 1,
-0.7061594, 2.228071, 0.8519019, 0.4862745, 1, 0, 1,
-0.7059282, 0.9810512, -0.8070408, 0.4823529, 1, 0, 1,
-0.6999265, -0.147793, -3.389544, 0.4745098, 1, 0, 1,
-0.6938309, 1.262457, 0.4933789, 0.4705882, 1, 0, 1,
-0.6931858, -1.007026, -1.792687, 0.4627451, 1, 0, 1,
-0.682379, 0.419307, -1.425885, 0.4588235, 1, 0, 1,
-0.6818299, 1.205308, -1.870526, 0.4509804, 1, 0, 1,
-0.6805685, 0.8877242, -0.6478388, 0.4470588, 1, 0, 1,
-0.6803349, 1.158586, -0.05457244, 0.4392157, 1, 0, 1,
-0.6780676, -1.422081, -3.613556, 0.4352941, 1, 0, 1,
-0.6777495, -0.3839073, -0.3746575, 0.427451, 1, 0, 1,
-0.6724127, 1.180313, -2.29486, 0.4235294, 1, 0, 1,
-0.666235, 1.496479, -0.9068819, 0.4156863, 1, 0, 1,
-0.6633096, -0.6842067, -2.279432, 0.4117647, 1, 0, 1,
-0.6624373, -0.413236, 0.3126595, 0.4039216, 1, 0, 1,
-0.6601021, -0.8164846, -3.723225, 0.3960784, 1, 0, 1,
-0.654458, -0.2951956, -3.376304, 0.3921569, 1, 0, 1,
-0.652497, 0.2676219, 1.006309, 0.3843137, 1, 0, 1,
-0.651193, -0.8172081, -4.035869, 0.3803922, 1, 0, 1,
-0.6386283, 0.5246185, -1.831156, 0.372549, 1, 0, 1,
-0.6384984, -0.3213095, -3.398741, 0.3686275, 1, 0, 1,
-0.6325728, -0.1301346, -2.230027, 0.3607843, 1, 0, 1,
-0.6300021, -1.641438, -4.09043, 0.3568628, 1, 0, 1,
-0.6299704, -2.065803, -3.331528, 0.3490196, 1, 0, 1,
-0.6283746, -0.4188269, -2.873616, 0.345098, 1, 0, 1,
-0.6269471, -1.981821, -4.186589, 0.3372549, 1, 0, 1,
-0.6237442, 0.4694322, -1.340182, 0.3333333, 1, 0, 1,
-0.6233516, 0.02920921, -1.90502, 0.3254902, 1, 0, 1,
-0.6192664, -0.748634, -3.533512, 0.3215686, 1, 0, 1,
-0.617615, 0.6786553, -1.053182, 0.3137255, 1, 0, 1,
-0.6126094, 2.350488, 0.2652888, 0.3098039, 1, 0, 1,
-0.6078683, -1.0436, -3.850547, 0.3019608, 1, 0, 1,
-0.6065851, -0.4345601, -0.4350705, 0.2941177, 1, 0, 1,
-0.6032311, -0.4024304, -1.119828, 0.2901961, 1, 0, 1,
-0.6029553, -0.06690113, -0.5112167, 0.282353, 1, 0, 1,
-0.5981542, 0.8635975, -0.716221, 0.2784314, 1, 0, 1,
-0.5959797, -1.546639, -3.358002, 0.2705882, 1, 0, 1,
-0.5876072, -0.4096321, -3.055733, 0.2666667, 1, 0, 1,
-0.5823767, -0.946398, -1.780998, 0.2588235, 1, 0, 1,
-0.5802802, 1.445418, -2.877872, 0.254902, 1, 0, 1,
-0.5798247, -1.101761, -2.772911, 0.2470588, 1, 0, 1,
-0.5758877, -0.2251907, -0.5719271, 0.2431373, 1, 0, 1,
-0.5721585, 1.58908, -0.4578115, 0.2352941, 1, 0, 1,
-0.5674232, 0.9231445, 0.2477241, 0.2313726, 1, 0, 1,
-0.5644579, 0.05121923, -2.218015, 0.2235294, 1, 0, 1,
-0.5521984, 0.2885255, -2.419911, 0.2196078, 1, 0, 1,
-0.5521302, -0.1942771, -1.467865, 0.2117647, 1, 0, 1,
-0.5468094, -0.4160722, -3.48084, 0.2078431, 1, 0, 1,
-0.5466164, 0.5025228, -0.6927343, 0.2, 1, 0, 1,
-0.5421042, -0.143708, -1.51914, 0.1921569, 1, 0, 1,
-0.5404514, -0.5666677, -2.366829, 0.1882353, 1, 0, 1,
-0.5363815, -0.704672, -1.792506, 0.1803922, 1, 0, 1,
-0.5360411, 0.429507, -0.6323891, 0.1764706, 1, 0, 1,
-0.5252671, -0.150945, -3.020147, 0.1686275, 1, 0, 1,
-0.5244843, 0.8509993, -2.708939, 0.1647059, 1, 0, 1,
-0.5237157, -1.4756, -5.053602, 0.1568628, 1, 0, 1,
-0.5173541, -0.2921648, -2.402289, 0.1529412, 1, 0, 1,
-0.5119804, 1.907415, 0.4697635, 0.145098, 1, 0, 1,
-0.5068119, -1.169463, -3.35585, 0.1411765, 1, 0, 1,
-0.5050256, -0.166346, -2.314246, 0.1333333, 1, 0, 1,
-0.5043613, -0.6809393, -2.652389, 0.1294118, 1, 0, 1,
-0.4916284, 0.3840903, -1.685905, 0.1215686, 1, 0, 1,
-0.4912484, -1.785366, -2.4577, 0.1176471, 1, 0, 1,
-0.4758659, -0.5099681, -3.031198, 0.1098039, 1, 0, 1,
-0.4709763, 0.6615469, -1.431154, 0.1058824, 1, 0, 1,
-0.4695552, 2.066636, -0.9355507, 0.09803922, 1, 0, 1,
-0.4680583, 0.1011922, -2.376748, 0.09019608, 1, 0, 1,
-0.4664117, -0.08511893, -1.889458, 0.08627451, 1, 0, 1,
-0.4636701, 0.1318747, -1.720899, 0.07843138, 1, 0, 1,
-0.4620784, 0.3773355, -0.07627031, 0.07450981, 1, 0, 1,
-0.4598044, -1.096987, -2.446095, 0.06666667, 1, 0, 1,
-0.4578733, 0.7680285, -1.401734, 0.0627451, 1, 0, 1,
-0.4571148, 0.9390428, -1.58013, 0.05490196, 1, 0, 1,
-0.4559639, 1.458211, -2.05074, 0.05098039, 1, 0, 1,
-0.4536655, -0.8523133, -2.679225, 0.04313726, 1, 0, 1,
-0.4508955, -0.7422593, -4.478319, 0.03921569, 1, 0, 1,
-0.450321, 0.5000725, -0.2097965, 0.03137255, 1, 0, 1,
-0.4459408, 1.037881, -0.2981972, 0.02745098, 1, 0, 1,
-0.4437198, 0.5636751, 1.16079, 0.01960784, 1, 0, 1,
-0.4425004, 2.100637, 0.9672114, 0.01568628, 1, 0, 1,
-0.439877, -0.2625319, -2.097863, 0.007843138, 1, 0, 1,
-0.4353578, 0.1729625, -1.034063, 0.003921569, 1, 0, 1,
-0.4298867, -0.6308991, -4.035664, 0, 1, 0.003921569, 1,
-0.427557, -0.613703, -2.336357, 0, 1, 0.01176471, 1,
-0.4252838, 1.025509, -1.060566, 0, 1, 0.01568628, 1,
-0.4235677, 1.625064, -0.6333987, 0, 1, 0.02352941, 1,
-0.416916, 1.843963, 0.0171874, 0, 1, 0.02745098, 1,
-0.4095359, 0.7646459, 0.6904935, 0, 1, 0.03529412, 1,
-0.4059649, 1.356879, 0.964155, 0, 1, 0.03921569, 1,
-0.4053212, -0.5967994, -1.217192, 0, 1, 0.04705882, 1,
-0.4021392, -0.219699, -3.422217, 0, 1, 0.05098039, 1,
-0.3940914, 0.07034104, -2.255098, 0, 1, 0.05882353, 1,
-0.3897299, -0.4697095, -1.456327, 0, 1, 0.0627451, 1,
-0.3894527, 0.2812344, -1.820528, 0, 1, 0.07058824, 1,
-0.3890973, -0.9522278, -2.545367, 0, 1, 0.07450981, 1,
-0.3884887, 1.024183, 0.8248814, 0, 1, 0.08235294, 1,
-0.3832586, -0.4713368, -2.044754, 0, 1, 0.08627451, 1,
-0.3794772, 1.679775, -0.02072712, 0, 1, 0.09411765, 1,
-0.379291, -0.4252528, -1.081911, 0, 1, 0.1019608, 1,
-0.3786041, 0.7530068, 0.1389166, 0, 1, 0.1058824, 1,
-0.3783443, 2.247794, -0.06587221, 0, 1, 0.1137255, 1,
-0.3763854, -0.6306589, -4.218477, 0, 1, 0.1176471, 1,
-0.3739678, 1.004212, -0.917302, 0, 1, 0.1254902, 1,
-0.3738946, 0.8135291, -0.4606226, 0, 1, 0.1294118, 1,
-0.3716453, 0.9855177, -0.6699435, 0, 1, 0.1372549, 1,
-0.3716414, 0.2768312, -1.396615, 0, 1, 0.1411765, 1,
-0.3708663, -0.4999644, -1.504286, 0, 1, 0.1490196, 1,
-0.3691554, -1.976991, -2.638203, 0, 1, 0.1529412, 1,
-0.3666199, 0.1728402, -0.2001642, 0, 1, 0.1607843, 1,
-0.3643007, 0.2798773, -0.2138167, 0, 1, 0.1647059, 1,
-0.3627232, -0.3278657, -1.524264, 0, 1, 0.172549, 1,
-0.3592348, -0.4544204, -3.53599, 0, 1, 0.1764706, 1,
-0.3538433, -0.03484846, -2.344856, 0, 1, 0.1843137, 1,
-0.3534035, -1.096615, -3.819419, 0, 1, 0.1882353, 1,
-0.3524606, 1.003338, -0.5673962, 0, 1, 0.1960784, 1,
-0.3463407, -0.2804855, -2.644073, 0, 1, 0.2039216, 1,
-0.3460785, -0.9382579, -3.952589, 0, 1, 0.2078431, 1,
-0.3405403, 1.70681, -0.9645407, 0, 1, 0.2156863, 1,
-0.3405092, -1.608213, -1.799237, 0, 1, 0.2196078, 1,
-0.3389084, -1.60911, -1.973996, 0, 1, 0.227451, 1,
-0.3355063, -0.9155002, -2.819509, 0, 1, 0.2313726, 1,
-0.3315699, 0.8265121, -0.06755554, 0, 1, 0.2392157, 1,
-0.3293471, 0.929181, 0.3864135, 0, 1, 0.2431373, 1,
-0.3290178, -0.3700863, -2.241145, 0, 1, 0.2509804, 1,
-0.3239996, 0.3974024, -1.010506, 0, 1, 0.254902, 1,
-0.3189975, -1.392708, -3.32533, 0, 1, 0.2627451, 1,
-0.3176056, 0.2722224, -0.4797544, 0, 1, 0.2666667, 1,
-0.3158325, 0.4625847, -2.277762, 0, 1, 0.2745098, 1,
-0.3152063, -0.2454401, -2.466514, 0, 1, 0.2784314, 1,
-0.310367, -1.582708, -3.460665, 0, 1, 0.2862745, 1,
-0.3102899, -0.9905981, -3.119565, 0, 1, 0.2901961, 1,
-0.3088771, 0.6019495, -0.9453111, 0, 1, 0.2980392, 1,
-0.305754, -0.2090123, -2.149319, 0, 1, 0.3058824, 1,
-0.3047785, 1.396126, -1.124771, 0, 1, 0.3098039, 1,
-0.3035514, -0.2304005, -2.391483, 0, 1, 0.3176471, 1,
-0.3033719, 0.7192911, -0.3418549, 0, 1, 0.3215686, 1,
-0.3012611, -0.01863738, -2.446165, 0, 1, 0.3294118, 1,
-0.2987948, -1.217747, -3.228595, 0, 1, 0.3333333, 1,
-0.2947122, -1.659435, -1.779491, 0, 1, 0.3411765, 1,
-0.2939068, 0.2153432, -2.66592, 0, 1, 0.345098, 1,
-0.2939002, 0.7997012, -0.2040566, 0, 1, 0.3529412, 1,
-0.2922916, 0.6997823, 0.9511023, 0, 1, 0.3568628, 1,
-0.2921552, -0.265303, -1.112728, 0, 1, 0.3647059, 1,
-0.2900492, 0.4617412, -1.693721, 0, 1, 0.3686275, 1,
-0.2897518, -0.2382324, -1.605317, 0, 1, 0.3764706, 1,
-0.2892828, -1.270422, -3.614177, 0, 1, 0.3803922, 1,
-0.2838559, -1.070722, -1.662744, 0, 1, 0.3882353, 1,
-0.2824557, -0.714585, -2.389838, 0, 1, 0.3921569, 1,
-0.2801589, 2.000408, 1.061669, 0, 1, 0.4, 1,
-0.278825, 1.381509, 0.5480491, 0, 1, 0.4078431, 1,
-0.2787955, -0.02572116, -0.7868729, 0, 1, 0.4117647, 1,
-0.273987, 0.8330811, -0.4125997, 0, 1, 0.4196078, 1,
-0.2688552, -0.4275002, -2.911145, 0, 1, 0.4235294, 1,
-0.2666751, 1.009332, -0.2976935, 0, 1, 0.4313726, 1,
-0.2643668, 1.817139, -0.5611669, 0, 1, 0.4352941, 1,
-0.2600324, 1.025189, -0.2755734, 0, 1, 0.4431373, 1,
-0.260031, -0.2133434, -2.034773, 0, 1, 0.4470588, 1,
-0.2558057, 1.705258, 0.2438045, 0, 1, 0.454902, 1,
-0.2517872, 0.6805009, -0.7691343, 0, 1, 0.4588235, 1,
-0.2482166, 1.369312, -0.6196169, 0, 1, 0.4666667, 1,
-0.2458773, -0.08534451, -1.859441, 0, 1, 0.4705882, 1,
-0.2449614, 0.7649672, -0.3537694, 0, 1, 0.4784314, 1,
-0.2419065, -1.740749, -3.05123, 0, 1, 0.4823529, 1,
-0.2413582, -0.5228716, -4.079746, 0, 1, 0.4901961, 1,
-0.2385295, -0.8339444, -2.219126, 0, 1, 0.4941176, 1,
-0.2321634, -1.511391, -3.021572, 0, 1, 0.5019608, 1,
-0.2288266, 0.03045109, -0.4918697, 0, 1, 0.509804, 1,
-0.2278124, 0.672984, -0.3435953, 0, 1, 0.5137255, 1,
-0.2275088, 0.1968923, -2.577627, 0, 1, 0.5215687, 1,
-0.2267523, -0.2577949, -1.685495, 0, 1, 0.5254902, 1,
-0.2266563, -0.1206365, -0.3248432, 0, 1, 0.5333334, 1,
-0.224129, 0.5771103, -0.9534883, 0, 1, 0.5372549, 1,
-0.2202186, -1.969941, -2.871534, 0, 1, 0.5450981, 1,
-0.2167729, 0.4278489, -0.7574452, 0, 1, 0.5490196, 1,
-0.2163857, -0.08435737, -2.576959, 0, 1, 0.5568628, 1,
-0.2122525, 0.5476954, -1.821169, 0, 1, 0.5607843, 1,
-0.2115294, -0.8379982, -3.707911, 0, 1, 0.5686275, 1,
-0.2103742, 0.5361032, 1.443729, 0, 1, 0.572549, 1,
-0.2084216, 0.2283409, -0.4745985, 0, 1, 0.5803922, 1,
-0.2070378, 0.0377567, -0.5286434, 0, 1, 0.5843138, 1,
-0.206481, 1.072242, 0.964145, 0, 1, 0.5921569, 1,
-0.2032748, 0.8581167, 1.180385, 0, 1, 0.5960785, 1,
-0.1967323, 0.9641258, 0.6366494, 0, 1, 0.6039216, 1,
-0.1953056, 0.292402, 0.528002, 0, 1, 0.6117647, 1,
-0.1948306, -0.3123441, -4.332861, 0, 1, 0.6156863, 1,
-0.1941311, -0.6920287, -2.798968, 0, 1, 0.6235294, 1,
-0.1858993, -0.3405032, -2.01576, 0, 1, 0.627451, 1,
-0.1851355, -0.1833618, -2.338359, 0, 1, 0.6352941, 1,
-0.1838219, 1.633479, -0.655953, 0, 1, 0.6392157, 1,
-0.1818826, 0.3050033, -0.7393308, 0, 1, 0.6470588, 1,
-0.1770103, -0.5685335, -3.124897, 0, 1, 0.6509804, 1,
-0.1766367, -2.63262, -3.082134, 0, 1, 0.6588235, 1,
-0.175683, 1.290434, -1.937988, 0, 1, 0.6627451, 1,
-0.1670877, 0.730034, 0.2453323, 0, 1, 0.6705883, 1,
-0.1663086, -1.018025, -4.528949, 0, 1, 0.6745098, 1,
-0.1660218, -0.2497884, -3.679779, 0, 1, 0.682353, 1,
-0.163973, 1.146713, 0.6086342, 0, 1, 0.6862745, 1,
-0.1585464, 0.1066621, -2.238697, 0, 1, 0.6941177, 1,
-0.1574467, 0.2353881, -2.236125, 0, 1, 0.7019608, 1,
-0.1570692, -0.3607031, -4.111583, 0, 1, 0.7058824, 1,
-0.1528338, 0.1967588, -2.149176, 0, 1, 0.7137255, 1,
-0.1508805, 1.902067, -0.3539928, 0, 1, 0.7176471, 1,
-0.1507898, 0.8668509, 1.501228, 0, 1, 0.7254902, 1,
-0.1499375, 0.02400981, 0.6390136, 0, 1, 0.7294118, 1,
-0.1490982, -0.07166285, -1.154117, 0, 1, 0.7372549, 1,
-0.1478354, -1.583269, -2.804244, 0, 1, 0.7411765, 1,
-0.133903, 0.8564784, -0.720493, 0, 1, 0.7490196, 1,
-0.1284341, -0.4661523, -3.59989, 0, 1, 0.7529412, 1,
-0.1227529, 1.788229, 0.006744366, 0, 1, 0.7607843, 1,
-0.1217334, -1.006919, -3.464222, 0, 1, 0.7647059, 1,
-0.1207581, 0.4737805, -1.417945, 0, 1, 0.772549, 1,
-0.1190131, 0.844844, 0.9500592, 0, 1, 0.7764706, 1,
-0.1150647, 0.1429066, -0.3669819, 0, 1, 0.7843137, 1,
-0.1140985, 0.2154306, 0.8320251, 0, 1, 0.7882353, 1,
-0.1129705, 0.6815083, -0.6150919, 0, 1, 0.7960784, 1,
-0.1127393, 2.002649, 0.8877211, 0, 1, 0.8039216, 1,
-0.1121891, 1.375969, -0.2367831, 0, 1, 0.8078431, 1,
-0.1120964, 0.1633342, 1.906424, 0, 1, 0.8156863, 1,
-0.1109331, 0.4478423, -1.518614, 0, 1, 0.8196079, 1,
-0.1079512, -0.2258741, -4.437568, 0, 1, 0.827451, 1,
-0.1060484, -1.369934, -3.2223, 0, 1, 0.8313726, 1,
-0.1052065, 2.020959, 0.2942191, 0, 1, 0.8392157, 1,
-0.1024704, -1.246643, -3.552822, 0, 1, 0.8431373, 1,
-0.1015107, -0.2751246, -3.774658, 0, 1, 0.8509804, 1,
-0.1013986, 0.4097013, 1.154898, 0, 1, 0.854902, 1,
-0.1001197, -0.006295689, -2.526905, 0, 1, 0.8627451, 1,
-0.09247388, -1.490171, -3.515568, 0, 1, 0.8666667, 1,
-0.08956506, 0.1624687, 0.04882086, 0, 1, 0.8745098, 1,
-0.0893736, -1.83279, -3.908104, 0, 1, 0.8784314, 1,
-0.08893251, 0.7394795, 0.9880747, 0, 1, 0.8862745, 1,
-0.0885322, -0.3702534, -3.250521, 0, 1, 0.8901961, 1,
-0.08618718, 0.001749092, -1.366866, 0, 1, 0.8980392, 1,
-0.08455846, 0.1821763, -0.7585559, 0, 1, 0.9058824, 1,
-0.0774781, -0.3117093, -0.2762797, 0, 1, 0.9098039, 1,
-0.07343541, 2.240885, -2.318466, 0, 1, 0.9176471, 1,
-0.07329236, 0.4344932, 0.1815868, 0, 1, 0.9215686, 1,
-0.07135335, 2.602174, -0.8406777, 0, 1, 0.9294118, 1,
-0.06071259, -0.4572492, -3.144466, 0, 1, 0.9333333, 1,
-0.05313574, -0.0001864781, -1.290212, 0, 1, 0.9411765, 1,
-0.05085435, -1.154406, -2.674707, 0, 1, 0.945098, 1,
-0.04578412, 0.645727, -1.247196, 0, 1, 0.9529412, 1,
-0.04076337, -0.4586112, -3.045201, 0, 1, 0.9568627, 1,
-0.0387752, -0.4323139, -4.218801, 0, 1, 0.9647059, 1,
-0.03849652, -0.3176384, -2.272952, 0, 1, 0.9686275, 1,
-0.034137, -1.062564, -2.415351, 0, 1, 0.9764706, 1,
-0.03223289, -0.5044767, -3.241212, 0, 1, 0.9803922, 1,
-0.03102426, 1.435467, 0.572565, 0, 1, 0.9882353, 1,
-0.02910954, -1.282715, -3.074853, 0, 1, 0.9921569, 1,
-0.02887632, -0.3492252, -2.859408, 0, 1, 1, 1,
-0.02701052, -0.2461025, -3.602572, 0, 0.9921569, 1, 1,
-0.01845638, -1.159642, -3.50367, 0, 0.9882353, 1, 1,
-0.01696562, -0.7902167, -3.029785, 0, 0.9803922, 1, 1,
-0.0158966, 1.05859, -1.554787, 0, 0.9764706, 1, 1,
-0.01218327, -0.2436407, -3.058338, 0, 0.9686275, 1, 1,
-0.0100773, 0.4896291, 0.4214113, 0, 0.9647059, 1, 1,
-0.008319685, 0.2581024, 1.790601, 0, 0.9568627, 1, 1,
-0.006405175, 1.315228, 0.2821497, 0, 0.9529412, 1, 1,
-0.003310378, -1.352326, -4.179476, 0, 0.945098, 1, 1,
0.006700176, -0.3052765, 4.966286, 0, 0.9411765, 1, 1,
0.01012363, 0.4268904, -0.2124885, 0, 0.9333333, 1, 1,
0.01096599, -0.1821388, 2.632689, 0, 0.9294118, 1, 1,
0.01237609, -0.3355072, 3.735921, 0, 0.9215686, 1, 1,
0.01389358, 1.322204, 0.1444478, 0, 0.9176471, 1, 1,
0.01609923, 0.4388485, 0.100863, 0, 0.9098039, 1, 1,
0.01633568, 0.6128349, 0.7568694, 0, 0.9058824, 1, 1,
0.01983026, 1.467789, 0.5401354, 0, 0.8980392, 1, 1,
0.02339766, 0.4384137, -1.23198, 0, 0.8901961, 1, 1,
0.02484562, 1.154305, -0.1899789, 0, 0.8862745, 1, 1,
0.02574896, -0.7366896, 1.929957, 0, 0.8784314, 1, 1,
0.02606569, 0.8790452, 0.02898247, 0, 0.8745098, 1, 1,
0.02760146, -1.388556, 3.718477, 0, 0.8666667, 1, 1,
0.02826911, 0.5408476, 1.394455, 0, 0.8627451, 1, 1,
0.03299289, -0.6683806, 3.443807, 0, 0.854902, 1, 1,
0.03478859, 0.2078964, 0.8816601, 0, 0.8509804, 1, 1,
0.03830476, 0.137047, 0.4552777, 0, 0.8431373, 1, 1,
0.04273831, -0.2785558, 1.966169, 0, 0.8392157, 1, 1,
0.0452177, 0.1033407, 0.8902588, 0, 0.8313726, 1, 1,
0.04587103, -2.017637, 4.559226, 0, 0.827451, 1, 1,
0.05087683, -0.9181165, 3.222318, 0, 0.8196079, 1, 1,
0.05185476, 0.5971032, -0.5690705, 0, 0.8156863, 1, 1,
0.0587329, 0.7151728, 0.5149181, 0, 0.8078431, 1, 1,
0.06036571, 0.3924049, 0.617381, 0, 0.8039216, 1, 1,
0.06136427, 0.384073, 1.673843, 0, 0.7960784, 1, 1,
0.06146922, -0.6578984, 2.27866, 0, 0.7882353, 1, 1,
0.06165442, 1.395694, 0.5128728, 0, 0.7843137, 1, 1,
0.06463252, 0.3097259, -1.565051, 0, 0.7764706, 1, 1,
0.06844611, 0.9706508, -0.400818, 0, 0.772549, 1, 1,
0.06993439, -0.8071341, 2.183812, 0, 0.7647059, 1, 1,
0.07100586, 1.840846, 0.1677269, 0, 0.7607843, 1, 1,
0.07346633, 1.644699, -0.03712815, 0, 0.7529412, 1, 1,
0.07359484, 1.463157, -0.4368896, 0, 0.7490196, 1, 1,
0.07409579, -2.564402, 4.538774, 0, 0.7411765, 1, 1,
0.08047, -0.227369, 3.589406, 0, 0.7372549, 1, 1,
0.08591179, 0.3844526, -0.4539872, 0, 0.7294118, 1, 1,
0.08791281, 0.1422697, 1.383841, 0, 0.7254902, 1, 1,
0.09162051, -1.057389, 3.676206, 0, 0.7176471, 1, 1,
0.09164391, -0.5024315, 2.550246, 0, 0.7137255, 1, 1,
0.09260663, 1.534406, 0.7376413, 0, 0.7058824, 1, 1,
0.09275502, -0.674357, 3.329392, 0, 0.6980392, 1, 1,
0.09406281, -0.8996557, 5.347443, 0, 0.6941177, 1, 1,
0.09424813, 0.4349512, -0.4162056, 0, 0.6862745, 1, 1,
0.09885315, 1.107926, 0.1782659, 0, 0.682353, 1, 1,
0.0999756, 1.117911, -1.299834, 0, 0.6745098, 1, 1,
0.1037173, 0.2560199, 0.9104106, 0, 0.6705883, 1, 1,
0.1065556, -0.08445913, 2.140993, 0, 0.6627451, 1, 1,
0.1094472, -0.03545423, 1.234578, 0, 0.6588235, 1, 1,
0.1148698, -0.7002733, 0.6064144, 0, 0.6509804, 1, 1,
0.1242316, 0.7216511, -0.2988762, 0, 0.6470588, 1, 1,
0.1316926, 1.465347, 1.001752, 0, 0.6392157, 1, 1,
0.1351289, 0.02043522, 2.297977, 0, 0.6352941, 1, 1,
0.1396108, 0.7915552, 1.266463, 0, 0.627451, 1, 1,
0.1396349, -2.013752, 4.398808, 0, 0.6235294, 1, 1,
0.141509, -1.126488, 2.285081, 0, 0.6156863, 1, 1,
0.1424233, -0.3933748, 3.340569, 0, 0.6117647, 1, 1,
0.1424996, 0.9825469, 1.104214, 0, 0.6039216, 1, 1,
0.1430824, -1.725523, 4.458669, 0, 0.5960785, 1, 1,
0.1476662, -0.1260097, 4.526244, 0, 0.5921569, 1, 1,
0.1483538, 2.186244, 0.02794362, 0, 0.5843138, 1, 1,
0.1517192, -0.7786716, 3.833449, 0, 0.5803922, 1, 1,
0.1554376, -0.7511602, 2.692653, 0, 0.572549, 1, 1,
0.1609326, 1.152013, -0.3005762, 0, 0.5686275, 1, 1,
0.1612449, 0.5818259, -1.408095, 0, 0.5607843, 1, 1,
0.1613818, 0.6733617, -0.8155945, 0, 0.5568628, 1, 1,
0.161654, 0.2781183, 0.5648924, 0, 0.5490196, 1, 1,
0.1617091, 0.6665089, 1.930325, 0, 0.5450981, 1, 1,
0.1625752, 0.06708721, 1.492528, 0, 0.5372549, 1, 1,
0.1685382, 0.4442265, 0.1701414, 0, 0.5333334, 1, 1,
0.1685723, 0.05317477, 0.751394, 0, 0.5254902, 1, 1,
0.1694051, 0.6895219, 1.77571, 0, 0.5215687, 1, 1,
0.1764897, -0.9212934, 2.740716, 0, 0.5137255, 1, 1,
0.1854955, 1.376913, -1.04652, 0, 0.509804, 1, 1,
0.1861112, 0.8272017, -0.3127021, 0, 0.5019608, 1, 1,
0.1879816, -1.451598, 1.958484, 0, 0.4941176, 1, 1,
0.1891722, 0.3318118, 1.086751, 0, 0.4901961, 1, 1,
0.1913208, -0.09688628, 1.172681, 0, 0.4823529, 1, 1,
0.1915552, 0.1053077, 1.050309, 0, 0.4784314, 1, 1,
0.1930852, -0.5108454, 0.5293028, 0, 0.4705882, 1, 1,
0.2108812, 1.440901, 0.937032, 0, 0.4666667, 1, 1,
0.2110673, -0.06256409, 1.143634, 0, 0.4588235, 1, 1,
0.2138165, 0.05679699, 0.2213635, 0, 0.454902, 1, 1,
0.2154016, -0.5562496, 4.035796, 0, 0.4470588, 1, 1,
0.2167048, -0.02266604, 1.288961, 0, 0.4431373, 1, 1,
0.2200226, 0.2767691, 0.1022692, 0, 0.4352941, 1, 1,
0.2206983, -1.274205, 2.879138, 0, 0.4313726, 1, 1,
0.2290869, 0.107994, 1.640937, 0, 0.4235294, 1, 1,
0.2293707, -0.2111472, 3.614213, 0, 0.4196078, 1, 1,
0.2348296, 1.729403, 2.20499, 0, 0.4117647, 1, 1,
0.2383393, 0.007805374, 0.5917166, 0, 0.4078431, 1, 1,
0.2438549, 0.2251032, -1.038573, 0, 0.4, 1, 1,
0.2470159, 0.8291399, -0.5467517, 0, 0.3921569, 1, 1,
0.2499699, -0.9011565, 3.887304, 0, 0.3882353, 1, 1,
0.2500499, -0.1302419, 1.724576, 0, 0.3803922, 1, 1,
0.2527101, 1.459123, -0.1154163, 0, 0.3764706, 1, 1,
0.2532111, -2.397581, 2.682153, 0, 0.3686275, 1, 1,
0.2538815, 0.9647384, 1.857773, 0, 0.3647059, 1, 1,
0.2557865, -0.3797035, 1.742323, 0, 0.3568628, 1, 1,
0.2588725, 0.7682875, -0.7027786, 0, 0.3529412, 1, 1,
0.2596646, -2.767745, 1.741377, 0, 0.345098, 1, 1,
0.2601582, 0.2790982, 2.528842, 0, 0.3411765, 1, 1,
0.2648185, 1.129768, 0.6069238, 0, 0.3333333, 1, 1,
0.2669818, 1.556459, -1.113663, 0, 0.3294118, 1, 1,
0.2680283, -1.106482, 1.796425, 0, 0.3215686, 1, 1,
0.2722357, -0.9300615, 1.024122, 0, 0.3176471, 1, 1,
0.2725398, -1.260321, 3.704415, 0, 0.3098039, 1, 1,
0.2732727, -0.2416004, 2.706986, 0, 0.3058824, 1, 1,
0.27385, -0.08780555, 2.451709, 0, 0.2980392, 1, 1,
0.275946, 0.7390208, 0.3823016, 0, 0.2901961, 1, 1,
0.2784612, -0.2718131, 3.89487, 0, 0.2862745, 1, 1,
0.2788588, 1.501729, -0.05178997, 0, 0.2784314, 1, 1,
0.2794969, 0.7531298, 1.807383, 0, 0.2745098, 1, 1,
0.2809371, -1.036242, 2.254941, 0, 0.2666667, 1, 1,
0.2822128, 0.5520449, -0.5988345, 0, 0.2627451, 1, 1,
0.2838017, 0.8659129, 0.7265279, 0, 0.254902, 1, 1,
0.2840835, 1.555975, -1.564346, 0, 0.2509804, 1, 1,
0.2926513, -0.4727699, 4.02696, 0, 0.2431373, 1, 1,
0.2927569, -1.738883, 3.486519, 0, 0.2392157, 1, 1,
0.2942335, 1.165891, 0.001470415, 0, 0.2313726, 1, 1,
0.3013366, 1.071835, 1.754232, 0, 0.227451, 1, 1,
0.3076024, -0.004543857, 2.194087, 0, 0.2196078, 1, 1,
0.3085316, -0.3139844, 2.204498, 0, 0.2156863, 1, 1,
0.3104447, -0.3369853, 2.988028, 0, 0.2078431, 1, 1,
0.3156367, -0.7526244, 2.117291, 0, 0.2039216, 1, 1,
0.316679, -0.2143801, 2.877057, 0, 0.1960784, 1, 1,
0.3197886, -0.003104181, 2.344791, 0, 0.1882353, 1, 1,
0.3211038, -0.7575555, 1.816936, 0, 0.1843137, 1, 1,
0.3236001, 0.01538152, 1.72359, 0, 0.1764706, 1, 1,
0.326416, -0.01796643, 1.737849, 0, 0.172549, 1, 1,
0.3278062, -0.5146707, 3.641814, 0, 0.1647059, 1, 1,
0.328961, -2.963142, 3.095384, 0, 0.1607843, 1, 1,
0.3300915, -0.5742781, 2.523812, 0, 0.1529412, 1, 1,
0.3342503, -0.001345891, 1.634346, 0, 0.1490196, 1, 1,
0.3366322, -0.7841727, 4.047397, 0, 0.1411765, 1, 1,
0.3380668, 0.6040345, 0.6235154, 0, 0.1372549, 1, 1,
0.3384945, -1.531291, 2.552708, 0, 0.1294118, 1, 1,
0.3402027, -1.294696, 3.985657, 0, 0.1254902, 1, 1,
0.3417219, -0.7843218, 2.486338, 0, 0.1176471, 1, 1,
0.3438416, 1.192697, 0.7059945, 0, 0.1137255, 1, 1,
0.3448825, 0.7345397, -0.7764764, 0, 0.1058824, 1, 1,
0.3457159, 0.7220961, -0.1788958, 0, 0.09803922, 1, 1,
0.347483, 0.3011174, 0.7543651, 0, 0.09411765, 1, 1,
0.3481533, 0.1505436, 1.287129, 0, 0.08627451, 1, 1,
0.3527115, 0.1265584, 1.393135, 0, 0.08235294, 1, 1,
0.3537714, 0.1390146, 1.717899, 0, 0.07450981, 1, 1,
0.3564154, 0.2728238, 2.700531, 0, 0.07058824, 1, 1,
0.357791, 0.5035784, -0.6553503, 0, 0.0627451, 1, 1,
0.3595547, 0.7077205, 0.02402291, 0, 0.05882353, 1, 1,
0.3611757, -1.429666, 2.779982, 0, 0.05098039, 1, 1,
0.3661628, 0.32506, -0.09108175, 0, 0.04705882, 1, 1,
0.368288, 1.712061, -0.461075, 0, 0.03921569, 1, 1,
0.3699186, -0.5663707, 3.177323, 0, 0.03529412, 1, 1,
0.3739283, -0.5086143, 1.530407, 0, 0.02745098, 1, 1,
0.3776475, 0.1664036, 1.868664, 0, 0.02352941, 1, 1,
0.3834498, 0.09528136, 0.3300603, 0, 0.01568628, 1, 1,
0.3971023, 0.2182704, 1.125232, 0, 0.01176471, 1, 1,
0.4006462, 1.456589, -0.6799371, 0, 0.003921569, 1, 1,
0.4008285, -0.8344615, 1.396951, 0.003921569, 0, 1, 1,
0.4017774, 1.081844, 1.2546, 0.007843138, 0, 1, 1,
0.4055494, -0.7633969, 3.498546, 0.01568628, 0, 1, 1,
0.4081915, 1.624334, -0.6521543, 0.01960784, 0, 1, 1,
0.4082372, 0.02582522, 3.436016, 0.02745098, 0, 1, 1,
0.4122728, 0.1610425, 0.3221569, 0.03137255, 0, 1, 1,
0.413344, 0.6904165, 0.3024158, 0.03921569, 0, 1, 1,
0.4150044, 1.087807, -1.222246, 0.04313726, 0, 1, 1,
0.4150991, 2.592463, 0.8428219, 0.05098039, 0, 1, 1,
0.4171101, -1.279988, 2.63779, 0.05490196, 0, 1, 1,
0.4181937, -0.6775297, 3.119553, 0.0627451, 0, 1, 1,
0.4199855, 0.1172153, 3.569487, 0.06666667, 0, 1, 1,
0.4207071, 1.206803, 0.8779095, 0.07450981, 0, 1, 1,
0.4209013, 0.4850579, -0.4013522, 0.07843138, 0, 1, 1,
0.421087, -1.417326, 2.900474, 0.08627451, 0, 1, 1,
0.4229379, 1.699534, 0.7022998, 0.09019608, 0, 1, 1,
0.4237996, -0.23582, 2.061677, 0.09803922, 0, 1, 1,
0.4293844, -2.074987, 3.558752, 0.1058824, 0, 1, 1,
0.4312293, 1.207829, -0.01878437, 0.1098039, 0, 1, 1,
0.4353009, 0.07745858, 2.380589, 0.1176471, 0, 1, 1,
0.4353779, 0.2500683, 1.2741, 0.1215686, 0, 1, 1,
0.4373305, -0.2347191, 3.6871, 0.1294118, 0, 1, 1,
0.4431873, 0.7666436, 1.409555, 0.1333333, 0, 1, 1,
0.4474133, 0.3123215, 0.1013944, 0.1411765, 0, 1, 1,
0.4474755, -0.1100859, -0.8373693, 0.145098, 0, 1, 1,
0.4511693, -0.008646962, 2.093176, 0.1529412, 0, 1, 1,
0.4512809, 0.0538551, 2.810708, 0.1568628, 0, 1, 1,
0.4540998, 0.5729231, -0.2710334, 0.1647059, 0, 1, 1,
0.4578015, 0.5768515, 0.6838379, 0.1686275, 0, 1, 1,
0.4581779, -1.167044, 3.33158, 0.1764706, 0, 1, 1,
0.4585684, 0.6377785, 2.624879, 0.1803922, 0, 1, 1,
0.4593243, 1.170796, 1.045592, 0.1882353, 0, 1, 1,
0.466518, 0.7806064, 1.897598, 0.1921569, 0, 1, 1,
0.4726043, 1.652272, 0.7141103, 0.2, 0, 1, 1,
0.4903198, 0.07052349, 3.399341, 0.2078431, 0, 1, 1,
0.5032151, 1.266507, -1.574326, 0.2117647, 0, 1, 1,
0.5076681, -0.7185035, 1.50091, 0.2196078, 0, 1, 1,
0.5084835, 0.7163076, 1.746521, 0.2235294, 0, 1, 1,
0.5100117, -0.9201478, 3.9494, 0.2313726, 0, 1, 1,
0.5105535, -0.04775368, 3.397653, 0.2352941, 0, 1, 1,
0.5125814, 1.359795, 1.979541, 0.2431373, 0, 1, 1,
0.5147063, -0.8030326, 3.528694, 0.2470588, 0, 1, 1,
0.5170857, -0.4706049, 1.233594, 0.254902, 0, 1, 1,
0.5181456, 1.585648, -1.618725, 0.2588235, 0, 1, 1,
0.5186752, -0.7854373, 1.739191, 0.2666667, 0, 1, 1,
0.5205445, 0.06855965, 0.3285938, 0.2705882, 0, 1, 1,
0.5246585, 1.415058, 0.7069874, 0.2784314, 0, 1, 1,
0.5260993, -0.3520024, 2.86666, 0.282353, 0, 1, 1,
0.5300069, -0.8513974, 1.91143, 0.2901961, 0, 1, 1,
0.5310537, 0.7304257, 0.3962487, 0.2941177, 0, 1, 1,
0.5356869, 0.638344, 1.484496, 0.3019608, 0, 1, 1,
0.5385233, 0.1817918, -0.7033201, 0.3098039, 0, 1, 1,
0.5386903, -0.8856518, 4.488632, 0.3137255, 0, 1, 1,
0.5474446, 0.5144989, 1.163952, 0.3215686, 0, 1, 1,
0.548883, 0.4382367, 0.2145048, 0.3254902, 0, 1, 1,
0.557945, -0.8483919, 0.5796722, 0.3333333, 0, 1, 1,
0.5614781, -1.052911, 2.632712, 0.3372549, 0, 1, 1,
0.5643899, 1.034938, 1.677461, 0.345098, 0, 1, 1,
0.5689195, 1.447669, 1.117411, 0.3490196, 0, 1, 1,
0.5692033, -1.610662, 2.88758, 0.3568628, 0, 1, 1,
0.5707153, 1.691998, -0.6025042, 0.3607843, 0, 1, 1,
0.5738005, 1.455235, 0.6364742, 0.3686275, 0, 1, 1,
0.5740008, 1.354841, -0.627889, 0.372549, 0, 1, 1,
0.575622, -0.9812183, 1.337033, 0.3803922, 0, 1, 1,
0.5816087, 0.2416822, 1.187934, 0.3843137, 0, 1, 1,
0.5818003, 0.8394789, -0.3704007, 0.3921569, 0, 1, 1,
0.5834975, 0.949841, 0.3082981, 0.3960784, 0, 1, 1,
0.5868542, 1.645778, 2.246262, 0.4039216, 0, 1, 1,
0.5874436, 1.659077, 1.442963, 0.4117647, 0, 1, 1,
0.5903084, -0.860805, 2.681233, 0.4156863, 0, 1, 1,
0.5917788, -1.392254, 2.417962, 0.4235294, 0, 1, 1,
0.5923187, 1.505877, 1.437352, 0.427451, 0, 1, 1,
0.5930727, -0.4384366, 1.588533, 0.4352941, 0, 1, 1,
0.5960514, -0.2656228, 3.010513, 0.4392157, 0, 1, 1,
0.5996261, 0.6641077, 0.4353991, 0.4470588, 0, 1, 1,
0.600518, 0.4295405, 0.3074061, 0.4509804, 0, 1, 1,
0.6030991, -0.6725779, 1.677643, 0.4588235, 0, 1, 1,
0.6042878, 0.324055, 0.08060373, 0.4627451, 0, 1, 1,
0.6075416, -0.6607846, 1.811547, 0.4705882, 0, 1, 1,
0.6076471, 1.983977, -0.02795427, 0.4745098, 0, 1, 1,
0.6105775, 0.8448063, 0.4123212, 0.4823529, 0, 1, 1,
0.6121795, 1.279642, 1.432581, 0.4862745, 0, 1, 1,
0.6191214, -0.1829733, 3.638901, 0.4941176, 0, 1, 1,
0.619909, 0.06789629, 2.940184, 0.5019608, 0, 1, 1,
0.6224352, -0.3510429, 5.151756, 0.5058824, 0, 1, 1,
0.6238992, -0.6427501, 3.654762, 0.5137255, 0, 1, 1,
0.6269405, -2.90738, 0.08143895, 0.5176471, 0, 1, 1,
0.6295219, -1.471845, 2.6256, 0.5254902, 0, 1, 1,
0.6298025, 1.352991, 2.295483, 0.5294118, 0, 1, 1,
0.6315647, 0.9461536, 0.381337, 0.5372549, 0, 1, 1,
0.6331875, -0.02542228, 2.073187, 0.5411765, 0, 1, 1,
0.6349083, -1.230694, 1.237511, 0.5490196, 0, 1, 1,
0.6375486, -0.7422245, 2.550841, 0.5529412, 0, 1, 1,
0.6413293, 1.335216, -0.7196113, 0.5607843, 0, 1, 1,
0.6471431, -0.06723937, 0.3684027, 0.5647059, 0, 1, 1,
0.6499929, -1.46218, 2.215703, 0.572549, 0, 1, 1,
0.6572325, -0.2479526, 3.453384, 0.5764706, 0, 1, 1,
0.6619208, -0.1266874, 0.9353011, 0.5843138, 0, 1, 1,
0.6647243, -1.220339, 2.038364, 0.5882353, 0, 1, 1,
0.6753713, -1.058848, 3.932293, 0.5960785, 0, 1, 1,
0.6797755, -0.1040784, 3.308563, 0.6039216, 0, 1, 1,
0.6825815, 0.9741081, 2.013851, 0.6078432, 0, 1, 1,
0.6831421, -0.6340889, 1.954565, 0.6156863, 0, 1, 1,
0.6867204, 0.720961, 0.9159751, 0.6196079, 0, 1, 1,
0.6889222, 1.338814, 0.1189233, 0.627451, 0, 1, 1,
0.6944628, -0.3279401, 2.560814, 0.6313726, 0, 1, 1,
0.699388, -0.5372582, 2.358203, 0.6392157, 0, 1, 1,
0.7004126, 0.9136971, 0.5501246, 0.6431373, 0, 1, 1,
0.7018979, -1.256545, 1.593449, 0.6509804, 0, 1, 1,
0.7024066, 1.003451, 1.847308, 0.654902, 0, 1, 1,
0.7032728, -0.433752, 2.358247, 0.6627451, 0, 1, 1,
0.7060326, 0.7193317, 1.941317, 0.6666667, 0, 1, 1,
0.7095675, -0.4040816, 1.095389, 0.6745098, 0, 1, 1,
0.7102498, -0.1692802, 1.884279, 0.6784314, 0, 1, 1,
0.7125391, -2.094905, 3.442833, 0.6862745, 0, 1, 1,
0.7150899, 0.3093044, 1.267201, 0.6901961, 0, 1, 1,
0.7184966, -1.04965, 1.09584, 0.6980392, 0, 1, 1,
0.7188781, 0.7341542, 0.868022, 0.7058824, 0, 1, 1,
0.7197453, -0.2247922, 1.396871, 0.7098039, 0, 1, 1,
0.7199516, 0.216502, 0.8616875, 0.7176471, 0, 1, 1,
0.720279, 0.5849572, -0.4217398, 0.7215686, 0, 1, 1,
0.7232456, 0.8751683, -0.08744095, 0.7294118, 0, 1, 1,
0.7288143, -2.093739, 2.637098, 0.7333333, 0, 1, 1,
0.7333924, 0.1909082, 0.4330162, 0.7411765, 0, 1, 1,
0.7373277, -1.372172, 2.204698, 0.7450981, 0, 1, 1,
0.7435743, 0.5623252, 1.271752, 0.7529412, 0, 1, 1,
0.7475262, -0.2001787, 2.567146, 0.7568628, 0, 1, 1,
0.7487766, -0.4565117, 1.691287, 0.7647059, 0, 1, 1,
0.7496888, -1.124715, 1.12385, 0.7686275, 0, 1, 1,
0.7512723, -0.6355945, 2.184448, 0.7764706, 0, 1, 1,
0.7525226, 1.781355, 0.08739421, 0.7803922, 0, 1, 1,
0.7556314, 0.1623679, 1.707776, 0.7882353, 0, 1, 1,
0.7567525, -1.243973, 2.409433, 0.7921569, 0, 1, 1,
0.7626604, -0.1030227, 2.002385, 0.8, 0, 1, 1,
0.7841479, 1.490023, 1.067927, 0.8078431, 0, 1, 1,
0.7841495, -0.09039012, 2.055616, 0.8117647, 0, 1, 1,
0.7863551, 0.4118467, 0.6707704, 0.8196079, 0, 1, 1,
0.7882069, 0.1112675, 0.1363836, 0.8235294, 0, 1, 1,
0.7906848, 0.6620648, 3.107645, 0.8313726, 0, 1, 1,
0.79238, 0.983988, 1.464952, 0.8352941, 0, 1, 1,
0.7927625, 0.2133638, 2.828718, 0.8431373, 0, 1, 1,
0.7934051, -0.1199811, 3.656314, 0.8470588, 0, 1, 1,
0.7963918, -0.4821653, 2.679354, 0.854902, 0, 1, 1,
0.8021457, 1.794568, 0.4784251, 0.8588235, 0, 1, 1,
0.8022645, -0.6510126, 0.8355243, 0.8666667, 0, 1, 1,
0.810315, 0.4588763, -0.5507436, 0.8705882, 0, 1, 1,
0.8120727, 0.1572258, 1.609161, 0.8784314, 0, 1, 1,
0.8127882, 0.3936005, 0.8808261, 0.8823529, 0, 1, 1,
0.8166745, 0.2958258, -1.562201, 0.8901961, 0, 1, 1,
0.8184555, -0.4004055, 2.740199, 0.8941177, 0, 1, 1,
0.8216412, 1.24209, 0.8585291, 0.9019608, 0, 1, 1,
0.8275445, 0.2257907, 3.793728, 0.9098039, 0, 1, 1,
0.8276463, 1.094224, -0.5106039, 0.9137255, 0, 1, 1,
0.8290814, -1.008508, 4.821151, 0.9215686, 0, 1, 1,
0.8368995, -1.826304, 1.718484, 0.9254902, 0, 1, 1,
0.8374727, 0.2271659, 0.1092223, 0.9333333, 0, 1, 1,
0.8404239, -1.476688, 3.543074, 0.9372549, 0, 1, 1,
0.8449993, -0.06182928, 1.740441, 0.945098, 0, 1, 1,
0.8521013, -0.995029, 3.208733, 0.9490196, 0, 1, 1,
0.8529328, 1.210031, -0.8051664, 0.9568627, 0, 1, 1,
0.8576972, -0.3560767, 2.145342, 0.9607843, 0, 1, 1,
0.8581139, -0.9094058, 1.962493, 0.9686275, 0, 1, 1,
0.8626316, -0.07977981, 0.8479508, 0.972549, 0, 1, 1,
0.8652911, -1.601057, 3.032405, 0.9803922, 0, 1, 1,
0.8711258, -0.1995871, 1.6843, 0.9843137, 0, 1, 1,
0.8854031, 0.3023712, 1.980952, 0.9921569, 0, 1, 1,
0.8919386, -0.1346427, 0.08967777, 0.9960784, 0, 1, 1,
0.8952709, 0.08294798, 0.9478179, 1, 0, 0.9960784, 1,
0.8979595, -1.204642, 0.5713107, 1, 0, 0.9882353, 1,
0.8985851, 1.664143, 0.7485358, 1, 0, 0.9843137, 1,
0.9012093, -0.4981861, 1.10816, 1, 0, 0.9764706, 1,
0.9024295, 1.786441, 1.985023, 1, 0, 0.972549, 1,
0.9025162, -0.1168577, 1.137145, 1, 0, 0.9647059, 1,
0.9049233, 0.9058453, -0.02241371, 1, 0, 0.9607843, 1,
0.9060053, -0.3674, 1.738657, 1, 0, 0.9529412, 1,
0.9111714, -0.4710696, 1.507292, 1, 0, 0.9490196, 1,
0.9146745, -1.298076, 2.845994, 1, 0, 0.9411765, 1,
0.9165202, 2.138612, 0.7560903, 1, 0, 0.9372549, 1,
0.9198171, -1.153241, 2.581692, 1, 0, 0.9294118, 1,
0.9305876, -0.3690826, 0.7852877, 1, 0, 0.9254902, 1,
0.9317706, -0.2277395, -0.09344732, 1, 0, 0.9176471, 1,
0.9323231, -1.597881, 2.830698, 1, 0, 0.9137255, 1,
0.93488, 2.16572, 1.065291, 1, 0, 0.9058824, 1,
0.9413654, 0.9137781, 0.7840773, 1, 0, 0.9019608, 1,
0.9422943, 0.8596556, 0.7469483, 1, 0, 0.8941177, 1,
0.9446694, -0.683068, 2.173238, 1, 0, 0.8862745, 1,
0.9460202, -0.4053292, 1.853707, 1, 0, 0.8823529, 1,
0.9581152, 0.1775869, 2.454995, 1, 0, 0.8745098, 1,
0.9638337, 0.4200904, 0.6126927, 1, 0, 0.8705882, 1,
0.9656763, 0.2699395, 1.820723, 1, 0, 0.8627451, 1,
0.9667351, -1.779045, 2.925774, 1, 0, 0.8588235, 1,
0.9686764, -0.3928187, 1.287174, 1, 0, 0.8509804, 1,
0.9770955, -2.100166, 2.021627, 1, 0, 0.8470588, 1,
0.9803125, -1.877028, 2.636519, 1, 0, 0.8392157, 1,
0.9839922, 0.7196094, 0.6441184, 1, 0, 0.8352941, 1,
0.9894766, 0.6132908, 1.2338, 1, 0, 0.827451, 1,
1.015826, 0.4991144, 1.172918, 1, 0, 0.8235294, 1,
1.019254, -0.5986741, 1.069172, 1, 0, 0.8156863, 1,
1.020352, 0.2147164, 2.845736, 1, 0, 0.8117647, 1,
1.024002, 1.678076, 1.284966, 1, 0, 0.8039216, 1,
1.028547, 0.7906228, 0.5523404, 1, 0, 0.7960784, 1,
1.032279, 1.029477, 2.366612, 1, 0, 0.7921569, 1,
1.038592, -2.595236, 4.418163, 1, 0, 0.7843137, 1,
1.040647, 0.6441158, 0.1125234, 1, 0, 0.7803922, 1,
1.047347, 0.788088, 3.357263, 1, 0, 0.772549, 1,
1.048516, -0.2577361, 1.885767, 1, 0, 0.7686275, 1,
1.051482, 0.5203809, 3.789297, 1, 0, 0.7607843, 1,
1.060736, -0.179808, 2.01121, 1, 0, 0.7568628, 1,
1.078794, 0.315277, 2.380771, 1, 0, 0.7490196, 1,
1.083205, -1.145515, 2.125286, 1, 0, 0.7450981, 1,
1.087332, -0.9329176, 1.553257, 1, 0, 0.7372549, 1,
1.087602, -1.122054, 3.213857, 1, 0, 0.7333333, 1,
1.093728, -0.1990541, 2.975401, 1, 0, 0.7254902, 1,
1.097352, 0.5707924, -0.7307498, 1, 0, 0.7215686, 1,
1.0979, 0.4450313, -0.2537686, 1, 0, 0.7137255, 1,
1.100646, 1.659987, 0.3486044, 1, 0, 0.7098039, 1,
1.100919, 1.207901, -0.03047681, 1, 0, 0.7019608, 1,
1.10891, -0.628958, 3.378613, 1, 0, 0.6941177, 1,
1.123765, -0.6617014, 2.09015, 1, 0, 0.6901961, 1,
1.127105, -1.008615, 2.446868, 1, 0, 0.682353, 1,
1.133695, 2.045167, 1.396378, 1, 0, 0.6784314, 1,
1.14338, 0.1339076, 1.390886, 1, 0, 0.6705883, 1,
1.158395, -0.7120737, -0.3970817, 1, 0, 0.6666667, 1,
1.162831, -0.6991327, 1.903931, 1, 0, 0.6588235, 1,
1.168705, -1.175715, 2.209128, 1, 0, 0.654902, 1,
1.170822, 0.2204427, 0.6500242, 1, 0, 0.6470588, 1,
1.172712, -0.04784434, 1.618913, 1, 0, 0.6431373, 1,
1.175494, 0.6500846, -0.3680449, 1, 0, 0.6352941, 1,
1.183662, 0.1074391, 1.639855, 1, 0, 0.6313726, 1,
1.200253, -0.5234396, 2.525078, 1, 0, 0.6235294, 1,
1.210686, -0.223779, 1.097818, 1, 0, 0.6196079, 1,
1.210748, -0.5477532, 3.112649, 1, 0, 0.6117647, 1,
1.211838, -0.5363752, 1.410393, 1, 0, 0.6078432, 1,
1.216437, -0.840727, 2.622282, 1, 0, 0.6, 1,
1.219829, 0.3624041, -0.07867903, 1, 0, 0.5921569, 1,
1.226944, -1.269289, 2.175475, 1, 0, 0.5882353, 1,
1.234965, 0.9965891, 1.763433, 1, 0, 0.5803922, 1,
1.242863, 0.6352232, 1.750364, 1, 0, 0.5764706, 1,
1.245698, 0.6639603, 1.543562, 1, 0, 0.5686275, 1,
1.2473, -1.113338, 3.511667, 1, 0, 0.5647059, 1,
1.252052, -1.574633, 2.999329, 1, 0, 0.5568628, 1,
1.267516, 0.3679889, 0.4165225, 1, 0, 0.5529412, 1,
1.270684, -0.3201285, 1.192644, 1, 0, 0.5450981, 1,
1.282351, 1.005834, -0.03188757, 1, 0, 0.5411765, 1,
1.285584, -0.5603033, 1.640807, 1, 0, 0.5333334, 1,
1.293358, 0.891291, 0.7532786, 1, 0, 0.5294118, 1,
1.293676, 0.8502842, 0.15043, 1, 0, 0.5215687, 1,
1.295915, -0.532521, 0.8750786, 1, 0, 0.5176471, 1,
1.297896, -0.3495659, 1.872546, 1, 0, 0.509804, 1,
1.303019, 1.616852, 0.6719022, 1, 0, 0.5058824, 1,
1.31801, 0.6937938, 2.282504, 1, 0, 0.4980392, 1,
1.322542, -0.6542373, 2.245157, 1, 0, 0.4901961, 1,
1.326172, -0.6529513, 1.128653, 1, 0, 0.4862745, 1,
1.332282, 0.2677595, 1.886539, 1, 0, 0.4784314, 1,
1.337866, -1.837521, 3.265466, 1, 0, 0.4745098, 1,
1.366113, -1.04523, 3.474285, 1, 0, 0.4666667, 1,
1.367959, 0.1418828, 2.437412, 1, 0, 0.4627451, 1,
1.368045, -0.5786091, 0.9452648, 1, 0, 0.454902, 1,
1.382466, 0.8588701, -0.3616579, 1, 0, 0.4509804, 1,
1.385688, 0.308403, 1.947704, 1, 0, 0.4431373, 1,
1.387914, -0.3405657, 2.584946, 1, 0, 0.4392157, 1,
1.38794, -0.04325572, 1.641947, 1, 0, 0.4313726, 1,
1.390418, 0.2946821, 0.2846353, 1, 0, 0.427451, 1,
1.396166, 0.6698765, 1.392059, 1, 0, 0.4196078, 1,
1.406333, -0.9172858, 4.078108, 1, 0, 0.4156863, 1,
1.419095, 0.4788846, 0.05199245, 1, 0, 0.4078431, 1,
1.419474, -1.934569, 3.486492, 1, 0, 0.4039216, 1,
1.431127, -0.7609873, 3.137024, 1, 0, 0.3960784, 1,
1.433951, 0.2389984, 1.696235, 1, 0, 0.3882353, 1,
1.441452, -0.3626072, 3.424455, 1, 0, 0.3843137, 1,
1.45448, 1.406441, 1.277764, 1, 0, 0.3764706, 1,
1.474418, -0.8313021, 1.816158, 1, 0, 0.372549, 1,
1.47927, -0.2409556, 1.954748, 1, 0, 0.3647059, 1,
1.48032, -0.04466197, 1.749388, 1, 0, 0.3607843, 1,
1.487519, 0.3223458, 0.5757093, 1, 0, 0.3529412, 1,
1.50324, -0.3570095, 3.157115, 1, 0, 0.3490196, 1,
1.509476, -0.8639647, 1.12614, 1, 0, 0.3411765, 1,
1.525532, -1.328351, 3.983878, 1, 0, 0.3372549, 1,
1.532481, -0.7168986, 3.359684, 1, 0, 0.3294118, 1,
1.554162, 0.2704748, 1.289499, 1, 0, 0.3254902, 1,
1.561895, 0.1454574, 1.560432, 1, 0, 0.3176471, 1,
1.563355, 0.5150629, 1.200613, 1, 0, 0.3137255, 1,
1.574391, -0.003002897, 1.467529, 1, 0, 0.3058824, 1,
1.578254, -2.108127, 1.847158, 1, 0, 0.2980392, 1,
1.580519, -0.3721004, 2.383469, 1, 0, 0.2941177, 1,
1.581548, -1.17261, 2.895376, 1, 0, 0.2862745, 1,
1.595528, -1.784301, 3.974046, 1, 0, 0.282353, 1,
1.602549, 0.03619059, 1.970974, 1, 0, 0.2745098, 1,
1.642539, 0.7511035, -0.2914441, 1, 0, 0.2705882, 1,
1.653747, -0.200616, 1.747389, 1, 0, 0.2627451, 1,
1.675117, -0.32981, 0.3575226, 1, 0, 0.2588235, 1,
1.675594, -0.8826495, 1.524229, 1, 0, 0.2509804, 1,
1.680307, 0.2554408, 1.915742, 1, 0, 0.2470588, 1,
1.704715, -0.4652513, 2.185207, 1, 0, 0.2392157, 1,
1.750263, -1.167796, 2.667907, 1, 0, 0.2352941, 1,
1.764137, 1.003083, 0.5069521, 1, 0, 0.227451, 1,
1.767986, 0.2135969, 0.9630073, 1, 0, 0.2235294, 1,
1.769349, 1.405163, 1.586032, 1, 0, 0.2156863, 1,
1.769452, -1.477712, 3.797647, 1, 0, 0.2117647, 1,
1.775431, 0.1579775, 1.595941, 1, 0, 0.2039216, 1,
1.800986, -0.2069937, 1.777639, 1, 0, 0.1960784, 1,
1.821555, 0.6699385, 1.047601, 1, 0, 0.1921569, 1,
1.82447, -1.187589, 0.5674926, 1, 0, 0.1843137, 1,
1.841088, 1.050611, 1.902275, 1, 0, 0.1803922, 1,
1.848006, -0.8436095, 0.9697278, 1, 0, 0.172549, 1,
1.864346, 0.2505475, 1.034434, 1, 0, 0.1686275, 1,
1.866314, 0.08808552, 0.9908968, 1, 0, 0.1607843, 1,
1.889765, -1.097929, 0.3139219, 1, 0, 0.1568628, 1,
1.902251, 0.5508735, 0.05780163, 1, 0, 0.1490196, 1,
1.949092, 0.7005935, -0.5599604, 1, 0, 0.145098, 1,
1.983724, -2.349257, 2.379377, 1, 0, 0.1372549, 1,
2.040354, -0.6711903, 1.97974, 1, 0, 0.1333333, 1,
2.073005, 0.5684851, 1.409666, 1, 0, 0.1254902, 1,
2.078521, -0.5388321, 2.01732, 1, 0, 0.1215686, 1,
2.082938, 0.8720477, 2.445953, 1, 0, 0.1137255, 1,
2.116142, 0.2434675, 1.616237, 1, 0, 0.1098039, 1,
2.131912, -2.56302, 4.06277, 1, 0, 0.1019608, 1,
2.153208, 1.814929, 0.9295676, 1, 0, 0.09411765, 1,
2.180955, -0.419309, 0.8189934, 1, 0, 0.09019608, 1,
2.205634, 3.267049, 1.96736, 1, 0, 0.08235294, 1,
2.235561, -1.54089, 1.84426, 1, 0, 0.07843138, 1,
2.293979, 0.4958316, 1.697774, 1, 0, 0.07058824, 1,
2.363574, 0.6061797, -0.8309906, 1, 0, 0.06666667, 1,
2.367705, 0.5997726, 1.752333, 1, 0, 0.05882353, 1,
2.400725, 0.9302973, 3.813062, 1, 0, 0.05490196, 1,
2.441165, -0.3624451, 1.942834, 1, 0, 0.04705882, 1,
2.445158, -0.1229722, 4.555334, 1, 0, 0.04313726, 1,
2.447336, -0.791128, 0.5062848, 1, 0, 0.03529412, 1,
2.481156, -1.054288, 1.569565, 1, 0, 0.03137255, 1,
2.487418, 0.914675, -1.09323, 1, 0, 0.02352941, 1,
2.60702, -0.2423136, 2.605867, 1, 0, 0.01960784, 1,
2.695088, -0.3950894, 2.659689, 1, 0, 0.01176471, 1,
3.002729, -0.7579114, 1.409038, 1, 0, 0.007843138, 1
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
-0.06589174, -4.01916, -7.093705, 0, -0.5, 0.5, 0.5,
-0.06589174, -4.01916, -7.093705, 1, -0.5, 0.5, 0.5,
-0.06589174, -4.01916, -7.093705, 1, 1.5, 0.5, 0.5,
-0.06589174, -4.01916, -7.093705, 0, 1.5, 0.5, 0.5
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
-4.174775, 0.1519531, -7.093705, 0, -0.5, 0.5, 0.5,
-4.174775, 0.1519531, -7.093705, 1, -0.5, 0.5, 0.5,
-4.174775, 0.1519531, -7.093705, 1, 1.5, 0.5, 0.5,
-4.174775, 0.1519531, -7.093705, 0, 1.5, 0.5, 0.5
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
-4.174775, -4.01916, 0.02844, 0, -0.5, 0.5, 0.5,
-4.174775, -4.01916, 0.02844, 1, -0.5, 0.5, 0.5,
-4.174775, -4.01916, 0.02844, 1, 1.5, 0.5, 0.5,
-4.174775, -4.01916, 0.02844, 0, 1.5, 0.5, 0.5
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
-3, -3.056595, -5.450133,
3, -3.056595, -5.450133,
-3, -3.056595, -5.450133,
-3, -3.217023, -5.724061,
-2, -3.056595, -5.450133,
-2, -3.217023, -5.724061,
-1, -3.056595, -5.450133,
-1, -3.217023, -5.724061,
0, -3.056595, -5.450133,
0, -3.217023, -5.724061,
1, -3.056595, -5.450133,
1, -3.217023, -5.724061,
2, -3.056595, -5.450133,
2, -3.217023, -5.724061,
3, -3.056595, -5.450133,
3, -3.217023, -5.724061
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
-3, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
-3, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
-3, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
-3, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
-2, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
-2, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
-2, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
-2, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
-1, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
-1, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
-1, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
-1, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
0, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
0, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
0, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
0, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
1, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
1, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
1, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
1, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
2, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
2, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
2, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
2, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5,
3, -3.537878, -6.271919, 0, -0.5, 0.5, 0.5,
3, -3.537878, -6.271919, 1, -0.5, 0.5, 0.5,
3, -3.537878, -6.271919, 1, 1.5, 0.5, 0.5,
3, -3.537878, -6.271919, 0, 1.5, 0.5, 0.5
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
-3.226571, -2, -5.450133,
-3.226571, 3, -5.450133,
-3.226571, -2, -5.450133,
-3.384605, -2, -5.724061,
-3.226571, -1, -5.450133,
-3.384605, -1, -5.724061,
-3.226571, 0, -5.450133,
-3.384605, 0, -5.724061,
-3.226571, 1, -5.450133,
-3.384605, 1, -5.724061,
-3.226571, 2, -5.450133,
-3.384605, 2, -5.724061,
-3.226571, 3, -5.450133,
-3.384605, 3, -5.724061
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
-3.700673, -2, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, -2, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, -2, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, -2, -6.271919, 0, 1.5, 0.5, 0.5,
-3.700673, -1, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, -1, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, -1, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, -1, -6.271919, 0, 1.5, 0.5, 0.5,
-3.700673, 0, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, 0, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, 0, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, 0, -6.271919, 0, 1.5, 0.5, 0.5,
-3.700673, 1, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, 1, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, 1, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, 1, -6.271919, 0, 1.5, 0.5, 0.5,
-3.700673, 2, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, 2, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, 2, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, 2, -6.271919, 0, 1.5, 0.5, 0.5,
-3.700673, 3, -6.271919, 0, -0.5, 0.5, 0.5,
-3.700673, 3, -6.271919, 1, -0.5, 0.5, 0.5,
-3.700673, 3, -6.271919, 1, 1.5, 0.5, 0.5,
-3.700673, 3, -6.271919, 0, 1.5, 0.5, 0.5
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
-3.226571, -3.056595, -4,
-3.226571, -3.056595, 4,
-3.226571, -3.056595, -4,
-3.384605, -3.217023, -4,
-3.226571, -3.056595, -2,
-3.384605, -3.217023, -2,
-3.226571, -3.056595, 0,
-3.384605, -3.217023, 0,
-3.226571, -3.056595, 2,
-3.384605, -3.217023, 2,
-3.226571, -3.056595, 4,
-3.384605, -3.217023, 4
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
-3.700673, -3.537878, -4, 0, -0.5, 0.5, 0.5,
-3.700673, -3.537878, -4, 1, -0.5, 0.5, 0.5,
-3.700673, -3.537878, -4, 1, 1.5, 0.5, 0.5,
-3.700673, -3.537878, -4, 0, 1.5, 0.5, 0.5,
-3.700673, -3.537878, -2, 0, -0.5, 0.5, 0.5,
-3.700673, -3.537878, -2, 1, -0.5, 0.5, 0.5,
-3.700673, -3.537878, -2, 1, 1.5, 0.5, 0.5,
-3.700673, -3.537878, -2, 0, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 0, 0, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 0, 1, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 0, 1, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 0, 0, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 2, 0, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 2, 1, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 2, 1, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 2, 0, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 4, 0, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 4, 1, -0.5, 0.5, 0.5,
-3.700673, -3.537878, 4, 1, 1.5, 0.5, 0.5,
-3.700673, -3.537878, 4, 0, 1.5, 0.5, 0.5
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
-3.226571, -3.056595, -5.450133,
-3.226571, 3.360502, -5.450133,
-3.226571, -3.056595, 5.507013,
-3.226571, 3.360502, 5.507013,
-3.226571, -3.056595, -5.450133,
-3.226571, -3.056595, 5.507013,
-3.226571, 3.360502, -5.450133,
-3.226571, 3.360502, 5.507013,
-3.226571, -3.056595, -5.450133,
3.094788, -3.056595, -5.450133,
-3.226571, -3.056595, 5.507013,
3.094788, -3.056595, 5.507013,
-3.226571, 3.360502, -5.450133,
3.094788, 3.360502, -5.450133,
-3.226571, 3.360502, 5.507013,
3.094788, 3.360502, 5.507013,
3.094788, -3.056595, -5.450133,
3.094788, 3.360502, -5.450133,
3.094788, -3.056595, 5.507013,
3.094788, 3.360502, 5.507013,
3.094788, -3.056595, -5.450133,
3.094788, -3.056595, 5.507013,
3.094788, 3.360502, -5.450133,
3.094788, 3.360502, 5.507013
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
var radius = 7.574204;
var distance = 33.69849;
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
mvMatrix.translate( 0.06589174, -0.1519531, -0.02844 );
mvMatrix.scale( 1.295509, 1.276181, 0.7474007 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69849);
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
Chlordene<-read.table("Chlordene.xyz")
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
-3.134512, 1.133785, -2.465526, 0, 0, 1, 1, 1,
-2.793215, -1.034754, -1.885948, 1, 0, 0, 1, 1,
-2.532343, -0.6184196, -3.006135, 1, 0, 0, 1, 1,
-2.473654, 0.05758016, -1.434898, 1, 0, 0, 1, 1,
-2.46681, -0.6628951, -3.400964, 1, 0, 0, 1, 1,
-2.387676, -2.416155, -3.012016, 1, 0, 0, 1, 1,
-2.376014, 1.973599, 0.2211213, 0, 0, 0, 1, 1,
-2.307136, 0.8373456, -0.9841851, 0, 0, 0, 1, 1,
-2.297653, 0.5405807, -0.2832998, 0, 0, 0, 1, 1,
-2.255347, 1.649954, -0.3875417, 0, 0, 0, 1, 1,
-2.230607, 0.2039626, -1.3637, 0, 0, 0, 1, 1,
-2.186633, 1.072091, -1.835771, 0, 0, 0, 1, 1,
-2.176232, 0.6841187, -1.665057, 0, 0, 0, 1, 1,
-2.147032, -0.4555122, -2.347325, 1, 1, 1, 1, 1,
-2.139336, 0.125021, -0.7672179, 1, 1, 1, 1, 1,
-2.133534, 1.458067, -2.434675, 1, 1, 1, 1, 1,
-2.115287, 0.3507664, -1.552057, 1, 1, 1, 1, 1,
-2.098948, -1.633634, -2.209203, 1, 1, 1, 1, 1,
-2.09363, -0.02088803, -2.833753, 1, 1, 1, 1, 1,
-2.090731, 1.729382, -0.145721, 1, 1, 1, 1, 1,
-2.068582, -0.4409892, -2.041672, 1, 1, 1, 1, 1,
-2.06236, 0.8174624, -1.301018, 1, 1, 1, 1, 1,
-1.962746, -0.4041337, -0.8146554, 1, 1, 1, 1, 1,
-1.9543, -1.303946, -3.339644, 1, 1, 1, 1, 1,
-1.938063, 0.3993777, -1.653502, 1, 1, 1, 1, 1,
-1.935638, 1.312764, 0.2540658, 1, 1, 1, 1, 1,
-1.930619, -0.1359413, -3.332318, 1, 1, 1, 1, 1,
-1.928183, 1.476133, -0.03201935, 1, 1, 1, 1, 1,
-1.922204, -0.08555916, -0.7610142, 0, 0, 1, 1, 1,
-1.881723, 1.150466, -1.679844, 1, 0, 0, 1, 1,
-1.865876, 1.484868, 0.5406424, 1, 0, 0, 1, 1,
-1.860866, -0.2871931, -1.119393, 1, 0, 0, 1, 1,
-1.860471, -1.231698, -1.99592, 1, 0, 0, 1, 1,
-1.844235, -0.4759059, -2.378371, 1, 0, 0, 1, 1,
-1.842158, 2.527687, -0.2714874, 0, 0, 0, 1, 1,
-1.8412, 0.4820719, -0.6837421, 0, 0, 0, 1, 1,
-1.840077, -0.1311134, -0.3310364, 0, 0, 0, 1, 1,
-1.820909, -0.5633332, 0.8537384, 0, 0, 0, 1, 1,
-1.817861, -0.8791804, -0.9350811, 0, 0, 0, 1, 1,
-1.805167, -1.276374, -3.162568, 0, 0, 0, 1, 1,
-1.803117, -0.7062303, -0.9654769, 0, 0, 0, 1, 1,
-1.801178, -0.5428672, -1.383301, 1, 1, 1, 1, 1,
-1.7993, -0.3724646, -3.076714, 1, 1, 1, 1, 1,
-1.795026, 0.6788734, -0.8992689, 1, 1, 1, 1, 1,
-1.778738, -1.095999, -2.305547, 1, 1, 1, 1, 1,
-1.772402, 1.913715, -1.190241, 1, 1, 1, 1, 1,
-1.765632, 0.4744236, -0.8261687, 1, 1, 1, 1, 1,
-1.721363, 1.669565, -2.230414, 1, 1, 1, 1, 1,
-1.718162, -0.4383462, -1.95769, 1, 1, 1, 1, 1,
-1.691274, 0.1345939, -3.217592, 1, 1, 1, 1, 1,
-1.684357, 0.3049143, -2.039541, 1, 1, 1, 1, 1,
-1.68305, 0.2884899, -0.5122768, 1, 1, 1, 1, 1,
-1.675727, 0.267353, -2.959593, 1, 1, 1, 1, 1,
-1.672233, 1.254025, -0.6921827, 1, 1, 1, 1, 1,
-1.666238, -1.217876, -1.634875, 1, 1, 1, 1, 1,
-1.655792, 0.822138, -0.7235522, 1, 1, 1, 1, 1,
-1.646643, 0.4498866, 1.328076, 0, 0, 1, 1, 1,
-1.644894, 1.067941, -1.108921, 1, 0, 0, 1, 1,
-1.641539, -1.420415, -2.77962, 1, 0, 0, 1, 1,
-1.640623, -1.153064, -2.011213, 1, 0, 0, 1, 1,
-1.634783, -1.564415, -3.347051, 1, 0, 0, 1, 1,
-1.628367, -0.5915072, -3.942162, 1, 0, 0, 1, 1,
-1.626997, -0.6139987, -1.090356, 0, 0, 0, 1, 1,
-1.623528, -0.5976778, -1.479984, 0, 0, 0, 1, 1,
-1.622946, 1.289543, -2.376714, 0, 0, 0, 1, 1,
-1.620135, 0.1882362, -0.9993731, 0, 0, 0, 1, 1,
-1.617062, 1.313702, -3.011444, 0, 0, 0, 1, 1,
-1.60972, 0.7360691, -0.882933, 0, 0, 0, 1, 1,
-1.605734, 0.3680762, -1.821039, 0, 0, 0, 1, 1,
-1.596332, -0.8356057, -2.134604, 1, 1, 1, 1, 1,
-1.588555, -1.15182, -1.83707, 1, 1, 1, 1, 1,
-1.587565, -0.8316886, -2.764412, 1, 1, 1, 1, 1,
-1.576757, -0.7456119, -0.9695584, 1, 1, 1, 1, 1,
-1.555078, 0.1624887, -1.077727, 1, 1, 1, 1, 1,
-1.549138, 1.325218, -2.161051, 1, 1, 1, 1, 1,
-1.54654, 1.068465, -0.1962081, 1, 1, 1, 1, 1,
-1.542866, -0.7113349, -0.6233326, 1, 1, 1, 1, 1,
-1.531734, -0.4345365, -3.532479, 1, 1, 1, 1, 1,
-1.526894, 0.4344015, -1.347521, 1, 1, 1, 1, 1,
-1.526664, 0.5765243, -0.4067675, 1, 1, 1, 1, 1,
-1.524108, 0.05777999, -0.8398924, 1, 1, 1, 1, 1,
-1.511825, -0.1867937, -1.446993, 1, 1, 1, 1, 1,
-1.507144, 1.153286, -0.7701742, 1, 1, 1, 1, 1,
-1.501277, 0.9884837, 0.2505784, 1, 1, 1, 1, 1,
-1.50127, -0.03911772, -0.9346294, 0, 0, 1, 1, 1,
-1.482176, 1.071252, -1.323959, 1, 0, 0, 1, 1,
-1.477636, 1.22744, -1.018988, 1, 0, 0, 1, 1,
-1.474282, 0.06231205, -0.7657144, 1, 0, 0, 1, 1,
-1.472795, 0.3255336, -0.7251772, 1, 0, 0, 1, 1,
-1.471744, -0.2426212, -2.267138, 1, 0, 0, 1, 1,
-1.466514, -1.338574, -2.748101, 0, 0, 0, 1, 1,
-1.463927, -0.3245021, -0.8140909, 0, 0, 0, 1, 1,
-1.441289, 0.9278751, -1.985121, 0, 0, 0, 1, 1,
-1.42342, 0.3671396, -1.010883, 0, 0, 0, 1, 1,
-1.418025, 1.640474, -0.1836172, 0, 0, 0, 1, 1,
-1.417268, -0.3936546, -3.463554, 0, 0, 0, 1, 1,
-1.415619, 0.8192176, -0.01033484, 0, 0, 0, 1, 1,
-1.403548, 0.5578204, -0.3909479, 1, 1, 1, 1, 1,
-1.397604, -1.655877, -2.454428, 1, 1, 1, 1, 1,
-1.394943, 0.7584792, -1.481513, 1, 1, 1, 1, 1,
-1.394279, -0.1668378, -5.290563, 1, 1, 1, 1, 1,
-1.379904, -1.133051, -1.270385, 1, 1, 1, 1, 1,
-1.370123, -0.9110627, -4.223296, 1, 1, 1, 1, 1,
-1.344327, -0.1239643, -2.406991, 1, 1, 1, 1, 1,
-1.33219, 1.397371, 0.2887393, 1, 1, 1, 1, 1,
-1.327071, -0.8829545, -0.7862736, 1, 1, 1, 1, 1,
-1.324776, -0.5499834, -2.534259, 1, 1, 1, 1, 1,
-1.324068, 0.7711701, -0.7266001, 1, 1, 1, 1, 1,
-1.323783, 0.6459207, -0.6149195, 1, 1, 1, 1, 1,
-1.320314, 0.2117271, -0.5782341, 1, 1, 1, 1, 1,
-1.31166, 1.101416, -1.067586, 1, 1, 1, 1, 1,
-1.310701, -1.00788, -4.3561, 1, 1, 1, 1, 1,
-1.298677, -0.7519887, -1.029826, 0, 0, 1, 1, 1,
-1.291961, -1.809262, -3.973556, 1, 0, 0, 1, 1,
-1.290487, 0.4988775, -2.103483, 1, 0, 0, 1, 1,
-1.289445, 1.386325, -0.8219151, 1, 0, 0, 1, 1,
-1.276723, 0.8662609, -2.002963, 1, 0, 0, 1, 1,
-1.263571, -0.01676092, -3.406551, 1, 0, 0, 1, 1,
-1.26184, -2.685863, -3.40395, 0, 0, 0, 1, 1,
-1.25995, -1.496539, -1.749679, 0, 0, 0, 1, 1,
-1.250739, -0.3006731, -0.5331656, 0, 0, 0, 1, 1,
-1.246852, 0.5020998, -1.521937, 0, 0, 0, 1, 1,
-1.225166, -1.441923, -3.970824, 0, 0, 0, 1, 1,
-1.214155, -0.159081, -1.231428, 0, 0, 0, 1, 1,
-1.212257, -0.4097463, -2.775412, 0, 0, 0, 1, 1,
-1.207556, 1.637304, 1.480974, 1, 1, 1, 1, 1,
-1.205931, -0.5888189, -1.475259, 1, 1, 1, 1, 1,
-1.204683, 0.04874914, -1.380599, 1, 1, 1, 1, 1,
-1.20063, 1.189847, -0.7857611, 1, 1, 1, 1, 1,
-1.193103, 0.02141989, -0.7826391, 1, 1, 1, 1, 1,
-1.189104, -0.1776153, -1.939076, 1, 1, 1, 1, 1,
-1.1853, 0.7389509, 0.05710875, 1, 1, 1, 1, 1,
-1.184583, -1.05365, -1.611488, 1, 1, 1, 1, 1,
-1.181741, 0.2061992, -1.837679, 1, 1, 1, 1, 1,
-1.179785, 0.977852, -2.775393, 1, 1, 1, 1, 1,
-1.179443, 1.417912, -3.523382, 1, 1, 1, 1, 1,
-1.169407, -1.474903, -0.9313465, 1, 1, 1, 1, 1,
-1.166544, -0.1309629, 0.02587558, 1, 1, 1, 1, 1,
-1.166002, 0.3583315, -1.040039, 1, 1, 1, 1, 1,
-1.165896, 0.3943208, -2.729119, 1, 1, 1, 1, 1,
-1.141424, 1.385943, -0.04109909, 0, 0, 1, 1, 1,
-1.138209, 0.7016986, 0.2083635, 1, 0, 0, 1, 1,
-1.138153, 0.6854, -1.355282, 1, 0, 0, 1, 1,
-1.134065, 0.7455001, -1.08816, 1, 0, 0, 1, 1,
-1.12552, -0.08392318, -2.907866, 1, 0, 0, 1, 1,
-1.115816, -0.1345626, -0.3505574, 1, 0, 0, 1, 1,
-1.113166, -1.491217, -2.251193, 0, 0, 0, 1, 1,
-1.10891, 0.02179924, -1.491625, 0, 0, 0, 1, 1,
-1.095494, 1.804997, 0.1792487, 0, 0, 0, 1, 1,
-1.089019, -0.1028762, -1.254048, 0, 0, 0, 1, 1,
-1.088614, 0.5943072, -1.064199, 0, 0, 0, 1, 1,
-1.086999, -0.5010024, -2.654366, 0, 0, 0, 1, 1,
-1.081789, -0.1726297, -2.151701, 0, 0, 0, 1, 1,
-1.077114, 1.321326, -2.836687, 1, 1, 1, 1, 1,
-1.06802, 0.3033532, -0.7676544, 1, 1, 1, 1, 1,
-1.066484, 0.1612956, -3.031697, 1, 1, 1, 1, 1,
-1.065148, -1.585028, -1.828543, 1, 1, 1, 1, 1,
-1.060531, -0.001619228, -0.4915876, 1, 1, 1, 1, 1,
-1.058644, -0.05351913, -2.13095, 1, 1, 1, 1, 1,
-1.04659, -1.390825, -3.448771, 1, 1, 1, 1, 1,
-1.043597, -0.6880091, -1.80863, 1, 1, 1, 1, 1,
-1.040163, -1.017107, -1.513792, 1, 1, 1, 1, 1,
-1.039179, 1.187788, -0.8251117, 1, 1, 1, 1, 1,
-1.038459, 1.880615, -1.329761, 1, 1, 1, 1, 1,
-1.03655, -0.9181153, -0.3418518, 1, 1, 1, 1, 1,
-1.031633, -0.3655808, -1.557408, 1, 1, 1, 1, 1,
-1.023338, -0.2936865, -2.159759, 1, 1, 1, 1, 1,
-1.022542, 0.1347637, -2.862182, 1, 1, 1, 1, 1,
-1.011909, 0.1371129, -1.554917, 0, 0, 1, 1, 1,
-1.010155, 1.058817, -1.132159, 1, 0, 0, 1, 1,
-1.00884, -0.4565937, -2.763982, 1, 0, 0, 1, 1,
-1.003013, 0.1596924, -3.165712, 1, 0, 0, 1, 1,
-0.9927844, 0.3401818, -1.75827, 1, 0, 0, 1, 1,
-0.981282, 0.4550314, -1.717764, 1, 0, 0, 1, 1,
-0.9749206, 0.4469562, -1.683473, 0, 0, 0, 1, 1,
-0.9747827, 0.5009462, -0.6144676, 0, 0, 0, 1, 1,
-0.9738023, -1.028116, -2.522037, 0, 0, 0, 1, 1,
-0.9660896, 0.5457682, -0.3672166, 0, 0, 0, 1, 1,
-0.955391, -0.2343584, -1.856003, 0, 0, 0, 1, 1,
-0.9539424, -0.04352889, -1.239637, 0, 0, 0, 1, 1,
-0.9440537, 2.106753, -0.8836412, 0, 0, 0, 1, 1,
-0.942634, -0.24221, -0.5208545, 1, 1, 1, 1, 1,
-0.9275326, 1.754012, -2.072335, 1, 1, 1, 1, 1,
-0.9272771, -1.474149, -2.059062, 1, 1, 1, 1, 1,
-0.9267415, -0.07642058, -3.142243, 1, 1, 1, 1, 1,
-0.9222695, -0.03105211, -1.77427, 1, 1, 1, 1, 1,
-0.9220179, -0.3239908, -2.674715, 1, 1, 1, 1, 1,
-0.9183937, 0.04319272, -2.03887, 1, 1, 1, 1, 1,
-0.9171314, 0.1540174, -0.8366634, 1, 1, 1, 1, 1,
-0.9142238, -0.2051467, -0.08141433, 1, 1, 1, 1, 1,
-0.9042707, -0.1931804, -1.972563, 1, 1, 1, 1, 1,
-0.9007246, 0.1065133, -3.422598, 1, 1, 1, 1, 1,
-0.8925263, 0.6755783, -1.167198, 1, 1, 1, 1, 1,
-0.8912574, 0.6728087, 0.006157945, 1, 1, 1, 1, 1,
-0.8894335, 1.489429, -0.01862361, 1, 1, 1, 1, 1,
-0.8894156, -0.998606, -1.495219, 1, 1, 1, 1, 1,
-0.8886963, -0.6662351, -2.894344, 0, 0, 1, 1, 1,
-0.887168, -0.2927585, -1.279266, 1, 0, 0, 1, 1,
-0.8857784, 0.7775376, -0.8639413, 1, 0, 0, 1, 1,
-0.8834569, -0.161441, -2.599673, 1, 0, 0, 1, 1,
-0.8827344, 3.072068, 0.3207545, 1, 0, 0, 1, 1,
-0.8746114, 0.1244705, -1.546821, 1, 0, 0, 1, 1,
-0.8733162, 0.5918175, -0.8103878, 0, 0, 0, 1, 1,
-0.8719478, 1.056282, -1.088211, 0, 0, 0, 1, 1,
-0.8666015, 1.852062, 1.32837, 0, 0, 0, 1, 1,
-0.866163, 1.217187, 0.1654112, 0, 0, 0, 1, 1,
-0.8636173, 0.7339396, -0.02867824, 0, 0, 0, 1, 1,
-0.8594748, -0.2715258, -2.893423, 0, 0, 0, 1, 1,
-0.8553363, -0.8511747, -4.090014, 0, 0, 0, 1, 1,
-0.8517106, 1.061533, -2.470893, 1, 1, 1, 1, 1,
-0.8471035, -0.5071865, -1.212199, 1, 1, 1, 1, 1,
-0.8377235, -1.031806, -2.345118, 1, 1, 1, 1, 1,
-0.835409, 0.8763757, -0.3937728, 1, 1, 1, 1, 1,
-0.8311648, -2.118959, -2.07825, 1, 1, 1, 1, 1,
-0.8283792, 0.2698606, -3.403481, 1, 1, 1, 1, 1,
-0.8268661, -1.051032, -2.707642, 1, 1, 1, 1, 1,
-0.8247293, -1.984753, -3.841424, 1, 1, 1, 1, 1,
-0.8201352, -1.066239, -3.10927, 1, 1, 1, 1, 1,
-0.8151456, 1.437348, -0.611199, 1, 1, 1, 1, 1,
-0.8139307, -0.1506823, 0.1544996, 1, 1, 1, 1, 1,
-0.8094442, -0.06957719, -1.630364, 1, 1, 1, 1, 1,
-0.8039535, 0.7407615, -0.792061, 1, 1, 1, 1, 1,
-0.801946, 0.2248778, -1.299436, 1, 1, 1, 1, 1,
-0.7982563, -0.5927904, -1.46302, 1, 1, 1, 1, 1,
-0.7927635, 0.7431597, -1.904173, 0, 0, 1, 1, 1,
-0.7862217, 1.616837, -0.2452448, 1, 0, 0, 1, 1,
-0.7765545, -1.313198, -1.82295, 1, 0, 0, 1, 1,
-0.7752997, -0.01801471, 1.154517, 1, 0, 0, 1, 1,
-0.7691175, -1.104898, -2.335128, 1, 0, 0, 1, 1,
-0.7679246, 1.372687, -0.8422939, 1, 0, 0, 1, 1,
-0.7640506, 0.07205953, -1.223162, 0, 0, 0, 1, 1,
-0.7639836, 1.292235, 0.1783915, 0, 0, 0, 1, 1,
-0.7639121, 1.98542, 0.2498381, 0, 0, 0, 1, 1,
-0.759792, -0.1138599, -0.8492967, 0, 0, 0, 1, 1,
-0.7503912, 0.7376081, 0.2003885, 0, 0, 0, 1, 1,
-0.7463229, -0.4207655, -2.046848, 0, 0, 0, 1, 1,
-0.7459418, -0.9534175, -0.7264163, 0, 0, 0, 1, 1,
-0.7442514, -0.2228301, -1.745551, 1, 1, 1, 1, 1,
-0.7407922, 0.1064069, -2.221563, 1, 1, 1, 1, 1,
-0.7395204, 0.05511444, -1.440473, 1, 1, 1, 1, 1,
-0.7367041, -0.06378856, -1.944784, 1, 1, 1, 1, 1,
-0.7362646, -1.191192, -1.84469, 1, 1, 1, 1, 1,
-0.7278922, 2.171867, 0.5380735, 1, 1, 1, 1, 1,
-0.7278371, -0.9440287, -3.014966, 1, 1, 1, 1, 1,
-0.7270169, -0.5192993, -1.615342, 1, 1, 1, 1, 1,
-0.7262599, 0.04571706, -1.634194, 1, 1, 1, 1, 1,
-0.7245975, -0.1935905, -1.943152, 1, 1, 1, 1, 1,
-0.722636, -0.1224344, -1.784455, 1, 1, 1, 1, 1,
-0.7187878, 0.2187629, -2.034997, 1, 1, 1, 1, 1,
-0.7169612, 0.02712214, -1.199739, 1, 1, 1, 1, 1,
-0.7101099, -0.4635314, -3.021375, 1, 1, 1, 1, 1,
-0.7097055, 0.7051418, -1.45237, 1, 1, 1, 1, 1,
-0.7061594, 2.228071, 0.8519019, 0, 0, 1, 1, 1,
-0.7059282, 0.9810512, -0.8070408, 1, 0, 0, 1, 1,
-0.6999265, -0.147793, -3.389544, 1, 0, 0, 1, 1,
-0.6938309, 1.262457, 0.4933789, 1, 0, 0, 1, 1,
-0.6931858, -1.007026, -1.792687, 1, 0, 0, 1, 1,
-0.682379, 0.419307, -1.425885, 1, 0, 0, 1, 1,
-0.6818299, 1.205308, -1.870526, 0, 0, 0, 1, 1,
-0.6805685, 0.8877242, -0.6478388, 0, 0, 0, 1, 1,
-0.6803349, 1.158586, -0.05457244, 0, 0, 0, 1, 1,
-0.6780676, -1.422081, -3.613556, 0, 0, 0, 1, 1,
-0.6777495, -0.3839073, -0.3746575, 0, 0, 0, 1, 1,
-0.6724127, 1.180313, -2.29486, 0, 0, 0, 1, 1,
-0.666235, 1.496479, -0.9068819, 0, 0, 0, 1, 1,
-0.6633096, -0.6842067, -2.279432, 1, 1, 1, 1, 1,
-0.6624373, -0.413236, 0.3126595, 1, 1, 1, 1, 1,
-0.6601021, -0.8164846, -3.723225, 1, 1, 1, 1, 1,
-0.654458, -0.2951956, -3.376304, 1, 1, 1, 1, 1,
-0.652497, 0.2676219, 1.006309, 1, 1, 1, 1, 1,
-0.651193, -0.8172081, -4.035869, 1, 1, 1, 1, 1,
-0.6386283, 0.5246185, -1.831156, 1, 1, 1, 1, 1,
-0.6384984, -0.3213095, -3.398741, 1, 1, 1, 1, 1,
-0.6325728, -0.1301346, -2.230027, 1, 1, 1, 1, 1,
-0.6300021, -1.641438, -4.09043, 1, 1, 1, 1, 1,
-0.6299704, -2.065803, -3.331528, 1, 1, 1, 1, 1,
-0.6283746, -0.4188269, -2.873616, 1, 1, 1, 1, 1,
-0.6269471, -1.981821, -4.186589, 1, 1, 1, 1, 1,
-0.6237442, 0.4694322, -1.340182, 1, 1, 1, 1, 1,
-0.6233516, 0.02920921, -1.90502, 1, 1, 1, 1, 1,
-0.6192664, -0.748634, -3.533512, 0, 0, 1, 1, 1,
-0.617615, 0.6786553, -1.053182, 1, 0, 0, 1, 1,
-0.6126094, 2.350488, 0.2652888, 1, 0, 0, 1, 1,
-0.6078683, -1.0436, -3.850547, 1, 0, 0, 1, 1,
-0.6065851, -0.4345601, -0.4350705, 1, 0, 0, 1, 1,
-0.6032311, -0.4024304, -1.119828, 1, 0, 0, 1, 1,
-0.6029553, -0.06690113, -0.5112167, 0, 0, 0, 1, 1,
-0.5981542, 0.8635975, -0.716221, 0, 0, 0, 1, 1,
-0.5959797, -1.546639, -3.358002, 0, 0, 0, 1, 1,
-0.5876072, -0.4096321, -3.055733, 0, 0, 0, 1, 1,
-0.5823767, -0.946398, -1.780998, 0, 0, 0, 1, 1,
-0.5802802, 1.445418, -2.877872, 0, 0, 0, 1, 1,
-0.5798247, -1.101761, -2.772911, 0, 0, 0, 1, 1,
-0.5758877, -0.2251907, -0.5719271, 1, 1, 1, 1, 1,
-0.5721585, 1.58908, -0.4578115, 1, 1, 1, 1, 1,
-0.5674232, 0.9231445, 0.2477241, 1, 1, 1, 1, 1,
-0.5644579, 0.05121923, -2.218015, 1, 1, 1, 1, 1,
-0.5521984, 0.2885255, -2.419911, 1, 1, 1, 1, 1,
-0.5521302, -0.1942771, -1.467865, 1, 1, 1, 1, 1,
-0.5468094, -0.4160722, -3.48084, 1, 1, 1, 1, 1,
-0.5466164, 0.5025228, -0.6927343, 1, 1, 1, 1, 1,
-0.5421042, -0.143708, -1.51914, 1, 1, 1, 1, 1,
-0.5404514, -0.5666677, -2.366829, 1, 1, 1, 1, 1,
-0.5363815, -0.704672, -1.792506, 1, 1, 1, 1, 1,
-0.5360411, 0.429507, -0.6323891, 1, 1, 1, 1, 1,
-0.5252671, -0.150945, -3.020147, 1, 1, 1, 1, 1,
-0.5244843, 0.8509993, -2.708939, 1, 1, 1, 1, 1,
-0.5237157, -1.4756, -5.053602, 1, 1, 1, 1, 1,
-0.5173541, -0.2921648, -2.402289, 0, 0, 1, 1, 1,
-0.5119804, 1.907415, 0.4697635, 1, 0, 0, 1, 1,
-0.5068119, -1.169463, -3.35585, 1, 0, 0, 1, 1,
-0.5050256, -0.166346, -2.314246, 1, 0, 0, 1, 1,
-0.5043613, -0.6809393, -2.652389, 1, 0, 0, 1, 1,
-0.4916284, 0.3840903, -1.685905, 1, 0, 0, 1, 1,
-0.4912484, -1.785366, -2.4577, 0, 0, 0, 1, 1,
-0.4758659, -0.5099681, -3.031198, 0, 0, 0, 1, 1,
-0.4709763, 0.6615469, -1.431154, 0, 0, 0, 1, 1,
-0.4695552, 2.066636, -0.9355507, 0, 0, 0, 1, 1,
-0.4680583, 0.1011922, -2.376748, 0, 0, 0, 1, 1,
-0.4664117, -0.08511893, -1.889458, 0, 0, 0, 1, 1,
-0.4636701, 0.1318747, -1.720899, 0, 0, 0, 1, 1,
-0.4620784, 0.3773355, -0.07627031, 1, 1, 1, 1, 1,
-0.4598044, -1.096987, -2.446095, 1, 1, 1, 1, 1,
-0.4578733, 0.7680285, -1.401734, 1, 1, 1, 1, 1,
-0.4571148, 0.9390428, -1.58013, 1, 1, 1, 1, 1,
-0.4559639, 1.458211, -2.05074, 1, 1, 1, 1, 1,
-0.4536655, -0.8523133, -2.679225, 1, 1, 1, 1, 1,
-0.4508955, -0.7422593, -4.478319, 1, 1, 1, 1, 1,
-0.450321, 0.5000725, -0.2097965, 1, 1, 1, 1, 1,
-0.4459408, 1.037881, -0.2981972, 1, 1, 1, 1, 1,
-0.4437198, 0.5636751, 1.16079, 1, 1, 1, 1, 1,
-0.4425004, 2.100637, 0.9672114, 1, 1, 1, 1, 1,
-0.439877, -0.2625319, -2.097863, 1, 1, 1, 1, 1,
-0.4353578, 0.1729625, -1.034063, 1, 1, 1, 1, 1,
-0.4298867, -0.6308991, -4.035664, 1, 1, 1, 1, 1,
-0.427557, -0.613703, -2.336357, 1, 1, 1, 1, 1,
-0.4252838, 1.025509, -1.060566, 0, 0, 1, 1, 1,
-0.4235677, 1.625064, -0.6333987, 1, 0, 0, 1, 1,
-0.416916, 1.843963, 0.0171874, 1, 0, 0, 1, 1,
-0.4095359, 0.7646459, 0.6904935, 1, 0, 0, 1, 1,
-0.4059649, 1.356879, 0.964155, 1, 0, 0, 1, 1,
-0.4053212, -0.5967994, -1.217192, 1, 0, 0, 1, 1,
-0.4021392, -0.219699, -3.422217, 0, 0, 0, 1, 1,
-0.3940914, 0.07034104, -2.255098, 0, 0, 0, 1, 1,
-0.3897299, -0.4697095, -1.456327, 0, 0, 0, 1, 1,
-0.3894527, 0.2812344, -1.820528, 0, 0, 0, 1, 1,
-0.3890973, -0.9522278, -2.545367, 0, 0, 0, 1, 1,
-0.3884887, 1.024183, 0.8248814, 0, 0, 0, 1, 1,
-0.3832586, -0.4713368, -2.044754, 0, 0, 0, 1, 1,
-0.3794772, 1.679775, -0.02072712, 1, 1, 1, 1, 1,
-0.379291, -0.4252528, -1.081911, 1, 1, 1, 1, 1,
-0.3786041, 0.7530068, 0.1389166, 1, 1, 1, 1, 1,
-0.3783443, 2.247794, -0.06587221, 1, 1, 1, 1, 1,
-0.3763854, -0.6306589, -4.218477, 1, 1, 1, 1, 1,
-0.3739678, 1.004212, -0.917302, 1, 1, 1, 1, 1,
-0.3738946, 0.8135291, -0.4606226, 1, 1, 1, 1, 1,
-0.3716453, 0.9855177, -0.6699435, 1, 1, 1, 1, 1,
-0.3716414, 0.2768312, -1.396615, 1, 1, 1, 1, 1,
-0.3708663, -0.4999644, -1.504286, 1, 1, 1, 1, 1,
-0.3691554, -1.976991, -2.638203, 1, 1, 1, 1, 1,
-0.3666199, 0.1728402, -0.2001642, 1, 1, 1, 1, 1,
-0.3643007, 0.2798773, -0.2138167, 1, 1, 1, 1, 1,
-0.3627232, -0.3278657, -1.524264, 1, 1, 1, 1, 1,
-0.3592348, -0.4544204, -3.53599, 1, 1, 1, 1, 1,
-0.3538433, -0.03484846, -2.344856, 0, 0, 1, 1, 1,
-0.3534035, -1.096615, -3.819419, 1, 0, 0, 1, 1,
-0.3524606, 1.003338, -0.5673962, 1, 0, 0, 1, 1,
-0.3463407, -0.2804855, -2.644073, 1, 0, 0, 1, 1,
-0.3460785, -0.9382579, -3.952589, 1, 0, 0, 1, 1,
-0.3405403, 1.70681, -0.9645407, 1, 0, 0, 1, 1,
-0.3405092, -1.608213, -1.799237, 0, 0, 0, 1, 1,
-0.3389084, -1.60911, -1.973996, 0, 0, 0, 1, 1,
-0.3355063, -0.9155002, -2.819509, 0, 0, 0, 1, 1,
-0.3315699, 0.8265121, -0.06755554, 0, 0, 0, 1, 1,
-0.3293471, 0.929181, 0.3864135, 0, 0, 0, 1, 1,
-0.3290178, -0.3700863, -2.241145, 0, 0, 0, 1, 1,
-0.3239996, 0.3974024, -1.010506, 0, 0, 0, 1, 1,
-0.3189975, -1.392708, -3.32533, 1, 1, 1, 1, 1,
-0.3176056, 0.2722224, -0.4797544, 1, 1, 1, 1, 1,
-0.3158325, 0.4625847, -2.277762, 1, 1, 1, 1, 1,
-0.3152063, -0.2454401, -2.466514, 1, 1, 1, 1, 1,
-0.310367, -1.582708, -3.460665, 1, 1, 1, 1, 1,
-0.3102899, -0.9905981, -3.119565, 1, 1, 1, 1, 1,
-0.3088771, 0.6019495, -0.9453111, 1, 1, 1, 1, 1,
-0.305754, -0.2090123, -2.149319, 1, 1, 1, 1, 1,
-0.3047785, 1.396126, -1.124771, 1, 1, 1, 1, 1,
-0.3035514, -0.2304005, -2.391483, 1, 1, 1, 1, 1,
-0.3033719, 0.7192911, -0.3418549, 1, 1, 1, 1, 1,
-0.3012611, -0.01863738, -2.446165, 1, 1, 1, 1, 1,
-0.2987948, -1.217747, -3.228595, 1, 1, 1, 1, 1,
-0.2947122, -1.659435, -1.779491, 1, 1, 1, 1, 1,
-0.2939068, 0.2153432, -2.66592, 1, 1, 1, 1, 1,
-0.2939002, 0.7997012, -0.2040566, 0, 0, 1, 1, 1,
-0.2922916, 0.6997823, 0.9511023, 1, 0, 0, 1, 1,
-0.2921552, -0.265303, -1.112728, 1, 0, 0, 1, 1,
-0.2900492, 0.4617412, -1.693721, 1, 0, 0, 1, 1,
-0.2897518, -0.2382324, -1.605317, 1, 0, 0, 1, 1,
-0.2892828, -1.270422, -3.614177, 1, 0, 0, 1, 1,
-0.2838559, -1.070722, -1.662744, 0, 0, 0, 1, 1,
-0.2824557, -0.714585, -2.389838, 0, 0, 0, 1, 1,
-0.2801589, 2.000408, 1.061669, 0, 0, 0, 1, 1,
-0.278825, 1.381509, 0.5480491, 0, 0, 0, 1, 1,
-0.2787955, -0.02572116, -0.7868729, 0, 0, 0, 1, 1,
-0.273987, 0.8330811, -0.4125997, 0, 0, 0, 1, 1,
-0.2688552, -0.4275002, -2.911145, 0, 0, 0, 1, 1,
-0.2666751, 1.009332, -0.2976935, 1, 1, 1, 1, 1,
-0.2643668, 1.817139, -0.5611669, 1, 1, 1, 1, 1,
-0.2600324, 1.025189, -0.2755734, 1, 1, 1, 1, 1,
-0.260031, -0.2133434, -2.034773, 1, 1, 1, 1, 1,
-0.2558057, 1.705258, 0.2438045, 1, 1, 1, 1, 1,
-0.2517872, 0.6805009, -0.7691343, 1, 1, 1, 1, 1,
-0.2482166, 1.369312, -0.6196169, 1, 1, 1, 1, 1,
-0.2458773, -0.08534451, -1.859441, 1, 1, 1, 1, 1,
-0.2449614, 0.7649672, -0.3537694, 1, 1, 1, 1, 1,
-0.2419065, -1.740749, -3.05123, 1, 1, 1, 1, 1,
-0.2413582, -0.5228716, -4.079746, 1, 1, 1, 1, 1,
-0.2385295, -0.8339444, -2.219126, 1, 1, 1, 1, 1,
-0.2321634, -1.511391, -3.021572, 1, 1, 1, 1, 1,
-0.2288266, 0.03045109, -0.4918697, 1, 1, 1, 1, 1,
-0.2278124, 0.672984, -0.3435953, 1, 1, 1, 1, 1,
-0.2275088, 0.1968923, -2.577627, 0, 0, 1, 1, 1,
-0.2267523, -0.2577949, -1.685495, 1, 0, 0, 1, 1,
-0.2266563, -0.1206365, -0.3248432, 1, 0, 0, 1, 1,
-0.224129, 0.5771103, -0.9534883, 1, 0, 0, 1, 1,
-0.2202186, -1.969941, -2.871534, 1, 0, 0, 1, 1,
-0.2167729, 0.4278489, -0.7574452, 1, 0, 0, 1, 1,
-0.2163857, -0.08435737, -2.576959, 0, 0, 0, 1, 1,
-0.2122525, 0.5476954, -1.821169, 0, 0, 0, 1, 1,
-0.2115294, -0.8379982, -3.707911, 0, 0, 0, 1, 1,
-0.2103742, 0.5361032, 1.443729, 0, 0, 0, 1, 1,
-0.2084216, 0.2283409, -0.4745985, 0, 0, 0, 1, 1,
-0.2070378, 0.0377567, -0.5286434, 0, 0, 0, 1, 1,
-0.206481, 1.072242, 0.964145, 0, 0, 0, 1, 1,
-0.2032748, 0.8581167, 1.180385, 1, 1, 1, 1, 1,
-0.1967323, 0.9641258, 0.6366494, 1, 1, 1, 1, 1,
-0.1953056, 0.292402, 0.528002, 1, 1, 1, 1, 1,
-0.1948306, -0.3123441, -4.332861, 1, 1, 1, 1, 1,
-0.1941311, -0.6920287, -2.798968, 1, 1, 1, 1, 1,
-0.1858993, -0.3405032, -2.01576, 1, 1, 1, 1, 1,
-0.1851355, -0.1833618, -2.338359, 1, 1, 1, 1, 1,
-0.1838219, 1.633479, -0.655953, 1, 1, 1, 1, 1,
-0.1818826, 0.3050033, -0.7393308, 1, 1, 1, 1, 1,
-0.1770103, -0.5685335, -3.124897, 1, 1, 1, 1, 1,
-0.1766367, -2.63262, -3.082134, 1, 1, 1, 1, 1,
-0.175683, 1.290434, -1.937988, 1, 1, 1, 1, 1,
-0.1670877, 0.730034, 0.2453323, 1, 1, 1, 1, 1,
-0.1663086, -1.018025, -4.528949, 1, 1, 1, 1, 1,
-0.1660218, -0.2497884, -3.679779, 1, 1, 1, 1, 1,
-0.163973, 1.146713, 0.6086342, 0, 0, 1, 1, 1,
-0.1585464, 0.1066621, -2.238697, 1, 0, 0, 1, 1,
-0.1574467, 0.2353881, -2.236125, 1, 0, 0, 1, 1,
-0.1570692, -0.3607031, -4.111583, 1, 0, 0, 1, 1,
-0.1528338, 0.1967588, -2.149176, 1, 0, 0, 1, 1,
-0.1508805, 1.902067, -0.3539928, 1, 0, 0, 1, 1,
-0.1507898, 0.8668509, 1.501228, 0, 0, 0, 1, 1,
-0.1499375, 0.02400981, 0.6390136, 0, 0, 0, 1, 1,
-0.1490982, -0.07166285, -1.154117, 0, 0, 0, 1, 1,
-0.1478354, -1.583269, -2.804244, 0, 0, 0, 1, 1,
-0.133903, 0.8564784, -0.720493, 0, 0, 0, 1, 1,
-0.1284341, -0.4661523, -3.59989, 0, 0, 0, 1, 1,
-0.1227529, 1.788229, 0.006744366, 0, 0, 0, 1, 1,
-0.1217334, -1.006919, -3.464222, 1, 1, 1, 1, 1,
-0.1207581, 0.4737805, -1.417945, 1, 1, 1, 1, 1,
-0.1190131, 0.844844, 0.9500592, 1, 1, 1, 1, 1,
-0.1150647, 0.1429066, -0.3669819, 1, 1, 1, 1, 1,
-0.1140985, 0.2154306, 0.8320251, 1, 1, 1, 1, 1,
-0.1129705, 0.6815083, -0.6150919, 1, 1, 1, 1, 1,
-0.1127393, 2.002649, 0.8877211, 1, 1, 1, 1, 1,
-0.1121891, 1.375969, -0.2367831, 1, 1, 1, 1, 1,
-0.1120964, 0.1633342, 1.906424, 1, 1, 1, 1, 1,
-0.1109331, 0.4478423, -1.518614, 1, 1, 1, 1, 1,
-0.1079512, -0.2258741, -4.437568, 1, 1, 1, 1, 1,
-0.1060484, -1.369934, -3.2223, 1, 1, 1, 1, 1,
-0.1052065, 2.020959, 0.2942191, 1, 1, 1, 1, 1,
-0.1024704, -1.246643, -3.552822, 1, 1, 1, 1, 1,
-0.1015107, -0.2751246, -3.774658, 1, 1, 1, 1, 1,
-0.1013986, 0.4097013, 1.154898, 0, 0, 1, 1, 1,
-0.1001197, -0.006295689, -2.526905, 1, 0, 0, 1, 1,
-0.09247388, -1.490171, -3.515568, 1, 0, 0, 1, 1,
-0.08956506, 0.1624687, 0.04882086, 1, 0, 0, 1, 1,
-0.0893736, -1.83279, -3.908104, 1, 0, 0, 1, 1,
-0.08893251, 0.7394795, 0.9880747, 1, 0, 0, 1, 1,
-0.0885322, -0.3702534, -3.250521, 0, 0, 0, 1, 1,
-0.08618718, 0.001749092, -1.366866, 0, 0, 0, 1, 1,
-0.08455846, 0.1821763, -0.7585559, 0, 0, 0, 1, 1,
-0.0774781, -0.3117093, -0.2762797, 0, 0, 0, 1, 1,
-0.07343541, 2.240885, -2.318466, 0, 0, 0, 1, 1,
-0.07329236, 0.4344932, 0.1815868, 0, 0, 0, 1, 1,
-0.07135335, 2.602174, -0.8406777, 0, 0, 0, 1, 1,
-0.06071259, -0.4572492, -3.144466, 1, 1, 1, 1, 1,
-0.05313574, -0.0001864781, -1.290212, 1, 1, 1, 1, 1,
-0.05085435, -1.154406, -2.674707, 1, 1, 1, 1, 1,
-0.04578412, 0.645727, -1.247196, 1, 1, 1, 1, 1,
-0.04076337, -0.4586112, -3.045201, 1, 1, 1, 1, 1,
-0.0387752, -0.4323139, -4.218801, 1, 1, 1, 1, 1,
-0.03849652, -0.3176384, -2.272952, 1, 1, 1, 1, 1,
-0.034137, -1.062564, -2.415351, 1, 1, 1, 1, 1,
-0.03223289, -0.5044767, -3.241212, 1, 1, 1, 1, 1,
-0.03102426, 1.435467, 0.572565, 1, 1, 1, 1, 1,
-0.02910954, -1.282715, -3.074853, 1, 1, 1, 1, 1,
-0.02887632, -0.3492252, -2.859408, 1, 1, 1, 1, 1,
-0.02701052, -0.2461025, -3.602572, 1, 1, 1, 1, 1,
-0.01845638, -1.159642, -3.50367, 1, 1, 1, 1, 1,
-0.01696562, -0.7902167, -3.029785, 1, 1, 1, 1, 1,
-0.0158966, 1.05859, -1.554787, 0, 0, 1, 1, 1,
-0.01218327, -0.2436407, -3.058338, 1, 0, 0, 1, 1,
-0.0100773, 0.4896291, 0.4214113, 1, 0, 0, 1, 1,
-0.008319685, 0.2581024, 1.790601, 1, 0, 0, 1, 1,
-0.006405175, 1.315228, 0.2821497, 1, 0, 0, 1, 1,
-0.003310378, -1.352326, -4.179476, 1, 0, 0, 1, 1,
0.006700176, -0.3052765, 4.966286, 0, 0, 0, 1, 1,
0.01012363, 0.4268904, -0.2124885, 0, 0, 0, 1, 1,
0.01096599, -0.1821388, 2.632689, 0, 0, 0, 1, 1,
0.01237609, -0.3355072, 3.735921, 0, 0, 0, 1, 1,
0.01389358, 1.322204, 0.1444478, 0, 0, 0, 1, 1,
0.01609923, 0.4388485, 0.100863, 0, 0, 0, 1, 1,
0.01633568, 0.6128349, 0.7568694, 0, 0, 0, 1, 1,
0.01983026, 1.467789, 0.5401354, 1, 1, 1, 1, 1,
0.02339766, 0.4384137, -1.23198, 1, 1, 1, 1, 1,
0.02484562, 1.154305, -0.1899789, 1, 1, 1, 1, 1,
0.02574896, -0.7366896, 1.929957, 1, 1, 1, 1, 1,
0.02606569, 0.8790452, 0.02898247, 1, 1, 1, 1, 1,
0.02760146, -1.388556, 3.718477, 1, 1, 1, 1, 1,
0.02826911, 0.5408476, 1.394455, 1, 1, 1, 1, 1,
0.03299289, -0.6683806, 3.443807, 1, 1, 1, 1, 1,
0.03478859, 0.2078964, 0.8816601, 1, 1, 1, 1, 1,
0.03830476, 0.137047, 0.4552777, 1, 1, 1, 1, 1,
0.04273831, -0.2785558, 1.966169, 1, 1, 1, 1, 1,
0.0452177, 0.1033407, 0.8902588, 1, 1, 1, 1, 1,
0.04587103, -2.017637, 4.559226, 1, 1, 1, 1, 1,
0.05087683, -0.9181165, 3.222318, 1, 1, 1, 1, 1,
0.05185476, 0.5971032, -0.5690705, 1, 1, 1, 1, 1,
0.0587329, 0.7151728, 0.5149181, 0, 0, 1, 1, 1,
0.06036571, 0.3924049, 0.617381, 1, 0, 0, 1, 1,
0.06136427, 0.384073, 1.673843, 1, 0, 0, 1, 1,
0.06146922, -0.6578984, 2.27866, 1, 0, 0, 1, 1,
0.06165442, 1.395694, 0.5128728, 1, 0, 0, 1, 1,
0.06463252, 0.3097259, -1.565051, 1, 0, 0, 1, 1,
0.06844611, 0.9706508, -0.400818, 0, 0, 0, 1, 1,
0.06993439, -0.8071341, 2.183812, 0, 0, 0, 1, 1,
0.07100586, 1.840846, 0.1677269, 0, 0, 0, 1, 1,
0.07346633, 1.644699, -0.03712815, 0, 0, 0, 1, 1,
0.07359484, 1.463157, -0.4368896, 0, 0, 0, 1, 1,
0.07409579, -2.564402, 4.538774, 0, 0, 0, 1, 1,
0.08047, -0.227369, 3.589406, 0, 0, 0, 1, 1,
0.08591179, 0.3844526, -0.4539872, 1, 1, 1, 1, 1,
0.08791281, 0.1422697, 1.383841, 1, 1, 1, 1, 1,
0.09162051, -1.057389, 3.676206, 1, 1, 1, 1, 1,
0.09164391, -0.5024315, 2.550246, 1, 1, 1, 1, 1,
0.09260663, 1.534406, 0.7376413, 1, 1, 1, 1, 1,
0.09275502, -0.674357, 3.329392, 1, 1, 1, 1, 1,
0.09406281, -0.8996557, 5.347443, 1, 1, 1, 1, 1,
0.09424813, 0.4349512, -0.4162056, 1, 1, 1, 1, 1,
0.09885315, 1.107926, 0.1782659, 1, 1, 1, 1, 1,
0.0999756, 1.117911, -1.299834, 1, 1, 1, 1, 1,
0.1037173, 0.2560199, 0.9104106, 1, 1, 1, 1, 1,
0.1065556, -0.08445913, 2.140993, 1, 1, 1, 1, 1,
0.1094472, -0.03545423, 1.234578, 1, 1, 1, 1, 1,
0.1148698, -0.7002733, 0.6064144, 1, 1, 1, 1, 1,
0.1242316, 0.7216511, -0.2988762, 1, 1, 1, 1, 1,
0.1316926, 1.465347, 1.001752, 0, 0, 1, 1, 1,
0.1351289, 0.02043522, 2.297977, 1, 0, 0, 1, 1,
0.1396108, 0.7915552, 1.266463, 1, 0, 0, 1, 1,
0.1396349, -2.013752, 4.398808, 1, 0, 0, 1, 1,
0.141509, -1.126488, 2.285081, 1, 0, 0, 1, 1,
0.1424233, -0.3933748, 3.340569, 1, 0, 0, 1, 1,
0.1424996, 0.9825469, 1.104214, 0, 0, 0, 1, 1,
0.1430824, -1.725523, 4.458669, 0, 0, 0, 1, 1,
0.1476662, -0.1260097, 4.526244, 0, 0, 0, 1, 1,
0.1483538, 2.186244, 0.02794362, 0, 0, 0, 1, 1,
0.1517192, -0.7786716, 3.833449, 0, 0, 0, 1, 1,
0.1554376, -0.7511602, 2.692653, 0, 0, 0, 1, 1,
0.1609326, 1.152013, -0.3005762, 0, 0, 0, 1, 1,
0.1612449, 0.5818259, -1.408095, 1, 1, 1, 1, 1,
0.1613818, 0.6733617, -0.8155945, 1, 1, 1, 1, 1,
0.161654, 0.2781183, 0.5648924, 1, 1, 1, 1, 1,
0.1617091, 0.6665089, 1.930325, 1, 1, 1, 1, 1,
0.1625752, 0.06708721, 1.492528, 1, 1, 1, 1, 1,
0.1685382, 0.4442265, 0.1701414, 1, 1, 1, 1, 1,
0.1685723, 0.05317477, 0.751394, 1, 1, 1, 1, 1,
0.1694051, 0.6895219, 1.77571, 1, 1, 1, 1, 1,
0.1764897, -0.9212934, 2.740716, 1, 1, 1, 1, 1,
0.1854955, 1.376913, -1.04652, 1, 1, 1, 1, 1,
0.1861112, 0.8272017, -0.3127021, 1, 1, 1, 1, 1,
0.1879816, -1.451598, 1.958484, 1, 1, 1, 1, 1,
0.1891722, 0.3318118, 1.086751, 1, 1, 1, 1, 1,
0.1913208, -0.09688628, 1.172681, 1, 1, 1, 1, 1,
0.1915552, 0.1053077, 1.050309, 1, 1, 1, 1, 1,
0.1930852, -0.5108454, 0.5293028, 0, 0, 1, 1, 1,
0.2108812, 1.440901, 0.937032, 1, 0, 0, 1, 1,
0.2110673, -0.06256409, 1.143634, 1, 0, 0, 1, 1,
0.2138165, 0.05679699, 0.2213635, 1, 0, 0, 1, 1,
0.2154016, -0.5562496, 4.035796, 1, 0, 0, 1, 1,
0.2167048, -0.02266604, 1.288961, 1, 0, 0, 1, 1,
0.2200226, 0.2767691, 0.1022692, 0, 0, 0, 1, 1,
0.2206983, -1.274205, 2.879138, 0, 0, 0, 1, 1,
0.2290869, 0.107994, 1.640937, 0, 0, 0, 1, 1,
0.2293707, -0.2111472, 3.614213, 0, 0, 0, 1, 1,
0.2348296, 1.729403, 2.20499, 0, 0, 0, 1, 1,
0.2383393, 0.007805374, 0.5917166, 0, 0, 0, 1, 1,
0.2438549, 0.2251032, -1.038573, 0, 0, 0, 1, 1,
0.2470159, 0.8291399, -0.5467517, 1, 1, 1, 1, 1,
0.2499699, -0.9011565, 3.887304, 1, 1, 1, 1, 1,
0.2500499, -0.1302419, 1.724576, 1, 1, 1, 1, 1,
0.2527101, 1.459123, -0.1154163, 1, 1, 1, 1, 1,
0.2532111, -2.397581, 2.682153, 1, 1, 1, 1, 1,
0.2538815, 0.9647384, 1.857773, 1, 1, 1, 1, 1,
0.2557865, -0.3797035, 1.742323, 1, 1, 1, 1, 1,
0.2588725, 0.7682875, -0.7027786, 1, 1, 1, 1, 1,
0.2596646, -2.767745, 1.741377, 1, 1, 1, 1, 1,
0.2601582, 0.2790982, 2.528842, 1, 1, 1, 1, 1,
0.2648185, 1.129768, 0.6069238, 1, 1, 1, 1, 1,
0.2669818, 1.556459, -1.113663, 1, 1, 1, 1, 1,
0.2680283, -1.106482, 1.796425, 1, 1, 1, 1, 1,
0.2722357, -0.9300615, 1.024122, 1, 1, 1, 1, 1,
0.2725398, -1.260321, 3.704415, 1, 1, 1, 1, 1,
0.2732727, -0.2416004, 2.706986, 0, 0, 1, 1, 1,
0.27385, -0.08780555, 2.451709, 1, 0, 0, 1, 1,
0.275946, 0.7390208, 0.3823016, 1, 0, 0, 1, 1,
0.2784612, -0.2718131, 3.89487, 1, 0, 0, 1, 1,
0.2788588, 1.501729, -0.05178997, 1, 0, 0, 1, 1,
0.2794969, 0.7531298, 1.807383, 1, 0, 0, 1, 1,
0.2809371, -1.036242, 2.254941, 0, 0, 0, 1, 1,
0.2822128, 0.5520449, -0.5988345, 0, 0, 0, 1, 1,
0.2838017, 0.8659129, 0.7265279, 0, 0, 0, 1, 1,
0.2840835, 1.555975, -1.564346, 0, 0, 0, 1, 1,
0.2926513, -0.4727699, 4.02696, 0, 0, 0, 1, 1,
0.2927569, -1.738883, 3.486519, 0, 0, 0, 1, 1,
0.2942335, 1.165891, 0.001470415, 0, 0, 0, 1, 1,
0.3013366, 1.071835, 1.754232, 1, 1, 1, 1, 1,
0.3076024, -0.004543857, 2.194087, 1, 1, 1, 1, 1,
0.3085316, -0.3139844, 2.204498, 1, 1, 1, 1, 1,
0.3104447, -0.3369853, 2.988028, 1, 1, 1, 1, 1,
0.3156367, -0.7526244, 2.117291, 1, 1, 1, 1, 1,
0.316679, -0.2143801, 2.877057, 1, 1, 1, 1, 1,
0.3197886, -0.003104181, 2.344791, 1, 1, 1, 1, 1,
0.3211038, -0.7575555, 1.816936, 1, 1, 1, 1, 1,
0.3236001, 0.01538152, 1.72359, 1, 1, 1, 1, 1,
0.326416, -0.01796643, 1.737849, 1, 1, 1, 1, 1,
0.3278062, -0.5146707, 3.641814, 1, 1, 1, 1, 1,
0.328961, -2.963142, 3.095384, 1, 1, 1, 1, 1,
0.3300915, -0.5742781, 2.523812, 1, 1, 1, 1, 1,
0.3342503, -0.001345891, 1.634346, 1, 1, 1, 1, 1,
0.3366322, -0.7841727, 4.047397, 1, 1, 1, 1, 1,
0.3380668, 0.6040345, 0.6235154, 0, 0, 1, 1, 1,
0.3384945, -1.531291, 2.552708, 1, 0, 0, 1, 1,
0.3402027, -1.294696, 3.985657, 1, 0, 0, 1, 1,
0.3417219, -0.7843218, 2.486338, 1, 0, 0, 1, 1,
0.3438416, 1.192697, 0.7059945, 1, 0, 0, 1, 1,
0.3448825, 0.7345397, -0.7764764, 1, 0, 0, 1, 1,
0.3457159, 0.7220961, -0.1788958, 0, 0, 0, 1, 1,
0.347483, 0.3011174, 0.7543651, 0, 0, 0, 1, 1,
0.3481533, 0.1505436, 1.287129, 0, 0, 0, 1, 1,
0.3527115, 0.1265584, 1.393135, 0, 0, 0, 1, 1,
0.3537714, 0.1390146, 1.717899, 0, 0, 0, 1, 1,
0.3564154, 0.2728238, 2.700531, 0, 0, 0, 1, 1,
0.357791, 0.5035784, -0.6553503, 0, 0, 0, 1, 1,
0.3595547, 0.7077205, 0.02402291, 1, 1, 1, 1, 1,
0.3611757, -1.429666, 2.779982, 1, 1, 1, 1, 1,
0.3661628, 0.32506, -0.09108175, 1, 1, 1, 1, 1,
0.368288, 1.712061, -0.461075, 1, 1, 1, 1, 1,
0.3699186, -0.5663707, 3.177323, 1, 1, 1, 1, 1,
0.3739283, -0.5086143, 1.530407, 1, 1, 1, 1, 1,
0.3776475, 0.1664036, 1.868664, 1, 1, 1, 1, 1,
0.3834498, 0.09528136, 0.3300603, 1, 1, 1, 1, 1,
0.3971023, 0.2182704, 1.125232, 1, 1, 1, 1, 1,
0.4006462, 1.456589, -0.6799371, 1, 1, 1, 1, 1,
0.4008285, -0.8344615, 1.396951, 1, 1, 1, 1, 1,
0.4017774, 1.081844, 1.2546, 1, 1, 1, 1, 1,
0.4055494, -0.7633969, 3.498546, 1, 1, 1, 1, 1,
0.4081915, 1.624334, -0.6521543, 1, 1, 1, 1, 1,
0.4082372, 0.02582522, 3.436016, 1, 1, 1, 1, 1,
0.4122728, 0.1610425, 0.3221569, 0, 0, 1, 1, 1,
0.413344, 0.6904165, 0.3024158, 1, 0, 0, 1, 1,
0.4150044, 1.087807, -1.222246, 1, 0, 0, 1, 1,
0.4150991, 2.592463, 0.8428219, 1, 0, 0, 1, 1,
0.4171101, -1.279988, 2.63779, 1, 0, 0, 1, 1,
0.4181937, -0.6775297, 3.119553, 1, 0, 0, 1, 1,
0.4199855, 0.1172153, 3.569487, 0, 0, 0, 1, 1,
0.4207071, 1.206803, 0.8779095, 0, 0, 0, 1, 1,
0.4209013, 0.4850579, -0.4013522, 0, 0, 0, 1, 1,
0.421087, -1.417326, 2.900474, 0, 0, 0, 1, 1,
0.4229379, 1.699534, 0.7022998, 0, 0, 0, 1, 1,
0.4237996, -0.23582, 2.061677, 0, 0, 0, 1, 1,
0.4293844, -2.074987, 3.558752, 0, 0, 0, 1, 1,
0.4312293, 1.207829, -0.01878437, 1, 1, 1, 1, 1,
0.4353009, 0.07745858, 2.380589, 1, 1, 1, 1, 1,
0.4353779, 0.2500683, 1.2741, 1, 1, 1, 1, 1,
0.4373305, -0.2347191, 3.6871, 1, 1, 1, 1, 1,
0.4431873, 0.7666436, 1.409555, 1, 1, 1, 1, 1,
0.4474133, 0.3123215, 0.1013944, 1, 1, 1, 1, 1,
0.4474755, -0.1100859, -0.8373693, 1, 1, 1, 1, 1,
0.4511693, -0.008646962, 2.093176, 1, 1, 1, 1, 1,
0.4512809, 0.0538551, 2.810708, 1, 1, 1, 1, 1,
0.4540998, 0.5729231, -0.2710334, 1, 1, 1, 1, 1,
0.4578015, 0.5768515, 0.6838379, 1, 1, 1, 1, 1,
0.4581779, -1.167044, 3.33158, 1, 1, 1, 1, 1,
0.4585684, 0.6377785, 2.624879, 1, 1, 1, 1, 1,
0.4593243, 1.170796, 1.045592, 1, 1, 1, 1, 1,
0.466518, 0.7806064, 1.897598, 1, 1, 1, 1, 1,
0.4726043, 1.652272, 0.7141103, 0, 0, 1, 1, 1,
0.4903198, 0.07052349, 3.399341, 1, 0, 0, 1, 1,
0.5032151, 1.266507, -1.574326, 1, 0, 0, 1, 1,
0.5076681, -0.7185035, 1.50091, 1, 0, 0, 1, 1,
0.5084835, 0.7163076, 1.746521, 1, 0, 0, 1, 1,
0.5100117, -0.9201478, 3.9494, 1, 0, 0, 1, 1,
0.5105535, -0.04775368, 3.397653, 0, 0, 0, 1, 1,
0.5125814, 1.359795, 1.979541, 0, 0, 0, 1, 1,
0.5147063, -0.8030326, 3.528694, 0, 0, 0, 1, 1,
0.5170857, -0.4706049, 1.233594, 0, 0, 0, 1, 1,
0.5181456, 1.585648, -1.618725, 0, 0, 0, 1, 1,
0.5186752, -0.7854373, 1.739191, 0, 0, 0, 1, 1,
0.5205445, 0.06855965, 0.3285938, 0, 0, 0, 1, 1,
0.5246585, 1.415058, 0.7069874, 1, 1, 1, 1, 1,
0.5260993, -0.3520024, 2.86666, 1, 1, 1, 1, 1,
0.5300069, -0.8513974, 1.91143, 1, 1, 1, 1, 1,
0.5310537, 0.7304257, 0.3962487, 1, 1, 1, 1, 1,
0.5356869, 0.638344, 1.484496, 1, 1, 1, 1, 1,
0.5385233, 0.1817918, -0.7033201, 1, 1, 1, 1, 1,
0.5386903, -0.8856518, 4.488632, 1, 1, 1, 1, 1,
0.5474446, 0.5144989, 1.163952, 1, 1, 1, 1, 1,
0.548883, 0.4382367, 0.2145048, 1, 1, 1, 1, 1,
0.557945, -0.8483919, 0.5796722, 1, 1, 1, 1, 1,
0.5614781, -1.052911, 2.632712, 1, 1, 1, 1, 1,
0.5643899, 1.034938, 1.677461, 1, 1, 1, 1, 1,
0.5689195, 1.447669, 1.117411, 1, 1, 1, 1, 1,
0.5692033, -1.610662, 2.88758, 1, 1, 1, 1, 1,
0.5707153, 1.691998, -0.6025042, 1, 1, 1, 1, 1,
0.5738005, 1.455235, 0.6364742, 0, 0, 1, 1, 1,
0.5740008, 1.354841, -0.627889, 1, 0, 0, 1, 1,
0.575622, -0.9812183, 1.337033, 1, 0, 0, 1, 1,
0.5816087, 0.2416822, 1.187934, 1, 0, 0, 1, 1,
0.5818003, 0.8394789, -0.3704007, 1, 0, 0, 1, 1,
0.5834975, 0.949841, 0.3082981, 1, 0, 0, 1, 1,
0.5868542, 1.645778, 2.246262, 0, 0, 0, 1, 1,
0.5874436, 1.659077, 1.442963, 0, 0, 0, 1, 1,
0.5903084, -0.860805, 2.681233, 0, 0, 0, 1, 1,
0.5917788, -1.392254, 2.417962, 0, 0, 0, 1, 1,
0.5923187, 1.505877, 1.437352, 0, 0, 0, 1, 1,
0.5930727, -0.4384366, 1.588533, 0, 0, 0, 1, 1,
0.5960514, -0.2656228, 3.010513, 0, 0, 0, 1, 1,
0.5996261, 0.6641077, 0.4353991, 1, 1, 1, 1, 1,
0.600518, 0.4295405, 0.3074061, 1, 1, 1, 1, 1,
0.6030991, -0.6725779, 1.677643, 1, 1, 1, 1, 1,
0.6042878, 0.324055, 0.08060373, 1, 1, 1, 1, 1,
0.6075416, -0.6607846, 1.811547, 1, 1, 1, 1, 1,
0.6076471, 1.983977, -0.02795427, 1, 1, 1, 1, 1,
0.6105775, 0.8448063, 0.4123212, 1, 1, 1, 1, 1,
0.6121795, 1.279642, 1.432581, 1, 1, 1, 1, 1,
0.6191214, -0.1829733, 3.638901, 1, 1, 1, 1, 1,
0.619909, 0.06789629, 2.940184, 1, 1, 1, 1, 1,
0.6224352, -0.3510429, 5.151756, 1, 1, 1, 1, 1,
0.6238992, -0.6427501, 3.654762, 1, 1, 1, 1, 1,
0.6269405, -2.90738, 0.08143895, 1, 1, 1, 1, 1,
0.6295219, -1.471845, 2.6256, 1, 1, 1, 1, 1,
0.6298025, 1.352991, 2.295483, 1, 1, 1, 1, 1,
0.6315647, 0.9461536, 0.381337, 0, 0, 1, 1, 1,
0.6331875, -0.02542228, 2.073187, 1, 0, 0, 1, 1,
0.6349083, -1.230694, 1.237511, 1, 0, 0, 1, 1,
0.6375486, -0.7422245, 2.550841, 1, 0, 0, 1, 1,
0.6413293, 1.335216, -0.7196113, 1, 0, 0, 1, 1,
0.6471431, -0.06723937, 0.3684027, 1, 0, 0, 1, 1,
0.6499929, -1.46218, 2.215703, 0, 0, 0, 1, 1,
0.6572325, -0.2479526, 3.453384, 0, 0, 0, 1, 1,
0.6619208, -0.1266874, 0.9353011, 0, 0, 0, 1, 1,
0.6647243, -1.220339, 2.038364, 0, 0, 0, 1, 1,
0.6753713, -1.058848, 3.932293, 0, 0, 0, 1, 1,
0.6797755, -0.1040784, 3.308563, 0, 0, 0, 1, 1,
0.6825815, 0.9741081, 2.013851, 0, 0, 0, 1, 1,
0.6831421, -0.6340889, 1.954565, 1, 1, 1, 1, 1,
0.6867204, 0.720961, 0.9159751, 1, 1, 1, 1, 1,
0.6889222, 1.338814, 0.1189233, 1, 1, 1, 1, 1,
0.6944628, -0.3279401, 2.560814, 1, 1, 1, 1, 1,
0.699388, -0.5372582, 2.358203, 1, 1, 1, 1, 1,
0.7004126, 0.9136971, 0.5501246, 1, 1, 1, 1, 1,
0.7018979, -1.256545, 1.593449, 1, 1, 1, 1, 1,
0.7024066, 1.003451, 1.847308, 1, 1, 1, 1, 1,
0.7032728, -0.433752, 2.358247, 1, 1, 1, 1, 1,
0.7060326, 0.7193317, 1.941317, 1, 1, 1, 1, 1,
0.7095675, -0.4040816, 1.095389, 1, 1, 1, 1, 1,
0.7102498, -0.1692802, 1.884279, 1, 1, 1, 1, 1,
0.7125391, -2.094905, 3.442833, 1, 1, 1, 1, 1,
0.7150899, 0.3093044, 1.267201, 1, 1, 1, 1, 1,
0.7184966, -1.04965, 1.09584, 1, 1, 1, 1, 1,
0.7188781, 0.7341542, 0.868022, 0, 0, 1, 1, 1,
0.7197453, -0.2247922, 1.396871, 1, 0, 0, 1, 1,
0.7199516, 0.216502, 0.8616875, 1, 0, 0, 1, 1,
0.720279, 0.5849572, -0.4217398, 1, 0, 0, 1, 1,
0.7232456, 0.8751683, -0.08744095, 1, 0, 0, 1, 1,
0.7288143, -2.093739, 2.637098, 1, 0, 0, 1, 1,
0.7333924, 0.1909082, 0.4330162, 0, 0, 0, 1, 1,
0.7373277, -1.372172, 2.204698, 0, 0, 0, 1, 1,
0.7435743, 0.5623252, 1.271752, 0, 0, 0, 1, 1,
0.7475262, -0.2001787, 2.567146, 0, 0, 0, 1, 1,
0.7487766, -0.4565117, 1.691287, 0, 0, 0, 1, 1,
0.7496888, -1.124715, 1.12385, 0, 0, 0, 1, 1,
0.7512723, -0.6355945, 2.184448, 0, 0, 0, 1, 1,
0.7525226, 1.781355, 0.08739421, 1, 1, 1, 1, 1,
0.7556314, 0.1623679, 1.707776, 1, 1, 1, 1, 1,
0.7567525, -1.243973, 2.409433, 1, 1, 1, 1, 1,
0.7626604, -0.1030227, 2.002385, 1, 1, 1, 1, 1,
0.7841479, 1.490023, 1.067927, 1, 1, 1, 1, 1,
0.7841495, -0.09039012, 2.055616, 1, 1, 1, 1, 1,
0.7863551, 0.4118467, 0.6707704, 1, 1, 1, 1, 1,
0.7882069, 0.1112675, 0.1363836, 1, 1, 1, 1, 1,
0.7906848, 0.6620648, 3.107645, 1, 1, 1, 1, 1,
0.79238, 0.983988, 1.464952, 1, 1, 1, 1, 1,
0.7927625, 0.2133638, 2.828718, 1, 1, 1, 1, 1,
0.7934051, -0.1199811, 3.656314, 1, 1, 1, 1, 1,
0.7963918, -0.4821653, 2.679354, 1, 1, 1, 1, 1,
0.8021457, 1.794568, 0.4784251, 1, 1, 1, 1, 1,
0.8022645, -0.6510126, 0.8355243, 1, 1, 1, 1, 1,
0.810315, 0.4588763, -0.5507436, 0, 0, 1, 1, 1,
0.8120727, 0.1572258, 1.609161, 1, 0, 0, 1, 1,
0.8127882, 0.3936005, 0.8808261, 1, 0, 0, 1, 1,
0.8166745, 0.2958258, -1.562201, 1, 0, 0, 1, 1,
0.8184555, -0.4004055, 2.740199, 1, 0, 0, 1, 1,
0.8216412, 1.24209, 0.8585291, 1, 0, 0, 1, 1,
0.8275445, 0.2257907, 3.793728, 0, 0, 0, 1, 1,
0.8276463, 1.094224, -0.5106039, 0, 0, 0, 1, 1,
0.8290814, -1.008508, 4.821151, 0, 0, 0, 1, 1,
0.8368995, -1.826304, 1.718484, 0, 0, 0, 1, 1,
0.8374727, 0.2271659, 0.1092223, 0, 0, 0, 1, 1,
0.8404239, -1.476688, 3.543074, 0, 0, 0, 1, 1,
0.8449993, -0.06182928, 1.740441, 0, 0, 0, 1, 1,
0.8521013, -0.995029, 3.208733, 1, 1, 1, 1, 1,
0.8529328, 1.210031, -0.8051664, 1, 1, 1, 1, 1,
0.8576972, -0.3560767, 2.145342, 1, 1, 1, 1, 1,
0.8581139, -0.9094058, 1.962493, 1, 1, 1, 1, 1,
0.8626316, -0.07977981, 0.8479508, 1, 1, 1, 1, 1,
0.8652911, -1.601057, 3.032405, 1, 1, 1, 1, 1,
0.8711258, -0.1995871, 1.6843, 1, 1, 1, 1, 1,
0.8854031, 0.3023712, 1.980952, 1, 1, 1, 1, 1,
0.8919386, -0.1346427, 0.08967777, 1, 1, 1, 1, 1,
0.8952709, 0.08294798, 0.9478179, 1, 1, 1, 1, 1,
0.8979595, -1.204642, 0.5713107, 1, 1, 1, 1, 1,
0.8985851, 1.664143, 0.7485358, 1, 1, 1, 1, 1,
0.9012093, -0.4981861, 1.10816, 1, 1, 1, 1, 1,
0.9024295, 1.786441, 1.985023, 1, 1, 1, 1, 1,
0.9025162, -0.1168577, 1.137145, 1, 1, 1, 1, 1,
0.9049233, 0.9058453, -0.02241371, 0, 0, 1, 1, 1,
0.9060053, -0.3674, 1.738657, 1, 0, 0, 1, 1,
0.9111714, -0.4710696, 1.507292, 1, 0, 0, 1, 1,
0.9146745, -1.298076, 2.845994, 1, 0, 0, 1, 1,
0.9165202, 2.138612, 0.7560903, 1, 0, 0, 1, 1,
0.9198171, -1.153241, 2.581692, 1, 0, 0, 1, 1,
0.9305876, -0.3690826, 0.7852877, 0, 0, 0, 1, 1,
0.9317706, -0.2277395, -0.09344732, 0, 0, 0, 1, 1,
0.9323231, -1.597881, 2.830698, 0, 0, 0, 1, 1,
0.93488, 2.16572, 1.065291, 0, 0, 0, 1, 1,
0.9413654, 0.9137781, 0.7840773, 0, 0, 0, 1, 1,
0.9422943, 0.8596556, 0.7469483, 0, 0, 0, 1, 1,
0.9446694, -0.683068, 2.173238, 0, 0, 0, 1, 1,
0.9460202, -0.4053292, 1.853707, 1, 1, 1, 1, 1,
0.9581152, 0.1775869, 2.454995, 1, 1, 1, 1, 1,
0.9638337, 0.4200904, 0.6126927, 1, 1, 1, 1, 1,
0.9656763, 0.2699395, 1.820723, 1, 1, 1, 1, 1,
0.9667351, -1.779045, 2.925774, 1, 1, 1, 1, 1,
0.9686764, -0.3928187, 1.287174, 1, 1, 1, 1, 1,
0.9770955, -2.100166, 2.021627, 1, 1, 1, 1, 1,
0.9803125, -1.877028, 2.636519, 1, 1, 1, 1, 1,
0.9839922, 0.7196094, 0.6441184, 1, 1, 1, 1, 1,
0.9894766, 0.6132908, 1.2338, 1, 1, 1, 1, 1,
1.015826, 0.4991144, 1.172918, 1, 1, 1, 1, 1,
1.019254, -0.5986741, 1.069172, 1, 1, 1, 1, 1,
1.020352, 0.2147164, 2.845736, 1, 1, 1, 1, 1,
1.024002, 1.678076, 1.284966, 1, 1, 1, 1, 1,
1.028547, 0.7906228, 0.5523404, 1, 1, 1, 1, 1,
1.032279, 1.029477, 2.366612, 0, 0, 1, 1, 1,
1.038592, -2.595236, 4.418163, 1, 0, 0, 1, 1,
1.040647, 0.6441158, 0.1125234, 1, 0, 0, 1, 1,
1.047347, 0.788088, 3.357263, 1, 0, 0, 1, 1,
1.048516, -0.2577361, 1.885767, 1, 0, 0, 1, 1,
1.051482, 0.5203809, 3.789297, 1, 0, 0, 1, 1,
1.060736, -0.179808, 2.01121, 0, 0, 0, 1, 1,
1.078794, 0.315277, 2.380771, 0, 0, 0, 1, 1,
1.083205, -1.145515, 2.125286, 0, 0, 0, 1, 1,
1.087332, -0.9329176, 1.553257, 0, 0, 0, 1, 1,
1.087602, -1.122054, 3.213857, 0, 0, 0, 1, 1,
1.093728, -0.1990541, 2.975401, 0, 0, 0, 1, 1,
1.097352, 0.5707924, -0.7307498, 0, 0, 0, 1, 1,
1.0979, 0.4450313, -0.2537686, 1, 1, 1, 1, 1,
1.100646, 1.659987, 0.3486044, 1, 1, 1, 1, 1,
1.100919, 1.207901, -0.03047681, 1, 1, 1, 1, 1,
1.10891, -0.628958, 3.378613, 1, 1, 1, 1, 1,
1.123765, -0.6617014, 2.09015, 1, 1, 1, 1, 1,
1.127105, -1.008615, 2.446868, 1, 1, 1, 1, 1,
1.133695, 2.045167, 1.396378, 1, 1, 1, 1, 1,
1.14338, 0.1339076, 1.390886, 1, 1, 1, 1, 1,
1.158395, -0.7120737, -0.3970817, 1, 1, 1, 1, 1,
1.162831, -0.6991327, 1.903931, 1, 1, 1, 1, 1,
1.168705, -1.175715, 2.209128, 1, 1, 1, 1, 1,
1.170822, 0.2204427, 0.6500242, 1, 1, 1, 1, 1,
1.172712, -0.04784434, 1.618913, 1, 1, 1, 1, 1,
1.175494, 0.6500846, -0.3680449, 1, 1, 1, 1, 1,
1.183662, 0.1074391, 1.639855, 1, 1, 1, 1, 1,
1.200253, -0.5234396, 2.525078, 0, 0, 1, 1, 1,
1.210686, -0.223779, 1.097818, 1, 0, 0, 1, 1,
1.210748, -0.5477532, 3.112649, 1, 0, 0, 1, 1,
1.211838, -0.5363752, 1.410393, 1, 0, 0, 1, 1,
1.216437, -0.840727, 2.622282, 1, 0, 0, 1, 1,
1.219829, 0.3624041, -0.07867903, 1, 0, 0, 1, 1,
1.226944, -1.269289, 2.175475, 0, 0, 0, 1, 1,
1.234965, 0.9965891, 1.763433, 0, 0, 0, 1, 1,
1.242863, 0.6352232, 1.750364, 0, 0, 0, 1, 1,
1.245698, 0.6639603, 1.543562, 0, 0, 0, 1, 1,
1.2473, -1.113338, 3.511667, 0, 0, 0, 1, 1,
1.252052, -1.574633, 2.999329, 0, 0, 0, 1, 1,
1.267516, 0.3679889, 0.4165225, 0, 0, 0, 1, 1,
1.270684, -0.3201285, 1.192644, 1, 1, 1, 1, 1,
1.282351, 1.005834, -0.03188757, 1, 1, 1, 1, 1,
1.285584, -0.5603033, 1.640807, 1, 1, 1, 1, 1,
1.293358, 0.891291, 0.7532786, 1, 1, 1, 1, 1,
1.293676, 0.8502842, 0.15043, 1, 1, 1, 1, 1,
1.295915, -0.532521, 0.8750786, 1, 1, 1, 1, 1,
1.297896, -0.3495659, 1.872546, 1, 1, 1, 1, 1,
1.303019, 1.616852, 0.6719022, 1, 1, 1, 1, 1,
1.31801, 0.6937938, 2.282504, 1, 1, 1, 1, 1,
1.322542, -0.6542373, 2.245157, 1, 1, 1, 1, 1,
1.326172, -0.6529513, 1.128653, 1, 1, 1, 1, 1,
1.332282, 0.2677595, 1.886539, 1, 1, 1, 1, 1,
1.337866, -1.837521, 3.265466, 1, 1, 1, 1, 1,
1.366113, -1.04523, 3.474285, 1, 1, 1, 1, 1,
1.367959, 0.1418828, 2.437412, 1, 1, 1, 1, 1,
1.368045, -0.5786091, 0.9452648, 0, 0, 1, 1, 1,
1.382466, 0.8588701, -0.3616579, 1, 0, 0, 1, 1,
1.385688, 0.308403, 1.947704, 1, 0, 0, 1, 1,
1.387914, -0.3405657, 2.584946, 1, 0, 0, 1, 1,
1.38794, -0.04325572, 1.641947, 1, 0, 0, 1, 1,
1.390418, 0.2946821, 0.2846353, 1, 0, 0, 1, 1,
1.396166, 0.6698765, 1.392059, 0, 0, 0, 1, 1,
1.406333, -0.9172858, 4.078108, 0, 0, 0, 1, 1,
1.419095, 0.4788846, 0.05199245, 0, 0, 0, 1, 1,
1.419474, -1.934569, 3.486492, 0, 0, 0, 1, 1,
1.431127, -0.7609873, 3.137024, 0, 0, 0, 1, 1,
1.433951, 0.2389984, 1.696235, 0, 0, 0, 1, 1,
1.441452, -0.3626072, 3.424455, 0, 0, 0, 1, 1,
1.45448, 1.406441, 1.277764, 1, 1, 1, 1, 1,
1.474418, -0.8313021, 1.816158, 1, 1, 1, 1, 1,
1.47927, -0.2409556, 1.954748, 1, 1, 1, 1, 1,
1.48032, -0.04466197, 1.749388, 1, 1, 1, 1, 1,
1.487519, 0.3223458, 0.5757093, 1, 1, 1, 1, 1,
1.50324, -0.3570095, 3.157115, 1, 1, 1, 1, 1,
1.509476, -0.8639647, 1.12614, 1, 1, 1, 1, 1,
1.525532, -1.328351, 3.983878, 1, 1, 1, 1, 1,
1.532481, -0.7168986, 3.359684, 1, 1, 1, 1, 1,
1.554162, 0.2704748, 1.289499, 1, 1, 1, 1, 1,
1.561895, 0.1454574, 1.560432, 1, 1, 1, 1, 1,
1.563355, 0.5150629, 1.200613, 1, 1, 1, 1, 1,
1.574391, -0.003002897, 1.467529, 1, 1, 1, 1, 1,
1.578254, -2.108127, 1.847158, 1, 1, 1, 1, 1,
1.580519, -0.3721004, 2.383469, 1, 1, 1, 1, 1,
1.581548, -1.17261, 2.895376, 0, 0, 1, 1, 1,
1.595528, -1.784301, 3.974046, 1, 0, 0, 1, 1,
1.602549, 0.03619059, 1.970974, 1, 0, 0, 1, 1,
1.642539, 0.7511035, -0.2914441, 1, 0, 0, 1, 1,
1.653747, -0.200616, 1.747389, 1, 0, 0, 1, 1,
1.675117, -0.32981, 0.3575226, 1, 0, 0, 1, 1,
1.675594, -0.8826495, 1.524229, 0, 0, 0, 1, 1,
1.680307, 0.2554408, 1.915742, 0, 0, 0, 1, 1,
1.704715, -0.4652513, 2.185207, 0, 0, 0, 1, 1,
1.750263, -1.167796, 2.667907, 0, 0, 0, 1, 1,
1.764137, 1.003083, 0.5069521, 0, 0, 0, 1, 1,
1.767986, 0.2135969, 0.9630073, 0, 0, 0, 1, 1,
1.769349, 1.405163, 1.586032, 0, 0, 0, 1, 1,
1.769452, -1.477712, 3.797647, 1, 1, 1, 1, 1,
1.775431, 0.1579775, 1.595941, 1, 1, 1, 1, 1,
1.800986, -0.2069937, 1.777639, 1, 1, 1, 1, 1,
1.821555, 0.6699385, 1.047601, 1, 1, 1, 1, 1,
1.82447, -1.187589, 0.5674926, 1, 1, 1, 1, 1,
1.841088, 1.050611, 1.902275, 1, 1, 1, 1, 1,
1.848006, -0.8436095, 0.9697278, 1, 1, 1, 1, 1,
1.864346, 0.2505475, 1.034434, 1, 1, 1, 1, 1,
1.866314, 0.08808552, 0.9908968, 1, 1, 1, 1, 1,
1.889765, -1.097929, 0.3139219, 1, 1, 1, 1, 1,
1.902251, 0.5508735, 0.05780163, 1, 1, 1, 1, 1,
1.949092, 0.7005935, -0.5599604, 1, 1, 1, 1, 1,
1.983724, -2.349257, 2.379377, 1, 1, 1, 1, 1,
2.040354, -0.6711903, 1.97974, 1, 1, 1, 1, 1,
2.073005, 0.5684851, 1.409666, 1, 1, 1, 1, 1,
2.078521, -0.5388321, 2.01732, 0, 0, 1, 1, 1,
2.082938, 0.8720477, 2.445953, 1, 0, 0, 1, 1,
2.116142, 0.2434675, 1.616237, 1, 0, 0, 1, 1,
2.131912, -2.56302, 4.06277, 1, 0, 0, 1, 1,
2.153208, 1.814929, 0.9295676, 1, 0, 0, 1, 1,
2.180955, -0.419309, 0.8189934, 1, 0, 0, 1, 1,
2.205634, 3.267049, 1.96736, 0, 0, 0, 1, 1,
2.235561, -1.54089, 1.84426, 0, 0, 0, 1, 1,
2.293979, 0.4958316, 1.697774, 0, 0, 0, 1, 1,
2.363574, 0.6061797, -0.8309906, 0, 0, 0, 1, 1,
2.367705, 0.5997726, 1.752333, 0, 0, 0, 1, 1,
2.400725, 0.9302973, 3.813062, 0, 0, 0, 1, 1,
2.441165, -0.3624451, 1.942834, 0, 0, 0, 1, 1,
2.445158, -0.1229722, 4.555334, 1, 1, 1, 1, 1,
2.447336, -0.791128, 0.5062848, 1, 1, 1, 1, 1,
2.481156, -1.054288, 1.569565, 1, 1, 1, 1, 1,
2.487418, 0.914675, -1.09323, 1, 1, 1, 1, 1,
2.60702, -0.2423136, 2.605867, 1, 1, 1, 1, 1,
2.695088, -0.3950894, 2.659689, 1, 1, 1, 1, 1,
3.002729, -0.7579114, 1.409038, 1, 1, 1, 1, 1
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
var radius = 9.42524;
var distance = 33.10576;
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
mvMatrix.translate( 0.06589174, -0.1519532, -0.02844 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10576);
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
