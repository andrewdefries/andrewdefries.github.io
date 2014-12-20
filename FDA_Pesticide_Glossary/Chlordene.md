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
-2.849703, -0.325364, -2.304662, 1, 0, 0, 1,
-2.679061, -0.8420936, -3.162404, 1, 0.007843138, 0, 1,
-2.66715, 1.57585, 0.2269478, 1, 0.01176471, 0, 1,
-2.663064, -0.04444595, -1.567448, 1, 0.01960784, 0, 1,
-2.661994, 1.662381, -0.9188634, 1, 0.02352941, 0, 1,
-2.551771, -0.1839971, -2.198677, 1, 0.03137255, 0, 1,
-2.488812, -0.1054499, -2.957346, 1, 0.03529412, 0, 1,
-2.452897, -0.6309046, -0.625389, 1, 0.04313726, 0, 1,
-2.333951, 0.06831165, -1.004218, 1, 0.04705882, 0, 1,
-2.322168, -0.506808, -0.1851532, 1, 0.05490196, 0, 1,
-2.200969, 1.378646, -1.728711, 1, 0.05882353, 0, 1,
-2.190805, -0.1850941, -2.610291, 1, 0.06666667, 0, 1,
-2.175702, 1.001908, -1.785107, 1, 0.07058824, 0, 1,
-2.054647, -1.804253, -4.119429, 1, 0.07843138, 0, 1,
-2.033233, -0.8172453, -1.733962, 1, 0.08235294, 0, 1,
-2.028835, -0.2526257, -0.8467357, 1, 0.09019608, 0, 1,
-2.021989, 0.1975993, -1.536662, 1, 0.09411765, 0, 1,
-2.011808, 0.2842972, -0.3202084, 1, 0.1019608, 0, 1,
-1.989087, -0.5725036, -0.8654575, 1, 0.1098039, 0, 1,
-1.98589, 0.7232481, -1.996465, 1, 0.1137255, 0, 1,
-1.936554, -0.3879302, -2.448949, 1, 0.1215686, 0, 1,
-1.9291, 0.9696942, -2.258348, 1, 0.1254902, 0, 1,
-1.92555, -1.716058, -2.117351, 1, 0.1333333, 0, 1,
-1.91693, 0.8319649, -0.2579342, 1, 0.1372549, 0, 1,
-1.91003, -1.375075, -2.062051, 1, 0.145098, 0, 1,
-1.893732, 1.07895, 2.468846, 1, 0.1490196, 0, 1,
-1.856795, -0.7848516, -1.500245, 1, 0.1568628, 0, 1,
-1.831032, -0.08009617, -2.334311, 1, 0.1607843, 0, 1,
-1.817018, 0.05469609, -1.995142, 1, 0.1686275, 0, 1,
-1.811351, -1.580457, -0.9539891, 1, 0.172549, 0, 1,
-1.791295, 0.478231, -0.6533366, 1, 0.1803922, 0, 1,
-1.771411, 0.3699592, -2.191388, 1, 0.1843137, 0, 1,
-1.744757, -0.7350978, -1.851927, 1, 0.1921569, 0, 1,
-1.743903, -0.8355974, -0.9069593, 1, 0.1960784, 0, 1,
-1.733453, -1.864306, -2.012544, 1, 0.2039216, 0, 1,
-1.729438, -0.217588, -2.107552, 1, 0.2117647, 0, 1,
-1.729148, 0.5376651, -2.875049, 1, 0.2156863, 0, 1,
-1.714254, -1.628848, -3.598125, 1, 0.2235294, 0, 1,
-1.65739, 0.8858939, 0.6936655, 1, 0.227451, 0, 1,
-1.653497, 0.8381604, -1.768781, 1, 0.2352941, 0, 1,
-1.648445, -0.8239545, -0.3685264, 1, 0.2392157, 0, 1,
-1.631098, 0.411607, -2.52323, 1, 0.2470588, 0, 1,
-1.594943, -1.155732, -2.174518, 1, 0.2509804, 0, 1,
-1.589471, 1.015269, -1.070455, 1, 0.2588235, 0, 1,
-1.587042, -0.5045635, -1.452728, 1, 0.2627451, 0, 1,
-1.584795, -2.221998, -3.704233, 1, 0.2705882, 0, 1,
-1.583324, 2.383059, 0.06698302, 1, 0.2745098, 0, 1,
-1.570611, 0.1055317, 0.3069899, 1, 0.282353, 0, 1,
-1.567223, 0.3620186, -1.862029, 1, 0.2862745, 0, 1,
-1.56183, 0.3448413, -2.395445, 1, 0.2941177, 0, 1,
-1.554725, 0.8611972, -1.26619, 1, 0.3019608, 0, 1,
-1.547065, -0.9797136, -0.1109336, 1, 0.3058824, 0, 1,
-1.532812, 0.5256783, -0.2616785, 1, 0.3137255, 0, 1,
-1.531403, 0.2200123, -1.218102, 1, 0.3176471, 0, 1,
-1.519331, 0.9925277, -0.155385, 1, 0.3254902, 0, 1,
-1.505056, 0.5916244, -0.8906944, 1, 0.3294118, 0, 1,
-1.502685, 0.7818214, -1.166234, 1, 0.3372549, 0, 1,
-1.487502, -1.10251, -0.9692704, 1, 0.3411765, 0, 1,
-1.481878, -0.08176372, -3.070493, 1, 0.3490196, 0, 1,
-1.472357, -1.546886, -2.38243, 1, 0.3529412, 0, 1,
-1.465212, 1.560534, -0.9345275, 1, 0.3607843, 0, 1,
-1.452926, -1.79647, -3.663805, 1, 0.3647059, 0, 1,
-1.440259, 0.33151, -0.4828939, 1, 0.372549, 0, 1,
-1.435236, -0.5929697, -0.6668625, 1, 0.3764706, 0, 1,
-1.428584, 1.512783, -1.941711, 1, 0.3843137, 0, 1,
-1.417586, -0.6327636, -2.413918, 1, 0.3882353, 0, 1,
-1.417488, -1.015445, -3.836532, 1, 0.3960784, 0, 1,
-1.409488, -0.6194555, -2.109381, 1, 0.4039216, 0, 1,
-1.404454, -0.4015505, -2.621521, 1, 0.4078431, 0, 1,
-1.402613, 1.111869, -0.03582716, 1, 0.4156863, 0, 1,
-1.400228, 1.037995, -1.442082, 1, 0.4196078, 0, 1,
-1.399305, -1.976316, -2.164766, 1, 0.427451, 0, 1,
-1.382909, -0.8377119, -2.466125, 1, 0.4313726, 0, 1,
-1.356491, -0.9814197, -0.4540093, 1, 0.4392157, 0, 1,
-1.354982, 1.810594, -0.3193609, 1, 0.4431373, 0, 1,
-1.348962, 0.9113401, -1.660217, 1, 0.4509804, 0, 1,
-1.347116, -2.081413, -2.259168, 1, 0.454902, 0, 1,
-1.346898, -0.1189374, -1.4371, 1, 0.4627451, 0, 1,
-1.345076, -0.283205, -0.7597404, 1, 0.4666667, 0, 1,
-1.340705, -0.04986713, -0.334119, 1, 0.4745098, 0, 1,
-1.334921, 2.368186, -0.3158063, 1, 0.4784314, 0, 1,
-1.324615, 1.885573, -2.269896, 1, 0.4862745, 0, 1,
-1.320727, -1.350888, -2.534107, 1, 0.4901961, 0, 1,
-1.317564, -0.05386545, -1.363109, 1, 0.4980392, 0, 1,
-1.31448, -1.290197, -2.721051, 1, 0.5058824, 0, 1,
-1.312637, 0.01605998, -1.229593, 1, 0.509804, 0, 1,
-1.310572, 0.929332, 0.1277489, 1, 0.5176471, 0, 1,
-1.30307, -0.7768506, -2.529733, 1, 0.5215687, 0, 1,
-1.297978, -0.07153723, -3.627547, 1, 0.5294118, 0, 1,
-1.290732, -0.07074568, -1.03343, 1, 0.5333334, 0, 1,
-1.29058, 1.245368, -0.9879627, 1, 0.5411765, 0, 1,
-1.281851, -1.655152, -1.823156, 1, 0.5450981, 0, 1,
-1.277111, -0.9370694, -2.928711, 1, 0.5529412, 0, 1,
-1.273688, -0.1589013, -1.658614, 1, 0.5568628, 0, 1,
-1.26982, 0.4395495, -0.1013831, 1, 0.5647059, 0, 1,
-1.254482, -0.01158112, -0.2554687, 1, 0.5686275, 0, 1,
-1.252169, -0.3921627, -2.795932, 1, 0.5764706, 0, 1,
-1.251664, -0.1489569, -2.429842, 1, 0.5803922, 0, 1,
-1.251183, -0.7104546, -1.014486, 1, 0.5882353, 0, 1,
-1.248498, -0.5091825, -3.59092, 1, 0.5921569, 0, 1,
-1.241251, 0.4671701, -0.1317679, 1, 0.6, 0, 1,
-1.24096, 1.010152, -1.42144, 1, 0.6078432, 0, 1,
-1.238157, -0.1475963, -1.244477, 1, 0.6117647, 0, 1,
-1.231298, 0.58301, -2.531687, 1, 0.6196079, 0, 1,
-1.224983, -1.224329, -1.677754, 1, 0.6235294, 0, 1,
-1.223095, -1.424229, -2.412143, 1, 0.6313726, 0, 1,
-1.214865, 0.372068, -0.7849965, 1, 0.6352941, 0, 1,
-1.213235, 0.1751006, -0.9441275, 1, 0.6431373, 0, 1,
-1.211852, -0.709029, -3.516488, 1, 0.6470588, 0, 1,
-1.205443, 0.9260909, -0.9992832, 1, 0.654902, 0, 1,
-1.201467, -0.004429125, -0.5901608, 1, 0.6588235, 0, 1,
-1.195831, -2.064955, -2.730732, 1, 0.6666667, 0, 1,
-1.191002, -0.1281102, -1.165345, 1, 0.6705883, 0, 1,
-1.171676, 2.755611, -0.608676, 1, 0.6784314, 0, 1,
-1.16735, 0.7295488, -3.000063, 1, 0.682353, 0, 1,
-1.164608, 1.386801, -0.08971714, 1, 0.6901961, 0, 1,
-1.153866, -0.7568492, -3.793932, 1, 0.6941177, 0, 1,
-1.14668, -0.05454749, -0.8697246, 1, 0.7019608, 0, 1,
-1.144562, -2.036797, -4.56129, 1, 0.7098039, 0, 1,
-1.139196, -1.5153, -5.185253, 1, 0.7137255, 0, 1,
-1.138537, -2.067899, -4.068637, 1, 0.7215686, 0, 1,
-1.134291, -0.5938909, -1.935494, 1, 0.7254902, 0, 1,
-1.131755, 0.9787378, -1.427121, 1, 0.7333333, 0, 1,
-1.130951, -0.2473024, -1.765401, 1, 0.7372549, 0, 1,
-1.129145, 0.303471, -2.351925, 1, 0.7450981, 0, 1,
-1.118163, 0.5192789, -1.363251, 1, 0.7490196, 0, 1,
-1.11138, 0.1275536, -2.842408, 1, 0.7568628, 0, 1,
-1.109217, -1.263913, -1.848252, 1, 0.7607843, 0, 1,
-1.10908, -1.054271, -3.76395, 1, 0.7686275, 0, 1,
-1.099699, 0.2066053, 0.09610019, 1, 0.772549, 0, 1,
-1.089704, 0.4609436, -0.5227388, 1, 0.7803922, 0, 1,
-1.08634, 0.07208973, -0.03256059, 1, 0.7843137, 0, 1,
-1.084321, 0.1050467, -3.367613, 1, 0.7921569, 0, 1,
-1.070095, -0.6806661, -1.066579, 1, 0.7960784, 0, 1,
-1.069518, 0.2050238, -3.406559, 1, 0.8039216, 0, 1,
-1.068013, 2.278768, -0.6148779, 1, 0.8117647, 0, 1,
-1.067022, 0.1954914, -1.172868, 1, 0.8156863, 0, 1,
-1.062844, -0.1892069, -0.1438869, 1, 0.8235294, 0, 1,
-1.05686, -0.6508071, -2.070894, 1, 0.827451, 0, 1,
-1.048144, 2.860039, -0.5615435, 1, 0.8352941, 0, 1,
-1.046, 0.4107795, -1.865572, 1, 0.8392157, 0, 1,
-1.043096, 0.2961041, -1.230862, 1, 0.8470588, 0, 1,
-1.035288, 0.6095425, -2.417133, 1, 0.8509804, 0, 1,
-1.034729, -0.4158694, -1.753183, 1, 0.8588235, 0, 1,
-1.03173, 0.2494226, -1.182887, 1, 0.8627451, 0, 1,
-1.022855, 0.3228037, 0.4987822, 1, 0.8705882, 0, 1,
-1.019427, 0.03636023, -1.936733, 1, 0.8745098, 0, 1,
-1.018912, -0.1071973, -0.3402055, 1, 0.8823529, 0, 1,
-1.018146, 1.021551, -1.719764, 1, 0.8862745, 0, 1,
-1.017693, 0.7901803, 0.04323779, 1, 0.8941177, 0, 1,
-1.017495, 0.6084898, 0.4806804, 1, 0.8980392, 0, 1,
-1.015623, 1.894946, -0.09570815, 1, 0.9058824, 0, 1,
-1.014861, 0.3414592, -0.7072117, 1, 0.9137255, 0, 1,
-1.014795, 1.195152, 1.618914, 1, 0.9176471, 0, 1,
-1.009373, 0.03338941, -2.735967, 1, 0.9254902, 0, 1,
-1.001619, 1.12538, -1.309425, 1, 0.9294118, 0, 1,
-1.000651, 1.401715, -1.00648, 1, 0.9372549, 0, 1,
-0.9985512, 1.215637, -1.35945, 1, 0.9411765, 0, 1,
-0.9974352, 0.4733158, -2.104904, 1, 0.9490196, 0, 1,
-0.9953322, 0.7285406, -0.009507632, 1, 0.9529412, 0, 1,
-0.9942066, -0.1004332, -0.6438437, 1, 0.9607843, 0, 1,
-0.9941603, -0.4083638, -3.107255, 1, 0.9647059, 0, 1,
-0.99396, 1.39928, -1.789383, 1, 0.972549, 0, 1,
-0.9939322, 0.4511099, -1.773201, 1, 0.9764706, 0, 1,
-0.9906198, -1.580914, -2.858293, 1, 0.9843137, 0, 1,
-0.9881123, 0.9097474, -1.756796, 1, 0.9882353, 0, 1,
-0.9880931, -0.7089283, -2.616955, 1, 0.9960784, 0, 1,
-0.987288, 0.3549441, -1.558219, 0.9960784, 1, 0, 1,
-0.9868533, -0.4449107, -0.8393774, 0.9921569, 1, 0, 1,
-0.9867815, 0.3806909, -2.430327, 0.9843137, 1, 0, 1,
-0.9829822, 1.701733, 0.4111874, 0.9803922, 1, 0, 1,
-0.9728457, 0.1194335, -1.638574, 0.972549, 1, 0, 1,
-0.971394, 0.8668702, -1.457102, 0.9686275, 1, 0, 1,
-0.9677057, -0.216563, -2.361473, 0.9607843, 1, 0, 1,
-0.9588189, 0.3353619, -2.714988, 0.9568627, 1, 0, 1,
-0.9527897, 0.1976206, -1.627535, 0.9490196, 1, 0, 1,
-0.9522641, 0.8067881, -2.37036, 0.945098, 1, 0, 1,
-0.9468274, -0.4269369, -1.696432, 0.9372549, 1, 0, 1,
-0.9325617, 0.1265931, -2.292596, 0.9333333, 1, 0, 1,
-0.9323618, 1.482443, 0.8060702, 0.9254902, 1, 0, 1,
-0.9316629, 0.2374606, -3.295305, 0.9215686, 1, 0, 1,
-0.926446, 0.04491298, -0.7834676, 0.9137255, 1, 0, 1,
-0.9263409, 0.2504562, -0.4464762, 0.9098039, 1, 0, 1,
-0.925531, 1.054502, -0.9977779, 0.9019608, 1, 0, 1,
-0.9210236, -0.3462652, -1.248214, 0.8941177, 1, 0, 1,
-0.9130481, 0.5361124, -1.252719, 0.8901961, 1, 0, 1,
-0.9092557, 0.9536308, -0.1126061, 0.8823529, 1, 0, 1,
-0.9057515, 0.7330306, -1.469962, 0.8784314, 1, 0, 1,
-0.8945172, 0.3423581, -1.952088, 0.8705882, 1, 0, 1,
-0.8821197, 0.04315575, -1.015583, 0.8666667, 1, 0, 1,
-0.8736506, 2.23719, -1.331555, 0.8588235, 1, 0, 1,
-0.8708863, -1.309188, -1.869387, 0.854902, 1, 0, 1,
-0.8694924, -2.017108, -2.781659, 0.8470588, 1, 0, 1,
-0.8663498, 1.375303, -0.9309552, 0.8431373, 1, 0, 1,
-0.8647136, 0.6983336, -0.893259, 0.8352941, 1, 0, 1,
-0.8543534, 1.138708, -1.985528, 0.8313726, 1, 0, 1,
-0.8539392, -0.3771492, -1.728643, 0.8235294, 1, 0, 1,
-0.850586, -0.6372025, -3.720847, 0.8196079, 1, 0, 1,
-0.8483406, 0.739611, 0.7759287, 0.8117647, 1, 0, 1,
-0.8434014, 0.2135011, -0.8474592, 0.8078431, 1, 0, 1,
-0.8424309, -0.7284692, -0.7032256, 0.8, 1, 0, 1,
-0.8386586, 0.1022216, -0.8503951, 0.7921569, 1, 0, 1,
-0.830187, 0.2808851, -2.825337, 0.7882353, 1, 0, 1,
-0.8278096, 0.7263423, -2.317585, 0.7803922, 1, 0, 1,
-0.8270916, -0.6108978, -1.863925, 0.7764706, 1, 0, 1,
-0.8268494, -0.2617655, -1.685397, 0.7686275, 1, 0, 1,
-0.8262649, -2.00032, -3.750394, 0.7647059, 1, 0, 1,
-0.8226115, 1.482405, 1.108218, 0.7568628, 1, 0, 1,
-0.8096673, -0.106684, -1.083924, 0.7529412, 1, 0, 1,
-0.8085188, 0.6297249, -1.468592, 0.7450981, 1, 0, 1,
-0.8018615, 0.3640522, -0.3618944, 0.7411765, 1, 0, 1,
-0.7979307, -0.3883468, -2.332973, 0.7333333, 1, 0, 1,
-0.7928061, 0.6255423, -0.517153, 0.7294118, 1, 0, 1,
-0.7914457, -2.38968, -3.32322, 0.7215686, 1, 0, 1,
-0.7883816, 1.158859, -0.392388, 0.7176471, 1, 0, 1,
-0.7851204, 0.8294545, 0.00365527, 0.7098039, 1, 0, 1,
-0.7833924, 0.4722595, -1.870609, 0.7058824, 1, 0, 1,
-0.781932, 2.006461, -0.08547502, 0.6980392, 1, 0, 1,
-0.7790175, 0.7005281, -1.876177, 0.6901961, 1, 0, 1,
-0.7772132, 0.8899925, -0.8712029, 0.6862745, 1, 0, 1,
-0.7704032, 0.3961492, -2.125451, 0.6784314, 1, 0, 1,
-0.7567423, 0.101219, -3.186659, 0.6745098, 1, 0, 1,
-0.7562207, -1.145069, -1.94646, 0.6666667, 1, 0, 1,
-0.7462837, 0.8212954, -0.4121507, 0.6627451, 1, 0, 1,
-0.7412432, -0.3149562, -1.090471, 0.654902, 1, 0, 1,
-0.7354591, -0.5010806, -0.9692835, 0.6509804, 1, 0, 1,
-0.7352501, 0.3828411, -1.596087, 0.6431373, 1, 0, 1,
-0.7326616, -0.8224083, -2.744432, 0.6392157, 1, 0, 1,
-0.7307674, 0.77311, -3.396833, 0.6313726, 1, 0, 1,
-0.7274863, 1.420051, -0.4130731, 0.627451, 1, 0, 1,
-0.7164235, 1.266966, -0.02771562, 0.6196079, 1, 0, 1,
-0.7164127, 0.590588, -0.1443383, 0.6156863, 1, 0, 1,
-0.7160452, -1.476582, -2.827796, 0.6078432, 1, 0, 1,
-0.7142157, 1.533844, -0.4351591, 0.6039216, 1, 0, 1,
-0.7116036, -0.0217693, -1.592917, 0.5960785, 1, 0, 1,
-0.7104558, 0.259977, 0.3363695, 0.5882353, 1, 0, 1,
-0.7018439, -1.752867, -2.982757, 0.5843138, 1, 0, 1,
-0.6987769, -0.390386, -0.5547339, 0.5764706, 1, 0, 1,
-0.6980779, 0.0758279, -1.4083, 0.572549, 1, 0, 1,
-0.6963602, 0.08087985, -1.238047, 0.5647059, 1, 0, 1,
-0.6931657, -0.7630373, -2.326625, 0.5607843, 1, 0, 1,
-0.6907733, 0.5388077, -1.612437, 0.5529412, 1, 0, 1,
-0.6879267, 0.8217723, -0.4125708, 0.5490196, 1, 0, 1,
-0.6835498, -1.172797, -2.080935, 0.5411765, 1, 0, 1,
-0.6786858, 0.7083619, -0.7657793, 0.5372549, 1, 0, 1,
-0.6785969, 0.3394462, 0.8627472, 0.5294118, 1, 0, 1,
-0.6698917, 0.7838897, 1.597631, 0.5254902, 1, 0, 1,
-0.6691235, 0.6670304, -0.1957058, 0.5176471, 1, 0, 1,
-0.6688439, -1.581052, -1.387365, 0.5137255, 1, 0, 1,
-0.6662492, 0.9551386, 1.107509, 0.5058824, 1, 0, 1,
-0.6662071, -1.993562, -3.591066, 0.5019608, 1, 0, 1,
-0.6646275, -0.5334625, -2.475637, 0.4941176, 1, 0, 1,
-0.6634553, 0.535594, -0.4220164, 0.4862745, 1, 0, 1,
-0.6610775, -1.011511, -2.039786, 0.4823529, 1, 0, 1,
-0.655849, -0.003854244, -1.795033, 0.4745098, 1, 0, 1,
-0.6439163, -0.8564512, -2.638231, 0.4705882, 1, 0, 1,
-0.6437388, 1.300109, -0.452124, 0.4627451, 1, 0, 1,
-0.6399142, -0.900831, -4.309318, 0.4588235, 1, 0, 1,
-0.6348825, -0.1813827, -3.346605, 0.4509804, 1, 0, 1,
-0.6327843, 0.5486293, -0.8371505, 0.4470588, 1, 0, 1,
-0.6297525, -1.900984, -3.454988, 0.4392157, 1, 0, 1,
-0.6244383, -0.1228526, -0.8647522, 0.4352941, 1, 0, 1,
-0.6238018, 0.5128281, 0.4309694, 0.427451, 1, 0, 1,
-0.6216635, -1.210603, -3.855394, 0.4235294, 1, 0, 1,
-0.6184009, 1.417254, 0.4883286, 0.4156863, 1, 0, 1,
-0.6147574, 2.114577, -1.002995, 0.4117647, 1, 0, 1,
-0.6037951, -0.8106595, -2.390577, 0.4039216, 1, 0, 1,
-0.5973272, -0.7788547, -0.09674653, 0.3960784, 1, 0, 1,
-0.5943252, -0.9912226, -1.334746, 0.3921569, 1, 0, 1,
-0.5925091, 0.07811312, -1.764146, 0.3843137, 1, 0, 1,
-0.5871507, -0.3083892, -1.145126, 0.3803922, 1, 0, 1,
-0.5869666, 0.2942286, -1.351843, 0.372549, 1, 0, 1,
-0.5786475, -0.9329475, -2.546777, 0.3686275, 1, 0, 1,
-0.5730653, 1.224338, -0.004874617, 0.3607843, 1, 0, 1,
-0.5716419, 1.463868, 0.2936303, 0.3568628, 1, 0, 1,
-0.5695228, 1.481085, 0.1855659, 0.3490196, 1, 0, 1,
-0.5685633, 0.271344, -0.2374737, 0.345098, 1, 0, 1,
-0.5664079, -0.9498317, -3.132624, 0.3372549, 1, 0, 1,
-0.5658136, 0.4988852, -0.3307482, 0.3333333, 1, 0, 1,
-0.5648553, 0.6067427, 0.6710094, 0.3254902, 1, 0, 1,
-0.56149, 0.5042444, -1.044338, 0.3215686, 1, 0, 1,
-0.5579102, -1.015146, -2.309495, 0.3137255, 1, 0, 1,
-0.5573519, -1.104011, -3.897597, 0.3098039, 1, 0, 1,
-0.5515303, 0.5630832, -0.0519431, 0.3019608, 1, 0, 1,
-0.5486885, -1.238594, -3.167866, 0.2941177, 1, 0, 1,
-0.5480133, -0.7780028, -2.719075, 0.2901961, 1, 0, 1,
-0.5440043, -1.463909, -3.909967, 0.282353, 1, 0, 1,
-0.5396683, -0.1029813, -0.153535, 0.2784314, 1, 0, 1,
-0.5380138, 1.306012, -0.7284302, 0.2705882, 1, 0, 1,
-0.5305026, -0.3364632, -1.119939, 0.2666667, 1, 0, 1,
-0.5301082, 0.3798169, -0.869954, 0.2588235, 1, 0, 1,
-0.5239269, 0.2580397, -2.566727, 0.254902, 1, 0, 1,
-0.5220089, -0.3718967, -1.239498, 0.2470588, 1, 0, 1,
-0.5136307, -0.04288211, -2.060572, 0.2431373, 1, 0, 1,
-0.5129045, 0.1838299, -3.292444, 0.2352941, 1, 0, 1,
-0.5101904, -0.4451407, -1.160435, 0.2313726, 1, 0, 1,
-0.4945323, -1.519385, -1.218812, 0.2235294, 1, 0, 1,
-0.4932051, -0.02313732, -1.792415, 0.2196078, 1, 0, 1,
-0.4895329, -1.033621, -3.142607, 0.2117647, 1, 0, 1,
-0.4833338, -0.5735386, -2.27768, 0.2078431, 1, 0, 1,
-0.4817504, -0.07544892, -2.765306, 0.2, 1, 0, 1,
-0.4806249, 1.667158, -0.5811932, 0.1921569, 1, 0, 1,
-0.4763184, -1.126989, -4.027628, 0.1882353, 1, 0, 1,
-0.4759248, -0.5496455, -1.141323, 0.1803922, 1, 0, 1,
-0.4749976, -0.2545272, -0.817539, 0.1764706, 1, 0, 1,
-0.471813, -0.5599672, -2.59398, 0.1686275, 1, 0, 1,
-0.4717636, -0.06355055, -0.8208699, 0.1647059, 1, 0, 1,
-0.4716256, -0.562112, -2.419312, 0.1568628, 1, 0, 1,
-0.4691387, -0.7348005, 0.0179315, 0.1529412, 1, 0, 1,
-0.4678251, 2.773988, -0.2644568, 0.145098, 1, 0, 1,
-0.464505, 2.193833, -1.287257, 0.1411765, 1, 0, 1,
-0.4533165, 1.240913, -0.766152, 0.1333333, 1, 0, 1,
-0.4523512, -0.4802242, -2.41397, 0.1294118, 1, 0, 1,
-0.4507284, 2.204934, -1.082361, 0.1215686, 1, 0, 1,
-0.4485126, 0.00188188, -2.734047, 0.1176471, 1, 0, 1,
-0.4476063, 0.05605426, -1.076427, 0.1098039, 1, 0, 1,
-0.4470823, 0.08745568, -2.272376, 0.1058824, 1, 0, 1,
-0.4418997, -1.695378, -2.566702, 0.09803922, 1, 0, 1,
-0.4411021, -0.4011466, -1.914204, 0.09019608, 1, 0, 1,
-0.4385562, -1.908469, -5.162288, 0.08627451, 1, 0, 1,
-0.4372751, -0.112673, -3.261005, 0.07843138, 1, 0, 1,
-0.4319951, 1.333297, 0.4376145, 0.07450981, 1, 0, 1,
-0.4276574, 2.142806, -0.1619181, 0.06666667, 1, 0, 1,
-0.4271577, 0.6213535, 0.6926482, 0.0627451, 1, 0, 1,
-0.4251471, -0.01154848, -2.323224, 0.05490196, 1, 0, 1,
-0.4181119, 0.7817918, 0.9223644, 0.05098039, 1, 0, 1,
-0.4142113, 0.9516991, -1.819565, 0.04313726, 1, 0, 1,
-0.4114632, 0.4368259, -2.138004, 0.03921569, 1, 0, 1,
-0.4110524, 1.241516, -0.4723525, 0.03137255, 1, 0, 1,
-0.4008296, -0.4855147, -2.657987, 0.02745098, 1, 0, 1,
-0.3993983, 0.07755303, -1.093212, 0.01960784, 1, 0, 1,
-0.3989943, -0.2277607, -2.920213, 0.01568628, 1, 0, 1,
-0.3989303, 1.154099, 0.5322652, 0.007843138, 1, 0, 1,
-0.3970946, 0.07284839, -2.829495, 0.003921569, 1, 0, 1,
-0.3970778, 0.1861529, -0.7720814, 0, 1, 0.003921569, 1,
-0.3967053, 1.839494, -1.092428, 0, 1, 0.01176471, 1,
-0.3958314, 0.494494, -0.4648574, 0, 1, 0.01568628, 1,
-0.3914356, 0.4183965, -1.359302, 0, 1, 0.02352941, 1,
-0.3881238, -0.8049018, -3.121938, 0, 1, 0.02745098, 1,
-0.3875777, 0.3192489, -1.528986, 0, 1, 0.03529412, 1,
-0.3856568, 0.3371373, 0.5609426, 0, 1, 0.03921569, 1,
-0.3831457, -1.259879, -1.909196, 0, 1, 0.04705882, 1,
-0.3818925, -0.9278648, -3.74097, 0, 1, 0.05098039, 1,
-0.3796163, 0.4312587, 0.6075484, 0, 1, 0.05882353, 1,
-0.3776611, -2.177325, -3.251778, 0, 1, 0.0627451, 1,
-0.375719, 1.476725, -0.2189559, 0, 1, 0.07058824, 1,
-0.3750309, -0.8633926, -4.023468, 0, 1, 0.07450981, 1,
-0.3737375, 1.063135, -1.775602, 0, 1, 0.08235294, 1,
-0.3714066, -1.374622, -4.205796, 0, 1, 0.08627451, 1,
-0.3713376, -0.9229246, -2.81829, 0, 1, 0.09411765, 1,
-0.3692823, -0.4792114, -3.179925, 0, 1, 0.1019608, 1,
-0.3679421, -0.9505348, -3.737652, 0, 1, 0.1058824, 1,
-0.3660988, 0.5156918, 0.0482562, 0, 1, 0.1137255, 1,
-0.3634434, 0.4272737, -0.1938951, 0, 1, 0.1176471, 1,
-0.3606386, -1.293145, -2.52373, 0, 1, 0.1254902, 1,
-0.3595055, -0.1136898, -1.905883, 0, 1, 0.1294118, 1,
-0.3586727, -0.5961498, -3.36065, 0, 1, 0.1372549, 1,
-0.3529332, 0.6101411, 1.152523, 0, 1, 0.1411765, 1,
-0.3518573, 1.342934, 1.219269, 0, 1, 0.1490196, 1,
-0.3494354, 0.7353436, 1.002741, 0, 1, 0.1529412, 1,
-0.3490074, -0.2279518, -0.5037755, 0, 1, 0.1607843, 1,
-0.3473305, -0.2197163, -2.531679, 0, 1, 0.1647059, 1,
-0.3410826, -0.3828737, -2.437657, 0, 1, 0.172549, 1,
-0.340483, -0.9774804, -3.015417, 0, 1, 0.1764706, 1,
-0.340022, -0.3518499, -4.4, 0, 1, 0.1843137, 1,
-0.3391624, -0.4407837, -4.323181, 0, 1, 0.1882353, 1,
-0.3359601, -0.3582892, -2.440635, 0, 1, 0.1960784, 1,
-0.3310345, -0.4090062, -2.297228, 0, 1, 0.2039216, 1,
-0.3308781, 1.021619, -0.6464126, 0, 1, 0.2078431, 1,
-0.3304194, 0.09656911, -0.9779296, 0, 1, 0.2156863, 1,
-0.3284107, 1.660224, 0.7388784, 0, 1, 0.2196078, 1,
-0.3246401, 0.7346317, -0.1395248, 0, 1, 0.227451, 1,
-0.3242624, 0.7455676, -0.2492673, 0, 1, 0.2313726, 1,
-0.3240896, -0.4315444, -1.969231, 0, 1, 0.2392157, 1,
-0.3214211, 1.255639, -0.8280334, 0, 1, 0.2431373, 1,
-0.3176554, -1.167147, -4.984663, 0, 1, 0.2509804, 1,
-0.3172388, 1.707162, -0.8217839, 0, 1, 0.254902, 1,
-0.3112427, 0.001403596, -1.905817, 0, 1, 0.2627451, 1,
-0.3065414, 0.1698351, -1.767379, 0, 1, 0.2666667, 1,
-0.3061528, -1.29395, -2.496123, 0, 1, 0.2745098, 1,
-0.3041571, -0.1454753, -1.314605, 0, 1, 0.2784314, 1,
-0.2990444, -0.7662439, -2.051168, 0, 1, 0.2862745, 1,
-0.2988511, -0.9085202, -0.763431, 0, 1, 0.2901961, 1,
-0.2928987, 1.376477, 1.45894, 0, 1, 0.2980392, 1,
-0.2921622, 0.7598144, 1.160242, 0, 1, 0.3058824, 1,
-0.2887376, 0.4817687, -0.7652082, 0, 1, 0.3098039, 1,
-0.287809, 1.054759, -0.5613082, 0, 1, 0.3176471, 1,
-0.2851859, 0.6528563, -0.1639704, 0, 1, 0.3215686, 1,
-0.2818519, -1.137894, -4.015359, 0, 1, 0.3294118, 1,
-0.2766693, 1.195289, -0.7327887, 0, 1, 0.3333333, 1,
-0.2752604, 1.046072, -0.8076441, 0, 1, 0.3411765, 1,
-0.270915, -1.229638, -2.500919, 0, 1, 0.345098, 1,
-0.2639972, 0.1440128, 0.645853, 0, 1, 0.3529412, 1,
-0.2630025, -1.535982, -1.842041, 0, 1, 0.3568628, 1,
-0.2624485, 0.648659, -1.848229, 0, 1, 0.3647059, 1,
-0.2539292, -0.4586584, -2.780733, 0, 1, 0.3686275, 1,
-0.2523535, -0.6209576, -3.48544, 0, 1, 0.3764706, 1,
-0.2484675, 0.753256, -0.1176485, 0, 1, 0.3803922, 1,
-0.2466563, 0.8865422, 0.1098466, 0, 1, 0.3882353, 1,
-0.2465248, 1.351176, 0.1515024, 0, 1, 0.3921569, 1,
-0.2452052, -0.8900653, -1.56663, 0, 1, 0.4, 1,
-0.245165, -0.2917653, -1.052023, 0, 1, 0.4078431, 1,
-0.2429172, -1.147751, -1.433263, 0, 1, 0.4117647, 1,
-0.2416085, -0.7618666, -3.521456, 0, 1, 0.4196078, 1,
-0.2382196, -0.8856961, -4.23261, 0, 1, 0.4235294, 1,
-0.2376518, -0.2081661, -1.56503, 0, 1, 0.4313726, 1,
-0.2271719, -0.3113846, -3.384036, 0, 1, 0.4352941, 1,
-0.2253011, -0.2024769, -3.48403, 0, 1, 0.4431373, 1,
-0.2238969, -0.2736774, -1.903711, 0, 1, 0.4470588, 1,
-0.2198008, 0.04841487, -1.066241, 0, 1, 0.454902, 1,
-0.2176738, 1.140636, 0.04139247, 0, 1, 0.4588235, 1,
-0.2103516, -1.318683, -3.669024, 0, 1, 0.4666667, 1,
-0.2056219, -0.5043325, -1.305667, 0, 1, 0.4705882, 1,
-0.2041553, 0.1011735, -1.485967, 0, 1, 0.4784314, 1,
-0.2024531, -0.5350623, -1.750247, 0, 1, 0.4823529, 1,
-0.2017653, 0.8413045, 0.5678981, 0, 1, 0.4901961, 1,
-0.1984773, -2.075123, -3.228866, 0, 1, 0.4941176, 1,
-0.1974555, -0.3183337, -3.160578, 0, 1, 0.5019608, 1,
-0.1964344, -2.075766, -4.762615, 0, 1, 0.509804, 1,
-0.1951185, 0.8933916, 0.9336776, 0, 1, 0.5137255, 1,
-0.1942774, 0.1665678, -1.494237, 0, 1, 0.5215687, 1,
-0.1936892, -0.4607934, -0.7294666, 0, 1, 0.5254902, 1,
-0.1902805, 0.3692565, -2.123302, 0, 1, 0.5333334, 1,
-0.1879469, -1.035466, -4.70944, 0, 1, 0.5372549, 1,
-0.185515, 0.5492937, 0.464278, 0, 1, 0.5450981, 1,
-0.1809118, 1.957963, 1.207861, 0, 1, 0.5490196, 1,
-0.1792902, -0.2675707, -2.63428, 0, 1, 0.5568628, 1,
-0.1788763, 0.2744048, -0.7425227, 0, 1, 0.5607843, 1,
-0.1774686, -0.4021597, -2.104424, 0, 1, 0.5686275, 1,
-0.1735221, 0.2560337, -0.2596972, 0, 1, 0.572549, 1,
-0.1730996, 0.5996999, 0.5720968, 0, 1, 0.5803922, 1,
-0.1727966, -0.6502333, -2.99371, 0, 1, 0.5843138, 1,
-0.1727049, 1.202379, -0.9341605, 0, 1, 0.5921569, 1,
-0.1702117, 0.4440992, 0.5690018, 0, 1, 0.5960785, 1,
-0.1678448, 0.6481084, -0.5389809, 0, 1, 0.6039216, 1,
-0.1627348, -0.08815998, -3.32128, 0, 1, 0.6117647, 1,
-0.1596244, 0.9423237, -1.254876, 0, 1, 0.6156863, 1,
-0.1589852, 0.1381564, -1.974309, 0, 1, 0.6235294, 1,
-0.1587586, 0.1982703, 0.7526479, 0, 1, 0.627451, 1,
-0.1581752, -0.7191643, -2.505748, 0, 1, 0.6352941, 1,
-0.1515434, -1.415857, -2.074602, 0, 1, 0.6392157, 1,
-0.1420068, 2.067232, 0.03010999, 0, 1, 0.6470588, 1,
-0.1336252, -0.4891507, -3.891035, 0, 1, 0.6509804, 1,
-0.1286253, 0.3788416, 1.562988, 0, 1, 0.6588235, 1,
-0.1258223, -0.1709063, -4.926883, 0, 1, 0.6627451, 1,
-0.1244069, 0.2739005, -1.798423, 0, 1, 0.6705883, 1,
-0.1201396, -0.7208475, -2.851598, 0, 1, 0.6745098, 1,
-0.1200273, -1.348208, -0.6810244, 0, 1, 0.682353, 1,
-0.1191601, -0.5164078, -1.812636, 0, 1, 0.6862745, 1,
-0.1184617, 1.439527, 0.1379231, 0, 1, 0.6941177, 1,
-0.117807, 0.2962604, -0.4355388, 0, 1, 0.7019608, 1,
-0.1177811, 0.0880807, -1.46113, 0, 1, 0.7058824, 1,
-0.1166742, 0.5348119, -1.123238, 0, 1, 0.7137255, 1,
-0.1133757, 0.7137305, 0.9029087, 0, 1, 0.7176471, 1,
-0.110475, -0.3526867, -0.8008779, 0, 1, 0.7254902, 1,
-0.1058081, 1.593514, 1.054868, 0, 1, 0.7294118, 1,
-0.1052958, -0.6327357, -2.646549, 0, 1, 0.7372549, 1,
-0.1012801, -0.9643895, -2.39484, 0, 1, 0.7411765, 1,
-0.09852746, -1.031538, -2.299742, 0, 1, 0.7490196, 1,
-0.09823186, 0.6705475, 1.158064, 0, 1, 0.7529412, 1,
-0.09800591, -0.2097794, -1.949106, 0, 1, 0.7607843, 1,
-0.09228099, 1.115298, -1.869706, 0, 1, 0.7647059, 1,
-0.0914676, 1.464841, -1.158683, 0, 1, 0.772549, 1,
-0.09121823, 0.4248034, 0.03682053, 0, 1, 0.7764706, 1,
-0.09113141, 0.410629, -0.770358, 0, 1, 0.7843137, 1,
-0.09101948, -0.9138457, -3.810498, 0, 1, 0.7882353, 1,
-0.08845, -0.4173364, -2.365614, 0, 1, 0.7960784, 1,
-0.08600343, 0.2611552, 0.5905262, 0, 1, 0.8039216, 1,
-0.08481433, -0.9999476, -1.487448, 0, 1, 0.8078431, 1,
-0.07674006, 0.8007621, -0.7153431, 0, 1, 0.8156863, 1,
-0.07489433, 1.383501, -2.497772, 0, 1, 0.8196079, 1,
-0.07456488, 0.09000543, -0.5741373, 0, 1, 0.827451, 1,
-0.07217813, -0.6121981, -4.118974, 0, 1, 0.8313726, 1,
-0.07011741, -0.3519653, -3.022926, 0, 1, 0.8392157, 1,
-0.06960797, 0.1503982, -1.606963, 0, 1, 0.8431373, 1,
-0.06873264, -1.665815, -4.427369, 0, 1, 0.8509804, 1,
-0.06864495, 0.3391403, 0.2013149, 0, 1, 0.854902, 1,
-0.06642503, -0.4884997, -2.569578, 0, 1, 0.8627451, 1,
-0.05783956, 0.2941522, 0.247417, 0, 1, 0.8666667, 1,
-0.05779815, 2.033431, 0.0449754, 0, 1, 0.8745098, 1,
-0.05558566, 0.4504556, -0.6277003, 0, 1, 0.8784314, 1,
-0.05486109, 0.3888313, -0.8305322, 0, 1, 0.8862745, 1,
-0.05183621, 1.624194, -1.127719, 0, 1, 0.8901961, 1,
-0.0486166, -0.776255, -1.770191, 0, 1, 0.8980392, 1,
-0.04786358, -1.456696, -4.108795, 0, 1, 0.9058824, 1,
-0.04503064, 1.471946, -1.477636, 0, 1, 0.9098039, 1,
-0.04502135, -1.258399, -2.963671, 0, 1, 0.9176471, 1,
-0.04456602, -0.9869487, -3.831137, 0, 1, 0.9215686, 1,
-0.04443273, 1.137408, -1.849734, 0, 1, 0.9294118, 1,
-0.04302901, -1.13823, -3.830831, 0, 1, 0.9333333, 1,
-0.04222594, -0.3451567, -4.603109, 0, 1, 0.9411765, 1,
-0.04087168, -0.0008165836, -0.7155462, 0, 1, 0.945098, 1,
-0.03817926, -0.6702309, -1.794619, 0, 1, 0.9529412, 1,
-0.03758401, -0.1731737, -3.645442, 0, 1, 0.9568627, 1,
-0.02638219, -0.01979558, -3.436733, 0, 1, 0.9647059, 1,
-0.02098407, -0.6836298, -2.793777, 0, 1, 0.9686275, 1,
-0.01775613, 0.4157397, -1.433576, 0, 1, 0.9764706, 1,
-0.01769402, 0.7448199, -0.1638396, 0, 1, 0.9803922, 1,
-0.01671576, 0.620454, -0.2093463, 0, 1, 0.9882353, 1,
-0.01630913, 0.6912511, 1.678246, 0, 1, 0.9921569, 1,
-0.01559966, 0.372164, 0.1523773, 0, 1, 1, 1,
-0.01403114, -1.654924, -4.018894, 0, 0.9921569, 1, 1,
-0.01139218, 1.768249, -0.3330995, 0, 0.9882353, 1, 1,
-0.008648818, 1.479578, 2.230851, 0, 0.9803922, 1, 1,
-0.006743523, -0.1329175, -2.367432, 0, 0.9764706, 1, 1,
-0.005729609, 0.4725994, -0.2770012, 0, 0.9686275, 1, 1,
-0.0006792538, -2.013504, -3.576886, 0, 0.9647059, 1, 1,
0.0005796219, 0.1570173, -0.7089481, 0, 0.9568627, 1, 1,
0.009259447, -0.1527516, 2.017639, 0, 0.9529412, 1, 1,
0.01398351, 0.4794755, 0.7489165, 0, 0.945098, 1, 1,
0.01624906, -1.531809, 3.394478, 0, 0.9411765, 1, 1,
0.02424629, 0.0348926, 1.551803, 0, 0.9333333, 1, 1,
0.02480622, -1.136245, 4.693502, 0, 0.9294118, 1, 1,
0.02843239, -0.9535778, 2.877595, 0, 0.9215686, 1, 1,
0.03316712, 2.011326, 1.042417, 0, 0.9176471, 1, 1,
0.034628, 1.637036, -0.01672242, 0, 0.9098039, 1, 1,
0.03587787, -0.2612841, 2.100827, 0, 0.9058824, 1, 1,
0.03593144, 0.6410194, 0.1318867, 0, 0.8980392, 1, 1,
0.03598972, 1.120784, 0.04020745, 0, 0.8901961, 1, 1,
0.0391572, -1.550862, 5.184231, 0, 0.8862745, 1, 1,
0.04629907, 0.6932292, -0.290854, 0, 0.8784314, 1, 1,
0.04696949, -0.5410212, 2.229472, 0, 0.8745098, 1, 1,
0.04792941, -0.8598447, 3.651647, 0, 0.8666667, 1, 1,
0.05048475, -1.811458, 2.918122, 0, 0.8627451, 1, 1,
0.05219328, 1.123296, -1.997863, 0, 0.854902, 1, 1,
0.05272166, 2.276716, 1.406394, 0, 0.8509804, 1, 1,
0.05284419, -0.4200529, 3.813851, 0, 0.8431373, 1, 1,
0.0552774, -0.124604, 2.345956, 0, 0.8392157, 1, 1,
0.06016612, 0.309734, -0.7949011, 0, 0.8313726, 1, 1,
0.06553891, 1.215811, 0.5491635, 0, 0.827451, 1, 1,
0.06985004, 0.3730433, -1.210294, 0, 0.8196079, 1, 1,
0.07306486, -1.302867, 2.900746, 0, 0.8156863, 1, 1,
0.0746049, -0.9030374, 2.62474, 0, 0.8078431, 1, 1,
0.07584736, 0.5099986, -2.547753, 0, 0.8039216, 1, 1,
0.07705554, -1.012199, 4.305485, 0, 0.7960784, 1, 1,
0.07913907, 2.075171, 2.349542, 0, 0.7882353, 1, 1,
0.07942577, 0.8242539, 0.6075662, 0, 0.7843137, 1, 1,
0.08142048, -0.4314962, 3.777209, 0, 0.7764706, 1, 1,
0.08250301, 1.045333, 0.1179555, 0, 0.772549, 1, 1,
0.08446125, -1.556884, 1.63229, 0, 0.7647059, 1, 1,
0.08734044, -0.7166402, 3.536035, 0, 0.7607843, 1, 1,
0.087726, -0.300622, 3.653048, 0, 0.7529412, 1, 1,
0.08968458, -1.772172, 2.547275, 0, 0.7490196, 1, 1,
0.09205274, -1.644243, 4.875326, 0, 0.7411765, 1, 1,
0.0948726, 0.581529, -1.119119, 0, 0.7372549, 1, 1,
0.09632494, -0.3726641, 2.775295, 0, 0.7294118, 1, 1,
0.0964479, -0.26244, 2.080921, 0, 0.7254902, 1, 1,
0.09683425, -1.10453, 2.75286, 0, 0.7176471, 1, 1,
0.09684299, -0.06144412, 1.464073, 0, 0.7137255, 1, 1,
0.1012812, -0.3294325, 2.745055, 0, 0.7058824, 1, 1,
0.1016951, 0.7218499, -0.2350831, 0, 0.6980392, 1, 1,
0.1018536, -0.6905572, 2.611518, 0, 0.6941177, 1, 1,
0.1030794, 0.8030036, -0.9338315, 0, 0.6862745, 1, 1,
0.1038607, 1.803356, 0.2358324, 0, 0.682353, 1, 1,
0.1039745, 1.333455, 0.1920269, 0, 0.6745098, 1, 1,
0.1052965, -0.6880199, 2.438836, 0, 0.6705883, 1, 1,
0.1056291, 0.5187433, -1.36282, 0, 0.6627451, 1, 1,
0.106698, 1.917146, 0.9983081, 0, 0.6588235, 1, 1,
0.1081509, -1.208741, 2.602379, 0, 0.6509804, 1, 1,
0.1126179, 0.5960703, 1.838279, 0, 0.6470588, 1, 1,
0.1185902, 1.266663, -0.3489489, 0, 0.6392157, 1, 1,
0.1231638, -0.119321, 1.880717, 0, 0.6352941, 1, 1,
0.1255417, -0.3292495, 3.219735, 0, 0.627451, 1, 1,
0.1279211, 0.4270394, 2.38152, 0, 0.6235294, 1, 1,
0.1287914, -0.02276415, 1.698147, 0, 0.6156863, 1, 1,
0.1358944, 1.077649, 0.3426803, 0, 0.6117647, 1, 1,
0.1368939, -1.653721, 3.652334, 0, 0.6039216, 1, 1,
0.1371371, 0.499958, 2.366184, 0, 0.5960785, 1, 1,
0.1375668, -0.3417487, 2.490588, 0, 0.5921569, 1, 1,
0.1399965, 1.891674, -0.223133, 0, 0.5843138, 1, 1,
0.1415674, -1.300281, 2.553725, 0, 0.5803922, 1, 1,
0.1484085, 0.04621581, 0.4584804, 0, 0.572549, 1, 1,
0.1509102, -0.4909682, 3.877656, 0, 0.5686275, 1, 1,
0.1585767, -1.203821, 4.079455, 0, 0.5607843, 1, 1,
0.159687, -1.507474, 2.719487, 0, 0.5568628, 1, 1,
0.1614814, 0.1052192, 1.220829, 0, 0.5490196, 1, 1,
0.1621081, 2.248622, 0.4105693, 0, 0.5450981, 1, 1,
0.1670024, 0.6642605, -0.04998673, 0, 0.5372549, 1, 1,
0.1704582, -0.8579325, 2.841921, 0, 0.5333334, 1, 1,
0.1731122, 0.718914, -0.09383316, 0, 0.5254902, 1, 1,
0.1737224, 0.6999152, -0.0802051, 0, 0.5215687, 1, 1,
0.1756906, -0.02727219, 2.01324, 0, 0.5137255, 1, 1,
0.1781791, 1.040476, 1.38098, 0, 0.509804, 1, 1,
0.1792328, -0.3738013, 2.90403, 0, 0.5019608, 1, 1,
0.1819093, 0.6443467, -0.288346, 0, 0.4941176, 1, 1,
0.1832892, 0.01442933, 2.753589, 0, 0.4901961, 1, 1,
0.1880418, 1.527956, 2.118293, 0, 0.4823529, 1, 1,
0.1890247, 0.3896213, -0.2404752, 0, 0.4784314, 1, 1,
0.1936761, 1.064454, -0.4589209, 0, 0.4705882, 1, 1,
0.1952268, 0.166172, 1.386401, 0, 0.4666667, 1, 1,
0.1963185, 0.1542856, 2.778107, 0, 0.4588235, 1, 1,
0.1967647, 1.442912, 0.8842691, 0, 0.454902, 1, 1,
0.2019385, 0.1505791, 0.9073905, 0, 0.4470588, 1, 1,
0.2024578, 0.7102242, 0.2191953, 0, 0.4431373, 1, 1,
0.2058355, -3.457628, 3.911587, 0, 0.4352941, 1, 1,
0.2073775, -0.09626245, 0.4616372, 0, 0.4313726, 1, 1,
0.2104725, -0.6117542, 3.350787, 0, 0.4235294, 1, 1,
0.2108207, 0.2936157, -0.3143139, 0, 0.4196078, 1, 1,
0.2124389, -0.7826378, 2.080974, 0, 0.4117647, 1, 1,
0.2148872, -0.3219695, 2.552289, 0, 0.4078431, 1, 1,
0.216304, -0.1799489, 2.699456, 0, 0.4, 1, 1,
0.2164575, 2.148046, -0.6758402, 0, 0.3921569, 1, 1,
0.2197216, -1.627986, 2.811983, 0, 0.3882353, 1, 1,
0.2233804, 2.503548, 0.1564726, 0, 0.3803922, 1, 1,
0.2279372, -0.9040955, 1.687657, 0, 0.3764706, 1, 1,
0.2279412, 0.4282165, -0.1207094, 0, 0.3686275, 1, 1,
0.2288462, -0.2049991, 0.2045914, 0, 0.3647059, 1, 1,
0.2303066, 1.038818, 0.7901617, 0, 0.3568628, 1, 1,
0.2331326, 0.9471094, 0.5378929, 0, 0.3529412, 1, 1,
0.2340751, -0.5380305, 2.224355, 0, 0.345098, 1, 1,
0.2395551, 0.3725552, -0.1668581, 0, 0.3411765, 1, 1,
0.2467502, -0.7976094, 1.981771, 0, 0.3333333, 1, 1,
0.2468284, -2.315723, 3.401726, 0, 0.3294118, 1, 1,
0.2480433, 0.8207318, 1.930521, 0, 0.3215686, 1, 1,
0.248607, -1.019409, 2.295224, 0, 0.3176471, 1, 1,
0.2552628, -1.521563, 3.510382, 0, 0.3098039, 1, 1,
0.2558794, -0.1900293, 3.67016, 0, 0.3058824, 1, 1,
0.2560138, 0.3527852, 0.01769718, 0, 0.2980392, 1, 1,
0.256209, -0.9233482, 4.043605, 0, 0.2901961, 1, 1,
0.256699, 1.009048, 0.7924194, 0, 0.2862745, 1, 1,
0.2596876, -1.548623, 2.392662, 0, 0.2784314, 1, 1,
0.2605266, -1.436538, 2.808905, 0, 0.2745098, 1, 1,
0.26746, -0.9989806, 1.367313, 0, 0.2666667, 1, 1,
0.2696992, 0.4269886, 0.01086492, 0, 0.2627451, 1, 1,
0.2697868, -0.3424776, 1.915026, 0, 0.254902, 1, 1,
0.271858, -1.113525, 1.896469, 0, 0.2509804, 1, 1,
0.2720258, -0.02721417, 2.362286, 0, 0.2431373, 1, 1,
0.2797987, 0.5377176, 0.8852394, 0, 0.2392157, 1, 1,
0.2891017, 0.5506774, 1.907102, 0, 0.2313726, 1, 1,
0.2907718, 1.789893, -1.142249, 0, 0.227451, 1, 1,
0.2941237, 0.5819418, 1.873026, 0, 0.2196078, 1, 1,
0.297809, -0.06936482, 1.756858, 0, 0.2156863, 1, 1,
0.3012926, 0.4132882, 1.137824, 0, 0.2078431, 1, 1,
0.3014439, -1.18926, 2.949757, 0, 0.2039216, 1, 1,
0.3083152, -0.8244654, 1.529254, 0, 0.1960784, 1, 1,
0.3167017, -1.257469, 5.333389, 0, 0.1882353, 1, 1,
0.3182931, -0.2921959, 2.769255, 0, 0.1843137, 1, 1,
0.321581, 0.01537509, 2.481646, 0, 0.1764706, 1, 1,
0.3235719, -1.243159, 3.045727, 0, 0.172549, 1, 1,
0.3256638, -1.17228, 2.769025, 0, 0.1647059, 1, 1,
0.3261746, 1.359923, 0.7965819, 0, 0.1607843, 1, 1,
0.3273742, -0.03187627, 0.575417, 0, 0.1529412, 1, 1,
0.331403, 0.2765296, 1.547762, 0, 0.1490196, 1, 1,
0.3336483, -2.40316, 2.661057, 0, 0.1411765, 1, 1,
0.3382847, -0.1651598, 2.946939, 0, 0.1372549, 1, 1,
0.3472281, -0.01553207, 2.055455, 0, 0.1294118, 1, 1,
0.3501416, 0.8159776, -0.7083882, 0, 0.1254902, 1, 1,
0.3528621, 0.4843446, 2.173963, 0, 0.1176471, 1, 1,
0.3555373, -1.538587, 1.544957, 0, 0.1137255, 1, 1,
0.3580383, 0.7057138, 1.611367, 0, 0.1058824, 1, 1,
0.3582777, -1.1381, 2.716017, 0, 0.09803922, 1, 1,
0.3584729, 1.667029, 0.3247966, 0, 0.09411765, 1, 1,
0.3588038, -0.9611068, 3.768862, 0, 0.08627451, 1, 1,
0.3601245, -0.2555132, 2.148907, 0, 0.08235294, 1, 1,
0.3640614, 0.6051392, 1.783292, 0, 0.07450981, 1, 1,
0.3651939, 0.3028734, 0.2379011, 0, 0.07058824, 1, 1,
0.3664294, -2.008254, 1.580709, 0, 0.0627451, 1, 1,
0.3688267, -0.142778, -0.1943837, 0, 0.05882353, 1, 1,
0.3695549, -1.249515, 2.420845, 0, 0.05098039, 1, 1,
0.3727876, -0.730288, 0.6438649, 0, 0.04705882, 1, 1,
0.3731319, -2.096886, 4.200479, 0, 0.03921569, 1, 1,
0.3764449, -0.677919, 2.168461, 0, 0.03529412, 1, 1,
0.3804562, -1.292455, 2.578041, 0, 0.02745098, 1, 1,
0.3833261, 1.019918, -1.099383, 0, 0.02352941, 1, 1,
0.385489, 0.4847464, 0.03110509, 0, 0.01568628, 1, 1,
0.3878729, -1.066739, 2.830905, 0, 0.01176471, 1, 1,
0.3886182, 0.21944, 2.006819, 0, 0.003921569, 1, 1,
0.3895278, 0.06808428, 2.191519, 0.003921569, 0, 1, 1,
0.3911103, 1.617717, -0.3049342, 0.007843138, 0, 1, 1,
0.3912282, -0.7596446, 2.862641, 0.01568628, 0, 1, 1,
0.4005575, -0.7506562, 1.900054, 0.01960784, 0, 1, 1,
0.402395, 0.1443672, 1.389754, 0.02745098, 0, 1, 1,
0.4045025, -0.7943372, 3.571834, 0.03137255, 0, 1, 1,
0.4059432, 0.2278, 3.226458, 0.03921569, 0, 1, 1,
0.4212579, 1.763344, 2.403491, 0.04313726, 0, 1, 1,
0.426144, -0.4405566, 2.632973, 0.05098039, 0, 1, 1,
0.4306071, 0.4546838, 0.9421357, 0.05490196, 0, 1, 1,
0.4333177, -1.462426, 2.645755, 0.0627451, 0, 1, 1,
0.4354661, 0.7482511, -0.212323, 0.06666667, 0, 1, 1,
0.4369062, 0.234322, -0.2778231, 0.07450981, 0, 1, 1,
0.4395004, 0.1081024, 2.521504, 0.07843138, 0, 1, 1,
0.4434228, -1.339975, 0.9756133, 0.08627451, 0, 1, 1,
0.444535, -0.6230783, 2.400797, 0.09019608, 0, 1, 1,
0.4461814, 0.3958389, 0.4861345, 0.09803922, 0, 1, 1,
0.4463896, -0.8948154, 2.26757, 0.1058824, 0, 1, 1,
0.4489769, -1.036333, 2.479921, 0.1098039, 0, 1, 1,
0.4566773, -0.4952852, 0.3239765, 0.1176471, 0, 1, 1,
0.4595402, -0.5589131, 2.162032, 0.1215686, 0, 1, 1,
0.4615586, -2.281727, 2.098012, 0.1294118, 0, 1, 1,
0.4640605, 1.31853, -0.9238874, 0.1333333, 0, 1, 1,
0.4652782, -0.06034628, 3.77682, 0.1411765, 0, 1, 1,
0.4675599, 2.088356, -0.3140249, 0.145098, 0, 1, 1,
0.4689453, -1.211276, 3.196573, 0.1529412, 0, 1, 1,
0.4691418, -0.3491207, 4.484363, 0.1568628, 0, 1, 1,
0.4694716, 0.5449307, -1.548224, 0.1647059, 0, 1, 1,
0.4697362, -0.6942896, 4.343921, 0.1686275, 0, 1, 1,
0.4723625, -0.6670788, 3.25879, 0.1764706, 0, 1, 1,
0.473146, -0.01759305, 2.815079, 0.1803922, 0, 1, 1,
0.4750998, 0.7713197, 1.167809, 0.1882353, 0, 1, 1,
0.4831336, 0.1026258, 0.5065674, 0.1921569, 0, 1, 1,
0.4872378, -2.263774, 3.204922, 0.2, 0, 1, 1,
0.4901162, -0.5196005, 0.4392109, 0.2078431, 0, 1, 1,
0.4927671, 0.7346973, 0.6460603, 0.2117647, 0, 1, 1,
0.500303, -0.1960498, 2.649891, 0.2196078, 0, 1, 1,
0.5042377, 0.4878958, 1.270904, 0.2235294, 0, 1, 1,
0.5047778, 1.246112, -0.5977868, 0.2313726, 0, 1, 1,
0.5059334, -0.08244749, 0.8164595, 0.2352941, 0, 1, 1,
0.5092667, -0.1875735, 1.971124, 0.2431373, 0, 1, 1,
0.5127353, -0.2265231, 2.948224, 0.2470588, 0, 1, 1,
0.5196383, -1.866786, 2.430297, 0.254902, 0, 1, 1,
0.5290008, -0.5223513, 1.825528, 0.2588235, 0, 1, 1,
0.529115, -0.9607241, 3.978468, 0.2666667, 0, 1, 1,
0.5320278, 0.3481834, 1.571889, 0.2705882, 0, 1, 1,
0.5339271, -0.8074576, 2.832971, 0.2784314, 0, 1, 1,
0.5367918, 0.3386705, -1.164263, 0.282353, 0, 1, 1,
0.5393764, -1.739002, 3.310725, 0.2901961, 0, 1, 1,
0.5403461, -0.1280171, 1.344113, 0.2941177, 0, 1, 1,
0.5470155, -0.07484108, 2.185916, 0.3019608, 0, 1, 1,
0.547075, 0.05050008, 2.748817, 0.3098039, 0, 1, 1,
0.550211, 1.545111, 0.2165971, 0.3137255, 0, 1, 1,
0.5566707, -1.568764, 3.945304, 0.3215686, 0, 1, 1,
0.557628, 1.296692, 0.09142343, 0.3254902, 0, 1, 1,
0.5586106, 1.149066, 1.16625, 0.3333333, 0, 1, 1,
0.5590647, 0.3802716, 0.03535704, 0.3372549, 0, 1, 1,
0.5603092, 0.07675064, 1.646491, 0.345098, 0, 1, 1,
0.5634811, 0.504088, 1.113898, 0.3490196, 0, 1, 1,
0.5708853, -0.3407688, 1.668458, 0.3568628, 0, 1, 1,
0.5715404, 0.6212311, 1.196984, 0.3607843, 0, 1, 1,
0.5745299, 0.2305508, -0.2321641, 0.3686275, 0, 1, 1,
0.5752359, 1.271569, -0.2692775, 0.372549, 0, 1, 1,
0.5807763, 0.1835186, 2.386949, 0.3803922, 0, 1, 1,
0.5832406, 0.4058287, 0.3782716, 0.3843137, 0, 1, 1,
0.5867159, -0.3060854, 1.891989, 0.3921569, 0, 1, 1,
0.5879041, 1.906119, 1.193786, 0.3960784, 0, 1, 1,
0.5926511, 0.9785808, 0.7085272, 0.4039216, 0, 1, 1,
0.5936643, -0.4680111, 2.635136, 0.4117647, 0, 1, 1,
0.598267, -0.5096346, 2.034891, 0.4156863, 0, 1, 1,
0.5983282, 2.254912, 0.6936721, 0.4235294, 0, 1, 1,
0.614802, -0.5124454, 2.285353, 0.427451, 0, 1, 1,
0.6164282, -0.8601005, 2.94071, 0.4352941, 0, 1, 1,
0.6218819, 0.2236944, -0.07500093, 0.4392157, 0, 1, 1,
0.6224606, 1.353613, 0.472981, 0.4470588, 0, 1, 1,
0.6320017, -0.3598114, 3.859249, 0.4509804, 0, 1, 1,
0.6416108, -1.637299, 3.928307, 0.4588235, 0, 1, 1,
0.6431168, 0.3618333, -0.2757094, 0.4627451, 0, 1, 1,
0.6489964, -0.084741, 1.798812, 0.4705882, 0, 1, 1,
0.6495838, 1.612272, 0.06223219, 0.4745098, 0, 1, 1,
0.6561918, -0.6197304, 3.33329, 0.4823529, 0, 1, 1,
0.6577296, -0.08713509, 1.761581, 0.4862745, 0, 1, 1,
0.6580977, -1.05159, 2.071967, 0.4941176, 0, 1, 1,
0.6651548, -0.9337657, 2.842771, 0.5019608, 0, 1, 1,
0.6710305, 0.6587891, 1.886046, 0.5058824, 0, 1, 1,
0.6742606, -0.7924817, -0.4360115, 0.5137255, 0, 1, 1,
0.6755099, -0.8514184, 2.005032, 0.5176471, 0, 1, 1,
0.6804111, -0.2063827, 0.9783499, 0.5254902, 0, 1, 1,
0.6804883, -0.05371487, 0.4478881, 0.5294118, 0, 1, 1,
0.6824575, 0.7839258, 0.1663861, 0.5372549, 0, 1, 1,
0.6894944, -0.5485055, 3.248637, 0.5411765, 0, 1, 1,
0.6900813, 1.71353, -0.4996302, 0.5490196, 0, 1, 1,
0.6907384, 1.282993, 0.6570272, 0.5529412, 0, 1, 1,
0.6921866, 1.193921, 2.258438, 0.5607843, 0, 1, 1,
0.6924746, -0.548971, 2.599302, 0.5647059, 0, 1, 1,
0.6959776, -0.6231168, 1.486919, 0.572549, 0, 1, 1,
0.6969127, -0.9907523, 2.21916, 0.5764706, 0, 1, 1,
0.705295, 0.4666216, -0.184702, 0.5843138, 0, 1, 1,
0.7058653, 1.094338, 0.03632289, 0.5882353, 0, 1, 1,
0.7101338, -1.650167, 3.315695, 0.5960785, 0, 1, 1,
0.7110227, -0.7962867, 1.968166, 0.6039216, 0, 1, 1,
0.7133576, -0.4268092, 1.945918, 0.6078432, 0, 1, 1,
0.7134269, -0.658343, 2.470412, 0.6156863, 0, 1, 1,
0.7139105, -1.949088, 3.244701, 0.6196079, 0, 1, 1,
0.7170613, 0.09773309, 2.037113, 0.627451, 0, 1, 1,
0.7390842, 0.4465134, 2.966216, 0.6313726, 0, 1, 1,
0.7431258, 0.9033931, -0.5260121, 0.6392157, 0, 1, 1,
0.7458201, 1.240377, 0.1298483, 0.6431373, 0, 1, 1,
0.7468655, 1.146527, 1.201858, 0.6509804, 0, 1, 1,
0.7484486, -0.3113114, 1.031447, 0.654902, 0, 1, 1,
0.7544879, 2.15104, 1.00505, 0.6627451, 0, 1, 1,
0.7564409, 0.1027642, 0.9915217, 0.6666667, 0, 1, 1,
0.7570168, 0.7864705, 2.122668, 0.6745098, 0, 1, 1,
0.7578233, 0.9945493, -0.6601226, 0.6784314, 0, 1, 1,
0.7586645, 0.2271855, 0.57541, 0.6862745, 0, 1, 1,
0.7592416, 0.4781072, 3.011764, 0.6901961, 0, 1, 1,
0.7594467, -0.3614626, 1.636063, 0.6980392, 0, 1, 1,
0.7603446, -0.6119435, 1.815824, 0.7058824, 0, 1, 1,
0.7649396, -0.6890363, 1.543744, 0.7098039, 0, 1, 1,
0.7654771, 1.382273, 1.04376, 0.7176471, 0, 1, 1,
0.7669299, -0.5430393, 1.83517, 0.7215686, 0, 1, 1,
0.767522, 0.6415235, -0.6671877, 0.7294118, 0, 1, 1,
0.7713453, 0.000857045, 1.502546, 0.7333333, 0, 1, 1,
0.7725025, 0.9425119, 0.7275523, 0.7411765, 0, 1, 1,
0.7789791, -0.7678697, 1.525517, 0.7450981, 0, 1, 1,
0.7814482, 0.9169067, 1.058683, 0.7529412, 0, 1, 1,
0.7817001, -0.0302678, 3.334449, 0.7568628, 0, 1, 1,
0.7819117, 0.4247878, 0.237541, 0.7647059, 0, 1, 1,
0.7854505, -1.481859, 2.813149, 0.7686275, 0, 1, 1,
0.7891282, -0.7424008, 3.086997, 0.7764706, 0, 1, 1,
0.7902974, 0.071409, 2.791625, 0.7803922, 0, 1, 1,
0.7962583, -0.6592699, 5.014925, 0.7882353, 0, 1, 1,
0.7985966, -0.2933195, 2.274292, 0.7921569, 0, 1, 1,
0.8059215, 0.03909786, 1.385605, 0.8, 0, 1, 1,
0.8071229, -1.419259, 2.764195, 0.8078431, 0, 1, 1,
0.8076413, -0.7692208, 1.505641, 0.8117647, 0, 1, 1,
0.8091689, -0.8283564, 1.462044, 0.8196079, 0, 1, 1,
0.81648, 0.8943608, 0.08386909, 0.8235294, 0, 1, 1,
0.8168594, -0.4640243, 2.142114, 0.8313726, 0, 1, 1,
0.81806, -0.5109835, 0.7185432, 0.8352941, 0, 1, 1,
0.8182511, 1.182737, -0.08887937, 0.8431373, 0, 1, 1,
0.8192991, -0.4146498, 1.717911, 0.8470588, 0, 1, 1,
0.8219194, -0.4393175, 2.923179, 0.854902, 0, 1, 1,
0.8224843, 1.657611, -0.05866983, 0.8588235, 0, 1, 1,
0.8277526, -0.1567874, 1.267123, 0.8666667, 0, 1, 1,
0.8301138, -0.1129017, 2.589412, 0.8705882, 0, 1, 1,
0.8313351, -0.006558898, 1.267364, 0.8784314, 0, 1, 1,
0.8327869, 0.3157025, -0.3342651, 0.8823529, 0, 1, 1,
0.850681, 0.02750684, 2.026133, 0.8901961, 0, 1, 1,
0.8639812, -1.77247, 1.945225, 0.8941177, 0, 1, 1,
0.8647817, 0.1188827, 2.749033, 0.9019608, 0, 1, 1,
0.8684227, 0.3153212, 1.021194, 0.9098039, 0, 1, 1,
0.8691926, 1.805738, -0.301056, 0.9137255, 0, 1, 1,
0.869229, 0.1267484, 1.416726, 0.9215686, 0, 1, 1,
0.8719999, 0.5761871, -0.001127149, 0.9254902, 0, 1, 1,
0.8720723, -0.2037574, 0.452216, 0.9333333, 0, 1, 1,
0.8774715, -0.354165, 1.543766, 0.9372549, 0, 1, 1,
0.8829834, 0.9831601, 1.119827, 0.945098, 0, 1, 1,
0.8899928, -0.6498661, 3.343299, 0.9490196, 0, 1, 1,
0.89227, 0.402524, 1.011485, 0.9568627, 0, 1, 1,
0.8974182, -0.002620398, 1.045741, 0.9607843, 0, 1, 1,
0.9048813, 0.5078693, 0.854799, 0.9686275, 0, 1, 1,
0.9069916, 1.826462, 0.004138381, 0.972549, 0, 1, 1,
0.9134839, -1.722618, 3.72606, 0.9803922, 0, 1, 1,
0.9151059, 0.4495429, -1.041449, 0.9843137, 0, 1, 1,
0.9163991, 0.7927823, 1.065895, 0.9921569, 0, 1, 1,
0.9166721, -0.1486968, 0.5408061, 0.9960784, 0, 1, 1,
0.9239938, -3.187539, 2.774541, 1, 0, 0.9960784, 1,
0.9465577, 0.09219925, 2.73998, 1, 0, 0.9882353, 1,
0.9501573, -1.390138, 1.460319, 1, 0, 0.9843137, 1,
0.9502786, 0.3429305, 0.4121063, 1, 0, 0.9764706, 1,
0.9572469, -0.8408937, 3.068902, 1, 0, 0.972549, 1,
0.9592778, -0.7931038, 3.534653, 1, 0, 0.9647059, 1,
0.9611164, -0.2285796, 1.577532, 1, 0, 0.9607843, 1,
0.9694726, 0.1877054, 1.916092, 1, 0, 0.9529412, 1,
0.9702959, -1.643794, 1.523617, 1, 0, 0.9490196, 1,
0.9704189, 0.3600753, 0.5143797, 1, 0, 0.9411765, 1,
0.9749868, -0.8062381, 1.867517, 1, 0, 0.9372549, 1,
0.9767389, 0.4830413, 0.02661312, 1, 0, 0.9294118, 1,
0.9776068, -0.1440346, -0.0002660731, 1, 0, 0.9254902, 1,
0.9848027, 0.06398477, 1.563826, 1, 0, 0.9176471, 1,
0.9974711, 1.068046, 0.2701622, 1, 0, 0.9137255, 1,
0.9977103, -1.356558, 1.666806, 1, 0, 0.9058824, 1,
0.9984989, 0.830856, 1.85881, 1, 0, 0.9019608, 1,
1.0034, -0.3473533, 1.419756, 1, 0, 0.8941177, 1,
1.019704, -2.200422, 0.893209, 1, 0, 0.8862745, 1,
1.041332, 1.878612, 0.4329381, 1, 0, 0.8823529, 1,
1.042706, 0.2943879, 1.229596, 1, 0, 0.8745098, 1,
1.057976, -0.7045509, 1.569842, 1, 0, 0.8705882, 1,
1.062122, 0.1834521, 0.8500505, 1, 0, 0.8627451, 1,
1.064853, 0.9989792, 1.498962, 1, 0, 0.8588235, 1,
1.069736, -0.1227825, -0.5500222, 1, 0, 0.8509804, 1,
1.07009, 0.04968733, 2.097954, 1, 0, 0.8470588, 1,
1.075745, -0.7346737, 0.2406836, 1, 0, 0.8392157, 1,
1.077533, 0.03385378, 0.9645578, 1, 0, 0.8352941, 1,
1.079661, -0.339913, 2.038512, 1, 0, 0.827451, 1,
1.08513, -0.2470254, 2.091314, 1, 0, 0.8235294, 1,
1.086393, -0.3450383, 3.267132, 1, 0, 0.8156863, 1,
1.089056, 0.7604805, 1.277188, 1, 0, 0.8117647, 1,
1.091277, -0.6680927, 1.957952, 1, 0, 0.8039216, 1,
1.09401, -1.38412, 3.007991, 1, 0, 0.7960784, 1,
1.095702, 0.8977745, 0.8925389, 1, 0, 0.7921569, 1,
1.096821, -1.834701, 3.705059, 1, 0, 0.7843137, 1,
1.098191, 0.1909872, 1.082735, 1, 0, 0.7803922, 1,
1.104251, -0.4261509, 2.355807, 1, 0, 0.772549, 1,
1.107957, -0.1317153, 1.047246, 1, 0, 0.7686275, 1,
1.115774, 0.2445859, 1.388273, 1, 0, 0.7607843, 1,
1.126959, -0.7558988, 1.576986, 1, 0, 0.7568628, 1,
1.133565, -0.3389049, -0.9309665, 1, 0, 0.7490196, 1,
1.141375, 0.04618437, 0.5949013, 1, 0, 0.7450981, 1,
1.144057, 0.3624368, 1.485263, 1, 0, 0.7372549, 1,
1.149747, -1.685332, 2.830461, 1, 0, 0.7333333, 1,
1.151716, -1.111405, 2.262183, 1, 0, 0.7254902, 1,
1.154538, 0.4119907, 1.529335, 1, 0, 0.7215686, 1,
1.16285, 0.5206641, 0.9320202, 1, 0, 0.7137255, 1,
1.165542, 0.3691155, 0.4812194, 1, 0, 0.7098039, 1,
1.182601, 0.01328756, 0.7173787, 1, 0, 0.7019608, 1,
1.193237, -1.431125, 4.008258, 1, 0, 0.6941177, 1,
1.197866, 0.2346431, 1.890259, 1, 0, 0.6901961, 1,
1.200302, 3.16977, -0.1910847, 1, 0, 0.682353, 1,
1.204709, -0.5379729, 1.408561, 1, 0, 0.6784314, 1,
1.20812, -0.2132885, 1.132065, 1, 0, 0.6705883, 1,
1.212253, 1.931145, 0.7357177, 1, 0, 0.6666667, 1,
1.212795, -0.1992826, 2.446562, 1, 0, 0.6588235, 1,
1.220027, 0.1284825, 2.027013, 1, 0, 0.654902, 1,
1.222219, -0.4276859, 3.2548, 1, 0, 0.6470588, 1,
1.223304, -0.3575212, 1.323493, 1, 0, 0.6431373, 1,
1.223659, 0.4375167, 1.693853, 1, 0, 0.6352941, 1,
1.230587, 0.2364265, 2.583794, 1, 0, 0.6313726, 1,
1.238596, 0.8246214, 2.489349, 1, 0, 0.6235294, 1,
1.239365, -0.03879581, 1.263602, 1, 0, 0.6196079, 1,
1.241238, -1.564743, 4.174965, 1, 0, 0.6117647, 1,
1.252925, -1.241086, 1.409278, 1, 0, 0.6078432, 1,
1.265451, -0.5817436, 1.764686, 1, 0, 0.6, 1,
1.278713, -0.2642779, 1.990824, 1, 0, 0.5921569, 1,
1.28667, 0.3753523, 0.4976417, 1, 0, 0.5882353, 1,
1.29769, -0.4404972, 1.894966, 1, 0, 0.5803922, 1,
1.309481, 0.1548678, 1.980126, 1, 0, 0.5764706, 1,
1.318606, 0.06020138, 0.8543187, 1, 0, 0.5686275, 1,
1.322902, -0.4191937, 3.512324, 1, 0, 0.5647059, 1,
1.324614, 1.226813, 0.8523985, 1, 0, 0.5568628, 1,
1.328727, -0.3103099, 1.090932, 1, 0, 0.5529412, 1,
1.332662, 0.03851433, 3.262568, 1, 0, 0.5450981, 1,
1.333248, 1.198204, 0.9480304, 1, 0, 0.5411765, 1,
1.339624, -0.3715297, 0.154099, 1, 0, 0.5333334, 1,
1.342849, 1.607081, 0.0397982, 1, 0, 0.5294118, 1,
1.349606, 0.6439463, 0.6714091, 1, 0, 0.5215687, 1,
1.350317, 0.03652191, 0.3608797, 1, 0, 0.5176471, 1,
1.364045, -0.2773434, 1.412148, 1, 0, 0.509804, 1,
1.366981, 1.375522, 0.0298006, 1, 0, 0.5058824, 1,
1.367368, -1.128417, 1.547651, 1, 0, 0.4980392, 1,
1.370137, -0.6927282, 2.283949, 1, 0, 0.4901961, 1,
1.374688, -1.478528, 2.379543, 1, 0, 0.4862745, 1,
1.388311, 1.958605, 0.768832, 1, 0, 0.4784314, 1,
1.394755, -0.3273407, 1.953482, 1, 0, 0.4745098, 1,
1.395139, -0.8839163, 3.166505, 1, 0, 0.4666667, 1,
1.39585, 0.5124296, 1.064698, 1, 0, 0.4627451, 1,
1.410604, 2.286188, -1.087753, 1, 0, 0.454902, 1,
1.420194, -0.2951155, 2.919224, 1, 0, 0.4509804, 1,
1.443563, -1.359784, 1.730844, 1, 0, 0.4431373, 1,
1.452332, 0.3261919, 2.04351, 1, 0, 0.4392157, 1,
1.457104, -1.048836, 1.874708, 1, 0, 0.4313726, 1,
1.464353, -0.5499257, 1.152291, 1, 0, 0.427451, 1,
1.475843, 0.9881831, 0.3833674, 1, 0, 0.4196078, 1,
1.489518, -1.287317, 1.867334, 1, 0, 0.4156863, 1,
1.499945, 1.685338, -1.339892, 1, 0, 0.4078431, 1,
1.501019, 1.642636, 1.814707, 1, 0, 0.4039216, 1,
1.533343, -0.6296807, 1.840961, 1, 0, 0.3960784, 1,
1.540907, 0.4805403, 1.195775, 1, 0, 0.3882353, 1,
1.559302, 0.2193682, -0.7048324, 1, 0, 0.3843137, 1,
1.563632, 0.7925884, 2.076884, 1, 0, 0.3764706, 1,
1.564025, 0.2148322, 2.007344, 1, 0, 0.372549, 1,
1.565956, 0.8204078, 0.530134, 1, 0, 0.3647059, 1,
1.56892, -1.225254, 1.839187, 1, 0, 0.3607843, 1,
1.590675, 0.963611, 0.9071381, 1, 0, 0.3529412, 1,
1.617069, 0.1990412, 2.017165, 1, 0, 0.3490196, 1,
1.622057, 0.5365752, 0.6334658, 1, 0, 0.3411765, 1,
1.622728, -0.148797, 1.977259, 1, 0, 0.3372549, 1,
1.62601, -0.6849374, 2.930069, 1, 0, 0.3294118, 1,
1.634148, -0.8230901, 1.975997, 1, 0, 0.3254902, 1,
1.660934, 0.4519647, 0.168189, 1, 0, 0.3176471, 1,
1.673667, -1.537257, 2.926983, 1, 0, 0.3137255, 1,
1.681796, -0.7898598, 2.502926, 1, 0, 0.3058824, 1,
1.684738, -1.587698, 3.572619, 1, 0, 0.2980392, 1,
1.697771, 0.5506818, 2.430186, 1, 0, 0.2941177, 1,
1.707398, 1.220281, -0.0968102, 1, 0, 0.2862745, 1,
1.712749, -0.5547997, 2.673343, 1, 0, 0.282353, 1,
1.719597, -1.221163, 3.42604, 1, 0, 0.2745098, 1,
1.744911, -1.406295, 2.297879, 1, 0, 0.2705882, 1,
1.750408, 1.078335, 0.7958792, 1, 0, 0.2627451, 1,
1.755664, 0.9646872, 1.842784, 1, 0, 0.2588235, 1,
1.766486, 0.6074995, 1.633819, 1, 0, 0.2509804, 1,
1.769728, 0.2875688, 1.210486, 1, 0, 0.2470588, 1,
1.794192, -0.2421612, 0.02374876, 1, 0, 0.2392157, 1,
1.797771, 0.1646948, -0.149071, 1, 0, 0.2352941, 1,
1.799507, 2.706306, 1.330506, 1, 0, 0.227451, 1,
1.802573, 0.3757327, 2.537575, 1, 0, 0.2235294, 1,
1.831436, -0.0178154, 0.8270535, 1, 0, 0.2156863, 1,
1.834363, -0.289786, 0.7986903, 1, 0, 0.2117647, 1,
1.84175, 0.05367712, 1.099396, 1, 0, 0.2039216, 1,
1.847376, -0.2734433, 3.4475, 1, 0, 0.1960784, 1,
1.879678, 1.847575, 1.14414, 1, 0, 0.1921569, 1,
1.895414, 0.5156841, 2.129418, 1, 0, 0.1843137, 1,
1.895993, -0.5928317, 0.7502829, 1, 0, 0.1803922, 1,
1.900634, -0.06872236, 0.8904257, 1, 0, 0.172549, 1,
1.903563, -1.196751, 1.979831, 1, 0, 0.1686275, 1,
1.914918, 1.219377, -0.5106368, 1, 0, 0.1607843, 1,
1.94979, 0.4143493, 0.747902, 1, 0, 0.1568628, 1,
1.958324, 0.1556565, 0.1393311, 1, 0, 0.1490196, 1,
1.965203, -0.5456402, 2.593771, 1, 0, 0.145098, 1,
1.998195, -0.1627478, 1.508365, 1, 0, 0.1372549, 1,
2.00541, 0.776249, -0.2853929, 1, 0, 0.1333333, 1,
2.015699, 0.8946584, 0.1027457, 1, 0, 0.1254902, 1,
2.040719, 0.7596548, -0.1060944, 1, 0, 0.1215686, 1,
2.053344, 0.8155316, 1.125931, 1, 0, 0.1137255, 1,
2.105427, -0.771122, 4.19326, 1, 0, 0.1098039, 1,
2.107173, -1.173238, 2.837241, 1, 0, 0.1019608, 1,
2.120575, -0.8454495, -0.006632342, 1, 0, 0.09411765, 1,
2.123289, 1.072492, 1.922452, 1, 0, 0.09019608, 1,
2.225612, 1.069934, -0.01102663, 1, 0, 0.08235294, 1,
2.241039, -1.41207, 2.074387, 1, 0, 0.07843138, 1,
2.265034, -0.09934954, 0.6111724, 1, 0, 0.07058824, 1,
2.27791, -2.612964, 1.352275, 1, 0, 0.06666667, 1,
2.291125, -1.128702, 1.287358, 1, 0, 0.05882353, 1,
2.355834, -1.168171, 2.302937, 1, 0, 0.05490196, 1,
2.397311, -0.01242492, 0.6291299, 1, 0, 0.04705882, 1,
2.419442, 0.2249472, 0.8612912, 1, 0, 0.04313726, 1,
2.466587, -1.681541, 2.7327, 1, 0, 0.03529412, 1,
2.669975, -0.8923984, 2.457302, 1, 0, 0.03137255, 1,
2.713027, 1.1788, 1.258304, 1, 0, 0.02352941, 1,
2.714892, -0.01282189, 1.286659, 1, 0, 0.01960784, 1,
3.026233, 0.5252383, 2.650278, 1, 0, 0.01176471, 1,
3.318993, 0.2878062, 0.8683807, 1, 0, 0.007843138, 1
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
0.2346452, -4.580972, -6.968163, 0, -0.5, 0.5, 0.5,
0.2346452, -4.580972, -6.968163, 1, -0.5, 0.5, 0.5,
0.2346452, -4.580972, -6.968163, 1, 1.5, 0.5, 0.5,
0.2346452, -4.580972, -6.968163, 0, 1.5, 0.5, 0.5
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
-3.895297, -0.1439292, -6.968163, 0, -0.5, 0.5, 0.5,
-3.895297, -0.1439292, -6.968163, 1, -0.5, 0.5, 0.5,
-3.895297, -0.1439292, -6.968163, 1, 1.5, 0.5, 0.5,
-3.895297, -0.1439292, -6.968163, 0, 1.5, 0.5, 0.5
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
-3.895297, -4.580972, 0.07406783, 0, -0.5, 0.5, 0.5,
-3.895297, -4.580972, 0.07406783, 1, -0.5, 0.5, 0.5,
-3.895297, -4.580972, 0.07406783, 1, 1.5, 0.5, 0.5,
-3.895297, -4.580972, 0.07406783, 0, 1.5, 0.5, 0.5
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
-2, -3.557039, -5.343033,
3, -3.557039, -5.343033,
-2, -3.557039, -5.343033,
-2, -3.727695, -5.613888,
-1, -3.557039, -5.343033,
-1, -3.727695, -5.613888,
0, -3.557039, -5.343033,
0, -3.727695, -5.613888,
1, -3.557039, -5.343033,
1, -3.727695, -5.613888,
2, -3.557039, -5.343033,
2, -3.727695, -5.613888,
3, -3.557039, -5.343033,
3, -3.727695, -5.613888
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
-2, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
-2, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
-2, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
-2, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5,
-1, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
-1, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
-1, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
-1, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5,
0, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
0, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
0, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
0, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5,
1, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
1, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
1, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
1, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5,
2, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
2, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
2, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
2, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5,
3, -4.069005, -6.155598, 0, -0.5, 0.5, 0.5,
3, -4.069005, -6.155598, 1, -0.5, 0.5, 0.5,
3, -4.069005, -6.155598, 1, 1.5, 0.5, 0.5,
3, -4.069005, -6.155598, 0, 1.5, 0.5, 0.5
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
-2.942233, -3, -5.343033,
-2.942233, 3, -5.343033,
-2.942233, -3, -5.343033,
-3.101077, -3, -5.613888,
-2.942233, -2, -5.343033,
-3.101077, -2, -5.613888,
-2.942233, -1, -5.343033,
-3.101077, -1, -5.613888,
-2.942233, 0, -5.343033,
-3.101077, 0, -5.613888,
-2.942233, 1, -5.343033,
-3.101077, 1, -5.613888,
-2.942233, 2, -5.343033,
-3.101077, 2, -5.613888,
-2.942233, 3, -5.343033,
-3.101077, 3, -5.613888
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
-3.418765, -3, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, -3, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, -3, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, -3, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, -2, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, -2, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, -2, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, -2, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, -1, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, -1, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, -1, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, -1, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, 0, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, 0, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, 0, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, 0, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, 1, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, 1, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, 1, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, 1, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, 2, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, 2, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, 2, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, 2, -6.155598, 0, 1.5, 0.5, 0.5,
-3.418765, 3, -6.155598, 0, -0.5, 0.5, 0.5,
-3.418765, 3, -6.155598, 1, -0.5, 0.5, 0.5,
-3.418765, 3, -6.155598, 1, 1.5, 0.5, 0.5,
-3.418765, 3, -6.155598, 0, 1.5, 0.5, 0.5
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
-2.942233, -3.557039, -4,
-2.942233, -3.557039, 4,
-2.942233, -3.557039, -4,
-3.101077, -3.727695, -4,
-2.942233, -3.557039, -2,
-3.101077, -3.727695, -2,
-2.942233, -3.557039, 0,
-3.101077, -3.727695, 0,
-2.942233, -3.557039, 2,
-3.101077, -3.727695, 2,
-2.942233, -3.557039, 4,
-3.101077, -3.727695, 4
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
-3.418765, -4.069005, -4, 0, -0.5, 0.5, 0.5,
-3.418765, -4.069005, -4, 1, -0.5, 0.5, 0.5,
-3.418765, -4.069005, -4, 1, 1.5, 0.5, 0.5,
-3.418765, -4.069005, -4, 0, 1.5, 0.5, 0.5,
-3.418765, -4.069005, -2, 0, -0.5, 0.5, 0.5,
-3.418765, -4.069005, -2, 1, -0.5, 0.5, 0.5,
-3.418765, -4.069005, -2, 1, 1.5, 0.5, 0.5,
-3.418765, -4.069005, -2, 0, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 0, 0, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 0, 1, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 0, 1, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 0, 0, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 2, 0, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 2, 1, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 2, 1, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 2, 0, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 4, 0, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 4, 1, -0.5, 0.5, 0.5,
-3.418765, -4.069005, 4, 1, 1.5, 0.5, 0.5,
-3.418765, -4.069005, 4, 0, 1.5, 0.5, 0.5
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
-2.942233, -3.557039, -5.343033,
-2.942233, 3.269181, -5.343033,
-2.942233, -3.557039, 5.491168,
-2.942233, 3.269181, 5.491168,
-2.942233, -3.557039, -5.343033,
-2.942233, -3.557039, 5.491168,
-2.942233, 3.269181, -5.343033,
-2.942233, 3.269181, 5.491168,
-2.942233, -3.557039, -5.343033,
3.411524, -3.557039, -5.343033,
-2.942233, -3.557039, 5.491168,
3.411524, -3.557039, 5.491168,
-2.942233, 3.269181, -5.343033,
3.411524, 3.269181, -5.343033,
-2.942233, 3.269181, 5.491168,
3.411524, 3.269181, 5.491168,
3.411524, -3.557039, -5.343033,
3.411524, 3.269181, -5.343033,
3.411524, -3.557039, 5.491168,
3.411524, 3.269181, 5.491168,
3.411524, -3.557039, -5.343033,
3.411524, -3.557039, 5.491168,
3.411524, 3.269181, -5.343033,
3.411524, 3.269181, 5.491168
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
var radius = 7.63326;
var distance = 33.96124;
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
mvMatrix.translate( -0.2346452, 0.1439292, -0.07406783 );
mvMatrix.scale( 1.298953, 1.209048, 0.7617756 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96124);
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
Chlordene<-read.table("Chlordene.xyz")
```

```
## Error in read.table("Chlordene.xyz"): no lines available in input
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
-2.849703, -0.325364, -2.304662, 0, 0, 1, 1, 1,
-2.679061, -0.8420936, -3.162404, 1, 0, 0, 1, 1,
-2.66715, 1.57585, 0.2269478, 1, 0, 0, 1, 1,
-2.663064, -0.04444595, -1.567448, 1, 0, 0, 1, 1,
-2.661994, 1.662381, -0.9188634, 1, 0, 0, 1, 1,
-2.551771, -0.1839971, -2.198677, 1, 0, 0, 1, 1,
-2.488812, -0.1054499, -2.957346, 0, 0, 0, 1, 1,
-2.452897, -0.6309046, -0.625389, 0, 0, 0, 1, 1,
-2.333951, 0.06831165, -1.004218, 0, 0, 0, 1, 1,
-2.322168, -0.506808, -0.1851532, 0, 0, 0, 1, 1,
-2.200969, 1.378646, -1.728711, 0, 0, 0, 1, 1,
-2.190805, -0.1850941, -2.610291, 0, 0, 0, 1, 1,
-2.175702, 1.001908, -1.785107, 0, 0, 0, 1, 1,
-2.054647, -1.804253, -4.119429, 1, 1, 1, 1, 1,
-2.033233, -0.8172453, -1.733962, 1, 1, 1, 1, 1,
-2.028835, -0.2526257, -0.8467357, 1, 1, 1, 1, 1,
-2.021989, 0.1975993, -1.536662, 1, 1, 1, 1, 1,
-2.011808, 0.2842972, -0.3202084, 1, 1, 1, 1, 1,
-1.989087, -0.5725036, -0.8654575, 1, 1, 1, 1, 1,
-1.98589, 0.7232481, -1.996465, 1, 1, 1, 1, 1,
-1.936554, -0.3879302, -2.448949, 1, 1, 1, 1, 1,
-1.9291, 0.9696942, -2.258348, 1, 1, 1, 1, 1,
-1.92555, -1.716058, -2.117351, 1, 1, 1, 1, 1,
-1.91693, 0.8319649, -0.2579342, 1, 1, 1, 1, 1,
-1.91003, -1.375075, -2.062051, 1, 1, 1, 1, 1,
-1.893732, 1.07895, 2.468846, 1, 1, 1, 1, 1,
-1.856795, -0.7848516, -1.500245, 1, 1, 1, 1, 1,
-1.831032, -0.08009617, -2.334311, 1, 1, 1, 1, 1,
-1.817018, 0.05469609, -1.995142, 0, 0, 1, 1, 1,
-1.811351, -1.580457, -0.9539891, 1, 0, 0, 1, 1,
-1.791295, 0.478231, -0.6533366, 1, 0, 0, 1, 1,
-1.771411, 0.3699592, -2.191388, 1, 0, 0, 1, 1,
-1.744757, -0.7350978, -1.851927, 1, 0, 0, 1, 1,
-1.743903, -0.8355974, -0.9069593, 1, 0, 0, 1, 1,
-1.733453, -1.864306, -2.012544, 0, 0, 0, 1, 1,
-1.729438, -0.217588, -2.107552, 0, 0, 0, 1, 1,
-1.729148, 0.5376651, -2.875049, 0, 0, 0, 1, 1,
-1.714254, -1.628848, -3.598125, 0, 0, 0, 1, 1,
-1.65739, 0.8858939, 0.6936655, 0, 0, 0, 1, 1,
-1.653497, 0.8381604, -1.768781, 0, 0, 0, 1, 1,
-1.648445, -0.8239545, -0.3685264, 0, 0, 0, 1, 1,
-1.631098, 0.411607, -2.52323, 1, 1, 1, 1, 1,
-1.594943, -1.155732, -2.174518, 1, 1, 1, 1, 1,
-1.589471, 1.015269, -1.070455, 1, 1, 1, 1, 1,
-1.587042, -0.5045635, -1.452728, 1, 1, 1, 1, 1,
-1.584795, -2.221998, -3.704233, 1, 1, 1, 1, 1,
-1.583324, 2.383059, 0.06698302, 1, 1, 1, 1, 1,
-1.570611, 0.1055317, 0.3069899, 1, 1, 1, 1, 1,
-1.567223, 0.3620186, -1.862029, 1, 1, 1, 1, 1,
-1.56183, 0.3448413, -2.395445, 1, 1, 1, 1, 1,
-1.554725, 0.8611972, -1.26619, 1, 1, 1, 1, 1,
-1.547065, -0.9797136, -0.1109336, 1, 1, 1, 1, 1,
-1.532812, 0.5256783, -0.2616785, 1, 1, 1, 1, 1,
-1.531403, 0.2200123, -1.218102, 1, 1, 1, 1, 1,
-1.519331, 0.9925277, -0.155385, 1, 1, 1, 1, 1,
-1.505056, 0.5916244, -0.8906944, 1, 1, 1, 1, 1,
-1.502685, 0.7818214, -1.166234, 0, 0, 1, 1, 1,
-1.487502, -1.10251, -0.9692704, 1, 0, 0, 1, 1,
-1.481878, -0.08176372, -3.070493, 1, 0, 0, 1, 1,
-1.472357, -1.546886, -2.38243, 1, 0, 0, 1, 1,
-1.465212, 1.560534, -0.9345275, 1, 0, 0, 1, 1,
-1.452926, -1.79647, -3.663805, 1, 0, 0, 1, 1,
-1.440259, 0.33151, -0.4828939, 0, 0, 0, 1, 1,
-1.435236, -0.5929697, -0.6668625, 0, 0, 0, 1, 1,
-1.428584, 1.512783, -1.941711, 0, 0, 0, 1, 1,
-1.417586, -0.6327636, -2.413918, 0, 0, 0, 1, 1,
-1.417488, -1.015445, -3.836532, 0, 0, 0, 1, 1,
-1.409488, -0.6194555, -2.109381, 0, 0, 0, 1, 1,
-1.404454, -0.4015505, -2.621521, 0, 0, 0, 1, 1,
-1.402613, 1.111869, -0.03582716, 1, 1, 1, 1, 1,
-1.400228, 1.037995, -1.442082, 1, 1, 1, 1, 1,
-1.399305, -1.976316, -2.164766, 1, 1, 1, 1, 1,
-1.382909, -0.8377119, -2.466125, 1, 1, 1, 1, 1,
-1.356491, -0.9814197, -0.4540093, 1, 1, 1, 1, 1,
-1.354982, 1.810594, -0.3193609, 1, 1, 1, 1, 1,
-1.348962, 0.9113401, -1.660217, 1, 1, 1, 1, 1,
-1.347116, -2.081413, -2.259168, 1, 1, 1, 1, 1,
-1.346898, -0.1189374, -1.4371, 1, 1, 1, 1, 1,
-1.345076, -0.283205, -0.7597404, 1, 1, 1, 1, 1,
-1.340705, -0.04986713, -0.334119, 1, 1, 1, 1, 1,
-1.334921, 2.368186, -0.3158063, 1, 1, 1, 1, 1,
-1.324615, 1.885573, -2.269896, 1, 1, 1, 1, 1,
-1.320727, -1.350888, -2.534107, 1, 1, 1, 1, 1,
-1.317564, -0.05386545, -1.363109, 1, 1, 1, 1, 1,
-1.31448, -1.290197, -2.721051, 0, 0, 1, 1, 1,
-1.312637, 0.01605998, -1.229593, 1, 0, 0, 1, 1,
-1.310572, 0.929332, 0.1277489, 1, 0, 0, 1, 1,
-1.30307, -0.7768506, -2.529733, 1, 0, 0, 1, 1,
-1.297978, -0.07153723, -3.627547, 1, 0, 0, 1, 1,
-1.290732, -0.07074568, -1.03343, 1, 0, 0, 1, 1,
-1.29058, 1.245368, -0.9879627, 0, 0, 0, 1, 1,
-1.281851, -1.655152, -1.823156, 0, 0, 0, 1, 1,
-1.277111, -0.9370694, -2.928711, 0, 0, 0, 1, 1,
-1.273688, -0.1589013, -1.658614, 0, 0, 0, 1, 1,
-1.26982, 0.4395495, -0.1013831, 0, 0, 0, 1, 1,
-1.254482, -0.01158112, -0.2554687, 0, 0, 0, 1, 1,
-1.252169, -0.3921627, -2.795932, 0, 0, 0, 1, 1,
-1.251664, -0.1489569, -2.429842, 1, 1, 1, 1, 1,
-1.251183, -0.7104546, -1.014486, 1, 1, 1, 1, 1,
-1.248498, -0.5091825, -3.59092, 1, 1, 1, 1, 1,
-1.241251, 0.4671701, -0.1317679, 1, 1, 1, 1, 1,
-1.24096, 1.010152, -1.42144, 1, 1, 1, 1, 1,
-1.238157, -0.1475963, -1.244477, 1, 1, 1, 1, 1,
-1.231298, 0.58301, -2.531687, 1, 1, 1, 1, 1,
-1.224983, -1.224329, -1.677754, 1, 1, 1, 1, 1,
-1.223095, -1.424229, -2.412143, 1, 1, 1, 1, 1,
-1.214865, 0.372068, -0.7849965, 1, 1, 1, 1, 1,
-1.213235, 0.1751006, -0.9441275, 1, 1, 1, 1, 1,
-1.211852, -0.709029, -3.516488, 1, 1, 1, 1, 1,
-1.205443, 0.9260909, -0.9992832, 1, 1, 1, 1, 1,
-1.201467, -0.004429125, -0.5901608, 1, 1, 1, 1, 1,
-1.195831, -2.064955, -2.730732, 1, 1, 1, 1, 1,
-1.191002, -0.1281102, -1.165345, 0, 0, 1, 1, 1,
-1.171676, 2.755611, -0.608676, 1, 0, 0, 1, 1,
-1.16735, 0.7295488, -3.000063, 1, 0, 0, 1, 1,
-1.164608, 1.386801, -0.08971714, 1, 0, 0, 1, 1,
-1.153866, -0.7568492, -3.793932, 1, 0, 0, 1, 1,
-1.14668, -0.05454749, -0.8697246, 1, 0, 0, 1, 1,
-1.144562, -2.036797, -4.56129, 0, 0, 0, 1, 1,
-1.139196, -1.5153, -5.185253, 0, 0, 0, 1, 1,
-1.138537, -2.067899, -4.068637, 0, 0, 0, 1, 1,
-1.134291, -0.5938909, -1.935494, 0, 0, 0, 1, 1,
-1.131755, 0.9787378, -1.427121, 0, 0, 0, 1, 1,
-1.130951, -0.2473024, -1.765401, 0, 0, 0, 1, 1,
-1.129145, 0.303471, -2.351925, 0, 0, 0, 1, 1,
-1.118163, 0.5192789, -1.363251, 1, 1, 1, 1, 1,
-1.11138, 0.1275536, -2.842408, 1, 1, 1, 1, 1,
-1.109217, -1.263913, -1.848252, 1, 1, 1, 1, 1,
-1.10908, -1.054271, -3.76395, 1, 1, 1, 1, 1,
-1.099699, 0.2066053, 0.09610019, 1, 1, 1, 1, 1,
-1.089704, 0.4609436, -0.5227388, 1, 1, 1, 1, 1,
-1.08634, 0.07208973, -0.03256059, 1, 1, 1, 1, 1,
-1.084321, 0.1050467, -3.367613, 1, 1, 1, 1, 1,
-1.070095, -0.6806661, -1.066579, 1, 1, 1, 1, 1,
-1.069518, 0.2050238, -3.406559, 1, 1, 1, 1, 1,
-1.068013, 2.278768, -0.6148779, 1, 1, 1, 1, 1,
-1.067022, 0.1954914, -1.172868, 1, 1, 1, 1, 1,
-1.062844, -0.1892069, -0.1438869, 1, 1, 1, 1, 1,
-1.05686, -0.6508071, -2.070894, 1, 1, 1, 1, 1,
-1.048144, 2.860039, -0.5615435, 1, 1, 1, 1, 1,
-1.046, 0.4107795, -1.865572, 0, 0, 1, 1, 1,
-1.043096, 0.2961041, -1.230862, 1, 0, 0, 1, 1,
-1.035288, 0.6095425, -2.417133, 1, 0, 0, 1, 1,
-1.034729, -0.4158694, -1.753183, 1, 0, 0, 1, 1,
-1.03173, 0.2494226, -1.182887, 1, 0, 0, 1, 1,
-1.022855, 0.3228037, 0.4987822, 1, 0, 0, 1, 1,
-1.019427, 0.03636023, -1.936733, 0, 0, 0, 1, 1,
-1.018912, -0.1071973, -0.3402055, 0, 0, 0, 1, 1,
-1.018146, 1.021551, -1.719764, 0, 0, 0, 1, 1,
-1.017693, 0.7901803, 0.04323779, 0, 0, 0, 1, 1,
-1.017495, 0.6084898, 0.4806804, 0, 0, 0, 1, 1,
-1.015623, 1.894946, -0.09570815, 0, 0, 0, 1, 1,
-1.014861, 0.3414592, -0.7072117, 0, 0, 0, 1, 1,
-1.014795, 1.195152, 1.618914, 1, 1, 1, 1, 1,
-1.009373, 0.03338941, -2.735967, 1, 1, 1, 1, 1,
-1.001619, 1.12538, -1.309425, 1, 1, 1, 1, 1,
-1.000651, 1.401715, -1.00648, 1, 1, 1, 1, 1,
-0.9985512, 1.215637, -1.35945, 1, 1, 1, 1, 1,
-0.9974352, 0.4733158, -2.104904, 1, 1, 1, 1, 1,
-0.9953322, 0.7285406, -0.009507632, 1, 1, 1, 1, 1,
-0.9942066, -0.1004332, -0.6438437, 1, 1, 1, 1, 1,
-0.9941603, -0.4083638, -3.107255, 1, 1, 1, 1, 1,
-0.99396, 1.39928, -1.789383, 1, 1, 1, 1, 1,
-0.9939322, 0.4511099, -1.773201, 1, 1, 1, 1, 1,
-0.9906198, -1.580914, -2.858293, 1, 1, 1, 1, 1,
-0.9881123, 0.9097474, -1.756796, 1, 1, 1, 1, 1,
-0.9880931, -0.7089283, -2.616955, 1, 1, 1, 1, 1,
-0.987288, 0.3549441, -1.558219, 1, 1, 1, 1, 1,
-0.9868533, -0.4449107, -0.8393774, 0, 0, 1, 1, 1,
-0.9867815, 0.3806909, -2.430327, 1, 0, 0, 1, 1,
-0.9829822, 1.701733, 0.4111874, 1, 0, 0, 1, 1,
-0.9728457, 0.1194335, -1.638574, 1, 0, 0, 1, 1,
-0.971394, 0.8668702, -1.457102, 1, 0, 0, 1, 1,
-0.9677057, -0.216563, -2.361473, 1, 0, 0, 1, 1,
-0.9588189, 0.3353619, -2.714988, 0, 0, 0, 1, 1,
-0.9527897, 0.1976206, -1.627535, 0, 0, 0, 1, 1,
-0.9522641, 0.8067881, -2.37036, 0, 0, 0, 1, 1,
-0.9468274, -0.4269369, -1.696432, 0, 0, 0, 1, 1,
-0.9325617, 0.1265931, -2.292596, 0, 0, 0, 1, 1,
-0.9323618, 1.482443, 0.8060702, 0, 0, 0, 1, 1,
-0.9316629, 0.2374606, -3.295305, 0, 0, 0, 1, 1,
-0.926446, 0.04491298, -0.7834676, 1, 1, 1, 1, 1,
-0.9263409, 0.2504562, -0.4464762, 1, 1, 1, 1, 1,
-0.925531, 1.054502, -0.9977779, 1, 1, 1, 1, 1,
-0.9210236, -0.3462652, -1.248214, 1, 1, 1, 1, 1,
-0.9130481, 0.5361124, -1.252719, 1, 1, 1, 1, 1,
-0.9092557, 0.9536308, -0.1126061, 1, 1, 1, 1, 1,
-0.9057515, 0.7330306, -1.469962, 1, 1, 1, 1, 1,
-0.8945172, 0.3423581, -1.952088, 1, 1, 1, 1, 1,
-0.8821197, 0.04315575, -1.015583, 1, 1, 1, 1, 1,
-0.8736506, 2.23719, -1.331555, 1, 1, 1, 1, 1,
-0.8708863, -1.309188, -1.869387, 1, 1, 1, 1, 1,
-0.8694924, -2.017108, -2.781659, 1, 1, 1, 1, 1,
-0.8663498, 1.375303, -0.9309552, 1, 1, 1, 1, 1,
-0.8647136, 0.6983336, -0.893259, 1, 1, 1, 1, 1,
-0.8543534, 1.138708, -1.985528, 1, 1, 1, 1, 1,
-0.8539392, -0.3771492, -1.728643, 0, 0, 1, 1, 1,
-0.850586, -0.6372025, -3.720847, 1, 0, 0, 1, 1,
-0.8483406, 0.739611, 0.7759287, 1, 0, 0, 1, 1,
-0.8434014, 0.2135011, -0.8474592, 1, 0, 0, 1, 1,
-0.8424309, -0.7284692, -0.7032256, 1, 0, 0, 1, 1,
-0.8386586, 0.1022216, -0.8503951, 1, 0, 0, 1, 1,
-0.830187, 0.2808851, -2.825337, 0, 0, 0, 1, 1,
-0.8278096, 0.7263423, -2.317585, 0, 0, 0, 1, 1,
-0.8270916, -0.6108978, -1.863925, 0, 0, 0, 1, 1,
-0.8268494, -0.2617655, -1.685397, 0, 0, 0, 1, 1,
-0.8262649, -2.00032, -3.750394, 0, 0, 0, 1, 1,
-0.8226115, 1.482405, 1.108218, 0, 0, 0, 1, 1,
-0.8096673, -0.106684, -1.083924, 0, 0, 0, 1, 1,
-0.8085188, 0.6297249, -1.468592, 1, 1, 1, 1, 1,
-0.8018615, 0.3640522, -0.3618944, 1, 1, 1, 1, 1,
-0.7979307, -0.3883468, -2.332973, 1, 1, 1, 1, 1,
-0.7928061, 0.6255423, -0.517153, 1, 1, 1, 1, 1,
-0.7914457, -2.38968, -3.32322, 1, 1, 1, 1, 1,
-0.7883816, 1.158859, -0.392388, 1, 1, 1, 1, 1,
-0.7851204, 0.8294545, 0.00365527, 1, 1, 1, 1, 1,
-0.7833924, 0.4722595, -1.870609, 1, 1, 1, 1, 1,
-0.781932, 2.006461, -0.08547502, 1, 1, 1, 1, 1,
-0.7790175, 0.7005281, -1.876177, 1, 1, 1, 1, 1,
-0.7772132, 0.8899925, -0.8712029, 1, 1, 1, 1, 1,
-0.7704032, 0.3961492, -2.125451, 1, 1, 1, 1, 1,
-0.7567423, 0.101219, -3.186659, 1, 1, 1, 1, 1,
-0.7562207, -1.145069, -1.94646, 1, 1, 1, 1, 1,
-0.7462837, 0.8212954, -0.4121507, 1, 1, 1, 1, 1,
-0.7412432, -0.3149562, -1.090471, 0, 0, 1, 1, 1,
-0.7354591, -0.5010806, -0.9692835, 1, 0, 0, 1, 1,
-0.7352501, 0.3828411, -1.596087, 1, 0, 0, 1, 1,
-0.7326616, -0.8224083, -2.744432, 1, 0, 0, 1, 1,
-0.7307674, 0.77311, -3.396833, 1, 0, 0, 1, 1,
-0.7274863, 1.420051, -0.4130731, 1, 0, 0, 1, 1,
-0.7164235, 1.266966, -0.02771562, 0, 0, 0, 1, 1,
-0.7164127, 0.590588, -0.1443383, 0, 0, 0, 1, 1,
-0.7160452, -1.476582, -2.827796, 0, 0, 0, 1, 1,
-0.7142157, 1.533844, -0.4351591, 0, 0, 0, 1, 1,
-0.7116036, -0.0217693, -1.592917, 0, 0, 0, 1, 1,
-0.7104558, 0.259977, 0.3363695, 0, 0, 0, 1, 1,
-0.7018439, -1.752867, -2.982757, 0, 0, 0, 1, 1,
-0.6987769, -0.390386, -0.5547339, 1, 1, 1, 1, 1,
-0.6980779, 0.0758279, -1.4083, 1, 1, 1, 1, 1,
-0.6963602, 0.08087985, -1.238047, 1, 1, 1, 1, 1,
-0.6931657, -0.7630373, -2.326625, 1, 1, 1, 1, 1,
-0.6907733, 0.5388077, -1.612437, 1, 1, 1, 1, 1,
-0.6879267, 0.8217723, -0.4125708, 1, 1, 1, 1, 1,
-0.6835498, -1.172797, -2.080935, 1, 1, 1, 1, 1,
-0.6786858, 0.7083619, -0.7657793, 1, 1, 1, 1, 1,
-0.6785969, 0.3394462, 0.8627472, 1, 1, 1, 1, 1,
-0.6698917, 0.7838897, 1.597631, 1, 1, 1, 1, 1,
-0.6691235, 0.6670304, -0.1957058, 1, 1, 1, 1, 1,
-0.6688439, -1.581052, -1.387365, 1, 1, 1, 1, 1,
-0.6662492, 0.9551386, 1.107509, 1, 1, 1, 1, 1,
-0.6662071, -1.993562, -3.591066, 1, 1, 1, 1, 1,
-0.6646275, -0.5334625, -2.475637, 1, 1, 1, 1, 1,
-0.6634553, 0.535594, -0.4220164, 0, 0, 1, 1, 1,
-0.6610775, -1.011511, -2.039786, 1, 0, 0, 1, 1,
-0.655849, -0.003854244, -1.795033, 1, 0, 0, 1, 1,
-0.6439163, -0.8564512, -2.638231, 1, 0, 0, 1, 1,
-0.6437388, 1.300109, -0.452124, 1, 0, 0, 1, 1,
-0.6399142, -0.900831, -4.309318, 1, 0, 0, 1, 1,
-0.6348825, -0.1813827, -3.346605, 0, 0, 0, 1, 1,
-0.6327843, 0.5486293, -0.8371505, 0, 0, 0, 1, 1,
-0.6297525, -1.900984, -3.454988, 0, 0, 0, 1, 1,
-0.6244383, -0.1228526, -0.8647522, 0, 0, 0, 1, 1,
-0.6238018, 0.5128281, 0.4309694, 0, 0, 0, 1, 1,
-0.6216635, -1.210603, -3.855394, 0, 0, 0, 1, 1,
-0.6184009, 1.417254, 0.4883286, 0, 0, 0, 1, 1,
-0.6147574, 2.114577, -1.002995, 1, 1, 1, 1, 1,
-0.6037951, -0.8106595, -2.390577, 1, 1, 1, 1, 1,
-0.5973272, -0.7788547, -0.09674653, 1, 1, 1, 1, 1,
-0.5943252, -0.9912226, -1.334746, 1, 1, 1, 1, 1,
-0.5925091, 0.07811312, -1.764146, 1, 1, 1, 1, 1,
-0.5871507, -0.3083892, -1.145126, 1, 1, 1, 1, 1,
-0.5869666, 0.2942286, -1.351843, 1, 1, 1, 1, 1,
-0.5786475, -0.9329475, -2.546777, 1, 1, 1, 1, 1,
-0.5730653, 1.224338, -0.004874617, 1, 1, 1, 1, 1,
-0.5716419, 1.463868, 0.2936303, 1, 1, 1, 1, 1,
-0.5695228, 1.481085, 0.1855659, 1, 1, 1, 1, 1,
-0.5685633, 0.271344, -0.2374737, 1, 1, 1, 1, 1,
-0.5664079, -0.9498317, -3.132624, 1, 1, 1, 1, 1,
-0.5658136, 0.4988852, -0.3307482, 1, 1, 1, 1, 1,
-0.5648553, 0.6067427, 0.6710094, 1, 1, 1, 1, 1,
-0.56149, 0.5042444, -1.044338, 0, 0, 1, 1, 1,
-0.5579102, -1.015146, -2.309495, 1, 0, 0, 1, 1,
-0.5573519, -1.104011, -3.897597, 1, 0, 0, 1, 1,
-0.5515303, 0.5630832, -0.0519431, 1, 0, 0, 1, 1,
-0.5486885, -1.238594, -3.167866, 1, 0, 0, 1, 1,
-0.5480133, -0.7780028, -2.719075, 1, 0, 0, 1, 1,
-0.5440043, -1.463909, -3.909967, 0, 0, 0, 1, 1,
-0.5396683, -0.1029813, -0.153535, 0, 0, 0, 1, 1,
-0.5380138, 1.306012, -0.7284302, 0, 0, 0, 1, 1,
-0.5305026, -0.3364632, -1.119939, 0, 0, 0, 1, 1,
-0.5301082, 0.3798169, -0.869954, 0, 0, 0, 1, 1,
-0.5239269, 0.2580397, -2.566727, 0, 0, 0, 1, 1,
-0.5220089, -0.3718967, -1.239498, 0, 0, 0, 1, 1,
-0.5136307, -0.04288211, -2.060572, 1, 1, 1, 1, 1,
-0.5129045, 0.1838299, -3.292444, 1, 1, 1, 1, 1,
-0.5101904, -0.4451407, -1.160435, 1, 1, 1, 1, 1,
-0.4945323, -1.519385, -1.218812, 1, 1, 1, 1, 1,
-0.4932051, -0.02313732, -1.792415, 1, 1, 1, 1, 1,
-0.4895329, -1.033621, -3.142607, 1, 1, 1, 1, 1,
-0.4833338, -0.5735386, -2.27768, 1, 1, 1, 1, 1,
-0.4817504, -0.07544892, -2.765306, 1, 1, 1, 1, 1,
-0.4806249, 1.667158, -0.5811932, 1, 1, 1, 1, 1,
-0.4763184, -1.126989, -4.027628, 1, 1, 1, 1, 1,
-0.4759248, -0.5496455, -1.141323, 1, 1, 1, 1, 1,
-0.4749976, -0.2545272, -0.817539, 1, 1, 1, 1, 1,
-0.471813, -0.5599672, -2.59398, 1, 1, 1, 1, 1,
-0.4717636, -0.06355055, -0.8208699, 1, 1, 1, 1, 1,
-0.4716256, -0.562112, -2.419312, 1, 1, 1, 1, 1,
-0.4691387, -0.7348005, 0.0179315, 0, 0, 1, 1, 1,
-0.4678251, 2.773988, -0.2644568, 1, 0, 0, 1, 1,
-0.464505, 2.193833, -1.287257, 1, 0, 0, 1, 1,
-0.4533165, 1.240913, -0.766152, 1, 0, 0, 1, 1,
-0.4523512, -0.4802242, -2.41397, 1, 0, 0, 1, 1,
-0.4507284, 2.204934, -1.082361, 1, 0, 0, 1, 1,
-0.4485126, 0.00188188, -2.734047, 0, 0, 0, 1, 1,
-0.4476063, 0.05605426, -1.076427, 0, 0, 0, 1, 1,
-0.4470823, 0.08745568, -2.272376, 0, 0, 0, 1, 1,
-0.4418997, -1.695378, -2.566702, 0, 0, 0, 1, 1,
-0.4411021, -0.4011466, -1.914204, 0, 0, 0, 1, 1,
-0.4385562, -1.908469, -5.162288, 0, 0, 0, 1, 1,
-0.4372751, -0.112673, -3.261005, 0, 0, 0, 1, 1,
-0.4319951, 1.333297, 0.4376145, 1, 1, 1, 1, 1,
-0.4276574, 2.142806, -0.1619181, 1, 1, 1, 1, 1,
-0.4271577, 0.6213535, 0.6926482, 1, 1, 1, 1, 1,
-0.4251471, -0.01154848, -2.323224, 1, 1, 1, 1, 1,
-0.4181119, 0.7817918, 0.9223644, 1, 1, 1, 1, 1,
-0.4142113, 0.9516991, -1.819565, 1, 1, 1, 1, 1,
-0.4114632, 0.4368259, -2.138004, 1, 1, 1, 1, 1,
-0.4110524, 1.241516, -0.4723525, 1, 1, 1, 1, 1,
-0.4008296, -0.4855147, -2.657987, 1, 1, 1, 1, 1,
-0.3993983, 0.07755303, -1.093212, 1, 1, 1, 1, 1,
-0.3989943, -0.2277607, -2.920213, 1, 1, 1, 1, 1,
-0.3989303, 1.154099, 0.5322652, 1, 1, 1, 1, 1,
-0.3970946, 0.07284839, -2.829495, 1, 1, 1, 1, 1,
-0.3970778, 0.1861529, -0.7720814, 1, 1, 1, 1, 1,
-0.3967053, 1.839494, -1.092428, 1, 1, 1, 1, 1,
-0.3958314, 0.494494, -0.4648574, 0, 0, 1, 1, 1,
-0.3914356, 0.4183965, -1.359302, 1, 0, 0, 1, 1,
-0.3881238, -0.8049018, -3.121938, 1, 0, 0, 1, 1,
-0.3875777, 0.3192489, -1.528986, 1, 0, 0, 1, 1,
-0.3856568, 0.3371373, 0.5609426, 1, 0, 0, 1, 1,
-0.3831457, -1.259879, -1.909196, 1, 0, 0, 1, 1,
-0.3818925, -0.9278648, -3.74097, 0, 0, 0, 1, 1,
-0.3796163, 0.4312587, 0.6075484, 0, 0, 0, 1, 1,
-0.3776611, -2.177325, -3.251778, 0, 0, 0, 1, 1,
-0.375719, 1.476725, -0.2189559, 0, 0, 0, 1, 1,
-0.3750309, -0.8633926, -4.023468, 0, 0, 0, 1, 1,
-0.3737375, 1.063135, -1.775602, 0, 0, 0, 1, 1,
-0.3714066, -1.374622, -4.205796, 0, 0, 0, 1, 1,
-0.3713376, -0.9229246, -2.81829, 1, 1, 1, 1, 1,
-0.3692823, -0.4792114, -3.179925, 1, 1, 1, 1, 1,
-0.3679421, -0.9505348, -3.737652, 1, 1, 1, 1, 1,
-0.3660988, 0.5156918, 0.0482562, 1, 1, 1, 1, 1,
-0.3634434, 0.4272737, -0.1938951, 1, 1, 1, 1, 1,
-0.3606386, -1.293145, -2.52373, 1, 1, 1, 1, 1,
-0.3595055, -0.1136898, -1.905883, 1, 1, 1, 1, 1,
-0.3586727, -0.5961498, -3.36065, 1, 1, 1, 1, 1,
-0.3529332, 0.6101411, 1.152523, 1, 1, 1, 1, 1,
-0.3518573, 1.342934, 1.219269, 1, 1, 1, 1, 1,
-0.3494354, 0.7353436, 1.002741, 1, 1, 1, 1, 1,
-0.3490074, -0.2279518, -0.5037755, 1, 1, 1, 1, 1,
-0.3473305, -0.2197163, -2.531679, 1, 1, 1, 1, 1,
-0.3410826, -0.3828737, -2.437657, 1, 1, 1, 1, 1,
-0.340483, -0.9774804, -3.015417, 1, 1, 1, 1, 1,
-0.340022, -0.3518499, -4.4, 0, 0, 1, 1, 1,
-0.3391624, -0.4407837, -4.323181, 1, 0, 0, 1, 1,
-0.3359601, -0.3582892, -2.440635, 1, 0, 0, 1, 1,
-0.3310345, -0.4090062, -2.297228, 1, 0, 0, 1, 1,
-0.3308781, 1.021619, -0.6464126, 1, 0, 0, 1, 1,
-0.3304194, 0.09656911, -0.9779296, 1, 0, 0, 1, 1,
-0.3284107, 1.660224, 0.7388784, 0, 0, 0, 1, 1,
-0.3246401, 0.7346317, -0.1395248, 0, 0, 0, 1, 1,
-0.3242624, 0.7455676, -0.2492673, 0, 0, 0, 1, 1,
-0.3240896, -0.4315444, -1.969231, 0, 0, 0, 1, 1,
-0.3214211, 1.255639, -0.8280334, 0, 0, 0, 1, 1,
-0.3176554, -1.167147, -4.984663, 0, 0, 0, 1, 1,
-0.3172388, 1.707162, -0.8217839, 0, 0, 0, 1, 1,
-0.3112427, 0.001403596, -1.905817, 1, 1, 1, 1, 1,
-0.3065414, 0.1698351, -1.767379, 1, 1, 1, 1, 1,
-0.3061528, -1.29395, -2.496123, 1, 1, 1, 1, 1,
-0.3041571, -0.1454753, -1.314605, 1, 1, 1, 1, 1,
-0.2990444, -0.7662439, -2.051168, 1, 1, 1, 1, 1,
-0.2988511, -0.9085202, -0.763431, 1, 1, 1, 1, 1,
-0.2928987, 1.376477, 1.45894, 1, 1, 1, 1, 1,
-0.2921622, 0.7598144, 1.160242, 1, 1, 1, 1, 1,
-0.2887376, 0.4817687, -0.7652082, 1, 1, 1, 1, 1,
-0.287809, 1.054759, -0.5613082, 1, 1, 1, 1, 1,
-0.2851859, 0.6528563, -0.1639704, 1, 1, 1, 1, 1,
-0.2818519, -1.137894, -4.015359, 1, 1, 1, 1, 1,
-0.2766693, 1.195289, -0.7327887, 1, 1, 1, 1, 1,
-0.2752604, 1.046072, -0.8076441, 1, 1, 1, 1, 1,
-0.270915, -1.229638, -2.500919, 1, 1, 1, 1, 1,
-0.2639972, 0.1440128, 0.645853, 0, 0, 1, 1, 1,
-0.2630025, -1.535982, -1.842041, 1, 0, 0, 1, 1,
-0.2624485, 0.648659, -1.848229, 1, 0, 0, 1, 1,
-0.2539292, -0.4586584, -2.780733, 1, 0, 0, 1, 1,
-0.2523535, -0.6209576, -3.48544, 1, 0, 0, 1, 1,
-0.2484675, 0.753256, -0.1176485, 1, 0, 0, 1, 1,
-0.2466563, 0.8865422, 0.1098466, 0, 0, 0, 1, 1,
-0.2465248, 1.351176, 0.1515024, 0, 0, 0, 1, 1,
-0.2452052, -0.8900653, -1.56663, 0, 0, 0, 1, 1,
-0.245165, -0.2917653, -1.052023, 0, 0, 0, 1, 1,
-0.2429172, -1.147751, -1.433263, 0, 0, 0, 1, 1,
-0.2416085, -0.7618666, -3.521456, 0, 0, 0, 1, 1,
-0.2382196, -0.8856961, -4.23261, 0, 0, 0, 1, 1,
-0.2376518, -0.2081661, -1.56503, 1, 1, 1, 1, 1,
-0.2271719, -0.3113846, -3.384036, 1, 1, 1, 1, 1,
-0.2253011, -0.2024769, -3.48403, 1, 1, 1, 1, 1,
-0.2238969, -0.2736774, -1.903711, 1, 1, 1, 1, 1,
-0.2198008, 0.04841487, -1.066241, 1, 1, 1, 1, 1,
-0.2176738, 1.140636, 0.04139247, 1, 1, 1, 1, 1,
-0.2103516, -1.318683, -3.669024, 1, 1, 1, 1, 1,
-0.2056219, -0.5043325, -1.305667, 1, 1, 1, 1, 1,
-0.2041553, 0.1011735, -1.485967, 1, 1, 1, 1, 1,
-0.2024531, -0.5350623, -1.750247, 1, 1, 1, 1, 1,
-0.2017653, 0.8413045, 0.5678981, 1, 1, 1, 1, 1,
-0.1984773, -2.075123, -3.228866, 1, 1, 1, 1, 1,
-0.1974555, -0.3183337, -3.160578, 1, 1, 1, 1, 1,
-0.1964344, -2.075766, -4.762615, 1, 1, 1, 1, 1,
-0.1951185, 0.8933916, 0.9336776, 1, 1, 1, 1, 1,
-0.1942774, 0.1665678, -1.494237, 0, 0, 1, 1, 1,
-0.1936892, -0.4607934, -0.7294666, 1, 0, 0, 1, 1,
-0.1902805, 0.3692565, -2.123302, 1, 0, 0, 1, 1,
-0.1879469, -1.035466, -4.70944, 1, 0, 0, 1, 1,
-0.185515, 0.5492937, 0.464278, 1, 0, 0, 1, 1,
-0.1809118, 1.957963, 1.207861, 1, 0, 0, 1, 1,
-0.1792902, -0.2675707, -2.63428, 0, 0, 0, 1, 1,
-0.1788763, 0.2744048, -0.7425227, 0, 0, 0, 1, 1,
-0.1774686, -0.4021597, -2.104424, 0, 0, 0, 1, 1,
-0.1735221, 0.2560337, -0.2596972, 0, 0, 0, 1, 1,
-0.1730996, 0.5996999, 0.5720968, 0, 0, 0, 1, 1,
-0.1727966, -0.6502333, -2.99371, 0, 0, 0, 1, 1,
-0.1727049, 1.202379, -0.9341605, 0, 0, 0, 1, 1,
-0.1702117, 0.4440992, 0.5690018, 1, 1, 1, 1, 1,
-0.1678448, 0.6481084, -0.5389809, 1, 1, 1, 1, 1,
-0.1627348, -0.08815998, -3.32128, 1, 1, 1, 1, 1,
-0.1596244, 0.9423237, -1.254876, 1, 1, 1, 1, 1,
-0.1589852, 0.1381564, -1.974309, 1, 1, 1, 1, 1,
-0.1587586, 0.1982703, 0.7526479, 1, 1, 1, 1, 1,
-0.1581752, -0.7191643, -2.505748, 1, 1, 1, 1, 1,
-0.1515434, -1.415857, -2.074602, 1, 1, 1, 1, 1,
-0.1420068, 2.067232, 0.03010999, 1, 1, 1, 1, 1,
-0.1336252, -0.4891507, -3.891035, 1, 1, 1, 1, 1,
-0.1286253, 0.3788416, 1.562988, 1, 1, 1, 1, 1,
-0.1258223, -0.1709063, -4.926883, 1, 1, 1, 1, 1,
-0.1244069, 0.2739005, -1.798423, 1, 1, 1, 1, 1,
-0.1201396, -0.7208475, -2.851598, 1, 1, 1, 1, 1,
-0.1200273, -1.348208, -0.6810244, 1, 1, 1, 1, 1,
-0.1191601, -0.5164078, -1.812636, 0, 0, 1, 1, 1,
-0.1184617, 1.439527, 0.1379231, 1, 0, 0, 1, 1,
-0.117807, 0.2962604, -0.4355388, 1, 0, 0, 1, 1,
-0.1177811, 0.0880807, -1.46113, 1, 0, 0, 1, 1,
-0.1166742, 0.5348119, -1.123238, 1, 0, 0, 1, 1,
-0.1133757, 0.7137305, 0.9029087, 1, 0, 0, 1, 1,
-0.110475, -0.3526867, -0.8008779, 0, 0, 0, 1, 1,
-0.1058081, 1.593514, 1.054868, 0, 0, 0, 1, 1,
-0.1052958, -0.6327357, -2.646549, 0, 0, 0, 1, 1,
-0.1012801, -0.9643895, -2.39484, 0, 0, 0, 1, 1,
-0.09852746, -1.031538, -2.299742, 0, 0, 0, 1, 1,
-0.09823186, 0.6705475, 1.158064, 0, 0, 0, 1, 1,
-0.09800591, -0.2097794, -1.949106, 0, 0, 0, 1, 1,
-0.09228099, 1.115298, -1.869706, 1, 1, 1, 1, 1,
-0.0914676, 1.464841, -1.158683, 1, 1, 1, 1, 1,
-0.09121823, 0.4248034, 0.03682053, 1, 1, 1, 1, 1,
-0.09113141, 0.410629, -0.770358, 1, 1, 1, 1, 1,
-0.09101948, -0.9138457, -3.810498, 1, 1, 1, 1, 1,
-0.08845, -0.4173364, -2.365614, 1, 1, 1, 1, 1,
-0.08600343, 0.2611552, 0.5905262, 1, 1, 1, 1, 1,
-0.08481433, -0.9999476, -1.487448, 1, 1, 1, 1, 1,
-0.07674006, 0.8007621, -0.7153431, 1, 1, 1, 1, 1,
-0.07489433, 1.383501, -2.497772, 1, 1, 1, 1, 1,
-0.07456488, 0.09000543, -0.5741373, 1, 1, 1, 1, 1,
-0.07217813, -0.6121981, -4.118974, 1, 1, 1, 1, 1,
-0.07011741, -0.3519653, -3.022926, 1, 1, 1, 1, 1,
-0.06960797, 0.1503982, -1.606963, 1, 1, 1, 1, 1,
-0.06873264, -1.665815, -4.427369, 1, 1, 1, 1, 1,
-0.06864495, 0.3391403, 0.2013149, 0, 0, 1, 1, 1,
-0.06642503, -0.4884997, -2.569578, 1, 0, 0, 1, 1,
-0.05783956, 0.2941522, 0.247417, 1, 0, 0, 1, 1,
-0.05779815, 2.033431, 0.0449754, 1, 0, 0, 1, 1,
-0.05558566, 0.4504556, -0.6277003, 1, 0, 0, 1, 1,
-0.05486109, 0.3888313, -0.8305322, 1, 0, 0, 1, 1,
-0.05183621, 1.624194, -1.127719, 0, 0, 0, 1, 1,
-0.0486166, -0.776255, -1.770191, 0, 0, 0, 1, 1,
-0.04786358, -1.456696, -4.108795, 0, 0, 0, 1, 1,
-0.04503064, 1.471946, -1.477636, 0, 0, 0, 1, 1,
-0.04502135, -1.258399, -2.963671, 0, 0, 0, 1, 1,
-0.04456602, -0.9869487, -3.831137, 0, 0, 0, 1, 1,
-0.04443273, 1.137408, -1.849734, 0, 0, 0, 1, 1,
-0.04302901, -1.13823, -3.830831, 1, 1, 1, 1, 1,
-0.04222594, -0.3451567, -4.603109, 1, 1, 1, 1, 1,
-0.04087168, -0.0008165836, -0.7155462, 1, 1, 1, 1, 1,
-0.03817926, -0.6702309, -1.794619, 1, 1, 1, 1, 1,
-0.03758401, -0.1731737, -3.645442, 1, 1, 1, 1, 1,
-0.02638219, -0.01979558, -3.436733, 1, 1, 1, 1, 1,
-0.02098407, -0.6836298, -2.793777, 1, 1, 1, 1, 1,
-0.01775613, 0.4157397, -1.433576, 1, 1, 1, 1, 1,
-0.01769402, 0.7448199, -0.1638396, 1, 1, 1, 1, 1,
-0.01671576, 0.620454, -0.2093463, 1, 1, 1, 1, 1,
-0.01630913, 0.6912511, 1.678246, 1, 1, 1, 1, 1,
-0.01559966, 0.372164, 0.1523773, 1, 1, 1, 1, 1,
-0.01403114, -1.654924, -4.018894, 1, 1, 1, 1, 1,
-0.01139218, 1.768249, -0.3330995, 1, 1, 1, 1, 1,
-0.008648818, 1.479578, 2.230851, 1, 1, 1, 1, 1,
-0.006743523, -0.1329175, -2.367432, 0, 0, 1, 1, 1,
-0.005729609, 0.4725994, -0.2770012, 1, 0, 0, 1, 1,
-0.0006792538, -2.013504, -3.576886, 1, 0, 0, 1, 1,
0.0005796219, 0.1570173, -0.7089481, 1, 0, 0, 1, 1,
0.009259447, -0.1527516, 2.017639, 1, 0, 0, 1, 1,
0.01398351, 0.4794755, 0.7489165, 1, 0, 0, 1, 1,
0.01624906, -1.531809, 3.394478, 0, 0, 0, 1, 1,
0.02424629, 0.0348926, 1.551803, 0, 0, 0, 1, 1,
0.02480622, -1.136245, 4.693502, 0, 0, 0, 1, 1,
0.02843239, -0.9535778, 2.877595, 0, 0, 0, 1, 1,
0.03316712, 2.011326, 1.042417, 0, 0, 0, 1, 1,
0.034628, 1.637036, -0.01672242, 0, 0, 0, 1, 1,
0.03587787, -0.2612841, 2.100827, 0, 0, 0, 1, 1,
0.03593144, 0.6410194, 0.1318867, 1, 1, 1, 1, 1,
0.03598972, 1.120784, 0.04020745, 1, 1, 1, 1, 1,
0.0391572, -1.550862, 5.184231, 1, 1, 1, 1, 1,
0.04629907, 0.6932292, -0.290854, 1, 1, 1, 1, 1,
0.04696949, -0.5410212, 2.229472, 1, 1, 1, 1, 1,
0.04792941, -0.8598447, 3.651647, 1, 1, 1, 1, 1,
0.05048475, -1.811458, 2.918122, 1, 1, 1, 1, 1,
0.05219328, 1.123296, -1.997863, 1, 1, 1, 1, 1,
0.05272166, 2.276716, 1.406394, 1, 1, 1, 1, 1,
0.05284419, -0.4200529, 3.813851, 1, 1, 1, 1, 1,
0.0552774, -0.124604, 2.345956, 1, 1, 1, 1, 1,
0.06016612, 0.309734, -0.7949011, 1, 1, 1, 1, 1,
0.06553891, 1.215811, 0.5491635, 1, 1, 1, 1, 1,
0.06985004, 0.3730433, -1.210294, 1, 1, 1, 1, 1,
0.07306486, -1.302867, 2.900746, 1, 1, 1, 1, 1,
0.0746049, -0.9030374, 2.62474, 0, 0, 1, 1, 1,
0.07584736, 0.5099986, -2.547753, 1, 0, 0, 1, 1,
0.07705554, -1.012199, 4.305485, 1, 0, 0, 1, 1,
0.07913907, 2.075171, 2.349542, 1, 0, 0, 1, 1,
0.07942577, 0.8242539, 0.6075662, 1, 0, 0, 1, 1,
0.08142048, -0.4314962, 3.777209, 1, 0, 0, 1, 1,
0.08250301, 1.045333, 0.1179555, 0, 0, 0, 1, 1,
0.08446125, -1.556884, 1.63229, 0, 0, 0, 1, 1,
0.08734044, -0.7166402, 3.536035, 0, 0, 0, 1, 1,
0.087726, -0.300622, 3.653048, 0, 0, 0, 1, 1,
0.08968458, -1.772172, 2.547275, 0, 0, 0, 1, 1,
0.09205274, -1.644243, 4.875326, 0, 0, 0, 1, 1,
0.0948726, 0.581529, -1.119119, 0, 0, 0, 1, 1,
0.09632494, -0.3726641, 2.775295, 1, 1, 1, 1, 1,
0.0964479, -0.26244, 2.080921, 1, 1, 1, 1, 1,
0.09683425, -1.10453, 2.75286, 1, 1, 1, 1, 1,
0.09684299, -0.06144412, 1.464073, 1, 1, 1, 1, 1,
0.1012812, -0.3294325, 2.745055, 1, 1, 1, 1, 1,
0.1016951, 0.7218499, -0.2350831, 1, 1, 1, 1, 1,
0.1018536, -0.6905572, 2.611518, 1, 1, 1, 1, 1,
0.1030794, 0.8030036, -0.9338315, 1, 1, 1, 1, 1,
0.1038607, 1.803356, 0.2358324, 1, 1, 1, 1, 1,
0.1039745, 1.333455, 0.1920269, 1, 1, 1, 1, 1,
0.1052965, -0.6880199, 2.438836, 1, 1, 1, 1, 1,
0.1056291, 0.5187433, -1.36282, 1, 1, 1, 1, 1,
0.106698, 1.917146, 0.9983081, 1, 1, 1, 1, 1,
0.1081509, -1.208741, 2.602379, 1, 1, 1, 1, 1,
0.1126179, 0.5960703, 1.838279, 1, 1, 1, 1, 1,
0.1185902, 1.266663, -0.3489489, 0, 0, 1, 1, 1,
0.1231638, -0.119321, 1.880717, 1, 0, 0, 1, 1,
0.1255417, -0.3292495, 3.219735, 1, 0, 0, 1, 1,
0.1279211, 0.4270394, 2.38152, 1, 0, 0, 1, 1,
0.1287914, -0.02276415, 1.698147, 1, 0, 0, 1, 1,
0.1358944, 1.077649, 0.3426803, 1, 0, 0, 1, 1,
0.1368939, -1.653721, 3.652334, 0, 0, 0, 1, 1,
0.1371371, 0.499958, 2.366184, 0, 0, 0, 1, 1,
0.1375668, -0.3417487, 2.490588, 0, 0, 0, 1, 1,
0.1399965, 1.891674, -0.223133, 0, 0, 0, 1, 1,
0.1415674, -1.300281, 2.553725, 0, 0, 0, 1, 1,
0.1484085, 0.04621581, 0.4584804, 0, 0, 0, 1, 1,
0.1509102, -0.4909682, 3.877656, 0, 0, 0, 1, 1,
0.1585767, -1.203821, 4.079455, 1, 1, 1, 1, 1,
0.159687, -1.507474, 2.719487, 1, 1, 1, 1, 1,
0.1614814, 0.1052192, 1.220829, 1, 1, 1, 1, 1,
0.1621081, 2.248622, 0.4105693, 1, 1, 1, 1, 1,
0.1670024, 0.6642605, -0.04998673, 1, 1, 1, 1, 1,
0.1704582, -0.8579325, 2.841921, 1, 1, 1, 1, 1,
0.1731122, 0.718914, -0.09383316, 1, 1, 1, 1, 1,
0.1737224, 0.6999152, -0.0802051, 1, 1, 1, 1, 1,
0.1756906, -0.02727219, 2.01324, 1, 1, 1, 1, 1,
0.1781791, 1.040476, 1.38098, 1, 1, 1, 1, 1,
0.1792328, -0.3738013, 2.90403, 1, 1, 1, 1, 1,
0.1819093, 0.6443467, -0.288346, 1, 1, 1, 1, 1,
0.1832892, 0.01442933, 2.753589, 1, 1, 1, 1, 1,
0.1880418, 1.527956, 2.118293, 1, 1, 1, 1, 1,
0.1890247, 0.3896213, -0.2404752, 1, 1, 1, 1, 1,
0.1936761, 1.064454, -0.4589209, 0, 0, 1, 1, 1,
0.1952268, 0.166172, 1.386401, 1, 0, 0, 1, 1,
0.1963185, 0.1542856, 2.778107, 1, 0, 0, 1, 1,
0.1967647, 1.442912, 0.8842691, 1, 0, 0, 1, 1,
0.2019385, 0.1505791, 0.9073905, 1, 0, 0, 1, 1,
0.2024578, 0.7102242, 0.2191953, 1, 0, 0, 1, 1,
0.2058355, -3.457628, 3.911587, 0, 0, 0, 1, 1,
0.2073775, -0.09626245, 0.4616372, 0, 0, 0, 1, 1,
0.2104725, -0.6117542, 3.350787, 0, 0, 0, 1, 1,
0.2108207, 0.2936157, -0.3143139, 0, 0, 0, 1, 1,
0.2124389, -0.7826378, 2.080974, 0, 0, 0, 1, 1,
0.2148872, -0.3219695, 2.552289, 0, 0, 0, 1, 1,
0.216304, -0.1799489, 2.699456, 0, 0, 0, 1, 1,
0.2164575, 2.148046, -0.6758402, 1, 1, 1, 1, 1,
0.2197216, -1.627986, 2.811983, 1, 1, 1, 1, 1,
0.2233804, 2.503548, 0.1564726, 1, 1, 1, 1, 1,
0.2279372, -0.9040955, 1.687657, 1, 1, 1, 1, 1,
0.2279412, 0.4282165, -0.1207094, 1, 1, 1, 1, 1,
0.2288462, -0.2049991, 0.2045914, 1, 1, 1, 1, 1,
0.2303066, 1.038818, 0.7901617, 1, 1, 1, 1, 1,
0.2331326, 0.9471094, 0.5378929, 1, 1, 1, 1, 1,
0.2340751, -0.5380305, 2.224355, 1, 1, 1, 1, 1,
0.2395551, 0.3725552, -0.1668581, 1, 1, 1, 1, 1,
0.2467502, -0.7976094, 1.981771, 1, 1, 1, 1, 1,
0.2468284, -2.315723, 3.401726, 1, 1, 1, 1, 1,
0.2480433, 0.8207318, 1.930521, 1, 1, 1, 1, 1,
0.248607, -1.019409, 2.295224, 1, 1, 1, 1, 1,
0.2552628, -1.521563, 3.510382, 1, 1, 1, 1, 1,
0.2558794, -0.1900293, 3.67016, 0, 0, 1, 1, 1,
0.2560138, 0.3527852, 0.01769718, 1, 0, 0, 1, 1,
0.256209, -0.9233482, 4.043605, 1, 0, 0, 1, 1,
0.256699, 1.009048, 0.7924194, 1, 0, 0, 1, 1,
0.2596876, -1.548623, 2.392662, 1, 0, 0, 1, 1,
0.2605266, -1.436538, 2.808905, 1, 0, 0, 1, 1,
0.26746, -0.9989806, 1.367313, 0, 0, 0, 1, 1,
0.2696992, 0.4269886, 0.01086492, 0, 0, 0, 1, 1,
0.2697868, -0.3424776, 1.915026, 0, 0, 0, 1, 1,
0.271858, -1.113525, 1.896469, 0, 0, 0, 1, 1,
0.2720258, -0.02721417, 2.362286, 0, 0, 0, 1, 1,
0.2797987, 0.5377176, 0.8852394, 0, 0, 0, 1, 1,
0.2891017, 0.5506774, 1.907102, 0, 0, 0, 1, 1,
0.2907718, 1.789893, -1.142249, 1, 1, 1, 1, 1,
0.2941237, 0.5819418, 1.873026, 1, 1, 1, 1, 1,
0.297809, -0.06936482, 1.756858, 1, 1, 1, 1, 1,
0.3012926, 0.4132882, 1.137824, 1, 1, 1, 1, 1,
0.3014439, -1.18926, 2.949757, 1, 1, 1, 1, 1,
0.3083152, -0.8244654, 1.529254, 1, 1, 1, 1, 1,
0.3167017, -1.257469, 5.333389, 1, 1, 1, 1, 1,
0.3182931, -0.2921959, 2.769255, 1, 1, 1, 1, 1,
0.321581, 0.01537509, 2.481646, 1, 1, 1, 1, 1,
0.3235719, -1.243159, 3.045727, 1, 1, 1, 1, 1,
0.3256638, -1.17228, 2.769025, 1, 1, 1, 1, 1,
0.3261746, 1.359923, 0.7965819, 1, 1, 1, 1, 1,
0.3273742, -0.03187627, 0.575417, 1, 1, 1, 1, 1,
0.331403, 0.2765296, 1.547762, 1, 1, 1, 1, 1,
0.3336483, -2.40316, 2.661057, 1, 1, 1, 1, 1,
0.3382847, -0.1651598, 2.946939, 0, 0, 1, 1, 1,
0.3472281, -0.01553207, 2.055455, 1, 0, 0, 1, 1,
0.3501416, 0.8159776, -0.7083882, 1, 0, 0, 1, 1,
0.3528621, 0.4843446, 2.173963, 1, 0, 0, 1, 1,
0.3555373, -1.538587, 1.544957, 1, 0, 0, 1, 1,
0.3580383, 0.7057138, 1.611367, 1, 0, 0, 1, 1,
0.3582777, -1.1381, 2.716017, 0, 0, 0, 1, 1,
0.3584729, 1.667029, 0.3247966, 0, 0, 0, 1, 1,
0.3588038, -0.9611068, 3.768862, 0, 0, 0, 1, 1,
0.3601245, -0.2555132, 2.148907, 0, 0, 0, 1, 1,
0.3640614, 0.6051392, 1.783292, 0, 0, 0, 1, 1,
0.3651939, 0.3028734, 0.2379011, 0, 0, 0, 1, 1,
0.3664294, -2.008254, 1.580709, 0, 0, 0, 1, 1,
0.3688267, -0.142778, -0.1943837, 1, 1, 1, 1, 1,
0.3695549, -1.249515, 2.420845, 1, 1, 1, 1, 1,
0.3727876, -0.730288, 0.6438649, 1, 1, 1, 1, 1,
0.3731319, -2.096886, 4.200479, 1, 1, 1, 1, 1,
0.3764449, -0.677919, 2.168461, 1, 1, 1, 1, 1,
0.3804562, -1.292455, 2.578041, 1, 1, 1, 1, 1,
0.3833261, 1.019918, -1.099383, 1, 1, 1, 1, 1,
0.385489, 0.4847464, 0.03110509, 1, 1, 1, 1, 1,
0.3878729, -1.066739, 2.830905, 1, 1, 1, 1, 1,
0.3886182, 0.21944, 2.006819, 1, 1, 1, 1, 1,
0.3895278, 0.06808428, 2.191519, 1, 1, 1, 1, 1,
0.3911103, 1.617717, -0.3049342, 1, 1, 1, 1, 1,
0.3912282, -0.7596446, 2.862641, 1, 1, 1, 1, 1,
0.4005575, -0.7506562, 1.900054, 1, 1, 1, 1, 1,
0.402395, 0.1443672, 1.389754, 1, 1, 1, 1, 1,
0.4045025, -0.7943372, 3.571834, 0, 0, 1, 1, 1,
0.4059432, 0.2278, 3.226458, 1, 0, 0, 1, 1,
0.4212579, 1.763344, 2.403491, 1, 0, 0, 1, 1,
0.426144, -0.4405566, 2.632973, 1, 0, 0, 1, 1,
0.4306071, 0.4546838, 0.9421357, 1, 0, 0, 1, 1,
0.4333177, -1.462426, 2.645755, 1, 0, 0, 1, 1,
0.4354661, 0.7482511, -0.212323, 0, 0, 0, 1, 1,
0.4369062, 0.234322, -0.2778231, 0, 0, 0, 1, 1,
0.4395004, 0.1081024, 2.521504, 0, 0, 0, 1, 1,
0.4434228, -1.339975, 0.9756133, 0, 0, 0, 1, 1,
0.444535, -0.6230783, 2.400797, 0, 0, 0, 1, 1,
0.4461814, 0.3958389, 0.4861345, 0, 0, 0, 1, 1,
0.4463896, -0.8948154, 2.26757, 0, 0, 0, 1, 1,
0.4489769, -1.036333, 2.479921, 1, 1, 1, 1, 1,
0.4566773, -0.4952852, 0.3239765, 1, 1, 1, 1, 1,
0.4595402, -0.5589131, 2.162032, 1, 1, 1, 1, 1,
0.4615586, -2.281727, 2.098012, 1, 1, 1, 1, 1,
0.4640605, 1.31853, -0.9238874, 1, 1, 1, 1, 1,
0.4652782, -0.06034628, 3.77682, 1, 1, 1, 1, 1,
0.4675599, 2.088356, -0.3140249, 1, 1, 1, 1, 1,
0.4689453, -1.211276, 3.196573, 1, 1, 1, 1, 1,
0.4691418, -0.3491207, 4.484363, 1, 1, 1, 1, 1,
0.4694716, 0.5449307, -1.548224, 1, 1, 1, 1, 1,
0.4697362, -0.6942896, 4.343921, 1, 1, 1, 1, 1,
0.4723625, -0.6670788, 3.25879, 1, 1, 1, 1, 1,
0.473146, -0.01759305, 2.815079, 1, 1, 1, 1, 1,
0.4750998, 0.7713197, 1.167809, 1, 1, 1, 1, 1,
0.4831336, 0.1026258, 0.5065674, 1, 1, 1, 1, 1,
0.4872378, -2.263774, 3.204922, 0, 0, 1, 1, 1,
0.4901162, -0.5196005, 0.4392109, 1, 0, 0, 1, 1,
0.4927671, 0.7346973, 0.6460603, 1, 0, 0, 1, 1,
0.500303, -0.1960498, 2.649891, 1, 0, 0, 1, 1,
0.5042377, 0.4878958, 1.270904, 1, 0, 0, 1, 1,
0.5047778, 1.246112, -0.5977868, 1, 0, 0, 1, 1,
0.5059334, -0.08244749, 0.8164595, 0, 0, 0, 1, 1,
0.5092667, -0.1875735, 1.971124, 0, 0, 0, 1, 1,
0.5127353, -0.2265231, 2.948224, 0, 0, 0, 1, 1,
0.5196383, -1.866786, 2.430297, 0, 0, 0, 1, 1,
0.5290008, -0.5223513, 1.825528, 0, 0, 0, 1, 1,
0.529115, -0.9607241, 3.978468, 0, 0, 0, 1, 1,
0.5320278, 0.3481834, 1.571889, 0, 0, 0, 1, 1,
0.5339271, -0.8074576, 2.832971, 1, 1, 1, 1, 1,
0.5367918, 0.3386705, -1.164263, 1, 1, 1, 1, 1,
0.5393764, -1.739002, 3.310725, 1, 1, 1, 1, 1,
0.5403461, -0.1280171, 1.344113, 1, 1, 1, 1, 1,
0.5470155, -0.07484108, 2.185916, 1, 1, 1, 1, 1,
0.547075, 0.05050008, 2.748817, 1, 1, 1, 1, 1,
0.550211, 1.545111, 0.2165971, 1, 1, 1, 1, 1,
0.5566707, -1.568764, 3.945304, 1, 1, 1, 1, 1,
0.557628, 1.296692, 0.09142343, 1, 1, 1, 1, 1,
0.5586106, 1.149066, 1.16625, 1, 1, 1, 1, 1,
0.5590647, 0.3802716, 0.03535704, 1, 1, 1, 1, 1,
0.5603092, 0.07675064, 1.646491, 1, 1, 1, 1, 1,
0.5634811, 0.504088, 1.113898, 1, 1, 1, 1, 1,
0.5708853, -0.3407688, 1.668458, 1, 1, 1, 1, 1,
0.5715404, 0.6212311, 1.196984, 1, 1, 1, 1, 1,
0.5745299, 0.2305508, -0.2321641, 0, 0, 1, 1, 1,
0.5752359, 1.271569, -0.2692775, 1, 0, 0, 1, 1,
0.5807763, 0.1835186, 2.386949, 1, 0, 0, 1, 1,
0.5832406, 0.4058287, 0.3782716, 1, 0, 0, 1, 1,
0.5867159, -0.3060854, 1.891989, 1, 0, 0, 1, 1,
0.5879041, 1.906119, 1.193786, 1, 0, 0, 1, 1,
0.5926511, 0.9785808, 0.7085272, 0, 0, 0, 1, 1,
0.5936643, -0.4680111, 2.635136, 0, 0, 0, 1, 1,
0.598267, -0.5096346, 2.034891, 0, 0, 0, 1, 1,
0.5983282, 2.254912, 0.6936721, 0, 0, 0, 1, 1,
0.614802, -0.5124454, 2.285353, 0, 0, 0, 1, 1,
0.6164282, -0.8601005, 2.94071, 0, 0, 0, 1, 1,
0.6218819, 0.2236944, -0.07500093, 0, 0, 0, 1, 1,
0.6224606, 1.353613, 0.472981, 1, 1, 1, 1, 1,
0.6320017, -0.3598114, 3.859249, 1, 1, 1, 1, 1,
0.6416108, -1.637299, 3.928307, 1, 1, 1, 1, 1,
0.6431168, 0.3618333, -0.2757094, 1, 1, 1, 1, 1,
0.6489964, -0.084741, 1.798812, 1, 1, 1, 1, 1,
0.6495838, 1.612272, 0.06223219, 1, 1, 1, 1, 1,
0.6561918, -0.6197304, 3.33329, 1, 1, 1, 1, 1,
0.6577296, -0.08713509, 1.761581, 1, 1, 1, 1, 1,
0.6580977, -1.05159, 2.071967, 1, 1, 1, 1, 1,
0.6651548, -0.9337657, 2.842771, 1, 1, 1, 1, 1,
0.6710305, 0.6587891, 1.886046, 1, 1, 1, 1, 1,
0.6742606, -0.7924817, -0.4360115, 1, 1, 1, 1, 1,
0.6755099, -0.8514184, 2.005032, 1, 1, 1, 1, 1,
0.6804111, -0.2063827, 0.9783499, 1, 1, 1, 1, 1,
0.6804883, -0.05371487, 0.4478881, 1, 1, 1, 1, 1,
0.6824575, 0.7839258, 0.1663861, 0, 0, 1, 1, 1,
0.6894944, -0.5485055, 3.248637, 1, 0, 0, 1, 1,
0.6900813, 1.71353, -0.4996302, 1, 0, 0, 1, 1,
0.6907384, 1.282993, 0.6570272, 1, 0, 0, 1, 1,
0.6921866, 1.193921, 2.258438, 1, 0, 0, 1, 1,
0.6924746, -0.548971, 2.599302, 1, 0, 0, 1, 1,
0.6959776, -0.6231168, 1.486919, 0, 0, 0, 1, 1,
0.6969127, -0.9907523, 2.21916, 0, 0, 0, 1, 1,
0.705295, 0.4666216, -0.184702, 0, 0, 0, 1, 1,
0.7058653, 1.094338, 0.03632289, 0, 0, 0, 1, 1,
0.7101338, -1.650167, 3.315695, 0, 0, 0, 1, 1,
0.7110227, -0.7962867, 1.968166, 0, 0, 0, 1, 1,
0.7133576, -0.4268092, 1.945918, 0, 0, 0, 1, 1,
0.7134269, -0.658343, 2.470412, 1, 1, 1, 1, 1,
0.7139105, -1.949088, 3.244701, 1, 1, 1, 1, 1,
0.7170613, 0.09773309, 2.037113, 1, 1, 1, 1, 1,
0.7390842, 0.4465134, 2.966216, 1, 1, 1, 1, 1,
0.7431258, 0.9033931, -0.5260121, 1, 1, 1, 1, 1,
0.7458201, 1.240377, 0.1298483, 1, 1, 1, 1, 1,
0.7468655, 1.146527, 1.201858, 1, 1, 1, 1, 1,
0.7484486, -0.3113114, 1.031447, 1, 1, 1, 1, 1,
0.7544879, 2.15104, 1.00505, 1, 1, 1, 1, 1,
0.7564409, 0.1027642, 0.9915217, 1, 1, 1, 1, 1,
0.7570168, 0.7864705, 2.122668, 1, 1, 1, 1, 1,
0.7578233, 0.9945493, -0.6601226, 1, 1, 1, 1, 1,
0.7586645, 0.2271855, 0.57541, 1, 1, 1, 1, 1,
0.7592416, 0.4781072, 3.011764, 1, 1, 1, 1, 1,
0.7594467, -0.3614626, 1.636063, 1, 1, 1, 1, 1,
0.7603446, -0.6119435, 1.815824, 0, 0, 1, 1, 1,
0.7649396, -0.6890363, 1.543744, 1, 0, 0, 1, 1,
0.7654771, 1.382273, 1.04376, 1, 0, 0, 1, 1,
0.7669299, -0.5430393, 1.83517, 1, 0, 0, 1, 1,
0.767522, 0.6415235, -0.6671877, 1, 0, 0, 1, 1,
0.7713453, 0.000857045, 1.502546, 1, 0, 0, 1, 1,
0.7725025, 0.9425119, 0.7275523, 0, 0, 0, 1, 1,
0.7789791, -0.7678697, 1.525517, 0, 0, 0, 1, 1,
0.7814482, 0.9169067, 1.058683, 0, 0, 0, 1, 1,
0.7817001, -0.0302678, 3.334449, 0, 0, 0, 1, 1,
0.7819117, 0.4247878, 0.237541, 0, 0, 0, 1, 1,
0.7854505, -1.481859, 2.813149, 0, 0, 0, 1, 1,
0.7891282, -0.7424008, 3.086997, 0, 0, 0, 1, 1,
0.7902974, 0.071409, 2.791625, 1, 1, 1, 1, 1,
0.7962583, -0.6592699, 5.014925, 1, 1, 1, 1, 1,
0.7985966, -0.2933195, 2.274292, 1, 1, 1, 1, 1,
0.8059215, 0.03909786, 1.385605, 1, 1, 1, 1, 1,
0.8071229, -1.419259, 2.764195, 1, 1, 1, 1, 1,
0.8076413, -0.7692208, 1.505641, 1, 1, 1, 1, 1,
0.8091689, -0.8283564, 1.462044, 1, 1, 1, 1, 1,
0.81648, 0.8943608, 0.08386909, 1, 1, 1, 1, 1,
0.8168594, -0.4640243, 2.142114, 1, 1, 1, 1, 1,
0.81806, -0.5109835, 0.7185432, 1, 1, 1, 1, 1,
0.8182511, 1.182737, -0.08887937, 1, 1, 1, 1, 1,
0.8192991, -0.4146498, 1.717911, 1, 1, 1, 1, 1,
0.8219194, -0.4393175, 2.923179, 1, 1, 1, 1, 1,
0.8224843, 1.657611, -0.05866983, 1, 1, 1, 1, 1,
0.8277526, -0.1567874, 1.267123, 1, 1, 1, 1, 1,
0.8301138, -0.1129017, 2.589412, 0, 0, 1, 1, 1,
0.8313351, -0.006558898, 1.267364, 1, 0, 0, 1, 1,
0.8327869, 0.3157025, -0.3342651, 1, 0, 0, 1, 1,
0.850681, 0.02750684, 2.026133, 1, 0, 0, 1, 1,
0.8639812, -1.77247, 1.945225, 1, 0, 0, 1, 1,
0.8647817, 0.1188827, 2.749033, 1, 0, 0, 1, 1,
0.8684227, 0.3153212, 1.021194, 0, 0, 0, 1, 1,
0.8691926, 1.805738, -0.301056, 0, 0, 0, 1, 1,
0.869229, 0.1267484, 1.416726, 0, 0, 0, 1, 1,
0.8719999, 0.5761871, -0.001127149, 0, 0, 0, 1, 1,
0.8720723, -0.2037574, 0.452216, 0, 0, 0, 1, 1,
0.8774715, -0.354165, 1.543766, 0, 0, 0, 1, 1,
0.8829834, 0.9831601, 1.119827, 0, 0, 0, 1, 1,
0.8899928, -0.6498661, 3.343299, 1, 1, 1, 1, 1,
0.89227, 0.402524, 1.011485, 1, 1, 1, 1, 1,
0.8974182, -0.002620398, 1.045741, 1, 1, 1, 1, 1,
0.9048813, 0.5078693, 0.854799, 1, 1, 1, 1, 1,
0.9069916, 1.826462, 0.004138381, 1, 1, 1, 1, 1,
0.9134839, -1.722618, 3.72606, 1, 1, 1, 1, 1,
0.9151059, 0.4495429, -1.041449, 1, 1, 1, 1, 1,
0.9163991, 0.7927823, 1.065895, 1, 1, 1, 1, 1,
0.9166721, -0.1486968, 0.5408061, 1, 1, 1, 1, 1,
0.9239938, -3.187539, 2.774541, 1, 1, 1, 1, 1,
0.9465577, 0.09219925, 2.73998, 1, 1, 1, 1, 1,
0.9501573, -1.390138, 1.460319, 1, 1, 1, 1, 1,
0.9502786, 0.3429305, 0.4121063, 1, 1, 1, 1, 1,
0.9572469, -0.8408937, 3.068902, 1, 1, 1, 1, 1,
0.9592778, -0.7931038, 3.534653, 1, 1, 1, 1, 1,
0.9611164, -0.2285796, 1.577532, 0, 0, 1, 1, 1,
0.9694726, 0.1877054, 1.916092, 1, 0, 0, 1, 1,
0.9702959, -1.643794, 1.523617, 1, 0, 0, 1, 1,
0.9704189, 0.3600753, 0.5143797, 1, 0, 0, 1, 1,
0.9749868, -0.8062381, 1.867517, 1, 0, 0, 1, 1,
0.9767389, 0.4830413, 0.02661312, 1, 0, 0, 1, 1,
0.9776068, -0.1440346, -0.0002660731, 0, 0, 0, 1, 1,
0.9848027, 0.06398477, 1.563826, 0, 0, 0, 1, 1,
0.9974711, 1.068046, 0.2701622, 0, 0, 0, 1, 1,
0.9977103, -1.356558, 1.666806, 0, 0, 0, 1, 1,
0.9984989, 0.830856, 1.85881, 0, 0, 0, 1, 1,
1.0034, -0.3473533, 1.419756, 0, 0, 0, 1, 1,
1.019704, -2.200422, 0.893209, 0, 0, 0, 1, 1,
1.041332, 1.878612, 0.4329381, 1, 1, 1, 1, 1,
1.042706, 0.2943879, 1.229596, 1, 1, 1, 1, 1,
1.057976, -0.7045509, 1.569842, 1, 1, 1, 1, 1,
1.062122, 0.1834521, 0.8500505, 1, 1, 1, 1, 1,
1.064853, 0.9989792, 1.498962, 1, 1, 1, 1, 1,
1.069736, -0.1227825, -0.5500222, 1, 1, 1, 1, 1,
1.07009, 0.04968733, 2.097954, 1, 1, 1, 1, 1,
1.075745, -0.7346737, 0.2406836, 1, 1, 1, 1, 1,
1.077533, 0.03385378, 0.9645578, 1, 1, 1, 1, 1,
1.079661, -0.339913, 2.038512, 1, 1, 1, 1, 1,
1.08513, -0.2470254, 2.091314, 1, 1, 1, 1, 1,
1.086393, -0.3450383, 3.267132, 1, 1, 1, 1, 1,
1.089056, 0.7604805, 1.277188, 1, 1, 1, 1, 1,
1.091277, -0.6680927, 1.957952, 1, 1, 1, 1, 1,
1.09401, -1.38412, 3.007991, 1, 1, 1, 1, 1,
1.095702, 0.8977745, 0.8925389, 0, 0, 1, 1, 1,
1.096821, -1.834701, 3.705059, 1, 0, 0, 1, 1,
1.098191, 0.1909872, 1.082735, 1, 0, 0, 1, 1,
1.104251, -0.4261509, 2.355807, 1, 0, 0, 1, 1,
1.107957, -0.1317153, 1.047246, 1, 0, 0, 1, 1,
1.115774, 0.2445859, 1.388273, 1, 0, 0, 1, 1,
1.126959, -0.7558988, 1.576986, 0, 0, 0, 1, 1,
1.133565, -0.3389049, -0.9309665, 0, 0, 0, 1, 1,
1.141375, 0.04618437, 0.5949013, 0, 0, 0, 1, 1,
1.144057, 0.3624368, 1.485263, 0, 0, 0, 1, 1,
1.149747, -1.685332, 2.830461, 0, 0, 0, 1, 1,
1.151716, -1.111405, 2.262183, 0, 0, 0, 1, 1,
1.154538, 0.4119907, 1.529335, 0, 0, 0, 1, 1,
1.16285, 0.5206641, 0.9320202, 1, 1, 1, 1, 1,
1.165542, 0.3691155, 0.4812194, 1, 1, 1, 1, 1,
1.182601, 0.01328756, 0.7173787, 1, 1, 1, 1, 1,
1.193237, -1.431125, 4.008258, 1, 1, 1, 1, 1,
1.197866, 0.2346431, 1.890259, 1, 1, 1, 1, 1,
1.200302, 3.16977, -0.1910847, 1, 1, 1, 1, 1,
1.204709, -0.5379729, 1.408561, 1, 1, 1, 1, 1,
1.20812, -0.2132885, 1.132065, 1, 1, 1, 1, 1,
1.212253, 1.931145, 0.7357177, 1, 1, 1, 1, 1,
1.212795, -0.1992826, 2.446562, 1, 1, 1, 1, 1,
1.220027, 0.1284825, 2.027013, 1, 1, 1, 1, 1,
1.222219, -0.4276859, 3.2548, 1, 1, 1, 1, 1,
1.223304, -0.3575212, 1.323493, 1, 1, 1, 1, 1,
1.223659, 0.4375167, 1.693853, 1, 1, 1, 1, 1,
1.230587, 0.2364265, 2.583794, 1, 1, 1, 1, 1,
1.238596, 0.8246214, 2.489349, 0, 0, 1, 1, 1,
1.239365, -0.03879581, 1.263602, 1, 0, 0, 1, 1,
1.241238, -1.564743, 4.174965, 1, 0, 0, 1, 1,
1.252925, -1.241086, 1.409278, 1, 0, 0, 1, 1,
1.265451, -0.5817436, 1.764686, 1, 0, 0, 1, 1,
1.278713, -0.2642779, 1.990824, 1, 0, 0, 1, 1,
1.28667, 0.3753523, 0.4976417, 0, 0, 0, 1, 1,
1.29769, -0.4404972, 1.894966, 0, 0, 0, 1, 1,
1.309481, 0.1548678, 1.980126, 0, 0, 0, 1, 1,
1.318606, 0.06020138, 0.8543187, 0, 0, 0, 1, 1,
1.322902, -0.4191937, 3.512324, 0, 0, 0, 1, 1,
1.324614, 1.226813, 0.8523985, 0, 0, 0, 1, 1,
1.328727, -0.3103099, 1.090932, 0, 0, 0, 1, 1,
1.332662, 0.03851433, 3.262568, 1, 1, 1, 1, 1,
1.333248, 1.198204, 0.9480304, 1, 1, 1, 1, 1,
1.339624, -0.3715297, 0.154099, 1, 1, 1, 1, 1,
1.342849, 1.607081, 0.0397982, 1, 1, 1, 1, 1,
1.349606, 0.6439463, 0.6714091, 1, 1, 1, 1, 1,
1.350317, 0.03652191, 0.3608797, 1, 1, 1, 1, 1,
1.364045, -0.2773434, 1.412148, 1, 1, 1, 1, 1,
1.366981, 1.375522, 0.0298006, 1, 1, 1, 1, 1,
1.367368, -1.128417, 1.547651, 1, 1, 1, 1, 1,
1.370137, -0.6927282, 2.283949, 1, 1, 1, 1, 1,
1.374688, -1.478528, 2.379543, 1, 1, 1, 1, 1,
1.388311, 1.958605, 0.768832, 1, 1, 1, 1, 1,
1.394755, -0.3273407, 1.953482, 1, 1, 1, 1, 1,
1.395139, -0.8839163, 3.166505, 1, 1, 1, 1, 1,
1.39585, 0.5124296, 1.064698, 1, 1, 1, 1, 1,
1.410604, 2.286188, -1.087753, 0, 0, 1, 1, 1,
1.420194, -0.2951155, 2.919224, 1, 0, 0, 1, 1,
1.443563, -1.359784, 1.730844, 1, 0, 0, 1, 1,
1.452332, 0.3261919, 2.04351, 1, 0, 0, 1, 1,
1.457104, -1.048836, 1.874708, 1, 0, 0, 1, 1,
1.464353, -0.5499257, 1.152291, 1, 0, 0, 1, 1,
1.475843, 0.9881831, 0.3833674, 0, 0, 0, 1, 1,
1.489518, -1.287317, 1.867334, 0, 0, 0, 1, 1,
1.499945, 1.685338, -1.339892, 0, 0, 0, 1, 1,
1.501019, 1.642636, 1.814707, 0, 0, 0, 1, 1,
1.533343, -0.6296807, 1.840961, 0, 0, 0, 1, 1,
1.540907, 0.4805403, 1.195775, 0, 0, 0, 1, 1,
1.559302, 0.2193682, -0.7048324, 0, 0, 0, 1, 1,
1.563632, 0.7925884, 2.076884, 1, 1, 1, 1, 1,
1.564025, 0.2148322, 2.007344, 1, 1, 1, 1, 1,
1.565956, 0.8204078, 0.530134, 1, 1, 1, 1, 1,
1.56892, -1.225254, 1.839187, 1, 1, 1, 1, 1,
1.590675, 0.963611, 0.9071381, 1, 1, 1, 1, 1,
1.617069, 0.1990412, 2.017165, 1, 1, 1, 1, 1,
1.622057, 0.5365752, 0.6334658, 1, 1, 1, 1, 1,
1.622728, -0.148797, 1.977259, 1, 1, 1, 1, 1,
1.62601, -0.6849374, 2.930069, 1, 1, 1, 1, 1,
1.634148, -0.8230901, 1.975997, 1, 1, 1, 1, 1,
1.660934, 0.4519647, 0.168189, 1, 1, 1, 1, 1,
1.673667, -1.537257, 2.926983, 1, 1, 1, 1, 1,
1.681796, -0.7898598, 2.502926, 1, 1, 1, 1, 1,
1.684738, -1.587698, 3.572619, 1, 1, 1, 1, 1,
1.697771, 0.5506818, 2.430186, 1, 1, 1, 1, 1,
1.707398, 1.220281, -0.0968102, 0, 0, 1, 1, 1,
1.712749, -0.5547997, 2.673343, 1, 0, 0, 1, 1,
1.719597, -1.221163, 3.42604, 1, 0, 0, 1, 1,
1.744911, -1.406295, 2.297879, 1, 0, 0, 1, 1,
1.750408, 1.078335, 0.7958792, 1, 0, 0, 1, 1,
1.755664, 0.9646872, 1.842784, 1, 0, 0, 1, 1,
1.766486, 0.6074995, 1.633819, 0, 0, 0, 1, 1,
1.769728, 0.2875688, 1.210486, 0, 0, 0, 1, 1,
1.794192, -0.2421612, 0.02374876, 0, 0, 0, 1, 1,
1.797771, 0.1646948, -0.149071, 0, 0, 0, 1, 1,
1.799507, 2.706306, 1.330506, 0, 0, 0, 1, 1,
1.802573, 0.3757327, 2.537575, 0, 0, 0, 1, 1,
1.831436, -0.0178154, 0.8270535, 0, 0, 0, 1, 1,
1.834363, -0.289786, 0.7986903, 1, 1, 1, 1, 1,
1.84175, 0.05367712, 1.099396, 1, 1, 1, 1, 1,
1.847376, -0.2734433, 3.4475, 1, 1, 1, 1, 1,
1.879678, 1.847575, 1.14414, 1, 1, 1, 1, 1,
1.895414, 0.5156841, 2.129418, 1, 1, 1, 1, 1,
1.895993, -0.5928317, 0.7502829, 1, 1, 1, 1, 1,
1.900634, -0.06872236, 0.8904257, 1, 1, 1, 1, 1,
1.903563, -1.196751, 1.979831, 1, 1, 1, 1, 1,
1.914918, 1.219377, -0.5106368, 1, 1, 1, 1, 1,
1.94979, 0.4143493, 0.747902, 1, 1, 1, 1, 1,
1.958324, 0.1556565, 0.1393311, 1, 1, 1, 1, 1,
1.965203, -0.5456402, 2.593771, 1, 1, 1, 1, 1,
1.998195, -0.1627478, 1.508365, 1, 1, 1, 1, 1,
2.00541, 0.776249, -0.2853929, 1, 1, 1, 1, 1,
2.015699, 0.8946584, 0.1027457, 1, 1, 1, 1, 1,
2.040719, 0.7596548, -0.1060944, 0, 0, 1, 1, 1,
2.053344, 0.8155316, 1.125931, 1, 0, 0, 1, 1,
2.105427, -0.771122, 4.19326, 1, 0, 0, 1, 1,
2.107173, -1.173238, 2.837241, 1, 0, 0, 1, 1,
2.120575, -0.8454495, -0.006632342, 1, 0, 0, 1, 1,
2.123289, 1.072492, 1.922452, 1, 0, 0, 1, 1,
2.225612, 1.069934, -0.01102663, 0, 0, 0, 1, 1,
2.241039, -1.41207, 2.074387, 0, 0, 0, 1, 1,
2.265034, -0.09934954, 0.6111724, 0, 0, 0, 1, 1,
2.27791, -2.612964, 1.352275, 0, 0, 0, 1, 1,
2.291125, -1.128702, 1.287358, 0, 0, 0, 1, 1,
2.355834, -1.168171, 2.302937, 0, 0, 0, 1, 1,
2.397311, -0.01242492, 0.6291299, 0, 0, 0, 1, 1,
2.419442, 0.2249472, 0.8612912, 1, 1, 1, 1, 1,
2.466587, -1.681541, 2.7327, 1, 1, 1, 1, 1,
2.669975, -0.8923984, 2.457302, 1, 1, 1, 1, 1,
2.713027, 1.1788, 1.258304, 1, 1, 1, 1, 1,
2.714892, -0.01282189, 1.286659, 1, 1, 1, 1, 1,
3.026233, 0.5252383, 2.650278, 1, 1, 1, 1, 1,
3.318993, 0.2878062, 0.8683807, 1, 1, 1, 1, 1
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
var radius = 9.492496;
var distance = 33.34199;
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
mvMatrix.translate( -0.2346452, 0.1439292, -0.07406783 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.34199);
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
