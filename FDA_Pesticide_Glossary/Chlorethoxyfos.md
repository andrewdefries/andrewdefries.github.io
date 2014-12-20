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
-2.682125, -2.478878, -0.943922, 1, 0, 0, 1,
-2.618062, -0.1225871, -1.385404, 1, 0.007843138, 0, 1,
-2.542004, 2.23317, -1.70114, 1, 0.01176471, 0, 1,
-2.531894, -0.2563256, -1.473949, 1, 0.01960784, 0, 1,
-2.529366, 0.7034417, -1.45197, 1, 0.02352941, 0, 1,
-2.50403, 1.167795, -0.4043997, 1, 0.03137255, 0, 1,
-2.420302, 0.417955, -1.085059, 1, 0.03529412, 0, 1,
-2.409042, 0.2573779, -0.2373136, 1, 0.04313726, 0, 1,
-2.404056, 0.8335004, -1.753379, 1, 0.04705882, 0, 1,
-2.249211, -0.09135125, -2.53838, 1, 0.05490196, 0, 1,
-2.208185, -2.180569, -2.652322, 1, 0.05882353, 0, 1,
-2.184911, 0.04792776, -1.03206, 1, 0.06666667, 0, 1,
-2.18062, -0.5763352, -2.254437, 1, 0.07058824, 0, 1,
-2.141918, -1.543072, -2.983771, 1, 0.07843138, 0, 1,
-2.141531, 1.564613, -1.053115, 1, 0.08235294, 0, 1,
-2.13939, -1.448891, -2.290209, 1, 0.09019608, 0, 1,
-2.117578, 0.5465225, -1.083737, 1, 0.09411765, 0, 1,
-2.117066, -0.2204656, 0.9231589, 1, 0.1019608, 0, 1,
-2.097785, -0.1466514, -3.829184, 1, 0.1098039, 0, 1,
-2.078133, -0.2261547, -1.538526, 1, 0.1137255, 0, 1,
-2.077262, -0.3650909, -1.481064, 1, 0.1215686, 0, 1,
-2.073423, -0.911107, -1.750577, 1, 0.1254902, 0, 1,
-2.072183, 0.03177512, -1.799132, 1, 0.1333333, 0, 1,
-2.044248, -1.509452, -3.370032, 1, 0.1372549, 0, 1,
-2.036799, 0.03950442, -3.03543, 1, 0.145098, 0, 1,
-1.999861, -0.02098058, -2.082728, 1, 0.1490196, 0, 1,
-1.9845, -0.146032, -1.104508, 1, 0.1568628, 0, 1,
-1.977536, -1.279601, -3.07681, 1, 0.1607843, 0, 1,
-1.959421, 0.2412194, -1.487269, 1, 0.1686275, 0, 1,
-1.958987, -1.372394, -3.425118, 1, 0.172549, 0, 1,
-1.948374, -1.570257, -1.319176, 1, 0.1803922, 0, 1,
-1.923206, -0.5680977, 0.0932419, 1, 0.1843137, 0, 1,
-1.889516, -0.7710256, -2.686925, 1, 0.1921569, 0, 1,
-1.858802, -0.185328, -3.291514, 1, 0.1960784, 0, 1,
-1.852016, 0.3120486, -0.8650936, 1, 0.2039216, 0, 1,
-1.819335, 0.03699381, -0.6368557, 1, 0.2117647, 0, 1,
-1.812742, 0.6821126, -1.548663, 1, 0.2156863, 0, 1,
-1.811603, -0.7923788, -3.586894, 1, 0.2235294, 0, 1,
-1.79431, 2.12675, 0.5636826, 1, 0.227451, 0, 1,
-1.759565, 0.7698053, -0.6831495, 1, 0.2352941, 0, 1,
-1.756154, -1.116485, -1.561912, 1, 0.2392157, 0, 1,
-1.717207, 0.2535378, 0.1202571, 1, 0.2470588, 0, 1,
-1.712606, -2.512084, -3.341349, 1, 0.2509804, 0, 1,
-1.712257, 0.2910563, -0.7761494, 1, 0.2588235, 0, 1,
-1.704234, 0.586047, -0.8729061, 1, 0.2627451, 0, 1,
-1.689416, 1.135101, 1.245325, 1, 0.2705882, 0, 1,
-1.677028, -1.980918, -2.942042, 1, 0.2745098, 0, 1,
-1.66559, 1.058651, -1.776993, 1, 0.282353, 0, 1,
-1.654569, -0.90819, -2.068048, 1, 0.2862745, 0, 1,
-1.628947, -0.09557945, -1.639253, 1, 0.2941177, 0, 1,
-1.628726, 0.05088138, -1.316032, 1, 0.3019608, 0, 1,
-1.603431, -1.192468, -2.696664, 1, 0.3058824, 0, 1,
-1.587325, -2.426192, -2.005828, 1, 0.3137255, 0, 1,
-1.579364, -0.2606448, -1.590001, 1, 0.3176471, 0, 1,
-1.562052, 0.7198576, -1.186883, 1, 0.3254902, 0, 1,
-1.558186, -1.237293, -3.906266, 1, 0.3294118, 0, 1,
-1.541963, 0.1792235, -0.6573367, 1, 0.3372549, 0, 1,
-1.538877, -0.6468184, -1.952093, 1, 0.3411765, 0, 1,
-1.538288, -1.115961, -1.407827, 1, 0.3490196, 0, 1,
-1.504508, -0.1010332, -2.324706, 1, 0.3529412, 0, 1,
-1.496644, -0.5513278, -0.9815321, 1, 0.3607843, 0, 1,
-1.496239, -0.248308, -1.063349, 1, 0.3647059, 0, 1,
-1.468105, -0.9535819, -1.66088, 1, 0.372549, 0, 1,
-1.466499, 1.038763, -2.485453, 1, 0.3764706, 0, 1,
-1.457424, 0.3822329, -0.6830844, 1, 0.3843137, 0, 1,
-1.454839, -0.8706883, -1.945972, 1, 0.3882353, 0, 1,
-1.450218, 0.2394184, -2.260978, 1, 0.3960784, 0, 1,
-1.448277, -0.5954305, -1.514956, 1, 0.4039216, 0, 1,
-1.445845, -0.2371597, -1.559711, 1, 0.4078431, 0, 1,
-1.440125, -0.3430263, -0.804952, 1, 0.4156863, 0, 1,
-1.439227, -0.4800945, -2.780731, 1, 0.4196078, 0, 1,
-1.439171, -0.2552936, -1.729989, 1, 0.427451, 0, 1,
-1.439136, -0.969021, -2.524983, 1, 0.4313726, 0, 1,
-1.427183, 1.844258, -0.6773052, 1, 0.4392157, 0, 1,
-1.408057, 1.034323, -3.823252, 1, 0.4431373, 0, 1,
-1.39597, 0.6215404, -0.9559032, 1, 0.4509804, 0, 1,
-1.384762, 0.3661511, -1.265771, 1, 0.454902, 0, 1,
-1.381861, -0.6423115, -2.199117, 1, 0.4627451, 0, 1,
-1.381818, -0.228362, -2.79517, 1, 0.4666667, 0, 1,
-1.376825, 0.7508477, -1.118506, 1, 0.4745098, 0, 1,
-1.370573, -0.3842827, -1.781468, 1, 0.4784314, 0, 1,
-1.357267, 0.9539131, -1.172278, 1, 0.4862745, 0, 1,
-1.355627, 0.4270004, -0.7802183, 1, 0.4901961, 0, 1,
-1.34817, -0.1063185, -1.387572, 1, 0.4980392, 0, 1,
-1.334542, 1.771737, -0.965962, 1, 0.5058824, 0, 1,
-1.330583, -2.032703, -0.9891401, 1, 0.509804, 0, 1,
-1.316688, -0.8487483, -1.921388, 1, 0.5176471, 0, 1,
-1.314501, -0.8575569, -2.766361, 1, 0.5215687, 0, 1,
-1.313266, -1.451747, -1.484414, 1, 0.5294118, 0, 1,
-1.304817, -1.522924, -2.382178, 1, 0.5333334, 0, 1,
-1.293914, -0.2578298, -2.235577, 1, 0.5411765, 0, 1,
-1.289753, -0.1669275, -2.079668, 1, 0.5450981, 0, 1,
-1.286197, -1.696362, -1.947675, 1, 0.5529412, 0, 1,
-1.285773, -1.041989, -3.205103, 1, 0.5568628, 0, 1,
-1.2839, 0.3682266, -0.9647821, 1, 0.5647059, 0, 1,
-1.281984, -1.633975, -2.008737, 1, 0.5686275, 0, 1,
-1.270555, 1.382418, 1.25959, 1, 0.5764706, 0, 1,
-1.26958, -1.4108, -0.2025754, 1, 0.5803922, 0, 1,
-1.263145, -0.0176826, -3.210627, 1, 0.5882353, 0, 1,
-1.262606, -0.2537654, -1.388546, 1, 0.5921569, 0, 1,
-1.259443, 0.5520127, 0.1687401, 1, 0.6, 0, 1,
-1.253618, -1.291512, -1.03433, 1, 0.6078432, 0, 1,
-1.247717, 1.347823, -2.557824, 1, 0.6117647, 0, 1,
-1.243839, 0.3193484, -1.460774, 1, 0.6196079, 0, 1,
-1.232531, 1.98844, 1.10966, 1, 0.6235294, 0, 1,
-1.227114, 2.241061, 1.198031, 1, 0.6313726, 0, 1,
-1.218345, -1.482184, -3.638368, 1, 0.6352941, 0, 1,
-1.2149, -0.8073929, -4.243477, 1, 0.6431373, 0, 1,
-1.213088, -1.228713, -2.645357, 1, 0.6470588, 0, 1,
-1.208343, 0.2034979, -1.718193, 1, 0.654902, 0, 1,
-1.196025, -0.2336103, -3.537997, 1, 0.6588235, 0, 1,
-1.194902, -0.01073144, -1.788212, 1, 0.6666667, 0, 1,
-1.194038, -0.6557909, -2.024589, 1, 0.6705883, 0, 1,
-1.193081, 1.587435, 1.253899, 1, 0.6784314, 0, 1,
-1.181251, 0.02198731, -1.290711, 1, 0.682353, 0, 1,
-1.179481, 1.580653, -0.08016161, 1, 0.6901961, 0, 1,
-1.165617, -0.941361, -1.958993, 1, 0.6941177, 0, 1,
-1.164159, 1.991702, 0.2089163, 1, 0.7019608, 0, 1,
-1.161022, -0.2413503, 0.7897183, 1, 0.7098039, 0, 1,
-1.148387, 0.1361519, -1.99595, 1, 0.7137255, 0, 1,
-1.147255, 1.695736, -0.7960144, 1, 0.7215686, 0, 1,
-1.120035, -0.444976, -2.357864, 1, 0.7254902, 0, 1,
-1.11928, -1.185103, -0.9320303, 1, 0.7333333, 0, 1,
-1.117704, -0.1888494, -2.367072, 1, 0.7372549, 0, 1,
-1.117398, 0.06664164, -2.211395, 1, 0.7450981, 0, 1,
-1.115804, -1.350026, -2.112299, 1, 0.7490196, 0, 1,
-1.104694, 0.01115993, -0.2927379, 1, 0.7568628, 0, 1,
-1.101078, -0.5483198, -1.893485, 1, 0.7607843, 0, 1,
-1.100144, 0.5469385, -1.782591, 1, 0.7686275, 0, 1,
-1.099698, 1.464668, -0.7796269, 1, 0.772549, 0, 1,
-1.09766, 1.983461, 0.2950158, 1, 0.7803922, 0, 1,
-1.094154, 1.424349, -0.8922397, 1, 0.7843137, 0, 1,
-1.090797, 1.224858, -2.184648, 1, 0.7921569, 0, 1,
-1.08347, 0.06859035, -1.725089, 1, 0.7960784, 0, 1,
-1.083255, -0.5043343, -2.34111, 1, 0.8039216, 0, 1,
-1.069189, 0.6398078, -3.215618, 1, 0.8117647, 0, 1,
-1.06612, -0.3699938, -2.47752, 1, 0.8156863, 0, 1,
-1.065421, 0.4162146, -1.250004, 1, 0.8235294, 0, 1,
-1.064361, 1.125325, 0.1082522, 1, 0.827451, 0, 1,
-1.061426, 1.823669, -0.2675232, 1, 0.8352941, 0, 1,
-1.061094, -0.9021214, -1.004923, 1, 0.8392157, 0, 1,
-1.060743, 0.7375919, -0.8433399, 1, 0.8470588, 0, 1,
-1.056743, -0.8830115, -3.81422, 1, 0.8509804, 0, 1,
-1.054849, 0.1797141, -1.912023, 1, 0.8588235, 0, 1,
-1.054503, -0.09652731, -0.8809183, 1, 0.8627451, 0, 1,
-1.050383, -0.7384806, -3.089845, 1, 0.8705882, 0, 1,
-1.045806, -0.06475189, -2.836936, 1, 0.8745098, 0, 1,
-1.045638, 0.362015, -2.044816, 1, 0.8823529, 0, 1,
-1.027269, 0.473804, -1.298864, 1, 0.8862745, 0, 1,
-1.021749, 0.01587634, -2.009664, 1, 0.8941177, 0, 1,
-1.019386, 0.8879752, -0.1209285, 1, 0.8980392, 0, 1,
-1.014502, -1.080806, -2.943688, 1, 0.9058824, 0, 1,
-1.014087, -0.1432241, -2.72429, 1, 0.9137255, 0, 1,
-1.013717, 1.382466, -0.7846736, 1, 0.9176471, 0, 1,
-1.012808, 0.7113926, -0.94729, 1, 0.9254902, 0, 1,
-1.010898, 0.7290341, -2.030079, 1, 0.9294118, 0, 1,
-1.007025, -2.044772, -2.09197, 1, 0.9372549, 0, 1,
-1.006653, 0.9375902, -1.279442, 1, 0.9411765, 0, 1,
-1.00052, 0.6083076, -0.4321076, 1, 0.9490196, 0, 1,
-0.9900736, 0.5181267, -0.3872115, 1, 0.9529412, 0, 1,
-0.987753, -2.361441, -2.423841, 1, 0.9607843, 0, 1,
-0.9838163, 0.3838346, -3.057187, 1, 0.9647059, 0, 1,
-0.9811017, 0.8663112, 1.334353, 1, 0.972549, 0, 1,
-0.9796614, 1.153321, -1.344327, 1, 0.9764706, 0, 1,
-0.975116, 2.484345, -0.1420736, 1, 0.9843137, 0, 1,
-0.9744954, 1.010665, -2.052514, 1, 0.9882353, 0, 1,
-0.9734254, -0.07809684, -0.9163132, 1, 0.9960784, 0, 1,
-0.9723993, -1.22829, -0.9870465, 0.9960784, 1, 0, 1,
-0.9708728, -0.3831335, -2.723933, 0.9921569, 1, 0, 1,
-0.9608499, 1.566809, -0.4631559, 0.9843137, 1, 0, 1,
-0.9605794, 1.977555, -0.1119283, 0.9803922, 1, 0, 1,
-0.9569249, 1.952204, 0.4383874, 0.972549, 1, 0, 1,
-0.9565865, -0.2787657, -1.530528, 0.9686275, 1, 0, 1,
-0.954743, 2.488065, 0.4233828, 0.9607843, 1, 0, 1,
-0.9524025, 1.184985, 0.5918015, 0.9568627, 1, 0, 1,
-0.9467542, 0.1313124, -1.277509, 0.9490196, 1, 0, 1,
-0.946299, 0.3369766, -0.7907881, 0.945098, 1, 0, 1,
-0.9436265, -1.354957, -3.111398, 0.9372549, 1, 0, 1,
-0.9424186, 0.9573738, 0.1247889, 0.9333333, 1, 0, 1,
-0.9420244, -1.55821, -2.941398, 0.9254902, 1, 0, 1,
-0.9375482, 0.6176568, -3.261832, 0.9215686, 1, 0, 1,
-0.9346671, 0.2891393, -2.488192, 0.9137255, 1, 0, 1,
-0.9340185, -1.912708, -2.872975, 0.9098039, 1, 0, 1,
-0.9294953, -1.22869, -1.461354, 0.9019608, 1, 0, 1,
-0.9289398, -1.340223, -1.484052, 0.8941177, 1, 0, 1,
-0.9271365, 0.2323763, -2.939891, 0.8901961, 1, 0, 1,
-0.926635, -0.3271978, -0.8769064, 0.8823529, 1, 0, 1,
-0.9258347, 1.716607, -1.633659, 0.8784314, 1, 0, 1,
-0.924684, 0.8643642, -0.7729967, 0.8705882, 1, 0, 1,
-0.9170467, -0.9664249, -2.772706, 0.8666667, 1, 0, 1,
-0.9145208, 0.7807444, -0.6284202, 0.8588235, 1, 0, 1,
-0.9074149, 0.2166975, -0.7553733, 0.854902, 1, 0, 1,
-0.9062813, 0.1300845, -1.441206, 0.8470588, 1, 0, 1,
-0.9033688, 1.622103, 0.3296341, 0.8431373, 1, 0, 1,
-0.8964247, 0.9398019, -0.7308696, 0.8352941, 1, 0, 1,
-0.8950084, -0.6599082, -2.984697, 0.8313726, 1, 0, 1,
-0.8885344, -0.05737179, -0.9629895, 0.8235294, 1, 0, 1,
-0.879357, -0.9475819, -2.612669, 0.8196079, 1, 0, 1,
-0.8713014, -1.342825, -3.802711, 0.8117647, 1, 0, 1,
-0.8689904, -2.623966, -3.815958, 0.8078431, 1, 0, 1,
-0.8689808, -0.5132468, -3.205329, 0.8, 1, 0, 1,
-0.8664105, -1.624034, -2.911297, 0.7921569, 1, 0, 1,
-0.8568792, -0.08660404, -1.732317, 0.7882353, 1, 0, 1,
-0.8521398, 0.6449542, -0.5634457, 0.7803922, 1, 0, 1,
-0.8511682, 1.325391, -0.005946256, 0.7764706, 1, 0, 1,
-0.8398433, -0.9022591, -2.276488, 0.7686275, 1, 0, 1,
-0.8347411, 0.4757657, -0.4636825, 0.7647059, 1, 0, 1,
-0.8333182, -2.220901, -1.653679, 0.7568628, 1, 0, 1,
-0.8299023, 0.4656552, -0.615468, 0.7529412, 1, 0, 1,
-0.8273971, 2.222691, 0.8884425, 0.7450981, 1, 0, 1,
-0.8270276, -1.255181, -2.606463, 0.7411765, 1, 0, 1,
-0.824114, -1.018552, -2.760473, 0.7333333, 1, 0, 1,
-0.8202857, 2.036005, 0.08309489, 0.7294118, 1, 0, 1,
-0.8183047, 1.389315, -0.4270709, 0.7215686, 1, 0, 1,
-0.8160856, 0.8098467, 1.446228, 0.7176471, 1, 0, 1,
-0.8151626, -2.375393, -3.542489, 0.7098039, 1, 0, 1,
-0.8137648, -1.974157, -1.700143, 0.7058824, 1, 0, 1,
-0.8092442, -0.2662633, -2.26193, 0.6980392, 1, 0, 1,
-0.8006432, -0.5854213, -3.239202, 0.6901961, 1, 0, 1,
-0.7970573, 0.626, -0.2559333, 0.6862745, 1, 0, 1,
-0.7964741, 1.470823, 0.156917, 0.6784314, 1, 0, 1,
-0.7937289, -0.739482, -2.189098, 0.6745098, 1, 0, 1,
-0.7913133, 1.108535, -1.715955, 0.6666667, 1, 0, 1,
-0.787568, -0.1628558, -2.153162, 0.6627451, 1, 0, 1,
-0.7741706, -1.29329, -1.010657, 0.654902, 1, 0, 1,
-0.7732275, -0.7467785, -2.439935, 0.6509804, 1, 0, 1,
-0.769127, 0.7994459, -0.8009136, 0.6431373, 1, 0, 1,
-0.7547714, -0.5489051, -2.885667, 0.6392157, 1, 0, 1,
-0.7440839, -0.4678472, -2.887708, 0.6313726, 1, 0, 1,
-0.7408204, -0.7833402, -1.978607, 0.627451, 1, 0, 1,
-0.7403953, -0.4956861, -3.2872, 0.6196079, 1, 0, 1,
-0.7382219, 1.128085, -1.202907, 0.6156863, 1, 0, 1,
-0.7374768, 0.3226108, -0.3053885, 0.6078432, 1, 0, 1,
-0.7366873, -0.1877957, -2.912021, 0.6039216, 1, 0, 1,
-0.7334015, -0.1763455, -1.366879, 0.5960785, 1, 0, 1,
-0.7333182, -0.7251483, -2.684495, 0.5882353, 1, 0, 1,
-0.7295759, -0.1503188, -3.751025, 0.5843138, 1, 0, 1,
-0.727489, 0.4754925, 1.429907, 0.5764706, 1, 0, 1,
-0.7173972, -0.4820761, -2.313855, 0.572549, 1, 0, 1,
-0.7169201, 0.1652081, -1.621585, 0.5647059, 1, 0, 1,
-0.7161639, 0.3350733, -0.4216227, 0.5607843, 1, 0, 1,
-0.7089406, -0.07937168, -0.3275791, 0.5529412, 1, 0, 1,
-0.7073985, 0.2471909, -2.17432, 0.5490196, 1, 0, 1,
-0.7068178, 1.222174, -0.3694389, 0.5411765, 1, 0, 1,
-0.6922752, 1.442165, -1.723284, 0.5372549, 1, 0, 1,
-0.6921355, 0.9345302, -2.252112, 0.5294118, 1, 0, 1,
-0.6920856, 0.3147159, -1.175519, 0.5254902, 1, 0, 1,
-0.6907935, -1.14275, -4.503067, 0.5176471, 1, 0, 1,
-0.6904085, 0.0157852, -2.112239, 0.5137255, 1, 0, 1,
-0.6896181, -1.0335, -2.692032, 0.5058824, 1, 0, 1,
-0.6847334, -1.157357, -4.025771, 0.5019608, 1, 0, 1,
-0.6829608, -0.004079513, -0.358803, 0.4941176, 1, 0, 1,
-0.6802939, 1.383405, -0.9166527, 0.4862745, 1, 0, 1,
-0.6785471, 1.234549, 0.3298016, 0.4823529, 1, 0, 1,
-0.6759921, -0.05237584, -0.298998, 0.4745098, 1, 0, 1,
-0.6722807, -0.1369662, -2.406978, 0.4705882, 1, 0, 1,
-0.6717603, -0.1602919, -2.857862, 0.4627451, 1, 0, 1,
-0.6711928, -0.595594, -2.178263, 0.4588235, 1, 0, 1,
-0.6678386, -0.800113, -3.506068, 0.4509804, 1, 0, 1,
-0.6635528, 0.4459372, -3.016115, 0.4470588, 1, 0, 1,
-0.6633846, 0.7433599, -2.36451, 0.4392157, 1, 0, 1,
-0.6616761, 2.026359, -1.608649, 0.4352941, 1, 0, 1,
-0.6604286, 0.8146351, 0.108683, 0.427451, 1, 0, 1,
-0.6551564, 0.9072672, -0.2421158, 0.4235294, 1, 0, 1,
-0.6534333, 1.79449, 0.6078409, 0.4156863, 1, 0, 1,
-0.6469912, -0.296393, -1.06751, 0.4117647, 1, 0, 1,
-0.6417173, -0.146985, -1.63844, 0.4039216, 1, 0, 1,
-0.6398378, 0.1866395, -2.659316, 0.3960784, 1, 0, 1,
-0.6343164, -0.7084358, -1.820939, 0.3921569, 1, 0, 1,
-0.6301673, -0.2509325, -0.7112578, 0.3843137, 1, 0, 1,
-0.6288796, 0.05379816, -2.823365, 0.3803922, 1, 0, 1,
-0.6277424, -0.6039228, -1.665734, 0.372549, 1, 0, 1,
-0.6273797, 1.225099, 0.6629233, 0.3686275, 1, 0, 1,
-0.6270657, -1.860055, -2.066593, 0.3607843, 1, 0, 1,
-0.6268196, 0.474134, -0.1690456, 0.3568628, 1, 0, 1,
-0.6216672, -0.04032432, -0.6114267, 0.3490196, 1, 0, 1,
-0.6191645, -0.389863, -3.889805, 0.345098, 1, 0, 1,
-0.6178777, 0.9099543, 0.5033372, 0.3372549, 1, 0, 1,
-0.6160661, -0.6424482, -2.298761, 0.3333333, 1, 0, 1,
-0.6143138, 1.669238, -0.09703948, 0.3254902, 1, 0, 1,
-0.6134129, 1.566772, 0.2308456, 0.3215686, 1, 0, 1,
-0.6045943, 0.3475458, 0.6168295, 0.3137255, 1, 0, 1,
-0.6024945, 1.402906, -1.085904, 0.3098039, 1, 0, 1,
-0.6014161, 1.3906, -0.4738897, 0.3019608, 1, 0, 1,
-0.6002624, 0.7204994, 0.1536775, 0.2941177, 1, 0, 1,
-0.6000049, 1.33149, 0.0007215756, 0.2901961, 1, 0, 1,
-0.5946147, 2.445499, -1.321858, 0.282353, 1, 0, 1,
-0.5929878, -0.3086321, -2.155782, 0.2784314, 1, 0, 1,
-0.5914468, -1.095185, -0.9591248, 0.2705882, 1, 0, 1,
-0.5895234, 0.460959, 0.5331475, 0.2666667, 1, 0, 1,
-0.5836606, 0.4563653, -0.9528032, 0.2588235, 1, 0, 1,
-0.5818719, -0.4532147, -3.386787, 0.254902, 1, 0, 1,
-0.5792444, -0.1700041, -2.584809, 0.2470588, 1, 0, 1,
-0.5745688, -1.146089, -1.113547, 0.2431373, 1, 0, 1,
-0.5733939, -1.273964, -2.402369, 0.2352941, 1, 0, 1,
-0.5733403, -0.6699914, -3.320193, 0.2313726, 1, 0, 1,
-0.5717351, -1.460941, -3.073626, 0.2235294, 1, 0, 1,
-0.5685883, -1.24966, -3.545186, 0.2196078, 1, 0, 1,
-0.5631398, 1.156486, 0.9222696, 0.2117647, 1, 0, 1,
-0.5603175, 0.8754997, -0.2856247, 0.2078431, 1, 0, 1,
-0.5597278, -0.05879541, -2.133174, 0.2, 1, 0, 1,
-0.5571093, -0.190466, -2.108529, 0.1921569, 1, 0, 1,
-0.5533584, 1.576611, 0.4084811, 0.1882353, 1, 0, 1,
-0.5504413, -1.539222, -3.814907, 0.1803922, 1, 0, 1,
-0.5471355, -0.6721725, -1.229358, 0.1764706, 1, 0, 1,
-0.5469781, -0.2744673, -0.8657416, 0.1686275, 1, 0, 1,
-0.5444722, -1.022897, -1.671959, 0.1647059, 1, 0, 1,
-0.5404902, -0.3262983, -0.9485782, 0.1568628, 1, 0, 1,
-0.5398396, -0.7185043, -1.43186, 0.1529412, 1, 0, 1,
-0.5376855, 0.4815376, -0.5824884, 0.145098, 1, 0, 1,
-0.5356804, -0.1064871, -0.8200501, 0.1411765, 1, 0, 1,
-0.5326983, 0.8126959, -0.6215606, 0.1333333, 1, 0, 1,
-0.5317596, 0.283758, -0.837599, 0.1294118, 1, 0, 1,
-0.5308705, -1.01352, -2.422631, 0.1215686, 1, 0, 1,
-0.5307286, 0.9136974, -2.045703, 0.1176471, 1, 0, 1,
-0.5258561, -2.173125, -3.048938, 0.1098039, 1, 0, 1,
-0.5197144, 0.7877262, -0.4644599, 0.1058824, 1, 0, 1,
-0.5142799, -0.2171213, -2.673577, 0.09803922, 1, 0, 1,
-0.5134658, 0.5753168, -1.343684, 0.09019608, 1, 0, 1,
-0.5089703, 0.09617756, -0.1021677, 0.08627451, 1, 0, 1,
-0.508607, 0.7587851, -0.1431157, 0.07843138, 1, 0, 1,
-0.5039351, 0.4205501, -1.862134, 0.07450981, 1, 0, 1,
-0.4986483, -3.144808, -6.343504, 0.06666667, 1, 0, 1,
-0.4965807, 0.168768, 1.18187, 0.0627451, 1, 0, 1,
-0.4960487, 2.193753, -0.4660123, 0.05490196, 1, 0, 1,
-0.4957215, 0.9105066, -0.1522743, 0.05098039, 1, 0, 1,
-0.4925463, -0.6938507, -2.755573, 0.04313726, 1, 0, 1,
-0.4802835, -1.069386, -3.655813, 0.03921569, 1, 0, 1,
-0.4750709, -1.181901, -3.393198, 0.03137255, 1, 0, 1,
-0.4720581, 0.8022425, 0.03520631, 0.02745098, 1, 0, 1,
-0.4704373, -1.12088, -2.119352, 0.01960784, 1, 0, 1,
-0.4674642, -0.5135221, -1.627415, 0.01568628, 1, 0, 1,
-0.4674512, 0.3011527, -0.425976, 0.007843138, 1, 0, 1,
-0.4665846, 0.114824, -2.211921, 0.003921569, 1, 0, 1,
-0.4650488, -0.03505269, -0.683072, 0, 1, 0.003921569, 1,
-0.4615141, 0.7658024, -2.639274, 0, 1, 0.01176471, 1,
-0.4589854, 0.2312877, -1.077234, 0, 1, 0.01568628, 1,
-0.4533844, 0.8997977, 0.5870068, 0, 1, 0.02352941, 1,
-0.4484509, -1.003811, -1.858692, 0, 1, 0.02745098, 1,
-0.447735, -1.943037, -2.708326, 0, 1, 0.03529412, 1,
-0.4447238, -0.1923492, -0.709236, 0, 1, 0.03921569, 1,
-0.4419667, -0.3415992, -1.840024, 0, 1, 0.04705882, 1,
-0.4414962, -2.381597, -1.877892, 0, 1, 0.05098039, 1,
-0.4397461, 0.3019615, -1.182887, 0, 1, 0.05882353, 1,
-0.4384924, -1.582167, -4.452182, 0, 1, 0.0627451, 1,
-0.4306289, -0.9591404, -2.429303, 0, 1, 0.07058824, 1,
-0.4288474, -0.7719558, -2.105683, 0, 1, 0.07450981, 1,
-0.4287311, 1.820233, -0.8404377, 0, 1, 0.08235294, 1,
-0.4257122, 0.7216469, -0.6626875, 0, 1, 0.08627451, 1,
-0.4245614, 1.932802, 0.7404029, 0, 1, 0.09411765, 1,
-0.4230321, 0.3637241, 0.7401045, 0, 1, 0.1019608, 1,
-0.4188154, 1.997461, 0.2264358, 0, 1, 0.1058824, 1,
-0.4069788, 0.7238116, 0.04632498, 0, 1, 0.1137255, 1,
-0.4063276, -0.143592, -2.076304, 0, 1, 0.1176471, 1,
-0.4020068, 2.14903, 0.2800975, 0, 1, 0.1254902, 1,
-0.3959221, 0.08637103, -2.598581, 0, 1, 0.1294118, 1,
-0.3951033, -1.000384, -1.277045, 0, 1, 0.1372549, 1,
-0.3944157, 1.347061, 0.5094166, 0, 1, 0.1411765, 1,
-0.3926291, 0.6881395, -1.570583, 0, 1, 0.1490196, 1,
-0.388402, -0.1970597, -2.098465, 0, 1, 0.1529412, 1,
-0.3883193, -0.4904602, -1.887766, 0, 1, 0.1607843, 1,
-0.3845598, -0.4757896, -2.789901, 0, 1, 0.1647059, 1,
-0.3823154, -0.4061544, -3.953224, 0, 1, 0.172549, 1,
-0.3811109, -0.05866657, -1.4729, 0, 1, 0.1764706, 1,
-0.3805985, -0.4306049, -1.267788, 0, 1, 0.1843137, 1,
-0.3779918, 0.4873922, -2.387154, 0, 1, 0.1882353, 1,
-0.3755836, -1.399713, -3.957756, 0, 1, 0.1960784, 1,
-0.3753391, -0.9231693, -2.698417, 0, 1, 0.2039216, 1,
-0.3748262, -0.6826635, -4.127153, 0, 1, 0.2078431, 1,
-0.3744155, -1.2115, -2.413528, 0, 1, 0.2156863, 1,
-0.3741868, 0.1821013, 0.6237763, 0, 1, 0.2196078, 1,
-0.3723895, 1.137982, 0.214271, 0, 1, 0.227451, 1,
-0.3685794, 1.707949, 0.4677414, 0, 1, 0.2313726, 1,
-0.3680927, 0.6643543, -0.7903358, 0, 1, 0.2392157, 1,
-0.3637418, 0.5125921, -1.22391, 0, 1, 0.2431373, 1,
-0.3552769, 0.6166207, -1.843746, 0, 1, 0.2509804, 1,
-0.350156, 0.4985069, 1.856759, 0, 1, 0.254902, 1,
-0.3394884, -1.137606, -0.3662236, 0, 1, 0.2627451, 1,
-0.3362396, 0.2377485, -0.150411, 0, 1, 0.2666667, 1,
-0.3356391, 0.7562646, -0.678906, 0, 1, 0.2745098, 1,
-0.3337587, 0.5509394, -0.8299122, 0, 1, 0.2784314, 1,
-0.3332323, 0.0796807, -0.57566, 0, 1, 0.2862745, 1,
-0.3330835, -0.1737009, -2.274644, 0, 1, 0.2901961, 1,
-0.3328214, 0.05202742, -2.666477, 0, 1, 0.2980392, 1,
-0.3289796, -1.200958, -3.419796, 0, 1, 0.3058824, 1,
-0.3271678, 0.2991987, -0.2214927, 0, 1, 0.3098039, 1,
-0.3269062, 1.459428, 0.6763768, 0, 1, 0.3176471, 1,
-0.3261512, 2.27876, -0.8870084, 0, 1, 0.3215686, 1,
-0.3223727, -1.044305, -3.111554, 0, 1, 0.3294118, 1,
-0.3212598, 1.506096, -0.3296884, 0, 1, 0.3333333, 1,
-0.321231, -2.085765, -3.181699, 0, 1, 0.3411765, 1,
-0.3176414, 0.3709095, -1.040247, 0, 1, 0.345098, 1,
-0.3120549, -0.333063, -2.912375, 0, 1, 0.3529412, 1,
-0.3108155, -0.7313978, -2.75703, 0, 1, 0.3568628, 1,
-0.3096201, 0.3840933, -0.6395701, 0, 1, 0.3647059, 1,
-0.3075986, -1.085691, -1.929306, 0, 1, 0.3686275, 1,
-0.3051007, -2.202796, -4.534213, 0, 1, 0.3764706, 1,
-0.3024015, -0.09781672, -1.404528, 0, 1, 0.3803922, 1,
-0.3022882, -0.9758407, -3.613706, 0, 1, 0.3882353, 1,
-0.3015034, -0.2011584, -2.145443, 0, 1, 0.3921569, 1,
-0.3011702, 0.9818806, 1.539793, 0, 1, 0.4, 1,
-0.2939549, 0.4529077, -0.1412127, 0, 1, 0.4078431, 1,
-0.293577, -0.59338, -2.835956, 0, 1, 0.4117647, 1,
-0.2907147, 1.195903, -0.3315662, 0, 1, 0.4196078, 1,
-0.2905038, 0.9774467, -0.4142498, 0, 1, 0.4235294, 1,
-0.2857871, -0.8878058, -1.07714, 0, 1, 0.4313726, 1,
-0.2844033, -0.08638263, -2.780886, 0, 1, 0.4352941, 1,
-0.2807154, -2.616789, -2.910075, 0, 1, 0.4431373, 1,
-0.2791159, -0.8529903, -4.453374, 0, 1, 0.4470588, 1,
-0.278489, 0.2595437, -1.585901, 0, 1, 0.454902, 1,
-0.2683993, -0.6920244, -2.376653, 0, 1, 0.4588235, 1,
-0.2679883, -0.02202182, -0.4802543, 0, 1, 0.4666667, 1,
-0.2627285, 1.704158, -1.879125, 0, 1, 0.4705882, 1,
-0.2617738, 0.6948104, 0.8259801, 0, 1, 0.4784314, 1,
-0.2554628, -0.2451062, -0.9427025, 0, 1, 0.4823529, 1,
-0.2554615, -0.7848541, -1.388243, 0, 1, 0.4901961, 1,
-0.2531861, 1.340229, -2.321699, 0, 1, 0.4941176, 1,
-0.2509402, -0.6455901, -1.866663, 0, 1, 0.5019608, 1,
-0.2446469, 0.51096, -1.385643, 0, 1, 0.509804, 1,
-0.2385058, -1.16267, -1.630028, 0, 1, 0.5137255, 1,
-0.238465, 0.5908075, -0.6735387, 0, 1, 0.5215687, 1,
-0.2326607, -0.2918682, -1.471963, 0, 1, 0.5254902, 1,
-0.2320878, -0.4438169, -0.8078661, 0, 1, 0.5333334, 1,
-0.2310509, -0.791835, -2.529725, 0, 1, 0.5372549, 1,
-0.2287696, -0.1589213, -2.843334, 0, 1, 0.5450981, 1,
-0.2260561, -0.7069849, -3.798086, 0, 1, 0.5490196, 1,
-0.2254349, 0.9622121, -0.4219879, 0, 1, 0.5568628, 1,
-0.2200618, 1.215007, 0.4660286, 0, 1, 0.5607843, 1,
-0.2181646, -0.1401989, -1.404819, 0, 1, 0.5686275, 1,
-0.2166182, -0.2679712, -2.196259, 0, 1, 0.572549, 1,
-0.2149906, 0.9247005, 0.1618898, 0, 1, 0.5803922, 1,
-0.2125012, -0.8619797, -1.669955, 0, 1, 0.5843138, 1,
-0.1973012, -0.9185507, -1.669857, 0, 1, 0.5921569, 1,
-0.1949526, 0.03934417, -0.6492356, 0, 1, 0.5960785, 1,
-0.1924269, -0.9240326, -3.104253, 0, 1, 0.6039216, 1,
-0.1901211, -0.1766512, -3.241646, 0, 1, 0.6117647, 1,
-0.1899055, -0.8571192, -3.339881, 0, 1, 0.6156863, 1,
-0.1864864, 0.05017871, -0.8660923, 0, 1, 0.6235294, 1,
-0.1849968, 0.8521286, 0.5241271, 0, 1, 0.627451, 1,
-0.1849863, 1.041549, 0.9969807, 0, 1, 0.6352941, 1,
-0.181112, 1.308886, -1.139365, 0, 1, 0.6392157, 1,
-0.1773328, -0.2415966, -1.503625, 0, 1, 0.6470588, 1,
-0.1755625, -1.093012, -3.947705, 0, 1, 0.6509804, 1,
-0.1742485, 0.256592, -2.827316, 0, 1, 0.6588235, 1,
-0.1730681, 0.6440444, -1.578038, 0, 1, 0.6627451, 1,
-0.1674609, 0.2170498, -0.4143968, 0, 1, 0.6705883, 1,
-0.1670997, 1.458417, 1.317977, 0, 1, 0.6745098, 1,
-0.1600895, 0.7613508, 0.3873064, 0, 1, 0.682353, 1,
-0.1576535, 0.1420453, -2.504184, 0, 1, 0.6862745, 1,
-0.1563971, -0.1559082, -1.330181, 0, 1, 0.6941177, 1,
-0.1537237, -0.6790521, -3.922871, 0, 1, 0.7019608, 1,
-0.1417783, -1.217827, -2.791016, 0, 1, 0.7058824, 1,
-0.1403335, 0.9118398, -0.6526673, 0, 1, 0.7137255, 1,
-0.1388779, 0.4532867, -0.3257687, 0, 1, 0.7176471, 1,
-0.138258, 0.5747916, -0.6548879, 0, 1, 0.7254902, 1,
-0.1356927, -0.3223759, -1.632659, 0, 1, 0.7294118, 1,
-0.1345339, -1.06612, -3.547297, 0, 1, 0.7372549, 1,
-0.1336841, 1.644134, 0.9961742, 0, 1, 0.7411765, 1,
-0.1326684, 0.4435364, -1.113819, 0, 1, 0.7490196, 1,
-0.1326038, -1.936549, -3.201265, 0, 1, 0.7529412, 1,
-0.1320061, 0.2596053, -0.1401127, 0, 1, 0.7607843, 1,
-0.1303214, 0.05463392, -2.156842, 0, 1, 0.7647059, 1,
-0.1292982, -1.325627, -2.91953, 0, 1, 0.772549, 1,
-0.1282909, 1.309381, -1.110163, 0, 1, 0.7764706, 1,
-0.1249926, 0.566975, -1.284001, 0, 1, 0.7843137, 1,
-0.1184907, -0.06853711, -3.345155, 0, 1, 0.7882353, 1,
-0.1182904, 0.3484052, -1.021858, 0, 1, 0.7960784, 1,
-0.1149262, 0.6265992, 0.9988741, 0, 1, 0.8039216, 1,
-0.1106505, -0.5656338, -1.83348, 0, 1, 0.8078431, 1,
-0.1081317, -0.8996623, -0.5706344, 0, 1, 0.8156863, 1,
-0.1076063, -0.1688282, -2.288644, 0, 1, 0.8196079, 1,
-0.10608, 0.1648066, -1.986652, 0, 1, 0.827451, 1,
-0.1011628, -2.384716, -5.355199, 0, 1, 0.8313726, 1,
-0.09833532, 0.0451117, -1.942876, 0, 1, 0.8392157, 1,
-0.09702826, 0.654165, -0.2039547, 0, 1, 0.8431373, 1,
-0.09433375, -0.1441, -3.437796, 0, 1, 0.8509804, 1,
-0.08170182, 0.539889, -1.461538, 0, 1, 0.854902, 1,
-0.07753789, 0.6856851, 0.9225824, 0, 1, 0.8627451, 1,
-0.0752022, -0.2816135, -2.913352, 0, 1, 0.8666667, 1,
-0.07451127, -0.8916136, -2.708316, 0, 1, 0.8745098, 1,
-0.06787113, -1.716334, -2.9952, 0, 1, 0.8784314, 1,
-0.06575765, 1.939515, 0.9380824, 0, 1, 0.8862745, 1,
-0.06349453, -1.211419, -3.848056, 0, 1, 0.8901961, 1,
-0.06100698, -0.5812036, -4.579417, 0, 1, 0.8980392, 1,
-0.06031281, -1.306449, -3.083005, 0, 1, 0.9058824, 1,
-0.05476319, 0.6736505, 1.646813, 0, 1, 0.9098039, 1,
-0.05357921, -0.9287399, -3.664813, 0, 1, 0.9176471, 1,
-0.05354326, 0.8306316, 0.2200532, 0, 1, 0.9215686, 1,
-0.05073319, -0.7186217, -1.448324, 0, 1, 0.9294118, 1,
-0.04928015, 0.4746782, -1.241354, 0, 1, 0.9333333, 1,
-0.0463062, 0.9916625, -2.333265, 0, 1, 0.9411765, 1,
-0.04035719, 1.644361, -0.2686189, 0, 1, 0.945098, 1,
-0.03911783, -0.8832397, -2.20729, 0, 1, 0.9529412, 1,
-0.03435763, -1.896092, -4.463126, 0, 1, 0.9568627, 1,
-0.03422682, 0.753353, -0.1540164, 0, 1, 0.9647059, 1,
-0.03226955, -0.7006144, -2.704184, 0, 1, 0.9686275, 1,
-0.0315878, 1.66291, -0.2829489, 0, 1, 0.9764706, 1,
-0.02886069, -1.028221, -4.031412, 0, 1, 0.9803922, 1,
-0.02810601, 1.624438, 3.2826, 0, 1, 0.9882353, 1,
-0.02738611, -0.772478, -0.6804155, 0, 1, 0.9921569, 1,
-0.02730548, 0.3883049, 1.097489, 0, 1, 1, 1,
-0.02545433, 0.583195, -0.115983, 0, 0.9921569, 1, 1,
-0.02237185, -1.631891, -3.050547, 0, 0.9882353, 1, 1,
-0.01626816, -2.196954, -2.504581, 0, 0.9803922, 1, 1,
-0.01589692, -0.1779631, -2.965354, 0, 0.9764706, 1, 1,
-0.0126634, -0.4427132, -3.37653, 0, 0.9686275, 1, 1,
-0.0125971, 0.6787841, -0.1967051, 0, 0.9647059, 1, 1,
-0.01025949, -0.7096582, -5.151289, 0, 0.9568627, 1, 1,
-0.008801884, 1.406291, 1.236556, 0, 0.9529412, 1, 1,
-0.006739847, 0.7147229, 1.762643, 0, 0.945098, 1, 1,
-0.00364293, 0.3617443, 0.4578424, 0, 0.9411765, 1, 1,
0.004207992, 0.4464154, -0.270719, 0, 0.9333333, 1, 1,
0.004991487, -1.19574, 3.097983, 0, 0.9294118, 1, 1,
0.005294925, -0.5731007, 2.936609, 0, 0.9215686, 1, 1,
0.009272114, 0.3293133, 0.6045126, 0, 0.9176471, 1, 1,
0.009666701, -0.2885073, 2.812161, 0, 0.9098039, 1, 1,
0.01094211, 0.9169703, 0.08871752, 0, 0.9058824, 1, 1,
0.0117388, -0.04379434, 2.555991, 0, 0.8980392, 1, 1,
0.01224914, -1.027508, 3.362455, 0, 0.8901961, 1, 1,
0.01383818, -0.7313365, 4.788743, 0, 0.8862745, 1, 1,
0.02308078, 1.161506, -0.7668225, 0, 0.8784314, 1, 1,
0.02577169, 0.004975399, 1.230826, 0, 0.8745098, 1, 1,
0.02619979, 0.1288294, 1.185071, 0, 0.8666667, 1, 1,
0.02743271, -0.9903439, 2.423115, 0, 0.8627451, 1, 1,
0.02951233, -0.8801148, 4.201549, 0, 0.854902, 1, 1,
0.03090491, 1.541249, -0.190625, 0, 0.8509804, 1, 1,
0.03357348, -0.3715328, 3.907041, 0, 0.8431373, 1, 1,
0.03451211, 1.262446, -0.8615389, 0, 0.8392157, 1, 1,
0.037553, 0.2077062, -1.51733, 0, 0.8313726, 1, 1,
0.04186356, 0.1503522, 1.379432, 0, 0.827451, 1, 1,
0.05362552, 0.7287699, 0.8943878, 0, 0.8196079, 1, 1,
0.05581319, -0.2809298, 4.461257, 0, 0.8156863, 1, 1,
0.05792418, -0.6194872, 2.921887, 0, 0.8078431, 1, 1,
0.063115, -1.763572, 3.301681, 0, 0.8039216, 1, 1,
0.07360561, -0.1743113, 2.09968, 0, 0.7960784, 1, 1,
0.07568253, -1.483303, 2.330478, 0, 0.7882353, 1, 1,
0.0780081, 1.621516, 1.280597, 0, 0.7843137, 1, 1,
0.07877998, 0.04552585, 2.369355, 0, 0.7764706, 1, 1,
0.08011501, 0.09339409, 0.992762, 0, 0.772549, 1, 1,
0.08338934, -0.4412557, 3.256938, 0, 0.7647059, 1, 1,
0.0849338, 0.06250414, 1.012073, 0, 0.7607843, 1, 1,
0.08888702, -0.1064472, 1.285402, 0, 0.7529412, 1, 1,
0.09080943, -0.2577513, 3.970407, 0, 0.7490196, 1, 1,
0.1013499, -0.3036158, 2.991454, 0, 0.7411765, 1, 1,
0.1046207, 0.7263911, 1.332922, 0, 0.7372549, 1, 1,
0.1074252, 1.420332, -0.9327372, 0, 0.7294118, 1, 1,
0.1114451, 0.2671518, 1.923611, 0, 0.7254902, 1, 1,
0.1126474, 0.6913595, -0.9988153, 0, 0.7176471, 1, 1,
0.1160664, 0.02539339, 0.871691, 0, 0.7137255, 1, 1,
0.1172093, -0.3716962, 2.443159, 0, 0.7058824, 1, 1,
0.1186948, -0.3533734, 2.362266, 0, 0.6980392, 1, 1,
0.12, -1.242986, 5.402323, 0, 0.6941177, 1, 1,
0.122003, 0.7251417, 1.744774, 0, 0.6862745, 1, 1,
0.1278785, -0.1927937, 3.286454, 0, 0.682353, 1, 1,
0.1300168, 0.7754923, 0.8702615, 0, 0.6745098, 1, 1,
0.1303559, 1.123096, 1.47041, 0, 0.6705883, 1, 1,
0.1307869, 0.5112575, -0.1415438, 0, 0.6627451, 1, 1,
0.1370989, 0.1471209, 0.3912157, 0, 0.6588235, 1, 1,
0.1390826, -0.1936808, 1.2767, 0, 0.6509804, 1, 1,
0.1392025, -2.094631, 1.594651, 0, 0.6470588, 1, 1,
0.1399729, 0.4040943, -0.01106766, 0, 0.6392157, 1, 1,
0.1412953, 0.5715751, 1.533143, 0, 0.6352941, 1, 1,
0.1423396, -0.9931201, 2.324085, 0, 0.627451, 1, 1,
0.144499, 0.265917, 0.4736106, 0, 0.6235294, 1, 1,
0.1447058, -0.156408, 3.812604, 0, 0.6156863, 1, 1,
0.1469124, -2.076124, 3.350851, 0, 0.6117647, 1, 1,
0.1480348, 0.6140448, 1.099166, 0, 0.6039216, 1, 1,
0.1486256, 0.8107243, 0.4647829, 0, 0.5960785, 1, 1,
0.1492555, -0.9212892, 4.957441, 0, 0.5921569, 1, 1,
0.151698, -0.3286635, 1.204734, 0, 0.5843138, 1, 1,
0.1546721, -0.8024757, 3.250841, 0, 0.5803922, 1, 1,
0.1555401, 0.008778003, -1.046968, 0, 0.572549, 1, 1,
0.1575029, -0.8371407, 2.243784, 0, 0.5686275, 1, 1,
0.1585309, 0.7748999, -1.085575, 0, 0.5607843, 1, 1,
0.1610425, -0.768299, 3.972753, 0, 0.5568628, 1, 1,
0.1613041, 0.09226204, 3.548191, 0, 0.5490196, 1, 1,
0.1633861, -0.7914401, 1.603863, 0, 0.5450981, 1, 1,
0.1660135, 0.1145159, 0.2085544, 0, 0.5372549, 1, 1,
0.1661941, 0.01701748, 1.280955, 0, 0.5333334, 1, 1,
0.1671717, 2.264901, 0.7588525, 0, 0.5254902, 1, 1,
0.1710864, -0.7453796, 2.125851, 0, 0.5215687, 1, 1,
0.1715175, 0.5613894, -1.836782, 0, 0.5137255, 1, 1,
0.1732475, 2.453142, -0.6876692, 0, 0.509804, 1, 1,
0.1749362, 1.511656, 0.612147, 0, 0.5019608, 1, 1,
0.1825328, -1.109557, 2.924706, 0, 0.4941176, 1, 1,
0.183589, 0.0290615, 0.991204, 0, 0.4901961, 1, 1,
0.1848949, 1.156018, 0.8838457, 0, 0.4823529, 1, 1,
0.1861819, -0.6122346, 2.698593, 0, 0.4784314, 1, 1,
0.2018242, -0.2068778, 2.385787, 0, 0.4705882, 1, 1,
0.2104164, -1.720384, 4.883845, 0, 0.4666667, 1, 1,
0.2139353, 1.680804, 0.1381877, 0, 0.4588235, 1, 1,
0.2156628, -0.5598798, 1.968841, 0, 0.454902, 1, 1,
0.2210649, -1.424146, 3.290322, 0, 0.4470588, 1, 1,
0.2223319, -1.79013, 3.794287, 0, 0.4431373, 1, 1,
0.2269001, 1.187359, 0.0370491, 0, 0.4352941, 1, 1,
0.2283164, 0.2062999, 0.6820834, 0, 0.4313726, 1, 1,
0.2292397, -0.9717401, 3.462981, 0, 0.4235294, 1, 1,
0.2315034, -0.3227252, 2.146686, 0, 0.4196078, 1, 1,
0.234771, 0.8047179, -0.2536929, 0, 0.4117647, 1, 1,
0.2358163, 0.4239897, 0.4237562, 0, 0.4078431, 1, 1,
0.2392467, -1.306599, 4.281189, 0, 0.4, 1, 1,
0.2399062, -1.294827, 3.968885, 0, 0.3921569, 1, 1,
0.2401269, -0.173122, 2.95074, 0, 0.3882353, 1, 1,
0.2414223, -0.122554, 0.9881223, 0, 0.3803922, 1, 1,
0.2428775, 0.1612315, 2.778474, 0, 0.3764706, 1, 1,
0.2429437, -0.5086901, 3.902898, 0, 0.3686275, 1, 1,
0.2434377, -0.8663524, 4.472863, 0, 0.3647059, 1, 1,
0.2479705, 0.4473132, 0.1813267, 0, 0.3568628, 1, 1,
0.2516367, -0.5302333, 2.692638, 0, 0.3529412, 1, 1,
0.2558831, -2.077907, 0.6189921, 0, 0.345098, 1, 1,
0.2570523, -0.9267423, 3.513032, 0, 0.3411765, 1, 1,
0.2594661, -0.396773, 2.495351, 0, 0.3333333, 1, 1,
0.2668311, 0.01428982, 2.856583, 0, 0.3294118, 1, 1,
0.267022, -0.1052458, 1.423961, 0, 0.3215686, 1, 1,
0.2711695, 0.1614244, -0.7273948, 0, 0.3176471, 1, 1,
0.2716416, -0.7800511, 4.767219, 0, 0.3098039, 1, 1,
0.2736319, 1.342886, 0.2216772, 0, 0.3058824, 1, 1,
0.2745045, -1.846249, 1.761904, 0, 0.2980392, 1, 1,
0.2815004, 0.8485356, 1.79014, 0, 0.2901961, 1, 1,
0.28521, -0.03240384, 1.102869, 0, 0.2862745, 1, 1,
0.2891934, -1.406082, 3.109913, 0, 0.2784314, 1, 1,
0.2892949, 0.6720746, 1.372088, 0, 0.2745098, 1, 1,
0.2895167, 0.1977476, 1.909371, 0, 0.2666667, 1, 1,
0.2898966, 1.712646, 0.8039089, 0, 0.2627451, 1, 1,
0.291973, -0.5775674, 1.913171, 0, 0.254902, 1, 1,
0.2921718, -0.5170305, 4.246367, 0, 0.2509804, 1, 1,
0.2958239, 0.1715889, 1.938191, 0, 0.2431373, 1, 1,
0.2968362, -1.046375, 2.862059, 0, 0.2392157, 1, 1,
0.3003226, 0.7051927, 0.1236304, 0, 0.2313726, 1, 1,
0.3030453, 0.103154, 0.6898367, 0, 0.227451, 1, 1,
0.3069498, -1.07975, 2.8379, 0, 0.2196078, 1, 1,
0.3154453, -1.139277, 2.873797, 0, 0.2156863, 1, 1,
0.3227329, 1.017003, 0.2050796, 0, 0.2078431, 1, 1,
0.3249553, -0.6351504, 2.524778, 0, 0.2039216, 1, 1,
0.3261211, 0.5961373, 0.6727213, 0, 0.1960784, 1, 1,
0.3277059, -1.246782, 3.321942, 0, 0.1882353, 1, 1,
0.3280354, -0.3346874, 1.259352, 0, 0.1843137, 1, 1,
0.3299559, -1.674232, 3.81806, 0, 0.1764706, 1, 1,
0.3303275, 2.037419, 0.2251081, 0, 0.172549, 1, 1,
0.3305281, 0.4971528, 0.4110101, 0, 0.1647059, 1, 1,
0.3364445, -0.4054057, 2.866908, 0, 0.1607843, 1, 1,
0.3379189, -0.140883, 1.077686, 0, 0.1529412, 1, 1,
0.3388008, 0.6722285, 1.738241, 0, 0.1490196, 1, 1,
0.3403587, -0.8949551, 2.257905, 0, 0.1411765, 1, 1,
0.3415776, -0.5905071, 2.50361, 0, 0.1372549, 1, 1,
0.3478635, -0.1352898, 1.986078, 0, 0.1294118, 1, 1,
0.348789, -0.8544275, 3.445011, 0, 0.1254902, 1, 1,
0.3557112, -0.7451953, 3.010864, 0, 0.1176471, 1, 1,
0.3589377, 0.2784103, 0.3855057, 0, 0.1137255, 1, 1,
0.369013, 0.6617176, -0.2298592, 0, 0.1058824, 1, 1,
0.3716737, -0.2077777, 1.516108, 0, 0.09803922, 1, 1,
0.3752759, 1.896251, 0.7431432, 0, 0.09411765, 1, 1,
0.3768435, -0.01930598, 1.193969, 0, 0.08627451, 1, 1,
0.3801989, -1.392536, 3.251838, 0, 0.08235294, 1, 1,
0.3833741, 1.9583, -0.2092715, 0, 0.07450981, 1, 1,
0.3911278, 1.023407, -0.6011909, 0, 0.07058824, 1, 1,
0.3929716, 0.2335799, 0.005171718, 0, 0.0627451, 1, 1,
0.3947842, -0.1910803, 1.291552, 0, 0.05882353, 1, 1,
0.3980027, 1.579395, 2.122365, 0, 0.05098039, 1, 1,
0.403978, 0.2223651, 2.112586, 0, 0.04705882, 1, 1,
0.4055791, -1.018799, 2.964522, 0, 0.03921569, 1, 1,
0.406367, -0.4612732, 3.445146, 0, 0.03529412, 1, 1,
0.4129969, -0.2366657, 0.8777171, 0, 0.02745098, 1, 1,
0.4157737, 0.04549896, 2.918702, 0, 0.02352941, 1, 1,
0.4177956, -0.9464462, 2.478339, 0, 0.01568628, 1, 1,
0.4208181, -0.03008206, 2.159636, 0, 0.01176471, 1, 1,
0.4282866, -1.651032, 1.758443, 0, 0.003921569, 1, 1,
0.4303657, -0.9415842, 2.486531, 0.003921569, 0, 1, 1,
0.4316768, -1.247169, 3.561715, 0.007843138, 0, 1, 1,
0.4403206, 0.5079282, 2.408131, 0.01568628, 0, 1, 1,
0.4423256, -0.1865584, 2.558228, 0.01960784, 0, 1, 1,
0.4438229, -0.03743022, 1.335877, 0.02745098, 0, 1, 1,
0.4438434, -1.575686, 3.950519, 0.03137255, 0, 1, 1,
0.445985, -1.151434, 2.424151, 0.03921569, 0, 1, 1,
0.4461117, -1.111636, 3.644783, 0.04313726, 0, 1, 1,
0.4469961, -1.38464, 3.352399, 0.05098039, 0, 1, 1,
0.4498193, -0.3585035, -0.04098807, 0.05490196, 0, 1, 1,
0.4533047, 0.5117396, 0.9725829, 0.0627451, 0, 1, 1,
0.453323, -1.555203, 3.372849, 0.06666667, 0, 1, 1,
0.4580316, 0.07533979, 0.8528585, 0.07450981, 0, 1, 1,
0.4588436, 1.41116, 0.06843765, 0.07843138, 0, 1, 1,
0.4600971, 0.03673127, 2.861171, 0.08627451, 0, 1, 1,
0.4603696, 1.343593, 0.9508305, 0.09019608, 0, 1, 1,
0.4644522, -2.681741, 4.29051, 0.09803922, 0, 1, 1,
0.4687805, 0.2599963, 0.6836073, 0.1058824, 0, 1, 1,
0.4748313, -0.5683214, 2.558508, 0.1098039, 0, 1, 1,
0.4772024, -0.02337567, 2.141386, 0.1176471, 0, 1, 1,
0.4779734, -0.5203677, 1.06219, 0.1215686, 0, 1, 1,
0.4802456, -0.03319352, 1.975881, 0.1294118, 0, 1, 1,
0.4852782, -1.337965, 4.063444, 0.1333333, 0, 1, 1,
0.4907046, 0.5563068, -0.5927566, 0.1411765, 0, 1, 1,
0.4920079, -0.525582, 2.419364, 0.145098, 0, 1, 1,
0.4923651, -0.07660428, 0.9800168, 0.1529412, 0, 1, 1,
0.4929892, -0.8724963, 3.411613, 0.1568628, 0, 1, 1,
0.5019271, -0.09151778, 1.77616, 0.1647059, 0, 1, 1,
0.5081055, -1.657176, 3.606231, 0.1686275, 0, 1, 1,
0.5152152, 0.8931439, -0.006042976, 0.1764706, 0, 1, 1,
0.5154758, 0.7376758, 1.560019, 0.1803922, 0, 1, 1,
0.5174474, 0.2986438, 0.1957519, 0.1882353, 0, 1, 1,
0.5211249, 1.228245, -0.4983729, 0.1921569, 0, 1, 1,
0.5235946, 0.6642433, 1.921853, 0.2, 0, 1, 1,
0.5256963, 0.5270805, 0.946219, 0.2078431, 0, 1, 1,
0.5340989, -0.9937705, 5.247849, 0.2117647, 0, 1, 1,
0.5400951, -0.7526515, 1.539614, 0.2196078, 0, 1, 1,
0.5432367, -0.2200445, 0.2693138, 0.2235294, 0, 1, 1,
0.5450519, -0.3918976, 2.722494, 0.2313726, 0, 1, 1,
0.5462155, 0.5459329, 1.450704, 0.2352941, 0, 1, 1,
0.5471221, 0.126089, 1.645357, 0.2431373, 0, 1, 1,
0.5526648, 0.1313881, 2.157043, 0.2470588, 0, 1, 1,
0.5531471, 2.191601, 0.01356951, 0.254902, 0, 1, 1,
0.5553759, -0.1075012, 0.8751243, 0.2588235, 0, 1, 1,
0.5590261, 1.287149, -0.3657846, 0.2666667, 0, 1, 1,
0.5672733, 0.4628304, -0.02820088, 0.2705882, 0, 1, 1,
0.5680855, 0.3617615, -0.8804341, 0.2784314, 0, 1, 1,
0.5687485, -1.165708, 3.332278, 0.282353, 0, 1, 1,
0.5690902, -0.2404561, 2.35203, 0.2901961, 0, 1, 1,
0.5771755, 0.2766426, 2.030612, 0.2941177, 0, 1, 1,
0.5787975, 1.917561, 0.4510061, 0.3019608, 0, 1, 1,
0.5788617, -0.3397124, 2.391736, 0.3098039, 0, 1, 1,
0.5791346, 0.562818, -0.03394029, 0.3137255, 0, 1, 1,
0.5843847, -0.3190995, 2.359238, 0.3215686, 0, 1, 1,
0.5858284, -1.453981, 2.068181, 0.3254902, 0, 1, 1,
0.591866, 0.5069392, 0.2370096, 0.3333333, 0, 1, 1,
0.5937421, -2.405153, 3.4163, 0.3372549, 0, 1, 1,
0.5951194, -0.5452071, 1.610008, 0.345098, 0, 1, 1,
0.5957276, 0.391048, -0.2634124, 0.3490196, 0, 1, 1,
0.5993201, 1.262208, 1.656164, 0.3568628, 0, 1, 1,
0.6009998, -0.08228675, 0.2640201, 0.3607843, 0, 1, 1,
0.60553, -1.176664, 1.951715, 0.3686275, 0, 1, 1,
0.6076919, 0.4848822, -0.9150429, 0.372549, 0, 1, 1,
0.6091313, -0.2443436, 2.316231, 0.3803922, 0, 1, 1,
0.6111783, 0.5793883, 0.3872388, 0.3843137, 0, 1, 1,
0.6123058, 0.02438136, 1.65526, 0.3921569, 0, 1, 1,
0.6147352, 0.0004802801, 1.556789, 0.3960784, 0, 1, 1,
0.618827, -0.06301691, 1.879424, 0.4039216, 0, 1, 1,
0.6201287, -0.5692007, 2.23361, 0.4117647, 0, 1, 1,
0.6255322, 1.301416, -0.2783676, 0.4156863, 0, 1, 1,
0.6284174, 2.434791, 1.757792, 0.4235294, 0, 1, 1,
0.6286008, -1.318492, 1.415994, 0.427451, 0, 1, 1,
0.6291729, -0.05271255, 3.390467, 0.4352941, 0, 1, 1,
0.6383085, 1.649047, -0.9188668, 0.4392157, 0, 1, 1,
0.6388633, 0.08103765, 0.3444588, 0.4470588, 0, 1, 1,
0.639571, 0.009715819, 1.333715, 0.4509804, 0, 1, 1,
0.6409025, 2.158718, 0.4612359, 0.4588235, 0, 1, 1,
0.6461008, -0.1720355, 2.052696, 0.4627451, 0, 1, 1,
0.646921, 1.1084, -0.6722706, 0.4705882, 0, 1, 1,
0.6482739, -2.40026, 3.64794, 0.4745098, 0, 1, 1,
0.6587064, 0.7221599, -0.5831447, 0.4823529, 0, 1, 1,
0.6588098, 2.175382, -0.4760814, 0.4862745, 0, 1, 1,
0.6609964, 0.4112145, -0.3688584, 0.4941176, 0, 1, 1,
0.6648907, -0.9151351, 2.557983, 0.5019608, 0, 1, 1,
0.6649141, 1.31247, 0.222796, 0.5058824, 0, 1, 1,
0.668954, -1.125992, 3.311243, 0.5137255, 0, 1, 1,
0.6781936, 0.669755, -0.1882071, 0.5176471, 0, 1, 1,
0.680328, -0.3727894, 0.7595591, 0.5254902, 0, 1, 1,
0.68072, 0.1048276, 0.5943274, 0.5294118, 0, 1, 1,
0.6868032, 0.4147477, 1.138446, 0.5372549, 0, 1, 1,
0.689283, 0.05857215, 1.204372, 0.5411765, 0, 1, 1,
0.6893207, -0.4782923, 2.425116, 0.5490196, 0, 1, 1,
0.6943752, -0.1273809, 2.166747, 0.5529412, 0, 1, 1,
0.6949815, 0.5261342, 1.837141, 0.5607843, 0, 1, 1,
0.6980727, 0.6508488, 2.030422, 0.5647059, 0, 1, 1,
0.6983625, -1.330761, 3.713214, 0.572549, 0, 1, 1,
0.7032972, -0.6108986, 1.908935, 0.5764706, 0, 1, 1,
0.7059304, 0.5478814, 1.576006, 0.5843138, 0, 1, 1,
0.7069228, 1.936095, 1.043652, 0.5882353, 0, 1, 1,
0.718645, 0.882416, -0.2650662, 0.5960785, 0, 1, 1,
0.7204872, -0.531671, 2.212105, 0.6039216, 0, 1, 1,
0.7207606, -0.7097469, 2.721386, 0.6078432, 0, 1, 1,
0.7221627, -0.03239425, 1.575092, 0.6156863, 0, 1, 1,
0.7287391, -1.427854, 1.354258, 0.6196079, 0, 1, 1,
0.7372741, 1.069618, 0.09013388, 0.627451, 0, 1, 1,
0.7373306, -1.153597, 2.161944, 0.6313726, 0, 1, 1,
0.7461349, -0.1789439, 2.122996, 0.6392157, 0, 1, 1,
0.7474291, 0.4904338, 0.5018836, 0.6431373, 0, 1, 1,
0.7510044, -0.4554597, 1.474981, 0.6509804, 0, 1, 1,
0.7524152, -0.3256236, 1.145357, 0.654902, 0, 1, 1,
0.7532963, 0.4117577, 1.440075, 0.6627451, 0, 1, 1,
0.7537449, -0.3519753, 0.6334158, 0.6666667, 0, 1, 1,
0.7551719, 0.5379148, 0.598969, 0.6745098, 0, 1, 1,
0.758949, 0.7224857, 2.809041, 0.6784314, 0, 1, 1,
0.7781225, -1.141584, 4.37844, 0.6862745, 0, 1, 1,
0.7832465, -0.4932748, 3.525443, 0.6901961, 0, 1, 1,
0.7835928, 1.003975, -1.261441, 0.6980392, 0, 1, 1,
0.793512, 0.406367, 1.73061, 0.7058824, 0, 1, 1,
0.7952078, 1.15593, 1.063774, 0.7098039, 0, 1, 1,
0.8039345, 1.348964, -1.025456, 0.7176471, 0, 1, 1,
0.8054982, 0.8790697, 1.190856, 0.7215686, 0, 1, 1,
0.8086139, 0.07313442, 0.662015, 0.7294118, 0, 1, 1,
0.8105946, -0.9763539, 3.474151, 0.7333333, 0, 1, 1,
0.8180681, 0.7233851, 0.8816302, 0.7411765, 0, 1, 1,
0.8232315, 0.1267021, 1.32699, 0.7450981, 0, 1, 1,
0.8284243, -0.5828497, 1.82848, 0.7529412, 0, 1, 1,
0.8285694, 0.7401863, 0.7874924, 0.7568628, 0, 1, 1,
0.8362581, 0.3529139, 1.617429, 0.7647059, 0, 1, 1,
0.8383373, -1.701724, 1.948844, 0.7686275, 0, 1, 1,
0.838774, 0.2337572, 2.239928, 0.7764706, 0, 1, 1,
0.8402057, -0.08099026, 2.329068, 0.7803922, 0, 1, 1,
0.8438655, 0.9319105, 0.3305508, 0.7882353, 0, 1, 1,
0.8471448, 1.226666, 0.5056858, 0.7921569, 0, 1, 1,
0.8529612, -0.563527, 3.189126, 0.8, 0, 1, 1,
0.8553441, -0.4784793, 0.2108373, 0.8078431, 0, 1, 1,
0.8564256, 0.785364, -1.180698, 0.8117647, 0, 1, 1,
0.8649039, -0.2963063, -0.6506037, 0.8196079, 0, 1, 1,
0.8699985, 0.1230579, -0.4127617, 0.8235294, 0, 1, 1,
0.8704751, 1.266044, 0.6272506, 0.8313726, 0, 1, 1,
0.8716731, 0.8319165, 1.838277, 0.8352941, 0, 1, 1,
0.8815182, -0.2135298, 0.1896133, 0.8431373, 0, 1, 1,
0.884198, -1.418417, 2.134778, 0.8470588, 0, 1, 1,
0.8847856, -0.1539053, 1.285547, 0.854902, 0, 1, 1,
0.8850578, -1.142848, 1.874789, 0.8588235, 0, 1, 1,
0.8852851, 1.56936, 0.2330524, 0.8666667, 0, 1, 1,
0.8855489, -0.8891395, 3.866228, 0.8705882, 0, 1, 1,
0.8899881, 1.419567, -0.335085, 0.8784314, 0, 1, 1,
0.8944831, -0.9700646, 1.528061, 0.8823529, 0, 1, 1,
0.8955482, -0.3415893, 0.8981734, 0.8901961, 0, 1, 1,
0.8959306, -0.1518584, 2.686946, 0.8941177, 0, 1, 1,
0.8977823, 1.269613, -1.647961, 0.9019608, 0, 1, 1,
0.9016045, 1.760642, 0.9330822, 0.9098039, 0, 1, 1,
0.9035445, 0.3311835, 1.077787, 0.9137255, 0, 1, 1,
0.9067797, -1.06602, 2.780046, 0.9215686, 0, 1, 1,
0.9086485, -1.270787, 2.229765, 0.9254902, 0, 1, 1,
0.9126077, -1.265838, 1.828345, 0.9333333, 0, 1, 1,
0.9234639, 0.1541188, 2.104944, 0.9372549, 0, 1, 1,
0.9265283, 0.3409842, 1.103391, 0.945098, 0, 1, 1,
0.9271663, -0.1940294, 2.303716, 0.9490196, 0, 1, 1,
0.9279094, -1.338323, 0.9584674, 0.9568627, 0, 1, 1,
0.9294375, -0.9833657, 2.415964, 0.9607843, 0, 1, 1,
0.929668, 0.1349666, 3.462979, 0.9686275, 0, 1, 1,
0.9354049, -1.09712, 2.730243, 0.972549, 0, 1, 1,
0.9399101, -2.941905, 3.75386, 0.9803922, 0, 1, 1,
0.9473396, -1.256027, 0.9465728, 0.9843137, 0, 1, 1,
0.958071, -1.19041, 1.868596, 0.9921569, 0, 1, 1,
0.9597703, -0.6758143, 2.507377, 0.9960784, 0, 1, 1,
0.9666052, 0.9908362, 1.429096, 1, 0, 0.9960784, 1,
0.9675487, 1.480241, -1.854106, 1, 0, 0.9882353, 1,
0.9682757, -0.7552153, 1.454849, 1, 0, 0.9843137, 1,
0.9688308, -0.1418776, -0.1488584, 1, 0, 0.9764706, 1,
0.9708987, -0.337592, 0.9153306, 1, 0, 0.972549, 1,
0.9744057, 1.467406, 1.810021, 1, 0, 0.9647059, 1,
0.9745831, 0.4427277, 1.138226, 1, 0, 0.9607843, 1,
0.9824774, -1.400269, 1.572608, 1, 0, 0.9529412, 1,
0.9840138, -1.707608, 1.867251, 1, 0, 0.9490196, 1,
0.9920898, 2.03294, -0.6796041, 1, 0, 0.9411765, 1,
0.9933112, 0.4180791, -0.2949443, 1, 0, 0.9372549, 1,
0.99341, 1.725307, 0.2981591, 1, 0, 0.9294118, 1,
0.9935391, 0.6686383, 0.4777209, 1, 0, 0.9254902, 1,
0.9943902, -0.6055076, 2.642545, 1, 0, 0.9176471, 1,
0.997481, -0.8248587, 2.161268, 1, 0, 0.9137255, 1,
1.000339, -0.2435771, 2.549745, 1, 0, 0.9058824, 1,
1.008263, 0.2288586, 1.848282, 1, 0, 0.9019608, 1,
1.014913, -1.77283, 2.203375, 1, 0, 0.8941177, 1,
1.0163, 0.3870896, 0.394388, 1, 0, 0.8862745, 1,
1.028726, -1.631786, 1.917616, 1, 0, 0.8823529, 1,
1.029211, 0.03568618, 1.565245, 1, 0, 0.8745098, 1,
1.034423, 0.5860589, 1.456026, 1, 0, 0.8705882, 1,
1.043707, -0.4517266, 0.6779115, 1, 0, 0.8627451, 1,
1.052354, -2.509359, 2.574325, 1, 0, 0.8588235, 1,
1.057016, 0.8408684, 0.8538207, 1, 0, 0.8509804, 1,
1.06026, -0.05550096, 0.1708123, 1, 0, 0.8470588, 1,
1.062522, -0.5267088, 3.324376, 1, 0, 0.8392157, 1,
1.069814, -0.9458234, 2.375402, 1, 0, 0.8352941, 1,
1.071371, 1.298695, 0.2667019, 1, 0, 0.827451, 1,
1.079758, 0.2562386, 0.896516, 1, 0, 0.8235294, 1,
1.08252, -1.482701, 1.882107, 1, 0, 0.8156863, 1,
1.082875, 0.3941227, 0.7946566, 1, 0, 0.8117647, 1,
1.083178, -0.7193999, 3.928793, 1, 0, 0.8039216, 1,
1.085365, 0.8828608, 0.6463044, 1, 0, 0.7960784, 1,
1.088468, -0.1785268, 2.431954, 1, 0, 0.7921569, 1,
1.093744, 0.1559597, 2.001785, 1, 0, 0.7843137, 1,
1.106953, -0.9556292, 2.821357, 1, 0, 0.7803922, 1,
1.107146, -0.3188131, 2.353077, 1, 0, 0.772549, 1,
1.10924, -0.2063754, 2.196393, 1, 0, 0.7686275, 1,
1.109916, -0.8549108, 4.313806, 1, 0, 0.7607843, 1,
1.111457, -0.04666095, 0.9243805, 1, 0, 0.7568628, 1,
1.118208, -0.1429194, 3.726985, 1, 0, 0.7490196, 1,
1.119003, 0.5864317, 1.336837, 1, 0, 0.7450981, 1,
1.12279, -1.031796, 2.470896, 1, 0, 0.7372549, 1,
1.128186, -0.5674685, 1.999949, 1, 0, 0.7333333, 1,
1.132124, 0.2510222, 0.3332434, 1, 0, 0.7254902, 1,
1.1452, -0.01316023, 2.336573, 1, 0, 0.7215686, 1,
1.148487, 0.2918796, 1.17339, 1, 0, 0.7137255, 1,
1.149803, -1.148747, 2.615529, 1, 0, 0.7098039, 1,
1.162673, 1.478999, 0.6880116, 1, 0, 0.7019608, 1,
1.181882, 0.8694795, -0.01631083, 1, 0, 0.6941177, 1,
1.185214, -1.225344, 3.82428, 1, 0, 0.6901961, 1,
1.185495, 0.125045, 0.551405, 1, 0, 0.682353, 1,
1.189865, -0.8726141, 2.708418, 1, 0, 0.6784314, 1,
1.202488, -0.7253662, 2.660011, 1, 0, 0.6705883, 1,
1.206269, -0.01971504, 1.079354, 1, 0, 0.6666667, 1,
1.209033, -0.08913472, 1.881233, 1, 0, 0.6588235, 1,
1.217863, 0.3079791, 1.761259, 1, 0, 0.654902, 1,
1.225157, -0.76332, 0.9768011, 1, 0, 0.6470588, 1,
1.22872, -0.08724219, 2.328513, 1, 0, 0.6431373, 1,
1.234929, 1.413611, 0.3129011, 1, 0, 0.6352941, 1,
1.236699, -0.690697, -0.1046715, 1, 0, 0.6313726, 1,
1.240621, -1.005157, 1.346828, 1, 0, 0.6235294, 1,
1.251544, -0.13235, 0.3519382, 1, 0, 0.6196079, 1,
1.255099, 0.7248936, 0.8117598, 1, 0, 0.6117647, 1,
1.255245, 1.08964, 1.602897, 1, 0, 0.6078432, 1,
1.256771, -0.3423153, 0.6097982, 1, 0, 0.6, 1,
1.258267, -1.632172, 2.43666, 1, 0, 0.5921569, 1,
1.260725, -0.9101641, 2.420617, 1, 0, 0.5882353, 1,
1.261849, -0.04915911, 0.7093417, 1, 0, 0.5803922, 1,
1.264447, 0.7328188, 1.564964, 1, 0, 0.5764706, 1,
1.265201, 0.01810255, 0.4133363, 1, 0, 0.5686275, 1,
1.271924, 1.052218, 1.404095, 1, 0, 0.5647059, 1,
1.27387, -2.154423, 3.455463, 1, 0, 0.5568628, 1,
1.275311, -1.933002, 4.246847, 1, 0, 0.5529412, 1,
1.28626, 3.102798, 2.461952, 1, 0, 0.5450981, 1,
1.293673, -0.5304365, 1.201928, 1, 0, 0.5411765, 1,
1.2958, -1.691444, 2.386449, 1, 0, 0.5333334, 1,
1.302827, -0.1078935, 1.154802, 1, 0, 0.5294118, 1,
1.304008, -0.6986384, 2.691582, 1, 0, 0.5215687, 1,
1.315184, -0.3322905, 1.216666, 1, 0, 0.5176471, 1,
1.315199, 0.6474537, 1.860846, 1, 0, 0.509804, 1,
1.316023, 0.6385089, 2.344702, 1, 0, 0.5058824, 1,
1.325365, -0.816156, 0.9283421, 1, 0, 0.4980392, 1,
1.328023, -0.8867441, 2.622082, 1, 0, 0.4901961, 1,
1.334208, -1.972824, 2.793979, 1, 0, 0.4862745, 1,
1.343615, 1.806419, -0.9513841, 1, 0, 0.4784314, 1,
1.343717, -0.1644112, 0.7420095, 1, 0, 0.4745098, 1,
1.350656, 0.05537942, 0.5158203, 1, 0, 0.4666667, 1,
1.358515, 0.7831445, -1.103097, 1, 0, 0.4627451, 1,
1.368651, 0.6955582, 2.240602, 1, 0, 0.454902, 1,
1.381431, -0.1922589, 0.8799415, 1, 0, 0.4509804, 1,
1.397242, -0.6481047, 3.157929, 1, 0, 0.4431373, 1,
1.403609, 0.5514681, 0.8585455, 1, 0, 0.4392157, 1,
1.407871, -1.769425, 2.043581, 1, 0, 0.4313726, 1,
1.42601, -0.106537, 1.324253, 1, 0, 0.427451, 1,
1.43386, 1.937999, -0.7184344, 1, 0, 0.4196078, 1,
1.433862, -1.054122, 2.308947, 1, 0, 0.4156863, 1,
1.434974, -1.210888, 3.158111, 1, 0, 0.4078431, 1,
1.435683, 1.628421, 1.549094, 1, 0, 0.4039216, 1,
1.438991, -1.140733, 1.223168, 1, 0, 0.3960784, 1,
1.444785, 0.3115626, 2.249517, 1, 0, 0.3882353, 1,
1.454912, -2.057681, 4.873339, 1, 0, 0.3843137, 1,
1.467597, -0.8987775, 2.716549, 1, 0, 0.3764706, 1,
1.468678, -0.7636982, 1.49184, 1, 0, 0.372549, 1,
1.477447, 1.865864, -0.6163159, 1, 0, 0.3647059, 1,
1.483268, 0.7968653, 1.092947, 1, 0, 0.3607843, 1,
1.49036, 0.2053831, 0.7377104, 1, 0, 0.3529412, 1,
1.501647, 1.181793, 0.3340031, 1, 0, 0.3490196, 1,
1.508222, -0.5262829, 0.01584039, 1, 0, 0.3411765, 1,
1.520568, 1.736926, 1.344146, 1, 0, 0.3372549, 1,
1.523574, 1.2983, 1.072348, 1, 0, 0.3294118, 1,
1.524693, -0.4922577, 1.281894, 1, 0, 0.3254902, 1,
1.529682, -0.2190841, 1.342651, 1, 0, 0.3176471, 1,
1.546171, 0.5568318, 1.83226, 1, 0, 0.3137255, 1,
1.550048, -0.2027509, 0.8219069, 1, 0, 0.3058824, 1,
1.560765, -0.249666, 1.655933, 1, 0, 0.2980392, 1,
1.565358, 0.3879713, 3.718913, 1, 0, 0.2941177, 1,
1.566503, -1.033259, 2.4175, 1, 0, 0.2862745, 1,
1.568784, -0.837549, 2.055542, 1, 0, 0.282353, 1,
1.576087, 0.4147908, 1.135068, 1, 0, 0.2745098, 1,
1.582108, 0.8069881, 1.273143, 1, 0, 0.2705882, 1,
1.588207, 0.09953597, 1.481352, 1, 0, 0.2627451, 1,
1.588397, -0.3311709, 0.8207669, 1, 0, 0.2588235, 1,
1.592632, -0.7767467, 1.47784, 1, 0, 0.2509804, 1,
1.593691, -1.272598, 2.647413, 1, 0, 0.2470588, 1,
1.597668, 0.04041851, 2.461432, 1, 0, 0.2392157, 1,
1.620989, -1.058501, 1.603962, 1, 0, 0.2352941, 1,
1.623007, 0.9476569, 1.40612, 1, 0, 0.227451, 1,
1.627346, 0.009488405, 1.21659, 1, 0, 0.2235294, 1,
1.628022, -1.151226, 1.596378, 1, 0, 0.2156863, 1,
1.628745, 0.692789, 0.4459976, 1, 0, 0.2117647, 1,
1.631691, 0.5724517, 2.128934, 1, 0, 0.2039216, 1,
1.663234, -0.342324, 1.468947, 1, 0, 0.1960784, 1,
1.673579, -0.904045, 1.533137, 1, 0, 0.1921569, 1,
1.681491, -1.119984, 2.207969, 1, 0, 0.1843137, 1,
1.723322, 0.2088611, 3.027286, 1, 0, 0.1803922, 1,
1.72387, -0.05966484, 1.723795, 1, 0, 0.172549, 1,
1.768896, -0.8152022, 2.164505, 1, 0, 0.1686275, 1,
1.793755, -0.9433293, 2.613357, 1, 0, 0.1607843, 1,
1.822535, 1.543823, -0.4068701, 1, 0, 0.1568628, 1,
1.828166, 0.05314915, 0.8687063, 1, 0, 0.1490196, 1,
1.867812, -1.211487, 2.128521, 1, 0, 0.145098, 1,
1.914202, 1.330884, 2.76772, 1, 0, 0.1372549, 1,
1.945669, -0.1797343, 0.06810851, 1, 0, 0.1333333, 1,
1.949186, 1.303465, 2.537771, 1, 0, 0.1254902, 1,
1.96026, 0.7786608, -0.8732145, 1, 0, 0.1215686, 1,
1.962573, 0.7629766, 2.707052, 1, 0, 0.1137255, 1,
1.968498, -0.0544213, 0.7904673, 1, 0, 0.1098039, 1,
1.986752, -0.5827156, 1.854511, 1, 0, 0.1019608, 1,
1.987151, 1.914544, -0.07475634, 1, 0, 0.09411765, 1,
2.034247, -0.01178447, 0.8575593, 1, 0, 0.09019608, 1,
2.037205, -1.733099, 2.245658, 1, 0, 0.08235294, 1,
2.085254, -0.2476163, 1.484579, 1, 0, 0.07843138, 1,
2.085321, -2.020829, 0.4969837, 1, 0, 0.07058824, 1,
2.131042, 0.977696, 0.6186635, 1, 0, 0.06666667, 1,
2.229789, 0.7801626, 0.963701, 1, 0, 0.05882353, 1,
2.27042, -0.3297843, 3.188004, 1, 0, 0.05490196, 1,
2.284831, -0.9761095, 2.361593, 1, 0, 0.04705882, 1,
2.316864, -0.4441619, 2.831094, 1, 0, 0.04313726, 1,
2.374479, -0.3661951, 2.31267, 1, 0, 0.03529412, 1,
2.542911, -1.564429, 3.064386, 1, 0, 0.03137255, 1,
2.560683, 0.5613576, 2.224725, 1, 0, 0.02352941, 1,
2.59352, -1.164103, 0.2527433, 1, 0, 0.01960784, 1,
2.901623, -0.3244022, -0.5037074, 1, 0, 0.01176471, 1,
3.348525, 0.7562817, 1.864591, 1, 0, 0.007843138, 1
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
0.3332002, -4.203777, -8.334421, 0, -0.5, 0.5, 0.5,
0.3332002, -4.203777, -8.334421, 1, -0.5, 0.5, 0.5,
0.3332002, -4.203777, -8.334421, 1, 1.5, 0.5, 0.5,
0.3332002, -4.203777, -8.334421, 0, 1.5, 0.5, 0.5
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
-3.70432, -0.02100503, -8.334421, 0, -0.5, 0.5, 0.5,
-3.70432, -0.02100503, -8.334421, 1, -0.5, 0.5, 0.5,
-3.70432, -0.02100503, -8.334421, 1, 1.5, 0.5, 0.5,
-3.70432, -0.02100503, -8.334421, 0, 1.5, 0.5, 0.5
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
-3.70432, -4.203777, -0.4705906, 0, -0.5, 0.5, 0.5,
-3.70432, -4.203777, -0.4705906, 1, -0.5, 0.5, 0.5,
-3.70432, -4.203777, -0.4705906, 1, 1.5, 0.5, 0.5,
-3.70432, -4.203777, -0.4705906, 0, 1.5, 0.5, 0.5
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
-2, -3.238522, -6.519691,
3, -3.238522, -6.519691,
-2, -3.238522, -6.519691,
-2, -3.399397, -6.822146,
-1, -3.238522, -6.519691,
-1, -3.399397, -6.822146,
0, -3.238522, -6.519691,
0, -3.399397, -6.822146,
1, -3.238522, -6.519691,
1, -3.399397, -6.822146,
2, -3.238522, -6.519691,
2, -3.399397, -6.822146,
3, -3.238522, -6.519691,
3, -3.399397, -6.822146
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
-2, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
-2, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
-2, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
-2, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5,
-1, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
-1, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
-1, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
-1, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5,
0, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
0, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
0, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
0, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5,
1, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
1, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
1, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
1, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5,
2, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
2, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
2, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
2, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5,
3, -3.721149, -7.427056, 0, -0.5, 0.5, 0.5,
3, -3.721149, -7.427056, 1, -0.5, 0.5, 0.5,
3, -3.721149, -7.427056, 1, 1.5, 0.5, 0.5,
3, -3.721149, -7.427056, 0, 1.5, 0.5, 0.5
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
-2.772584, -3, -6.519691,
-2.772584, 3, -6.519691,
-2.772584, -3, -6.519691,
-2.927874, -3, -6.822146,
-2.772584, -2, -6.519691,
-2.927874, -2, -6.822146,
-2.772584, -1, -6.519691,
-2.927874, -1, -6.822146,
-2.772584, 0, -6.519691,
-2.927874, 0, -6.822146,
-2.772584, 1, -6.519691,
-2.927874, 1, -6.822146,
-2.772584, 2, -6.519691,
-2.927874, 2, -6.822146,
-2.772584, 3, -6.519691,
-2.927874, 3, -6.822146
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
-3.238452, -3, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, -3, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, -3, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, -3, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, -2, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, -2, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, -2, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, -2, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, -1, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, -1, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, -1, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, -1, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, 0, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, 0, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, 0, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, 0, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, 1, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, 1, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, 1, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, 1, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, 2, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, 2, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, 2, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, 2, -7.427056, 0, 1.5, 0.5, 0.5,
-3.238452, 3, -7.427056, 0, -0.5, 0.5, 0.5,
-3.238452, 3, -7.427056, 1, -0.5, 0.5, 0.5,
-3.238452, 3, -7.427056, 1, 1.5, 0.5, 0.5,
-3.238452, 3, -7.427056, 0, 1.5, 0.5, 0.5
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
-2.772584, -3.238522, -6,
-2.772584, -3.238522, 4,
-2.772584, -3.238522, -6,
-2.927874, -3.399397, -6,
-2.772584, -3.238522, -4,
-2.927874, -3.399397, -4,
-2.772584, -3.238522, -2,
-2.927874, -3.399397, -2,
-2.772584, -3.238522, 0,
-2.927874, -3.399397, 0,
-2.772584, -3.238522, 2,
-2.927874, -3.399397, 2,
-2.772584, -3.238522, 4,
-2.927874, -3.399397, 4
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
"-6",
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
-3.238452, -3.721149, -6, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -6, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -6, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, -6, 0, 1.5, 0.5, 0.5,
-3.238452, -3.721149, -4, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -4, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -4, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, -4, 0, 1.5, 0.5, 0.5,
-3.238452, -3.721149, -2, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -2, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, -2, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, -2, 0, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 0, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 0, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 0, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 0, 0, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 2, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 2, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 2, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 2, 0, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 4, 0, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 4, 1, -0.5, 0.5, 0.5,
-3.238452, -3.721149, 4, 1, 1.5, 0.5, 0.5,
-3.238452, -3.721149, 4, 0, 1.5, 0.5, 0.5
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
-2.772584, -3.238522, -6.519691,
-2.772584, 3.196512, -6.519691,
-2.772584, -3.238522, 5.57851,
-2.772584, 3.196512, 5.57851,
-2.772584, -3.238522, -6.519691,
-2.772584, -3.238522, 5.57851,
-2.772584, 3.196512, -6.519691,
-2.772584, 3.196512, 5.57851,
-2.772584, -3.238522, -6.519691,
3.438985, -3.238522, -6.519691,
-2.772584, -3.238522, 5.57851,
3.438985, -3.238522, 5.57851,
-2.772584, 3.196512, -6.519691,
3.438985, 3.196512, -6.519691,
-2.772584, 3.196512, 5.57851,
3.438985, 3.196512, 5.57851,
3.438985, -3.238522, -6.519691,
3.438985, 3.196512, -6.519691,
3.438985, -3.238522, 5.57851,
3.438985, 3.196512, 5.57851,
3.438985, -3.238522, -6.519691,
3.438985, -3.238522, 5.57851,
3.438985, 3.196512, -6.519691,
3.438985, 3.196512, 5.57851
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
var radius = 8.033874;
var distance = 35.74361;
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
mvMatrix.translate( -0.3332002, 0.02100503, 0.4705906 );
mvMatrix.scale( 1.39842, 1.349858, 0.7179896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74361);
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
Chlorethoxyfos<-read.table("Chlorethoxyfos.xyz")
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
-2.682125, -2.478878, -0.943922, 0, 0, 1, 1, 1,
-2.618062, -0.1225871, -1.385404, 1, 0, 0, 1, 1,
-2.542004, 2.23317, -1.70114, 1, 0, 0, 1, 1,
-2.531894, -0.2563256, -1.473949, 1, 0, 0, 1, 1,
-2.529366, 0.7034417, -1.45197, 1, 0, 0, 1, 1,
-2.50403, 1.167795, -0.4043997, 1, 0, 0, 1, 1,
-2.420302, 0.417955, -1.085059, 0, 0, 0, 1, 1,
-2.409042, 0.2573779, -0.2373136, 0, 0, 0, 1, 1,
-2.404056, 0.8335004, -1.753379, 0, 0, 0, 1, 1,
-2.249211, -0.09135125, -2.53838, 0, 0, 0, 1, 1,
-2.208185, -2.180569, -2.652322, 0, 0, 0, 1, 1,
-2.184911, 0.04792776, -1.03206, 0, 0, 0, 1, 1,
-2.18062, -0.5763352, -2.254437, 0, 0, 0, 1, 1,
-2.141918, -1.543072, -2.983771, 1, 1, 1, 1, 1,
-2.141531, 1.564613, -1.053115, 1, 1, 1, 1, 1,
-2.13939, -1.448891, -2.290209, 1, 1, 1, 1, 1,
-2.117578, 0.5465225, -1.083737, 1, 1, 1, 1, 1,
-2.117066, -0.2204656, 0.9231589, 1, 1, 1, 1, 1,
-2.097785, -0.1466514, -3.829184, 1, 1, 1, 1, 1,
-2.078133, -0.2261547, -1.538526, 1, 1, 1, 1, 1,
-2.077262, -0.3650909, -1.481064, 1, 1, 1, 1, 1,
-2.073423, -0.911107, -1.750577, 1, 1, 1, 1, 1,
-2.072183, 0.03177512, -1.799132, 1, 1, 1, 1, 1,
-2.044248, -1.509452, -3.370032, 1, 1, 1, 1, 1,
-2.036799, 0.03950442, -3.03543, 1, 1, 1, 1, 1,
-1.999861, -0.02098058, -2.082728, 1, 1, 1, 1, 1,
-1.9845, -0.146032, -1.104508, 1, 1, 1, 1, 1,
-1.977536, -1.279601, -3.07681, 1, 1, 1, 1, 1,
-1.959421, 0.2412194, -1.487269, 0, 0, 1, 1, 1,
-1.958987, -1.372394, -3.425118, 1, 0, 0, 1, 1,
-1.948374, -1.570257, -1.319176, 1, 0, 0, 1, 1,
-1.923206, -0.5680977, 0.0932419, 1, 0, 0, 1, 1,
-1.889516, -0.7710256, -2.686925, 1, 0, 0, 1, 1,
-1.858802, -0.185328, -3.291514, 1, 0, 0, 1, 1,
-1.852016, 0.3120486, -0.8650936, 0, 0, 0, 1, 1,
-1.819335, 0.03699381, -0.6368557, 0, 0, 0, 1, 1,
-1.812742, 0.6821126, -1.548663, 0, 0, 0, 1, 1,
-1.811603, -0.7923788, -3.586894, 0, 0, 0, 1, 1,
-1.79431, 2.12675, 0.5636826, 0, 0, 0, 1, 1,
-1.759565, 0.7698053, -0.6831495, 0, 0, 0, 1, 1,
-1.756154, -1.116485, -1.561912, 0, 0, 0, 1, 1,
-1.717207, 0.2535378, 0.1202571, 1, 1, 1, 1, 1,
-1.712606, -2.512084, -3.341349, 1, 1, 1, 1, 1,
-1.712257, 0.2910563, -0.7761494, 1, 1, 1, 1, 1,
-1.704234, 0.586047, -0.8729061, 1, 1, 1, 1, 1,
-1.689416, 1.135101, 1.245325, 1, 1, 1, 1, 1,
-1.677028, -1.980918, -2.942042, 1, 1, 1, 1, 1,
-1.66559, 1.058651, -1.776993, 1, 1, 1, 1, 1,
-1.654569, -0.90819, -2.068048, 1, 1, 1, 1, 1,
-1.628947, -0.09557945, -1.639253, 1, 1, 1, 1, 1,
-1.628726, 0.05088138, -1.316032, 1, 1, 1, 1, 1,
-1.603431, -1.192468, -2.696664, 1, 1, 1, 1, 1,
-1.587325, -2.426192, -2.005828, 1, 1, 1, 1, 1,
-1.579364, -0.2606448, -1.590001, 1, 1, 1, 1, 1,
-1.562052, 0.7198576, -1.186883, 1, 1, 1, 1, 1,
-1.558186, -1.237293, -3.906266, 1, 1, 1, 1, 1,
-1.541963, 0.1792235, -0.6573367, 0, 0, 1, 1, 1,
-1.538877, -0.6468184, -1.952093, 1, 0, 0, 1, 1,
-1.538288, -1.115961, -1.407827, 1, 0, 0, 1, 1,
-1.504508, -0.1010332, -2.324706, 1, 0, 0, 1, 1,
-1.496644, -0.5513278, -0.9815321, 1, 0, 0, 1, 1,
-1.496239, -0.248308, -1.063349, 1, 0, 0, 1, 1,
-1.468105, -0.9535819, -1.66088, 0, 0, 0, 1, 1,
-1.466499, 1.038763, -2.485453, 0, 0, 0, 1, 1,
-1.457424, 0.3822329, -0.6830844, 0, 0, 0, 1, 1,
-1.454839, -0.8706883, -1.945972, 0, 0, 0, 1, 1,
-1.450218, 0.2394184, -2.260978, 0, 0, 0, 1, 1,
-1.448277, -0.5954305, -1.514956, 0, 0, 0, 1, 1,
-1.445845, -0.2371597, -1.559711, 0, 0, 0, 1, 1,
-1.440125, -0.3430263, -0.804952, 1, 1, 1, 1, 1,
-1.439227, -0.4800945, -2.780731, 1, 1, 1, 1, 1,
-1.439171, -0.2552936, -1.729989, 1, 1, 1, 1, 1,
-1.439136, -0.969021, -2.524983, 1, 1, 1, 1, 1,
-1.427183, 1.844258, -0.6773052, 1, 1, 1, 1, 1,
-1.408057, 1.034323, -3.823252, 1, 1, 1, 1, 1,
-1.39597, 0.6215404, -0.9559032, 1, 1, 1, 1, 1,
-1.384762, 0.3661511, -1.265771, 1, 1, 1, 1, 1,
-1.381861, -0.6423115, -2.199117, 1, 1, 1, 1, 1,
-1.381818, -0.228362, -2.79517, 1, 1, 1, 1, 1,
-1.376825, 0.7508477, -1.118506, 1, 1, 1, 1, 1,
-1.370573, -0.3842827, -1.781468, 1, 1, 1, 1, 1,
-1.357267, 0.9539131, -1.172278, 1, 1, 1, 1, 1,
-1.355627, 0.4270004, -0.7802183, 1, 1, 1, 1, 1,
-1.34817, -0.1063185, -1.387572, 1, 1, 1, 1, 1,
-1.334542, 1.771737, -0.965962, 0, 0, 1, 1, 1,
-1.330583, -2.032703, -0.9891401, 1, 0, 0, 1, 1,
-1.316688, -0.8487483, -1.921388, 1, 0, 0, 1, 1,
-1.314501, -0.8575569, -2.766361, 1, 0, 0, 1, 1,
-1.313266, -1.451747, -1.484414, 1, 0, 0, 1, 1,
-1.304817, -1.522924, -2.382178, 1, 0, 0, 1, 1,
-1.293914, -0.2578298, -2.235577, 0, 0, 0, 1, 1,
-1.289753, -0.1669275, -2.079668, 0, 0, 0, 1, 1,
-1.286197, -1.696362, -1.947675, 0, 0, 0, 1, 1,
-1.285773, -1.041989, -3.205103, 0, 0, 0, 1, 1,
-1.2839, 0.3682266, -0.9647821, 0, 0, 0, 1, 1,
-1.281984, -1.633975, -2.008737, 0, 0, 0, 1, 1,
-1.270555, 1.382418, 1.25959, 0, 0, 0, 1, 1,
-1.26958, -1.4108, -0.2025754, 1, 1, 1, 1, 1,
-1.263145, -0.0176826, -3.210627, 1, 1, 1, 1, 1,
-1.262606, -0.2537654, -1.388546, 1, 1, 1, 1, 1,
-1.259443, 0.5520127, 0.1687401, 1, 1, 1, 1, 1,
-1.253618, -1.291512, -1.03433, 1, 1, 1, 1, 1,
-1.247717, 1.347823, -2.557824, 1, 1, 1, 1, 1,
-1.243839, 0.3193484, -1.460774, 1, 1, 1, 1, 1,
-1.232531, 1.98844, 1.10966, 1, 1, 1, 1, 1,
-1.227114, 2.241061, 1.198031, 1, 1, 1, 1, 1,
-1.218345, -1.482184, -3.638368, 1, 1, 1, 1, 1,
-1.2149, -0.8073929, -4.243477, 1, 1, 1, 1, 1,
-1.213088, -1.228713, -2.645357, 1, 1, 1, 1, 1,
-1.208343, 0.2034979, -1.718193, 1, 1, 1, 1, 1,
-1.196025, -0.2336103, -3.537997, 1, 1, 1, 1, 1,
-1.194902, -0.01073144, -1.788212, 1, 1, 1, 1, 1,
-1.194038, -0.6557909, -2.024589, 0, 0, 1, 1, 1,
-1.193081, 1.587435, 1.253899, 1, 0, 0, 1, 1,
-1.181251, 0.02198731, -1.290711, 1, 0, 0, 1, 1,
-1.179481, 1.580653, -0.08016161, 1, 0, 0, 1, 1,
-1.165617, -0.941361, -1.958993, 1, 0, 0, 1, 1,
-1.164159, 1.991702, 0.2089163, 1, 0, 0, 1, 1,
-1.161022, -0.2413503, 0.7897183, 0, 0, 0, 1, 1,
-1.148387, 0.1361519, -1.99595, 0, 0, 0, 1, 1,
-1.147255, 1.695736, -0.7960144, 0, 0, 0, 1, 1,
-1.120035, -0.444976, -2.357864, 0, 0, 0, 1, 1,
-1.11928, -1.185103, -0.9320303, 0, 0, 0, 1, 1,
-1.117704, -0.1888494, -2.367072, 0, 0, 0, 1, 1,
-1.117398, 0.06664164, -2.211395, 0, 0, 0, 1, 1,
-1.115804, -1.350026, -2.112299, 1, 1, 1, 1, 1,
-1.104694, 0.01115993, -0.2927379, 1, 1, 1, 1, 1,
-1.101078, -0.5483198, -1.893485, 1, 1, 1, 1, 1,
-1.100144, 0.5469385, -1.782591, 1, 1, 1, 1, 1,
-1.099698, 1.464668, -0.7796269, 1, 1, 1, 1, 1,
-1.09766, 1.983461, 0.2950158, 1, 1, 1, 1, 1,
-1.094154, 1.424349, -0.8922397, 1, 1, 1, 1, 1,
-1.090797, 1.224858, -2.184648, 1, 1, 1, 1, 1,
-1.08347, 0.06859035, -1.725089, 1, 1, 1, 1, 1,
-1.083255, -0.5043343, -2.34111, 1, 1, 1, 1, 1,
-1.069189, 0.6398078, -3.215618, 1, 1, 1, 1, 1,
-1.06612, -0.3699938, -2.47752, 1, 1, 1, 1, 1,
-1.065421, 0.4162146, -1.250004, 1, 1, 1, 1, 1,
-1.064361, 1.125325, 0.1082522, 1, 1, 1, 1, 1,
-1.061426, 1.823669, -0.2675232, 1, 1, 1, 1, 1,
-1.061094, -0.9021214, -1.004923, 0, 0, 1, 1, 1,
-1.060743, 0.7375919, -0.8433399, 1, 0, 0, 1, 1,
-1.056743, -0.8830115, -3.81422, 1, 0, 0, 1, 1,
-1.054849, 0.1797141, -1.912023, 1, 0, 0, 1, 1,
-1.054503, -0.09652731, -0.8809183, 1, 0, 0, 1, 1,
-1.050383, -0.7384806, -3.089845, 1, 0, 0, 1, 1,
-1.045806, -0.06475189, -2.836936, 0, 0, 0, 1, 1,
-1.045638, 0.362015, -2.044816, 0, 0, 0, 1, 1,
-1.027269, 0.473804, -1.298864, 0, 0, 0, 1, 1,
-1.021749, 0.01587634, -2.009664, 0, 0, 0, 1, 1,
-1.019386, 0.8879752, -0.1209285, 0, 0, 0, 1, 1,
-1.014502, -1.080806, -2.943688, 0, 0, 0, 1, 1,
-1.014087, -0.1432241, -2.72429, 0, 0, 0, 1, 1,
-1.013717, 1.382466, -0.7846736, 1, 1, 1, 1, 1,
-1.012808, 0.7113926, -0.94729, 1, 1, 1, 1, 1,
-1.010898, 0.7290341, -2.030079, 1, 1, 1, 1, 1,
-1.007025, -2.044772, -2.09197, 1, 1, 1, 1, 1,
-1.006653, 0.9375902, -1.279442, 1, 1, 1, 1, 1,
-1.00052, 0.6083076, -0.4321076, 1, 1, 1, 1, 1,
-0.9900736, 0.5181267, -0.3872115, 1, 1, 1, 1, 1,
-0.987753, -2.361441, -2.423841, 1, 1, 1, 1, 1,
-0.9838163, 0.3838346, -3.057187, 1, 1, 1, 1, 1,
-0.9811017, 0.8663112, 1.334353, 1, 1, 1, 1, 1,
-0.9796614, 1.153321, -1.344327, 1, 1, 1, 1, 1,
-0.975116, 2.484345, -0.1420736, 1, 1, 1, 1, 1,
-0.9744954, 1.010665, -2.052514, 1, 1, 1, 1, 1,
-0.9734254, -0.07809684, -0.9163132, 1, 1, 1, 1, 1,
-0.9723993, -1.22829, -0.9870465, 1, 1, 1, 1, 1,
-0.9708728, -0.3831335, -2.723933, 0, 0, 1, 1, 1,
-0.9608499, 1.566809, -0.4631559, 1, 0, 0, 1, 1,
-0.9605794, 1.977555, -0.1119283, 1, 0, 0, 1, 1,
-0.9569249, 1.952204, 0.4383874, 1, 0, 0, 1, 1,
-0.9565865, -0.2787657, -1.530528, 1, 0, 0, 1, 1,
-0.954743, 2.488065, 0.4233828, 1, 0, 0, 1, 1,
-0.9524025, 1.184985, 0.5918015, 0, 0, 0, 1, 1,
-0.9467542, 0.1313124, -1.277509, 0, 0, 0, 1, 1,
-0.946299, 0.3369766, -0.7907881, 0, 0, 0, 1, 1,
-0.9436265, -1.354957, -3.111398, 0, 0, 0, 1, 1,
-0.9424186, 0.9573738, 0.1247889, 0, 0, 0, 1, 1,
-0.9420244, -1.55821, -2.941398, 0, 0, 0, 1, 1,
-0.9375482, 0.6176568, -3.261832, 0, 0, 0, 1, 1,
-0.9346671, 0.2891393, -2.488192, 1, 1, 1, 1, 1,
-0.9340185, -1.912708, -2.872975, 1, 1, 1, 1, 1,
-0.9294953, -1.22869, -1.461354, 1, 1, 1, 1, 1,
-0.9289398, -1.340223, -1.484052, 1, 1, 1, 1, 1,
-0.9271365, 0.2323763, -2.939891, 1, 1, 1, 1, 1,
-0.926635, -0.3271978, -0.8769064, 1, 1, 1, 1, 1,
-0.9258347, 1.716607, -1.633659, 1, 1, 1, 1, 1,
-0.924684, 0.8643642, -0.7729967, 1, 1, 1, 1, 1,
-0.9170467, -0.9664249, -2.772706, 1, 1, 1, 1, 1,
-0.9145208, 0.7807444, -0.6284202, 1, 1, 1, 1, 1,
-0.9074149, 0.2166975, -0.7553733, 1, 1, 1, 1, 1,
-0.9062813, 0.1300845, -1.441206, 1, 1, 1, 1, 1,
-0.9033688, 1.622103, 0.3296341, 1, 1, 1, 1, 1,
-0.8964247, 0.9398019, -0.7308696, 1, 1, 1, 1, 1,
-0.8950084, -0.6599082, -2.984697, 1, 1, 1, 1, 1,
-0.8885344, -0.05737179, -0.9629895, 0, 0, 1, 1, 1,
-0.879357, -0.9475819, -2.612669, 1, 0, 0, 1, 1,
-0.8713014, -1.342825, -3.802711, 1, 0, 0, 1, 1,
-0.8689904, -2.623966, -3.815958, 1, 0, 0, 1, 1,
-0.8689808, -0.5132468, -3.205329, 1, 0, 0, 1, 1,
-0.8664105, -1.624034, -2.911297, 1, 0, 0, 1, 1,
-0.8568792, -0.08660404, -1.732317, 0, 0, 0, 1, 1,
-0.8521398, 0.6449542, -0.5634457, 0, 0, 0, 1, 1,
-0.8511682, 1.325391, -0.005946256, 0, 0, 0, 1, 1,
-0.8398433, -0.9022591, -2.276488, 0, 0, 0, 1, 1,
-0.8347411, 0.4757657, -0.4636825, 0, 0, 0, 1, 1,
-0.8333182, -2.220901, -1.653679, 0, 0, 0, 1, 1,
-0.8299023, 0.4656552, -0.615468, 0, 0, 0, 1, 1,
-0.8273971, 2.222691, 0.8884425, 1, 1, 1, 1, 1,
-0.8270276, -1.255181, -2.606463, 1, 1, 1, 1, 1,
-0.824114, -1.018552, -2.760473, 1, 1, 1, 1, 1,
-0.8202857, 2.036005, 0.08309489, 1, 1, 1, 1, 1,
-0.8183047, 1.389315, -0.4270709, 1, 1, 1, 1, 1,
-0.8160856, 0.8098467, 1.446228, 1, 1, 1, 1, 1,
-0.8151626, -2.375393, -3.542489, 1, 1, 1, 1, 1,
-0.8137648, -1.974157, -1.700143, 1, 1, 1, 1, 1,
-0.8092442, -0.2662633, -2.26193, 1, 1, 1, 1, 1,
-0.8006432, -0.5854213, -3.239202, 1, 1, 1, 1, 1,
-0.7970573, 0.626, -0.2559333, 1, 1, 1, 1, 1,
-0.7964741, 1.470823, 0.156917, 1, 1, 1, 1, 1,
-0.7937289, -0.739482, -2.189098, 1, 1, 1, 1, 1,
-0.7913133, 1.108535, -1.715955, 1, 1, 1, 1, 1,
-0.787568, -0.1628558, -2.153162, 1, 1, 1, 1, 1,
-0.7741706, -1.29329, -1.010657, 0, 0, 1, 1, 1,
-0.7732275, -0.7467785, -2.439935, 1, 0, 0, 1, 1,
-0.769127, 0.7994459, -0.8009136, 1, 0, 0, 1, 1,
-0.7547714, -0.5489051, -2.885667, 1, 0, 0, 1, 1,
-0.7440839, -0.4678472, -2.887708, 1, 0, 0, 1, 1,
-0.7408204, -0.7833402, -1.978607, 1, 0, 0, 1, 1,
-0.7403953, -0.4956861, -3.2872, 0, 0, 0, 1, 1,
-0.7382219, 1.128085, -1.202907, 0, 0, 0, 1, 1,
-0.7374768, 0.3226108, -0.3053885, 0, 0, 0, 1, 1,
-0.7366873, -0.1877957, -2.912021, 0, 0, 0, 1, 1,
-0.7334015, -0.1763455, -1.366879, 0, 0, 0, 1, 1,
-0.7333182, -0.7251483, -2.684495, 0, 0, 0, 1, 1,
-0.7295759, -0.1503188, -3.751025, 0, 0, 0, 1, 1,
-0.727489, 0.4754925, 1.429907, 1, 1, 1, 1, 1,
-0.7173972, -0.4820761, -2.313855, 1, 1, 1, 1, 1,
-0.7169201, 0.1652081, -1.621585, 1, 1, 1, 1, 1,
-0.7161639, 0.3350733, -0.4216227, 1, 1, 1, 1, 1,
-0.7089406, -0.07937168, -0.3275791, 1, 1, 1, 1, 1,
-0.7073985, 0.2471909, -2.17432, 1, 1, 1, 1, 1,
-0.7068178, 1.222174, -0.3694389, 1, 1, 1, 1, 1,
-0.6922752, 1.442165, -1.723284, 1, 1, 1, 1, 1,
-0.6921355, 0.9345302, -2.252112, 1, 1, 1, 1, 1,
-0.6920856, 0.3147159, -1.175519, 1, 1, 1, 1, 1,
-0.6907935, -1.14275, -4.503067, 1, 1, 1, 1, 1,
-0.6904085, 0.0157852, -2.112239, 1, 1, 1, 1, 1,
-0.6896181, -1.0335, -2.692032, 1, 1, 1, 1, 1,
-0.6847334, -1.157357, -4.025771, 1, 1, 1, 1, 1,
-0.6829608, -0.004079513, -0.358803, 1, 1, 1, 1, 1,
-0.6802939, 1.383405, -0.9166527, 0, 0, 1, 1, 1,
-0.6785471, 1.234549, 0.3298016, 1, 0, 0, 1, 1,
-0.6759921, -0.05237584, -0.298998, 1, 0, 0, 1, 1,
-0.6722807, -0.1369662, -2.406978, 1, 0, 0, 1, 1,
-0.6717603, -0.1602919, -2.857862, 1, 0, 0, 1, 1,
-0.6711928, -0.595594, -2.178263, 1, 0, 0, 1, 1,
-0.6678386, -0.800113, -3.506068, 0, 0, 0, 1, 1,
-0.6635528, 0.4459372, -3.016115, 0, 0, 0, 1, 1,
-0.6633846, 0.7433599, -2.36451, 0, 0, 0, 1, 1,
-0.6616761, 2.026359, -1.608649, 0, 0, 0, 1, 1,
-0.6604286, 0.8146351, 0.108683, 0, 0, 0, 1, 1,
-0.6551564, 0.9072672, -0.2421158, 0, 0, 0, 1, 1,
-0.6534333, 1.79449, 0.6078409, 0, 0, 0, 1, 1,
-0.6469912, -0.296393, -1.06751, 1, 1, 1, 1, 1,
-0.6417173, -0.146985, -1.63844, 1, 1, 1, 1, 1,
-0.6398378, 0.1866395, -2.659316, 1, 1, 1, 1, 1,
-0.6343164, -0.7084358, -1.820939, 1, 1, 1, 1, 1,
-0.6301673, -0.2509325, -0.7112578, 1, 1, 1, 1, 1,
-0.6288796, 0.05379816, -2.823365, 1, 1, 1, 1, 1,
-0.6277424, -0.6039228, -1.665734, 1, 1, 1, 1, 1,
-0.6273797, 1.225099, 0.6629233, 1, 1, 1, 1, 1,
-0.6270657, -1.860055, -2.066593, 1, 1, 1, 1, 1,
-0.6268196, 0.474134, -0.1690456, 1, 1, 1, 1, 1,
-0.6216672, -0.04032432, -0.6114267, 1, 1, 1, 1, 1,
-0.6191645, -0.389863, -3.889805, 1, 1, 1, 1, 1,
-0.6178777, 0.9099543, 0.5033372, 1, 1, 1, 1, 1,
-0.6160661, -0.6424482, -2.298761, 1, 1, 1, 1, 1,
-0.6143138, 1.669238, -0.09703948, 1, 1, 1, 1, 1,
-0.6134129, 1.566772, 0.2308456, 0, 0, 1, 1, 1,
-0.6045943, 0.3475458, 0.6168295, 1, 0, 0, 1, 1,
-0.6024945, 1.402906, -1.085904, 1, 0, 0, 1, 1,
-0.6014161, 1.3906, -0.4738897, 1, 0, 0, 1, 1,
-0.6002624, 0.7204994, 0.1536775, 1, 0, 0, 1, 1,
-0.6000049, 1.33149, 0.0007215756, 1, 0, 0, 1, 1,
-0.5946147, 2.445499, -1.321858, 0, 0, 0, 1, 1,
-0.5929878, -0.3086321, -2.155782, 0, 0, 0, 1, 1,
-0.5914468, -1.095185, -0.9591248, 0, 0, 0, 1, 1,
-0.5895234, 0.460959, 0.5331475, 0, 0, 0, 1, 1,
-0.5836606, 0.4563653, -0.9528032, 0, 0, 0, 1, 1,
-0.5818719, -0.4532147, -3.386787, 0, 0, 0, 1, 1,
-0.5792444, -0.1700041, -2.584809, 0, 0, 0, 1, 1,
-0.5745688, -1.146089, -1.113547, 1, 1, 1, 1, 1,
-0.5733939, -1.273964, -2.402369, 1, 1, 1, 1, 1,
-0.5733403, -0.6699914, -3.320193, 1, 1, 1, 1, 1,
-0.5717351, -1.460941, -3.073626, 1, 1, 1, 1, 1,
-0.5685883, -1.24966, -3.545186, 1, 1, 1, 1, 1,
-0.5631398, 1.156486, 0.9222696, 1, 1, 1, 1, 1,
-0.5603175, 0.8754997, -0.2856247, 1, 1, 1, 1, 1,
-0.5597278, -0.05879541, -2.133174, 1, 1, 1, 1, 1,
-0.5571093, -0.190466, -2.108529, 1, 1, 1, 1, 1,
-0.5533584, 1.576611, 0.4084811, 1, 1, 1, 1, 1,
-0.5504413, -1.539222, -3.814907, 1, 1, 1, 1, 1,
-0.5471355, -0.6721725, -1.229358, 1, 1, 1, 1, 1,
-0.5469781, -0.2744673, -0.8657416, 1, 1, 1, 1, 1,
-0.5444722, -1.022897, -1.671959, 1, 1, 1, 1, 1,
-0.5404902, -0.3262983, -0.9485782, 1, 1, 1, 1, 1,
-0.5398396, -0.7185043, -1.43186, 0, 0, 1, 1, 1,
-0.5376855, 0.4815376, -0.5824884, 1, 0, 0, 1, 1,
-0.5356804, -0.1064871, -0.8200501, 1, 0, 0, 1, 1,
-0.5326983, 0.8126959, -0.6215606, 1, 0, 0, 1, 1,
-0.5317596, 0.283758, -0.837599, 1, 0, 0, 1, 1,
-0.5308705, -1.01352, -2.422631, 1, 0, 0, 1, 1,
-0.5307286, 0.9136974, -2.045703, 0, 0, 0, 1, 1,
-0.5258561, -2.173125, -3.048938, 0, 0, 0, 1, 1,
-0.5197144, 0.7877262, -0.4644599, 0, 0, 0, 1, 1,
-0.5142799, -0.2171213, -2.673577, 0, 0, 0, 1, 1,
-0.5134658, 0.5753168, -1.343684, 0, 0, 0, 1, 1,
-0.5089703, 0.09617756, -0.1021677, 0, 0, 0, 1, 1,
-0.508607, 0.7587851, -0.1431157, 0, 0, 0, 1, 1,
-0.5039351, 0.4205501, -1.862134, 1, 1, 1, 1, 1,
-0.4986483, -3.144808, -6.343504, 1, 1, 1, 1, 1,
-0.4965807, 0.168768, 1.18187, 1, 1, 1, 1, 1,
-0.4960487, 2.193753, -0.4660123, 1, 1, 1, 1, 1,
-0.4957215, 0.9105066, -0.1522743, 1, 1, 1, 1, 1,
-0.4925463, -0.6938507, -2.755573, 1, 1, 1, 1, 1,
-0.4802835, -1.069386, -3.655813, 1, 1, 1, 1, 1,
-0.4750709, -1.181901, -3.393198, 1, 1, 1, 1, 1,
-0.4720581, 0.8022425, 0.03520631, 1, 1, 1, 1, 1,
-0.4704373, -1.12088, -2.119352, 1, 1, 1, 1, 1,
-0.4674642, -0.5135221, -1.627415, 1, 1, 1, 1, 1,
-0.4674512, 0.3011527, -0.425976, 1, 1, 1, 1, 1,
-0.4665846, 0.114824, -2.211921, 1, 1, 1, 1, 1,
-0.4650488, -0.03505269, -0.683072, 1, 1, 1, 1, 1,
-0.4615141, 0.7658024, -2.639274, 1, 1, 1, 1, 1,
-0.4589854, 0.2312877, -1.077234, 0, 0, 1, 1, 1,
-0.4533844, 0.8997977, 0.5870068, 1, 0, 0, 1, 1,
-0.4484509, -1.003811, -1.858692, 1, 0, 0, 1, 1,
-0.447735, -1.943037, -2.708326, 1, 0, 0, 1, 1,
-0.4447238, -0.1923492, -0.709236, 1, 0, 0, 1, 1,
-0.4419667, -0.3415992, -1.840024, 1, 0, 0, 1, 1,
-0.4414962, -2.381597, -1.877892, 0, 0, 0, 1, 1,
-0.4397461, 0.3019615, -1.182887, 0, 0, 0, 1, 1,
-0.4384924, -1.582167, -4.452182, 0, 0, 0, 1, 1,
-0.4306289, -0.9591404, -2.429303, 0, 0, 0, 1, 1,
-0.4288474, -0.7719558, -2.105683, 0, 0, 0, 1, 1,
-0.4287311, 1.820233, -0.8404377, 0, 0, 0, 1, 1,
-0.4257122, 0.7216469, -0.6626875, 0, 0, 0, 1, 1,
-0.4245614, 1.932802, 0.7404029, 1, 1, 1, 1, 1,
-0.4230321, 0.3637241, 0.7401045, 1, 1, 1, 1, 1,
-0.4188154, 1.997461, 0.2264358, 1, 1, 1, 1, 1,
-0.4069788, 0.7238116, 0.04632498, 1, 1, 1, 1, 1,
-0.4063276, -0.143592, -2.076304, 1, 1, 1, 1, 1,
-0.4020068, 2.14903, 0.2800975, 1, 1, 1, 1, 1,
-0.3959221, 0.08637103, -2.598581, 1, 1, 1, 1, 1,
-0.3951033, -1.000384, -1.277045, 1, 1, 1, 1, 1,
-0.3944157, 1.347061, 0.5094166, 1, 1, 1, 1, 1,
-0.3926291, 0.6881395, -1.570583, 1, 1, 1, 1, 1,
-0.388402, -0.1970597, -2.098465, 1, 1, 1, 1, 1,
-0.3883193, -0.4904602, -1.887766, 1, 1, 1, 1, 1,
-0.3845598, -0.4757896, -2.789901, 1, 1, 1, 1, 1,
-0.3823154, -0.4061544, -3.953224, 1, 1, 1, 1, 1,
-0.3811109, -0.05866657, -1.4729, 1, 1, 1, 1, 1,
-0.3805985, -0.4306049, -1.267788, 0, 0, 1, 1, 1,
-0.3779918, 0.4873922, -2.387154, 1, 0, 0, 1, 1,
-0.3755836, -1.399713, -3.957756, 1, 0, 0, 1, 1,
-0.3753391, -0.9231693, -2.698417, 1, 0, 0, 1, 1,
-0.3748262, -0.6826635, -4.127153, 1, 0, 0, 1, 1,
-0.3744155, -1.2115, -2.413528, 1, 0, 0, 1, 1,
-0.3741868, 0.1821013, 0.6237763, 0, 0, 0, 1, 1,
-0.3723895, 1.137982, 0.214271, 0, 0, 0, 1, 1,
-0.3685794, 1.707949, 0.4677414, 0, 0, 0, 1, 1,
-0.3680927, 0.6643543, -0.7903358, 0, 0, 0, 1, 1,
-0.3637418, 0.5125921, -1.22391, 0, 0, 0, 1, 1,
-0.3552769, 0.6166207, -1.843746, 0, 0, 0, 1, 1,
-0.350156, 0.4985069, 1.856759, 0, 0, 0, 1, 1,
-0.3394884, -1.137606, -0.3662236, 1, 1, 1, 1, 1,
-0.3362396, 0.2377485, -0.150411, 1, 1, 1, 1, 1,
-0.3356391, 0.7562646, -0.678906, 1, 1, 1, 1, 1,
-0.3337587, 0.5509394, -0.8299122, 1, 1, 1, 1, 1,
-0.3332323, 0.0796807, -0.57566, 1, 1, 1, 1, 1,
-0.3330835, -0.1737009, -2.274644, 1, 1, 1, 1, 1,
-0.3328214, 0.05202742, -2.666477, 1, 1, 1, 1, 1,
-0.3289796, -1.200958, -3.419796, 1, 1, 1, 1, 1,
-0.3271678, 0.2991987, -0.2214927, 1, 1, 1, 1, 1,
-0.3269062, 1.459428, 0.6763768, 1, 1, 1, 1, 1,
-0.3261512, 2.27876, -0.8870084, 1, 1, 1, 1, 1,
-0.3223727, -1.044305, -3.111554, 1, 1, 1, 1, 1,
-0.3212598, 1.506096, -0.3296884, 1, 1, 1, 1, 1,
-0.321231, -2.085765, -3.181699, 1, 1, 1, 1, 1,
-0.3176414, 0.3709095, -1.040247, 1, 1, 1, 1, 1,
-0.3120549, -0.333063, -2.912375, 0, 0, 1, 1, 1,
-0.3108155, -0.7313978, -2.75703, 1, 0, 0, 1, 1,
-0.3096201, 0.3840933, -0.6395701, 1, 0, 0, 1, 1,
-0.3075986, -1.085691, -1.929306, 1, 0, 0, 1, 1,
-0.3051007, -2.202796, -4.534213, 1, 0, 0, 1, 1,
-0.3024015, -0.09781672, -1.404528, 1, 0, 0, 1, 1,
-0.3022882, -0.9758407, -3.613706, 0, 0, 0, 1, 1,
-0.3015034, -0.2011584, -2.145443, 0, 0, 0, 1, 1,
-0.3011702, 0.9818806, 1.539793, 0, 0, 0, 1, 1,
-0.2939549, 0.4529077, -0.1412127, 0, 0, 0, 1, 1,
-0.293577, -0.59338, -2.835956, 0, 0, 0, 1, 1,
-0.2907147, 1.195903, -0.3315662, 0, 0, 0, 1, 1,
-0.2905038, 0.9774467, -0.4142498, 0, 0, 0, 1, 1,
-0.2857871, -0.8878058, -1.07714, 1, 1, 1, 1, 1,
-0.2844033, -0.08638263, -2.780886, 1, 1, 1, 1, 1,
-0.2807154, -2.616789, -2.910075, 1, 1, 1, 1, 1,
-0.2791159, -0.8529903, -4.453374, 1, 1, 1, 1, 1,
-0.278489, 0.2595437, -1.585901, 1, 1, 1, 1, 1,
-0.2683993, -0.6920244, -2.376653, 1, 1, 1, 1, 1,
-0.2679883, -0.02202182, -0.4802543, 1, 1, 1, 1, 1,
-0.2627285, 1.704158, -1.879125, 1, 1, 1, 1, 1,
-0.2617738, 0.6948104, 0.8259801, 1, 1, 1, 1, 1,
-0.2554628, -0.2451062, -0.9427025, 1, 1, 1, 1, 1,
-0.2554615, -0.7848541, -1.388243, 1, 1, 1, 1, 1,
-0.2531861, 1.340229, -2.321699, 1, 1, 1, 1, 1,
-0.2509402, -0.6455901, -1.866663, 1, 1, 1, 1, 1,
-0.2446469, 0.51096, -1.385643, 1, 1, 1, 1, 1,
-0.2385058, -1.16267, -1.630028, 1, 1, 1, 1, 1,
-0.238465, 0.5908075, -0.6735387, 0, 0, 1, 1, 1,
-0.2326607, -0.2918682, -1.471963, 1, 0, 0, 1, 1,
-0.2320878, -0.4438169, -0.8078661, 1, 0, 0, 1, 1,
-0.2310509, -0.791835, -2.529725, 1, 0, 0, 1, 1,
-0.2287696, -0.1589213, -2.843334, 1, 0, 0, 1, 1,
-0.2260561, -0.7069849, -3.798086, 1, 0, 0, 1, 1,
-0.2254349, 0.9622121, -0.4219879, 0, 0, 0, 1, 1,
-0.2200618, 1.215007, 0.4660286, 0, 0, 0, 1, 1,
-0.2181646, -0.1401989, -1.404819, 0, 0, 0, 1, 1,
-0.2166182, -0.2679712, -2.196259, 0, 0, 0, 1, 1,
-0.2149906, 0.9247005, 0.1618898, 0, 0, 0, 1, 1,
-0.2125012, -0.8619797, -1.669955, 0, 0, 0, 1, 1,
-0.1973012, -0.9185507, -1.669857, 0, 0, 0, 1, 1,
-0.1949526, 0.03934417, -0.6492356, 1, 1, 1, 1, 1,
-0.1924269, -0.9240326, -3.104253, 1, 1, 1, 1, 1,
-0.1901211, -0.1766512, -3.241646, 1, 1, 1, 1, 1,
-0.1899055, -0.8571192, -3.339881, 1, 1, 1, 1, 1,
-0.1864864, 0.05017871, -0.8660923, 1, 1, 1, 1, 1,
-0.1849968, 0.8521286, 0.5241271, 1, 1, 1, 1, 1,
-0.1849863, 1.041549, 0.9969807, 1, 1, 1, 1, 1,
-0.181112, 1.308886, -1.139365, 1, 1, 1, 1, 1,
-0.1773328, -0.2415966, -1.503625, 1, 1, 1, 1, 1,
-0.1755625, -1.093012, -3.947705, 1, 1, 1, 1, 1,
-0.1742485, 0.256592, -2.827316, 1, 1, 1, 1, 1,
-0.1730681, 0.6440444, -1.578038, 1, 1, 1, 1, 1,
-0.1674609, 0.2170498, -0.4143968, 1, 1, 1, 1, 1,
-0.1670997, 1.458417, 1.317977, 1, 1, 1, 1, 1,
-0.1600895, 0.7613508, 0.3873064, 1, 1, 1, 1, 1,
-0.1576535, 0.1420453, -2.504184, 0, 0, 1, 1, 1,
-0.1563971, -0.1559082, -1.330181, 1, 0, 0, 1, 1,
-0.1537237, -0.6790521, -3.922871, 1, 0, 0, 1, 1,
-0.1417783, -1.217827, -2.791016, 1, 0, 0, 1, 1,
-0.1403335, 0.9118398, -0.6526673, 1, 0, 0, 1, 1,
-0.1388779, 0.4532867, -0.3257687, 1, 0, 0, 1, 1,
-0.138258, 0.5747916, -0.6548879, 0, 0, 0, 1, 1,
-0.1356927, -0.3223759, -1.632659, 0, 0, 0, 1, 1,
-0.1345339, -1.06612, -3.547297, 0, 0, 0, 1, 1,
-0.1336841, 1.644134, 0.9961742, 0, 0, 0, 1, 1,
-0.1326684, 0.4435364, -1.113819, 0, 0, 0, 1, 1,
-0.1326038, -1.936549, -3.201265, 0, 0, 0, 1, 1,
-0.1320061, 0.2596053, -0.1401127, 0, 0, 0, 1, 1,
-0.1303214, 0.05463392, -2.156842, 1, 1, 1, 1, 1,
-0.1292982, -1.325627, -2.91953, 1, 1, 1, 1, 1,
-0.1282909, 1.309381, -1.110163, 1, 1, 1, 1, 1,
-0.1249926, 0.566975, -1.284001, 1, 1, 1, 1, 1,
-0.1184907, -0.06853711, -3.345155, 1, 1, 1, 1, 1,
-0.1182904, 0.3484052, -1.021858, 1, 1, 1, 1, 1,
-0.1149262, 0.6265992, 0.9988741, 1, 1, 1, 1, 1,
-0.1106505, -0.5656338, -1.83348, 1, 1, 1, 1, 1,
-0.1081317, -0.8996623, -0.5706344, 1, 1, 1, 1, 1,
-0.1076063, -0.1688282, -2.288644, 1, 1, 1, 1, 1,
-0.10608, 0.1648066, -1.986652, 1, 1, 1, 1, 1,
-0.1011628, -2.384716, -5.355199, 1, 1, 1, 1, 1,
-0.09833532, 0.0451117, -1.942876, 1, 1, 1, 1, 1,
-0.09702826, 0.654165, -0.2039547, 1, 1, 1, 1, 1,
-0.09433375, -0.1441, -3.437796, 1, 1, 1, 1, 1,
-0.08170182, 0.539889, -1.461538, 0, 0, 1, 1, 1,
-0.07753789, 0.6856851, 0.9225824, 1, 0, 0, 1, 1,
-0.0752022, -0.2816135, -2.913352, 1, 0, 0, 1, 1,
-0.07451127, -0.8916136, -2.708316, 1, 0, 0, 1, 1,
-0.06787113, -1.716334, -2.9952, 1, 0, 0, 1, 1,
-0.06575765, 1.939515, 0.9380824, 1, 0, 0, 1, 1,
-0.06349453, -1.211419, -3.848056, 0, 0, 0, 1, 1,
-0.06100698, -0.5812036, -4.579417, 0, 0, 0, 1, 1,
-0.06031281, -1.306449, -3.083005, 0, 0, 0, 1, 1,
-0.05476319, 0.6736505, 1.646813, 0, 0, 0, 1, 1,
-0.05357921, -0.9287399, -3.664813, 0, 0, 0, 1, 1,
-0.05354326, 0.8306316, 0.2200532, 0, 0, 0, 1, 1,
-0.05073319, -0.7186217, -1.448324, 0, 0, 0, 1, 1,
-0.04928015, 0.4746782, -1.241354, 1, 1, 1, 1, 1,
-0.0463062, 0.9916625, -2.333265, 1, 1, 1, 1, 1,
-0.04035719, 1.644361, -0.2686189, 1, 1, 1, 1, 1,
-0.03911783, -0.8832397, -2.20729, 1, 1, 1, 1, 1,
-0.03435763, -1.896092, -4.463126, 1, 1, 1, 1, 1,
-0.03422682, 0.753353, -0.1540164, 1, 1, 1, 1, 1,
-0.03226955, -0.7006144, -2.704184, 1, 1, 1, 1, 1,
-0.0315878, 1.66291, -0.2829489, 1, 1, 1, 1, 1,
-0.02886069, -1.028221, -4.031412, 1, 1, 1, 1, 1,
-0.02810601, 1.624438, 3.2826, 1, 1, 1, 1, 1,
-0.02738611, -0.772478, -0.6804155, 1, 1, 1, 1, 1,
-0.02730548, 0.3883049, 1.097489, 1, 1, 1, 1, 1,
-0.02545433, 0.583195, -0.115983, 1, 1, 1, 1, 1,
-0.02237185, -1.631891, -3.050547, 1, 1, 1, 1, 1,
-0.01626816, -2.196954, -2.504581, 1, 1, 1, 1, 1,
-0.01589692, -0.1779631, -2.965354, 0, 0, 1, 1, 1,
-0.0126634, -0.4427132, -3.37653, 1, 0, 0, 1, 1,
-0.0125971, 0.6787841, -0.1967051, 1, 0, 0, 1, 1,
-0.01025949, -0.7096582, -5.151289, 1, 0, 0, 1, 1,
-0.008801884, 1.406291, 1.236556, 1, 0, 0, 1, 1,
-0.006739847, 0.7147229, 1.762643, 1, 0, 0, 1, 1,
-0.00364293, 0.3617443, 0.4578424, 0, 0, 0, 1, 1,
0.004207992, 0.4464154, -0.270719, 0, 0, 0, 1, 1,
0.004991487, -1.19574, 3.097983, 0, 0, 0, 1, 1,
0.005294925, -0.5731007, 2.936609, 0, 0, 0, 1, 1,
0.009272114, 0.3293133, 0.6045126, 0, 0, 0, 1, 1,
0.009666701, -0.2885073, 2.812161, 0, 0, 0, 1, 1,
0.01094211, 0.9169703, 0.08871752, 0, 0, 0, 1, 1,
0.0117388, -0.04379434, 2.555991, 1, 1, 1, 1, 1,
0.01224914, -1.027508, 3.362455, 1, 1, 1, 1, 1,
0.01383818, -0.7313365, 4.788743, 1, 1, 1, 1, 1,
0.02308078, 1.161506, -0.7668225, 1, 1, 1, 1, 1,
0.02577169, 0.004975399, 1.230826, 1, 1, 1, 1, 1,
0.02619979, 0.1288294, 1.185071, 1, 1, 1, 1, 1,
0.02743271, -0.9903439, 2.423115, 1, 1, 1, 1, 1,
0.02951233, -0.8801148, 4.201549, 1, 1, 1, 1, 1,
0.03090491, 1.541249, -0.190625, 1, 1, 1, 1, 1,
0.03357348, -0.3715328, 3.907041, 1, 1, 1, 1, 1,
0.03451211, 1.262446, -0.8615389, 1, 1, 1, 1, 1,
0.037553, 0.2077062, -1.51733, 1, 1, 1, 1, 1,
0.04186356, 0.1503522, 1.379432, 1, 1, 1, 1, 1,
0.05362552, 0.7287699, 0.8943878, 1, 1, 1, 1, 1,
0.05581319, -0.2809298, 4.461257, 1, 1, 1, 1, 1,
0.05792418, -0.6194872, 2.921887, 0, 0, 1, 1, 1,
0.063115, -1.763572, 3.301681, 1, 0, 0, 1, 1,
0.07360561, -0.1743113, 2.09968, 1, 0, 0, 1, 1,
0.07568253, -1.483303, 2.330478, 1, 0, 0, 1, 1,
0.0780081, 1.621516, 1.280597, 1, 0, 0, 1, 1,
0.07877998, 0.04552585, 2.369355, 1, 0, 0, 1, 1,
0.08011501, 0.09339409, 0.992762, 0, 0, 0, 1, 1,
0.08338934, -0.4412557, 3.256938, 0, 0, 0, 1, 1,
0.0849338, 0.06250414, 1.012073, 0, 0, 0, 1, 1,
0.08888702, -0.1064472, 1.285402, 0, 0, 0, 1, 1,
0.09080943, -0.2577513, 3.970407, 0, 0, 0, 1, 1,
0.1013499, -0.3036158, 2.991454, 0, 0, 0, 1, 1,
0.1046207, 0.7263911, 1.332922, 0, 0, 0, 1, 1,
0.1074252, 1.420332, -0.9327372, 1, 1, 1, 1, 1,
0.1114451, 0.2671518, 1.923611, 1, 1, 1, 1, 1,
0.1126474, 0.6913595, -0.9988153, 1, 1, 1, 1, 1,
0.1160664, 0.02539339, 0.871691, 1, 1, 1, 1, 1,
0.1172093, -0.3716962, 2.443159, 1, 1, 1, 1, 1,
0.1186948, -0.3533734, 2.362266, 1, 1, 1, 1, 1,
0.12, -1.242986, 5.402323, 1, 1, 1, 1, 1,
0.122003, 0.7251417, 1.744774, 1, 1, 1, 1, 1,
0.1278785, -0.1927937, 3.286454, 1, 1, 1, 1, 1,
0.1300168, 0.7754923, 0.8702615, 1, 1, 1, 1, 1,
0.1303559, 1.123096, 1.47041, 1, 1, 1, 1, 1,
0.1307869, 0.5112575, -0.1415438, 1, 1, 1, 1, 1,
0.1370989, 0.1471209, 0.3912157, 1, 1, 1, 1, 1,
0.1390826, -0.1936808, 1.2767, 1, 1, 1, 1, 1,
0.1392025, -2.094631, 1.594651, 1, 1, 1, 1, 1,
0.1399729, 0.4040943, -0.01106766, 0, 0, 1, 1, 1,
0.1412953, 0.5715751, 1.533143, 1, 0, 0, 1, 1,
0.1423396, -0.9931201, 2.324085, 1, 0, 0, 1, 1,
0.144499, 0.265917, 0.4736106, 1, 0, 0, 1, 1,
0.1447058, -0.156408, 3.812604, 1, 0, 0, 1, 1,
0.1469124, -2.076124, 3.350851, 1, 0, 0, 1, 1,
0.1480348, 0.6140448, 1.099166, 0, 0, 0, 1, 1,
0.1486256, 0.8107243, 0.4647829, 0, 0, 0, 1, 1,
0.1492555, -0.9212892, 4.957441, 0, 0, 0, 1, 1,
0.151698, -0.3286635, 1.204734, 0, 0, 0, 1, 1,
0.1546721, -0.8024757, 3.250841, 0, 0, 0, 1, 1,
0.1555401, 0.008778003, -1.046968, 0, 0, 0, 1, 1,
0.1575029, -0.8371407, 2.243784, 0, 0, 0, 1, 1,
0.1585309, 0.7748999, -1.085575, 1, 1, 1, 1, 1,
0.1610425, -0.768299, 3.972753, 1, 1, 1, 1, 1,
0.1613041, 0.09226204, 3.548191, 1, 1, 1, 1, 1,
0.1633861, -0.7914401, 1.603863, 1, 1, 1, 1, 1,
0.1660135, 0.1145159, 0.2085544, 1, 1, 1, 1, 1,
0.1661941, 0.01701748, 1.280955, 1, 1, 1, 1, 1,
0.1671717, 2.264901, 0.7588525, 1, 1, 1, 1, 1,
0.1710864, -0.7453796, 2.125851, 1, 1, 1, 1, 1,
0.1715175, 0.5613894, -1.836782, 1, 1, 1, 1, 1,
0.1732475, 2.453142, -0.6876692, 1, 1, 1, 1, 1,
0.1749362, 1.511656, 0.612147, 1, 1, 1, 1, 1,
0.1825328, -1.109557, 2.924706, 1, 1, 1, 1, 1,
0.183589, 0.0290615, 0.991204, 1, 1, 1, 1, 1,
0.1848949, 1.156018, 0.8838457, 1, 1, 1, 1, 1,
0.1861819, -0.6122346, 2.698593, 1, 1, 1, 1, 1,
0.2018242, -0.2068778, 2.385787, 0, 0, 1, 1, 1,
0.2104164, -1.720384, 4.883845, 1, 0, 0, 1, 1,
0.2139353, 1.680804, 0.1381877, 1, 0, 0, 1, 1,
0.2156628, -0.5598798, 1.968841, 1, 0, 0, 1, 1,
0.2210649, -1.424146, 3.290322, 1, 0, 0, 1, 1,
0.2223319, -1.79013, 3.794287, 1, 0, 0, 1, 1,
0.2269001, 1.187359, 0.0370491, 0, 0, 0, 1, 1,
0.2283164, 0.2062999, 0.6820834, 0, 0, 0, 1, 1,
0.2292397, -0.9717401, 3.462981, 0, 0, 0, 1, 1,
0.2315034, -0.3227252, 2.146686, 0, 0, 0, 1, 1,
0.234771, 0.8047179, -0.2536929, 0, 0, 0, 1, 1,
0.2358163, 0.4239897, 0.4237562, 0, 0, 0, 1, 1,
0.2392467, -1.306599, 4.281189, 0, 0, 0, 1, 1,
0.2399062, -1.294827, 3.968885, 1, 1, 1, 1, 1,
0.2401269, -0.173122, 2.95074, 1, 1, 1, 1, 1,
0.2414223, -0.122554, 0.9881223, 1, 1, 1, 1, 1,
0.2428775, 0.1612315, 2.778474, 1, 1, 1, 1, 1,
0.2429437, -0.5086901, 3.902898, 1, 1, 1, 1, 1,
0.2434377, -0.8663524, 4.472863, 1, 1, 1, 1, 1,
0.2479705, 0.4473132, 0.1813267, 1, 1, 1, 1, 1,
0.2516367, -0.5302333, 2.692638, 1, 1, 1, 1, 1,
0.2558831, -2.077907, 0.6189921, 1, 1, 1, 1, 1,
0.2570523, -0.9267423, 3.513032, 1, 1, 1, 1, 1,
0.2594661, -0.396773, 2.495351, 1, 1, 1, 1, 1,
0.2668311, 0.01428982, 2.856583, 1, 1, 1, 1, 1,
0.267022, -0.1052458, 1.423961, 1, 1, 1, 1, 1,
0.2711695, 0.1614244, -0.7273948, 1, 1, 1, 1, 1,
0.2716416, -0.7800511, 4.767219, 1, 1, 1, 1, 1,
0.2736319, 1.342886, 0.2216772, 0, 0, 1, 1, 1,
0.2745045, -1.846249, 1.761904, 1, 0, 0, 1, 1,
0.2815004, 0.8485356, 1.79014, 1, 0, 0, 1, 1,
0.28521, -0.03240384, 1.102869, 1, 0, 0, 1, 1,
0.2891934, -1.406082, 3.109913, 1, 0, 0, 1, 1,
0.2892949, 0.6720746, 1.372088, 1, 0, 0, 1, 1,
0.2895167, 0.1977476, 1.909371, 0, 0, 0, 1, 1,
0.2898966, 1.712646, 0.8039089, 0, 0, 0, 1, 1,
0.291973, -0.5775674, 1.913171, 0, 0, 0, 1, 1,
0.2921718, -0.5170305, 4.246367, 0, 0, 0, 1, 1,
0.2958239, 0.1715889, 1.938191, 0, 0, 0, 1, 1,
0.2968362, -1.046375, 2.862059, 0, 0, 0, 1, 1,
0.3003226, 0.7051927, 0.1236304, 0, 0, 0, 1, 1,
0.3030453, 0.103154, 0.6898367, 1, 1, 1, 1, 1,
0.3069498, -1.07975, 2.8379, 1, 1, 1, 1, 1,
0.3154453, -1.139277, 2.873797, 1, 1, 1, 1, 1,
0.3227329, 1.017003, 0.2050796, 1, 1, 1, 1, 1,
0.3249553, -0.6351504, 2.524778, 1, 1, 1, 1, 1,
0.3261211, 0.5961373, 0.6727213, 1, 1, 1, 1, 1,
0.3277059, -1.246782, 3.321942, 1, 1, 1, 1, 1,
0.3280354, -0.3346874, 1.259352, 1, 1, 1, 1, 1,
0.3299559, -1.674232, 3.81806, 1, 1, 1, 1, 1,
0.3303275, 2.037419, 0.2251081, 1, 1, 1, 1, 1,
0.3305281, 0.4971528, 0.4110101, 1, 1, 1, 1, 1,
0.3364445, -0.4054057, 2.866908, 1, 1, 1, 1, 1,
0.3379189, -0.140883, 1.077686, 1, 1, 1, 1, 1,
0.3388008, 0.6722285, 1.738241, 1, 1, 1, 1, 1,
0.3403587, -0.8949551, 2.257905, 1, 1, 1, 1, 1,
0.3415776, -0.5905071, 2.50361, 0, 0, 1, 1, 1,
0.3478635, -0.1352898, 1.986078, 1, 0, 0, 1, 1,
0.348789, -0.8544275, 3.445011, 1, 0, 0, 1, 1,
0.3557112, -0.7451953, 3.010864, 1, 0, 0, 1, 1,
0.3589377, 0.2784103, 0.3855057, 1, 0, 0, 1, 1,
0.369013, 0.6617176, -0.2298592, 1, 0, 0, 1, 1,
0.3716737, -0.2077777, 1.516108, 0, 0, 0, 1, 1,
0.3752759, 1.896251, 0.7431432, 0, 0, 0, 1, 1,
0.3768435, -0.01930598, 1.193969, 0, 0, 0, 1, 1,
0.3801989, -1.392536, 3.251838, 0, 0, 0, 1, 1,
0.3833741, 1.9583, -0.2092715, 0, 0, 0, 1, 1,
0.3911278, 1.023407, -0.6011909, 0, 0, 0, 1, 1,
0.3929716, 0.2335799, 0.005171718, 0, 0, 0, 1, 1,
0.3947842, -0.1910803, 1.291552, 1, 1, 1, 1, 1,
0.3980027, 1.579395, 2.122365, 1, 1, 1, 1, 1,
0.403978, 0.2223651, 2.112586, 1, 1, 1, 1, 1,
0.4055791, -1.018799, 2.964522, 1, 1, 1, 1, 1,
0.406367, -0.4612732, 3.445146, 1, 1, 1, 1, 1,
0.4129969, -0.2366657, 0.8777171, 1, 1, 1, 1, 1,
0.4157737, 0.04549896, 2.918702, 1, 1, 1, 1, 1,
0.4177956, -0.9464462, 2.478339, 1, 1, 1, 1, 1,
0.4208181, -0.03008206, 2.159636, 1, 1, 1, 1, 1,
0.4282866, -1.651032, 1.758443, 1, 1, 1, 1, 1,
0.4303657, -0.9415842, 2.486531, 1, 1, 1, 1, 1,
0.4316768, -1.247169, 3.561715, 1, 1, 1, 1, 1,
0.4403206, 0.5079282, 2.408131, 1, 1, 1, 1, 1,
0.4423256, -0.1865584, 2.558228, 1, 1, 1, 1, 1,
0.4438229, -0.03743022, 1.335877, 1, 1, 1, 1, 1,
0.4438434, -1.575686, 3.950519, 0, 0, 1, 1, 1,
0.445985, -1.151434, 2.424151, 1, 0, 0, 1, 1,
0.4461117, -1.111636, 3.644783, 1, 0, 0, 1, 1,
0.4469961, -1.38464, 3.352399, 1, 0, 0, 1, 1,
0.4498193, -0.3585035, -0.04098807, 1, 0, 0, 1, 1,
0.4533047, 0.5117396, 0.9725829, 1, 0, 0, 1, 1,
0.453323, -1.555203, 3.372849, 0, 0, 0, 1, 1,
0.4580316, 0.07533979, 0.8528585, 0, 0, 0, 1, 1,
0.4588436, 1.41116, 0.06843765, 0, 0, 0, 1, 1,
0.4600971, 0.03673127, 2.861171, 0, 0, 0, 1, 1,
0.4603696, 1.343593, 0.9508305, 0, 0, 0, 1, 1,
0.4644522, -2.681741, 4.29051, 0, 0, 0, 1, 1,
0.4687805, 0.2599963, 0.6836073, 0, 0, 0, 1, 1,
0.4748313, -0.5683214, 2.558508, 1, 1, 1, 1, 1,
0.4772024, -0.02337567, 2.141386, 1, 1, 1, 1, 1,
0.4779734, -0.5203677, 1.06219, 1, 1, 1, 1, 1,
0.4802456, -0.03319352, 1.975881, 1, 1, 1, 1, 1,
0.4852782, -1.337965, 4.063444, 1, 1, 1, 1, 1,
0.4907046, 0.5563068, -0.5927566, 1, 1, 1, 1, 1,
0.4920079, -0.525582, 2.419364, 1, 1, 1, 1, 1,
0.4923651, -0.07660428, 0.9800168, 1, 1, 1, 1, 1,
0.4929892, -0.8724963, 3.411613, 1, 1, 1, 1, 1,
0.5019271, -0.09151778, 1.77616, 1, 1, 1, 1, 1,
0.5081055, -1.657176, 3.606231, 1, 1, 1, 1, 1,
0.5152152, 0.8931439, -0.006042976, 1, 1, 1, 1, 1,
0.5154758, 0.7376758, 1.560019, 1, 1, 1, 1, 1,
0.5174474, 0.2986438, 0.1957519, 1, 1, 1, 1, 1,
0.5211249, 1.228245, -0.4983729, 1, 1, 1, 1, 1,
0.5235946, 0.6642433, 1.921853, 0, 0, 1, 1, 1,
0.5256963, 0.5270805, 0.946219, 1, 0, 0, 1, 1,
0.5340989, -0.9937705, 5.247849, 1, 0, 0, 1, 1,
0.5400951, -0.7526515, 1.539614, 1, 0, 0, 1, 1,
0.5432367, -0.2200445, 0.2693138, 1, 0, 0, 1, 1,
0.5450519, -0.3918976, 2.722494, 1, 0, 0, 1, 1,
0.5462155, 0.5459329, 1.450704, 0, 0, 0, 1, 1,
0.5471221, 0.126089, 1.645357, 0, 0, 0, 1, 1,
0.5526648, 0.1313881, 2.157043, 0, 0, 0, 1, 1,
0.5531471, 2.191601, 0.01356951, 0, 0, 0, 1, 1,
0.5553759, -0.1075012, 0.8751243, 0, 0, 0, 1, 1,
0.5590261, 1.287149, -0.3657846, 0, 0, 0, 1, 1,
0.5672733, 0.4628304, -0.02820088, 0, 0, 0, 1, 1,
0.5680855, 0.3617615, -0.8804341, 1, 1, 1, 1, 1,
0.5687485, -1.165708, 3.332278, 1, 1, 1, 1, 1,
0.5690902, -0.2404561, 2.35203, 1, 1, 1, 1, 1,
0.5771755, 0.2766426, 2.030612, 1, 1, 1, 1, 1,
0.5787975, 1.917561, 0.4510061, 1, 1, 1, 1, 1,
0.5788617, -0.3397124, 2.391736, 1, 1, 1, 1, 1,
0.5791346, 0.562818, -0.03394029, 1, 1, 1, 1, 1,
0.5843847, -0.3190995, 2.359238, 1, 1, 1, 1, 1,
0.5858284, -1.453981, 2.068181, 1, 1, 1, 1, 1,
0.591866, 0.5069392, 0.2370096, 1, 1, 1, 1, 1,
0.5937421, -2.405153, 3.4163, 1, 1, 1, 1, 1,
0.5951194, -0.5452071, 1.610008, 1, 1, 1, 1, 1,
0.5957276, 0.391048, -0.2634124, 1, 1, 1, 1, 1,
0.5993201, 1.262208, 1.656164, 1, 1, 1, 1, 1,
0.6009998, -0.08228675, 0.2640201, 1, 1, 1, 1, 1,
0.60553, -1.176664, 1.951715, 0, 0, 1, 1, 1,
0.6076919, 0.4848822, -0.9150429, 1, 0, 0, 1, 1,
0.6091313, -0.2443436, 2.316231, 1, 0, 0, 1, 1,
0.6111783, 0.5793883, 0.3872388, 1, 0, 0, 1, 1,
0.6123058, 0.02438136, 1.65526, 1, 0, 0, 1, 1,
0.6147352, 0.0004802801, 1.556789, 1, 0, 0, 1, 1,
0.618827, -0.06301691, 1.879424, 0, 0, 0, 1, 1,
0.6201287, -0.5692007, 2.23361, 0, 0, 0, 1, 1,
0.6255322, 1.301416, -0.2783676, 0, 0, 0, 1, 1,
0.6284174, 2.434791, 1.757792, 0, 0, 0, 1, 1,
0.6286008, -1.318492, 1.415994, 0, 0, 0, 1, 1,
0.6291729, -0.05271255, 3.390467, 0, 0, 0, 1, 1,
0.6383085, 1.649047, -0.9188668, 0, 0, 0, 1, 1,
0.6388633, 0.08103765, 0.3444588, 1, 1, 1, 1, 1,
0.639571, 0.009715819, 1.333715, 1, 1, 1, 1, 1,
0.6409025, 2.158718, 0.4612359, 1, 1, 1, 1, 1,
0.6461008, -0.1720355, 2.052696, 1, 1, 1, 1, 1,
0.646921, 1.1084, -0.6722706, 1, 1, 1, 1, 1,
0.6482739, -2.40026, 3.64794, 1, 1, 1, 1, 1,
0.6587064, 0.7221599, -0.5831447, 1, 1, 1, 1, 1,
0.6588098, 2.175382, -0.4760814, 1, 1, 1, 1, 1,
0.6609964, 0.4112145, -0.3688584, 1, 1, 1, 1, 1,
0.6648907, -0.9151351, 2.557983, 1, 1, 1, 1, 1,
0.6649141, 1.31247, 0.222796, 1, 1, 1, 1, 1,
0.668954, -1.125992, 3.311243, 1, 1, 1, 1, 1,
0.6781936, 0.669755, -0.1882071, 1, 1, 1, 1, 1,
0.680328, -0.3727894, 0.7595591, 1, 1, 1, 1, 1,
0.68072, 0.1048276, 0.5943274, 1, 1, 1, 1, 1,
0.6868032, 0.4147477, 1.138446, 0, 0, 1, 1, 1,
0.689283, 0.05857215, 1.204372, 1, 0, 0, 1, 1,
0.6893207, -0.4782923, 2.425116, 1, 0, 0, 1, 1,
0.6943752, -0.1273809, 2.166747, 1, 0, 0, 1, 1,
0.6949815, 0.5261342, 1.837141, 1, 0, 0, 1, 1,
0.6980727, 0.6508488, 2.030422, 1, 0, 0, 1, 1,
0.6983625, -1.330761, 3.713214, 0, 0, 0, 1, 1,
0.7032972, -0.6108986, 1.908935, 0, 0, 0, 1, 1,
0.7059304, 0.5478814, 1.576006, 0, 0, 0, 1, 1,
0.7069228, 1.936095, 1.043652, 0, 0, 0, 1, 1,
0.718645, 0.882416, -0.2650662, 0, 0, 0, 1, 1,
0.7204872, -0.531671, 2.212105, 0, 0, 0, 1, 1,
0.7207606, -0.7097469, 2.721386, 0, 0, 0, 1, 1,
0.7221627, -0.03239425, 1.575092, 1, 1, 1, 1, 1,
0.7287391, -1.427854, 1.354258, 1, 1, 1, 1, 1,
0.7372741, 1.069618, 0.09013388, 1, 1, 1, 1, 1,
0.7373306, -1.153597, 2.161944, 1, 1, 1, 1, 1,
0.7461349, -0.1789439, 2.122996, 1, 1, 1, 1, 1,
0.7474291, 0.4904338, 0.5018836, 1, 1, 1, 1, 1,
0.7510044, -0.4554597, 1.474981, 1, 1, 1, 1, 1,
0.7524152, -0.3256236, 1.145357, 1, 1, 1, 1, 1,
0.7532963, 0.4117577, 1.440075, 1, 1, 1, 1, 1,
0.7537449, -0.3519753, 0.6334158, 1, 1, 1, 1, 1,
0.7551719, 0.5379148, 0.598969, 1, 1, 1, 1, 1,
0.758949, 0.7224857, 2.809041, 1, 1, 1, 1, 1,
0.7781225, -1.141584, 4.37844, 1, 1, 1, 1, 1,
0.7832465, -0.4932748, 3.525443, 1, 1, 1, 1, 1,
0.7835928, 1.003975, -1.261441, 1, 1, 1, 1, 1,
0.793512, 0.406367, 1.73061, 0, 0, 1, 1, 1,
0.7952078, 1.15593, 1.063774, 1, 0, 0, 1, 1,
0.8039345, 1.348964, -1.025456, 1, 0, 0, 1, 1,
0.8054982, 0.8790697, 1.190856, 1, 0, 0, 1, 1,
0.8086139, 0.07313442, 0.662015, 1, 0, 0, 1, 1,
0.8105946, -0.9763539, 3.474151, 1, 0, 0, 1, 1,
0.8180681, 0.7233851, 0.8816302, 0, 0, 0, 1, 1,
0.8232315, 0.1267021, 1.32699, 0, 0, 0, 1, 1,
0.8284243, -0.5828497, 1.82848, 0, 0, 0, 1, 1,
0.8285694, 0.7401863, 0.7874924, 0, 0, 0, 1, 1,
0.8362581, 0.3529139, 1.617429, 0, 0, 0, 1, 1,
0.8383373, -1.701724, 1.948844, 0, 0, 0, 1, 1,
0.838774, 0.2337572, 2.239928, 0, 0, 0, 1, 1,
0.8402057, -0.08099026, 2.329068, 1, 1, 1, 1, 1,
0.8438655, 0.9319105, 0.3305508, 1, 1, 1, 1, 1,
0.8471448, 1.226666, 0.5056858, 1, 1, 1, 1, 1,
0.8529612, -0.563527, 3.189126, 1, 1, 1, 1, 1,
0.8553441, -0.4784793, 0.2108373, 1, 1, 1, 1, 1,
0.8564256, 0.785364, -1.180698, 1, 1, 1, 1, 1,
0.8649039, -0.2963063, -0.6506037, 1, 1, 1, 1, 1,
0.8699985, 0.1230579, -0.4127617, 1, 1, 1, 1, 1,
0.8704751, 1.266044, 0.6272506, 1, 1, 1, 1, 1,
0.8716731, 0.8319165, 1.838277, 1, 1, 1, 1, 1,
0.8815182, -0.2135298, 0.1896133, 1, 1, 1, 1, 1,
0.884198, -1.418417, 2.134778, 1, 1, 1, 1, 1,
0.8847856, -0.1539053, 1.285547, 1, 1, 1, 1, 1,
0.8850578, -1.142848, 1.874789, 1, 1, 1, 1, 1,
0.8852851, 1.56936, 0.2330524, 1, 1, 1, 1, 1,
0.8855489, -0.8891395, 3.866228, 0, 0, 1, 1, 1,
0.8899881, 1.419567, -0.335085, 1, 0, 0, 1, 1,
0.8944831, -0.9700646, 1.528061, 1, 0, 0, 1, 1,
0.8955482, -0.3415893, 0.8981734, 1, 0, 0, 1, 1,
0.8959306, -0.1518584, 2.686946, 1, 0, 0, 1, 1,
0.8977823, 1.269613, -1.647961, 1, 0, 0, 1, 1,
0.9016045, 1.760642, 0.9330822, 0, 0, 0, 1, 1,
0.9035445, 0.3311835, 1.077787, 0, 0, 0, 1, 1,
0.9067797, -1.06602, 2.780046, 0, 0, 0, 1, 1,
0.9086485, -1.270787, 2.229765, 0, 0, 0, 1, 1,
0.9126077, -1.265838, 1.828345, 0, 0, 0, 1, 1,
0.9234639, 0.1541188, 2.104944, 0, 0, 0, 1, 1,
0.9265283, 0.3409842, 1.103391, 0, 0, 0, 1, 1,
0.9271663, -0.1940294, 2.303716, 1, 1, 1, 1, 1,
0.9279094, -1.338323, 0.9584674, 1, 1, 1, 1, 1,
0.9294375, -0.9833657, 2.415964, 1, 1, 1, 1, 1,
0.929668, 0.1349666, 3.462979, 1, 1, 1, 1, 1,
0.9354049, -1.09712, 2.730243, 1, 1, 1, 1, 1,
0.9399101, -2.941905, 3.75386, 1, 1, 1, 1, 1,
0.9473396, -1.256027, 0.9465728, 1, 1, 1, 1, 1,
0.958071, -1.19041, 1.868596, 1, 1, 1, 1, 1,
0.9597703, -0.6758143, 2.507377, 1, 1, 1, 1, 1,
0.9666052, 0.9908362, 1.429096, 1, 1, 1, 1, 1,
0.9675487, 1.480241, -1.854106, 1, 1, 1, 1, 1,
0.9682757, -0.7552153, 1.454849, 1, 1, 1, 1, 1,
0.9688308, -0.1418776, -0.1488584, 1, 1, 1, 1, 1,
0.9708987, -0.337592, 0.9153306, 1, 1, 1, 1, 1,
0.9744057, 1.467406, 1.810021, 1, 1, 1, 1, 1,
0.9745831, 0.4427277, 1.138226, 0, 0, 1, 1, 1,
0.9824774, -1.400269, 1.572608, 1, 0, 0, 1, 1,
0.9840138, -1.707608, 1.867251, 1, 0, 0, 1, 1,
0.9920898, 2.03294, -0.6796041, 1, 0, 0, 1, 1,
0.9933112, 0.4180791, -0.2949443, 1, 0, 0, 1, 1,
0.99341, 1.725307, 0.2981591, 1, 0, 0, 1, 1,
0.9935391, 0.6686383, 0.4777209, 0, 0, 0, 1, 1,
0.9943902, -0.6055076, 2.642545, 0, 0, 0, 1, 1,
0.997481, -0.8248587, 2.161268, 0, 0, 0, 1, 1,
1.000339, -0.2435771, 2.549745, 0, 0, 0, 1, 1,
1.008263, 0.2288586, 1.848282, 0, 0, 0, 1, 1,
1.014913, -1.77283, 2.203375, 0, 0, 0, 1, 1,
1.0163, 0.3870896, 0.394388, 0, 0, 0, 1, 1,
1.028726, -1.631786, 1.917616, 1, 1, 1, 1, 1,
1.029211, 0.03568618, 1.565245, 1, 1, 1, 1, 1,
1.034423, 0.5860589, 1.456026, 1, 1, 1, 1, 1,
1.043707, -0.4517266, 0.6779115, 1, 1, 1, 1, 1,
1.052354, -2.509359, 2.574325, 1, 1, 1, 1, 1,
1.057016, 0.8408684, 0.8538207, 1, 1, 1, 1, 1,
1.06026, -0.05550096, 0.1708123, 1, 1, 1, 1, 1,
1.062522, -0.5267088, 3.324376, 1, 1, 1, 1, 1,
1.069814, -0.9458234, 2.375402, 1, 1, 1, 1, 1,
1.071371, 1.298695, 0.2667019, 1, 1, 1, 1, 1,
1.079758, 0.2562386, 0.896516, 1, 1, 1, 1, 1,
1.08252, -1.482701, 1.882107, 1, 1, 1, 1, 1,
1.082875, 0.3941227, 0.7946566, 1, 1, 1, 1, 1,
1.083178, -0.7193999, 3.928793, 1, 1, 1, 1, 1,
1.085365, 0.8828608, 0.6463044, 1, 1, 1, 1, 1,
1.088468, -0.1785268, 2.431954, 0, 0, 1, 1, 1,
1.093744, 0.1559597, 2.001785, 1, 0, 0, 1, 1,
1.106953, -0.9556292, 2.821357, 1, 0, 0, 1, 1,
1.107146, -0.3188131, 2.353077, 1, 0, 0, 1, 1,
1.10924, -0.2063754, 2.196393, 1, 0, 0, 1, 1,
1.109916, -0.8549108, 4.313806, 1, 0, 0, 1, 1,
1.111457, -0.04666095, 0.9243805, 0, 0, 0, 1, 1,
1.118208, -0.1429194, 3.726985, 0, 0, 0, 1, 1,
1.119003, 0.5864317, 1.336837, 0, 0, 0, 1, 1,
1.12279, -1.031796, 2.470896, 0, 0, 0, 1, 1,
1.128186, -0.5674685, 1.999949, 0, 0, 0, 1, 1,
1.132124, 0.2510222, 0.3332434, 0, 0, 0, 1, 1,
1.1452, -0.01316023, 2.336573, 0, 0, 0, 1, 1,
1.148487, 0.2918796, 1.17339, 1, 1, 1, 1, 1,
1.149803, -1.148747, 2.615529, 1, 1, 1, 1, 1,
1.162673, 1.478999, 0.6880116, 1, 1, 1, 1, 1,
1.181882, 0.8694795, -0.01631083, 1, 1, 1, 1, 1,
1.185214, -1.225344, 3.82428, 1, 1, 1, 1, 1,
1.185495, 0.125045, 0.551405, 1, 1, 1, 1, 1,
1.189865, -0.8726141, 2.708418, 1, 1, 1, 1, 1,
1.202488, -0.7253662, 2.660011, 1, 1, 1, 1, 1,
1.206269, -0.01971504, 1.079354, 1, 1, 1, 1, 1,
1.209033, -0.08913472, 1.881233, 1, 1, 1, 1, 1,
1.217863, 0.3079791, 1.761259, 1, 1, 1, 1, 1,
1.225157, -0.76332, 0.9768011, 1, 1, 1, 1, 1,
1.22872, -0.08724219, 2.328513, 1, 1, 1, 1, 1,
1.234929, 1.413611, 0.3129011, 1, 1, 1, 1, 1,
1.236699, -0.690697, -0.1046715, 1, 1, 1, 1, 1,
1.240621, -1.005157, 1.346828, 0, 0, 1, 1, 1,
1.251544, -0.13235, 0.3519382, 1, 0, 0, 1, 1,
1.255099, 0.7248936, 0.8117598, 1, 0, 0, 1, 1,
1.255245, 1.08964, 1.602897, 1, 0, 0, 1, 1,
1.256771, -0.3423153, 0.6097982, 1, 0, 0, 1, 1,
1.258267, -1.632172, 2.43666, 1, 0, 0, 1, 1,
1.260725, -0.9101641, 2.420617, 0, 0, 0, 1, 1,
1.261849, -0.04915911, 0.7093417, 0, 0, 0, 1, 1,
1.264447, 0.7328188, 1.564964, 0, 0, 0, 1, 1,
1.265201, 0.01810255, 0.4133363, 0, 0, 0, 1, 1,
1.271924, 1.052218, 1.404095, 0, 0, 0, 1, 1,
1.27387, -2.154423, 3.455463, 0, 0, 0, 1, 1,
1.275311, -1.933002, 4.246847, 0, 0, 0, 1, 1,
1.28626, 3.102798, 2.461952, 1, 1, 1, 1, 1,
1.293673, -0.5304365, 1.201928, 1, 1, 1, 1, 1,
1.2958, -1.691444, 2.386449, 1, 1, 1, 1, 1,
1.302827, -0.1078935, 1.154802, 1, 1, 1, 1, 1,
1.304008, -0.6986384, 2.691582, 1, 1, 1, 1, 1,
1.315184, -0.3322905, 1.216666, 1, 1, 1, 1, 1,
1.315199, 0.6474537, 1.860846, 1, 1, 1, 1, 1,
1.316023, 0.6385089, 2.344702, 1, 1, 1, 1, 1,
1.325365, -0.816156, 0.9283421, 1, 1, 1, 1, 1,
1.328023, -0.8867441, 2.622082, 1, 1, 1, 1, 1,
1.334208, -1.972824, 2.793979, 1, 1, 1, 1, 1,
1.343615, 1.806419, -0.9513841, 1, 1, 1, 1, 1,
1.343717, -0.1644112, 0.7420095, 1, 1, 1, 1, 1,
1.350656, 0.05537942, 0.5158203, 1, 1, 1, 1, 1,
1.358515, 0.7831445, -1.103097, 1, 1, 1, 1, 1,
1.368651, 0.6955582, 2.240602, 0, 0, 1, 1, 1,
1.381431, -0.1922589, 0.8799415, 1, 0, 0, 1, 1,
1.397242, -0.6481047, 3.157929, 1, 0, 0, 1, 1,
1.403609, 0.5514681, 0.8585455, 1, 0, 0, 1, 1,
1.407871, -1.769425, 2.043581, 1, 0, 0, 1, 1,
1.42601, -0.106537, 1.324253, 1, 0, 0, 1, 1,
1.43386, 1.937999, -0.7184344, 0, 0, 0, 1, 1,
1.433862, -1.054122, 2.308947, 0, 0, 0, 1, 1,
1.434974, -1.210888, 3.158111, 0, 0, 0, 1, 1,
1.435683, 1.628421, 1.549094, 0, 0, 0, 1, 1,
1.438991, -1.140733, 1.223168, 0, 0, 0, 1, 1,
1.444785, 0.3115626, 2.249517, 0, 0, 0, 1, 1,
1.454912, -2.057681, 4.873339, 0, 0, 0, 1, 1,
1.467597, -0.8987775, 2.716549, 1, 1, 1, 1, 1,
1.468678, -0.7636982, 1.49184, 1, 1, 1, 1, 1,
1.477447, 1.865864, -0.6163159, 1, 1, 1, 1, 1,
1.483268, 0.7968653, 1.092947, 1, 1, 1, 1, 1,
1.49036, 0.2053831, 0.7377104, 1, 1, 1, 1, 1,
1.501647, 1.181793, 0.3340031, 1, 1, 1, 1, 1,
1.508222, -0.5262829, 0.01584039, 1, 1, 1, 1, 1,
1.520568, 1.736926, 1.344146, 1, 1, 1, 1, 1,
1.523574, 1.2983, 1.072348, 1, 1, 1, 1, 1,
1.524693, -0.4922577, 1.281894, 1, 1, 1, 1, 1,
1.529682, -0.2190841, 1.342651, 1, 1, 1, 1, 1,
1.546171, 0.5568318, 1.83226, 1, 1, 1, 1, 1,
1.550048, -0.2027509, 0.8219069, 1, 1, 1, 1, 1,
1.560765, -0.249666, 1.655933, 1, 1, 1, 1, 1,
1.565358, 0.3879713, 3.718913, 1, 1, 1, 1, 1,
1.566503, -1.033259, 2.4175, 0, 0, 1, 1, 1,
1.568784, -0.837549, 2.055542, 1, 0, 0, 1, 1,
1.576087, 0.4147908, 1.135068, 1, 0, 0, 1, 1,
1.582108, 0.8069881, 1.273143, 1, 0, 0, 1, 1,
1.588207, 0.09953597, 1.481352, 1, 0, 0, 1, 1,
1.588397, -0.3311709, 0.8207669, 1, 0, 0, 1, 1,
1.592632, -0.7767467, 1.47784, 0, 0, 0, 1, 1,
1.593691, -1.272598, 2.647413, 0, 0, 0, 1, 1,
1.597668, 0.04041851, 2.461432, 0, 0, 0, 1, 1,
1.620989, -1.058501, 1.603962, 0, 0, 0, 1, 1,
1.623007, 0.9476569, 1.40612, 0, 0, 0, 1, 1,
1.627346, 0.009488405, 1.21659, 0, 0, 0, 1, 1,
1.628022, -1.151226, 1.596378, 0, 0, 0, 1, 1,
1.628745, 0.692789, 0.4459976, 1, 1, 1, 1, 1,
1.631691, 0.5724517, 2.128934, 1, 1, 1, 1, 1,
1.663234, -0.342324, 1.468947, 1, 1, 1, 1, 1,
1.673579, -0.904045, 1.533137, 1, 1, 1, 1, 1,
1.681491, -1.119984, 2.207969, 1, 1, 1, 1, 1,
1.723322, 0.2088611, 3.027286, 1, 1, 1, 1, 1,
1.72387, -0.05966484, 1.723795, 1, 1, 1, 1, 1,
1.768896, -0.8152022, 2.164505, 1, 1, 1, 1, 1,
1.793755, -0.9433293, 2.613357, 1, 1, 1, 1, 1,
1.822535, 1.543823, -0.4068701, 1, 1, 1, 1, 1,
1.828166, 0.05314915, 0.8687063, 1, 1, 1, 1, 1,
1.867812, -1.211487, 2.128521, 1, 1, 1, 1, 1,
1.914202, 1.330884, 2.76772, 1, 1, 1, 1, 1,
1.945669, -0.1797343, 0.06810851, 1, 1, 1, 1, 1,
1.949186, 1.303465, 2.537771, 1, 1, 1, 1, 1,
1.96026, 0.7786608, -0.8732145, 0, 0, 1, 1, 1,
1.962573, 0.7629766, 2.707052, 1, 0, 0, 1, 1,
1.968498, -0.0544213, 0.7904673, 1, 0, 0, 1, 1,
1.986752, -0.5827156, 1.854511, 1, 0, 0, 1, 1,
1.987151, 1.914544, -0.07475634, 1, 0, 0, 1, 1,
2.034247, -0.01178447, 0.8575593, 1, 0, 0, 1, 1,
2.037205, -1.733099, 2.245658, 0, 0, 0, 1, 1,
2.085254, -0.2476163, 1.484579, 0, 0, 0, 1, 1,
2.085321, -2.020829, 0.4969837, 0, 0, 0, 1, 1,
2.131042, 0.977696, 0.6186635, 0, 0, 0, 1, 1,
2.229789, 0.7801626, 0.963701, 0, 0, 0, 1, 1,
2.27042, -0.3297843, 3.188004, 0, 0, 0, 1, 1,
2.284831, -0.9761095, 2.361593, 0, 0, 0, 1, 1,
2.316864, -0.4441619, 2.831094, 1, 1, 1, 1, 1,
2.374479, -0.3661951, 2.31267, 1, 1, 1, 1, 1,
2.542911, -1.564429, 3.064386, 1, 1, 1, 1, 1,
2.560683, 0.5613576, 2.224725, 1, 1, 1, 1, 1,
2.59352, -1.164103, 0.2527433, 1, 1, 1, 1, 1,
2.901623, -0.3244022, -0.5037074, 1, 1, 1, 1, 1,
3.348525, 0.7562817, 1.864591, 1, 1, 1, 1, 1
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
var radius = 9.86115;
var distance = 34.63687;
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
mvMatrix.translate( -0.3332002, 0.02100515, 0.4705906 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63687);
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
