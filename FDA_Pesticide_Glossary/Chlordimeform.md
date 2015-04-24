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
-3.597193, -1.882765, -0.6948943, 1, 0, 0, 1,
-2.967416, 0.01945382, -2.851397, 1, 0.007843138, 0, 1,
-2.908073, 0.4426306, -3.210887, 1, 0.01176471, 0, 1,
-2.875456, 0.1890157, -0.9360914, 1, 0.01960784, 0, 1,
-2.765032, 0.7248961, -1.503643, 1, 0.02352941, 0, 1,
-2.652427, -0.2678039, -2.411035, 1, 0.03137255, 0, 1,
-2.542091, 0.6234605, -2.121429, 1, 0.03529412, 0, 1,
-2.463779, -0.5354857, -0.1640765, 1, 0.04313726, 0, 1,
-2.427632, 0.6305475, -0.3874778, 1, 0.04705882, 0, 1,
-2.392817, -0.009627865, -1.995894, 1, 0.05490196, 0, 1,
-2.386313, 0.4946361, -1.181001, 1, 0.05882353, 0, 1,
-2.334638, -0.9978853, -3.267059, 1, 0.06666667, 0, 1,
-2.32441, -0.5681043, -1.9427, 1, 0.07058824, 0, 1,
-2.30459, 0.01856729, -0.8869878, 1, 0.07843138, 0, 1,
-2.275172, 0.0181115, 0.07859826, 1, 0.08235294, 0, 1,
-2.221874, 1.087486, -0.8316326, 1, 0.09019608, 0, 1,
-2.146747, 2.469763, -1.838352, 1, 0.09411765, 0, 1,
-2.024637, 0.9233591, -1.318614, 1, 0.1019608, 0, 1,
-2.014507, -0.0206644, -0.9389582, 1, 0.1098039, 0, 1,
-1.997779, -0.6070578, -2.431321, 1, 0.1137255, 0, 1,
-1.994862, -0.3773393, -1.505302, 1, 0.1215686, 0, 1,
-1.975157, -0.09018819, -1.589123, 1, 0.1254902, 0, 1,
-1.96147, 0.6740757, -0.5381581, 1, 0.1333333, 0, 1,
-1.95698, 1.652696, -1.686647, 1, 0.1372549, 0, 1,
-1.953459, -0.6139588, -3.304588, 1, 0.145098, 0, 1,
-1.942948, -0.3155576, -1.497936, 1, 0.1490196, 0, 1,
-1.883269, -0.1586849, -0.8571258, 1, 0.1568628, 0, 1,
-1.883198, -1.054502, -1.673546, 1, 0.1607843, 0, 1,
-1.879732, 0.1373268, -0.007671583, 1, 0.1686275, 0, 1,
-1.867219, 0.072074, -0.7408803, 1, 0.172549, 0, 1,
-1.86199, 0.2610331, -1.737226, 1, 0.1803922, 0, 1,
-1.849272, -0.3900957, -0.6325608, 1, 0.1843137, 0, 1,
-1.845811, 1.714266, -0.8954033, 1, 0.1921569, 0, 1,
-1.841369, -0.7866067, -1.048427, 1, 0.1960784, 0, 1,
-1.838756, 1.51936, 0.150783, 1, 0.2039216, 0, 1,
-1.837167, 0.9917907, -1.774708, 1, 0.2117647, 0, 1,
-1.819744, -0.9884375, -1.43746, 1, 0.2156863, 0, 1,
-1.755811, 0.9485422, -0.6175811, 1, 0.2235294, 0, 1,
-1.747786, 1.158806, -0.3068253, 1, 0.227451, 0, 1,
-1.746876, 0.1183634, 0.3113088, 1, 0.2352941, 0, 1,
-1.725147, -0.8273429, -0.4155744, 1, 0.2392157, 0, 1,
-1.708912, -0.5169693, -2.918927, 1, 0.2470588, 0, 1,
-1.708091, -0.9999414, -2.949156, 1, 0.2509804, 0, 1,
-1.686851, 0.510519, -1.657514, 1, 0.2588235, 0, 1,
-1.682231, 0.3569524, -1.858165, 1, 0.2627451, 0, 1,
-1.664388, 1.72586, -2.312478, 1, 0.2705882, 0, 1,
-1.660425, -0.6458509, -1.483683, 1, 0.2745098, 0, 1,
-1.653475, -0.1396133, -1.07405, 1, 0.282353, 0, 1,
-1.650435, -0.6211793, -1.358695, 1, 0.2862745, 0, 1,
-1.6457, 0.02491501, -0.5544896, 1, 0.2941177, 0, 1,
-1.64178, -0.1360588, -2.536625, 1, 0.3019608, 0, 1,
-1.637942, -0.4946391, -0.9801719, 1, 0.3058824, 0, 1,
-1.633723, 0.7680882, -2.130264, 1, 0.3137255, 0, 1,
-1.622968, -0.7706575, -1.04379, 1, 0.3176471, 0, 1,
-1.571541, -0.4094363, -1.852156, 1, 0.3254902, 0, 1,
-1.567918, -0.1344252, -1.994294, 1, 0.3294118, 0, 1,
-1.560358, 1.416125, -0.6645828, 1, 0.3372549, 0, 1,
-1.557797, 0.3228184, 0.1301236, 1, 0.3411765, 0, 1,
-1.552291, 0.4082604, -1.544532, 1, 0.3490196, 0, 1,
-1.545738, 0.2177028, -4.010029, 1, 0.3529412, 0, 1,
-1.537541, -0.2764603, -1.671011, 1, 0.3607843, 0, 1,
-1.536464, -1.668961, -2.449295, 1, 0.3647059, 0, 1,
-1.511105, -0.493286, -1.560539, 1, 0.372549, 0, 1,
-1.484092, -0.849785, -1.860129, 1, 0.3764706, 0, 1,
-1.481286, -2.33731, -3.566664, 1, 0.3843137, 0, 1,
-1.466806, -0.283098, -2.109332, 1, 0.3882353, 0, 1,
-1.45896, 0.5038675, -0.4924069, 1, 0.3960784, 0, 1,
-1.458894, -1.535448, -2.616977, 1, 0.4039216, 0, 1,
-1.449181, -1.664601, -1.923941, 1, 0.4078431, 0, 1,
-1.448687, 1.6271, -1.673196, 1, 0.4156863, 0, 1,
-1.445786, -0.009839653, -1.169605, 1, 0.4196078, 0, 1,
-1.420644, -0.5557992, -2.914508, 1, 0.427451, 0, 1,
-1.408764, 1.722155, 0.4653674, 1, 0.4313726, 0, 1,
-1.399666, 0.4738311, -0.1613138, 1, 0.4392157, 0, 1,
-1.382585, 0.8305235, -1.586828, 1, 0.4431373, 0, 1,
-1.378436, 0.07645517, -1.080075, 1, 0.4509804, 0, 1,
-1.373272, 0.8026526, -0.3960235, 1, 0.454902, 0, 1,
-1.354415, -1.014354, -3.157468, 1, 0.4627451, 0, 1,
-1.346786, -0.3750881, -1.13486, 1, 0.4666667, 0, 1,
-1.343098, -0.9437911, -3.607036, 1, 0.4745098, 0, 1,
-1.340668, 0.7792916, -1.441264, 1, 0.4784314, 0, 1,
-1.337608, 2.415666, 1.081051, 1, 0.4862745, 0, 1,
-1.333774, 1.207745, -3.681467, 1, 0.4901961, 0, 1,
-1.333205, -1.136002, -1.487926, 1, 0.4980392, 0, 1,
-1.331585, -2.25237, -1.318613, 1, 0.5058824, 0, 1,
-1.329897, 1.292983, -0.8723637, 1, 0.509804, 0, 1,
-1.320179, 0.002992704, -1.435259, 1, 0.5176471, 0, 1,
-1.309139, -0.638077, -2.108915, 1, 0.5215687, 0, 1,
-1.308343, 0.6086246, -0.7017968, 1, 0.5294118, 0, 1,
-1.303803, 2.160994, -0.6473898, 1, 0.5333334, 0, 1,
-1.282824, 0.3938636, -0.7823493, 1, 0.5411765, 0, 1,
-1.274039, -0.8914821, -4.039623, 1, 0.5450981, 0, 1,
-1.266328, -1.250971, -2.045451, 1, 0.5529412, 0, 1,
-1.265217, -0.8145204, -1.53115, 1, 0.5568628, 0, 1,
-1.262339, 0.01271337, 0.443552, 1, 0.5647059, 0, 1,
-1.252919, -1.066074, -2.172662, 1, 0.5686275, 0, 1,
-1.247686, 1.172434, -1.63451, 1, 0.5764706, 0, 1,
-1.245155, -0.02609764, -2.978258, 1, 0.5803922, 0, 1,
-1.241467, -1.304078, -1.812934, 1, 0.5882353, 0, 1,
-1.239348, 1.013888, -0.7493626, 1, 0.5921569, 0, 1,
-1.237706, 2.881772, -1.798228, 1, 0.6, 0, 1,
-1.231954, -0.7134315, -2.613955, 1, 0.6078432, 0, 1,
-1.22599, -0.9574017, -1.314187, 1, 0.6117647, 0, 1,
-1.219504, 0.3143364, -3.449032, 1, 0.6196079, 0, 1,
-1.217849, -0.007871579, 0.787152, 1, 0.6235294, 0, 1,
-1.215309, -0.4989884, -3.970864, 1, 0.6313726, 0, 1,
-1.197712, 0.2001267, -1.061721, 1, 0.6352941, 0, 1,
-1.196064, -0.00802107, -2.641415, 1, 0.6431373, 0, 1,
-1.193641, -0.2842031, -2.077679, 1, 0.6470588, 0, 1,
-1.187751, -0.2339675, -4.486839, 1, 0.654902, 0, 1,
-1.186385, 0.692418, -1.390795, 1, 0.6588235, 0, 1,
-1.180835, -0.3646857, -3.12129, 1, 0.6666667, 0, 1,
-1.178894, -0.6039535, -2.395781, 1, 0.6705883, 0, 1,
-1.173615, -0.8729998, -1.255628, 1, 0.6784314, 0, 1,
-1.173597, -1.748794, -0.8448033, 1, 0.682353, 0, 1,
-1.172666, -0.0983155, -1.665873, 1, 0.6901961, 0, 1,
-1.169142, -1.016127, -2.574615, 1, 0.6941177, 0, 1,
-1.163685, -1.611627, -2.960694, 1, 0.7019608, 0, 1,
-1.163329, 0.3694477, -1.368035, 1, 0.7098039, 0, 1,
-1.160392, 0.5527508, -0.2401018, 1, 0.7137255, 0, 1,
-1.156438, -0.5048869, -1.442003, 1, 0.7215686, 0, 1,
-1.153104, -0.4870673, -1.160805, 1, 0.7254902, 0, 1,
-1.146753, -0.3164497, -1.768473, 1, 0.7333333, 0, 1,
-1.144343, 0.4536118, -0.8033066, 1, 0.7372549, 0, 1,
-1.139299, 0.5375237, -0.9351028, 1, 0.7450981, 0, 1,
-1.13891, -0.2417681, -1.649355, 1, 0.7490196, 0, 1,
-1.135319, -0.8999822, -2.593559, 1, 0.7568628, 0, 1,
-1.123658, 0.9595545, -2.453174, 1, 0.7607843, 0, 1,
-1.108885, -1.010789, -1.488645, 1, 0.7686275, 0, 1,
-1.102479, 0.8534914, 0.8493957, 1, 0.772549, 0, 1,
-1.101497, 0.07362533, -2.389721, 1, 0.7803922, 0, 1,
-1.098052, -0.5953906, -2.649078, 1, 0.7843137, 0, 1,
-1.095782, 1.714922, -0.8811091, 1, 0.7921569, 0, 1,
-1.094666, 0.1410313, 0.0832533, 1, 0.7960784, 0, 1,
-1.094067, 0.7704479, -2.395576, 1, 0.8039216, 0, 1,
-1.082439, 0.4644512, -1.248288, 1, 0.8117647, 0, 1,
-1.082392, 0.3606533, -1.599392, 1, 0.8156863, 0, 1,
-1.080751, 0.7454742, -0.8869007, 1, 0.8235294, 0, 1,
-1.08014, 0.2051537, 0.1742622, 1, 0.827451, 0, 1,
-1.07598, 0.5691014, -2.373314, 1, 0.8352941, 0, 1,
-1.073835, 3.149834, -0.3455505, 1, 0.8392157, 0, 1,
-1.065416, -0.5654938, -2.413888, 1, 0.8470588, 0, 1,
-1.065083, 0.566911, -2.659125, 1, 0.8509804, 0, 1,
-1.063142, 0.3649728, -0.3849076, 1, 0.8588235, 0, 1,
-1.062899, -0.3811404, -2.324109, 1, 0.8627451, 0, 1,
-1.056027, 0.1482836, -1.921452, 1, 0.8705882, 0, 1,
-1.050495, 0.5016662, -1.002293, 1, 0.8745098, 0, 1,
-1.048765, 0.5172805, -0.5805933, 1, 0.8823529, 0, 1,
-1.037669, -0.1201209, -2.430021, 1, 0.8862745, 0, 1,
-1.025554, -0.9345718, -1.423174, 1, 0.8941177, 0, 1,
-1.023658, 1.365965, -1.588933, 1, 0.8980392, 0, 1,
-1.022007, 0.3311893, -1.14833, 1, 0.9058824, 0, 1,
-1.015802, -1.016472, -3.343766, 1, 0.9137255, 0, 1,
-1.013578, 0.2532094, -0.7266933, 1, 0.9176471, 0, 1,
-1.010339, 0.4895701, -2.58755, 1, 0.9254902, 0, 1,
-1.006936, 0.01443169, -1.681971, 1, 0.9294118, 0, 1,
-1.005647, -1.404973, -1.956235, 1, 0.9372549, 0, 1,
-1.004777, 0.08366653, -1.956196, 1, 0.9411765, 0, 1,
-1.003065, -1.822561, -1.23961, 1, 0.9490196, 0, 1,
-1.001227, 0.5750465, 0.7246878, 1, 0.9529412, 0, 1,
-1.000867, 0.3608251, -1.577332, 1, 0.9607843, 0, 1,
-0.9982785, 1.494214, 0.601832, 1, 0.9647059, 0, 1,
-0.9976023, 1.091585, 1.359421, 1, 0.972549, 0, 1,
-0.9946169, 2.235202, 0.4468019, 1, 0.9764706, 0, 1,
-0.9877365, -0.8026153, -3.211692, 1, 0.9843137, 0, 1,
-0.9817978, 1.360795, -2.024409, 1, 0.9882353, 0, 1,
-0.9767739, -0.2823632, -1.192868, 1, 0.9960784, 0, 1,
-0.973901, -1.465206, -2.683394, 0.9960784, 1, 0, 1,
-0.9734452, -1.09576, -2.659461, 0.9921569, 1, 0, 1,
-0.9727042, -0.5998973, -2.678777, 0.9843137, 1, 0, 1,
-0.9610298, -0.02342728, -1.143348, 0.9803922, 1, 0, 1,
-0.9608085, 0.6852301, -1.482188, 0.972549, 1, 0, 1,
-0.9598174, 0.6437287, -1.686388, 0.9686275, 1, 0, 1,
-0.9591612, -0.337311, -1.060752, 0.9607843, 1, 0, 1,
-0.9568122, 0.7645265, -0.8778823, 0.9568627, 1, 0, 1,
-0.9542479, -1.15755, -1.935419, 0.9490196, 1, 0, 1,
-0.9474984, 1.901106, 0.1628144, 0.945098, 1, 0, 1,
-0.9303433, -0.7142848, -3.067045, 0.9372549, 1, 0, 1,
-0.9259586, -1.450071, -3.108537, 0.9333333, 1, 0, 1,
-0.916418, -0.7601437, -3.164677, 0.9254902, 1, 0, 1,
-0.9147666, 0.9851038, -0.3596122, 0.9215686, 1, 0, 1,
-0.9113444, -1.625419, -2.638404, 0.9137255, 1, 0, 1,
-0.9054429, -1.988294, -3.338934, 0.9098039, 1, 0, 1,
-0.8950639, -0.6707883, -4.057978, 0.9019608, 1, 0, 1,
-0.8946233, -1.929627, -4.623874, 0.8941177, 1, 0, 1,
-0.8942403, -1.767686, -0.9892049, 0.8901961, 1, 0, 1,
-0.8934937, 0.5697927, -0.7739017, 0.8823529, 1, 0, 1,
-0.8910021, 0.2234533, -1.381146, 0.8784314, 1, 0, 1,
-0.869246, -0.7770104, -2.457571, 0.8705882, 1, 0, 1,
-0.8692211, 0.4156421, -2.229205, 0.8666667, 1, 0, 1,
-0.8676704, 0.7798684, -2.149751, 0.8588235, 1, 0, 1,
-0.8653905, 0.1417927, -1.364702, 0.854902, 1, 0, 1,
-0.8603494, 0.7676346, -2.233969, 0.8470588, 1, 0, 1,
-0.8556816, 0.02317823, -1.730408, 0.8431373, 1, 0, 1,
-0.8538972, -0.3555608, -1.142349, 0.8352941, 1, 0, 1,
-0.8511742, -0.8275434, -2.839561, 0.8313726, 1, 0, 1,
-0.8438016, -1.021103, -3.090632, 0.8235294, 1, 0, 1,
-0.8436893, 0.4094466, -1.250111, 0.8196079, 1, 0, 1,
-0.8402563, -0.6817541, -1.678077, 0.8117647, 1, 0, 1,
-0.8362309, 0.8466252, -0.3835058, 0.8078431, 1, 0, 1,
-0.8346724, -0.1882764, -1.562997, 0.8, 1, 0, 1,
-0.8298854, 0.3752796, -0.3702191, 0.7921569, 1, 0, 1,
-0.8276051, -0.1140249, -1.129669, 0.7882353, 1, 0, 1,
-0.8200197, -0.3339324, -2.82706, 0.7803922, 1, 0, 1,
-0.8187917, 0.2587088, -2.309139, 0.7764706, 1, 0, 1,
-0.810414, 1.106607, -0.9748184, 0.7686275, 1, 0, 1,
-0.8083752, 1.177292, -0.7024886, 0.7647059, 1, 0, 1,
-0.8055429, 0.1193032, -0.9123694, 0.7568628, 1, 0, 1,
-0.8015214, 0.6212466, -2.837879, 0.7529412, 1, 0, 1,
-0.7965599, -1.857235, -2.122096, 0.7450981, 1, 0, 1,
-0.7947432, 0.653569, -1.11526, 0.7411765, 1, 0, 1,
-0.7925266, -1.617228, -2.698525, 0.7333333, 1, 0, 1,
-0.7885484, 0.05869268, 0.2383504, 0.7294118, 1, 0, 1,
-0.7796519, 0.5998563, -1.002831, 0.7215686, 1, 0, 1,
-0.7785963, -1.844558, -3.493175, 0.7176471, 1, 0, 1,
-0.7785121, 1.391931, -0.2390732, 0.7098039, 1, 0, 1,
-0.7764847, 0.6056098, 0.9534478, 0.7058824, 1, 0, 1,
-0.7762797, 0.2824946, -2.180162, 0.6980392, 1, 0, 1,
-0.7736627, -0.8508916, -2.894118, 0.6901961, 1, 0, 1,
-0.765781, 0.09902989, -1.253068, 0.6862745, 1, 0, 1,
-0.7646071, -2.188148, -3.905169, 0.6784314, 1, 0, 1,
-0.764573, -0.1035691, -1.80338, 0.6745098, 1, 0, 1,
-0.763182, 1.455443, 0.31736, 0.6666667, 1, 0, 1,
-0.7567893, 0.3573968, -2.306592, 0.6627451, 1, 0, 1,
-0.7407667, 0.4237872, 1.162873, 0.654902, 1, 0, 1,
-0.7394157, 2.01507, 1.259671, 0.6509804, 1, 0, 1,
-0.7382107, -1.181793, -5.016351, 0.6431373, 1, 0, 1,
-0.7341973, 1.126989, -2.39781, 0.6392157, 1, 0, 1,
-0.7333584, -0.01590622, -1.871188, 0.6313726, 1, 0, 1,
-0.7292298, 0.9565766, -1.154855, 0.627451, 1, 0, 1,
-0.7256628, -1.63836, -1.945306, 0.6196079, 1, 0, 1,
-0.7184558, 0.9353049, -2.059391, 0.6156863, 1, 0, 1,
-0.7112169, 1.13645, 0.2727923, 0.6078432, 1, 0, 1,
-0.7075261, -0.161571, -1.989305, 0.6039216, 1, 0, 1,
-0.6977679, 0.6362123, 0.6554106, 0.5960785, 1, 0, 1,
-0.6960556, -1.747572, -0.7333561, 0.5882353, 1, 0, 1,
-0.6896565, 1.016151, -1.657229, 0.5843138, 1, 0, 1,
-0.6878203, -0.5868878, -2.57875, 0.5764706, 1, 0, 1,
-0.6873307, -1.615489, -3.933245, 0.572549, 1, 0, 1,
-0.6811561, 0.9113938, 0.2852637, 0.5647059, 1, 0, 1,
-0.6782826, 0.585143, -1.097175, 0.5607843, 1, 0, 1,
-0.6755762, -0.5154133, -1.515378, 0.5529412, 1, 0, 1,
-0.6748946, 0.5827268, -0.4361577, 0.5490196, 1, 0, 1,
-0.6748113, 1.301579, -1.320292, 0.5411765, 1, 0, 1,
-0.6705613, -0.3406724, -1.010099, 0.5372549, 1, 0, 1,
-0.657277, 0.2425236, -1.689487, 0.5294118, 1, 0, 1,
-0.6561815, 0.210584, -1.129857, 0.5254902, 1, 0, 1,
-0.6558772, 0.5538901, -1.22866, 0.5176471, 1, 0, 1,
-0.6551526, -2.190182, -3.817972, 0.5137255, 1, 0, 1,
-0.6540574, -0.4083272, -3.71483, 0.5058824, 1, 0, 1,
-0.6496302, 1.586472, -1.596048, 0.5019608, 1, 0, 1,
-0.6429042, 1.338607, -0.2791715, 0.4941176, 1, 0, 1,
-0.6418452, 0.01721253, -2.241402, 0.4862745, 1, 0, 1,
-0.6405114, -0.2147388, -3.427788, 0.4823529, 1, 0, 1,
-0.6401491, 0.2837836, -0.3802148, 0.4745098, 1, 0, 1,
-0.6392211, -0.6714068, -1.686472, 0.4705882, 1, 0, 1,
-0.6384438, -0.6925474, -2.122467, 0.4627451, 1, 0, 1,
-0.6383876, 0.7638543, -0.6031484, 0.4588235, 1, 0, 1,
-0.6380003, -1.19479, -2.857039, 0.4509804, 1, 0, 1,
-0.6372045, 1.027355, -1.021824, 0.4470588, 1, 0, 1,
-0.6370772, 0.6220235, 1.433434, 0.4392157, 1, 0, 1,
-0.6362389, 1.175897, -0.6857287, 0.4352941, 1, 0, 1,
-0.6335973, 0.1470729, -1.030118, 0.427451, 1, 0, 1,
-0.6317296, 0.2845583, -0.4259186, 0.4235294, 1, 0, 1,
-0.6307666, -0.6504574, -1.648104, 0.4156863, 1, 0, 1,
-0.6269194, -0.1555247, -3.912574, 0.4117647, 1, 0, 1,
-0.6256807, 1.243098, -0.7118434, 0.4039216, 1, 0, 1,
-0.6210938, 0.3794419, -0.6891568, 0.3960784, 1, 0, 1,
-0.6201439, -0.06453359, -1.600614, 0.3921569, 1, 0, 1,
-0.6200529, 0.770147, -0.9981417, 0.3843137, 1, 0, 1,
-0.6189308, 1.213357, 0.7395741, 0.3803922, 1, 0, 1,
-0.6151248, 1.323265, -1.647175, 0.372549, 1, 0, 1,
-0.6150569, 1.807419, -0.1759455, 0.3686275, 1, 0, 1,
-0.61049, -0.3458132, -3.030186, 0.3607843, 1, 0, 1,
-0.6102371, -1.579523, -2.79228, 0.3568628, 1, 0, 1,
-0.6036977, 0.1390732, -1.546664, 0.3490196, 1, 0, 1,
-0.6020944, 0.1403536, -0.6725664, 0.345098, 1, 0, 1,
-0.5993845, 0.2207997, -1.797791, 0.3372549, 1, 0, 1,
-0.5883751, -1.073356, -3.211533, 0.3333333, 1, 0, 1,
-0.5880198, 0.4312545, -1.707014, 0.3254902, 1, 0, 1,
-0.5837841, 0.9664041, -1.503471, 0.3215686, 1, 0, 1,
-0.5835836, -0.306026, -1.893622, 0.3137255, 1, 0, 1,
-0.5833734, -0.4124011, -2.514904, 0.3098039, 1, 0, 1,
-0.5833192, -1.167398, -3.351164, 0.3019608, 1, 0, 1,
-0.5801579, -0.3507719, -0.5303411, 0.2941177, 1, 0, 1,
-0.5747786, 0.2483041, -0.7404069, 0.2901961, 1, 0, 1,
-0.5746468, -0.01550135, -2.617749, 0.282353, 1, 0, 1,
-0.5663608, -1.431641, -3.947048, 0.2784314, 1, 0, 1,
-0.5650762, 1.376914, -1.759688, 0.2705882, 1, 0, 1,
-0.5629024, -0.8174216, -2.018466, 0.2666667, 1, 0, 1,
-0.5620734, -2.047939, -2.991715, 0.2588235, 1, 0, 1,
-0.5617867, -0.5593649, -2.512483, 0.254902, 1, 0, 1,
-0.5609211, 0.1906044, -1.479534, 0.2470588, 1, 0, 1,
-0.5524628, 0.199297, -0.3572639, 0.2431373, 1, 0, 1,
-0.5493937, 1.016527, -1.553898, 0.2352941, 1, 0, 1,
-0.5493022, -1.258927, -3.594585, 0.2313726, 1, 0, 1,
-0.5492684, 1.38834, 0.5070214, 0.2235294, 1, 0, 1,
-0.5396754, -0.5468109, -1.441524, 0.2196078, 1, 0, 1,
-0.539026, -0.1402928, -0.5862092, 0.2117647, 1, 0, 1,
-0.537766, -0.729454, -2.20901, 0.2078431, 1, 0, 1,
-0.537703, 0.8238491, -0.420041, 0.2, 1, 0, 1,
-0.5280136, -0.3067826, -1.357885, 0.1921569, 1, 0, 1,
-0.5236601, -0.2383111, -0.8788942, 0.1882353, 1, 0, 1,
-0.5202935, 1.123693, 0.6207081, 0.1803922, 1, 0, 1,
-0.5169746, -0.06404445, -1.515168, 0.1764706, 1, 0, 1,
-0.5165945, -0.8117107, -1.532465, 0.1686275, 1, 0, 1,
-0.5161218, -0.2722688, -2.165507, 0.1647059, 1, 0, 1,
-0.514219, 0.6456937, -1.951177, 0.1568628, 1, 0, 1,
-0.5133601, 0.1382172, -1.942802, 0.1529412, 1, 0, 1,
-0.5126278, 1.904158, -0.7992994, 0.145098, 1, 0, 1,
-0.5118641, -0.2497712, -1.638889, 0.1411765, 1, 0, 1,
-0.5058246, -0.8600577, -1.668739, 0.1333333, 1, 0, 1,
-0.5049522, -0.6794739, -2.341161, 0.1294118, 1, 0, 1,
-0.5048955, 1.232737, 0.9706007, 0.1215686, 1, 0, 1,
-0.5045378, 0.645597, -0.2981978, 0.1176471, 1, 0, 1,
-0.5043052, -0.2430229, -3.006929, 0.1098039, 1, 0, 1,
-0.5020801, 1.285085, -1.556061, 0.1058824, 1, 0, 1,
-0.5003728, 1.227906, -0.3415484, 0.09803922, 1, 0, 1,
-0.496521, 0.3729985, 0.08802669, 0.09019608, 1, 0, 1,
-0.494163, -0.7975022, -2.931045, 0.08627451, 1, 0, 1,
-0.4918221, 0.4224297, -1.794148, 0.07843138, 1, 0, 1,
-0.4916178, -2.161482, -4.864511, 0.07450981, 1, 0, 1,
-0.4910022, 0.4664705, -1.465438, 0.06666667, 1, 0, 1,
-0.4899856, 0.5483314, -1.765437, 0.0627451, 1, 0, 1,
-0.4897182, -0.5979099, -2.977611, 0.05490196, 1, 0, 1,
-0.4896969, 2.02106, -1.770183, 0.05098039, 1, 0, 1,
-0.4873363, 0.5263778, 0.02711816, 0.04313726, 1, 0, 1,
-0.4870784, 0.4075275, -1.683208, 0.03921569, 1, 0, 1,
-0.4865823, 0.3097785, 0.1481878, 0.03137255, 1, 0, 1,
-0.482985, 2.401361, -1.554901, 0.02745098, 1, 0, 1,
-0.4814156, 0.9915544, -0.3170973, 0.01960784, 1, 0, 1,
-0.4718441, 0.0657623, -1.828464, 0.01568628, 1, 0, 1,
-0.4705798, 0.15031, 0.4654496, 0.007843138, 1, 0, 1,
-0.4641579, 0.3823927, -0.9680069, 0.003921569, 1, 0, 1,
-0.4603322, -1.494556, -4.356401, 0, 1, 0.003921569, 1,
-0.4496689, -0.0260374, 0.4035512, 0, 1, 0.01176471, 1,
-0.4430778, 0.08948365, -1.449409, 0, 1, 0.01568628, 1,
-0.4428853, -0.4540852, -4.036805, 0, 1, 0.02352941, 1,
-0.4412797, -0.4614899, -2.415994, 0, 1, 0.02745098, 1,
-0.4374097, -2.301933, -3.064885, 0, 1, 0.03529412, 1,
-0.4352165, 0.2793056, -0.7807332, 0, 1, 0.03921569, 1,
-0.432015, -2.663579, -3.090572, 0, 1, 0.04705882, 1,
-0.4312571, -1.152749, -2.386398, 0, 1, 0.05098039, 1,
-0.4282895, -0.8889557, -2.202597, 0, 1, 0.05882353, 1,
-0.4244383, -0.114599, -1.652097, 0, 1, 0.0627451, 1,
-0.4244247, -0.2887572, -2.007047, 0, 1, 0.07058824, 1,
-0.4213556, -0.06213172, -1.584233, 0, 1, 0.07450981, 1,
-0.4172886, -0.0823945, -2.148637, 0, 1, 0.08235294, 1,
-0.4171272, -0.8717945, -2.602453, 0, 1, 0.08627451, 1,
-0.4117075, -0.6903827, -2.546487, 0, 1, 0.09411765, 1,
-0.4082343, -0.02905893, 0.4338702, 0, 1, 0.1019608, 1,
-0.4042913, -1.040442, -3.05667, 0, 1, 0.1058824, 1,
-0.4030127, -0.3813098, -3.645408, 0, 1, 0.1137255, 1,
-0.4003561, -1.123901, -4.109293, 0, 1, 0.1176471, 1,
-0.3992624, -0.3840439, -1.927115, 0, 1, 0.1254902, 1,
-0.3973968, -2.578589, -1.039545, 0, 1, 0.1294118, 1,
-0.3973294, 1.08034, 0.1543404, 0, 1, 0.1372549, 1,
-0.3933113, 0.4677473, -1.579086, 0, 1, 0.1411765, 1,
-0.3906154, -0.8085105, -1.255367, 0, 1, 0.1490196, 1,
-0.383987, 0.04212042, 0.7371277, 0, 1, 0.1529412, 1,
-0.3835748, 0.9787835, 1.08887, 0, 1, 0.1607843, 1,
-0.3797862, -1.972576, -2.262506, 0, 1, 0.1647059, 1,
-0.3727209, -0.09662093, -2.6813, 0, 1, 0.172549, 1,
-0.3703786, 0.7297412, -1.917297, 0, 1, 0.1764706, 1,
-0.3579233, 0.4986537, -2.101171, 0, 1, 0.1843137, 1,
-0.3565658, 0.4819885, -2.118634, 0, 1, 0.1882353, 1,
-0.3523711, 0.3266641, 0.8025504, 0, 1, 0.1960784, 1,
-0.3505459, 2.378261, 0.05294158, 0, 1, 0.2039216, 1,
-0.3470006, 0.1633362, -0.7674968, 0, 1, 0.2078431, 1,
-0.3469216, 0.3654447, 0.2814394, 0, 1, 0.2156863, 1,
-0.3446647, 0.3472566, -2.42403, 0, 1, 0.2196078, 1,
-0.3443237, 2.10226, -0.1768733, 0, 1, 0.227451, 1,
-0.3384646, 1.502766, -1.387088, 0, 1, 0.2313726, 1,
-0.3357344, -1.201724, -2.03119, 0, 1, 0.2392157, 1,
-0.3332484, 0.1811446, -2.725728, 0, 1, 0.2431373, 1,
-0.3304823, 0.2441362, -1.102542, 0, 1, 0.2509804, 1,
-0.3203915, 1.860451, -0.4678965, 0, 1, 0.254902, 1,
-0.3193612, 2.439423, 1.950304, 0, 1, 0.2627451, 1,
-0.318791, 0.6151637, 0.5107156, 0, 1, 0.2666667, 1,
-0.3074467, 3.063587, -0.1374419, 0, 1, 0.2745098, 1,
-0.3047115, -1.318118, -4.227316, 0, 1, 0.2784314, 1,
-0.3033225, -0.642895, -4.009398, 0, 1, 0.2862745, 1,
-0.295514, 2.047586, -0.5612235, 0, 1, 0.2901961, 1,
-0.2950477, 0.9731998, -2.314682, 0, 1, 0.2980392, 1,
-0.2945763, -0.01962422, -1.823175, 0, 1, 0.3058824, 1,
-0.293857, 0.3057908, -1.565787, 0, 1, 0.3098039, 1,
-0.2927468, -0.9341213, -3.477634, 0, 1, 0.3176471, 1,
-0.2910316, -1.990083, -1.453815, 0, 1, 0.3215686, 1,
-0.2889029, -1.616876, -2.825746, 0, 1, 0.3294118, 1,
-0.2826421, -1.806043, -3.325437, 0, 1, 0.3333333, 1,
-0.2812656, 0.5461023, -1.23546, 0, 1, 0.3411765, 1,
-0.2773817, 1.301366, -1.578282, 0, 1, 0.345098, 1,
-0.2762687, 1.362075, -0.4072461, 0, 1, 0.3529412, 1,
-0.274738, -0.1078295, -1.503959, 0, 1, 0.3568628, 1,
-0.2742277, -0.9054664, -2.031171, 0, 1, 0.3647059, 1,
-0.2707921, -1.490431, -1.439997, 0, 1, 0.3686275, 1,
-0.2689302, 0.0457264, 0.4281882, 0, 1, 0.3764706, 1,
-0.268489, 0.9171657, -1.060163, 0, 1, 0.3803922, 1,
-0.2660397, -0.1735922, -0.7581246, 0, 1, 0.3882353, 1,
-0.2652601, 0.4116852, 0.1188433, 0, 1, 0.3921569, 1,
-0.2640913, -1.659028, -3.508125, 0, 1, 0.4, 1,
-0.2595824, -0.4718112, -2.970558, 0, 1, 0.4078431, 1,
-0.2575256, -0.943347, -3.302329, 0, 1, 0.4117647, 1,
-0.2555975, -1.384753, -1.227392, 0, 1, 0.4196078, 1,
-0.2520469, 0.08410607, -1.418974, 0, 1, 0.4235294, 1,
-0.2419863, 1.134981, -1.964684, 0, 1, 0.4313726, 1,
-0.2406732, -2.265346, -3.344931, 0, 1, 0.4352941, 1,
-0.2373422, -0.6358579, -2.964902, 0, 1, 0.4431373, 1,
-0.2371146, -0.6801379, -1.087621, 0, 1, 0.4470588, 1,
-0.2294352, 0.5820538, 0.1491137, 0, 1, 0.454902, 1,
-0.2285217, -0.9480913, -4.562329, 0, 1, 0.4588235, 1,
-0.2258444, -0.1031315, -1.409434, 0, 1, 0.4666667, 1,
-0.2215282, -1.302811, -2.626343, 0, 1, 0.4705882, 1,
-0.2201264, -0.4859268, -1.871515, 0, 1, 0.4784314, 1,
-0.2200974, 1.287955, 0.8469136, 0, 1, 0.4823529, 1,
-0.2200475, 0.4693971, 0.05126474, 0, 1, 0.4901961, 1,
-0.2158163, -0.122991, -0.5363142, 0, 1, 0.4941176, 1,
-0.2144298, -1.556415, -1.157302, 0, 1, 0.5019608, 1,
-0.2132542, 1.42207, -0.94931, 0, 1, 0.509804, 1,
-0.2124804, 0.6715072, 0.9395213, 0, 1, 0.5137255, 1,
-0.2097078, 1.244364, 0.6058322, 0, 1, 0.5215687, 1,
-0.20893, 0.181436, -1.101579, 0, 1, 0.5254902, 1,
-0.2078402, 0.6538849, 1.216269, 0, 1, 0.5333334, 1,
-0.207564, 0.1056478, -1.981375, 0, 1, 0.5372549, 1,
-0.207121, 0.3631251, -1.641603, 0, 1, 0.5450981, 1,
-0.2070076, 1.84863, 1.319552, 0, 1, 0.5490196, 1,
-0.1970404, -0.8427355, -2.669246, 0, 1, 0.5568628, 1,
-0.1901285, -0.5644319, -1.753911, 0, 1, 0.5607843, 1,
-0.1858676, -0.9441944, -3.066224, 0, 1, 0.5686275, 1,
-0.1808205, 0.1618221, -1.414544, 0, 1, 0.572549, 1,
-0.1804507, -0.6540543, -1.915329, 0, 1, 0.5803922, 1,
-0.1742676, 0.5380633, 0.1082441, 0, 1, 0.5843138, 1,
-0.1741463, -1.628443, -2.866694, 0, 1, 0.5921569, 1,
-0.1694849, -0.4355672, -2.48301, 0, 1, 0.5960785, 1,
-0.1686307, -0.5174428, -2.056303, 0, 1, 0.6039216, 1,
-0.1665273, -1.696571, -1.303649, 0, 1, 0.6117647, 1,
-0.1660521, -1.729483, -3.709526, 0, 1, 0.6156863, 1,
-0.1626412, 0.813335, 0.7163414, 0, 1, 0.6235294, 1,
-0.1602991, -0.09004882, -1.660961, 0, 1, 0.627451, 1,
-0.1598745, 0.0814883, -1.775502, 0, 1, 0.6352941, 1,
-0.1489489, -0.5956842, -3.00172, 0, 1, 0.6392157, 1,
-0.1466544, 1.092864, 1.439176, 0, 1, 0.6470588, 1,
-0.1428649, -0.7363926, -3.061641, 0, 1, 0.6509804, 1,
-0.1416799, -0.7308334, -3.314805, 0, 1, 0.6588235, 1,
-0.1396824, -0.1061087, -2.395751, 0, 1, 0.6627451, 1,
-0.1305473, -0.7386391, -3.543764, 0, 1, 0.6705883, 1,
-0.1304471, 0.7788475, -0.5823252, 0, 1, 0.6745098, 1,
-0.1289345, -1.81039, -1.746451, 0, 1, 0.682353, 1,
-0.1272496, -0.542985, -2.632925, 0, 1, 0.6862745, 1,
-0.1243668, 0.02937028, -3.112501, 0, 1, 0.6941177, 1,
-0.1218581, 1.480395, 0.4296777, 0, 1, 0.7019608, 1,
-0.1130569, 0.007317381, -1.141263, 0, 1, 0.7058824, 1,
-0.1095451, -0.2024251, -2.688662, 0, 1, 0.7137255, 1,
-0.1047957, 1.486562, 0.5012693, 0, 1, 0.7176471, 1,
-0.1031581, -1.466555, -4.598464, 0, 1, 0.7254902, 1,
-0.1030065, -0.1203985, -3.947333, 0, 1, 0.7294118, 1,
-0.1029063, -0.1399554, -1.308477, 0, 1, 0.7372549, 1,
-0.1024874, -0.7282292, -3.504339, 0, 1, 0.7411765, 1,
-0.1002815, 1.004599, 1.309217, 0, 1, 0.7490196, 1,
-0.09781241, -1.404104, -2.691724, 0, 1, 0.7529412, 1,
-0.0908607, 0.6264495, 0.1350527, 0, 1, 0.7607843, 1,
-0.08957323, -1.750679, -3.714452, 0, 1, 0.7647059, 1,
-0.08912202, -2.005893, -2.43672, 0, 1, 0.772549, 1,
-0.08903453, -0.4357328, -1.805201, 0, 1, 0.7764706, 1,
-0.08693378, 1.110718, 2.32165, 0, 1, 0.7843137, 1,
-0.08646017, 0.02744269, -0.9324846, 0, 1, 0.7882353, 1,
-0.08298515, 0.8242712, -0.6495881, 0, 1, 0.7960784, 1,
-0.08280687, 0.001416455, -1.222115, 0, 1, 0.8039216, 1,
-0.07937194, -0.8198395, -3.725905, 0, 1, 0.8078431, 1,
-0.07858218, -0.6927283, -2.05622, 0, 1, 0.8156863, 1,
-0.07624365, -1.456661, -3.588819, 0, 1, 0.8196079, 1,
-0.07517053, 0.2026941, 0.4566396, 0, 1, 0.827451, 1,
-0.07343503, 0.07479502, 1.048352, 0, 1, 0.8313726, 1,
-0.06914205, 0.7449597, -1.248443, 0, 1, 0.8392157, 1,
-0.06758919, -0.7042667, -2.586052, 0, 1, 0.8431373, 1,
-0.06546617, 0.1759569, 2.098761, 0, 1, 0.8509804, 1,
-0.06269085, 0.7765909, 0.4085467, 0, 1, 0.854902, 1,
-0.05784965, -1.537525, -3.533674, 0, 1, 0.8627451, 1,
-0.0455185, -2.138809, -3.291384, 0, 1, 0.8666667, 1,
-0.04550931, -0.3448352, -2.703528, 0, 1, 0.8745098, 1,
-0.04535768, 0.05073657, -1.137823, 0, 1, 0.8784314, 1,
-0.04480553, -0.3736852, -1.52868, 0, 1, 0.8862745, 1,
-0.04251904, 0.151573, -1.217074, 0, 1, 0.8901961, 1,
-0.04000852, 0.6775328, -0.2517914, 0, 1, 0.8980392, 1,
-0.03901682, -1.074894, -3.749555, 0, 1, 0.9058824, 1,
-0.03238801, 1.033707, -0.1672902, 0, 1, 0.9098039, 1,
-0.02644354, 1.219471, -0.3659048, 0, 1, 0.9176471, 1,
-0.02602439, 0.7815057, 0.1820151, 0, 1, 0.9215686, 1,
-0.01947967, 1.201056, -0.03452925, 0, 1, 0.9294118, 1,
-0.01836734, 0.9244359, -1.961691, 0, 1, 0.9333333, 1,
-0.01812429, 0.5433282, -2.185483, 0, 1, 0.9411765, 1,
-0.01807642, -0.8636121, -4.019453, 0, 1, 0.945098, 1,
-0.0161651, 1.366206, -1.240359, 0, 1, 0.9529412, 1,
-0.01517033, 0.1066888, -0.3721403, 0, 1, 0.9568627, 1,
-0.01312834, 0.9747647, -0.3317181, 0, 1, 0.9647059, 1,
-0.01177396, -0.6021085, -2.57435, 0, 1, 0.9686275, 1,
-0.01141326, -1.068785, -2.618677, 0, 1, 0.9764706, 1,
-0.01097904, -0.7711068, -3.576999, 0, 1, 0.9803922, 1,
-0.008459846, -0.25438, -2.102518, 0, 1, 0.9882353, 1,
-0.004919468, 0.9496086, 0.05361232, 0, 1, 0.9921569, 1,
-0.004317635, -0.7602201, -4.278523, 0, 1, 1, 1,
-0.001290026, -1.610837, -3.830357, 0, 0.9921569, 1, 1,
-0.0007155319, -0.2893613, -5.055209, 0, 0.9882353, 1, 1,
0.004237926, 0.4256525, -0.1607606, 0, 0.9803922, 1, 1,
0.004848413, 0.001924838, 1.862736, 0, 0.9764706, 1, 1,
0.005291563, -0.7439505, 3.672072, 0, 0.9686275, 1, 1,
0.009731939, 2.129051, 1.037525, 0, 0.9647059, 1, 1,
0.01065897, 0.3319533, -0.9304857, 0, 0.9568627, 1, 1,
0.01124883, 0.3558941, 0.216964, 0, 0.9529412, 1, 1,
0.02258946, 0.5413013, -0.5402838, 0, 0.945098, 1, 1,
0.02652184, -0.6910226, 4.338956, 0, 0.9411765, 1, 1,
0.03476558, 0.1493392, 0.8628364, 0, 0.9333333, 1, 1,
0.0381659, 0.1594426, 0.1307458, 0, 0.9294118, 1, 1,
0.04548186, -0.319819, 3.520049, 0, 0.9215686, 1, 1,
0.0481411, -1.443779, 3.936261, 0, 0.9176471, 1, 1,
0.04984046, -1.371376, 1.162539, 0, 0.9098039, 1, 1,
0.05212849, 0.8290484, -0.6836542, 0, 0.9058824, 1, 1,
0.05562619, -1.648101, 3.126833, 0, 0.8980392, 1, 1,
0.05754906, -0.2343191, 3.928605, 0, 0.8901961, 1, 1,
0.06061534, -1.425206, 3.281927, 0, 0.8862745, 1, 1,
0.06118489, -0.298662, 3.269047, 0, 0.8784314, 1, 1,
0.06428365, 0.190174, 0.7767236, 0, 0.8745098, 1, 1,
0.06428427, -1.421697, 3.456048, 0, 0.8666667, 1, 1,
0.06590302, 0.3697215, -0.9915783, 0, 0.8627451, 1, 1,
0.0663488, 0.320082, -0.4129893, 0, 0.854902, 1, 1,
0.06711449, 1.251381, -0.4858057, 0, 0.8509804, 1, 1,
0.06896531, 0.8613064, 1.017594, 0, 0.8431373, 1, 1,
0.07050434, -0.590185, 3.013511, 0, 0.8392157, 1, 1,
0.07791959, -1.886473, 2.820356, 0, 0.8313726, 1, 1,
0.07794429, -0.334901, 2.693076, 0, 0.827451, 1, 1,
0.07937182, -0.612663, 1.523812, 0, 0.8196079, 1, 1,
0.07943092, 0.1296579, 0.5855173, 0, 0.8156863, 1, 1,
0.08034337, -0.6140054, 2.290252, 0, 0.8078431, 1, 1,
0.08173434, 0.4146687, -0.6977639, 0, 0.8039216, 1, 1,
0.08348542, -0.1105226, 0.9483794, 0, 0.7960784, 1, 1,
0.08391611, -1.068578, 1.631124, 0, 0.7882353, 1, 1,
0.08429851, 0.6795257, 1.464876, 0, 0.7843137, 1, 1,
0.08546534, 0.8705323, -0.8119645, 0, 0.7764706, 1, 1,
0.09018198, 0.08130539, 0.03908329, 0, 0.772549, 1, 1,
0.09135098, 0.4327969, 0.3419133, 0, 0.7647059, 1, 1,
0.09204328, 0.07764526, -0.03501695, 0, 0.7607843, 1, 1,
0.09408472, 1.056139, 0.1525657, 0, 0.7529412, 1, 1,
0.09736995, 0.4529583, -0.1177955, 0, 0.7490196, 1, 1,
0.1013339, -1.207559, 4.669641, 0, 0.7411765, 1, 1,
0.102917, 1.747687, 0.4296955, 0, 0.7372549, 1, 1,
0.1041588, -0.2598232, 3.047936, 0, 0.7294118, 1, 1,
0.1049164, -1.2499, 4.116395, 0, 0.7254902, 1, 1,
0.1054226, -3.727867, 4.874982, 0, 0.7176471, 1, 1,
0.1055406, 0.3086117, 0.101722, 0, 0.7137255, 1, 1,
0.1112698, 0.3694182, 0.6391083, 0, 0.7058824, 1, 1,
0.1135555, -1.20464, 3.05065, 0, 0.6980392, 1, 1,
0.114254, -0.5388326, 2.994898, 0, 0.6941177, 1, 1,
0.1150181, -0.7894313, 4.689109, 0, 0.6862745, 1, 1,
0.1218884, 0.1355828, 0.8414032, 0, 0.682353, 1, 1,
0.1251298, 1.705094, -0.01651599, 0, 0.6745098, 1, 1,
0.1260118, 0.9655667, -0.954907, 0, 0.6705883, 1, 1,
0.1281414, 0.3397968, 1.70032, 0, 0.6627451, 1, 1,
0.1300987, 1.715364, -1.237444, 0, 0.6588235, 1, 1,
0.1364185, -0.1559073, 1.440814, 0, 0.6509804, 1, 1,
0.1375147, 0.6656961, 1.515955, 0, 0.6470588, 1, 1,
0.1379588, -1.477459, 3.594099, 0, 0.6392157, 1, 1,
0.1412484, -1.272782, 4.597102, 0, 0.6352941, 1, 1,
0.1452603, -0.5612848, 1.757712, 0, 0.627451, 1, 1,
0.1461057, -0.5876555, 2.834668, 0, 0.6235294, 1, 1,
0.1487862, -0.8461772, 3.077344, 0, 0.6156863, 1, 1,
0.1499498, -0.6160701, 5.233774, 0, 0.6117647, 1, 1,
0.1507612, -1.889932, 2.618386, 0, 0.6039216, 1, 1,
0.1518266, 2.340585, -0.6886408, 0, 0.5960785, 1, 1,
0.1525168, 1.011413, 2.53976, 0, 0.5921569, 1, 1,
0.155121, 0.7463544, 2.609914, 0, 0.5843138, 1, 1,
0.1555036, 0.214064, 1.2743, 0, 0.5803922, 1, 1,
0.1570543, 0.8469927, -0.6670462, 0, 0.572549, 1, 1,
0.1629362, -1.392805, 1.204108, 0, 0.5686275, 1, 1,
0.1637561, -0.708692, 2.979378, 0, 0.5607843, 1, 1,
0.1641903, 1.103043, 0.7436017, 0, 0.5568628, 1, 1,
0.1685811, -0.452206, 2.079114, 0, 0.5490196, 1, 1,
0.1718376, 1.235335, 0.0006656422, 0, 0.5450981, 1, 1,
0.1727111, 0.2878659, -2.861655, 0, 0.5372549, 1, 1,
0.1727214, -0.4933832, 2.494314, 0, 0.5333334, 1, 1,
0.1769043, 0.4303222, 2.020231, 0, 0.5254902, 1, 1,
0.180749, 0.1986393, 0.6725467, 0, 0.5215687, 1, 1,
0.1815343, -0.372691, 2.575354, 0, 0.5137255, 1, 1,
0.1840015, 0.986074, 2.841929, 0, 0.509804, 1, 1,
0.1857471, 1.204383, 0.2593448, 0, 0.5019608, 1, 1,
0.1859952, 1.603496, -1.63958, 0, 0.4941176, 1, 1,
0.1875623, 0.6190797, 1.579557, 0, 0.4901961, 1, 1,
0.1903923, 1.483875, 0.7897879, 0, 0.4823529, 1, 1,
0.1905696, 1.465287, -0.5274125, 0, 0.4784314, 1, 1,
0.1932673, -0.49732, 2.230898, 0, 0.4705882, 1, 1,
0.19905, 0.779351, -1.484942, 0, 0.4666667, 1, 1,
0.1997536, -0.7430124, 3.537179, 0, 0.4588235, 1, 1,
0.2046574, -0.5851763, 1.632586, 0, 0.454902, 1, 1,
0.2096266, -2.097244, 3.209457, 0, 0.4470588, 1, 1,
0.2112342, 0.4810489, 1.431823, 0, 0.4431373, 1, 1,
0.2147845, -2.062958, 2.114611, 0, 0.4352941, 1, 1,
0.2162678, -1.53587, 3.525445, 0, 0.4313726, 1, 1,
0.2168872, -0.3338013, 1.739952, 0, 0.4235294, 1, 1,
0.218027, -0.3036334, 1.169568, 0, 0.4196078, 1, 1,
0.2195911, 1.295685, -0.2775768, 0, 0.4117647, 1, 1,
0.2198229, -1.099378, 2.144009, 0, 0.4078431, 1, 1,
0.2213991, -0.6813534, 2.730641, 0, 0.4, 1, 1,
0.2257551, 0.3364496, 0.6554472, 0, 0.3921569, 1, 1,
0.2279129, 0.1749367, 1.289023, 0, 0.3882353, 1, 1,
0.2281737, 0.1417291, 2.573849, 0, 0.3803922, 1, 1,
0.2290164, 0.9618194, 0.145537, 0, 0.3764706, 1, 1,
0.2292383, 0.0128015, 2.650049, 0, 0.3686275, 1, 1,
0.238634, -0.5741864, 1.771322, 0, 0.3647059, 1, 1,
0.2459183, 1.102824, 1.806652, 0, 0.3568628, 1, 1,
0.2488152, -1.041968, 2.282859, 0, 0.3529412, 1, 1,
0.2503268, 0.08415404, 0.8629937, 0, 0.345098, 1, 1,
0.2530122, -0.1591499, 4.717964, 0, 0.3411765, 1, 1,
0.2535467, -2.067881, 3.948323, 0, 0.3333333, 1, 1,
0.2561407, 0.6586297, 2.09005, 0, 0.3294118, 1, 1,
0.2565484, 1.132095, 0.2076336, 0, 0.3215686, 1, 1,
0.2570633, -0.02509209, 0.2692207, 0, 0.3176471, 1, 1,
0.2670914, 1.762222, 2.656165, 0, 0.3098039, 1, 1,
0.2707025, -0.08630788, 3.206565, 0, 0.3058824, 1, 1,
0.2716457, -0.6987345, 1.650339, 0, 0.2980392, 1, 1,
0.2770879, -0.1585236, 3.880025, 0, 0.2901961, 1, 1,
0.2845564, 1.426939, 0.6661293, 0, 0.2862745, 1, 1,
0.285168, -0.2522107, 3.124056, 0, 0.2784314, 1, 1,
0.2859172, 0.2454531, 0.03070905, 0, 0.2745098, 1, 1,
0.2961011, -1.643874, 4.286129, 0, 0.2666667, 1, 1,
0.3000943, -0.5677541, 2.537362, 0, 0.2627451, 1, 1,
0.3046883, 0.4990607, 1.564192, 0, 0.254902, 1, 1,
0.3072541, -0.5487894, 3.625963, 0, 0.2509804, 1, 1,
0.3122667, 0.4908872, 1.212057, 0, 0.2431373, 1, 1,
0.3123253, 0.4495904, 0.6651466, 0, 0.2392157, 1, 1,
0.3142221, 0.3779631, 1.977177, 0, 0.2313726, 1, 1,
0.3151854, -1.077778, 2.94201, 0, 0.227451, 1, 1,
0.3159299, -1.21204, 2.371307, 0, 0.2196078, 1, 1,
0.3167494, -0.2921934, 2.020601, 0, 0.2156863, 1, 1,
0.3169993, 1.273955, -1.132102, 0, 0.2078431, 1, 1,
0.3198825, -0.8641155, 3.565093, 0, 0.2039216, 1, 1,
0.3201678, 0.06826089, 1.649197, 0, 0.1960784, 1, 1,
0.3224478, 0.3376021, 3.582699, 0, 0.1882353, 1, 1,
0.3240898, -1.045964, 1.026578, 0, 0.1843137, 1, 1,
0.3273705, 0.2654748, 1.177554, 0, 0.1764706, 1, 1,
0.3343141, -0.8803925, 1.084498, 0, 0.172549, 1, 1,
0.3355867, 1.04423, 0.7475469, 0, 0.1647059, 1, 1,
0.3367344, -0.115078, 1.911515, 0, 0.1607843, 1, 1,
0.3368078, -1.070979, 5.253168, 0, 0.1529412, 1, 1,
0.3413299, 0.2176628, 1.408292, 0, 0.1490196, 1, 1,
0.3415038, -0.04487811, -0.08961986, 0, 0.1411765, 1, 1,
0.3453268, 0.248484, 0.5247082, 0, 0.1372549, 1, 1,
0.3455099, 0.3697309, 1.550434, 0, 0.1294118, 1, 1,
0.3496073, 1.601682, -0.6828647, 0, 0.1254902, 1, 1,
0.3530034, 0.7708032, 2.525714, 0, 0.1176471, 1, 1,
0.3547706, 0.6343045, 0.04756872, 0, 0.1137255, 1, 1,
0.3567702, 0.5263705, -1.513633, 0, 0.1058824, 1, 1,
0.3590578, 1.429697, 1.452615, 0, 0.09803922, 1, 1,
0.361848, 0.01751037, 1.517195, 0, 0.09411765, 1, 1,
0.3642791, 0.09954032, 1.702706, 0, 0.08627451, 1, 1,
0.3689432, 0.3470162, 1.632622, 0, 0.08235294, 1, 1,
0.3714787, 0.8662189, 0.5291571, 0, 0.07450981, 1, 1,
0.3723641, 0.0434138, 1.049258, 0, 0.07058824, 1, 1,
0.3728994, -0.5367565, 1.875751, 0, 0.0627451, 1, 1,
0.3775418, 1.885096, -1.259796, 0, 0.05882353, 1, 1,
0.3787995, -0.7703369, 3.500678, 0, 0.05098039, 1, 1,
0.3795929, 0.8448836, -0.02936482, 0, 0.04705882, 1, 1,
0.3810694, -0.3380631, 5.076344, 0, 0.03921569, 1, 1,
0.3812651, 1.207198, 0.421162, 0, 0.03529412, 1, 1,
0.3816808, -0.8146695, 2.814301, 0, 0.02745098, 1, 1,
0.394627, -1.471368, 4.357106, 0, 0.02352941, 1, 1,
0.3999211, 1.073047, 0.3639408, 0, 0.01568628, 1, 1,
0.4012648, 1.567023, 1.495461, 0, 0.01176471, 1, 1,
0.4043905, 0.6834863, -0.004054583, 0, 0.003921569, 1, 1,
0.4060096, 0.02110432, 1.668647, 0.003921569, 0, 1, 1,
0.4090699, -0.1670536, 1.700452, 0.007843138, 0, 1, 1,
0.4097751, -0.2348752, 0.8183061, 0.01568628, 0, 1, 1,
0.4222696, -2.069413, 5.830672, 0.01960784, 0, 1, 1,
0.4274903, -1.098985, 2.083773, 0.02745098, 0, 1, 1,
0.4302943, 0.5864757, 0.8083315, 0.03137255, 0, 1, 1,
0.4323066, 1.202884, 1.717849, 0.03921569, 0, 1, 1,
0.4354684, -1.451935, 3.306155, 0.04313726, 0, 1, 1,
0.4368112, 0.4160593, 0.1995498, 0.05098039, 0, 1, 1,
0.4383696, 1.866966, -0.7951678, 0.05490196, 0, 1, 1,
0.4415889, -0.7455941, 3.017992, 0.0627451, 0, 1, 1,
0.441998, -0.9038633, 2.573759, 0.06666667, 0, 1, 1,
0.442688, 0.9401139, 1.866554, 0.07450981, 0, 1, 1,
0.458484, 0.7801189, 0.6415215, 0.07843138, 0, 1, 1,
0.4597103, -0.577917, 3.792177, 0.08627451, 0, 1, 1,
0.4642209, 0.03633314, 2.076079, 0.09019608, 0, 1, 1,
0.4654714, -1.114304, 3.104349, 0.09803922, 0, 1, 1,
0.4682374, 1.11537, 0.5126802, 0.1058824, 0, 1, 1,
0.4701388, -0.1546966, 2.143233, 0.1098039, 0, 1, 1,
0.4728879, 1.646609, 1.265779, 0.1176471, 0, 1, 1,
0.4745681, 1.056718, 1.742376, 0.1215686, 0, 1, 1,
0.4776838, 0.4456694, 1.028733, 0.1294118, 0, 1, 1,
0.4801368, -0.7298672, 2.038544, 0.1333333, 0, 1, 1,
0.482704, 0.01072073, 0.5478071, 0.1411765, 0, 1, 1,
0.4838428, -0.6406648, 3.368756, 0.145098, 0, 1, 1,
0.4862306, 0.8660383, 1.908217, 0.1529412, 0, 1, 1,
0.4902203, -1.592911, 3.432971, 0.1568628, 0, 1, 1,
0.4905574, -0.3489436, 1.550982, 0.1647059, 0, 1, 1,
0.4910861, 1.392574, -1.07292, 0.1686275, 0, 1, 1,
0.4921896, -1.598784, 4.487198, 0.1764706, 0, 1, 1,
0.4929319, 0.1208076, 1.212132, 0.1803922, 0, 1, 1,
0.4940138, -0.1533162, 1.847183, 0.1882353, 0, 1, 1,
0.5030234, -0.283754, 2.748172, 0.1921569, 0, 1, 1,
0.5035227, -1.431214, 3.080034, 0.2, 0, 1, 1,
0.5068569, -0.2396264, 1.71836, 0.2078431, 0, 1, 1,
0.5109565, 0.2334204, 1.575136, 0.2117647, 0, 1, 1,
0.5287567, -1.039427, 2.569494, 0.2196078, 0, 1, 1,
0.5312307, -0.07909377, 3.280664, 0.2235294, 0, 1, 1,
0.5337026, -0.873524, 2.431723, 0.2313726, 0, 1, 1,
0.5339105, 1.913821, 0.6807367, 0.2352941, 0, 1, 1,
0.534053, 1.735985, 0.4928263, 0.2431373, 0, 1, 1,
0.5369284, 0.1526621, 1.472548, 0.2470588, 0, 1, 1,
0.5403983, -0.1425661, 1.681472, 0.254902, 0, 1, 1,
0.5417547, -0.7165014, 2.837793, 0.2588235, 0, 1, 1,
0.5419181, -0.3546398, 2.985222, 0.2666667, 0, 1, 1,
0.5447919, -0.6858867, 1.882155, 0.2705882, 0, 1, 1,
0.5461994, 0.9979434, 1.537437, 0.2784314, 0, 1, 1,
0.5465497, -0.9985784, 2.243069, 0.282353, 0, 1, 1,
0.5550768, 0.7033771, 1.050505, 0.2901961, 0, 1, 1,
0.5566691, 0.1019462, 0.9084805, 0.2941177, 0, 1, 1,
0.5590723, -0.7587191, 0.9231585, 0.3019608, 0, 1, 1,
0.5598448, 0.3482384, 0.6407119, 0.3098039, 0, 1, 1,
0.562112, -1.799521, 1.21173, 0.3137255, 0, 1, 1,
0.5654353, -0.5292992, 1.610503, 0.3215686, 0, 1, 1,
0.5660992, -1.168073, 1.720554, 0.3254902, 0, 1, 1,
0.5670529, 0.3733155, 0.8415437, 0.3333333, 0, 1, 1,
0.5704707, -1.373772, 2.72852, 0.3372549, 0, 1, 1,
0.5728561, -0.8063229, 1.78053, 0.345098, 0, 1, 1,
0.5746781, 0.001950995, 3.850673, 0.3490196, 0, 1, 1,
0.5753707, -0.1336947, 1.074358, 0.3568628, 0, 1, 1,
0.5789413, -0.4359924, 2.512382, 0.3607843, 0, 1, 1,
0.5816491, -0.0839856, 2.915225, 0.3686275, 0, 1, 1,
0.5868324, -2.398569, 3.428326, 0.372549, 0, 1, 1,
0.5887785, 0.2303264, 2.116517, 0.3803922, 0, 1, 1,
0.5914353, -2.430032, 2.78106, 0.3843137, 0, 1, 1,
0.5963041, 0.6342061, 0.7626103, 0.3921569, 0, 1, 1,
0.599244, 0.01378807, -0.05302793, 0.3960784, 0, 1, 1,
0.6016734, 1.08964, 0.6345437, 0.4039216, 0, 1, 1,
0.606707, -1.045713, 1.562049, 0.4117647, 0, 1, 1,
0.6090941, -0.462077, 2.292519, 0.4156863, 0, 1, 1,
0.6155498, -1.760348, 2.175621, 0.4235294, 0, 1, 1,
0.62019, 0.6311388, 0.7728318, 0.427451, 0, 1, 1,
0.6240633, 1.276054, -0.6701742, 0.4352941, 0, 1, 1,
0.6267225, 0.9458514, -0.8048052, 0.4392157, 0, 1, 1,
0.6332229, -0.5415813, 2.316275, 0.4470588, 0, 1, 1,
0.6360477, -1.309126, 1.47178, 0.4509804, 0, 1, 1,
0.6423419, -1.764994, 2.350379, 0.4588235, 0, 1, 1,
0.6462309, 0.9040367, 0.1309635, 0.4627451, 0, 1, 1,
0.6534312, 0.7186533, -0.1199911, 0.4705882, 0, 1, 1,
0.6542552, 0.6453059, 0.08479437, 0.4745098, 0, 1, 1,
0.6590774, -0.2201596, 1.915256, 0.4823529, 0, 1, 1,
0.6614073, 0.241511, 1.313088, 0.4862745, 0, 1, 1,
0.6671107, -0.5405934, 0.6518782, 0.4941176, 0, 1, 1,
0.6678594, 0.9372923, -0.6430666, 0.5019608, 0, 1, 1,
0.6725638, 1.908206, 0.07209672, 0.5058824, 0, 1, 1,
0.6734487, -0.03696676, 1.015801, 0.5137255, 0, 1, 1,
0.6809231, 1.238985, 1.266828, 0.5176471, 0, 1, 1,
0.6867654, 0.1574288, 2.679579, 0.5254902, 0, 1, 1,
0.6902283, -0.1125824, 0.8535023, 0.5294118, 0, 1, 1,
0.6934716, 0.2473447, 1.224668, 0.5372549, 0, 1, 1,
0.7000734, 0.1651604, 0.651333, 0.5411765, 0, 1, 1,
0.7004609, -0.3743783, 0.6819186, 0.5490196, 0, 1, 1,
0.7036958, 1.305621, -0.2027246, 0.5529412, 0, 1, 1,
0.7068174, -0.2755436, 1.891388, 0.5607843, 0, 1, 1,
0.7130896, 0.1501633, -0.2145815, 0.5647059, 0, 1, 1,
0.7135447, -0.5825155, 1.037118, 0.572549, 0, 1, 1,
0.7144974, -1.04378, 0.09577852, 0.5764706, 0, 1, 1,
0.715521, 0.06389631, 1.36797, 0.5843138, 0, 1, 1,
0.7204466, 1.02211, 2.252294, 0.5882353, 0, 1, 1,
0.7222709, -0.4619493, 2.356717, 0.5960785, 0, 1, 1,
0.7248198, -0.0763066, 2.013695, 0.6039216, 0, 1, 1,
0.7326323, -1.636816, 4.068394, 0.6078432, 0, 1, 1,
0.7359435, 0.5718234, -0.05042371, 0.6156863, 0, 1, 1,
0.7386498, 1.669733, 2.839421, 0.6196079, 0, 1, 1,
0.7418231, -0.6497831, 3.337903, 0.627451, 0, 1, 1,
0.7428156, 0.7211122, 0.5010734, 0.6313726, 0, 1, 1,
0.7480717, -1.780918, 3.049162, 0.6392157, 0, 1, 1,
0.7483506, 1.010081, 1.077906, 0.6431373, 0, 1, 1,
0.7527125, -1.223006, 1.296683, 0.6509804, 0, 1, 1,
0.760739, 0.6767063, 1.615705, 0.654902, 0, 1, 1,
0.7630036, -2.398105, 1.442302, 0.6627451, 0, 1, 1,
0.7684329, 0.7559935, 0.2866862, 0.6666667, 0, 1, 1,
0.7805259, -0.3878477, 2.997633, 0.6745098, 0, 1, 1,
0.8024402, 1.113841, 0.03366928, 0.6784314, 0, 1, 1,
0.8046748, -0.88623, 1.2295, 0.6862745, 0, 1, 1,
0.8051752, -0.8471263, 2.344403, 0.6901961, 0, 1, 1,
0.8070986, -0.155225, 0.7301901, 0.6980392, 0, 1, 1,
0.8106965, -3.094339, 4.265375, 0.7058824, 0, 1, 1,
0.8149337, 0.7121542, 0.8753022, 0.7098039, 0, 1, 1,
0.8151429, 0.291616, 1.94901, 0.7176471, 0, 1, 1,
0.8167528, 0.8683608, 0.07536285, 0.7215686, 0, 1, 1,
0.8197556, -1.481917, 4.277519, 0.7294118, 0, 1, 1,
0.8204029, -1.343777, 2.018976, 0.7333333, 0, 1, 1,
0.8212862, -1.610135, 2.505814, 0.7411765, 0, 1, 1,
0.823037, 0.01523718, 1.115116, 0.7450981, 0, 1, 1,
0.8273514, -0.7483996, 3.107223, 0.7529412, 0, 1, 1,
0.8291604, 0.1708939, 3.723927, 0.7568628, 0, 1, 1,
0.829779, 0.8574421, 1.135188, 0.7647059, 0, 1, 1,
0.8325288, 0.9233684, 0.5330374, 0.7686275, 0, 1, 1,
0.8371113, -1.012763, 1.222061, 0.7764706, 0, 1, 1,
0.838035, 0.9127432, -0.559392, 0.7803922, 0, 1, 1,
0.839686, 1.033402, 2.105215, 0.7882353, 0, 1, 1,
0.8440214, 0.5979352, -0.1903251, 0.7921569, 0, 1, 1,
0.8504332, -0.140236, 3.060387, 0.8, 0, 1, 1,
0.8507812, -0.07656272, 3.049403, 0.8078431, 0, 1, 1,
0.8529745, -0.7000384, 1.09355, 0.8117647, 0, 1, 1,
0.8546262, 2.6823, 0.9732216, 0.8196079, 0, 1, 1,
0.8573242, -1.264745, 2.988091, 0.8235294, 0, 1, 1,
0.8628044, -0.1998569, 2.639102, 0.8313726, 0, 1, 1,
0.864352, -1.79625, 3.983347, 0.8352941, 0, 1, 1,
0.8671119, -1.074615, 3.056447, 0.8431373, 0, 1, 1,
0.868248, -0.2588617, 1.375152, 0.8470588, 0, 1, 1,
0.8702816, 0.1564315, 1.334148, 0.854902, 0, 1, 1,
0.8803007, -0.1637237, 2.769387, 0.8588235, 0, 1, 1,
0.8803906, -1.495304, 4.079037, 0.8666667, 0, 1, 1,
0.8822988, -1.187738, 4.038111, 0.8705882, 0, 1, 1,
0.8826823, 0.4648781, 0.9138225, 0.8784314, 0, 1, 1,
0.8922932, 0.7859157, 0.4597882, 0.8823529, 0, 1, 1,
0.894573, -0.3695971, 1.877898, 0.8901961, 0, 1, 1,
0.8981755, 0.1113947, 1.232105, 0.8941177, 0, 1, 1,
0.8995976, -0.6086606, 0.9047032, 0.9019608, 0, 1, 1,
0.9033987, -0.4073338, 1.653512, 0.9098039, 0, 1, 1,
0.9100769, 0.4664092, 0.8946591, 0.9137255, 0, 1, 1,
0.9112858, 0.3658345, 2.388036, 0.9215686, 0, 1, 1,
0.9178725, 0.3271212, 0.07253461, 0.9254902, 0, 1, 1,
0.9215941, -0.05295209, 1.30707, 0.9333333, 0, 1, 1,
0.9217746, 2.247933, 2.950196, 0.9372549, 0, 1, 1,
0.9399093, -1.845502, 1.34822, 0.945098, 0, 1, 1,
0.9415482, 0.6941966, 0.4326907, 0.9490196, 0, 1, 1,
0.944654, 2.862169, 0.9357025, 0.9568627, 0, 1, 1,
0.9449289, -0.06529083, 2.100364, 0.9607843, 0, 1, 1,
0.9495237, -1.099896, 3.292327, 0.9686275, 0, 1, 1,
0.9562004, 0.1486484, 0.4101473, 0.972549, 0, 1, 1,
0.9576386, 2.078908, -0.5539004, 0.9803922, 0, 1, 1,
0.9661803, -0.4789911, 2.497395, 0.9843137, 0, 1, 1,
0.9683035, -2.410667, 2.307788, 0.9921569, 0, 1, 1,
0.9720986, 0.09384929, 2.537543, 0.9960784, 0, 1, 1,
0.9803132, 0.4413532, 1.330011, 1, 0, 0.9960784, 1,
0.9822216, -0.1977736, 0.3637314, 1, 0, 0.9882353, 1,
0.9855781, 0.8277341, -0.9021112, 1, 0, 0.9843137, 1,
0.9857973, -0.648116, 3.265066, 1, 0, 0.9764706, 1,
0.9899583, 0.7361296, 1.124701, 1, 0, 0.972549, 1,
0.9937621, 0.9769755, -0.1165363, 1, 0, 0.9647059, 1,
0.9965941, -0.5218179, 1.617466, 1, 0, 0.9607843, 1,
0.9979025, -0.81681, 2.413419, 1, 0, 0.9529412, 1,
0.997914, -0.366931, 1.784213, 1, 0, 0.9490196, 1,
1.003972, -1.067589, 3.250645, 1, 0, 0.9411765, 1,
1.007037, 0.8270219, 0.8870116, 1, 0, 0.9372549, 1,
1.008917, -0.5208372, 0.7116119, 1, 0, 0.9294118, 1,
1.011092, -1.100514, 1.962968, 1, 0, 0.9254902, 1,
1.013445, 0.3587127, 2.115375, 1, 0, 0.9176471, 1,
1.021741, -0.3505408, 1.908808, 1, 0, 0.9137255, 1,
1.024464, -1.179399, 2.801117, 1, 0, 0.9058824, 1,
1.027762, -0.2457177, 1.538655, 1, 0, 0.9019608, 1,
1.031637, 1.09093, 2.665814, 1, 0, 0.8941177, 1,
1.038286, 0.7545382, 0.521764, 1, 0, 0.8862745, 1,
1.05264, 1.89274, 0.4471442, 1, 0, 0.8823529, 1,
1.057427, 0.7500136, 0.319262, 1, 0, 0.8745098, 1,
1.06227, -0.4752511, 1.379843, 1, 0, 0.8705882, 1,
1.067963, -0.7057744, 0.7611031, 1, 0, 0.8627451, 1,
1.073047, 0.7629245, 1.871003, 1, 0, 0.8588235, 1,
1.074172, -1.003882, 3.13455, 1, 0, 0.8509804, 1,
1.07523, -0.8759505, 2.29151, 1, 0, 0.8470588, 1,
1.087158, 0.6926887, 1.324378, 1, 0, 0.8392157, 1,
1.08885, 0.4469472, 0.2213715, 1, 0, 0.8352941, 1,
1.092693, 0.7449347, 0.4390208, 1, 0, 0.827451, 1,
1.100142, -1.025817, 2.949589, 1, 0, 0.8235294, 1,
1.106516, -0.0412984, 1.564631, 1, 0, 0.8156863, 1,
1.110137, 1.417624, 1.572418, 1, 0, 0.8117647, 1,
1.127253, -0.8068637, 0.5788251, 1, 0, 0.8039216, 1,
1.141212, -0.5510597, 3.49353, 1, 0, 0.7960784, 1,
1.143035, -0.6428226, 1.536595, 1, 0, 0.7921569, 1,
1.143891, 1.579501, 1.129092, 1, 0, 0.7843137, 1,
1.149973, 0.6166026, 1.596189, 1, 0, 0.7803922, 1,
1.151536, 1.04264, 0.6762647, 1, 0, 0.772549, 1,
1.170102, 0.1985707, 0.4433669, 1, 0, 0.7686275, 1,
1.172555, -0.1659588, 1.185094, 1, 0, 0.7607843, 1,
1.179491, -0.5916237, -0.3188373, 1, 0, 0.7568628, 1,
1.179524, 1.24763, 0.7034661, 1, 0, 0.7490196, 1,
1.182566, 0.8153424, -0.0344127, 1, 0, 0.7450981, 1,
1.185626, -0.9392192, 1.648042, 1, 0, 0.7372549, 1,
1.188895, -0.6541173, 1.753528, 1, 0, 0.7333333, 1,
1.202222, -0.04920386, 0.3221295, 1, 0, 0.7254902, 1,
1.20356, -0.1891803, 1.268476, 1, 0, 0.7215686, 1,
1.210978, -1.79629, 2.85375, 1, 0, 0.7137255, 1,
1.216855, 0.6915367, 1.423261, 1, 0, 0.7098039, 1,
1.228832, -1.536864, 3.017498, 1, 0, 0.7019608, 1,
1.230895, 2.052932, -1.526288, 1, 0, 0.6941177, 1,
1.245658, 0.589193, 1.653235, 1, 0, 0.6901961, 1,
1.248846, -0.9252777, 2.986493, 1, 0, 0.682353, 1,
1.254791, -1.023674, 2.780874, 1, 0, 0.6784314, 1,
1.25726, 2.888532, 0.3026447, 1, 0, 0.6705883, 1,
1.257595, 0.3494778, 1.063427, 1, 0, 0.6666667, 1,
1.272109, -1.249177, 1.718424, 1, 0, 0.6588235, 1,
1.272567, -1.452921, 2.655508, 1, 0, 0.654902, 1,
1.280796, 1.729181, 2.62523, 1, 0, 0.6470588, 1,
1.287143, 0.226273, 3.405368, 1, 0, 0.6431373, 1,
1.297538, 1.022471, 1.312974, 1, 0, 0.6352941, 1,
1.310207, 0.3602517, 2.440333, 1, 0, 0.6313726, 1,
1.325473, 0.46071, 2.173431, 1, 0, 0.6235294, 1,
1.332251, -0.395906, 2.680727, 1, 0, 0.6196079, 1,
1.333722, -1.207098, 2.253009, 1, 0, 0.6117647, 1,
1.336791, 0.16185, 1.199418, 1, 0, 0.6078432, 1,
1.343259, 0.3869398, 1.325369, 1, 0, 0.6, 1,
1.344667, 0.04760785, 1.698591, 1, 0, 0.5921569, 1,
1.354991, -0.9079027, 1.472403, 1, 0, 0.5882353, 1,
1.370063, 0.6588264, 1.346872, 1, 0, 0.5803922, 1,
1.382143, 1.032842, 2.352148, 1, 0, 0.5764706, 1,
1.389869, -0.6539987, 0.856366, 1, 0, 0.5686275, 1,
1.39541, 0.0190681, 0.05911771, 1, 0, 0.5647059, 1,
1.402143, 0.6925357, 1.329919, 1, 0, 0.5568628, 1,
1.408698, 0.9966217, 1.613418, 1, 0, 0.5529412, 1,
1.444351, 1.362935, 1.85185, 1, 0, 0.5450981, 1,
1.454451, -0.6207398, 1.441199, 1, 0, 0.5411765, 1,
1.454514, 0.2342155, 1.354456, 1, 0, 0.5333334, 1,
1.45833, -0.9675082, 2.886904, 1, 0, 0.5294118, 1,
1.465415, -0.3834839, 1.440661, 1, 0, 0.5215687, 1,
1.491926, 0.5315437, 1.559906, 1, 0, 0.5176471, 1,
1.50402, 0.6805087, -0.440872, 1, 0, 0.509804, 1,
1.510953, 0.325474, 1.234751, 1, 0, 0.5058824, 1,
1.527111, -0.8363987, 1.175701, 1, 0, 0.4980392, 1,
1.543669, 1.219507, 0.8916306, 1, 0, 0.4901961, 1,
1.544324, -0.02876559, 1.147114, 1, 0, 0.4862745, 1,
1.554287, -0.1798613, -0.4362757, 1, 0, 0.4784314, 1,
1.556022, -2.252859, 1.479298, 1, 0, 0.4745098, 1,
1.569803, 0.4326082, -0.2855675, 1, 0, 0.4666667, 1,
1.580771, 1.128285, 2.66969, 1, 0, 0.4627451, 1,
1.602545, 0.7873909, 2.710156, 1, 0, 0.454902, 1,
1.602731, 0.03394886, -0.4998794, 1, 0, 0.4509804, 1,
1.613426, 1.419875, 1.108092, 1, 0, 0.4431373, 1,
1.623302, -0.4535081, 1.362044, 1, 0, 0.4392157, 1,
1.631201, 2.03713, 1.133609, 1, 0, 0.4313726, 1,
1.636341, 0.006238543, 0.9520744, 1, 0, 0.427451, 1,
1.664081, -0.9193208, 2.372984, 1, 0, 0.4196078, 1,
1.664482, -0.900165, 2.243597, 1, 0, 0.4156863, 1,
1.666198, -1.50934, 2.688534, 1, 0, 0.4078431, 1,
1.669763, -0.02991774, 1.9855, 1, 0, 0.4039216, 1,
1.671266, -0.5926552, 2.650138, 1, 0, 0.3960784, 1,
1.672855, 0.1624878, 2.884536, 1, 0, 0.3882353, 1,
1.680578, -0.7043855, 2.10646, 1, 0, 0.3843137, 1,
1.682709, -0.542204, 1.792514, 1, 0, 0.3764706, 1,
1.684837, 1.610465, 1.383773, 1, 0, 0.372549, 1,
1.711368, 0.2081098, 1.395195, 1, 0, 0.3647059, 1,
1.722698, 1.069683, 0.9864233, 1, 0, 0.3607843, 1,
1.736053, -1.530653, 4.289745, 1, 0, 0.3529412, 1,
1.746538, 0.5739528, 2.58448, 1, 0, 0.3490196, 1,
1.753421, 0.9017923, 0.04696584, 1, 0, 0.3411765, 1,
1.758937, -1.430023, 3.703354, 1, 0, 0.3372549, 1,
1.75972, -0.3812156, 2.708626, 1, 0, 0.3294118, 1,
1.762973, 1.257841, 2.395277, 1, 0, 0.3254902, 1,
1.767252, 0.8263139, 0.2957357, 1, 0, 0.3176471, 1,
1.779558, -0.04387093, 3.307122, 1, 0, 0.3137255, 1,
1.790881, 1.215906, 2.163769, 1, 0, 0.3058824, 1,
1.794218, -0.6392863, 1.643529, 1, 0, 0.2980392, 1,
1.796122, -0.1909157, 2.41894, 1, 0, 0.2941177, 1,
1.798261, -1.510531, 1.856311, 1, 0, 0.2862745, 1,
1.836138, -1.592858, 2.59732, 1, 0, 0.282353, 1,
1.87229, 0.1130584, 1.908642, 1, 0, 0.2745098, 1,
1.873698, -0.8008482, 2.831296, 1, 0, 0.2705882, 1,
1.875443, 1.730059, 0.255759, 1, 0, 0.2627451, 1,
1.877926, 0.5569372, 1.707042, 1, 0, 0.2588235, 1,
1.898941, 1.96236, -0.1442891, 1, 0, 0.2509804, 1,
1.922912, 2.099762, 1.058227, 1, 0, 0.2470588, 1,
1.926763, 0.3830605, 2.114806, 1, 0, 0.2392157, 1,
1.936862, -1.513414, 0.7442234, 1, 0, 0.2352941, 1,
1.96139, 0.004853209, 3.337672, 1, 0, 0.227451, 1,
1.968483, 0.3356526, 2.645172, 1, 0, 0.2235294, 1,
1.972476, 1.650053, 0.1346832, 1, 0, 0.2156863, 1,
2.00036, -0.2358203, 3.643561, 1, 0, 0.2117647, 1,
2.003542, -0.0622303, 3.341534, 1, 0, 0.2039216, 1,
2.034734, 0.4285901, 3.447396, 1, 0, 0.1960784, 1,
2.038863, -0.1495774, 2.270144, 1, 0, 0.1921569, 1,
2.054983, 1.619935, 1.954076, 1, 0, 0.1843137, 1,
2.081846, -0.9665472, 1.120753, 1, 0, 0.1803922, 1,
2.113777, 1.058555, 1.36945, 1, 0, 0.172549, 1,
2.133384, -0.5574768, -0.04942884, 1, 0, 0.1686275, 1,
2.147679, 1.711676, -0.08712532, 1, 0, 0.1607843, 1,
2.159682, -0.8468071, 3.152481, 1, 0, 0.1568628, 1,
2.185193, -1.727454, 3.050259, 1, 0, 0.1490196, 1,
2.190333, 1.39175, 1.606048, 1, 0, 0.145098, 1,
2.214068, -0.7601293, 3.420608, 1, 0, 0.1372549, 1,
2.21713, 0.5824612, 2.010439, 1, 0, 0.1333333, 1,
2.230046, -1.396702, 2.368634, 1, 0, 0.1254902, 1,
2.259511, -0.702389, 1.13162, 1, 0, 0.1215686, 1,
2.263059, -0.3469026, 1.893193, 1, 0, 0.1137255, 1,
2.264746, 0.2147739, 2.267541, 1, 0, 0.1098039, 1,
2.273728, -0.7128552, 0.8087093, 1, 0, 0.1019608, 1,
2.278472, -0.7120835, 1.952572, 1, 0, 0.09411765, 1,
2.279487, -0.6746603, 2.078253, 1, 0, 0.09019608, 1,
2.297241, -0.8538508, 2.040777, 1, 0, 0.08235294, 1,
2.329799, 2.43045, 1.569818, 1, 0, 0.07843138, 1,
2.349559, 0.03089473, 0.9308477, 1, 0, 0.07058824, 1,
2.394378, -0.1333525, 2.941636, 1, 0, 0.06666667, 1,
2.47898, -0.1357535, 3.488147, 1, 0, 0.05882353, 1,
2.52382, 1.426499, 3.342934, 1, 0, 0.05490196, 1,
2.621356, -2.474275, 2.827639, 1, 0, 0.04705882, 1,
2.699326, -0.3629962, 2.484241, 1, 0, 0.04313726, 1,
2.725934, 0.8837784, 2.726693, 1, 0, 0.03529412, 1,
2.965278, 0.5198331, 2.448518, 1, 0, 0.03137255, 1,
3.134855, 0.2473981, -0.4040702, 1, 0, 0.02352941, 1,
3.188695, 0.448326, 3.101015, 1, 0, 0.01960784, 1,
3.200471, -0.2009009, 1.422473, 1, 0, 0.01176471, 1,
3.683528, 0.9168706, 0.7608225, 1, 0, 0.007843138, 1
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
0.04316747, -4.893637, -6.900365, 0, -0.5, 0.5, 0.5,
0.04316747, -4.893637, -6.900365, 1, -0.5, 0.5, 0.5,
0.04316747, -4.893637, -6.900365, 1, 1.5, 0.5, 0.5,
0.04316747, -4.893637, -6.900365, 0, 1.5, 0.5, 0.5
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
-4.831275, -0.2890161, -6.900365, 0, -0.5, 0.5, 0.5,
-4.831275, -0.2890161, -6.900365, 1, -0.5, 0.5, 0.5,
-4.831275, -0.2890161, -6.900365, 1, 1.5, 0.5, 0.5,
-4.831275, -0.2890161, -6.900365, 0, 1.5, 0.5, 0.5
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
-4.831275, -4.893637, 0.3877318, 0, -0.5, 0.5, 0.5,
-4.831275, -4.893637, 0.3877318, 1, -0.5, 0.5, 0.5,
-4.831275, -4.893637, 0.3877318, 1, 1.5, 0.5, 0.5,
-4.831275, -4.893637, 0.3877318, 0, 1.5, 0.5, 0.5
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
-2, -3.831032, -5.218497,
2, -3.831032, -5.218497,
-2, -3.831032, -5.218497,
-2, -4.008133, -5.498808,
0, -3.831032, -5.218497,
0, -4.008133, -5.498808,
2, -3.831032, -5.218497,
2, -4.008133, -5.498808
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
-2, -4.362335, -6.059431, 0, -0.5, 0.5, 0.5,
-2, -4.362335, -6.059431, 1, -0.5, 0.5, 0.5,
-2, -4.362335, -6.059431, 1, 1.5, 0.5, 0.5,
-2, -4.362335, -6.059431, 0, 1.5, 0.5, 0.5,
0, -4.362335, -6.059431, 0, -0.5, 0.5, 0.5,
0, -4.362335, -6.059431, 1, -0.5, 0.5, 0.5,
0, -4.362335, -6.059431, 1, 1.5, 0.5, 0.5,
0, -4.362335, -6.059431, 0, 1.5, 0.5, 0.5,
2, -4.362335, -6.059431, 0, -0.5, 0.5, 0.5,
2, -4.362335, -6.059431, 1, -0.5, 0.5, 0.5,
2, -4.362335, -6.059431, 1, 1.5, 0.5, 0.5,
2, -4.362335, -6.059431, 0, 1.5, 0.5, 0.5
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
-3.706404, -3, -5.218497,
-3.706404, 3, -5.218497,
-3.706404, -3, -5.218497,
-3.893882, -3, -5.498808,
-3.706404, -2, -5.218497,
-3.893882, -2, -5.498808,
-3.706404, -1, -5.218497,
-3.893882, -1, -5.498808,
-3.706404, 0, -5.218497,
-3.893882, 0, -5.498808,
-3.706404, 1, -5.218497,
-3.893882, 1, -5.498808,
-3.706404, 2, -5.218497,
-3.893882, 2, -5.498808,
-3.706404, 3, -5.218497,
-3.893882, 3, -5.498808
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
-4.268839, -3, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, -3, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, -3, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, -3, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, -2, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, -2, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, -2, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, -2, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, -1, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, -1, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, -1, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, -1, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, 0, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, 0, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, 0, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, 0, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, 1, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, 1, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, 1, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, 1, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, 2, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, 2, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, 2, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, 2, -6.059431, 0, 1.5, 0.5, 0.5,
-4.268839, 3, -6.059431, 0, -0.5, 0.5, 0.5,
-4.268839, 3, -6.059431, 1, -0.5, 0.5, 0.5,
-4.268839, 3, -6.059431, 1, 1.5, 0.5, 0.5,
-4.268839, 3, -6.059431, 0, 1.5, 0.5, 0.5
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
-3.706404, -3.831032, -4,
-3.706404, -3.831032, 4,
-3.706404, -3.831032, -4,
-3.893882, -4.008133, -4,
-3.706404, -3.831032, -2,
-3.893882, -4.008133, -2,
-3.706404, -3.831032, 0,
-3.893882, -4.008133, 0,
-3.706404, -3.831032, 2,
-3.893882, -4.008133, 2,
-3.706404, -3.831032, 4,
-3.893882, -4.008133, 4
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
-4.268839, -4.362335, -4, 0, -0.5, 0.5, 0.5,
-4.268839, -4.362335, -4, 1, -0.5, 0.5, 0.5,
-4.268839, -4.362335, -4, 1, 1.5, 0.5, 0.5,
-4.268839, -4.362335, -4, 0, 1.5, 0.5, 0.5,
-4.268839, -4.362335, -2, 0, -0.5, 0.5, 0.5,
-4.268839, -4.362335, -2, 1, -0.5, 0.5, 0.5,
-4.268839, -4.362335, -2, 1, 1.5, 0.5, 0.5,
-4.268839, -4.362335, -2, 0, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 0, 0, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 0, 1, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 0, 1, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 0, 0, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 2, 0, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 2, 1, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 2, 1, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 2, 0, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 4, 0, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 4, 1, -0.5, 0.5, 0.5,
-4.268839, -4.362335, 4, 1, 1.5, 0.5, 0.5,
-4.268839, -4.362335, 4, 0, 1.5, 0.5, 0.5
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
-3.706404, -3.831032, -5.218497,
-3.706404, 3.253, -5.218497,
-3.706404, -3.831032, 5.99396,
-3.706404, 3.253, 5.99396,
-3.706404, -3.831032, -5.218497,
-3.706404, -3.831032, 5.99396,
-3.706404, 3.253, -5.218497,
-3.706404, 3.253, 5.99396,
-3.706404, -3.831032, -5.218497,
3.792739, -3.831032, -5.218497,
-3.706404, -3.831032, 5.99396,
3.792739, -3.831032, 5.99396,
-3.706404, 3.253, -5.218497,
3.792739, 3.253, -5.218497,
-3.706404, 3.253, 5.99396,
3.792739, 3.253, 5.99396,
3.792739, -3.831032, -5.218497,
3.792739, 3.253, -5.218497,
3.792739, -3.831032, 5.99396,
3.792739, 3.253, 5.99396,
3.792739, -3.831032, -5.218497,
3.792739, -3.831032, 5.99396,
3.792739, 3.253, -5.218497,
3.792739, 3.253, 5.99396
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
var radius = 8.135801;
var distance = 36.1971;
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
mvMatrix.translate( -0.04316747, 0.2890161, -0.3877318 );
mvMatrix.scale( 1.173012, 1.241749, 0.784537 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.1971);
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
Chlordimeform<-read.table("Chlordimeform.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.597193, -1.882765, -0.6948943, 0, 0, 1, 1, 1,
-2.967416, 0.01945382, -2.851397, 1, 0, 0, 1, 1,
-2.908073, 0.4426306, -3.210887, 1, 0, 0, 1, 1,
-2.875456, 0.1890157, -0.9360914, 1, 0, 0, 1, 1,
-2.765032, 0.7248961, -1.503643, 1, 0, 0, 1, 1,
-2.652427, -0.2678039, -2.411035, 1, 0, 0, 1, 1,
-2.542091, 0.6234605, -2.121429, 0, 0, 0, 1, 1,
-2.463779, -0.5354857, -0.1640765, 0, 0, 0, 1, 1,
-2.427632, 0.6305475, -0.3874778, 0, 0, 0, 1, 1,
-2.392817, -0.009627865, -1.995894, 0, 0, 0, 1, 1,
-2.386313, 0.4946361, -1.181001, 0, 0, 0, 1, 1,
-2.334638, -0.9978853, -3.267059, 0, 0, 0, 1, 1,
-2.32441, -0.5681043, -1.9427, 0, 0, 0, 1, 1,
-2.30459, 0.01856729, -0.8869878, 1, 1, 1, 1, 1,
-2.275172, 0.0181115, 0.07859826, 1, 1, 1, 1, 1,
-2.221874, 1.087486, -0.8316326, 1, 1, 1, 1, 1,
-2.146747, 2.469763, -1.838352, 1, 1, 1, 1, 1,
-2.024637, 0.9233591, -1.318614, 1, 1, 1, 1, 1,
-2.014507, -0.0206644, -0.9389582, 1, 1, 1, 1, 1,
-1.997779, -0.6070578, -2.431321, 1, 1, 1, 1, 1,
-1.994862, -0.3773393, -1.505302, 1, 1, 1, 1, 1,
-1.975157, -0.09018819, -1.589123, 1, 1, 1, 1, 1,
-1.96147, 0.6740757, -0.5381581, 1, 1, 1, 1, 1,
-1.95698, 1.652696, -1.686647, 1, 1, 1, 1, 1,
-1.953459, -0.6139588, -3.304588, 1, 1, 1, 1, 1,
-1.942948, -0.3155576, -1.497936, 1, 1, 1, 1, 1,
-1.883269, -0.1586849, -0.8571258, 1, 1, 1, 1, 1,
-1.883198, -1.054502, -1.673546, 1, 1, 1, 1, 1,
-1.879732, 0.1373268, -0.007671583, 0, 0, 1, 1, 1,
-1.867219, 0.072074, -0.7408803, 1, 0, 0, 1, 1,
-1.86199, 0.2610331, -1.737226, 1, 0, 0, 1, 1,
-1.849272, -0.3900957, -0.6325608, 1, 0, 0, 1, 1,
-1.845811, 1.714266, -0.8954033, 1, 0, 0, 1, 1,
-1.841369, -0.7866067, -1.048427, 1, 0, 0, 1, 1,
-1.838756, 1.51936, 0.150783, 0, 0, 0, 1, 1,
-1.837167, 0.9917907, -1.774708, 0, 0, 0, 1, 1,
-1.819744, -0.9884375, -1.43746, 0, 0, 0, 1, 1,
-1.755811, 0.9485422, -0.6175811, 0, 0, 0, 1, 1,
-1.747786, 1.158806, -0.3068253, 0, 0, 0, 1, 1,
-1.746876, 0.1183634, 0.3113088, 0, 0, 0, 1, 1,
-1.725147, -0.8273429, -0.4155744, 0, 0, 0, 1, 1,
-1.708912, -0.5169693, -2.918927, 1, 1, 1, 1, 1,
-1.708091, -0.9999414, -2.949156, 1, 1, 1, 1, 1,
-1.686851, 0.510519, -1.657514, 1, 1, 1, 1, 1,
-1.682231, 0.3569524, -1.858165, 1, 1, 1, 1, 1,
-1.664388, 1.72586, -2.312478, 1, 1, 1, 1, 1,
-1.660425, -0.6458509, -1.483683, 1, 1, 1, 1, 1,
-1.653475, -0.1396133, -1.07405, 1, 1, 1, 1, 1,
-1.650435, -0.6211793, -1.358695, 1, 1, 1, 1, 1,
-1.6457, 0.02491501, -0.5544896, 1, 1, 1, 1, 1,
-1.64178, -0.1360588, -2.536625, 1, 1, 1, 1, 1,
-1.637942, -0.4946391, -0.9801719, 1, 1, 1, 1, 1,
-1.633723, 0.7680882, -2.130264, 1, 1, 1, 1, 1,
-1.622968, -0.7706575, -1.04379, 1, 1, 1, 1, 1,
-1.571541, -0.4094363, -1.852156, 1, 1, 1, 1, 1,
-1.567918, -0.1344252, -1.994294, 1, 1, 1, 1, 1,
-1.560358, 1.416125, -0.6645828, 0, 0, 1, 1, 1,
-1.557797, 0.3228184, 0.1301236, 1, 0, 0, 1, 1,
-1.552291, 0.4082604, -1.544532, 1, 0, 0, 1, 1,
-1.545738, 0.2177028, -4.010029, 1, 0, 0, 1, 1,
-1.537541, -0.2764603, -1.671011, 1, 0, 0, 1, 1,
-1.536464, -1.668961, -2.449295, 1, 0, 0, 1, 1,
-1.511105, -0.493286, -1.560539, 0, 0, 0, 1, 1,
-1.484092, -0.849785, -1.860129, 0, 0, 0, 1, 1,
-1.481286, -2.33731, -3.566664, 0, 0, 0, 1, 1,
-1.466806, -0.283098, -2.109332, 0, 0, 0, 1, 1,
-1.45896, 0.5038675, -0.4924069, 0, 0, 0, 1, 1,
-1.458894, -1.535448, -2.616977, 0, 0, 0, 1, 1,
-1.449181, -1.664601, -1.923941, 0, 0, 0, 1, 1,
-1.448687, 1.6271, -1.673196, 1, 1, 1, 1, 1,
-1.445786, -0.009839653, -1.169605, 1, 1, 1, 1, 1,
-1.420644, -0.5557992, -2.914508, 1, 1, 1, 1, 1,
-1.408764, 1.722155, 0.4653674, 1, 1, 1, 1, 1,
-1.399666, 0.4738311, -0.1613138, 1, 1, 1, 1, 1,
-1.382585, 0.8305235, -1.586828, 1, 1, 1, 1, 1,
-1.378436, 0.07645517, -1.080075, 1, 1, 1, 1, 1,
-1.373272, 0.8026526, -0.3960235, 1, 1, 1, 1, 1,
-1.354415, -1.014354, -3.157468, 1, 1, 1, 1, 1,
-1.346786, -0.3750881, -1.13486, 1, 1, 1, 1, 1,
-1.343098, -0.9437911, -3.607036, 1, 1, 1, 1, 1,
-1.340668, 0.7792916, -1.441264, 1, 1, 1, 1, 1,
-1.337608, 2.415666, 1.081051, 1, 1, 1, 1, 1,
-1.333774, 1.207745, -3.681467, 1, 1, 1, 1, 1,
-1.333205, -1.136002, -1.487926, 1, 1, 1, 1, 1,
-1.331585, -2.25237, -1.318613, 0, 0, 1, 1, 1,
-1.329897, 1.292983, -0.8723637, 1, 0, 0, 1, 1,
-1.320179, 0.002992704, -1.435259, 1, 0, 0, 1, 1,
-1.309139, -0.638077, -2.108915, 1, 0, 0, 1, 1,
-1.308343, 0.6086246, -0.7017968, 1, 0, 0, 1, 1,
-1.303803, 2.160994, -0.6473898, 1, 0, 0, 1, 1,
-1.282824, 0.3938636, -0.7823493, 0, 0, 0, 1, 1,
-1.274039, -0.8914821, -4.039623, 0, 0, 0, 1, 1,
-1.266328, -1.250971, -2.045451, 0, 0, 0, 1, 1,
-1.265217, -0.8145204, -1.53115, 0, 0, 0, 1, 1,
-1.262339, 0.01271337, 0.443552, 0, 0, 0, 1, 1,
-1.252919, -1.066074, -2.172662, 0, 0, 0, 1, 1,
-1.247686, 1.172434, -1.63451, 0, 0, 0, 1, 1,
-1.245155, -0.02609764, -2.978258, 1, 1, 1, 1, 1,
-1.241467, -1.304078, -1.812934, 1, 1, 1, 1, 1,
-1.239348, 1.013888, -0.7493626, 1, 1, 1, 1, 1,
-1.237706, 2.881772, -1.798228, 1, 1, 1, 1, 1,
-1.231954, -0.7134315, -2.613955, 1, 1, 1, 1, 1,
-1.22599, -0.9574017, -1.314187, 1, 1, 1, 1, 1,
-1.219504, 0.3143364, -3.449032, 1, 1, 1, 1, 1,
-1.217849, -0.007871579, 0.787152, 1, 1, 1, 1, 1,
-1.215309, -0.4989884, -3.970864, 1, 1, 1, 1, 1,
-1.197712, 0.2001267, -1.061721, 1, 1, 1, 1, 1,
-1.196064, -0.00802107, -2.641415, 1, 1, 1, 1, 1,
-1.193641, -0.2842031, -2.077679, 1, 1, 1, 1, 1,
-1.187751, -0.2339675, -4.486839, 1, 1, 1, 1, 1,
-1.186385, 0.692418, -1.390795, 1, 1, 1, 1, 1,
-1.180835, -0.3646857, -3.12129, 1, 1, 1, 1, 1,
-1.178894, -0.6039535, -2.395781, 0, 0, 1, 1, 1,
-1.173615, -0.8729998, -1.255628, 1, 0, 0, 1, 1,
-1.173597, -1.748794, -0.8448033, 1, 0, 0, 1, 1,
-1.172666, -0.0983155, -1.665873, 1, 0, 0, 1, 1,
-1.169142, -1.016127, -2.574615, 1, 0, 0, 1, 1,
-1.163685, -1.611627, -2.960694, 1, 0, 0, 1, 1,
-1.163329, 0.3694477, -1.368035, 0, 0, 0, 1, 1,
-1.160392, 0.5527508, -0.2401018, 0, 0, 0, 1, 1,
-1.156438, -0.5048869, -1.442003, 0, 0, 0, 1, 1,
-1.153104, -0.4870673, -1.160805, 0, 0, 0, 1, 1,
-1.146753, -0.3164497, -1.768473, 0, 0, 0, 1, 1,
-1.144343, 0.4536118, -0.8033066, 0, 0, 0, 1, 1,
-1.139299, 0.5375237, -0.9351028, 0, 0, 0, 1, 1,
-1.13891, -0.2417681, -1.649355, 1, 1, 1, 1, 1,
-1.135319, -0.8999822, -2.593559, 1, 1, 1, 1, 1,
-1.123658, 0.9595545, -2.453174, 1, 1, 1, 1, 1,
-1.108885, -1.010789, -1.488645, 1, 1, 1, 1, 1,
-1.102479, 0.8534914, 0.8493957, 1, 1, 1, 1, 1,
-1.101497, 0.07362533, -2.389721, 1, 1, 1, 1, 1,
-1.098052, -0.5953906, -2.649078, 1, 1, 1, 1, 1,
-1.095782, 1.714922, -0.8811091, 1, 1, 1, 1, 1,
-1.094666, 0.1410313, 0.0832533, 1, 1, 1, 1, 1,
-1.094067, 0.7704479, -2.395576, 1, 1, 1, 1, 1,
-1.082439, 0.4644512, -1.248288, 1, 1, 1, 1, 1,
-1.082392, 0.3606533, -1.599392, 1, 1, 1, 1, 1,
-1.080751, 0.7454742, -0.8869007, 1, 1, 1, 1, 1,
-1.08014, 0.2051537, 0.1742622, 1, 1, 1, 1, 1,
-1.07598, 0.5691014, -2.373314, 1, 1, 1, 1, 1,
-1.073835, 3.149834, -0.3455505, 0, 0, 1, 1, 1,
-1.065416, -0.5654938, -2.413888, 1, 0, 0, 1, 1,
-1.065083, 0.566911, -2.659125, 1, 0, 0, 1, 1,
-1.063142, 0.3649728, -0.3849076, 1, 0, 0, 1, 1,
-1.062899, -0.3811404, -2.324109, 1, 0, 0, 1, 1,
-1.056027, 0.1482836, -1.921452, 1, 0, 0, 1, 1,
-1.050495, 0.5016662, -1.002293, 0, 0, 0, 1, 1,
-1.048765, 0.5172805, -0.5805933, 0, 0, 0, 1, 1,
-1.037669, -0.1201209, -2.430021, 0, 0, 0, 1, 1,
-1.025554, -0.9345718, -1.423174, 0, 0, 0, 1, 1,
-1.023658, 1.365965, -1.588933, 0, 0, 0, 1, 1,
-1.022007, 0.3311893, -1.14833, 0, 0, 0, 1, 1,
-1.015802, -1.016472, -3.343766, 0, 0, 0, 1, 1,
-1.013578, 0.2532094, -0.7266933, 1, 1, 1, 1, 1,
-1.010339, 0.4895701, -2.58755, 1, 1, 1, 1, 1,
-1.006936, 0.01443169, -1.681971, 1, 1, 1, 1, 1,
-1.005647, -1.404973, -1.956235, 1, 1, 1, 1, 1,
-1.004777, 0.08366653, -1.956196, 1, 1, 1, 1, 1,
-1.003065, -1.822561, -1.23961, 1, 1, 1, 1, 1,
-1.001227, 0.5750465, 0.7246878, 1, 1, 1, 1, 1,
-1.000867, 0.3608251, -1.577332, 1, 1, 1, 1, 1,
-0.9982785, 1.494214, 0.601832, 1, 1, 1, 1, 1,
-0.9976023, 1.091585, 1.359421, 1, 1, 1, 1, 1,
-0.9946169, 2.235202, 0.4468019, 1, 1, 1, 1, 1,
-0.9877365, -0.8026153, -3.211692, 1, 1, 1, 1, 1,
-0.9817978, 1.360795, -2.024409, 1, 1, 1, 1, 1,
-0.9767739, -0.2823632, -1.192868, 1, 1, 1, 1, 1,
-0.973901, -1.465206, -2.683394, 1, 1, 1, 1, 1,
-0.9734452, -1.09576, -2.659461, 0, 0, 1, 1, 1,
-0.9727042, -0.5998973, -2.678777, 1, 0, 0, 1, 1,
-0.9610298, -0.02342728, -1.143348, 1, 0, 0, 1, 1,
-0.9608085, 0.6852301, -1.482188, 1, 0, 0, 1, 1,
-0.9598174, 0.6437287, -1.686388, 1, 0, 0, 1, 1,
-0.9591612, -0.337311, -1.060752, 1, 0, 0, 1, 1,
-0.9568122, 0.7645265, -0.8778823, 0, 0, 0, 1, 1,
-0.9542479, -1.15755, -1.935419, 0, 0, 0, 1, 1,
-0.9474984, 1.901106, 0.1628144, 0, 0, 0, 1, 1,
-0.9303433, -0.7142848, -3.067045, 0, 0, 0, 1, 1,
-0.9259586, -1.450071, -3.108537, 0, 0, 0, 1, 1,
-0.916418, -0.7601437, -3.164677, 0, 0, 0, 1, 1,
-0.9147666, 0.9851038, -0.3596122, 0, 0, 0, 1, 1,
-0.9113444, -1.625419, -2.638404, 1, 1, 1, 1, 1,
-0.9054429, -1.988294, -3.338934, 1, 1, 1, 1, 1,
-0.8950639, -0.6707883, -4.057978, 1, 1, 1, 1, 1,
-0.8946233, -1.929627, -4.623874, 1, 1, 1, 1, 1,
-0.8942403, -1.767686, -0.9892049, 1, 1, 1, 1, 1,
-0.8934937, 0.5697927, -0.7739017, 1, 1, 1, 1, 1,
-0.8910021, 0.2234533, -1.381146, 1, 1, 1, 1, 1,
-0.869246, -0.7770104, -2.457571, 1, 1, 1, 1, 1,
-0.8692211, 0.4156421, -2.229205, 1, 1, 1, 1, 1,
-0.8676704, 0.7798684, -2.149751, 1, 1, 1, 1, 1,
-0.8653905, 0.1417927, -1.364702, 1, 1, 1, 1, 1,
-0.8603494, 0.7676346, -2.233969, 1, 1, 1, 1, 1,
-0.8556816, 0.02317823, -1.730408, 1, 1, 1, 1, 1,
-0.8538972, -0.3555608, -1.142349, 1, 1, 1, 1, 1,
-0.8511742, -0.8275434, -2.839561, 1, 1, 1, 1, 1,
-0.8438016, -1.021103, -3.090632, 0, 0, 1, 1, 1,
-0.8436893, 0.4094466, -1.250111, 1, 0, 0, 1, 1,
-0.8402563, -0.6817541, -1.678077, 1, 0, 0, 1, 1,
-0.8362309, 0.8466252, -0.3835058, 1, 0, 0, 1, 1,
-0.8346724, -0.1882764, -1.562997, 1, 0, 0, 1, 1,
-0.8298854, 0.3752796, -0.3702191, 1, 0, 0, 1, 1,
-0.8276051, -0.1140249, -1.129669, 0, 0, 0, 1, 1,
-0.8200197, -0.3339324, -2.82706, 0, 0, 0, 1, 1,
-0.8187917, 0.2587088, -2.309139, 0, 0, 0, 1, 1,
-0.810414, 1.106607, -0.9748184, 0, 0, 0, 1, 1,
-0.8083752, 1.177292, -0.7024886, 0, 0, 0, 1, 1,
-0.8055429, 0.1193032, -0.9123694, 0, 0, 0, 1, 1,
-0.8015214, 0.6212466, -2.837879, 0, 0, 0, 1, 1,
-0.7965599, -1.857235, -2.122096, 1, 1, 1, 1, 1,
-0.7947432, 0.653569, -1.11526, 1, 1, 1, 1, 1,
-0.7925266, -1.617228, -2.698525, 1, 1, 1, 1, 1,
-0.7885484, 0.05869268, 0.2383504, 1, 1, 1, 1, 1,
-0.7796519, 0.5998563, -1.002831, 1, 1, 1, 1, 1,
-0.7785963, -1.844558, -3.493175, 1, 1, 1, 1, 1,
-0.7785121, 1.391931, -0.2390732, 1, 1, 1, 1, 1,
-0.7764847, 0.6056098, 0.9534478, 1, 1, 1, 1, 1,
-0.7762797, 0.2824946, -2.180162, 1, 1, 1, 1, 1,
-0.7736627, -0.8508916, -2.894118, 1, 1, 1, 1, 1,
-0.765781, 0.09902989, -1.253068, 1, 1, 1, 1, 1,
-0.7646071, -2.188148, -3.905169, 1, 1, 1, 1, 1,
-0.764573, -0.1035691, -1.80338, 1, 1, 1, 1, 1,
-0.763182, 1.455443, 0.31736, 1, 1, 1, 1, 1,
-0.7567893, 0.3573968, -2.306592, 1, 1, 1, 1, 1,
-0.7407667, 0.4237872, 1.162873, 0, 0, 1, 1, 1,
-0.7394157, 2.01507, 1.259671, 1, 0, 0, 1, 1,
-0.7382107, -1.181793, -5.016351, 1, 0, 0, 1, 1,
-0.7341973, 1.126989, -2.39781, 1, 0, 0, 1, 1,
-0.7333584, -0.01590622, -1.871188, 1, 0, 0, 1, 1,
-0.7292298, 0.9565766, -1.154855, 1, 0, 0, 1, 1,
-0.7256628, -1.63836, -1.945306, 0, 0, 0, 1, 1,
-0.7184558, 0.9353049, -2.059391, 0, 0, 0, 1, 1,
-0.7112169, 1.13645, 0.2727923, 0, 0, 0, 1, 1,
-0.7075261, -0.161571, -1.989305, 0, 0, 0, 1, 1,
-0.6977679, 0.6362123, 0.6554106, 0, 0, 0, 1, 1,
-0.6960556, -1.747572, -0.7333561, 0, 0, 0, 1, 1,
-0.6896565, 1.016151, -1.657229, 0, 0, 0, 1, 1,
-0.6878203, -0.5868878, -2.57875, 1, 1, 1, 1, 1,
-0.6873307, -1.615489, -3.933245, 1, 1, 1, 1, 1,
-0.6811561, 0.9113938, 0.2852637, 1, 1, 1, 1, 1,
-0.6782826, 0.585143, -1.097175, 1, 1, 1, 1, 1,
-0.6755762, -0.5154133, -1.515378, 1, 1, 1, 1, 1,
-0.6748946, 0.5827268, -0.4361577, 1, 1, 1, 1, 1,
-0.6748113, 1.301579, -1.320292, 1, 1, 1, 1, 1,
-0.6705613, -0.3406724, -1.010099, 1, 1, 1, 1, 1,
-0.657277, 0.2425236, -1.689487, 1, 1, 1, 1, 1,
-0.6561815, 0.210584, -1.129857, 1, 1, 1, 1, 1,
-0.6558772, 0.5538901, -1.22866, 1, 1, 1, 1, 1,
-0.6551526, -2.190182, -3.817972, 1, 1, 1, 1, 1,
-0.6540574, -0.4083272, -3.71483, 1, 1, 1, 1, 1,
-0.6496302, 1.586472, -1.596048, 1, 1, 1, 1, 1,
-0.6429042, 1.338607, -0.2791715, 1, 1, 1, 1, 1,
-0.6418452, 0.01721253, -2.241402, 0, 0, 1, 1, 1,
-0.6405114, -0.2147388, -3.427788, 1, 0, 0, 1, 1,
-0.6401491, 0.2837836, -0.3802148, 1, 0, 0, 1, 1,
-0.6392211, -0.6714068, -1.686472, 1, 0, 0, 1, 1,
-0.6384438, -0.6925474, -2.122467, 1, 0, 0, 1, 1,
-0.6383876, 0.7638543, -0.6031484, 1, 0, 0, 1, 1,
-0.6380003, -1.19479, -2.857039, 0, 0, 0, 1, 1,
-0.6372045, 1.027355, -1.021824, 0, 0, 0, 1, 1,
-0.6370772, 0.6220235, 1.433434, 0, 0, 0, 1, 1,
-0.6362389, 1.175897, -0.6857287, 0, 0, 0, 1, 1,
-0.6335973, 0.1470729, -1.030118, 0, 0, 0, 1, 1,
-0.6317296, 0.2845583, -0.4259186, 0, 0, 0, 1, 1,
-0.6307666, -0.6504574, -1.648104, 0, 0, 0, 1, 1,
-0.6269194, -0.1555247, -3.912574, 1, 1, 1, 1, 1,
-0.6256807, 1.243098, -0.7118434, 1, 1, 1, 1, 1,
-0.6210938, 0.3794419, -0.6891568, 1, 1, 1, 1, 1,
-0.6201439, -0.06453359, -1.600614, 1, 1, 1, 1, 1,
-0.6200529, 0.770147, -0.9981417, 1, 1, 1, 1, 1,
-0.6189308, 1.213357, 0.7395741, 1, 1, 1, 1, 1,
-0.6151248, 1.323265, -1.647175, 1, 1, 1, 1, 1,
-0.6150569, 1.807419, -0.1759455, 1, 1, 1, 1, 1,
-0.61049, -0.3458132, -3.030186, 1, 1, 1, 1, 1,
-0.6102371, -1.579523, -2.79228, 1, 1, 1, 1, 1,
-0.6036977, 0.1390732, -1.546664, 1, 1, 1, 1, 1,
-0.6020944, 0.1403536, -0.6725664, 1, 1, 1, 1, 1,
-0.5993845, 0.2207997, -1.797791, 1, 1, 1, 1, 1,
-0.5883751, -1.073356, -3.211533, 1, 1, 1, 1, 1,
-0.5880198, 0.4312545, -1.707014, 1, 1, 1, 1, 1,
-0.5837841, 0.9664041, -1.503471, 0, 0, 1, 1, 1,
-0.5835836, -0.306026, -1.893622, 1, 0, 0, 1, 1,
-0.5833734, -0.4124011, -2.514904, 1, 0, 0, 1, 1,
-0.5833192, -1.167398, -3.351164, 1, 0, 0, 1, 1,
-0.5801579, -0.3507719, -0.5303411, 1, 0, 0, 1, 1,
-0.5747786, 0.2483041, -0.7404069, 1, 0, 0, 1, 1,
-0.5746468, -0.01550135, -2.617749, 0, 0, 0, 1, 1,
-0.5663608, -1.431641, -3.947048, 0, 0, 0, 1, 1,
-0.5650762, 1.376914, -1.759688, 0, 0, 0, 1, 1,
-0.5629024, -0.8174216, -2.018466, 0, 0, 0, 1, 1,
-0.5620734, -2.047939, -2.991715, 0, 0, 0, 1, 1,
-0.5617867, -0.5593649, -2.512483, 0, 0, 0, 1, 1,
-0.5609211, 0.1906044, -1.479534, 0, 0, 0, 1, 1,
-0.5524628, 0.199297, -0.3572639, 1, 1, 1, 1, 1,
-0.5493937, 1.016527, -1.553898, 1, 1, 1, 1, 1,
-0.5493022, -1.258927, -3.594585, 1, 1, 1, 1, 1,
-0.5492684, 1.38834, 0.5070214, 1, 1, 1, 1, 1,
-0.5396754, -0.5468109, -1.441524, 1, 1, 1, 1, 1,
-0.539026, -0.1402928, -0.5862092, 1, 1, 1, 1, 1,
-0.537766, -0.729454, -2.20901, 1, 1, 1, 1, 1,
-0.537703, 0.8238491, -0.420041, 1, 1, 1, 1, 1,
-0.5280136, -0.3067826, -1.357885, 1, 1, 1, 1, 1,
-0.5236601, -0.2383111, -0.8788942, 1, 1, 1, 1, 1,
-0.5202935, 1.123693, 0.6207081, 1, 1, 1, 1, 1,
-0.5169746, -0.06404445, -1.515168, 1, 1, 1, 1, 1,
-0.5165945, -0.8117107, -1.532465, 1, 1, 1, 1, 1,
-0.5161218, -0.2722688, -2.165507, 1, 1, 1, 1, 1,
-0.514219, 0.6456937, -1.951177, 1, 1, 1, 1, 1,
-0.5133601, 0.1382172, -1.942802, 0, 0, 1, 1, 1,
-0.5126278, 1.904158, -0.7992994, 1, 0, 0, 1, 1,
-0.5118641, -0.2497712, -1.638889, 1, 0, 0, 1, 1,
-0.5058246, -0.8600577, -1.668739, 1, 0, 0, 1, 1,
-0.5049522, -0.6794739, -2.341161, 1, 0, 0, 1, 1,
-0.5048955, 1.232737, 0.9706007, 1, 0, 0, 1, 1,
-0.5045378, 0.645597, -0.2981978, 0, 0, 0, 1, 1,
-0.5043052, -0.2430229, -3.006929, 0, 0, 0, 1, 1,
-0.5020801, 1.285085, -1.556061, 0, 0, 0, 1, 1,
-0.5003728, 1.227906, -0.3415484, 0, 0, 0, 1, 1,
-0.496521, 0.3729985, 0.08802669, 0, 0, 0, 1, 1,
-0.494163, -0.7975022, -2.931045, 0, 0, 0, 1, 1,
-0.4918221, 0.4224297, -1.794148, 0, 0, 0, 1, 1,
-0.4916178, -2.161482, -4.864511, 1, 1, 1, 1, 1,
-0.4910022, 0.4664705, -1.465438, 1, 1, 1, 1, 1,
-0.4899856, 0.5483314, -1.765437, 1, 1, 1, 1, 1,
-0.4897182, -0.5979099, -2.977611, 1, 1, 1, 1, 1,
-0.4896969, 2.02106, -1.770183, 1, 1, 1, 1, 1,
-0.4873363, 0.5263778, 0.02711816, 1, 1, 1, 1, 1,
-0.4870784, 0.4075275, -1.683208, 1, 1, 1, 1, 1,
-0.4865823, 0.3097785, 0.1481878, 1, 1, 1, 1, 1,
-0.482985, 2.401361, -1.554901, 1, 1, 1, 1, 1,
-0.4814156, 0.9915544, -0.3170973, 1, 1, 1, 1, 1,
-0.4718441, 0.0657623, -1.828464, 1, 1, 1, 1, 1,
-0.4705798, 0.15031, 0.4654496, 1, 1, 1, 1, 1,
-0.4641579, 0.3823927, -0.9680069, 1, 1, 1, 1, 1,
-0.4603322, -1.494556, -4.356401, 1, 1, 1, 1, 1,
-0.4496689, -0.0260374, 0.4035512, 1, 1, 1, 1, 1,
-0.4430778, 0.08948365, -1.449409, 0, 0, 1, 1, 1,
-0.4428853, -0.4540852, -4.036805, 1, 0, 0, 1, 1,
-0.4412797, -0.4614899, -2.415994, 1, 0, 0, 1, 1,
-0.4374097, -2.301933, -3.064885, 1, 0, 0, 1, 1,
-0.4352165, 0.2793056, -0.7807332, 1, 0, 0, 1, 1,
-0.432015, -2.663579, -3.090572, 1, 0, 0, 1, 1,
-0.4312571, -1.152749, -2.386398, 0, 0, 0, 1, 1,
-0.4282895, -0.8889557, -2.202597, 0, 0, 0, 1, 1,
-0.4244383, -0.114599, -1.652097, 0, 0, 0, 1, 1,
-0.4244247, -0.2887572, -2.007047, 0, 0, 0, 1, 1,
-0.4213556, -0.06213172, -1.584233, 0, 0, 0, 1, 1,
-0.4172886, -0.0823945, -2.148637, 0, 0, 0, 1, 1,
-0.4171272, -0.8717945, -2.602453, 0, 0, 0, 1, 1,
-0.4117075, -0.6903827, -2.546487, 1, 1, 1, 1, 1,
-0.4082343, -0.02905893, 0.4338702, 1, 1, 1, 1, 1,
-0.4042913, -1.040442, -3.05667, 1, 1, 1, 1, 1,
-0.4030127, -0.3813098, -3.645408, 1, 1, 1, 1, 1,
-0.4003561, -1.123901, -4.109293, 1, 1, 1, 1, 1,
-0.3992624, -0.3840439, -1.927115, 1, 1, 1, 1, 1,
-0.3973968, -2.578589, -1.039545, 1, 1, 1, 1, 1,
-0.3973294, 1.08034, 0.1543404, 1, 1, 1, 1, 1,
-0.3933113, 0.4677473, -1.579086, 1, 1, 1, 1, 1,
-0.3906154, -0.8085105, -1.255367, 1, 1, 1, 1, 1,
-0.383987, 0.04212042, 0.7371277, 1, 1, 1, 1, 1,
-0.3835748, 0.9787835, 1.08887, 1, 1, 1, 1, 1,
-0.3797862, -1.972576, -2.262506, 1, 1, 1, 1, 1,
-0.3727209, -0.09662093, -2.6813, 1, 1, 1, 1, 1,
-0.3703786, 0.7297412, -1.917297, 1, 1, 1, 1, 1,
-0.3579233, 0.4986537, -2.101171, 0, 0, 1, 1, 1,
-0.3565658, 0.4819885, -2.118634, 1, 0, 0, 1, 1,
-0.3523711, 0.3266641, 0.8025504, 1, 0, 0, 1, 1,
-0.3505459, 2.378261, 0.05294158, 1, 0, 0, 1, 1,
-0.3470006, 0.1633362, -0.7674968, 1, 0, 0, 1, 1,
-0.3469216, 0.3654447, 0.2814394, 1, 0, 0, 1, 1,
-0.3446647, 0.3472566, -2.42403, 0, 0, 0, 1, 1,
-0.3443237, 2.10226, -0.1768733, 0, 0, 0, 1, 1,
-0.3384646, 1.502766, -1.387088, 0, 0, 0, 1, 1,
-0.3357344, -1.201724, -2.03119, 0, 0, 0, 1, 1,
-0.3332484, 0.1811446, -2.725728, 0, 0, 0, 1, 1,
-0.3304823, 0.2441362, -1.102542, 0, 0, 0, 1, 1,
-0.3203915, 1.860451, -0.4678965, 0, 0, 0, 1, 1,
-0.3193612, 2.439423, 1.950304, 1, 1, 1, 1, 1,
-0.318791, 0.6151637, 0.5107156, 1, 1, 1, 1, 1,
-0.3074467, 3.063587, -0.1374419, 1, 1, 1, 1, 1,
-0.3047115, -1.318118, -4.227316, 1, 1, 1, 1, 1,
-0.3033225, -0.642895, -4.009398, 1, 1, 1, 1, 1,
-0.295514, 2.047586, -0.5612235, 1, 1, 1, 1, 1,
-0.2950477, 0.9731998, -2.314682, 1, 1, 1, 1, 1,
-0.2945763, -0.01962422, -1.823175, 1, 1, 1, 1, 1,
-0.293857, 0.3057908, -1.565787, 1, 1, 1, 1, 1,
-0.2927468, -0.9341213, -3.477634, 1, 1, 1, 1, 1,
-0.2910316, -1.990083, -1.453815, 1, 1, 1, 1, 1,
-0.2889029, -1.616876, -2.825746, 1, 1, 1, 1, 1,
-0.2826421, -1.806043, -3.325437, 1, 1, 1, 1, 1,
-0.2812656, 0.5461023, -1.23546, 1, 1, 1, 1, 1,
-0.2773817, 1.301366, -1.578282, 1, 1, 1, 1, 1,
-0.2762687, 1.362075, -0.4072461, 0, 0, 1, 1, 1,
-0.274738, -0.1078295, -1.503959, 1, 0, 0, 1, 1,
-0.2742277, -0.9054664, -2.031171, 1, 0, 0, 1, 1,
-0.2707921, -1.490431, -1.439997, 1, 0, 0, 1, 1,
-0.2689302, 0.0457264, 0.4281882, 1, 0, 0, 1, 1,
-0.268489, 0.9171657, -1.060163, 1, 0, 0, 1, 1,
-0.2660397, -0.1735922, -0.7581246, 0, 0, 0, 1, 1,
-0.2652601, 0.4116852, 0.1188433, 0, 0, 0, 1, 1,
-0.2640913, -1.659028, -3.508125, 0, 0, 0, 1, 1,
-0.2595824, -0.4718112, -2.970558, 0, 0, 0, 1, 1,
-0.2575256, -0.943347, -3.302329, 0, 0, 0, 1, 1,
-0.2555975, -1.384753, -1.227392, 0, 0, 0, 1, 1,
-0.2520469, 0.08410607, -1.418974, 0, 0, 0, 1, 1,
-0.2419863, 1.134981, -1.964684, 1, 1, 1, 1, 1,
-0.2406732, -2.265346, -3.344931, 1, 1, 1, 1, 1,
-0.2373422, -0.6358579, -2.964902, 1, 1, 1, 1, 1,
-0.2371146, -0.6801379, -1.087621, 1, 1, 1, 1, 1,
-0.2294352, 0.5820538, 0.1491137, 1, 1, 1, 1, 1,
-0.2285217, -0.9480913, -4.562329, 1, 1, 1, 1, 1,
-0.2258444, -0.1031315, -1.409434, 1, 1, 1, 1, 1,
-0.2215282, -1.302811, -2.626343, 1, 1, 1, 1, 1,
-0.2201264, -0.4859268, -1.871515, 1, 1, 1, 1, 1,
-0.2200974, 1.287955, 0.8469136, 1, 1, 1, 1, 1,
-0.2200475, 0.4693971, 0.05126474, 1, 1, 1, 1, 1,
-0.2158163, -0.122991, -0.5363142, 1, 1, 1, 1, 1,
-0.2144298, -1.556415, -1.157302, 1, 1, 1, 1, 1,
-0.2132542, 1.42207, -0.94931, 1, 1, 1, 1, 1,
-0.2124804, 0.6715072, 0.9395213, 1, 1, 1, 1, 1,
-0.2097078, 1.244364, 0.6058322, 0, 0, 1, 1, 1,
-0.20893, 0.181436, -1.101579, 1, 0, 0, 1, 1,
-0.2078402, 0.6538849, 1.216269, 1, 0, 0, 1, 1,
-0.207564, 0.1056478, -1.981375, 1, 0, 0, 1, 1,
-0.207121, 0.3631251, -1.641603, 1, 0, 0, 1, 1,
-0.2070076, 1.84863, 1.319552, 1, 0, 0, 1, 1,
-0.1970404, -0.8427355, -2.669246, 0, 0, 0, 1, 1,
-0.1901285, -0.5644319, -1.753911, 0, 0, 0, 1, 1,
-0.1858676, -0.9441944, -3.066224, 0, 0, 0, 1, 1,
-0.1808205, 0.1618221, -1.414544, 0, 0, 0, 1, 1,
-0.1804507, -0.6540543, -1.915329, 0, 0, 0, 1, 1,
-0.1742676, 0.5380633, 0.1082441, 0, 0, 0, 1, 1,
-0.1741463, -1.628443, -2.866694, 0, 0, 0, 1, 1,
-0.1694849, -0.4355672, -2.48301, 1, 1, 1, 1, 1,
-0.1686307, -0.5174428, -2.056303, 1, 1, 1, 1, 1,
-0.1665273, -1.696571, -1.303649, 1, 1, 1, 1, 1,
-0.1660521, -1.729483, -3.709526, 1, 1, 1, 1, 1,
-0.1626412, 0.813335, 0.7163414, 1, 1, 1, 1, 1,
-0.1602991, -0.09004882, -1.660961, 1, 1, 1, 1, 1,
-0.1598745, 0.0814883, -1.775502, 1, 1, 1, 1, 1,
-0.1489489, -0.5956842, -3.00172, 1, 1, 1, 1, 1,
-0.1466544, 1.092864, 1.439176, 1, 1, 1, 1, 1,
-0.1428649, -0.7363926, -3.061641, 1, 1, 1, 1, 1,
-0.1416799, -0.7308334, -3.314805, 1, 1, 1, 1, 1,
-0.1396824, -0.1061087, -2.395751, 1, 1, 1, 1, 1,
-0.1305473, -0.7386391, -3.543764, 1, 1, 1, 1, 1,
-0.1304471, 0.7788475, -0.5823252, 1, 1, 1, 1, 1,
-0.1289345, -1.81039, -1.746451, 1, 1, 1, 1, 1,
-0.1272496, -0.542985, -2.632925, 0, 0, 1, 1, 1,
-0.1243668, 0.02937028, -3.112501, 1, 0, 0, 1, 1,
-0.1218581, 1.480395, 0.4296777, 1, 0, 0, 1, 1,
-0.1130569, 0.007317381, -1.141263, 1, 0, 0, 1, 1,
-0.1095451, -0.2024251, -2.688662, 1, 0, 0, 1, 1,
-0.1047957, 1.486562, 0.5012693, 1, 0, 0, 1, 1,
-0.1031581, -1.466555, -4.598464, 0, 0, 0, 1, 1,
-0.1030065, -0.1203985, -3.947333, 0, 0, 0, 1, 1,
-0.1029063, -0.1399554, -1.308477, 0, 0, 0, 1, 1,
-0.1024874, -0.7282292, -3.504339, 0, 0, 0, 1, 1,
-0.1002815, 1.004599, 1.309217, 0, 0, 0, 1, 1,
-0.09781241, -1.404104, -2.691724, 0, 0, 0, 1, 1,
-0.0908607, 0.6264495, 0.1350527, 0, 0, 0, 1, 1,
-0.08957323, -1.750679, -3.714452, 1, 1, 1, 1, 1,
-0.08912202, -2.005893, -2.43672, 1, 1, 1, 1, 1,
-0.08903453, -0.4357328, -1.805201, 1, 1, 1, 1, 1,
-0.08693378, 1.110718, 2.32165, 1, 1, 1, 1, 1,
-0.08646017, 0.02744269, -0.9324846, 1, 1, 1, 1, 1,
-0.08298515, 0.8242712, -0.6495881, 1, 1, 1, 1, 1,
-0.08280687, 0.001416455, -1.222115, 1, 1, 1, 1, 1,
-0.07937194, -0.8198395, -3.725905, 1, 1, 1, 1, 1,
-0.07858218, -0.6927283, -2.05622, 1, 1, 1, 1, 1,
-0.07624365, -1.456661, -3.588819, 1, 1, 1, 1, 1,
-0.07517053, 0.2026941, 0.4566396, 1, 1, 1, 1, 1,
-0.07343503, 0.07479502, 1.048352, 1, 1, 1, 1, 1,
-0.06914205, 0.7449597, -1.248443, 1, 1, 1, 1, 1,
-0.06758919, -0.7042667, -2.586052, 1, 1, 1, 1, 1,
-0.06546617, 0.1759569, 2.098761, 1, 1, 1, 1, 1,
-0.06269085, 0.7765909, 0.4085467, 0, 0, 1, 1, 1,
-0.05784965, -1.537525, -3.533674, 1, 0, 0, 1, 1,
-0.0455185, -2.138809, -3.291384, 1, 0, 0, 1, 1,
-0.04550931, -0.3448352, -2.703528, 1, 0, 0, 1, 1,
-0.04535768, 0.05073657, -1.137823, 1, 0, 0, 1, 1,
-0.04480553, -0.3736852, -1.52868, 1, 0, 0, 1, 1,
-0.04251904, 0.151573, -1.217074, 0, 0, 0, 1, 1,
-0.04000852, 0.6775328, -0.2517914, 0, 0, 0, 1, 1,
-0.03901682, -1.074894, -3.749555, 0, 0, 0, 1, 1,
-0.03238801, 1.033707, -0.1672902, 0, 0, 0, 1, 1,
-0.02644354, 1.219471, -0.3659048, 0, 0, 0, 1, 1,
-0.02602439, 0.7815057, 0.1820151, 0, 0, 0, 1, 1,
-0.01947967, 1.201056, -0.03452925, 0, 0, 0, 1, 1,
-0.01836734, 0.9244359, -1.961691, 1, 1, 1, 1, 1,
-0.01812429, 0.5433282, -2.185483, 1, 1, 1, 1, 1,
-0.01807642, -0.8636121, -4.019453, 1, 1, 1, 1, 1,
-0.0161651, 1.366206, -1.240359, 1, 1, 1, 1, 1,
-0.01517033, 0.1066888, -0.3721403, 1, 1, 1, 1, 1,
-0.01312834, 0.9747647, -0.3317181, 1, 1, 1, 1, 1,
-0.01177396, -0.6021085, -2.57435, 1, 1, 1, 1, 1,
-0.01141326, -1.068785, -2.618677, 1, 1, 1, 1, 1,
-0.01097904, -0.7711068, -3.576999, 1, 1, 1, 1, 1,
-0.008459846, -0.25438, -2.102518, 1, 1, 1, 1, 1,
-0.004919468, 0.9496086, 0.05361232, 1, 1, 1, 1, 1,
-0.004317635, -0.7602201, -4.278523, 1, 1, 1, 1, 1,
-0.001290026, -1.610837, -3.830357, 1, 1, 1, 1, 1,
-0.0007155319, -0.2893613, -5.055209, 1, 1, 1, 1, 1,
0.004237926, 0.4256525, -0.1607606, 1, 1, 1, 1, 1,
0.004848413, 0.001924838, 1.862736, 0, 0, 1, 1, 1,
0.005291563, -0.7439505, 3.672072, 1, 0, 0, 1, 1,
0.009731939, 2.129051, 1.037525, 1, 0, 0, 1, 1,
0.01065897, 0.3319533, -0.9304857, 1, 0, 0, 1, 1,
0.01124883, 0.3558941, 0.216964, 1, 0, 0, 1, 1,
0.02258946, 0.5413013, -0.5402838, 1, 0, 0, 1, 1,
0.02652184, -0.6910226, 4.338956, 0, 0, 0, 1, 1,
0.03476558, 0.1493392, 0.8628364, 0, 0, 0, 1, 1,
0.0381659, 0.1594426, 0.1307458, 0, 0, 0, 1, 1,
0.04548186, -0.319819, 3.520049, 0, 0, 0, 1, 1,
0.0481411, -1.443779, 3.936261, 0, 0, 0, 1, 1,
0.04984046, -1.371376, 1.162539, 0, 0, 0, 1, 1,
0.05212849, 0.8290484, -0.6836542, 0, 0, 0, 1, 1,
0.05562619, -1.648101, 3.126833, 1, 1, 1, 1, 1,
0.05754906, -0.2343191, 3.928605, 1, 1, 1, 1, 1,
0.06061534, -1.425206, 3.281927, 1, 1, 1, 1, 1,
0.06118489, -0.298662, 3.269047, 1, 1, 1, 1, 1,
0.06428365, 0.190174, 0.7767236, 1, 1, 1, 1, 1,
0.06428427, -1.421697, 3.456048, 1, 1, 1, 1, 1,
0.06590302, 0.3697215, -0.9915783, 1, 1, 1, 1, 1,
0.0663488, 0.320082, -0.4129893, 1, 1, 1, 1, 1,
0.06711449, 1.251381, -0.4858057, 1, 1, 1, 1, 1,
0.06896531, 0.8613064, 1.017594, 1, 1, 1, 1, 1,
0.07050434, -0.590185, 3.013511, 1, 1, 1, 1, 1,
0.07791959, -1.886473, 2.820356, 1, 1, 1, 1, 1,
0.07794429, -0.334901, 2.693076, 1, 1, 1, 1, 1,
0.07937182, -0.612663, 1.523812, 1, 1, 1, 1, 1,
0.07943092, 0.1296579, 0.5855173, 1, 1, 1, 1, 1,
0.08034337, -0.6140054, 2.290252, 0, 0, 1, 1, 1,
0.08173434, 0.4146687, -0.6977639, 1, 0, 0, 1, 1,
0.08348542, -0.1105226, 0.9483794, 1, 0, 0, 1, 1,
0.08391611, -1.068578, 1.631124, 1, 0, 0, 1, 1,
0.08429851, 0.6795257, 1.464876, 1, 0, 0, 1, 1,
0.08546534, 0.8705323, -0.8119645, 1, 0, 0, 1, 1,
0.09018198, 0.08130539, 0.03908329, 0, 0, 0, 1, 1,
0.09135098, 0.4327969, 0.3419133, 0, 0, 0, 1, 1,
0.09204328, 0.07764526, -0.03501695, 0, 0, 0, 1, 1,
0.09408472, 1.056139, 0.1525657, 0, 0, 0, 1, 1,
0.09736995, 0.4529583, -0.1177955, 0, 0, 0, 1, 1,
0.1013339, -1.207559, 4.669641, 0, 0, 0, 1, 1,
0.102917, 1.747687, 0.4296955, 0, 0, 0, 1, 1,
0.1041588, -0.2598232, 3.047936, 1, 1, 1, 1, 1,
0.1049164, -1.2499, 4.116395, 1, 1, 1, 1, 1,
0.1054226, -3.727867, 4.874982, 1, 1, 1, 1, 1,
0.1055406, 0.3086117, 0.101722, 1, 1, 1, 1, 1,
0.1112698, 0.3694182, 0.6391083, 1, 1, 1, 1, 1,
0.1135555, -1.20464, 3.05065, 1, 1, 1, 1, 1,
0.114254, -0.5388326, 2.994898, 1, 1, 1, 1, 1,
0.1150181, -0.7894313, 4.689109, 1, 1, 1, 1, 1,
0.1218884, 0.1355828, 0.8414032, 1, 1, 1, 1, 1,
0.1251298, 1.705094, -0.01651599, 1, 1, 1, 1, 1,
0.1260118, 0.9655667, -0.954907, 1, 1, 1, 1, 1,
0.1281414, 0.3397968, 1.70032, 1, 1, 1, 1, 1,
0.1300987, 1.715364, -1.237444, 1, 1, 1, 1, 1,
0.1364185, -0.1559073, 1.440814, 1, 1, 1, 1, 1,
0.1375147, 0.6656961, 1.515955, 1, 1, 1, 1, 1,
0.1379588, -1.477459, 3.594099, 0, 0, 1, 1, 1,
0.1412484, -1.272782, 4.597102, 1, 0, 0, 1, 1,
0.1452603, -0.5612848, 1.757712, 1, 0, 0, 1, 1,
0.1461057, -0.5876555, 2.834668, 1, 0, 0, 1, 1,
0.1487862, -0.8461772, 3.077344, 1, 0, 0, 1, 1,
0.1499498, -0.6160701, 5.233774, 1, 0, 0, 1, 1,
0.1507612, -1.889932, 2.618386, 0, 0, 0, 1, 1,
0.1518266, 2.340585, -0.6886408, 0, 0, 0, 1, 1,
0.1525168, 1.011413, 2.53976, 0, 0, 0, 1, 1,
0.155121, 0.7463544, 2.609914, 0, 0, 0, 1, 1,
0.1555036, 0.214064, 1.2743, 0, 0, 0, 1, 1,
0.1570543, 0.8469927, -0.6670462, 0, 0, 0, 1, 1,
0.1629362, -1.392805, 1.204108, 0, 0, 0, 1, 1,
0.1637561, -0.708692, 2.979378, 1, 1, 1, 1, 1,
0.1641903, 1.103043, 0.7436017, 1, 1, 1, 1, 1,
0.1685811, -0.452206, 2.079114, 1, 1, 1, 1, 1,
0.1718376, 1.235335, 0.0006656422, 1, 1, 1, 1, 1,
0.1727111, 0.2878659, -2.861655, 1, 1, 1, 1, 1,
0.1727214, -0.4933832, 2.494314, 1, 1, 1, 1, 1,
0.1769043, 0.4303222, 2.020231, 1, 1, 1, 1, 1,
0.180749, 0.1986393, 0.6725467, 1, 1, 1, 1, 1,
0.1815343, -0.372691, 2.575354, 1, 1, 1, 1, 1,
0.1840015, 0.986074, 2.841929, 1, 1, 1, 1, 1,
0.1857471, 1.204383, 0.2593448, 1, 1, 1, 1, 1,
0.1859952, 1.603496, -1.63958, 1, 1, 1, 1, 1,
0.1875623, 0.6190797, 1.579557, 1, 1, 1, 1, 1,
0.1903923, 1.483875, 0.7897879, 1, 1, 1, 1, 1,
0.1905696, 1.465287, -0.5274125, 1, 1, 1, 1, 1,
0.1932673, -0.49732, 2.230898, 0, 0, 1, 1, 1,
0.19905, 0.779351, -1.484942, 1, 0, 0, 1, 1,
0.1997536, -0.7430124, 3.537179, 1, 0, 0, 1, 1,
0.2046574, -0.5851763, 1.632586, 1, 0, 0, 1, 1,
0.2096266, -2.097244, 3.209457, 1, 0, 0, 1, 1,
0.2112342, 0.4810489, 1.431823, 1, 0, 0, 1, 1,
0.2147845, -2.062958, 2.114611, 0, 0, 0, 1, 1,
0.2162678, -1.53587, 3.525445, 0, 0, 0, 1, 1,
0.2168872, -0.3338013, 1.739952, 0, 0, 0, 1, 1,
0.218027, -0.3036334, 1.169568, 0, 0, 0, 1, 1,
0.2195911, 1.295685, -0.2775768, 0, 0, 0, 1, 1,
0.2198229, -1.099378, 2.144009, 0, 0, 0, 1, 1,
0.2213991, -0.6813534, 2.730641, 0, 0, 0, 1, 1,
0.2257551, 0.3364496, 0.6554472, 1, 1, 1, 1, 1,
0.2279129, 0.1749367, 1.289023, 1, 1, 1, 1, 1,
0.2281737, 0.1417291, 2.573849, 1, 1, 1, 1, 1,
0.2290164, 0.9618194, 0.145537, 1, 1, 1, 1, 1,
0.2292383, 0.0128015, 2.650049, 1, 1, 1, 1, 1,
0.238634, -0.5741864, 1.771322, 1, 1, 1, 1, 1,
0.2459183, 1.102824, 1.806652, 1, 1, 1, 1, 1,
0.2488152, -1.041968, 2.282859, 1, 1, 1, 1, 1,
0.2503268, 0.08415404, 0.8629937, 1, 1, 1, 1, 1,
0.2530122, -0.1591499, 4.717964, 1, 1, 1, 1, 1,
0.2535467, -2.067881, 3.948323, 1, 1, 1, 1, 1,
0.2561407, 0.6586297, 2.09005, 1, 1, 1, 1, 1,
0.2565484, 1.132095, 0.2076336, 1, 1, 1, 1, 1,
0.2570633, -0.02509209, 0.2692207, 1, 1, 1, 1, 1,
0.2670914, 1.762222, 2.656165, 1, 1, 1, 1, 1,
0.2707025, -0.08630788, 3.206565, 0, 0, 1, 1, 1,
0.2716457, -0.6987345, 1.650339, 1, 0, 0, 1, 1,
0.2770879, -0.1585236, 3.880025, 1, 0, 0, 1, 1,
0.2845564, 1.426939, 0.6661293, 1, 0, 0, 1, 1,
0.285168, -0.2522107, 3.124056, 1, 0, 0, 1, 1,
0.2859172, 0.2454531, 0.03070905, 1, 0, 0, 1, 1,
0.2961011, -1.643874, 4.286129, 0, 0, 0, 1, 1,
0.3000943, -0.5677541, 2.537362, 0, 0, 0, 1, 1,
0.3046883, 0.4990607, 1.564192, 0, 0, 0, 1, 1,
0.3072541, -0.5487894, 3.625963, 0, 0, 0, 1, 1,
0.3122667, 0.4908872, 1.212057, 0, 0, 0, 1, 1,
0.3123253, 0.4495904, 0.6651466, 0, 0, 0, 1, 1,
0.3142221, 0.3779631, 1.977177, 0, 0, 0, 1, 1,
0.3151854, -1.077778, 2.94201, 1, 1, 1, 1, 1,
0.3159299, -1.21204, 2.371307, 1, 1, 1, 1, 1,
0.3167494, -0.2921934, 2.020601, 1, 1, 1, 1, 1,
0.3169993, 1.273955, -1.132102, 1, 1, 1, 1, 1,
0.3198825, -0.8641155, 3.565093, 1, 1, 1, 1, 1,
0.3201678, 0.06826089, 1.649197, 1, 1, 1, 1, 1,
0.3224478, 0.3376021, 3.582699, 1, 1, 1, 1, 1,
0.3240898, -1.045964, 1.026578, 1, 1, 1, 1, 1,
0.3273705, 0.2654748, 1.177554, 1, 1, 1, 1, 1,
0.3343141, -0.8803925, 1.084498, 1, 1, 1, 1, 1,
0.3355867, 1.04423, 0.7475469, 1, 1, 1, 1, 1,
0.3367344, -0.115078, 1.911515, 1, 1, 1, 1, 1,
0.3368078, -1.070979, 5.253168, 1, 1, 1, 1, 1,
0.3413299, 0.2176628, 1.408292, 1, 1, 1, 1, 1,
0.3415038, -0.04487811, -0.08961986, 1, 1, 1, 1, 1,
0.3453268, 0.248484, 0.5247082, 0, 0, 1, 1, 1,
0.3455099, 0.3697309, 1.550434, 1, 0, 0, 1, 1,
0.3496073, 1.601682, -0.6828647, 1, 0, 0, 1, 1,
0.3530034, 0.7708032, 2.525714, 1, 0, 0, 1, 1,
0.3547706, 0.6343045, 0.04756872, 1, 0, 0, 1, 1,
0.3567702, 0.5263705, -1.513633, 1, 0, 0, 1, 1,
0.3590578, 1.429697, 1.452615, 0, 0, 0, 1, 1,
0.361848, 0.01751037, 1.517195, 0, 0, 0, 1, 1,
0.3642791, 0.09954032, 1.702706, 0, 0, 0, 1, 1,
0.3689432, 0.3470162, 1.632622, 0, 0, 0, 1, 1,
0.3714787, 0.8662189, 0.5291571, 0, 0, 0, 1, 1,
0.3723641, 0.0434138, 1.049258, 0, 0, 0, 1, 1,
0.3728994, -0.5367565, 1.875751, 0, 0, 0, 1, 1,
0.3775418, 1.885096, -1.259796, 1, 1, 1, 1, 1,
0.3787995, -0.7703369, 3.500678, 1, 1, 1, 1, 1,
0.3795929, 0.8448836, -0.02936482, 1, 1, 1, 1, 1,
0.3810694, -0.3380631, 5.076344, 1, 1, 1, 1, 1,
0.3812651, 1.207198, 0.421162, 1, 1, 1, 1, 1,
0.3816808, -0.8146695, 2.814301, 1, 1, 1, 1, 1,
0.394627, -1.471368, 4.357106, 1, 1, 1, 1, 1,
0.3999211, 1.073047, 0.3639408, 1, 1, 1, 1, 1,
0.4012648, 1.567023, 1.495461, 1, 1, 1, 1, 1,
0.4043905, 0.6834863, -0.004054583, 1, 1, 1, 1, 1,
0.4060096, 0.02110432, 1.668647, 1, 1, 1, 1, 1,
0.4090699, -0.1670536, 1.700452, 1, 1, 1, 1, 1,
0.4097751, -0.2348752, 0.8183061, 1, 1, 1, 1, 1,
0.4222696, -2.069413, 5.830672, 1, 1, 1, 1, 1,
0.4274903, -1.098985, 2.083773, 1, 1, 1, 1, 1,
0.4302943, 0.5864757, 0.8083315, 0, 0, 1, 1, 1,
0.4323066, 1.202884, 1.717849, 1, 0, 0, 1, 1,
0.4354684, -1.451935, 3.306155, 1, 0, 0, 1, 1,
0.4368112, 0.4160593, 0.1995498, 1, 0, 0, 1, 1,
0.4383696, 1.866966, -0.7951678, 1, 0, 0, 1, 1,
0.4415889, -0.7455941, 3.017992, 1, 0, 0, 1, 1,
0.441998, -0.9038633, 2.573759, 0, 0, 0, 1, 1,
0.442688, 0.9401139, 1.866554, 0, 0, 0, 1, 1,
0.458484, 0.7801189, 0.6415215, 0, 0, 0, 1, 1,
0.4597103, -0.577917, 3.792177, 0, 0, 0, 1, 1,
0.4642209, 0.03633314, 2.076079, 0, 0, 0, 1, 1,
0.4654714, -1.114304, 3.104349, 0, 0, 0, 1, 1,
0.4682374, 1.11537, 0.5126802, 0, 0, 0, 1, 1,
0.4701388, -0.1546966, 2.143233, 1, 1, 1, 1, 1,
0.4728879, 1.646609, 1.265779, 1, 1, 1, 1, 1,
0.4745681, 1.056718, 1.742376, 1, 1, 1, 1, 1,
0.4776838, 0.4456694, 1.028733, 1, 1, 1, 1, 1,
0.4801368, -0.7298672, 2.038544, 1, 1, 1, 1, 1,
0.482704, 0.01072073, 0.5478071, 1, 1, 1, 1, 1,
0.4838428, -0.6406648, 3.368756, 1, 1, 1, 1, 1,
0.4862306, 0.8660383, 1.908217, 1, 1, 1, 1, 1,
0.4902203, -1.592911, 3.432971, 1, 1, 1, 1, 1,
0.4905574, -0.3489436, 1.550982, 1, 1, 1, 1, 1,
0.4910861, 1.392574, -1.07292, 1, 1, 1, 1, 1,
0.4921896, -1.598784, 4.487198, 1, 1, 1, 1, 1,
0.4929319, 0.1208076, 1.212132, 1, 1, 1, 1, 1,
0.4940138, -0.1533162, 1.847183, 1, 1, 1, 1, 1,
0.5030234, -0.283754, 2.748172, 1, 1, 1, 1, 1,
0.5035227, -1.431214, 3.080034, 0, 0, 1, 1, 1,
0.5068569, -0.2396264, 1.71836, 1, 0, 0, 1, 1,
0.5109565, 0.2334204, 1.575136, 1, 0, 0, 1, 1,
0.5287567, -1.039427, 2.569494, 1, 0, 0, 1, 1,
0.5312307, -0.07909377, 3.280664, 1, 0, 0, 1, 1,
0.5337026, -0.873524, 2.431723, 1, 0, 0, 1, 1,
0.5339105, 1.913821, 0.6807367, 0, 0, 0, 1, 1,
0.534053, 1.735985, 0.4928263, 0, 0, 0, 1, 1,
0.5369284, 0.1526621, 1.472548, 0, 0, 0, 1, 1,
0.5403983, -0.1425661, 1.681472, 0, 0, 0, 1, 1,
0.5417547, -0.7165014, 2.837793, 0, 0, 0, 1, 1,
0.5419181, -0.3546398, 2.985222, 0, 0, 0, 1, 1,
0.5447919, -0.6858867, 1.882155, 0, 0, 0, 1, 1,
0.5461994, 0.9979434, 1.537437, 1, 1, 1, 1, 1,
0.5465497, -0.9985784, 2.243069, 1, 1, 1, 1, 1,
0.5550768, 0.7033771, 1.050505, 1, 1, 1, 1, 1,
0.5566691, 0.1019462, 0.9084805, 1, 1, 1, 1, 1,
0.5590723, -0.7587191, 0.9231585, 1, 1, 1, 1, 1,
0.5598448, 0.3482384, 0.6407119, 1, 1, 1, 1, 1,
0.562112, -1.799521, 1.21173, 1, 1, 1, 1, 1,
0.5654353, -0.5292992, 1.610503, 1, 1, 1, 1, 1,
0.5660992, -1.168073, 1.720554, 1, 1, 1, 1, 1,
0.5670529, 0.3733155, 0.8415437, 1, 1, 1, 1, 1,
0.5704707, -1.373772, 2.72852, 1, 1, 1, 1, 1,
0.5728561, -0.8063229, 1.78053, 1, 1, 1, 1, 1,
0.5746781, 0.001950995, 3.850673, 1, 1, 1, 1, 1,
0.5753707, -0.1336947, 1.074358, 1, 1, 1, 1, 1,
0.5789413, -0.4359924, 2.512382, 1, 1, 1, 1, 1,
0.5816491, -0.0839856, 2.915225, 0, 0, 1, 1, 1,
0.5868324, -2.398569, 3.428326, 1, 0, 0, 1, 1,
0.5887785, 0.2303264, 2.116517, 1, 0, 0, 1, 1,
0.5914353, -2.430032, 2.78106, 1, 0, 0, 1, 1,
0.5963041, 0.6342061, 0.7626103, 1, 0, 0, 1, 1,
0.599244, 0.01378807, -0.05302793, 1, 0, 0, 1, 1,
0.6016734, 1.08964, 0.6345437, 0, 0, 0, 1, 1,
0.606707, -1.045713, 1.562049, 0, 0, 0, 1, 1,
0.6090941, -0.462077, 2.292519, 0, 0, 0, 1, 1,
0.6155498, -1.760348, 2.175621, 0, 0, 0, 1, 1,
0.62019, 0.6311388, 0.7728318, 0, 0, 0, 1, 1,
0.6240633, 1.276054, -0.6701742, 0, 0, 0, 1, 1,
0.6267225, 0.9458514, -0.8048052, 0, 0, 0, 1, 1,
0.6332229, -0.5415813, 2.316275, 1, 1, 1, 1, 1,
0.6360477, -1.309126, 1.47178, 1, 1, 1, 1, 1,
0.6423419, -1.764994, 2.350379, 1, 1, 1, 1, 1,
0.6462309, 0.9040367, 0.1309635, 1, 1, 1, 1, 1,
0.6534312, 0.7186533, -0.1199911, 1, 1, 1, 1, 1,
0.6542552, 0.6453059, 0.08479437, 1, 1, 1, 1, 1,
0.6590774, -0.2201596, 1.915256, 1, 1, 1, 1, 1,
0.6614073, 0.241511, 1.313088, 1, 1, 1, 1, 1,
0.6671107, -0.5405934, 0.6518782, 1, 1, 1, 1, 1,
0.6678594, 0.9372923, -0.6430666, 1, 1, 1, 1, 1,
0.6725638, 1.908206, 0.07209672, 1, 1, 1, 1, 1,
0.6734487, -0.03696676, 1.015801, 1, 1, 1, 1, 1,
0.6809231, 1.238985, 1.266828, 1, 1, 1, 1, 1,
0.6867654, 0.1574288, 2.679579, 1, 1, 1, 1, 1,
0.6902283, -0.1125824, 0.8535023, 1, 1, 1, 1, 1,
0.6934716, 0.2473447, 1.224668, 0, 0, 1, 1, 1,
0.7000734, 0.1651604, 0.651333, 1, 0, 0, 1, 1,
0.7004609, -0.3743783, 0.6819186, 1, 0, 0, 1, 1,
0.7036958, 1.305621, -0.2027246, 1, 0, 0, 1, 1,
0.7068174, -0.2755436, 1.891388, 1, 0, 0, 1, 1,
0.7130896, 0.1501633, -0.2145815, 1, 0, 0, 1, 1,
0.7135447, -0.5825155, 1.037118, 0, 0, 0, 1, 1,
0.7144974, -1.04378, 0.09577852, 0, 0, 0, 1, 1,
0.715521, 0.06389631, 1.36797, 0, 0, 0, 1, 1,
0.7204466, 1.02211, 2.252294, 0, 0, 0, 1, 1,
0.7222709, -0.4619493, 2.356717, 0, 0, 0, 1, 1,
0.7248198, -0.0763066, 2.013695, 0, 0, 0, 1, 1,
0.7326323, -1.636816, 4.068394, 0, 0, 0, 1, 1,
0.7359435, 0.5718234, -0.05042371, 1, 1, 1, 1, 1,
0.7386498, 1.669733, 2.839421, 1, 1, 1, 1, 1,
0.7418231, -0.6497831, 3.337903, 1, 1, 1, 1, 1,
0.7428156, 0.7211122, 0.5010734, 1, 1, 1, 1, 1,
0.7480717, -1.780918, 3.049162, 1, 1, 1, 1, 1,
0.7483506, 1.010081, 1.077906, 1, 1, 1, 1, 1,
0.7527125, -1.223006, 1.296683, 1, 1, 1, 1, 1,
0.760739, 0.6767063, 1.615705, 1, 1, 1, 1, 1,
0.7630036, -2.398105, 1.442302, 1, 1, 1, 1, 1,
0.7684329, 0.7559935, 0.2866862, 1, 1, 1, 1, 1,
0.7805259, -0.3878477, 2.997633, 1, 1, 1, 1, 1,
0.8024402, 1.113841, 0.03366928, 1, 1, 1, 1, 1,
0.8046748, -0.88623, 1.2295, 1, 1, 1, 1, 1,
0.8051752, -0.8471263, 2.344403, 1, 1, 1, 1, 1,
0.8070986, -0.155225, 0.7301901, 1, 1, 1, 1, 1,
0.8106965, -3.094339, 4.265375, 0, 0, 1, 1, 1,
0.8149337, 0.7121542, 0.8753022, 1, 0, 0, 1, 1,
0.8151429, 0.291616, 1.94901, 1, 0, 0, 1, 1,
0.8167528, 0.8683608, 0.07536285, 1, 0, 0, 1, 1,
0.8197556, -1.481917, 4.277519, 1, 0, 0, 1, 1,
0.8204029, -1.343777, 2.018976, 1, 0, 0, 1, 1,
0.8212862, -1.610135, 2.505814, 0, 0, 0, 1, 1,
0.823037, 0.01523718, 1.115116, 0, 0, 0, 1, 1,
0.8273514, -0.7483996, 3.107223, 0, 0, 0, 1, 1,
0.8291604, 0.1708939, 3.723927, 0, 0, 0, 1, 1,
0.829779, 0.8574421, 1.135188, 0, 0, 0, 1, 1,
0.8325288, 0.9233684, 0.5330374, 0, 0, 0, 1, 1,
0.8371113, -1.012763, 1.222061, 0, 0, 0, 1, 1,
0.838035, 0.9127432, -0.559392, 1, 1, 1, 1, 1,
0.839686, 1.033402, 2.105215, 1, 1, 1, 1, 1,
0.8440214, 0.5979352, -0.1903251, 1, 1, 1, 1, 1,
0.8504332, -0.140236, 3.060387, 1, 1, 1, 1, 1,
0.8507812, -0.07656272, 3.049403, 1, 1, 1, 1, 1,
0.8529745, -0.7000384, 1.09355, 1, 1, 1, 1, 1,
0.8546262, 2.6823, 0.9732216, 1, 1, 1, 1, 1,
0.8573242, -1.264745, 2.988091, 1, 1, 1, 1, 1,
0.8628044, -0.1998569, 2.639102, 1, 1, 1, 1, 1,
0.864352, -1.79625, 3.983347, 1, 1, 1, 1, 1,
0.8671119, -1.074615, 3.056447, 1, 1, 1, 1, 1,
0.868248, -0.2588617, 1.375152, 1, 1, 1, 1, 1,
0.8702816, 0.1564315, 1.334148, 1, 1, 1, 1, 1,
0.8803007, -0.1637237, 2.769387, 1, 1, 1, 1, 1,
0.8803906, -1.495304, 4.079037, 1, 1, 1, 1, 1,
0.8822988, -1.187738, 4.038111, 0, 0, 1, 1, 1,
0.8826823, 0.4648781, 0.9138225, 1, 0, 0, 1, 1,
0.8922932, 0.7859157, 0.4597882, 1, 0, 0, 1, 1,
0.894573, -0.3695971, 1.877898, 1, 0, 0, 1, 1,
0.8981755, 0.1113947, 1.232105, 1, 0, 0, 1, 1,
0.8995976, -0.6086606, 0.9047032, 1, 0, 0, 1, 1,
0.9033987, -0.4073338, 1.653512, 0, 0, 0, 1, 1,
0.9100769, 0.4664092, 0.8946591, 0, 0, 0, 1, 1,
0.9112858, 0.3658345, 2.388036, 0, 0, 0, 1, 1,
0.9178725, 0.3271212, 0.07253461, 0, 0, 0, 1, 1,
0.9215941, -0.05295209, 1.30707, 0, 0, 0, 1, 1,
0.9217746, 2.247933, 2.950196, 0, 0, 0, 1, 1,
0.9399093, -1.845502, 1.34822, 0, 0, 0, 1, 1,
0.9415482, 0.6941966, 0.4326907, 1, 1, 1, 1, 1,
0.944654, 2.862169, 0.9357025, 1, 1, 1, 1, 1,
0.9449289, -0.06529083, 2.100364, 1, 1, 1, 1, 1,
0.9495237, -1.099896, 3.292327, 1, 1, 1, 1, 1,
0.9562004, 0.1486484, 0.4101473, 1, 1, 1, 1, 1,
0.9576386, 2.078908, -0.5539004, 1, 1, 1, 1, 1,
0.9661803, -0.4789911, 2.497395, 1, 1, 1, 1, 1,
0.9683035, -2.410667, 2.307788, 1, 1, 1, 1, 1,
0.9720986, 0.09384929, 2.537543, 1, 1, 1, 1, 1,
0.9803132, 0.4413532, 1.330011, 1, 1, 1, 1, 1,
0.9822216, -0.1977736, 0.3637314, 1, 1, 1, 1, 1,
0.9855781, 0.8277341, -0.9021112, 1, 1, 1, 1, 1,
0.9857973, -0.648116, 3.265066, 1, 1, 1, 1, 1,
0.9899583, 0.7361296, 1.124701, 1, 1, 1, 1, 1,
0.9937621, 0.9769755, -0.1165363, 1, 1, 1, 1, 1,
0.9965941, -0.5218179, 1.617466, 0, 0, 1, 1, 1,
0.9979025, -0.81681, 2.413419, 1, 0, 0, 1, 1,
0.997914, -0.366931, 1.784213, 1, 0, 0, 1, 1,
1.003972, -1.067589, 3.250645, 1, 0, 0, 1, 1,
1.007037, 0.8270219, 0.8870116, 1, 0, 0, 1, 1,
1.008917, -0.5208372, 0.7116119, 1, 0, 0, 1, 1,
1.011092, -1.100514, 1.962968, 0, 0, 0, 1, 1,
1.013445, 0.3587127, 2.115375, 0, 0, 0, 1, 1,
1.021741, -0.3505408, 1.908808, 0, 0, 0, 1, 1,
1.024464, -1.179399, 2.801117, 0, 0, 0, 1, 1,
1.027762, -0.2457177, 1.538655, 0, 0, 0, 1, 1,
1.031637, 1.09093, 2.665814, 0, 0, 0, 1, 1,
1.038286, 0.7545382, 0.521764, 0, 0, 0, 1, 1,
1.05264, 1.89274, 0.4471442, 1, 1, 1, 1, 1,
1.057427, 0.7500136, 0.319262, 1, 1, 1, 1, 1,
1.06227, -0.4752511, 1.379843, 1, 1, 1, 1, 1,
1.067963, -0.7057744, 0.7611031, 1, 1, 1, 1, 1,
1.073047, 0.7629245, 1.871003, 1, 1, 1, 1, 1,
1.074172, -1.003882, 3.13455, 1, 1, 1, 1, 1,
1.07523, -0.8759505, 2.29151, 1, 1, 1, 1, 1,
1.087158, 0.6926887, 1.324378, 1, 1, 1, 1, 1,
1.08885, 0.4469472, 0.2213715, 1, 1, 1, 1, 1,
1.092693, 0.7449347, 0.4390208, 1, 1, 1, 1, 1,
1.100142, -1.025817, 2.949589, 1, 1, 1, 1, 1,
1.106516, -0.0412984, 1.564631, 1, 1, 1, 1, 1,
1.110137, 1.417624, 1.572418, 1, 1, 1, 1, 1,
1.127253, -0.8068637, 0.5788251, 1, 1, 1, 1, 1,
1.141212, -0.5510597, 3.49353, 1, 1, 1, 1, 1,
1.143035, -0.6428226, 1.536595, 0, 0, 1, 1, 1,
1.143891, 1.579501, 1.129092, 1, 0, 0, 1, 1,
1.149973, 0.6166026, 1.596189, 1, 0, 0, 1, 1,
1.151536, 1.04264, 0.6762647, 1, 0, 0, 1, 1,
1.170102, 0.1985707, 0.4433669, 1, 0, 0, 1, 1,
1.172555, -0.1659588, 1.185094, 1, 0, 0, 1, 1,
1.179491, -0.5916237, -0.3188373, 0, 0, 0, 1, 1,
1.179524, 1.24763, 0.7034661, 0, 0, 0, 1, 1,
1.182566, 0.8153424, -0.0344127, 0, 0, 0, 1, 1,
1.185626, -0.9392192, 1.648042, 0, 0, 0, 1, 1,
1.188895, -0.6541173, 1.753528, 0, 0, 0, 1, 1,
1.202222, -0.04920386, 0.3221295, 0, 0, 0, 1, 1,
1.20356, -0.1891803, 1.268476, 0, 0, 0, 1, 1,
1.210978, -1.79629, 2.85375, 1, 1, 1, 1, 1,
1.216855, 0.6915367, 1.423261, 1, 1, 1, 1, 1,
1.228832, -1.536864, 3.017498, 1, 1, 1, 1, 1,
1.230895, 2.052932, -1.526288, 1, 1, 1, 1, 1,
1.245658, 0.589193, 1.653235, 1, 1, 1, 1, 1,
1.248846, -0.9252777, 2.986493, 1, 1, 1, 1, 1,
1.254791, -1.023674, 2.780874, 1, 1, 1, 1, 1,
1.25726, 2.888532, 0.3026447, 1, 1, 1, 1, 1,
1.257595, 0.3494778, 1.063427, 1, 1, 1, 1, 1,
1.272109, -1.249177, 1.718424, 1, 1, 1, 1, 1,
1.272567, -1.452921, 2.655508, 1, 1, 1, 1, 1,
1.280796, 1.729181, 2.62523, 1, 1, 1, 1, 1,
1.287143, 0.226273, 3.405368, 1, 1, 1, 1, 1,
1.297538, 1.022471, 1.312974, 1, 1, 1, 1, 1,
1.310207, 0.3602517, 2.440333, 1, 1, 1, 1, 1,
1.325473, 0.46071, 2.173431, 0, 0, 1, 1, 1,
1.332251, -0.395906, 2.680727, 1, 0, 0, 1, 1,
1.333722, -1.207098, 2.253009, 1, 0, 0, 1, 1,
1.336791, 0.16185, 1.199418, 1, 0, 0, 1, 1,
1.343259, 0.3869398, 1.325369, 1, 0, 0, 1, 1,
1.344667, 0.04760785, 1.698591, 1, 0, 0, 1, 1,
1.354991, -0.9079027, 1.472403, 0, 0, 0, 1, 1,
1.370063, 0.6588264, 1.346872, 0, 0, 0, 1, 1,
1.382143, 1.032842, 2.352148, 0, 0, 0, 1, 1,
1.389869, -0.6539987, 0.856366, 0, 0, 0, 1, 1,
1.39541, 0.0190681, 0.05911771, 0, 0, 0, 1, 1,
1.402143, 0.6925357, 1.329919, 0, 0, 0, 1, 1,
1.408698, 0.9966217, 1.613418, 0, 0, 0, 1, 1,
1.444351, 1.362935, 1.85185, 1, 1, 1, 1, 1,
1.454451, -0.6207398, 1.441199, 1, 1, 1, 1, 1,
1.454514, 0.2342155, 1.354456, 1, 1, 1, 1, 1,
1.45833, -0.9675082, 2.886904, 1, 1, 1, 1, 1,
1.465415, -0.3834839, 1.440661, 1, 1, 1, 1, 1,
1.491926, 0.5315437, 1.559906, 1, 1, 1, 1, 1,
1.50402, 0.6805087, -0.440872, 1, 1, 1, 1, 1,
1.510953, 0.325474, 1.234751, 1, 1, 1, 1, 1,
1.527111, -0.8363987, 1.175701, 1, 1, 1, 1, 1,
1.543669, 1.219507, 0.8916306, 1, 1, 1, 1, 1,
1.544324, -0.02876559, 1.147114, 1, 1, 1, 1, 1,
1.554287, -0.1798613, -0.4362757, 1, 1, 1, 1, 1,
1.556022, -2.252859, 1.479298, 1, 1, 1, 1, 1,
1.569803, 0.4326082, -0.2855675, 1, 1, 1, 1, 1,
1.580771, 1.128285, 2.66969, 1, 1, 1, 1, 1,
1.602545, 0.7873909, 2.710156, 0, 0, 1, 1, 1,
1.602731, 0.03394886, -0.4998794, 1, 0, 0, 1, 1,
1.613426, 1.419875, 1.108092, 1, 0, 0, 1, 1,
1.623302, -0.4535081, 1.362044, 1, 0, 0, 1, 1,
1.631201, 2.03713, 1.133609, 1, 0, 0, 1, 1,
1.636341, 0.006238543, 0.9520744, 1, 0, 0, 1, 1,
1.664081, -0.9193208, 2.372984, 0, 0, 0, 1, 1,
1.664482, -0.900165, 2.243597, 0, 0, 0, 1, 1,
1.666198, -1.50934, 2.688534, 0, 0, 0, 1, 1,
1.669763, -0.02991774, 1.9855, 0, 0, 0, 1, 1,
1.671266, -0.5926552, 2.650138, 0, 0, 0, 1, 1,
1.672855, 0.1624878, 2.884536, 0, 0, 0, 1, 1,
1.680578, -0.7043855, 2.10646, 0, 0, 0, 1, 1,
1.682709, -0.542204, 1.792514, 1, 1, 1, 1, 1,
1.684837, 1.610465, 1.383773, 1, 1, 1, 1, 1,
1.711368, 0.2081098, 1.395195, 1, 1, 1, 1, 1,
1.722698, 1.069683, 0.9864233, 1, 1, 1, 1, 1,
1.736053, -1.530653, 4.289745, 1, 1, 1, 1, 1,
1.746538, 0.5739528, 2.58448, 1, 1, 1, 1, 1,
1.753421, 0.9017923, 0.04696584, 1, 1, 1, 1, 1,
1.758937, -1.430023, 3.703354, 1, 1, 1, 1, 1,
1.75972, -0.3812156, 2.708626, 1, 1, 1, 1, 1,
1.762973, 1.257841, 2.395277, 1, 1, 1, 1, 1,
1.767252, 0.8263139, 0.2957357, 1, 1, 1, 1, 1,
1.779558, -0.04387093, 3.307122, 1, 1, 1, 1, 1,
1.790881, 1.215906, 2.163769, 1, 1, 1, 1, 1,
1.794218, -0.6392863, 1.643529, 1, 1, 1, 1, 1,
1.796122, -0.1909157, 2.41894, 1, 1, 1, 1, 1,
1.798261, -1.510531, 1.856311, 0, 0, 1, 1, 1,
1.836138, -1.592858, 2.59732, 1, 0, 0, 1, 1,
1.87229, 0.1130584, 1.908642, 1, 0, 0, 1, 1,
1.873698, -0.8008482, 2.831296, 1, 0, 0, 1, 1,
1.875443, 1.730059, 0.255759, 1, 0, 0, 1, 1,
1.877926, 0.5569372, 1.707042, 1, 0, 0, 1, 1,
1.898941, 1.96236, -0.1442891, 0, 0, 0, 1, 1,
1.922912, 2.099762, 1.058227, 0, 0, 0, 1, 1,
1.926763, 0.3830605, 2.114806, 0, 0, 0, 1, 1,
1.936862, -1.513414, 0.7442234, 0, 0, 0, 1, 1,
1.96139, 0.004853209, 3.337672, 0, 0, 0, 1, 1,
1.968483, 0.3356526, 2.645172, 0, 0, 0, 1, 1,
1.972476, 1.650053, 0.1346832, 0, 0, 0, 1, 1,
2.00036, -0.2358203, 3.643561, 1, 1, 1, 1, 1,
2.003542, -0.0622303, 3.341534, 1, 1, 1, 1, 1,
2.034734, 0.4285901, 3.447396, 1, 1, 1, 1, 1,
2.038863, -0.1495774, 2.270144, 1, 1, 1, 1, 1,
2.054983, 1.619935, 1.954076, 1, 1, 1, 1, 1,
2.081846, -0.9665472, 1.120753, 1, 1, 1, 1, 1,
2.113777, 1.058555, 1.36945, 1, 1, 1, 1, 1,
2.133384, -0.5574768, -0.04942884, 1, 1, 1, 1, 1,
2.147679, 1.711676, -0.08712532, 1, 1, 1, 1, 1,
2.159682, -0.8468071, 3.152481, 1, 1, 1, 1, 1,
2.185193, -1.727454, 3.050259, 1, 1, 1, 1, 1,
2.190333, 1.39175, 1.606048, 1, 1, 1, 1, 1,
2.214068, -0.7601293, 3.420608, 1, 1, 1, 1, 1,
2.21713, 0.5824612, 2.010439, 1, 1, 1, 1, 1,
2.230046, -1.396702, 2.368634, 1, 1, 1, 1, 1,
2.259511, -0.702389, 1.13162, 0, 0, 1, 1, 1,
2.263059, -0.3469026, 1.893193, 1, 0, 0, 1, 1,
2.264746, 0.2147739, 2.267541, 1, 0, 0, 1, 1,
2.273728, -0.7128552, 0.8087093, 1, 0, 0, 1, 1,
2.278472, -0.7120835, 1.952572, 1, 0, 0, 1, 1,
2.279487, -0.6746603, 2.078253, 1, 0, 0, 1, 1,
2.297241, -0.8538508, 2.040777, 0, 0, 0, 1, 1,
2.329799, 2.43045, 1.569818, 0, 0, 0, 1, 1,
2.349559, 0.03089473, 0.9308477, 0, 0, 0, 1, 1,
2.394378, -0.1333525, 2.941636, 0, 0, 0, 1, 1,
2.47898, -0.1357535, 3.488147, 0, 0, 0, 1, 1,
2.52382, 1.426499, 3.342934, 0, 0, 0, 1, 1,
2.621356, -2.474275, 2.827639, 0, 0, 0, 1, 1,
2.699326, -0.3629962, 2.484241, 1, 1, 1, 1, 1,
2.725934, 0.8837784, 2.726693, 1, 1, 1, 1, 1,
2.965278, 0.5198331, 2.448518, 1, 1, 1, 1, 1,
3.134855, 0.2473981, -0.4040702, 1, 1, 1, 1, 1,
3.188695, 0.448326, 3.101015, 1, 1, 1, 1, 1,
3.200471, -0.2009009, 1.422473, 1, 1, 1, 1, 1,
3.683528, 0.9168706, 0.7608225, 1, 1, 1, 1, 1
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
var radius = 10.00624;
var distance = 35.1465;
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
mvMatrix.translate( -0.04316759, 0.289016, -0.3877318 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1465);
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