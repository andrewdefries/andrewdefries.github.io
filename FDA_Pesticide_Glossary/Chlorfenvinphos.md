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
-3.036655, -0.638266, 0.1463511, 1, 0, 0, 1,
-2.276598, -1.396509, -1.382512, 1, 0.007843138, 0, 1,
-2.232409, 1.617506, -0.09682374, 1, 0.01176471, 0, 1,
-2.20923, 1.309131, -1.169034, 1, 0.01960784, 0, 1,
-2.175002, 0.3665801, -1.008506, 1, 0.02352941, 0, 1,
-2.155905, 0.9337612, -2.096774, 1, 0.03137255, 0, 1,
-2.140732, 0.6524668, -2.770139, 1, 0.03529412, 0, 1,
-2.130005, -0.5953118, -1.0913, 1, 0.04313726, 0, 1,
-2.128854, -1.387303, -1.387079, 1, 0.04705882, 0, 1,
-2.107617, 1.069096, -1.611575, 1, 0.05490196, 0, 1,
-2.089971, 0.3628445, -0.7649062, 1, 0.05882353, 0, 1,
-2.052578, -0.3971595, -0.8178765, 1, 0.06666667, 0, 1,
-2.03892, 0.8450691, -2.086538, 1, 0.07058824, 0, 1,
-2.037807, -0.6709742, -0.8578322, 1, 0.07843138, 0, 1,
-2.030959, -0.8542761, -2.297049, 1, 0.08235294, 0, 1,
-2.027272, -1.092352, -1.638768, 1, 0.09019608, 0, 1,
-2.021246, -1.434502, 0.3617265, 1, 0.09411765, 0, 1,
-2.00873, 0.5824974, -0.2361563, 1, 0.1019608, 0, 1,
-2.008209, -0.3450501, -1.001062, 1, 0.1098039, 0, 1,
-2.00378, -1.326514, 0.1989712, 1, 0.1137255, 0, 1,
-1.987463, 0.0003881125, -1.945695, 1, 0.1215686, 0, 1,
-1.979364, 0.06779225, -0.4310588, 1, 0.1254902, 0, 1,
-1.976057, 0.8706651, 0.4521283, 1, 0.1333333, 0, 1,
-1.971077, -0.1474611, -0.6386514, 1, 0.1372549, 0, 1,
-1.919964, -0.4438669, -1.34649, 1, 0.145098, 0, 1,
-1.893248, -1.186509, -2.525146, 1, 0.1490196, 0, 1,
-1.892056, 0.9129642, -1.024758, 1, 0.1568628, 0, 1,
-1.833031, 0.5005814, -2.225812, 1, 0.1607843, 0, 1,
-1.830497, -0.9652255, -1.559302, 1, 0.1686275, 0, 1,
-1.786998, -1.873109, -1.682791, 1, 0.172549, 0, 1,
-1.775904, -1.925077, -0.9585409, 1, 0.1803922, 0, 1,
-1.767635, -1.546125, -2.34335, 1, 0.1843137, 0, 1,
-1.764796, 0.5208951, -2.090375, 1, 0.1921569, 0, 1,
-1.762832, -0.4081264, -2.12428, 1, 0.1960784, 0, 1,
-1.732018, -0.8761003, -2.644428, 1, 0.2039216, 0, 1,
-1.729242, 0.8799804, -0.3787808, 1, 0.2117647, 0, 1,
-1.719585, -0.1287552, -2.005632, 1, 0.2156863, 0, 1,
-1.714265, 0.3677857, -0.2401941, 1, 0.2235294, 0, 1,
-1.709984, -1.962584, -4.34683, 1, 0.227451, 0, 1,
-1.702653, 0.4420103, -2.078537, 1, 0.2352941, 0, 1,
-1.695809, -0.8631353, -2.397362, 1, 0.2392157, 0, 1,
-1.692128, 0.316995, -2.474139, 1, 0.2470588, 0, 1,
-1.686369, 0.5995487, 0.9866474, 1, 0.2509804, 0, 1,
-1.681779, 1.352426, 0.423287, 1, 0.2588235, 0, 1,
-1.677951, 1.316772, 0.6493, 1, 0.2627451, 0, 1,
-1.676373, -0.9700938, -2.105199, 1, 0.2705882, 0, 1,
-1.671917, 0.3616904, -0.9584808, 1, 0.2745098, 0, 1,
-1.665694, 1.192072, -0.3145798, 1, 0.282353, 0, 1,
-1.664894, -1.066873, -2.531922, 1, 0.2862745, 0, 1,
-1.6639, -1.344805, -2.115604, 1, 0.2941177, 0, 1,
-1.655084, 0.3496717, -1.742121, 1, 0.3019608, 0, 1,
-1.632148, 0.5358661, -1.464385, 1, 0.3058824, 0, 1,
-1.626512, -0.4229343, -1.668152, 1, 0.3137255, 0, 1,
-1.621641, 0.03679122, -1.549727, 1, 0.3176471, 0, 1,
-1.594971, -0.2281866, -0.7693875, 1, 0.3254902, 0, 1,
-1.593301, -0.536247, -2.909224, 1, 0.3294118, 0, 1,
-1.588855, 1.751439, -1.770597, 1, 0.3372549, 0, 1,
-1.587846, -0.6332439, -1.507942, 1, 0.3411765, 0, 1,
-1.58492, 1.177062, 0.5497811, 1, 0.3490196, 0, 1,
-1.58045, -0.4585644, -1.801923, 1, 0.3529412, 0, 1,
-1.571044, 1.48933, 0.3447739, 1, 0.3607843, 0, 1,
-1.55803, 1.706972, -0.546695, 1, 0.3647059, 0, 1,
-1.551163, -0.2872106, -0.8488063, 1, 0.372549, 0, 1,
-1.545731, 0.8910892, -0.6193892, 1, 0.3764706, 0, 1,
-1.53375, 0.4361778, -0.1748802, 1, 0.3843137, 0, 1,
-1.53338, 0.5314339, -1.211859, 1, 0.3882353, 0, 1,
-1.531494, 1.19061, -0.3028081, 1, 0.3960784, 0, 1,
-1.519262, -0.7162514, -1.372079, 1, 0.4039216, 0, 1,
-1.512597, 1.420402, -0.7736531, 1, 0.4078431, 0, 1,
-1.497876, 0.1320152, -2.109257, 1, 0.4156863, 0, 1,
-1.497189, 0.5801748, -1.570347, 1, 0.4196078, 0, 1,
-1.485627, 0.286863, -1.957697, 1, 0.427451, 0, 1,
-1.484545, 0.8671084, -1.062672, 1, 0.4313726, 0, 1,
-1.476269, -1.010836, -1.159242, 1, 0.4392157, 0, 1,
-1.469423, 0.213047, -1.3085, 1, 0.4431373, 0, 1,
-1.455956, -2.110413, -1.467669, 1, 0.4509804, 0, 1,
-1.448261, -0.09361159, -1.155538, 1, 0.454902, 0, 1,
-1.44638, -2.031435, -0.178881, 1, 0.4627451, 0, 1,
-1.439839, -0.01144245, -1.549925, 1, 0.4666667, 0, 1,
-1.436749, -0.1696202, -3.119375, 1, 0.4745098, 0, 1,
-1.436072, -0.01734686, -2.453811, 1, 0.4784314, 0, 1,
-1.435295, 0.2777819, -0.329282, 1, 0.4862745, 0, 1,
-1.426556, 0.5525688, -0.7663928, 1, 0.4901961, 0, 1,
-1.417504, 0.0005783185, -2.531646, 1, 0.4980392, 0, 1,
-1.415553, -1.098163, -2.266201, 1, 0.5058824, 0, 1,
-1.410831, 2.306214, -1.256743, 1, 0.509804, 0, 1,
-1.410337, 0.8021224, -1.757573, 1, 0.5176471, 0, 1,
-1.404428, -0.006679508, -1.449219, 1, 0.5215687, 0, 1,
-1.401672, -0.2309055, -3.332114, 1, 0.5294118, 0, 1,
-1.397435, 0.7694734, 0.7334172, 1, 0.5333334, 0, 1,
-1.379129, -0.2116728, -1.568084, 1, 0.5411765, 0, 1,
-1.375657, 1.089673, -1.0316, 1, 0.5450981, 0, 1,
-1.361852, 0.5344536, -0.5640011, 1, 0.5529412, 0, 1,
-1.361171, -0.9625853, -3.725363, 1, 0.5568628, 0, 1,
-1.359028, 0.2059409, -0.06979514, 1, 0.5647059, 0, 1,
-1.341173, -1.172991, -3.357596, 1, 0.5686275, 0, 1,
-1.338762, 0.4512394, -3.334026, 1, 0.5764706, 0, 1,
-1.336134, 0.9466156, -0.09603886, 1, 0.5803922, 0, 1,
-1.333476, -0.2907506, -2.156137, 1, 0.5882353, 0, 1,
-1.326043, -0.4351598, -2.139426, 1, 0.5921569, 0, 1,
-1.325513, -1.27491, -2.372054, 1, 0.6, 0, 1,
-1.316566, -0.7493777, -2.807912, 1, 0.6078432, 0, 1,
-1.300477, 0.5151062, -1.009202, 1, 0.6117647, 0, 1,
-1.290574, -1.058407, -2.568822, 1, 0.6196079, 0, 1,
-1.288834, -1.982892, -2.273654, 1, 0.6235294, 0, 1,
-1.281276, -0.3758254, -1.754518, 1, 0.6313726, 0, 1,
-1.277573, 0.1564829, -0.9240122, 1, 0.6352941, 0, 1,
-1.270686, -0.0116134, -0.8971209, 1, 0.6431373, 0, 1,
-1.268445, 1.940059, -0.3999711, 1, 0.6470588, 0, 1,
-1.25686, -0.2789838, -1.708641, 1, 0.654902, 0, 1,
-1.248372, 2.530411, -1.852534, 1, 0.6588235, 0, 1,
-1.247238, -1.226518, -3.871453, 1, 0.6666667, 0, 1,
-1.246235, 1.160127, -0.4619165, 1, 0.6705883, 0, 1,
-1.220381, -0.1212625, -2.418205, 1, 0.6784314, 0, 1,
-1.215171, -0.8809576, 0.2282469, 1, 0.682353, 0, 1,
-1.211805, -1.514324, -3.197936, 1, 0.6901961, 0, 1,
-1.210701, -0.7856841, -2.49061, 1, 0.6941177, 0, 1,
-1.210401, -1.212594, -2.813598, 1, 0.7019608, 0, 1,
-1.207033, -0.7800259, -0.8436494, 1, 0.7098039, 0, 1,
-1.179754, 0.5883806, -0.9351885, 1, 0.7137255, 0, 1,
-1.16881, 0.4633945, -1.746529, 1, 0.7215686, 0, 1,
-1.166198, -1.288235, -3.507695, 1, 0.7254902, 0, 1,
-1.162057, -0.81522, -3.172362, 1, 0.7333333, 0, 1,
-1.158378, 0.7543449, -1.433108, 1, 0.7372549, 0, 1,
-1.152869, 0.7966047, -0.6872315, 1, 0.7450981, 0, 1,
-1.146652, 0.5599024, 0.860245, 1, 0.7490196, 0, 1,
-1.139009, -0.7485751, -1.473011, 1, 0.7568628, 0, 1,
-1.138819, 0.911518, -1.09758, 1, 0.7607843, 0, 1,
-1.133871, 0.1537915, -0.4764127, 1, 0.7686275, 0, 1,
-1.130334, 0.1708264, -1.597478, 1, 0.772549, 0, 1,
-1.113217, -1.324525, -1.876269, 1, 0.7803922, 0, 1,
-1.109576, 0.9470114, 0.7125526, 1, 0.7843137, 0, 1,
-1.109183, 0.2233581, -0.8428982, 1, 0.7921569, 0, 1,
-1.108243, -0.5272296, -2.386796, 1, 0.7960784, 0, 1,
-1.107959, -0.4169785, -0.6820208, 1, 0.8039216, 0, 1,
-1.101461, -0.06978683, -1.050693, 1, 0.8117647, 0, 1,
-1.100554, 0.8782946, -1.595393, 1, 0.8156863, 0, 1,
-1.091163, 2.403567, 0.510225, 1, 0.8235294, 0, 1,
-1.090454, 0.2536918, -1.456026, 1, 0.827451, 0, 1,
-1.080236, -0.8029699, -2.721439, 1, 0.8352941, 0, 1,
-1.074509, -0.2100847, -2.231932, 1, 0.8392157, 0, 1,
-1.0707, -1.318529, -1.391731, 1, 0.8470588, 0, 1,
-1.068244, 1.615, -3.186296, 1, 0.8509804, 0, 1,
-1.06524, 0.6405029, -1.475986, 1, 0.8588235, 0, 1,
-1.064826, 0.792709, -0.3011568, 1, 0.8627451, 0, 1,
-1.063269, 0.1665659, -1.373182, 1, 0.8705882, 0, 1,
-1.06008, 1.458147, -0.8018491, 1, 0.8745098, 0, 1,
-1.058819, -0.2636048, -0.2580394, 1, 0.8823529, 0, 1,
-1.058754, 0.5800207, 0.634598, 1, 0.8862745, 0, 1,
-1.05604, -1.703282, -0.3698978, 1, 0.8941177, 0, 1,
-1.049668, -0.8226962, -4.799622, 1, 0.8980392, 0, 1,
-1.044016, 1.166209, 0.04997088, 1, 0.9058824, 0, 1,
-1.037313, 0.9643723, -0.6939076, 1, 0.9137255, 0, 1,
-1.007963, -1.042142, -1.841063, 1, 0.9176471, 0, 1,
-1.004414, 1.501746, 0.1565094, 1, 0.9254902, 0, 1,
-1.004306, 1.403826, -0.5196738, 1, 0.9294118, 0, 1,
-0.9992214, 1.066163, -1.76512, 1, 0.9372549, 0, 1,
-0.9976232, -1.288775, -3.006368, 1, 0.9411765, 0, 1,
-0.9960228, 0.2901251, -0.9672845, 1, 0.9490196, 0, 1,
-0.9929236, 0.776456, 0.637836, 1, 0.9529412, 0, 1,
-0.9850829, -0.6746169, -2.677973, 1, 0.9607843, 0, 1,
-0.9796091, -0.4068632, -1.662401, 1, 0.9647059, 0, 1,
-0.9702536, -0.1441082, -2.648181, 1, 0.972549, 0, 1,
-0.9655165, -0.8119941, -2.267848, 1, 0.9764706, 0, 1,
-0.9648796, 0.05193008, -1.755351, 1, 0.9843137, 0, 1,
-0.9569584, 0.1160184, -1.760322, 1, 0.9882353, 0, 1,
-0.9535935, 0.5851556, -1.682028, 1, 0.9960784, 0, 1,
-0.9478785, 0.362469, -3.391289, 0.9960784, 1, 0, 1,
-0.9439056, 0.02175169, -2.013673, 0.9921569, 1, 0, 1,
-0.9389334, 0.6235634, -1.74605, 0.9843137, 1, 0, 1,
-0.9236206, 0.3477848, -1.400211, 0.9803922, 1, 0, 1,
-0.9231652, -0.2491438, -3.127298, 0.972549, 1, 0, 1,
-0.9223654, -1.272157, -3.103899, 0.9686275, 1, 0, 1,
-0.9214086, 0.6236874, 0.5344719, 0.9607843, 1, 0, 1,
-0.9158983, 1.36581, -0.4584834, 0.9568627, 1, 0, 1,
-0.9141145, -1.131585, -4.349047, 0.9490196, 1, 0, 1,
-0.9073936, 0.143395, -1.794589, 0.945098, 1, 0, 1,
-0.9043413, 1.155925, -1.461188, 0.9372549, 1, 0, 1,
-0.9011866, 2.025674, -2.083645, 0.9333333, 1, 0, 1,
-0.9009731, -1.401484, -2.269719, 0.9254902, 1, 0, 1,
-0.8959791, -1.147727, -3.63356, 0.9215686, 1, 0, 1,
-0.8921047, -1.436853, -0.6664931, 0.9137255, 1, 0, 1,
-0.886876, -0.5290712, -3.904013, 0.9098039, 1, 0, 1,
-0.8860313, 0.1693521, -2.495812, 0.9019608, 1, 0, 1,
-0.8843989, -1.499661, -2.144687, 0.8941177, 1, 0, 1,
-0.8840007, 1.575088, -1.549232, 0.8901961, 1, 0, 1,
-0.8825989, 0.731139, -2.505202, 0.8823529, 1, 0, 1,
-0.8805023, 0.06370166, -3.608068, 0.8784314, 1, 0, 1,
-0.8751863, -0.628025, -0.6085303, 0.8705882, 1, 0, 1,
-0.8751261, -0.0002773809, -0.7720835, 0.8666667, 1, 0, 1,
-0.8699969, 1.677953, -0.9255052, 0.8588235, 1, 0, 1,
-0.8658243, -0.1953744, -2.018368, 0.854902, 1, 0, 1,
-0.8609197, -1.326028, -2.467177, 0.8470588, 1, 0, 1,
-0.8548896, 0.6619877, 0.598971, 0.8431373, 1, 0, 1,
-0.8531763, 0.1475051, -0.2087814, 0.8352941, 1, 0, 1,
-0.8516669, -0.9356741, -3.168018, 0.8313726, 1, 0, 1,
-0.850227, -0.9459277, -1.741226, 0.8235294, 1, 0, 1,
-0.845093, -0.6637398, -4.090076, 0.8196079, 1, 0, 1,
-0.8420338, -0.935858, -3.460802, 0.8117647, 1, 0, 1,
-0.8418552, 0.6916682, -1.849625, 0.8078431, 1, 0, 1,
-0.8357242, 1.589067, -1.817323, 0.8, 1, 0, 1,
-0.8334165, 1.287497, -0.5006511, 0.7921569, 1, 0, 1,
-0.8265867, -1.344608, -2.187955, 0.7882353, 1, 0, 1,
-0.8240895, 1.866375, 0.7486621, 0.7803922, 1, 0, 1,
-0.8199863, 1.561565, -1.019119, 0.7764706, 1, 0, 1,
-0.8180832, -0.9753869, -0.8471844, 0.7686275, 1, 0, 1,
-0.8117353, 0.6179025, -0.2339347, 0.7647059, 1, 0, 1,
-0.8074728, 0.01195105, -1.321085, 0.7568628, 1, 0, 1,
-0.8060333, -0.0610364, 0.008645767, 0.7529412, 1, 0, 1,
-0.8042426, -0.8714861, -0.08339965, 0.7450981, 1, 0, 1,
-0.804176, 1.916413, -0.9702439, 0.7411765, 1, 0, 1,
-0.7984433, 0.1172588, -2.771457, 0.7333333, 1, 0, 1,
-0.7894343, -0.9522961, -1.612594, 0.7294118, 1, 0, 1,
-0.7867659, 0.2048443, -1.03218, 0.7215686, 1, 0, 1,
-0.7867296, 2.051825, -0.9373868, 0.7176471, 1, 0, 1,
-0.7853425, 0.9052761, -0.8704312, 0.7098039, 1, 0, 1,
-0.7838898, 0.166642, -1.819843, 0.7058824, 1, 0, 1,
-0.7760556, 1.964627, -1.946492, 0.6980392, 1, 0, 1,
-0.7699106, 0.292471, -1.745995, 0.6901961, 1, 0, 1,
-0.7632706, 1.906788, 0.2769141, 0.6862745, 1, 0, 1,
-0.7605538, -1.10983, -3.687678, 0.6784314, 1, 0, 1,
-0.7538283, 0.3089642, -1.024975, 0.6745098, 1, 0, 1,
-0.7514607, 0.06867057, -0.6737514, 0.6666667, 1, 0, 1,
-0.7424476, 0.4641404, 0.08785692, 0.6627451, 1, 0, 1,
-0.7373772, -0.2885475, -1.288089, 0.654902, 1, 0, 1,
-0.7355072, -1.485223, -2.376055, 0.6509804, 1, 0, 1,
-0.7275696, -0.6391295, -3.236545, 0.6431373, 1, 0, 1,
-0.7250625, -0.2315767, -4.016047, 0.6392157, 1, 0, 1,
-0.7211074, -1.457178, -1.335854, 0.6313726, 1, 0, 1,
-0.7177538, -0.6179494, -2.485508, 0.627451, 1, 0, 1,
-0.7154863, 0.9148319, -1.896348, 0.6196079, 1, 0, 1,
-0.7149633, -0.04740054, -1.332947, 0.6156863, 1, 0, 1,
-0.7108741, 1.184454, -1.074545, 0.6078432, 1, 0, 1,
-0.7069167, -0.1233421, -1.735383, 0.6039216, 1, 0, 1,
-0.705609, -0.5990388, -1.856464, 0.5960785, 1, 0, 1,
-0.7037542, 0.279094, -0.4557762, 0.5882353, 1, 0, 1,
-0.7022473, -1.885684, -2.401561, 0.5843138, 1, 0, 1,
-0.7008696, 0.08464436, -2.15286, 0.5764706, 1, 0, 1,
-0.7003543, -0.3607352, -1.792377, 0.572549, 1, 0, 1,
-0.6915661, -0.3761291, -2.954621, 0.5647059, 1, 0, 1,
-0.6858754, 0.480533, -1.428709, 0.5607843, 1, 0, 1,
-0.6768871, -0.2859513, -0.9960093, 0.5529412, 1, 0, 1,
-0.6742745, 1.053187, -2.550646, 0.5490196, 1, 0, 1,
-0.6737274, 1.950627, 0.2390373, 0.5411765, 1, 0, 1,
-0.6640639, 1.170963, 0.34694, 0.5372549, 1, 0, 1,
-0.6591648, -0.02209736, -1.879774, 0.5294118, 1, 0, 1,
-0.6588399, 0.1797889, -1.287274, 0.5254902, 1, 0, 1,
-0.6545449, -0.6179408, -4.292093, 0.5176471, 1, 0, 1,
-0.65097, -0.9210123, -3.160805, 0.5137255, 1, 0, 1,
-0.6501818, 1.866249, -2.335739, 0.5058824, 1, 0, 1,
-0.6489416, 0.2468321, -1.150614, 0.5019608, 1, 0, 1,
-0.6479517, -0.05340873, -1.594072, 0.4941176, 1, 0, 1,
-0.645384, -0.04027789, -1.667354, 0.4862745, 1, 0, 1,
-0.6453073, 0.3277954, -2.248764, 0.4823529, 1, 0, 1,
-0.6446533, 0.6214176, -0.6663227, 0.4745098, 1, 0, 1,
-0.6398672, -1.214351, -1.963456, 0.4705882, 1, 0, 1,
-0.6385289, -0.1314865, -1.762122, 0.4627451, 1, 0, 1,
-0.6370925, 0.611859, -2.52029, 0.4588235, 1, 0, 1,
-0.6370069, -2.219122, -2.771013, 0.4509804, 1, 0, 1,
-0.6325806, 0.3092578, 0.5904891, 0.4470588, 1, 0, 1,
-0.6311369, -0.3869286, -2.716661, 0.4392157, 1, 0, 1,
-0.6274269, 0.2381394, -2.201912, 0.4352941, 1, 0, 1,
-0.6233011, -0.7094152, -2.813854, 0.427451, 1, 0, 1,
-0.6221942, -1.150904, -3.208054, 0.4235294, 1, 0, 1,
-0.6166922, -0.6906051, -0.5814173, 0.4156863, 1, 0, 1,
-0.6117249, -0.132937, -1.408306, 0.4117647, 1, 0, 1,
-0.6036675, -2.169296, -3.437052, 0.4039216, 1, 0, 1,
-0.6029096, 0.7619026, -0.3902856, 0.3960784, 1, 0, 1,
-0.6028807, -0.9829105, -2.760462, 0.3921569, 1, 0, 1,
-0.5939884, -0.02056759, -0.747484, 0.3843137, 1, 0, 1,
-0.5933691, -0.2367174, -1.087767, 0.3803922, 1, 0, 1,
-0.5885819, -1.398971, -3.534873, 0.372549, 1, 0, 1,
-0.5879694, 0.4314156, -0.8733636, 0.3686275, 1, 0, 1,
-0.5820546, 0.3974641, -0.9279586, 0.3607843, 1, 0, 1,
-0.5754457, 0.02493108, -0.6772094, 0.3568628, 1, 0, 1,
-0.5752509, -0.3235859, -3.091707, 0.3490196, 1, 0, 1,
-0.5725501, -0.8272068, -4.186001, 0.345098, 1, 0, 1,
-0.5694302, -0.909685, -1.525641, 0.3372549, 1, 0, 1,
-0.5671515, 1.276138, -1.457529, 0.3333333, 1, 0, 1,
-0.5658599, 1.166348, 0.7055352, 0.3254902, 1, 0, 1,
-0.5636538, 1.331811, -2.112543, 0.3215686, 1, 0, 1,
-0.5496695, 1.565309, -0.4224748, 0.3137255, 1, 0, 1,
-0.5429813, -1.018775, -4.449161, 0.3098039, 1, 0, 1,
-0.5425107, 0.345571, 1.237282, 0.3019608, 1, 0, 1,
-0.5340678, -0.2989237, -2.315612, 0.2941177, 1, 0, 1,
-0.5286754, 0.7302298, -0.713914, 0.2901961, 1, 0, 1,
-0.5276433, -0.6777961, -2.530946, 0.282353, 1, 0, 1,
-0.5176489, -0.7509691, -2.161417, 0.2784314, 1, 0, 1,
-0.5158672, 0.0422451, -1.863085, 0.2705882, 1, 0, 1,
-0.5095544, 1.057915, 0.7658659, 0.2666667, 1, 0, 1,
-0.5092772, -0.5920245, -2.79319, 0.2588235, 1, 0, 1,
-0.5088292, -0.4422828, -3.234818, 0.254902, 1, 0, 1,
-0.5045196, -0.191043, -1.935186, 0.2470588, 1, 0, 1,
-0.4923037, 1.149828, -0.3271039, 0.2431373, 1, 0, 1,
-0.4874227, 0.8018416, 0.4197205, 0.2352941, 1, 0, 1,
-0.4860221, -1.412165, -4.046272, 0.2313726, 1, 0, 1,
-0.4832181, 0.3758319, -0.5349841, 0.2235294, 1, 0, 1,
-0.482068, 0.5823315, -1.23563, 0.2196078, 1, 0, 1,
-0.4815922, 0.7161843, 0.5671271, 0.2117647, 1, 0, 1,
-0.4801277, -0.8564631, -3.453668, 0.2078431, 1, 0, 1,
-0.4777281, 0.4811455, -0.7204285, 0.2, 1, 0, 1,
-0.4721967, -1.568973, -3.605383, 0.1921569, 1, 0, 1,
-0.4678347, 1.134172, -0.6694742, 0.1882353, 1, 0, 1,
-0.4669023, 0.1701802, -2.409165, 0.1803922, 1, 0, 1,
-0.4664346, 0.1643909, -0.5604201, 0.1764706, 1, 0, 1,
-0.4659081, 0.5391099, -2.032764, 0.1686275, 1, 0, 1,
-0.4645227, -1.076219, -3.203773, 0.1647059, 1, 0, 1,
-0.463398, 0.8398697, -0.0861263, 0.1568628, 1, 0, 1,
-0.4608441, -0.4035548, -2.925534, 0.1529412, 1, 0, 1,
-0.4591542, -0.9292218, -3.80945, 0.145098, 1, 0, 1,
-0.4574924, 0.7621938, -0.2769465, 0.1411765, 1, 0, 1,
-0.4541648, 0.2032416, -0.5914908, 0.1333333, 1, 0, 1,
-0.4515674, -1.116003, -2.241424, 0.1294118, 1, 0, 1,
-0.4511774, -1.01516, -1.911081, 0.1215686, 1, 0, 1,
-0.4489351, -0.3500326, -2.791642, 0.1176471, 1, 0, 1,
-0.4411107, 0.2275225, -2.347378, 0.1098039, 1, 0, 1,
-0.4397397, -0.7105323, -3.766871, 0.1058824, 1, 0, 1,
-0.4390983, -0.8894036, -0.01359244, 0.09803922, 1, 0, 1,
-0.4390539, -0.1336594, -2.931367, 0.09019608, 1, 0, 1,
-0.43894, -0.4536544, -2.009142, 0.08627451, 1, 0, 1,
-0.4372598, 0.2201644, -2.026518, 0.07843138, 1, 0, 1,
-0.436505, -1.193956, -5.159101, 0.07450981, 1, 0, 1,
-0.4330285, -1.084222, -3.135315, 0.06666667, 1, 0, 1,
-0.4243873, -0.03199005, -0.9564416, 0.0627451, 1, 0, 1,
-0.4215046, 0.6297275, -1.558222, 0.05490196, 1, 0, 1,
-0.4213995, -1.259176, -2.46796, 0.05098039, 1, 0, 1,
-0.4154102, -0.9296286, -0.159279, 0.04313726, 1, 0, 1,
-0.4085944, 1.023708, -1.414585, 0.03921569, 1, 0, 1,
-0.4058481, 2.985787, -0.2576225, 0.03137255, 1, 0, 1,
-0.4035888, 0.3547475, -0.5542498, 0.02745098, 1, 0, 1,
-0.402609, -0.2072061, -1.292389, 0.01960784, 1, 0, 1,
-0.3984107, -2.780583, -3.271776, 0.01568628, 1, 0, 1,
-0.3949417, -1.10887, -3.315891, 0.007843138, 1, 0, 1,
-0.3880275, -3.482317, -0.8208083, 0.003921569, 1, 0, 1,
-0.3850644, -1.101658, -1.825843, 0, 1, 0.003921569, 1,
-0.3789243, 0.4152538, -2.486661, 0, 1, 0.01176471, 1,
-0.3739242, 0.7054103, -1.794968, 0, 1, 0.01568628, 1,
-0.372223, 0.5355844, 1.33941, 0, 1, 0.02352941, 1,
-0.3694025, 1.508092, -0.2547337, 0, 1, 0.02745098, 1,
-0.3663426, 0.8438153, 0.2335075, 0, 1, 0.03529412, 1,
-0.3623743, 0.03183271, 0.005408747, 0, 1, 0.03921569, 1,
-0.3618119, 0.2819316, 0.2367031, 0, 1, 0.04705882, 1,
-0.36054, 0.5675133, 0.1004381, 0, 1, 0.05098039, 1,
-0.3603272, -1.662549, -3.81499, 0, 1, 0.05882353, 1,
-0.3573434, 1.065447, -0.27863, 0, 1, 0.0627451, 1,
-0.3562418, 0.4122139, -3.345624, 0, 1, 0.07058824, 1,
-0.3553873, -0.0740949, 0.221848, 0, 1, 0.07450981, 1,
-0.3524564, 1.233751, -0.5259284, 0, 1, 0.08235294, 1,
-0.3521796, -0.4461318, -2.916416, 0, 1, 0.08627451, 1,
-0.351742, -0.5577796, -0.9614927, 0, 1, 0.09411765, 1,
-0.3478366, 0.3326337, -0.8633841, 0, 1, 0.1019608, 1,
-0.3429404, 0.3490799, -0.9585595, 0, 1, 0.1058824, 1,
-0.3417142, -0.3583306, -1.281193, 0, 1, 0.1137255, 1,
-0.3391185, 2.160221, 0.5715579, 0, 1, 0.1176471, 1,
-0.3367563, -0.9975663, -2.861633, 0, 1, 0.1254902, 1,
-0.3363912, -1.003933, -1.251017, 0, 1, 0.1294118, 1,
-0.3363689, 0.3221611, -0.09553993, 0, 1, 0.1372549, 1,
-0.3322275, 0.1435311, -1.687011, 0, 1, 0.1411765, 1,
-0.3308671, -2.281976, -2.823122, 0, 1, 0.1490196, 1,
-0.3282305, -0.1071368, -2.679403, 0, 1, 0.1529412, 1,
-0.3257894, -0.1685164, -1.028832, 0, 1, 0.1607843, 1,
-0.3221133, 0.2173586, -1.234618, 0, 1, 0.1647059, 1,
-0.3220418, -0.3570149, -3.491345, 0, 1, 0.172549, 1,
-0.3206322, 1.004295, 2.009031, 0, 1, 0.1764706, 1,
-0.3163334, -0.4723946, -2.900435, 0, 1, 0.1843137, 1,
-0.3145351, -0.003146701, -2.506574, 0, 1, 0.1882353, 1,
-0.3059877, -1.466242, -3.489645, 0, 1, 0.1960784, 1,
-0.3041753, -0.4374537, -2.429435, 0, 1, 0.2039216, 1,
-0.3027986, 0.1759803, -0.9526314, 0, 1, 0.2078431, 1,
-0.2899825, -0.004779011, -1.624083, 0, 1, 0.2156863, 1,
-0.2835767, -0.5759915, -3.260886, 0, 1, 0.2196078, 1,
-0.282765, 1.451034, -1.134634, 0, 1, 0.227451, 1,
-0.2811837, 2.400002, -0.4241147, 0, 1, 0.2313726, 1,
-0.2791926, 0.959996, 1.183054, 0, 1, 0.2392157, 1,
-0.2744172, 0.2659751, -1.406324, 0, 1, 0.2431373, 1,
-0.2729394, 0.5928727, -0.4507618, 0, 1, 0.2509804, 1,
-0.2644676, 0.2084011, 0.2894786, 0, 1, 0.254902, 1,
-0.2636096, -0.06124686, -0.5820312, 0, 1, 0.2627451, 1,
-0.2628345, -1.557316, -2.927989, 0, 1, 0.2666667, 1,
-0.2508826, 1.424563, -0.570461, 0, 1, 0.2745098, 1,
-0.2505518, 0.07045355, -1.831245, 0, 1, 0.2784314, 1,
-0.2504748, 2.254341, 0.6467432, 0, 1, 0.2862745, 1,
-0.2494734, -1.030832, -2.323251, 0, 1, 0.2901961, 1,
-0.2487369, -0.2026384, -3.604293, 0, 1, 0.2980392, 1,
-0.2487224, 0.8481908, 0.03337567, 0, 1, 0.3058824, 1,
-0.2483518, -0.5849708, -1.407101, 0, 1, 0.3098039, 1,
-0.2444038, -0.02099255, -1.966892, 0, 1, 0.3176471, 1,
-0.2419868, -0.6700098, -3.934887, 0, 1, 0.3215686, 1,
-0.2413117, -0.7809093, -3.397063, 0, 1, 0.3294118, 1,
-0.2381445, 0.1389555, -3.072801, 0, 1, 0.3333333, 1,
-0.2371234, 0.7337197, 1.139683, 0, 1, 0.3411765, 1,
-0.2368345, -0.2157563, -3.458766, 0, 1, 0.345098, 1,
-0.232949, -0.1073323, -0.6248451, 0, 1, 0.3529412, 1,
-0.2319429, 1.352369, 1.133328, 0, 1, 0.3568628, 1,
-0.2280213, -0.1359871, -2.681099, 0, 1, 0.3647059, 1,
-0.2263087, 0.7553175, -0.308116, 0, 1, 0.3686275, 1,
-0.2235247, 0.3159552, 0.0573026, 0, 1, 0.3764706, 1,
-0.220951, -1.254648, -3.087044, 0, 1, 0.3803922, 1,
-0.2171572, 1.25937, 0.3242148, 0, 1, 0.3882353, 1,
-0.2141071, 0.6489698, 0.5003044, 0, 1, 0.3921569, 1,
-0.2106279, 0.6309718, -1.203807, 0, 1, 0.4, 1,
-0.2094443, -0.8421755, -2.602774, 0, 1, 0.4078431, 1,
-0.2080137, -0.4203164, -1.759224, 0, 1, 0.4117647, 1,
-0.2072484, -0.7917374, -3.873586, 0, 1, 0.4196078, 1,
-0.204846, -0.3317441, -2.556279, 0, 1, 0.4235294, 1,
-0.202244, 0.6318264, -0.8546324, 0, 1, 0.4313726, 1,
-0.201487, -1.693739, -2.858089, 0, 1, 0.4352941, 1,
-0.2013789, -0.695657, -2.8735, 0, 1, 0.4431373, 1,
-0.1995019, 1.483421, -0.214105, 0, 1, 0.4470588, 1,
-0.1976837, 0.7437245, 0.8824836, 0, 1, 0.454902, 1,
-0.1973464, 1.318154, 1.559006, 0, 1, 0.4588235, 1,
-0.1956067, -1.529087, -2.195446, 0, 1, 0.4666667, 1,
-0.195577, 0.1210619, 0.5320898, 0, 1, 0.4705882, 1,
-0.1937423, -0.2378433, -3.046125, 0, 1, 0.4784314, 1,
-0.1913512, -0.4542067, -3.968425, 0, 1, 0.4823529, 1,
-0.189103, 1.106863, 1.339619, 0, 1, 0.4901961, 1,
-0.185365, -1.46015, -2.429833, 0, 1, 0.4941176, 1,
-0.1835183, 1.034831, -1.22471, 0, 1, 0.5019608, 1,
-0.1829765, -0.8780662, -2.052644, 0, 1, 0.509804, 1,
-0.1710021, -0.5986985, -2.639665, 0, 1, 0.5137255, 1,
-0.1707818, 0.6596053, -0.4014788, 0, 1, 0.5215687, 1,
-0.1688692, -1.154592, -3.14625, 0, 1, 0.5254902, 1,
-0.1673878, -0.342081, -1.46401, 0, 1, 0.5333334, 1,
-0.1617504, 1.341235, 0.1242426, 0, 1, 0.5372549, 1,
-0.1587827, -1.224544, -3.435514, 0, 1, 0.5450981, 1,
-0.1559811, -1.116876, -2.758066, 0, 1, 0.5490196, 1,
-0.1483851, -1.373677, -1.657484, 0, 1, 0.5568628, 1,
-0.1415736, 0.8840379, 0.3779464, 0, 1, 0.5607843, 1,
-0.1400195, -1.193751, -2.843762, 0, 1, 0.5686275, 1,
-0.1397144, 0.06730064, -0.5547305, 0, 1, 0.572549, 1,
-0.1378087, -0.1800918, -3.31881, 0, 1, 0.5803922, 1,
-0.1363208, -1.241789, -3.439602, 0, 1, 0.5843138, 1,
-0.1351529, -1.663057, -4.050558, 0, 1, 0.5921569, 1,
-0.1347031, 0.2276328, 0.3408926, 0, 1, 0.5960785, 1,
-0.1339974, 2.185607, -1.148435, 0, 1, 0.6039216, 1,
-0.1313651, 1.179601, 0.09960457, 0, 1, 0.6117647, 1,
-0.1240677, 0.3327409, 0.2741375, 0, 1, 0.6156863, 1,
-0.1223326, 0.7729875, 0.2925609, 0, 1, 0.6235294, 1,
-0.1200669, 1.570824, 0.4188825, 0, 1, 0.627451, 1,
-0.1191043, -0.3988383, -3.626776, 0, 1, 0.6352941, 1,
-0.1183242, -0.4832706, -4.402638, 0, 1, 0.6392157, 1,
-0.1170707, 0.6043755, 0.6285337, 0, 1, 0.6470588, 1,
-0.1157711, -0.7582132, -3.497292, 0, 1, 0.6509804, 1,
-0.1131512, -1.432468, -2.936547, 0, 1, 0.6588235, 1,
-0.1124209, -1.796239, -1.300645, 0, 1, 0.6627451, 1,
-0.1121906, 0.02274601, -3.599907, 0, 1, 0.6705883, 1,
-0.1118801, -0.2968118, -1.312154, 0, 1, 0.6745098, 1,
-0.1071747, -0.1577398, -1.12295, 0, 1, 0.682353, 1,
-0.1017485, 0.1017251, 0.6117097, 0, 1, 0.6862745, 1,
-0.1009073, 0.05366277, -1.277141, 0, 1, 0.6941177, 1,
-0.1006941, -0.528976, -3.051527, 0, 1, 0.7019608, 1,
-0.09732032, 0.3992672, 0.1611337, 0, 1, 0.7058824, 1,
-0.09523193, -0.04062825, -2.521113, 0, 1, 0.7137255, 1,
-0.08973669, 0.07200982, 0.6736439, 0, 1, 0.7176471, 1,
-0.08521581, 0.8890587, 0.3622889, 0, 1, 0.7254902, 1,
-0.08420628, 1.894452, 0.3771239, 0, 1, 0.7294118, 1,
-0.08249673, -1.149452, -3.54053, 0, 1, 0.7372549, 1,
-0.08237538, -1.322455, -4.123393, 0, 1, 0.7411765, 1,
-0.08169272, 1.092804, 0.5092502, 0, 1, 0.7490196, 1,
-0.0791144, -1.515349, -5.373129, 0, 1, 0.7529412, 1,
-0.07506969, -1.047652, -3.51207, 0, 1, 0.7607843, 1,
-0.07401258, -1.143559, -1.817151, 0, 1, 0.7647059, 1,
-0.07194357, 1.020502, -1.536049, 0, 1, 0.772549, 1,
-0.0697585, 0.5220451, 0.4705308, 0, 1, 0.7764706, 1,
-0.06880276, 0.1522629, 0.6977651, 0, 1, 0.7843137, 1,
-0.06825162, 0.4410456, -1.386669, 0, 1, 0.7882353, 1,
-0.06739402, -0.136809, -3.397654, 0, 1, 0.7960784, 1,
-0.06736498, -0.2318487, -3.020325, 0, 1, 0.8039216, 1,
-0.06335903, 0.9509619, 0.532993, 0, 1, 0.8078431, 1,
-0.0606963, 2.206058, -0.03053591, 0, 1, 0.8156863, 1,
-0.0591789, -0.936864, -1.588799, 0, 1, 0.8196079, 1,
-0.05346628, 0.8909732, 0.2034438, 0, 1, 0.827451, 1,
-0.0472051, 0.4187648, -0.6977373, 0, 1, 0.8313726, 1,
-0.04017957, 0.991098, 0.220481, 0, 1, 0.8392157, 1,
-0.04010056, -1.14583, -3.688617, 0, 1, 0.8431373, 1,
-0.03765612, -0.4402657, -2.138277, 0, 1, 0.8509804, 1,
-0.03666139, 0.1435703, -0.6218484, 0, 1, 0.854902, 1,
-0.02888608, 0.4458389, -1.023334, 0, 1, 0.8627451, 1,
-0.02865743, 1.499031, 0.6066223, 0, 1, 0.8666667, 1,
-0.02377944, 0.3388684, -0.9987411, 0, 1, 0.8745098, 1,
-0.02339339, 0.8321873, -0.1425799, 0, 1, 0.8784314, 1,
-0.02224441, 0.2926109, -0.9947795, 0, 1, 0.8862745, 1,
-0.02214834, 0.2283656, 1.528916, 0, 1, 0.8901961, 1,
-0.02031156, -1.454402, -4.295162, 0, 1, 0.8980392, 1,
-0.01662142, 1.033002, 2.126468, 0, 1, 0.9058824, 1,
-0.01506871, -2.057425, -2.225891, 0, 1, 0.9098039, 1,
-0.01361935, -1.331608, -2.712548, 0, 1, 0.9176471, 1,
-0.01175652, 1.598888, -0.4119666, 0, 1, 0.9215686, 1,
-0.003393678, -0.5675493, -2.922468, 0, 1, 0.9294118, 1,
-0.001362761, -1.870622, -2.544583, 0, 1, 0.9333333, 1,
0.0003098334, 0.8223594, -0.1464399, 0, 1, 0.9411765, 1,
0.005439966, -0.8878738, 3.214906, 0, 1, 0.945098, 1,
0.01643914, 0.6959916, 0.8074774, 0, 1, 0.9529412, 1,
0.0175687, -0.3904573, 2.874637, 0, 1, 0.9568627, 1,
0.02485955, 0.5035339, 0.6040146, 0, 1, 0.9647059, 1,
0.02572115, -0.5368959, 0.9666325, 0, 1, 0.9686275, 1,
0.02582709, -0.5984319, 3.061947, 0, 1, 0.9764706, 1,
0.02679229, -0.1568656, 3.067616, 0, 1, 0.9803922, 1,
0.02945239, 0.2874145, -1.163366, 0, 1, 0.9882353, 1,
0.03665871, -0.6049924, 3.162925, 0, 1, 0.9921569, 1,
0.03907862, 0.3509524, -0.9797682, 0, 1, 1, 1,
0.03910973, 0.9455175, -1.593868, 0, 0.9921569, 1, 1,
0.04028443, 0.8656664, 1.226846, 0, 0.9882353, 1, 1,
0.04236593, 0.1987719, -0.2723875, 0, 0.9803922, 1, 1,
0.04334069, -0.7540435, 4.744946, 0, 0.9764706, 1, 1,
0.04450221, 1.46606, 0.1858225, 0, 0.9686275, 1, 1,
0.04675106, -1.29941, 3.217211, 0, 0.9647059, 1, 1,
0.05179449, -0.6633342, 3.483856, 0, 0.9568627, 1, 1,
0.05646506, 0.6663026, -0.5087134, 0, 0.9529412, 1, 1,
0.05823028, -0.6335609, 3.404629, 0, 0.945098, 1, 1,
0.05845145, -1.696305, 3.371284, 0, 0.9411765, 1, 1,
0.059108, -1.646992, 2.705812, 0, 0.9333333, 1, 1,
0.0615155, -0.7895689, 2.353169, 0, 0.9294118, 1, 1,
0.06468245, -1.638822, 0.5619648, 0, 0.9215686, 1, 1,
0.06870469, -0.3167794, 2.535264, 0, 0.9176471, 1, 1,
0.06901937, 1.228371, 0.2335133, 0, 0.9098039, 1, 1,
0.07144105, -0.846988, 0.8420942, 0, 0.9058824, 1, 1,
0.0781211, -0.193222, 1.848655, 0, 0.8980392, 1, 1,
0.07956947, 0.2888138, -0.5967063, 0, 0.8901961, 1, 1,
0.07961488, 1.553594, -1.114169, 0, 0.8862745, 1, 1,
0.08044701, -0.6883361, 4.091718, 0, 0.8784314, 1, 1,
0.08339695, -0.1572814, 2.70537, 0, 0.8745098, 1, 1,
0.08494099, 1.97916, 1.573366, 0, 0.8666667, 1, 1,
0.08750157, 1.068801, 0.692057, 0, 0.8627451, 1, 1,
0.09117922, 0.1574522, 1.672611, 0, 0.854902, 1, 1,
0.09277857, 1.043398, 0.03536179, 0, 0.8509804, 1, 1,
0.09297869, -0.1797363, 3.695923, 0, 0.8431373, 1, 1,
0.09366383, 0.4076337, 0.3305708, 0, 0.8392157, 1, 1,
0.095306, -1.569586, 1.241154, 0, 0.8313726, 1, 1,
0.1028929, -0.02567161, 0.2669171, 0, 0.827451, 1, 1,
0.1072991, -1.128068, 3.758759, 0, 0.8196079, 1, 1,
0.1101672, -0.8137366, 0.6759725, 0, 0.8156863, 1, 1,
0.111536, 1.311096, -0.6944213, 0, 0.8078431, 1, 1,
0.1122531, 0.7319192, 1.270475, 0, 0.8039216, 1, 1,
0.1134197, -1.173438, 4.008502, 0, 0.7960784, 1, 1,
0.1136233, 0.001740545, 1.736544, 0, 0.7882353, 1, 1,
0.1137755, -0.7304512, 2.702711, 0, 0.7843137, 1, 1,
0.1161321, -1.242814, 3.6344, 0, 0.7764706, 1, 1,
0.1162627, 0.1441042, -0.4120132, 0, 0.772549, 1, 1,
0.119437, -1.459682, 2.071111, 0, 0.7647059, 1, 1,
0.1269606, -0.0507904, 2.223527, 0, 0.7607843, 1, 1,
0.1389229, -0.773248, 2.048711, 0, 0.7529412, 1, 1,
0.1409728, 1.603583, 0.7202815, 0, 0.7490196, 1, 1,
0.1411241, 0.8826762, 0.1588384, 0, 0.7411765, 1, 1,
0.145148, -0.07778095, 1.43229, 0, 0.7372549, 1, 1,
0.1463661, -0.2025709, 1.280254, 0, 0.7294118, 1, 1,
0.149813, 1.726199, -0.3559653, 0, 0.7254902, 1, 1,
0.1503264, 0.5993249, 0.2296396, 0, 0.7176471, 1, 1,
0.1518933, -0.1628397, 1.286632, 0, 0.7137255, 1, 1,
0.1548997, -0.5405513, 1.247551, 0, 0.7058824, 1, 1,
0.1556312, 1.382418, -1.533517, 0, 0.6980392, 1, 1,
0.1590531, -0.9178554, 3.088466, 0, 0.6941177, 1, 1,
0.159261, 0.3298395, 0.4101658, 0, 0.6862745, 1, 1,
0.1626448, 0.8725094, -0.2343792, 0, 0.682353, 1, 1,
0.1659955, 0.4079631, 0.2837499, 0, 0.6745098, 1, 1,
0.1675043, 0.5746287, 1.19834, 0, 0.6705883, 1, 1,
0.1698651, -1.513841, 3.19791, 0, 0.6627451, 1, 1,
0.1720583, -0.1545231, 1.981645, 0, 0.6588235, 1, 1,
0.1801056, 0.3803472, -0.1911159, 0, 0.6509804, 1, 1,
0.1865555, -0.6138608, 3.412009, 0, 0.6470588, 1, 1,
0.1895117, -1.600438, 4.896016, 0, 0.6392157, 1, 1,
0.1898642, -2.709249, 3.326098, 0, 0.6352941, 1, 1,
0.1932072, -1.120031, 2.893937, 0, 0.627451, 1, 1,
0.1940802, 0.7785278, 0.3525836, 0, 0.6235294, 1, 1,
0.1986077, -0.3624034, 3.076133, 0, 0.6156863, 1, 1,
0.1990043, -0.1689825, 3.095702, 0, 0.6117647, 1, 1,
0.2007296, 0.3740324, -0.5578246, 0, 0.6039216, 1, 1,
0.2013935, 0.5240642, 0.4025991, 0, 0.5960785, 1, 1,
0.2022065, 0.1361321, 2.011244, 0, 0.5921569, 1, 1,
0.2026497, 0.7996336, 1.451205, 0, 0.5843138, 1, 1,
0.2026611, 1.126066, -1.289079, 0, 0.5803922, 1, 1,
0.2079382, 0.4535998, 1.777507, 0, 0.572549, 1, 1,
0.2103805, -1.039356, 2.400453, 0, 0.5686275, 1, 1,
0.2115378, -0.428515, 2.037445, 0, 0.5607843, 1, 1,
0.2124443, 0.2491021, 0.9180917, 0, 0.5568628, 1, 1,
0.2143952, 0.1323518, 1.613858, 0, 0.5490196, 1, 1,
0.2172889, -0.8561934, 2.042952, 0, 0.5450981, 1, 1,
0.2205172, 1.478625, 0.1624919, 0, 0.5372549, 1, 1,
0.2209924, -0.3650522, 1.056801, 0, 0.5333334, 1, 1,
0.2248336, 0.9473238, -0.06432427, 0, 0.5254902, 1, 1,
0.2257541, 0.09874439, 0.6144111, 0, 0.5215687, 1, 1,
0.2258453, 0.0879399, 0.4476134, 0, 0.5137255, 1, 1,
0.2264277, 0.8313901, 1.006817, 0, 0.509804, 1, 1,
0.2304317, -0.08925265, 0.7503478, 0, 0.5019608, 1, 1,
0.2312469, -0.3245124, 2.033864, 0, 0.4941176, 1, 1,
0.2390714, -2.266732, 3.028894, 0, 0.4901961, 1, 1,
0.2443368, 0.1443559, -0.06076451, 0, 0.4823529, 1, 1,
0.2443419, -0.8540061, 3.023904, 0, 0.4784314, 1, 1,
0.2524643, 0.4271917, 1.253384, 0, 0.4705882, 1, 1,
0.2529896, -1.302664, 3.396993, 0, 0.4666667, 1, 1,
0.2561024, -1.128171, 1.365921, 0, 0.4588235, 1, 1,
0.2564337, 0.4577675, 1.147258, 0, 0.454902, 1, 1,
0.2566164, -0.3885126, 3.638011, 0, 0.4470588, 1, 1,
0.2623726, 0.5992478, 0.3297448, 0, 0.4431373, 1, 1,
0.264808, 0.3426233, 3.112275, 0, 0.4352941, 1, 1,
0.2653262, 1.41382, 0.9336434, 0, 0.4313726, 1, 1,
0.2716112, -0.1111729, 1.556194, 0, 0.4235294, 1, 1,
0.2768266, -0.4070311, 1.932606, 0, 0.4196078, 1, 1,
0.280698, -1.027642, 4.260133, 0, 0.4117647, 1, 1,
0.2843834, 1.444415, 1.955179, 0, 0.4078431, 1, 1,
0.2847814, 1.200902, 1.187418, 0, 0.4, 1, 1,
0.2867976, -0.9369214, 4.230716, 0, 0.3921569, 1, 1,
0.2870269, -0.3504065, 2.582537, 0, 0.3882353, 1, 1,
0.2875881, -2.290641, 2.840454, 0, 0.3803922, 1, 1,
0.2884642, 1.790566, 1.100796, 0, 0.3764706, 1, 1,
0.2919609, -1.504866, 2.208934, 0, 0.3686275, 1, 1,
0.2925968, -0.8617861, 3.832974, 0, 0.3647059, 1, 1,
0.293404, -1.038889, 2.783136, 0, 0.3568628, 1, 1,
0.2937844, -0.3041857, 3.143115, 0, 0.3529412, 1, 1,
0.294227, 2.141011, 0.3165128, 0, 0.345098, 1, 1,
0.294502, 1.269106, -0.05692084, 0, 0.3411765, 1, 1,
0.2961065, 0.3041709, 1.806535, 0, 0.3333333, 1, 1,
0.2981543, -0.2854961, 1.572283, 0, 0.3294118, 1, 1,
0.3000042, 1.26421, 0.1723357, 0, 0.3215686, 1, 1,
0.3021446, 0.7492654, 0.9991539, 0, 0.3176471, 1, 1,
0.3045358, -0.4783116, 2.856668, 0, 0.3098039, 1, 1,
0.3054824, 0.3176888, 1.612512, 0, 0.3058824, 1, 1,
0.3058572, -0.8190904, 2.924441, 0, 0.2980392, 1, 1,
0.3067406, 0.2857477, 1.792781, 0, 0.2901961, 1, 1,
0.3074821, -0.2828095, 2.51423, 0, 0.2862745, 1, 1,
0.3118617, 0.4835162, 1.561911, 0, 0.2784314, 1, 1,
0.3142262, 0.07549933, 1.434699, 0, 0.2745098, 1, 1,
0.3148022, 0.3083744, 1.509253, 0, 0.2666667, 1, 1,
0.3167039, -0.3685591, 1.328545, 0, 0.2627451, 1, 1,
0.3199119, 1.629801, -0.1383403, 0, 0.254902, 1, 1,
0.3211394, 0.2742037, 0.9008826, 0, 0.2509804, 1, 1,
0.322057, -0.5213937, 1.244977, 0, 0.2431373, 1, 1,
0.3240453, 0.03343448, 2.30961, 0, 0.2392157, 1, 1,
0.328317, -1.729237, 3.149695, 0, 0.2313726, 1, 1,
0.3292245, 0.4899819, -0.7206786, 0, 0.227451, 1, 1,
0.3363439, 0.761374, 1.351702, 0, 0.2196078, 1, 1,
0.3367503, 1.607087, 0.1313358, 0, 0.2156863, 1, 1,
0.3518621, 0.3869465, 1.806506, 0, 0.2078431, 1, 1,
0.3550864, -0.04920786, 2.666485, 0, 0.2039216, 1, 1,
0.3560622, -0.8276414, 2.865372, 0, 0.1960784, 1, 1,
0.3596013, -0.6807846, 2.84367, 0, 0.1882353, 1, 1,
0.3600798, -0.555725, 1.311933, 0, 0.1843137, 1, 1,
0.3645743, 0.3642157, -0.2440157, 0, 0.1764706, 1, 1,
0.3652326, -1.163844, 2.097982, 0, 0.172549, 1, 1,
0.3665635, 0.5860725, 1.184305, 0, 0.1647059, 1, 1,
0.366896, 1.211318, 1.316633, 0, 0.1607843, 1, 1,
0.3678955, 0.1590066, 1.568426, 0, 0.1529412, 1, 1,
0.369186, -0.7020361, 2.150967, 0, 0.1490196, 1, 1,
0.3705572, 0.1068195, 1.498255, 0, 0.1411765, 1, 1,
0.3779871, -1.261034, 2.336153, 0, 0.1372549, 1, 1,
0.3803797, -0.1908729, 1.609237, 0, 0.1294118, 1, 1,
0.3805337, 1.117374, 1.582152, 0, 0.1254902, 1, 1,
0.3830683, -1.232427, 2.201641, 0, 0.1176471, 1, 1,
0.3844964, -0.1679914, 2.708365, 0, 0.1137255, 1, 1,
0.3858019, 0.5665258, -0.5964214, 0, 0.1058824, 1, 1,
0.3925511, 0.8055909, 0.3626389, 0, 0.09803922, 1, 1,
0.3958488, -0.9073633, 2.740241, 0, 0.09411765, 1, 1,
0.3978891, 0.3239804, 0.5250657, 0, 0.08627451, 1, 1,
0.3986339, -0.2665699, 1.505854, 0, 0.08235294, 1, 1,
0.404514, 0.7084232, -0.456915, 0, 0.07450981, 1, 1,
0.4062782, 0.269927, 0.2100403, 0, 0.07058824, 1, 1,
0.4079876, 1.608468, 0.4476674, 0, 0.0627451, 1, 1,
0.4086931, 0.2340675, 2.329585, 0, 0.05882353, 1, 1,
0.4105037, 1.649956, 0.8359569, 0, 0.05098039, 1, 1,
0.4194802, -0.7002292, 2.082332, 0, 0.04705882, 1, 1,
0.4239747, -0.9344862, 1.965686, 0, 0.03921569, 1, 1,
0.4276618, 0.5190458, 2.307063, 0, 0.03529412, 1, 1,
0.4304202, -1.364547, 2.609926, 0, 0.02745098, 1, 1,
0.4351656, -0.4409464, 2.266837, 0, 0.02352941, 1, 1,
0.4363166, -0.3529834, 1.583379, 0, 0.01568628, 1, 1,
0.4370731, 0.6936139, 0.4609563, 0, 0.01176471, 1, 1,
0.4454173, 0.4195791, 0.5155824, 0, 0.003921569, 1, 1,
0.4455386, 0.2709112, -0.4407242, 0.003921569, 0, 1, 1,
0.4525736, 0.09775595, 2.175171, 0.007843138, 0, 1, 1,
0.4559216, -0.3187911, 2.550108, 0.01568628, 0, 1, 1,
0.4584787, 2.483251, -1.190611, 0.01960784, 0, 1, 1,
0.4624285, -0.994137, 3.725017, 0.02745098, 0, 1, 1,
0.4633046, -0.4103677, 3.044714, 0.03137255, 0, 1, 1,
0.4660127, 0.6492965, 1.953818, 0.03921569, 0, 1, 1,
0.4686795, -0.4266271, 3.599266, 0.04313726, 0, 1, 1,
0.47422, -0.4071916, 3.982512, 0.05098039, 0, 1, 1,
0.4747831, -0.8136043, 2.662256, 0.05490196, 0, 1, 1,
0.4748901, -1.498859, 3.268896, 0.0627451, 0, 1, 1,
0.4759795, -1.175888, 5.119929, 0.06666667, 0, 1, 1,
0.4837757, -0.1942048, 1.996889, 0.07450981, 0, 1, 1,
0.4849234, 1.929828, 0.3558598, 0.07843138, 0, 1, 1,
0.4868822, 0.1869827, 1.711032, 0.08627451, 0, 1, 1,
0.489206, -0.04495109, 1.371929, 0.09019608, 0, 1, 1,
0.4908195, -1.010831, 3.338612, 0.09803922, 0, 1, 1,
0.4909169, 0.3163902, 1.796728, 0.1058824, 0, 1, 1,
0.4946442, -0.6280038, 2.342807, 0.1098039, 0, 1, 1,
0.4990599, -0.3127133, 3.116529, 0.1176471, 0, 1, 1,
0.5014757, 0.5856925, -0.6628245, 0.1215686, 0, 1, 1,
0.5020263, 0.3989181, 0.1504151, 0.1294118, 0, 1, 1,
0.5041894, 0.2748736, 0.4612791, 0.1333333, 0, 1, 1,
0.5106615, 0.9533334, 0.9467616, 0.1411765, 0, 1, 1,
0.5129205, 0.5732161, -0.398259, 0.145098, 0, 1, 1,
0.5139958, 1.298336, 0.961319, 0.1529412, 0, 1, 1,
0.515066, -0.2162771, 2.094265, 0.1568628, 0, 1, 1,
0.5178525, 0.8000662, 0.4641151, 0.1647059, 0, 1, 1,
0.5230454, 0.2339673, -0.8903894, 0.1686275, 0, 1, 1,
0.5289651, -0.8818581, -0.6530483, 0.1764706, 0, 1, 1,
0.5303398, -0.5744502, 0.8353974, 0.1803922, 0, 1, 1,
0.5307716, -1.182516, 2.817691, 0.1882353, 0, 1, 1,
0.5319822, 0.2506343, 2.640172, 0.1921569, 0, 1, 1,
0.5326945, -2.167224, 2.917608, 0.2, 0, 1, 1,
0.5365705, -1.495234, 2.333001, 0.2078431, 0, 1, 1,
0.5367971, -0.101627, 4.283408, 0.2117647, 0, 1, 1,
0.5448082, 0.769102, 2.163934, 0.2196078, 0, 1, 1,
0.5501717, -0.4311761, 0.7633621, 0.2235294, 0, 1, 1,
0.5505148, 0.4199881, -0.3992436, 0.2313726, 0, 1, 1,
0.5531257, -0.8346672, 1.7563, 0.2352941, 0, 1, 1,
0.5547394, 0.5658643, 0.2363341, 0.2431373, 0, 1, 1,
0.5574662, -0.5698472, 3.38968, 0.2470588, 0, 1, 1,
0.567609, 1.5411, 1.768401, 0.254902, 0, 1, 1,
0.570114, -0.497928, 2.736123, 0.2588235, 0, 1, 1,
0.5709517, -0.1004179, 1.557789, 0.2666667, 0, 1, 1,
0.5789769, 0.5117366, 0.8632185, 0.2705882, 0, 1, 1,
0.5822921, -0.4370522, 2.843825, 0.2784314, 0, 1, 1,
0.5911558, -0.8134981, 3.492898, 0.282353, 0, 1, 1,
0.5911574, 0.1585968, 3.424237, 0.2901961, 0, 1, 1,
0.5952436, -0.2239638, 2.303211, 0.2941177, 0, 1, 1,
0.5963581, -1.426066, 3.51005, 0.3019608, 0, 1, 1,
0.5995754, 1.160973, 0.529992, 0.3098039, 0, 1, 1,
0.600796, 0.8335672, 1.610069, 0.3137255, 0, 1, 1,
0.6012776, -0.7574039, 2.257406, 0.3215686, 0, 1, 1,
0.6013311, -0.6374642, 2.915498, 0.3254902, 0, 1, 1,
0.6075179, 0.6419093, -0.3558782, 0.3333333, 0, 1, 1,
0.610566, 0.2751777, 3.299883, 0.3372549, 0, 1, 1,
0.611665, -0.416157, 1.575704, 0.345098, 0, 1, 1,
0.6122491, 0.1719924, 2.255402, 0.3490196, 0, 1, 1,
0.6144719, -0.5810763, 1.352979, 0.3568628, 0, 1, 1,
0.6163751, -1.383196, 1.588592, 0.3607843, 0, 1, 1,
0.6195967, -0.03554801, 0.4097342, 0.3686275, 0, 1, 1,
0.6219788, -0.5162174, 2.100213, 0.372549, 0, 1, 1,
0.6279477, 0.4237087, 1.775955, 0.3803922, 0, 1, 1,
0.6280279, 0.4318255, 1.82763, 0.3843137, 0, 1, 1,
0.6339442, 1.206128, 0.006477911, 0.3921569, 0, 1, 1,
0.6342822, -0.6335264, 1.842703, 0.3960784, 0, 1, 1,
0.6355284, 0.2725367, 2.017739, 0.4039216, 0, 1, 1,
0.6368577, -1.130022, 2.553926, 0.4117647, 0, 1, 1,
0.6378035, -1.052494, 0.9152302, 0.4156863, 0, 1, 1,
0.6449391, -0.4698351, 3.825266, 0.4235294, 0, 1, 1,
0.6488203, -1.017424, 2.733133, 0.427451, 0, 1, 1,
0.650075, 0.1319508, 1.482995, 0.4352941, 0, 1, 1,
0.6549061, -0.2556604, -0.2777115, 0.4392157, 0, 1, 1,
0.6564251, -0.8483738, 1.707941, 0.4470588, 0, 1, 1,
0.6567531, 0.3431346, -0.2209968, 0.4509804, 0, 1, 1,
0.6602431, 0.8424624, -1.569789, 0.4588235, 0, 1, 1,
0.6632709, 0.3926896, 0.7715287, 0.4627451, 0, 1, 1,
0.6654016, -0.5327309, 3.495836, 0.4705882, 0, 1, 1,
0.6690037, -1.711288, 3.292707, 0.4745098, 0, 1, 1,
0.6702202, 2.985941, -0.3570472, 0.4823529, 0, 1, 1,
0.6761495, -1.913666, 2.668763, 0.4862745, 0, 1, 1,
0.6785021, -0.08814681, 1.532841, 0.4941176, 0, 1, 1,
0.6827723, 1.68321, 1.580321, 0.5019608, 0, 1, 1,
0.6849136, 0.4102127, 3.296085, 0.5058824, 0, 1, 1,
0.6868395, -1.613369, 3.360598, 0.5137255, 0, 1, 1,
0.6870633, -2.248503, 2.99546, 0.5176471, 0, 1, 1,
0.6926785, 2.089556, -0.04819018, 0.5254902, 0, 1, 1,
0.696125, -0.5327712, 2.679752, 0.5294118, 0, 1, 1,
0.7031225, -0.1489346, 0.6384256, 0.5372549, 0, 1, 1,
0.7043216, -0.5163504, 2.765987, 0.5411765, 0, 1, 1,
0.706191, 0.267463, 1.463871, 0.5490196, 0, 1, 1,
0.7062303, 1.282562, 0.4135211, 0.5529412, 0, 1, 1,
0.7125127, 1.521115, 1.549641, 0.5607843, 0, 1, 1,
0.7147407, -0.1400334, 1.658851, 0.5647059, 0, 1, 1,
0.7155548, 1.456596, 1.307362, 0.572549, 0, 1, 1,
0.7180301, -1.002514, 3.220181, 0.5764706, 0, 1, 1,
0.7208008, 2.255722, -0.07749172, 0.5843138, 0, 1, 1,
0.724399, 0.4763258, 1.639728, 0.5882353, 0, 1, 1,
0.7320595, -0.6668049, 3.695611, 0.5960785, 0, 1, 1,
0.7342967, -2.071643, 3.786255, 0.6039216, 0, 1, 1,
0.7383788, -0.7471471, 1.98058, 0.6078432, 0, 1, 1,
0.7413392, 0.3200375, 0.516494, 0.6156863, 0, 1, 1,
0.7414445, 1.321918, -1.026918, 0.6196079, 0, 1, 1,
0.7417282, 2.222649, 1.184937, 0.627451, 0, 1, 1,
0.7432936, 0.2531721, 1.074532, 0.6313726, 0, 1, 1,
0.7444363, -0.3384958, 2.182872, 0.6392157, 0, 1, 1,
0.7545962, 1.754427, 0.07971884, 0.6431373, 0, 1, 1,
0.7562314, 0.01978306, -0.6964983, 0.6509804, 0, 1, 1,
0.7599488, 0.8843849, -1.782572, 0.654902, 0, 1, 1,
0.7670234, -0.439642, 1.02179, 0.6627451, 0, 1, 1,
0.7671143, 0.04911947, 1.868476, 0.6666667, 0, 1, 1,
0.7690369, 1.462839, 0.7505866, 0.6745098, 0, 1, 1,
0.7732264, 1.25219, 1.816624, 0.6784314, 0, 1, 1,
0.7755182, -1.33977, 3.550244, 0.6862745, 0, 1, 1,
0.7915795, 0.6702697, 2.032246, 0.6901961, 0, 1, 1,
0.7929503, -2.303624, 1.582973, 0.6980392, 0, 1, 1,
0.8085217, -0.2799297, 2.049428, 0.7058824, 0, 1, 1,
0.8099626, 0.2922898, 1.618748, 0.7098039, 0, 1, 1,
0.8119158, 2.134471, 2.481554, 0.7176471, 0, 1, 1,
0.8120567, -0.2373912, 1.248814, 0.7215686, 0, 1, 1,
0.8137879, 1.321201, 0.06194062, 0.7294118, 0, 1, 1,
0.8176218, 0.1243151, 1.766366, 0.7333333, 0, 1, 1,
0.8251656, 0.2687534, 2.132344, 0.7411765, 0, 1, 1,
0.8282937, -1.101937, 1.674665, 0.7450981, 0, 1, 1,
0.8288913, -2.268786, 5.186248, 0.7529412, 0, 1, 1,
0.8304226, 1.686813, 0.3044015, 0.7568628, 0, 1, 1,
0.8346828, -0.609836, 0.8690747, 0.7647059, 0, 1, 1,
0.8349214, -0.03563553, 2.368136, 0.7686275, 0, 1, 1,
0.8371491, 0.4426433, 1.673404, 0.7764706, 0, 1, 1,
0.8393394, 1.626059, -0.4720502, 0.7803922, 0, 1, 1,
0.8480966, -0.4011858, 1.13455, 0.7882353, 0, 1, 1,
0.8489338, -0.2346529, 1.510432, 0.7921569, 0, 1, 1,
0.8518509, -0.4228366, 2.20051, 0.8, 0, 1, 1,
0.8543267, -1.202055, 2.855144, 0.8078431, 0, 1, 1,
0.8553999, 0.2262554, 2.323877, 0.8117647, 0, 1, 1,
0.8622114, 0.5837218, 2.352713, 0.8196079, 0, 1, 1,
0.8687983, -0.09714992, 3.897635, 0.8235294, 0, 1, 1,
0.8753521, 0.9325644, -0.0516919, 0.8313726, 0, 1, 1,
0.8790946, -0.4675284, 3.514822, 0.8352941, 0, 1, 1,
0.8898895, 0.5268919, 2.60295, 0.8431373, 0, 1, 1,
0.8928196, -0.2438964, 1.158444, 0.8470588, 0, 1, 1,
0.8952398, -0.7842396, 2.09017, 0.854902, 0, 1, 1,
0.8952669, 1.040605, 0.1740337, 0.8588235, 0, 1, 1,
0.89807, 1.694084, 0.5493722, 0.8666667, 0, 1, 1,
0.9029557, -0.3266734, 1.734346, 0.8705882, 0, 1, 1,
0.904834, 0.6675321, -1.128449, 0.8784314, 0, 1, 1,
0.9051507, -2.881053, 3.068534, 0.8823529, 0, 1, 1,
0.9062935, 0.6449601, 2.14292, 0.8901961, 0, 1, 1,
0.9105024, 0.000156799, 0.1287664, 0.8941177, 0, 1, 1,
0.9128383, -0.9093913, 1.102105, 0.9019608, 0, 1, 1,
0.9162694, 1.391154, 0.4010423, 0.9098039, 0, 1, 1,
0.9217572, -1.55145, 1.423438, 0.9137255, 0, 1, 1,
0.924487, -0.341183, 1.574415, 0.9215686, 0, 1, 1,
0.9264202, 0.6983311, 2.188246, 0.9254902, 0, 1, 1,
0.9313222, 1.100891, 0.1543477, 0.9333333, 0, 1, 1,
0.9315249, -1.266557, 1.742543, 0.9372549, 0, 1, 1,
0.9334779, 0.5412008, 1.368902, 0.945098, 0, 1, 1,
0.9393359, -1.251807, 2.445945, 0.9490196, 0, 1, 1,
0.9415535, -0.4456389, 2.08913, 0.9568627, 0, 1, 1,
0.9470812, -0.2250894, 2.125554, 0.9607843, 0, 1, 1,
0.9500093, 0.679176, 1.886402, 0.9686275, 0, 1, 1,
0.9509531, -0.7248386, 2.653085, 0.972549, 0, 1, 1,
0.9603082, -0.3389179, 1.273951, 0.9803922, 0, 1, 1,
0.9603899, 0.4448683, 0.975219, 0.9843137, 0, 1, 1,
0.9663189, -0.5524907, 1.132118, 0.9921569, 0, 1, 1,
0.9678401, -0.4305741, 0.6890754, 0.9960784, 0, 1, 1,
0.9697441, 1.409664, -0.9067776, 1, 0, 0.9960784, 1,
0.9788174, 0.6431935, 1.19602, 1, 0, 0.9882353, 1,
0.9799134, -0.03608513, 1.989118, 1, 0, 0.9843137, 1,
0.9800311, 0.4888116, -0.7279556, 1, 0, 0.9764706, 1,
0.9805319, -2.682056, 2.308931, 1, 0, 0.972549, 1,
0.9884124, -1.275002, 1.326722, 1, 0, 0.9647059, 1,
0.9961547, -0.7122685, 1.720099, 1, 0, 0.9607843, 1,
1.010327, 0.5819124, 0.5961996, 1, 0, 0.9529412, 1,
1.010385, -0.9399225, 0.4146121, 1, 0, 0.9490196, 1,
1.012094, 0.357522, 0.9893588, 1, 0, 0.9411765, 1,
1.022519, -0.5151129, 3.056439, 1, 0, 0.9372549, 1,
1.022804, 0.6283025, 1.956581, 1, 0, 0.9294118, 1,
1.02332, 2.234123, 2.039963, 1, 0, 0.9254902, 1,
1.023697, -1.364754, 1.579112, 1, 0, 0.9176471, 1,
1.027022, -0.1941972, 1.939783, 1, 0, 0.9137255, 1,
1.030414, 0.6945898, 0.5172901, 1, 0, 0.9058824, 1,
1.032441, 0.5585134, 1.672808, 1, 0, 0.9019608, 1,
1.034029, -0.1874285, 2.799683, 1, 0, 0.8941177, 1,
1.037688, -0.0279748, 2.087855, 1, 0, 0.8862745, 1,
1.041568, 0.863302, 0.1758477, 1, 0, 0.8823529, 1,
1.049663, -0.4332705, 1.496586, 1, 0, 0.8745098, 1,
1.051853, 1.064729, 0.9107988, 1, 0, 0.8705882, 1,
1.072034, -0.9266244, 2.58513, 1, 0, 0.8627451, 1,
1.078437, -0.1390973, 3.056081, 1, 0, 0.8588235, 1,
1.084715, 0.785642, 0.1612032, 1, 0, 0.8509804, 1,
1.086962, 0.1519045, 0.645267, 1, 0, 0.8470588, 1,
1.086991, 0.6740739, 1.77439, 1, 0, 0.8392157, 1,
1.087534, -0.6566746, 2.518548, 1, 0, 0.8352941, 1,
1.088152, 0.2287733, 2.171596, 1, 0, 0.827451, 1,
1.090507, -0.5608576, 2.695419, 1, 0, 0.8235294, 1,
1.106165, -0.6381157, 3.548239, 1, 0, 0.8156863, 1,
1.106695, -0.830937, 3.944321, 1, 0, 0.8117647, 1,
1.111176, 1.028676, -0.6622104, 1, 0, 0.8039216, 1,
1.115903, -1.889673, 1.699338, 1, 0, 0.7960784, 1,
1.116711, -0.6013151, 2.312427, 1, 0, 0.7921569, 1,
1.12174, -0.9216775, 1.595695, 1, 0, 0.7843137, 1,
1.122981, 0.5741814, 1.283709, 1, 0, 0.7803922, 1,
1.123568, 0.2409499, 1.660882, 1, 0, 0.772549, 1,
1.127664, -1.446181, 3.237437, 1, 0, 0.7686275, 1,
1.132199, 2.051555, 0.7815878, 1, 0, 0.7607843, 1,
1.133551, -0.6885619, 1.814283, 1, 0, 0.7568628, 1,
1.142025, 0.5004181, 1.121015, 1, 0, 0.7490196, 1,
1.142945, 0.6089633, 2.323858, 1, 0, 0.7450981, 1,
1.145596, -0.7266226, 1.961532, 1, 0, 0.7372549, 1,
1.148338, -0.6742125, 2.297856, 1, 0, 0.7333333, 1,
1.151731, 0.0436394, 0.8496214, 1, 0, 0.7254902, 1,
1.154981, -0.4462865, 3.602061, 1, 0, 0.7215686, 1,
1.156556, -1.218382, 4.810307, 1, 0, 0.7137255, 1,
1.156652, -0.915356, 1.729176, 1, 0, 0.7098039, 1,
1.159217, -0.2068842, 1.714789, 1, 0, 0.7019608, 1,
1.159285, -0.7516825, 2.382698, 1, 0, 0.6941177, 1,
1.161699, 0.6544246, 1.436251, 1, 0, 0.6901961, 1,
1.177575, -1.501147, 1.838441, 1, 0, 0.682353, 1,
1.193003, 0.715071, 1.538261, 1, 0, 0.6784314, 1,
1.197894, -0.3064987, 2.478478, 1, 0, 0.6705883, 1,
1.201926, -0.888404, 1.054513, 1, 0, 0.6666667, 1,
1.20821, 1.386776, 0.1875827, 1, 0, 0.6588235, 1,
1.21105, 0.7248182, 0.1525491, 1, 0, 0.654902, 1,
1.222982, 1.541105, 0.7041588, 1, 0, 0.6470588, 1,
1.232183, -0.5619671, 1.924159, 1, 0, 0.6431373, 1,
1.240744, -0.2605655, 2.676805, 1, 0, 0.6352941, 1,
1.249251, 0.5546022, 1.6394, 1, 0, 0.6313726, 1,
1.250173, 1.226161, 0.1148549, 1, 0, 0.6235294, 1,
1.251042, -0.491636, 1.438864, 1, 0, 0.6196079, 1,
1.251612, -0.4339649, 1.882479, 1, 0, 0.6117647, 1,
1.261894, 1.534982, -0.8131943, 1, 0, 0.6078432, 1,
1.26504, 0.6005539, 1.232807, 1, 0, 0.6, 1,
1.268191, -0.918673, 2.790319, 1, 0, 0.5921569, 1,
1.273996, 0.180392, 0.4566469, 1, 0, 0.5882353, 1,
1.285394, 0.7554095, 1.079732, 1, 0, 0.5803922, 1,
1.291981, -0.1795912, -0.01219754, 1, 0, 0.5764706, 1,
1.292108, 0.6762359, 2.064018, 1, 0, 0.5686275, 1,
1.305704, -0.5088336, 1.989726, 1, 0, 0.5647059, 1,
1.308164, -0.5535452, 3.394238, 1, 0, 0.5568628, 1,
1.310311, -0.9974351, 2.028258, 1, 0, 0.5529412, 1,
1.33606, -2.432596, 3.278154, 1, 0, 0.5450981, 1,
1.342026, 0.8057441, 2.002769, 1, 0, 0.5411765, 1,
1.356598, -0.003471757, 1.621893, 1, 0, 0.5333334, 1,
1.367257, 0.4739999, 2.480901, 1, 0, 0.5294118, 1,
1.382998, 1.330891, 0.3268677, 1, 0, 0.5215687, 1,
1.38462, 0.8150529, 0.3884039, 1, 0, 0.5176471, 1,
1.398081, -0.3821369, 2.640888, 1, 0, 0.509804, 1,
1.403358, -0.7621621, 3.279416, 1, 0, 0.5058824, 1,
1.417611, 0.5740362, 1.59106, 1, 0, 0.4980392, 1,
1.423195, -0.7664417, 0.9114946, 1, 0, 0.4901961, 1,
1.432652, 0.1195378, 2.908835, 1, 0, 0.4862745, 1,
1.440126, -1.481318, 1.949528, 1, 0, 0.4784314, 1,
1.447308, 1.873174, 1.592279, 1, 0, 0.4745098, 1,
1.450428, -0.2279804, 0.5873105, 1, 0, 0.4666667, 1,
1.450844, -1.295672, 2.573345, 1, 0, 0.4627451, 1,
1.459821, -1.152218, 2.41424, 1, 0, 0.454902, 1,
1.464827, -0.886453, 2.865052, 1, 0, 0.4509804, 1,
1.492883, -1.252278, 3.218065, 1, 0, 0.4431373, 1,
1.493144, 1.023087, 1.077882, 1, 0, 0.4392157, 1,
1.493515, -1.37595, 1.960183, 1, 0, 0.4313726, 1,
1.500231, 0.6055727, 1.121479, 1, 0, 0.427451, 1,
1.504671, -1.22648, 2.118374, 1, 0, 0.4196078, 1,
1.509487, -0.8401301, 2.391885, 1, 0, 0.4156863, 1,
1.524108, -0.3267929, 3.906963, 1, 0, 0.4078431, 1,
1.534431, -0.6847791, 1.795079, 1, 0, 0.4039216, 1,
1.539321, 0.3926705, 3.199442, 1, 0, 0.3960784, 1,
1.550031, -1.610844, 1.580899, 1, 0, 0.3882353, 1,
1.561837, -0.550817, -0.6426609, 1, 0, 0.3843137, 1,
1.563305, -0.4659706, 1.874376, 1, 0, 0.3764706, 1,
1.57626, 1.444229, 0.1067232, 1, 0, 0.372549, 1,
1.58788, -0.6949943, 1.015171, 1, 0, 0.3647059, 1,
1.588817, -0.2417042, 1.500318, 1, 0, 0.3607843, 1,
1.590267, 0.3027856, 2.824024, 1, 0, 0.3529412, 1,
1.596446, 1.128321, 0.1484652, 1, 0, 0.3490196, 1,
1.602782, 0.9551957, 1.409087, 1, 0, 0.3411765, 1,
1.603508, 0.6010926, 1.41741, 1, 0, 0.3372549, 1,
1.607792, -0.2167991, 0.9551457, 1, 0, 0.3294118, 1,
1.608107, -0.1792548, 1.724322, 1, 0, 0.3254902, 1,
1.609048, 1.264128, 0.2081403, 1, 0, 0.3176471, 1,
1.615814, 0.4971023, 1.571279, 1, 0, 0.3137255, 1,
1.679386, 0.08265018, 1.754339, 1, 0, 0.3058824, 1,
1.690844, -1.253097, 2.692493, 1, 0, 0.2980392, 1,
1.710472, -0.5666018, 2.353407, 1, 0, 0.2941177, 1,
1.718534, 0.1678258, 0.6470743, 1, 0, 0.2862745, 1,
1.734469, -0.642207, 2.083637, 1, 0, 0.282353, 1,
1.738583, -0.2093021, 2.131743, 1, 0, 0.2745098, 1,
1.757077, 0.201713, 0.2675002, 1, 0, 0.2705882, 1,
1.75871, 1.432166, 0.9403723, 1, 0, 0.2627451, 1,
1.759777, -0.5622844, 0.7106633, 1, 0, 0.2588235, 1,
1.778163, 0.8755233, 3.004982, 1, 0, 0.2509804, 1,
1.786133, 0.3175801, 1.714908, 1, 0, 0.2470588, 1,
1.789586, -1.085068, 2.081591, 1, 0, 0.2392157, 1,
1.848544, -1.963999, 4.338295, 1, 0, 0.2352941, 1,
1.856049, 1.716816, -0.6063053, 1, 0, 0.227451, 1,
1.861829, -0.4482318, 3.034104, 1, 0, 0.2235294, 1,
1.866084, -1.001518, 3.353159, 1, 0, 0.2156863, 1,
1.881297, -0.4909781, 0.955676, 1, 0, 0.2117647, 1,
1.90229, -1.242551, 2.028642, 1, 0, 0.2039216, 1,
1.914867, -1.563589, 2.614773, 1, 0, 0.1960784, 1,
1.91645, -0.8600714, 1.385827, 1, 0, 0.1921569, 1,
1.918035, 1.077461, 0.8027294, 1, 0, 0.1843137, 1,
1.919158, 0.1006708, 3.24003, 1, 0, 0.1803922, 1,
1.924866, -1.054249, 1.862256, 1, 0, 0.172549, 1,
1.930431, 1.493395, 0.3427391, 1, 0, 0.1686275, 1,
1.937732, 0.07012703, 0.7054887, 1, 0, 0.1607843, 1,
1.950383, 0.4613273, 1.561622, 1, 0, 0.1568628, 1,
1.955483, 0.0584798, 0.2947068, 1, 0, 0.1490196, 1,
1.960439, -1.548612, 2.131063, 1, 0, 0.145098, 1,
2.000349, 0.8308727, 1.902581, 1, 0, 0.1372549, 1,
2.013299, -0.07197344, 1.953493, 1, 0, 0.1333333, 1,
2.0346, -0.8281523, 3.550151, 1, 0, 0.1254902, 1,
2.047203, -0.5536197, 1.186169, 1, 0, 0.1215686, 1,
2.071815, -1.879171, 1.839426, 1, 0, 0.1137255, 1,
2.130889, 4.044385, -0.4555752, 1, 0, 0.1098039, 1,
2.195371, -0.7325654, 2.208025, 1, 0, 0.1019608, 1,
2.26597, -0.6787517, 0.9788984, 1, 0, 0.09411765, 1,
2.310838, 1.976067, 1.24598, 1, 0, 0.09019608, 1,
2.357105, 1.278069, 1.39088, 1, 0, 0.08235294, 1,
2.363286, -0.405685, 1.736089, 1, 0, 0.07843138, 1,
2.385877, -1.150751, 1.574521, 1, 0, 0.07058824, 1,
2.415955, -0.08994498, 3.667916, 1, 0, 0.06666667, 1,
2.463022, 0.5782684, 0.8364413, 1, 0, 0.05882353, 1,
2.507742, -0.7531555, 2.291161, 1, 0, 0.05490196, 1,
2.564135, 0.6202392, 1.825107, 1, 0, 0.04705882, 1,
2.571956, 0.5857763, 0.1046873, 1, 0, 0.04313726, 1,
2.580483, -0.6518487, 1.294218, 1, 0, 0.03529412, 1,
2.58801, 0.1330863, 2.754359, 1, 0, 0.03137255, 1,
2.724048, 0.1739161, 1.02895, 1, 0, 0.02352941, 1,
2.751313, -1.477656, -0.6587952, 1, 0, 0.01960784, 1,
2.951809, 0.3666819, 3.00213, 1, 0, 0.01176471, 1,
3.033085, -0.836791, -0.2610278, 1, 0, 0.007843138, 1
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
-0.00178504, -4.758093, -7.162943, 0, -0.5, 0.5, 0.5,
-0.00178504, -4.758093, -7.162943, 1, -0.5, 0.5, 0.5,
-0.00178504, -4.758093, -7.162943, 1, 1.5, 0.5, 0.5,
-0.00178504, -4.758093, -7.162943, 0, 1.5, 0.5, 0.5
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
-4.065476, 0.281034, -7.162943, 0, -0.5, 0.5, 0.5,
-4.065476, 0.281034, -7.162943, 1, -0.5, 0.5, 0.5,
-4.065476, 0.281034, -7.162943, 1, 1.5, 0.5, 0.5,
-4.065476, 0.281034, -7.162943, 0, 1.5, 0.5, 0.5
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
-4.065476, -4.758093, -0.09344053, 0, -0.5, 0.5, 0.5,
-4.065476, -4.758093, -0.09344053, 1, -0.5, 0.5, 0.5,
-4.065476, -4.758093, -0.09344053, 1, 1.5, 0.5, 0.5,
-4.065476, -4.758093, -0.09344053, 0, 1.5, 0.5, 0.5
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
-3, -3.595217, -5.531519,
3, -3.595217, -5.531519,
-3, -3.595217, -5.531519,
-3, -3.78903, -5.803423,
-2, -3.595217, -5.531519,
-2, -3.78903, -5.803423,
-1, -3.595217, -5.531519,
-1, -3.78903, -5.803423,
0, -3.595217, -5.531519,
0, -3.78903, -5.803423,
1, -3.595217, -5.531519,
1, -3.78903, -5.803423,
2, -3.595217, -5.531519,
2, -3.78903, -5.803423,
3, -3.595217, -5.531519,
3, -3.78903, -5.803423
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
-3, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
-3, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
-3, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
-3, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
-2, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
-2, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
-2, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
-2, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
-1, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
-1, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
-1, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
-1, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
0, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
0, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
0, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
0, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
1, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
1, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
1, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
1, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
2, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
2, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
2, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
2, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5,
3, -4.176655, -6.347231, 0, -0.5, 0.5, 0.5,
3, -4.176655, -6.347231, 1, -0.5, 0.5, 0.5,
3, -4.176655, -6.347231, 1, 1.5, 0.5, 0.5,
3, -4.176655, -6.347231, 0, 1.5, 0.5, 0.5
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
-3.127701, -2, -5.531519,
-3.127701, 4, -5.531519,
-3.127701, -2, -5.531519,
-3.283997, -2, -5.803423,
-3.127701, 0, -5.531519,
-3.283997, 0, -5.803423,
-3.127701, 2, -5.531519,
-3.283997, 2, -5.803423,
-3.127701, 4, -5.531519,
-3.283997, 4, -5.803423
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
"0",
"2",
"4"
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
-3.596588, -2, -6.347231, 0, -0.5, 0.5, 0.5,
-3.596588, -2, -6.347231, 1, -0.5, 0.5, 0.5,
-3.596588, -2, -6.347231, 1, 1.5, 0.5, 0.5,
-3.596588, -2, -6.347231, 0, 1.5, 0.5, 0.5,
-3.596588, 0, -6.347231, 0, -0.5, 0.5, 0.5,
-3.596588, 0, -6.347231, 1, -0.5, 0.5, 0.5,
-3.596588, 0, -6.347231, 1, 1.5, 0.5, 0.5,
-3.596588, 0, -6.347231, 0, 1.5, 0.5, 0.5,
-3.596588, 2, -6.347231, 0, -0.5, 0.5, 0.5,
-3.596588, 2, -6.347231, 1, -0.5, 0.5, 0.5,
-3.596588, 2, -6.347231, 1, 1.5, 0.5, 0.5,
-3.596588, 2, -6.347231, 0, 1.5, 0.5, 0.5,
-3.596588, 4, -6.347231, 0, -0.5, 0.5, 0.5,
-3.596588, 4, -6.347231, 1, -0.5, 0.5, 0.5,
-3.596588, 4, -6.347231, 1, 1.5, 0.5, 0.5,
-3.596588, 4, -6.347231, 0, 1.5, 0.5, 0.5
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
-3.127701, -3.595217, -4,
-3.127701, -3.595217, 4,
-3.127701, -3.595217, -4,
-3.283997, -3.78903, -4,
-3.127701, -3.595217, -2,
-3.283997, -3.78903, -2,
-3.127701, -3.595217, 0,
-3.283997, -3.78903, 0,
-3.127701, -3.595217, 2,
-3.283997, -3.78903, 2,
-3.127701, -3.595217, 4,
-3.283997, -3.78903, 4
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
-3.596588, -4.176655, -4, 0, -0.5, 0.5, 0.5,
-3.596588, -4.176655, -4, 1, -0.5, 0.5, 0.5,
-3.596588, -4.176655, -4, 1, 1.5, 0.5, 0.5,
-3.596588, -4.176655, -4, 0, 1.5, 0.5, 0.5,
-3.596588, -4.176655, -2, 0, -0.5, 0.5, 0.5,
-3.596588, -4.176655, -2, 1, -0.5, 0.5, 0.5,
-3.596588, -4.176655, -2, 1, 1.5, 0.5, 0.5,
-3.596588, -4.176655, -2, 0, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 0, 0, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 0, 1, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 0, 1, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 0, 0, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 2, 0, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 2, 1, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 2, 1, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 2, 0, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 4, 0, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 4, 1, -0.5, 0.5, 0.5,
-3.596588, -4.176655, 4, 1, 1.5, 0.5, 0.5,
-3.596588, -4.176655, 4, 0, 1.5, 0.5, 0.5
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
-3.127701, -3.595217, -5.531519,
-3.127701, 4.157286, -5.531519,
-3.127701, -3.595217, 5.344638,
-3.127701, 4.157286, 5.344638,
-3.127701, -3.595217, -5.531519,
-3.127701, -3.595217, 5.344638,
-3.127701, 4.157286, -5.531519,
-3.127701, 4.157286, 5.344638,
-3.127701, -3.595217, -5.531519,
3.124131, -3.595217, -5.531519,
-3.127701, -3.595217, 5.344638,
3.124131, -3.595217, 5.344638,
-3.127701, 4.157286, -5.531519,
3.124131, 4.157286, -5.531519,
-3.127701, 4.157286, 5.344638,
3.124131, 4.157286, 5.344638,
3.124131, -3.595217, -5.531519,
3.124131, 4.157286, -5.531519,
3.124131, -3.595217, 5.344638,
3.124131, 4.157286, 5.344638,
3.124131, -3.595217, -5.531519,
3.124131, -3.595217, 5.344638,
3.124131, 4.157286, -5.531519,
3.124131, 4.157286, 5.344638
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
var radius = 7.874675;
var distance = 35.03532;
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
mvMatrix.translate( 0.00178504, -0.281034, 0.09344053 );
mvMatrix.scale( 1.361881, 1.098259, 0.7828365 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03532);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Chlorfenvinphos<-read.table("Chlorfenvinphos.xyz")
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
-3.036655, -0.638266, 0.1463511, 0, 0, 1, 1, 1,
-2.276598, -1.396509, -1.382512, 1, 0, 0, 1, 1,
-2.232409, 1.617506, -0.09682374, 1, 0, 0, 1, 1,
-2.20923, 1.309131, -1.169034, 1, 0, 0, 1, 1,
-2.175002, 0.3665801, -1.008506, 1, 0, 0, 1, 1,
-2.155905, 0.9337612, -2.096774, 1, 0, 0, 1, 1,
-2.140732, 0.6524668, -2.770139, 0, 0, 0, 1, 1,
-2.130005, -0.5953118, -1.0913, 0, 0, 0, 1, 1,
-2.128854, -1.387303, -1.387079, 0, 0, 0, 1, 1,
-2.107617, 1.069096, -1.611575, 0, 0, 0, 1, 1,
-2.089971, 0.3628445, -0.7649062, 0, 0, 0, 1, 1,
-2.052578, -0.3971595, -0.8178765, 0, 0, 0, 1, 1,
-2.03892, 0.8450691, -2.086538, 0, 0, 0, 1, 1,
-2.037807, -0.6709742, -0.8578322, 1, 1, 1, 1, 1,
-2.030959, -0.8542761, -2.297049, 1, 1, 1, 1, 1,
-2.027272, -1.092352, -1.638768, 1, 1, 1, 1, 1,
-2.021246, -1.434502, 0.3617265, 1, 1, 1, 1, 1,
-2.00873, 0.5824974, -0.2361563, 1, 1, 1, 1, 1,
-2.008209, -0.3450501, -1.001062, 1, 1, 1, 1, 1,
-2.00378, -1.326514, 0.1989712, 1, 1, 1, 1, 1,
-1.987463, 0.0003881125, -1.945695, 1, 1, 1, 1, 1,
-1.979364, 0.06779225, -0.4310588, 1, 1, 1, 1, 1,
-1.976057, 0.8706651, 0.4521283, 1, 1, 1, 1, 1,
-1.971077, -0.1474611, -0.6386514, 1, 1, 1, 1, 1,
-1.919964, -0.4438669, -1.34649, 1, 1, 1, 1, 1,
-1.893248, -1.186509, -2.525146, 1, 1, 1, 1, 1,
-1.892056, 0.9129642, -1.024758, 1, 1, 1, 1, 1,
-1.833031, 0.5005814, -2.225812, 1, 1, 1, 1, 1,
-1.830497, -0.9652255, -1.559302, 0, 0, 1, 1, 1,
-1.786998, -1.873109, -1.682791, 1, 0, 0, 1, 1,
-1.775904, -1.925077, -0.9585409, 1, 0, 0, 1, 1,
-1.767635, -1.546125, -2.34335, 1, 0, 0, 1, 1,
-1.764796, 0.5208951, -2.090375, 1, 0, 0, 1, 1,
-1.762832, -0.4081264, -2.12428, 1, 0, 0, 1, 1,
-1.732018, -0.8761003, -2.644428, 0, 0, 0, 1, 1,
-1.729242, 0.8799804, -0.3787808, 0, 0, 0, 1, 1,
-1.719585, -0.1287552, -2.005632, 0, 0, 0, 1, 1,
-1.714265, 0.3677857, -0.2401941, 0, 0, 0, 1, 1,
-1.709984, -1.962584, -4.34683, 0, 0, 0, 1, 1,
-1.702653, 0.4420103, -2.078537, 0, 0, 0, 1, 1,
-1.695809, -0.8631353, -2.397362, 0, 0, 0, 1, 1,
-1.692128, 0.316995, -2.474139, 1, 1, 1, 1, 1,
-1.686369, 0.5995487, 0.9866474, 1, 1, 1, 1, 1,
-1.681779, 1.352426, 0.423287, 1, 1, 1, 1, 1,
-1.677951, 1.316772, 0.6493, 1, 1, 1, 1, 1,
-1.676373, -0.9700938, -2.105199, 1, 1, 1, 1, 1,
-1.671917, 0.3616904, -0.9584808, 1, 1, 1, 1, 1,
-1.665694, 1.192072, -0.3145798, 1, 1, 1, 1, 1,
-1.664894, -1.066873, -2.531922, 1, 1, 1, 1, 1,
-1.6639, -1.344805, -2.115604, 1, 1, 1, 1, 1,
-1.655084, 0.3496717, -1.742121, 1, 1, 1, 1, 1,
-1.632148, 0.5358661, -1.464385, 1, 1, 1, 1, 1,
-1.626512, -0.4229343, -1.668152, 1, 1, 1, 1, 1,
-1.621641, 0.03679122, -1.549727, 1, 1, 1, 1, 1,
-1.594971, -0.2281866, -0.7693875, 1, 1, 1, 1, 1,
-1.593301, -0.536247, -2.909224, 1, 1, 1, 1, 1,
-1.588855, 1.751439, -1.770597, 0, 0, 1, 1, 1,
-1.587846, -0.6332439, -1.507942, 1, 0, 0, 1, 1,
-1.58492, 1.177062, 0.5497811, 1, 0, 0, 1, 1,
-1.58045, -0.4585644, -1.801923, 1, 0, 0, 1, 1,
-1.571044, 1.48933, 0.3447739, 1, 0, 0, 1, 1,
-1.55803, 1.706972, -0.546695, 1, 0, 0, 1, 1,
-1.551163, -0.2872106, -0.8488063, 0, 0, 0, 1, 1,
-1.545731, 0.8910892, -0.6193892, 0, 0, 0, 1, 1,
-1.53375, 0.4361778, -0.1748802, 0, 0, 0, 1, 1,
-1.53338, 0.5314339, -1.211859, 0, 0, 0, 1, 1,
-1.531494, 1.19061, -0.3028081, 0, 0, 0, 1, 1,
-1.519262, -0.7162514, -1.372079, 0, 0, 0, 1, 1,
-1.512597, 1.420402, -0.7736531, 0, 0, 0, 1, 1,
-1.497876, 0.1320152, -2.109257, 1, 1, 1, 1, 1,
-1.497189, 0.5801748, -1.570347, 1, 1, 1, 1, 1,
-1.485627, 0.286863, -1.957697, 1, 1, 1, 1, 1,
-1.484545, 0.8671084, -1.062672, 1, 1, 1, 1, 1,
-1.476269, -1.010836, -1.159242, 1, 1, 1, 1, 1,
-1.469423, 0.213047, -1.3085, 1, 1, 1, 1, 1,
-1.455956, -2.110413, -1.467669, 1, 1, 1, 1, 1,
-1.448261, -0.09361159, -1.155538, 1, 1, 1, 1, 1,
-1.44638, -2.031435, -0.178881, 1, 1, 1, 1, 1,
-1.439839, -0.01144245, -1.549925, 1, 1, 1, 1, 1,
-1.436749, -0.1696202, -3.119375, 1, 1, 1, 1, 1,
-1.436072, -0.01734686, -2.453811, 1, 1, 1, 1, 1,
-1.435295, 0.2777819, -0.329282, 1, 1, 1, 1, 1,
-1.426556, 0.5525688, -0.7663928, 1, 1, 1, 1, 1,
-1.417504, 0.0005783185, -2.531646, 1, 1, 1, 1, 1,
-1.415553, -1.098163, -2.266201, 0, 0, 1, 1, 1,
-1.410831, 2.306214, -1.256743, 1, 0, 0, 1, 1,
-1.410337, 0.8021224, -1.757573, 1, 0, 0, 1, 1,
-1.404428, -0.006679508, -1.449219, 1, 0, 0, 1, 1,
-1.401672, -0.2309055, -3.332114, 1, 0, 0, 1, 1,
-1.397435, 0.7694734, 0.7334172, 1, 0, 0, 1, 1,
-1.379129, -0.2116728, -1.568084, 0, 0, 0, 1, 1,
-1.375657, 1.089673, -1.0316, 0, 0, 0, 1, 1,
-1.361852, 0.5344536, -0.5640011, 0, 0, 0, 1, 1,
-1.361171, -0.9625853, -3.725363, 0, 0, 0, 1, 1,
-1.359028, 0.2059409, -0.06979514, 0, 0, 0, 1, 1,
-1.341173, -1.172991, -3.357596, 0, 0, 0, 1, 1,
-1.338762, 0.4512394, -3.334026, 0, 0, 0, 1, 1,
-1.336134, 0.9466156, -0.09603886, 1, 1, 1, 1, 1,
-1.333476, -0.2907506, -2.156137, 1, 1, 1, 1, 1,
-1.326043, -0.4351598, -2.139426, 1, 1, 1, 1, 1,
-1.325513, -1.27491, -2.372054, 1, 1, 1, 1, 1,
-1.316566, -0.7493777, -2.807912, 1, 1, 1, 1, 1,
-1.300477, 0.5151062, -1.009202, 1, 1, 1, 1, 1,
-1.290574, -1.058407, -2.568822, 1, 1, 1, 1, 1,
-1.288834, -1.982892, -2.273654, 1, 1, 1, 1, 1,
-1.281276, -0.3758254, -1.754518, 1, 1, 1, 1, 1,
-1.277573, 0.1564829, -0.9240122, 1, 1, 1, 1, 1,
-1.270686, -0.0116134, -0.8971209, 1, 1, 1, 1, 1,
-1.268445, 1.940059, -0.3999711, 1, 1, 1, 1, 1,
-1.25686, -0.2789838, -1.708641, 1, 1, 1, 1, 1,
-1.248372, 2.530411, -1.852534, 1, 1, 1, 1, 1,
-1.247238, -1.226518, -3.871453, 1, 1, 1, 1, 1,
-1.246235, 1.160127, -0.4619165, 0, 0, 1, 1, 1,
-1.220381, -0.1212625, -2.418205, 1, 0, 0, 1, 1,
-1.215171, -0.8809576, 0.2282469, 1, 0, 0, 1, 1,
-1.211805, -1.514324, -3.197936, 1, 0, 0, 1, 1,
-1.210701, -0.7856841, -2.49061, 1, 0, 0, 1, 1,
-1.210401, -1.212594, -2.813598, 1, 0, 0, 1, 1,
-1.207033, -0.7800259, -0.8436494, 0, 0, 0, 1, 1,
-1.179754, 0.5883806, -0.9351885, 0, 0, 0, 1, 1,
-1.16881, 0.4633945, -1.746529, 0, 0, 0, 1, 1,
-1.166198, -1.288235, -3.507695, 0, 0, 0, 1, 1,
-1.162057, -0.81522, -3.172362, 0, 0, 0, 1, 1,
-1.158378, 0.7543449, -1.433108, 0, 0, 0, 1, 1,
-1.152869, 0.7966047, -0.6872315, 0, 0, 0, 1, 1,
-1.146652, 0.5599024, 0.860245, 1, 1, 1, 1, 1,
-1.139009, -0.7485751, -1.473011, 1, 1, 1, 1, 1,
-1.138819, 0.911518, -1.09758, 1, 1, 1, 1, 1,
-1.133871, 0.1537915, -0.4764127, 1, 1, 1, 1, 1,
-1.130334, 0.1708264, -1.597478, 1, 1, 1, 1, 1,
-1.113217, -1.324525, -1.876269, 1, 1, 1, 1, 1,
-1.109576, 0.9470114, 0.7125526, 1, 1, 1, 1, 1,
-1.109183, 0.2233581, -0.8428982, 1, 1, 1, 1, 1,
-1.108243, -0.5272296, -2.386796, 1, 1, 1, 1, 1,
-1.107959, -0.4169785, -0.6820208, 1, 1, 1, 1, 1,
-1.101461, -0.06978683, -1.050693, 1, 1, 1, 1, 1,
-1.100554, 0.8782946, -1.595393, 1, 1, 1, 1, 1,
-1.091163, 2.403567, 0.510225, 1, 1, 1, 1, 1,
-1.090454, 0.2536918, -1.456026, 1, 1, 1, 1, 1,
-1.080236, -0.8029699, -2.721439, 1, 1, 1, 1, 1,
-1.074509, -0.2100847, -2.231932, 0, 0, 1, 1, 1,
-1.0707, -1.318529, -1.391731, 1, 0, 0, 1, 1,
-1.068244, 1.615, -3.186296, 1, 0, 0, 1, 1,
-1.06524, 0.6405029, -1.475986, 1, 0, 0, 1, 1,
-1.064826, 0.792709, -0.3011568, 1, 0, 0, 1, 1,
-1.063269, 0.1665659, -1.373182, 1, 0, 0, 1, 1,
-1.06008, 1.458147, -0.8018491, 0, 0, 0, 1, 1,
-1.058819, -0.2636048, -0.2580394, 0, 0, 0, 1, 1,
-1.058754, 0.5800207, 0.634598, 0, 0, 0, 1, 1,
-1.05604, -1.703282, -0.3698978, 0, 0, 0, 1, 1,
-1.049668, -0.8226962, -4.799622, 0, 0, 0, 1, 1,
-1.044016, 1.166209, 0.04997088, 0, 0, 0, 1, 1,
-1.037313, 0.9643723, -0.6939076, 0, 0, 0, 1, 1,
-1.007963, -1.042142, -1.841063, 1, 1, 1, 1, 1,
-1.004414, 1.501746, 0.1565094, 1, 1, 1, 1, 1,
-1.004306, 1.403826, -0.5196738, 1, 1, 1, 1, 1,
-0.9992214, 1.066163, -1.76512, 1, 1, 1, 1, 1,
-0.9976232, -1.288775, -3.006368, 1, 1, 1, 1, 1,
-0.9960228, 0.2901251, -0.9672845, 1, 1, 1, 1, 1,
-0.9929236, 0.776456, 0.637836, 1, 1, 1, 1, 1,
-0.9850829, -0.6746169, -2.677973, 1, 1, 1, 1, 1,
-0.9796091, -0.4068632, -1.662401, 1, 1, 1, 1, 1,
-0.9702536, -0.1441082, -2.648181, 1, 1, 1, 1, 1,
-0.9655165, -0.8119941, -2.267848, 1, 1, 1, 1, 1,
-0.9648796, 0.05193008, -1.755351, 1, 1, 1, 1, 1,
-0.9569584, 0.1160184, -1.760322, 1, 1, 1, 1, 1,
-0.9535935, 0.5851556, -1.682028, 1, 1, 1, 1, 1,
-0.9478785, 0.362469, -3.391289, 1, 1, 1, 1, 1,
-0.9439056, 0.02175169, -2.013673, 0, 0, 1, 1, 1,
-0.9389334, 0.6235634, -1.74605, 1, 0, 0, 1, 1,
-0.9236206, 0.3477848, -1.400211, 1, 0, 0, 1, 1,
-0.9231652, -0.2491438, -3.127298, 1, 0, 0, 1, 1,
-0.9223654, -1.272157, -3.103899, 1, 0, 0, 1, 1,
-0.9214086, 0.6236874, 0.5344719, 1, 0, 0, 1, 1,
-0.9158983, 1.36581, -0.4584834, 0, 0, 0, 1, 1,
-0.9141145, -1.131585, -4.349047, 0, 0, 0, 1, 1,
-0.9073936, 0.143395, -1.794589, 0, 0, 0, 1, 1,
-0.9043413, 1.155925, -1.461188, 0, 0, 0, 1, 1,
-0.9011866, 2.025674, -2.083645, 0, 0, 0, 1, 1,
-0.9009731, -1.401484, -2.269719, 0, 0, 0, 1, 1,
-0.8959791, -1.147727, -3.63356, 0, 0, 0, 1, 1,
-0.8921047, -1.436853, -0.6664931, 1, 1, 1, 1, 1,
-0.886876, -0.5290712, -3.904013, 1, 1, 1, 1, 1,
-0.8860313, 0.1693521, -2.495812, 1, 1, 1, 1, 1,
-0.8843989, -1.499661, -2.144687, 1, 1, 1, 1, 1,
-0.8840007, 1.575088, -1.549232, 1, 1, 1, 1, 1,
-0.8825989, 0.731139, -2.505202, 1, 1, 1, 1, 1,
-0.8805023, 0.06370166, -3.608068, 1, 1, 1, 1, 1,
-0.8751863, -0.628025, -0.6085303, 1, 1, 1, 1, 1,
-0.8751261, -0.0002773809, -0.7720835, 1, 1, 1, 1, 1,
-0.8699969, 1.677953, -0.9255052, 1, 1, 1, 1, 1,
-0.8658243, -0.1953744, -2.018368, 1, 1, 1, 1, 1,
-0.8609197, -1.326028, -2.467177, 1, 1, 1, 1, 1,
-0.8548896, 0.6619877, 0.598971, 1, 1, 1, 1, 1,
-0.8531763, 0.1475051, -0.2087814, 1, 1, 1, 1, 1,
-0.8516669, -0.9356741, -3.168018, 1, 1, 1, 1, 1,
-0.850227, -0.9459277, -1.741226, 0, 0, 1, 1, 1,
-0.845093, -0.6637398, -4.090076, 1, 0, 0, 1, 1,
-0.8420338, -0.935858, -3.460802, 1, 0, 0, 1, 1,
-0.8418552, 0.6916682, -1.849625, 1, 0, 0, 1, 1,
-0.8357242, 1.589067, -1.817323, 1, 0, 0, 1, 1,
-0.8334165, 1.287497, -0.5006511, 1, 0, 0, 1, 1,
-0.8265867, -1.344608, -2.187955, 0, 0, 0, 1, 1,
-0.8240895, 1.866375, 0.7486621, 0, 0, 0, 1, 1,
-0.8199863, 1.561565, -1.019119, 0, 0, 0, 1, 1,
-0.8180832, -0.9753869, -0.8471844, 0, 0, 0, 1, 1,
-0.8117353, 0.6179025, -0.2339347, 0, 0, 0, 1, 1,
-0.8074728, 0.01195105, -1.321085, 0, 0, 0, 1, 1,
-0.8060333, -0.0610364, 0.008645767, 0, 0, 0, 1, 1,
-0.8042426, -0.8714861, -0.08339965, 1, 1, 1, 1, 1,
-0.804176, 1.916413, -0.9702439, 1, 1, 1, 1, 1,
-0.7984433, 0.1172588, -2.771457, 1, 1, 1, 1, 1,
-0.7894343, -0.9522961, -1.612594, 1, 1, 1, 1, 1,
-0.7867659, 0.2048443, -1.03218, 1, 1, 1, 1, 1,
-0.7867296, 2.051825, -0.9373868, 1, 1, 1, 1, 1,
-0.7853425, 0.9052761, -0.8704312, 1, 1, 1, 1, 1,
-0.7838898, 0.166642, -1.819843, 1, 1, 1, 1, 1,
-0.7760556, 1.964627, -1.946492, 1, 1, 1, 1, 1,
-0.7699106, 0.292471, -1.745995, 1, 1, 1, 1, 1,
-0.7632706, 1.906788, 0.2769141, 1, 1, 1, 1, 1,
-0.7605538, -1.10983, -3.687678, 1, 1, 1, 1, 1,
-0.7538283, 0.3089642, -1.024975, 1, 1, 1, 1, 1,
-0.7514607, 0.06867057, -0.6737514, 1, 1, 1, 1, 1,
-0.7424476, 0.4641404, 0.08785692, 1, 1, 1, 1, 1,
-0.7373772, -0.2885475, -1.288089, 0, 0, 1, 1, 1,
-0.7355072, -1.485223, -2.376055, 1, 0, 0, 1, 1,
-0.7275696, -0.6391295, -3.236545, 1, 0, 0, 1, 1,
-0.7250625, -0.2315767, -4.016047, 1, 0, 0, 1, 1,
-0.7211074, -1.457178, -1.335854, 1, 0, 0, 1, 1,
-0.7177538, -0.6179494, -2.485508, 1, 0, 0, 1, 1,
-0.7154863, 0.9148319, -1.896348, 0, 0, 0, 1, 1,
-0.7149633, -0.04740054, -1.332947, 0, 0, 0, 1, 1,
-0.7108741, 1.184454, -1.074545, 0, 0, 0, 1, 1,
-0.7069167, -0.1233421, -1.735383, 0, 0, 0, 1, 1,
-0.705609, -0.5990388, -1.856464, 0, 0, 0, 1, 1,
-0.7037542, 0.279094, -0.4557762, 0, 0, 0, 1, 1,
-0.7022473, -1.885684, -2.401561, 0, 0, 0, 1, 1,
-0.7008696, 0.08464436, -2.15286, 1, 1, 1, 1, 1,
-0.7003543, -0.3607352, -1.792377, 1, 1, 1, 1, 1,
-0.6915661, -0.3761291, -2.954621, 1, 1, 1, 1, 1,
-0.6858754, 0.480533, -1.428709, 1, 1, 1, 1, 1,
-0.6768871, -0.2859513, -0.9960093, 1, 1, 1, 1, 1,
-0.6742745, 1.053187, -2.550646, 1, 1, 1, 1, 1,
-0.6737274, 1.950627, 0.2390373, 1, 1, 1, 1, 1,
-0.6640639, 1.170963, 0.34694, 1, 1, 1, 1, 1,
-0.6591648, -0.02209736, -1.879774, 1, 1, 1, 1, 1,
-0.6588399, 0.1797889, -1.287274, 1, 1, 1, 1, 1,
-0.6545449, -0.6179408, -4.292093, 1, 1, 1, 1, 1,
-0.65097, -0.9210123, -3.160805, 1, 1, 1, 1, 1,
-0.6501818, 1.866249, -2.335739, 1, 1, 1, 1, 1,
-0.6489416, 0.2468321, -1.150614, 1, 1, 1, 1, 1,
-0.6479517, -0.05340873, -1.594072, 1, 1, 1, 1, 1,
-0.645384, -0.04027789, -1.667354, 0, 0, 1, 1, 1,
-0.6453073, 0.3277954, -2.248764, 1, 0, 0, 1, 1,
-0.6446533, 0.6214176, -0.6663227, 1, 0, 0, 1, 1,
-0.6398672, -1.214351, -1.963456, 1, 0, 0, 1, 1,
-0.6385289, -0.1314865, -1.762122, 1, 0, 0, 1, 1,
-0.6370925, 0.611859, -2.52029, 1, 0, 0, 1, 1,
-0.6370069, -2.219122, -2.771013, 0, 0, 0, 1, 1,
-0.6325806, 0.3092578, 0.5904891, 0, 0, 0, 1, 1,
-0.6311369, -0.3869286, -2.716661, 0, 0, 0, 1, 1,
-0.6274269, 0.2381394, -2.201912, 0, 0, 0, 1, 1,
-0.6233011, -0.7094152, -2.813854, 0, 0, 0, 1, 1,
-0.6221942, -1.150904, -3.208054, 0, 0, 0, 1, 1,
-0.6166922, -0.6906051, -0.5814173, 0, 0, 0, 1, 1,
-0.6117249, -0.132937, -1.408306, 1, 1, 1, 1, 1,
-0.6036675, -2.169296, -3.437052, 1, 1, 1, 1, 1,
-0.6029096, 0.7619026, -0.3902856, 1, 1, 1, 1, 1,
-0.6028807, -0.9829105, -2.760462, 1, 1, 1, 1, 1,
-0.5939884, -0.02056759, -0.747484, 1, 1, 1, 1, 1,
-0.5933691, -0.2367174, -1.087767, 1, 1, 1, 1, 1,
-0.5885819, -1.398971, -3.534873, 1, 1, 1, 1, 1,
-0.5879694, 0.4314156, -0.8733636, 1, 1, 1, 1, 1,
-0.5820546, 0.3974641, -0.9279586, 1, 1, 1, 1, 1,
-0.5754457, 0.02493108, -0.6772094, 1, 1, 1, 1, 1,
-0.5752509, -0.3235859, -3.091707, 1, 1, 1, 1, 1,
-0.5725501, -0.8272068, -4.186001, 1, 1, 1, 1, 1,
-0.5694302, -0.909685, -1.525641, 1, 1, 1, 1, 1,
-0.5671515, 1.276138, -1.457529, 1, 1, 1, 1, 1,
-0.5658599, 1.166348, 0.7055352, 1, 1, 1, 1, 1,
-0.5636538, 1.331811, -2.112543, 0, 0, 1, 1, 1,
-0.5496695, 1.565309, -0.4224748, 1, 0, 0, 1, 1,
-0.5429813, -1.018775, -4.449161, 1, 0, 0, 1, 1,
-0.5425107, 0.345571, 1.237282, 1, 0, 0, 1, 1,
-0.5340678, -0.2989237, -2.315612, 1, 0, 0, 1, 1,
-0.5286754, 0.7302298, -0.713914, 1, 0, 0, 1, 1,
-0.5276433, -0.6777961, -2.530946, 0, 0, 0, 1, 1,
-0.5176489, -0.7509691, -2.161417, 0, 0, 0, 1, 1,
-0.5158672, 0.0422451, -1.863085, 0, 0, 0, 1, 1,
-0.5095544, 1.057915, 0.7658659, 0, 0, 0, 1, 1,
-0.5092772, -0.5920245, -2.79319, 0, 0, 0, 1, 1,
-0.5088292, -0.4422828, -3.234818, 0, 0, 0, 1, 1,
-0.5045196, -0.191043, -1.935186, 0, 0, 0, 1, 1,
-0.4923037, 1.149828, -0.3271039, 1, 1, 1, 1, 1,
-0.4874227, 0.8018416, 0.4197205, 1, 1, 1, 1, 1,
-0.4860221, -1.412165, -4.046272, 1, 1, 1, 1, 1,
-0.4832181, 0.3758319, -0.5349841, 1, 1, 1, 1, 1,
-0.482068, 0.5823315, -1.23563, 1, 1, 1, 1, 1,
-0.4815922, 0.7161843, 0.5671271, 1, 1, 1, 1, 1,
-0.4801277, -0.8564631, -3.453668, 1, 1, 1, 1, 1,
-0.4777281, 0.4811455, -0.7204285, 1, 1, 1, 1, 1,
-0.4721967, -1.568973, -3.605383, 1, 1, 1, 1, 1,
-0.4678347, 1.134172, -0.6694742, 1, 1, 1, 1, 1,
-0.4669023, 0.1701802, -2.409165, 1, 1, 1, 1, 1,
-0.4664346, 0.1643909, -0.5604201, 1, 1, 1, 1, 1,
-0.4659081, 0.5391099, -2.032764, 1, 1, 1, 1, 1,
-0.4645227, -1.076219, -3.203773, 1, 1, 1, 1, 1,
-0.463398, 0.8398697, -0.0861263, 1, 1, 1, 1, 1,
-0.4608441, -0.4035548, -2.925534, 0, 0, 1, 1, 1,
-0.4591542, -0.9292218, -3.80945, 1, 0, 0, 1, 1,
-0.4574924, 0.7621938, -0.2769465, 1, 0, 0, 1, 1,
-0.4541648, 0.2032416, -0.5914908, 1, 0, 0, 1, 1,
-0.4515674, -1.116003, -2.241424, 1, 0, 0, 1, 1,
-0.4511774, -1.01516, -1.911081, 1, 0, 0, 1, 1,
-0.4489351, -0.3500326, -2.791642, 0, 0, 0, 1, 1,
-0.4411107, 0.2275225, -2.347378, 0, 0, 0, 1, 1,
-0.4397397, -0.7105323, -3.766871, 0, 0, 0, 1, 1,
-0.4390983, -0.8894036, -0.01359244, 0, 0, 0, 1, 1,
-0.4390539, -0.1336594, -2.931367, 0, 0, 0, 1, 1,
-0.43894, -0.4536544, -2.009142, 0, 0, 0, 1, 1,
-0.4372598, 0.2201644, -2.026518, 0, 0, 0, 1, 1,
-0.436505, -1.193956, -5.159101, 1, 1, 1, 1, 1,
-0.4330285, -1.084222, -3.135315, 1, 1, 1, 1, 1,
-0.4243873, -0.03199005, -0.9564416, 1, 1, 1, 1, 1,
-0.4215046, 0.6297275, -1.558222, 1, 1, 1, 1, 1,
-0.4213995, -1.259176, -2.46796, 1, 1, 1, 1, 1,
-0.4154102, -0.9296286, -0.159279, 1, 1, 1, 1, 1,
-0.4085944, 1.023708, -1.414585, 1, 1, 1, 1, 1,
-0.4058481, 2.985787, -0.2576225, 1, 1, 1, 1, 1,
-0.4035888, 0.3547475, -0.5542498, 1, 1, 1, 1, 1,
-0.402609, -0.2072061, -1.292389, 1, 1, 1, 1, 1,
-0.3984107, -2.780583, -3.271776, 1, 1, 1, 1, 1,
-0.3949417, -1.10887, -3.315891, 1, 1, 1, 1, 1,
-0.3880275, -3.482317, -0.8208083, 1, 1, 1, 1, 1,
-0.3850644, -1.101658, -1.825843, 1, 1, 1, 1, 1,
-0.3789243, 0.4152538, -2.486661, 1, 1, 1, 1, 1,
-0.3739242, 0.7054103, -1.794968, 0, 0, 1, 1, 1,
-0.372223, 0.5355844, 1.33941, 1, 0, 0, 1, 1,
-0.3694025, 1.508092, -0.2547337, 1, 0, 0, 1, 1,
-0.3663426, 0.8438153, 0.2335075, 1, 0, 0, 1, 1,
-0.3623743, 0.03183271, 0.005408747, 1, 0, 0, 1, 1,
-0.3618119, 0.2819316, 0.2367031, 1, 0, 0, 1, 1,
-0.36054, 0.5675133, 0.1004381, 0, 0, 0, 1, 1,
-0.3603272, -1.662549, -3.81499, 0, 0, 0, 1, 1,
-0.3573434, 1.065447, -0.27863, 0, 0, 0, 1, 1,
-0.3562418, 0.4122139, -3.345624, 0, 0, 0, 1, 1,
-0.3553873, -0.0740949, 0.221848, 0, 0, 0, 1, 1,
-0.3524564, 1.233751, -0.5259284, 0, 0, 0, 1, 1,
-0.3521796, -0.4461318, -2.916416, 0, 0, 0, 1, 1,
-0.351742, -0.5577796, -0.9614927, 1, 1, 1, 1, 1,
-0.3478366, 0.3326337, -0.8633841, 1, 1, 1, 1, 1,
-0.3429404, 0.3490799, -0.9585595, 1, 1, 1, 1, 1,
-0.3417142, -0.3583306, -1.281193, 1, 1, 1, 1, 1,
-0.3391185, 2.160221, 0.5715579, 1, 1, 1, 1, 1,
-0.3367563, -0.9975663, -2.861633, 1, 1, 1, 1, 1,
-0.3363912, -1.003933, -1.251017, 1, 1, 1, 1, 1,
-0.3363689, 0.3221611, -0.09553993, 1, 1, 1, 1, 1,
-0.3322275, 0.1435311, -1.687011, 1, 1, 1, 1, 1,
-0.3308671, -2.281976, -2.823122, 1, 1, 1, 1, 1,
-0.3282305, -0.1071368, -2.679403, 1, 1, 1, 1, 1,
-0.3257894, -0.1685164, -1.028832, 1, 1, 1, 1, 1,
-0.3221133, 0.2173586, -1.234618, 1, 1, 1, 1, 1,
-0.3220418, -0.3570149, -3.491345, 1, 1, 1, 1, 1,
-0.3206322, 1.004295, 2.009031, 1, 1, 1, 1, 1,
-0.3163334, -0.4723946, -2.900435, 0, 0, 1, 1, 1,
-0.3145351, -0.003146701, -2.506574, 1, 0, 0, 1, 1,
-0.3059877, -1.466242, -3.489645, 1, 0, 0, 1, 1,
-0.3041753, -0.4374537, -2.429435, 1, 0, 0, 1, 1,
-0.3027986, 0.1759803, -0.9526314, 1, 0, 0, 1, 1,
-0.2899825, -0.004779011, -1.624083, 1, 0, 0, 1, 1,
-0.2835767, -0.5759915, -3.260886, 0, 0, 0, 1, 1,
-0.282765, 1.451034, -1.134634, 0, 0, 0, 1, 1,
-0.2811837, 2.400002, -0.4241147, 0, 0, 0, 1, 1,
-0.2791926, 0.959996, 1.183054, 0, 0, 0, 1, 1,
-0.2744172, 0.2659751, -1.406324, 0, 0, 0, 1, 1,
-0.2729394, 0.5928727, -0.4507618, 0, 0, 0, 1, 1,
-0.2644676, 0.2084011, 0.2894786, 0, 0, 0, 1, 1,
-0.2636096, -0.06124686, -0.5820312, 1, 1, 1, 1, 1,
-0.2628345, -1.557316, -2.927989, 1, 1, 1, 1, 1,
-0.2508826, 1.424563, -0.570461, 1, 1, 1, 1, 1,
-0.2505518, 0.07045355, -1.831245, 1, 1, 1, 1, 1,
-0.2504748, 2.254341, 0.6467432, 1, 1, 1, 1, 1,
-0.2494734, -1.030832, -2.323251, 1, 1, 1, 1, 1,
-0.2487369, -0.2026384, -3.604293, 1, 1, 1, 1, 1,
-0.2487224, 0.8481908, 0.03337567, 1, 1, 1, 1, 1,
-0.2483518, -0.5849708, -1.407101, 1, 1, 1, 1, 1,
-0.2444038, -0.02099255, -1.966892, 1, 1, 1, 1, 1,
-0.2419868, -0.6700098, -3.934887, 1, 1, 1, 1, 1,
-0.2413117, -0.7809093, -3.397063, 1, 1, 1, 1, 1,
-0.2381445, 0.1389555, -3.072801, 1, 1, 1, 1, 1,
-0.2371234, 0.7337197, 1.139683, 1, 1, 1, 1, 1,
-0.2368345, -0.2157563, -3.458766, 1, 1, 1, 1, 1,
-0.232949, -0.1073323, -0.6248451, 0, 0, 1, 1, 1,
-0.2319429, 1.352369, 1.133328, 1, 0, 0, 1, 1,
-0.2280213, -0.1359871, -2.681099, 1, 0, 0, 1, 1,
-0.2263087, 0.7553175, -0.308116, 1, 0, 0, 1, 1,
-0.2235247, 0.3159552, 0.0573026, 1, 0, 0, 1, 1,
-0.220951, -1.254648, -3.087044, 1, 0, 0, 1, 1,
-0.2171572, 1.25937, 0.3242148, 0, 0, 0, 1, 1,
-0.2141071, 0.6489698, 0.5003044, 0, 0, 0, 1, 1,
-0.2106279, 0.6309718, -1.203807, 0, 0, 0, 1, 1,
-0.2094443, -0.8421755, -2.602774, 0, 0, 0, 1, 1,
-0.2080137, -0.4203164, -1.759224, 0, 0, 0, 1, 1,
-0.2072484, -0.7917374, -3.873586, 0, 0, 0, 1, 1,
-0.204846, -0.3317441, -2.556279, 0, 0, 0, 1, 1,
-0.202244, 0.6318264, -0.8546324, 1, 1, 1, 1, 1,
-0.201487, -1.693739, -2.858089, 1, 1, 1, 1, 1,
-0.2013789, -0.695657, -2.8735, 1, 1, 1, 1, 1,
-0.1995019, 1.483421, -0.214105, 1, 1, 1, 1, 1,
-0.1976837, 0.7437245, 0.8824836, 1, 1, 1, 1, 1,
-0.1973464, 1.318154, 1.559006, 1, 1, 1, 1, 1,
-0.1956067, -1.529087, -2.195446, 1, 1, 1, 1, 1,
-0.195577, 0.1210619, 0.5320898, 1, 1, 1, 1, 1,
-0.1937423, -0.2378433, -3.046125, 1, 1, 1, 1, 1,
-0.1913512, -0.4542067, -3.968425, 1, 1, 1, 1, 1,
-0.189103, 1.106863, 1.339619, 1, 1, 1, 1, 1,
-0.185365, -1.46015, -2.429833, 1, 1, 1, 1, 1,
-0.1835183, 1.034831, -1.22471, 1, 1, 1, 1, 1,
-0.1829765, -0.8780662, -2.052644, 1, 1, 1, 1, 1,
-0.1710021, -0.5986985, -2.639665, 1, 1, 1, 1, 1,
-0.1707818, 0.6596053, -0.4014788, 0, 0, 1, 1, 1,
-0.1688692, -1.154592, -3.14625, 1, 0, 0, 1, 1,
-0.1673878, -0.342081, -1.46401, 1, 0, 0, 1, 1,
-0.1617504, 1.341235, 0.1242426, 1, 0, 0, 1, 1,
-0.1587827, -1.224544, -3.435514, 1, 0, 0, 1, 1,
-0.1559811, -1.116876, -2.758066, 1, 0, 0, 1, 1,
-0.1483851, -1.373677, -1.657484, 0, 0, 0, 1, 1,
-0.1415736, 0.8840379, 0.3779464, 0, 0, 0, 1, 1,
-0.1400195, -1.193751, -2.843762, 0, 0, 0, 1, 1,
-0.1397144, 0.06730064, -0.5547305, 0, 0, 0, 1, 1,
-0.1378087, -0.1800918, -3.31881, 0, 0, 0, 1, 1,
-0.1363208, -1.241789, -3.439602, 0, 0, 0, 1, 1,
-0.1351529, -1.663057, -4.050558, 0, 0, 0, 1, 1,
-0.1347031, 0.2276328, 0.3408926, 1, 1, 1, 1, 1,
-0.1339974, 2.185607, -1.148435, 1, 1, 1, 1, 1,
-0.1313651, 1.179601, 0.09960457, 1, 1, 1, 1, 1,
-0.1240677, 0.3327409, 0.2741375, 1, 1, 1, 1, 1,
-0.1223326, 0.7729875, 0.2925609, 1, 1, 1, 1, 1,
-0.1200669, 1.570824, 0.4188825, 1, 1, 1, 1, 1,
-0.1191043, -0.3988383, -3.626776, 1, 1, 1, 1, 1,
-0.1183242, -0.4832706, -4.402638, 1, 1, 1, 1, 1,
-0.1170707, 0.6043755, 0.6285337, 1, 1, 1, 1, 1,
-0.1157711, -0.7582132, -3.497292, 1, 1, 1, 1, 1,
-0.1131512, -1.432468, -2.936547, 1, 1, 1, 1, 1,
-0.1124209, -1.796239, -1.300645, 1, 1, 1, 1, 1,
-0.1121906, 0.02274601, -3.599907, 1, 1, 1, 1, 1,
-0.1118801, -0.2968118, -1.312154, 1, 1, 1, 1, 1,
-0.1071747, -0.1577398, -1.12295, 1, 1, 1, 1, 1,
-0.1017485, 0.1017251, 0.6117097, 0, 0, 1, 1, 1,
-0.1009073, 0.05366277, -1.277141, 1, 0, 0, 1, 1,
-0.1006941, -0.528976, -3.051527, 1, 0, 0, 1, 1,
-0.09732032, 0.3992672, 0.1611337, 1, 0, 0, 1, 1,
-0.09523193, -0.04062825, -2.521113, 1, 0, 0, 1, 1,
-0.08973669, 0.07200982, 0.6736439, 1, 0, 0, 1, 1,
-0.08521581, 0.8890587, 0.3622889, 0, 0, 0, 1, 1,
-0.08420628, 1.894452, 0.3771239, 0, 0, 0, 1, 1,
-0.08249673, -1.149452, -3.54053, 0, 0, 0, 1, 1,
-0.08237538, -1.322455, -4.123393, 0, 0, 0, 1, 1,
-0.08169272, 1.092804, 0.5092502, 0, 0, 0, 1, 1,
-0.0791144, -1.515349, -5.373129, 0, 0, 0, 1, 1,
-0.07506969, -1.047652, -3.51207, 0, 0, 0, 1, 1,
-0.07401258, -1.143559, -1.817151, 1, 1, 1, 1, 1,
-0.07194357, 1.020502, -1.536049, 1, 1, 1, 1, 1,
-0.0697585, 0.5220451, 0.4705308, 1, 1, 1, 1, 1,
-0.06880276, 0.1522629, 0.6977651, 1, 1, 1, 1, 1,
-0.06825162, 0.4410456, -1.386669, 1, 1, 1, 1, 1,
-0.06739402, -0.136809, -3.397654, 1, 1, 1, 1, 1,
-0.06736498, -0.2318487, -3.020325, 1, 1, 1, 1, 1,
-0.06335903, 0.9509619, 0.532993, 1, 1, 1, 1, 1,
-0.0606963, 2.206058, -0.03053591, 1, 1, 1, 1, 1,
-0.0591789, -0.936864, -1.588799, 1, 1, 1, 1, 1,
-0.05346628, 0.8909732, 0.2034438, 1, 1, 1, 1, 1,
-0.0472051, 0.4187648, -0.6977373, 1, 1, 1, 1, 1,
-0.04017957, 0.991098, 0.220481, 1, 1, 1, 1, 1,
-0.04010056, -1.14583, -3.688617, 1, 1, 1, 1, 1,
-0.03765612, -0.4402657, -2.138277, 1, 1, 1, 1, 1,
-0.03666139, 0.1435703, -0.6218484, 0, 0, 1, 1, 1,
-0.02888608, 0.4458389, -1.023334, 1, 0, 0, 1, 1,
-0.02865743, 1.499031, 0.6066223, 1, 0, 0, 1, 1,
-0.02377944, 0.3388684, -0.9987411, 1, 0, 0, 1, 1,
-0.02339339, 0.8321873, -0.1425799, 1, 0, 0, 1, 1,
-0.02224441, 0.2926109, -0.9947795, 1, 0, 0, 1, 1,
-0.02214834, 0.2283656, 1.528916, 0, 0, 0, 1, 1,
-0.02031156, -1.454402, -4.295162, 0, 0, 0, 1, 1,
-0.01662142, 1.033002, 2.126468, 0, 0, 0, 1, 1,
-0.01506871, -2.057425, -2.225891, 0, 0, 0, 1, 1,
-0.01361935, -1.331608, -2.712548, 0, 0, 0, 1, 1,
-0.01175652, 1.598888, -0.4119666, 0, 0, 0, 1, 1,
-0.003393678, -0.5675493, -2.922468, 0, 0, 0, 1, 1,
-0.001362761, -1.870622, -2.544583, 1, 1, 1, 1, 1,
0.0003098334, 0.8223594, -0.1464399, 1, 1, 1, 1, 1,
0.005439966, -0.8878738, 3.214906, 1, 1, 1, 1, 1,
0.01643914, 0.6959916, 0.8074774, 1, 1, 1, 1, 1,
0.0175687, -0.3904573, 2.874637, 1, 1, 1, 1, 1,
0.02485955, 0.5035339, 0.6040146, 1, 1, 1, 1, 1,
0.02572115, -0.5368959, 0.9666325, 1, 1, 1, 1, 1,
0.02582709, -0.5984319, 3.061947, 1, 1, 1, 1, 1,
0.02679229, -0.1568656, 3.067616, 1, 1, 1, 1, 1,
0.02945239, 0.2874145, -1.163366, 1, 1, 1, 1, 1,
0.03665871, -0.6049924, 3.162925, 1, 1, 1, 1, 1,
0.03907862, 0.3509524, -0.9797682, 1, 1, 1, 1, 1,
0.03910973, 0.9455175, -1.593868, 1, 1, 1, 1, 1,
0.04028443, 0.8656664, 1.226846, 1, 1, 1, 1, 1,
0.04236593, 0.1987719, -0.2723875, 1, 1, 1, 1, 1,
0.04334069, -0.7540435, 4.744946, 0, 0, 1, 1, 1,
0.04450221, 1.46606, 0.1858225, 1, 0, 0, 1, 1,
0.04675106, -1.29941, 3.217211, 1, 0, 0, 1, 1,
0.05179449, -0.6633342, 3.483856, 1, 0, 0, 1, 1,
0.05646506, 0.6663026, -0.5087134, 1, 0, 0, 1, 1,
0.05823028, -0.6335609, 3.404629, 1, 0, 0, 1, 1,
0.05845145, -1.696305, 3.371284, 0, 0, 0, 1, 1,
0.059108, -1.646992, 2.705812, 0, 0, 0, 1, 1,
0.0615155, -0.7895689, 2.353169, 0, 0, 0, 1, 1,
0.06468245, -1.638822, 0.5619648, 0, 0, 0, 1, 1,
0.06870469, -0.3167794, 2.535264, 0, 0, 0, 1, 1,
0.06901937, 1.228371, 0.2335133, 0, 0, 0, 1, 1,
0.07144105, -0.846988, 0.8420942, 0, 0, 0, 1, 1,
0.0781211, -0.193222, 1.848655, 1, 1, 1, 1, 1,
0.07956947, 0.2888138, -0.5967063, 1, 1, 1, 1, 1,
0.07961488, 1.553594, -1.114169, 1, 1, 1, 1, 1,
0.08044701, -0.6883361, 4.091718, 1, 1, 1, 1, 1,
0.08339695, -0.1572814, 2.70537, 1, 1, 1, 1, 1,
0.08494099, 1.97916, 1.573366, 1, 1, 1, 1, 1,
0.08750157, 1.068801, 0.692057, 1, 1, 1, 1, 1,
0.09117922, 0.1574522, 1.672611, 1, 1, 1, 1, 1,
0.09277857, 1.043398, 0.03536179, 1, 1, 1, 1, 1,
0.09297869, -0.1797363, 3.695923, 1, 1, 1, 1, 1,
0.09366383, 0.4076337, 0.3305708, 1, 1, 1, 1, 1,
0.095306, -1.569586, 1.241154, 1, 1, 1, 1, 1,
0.1028929, -0.02567161, 0.2669171, 1, 1, 1, 1, 1,
0.1072991, -1.128068, 3.758759, 1, 1, 1, 1, 1,
0.1101672, -0.8137366, 0.6759725, 1, 1, 1, 1, 1,
0.111536, 1.311096, -0.6944213, 0, 0, 1, 1, 1,
0.1122531, 0.7319192, 1.270475, 1, 0, 0, 1, 1,
0.1134197, -1.173438, 4.008502, 1, 0, 0, 1, 1,
0.1136233, 0.001740545, 1.736544, 1, 0, 0, 1, 1,
0.1137755, -0.7304512, 2.702711, 1, 0, 0, 1, 1,
0.1161321, -1.242814, 3.6344, 1, 0, 0, 1, 1,
0.1162627, 0.1441042, -0.4120132, 0, 0, 0, 1, 1,
0.119437, -1.459682, 2.071111, 0, 0, 0, 1, 1,
0.1269606, -0.0507904, 2.223527, 0, 0, 0, 1, 1,
0.1389229, -0.773248, 2.048711, 0, 0, 0, 1, 1,
0.1409728, 1.603583, 0.7202815, 0, 0, 0, 1, 1,
0.1411241, 0.8826762, 0.1588384, 0, 0, 0, 1, 1,
0.145148, -0.07778095, 1.43229, 0, 0, 0, 1, 1,
0.1463661, -0.2025709, 1.280254, 1, 1, 1, 1, 1,
0.149813, 1.726199, -0.3559653, 1, 1, 1, 1, 1,
0.1503264, 0.5993249, 0.2296396, 1, 1, 1, 1, 1,
0.1518933, -0.1628397, 1.286632, 1, 1, 1, 1, 1,
0.1548997, -0.5405513, 1.247551, 1, 1, 1, 1, 1,
0.1556312, 1.382418, -1.533517, 1, 1, 1, 1, 1,
0.1590531, -0.9178554, 3.088466, 1, 1, 1, 1, 1,
0.159261, 0.3298395, 0.4101658, 1, 1, 1, 1, 1,
0.1626448, 0.8725094, -0.2343792, 1, 1, 1, 1, 1,
0.1659955, 0.4079631, 0.2837499, 1, 1, 1, 1, 1,
0.1675043, 0.5746287, 1.19834, 1, 1, 1, 1, 1,
0.1698651, -1.513841, 3.19791, 1, 1, 1, 1, 1,
0.1720583, -0.1545231, 1.981645, 1, 1, 1, 1, 1,
0.1801056, 0.3803472, -0.1911159, 1, 1, 1, 1, 1,
0.1865555, -0.6138608, 3.412009, 1, 1, 1, 1, 1,
0.1895117, -1.600438, 4.896016, 0, 0, 1, 1, 1,
0.1898642, -2.709249, 3.326098, 1, 0, 0, 1, 1,
0.1932072, -1.120031, 2.893937, 1, 0, 0, 1, 1,
0.1940802, 0.7785278, 0.3525836, 1, 0, 0, 1, 1,
0.1986077, -0.3624034, 3.076133, 1, 0, 0, 1, 1,
0.1990043, -0.1689825, 3.095702, 1, 0, 0, 1, 1,
0.2007296, 0.3740324, -0.5578246, 0, 0, 0, 1, 1,
0.2013935, 0.5240642, 0.4025991, 0, 0, 0, 1, 1,
0.2022065, 0.1361321, 2.011244, 0, 0, 0, 1, 1,
0.2026497, 0.7996336, 1.451205, 0, 0, 0, 1, 1,
0.2026611, 1.126066, -1.289079, 0, 0, 0, 1, 1,
0.2079382, 0.4535998, 1.777507, 0, 0, 0, 1, 1,
0.2103805, -1.039356, 2.400453, 0, 0, 0, 1, 1,
0.2115378, -0.428515, 2.037445, 1, 1, 1, 1, 1,
0.2124443, 0.2491021, 0.9180917, 1, 1, 1, 1, 1,
0.2143952, 0.1323518, 1.613858, 1, 1, 1, 1, 1,
0.2172889, -0.8561934, 2.042952, 1, 1, 1, 1, 1,
0.2205172, 1.478625, 0.1624919, 1, 1, 1, 1, 1,
0.2209924, -0.3650522, 1.056801, 1, 1, 1, 1, 1,
0.2248336, 0.9473238, -0.06432427, 1, 1, 1, 1, 1,
0.2257541, 0.09874439, 0.6144111, 1, 1, 1, 1, 1,
0.2258453, 0.0879399, 0.4476134, 1, 1, 1, 1, 1,
0.2264277, 0.8313901, 1.006817, 1, 1, 1, 1, 1,
0.2304317, -0.08925265, 0.7503478, 1, 1, 1, 1, 1,
0.2312469, -0.3245124, 2.033864, 1, 1, 1, 1, 1,
0.2390714, -2.266732, 3.028894, 1, 1, 1, 1, 1,
0.2443368, 0.1443559, -0.06076451, 1, 1, 1, 1, 1,
0.2443419, -0.8540061, 3.023904, 1, 1, 1, 1, 1,
0.2524643, 0.4271917, 1.253384, 0, 0, 1, 1, 1,
0.2529896, -1.302664, 3.396993, 1, 0, 0, 1, 1,
0.2561024, -1.128171, 1.365921, 1, 0, 0, 1, 1,
0.2564337, 0.4577675, 1.147258, 1, 0, 0, 1, 1,
0.2566164, -0.3885126, 3.638011, 1, 0, 0, 1, 1,
0.2623726, 0.5992478, 0.3297448, 1, 0, 0, 1, 1,
0.264808, 0.3426233, 3.112275, 0, 0, 0, 1, 1,
0.2653262, 1.41382, 0.9336434, 0, 0, 0, 1, 1,
0.2716112, -0.1111729, 1.556194, 0, 0, 0, 1, 1,
0.2768266, -0.4070311, 1.932606, 0, 0, 0, 1, 1,
0.280698, -1.027642, 4.260133, 0, 0, 0, 1, 1,
0.2843834, 1.444415, 1.955179, 0, 0, 0, 1, 1,
0.2847814, 1.200902, 1.187418, 0, 0, 0, 1, 1,
0.2867976, -0.9369214, 4.230716, 1, 1, 1, 1, 1,
0.2870269, -0.3504065, 2.582537, 1, 1, 1, 1, 1,
0.2875881, -2.290641, 2.840454, 1, 1, 1, 1, 1,
0.2884642, 1.790566, 1.100796, 1, 1, 1, 1, 1,
0.2919609, -1.504866, 2.208934, 1, 1, 1, 1, 1,
0.2925968, -0.8617861, 3.832974, 1, 1, 1, 1, 1,
0.293404, -1.038889, 2.783136, 1, 1, 1, 1, 1,
0.2937844, -0.3041857, 3.143115, 1, 1, 1, 1, 1,
0.294227, 2.141011, 0.3165128, 1, 1, 1, 1, 1,
0.294502, 1.269106, -0.05692084, 1, 1, 1, 1, 1,
0.2961065, 0.3041709, 1.806535, 1, 1, 1, 1, 1,
0.2981543, -0.2854961, 1.572283, 1, 1, 1, 1, 1,
0.3000042, 1.26421, 0.1723357, 1, 1, 1, 1, 1,
0.3021446, 0.7492654, 0.9991539, 1, 1, 1, 1, 1,
0.3045358, -0.4783116, 2.856668, 1, 1, 1, 1, 1,
0.3054824, 0.3176888, 1.612512, 0, 0, 1, 1, 1,
0.3058572, -0.8190904, 2.924441, 1, 0, 0, 1, 1,
0.3067406, 0.2857477, 1.792781, 1, 0, 0, 1, 1,
0.3074821, -0.2828095, 2.51423, 1, 0, 0, 1, 1,
0.3118617, 0.4835162, 1.561911, 1, 0, 0, 1, 1,
0.3142262, 0.07549933, 1.434699, 1, 0, 0, 1, 1,
0.3148022, 0.3083744, 1.509253, 0, 0, 0, 1, 1,
0.3167039, -0.3685591, 1.328545, 0, 0, 0, 1, 1,
0.3199119, 1.629801, -0.1383403, 0, 0, 0, 1, 1,
0.3211394, 0.2742037, 0.9008826, 0, 0, 0, 1, 1,
0.322057, -0.5213937, 1.244977, 0, 0, 0, 1, 1,
0.3240453, 0.03343448, 2.30961, 0, 0, 0, 1, 1,
0.328317, -1.729237, 3.149695, 0, 0, 0, 1, 1,
0.3292245, 0.4899819, -0.7206786, 1, 1, 1, 1, 1,
0.3363439, 0.761374, 1.351702, 1, 1, 1, 1, 1,
0.3367503, 1.607087, 0.1313358, 1, 1, 1, 1, 1,
0.3518621, 0.3869465, 1.806506, 1, 1, 1, 1, 1,
0.3550864, -0.04920786, 2.666485, 1, 1, 1, 1, 1,
0.3560622, -0.8276414, 2.865372, 1, 1, 1, 1, 1,
0.3596013, -0.6807846, 2.84367, 1, 1, 1, 1, 1,
0.3600798, -0.555725, 1.311933, 1, 1, 1, 1, 1,
0.3645743, 0.3642157, -0.2440157, 1, 1, 1, 1, 1,
0.3652326, -1.163844, 2.097982, 1, 1, 1, 1, 1,
0.3665635, 0.5860725, 1.184305, 1, 1, 1, 1, 1,
0.366896, 1.211318, 1.316633, 1, 1, 1, 1, 1,
0.3678955, 0.1590066, 1.568426, 1, 1, 1, 1, 1,
0.369186, -0.7020361, 2.150967, 1, 1, 1, 1, 1,
0.3705572, 0.1068195, 1.498255, 1, 1, 1, 1, 1,
0.3779871, -1.261034, 2.336153, 0, 0, 1, 1, 1,
0.3803797, -0.1908729, 1.609237, 1, 0, 0, 1, 1,
0.3805337, 1.117374, 1.582152, 1, 0, 0, 1, 1,
0.3830683, -1.232427, 2.201641, 1, 0, 0, 1, 1,
0.3844964, -0.1679914, 2.708365, 1, 0, 0, 1, 1,
0.3858019, 0.5665258, -0.5964214, 1, 0, 0, 1, 1,
0.3925511, 0.8055909, 0.3626389, 0, 0, 0, 1, 1,
0.3958488, -0.9073633, 2.740241, 0, 0, 0, 1, 1,
0.3978891, 0.3239804, 0.5250657, 0, 0, 0, 1, 1,
0.3986339, -0.2665699, 1.505854, 0, 0, 0, 1, 1,
0.404514, 0.7084232, -0.456915, 0, 0, 0, 1, 1,
0.4062782, 0.269927, 0.2100403, 0, 0, 0, 1, 1,
0.4079876, 1.608468, 0.4476674, 0, 0, 0, 1, 1,
0.4086931, 0.2340675, 2.329585, 1, 1, 1, 1, 1,
0.4105037, 1.649956, 0.8359569, 1, 1, 1, 1, 1,
0.4194802, -0.7002292, 2.082332, 1, 1, 1, 1, 1,
0.4239747, -0.9344862, 1.965686, 1, 1, 1, 1, 1,
0.4276618, 0.5190458, 2.307063, 1, 1, 1, 1, 1,
0.4304202, -1.364547, 2.609926, 1, 1, 1, 1, 1,
0.4351656, -0.4409464, 2.266837, 1, 1, 1, 1, 1,
0.4363166, -0.3529834, 1.583379, 1, 1, 1, 1, 1,
0.4370731, 0.6936139, 0.4609563, 1, 1, 1, 1, 1,
0.4454173, 0.4195791, 0.5155824, 1, 1, 1, 1, 1,
0.4455386, 0.2709112, -0.4407242, 1, 1, 1, 1, 1,
0.4525736, 0.09775595, 2.175171, 1, 1, 1, 1, 1,
0.4559216, -0.3187911, 2.550108, 1, 1, 1, 1, 1,
0.4584787, 2.483251, -1.190611, 1, 1, 1, 1, 1,
0.4624285, -0.994137, 3.725017, 1, 1, 1, 1, 1,
0.4633046, -0.4103677, 3.044714, 0, 0, 1, 1, 1,
0.4660127, 0.6492965, 1.953818, 1, 0, 0, 1, 1,
0.4686795, -0.4266271, 3.599266, 1, 0, 0, 1, 1,
0.47422, -0.4071916, 3.982512, 1, 0, 0, 1, 1,
0.4747831, -0.8136043, 2.662256, 1, 0, 0, 1, 1,
0.4748901, -1.498859, 3.268896, 1, 0, 0, 1, 1,
0.4759795, -1.175888, 5.119929, 0, 0, 0, 1, 1,
0.4837757, -0.1942048, 1.996889, 0, 0, 0, 1, 1,
0.4849234, 1.929828, 0.3558598, 0, 0, 0, 1, 1,
0.4868822, 0.1869827, 1.711032, 0, 0, 0, 1, 1,
0.489206, -0.04495109, 1.371929, 0, 0, 0, 1, 1,
0.4908195, -1.010831, 3.338612, 0, 0, 0, 1, 1,
0.4909169, 0.3163902, 1.796728, 0, 0, 0, 1, 1,
0.4946442, -0.6280038, 2.342807, 1, 1, 1, 1, 1,
0.4990599, -0.3127133, 3.116529, 1, 1, 1, 1, 1,
0.5014757, 0.5856925, -0.6628245, 1, 1, 1, 1, 1,
0.5020263, 0.3989181, 0.1504151, 1, 1, 1, 1, 1,
0.5041894, 0.2748736, 0.4612791, 1, 1, 1, 1, 1,
0.5106615, 0.9533334, 0.9467616, 1, 1, 1, 1, 1,
0.5129205, 0.5732161, -0.398259, 1, 1, 1, 1, 1,
0.5139958, 1.298336, 0.961319, 1, 1, 1, 1, 1,
0.515066, -0.2162771, 2.094265, 1, 1, 1, 1, 1,
0.5178525, 0.8000662, 0.4641151, 1, 1, 1, 1, 1,
0.5230454, 0.2339673, -0.8903894, 1, 1, 1, 1, 1,
0.5289651, -0.8818581, -0.6530483, 1, 1, 1, 1, 1,
0.5303398, -0.5744502, 0.8353974, 1, 1, 1, 1, 1,
0.5307716, -1.182516, 2.817691, 1, 1, 1, 1, 1,
0.5319822, 0.2506343, 2.640172, 1, 1, 1, 1, 1,
0.5326945, -2.167224, 2.917608, 0, 0, 1, 1, 1,
0.5365705, -1.495234, 2.333001, 1, 0, 0, 1, 1,
0.5367971, -0.101627, 4.283408, 1, 0, 0, 1, 1,
0.5448082, 0.769102, 2.163934, 1, 0, 0, 1, 1,
0.5501717, -0.4311761, 0.7633621, 1, 0, 0, 1, 1,
0.5505148, 0.4199881, -0.3992436, 1, 0, 0, 1, 1,
0.5531257, -0.8346672, 1.7563, 0, 0, 0, 1, 1,
0.5547394, 0.5658643, 0.2363341, 0, 0, 0, 1, 1,
0.5574662, -0.5698472, 3.38968, 0, 0, 0, 1, 1,
0.567609, 1.5411, 1.768401, 0, 0, 0, 1, 1,
0.570114, -0.497928, 2.736123, 0, 0, 0, 1, 1,
0.5709517, -0.1004179, 1.557789, 0, 0, 0, 1, 1,
0.5789769, 0.5117366, 0.8632185, 0, 0, 0, 1, 1,
0.5822921, -0.4370522, 2.843825, 1, 1, 1, 1, 1,
0.5911558, -0.8134981, 3.492898, 1, 1, 1, 1, 1,
0.5911574, 0.1585968, 3.424237, 1, 1, 1, 1, 1,
0.5952436, -0.2239638, 2.303211, 1, 1, 1, 1, 1,
0.5963581, -1.426066, 3.51005, 1, 1, 1, 1, 1,
0.5995754, 1.160973, 0.529992, 1, 1, 1, 1, 1,
0.600796, 0.8335672, 1.610069, 1, 1, 1, 1, 1,
0.6012776, -0.7574039, 2.257406, 1, 1, 1, 1, 1,
0.6013311, -0.6374642, 2.915498, 1, 1, 1, 1, 1,
0.6075179, 0.6419093, -0.3558782, 1, 1, 1, 1, 1,
0.610566, 0.2751777, 3.299883, 1, 1, 1, 1, 1,
0.611665, -0.416157, 1.575704, 1, 1, 1, 1, 1,
0.6122491, 0.1719924, 2.255402, 1, 1, 1, 1, 1,
0.6144719, -0.5810763, 1.352979, 1, 1, 1, 1, 1,
0.6163751, -1.383196, 1.588592, 1, 1, 1, 1, 1,
0.6195967, -0.03554801, 0.4097342, 0, 0, 1, 1, 1,
0.6219788, -0.5162174, 2.100213, 1, 0, 0, 1, 1,
0.6279477, 0.4237087, 1.775955, 1, 0, 0, 1, 1,
0.6280279, 0.4318255, 1.82763, 1, 0, 0, 1, 1,
0.6339442, 1.206128, 0.006477911, 1, 0, 0, 1, 1,
0.6342822, -0.6335264, 1.842703, 1, 0, 0, 1, 1,
0.6355284, 0.2725367, 2.017739, 0, 0, 0, 1, 1,
0.6368577, -1.130022, 2.553926, 0, 0, 0, 1, 1,
0.6378035, -1.052494, 0.9152302, 0, 0, 0, 1, 1,
0.6449391, -0.4698351, 3.825266, 0, 0, 0, 1, 1,
0.6488203, -1.017424, 2.733133, 0, 0, 0, 1, 1,
0.650075, 0.1319508, 1.482995, 0, 0, 0, 1, 1,
0.6549061, -0.2556604, -0.2777115, 0, 0, 0, 1, 1,
0.6564251, -0.8483738, 1.707941, 1, 1, 1, 1, 1,
0.6567531, 0.3431346, -0.2209968, 1, 1, 1, 1, 1,
0.6602431, 0.8424624, -1.569789, 1, 1, 1, 1, 1,
0.6632709, 0.3926896, 0.7715287, 1, 1, 1, 1, 1,
0.6654016, -0.5327309, 3.495836, 1, 1, 1, 1, 1,
0.6690037, -1.711288, 3.292707, 1, 1, 1, 1, 1,
0.6702202, 2.985941, -0.3570472, 1, 1, 1, 1, 1,
0.6761495, -1.913666, 2.668763, 1, 1, 1, 1, 1,
0.6785021, -0.08814681, 1.532841, 1, 1, 1, 1, 1,
0.6827723, 1.68321, 1.580321, 1, 1, 1, 1, 1,
0.6849136, 0.4102127, 3.296085, 1, 1, 1, 1, 1,
0.6868395, -1.613369, 3.360598, 1, 1, 1, 1, 1,
0.6870633, -2.248503, 2.99546, 1, 1, 1, 1, 1,
0.6926785, 2.089556, -0.04819018, 1, 1, 1, 1, 1,
0.696125, -0.5327712, 2.679752, 1, 1, 1, 1, 1,
0.7031225, -0.1489346, 0.6384256, 0, 0, 1, 1, 1,
0.7043216, -0.5163504, 2.765987, 1, 0, 0, 1, 1,
0.706191, 0.267463, 1.463871, 1, 0, 0, 1, 1,
0.7062303, 1.282562, 0.4135211, 1, 0, 0, 1, 1,
0.7125127, 1.521115, 1.549641, 1, 0, 0, 1, 1,
0.7147407, -0.1400334, 1.658851, 1, 0, 0, 1, 1,
0.7155548, 1.456596, 1.307362, 0, 0, 0, 1, 1,
0.7180301, -1.002514, 3.220181, 0, 0, 0, 1, 1,
0.7208008, 2.255722, -0.07749172, 0, 0, 0, 1, 1,
0.724399, 0.4763258, 1.639728, 0, 0, 0, 1, 1,
0.7320595, -0.6668049, 3.695611, 0, 0, 0, 1, 1,
0.7342967, -2.071643, 3.786255, 0, 0, 0, 1, 1,
0.7383788, -0.7471471, 1.98058, 0, 0, 0, 1, 1,
0.7413392, 0.3200375, 0.516494, 1, 1, 1, 1, 1,
0.7414445, 1.321918, -1.026918, 1, 1, 1, 1, 1,
0.7417282, 2.222649, 1.184937, 1, 1, 1, 1, 1,
0.7432936, 0.2531721, 1.074532, 1, 1, 1, 1, 1,
0.7444363, -0.3384958, 2.182872, 1, 1, 1, 1, 1,
0.7545962, 1.754427, 0.07971884, 1, 1, 1, 1, 1,
0.7562314, 0.01978306, -0.6964983, 1, 1, 1, 1, 1,
0.7599488, 0.8843849, -1.782572, 1, 1, 1, 1, 1,
0.7670234, -0.439642, 1.02179, 1, 1, 1, 1, 1,
0.7671143, 0.04911947, 1.868476, 1, 1, 1, 1, 1,
0.7690369, 1.462839, 0.7505866, 1, 1, 1, 1, 1,
0.7732264, 1.25219, 1.816624, 1, 1, 1, 1, 1,
0.7755182, -1.33977, 3.550244, 1, 1, 1, 1, 1,
0.7915795, 0.6702697, 2.032246, 1, 1, 1, 1, 1,
0.7929503, -2.303624, 1.582973, 1, 1, 1, 1, 1,
0.8085217, -0.2799297, 2.049428, 0, 0, 1, 1, 1,
0.8099626, 0.2922898, 1.618748, 1, 0, 0, 1, 1,
0.8119158, 2.134471, 2.481554, 1, 0, 0, 1, 1,
0.8120567, -0.2373912, 1.248814, 1, 0, 0, 1, 1,
0.8137879, 1.321201, 0.06194062, 1, 0, 0, 1, 1,
0.8176218, 0.1243151, 1.766366, 1, 0, 0, 1, 1,
0.8251656, 0.2687534, 2.132344, 0, 0, 0, 1, 1,
0.8282937, -1.101937, 1.674665, 0, 0, 0, 1, 1,
0.8288913, -2.268786, 5.186248, 0, 0, 0, 1, 1,
0.8304226, 1.686813, 0.3044015, 0, 0, 0, 1, 1,
0.8346828, -0.609836, 0.8690747, 0, 0, 0, 1, 1,
0.8349214, -0.03563553, 2.368136, 0, 0, 0, 1, 1,
0.8371491, 0.4426433, 1.673404, 0, 0, 0, 1, 1,
0.8393394, 1.626059, -0.4720502, 1, 1, 1, 1, 1,
0.8480966, -0.4011858, 1.13455, 1, 1, 1, 1, 1,
0.8489338, -0.2346529, 1.510432, 1, 1, 1, 1, 1,
0.8518509, -0.4228366, 2.20051, 1, 1, 1, 1, 1,
0.8543267, -1.202055, 2.855144, 1, 1, 1, 1, 1,
0.8553999, 0.2262554, 2.323877, 1, 1, 1, 1, 1,
0.8622114, 0.5837218, 2.352713, 1, 1, 1, 1, 1,
0.8687983, -0.09714992, 3.897635, 1, 1, 1, 1, 1,
0.8753521, 0.9325644, -0.0516919, 1, 1, 1, 1, 1,
0.8790946, -0.4675284, 3.514822, 1, 1, 1, 1, 1,
0.8898895, 0.5268919, 2.60295, 1, 1, 1, 1, 1,
0.8928196, -0.2438964, 1.158444, 1, 1, 1, 1, 1,
0.8952398, -0.7842396, 2.09017, 1, 1, 1, 1, 1,
0.8952669, 1.040605, 0.1740337, 1, 1, 1, 1, 1,
0.89807, 1.694084, 0.5493722, 1, 1, 1, 1, 1,
0.9029557, -0.3266734, 1.734346, 0, 0, 1, 1, 1,
0.904834, 0.6675321, -1.128449, 1, 0, 0, 1, 1,
0.9051507, -2.881053, 3.068534, 1, 0, 0, 1, 1,
0.9062935, 0.6449601, 2.14292, 1, 0, 0, 1, 1,
0.9105024, 0.000156799, 0.1287664, 1, 0, 0, 1, 1,
0.9128383, -0.9093913, 1.102105, 1, 0, 0, 1, 1,
0.9162694, 1.391154, 0.4010423, 0, 0, 0, 1, 1,
0.9217572, -1.55145, 1.423438, 0, 0, 0, 1, 1,
0.924487, -0.341183, 1.574415, 0, 0, 0, 1, 1,
0.9264202, 0.6983311, 2.188246, 0, 0, 0, 1, 1,
0.9313222, 1.100891, 0.1543477, 0, 0, 0, 1, 1,
0.9315249, -1.266557, 1.742543, 0, 0, 0, 1, 1,
0.9334779, 0.5412008, 1.368902, 0, 0, 0, 1, 1,
0.9393359, -1.251807, 2.445945, 1, 1, 1, 1, 1,
0.9415535, -0.4456389, 2.08913, 1, 1, 1, 1, 1,
0.9470812, -0.2250894, 2.125554, 1, 1, 1, 1, 1,
0.9500093, 0.679176, 1.886402, 1, 1, 1, 1, 1,
0.9509531, -0.7248386, 2.653085, 1, 1, 1, 1, 1,
0.9603082, -0.3389179, 1.273951, 1, 1, 1, 1, 1,
0.9603899, 0.4448683, 0.975219, 1, 1, 1, 1, 1,
0.9663189, -0.5524907, 1.132118, 1, 1, 1, 1, 1,
0.9678401, -0.4305741, 0.6890754, 1, 1, 1, 1, 1,
0.9697441, 1.409664, -0.9067776, 1, 1, 1, 1, 1,
0.9788174, 0.6431935, 1.19602, 1, 1, 1, 1, 1,
0.9799134, -0.03608513, 1.989118, 1, 1, 1, 1, 1,
0.9800311, 0.4888116, -0.7279556, 1, 1, 1, 1, 1,
0.9805319, -2.682056, 2.308931, 1, 1, 1, 1, 1,
0.9884124, -1.275002, 1.326722, 1, 1, 1, 1, 1,
0.9961547, -0.7122685, 1.720099, 0, 0, 1, 1, 1,
1.010327, 0.5819124, 0.5961996, 1, 0, 0, 1, 1,
1.010385, -0.9399225, 0.4146121, 1, 0, 0, 1, 1,
1.012094, 0.357522, 0.9893588, 1, 0, 0, 1, 1,
1.022519, -0.5151129, 3.056439, 1, 0, 0, 1, 1,
1.022804, 0.6283025, 1.956581, 1, 0, 0, 1, 1,
1.02332, 2.234123, 2.039963, 0, 0, 0, 1, 1,
1.023697, -1.364754, 1.579112, 0, 0, 0, 1, 1,
1.027022, -0.1941972, 1.939783, 0, 0, 0, 1, 1,
1.030414, 0.6945898, 0.5172901, 0, 0, 0, 1, 1,
1.032441, 0.5585134, 1.672808, 0, 0, 0, 1, 1,
1.034029, -0.1874285, 2.799683, 0, 0, 0, 1, 1,
1.037688, -0.0279748, 2.087855, 0, 0, 0, 1, 1,
1.041568, 0.863302, 0.1758477, 1, 1, 1, 1, 1,
1.049663, -0.4332705, 1.496586, 1, 1, 1, 1, 1,
1.051853, 1.064729, 0.9107988, 1, 1, 1, 1, 1,
1.072034, -0.9266244, 2.58513, 1, 1, 1, 1, 1,
1.078437, -0.1390973, 3.056081, 1, 1, 1, 1, 1,
1.084715, 0.785642, 0.1612032, 1, 1, 1, 1, 1,
1.086962, 0.1519045, 0.645267, 1, 1, 1, 1, 1,
1.086991, 0.6740739, 1.77439, 1, 1, 1, 1, 1,
1.087534, -0.6566746, 2.518548, 1, 1, 1, 1, 1,
1.088152, 0.2287733, 2.171596, 1, 1, 1, 1, 1,
1.090507, -0.5608576, 2.695419, 1, 1, 1, 1, 1,
1.106165, -0.6381157, 3.548239, 1, 1, 1, 1, 1,
1.106695, -0.830937, 3.944321, 1, 1, 1, 1, 1,
1.111176, 1.028676, -0.6622104, 1, 1, 1, 1, 1,
1.115903, -1.889673, 1.699338, 1, 1, 1, 1, 1,
1.116711, -0.6013151, 2.312427, 0, 0, 1, 1, 1,
1.12174, -0.9216775, 1.595695, 1, 0, 0, 1, 1,
1.122981, 0.5741814, 1.283709, 1, 0, 0, 1, 1,
1.123568, 0.2409499, 1.660882, 1, 0, 0, 1, 1,
1.127664, -1.446181, 3.237437, 1, 0, 0, 1, 1,
1.132199, 2.051555, 0.7815878, 1, 0, 0, 1, 1,
1.133551, -0.6885619, 1.814283, 0, 0, 0, 1, 1,
1.142025, 0.5004181, 1.121015, 0, 0, 0, 1, 1,
1.142945, 0.6089633, 2.323858, 0, 0, 0, 1, 1,
1.145596, -0.7266226, 1.961532, 0, 0, 0, 1, 1,
1.148338, -0.6742125, 2.297856, 0, 0, 0, 1, 1,
1.151731, 0.0436394, 0.8496214, 0, 0, 0, 1, 1,
1.154981, -0.4462865, 3.602061, 0, 0, 0, 1, 1,
1.156556, -1.218382, 4.810307, 1, 1, 1, 1, 1,
1.156652, -0.915356, 1.729176, 1, 1, 1, 1, 1,
1.159217, -0.2068842, 1.714789, 1, 1, 1, 1, 1,
1.159285, -0.7516825, 2.382698, 1, 1, 1, 1, 1,
1.161699, 0.6544246, 1.436251, 1, 1, 1, 1, 1,
1.177575, -1.501147, 1.838441, 1, 1, 1, 1, 1,
1.193003, 0.715071, 1.538261, 1, 1, 1, 1, 1,
1.197894, -0.3064987, 2.478478, 1, 1, 1, 1, 1,
1.201926, -0.888404, 1.054513, 1, 1, 1, 1, 1,
1.20821, 1.386776, 0.1875827, 1, 1, 1, 1, 1,
1.21105, 0.7248182, 0.1525491, 1, 1, 1, 1, 1,
1.222982, 1.541105, 0.7041588, 1, 1, 1, 1, 1,
1.232183, -0.5619671, 1.924159, 1, 1, 1, 1, 1,
1.240744, -0.2605655, 2.676805, 1, 1, 1, 1, 1,
1.249251, 0.5546022, 1.6394, 1, 1, 1, 1, 1,
1.250173, 1.226161, 0.1148549, 0, 0, 1, 1, 1,
1.251042, -0.491636, 1.438864, 1, 0, 0, 1, 1,
1.251612, -0.4339649, 1.882479, 1, 0, 0, 1, 1,
1.261894, 1.534982, -0.8131943, 1, 0, 0, 1, 1,
1.26504, 0.6005539, 1.232807, 1, 0, 0, 1, 1,
1.268191, -0.918673, 2.790319, 1, 0, 0, 1, 1,
1.273996, 0.180392, 0.4566469, 0, 0, 0, 1, 1,
1.285394, 0.7554095, 1.079732, 0, 0, 0, 1, 1,
1.291981, -0.1795912, -0.01219754, 0, 0, 0, 1, 1,
1.292108, 0.6762359, 2.064018, 0, 0, 0, 1, 1,
1.305704, -0.5088336, 1.989726, 0, 0, 0, 1, 1,
1.308164, -0.5535452, 3.394238, 0, 0, 0, 1, 1,
1.310311, -0.9974351, 2.028258, 0, 0, 0, 1, 1,
1.33606, -2.432596, 3.278154, 1, 1, 1, 1, 1,
1.342026, 0.8057441, 2.002769, 1, 1, 1, 1, 1,
1.356598, -0.003471757, 1.621893, 1, 1, 1, 1, 1,
1.367257, 0.4739999, 2.480901, 1, 1, 1, 1, 1,
1.382998, 1.330891, 0.3268677, 1, 1, 1, 1, 1,
1.38462, 0.8150529, 0.3884039, 1, 1, 1, 1, 1,
1.398081, -0.3821369, 2.640888, 1, 1, 1, 1, 1,
1.403358, -0.7621621, 3.279416, 1, 1, 1, 1, 1,
1.417611, 0.5740362, 1.59106, 1, 1, 1, 1, 1,
1.423195, -0.7664417, 0.9114946, 1, 1, 1, 1, 1,
1.432652, 0.1195378, 2.908835, 1, 1, 1, 1, 1,
1.440126, -1.481318, 1.949528, 1, 1, 1, 1, 1,
1.447308, 1.873174, 1.592279, 1, 1, 1, 1, 1,
1.450428, -0.2279804, 0.5873105, 1, 1, 1, 1, 1,
1.450844, -1.295672, 2.573345, 1, 1, 1, 1, 1,
1.459821, -1.152218, 2.41424, 0, 0, 1, 1, 1,
1.464827, -0.886453, 2.865052, 1, 0, 0, 1, 1,
1.492883, -1.252278, 3.218065, 1, 0, 0, 1, 1,
1.493144, 1.023087, 1.077882, 1, 0, 0, 1, 1,
1.493515, -1.37595, 1.960183, 1, 0, 0, 1, 1,
1.500231, 0.6055727, 1.121479, 1, 0, 0, 1, 1,
1.504671, -1.22648, 2.118374, 0, 0, 0, 1, 1,
1.509487, -0.8401301, 2.391885, 0, 0, 0, 1, 1,
1.524108, -0.3267929, 3.906963, 0, 0, 0, 1, 1,
1.534431, -0.6847791, 1.795079, 0, 0, 0, 1, 1,
1.539321, 0.3926705, 3.199442, 0, 0, 0, 1, 1,
1.550031, -1.610844, 1.580899, 0, 0, 0, 1, 1,
1.561837, -0.550817, -0.6426609, 0, 0, 0, 1, 1,
1.563305, -0.4659706, 1.874376, 1, 1, 1, 1, 1,
1.57626, 1.444229, 0.1067232, 1, 1, 1, 1, 1,
1.58788, -0.6949943, 1.015171, 1, 1, 1, 1, 1,
1.588817, -0.2417042, 1.500318, 1, 1, 1, 1, 1,
1.590267, 0.3027856, 2.824024, 1, 1, 1, 1, 1,
1.596446, 1.128321, 0.1484652, 1, 1, 1, 1, 1,
1.602782, 0.9551957, 1.409087, 1, 1, 1, 1, 1,
1.603508, 0.6010926, 1.41741, 1, 1, 1, 1, 1,
1.607792, -0.2167991, 0.9551457, 1, 1, 1, 1, 1,
1.608107, -0.1792548, 1.724322, 1, 1, 1, 1, 1,
1.609048, 1.264128, 0.2081403, 1, 1, 1, 1, 1,
1.615814, 0.4971023, 1.571279, 1, 1, 1, 1, 1,
1.679386, 0.08265018, 1.754339, 1, 1, 1, 1, 1,
1.690844, -1.253097, 2.692493, 1, 1, 1, 1, 1,
1.710472, -0.5666018, 2.353407, 1, 1, 1, 1, 1,
1.718534, 0.1678258, 0.6470743, 0, 0, 1, 1, 1,
1.734469, -0.642207, 2.083637, 1, 0, 0, 1, 1,
1.738583, -0.2093021, 2.131743, 1, 0, 0, 1, 1,
1.757077, 0.201713, 0.2675002, 1, 0, 0, 1, 1,
1.75871, 1.432166, 0.9403723, 1, 0, 0, 1, 1,
1.759777, -0.5622844, 0.7106633, 1, 0, 0, 1, 1,
1.778163, 0.8755233, 3.004982, 0, 0, 0, 1, 1,
1.786133, 0.3175801, 1.714908, 0, 0, 0, 1, 1,
1.789586, -1.085068, 2.081591, 0, 0, 0, 1, 1,
1.848544, -1.963999, 4.338295, 0, 0, 0, 1, 1,
1.856049, 1.716816, -0.6063053, 0, 0, 0, 1, 1,
1.861829, -0.4482318, 3.034104, 0, 0, 0, 1, 1,
1.866084, -1.001518, 3.353159, 0, 0, 0, 1, 1,
1.881297, -0.4909781, 0.955676, 1, 1, 1, 1, 1,
1.90229, -1.242551, 2.028642, 1, 1, 1, 1, 1,
1.914867, -1.563589, 2.614773, 1, 1, 1, 1, 1,
1.91645, -0.8600714, 1.385827, 1, 1, 1, 1, 1,
1.918035, 1.077461, 0.8027294, 1, 1, 1, 1, 1,
1.919158, 0.1006708, 3.24003, 1, 1, 1, 1, 1,
1.924866, -1.054249, 1.862256, 1, 1, 1, 1, 1,
1.930431, 1.493395, 0.3427391, 1, 1, 1, 1, 1,
1.937732, 0.07012703, 0.7054887, 1, 1, 1, 1, 1,
1.950383, 0.4613273, 1.561622, 1, 1, 1, 1, 1,
1.955483, 0.0584798, 0.2947068, 1, 1, 1, 1, 1,
1.960439, -1.548612, 2.131063, 1, 1, 1, 1, 1,
2.000349, 0.8308727, 1.902581, 1, 1, 1, 1, 1,
2.013299, -0.07197344, 1.953493, 1, 1, 1, 1, 1,
2.0346, -0.8281523, 3.550151, 1, 1, 1, 1, 1,
2.047203, -0.5536197, 1.186169, 0, 0, 1, 1, 1,
2.071815, -1.879171, 1.839426, 1, 0, 0, 1, 1,
2.130889, 4.044385, -0.4555752, 1, 0, 0, 1, 1,
2.195371, -0.7325654, 2.208025, 1, 0, 0, 1, 1,
2.26597, -0.6787517, 0.9788984, 1, 0, 0, 1, 1,
2.310838, 1.976067, 1.24598, 1, 0, 0, 1, 1,
2.357105, 1.278069, 1.39088, 0, 0, 0, 1, 1,
2.363286, -0.405685, 1.736089, 0, 0, 0, 1, 1,
2.385877, -1.150751, 1.574521, 0, 0, 0, 1, 1,
2.415955, -0.08994498, 3.667916, 0, 0, 0, 1, 1,
2.463022, 0.5782684, 0.8364413, 0, 0, 0, 1, 1,
2.507742, -0.7531555, 2.291161, 0, 0, 0, 1, 1,
2.564135, 0.6202392, 1.825107, 0, 0, 0, 1, 1,
2.571956, 0.5857763, 0.1046873, 1, 1, 1, 1, 1,
2.580483, -0.6518487, 1.294218, 1, 1, 1, 1, 1,
2.58801, 0.1330863, 2.754359, 1, 1, 1, 1, 1,
2.724048, 0.1739161, 1.02895, 1, 1, 1, 1, 1,
2.751313, -1.477656, -0.6587952, 1, 1, 1, 1, 1,
2.951809, 0.3666819, 3.00213, 1, 1, 1, 1, 1,
3.033085, -0.836791, -0.2610278, 1, 1, 1, 1, 1
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
var radius = 9.740074;
var distance = 34.2116;
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
mvMatrix.translate( 0.00178504, -0.281034, 0.09344053 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2116);
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
