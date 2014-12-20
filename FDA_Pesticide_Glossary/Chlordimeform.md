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
-3.146184, 0.7692389, -0.2167683, 1, 0, 0, 1,
-2.693034, 1.931542, -1.786575, 1, 0.007843138, 0, 1,
-2.622756, -0.2335086, -1.059605, 1, 0.01176471, 0, 1,
-2.559824, 0.5701511, -0.4023956, 1, 0.01960784, 0, 1,
-2.47841, -1.398499, -0.9526748, 1, 0.02352941, 0, 1,
-2.465189, -0.3568316, -2.542288, 1, 0.03137255, 0, 1,
-2.352406, -0.8030813, -2.306037, 1, 0.03529412, 0, 1,
-2.329852, -0.4442735, -2.421676, 1, 0.04313726, 0, 1,
-2.325653, 0.8474296, 0.02389966, 1, 0.04705882, 0, 1,
-2.253628, 0.03168132, -2.376314, 1, 0.05490196, 0, 1,
-2.231607, -2.154474, -3.692964, 1, 0.05882353, 0, 1,
-2.213201, 0.8047436, -1.77963, 1, 0.06666667, 0, 1,
-2.147834, -0.001147233, -3.301753, 1, 0.07058824, 0, 1,
-2.116288, -0.05873426, -0.3760875, 1, 0.07843138, 0, 1,
-2.112716, 2.183012, -1.485764, 1, 0.08235294, 0, 1,
-2.045342, -0.223652, -1.007366, 1, 0.09019608, 0, 1,
-2.01728, -0.8273619, -2.398528, 1, 0.09411765, 0, 1,
-2.012246, -0.09400491, -0.3850636, 1, 0.1019608, 0, 1,
-2.006058, 1.031029, -0.1330602, 1, 0.1098039, 0, 1,
-2.00097, -2.461443, -1.15109, 1, 0.1137255, 0, 1,
-1.99201, 0.7927522, -2.089658, 1, 0.1215686, 0, 1,
-1.990093, -1.222177, -1.589576, 1, 0.1254902, 0, 1,
-1.972398, 0.4476499, -1.220379, 1, 0.1333333, 0, 1,
-1.968352, 2.236118, -0.6133617, 1, 0.1372549, 0, 1,
-1.964145, 1.412824, -1.650564, 1, 0.145098, 0, 1,
-1.957342, 0.8684061, -1.055476, 1, 0.1490196, 0, 1,
-1.882456, 1.083709, -0.03634425, 1, 0.1568628, 0, 1,
-1.881008, 0.6574523, -2.689953, 1, 0.1607843, 0, 1,
-1.876676, 1.141264, -3.210614, 1, 0.1686275, 0, 1,
-1.869332, -0.08536004, -1.654352, 1, 0.172549, 0, 1,
-1.841994, -0.06174304, -1.243173, 1, 0.1803922, 0, 1,
-1.833818, 1.17046, -2.400442, 1, 0.1843137, 0, 1,
-1.823827, 0.8573521, -1.40067, 1, 0.1921569, 0, 1,
-1.815112, -1.125883, -1.456634, 1, 0.1960784, 0, 1,
-1.805474, 1.579277, -2.825041, 1, 0.2039216, 0, 1,
-1.801111, -0.1671552, -1.808243, 1, 0.2117647, 0, 1,
-1.787876, -1.078897, -1.498801, 1, 0.2156863, 0, 1,
-1.76664, 0.1734291, -0.3653836, 1, 0.2235294, 0, 1,
-1.755739, -0.09037377, -1.438471, 1, 0.227451, 0, 1,
-1.749479, 0.4598403, -1.901247, 1, 0.2352941, 0, 1,
-1.738506, 1.037645, -0.9894674, 1, 0.2392157, 0, 1,
-1.732672, 0.3939193, 0.1601506, 1, 0.2470588, 0, 1,
-1.726886, -1.464663, -3.668294, 1, 0.2509804, 0, 1,
-1.717245, -0.30596, -0.3647025, 1, 0.2588235, 0, 1,
-1.707554, -1.346123, -0.8852963, 1, 0.2627451, 0, 1,
-1.701663, 0.8396964, -2.305224, 1, 0.2705882, 0, 1,
-1.698502, 0.2303099, 0.7978144, 1, 0.2745098, 0, 1,
-1.682919, -0.08870374, -1.537297, 1, 0.282353, 0, 1,
-1.68059, 0.8745476, -1.82999, 1, 0.2862745, 0, 1,
-1.673997, -0.8258885, -2.007392, 1, 0.2941177, 0, 1,
-1.660756, -1.048065, -2.7866, 1, 0.3019608, 0, 1,
-1.643775, -0.2437121, -1.577356, 1, 0.3058824, 0, 1,
-1.632042, -0.001507926, -1.121249, 1, 0.3137255, 0, 1,
-1.53919, -2.245779, -1.348442, 1, 0.3176471, 0, 1,
-1.532827, 0.2809441, -3.315366, 1, 0.3254902, 0, 1,
-1.531261, 0.6744788, -1.17466, 1, 0.3294118, 0, 1,
-1.530022, -0.2316393, 0.2764833, 1, 0.3372549, 0, 1,
-1.525973, 0.7628928, -2.274456, 1, 0.3411765, 0, 1,
-1.523427, -0.2694164, -1.887045, 1, 0.3490196, 0, 1,
-1.518882, 0.7513611, -0.9406204, 1, 0.3529412, 0, 1,
-1.514974, 0.5011588, -1.507984, 1, 0.3607843, 0, 1,
-1.509148, -1.290025, -1.527399, 1, 0.3647059, 0, 1,
-1.502018, 0.3506948, -2.026373, 1, 0.372549, 0, 1,
-1.50164, -1.35837, -1.707721, 1, 0.3764706, 0, 1,
-1.500947, 0.2976197, -0.1771402, 1, 0.3843137, 0, 1,
-1.493978, -1.457113, -1.771504, 1, 0.3882353, 0, 1,
-1.483248, 1.58948, 1.900898, 1, 0.3960784, 0, 1,
-1.481291, -0.9785666, -3.798384, 1, 0.4039216, 0, 1,
-1.478547, 0.6138062, -0.9885482, 1, 0.4078431, 0, 1,
-1.463436, 0.3525836, -2.97122, 1, 0.4156863, 0, 1,
-1.454373, -0.494198, -2.355566, 1, 0.4196078, 0, 1,
-1.45197, 0.5595868, -2.516963, 1, 0.427451, 0, 1,
-1.434455, -2.225472, -0.8915685, 1, 0.4313726, 0, 1,
-1.428542, -0.4193886, -1.842322, 1, 0.4392157, 0, 1,
-1.426669, 1.170385, -1.354784, 1, 0.4431373, 0, 1,
-1.426033, -0.3191629, -1.220829, 1, 0.4509804, 0, 1,
-1.424818, -0.8869645, -1.686478, 1, 0.454902, 0, 1,
-1.419341, -0.02602741, -1.391687, 1, 0.4627451, 0, 1,
-1.413525, 1.295843, -0.9519716, 1, 0.4666667, 0, 1,
-1.409555, 0.9396231, -0.5221266, 1, 0.4745098, 0, 1,
-1.398011, 2.288297, 0.08691134, 1, 0.4784314, 0, 1,
-1.395226, 0.2894368, -1.85563, 1, 0.4862745, 0, 1,
-1.39307, 0.4731571, -1.207013, 1, 0.4901961, 0, 1,
-1.387837, 0.7303427, 0.1505563, 1, 0.4980392, 0, 1,
-1.386588, 1.022903, -1.08745, 1, 0.5058824, 0, 1,
-1.368497, -2.455796, -1.991395, 1, 0.509804, 0, 1,
-1.366749, 0.2580831, -1.321601, 1, 0.5176471, 0, 1,
-1.352435, 1.5154, -0.4912587, 1, 0.5215687, 0, 1,
-1.345602, 0.09406117, -1.466544, 1, 0.5294118, 0, 1,
-1.326025, -1.459383, -3.209084, 1, 0.5333334, 0, 1,
-1.312304, 1.166642, 0.008366563, 1, 0.5411765, 0, 1,
-1.310519, -0.5438532, -0.5157701, 1, 0.5450981, 0, 1,
-1.305472, 0.8535981, -1.663252, 1, 0.5529412, 0, 1,
-1.297043, -0.09094244, -2.011821, 1, 0.5568628, 0, 1,
-1.296181, -0.2471652, -0.1877978, 1, 0.5647059, 0, 1,
-1.295232, -0.9665624, -0.7433332, 1, 0.5686275, 0, 1,
-1.29452, -0.5231817, -1.294578, 1, 0.5764706, 0, 1,
-1.289487, 1.033229, -2.1047, 1, 0.5803922, 0, 1,
-1.286871, 0.9158358, -1.084595, 1, 0.5882353, 0, 1,
-1.286012, 1.120545, -1.910771, 1, 0.5921569, 0, 1,
-1.284985, -0.9269931, -2.14961, 1, 0.6, 0, 1,
-1.282265, 0.5951327, -0.6015927, 1, 0.6078432, 0, 1,
-1.278041, -0.785131, -1.963712, 1, 0.6117647, 0, 1,
-1.275685, 0.7199645, -2.283052, 1, 0.6196079, 0, 1,
-1.247079, 0.8488977, -2.658245, 1, 0.6235294, 0, 1,
-1.245763, 0.4796248, -2.4645, 1, 0.6313726, 0, 1,
-1.245082, 0.6138017, -1.974672, 1, 0.6352941, 0, 1,
-1.239829, 0.5681906, -1.888696, 1, 0.6431373, 0, 1,
-1.237766, -0.3677051, -2.610737, 1, 0.6470588, 0, 1,
-1.232799, -0.5620564, -0.7677604, 1, 0.654902, 0, 1,
-1.214927, -1.210186, -1.436129, 1, 0.6588235, 0, 1,
-1.206997, -1.066093, -2.899538, 1, 0.6666667, 0, 1,
-1.202895, 0.001071285, -0.8776578, 1, 0.6705883, 0, 1,
-1.196249, -0.6608456, -1.015466, 1, 0.6784314, 0, 1,
-1.19452, -1.626347, -3.132703, 1, 0.682353, 0, 1,
-1.193318, -2.427881, -3.421237, 1, 0.6901961, 0, 1,
-1.191904, 0.1382843, -1.328903, 1, 0.6941177, 0, 1,
-1.181731, -2.035161, -3.289172, 1, 0.7019608, 0, 1,
-1.180287, 0.7111344, -1.743512, 1, 0.7098039, 0, 1,
-1.18002, -1.594326, -1.259579, 1, 0.7137255, 0, 1,
-1.175516, -0.5136051, -2.136341, 1, 0.7215686, 0, 1,
-1.172583, -0.5909869, -0.7093298, 1, 0.7254902, 0, 1,
-1.171324, 0.3400969, -2.540129, 1, 0.7333333, 0, 1,
-1.16611, 1.30975, -0.7092115, 1, 0.7372549, 0, 1,
-1.164696, -0.3465248, -0.571398, 1, 0.7450981, 0, 1,
-1.163079, 1.542491, -0.0316731, 1, 0.7490196, 0, 1,
-1.158446, 0.4044221, -0.5954323, 1, 0.7568628, 0, 1,
-1.157712, -1.091562, -1.164043, 1, 0.7607843, 0, 1,
-1.15732, 0.3494913, -2.221714, 1, 0.7686275, 0, 1,
-1.156632, -0.7167286, -3.757614, 1, 0.772549, 0, 1,
-1.156038, -0.3850543, -2.087564, 1, 0.7803922, 0, 1,
-1.154136, 0.6300202, -1.096415, 1, 0.7843137, 0, 1,
-1.153438, 1.542928, -1.390597, 1, 0.7921569, 0, 1,
-1.150246, 0.8743003, -1.968722, 1, 0.7960784, 0, 1,
-1.149318, -0.40712, -3.518873, 1, 0.8039216, 0, 1,
-1.145854, -0.01215406, -1.401601, 1, 0.8117647, 0, 1,
-1.137888, -0.6913707, -2.608956, 1, 0.8156863, 0, 1,
-1.137042, -0.728652, -2.680017, 1, 0.8235294, 0, 1,
-1.135207, 1.774995, 0.9933293, 1, 0.827451, 0, 1,
-1.129714, -0.03904967, -1.016071, 1, 0.8352941, 0, 1,
-1.123781, -0.5546744, -2.648711, 1, 0.8392157, 0, 1,
-1.121782, -0.4461476, -2.22662, 1, 0.8470588, 0, 1,
-1.118018, 1.344126, 0.4094539, 1, 0.8509804, 0, 1,
-1.113848, -1.304742, -3.252711, 1, 0.8588235, 0, 1,
-1.110679, -1.119888, -1.36003, 1, 0.8627451, 0, 1,
-1.107661, -0.7949526, -1.230479, 1, 0.8705882, 0, 1,
-1.107183, 1.121158, -1.409929, 1, 0.8745098, 0, 1,
-1.102585, 0.5945232, -1.196427, 1, 0.8823529, 0, 1,
-1.102132, -0.1236832, -2.435508, 1, 0.8862745, 0, 1,
-1.073065, -0.1054085, -1.182799, 1, 0.8941177, 0, 1,
-1.061415, -0.1112942, -1.871712, 1, 0.8980392, 0, 1,
-1.050479, 0.8736317, -0.6223022, 1, 0.9058824, 0, 1,
-1.035667, -2.576727, -3.376332, 1, 0.9137255, 0, 1,
-1.034369, -2.156662, -1.615637, 1, 0.9176471, 0, 1,
-1.032712, 0.05089225, -1.175009, 1, 0.9254902, 0, 1,
-1.031567, 0.3361501, -1.658133, 1, 0.9294118, 0, 1,
-1.021534, 1.421459, -1.665316, 1, 0.9372549, 0, 1,
-1.011367, 1.792487, -0.3542476, 1, 0.9411765, 0, 1,
-1.00497, -0.1301151, -3.544045, 1, 0.9490196, 0, 1,
-0.994908, 1.749068, -1.752393, 1, 0.9529412, 0, 1,
-0.9841266, 1.196586, 0.7607667, 1, 0.9607843, 0, 1,
-0.978789, 0.3239663, -1.993353, 1, 0.9647059, 0, 1,
-0.9779109, 0.1320128, -0.9816713, 1, 0.972549, 0, 1,
-0.9702931, -0.5661223, -1.869603, 1, 0.9764706, 0, 1,
-0.9683813, -0.1181566, -2.974756, 1, 0.9843137, 0, 1,
-0.968313, -0.4013709, -1.944947, 1, 0.9882353, 0, 1,
-0.9669656, 0.860024, -1.21048, 1, 0.9960784, 0, 1,
-0.9466911, 0.08922508, -3.049853, 0.9960784, 1, 0, 1,
-0.9438966, -1.619786, -1.423043, 0.9921569, 1, 0, 1,
-0.942317, -0.3523048, -1.925339, 0.9843137, 1, 0, 1,
-0.9414939, -1.546346, -1.631091, 0.9803922, 1, 0, 1,
-0.9366176, 0.6147506, -0.7440416, 0.972549, 1, 0, 1,
-0.9365032, 0.9809039, 0.005766528, 0.9686275, 1, 0, 1,
-0.9331353, -1.040381, -1.958531, 0.9607843, 1, 0, 1,
-0.9322117, 1.269705, 0.7292429, 0.9568627, 1, 0, 1,
-0.9197444, 1.348094, -0.08539208, 0.9490196, 1, 0, 1,
-0.918109, 2.808921, -1.208135, 0.945098, 1, 0, 1,
-0.9155795, -0.2623362, -1.520697, 0.9372549, 1, 0, 1,
-0.9134426, -3.529808, -3.857256, 0.9333333, 1, 0, 1,
-0.8996217, -0.5890481, -0.9683356, 0.9254902, 1, 0, 1,
-0.8975075, 0.6165307, -1.389962, 0.9215686, 1, 0, 1,
-0.8926679, -0.5032408, -2.462959, 0.9137255, 1, 0, 1,
-0.8871897, 0.3734086, -1.268925, 0.9098039, 1, 0, 1,
-0.8683631, 0.9175218, -1.521437, 0.9019608, 1, 0, 1,
-0.8638721, 0.6697194, -1.136571, 0.8941177, 1, 0, 1,
-0.8598137, -0.980966, -1.452578, 0.8901961, 1, 0, 1,
-0.8593724, -0.2377168, -2.088828, 0.8823529, 1, 0, 1,
-0.8531802, -0.3462212, -2.00486, 0.8784314, 1, 0, 1,
-0.8524773, 0.9765347, -1.377512, 0.8705882, 1, 0, 1,
-0.8482249, -1.028359, -3.175286, 0.8666667, 1, 0, 1,
-0.8458628, -0.2706232, -3.732787, 0.8588235, 1, 0, 1,
-0.8455877, -1.869685, -2.300148, 0.854902, 1, 0, 1,
-0.8326853, 0.163912, 0.4620319, 0.8470588, 1, 0, 1,
-0.8285756, 2.369463, 0.1724709, 0.8431373, 1, 0, 1,
-0.8227573, 0.02959958, -0.9877798, 0.8352941, 1, 0, 1,
-0.8218305, 0.7959535, -1.178274, 0.8313726, 1, 0, 1,
-0.8166686, 0.4333593, -0.5641394, 0.8235294, 1, 0, 1,
-0.8153329, 0.730522, -1.086118, 0.8196079, 1, 0, 1,
-0.8152145, 0.3502765, -1.040812, 0.8117647, 1, 0, 1,
-0.8138946, -1.368877, -2.333132, 0.8078431, 1, 0, 1,
-0.8133594, -0.2596868, -1.475804, 0.8, 1, 0, 1,
-0.806142, -0.355756, -3.167839, 0.7921569, 1, 0, 1,
-0.8061413, 0.05886258, -0.8135914, 0.7882353, 1, 0, 1,
-0.8048714, 0.8853272, -0.8154822, 0.7803922, 1, 0, 1,
-0.8037, 0.7955139, 0.01395371, 0.7764706, 1, 0, 1,
-0.8025264, -0.7986642, -2.258026, 0.7686275, 1, 0, 1,
-0.8016503, 0.4546137, -0.8168801, 0.7647059, 1, 0, 1,
-0.800039, -2.634296, -2.791679, 0.7568628, 1, 0, 1,
-0.7943627, -1.365948, -4.540998, 0.7529412, 1, 0, 1,
-0.7895867, 1.026624, -3.038262, 0.7450981, 1, 0, 1,
-0.7883554, 1.805048, -0.679381, 0.7411765, 1, 0, 1,
-0.7879802, -1.090206, -3.837317, 0.7333333, 1, 0, 1,
-0.7875537, 0.7949786, 0.04239286, 0.7294118, 1, 0, 1,
-0.7809089, -0.4695335, -1.66113, 0.7215686, 1, 0, 1,
-0.7770056, -1.605336, -2.95887, 0.7176471, 1, 0, 1,
-0.7711262, -2.306974, -3.792535, 0.7098039, 1, 0, 1,
-0.7698682, 0.9168515, 0.8500659, 0.7058824, 1, 0, 1,
-0.766673, 1.702797, 0.001545569, 0.6980392, 1, 0, 1,
-0.7605098, 1.179076, -0.8422648, 0.6901961, 1, 0, 1,
-0.7554224, -0.2152305, -1.241883, 0.6862745, 1, 0, 1,
-0.7549363, -1.685925, -2.621495, 0.6784314, 1, 0, 1,
-0.7512625, 0.4205816, -2.848009, 0.6745098, 1, 0, 1,
-0.750907, -1.161263, -0.986552, 0.6666667, 1, 0, 1,
-0.7501882, 1.066309, 1.290184, 0.6627451, 1, 0, 1,
-0.7466167, 0.06063105, -0.9094897, 0.654902, 1, 0, 1,
-0.7438044, -0.7184982, -1.55244, 0.6509804, 1, 0, 1,
-0.740874, 1.46838, 0.1307666, 0.6431373, 1, 0, 1,
-0.7376068, -2.232383, -2.400235, 0.6392157, 1, 0, 1,
-0.737266, 0.1249848, -1.046482, 0.6313726, 1, 0, 1,
-0.7370796, 1.385576, 0.01900104, 0.627451, 1, 0, 1,
-0.7361633, -0.07329866, 0.1134089, 0.6196079, 1, 0, 1,
-0.7342238, -1.757941, -2.29965, 0.6156863, 1, 0, 1,
-0.7293078, -1.446216, -3.761703, 0.6078432, 1, 0, 1,
-0.7268984, -0.04356359, -1.045426, 0.6039216, 1, 0, 1,
-0.7248427, -1.746959, -3.426082, 0.5960785, 1, 0, 1,
-0.7244858, 0.4200379, -1.022, 0.5882353, 1, 0, 1,
-0.7238013, 0.9716244, -1.626249, 0.5843138, 1, 0, 1,
-0.7199371, -1.995626, -2.328279, 0.5764706, 1, 0, 1,
-0.7150666, -0.3124209, -1.819961, 0.572549, 1, 0, 1,
-0.7148678, -0.6181469, -3.079646, 0.5647059, 1, 0, 1,
-0.7126257, 0.284793, -0.6435738, 0.5607843, 1, 0, 1,
-0.7109759, -0.5219356, -1.724153, 0.5529412, 1, 0, 1,
-0.7033004, -0.309659, -1.077817, 0.5490196, 1, 0, 1,
-0.7000418, -0.3962097, -1.330528, 0.5411765, 1, 0, 1,
-0.6989853, 2.19932, 0.2624052, 0.5372549, 1, 0, 1,
-0.6984984, 0.2563968, 0.6979171, 0.5294118, 1, 0, 1,
-0.6912752, -0.4759912, -3.199539, 0.5254902, 1, 0, 1,
-0.6859297, -0.9249008, -2.578489, 0.5176471, 1, 0, 1,
-0.6849251, 0.6169854, -0.4769004, 0.5137255, 1, 0, 1,
-0.6840526, 1.762402, -0.93859, 0.5058824, 1, 0, 1,
-0.6812352, 1.880377, -0.6311159, 0.5019608, 1, 0, 1,
-0.680187, -1.893482, -3.23018, 0.4941176, 1, 0, 1,
-0.6739857, -1.490328, -3.305054, 0.4862745, 1, 0, 1,
-0.6688563, 1.097541, -1.151554, 0.4823529, 1, 0, 1,
-0.6558953, 0.7551835, 0.8728501, 0.4745098, 1, 0, 1,
-0.6497144, 1.27701, -1.524214, 0.4705882, 1, 0, 1,
-0.6429546, -0.4694741, -2.617197, 0.4627451, 1, 0, 1,
-0.6381097, 0.3651131, -2.091874, 0.4588235, 1, 0, 1,
-0.6348002, 0.6275466, -1.405871, 0.4509804, 1, 0, 1,
-0.6324834, -1.058394, -4.26721, 0.4470588, 1, 0, 1,
-0.6283382, -0.4554466, -2.222718, 0.4392157, 1, 0, 1,
-0.6251322, -0.1265581, -1.065754, 0.4352941, 1, 0, 1,
-0.6167194, -0.4366735, -1.425524, 0.427451, 1, 0, 1,
-0.6104768, 0.5264817, 0.4914696, 0.4235294, 1, 0, 1,
-0.609077, -1.072646, -0.8206182, 0.4156863, 1, 0, 1,
-0.6073287, -0.6074349, -2.3081, 0.4117647, 1, 0, 1,
-0.5988896, 1.324046, -1.038711, 0.4039216, 1, 0, 1,
-0.5969472, -0.8862819, -2.840565, 0.3960784, 1, 0, 1,
-0.5960216, 0.4357631, -0.3939789, 0.3921569, 1, 0, 1,
-0.5948269, 0.1551894, -0.7748625, 0.3843137, 1, 0, 1,
-0.5917632, -2.537906, -2.732697, 0.3803922, 1, 0, 1,
-0.5902333, 0.3556601, -0.207745, 0.372549, 1, 0, 1,
-0.5898693, 0.5057924, -1.6533, 0.3686275, 1, 0, 1,
-0.5861341, -1.287301, -1.936771, 0.3607843, 1, 0, 1,
-0.5841792, 0.7744042, 0.01794551, 0.3568628, 1, 0, 1,
-0.5805961, -1.330805, -2.407981, 0.3490196, 1, 0, 1,
-0.5749596, 0.7165772, -1.280577, 0.345098, 1, 0, 1,
-0.5698841, 1.598386, -1.822932, 0.3372549, 1, 0, 1,
-0.5694388, -0.2883402, -2.230341, 0.3333333, 1, 0, 1,
-0.5683887, -0.01743356, -3.481447, 0.3254902, 1, 0, 1,
-0.5645167, -0.315171, -1.990155, 0.3215686, 1, 0, 1,
-0.5593467, -1.033113, -3.229344, 0.3137255, 1, 0, 1,
-0.5572854, -1.387976, -2.608997, 0.3098039, 1, 0, 1,
-0.5549515, 0.8520785, -0.5837823, 0.3019608, 1, 0, 1,
-0.5515972, 0.5445498, -1.353843, 0.2941177, 1, 0, 1,
-0.5475665, -0.7075504, -4.059359, 0.2901961, 1, 0, 1,
-0.5420768, 0.6003533, 0.7290642, 0.282353, 1, 0, 1,
-0.5406326, 1.455183, -1.41404, 0.2784314, 1, 0, 1,
-0.5336181, 0.4420018, -1.269526, 0.2705882, 1, 0, 1,
-0.5335706, -0.6849627, -1.590313, 0.2666667, 1, 0, 1,
-0.5293431, -0.1971682, -2.189516, 0.2588235, 1, 0, 1,
-0.5290909, -0.04040479, -0.848451, 0.254902, 1, 0, 1,
-0.5242976, -2.370599, -4.323159, 0.2470588, 1, 0, 1,
-0.5238439, -0.4435987, -1.293638, 0.2431373, 1, 0, 1,
-0.5237539, -0.7419573, -3.546036, 0.2352941, 1, 0, 1,
-0.5160621, -0.1524717, -2.09748, 0.2313726, 1, 0, 1,
-0.5137292, 0.3575037, -0.1836695, 0.2235294, 1, 0, 1,
-0.5114096, -0.4422331, -2.404757, 0.2196078, 1, 0, 1,
-0.5100949, 1.135472, -1.013582, 0.2117647, 1, 0, 1,
-0.5082031, 1.545345, 0.3294611, 0.2078431, 1, 0, 1,
-0.5068394, -0.404193, -1.761627, 0.2, 1, 0, 1,
-0.5055827, -1.492621, -3.69834, 0.1921569, 1, 0, 1,
-0.5047829, 0.06720459, -2.24737, 0.1882353, 1, 0, 1,
-0.5039704, 0.4620115, -1.493409, 0.1803922, 1, 0, 1,
-0.5003249, -0.09009737, -0.7673715, 0.1764706, 1, 0, 1,
-0.48877, 0.9856544, -1.102282, 0.1686275, 1, 0, 1,
-0.4863391, -2.801761, -2.301829, 0.1647059, 1, 0, 1,
-0.484523, 0.2575274, 0.6709583, 0.1568628, 1, 0, 1,
-0.4843001, 0.6939759, 0.6519496, 0.1529412, 1, 0, 1,
-0.4809479, 0.05144985, -0.7070513, 0.145098, 1, 0, 1,
-0.4797252, 0.4312809, 0.08359116, 0.1411765, 1, 0, 1,
-0.4764756, 0.1785475, -0.5935203, 0.1333333, 1, 0, 1,
-0.4731297, -0.8808466, -2.040835, 0.1294118, 1, 0, 1,
-0.4707428, -0.9192656, -2.882461, 0.1215686, 1, 0, 1,
-0.466598, -0.8760585, -2.761687, 0.1176471, 1, 0, 1,
-0.4619422, 0.8775844, -0.02190155, 0.1098039, 1, 0, 1,
-0.4612551, 1.07907, 0.08660315, 0.1058824, 1, 0, 1,
-0.4600603, -2.303897, -3.088142, 0.09803922, 1, 0, 1,
-0.4594804, 1.122863, -2.644547, 0.09019608, 1, 0, 1,
-0.4580134, -0.6035194, -3.961365, 0.08627451, 1, 0, 1,
-0.450117, -1.203446, -4.066206, 0.07843138, 1, 0, 1,
-0.4462597, 0.645475, -1.160957, 0.07450981, 1, 0, 1,
-0.4450167, -1.128456, -3.738766, 0.06666667, 1, 0, 1,
-0.4444891, 0.2524667, -1.972984, 0.0627451, 1, 0, 1,
-0.4399354, -0.1160823, -1.411898, 0.05490196, 1, 0, 1,
-0.4386849, 0.414388, -1.953372, 0.05098039, 1, 0, 1,
-0.4327631, 1.242266, 0.3562633, 0.04313726, 1, 0, 1,
-0.4274876, -0.7129159, -2.198929, 0.03921569, 1, 0, 1,
-0.426956, -0.1874855, -2.190715, 0.03137255, 1, 0, 1,
-0.4229234, 1.220156, -1.123438, 0.02745098, 1, 0, 1,
-0.4208375, 1.509192, -0.5960774, 0.01960784, 1, 0, 1,
-0.4184225, -1.530012, -3.460416, 0.01568628, 1, 0, 1,
-0.4182082, 0.07382925, -2.200639, 0.007843138, 1, 0, 1,
-0.4181728, -0.5302064, -3.336115, 0.003921569, 1, 0, 1,
-0.4155523, 0.17171, -0.5514395, 0, 1, 0.003921569, 1,
-0.4054109, -0.5992904, -1.355131, 0, 1, 0.01176471, 1,
-0.3940252, 0.1986014, -1.383067, 0, 1, 0.01568628, 1,
-0.3927727, 1.204241, -0.2192812, 0, 1, 0.02352941, 1,
-0.3918732, 0.2233225, -1.811567, 0, 1, 0.02745098, 1,
-0.3900249, -0.8388568, -1.302987, 0, 1, 0.03529412, 1,
-0.3794099, 0.495611, -0.9304873, 0, 1, 0.03921569, 1,
-0.3780645, 1.496799, 0.2708699, 0, 1, 0.04705882, 1,
-0.3770839, -0.8593887, -2.00663, 0, 1, 0.05098039, 1,
-0.3738432, 0.3551714, -1.22251, 0, 1, 0.05882353, 1,
-0.3734316, -0.8681267, -4.143194, 0, 1, 0.0627451, 1,
-0.3715144, -0.3090527, -1.614297, 0, 1, 0.07058824, 1,
-0.3635954, 1.301479, 0.6135317, 0, 1, 0.07450981, 1,
-0.3590697, -1.418311, -4.512507, 0, 1, 0.08235294, 1,
-0.3569557, 0.1643468, -0.5659499, 0, 1, 0.08627451, 1,
-0.3567065, 0.5025981, -0.3467125, 0, 1, 0.09411765, 1,
-0.3547725, 1.551262, -0.7459521, 0, 1, 0.1019608, 1,
-0.3534499, -0.4969404, -4.243728, 0, 1, 0.1058824, 1,
-0.349171, 1.356922, -0.3199895, 0, 1, 0.1137255, 1,
-0.3478191, -0.5782264, -1.482646, 0, 1, 0.1176471, 1,
-0.3476923, 0.02826881, -0.5285524, 0, 1, 0.1254902, 1,
-0.3407234, 0.03505795, -1.833764, 0, 1, 0.1294118, 1,
-0.3391809, 0.4670213, -2.246258, 0, 1, 0.1372549, 1,
-0.3353072, -0.09682515, -3.442931, 0, 1, 0.1411765, 1,
-0.3338751, 0.3301409, -0.6648308, 0, 1, 0.1490196, 1,
-0.3330373, 1.548258, -0.2535083, 0, 1, 0.1529412, 1,
-0.3324959, 0.04461582, -1.351819, 0, 1, 0.1607843, 1,
-0.3280496, 0.04573121, -2.622553, 0, 1, 0.1647059, 1,
-0.3270923, -0.5195358, -2.577797, 0, 1, 0.172549, 1,
-0.3228405, -2.128416, -3.518097, 0, 1, 0.1764706, 1,
-0.3208596, 0.9276213, -0.9710654, 0, 1, 0.1843137, 1,
-0.3195797, -0.5838709, -3.30199, 0, 1, 0.1882353, 1,
-0.3191246, -0.06719028, -1.86797, 0, 1, 0.1960784, 1,
-0.318834, -1.490788, -3.733582, 0, 1, 0.2039216, 1,
-0.3158374, 2.778383, -0.2949936, 0, 1, 0.2078431, 1,
-0.3135554, 0.05398437, -0.3921104, 0, 1, 0.2156863, 1,
-0.3125129, 1.834422, 1.054119, 0, 1, 0.2196078, 1,
-0.3111718, 0.6127356, 0.06398657, 0, 1, 0.227451, 1,
-0.3096742, -1.064274, -2.901725, 0, 1, 0.2313726, 1,
-0.3082056, -0.3902702, -3.523553, 0, 1, 0.2392157, 1,
-0.3080536, -0.1899834, -1.464217, 0, 1, 0.2431373, 1,
-0.3023422, 0.2273139, -0.2479536, 0, 1, 0.2509804, 1,
-0.2990136, 0.2998231, 0.8531713, 0, 1, 0.254902, 1,
-0.2968105, -1.308028, -5.254885, 0, 1, 0.2627451, 1,
-0.2959261, 1.178372, 0.5466283, 0, 1, 0.2666667, 1,
-0.2913881, -2.182772, -2.565435, 0, 1, 0.2745098, 1,
-0.2911265, 2.705423, 0.2558077, 0, 1, 0.2784314, 1,
-0.2906592, -0.9067006, -5.332788, 0, 1, 0.2862745, 1,
-0.2901071, 0.1110559, -0.5248859, 0, 1, 0.2901961, 1,
-0.2896736, 0.4258392, 0.6238632, 0, 1, 0.2980392, 1,
-0.2878473, 0.9200155, 0.01833859, 0, 1, 0.3058824, 1,
-0.2866128, -1.785566, -2.730282, 0, 1, 0.3098039, 1,
-0.2840106, -0.2149097, -3.640425, 0, 1, 0.3176471, 1,
-0.2790904, 0.5977584, -0.135771, 0, 1, 0.3215686, 1,
-0.2735657, -1.352674, -2.628657, 0, 1, 0.3294118, 1,
-0.2727197, -1.951116, -0.5963646, 0, 1, 0.3333333, 1,
-0.2687773, -0.08391321, -0.6845806, 0, 1, 0.3411765, 1,
-0.2658856, -0.4230632, -3.58004, 0, 1, 0.345098, 1,
-0.2657437, 0.7688738, 1.136517, 0, 1, 0.3529412, 1,
-0.2641813, -0.4406384, -3.709737, 0, 1, 0.3568628, 1,
-0.2627625, -2.275863, -3.460234, 0, 1, 0.3647059, 1,
-0.2588487, 0.2332477, -1.873231, 0, 1, 0.3686275, 1,
-0.2566833, -0.8167425, -2.622628, 0, 1, 0.3764706, 1,
-0.2555928, 1.073039, 0.3811244, 0, 1, 0.3803922, 1,
-0.2547746, 0.5557262, 1.117941, 0, 1, 0.3882353, 1,
-0.2533072, -0.986291, -3.620955, 0, 1, 0.3921569, 1,
-0.2525884, 0.4387046, 0.5131171, 0, 1, 0.4, 1,
-0.2521461, -0.5996447, -2.925949, 0, 1, 0.4078431, 1,
-0.2491202, 0.6448107, 0.4764282, 0, 1, 0.4117647, 1,
-0.2473301, 0.4377925, -0.344134, 0, 1, 0.4196078, 1,
-0.2447417, 1.945697, 1.009115, 0, 1, 0.4235294, 1,
-0.2444798, -1.266254, -2.755093, 0, 1, 0.4313726, 1,
-0.2372282, -0.7233272, -3.746891, 0, 1, 0.4352941, 1,
-0.2268267, -0.2044756, -0.8502229, 0, 1, 0.4431373, 1,
-0.2260022, 1.18446, -1.282409, 0, 1, 0.4470588, 1,
-0.2183501, 0.9302974, -0.5901228, 0, 1, 0.454902, 1,
-0.2177976, 0.8150473, -0.1678338, 0, 1, 0.4588235, 1,
-0.2166909, -0.4827892, -2.323742, 0, 1, 0.4666667, 1,
-0.2165828, 0.5917737, -0.8123255, 0, 1, 0.4705882, 1,
-0.215565, 1.255, -1.634114, 0, 1, 0.4784314, 1,
-0.2123362, -0.9722007, -2.305978, 0, 1, 0.4823529, 1,
-0.2121092, 0.5202739, -0.6731932, 0, 1, 0.4901961, 1,
-0.2117503, 0.542847, 0.3320667, 0, 1, 0.4941176, 1,
-0.2047139, -0.8226221, -1.414341, 0, 1, 0.5019608, 1,
-0.2043948, -0.6068602, -2.713786, 0, 1, 0.509804, 1,
-0.1986571, 0.5142779, 1.960153, 0, 1, 0.5137255, 1,
-0.1919312, -0.411439, -3.071509, 0, 1, 0.5215687, 1,
-0.1917936, 0.1566528, 0.7637061, 0, 1, 0.5254902, 1,
-0.1908432, -0.2812443, 0.3012993, 0, 1, 0.5333334, 1,
-0.190649, -0.670975, -2.988594, 0, 1, 0.5372549, 1,
-0.1899092, 1.240351, 1.651539, 0, 1, 0.5450981, 1,
-0.1868578, -0.2694421, -1.264612, 0, 1, 0.5490196, 1,
-0.1866682, -0.565312, -3.077876, 0, 1, 0.5568628, 1,
-0.1846081, 0.2258966, -1.147206, 0, 1, 0.5607843, 1,
-0.182897, 1.592009, -0.009063366, 0, 1, 0.5686275, 1,
-0.1804858, 0.1110616, -1.014454, 0, 1, 0.572549, 1,
-0.1779556, -0.4335354, -2.483043, 0, 1, 0.5803922, 1,
-0.1731936, -1.038164, -3.841311, 0, 1, 0.5843138, 1,
-0.1730676, -0.1136587, -1.925679, 0, 1, 0.5921569, 1,
-0.1730424, 1.421276, -0.8914812, 0, 1, 0.5960785, 1,
-0.1709575, -1.211794, -4.461696, 0, 1, 0.6039216, 1,
-0.1653702, -0.09379501, -1.646415, 0, 1, 0.6117647, 1,
-0.1643181, -1.191312, -3.938881, 0, 1, 0.6156863, 1,
-0.1642423, -1.157265, -2.11292, 0, 1, 0.6235294, 1,
-0.1625666, 1.030676, -0.06800136, 0, 1, 0.627451, 1,
-0.1614952, 0.1773035, -0.7013254, 0, 1, 0.6352941, 1,
-0.1573947, 0.7890393, -0.6609917, 0, 1, 0.6392157, 1,
-0.152857, 0.4584497, -0.2043546, 0, 1, 0.6470588, 1,
-0.1514666, 0.3409111, 0.1792893, 0, 1, 0.6509804, 1,
-0.1502655, 1.646417, 1.193606, 0, 1, 0.6588235, 1,
-0.1497929, 0.6848838, -0.1388562, 0, 1, 0.6627451, 1,
-0.1497816, 0.08242759, -0.285287, 0, 1, 0.6705883, 1,
-0.1467406, 1.295693, -0.7927058, 0, 1, 0.6745098, 1,
-0.1443375, -0.5579076, -3.238356, 0, 1, 0.682353, 1,
-0.1411427, 0.1899266, -0.9432635, 0, 1, 0.6862745, 1,
-0.1406983, 0.344867, -0.221247, 0, 1, 0.6941177, 1,
-0.1404586, 0.4188819, 1.079037, 0, 1, 0.7019608, 1,
-0.1404183, -0.4339549, -3.308164, 0, 1, 0.7058824, 1,
-0.1358986, -0.2491743, -2.512038, 0, 1, 0.7137255, 1,
-0.1338481, 1.538762, 0.5961311, 0, 1, 0.7176471, 1,
-0.1259104, -2.420477, -2.955079, 0, 1, 0.7254902, 1,
-0.1173973, -0.3622186, -2.000688, 0, 1, 0.7294118, 1,
-0.1169616, 0.4624478, -0.2392449, 0, 1, 0.7372549, 1,
-0.1142632, 2.394064, -0.4077727, 0, 1, 0.7411765, 1,
-0.1124949, 0.3561091, -0.05353887, 0, 1, 0.7490196, 1,
-0.1106007, 0.2642946, -2.415565, 0, 1, 0.7529412, 1,
-0.1066511, 0.9608962, -0.879547, 0, 1, 0.7607843, 1,
-0.106331, 0.08515643, -2.649496, 0, 1, 0.7647059, 1,
-0.1042108, 0.5986903, -1.316193, 0, 1, 0.772549, 1,
-0.103166, -0.3166508, -1.404839, 0, 1, 0.7764706, 1,
-0.1027816, -0.01244689, -0.9992812, 0, 1, 0.7843137, 1,
-0.1003016, 0.07049166, -0.4566976, 0, 1, 0.7882353, 1,
-0.09804998, 0.05063547, -0.5298198, 0, 1, 0.7960784, 1,
-0.09733855, -0.8967171, -3.461305, 0, 1, 0.8039216, 1,
-0.09680407, -0.2374348, -1.560998, 0, 1, 0.8078431, 1,
-0.09643687, -0.2493169, -3.272703, 0, 1, 0.8156863, 1,
-0.09264126, -0.6934455, -3.448454, 0, 1, 0.8196079, 1,
-0.09078922, -1.757861, -4.522408, 0, 1, 0.827451, 1,
-0.08970919, 0.870851, -0.1645806, 0, 1, 0.8313726, 1,
-0.08605109, -0.1483098, -2.679656, 0, 1, 0.8392157, 1,
-0.07980781, -1.418449, -2.409396, 0, 1, 0.8431373, 1,
-0.07364035, -1.458231, -3.850914, 0, 1, 0.8509804, 1,
-0.06814382, 0.1810939, 0.1943909, 0, 1, 0.854902, 1,
-0.06744251, 1.197973, -0.596402, 0, 1, 0.8627451, 1,
-0.06436332, -1.167997, -2.422502, 0, 1, 0.8666667, 1,
-0.06354708, 0.2747523, -0.2188554, 0, 1, 0.8745098, 1,
-0.06080455, -0.7570007, -3.503058, 0, 1, 0.8784314, 1,
-0.05893646, -0.4177438, -3.507996, 0, 1, 0.8862745, 1,
-0.05794869, 0.4608467, 0.03584052, 0, 1, 0.8901961, 1,
-0.05100651, -1.015195, -3.105368, 0, 1, 0.8980392, 1,
-0.04615226, 0.2405995, 0.05147007, 0, 1, 0.9058824, 1,
-0.02949041, -0.1336857, -0.4957639, 0, 1, 0.9098039, 1,
-0.02697395, -0.6641704, -5.164851, 0, 1, 0.9176471, 1,
-0.02567259, 0.11405, -0.1272821, 0, 1, 0.9215686, 1,
-0.02565909, 0.4654666, -0.7297004, 0, 1, 0.9294118, 1,
-0.02227558, -1.053675, -1.869538, 0, 1, 0.9333333, 1,
-0.01886379, -1.654493, -3.112822, 0, 1, 0.9411765, 1,
-0.01768143, -0.4395585, -3.640941, 0, 1, 0.945098, 1,
-0.01334719, -0.4921108, -3.126972, 0, 1, 0.9529412, 1,
-0.004495762, -0.6494893, -3.031321, 0, 1, 0.9568627, 1,
-0.004163615, -0.3051648, -4.882934, 0, 1, 0.9647059, 1,
-0.00189459, 0.8913999, -0.3705546, 0, 1, 0.9686275, 1,
0.004743898, 0.02939478, -0.1872517, 0, 1, 0.9764706, 1,
0.00518368, 0.2529962, -0.8449702, 0, 1, 0.9803922, 1,
0.006451185, 1.153597, -0.2475611, 0, 1, 0.9882353, 1,
0.006804074, 1.933329, -0.3360535, 0, 1, 0.9921569, 1,
0.01272314, -0.1102058, 3.712617, 0, 1, 1, 1,
0.0181662, 1.241724, 1.533212, 0, 0.9921569, 1, 1,
0.02036657, 0.9525495, 0.0397588, 0, 0.9882353, 1, 1,
0.0223352, -0.4459829, 1.096577, 0, 0.9803922, 1, 1,
0.02272321, -0.3424274, 2.949822, 0, 0.9764706, 1, 1,
0.029076, -0.2842269, 3.371722, 0, 0.9686275, 1, 1,
0.02939045, 1.15073, 0.418786, 0, 0.9647059, 1, 1,
0.03223556, -2.643505, 5.037739, 0, 0.9568627, 1, 1,
0.03319654, -0.1856198, 4.137646, 0, 0.9529412, 1, 1,
0.0370064, -0.2413692, 2.336171, 0, 0.945098, 1, 1,
0.03759779, -0.01516388, 1.832889, 0, 0.9411765, 1, 1,
0.04040241, 0.46618, 0.6107203, 0, 0.9333333, 1, 1,
0.04370478, 1.557953, 0.1962639, 0, 0.9294118, 1, 1,
0.04553172, 0.2552367, -1.808237, 0, 0.9215686, 1, 1,
0.04652574, -1.221262, 1.992845, 0, 0.9176471, 1, 1,
0.04816766, 0.7821756, 1.556943, 0, 0.9098039, 1, 1,
0.04896763, -0.9493104, 1.999605, 0, 0.9058824, 1, 1,
0.05105249, -0.4051443, 2.05108, 0, 0.8980392, 1, 1,
0.05206377, 1.465701, -0.2306987, 0, 0.8901961, 1, 1,
0.05375127, 1.44103, 0.5913619, 0, 0.8862745, 1, 1,
0.05432389, 1.137091, -0.2307469, 0, 0.8784314, 1, 1,
0.05478319, -0.08244131, 2.160326, 0, 0.8745098, 1, 1,
0.0619519, -1.598268, 6.213318, 0, 0.8666667, 1, 1,
0.06380222, 0.2087416, 0.3907419, 0, 0.8627451, 1, 1,
0.06747533, -1.473166, 2.340438, 0, 0.854902, 1, 1,
0.06775328, 0.1800745, 0.3305369, 0, 0.8509804, 1, 1,
0.06940094, -0.5527558, 5.919207, 0, 0.8431373, 1, 1,
0.07002141, -1.897047, 2.971957, 0, 0.8392157, 1, 1,
0.07147771, -0.6802302, 2.228905, 0, 0.8313726, 1, 1,
0.07465594, -1.245438, 5.132356, 0, 0.827451, 1, 1,
0.07571863, 0.02864462, 4.348553, 0, 0.8196079, 1, 1,
0.07703125, 1.224175, 0.4471849, 0, 0.8156863, 1, 1,
0.07719491, -1.004884, 4.446465, 0, 0.8078431, 1, 1,
0.07801544, -1.635335, 5.387311, 0, 0.8039216, 1, 1,
0.082103, 0.1800672, 0.5862178, 0, 0.7960784, 1, 1,
0.08849068, 1.667473, 0.8057782, 0, 0.7882353, 1, 1,
0.08914526, -0.3109557, 3.330361, 0, 0.7843137, 1, 1,
0.09020106, -1.324062, 3.558647, 0, 0.7764706, 1, 1,
0.09466811, -0.436801, 3.218059, 0, 0.772549, 1, 1,
0.09584846, 0.8490712, 1.36334, 0, 0.7647059, 1, 1,
0.09594249, -0.6495873, 1.911266, 0, 0.7607843, 1, 1,
0.09843966, 0.5809957, 0.2599261, 0, 0.7529412, 1, 1,
0.1018862, 0.2010714, 1.932557, 0, 0.7490196, 1, 1,
0.1024554, -0.7345113, 3.647872, 0, 0.7411765, 1, 1,
0.1025258, -0.8210335, 4.405293, 0, 0.7372549, 1, 1,
0.1026874, -0.1905682, 1.220996, 0, 0.7294118, 1, 1,
0.106371, 0.1636175, 0.4596957, 0, 0.7254902, 1, 1,
0.107519, 0.0380876, 0.5098321, 0, 0.7176471, 1, 1,
0.1099224, 1.581721, -0.5357677, 0, 0.7137255, 1, 1,
0.1138483, 0.5513113, -1.617778, 0, 0.7058824, 1, 1,
0.117704, -0.8875626, 3.553012, 0, 0.6980392, 1, 1,
0.1205838, -0.7994883, 4.338696, 0, 0.6941177, 1, 1,
0.1214062, 0.1393162, -0.4647192, 0, 0.6862745, 1, 1,
0.1230071, 0.9184425, 0.09762666, 0, 0.682353, 1, 1,
0.1292667, 0.03488512, 1.850657, 0, 0.6745098, 1, 1,
0.138486, 0.1139209, -0.9195345, 0, 0.6705883, 1, 1,
0.1386886, 0.7888026, -0.8512976, 0, 0.6627451, 1, 1,
0.1407624, 1.020348, 0.4308293, 0, 0.6588235, 1, 1,
0.1421837, -0.5862682, 4.377315, 0, 0.6509804, 1, 1,
0.1421986, -1.557989, 2.742069, 0, 0.6470588, 1, 1,
0.1435874, 0.5644751, 1.107321, 0, 0.6392157, 1, 1,
0.1447085, 1.740916, 1.154746, 0, 0.6352941, 1, 1,
0.1448932, -0.2054686, 1.581309, 0, 0.627451, 1, 1,
0.1479979, -0.8859014, 3.8161, 0, 0.6235294, 1, 1,
0.1514149, 0.2796974, 0.2496168, 0, 0.6156863, 1, 1,
0.1531133, 0.1734495, -0.321689, 0, 0.6117647, 1, 1,
0.1571012, 0.9031498, -0.523159, 0, 0.6039216, 1, 1,
0.1571994, -0.4453882, 1.660935, 0, 0.5960785, 1, 1,
0.1576288, -0.009461698, 1.076433, 0, 0.5921569, 1, 1,
0.1602476, 0.4753451, 1.352535, 0, 0.5843138, 1, 1,
0.16264, 0.8159391, -1.421241, 0, 0.5803922, 1, 1,
0.1699049, 1.315416, 0.9484925, 0, 0.572549, 1, 1,
0.1713793, 0.4768488, -0.1845805, 0, 0.5686275, 1, 1,
0.1716727, -0.1774018, 0.4426354, 0, 0.5607843, 1, 1,
0.1726004, -1.444837, 4.611805, 0, 0.5568628, 1, 1,
0.1740944, -1.169611, 2.854261, 0, 0.5490196, 1, 1,
0.1767483, -0.6042076, 2.255786, 0, 0.5450981, 1, 1,
0.1805607, 0.6578878, 1.06096, 0, 0.5372549, 1, 1,
0.1820739, -0.4946251, 1.628181, 0, 0.5333334, 1, 1,
0.1821465, -0.3107665, 3.319156, 0, 0.5254902, 1, 1,
0.1947879, 0.5763906, 1.245082, 0, 0.5215687, 1, 1,
0.196929, -0.2111014, 2.03662, 0, 0.5137255, 1, 1,
0.1977644, -2.304536, 2.853346, 0, 0.509804, 1, 1,
0.1998161, -0.5389602, 2.175191, 0, 0.5019608, 1, 1,
0.208287, -0.2178886, 1.820627, 0, 0.4941176, 1, 1,
0.21018, -0.4123199, 0.3075321, 0, 0.4901961, 1, 1,
0.2153415, 0.710275, 1.774371, 0, 0.4823529, 1, 1,
0.2189009, 0.6801931, -1.037086, 0, 0.4784314, 1, 1,
0.2215737, 0.5136954, 0.5598579, 0, 0.4705882, 1, 1,
0.2226101, -1.825392, 4.242922, 0, 0.4666667, 1, 1,
0.2243252, -0.6330976, 3.19598, 0, 0.4588235, 1, 1,
0.2266712, 0.599544, 3.060026, 0, 0.454902, 1, 1,
0.227303, -0.6671047, 4.620289, 0, 0.4470588, 1, 1,
0.2275353, -1.012006, 4.394886, 0, 0.4431373, 1, 1,
0.2278394, -0.6978906, 3.891969, 0, 0.4352941, 1, 1,
0.2282263, 1.714899, 2.472745, 0, 0.4313726, 1, 1,
0.2294169, 1.63619, 2.105579, 0, 0.4235294, 1, 1,
0.230098, -0.2376281, 0.453802, 0, 0.4196078, 1, 1,
0.2319799, 0.2568791, 1.41168, 0, 0.4117647, 1, 1,
0.2346515, 0.5308993, -0.7626182, 0, 0.4078431, 1, 1,
0.2373168, 1.081912, -1.143314, 0, 0.4, 1, 1,
0.2400797, -1.279235, 2.865439, 0, 0.3921569, 1, 1,
0.2440759, -1.032845, 2.615568, 0, 0.3882353, 1, 1,
0.2460404, 0.9228721, 0.9055371, 0, 0.3803922, 1, 1,
0.2463212, 0.1413475, 2.035974, 0, 0.3764706, 1, 1,
0.2504264, 0.6266177, -0.07288595, 0, 0.3686275, 1, 1,
0.2543373, -0.658893, 2.947122, 0, 0.3647059, 1, 1,
0.2566209, 1.522766, -0.2191752, 0, 0.3568628, 1, 1,
0.2590854, 0.319365, 1.64593, 0, 0.3529412, 1, 1,
0.2616046, 0.01794332, 1.450633, 0, 0.345098, 1, 1,
0.2650685, -1.174772, 3.955001, 0, 0.3411765, 1, 1,
0.2662054, 1.480841, -0.5107187, 0, 0.3333333, 1, 1,
0.2720678, -0.166869, 1.981137, 0, 0.3294118, 1, 1,
0.2756712, -2.255086, 3.236997, 0, 0.3215686, 1, 1,
0.2771814, 1.100217, 0.6559373, 0, 0.3176471, 1, 1,
0.2782664, -2.381629, 2.642916, 0, 0.3098039, 1, 1,
0.2798761, -0.3254007, 1.710982, 0, 0.3058824, 1, 1,
0.2814209, -0.2001734, 3.613398, 0, 0.2980392, 1, 1,
0.2838062, 0.213269, -0.3042466, 0, 0.2901961, 1, 1,
0.2842601, 0.9406449, -1.363329, 0, 0.2862745, 1, 1,
0.2887593, 1.655046, 0.6234173, 0, 0.2784314, 1, 1,
0.2915721, 0.2841731, 0.6547354, 0, 0.2745098, 1, 1,
0.2977169, 1.690499, -0.2665797, 0, 0.2666667, 1, 1,
0.299704, -0.6887703, 3.369258, 0, 0.2627451, 1, 1,
0.3023102, 1.854334, 1.974219, 0, 0.254902, 1, 1,
0.3023179, 1.441009, -0.4032185, 0, 0.2509804, 1, 1,
0.3154938, 2.036176, -1.365483, 0, 0.2431373, 1, 1,
0.3286243, 0.5458416, 1.592266, 0, 0.2392157, 1, 1,
0.3304082, 0.6877513, 1.811999, 0, 0.2313726, 1, 1,
0.3333704, 0.5338469, 1.413396, 0, 0.227451, 1, 1,
0.3333916, -0.4830735, 1.807995, 0, 0.2196078, 1, 1,
0.3344991, -0.3928309, 1.56942, 0, 0.2156863, 1, 1,
0.3353334, -0.4671744, 1.514452, 0, 0.2078431, 1, 1,
0.3366099, 0.9588431, -0.1071521, 0, 0.2039216, 1, 1,
0.3417649, 1.15938, -0.9105041, 0, 0.1960784, 1, 1,
0.3489867, 1.545432, -0.2785521, 0, 0.1882353, 1, 1,
0.3508083, 0.8640981, -0.2448148, 0, 0.1843137, 1, 1,
0.3518786, -0.5686311, 1.121197, 0, 0.1764706, 1, 1,
0.3525048, 0.2330088, 0.2942826, 0, 0.172549, 1, 1,
0.353432, 0.6310961, -0.03779537, 0, 0.1647059, 1, 1,
0.3599647, 1.83299, 1.180314, 0, 0.1607843, 1, 1,
0.361192, -0.3866859, 2.333231, 0, 0.1529412, 1, 1,
0.366902, -2.449945, 3.265596, 0, 0.1490196, 1, 1,
0.3676911, 0.1467225, 0.6395877, 0, 0.1411765, 1, 1,
0.3685126, 0.5053678, 1.631086, 0, 0.1372549, 1, 1,
0.3720666, 0.00537662, 2.010619, 0, 0.1294118, 1, 1,
0.3730907, -0.649209, 2.759785, 0, 0.1254902, 1, 1,
0.3745759, 1.921821, 0.439552, 0, 0.1176471, 1, 1,
0.3757364, -0.7081624, 3.289177, 0, 0.1137255, 1, 1,
0.3780738, 0.848895, 0.0734152, 0, 0.1058824, 1, 1,
0.3786604, 0.8191782, 0.9596411, 0, 0.09803922, 1, 1,
0.382975, 0.07212409, 2.102547, 0, 0.09411765, 1, 1,
0.3833841, 0.5981313, -0.452331, 0, 0.08627451, 1, 1,
0.3845779, -1.825968, 2.437913, 0, 0.08235294, 1, 1,
0.3858919, -1.255534, 1.683639, 0, 0.07450981, 1, 1,
0.3862946, -0.6927091, 2.311792, 0, 0.07058824, 1, 1,
0.38705, 2.469141, 0.8581064, 0, 0.0627451, 1, 1,
0.3873796, 1.687723, 0.05223357, 0, 0.05882353, 1, 1,
0.3890624, -1.028665, 2.163574, 0, 0.05098039, 1, 1,
0.3923727, -0.3374001, 3.561054, 0, 0.04705882, 1, 1,
0.3931504, 0.5427611, 0.7518712, 0, 0.03921569, 1, 1,
0.3947251, 0.6856854, 0.2967026, 0, 0.03529412, 1, 1,
0.3954379, 0.2015493, 1.044386, 0, 0.02745098, 1, 1,
0.3955728, -1.765954, 3.899286, 0, 0.02352941, 1, 1,
0.3986728, 1.028159, 1.141173, 0, 0.01568628, 1, 1,
0.401673, -0.6188608, 3.736805, 0, 0.01176471, 1, 1,
0.4018634, 1.36369, 0.6317151, 0, 0.003921569, 1, 1,
0.4026426, -0.8029534, 1.901735, 0.003921569, 0, 1, 1,
0.4043165, 0.7976336, 1.821591, 0.007843138, 0, 1, 1,
0.4060342, 1.338554, 1.769504, 0.01568628, 0, 1, 1,
0.406775, 1.362438, -0.81826, 0.01960784, 0, 1, 1,
0.4072266, 1.613153, -0.9046987, 0.02745098, 0, 1, 1,
0.4100978, 0.7878128, 0.3806695, 0.03137255, 0, 1, 1,
0.4102733, 0.3848976, 2.665305, 0.03921569, 0, 1, 1,
0.4103302, -1.953324, 1.345569, 0.04313726, 0, 1, 1,
0.4114282, -0.4768533, 1.831631, 0.05098039, 0, 1, 1,
0.4131947, -0.1284854, 2.346377, 0.05490196, 0, 1, 1,
0.4147019, 0.6675327, 0.6910958, 0.0627451, 0, 1, 1,
0.4178859, 1.963919, -1.740326, 0.06666667, 0, 1, 1,
0.4229379, 0.709474, 2.08516, 0.07450981, 0, 1, 1,
0.4243245, 1.38168, 0.4741095, 0.07843138, 0, 1, 1,
0.4263947, -0.7602005, 2.8074, 0.08627451, 0, 1, 1,
0.4268439, 0.551634, 0.06563381, 0.09019608, 0, 1, 1,
0.4273883, -0.4019403, 1.950838, 0.09803922, 0, 1, 1,
0.4304328, 0.7263808, 0.81177, 0.1058824, 0, 1, 1,
0.4316524, -0.8390939, 2.393198, 0.1098039, 0, 1, 1,
0.4421175, 0.6550739, 2.6964, 0.1176471, 0, 1, 1,
0.4437222, -1.491295, 2.745798, 0.1215686, 0, 1, 1,
0.4450773, -0.1057096, 1.674265, 0.1294118, 0, 1, 1,
0.4454412, 1.829167, 1.438652, 0.1333333, 0, 1, 1,
0.4528899, 2.191171, -1.153869, 0.1411765, 0, 1, 1,
0.4574195, -1.92373, 3.065315, 0.145098, 0, 1, 1,
0.457831, -0.5553801, 1.583837, 0.1529412, 0, 1, 1,
0.4653309, -0.8211947, 2.246275, 0.1568628, 0, 1, 1,
0.4659462, 0.09719153, 0.3680313, 0.1647059, 0, 1, 1,
0.4682288, 2.422997, 1.222661, 0.1686275, 0, 1, 1,
0.4687195, 1.643612, 0.6106748, 0.1764706, 0, 1, 1,
0.4691749, -0.2728633, 3.135588, 0.1803922, 0, 1, 1,
0.4721484, -0.1871701, 0.3546627, 0.1882353, 0, 1, 1,
0.4727557, -1.288454, 3.464303, 0.1921569, 0, 1, 1,
0.4735983, 0.08830942, -0.358839, 0.2, 0, 1, 1,
0.4738683, 0.1296572, 2.740203, 0.2078431, 0, 1, 1,
0.4744874, -0.07273363, 2.305928, 0.2117647, 0, 1, 1,
0.4748029, 1.118234, -0.1365362, 0.2196078, 0, 1, 1,
0.475362, -0.3796614, 2.011834, 0.2235294, 0, 1, 1,
0.4778661, -0.9633258, 2.696651, 0.2313726, 0, 1, 1,
0.4814887, 0.1676356, 0.4720594, 0.2352941, 0, 1, 1,
0.4857777, -0.7685128, 3.382104, 0.2431373, 0, 1, 1,
0.4928587, 0.4881245, 0.4745814, 0.2470588, 0, 1, 1,
0.496477, -0.7811945, 0.3514934, 0.254902, 0, 1, 1,
0.4970179, -0.8173492, 2.743443, 0.2588235, 0, 1, 1,
0.5006452, 0.7927691, 1.575894, 0.2666667, 0, 1, 1,
0.503152, -0.1236723, 3.214878, 0.2705882, 0, 1, 1,
0.5047576, -0.903607, 3.81292, 0.2784314, 0, 1, 1,
0.5081153, -1.792913, 2.37928, 0.282353, 0, 1, 1,
0.50812, -0.6654053, 2.332254, 0.2901961, 0, 1, 1,
0.5090052, -0.4588768, 2.875851, 0.2941177, 0, 1, 1,
0.5209401, -2.490532, 3.378225, 0.3019608, 0, 1, 1,
0.521419, -0.4647073, 1.594875, 0.3098039, 0, 1, 1,
0.5234718, 0.2309892, 0.3514836, 0.3137255, 0, 1, 1,
0.5265319, 0.1324193, 0.5307181, 0.3215686, 0, 1, 1,
0.5278478, 1.642724, 0.8251331, 0.3254902, 0, 1, 1,
0.5289788, -1.550886, 3.982413, 0.3333333, 0, 1, 1,
0.5291918, -0.4534647, 2.613655, 0.3372549, 0, 1, 1,
0.5335502, -0.4021871, 2.350864, 0.345098, 0, 1, 1,
0.5442596, -1.632299, 4.139375, 0.3490196, 0, 1, 1,
0.5472456, 0.5082945, 2.568258, 0.3568628, 0, 1, 1,
0.5550801, -0.9534593, 4.861184, 0.3607843, 0, 1, 1,
0.5558427, 0.04533472, 1.225597, 0.3686275, 0, 1, 1,
0.5560767, 0.7240664, -2.509255, 0.372549, 0, 1, 1,
0.5593738, 1.12018, 0.1121672, 0.3803922, 0, 1, 1,
0.5660821, -1.671581, 3.984815, 0.3843137, 0, 1, 1,
0.5717388, -0.2485709, 2.461751, 0.3921569, 0, 1, 1,
0.5723665, -3.772443, 2.713678, 0.3960784, 0, 1, 1,
0.5768564, -1.59972, 5.216221, 0.4039216, 0, 1, 1,
0.5785568, -0.8658115, 1.9748, 0.4117647, 0, 1, 1,
0.583465, -1.43897, 2.824775, 0.4156863, 0, 1, 1,
0.5879864, 0.5018588, 2.162849, 0.4235294, 0, 1, 1,
0.5905491, -1.499054, 0.5068383, 0.427451, 0, 1, 1,
0.6034577, 0.4370433, 2.692288, 0.4352941, 0, 1, 1,
0.6039149, 0.7723485, -1.528194, 0.4392157, 0, 1, 1,
0.6083709, -0.5037062, 2.853466, 0.4470588, 0, 1, 1,
0.6115859, -0.6128989, 3.142087, 0.4509804, 0, 1, 1,
0.6161873, 0.6197665, 1.021385, 0.4588235, 0, 1, 1,
0.6211408, 0.9712123, 0.5341994, 0.4627451, 0, 1, 1,
0.6261421, 1.772619, 0.6648846, 0.4705882, 0, 1, 1,
0.6278651, -1.408827, 3.943792, 0.4745098, 0, 1, 1,
0.6325641, -1.424682, 3.21331, 0.4823529, 0, 1, 1,
0.6367072, 1.144751, 0.6233455, 0.4862745, 0, 1, 1,
0.6378189, -0.6629285, 3.334132, 0.4941176, 0, 1, 1,
0.6431396, -2.075291, 2.076755, 0.5019608, 0, 1, 1,
0.6479289, 1.760846, 1.728733, 0.5058824, 0, 1, 1,
0.6614975, 0.5602678, 2.076705, 0.5137255, 0, 1, 1,
0.6639946, 1.297189, 1.260431, 0.5176471, 0, 1, 1,
0.6646173, 0.6442015, 0.6196212, 0.5254902, 0, 1, 1,
0.6802431, -1.225542, 3.037279, 0.5294118, 0, 1, 1,
0.6854958, 1.028974, 0.1111072, 0.5372549, 0, 1, 1,
0.6860645, -0.3215957, 1.241751, 0.5411765, 0, 1, 1,
0.6957535, 1.006742, 0.2261849, 0.5490196, 0, 1, 1,
0.6981138, 0.1183224, 2.410877, 0.5529412, 0, 1, 1,
0.6982282, 3.04685, 1.612122, 0.5607843, 0, 1, 1,
0.6983634, -0.304743, 1.452668, 0.5647059, 0, 1, 1,
0.698777, -1.448598, 0.742265, 0.572549, 0, 1, 1,
0.702019, -0.1563133, 2.174997, 0.5764706, 0, 1, 1,
0.7088823, 0.9933512, 0.6148779, 0.5843138, 0, 1, 1,
0.7129278, 0.7918106, 1.065211, 0.5882353, 0, 1, 1,
0.7153249, -1.04446, 3.629394, 0.5960785, 0, 1, 1,
0.7154356, 0.003146799, 1.598562, 0.6039216, 0, 1, 1,
0.7197361, 0.9362748, -0.01635697, 0.6078432, 0, 1, 1,
0.7221229, 0.7325885, 2.347708, 0.6156863, 0, 1, 1,
0.724649, -0.2181132, 1.893425, 0.6196079, 0, 1, 1,
0.7246652, -0.4247767, 2.043678, 0.627451, 0, 1, 1,
0.730221, -0.1361793, 0.8353729, 0.6313726, 0, 1, 1,
0.7305931, -2.199023, 2.294132, 0.6392157, 0, 1, 1,
0.7306082, 0.7703235, -0.8509662, 0.6431373, 0, 1, 1,
0.7341584, 1.044092, 1.783577, 0.6509804, 0, 1, 1,
0.734184, 1.014699, 1.956559, 0.654902, 0, 1, 1,
0.738014, 0.07721416, 1.743762, 0.6627451, 0, 1, 1,
0.7388014, 0.9027646, -1.746661, 0.6666667, 0, 1, 1,
0.7391012, -0.3292408, 2.244214, 0.6745098, 0, 1, 1,
0.7433927, 0.6537822, -0.1683896, 0.6784314, 0, 1, 1,
0.7434325, -0.1529196, 3.561607, 0.6862745, 0, 1, 1,
0.7458283, -0.2882525, 2.502382, 0.6901961, 0, 1, 1,
0.7543815, 0.03814289, 2.162692, 0.6980392, 0, 1, 1,
0.7598711, -0.6824357, 1.200471, 0.7058824, 0, 1, 1,
0.7617365, 0.4596685, -1.122956, 0.7098039, 0, 1, 1,
0.7632764, -0.2605495, -0.4027345, 0.7176471, 0, 1, 1,
0.7647569, -0.283804, 3.985818, 0.7215686, 0, 1, 1,
0.7664227, 1.114788, -0.1107383, 0.7294118, 0, 1, 1,
0.7685298, 0.1417633, 3.6896, 0.7333333, 0, 1, 1,
0.7692021, -1.003777, 3.250545, 0.7411765, 0, 1, 1,
0.7698688, -1.430078, 3.015917, 0.7450981, 0, 1, 1,
0.7739698, -1.10756, 5.218141, 0.7529412, 0, 1, 1,
0.7768456, 0.1427307, 0.3043734, 0.7568628, 0, 1, 1,
0.7791982, 0.1361616, 2.075243, 0.7647059, 0, 1, 1,
0.7829589, -0.3401082, 1.129079, 0.7686275, 0, 1, 1,
0.7832248, -0.5918806, 3.204189, 0.7764706, 0, 1, 1,
0.7849439, 1.166764, 0.482141, 0.7803922, 0, 1, 1,
0.7918653, 0.8463916, 0.652705, 0.7882353, 0, 1, 1,
0.7954936, 0.07397904, 0.8392844, 0.7921569, 0, 1, 1,
0.8002478, 1.377021, 0.1253104, 0.8, 0, 1, 1,
0.8309638, -0.03067647, 2.273313, 0.8078431, 0, 1, 1,
0.8357558, -0.05896274, 0.6182343, 0.8117647, 0, 1, 1,
0.836073, 2.482043, 1.577626, 0.8196079, 0, 1, 1,
0.8388219, 1.007758, -0.2601833, 0.8235294, 0, 1, 1,
0.8399326, 0.6447263, 1.773341, 0.8313726, 0, 1, 1,
0.8400616, -0.1612501, 0.8353012, 0.8352941, 0, 1, 1,
0.8422877, -0.8362821, 1.274708, 0.8431373, 0, 1, 1,
0.8427057, -1.333026, 3.289058, 0.8470588, 0, 1, 1,
0.8437147, 2.536626, -0.1649685, 0.854902, 0, 1, 1,
0.848547, 0.7033075, 1.220624, 0.8588235, 0, 1, 1,
0.8492643, -1.536303, 1.63846, 0.8666667, 0, 1, 1,
0.8642709, -1.043427, 2.68915, 0.8705882, 0, 1, 1,
0.8665337, 0.6340075, -0.2759589, 0.8784314, 0, 1, 1,
0.8761756, 1.178302, 0.7494195, 0.8823529, 0, 1, 1,
0.8785395, 0.2983656, 0.3040012, 0.8901961, 0, 1, 1,
0.8814992, 1.622192, 1.176636, 0.8941177, 0, 1, 1,
0.8847128, 0.2161164, 1.713304, 0.9019608, 0, 1, 1,
0.8851155, -0.8417776, 3.566966, 0.9098039, 0, 1, 1,
0.893959, -0.1061112, 5.235203, 0.9137255, 0, 1, 1,
0.8948225, -1.032084, 2.351005, 0.9215686, 0, 1, 1,
0.9043453, -1.191175, 3.929007, 0.9254902, 0, 1, 1,
0.9119028, -0.2818325, 2.209681, 0.9333333, 0, 1, 1,
0.9123663, 1.643701, 0.3642263, 0.9372549, 0, 1, 1,
0.9124598, -1.833257, 2.656378, 0.945098, 0, 1, 1,
0.9191459, 0.2631559, 1.791148, 0.9490196, 0, 1, 1,
0.926344, 0.07261717, 2.173363, 0.9568627, 0, 1, 1,
0.9291495, 0.4321485, 0.1120138, 0.9607843, 0, 1, 1,
0.9303541, -0.7176831, 3.128368, 0.9686275, 0, 1, 1,
0.9305714, -2.061781, 1.129224, 0.972549, 0, 1, 1,
0.9332623, -0.4599867, 1.768046, 0.9803922, 0, 1, 1,
0.9375444, 0.3845688, 1.586299, 0.9843137, 0, 1, 1,
0.9380507, 1.467221, -1.00806, 0.9921569, 0, 1, 1,
0.9518594, -1.801482, 1.072156, 0.9960784, 0, 1, 1,
0.9534667, 0.002611604, 2.956754, 1, 0, 0.9960784, 1,
0.9537917, 3.017823, -0.4929506, 1, 0, 0.9882353, 1,
0.9540387, 0.2502791, 0.1358562, 1, 0, 0.9843137, 1,
0.955649, 0.7551258, 1.684643, 1, 0, 0.9764706, 1,
0.9586025, -0.8486967, 3.292517, 1, 0, 0.972549, 1,
0.959376, -0.08604684, 1.678359, 1, 0, 0.9647059, 1,
0.9632944, -0.1074456, 1.240965, 1, 0, 0.9607843, 1,
0.9641834, 0.3839796, 0.9257626, 1, 0, 0.9529412, 1,
0.9701837, -0.3550586, 3.071434, 1, 0, 0.9490196, 1,
0.973997, 0.5579832, -0.582438, 1, 0, 0.9411765, 1,
0.9767188, 0.8673946, -0.2840958, 1, 0, 0.9372549, 1,
0.9785698, -0.09249612, 1.07984, 1, 0, 0.9294118, 1,
0.9829867, 0.2373653, 1.503349, 1, 0, 0.9254902, 1,
1.004172, -0.5459642, 2.311023, 1, 0, 0.9176471, 1,
1.00863, 0.05891518, 0.745903, 1, 0, 0.9137255, 1,
1.009775, 0.7378159, -0.6772119, 1, 0, 0.9058824, 1,
1.012808, 0.7859969, 1.761994, 1, 0, 0.9019608, 1,
1.015038, -0.9830593, 2.292993, 1, 0, 0.8941177, 1,
1.015581, -1.093119, 2.293931, 1, 0, 0.8862745, 1,
1.026763, -0.5832797, 1.758283, 1, 0, 0.8823529, 1,
1.035549, -0.303405, 1.505509, 1, 0, 0.8745098, 1,
1.036679, 0.1156287, 3.079607, 1, 0, 0.8705882, 1,
1.036795, -2.46751, 0.723176, 1, 0, 0.8627451, 1,
1.046042, 0.212663, 2.69754, 1, 0, 0.8588235, 1,
1.057397, -0.02753037, 2.25299, 1, 0, 0.8509804, 1,
1.065526, 1.688958, 0.8980947, 1, 0, 0.8470588, 1,
1.067169, 1.455226, 2.919396, 1, 0, 0.8392157, 1,
1.068159, 1.222144, -0.08809011, 1, 0, 0.8352941, 1,
1.075402, -0.5826043, 1.079282, 1, 0, 0.827451, 1,
1.075886, 0.281941, 2.313406, 1, 0, 0.8235294, 1,
1.076981, 0.1474315, 0.4119453, 1, 0, 0.8156863, 1,
1.084718, 1.298198, 0.854027, 1, 0, 0.8117647, 1,
1.092656, 0.8497307, 0.3951587, 1, 0, 0.8039216, 1,
1.103149, -0.5564488, 1.385898, 1, 0, 0.7960784, 1,
1.112561, -1.228001, 2.37114, 1, 0, 0.7921569, 1,
1.1175, -1.275296, 2.395949, 1, 0, 0.7843137, 1,
1.126994, -0.2234406, 2.545752, 1, 0, 0.7803922, 1,
1.1301, -1.897374, 3.212676, 1, 0, 0.772549, 1,
1.144861, -0.1474736, 1.096566, 1, 0, 0.7686275, 1,
1.160416, 1.030331, 1.131719, 1, 0, 0.7607843, 1,
1.164474, 0.8240039, 1.583335, 1, 0, 0.7568628, 1,
1.166, 0.6172271, -1.81626, 1, 0, 0.7490196, 1,
1.167237, -2.511426, 3.157237, 1, 0, 0.7450981, 1,
1.170292, -0.468684, 1.932383, 1, 0, 0.7372549, 1,
1.172497, -0.4487677, 1.216283, 1, 0, 0.7333333, 1,
1.173966, -0.05345948, 3.256526, 1, 0, 0.7254902, 1,
1.175173, -0.7733959, 2.96182, 1, 0, 0.7215686, 1,
1.175935, -0.1050943, -0.4270775, 1, 0, 0.7137255, 1,
1.177555, -0.2447486, 1.056748, 1, 0, 0.7098039, 1,
1.179832, -0.7365835, 1.188116, 1, 0, 0.7019608, 1,
1.183559, -0.4619592, 2.322104, 1, 0, 0.6941177, 1,
1.190402, 1.154034, 1.283334, 1, 0, 0.6901961, 1,
1.190886, -0.9867712, 2.385338, 1, 0, 0.682353, 1,
1.194384, -1.701861, 2.112376, 1, 0, 0.6784314, 1,
1.196078, 0.6359148, 1.686613, 1, 0, 0.6705883, 1,
1.204657, -0.2605936, 0.5805582, 1, 0, 0.6666667, 1,
1.208433, -0.0127617, 0.5881996, 1, 0, 0.6588235, 1,
1.225956, -0.7221418, 2.863191, 1, 0, 0.654902, 1,
1.228242, -1.274727, 3.994618, 1, 0, 0.6470588, 1,
1.229653, 0.05727391, -0.3645173, 1, 0, 0.6431373, 1,
1.232361, -0.9331461, 2.093858, 1, 0, 0.6352941, 1,
1.235599, 0.6054074, 0.1094172, 1, 0, 0.6313726, 1,
1.240118, 0.7407561, -0.1564217, 1, 0, 0.6235294, 1,
1.241792, -0.07641906, 2.589735, 1, 0, 0.6196079, 1,
1.244613, -0.8498439, 0.8375103, 1, 0, 0.6117647, 1,
1.253667, 0.6244595, 0.8888083, 1, 0, 0.6078432, 1,
1.25536, 0.06184328, 1.850362, 1, 0, 0.6, 1,
1.255645, -2.754434, 4.368359, 1, 0, 0.5921569, 1,
1.272625, -1.205281, 3.154836, 1, 0, 0.5882353, 1,
1.274039, 0.1653906, 0.6819289, 1, 0, 0.5803922, 1,
1.30313, -1.918043, 2.067011, 1, 0, 0.5764706, 1,
1.311286, 0.1895341, 0.2990995, 1, 0, 0.5686275, 1,
1.324381, -1.061446, 4.304644, 1, 0, 0.5647059, 1,
1.327469, -0.2290809, 2.072318, 1, 0, 0.5568628, 1,
1.343978, 0.6521162, 0.7775143, 1, 0, 0.5529412, 1,
1.347735, -0.480254, 1.446371, 1, 0, 0.5450981, 1,
1.351082, -1.792374, 2.724751, 1, 0, 0.5411765, 1,
1.37101, -0.4657242, 1.877499, 1, 0, 0.5333334, 1,
1.385184, -1.760737, 3.414291, 1, 0, 0.5294118, 1,
1.406367, 0.6796424, 2.800914, 1, 0, 0.5215687, 1,
1.410591, -1.258192, 2.585751, 1, 0, 0.5176471, 1,
1.416941, -1.080718, 1.276587, 1, 0, 0.509804, 1,
1.420769, -0.01494649, 0.8289924, 1, 0, 0.5058824, 1,
1.421008, 0.4979129, 1.217717, 1, 0, 0.4980392, 1,
1.426634, 0.9188486, 1.96006, 1, 0, 0.4901961, 1,
1.427381, 0.6518384, -0.4175656, 1, 0, 0.4862745, 1,
1.453951, 0.264556, 2.102684, 1, 0, 0.4784314, 1,
1.458011, 0.02182856, 0.8380195, 1, 0, 0.4745098, 1,
1.461511, -0.7042952, 2.012877, 1, 0, 0.4666667, 1,
1.466023, 0.4152361, -2.662023e-05, 1, 0, 0.4627451, 1,
1.473636, -0.0216304, 0.2283349, 1, 0, 0.454902, 1,
1.494083, 1.39673, 1.672503, 1, 0, 0.4509804, 1,
1.496955, -1.03177, 1.912117, 1, 0, 0.4431373, 1,
1.510177, -0.2699327, 1.264478, 1, 0, 0.4392157, 1,
1.512477, 1.074971, 1.12312, 1, 0, 0.4313726, 1,
1.512748, 0.8869245, 2.136041, 1, 0, 0.427451, 1,
1.519427, -0.2465053, 3.039804, 1, 0, 0.4196078, 1,
1.520159, 0.3847235, 0.9937525, 1, 0, 0.4156863, 1,
1.539966, -0.084687, 2.913843, 1, 0, 0.4078431, 1,
1.56045, 0.04604257, 0.9050542, 1, 0, 0.4039216, 1,
1.56096, -1.295139, 1.384941, 1, 0, 0.3960784, 1,
1.561324, 0.5066484, 1.638031, 1, 0, 0.3882353, 1,
1.562917, 0.3795566, 1.195142, 1, 0, 0.3843137, 1,
1.582079, 0.6470139, 0.973396, 1, 0, 0.3764706, 1,
1.59265, 1.517161, -0.1963886, 1, 0, 0.372549, 1,
1.606341, 1.528382, 2.402074, 1, 0, 0.3647059, 1,
1.60764, 0.9279115, 2.709723, 1, 0, 0.3607843, 1,
1.619489, -0.5720056, 1.274862, 1, 0, 0.3529412, 1,
1.623143, 0.7285765, -0.7801355, 1, 0, 0.3490196, 1,
1.643163, 0.4398878, 1.943109, 1, 0, 0.3411765, 1,
1.666428, -0.9932938, 1.22222, 1, 0, 0.3372549, 1,
1.702408, -0.06413957, 1.046241, 1, 0, 0.3294118, 1,
1.708856, -0.009876997, 2.394561, 1, 0, 0.3254902, 1,
1.709923, -0.1553927, 1.126485, 1, 0, 0.3176471, 1,
1.712728, -0.516547, 2.452168, 1, 0, 0.3137255, 1,
1.720863, 1.424695, 1.558075, 1, 0, 0.3058824, 1,
1.723816, 0.90955, -0.3077124, 1, 0, 0.2980392, 1,
1.741235, 0.3751207, 0.03325119, 1, 0, 0.2941177, 1,
1.749816, 0.03564482, 3.577597, 1, 0, 0.2862745, 1,
1.773354, -0.493944, 1.514644, 1, 0, 0.282353, 1,
1.804031, 1.157617, 1.075236, 1, 0, 0.2745098, 1,
1.849728, 1.804682, 1.253158, 1, 0, 0.2705882, 1,
1.89656, 0.53996, 0.6635799, 1, 0, 0.2627451, 1,
1.916355, -0.4964294, 1.426861, 1, 0, 0.2588235, 1,
1.918152, -0.2764117, 0.7717515, 1, 0, 0.2509804, 1,
1.928612, -0.3400884, 0.580133, 1, 0, 0.2470588, 1,
1.949725, -0.4120709, 1.390736, 1, 0, 0.2392157, 1,
1.953603, -1.113906, 2.337281, 1, 0, 0.2352941, 1,
1.960624, -0.2785314, 2.967918, 1, 0, 0.227451, 1,
1.964302, 0.9376628, 0.58345, 1, 0, 0.2235294, 1,
1.972924, 0.6223239, 1.953428, 1, 0, 0.2156863, 1,
1.99243, -1.030636, 1.25077, 1, 0, 0.2117647, 1,
1.998698, 1.464509, -0.9837093, 1, 0, 0.2039216, 1,
2.010533, -0.3934675, 1.445415, 1, 0, 0.1960784, 1,
2.027994, -1.713764, 2.252558, 1, 0, 0.1921569, 1,
2.030894, -0.4661458, 3.328144, 1, 0, 0.1843137, 1,
2.038313, -2.058786, 2.29187, 1, 0, 0.1803922, 1,
2.043903, -0.5626419, 1.085005, 1, 0, 0.172549, 1,
2.045285, -0.5932174, 1.691501, 1, 0, 0.1686275, 1,
2.127317, 0.2433241, 3.957847, 1, 0, 0.1607843, 1,
2.148469, 0.2117907, 1.072254, 1, 0, 0.1568628, 1,
2.186567, 0.4428191, 0.1579218, 1, 0, 0.1490196, 1,
2.212853, 0.3810571, 3.058794, 1, 0, 0.145098, 1,
2.279142, -0.2882313, 0.9931798, 1, 0, 0.1372549, 1,
2.313526, 1.631167, 0.8496652, 1, 0, 0.1333333, 1,
2.324754, -0.5170484, -0.01999342, 1, 0, 0.1254902, 1,
2.331792, -0.1971069, 1.146685, 1, 0, 0.1215686, 1,
2.467844, -0.0675626, 1.127539, 1, 0, 0.1137255, 1,
2.478527, -1.161691, 3.068944, 1, 0, 0.1098039, 1,
2.487074, -1.5114, 2.151899, 1, 0, 0.1019608, 1,
2.517945, 1.76402, 3.299021, 1, 0, 0.09411765, 1,
2.540782, -0.1110134, -0.1378013, 1, 0, 0.09019608, 1,
2.583685, 0.3886656, 0.5247937, 1, 0, 0.08235294, 1,
2.623388, 0.1456023, 0.1748754, 1, 0, 0.07843138, 1,
2.631128, -0.3730723, 0.7156821, 1, 0, 0.07058824, 1,
2.840611, -0.3536946, 2.147051, 1, 0, 0.06666667, 1,
2.848088, 0.2652469, 1.868982, 1, 0, 0.05882353, 1,
2.896008, -2.141005, -0.03171285, 1, 0, 0.05490196, 1,
2.93072, 0.3245766, 1.081466, 1, 0, 0.04705882, 1,
2.939549, 0.2166015, 1.767312, 1, 0, 0.04313726, 1,
3.002257, -0.2352832, 1.672105, 1, 0, 0.03529412, 1,
3.060472, 1.466613, 0.8953342, 1, 0, 0.03137255, 1,
3.094438, -1.282048, 1.718957, 1, 0, 0.02352941, 1,
3.653852, -0.8511835, 1.122976, 1, 0, 0.01960784, 1,
3.687978, 0.4046343, 2.037697, 1, 0, 0.01176471, 1,
4.00849, -1.683023, 2.821132, 1, 0, 0.007843138, 1
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
0.4311532, -4.928313, -7.289853, 0, -0.5, 0.5, 0.5,
0.4311532, -4.928313, -7.289853, 1, -0.5, 0.5, 0.5,
0.4311532, -4.928313, -7.289853, 1, 1.5, 0.5, 0.5,
0.4311532, -4.928313, -7.289853, 0, 1.5, 0.5, 0.5
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
-4.358901, -0.3627968, -7.289853, 0, -0.5, 0.5, 0.5,
-4.358901, -0.3627968, -7.289853, 1, -0.5, 0.5, 0.5,
-4.358901, -0.3627968, -7.289853, 1, 1.5, 0.5, 0.5,
-4.358901, -0.3627968, -7.289853, 0, 1.5, 0.5, 0.5
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
-4.358901, -4.928313, 0.4402654, 0, -0.5, 0.5, 0.5,
-4.358901, -4.928313, 0.4402654, 1, -0.5, 0.5, 0.5,
-4.358901, -4.928313, 0.4402654, 1, 1.5, 0.5, 0.5,
-4.358901, -4.928313, 0.4402654, 0, 1.5, 0.5, 0.5
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
-2, -3.874733, -5.505979,
4, -3.874733, -5.505979,
-2, -3.874733, -5.505979,
-2, -4.05033, -5.803291,
0, -3.874733, -5.505979,
0, -4.05033, -5.803291,
2, -3.874733, -5.505979,
2, -4.05033, -5.803291,
4, -3.874733, -5.505979,
4, -4.05033, -5.803291
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
"2",
"4"
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
-2, -4.401523, -6.397916, 0, -0.5, 0.5, 0.5,
-2, -4.401523, -6.397916, 1, -0.5, 0.5, 0.5,
-2, -4.401523, -6.397916, 1, 1.5, 0.5, 0.5,
-2, -4.401523, -6.397916, 0, 1.5, 0.5, 0.5,
0, -4.401523, -6.397916, 0, -0.5, 0.5, 0.5,
0, -4.401523, -6.397916, 1, -0.5, 0.5, 0.5,
0, -4.401523, -6.397916, 1, 1.5, 0.5, 0.5,
0, -4.401523, -6.397916, 0, 1.5, 0.5, 0.5,
2, -4.401523, -6.397916, 0, -0.5, 0.5, 0.5,
2, -4.401523, -6.397916, 1, -0.5, 0.5, 0.5,
2, -4.401523, -6.397916, 1, 1.5, 0.5, 0.5,
2, -4.401523, -6.397916, 0, 1.5, 0.5, 0.5,
4, -4.401523, -6.397916, 0, -0.5, 0.5, 0.5,
4, -4.401523, -6.397916, 1, -0.5, 0.5, 0.5,
4, -4.401523, -6.397916, 1, 1.5, 0.5, 0.5,
4, -4.401523, -6.397916, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.253504, -3, -5.505979,
-3.253504, 3, -5.505979,
-3.253504, -3, -5.505979,
-3.437737, -3, -5.803291,
-3.253504, -2, -5.505979,
-3.437737, -2, -5.803291,
-3.253504, -1, -5.505979,
-3.437737, -1, -5.803291,
-3.253504, 0, -5.505979,
-3.437737, 0, -5.803291,
-3.253504, 1, -5.505979,
-3.437737, 1, -5.803291,
-3.253504, 2, -5.505979,
-3.437737, 2, -5.803291,
-3.253504, 3, -5.505979,
-3.437737, 3, -5.803291
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
-3.806202, -3, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, -3, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, -3, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, -3, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, -2, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, -2, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, -2, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, -2, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, -1, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, -1, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, -1, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, -1, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, 0, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, 0, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, 0, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, 0, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, 1, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, 1, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, 1, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, 1, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, 2, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, 2, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, 2, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, 2, -6.397916, 0, 1.5, 0.5, 0.5,
-3.806202, 3, -6.397916, 0, -0.5, 0.5, 0.5,
-3.806202, 3, -6.397916, 1, -0.5, 0.5, 0.5,
-3.806202, 3, -6.397916, 1, 1.5, 0.5, 0.5,
-3.806202, 3, -6.397916, 0, 1.5, 0.5, 0.5
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
-3.253504, -3.874733, -4,
-3.253504, -3.874733, 6,
-3.253504, -3.874733, -4,
-3.437737, -4.05033, -4,
-3.253504, -3.874733, -2,
-3.437737, -4.05033, -2,
-3.253504, -3.874733, 0,
-3.437737, -4.05033, 0,
-3.253504, -3.874733, 2,
-3.437737, -4.05033, 2,
-3.253504, -3.874733, 4,
-3.437737, -4.05033, 4,
-3.253504, -3.874733, 6,
-3.437737, -4.05033, 6
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
"4",
"6"
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
-3.806202, -4.401523, -4, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, -4, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, -4, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, -4, 0, 1.5, 0.5, 0.5,
-3.806202, -4.401523, -2, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, -2, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, -2, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, -2, 0, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 0, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 0, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 0, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 0, 0, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 2, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 2, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 2, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 2, 0, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 4, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 4, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 4, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 4, 0, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 6, 0, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 6, 1, -0.5, 0.5, 0.5,
-3.806202, -4.401523, 6, 1, 1.5, 0.5, 0.5,
-3.806202, -4.401523, 6, 0, 1.5, 0.5, 0.5
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
-3.253504, -3.874733, -5.505979,
-3.253504, 3.149139, -5.505979,
-3.253504, -3.874733, 6.38651,
-3.253504, 3.149139, 6.38651,
-3.253504, -3.874733, -5.505979,
-3.253504, -3.874733, 6.38651,
-3.253504, 3.149139, -5.505979,
-3.253504, 3.149139, 6.38651,
-3.253504, -3.874733, -5.505979,
4.11581, -3.874733, -5.505979,
-3.253504, -3.874733, 6.38651,
4.11581, -3.874733, 6.38651,
-3.253504, 3.149139, -5.505979,
4.11581, 3.149139, -5.505979,
-3.253504, 3.149139, 6.38651,
4.11581, 3.149139, 6.38651,
4.11581, -3.874733, -5.505979,
4.11581, 3.149139, -5.505979,
4.11581, -3.874733, 6.38651,
4.11581, 3.149139, 6.38651,
4.11581, -3.874733, -5.505979,
4.11581, -3.874733, 6.38651,
4.11581, 3.149139, -5.505979,
4.11581, 3.149139, 6.38651
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
var radius = 8.359361;
var distance = 37.19175;
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
mvMatrix.translate( -0.4311532, 0.3627968, -0.4402654 );
mvMatrix.scale( 1.226478, 1.286798, 0.7600011 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.19175);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Chlordimeform<-read.table("Chlordimeform.xyz")
```

```
## Error in read.table("Chlordimeform.xyz"): no lines available in input
```

```r
x<-Chlordimeform$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlordimeform' not found
```

```r
y<-Chlordimeform$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlordimeform' not found
```

```r
z<-Chlordimeform$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlordimeform' not found
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
-3.146184, 0.7692389, -0.2167683, 0, 0, 1, 1, 1,
-2.693034, 1.931542, -1.786575, 1, 0, 0, 1, 1,
-2.622756, -0.2335086, -1.059605, 1, 0, 0, 1, 1,
-2.559824, 0.5701511, -0.4023956, 1, 0, 0, 1, 1,
-2.47841, -1.398499, -0.9526748, 1, 0, 0, 1, 1,
-2.465189, -0.3568316, -2.542288, 1, 0, 0, 1, 1,
-2.352406, -0.8030813, -2.306037, 0, 0, 0, 1, 1,
-2.329852, -0.4442735, -2.421676, 0, 0, 0, 1, 1,
-2.325653, 0.8474296, 0.02389966, 0, 0, 0, 1, 1,
-2.253628, 0.03168132, -2.376314, 0, 0, 0, 1, 1,
-2.231607, -2.154474, -3.692964, 0, 0, 0, 1, 1,
-2.213201, 0.8047436, -1.77963, 0, 0, 0, 1, 1,
-2.147834, -0.001147233, -3.301753, 0, 0, 0, 1, 1,
-2.116288, -0.05873426, -0.3760875, 1, 1, 1, 1, 1,
-2.112716, 2.183012, -1.485764, 1, 1, 1, 1, 1,
-2.045342, -0.223652, -1.007366, 1, 1, 1, 1, 1,
-2.01728, -0.8273619, -2.398528, 1, 1, 1, 1, 1,
-2.012246, -0.09400491, -0.3850636, 1, 1, 1, 1, 1,
-2.006058, 1.031029, -0.1330602, 1, 1, 1, 1, 1,
-2.00097, -2.461443, -1.15109, 1, 1, 1, 1, 1,
-1.99201, 0.7927522, -2.089658, 1, 1, 1, 1, 1,
-1.990093, -1.222177, -1.589576, 1, 1, 1, 1, 1,
-1.972398, 0.4476499, -1.220379, 1, 1, 1, 1, 1,
-1.968352, 2.236118, -0.6133617, 1, 1, 1, 1, 1,
-1.964145, 1.412824, -1.650564, 1, 1, 1, 1, 1,
-1.957342, 0.8684061, -1.055476, 1, 1, 1, 1, 1,
-1.882456, 1.083709, -0.03634425, 1, 1, 1, 1, 1,
-1.881008, 0.6574523, -2.689953, 1, 1, 1, 1, 1,
-1.876676, 1.141264, -3.210614, 0, 0, 1, 1, 1,
-1.869332, -0.08536004, -1.654352, 1, 0, 0, 1, 1,
-1.841994, -0.06174304, -1.243173, 1, 0, 0, 1, 1,
-1.833818, 1.17046, -2.400442, 1, 0, 0, 1, 1,
-1.823827, 0.8573521, -1.40067, 1, 0, 0, 1, 1,
-1.815112, -1.125883, -1.456634, 1, 0, 0, 1, 1,
-1.805474, 1.579277, -2.825041, 0, 0, 0, 1, 1,
-1.801111, -0.1671552, -1.808243, 0, 0, 0, 1, 1,
-1.787876, -1.078897, -1.498801, 0, 0, 0, 1, 1,
-1.76664, 0.1734291, -0.3653836, 0, 0, 0, 1, 1,
-1.755739, -0.09037377, -1.438471, 0, 0, 0, 1, 1,
-1.749479, 0.4598403, -1.901247, 0, 0, 0, 1, 1,
-1.738506, 1.037645, -0.9894674, 0, 0, 0, 1, 1,
-1.732672, 0.3939193, 0.1601506, 1, 1, 1, 1, 1,
-1.726886, -1.464663, -3.668294, 1, 1, 1, 1, 1,
-1.717245, -0.30596, -0.3647025, 1, 1, 1, 1, 1,
-1.707554, -1.346123, -0.8852963, 1, 1, 1, 1, 1,
-1.701663, 0.8396964, -2.305224, 1, 1, 1, 1, 1,
-1.698502, 0.2303099, 0.7978144, 1, 1, 1, 1, 1,
-1.682919, -0.08870374, -1.537297, 1, 1, 1, 1, 1,
-1.68059, 0.8745476, -1.82999, 1, 1, 1, 1, 1,
-1.673997, -0.8258885, -2.007392, 1, 1, 1, 1, 1,
-1.660756, -1.048065, -2.7866, 1, 1, 1, 1, 1,
-1.643775, -0.2437121, -1.577356, 1, 1, 1, 1, 1,
-1.632042, -0.001507926, -1.121249, 1, 1, 1, 1, 1,
-1.53919, -2.245779, -1.348442, 1, 1, 1, 1, 1,
-1.532827, 0.2809441, -3.315366, 1, 1, 1, 1, 1,
-1.531261, 0.6744788, -1.17466, 1, 1, 1, 1, 1,
-1.530022, -0.2316393, 0.2764833, 0, 0, 1, 1, 1,
-1.525973, 0.7628928, -2.274456, 1, 0, 0, 1, 1,
-1.523427, -0.2694164, -1.887045, 1, 0, 0, 1, 1,
-1.518882, 0.7513611, -0.9406204, 1, 0, 0, 1, 1,
-1.514974, 0.5011588, -1.507984, 1, 0, 0, 1, 1,
-1.509148, -1.290025, -1.527399, 1, 0, 0, 1, 1,
-1.502018, 0.3506948, -2.026373, 0, 0, 0, 1, 1,
-1.50164, -1.35837, -1.707721, 0, 0, 0, 1, 1,
-1.500947, 0.2976197, -0.1771402, 0, 0, 0, 1, 1,
-1.493978, -1.457113, -1.771504, 0, 0, 0, 1, 1,
-1.483248, 1.58948, 1.900898, 0, 0, 0, 1, 1,
-1.481291, -0.9785666, -3.798384, 0, 0, 0, 1, 1,
-1.478547, 0.6138062, -0.9885482, 0, 0, 0, 1, 1,
-1.463436, 0.3525836, -2.97122, 1, 1, 1, 1, 1,
-1.454373, -0.494198, -2.355566, 1, 1, 1, 1, 1,
-1.45197, 0.5595868, -2.516963, 1, 1, 1, 1, 1,
-1.434455, -2.225472, -0.8915685, 1, 1, 1, 1, 1,
-1.428542, -0.4193886, -1.842322, 1, 1, 1, 1, 1,
-1.426669, 1.170385, -1.354784, 1, 1, 1, 1, 1,
-1.426033, -0.3191629, -1.220829, 1, 1, 1, 1, 1,
-1.424818, -0.8869645, -1.686478, 1, 1, 1, 1, 1,
-1.419341, -0.02602741, -1.391687, 1, 1, 1, 1, 1,
-1.413525, 1.295843, -0.9519716, 1, 1, 1, 1, 1,
-1.409555, 0.9396231, -0.5221266, 1, 1, 1, 1, 1,
-1.398011, 2.288297, 0.08691134, 1, 1, 1, 1, 1,
-1.395226, 0.2894368, -1.85563, 1, 1, 1, 1, 1,
-1.39307, 0.4731571, -1.207013, 1, 1, 1, 1, 1,
-1.387837, 0.7303427, 0.1505563, 1, 1, 1, 1, 1,
-1.386588, 1.022903, -1.08745, 0, 0, 1, 1, 1,
-1.368497, -2.455796, -1.991395, 1, 0, 0, 1, 1,
-1.366749, 0.2580831, -1.321601, 1, 0, 0, 1, 1,
-1.352435, 1.5154, -0.4912587, 1, 0, 0, 1, 1,
-1.345602, 0.09406117, -1.466544, 1, 0, 0, 1, 1,
-1.326025, -1.459383, -3.209084, 1, 0, 0, 1, 1,
-1.312304, 1.166642, 0.008366563, 0, 0, 0, 1, 1,
-1.310519, -0.5438532, -0.5157701, 0, 0, 0, 1, 1,
-1.305472, 0.8535981, -1.663252, 0, 0, 0, 1, 1,
-1.297043, -0.09094244, -2.011821, 0, 0, 0, 1, 1,
-1.296181, -0.2471652, -0.1877978, 0, 0, 0, 1, 1,
-1.295232, -0.9665624, -0.7433332, 0, 0, 0, 1, 1,
-1.29452, -0.5231817, -1.294578, 0, 0, 0, 1, 1,
-1.289487, 1.033229, -2.1047, 1, 1, 1, 1, 1,
-1.286871, 0.9158358, -1.084595, 1, 1, 1, 1, 1,
-1.286012, 1.120545, -1.910771, 1, 1, 1, 1, 1,
-1.284985, -0.9269931, -2.14961, 1, 1, 1, 1, 1,
-1.282265, 0.5951327, -0.6015927, 1, 1, 1, 1, 1,
-1.278041, -0.785131, -1.963712, 1, 1, 1, 1, 1,
-1.275685, 0.7199645, -2.283052, 1, 1, 1, 1, 1,
-1.247079, 0.8488977, -2.658245, 1, 1, 1, 1, 1,
-1.245763, 0.4796248, -2.4645, 1, 1, 1, 1, 1,
-1.245082, 0.6138017, -1.974672, 1, 1, 1, 1, 1,
-1.239829, 0.5681906, -1.888696, 1, 1, 1, 1, 1,
-1.237766, -0.3677051, -2.610737, 1, 1, 1, 1, 1,
-1.232799, -0.5620564, -0.7677604, 1, 1, 1, 1, 1,
-1.214927, -1.210186, -1.436129, 1, 1, 1, 1, 1,
-1.206997, -1.066093, -2.899538, 1, 1, 1, 1, 1,
-1.202895, 0.001071285, -0.8776578, 0, 0, 1, 1, 1,
-1.196249, -0.6608456, -1.015466, 1, 0, 0, 1, 1,
-1.19452, -1.626347, -3.132703, 1, 0, 0, 1, 1,
-1.193318, -2.427881, -3.421237, 1, 0, 0, 1, 1,
-1.191904, 0.1382843, -1.328903, 1, 0, 0, 1, 1,
-1.181731, -2.035161, -3.289172, 1, 0, 0, 1, 1,
-1.180287, 0.7111344, -1.743512, 0, 0, 0, 1, 1,
-1.18002, -1.594326, -1.259579, 0, 0, 0, 1, 1,
-1.175516, -0.5136051, -2.136341, 0, 0, 0, 1, 1,
-1.172583, -0.5909869, -0.7093298, 0, 0, 0, 1, 1,
-1.171324, 0.3400969, -2.540129, 0, 0, 0, 1, 1,
-1.16611, 1.30975, -0.7092115, 0, 0, 0, 1, 1,
-1.164696, -0.3465248, -0.571398, 0, 0, 0, 1, 1,
-1.163079, 1.542491, -0.0316731, 1, 1, 1, 1, 1,
-1.158446, 0.4044221, -0.5954323, 1, 1, 1, 1, 1,
-1.157712, -1.091562, -1.164043, 1, 1, 1, 1, 1,
-1.15732, 0.3494913, -2.221714, 1, 1, 1, 1, 1,
-1.156632, -0.7167286, -3.757614, 1, 1, 1, 1, 1,
-1.156038, -0.3850543, -2.087564, 1, 1, 1, 1, 1,
-1.154136, 0.6300202, -1.096415, 1, 1, 1, 1, 1,
-1.153438, 1.542928, -1.390597, 1, 1, 1, 1, 1,
-1.150246, 0.8743003, -1.968722, 1, 1, 1, 1, 1,
-1.149318, -0.40712, -3.518873, 1, 1, 1, 1, 1,
-1.145854, -0.01215406, -1.401601, 1, 1, 1, 1, 1,
-1.137888, -0.6913707, -2.608956, 1, 1, 1, 1, 1,
-1.137042, -0.728652, -2.680017, 1, 1, 1, 1, 1,
-1.135207, 1.774995, 0.9933293, 1, 1, 1, 1, 1,
-1.129714, -0.03904967, -1.016071, 1, 1, 1, 1, 1,
-1.123781, -0.5546744, -2.648711, 0, 0, 1, 1, 1,
-1.121782, -0.4461476, -2.22662, 1, 0, 0, 1, 1,
-1.118018, 1.344126, 0.4094539, 1, 0, 0, 1, 1,
-1.113848, -1.304742, -3.252711, 1, 0, 0, 1, 1,
-1.110679, -1.119888, -1.36003, 1, 0, 0, 1, 1,
-1.107661, -0.7949526, -1.230479, 1, 0, 0, 1, 1,
-1.107183, 1.121158, -1.409929, 0, 0, 0, 1, 1,
-1.102585, 0.5945232, -1.196427, 0, 0, 0, 1, 1,
-1.102132, -0.1236832, -2.435508, 0, 0, 0, 1, 1,
-1.073065, -0.1054085, -1.182799, 0, 0, 0, 1, 1,
-1.061415, -0.1112942, -1.871712, 0, 0, 0, 1, 1,
-1.050479, 0.8736317, -0.6223022, 0, 0, 0, 1, 1,
-1.035667, -2.576727, -3.376332, 0, 0, 0, 1, 1,
-1.034369, -2.156662, -1.615637, 1, 1, 1, 1, 1,
-1.032712, 0.05089225, -1.175009, 1, 1, 1, 1, 1,
-1.031567, 0.3361501, -1.658133, 1, 1, 1, 1, 1,
-1.021534, 1.421459, -1.665316, 1, 1, 1, 1, 1,
-1.011367, 1.792487, -0.3542476, 1, 1, 1, 1, 1,
-1.00497, -0.1301151, -3.544045, 1, 1, 1, 1, 1,
-0.994908, 1.749068, -1.752393, 1, 1, 1, 1, 1,
-0.9841266, 1.196586, 0.7607667, 1, 1, 1, 1, 1,
-0.978789, 0.3239663, -1.993353, 1, 1, 1, 1, 1,
-0.9779109, 0.1320128, -0.9816713, 1, 1, 1, 1, 1,
-0.9702931, -0.5661223, -1.869603, 1, 1, 1, 1, 1,
-0.9683813, -0.1181566, -2.974756, 1, 1, 1, 1, 1,
-0.968313, -0.4013709, -1.944947, 1, 1, 1, 1, 1,
-0.9669656, 0.860024, -1.21048, 1, 1, 1, 1, 1,
-0.9466911, 0.08922508, -3.049853, 1, 1, 1, 1, 1,
-0.9438966, -1.619786, -1.423043, 0, 0, 1, 1, 1,
-0.942317, -0.3523048, -1.925339, 1, 0, 0, 1, 1,
-0.9414939, -1.546346, -1.631091, 1, 0, 0, 1, 1,
-0.9366176, 0.6147506, -0.7440416, 1, 0, 0, 1, 1,
-0.9365032, 0.9809039, 0.005766528, 1, 0, 0, 1, 1,
-0.9331353, -1.040381, -1.958531, 1, 0, 0, 1, 1,
-0.9322117, 1.269705, 0.7292429, 0, 0, 0, 1, 1,
-0.9197444, 1.348094, -0.08539208, 0, 0, 0, 1, 1,
-0.918109, 2.808921, -1.208135, 0, 0, 0, 1, 1,
-0.9155795, -0.2623362, -1.520697, 0, 0, 0, 1, 1,
-0.9134426, -3.529808, -3.857256, 0, 0, 0, 1, 1,
-0.8996217, -0.5890481, -0.9683356, 0, 0, 0, 1, 1,
-0.8975075, 0.6165307, -1.389962, 0, 0, 0, 1, 1,
-0.8926679, -0.5032408, -2.462959, 1, 1, 1, 1, 1,
-0.8871897, 0.3734086, -1.268925, 1, 1, 1, 1, 1,
-0.8683631, 0.9175218, -1.521437, 1, 1, 1, 1, 1,
-0.8638721, 0.6697194, -1.136571, 1, 1, 1, 1, 1,
-0.8598137, -0.980966, -1.452578, 1, 1, 1, 1, 1,
-0.8593724, -0.2377168, -2.088828, 1, 1, 1, 1, 1,
-0.8531802, -0.3462212, -2.00486, 1, 1, 1, 1, 1,
-0.8524773, 0.9765347, -1.377512, 1, 1, 1, 1, 1,
-0.8482249, -1.028359, -3.175286, 1, 1, 1, 1, 1,
-0.8458628, -0.2706232, -3.732787, 1, 1, 1, 1, 1,
-0.8455877, -1.869685, -2.300148, 1, 1, 1, 1, 1,
-0.8326853, 0.163912, 0.4620319, 1, 1, 1, 1, 1,
-0.8285756, 2.369463, 0.1724709, 1, 1, 1, 1, 1,
-0.8227573, 0.02959958, -0.9877798, 1, 1, 1, 1, 1,
-0.8218305, 0.7959535, -1.178274, 1, 1, 1, 1, 1,
-0.8166686, 0.4333593, -0.5641394, 0, 0, 1, 1, 1,
-0.8153329, 0.730522, -1.086118, 1, 0, 0, 1, 1,
-0.8152145, 0.3502765, -1.040812, 1, 0, 0, 1, 1,
-0.8138946, -1.368877, -2.333132, 1, 0, 0, 1, 1,
-0.8133594, -0.2596868, -1.475804, 1, 0, 0, 1, 1,
-0.806142, -0.355756, -3.167839, 1, 0, 0, 1, 1,
-0.8061413, 0.05886258, -0.8135914, 0, 0, 0, 1, 1,
-0.8048714, 0.8853272, -0.8154822, 0, 0, 0, 1, 1,
-0.8037, 0.7955139, 0.01395371, 0, 0, 0, 1, 1,
-0.8025264, -0.7986642, -2.258026, 0, 0, 0, 1, 1,
-0.8016503, 0.4546137, -0.8168801, 0, 0, 0, 1, 1,
-0.800039, -2.634296, -2.791679, 0, 0, 0, 1, 1,
-0.7943627, -1.365948, -4.540998, 0, 0, 0, 1, 1,
-0.7895867, 1.026624, -3.038262, 1, 1, 1, 1, 1,
-0.7883554, 1.805048, -0.679381, 1, 1, 1, 1, 1,
-0.7879802, -1.090206, -3.837317, 1, 1, 1, 1, 1,
-0.7875537, 0.7949786, 0.04239286, 1, 1, 1, 1, 1,
-0.7809089, -0.4695335, -1.66113, 1, 1, 1, 1, 1,
-0.7770056, -1.605336, -2.95887, 1, 1, 1, 1, 1,
-0.7711262, -2.306974, -3.792535, 1, 1, 1, 1, 1,
-0.7698682, 0.9168515, 0.8500659, 1, 1, 1, 1, 1,
-0.766673, 1.702797, 0.001545569, 1, 1, 1, 1, 1,
-0.7605098, 1.179076, -0.8422648, 1, 1, 1, 1, 1,
-0.7554224, -0.2152305, -1.241883, 1, 1, 1, 1, 1,
-0.7549363, -1.685925, -2.621495, 1, 1, 1, 1, 1,
-0.7512625, 0.4205816, -2.848009, 1, 1, 1, 1, 1,
-0.750907, -1.161263, -0.986552, 1, 1, 1, 1, 1,
-0.7501882, 1.066309, 1.290184, 1, 1, 1, 1, 1,
-0.7466167, 0.06063105, -0.9094897, 0, 0, 1, 1, 1,
-0.7438044, -0.7184982, -1.55244, 1, 0, 0, 1, 1,
-0.740874, 1.46838, 0.1307666, 1, 0, 0, 1, 1,
-0.7376068, -2.232383, -2.400235, 1, 0, 0, 1, 1,
-0.737266, 0.1249848, -1.046482, 1, 0, 0, 1, 1,
-0.7370796, 1.385576, 0.01900104, 1, 0, 0, 1, 1,
-0.7361633, -0.07329866, 0.1134089, 0, 0, 0, 1, 1,
-0.7342238, -1.757941, -2.29965, 0, 0, 0, 1, 1,
-0.7293078, -1.446216, -3.761703, 0, 0, 0, 1, 1,
-0.7268984, -0.04356359, -1.045426, 0, 0, 0, 1, 1,
-0.7248427, -1.746959, -3.426082, 0, 0, 0, 1, 1,
-0.7244858, 0.4200379, -1.022, 0, 0, 0, 1, 1,
-0.7238013, 0.9716244, -1.626249, 0, 0, 0, 1, 1,
-0.7199371, -1.995626, -2.328279, 1, 1, 1, 1, 1,
-0.7150666, -0.3124209, -1.819961, 1, 1, 1, 1, 1,
-0.7148678, -0.6181469, -3.079646, 1, 1, 1, 1, 1,
-0.7126257, 0.284793, -0.6435738, 1, 1, 1, 1, 1,
-0.7109759, -0.5219356, -1.724153, 1, 1, 1, 1, 1,
-0.7033004, -0.309659, -1.077817, 1, 1, 1, 1, 1,
-0.7000418, -0.3962097, -1.330528, 1, 1, 1, 1, 1,
-0.6989853, 2.19932, 0.2624052, 1, 1, 1, 1, 1,
-0.6984984, 0.2563968, 0.6979171, 1, 1, 1, 1, 1,
-0.6912752, -0.4759912, -3.199539, 1, 1, 1, 1, 1,
-0.6859297, -0.9249008, -2.578489, 1, 1, 1, 1, 1,
-0.6849251, 0.6169854, -0.4769004, 1, 1, 1, 1, 1,
-0.6840526, 1.762402, -0.93859, 1, 1, 1, 1, 1,
-0.6812352, 1.880377, -0.6311159, 1, 1, 1, 1, 1,
-0.680187, -1.893482, -3.23018, 1, 1, 1, 1, 1,
-0.6739857, -1.490328, -3.305054, 0, 0, 1, 1, 1,
-0.6688563, 1.097541, -1.151554, 1, 0, 0, 1, 1,
-0.6558953, 0.7551835, 0.8728501, 1, 0, 0, 1, 1,
-0.6497144, 1.27701, -1.524214, 1, 0, 0, 1, 1,
-0.6429546, -0.4694741, -2.617197, 1, 0, 0, 1, 1,
-0.6381097, 0.3651131, -2.091874, 1, 0, 0, 1, 1,
-0.6348002, 0.6275466, -1.405871, 0, 0, 0, 1, 1,
-0.6324834, -1.058394, -4.26721, 0, 0, 0, 1, 1,
-0.6283382, -0.4554466, -2.222718, 0, 0, 0, 1, 1,
-0.6251322, -0.1265581, -1.065754, 0, 0, 0, 1, 1,
-0.6167194, -0.4366735, -1.425524, 0, 0, 0, 1, 1,
-0.6104768, 0.5264817, 0.4914696, 0, 0, 0, 1, 1,
-0.609077, -1.072646, -0.8206182, 0, 0, 0, 1, 1,
-0.6073287, -0.6074349, -2.3081, 1, 1, 1, 1, 1,
-0.5988896, 1.324046, -1.038711, 1, 1, 1, 1, 1,
-0.5969472, -0.8862819, -2.840565, 1, 1, 1, 1, 1,
-0.5960216, 0.4357631, -0.3939789, 1, 1, 1, 1, 1,
-0.5948269, 0.1551894, -0.7748625, 1, 1, 1, 1, 1,
-0.5917632, -2.537906, -2.732697, 1, 1, 1, 1, 1,
-0.5902333, 0.3556601, -0.207745, 1, 1, 1, 1, 1,
-0.5898693, 0.5057924, -1.6533, 1, 1, 1, 1, 1,
-0.5861341, -1.287301, -1.936771, 1, 1, 1, 1, 1,
-0.5841792, 0.7744042, 0.01794551, 1, 1, 1, 1, 1,
-0.5805961, -1.330805, -2.407981, 1, 1, 1, 1, 1,
-0.5749596, 0.7165772, -1.280577, 1, 1, 1, 1, 1,
-0.5698841, 1.598386, -1.822932, 1, 1, 1, 1, 1,
-0.5694388, -0.2883402, -2.230341, 1, 1, 1, 1, 1,
-0.5683887, -0.01743356, -3.481447, 1, 1, 1, 1, 1,
-0.5645167, -0.315171, -1.990155, 0, 0, 1, 1, 1,
-0.5593467, -1.033113, -3.229344, 1, 0, 0, 1, 1,
-0.5572854, -1.387976, -2.608997, 1, 0, 0, 1, 1,
-0.5549515, 0.8520785, -0.5837823, 1, 0, 0, 1, 1,
-0.5515972, 0.5445498, -1.353843, 1, 0, 0, 1, 1,
-0.5475665, -0.7075504, -4.059359, 1, 0, 0, 1, 1,
-0.5420768, 0.6003533, 0.7290642, 0, 0, 0, 1, 1,
-0.5406326, 1.455183, -1.41404, 0, 0, 0, 1, 1,
-0.5336181, 0.4420018, -1.269526, 0, 0, 0, 1, 1,
-0.5335706, -0.6849627, -1.590313, 0, 0, 0, 1, 1,
-0.5293431, -0.1971682, -2.189516, 0, 0, 0, 1, 1,
-0.5290909, -0.04040479, -0.848451, 0, 0, 0, 1, 1,
-0.5242976, -2.370599, -4.323159, 0, 0, 0, 1, 1,
-0.5238439, -0.4435987, -1.293638, 1, 1, 1, 1, 1,
-0.5237539, -0.7419573, -3.546036, 1, 1, 1, 1, 1,
-0.5160621, -0.1524717, -2.09748, 1, 1, 1, 1, 1,
-0.5137292, 0.3575037, -0.1836695, 1, 1, 1, 1, 1,
-0.5114096, -0.4422331, -2.404757, 1, 1, 1, 1, 1,
-0.5100949, 1.135472, -1.013582, 1, 1, 1, 1, 1,
-0.5082031, 1.545345, 0.3294611, 1, 1, 1, 1, 1,
-0.5068394, -0.404193, -1.761627, 1, 1, 1, 1, 1,
-0.5055827, -1.492621, -3.69834, 1, 1, 1, 1, 1,
-0.5047829, 0.06720459, -2.24737, 1, 1, 1, 1, 1,
-0.5039704, 0.4620115, -1.493409, 1, 1, 1, 1, 1,
-0.5003249, -0.09009737, -0.7673715, 1, 1, 1, 1, 1,
-0.48877, 0.9856544, -1.102282, 1, 1, 1, 1, 1,
-0.4863391, -2.801761, -2.301829, 1, 1, 1, 1, 1,
-0.484523, 0.2575274, 0.6709583, 1, 1, 1, 1, 1,
-0.4843001, 0.6939759, 0.6519496, 0, 0, 1, 1, 1,
-0.4809479, 0.05144985, -0.7070513, 1, 0, 0, 1, 1,
-0.4797252, 0.4312809, 0.08359116, 1, 0, 0, 1, 1,
-0.4764756, 0.1785475, -0.5935203, 1, 0, 0, 1, 1,
-0.4731297, -0.8808466, -2.040835, 1, 0, 0, 1, 1,
-0.4707428, -0.9192656, -2.882461, 1, 0, 0, 1, 1,
-0.466598, -0.8760585, -2.761687, 0, 0, 0, 1, 1,
-0.4619422, 0.8775844, -0.02190155, 0, 0, 0, 1, 1,
-0.4612551, 1.07907, 0.08660315, 0, 0, 0, 1, 1,
-0.4600603, -2.303897, -3.088142, 0, 0, 0, 1, 1,
-0.4594804, 1.122863, -2.644547, 0, 0, 0, 1, 1,
-0.4580134, -0.6035194, -3.961365, 0, 0, 0, 1, 1,
-0.450117, -1.203446, -4.066206, 0, 0, 0, 1, 1,
-0.4462597, 0.645475, -1.160957, 1, 1, 1, 1, 1,
-0.4450167, -1.128456, -3.738766, 1, 1, 1, 1, 1,
-0.4444891, 0.2524667, -1.972984, 1, 1, 1, 1, 1,
-0.4399354, -0.1160823, -1.411898, 1, 1, 1, 1, 1,
-0.4386849, 0.414388, -1.953372, 1, 1, 1, 1, 1,
-0.4327631, 1.242266, 0.3562633, 1, 1, 1, 1, 1,
-0.4274876, -0.7129159, -2.198929, 1, 1, 1, 1, 1,
-0.426956, -0.1874855, -2.190715, 1, 1, 1, 1, 1,
-0.4229234, 1.220156, -1.123438, 1, 1, 1, 1, 1,
-0.4208375, 1.509192, -0.5960774, 1, 1, 1, 1, 1,
-0.4184225, -1.530012, -3.460416, 1, 1, 1, 1, 1,
-0.4182082, 0.07382925, -2.200639, 1, 1, 1, 1, 1,
-0.4181728, -0.5302064, -3.336115, 1, 1, 1, 1, 1,
-0.4155523, 0.17171, -0.5514395, 1, 1, 1, 1, 1,
-0.4054109, -0.5992904, -1.355131, 1, 1, 1, 1, 1,
-0.3940252, 0.1986014, -1.383067, 0, 0, 1, 1, 1,
-0.3927727, 1.204241, -0.2192812, 1, 0, 0, 1, 1,
-0.3918732, 0.2233225, -1.811567, 1, 0, 0, 1, 1,
-0.3900249, -0.8388568, -1.302987, 1, 0, 0, 1, 1,
-0.3794099, 0.495611, -0.9304873, 1, 0, 0, 1, 1,
-0.3780645, 1.496799, 0.2708699, 1, 0, 0, 1, 1,
-0.3770839, -0.8593887, -2.00663, 0, 0, 0, 1, 1,
-0.3738432, 0.3551714, -1.22251, 0, 0, 0, 1, 1,
-0.3734316, -0.8681267, -4.143194, 0, 0, 0, 1, 1,
-0.3715144, -0.3090527, -1.614297, 0, 0, 0, 1, 1,
-0.3635954, 1.301479, 0.6135317, 0, 0, 0, 1, 1,
-0.3590697, -1.418311, -4.512507, 0, 0, 0, 1, 1,
-0.3569557, 0.1643468, -0.5659499, 0, 0, 0, 1, 1,
-0.3567065, 0.5025981, -0.3467125, 1, 1, 1, 1, 1,
-0.3547725, 1.551262, -0.7459521, 1, 1, 1, 1, 1,
-0.3534499, -0.4969404, -4.243728, 1, 1, 1, 1, 1,
-0.349171, 1.356922, -0.3199895, 1, 1, 1, 1, 1,
-0.3478191, -0.5782264, -1.482646, 1, 1, 1, 1, 1,
-0.3476923, 0.02826881, -0.5285524, 1, 1, 1, 1, 1,
-0.3407234, 0.03505795, -1.833764, 1, 1, 1, 1, 1,
-0.3391809, 0.4670213, -2.246258, 1, 1, 1, 1, 1,
-0.3353072, -0.09682515, -3.442931, 1, 1, 1, 1, 1,
-0.3338751, 0.3301409, -0.6648308, 1, 1, 1, 1, 1,
-0.3330373, 1.548258, -0.2535083, 1, 1, 1, 1, 1,
-0.3324959, 0.04461582, -1.351819, 1, 1, 1, 1, 1,
-0.3280496, 0.04573121, -2.622553, 1, 1, 1, 1, 1,
-0.3270923, -0.5195358, -2.577797, 1, 1, 1, 1, 1,
-0.3228405, -2.128416, -3.518097, 1, 1, 1, 1, 1,
-0.3208596, 0.9276213, -0.9710654, 0, 0, 1, 1, 1,
-0.3195797, -0.5838709, -3.30199, 1, 0, 0, 1, 1,
-0.3191246, -0.06719028, -1.86797, 1, 0, 0, 1, 1,
-0.318834, -1.490788, -3.733582, 1, 0, 0, 1, 1,
-0.3158374, 2.778383, -0.2949936, 1, 0, 0, 1, 1,
-0.3135554, 0.05398437, -0.3921104, 1, 0, 0, 1, 1,
-0.3125129, 1.834422, 1.054119, 0, 0, 0, 1, 1,
-0.3111718, 0.6127356, 0.06398657, 0, 0, 0, 1, 1,
-0.3096742, -1.064274, -2.901725, 0, 0, 0, 1, 1,
-0.3082056, -0.3902702, -3.523553, 0, 0, 0, 1, 1,
-0.3080536, -0.1899834, -1.464217, 0, 0, 0, 1, 1,
-0.3023422, 0.2273139, -0.2479536, 0, 0, 0, 1, 1,
-0.2990136, 0.2998231, 0.8531713, 0, 0, 0, 1, 1,
-0.2968105, -1.308028, -5.254885, 1, 1, 1, 1, 1,
-0.2959261, 1.178372, 0.5466283, 1, 1, 1, 1, 1,
-0.2913881, -2.182772, -2.565435, 1, 1, 1, 1, 1,
-0.2911265, 2.705423, 0.2558077, 1, 1, 1, 1, 1,
-0.2906592, -0.9067006, -5.332788, 1, 1, 1, 1, 1,
-0.2901071, 0.1110559, -0.5248859, 1, 1, 1, 1, 1,
-0.2896736, 0.4258392, 0.6238632, 1, 1, 1, 1, 1,
-0.2878473, 0.9200155, 0.01833859, 1, 1, 1, 1, 1,
-0.2866128, -1.785566, -2.730282, 1, 1, 1, 1, 1,
-0.2840106, -0.2149097, -3.640425, 1, 1, 1, 1, 1,
-0.2790904, 0.5977584, -0.135771, 1, 1, 1, 1, 1,
-0.2735657, -1.352674, -2.628657, 1, 1, 1, 1, 1,
-0.2727197, -1.951116, -0.5963646, 1, 1, 1, 1, 1,
-0.2687773, -0.08391321, -0.6845806, 1, 1, 1, 1, 1,
-0.2658856, -0.4230632, -3.58004, 1, 1, 1, 1, 1,
-0.2657437, 0.7688738, 1.136517, 0, 0, 1, 1, 1,
-0.2641813, -0.4406384, -3.709737, 1, 0, 0, 1, 1,
-0.2627625, -2.275863, -3.460234, 1, 0, 0, 1, 1,
-0.2588487, 0.2332477, -1.873231, 1, 0, 0, 1, 1,
-0.2566833, -0.8167425, -2.622628, 1, 0, 0, 1, 1,
-0.2555928, 1.073039, 0.3811244, 1, 0, 0, 1, 1,
-0.2547746, 0.5557262, 1.117941, 0, 0, 0, 1, 1,
-0.2533072, -0.986291, -3.620955, 0, 0, 0, 1, 1,
-0.2525884, 0.4387046, 0.5131171, 0, 0, 0, 1, 1,
-0.2521461, -0.5996447, -2.925949, 0, 0, 0, 1, 1,
-0.2491202, 0.6448107, 0.4764282, 0, 0, 0, 1, 1,
-0.2473301, 0.4377925, -0.344134, 0, 0, 0, 1, 1,
-0.2447417, 1.945697, 1.009115, 0, 0, 0, 1, 1,
-0.2444798, -1.266254, -2.755093, 1, 1, 1, 1, 1,
-0.2372282, -0.7233272, -3.746891, 1, 1, 1, 1, 1,
-0.2268267, -0.2044756, -0.8502229, 1, 1, 1, 1, 1,
-0.2260022, 1.18446, -1.282409, 1, 1, 1, 1, 1,
-0.2183501, 0.9302974, -0.5901228, 1, 1, 1, 1, 1,
-0.2177976, 0.8150473, -0.1678338, 1, 1, 1, 1, 1,
-0.2166909, -0.4827892, -2.323742, 1, 1, 1, 1, 1,
-0.2165828, 0.5917737, -0.8123255, 1, 1, 1, 1, 1,
-0.215565, 1.255, -1.634114, 1, 1, 1, 1, 1,
-0.2123362, -0.9722007, -2.305978, 1, 1, 1, 1, 1,
-0.2121092, 0.5202739, -0.6731932, 1, 1, 1, 1, 1,
-0.2117503, 0.542847, 0.3320667, 1, 1, 1, 1, 1,
-0.2047139, -0.8226221, -1.414341, 1, 1, 1, 1, 1,
-0.2043948, -0.6068602, -2.713786, 1, 1, 1, 1, 1,
-0.1986571, 0.5142779, 1.960153, 1, 1, 1, 1, 1,
-0.1919312, -0.411439, -3.071509, 0, 0, 1, 1, 1,
-0.1917936, 0.1566528, 0.7637061, 1, 0, 0, 1, 1,
-0.1908432, -0.2812443, 0.3012993, 1, 0, 0, 1, 1,
-0.190649, -0.670975, -2.988594, 1, 0, 0, 1, 1,
-0.1899092, 1.240351, 1.651539, 1, 0, 0, 1, 1,
-0.1868578, -0.2694421, -1.264612, 1, 0, 0, 1, 1,
-0.1866682, -0.565312, -3.077876, 0, 0, 0, 1, 1,
-0.1846081, 0.2258966, -1.147206, 0, 0, 0, 1, 1,
-0.182897, 1.592009, -0.009063366, 0, 0, 0, 1, 1,
-0.1804858, 0.1110616, -1.014454, 0, 0, 0, 1, 1,
-0.1779556, -0.4335354, -2.483043, 0, 0, 0, 1, 1,
-0.1731936, -1.038164, -3.841311, 0, 0, 0, 1, 1,
-0.1730676, -0.1136587, -1.925679, 0, 0, 0, 1, 1,
-0.1730424, 1.421276, -0.8914812, 1, 1, 1, 1, 1,
-0.1709575, -1.211794, -4.461696, 1, 1, 1, 1, 1,
-0.1653702, -0.09379501, -1.646415, 1, 1, 1, 1, 1,
-0.1643181, -1.191312, -3.938881, 1, 1, 1, 1, 1,
-0.1642423, -1.157265, -2.11292, 1, 1, 1, 1, 1,
-0.1625666, 1.030676, -0.06800136, 1, 1, 1, 1, 1,
-0.1614952, 0.1773035, -0.7013254, 1, 1, 1, 1, 1,
-0.1573947, 0.7890393, -0.6609917, 1, 1, 1, 1, 1,
-0.152857, 0.4584497, -0.2043546, 1, 1, 1, 1, 1,
-0.1514666, 0.3409111, 0.1792893, 1, 1, 1, 1, 1,
-0.1502655, 1.646417, 1.193606, 1, 1, 1, 1, 1,
-0.1497929, 0.6848838, -0.1388562, 1, 1, 1, 1, 1,
-0.1497816, 0.08242759, -0.285287, 1, 1, 1, 1, 1,
-0.1467406, 1.295693, -0.7927058, 1, 1, 1, 1, 1,
-0.1443375, -0.5579076, -3.238356, 1, 1, 1, 1, 1,
-0.1411427, 0.1899266, -0.9432635, 0, 0, 1, 1, 1,
-0.1406983, 0.344867, -0.221247, 1, 0, 0, 1, 1,
-0.1404586, 0.4188819, 1.079037, 1, 0, 0, 1, 1,
-0.1404183, -0.4339549, -3.308164, 1, 0, 0, 1, 1,
-0.1358986, -0.2491743, -2.512038, 1, 0, 0, 1, 1,
-0.1338481, 1.538762, 0.5961311, 1, 0, 0, 1, 1,
-0.1259104, -2.420477, -2.955079, 0, 0, 0, 1, 1,
-0.1173973, -0.3622186, -2.000688, 0, 0, 0, 1, 1,
-0.1169616, 0.4624478, -0.2392449, 0, 0, 0, 1, 1,
-0.1142632, 2.394064, -0.4077727, 0, 0, 0, 1, 1,
-0.1124949, 0.3561091, -0.05353887, 0, 0, 0, 1, 1,
-0.1106007, 0.2642946, -2.415565, 0, 0, 0, 1, 1,
-0.1066511, 0.9608962, -0.879547, 0, 0, 0, 1, 1,
-0.106331, 0.08515643, -2.649496, 1, 1, 1, 1, 1,
-0.1042108, 0.5986903, -1.316193, 1, 1, 1, 1, 1,
-0.103166, -0.3166508, -1.404839, 1, 1, 1, 1, 1,
-0.1027816, -0.01244689, -0.9992812, 1, 1, 1, 1, 1,
-0.1003016, 0.07049166, -0.4566976, 1, 1, 1, 1, 1,
-0.09804998, 0.05063547, -0.5298198, 1, 1, 1, 1, 1,
-0.09733855, -0.8967171, -3.461305, 1, 1, 1, 1, 1,
-0.09680407, -0.2374348, -1.560998, 1, 1, 1, 1, 1,
-0.09643687, -0.2493169, -3.272703, 1, 1, 1, 1, 1,
-0.09264126, -0.6934455, -3.448454, 1, 1, 1, 1, 1,
-0.09078922, -1.757861, -4.522408, 1, 1, 1, 1, 1,
-0.08970919, 0.870851, -0.1645806, 1, 1, 1, 1, 1,
-0.08605109, -0.1483098, -2.679656, 1, 1, 1, 1, 1,
-0.07980781, -1.418449, -2.409396, 1, 1, 1, 1, 1,
-0.07364035, -1.458231, -3.850914, 1, 1, 1, 1, 1,
-0.06814382, 0.1810939, 0.1943909, 0, 0, 1, 1, 1,
-0.06744251, 1.197973, -0.596402, 1, 0, 0, 1, 1,
-0.06436332, -1.167997, -2.422502, 1, 0, 0, 1, 1,
-0.06354708, 0.2747523, -0.2188554, 1, 0, 0, 1, 1,
-0.06080455, -0.7570007, -3.503058, 1, 0, 0, 1, 1,
-0.05893646, -0.4177438, -3.507996, 1, 0, 0, 1, 1,
-0.05794869, 0.4608467, 0.03584052, 0, 0, 0, 1, 1,
-0.05100651, -1.015195, -3.105368, 0, 0, 0, 1, 1,
-0.04615226, 0.2405995, 0.05147007, 0, 0, 0, 1, 1,
-0.02949041, -0.1336857, -0.4957639, 0, 0, 0, 1, 1,
-0.02697395, -0.6641704, -5.164851, 0, 0, 0, 1, 1,
-0.02567259, 0.11405, -0.1272821, 0, 0, 0, 1, 1,
-0.02565909, 0.4654666, -0.7297004, 0, 0, 0, 1, 1,
-0.02227558, -1.053675, -1.869538, 1, 1, 1, 1, 1,
-0.01886379, -1.654493, -3.112822, 1, 1, 1, 1, 1,
-0.01768143, -0.4395585, -3.640941, 1, 1, 1, 1, 1,
-0.01334719, -0.4921108, -3.126972, 1, 1, 1, 1, 1,
-0.004495762, -0.6494893, -3.031321, 1, 1, 1, 1, 1,
-0.004163615, -0.3051648, -4.882934, 1, 1, 1, 1, 1,
-0.00189459, 0.8913999, -0.3705546, 1, 1, 1, 1, 1,
0.004743898, 0.02939478, -0.1872517, 1, 1, 1, 1, 1,
0.00518368, 0.2529962, -0.8449702, 1, 1, 1, 1, 1,
0.006451185, 1.153597, -0.2475611, 1, 1, 1, 1, 1,
0.006804074, 1.933329, -0.3360535, 1, 1, 1, 1, 1,
0.01272314, -0.1102058, 3.712617, 1, 1, 1, 1, 1,
0.0181662, 1.241724, 1.533212, 1, 1, 1, 1, 1,
0.02036657, 0.9525495, 0.0397588, 1, 1, 1, 1, 1,
0.0223352, -0.4459829, 1.096577, 1, 1, 1, 1, 1,
0.02272321, -0.3424274, 2.949822, 0, 0, 1, 1, 1,
0.029076, -0.2842269, 3.371722, 1, 0, 0, 1, 1,
0.02939045, 1.15073, 0.418786, 1, 0, 0, 1, 1,
0.03223556, -2.643505, 5.037739, 1, 0, 0, 1, 1,
0.03319654, -0.1856198, 4.137646, 1, 0, 0, 1, 1,
0.0370064, -0.2413692, 2.336171, 1, 0, 0, 1, 1,
0.03759779, -0.01516388, 1.832889, 0, 0, 0, 1, 1,
0.04040241, 0.46618, 0.6107203, 0, 0, 0, 1, 1,
0.04370478, 1.557953, 0.1962639, 0, 0, 0, 1, 1,
0.04553172, 0.2552367, -1.808237, 0, 0, 0, 1, 1,
0.04652574, -1.221262, 1.992845, 0, 0, 0, 1, 1,
0.04816766, 0.7821756, 1.556943, 0, 0, 0, 1, 1,
0.04896763, -0.9493104, 1.999605, 0, 0, 0, 1, 1,
0.05105249, -0.4051443, 2.05108, 1, 1, 1, 1, 1,
0.05206377, 1.465701, -0.2306987, 1, 1, 1, 1, 1,
0.05375127, 1.44103, 0.5913619, 1, 1, 1, 1, 1,
0.05432389, 1.137091, -0.2307469, 1, 1, 1, 1, 1,
0.05478319, -0.08244131, 2.160326, 1, 1, 1, 1, 1,
0.0619519, -1.598268, 6.213318, 1, 1, 1, 1, 1,
0.06380222, 0.2087416, 0.3907419, 1, 1, 1, 1, 1,
0.06747533, -1.473166, 2.340438, 1, 1, 1, 1, 1,
0.06775328, 0.1800745, 0.3305369, 1, 1, 1, 1, 1,
0.06940094, -0.5527558, 5.919207, 1, 1, 1, 1, 1,
0.07002141, -1.897047, 2.971957, 1, 1, 1, 1, 1,
0.07147771, -0.6802302, 2.228905, 1, 1, 1, 1, 1,
0.07465594, -1.245438, 5.132356, 1, 1, 1, 1, 1,
0.07571863, 0.02864462, 4.348553, 1, 1, 1, 1, 1,
0.07703125, 1.224175, 0.4471849, 1, 1, 1, 1, 1,
0.07719491, -1.004884, 4.446465, 0, 0, 1, 1, 1,
0.07801544, -1.635335, 5.387311, 1, 0, 0, 1, 1,
0.082103, 0.1800672, 0.5862178, 1, 0, 0, 1, 1,
0.08849068, 1.667473, 0.8057782, 1, 0, 0, 1, 1,
0.08914526, -0.3109557, 3.330361, 1, 0, 0, 1, 1,
0.09020106, -1.324062, 3.558647, 1, 0, 0, 1, 1,
0.09466811, -0.436801, 3.218059, 0, 0, 0, 1, 1,
0.09584846, 0.8490712, 1.36334, 0, 0, 0, 1, 1,
0.09594249, -0.6495873, 1.911266, 0, 0, 0, 1, 1,
0.09843966, 0.5809957, 0.2599261, 0, 0, 0, 1, 1,
0.1018862, 0.2010714, 1.932557, 0, 0, 0, 1, 1,
0.1024554, -0.7345113, 3.647872, 0, 0, 0, 1, 1,
0.1025258, -0.8210335, 4.405293, 0, 0, 0, 1, 1,
0.1026874, -0.1905682, 1.220996, 1, 1, 1, 1, 1,
0.106371, 0.1636175, 0.4596957, 1, 1, 1, 1, 1,
0.107519, 0.0380876, 0.5098321, 1, 1, 1, 1, 1,
0.1099224, 1.581721, -0.5357677, 1, 1, 1, 1, 1,
0.1138483, 0.5513113, -1.617778, 1, 1, 1, 1, 1,
0.117704, -0.8875626, 3.553012, 1, 1, 1, 1, 1,
0.1205838, -0.7994883, 4.338696, 1, 1, 1, 1, 1,
0.1214062, 0.1393162, -0.4647192, 1, 1, 1, 1, 1,
0.1230071, 0.9184425, 0.09762666, 1, 1, 1, 1, 1,
0.1292667, 0.03488512, 1.850657, 1, 1, 1, 1, 1,
0.138486, 0.1139209, -0.9195345, 1, 1, 1, 1, 1,
0.1386886, 0.7888026, -0.8512976, 1, 1, 1, 1, 1,
0.1407624, 1.020348, 0.4308293, 1, 1, 1, 1, 1,
0.1421837, -0.5862682, 4.377315, 1, 1, 1, 1, 1,
0.1421986, -1.557989, 2.742069, 1, 1, 1, 1, 1,
0.1435874, 0.5644751, 1.107321, 0, 0, 1, 1, 1,
0.1447085, 1.740916, 1.154746, 1, 0, 0, 1, 1,
0.1448932, -0.2054686, 1.581309, 1, 0, 0, 1, 1,
0.1479979, -0.8859014, 3.8161, 1, 0, 0, 1, 1,
0.1514149, 0.2796974, 0.2496168, 1, 0, 0, 1, 1,
0.1531133, 0.1734495, -0.321689, 1, 0, 0, 1, 1,
0.1571012, 0.9031498, -0.523159, 0, 0, 0, 1, 1,
0.1571994, -0.4453882, 1.660935, 0, 0, 0, 1, 1,
0.1576288, -0.009461698, 1.076433, 0, 0, 0, 1, 1,
0.1602476, 0.4753451, 1.352535, 0, 0, 0, 1, 1,
0.16264, 0.8159391, -1.421241, 0, 0, 0, 1, 1,
0.1699049, 1.315416, 0.9484925, 0, 0, 0, 1, 1,
0.1713793, 0.4768488, -0.1845805, 0, 0, 0, 1, 1,
0.1716727, -0.1774018, 0.4426354, 1, 1, 1, 1, 1,
0.1726004, -1.444837, 4.611805, 1, 1, 1, 1, 1,
0.1740944, -1.169611, 2.854261, 1, 1, 1, 1, 1,
0.1767483, -0.6042076, 2.255786, 1, 1, 1, 1, 1,
0.1805607, 0.6578878, 1.06096, 1, 1, 1, 1, 1,
0.1820739, -0.4946251, 1.628181, 1, 1, 1, 1, 1,
0.1821465, -0.3107665, 3.319156, 1, 1, 1, 1, 1,
0.1947879, 0.5763906, 1.245082, 1, 1, 1, 1, 1,
0.196929, -0.2111014, 2.03662, 1, 1, 1, 1, 1,
0.1977644, -2.304536, 2.853346, 1, 1, 1, 1, 1,
0.1998161, -0.5389602, 2.175191, 1, 1, 1, 1, 1,
0.208287, -0.2178886, 1.820627, 1, 1, 1, 1, 1,
0.21018, -0.4123199, 0.3075321, 1, 1, 1, 1, 1,
0.2153415, 0.710275, 1.774371, 1, 1, 1, 1, 1,
0.2189009, 0.6801931, -1.037086, 1, 1, 1, 1, 1,
0.2215737, 0.5136954, 0.5598579, 0, 0, 1, 1, 1,
0.2226101, -1.825392, 4.242922, 1, 0, 0, 1, 1,
0.2243252, -0.6330976, 3.19598, 1, 0, 0, 1, 1,
0.2266712, 0.599544, 3.060026, 1, 0, 0, 1, 1,
0.227303, -0.6671047, 4.620289, 1, 0, 0, 1, 1,
0.2275353, -1.012006, 4.394886, 1, 0, 0, 1, 1,
0.2278394, -0.6978906, 3.891969, 0, 0, 0, 1, 1,
0.2282263, 1.714899, 2.472745, 0, 0, 0, 1, 1,
0.2294169, 1.63619, 2.105579, 0, 0, 0, 1, 1,
0.230098, -0.2376281, 0.453802, 0, 0, 0, 1, 1,
0.2319799, 0.2568791, 1.41168, 0, 0, 0, 1, 1,
0.2346515, 0.5308993, -0.7626182, 0, 0, 0, 1, 1,
0.2373168, 1.081912, -1.143314, 0, 0, 0, 1, 1,
0.2400797, -1.279235, 2.865439, 1, 1, 1, 1, 1,
0.2440759, -1.032845, 2.615568, 1, 1, 1, 1, 1,
0.2460404, 0.9228721, 0.9055371, 1, 1, 1, 1, 1,
0.2463212, 0.1413475, 2.035974, 1, 1, 1, 1, 1,
0.2504264, 0.6266177, -0.07288595, 1, 1, 1, 1, 1,
0.2543373, -0.658893, 2.947122, 1, 1, 1, 1, 1,
0.2566209, 1.522766, -0.2191752, 1, 1, 1, 1, 1,
0.2590854, 0.319365, 1.64593, 1, 1, 1, 1, 1,
0.2616046, 0.01794332, 1.450633, 1, 1, 1, 1, 1,
0.2650685, -1.174772, 3.955001, 1, 1, 1, 1, 1,
0.2662054, 1.480841, -0.5107187, 1, 1, 1, 1, 1,
0.2720678, -0.166869, 1.981137, 1, 1, 1, 1, 1,
0.2756712, -2.255086, 3.236997, 1, 1, 1, 1, 1,
0.2771814, 1.100217, 0.6559373, 1, 1, 1, 1, 1,
0.2782664, -2.381629, 2.642916, 1, 1, 1, 1, 1,
0.2798761, -0.3254007, 1.710982, 0, 0, 1, 1, 1,
0.2814209, -0.2001734, 3.613398, 1, 0, 0, 1, 1,
0.2838062, 0.213269, -0.3042466, 1, 0, 0, 1, 1,
0.2842601, 0.9406449, -1.363329, 1, 0, 0, 1, 1,
0.2887593, 1.655046, 0.6234173, 1, 0, 0, 1, 1,
0.2915721, 0.2841731, 0.6547354, 1, 0, 0, 1, 1,
0.2977169, 1.690499, -0.2665797, 0, 0, 0, 1, 1,
0.299704, -0.6887703, 3.369258, 0, 0, 0, 1, 1,
0.3023102, 1.854334, 1.974219, 0, 0, 0, 1, 1,
0.3023179, 1.441009, -0.4032185, 0, 0, 0, 1, 1,
0.3154938, 2.036176, -1.365483, 0, 0, 0, 1, 1,
0.3286243, 0.5458416, 1.592266, 0, 0, 0, 1, 1,
0.3304082, 0.6877513, 1.811999, 0, 0, 0, 1, 1,
0.3333704, 0.5338469, 1.413396, 1, 1, 1, 1, 1,
0.3333916, -0.4830735, 1.807995, 1, 1, 1, 1, 1,
0.3344991, -0.3928309, 1.56942, 1, 1, 1, 1, 1,
0.3353334, -0.4671744, 1.514452, 1, 1, 1, 1, 1,
0.3366099, 0.9588431, -0.1071521, 1, 1, 1, 1, 1,
0.3417649, 1.15938, -0.9105041, 1, 1, 1, 1, 1,
0.3489867, 1.545432, -0.2785521, 1, 1, 1, 1, 1,
0.3508083, 0.8640981, -0.2448148, 1, 1, 1, 1, 1,
0.3518786, -0.5686311, 1.121197, 1, 1, 1, 1, 1,
0.3525048, 0.2330088, 0.2942826, 1, 1, 1, 1, 1,
0.353432, 0.6310961, -0.03779537, 1, 1, 1, 1, 1,
0.3599647, 1.83299, 1.180314, 1, 1, 1, 1, 1,
0.361192, -0.3866859, 2.333231, 1, 1, 1, 1, 1,
0.366902, -2.449945, 3.265596, 1, 1, 1, 1, 1,
0.3676911, 0.1467225, 0.6395877, 1, 1, 1, 1, 1,
0.3685126, 0.5053678, 1.631086, 0, 0, 1, 1, 1,
0.3720666, 0.00537662, 2.010619, 1, 0, 0, 1, 1,
0.3730907, -0.649209, 2.759785, 1, 0, 0, 1, 1,
0.3745759, 1.921821, 0.439552, 1, 0, 0, 1, 1,
0.3757364, -0.7081624, 3.289177, 1, 0, 0, 1, 1,
0.3780738, 0.848895, 0.0734152, 1, 0, 0, 1, 1,
0.3786604, 0.8191782, 0.9596411, 0, 0, 0, 1, 1,
0.382975, 0.07212409, 2.102547, 0, 0, 0, 1, 1,
0.3833841, 0.5981313, -0.452331, 0, 0, 0, 1, 1,
0.3845779, -1.825968, 2.437913, 0, 0, 0, 1, 1,
0.3858919, -1.255534, 1.683639, 0, 0, 0, 1, 1,
0.3862946, -0.6927091, 2.311792, 0, 0, 0, 1, 1,
0.38705, 2.469141, 0.8581064, 0, 0, 0, 1, 1,
0.3873796, 1.687723, 0.05223357, 1, 1, 1, 1, 1,
0.3890624, -1.028665, 2.163574, 1, 1, 1, 1, 1,
0.3923727, -0.3374001, 3.561054, 1, 1, 1, 1, 1,
0.3931504, 0.5427611, 0.7518712, 1, 1, 1, 1, 1,
0.3947251, 0.6856854, 0.2967026, 1, 1, 1, 1, 1,
0.3954379, 0.2015493, 1.044386, 1, 1, 1, 1, 1,
0.3955728, -1.765954, 3.899286, 1, 1, 1, 1, 1,
0.3986728, 1.028159, 1.141173, 1, 1, 1, 1, 1,
0.401673, -0.6188608, 3.736805, 1, 1, 1, 1, 1,
0.4018634, 1.36369, 0.6317151, 1, 1, 1, 1, 1,
0.4026426, -0.8029534, 1.901735, 1, 1, 1, 1, 1,
0.4043165, 0.7976336, 1.821591, 1, 1, 1, 1, 1,
0.4060342, 1.338554, 1.769504, 1, 1, 1, 1, 1,
0.406775, 1.362438, -0.81826, 1, 1, 1, 1, 1,
0.4072266, 1.613153, -0.9046987, 1, 1, 1, 1, 1,
0.4100978, 0.7878128, 0.3806695, 0, 0, 1, 1, 1,
0.4102733, 0.3848976, 2.665305, 1, 0, 0, 1, 1,
0.4103302, -1.953324, 1.345569, 1, 0, 0, 1, 1,
0.4114282, -0.4768533, 1.831631, 1, 0, 0, 1, 1,
0.4131947, -0.1284854, 2.346377, 1, 0, 0, 1, 1,
0.4147019, 0.6675327, 0.6910958, 1, 0, 0, 1, 1,
0.4178859, 1.963919, -1.740326, 0, 0, 0, 1, 1,
0.4229379, 0.709474, 2.08516, 0, 0, 0, 1, 1,
0.4243245, 1.38168, 0.4741095, 0, 0, 0, 1, 1,
0.4263947, -0.7602005, 2.8074, 0, 0, 0, 1, 1,
0.4268439, 0.551634, 0.06563381, 0, 0, 0, 1, 1,
0.4273883, -0.4019403, 1.950838, 0, 0, 0, 1, 1,
0.4304328, 0.7263808, 0.81177, 0, 0, 0, 1, 1,
0.4316524, -0.8390939, 2.393198, 1, 1, 1, 1, 1,
0.4421175, 0.6550739, 2.6964, 1, 1, 1, 1, 1,
0.4437222, -1.491295, 2.745798, 1, 1, 1, 1, 1,
0.4450773, -0.1057096, 1.674265, 1, 1, 1, 1, 1,
0.4454412, 1.829167, 1.438652, 1, 1, 1, 1, 1,
0.4528899, 2.191171, -1.153869, 1, 1, 1, 1, 1,
0.4574195, -1.92373, 3.065315, 1, 1, 1, 1, 1,
0.457831, -0.5553801, 1.583837, 1, 1, 1, 1, 1,
0.4653309, -0.8211947, 2.246275, 1, 1, 1, 1, 1,
0.4659462, 0.09719153, 0.3680313, 1, 1, 1, 1, 1,
0.4682288, 2.422997, 1.222661, 1, 1, 1, 1, 1,
0.4687195, 1.643612, 0.6106748, 1, 1, 1, 1, 1,
0.4691749, -0.2728633, 3.135588, 1, 1, 1, 1, 1,
0.4721484, -0.1871701, 0.3546627, 1, 1, 1, 1, 1,
0.4727557, -1.288454, 3.464303, 1, 1, 1, 1, 1,
0.4735983, 0.08830942, -0.358839, 0, 0, 1, 1, 1,
0.4738683, 0.1296572, 2.740203, 1, 0, 0, 1, 1,
0.4744874, -0.07273363, 2.305928, 1, 0, 0, 1, 1,
0.4748029, 1.118234, -0.1365362, 1, 0, 0, 1, 1,
0.475362, -0.3796614, 2.011834, 1, 0, 0, 1, 1,
0.4778661, -0.9633258, 2.696651, 1, 0, 0, 1, 1,
0.4814887, 0.1676356, 0.4720594, 0, 0, 0, 1, 1,
0.4857777, -0.7685128, 3.382104, 0, 0, 0, 1, 1,
0.4928587, 0.4881245, 0.4745814, 0, 0, 0, 1, 1,
0.496477, -0.7811945, 0.3514934, 0, 0, 0, 1, 1,
0.4970179, -0.8173492, 2.743443, 0, 0, 0, 1, 1,
0.5006452, 0.7927691, 1.575894, 0, 0, 0, 1, 1,
0.503152, -0.1236723, 3.214878, 0, 0, 0, 1, 1,
0.5047576, -0.903607, 3.81292, 1, 1, 1, 1, 1,
0.5081153, -1.792913, 2.37928, 1, 1, 1, 1, 1,
0.50812, -0.6654053, 2.332254, 1, 1, 1, 1, 1,
0.5090052, -0.4588768, 2.875851, 1, 1, 1, 1, 1,
0.5209401, -2.490532, 3.378225, 1, 1, 1, 1, 1,
0.521419, -0.4647073, 1.594875, 1, 1, 1, 1, 1,
0.5234718, 0.2309892, 0.3514836, 1, 1, 1, 1, 1,
0.5265319, 0.1324193, 0.5307181, 1, 1, 1, 1, 1,
0.5278478, 1.642724, 0.8251331, 1, 1, 1, 1, 1,
0.5289788, -1.550886, 3.982413, 1, 1, 1, 1, 1,
0.5291918, -0.4534647, 2.613655, 1, 1, 1, 1, 1,
0.5335502, -0.4021871, 2.350864, 1, 1, 1, 1, 1,
0.5442596, -1.632299, 4.139375, 1, 1, 1, 1, 1,
0.5472456, 0.5082945, 2.568258, 1, 1, 1, 1, 1,
0.5550801, -0.9534593, 4.861184, 1, 1, 1, 1, 1,
0.5558427, 0.04533472, 1.225597, 0, 0, 1, 1, 1,
0.5560767, 0.7240664, -2.509255, 1, 0, 0, 1, 1,
0.5593738, 1.12018, 0.1121672, 1, 0, 0, 1, 1,
0.5660821, -1.671581, 3.984815, 1, 0, 0, 1, 1,
0.5717388, -0.2485709, 2.461751, 1, 0, 0, 1, 1,
0.5723665, -3.772443, 2.713678, 1, 0, 0, 1, 1,
0.5768564, -1.59972, 5.216221, 0, 0, 0, 1, 1,
0.5785568, -0.8658115, 1.9748, 0, 0, 0, 1, 1,
0.583465, -1.43897, 2.824775, 0, 0, 0, 1, 1,
0.5879864, 0.5018588, 2.162849, 0, 0, 0, 1, 1,
0.5905491, -1.499054, 0.5068383, 0, 0, 0, 1, 1,
0.6034577, 0.4370433, 2.692288, 0, 0, 0, 1, 1,
0.6039149, 0.7723485, -1.528194, 0, 0, 0, 1, 1,
0.6083709, -0.5037062, 2.853466, 1, 1, 1, 1, 1,
0.6115859, -0.6128989, 3.142087, 1, 1, 1, 1, 1,
0.6161873, 0.6197665, 1.021385, 1, 1, 1, 1, 1,
0.6211408, 0.9712123, 0.5341994, 1, 1, 1, 1, 1,
0.6261421, 1.772619, 0.6648846, 1, 1, 1, 1, 1,
0.6278651, -1.408827, 3.943792, 1, 1, 1, 1, 1,
0.6325641, -1.424682, 3.21331, 1, 1, 1, 1, 1,
0.6367072, 1.144751, 0.6233455, 1, 1, 1, 1, 1,
0.6378189, -0.6629285, 3.334132, 1, 1, 1, 1, 1,
0.6431396, -2.075291, 2.076755, 1, 1, 1, 1, 1,
0.6479289, 1.760846, 1.728733, 1, 1, 1, 1, 1,
0.6614975, 0.5602678, 2.076705, 1, 1, 1, 1, 1,
0.6639946, 1.297189, 1.260431, 1, 1, 1, 1, 1,
0.6646173, 0.6442015, 0.6196212, 1, 1, 1, 1, 1,
0.6802431, -1.225542, 3.037279, 1, 1, 1, 1, 1,
0.6854958, 1.028974, 0.1111072, 0, 0, 1, 1, 1,
0.6860645, -0.3215957, 1.241751, 1, 0, 0, 1, 1,
0.6957535, 1.006742, 0.2261849, 1, 0, 0, 1, 1,
0.6981138, 0.1183224, 2.410877, 1, 0, 0, 1, 1,
0.6982282, 3.04685, 1.612122, 1, 0, 0, 1, 1,
0.6983634, -0.304743, 1.452668, 1, 0, 0, 1, 1,
0.698777, -1.448598, 0.742265, 0, 0, 0, 1, 1,
0.702019, -0.1563133, 2.174997, 0, 0, 0, 1, 1,
0.7088823, 0.9933512, 0.6148779, 0, 0, 0, 1, 1,
0.7129278, 0.7918106, 1.065211, 0, 0, 0, 1, 1,
0.7153249, -1.04446, 3.629394, 0, 0, 0, 1, 1,
0.7154356, 0.003146799, 1.598562, 0, 0, 0, 1, 1,
0.7197361, 0.9362748, -0.01635697, 0, 0, 0, 1, 1,
0.7221229, 0.7325885, 2.347708, 1, 1, 1, 1, 1,
0.724649, -0.2181132, 1.893425, 1, 1, 1, 1, 1,
0.7246652, -0.4247767, 2.043678, 1, 1, 1, 1, 1,
0.730221, -0.1361793, 0.8353729, 1, 1, 1, 1, 1,
0.7305931, -2.199023, 2.294132, 1, 1, 1, 1, 1,
0.7306082, 0.7703235, -0.8509662, 1, 1, 1, 1, 1,
0.7341584, 1.044092, 1.783577, 1, 1, 1, 1, 1,
0.734184, 1.014699, 1.956559, 1, 1, 1, 1, 1,
0.738014, 0.07721416, 1.743762, 1, 1, 1, 1, 1,
0.7388014, 0.9027646, -1.746661, 1, 1, 1, 1, 1,
0.7391012, -0.3292408, 2.244214, 1, 1, 1, 1, 1,
0.7433927, 0.6537822, -0.1683896, 1, 1, 1, 1, 1,
0.7434325, -0.1529196, 3.561607, 1, 1, 1, 1, 1,
0.7458283, -0.2882525, 2.502382, 1, 1, 1, 1, 1,
0.7543815, 0.03814289, 2.162692, 1, 1, 1, 1, 1,
0.7598711, -0.6824357, 1.200471, 0, 0, 1, 1, 1,
0.7617365, 0.4596685, -1.122956, 1, 0, 0, 1, 1,
0.7632764, -0.2605495, -0.4027345, 1, 0, 0, 1, 1,
0.7647569, -0.283804, 3.985818, 1, 0, 0, 1, 1,
0.7664227, 1.114788, -0.1107383, 1, 0, 0, 1, 1,
0.7685298, 0.1417633, 3.6896, 1, 0, 0, 1, 1,
0.7692021, -1.003777, 3.250545, 0, 0, 0, 1, 1,
0.7698688, -1.430078, 3.015917, 0, 0, 0, 1, 1,
0.7739698, -1.10756, 5.218141, 0, 0, 0, 1, 1,
0.7768456, 0.1427307, 0.3043734, 0, 0, 0, 1, 1,
0.7791982, 0.1361616, 2.075243, 0, 0, 0, 1, 1,
0.7829589, -0.3401082, 1.129079, 0, 0, 0, 1, 1,
0.7832248, -0.5918806, 3.204189, 0, 0, 0, 1, 1,
0.7849439, 1.166764, 0.482141, 1, 1, 1, 1, 1,
0.7918653, 0.8463916, 0.652705, 1, 1, 1, 1, 1,
0.7954936, 0.07397904, 0.8392844, 1, 1, 1, 1, 1,
0.8002478, 1.377021, 0.1253104, 1, 1, 1, 1, 1,
0.8309638, -0.03067647, 2.273313, 1, 1, 1, 1, 1,
0.8357558, -0.05896274, 0.6182343, 1, 1, 1, 1, 1,
0.836073, 2.482043, 1.577626, 1, 1, 1, 1, 1,
0.8388219, 1.007758, -0.2601833, 1, 1, 1, 1, 1,
0.8399326, 0.6447263, 1.773341, 1, 1, 1, 1, 1,
0.8400616, -0.1612501, 0.8353012, 1, 1, 1, 1, 1,
0.8422877, -0.8362821, 1.274708, 1, 1, 1, 1, 1,
0.8427057, -1.333026, 3.289058, 1, 1, 1, 1, 1,
0.8437147, 2.536626, -0.1649685, 1, 1, 1, 1, 1,
0.848547, 0.7033075, 1.220624, 1, 1, 1, 1, 1,
0.8492643, -1.536303, 1.63846, 1, 1, 1, 1, 1,
0.8642709, -1.043427, 2.68915, 0, 0, 1, 1, 1,
0.8665337, 0.6340075, -0.2759589, 1, 0, 0, 1, 1,
0.8761756, 1.178302, 0.7494195, 1, 0, 0, 1, 1,
0.8785395, 0.2983656, 0.3040012, 1, 0, 0, 1, 1,
0.8814992, 1.622192, 1.176636, 1, 0, 0, 1, 1,
0.8847128, 0.2161164, 1.713304, 1, 0, 0, 1, 1,
0.8851155, -0.8417776, 3.566966, 0, 0, 0, 1, 1,
0.893959, -0.1061112, 5.235203, 0, 0, 0, 1, 1,
0.8948225, -1.032084, 2.351005, 0, 0, 0, 1, 1,
0.9043453, -1.191175, 3.929007, 0, 0, 0, 1, 1,
0.9119028, -0.2818325, 2.209681, 0, 0, 0, 1, 1,
0.9123663, 1.643701, 0.3642263, 0, 0, 0, 1, 1,
0.9124598, -1.833257, 2.656378, 0, 0, 0, 1, 1,
0.9191459, 0.2631559, 1.791148, 1, 1, 1, 1, 1,
0.926344, 0.07261717, 2.173363, 1, 1, 1, 1, 1,
0.9291495, 0.4321485, 0.1120138, 1, 1, 1, 1, 1,
0.9303541, -0.7176831, 3.128368, 1, 1, 1, 1, 1,
0.9305714, -2.061781, 1.129224, 1, 1, 1, 1, 1,
0.9332623, -0.4599867, 1.768046, 1, 1, 1, 1, 1,
0.9375444, 0.3845688, 1.586299, 1, 1, 1, 1, 1,
0.9380507, 1.467221, -1.00806, 1, 1, 1, 1, 1,
0.9518594, -1.801482, 1.072156, 1, 1, 1, 1, 1,
0.9534667, 0.002611604, 2.956754, 1, 1, 1, 1, 1,
0.9537917, 3.017823, -0.4929506, 1, 1, 1, 1, 1,
0.9540387, 0.2502791, 0.1358562, 1, 1, 1, 1, 1,
0.955649, 0.7551258, 1.684643, 1, 1, 1, 1, 1,
0.9586025, -0.8486967, 3.292517, 1, 1, 1, 1, 1,
0.959376, -0.08604684, 1.678359, 1, 1, 1, 1, 1,
0.9632944, -0.1074456, 1.240965, 0, 0, 1, 1, 1,
0.9641834, 0.3839796, 0.9257626, 1, 0, 0, 1, 1,
0.9701837, -0.3550586, 3.071434, 1, 0, 0, 1, 1,
0.973997, 0.5579832, -0.582438, 1, 0, 0, 1, 1,
0.9767188, 0.8673946, -0.2840958, 1, 0, 0, 1, 1,
0.9785698, -0.09249612, 1.07984, 1, 0, 0, 1, 1,
0.9829867, 0.2373653, 1.503349, 0, 0, 0, 1, 1,
1.004172, -0.5459642, 2.311023, 0, 0, 0, 1, 1,
1.00863, 0.05891518, 0.745903, 0, 0, 0, 1, 1,
1.009775, 0.7378159, -0.6772119, 0, 0, 0, 1, 1,
1.012808, 0.7859969, 1.761994, 0, 0, 0, 1, 1,
1.015038, -0.9830593, 2.292993, 0, 0, 0, 1, 1,
1.015581, -1.093119, 2.293931, 0, 0, 0, 1, 1,
1.026763, -0.5832797, 1.758283, 1, 1, 1, 1, 1,
1.035549, -0.303405, 1.505509, 1, 1, 1, 1, 1,
1.036679, 0.1156287, 3.079607, 1, 1, 1, 1, 1,
1.036795, -2.46751, 0.723176, 1, 1, 1, 1, 1,
1.046042, 0.212663, 2.69754, 1, 1, 1, 1, 1,
1.057397, -0.02753037, 2.25299, 1, 1, 1, 1, 1,
1.065526, 1.688958, 0.8980947, 1, 1, 1, 1, 1,
1.067169, 1.455226, 2.919396, 1, 1, 1, 1, 1,
1.068159, 1.222144, -0.08809011, 1, 1, 1, 1, 1,
1.075402, -0.5826043, 1.079282, 1, 1, 1, 1, 1,
1.075886, 0.281941, 2.313406, 1, 1, 1, 1, 1,
1.076981, 0.1474315, 0.4119453, 1, 1, 1, 1, 1,
1.084718, 1.298198, 0.854027, 1, 1, 1, 1, 1,
1.092656, 0.8497307, 0.3951587, 1, 1, 1, 1, 1,
1.103149, -0.5564488, 1.385898, 1, 1, 1, 1, 1,
1.112561, -1.228001, 2.37114, 0, 0, 1, 1, 1,
1.1175, -1.275296, 2.395949, 1, 0, 0, 1, 1,
1.126994, -0.2234406, 2.545752, 1, 0, 0, 1, 1,
1.1301, -1.897374, 3.212676, 1, 0, 0, 1, 1,
1.144861, -0.1474736, 1.096566, 1, 0, 0, 1, 1,
1.160416, 1.030331, 1.131719, 1, 0, 0, 1, 1,
1.164474, 0.8240039, 1.583335, 0, 0, 0, 1, 1,
1.166, 0.6172271, -1.81626, 0, 0, 0, 1, 1,
1.167237, -2.511426, 3.157237, 0, 0, 0, 1, 1,
1.170292, -0.468684, 1.932383, 0, 0, 0, 1, 1,
1.172497, -0.4487677, 1.216283, 0, 0, 0, 1, 1,
1.173966, -0.05345948, 3.256526, 0, 0, 0, 1, 1,
1.175173, -0.7733959, 2.96182, 0, 0, 0, 1, 1,
1.175935, -0.1050943, -0.4270775, 1, 1, 1, 1, 1,
1.177555, -0.2447486, 1.056748, 1, 1, 1, 1, 1,
1.179832, -0.7365835, 1.188116, 1, 1, 1, 1, 1,
1.183559, -0.4619592, 2.322104, 1, 1, 1, 1, 1,
1.190402, 1.154034, 1.283334, 1, 1, 1, 1, 1,
1.190886, -0.9867712, 2.385338, 1, 1, 1, 1, 1,
1.194384, -1.701861, 2.112376, 1, 1, 1, 1, 1,
1.196078, 0.6359148, 1.686613, 1, 1, 1, 1, 1,
1.204657, -0.2605936, 0.5805582, 1, 1, 1, 1, 1,
1.208433, -0.0127617, 0.5881996, 1, 1, 1, 1, 1,
1.225956, -0.7221418, 2.863191, 1, 1, 1, 1, 1,
1.228242, -1.274727, 3.994618, 1, 1, 1, 1, 1,
1.229653, 0.05727391, -0.3645173, 1, 1, 1, 1, 1,
1.232361, -0.9331461, 2.093858, 1, 1, 1, 1, 1,
1.235599, 0.6054074, 0.1094172, 1, 1, 1, 1, 1,
1.240118, 0.7407561, -0.1564217, 0, 0, 1, 1, 1,
1.241792, -0.07641906, 2.589735, 1, 0, 0, 1, 1,
1.244613, -0.8498439, 0.8375103, 1, 0, 0, 1, 1,
1.253667, 0.6244595, 0.8888083, 1, 0, 0, 1, 1,
1.25536, 0.06184328, 1.850362, 1, 0, 0, 1, 1,
1.255645, -2.754434, 4.368359, 1, 0, 0, 1, 1,
1.272625, -1.205281, 3.154836, 0, 0, 0, 1, 1,
1.274039, 0.1653906, 0.6819289, 0, 0, 0, 1, 1,
1.30313, -1.918043, 2.067011, 0, 0, 0, 1, 1,
1.311286, 0.1895341, 0.2990995, 0, 0, 0, 1, 1,
1.324381, -1.061446, 4.304644, 0, 0, 0, 1, 1,
1.327469, -0.2290809, 2.072318, 0, 0, 0, 1, 1,
1.343978, 0.6521162, 0.7775143, 0, 0, 0, 1, 1,
1.347735, -0.480254, 1.446371, 1, 1, 1, 1, 1,
1.351082, -1.792374, 2.724751, 1, 1, 1, 1, 1,
1.37101, -0.4657242, 1.877499, 1, 1, 1, 1, 1,
1.385184, -1.760737, 3.414291, 1, 1, 1, 1, 1,
1.406367, 0.6796424, 2.800914, 1, 1, 1, 1, 1,
1.410591, -1.258192, 2.585751, 1, 1, 1, 1, 1,
1.416941, -1.080718, 1.276587, 1, 1, 1, 1, 1,
1.420769, -0.01494649, 0.8289924, 1, 1, 1, 1, 1,
1.421008, 0.4979129, 1.217717, 1, 1, 1, 1, 1,
1.426634, 0.9188486, 1.96006, 1, 1, 1, 1, 1,
1.427381, 0.6518384, -0.4175656, 1, 1, 1, 1, 1,
1.453951, 0.264556, 2.102684, 1, 1, 1, 1, 1,
1.458011, 0.02182856, 0.8380195, 1, 1, 1, 1, 1,
1.461511, -0.7042952, 2.012877, 1, 1, 1, 1, 1,
1.466023, 0.4152361, -2.662023e-05, 1, 1, 1, 1, 1,
1.473636, -0.0216304, 0.2283349, 0, 0, 1, 1, 1,
1.494083, 1.39673, 1.672503, 1, 0, 0, 1, 1,
1.496955, -1.03177, 1.912117, 1, 0, 0, 1, 1,
1.510177, -0.2699327, 1.264478, 1, 0, 0, 1, 1,
1.512477, 1.074971, 1.12312, 1, 0, 0, 1, 1,
1.512748, 0.8869245, 2.136041, 1, 0, 0, 1, 1,
1.519427, -0.2465053, 3.039804, 0, 0, 0, 1, 1,
1.520159, 0.3847235, 0.9937525, 0, 0, 0, 1, 1,
1.539966, -0.084687, 2.913843, 0, 0, 0, 1, 1,
1.56045, 0.04604257, 0.9050542, 0, 0, 0, 1, 1,
1.56096, -1.295139, 1.384941, 0, 0, 0, 1, 1,
1.561324, 0.5066484, 1.638031, 0, 0, 0, 1, 1,
1.562917, 0.3795566, 1.195142, 0, 0, 0, 1, 1,
1.582079, 0.6470139, 0.973396, 1, 1, 1, 1, 1,
1.59265, 1.517161, -0.1963886, 1, 1, 1, 1, 1,
1.606341, 1.528382, 2.402074, 1, 1, 1, 1, 1,
1.60764, 0.9279115, 2.709723, 1, 1, 1, 1, 1,
1.619489, -0.5720056, 1.274862, 1, 1, 1, 1, 1,
1.623143, 0.7285765, -0.7801355, 1, 1, 1, 1, 1,
1.643163, 0.4398878, 1.943109, 1, 1, 1, 1, 1,
1.666428, -0.9932938, 1.22222, 1, 1, 1, 1, 1,
1.702408, -0.06413957, 1.046241, 1, 1, 1, 1, 1,
1.708856, -0.009876997, 2.394561, 1, 1, 1, 1, 1,
1.709923, -0.1553927, 1.126485, 1, 1, 1, 1, 1,
1.712728, -0.516547, 2.452168, 1, 1, 1, 1, 1,
1.720863, 1.424695, 1.558075, 1, 1, 1, 1, 1,
1.723816, 0.90955, -0.3077124, 1, 1, 1, 1, 1,
1.741235, 0.3751207, 0.03325119, 1, 1, 1, 1, 1,
1.749816, 0.03564482, 3.577597, 0, 0, 1, 1, 1,
1.773354, -0.493944, 1.514644, 1, 0, 0, 1, 1,
1.804031, 1.157617, 1.075236, 1, 0, 0, 1, 1,
1.849728, 1.804682, 1.253158, 1, 0, 0, 1, 1,
1.89656, 0.53996, 0.6635799, 1, 0, 0, 1, 1,
1.916355, -0.4964294, 1.426861, 1, 0, 0, 1, 1,
1.918152, -0.2764117, 0.7717515, 0, 0, 0, 1, 1,
1.928612, -0.3400884, 0.580133, 0, 0, 0, 1, 1,
1.949725, -0.4120709, 1.390736, 0, 0, 0, 1, 1,
1.953603, -1.113906, 2.337281, 0, 0, 0, 1, 1,
1.960624, -0.2785314, 2.967918, 0, 0, 0, 1, 1,
1.964302, 0.9376628, 0.58345, 0, 0, 0, 1, 1,
1.972924, 0.6223239, 1.953428, 0, 0, 0, 1, 1,
1.99243, -1.030636, 1.25077, 1, 1, 1, 1, 1,
1.998698, 1.464509, -0.9837093, 1, 1, 1, 1, 1,
2.010533, -0.3934675, 1.445415, 1, 1, 1, 1, 1,
2.027994, -1.713764, 2.252558, 1, 1, 1, 1, 1,
2.030894, -0.4661458, 3.328144, 1, 1, 1, 1, 1,
2.038313, -2.058786, 2.29187, 1, 1, 1, 1, 1,
2.043903, -0.5626419, 1.085005, 1, 1, 1, 1, 1,
2.045285, -0.5932174, 1.691501, 1, 1, 1, 1, 1,
2.127317, 0.2433241, 3.957847, 1, 1, 1, 1, 1,
2.148469, 0.2117907, 1.072254, 1, 1, 1, 1, 1,
2.186567, 0.4428191, 0.1579218, 1, 1, 1, 1, 1,
2.212853, 0.3810571, 3.058794, 1, 1, 1, 1, 1,
2.279142, -0.2882313, 0.9931798, 1, 1, 1, 1, 1,
2.313526, 1.631167, 0.8496652, 1, 1, 1, 1, 1,
2.324754, -0.5170484, -0.01999342, 1, 1, 1, 1, 1,
2.331792, -0.1971069, 1.146685, 0, 0, 1, 1, 1,
2.467844, -0.0675626, 1.127539, 1, 0, 0, 1, 1,
2.478527, -1.161691, 3.068944, 1, 0, 0, 1, 1,
2.487074, -1.5114, 2.151899, 1, 0, 0, 1, 1,
2.517945, 1.76402, 3.299021, 1, 0, 0, 1, 1,
2.540782, -0.1110134, -0.1378013, 1, 0, 0, 1, 1,
2.583685, 0.3886656, 0.5247937, 0, 0, 0, 1, 1,
2.623388, 0.1456023, 0.1748754, 0, 0, 0, 1, 1,
2.631128, -0.3730723, 0.7156821, 0, 0, 0, 1, 1,
2.840611, -0.3536946, 2.147051, 0, 0, 0, 1, 1,
2.848088, 0.2652469, 1.868982, 0, 0, 0, 1, 1,
2.896008, -2.141005, -0.03171285, 0, 0, 0, 1, 1,
2.93072, 0.3245766, 1.081466, 0, 0, 0, 1, 1,
2.939549, 0.2166015, 1.767312, 1, 1, 1, 1, 1,
3.002257, -0.2352832, 1.672105, 1, 1, 1, 1, 1,
3.060472, 1.466613, 0.8953342, 1, 1, 1, 1, 1,
3.094438, -1.282048, 1.718957, 1, 1, 1, 1, 1,
3.653852, -0.8511835, 1.122976, 1, 1, 1, 1, 1,
3.687978, 0.4046343, 2.037697, 1, 1, 1, 1, 1,
4.00849, -1.683023, 2.821132, 1, 1, 1, 1, 1
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
var radius = 10.21705;
var distance = 35.88697;
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
mvMatrix.translate( -0.4311531, 0.3627968, -0.4402654 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.88697);
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
