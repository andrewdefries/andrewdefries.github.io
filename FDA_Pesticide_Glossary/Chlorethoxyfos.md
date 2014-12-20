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
-3.393553, 0.579035, -2.976112, 1, 0, 0, 1,
-3.042256, -0.09399615, -0.7558234, 1, 0.007843138, 0, 1,
-2.770575, 0.5089058, -0.07592169, 1, 0.01176471, 0, 1,
-2.752373, -0.8511, -0.5953102, 1, 0.01960784, 0, 1,
-2.467138, 0.7387036, -4.022163, 1, 0.02352941, 0, 1,
-2.432924, 0.4439074, -2.096209, 1, 0.03137255, 0, 1,
-2.410876, 0.939989, -3.521295, 1, 0.03529412, 0, 1,
-2.303447, 0.6252301, -0.6424004, 1, 0.04313726, 0, 1,
-2.298387, 0.02484766, -2.286891, 1, 0.04705882, 0, 1,
-2.27062, -2.046631, -3.02343, 1, 0.05490196, 0, 1,
-2.261304, -0.7226114, -0.467228, 1, 0.05882353, 0, 1,
-2.25583, -0.1013918, -1.028152, 1, 0.06666667, 0, 1,
-2.244852, -0.6057321, -1.017228, 1, 0.07058824, 0, 1,
-2.214463, 0.2655033, -2.93884, 1, 0.07843138, 0, 1,
-2.166342, -1.091226, -2.205711, 1, 0.08235294, 0, 1,
-2.145206, 0.4564233, 0.06934445, 1, 0.09019608, 0, 1,
-2.141963, -0.1078417, -1.81602, 1, 0.09411765, 0, 1,
-2.104681, -0.5064155, -2.147085, 1, 0.1019608, 0, 1,
-2.078471, -1.192535, -2.172715, 1, 0.1098039, 0, 1,
-2.075901, -1.887208, -2.772049, 1, 0.1137255, 0, 1,
-2.068292, 0.3365015, -2.868, 1, 0.1215686, 0, 1,
-1.997955, 0.243213, -0.7326764, 1, 0.1254902, 0, 1,
-1.976494, 0.6864132, -0.03595403, 1, 0.1333333, 0, 1,
-1.95492, 1.557835, -1.512653, 1, 0.1372549, 0, 1,
-1.951253, 1.499157, -1.741423, 1, 0.145098, 0, 1,
-1.941963, 0.2918445, -1.326095, 1, 0.1490196, 0, 1,
-1.923506, 1.099845, -2.578958, 1, 0.1568628, 0, 1,
-1.9162, 1.906717, -0.5498484, 1, 0.1607843, 0, 1,
-1.873679, -0.0131435, -0.9257193, 1, 0.1686275, 0, 1,
-1.864905, -0.960547, -1.789562, 1, 0.172549, 0, 1,
-1.860294, 1.157388, -0.9502579, 1, 0.1803922, 0, 1,
-1.85884, 0.2576961, -1.422822, 1, 0.1843137, 0, 1,
-1.848541, -0.3450887, -1.848133, 1, 0.1921569, 0, 1,
-1.831751, -0.8466516, -2.196901, 1, 0.1960784, 0, 1,
-1.809832, -1.474411, -2.558962, 1, 0.2039216, 0, 1,
-1.796268, 0.115862, -0.5174336, 1, 0.2117647, 0, 1,
-1.792503, 0.5843244, -2.574117, 1, 0.2156863, 0, 1,
-1.791574, 0.09248681, -3.317749, 1, 0.2235294, 0, 1,
-1.790194, 0.710032, -3.360568, 1, 0.227451, 0, 1,
-1.78836, -1.424605, -1.528327, 1, 0.2352941, 0, 1,
-1.787847, -0.5874659, -1.611685, 1, 0.2392157, 0, 1,
-1.783056, 1.522528, 1.762795, 1, 0.2470588, 0, 1,
-1.766218, 0.9138949, -1.145319, 1, 0.2509804, 0, 1,
-1.762537, 1.076852, -2.960268, 1, 0.2588235, 0, 1,
-1.760746, 0.58881, -0.8961946, 1, 0.2627451, 0, 1,
-1.75647, 0.9954731, -2.735532, 1, 0.2705882, 0, 1,
-1.748964, -1.599904, -2.546836, 1, 0.2745098, 0, 1,
-1.747117, -1.060567, -2.165208, 1, 0.282353, 0, 1,
-1.740235, -0.1055509, -0.05652602, 1, 0.2862745, 0, 1,
-1.731621, -0.8074496, -1.930863, 1, 0.2941177, 0, 1,
-1.72635, -1.073405, -2.805092, 1, 0.3019608, 0, 1,
-1.725019, -1.540024, -2.289642, 1, 0.3058824, 0, 1,
-1.721854, -1.346868, -3.133005, 1, 0.3137255, 0, 1,
-1.708939, 1.106253, -1.312151, 1, 0.3176471, 0, 1,
-1.695778, 0.821871, -1.797569, 1, 0.3254902, 0, 1,
-1.69346, -0.5165685, -2.43451, 1, 0.3294118, 0, 1,
-1.682054, -1.718912, -2.655468, 1, 0.3372549, 0, 1,
-1.680059, -0.3920046, -0.3569415, 1, 0.3411765, 0, 1,
-1.663668, -0.08315832, -2.231794, 1, 0.3490196, 0, 1,
-1.655119, 0.01321119, -0.9489253, 1, 0.3529412, 0, 1,
-1.640836, -0.4288914, -3.557049, 1, 0.3607843, 0, 1,
-1.620749, -1.080472, -1.091742, 1, 0.3647059, 0, 1,
-1.605659, 0.1944903, -2.627936, 1, 0.372549, 0, 1,
-1.60201, 0.6039939, -1.35993, 1, 0.3764706, 0, 1,
-1.600755, -1.10835, -2.090894, 1, 0.3843137, 0, 1,
-1.588551, -0.2864947, -2.24906, 1, 0.3882353, 0, 1,
-1.587442, 0.1124745, -1.472717, 1, 0.3960784, 0, 1,
-1.579846, 0.7511847, -1.964636, 1, 0.4039216, 0, 1,
-1.572963, -0.5220965, -1.502939, 1, 0.4078431, 0, 1,
-1.549827, -0.2829767, -1.599896, 1, 0.4156863, 0, 1,
-1.546804, -0.4556649, -0.4669135, 1, 0.4196078, 0, 1,
-1.545263, 0.7298692, 1.398439, 1, 0.427451, 0, 1,
-1.537078, -0.692542, -1.824946, 1, 0.4313726, 0, 1,
-1.536016, 0.2621247, -1.021899, 1, 0.4392157, 0, 1,
-1.533977, -0.658561, -0.8187943, 1, 0.4431373, 0, 1,
-1.530464, -0.3022543, -0.8864686, 1, 0.4509804, 0, 1,
-1.52512, 0.05219233, -0.3742678, 1, 0.454902, 0, 1,
-1.518297, 0.8961067, 0.08490205, 1, 0.4627451, 0, 1,
-1.517676, -0.4123759, -1.622296, 1, 0.4666667, 0, 1,
-1.498731, -0.9135383, -0.9909598, 1, 0.4745098, 0, 1,
-1.498119, 0.6295153, -2.401827, 1, 0.4784314, 0, 1,
-1.485746, 0.5977587, -0.8219331, 1, 0.4862745, 0, 1,
-1.477036, -0.03960137, -1.468437, 1, 0.4901961, 0, 1,
-1.475135, 1.32896, -0.9588879, 1, 0.4980392, 0, 1,
-1.472908, 2.417109, -0.01035897, 1, 0.5058824, 0, 1,
-1.444181, -0.4174021, 0.3885869, 1, 0.509804, 0, 1,
-1.443734, -0.1917285, -2.248218, 1, 0.5176471, 0, 1,
-1.433257, 1.115339, -0.2451921, 1, 0.5215687, 0, 1,
-1.418874, -0.5555418, -2.45206, 1, 0.5294118, 0, 1,
-1.410242, 0.7718843, -2.217863, 1, 0.5333334, 0, 1,
-1.406368, 2.026875, -0.6659971, 1, 0.5411765, 0, 1,
-1.397411, -0.1428083, -2.952789, 1, 0.5450981, 0, 1,
-1.394471, -1.56677, -3.057519, 1, 0.5529412, 0, 1,
-1.38993, -0.002697082, -1.302755, 1, 0.5568628, 0, 1,
-1.388596, 1.999896, -1.608641, 1, 0.5647059, 0, 1,
-1.388144, -0.5682287, -1.299091, 1, 0.5686275, 0, 1,
-1.386834, -0.4338468, -2.155118, 1, 0.5764706, 0, 1,
-1.383088, 0.2623085, -0.4124663, 1, 0.5803922, 0, 1,
-1.376775, 1.735807, 0.7547817, 1, 0.5882353, 0, 1,
-1.370301, -0.09855438, -1.130754, 1, 0.5921569, 0, 1,
-1.365447, -0.262573, -1.301077, 1, 0.6, 0, 1,
-1.365198, 0.7277648, 0.1261224, 1, 0.6078432, 0, 1,
-1.364391, 2.459736, -2.251037, 1, 0.6117647, 0, 1,
-1.359934, -0.9097078, -3.379647, 1, 0.6196079, 0, 1,
-1.353118, -1.318179, -1.987763, 1, 0.6235294, 0, 1,
-1.345415, 0.44289, -1.597159, 1, 0.6313726, 0, 1,
-1.338147, -1.699795, -2.540293, 1, 0.6352941, 0, 1,
-1.327022, -0.0568075, -1.132494, 1, 0.6431373, 0, 1,
-1.31866, -0.4040481, -4.531217, 1, 0.6470588, 0, 1,
-1.318106, -1.09731, -3.568683, 1, 0.654902, 0, 1,
-1.317022, -0.7051429, -2.074477, 1, 0.6588235, 0, 1,
-1.304848, 0.2597311, 0.2376579, 1, 0.6666667, 0, 1,
-1.300913, -0.05311958, -2.718815, 1, 0.6705883, 0, 1,
-1.30083, 0.1512088, -1.159815, 1, 0.6784314, 0, 1,
-1.295113, -0.7872725, -2.091899, 1, 0.682353, 0, 1,
-1.294423, -1.341451, -2.566266, 1, 0.6901961, 0, 1,
-1.292914, -2.635592, -3.135916, 1, 0.6941177, 0, 1,
-1.286094, -0.2930665, -3.435101, 1, 0.7019608, 0, 1,
-1.283833, 0.05865973, -0.9863555, 1, 0.7098039, 0, 1,
-1.274888, 1.055544, 0.2391535, 1, 0.7137255, 0, 1,
-1.270506, -1.329141, -1.530274, 1, 0.7215686, 0, 1,
-1.264763, 0.8380263, -0.6530985, 1, 0.7254902, 0, 1,
-1.263431, -0.3722382, -1.240261, 1, 0.7333333, 0, 1,
-1.258638, -1.448143, -0.8730575, 1, 0.7372549, 0, 1,
-1.25513, 0.01105643, -1.926284, 1, 0.7450981, 0, 1,
-1.250704, 0.5166522, -2.226525, 1, 0.7490196, 0, 1,
-1.249123, -1.54797, -1.099658, 1, 0.7568628, 0, 1,
-1.242009, -0.1552327, -1.560585, 1, 0.7607843, 0, 1,
-1.235098, -0.6574038, -3.027986, 1, 0.7686275, 0, 1,
-1.22943, -0.6966171, -2.07601, 1, 0.772549, 0, 1,
-1.228567, 0.3582572, -1.124382, 1, 0.7803922, 0, 1,
-1.227455, 0.5639365, -2.267346, 1, 0.7843137, 0, 1,
-1.22187, -0.1328009, -2.025779, 1, 0.7921569, 0, 1,
-1.22104, 0.08071376, -1.535335, 1, 0.7960784, 0, 1,
-1.203855, 0.2982782, -2.245829, 1, 0.8039216, 0, 1,
-1.203699, 0.368308, -2.02221, 1, 0.8117647, 0, 1,
-1.195977, -0.02637108, -4.329659, 1, 0.8156863, 0, 1,
-1.190995, -1.18656, -2.429437, 1, 0.8235294, 0, 1,
-1.184099, 1.294989, -1.446952, 1, 0.827451, 0, 1,
-1.183932, 0.08852483, -1.413674, 1, 0.8352941, 0, 1,
-1.178182, 2.596586, -1.226791, 1, 0.8392157, 0, 1,
-1.17585, 1.020633, -0.8358189, 1, 0.8470588, 0, 1,
-1.175846, 0.6223465, 0.6226333, 1, 0.8509804, 0, 1,
-1.173608, -1.356376, -2.689009, 1, 0.8588235, 0, 1,
-1.170337, -0.7092419, -4.161621, 1, 0.8627451, 0, 1,
-1.168115, 1.063444, -1.187578, 1, 0.8705882, 0, 1,
-1.165064, 1.275259, 1.037342, 1, 0.8745098, 0, 1,
-1.152188, -0.6684902, -1.916423, 1, 0.8823529, 0, 1,
-1.138248, -0.3924153, -1.401975, 1, 0.8862745, 0, 1,
-1.136495, -0.1832514, -2.925594, 1, 0.8941177, 0, 1,
-1.135664, -0.2680523, -1.703042, 1, 0.8980392, 0, 1,
-1.13396, -0.7403646, -2.023934, 1, 0.9058824, 0, 1,
-1.123031, 0.06037362, -2.091804, 1, 0.9137255, 0, 1,
-1.113443, -0.4018673, -1.369406, 1, 0.9176471, 0, 1,
-1.111987, 0.8361177, -0.8024029, 1, 0.9254902, 0, 1,
-1.104311, -1.112056, -3.632756, 1, 0.9294118, 0, 1,
-1.090309, 1.184076, 0.6547806, 1, 0.9372549, 0, 1,
-1.087751, -1.117107, -3.162634, 1, 0.9411765, 0, 1,
-1.087432, -0.9724668, -1.632685, 1, 0.9490196, 0, 1,
-1.084055, 0.8996127, 1.810259, 1, 0.9529412, 0, 1,
-1.081547, -0.7253948, -2.321504, 1, 0.9607843, 0, 1,
-1.074342, -1.353978, -2.029699, 1, 0.9647059, 0, 1,
-1.055411, 0.9547685, 0.006064904, 1, 0.972549, 0, 1,
-1.053149, -1.425706, -0.5426736, 1, 0.9764706, 0, 1,
-1.051085, -0.01882404, -0.9856451, 1, 0.9843137, 0, 1,
-1.042434, -1.379862, -3.577449, 1, 0.9882353, 0, 1,
-1.034512, -0.2665354, -1.615362, 1, 0.9960784, 0, 1,
-1.03267, 0.3723952, 0.447444, 0.9960784, 1, 0, 1,
-1.023437, 0.1969046, -2.345481, 0.9921569, 1, 0, 1,
-1.020259, -1.163548, -2.596142, 0.9843137, 1, 0, 1,
-1.015414, 0.08376652, -1.088753, 0.9803922, 1, 0, 1,
-1.000836, 0.3616958, -1.200209, 0.972549, 1, 0, 1,
-0.9984047, 1.499218, 1.381855, 0.9686275, 1, 0, 1,
-0.9931523, 1.770036, 0.5819939, 0.9607843, 1, 0, 1,
-0.9902808, 0.5162655, 0.5963143, 0.9568627, 1, 0, 1,
-0.9902107, 0.2343526, 0.5047535, 0.9490196, 1, 0, 1,
-0.986699, -0.5548542, -1.472482, 0.945098, 1, 0, 1,
-0.9858777, -1.554232, -1.842501, 0.9372549, 1, 0, 1,
-0.9740685, 0.2109541, -1.943034, 0.9333333, 1, 0, 1,
-0.9708523, -0.4899217, -0.8217915, 0.9254902, 1, 0, 1,
-0.9649861, -0.86433, -0.5824431, 0.9215686, 1, 0, 1,
-0.9648601, 0.07761365, -2.722607, 0.9137255, 1, 0, 1,
-0.9644855, 0.006882063, -0.6972974, 0.9098039, 1, 0, 1,
-0.9629602, -0.03932932, -0.9700814, 0.9019608, 1, 0, 1,
-0.9525082, -1.388685, -2.277937, 0.8941177, 1, 0, 1,
-0.9521598, -0.1273337, -3.341473, 0.8901961, 1, 0, 1,
-0.9407354, -0.9872503, -0.5183909, 0.8823529, 1, 0, 1,
-0.936234, -0.4082235, -2.175983, 0.8784314, 1, 0, 1,
-0.9343162, -0.183807, -2.160324, 0.8705882, 1, 0, 1,
-0.9331545, 1.524318, 0.2252645, 0.8666667, 1, 0, 1,
-0.9306493, -0.1918098, -0.7140289, 0.8588235, 1, 0, 1,
-0.9294283, 0.4313791, -1.285196, 0.854902, 1, 0, 1,
-0.9179521, -1.708207, -1.633282, 0.8470588, 1, 0, 1,
-0.9156467, 0.4285787, -1.495348, 0.8431373, 1, 0, 1,
-0.8806067, -0.3410936, -2.697322, 0.8352941, 1, 0, 1,
-0.8730797, -0.8229551, -1.06477, 0.8313726, 1, 0, 1,
-0.864498, -0.08957516, -2.308713, 0.8235294, 1, 0, 1,
-0.8617654, -2.237956, -3.630377, 0.8196079, 1, 0, 1,
-0.8545768, -0.09867881, -0.9988692, 0.8117647, 1, 0, 1,
-0.8542404, -0.4782251, -1.566164, 0.8078431, 1, 0, 1,
-0.8529907, 0.3227077, 0.33992, 0.8, 1, 0, 1,
-0.8518378, -1.102556, -3.018073, 0.7921569, 1, 0, 1,
-0.8419051, 2.344826, -1.170697, 0.7882353, 1, 0, 1,
-0.8390448, 0.8170581, -2.246416, 0.7803922, 1, 0, 1,
-0.8356915, 1.401839, -0.3131606, 0.7764706, 1, 0, 1,
-0.8323061, -1.923164, -4.7143, 0.7686275, 1, 0, 1,
-0.8284738, -1.865916, -2.743419, 0.7647059, 1, 0, 1,
-0.8278848, 0.6700395, -0.2602429, 0.7568628, 1, 0, 1,
-0.8275408, 0.5356461, -2.95125, 0.7529412, 1, 0, 1,
-0.8250071, -1.198159, -2.988481, 0.7450981, 1, 0, 1,
-0.8221925, -1.158397, -3.66249, 0.7411765, 1, 0, 1,
-0.8187559, 0.07702406, -1.81727, 0.7333333, 1, 0, 1,
-0.8133483, -0.1998883, -0.6679953, 0.7294118, 1, 0, 1,
-0.8131968, -2.535118, -3.97186, 0.7215686, 1, 0, 1,
-0.8023108, 0.5976998, -0.1531167, 0.7176471, 1, 0, 1,
-0.8003455, 0.4168222, -1.131786, 0.7098039, 1, 0, 1,
-0.7990862, -0.0679495, 0.0619594, 0.7058824, 1, 0, 1,
-0.7980003, 0.1241039, -1.59753, 0.6980392, 1, 0, 1,
-0.7960032, -0.8114247, -2.773124, 0.6901961, 1, 0, 1,
-0.7915124, 1.189037, 0.5857629, 0.6862745, 1, 0, 1,
-0.7908529, -0.7646428, -1.224524, 0.6784314, 1, 0, 1,
-0.7905716, 1.073099, -1.023325, 0.6745098, 1, 0, 1,
-0.7842835, 0.3806541, -1.663996, 0.6666667, 1, 0, 1,
-0.7672053, -1.312994, -2.032765, 0.6627451, 1, 0, 1,
-0.7644978, -0.2930872, -0.6837617, 0.654902, 1, 0, 1,
-0.762217, 0.04621455, -1.217029, 0.6509804, 1, 0, 1,
-0.7587593, -1.018157, -3.629673, 0.6431373, 1, 0, 1,
-0.7584556, -0.6491134, -1.312043, 0.6392157, 1, 0, 1,
-0.7552137, 1.645644, -0.01881553, 0.6313726, 1, 0, 1,
-0.7386521, -0.2546852, -0.5127288, 0.627451, 1, 0, 1,
-0.7339535, -0.6935149, -2.415497, 0.6196079, 1, 0, 1,
-0.7316702, 1.080213, -0.2046964, 0.6156863, 1, 0, 1,
-0.7315381, -2.047049, -2.705975, 0.6078432, 1, 0, 1,
-0.730106, 0.09866209, -1.76489, 0.6039216, 1, 0, 1,
-0.7279706, 0.960715, 1.141262, 0.5960785, 1, 0, 1,
-0.720639, -0.1274778, -0.8360485, 0.5882353, 1, 0, 1,
-0.7134449, 1.146121, 1.835533, 0.5843138, 1, 0, 1,
-0.7082862, 0.6189265, 0.6032435, 0.5764706, 1, 0, 1,
-0.7079718, 2.328082, 0.9047899, 0.572549, 1, 0, 1,
-0.7076787, 1.23539, 0.1526882, 0.5647059, 1, 0, 1,
-0.7071897, -1.561584, -2.919122, 0.5607843, 1, 0, 1,
-0.7065154, -1.606115, -2.3407, 0.5529412, 1, 0, 1,
-0.7017027, 0.461114, -0.558468, 0.5490196, 1, 0, 1,
-0.6983643, 1.123217, -0.6126415, 0.5411765, 1, 0, 1,
-0.6954886, 0.5292221, -0.1663577, 0.5372549, 1, 0, 1,
-0.6946324, -0.474105, -3.904517, 0.5294118, 1, 0, 1,
-0.691557, -0.6719545, -3.682854, 0.5254902, 1, 0, 1,
-0.6831444, -1.65424, -2.143803, 0.5176471, 1, 0, 1,
-0.6791461, -0.5374257, -2.587326, 0.5137255, 1, 0, 1,
-0.6790419, 0.3379503, -1.618251, 0.5058824, 1, 0, 1,
-0.6708887, -0.6757704, -4.023335, 0.5019608, 1, 0, 1,
-0.6597355, 0.2556234, -0.4917564, 0.4941176, 1, 0, 1,
-0.6572394, 1.453621, 0.3844779, 0.4862745, 1, 0, 1,
-0.6544273, -0.4875627, -1.827009, 0.4823529, 1, 0, 1,
-0.6543378, -0.7093025, -0.4489569, 0.4745098, 1, 0, 1,
-0.6488236, 0.5794893, -0.7087831, 0.4705882, 1, 0, 1,
-0.6483094, 0.2208254, -2.202794, 0.4627451, 1, 0, 1,
-0.6398771, 0.2352757, -0.3631643, 0.4588235, 1, 0, 1,
-0.6371383, -0.6313172, -3.617327, 0.4509804, 1, 0, 1,
-0.6369063, -0.1290093, -0.7818948, 0.4470588, 1, 0, 1,
-0.633935, -0.4020825, -1.092568, 0.4392157, 1, 0, 1,
-0.6269866, -0.970753, -1.589142, 0.4352941, 1, 0, 1,
-0.6261398, -1.082536, -2.617807, 0.427451, 1, 0, 1,
-0.6242126, -1.254519, -2.946115, 0.4235294, 1, 0, 1,
-0.6241916, 0.9442887, 0.4398066, 0.4156863, 1, 0, 1,
-0.6233398, -0.7507265, -4.552034, 0.4117647, 1, 0, 1,
-0.6204737, -0.3705938, -3.259911, 0.4039216, 1, 0, 1,
-0.6203398, -0.1826022, -2.92642, 0.3960784, 1, 0, 1,
-0.6202447, -1.89128, -2.461438, 0.3921569, 1, 0, 1,
-0.6160676, 1.735429, 0.04432499, 0.3843137, 1, 0, 1,
-0.615967, -0.3280642, -1.304275, 0.3803922, 1, 0, 1,
-0.6120698, 1.012895, -1.670696, 0.372549, 1, 0, 1,
-0.6109592, 0.4590098, 0.1658971, 0.3686275, 1, 0, 1,
-0.6071576, -2.068492, -2.788846, 0.3607843, 1, 0, 1,
-0.6050792, -0.66115, -3.066777, 0.3568628, 1, 0, 1,
-0.5997087, -0.5270232, -0.8863949, 0.3490196, 1, 0, 1,
-0.5993802, -0.9218853, -3.138422, 0.345098, 1, 0, 1,
-0.598914, -0.02168015, -1.909673, 0.3372549, 1, 0, 1,
-0.5983832, -0.290348, -0.8073798, 0.3333333, 1, 0, 1,
-0.5846992, 1.229009, -2.493948, 0.3254902, 1, 0, 1,
-0.5754688, -1.596596, -2.511117, 0.3215686, 1, 0, 1,
-0.5742859, 0.7516591, -0.4245723, 0.3137255, 1, 0, 1,
-0.5711201, 1.18336, -0.7227202, 0.3098039, 1, 0, 1,
-0.5655838, -0.4146095, -3.441777, 0.3019608, 1, 0, 1,
-0.564582, 0.4350868, 0.2703831, 0.2941177, 1, 0, 1,
-0.5548875, 1.209719, -0.5984563, 0.2901961, 1, 0, 1,
-0.5503915, -0.1400819, -1.913106, 0.282353, 1, 0, 1,
-0.550268, -0.5283844, -2.156869, 0.2784314, 1, 0, 1,
-0.5487955, -0.8841763, -1.740564, 0.2705882, 1, 0, 1,
-0.5484095, -0.1620883, -2.436997, 0.2666667, 1, 0, 1,
-0.537494, 1.056076, -1.998772, 0.2588235, 1, 0, 1,
-0.5340761, -1.117525, -2.478763, 0.254902, 1, 0, 1,
-0.5324507, 0.004104742, -0.3505333, 0.2470588, 1, 0, 1,
-0.5301297, 1.900847, -1.007028, 0.2431373, 1, 0, 1,
-0.5298983, -0.2669899, -0.4430673, 0.2352941, 1, 0, 1,
-0.5296412, -1.55067, -1.777045, 0.2313726, 1, 0, 1,
-0.5295865, 0.7695485, -0.5767359, 0.2235294, 1, 0, 1,
-0.5281082, -0.2253308, -0.5802293, 0.2196078, 1, 0, 1,
-0.5223589, -1.606118, -3.992963, 0.2117647, 1, 0, 1,
-0.52041, 0.9848506, 0.2467033, 0.2078431, 1, 0, 1,
-0.5145783, 0.06496807, -3.597305, 0.2, 1, 0, 1,
-0.5134575, -0.8895719, -3.870871, 0.1921569, 1, 0, 1,
-0.5023904, 0.1447067, -2.104398, 0.1882353, 1, 0, 1,
-0.4975134, 0.6699435, 0.5038279, 0.1803922, 1, 0, 1,
-0.4963331, 0.04216908, -1.361875, 0.1764706, 1, 0, 1,
-0.4939999, 0.5398527, 0.2946242, 0.1686275, 1, 0, 1,
-0.4939126, -0.8989732, -2.425107, 0.1647059, 1, 0, 1,
-0.4921221, -0.3526924, -0.992916, 0.1568628, 1, 0, 1,
-0.4901656, 0.3451817, -0.0150534, 0.1529412, 1, 0, 1,
-0.488621, 0.2680693, -2.474772, 0.145098, 1, 0, 1,
-0.485185, 0.4497882, -1.612403, 0.1411765, 1, 0, 1,
-0.4848277, 1.157078, -0.7298859, 0.1333333, 1, 0, 1,
-0.4797661, -0.1022232, -2.529344, 0.1294118, 1, 0, 1,
-0.4795213, -0.00342015, -0.7046792, 0.1215686, 1, 0, 1,
-0.4791561, -1.745514, -1.257893, 0.1176471, 1, 0, 1,
-0.4772124, 1.983159, -1.557124, 0.1098039, 1, 0, 1,
-0.4751901, 0.1576953, -1.492418, 0.1058824, 1, 0, 1,
-0.4725438, 0.789251, 0.2584087, 0.09803922, 1, 0, 1,
-0.4699124, -0.6380357, 0.09041236, 0.09019608, 1, 0, 1,
-0.4683102, 0.5835834, -2.607184, 0.08627451, 1, 0, 1,
-0.4662664, -0.9460586, -1.431067, 0.07843138, 1, 0, 1,
-0.4612635, 1.043875, -1.493153, 0.07450981, 1, 0, 1,
-0.4607112, 2.098643, 0.2137583, 0.06666667, 1, 0, 1,
-0.4517487, 1.44839, 0.5422935, 0.0627451, 1, 0, 1,
-0.4390488, 0.8842921, -1.191496, 0.05490196, 1, 0, 1,
-0.4386955, -1.41143, -1.698228, 0.05098039, 1, 0, 1,
-0.4323822, 1.143958, 0.08834913, 0.04313726, 1, 0, 1,
-0.4312134, -0.6554773, -3.858993, 0.03921569, 1, 0, 1,
-0.4286393, -0.01592112, -1.247967, 0.03137255, 1, 0, 1,
-0.4222109, 0.3530168, -0.8574415, 0.02745098, 1, 0, 1,
-0.4210721, 1.110009, -0.80395, 0.01960784, 1, 0, 1,
-0.4194715, -0.8824705, -2.782245, 0.01568628, 1, 0, 1,
-0.4183397, 0.5522428, -0.5275922, 0.007843138, 1, 0, 1,
-0.4176829, 1.542587, -0.3156282, 0.003921569, 1, 0, 1,
-0.4135078, -0.09547872, -1.092941, 0, 1, 0.003921569, 1,
-0.4079632, -1.468794, -2.13196, 0, 1, 0.01176471, 1,
-0.3946643, 0.142195, -1.288682, 0, 1, 0.01568628, 1,
-0.3921122, -1.051827, -0.7047954, 0, 1, 0.02352941, 1,
-0.3886821, -1.389939, -4.49928, 0, 1, 0.02745098, 1,
-0.3885636, 0.4592696, 0.7116764, 0, 1, 0.03529412, 1,
-0.38622, -0.2924927, -2.286448, 0, 1, 0.03921569, 1,
-0.3859833, 1.660424, -1.36388, 0, 1, 0.04705882, 1,
-0.3799956, -0.3455902, -2.826252, 0, 1, 0.05098039, 1,
-0.3766681, 1.027022, 1.03729, 0, 1, 0.05882353, 1,
-0.3728133, 1.174749, -0.6606118, 0, 1, 0.0627451, 1,
-0.3727546, 1.45759, -0.4069566, 0, 1, 0.07058824, 1,
-0.3727477, -2.012608, -1.818632, 0, 1, 0.07450981, 1,
-0.3726779, -1.305298, -1.441912, 0, 1, 0.08235294, 1,
-0.3721619, -1.123631, -3.914126, 0, 1, 0.08627451, 1,
-0.3715093, 0.7705153, -1.230404, 0, 1, 0.09411765, 1,
-0.3713744, -0.3456945, -3.554471, 0, 1, 0.1019608, 1,
-0.3703925, -1.136699, -1.395561, 0, 1, 0.1058824, 1,
-0.3696564, 0.02941041, -1.987364, 0, 1, 0.1137255, 1,
-0.3675209, -1.603448, -2.940341, 0, 1, 0.1176471, 1,
-0.366693, 2.015945, -0.4720152, 0, 1, 0.1254902, 1,
-0.3632512, 0.4515614, -0.6912125, 0, 1, 0.1294118, 1,
-0.3630135, 1.902559, 0.2154745, 0, 1, 0.1372549, 1,
-0.3583444, -1.309386, -3.607829, 0, 1, 0.1411765, 1,
-0.3547385, 0.6446427, -0.7932458, 0, 1, 0.1490196, 1,
-0.3544316, 0.01143347, -3.26012, 0, 1, 0.1529412, 1,
-0.3543949, 1.010715, -0.8502689, 0, 1, 0.1607843, 1,
-0.3530535, -0.870709, -2.78693, 0, 1, 0.1647059, 1,
-0.3529491, 0.7297147, -0.8614168, 0, 1, 0.172549, 1,
-0.3508054, 1.015751, -0.3415942, 0, 1, 0.1764706, 1,
-0.3486125, 0.1615536, -1.215147, 0, 1, 0.1843137, 1,
-0.3473238, 1.671186, -0.08273451, 0, 1, 0.1882353, 1,
-0.3397082, -0.1295767, -2.344841, 0, 1, 0.1960784, 1,
-0.338808, 1.472386, -0.6180071, 0, 1, 0.2039216, 1,
-0.3344729, 1.674242, -0.5259556, 0, 1, 0.2078431, 1,
-0.3319818, 2.48273, 0.5851963, 0, 1, 0.2156863, 1,
-0.3297887, 1.005626, 0.7775831, 0, 1, 0.2196078, 1,
-0.3246686, -1.286366, -1.896958, 0, 1, 0.227451, 1,
-0.323662, 0.2455653, -1.748263, 0, 1, 0.2313726, 1,
-0.3231242, -1.788525, -3.982453, 0, 1, 0.2392157, 1,
-0.3229034, 0.1316079, 0.9937996, 0, 1, 0.2431373, 1,
-0.3223506, 0.4783691, -0.6344412, 0, 1, 0.2509804, 1,
-0.3223449, 0.9419554, 0.710052, 0, 1, 0.254902, 1,
-0.3187787, 0.544748, -1.528956, 0, 1, 0.2627451, 1,
-0.3186577, 1.347145, -1.011599, 0, 1, 0.2666667, 1,
-0.318278, -1.511618, -3.511312, 0, 1, 0.2745098, 1,
-0.314362, -0.7724091, -1.350433, 0, 1, 0.2784314, 1,
-0.3046834, -1.676715, -3.116482, 0, 1, 0.2862745, 1,
-0.3040017, 0.203894, -1.504687, 0, 1, 0.2901961, 1,
-0.3028154, -0.8488266, -3.427749, 0, 1, 0.2980392, 1,
-0.3003401, -0.4892221, -2.530736, 0, 1, 0.3058824, 1,
-0.3002348, -0.2344372, -1.684274, 0, 1, 0.3098039, 1,
-0.2998652, -0.2800255, -1.364084, 0, 1, 0.3176471, 1,
-0.2995379, -1.103594, -2.948281, 0, 1, 0.3215686, 1,
-0.2987444, 0.5142382, -0.6710249, 0, 1, 0.3294118, 1,
-0.2983636, 0.6744341, -1.406293, 0, 1, 0.3333333, 1,
-0.2947513, -0.0008188047, -2.45264, 0, 1, 0.3411765, 1,
-0.2925382, -0.2051397, -0.8505803, 0, 1, 0.345098, 1,
-0.2916935, 1.262843, 1.36627, 0, 1, 0.3529412, 1,
-0.2914716, 0.6041719, -0.84576, 0, 1, 0.3568628, 1,
-0.2905838, 0.2294165, -2.171602, 0, 1, 0.3647059, 1,
-0.2884592, 0.3093606, -1.326229, 0, 1, 0.3686275, 1,
-0.2882608, 1.813925, -0.8109811, 0, 1, 0.3764706, 1,
-0.2853338, 0.4625645, -0.4782874, 0, 1, 0.3803922, 1,
-0.2848127, -0.1235321, -3.043221, 0, 1, 0.3882353, 1,
-0.284318, 0.5781088, -0.4942297, 0, 1, 0.3921569, 1,
-0.283152, 0.2987882, -0.1581313, 0, 1, 0.4, 1,
-0.2772136, -0.5116816, -2.64469, 0, 1, 0.4078431, 1,
-0.2767748, -0.5964739, -3.041213, 0, 1, 0.4117647, 1,
-0.2737118, 0.5726743, -0.4249566, 0, 1, 0.4196078, 1,
-0.2734132, -1.623223, -3.868761, 0, 1, 0.4235294, 1,
-0.2700066, -0.5201054, -2.010415, 0, 1, 0.4313726, 1,
-0.2671843, 0.7814886, -0.1342835, 0, 1, 0.4352941, 1,
-0.2625248, -1.880636, -3.233232, 0, 1, 0.4431373, 1,
-0.2604561, 2.468888, 0.2729831, 0, 1, 0.4470588, 1,
-0.2574064, 1.754925, -1.817838, 0, 1, 0.454902, 1,
-0.2506554, -1.246519, -3.275021, 0, 1, 0.4588235, 1,
-0.2461835, 0.7570891, 0.2554701, 0, 1, 0.4666667, 1,
-0.2421135, 0.3070158, -1.527985, 0, 1, 0.4705882, 1,
-0.2359563, -0.9732675, -3.958007, 0, 1, 0.4784314, 1,
-0.2357676, 0.702314, -0.1287543, 0, 1, 0.4823529, 1,
-0.2352144, -0.5720764, -3.33831, 0, 1, 0.4901961, 1,
-0.2315948, 1.284131, -0.6437172, 0, 1, 0.4941176, 1,
-0.2303765, -0.334075, -0.7949929, 0, 1, 0.5019608, 1,
-0.2301748, 0.36306, -0.1583261, 0, 1, 0.509804, 1,
-0.2300943, 1.748549, 1.879511, 0, 1, 0.5137255, 1,
-0.2270395, -1.148844, -3.228882, 0, 1, 0.5215687, 1,
-0.2250626, -0.8269295, -3.075634, 0, 1, 0.5254902, 1,
-0.2244778, -0.9928373, -2.13132, 0, 1, 0.5333334, 1,
-0.2222483, 1.658241, -0.6288551, 0, 1, 0.5372549, 1,
-0.2192009, 1.382587, -0.6911712, 0, 1, 0.5450981, 1,
-0.2184135, -0.6169827, -3.646057, 0, 1, 0.5490196, 1,
-0.2054094, -0.4213973, -1.656047, 0, 1, 0.5568628, 1,
-0.1994578, -0.918384, -1.455113, 0, 1, 0.5607843, 1,
-0.1946878, 0.8474026, -0.6021205, 0, 1, 0.5686275, 1,
-0.1883782, 0.3737532, 0.6953106, 0, 1, 0.572549, 1,
-0.1879594, 0.8350816, -1.15166, 0, 1, 0.5803922, 1,
-0.1871394, -1.153684, -2.420723, 0, 1, 0.5843138, 1,
-0.1855794, -0.02993633, -1.813908, 0, 1, 0.5921569, 1,
-0.1818511, -0.5760192, -3.860677, 0, 1, 0.5960785, 1,
-0.1808614, -0.4376068, -3.681666, 0, 1, 0.6039216, 1,
-0.1804542, -0.4201216, -1.885092, 0, 1, 0.6117647, 1,
-0.1792003, 0.7955039, 0.8647801, 0, 1, 0.6156863, 1,
-0.1776617, 0.04912773, -1.397871, 0, 1, 0.6235294, 1,
-0.1730798, 0.01801939, -1.213048, 0, 1, 0.627451, 1,
-0.1721095, -0.5485561, -3.539363, 0, 1, 0.6352941, 1,
-0.1714436, -0.9605098, -3.103685, 0, 1, 0.6392157, 1,
-0.1710214, 0.04080719, -2.188872, 0, 1, 0.6470588, 1,
-0.1708707, 0.401439, -0.6903676, 0, 1, 0.6509804, 1,
-0.1701383, 0.7269167, 0.7785648, 0, 1, 0.6588235, 1,
-0.1695893, 0.7159199, 1.51421, 0, 1, 0.6627451, 1,
-0.1645147, -1.707631, -2.197328, 0, 1, 0.6705883, 1,
-0.1645078, -0.8325949, -2.375395, 0, 1, 0.6745098, 1,
-0.1595139, -0.6865891, -2.288576, 0, 1, 0.682353, 1,
-0.1593876, -0.7184175, -0.1280437, 0, 1, 0.6862745, 1,
-0.1577362, -0.4310239, -2.807994, 0, 1, 0.6941177, 1,
-0.1531865, 1.89462, 1.638489, 0, 1, 0.7019608, 1,
-0.1498656, 1.67925, -0.6018726, 0, 1, 0.7058824, 1,
-0.1475082, -0.1401679, -1.335455, 0, 1, 0.7137255, 1,
-0.1412285, 0.6647121, -0.4059318, 0, 1, 0.7176471, 1,
-0.1409229, 0.4180609, -1.000505, 0, 1, 0.7254902, 1,
-0.1347688, -0.4515451, -3.03629, 0, 1, 0.7294118, 1,
-0.13452, 1.645308, -1.716371, 0, 1, 0.7372549, 1,
-0.1325792, -0.2470402, -3.690114, 0, 1, 0.7411765, 1,
-0.1292137, 0.5912676, 0.9649234, 0, 1, 0.7490196, 1,
-0.1280302, -0.02138763, -2.382806, 0, 1, 0.7529412, 1,
-0.1232256, -0.471593, -1.796161, 0, 1, 0.7607843, 1,
-0.1232123, 0.2977717, -1.269469, 0, 1, 0.7647059, 1,
-0.1215628, -0.1138525, -3.683206, 0, 1, 0.772549, 1,
-0.1208295, -1.084044, -0.6156705, 0, 1, 0.7764706, 1,
-0.1181244, -2.02482, -3.237993, 0, 1, 0.7843137, 1,
-0.1168091, -0.7608162, -2.143083, 0, 1, 0.7882353, 1,
-0.1145304, 0.8389543, -2.203328, 0, 1, 0.7960784, 1,
-0.1140207, 0.8444681, -0.7709627, 0, 1, 0.8039216, 1,
-0.113615, -0.466565, -2.25139, 0, 1, 0.8078431, 1,
-0.1110328, -0.754133, -3.950272, 0, 1, 0.8156863, 1,
-0.1107446, 2.024543, -0.7987863, 0, 1, 0.8196079, 1,
-0.1086578, 1.714177, 0.5649514, 0, 1, 0.827451, 1,
-0.1074956, -0.02182189, -2.167705, 0, 1, 0.8313726, 1,
-0.1063547, -0.4405443, -3.748396, 0, 1, 0.8392157, 1,
-0.1035359, -0.7597381, -2.665453, 0, 1, 0.8431373, 1,
-0.0964449, 0.1159683, -1.529563, 0, 1, 0.8509804, 1,
-0.08957788, -0.5547727, -2.087769, 0, 1, 0.854902, 1,
-0.08855605, 1.294559, -0.8891521, 0, 1, 0.8627451, 1,
-0.0852765, 0.07506131, 0.1335984, 0, 1, 0.8666667, 1,
-0.0842439, -0.02021776, -3.319677, 0, 1, 0.8745098, 1,
-0.08340281, 0.6768986, -0.6610993, 0, 1, 0.8784314, 1,
-0.0807781, -0.5190904, -3.393282, 0, 1, 0.8862745, 1,
-0.07851298, -0.3915782, -1.785238, 0, 1, 0.8901961, 1,
-0.07529122, -0.3598087, -0.8355035, 0, 1, 0.8980392, 1,
-0.06779832, 1.237717, 0.5384254, 0, 1, 0.9058824, 1,
-0.06544296, 1.017015, 0.7665648, 0, 1, 0.9098039, 1,
-0.05671821, 2.314282, 0.2761918, 0, 1, 0.9176471, 1,
-0.05606255, -0.6113298, -4.12654, 0, 1, 0.9215686, 1,
-0.05516639, 0.4158579, 0.02316245, 0, 1, 0.9294118, 1,
-0.05466603, 0.6859378, 0.4256322, 0, 1, 0.9333333, 1,
-0.05443429, -0.9642572, -2.13785, 0, 1, 0.9411765, 1,
-0.05342636, 2.50702, 1.185148, 0, 1, 0.945098, 1,
-0.05328112, 1.078338, 0.3322008, 0, 1, 0.9529412, 1,
-0.05217316, -0.7742133, -1.847839, 0, 1, 0.9568627, 1,
-0.04533343, -1.035535, -3.273996, 0, 1, 0.9647059, 1,
-0.04047097, -0.594102, -2.760864, 0, 1, 0.9686275, 1,
-0.0358839, -0.9803731, -3.551053, 0, 1, 0.9764706, 1,
-0.03413675, 0.3120153, -1.50306, 0, 1, 0.9803922, 1,
-0.03387981, 0.7019402, -0.4430239, 0, 1, 0.9882353, 1,
-0.03164674, 0.3731505, -0.4998661, 0, 1, 0.9921569, 1,
-0.03047877, 0.6217741, -1.558864, 0, 1, 1, 1,
-0.02805933, 0.996408, -0.5164921, 0, 0.9921569, 1, 1,
-0.02649538, 1.848486, -0.2910722, 0, 0.9882353, 1, 1,
-0.02510109, -0.5540078, -3.776372, 0, 0.9803922, 1, 1,
-0.02218509, 1.414293, 1.04762, 0, 0.9764706, 1, 1,
-0.01626101, 0.3735998, -1.730125, 0, 0.9686275, 1, 1,
-0.01539597, -1.008634, -3.610195, 0, 0.9647059, 1, 1,
-0.01531382, 0.01427042, -1.1241, 0, 0.9568627, 1, 1,
-0.01529722, 0.09668893, 0.2536924, 0, 0.9529412, 1, 1,
-0.01456951, 0.3202277, -0.3155144, 0, 0.945098, 1, 1,
-0.009891204, 0.8263179, -0.9285489, 0, 0.9411765, 1, 1,
-0.006807061, -1.615396, -1.840593, 0, 0.9333333, 1, 1,
-0.006121527, -0.9606133, -0.4056458, 0, 0.9294118, 1, 1,
-0.003594806, 1.923069, 1.217496, 0, 0.9215686, 1, 1,
0.0001195272, -0.7742494, 2.650416, 0, 0.9176471, 1, 1,
0.001666181, 0.7986872, 0.1566253, 0, 0.9098039, 1, 1,
0.003776682, -0.6998277, 2.688155, 0, 0.9058824, 1, 1,
0.004148342, -0.2644516, 2.412923, 0, 0.8980392, 1, 1,
0.01031636, -0.6800032, 2.958167, 0, 0.8901961, 1, 1,
0.01050857, 0.4866, 1.455639, 0, 0.8862745, 1, 1,
0.01088559, 1.731404, 0.6641145, 0, 0.8784314, 1, 1,
0.01116411, -0.4878021, 3.258326, 0, 0.8745098, 1, 1,
0.01204637, -0.01962645, 2.439678, 0, 0.8666667, 1, 1,
0.01228442, -0.2455673, 1.605274, 0, 0.8627451, 1, 1,
0.01778538, 0.5186046, -1.189647, 0, 0.854902, 1, 1,
0.02235734, 0.8058699, -0.8447182, 0, 0.8509804, 1, 1,
0.02318472, 0.4122564, -0.9919332, 0, 0.8431373, 1, 1,
0.02459319, -1.082639, 3.819655, 0, 0.8392157, 1, 1,
0.02942465, -0.1333622, 1.202731, 0, 0.8313726, 1, 1,
0.0303237, -0.6342452, 4.108941, 0, 0.827451, 1, 1,
0.03078241, -1.273638, 2.609558, 0, 0.8196079, 1, 1,
0.03381903, -1.538566, 2.525763, 0, 0.8156863, 1, 1,
0.03496234, -0.4267891, 3.945233, 0, 0.8078431, 1, 1,
0.03589403, -0.8164567, 4.082236, 0, 0.8039216, 1, 1,
0.04075916, -1.563383, 2.574608, 0, 0.7960784, 1, 1,
0.04790278, -0.8768961, 3.67242, 0, 0.7882353, 1, 1,
0.05284015, -0.06631909, 2.250158, 0, 0.7843137, 1, 1,
0.05411634, -1.096668, 2.014338, 0, 0.7764706, 1, 1,
0.05496903, 0.04232263, 1.907401, 0, 0.772549, 1, 1,
0.05539843, -0.1070795, 1.098511, 0, 0.7647059, 1, 1,
0.05611984, 0.09124394, 0.3720903, 0, 0.7607843, 1, 1,
0.05843224, 0.1536901, 0.1775325, 0, 0.7529412, 1, 1,
0.0590606, -0.8537214, 2.172729, 0, 0.7490196, 1, 1,
0.05995268, -0.207086, 1.979241, 0, 0.7411765, 1, 1,
0.06068203, -0.2200309, 4.703991, 0, 0.7372549, 1, 1,
0.06210821, -0.3593261, 1.908896, 0, 0.7294118, 1, 1,
0.06409807, 1.237427, 0.5264087, 0, 0.7254902, 1, 1,
0.06769374, -0.4916724, 3.538625, 0, 0.7176471, 1, 1,
0.06974372, 1.752415, 0.7741968, 0, 0.7137255, 1, 1,
0.06988948, -0.2710584, 1.149588, 0, 0.7058824, 1, 1,
0.07050053, 0.5041199, -1.217828, 0, 0.6980392, 1, 1,
0.07131206, -0.9268721, 2.451653, 0, 0.6941177, 1, 1,
0.07834961, -1.668813, 2.648856, 0, 0.6862745, 1, 1,
0.07887117, 0.04266245, 1.302606, 0, 0.682353, 1, 1,
0.07995445, 1.082011, 1.017928, 0, 0.6745098, 1, 1,
0.0813136, -0.3721501, 2.977695, 0, 0.6705883, 1, 1,
0.08702115, -0.5032142, 2.673144, 0, 0.6627451, 1, 1,
0.08714267, 0.9831009, 0.4087943, 0, 0.6588235, 1, 1,
0.0881575, -0.2530935, 3.146732, 0, 0.6509804, 1, 1,
0.08892591, 2.251132, -0.6051115, 0, 0.6470588, 1, 1,
0.09137963, 0.5541175, -0.9982291, 0, 0.6392157, 1, 1,
0.09168107, 0.3939555, -0.9953923, 0, 0.6352941, 1, 1,
0.0938765, 0.7734372, 1.184802, 0, 0.627451, 1, 1,
0.09537365, -0.6303666, 3.55649, 0, 0.6235294, 1, 1,
0.1054169, -0.250093, 3.886096, 0, 0.6156863, 1, 1,
0.1057791, -0.3222132, 1.291194, 0, 0.6117647, 1, 1,
0.1058816, 1.17109, -0.2453758, 0, 0.6039216, 1, 1,
0.1082409, -0.3052655, 4.607147, 0, 0.5960785, 1, 1,
0.1107269, -1.033013, 3.380875, 0, 0.5921569, 1, 1,
0.1129758, 0.704355, 1.427745, 0, 0.5843138, 1, 1,
0.1143676, 0.4297036, 0.07928947, 0, 0.5803922, 1, 1,
0.1153028, -0.2164277, 4.63036, 0, 0.572549, 1, 1,
0.1222506, -0.5377245, 3.712206, 0, 0.5686275, 1, 1,
0.1238275, -0.3169777, 1.69423, 0, 0.5607843, 1, 1,
0.1242964, -0.3914292, 3.382967, 0, 0.5568628, 1, 1,
0.1289075, -0.8177214, 2.816034, 0, 0.5490196, 1, 1,
0.1309024, 1.003644, 0.732623, 0, 0.5450981, 1, 1,
0.1350344, -0.650636, 2.619457, 0, 0.5372549, 1, 1,
0.1354869, 0.6203536, 1.258823, 0, 0.5333334, 1, 1,
0.1387656, -0.9394189, 3.555663, 0, 0.5254902, 1, 1,
0.1415081, 0.725492, -0.9757969, 0, 0.5215687, 1, 1,
0.1438802, 1.214961, -1.942194, 0, 0.5137255, 1, 1,
0.1483844, 0.9290814, 0.9163077, 0, 0.509804, 1, 1,
0.1514654, -1.448153, 2.814963, 0, 0.5019608, 1, 1,
0.1545108, 0.5647841, 2.618031, 0, 0.4941176, 1, 1,
0.1566756, 0.06784309, 0.1687972, 0, 0.4901961, 1, 1,
0.1573121, -0.2480666, 4.118246, 0, 0.4823529, 1, 1,
0.1576416, 1.450195, 1.256659, 0, 0.4784314, 1, 1,
0.1579578, 0.1536388, 1.290663, 0, 0.4705882, 1, 1,
0.1582611, -1.722321, 4.021768, 0, 0.4666667, 1, 1,
0.1591942, 0.8408045, -0.6896549, 0, 0.4588235, 1, 1,
0.1655487, -0.4647733, 1.739797, 0, 0.454902, 1, 1,
0.170658, -0.739168, 3.046296, 0, 0.4470588, 1, 1,
0.1724107, -0.6374924, 4.80222, 0, 0.4431373, 1, 1,
0.1731088, -0.3347328, 1.914983, 0, 0.4352941, 1, 1,
0.1750386, 0.5751688, 1.635492, 0, 0.4313726, 1, 1,
0.1783214, 0.4244829, 0.4176498, 0, 0.4235294, 1, 1,
0.1791075, 0.6535807, -0.05965811, 0, 0.4196078, 1, 1,
0.1797381, -0.7540443, 1.167246, 0, 0.4117647, 1, 1,
0.1804659, -0.2392551, 1.869586, 0, 0.4078431, 1, 1,
0.1806403, -0.3862141, 4.028651, 0, 0.4, 1, 1,
0.1809123, 0.05374441, 1.525723, 0, 0.3921569, 1, 1,
0.1818423, -0.6326881, 2.408621, 0, 0.3882353, 1, 1,
0.1828704, 0.4285848, -0.6353023, 0, 0.3803922, 1, 1,
0.1879952, 0.4877482, 1.041828, 0, 0.3764706, 1, 1,
0.1920806, -0.4235753, 2.399077, 0, 0.3686275, 1, 1,
0.1935788, -1.192607, 1.40337, 0, 0.3647059, 1, 1,
0.196911, 0.1314288, 1.655652, 0, 0.3568628, 1, 1,
0.1977814, 0.6852418, 0.8485353, 0, 0.3529412, 1, 1,
0.198962, 0.3532083, 2.793202, 0, 0.345098, 1, 1,
0.2004287, 0.02661973, 2.966778, 0, 0.3411765, 1, 1,
0.2024347, 2.325471, 0.0779211, 0, 0.3333333, 1, 1,
0.2036682, 0.4077157, 1.826906, 0, 0.3294118, 1, 1,
0.2063166, -0.8503966, 1.962628, 0, 0.3215686, 1, 1,
0.2071172, -0.1491636, 2.303454, 0, 0.3176471, 1, 1,
0.2076403, 0.7787294, 0.02420973, 0, 0.3098039, 1, 1,
0.2088345, 0.4381251, 0.05538956, 0, 0.3058824, 1, 1,
0.2096877, -1.150122, 3.212982, 0, 0.2980392, 1, 1,
0.2140042, 0.4083635, -0.614059, 0, 0.2901961, 1, 1,
0.2164202, 0.1129835, 1.729071, 0, 0.2862745, 1, 1,
0.2204343, -1.32661, 1.344827, 0, 0.2784314, 1, 1,
0.2204676, 0.6493206, -0.02786844, 0, 0.2745098, 1, 1,
0.2229428, 0.5662925, -0.1523467, 0, 0.2666667, 1, 1,
0.2299408, -0.5708419, 5.440397, 0, 0.2627451, 1, 1,
0.2333434, -0.601536, 2.557027, 0, 0.254902, 1, 1,
0.23502, 2.056628, 2.277145, 0, 0.2509804, 1, 1,
0.2404016, -2.198118, 3.693624, 0, 0.2431373, 1, 1,
0.2467696, -0.7893927, 3.569698, 0, 0.2392157, 1, 1,
0.2620147, -0.8547191, 4.15821, 0, 0.2313726, 1, 1,
0.2661922, 0.2160172, 0.2711935, 0, 0.227451, 1, 1,
0.2665913, -0.2352506, 1.605547, 0, 0.2196078, 1, 1,
0.2669785, -0.7240924, 3.520949, 0, 0.2156863, 1, 1,
0.2675124, -1.646302, 2.694009, 0, 0.2078431, 1, 1,
0.2714016, -2.353939, 2.249562, 0, 0.2039216, 1, 1,
0.274408, 2.523549, 0.9314461, 0, 0.1960784, 1, 1,
0.2753822, -1.311082, 1.992287, 0, 0.1882353, 1, 1,
0.2764078, 0.9012297, 1.954259, 0, 0.1843137, 1, 1,
0.2768131, 1.058723, -0.6477685, 0, 0.1764706, 1, 1,
0.2775562, 0.1401394, 2.104026, 0, 0.172549, 1, 1,
0.2794534, 0.5397809, 0.3721839, 0, 0.1647059, 1, 1,
0.28049, 1.250446, -0.004933316, 0, 0.1607843, 1, 1,
0.2818078, -0.4942482, 3.337893, 0, 0.1529412, 1, 1,
0.283431, 1.359365, -0.3132673, 0, 0.1490196, 1, 1,
0.2836562, -0.5036441, 2.748358, 0, 0.1411765, 1, 1,
0.2844649, -1.38633, 4.739915, 0, 0.1372549, 1, 1,
0.2852692, 1.729401, 0.9126777, 0, 0.1294118, 1, 1,
0.2883178, 0.04076492, 0.6105476, 0, 0.1254902, 1, 1,
0.2887564, 0.1810994, 0.8628608, 0, 0.1176471, 1, 1,
0.2918148, 0.9907227, -0.9847195, 0, 0.1137255, 1, 1,
0.2961139, -0.820567, 2.964073, 0, 0.1058824, 1, 1,
0.3067288, 0.5487748, -0.290662, 0, 0.09803922, 1, 1,
0.3083627, -0.1346298, 2.459445, 0, 0.09411765, 1, 1,
0.3097259, -2.123542, 1.680062, 0, 0.08627451, 1, 1,
0.3136733, 0.3671212, -0.5883604, 0, 0.08235294, 1, 1,
0.3161918, -1.242684, 4.29659, 0, 0.07450981, 1, 1,
0.3210913, -0.5040554, 2.661594, 0, 0.07058824, 1, 1,
0.3273855, -2.282719, 3.548825, 0, 0.0627451, 1, 1,
0.3325236, 1.739291, -0.1707509, 0, 0.05882353, 1, 1,
0.3364496, 1.199615, 1.86025, 0, 0.05098039, 1, 1,
0.3375534, -0.8535949, 1.840427, 0, 0.04705882, 1, 1,
0.3389429, 0.5033842, 1.901464, 0, 0.03921569, 1, 1,
0.3435642, 1.488763, -1.267372, 0, 0.03529412, 1, 1,
0.3476853, -0.8860179, 3.748453, 0, 0.02745098, 1, 1,
0.3530844, -2.843575, 3.777431, 0, 0.02352941, 1, 1,
0.3577472, -0.7968004, 3.363243, 0, 0.01568628, 1, 1,
0.3613198, 0.4375825, 0.4371172, 0, 0.01176471, 1, 1,
0.3642459, -1.0546, 3.266483, 0, 0.003921569, 1, 1,
0.3666672, 0.3348109, 0.2247643, 0.003921569, 0, 1, 1,
0.3702523, 1.455155, 0.9467227, 0.007843138, 0, 1, 1,
0.3751339, 1.889004, 1.050497, 0.01568628, 0, 1, 1,
0.3820839, -0.04288335, 0.7834373, 0.01960784, 0, 1, 1,
0.3842728, -0.3341375, 1.668635, 0.02745098, 0, 1, 1,
0.3843478, 0.4781593, -1.883692, 0.03137255, 0, 1, 1,
0.3857045, -0.0296404, 1.004766, 0.03921569, 0, 1, 1,
0.3874312, -0.3690001, 2.467146, 0.04313726, 0, 1, 1,
0.3905546, -0.2338322, 3.404285, 0.05098039, 0, 1, 1,
0.3940887, -0.1362126, 1.027003, 0.05490196, 0, 1, 1,
0.3955979, -0.3817684, 1.661083, 0.0627451, 0, 1, 1,
0.4068406, 0.6427653, 1.092398, 0.06666667, 0, 1, 1,
0.4082344, -0.117071, 1.113983, 0.07450981, 0, 1, 1,
0.4087002, -0.6009064, 2.615505, 0.07843138, 0, 1, 1,
0.4137213, 0.2935476, 1.559135, 0.08627451, 0, 1, 1,
0.4186873, 0.6186547, -0.1183177, 0.09019608, 0, 1, 1,
0.4239902, 0.2230054, 1.527199, 0.09803922, 0, 1, 1,
0.4254572, 1.834582, -0.07833593, 0.1058824, 0, 1, 1,
0.4280438, -1.52309, 2.50612, 0.1098039, 0, 1, 1,
0.428833, 0.231801, -0.8097471, 0.1176471, 0, 1, 1,
0.4293131, 0.8631486, 1.26592, 0.1215686, 0, 1, 1,
0.4297234, 0.1656067, -1.57299, 0.1294118, 0, 1, 1,
0.4319277, -0.7360408, 1.907897, 0.1333333, 0, 1, 1,
0.4319724, 2.870559, -0.6001926, 0.1411765, 0, 1, 1,
0.4335216, -0.8278405, 3.820399, 0.145098, 0, 1, 1,
0.4353398, 0.7278048, -0.674356, 0.1529412, 0, 1, 1,
0.4368298, 0.2383071, 1.711778, 0.1568628, 0, 1, 1,
0.4389087, 0.6354526, -0.4860105, 0.1647059, 0, 1, 1,
0.4420013, 1.086318, 0.4730198, 0.1686275, 0, 1, 1,
0.445756, 0.861753, -0.2031459, 0.1764706, 0, 1, 1,
0.4458951, -0.05954866, 0.02264421, 0.1803922, 0, 1, 1,
0.4472642, -0.9013761, 3.688234, 0.1882353, 0, 1, 1,
0.4517241, 0.1782015, 0.2967995, 0.1921569, 0, 1, 1,
0.4531981, 1.24125, -0.3060711, 0.2, 0, 1, 1,
0.4534131, -0.6784635, 2.804466, 0.2078431, 0, 1, 1,
0.4540358, -1.833937, 2.628311, 0.2117647, 0, 1, 1,
0.4575183, 0.3101976, 1.557352, 0.2196078, 0, 1, 1,
0.4610849, 0.5111827, 1.784698, 0.2235294, 0, 1, 1,
0.4648108, -0.250387, 2.669818, 0.2313726, 0, 1, 1,
0.4704379, -1.004328, 3.969449, 0.2352941, 0, 1, 1,
0.4708284, 0.833199, 1.132753, 0.2431373, 0, 1, 1,
0.4734613, 0.1633535, 1.808627, 0.2470588, 0, 1, 1,
0.478294, 0.2885671, 0.9996276, 0.254902, 0, 1, 1,
0.4819641, -2.336634, 3.467635, 0.2588235, 0, 1, 1,
0.4828435, -1.234711, 4.112141, 0.2666667, 0, 1, 1,
0.4849412, -1.302177, 4.264387, 0.2705882, 0, 1, 1,
0.5014343, 0.1709134, 1.26208, 0.2784314, 0, 1, 1,
0.505791, 0.4839656, 1.326123, 0.282353, 0, 1, 1,
0.5063093, 0.399572, 0.4394067, 0.2901961, 0, 1, 1,
0.5073336, 0.4428348, 0.953072, 0.2941177, 0, 1, 1,
0.5105435, -0.4387529, 3.320394, 0.3019608, 0, 1, 1,
0.5105522, -1.612089, 2.779497, 0.3098039, 0, 1, 1,
0.5155773, -0.2044372, 1.04181, 0.3137255, 0, 1, 1,
0.5220345, 0.4982046, 2.017915, 0.3215686, 0, 1, 1,
0.5275843, -1.17038, 2.893965, 0.3254902, 0, 1, 1,
0.5293639, 0.1951338, 0.789206, 0.3333333, 0, 1, 1,
0.5324996, 0.659444, 1.63364, 0.3372549, 0, 1, 1,
0.5346671, -0.4418537, 2.112431, 0.345098, 0, 1, 1,
0.5348136, -0.9341938, 2.25458, 0.3490196, 0, 1, 1,
0.5371357, -1.941371, 4.47716, 0.3568628, 0, 1, 1,
0.5390117, 0.9327385, 0.769341, 0.3607843, 0, 1, 1,
0.5393223, -0.5773875, 2.91988, 0.3686275, 0, 1, 1,
0.5434482, 1.178073, -0.5578017, 0.372549, 0, 1, 1,
0.5485851, 1.667878, 0.6417987, 0.3803922, 0, 1, 1,
0.5566046, 2.029865, 0.927313, 0.3843137, 0, 1, 1,
0.5689163, 0.6504392, 1.307762, 0.3921569, 0, 1, 1,
0.5696256, -0.1017866, 1.369981, 0.3960784, 0, 1, 1,
0.5802995, 0.6384098, 0.5141426, 0.4039216, 0, 1, 1,
0.5837581, 0.5969095, -1.03089, 0.4117647, 0, 1, 1,
0.5853018, -0.4475439, 3.232459, 0.4156863, 0, 1, 1,
0.5869948, 1.659897, 1.031778, 0.4235294, 0, 1, 1,
0.5883498, 0.3158943, 2.55457, 0.427451, 0, 1, 1,
0.5947008, -0.2289182, 1.411499, 0.4352941, 0, 1, 1,
0.6035824, 0.08654926, -0.3423039, 0.4392157, 0, 1, 1,
0.6053253, 0.5076999, 0.2778765, 0.4470588, 0, 1, 1,
0.6083291, -1.354083, 3.403522, 0.4509804, 0, 1, 1,
0.6118687, 0.5172202, 1.064867, 0.4588235, 0, 1, 1,
0.6133462, -0.6380532, 2.394742, 0.4627451, 0, 1, 1,
0.6136459, 1.239056, 0.7030866, 0.4705882, 0, 1, 1,
0.6166594, 0.4686418, 0.6781278, 0.4745098, 0, 1, 1,
0.618545, 1.100145, -0.6887854, 0.4823529, 0, 1, 1,
0.6250534, 0.9610382, -0.1192782, 0.4862745, 0, 1, 1,
0.6365883, 0.9474832, 1.437145, 0.4941176, 0, 1, 1,
0.6366586, -1.100248, 1.561399, 0.5019608, 0, 1, 1,
0.6417381, 0.004183097, 1.256487, 0.5058824, 0, 1, 1,
0.6419263, 0.7289037, 2.379826, 0.5137255, 0, 1, 1,
0.6570765, -0.02043937, 1.334034, 0.5176471, 0, 1, 1,
0.665612, -1.960197, 0.8392544, 0.5254902, 0, 1, 1,
0.6700468, 1.161706, 1.856884, 0.5294118, 0, 1, 1,
0.6700625, 0.006934738, 1.263138, 0.5372549, 0, 1, 1,
0.6729975, 1.349565, -0.8309787, 0.5411765, 0, 1, 1,
0.6769255, -0.4901539, 1.355116, 0.5490196, 0, 1, 1,
0.6804342, -0.1850538, 1.055937, 0.5529412, 0, 1, 1,
0.6862038, 0.5905612, 0.4063281, 0.5607843, 0, 1, 1,
0.6867929, 0.410889, 2.161252, 0.5647059, 0, 1, 1,
0.6903784, 0.8550127, -0.4370434, 0.572549, 0, 1, 1,
0.6934955, -0.1753697, 1.789266, 0.5764706, 0, 1, 1,
0.6987364, -1.005957, 1.326007, 0.5843138, 0, 1, 1,
0.6988797, 0.4072911, 1.927379, 0.5882353, 0, 1, 1,
0.6998832, 0.9948322, -0.0291591, 0.5960785, 0, 1, 1,
0.7128, 0.4921842, 1.938411, 0.6039216, 0, 1, 1,
0.7165338, -0.8621856, 1.142157, 0.6078432, 0, 1, 1,
0.7191101, 2.20321, -0.3013458, 0.6156863, 0, 1, 1,
0.7224152, 0.1592906, -0.3118636, 0.6196079, 0, 1, 1,
0.7259918, -1.130786, 2.881062, 0.627451, 0, 1, 1,
0.7306755, -0.0778932, 0.6168762, 0.6313726, 0, 1, 1,
0.732501, 0.2468739, 1.262097, 0.6392157, 0, 1, 1,
0.7341779, -0.1550428, 0.6181164, 0.6431373, 0, 1, 1,
0.7348516, 1.177179, -0.1381196, 0.6509804, 0, 1, 1,
0.7359454, 0.3115769, 1.510598, 0.654902, 0, 1, 1,
0.73898, 0.5875934, 2.200509, 0.6627451, 0, 1, 1,
0.7393267, 1.040676, 0.4122132, 0.6666667, 0, 1, 1,
0.7410605, 1.434205, 0.5583832, 0.6745098, 0, 1, 1,
0.7420408, -1.676022, 0.9708516, 0.6784314, 0, 1, 1,
0.7544538, 0.1198923, 2.222702, 0.6862745, 0, 1, 1,
0.7546428, 0.6932155, 0.4017041, 0.6901961, 0, 1, 1,
0.7683482, 0.6735682, 0.1355525, 0.6980392, 0, 1, 1,
0.7731702, -0.8241513, 2.321324, 0.7058824, 0, 1, 1,
0.7752554, -1.270361, 2.898329, 0.7098039, 0, 1, 1,
0.7903282, -0.2935476, 2.323974, 0.7176471, 0, 1, 1,
0.7949672, 0.4395341, 0.9740424, 0.7215686, 0, 1, 1,
0.7978012, 0.4590157, 0.6582567, 0.7294118, 0, 1, 1,
0.7982152, -0.5206199, 2.870529, 0.7333333, 0, 1, 1,
0.8049546, -1.264033, 2.373993, 0.7411765, 0, 1, 1,
0.805267, -1.141439, 0.6301987, 0.7450981, 0, 1, 1,
0.806896, -0.3780682, 0.6160174, 0.7529412, 0, 1, 1,
0.8108847, -1.084281, 2.178515, 0.7568628, 0, 1, 1,
0.8158832, -0.2693097, 3.245176, 0.7647059, 0, 1, 1,
0.824017, 0.8928859, -0.6766818, 0.7686275, 0, 1, 1,
0.8488307, 1.107077, 0.3113685, 0.7764706, 0, 1, 1,
0.8489228, -0.6850008, 2.374781, 0.7803922, 0, 1, 1,
0.8518681, 0.07647596, -0.1735115, 0.7882353, 0, 1, 1,
0.8559796, -1.19993, 1.875685, 0.7921569, 0, 1, 1,
0.8614091, 1.713506, 1.23278, 0.8, 0, 1, 1,
0.8636883, -0.3886378, 1.264513, 0.8078431, 0, 1, 1,
0.8668494, -0.8425444, 3.984974, 0.8117647, 0, 1, 1,
0.86993, -0.03730971, 2.001588, 0.8196079, 0, 1, 1,
0.872969, 0.3608551, 1.183167, 0.8235294, 0, 1, 1,
0.8733118, 2.285838, -1.9553, 0.8313726, 0, 1, 1,
0.8794575, -2.04645, 3.897813, 0.8352941, 0, 1, 1,
0.8818976, 0.8052946, 1.389344, 0.8431373, 0, 1, 1,
0.8862929, -1.861674, 1.040193, 0.8470588, 0, 1, 1,
0.8903528, 1.806687, 0.2468273, 0.854902, 0, 1, 1,
0.8914873, -0.2455738, 1.958664, 0.8588235, 0, 1, 1,
0.892418, 0.2719207, 2.022016, 0.8666667, 0, 1, 1,
0.8948569, 2.470361, 0.08632393, 0.8705882, 0, 1, 1,
0.8973639, 1.30863, 1.953267, 0.8784314, 0, 1, 1,
0.9118758, -0.6825531, 1.926831, 0.8823529, 0, 1, 1,
0.9286618, 0.2795665, 0.2746932, 0.8901961, 0, 1, 1,
0.9330317, -2.543964, 3.481075, 0.8941177, 0, 1, 1,
0.9349842, -0.4176015, 2.192312, 0.9019608, 0, 1, 1,
0.9552969, 0.4653872, 1.003059, 0.9098039, 0, 1, 1,
0.956329, -0.3559732, 1.42512, 0.9137255, 0, 1, 1,
0.9701437, -0.6179469, 0.02235326, 0.9215686, 0, 1, 1,
0.9775856, 0.7529028, 0.7044063, 0.9254902, 0, 1, 1,
0.9848679, 0.5463904, 1.033332, 0.9333333, 0, 1, 1,
0.9884975, 0.01934153, 2.482458, 0.9372549, 0, 1, 1,
0.9894468, 0.524099, 0.9322801, 0.945098, 0, 1, 1,
0.9912483, -0.7966758, 2.390844, 0.9490196, 0, 1, 1,
0.9923081, 1.002026, -1.117539, 0.9568627, 0, 1, 1,
0.996893, 0.007850067, 0.6810696, 0.9607843, 0, 1, 1,
1.013323, 0.3704648, 0.6529029, 0.9686275, 0, 1, 1,
1.013929, -1.814397, 4.085583, 0.972549, 0, 1, 1,
1.017668, -0.9289137, -0.168027, 0.9803922, 0, 1, 1,
1.01929, 0.5961796, 1.072609, 0.9843137, 0, 1, 1,
1.029604, -0.5777344, 2.196953, 0.9921569, 0, 1, 1,
1.042259, 0.7184206, 0.09826743, 0.9960784, 0, 1, 1,
1.05423, 1.089062, 0.6213146, 1, 0, 0.9960784, 1,
1.060366, -1.20012, 2.683168, 1, 0, 0.9882353, 1,
1.064836, 0.4866727, 0.3301032, 1, 0, 0.9843137, 1,
1.071303, 0.6650201, -0.1165387, 1, 0, 0.9764706, 1,
1.081182, 0.1123527, 0.4641954, 1, 0, 0.972549, 1,
1.081977, -0.3215016, 2.156013, 1, 0, 0.9647059, 1,
1.082101, 0.2359429, 3.22508, 1, 0, 0.9607843, 1,
1.086421, -1.023696, 1.809163, 1, 0, 0.9529412, 1,
1.091636, -0.2924234, 1.598435, 1, 0, 0.9490196, 1,
1.095255, -0.9853033, 3.223945, 1, 0, 0.9411765, 1,
1.098634, -2.040801, 2.027742, 1, 0, 0.9372549, 1,
1.104846, -1.191356, 1.585997, 1, 0, 0.9294118, 1,
1.106015, -1.714932, 3.523159, 1, 0, 0.9254902, 1,
1.114388, -0.4770749, 2.738605, 1, 0, 0.9176471, 1,
1.117481, 1.516294, 0.6967348, 1, 0, 0.9137255, 1,
1.124061, -0.7095812, 1.255871, 1, 0, 0.9058824, 1,
1.12784, -1.18044, 0.6935567, 1, 0, 0.9019608, 1,
1.130415, 0.9838478, 0.7164364, 1, 0, 0.8941177, 1,
1.134731, -0.4681206, 0.7220109, 1, 0, 0.8862745, 1,
1.138685, 0.9681734, 1.082541, 1, 0, 0.8823529, 1,
1.154345, -0.6762082, 2.372111, 1, 0, 0.8745098, 1,
1.156327, -2.103605, 2.978225, 1, 0, 0.8705882, 1,
1.161948, 0.1386297, 2.713566, 1, 0, 0.8627451, 1,
1.170359, 0.420426, 2.446474, 1, 0, 0.8588235, 1,
1.174152, 1.781044, 0.3319796, 1, 0, 0.8509804, 1,
1.180688, 0.3231497, 1.613492, 1, 0, 0.8470588, 1,
1.180766, 1.159851, 2.217816, 1, 0, 0.8392157, 1,
1.184196, 0.5591812, 1.913046, 1, 0, 0.8352941, 1,
1.184457, -1.075218, 2.376702, 1, 0, 0.827451, 1,
1.18847, -0.9480885, 1.669953, 1, 0, 0.8235294, 1,
1.188991, 0.115644, 2.340544, 1, 0, 0.8156863, 1,
1.194303, -0.6602768, 3.711542, 1, 0, 0.8117647, 1,
1.199623, 0.6672561, 2.295785, 1, 0, 0.8039216, 1,
1.21282, 0.8774971, 1.36326, 1, 0, 0.7960784, 1,
1.217786, -0.1770127, 1.44724, 1, 0, 0.7921569, 1,
1.225213, 0.9023816, 1.560942, 1, 0, 0.7843137, 1,
1.231061, -0.9535875, 1.238235, 1, 0, 0.7803922, 1,
1.237172, 1.886069, 0.4301483, 1, 0, 0.772549, 1,
1.239027, -0.8259724, 2.038599, 1, 0, 0.7686275, 1,
1.240533, -0.3309883, 0.05180627, 1, 0, 0.7607843, 1,
1.241543, 0.4108921, 1.139536, 1, 0, 0.7568628, 1,
1.251654, 0.5488665, 1.443849, 1, 0, 0.7490196, 1,
1.25185, -0.4897903, 1.620345, 1, 0, 0.7450981, 1,
1.260248, -0.05540751, 2.52773, 1, 0, 0.7372549, 1,
1.273164, -1.208459, 1.129015, 1, 0, 0.7333333, 1,
1.278933, -0.3418183, 1.872543, 1, 0, 0.7254902, 1,
1.282372, -0.4379338, 1.82753, 1, 0, 0.7215686, 1,
1.285973, -0.3151271, 2.067184, 1, 0, 0.7137255, 1,
1.287039, -0.590897, 2.200292, 1, 0, 0.7098039, 1,
1.288353, 0.4894823, 2.145099, 1, 0, 0.7019608, 1,
1.299799, -1.971836, 1.310707, 1, 0, 0.6941177, 1,
1.324611, 0.1858543, 1.342178, 1, 0, 0.6901961, 1,
1.326118, -1.05844, 2.289461, 1, 0, 0.682353, 1,
1.338672, 1.144362, 0.6376702, 1, 0, 0.6784314, 1,
1.340481, 1.969751, 1.475614, 1, 0, 0.6705883, 1,
1.342602, -0.1178576, 2.588232, 1, 0, 0.6666667, 1,
1.345469, -0.7458655, 3.206029, 1, 0, 0.6588235, 1,
1.346591, 0.6897871, 0.2838292, 1, 0, 0.654902, 1,
1.347516, 0.008676625, -0.04042286, 1, 0, 0.6470588, 1,
1.349356, 0.1154637, 1.500944, 1, 0, 0.6431373, 1,
1.353949, 0.8606784, 1.710196, 1, 0, 0.6352941, 1,
1.355081, 0.7097508, -0.364864, 1, 0, 0.6313726, 1,
1.36465, -2.684663, 1.662569, 1, 0, 0.6235294, 1,
1.369362, -1.238442, 4.514991, 1, 0, 0.6196079, 1,
1.370211, 2.258544, -0.4215823, 1, 0, 0.6117647, 1,
1.372763, -0.6435843, 1.805, 1, 0, 0.6078432, 1,
1.381837, 1.123061, 2.195354, 1, 0, 0.6, 1,
1.382442, 0.6678932, -0.3477625, 1, 0, 0.5921569, 1,
1.391391, 0.01688463, 1.016909, 1, 0, 0.5882353, 1,
1.401741, 0.5705082, 3.071677, 1, 0, 0.5803922, 1,
1.415596, -0.05571918, 3.719441, 1, 0, 0.5764706, 1,
1.428481, -1.479352, 3.882254, 1, 0, 0.5686275, 1,
1.435761, 1.185642, 0.06600431, 1, 0, 0.5647059, 1,
1.437966, -0.00590293, 1.260109, 1, 0, 0.5568628, 1,
1.442077, -1.634032, 1.047012, 1, 0, 0.5529412, 1,
1.442269, -2.832038, 1.664265, 1, 0, 0.5450981, 1,
1.449249, -1.089318, 1.348163, 1, 0, 0.5411765, 1,
1.466715, 0.8245677, 1.177786, 1, 0, 0.5333334, 1,
1.47006, -1.54654, 0.7229851, 1, 0, 0.5294118, 1,
1.480014, -0.2539833, 0.8470362, 1, 0, 0.5215687, 1,
1.482301, 1.162038, 1.063556, 1, 0, 0.5176471, 1,
1.482882, 1.076053, 0.2616709, 1, 0, 0.509804, 1,
1.49289, 0.6338612, 1.113202, 1, 0, 0.5058824, 1,
1.494592, -1.732654, 1.804176, 1, 0, 0.4980392, 1,
1.494993, 0.6671365, 1.158398, 1, 0, 0.4901961, 1,
1.498671, -2.25001, 1.049061, 1, 0, 0.4862745, 1,
1.499779, 1.324032, -0.00962873, 1, 0, 0.4784314, 1,
1.500319, -0.4041577, 4.022915, 1, 0, 0.4745098, 1,
1.505219, -0.3047331, 3.205218, 1, 0, 0.4666667, 1,
1.519974, 0.4760477, 0.8630888, 1, 0, 0.4627451, 1,
1.531556, 1.774865, 0.6208768, 1, 0, 0.454902, 1,
1.533217, -0.5489604, 1.929487, 1, 0, 0.4509804, 1,
1.555324, -0.6468372, 2.396156, 1, 0, 0.4431373, 1,
1.557369, 2.573763, 1.319214, 1, 0, 0.4392157, 1,
1.557868, 0.9247249, 2.34797, 1, 0, 0.4313726, 1,
1.565094, 2.175602, -0.09078628, 1, 0, 0.427451, 1,
1.574671, 1.871303, 1.001385, 1, 0, 0.4196078, 1,
1.576092, -1.200451, 1.459495, 1, 0, 0.4156863, 1,
1.596321, 0.2525725, 0.9460799, 1, 0, 0.4078431, 1,
1.600001, 0.07084581, 2.731844, 1, 0, 0.4039216, 1,
1.601487, -0.719062, 0.7883313, 1, 0, 0.3960784, 1,
1.607005, 1.261935, 1.520203, 1, 0, 0.3882353, 1,
1.607912, -1.766069, 1.491338, 1, 0, 0.3843137, 1,
1.608843, 0.1818944, 1.040835, 1, 0, 0.3764706, 1,
1.610921, 0.04434949, 3.282521, 1, 0, 0.372549, 1,
1.614281, 1.833156, -0.3917839, 1, 0, 0.3647059, 1,
1.615197, -0.4878652, 3.903686, 1, 0, 0.3607843, 1,
1.624785, -0.9379325, 2.513551, 1, 0, 0.3529412, 1,
1.644685, -0.9228032, 4.746738, 1, 0, 0.3490196, 1,
1.65268, -1.265354, 0.7556566, 1, 0, 0.3411765, 1,
1.65792, 0.7527109, 0.8852934, 1, 0, 0.3372549, 1,
1.680052, -1.776973, 1.750463, 1, 0, 0.3294118, 1,
1.694496, 0.7408141, 0.7658606, 1, 0, 0.3254902, 1,
1.695022, -0.4908931, 1.307718, 1, 0, 0.3176471, 1,
1.69818, 0.4149002, 3.349112, 1, 0, 0.3137255, 1,
1.700151, -0.8163577, 2.666209, 1, 0, 0.3058824, 1,
1.70641, 1.077688, 2.766366, 1, 0, 0.2980392, 1,
1.706597, 0.2256529, 2.50159, 1, 0, 0.2941177, 1,
1.715135, 1.321651, -0.2391922, 1, 0, 0.2862745, 1,
1.722758, -1.110609, 1.318267, 1, 0, 0.282353, 1,
1.723605, 0.8892319, 1.432896, 1, 0, 0.2745098, 1,
1.726818, 0.4585785, 1.067791, 1, 0, 0.2705882, 1,
1.735464, 1.07963, 2.921681, 1, 0, 0.2627451, 1,
1.800884, -0.4424897, 0.1085789, 1, 0, 0.2588235, 1,
1.80564, -0.2263416, 2.878491, 1, 0, 0.2509804, 1,
1.806754, -0.2642629, 2.196725, 1, 0, 0.2470588, 1,
1.827553, 0.3659373, 0.6865379, 1, 0, 0.2392157, 1,
1.834661, -0.8857822, 0.1889549, 1, 0, 0.2352941, 1,
1.83673, -0.8561394, 1.163881, 1, 0, 0.227451, 1,
1.838327, 0.009367805, 1.414109, 1, 0, 0.2235294, 1,
1.849957, -0.966207, 2.416062, 1, 0, 0.2156863, 1,
1.860103, -0.5735487, 3.379653, 1, 0, 0.2117647, 1,
1.902273, 1.568158, 1.150348, 1, 0, 0.2039216, 1,
1.944605, -0.7274975, 2.521271, 1, 0, 0.1960784, 1,
1.976184, 1.222669, -0.3629895, 1, 0, 0.1921569, 1,
1.998125, -0.2933754, 2.331786, 1, 0, 0.1843137, 1,
2.019327, 0.5324038, 1.125727, 1, 0, 0.1803922, 1,
2.032429, -3.168077, 3.527337, 1, 0, 0.172549, 1,
2.037032, -0.6251982, 1.735659, 1, 0, 0.1686275, 1,
2.048584, -0.2132708, 0.9309654, 1, 0, 0.1607843, 1,
2.116753, -0.1586177, 0.6007053, 1, 0, 0.1568628, 1,
2.125513, 0.546253, 0.6580912, 1, 0, 0.1490196, 1,
2.143242, -0.4258762, 1.168205, 1, 0, 0.145098, 1,
2.164697, 1.276657, 0.6702898, 1, 0, 0.1372549, 1,
2.190595, -0.9401374, 1.062177, 1, 0, 0.1333333, 1,
2.205838, -0.2310491, 0.7538688, 1, 0, 0.1254902, 1,
2.221136, 2.584299, -0.3076576, 1, 0, 0.1215686, 1,
2.250906, -0.1191338, 1.596809, 1, 0, 0.1137255, 1,
2.281365, 0.1464697, 2.473808, 1, 0, 0.1098039, 1,
2.315383, 0.09078437, 1.977316, 1, 0, 0.1019608, 1,
2.338751, 0.7469575, 1.916386, 1, 0, 0.09411765, 1,
2.362231, -0.1894373, 1.553158, 1, 0, 0.09019608, 1,
2.427038, -0.9724745, 1.951602, 1, 0, 0.08235294, 1,
2.431039, -1.080916, 0.9485183, 1, 0, 0.07843138, 1,
2.501031, -0.5348715, 1.40589, 1, 0, 0.07058824, 1,
2.505235, -0.7807017, 2.583124, 1, 0, 0.06666667, 1,
2.568804, -1.15828, 2.5248, 1, 0, 0.05882353, 1,
2.618451, 0.004842695, 1.756032, 1, 0, 0.05490196, 1,
2.653931, -0.572915, 1.3405, 1, 0, 0.04705882, 1,
2.706645, -1.031214, 2.575731, 1, 0, 0.04313726, 1,
2.744844, -0.4855541, 1.608134, 1, 0, 0.03529412, 1,
2.828851, -1.186532, 1.424263, 1, 0, 0.03137255, 1,
3.114194, -0.3554686, 0.9616495, 1, 0, 0.02352941, 1,
3.412344, -1.033413, 2.321614, 1, 0, 0.01960784, 1,
3.897043, 1.777548, 0.5613721, 1, 0, 0.01176471, 1,
3.916054, 0.1055358, 0.289133, 1, 0, 0.007843138, 1
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
0.2612501, -4.191626, -6.435521, 0, -0.5, 0.5, 0.5,
0.2612501, -4.191626, -6.435521, 1, -0.5, 0.5, 0.5,
0.2612501, -4.191626, -6.435521, 1, 1.5, 0.5, 0.5,
0.2612501, -4.191626, -6.435521, 0, 1.5, 0.5, 0.5
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
-4.632532, -0.1487592, -6.435521, 0, -0.5, 0.5, 0.5,
-4.632532, -0.1487592, -6.435521, 1, -0.5, 0.5, 0.5,
-4.632532, -0.1487592, -6.435521, 1, 1.5, 0.5, 0.5,
-4.632532, -0.1487592, -6.435521, 0, 1.5, 0.5, 0.5
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
-4.632532, -4.191626, 0.3630483, 0, -0.5, 0.5, 0.5,
-4.632532, -4.191626, 0.3630483, 1, -0.5, 0.5, 0.5,
-4.632532, -4.191626, 0.3630483, 1, 1.5, 0.5, 0.5,
-4.632532, -4.191626, 0.3630483, 0, 1.5, 0.5, 0.5
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
-2, -3.258657, -4.866621,
2, -3.258657, -4.866621,
-2, -3.258657, -4.866621,
-2, -3.414151, -5.128104,
0, -3.258657, -4.866621,
0, -3.414151, -5.128104,
2, -3.258657, -4.866621,
2, -3.414151, -5.128104
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
-2, -3.725141, -5.651071, 0, -0.5, 0.5, 0.5,
-2, -3.725141, -5.651071, 1, -0.5, 0.5, 0.5,
-2, -3.725141, -5.651071, 1, 1.5, 0.5, 0.5,
-2, -3.725141, -5.651071, 0, 1.5, 0.5, 0.5,
0, -3.725141, -5.651071, 0, -0.5, 0.5, 0.5,
0, -3.725141, -5.651071, 1, -0.5, 0.5, 0.5,
0, -3.725141, -5.651071, 1, 1.5, 0.5, 0.5,
0, -3.725141, -5.651071, 0, 1.5, 0.5, 0.5,
2, -3.725141, -5.651071, 0, -0.5, 0.5, 0.5,
2, -3.725141, -5.651071, 1, -0.5, 0.5, 0.5,
2, -3.725141, -5.651071, 1, 1.5, 0.5, 0.5,
2, -3.725141, -5.651071, 0, 1.5, 0.5, 0.5
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
-3.503197, -3, -4.866621,
-3.503197, 2, -4.866621,
-3.503197, -3, -4.866621,
-3.69142, -3, -5.128104,
-3.503197, -2, -4.866621,
-3.69142, -2, -5.128104,
-3.503197, -1, -4.866621,
-3.69142, -1, -5.128104,
-3.503197, 0, -4.866621,
-3.69142, 0, -5.128104,
-3.503197, 1, -4.866621,
-3.69142, 1, -5.128104,
-3.503197, 2, -4.866621,
-3.69142, 2, -5.128104
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
-4.067864, -3, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, -3, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, -3, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, -3, -5.651071, 0, 1.5, 0.5, 0.5,
-4.067864, -2, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, -2, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, -2, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, -2, -5.651071, 0, 1.5, 0.5, 0.5,
-4.067864, -1, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, -1, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, -1, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, -1, -5.651071, 0, 1.5, 0.5, 0.5,
-4.067864, 0, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, 0, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, 0, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, 0, -5.651071, 0, 1.5, 0.5, 0.5,
-4.067864, 1, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, 1, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, 1, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, 1, -5.651071, 0, 1.5, 0.5, 0.5,
-4.067864, 2, -5.651071, 0, -0.5, 0.5, 0.5,
-4.067864, 2, -5.651071, 1, -0.5, 0.5, 0.5,
-4.067864, 2, -5.651071, 1, 1.5, 0.5, 0.5,
-4.067864, 2, -5.651071, 0, 1.5, 0.5, 0.5
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
-3.503197, -3.258657, -4,
-3.503197, -3.258657, 4,
-3.503197, -3.258657, -4,
-3.69142, -3.414151, -4,
-3.503197, -3.258657, -2,
-3.69142, -3.414151, -2,
-3.503197, -3.258657, 0,
-3.69142, -3.414151, 0,
-3.503197, -3.258657, 2,
-3.69142, -3.414151, 2,
-3.503197, -3.258657, 4,
-3.69142, -3.414151, 4
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
-4.067864, -3.725141, -4, 0, -0.5, 0.5, 0.5,
-4.067864, -3.725141, -4, 1, -0.5, 0.5, 0.5,
-4.067864, -3.725141, -4, 1, 1.5, 0.5, 0.5,
-4.067864, -3.725141, -4, 0, 1.5, 0.5, 0.5,
-4.067864, -3.725141, -2, 0, -0.5, 0.5, 0.5,
-4.067864, -3.725141, -2, 1, -0.5, 0.5, 0.5,
-4.067864, -3.725141, -2, 1, 1.5, 0.5, 0.5,
-4.067864, -3.725141, -2, 0, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 0, 0, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 0, 1, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 0, 1, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 0, 0, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 2, 0, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 2, 1, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 2, 1, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 2, 0, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 4, 0, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 4, 1, -0.5, 0.5, 0.5,
-4.067864, -3.725141, 4, 1, 1.5, 0.5, 0.5,
-4.067864, -3.725141, 4, 0, 1.5, 0.5, 0.5
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
-3.503197, -3.258657, -4.866621,
-3.503197, 2.961138, -4.866621,
-3.503197, -3.258657, 5.592717,
-3.503197, 2.961138, 5.592717,
-3.503197, -3.258657, -4.866621,
-3.503197, -3.258657, 5.592717,
-3.503197, 2.961138, -4.866621,
-3.503197, 2.961138, 5.592717,
-3.503197, -3.258657, -4.866621,
4.025698, -3.258657, -4.866621,
-3.503197, -3.258657, 5.592717,
4.025698, -3.258657, 5.592717,
-3.503197, 2.961138, -4.866621,
4.025698, 2.961138, -4.866621,
-3.503197, 2.961138, 5.592717,
4.025698, 2.961138, 5.592717,
4.025698, -3.258657, -4.866621,
4.025698, 2.961138, -4.866621,
4.025698, -3.258657, 5.592717,
4.025698, 2.961138, 5.592717,
4.025698, -3.258657, -4.866621,
4.025698, -3.258657, 5.592717,
4.025698, 2.961138, -4.866621,
4.025698, 2.961138, 5.592717
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
var radius = 7.641108;
var distance = 33.99615;
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
mvMatrix.translate( -0.2612501, 0.1487592, -0.3630483 );
mvMatrix.scale( 1.097335, 1.328294, 0.789889 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.99615);
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
Chlorethoxyfos<-read.table("Chlorethoxyfos.xyz")
```

```
## Error in read.table("Chlorethoxyfos.xyz"): no lines available in input
```

```r
x<-Chlorethoxyfos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorethoxyfos' not found
```

```r
y<-Chlorethoxyfos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorethoxyfos' not found
```

```r
z<-Chlorethoxyfos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorethoxyfos' not found
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
-3.393553, 0.579035, -2.976112, 0, 0, 1, 1, 1,
-3.042256, -0.09399615, -0.7558234, 1, 0, 0, 1, 1,
-2.770575, 0.5089058, -0.07592169, 1, 0, 0, 1, 1,
-2.752373, -0.8511, -0.5953102, 1, 0, 0, 1, 1,
-2.467138, 0.7387036, -4.022163, 1, 0, 0, 1, 1,
-2.432924, 0.4439074, -2.096209, 1, 0, 0, 1, 1,
-2.410876, 0.939989, -3.521295, 0, 0, 0, 1, 1,
-2.303447, 0.6252301, -0.6424004, 0, 0, 0, 1, 1,
-2.298387, 0.02484766, -2.286891, 0, 0, 0, 1, 1,
-2.27062, -2.046631, -3.02343, 0, 0, 0, 1, 1,
-2.261304, -0.7226114, -0.467228, 0, 0, 0, 1, 1,
-2.25583, -0.1013918, -1.028152, 0, 0, 0, 1, 1,
-2.244852, -0.6057321, -1.017228, 0, 0, 0, 1, 1,
-2.214463, 0.2655033, -2.93884, 1, 1, 1, 1, 1,
-2.166342, -1.091226, -2.205711, 1, 1, 1, 1, 1,
-2.145206, 0.4564233, 0.06934445, 1, 1, 1, 1, 1,
-2.141963, -0.1078417, -1.81602, 1, 1, 1, 1, 1,
-2.104681, -0.5064155, -2.147085, 1, 1, 1, 1, 1,
-2.078471, -1.192535, -2.172715, 1, 1, 1, 1, 1,
-2.075901, -1.887208, -2.772049, 1, 1, 1, 1, 1,
-2.068292, 0.3365015, -2.868, 1, 1, 1, 1, 1,
-1.997955, 0.243213, -0.7326764, 1, 1, 1, 1, 1,
-1.976494, 0.6864132, -0.03595403, 1, 1, 1, 1, 1,
-1.95492, 1.557835, -1.512653, 1, 1, 1, 1, 1,
-1.951253, 1.499157, -1.741423, 1, 1, 1, 1, 1,
-1.941963, 0.2918445, -1.326095, 1, 1, 1, 1, 1,
-1.923506, 1.099845, -2.578958, 1, 1, 1, 1, 1,
-1.9162, 1.906717, -0.5498484, 1, 1, 1, 1, 1,
-1.873679, -0.0131435, -0.9257193, 0, 0, 1, 1, 1,
-1.864905, -0.960547, -1.789562, 1, 0, 0, 1, 1,
-1.860294, 1.157388, -0.9502579, 1, 0, 0, 1, 1,
-1.85884, 0.2576961, -1.422822, 1, 0, 0, 1, 1,
-1.848541, -0.3450887, -1.848133, 1, 0, 0, 1, 1,
-1.831751, -0.8466516, -2.196901, 1, 0, 0, 1, 1,
-1.809832, -1.474411, -2.558962, 0, 0, 0, 1, 1,
-1.796268, 0.115862, -0.5174336, 0, 0, 0, 1, 1,
-1.792503, 0.5843244, -2.574117, 0, 0, 0, 1, 1,
-1.791574, 0.09248681, -3.317749, 0, 0, 0, 1, 1,
-1.790194, 0.710032, -3.360568, 0, 0, 0, 1, 1,
-1.78836, -1.424605, -1.528327, 0, 0, 0, 1, 1,
-1.787847, -0.5874659, -1.611685, 0, 0, 0, 1, 1,
-1.783056, 1.522528, 1.762795, 1, 1, 1, 1, 1,
-1.766218, 0.9138949, -1.145319, 1, 1, 1, 1, 1,
-1.762537, 1.076852, -2.960268, 1, 1, 1, 1, 1,
-1.760746, 0.58881, -0.8961946, 1, 1, 1, 1, 1,
-1.75647, 0.9954731, -2.735532, 1, 1, 1, 1, 1,
-1.748964, -1.599904, -2.546836, 1, 1, 1, 1, 1,
-1.747117, -1.060567, -2.165208, 1, 1, 1, 1, 1,
-1.740235, -0.1055509, -0.05652602, 1, 1, 1, 1, 1,
-1.731621, -0.8074496, -1.930863, 1, 1, 1, 1, 1,
-1.72635, -1.073405, -2.805092, 1, 1, 1, 1, 1,
-1.725019, -1.540024, -2.289642, 1, 1, 1, 1, 1,
-1.721854, -1.346868, -3.133005, 1, 1, 1, 1, 1,
-1.708939, 1.106253, -1.312151, 1, 1, 1, 1, 1,
-1.695778, 0.821871, -1.797569, 1, 1, 1, 1, 1,
-1.69346, -0.5165685, -2.43451, 1, 1, 1, 1, 1,
-1.682054, -1.718912, -2.655468, 0, 0, 1, 1, 1,
-1.680059, -0.3920046, -0.3569415, 1, 0, 0, 1, 1,
-1.663668, -0.08315832, -2.231794, 1, 0, 0, 1, 1,
-1.655119, 0.01321119, -0.9489253, 1, 0, 0, 1, 1,
-1.640836, -0.4288914, -3.557049, 1, 0, 0, 1, 1,
-1.620749, -1.080472, -1.091742, 1, 0, 0, 1, 1,
-1.605659, 0.1944903, -2.627936, 0, 0, 0, 1, 1,
-1.60201, 0.6039939, -1.35993, 0, 0, 0, 1, 1,
-1.600755, -1.10835, -2.090894, 0, 0, 0, 1, 1,
-1.588551, -0.2864947, -2.24906, 0, 0, 0, 1, 1,
-1.587442, 0.1124745, -1.472717, 0, 0, 0, 1, 1,
-1.579846, 0.7511847, -1.964636, 0, 0, 0, 1, 1,
-1.572963, -0.5220965, -1.502939, 0, 0, 0, 1, 1,
-1.549827, -0.2829767, -1.599896, 1, 1, 1, 1, 1,
-1.546804, -0.4556649, -0.4669135, 1, 1, 1, 1, 1,
-1.545263, 0.7298692, 1.398439, 1, 1, 1, 1, 1,
-1.537078, -0.692542, -1.824946, 1, 1, 1, 1, 1,
-1.536016, 0.2621247, -1.021899, 1, 1, 1, 1, 1,
-1.533977, -0.658561, -0.8187943, 1, 1, 1, 1, 1,
-1.530464, -0.3022543, -0.8864686, 1, 1, 1, 1, 1,
-1.52512, 0.05219233, -0.3742678, 1, 1, 1, 1, 1,
-1.518297, 0.8961067, 0.08490205, 1, 1, 1, 1, 1,
-1.517676, -0.4123759, -1.622296, 1, 1, 1, 1, 1,
-1.498731, -0.9135383, -0.9909598, 1, 1, 1, 1, 1,
-1.498119, 0.6295153, -2.401827, 1, 1, 1, 1, 1,
-1.485746, 0.5977587, -0.8219331, 1, 1, 1, 1, 1,
-1.477036, -0.03960137, -1.468437, 1, 1, 1, 1, 1,
-1.475135, 1.32896, -0.9588879, 1, 1, 1, 1, 1,
-1.472908, 2.417109, -0.01035897, 0, 0, 1, 1, 1,
-1.444181, -0.4174021, 0.3885869, 1, 0, 0, 1, 1,
-1.443734, -0.1917285, -2.248218, 1, 0, 0, 1, 1,
-1.433257, 1.115339, -0.2451921, 1, 0, 0, 1, 1,
-1.418874, -0.5555418, -2.45206, 1, 0, 0, 1, 1,
-1.410242, 0.7718843, -2.217863, 1, 0, 0, 1, 1,
-1.406368, 2.026875, -0.6659971, 0, 0, 0, 1, 1,
-1.397411, -0.1428083, -2.952789, 0, 0, 0, 1, 1,
-1.394471, -1.56677, -3.057519, 0, 0, 0, 1, 1,
-1.38993, -0.002697082, -1.302755, 0, 0, 0, 1, 1,
-1.388596, 1.999896, -1.608641, 0, 0, 0, 1, 1,
-1.388144, -0.5682287, -1.299091, 0, 0, 0, 1, 1,
-1.386834, -0.4338468, -2.155118, 0, 0, 0, 1, 1,
-1.383088, 0.2623085, -0.4124663, 1, 1, 1, 1, 1,
-1.376775, 1.735807, 0.7547817, 1, 1, 1, 1, 1,
-1.370301, -0.09855438, -1.130754, 1, 1, 1, 1, 1,
-1.365447, -0.262573, -1.301077, 1, 1, 1, 1, 1,
-1.365198, 0.7277648, 0.1261224, 1, 1, 1, 1, 1,
-1.364391, 2.459736, -2.251037, 1, 1, 1, 1, 1,
-1.359934, -0.9097078, -3.379647, 1, 1, 1, 1, 1,
-1.353118, -1.318179, -1.987763, 1, 1, 1, 1, 1,
-1.345415, 0.44289, -1.597159, 1, 1, 1, 1, 1,
-1.338147, -1.699795, -2.540293, 1, 1, 1, 1, 1,
-1.327022, -0.0568075, -1.132494, 1, 1, 1, 1, 1,
-1.31866, -0.4040481, -4.531217, 1, 1, 1, 1, 1,
-1.318106, -1.09731, -3.568683, 1, 1, 1, 1, 1,
-1.317022, -0.7051429, -2.074477, 1, 1, 1, 1, 1,
-1.304848, 0.2597311, 0.2376579, 1, 1, 1, 1, 1,
-1.300913, -0.05311958, -2.718815, 0, 0, 1, 1, 1,
-1.30083, 0.1512088, -1.159815, 1, 0, 0, 1, 1,
-1.295113, -0.7872725, -2.091899, 1, 0, 0, 1, 1,
-1.294423, -1.341451, -2.566266, 1, 0, 0, 1, 1,
-1.292914, -2.635592, -3.135916, 1, 0, 0, 1, 1,
-1.286094, -0.2930665, -3.435101, 1, 0, 0, 1, 1,
-1.283833, 0.05865973, -0.9863555, 0, 0, 0, 1, 1,
-1.274888, 1.055544, 0.2391535, 0, 0, 0, 1, 1,
-1.270506, -1.329141, -1.530274, 0, 0, 0, 1, 1,
-1.264763, 0.8380263, -0.6530985, 0, 0, 0, 1, 1,
-1.263431, -0.3722382, -1.240261, 0, 0, 0, 1, 1,
-1.258638, -1.448143, -0.8730575, 0, 0, 0, 1, 1,
-1.25513, 0.01105643, -1.926284, 0, 0, 0, 1, 1,
-1.250704, 0.5166522, -2.226525, 1, 1, 1, 1, 1,
-1.249123, -1.54797, -1.099658, 1, 1, 1, 1, 1,
-1.242009, -0.1552327, -1.560585, 1, 1, 1, 1, 1,
-1.235098, -0.6574038, -3.027986, 1, 1, 1, 1, 1,
-1.22943, -0.6966171, -2.07601, 1, 1, 1, 1, 1,
-1.228567, 0.3582572, -1.124382, 1, 1, 1, 1, 1,
-1.227455, 0.5639365, -2.267346, 1, 1, 1, 1, 1,
-1.22187, -0.1328009, -2.025779, 1, 1, 1, 1, 1,
-1.22104, 0.08071376, -1.535335, 1, 1, 1, 1, 1,
-1.203855, 0.2982782, -2.245829, 1, 1, 1, 1, 1,
-1.203699, 0.368308, -2.02221, 1, 1, 1, 1, 1,
-1.195977, -0.02637108, -4.329659, 1, 1, 1, 1, 1,
-1.190995, -1.18656, -2.429437, 1, 1, 1, 1, 1,
-1.184099, 1.294989, -1.446952, 1, 1, 1, 1, 1,
-1.183932, 0.08852483, -1.413674, 1, 1, 1, 1, 1,
-1.178182, 2.596586, -1.226791, 0, 0, 1, 1, 1,
-1.17585, 1.020633, -0.8358189, 1, 0, 0, 1, 1,
-1.175846, 0.6223465, 0.6226333, 1, 0, 0, 1, 1,
-1.173608, -1.356376, -2.689009, 1, 0, 0, 1, 1,
-1.170337, -0.7092419, -4.161621, 1, 0, 0, 1, 1,
-1.168115, 1.063444, -1.187578, 1, 0, 0, 1, 1,
-1.165064, 1.275259, 1.037342, 0, 0, 0, 1, 1,
-1.152188, -0.6684902, -1.916423, 0, 0, 0, 1, 1,
-1.138248, -0.3924153, -1.401975, 0, 0, 0, 1, 1,
-1.136495, -0.1832514, -2.925594, 0, 0, 0, 1, 1,
-1.135664, -0.2680523, -1.703042, 0, 0, 0, 1, 1,
-1.13396, -0.7403646, -2.023934, 0, 0, 0, 1, 1,
-1.123031, 0.06037362, -2.091804, 0, 0, 0, 1, 1,
-1.113443, -0.4018673, -1.369406, 1, 1, 1, 1, 1,
-1.111987, 0.8361177, -0.8024029, 1, 1, 1, 1, 1,
-1.104311, -1.112056, -3.632756, 1, 1, 1, 1, 1,
-1.090309, 1.184076, 0.6547806, 1, 1, 1, 1, 1,
-1.087751, -1.117107, -3.162634, 1, 1, 1, 1, 1,
-1.087432, -0.9724668, -1.632685, 1, 1, 1, 1, 1,
-1.084055, 0.8996127, 1.810259, 1, 1, 1, 1, 1,
-1.081547, -0.7253948, -2.321504, 1, 1, 1, 1, 1,
-1.074342, -1.353978, -2.029699, 1, 1, 1, 1, 1,
-1.055411, 0.9547685, 0.006064904, 1, 1, 1, 1, 1,
-1.053149, -1.425706, -0.5426736, 1, 1, 1, 1, 1,
-1.051085, -0.01882404, -0.9856451, 1, 1, 1, 1, 1,
-1.042434, -1.379862, -3.577449, 1, 1, 1, 1, 1,
-1.034512, -0.2665354, -1.615362, 1, 1, 1, 1, 1,
-1.03267, 0.3723952, 0.447444, 1, 1, 1, 1, 1,
-1.023437, 0.1969046, -2.345481, 0, 0, 1, 1, 1,
-1.020259, -1.163548, -2.596142, 1, 0, 0, 1, 1,
-1.015414, 0.08376652, -1.088753, 1, 0, 0, 1, 1,
-1.000836, 0.3616958, -1.200209, 1, 0, 0, 1, 1,
-0.9984047, 1.499218, 1.381855, 1, 0, 0, 1, 1,
-0.9931523, 1.770036, 0.5819939, 1, 0, 0, 1, 1,
-0.9902808, 0.5162655, 0.5963143, 0, 0, 0, 1, 1,
-0.9902107, 0.2343526, 0.5047535, 0, 0, 0, 1, 1,
-0.986699, -0.5548542, -1.472482, 0, 0, 0, 1, 1,
-0.9858777, -1.554232, -1.842501, 0, 0, 0, 1, 1,
-0.9740685, 0.2109541, -1.943034, 0, 0, 0, 1, 1,
-0.9708523, -0.4899217, -0.8217915, 0, 0, 0, 1, 1,
-0.9649861, -0.86433, -0.5824431, 0, 0, 0, 1, 1,
-0.9648601, 0.07761365, -2.722607, 1, 1, 1, 1, 1,
-0.9644855, 0.006882063, -0.6972974, 1, 1, 1, 1, 1,
-0.9629602, -0.03932932, -0.9700814, 1, 1, 1, 1, 1,
-0.9525082, -1.388685, -2.277937, 1, 1, 1, 1, 1,
-0.9521598, -0.1273337, -3.341473, 1, 1, 1, 1, 1,
-0.9407354, -0.9872503, -0.5183909, 1, 1, 1, 1, 1,
-0.936234, -0.4082235, -2.175983, 1, 1, 1, 1, 1,
-0.9343162, -0.183807, -2.160324, 1, 1, 1, 1, 1,
-0.9331545, 1.524318, 0.2252645, 1, 1, 1, 1, 1,
-0.9306493, -0.1918098, -0.7140289, 1, 1, 1, 1, 1,
-0.9294283, 0.4313791, -1.285196, 1, 1, 1, 1, 1,
-0.9179521, -1.708207, -1.633282, 1, 1, 1, 1, 1,
-0.9156467, 0.4285787, -1.495348, 1, 1, 1, 1, 1,
-0.8806067, -0.3410936, -2.697322, 1, 1, 1, 1, 1,
-0.8730797, -0.8229551, -1.06477, 1, 1, 1, 1, 1,
-0.864498, -0.08957516, -2.308713, 0, 0, 1, 1, 1,
-0.8617654, -2.237956, -3.630377, 1, 0, 0, 1, 1,
-0.8545768, -0.09867881, -0.9988692, 1, 0, 0, 1, 1,
-0.8542404, -0.4782251, -1.566164, 1, 0, 0, 1, 1,
-0.8529907, 0.3227077, 0.33992, 1, 0, 0, 1, 1,
-0.8518378, -1.102556, -3.018073, 1, 0, 0, 1, 1,
-0.8419051, 2.344826, -1.170697, 0, 0, 0, 1, 1,
-0.8390448, 0.8170581, -2.246416, 0, 0, 0, 1, 1,
-0.8356915, 1.401839, -0.3131606, 0, 0, 0, 1, 1,
-0.8323061, -1.923164, -4.7143, 0, 0, 0, 1, 1,
-0.8284738, -1.865916, -2.743419, 0, 0, 0, 1, 1,
-0.8278848, 0.6700395, -0.2602429, 0, 0, 0, 1, 1,
-0.8275408, 0.5356461, -2.95125, 0, 0, 0, 1, 1,
-0.8250071, -1.198159, -2.988481, 1, 1, 1, 1, 1,
-0.8221925, -1.158397, -3.66249, 1, 1, 1, 1, 1,
-0.8187559, 0.07702406, -1.81727, 1, 1, 1, 1, 1,
-0.8133483, -0.1998883, -0.6679953, 1, 1, 1, 1, 1,
-0.8131968, -2.535118, -3.97186, 1, 1, 1, 1, 1,
-0.8023108, 0.5976998, -0.1531167, 1, 1, 1, 1, 1,
-0.8003455, 0.4168222, -1.131786, 1, 1, 1, 1, 1,
-0.7990862, -0.0679495, 0.0619594, 1, 1, 1, 1, 1,
-0.7980003, 0.1241039, -1.59753, 1, 1, 1, 1, 1,
-0.7960032, -0.8114247, -2.773124, 1, 1, 1, 1, 1,
-0.7915124, 1.189037, 0.5857629, 1, 1, 1, 1, 1,
-0.7908529, -0.7646428, -1.224524, 1, 1, 1, 1, 1,
-0.7905716, 1.073099, -1.023325, 1, 1, 1, 1, 1,
-0.7842835, 0.3806541, -1.663996, 1, 1, 1, 1, 1,
-0.7672053, -1.312994, -2.032765, 1, 1, 1, 1, 1,
-0.7644978, -0.2930872, -0.6837617, 0, 0, 1, 1, 1,
-0.762217, 0.04621455, -1.217029, 1, 0, 0, 1, 1,
-0.7587593, -1.018157, -3.629673, 1, 0, 0, 1, 1,
-0.7584556, -0.6491134, -1.312043, 1, 0, 0, 1, 1,
-0.7552137, 1.645644, -0.01881553, 1, 0, 0, 1, 1,
-0.7386521, -0.2546852, -0.5127288, 1, 0, 0, 1, 1,
-0.7339535, -0.6935149, -2.415497, 0, 0, 0, 1, 1,
-0.7316702, 1.080213, -0.2046964, 0, 0, 0, 1, 1,
-0.7315381, -2.047049, -2.705975, 0, 0, 0, 1, 1,
-0.730106, 0.09866209, -1.76489, 0, 0, 0, 1, 1,
-0.7279706, 0.960715, 1.141262, 0, 0, 0, 1, 1,
-0.720639, -0.1274778, -0.8360485, 0, 0, 0, 1, 1,
-0.7134449, 1.146121, 1.835533, 0, 0, 0, 1, 1,
-0.7082862, 0.6189265, 0.6032435, 1, 1, 1, 1, 1,
-0.7079718, 2.328082, 0.9047899, 1, 1, 1, 1, 1,
-0.7076787, 1.23539, 0.1526882, 1, 1, 1, 1, 1,
-0.7071897, -1.561584, -2.919122, 1, 1, 1, 1, 1,
-0.7065154, -1.606115, -2.3407, 1, 1, 1, 1, 1,
-0.7017027, 0.461114, -0.558468, 1, 1, 1, 1, 1,
-0.6983643, 1.123217, -0.6126415, 1, 1, 1, 1, 1,
-0.6954886, 0.5292221, -0.1663577, 1, 1, 1, 1, 1,
-0.6946324, -0.474105, -3.904517, 1, 1, 1, 1, 1,
-0.691557, -0.6719545, -3.682854, 1, 1, 1, 1, 1,
-0.6831444, -1.65424, -2.143803, 1, 1, 1, 1, 1,
-0.6791461, -0.5374257, -2.587326, 1, 1, 1, 1, 1,
-0.6790419, 0.3379503, -1.618251, 1, 1, 1, 1, 1,
-0.6708887, -0.6757704, -4.023335, 1, 1, 1, 1, 1,
-0.6597355, 0.2556234, -0.4917564, 1, 1, 1, 1, 1,
-0.6572394, 1.453621, 0.3844779, 0, 0, 1, 1, 1,
-0.6544273, -0.4875627, -1.827009, 1, 0, 0, 1, 1,
-0.6543378, -0.7093025, -0.4489569, 1, 0, 0, 1, 1,
-0.6488236, 0.5794893, -0.7087831, 1, 0, 0, 1, 1,
-0.6483094, 0.2208254, -2.202794, 1, 0, 0, 1, 1,
-0.6398771, 0.2352757, -0.3631643, 1, 0, 0, 1, 1,
-0.6371383, -0.6313172, -3.617327, 0, 0, 0, 1, 1,
-0.6369063, -0.1290093, -0.7818948, 0, 0, 0, 1, 1,
-0.633935, -0.4020825, -1.092568, 0, 0, 0, 1, 1,
-0.6269866, -0.970753, -1.589142, 0, 0, 0, 1, 1,
-0.6261398, -1.082536, -2.617807, 0, 0, 0, 1, 1,
-0.6242126, -1.254519, -2.946115, 0, 0, 0, 1, 1,
-0.6241916, 0.9442887, 0.4398066, 0, 0, 0, 1, 1,
-0.6233398, -0.7507265, -4.552034, 1, 1, 1, 1, 1,
-0.6204737, -0.3705938, -3.259911, 1, 1, 1, 1, 1,
-0.6203398, -0.1826022, -2.92642, 1, 1, 1, 1, 1,
-0.6202447, -1.89128, -2.461438, 1, 1, 1, 1, 1,
-0.6160676, 1.735429, 0.04432499, 1, 1, 1, 1, 1,
-0.615967, -0.3280642, -1.304275, 1, 1, 1, 1, 1,
-0.6120698, 1.012895, -1.670696, 1, 1, 1, 1, 1,
-0.6109592, 0.4590098, 0.1658971, 1, 1, 1, 1, 1,
-0.6071576, -2.068492, -2.788846, 1, 1, 1, 1, 1,
-0.6050792, -0.66115, -3.066777, 1, 1, 1, 1, 1,
-0.5997087, -0.5270232, -0.8863949, 1, 1, 1, 1, 1,
-0.5993802, -0.9218853, -3.138422, 1, 1, 1, 1, 1,
-0.598914, -0.02168015, -1.909673, 1, 1, 1, 1, 1,
-0.5983832, -0.290348, -0.8073798, 1, 1, 1, 1, 1,
-0.5846992, 1.229009, -2.493948, 1, 1, 1, 1, 1,
-0.5754688, -1.596596, -2.511117, 0, 0, 1, 1, 1,
-0.5742859, 0.7516591, -0.4245723, 1, 0, 0, 1, 1,
-0.5711201, 1.18336, -0.7227202, 1, 0, 0, 1, 1,
-0.5655838, -0.4146095, -3.441777, 1, 0, 0, 1, 1,
-0.564582, 0.4350868, 0.2703831, 1, 0, 0, 1, 1,
-0.5548875, 1.209719, -0.5984563, 1, 0, 0, 1, 1,
-0.5503915, -0.1400819, -1.913106, 0, 0, 0, 1, 1,
-0.550268, -0.5283844, -2.156869, 0, 0, 0, 1, 1,
-0.5487955, -0.8841763, -1.740564, 0, 0, 0, 1, 1,
-0.5484095, -0.1620883, -2.436997, 0, 0, 0, 1, 1,
-0.537494, 1.056076, -1.998772, 0, 0, 0, 1, 1,
-0.5340761, -1.117525, -2.478763, 0, 0, 0, 1, 1,
-0.5324507, 0.004104742, -0.3505333, 0, 0, 0, 1, 1,
-0.5301297, 1.900847, -1.007028, 1, 1, 1, 1, 1,
-0.5298983, -0.2669899, -0.4430673, 1, 1, 1, 1, 1,
-0.5296412, -1.55067, -1.777045, 1, 1, 1, 1, 1,
-0.5295865, 0.7695485, -0.5767359, 1, 1, 1, 1, 1,
-0.5281082, -0.2253308, -0.5802293, 1, 1, 1, 1, 1,
-0.5223589, -1.606118, -3.992963, 1, 1, 1, 1, 1,
-0.52041, 0.9848506, 0.2467033, 1, 1, 1, 1, 1,
-0.5145783, 0.06496807, -3.597305, 1, 1, 1, 1, 1,
-0.5134575, -0.8895719, -3.870871, 1, 1, 1, 1, 1,
-0.5023904, 0.1447067, -2.104398, 1, 1, 1, 1, 1,
-0.4975134, 0.6699435, 0.5038279, 1, 1, 1, 1, 1,
-0.4963331, 0.04216908, -1.361875, 1, 1, 1, 1, 1,
-0.4939999, 0.5398527, 0.2946242, 1, 1, 1, 1, 1,
-0.4939126, -0.8989732, -2.425107, 1, 1, 1, 1, 1,
-0.4921221, -0.3526924, -0.992916, 1, 1, 1, 1, 1,
-0.4901656, 0.3451817, -0.0150534, 0, 0, 1, 1, 1,
-0.488621, 0.2680693, -2.474772, 1, 0, 0, 1, 1,
-0.485185, 0.4497882, -1.612403, 1, 0, 0, 1, 1,
-0.4848277, 1.157078, -0.7298859, 1, 0, 0, 1, 1,
-0.4797661, -0.1022232, -2.529344, 1, 0, 0, 1, 1,
-0.4795213, -0.00342015, -0.7046792, 1, 0, 0, 1, 1,
-0.4791561, -1.745514, -1.257893, 0, 0, 0, 1, 1,
-0.4772124, 1.983159, -1.557124, 0, 0, 0, 1, 1,
-0.4751901, 0.1576953, -1.492418, 0, 0, 0, 1, 1,
-0.4725438, 0.789251, 0.2584087, 0, 0, 0, 1, 1,
-0.4699124, -0.6380357, 0.09041236, 0, 0, 0, 1, 1,
-0.4683102, 0.5835834, -2.607184, 0, 0, 0, 1, 1,
-0.4662664, -0.9460586, -1.431067, 0, 0, 0, 1, 1,
-0.4612635, 1.043875, -1.493153, 1, 1, 1, 1, 1,
-0.4607112, 2.098643, 0.2137583, 1, 1, 1, 1, 1,
-0.4517487, 1.44839, 0.5422935, 1, 1, 1, 1, 1,
-0.4390488, 0.8842921, -1.191496, 1, 1, 1, 1, 1,
-0.4386955, -1.41143, -1.698228, 1, 1, 1, 1, 1,
-0.4323822, 1.143958, 0.08834913, 1, 1, 1, 1, 1,
-0.4312134, -0.6554773, -3.858993, 1, 1, 1, 1, 1,
-0.4286393, -0.01592112, -1.247967, 1, 1, 1, 1, 1,
-0.4222109, 0.3530168, -0.8574415, 1, 1, 1, 1, 1,
-0.4210721, 1.110009, -0.80395, 1, 1, 1, 1, 1,
-0.4194715, -0.8824705, -2.782245, 1, 1, 1, 1, 1,
-0.4183397, 0.5522428, -0.5275922, 1, 1, 1, 1, 1,
-0.4176829, 1.542587, -0.3156282, 1, 1, 1, 1, 1,
-0.4135078, -0.09547872, -1.092941, 1, 1, 1, 1, 1,
-0.4079632, -1.468794, -2.13196, 1, 1, 1, 1, 1,
-0.3946643, 0.142195, -1.288682, 0, 0, 1, 1, 1,
-0.3921122, -1.051827, -0.7047954, 1, 0, 0, 1, 1,
-0.3886821, -1.389939, -4.49928, 1, 0, 0, 1, 1,
-0.3885636, 0.4592696, 0.7116764, 1, 0, 0, 1, 1,
-0.38622, -0.2924927, -2.286448, 1, 0, 0, 1, 1,
-0.3859833, 1.660424, -1.36388, 1, 0, 0, 1, 1,
-0.3799956, -0.3455902, -2.826252, 0, 0, 0, 1, 1,
-0.3766681, 1.027022, 1.03729, 0, 0, 0, 1, 1,
-0.3728133, 1.174749, -0.6606118, 0, 0, 0, 1, 1,
-0.3727546, 1.45759, -0.4069566, 0, 0, 0, 1, 1,
-0.3727477, -2.012608, -1.818632, 0, 0, 0, 1, 1,
-0.3726779, -1.305298, -1.441912, 0, 0, 0, 1, 1,
-0.3721619, -1.123631, -3.914126, 0, 0, 0, 1, 1,
-0.3715093, 0.7705153, -1.230404, 1, 1, 1, 1, 1,
-0.3713744, -0.3456945, -3.554471, 1, 1, 1, 1, 1,
-0.3703925, -1.136699, -1.395561, 1, 1, 1, 1, 1,
-0.3696564, 0.02941041, -1.987364, 1, 1, 1, 1, 1,
-0.3675209, -1.603448, -2.940341, 1, 1, 1, 1, 1,
-0.366693, 2.015945, -0.4720152, 1, 1, 1, 1, 1,
-0.3632512, 0.4515614, -0.6912125, 1, 1, 1, 1, 1,
-0.3630135, 1.902559, 0.2154745, 1, 1, 1, 1, 1,
-0.3583444, -1.309386, -3.607829, 1, 1, 1, 1, 1,
-0.3547385, 0.6446427, -0.7932458, 1, 1, 1, 1, 1,
-0.3544316, 0.01143347, -3.26012, 1, 1, 1, 1, 1,
-0.3543949, 1.010715, -0.8502689, 1, 1, 1, 1, 1,
-0.3530535, -0.870709, -2.78693, 1, 1, 1, 1, 1,
-0.3529491, 0.7297147, -0.8614168, 1, 1, 1, 1, 1,
-0.3508054, 1.015751, -0.3415942, 1, 1, 1, 1, 1,
-0.3486125, 0.1615536, -1.215147, 0, 0, 1, 1, 1,
-0.3473238, 1.671186, -0.08273451, 1, 0, 0, 1, 1,
-0.3397082, -0.1295767, -2.344841, 1, 0, 0, 1, 1,
-0.338808, 1.472386, -0.6180071, 1, 0, 0, 1, 1,
-0.3344729, 1.674242, -0.5259556, 1, 0, 0, 1, 1,
-0.3319818, 2.48273, 0.5851963, 1, 0, 0, 1, 1,
-0.3297887, 1.005626, 0.7775831, 0, 0, 0, 1, 1,
-0.3246686, -1.286366, -1.896958, 0, 0, 0, 1, 1,
-0.323662, 0.2455653, -1.748263, 0, 0, 0, 1, 1,
-0.3231242, -1.788525, -3.982453, 0, 0, 0, 1, 1,
-0.3229034, 0.1316079, 0.9937996, 0, 0, 0, 1, 1,
-0.3223506, 0.4783691, -0.6344412, 0, 0, 0, 1, 1,
-0.3223449, 0.9419554, 0.710052, 0, 0, 0, 1, 1,
-0.3187787, 0.544748, -1.528956, 1, 1, 1, 1, 1,
-0.3186577, 1.347145, -1.011599, 1, 1, 1, 1, 1,
-0.318278, -1.511618, -3.511312, 1, 1, 1, 1, 1,
-0.314362, -0.7724091, -1.350433, 1, 1, 1, 1, 1,
-0.3046834, -1.676715, -3.116482, 1, 1, 1, 1, 1,
-0.3040017, 0.203894, -1.504687, 1, 1, 1, 1, 1,
-0.3028154, -0.8488266, -3.427749, 1, 1, 1, 1, 1,
-0.3003401, -0.4892221, -2.530736, 1, 1, 1, 1, 1,
-0.3002348, -0.2344372, -1.684274, 1, 1, 1, 1, 1,
-0.2998652, -0.2800255, -1.364084, 1, 1, 1, 1, 1,
-0.2995379, -1.103594, -2.948281, 1, 1, 1, 1, 1,
-0.2987444, 0.5142382, -0.6710249, 1, 1, 1, 1, 1,
-0.2983636, 0.6744341, -1.406293, 1, 1, 1, 1, 1,
-0.2947513, -0.0008188047, -2.45264, 1, 1, 1, 1, 1,
-0.2925382, -0.2051397, -0.8505803, 1, 1, 1, 1, 1,
-0.2916935, 1.262843, 1.36627, 0, 0, 1, 1, 1,
-0.2914716, 0.6041719, -0.84576, 1, 0, 0, 1, 1,
-0.2905838, 0.2294165, -2.171602, 1, 0, 0, 1, 1,
-0.2884592, 0.3093606, -1.326229, 1, 0, 0, 1, 1,
-0.2882608, 1.813925, -0.8109811, 1, 0, 0, 1, 1,
-0.2853338, 0.4625645, -0.4782874, 1, 0, 0, 1, 1,
-0.2848127, -0.1235321, -3.043221, 0, 0, 0, 1, 1,
-0.284318, 0.5781088, -0.4942297, 0, 0, 0, 1, 1,
-0.283152, 0.2987882, -0.1581313, 0, 0, 0, 1, 1,
-0.2772136, -0.5116816, -2.64469, 0, 0, 0, 1, 1,
-0.2767748, -0.5964739, -3.041213, 0, 0, 0, 1, 1,
-0.2737118, 0.5726743, -0.4249566, 0, 0, 0, 1, 1,
-0.2734132, -1.623223, -3.868761, 0, 0, 0, 1, 1,
-0.2700066, -0.5201054, -2.010415, 1, 1, 1, 1, 1,
-0.2671843, 0.7814886, -0.1342835, 1, 1, 1, 1, 1,
-0.2625248, -1.880636, -3.233232, 1, 1, 1, 1, 1,
-0.2604561, 2.468888, 0.2729831, 1, 1, 1, 1, 1,
-0.2574064, 1.754925, -1.817838, 1, 1, 1, 1, 1,
-0.2506554, -1.246519, -3.275021, 1, 1, 1, 1, 1,
-0.2461835, 0.7570891, 0.2554701, 1, 1, 1, 1, 1,
-0.2421135, 0.3070158, -1.527985, 1, 1, 1, 1, 1,
-0.2359563, -0.9732675, -3.958007, 1, 1, 1, 1, 1,
-0.2357676, 0.702314, -0.1287543, 1, 1, 1, 1, 1,
-0.2352144, -0.5720764, -3.33831, 1, 1, 1, 1, 1,
-0.2315948, 1.284131, -0.6437172, 1, 1, 1, 1, 1,
-0.2303765, -0.334075, -0.7949929, 1, 1, 1, 1, 1,
-0.2301748, 0.36306, -0.1583261, 1, 1, 1, 1, 1,
-0.2300943, 1.748549, 1.879511, 1, 1, 1, 1, 1,
-0.2270395, -1.148844, -3.228882, 0, 0, 1, 1, 1,
-0.2250626, -0.8269295, -3.075634, 1, 0, 0, 1, 1,
-0.2244778, -0.9928373, -2.13132, 1, 0, 0, 1, 1,
-0.2222483, 1.658241, -0.6288551, 1, 0, 0, 1, 1,
-0.2192009, 1.382587, -0.6911712, 1, 0, 0, 1, 1,
-0.2184135, -0.6169827, -3.646057, 1, 0, 0, 1, 1,
-0.2054094, -0.4213973, -1.656047, 0, 0, 0, 1, 1,
-0.1994578, -0.918384, -1.455113, 0, 0, 0, 1, 1,
-0.1946878, 0.8474026, -0.6021205, 0, 0, 0, 1, 1,
-0.1883782, 0.3737532, 0.6953106, 0, 0, 0, 1, 1,
-0.1879594, 0.8350816, -1.15166, 0, 0, 0, 1, 1,
-0.1871394, -1.153684, -2.420723, 0, 0, 0, 1, 1,
-0.1855794, -0.02993633, -1.813908, 0, 0, 0, 1, 1,
-0.1818511, -0.5760192, -3.860677, 1, 1, 1, 1, 1,
-0.1808614, -0.4376068, -3.681666, 1, 1, 1, 1, 1,
-0.1804542, -0.4201216, -1.885092, 1, 1, 1, 1, 1,
-0.1792003, 0.7955039, 0.8647801, 1, 1, 1, 1, 1,
-0.1776617, 0.04912773, -1.397871, 1, 1, 1, 1, 1,
-0.1730798, 0.01801939, -1.213048, 1, 1, 1, 1, 1,
-0.1721095, -0.5485561, -3.539363, 1, 1, 1, 1, 1,
-0.1714436, -0.9605098, -3.103685, 1, 1, 1, 1, 1,
-0.1710214, 0.04080719, -2.188872, 1, 1, 1, 1, 1,
-0.1708707, 0.401439, -0.6903676, 1, 1, 1, 1, 1,
-0.1701383, 0.7269167, 0.7785648, 1, 1, 1, 1, 1,
-0.1695893, 0.7159199, 1.51421, 1, 1, 1, 1, 1,
-0.1645147, -1.707631, -2.197328, 1, 1, 1, 1, 1,
-0.1645078, -0.8325949, -2.375395, 1, 1, 1, 1, 1,
-0.1595139, -0.6865891, -2.288576, 1, 1, 1, 1, 1,
-0.1593876, -0.7184175, -0.1280437, 0, 0, 1, 1, 1,
-0.1577362, -0.4310239, -2.807994, 1, 0, 0, 1, 1,
-0.1531865, 1.89462, 1.638489, 1, 0, 0, 1, 1,
-0.1498656, 1.67925, -0.6018726, 1, 0, 0, 1, 1,
-0.1475082, -0.1401679, -1.335455, 1, 0, 0, 1, 1,
-0.1412285, 0.6647121, -0.4059318, 1, 0, 0, 1, 1,
-0.1409229, 0.4180609, -1.000505, 0, 0, 0, 1, 1,
-0.1347688, -0.4515451, -3.03629, 0, 0, 0, 1, 1,
-0.13452, 1.645308, -1.716371, 0, 0, 0, 1, 1,
-0.1325792, -0.2470402, -3.690114, 0, 0, 0, 1, 1,
-0.1292137, 0.5912676, 0.9649234, 0, 0, 0, 1, 1,
-0.1280302, -0.02138763, -2.382806, 0, 0, 0, 1, 1,
-0.1232256, -0.471593, -1.796161, 0, 0, 0, 1, 1,
-0.1232123, 0.2977717, -1.269469, 1, 1, 1, 1, 1,
-0.1215628, -0.1138525, -3.683206, 1, 1, 1, 1, 1,
-0.1208295, -1.084044, -0.6156705, 1, 1, 1, 1, 1,
-0.1181244, -2.02482, -3.237993, 1, 1, 1, 1, 1,
-0.1168091, -0.7608162, -2.143083, 1, 1, 1, 1, 1,
-0.1145304, 0.8389543, -2.203328, 1, 1, 1, 1, 1,
-0.1140207, 0.8444681, -0.7709627, 1, 1, 1, 1, 1,
-0.113615, -0.466565, -2.25139, 1, 1, 1, 1, 1,
-0.1110328, -0.754133, -3.950272, 1, 1, 1, 1, 1,
-0.1107446, 2.024543, -0.7987863, 1, 1, 1, 1, 1,
-0.1086578, 1.714177, 0.5649514, 1, 1, 1, 1, 1,
-0.1074956, -0.02182189, -2.167705, 1, 1, 1, 1, 1,
-0.1063547, -0.4405443, -3.748396, 1, 1, 1, 1, 1,
-0.1035359, -0.7597381, -2.665453, 1, 1, 1, 1, 1,
-0.0964449, 0.1159683, -1.529563, 1, 1, 1, 1, 1,
-0.08957788, -0.5547727, -2.087769, 0, 0, 1, 1, 1,
-0.08855605, 1.294559, -0.8891521, 1, 0, 0, 1, 1,
-0.0852765, 0.07506131, 0.1335984, 1, 0, 0, 1, 1,
-0.0842439, -0.02021776, -3.319677, 1, 0, 0, 1, 1,
-0.08340281, 0.6768986, -0.6610993, 1, 0, 0, 1, 1,
-0.0807781, -0.5190904, -3.393282, 1, 0, 0, 1, 1,
-0.07851298, -0.3915782, -1.785238, 0, 0, 0, 1, 1,
-0.07529122, -0.3598087, -0.8355035, 0, 0, 0, 1, 1,
-0.06779832, 1.237717, 0.5384254, 0, 0, 0, 1, 1,
-0.06544296, 1.017015, 0.7665648, 0, 0, 0, 1, 1,
-0.05671821, 2.314282, 0.2761918, 0, 0, 0, 1, 1,
-0.05606255, -0.6113298, -4.12654, 0, 0, 0, 1, 1,
-0.05516639, 0.4158579, 0.02316245, 0, 0, 0, 1, 1,
-0.05466603, 0.6859378, 0.4256322, 1, 1, 1, 1, 1,
-0.05443429, -0.9642572, -2.13785, 1, 1, 1, 1, 1,
-0.05342636, 2.50702, 1.185148, 1, 1, 1, 1, 1,
-0.05328112, 1.078338, 0.3322008, 1, 1, 1, 1, 1,
-0.05217316, -0.7742133, -1.847839, 1, 1, 1, 1, 1,
-0.04533343, -1.035535, -3.273996, 1, 1, 1, 1, 1,
-0.04047097, -0.594102, -2.760864, 1, 1, 1, 1, 1,
-0.0358839, -0.9803731, -3.551053, 1, 1, 1, 1, 1,
-0.03413675, 0.3120153, -1.50306, 1, 1, 1, 1, 1,
-0.03387981, 0.7019402, -0.4430239, 1, 1, 1, 1, 1,
-0.03164674, 0.3731505, -0.4998661, 1, 1, 1, 1, 1,
-0.03047877, 0.6217741, -1.558864, 1, 1, 1, 1, 1,
-0.02805933, 0.996408, -0.5164921, 1, 1, 1, 1, 1,
-0.02649538, 1.848486, -0.2910722, 1, 1, 1, 1, 1,
-0.02510109, -0.5540078, -3.776372, 1, 1, 1, 1, 1,
-0.02218509, 1.414293, 1.04762, 0, 0, 1, 1, 1,
-0.01626101, 0.3735998, -1.730125, 1, 0, 0, 1, 1,
-0.01539597, -1.008634, -3.610195, 1, 0, 0, 1, 1,
-0.01531382, 0.01427042, -1.1241, 1, 0, 0, 1, 1,
-0.01529722, 0.09668893, 0.2536924, 1, 0, 0, 1, 1,
-0.01456951, 0.3202277, -0.3155144, 1, 0, 0, 1, 1,
-0.009891204, 0.8263179, -0.9285489, 0, 0, 0, 1, 1,
-0.006807061, -1.615396, -1.840593, 0, 0, 0, 1, 1,
-0.006121527, -0.9606133, -0.4056458, 0, 0, 0, 1, 1,
-0.003594806, 1.923069, 1.217496, 0, 0, 0, 1, 1,
0.0001195272, -0.7742494, 2.650416, 0, 0, 0, 1, 1,
0.001666181, 0.7986872, 0.1566253, 0, 0, 0, 1, 1,
0.003776682, -0.6998277, 2.688155, 0, 0, 0, 1, 1,
0.004148342, -0.2644516, 2.412923, 1, 1, 1, 1, 1,
0.01031636, -0.6800032, 2.958167, 1, 1, 1, 1, 1,
0.01050857, 0.4866, 1.455639, 1, 1, 1, 1, 1,
0.01088559, 1.731404, 0.6641145, 1, 1, 1, 1, 1,
0.01116411, -0.4878021, 3.258326, 1, 1, 1, 1, 1,
0.01204637, -0.01962645, 2.439678, 1, 1, 1, 1, 1,
0.01228442, -0.2455673, 1.605274, 1, 1, 1, 1, 1,
0.01778538, 0.5186046, -1.189647, 1, 1, 1, 1, 1,
0.02235734, 0.8058699, -0.8447182, 1, 1, 1, 1, 1,
0.02318472, 0.4122564, -0.9919332, 1, 1, 1, 1, 1,
0.02459319, -1.082639, 3.819655, 1, 1, 1, 1, 1,
0.02942465, -0.1333622, 1.202731, 1, 1, 1, 1, 1,
0.0303237, -0.6342452, 4.108941, 1, 1, 1, 1, 1,
0.03078241, -1.273638, 2.609558, 1, 1, 1, 1, 1,
0.03381903, -1.538566, 2.525763, 1, 1, 1, 1, 1,
0.03496234, -0.4267891, 3.945233, 0, 0, 1, 1, 1,
0.03589403, -0.8164567, 4.082236, 1, 0, 0, 1, 1,
0.04075916, -1.563383, 2.574608, 1, 0, 0, 1, 1,
0.04790278, -0.8768961, 3.67242, 1, 0, 0, 1, 1,
0.05284015, -0.06631909, 2.250158, 1, 0, 0, 1, 1,
0.05411634, -1.096668, 2.014338, 1, 0, 0, 1, 1,
0.05496903, 0.04232263, 1.907401, 0, 0, 0, 1, 1,
0.05539843, -0.1070795, 1.098511, 0, 0, 0, 1, 1,
0.05611984, 0.09124394, 0.3720903, 0, 0, 0, 1, 1,
0.05843224, 0.1536901, 0.1775325, 0, 0, 0, 1, 1,
0.0590606, -0.8537214, 2.172729, 0, 0, 0, 1, 1,
0.05995268, -0.207086, 1.979241, 0, 0, 0, 1, 1,
0.06068203, -0.2200309, 4.703991, 0, 0, 0, 1, 1,
0.06210821, -0.3593261, 1.908896, 1, 1, 1, 1, 1,
0.06409807, 1.237427, 0.5264087, 1, 1, 1, 1, 1,
0.06769374, -0.4916724, 3.538625, 1, 1, 1, 1, 1,
0.06974372, 1.752415, 0.7741968, 1, 1, 1, 1, 1,
0.06988948, -0.2710584, 1.149588, 1, 1, 1, 1, 1,
0.07050053, 0.5041199, -1.217828, 1, 1, 1, 1, 1,
0.07131206, -0.9268721, 2.451653, 1, 1, 1, 1, 1,
0.07834961, -1.668813, 2.648856, 1, 1, 1, 1, 1,
0.07887117, 0.04266245, 1.302606, 1, 1, 1, 1, 1,
0.07995445, 1.082011, 1.017928, 1, 1, 1, 1, 1,
0.0813136, -0.3721501, 2.977695, 1, 1, 1, 1, 1,
0.08702115, -0.5032142, 2.673144, 1, 1, 1, 1, 1,
0.08714267, 0.9831009, 0.4087943, 1, 1, 1, 1, 1,
0.0881575, -0.2530935, 3.146732, 1, 1, 1, 1, 1,
0.08892591, 2.251132, -0.6051115, 1, 1, 1, 1, 1,
0.09137963, 0.5541175, -0.9982291, 0, 0, 1, 1, 1,
0.09168107, 0.3939555, -0.9953923, 1, 0, 0, 1, 1,
0.0938765, 0.7734372, 1.184802, 1, 0, 0, 1, 1,
0.09537365, -0.6303666, 3.55649, 1, 0, 0, 1, 1,
0.1054169, -0.250093, 3.886096, 1, 0, 0, 1, 1,
0.1057791, -0.3222132, 1.291194, 1, 0, 0, 1, 1,
0.1058816, 1.17109, -0.2453758, 0, 0, 0, 1, 1,
0.1082409, -0.3052655, 4.607147, 0, 0, 0, 1, 1,
0.1107269, -1.033013, 3.380875, 0, 0, 0, 1, 1,
0.1129758, 0.704355, 1.427745, 0, 0, 0, 1, 1,
0.1143676, 0.4297036, 0.07928947, 0, 0, 0, 1, 1,
0.1153028, -0.2164277, 4.63036, 0, 0, 0, 1, 1,
0.1222506, -0.5377245, 3.712206, 0, 0, 0, 1, 1,
0.1238275, -0.3169777, 1.69423, 1, 1, 1, 1, 1,
0.1242964, -0.3914292, 3.382967, 1, 1, 1, 1, 1,
0.1289075, -0.8177214, 2.816034, 1, 1, 1, 1, 1,
0.1309024, 1.003644, 0.732623, 1, 1, 1, 1, 1,
0.1350344, -0.650636, 2.619457, 1, 1, 1, 1, 1,
0.1354869, 0.6203536, 1.258823, 1, 1, 1, 1, 1,
0.1387656, -0.9394189, 3.555663, 1, 1, 1, 1, 1,
0.1415081, 0.725492, -0.9757969, 1, 1, 1, 1, 1,
0.1438802, 1.214961, -1.942194, 1, 1, 1, 1, 1,
0.1483844, 0.9290814, 0.9163077, 1, 1, 1, 1, 1,
0.1514654, -1.448153, 2.814963, 1, 1, 1, 1, 1,
0.1545108, 0.5647841, 2.618031, 1, 1, 1, 1, 1,
0.1566756, 0.06784309, 0.1687972, 1, 1, 1, 1, 1,
0.1573121, -0.2480666, 4.118246, 1, 1, 1, 1, 1,
0.1576416, 1.450195, 1.256659, 1, 1, 1, 1, 1,
0.1579578, 0.1536388, 1.290663, 0, 0, 1, 1, 1,
0.1582611, -1.722321, 4.021768, 1, 0, 0, 1, 1,
0.1591942, 0.8408045, -0.6896549, 1, 0, 0, 1, 1,
0.1655487, -0.4647733, 1.739797, 1, 0, 0, 1, 1,
0.170658, -0.739168, 3.046296, 1, 0, 0, 1, 1,
0.1724107, -0.6374924, 4.80222, 1, 0, 0, 1, 1,
0.1731088, -0.3347328, 1.914983, 0, 0, 0, 1, 1,
0.1750386, 0.5751688, 1.635492, 0, 0, 0, 1, 1,
0.1783214, 0.4244829, 0.4176498, 0, 0, 0, 1, 1,
0.1791075, 0.6535807, -0.05965811, 0, 0, 0, 1, 1,
0.1797381, -0.7540443, 1.167246, 0, 0, 0, 1, 1,
0.1804659, -0.2392551, 1.869586, 0, 0, 0, 1, 1,
0.1806403, -0.3862141, 4.028651, 0, 0, 0, 1, 1,
0.1809123, 0.05374441, 1.525723, 1, 1, 1, 1, 1,
0.1818423, -0.6326881, 2.408621, 1, 1, 1, 1, 1,
0.1828704, 0.4285848, -0.6353023, 1, 1, 1, 1, 1,
0.1879952, 0.4877482, 1.041828, 1, 1, 1, 1, 1,
0.1920806, -0.4235753, 2.399077, 1, 1, 1, 1, 1,
0.1935788, -1.192607, 1.40337, 1, 1, 1, 1, 1,
0.196911, 0.1314288, 1.655652, 1, 1, 1, 1, 1,
0.1977814, 0.6852418, 0.8485353, 1, 1, 1, 1, 1,
0.198962, 0.3532083, 2.793202, 1, 1, 1, 1, 1,
0.2004287, 0.02661973, 2.966778, 1, 1, 1, 1, 1,
0.2024347, 2.325471, 0.0779211, 1, 1, 1, 1, 1,
0.2036682, 0.4077157, 1.826906, 1, 1, 1, 1, 1,
0.2063166, -0.8503966, 1.962628, 1, 1, 1, 1, 1,
0.2071172, -0.1491636, 2.303454, 1, 1, 1, 1, 1,
0.2076403, 0.7787294, 0.02420973, 1, 1, 1, 1, 1,
0.2088345, 0.4381251, 0.05538956, 0, 0, 1, 1, 1,
0.2096877, -1.150122, 3.212982, 1, 0, 0, 1, 1,
0.2140042, 0.4083635, -0.614059, 1, 0, 0, 1, 1,
0.2164202, 0.1129835, 1.729071, 1, 0, 0, 1, 1,
0.2204343, -1.32661, 1.344827, 1, 0, 0, 1, 1,
0.2204676, 0.6493206, -0.02786844, 1, 0, 0, 1, 1,
0.2229428, 0.5662925, -0.1523467, 0, 0, 0, 1, 1,
0.2299408, -0.5708419, 5.440397, 0, 0, 0, 1, 1,
0.2333434, -0.601536, 2.557027, 0, 0, 0, 1, 1,
0.23502, 2.056628, 2.277145, 0, 0, 0, 1, 1,
0.2404016, -2.198118, 3.693624, 0, 0, 0, 1, 1,
0.2467696, -0.7893927, 3.569698, 0, 0, 0, 1, 1,
0.2620147, -0.8547191, 4.15821, 0, 0, 0, 1, 1,
0.2661922, 0.2160172, 0.2711935, 1, 1, 1, 1, 1,
0.2665913, -0.2352506, 1.605547, 1, 1, 1, 1, 1,
0.2669785, -0.7240924, 3.520949, 1, 1, 1, 1, 1,
0.2675124, -1.646302, 2.694009, 1, 1, 1, 1, 1,
0.2714016, -2.353939, 2.249562, 1, 1, 1, 1, 1,
0.274408, 2.523549, 0.9314461, 1, 1, 1, 1, 1,
0.2753822, -1.311082, 1.992287, 1, 1, 1, 1, 1,
0.2764078, 0.9012297, 1.954259, 1, 1, 1, 1, 1,
0.2768131, 1.058723, -0.6477685, 1, 1, 1, 1, 1,
0.2775562, 0.1401394, 2.104026, 1, 1, 1, 1, 1,
0.2794534, 0.5397809, 0.3721839, 1, 1, 1, 1, 1,
0.28049, 1.250446, -0.004933316, 1, 1, 1, 1, 1,
0.2818078, -0.4942482, 3.337893, 1, 1, 1, 1, 1,
0.283431, 1.359365, -0.3132673, 1, 1, 1, 1, 1,
0.2836562, -0.5036441, 2.748358, 1, 1, 1, 1, 1,
0.2844649, -1.38633, 4.739915, 0, 0, 1, 1, 1,
0.2852692, 1.729401, 0.9126777, 1, 0, 0, 1, 1,
0.2883178, 0.04076492, 0.6105476, 1, 0, 0, 1, 1,
0.2887564, 0.1810994, 0.8628608, 1, 0, 0, 1, 1,
0.2918148, 0.9907227, -0.9847195, 1, 0, 0, 1, 1,
0.2961139, -0.820567, 2.964073, 1, 0, 0, 1, 1,
0.3067288, 0.5487748, -0.290662, 0, 0, 0, 1, 1,
0.3083627, -0.1346298, 2.459445, 0, 0, 0, 1, 1,
0.3097259, -2.123542, 1.680062, 0, 0, 0, 1, 1,
0.3136733, 0.3671212, -0.5883604, 0, 0, 0, 1, 1,
0.3161918, -1.242684, 4.29659, 0, 0, 0, 1, 1,
0.3210913, -0.5040554, 2.661594, 0, 0, 0, 1, 1,
0.3273855, -2.282719, 3.548825, 0, 0, 0, 1, 1,
0.3325236, 1.739291, -0.1707509, 1, 1, 1, 1, 1,
0.3364496, 1.199615, 1.86025, 1, 1, 1, 1, 1,
0.3375534, -0.8535949, 1.840427, 1, 1, 1, 1, 1,
0.3389429, 0.5033842, 1.901464, 1, 1, 1, 1, 1,
0.3435642, 1.488763, -1.267372, 1, 1, 1, 1, 1,
0.3476853, -0.8860179, 3.748453, 1, 1, 1, 1, 1,
0.3530844, -2.843575, 3.777431, 1, 1, 1, 1, 1,
0.3577472, -0.7968004, 3.363243, 1, 1, 1, 1, 1,
0.3613198, 0.4375825, 0.4371172, 1, 1, 1, 1, 1,
0.3642459, -1.0546, 3.266483, 1, 1, 1, 1, 1,
0.3666672, 0.3348109, 0.2247643, 1, 1, 1, 1, 1,
0.3702523, 1.455155, 0.9467227, 1, 1, 1, 1, 1,
0.3751339, 1.889004, 1.050497, 1, 1, 1, 1, 1,
0.3820839, -0.04288335, 0.7834373, 1, 1, 1, 1, 1,
0.3842728, -0.3341375, 1.668635, 1, 1, 1, 1, 1,
0.3843478, 0.4781593, -1.883692, 0, 0, 1, 1, 1,
0.3857045, -0.0296404, 1.004766, 1, 0, 0, 1, 1,
0.3874312, -0.3690001, 2.467146, 1, 0, 0, 1, 1,
0.3905546, -0.2338322, 3.404285, 1, 0, 0, 1, 1,
0.3940887, -0.1362126, 1.027003, 1, 0, 0, 1, 1,
0.3955979, -0.3817684, 1.661083, 1, 0, 0, 1, 1,
0.4068406, 0.6427653, 1.092398, 0, 0, 0, 1, 1,
0.4082344, -0.117071, 1.113983, 0, 0, 0, 1, 1,
0.4087002, -0.6009064, 2.615505, 0, 0, 0, 1, 1,
0.4137213, 0.2935476, 1.559135, 0, 0, 0, 1, 1,
0.4186873, 0.6186547, -0.1183177, 0, 0, 0, 1, 1,
0.4239902, 0.2230054, 1.527199, 0, 0, 0, 1, 1,
0.4254572, 1.834582, -0.07833593, 0, 0, 0, 1, 1,
0.4280438, -1.52309, 2.50612, 1, 1, 1, 1, 1,
0.428833, 0.231801, -0.8097471, 1, 1, 1, 1, 1,
0.4293131, 0.8631486, 1.26592, 1, 1, 1, 1, 1,
0.4297234, 0.1656067, -1.57299, 1, 1, 1, 1, 1,
0.4319277, -0.7360408, 1.907897, 1, 1, 1, 1, 1,
0.4319724, 2.870559, -0.6001926, 1, 1, 1, 1, 1,
0.4335216, -0.8278405, 3.820399, 1, 1, 1, 1, 1,
0.4353398, 0.7278048, -0.674356, 1, 1, 1, 1, 1,
0.4368298, 0.2383071, 1.711778, 1, 1, 1, 1, 1,
0.4389087, 0.6354526, -0.4860105, 1, 1, 1, 1, 1,
0.4420013, 1.086318, 0.4730198, 1, 1, 1, 1, 1,
0.445756, 0.861753, -0.2031459, 1, 1, 1, 1, 1,
0.4458951, -0.05954866, 0.02264421, 1, 1, 1, 1, 1,
0.4472642, -0.9013761, 3.688234, 1, 1, 1, 1, 1,
0.4517241, 0.1782015, 0.2967995, 1, 1, 1, 1, 1,
0.4531981, 1.24125, -0.3060711, 0, 0, 1, 1, 1,
0.4534131, -0.6784635, 2.804466, 1, 0, 0, 1, 1,
0.4540358, -1.833937, 2.628311, 1, 0, 0, 1, 1,
0.4575183, 0.3101976, 1.557352, 1, 0, 0, 1, 1,
0.4610849, 0.5111827, 1.784698, 1, 0, 0, 1, 1,
0.4648108, -0.250387, 2.669818, 1, 0, 0, 1, 1,
0.4704379, -1.004328, 3.969449, 0, 0, 0, 1, 1,
0.4708284, 0.833199, 1.132753, 0, 0, 0, 1, 1,
0.4734613, 0.1633535, 1.808627, 0, 0, 0, 1, 1,
0.478294, 0.2885671, 0.9996276, 0, 0, 0, 1, 1,
0.4819641, -2.336634, 3.467635, 0, 0, 0, 1, 1,
0.4828435, -1.234711, 4.112141, 0, 0, 0, 1, 1,
0.4849412, -1.302177, 4.264387, 0, 0, 0, 1, 1,
0.5014343, 0.1709134, 1.26208, 1, 1, 1, 1, 1,
0.505791, 0.4839656, 1.326123, 1, 1, 1, 1, 1,
0.5063093, 0.399572, 0.4394067, 1, 1, 1, 1, 1,
0.5073336, 0.4428348, 0.953072, 1, 1, 1, 1, 1,
0.5105435, -0.4387529, 3.320394, 1, 1, 1, 1, 1,
0.5105522, -1.612089, 2.779497, 1, 1, 1, 1, 1,
0.5155773, -0.2044372, 1.04181, 1, 1, 1, 1, 1,
0.5220345, 0.4982046, 2.017915, 1, 1, 1, 1, 1,
0.5275843, -1.17038, 2.893965, 1, 1, 1, 1, 1,
0.5293639, 0.1951338, 0.789206, 1, 1, 1, 1, 1,
0.5324996, 0.659444, 1.63364, 1, 1, 1, 1, 1,
0.5346671, -0.4418537, 2.112431, 1, 1, 1, 1, 1,
0.5348136, -0.9341938, 2.25458, 1, 1, 1, 1, 1,
0.5371357, -1.941371, 4.47716, 1, 1, 1, 1, 1,
0.5390117, 0.9327385, 0.769341, 1, 1, 1, 1, 1,
0.5393223, -0.5773875, 2.91988, 0, 0, 1, 1, 1,
0.5434482, 1.178073, -0.5578017, 1, 0, 0, 1, 1,
0.5485851, 1.667878, 0.6417987, 1, 0, 0, 1, 1,
0.5566046, 2.029865, 0.927313, 1, 0, 0, 1, 1,
0.5689163, 0.6504392, 1.307762, 1, 0, 0, 1, 1,
0.5696256, -0.1017866, 1.369981, 1, 0, 0, 1, 1,
0.5802995, 0.6384098, 0.5141426, 0, 0, 0, 1, 1,
0.5837581, 0.5969095, -1.03089, 0, 0, 0, 1, 1,
0.5853018, -0.4475439, 3.232459, 0, 0, 0, 1, 1,
0.5869948, 1.659897, 1.031778, 0, 0, 0, 1, 1,
0.5883498, 0.3158943, 2.55457, 0, 0, 0, 1, 1,
0.5947008, -0.2289182, 1.411499, 0, 0, 0, 1, 1,
0.6035824, 0.08654926, -0.3423039, 0, 0, 0, 1, 1,
0.6053253, 0.5076999, 0.2778765, 1, 1, 1, 1, 1,
0.6083291, -1.354083, 3.403522, 1, 1, 1, 1, 1,
0.6118687, 0.5172202, 1.064867, 1, 1, 1, 1, 1,
0.6133462, -0.6380532, 2.394742, 1, 1, 1, 1, 1,
0.6136459, 1.239056, 0.7030866, 1, 1, 1, 1, 1,
0.6166594, 0.4686418, 0.6781278, 1, 1, 1, 1, 1,
0.618545, 1.100145, -0.6887854, 1, 1, 1, 1, 1,
0.6250534, 0.9610382, -0.1192782, 1, 1, 1, 1, 1,
0.6365883, 0.9474832, 1.437145, 1, 1, 1, 1, 1,
0.6366586, -1.100248, 1.561399, 1, 1, 1, 1, 1,
0.6417381, 0.004183097, 1.256487, 1, 1, 1, 1, 1,
0.6419263, 0.7289037, 2.379826, 1, 1, 1, 1, 1,
0.6570765, -0.02043937, 1.334034, 1, 1, 1, 1, 1,
0.665612, -1.960197, 0.8392544, 1, 1, 1, 1, 1,
0.6700468, 1.161706, 1.856884, 1, 1, 1, 1, 1,
0.6700625, 0.006934738, 1.263138, 0, 0, 1, 1, 1,
0.6729975, 1.349565, -0.8309787, 1, 0, 0, 1, 1,
0.6769255, -0.4901539, 1.355116, 1, 0, 0, 1, 1,
0.6804342, -0.1850538, 1.055937, 1, 0, 0, 1, 1,
0.6862038, 0.5905612, 0.4063281, 1, 0, 0, 1, 1,
0.6867929, 0.410889, 2.161252, 1, 0, 0, 1, 1,
0.6903784, 0.8550127, -0.4370434, 0, 0, 0, 1, 1,
0.6934955, -0.1753697, 1.789266, 0, 0, 0, 1, 1,
0.6987364, -1.005957, 1.326007, 0, 0, 0, 1, 1,
0.6988797, 0.4072911, 1.927379, 0, 0, 0, 1, 1,
0.6998832, 0.9948322, -0.0291591, 0, 0, 0, 1, 1,
0.7128, 0.4921842, 1.938411, 0, 0, 0, 1, 1,
0.7165338, -0.8621856, 1.142157, 0, 0, 0, 1, 1,
0.7191101, 2.20321, -0.3013458, 1, 1, 1, 1, 1,
0.7224152, 0.1592906, -0.3118636, 1, 1, 1, 1, 1,
0.7259918, -1.130786, 2.881062, 1, 1, 1, 1, 1,
0.7306755, -0.0778932, 0.6168762, 1, 1, 1, 1, 1,
0.732501, 0.2468739, 1.262097, 1, 1, 1, 1, 1,
0.7341779, -0.1550428, 0.6181164, 1, 1, 1, 1, 1,
0.7348516, 1.177179, -0.1381196, 1, 1, 1, 1, 1,
0.7359454, 0.3115769, 1.510598, 1, 1, 1, 1, 1,
0.73898, 0.5875934, 2.200509, 1, 1, 1, 1, 1,
0.7393267, 1.040676, 0.4122132, 1, 1, 1, 1, 1,
0.7410605, 1.434205, 0.5583832, 1, 1, 1, 1, 1,
0.7420408, -1.676022, 0.9708516, 1, 1, 1, 1, 1,
0.7544538, 0.1198923, 2.222702, 1, 1, 1, 1, 1,
0.7546428, 0.6932155, 0.4017041, 1, 1, 1, 1, 1,
0.7683482, 0.6735682, 0.1355525, 1, 1, 1, 1, 1,
0.7731702, -0.8241513, 2.321324, 0, 0, 1, 1, 1,
0.7752554, -1.270361, 2.898329, 1, 0, 0, 1, 1,
0.7903282, -0.2935476, 2.323974, 1, 0, 0, 1, 1,
0.7949672, 0.4395341, 0.9740424, 1, 0, 0, 1, 1,
0.7978012, 0.4590157, 0.6582567, 1, 0, 0, 1, 1,
0.7982152, -0.5206199, 2.870529, 1, 0, 0, 1, 1,
0.8049546, -1.264033, 2.373993, 0, 0, 0, 1, 1,
0.805267, -1.141439, 0.6301987, 0, 0, 0, 1, 1,
0.806896, -0.3780682, 0.6160174, 0, 0, 0, 1, 1,
0.8108847, -1.084281, 2.178515, 0, 0, 0, 1, 1,
0.8158832, -0.2693097, 3.245176, 0, 0, 0, 1, 1,
0.824017, 0.8928859, -0.6766818, 0, 0, 0, 1, 1,
0.8488307, 1.107077, 0.3113685, 0, 0, 0, 1, 1,
0.8489228, -0.6850008, 2.374781, 1, 1, 1, 1, 1,
0.8518681, 0.07647596, -0.1735115, 1, 1, 1, 1, 1,
0.8559796, -1.19993, 1.875685, 1, 1, 1, 1, 1,
0.8614091, 1.713506, 1.23278, 1, 1, 1, 1, 1,
0.8636883, -0.3886378, 1.264513, 1, 1, 1, 1, 1,
0.8668494, -0.8425444, 3.984974, 1, 1, 1, 1, 1,
0.86993, -0.03730971, 2.001588, 1, 1, 1, 1, 1,
0.872969, 0.3608551, 1.183167, 1, 1, 1, 1, 1,
0.8733118, 2.285838, -1.9553, 1, 1, 1, 1, 1,
0.8794575, -2.04645, 3.897813, 1, 1, 1, 1, 1,
0.8818976, 0.8052946, 1.389344, 1, 1, 1, 1, 1,
0.8862929, -1.861674, 1.040193, 1, 1, 1, 1, 1,
0.8903528, 1.806687, 0.2468273, 1, 1, 1, 1, 1,
0.8914873, -0.2455738, 1.958664, 1, 1, 1, 1, 1,
0.892418, 0.2719207, 2.022016, 1, 1, 1, 1, 1,
0.8948569, 2.470361, 0.08632393, 0, 0, 1, 1, 1,
0.8973639, 1.30863, 1.953267, 1, 0, 0, 1, 1,
0.9118758, -0.6825531, 1.926831, 1, 0, 0, 1, 1,
0.9286618, 0.2795665, 0.2746932, 1, 0, 0, 1, 1,
0.9330317, -2.543964, 3.481075, 1, 0, 0, 1, 1,
0.9349842, -0.4176015, 2.192312, 1, 0, 0, 1, 1,
0.9552969, 0.4653872, 1.003059, 0, 0, 0, 1, 1,
0.956329, -0.3559732, 1.42512, 0, 0, 0, 1, 1,
0.9701437, -0.6179469, 0.02235326, 0, 0, 0, 1, 1,
0.9775856, 0.7529028, 0.7044063, 0, 0, 0, 1, 1,
0.9848679, 0.5463904, 1.033332, 0, 0, 0, 1, 1,
0.9884975, 0.01934153, 2.482458, 0, 0, 0, 1, 1,
0.9894468, 0.524099, 0.9322801, 0, 0, 0, 1, 1,
0.9912483, -0.7966758, 2.390844, 1, 1, 1, 1, 1,
0.9923081, 1.002026, -1.117539, 1, 1, 1, 1, 1,
0.996893, 0.007850067, 0.6810696, 1, 1, 1, 1, 1,
1.013323, 0.3704648, 0.6529029, 1, 1, 1, 1, 1,
1.013929, -1.814397, 4.085583, 1, 1, 1, 1, 1,
1.017668, -0.9289137, -0.168027, 1, 1, 1, 1, 1,
1.01929, 0.5961796, 1.072609, 1, 1, 1, 1, 1,
1.029604, -0.5777344, 2.196953, 1, 1, 1, 1, 1,
1.042259, 0.7184206, 0.09826743, 1, 1, 1, 1, 1,
1.05423, 1.089062, 0.6213146, 1, 1, 1, 1, 1,
1.060366, -1.20012, 2.683168, 1, 1, 1, 1, 1,
1.064836, 0.4866727, 0.3301032, 1, 1, 1, 1, 1,
1.071303, 0.6650201, -0.1165387, 1, 1, 1, 1, 1,
1.081182, 0.1123527, 0.4641954, 1, 1, 1, 1, 1,
1.081977, -0.3215016, 2.156013, 1, 1, 1, 1, 1,
1.082101, 0.2359429, 3.22508, 0, 0, 1, 1, 1,
1.086421, -1.023696, 1.809163, 1, 0, 0, 1, 1,
1.091636, -0.2924234, 1.598435, 1, 0, 0, 1, 1,
1.095255, -0.9853033, 3.223945, 1, 0, 0, 1, 1,
1.098634, -2.040801, 2.027742, 1, 0, 0, 1, 1,
1.104846, -1.191356, 1.585997, 1, 0, 0, 1, 1,
1.106015, -1.714932, 3.523159, 0, 0, 0, 1, 1,
1.114388, -0.4770749, 2.738605, 0, 0, 0, 1, 1,
1.117481, 1.516294, 0.6967348, 0, 0, 0, 1, 1,
1.124061, -0.7095812, 1.255871, 0, 0, 0, 1, 1,
1.12784, -1.18044, 0.6935567, 0, 0, 0, 1, 1,
1.130415, 0.9838478, 0.7164364, 0, 0, 0, 1, 1,
1.134731, -0.4681206, 0.7220109, 0, 0, 0, 1, 1,
1.138685, 0.9681734, 1.082541, 1, 1, 1, 1, 1,
1.154345, -0.6762082, 2.372111, 1, 1, 1, 1, 1,
1.156327, -2.103605, 2.978225, 1, 1, 1, 1, 1,
1.161948, 0.1386297, 2.713566, 1, 1, 1, 1, 1,
1.170359, 0.420426, 2.446474, 1, 1, 1, 1, 1,
1.174152, 1.781044, 0.3319796, 1, 1, 1, 1, 1,
1.180688, 0.3231497, 1.613492, 1, 1, 1, 1, 1,
1.180766, 1.159851, 2.217816, 1, 1, 1, 1, 1,
1.184196, 0.5591812, 1.913046, 1, 1, 1, 1, 1,
1.184457, -1.075218, 2.376702, 1, 1, 1, 1, 1,
1.18847, -0.9480885, 1.669953, 1, 1, 1, 1, 1,
1.188991, 0.115644, 2.340544, 1, 1, 1, 1, 1,
1.194303, -0.6602768, 3.711542, 1, 1, 1, 1, 1,
1.199623, 0.6672561, 2.295785, 1, 1, 1, 1, 1,
1.21282, 0.8774971, 1.36326, 1, 1, 1, 1, 1,
1.217786, -0.1770127, 1.44724, 0, 0, 1, 1, 1,
1.225213, 0.9023816, 1.560942, 1, 0, 0, 1, 1,
1.231061, -0.9535875, 1.238235, 1, 0, 0, 1, 1,
1.237172, 1.886069, 0.4301483, 1, 0, 0, 1, 1,
1.239027, -0.8259724, 2.038599, 1, 0, 0, 1, 1,
1.240533, -0.3309883, 0.05180627, 1, 0, 0, 1, 1,
1.241543, 0.4108921, 1.139536, 0, 0, 0, 1, 1,
1.251654, 0.5488665, 1.443849, 0, 0, 0, 1, 1,
1.25185, -0.4897903, 1.620345, 0, 0, 0, 1, 1,
1.260248, -0.05540751, 2.52773, 0, 0, 0, 1, 1,
1.273164, -1.208459, 1.129015, 0, 0, 0, 1, 1,
1.278933, -0.3418183, 1.872543, 0, 0, 0, 1, 1,
1.282372, -0.4379338, 1.82753, 0, 0, 0, 1, 1,
1.285973, -0.3151271, 2.067184, 1, 1, 1, 1, 1,
1.287039, -0.590897, 2.200292, 1, 1, 1, 1, 1,
1.288353, 0.4894823, 2.145099, 1, 1, 1, 1, 1,
1.299799, -1.971836, 1.310707, 1, 1, 1, 1, 1,
1.324611, 0.1858543, 1.342178, 1, 1, 1, 1, 1,
1.326118, -1.05844, 2.289461, 1, 1, 1, 1, 1,
1.338672, 1.144362, 0.6376702, 1, 1, 1, 1, 1,
1.340481, 1.969751, 1.475614, 1, 1, 1, 1, 1,
1.342602, -0.1178576, 2.588232, 1, 1, 1, 1, 1,
1.345469, -0.7458655, 3.206029, 1, 1, 1, 1, 1,
1.346591, 0.6897871, 0.2838292, 1, 1, 1, 1, 1,
1.347516, 0.008676625, -0.04042286, 1, 1, 1, 1, 1,
1.349356, 0.1154637, 1.500944, 1, 1, 1, 1, 1,
1.353949, 0.8606784, 1.710196, 1, 1, 1, 1, 1,
1.355081, 0.7097508, -0.364864, 1, 1, 1, 1, 1,
1.36465, -2.684663, 1.662569, 0, 0, 1, 1, 1,
1.369362, -1.238442, 4.514991, 1, 0, 0, 1, 1,
1.370211, 2.258544, -0.4215823, 1, 0, 0, 1, 1,
1.372763, -0.6435843, 1.805, 1, 0, 0, 1, 1,
1.381837, 1.123061, 2.195354, 1, 0, 0, 1, 1,
1.382442, 0.6678932, -0.3477625, 1, 0, 0, 1, 1,
1.391391, 0.01688463, 1.016909, 0, 0, 0, 1, 1,
1.401741, 0.5705082, 3.071677, 0, 0, 0, 1, 1,
1.415596, -0.05571918, 3.719441, 0, 0, 0, 1, 1,
1.428481, -1.479352, 3.882254, 0, 0, 0, 1, 1,
1.435761, 1.185642, 0.06600431, 0, 0, 0, 1, 1,
1.437966, -0.00590293, 1.260109, 0, 0, 0, 1, 1,
1.442077, -1.634032, 1.047012, 0, 0, 0, 1, 1,
1.442269, -2.832038, 1.664265, 1, 1, 1, 1, 1,
1.449249, -1.089318, 1.348163, 1, 1, 1, 1, 1,
1.466715, 0.8245677, 1.177786, 1, 1, 1, 1, 1,
1.47006, -1.54654, 0.7229851, 1, 1, 1, 1, 1,
1.480014, -0.2539833, 0.8470362, 1, 1, 1, 1, 1,
1.482301, 1.162038, 1.063556, 1, 1, 1, 1, 1,
1.482882, 1.076053, 0.2616709, 1, 1, 1, 1, 1,
1.49289, 0.6338612, 1.113202, 1, 1, 1, 1, 1,
1.494592, -1.732654, 1.804176, 1, 1, 1, 1, 1,
1.494993, 0.6671365, 1.158398, 1, 1, 1, 1, 1,
1.498671, -2.25001, 1.049061, 1, 1, 1, 1, 1,
1.499779, 1.324032, -0.00962873, 1, 1, 1, 1, 1,
1.500319, -0.4041577, 4.022915, 1, 1, 1, 1, 1,
1.505219, -0.3047331, 3.205218, 1, 1, 1, 1, 1,
1.519974, 0.4760477, 0.8630888, 1, 1, 1, 1, 1,
1.531556, 1.774865, 0.6208768, 0, 0, 1, 1, 1,
1.533217, -0.5489604, 1.929487, 1, 0, 0, 1, 1,
1.555324, -0.6468372, 2.396156, 1, 0, 0, 1, 1,
1.557369, 2.573763, 1.319214, 1, 0, 0, 1, 1,
1.557868, 0.9247249, 2.34797, 1, 0, 0, 1, 1,
1.565094, 2.175602, -0.09078628, 1, 0, 0, 1, 1,
1.574671, 1.871303, 1.001385, 0, 0, 0, 1, 1,
1.576092, -1.200451, 1.459495, 0, 0, 0, 1, 1,
1.596321, 0.2525725, 0.9460799, 0, 0, 0, 1, 1,
1.600001, 0.07084581, 2.731844, 0, 0, 0, 1, 1,
1.601487, -0.719062, 0.7883313, 0, 0, 0, 1, 1,
1.607005, 1.261935, 1.520203, 0, 0, 0, 1, 1,
1.607912, -1.766069, 1.491338, 0, 0, 0, 1, 1,
1.608843, 0.1818944, 1.040835, 1, 1, 1, 1, 1,
1.610921, 0.04434949, 3.282521, 1, 1, 1, 1, 1,
1.614281, 1.833156, -0.3917839, 1, 1, 1, 1, 1,
1.615197, -0.4878652, 3.903686, 1, 1, 1, 1, 1,
1.624785, -0.9379325, 2.513551, 1, 1, 1, 1, 1,
1.644685, -0.9228032, 4.746738, 1, 1, 1, 1, 1,
1.65268, -1.265354, 0.7556566, 1, 1, 1, 1, 1,
1.65792, 0.7527109, 0.8852934, 1, 1, 1, 1, 1,
1.680052, -1.776973, 1.750463, 1, 1, 1, 1, 1,
1.694496, 0.7408141, 0.7658606, 1, 1, 1, 1, 1,
1.695022, -0.4908931, 1.307718, 1, 1, 1, 1, 1,
1.69818, 0.4149002, 3.349112, 1, 1, 1, 1, 1,
1.700151, -0.8163577, 2.666209, 1, 1, 1, 1, 1,
1.70641, 1.077688, 2.766366, 1, 1, 1, 1, 1,
1.706597, 0.2256529, 2.50159, 1, 1, 1, 1, 1,
1.715135, 1.321651, -0.2391922, 0, 0, 1, 1, 1,
1.722758, -1.110609, 1.318267, 1, 0, 0, 1, 1,
1.723605, 0.8892319, 1.432896, 1, 0, 0, 1, 1,
1.726818, 0.4585785, 1.067791, 1, 0, 0, 1, 1,
1.735464, 1.07963, 2.921681, 1, 0, 0, 1, 1,
1.800884, -0.4424897, 0.1085789, 1, 0, 0, 1, 1,
1.80564, -0.2263416, 2.878491, 0, 0, 0, 1, 1,
1.806754, -0.2642629, 2.196725, 0, 0, 0, 1, 1,
1.827553, 0.3659373, 0.6865379, 0, 0, 0, 1, 1,
1.834661, -0.8857822, 0.1889549, 0, 0, 0, 1, 1,
1.83673, -0.8561394, 1.163881, 0, 0, 0, 1, 1,
1.838327, 0.009367805, 1.414109, 0, 0, 0, 1, 1,
1.849957, -0.966207, 2.416062, 0, 0, 0, 1, 1,
1.860103, -0.5735487, 3.379653, 1, 1, 1, 1, 1,
1.902273, 1.568158, 1.150348, 1, 1, 1, 1, 1,
1.944605, -0.7274975, 2.521271, 1, 1, 1, 1, 1,
1.976184, 1.222669, -0.3629895, 1, 1, 1, 1, 1,
1.998125, -0.2933754, 2.331786, 1, 1, 1, 1, 1,
2.019327, 0.5324038, 1.125727, 1, 1, 1, 1, 1,
2.032429, -3.168077, 3.527337, 1, 1, 1, 1, 1,
2.037032, -0.6251982, 1.735659, 1, 1, 1, 1, 1,
2.048584, -0.2132708, 0.9309654, 1, 1, 1, 1, 1,
2.116753, -0.1586177, 0.6007053, 1, 1, 1, 1, 1,
2.125513, 0.546253, 0.6580912, 1, 1, 1, 1, 1,
2.143242, -0.4258762, 1.168205, 1, 1, 1, 1, 1,
2.164697, 1.276657, 0.6702898, 1, 1, 1, 1, 1,
2.190595, -0.9401374, 1.062177, 1, 1, 1, 1, 1,
2.205838, -0.2310491, 0.7538688, 1, 1, 1, 1, 1,
2.221136, 2.584299, -0.3076576, 0, 0, 1, 1, 1,
2.250906, -0.1191338, 1.596809, 1, 0, 0, 1, 1,
2.281365, 0.1464697, 2.473808, 1, 0, 0, 1, 1,
2.315383, 0.09078437, 1.977316, 1, 0, 0, 1, 1,
2.338751, 0.7469575, 1.916386, 1, 0, 0, 1, 1,
2.362231, -0.1894373, 1.553158, 1, 0, 0, 1, 1,
2.427038, -0.9724745, 1.951602, 0, 0, 0, 1, 1,
2.431039, -1.080916, 0.9485183, 0, 0, 0, 1, 1,
2.501031, -0.5348715, 1.40589, 0, 0, 0, 1, 1,
2.505235, -0.7807017, 2.583124, 0, 0, 0, 1, 1,
2.568804, -1.15828, 2.5248, 0, 0, 0, 1, 1,
2.618451, 0.004842695, 1.756032, 0, 0, 0, 1, 1,
2.653931, -0.572915, 1.3405, 0, 0, 0, 1, 1,
2.706645, -1.031214, 2.575731, 1, 1, 1, 1, 1,
2.744844, -0.4855541, 1.608134, 1, 1, 1, 1, 1,
2.828851, -1.186532, 1.424263, 1, 1, 1, 1, 1,
3.114194, -0.3554686, 0.9616495, 1, 1, 1, 1, 1,
3.412344, -1.033413, 2.321614, 1, 1, 1, 1, 1,
3.897043, 1.777548, 0.5613721, 1, 1, 1, 1, 1,
3.916054, 0.1055358, 0.289133, 1, 1, 1, 1, 1
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
var radius = 9.510788;
var distance = 33.40624;
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
mvMatrix.translate( -0.2612503, 0.1487592, -0.3630483 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40624);
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
