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
-2.968065, -1.055765, -0.8312805, 1, 0, 0, 1,
-2.925457, 0.5311281, -2.26967, 1, 0.007843138, 0, 1,
-2.62413, -0.7687622, -1.53981, 1, 0.01176471, 0, 1,
-2.598787, -0.4969851, -0.6936225, 1, 0.01960784, 0, 1,
-2.584136, 0.0253332, 0.03951159, 1, 0.02352941, 0, 1,
-2.405313, -0.4184248, -2.406037, 1, 0.03137255, 0, 1,
-2.398589, 2.09372, 0.5140362, 1, 0.03529412, 0, 1,
-2.383983, -0.5330713, -1.19043, 1, 0.04313726, 0, 1,
-2.381533, 0.8977899, -1.898862, 1, 0.04705882, 0, 1,
-2.34184, -0.1839985, -1.814011, 1, 0.05490196, 0, 1,
-2.34059, -0.7520185, -1.529318, 1, 0.05882353, 0, 1,
-2.325704, 1.570488, -1.392547, 1, 0.06666667, 0, 1,
-2.257621, -0.7826399, -0.7487668, 1, 0.07058824, 0, 1,
-2.238769, 1.712766, 0.1834352, 1, 0.07843138, 0, 1,
-2.228685, -1.606204, -1.381938, 1, 0.08235294, 0, 1,
-2.212017, -1.662816, -0.2661115, 1, 0.09019608, 0, 1,
-2.176084, -0.2849824, -3.122428, 1, 0.09411765, 0, 1,
-2.140406, -1.369431, -2.581445, 1, 0.1019608, 0, 1,
-2.135066, -0.5700077, -2.985676, 1, 0.1098039, 0, 1,
-2.126805, 0.8958467, -0.6589051, 1, 0.1137255, 0, 1,
-2.121119, -0.7279823, -2.811906, 1, 0.1215686, 0, 1,
-2.085717, -0.05809243, 0.499673, 1, 0.1254902, 0, 1,
-2.085566, -1.50567, -1.938068, 1, 0.1333333, 0, 1,
-2.082761, 1.499733, -0.8315659, 1, 0.1372549, 0, 1,
-2.074121, -1.092069, -2.330652, 1, 0.145098, 0, 1,
-2.068152, 0.6988477, -1.917419, 1, 0.1490196, 0, 1,
-2.061105, -1.012328, -2.091527, 1, 0.1568628, 0, 1,
-2.039208, 1.206183, -0.484733, 1, 0.1607843, 0, 1,
-2.018911, 0.8026033, -0.5932784, 1, 0.1686275, 0, 1,
-2.011853, -0.64481, -2.182373, 1, 0.172549, 0, 1,
-1.975559, 0.409459, -0.06220025, 1, 0.1803922, 0, 1,
-1.960983, 0.1329845, -1.773009, 1, 0.1843137, 0, 1,
-1.96006, -1.351654, -1.141734, 1, 0.1921569, 0, 1,
-1.956586, -0.352451, 0.3809899, 1, 0.1960784, 0, 1,
-1.911884, 0.4452813, -2.547719, 1, 0.2039216, 0, 1,
-1.911867, -1.156018, -3.010151, 1, 0.2117647, 0, 1,
-1.88837, 0.1962036, -1.631245, 1, 0.2156863, 0, 1,
-1.840854, -0.3458896, -1.585648, 1, 0.2235294, 0, 1,
-1.816601, 1.69678, 0.2287764, 1, 0.227451, 0, 1,
-1.746791, -0.8427951, -2.163657, 1, 0.2352941, 0, 1,
-1.746109, 0.6017617, 0.8502661, 1, 0.2392157, 0, 1,
-1.726129, -0.4170474, -1.497695, 1, 0.2470588, 0, 1,
-1.70679, -0.8549156, -3.525408, 1, 0.2509804, 0, 1,
-1.703761, -1.307502, -2.258988, 1, 0.2588235, 0, 1,
-1.692465, -0.2516857, -3.491168, 1, 0.2627451, 0, 1,
-1.687857, 0.3159916, -1.77757, 1, 0.2705882, 0, 1,
-1.669654, -0.1381122, -1.482166, 1, 0.2745098, 0, 1,
-1.668586, -0.07791314, -2.0642, 1, 0.282353, 0, 1,
-1.663569, -2.158406, -2.618959, 1, 0.2862745, 0, 1,
-1.65986, -0.7216268, 0.721292, 1, 0.2941177, 0, 1,
-1.656033, 0.7968566, -0.6848546, 1, 0.3019608, 0, 1,
-1.643636, -0.9939774, 0.1508855, 1, 0.3058824, 0, 1,
-1.63677, 1.300023, 0.4824545, 1, 0.3137255, 0, 1,
-1.619754, 0.8696185, -2.853292, 1, 0.3176471, 0, 1,
-1.618503, -1.449709, -0.9544026, 1, 0.3254902, 0, 1,
-1.57647, -0.3640611, -0.4212038, 1, 0.3294118, 0, 1,
-1.55423, -1.625556, -0.3745047, 1, 0.3372549, 0, 1,
-1.54865, 0.1835515, -3.168657, 1, 0.3411765, 0, 1,
-1.537834, 0.5858544, -1.161611, 1, 0.3490196, 0, 1,
-1.517755, -0.6583445, -1.997866, 1, 0.3529412, 0, 1,
-1.505546, -0.1207913, -1.914266, 1, 0.3607843, 0, 1,
-1.50071, -1.473709, -3.690835, 1, 0.3647059, 0, 1,
-1.488204, -1.830559, -2.016174, 1, 0.372549, 0, 1,
-1.48662, 1.47908, 0.7017411, 1, 0.3764706, 0, 1,
-1.485901, 0.7046345, -0.6187075, 1, 0.3843137, 0, 1,
-1.480847, -1.555887, -3.208586, 1, 0.3882353, 0, 1,
-1.479811, 0.08031078, -1.421972, 1, 0.3960784, 0, 1,
-1.477929, 0.2321845, -2.884029, 1, 0.4039216, 0, 1,
-1.477529, -0.1976112, -0.7936457, 1, 0.4078431, 0, 1,
-1.468651, 0.5537092, -1.737024, 1, 0.4156863, 0, 1,
-1.468018, 0.5985691, -1.598726, 1, 0.4196078, 0, 1,
-1.46687, -0.03110657, -2.640804, 1, 0.427451, 0, 1,
-1.462599, 0.6328762, -1.229357, 1, 0.4313726, 0, 1,
-1.460483, -0.8570424, -0.5411428, 1, 0.4392157, 0, 1,
-1.460405, 2.206345, -0.6834019, 1, 0.4431373, 0, 1,
-1.438199, -0.09766556, 0.1734403, 1, 0.4509804, 0, 1,
-1.437868, 0.6358312, -1.030569, 1, 0.454902, 0, 1,
-1.424606, -0.9702535, 0.2565448, 1, 0.4627451, 0, 1,
-1.419864, -1.920425, -3.977585, 1, 0.4666667, 0, 1,
-1.414293, 0.8347852, -0.8616589, 1, 0.4745098, 0, 1,
-1.412677, -1.743626, -0.6619742, 1, 0.4784314, 0, 1,
-1.408029, 0.2709654, -2.612556, 1, 0.4862745, 0, 1,
-1.399922, -1.595162, -3.26299, 1, 0.4901961, 0, 1,
-1.390978, -0.161546, -2.379154, 1, 0.4980392, 0, 1,
-1.390235, 0.4036812, -1.723366, 1, 0.5058824, 0, 1,
-1.373779, 0.6224613, -2.114894, 1, 0.509804, 0, 1,
-1.358911, -1.070884, -1.47787, 1, 0.5176471, 0, 1,
-1.355764, -0.7392027, -2.7713, 1, 0.5215687, 0, 1,
-1.347945, -0.2915582, -2.172044, 1, 0.5294118, 0, 1,
-1.347108, -0.1261263, -1.935729, 1, 0.5333334, 0, 1,
-1.339187, -0.3881937, -1.659037, 1, 0.5411765, 0, 1,
-1.332469, -0.9944705, -2.214741, 1, 0.5450981, 0, 1,
-1.329622, 1.074007, -0.6909829, 1, 0.5529412, 0, 1,
-1.319584, 0.3100956, -0.2039815, 1, 0.5568628, 0, 1,
-1.312584, -0.1204594, -0.4928663, 1, 0.5647059, 0, 1,
-1.29445, 0.6029513, 1.062103, 1, 0.5686275, 0, 1,
-1.293498, 0.2117235, -0.1650093, 1, 0.5764706, 0, 1,
-1.292565, 1.2184, 0.4673753, 1, 0.5803922, 0, 1,
-1.267081, 0.9778727, -1.124915, 1, 0.5882353, 0, 1,
-1.265968, 0.5801196, -1.215149, 1, 0.5921569, 0, 1,
-1.262246, 0.1829241, -1.964435, 1, 0.6, 0, 1,
-1.250283, -0.6932052, -2.411433, 1, 0.6078432, 0, 1,
-1.240718, -0.8371282, -2.184293, 1, 0.6117647, 0, 1,
-1.239774, 1.067833, 0.1211225, 1, 0.6196079, 0, 1,
-1.234097, 0.5588934, -0.4169448, 1, 0.6235294, 0, 1,
-1.23052, -0.8579931, -2.561279, 1, 0.6313726, 0, 1,
-1.226167, 0.6246925, -2.961829, 1, 0.6352941, 0, 1,
-1.222333, -0.09670322, -1.66695, 1, 0.6431373, 0, 1,
-1.218836, -0.9983579, -1.650094, 1, 0.6470588, 0, 1,
-1.212121, -0.2886863, -1.089126, 1, 0.654902, 0, 1,
-1.203081, 0.4172353, -1.712998, 1, 0.6588235, 0, 1,
-1.200185, -0.895431, -2.835232, 1, 0.6666667, 0, 1,
-1.196724, 1.077134, -1.032342, 1, 0.6705883, 0, 1,
-1.19461, -1.779437, -1.576925, 1, 0.6784314, 0, 1,
-1.194245, 0.801021, -0.7453644, 1, 0.682353, 0, 1,
-1.191469, 0.6161512, -0.6507582, 1, 0.6901961, 0, 1,
-1.186482, 0.9283572, -1.226292, 1, 0.6941177, 0, 1,
-1.185435, 0.1947727, -0.7873355, 1, 0.7019608, 0, 1,
-1.18469, -0.1946548, -1.313553, 1, 0.7098039, 0, 1,
-1.18148, 1.029836, -0.8448057, 1, 0.7137255, 0, 1,
-1.173256, 1.766027, -1.554444, 1, 0.7215686, 0, 1,
-1.165435, 0.01728655, -2.610162, 1, 0.7254902, 0, 1,
-1.162584, 0.5420332, 0.5347989, 1, 0.7333333, 0, 1,
-1.156023, 0.1798253, -3.144087, 1, 0.7372549, 0, 1,
-1.155318, -0.2648897, -3.079951, 1, 0.7450981, 0, 1,
-1.15287, 0.8620333, -0.7615769, 1, 0.7490196, 0, 1,
-1.1438, 0.9027096, -3.206515, 1, 0.7568628, 0, 1,
-1.141247, -0.1955612, -2.792084, 1, 0.7607843, 0, 1,
-1.139883, 0.144374, -2.055986, 1, 0.7686275, 0, 1,
-1.138777, 0.6317048, -0.9754317, 1, 0.772549, 0, 1,
-1.137557, -1.414213, -2.241071, 1, 0.7803922, 0, 1,
-1.135044, -1.208395, -2.701469, 1, 0.7843137, 0, 1,
-1.134927, -0.7845166, -1.852875, 1, 0.7921569, 0, 1,
-1.133801, 0.2108026, -1.761855, 1, 0.7960784, 0, 1,
-1.128631, -0.9647394, -1.762656, 1, 0.8039216, 0, 1,
-1.116347, -0.1060623, -2.080983, 1, 0.8117647, 0, 1,
-1.110282, 0.5423093, -2.34037, 1, 0.8156863, 0, 1,
-1.108516, -0.2267524, -0.7749126, 1, 0.8235294, 0, 1,
-1.099798, 0.1109226, -1.693241, 1, 0.827451, 0, 1,
-1.096817, -0.1757784, -0.2122333, 1, 0.8352941, 0, 1,
-1.096115, 0.4556974, -3.135377, 1, 0.8392157, 0, 1,
-1.08847, 2.231061, 0.1067809, 1, 0.8470588, 0, 1,
-1.085224, 0.3717304, -2.044798, 1, 0.8509804, 0, 1,
-1.081734, 0.2452354, -1.07148, 1, 0.8588235, 0, 1,
-1.074409, 0.1159523, 1.513378, 1, 0.8627451, 0, 1,
-1.066514, 1.14717, -0.6735249, 1, 0.8705882, 0, 1,
-1.059415, 0.7201155, -0.419043, 1, 0.8745098, 0, 1,
-1.057215, 0.8355448, -1.033336, 1, 0.8823529, 0, 1,
-1.053129, -0.7606011, -2.869251, 1, 0.8862745, 0, 1,
-1.051515, -0.7930699, -3.374261, 1, 0.8941177, 0, 1,
-1.050095, 1.693715, -0.1084435, 1, 0.8980392, 0, 1,
-1.049863, 0.210022, -1.133425, 1, 0.9058824, 0, 1,
-1.046653, -0.004815417, -0.7788263, 1, 0.9137255, 0, 1,
-1.040826, -0.6262842, -2.283084, 1, 0.9176471, 0, 1,
-1.039011, 0.552018, -1.351554, 1, 0.9254902, 0, 1,
-1.033869, -1.331312, -2.039013, 1, 0.9294118, 0, 1,
-1.024814, 0.486947, -2.26602, 1, 0.9372549, 0, 1,
-1.020181, -0.7660527, -1.755006, 1, 0.9411765, 0, 1,
-1.00692, 0.5087495, 0.5308945, 1, 0.9490196, 0, 1,
-1.005959, 0.830617, -0.7078556, 1, 0.9529412, 0, 1,
-0.9975412, 1.010574, 0.07478935, 1, 0.9607843, 0, 1,
-0.9970319, -0.7027842, -1.377932, 1, 0.9647059, 0, 1,
-0.9893584, 0.2592534, -2.101948, 1, 0.972549, 0, 1,
-0.9882259, -0.2551773, -2.356882, 1, 0.9764706, 0, 1,
-0.9865558, 1.054183, -0.923109, 1, 0.9843137, 0, 1,
-0.9835405, 0.7631891, -0.7011933, 1, 0.9882353, 0, 1,
-0.9826236, -0.004802453, -1.203873, 1, 0.9960784, 0, 1,
-0.961215, -0.1224673, -1.615099, 0.9960784, 1, 0, 1,
-0.960376, 0.6367764, -2.62019, 0.9921569, 1, 0, 1,
-0.9559416, 0.3410416, -0.538124, 0.9843137, 1, 0, 1,
-0.9550033, 1.478604, 0.1237636, 0.9803922, 1, 0, 1,
-0.9548349, -1.053387, -3.497336, 0.972549, 1, 0, 1,
-0.944618, -0.6983687, -3.623506, 0.9686275, 1, 0, 1,
-0.9416066, -0.5095981, -1.399055, 0.9607843, 1, 0, 1,
-0.9357582, 1.304912, -0.6462344, 0.9568627, 1, 0, 1,
-0.9331703, 0.0618844, 0.3039103, 0.9490196, 1, 0, 1,
-0.9287874, 0.4213106, -2.501153, 0.945098, 1, 0, 1,
-0.9280684, 0.4310752, -1.224313, 0.9372549, 1, 0, 1,
-0.9232459, -0.6468725, -2.366835, 0.9333333, 1, 0, 1,
-0.9171368, -0.1146659, -0.7548052, 0.9254902, 1, 0, 1,
-0.9152107, 0.5634196, -2.522231, 0.9215686, 1, 0, 1,
-0.9080083, 0.4656352, -0.1071876, 0.9137255, 1, 0, 1,
-0.8993365, 1.933319, 0.6925302, 0.9098039, 1, 0, 1,
-0.8974093, -0.177136, -2.264956, 0.9019608, 1, 0, 1,
-0.8951979, -0.08895414, -1.022399, 0.8941177, 1, 0, 1,
-0.8897285, 0.1463086, -1.766313, 0.8901961, 1, 0, 1,
-0.888739, 0.2542417, -0.8277729, 0.8823529, 1, 0, 1,
-0.8860486, 0.4755054, -1.568566, 0.8784314, 1, 0, 1,
-0.8836548, 1.067177, -0.9101192, 0.8705882, 1, 0, 1,
-0.8828467, 0.4394026, -0.5151017, 0.8666667, 1, 0, 1,
-0.8815874, 0.3878143, -1.440507, 0.8588235, 1, 0, 1,
-0.8813885, -1.215633, -1.62749, 0.854902, 1, 0, 1,
-0.8808511, -0.1947388, -1.70654, 0.8470588, 1, 0, 1,
-0.8753539, 1.319058, -2.692085, 0.8431373, 1, 0, 1,
-0.8702143, -0.0271171, -2.525914, 0.8352941, 1, 0, 1,
-0.869243, -0.5180312, -2.404847, 0.8313726, 1, 0, 1,
-0.8632976, -0.3750786, -2.855276, 0.8235294, 1, 0, 1,
-0.854489, 0.6535877, -0.6539485, 0.8196079, 1, 0, 1,
-0.8535823, 1.320071, -1.819512, 0.8117647, 1, 0, 1,
-0.8484472, -0.5816344, -2.915223, 0.8078431, 1, 0, 1,
-0.8475579, -0.3127125, -2.9155, 0.8, 1, 0, 1,
-0.8455952, -0.6727403, -0.4412345, 0.7921569, 1, 0, 1,
-0.844671, -0.1465827, -1.563299, 0.7882353, 1, 0, 1,
-0.8436735, -0.1997205, -2.217001, 0.7803922, 1, 0, 1,
-0.8342857, -0.7673866, -2.791621, 0.7764706, 1, 0, 1,
-0.8283541, -1.228792, -3.103804, 0.7686275, 1, 0, 1,
-0.8212634, 0.1121687, -1.133473, 0.7647059, 1, 0, 1,
-0.8182462, -0.5012845, -1.317311, 0.7568628, 1, 0, 1,
-0.8079137, -0.5751721, -2.050641, 0.7529412, 1, 0, 1,
-0.8071019, -0.3740339, -0.8808957, 0.7450981, 1, 0, 1,
-0.8068912, 0.0007483485, -1.723202, 0.7411765, 1, 0, 1,
-0.8052979, 0.9105726, -1.223662, 0.7333333, 1, 0, 1,
-0.8028436, 0.07518794, -0.07240312, 0.7294118, 1, 0, 1,
-0.8001834, 0.8864436, -1.003804, 0.7215686, 1, 0, 1,
-0.8001499, 0.6506122, -0.7282692, 0.7176471, 1, 0, 1,
-0.7997316, 0.3354111, 0.4781156, 0.7098039, 1, 0, 1,
-0.798683, -1.960574, -4.716029, 0.7058824, 1, 0, 1,
-0.7930852, -1.211589, -3.785457, 0.6980392, 1, 0, 1,
-0.7911713, 0.794759, -0.488234, 0.6901961, 1, 0, 1,
-0.7876947, -1.649599, -3.410862, 0.6862745, 1, 0, 1,
-0.7789398, 1.319744, -0.840608, 0.6784314, 1, 0, 1,
-0.7734827, 1.321578, 0.6180702, 0.6745098, 1, 0, 1,
-0.7734428, 1.276834, 0.3892635, 0.6666667, 1, 0, 1,
-0.7725914, 0.3584206, -0.02019748, 0.6627451, 1, 0, 1,
-0.7713814, -0.01733149, -1.576842, 0.654902, 1, 0, 1,
-0.7711329, 0.06372184, -0.3140164, 0.6509804, 1, 0, 1,
-0.7702411, 1.084388, -0.1816466, 0.6431373, 1, 0, 1,
-0.7663702, 0.03481264, -2.2065, 0.6392157, 1, 0, 1,
-0.7643871, 2.322107, 0.7908863, 0.6313726, 1, 0, 1,
-0.7588825, -0.04446868, -0.8896056, 0.627451, 1, 0, 1,
-0.7586999, -0.710886, -1.913233, 0.6196079, 1, 0, 1,
-0.7575669, 0.8265359, -1.05993, 0.6156863, 1, 0, 1,
-0.757029, 0.5513331, -0.1541002, 0.6078432, 1, 0, 1,
-0.751416, 0.7683377, -1.128386, 0.6039216, 1, 0, 1,
-0.7508135, 0.4419059, -1.759021, 0.5960785, 1, 0, 1,
-0.7348928, -1.933353, -2.594267, 0.5882353, 1, 0, 1,
-0.7316005, -0.7168046, -2.981348, 0.5843138, 1, 0, 1,
-0.728521, 0.03505673, -1.190991, 0.5764706, 1, 0, 1,
-0.7251293, 0.1189466, -2.796341, 0.572549, 1, 0, 1,
-0.7178816, -0.5730785, -2.897293, 0.5647059, 1, 0, 1,
-0.7136497, -0.5921957, -2.289425, 0.5607843, 1, 0, 1,
-0.7048019, 0.4726707, -0.673539, 0.5529412, 1, 0, 1,
-0.7024117, 2.564609, -0.1914361, 0.5490196, 1, 0, 1,
-0.6951719, 0.1981596, -1.39363, 0.5411765, 1, 0, 1,
-0.6902108, 2.779931, 0.4147698, 0.5372549, 1, 0, 1,
-0.6891288, 1.194107, -1.226288, 0.5294118, 1, 0, 1,
-0.6835528, -0.1680495, -1.665616, 0.5254902, 1, 0, 1,
-0.6812447, 1.206479, 0.2269517, 0.5176471, 1, 0, 1,
-0.6804409, -0.6531512, -3.219075, 0.5137255, 1, 0, 1,
-0.6785197, -1.006057, -2.66386, 0.5058824, 1, 0, 1,
-0.675243, 0.488169, 0.09009408, 0.5019608, 1, 0, 1,
-0.6736174, 0.2624703, -0.02470359, 0.4941176, 1, 0, 1,
-0.6679092, -2.401257, -1.950706, 0.4862745, 1, 0, 1,
-0.6617141, -0.5819283, -1.890278, 0.4823529, 1, 0, 1,
-0.6587189, -1.232828, -4.094155, 0.4745098, 1, 0, 1,
-0.6563569, 0.9959338, 1.27753, 0.4705882, 1, 0, 1,
-0.6557649, -0.5077369, -2.071061, 0.4627451, 1, 0, 1,
-0.6531667, -1.434028, -1.772739, 0.4588235, 1, 0, 1,
-0.6504657, 0.4733988, -1.983989, 0.4509804, 1, 0, 1,
-0.6480381, -0.545922, -2.240002, 0.4470588, 1, 0, 1,
-0.6368758, -1.209151, -3.222134, 0.4392157, 1, 0, 1,
-0.6359465, 0.2884032, -1.096238, 0.4352941, 1, 0, 1,
-0.6338832, 0.5470388, -0.8566696, 0.427451, 1, 0, 1,
-0.6336451, -1.376795, -1.655097, 0.4235294, 1, 0, 1,
-0.6290073, -1.309319, -1.330661, 0.4156863, 1, 0, 1,
-0.6285612, 1.238746, -0.675231, 0.4117647, 1, 0, 1,
-0.6283151, 0.06377507, -1.787251, 0.4039216, 1, 0, 1,
-0.6260104, 0.634613, -1.138648, 0.3960784, 1, 0, 1,
-0.6181318, 0.6163694, -0.6398823, 0.3921569, 1, 0, 1,
-0.6175333, -0.451268, -1.626951, 0.3843137, 1, 0, 1,
-0.6133577, 0.5635998, -0.9262541, 0.3803922, 1, 0, 1,
-0.6039174, 0.272191, -0.1384363, 0.372549, 1, 0, 1,
-0.601041, -1.086846, -2.19215, 0.3686275, 1, 0, 1,
-0.6005744, 0.3108433, 0.428344, 0.3607843, 1, 0, 1,
-0.5946222, -1.434845, -0.5880065, 0.3568628, 1, 0, 1,
-0.5882, 0.2340659, -0.2361822, 0.3490196, 1, 0, 1,
-0.586421, 1.020882, 0.7984264, 0.345098, 1, 0, 1,
-0.586208, -0.3556821, -1.677162, 0.3372549, 1, 0, 1,
-0.586166, -1.081318, -2.902355, 0.3333333, 1, 0, 1,
-0.5859514, 0.5996126, -0.2859714, 0.3254902, 1, 0, 1,
-0.5859088, 1.74599, 1.561132, 0.3215686, 1, 0, 1,
-0.575001, 2.768001, -0.5869877, 0.3137255, 1, 0, 1,
-0.573834, -0.8565856, -2.261366, 0.3098039, 1, 0, 1,
-0.5687451, -0.02907928, 0.27406, 0.3019608, 1, 0, 1,
-0.5662106, -0.4676274, -0.2942697, 0.2941177, 1, 0, 1,
-0.5633416, -1.224952, -1.940958, 0.2901961, 1, 0, 1,
-0.5629821, -0.2604012, -2.345556, 0.282353, 1, 0, 1,
-0.5617502, 0.6541361, -0.4597121, 0.2784314, 1, 0, 1,
-0.5598353, -0.486457, -3.445153, 0.2705882, 1, 0, 1,
-0.559132, 1.591857, -0.1350889, 0.2666667, 1, 0, 1,
-0.5587475, 0.4236354, -0.8777367, 0.2588235, 1, 0, 1,
-0.554832, 1.282579, -0.9552852, 0.254902, 1, 0, 1,
-0.5511131, 0.4804017, 0.5413097, 0.2470588, 1, 0, 1,
-0.5494362, -0.5948906, -3.451901, 0.2431373, 1, 0, 1,
-0.5481826, 0.2075495, -1.782972, 0.2352941, 1, 0, 1,
-0.5453119, -0.395916, -1.887147, 0.2313726, 1, 0, 1,
-0.5447476, 0.4946769, -0.8864661, 0.2235294, 1, 0, 1,
-0.5386157, -1.043231, -2.016771, 0.2196078, 1, 0, 1,
-0.5379263, -1.118541, -3.86008, 0.2117647, 1, 0, 1,
-0.5376794, -0.1633441, -1.694667, 0.2078431, 1, 0, 1,
-0.5323735, 0.00845024, -0.7531407, 0.2, 1, 0, 1,
-0.5272767, -0.5710061, -2.674569, 0.1921569, 1, 0, 1,
-0.5232444, 0.4265024, -0.1433494, 0.1882353, 1, 0, 1,
-0.5220614, -0.1827808, -1.632131, 0.1803922, 1, 0, 1,
-0.5203463, 1.290621, -1.151815, 0.1764706, 1, 0, 1,
-0.519802, -0.05572827, -2.113216, 0.1686275, 1, 0, 1,
-0.5196734, -0.7488071, -1.624987, 0.1647059, 1, 0, 1,
-0.5194591, 1.451317, -2.662874, 0.1568628, 1, 0, 1,
-0.5141835, 1.24031, -0.4417323, 0.1529412, 1, 0, 1,
-0.5138319, 2.053865, -1.050906, 0.145098, 1, 0, 1,
-0.5112138, 0.5355401, -1.100907, 0.1411765, 1, 0, 1,
-0.5104602, -1.074348, -2.113416, 0.1333333, 1, 0, 1,
-0.5085427, -0.682624, -2.157716, 0.1294118, 1, 0, 1,
-0.5072813, -0.5135766, -0.3271211, 0.1215686, 1, 0, 1,
-0.506745, 1.862808, 0.9885614, 0.1176471, 1, 0, 1,
-0.5045902, 0.6626067, -0.3689361, 0.1098039, 1, 0, 1,
-0.5013565, 0.4741791, -0.3149366, 0.1058824, 1, 0, 1,
-0.5009493, -0.5496033, -4.396181, 0.09803922, 1, 0, 1,
-0.498539, -0.8836404, -2.428484, 0.09019608, 1, 0, 1,
-0.4883793, 1.296835, -0.8590075, 0.08627451, 1, 0, 1,
-0.4871169, 0.1967739, -2.3218, 0.07843138, 1, 0, 1,
-0.4860218, -0.5820599, -2.90345, 0.07450981, 1, 0, 1,
-0.4858428, -0.7976706, -2.234973, 0.06666667, 1, 0, 1,
-0.4838396, 0.4615178, -0.8630035, 0.0627451, 1, 0, 1,
-0.4764074, -1.893668, -2.577621, 0.05490196, 1, 0, 1,
-0.4713481, -0.6672273, -2.371595, 0.05098039, 1, 0, 1,
-0.4678889, 0.414177, -0.9688752, 0.04313726, 1, 0, 1,
-0.466683, -2.203191, -4.080526, 0.03921569, 1, 0, 1,
-0.4657693, 0.2216961, -1.581016, 0.03137255, 1, 0, 1,
-0.4614705, 0.5250865, -0.07495034, 0.02745098, 1, 0, 1,
-0.4612417, -0.44987, -3.604618, 0.01960784, 1, 0, 1,
-0.4612342, -0.1897432, -4.134943, 0.01568628, 1, 0, 1,
-0.4607345, -0.6516016, -2.731211, 0.007843138, 1, 0, 1,
-0.4581828, -1.251844, -2.331861, 0.003921569, 1, 0, 1,
-0.4581208, 0.08363137, -3.156322, 0, 1, 0.003921569, 1,
-0.4561859, -0.03132713, -0.9931071, 0, 1, 0.01176471, 1,
-0.4546143, 0.5642351, -0.6266851, 0, 1, 0.01568628, 1,
-0.4457344, 2.342699, -1.353788, 0, 1, 0.02352941, 1,
-0.4448901, -0.9871474, -1.615234, 0, 1, 0.02745098, 1,
-0.4442004, 0.8691539, 0.3340303, 0, 1, 0.03529412, 1,
-0.4405916, 0.2806394, -1.305692, 0, 1, 0.03921569, 1,
-0.4343157, 0.1308662, -0.5215662, 0, 1, 0.04705882, 1,
-0.4342119, -1.542725, -4.97382, 0, 1, 0.05098039, 1,
-0.4319832, 1.063575, -3.037821, 0, 1, 0.05882353, 1,
-0.4290661, 1.479066, -0.3637445, 0, 1, 0.0627451, 1,
-0.4260361, -1.100556, -2.874245, 0, 1, 0.07058824, 1,
-0.4251559, -0.1826766, -1.428244, 0, 1, 0.07450981, 1,
-0.4177885, -0.1424921, -1.406301, 0, 1, 0.08235294, 1,
-0.4160427, 0.5941616, -1.122964, 0, 1, 0.08627451, 1,
-0.4133061, 0.6797518, 0.2572981, 0, 1, 0.09411765, 1,
-0.4100999, -0.2089719, -3.443994, 0, 1, 0.1019608, 1,
-0.4075016, 0.3433719, -2.231367, 0, 1, 0.1058824, 1,
-0.40531, 2.129565, -1.056976, 0, 1, 0.1137255, 1,
-0.4045334, -1.164303, -2.521291, 0, 1, 0.1176471, 1,
-0.3970705, -0.5877764, -1.806916, 0, 1, 0.1254902, 1,
-0.3941204, 0.7381393, -1.6648, 0, 1, 0.1294118, 1,
-0.3920226, -0.9000072, -4.145465, 0, 1, 0.1372549, 1,
-0.3887023, -0.5122445, -0.9780073, 0, 1, 0.1411765, 1,
-0.3828027, -0.59324, -2.27137, 0, 1, 0.1490196, 1,
-0.3813001, 1.152056, 0.7030099, 0, 1, 0.1529412, 1,
-0.3794786, -0.4734558, -4.862121, 0, 1, 0.1607843, 1,
-0.3789501, -0.0799283, -0.5825125, 0, 1, 0.1647059, 1,
-0.3743839, -1.010276, -2.538577, 0, 1, 0.172549, 1,
-0.3730969, -1.456836, -3.729266, 0, 1, 0.1764706, 1,
-0.3685913, -0.8030914, -2.883046, 0, 1, 0.1843137, 1,
-0.3680481, 1.01525, 1.271427, 0, 1, 0.1882353, 1,
-0.3657359, 1.327037, -0.004938075, 0, 1, 0.1960784, 1,
-0.3612135, -0.4122021, -3.793169, 0, 1, 0.2039216, 1,
-0.3609001, 0.3586591, -0.7481217, 0, 1, 0.2078431, 1,
-0.3594799, 0.1925569, 0.08507568, 0, 1, 0.2156863, 1,
-0.3592212, 0.7700756, -1.520719, 0, 1, 0.2196078, 1,
-0.3534331, 0.3099001, -1.17863, 0, 1, 0.227451, 1,
-0.3476407, -0.9653928, -3.337991, 0, 1, 0.2313726, 1,
-0.3453927, 0.2099874, -1.574533, 0, 1, 0.2392157, 1,
-0.3448282, 0.376259, -0.7895415, 0, 1, 0.2431373, 1,
-0.3423237, -0.2386681, -1.797529, 0, 1, 0.2509804, 1,
-0.3408709, -1.346379, -3.23122, 0, 1, 0.254902, 1,
-0.3394988, 1.028919, 0.6873986, 0, 1, 0.2627451, 1,
-0.3380053, 0.1917357, -1.023957, 0, 1, 0.2666667, 1,
-0.3365516, -1.59141, -2.974782, 0, 1, 0.2745098, 1,
-0.3357501, 0.9496292, -1.427611, 0, 1, 0.2784314, 1,
-0.3281679, 1.393578, 0.3928107, 0, 1, 0.2862745, 1,
-0.3169585, 1.520145, -1.541001, 0, 1, 0.2901961, 1,
-0.310722, -0.6024219, -2.283039, 0, 1, 0.2980392, 1,
-0.3029422, 0.7431996, -0.7253934, 0, 1, 0.3058824, 1,
-0.302479, 0.4272348, -0.2159361, 0, 1, 0.3098039, 1,
-0.3006811, -1.464044, -4.17183, 0, 1, 0.3176471, 1,
-0.2988949, -0.6375778, -3.952618, 0, 1, 0.3215686, 1,
-0.2985889, -0.5190707, -3.287934, 0, 1, 0.3294118, 1,
-0.2959132, 0.8611371, -0.9440636, 0, 1, 0.3333333, 1,
-0.2920092, -1.472583, -2.886058, 0, 1, 0.3411765, 1,
-0.2903343, 1.168583, 1.036188, 0, 1, 0.345098, 1,
-0.2888244, -0.0302299, -1.275301, 0, 1, 0.3529412, 1,
-0.2887335, -1.513821, -3.027625, 0, 1, 0.3568628, 1,
-0.2854387, -2.16, -2.583363, 0, 1, 0.3647059, 1,
-0.284535, -1.14428, -3.506736, 0, 1, 0.3686275, 1,
-0.2781925, -0.7243255, -4.133734, 0, 1, 0.3764706, 1,
-0.2780948, -0.8991895, -4.020729, 0, 1, 0.3803922, 1,
-0.2725876, -0.006191366, -1.306847, 0, 1, 0.3882353, 1,
-0.2572885, 0.02836038, -0.7775691, 0, 1, 0.3921569, 1,
-0.2567733, -0.1398825, -2.46062, 0, 1, 0.4, 1,
-0.2561258, 0.3234907, -2.005519, 0, 1, 0.4078431, 1,
-0.2508107, 0.1218959, -1.256019, 0, 1, 0.4117647, 1,
-0.2479401, 0.4623169, -0.6198037, 0, 1, 0.4196078, 1,
-0.2439826, 0.3422917, -1.269292, 0, 1, 0.4235294, 1,
-0.2383472, -0.2082265, -5.813953, 0, 1, 0.4313726, 1,
-0.2342518, -0.3542914, -2.324218, 0, 1, 0.4352941, 1,
-0.2317764, 0.226588, -0.8176119, 0, 1, 0.4431373, 1,
-0.2316546, -1.480155, -1.784122, 0, 1, 0.4470588, 1,
-0.2295856, -2.516947, -3.533422, 0, 1, 0.454902, 1,
-0.2242905, 0.9642042, -0.7134344, 0, 1, 0.4588235, 1,
-0.2225706, -0.9526273, -4.316341, 0, 1, 0.4666667, 1,
-0.2215935, 0.5982131, -0.5455659, 0, 1, 0.4705882, 1,
-0.2182392, 1.556488, -0.1595818, 0, 1, 0.4784314, 1,
-0.2127492, -0.3306045, -3.22376, 0, 1, 0.4823529, 1,
-0.2120282, 0.6143519, -0.5751501, 0, 1, 0.4901961, 1,
-0.211031, 1.333198, -1.605126, 0, 1, 0.4941176, 1,
-0.2046023, 1.124413, -1.726392, 0, 1, 0.5019608, 1,
-0.2020451, -0.09147342, -0.3296774, 0, 1, 0.509804, 1,
-0.2001891, -2.21526, -2.800679, 0, 1, 0.5137255, 1,
-0.1993403, 0.8646659, -1.182502, 0, 1, 0.5215687, 1,
-0.1926165, 0.6361356, 1.692361, 0, 1, 0.5254902, 1,
-0.1914871, 1.325972, -1.142543, 0, 1, 0.5333334, 1,
-0.1865225, 0.7067527, -0.1150398, 0, 1, 0.5372549, 1,
-0.1851555, -0.3854775, -5.086768, 0, 1, 0.5450981, 1,
-0.1848289, 0.1818821, -1.001546, 0, 1, 0.5490196, 1,
-0.1830067, 0.3637598, -1.125802, 0, 1, 0.5568628, 1,
-0.1802679, 1.611907, -1.11622, 0, 1, 0.5607843, 1,
-0.1784176, -2.35524, -3.531704, 0, 1, 0.5686275, 1,
-0.1722507, 0.6954412, -1.1492, 0, 1, 0.572549, 1,
-0.1704717, 0.2075629, -0.7957498, 0, 1, 0.5803922, 1,
-0.1700358, -0.7205422, -2.772759, 0, 1, 0.5843138, 1,
-0.167685, 0.1101524, -2.000326, 0, 1, 0.5921569, 1,
-0.1596481, -0.312042, -1.895111, 0, 1, 0.5960785, 1,
-0.1590324, 0.1029095, -1.779509, 0, 1, 0.6039216, 1,
-0.1588059, 0.9454171, -0.02200076, 0, 1, 0.6117647, 1,
-0.1578644, 0.3690335, -0.7299641, 0, 1, 0.6156863, 1,
-0.1536633, -0.3213484, -2.142263, 0, 1, 0.6235294, 1,
-0.1520567, -1.070506, -2.332592, 0, 1, 0.627451, 1,
-0.1468761, -0.3344596, -2.744818, 0, 1, 0.6352941, 1,
-0.1443028, -1.436331, -3.621956, 0, 1, 0.6392157, 1,
-0.1277004, 1.732605, 0.607976, 0, 1, 0.6470588, 1,
-0.1258327, -0.8683061, -4.603961, 0, 1, 0.6509804, 1,
-0.1229304, 1.382014, -0.2922959, 0, 1, 0.6588235, 1,
-0.1181311, -0.5719986, -2.071366, 0, 1, 0.6627451, 1,
-0.1144489, -0.08804858, -1.690279, 0, 1, 0.6705883, 1,
-0.1141186, -1.149855, -2.577089, 0, 1, 0.6745098, 1,
-0.1123223, 1.72952, 0.1429747, 0, 1, 0.682353, 1,
-0.1092755, -0.7650756, -2.916969, 0, 1, 0.6862745, 1,
-0.105784, -1.692605, -3.531729, 0, 1, 0.6941177, 1,
-0.102136, -0.8243719, -3.658663, 0, 1, 0.7019608, 1,
-0.09682228, 0.1645812, -0.7039971, 0, 1, 0.7058824, 1,
-0.09428128, 2.37208, -1.276844, 0, 1, 0.7137255, 1,
-0.09377714, 1.677805, -1.244445, 0, 1, 0.7176471, 1,
-0.09357292, 1.621511, -0.06212972, 0, 1, 0.7254902, 1,
-0.09314046, -0.7798012, -2.107595, 0, 1, 0.7294118, 1,
-0.09242059, 0.4064501, -1.664227, 0, 1, 0.7372549, 1,
-0.09049293, 1.524513, -0.2693922, 0, 1, 0.7411765, 1,
-0.08672737, -0.2600339, -2.303378, 0, 1, 0.7490196, 1,
-0.08551471, -0.7375509, -1.355096, 0, 1, 0.7529412, 1,
-0.08350892, 1.241495, 0.9748807, 0, 1, 0.7607843, 1,
-0.0826116, -1.125349, -2.435851, 0, 1, 0.7647059, 1,
-0.08111354, -0.9799607, -2.994179, 0, 1, 0.772549, 1,
-0.07948774, 0.5917957, 0.4318181, 0, 1, 0.7764706, 1,
-0.07616148, 0.04437728, -1.33721, 0, 1, 0.7843137, 1,
-0.07475315, -1.68748, -2.894269, 0, 1, 0.7882353, 1,
-0.07306384, -0.5174124, -4.011755, 0, 1, 0.7960784, 1,
-0.07082529, 0.3386214, 0.8891638, 0, 1, 0.8039216, 1,
-0.06809356, -0.8924116, -1.443549, 0, 1, 0.8078431, 1,
-0.06684823, 0.8382744, 1.054457, 0, 1, 0.8156863, 1,
-0.06494974, 0.2761531, 0.3806757, 0, 1, 0.8196079, 1,
-0.06434803, 1.240666, -0.811878, 0, 1, 0.827451, 1,
-0.06257393, -0.4480971, -0.6399384, 0, 1, 0.8313726, 1,
-0.05878649, -0.5607202, -1.039852, 0, 1, 0.8392157, 1,
-0.05622143, -0.104056, -2.918565, 0, 1, 0.8431373, 1,
-0.05250273, -0.1244014, -4.544654, 0, 1, 0.8509804, 1,
-0.0514233, 0.3428306, -0.6116596, 0, 1, 0.854902, 1,
-0.05124675, -0.7914086, -2.47722, 0, 1, 0.8627451, 1,
-0.04884483, -1.301911, -3.228628, 0, 1, 0.8666667, 1,
-0.04861524, 0.2419196, 0.503052, 0, 1, 0.8745098, 1,
-0.04716304, 0.2140467, -1.387258, 0, 1, 0.8784314, 1,
-0.04085058, 0.3452736, 0.4914962, 0, 1, 0.8862745, 1,
-0.04073669, -1.157447, -1.934315, 0, 1, 0.8901961, 1,
-0.04062965, -1.492509, -3.495085, 0, 1, 0.8980392, 1,
-0.03897113, -0.3825849, -3.36043, 0, 1, 0.9058824, 1,
-0.0371842, -1.56963, -4.517769, 0, 1, 0.9098039, 1,
-0.03610198, 0.6330213, 0.1174698, 0, 1, 0.9176471, 1,
-0.03529296, 0.6230211, 0.7708151, 0, 1, 0.9215686, 1,
-0.03130289, 0.7225853, 1.138907, 0, 1, 0.9294118, 1,
-0.03089982, 0.6080829, -1.582228, 0, 1, 0.9333333, 1,
-0.02888188, 1.307722, -0.09108885, 0, 1, 0.9411765, 1,
-0.02253265, -0.6805725, -3.909233, 0, 1, 0.945098, 1,
-0.02225568, -0.9389549, -3.008576, 0, 1, 0.9529412, 1,
-0.0208238, 0.8387215, 1.458086, 0, 1, 0.9568627, 1,
-0.01960669, -0.5469229, -3.585769, 0, 1, 0.9647059, 1,
-0.01846547, -2.253353, -1.229699, 0, 1, 0.9686275, 1,
-0.01554323, 0.6322759, 0.02244503, 0, 1, 0.9764706, 1,
-0.01118258, -1.402942, -2.89243, 0, 1, 0.9803922, 1,
-0.01070573, 2.143711, -2.110701, 0, 1, 0.9882353, 1,
-0.007755249, 2.138579, -0.9417118, 0, 1, 0.9921569, 1,
-0.005309839, 0.3057715, 1.776613, 0, 1, 1, 1,
-0.005212489, -0.3173896, -1.557252, 0, 0.9921569, 1, 1,
-0.001364024, -0.09046743, -1.99139, 0, 0.9882353, 1, 1,
-0.0005219753, -1.596191, -5.008375, 0, 0.9803922, 1, 1,
0.002114483, -1.543288, 2.912822, 0, 0.9764706, 1, 1,
0.01898449, -0.3609678, 2.207654, 0, 0.9686275, 1, 1,
0.02313744, -0.3595118, 2.763017, 0, 0.9647059, 1, 1,
0.02332354, -1.660458, 2.017081, 0, 0.9568627, 1, 1,
0.02332889, -0.2731782, 3.225372, 0, 0.9529412, 1, 1,
0.02670831, 0.1888899, 1.319143, 0, 0.945098, 1, 1,
0.02747348, 1.287639, 1.463441, 0, 0.9411765, 1, 1,
0.02796678, -0.6160357, 3.736648, 0, 0.9333333, 1, 1,
0.02800218, -0.4865834, 3.395867, 0, 0.9294118, 1, 1,
0.0298266, -0.1360501, 3.141883, 0, 0.9215686, 1, 1,
0.03683366, -0.3246975, 3.450718, 0, 0.9176471, 1, 1,
0.04045353, 0.5100204, -0.6407378, 0, 0.9098039, 1, 1,
0.04930605, -1.512782, 3.933184, 0, 0.9058824, 1, 1,
0.05048052, -0.6581627, 3.823246, 0, 0.8980392, 1, 1,
0.05252754, -0.8655015, 3.115157, 0, 0.8901961, 1, 1,
0.05323369, 0.4442787, -0.5859777, 0, 0.8862745, 1, 1,
0.05617494, 0.1228964, 1.65262, 0, 0.8784314, 1, 1,
0.05668274, 1.203748, 0.2416342, 0, 0.8745098, 1, 1,
0.05745811, -1.719413, 1.745092, 0, 0.8666667, 1, 1,
0.05810168, 0.7948465, 0.4278016, 0, 0.8627451, 1, 1,
0.06205916, -0.3217824, 3.668958, 0, 0.854902, 1, 1,
0.06252976, -0.8438596, 3.754209, 0, 0.8509804, 1, 1,
0.06313732, -2.140012, 2.364036, 0, 0.8431373, 1, 1,
0.06327819, -0.03095068, 1.854153, 0, 0.8392157, 1, 1,
0.06652925, -0.381169, 3.196618, 0, 0.8313726, 1, 1,
0.06814054, -0.08052964, 0.4841061, 0, 0.827451, 1, 1,
0.06970683, 0.08128265, 2.872925, 0, 0.8196079, 1, 1,
0.07026944, 1.436525, -1.710861, 0, 0.8156863, 1, 1,
0.07153475, 0.6274751, -1.298777, 0, 0.8078431, 1, 1,
0.07451148, 1.506078, -0.1598184, 0, 0.8039216, 1, 1,
0.07600027, -1.446514, 2.813546, 0, 0.7960784, 1, 1,
0.07662861, -0.6510993, 2.523488, 0, 0.7882353, 1, 1,
0.0816525, 1.336788, -0.3126958, 0, 0.7843137, 1, 1,
0.0823977, -0.2268277, 3.355016, 0, 0.7764706, 1, 1,
0.08267996, -0.6065513, 3.837543, 0, 0.772549, 1, 1,
0.08632886, 0.5522381, 0.6530424, 0, 0.7647059, 1, 1,
0.08720169, 1.522813, -0.5739157, 0, 0.7607843, 1, 1,
0.09093282, 0.6875566, -0.9752174, 0, 0.7529412, 1, 1,
0.09334259, -1.192379, 4.515062, 0, 0.7490196, 1, 1,
0.09351377, -1.771579, 4.058905, 0, 0.7411765, 1, 1,
0.0938848, 1.301971, 0.2543294, 0, 0.7372549, 1, 1,
0.09617862, 0.09208354, 0.8436767, 0, 0.7294118, 1, 1,
0.09997982, 0.2437516, -2.031669, 0, 0.7254902, 1, 1,
0.100714, -0.04027934, 2.298993, 0, 0.7176471, 1, 1,
0.1020409, 1.847849, 1.706372, 0, 0.7137255, 1, 1,
0.107867, -0.5349494, 1.880211, 0, 0.7058824, 1, 1,
0.1101085, 1.03775, -2.646352, 0, 0.6980392, 1, 1,
0.119336, 0.7978082, 1.228316, 0, 0.6941177, 1, 1,
0.1216125, -0.3840158, 3.158457, 0, 0.6862745, 1, 1,
0.1233808, 1.344937, 1.38378, 0, 0.682353, 1, 1,
0.1242931, -2.373314, 4.077533, 0, 0.6745098, 1, 1,
0.1300662, 1.830369, 0.01651757, 0, 0.6705883, 1, 1,
0.132761, 0.2482108, 1.463428, 0, 0.6627451, 1, 1,
0.134097, -0.9354178, 3.028919, 0, 0.6588235, 1, 1,
0.1344963, -0.8269416, 2.036963, 0, 0.6509804, 1, 1,
0.134898, -0.02414122, 1.185374, 0, 0.6470588, 1, 1,
0.1353137, 0.1195526, 0.6526396, 0, 0.6392157, 1, 1,
0.1353815, -0.7303724, 2.767115, 0, 0.6352941, 1, 1,
0.1378324, -1.112151, 2.799099, 0, 0.627451, 1, 1,
0.1400891, -0.4975758, 2.493316, 0, 0.6235294, 1, 1,
0.1408882, -0.1430361, 2.866958, 0, 0.6156863, 1, 1,
0.1411789, -0.9309986, 4.316189, 0, 0.6117647, 1, 1,
0.1433731, -0.4742826, 2.74608, 0, 0.6039216, 1, 1,
0.1447145, -0.8712691, 3.245211, 0, 0.5960785, 1, 1,
0.1455528, -0.422848, 3.546681, 0, 0.5921569, 1, 1,
0.1502539, -1.485194, 1.945718, 0, 0.5843138, 1, 1,
0.150693, -0.8342054, 1.260295, 0, 0.5803922, 1, 1,
0.1510021, -0.3813358, 4.482244, 0, 0.572549, 1, 1,
0.1581911, 1.210433, 2.274752, 0, 0.5686275, 1, 1,
0.1607987, 0.9278929, -0.07042242, 0, 0.5607843, 1, 1,
0.1621061, 1.327153, 0.8778676, 0, 0.5568628, 1, 1,
0.1644828, 0.4819406, 1.001705, 0, 0.5490196, 1, 1,
0.1655944, -1.253008, 3.582962, 0, 0.5450981, 1, 1,
0.1680401, 1.98015, 1.202055, 0, 0.5372549, 1, 1,
0.1697842, 0.7300726, 1.797108, 0, 0.5333334, 1, 1,
0.1734221, 1.383786, -1.342973, 0, 0.5254902, 1, 1,
0.1749242, 0.1596961, 1.812665, 0, 0.5215687, 1, 1,
0.1782698, 0.1615291, 0.3223157, 0, 0.5137255, 1, 1,
0.1823429, 0.04730536, 1.716197, 0, 0.509804, 1, 1,
0.1827026, -1.48344, 1.935727, 0, 0.5019608, 1, 1,
0.1847368, 1.006117, 0.2811174, 0, 0.4941176, 1, 1,
0.1848865, -1.05543, 2.596462, 0, 0.4901961, 1, 1,
0.1942079, 1.016069, 1.207596, 0, 0.4823529, 1, 1,
0.1955315, 0.02706455, 1.741879, 0, 0.4784314, 1, 1,
0.1956237, -0.6133193, 2.429774, 0, 0.4705882, 1, 1,
0.1971398, 0.3428711, 1.663399, 0, 0.4666667, 1, 1,
0.1986985, 1.989852, 0.6542659, 0, 0.4588235, 1, 1,
0.1987682, -1.245548, 3.323759, 0, 0.454902, 1, 1,
0.2089267, -0.6874921, 3.45996, 0, 0.4470588, 1, 1,
0.2166057, 0.7862527, 0.7450214, 0, 0.4431373, 1, 1,
0.2168607, 1.465511, -0.4264704, 0, 0.4352941, 1, 1,
0.2173363, 0.1043518, 0.7840115, 0, 0.4313726, 1, 1,
0.2184253, -0.3844313, 1.567991, 0, 0.4235294, 1, 1,
0.2186421, 0.3445161, -0.1128874, 0, 0.4196078, 1, 1,
0.2214575, 1.366158, 0.2800832, 0, 0.4117647, 1, 1,
0.2344474, -0.7483683, 2.77915, 0, 0.4078431, 1, 1,
0.2348842, -0.7405204, 3.718648, 0, 0.4, 1, 1,
0.2360237, -0.3924216, 2.547127, 0, 0.3921569, 1, 1,
0.2460378, -1.132627, 3.720243, 0, 0.3882353, 1, 1,
0.2480171, 1.252392, -1.083708, 0, 0.3803922, 1, 1,
0.2554359, 1.041805, 0.6931907, 0, 0.3764706, 1, 1,
0.2602338, -2.936567, 2.717192, 0, 0.3686275, 1, 1,
0.2605189, 0.3878841, -1.833813, 0, 0.3647059, 1, 1,
0.2611154, -0.01164296, -0.2095466, 0, 0.3568628, 1, 1,
0.2672094, -1.022633, 1.826423, 0, 0.3529412, 1, 1,
0.2688288, 0.5033938, -0.4677457, 0, 0.345098, 1, 1,
0.269715, -1.10923, 3.645235, 0, 0.3411765, 1, 1,
0.2736322, 1.07975, -1.856567, 0, 0.3333333, 1, 1,
0.2776383, 1.427687, 0.8316816, 0, 0.3294118, 1, 1,
0.2790514, -0.7600629, 2.517336, 0, 0.3215686, 1, 1,
0.2794044, -1.390002, 3.042772, 0, 0.3176471, 1, 1,
0.2809259, 1.247975, -1.225929, 0, 0.3098039, 1, 1,
0.282022, 0.1786496, 0.2285228, 0, 0.3058824, 1, 1,
0.2827373, 0.3120236, 1.66068, 0, 0.2980392, 1, 1,
0.2846709, 1.074839, 0.5978263, 0, 0.2901961, 1, 1,
0.2857141, 0.5594518, -1.78766, 0, 0.2862745, 1, 1,
0.2887917, -0.05584396, 3.245926, 0, 0.2784314, 1, 1,
0.2906462, -0.3978791, 3.010008, 0, 0.2745098, 1, 1,
0.2951207, -0.04234433, 1.112588, 0, 0.2666667, 1, 1,
0.2956895, -1.350431, 3.233841, 0, 0.2627451, 1, 1,
0.2959405, 1.829641, -1.311819, 0, 0.254902, 1, 1,
0.2998541, 0.5655898, 0.9752352, 0, 0.2509804, 1, 1,
0.3022566, 1.552155, 0.4006393, 0, 0.2431373, 1, 1,
0.3039794, -1.040581, 0.6092823, 0, 0.2392157, 1, 1,
0.3079371, 2.902541, 0.7875904, 0, 0.2313726, 1, 1,
0.3098319, -0.1320073, 1.365798, 0, 0.227451, 1, 1,
0.3128351, 0.4609076, -0.1293224, 0, 0.2196078, 1, 1,
0.3199572, 0.6585353, 0.4158077, 0, 0.2156863, 1, 1,
0.3240935, -0.1225105, 1.445728, 0, 0.2078431, 1, 1,
0.3244546, 1.0082, -0.8987817, 0, 0.2039216, 1, 1,
0.3270036, 0.2619271, 0.007955768, 0, 0.1960784, 1, 1,
0.331412, 0.09597789, 2.024021, 0, 0.1882353, 1, 1,
0.3341138, -0.03626214, 2.177505, 0, 0.1843137, 1, 1,
0.3356074, -0.9760022, 4.205189, 0, 0.1764706, 1, 1,
0.3393668, -1.340248, 3.830721, 0, 0.172549, 1, 1,
0.3420932, 0.122152, 1.983802, 0, 0.1647059, 1, 1,
0.3430327, 0.7237315, -1.144289, 0, 0.1607843, 1, 1,
0.3445584, -0.9628522, 2.416421, 0, 0.1529412, 1, 1,
0.3449914, 0.9269328, -0.1291445, 0, 0.1490196, 1, 1,
0.3454318, -0.9298922, 0.5131946, 0, 0.1411765, 1, 1,
0.3479934, -1.462743, 2.152034, 0, 0.1372549, 1, 1,
0.3499514, 0.3935448, 1.756793, 0, 0.1294118, 1, 1,
0.3500912, -1.231507, 4.208652, 0, 0.1254902, 1, 1,
0.3579934, -0.1091159, 0.2087133, 0, 0.1176471, 1, 1,
0.3592345, 1.448101, 2.256564, 0, 0.1137255, 1, 1,
0.3595502, 0.5257691, -0.8037064, 0, 0.1058824, 1, 1,
0.3604984, -1.325662, 3.998118, 0, 0.09803922, 1, 1,
0.360516, -0.9983171, 3.657273, 0, 0.09411765, 1, 1,
0.3624631, 0.7516956, 1.208341, 0, 0.08627451, 1, 1,
0.3627211, -1.653628, 3.136805, 0, 0.08235294, 1, 1,
0.3658945, -1.228441, 4.590735, 0, 0.07450981, 1, 1,
0.3730091, -0.1954101, 1.609503, 0, 0.07058824, 1, 1,
0.3743733, -1.267043, 2.61333, 0, 0.0627451, 1, 1,
0.37664, -0.9271343, 3.394113, 0, 0.05882353, 1, 1,
0.3772508, 2.159743, 0.2786517, 0, 0.05098039, 1, 1,
0.3785397, -0.8757765, 3.534855, 0, 0.04705882, 1, 1,
0.3889574, -0.6036655, 2.767859, 0, 0.03921569, 1, 1,
0.3949499, 2.142159, 0.4443188, 0, 0.03529412, 1, 1,
0.400273, -0.5120163, 2.884576, 0, 0.02745098, 1, 1,
0.4024453, 0.7717484, 0.5399274, 0, 0.02352941, 1, 1,
0.4067365, -0.9000801, 2.378758, 0, 0.01568628, 1, 1,
0.4085249, -0.3032816, 2.648658, 0, 0.01176471, 1, 1,
0.4112668, 0.5239266, 0.699823, 0, 0.003921569, 1, 1,
0.4131213, 1.495427, -1.778898, 0.003921569, 0, 1, 1,
0.4203987, -0.4770015, 2.3195, 0.007843138, 0, 1, 1,
0.4297934, -1.429591, 0.8263827, 0.01568628, 0, 1, 1,
0.4328094, 1.074431, -1.151063, 0.01960784, 0, 1, 1,
0.4346423, -0.1884649, 1.126359, 0.02745098, 0, 1, 1,
0.4390979, 2.285109, 1.131974, 0.03137255, 0, 1, 1,
0.4416907, 0.188919, 0.8126521, 0.03921569, 0, 1, 1,
0.4433314, -0.6627886, 2.800323, 0.04313726, 0, 1, 1,
0.4436846, -0.05705398, 3.096709, 0.05098039, 0, 1, 1,
0.4474713, 0.3646737, 0.4924523, 0.05490196, 0, 1, 1,
0.4506422, 0.6532505, 0.3664732, 0.0627451, 0, 1, 1,
0.4565956, 0.8626415, 0.7446887, 0.06666667, 0, 1, 1,
0.4674654, 1.315735, 0.3323314, 0.07450981, 0, 1, 1,
0.4694194, 1.444334, -0.7555685, 0.07843138, 0, 1, 1,
0.471102, -0.09508919, 2.687457, 0.08627451, 0, 1, 1,
0.4716506, -0.5107602, 3.313863, 0.09019608, 0, 1, 1,
0.4754838, -1.123675, 1.076929, 0.09803922, 0, 1, 1,
0.4850068, 0.5918611, -0.6454713, 0.1058824, 0, 1, 1,
0.4858312, -2.901313, 2.699552, 0.1098039, 0, 1, 1,
0.4897564, -0.2346129, 2.132052, 0.1176471, 0, 1, 1,
0.4908124, -0.3242098, 1.280328, 0.1215686, 0, 1, 1,
0.491815, -1.463993, 4.55338, 0.1294118, 0, 1, 1,
0.4918506, -0.8012272, 3.921124, 0.1333333, 0, 1, 1,
0.4951547, 1.206919, 1.543052, 0.1411765, 0, 1, 1,
0.4986341, -1.283775, 3.841709, 0.145098, 0, 1, 1,
0.4990338, -0.7882481, 3.148785, 0.1529412, 0, 1, 1,
0.5072392, 0.7234054, 0.5735906, 0.1568628, 0, 1, 1,
0.5077927, 0.9236267, -0.08921447, 0.1647059, 0, 1, 1,
0.5081049, 1.607266, -0.795411, 0.1686275, 0, 1, 1,
0.5102573, 0.3917003, 1.756802, 0.1764706, 0, 1, 1,
0.5126657, 1.422128, -0.367882, 0.1803922, 0, 1, 1,
0.5140806, -0.4238561, 2.1262, 0.1882353, 0, 1, 1,
0.5183439, -0.40485, 2.038409, 0.1921569, 0, 1, 1,
0.5197642, 0.03890888, 1.937914, 0.2, 0, 1, 1,
0.5243142, 1.652605, 2.350324, 0.2078431, 0, 1, 1,
0.5255294, -0.3111969, 1.016092, 0.2117647, 0, 1, 1,
0.5292623, 0.7679306, 0.004431272, 0.2196078, 0, 1, 1,
0.5318245, -0.175849, 0.4511263, 0.2235294, 0, 1, 1,
0.5321041, 1.063826, 0.07857223, 0.2313726, 0, 1, 1,
0.5331559, -0.103596, 0.8088619, 0.2352941, 0, 1, 1,
0.5333121, 0.245928, 0.6749632, 0.2431373, 0, 1, 1,
0.5342779, -0.232189, 2.235958, 0.2470588, 0, 1, 1,
0.5378139, -0.4324526, 2.012908, 0.254902, 0, 1, 1,
0.5393799, -0.655407, 3.556326, 0.2588235, 0, 1, 1,
0.5395917, -0.999788, 4.070476, 0.2666667, 0, 1, 1,
0.5408971, -1.287318, 1.661908, 0.2705882, 0, 1, 1,
0.5440053, 0.1136228, 0.7574119, 0.2784314, 0, 1, 1,
0.5444366, -0.5757046, 1.255781, 0.282353, 0, 1, 1,
0.5445839, 0.04480683, 1.382569, 0.2901961, 0, 1, 1,
0.5454599, 0.5250385, 0.8762209, 0.2941177, 0, 1, 1,
0.5550829, 0.7548252, 0.905621, 0.3019608, 0, 1, 1,
0.5557868, -2.188828, 3.107105, 0.3098039, 0, 1, 1,
0.5624695, 1.148284, 0.7225252, 0.3137255, 0, 1, 1,
0.5651798, -0.106918, 1.022825, 0.3215686, 0, 1, 1,
0.570928, 0.1195299, 1.181414, 0.3254902, 0, 1, 1,
0.5714372, -1.729199, 1.598828, 0.3333333, 0, 1, 1,
0.5745278, -0.2054124, 0.001848133, 0.3372549, 0, 1, 1,
0.5762378, -0.9237534, 3.515405, 0.345098, 0, 1, 1,
0.5780507, 0.2249124, -0.1735519, 0.3490196, 0, 1, 1,
0.5809505, -1.786718, 2.275025, 0.3568628, 0, 1, 1,
0.5813909, 0.07862861, -1.431087, 0.3607843, 0, 1, 1,
0.5871193, 1.000564, 1.350257, 0.3686275, 0, 1, 1,
0.5871913, 0.3456151, 1.055315, 0.372549, 0, 1, 1,
0.5872841, 0.1140486, 1.547029, 0.3803922, 0, 1, 1,
0.5902292, 0.7884048, 0.250181, 0.3843137, 0, 1, 1,
0.5959849, -1.019312, 3.254844, 0.3921569, 0, 1, 1,
0.5979762, 1.2025, 0.5491708, 0.3960784, 0, 1, 1,
0.6043424, -1.012015, 4.26666, 0.4039216, 0, 1, 1,
0.6057671, -1.245341, 2.055135, 0.4117647, 0, 1, 1,
0.6066204, 0.4342321, 0.8557693, 0.4156863, 0, 1, 1,
0.6126638, -0.2865453, 0.7965943, 0.4235294, 0, 1, 1,
0.6157624, 0.5649524, 0.7077674, 0.427451, 0, 1, 1,
0.6172857, 0.7499821, 0.2156482, 0.4352941, 0, 1, 1,
0.6188279, -0.08300271, 2.183535, 0.4392157, 0, 1, 1,
0.6189204, -0.4917019, 3.572282, 0.4470588, 0, 1, 1,
0.6196911, 0.5251408, -0.5302085, 0.4509804, 0, 1, 1,
0.6198431, -0.2400551, 1.24036, 0.4588235, 0, 1, 1,
0.6204448, -0.423604, 3.037122, 0.4627451, 0, 1, 1,
0.6246006, 1.94629, -0.4258757, 0.4705882, 0, 1, 1,
0.6271881, -1.523645, 3.253513, 0.4745098, 0, 1, 1,
0.6318268, 1.521848, 0.2715574, 0.4823529, 0, 1, 1,
0.6346979, 0.4076251, 0.8941928, 0.4862745, 0, 1, 1,
0.6380727, 1.290345, -0.9485306, 0.4941176, 0, 1, 1,
0.6381242, -0.7875758, 2.182296, 0.5019608, 0, 1, 1,
0.6431921, 0.1749903, 2.092245, 0.5058824, 0, 1, 1,
0.6493744, 0.05694555, 2.349138, 0.5137255, 0, 1, 1,
0.6497798, 0.05896562, 1.014594, 0.5176471, 0, 1, 1,
0.6573, -0.8369213, 2.406215, 0.5254902, 0, 1, 1,
0.66021, 1.354183, 0.02522505, 0.5294118, 0, 1, 1,
0.6628044, -1.672368, 2.858983, 0.5372549, 0, 1, 1,
0.6638507, -0.6891466, 0.5483425, 0.5411765, 0, 1, 1,
0.6638706, -0.1131786, 1.500897, 0.5490196, 0, 1, 1,
0.6650392, 0.06941175, 2.130855, 0.5529412, 0, 1, 1,
0.6680095, 0.1365564, 1.70053, 0.5607843, 0, 1, 1,
0.6688861, 1.078324, 0.7675424, 0.5647059, 0, 1, 1,
0.678775, -0.5952075, 1.036501, 0.572549, 0, 1, 1,
0.680335, 0.2813586, 1.509331, 0.5764706, 0, 1, 1,
0.6826749, 0.4624821, 2.876506, 0.5843138, 0, 1, 1,
0.6875854, 0.6580355, -1.226533, 0.5882353, 0, 1, 1,
0.6954447, 0.4681412, 0.7530084, 0.5960785, 0, 1, 1,
0.7015117, -1.622666, 0.4846648, 0.6039216, 0, 1, 1,
0.7016951, 0.7376246, 1.164299, 0.6078432, 0, 1, 1,
0.7069401, -0.4194916, 0.08011527, 0.6156863, 0, 1, 1,
0.7083952, -1.358365, 3.983193, 0.6196079, 0, 1, 1,
0.7094235, -0.6087799, 0.7925731, 0.627451, 0, 1, 1,
0.7103202, 0.572484, 1.730059, 0.6313726, 0, 1, 1,
0.7114894, -1.683, 0.3314888, 0.6392157, 0, 1, 1,
0.7132037, -0.4573954, 1.829252, 0.6431373, 0, 1, 1,
0.7149116, -1.101395, 1.905127, 0.6509804, 0, 1, 1,
0.7151257, -1.284953, 2.76478, 0.654902, 0, 1, 1,
0.7155207, -0.1406731, 1.712307, 0.6627451, 0, 1, 1,
0.7201066, 0.2174299, 3.336104, 0.6666667, 0, 1, 1,
0.7318172, 0.9776083, 2.083849, 0.6745098, 0, 1, 1,
0.7403305, -2.24668, 2.863163, 0.6784314, 0, 1, 1,
0.7455882, -0.2044213, 0.1539049, 0.6862745, 0, 1, 1,
0.7473125, 0.1665765, 1.316617, 0.6901961, 0, 1, 1,
0.7495028, -1.744808, 2.557041, 0.6980392, 0, 1, 1,
0.7516019, -0.1057962, 2.46977, 0.7058824, 0, 1, 1,
0.7525529, 0.3254184, 2.428879, 0.7098039, 0, 1, 1,
0.7590612, -0.2656479, 1.897089, 0.7176471, 0, 1, 1,
0.7604147, 0.9276317, 1.380157, 0.7215686, 0, 1, 1,
0.7672191, 1.865611, 0.05041744, 0.7294118, 0, 1, 1,
0.7679158, -0.3560134, 1.628417, 0.7333333, 0, 1, 1,
0.7713731, 0.6976551, 1.869654, 0.7411765, 0, 1, 1,
0.7745177, -1.218192, 1.745473, 0.7450981, 0, 1, 1,
0.7767231, -1.034221, 2.251097, 0.7529412, 0, 1, 1,
0.7813269, 1.400764, 0.8780777, 0.7568628, 0, 1, 1,
0.785024, 2.127423, 0.6732747, 0.7647059, 0, 1, 1,
0.7909572, 0.287621, 0.612164, 0.7686275, 0, 1, 1,
0.7990656, -1.595719, 2.149913, 0.7764706, 0, 1, 1,
0.800011, 0.5127544, 0.7558349, 0.7803922, 0, 1, 1,
0.8021156, -0.9261109, 3.026432, 0.7882353, 0, 1, 1,
0.8027616, 0.547356, 0.3713723, 0.7921569, 0, 1, 1,
0.8029799, -0.3765573, 1.496941, 0.8, 0, 1, 1,
0.8039119, 1.333524, 1.030854, 0.8078431, 0, 1, 1,
0.8165002, -0.6211988, 1.811074, 0.8117647, 0, 1, 1,
0.8181821, 0.04456712, 1.621019, 0.8196079, 0, 1, 1,
0.8182608, -0.07479255, 0.2203814, 0.8235294, 0, 1, 1,
0.823783, 0.7821846, -0.615793, 0.8313726, 0, 1, 1,
0.8249737, 0.09712905, 2.557746, 0.8352941, 0, 1, 1,
0.8295352, 0.5349008, 1.854656, 0.8431373, 0, 1, 1,
0.8297808, 1.006608, -0.4156515, 0.8470588, 0, 1, 1,
0.8470759, -0.2704156, 2.565583, 0.854902, 0, 1, 1,
0.8473487, -0.6609933, 0.9568294, 0.8588235, 0, 1, 1,
0.8477859, 0.2225783, 2.101555, 0.8666667, 0, 1, 1,
0.848278, 1.796878, 0.2322829, 0.8705882, 0, 1, 1,
0.8494, -0.8360597, 2.328213, 0.8784314, 0, 1, 1,
0.8542938, -2.005333, 3.544536, 0.8823529, 0, 1, 1,
0.8543789, 1.352911, 0.1035921, 0.8901961, 0, 1, 1,
0.8650219, -1.225212, 3.600374, 0.8941177, 0, 1, 1,
0.8654842, 0.9591444, 0.07618372, 0.9019608, 0, 1, 1,
0.8718377, 0.6176502, 1.141724, 0.9098039, 0, 1, 1,
0.874435, -1.248939, 2.428165, 0.9137255, 0, 1, 1,
0.8858756, 1.058561, 0.6524282, 0.9215686, 0, 1, 1,
0.8885968, 0.5688002, 0.9594775, 0.9254902, 0, 1, 1,
0.8930466, -0.7902336, 2.075095, 0.9333333, 0, 1, 1,
0.8952096, 0.2384136, 3.514977, 0.9372549, 0, 1, 1,
0.8994582, 1.121819, 0.3452049, 0.945098, 0, 1, 1,
0.900134, 0.07815516, 2.008782, 0.9490196, 0, 1, 1,
0.9088896, 0.1175958, 2.532437, 0.9568627, 0, 1, 1,
0.9089999, 1.408048, 1.525578, 0.9607843, 0, 1, 1,
0.911378, 0.9346829, -0.09095947, 0.9686275, 0, 1, 1,
0.9144471, -1.979047, 1.838339, 0.972549, 0, 1, 1,
0.9165558, -0.3210681, 2.241217, 0.9803922, 0, 1, 1,
0.9302884, -0.0362881, 3.075387, 0.9843137, 0, 1, 1,
0.9332353, 1.199489, 1.697268, 0.9921569, 0, 1, 1,
0.9411789, 0.3411444, -0.3354102, 0.9960784, 0, 1, 1,
0.9460841, 0.6568314, 0.7554998, 1, 0, 0.9960784, 1,
0.9467298, 2.212077, 1.308955, 1, 0, 0.9882353, 1,
0.9470166, 0.07048688, 1.038355, 1, 0, 0.9843137, 1,
0.9478888, 1.843234, 0.08065492, 1, 0, 0.9764706, 1,
0.9483327, 0.596184, 1.123987, 1, 0, 0.972549, 1,
0.9490099, -0.4356218, 0.2341262, 1, 0, 0.9647059, 1,
0.9551823, 1.697308, 1.067879, 1, 0, 0.9607843, 1,
0.9554899, 0.1623639, 2.701797, 1, 0, 0.9529412, 1,
0.9569179, -0.1032869, 3.658414, 1, 0, 0.9490196, 1,
0.9649871, -0.08600663, 3.696152, 1, 0, 0.9411765, 1,
0.9780787, -0.130372, 0.4154611, 1, 0, 0.9372549, 1,
0.9955555, -1.01238, 2.716508, 1, 0, 0.9294118, 1,
0.9989685, -0.4619552, 1.618585, 1, 0, 0.9254902, 1,
1.005865, -0.1899473, 3.119384, 1, 0, 0.9176471, 1,
1.02198, -0.7914204, 0.7919236, 1, 0, 0.9137255, 1,
1.024173, -0.7559337, 0.7137216, 1, 0, 0.9058824, 1,
1.02463, 0.09518674, 1.328238, 1, 0, 0.9019608, 1,
1.025853, 0.903567, 1.215476, 1, 0, 0.8941177, 1,
1.0293, 1.637661, 0.6830925, 1, 0, 0.8862745, 1,
1.034474, 0.280246, 0.3801137, 1, 0, 0.8823529, 1,
1.046167, 0.9515748, 0.6085956, 1, 0, 0.8745098, 1,
1.053429, 0.659037, 1.502898, 1, 0, 0.8705882, 1,
1.058384, 0.3294731, 1.798566, 1, 0, 0.8627451, 1,
1.066919, -0.8733982, 1.541556, 1, 0, 0.8588235, 1,
1.078724, -0.1689638, 3.274366, 1, 0, 0.8509804, 1,
1.08201, 0.5357515, 1.172929, 1, 0, 0.8470588, 1,
1.083008, -0.8161308, 1.243017, 1, 0, 0.8392157, 1,
1.093092, -0.4338568, 2.483988, 1, 0, 0.8352941, 1,
1.096326, -1.218477, 2.779004, 1, 0, 0.827451, 1,
1.110937, 1.354799, 0.8847092, 1, 0, 0.8235294, 1,
1.126348, 0.3586899, 1.670289, 1, 0, 0.8156863, 1,
1.128519, -0.2007553, 1.051326, 1, 0, 0.8117647, 1,
1.132204, 0.1185386, 1.435343, 1, 0, 0.8039216, 1,
1.142825, 0.1974292, 1.175024, 1, 0, 0.7960784, 1,
1.14409, -1.531227, 1.777308, 1, 0, 0.7921569, 1,
1.151968, 0.1051692, 2.053315, 1, 0, 0.7843137, 1,
1.163152, -1.048316, 1.37349, 1, 0, 0.7803922, 1,
1.183534, -0.1191905, 1.408795, 1, 0, 0.772549, 1,
1.194149, -1.981196, 2.918833, 1, 0, 0.7686275, 1,
1.195402, 0.7263233, 0.1451504, 1, 0, 0.7607843, 1,
1.198484, 0.02382004, 2.078138, 1, 0, 0.7568628, 1,
1.201212, 0.2455708, 1.141678, 1, 0, 0.7490196, 1,
1.203004, 1.183104, -0.02194473, 1, 0, 0.7450981, 1,
1.207789, -0.5690497, 1.881401, 1, 0, 0.7372549, 1,
1.209789, 0.08295361, 1.214466, 1, 0, 0.7333333, 1,
1.224959, -0.6785483, 2.488033, 1, 0, 0.7254902, 1,
1.233498, 0.8667964, 0.8061205, 1, 0, 0.7215686, 1,
1.23696, -0.159322, 2.903579, 1, 0, 0.7137255, 1,
1.241629, 1.283256, 0.4311554, 1, 0, 0.7098039, 1,
1.241846, -1.060328, 2.156265, 1, 0, 0.7019608, 1,
1.243562, 1.173857, 1.645368, 1, 0, 0.6941177, 1,
1.246747, 1.547834, 1.854047, 1, 0, 0.6901961, 1,
1.252274, -0.02214087, 1.655947, 1, 0, 0.682353, 1,
1.273195, 0.5504637, 1.120356, 1, 0, 0.6784314, 1,
1.281675, -1.805633, 2.481835, 1, 0, 0.6705883, 1,
1.291737, 1.168388, 1.905851, 1, 0, 0.6666667, 1,
1.292279, -0.2587244, 2.08161, 1, 0, 0.6588235, 1,
1.294008, 0.3804903, 1.848416, 1, 0, 0.654902, 1,
1.296158, 0.350614, -0.7495833, 1, 0, 0.6470588, 1,
1.307887, 0.3913533, 0.316086, 1, 0, 0.6431373, 1,
1.319628, -0.09413115, 1.328772, 1, 0, 0.6352941, 1,
1.322876, 0.2560222, 1.52793, 1, 0, 0.6313726, 1,
1.326903, -0.620362, 1.919487, 1, 0, 0.6235294, 1,
1.335473, -1.20235, 2.301911, 1, 0, 0.6196079, 1,
1.339176, -2.690386, 4.240654, 1, 0, 0.6117647, 1,
1.345183, 0.2491222, 1.44281, 1, 0, 0.6078432, 1,
1.348508, 1.551228, 0.001243918, 1, 0, 0.6, 1,
1.358261, -0.1650512, 0.1684425, 1, 0, 0.5921569, 1,
1.358455, -0.5324999, 0.9075273, 1, 0, 0.5882353, 1,
1.358637, 1.599065, 0.6034768, 1, 0, 0.5803922, 1,
1.36299, -0.05529708, 1.1548, 1, 0, 0.5764706, 1,
1.365507, 1.158301, 0.4959978, 1, 0, 0.5686275, 1,
1.366812, 0.2706124, 3.738738, 1, 0, 0.5647059, 1,
1.381173, 1.510478, 1.859926, 1, 0, 0.5568628, 1,
1.388376, -0.108553, 2.973643, 1, 0, 0.5529412, 1,
1.390797, -0.8700957, 2.517359, 1, 0, 0.5450981, 1,
1.394475, -0.683366, 2.530346, 1, 0, 0.5411765, 1,
1.401137, 0.04568247, 1.779843, 1, 0, 0.5333334, 1,
1.401813, -0.4475431, 3.161189, 1, 0, 0.5294118, 1,
1.41004, 1.024179, 0.8157739, 1, 0, 0.5215687, 1,
1.416991, 0.4279842, 0.5460442, 1, 0, 0.5176471, 1,
1.423053, -1.740981, 0.7556064, 1, 0, 0.509804, 1,
1.424254, 1.57973, 0.9923457, 1, 0, 0.5058824, 1,
1.432081, -0.4804215, 1.617186, 1, 0, 0.4980392, 1,
1.432732, 0.5909454, 0.1328567, 1, 0, 0.4901961, 1,
1.433357, 1.218178, 0.3101243, 1, 0, 0.4862745, 1,
1.440297, -0.04009801, 1.448858, 1, 0, 0.4784314, 1,
1.443835, 0.8689241, 0.3055606, 1, 0, 0.4745098, 1,
1.451394, 0.9220942, -0.3731249, 1, 0, 0.4666667, 1,
1.457659, 0.5334605, 0.2729024, 1, 0, 0.4627451, 1,
1.460076, -0.954237, 1.936551, 1, 0, 0.454902, 1,
1.480582, 0.0751352, 1.568542, 1, 0, 0.4509804, 1,
1.483317, -0.5233544, 2.226164, 1, 0, 0.4431373, 1,
1.49254, 0.0999399, 1.747992, 1, 0, 0.4392157, 1,
1.506304, 1.076061, -0.6298671, 1, 0, 0.4313726, 1,
1.506961, 0.1825699, 1.586706, 1, 0, 0.427451, 1,
1.509992, 0.1876884, 2.736944, 1, 0, 0.4196078, 1,
1.514068, 0.7394907, 1.147415, 1, 0, 0.4156863, 1,
1.524691, 0.005701426, 0.9376683, 1, 0, 0.4078431, 1,
1.52743, -1.114504, 2.193001, 1, 0, 0.4039216, 1,
1.527751, -0.1523589, 2.039331, 1, 0, 0.3960784, 1,
1.530064, -0.4277818, 1.213354, 1, 0, 0.3882353, 1,
1.53683, -1.499183, 4.164972, 1, 0, 0.3843137, 1,
1.541473, 0.2947177, 1.508893, 1, 0, 0.3764706, 1,
1.541731, -0.09517065, 3.305588, 1, 0, 0.372549, 1,
1.549394, 0.7647458, 2.204707, 1, 0, 0.3647059, 1,
1.555261, -2.790032, 3.488747, 1, 0, 0.3607843, 1,
1.561022, 0.0345193, 0.2408719, 1, 0, 0.3529412, 1,
1.570892, 0.3131454, -0.02889546, 1, 0, 0.3490196, 1,
1.575031, -0.2301398, -0.9279082, 1, 0, 0.3411765, 1,
1.579161, -1.063177, 2.684008, 1, 0, 0.3372549, 1,
1.582644, -0.392559, 1.767236, 1, 0, 0.3294118, 1,
1.586156, 0.66188, 1.416702, 1, 0, 0.3254902, 1,
1.592427, -2.285739, 3.000239, 1, 0, 0.3176471, 1,
1.599562, 1.213549, 0.6860622, 1, 0, 0.3137255, 1,
1.615967, 1.045967, -0.5052978, 1, 0, 0.3058824, 1,
1.627156, -0.1978322, 2.082964, 1, 0, 0.2980392, 1,
1.635406, -0.1720918, 1.456173, 1, 0, 0.2941177, 1,
1.636699, -0.8137259, 3.999012, 1, 0, 0.2862745, 1,
1.644632, -1.185076, 1.679509, 1, 0, 0.282353, 1,
1.672361, -0.06387348, 1.576661, 1, 0, 0.2745098, 1,
1.696529, -0.01869818, 1.607467, 1, 0, 0.2705882, 1,
1.702534, 1.282808, 1.383953, 1, 0, 0.2627451, 1,
1.728929, 0.8183982, 0.8910072, 1, 0, 0.2588235, 1,
1.731568, 1.735459, 0.6497381, 1, 0, 0.2509804, 1,
1.737708, -0.3753084, 2.211034, 1, 0, 0.2470588, 1,
1.751357, -0.07841023, 2.466853, 1, 0, 0.2392157, 1,
1.75391, 0.3336739, 2.958891, 1, 0, 0.2352941, 1,
1.764433, -1.665627, 1.798644, 1, 0, 0.227451, 1,
1.771786, 0.7314373, 1.486206, 1, 0, 0.2235294, 1,
1.775615, 0.8132515, 0.772516, 1, 0, 0.2156863, 1,
1.791365, -1.023829, 1.814704, 1, 0, 0.2117647, 1,
1.793018, 0.6595876, 0.2197151, 1, 0, 0.2039216, 1,
1.80173, -0.6172073, 1.869701, 1, 0, 0.1960784, 1,
1.811801, -1.514998, 1.935368, 1, 0, 0.1921569, 1,
1.827757, 0.3807895, 0.507974, 1, 0, 0.1843137, 1,
1.835626, -0.1759333, 1.794191, 1, 0, 0.1803922, 1,
1.868987, -1.35581, 1.095105, 1, 0, 0.172549, 1,
1.878294, 0.04739939, 3.252925, 1, 0, 0.1686275, 1,
1.882106, -0.6121479, 2.52489, 1, 0, 0.1607843, 1,
1.88589, -0.6337223, 3.103793, 1, 0, 0.1568628, 1,
1.890035, -1.004387, 3.051481, 1, 0, 0.1490196, 1,
1.896499, -0.6600822, 2.180767, 1, 0, 0.145098, 1,
1.896716, -0.4162669, 2.072999, 1, 0, 0.1372549, 1,
1.900801, -0.9514822, 2.990831, 1, 0, 0.1333333, 1,
1.906881, 0.4408592, 3.009583, 1, 0, 0.1254902, 1,
1.914344, -0.2914505, 3.126366, 1, 0, 0.1215686, 1,
1.928487, 0.02330152, 1.786607, 1, 0, 0.1137255, 1,
1.940163, -0.3448592, 1.284071, 1, 0, 0.1098039, 1,
1.992494, 1.083543, -2.107729, 1, 0, 0.1019608, 1,
2.134478, -1.907838, 2.167725, 1, 0, 0.09411765, 1,
2.136702, 0.782909, 1.28903, 1, 0, 0.09019608, 1,
2.139713, 0.3981435, 2.682917, 1, 0, 0.08235294, 1,
2.205054, -1.024156, 1.711831, 1, 0, 0.07843138, 1,
2.213162, -0.6704423, 0.5701489, 1, 0, 0.07058824, 1,
2.224352, -0.8890556, 2.619266, 1, 0, 0.06666667, 1,
2.273917, -1.290289, 1.605467, 1, 0, 0.05882353, 1,
2.349151, -0.004483328, 0.9374542, 1, 0, 0.05490196, 1,
2.448683, -1.168735, 1.9342, 1, 0, 0.04705882, 1,
2.569689, 0.5919795, 0.829165, 1, 0, 0.04313726, 1,
2.592441, -0.3071021, 1.112249, 1, 0, 0.03529412, 1,
2.64125, -0.3350304, 1.707534, 1, 0, 0.03137255, 1,
2.79629, -0.4859053, 2.951218, 1, 0, 0.02352941, 1,
2.81581, 1.78757, -0.09897996, 1, 0, 0.01960784, 1,
3.108691, 0.8418177, 1.436735, 1, 0, 0.01176471, 1,
3.128818, 0.3814048, 0.9147046, 1, 0, 0.007843138, 1
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
0.08037651, -3.926296, -7.577548, 0, -0.5, 0.5, 0.5,
0.08037651, -3.926296, -7.577548, 1, -0.5, 0.5, 0.5,
0.08037651, -3.926296, -7.577548, 1, 1.5, 0.5, 0.5,
0.08037651, -3.926296, -7.577548, 0, 1.5, 0.5, 0.5
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
-4.001487, -0.01701319, -7.577548, 0, -0.5, 0.5, 0.5,
-4.001487, -0.01701319, -7.577548, 1, -0.5, 0.5, 0.5,
-4.001487, -0.01701319, -7.577548, 1, 1.5, 0.5, 0.5,
-4.001487, -0.01701319, -7.577548, 0, 1.5, 0.5, 0.5
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
-4.001487, -3.926296, -0.611609, 0, -0.5, 0.5, 0.5,
-4.001487, -3.926296, -0.611609, 1, -0.5, 0.5, 0.5,
-4.001487, -3.926296, -0.611609, 1, 1.5, 0.5, 0.5,
-4.001487, -3.926296, -0.611609, 0, 1.5, 0.5, 0.5
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
-2, -3.024154, -5.970023,
3, -3.024154, -5.970023,
-2, -3.024154, -5.970023,
-2, -3.174511, -6.237944,
-1, -3.024154, -5.970023,
-1, -3.174511, -6.237944,
0, -3.024154, -5.970023,
0, -3.174511, -6.237944,
1, -3.024154, -5.970023,
1, -3.174511, -6.237944,
2, -3.024154, -5.970023,
2, -3.174511, -6.237944,
3, -3.024154, -5.970023,
3, -3.174511, -6.237944
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
-2, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
-2, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
-2, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
-2, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5,
-1, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
-1, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
-1, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
-1, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5,
0, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
0, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
0, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
0, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5,
1, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
1, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
1, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
1, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5,
2, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
2, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
2, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
2, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5,
3, -3.475225, -6.773786, 0, -0.5, 0.5, 0.5,
3, -3.475225, -6.773786, 1, -0.5, 0.5, 0.5,
3, -3.475225, -6.773786, 1, 1.5, 0.5, 0.5,
3, -3.475225, -6.773786, 0, 1.5, 0.5, 0.5
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
-3.059518, -2, -5.970023,
-3.059518, 2, -5.970023,
-3.059518, -2, -5.970023,
-3.216513, -2, -6.237944,
-3.059518, -1, -5.970023,
-3.216513, -1, -6.237944,
-3.059518, 0, -5.970023,
-3.216513, 0, -6.237944,
-3.059518, 1, -5.970023,
-3.216513, 1, -6.237944,
-3.059518, 2, -5.970023,
-3.216513, 2, -6.237944
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
-3.530503, -2, -6.773786, 0, -0.5, 0.5, 0.5,
-3.530503, -2, -6.773786, 1, -0.5, 0.5, 0.5,
-3.530503, -2, -6.773786, 1, 1.5, 0.5, 0.5,
-3.530503, -2, -6.773786, 0, 1.5, 0.5, 0.5,
-3.530503, -1, -6.773786, 0, -0.5, 0.5, 0.5,
-3.530503, -1, -6.773786, 1, -0.5, 0.5, 0.5,
-3.530503, -1, -6.773786, 1, 1.5, 0.5, 0.5,
-3.530503, -1, -6.773786, 0, 1.5, 0.5, 0.5,
-3.530503, 0, -6.773786, 0, -0.5, 0.5, 0.5,
-3.530503, 0, -6.773786, 1, -0.5, 0.5, 0.5,
-3.530503, 0, -6.773786, 1, 1.5, 0.5, 0.5,
-3.530503, 0, -6.773786, 0, 1.5, 0.5, 0.5,
-3.530503, 1, -6.773786, 0, -0.5, 0.5, 0.5,
-3.530503, 1, -6.773786, 1, -0.5, 0.5, 0.5,
-3.530503, 1, -6.773786, 1, 1.5, 0.5, 0.5,
-3.530503, 1, -6.773786, 0, 1.5, 0.5, 0.5,
-3.530503, 2, -6.773786, 0, -0.5, 0.5, 0.5,
-3.530503, 2, -6.773786, 1, -0.5, 0.5, 0.5,
-3.530503, 2, -6.773786, 1, 1.5, 0.5, 0.5,
-3.530503, 2, -6.773786, 0, 1.5, 0.5, 0.5
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
-3.059518, -3.024154, -4,
-3.059518, -3.024154, 4,
-3.059518, -3.024154, -4,
-3.216513, -3.174511, -4,
-3.059518, -3.024154, -2,
-3.216513, -3.174511, -2,
-3.059518, -3.024154, 0,
-3.216513, -3.174511, 0,
-3.059518, -3.024154, 2,
-3.216513, -3.174511, 2,
-3.059518, -3.024154, 4,
-3.216513, -3.174511, 4
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
-3.530503, -3.475225, -4, 0, -0.5, 0.5, 0.5,
-3.530503, -3.475225, -4, 1, -0.5, 0.5, 0.5,
-3.530503, -3.475225, -4, 1, 1.5, 0.5, 0.5,
-3.530503, -3.475225, -4, 0, 1.5, 0.5, 0.5,
-3.530503, -3.475225, -2, 0, -0.5, 0.5, 0.5,
-3.530503, -3.475225, -2, 1, -0.5, 0.5, 0.5,
-3.530503, -3.475225, -2, 1, 1.5, 0.5, 0.5,
-3.530503, -3.475225, -2, 0, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 0, 0, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 0, 1, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 0, 1, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 0, 0, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 2, 0, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 2, 1, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 2, 1, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 2, 0, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 4, 0, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 4, 1, -0.5, 0.5, 0.5,
-3.530503, -3.475225, 4, 1, 1.5, 0.5, 0.5,
-3.530503, -3.475225, 4, 0, 1.5, 0.5, 0.5
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
-3.059518, -3.024154, -5.970023,
-3.059518, 2.990127, -5.970023,
-3.059518, -3.024154, 4.746805,
-3.059518, 2.990127, 4.746805,
-3.059518, -3.024154, -5.970023,
-3.059518, -3.024154, 4.746805,
-3.059518, 2.990127, -5.970023,
-3.059518, 2.990127, 4.746805,
-3.059518, -3.024154, -5.970023,
3.220271, -3.024154, -5.970023,
-3.059518, -3.024154, 4.746805,
3.220271, -3.024154, 4.746805,
-3.059518, 2.990127, -5.970023,
3.220271, 2.990127, -5.970023,
-3.059518, 2.990127, 4.746805,
3.220271, 2.990127, 4.746805,
3.220271, -3.024154, -5.970023,
3.220271, 2.990127, -5.970023,
3.220271, -3.024154, 4.746805,
3.220271, 2.990127, 4.746805,
3.220271, -3.024154, -5.970023,
3.220271, -3.024154, 4.746805,
3.220271, 2.990127, -5.970023,
3.220271, 2.990127, 4.746805
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
var radius = 7.369275;
var distance = 32.78674;
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
mvMatrix.translate( -0.08037651, 0.01701319, 0.611609 );
mvMatrix.scale( 1.268801, 1.324814, 0.7434853 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.78674);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Chlorethoxyfos<-read.table("Chlorethoxyfos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.968065, -1.055765, -0.8312805, 0, 0, 1, 1, 1,
-2.925457, 0.5311281, -2.26967, 1, 0, 0, 1, 1,
-2.62413, -0.7687622, -1.53981, 1, 0, 0, 1, 1,
-2.598787, -0.4969851, -0.6936225, 1, 0, 0, 1, 1,
-2.584136, 0.0253332, 0.03951159, 1, 0, 0, 1, 1,
-2.405313, -0.4184248, -2.406037, 1, 0, 0, 1, 1,
-2.398589, 2.09372, 0.5140362, 0, 0, 0, 1, 1,
-2.383983, -0.5330713, -1.19043, 0, 0, 0, 1, 1,
-2.381533, 0.8977899, -1.898862, 0, 0, 0, 1, 1,
-2.34184, -0.1839985, -1.814011, 0, 0, 0, 1, 1,
-2.34059, -0.7520185, -1.529318, 0, 0, 0, 1, 1,
-2.325704, 1.570488, -1.392547, 0, 0, 0, 1, 1,
-2.257621, -0.7826399, -0.7487668, 0, 0, 0, 1, 1,
-2.238769, 1.712766, 0.1834352, 1, 1, 1, 1, 1,
-2.228685, -1.606204, -1.381938, 1, 1, 1, 1, 1,
-2.212017, -1.662816, -0.2661115, 1, 1, 1, 1, 1,
-2.176084, -0.2849824, -3.122428, 1, 1, 1, 1, 1,
-2.140406, -1.369431, -2.581445, 1, 1, 1, 1, 1,
-2.135066, -0.5700077, -2.985676, 1, 1, 1, 1, 1,
-2.126805, 0.8958467, -0.6589051, 1, 1, 1, 1, 1,
-2.121119, -0.7279823, -2.811906, 1, 1, 1, 1, 1,
-2.085717, -0.05809243, 0.499673, 1, 1, 1, 1, 1,
-2.085566, -1.50567, -1.938068, 1, 1, 1, 1, 1,
-2.082761, 1.499733, -0.8315659, 1, 1, 1, 1, 1,
-2.074121, -1.092069, -2.330652, 1, 1, 1, 1, 1,
-2.068152, 0.6988477, -1.917419, 1, 1, 1, 1, 1,
-2.061105, -1.012328, -2.091527, 1, 1, 1, 1, 1,
-2.039208, 1.206183, -0.484733, 1, 1, 1, 1, 1,
-2.018911, 0.8026033, -0.5932784, 0, 0, 1, 1, 1,
-2.011853, -0.64481, -2.182373, 1, 0, 0, 1, 1,
-1.975559, 0.409459, -0.06220025, 1, 0, 0, 1, 1,
-1.960983, 0.1329845, -1.773009, 1, 0, 0, 1, 1,
-1.96006, -1.351654, -1.141734, 1, 0, 0, 1, 1,
-1.956586, -0.352451, 0.3809899, 1, 0, 0, 1, 1,
-1.911884, 0.4452813, -2.547719, 0, 0, 0, 1, 1,
-1.911867, -1.156018, -3.010151, 0, 0, 0, 1, 1,
-1.88837, 0.1962036, -1.631245, 0, 0, 0, 1, 1,
-1.840854, -0.3458896, -1.585648, 0, 0, 0, 1, 1,
-1.816601, 1.69678, 0.2287764, 0, 0, 0, 1, 1,
-1.746791, -0.8427951, -2.163657, 0, 0, 0, 1, 1,
-1.746109, 0.6017617, 0.8502661, 0, 0, 0, 1, 1,
-1.726129, -0.4170474, -1.497695, 1, 1, 1, 1, 1,
-1.70679, -0.8549156, -3.525408, 1, 1, 1, 1, 1,
-1.703761, -1.307502, -2.258988, 1, 1, 1, 1, 1,
-1.692465, -0.2516857, -3.491168, 1, 1, 1, 1, 1,
-1.687857, 0.3159916, -1.77757, 1, 1, 1, 1, 1,
-1.669654, -0.1381122, -1.482166, 1, 1, 1, 1, 1,
-1.668586, -0.07791314, -2.0642, 1, 1, 1, 1, 1,
-1.663569, -2.158406, -2.618959, 1, 1, 1, 1, 1,
-1.65986, -0.7216268, 0.721292, 1, 1, 1, 1, 1,
-1.656033, 0.7968566, -0.6848546, 1, 1, 1, 1, 1,
-1.643636, -0.9939774, 0.1508855, 1, 1, 1, 1, 1,
-1.63677, 1.300023, 0.4824545, 1, 1, 1, 1, 1,
-1.619754, 0.8696185, -2.853292, 1, 1, 1, 1, 1,
-1.618503, -1.449709, -0.9544026, 1, 1, 1, 1, 1,
-1.57647, -0.3640611, -0.4212038, 1, 1, 1, 1, 1,
-1.55423, -1.625556, -0.3745047, 0, 0, 1, 1, 1,
-1.54865, 0.1835515, -3.168657, 1, 0, 0, 1, 1,
-1.537834, 0.5858544, -1.161611, 1, 0, 0, 1, 1,
-1.517755, -0.6583445, -1.997866, 1, 0, 0, 1, 1,
-1.505546, -0.1207913, -1.914266, 1, 0, 0, 1, 1,
-1.50071, -1.473709, -3.690835, 1, 0, 0, 1, 1,
-1.488204, -1.830559, -2.016174, 0, 0, 0, 1, 1,
-1.48662, 1.47908, 0.7017411, 0, 0, 0, 1, 1,
-1.485901, 0.7046345, -0.6187075, 0, 0, 0, 1, 1,
-1.480847, -1.555887, -3.208586, 0, 0, 0, 1, 1,
-1.479811, 0.08031078, -1.421972, 0, 0, 0, 1, 1,
-1.477929, 0.2321845, -2.884029, 0, 0, 0, 1, 1,
-1.477529, -0.1976112, -0.7936457, 0, 0, 0, 1, 1,
-1.468651, 0.5537092, -1.737024, 1, 1, 1, 1, 1,
-1.468018, 0.5985691, -1.598726, 1, 1, 1, 1, 1,
-1.46687, -0.03110657, -2.640804, 1, 1, 1, 1, 1,
-1.462599, 0.6328762, -1.229357, 1, 1, 1, 1, 1,
-1.460483, -0.8570424, -0.5411428, 1, 1, 1, 1, 1,
-1.460405, 2.206345, -0.6834019, 1, 1, 1, 1, 1,
-1.438199, -0.09766556, 0.1734403, 1, 1, 1, 1, 1,
-1.437868, 0.6358312, -1.030569, 1, 1, 1, 1, 1,
-1.424606, -0.9702535, 0.2565448, 1, 1, 1, 1, 1,
-1.419864, -1.920425, -3.977585, 1, 1, 1, 1, 1,
-1.414293, 0.8347852, -0.8616589, 1, 1, 1, 1, 1,
-1.412677, -1.743626, -0.6619742, 1, 1, 1, 1, 1,
-1.408029, 0.2709654, -2.612556, 1, 1, 1, 1, 1,
-1.399922, -1.595162, -3.26299, 1, 1, 1, 1, 1,
-1.390978, -0.161546, -2.379154, 1, 1, 1, 1, 1,
-1.390235, 0.4036812, -1.723366, 0, 0, 1, 1, 1,
-1.373779, 0.6224613, -2.114894, 1, 0, 0, 1, 1,
-1.358911, -1.070884, -1.47787, 1, 0, 0, 1, 1,
-1.355764, -0.7392027, -2.7713, 1, 0, 0, 1, 1,
-1.347945, -0.2915582, -2.172044, 1, 0, 0, 1, 1,
-1.347108, -0.1261263, -1.935729, 1, 0, 0, 1, 1,
-1.339187, -0.3881937, -1.659037, 0, 0, 0, 1, 1,
-1.332469, -0.9944705, -2.214741, 0, 0, 0, 1, 1,
-1.329622, 1.074007, -0.6909829, 0, 0, 0, 1, 1,
-1.319584, 0.3100956, -0.2039815, 0, 0, 0, 1, 1,
-1.312584, -0.1204594, -0.4928663, 0, 0, 0, 1, 1,
-1.29445, 0.6029513, 1.062103, 0, 0, 0, 1, 1,
-1.293498, 0.2117235, -0.1650093, 0, 0, 0, 1, 1,
-1.292565, 1.2184, 0.4673753, 1, 1, 1, 1, 1,
-1.267081, 0.9778727, -1.124915, 1, 1, 1, 1, 1,
-1.265968, 0.5801196, -1.215149, 1, 1, 1, 1, 1,
-1.262246, 0.1829241, -1.964435, 1, 1, 1, 1, 1,
-1.250283, -0.6932052, -2.411433, 1, 1, 1, 1, 1,
-1.240718, -0.8371282, -2.184293, 1, 1, 1, 1, 1,
-1.239774, 1.067833, 0.1211225, 1, 1, 1, 1, 1,
-1.234097, 0.5588934, -0.4169448, 1, 1, 1, 1, 1,
-1.23052, -0.8579931, -2.561279, 1, 1, 1, 1, 1,
-1.226167, 0.6246925, -2.961829, 1, 1, 1, 1, 1,
-1.222333, -0.09670322, -1.66695, 1, 1, 1, 1, 1,
-1.218836, -0.9983579, -1.650094, 1, 1, 1, 1, 1,
-1.212121, -0.2886863, -1.089126, 1, 1, 1, 1, 1,
-1.203081, 0.4172353, -1.712998, 1, 1, 1, 1, 1,
-1.200185, -0.895431, -2.835232, 1, 1, 1, 1, 1,
-1.196724, 1.077134, -1.032342, 0, 0, 1, 1, 1,
-1.19461, -1.779437, -1.576925, 1, 0, 0, 1, 1,
-1.194245, 0.801021, -0.7453644, 1, 0, 0, 1, 1,
-1.191469, 0.6161512, -0.6507582, 1, 0, 0, 1, 1,
-1.186482, 0.9283572, -1.226292, 1, 0, 0, 1, 1,
-1.185435, 0.1947727, -0.7873355, 1, 0, 0, 1, 1,
-1.18469, -0.1946548, -1.313553, 0, 0, 0, 1, 1,
-1.18148, 1.029836, -0.8448057, 0, 0, 0, 1, 1,
-1.173256, 1.766027, -1.554444, 0, 0, 0, 1, 1,
-1.165435, 0.01728655, -2.610162, 0, 0, 0, 1, 1,
-1.162584, 0.5420332, 0.5347989, 0, 0, 0, 1, 1,
-1.156023, 0.1798253, -3.144087, 0, 0, 0, 1, 1,
-1.155318, -0.2648897, -3.079951, 0, 0, 0, 1, 1,
-1.15287, 0.8620333, -0.7615769, 1, 1, 1, 1, 1,
-1.1438, 0.9027096, -3.206515, 1, 1, 1, 1, 1,
-1.141247, -0.1955612, -2.792084, 1, 1, 1, 1, 1,
-1.139883, 0.144374, -2.055986, 1, 1, 1, 1, 1,
-1.138777, 0.6317048, -0.9754317, 1, 1, 1, 1, 1,
-1.137557, -1.414213, -2.241071, 1, 1, 1, 1, 1,
-1.135044, -1.208395, -2.701469, 1, 1, 1, 1, 1,
-1.134927, -0.7845166, -1.852875, 1, 1, 1, 1, 1,
-1.133801, 0.2108026, -1.761855, 1, 1, 1, 1, 1,
-1.128631, -0.9647394, -1.762656, 1, 1, 1, 1, 1,
-1.116347, -0.1060623, -2.080983, 1, 1, 1, 1, 1,
-1.110282, 0.5423093, -2.34037, 1, 1, 1, 1, 1,
-1.108516, -0.2267524, -0.7749126, 1, 1, 1, 1, 1,
-1.099798, 0.1109226, -1.693241, 1, 1, 1, 1, 1,
-1.096817, -0.1757784, -0.2122333, 1, 1, 1, 1, 1,
-1.096115, 0.4556974, -3.135377, 0, 0, 1, 1, 1,
-1.08847, 2.231061, 0.1067809, 1, 0, 0, 1, 1,
-1.085224, 0.3717304, -2.044798, 1, 0, 0, 1, 1,
-1.081734, 0.2452354, -1.07148, 1, 0, 0, 1, 1,
-1.074409, 0.1159523, 1.513378, 1, 0, 0, 1, 1,
-1.066514, 1.14717, -0.6735249, 1, 0, 0, 1, 1,
-1.059415, 0.7201155, -0.419043, 0, 0, 0, 1, 1,
-1.057215, 0.8355448, -1.033336, 0, 0, 0, 1, 1,
-1.053129, -0.7606011, -2.869251, 0, 0, 0, 1, 1,
-1.051515, -0.7930699, -3.374261, 0, 0, 0, 1, 1,
-1.050095, 1.693715, -0.1084435, 0, 0, 0, 1, 1,
-1.049863, 0.210022, -1.133425, 0, 0, 0, 1, 1,
-1.046653, -0.004815417, -0.7788263, 0, 0, 0, 1, 1,
-1.040826, -0.6262842, -2.283084, 1, 1, 1, 1, 1,
-1.039011, 0.552018, -1.351554, 1, 1, 1, 1, 1,
-1.033869, -1.331312, -2.039013, 1, 1, 1, 1, 1,
-1.024814, 0.486947, -2.26602, 1, 1, 1, 1, 1,
-1.020181, -0.7660527, -1.755006, 1, 1, 1, 1, 1,
-1.00692, 0.5087495, 0.5308945, 1, 1, 1, 1, 1,
-1.005959, 0.830617, -0.7078556, 1, 1, 1, 1, 1,
-0.9975412, 1.010574, 0.07478935, 1, 1, 1, 1, 1,
-0.9970319, -0.7027842, -1.377932, 1, 1, 1, 1, 1,
-0.9893584, 0.2592534, -2.101948, 1, 1, 1, 1, 1,
-0.9882259, -0.2551773, -2.356882, 1, 1, 1, 1, 1,
-0.9865558, 1.054183, -0.923109, 1, 1, 1, 1, 1,
-0.9835405, 0.7631891, -0.7011933, 1, 1, 1, 1, 1,
-0.9826236, -0.004802453, -1.203873, 1, 1, 1, 1, 1,
-0.961215, -0.1224673, -1.615099, 1, 1, 1, 1, 1,
-0.960376, 0.6367764, -2.62019, 0, 0, 1, 1, 1,
-0.9559416, 0.3410416, -0.538124, 1, 0, 0, 1, 1,
-0.9550033, 1.478604, 0.1237636, 1, 0, 0, 1, 1,
-0.9548349, -1.053387, -3.497336, 1, 0, 0, 1, 1,
-0.944618, -0.6983687, -3.623506, 1, 0, 0, 1, 1,
-0.9416066, -0.5095981, -1.399055, 1, 0, 0, 1, 1,
-0.9357582, 1.304912, -0.6462344, 0, 0, 0, 1, 1,
-0.9331703, 0.0618844, 0.3039103, 0, 0, 0, 1, 1,
-0.9287874, 0.4213106, -2.501153, 0, 0, 0, 1, 1,
-0.9280684, 0.4310752, -1.224313, 0, 0, 0, 1, 1,
-0.9232459, -0.6468725, -2.366835, 0, 0, 0, 1, 1,
-0.9171368, -0.1146659, -0.7548052, 0, 0, 0, 1, 1,
-0.9152107, 0.5634196, -2.522231, 0, 0, 0, 1, 1,
-0.9080083, 0.4656352, -0.1071876, 1, 1, 1, 1, 1,
-0.8993365, 1.933319, 0.6925302, 1, 1, 1, 1, 1,
-0.8974093, -0.177136, -2.264956, 1, 1, 1, 1, 1,
-0.8951979, -0.08895414, -1.022399, 1, 1, 1, 1, 1,
-0.8897285, 0.1463086, -1.766313, 1, 1, 1, 1, 1,
-0.888739, 0.2542417, -0.8277729, 1, 1, 1, 1, 1,
-0.8860486, 0.4755054, -1.568566, 1, 1, 1, 1, 1,
-0.8836548, 1.067177, -0.9101192, 1, 1, 1, 1, 1,
-0.8828467, 0.4394026, -0.5151017, 1, 1, 1, 1, 1,
-0.8815874, 0.3878143, -1.440507, 1, 1, 1, 1, 1,
-0.8813885, -1.215633, -1.62749, 1, 1, 1, 1, 1,
-0.8808511, -0.1947388, -1.70654, 1, 1, 1, 1, 1,
-0.8753539, 1.319058, -2.692085, 1, 1, 1, 1, 1,
-0.8702143, -0.0271171, -2.525914, 1, 1, 1, 1, 1,
-0.869243, -0.5180312, -2.404847, 1, 1, 1, 1, 1,
-0.8632976, -0.3750786, -2.855276, 0, 0, 1, 1, 1,
-0.854489, 0.6535877, -0.6539485, 1, 0, 0, 1, 1,
-0.8535823, 1.320071, -1.819512, 1, 0, 0, 1, 1,
-0.8484472, -0.5816344, -2.915223, 1, 0, 0, 1, 1,
-0.8475579, -0.3127125, -2.9155, 1, 0, 0, 1, 1,
-0.8455952, -0.6727403, -0.4412345, 1, 0, 0, 1, 1,
-0.844671, -0.1465827, -1.563299, 0, 0, 0, 1, 1,
-0.8436735, -0.1997205, -2.217001, 0, 0, 0, 1, 1,
-0.8342857, -0.7673866, -2.791621, 0, 0, 0, 1, 1,
-0.8283541, -1.228792, -3.103804, 0, 0, 0, 1, 1,
-0.8212634, 0.1121687, -1.133473, 0, 0, 0, 1, 1,
-0.8182462, -0.5012845, -1.317311, 0, 0, 0, 1, 1,
-0.8079137, -0.5751721, -2.050641, 0, 0, 0, 1, 1,
-0.8071019, -0.3740339, -0.8808957, 1, 1, 1, 1, 1,
-0.8068912, 0.0007483485, -1.723202, 1, 1, 1, 1, 1,
-0.8052979, 0.9105726, -1.223662, 1, 1, 1, 1, 1,
-0.8028436, 0.07518794, -0.07240312, 1, 1, 1, 1, 1,
-0.8001834, 0.8864436, -1.003804, 1, 1, 1, 1, 1,
-0.8001499, 0.6506122, -0.7282692, 1, 1, 1, 1, 1,
-0.7997316, 0.3354111, 0.4781156, 1, 1, 1, 1, 1,
-0.798683, -1.960574, -4.716029, 1, 1, 1, 1, 1,
-0.7930852, -1.211589, -3.785457, 1, 1, 1, 1, 1,
-0.7911713, 0.794759, -0.488234, 1, 1, 1, 1, 1,
-0.7876947, -1.649599, -3.410862, 1, 1, 1, 1, 1,
-0.7789398, 1.319744, -0.840608, 1, 1, 1, 1, 1,
-0.7734827, 1.321578, 0.6180702, 1, 1, 1, 1, 1,
-0.7734428, 1.276834, 0.3892635, 1, 1, 1, 1, 1,
-0.7725914, 0.3584206, -0.02019748, 1, 1, 1, 1, 1,
-0.7713814, -0.01733149, -1.576842, 0, 0, 1, 1, 1,
-0.7711329, 0.06372184, -0.3140164, 1, 0, 0, 1, 1,
-0.7702411, 1.084388, -0.1816466, 1, 0, 0, 1, 1,
-0.7663702, 0.03481264, -2.2065, 1, 0, 0, 1, 1,
-0.7643871, 2.322107, 0.7908863, 1, 0, 0, 1, 1,
-0.7588825, -0.04446868, -0.8896056, 1, 0, 0, 1, 1,
-0.7586999, -0.710886, -1.913233, 0, 0, 0, 1, 1,
-0.7575669, 0.8265359, -1.05993, 0, 0, 0, 1, 1,
-0.757029, 0.5513331, -0.1541002, 0, 0, 0, 1, 1,
-0.751416, 0.7683377, -1.128386, 0, 0, 0, 1, 1,
-0.7508135, 0.4419059, -1.759021, 0, 0, 0, 1, 1,
-0.7348928, -1.933353, -2.594267, 0, 0, 0, 1, 1,
-0.7316005, -0.7168046, -2.981348, 0, 0, 0, 1, 1,
-0.728521, 0.03505673, -1.190991, 1, 1, 1, 1, 1,
-0.7251293, 0.1189466, -2.796341, 1, 1, 1, 1, 1,
-0.7178816, -0.5730785, -2.897293, 1, 1, 1, 1, 1,
-0.7136497, -0.5921957, -2.289425, 1, 1, 1, 1, 1,
-0.7048019, 0.4726707, -0.673539, 1, 1, 1, 1, 1,
-0.7024117, 2.564609, -0.1914361, 1, 1, 1, 1, 1,
-0.6951719, 0.1981596, -1.39363, 1, 1, 1, 1, 1,
-0.6902108, 2.779931, 0.4147698, 1, 1, 1, 1, 1,
-0.6891288, 1.194107, -1.226288, 1, 1, 1, 1, 1,
-0.6835528, -0.1680495, -1.665616, 1, 1, 1, 1, 1,
-0.6812447, 1.206479, 0.2269517, 1, 1, 1, 1, 1,
-0.6804409, -0.6531512, -3.219075, 1, 1, 1, 1, 1,
-0.6785197, -1.006057, -2.66386, 1, 1, 1, 1, 1,
-0.675243, 0.488169, 0.09009408, 1, 1, 1, 1, 1,
-0.6736174, 0.2624703, -0.02470359, 1, 1, 1, 1, 1,
-0.6679092, -2.401257, -1.950706, 0, 0, 1, 1, 1,
-0.6617141, -0.5819283, -1.890278, 1, 0, 0, 1, 1,
-0.6587189, -1.232828, -4.094155, 1, 0, 0, 1, 1,
-0.6563569, 0.9959338, 1.27753, 1, 0, 0, 1, 1,
-0.6557649, -0.5077369, -2.071061, 1, 0, 0, 1, 1,
-0.6531667, -1.434028, -1.772739, 1, 0, 0, 1, 1,
-0.6504657, 0.4733988, -1.983989, 0, 0, 0, 1, 1,
-0.6480381, -0.545922, -2.240002, 0, 0, 0, 1, 1,
-0.6368758, -1.209151, -3.222134, 0, 0, 0, 1, 1,
-0.6359465, 0.2884032, -1.096238, 0, 0, 0, 1, 1,
-0.6338832, 0.5470388, -0.8566696, 0, 0, 0, 1, 1,
-0.6336451, -1.376795, -1.655097, 0, 0, 0, 1, 1,
-0.6290073, -1.309319, -1.330661, 0, 0, 0, 1, 1,
-0.6285612, 1.238746, -0.675231, 1, 1, 1, 1, 1,
-0.6283151, 0.06377507, -1.787251, 1, 1, 1, 1, 1,
-0.6260104, 0.634613, -1.138648, 1, 1, 1, 1, 1,
-0.6181318, 0.6163694, -0.6398823, 1, 1, 1, 1, 1,
-0.6175333, -0.451268, -1.626951, 1, 1, 1, 1, 1,
-0.6133577, 0.5635998, -0.9262541, 1, 1, 1, 1, 1,
-0.6039174, 0.272191, -0.1384363, 1, 1, 1, 1, 1,
-0.601041, -1.086846, -2.19215, 1, 1, 1, 1, 1,
-0.6005744, 0.3108433, 0.428344, 1, 1, 1, 1, 1,
-0.5946222, -1.434845, -0.5880065, 1, 1, 1, 1, 1,
-0.5882, 0.2340659, -0.2361822, 1, 1, 1, 1, 1,
-0.586421, 1.020882, 0.7984264, 1, 1, 1, 1, 1,
-0.586208, -0.3556821, -1.677162, 1, 1, 1, 1, 1,
-0.586166, -1.081318, -2.902355, 1, 1, 1, 1, 1,
-0.5859514, 0.5996126, -0.2859714, 1, 1, 1, 1, 1,
-0.5859088, 1.74599, 1.561132, 0, 0, 1, 1, 1,
-0.575001, 2.768001, -0.5869877, 1, 0, 0, 1, 1,
-0.573834, -0.8565856, -2.261366, 1, 0, 0, 1, 1,
-0.5687451, -0.02907928, 0.27406, 1, 0, 0, 1, 1,
-0.5662106, -0.4676274, -0.2942697, 1, 0, 0, 1, 1,
-0.5633416, -1.224952, -1.940958, 1, 0, 0, 1, 1,
-0.5629821, -0.2604012, -2.345556, 0, 0, 0, 1, 1,
-0.5617502, 0.6541361, -0.4597121, 0, 0, 0, 1, 1,
-0.5598353, -0.486457, -3.445153, 0, 0, 0, 1, 1,
-0.559132, 1.591857, -0.1350889, 0, 0, 0, 1, 1,
-0.5587475, 0.4236354, -0.8777367, 0, 0, 0, 1, 1,
-0.554832, 1.282579, -0.9552852, 0, 0, 0, 1, 1,
-0.5511131, 0.4804017, 0.5413097, 0, 0, 0, 1, 1,
-0.5494362, -0.5948906, -3.451901, 1, 1, 1, 1, 1,
-0.5481826, 0.2075495, -1.782972, 1, 1, 1, 1, 1,
-0.5453119, -0.395916, -1.887147, 1, 1, 1, 1, 1,
-0.5447476, 0.4946769, -0.8864661, 1, 1, 1, 1, 1,
-0.5386157, -1.043231, -2.016771, 1, 1, 1, 1, 1,
-0.5379263, -1.118541, -3.86008, 1, 1, 1, 1, 1,
-0.5376794, -0.1633441, -1.694667, 1, 1, 1, 1, 1,
-0.5323735, 0.00845024, -0.7531407, 1, 1, 1, 1, 1,
-0.5272767, -0.5710061, -2.674569, 1, 1, 1, 1, 1,
-0.5232444, 0.4265024, -0.1433494, 1, 1, 1, 1, 1,
-0.5220614, -0.1827808, -1.632131, 1, 1, 1, 1, 1,
-0.5203463, 1.290621, -1.151815, 1, 1, 1, 1, 1,
-0.519802, -0.05572827, -2.113216, 1, 1, 1, 1, 1,
-0.5196734, -0.7488071, -1.624987, 1, 1, 1, 1, 1,
-0.5194591, 1.451317, -2.662874, 1, 1, 1, 1, 1,
-0.5141835, 1.24031, -0.4417323, 0, 0, 1, 1, 1,
-0.5138319, 2.053865, -1.050906, 1, 0, 0, 1, 1,
-0.5112138, 0.5355401, -1.100907, 1, 0, 0, 1, 1,
-0.5104602, -1.074348, -2.113416, 1, 0, 0, 1, 1,
-0.5085427, -0.682624, -2.157716, 1, 0, 0, 1, 1,
-0.5072813, -0.5135766, -0.3271211, 1, 0, 0, 1, 1,
-0.506745, 1.862808, 0.9885614, 0, 0, 0, 1, 1,
-0.5045902, 0.6626067, -0.3689361, 0, 0, 0, 1, 1,
-0.5013565, 0.4741791, -0.3149366, 0, 0, 0, 1, 1,
-0.5009493, -0.5496033, -4.396181, 0, 0, 0, 1, 1,
-0.498539, -0.8836404, -2.428484, 0, 0, 0, 1, 1,
-0.4883793, 1.296835, -0.8590075, 0, 0, 0, 1, 1,
-0.4871169, 0.1967739, -2.3218, 0, 0, 0, 1, 1,
-0.4860218, -0.5820599, -2.90345, 1, 1, 1, 1, 1,
-0.4858428, -0.7976706, -2.234973, 1, 1, 1, 1, 1,
-0.4838396, 0.4615178, -0.8630035, 1, 1, 1, 1, 1,
-0.4764074, -1.893668, -2.577621, 1, 1, 1, 1, 1,
-0.4713481, -0.6672273, -2.371595, 1, 1, 1, 1, 1,
-0.4678889, 0.414177, -0.9688752, 1, 1, 1, 1, 1,
-0.466683, -2.203191, -4.080526, 1, 1, 1, 1, 1,
-0.4657693, 0.2216961, -1.581016, 1, 1, 1, 1, 1,
-0.4614705, 0.5250865, -0.07495034, 1, 1, 1, 1, 1,
-0.4612417, -0.44987, -3.604618, 1, 1, 1, 1, 1,
-0.4612342, -0.1897432, -4.134943, 1, 1, 1, 1, 1,
-0.4607345, -0.6516016, -2.731211, 1, 1, 1, 1, 1,
-0.4581828, -1.251844, -2.331861, 1, 1, 1, 1, 1,
-0.4581208, 0.08363137, -3.156322, 1, 1, 1, 1, 1,
-0.4561859, -0.03132713, -0.9931071, 1, 1, 1, 1, 1,
-0.4546143, 0.5642351, -0.6266851, 0, 0, 1, 1, 1,
-0.4457344, 2.342699, -1.353788, 1, 0, 0, 1, 1,
-0.4448901, -0.9871474, -1.615234, 1, 0, 0, 1, 1,
-0.4442004, 0.8691539, 0.3340303, 1, 0, 0, 1, 1,
-0.4405916, 0.2806394, -1.305692, 1, 0, 0, 1, 1,
-0.4343157, 0.1308662, -0.5215662, 1, 0, 0, 1, 1,
-0.4342119, -1.542725, -4.97382, 0, 0, 0, 1, 1,
-0.4319832, 1.063575, -3.037821, 0, 0, 0, 1, 1,
-0.4290661, 1.479066, -0.3637445, 0, 0, 0, 1, 1,
-0.4260361, -1.100556, -2.874245, 0, 0, 0, 1, 1,
-0.4251559, -0.1826766, -1.428244, 0, 0, 0, 1, 1,
-0.4177885, -0.1424921, -1.406301, 0, 0, 0, 1, 1,
-0.4160427, 0.5941616, -1.122964, 0, 0, 0, 1, 1,
-0.4133061, 0.6797518, 0.2572981, 1, 1, 1, 1, 1,
-0.4100999, -0.2089719, -3.443994, 1, 1, 1, 1, 1,
-0.4075016, 0.3433719, -2.231367, 1, 1, 1, 1, 1,
-0.40531, 2.129565, -1.056976, 1, 1, 1, 1, 1,
-0.4045334, -1.164303, -2.521291, 1, 1, 1, 1, 1,
-0.3970705, -0.5877764, -1.806916, 1, 1, 1, 1, 1,
-0.3941204, 0.7381393, -1.6648, 1, 1, 1, 1, 1,
-0.3920226, -0.9000072, -4.145465, 1, 1, 1, 1, 1,
-0.3887023, -0.5122445, -0.9780073, 1, 1, 1, 1, 1,
-0.3828027, -0.59324, -2.27137, 1, 1, 1, 1, 1,
-0.3813001, 1.152056, 0.7030099, 1, 1, 1, 1, 1,
-0.3794786, -0.4734558, -4.862121, 1, 1, 1, 1, 1,
-0.3789501, -0.0799283, -0.5825125, 1, 1, 1, 1, 1,
-0.3743839, -1.010276, -2.538577, 1, 1, 1, 1, 1,
-0.3730969, -1.456836, -3.729266, 1, 1, 1, 1, 1,
-0.3685913, -0.8030914, -2.883046, 0, 0, 1, 1, 1,
-0.3680481, 1.01525, 1.271427, 1, 0, 0, 1, 1,
-0.3657359, 1.327037, -0.004938075, 1, 0, 0, 1, 1,
-0.3612135, -0.4122021, -3.793169, 1, 0, 0, 1, 1,
-0.3609001, 0.3586591, -0.7481217, 1, 0, 0, 1, 1,
-0.3594799, 0.1925569, 0.08507568, 1, 0, 0, 1, 1,
-0.3592212, 0.7700756, -1.520719, 0, 0, 0, 1, 1,
-0.3534331, 0.3099001, -1.17863, 0, 0, 0, 1, 1,
-0.3476407, -0.9653928, -3.337991, 0, 0, 0, 1, 1,
-0.3453927, 0.2099874, -1.574533, 0, 0, 0, 1, 1,
-0.3448282, 0.376259, -0.7895415, 0, 0, 0, 1, 1,
-0.3423237, -0.2386681, -1.797529, 0, 0, 0, 1, 1,
-0.3408709, -1.346379, -3.23122, 0, 0, 0, 1, 1,
-0.3394988, 1.028919, 0.6873986, 1, 1, 1, 1, 1,
-0.3380053, 0.1917357, -1.023957, 1, 1, 1, 1, 1,
-0.3365516, -1.59141, -2.974782, 1, 1, 1, 1, 1,
-0.3357501, 0.9496292, -1.427611, 1, 1, 1, 1, 1,
-0.3281679, 1.393578, 0.3928107, 1, 1, 1, 1, 1,
-0.3169585, 1.520145, -1.541001, 1, 1, 1, 1, 1,
-0.310722, -0.6024219, -2.283039, 1, 1, 1, 1, 1,
-0.3029422, 0.7431996, -0.7253934, 1, 1, 1, 1, 1,
-0.302479, 0.4272348, -0.2159361, 1, 1, 1, 1, 1,
-0.3006811, -1.464044, -4.17183, 1, 1, 1, 1, 1,
-0.2988949, -0.6375778, -3.952618, 1, 1, 1, 1, 1,
-0.2985889, -0.5190707, -3.287934, 1, 1, 1, 1, 1,
-0.2959132, 0.8611371, -0.9440636, 1, 1, 1, 1, 1,
-0.2920092, -1.472583, -2.886058, 1, 1, 1, 1, 1,
-0.2903343, 1.168583, 1.036188, 1, 1, 1, 1, 1,
-0.2888244, -0.0302299, -1.275301, 0, 0, 1, 1, 1,
-0.2887335, -1.513821, -3.027625, 1, 0, 0, 1, 1,
-0.2854387, -2.16, -2.583363, 1, 0, 0, 1, 1,
-0.284535, -1.14428, -3.506736, 1, 0, 0, 1, 1,
-0.2781925, -0.7243255, -4.133734, 1, 0, 0, 1, 1,
-0.2780948, -0.8991895, -4.020729, 1, 0, 0, 1, 1,
-0.2725876, -0.006191366, -1.306847, 0, 0, 0, 1, 1,
-0.2572885, 0.02836038, -0.7775691, 0, 0, 0, 1, 1,
-0.2567733, -0.1398825, -2.46062, 0, 0, 0, 1, 1,
-0.2561258, 0.3234907, -2.005519, 0, 0, 0, 1, 1,
-0.2508107, 0.1218959, -1.256019, 0, 0, 0, 1, 1,
-0.2479401, 0.4623169, -0.6198037, 0, 0, 0, 1, 1,
-0.2439826, 0.3422917, -1.269292, 0, 0, 0, 1, 1,
-0.2383472, -0.2082265, -5.813953, 1, 1, 1, 1, 1,
-0.2342518, -0.3542914, -2.324218, 1, 1, 1, 1, 1,
-0.2317764, 0.226588, -0.8176119, 1, 1, 1, 1, 1,
-0.2316546, -1.480155, -1.784122, 1, 1, 1, 1, 1,
-0.2295856, -2.516947, -3.533422, 1, 1, 1, 1, 1,
-0.2242905, 0.9642042, -0.7134344, 1, 1, 1, 1, 1,
-0.2225706, -0.9526273, -4.316341, 1, 1, 1, 1, 1,
-0.2215935, 0.5982131, -0.5455659, 1, 1, 1, 1, 1,
-0.2182392, 1.556488, -0.1595818, 1, 1, 1, 1, 1,
-0.2127492, -0.3306045, -3.22376, 1, 1, 1, 1, 1,
-0.2120282, 0.6143519, -0.5751501, 1, 1, 1, 1, 1,
-0.211031, 1.333198, -1.605126, 1, 1, 1, 1, 1,
-0.2046023, 1.124413, -1.726392, 1, 1, 1, 1, 1,
-0.2020451, -0.09147342, -0.3296774, 1, 1, 1, 1, 1,
-0.2001891, -2.21526, -2.800679, 1, 1, 1, 1, 1,
-0.1993403, 0.8646659, -1.182502, 0, 0, 1, 1, 1,
-0.1926165, 0.6361356, 1.692361, 1, 0, 0, 1, 1,
-0.1914871, 1.325972, -1.142543, 1, 0, 0, 1, 1,
-0.1865225, 0.7067527, -0.1150398, 1, 0, 0, 1, 1,
-0.1851555, -0.3854775, -5.086768, 1, 0, 0, 1, 1,
-0.1848289, 0.1818821, -1.001546, 1, 0, 0, 1, 1,
-0.1830067, 0.3637598, -1.125802, 0, 0, 0, 1, 1,
-0.1802679, 1.611907, -1.11622, 0, 0, 0, 1, 1,
-0.1784176, -2.35524, -3.531704, 0, 0, 0, 1, 1,
-0.1722507, 0.6954412, -1.1492, 0, 0, 0, 1, 1,
-0.1704717, 0.2075629, -0.7957498, 0, 0, 0, 1, 1,
-0.1700358, -0.7205422, -2.772759, 0, 0, 0, 1, 1,
-0.167685, 0.1101524, -2.000326, 0, 0, 0, 1, 1,
-0.1596481, -0.312042, -1.895111, 1, 1, 1, 1, 1,
-0.1590324, 0.1029095, -1.779509, 1, 1, 1, 1, 1,
-0.1588059, 0.9454171, -0.02200076, 1, 1, 1, 1, 1,
-0.1578644, 0.3690335, -0.7299641, 1, 1, 1, 1, 1,
-0.1536633, -0.3213484, -2.142263, 1, 1, 1, 1, 1,
-0.1520567, -1.070506, -2.332592, 1, 1, 1, 1, 1,
-0.1468761, -0.3344596, -2.744818, 1, 1, 1, 1, 1,
-0.1443028, -1.436331, -3.621956, 1, 1, 1, 1, 1,
-0.1277004, 1.732605, 0.607976, 1, 1, 1, 1, 1,
-0.1258327, -0.8683061, -4.603961, 1, 1, 1, 1, 1,
-0.1229304, 1.382014, -0.2922959, 1, 1, 1, 1, 1,
-0.1181311, -0.5719986, -2.071366, 1, 1, 1, 1, 1,
-0.1144489, -0.08804858, -1.690279, 1, 1, 1, 1, 1,
-0.1141186, -1.149855, -2.577089, 1, 1, 1, 1, 1,
-0.1123223, 1.72952, 0.1429747, 1, 1, 1, 1, 1,
-0.1092755, -0.7650756, -2.916969, 0, 0, 1, 1, 1,
-0.105784, -1.692605, -3.531729, 1, 0, 0, 1, 1,
-0.102136, -0.8243719, -3.658663, 1, 0, 0, 1, 1,
-0.09682228, 0.1645812, -0.7039971, 1, 0, 0, 1, 1,
-0.09428128, 2.37208, -1.276844, 1, 0, 0, 1, 1,
-0.09377714, 1.677805, -1.244445, 1, 0, 0, 1, 1,
-0.09357292, 1.621511, -0.06212972, 0, 0, 0, 1, 1,
-0.09314046, -0.7798012, -2.107595, 0, 0, 0, 1, 1,
-0.09242059, 0.4064501, -1.664227, 0, 0, 0, 1, 1,
-0.09049293, 1.524513, -0.2693922, 0, 0, 0, 1, 1,
-0.08672737, -0.2600339, -2.303378, 0, 0, 0, 1, 1,
-0.08551471, -0.7375509, -1.355096, 0, 0, 0, 1, 1,
-0.08350892, 1.241495, 0.9748807, 0, 0, 0, 1, 1,
-0.0826116, -1.125349, -2.435851, 1, 1, 1, 1, 1,
-0.08111354, -0.9799607, -2.994179, 1, 1, 1, 1, 1,
-0.07948774, 0.5917957, 0.4318181, 1, 1, 1, 1, 1,
-0.07616148, 0.04437728, -1.33721, 1, 1, 1, 1, 1,
-0.07475315, -1.68748, -2.894269, 1, 1, 1, 1, 1,
-0.07306384, -0.5174124, -4.011755, 1, 1, 1, 1, 1,
-0.07082529, 0.3386214, 0.8891638, 1, 1, 1, 1, 1,
-0.06809356, -0.8924116, -1.443549, 1, 1, 1, 1, 1,
-0.06684823, 0.8382744, 1.054457, 1, 1, 1, 1, 1,
-0.06494974, 0.2761531, 0.3806757, 1, 1, 1, 1, 1,
-0.06434803, 1.240666, -0.811878, 1, 1, 1, 1, 1,
-0.06257393, -0.4480971, -0.6399384, 1, 1, 1, 1, 1,
-0.05878649, -0.5607202, -1.039852, 1, 1, 1, 1, 1,
-0.05622143, -0.104056, -2.918565, 1, 1, 1, 1, 1,
-0.05250273, -0.1244014, -4.544654, 1, 1, 1, 1, 1,
-0.0514233, 0.3428306, -0.6116596, 0, 0, 1, 1, 1,
-0.05124675, -0.7914086, -2.47722, 1, 0, 0, 1, 1,
-0.04884483, -1.301911, -3.228628, 1, 0, 0, 1, 1,
-0.04861524, 0.2419196, 0.503052, 1, 0, 0, 1, 1,
-0.04716304, 0.2140467, -1.387258, 1, 0, 0, 1, 1,
-0.04085058, 0.3452736, 0.4914962, 1, 0, 0, 1, 1,
-0.04073669, -1.157447, -1.934315, 0, 0, 0, 1, 1,
-0.04062965, -1.492509, -3.495085, 0, 0, 0, 1, 1,
-0.03897113, -0.3825849, -3.36043, 0, 0, 0, 1, 1,
-0.0371842, -1.56963, -4.517769, 0, 0, 0, 1, 1,
-0.03610198, 0.6330213, 0.1174698, 0, 0, 0, 1, 1,
-0.03529296, 0.6230211, 0.7708151, 0, 0, 0, 1, 1,
-0.03130289, 0.7225853, 1.138907, 0, 0, 0, 1, 1,
-0.03089982, 0.6080829, -1.582228, 1, 1, 1, 1, 1,
-0.02888188, 1.307722, -0.09108885, 1, 1, 1, 1, 1,
-0.02253265, -0.6805725, -3.909233, 1, 1, 1, 1, 1,
-0.02225568, -0.9389549, -3.008576, 1, 1, 1, 1, 1,
-0.0208238, 0.8387215, 1.458086, 1, 1, 1, 1, 1,
-0.01960669, -0.5469229, -3.585769, 1, 1, 1, 1, 1,
-0.01846547, -2.253353, -1.229699, 1, 1, 1, 1, 1,
-0.01554323, 0.6322759, 0.02244503, 1, 1, 1, 1, 1,
-0.01118258, -1.402942, -2.89243, 1, 1, 1, 1, 1,
-0.01070573, 2.143711, -2.110701, 1, 1, 1, 1, 1,
-0.007755249, 2.138579, -0.9417118, 1, 1, 1, 1, 1,
-0.005309839, 0.3057715, 1.776613, 1, 1, 1, 1, 1,
-0.005212489, -0.3173896, -1.557252, 1, 1, 1, 1, 1,
-0.001364024, -0.09046743, -1.99139, 1, 1, 1, 1, 1,
-0.0005219753, -1.596191, -5.008375, 1, 1, 1, 1, 1,
0.002114483, -1.543288, 2.912822, 0, 0, 1, 1, 1,
0.01898449, -0.3609678, 2.207654, 1, 0, 0, 1, 1,
0.02313744, -0.3595118, 2.763017, 1, 0, 0, 1, 1,
0.02332354, -1.660458, 2.017081, 1, 0, 0, 1, 1,
0.02332889, -0.2731782, 3.225372, 1, 0, 0, 1, 1,
0.02670831, 0.1888899, 1.319143, 1, 0, 0, 1, 1,
0.02747348, 1.287639, 1.463441, 0, 0, 0, 1, 1,
0.02796678, -0.6160357, 3.736648, 0, 0, 0, 1, 1,
0.02800218, -0.4865834, 3.395867, 0, 0, 0, 1, 1,
0.0298266, -0.1360501, 3.141883, 0, 0, 0, 1, 1,
0.03683366, -0.3246975, 3.450718, 0, 0, 0, 1, 1,
0.04045353, 0.5100204, -0.6407378, 0, 0, 0, 1, 1,
0.04930605, -1.512782, 3.933184, 0, 0, 0, 1, 1,
0.05048052, -0.6581627, 3.823246, 1, 1, 1, 1, 1,
0.05252754, -0.8655015, 3.115157, 1, 1, 1, 1, 1,
0.05323369, 0.4442787, -0.5859777, 1, 1, 1, 1, 1,
0.05617494, 0.1228964, 1.65262, 1, 1, 1, 1, 1,
0.05668274, 1.203748, 0.2416342, 1, 1, 1, 1, 1,
0.05745811, -1.719413, 1.745092, 1, 1, 1, 1, 1,
0.05810168, 0.7948465, 0.4278016, 1, 1, 1, 1, 1,
0.06205916, -0.3217824, 3.668958, 1, 1, 1, 1, 1,
0.06252976, -0.8438596, 3.754209, 1, 1, 1, 1, 1,
0.06313732, -2.140012, 2.364036, 1, 1, 1, 1, 1,
0.06327819, -0.03095068, 1.854153, 1, 1, 1, 1, 1,
0.06652925, -0.381169, 3.196618, 1, 1, 1, 1, 1,
0.06814054, -0.08052964, 0.4841061, 1, 1, 1, 1, 1,
0.06970683, 0.08128265, 2.872925, 1, 1, 1, 1, 1,
0.07026944, 1.436525, -1.710861, 1, 1, 1, 1, 1,
0.07153475, 0.6274751, -1.298777, 0, 0, 1, 1, 1,
0.07451148, 1.506078, -0.1598184, 1, 0, 0, 1, 1,
0.07600027, -1.446514, 2.813546, 1, 0, 0, 1, 1,
0.07662861, -0.6510993, 2.523488, 1, 0, 0, 1, 1,
0.0816525, 1.336788, -0.3126958, 1, 0, 0, 1, 1,
0.0823977, -0.2268277, 3.355016, 1, 0, 0, 1, 1,
0.08267996, -0.6065513, 3.837543, 0, 0, 0, 1, 1,
0.08632886, 0.5522381, 0.6530424, 0, 0, 0, 1, 1,
0.08720169, 1.522813, -0.5739157, 0, 0, 0, 1, 1,
0.09093282, 0.6875566, -0.9752174, 0, 0, 0, 1, 1,
0.09334259, -1.192379, 4.515062, 0, 0, 0, 1, 1,
0.09351377, -1.771579, 4.058905, 0, 0, 0, 1, 1,
0.0938848, 1.301971, 0.2543294, 0, 0, 0, 1, 1,
0.09617862, 0.09208354, 0.8436767, 1, 1, 1, 1, 1,
0.09997982, 0.2437516, -2.031669, 1, 1, 1, 1, 1,
0.100714, -0.04027934, 2.298993, 1, 1, 1, 1, 1,
0.1020409, 1.847849, 1.706372, 1, 1, 1, 1, 1,
0.107867, -0.5349494, 1.880211, 1, 1, 1, 1, 1,
0.1101085, 1.03775, -2.646352, 1, 1, 1, 1, 1,
0.119336, 0.7978082, 1.228316, 1, 1, 1, 1, 1,
0.1216125, -0.3840158, 3.158457, 1, 1, 1, 1, 1,
0.1233808, 1.344937, 1.38378, 1, 1, 1, 1, 1,
0.1242931, -2.373314, 4.077533, 1, 1, 1, 1, 1,
0.1300662, 1.830369, 0.01651757, 1, 1, 1, 1, 1,
0.132761, 0.2482108, 1.463428, 1, 1, 1, 1, 1,
0.134097, -0.9354178, 3.028919, 1, 1, 1, 1, 1,
0.1344963, -0.8269416, 2.036963, 1, 1, 1, 1, 1,
0.134898, -0.02414122, 1.185374, 1, 1, 1, 1, 1,
0.1353137, 0.1195526, 0.6526396, 0, 0, 1, 1, 1,
0.1353815, -0.7303724, 2.767115, 1, 0, 0, 1, 1,
0.1378324, -1.112151, 2.799099, 1, 0, 0, 1, 1,
0.1400891, -0.4975758, 2.493316, 1, 0, 0, 1, 1,
0.1408882, -0.1430361, 2.866958, 1, 0, 0, 1, 1,
0.1411789, -0.9309986, 4.316189, 1, 0, 0, 1, 1,
0.1433731, -0.4742826, 2.74608, 0, 0, 0, 1, 1,
0.1447145, -0.8712691, 3.245211, 0, 0, 0, 1, 1,
0.1455528, -0.422848, 3.546681, 0, 0, 0, 1, 1,
0.1502539, -1.485194, 1.945718, 0, 0, 0, 1, 1,
0.150693, -0.8342054, 1.260295, 0, 0, 0, 1, 1,
0.1510021, -0.3813358, 4.482244, 0, 0, 0, 1, 1,
0.1581911, 1.210433, 2.274752, 0, 0, 0, 1, 1,
0.1607987, 0.9278929, -0.07042242, 1, 1, 1, 1, 1,
0.1621061, 1.327153, 0.8778676, 1, 1, 1, 1, 1,
0.1644828, 0.4819406, 1.001705, 1, 1, 1, 1, 1,
0.1655944, -1.253008, 3.582962, 1, 1, 1, 1, 1,
0.1680401, 1.98015, 1.202055, 1, 1, 1, 1, 1,
0.1697842, 0.7300726, 1.797108, 1, 1, 1, 1, 1,
0.1734221, 1.383786, -1.342973, 1, 1, 1, 1, 1,
0.1749242, 0.1596961, 1.812665, 1, 1, 1, 1, 1,
0.1782698, 0.1615291, 0.3223157, 1, 1, 1, 1, 1,
0.1823429, 0.04730536, 1.716197, 1, 1, 1, 1, 1,
0.1827026, -1.48344, 1.935727, 1, 1, 1, 1, 1,
0.1847368, 1.006117, 0.2811174, 1, 1, 1, 1, 1,
0.1848865, -1.05543, 2.596462, 1, 1, 1, 1, 1,
0.1942079, 1.016069, 1.207596, 1, 1, 1, 1, 1,
0.1955315, 0.02706455, 1.741879, 1, 1, 1, 1, 1,
0.1956237, -0.6133193, 2.429774, 0, 0, 1, 1, 1,
0.1971398, 0.3428711, 1.663399, 1, 0, 0, 1, 1,
0.1986985, 1.989852, 0.6542659, 1, 0, 0, 1, 1,
0.1987682, -1.245548, 3.323759, 1, 0, 0, 1, 1,
0.2089267, -0.6874921, 3.45996, 1, 0, 0, 1, 1,
0.2166057, 0.7862527, 0.7450214, 1, 0, 0, 1, 1,
0.2168607, 1.465511, -0.4264704, 0, 0, 0, 1, 1,
0.2173363, 0.1043518, 0.7840115, 0, 0, 0, 1, 1,
0.2184253, -0.3844313, 1.567991, 0, 0, 0, 1, 1,
0.2186421, 0.3445161, -0.1128874, 0, 0, 0, 1, 1,
0.2214575, 1.366158, 0.2800832, 0, 0, 0, 1, 1,
0.2344474, -0.7483683, 2.77915, 0, 0, 0, 1, 1,
0.2348842, -0.7405204, 3.718648, 0, 0, 0, 1, 1,
0.2360237, -0.3924216, 2.547127, 1, 1, 1, 1, 1,
0.2460378, -1.132627, 3.720243, 1, 1, 1, 1, 1,
0.2480171, 1.252392, -1.083708, 1, 1, 1, 1, 1,
0.2554359, 1.041805, 0.6931907, 1, 1, 1, 1, 1,
0.2602338, -2.936567, 2.717192, 1, 1, 1, 1, 1,
0.2605189, 0.3878841, -1.833813, 1, 1, 1, 1, 1,
0.2611154, -0.01164296, -0.2095466, 1, 1, 1, 1, 1,
0.2672094, -1.022633, 1.826423, 1, 1, 1, 1, 1,
0.2688288, 0.5033938, -0.4677457, 1, 1, 1, 1, 1,
0.269715, -1.10923, 3.645235, 1, 1, 1, 1, 1,
0.2736322, 1.07975, -1.856567, 1, 1, 1, 1, 1,
0.2776383, 1.427687, 0.8316816, 1, 1, 1, 1, 1,
0.2790514, -0.7600629, 2.517336, 1, 1, 1, 1, 1,
0.2794044, -1.390002, 3.042772, 1, 1, 1, 1, 1,
0.2809259, 1.247975, -1.225929, 1, 1, 1, 1, 1,
0.282022, 0.1786496, 0.2285228, 0, 0, 1, 1, 1,
0.2827373, 0.3120236, 1.66068, 1, 0, 0, 1, 1,
0.2846709, 1.074839, 0.5978263, 1, 0, 0, 1, 1,
0.2857141, 0.5594518, -1.78766, 1, 0, 0, 1, 1,
0.2887917, -0.05584396, 3.245926, 1, 0, 0, 1, 1,
0.2906462, -0.3978791, 3.010008, 1, 0, 0, 1, 1,
0.2951207, -0.04234433, 1.112588, 0, 0, 0, 1, 1,
0.2956895, -1.350431, 3.233841, 0, 0, 0, 1, 1,
0.2959405, 1.829641, -1.311819, 0, 0, 0, 1, 1,
0.2998541, 0.5655898, 0.9752352, 0, 0, 0, 1, 1,
0.3022566, 1.552155, 0.4006393, 0, 0, 0, 1, 1,
0.3039794, -1.040581, 0.6092823, 0, 0, 0, 1, 1,
0.3079371, 2.902541, 0.7875904, 0, 0, 0, 1, 1,
0.3098319, -0.1320073, 1.365798, 1, 1, 1, 1, 1,
0.3128351, 0.4609076, -0.1293224, 1, 1, 1, 1, 1,
0.3199572, 0.6585353, 0.4158077, 1, 1, 1, 1, 1,
0.3240935, -0.1225105, 1.445728, 1, 1, 1, 1, 1,
0.3244546, 1.0082, -0.8987817, 1, 1, 1, 1, 1,
0.3270036, 0.2619271, 0.007955768, 1, 1, 1, 1, 1,
0.331412, 0.09597789, 2.024021, 1, 1, 1, 1, 1,
0.3341138, -0.03626214, 2.177505, 1, 1, 1, 1, 1,
0.3356074, -0.9760022, 4.205189, 1, 1, 1, 1, 1,
0.3393668, -1.340248, 3.830721, 1, 1, 1, 1, 1,
0.3420932, 0.122152, 1.983802, 1, 1, 1, 1, 1,
0.3430327, 0.7237315, -1.144289, 1, 1, 1, 1, 1,
0.3445584, -0.9628522, 2.416421, 1, 1, 1, 1, 1,
0.3449914, 0.9269328, -0.1291445, 1, 1, 1, 1, 1,
0.3454318, -0.9298922, 0.5131946, 1, 1, 1, 1, 1,
0.3479934, -1.462743, 2.152034, 0, 0, 1, 1, 1,
0.3499514, 0.3935448, 1.756793, 1, 0, 0, 1, 1,
0.3500912, -1.231507, 4.208652, 1, 0, 0, 1, 1,
0.3579934, -0.1091159, 0.2087133, 1, 0, 0, 1, 1,
0.3592345, 1.448101, 2.256564, 1, 0, 0, 1, 1,
0.3595502, 0.5257691, -0.8037064, 1, 0, 0, 1, 1,
0.3604984, -1.325662, 3.998118, 0, 0, 0, 1, 1,
0.360516, -0.9983171, 3.657273, 0, 0, 0, 1, 1,
0.3624631, 0.7516956, 1.208341, 0, 0, 0, 1, 1,
0.3627211, -1.653628, 3.136805, 0, 0, 0, 1, 1,
0.3658945, -1.228441, 4.590735, 0, 0, 0, 1, 1,
0.3730091, -0.1954101, 1.609503, 0, 0, 0, 1, 1,
0.3743733, -1.267043, 2.61333, 0, 0, 0, 1, 1,
0.37664, -0.9271343, 3.394113, 1, 1, 1, 1, 1,
0.3772508, 2.159743, 0.2786517, 1, 1, 1, 1, 1,
0.3785397, -0.8757765, 3.534855, 1, 1, 1, 1, 1,
0.3889574, -0.6036655, 2.767859, 1, 1, 1, 1, 1,
0.3949499, 2.142159, 0.4443188, 1, 1, 1, 1, 1,
0.400273, -0.5120163, 2.884576, 1, 1, 1, 1, 1,
0.4024453, 0.7717484, 0.5399274, 1, 1, 1, 1, 1,
0.4067365, -0.9000801, 2.378758, 1, 1, 1, 1, 1,
0.4085249, -0.3032816, 2.648658, 1, 1, 1, 1, 1,
0.4112668, 0.5239266, 0.699823, 1, 1, 1, 1, 1,
0.4131213, 1.495427, -1.778898, 1, 1, 1, 1, 1,
0.4203987, -0.4770015, 2.3195, 1, 1, 1, 1, 1,
0.4297934, -1.429591, 0.8263827, 1, 1, 1, 1, 1,
0.4328094, 1.074431, -1.151063, 1, 1, 1, 1, 1,
0.4346423, -0.1884649, 1.126359, 1, 1, 1, 1, 1,
0.4390979, 2.285109, 1.131974, 0, 0, 1, 1, 1,
0.4416907, 0.188919, 0.8126521, 1, 0, 0, 1, 1,
0.4433314, -0.6627886, 2.800323, 1, 0, 0, 1, 1,
0.4436846, -0.05705398, 3.096709, 1, 0, 0, 1, 1,
0.4474713, 0.3646737, 0.4924523, 1, 0, 0, 1, 1,
0.4506422, 0.6532505, 0.3664732, 1, 0, 0, 1, 1,
0.4565956, 0.8626415, 0.7446887, 0, 0, 0, 1, 1,
0.4674654, 1.315735, 0.3323314, 0, 0, 0, 1, 1,
0.4694194, 1.444334, -0.7555685, 0, 0, 0, 1, 1,
0.471102, -0.09508919, 2.687457, 0, 0, 0, 1, 1,
0.4716506, -0.5107602, 3.313863, 0, 0, 0, 1, 1,
0.4754838, -1.123675, 1.076929, 0, 0, 0, 1, 1,
0.4850068, 0.5918611, -0.6454713, 0, 0, 0, 1, 1,
0.4858312, -2.901313, 2.699552, 1, 1, 1, 1, 1,
0.4897564, -0.2346129, 2.132052, 1, 1, 1, 1, 1,
0.4908124, -0.3242098, 1.280328, 1, 1, 1, 1, 1,
0.491815, -1.463993, 4.55338, 1, 1, 1, 1, 1,
0.4918506, -0.8012272, 3.921124, 1, 1, 1, 1, 1,
0.4951547, 1.206919, 1.543052, 1, 1, 1, 1, 1,
0.4986341, -1.283775, 3.841709, 1, 1, 1, 1, 1,
0.4990338, -0.7882481, 3.148785, 1, 1, 1, 1, 1,
0.5072392, 0.7234054, 0.5735906, 1, 1, 1, 1, 1,
0.5077927, 0.9236267, -0.08921447, 1, 1, 1, 1, 1,
0.5081049, 1.607266, -0.795411, 1, 1, 1, 1, 1,
0.5102573, 0.3917003, 1.756802, 1, 1, 1, 1, 1,
0.5126657, 1.422128, -0.367882, 1, 1, 1, 1, 1,
0.5140806, -0.4238561, 2.1262, 1, 1, 1, 1, 1,
0.5183439, -0.40485, 2.038409, 1, 1, 1, 1, 1,
0.5197642, 0.03890888, 1.937914, 0, 0, 1, 1, 1,
0.5243142, 1.652605, 2.350324, 1, 0, 0, 1, 1,
0.5255294, -0.3111969, 1.016092, 1, 0, 0, 1, 1,
0.5292623, 0.7679306, 0.004431272, 1, 0, 0, 1, 1,
0.5318245, -0.175849, 0.4511263, 1, 0, 0, 1, 1,
0.5321041, 1.063826, 0.07857223, 1, 0, 0, 1, 1,
0.5331559, -0.103596, 0.8088619, 0, 0, 0, 1, 1,
0.5333121, 0.245928, 0.6749632, 0, 0, 0, 1, 1,
0.5342779, -0.232189, 2.235958, 0, 0, 0, 1, 1,
0.5378139, -0.4324526, 2.012908, 0, 0, 0, 1, 1,
0.5393799, -0.655407, 3.556326, 0, 0, 0, 1, 1,
0.5395917, -0.999788, 4.070476, 0, 0, 0, 1, 1,
0.5408971, -1.287318, 1.661908, 0, 0, 0, 1, 1,
0.5440053, 0.1136228, 0.7574119, 1, 1, 1, 1, 1,
0.5444366, -0.5757046, 1.255781, 1, 1, 1, 1, 1,
0.5445839, 0.04480683, 1.382569, 1, 1, 1, 1, 1,
0.5454599, 0.5250385, 0.8762209, 1, 1, 1, 1, 1,
0.5550829, 0.7548252, 0.905621, 1, 1, 1, 1, 1,
0.5557868, -2.188828, 3.107105, 1, 1, 1, 1, 1,
0.5624695, 1.148284, 0.7225252, 1, 1, 1, 1, 1,
0.5651798, -0.106918, 1.022825, 1, 1, 1, 1, 1,
0.570928, 0.1195299, 1.181414, 1, 1, 1, 1, 1,
0.5714372, -1.729199, 1.598828, 1, 1, 1, 1, 1,
0.5745278, -0.2054124, 0.001848133, 1, 1, 1, 1, 1,
0.5762378, -0.9237534, 3.515405, 1, 1, 1, 1, 1,
0.5780507, 0.2249124, -0.1735519, 1, 1, 1, 1, 1,
0.5809505, -1.786718, 2.275025, 1, 1, 1, 1, 1,
0.5813909, 0.07862861, -1.431087, 1, 1, 1, 1, 1,
0.5871193, 1.000564, 1.350257, 0, 0, 1, 1, 1,
0.5871913, 0.3456151, 1.055315, 1, 0, 0, 1, 1,
0.5872841, 0.1140486, 1.547029, 1, 0, 0, 1, 1,
0.5902292, 0.7884048, 0.250181, 1, 0, 0, 1, 1,
0.5959849, -1.019312, 3.254844, 1, 0, 0, 1, 1,
0.5979762, 1.2025, 0.5491708, 1, 0, 0, 1, 1,
0.6043424, -1.012015, 4.26666, 0, 0, 0, 1, 1,
0.6057671, -1.245341, 2.055135, 0, 0, 0, 1, 1,
0.6066204, 0.4342321, 0.8557693, 0, 0, 0, 1, 1,
0.6126638, -0.2865453, 0.7965943, 0, 0, 0, 1, 1,
0.6157624, 0.5649524, 0.7077674, 0, 0, 0, 1, 1,
0.6172857, 0.7499821, 0.2156482, 0, 0, 0, 1, 1,
0.6188279, -0.08300271, 2.183535, 0, 0, 0, 1, 1,
0.6189204, -0.4917019, 3.572282, 1, 1, 1, 1, 1,
0.6196911, 0.5251408, -0.5302085, 1, 1, 1, 1, 1,
0.6198431, -0.2400551, 1.24036, 1, 1, 1, 1, 1,
0.6204448, -0.423604, 3.037122, 1, 1, 1, 1, 1,
0.6246006, 1.94629, -0.4258757, 1, 1, 1, 1, 1,
0.6271881, -1.523645, 3.253513, 1, 1, 1, 1, 1,
0.6318268, 1.521848, 0.2715574, 1, 1, 1, 1, 1,
0.6346979, 0.4076251, 0.8941928, 1, 1, 1, 1, 1,
0.6380727, 1.290345, -0.9485306, 1, 1, 1, 1, 1,
0.6381242, -0.7875758, 2.182296, 1, 1, 1, 1, 1,
0.6431921, 0.1749903, 2.092245, 1, 1, 1, 1, 1,
0.6493744, 0.05694555, 2.349138, 1, 1, 1, 1, 1,
0.6497798, 0.05896562, 1.014594, 1, 1, 1, 1, 1,
0.6573, -0.8369213, 2.406215, 1, 1, 1, 1, 1,
0.66021, 1.354183, 0.02522505, 1, 1, 1, 1, 1,
0.6628044, -1.672368, 2.858983, 0, 0, 1, 1, 1,
0.6638507, -0.6891466, 0.5483425, 1, 0, 0, 1, 1,
0.6638706, -0.1131786, 1.500897, 1, 0, 0, 1, 1,
0.6650392, 0.06941175, 2.130855, 1, 0, 0, 1, 1,
0.6680095, 0.1365564, 1.70053, 1, 0, 0, 1, 1,
0.6688861, 1.078324, 0.7675424, 1, 0, 0, 1, 1,
0.678775, -0.5952075, 1.036501, 0, 0, 0, 1, 1,
0.680335, 0.2813586, 1.509331, 0, 0, 0, 1, 1,
0.6826749, 0.4624821, 2.876506, 0, 0, 0, 1, 1,
0.6875854, 0.6580355, -1.226533, 0, 0, 0, 1, 1,
0.6954447, 0.4681412, 0.7530084, 0, 0, 0, 1, 1,
0.7015117, -1.622666, 0.4846648, 0, 0, 0, 1, 1,
0.7016951, 0.7376246, 1.164299, 0, 0, 0, 1, 1,
0.7069401, -0.4194916, 0.08011527, 1, 1, 1, 1, 1,
0.7083952, -1.358365, 3.983193, 1, 1, 1, 1, 1,
0.7094235, -0.6087799, 0.7925731, 1, 1, 1, 1, 1,
0.7103202, 0.572484, 1.730059, 1, 1, 1, 1, 1,
0.7114894, -1.683, 0.3314888, 1, 1, 1, 1, 1,
0.7132037, -0.4573954, 1.829252, 1, 1, 1, 1, 1,
0.7149116, -1.101395, 1.905127, 1, 1, 1, 1, 1,
0.7151257, -1.284953, 2.76478, 1, 1, 1, 1, 1,
0.7155207, -0.1406731, 1.712307, 1, 1, 1, 1, 1,
0.7201066, 0.2174299, 3.336104, 1, 1, 1, 1, 1,
0.7318172, 0.9776083, 2.083849, 1, 1, 1, 1, 1,
0.7403305, -2.24668, 2.863163, 1, 1, 1, 1, 1,
0.7455882, -0.2044213, 0.1539049, 1, 1, 1, 1, 1,
0.7473125, 0.1665765, 1.316617, 1, 1, 1, 1, 1,
0.7495028, -1.744808, 2.557041, 1, 1, 1, 1, 1,
0.7516019, -0.1057962, 2.46977, 0, 0, 1, 1, 1,
0.7525529, 0.3254184, 2.428879, 1, 0, 0, 1, 1,
0.7590612, -0.2656479, 1.897089, 1, 0, 0, 1, 1,
0.7604147, 0.9276317, 1.380157, 1, 0, 0, 1, 1,
0.7672191, 1.865611, 0.05041744, 1, 0, 0, 1, 1,
0.7679158, -0.3560134, 1.628417, 1, 0, 0, 1, 1,
0.7713731, 0.6976551, 1.869654, 0, 0, 0, 1, 1,
0.7745177, -1.218192, 1.745473, 0, 0, 0, 1, 1,
0.7767231, -1.034221, 2.251097, 0, 0, 0, 1, 1,
0.7813269, 1.400764, 0.8780777, 0, 0, 0, 1, 1,
0.785024, 2.127423, 0.6732747, 0, 0, 0, 1, 1,
0.7909572, 0.287621, 0.612164, 0, 0, 0, 1, 1,
0.7990656, -1.595719, 2.149913, 0, 0, 0, 1, 1,
0.800011, 0.5127544, 0.7558349, 1, 1, 1, 1, 1,
0.8021156, -0.9261109, 3.026432, 1, 1, 1, 1, 1,
0.8027616, 0.547356, 0.3713723, 1, 1, 1, 1, 1,
0.8029799, -0.3765573, 1.496941, 1, 1, 1, 1, 1,
0.8039119, 1.333524, 1.030854, 1, 1, 1, 1, 1,
0.8165002, -0.6211988, 1.811074, 1, 1, 1, 1, 1,
0.8181821, 0.04456712, 1.621019, 1, 1, 1, 1, 1,
0.8182608, -0.07479255, 0.2203814, 1, 1, 1, 1, 1,
0.823783, 0.7821846, -0.615793, 1, 1, 1, 1, 1,
0.8249737, 0.09712905, 2.557746, 1, 1, 1, 1, 1,
0.8295352, 0.5349008, 1.854656, 1, 1, 1, 1, 1,
0.8297808, 1.006608, -0.4156515, 1, 1, 1, 1, 1,
0.8470759, -0.2704156, 2.565583, 1, 1, 1, 1, 1,
0.8473487, -0.6609933, 0.9568294, 1, 1, 1, 1, 1,
0.8477859, 0.2225783, 2.101555, 1, 1, 1, 1, 1,
0.848278, 1.796878, 0.2322829, 0, 0, 1, 1, 1,
0.8494, -0.8360597, 2.328213, 1, 0, 0, 1, 1,
0.8542938, -2.005333, 3.544536, 1, 0, 0, 1, 1,
0.8543789, 1.352911, 0.1035921, 1, 0, 0, 1, 1,
0.8650219, -1.225212, 3.600374, 1, 0, 0, 1, 1,
0.8654842, 0.9591444, 0.07618372, 1, 0, 0, 1, 1,
0.8718377, 0.6176502, 1.141724, 0, 0, 0, 1, 1,
0.874435, -1.248939, 2.428165, 0, 0, 0, 1, 1,
0.8858756, 1.058561, 0.6524282, 0, 0, 0, 1, 1,
0.8885968, 0.5688002, 0.9594775, 0, 0, 0, 1, 1,
0.8930466, -0.7902336, 2.075095, 0, 0, 0, 1, 1,
0.8952096, 0.2384136, 3.514977, 0, 0, 0, 1, 1,
0.8994582, 1.121819, 0.3452049, 0, 0, 0, 1, 1,
0.900134, 0.07815516, 2.008782, 1, 1, 1, 1, 1,
0.9088896, 0.1175958, 2.532437, 1, 1, 1, 1, 1,
0.9089999, 1.408048, 1.525578, 1, 1, 1, 1, 1,
0.911378, 0.9346829, -0.09095947, 1, 1, 1, 1, 1,
0.9144471, -1.979047, 1.838339, 1, 1, 1, 1, 1,
0.9165558, -0.3210681, 2.241217, 1, 1, 1, 1, 1,
0.9302884, -0.0362881, 3.075387, 1, 1, 1, 1, 1,
0.9332353, 1.199489, 1.697268, 1, 1, 1, 1, 1,
0.9411789, 0.3411444, -0.3354102, 1, 1, 1, 1, 1,
0.9460841, 0.6568314, 0.7554998, 1, 1, 1, 1, 1,
0.9467298, 2.212077, 1.308955, 1, 1, 1, 1, 1,
0.9470166, 0.07048688, 1.038355, 1, 1, 1, 1, 1,
0.9478888, 1.843234, 0.08065492, 1, 1, 1, 1, 1,
0.9483327, 0.596184, 1.123987, 1, 1, 1, 1, 1,
0.9490099, -0.4356218, 0.2341262, 1, 1, 1, 1, 1,
0.9551823, 1.697308, 1.067879, 0, 0, 1, 1, 1,
0.9554899, 0.1623639, 2.701797, 1, 0, 0, 1, 1,
0.9569179, -0.1032869, 3.658414, 1, 0, 0, 1, 1,
0.9649871, -0.08600663, 3.696152, 1, 0, 0, 1, 1,
0.9780787, -0.130372, 0.4154611, 1, 0, 0, 1, 1,
0.9955555, -1.01238, 2.716508, 1, 0, 0, 1, 1,
0.9989685, -0.4619552, 1.618585, 0, 0, 0, 1, 1,
1.005865, -0.1899473, 3.119384, 0, 0, 0, 1, 1,
1.02198, -0.7914204, 0.7919236, 0, 0, 0, 1, 1,
1.024173, -0.7559337, 0.7137216, 0, 0, 0, 1, 1,
1.02463, 0.09518674, 1.328238, 0, 0, 0, 1, 1,
1.025853, 0.903567, 1.215476, 0, 0, 0, 1, 1,
1.0293, 1.637661, 0.6830925, 0, 0, 0, 1, 1,
1.034474, 0.280246, 0.3801137, 1, 1, 1, 1, 1,
1.046167, 0.9515748, 0.6085956, 1, 1, 1, 1, 1,
1.053429, 0.659037, 1.502898, 1, 1, 1, 1, 1,
1.058384, 0.3294731, 1.798566, 1, 1, 1, 1, 1,
1.066919, -0.8733982, 1.541556, 1, 1, 1, 1, 1,
1.078724, -0.1689638, 3.274366, 1, 1, 1, 1, 1,
1.08201, 0.5357515, 1.172929, 1, 1, 1, 1, 1,
1.083008, -0.8161308, 1.243017, 1, 1, 1, 1, 1,
1.093092, -0.4338568, 2.483988, 1, 1, 1, 1, 1,
1.096326, -1.218477, 2.779004, 1, 1, 1, 1, 1,
1.110937, 1.354799, 0.8847092, 1, 1, 1, 1, 1,
1.126348, 0.3586899, 1.670289, 1, 1, 1, 1, 1,
1.128519, -0.2007553, 1.051326, 1, 1, 1, 1, 1,
1.132204, 0.1185386, 1.435343, 1, 1, 1, 1, 1,
1.142825, 0.1974292, 1.175024, 1, 1, 1, 1, 1,
1.14409, -1.531227, 1.777308, 0, 0, 1, 1, 1,
1.151968, 0.1051692, 2.053315, 1, 0, 0, 1, 1,
1.163152, -1.048316, 1.37349, 1, 0, 0, 1, 1,
1.183534, -0.1191905, 1.408795, 1, 0, 0, 1, 1,
1.194149, -1.981196, 2.918833, 1, 0, 0, 1, 1,
1.195402, 0.7263233, 0.1451504, 1, 0, 0, 1, 1,
1.198484, 0.02382004, 2.078138, 0, 0, 0, 1, 1,
1.201212, 0.2455708, 1.141678, 0, 0, 0, 1, 1,
1.203004, 1.183104, -0.02194473, 0, 0, 0, 1, 1,
1.207789, -0.5690497, 1.881401, 0, 0, 0, 1, 1,
1.209789, 0.08295361, 1.214466, 0, 0, 0, 1, 1,
1.224959, -0.6785483, 2.488033, 0, 0, 0, 1, 1,
1.233498, 0.8667964, 0.8061205, 0, 0, 0, 1, 1,
1.23696, -0.159322, 2.903579, 1, 1, 1, 1, 1,
1.241629, 1.283256, 0.4311554, 1, 1, 1, 1, 1,
1.241846, -1.060328, 2.156265, 1, 1, 1, 1, 1,
1.243562, 1.173857, 1.645368, 1, 1, 1, 1, 1,
1.246747, 1.547834, 1.854047, 1, 1, 1, 1, 1,
1.252274, -0.02214087, 1.655947, 1, 1, 1, 1, 1,
1.273195, 0.5504637, 1.120356, 1, 1, 1, 1, 1,
1.281675, -1.805633, 2.481835, 1, 1, 1, 1, 1,
1.291737, 1.168388, 1.905851, 1, 1, 1, 1, 1,
1.292279, -0.2587244, 2.08161, 1, 1, 1, 1, 1,
1.294008, 0.3804903, 1.848416, 1, 1, 1, 1, 1,
1.296158, 0.350614, -0.7495833, 1, 1, 1, 1, 1,
1.307887, 0.3913533, 0.316086, 1, 1, 1, 1, 1,
1.319628, -0.09413115, 1.328772, 1, 1, 1, 1, 1,
1.322876, 0.2560222, 1.52793, 1, 1, 1, 1, 1,
1.326903, -0.620362, 1.919487, 0, 0, 1, 1, 1,
1.335473, -1.20235, 2.301911, 1, 0, 0, 1, 1,
1.339176, -2.690386, 4.240654, 1, 0, 0, 1, 1,
1.345183, 0.2491222, 1.44281, 1, 0, 0, 1, 1,
1.348508, 1.551228, 0.001243918, 1, 0, 0, 1, 1,
1.358261, -0.1650512, 0.1684425, 1, 0, 0, 1, 1,
1.358455, -0.5324999, 0.9075273, 0, 0, 0, 1, 1,
1.358637, 1.599065, 0.6034768, 0, 0, 0, 1, 1,
1.36299, -0.05529708, 1.1548, 0, 0, 0, 1, 1,
1.365507, 1.158301, 0.4959978, 0, 0, 0, 1, 1,
1.366812, 0.2706124, 3.738738, 0, 0, 0, 1, 1,
1.381173, 1.510478, 1.859926, 0, 0, 0, 1, 1,
1.388376, -0.108553, 2.973643, 0, 0, 0, 1, 1,
1.390797, -0.8700957, 2.517359, 1, 1, 1, 1, 1,
1.394475, -0.683366, 2.530346, 1, 1, 1, 1, 1,
1.401137, 0.04568247, 1.779843, 1, 1, 1, 1, 1,
1.401813, -0.4475431, 3.161189, 1, 1, 1, 1, 1,
1.41004, 1.024179, 0.8157739, 1, 1, 1, 1, 1,
1.416991, 0.4279842, 0.5460442, 1, 1, 1, 1, 1,
1.423053, -1.740981, 0.7556064, 1, 1, 1, 1, 1,
1.424254, 1.57973, 0.9923457, 1, 1, 1, 1, 1,
1.432081, -0.4804215, 1.617186, 1, 1, 1, 1, 1,
1.432732, 0.5909454, 0.1328567, 1, 1, 1, 1, 1,
1.433357, 1.218178, 0.3101243, 1, 1, 1, 1, 1,
1.440297, -0.04009801, 1.448858, 1, 1, 1, 1, 1,
1.443835, 0.8689241, 0.3055606, 1, 1, 1, 1, 1,
1.451394, 0.9220942, -0.3731249, 1, 1, 1, 1, 1,
1.457659, 0.5334605, 0.2729024, 1, 1, 1, 1, 1,
1.460076, -0.954237, 1.936551, 0, 0, 1, 1, 1,
1.480582, 0.0751352, 1.568542, 1, 0, 0, 1, 1,
1.483317, -0.5233544, 2.226164, 1, 0, 0, 1, 1,
1.49254, 0.0999399, 1.747992, 1, 0, 0, 1, 1,
1.506304, 1.076061, -0.6298671, 1, 0, 0, 1, 1,
1.506961, 0.1825699, 1.586706, 1, 0, 0, 1, 1,
1.509992, 0.1876884, 2.736944, 0, 0, 0, 1, 1,
1.514068, 0.7394907, 1.147415, 0, 0, 0, 1, 1,
1.524691, 0.005701426, 0.9376683, 0, 0, 0, 1, 1,
1.52743, -1.114504, 2.193001, 0, 0, 0, 1, 1,
1.527751, -0.1523589, 2.039331, 0, 0, 0, 1, 1,
1.530064, -0.4277818, 1.213354, 0, 0, 0, 1, 1,
1.53683, -1.499183, 4.164972, 0, 0, 0, 1, 1,
1.541473, 0.2947177, 1.508893, 1, 1, 1, 1, 1,
1.541731, -0.09517065, 3.305588, 1, 1, 1, 1, 1,
1.549394, 0.7647458, 2.204707, 1, 1, 1, 1, 1,
1.555261, -2.790032, 3.488747, 1, 1, 1, 1, 1,
1.561022, 0.0345193, 0.2408719, 1, 1, 1, 1, 1,
1.570892, 0.3131454, -0.02889546, 1, 1, 1, 1, 1,
1.575031, -0.2301398, -0.9279082, 1, 1, 1, 1, 1,
1.579161, -1.063177, 2.684008, 1, 1, 1, 1, 1,
1.582644, -0.392559, 1.767236, 1, 1, 1, 1, 1,
1.586156, 0.66188, 1.416702, 1, 1, 1, 1, 1,
1.592427, -2.285739, 3.000239, 1, 1, 1, 1, 1,
1.599562, 1.213549, 0.6860622, 1, 1, 1, 1, 1,
1.615967, 1.045967, -0.5052978, 1, 1, 1, 1, 1,
1.627156, -0.1978322, 2.082964, 1, 1, 1, 1, 1,
1.635406, -0.1720918, 1.456173, 1, 1, 1, 1, 1,
1.636699, -0.8137259, 3.999012, 0, 0, 1, 1, 1,
1.644632, -1.185076, 1.679509, 1, 0, 0, 1, 1,
1.672361, -0.06387348, 1.576661, 1, 0, 0, 1, 1,
1.696529, -0.01869818, 1.607467, 1, 0, 0, 1, 1,
1.702534, 1.282808, 1.383953, 1, 0, 0, 1, 1,
1.728929, 0.8183982, 0.8910072, 1, 0, 0, 1, 1,
1.731568, 1.735459, 0.6497381, 0, 0, 0, 1, 1,
1.737708, -0.3753084, 2.211034, 0, 0, 0, 1, 1,
1.751357, -0.07841023, 2.466853, 0, 0, 0, 1, 1,
1.75391, 0.3336739, 2.958891, 0, 0, 0, 1, 1,
1.764433, -1.665627, 1.798644, 0, 0, 0, 1, 1,
1.771786, 0.7314373, 1.486206, 0, 0, 0, 1, 1,
1.775615, 0.8132515, 0.772516, 0, 0, 0, 1, 1,
1.791365, -1.023829, 1.814704, 1, 1, 1, 1, 1,
1.793018, 0.6595876, 0.2197151, 1, 1, 1, 1, 1,
1.80173, -0.6172073, 1.869701, 1, 1, 1, 1, 1,
1.811801, -1.514998, 1.935368, 1, 1, 1, 1, 1,
1.827757, 0.3807895, 0.507974, 1, 1, 1, 1, 1,
1.835626, -0.1759333, 1.794191, 1, 1, 1, 1, 1,
1.868987, -1.35581, 1.095105, 1, 1, 1, 1, 1,
1.878294, 0.04739939, 3.252925, 1, 1, 1, 1, 1,
1.882106, -0.6121479, 2.52489, 1, 1, 1, 1, 1,
1.88589, -0.6337223, 3.103793, 1, 1, 1, 1, 1,
1.890035, -1.004387, 3.051481, 1, 1, 1, 1, 1,
1.896499, -0.6600822, 2.180767, 1, 1, 1, 1, 1,
1.896716, -0.4162669, 2.072999, 1, 1, 1, 1, 1,
1.900801, -0.9514822, 2.990831, 1, 1, 1, 1, 1,
1.906881, 0.4408592, 3.009583, 1, 1, 1, 1, 1,
1.914344, -0.2914505, 3.126366, 0, 0, 1, 1, 1,
1.928487, 0.02330152, 1.786607, 1, 0, 0, 1, 1,
1.940163, -0.3448592, 1.284071, 1, 0, 0, 1, 1,
1.992494, 1.083543, -2.107729, 1, 0, 0, 1, 1,
2.134478, -1.907838, 2.167725, 1, 0, 0, 1, 1,
2.136702, 0.782909, 1.28903, 1, 0, 0, 1, 1,
2.139713, 0.3981435, 2.682917, 0, 0, 0, 1, 1,
2.205054, -1.024156, 1.711831, 0, 0, 0, 1, 1,
2.213162, -0.6704423, 0.5701489, 0, 0, 0, 1, 1,
2.224352, -0.8890556, 2.619266, 0, 0, 0, 1, 1,
2.273917, -1.290289, 1.605467, 0, 0, 0, 1, 1,
2.349151, -0.004483328, 0.9374542, 0, 0, 0, 1, 1,
2.448683, -1.168735, 1.9342, 0, 0, 0, 1, 1,
2.569689, 0.5919795, 0.829165, 1, 1, 1, 1, 1,
2.592441, -0.3071021, 1.112249, 1, 1, 1, 1, 1,
2.64125, -0.3350304, 1.707534, 1, 1, 1, 1, 1,
2.79629, -0.4859053, 2.951218, 1, 1, 1, 1, 1,
2.81581, 1.78757, -0.09897996, 1, 1, 1, 1, 1,
3.108691, 0.8418177, 1.436735, 1, 1, 1, 1, 1,
3.128818, 0.3814048, 0.9147046, 1, 1, 1, 1, 1
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
var radius = 9.217833;
var distance = 32.37724;
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
mvMatrix.translate( -0.08037651, 0.01701319, 0.611609 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.37724);
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
