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
-2.692473, 0.8827466, 0.374475, 1, 0, 0, 1,
-2.678169, 0.59318, -2.966882, 1, 0.007843138, 0, 1,
-2.660972, 0.9699821, -1.41281, 1, 0.01176471, 0, 1,
-2.659498, -0.6102659, -2.172687, 1, 0.01960784, 0, 1,
-2.651257, 0.4061348, -1.189061, 1, 0.02352941, 0, 1,
-2.579497, -2.072289, -3.514669, 1, 0.03137255, 0, 1,
-2.48305, 0.7286175, -2.236875, 1, 0.03529412, 0, 1,
-2.40087, -1.493261, -3.576708, 1, 0.04313726, 0, 1,
-2.34912, 1.295264, -1.378557, 1, 0.04705882, 0, 1,
-2.326308, 1.167366, -3.632092, 1, 0.05490196, 0, 1,
-2.273225, 0.173721, -3.817405, 1, 0.05882353, 0, 1,
-2.224173, 0.3736601, 0.6065332, 1, 0.06666667, 0, 1,
-2.198783, 1.888305, 0.4672063, 1, 0.07058824, 0, 1,
-2.156753, 0.3594452, -1.93337, 1, 0.07843138, 0, 1,
-2.12006, 0.1018542, -0.6124087, 1, 0.08235294, 0, 1,
-2.099764, 0.3047069, -0.6795756, 1, 0.09019608, 0, 1,
-2.05469, -0.09367463, -2.326782, 1, 0.09411765, 0, 1,
-2.049044, 0.7023934, -2.197729, 1, 0.1019608, 0, 1,
-1.997957, -0.5566292, -0.7667551, 1, 0.1098039, 0, 1,
-1.975795, 0.1098428, -1.35667, 1, 0.1137255, 0, 1,
-1.961138, -0.5749292, -2.453916, 1, 0.1215686, 0, 1,
-1.945926, 0.1702338, -1.650521, 1, 0.1254902, 0, 1,
-1.922333, 0.04067359, -2.530007, 1, 0.1333333, 0, 1,
-1.911912, 0.4252105, -2.438454, 1, 0.1372549, 0, 1,
-1.893063, 3.549065, 1.859721, 1, 0.145098, 0, 1,
-1.882274, -1.441586, -5.095914, 1, 0.1490196, 0, 1,
-1.862346, 1.781662, -1.047306, 1, 0.1568628, 0, 1,
-1.852264, -2.138206, -4.760191, 1, 0.1607843, 0, 1,
-1.850701, -0.5571834, -0.2813978, 1, 0.1686275, 0, 1,
-1.831274, -0.565213, -1.672504, 1, 0.172549, 0, 1,
-1.829425, 0.3440886, -3.319855, 1, 0.1803922, 0, 1,
-1.829424, 0.1715345, -1.029301, 1, 0.1843137, 0, 1,
-1.827629, -0.221078, -0.784397, 1, 0.1921569, 0, 1,
-1.82603, -1.255588, -3.678879, 1, 0.1960784, 0, 1,
-1.822917, 0.3559088, -0.7781466, 1, 0.2039216, 0, 1,
-1.819014, -0.004048376, -1.237862, 1, 0.2117647, 0, 1,
-1.817036, -0.2088542, -1.497368, 1, 0.2156863, 0, 1,
-1.809602, 0.8264614, -4.064373, 1, 0.2235294, 0, 1,
-1.803314, -1.126302, -2.38403, 1, 0.227451, 0, 1,
-1.777206, 0.1943132, -2.117238, 1, 0.2352941, 0, 1,
-1.765406, -1.088893, -2.291955, 1, 0.2392157, 0, 1,
-1.762232, -0.5146087, -0.7963476, 1, 0.2470588, 0, 1,
-1.756721, 0.9914311, -1.37824, 1, 0.2509804, 0, 1,
-1.755938, 1.024177, 0.8607625, 1, 0.2588235, 0, 1,
-1.749007, 0.6112921, 0.07012345, 1, 0.2627451, 0, 1,
-1.71664, -1.393374, -1.726661, 1, 0.2705882, 0, 1,
-1.711233, -1.298635, -2.702985, 1, 0.2745098, 0, 1,
-1.71051, -1.797636, -3.388027, 1, 0.282353, 0, 1,
-1.696333, 1.452652, 0.04104874, 1, 0.2862745, 0, 1,
-1.691342, -0.3445056, 0.8938752, 1, 0.2941177, 0, 1,
-1.683695, -0.8135552, -1.693285, 1, 0.3019608, 0, 1,
-1.645628, 1.605548, -2.898222, 1, 0.3058824, 0, 1,
-1.632436, -0.7941595, -1.572815, 1, 0.3137255, 0, 1,
-1.617628, 1.086994, -1.242832, 1, 0.3176471, 0, 1,
-1.61729, -0.6085435, -2.997144, 1, 0.3254902, 0, 1,
-1.611518, 1.779523, -0.3920279, 1, 0.3294118, 0, 1,
-1.603879, -1.981611, -1.73067, 1, 0.3372549, 0, 1,
-1.585165, -0.3722566, -1.104159, 1, 0.3411765, 0, 1,
-1.569478, -0.3637947, -1.970262, 1, 0.3490196, 0, 1,
-1.565811, -1.190001, -3.166755, 1, 0.3529412, 0, 1,
-1.552957, -0.1369704, -1.049964, 1, 0.3607843, 0, 1,
-1.53389, 1.585266, -1.416252, 1, 0.3647059, 0, 1,
-1.512968, 0.4821455, -0.4883668, 1, 0.372549, 0, 1,
-1.509341, 1.489154, 0.6497609, 1, 0.3764706, 0, 1,
-1.506001, -0.1532389, -1.046402, 1, 0.3843137, 0, 1,
-1.50001, -0.990176, -2.721131, 1, 0.3882353, 0, 1,
-1.499277, 1.174139, -2.853328, 1, 0.3960784, 0, 1,
-1.488037, 0.4872958, -1.247699, 1, 0.4039216, 0, 1,
-1.458504, -2.385725, -1.81828, 1, 0.4078431, 0, 1,
-1.44748, -0.3935921, -1.916816, 1, 0.4156863, 0, 1,
-1.439644, 0.1206184, -1.169771, 1, 0.4196078, 0, 1,
-1.420259, 0.7687579, -0.7418961, 1, 0.427451, 0, 1,
-1.409128, -1.218642, -3.23194, 1, 0.4313726, 0, 1,
-1.404754, -0.7378759, -2.781918, 1, 0.4392157, 0, 1,
-1.404599, -0.8352363, -2.936122, 1, 0.4431373, 0, 1,
-1.399481, 0.9544989, 1.120428, 1, 0.4509804, 0, 1,
-1.386736, -1.258262, -1.714646, 1, 0.454902, 0, 1,
-1.384416, -0.3935654, -3.551116, 1, 0.4627451, 0, 1,
-1.38432, 0.2826761, -1.105787, 1, 0.4666667, 0, 1,
-1.382446, 0.5654462, -0.6448423, 1, 0.4745098, 0, 1,
-1.378466, 0.3502007, -1.804225, 1, 0.4784314, 0, 1,
-1.377877, 0.587007, 0.9690548, 1, 0.4862745, 0, 1,
-1.376344, 0.3261923, -0.3336021, 1, 0.4901961, 0, 1,
-1.366639, 2.391732, -0.6973515, 1, 0.4980392, 0, 1,
-1.364001, -0.4753911, -3.459185, 1, 0.5058824, 0, 1,
-1.357097, -0.3313127, -1.469431, 1, 0.509804, 0, 1,
-1.338262, 0.2144211, -2.23243, 1, 0.5176471, 0, 1,
-1.335977, 1.199236, -2.548356, 1, 0.5215687, 0, 1,
-1.333016, -0.3549759, -1.110987, 1, 0.5294118, 0, 1,
-1.326567, 1.083992, -1.000812, 1, 0.5333334, 0, 1,
-1.294878, -1.395999, -2.60304, 1, 0.5411765, 0, 1,
-1.268782, 0.7120858, -2.154719, 1, 0.5450981, 0, 1,
-1.268385, 1.151671, -0.9501183, 1, 0.5529412, 0, 1,
-1.266743, -0.07599062, -1.231988, 1, 0.5568628, 0, 1,
-1.265802, -2.413076, -2.118148, 1, 0.5647059, 0, 1,
-1.263231, 0.4566892, -0.300598, 1, 0.5686275, 0, 1,
-1.246557, 1.290096, -0.6752523, 1, 0.5764706, 0, 1,
-1.232402, 0.1323384, -3.788842, 1, 0.5803922, 0, 1,
-1.221946, 0.2852361, -1.438277, 1, 0.5882353, 0, 1,
-1.221614, 1.513322, 0.3419523, 1, 0.5921569, 0, 1,
-1.216928, -0.3663497, -0.146954, 1, 0.6, 0, 1,
-1.214939, 0.5154362, -1.693169, 1, 0.6078432, 0, 1,
-1.211744, 0.3601452, -2.216535, 1, 0.6117647, 0, 1,
-1.206697, 0.5183209, -2.364489, 1, 0.6196079, 0, 1,
-1.206112, -1.129028, -3.416476, 1, 0.6235294, 0, 1,
-1.198644, -1.231352, -1.847793, 1, 0.6313726, 0, 1,
-1.196864, -0.1180557, -2.246302, 1, 0.6352941, 0, 1,
-1.190824, 0.5029561, -0.5854971, 1, 0.6431373, 0, 1,
-1.185783, -0.3011628, -1.227452, 1, 0.6470588, 0, 1,
-1.185057, 0.3634322, -3.006912, 1, 0.654902, 0, 1,
-1.179834, -0.926588, -1.079637, 1, 0.6588235, 0, 1,
-1.169717, 0.2688315, -0.699957, 1, 0.6666667, 0, 1,
-1.168304, 0.3416851, -1.717254, 1, 0.6705883, 0, 1,
-1.161566, -0.6667113, -2.605414, 1, 0.6784314, 0, 1,
-1.158387, -1.661215, -3.302672, 1, 0.682353, 0, 1,
-1.156817, 1.142368, -3.014132, 1, 0.6901961, 0, 1,
-1.154464, -0.01615357, -1.351815, 1, 0.6941177, 0, 1,
-1.150035, -0.3260378, -2.205152, 1, 0.7019608, 0, 1,
-1.147482, -0.258346, -2.320899, 1, 0.7098039, 0, 1,
-1.135498, 1.186123, -0.5467202, 1, 0.7137255, 0, 1,
-1.131442, -0.9567645, -4.346638, 1, 0.7215686, 0, 1,
-1.125967, 2.008317, 1.15781, 1, 0.7254902, 0, 1,
-1.123956, 1.210136, -0.5608956, 1, 0.7333333, 0, 1,
-1.119079, 0.4580778, -1.600023, 1, 0.7372549, 0, 1,
-1.117407, -0.9377299, -3.079967, 1, 0.7450981, 0, 1,
-1.116794, 0.5535129, -1.588123, 1, 0.7490196, 0, 1,
-1.115882, 0.01434683, -0.6824379, 1, 0.7568628, 0, 1,
-1.113974, -0.646227, -1.219861, 1, 0.7607843, 0, 1,
-1.109187, -0.2169355, -1.98705, 1, 0.7686275, 0, 1,
-1.099692, -0.5145321, -2.257948, 1, 0.772549, 0, 1,
-1.085986, 0.6945994, 0.3033615, 1, 0.7803922, 0, 1,
-1.079674, 0.2552616, -2.528587, 1, 0.7843137, 0, 1,
-1.077555, -0.3214068, -0.9485962, 1, 0.7921569, 0, 1,
-1.075514, 0.2322851, -0.5458311, 1, 0.7960784, 0, 1,
-1.074942, 1.015292, 0.4101472, 1, 0.8039216, 0, 1,
-1.071416, 0.1146455, 0.452701, 1, 0.8117647, 0, 1,
-1.068659, -1.889944, -2.664608, 1, 0.8156863, 0, 1,
-1.068083, -0.5874249, -1.987245, 1, 0.8235294, 0, 1,
-1.065972, 0.03176326, -2.685394, 1, 0.827451, 0, 1,
-1.062097, -0.006687207, -0.808553, 1, 0.8352941, 0, 1,
-1.050975, 0.8153346, 1.385476, 1, 0.8392157, 0, 1,
-1.042849, 1.799821, -2.330971, 1, 0.8470588, 0, 1,
-1.042603, -0.369995, -0.2080022, 1, 0.8509804, 0, 1,
-1.041963, -0.8228474, -1.547082, 1, 0.8588235, 0, 1,
-1.041382, 0.444298, -1.193689, 1, 0.8627451, 0, 1,
-1.037943, -0.1401895, -1.507765, 1, 0.8705882, 0, 1,
-1.037885, -0.5671914, -1.485616, 1, 0.8745098, 0, 1,
-1.036199, 0.1526114, -0.9344642, 1, 0.8823529, 0, 1,
-1.029714, -0.5474733, -2.468849, 1, 0.8862745, 0, 1,
-1.029538, -0.2281142, -2.0077, 1, 0.8941177, 0, 1,
-1.010177, -0.3166495, -3.107077, 1, 0.8980392, 0, 1,
-1.009223, -0.2417456, -1.478, 1, 0.9058824, 0, 1,
-1.007323, -0.3855535, -4.124883, 1, 0.9137255, 0, 1,
-1.002937, 0.01786678, -1.739084, 1, 0.9176471, 0, 1,
-0.9943989, -1.367848, -2.699131, 1, 0.9254902, 0, 1,
-0.9920161, -0.3522375, -1.194067, 1, 0.9294118, 0, 1,
-0.9908157, 1.601018, -1.662157, 1, 0.9372549, 0, 1,
-0.98641, 0.5046311, 0.08818422, 1, 0.9411765, 0, 1,
-0.9828716, -0.9735908, -2.329876, 1, 0.9490196, 0, 1,
-0.9827469, 0.06968109, -0.5550838, 1, 0.9529412, 0, 1,
-0.9819705, -0.1205216, -1.289858, 1, 0.9607843, 0, 1,
-0.9774879, 0.780188, -2.838828, 1, 0.9647059, 0, 1,
-0.9769972, 1.401656, -1.171789, 1, 0.972549, 0, 1,
-0.9746228, 0.4160631, -2.396507, 1, 0.9764706, 0, 1,
-0.9482638, -1.904256, -2.123452, 1, 0.9843137, 0, 1,
-0.9450535, 1.098767, -0.888344, 1, 0.9882353, 0, 1,
-0.9423949, -0.09775975, -0.7015161, 1, 0.9960784, 0, 1,
-0.9389794, 0.5468253, -0.4526409, 0.9960784, 1, 0, 1,
-0.9374049, 0.7599112, -0.3602027, 0.9921569, 1, 0, 1,
-0.9368706, 0.2030057, -0.4784955, 0.9843137, 1, 0, 1,
-0.9335797, -1.052382, -2.886987, 0.9803922, 1, 0, 1,
-0.9315716, -0.2247, -2.045444, 0.972549, 1, 0, 1,
-0.9307091, -1.703357, -3.940387, 0.9686275, 1, 0, 1,
-0.9304097, 1.81408, 0.5656711, 0.9607843, 1, 0, 1,
-0.9231243, -0.135566, -1.967735, 0.9568627, 1, 0, 1,
-0.9170473, -0.0075206, -2.016509, 0.9490196, 1, 0, 1,
-0.9102889, -1.626896, -3.168082, 0.945098, 1, 0, 1,
-0.9003552, -0.3432276, -2.47282, 0.9372549, 1, 0, 1,
-0.8997872, -2.284428, -2.058935, 0.9333333, 1, 0, 1,
-0.8936615, -0.2758117, -1.864, 0.9254902, 1, 0, 1,
-0.8858907, 1.083445, -0.1146975, 0.9215686, 1, 0, 1,
-0.8838702, 0.7844384, -1.046577, 0.9137255, 1, 0, 1,
-0.8810619, -0.2188136, -0.9432811, 0.9098039, 1, 0, 1,
-0.878502, -1.792863, -1.905225, 0.9019608, 1, 0, 1,
-0.8538727, -0.9871316, -2.079687, 0.8941177, 1, 0, 1,
-0.8443102, -0.3116378, -3.844468, 0.8901961, 1, 0, 1,
-0.8426973, -0.2033201, -2.559692, 0.8823529, 1, 0, 1,
-0.8421704, 0.7431347, 0.6181268, 0.8784314, 1, 0, 1,
-0.8420324, -0.4052161, -1.967554, 0.8705882, 1, 0, 1,
-0.8380911, 0.6164281, -1.581608, 0.8666667, 1, 0, 1,
-0.8359341, -0.5485697, -2.729771, 0.8588235, 1, 0, 1,
-0.832361, 0.1525928, -1.372662, 0.854902, 1, 0, 1,
-0.8242124, 0.2469608, -1.369999, 0.8470588, 1, 0, 1,
-0.823377, 0.7820163, -1.270017, 0.8431373, 1, 0, 1,
-0.820263, -0.9646825, -1.420565, 0.8352941, 1, 0, 1,
-0.8159238, 0.04355301, -0.7033664, 0.8313726, 1, 0, 1,
-0.8121356, 0.1139768, -1.296882, 0.8235294, 1, 0, 1,
-0.8120026, 0.01576226, -2.792764, 0.8196079, 1, 0, 1,
-0.8102127, 0.3608443, -2.801024, 0.8117647, 1, 0, 1,
-0.8089398, -0.1303046, -3.061494, 0.8078431, 1, 0, 1,
-0.8082259, -1.248562, -3.884342, 0.8, 1, 0, 1,
-0.8028556, 0.1340152, -0.2570931, 0.7921569, 1, 0, 1,
-0.8022026, 0.8906354, 0.5480628, 0.7882353, 1, 0, 1,
-0.7990616, -0.7536792, -1.936109, 0.7803922, 1, 0, 1,
-0.793117, 1.122244, -1.21068, 0.7764706, 1, 0, 1,
-0.7910685, 1.347468, -0.6838728, 0.7686275, 1, 0, 1,
-0.7907385, -0.5537732, -1.385949, 0.7647059, 1, 0, 1,
-0.7883201, -0.1875497, -1.10552, 0.7568628, 1, 0, 1,
-0.7872061, 0.7583272, 2.187791, 0.7529412, 1, 0, 1,
-0.7852879, 1.11577, -0.01547511, 0.7450981, 1, 0, 1,
-0.782007, -0.09101567, -3.823636, 0.7411765, 1, 0, 1,
-0.7817353, -0.6988549, -3.151467, 0.7333333, 1, 0, 1,
-0.7747073, -1.255219, -3.863305, 0.7294118, 1, 0, 1,
-0.7640159, -0.1841881, -1.334318, 0.7215686, 1, 0, 1,
-0.757251, -0.3653647, -1.680778, 0.7176471, 1, 0, 1,
-0.7555034, 0.04280549, -0.6062533, 0.7098039, 1, 0, 1,
-0.7540874, 0.3126814, 0.568189, 0.7058824, 1, 0, 1,
-0.7509111, 1.492744, -1.757149, 0.6980392, 1, 0, 1,
-0.7507529, 0.4884401, 0.4391183, 0.6901961, 1, 0, 1,
-0.7407971, 0.6195671, -0.1871573, 0.6862745, 1, 0, 1,
-0.7407727, -1.256514, -3.31282, 0.6784314, 1, 0, 1,
-0.7377913, -1.079307, -3.312893, 0.6745098, 1, 0, 1,
-0.7368265, 1.054467, 1.548063, 0.6666667, 1, 0, 1,
-0.7351066, -0.5946672, -2.172873, 0.6627451, 1, 0, 1,
-0.7330641, 0.8725812, -0.117269, 0.654902, 1, 0, 1,
-0.7325303, -0.9160713, -3.99641, 0.6509804, 1, 0, 1,
-0.7316562, -1.035257, -3.771763, 0.6431373, 1, 0, 1,
-0.7303165, -1.205381, -2.805858, 0.6392157, 1, 0, 1,
-0.7258905, -1.617831, -2.993302, 0.6313726, 1, 0, 1,
-0.7251298, -2.15911, -3.576368, 0.627451, 1, 0, 1,
-0.7217622, -0.3329255, -2.444803, 0.6196079, 1, 0, 1,
-0.7203683, 0.2160528, -2.628816, 0.6156863, 1, 0, 1,
-0.7162602, -0.4716627, -3.640337, 0.6078432, 1, 0, 1,
-0.7080841, 0.1829023, -1.141745, 0.6039216, 1, 0, 1,
-0.7021843, 0.09527969, -1.708625, 0.5960785, 1, 0, 1,
-0.7006022, 0.2033785, -2.12823, 0.5882353, 1, 0, 1,
-0.6964016, -1.141837, -2.020605, 0.5843138, 1, 0, 1,
-0.6933803, 2.453533, -1.023355, 0.5764706, 1, 0, 1,
-0.6808625, 0.4653908, -0.2285495, 0.572549, 1, 0, 1,
-0.6798769, -0.06635248, -0.8841872, 0.5647059, 1, 0, 1,
-0.6790075, -1.970262, -3.17562, 0.5607843, 1, 0, 1,
-0.6788031, -0.2082788, -3.048591, 0.5529412, 1, 0, 1,
-0.676894, 0.6650833, -0.6094471, 0.5490196, 1, 0, 1,
-0.676713, 0.5581632, -0.9751405, 0.5411765, 1, 0, 1,
-0.6750196, 0.522819, -0.2822478, 0.5372549, 1, 0, 1,
-0.6727634, -0.6279369, -1.450427, 0.5294118, 1, 0, 1,
-0.6605492, -1.357311, -1.791794, 0.5254902, 1, 0, 1,
-0.6600386, -0.07035407, -1.491665, 0.5176471, 1, 0, 1,
-0.6599218, 0.3510706, -2.99509, 0.5137255, 1, 0, 1,
-0.6596883, -0.5926504, -0.5436963, 0.5058824, 1, 0, 1,
-0.6596561, 0.2485063, -2.50984, 0.5019608, 1, 0, 1,
-0.6588533, 0.2133166, 0.166853, 0.4941176, 1, 0, 1,
-0.6575924, 0.4990739, -1.565255, 0.4862745, 1, 0, 1,
-0.655487, 1.177739, -1.747499, 0.4823529, 1, 0, 1,
-0.6540824, 1.124253, -1.080901, 0.4745098, 1, 0, 1,
-0.6533496, -1.350893, -4.182122, 0.4705882, 1, 0, 1,
-0.6480232, 0.1673762, 0.2730377, 0.4627451, 1, 0, 1,
-0.6444454, 0.373306, -0.9509455, 0.4588235, 1, 0, 1,
-0.6437094, -0.2350833, -1.694031, 0.4509804, 1, 0, 1,
-0.6381679, 0.5550495, -0.5196862, 0.4470588, 1, 0, 1,
-0.6322564, -1.881716, -3.712386, 0.4392157, 1, 0, 1,
-0.6300226, -0.9290007, -3.453054, 0.4352941, 1, 0, 1,
-0.6298975, 0.7379519, -0.4951675, 0.427451, 1, 0, 1,
-0.6270759, -0.1425613, -3.018694, 0.4235294, 1, 0, 1,
-0.6187226, 0.2280515, -1.605984, 0.4156863, 1, 0, 1,
-0.613482, 1.096903, -0.5904895, 0.4117647, 1, 0, 1,
-0.6133616, 1.506929, -1.525839, 0.4039216, 1, 0, 1,
-0.6112847, 1.077655, 0.007590524, 0.3960784, 1, 0, 1,
-0.6088073, -0.1709972, -2.08706, 0.3921569, 1, 0, 1,
-0.6072344, -1.456479, -2.763907, 0.3843137, 1, 0, 1,
-0.5867671, -0.1052626, -1.436558, 0.3803922, 1, 0, 1,
-0.5844887, 1.867009, -1.798352, 0.372549, 1, 0, 1,
-0.5843608, -0.3985736, -5.392785, 0.3686275, 1, 0, 1,
-0.5837702, -0.3806745, -2.878006, 0.3607843, 1, 0, 1,
-0.582095, 1.005938, 0.1830041, 0.3568628, 1, 0, 1,
-0.5807093, 0.2875638, -1.080123, 0.3490196, 1, 0, 1,
-0.5716361, -0.1220801, -1.070445, 0.345098, 1, 0, 1,
-0.5705387, 1.35874, -0.8060227, 0.3372549, 1, 0, 1,
-0.5659297, 0.6938093, -0.1811232, 0.3333333, 1, 0, 1,
-0.5588424, 1.325241, -0.03118599, 0.3254902, 1, 0, 1,
-0.5574872, 0.6210514, 0.585811, 0.3215686, 1, 0, 1,
-0.5466102, 1.134791, -0.5101742, 0.3137255, 1, 0, 1,
-0.5457555, 1.317272, -1.634279, 0.3098039, 1, 0, 1,
-0.5428037, -1.231055, -2.168221, 0.3019608, 1, 0, 1,
-0.5420354, -0.8223243, -2.164599, 0.2941177, 1, 0, 1,
-0.5379888, 0.3569414, -0.962284, 0.2901961, 1, 0, 1,
-0.5355596, 0.5710061, -2.811594, 0.282353, 1, 0, 1,
-0.5301063, 0.2424039, -1.187433, 0.2784314, 1, 0, 1,
-0.5289654, 0.5066574, -0.2143018, 0.2705882, 1, 0, 1,
-0.5254223, 2.216398, -2.970072, 0.2666667, 1, 0, 1,
-0.5230126, -0.1835992, -2.669895, 0.2588235, 1, 0, 1,
-0.5193571, 1.543162, -0.7463158, 0.254902, 1, 0, 1,
-0.5188889, -0.274779, -0.1622598, 0.2470588, 1, 0, 1,
-0.5177717, -0.131159, -2.038276, 0.2431373, 1, 0, 1,
-0.5176747, 1.253111, -0.01140707, 0.2352941, 1, 0, 1,
-0.5142256, -0.601113, -4.452482, 0.2313726, 1, 0, 1,
-0.5112346, -0.8464332, -1.896941, 0.2235294, 1, 0, 1,
-0.5092317, -0.1157267, -2.580396, 0.2196078, 1, 0, 1,
-0.5067335, -0.4504073, -2.177826, 0.2117647, 1, 0, 1,
-0.5047584, -0.1284531, -2.553073, 0.2078431, 1, 0, 1,
-0.5008392, -0.01821491, -1.034419, 0.2, 1, 0, 1,
-0.5007741, 0.7041097, -1.795134, 0.1921569, 1, 0, 1,
-0.5000439, -1.220111, -3.758465, 0.1882353, 1, 0, 1,
-0.499071, 1.082291, 1.054843, 0.1803922, 1, 0, 1,
-0.4984307, -0.2598841, -1.49819, 0.1764706, 1, 0, 1,
-0.498323, 0.3559187, -0.5201793, 0.1686275, 1, 0, 1,
-0.4977202, 2.966292, 0.1047761, 0.1647059, 1, 0, 1,
-0.496981, 0.5167841, -0.4834031, 0.1568628, 1, 0, 1,
-0.4927242, -0.5093724, -4.066057, 0.1529412, 1, 0, 1,
-0.4914157, -1.310461, -2.449864, 0.145098, 1, 0, 1,
-0.4913644, 0.3185808, -0.125821, 0.1411765, 1, 0, 1,
-0.4912758, 0.4676322, -0.02955749, 0.1333333, 1, 0, 1,
-0.4853168, 0.3294928, 0.3541571, 0.1294118, 1, 0, 1,
-0.4849897, -1.024835, -0.7398877, 0.1215686, 1, 0, 1,
-0.4840158, 0.02330161, -1.245803, 0.1176471, 1, 0, 1,
-0.4820958, 0.5847234, -1.09867, 0.1098039, 1, 0, 1,
-0.479196, -0.920804, -2.108185, 0.1058824, 1, 0, 1,
-0.4767512, -2.234097, -2.404274, 0.09803922, 1, 0, 1,
-0.4747334, -2.190392, -2.705582, 0.09019608, 1, 0, 1,
-0.4716022, 0.7395309, -0.2000902, 0.08627451, 1, 0, 1,
-0.4713231, -1.127106, -1.296723, 0.07843138, 1, 0, 1,
-0.4705598, 0.6546624, -0.3741002, 0.07450981, 1, 0, 1,
-0.4704908, -1.031621, -1.826106, 0.06666667, 1, 0, 1,
-0.4640828, 0.1445041, -2.052194, 0.0627451, 1, 0, 1,
-0.4598836, 1.358945, -1.624115, 0.05490196, 1, 0, 1,
-0.458124, -0.3878622, -2.99274, 0.05098039, 1, 0, 1,
-0.4544418, 1.195685, 0.09904915, 0.04313726, 1, 0, 1,
-0.4487604, 1.437461, 0.03928079, 0.03921569, 1, 0, 1,
-0.4328822, 0.6979586, -0.1690179, 0.03137255, 1, 0, 1,
-0.4310498, 0.622131, -1.13383, 0.02745098, 1, 0, 1,
-0.4278848, -0.8095393, -2.610686, 0.01960784, 1, 0, 1,
-0.4274992, 0.2388204, 0.1606557, 0.01568628, 1, 0, 1,
-0.4129364, 0.1067024, -0.5208797, 0.007843138, 1, 0, 1,
-0.4120502, 1.416585, 0.6234781, 0.003921569, 1, 0, 1,
-0.4054244, 0.2002582, -0.9229327, 0, 1, 0.003921569, 1,
-0.4050911, 1.935858, 1.578751, 0, 1, 0.01176471, 1,
-0.4039448, -0.3284927, -1.921766, 0, 1, 0.01568628, 1,
-0.4027539, -0.5170727, -0.3603904, 0, 1, 0.02352941, 1,
-0.4022543, -0.7005592, -1.654245, 0, 1, 0.02745098, 1,
-0.3889642, 0.6980794, -2.612854, 0, 1, 0.03529412, 1,
-0.3868219, 0.03029498, -2.531084, 0, 1, 0.03921569, 1,
-0.3847742, -1.435318, -2.395271, 0, 1, 0.04705882, 1,
-0.383951, 0.3049215, -0.8311125, 0, 1, 0.05098039, 1,
-0.3781011, 0.955254, -1.274624, 0, 1, 0.05882353, 1,
-0.3757244, 1.628103, -0.7304274, 0, 1, 0.0627451, 1,
-0.3743895, 0.2953261, -1.449439, 0, 1, 0.07058824, 1,
-0.3740672, 1.526318, 0.1727315, 0, 1, 0.07450981, 1,
-0.373744, 1.281526, 1.326409, 0, 1, 0.08235294, 1,
-0.3714922, 0.3361576, 0.8280616, 0, 1, 0.08627451, 1,
-0.371447, 0.02807983, -1.391341, 0, 1, 0.09411765, 1,
-0.3702076, -0.3316988, -3.735362, 0, 1, 0.1019608, 1,
-0.3689702, 1.017656, -0.1436358, 0, 1, 0.1058824, 1,
-0.3688366, -0.6746773, -3.745284, 0, 1, 0.1137255, 1,
-0.3652596, -1.556461, -1.936623, 0, 1, 0.1176471, 1,
-0.3631432, 0.261066, -0.9959308, 0, 1, 0.1254902, 1,
-0.3621459, 2.344962, 0.8214536, 0, 1, 0.1294118, 1,
-0.3604891, 2.016936, -0.494264, 0, 1, 0.1372549, 1,
-0.3603422, -0.8300441, -3.787453, 0, 1, 0.1411765, 1,
-0.3578728, -1.04511, -1.850075, 0, 1, 0.1490196, 1,
-0.3540417, -1.192845, -3.687364, 0, 1, 0.1529412, 1,
-0.3528662, -0.6683544, -3.382408, 0, 1, 0.1607843, 1,
-0.3528172, -0.593672, -2.900438, 0, 1, 0.1647059, 1,
-0.3478832, 0.7406653, -0.9365157, 0, 1, 0.172549, 1,
-0.3433682, 1.359048, -0.6369433, 0, 1, 0.1764706, 1,
-0.3380378, -0.629684, -4.430009, 0, 1, 0.1843137, 1,
-0.3341454, 0.2667731, -1.193532, 0, 1, 0.1882353, 1,
-0.3321012, -1.345905, -1.888906, 0, 1, 0.1960784, 1,
-0.3294383, 0.9265789, 1.495642, 0, 1, 0.2039216, 1,
-0.3234541, 2.375015, -1.599733, 0, 1, 0.2078431, 1,
-0.3230602, -1.008242, -2.84775, 0, 1, 0.2156863, 1,
-0.32295, 1.811927, -0.5609225, 0, 1, 0.2196078, 1,
-0.3220356, -1.501423, -1.827133, 0, 1, 0.227451, 1,
-0.3189873, 0.7508355, 0.4010413, 0, 1, 0.2313726, 1,
-0.3168809, 0.8520221, 0.5502297, 0, 1, 0.2392157, 1,
-0.313769, 1.212771, -0.6301743, 0, 1, 0.2431373, 1,
-0.3127739, -1.784294, -3.33193, 0, 1, 0.2509804, 1,
-0.3118214, -0.4394217, -1.368972, 0, 1, 0.254902, 1,
-0.3100796, 0.8233148, -0.9044234, 0, 1, 0.2627451, 1,
-0.3038621, -1.299808, -1.610695, 0, 1, 0.2666667, 1,
-0.296802, -0.5719772, -0.7819715, 0, 1, 0.2745098, 1,
-0.2887179, 0.5066621, -0.8706176, 0, 1, 0.2784314, 1,
-0.2840644, 1.556155, 0.9385383, 0, 1, 0.2862745, 1,
-0.2806928, 1.524231, 0.09282568, 0, 1, 0.2901961, 1,
-0.2803554, 0.5136682, -0.8914284, 0, 1, 0.2980392, 1,
-0.2793554, -0.002095522, -2.969801, 0, 1, 0.3058824, 1,
-0.2777029, -0.01822058, -1.391212, 0, 1, 0.3098039, 1,
-0.2751251, -1.183631, -1.556087, 0, 1, 0.3176471, 1,
-0.2730934, -0.1729152, -2.983059, 0, 1, 0.3215686, 1,
-0.2718741, -0.344702, -3.515916, 0, 1, 0.3294118, 1,
-0.2713413, -0.5841621, -3.779338, 0, 1, 0.3333333, 1,
-0.2704761, -2.217567, -1.805532, 0, 1, 0.3411765, 1,
-0.2674938, 1.678022, 1.718755, 0, 1, 0.345098, 1,
-0.2665849, 0.567524, 0.6334185, 0, 1, 0.3529412, 1,
-0.2629398, -0.990119, -3.262851, 0, 1, 0.3568628, 1,
-0.2626467, 0.655004, -0.7929724, 0, 1, 0.3647059, 1,
-0.2541452, 1.711567, 0.51356, 0, 1, 0.3686275, 1,
-0.2509185, -0.5424933, -1.292337, 0, 1, 0.3764706, 1,
-0.2504005, -0.4091346, -2.128653, 0, 1, 0.3803922, 1,
-0.2461874, 0.9614404, 0.2799687, 0, 1, 0.3882353, 1,
-0.2442072, 0.3207352, -1.681046, 0, 1, 0.3921569, 1,
-0.243924, 0.4883058, -2.440641, 0, 1, 0.4, 1,
-0.2406828, -1.027328, -2.625091, 0, 1, 0.4078431, 1,
-0.2322066, 0.1695777, -2.530082, 0, 1, 0.4117647, 1,
-0.230084, 0.9363832, 1.160176, 0, 1, 0.4196078, 1,
-0.2237551, -0.8049211, -2.648989, 0, 1, 0.4235294, 1,
-0.221226, 2.316175, -0.03391504, 0, 1, 0.4313726, 1,
-0.2185226, -1.200573, -1.156781, 0, 1, 0.4352941, 1,
-0.2166538, -2.365351, -3.523658, 0, 1, 0.4431373, 1,
-0.2154273, -0.4536975, -0.6735803, 0, 1, 0.4470588, 1,
-0.2148263, -0.7774594, -2.965852, 0, 1, 0.454902, 1,
-0.214324, 0.2577956, -0.6091055, 0, 1, 0.4588235, 1,
-0.2105938, -0.4243033, -2.287091, 0, 1, 0.4666667, 1,
-0.2069044, 0.5371023, -1.225279, 0, 1, 0.4705882, 1,
-0.2068221, -0.4645264, -2.423463, 0, 1, 0.4784314, 1,
-0.2061422, 0.5721115, -0.8372177, 0, 1, 0.4823529, 1,
-0.2029113, 1.327544, -1.068339, 0, 1, 0.4901961, 1,
-0.2018776, 0.5940806, -0.6411598, 0, 1, 0.4941176, 1,
-0.1998725, 0.3695352, -3.106437, 0, 1, 0.5019608, 1,
-0.1981522, -0.4500773, -3.331249, 0, 1, 0.509804, 1,
-0.1929193, 0.717751, -1.301368, 0, 1, 0.5137255, 1,
-0.1912923, 0.8777522, -0.6749787, 0, 1, 0.5215687, 1,
-0.189864, -0.1882237, -2.168898, 0, 1, 0.5254902, 1,
-0.1829021, -0.5156259, -3.010105, 0, 1, 0.5333334, 1,
-0.1804308, -0.6005422, -2.489913, 0, 1, 0.5372549, 1,
-0.1743477, 0.4193391, 0.8973958, 0, 1, 0.5450981, 1,
-0.1733207, -0.1258959, -2.332836, 0, 1, 0.5490196, 1,
-0.1725244, -0.3710504, -2.0362, 0, 1, 0.5568628, 1,
-0.1667641, 0.2145944, 0.8172309, 0, 1, 0.5607843, 1,
-0.1655504, -1.174731, -2.114802, 0, 1, 0.5686275, 1,
-0.1627526, 1.246881, 0.3963221, 0, 1, 0.572549, 1,
-0.1562689, 0.2217594, -0.709137, 0, 1, 0.5803922, 1,
-0.1562411, -0.5203306, -2.242178, 0, 1, 0.5843138, 1,
-0.1486197, 0.1849647, 0.8207083, 0, 1, 0.5921569, 1,
-0.1482637, 1.092562, 2.200046, 0, 1, 0.5960785, 1,
-0.1460814, -0.04104733, -1.076635, 0, 1, 0.6039216, 1,
-0.1453261, 0.1799029, 0.9509128, 0, 1, 0.6117647, 1,
-0.1425966, -0.7430297, -2.878469, 0, 1, 0.6156863, 1,
-0.1424956, 0.7109594, -1.614449, 0, 1, 0.6235294, 1,
-0.142461, 0.1417667, -1.19723, 0, 1, 0.627451, 1,
-0.1396471, -0.985667, -4.810119, 0, 1, 0.6352941, 1,
-0.1370269, 1.727781, -2.113198, 0, 1, 0.6392157, 1,
-0.1357383, -1.069924, -3.787534, 0, 1, 0.6470588, 1,
-0.1276212, 0.3509158, -0.2918763, 0, 1, 0.6509804, 1,
-0.1272746, -0.7387705, -3.961625, 0, 1, 0.6588235, 1,
-0.1250878, -0.5100954, -1.700685, 0, 1, 0.6627451, 1,
-0.1205066, 1.078393, 0.1013205, 0, 1, 0.6705883, 1,
-0.1138192, 0.1566691, -2.479876, 0, 1, 0.6745098, 1,
-0.1124759, -0.5491872, -2.932462, 0, 1, 0.682353, 1,
-0.1105664, 1.091826, -0.1352402, 0, 1, 0.6862745, 1,
-0.1092269, -0.03659292, -0.8127204, 0, 1, 0.6941177, 1,
-0.1070779, 0.8629653, 0.1057207, 0, 1, 0.7019608, 1,
-0.106348, -1.362974, -1.898975, 0, 1, 0.7058824, 1,
-0.0997325, 0.5712755, -0.3222369, 0, 1, 0.7137255, 1,
-0.09844247, 0.8809059, 0.4698949, 0, 1, 0.7176471, 1,
-0.09797528, 0.9713746, -0.006820074, 0, 1, 0.7254902, 1,
-0.09592852, -1.321057, -2.884479, 0, 1, 0.7294118, 1,
-0.09379843, -0.1673663, -1.450554, 0, 1, 0.7372549, 1,
-0.0923448, -1.22268, -1.234639, 0, 1, 0.7411765, 1,
-0.09184523, 0.3918321, -2.520098, 0, 1, 0.7490196, 1,
-0.09046239, -0.9253665, -1.491315, 0, 1, 0.7529412, 1,
-0.08555482, 0.01446117, -1.590996, 0, 1, 0.7607843, 1,
-0.08374703, 0.02209817, -1.118387, 0, 1, 0.7647059, 1,
-0.07876822, -1.280449, -2.102532, 0, 1, 0.772549, 1,
-0.07794908, -0.7497507, -2.787129, 0, 1, 0.7764706, 1,
-0.07495385, 1.069776, -0.1020623, 0, 1, 0.7843137, 1,
-0.07207824, -1.237949, -2.20058, 0, 1, 0.7882353, 1,
-0.06945994, -0.1000757, -2.171245, 0, 1, 0.7960784, 1,
-0.06889124, -0.5613078, -3.076506, 0, 1, 0.8039216, 1,
-0.0671034, -0.3011443, -4.751839, 0, 1, 0.8078431, 1,
-0.0648491, 1.263276, 0.7178242, 0, 1, 0.8156863, 1,
-0.06001136, 0.417888, -1.699888, 0, 1, 0.8196079, 1,
-0.04573568, 1.843572, 0.2724301, 0, 1, 0.827451, 1,
-0.04362919, -0.2060959, -1.520908, 0, 1, 0.8313726, 1,
-0.04029215, -0.1778946, -2.333793, 0, 1, 0.8392157, 1,
-0.03990193, 0.4726076, -1.934113, 0, 1, 0.8431373, 1,
-0.03665811, -1.145545, -4.210834, 0, 1, 0.8509804, 1,
-0.03653502, -0.06226483, -2.095192, 0, 1, 0.854902, 1,
-0.03594929, 1.206874, -0.2165677, 0, 1, 0.8627451, 1,
-0.03525538, -0.747024, -2.03403, 0, 1, 0.8666667, 1,
-0.03485797, -1.1181, -3.009488, 0, 1, 0.8745098, 1,
-0.03333067, -1.160347, -2.926702, 0, 1, 0.8784314, 1,
-0.03185284, 0.328721, 1.121746, 0, 1, 0.8862745, 1,
-0.02818688, -0.1936788, -4.158798, 0, 1, 0.8901961, 1,
-0.02715993, -1.048763, -3.580432, 0, 1, 0.8980392, 1,
-0.02072247, -1.199218, -4.009254, 0, 1, 0.9058824, 1,
-0.01841211, 0.07401809, -1.096099, 0, 1, 0.9098039, 1,
-0.01553079, -0.6504582, -5.237397, 0, 1, 0.9176471, 1,
-0.01306386, -0.8783754, -3.07837, 0, 1, 0.9215686, 1,
-0.01211795, 1.977385, 0.07281646, 0, 1, 0.9294118, 1,
-0.004121053, 0.9382461, -0.5468031, 0, 1, 0.9333333, 1,
-0.002944036, 0.6443632, -0.7048148, 0, 1, 0.9411765, 1,
0.008219901, 0.6822549, -0.7132539, 0, 1, 0.945098, 1,
0.008780091, 0.4043362, 1.965103, 0, 1, 0.9529412, 1,
0.009694437, -2.712181, 2.167221, 0, 1, 0.9568627, 1,
0.01227749, -0.3186844, 4.681568, 0, 1, 0.9647059, 1,
0.01230561, -0.4299324, 4.686299, 0, 1, 0.9686275, 1,
0.01278732, -0.4439018, 3.466683, 0, 1, 0.9764706, 1,
0.0133972, -0.6332054, 3.750065, 0, 1, 0.9803922, 1,
0.01603313, 0.004429816, 0.6814342, 0, 1, 0.9882353, 1,
0.02047985, -0.4286874, 2.724083, 0, 1, 0.9921569, 1,
0.02142248, 0.6066229, 1.398315, 0, 1, 1, 1,
0.02193917, -0.9122995, 1.657531, 0, 0.9921569, 1, 1,
0.0225537, 0.3793328, -0.9144793, 0, 0.9882353, 1, 1,
0.02282606, 0.9142602, 0.1177381, 0, 0.9803922, 1, 1,
0.03213235, -0.5409888, 2.920489, 0, 0.9764706, 1, 1,
0.03666941, -1.94729, 3.662248, 0, 0.9686275, 1, 1,
0.03706738, 1.77158, -0.5150447, 0, 0.9647059, 1, 1,
0.03769063, 0.6153144, 2.500916, 0, 0.9568627, 1, 1,
0.03951336, -0.542284, 2.192385, 0, 0.9529412, 1, 1,
0.03952918, 0.6471323, 1.528862, 0, 0.945098, 1, 1,
0.05803465, -0.4279168, 3.403676, 0, 0.9411765, 1, 1,
0.06008918, -1.21614, 2.367597, 0, 0.9333333, 1, 1,
0.06426427, 1.327224, 0.1215039, 0, 0.9294118, 1, 1,
0.06789842, 1.1931, 0.07813065, 0, 0.9215686, 1, 1,
0.07028756, 0.06007421, 0.5998375, 0, 0.9176471, 1, 1,
0.0706877, 1.36806, -0.451396, 0, 0.9098039, 1, 1,
0.07105058, -1.317866, 5.612459, 0, 0.9058824, 1, 1,
0.07468371, -1.11279, 4.293795, 0, 0.8980392, 1, 1,
0.07777055, 1.573851, 2.413117, 0, 0.8901961, 1, 1,
0.07895199, 0.1442368, 0.2588496, 0, 0.8862745, 1, 1,
0.07999894, 0.5787221, -0.5957269, 0, 0.8784314, 1, 1,
0.08084566, -0.2393875, 3.369688, 0, 0.8745098, 1, 1,
0.08366726, -0.1052177, 3.057779, 0, 0.8666667, 1, 1,
0.08444643, 0.08212873, 0.1672747, 0, 0.8627451, 1, 1,
0.08534551, 0.01469966, -0.04299078, 0, 0.854902, 1, 1,
0.08575967, 0.002544986, 0.7318749, 0, 0.8509804, 1, 1,
0.08734972, -0.4749895, 3.40351, 0, 0.8431373, 1, 1,
0.09196842, 2.712637, -0.4745088, 0, 0.8392157, 1, 1,
0.09569181, -0.08790223, 0.922917, 0, 0.8313726, 1, 1,
0.09832408, -0.5661449, 2.536708, 0, 0.827451, 1, 1,
0.09871516, -1.244924, 3.022721, 0, 0.8196079, 1, 1,
0.1030993, 0.7195577, -0.07150821, 0, 0.8156863, 1, 1,
0.113309, -0.1215215, 2.225973, 0, 0.8078431, 1, 1,
0.1197613, -1.208592, 2.559605, 0, 0.8039216, 1, 1,
0.1207196, -1.248885, 1.896055, 0, 0.7960784, 1, 1,
0.1211433, 0.7345749, -1.397767, 0, 0.7882353, 1, 1,
0.1237867, 1.166168, 0.5617786, 0, 0.7843137, 1, 1,
0.1241454, 0.7269773, -0.1679313, 0, 0.7764706, 1, 1,
0.1256362, -0.2431548, 1.425537, 0, 0.772549, 1, 1,
0.1266265, -0.9967958, 4.090766, 0, 0.7647059, 1, 1,
0.1280594, -1.282444, 1.993884, 0, 0.7607843, 1, 1,
0.1371522, -0.6071156, 3.357216, 0, 0.7529412, 1, 1,
0.1373748, 0.3032046, 1.045249, 0, 0.7490196, 1, 1,
0.1397621, -0.2132186, 3.07014, 0, 0.7411765, 1, 1,
0.142413, -0.534672, 1.779895, 0, 0.7372549, 1, 1,
0.1468294, 1.238393, 0.302897, 0, 0.7294118, 1, 1,
0.1469306, -1.186441, 2.367119, 0, 0.7254902, 1, 1,
0.1472582, -0.6378382, 3.887728, 0, 0.7176471, 1, 1,
0.1494026, 0.05488775, -0.5537801, 0, 0.7137255, 1, 1,
0.1521456, -0.5627506, 3.970179, 0, 0.7058824, 1, 1,
0.1532867, 0.9499062, -0.006526539, 0, 0.6980392, 1, 1,
0.1538849, -1.055327, 2.270854, 0, 0.6941177, 1, 1,
0.1553083, 1.312411, 1.273885, 0, 0.6862745, 1, 1,
0.1606236, 0.2168737, 0.04818843, 0, 0.682353, 1, 1,
0.1689686, 0.2302741, 0.4255758, 0, 0.6745098, 1, 1,
0.1715262, 0.434326, 1.082179, 0, 0.6705883, 1, 1,
0.1720569, 0.6102412, 0.6799597, 0, 0.6627451, 1, 1,
0.1752848, -2.201508, 2.763044, 0, 0.6588235, 1, 1,
0.1764649, -0.5219522, 2.29206, 0, 0.6509804, 1, 1,
0.1771845, 0.1921972, 2.56866, 0, 0.6470588, 1, 1,
0.1828001, -0.2431449, 4.314188, 0, 0.6392157, 1, 1,
0.18485, -0.6001747, 3.559034, 0, 0.6352941, 1, 1,
0.1894359, 0.2010987, -0.4003918, 0, 0.627451, 1, 1,
0.1911144, -1.337247, 2.584539, 0, 0.6235294, 1, 1,
0.1912252, 0.9228857, -1.298558, 0, 0.6156863, 1, 1,
0.1941664, 1.639467, -1.290803, 0, 0.6117647, 1, 1,
0.1958083, -0.2412976, 2.38765, 0, 0.6039216, 1, 1,
0.2038737, 1.292953, 1.344347, 0, 0.5960785, 1, 1,
0.2084102, 0.06577528, 2.065006, 0, 0.5921569, 1, 1,
0.2093436, 1.755272, -0.6854964, 0, 0.5843138, 1, 1,
0.2134482, 0.343496, 0.08105265, 0, 0.5803922, 1, 1,
0.2151598, 1.641387, 1.268807, 0, 0.572549, 1, 1,
0.2152316, 0.2740734, 0.3326846, 0, 0.5686275, 1, 1,
0.2175155, -1.303408, 2.478744, 0, 0.5607843, 1, 1,
0.2204866, 0.5044656, 2.166793, 0, 0.5568628, 1, 1,
0.2232496, -0.8241172, 3.086771, 0, 0.5490196, 1, 1,
0.228098, 1.793897, 0.937575, 0, 0.5450981, 1, 1,
0.2302609, -0.1816621, 2.100692, 0, 0.5372549, 1, 1,
0.2375143, 1.20397, -0.1773992, 0, 0.5333334, 1, 1,
0.2389808, 0.1214572, 0.8381986, 0, 0.5254902, 1, 1,
0.2424587, -1.222704, 4.05206, 0, 0.5215687, 1, 1,
0.2442888, 1.114281, -0.9281586, 0, 0.5137255, 1, 1,
0.2450784, -0.3698323, 3.202062, 0, 0.509804, 1, 1,
0.2453217, 0.6741045, -0.4558313, 0, 0.5019608, 1, 1,
0.2458036, 0.830143, 0.4396285, 0, 0.4941176, 1, 1,
0.2581279, -0.273016, 2.68997, 0, 0.4901961, 1, 1,
0.260396, -1.646211, 1.314073, 0, 0.4823529, 1, 1,
0.2606141, -0.2743323, 2.554557, 0, 0.4784314, 1, 1,
0.2663312, 1.516802, -0.05610246, 0, 0.4705882, 1, 1,
0.2675355, -1.7038, 1.952977, 0, 0.4666667, 1, 1,
0.2681153, 0.6765088, 0.1127109, 0, 0.4588235, 1, 1,
0.2801216, -0.08711775, 1.324261, 0, 0.454902, 1, 1,
0.2805224, -2.481845, 2.083065, 0, 0.4470588, 1, 1,
0.2827267, 0.3933364, -0.1101611, 0, 0.4431373, 1, 1,
0.2849214, 0.01110589, 1.482359, 0, 0.4352941, 1, 1,
0.290938, -0.2546537, 2.540285, 0, 0.4313726, 1, 1,
0.2948833, -0.003448636, 0.4823857, 0, 0.4235294, 1, 1,
0.2957866, 0.6549002, 0.5897295, 0, 0.4196078, 1, 1,
0.3005065, 1.361706, -1.44955, 0, 0.4117647, 1, 1,
0.302116, -0.0008344872, 2.241123, 0, 0.4078431, 1, 1,
0.3050575, -0.747103, 1.579642, 0, 0.4, 1, 1,
0.3057632, 0.9663884, 2.057609, 0, 0.3921569, 1, 1,
0.3059937, -0.02447679, 3.352503, 0, 0.3882353, 1, 1,
0.3062254, 1.097521, 0.03316187, 0, 0.3803922, 1, 1,
0.3062673, 0.3661317, 0.5049825, 0, 0.3764706, 1, 1,
0.3073325, 1.414287, -0.1460299, 0, 0.3686275, 1, 1,
0.315974, 0.5156564, 2.855785, 0, 0.3647059, 1, 1,
0.3188636, -1.177258, 3.392999, 0, 0.3568628, 1, 1,
0.319004, 0.9621418, 1.53838, 0, 0.3529412, 1, 1,
0.3242723, 1.815353, 0.2816965, 0, 0.345098, 1, 1,
0.32626, 0.1379676, 2.441391, 0, 0.3411765, 1, 1,
0.3265663, -1.823419, 1.65071, 0, 0.3333333, 1, 1,
0.3344701, -1.034708, 2.717448, 0, 0.3294118, 1, 1,
0.3527268, -1.161337, 3.191891, 0, 0.3215686, 1, 1,
0.3540558, -1.849296, 3.449257, 0, 0.3176471, 1, 1,
0.3560998, -0.5067776, 2.23245, 0, 0.3098039, 1, 1,
0.3576157, 0.2831589, 0.9180529, 0, 0.3058824, 1, 1,
0.360327, -1.019323, 1.120532, 0, 0.2980392, 1, 1,
0.360363, -0.1876522, 3.235746, 0, 0.2901961, 1, 1,
0.3610256, 0.7900794, -0.1111112, 0, 0.2862745, 1, 1,
0.3625178, -0.359887, 3.442932, 0, 0.2784314, 1, 1,
0.3669633, 1.49089, -0.2993796, 0, 0.2745098, 1, 1,
0.3693604, -0.5970516, 2.153089, 0, 0.2666667, 1, 1,
0.3747568, -0.5195886, 4.45826, 0, 0.2627451, 1, 1,
0.3761597, 0.4598872, 0.550595, 0, 0.254902, 1, 1,
0.3777248, 1.36767, -1.051586, 0, 0.2509804, 1, 1,
0.382796, -0.8426772, 2.459479, 0, 0.2431373, 1, 1,
0.3837239, 0.1721943, 0.8250661, 0, 0.2392157, 1, 1,
0.3858323, 1.375611, 1.377526, 0, 0.2313726, 1, 1,
0.3859823, 1.07813, 0.6540065, 0, 0.227451, 1, 1,
0.3925188, 0.7665207, -1.356506, 0, 0.2196078, 1, 1,
0.392705, -0.5878153, 3.213449, 0, 0.2156863, 1, 1,
0.3934424, -0.8188757, 1.75633, 0, 0.2078431, 1, 1,
0.3951269, 0.3950789, -1.295112, 0, 0.2039216, 1, 1,
0.4034013, 0.5488291, 0.6519965, 0, 0.1960784, 1, 1,
0.4124566, 1.114939, 0.4781643, 0, 0.1882353, 1, 1,
0.4152059, -1.908675, 1.782116, 0, 0.1843137, 1, 1,
0.4155396, 1.058605, 0.5223205, 0, 0.1764706, 1, 1,
0.4159985, -0.06288978, 1.543941, 0, 0.172549, 1, 1,
0.4206413, -0.003744727, 3.448366, 0, 0.1647059, 1, 1,
0.4220546, -1.855717, 3.644963, 0, 0.1607843, 1, 1,
0.4243723, 0.4772385, 0.07350225, 0, 0.1529412, 1, 1,
0.426931, 0.5791748, -0.4860504, 0, 0.1490196, 1, 1,
0.4384744, -1.432586, 3.22021, 0, 0.1411765, 1, 1,
0.4393774, 0.06053847, 0.7142125, 0, 0.1372549, 1, 1,
0.4401866, 0.78922, 1.733575, 0, 0.1294118, 1, 1,
0.4426059, -0.5072519, 2.385219, 0, 0.1254902, 1, 1,
0.4452031, 0.312492, 2.543183, 0, 0.1176471, 1, 1,
0.4452064, -0.4453677, 3.819314, 0, 0.1137255, 1, 1,
0.4458392, -0.2985076, 2.731451, 0, 0.1058824, 1, 1,
0.4470609, 0.2887988, 0.3769777, 0, 0.09803922, 1, 1,
0.4495797, -0.07735592, 2.591879, 0, 0.09411765, 1, 1,
0.4507364, 1.037983, -0.120625, 0, 0.08627451, 1, 1,
0.4508664, -0.7272394, 2.42105, 0, 0.08235294, 1, 1,
0.4519251, -1.031466, 2.908879, 0, 0.07450981, 1, 1,
0.4565831, -0.3113729, 2.105092, 0, 0.07058824, 1, 1,
0.4585084, -0.6724349, 2.506599, 0, 0.0627451, 1, 1,
0.4617031, 0.4270892, 1.26818, 0, 0.05882353, 1, 1,
0.4656994, 0.2659844, 2.817463, 0, 0.05098039, 1, 1,
0.4692837, 0.4187017, -0.5518866, 0, 0.04705882, 1, 1,
0.4704639, -1.103948, 2.655833, 0, 0.03921569, 1, 1,
0.4724432, -1.190003, 3.51768, 0, 0.03529412, 1, 1,
0.486258, 0.3080925, 2.145138, 0, 0.02745098, 1, 1,
0.4985153, -1.391451, 1.637845, 0, 0.02352941, 1, 1,
0.5039422, 1.26501, 1.381497, 0, 0.01568628, 1, 1,
0.5060505, -0.6371497, 1.441707, 0, 0.01176471, 1, 1,
0.5083371, -1.955428, 3.838649, 0, 0.003921569, 1, 1,
0.5108538, 0.06646008, 1.855211, 0.003921569, 0, 1, 1,
0.5115878, -1.490948, 0.948294, 0.007843138, 0, 1, 1,
0.5118134, -0.899192, 4.327994, 0.01568628, 0, 1, 1,
0.512979, 0.1018054, 0.8982776, 0.01960784, 0, 1, 1,
0.5179157, 0.03663151, 1.834312, 0.02745098, 0, 1, 1,
0.5179625, 1.108937, -0.7423066, 0.03137255, 0, 1, 1,
0.5251528, -0.6485516, 2.007554, 0.03921569, 0, 1, 1,
0.5253099, -0.1882223, 1.488294, 0.04313726, 0, 1, 1,
0.531882, -1.219666, 2.471206, 0.05098039, 0, 1, 1,
0.5320686, -0.1765562, 3.663196, 0.05490196, 0, 1, 1,
0.5412673, 0.8827556, -0.07701872, 0.0627451, 0, 1, 1,
0.5451885, 1.965754, 0.2352068, 0.06666667, 0, 1, 1,
0.5457245, 0.4212297, 0.9270582, 0.07450981, 0, 1, 1,
0.5482413, -1.184304, 2.828463, 0.07843138, 0, 1, 1,
0.5523419, 2.099118, 0.7726135, 0.08627451, 0, 1, 1,
0.5619987, -0.8020784, 1.734164, 0.09019608, 0, 1, 1,
0.5654869, -0.3327948, 1.3092, 0.09803922, 0, 1, 1,
0.5769494, 0.5048538, 1.742804, 0.1058824, 0, 1, 1,
0.5810122, -1.587408, 3.271727, 0.1098039, 0, 1, 1,
0.5835462, 0.8142625, 1.580855, 0.1176471, 0, 1, 1,
0.5868382, 0.03353358, 1.273375, 0.1215686, 0, 1, 1,
0.5878102, 0.7080392, 1.076587, 0.1294118, 0, 1, 1,
0.5887951, 0.2008754, 0.5571842, 0.1333333, 0, 1, 1,
0.5930454, 0.5084354, 1.068122, 0.1411765, 0, 1, 1,
0.5937071, 0.3928211, -0.3069791, 0.145098, 0, 1, 1,
0.594712, -0.2022928, 3.631243, 0.1529412, 0, 1, 1,
0.595537, 0.6826655, 1.29351, 0.1568628, 0, 1, 1,
0.6011792, 0.2985098, 0.8365188, 0.1647059, 0, 1, 1,
0.6012886, -0.251672, -0.1682746, 0.1686275, 0, 1, 1,
0.6027965, -0.8611738, 1.234888, 0.1764706, 0, 1, 1,
0.604552, 1.948225, 1.265547, 0.1803922, 0, 1, 1,
0.6141016, 0.6814098, 2.825539, 0.1882353, 0, 1, 1,
0.6146393, -0.2434393, 1.604549, 0.1921569, 0, 1, 1,
0.6168106, -0.8344342, 1.132422, 0.2, 0, 1, 1,
0.6180084, 0.07465961, 1.103011, 0.2078431, 0, 1, 1,
0.6190769, 1.242772, 1.495617, 0.2117647, 0, 1, 1,
0.6243582, -0.2051718, 1.822112, 0.2196078, 0, 1, 1,
0.6265078, -0.4755341, 0.104884, 0.2235294, 0, 1, 1,
0.626743, -0.2665242, 0.9249107, 0.2313726, 0, 1, 1,
0.6289477, 1.468523, -0.3425265, 0.2352941, 0, 1, 1,
0.6295097, 0.1090783, 2.639963, 0.2431373, 0, 1, 1,
0.6422064, 0.2291656, 0.4964755, 0.2470588, 0, 1, 1,
0.6479056, 0.07353277, 2.041254, 0.254902, 0, 1, 1,
0.6517415, 0.7047659, 1.330307, 0.2588235, 0, 1, 1,
0.6538071, -0.1529962, 2.334089, 0.2666667, 0, 1, 1,
0.6580381, -0.8490503, 2.670002, 0.2705882, 0, 1, 1,
0.6620311, 0.9051783, 2.026237, 0.2784314, 0, 1, 1,
0.6636829, 0.191744, 1.548534, 0.282353, 0, 1, 1,
0.664547, 1.053795, 0.3066668, 0.2901961, 0, 1, 1,
0.6682422, 1.051137, -0.7368177, 0.2941177, 0, 1, 1,
0.6699532, 0.3674991, 2.479467, 0.3019608, 0, 1, 1,
0.670004, 0.7082737, 0.7414857, 0.3098039, 0, 1, 1,
0.6738585, -0.600026, 2.9075, 0.3137255, 0, 1, 1,
0.6753425, 0.7513077, 0.7618638, 0.3215686, 0, 1, 1,
0.6782733, -0.06668596, 1.168749, 0.3254902, 0, 1, 1,
0.6784664, -0.7632285, 3.882592, 0.3333333, 0, 1, 1,
0.6861423, 0.8942457, 1.275183, 0.3372549, 0, 1, 1,
0.6931447, 0.6774046, 0.7251218, 0.345098, 0, 1, 1,
0.6960176, -0.2547781, 1.369063, 0.3490196, 0, 1, 1,
0.6981905, 0.8550133, 1.122634, 0.3568628, 0, 1, 1,
0.6992705, -1.545939, 3.593492, 0.3607843, 0, 1, 1,
0.7012297, -0.2155831, 1.105585, 0.3686275, 0, 1, 1,
0.7049319, 0.2749409, 1.455485, 0.372549, 0, 1, 1,
0.7064008, -1.792209, 2.456352, 0.3803922, 0, 1, 1,
0.7106873, 0.2070861, 0.2080745, 0.3843137, 0, 1, 1,
0.7134302, 0.4556412, -1.009704, 0.3921569, 0, 1, 1,
0.7136456, 0.6668021, 2.018815, 0.3960784, 0, 1, 1,
0.7170576, -0.236033, 2.450251, 0.4039216, 0, 1, 1,
0.7193702, 0.4606365, 1.038762, 0.4117647, 0, 1, 1,
0.7266303, 0.9054249, 1.654076, 0.4156863, 0, 1, 1,
0.7308214, 2.239084, 0.3377635, 0.4235294, 0, 1, 1,
0.7328147, 0.6430098, 1.512815, 0.427451, 0, 1, 1,
0.7395735, 0.3516174, -0.4105552, 0.4352941, 0, 1, 1,
0.7423908, -1.067641, 3.243057, 0.4392157, 0, 1, 1,
0.743706, -0.7887745, 3.658253, 0.4470588, 0, 1, 1,
0.7500057, 0.3651224, 3.596728, 0.4509804, 0, 1, 1,
0.7517825, 1.249544, 2.685605, 0.4588235, 0, 1, 1,
0.7528104, 0.162128, 0.09295666, 0.4627451, 0, 1, 1,
0.7528518, 1.320419, 1.29403, 0.4705882, 0, 1, 1,
0.7590999, -0.4074525, 2.659949, 0.4745098, 0, 1, 1,
0.7619992, 0.5055174, 0.9753544, 0.4823529, 0, 1, 1,
0.7647075, 0.7419473, -0.3463141, 0.4862745, 0, 1, 1,
0.7690001, -0.3254885, 1.580951, 0.4941176, 0, 1, 1,
0.7694896, -0.8171281, 3.004431, 0.5019608, 0, 1, 1,
0.7698154, 0.05007881, -0.1926548, 0.5058824, 0, 1, 1,
0.774227, -1.634089, 1.701517, 0.5137255, 0, 1, 1,
0.7765521, -1.155343, 5.009594, 0.5176471, 0, 1, 1,
0.7765747, -0.6908966, 3.49254, 0.5254902, 0, 1, 1,
0.7820298, -1.458436, 3.92296, 0.5294118, 0, 1, 1,
0.7943861, 0.1067866, 0.6580651, 0.5372549, 0, 1, 1,
0.794467, 0.9350163, 1.325017, 0.5411765, 0, 1, 1,
0.7963526, -2.145129, 3.588224, 0.5490196, 0, 1, 1,
0.7999844, -0.1326158, 2.79163, 0.5529412, 0, 1, 1,
0.8025558, -0.6234493, 1.64632, 0.5607843, 0, 1, 1,
0.8026003, -0.2074458, 1.162978, 0.5647059, 0, 1, 1,
0.8039337, 0.14496, 2.160178, 0.572549, 0, 1, 1,
0.8044087, -0.01821331, 2.900142, 0.5764706, 0, 1, 1,
0.8044159, -0.3542544, 3.367347, 0.5843138, 0, 1, 1,
0.8045436, 0.1323451, 2.186674, 0.5882353, 0, 1, 1,
0.810331, 1.650091, 0.3140208, 0.5960785, 0, 1, 1,
0.8142603, -0.07017241, 2.246866, 0.6039216, 0, 1, 1,
0.8186133, 1.072737, -0.2801117, 0.6078432, 0, 1, 1,
0.8216309, 1.390602, 0.9180801, 0.6156863, 0, 1, 1,
0.8222362, -0.1755799, 3.9775, 0.6196079, 0, 1, 1,
0.8235827, -0.6567718, 1.454526, 0.627451, 0, 1, 1,
0.8253654, 0.6460062, 0.2787304, 0.6313726, 0, 1, 1,
0.8285099, -1.588935, 3.283434, 0.6392157, 0, 1, 1,
0.8299257, -0.8364639, 0.8657722, 0.6431373, 0, 1, 1,
0.8335522, -0.5315648, 2.436712, 0.6509804, 0, 1, 1,
0.8349849, -2.122671, 3.589224, 0.654902, 0, 1, 1,
0.8395774, 0.3701473, 0.5660212, 0.6627451, 0, 1, 1,
0.8403454, -0.9193262, 2.067471, 0.6666667, 0, 1, 1,
0.8438088, 0.5206668, 0.5440782, 0.6745098, 0, 1, 1,
0.8481248, -0.4512643, 0.5224042, 0.6784314, 0, 1, 1,
0.8525593, -0.5546653, 1.247074, 0.6862745, 0, 1, 1,
0.8531948, 0.808334, 0.4280772, 0.6901961, 0, 1, 1,
0.8537576, 0.3029902, 2.844461, 0.6980392, 0, 1, 1,
0.8549997, 1.145504, 1.774837, 0.7058824, 0, 1, 1,
0.8589965, 0.9881357, 0.7179579, 0.7098039, 0, 1, 1,
0.8592234, 1.48118, 0.4601369, 0.7176471, 0, 1, 1,
0.859297, 0.05433114, 1.281998, 0.7215686, 0, 1, 1,
0.8601941, 2.636545, 0.05582014, 0.7294118, 0, 1, 1,
0.8643913, 0.6471542, 1.556887, 0.7333333, 0, 1, 1,
0.8659627, 0.6945308, -0.3480494, 0.7411765, 0, 1, 1,
0.8664863, 1.248829, -0.08149742, 0.7450981, 0, 1, 1,
0.8722135, -0.3397536, 1.514495, 0.7529412, 0, 1, 1,
0.8745547, -0.1027872, 0.6029468, 0.7568628, 0, 1, 1,
0.8819318, -1.925144, 3.65005, 0.7647059, 0, 1, 1,
0.8820164, -0.4161886, 2.115181, 0.7686275, 0, 1, 1,
0.884991, 0.9766198, 1.217442, 0.7764706, 0, 1, 1,
0.8903184, 0.6821305, 0.7052629, 0.7803922, 0, 1, 1,
0.8927609, -1.63903, 2.841192, 0.7882353, 0, 1, 1,
0.8981826, 0.05842197, 0.3205281, 0.7921569, 0, 1, 1,
0.9018649, -1.123294, 2.452651, 0.8, 0, 1, 1,
0.9035004, 1.46163, 1.287727, 0.8078431, 0, 1, 1,
0.9042503, -2.385438, 3.590135, 0.8117647, 0, 1, 1,
0.9042827, -0.3642144, 1.744206, 0.8196079, 0, 1, 1,
0.9070765, -0.3637739, 3.427544, 0.8235294, 0, 1, 1,
0.907356, 0.5252754, 1.819838, 0.8313726, 0, 1, 1,
0.9141301, 0.5804265, 1.377376, 0.8352941, 0, 1, 1,
0.9145267, -0.3637184, -0.6725329, 0.8431373, 0, 1, 1,
0.9149204, 0.4748185, 1.965091, 0.8470588, 0, 1, 1,
0.9181173, -0.4374514, 2.741648, 0.854902, 0, 1, 1,
0.9184426, -0.3908318, 1.785095, 0.8588235, 0, 1, 1,
0.921047, -0.3476102, 2.362684, 0.8666667, 0, 1, 1,
0.9230343, 0.2148343, 3.556613, 0.8705882, 0, 1, 1,
0.9235541, 0.8203436, 0.7686931, 0.8784314, 0, 1, 1,
0.932758, 0.932847, 2.4887, 0.8823529, 0, 1, 1,
0.9405975, 0.3935316, 0.416993, 0.8901961, 0, 1, 1,
0.9436749, 1.150338, 1.242924, 0.8941177, 0, 1, 1,
0.946704, -0.8226463, 2.370644, 0.9019608, 0, 1, 1,
0.9475056, -1.339871, 3.514696, 0.9098039, 0, 1, 1,
0.9506136, 1.110317, 0.06934766, 0.9137255, 0, 1, 1,
0.9595855, 0.7073506, 0.8748119, 0.9215686, 0, 1, 1,
0.960254, -1.879899, 2.635849, 0.9254902, 0, 1, 1,
0.9615272, -1.954184, 3.691059, 0.9333333, 0, 1, 1,
0.9680629, -2.470188, 3.590309, 0.9372549, 0, 1, 1,
0.9704473, -0.4701902, 0.6355374, 0.945098, 0, 1, 1,
0.9714693, 0.6531004, 0.6581215, 0.9490196, 0, 1, 1,
0.9763575, 1.718853, 0.8221522, 0.9568627, 0, 1, 1,
0.9794195, -2.175853, 1.709263, 0.9607843, 0, 1, 1,
0.9799777, 0.1132884, 1.932567, 0.9686275, 0, 1, 1,
0.9824826, 0.1165867, 1.883711, 0.972549, 0, 1, 1,
0.986686, -1.851813, 2.071226, 0.9803922, 0, 1, 1,
0.9892237, 0.131407, 0.9229591, 0.9843137, 0, 1, 1,
0.994595, -0.7106653, 2.453312, 0.9921569, 0, 1, 1,
0.995921, -1.188585, 2.913826, 0.9960784, 0, 1, 1,
0.9960184, 0.7461941, 0.2451208, 1, 0, 0.9960784, 1,
0.9982674, -0.6881074, 0.9136078, 1, 0, 0.9882353, 1,
1.008087, -0.9748175, 2.818608, 1, 0, 0.9843137, 1,
1.012256, -1.338869, 1.85405, 1, 0, 0.9764706, 1,
1.016937, 0.3093706, 2.306758, 1, 0, 0.972549, 1,
1.017639, 0.8457974, -0.807355, 1, 0, 0.9647059, 1,
1.025964, -0.7214164, 2.970203, 1, 0, 0.9607843, 1,
1.026499, 0.5261214, 0.2691559, 1, 0, 0.9529412, 1,
1.029095, 0.8615895, 0.740102, 1, 0, 0.9490196, 1,
1.036839, -0.7229224, 2.698022, 1, 0, 0.9411765, 1,
1.040458, 0.4994248, 1.164722, 1, 0, 0.9372549, 1,
1.044461, -1.207491, 1.117434, 1, 0, 0.9294118, 1,
1.050551, 0.3543751, 1.931044, 1, 0, 0.9254902, 1,
1.050882, 0.4482243, 0.4464009, 1, 0, 0.9176471, 1,
1.054592, -0.4836047, 2.537257, 1, 0, 0.9137255, 1,
1.069323, -0.5944461, 3.743724, 1, 0, 0.9058824, 1,
1.07109, -0.9648249, 2.274691, 1, 0, 0.9019608, 1,
1.079594, 0.5154148, 1.972326, 1, 0, 0.8941177, 1,
1.083872, 0.1830939, 0.2189957, 1, 0, 0.8862745, 1,
1.0928, 1.894733, -1.143567, 1, 0, 0.8823529, 1,
1.111502, -1.315023, 2.066501, 1, 0, 0.8745098, 1,
1.117332, -0.4089102, 2.988242, 1, 0, 0.8705882, 1,
1.119223, -0.9367546, 3.603457, 1, 0, 0.8627451, 1,
1.128253, 1.244619, 1.096334, 1, 0, 0.8588235, 1,
1.141966, -0.270911, 3.119949, 1, 0, 0.8509804, 1,
1.142157, -0.8214954, 1.832071, 1, 0, 0.8470588, 1,
1.156046, -2.230454, 1.085455, 1, 0, 0.8392157, 1,
1.15763, 0.505923, 1.056925, 1, 0, 0.8352941, 1,
1.159433, -0.4025822, 1.368726, 1, 0, 0.827451, 1,
1.177619, -2.15515, 1.733727, 1, 0, 0.8235294, 1,
1.179148, 0.05034703, 2.666668, 1, 0, 0.8156863, 1,
1.180872, 0.4442161, -0.433791, 1, 0, 0.8117647, 1,
1.181928, 0.913886, 0.811695, 1, 0, 0.8039216, 1,
1.187641, -0.4287646, 0.1880414, 1, 0, 0.7960784, 1,
1.195327, 1.119899, 0.1098116, 1, 0, 0.7921569, 1,
1.198818, 0.07873201, 1.288932, 1, 0, 0.7843137, 1,
1.20113, 0.3631231, -0.7768327, 1, 0, 0.7803922, 1,
1.207731, -0.9404483, 1.663795, 1, 0, 0.772549, 1,
1.207765, -1.394374, 2.432419, 1, 0, 0.7686275, 1,
1.209247, 0.7557307, 1.606586, 1, 0, 0.7607843, 1,
1.223329, 0.4183107, 0.8171088, 1, 0, 0.7568628, 1,
1.229932, -1.182076, 3.872606, 1, 0, 0.7490196, 1,
1.232398, -0.5706978, 2.429176, 1, 0, 0.7450981, 1,
1.234131, 1.002248, 1.283901, 1, 0, 0.7372549, 1,
1.234807, 1.168097, -0.9428682, 1, 0, 0.7333333, 1,
1.238016, 1.51368, -0.2020349, 1, 0, 0.7254902, 1,
1.239482, 0.1663959, 0.627327, 1, 0, 0.7215686, 1,
1.241542, 1.429901, 0.9086558, 1, 0, 0.7137255, 1,
1.24749, -0.4194221, 2.603056, 1, 0, 0.7098039, 1,
1.247867, -1.155187, 1.402858, 1, 0, 0.7019608, 1,
1.251148, -0.03139707, 2.30658, 1, 0, 0.6941177, 1,
1.258029, 0.3736055, 0.4848892, 1, 0, 0.6901961, 1,
1.270877, -0.1615435, 0.4021622, 1, 0, 0.682353, 1,
1.272302, 0.490824, 0.703643, 1, 0, 0.6784314, 1,
1.275768, -0.1448313, 1.582853, 1, 0, 0.6705883, 1,
1.279016, 0.03264661, 0.5148025, 1, 0, 0.6666667, 1,
1.310321, 1.797913, -0.02722545, 1, 0, 0.6588235, 1,
1.312029, 0.540177, 2.451746, 1, 0, 0.654902, 1,
1.314495, 0.4631735, -0.1003633, 1, 0, 0.6470588, 1,
1.323776, -0.1740475, 1.714199, 1, 0, 0.6431373, 1,
1.325503, -0.6410817, 2.700781, 1, 0, 0.6352941, 1,
1.333558, 1.162606, 2.019773, 1, 0, 0.6313726, 1,
1.347309, -0.6426849, 2.998902, 1, 0, 0.6235294, 1,
1.347648, 0.5286239, 1.568822, 1, 0, 0.6196079, 1,
1.34907, 0.8735954, 0.6467987, 1, 0, 0.6117647, 1,
1.350026, -0.5973537, 2.088017, 1, 0, 0.6078432, 1,
1.350253, -1.266816, 2.337332, 1, 0, 0.6, 1,
1.35502, 0.3754911, 0.8991038, 1, 0, 0.5921569, 1,
1.366599, -0.8121672, 2.015343, 1, 0, 0.5882353, 1,
1.382283, -0.8150265, 1.197704, 1, 0, 0.5803922, 1,
1.384467, 0.3909401, 1.237006, 1, 0, 0.5764706, 1,
1.386275, -0.3382797, 2.206641, 1, 0, 0.5686275, 1,
1.389146, 1.221928, 0.5726314, 1, 0, 0.5647059, 1,
1.389992, -1.2696, 2.382092, 1, 0, 0.5568628, 1,
1.391578, 3.083718, 1.483294, 1, 0, 0.5529412, 1,
1.395837, 0.3615945, 1.860817, 1, 0, 0.5450981, 1,
1.403139, -1.388416, 3.467927, 1, 0, 0.5411765, 1,
1.405177, -1.896243, 0.2798449, 1, 0, 0.5333334, 1,
1.431647, -0.0968024, 1.836586, 1, 0, 0.5294118, 1,
1.455745, -0.2974586, 2.995791, 1, 0, 0.5215687, 1,
1.465259, 1.569633, 0.8753618, 1, 0, 0.5176471, 1,
1.471855, -1.648629, 0.4366516, 1, 0, 0.509804, 1,
1.477124, 1.655939, 0.8594313, 1, 0, 0.5058824, 1,
1.500386, 0.6235527, 0.3106827, 1, 0, 0.4980392, 1,
1.507433, -0.1377524, 0.1154459, 1, 0, 0.4901961, 1,
1.511741, -0.2575518, 2.156847, 1, 0, 0.4862745, 1,
1.513102, -0.4318222, 0.9743168, 1, 0, 0.4784314, 1,
1.516222, 0.5601092, 2.127951, 1, 0, 0.4745098, 1,
1.526005, -0.356419, 2.270869, 1, 0, 0.4666667, 1,
1.53519, 2.551648, 0.482913, 1, 0, 0.4627451, 1,
1.539215, 0.752809, 1.908588, 1, 0, 0.454902, 1,
1.541149, -0.432727, 1.073593, 1, 0, 0.4509804, 1,
1.542454, 1.07957, -0.1631705, 1, 0, 0.4431373, 1,
1.544416, 1.513995, 1.19843, 1, 0, 0.4392157, 1,
1.545855, -0.3575647, 2.099383, 1, 0, 0.4313726, 1,
1.551435, 0.5725809, 1.288153, 1, 0, 0.427451, 1,
1.570658, -1.199095, 0.1795651, 1, 0, 0.4196078, 1,
1.571501, -0.001077532, 1.260815, 1, 0, 0.4156863, 1,
1.571884, 0.4965258, 0.8887423, 1, 0, 0.4078431, 1,
1.592859, -0.09803626, 1.292951, 1, 0, 0.4039216, 1,
1.607761, -0.4453957, 0.8529632, 1, 0, 0.3960784, 1,
1.625737, -0.4432961, 1.450781, 1, 0, 0.3882353, 1,
1.640981, 0.3614039, 2.292608, 1, 0, 0.3843137, 1,
1.643468, -0.8979582, 0.6449317, 1, 0, 0.3764706, 1,
1.661366, -0.419829, 3.559609, 1, 0, 0.372549, 1,
1.663034, -0.1965782, 1.770551, 1, 0, 0.3647059, 1,
1.665582, 0.06733665, 1.613877, 1, 0, 0.3607843, 1,
1.669699, 1.185738, 0.6966986, 1, 0, 0.3529412, 1,
1.753, 0.3608881, 0.5155296, 1, 0, 0.3490196, 1,
1.761691, -0.1403791, 2.047447, 1, 0, 0.3411765, 1,
1.770434, 0.5337407, 1.739229, 1, 0, 0.3372549, 1,
1.777109, 0.583475, 2.370466, 1, 0, 0.3294118, 1,
1.781121, -0.9428067, 4.166904, 1, 0, 0.3254902, 1,
1.787505, 0.4325309, 0.9663282, 1, 0, 0.3176471, 1,
1.808807, 0.553706, 2.118793, 1, 0, 0.3137255, 1,
1.817457, 0.1460402, 1.640473, 1, 0, 0.3058824, 1,
1.822426, -0.7252437, 2.713174, 1, 0, 0.2980392, 1,
1.824825, -0.1931731, 1.050844, 1, 0, 0.2941177, 1,
1.831608, 0.07657789, 0.2785636, 1, 0, 0.2862745, 1,
1.848785, 0.1147165, 0.07457858, 1, 0, 0.282353, 1,
1.851249, -0.7418745, 2.06455, 1, 0, 0.2745098, 1,
1.851791, -0.788413, 1.625934, 1, 0, 0.2705882, 1,
1.856004, 0.132632, 0.6615098, 1, 0, 0.2627451, 1,
1.872117, 0.08559994, 2.961515, 1, 0, 0.2588235, 1,
1.904013, -1.309815, 2.496914, 1, 0, 0.2509804, 1,
1.908414, -0.08308139, 2.266654, 1, 0, 0.2470588, 1,
1.910953, 1.803812, 1.69077, 1, 0, 0.2392157, 1,
1.949505, -1.496089, 2.093832, 1, 0, 0.2352941, 1,
1.952906, -0.9675673, 1.895304, 1, 0, 0.227451, 1,
1.965309, 0.9315021, 2.227136, 1, 0, 0.2235294, 1,
1.968224, -1.862206, 2.385596, 1, 0, 0.2156863, 1,
1.982639, 0.2679662, 0.4317922, 1, 0, 0.2117647, 1,
2.003481, 1.539344, -0.2839019, 1, 0, 0.2039216, 1,
2.00559, -1.269982, 1.004439, 1, 0, 0.1960784, 1,
2.023777, -1.170894, 1.479404, 1, 0, 0.1921569, 1,
2.052479, -0.2814127, 2.116335, 1, 0, 0.1843137, 1,
2.053081, 0.2120862, 2.045955, 1, 0, 0.1803922, 1,
2.063323, 0.8564438, 1.463326, 1, 0, 0.172549, 1,
2.083447, 1.890626, 0.7007121, 1, 0, 0.1686275, 1,
2.100848, -0.2555075, 1.636431, 1, 0, 0.1607843, 1,
2.101349, 0.8130043, 1.318295, 1, 0, 0.1568628, 1,
2.101643, -1.770049, 2.212526, 1, 0, 0.1490196, 1,
2.109804, -0.1349793, 1.027689, 1, 0, 0.145098, 1,
2.129898, -0.675805, 2.478183, 1, 0, 0.1372549, 1,
2.138928, 1.44383, 1.097048, 1, 0, 0.1333333, 1,
2.161729, -0.1803344, 3.108408, 1, 0, 0.1254902, 1,
2.16851, -1.098011, 3.350511, 1, 0, 0.1215686, 1,
2.203517, 0.6765572, 2.820122, 1, 0, 0.1137255, 1,
2.228652, 1.359638, 2.37146, 1, 0, 0.1098039, 1,
2.237486, 1.802834, 1.922036, 1, 0, 0.1019608, 1,
2.264271, 0.6218169, 2.382241, 1, 0, 0.09411765, 1,
2.267274, 0.604039, 2.785639, 1, 0, 0.09019608, 1,
2.2764, -0.4990285, 0.8419914, 1, 0, 0.08235294, 1,
2.278282, 0.1439757, 1.452055, 1, 0, 0.07843138, 1,
2.28343, 1.169623, 0.9638226, 1, 0, 0.07058824, 1,
2.325563, 0.4924838, 2.702259, 1, 0, 0.06666667, 1,
2.367083, -0.3322496, 3.511833, 1, 0, 0.05882353, 1,
2.402225, -0.2292253, 1.687168, 1, 0, 0.05490196, 1,
2.452893, -0.3296141, 2.393895, 1, 0, 0.04705882, 1,
2.53069, -0.311822, 0.4999982, 1, 0, 0.04313726, 1,
2.695868, -1.763973, 3.684772, 1, 0, 0.03529412, 1,
2.730007, -0.2097301, 1.502763, 1, 0, 0.03137255, 1,
2.858191, 0.02089927, 1.795546, 1, 0, 0.02352941, 1,
2.90919, 0.5019159, -0.1302745, 1, 0, 0.01960784, 1,
2.923647, -0.09737317, 3.109089, 1, 0, 0.01176471, 1,
2.975881, 0.2740957, 2.598106, 1, 0, 0.007843138, 1
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
0.1417042, -3.773462, -7.258174, 0, -0.5, 0.5, 0.5,
0.1417042, -3.773462, -7.258174, 1, -0.5, 0.5, 0.5,
0.1417042, -3.773462, -7.258174, 1, 1.5, 0.5, 0.5,
0.1417042, -3.773462, -7.258174, 0, 1.5, 0.5, 0.5
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
-3.653259, 0.4184418, -7.258174, 0, -0.5, 0.5, 0.5,
-3.653259, 0.4184418, -7.258174, 1, -0.5, 0.5, 0.5,
-3.653259, 0.4184418, -7.258174, 1, 1.5, 0.5, 0.5,
-3.653259, 0.4184418, -7.258174, 0, 1.5, 0.5, 0.5
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
-3.653259, -3.773462, 0.1098371, 0, -0.5, 0.5, 0.5,
-3.653259, -3.773462, 0.1098371, 1, -0.5, 0.5, 0.5,
-3.653259, -3.773462, 0.1098371, 1, 1.5, 0.5, 0.5,
-3.653259, -3.773462, 0.1098371, 0, 1.5, 0.5, 0.5
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
-2, -2.8061, -5.557864,
2, -2.8061, -5.557864,
-2, -2.8061, -5.557864,
-2, -2.967327, -5.841249,
-1, -2.8061, -5.557864,
-1, -2.967327, -5.841249,
0, -2.8061, -5.557864,
0, -2.967327, -5.841249,
1, -2.8061, -5.557864,
1, -2.967327, -5.841249,
2, -2.8061, -5.557864,
2, -2.967327, -5.841249
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
-2, -3.289781, -6.408019, 0, -0.5, 0.5, 0.5,
-2, -3.289781, -6.408019, 1, -0.5, 0.5, 0.5,
-2, -3.289781, -6.408019, 1, 1.5, 0.5, 0.5,
-2, -3.289781, -6.408019, 0, 1.5, 0.5, 0.5,
-1, -3.289781, -6.408019, 0, -0.5, 0.5, 0.5,
-1, -3.289781, -6.408019, 1, -0.5, 0.5, 0.5,
-1, -3.289781, -6.408019, 1, 1.5, 0.5, 0.5,
-1, -3.289781, -6.408019, 0, 1.5, 0.5, 0.5,
0, -3.289781, -6.408019, 0, -0.5, 0.5, 0.5,
0, -3.289781, -6.408019, 1, -0.5, 0.5, 0.5,
0, -3.289781, -6.408019, 1, 1.5, 0.5, 0.5,
0, -3.289781, -6.408019, 0, 1.5, 0.5, 0.5,
1, -3.289781, -6.408019, 0, -0.5, 0.5, 0.5,
1, -3.289781, -6.408019, 1, -0.5, 0.5, 0.5,
1, -3.289781, -6.408019, 1, 1.5, 0.5, 0.5,
1, -3.289781, -6.408019, 0, 1.5, 0.5, 0.5,
2, -3.289781, -6.408019, 0, -0.5, 0.5, 0.5,
2, -3.289781, -6.408019, 1, -0.5, 0.5, 0.5,
2, -3.289781, -6.408019, 1, 1.5, 0.5, 0.5,
2, -3.289781, -6.408019, 0, 1.5, 0.5, 0.5
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
-2.777498, -2, -5.557864,
-2.777498, 3, -5.557864,
-2.777498, -2, -5.557864,
-2.923458, -2, -5.841249,
-2.777498, -1, -5.557864,
-2.923458, -1, -5.841249,
-2.777498, 0, -5.557864,
-2.923458, 0, -5.841249,
-2.777498, 1, -5.557864,
-2.923458, 1, -5.841249,
-2.777498, 2, -5.557864,
-2.923458, 2, -5.841249,
-2.777498, 3, -5.557864,
-2.923458, 3, -5.841249
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
-3.215379, -2, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, -2, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, -2, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, -2, -6.408019, 0, 1.5, 0.5, 0.5,
-3.215379, -1, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, -1, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, -1, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, -1, -6.408019, 0, 1.5, 0.5, 0.5,
-3.215379, 0, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, 0, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, 0, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, 0, -6.408019, 0, 1.5, 0.5, 0.5,
-3.215379, 1, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, 1, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, 1, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, 1, -6.408019, 0, 1.5, 0.5, 0.5,
-3.215379, 2, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, 2, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, 2, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, 2, -6.408019, 0, 1.5, 0.5, 0.5,
-3.215379, 3, -6.408019, 0, -0.5, 0.5, 0.5,
-3.215379, 3, -6.408019, 1, -0.5, 0.5, 0.5,
-3.215379, 3, -6.408019, 1, 1.5, 0.5, 0.5,
-3.215379, 3, -6.408019, 0, 1.5, 0.5, 0.5
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
-2.777498, -2.8061, -4,
-2.777498, -2.8061, 4,
-2.777498, -2.8061, -4,
-2.923458, -2.967327, -4,
-2.777498, -2.8061, -2,
-2.923458, -2.967327, -2,
-2.777498, -2.8061, 0,
-2.923458, -2.967327, 0,
-2.777498, -2.8061, 2,
-2.923458, -2.967327, 2,
-2.777498, -2.8061, 4,
-2.923458, -2.967327, 4
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
-3.215379, -3.289781, -4, 0, -0.5, 0.5, 0.5,
-3.215379, -3.289781, -4, 1, -0.5, 0.5, 0.5,
-3.215379, -3.289781, -4, 1, 1.5, 0.5, 0.5,
-3.215379, -3.289781, -4, 0, 1.5, 0.5, 0.5,
-3.215379, -3.289781, -2, 0, -0.5, 0.5, 0.5,
-3.215379, -3.289781, -2, 1, -0.5, 0.5, 0.5,
-3.215379, -3.289781, -2, 1, 1.5, 0.5, 0.5,
-3.215379, -3.289781, -2, 0, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 0, 0, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 0, 1, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 0, 1, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 0, 0, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 2, 0, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 2, 1, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 2, 1, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 2, 0, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 4, 0, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 4, 1, -0.5, 0.5, 0.5,
-3.215379, -3.289781, 4, 1, 1.5, 0.5, 0.5,
-3.215379, -3.289781, 4, 0, 1.5, 0.5, 0.5
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
-2.777498, -2.8061, -5.557864,
-2.777498, 3.642983, -5.557864,
-2.777498, -2.8061, 5.777538,
-2.777498, 3.642983, 5.777538,
-2.777498, -2.8061, -5.557864,
-2.777498, -2.8061, 5.777538,
-2.777498, 3.642983, -5.557864,
-2.777498, 3.642983, 5.777538,
-2.777498, -2.8061, -5.557864,
3.060907, -2.8061, -5.557864,
-2.777498, -2.8061, 5.777538,
3.060907, -2.8061, 5.777538,
-2.777498, 3.642983, -5.557864,
3.060907, 3.642983, -5.557864,
-2.777498, 3.642983, 5.777538,
3.060907, 3.642983, 5.777538,
3.060907, -2.8061, -5.557864,
3.060907, 3.642983, -5.557864,
3.060907, -2.8061, 5.777538,
3.060907, 3.642983, 5.777538,
3.060907, -2.8061, -5.557864,
3.060907, -2.8061, 5.777538,
3.060907, 3.642983, -5.557864,
3.060907, 3.642983, 5.777538
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
var radius = 7.629926;
var distance = 33.94641;
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
mvMatrix.translate( -0.1417042, -0.4184418, -0.1098371 );
mvMatrix.scale( 1.412993, 1.279194, 0.7277753 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94641);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Chlorfenvinphos<-read.table("Chlorfenvinphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorfenvinphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorfenvinphos' not found
```

```r
y<-Chlorfenvinphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorfenvinphos' not found
```

```r
z<-Chlorfenvinphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorfenvinphos' not found
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
-2.692473, 0.8827466, 0.374475, 0, 0, 1, 1, 1,
-2.678169, 0.59318, -2.966882, 1, 0, 0, 1, 1,
-2.660972, 0.9699821, -1.41281, 1, 0, 0, 1, 1,
-2.659498, -0.6102659, -2.172687, 1, 0, 0, 1, 1,
-2.651257, 0.4061348, -1.189061, 1, 0, 0, 1, 1,
-2.579497, -2.072289, -3.514669, 1, 0, 0, 1, 1,
-2.48305, 0.7286175, -2.236875, 0, 0, 0, 1, 1,
-2.40087, -1.493261, -3.576708, 0, 0, 0, 1, 1,
-2.34912, 1.295264, -1.378557, 0, 0, 0, 1, 1,
-2.326308, 1.167366, -3.632092, 0, 0, 0, 1, 1,
-2.273225, 0.173721, -3.817405, 0, 0, 0, 1, 1,
-2.224173, 0.3736601, 0.6065332, 0, 0, 0, 1, 1,
-2.198783, 1.888305, 0.4672063, 0, 0, 0, 1, 1,
-2.156753, 0.3594452, -1.93337, 1, 1, 1, 1, 1,
-2.12006, 0.1018542, -0.6124087, 1, 1, 1, 1, 1,
-2.099764, 0.3047069, -0.6795756, 1, 1, 1, 1, 1,
-2.05469, -0.09367463, -2.326782, 1, 1, 1, 1, 1,
-2.049044, 0.7023934, -2.197729, 1, 1, 1, 1, 1,
-1.997957, -0.5566292, -0.7667551, 1, 1, 1, 1, 1,
-1.975795, 0.1098428, -1.35667, 1, 1, 1, 1, 1,
-1.961138, -0.5749292, -2.453916, 1, 1, 1, 1, 1,
-1.945926, 0.1702338, -1.650521, 1, 1, 1, 1, 1,
-1.922333, 0.04067359, -2.530007, 1, 1, 1, 1, 1,
-1.911912, 0.4252105, -2.438454, 1, 1, 1, 1, 1,
-1.893063, 3.549065, 1.859721, 1, 1, 1, 1, 1,
-1.882274, -1.441586, -5.095914, 1, 1, 1, 1, 1,
-1.862346, 1.781662, -1.047306, 1, 1, 1, 1, 1,
-1.852264, -2.138206, -4.760191, 1, 1, 1, 1, 1,
-1.850701, -0.5571834, -0.2813978, 0, 0, 1, 1, 1,
-1.831274, -0.565213, -1.672504, 1, 0, 0, 1, 1,
-1.829425, 0.3440886, -3.319855, 1, 0, 0, 1, 1,
-1.829424, 0.1715345, -1.029301, 1, 0, 0, 1, 1,
-1.827629, -0.221078, -0.784397, 1, 0, 0, 1, 1,
-1.82603, -1.255588, -3.678879, 1, 0, 0, 1, 1,
-1.822917, 0.3559088, -0.7781466, 0, 0, 0, 1, 1,
-1.819014, -0.004048376, -1.237862, 0, 0, 0, 1, 1,
-1.817036, -0.2088542, -1.497368, 0, 0, 0, 1, 1,
-1.809602, 0.8264614, -4.064373, 0, 0, 0, 1, 1,
-1.803314, -1.126302, -2.38403, 0, 0, 0, 1, 1,
-1.777206, 0.1943132, -2.117238, 0, 0, 0, 1, 1,
-1.765406, -1.088893, -2.291955, 0, 0, 0, 1, 1,
-1.762232, -0.5146087, -0.7963476, 1, 1, 1, 1, 1,
-1.756721, 0.9914311, -1.37824, 1, 1, 1, 1, 1,
-1.755938, 1.024177, 0.8607625, 1, 1, 1, 1, 1,
-1.749007, 0.6112921, 0.07012345, 1, 1, 1, 1, 1,
-1.71664, -1.393374, -1.726661, 1, 1, 1, 1, 1,
-1.711233, -1.298635, -2.702985, 1, 1, 1, 1, 1,
-1.71051, -1.797636, -3.388027, 1, 1, 1, 1, 1,
-1.696333, 1.452652, 0.04104874, 1, 1, 1, 1, 1,
-1.691342, -0.3445056, 0.8938752, 1, 1, 1, 1, 1,
-1.683695, -0.8135552, -1.693285, 1, 1, 1, 1, 1,
-1.645628, 1.605548, -2.898222, 1, 1, 1, 1, 1,
-1.632436, -0.7941595, -1.572815, 1, 1, 1, 1, 1,
-1.617628, 1.086994, -1.242832, 1, 1, 1, 1, 1,
-1.61729, -0.6085435, -2.997144, 1, 1, 1, 1, 1,
-1.611518, 1.779523, -0.3920279, 1, 1, 1, 1, 1,
-1.603879, -1.981611, -1.73067, 0, 0, 1, 1, 1,
-1.585165, -0.3722566, -1.104159, 1, 0, 0, 1, 1,
-1.569478, -0.3637947, -1.970262, 1, 0, 0, 1, 1,
-1.565811, -1.190001, -3.166755, 1, 0, 0, 1, 1,
-1.552957, -0.1369704, -1.049964, 1, 0, 0, 1, 1,
-1.53389, 1.585266, -1.416252, 1, 0, 0, 1, 1,
-1.512968, 0.4821455, -0.4883668, 0, 0, 0, 1, 1,
-1.509341, 1.489154, 0.6497609, 0, 0, 0, 1, 1,
-1.506001, -0.1532389, -1.046402, 0, 0, 0, 1, 1,
-1.50001, -0.990176, -2.721131, 0, 0, 0, 1, 1,
-1.499277, 1.174139, -2.853328, 0, 0, 0, 1, 1,
-1.488037, 0.4872958, -1.247699, 0, 0, 0, 1, 1,
-1.458504, -2.385725, -1.81828, 0, 0, 0, 1, 1,
-1.44748, -0.3935921, -1.916816, 1, 1, 1, 1, 1,
-1.439644, 0.1206184, -1.169771, 1, 1, 1, 1, 1,
-1.420259, 0.7687579, -0.7418961, 1, 1, 1, 1, 1,
-1.409128, -1.218642, -3.23194, 1, 1, 1, 1, 1,
-1.404754, -0.7378759, -2.781918, 1, 1, 1, 1, 1,
-1.404599, -0.8352363, -2.936122, 1, 1, 1, 1, 1,
-1.399481, 0.9544989, 1.120428, 1, 1, 1, 1, 1,
-1.386736, -1.258262, -1.714646, 1, 1, 1, 1, 1,
-1.384416, -0.3935654, -3.551116, 1, 1, 1, 1, 1,
-1.38432, 0.2826761, -1.105787, 1, 1, 1, 1, 1,
-1.382446, 0.5654462, -0.6448423, 1, 1, 1, 1, 1,
-1.378466, 0.3502007, -1.804225, 1, 1, 1, 1, 1,
-1.377877, 0.587007, 0.9690548, 1, 1, 1, 1, 1,
-1.376344, 0.3261923, -0.3336021, 1, 1, 1, 1, 1,
-1.366639, 2.391732, -0.6973515, 1, 1, 1, 1, 1,
-1.364001, -0.4753911, -3.459185, 0, 0, 1, 1, 1,
-1.357097, -0.3313127, -1.469431, 1, 0, 0, 1, 1,
-1.338262, 0.2144211, -2.23243, 1, 0, 0, 1, 1,
-1.335977, 1.199236, -2.548356, 1, 0, 0, 1, 1,
-1.333016, -0.3549759, -1.110987, 1, 0, 0, 1, 1,
-1.326567, 1.083992, -1.000812, 1, 0, 0, 1, 1,
-1.294878, -1.395999, -2.60304, 0, 0, 0, 1, 1,
-1.268782, 0.7120858, -2.154719, 0, 0, 0, 1, 1,
-1.268385, 1.151671, -0.9501183, 0, 0, 0, 1, 1,
-1.266743, -0.07599062, -1.231988, 0, 0, 0, 1, 1,
-1.265802, -2.413076, -2.118148, 0, 0, 0, 1, 1,
-1.263231, 0.4566892, -0.300598, 0, 0, 0, 1, 1,
-1.246557, 1.290096, -0.6752523, 0, 0, 0, 1, 1,
-1.232402, 0.1323384, -3.788842, 1, 1, 1, 1, 1,
-1.221946, 0.2852361, -1.438277, 1, 1, 1, 1, 1,
-1.221614, 1.513322, 0.3419523, 1, 1, 1, 1, 1,
-1.216928, -0.3663497, -0.146954, 1, 1, 1, 1, 1,
-1.214939, 0.5154362, -1.693169, 1, 1, 1, 1, 1,
-1.211744, 0.3601452, -2.216535, 1, 1, 1, 1, 1,
-1.206697, 0.5183209, -2.364489, 1, 1, 1, 1, 1,
-1.206112, -1.129028, -3.416476, 1, 1, 1, 1, 1,
-1.198644, -1.231352, -1.847793, 1, 1, 1, 1, 1,
-1.196864, -0.1180557, -2.246302, 1, 1, 1, 1, 1,
-1.190824, 0.5029561, -0.5854971, 1, 1, 1, 1, 1,
-1.185783, -0.3011628, -1.227452, 1, 1, 1, 1, 1,
-1.185057, 0.3634322, -3.006912, 1, 1, 1, 1, 1,
-1.179834, -0.926588, -1.079637, 1, 1, 1, 1, 1,
-1.169717, 0.2688315, -0.699957, 1, 1, 1, 1, 1,
-1.168304, 0.3416851, -1.717254, 0, 0, 1, 1, 1,
-1.161566, -0.6667113, -2.605414, 1, 0, 0, 1, 1,
-1.158387, -1.661215, -3.302672, 1, 0, 0, 1, 1,
-1.156817, 1.142368, -3.014132, 1, 0, 0, 1, 1,
-1.154464, -0.01615357, -1.351815, 1, 0, 0, 1, 1,
-1.150035, -0.3260378, -2.205152, 1, 0, 0, 1, 1,
-1.147482, -0.258346, -2.320899, 0, 0, 0, 1, 1,
-1.135498, 1.186123, -0.5467202, 0, 0, 0, 1, 1,
-1.131442, -0.9567645, -4.346638, 0, 0, 0, 1, 1,
-1.125967, 2.008317, 1.15781, 0, 0, 0, 1, 1,
-1.123956, 1.210136, -0.5608956, 0, 0, 0, 1, 1,
-1.119079, 0.4580778, -1.600023, 0, 0, 0, 1, 1,
-1.117407, -0.9377299, -3.079967, 0, 0, 0, 1, 1,
-1.116794, 0.5535129, -1.588123, 1, 1, 1, 1, 1,
-1.115882, 0.01434683, -0.6824379, 1, 1, 1, 1, 1,
-1.113974, -0.646227, -1.219861, 1, 1, 1, 1, 1,
-1.109187, -0.2169355, -1.98705, 1, 1, 1, 1, 1,
-1.099692, -0.5145321, -2.257948, 1, 1, 1, 1, 1,
-1.085986, 0.6945994, 0.3033615, 1, 1, 1, 1, 1,
-1.079674, 0.2552616, -2.528587, 1, 1, 1, 1, 1,
-1.077555, -0.3214068, -0.9485962, 1, 1, 1, 1, 1,
-1.075514, 0.2322851, -0.5458311, 1, 1, 1, 1, 1,
-1.074942, 1.015292, 0.4101472, 1, 1, 1, 1, 1,
-1.071416, 0.1146455, 0.452701, 1, 1, 1, 1, 1,
-1.068659, -1.889944, -2.664608, 1, 1, 1, 1, 1,
-1.068083, -0.5874249, -1.987245, 1, 1, 1, 1, 1,
-1.065972, 0.03176326, -2.685394, 1, 1, 1, 1, 1,
-1.062097, -0.006687207, -0.808553, 1, 1, 1, 1, 1,
-1.050975, 0.8153346, 1.385476, 0, 0, 1, 1, 1,
-1.042849, 1.799821, -2.330971, 1, 0, 0, 1, 1,
-1.042603, -0.369995, -0.2080022, 1, 0, 0, 1, 1,
-1.041963, -0.8228474, -1.547082, 1, 0, 0, 1, 1,
-1.041382, 0.444298, -1.193689, 1, 0, 0, 1, 1,
-1.037943, -0.1401895, -1.507765, 1, 0, 0, 1, 1,
-1.037885, -0.5671914, -1.485616, 0, 0, 0, 1, 1,
-1.036199, 0.1526114, -0.9344642, 0, 0, 0, 1, 1,
-1.029714, -0.5474733, -2.468849, 0, 0, 0, 1, 1,
-1.029538, -0.2281142, -2.0077, 0, 0, 0, 1, 1,
-1.010177, -0.3166495, -3.107077, 0, 0, 0, 1, 1,
-1.009223, -0.2417456, -1.478, 0, 0, 0, 1, 1,
-1.007323, -0.3855535, -4.124883, 0, 0, 0, 1, 1,
-1.002937, 0.01786678, -1.739084, 1, 1, 1, 1, 1,
-0.9943989, -1.367848, -2.699131, 1, 1, 1, 1, 1,
-0.9920161, -0.3522375, -1.194067, 1, 1, 1, 1, 1,
-0.9908157, 1.601018, -1.662157, 1, 1, 1, 1, 1,
-0.98641, 0.5046311, 0.08818422, 1, 1, 1, 1, 1,
-0.9828716, -0.9735908, -2.329876, 1, 1, 1, 1, 1,
-0.9827469, 0.06968109, -0.5550838, 1, 1, 1, 1, 1,
-0.9819705, -0.1205216, -1.289858, 1, 1, 1, 1, 1,
-0.9774879, 0.780188, -2.838828, 1, 1, 1, 1, 1,
-0.9769972, 1.401656, -1.171789, 1, 1, 1, 1, 1,
-0.9746228, 0.4160631, -2.396507, 1, 1, 1, 1, 1,
-0.9482638, -1.904256, -2.123452, 1, 1, 1, 1, 1,
-0.9450535, 1.098767, -0.888344, 1, 1, 1, 1, 1,
-0.9423949, -0.09775975, -0.7015161, 1, 1, 1, 1, 1,
-0.9389794, 0.5468253, -0.4526409, 1, 1, 1, 1, 1,
-0.9374049, 0.7599112, -0.3602027, 0, 0, 1, 1, 1,
-0.9368706, 0.2030057, -0.4784955, 1, 0, 0, 1, 1,
-0.9335797, -1.052382, -2.886987, 1, 0, 0, 1, 1,
-0.9315716, -0.2247, -2.045444, 1, 0, 0, 1, 1,
-0.9307091, -1.703357, -3.940387, 1, 0, 0, 1, 1,
-0.9304097, 1.81408, 0.5656711, 1, 0, 0, 1, 1,
-0.9231243, -0.135566, -1.967735, 0, 0, 0, 1, 1,
-0.9170473, -0.0075206, -2.016509, 0, 0, 0, 1, 1,
-0.9102889, -1.626896, -3.168082, 0, 0, 0, 1, 1,
-0.9003552, -0.3432276, -2.47282, 0, 0, 0, 1, 1,
-0.8997872, -2.284428, -2.058935, 0, 0, 0, 1, 1,
-0.8936615, -0.2758117, -1.864, 0, 0, 0, 1, 1,
-0.8858907, 1.083445, -0.1146975, 0, 0, 0, 1, 1,
-0.8838702, 0.7844384, -1.046577, 1, 1, 1, 1, 1,
-0.8810619, -0.2188136, -0.9432811, 1, 1, 1, 1, 1,
-0.878502, -1.792863, -1.905225, 1, 1, 1, 1, 1,
-0.8538727, -0.9871316, -2.079687, 1, 1, 1, 1, 1,
-0.8443102, -0.3116378, -3.844468, 1, 1, 1, 1, 1,
-0.8426973, -0.2033201, -2.559692, 1, 1, 1, 1, 1,
-0.8421704, 0.7431347, 0.6181268, 1, 1, 1, 1, 1,
-0.8420324, -0.4052161, -1.967554, 1, 1, 1, 1, 1,
-0.8380911, 0.6164281, -1.581608, 1, 1, 1, 1, 1,
-0.8359341, -0.5485697, -2.729771, 1, 1, 1, 1, 1,
-0.832361, 0.1525928, -1.372662, 1, 1, 1, 1, 1,
-0.8242124, 0.2469608, -1.369999, 1, 1, 1, 1, 1,
-0.823377, 0.7820163, -1.270017, 1, 1, 1, 1, 1,
-0.820263, -0.9646825, -1.420565, 1, 1, 1, 1, 1,
-0.8159238, 0.04355301, -0.7033664, 1, 1, 1, 1, 1,
-0.8121356, 0.1139768, -1.296882, 0, 0, 1, 1, 1,
-0.8120026, 0.01576226, -2.792764, 1, 0, 0, 1, 1,
-0.8102127, 0.3608443, -2.801024, 1, 0, 0, 1, 1,
-0.8089398, -0.1303046, -3.061494, 1, 0, 0, 1, 1,
-0.8082259, -1.248562, -3.884342, 1, 0, 0, 1, 1,
-0.8028556, 0.1340152, -0.2570931, 1, 0, 0, 1, 1,
-0.8022026, 0.8906354, 0.5480628, 0, 0, 0, 1, 1,
-0.7990616, -0.7536792, -1.936109, 0, 0, 0, 1, 1,
-0.793117, 1.122244, -1.21068, 0, 0, 0, 1, 1,
-0.7910685, 1.347468, -0.6838728, 0, 0, 0, 1, 1,
-0.7907385, -0.5537732, -1.385949, 0, 0, 0, 1, 1,
-0.7883201, -0.1875497, -1.10552, 0, 0, 0, 1, 1,
-0.7872061, 0.7583272, 2.187791, 0, 0, 0, 1, 1,
-0.7852879, 1.11577, -0.01547511, 1, 1, 1, 1, 1,
-0.782007, -0.09101567, -3.823636, 1, 1, 1, 1, 1,
-0.7817353, -0.6988549, -3.151467, 1, 1, 1, 1, 1,
-0.7747073, -1.255219, -3.863305, 1, 1, 1, 1, 1,
-0.7640159, -0.1841881, -1.334318, 1, 1, 1, 1, 1,
-0.757251, -0.3653647, -1.680778, 1, 1, 1, 1, 1,
-0.7555034, 0.04280549, -0.6062533, 1, 1, 1, 1, 1,
-0.7540874, 0.3126814, 0.568189, 1, 1, 1, 1, 1,
-0.7509111, 1.492744, -1.757149, 1, 1, 1, 1, 1,
-0.7507529, 0.4884401, 0.4391183, 1, 1, 1, 1, 1,
-0.7407971, 0.6195671, -0.1871573, 1, 1, 1, 1, 1,
-0.7407727, -1.256514, -3.31282, 1, 1, 1, 1, 1,
-0.7377913, -1.079307, -3.312893, 1, 1, 1, 1, 1,
-0.7368265, 1.054467, 1.548063, 1, 1, 1, 1, 1,
-0.7351066, -0.5946672, -2.172873, 1, 1, 1, 1, 1,
-0.7330641, 0.8725812, -0.117269, 0, 0, 1, 1, 1,
-0.7325303, -0.9160713, -3.99641, 1, 0, 0, 1, 1,
-0.7316562, -1.035257, -3.771763, 1, 0, 0, 1, 1,
-0.7303165, -1.205381, -2.805858, 1, 0, 0, 1, 1,
-0.7258905, -1.617831, -2.993302, 1, 0, 0, 1, 1,
-0.7251298, -2.15911, -3.576368, 1, 0, 0, 1, 1,
-0.7217622, -0.3329255, -2.444803, 0, 0, 0, 1, 1,
-0.7203683, 0.2160528, -2.628816, 0, 0, 0, 1, 1,
-0.7162602, -0.4716627, -3.640337, 0, 0, 0, 1, 1,
-0.7080841, 0.1829023, -1.141745, 0, 0, 0, 1, 1,
-0.7021843, 0.09527969, -1.708625, 0, 0, 0, 1, 1,
-0.7006022, 0.2033785, -2.12823, 0, 0, 0, 1, 1,
-0.6964016, -1.141837, -2.020605, 0, 0, 0, 1, 1,
-0.6933803, 2.453533, -1.023355, 1, 1, 1, 1, 1,
-0.6808625, 0.4653908, -0.2285495, 1, 1, 1, 1, 1,
-0.6798769, -0.06635248, -0.8841872, 1, 1, 1, 1, 1,
-0.6790075, -1.970262, -3.17562, 1, 1, 1, 1, 1,
-0.6788031, -0.2082788, -3.048591, 1, 1, 1, 1, 1,
-0.676894, 0.6650833, -0.6094471, 1, 1, 1, 1, 1,
-0.676713, 0.5581632, -0.9751405, 1, 1, 1, 1, 1,
-0.6750196, 0.522819, -0.2822478, 1, 1, 1, 1, 1,
-0.6727634, -0.6279369, -1.450427, 1, 1, 1, 1, 1,
-0.6605492, -1.357311, -1.791794, 1, 1, 1, 1, 1,
-0.6600386, -0.07035407, -1.491665, 1, 1, 1, 1, 1,
-0.6599218, 0.3510706, -2.99509, 1, 1, 1, 1, 1,
-0.6596883, -0.5926504, -0.5436963, 1, 1, 1, 1, 1,
-0.6596561, 0.2485063, -2.50984, 1, 1, 1, 1, 1,
-0.6588533, 0.2133166, 0.166853, 1, 1, 1, 1, 1,
-0.6575924, 0.4990739, -1.565255, 0, 0, 1, 1, 1,
-0.655487, 1.177739, -1.747499, 1, 0, 0, 1, 1,
-0.6540824, 1.124253, -1.080901, 1, 0, 0, 1, 1,
-0.6533496, -1.350893, -4.182122, 1, 0, 0, 1, 1,
-0.6480232, 0.1673762, 0.2730377, 1, 0, 0, 1, 1,
-0.6444454, 0.373306, -0.9509455, 1, 0, 0, 1, 1,
-0.6437094, -0.2350833, -1.694031, 0, 0, 0, 1, 1,
-0.6381679, 0.5550495, -0.5196862, 0, 0, 0, 1, 1,
-0.6322564, -1.881716, -3.712386, 0, 0, 0, 1, 1,
-0.6300226, -0.9290007, -3.453054, 0, 0, 0, 1, 1,
-0.6298975, 0.7379519, -0.4951675, 0, 0, 0, 1, 1,
-0.6270759, -0.1425613, -3.018694, 0, 0, 0, 1, 1,
-0.6187226, 0.2280515, -1.605984, 0, 0, 0, 1, 1,
-0.613482, 1.096903, -0.5904895, 1, 1, 1, 1, 1,
-0.6133616, 1.506929, -1.525839, 1, 1, 1, 1, 1,
-0.6112847, 1.077655, 0.007590524, 1, 1, 1, 1, 1,
-0.6088073, -0.1709972, -2.08706, 1, 1, 1, 1, 1,
-0.6072344, -1.456479, -2.763907, 1, 1, 1, 1, 1,
-0.5867671, -0.1052626, -1.436558, 1, 1, 1, 1, 1,
-0.5844887, 1.867009, -1.798352, 1, 1, 1, 1, 1,
-0.5843608, -0.3985736, -5.392785, 1, 1, 1, 1, 1,
-0.5837702, -0.3806745, -2.878006, 1, 1, 1, 1, 1,
-0.582095, 1.005938, 0.1830041, 1, 1, 1, 1, 1,
-0.5807093, 0.2875638, -1.080123, 1, 1, 1, 1, 1,
-0.5716361, -0.1220801, -1.070445, 1, 1, 1, 1, 1,
-0.5705387, 1.35874, -0.8060227, 1, 1, 1, 1, 1,
-0.5659297, 0.6938093, -0.1811232, 1, 1, 1, 1, 1,
-0.5588424, 1.325241, -0.03118599, 1, 1, 1, 1, 1,
-0.5574872, 0.6210514, 0.585811, 0, 0, 1, 1, 1,
-0.5466102, 1.134791, -0.5101742, 1, 0, 0, 1, 1,
-0.5457555, 1.317272, -1.634279, 1, 0, 0, 1, 1,
-0.5428037, -1.231055, -2.168221, 1, 0, 0, 1, 1,
-0.5420354, -0.8223243, -2.164599, 1, 0, 0, 1, 1,
-0.5379888, 0.3569414, -0.962284, 1, 0, 0, 1, 1,
-0.5355596, 0.5710061, -2.811594, 0, 0, 0, 1, 1,
-0.5301063, 0.2424039, -1.187433, 0, 0, 0, 1, 1,
-0.5289654, 0.5066574, -0.2143018, 0, 0, 0, 1, 1,
-0.5254223, 2.216398, -2.970072, 0, 0, 0, 1, 1,
-0.5230126, -0.1835992, -2.669895, 0, 0, 0, 1, 1,
-0.5193571, 1.543162, -0.7463158, 0, 0, 0, 1, 1,
-0.5188889, -0.274779, -0.1622598, 0, 0, 0, 1, 1,
-0.5177717, -0.131159, -2.038276, 1, 1, 1, 1, 1,
-0.5176747, 1.253111, -0.01140707, 1, 1, 1, 1, 1,
-0.5142256, -0.601113, -4.452482, 1, 1, 1, 1, 1,
-0.5112346, -0.8464332, -1.896941, 1, 1, 1, 1, 1,
-0.5092317, -0.1157267, -2.580396, 1, 1, 1, 1, 1,
-0.5067335, -0.4504073, -2.177826, 1, 1, 1, 1, 1,
-0.5047584, -0.1284531, -2.553073, 1, 1, 1, 1, 1,
-0.5008392, -0.01821491, -1.034419, 1, 1, 1, 1, 1,
-0.5007741, 0.7041097, -1.795134, 1, 1, 1, 1, 1,
-0.5000439, -1.220111, -3.758465, 1, 1, 1, 1, 1,
-0.499071, 1.082291, 1.054843, 1, 1, 1, 1, 1,
-0.4984307, -0.2598841, -1.49819, 1, 1, 1, 1, 1,
-0.498323, 0.3559187, -0.5201793, 1, 1, 1, 1, 1,
-0.4977202, 2.966292, 0.1047761, 1, 1, 1, 1, 1,
-0.496981, 0.5167841, -0.4834031, 1, 1, 1, 1, 1,
-0.4927242, -0.5093724, -4.066057, 0, 0, 1, 1, 1,
-0.4914157, -1.310461, -2.449864, 1, 0, 0, 1, 1,
-0.4913644, 0.3185808, -0.125821, 1, 0, 0, 1, 1,
-0.4912758, 0.4676322, -0.02955749, 1, 0, 0, 1, 1,
-0.4853168, 0.3294928, 0.3541571, 1, 0, 0, 1, 1,
-0.4849897, -1.024835, -0.7398877, 1, 0, 0, 1, 1,
-0.4840158, 0.02330161, -1.245803, 0, 0, 0, 1, 1,
-0.4820958, 0.5847234, -1.09867, 0, 0, 0, 1, 1,
-0.479196, -0.920804, -2.108185, 0, 0, 0, 1, 1,
-0.4767512, -2.234097, -2.404274, 0, 0, 0, 1, 1,
-0.4747334, -2.190392, -2.705582, 0, 0, 0, 1, 1,
-0.4716022, 0.7395309, -0.2000902, 0, 0, 0, 1, 1,
-0.4713231, -1.127106, -1.296723, 0, 0, 0, 1, 1,
-0.4705598, 0.6546624, -0.3741002, 1, 1, 1, 1, 1,
-0.4704908, -1.031621, -1.826106, 1, 1, 1, 1, 1,
-0.4640828, 0.1445041, -2.052194, 1, 1, 1, 1, 1,
-0.4598836, 1.358945, -1.624115, 1, 1, 1, 1, 1,
-0.458124, -0.3878622, -2.99274, 1, 1, 1, 1, 1,
-0.4544418, 1.195685, 0.09904915, 1, 1, 1, 1, 1,
-0.4487604, 1.437461, 0.03928079, 1, 1, 1, 1, 1,
-0.4328822, 0.6979586, -0.1690179, 1, 1, 1, 1, 1,
-0.4310498, 0.622131, -1.13383, 1, 1, 1, 1, 1,
-0.4278848, -0.8095393, -2.610686, 1, 1, 1, 1, 1,
-0.4274992, 0.2388204, 0.1606557, 1, 1, 1, 1, 1,
-0.4129364, 0.1067024, -0.5208797, 1, 1, 1, 1, 1,
-0.4120502, 1.416585, 0.6234781, 1, 1, 1, 1, 1,
-0.4054244, 0.2002582, -0.9229327, 1, 1, 1, 1, 1,
-0.4050911, 1.935858, 1.578751, 1, 1, 1, 1, 1,
-0.4039448, -0.3284927, -1.921766, 0, 0, 1, 1, 1,
-0.4027539, -0.5170727, -0.3603904, 1, 0, 0, 1, 1,
-0.4022543, -0.7005592, -1.654245, 1, 0, 0, 1, 1,
-0.3889642, 0.6980794, -2.612854, 1, 0, 0, 1, 1,
-0.3868219, 0.03029498, -2.531084, 1, 0, 0, 1, 1,
-0.3847742, -1.435318, -2.395271, 1, 0, 0, 1, 1,
-0.383951, 0.3049215, -0.8311125, 0, 0, 0, 1, 1,
-0.3781011, 0.955254, -1.274624, 0, 0, 0, 1, 1,
-0.3757244, 1.628103, -0.7304274, 0, 0, 0, 1, 1,
-0.3743895, 0.2953261, -1.449439, 0, 0, 0, 1, 1,
-0.3740672, 1.526318, 0.1727315, 0, 0, 0, 1, 1,
-0.373744, 1.281526, 1.326409, 0, 0, 0, 1, 1,
-0.3714922, 0.3361576, 0.8280616, 0, 0, 0, 1, 1,
-0.371447, 0.02807983, -1.391341, 1, 1, 1, 1, 1,
-0.3702076, -0.3316988, -3.735362, 1, 1, 1, 1, 1,
-0.3689702, 1.017656, -0.1436358, 1, 1, 1, 1, 1,
-0.3688366, -0.6746773, -3.745284, 1, 1, 1, 1, 1,
-0.3652596, -1.556461, -1.936623, 1, 1, 1, 1, 1,
-0.3631432, 0.261066, -0.9959308, 1, 1, 1, 1, 1,
-0.3621459, 2.344962, 0.8214536, 1, 1, 1, 1, 1,
-0.3604891, 2.016936, -0.494264, 1, 1, 1, 1, 1,
-0.3603422, -0.8300441, -3.787453, 1, 1, 1, 1, 1,
-0.3578728, -1.04511, -1.850075, 1, 1, 1, 1, 1,
-0.3540417, -1.192845, -3.687364, 1, 1, 1, 1, 1,
-0.3528662, -0.6683544, -3.382408, 1, 1, 1, 1, 1,
-0.3528172, -0.593672, -2.900438, 1, 1, 1, 1, 1,
-0.3478832, 0.7406653, -0.9365157, 1, 1, 1, 1, 1,
-0.3433682, 1.359048, -0.6369433, 1, 1, 1, 1, 1,
-0.3380378, -0.629684, -4.430009, 0, 0, 1, 1, 1,
-0.3341454, 0.2667731, -1.193532, 1, 0, 0, 1, 1,
-0.3321012, -1.345905, -1.888906, 1, 0, 0, 1, 1,
-0.3294383, 0.9265789, 1.495642, 1, 0, 0, 1, 1,
-0.3234541, 2.375015, -1.599733, 1, 0, 0, 1, 1,
-0.3230602, -1.008242, -2.84775, 1, 0, 0, 1, 1,
-0.32295, 1.811927, -0.5609225, 0, 0, 0, 1, 1,
-0.3220356, -1.501423, -1.827133, 0, 0, 0, 1, 1,
-0.3189873, 0.7508355, 0.4010413, 0, 0, 0, 1, 1,
-0.3168809, 0.8520221, 0.5502297, 0, 0, 0, 1, 1,
-0.313769, 1.212771, -0.6301743, 0, 0, 0, 1, 1,
-0.3127739, -1.784294, -3.33193, 0, 0, 0, 1, 1,
-0.3118214, -0.4394217, -1.368972, 0, 0, 0, 1, 1,
-0.3100796, 0.8233148, -0.9044234, 1, 1, 1, 1, 1,
-0.3038621, -1.299808, -1.610695, 1, 1, 1, 1, 1,
-0.296802, -0.5719772, -0.7819715, 1, 1, 1, 1, 1,
-0.2887179, 0.5066621, -0.8706176, 1, 1, 1, 1, 1,
-0.2840644, 1.556155, 0.9385383, 1, 1, 1, 1, 1,
-0.2806928, 1.524231, 0.09282568, 1, 1, 1, 1, 1,
-0.2803554, 0.5136682, -0.8914284, 1, 1, 1, 1, 1,
-0.2793554, -0.002095522, -2.969801, 1, 1, 1, 1, 1,
-0.2777029, -0.01822058, -1.391212, 1, 1, 1, 1, 1,
-0.2751251, -1.183631, -1.556087, 1, 1, 1, 1, 1,
-0.2730934, -0.1729152, -2.983059, 1, 1, 1, 1, 1,
-0.2718741, -0.344702, -3.515916, 1, 1, 1, 1, 1,
-0.2713413, -0.5841621, -3.779338, 1, 1, 1, 1, 1,
-0.2704761, -2.217567, -1.805532, 1, 1, 1, 1, 1,
-0.2674938, 1.678022, 1.718755, 1, 1, 1, 1, 1,
-0.2665849, 0.567524, 0.6334185, 0, 0, 1, 1, 1,
-0.2629398, -0.990119, -3.262851, 1, 0, 0, 1, 1,
-0.2626467, 0.655004, -0.7929724, 1, 0, 0, 1, 1,
-0.2541452, 1.711567, 0.51356, 1, 0, 0, 1, 1,
-0.2509185, -0.5424933, -1.292337, 1, 0, 0, 1, 1,
-0.2504005, -0.4091346, -2.128653, 1, 0, 0, 1, 1,
-0.2461874, 0.9614404, 0.2799687, 0, 0, 0, 1, 1,
-0.2442072, 0.3207352, -1.681046, 0, 0, 0, 1, 1,
-0.243924, 0.4883058, -2.440641, 0, 0, 0, 1, 1,
-0.2406828, -1.027328, -2.625091, 0, 0, 0, 1, 1,
-0.2322066, 0.1695777, -2.530082, 0, 0, 0, 1, 1,
-0.230084, 0.9363832, 1.160176, 0, 0, 0, 1, 1,
-0.2237551, -0.8049211, -2.648989, 0, 0, 0, 1, 1,
-0.221226, 2.316175, -0.03391504, 1, 1, 1, 1, 1,
-0.2185226, -1.200573, -1.156781, 1, 1, 1, 1, 1,
-0.2166538, -2.365351, -3.523658, 1, 1, 1, 1, 1,
-0.2154273, -0.4536975, -0.6735803, 1, 1, 1, 1, 1,
-0.2148263, -0.7774594, -2.965852, 1, 1, 1, 1, 1,
-0.214324, 0.2577956, -0.6091055, 1, 1, 1, 1, 1,
-0.2105938, -0.4243033, -2.287091, 1, 1, 1, 1, 1,
-0.2069044, 0.5371023, -1.225279, 1, 1, 1, 1, 1,
-0.2068221, -0.4645264, -2.423463, 1, 1, 1, 1, 1,
-0.2061422, 0.5721115, -0.8372177, 1, 1, 1, 1, 1,
-0.2029113, 1.327544, -1.068339, 1, 1, 1, 1, 1,
-0.2018776, 0.5940806, -0.6411598, 1, 1, 1, 1, 1,
-0.1998725, 0.3695352, -3.106437, 1, 1, 1, 1, 1,
-0.1981522, -0.4500773, -3.331249, 1, 1, 1, 1, 1,
-0.1929193, 0.717751, -1.301368, 1, 1, 1, 1, 1,
-0.1912923, 0.8777522, -0.6749787, 0, 0, 1, 1, 1,
-0.189864, -0.1882237, -2.168898, 1, 0, 0, 1, 1,
-0.1829021, -0.5156259, -3.010105, 1, 0, 0, 1, 1,
-0.1804308, -0.6005422, -2.489913, 1, 0, 0, 1, 1,
-0.1743477, 0.4193391, 0.8973958, 1, 0, 0, 1, 1,
-0.1733207, -0.1258959, -2.332836, 1, 0, 0, 1, 1,
-0.1725244, -0.3710504, -2.0362, 0, 0, 0, 1, 1,
-0.1667641, 0.2145944, 0.8172309, 0, 0, 0, 1, 1,
-0.1655504, -1.174731, -2.114802, 0, 0, 0, 1, 1,
-0.1627526, 1.246881, 0.3963221, 0, 0, 0, 1, 1,
-0.1562689, 0.2217594, -0.709137, 0, 0, 0, 1, 1,
-0.1562411, -0.5203306, -2.242178, 0, 0, 0, 1, 1,
-0.1486197, 0.1849647, 0.8207083, 0, 0, 0, 1, 1,
-0.1482637, 1.092562, 2.200046, 1, 1, 1, 1, 1,
-0.1460814, -0.04104733, -1.076635, 1, 1, 1, 1, 1,
-0.1453261, 0.1799029, 0.9509128, 1, 1, 1, 1, 1,
-0.1425966, -0.7430297, -2.878469, 1, 1, 1, 1, 1,
-0.1424956, 0.7109594, -1.614449, 1, 1, 1, 1, 1,
-0.142461, 0.1417667, -1.19723, 1, 1, 1, 1, 1,
-0.1396471, -0.985667, -4.810119, 1, 1, 1, 1, 1,
-0.1370269, 1.727781, -2.113198, 1, 1, 1, 1, 1,
-0.1357383, -1.069924, -3.787534, 1, 1, 1, 1, 1,
-0.1276212, 0.3509158, -0.2918763, 1, 1, 1, 1, 1,
-0.1272746, -0.7387705, -3.961625, 1, 1, 1, 1, 1,
-0.1250878, -0.5100954, -1.700685, 1, 1, 1, 1, 1,
-0.1205066, 1.078393, 0.1013205, 1, 1, 1, 1, 1,
-0.1138192, 0.1566691, -2.479876, 1, 1, 1, 1, 1,
-0.1124759, -0.5491872, -2.932462, 1, 1, 1, 1, 1,
-0.1105664, 1.091826, -0.1352402, 0, 0, 1, 1, 1,
-0.1092269, -0.03659292, -0.8127204, 1, 0, 0, 1, 1,
-0.1070779, 0.8629653, 0.1057207, 1, 0, 0, 1, 1,
-0.106348, -1.362974, -1.898975, 1, 0, 0, 1, 1,
-0.0997325, 0.5712755, -0.3222369, 1, 0, 0, 1, 1,
-0.09844247, 0.8809059, 0.4698949, 1, 0, 0, 1, 1,
-0.09797528, 0.9713746, -0.006820074, 0, 0, 0, 1, 1,
-0.09592852, -1.321057, -2.884479, 0, 0, 0, 1, 1,
-0.09379843, -0.1673663, -1.450554, 0, 0, 0, 1, 1,
-0.0923448, -1.22268, -1.234639, 0, 0, 0, 1, 1,
-0.09184523, 0.3918321, -2.520098, 0, 0, 0, 1, 1,
-0.09046239, -0.9253665, -1.491315, 0, 0, 0, 1, 1,
-0.08555482, 0.01446117, -1.590996, 0, 0, 0, 1, 1,
-0.08374703, 0.02209817, -1.118387, 1, 1, 1, 1, 1,
-0.07876822, -1.280449, -2.102532, 1, 1, 1, 1, 1,
-0.07794908, -0.7497507, -2.787129, 1, 1, 1, 1, 1,
-0.07495385, 1.069776, -0.1020623, 1, 1, 1, 1, 1,
-0.07207824, -1.237949, -2.20058, 1, 1, 1, 1, 1,
-0.06945994, -0.1000757, -2.171245, 1, 1, 1, 1, 1,
-0.06889124, -0.5613078, -3.076506, 1, 1, 1, 1, 1,
-0.0671034, -0.3011443, -4.751839, 1, 1, 1, 1, 1,
-0.0648491, 1.263276, 0.7178242, 1, 1, 1, 1, 1,
-0.06001136, 0.417888, -1.699888, 1, 1, 1, 1, 1,
-0.04573568, 1.843572, 0.2724301, 1, 1, 1, 1, 1,
-0.04362919, -0.2060959, -1.520908, 1, 1, 1, 1, 1,
-0.04029215, -0.1778946, -2.333793, 1, 1, 1, 1, 1,
-0.03990193, 0.4726076, -1.934113, 1, 1, 1, 1, 1,
-0.03665811, -1.145545, -4.210834, 1, 1, 1, 1, 1,
-0.03653502, -0.06226483, -2.095192, 0, 0, 1, 1, 1,
-0.03594929, 1.206874, -0.2165677, 1, 0, 0, 1, 1,
-0.03525538, -0.747024, -2.03403, 1, 0, 0, 1, 1,
-0.03485797, -1.1181, -3.009488, 1, 0, 0, 1, 1,
-0.03333067, -1.160347, -2.926702, 1, 0, 0, 1, 1,
-0.03185284, 0.328721, 1.121746, 1, 0, 0, 1, 1,
-0.02818688, -0.1936788, -4.158798, 0, 0, 0, 1, 1,
-0.02715993, -1.048763, -3.580432, 0, 0, 0, 1, 1,
-0.02072247, -1.199218, -4.009254, 0, 0, 0, 1, 1,
-0.01841211, 0.07401809, -1.096099, 0, 0, 0, 1, 1,
-0.01553079, -0.6504582, -5.237397, 0, 0, 0, 1, 1,
-0.01306386, -0.8783754, -3.07837, 0, 0, 0, 1, 1,
-0.01211795, 1.977385, 0.07281646, 0, 0, 0, 1, 1,
-0.004121053, 0.9382461, -0.5468031, 1, 1, 1, 1, 1,
-0.002944036, 0.6443632, -0.7048148, 1, 1, 1, 1, 1,
0.008219901, 0.6822549, -0.7132539, 1, 1, 1, 1, 1,
0.008780091, 0.4043362, 1.965103, 1, 1, 1, 1, 1,
0.009694437, -2.712181, 2.167221, 1, 1, 1, 1, 1,
0.01227749, -0.3186844, 4.681568, 1, 1, 1, 1, 1,
0.01230561, -0.4299324, 4.686299, 1, 1, 1, 1, 1,
0.01278732, -0.4439018, 3.466683, 1, 1, 1, 1, 1,
0.0133972, -0.6332054, 3.750065, 1, 1, 1, 1, 1,
0.01603313, 0.004429816, 0.6814342, 1, 1, 1, 1, 1,
0.02047985, -0.4286874, 2.724083, 1, 1, 1, 1, 1,
0.02142248, 0.6066229, 1.398315, 1, 1, 1, 1, 1,
0.02193917, -0.9122995, 1.657531, 1, 1, 1, 1, 1,
0.0225537, 0.3793328, -0.9144793, 1, 1, 1, 1, 1,
0.02282606, 0.9142602, 0.1177381, 1, 1, 1, 1, 1,
0.03213235, -0.5409888, 2.920489, 0, 0, 1, 1, 1,
0.03666941, -1.94729, 3.662248, 1, 0, 0, 1, 1,
0.03706738, 1.77158, -0.5150447, 1, 0, 0, 1, 1,
0.03769063, 0.6153144, 2.500916, 1, 0, 0, 1, 1,
0.03951336, -0.542284, 2.192385, 1, 0, 0, 1, 1,
0.03952918, 0.6471323, 1.528862, 1, 0, 0, 1, 1,
0.05803465, -0.4279168, 3.403676, 0, 0, 0, 1, 1,
0.06008918, -1.21614, 2.367597, 0, 0, 0, 1, 1,
0.06426427, 1.327224, 0.1215039, 0, 0, 0, 1, 1,
0.06789842, 1.1931, 0.07813065, 0, 0, 0, 1, 1,
0.07028756, 0.06007421, 0.5998375, 0, 0, 0, 1, 1,
0.0706877, 1.36806, -0.451396, 0, 0, 0, 1, 1,
0.07105058, -1.317866, 5.612459, 0, 0, 0, 1, 1,
0.07468371, -1.11279, 4.293795, 1, 1, 1, 1, 1,
0.07777055, 1.573851, 2.413117, 1, 1, 1, 1, 1,
0.07895199, 0.1442368, 0.2588496, 1, 1, 1, 1, 1,
0.07999894, 0.5787221, -0.5957269, 1, 1, 1, 1, 1,
0.08084566, -0.2393875, 3.369688, 1, 1, 1, 1, 1,
0.08366726, -0.1052177, 3.057779, 1, 1, 1, 1, 1,
0.08444643, 0.08212873, 0.1672747, 1, 1, 1, 1, 1,
0.08534551, 0.01469966, -0.04299078, 1, 1, 1, 1, 1,
0.08575967, 0.002544986, 0.7318749, 1, 1, 1, 1, 1,
0.08734972, -0.4749895, 3.40351, 1, 1, 1, 1, 1,
0.09196842, 2.712637, -0.4745088, 1, 1, 1, 1, 1,
0.09569181, -0.08790223, 0.922917, 1, 1, 1, 1, 1,
0.09832408, -0.5661449, 2.536708, 1, 1, 1, 1, 1,
0.09871516, -1.244924, 3.022721, 1, 1, 1, 1, 1,
0.1030993, 0.7195577, -0.07150821, 1, 1, 1, 1, 1,
0.113309, -0.1215215, 2.225973, 0, 0, 1, 1, 1,
0.1197613, -1.208592, 2.559605, 1, 0, 0, 1, 1,
0.1207196, -1.248885, 1.896055, 1, 0, 0, 1, 1,
0.1211433, 0.7345749, -1.397767, 1, 0, 0, 1, 1,
0.1237867, 1.166168, 0.5617786, 1, 0, 0, 1, 1,
0.1241454, 0.7269773, -0.1679313, 1, 0, 0, 1, 1,
0.1256362, -0.2431548, 1.425537, 0, 0, 0, 1, 1,
0.1266265, -0.9967958, 4.090766, 0, 0, 0, 1, 1,
0.1280594, -1.282444, 1.993884, 0, 0, 0, 1, 1,
0.1371522, -0.6071156, 3.357216, 0, 0, 0, 1, 1,
0.1373748, 0.3032046, 1.045249, 0, 0, 0, 1, 1,
0.1397621, -0.2132186, 3.07014, 0, 0, 0, 1, 1,
0.142413, -0.534672, 1.779895, 0, 0, 0, 1, 1,
0.1468294, 1.238393, 0.302897, 1, 1, 1, 1, 1,
0.1469306, -1.186441, 2.367119, 1, 1, 1, 1, 1,
0.1472582, -0.6378382, 3.887728, 1, 1, 1, 1, 1,
0.1494026, 0.05488775, -0.5537801, 1, 1, 1, 1, 1,
0.1521456, -0.5627506, 3.970179, 1, 1, 1, 1, 1,
0.1532867, 0.9499062, -0.006526539, 1, 1, 1, 1, 1,
0.1538849, -1.055327, 2.270854, 1, 1, 1, 1, 1,
0.1553083, 1.312411, 1.273885, 1, 1, 1, 1, 1,
0.1606236, 0.2168737, 0.04818843, 1, 1, 1, 1, 1,
0.1689686, 0.2302741, 0.4255758, 1, 1, 1, 1, 1,
0.1715262, 0.434326, 1.082179, 1, 1, 1, 1, 1,
0.1720569, 0.6102412, 0.6799597, 1, 1, 1, 1, 1,
0.1752848, -2.201508, 2.763044, 1, 1, 1, 1, 1,
0.1764649, -0.5219522, 2.29206, 1, 1, 1, 1, 1,
0.1771845, 0.1921972, 2.56866, 1, 1, 1, 1, 1,
0.1828001, -0.2431449, 4.314188, 0, 0, 1, 1, 1,
0.18485, -0.6001747, 3.559034, 1, 0, 0, 1, 1,
0.1894359, 0.2010987, -0.4003918, 1, 0, 0, 1, 1,
0.1911144, -1.337247, 2.584539, 1, 0, 0, 1, 1,
0.1912252, 0.9228857, -1.298558, 1, 0, 0, 1, 1,
0.1941664, 1.639467, -1.290803, 1, 0, 0, 1, 1,
0.1958083, -0.2412976, 2.38765, 0, 0, 0, 1, 1,
0.2038737, 1.292953, 1.344347, 0, 0, 0, 1, 1,
0.2084102, 0.06577528, 2.065006, 0, 0, 0, 1, 1,
0.2093436, 1.755272, -0.6854964, 0, 0, 0, 1, 1,
0.2134482, 0.343496, 0.08105265, 0, 0, 0, 1, 1,
0.2151598, 1.641387, 1.268807, 0, 0, 0, 1, 1,
0.2152316, 0.2740734, 0.3326846, 0, 0, 0, 1, 1,
0.2175155, -1.303408, 2.478744, 1, 1, 1, 1, 1,
0.2204866, 0.5044656, 2.166793, 1, 1, 1, 1, 1,
0.2232496, -0.8241172, 3.086771, 1, 1, 1, 1, 1,
0.228098, 1.793897, 0.937575, 1, 1, 1, 1, 1,
0.2302609, -0.1816621, 2.100692, 1, 1, 1, 1, 1,
0.2375143, 1.20397, -0.1773992, 1, 1, 1, 1, 1,
0.2389808, 0.1214572, 0.8381986, 1, 1, 1, 1, 1,
0.2424587, -1.222704, 4.05206, 1, 1, 1, 1, 1,
0.2442888, 1.114281, -0.9281586, 1, 1, 1, 1, 1,
0.2450784, -0.3698323, 3.202062, 1, 1, 1, 1, 1,
0.2453217, 0.6741045, -0.4558313, 1, 1, 1, 1, 1,
0.2458036, 0.830143, 0.4396285, 1, 1, 1, 1, 1,
0.2581279, -0.273016, 2.68997, 1, 1, 1, 1, 1,
0.260396, -1.646211, 1.314073, 1, 1, 1, 1, 1,
0.2606141, -0.2743323, 2.554557, 1, 1, 1, 1, 1,
0.2663312, 1.516802, -0.05610246, 0, 0, 1, 1, 1,
0.2675355, -1.7038, 1.952977, 1, 0, 0, 1, 1,
0.2681153, 0.6765088, 0.1127109, 1, 0, 0, 1, 1,
0.2801216, -0.08711775, 1.324261, 1, 0, 0, 1, 1,
0.2805224, -2.481845, 2.083065, 1, 0, 0, 1, 1,
0.2827267, 0.3933364, -0.1101611, 1, 0, 0, 1, 1,
0.2849214, 0.01110589, 1.482359, 0, 0, 0, 1, 1,
0.290938, -0.2546537, 2.540285, 0, 0, 0, 1, 1,
0.2948833, -0.003448636, 0.4823857, 0, 0, 0, 1, 1,
0.2957866, 0.6549002, 0.5897295, 0, 0, 0, 1, 1,
0.3005065, 1.361706, -1.44955, 0, 0, 0, 1, 1,
0.302116, -0.0008344872, 2.241123, 0, 0, 0, 1, 1,
0.3050575, -0.747103, 1.579642, 0, 0, 0, 1, 1,
0.3057632, 0.9663884, 2.057609, 1, 1, 1, 1, 1,
0.3059937, -0.02447679, 3.352503, 1, 1, 1, 1, 1,
0.3062254, 1.097521, 0.03316187, 1, 1, 1, 1, 1,
0.3062673, 0.3661317, 0.5049825, 1, 1, 1, 1, 1,
0.3073325, 1.414287, -0.1460299, 1, 1, 1, 1, 1,
0.315974, 0.5156564, 2.855785, 1, 1, 1, 1, 1,
0.3188636, -1.177258, 3.392999, 1, 1, 1, 1, 1,
0.319004, 0.9621418, 1.53838, 1, 1, 1, 1, 1,
0.3242723, 1.815353, 0.2816965, 1, 1, 1, 1, 1,
0.32626, 0.1379676, 2.441391, 1, 1, 1, 1, 1,
0.3265663, -1.823419, 1.65071, 1, 1, 1, 1, 1,
0.3344701, -1.034708, 2.717448, 1, 1, 1, 1, 1,
0.3527268, -1.161337, 3.191891, 1, 1, 1, 1, 1,
0.3540558, -1.849296, 3.449257, 1, 1, 1, 1, 1,
0.3560998, -0.5067776, 2.23245, 1, 1, 1, 1, 1,
0.3576157, 0.2831589, 0.9180529, 0, 0, 1, 1, 1,
0.360327, -1.019323, 1.120532, 1, 0, 0, 1, 1,
0.360363, -0.1876522, 3.235746, 1, 0, 0, 1, 1,
0.3610256, 0.7900794, -0.1111112, 1, 0, 0, 1, 1,
0.3625178, -0.359887, 3.442932, 1, 0, 0, 1, 1,
0.3669633, 1.49089, -0.2993796, 1, 0, 0, 1, 1,
0.3693604, -0.5970516, 2.153089, 0, 0, 0, 1, 1,
0.3747568, -0.5195886, 4.45826, 0, 0, 0, 1, 1,
0.3761597, 0.4598872, 0.550595, 0, 0, 0, 1, 1,
0.3777248, 1.36767, -1.051586, 0, 0, 0, 1, 1,
0.382796, -0.8426772, 2.459479, 0, 0, 0, 1, 1,
0.3837239, 0.1721943, 0.8250661, 0, 0, 0, 1, 1,
0.3858323, 1.375611, 1.377526, 0, 0, 0, 1, 1,
0.3859823, 1.07813, 0.6540065, 1, 1, 1, 1, 1,
0.3925188, 0.7665207, -1.356506, 1, 1, 1, 1, 1,
0.392705, -0.5878153, 3.213449, 1, 1, 1, 1, 1,
0.3934424, -0.8188757, 1.75633, 1, 1, 1, 1, 1,
0.3951269, 0.3950789, -1.295112, 1, 1, 1, 1, 1,
0.4034013, 0.5488291, 0.6519965, 1, 1, 1, 1, 1,
0.4124566, 1.114939, 0.4781643, 1, 1, 1, 1, 1,
0.4152059, -1.908675, 1.782116, 1, 1, 1, 1, 1,
0.4155396, 1.058605, 0.5223205, 1, 1, 1, 1, 1,
0.4159985, -0.06288978, 1.543941, 1, 1, 1, 1, 1,
0.4206413, -0.003744727, 3.448366, 1, 1, 1, 1, 1,
0.4220546, -1.855717, 3.644963, 1, 1, 1, 1, 1,
0.4243723, 0.4772385, 0.07350225, 1, 1, 1, 1, 1,
0.426931, 0.5791748, -0.4860504, 1, 1, 1, 1, 1,
0.4384744, -1.432586, 3.22021, 1, 1, 1, 1, 1,
0.4393774, 0.06053847, 0.7142125, 0, 0, 1, 1, 1,
0.4401866, 0.78922, 1.733575, 1, 0, 0, 1, 1,
0.4426059, -0.5072519, 2.385219, 1, 0, 0, 1, 1,
0.4452031, 0.312492, 2.543183, 1, 0, 0, 1, 1,
0.4452064, -0.4453677, 3.819314, 1, 0, 0, 1, 1,
0.4458392, -0.2985076, 2.731451, 1, 0, 0, 1, 1,
0.4470609, 0.2887988, 0.3769777, 0, 0, 0, 1, 1,
0.4495797, -0.07735592, 2.591879, 0, 0, 0, 1, 1,
0.4507364, 1.037983, -0.120625, 0, 0, 0, 1, 1,
0.4508664, -0.7272394, 2.42105, 0, 0, 0, 1, 1,
0.4519251, -1.031466, 2.908879, 0, 0, 0, 1, 1,
0.4565831, -0.3113729, 2.105092, 0, 0, 0, 1, 1,
0.4585084, -0.6724349, 2.506599, 0, 0, 0, 1, 1,
0.4617031, 0.4270892, 1.26818, 1, 1, 1, 1, 1,
0.4656994, 0.2659844, 2.817463, 1, 1, 1, 1, 1,
0.4692837, 0.4187017, -0.5518866, 1, 1, 1, 1, 1,
0.4704639, -1.103948, 2.655833, 1, 1, 1, 1, 1,
0.4724432, -1.190003, 3.51768, 1, 1, 1, 1, 1,
0.486258, 0.3080925, 2.145138, 1, 1, 1, 1, 1,
0.4985153, -1.391451, 1.637845, 1, 1, 1, 1, 1,
0.5039422, 1.26501, 1.381497, 1, 1, 1, 1, 1,
0.5060505, -0.6371497, 1.441707, 1, 1, 1, 1, 1,
0.5083371, -1.955428, 3.838649, 1, 1, 1, 1, 1,
0.5108538, 0.06646008, 1.855211, 1, 1, 1, 1, 1,
0.5115878, -1.490948, 0.948294, 1, 1, 1, 1, 1,
0.5118134, -0.899192, 4.327994, 1, 1, 1, 1, 1,
0.512979, 0.1018054, 0.8982776, 1, 1, 1, 1, 1,
0.5179157, 0.03663151, 1.834312, 1, 1, 1, 1, 1,
0.5179625, 1.108937, -0.7423066, 0, 0, 1, 1, 1,
0.5251528, -0.6485516, 2.007554, 1, 0, 0, 1, 1,
0.5253099, -0.1882223, 1.488294, 1, 0, 0, 1, 1,
0.531882, -1.219666, 2.471206, 1, 0, 0, 1, 1,
0.5320686, -0.1765562, 3.663196, 1, 0, 0, 1, 1,
0.5412673, 0.8827556, -0.07701872, 1, 0, 0, 1, 1,
0.5451885, 1.965754, 0.2352068, 0, 0, 0, 1, 1,
0.5457245, 0.4212297, 0.9270582, 0, 0, 0, 1, 1,
0.5482413, -1.184304, 2.828463, 0, 0, 0, 1, 1,
0.5523419, 2.099118, 0.7726135, 0, 0, 0, 1, 1,
0.5619987, -0.8020784, 1.734164, 0, 0, 0, 1, 1,
0.5654869, -0.3327948, 1.3092, 0, 0, 0, 1, 1,
0.5769494, 0.5048538, 1.742804, 0, 0, 0, 1, 1,
0.5810122, -1.587408, 3.271727, 1, 1, 1, 1, 1,
0.5835462, 0.8142625, 1.580855, 1, 1, 1, 1, 1,
0.5868382, 0.03353358, 1.273375, 1, 1, 1, 1, 1,
0.5878102, 0.7080392, 1.076587, 1, 1, 1, 1, 1,
0.5887951, 0.2008754, 0.5571842, 1, 1, 1, 1, 1,
0.5930454, 0.5084354, 1.068122, 1, 1, 1, 1, 1,
0.5937071, 0.3928211, -0.3069791, 1, 1, 1, 1, 1,
0.594712, -0.2022928, 3.631243, 1, 1, 1, 1, 1,
0.595537, 0.6826655, 1.29351, 1, 1, 1, 1, 1,
0.6011792, 0.2985098, 0.8365188, 1, 1, 1, 1, 1,
0.6012886, -0.251672, -0.1682746, 1, 1, 1, 1, 1,
0.6027965, -0.8611738, 1.234888, 1, 1, 1, 1, 1,
0.604552, 1.948225, 1.265547, 1, 1, 1, 1, 1,
0.6141016, 0.6814098, 2.825539, 1, 1, 1, 1, 1,
0.6146393, -0.2434393, 1.604549, 1, 1, 1, 1, 1,
0.6168106, -0.8344342, 1.132422, 0, 0, 1, 1, 1,
0.6180084, 0.07465961, 1.103011, 1, 0, 0, 1, 1,
0.6190769, 1.242772, 1.495617, 1, 0, 0, 1, 1,
0.6243582, -0.2051718, 1.822112, 1, 0, 0, 1, 1,
0.6265078, -0.4755341, 0.104884, 1, 0, 0, 1, 1,
0.626743, -0.2665242, 0.9249107, 1, 0, 0, 1, 1,
0.6289477, 1.468523, -0.3425265, 0, 0, 0, 1, 1,
0.6295097, 0.1090783, 2.639963, 0, 0, 0, 1, 1,
0.6422064, 0.2291656, 0.4964755, 0, 0, 0, 1, 1,
0.6479056, 0.07353277, 2.041254, 0, 0, 0, 1, 1,
0.6517415, 0.7047659, 1.330307, 0, 0, 0, 1, 1,
0.6538071, -0.1529962, 2.334089, 0, 0, 0, 1, 1,
0.6580381, -0.8490503, 2.670002, 0, 0, 0, 1, 1,
0.6620311, 0.9051783, 2.026237, 1, 1, 1, 1, 1,
0.6636829, 0.191744, 1.548534, 1, 1, 1, 1, 1,
0.664547, 1.053795, 0.3066668, 1, 1, 1, 1, 1,
0.6682422, 1.051137, -0.7368177, 1, 1, 1, 1, 1,
0.6699532, 0.3674991, 2.479467, 1, 1, 1, 1, 1,
0.670004, 0.7082737, 0.7414857, 1, 1, 1, 1, 1,
0.6738585, -0.600026, 2.9075, 1, 1, 1, 1, 1,
0.6753425, 0.7513077, 0.7618638, 1, 1, 1, 1, 1,
0.6782733, -0.06668596, 1.168749, 1, 1, 1, 1, 1,
0.6784664, -0.7632285, 3.882592, 1, 1, 1, 1, 1,
0.6861423, 0.8942457, 1.275183, 1, 1, 1, 1, 1,
0.6931447, 0.6774046, 0.7251218, 1, 1, 1, 1, 1,
0.6960176, -0.2547781, 1.369063, 1, 1, 1, 1, 1,
0.6981905, 0.8550133, 1.122634, 1, 1, 1, 1, 1,
0.6992705, -1.545939, 3.593492, 1, 1, 1, 1, 1,
0.7012297, -0.2155831, 1.105585, 0, 0, 1, 1, 1,
0.7049319, 0.2749409, 1.455485, 1, 0, 0, 1, 1,
0.7064008, -1.792209, 2.456352, 1, 0, 0, 1, 1,
0.7106873, 0.2070861, 0.2080745, 1, 0, 0, 1, 1,
0.7134302, 0.4556412, -1.009704, 1, 0, 0, 1, 1,
0.7136456, 0.6668021, 2.018815, 1, 0, 0, 1, 1,
0.7170576, -0.236033, 2.450251, 0, 0, 0, 1, 1,
0.7193702, 0.4606365, 1.038762, 0, 0, 0, 1, 1,
0.7266303, 0.9054249, 1.654076, 0, 0, 0, 1, 1,
0.7308214, 2.239084, 0.3377635, 0, 0, 0, 1, 1,
0.7328147, 0.6430098, 1.512815, 0, 0, 0, 1, 1,
0.7395735, 0.3516174, -0.4105552, 0, 0, 0, 1, 1,
0.7423908, -1.067641, 3.243057, 0, 0, 0, 1, 1,
0.743706, -0.7887745, 3.658253, 1, 1, 1, 1, 1,
0.7500057, 0.3651224, 3.596728, 1, 1, 1, 1, 1,
0.7517825, 1.249544, 2.685605, 1, 1, 1, 1, 1,
0.7528104, 0.162128, 0.09295666, 1, 1, 1, 1, 1,
0.7528518, 1.320419, 1.29403, 1, 1, 1, 1, 1,
0.7590999, -0.4074525, 2.659949, 1, 1, 1, 1, 1,
0.7619992, 0.5055174, 0.9753544, 1, 1, 1, 1, 1,
0.7647075, 0.7419473, -0.3463141, 1, 1, 1, 1, 1,
0.7690001, -0.3254885, 1.580951, 1, 1, 1, 1, 1,
0.7694896, -0.8171281, 3.004431, 1, 1, 1, 1, 1,
0.7698154, 0.05007881, -0.1926548, 1, 1, 1, 1, 1,
0.774227, -1.634089, 1.701517, 1, 1, 1, 1, 1,
0.7765521, -1.155343, 5.009594, 1, 1, 1, 1, 1,
0.7765747, -0.6908966, 3.49254, 1, 1, 1, 1, 1,
0.7820298, -1.458436, 3.92296, 1, 1, 1, 1, 1,
0.7943861, 0.1067866, 0.6580651, 0, 0, 1, 1, 1,
0.794467, 0.9350163, 1.325017, 1, 0, 0, 1, 1,
0.7963526, -2.145129, 3.588224, 1, 0, 0, 1, 1,
0.7999844, -0.1326158, 2.79163, 1, 0, 0, 1, 1,
0.8025558, -0.6234493, 1.64632, 1, 0, 0, 1, 1,
0.8026003, -0.2074458, 1.162978, 1, 0, 0, 1, 1,
0.8039337, 0.14496, 2.160178, 0, 0, 0, 1, 1,
0.8044087, -0.01821331, 2.900142, 0, 0, 0, 1, 1,
0.8044159, -0.3542544, 3.367347, 0, 0, 0, 1, 1,
0.8045436, 0.1323451, 2.186674, 0, 0, 0, 1, 1,
0.810331, 1.650091, 0.3140208, 0, 0, 0, 1, 1,
0.8142603, -0.07017241, 2.246866, 0, 0, 0, 1, 1,
0.8186133, 1.072737, -0.2801117, 0, 0, 0, 1, 1,
0.8216309, 1.390602, 0.9180801, 1, 1, 1, 1, 1,
0.8222362, -0.1755799, 3.9775, 1, 1, 1, 1, 1,
0.8235827, -0.6567718, 1.454526, 1, 1, 1, 1, 1,
0.8253654, 0.6460062, 0.2787304, 1, 1, 1, 1, 1,
0.8285099, -1.588935, 3.283434, 1, 1, 1, 1, 1,
0.8299257, -0.8364639, 0.8657722, 1, 1, 1, 1, 1,
0.8335522, -0.5315648, 2.436712, 1, 1, 1, 1, 1,
0.8349849, -2.122671, 3.589224, 1, 1, 1, 1, 1,
0.8395774, 0.3701473, 0.5660212, 1, 1, 1, 1, 1,
0.8403454, -0.9193262, 2.067471, 1, 1, 1, 1, 1,
0.8438088, 0.5206668, 0.5440782, 1, 1, 1, 1, 1,
0.8481248, -0.4512643, 0.5224042, 1, 1, 1, 1, 1,
0.8525593, -0.5546653, 1.247074, 1, 1, 1, 1, 1,
0.8531948, 0.808334, 0.4280772, 1, 1, 1, 1, 1,
0.8537576, 0.3029902, 2.844461, 1, 1, 1, 1, 1,
0.8549997, 1.145504, 1.774837, 0, 0, 1, 1, 1,
0.8589965, 0.9881357, 0.7179579, 1, 0, 0, 1, 1,
0.8592234, 1.48118, 0.4601369, 1, 0, 0, 1, 1,
0.859297, 0.05433114, 1.281998, 1, 0, 0, 1, 1,
0.8601941, 2.636545, 0.05582014, 1, 0, 0, 1, 1,
0.8643913, 0.6471542, 1.556887, 1, 0, 0, 1, 1,
0.8659627, 0.6945308, -0.3480494, 0, 0, 0, 1, 1,
0.8664863, 1.248829, -0.08149742, 0, 0, 0, 1, 1,
0.8722135, -0.3397536, 1.514495, 0, 0, 0, 1, 1,
0.8745547, -0.1027872, 0.6029468, 0, 0, 0, 1, 1,
0.8819318, -1.925144, 3.65005, 0, 0, 0, 1, 1,
0.8820164, -0.4161886, 2.115181, 0, 0, 0, 1, 1,
0.884991, 0.9766198, 1.217442, 0, 0, 0, 1, 1,
0.8903184, 0.6821305, 0.7052629, 1, 1, 1, 1, 1,
0.8927609, -1.63903, 2.841192, 1, 1, 1, 1, 1,
0.8981826, 0.05842197, 0.3205281, 1, 1, 1, 1, 1,
0.9018649, -1.123294, 2.452651, 1, 1, 1, 1, 1,
0.9035004, 1.46163, 1.287727, 1, 1, 1, 1, 1,
0.9042503, -2.385438, 3.590135, 1, 1, 1, 1, 1,
0.9042827, -0.3642144, 1.744206, 1, 1, 1, 1, 1,
0.9070765, -0.3637739, 3.427544, 1, 1, 1, 1, 1,
0.907356, 0.5252754, 1.819838, 1, 1, 1, 1, 1,
0.9141301, 0.5804265, 1.377376, 1, 1, 1, 1, 1,
0.9145267, -0.3637184, -0.6725329, 1, 1, 1, 1, 1,
0.9149204, 0.4748185, 1.965091, 1, 1, 1, 1, 1,
0.9181173, -0.4374514, 2.741648, 1, 1, 1, 1, 1,
0.9184426, -0.3908318, 1.785095, 1, 1, 1, 1, 1,
0.921047, -0.3476102, 2.362684, 1, 1, 1, 1, 1,
0.9230343, 0.2148343, 3.556613, 0, 0, 1, 1, 1,
0.9235541, 0.8203436, 0.7686931, 1, 0, 0, 1, 1,
0.932758, 0.932847, 2.4887, 1, 0, 0, 1, 1,
0.9405975, 0.3935316, 0.416993, 1, 0, 0, 1, 1,
0.9436749, 1.150338, 1.242924, 1, 0, 0, 1, 1,
0.946704, -0.8226463, 2.370644, 1, 0, 0, 1, 1,
0.9475056, -1.339871, 3.514696, 0, 0, 0, 1, 1,
0.9506136, 1.110317, 0.06934766, 0, 0, 0, 1, 1,
0.9595855, 0.7073506, 0.8748119, 0, 0, 0, 1, 1,
0.960254, -1.879899, 2.635849, 0, 0, 0, 1, 1,
0.9615272, -1.954184, 3.691059, 0, 0, 0, 1, 1,
0.9680629, -2.470188, 3.590309, 0, 0, 0, 1, 1,
0.9704473, -0.4701902, 0.6355374, 0, 0, 0, 1, 1,
0.9714693, 0.6531004, 0.6581215, 1, 1, 1, 1, 1,
0.9763575, 1.718853, 0.8221522, 1, 1, 1, 1, 1,
0.9794195, -2.175853, 1.709263, 1, 1, 1, 1, 1,
0.9799777, 0.1132884, 1.932567, 1, 1, 1, 1, 1,
0.9824826, 0.1165867, 1.883711, 1, 1, 1, 1, 1,
0.986686, -1.851813, 2.071226, 1, 1, 1, 1, 1,
0.9892237, 0.131407, 0.9229591, 1, 1, 1, 1, 1,
0.994595, -0.7106653, 2.453312, 1, 1, 1, 1, 1,
0.995921, -1.188585, 2.913826, 1, 1, 1, 1, 1,
0.9960184, 0.7461941, 0.2451208, 1, 1, 1, 1, 1,
0.9982674, -0.6881074, 0.9136078, 1, 1, 1, 1, 1,
1.008087, -0.9748175, 2.818608, 1, 1, 1, 1, 1,
1.012256, -1.338869, 1.85405, 1, 1, 1, 1, 1,
1.016937, 0.3093706, 2.306758, 1, 1, 1, 1, 1,
1.017639, 0.8457974, -0.807355, 1, 1, 1, 1, 1,
1.025964, -0.7214164, 2.970203, 0, 0, 1, 1, 1,
1.026499, 0.5261214, 0.2691559, 1, 0, 0, 1, 1,
1.029095, 0.8615895, 0.740102, 1, 0, 0, 1, 1,
1.036839, -0.7229224, 2.698022, 1, 0, 0, 1, 1,
1.040458, 0.4994248, 1.164722, 1, 0, 0, 1, 1,
1.044461, -1.207491, 1.117434, 1, 0, 0, 1, 1,
1.050551, 0.3543751, 1.931044, 0, 0, 0, 1, 1,
1.050882, 0.4482243, 0.4464009, 0, 0, 0, 1, 1,
1.054592, -0.4836047, 2.537257, 0, 0, 0, 1, 1,
1.069323, -0.5944461, 3.743724, 0, 0, 0, 1, 1,
1.07109, -0.9648249, 2.274691, 0, 0, 0, 1, 1,
1.079594, 0.5154148, 1.972326, 0, 0, 0, 1, 1,
1.083872, 0.1830939, 0.2189957, 0, 0, 0, 1, 1,
1.0928, 1.894733, -1.143567, 1, 1, 1, 1, 1,
1.111502, -1.315023, 2.066501, 1, 1, 1, 1, 1,
1.117332, -0.4089102, 2.988242, 1, 1, 1, 1, 1,
1.119223, -0.9367546, 3.603457, 1, 1, 1, 1, 1,
1.128253, 1.244619, 1.096334, 1, 1, 1, 1, 1,
1.141966, -0.270911, 3.119949, 1, 1, 1, 1, 1,
1.142157, -0.8214954, 1.832071, 1, 1, 1, 1, 1,
1.156046, -2.230454, 1.085455, 1, 1, 1, 1, 1,
1.15763, 0.505923, 1.056925, 1, 1, 1, 1, 1,
1.159433, -0.4025822, 1.368726, 1, 1, 1, 1, 1,
1.177619, -2.15515, 1.733727, 1, 1, 1, 1, 1,
1.179148, 0.05034703, 2.666668, 1, 1, 1, 1, 1,
1.180872, 0.4442161, -0.433791, 1, 1, 1, 1, 1,
1.181928, 0.913886, 0.811695, 1, 1, 1, 1, 1,
1.187641, -0.4287646, 0.1880414, 1, 1, 1, 1, 1,
1.195327, 1.119899, 0.1098116, 0, 0, 1, 1, 1,
1.198818, 0.07873201, 1.288932, 1, 0, 0, 1, 1,
1.20113, 0.3631231, -0.7768327, 1, 0, 0, 1, 1,
1.207731, -0.9404483, 1.663795, 1, 0, 0, 1, 1,
1.207765, -1.394374, 2.432419, 1, 0, 0, 1, 1,
1.209247, 0.7557307, 1.606586, 1, 0, 0, 1, 1,
1.223329, 0.4183107, 0.8171088, 0, 0, 0, 1, 1,
1.229932, -1.182076, 3.872606, 0, 0, 0, 1, 1,
1.232398, -0.5706978, 2.429176, 0, 0, 0, 1, 1,
1.234131, 1.002248, 1.283901, 0, 0, 0, 1, 1,
1.234807, 1.168097, -0.9428682, 0, 0, 0, 1, 1,
1.238016, 1.51368, -0.2020349, 0, 0, 0, 1, 1,
1.239482, 0.1663959, 0.627327, 0, 0, 0, 1, 1,
1.241542, 1.429901, 0.9086558, 1, 1, 1, 1, 1,
1.24749, -0.4194221, 2.603056, 1, 1, 1, 1, 1,
1.247867, -1.155187, 1.402858, 1, 1, 1, 1, 1,
1.251148, -0.03139707, 2.30658, 1, 1, 1, 1, 1,
1.258029, 0.3736055, 0.4848892, 1, 1, 1, 1, 1,
1.270877, -0.1615435, 0.4021622, 1, 1, 1, 1, 1,
1.272302, 0.490824, 0.703643, 1, 1, 1, 1, 1,
1.275768, -0.1448313, 1.582853, 1, 1, 1, 1, 1,
1.279016, 0.03264661, 0.5148025, 1, 1, 1, 1, 1,
1.310321, 1.797913, -0.02722545, 1, 1, 1, 1, 1,
1.312029, 0.540177, 2.451746, 1, 1, 1, 1, 1,
1.314495, 0.4631735, -0.1003633, 1, 1, 1, 1, 1,
1.323776, -0.1740475, 1.714199, 1, 1, 1, 1, 1,
1.325503, -0.6410817, 2.700781, 1, 1, 1, 1, 1,
1.333558, 1.162606, 2.019773, 1, 1, 1, 1, 1,
1.347309, -0.6426849, 2.998902, 0, 0, 1, 1, 1,
1.347648, 0.5286239, 1.568822, 1, 0, 0, 1, 1,
1.34907, 0.8735954, 0.6467987, 1, 0, 0, 1, 1,
1.350026, -0.5973537, 2.088017, 1, 0, 0, 1, 1,
1.350253, -1.266816, 2.337332, 1, 0, 0, 1, 1,
1.35502, 0.3754911, 0.8991038, 1, 0, 0, 1, 1,
1.366599, -0.8121672, 2.015343, 0, 0, 0, 1, 1,
1.382283, -0.8150265, 1.197704, 0, 0, 0, 1, 1,
1.384467, 0.3909401, 1.237006, 0, 0, 0, 1, 1,
1.386275, -0.3382797, 2.206641, 0, 0, 0, 1, 1,
1.389146, 1.221928, 0.5726314, 0, 0, 0, 1, 1,
1.389992, -1.2696, 2.382092, 0, 0, 0, 1, 1,
1.391578, 3.083718, 1.483294, 0, 0, 0, 1, 1,
1.395837, 0.3615945, 1.860817, 1, 1, 1, 1, 1,
1.403139, -1.388416, 3.467927, 1, 1, 1, 1, 1,
1.405177, -1.896243, 0.2798449, 1, 1, 1, 1, 1,
1.431647, -0.0968024, 1.836586, 1, 1, 1, 1, 1,
1.455745, -0.2974586, 2.995791, 1, 1, 1, 1, 1,
1.465259, 1.569633, 0.8753618, 1, 1, 1, 1, 1,
1.471855, -1.648629, 0.4366516, 1, 1, 1, 1, 1,
1.477124, 1.655939, 0.8594313, 1, 1, 1, 1, 1,
1.500386, 0.6235527, 0.3106827, 1, 1, 1, 1, 1,
1.507433, -0.1377524, 0.1154459, 1, 1, 1, 1, 1,
1.511741, -0.2575518, 2.156847, 1, 1, 1, 1, 1,
1.513102, -0.4318222, 0.9743168, 1, 1, 1, 1, 1,
1.516222, 0.5601092, 2.127951, 1, 1, 1, 1, 1,
1.526005, -0.356419, 2.270869, 1, 1, 1, 1, 1,
1.53519, 2.551648, 0.482913, 1, 1, 1, 1, 1,
1.539215, 0.752809, 1.908588, 0, 0, 1, 1, 1,
1.541149, -0.432727, 1.073593, 1, 0, 0, 1, 1,
1.542454, 1.07957, -0.1631705, 1, 0, 0, 1, 1,
1.544416, 1.513995, 1.19843, 1, 0, 0, 1, 1,
1.545855, -0.3575647, 2.099383, 1, 0, 0, 1, 1,
1.551435, 0.5725809, 1.288153, 1, 0, 0, 1, 1,
1.570658, -1.199095, 0.1795651, 0, 0, 0, 1, 1,
1.571501, -0.001077532, 1.260815, 0, 0, 0, 1, 1,
1.571884, 0.4965258, 0.8887423, 0, 0, 0, 1, 1,
1.592859, -0.09803626, 1.292951, 0, 0, 0, 1, 1,
1.607761, -0.4453957, 0.8529632, 0, 0, 0, 1, 1,
1.625737, -0.4432961, 1.450781, 0, 0, 0, 1, 1,
1.640981, 0.3614039, 2.292608, 0, 0, 0, 1, 1,
1.643468, -0.8979582, 0.6449317, 1, 1, 1, 1, 1,
1.661366, -0.419829, 3.559609, 1, 1, 1, 1, 1,
1.663034, -0.1965782, 1.770551, 1, 1, 1, 1, 1,
1.665582, 0.06733665, 1.613877, 1, 1, 1, 1, 1,
1.669699, 1.185738, 0.6966986, 1, 1, 1, 1, 1,
1.753, 0.3608881, 0.5155296, 1, 1, 1, 1, 1,
1.761691, -0.1403791, 2.047447, 1, 1, 1, 1, 1,
1.770434, 0.5337407, 1.739229, 1, 1, 1, 1, 1,
1.777109, 0.583475, 2.370466, 1, 1, 1, 1, 1,
1.781121, -0.9428067, 4.166904, 1, 1, 1, 1, 1,
1.787505, 0.4325309, 0.9663282, 1, 1, 1, 1, 1,
1.808807, 0.553706, 2.118793, 1, 1, 1, 1, 1,
1.817457, 0.1460402, 1.640473, 1, 1, 1, 1, 1,
1.822426, -0.7252437, 2.713174, 1, 1, 1, 1, 1,
1.824825, -0.1931731, 1.050844, 1, 1, 1, 1, 1,
1.831608, 0.07657789, 0.2785636, 0, 0, 1, 1, 1,
1.848785, 0.1147165, 0.07457858, 1, 0, 0, 1, 1,
1.851249, -0.7418745, 2.06455, 1, 0, 0, 1, 1,
1.851791, -0.788413, 1.625934, 1, 0, 0, 1, 1,
1.856004, 0.132632, 0.6615098, 1, 0, 0, 1, 1,
1.872117, 0.08559994, 2.961515, 1, 0, 0, 1, 1,
1.904013, -1.309815, 2.496914, 0, 0, 0, 1, 1,
1.908414, -0.08308139, 2.266654, 0, 0, 0, 1, 1,
1.910953, 1.803812, 1.69077, 0, 0, 0, 1, 1,
1.949505, -1.496089, 2.093832, 0, 0, 0, 1, 1,
1.952906, -0.9675673, 1.895304, 0, 0, 0, 1, 1,
1.965309, 0.9315021, 2.227136, 0, 0, 0, 1, 1,
1.968224, -1.862206, 2.385596, 0, 0, 0, 1, 1,
1.982639, 0.2679662, 0.4317922, 1, 1, 1, 1, 1,
2.003481, 1.539344, -0.2839019, 1, 1, 1, 1, 1,
2.00559, -1.269982, 1.004439, 1, 1, 1, 1, 1,
2.023777, -1.170894, 1.479404, 1, 1, 1, 1, 1,
2.052479, -0.2814127, 2.116335, 1, 1, 1, 1, 1,
2.053081, 0.2120862, 2.045955, 1, 1, 1, 1, 1,
2.063323, 0.8564438, 1.463326, 1, 1, 1, 1, 1,
2.083447, 1.890626, 0.7007121, 1, 1, 1, 1, 1,
2.100848, -0.2555075, 1.636431, 1, 1, 1, 1, 1,
2.101349, 0.8130043, 1.318295, 1, 1, 1, 1, 1,
2.101643, -1.770049, 2.212526, 1, 1, 1, 1, 1,
2.109804, -0.1349793, 1.027689, 1, 1, 1, 1, 1,
2.129898, -0.675805, 2.478183, 1, 1, 1, 1, 1,
2.138928, 1.44383, 1.097048, 1, 1, 1, 1, 1,
2.161729, -0.1803344, 3.108408, 1, 1, 1, 1, 1,
2.16851, -1.098011, 3.350511, 0, 0, 1, 1, 1,
2.203517, 0.6765572, 2.820122, 1, 0, 0, 1, 1,
2.228652, 1.359638, 2.37146, 1, 0, 0, 1, 1,
2.237486, 1.802834, 1.922036, 1, 0, 0, 1, 1,
2.264271, 0.6218169, 2.382241, 1, 0, 0, 1, 1,
2.267274, 0.604039, 2.785639, 1, 0, 0, 1, 1,
2.2764, -0.4990285, 0.8419914, 0, 0, 0, 1, 1,
2.278282, 0.1439757, 1.452055, 0, 0, 0, 1, 1,
2.28343, 1.169623, 0.9638226, 0, 0, 0, 1, 1,
2.325563, 0.4924838, 2.702259, 0, 0, 0, 1, 1,
2.367083, -0.3322496, 3.511833, 0, 0, 0, 1, 1,
2.402225, -0.2292253, 1.687168, 0, 0, 0, 1, 1,
2.452893, -0.3296141, 2.393895, 0, 0, 0, 1, 1,
2.53069, -0.311822, 0.4999982, 1, 1, 1, 1, 1,
2.695868, -1.763973, 3.684772, 1, 1, 1, 1, 1,
2.730007, -0.2097301, 1.502763, 1, 1, 1, 1, 1,
2.858191, 0.02089927, 1.795546, 1, 1, 1, 1, 1,
2.90919, 0.5019159, -0.1302745, 1, 1, 1, 1, 1,
2.923647, -0.09737317, 3.109089, 1, 1, 1, 1, 1,
2.975881, 0.2740957, 2.598106, 1, 1, 1, 1, 1
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
var radius = 9.465566;
var distance = 33.2474;
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
mvMatrix.translate( -0.1417042, -0.4184418, -0.1098371 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.2474);
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
