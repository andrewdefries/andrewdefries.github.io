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
-2.956189, -0.8256826, -1.697079, 1, 0, 0, 1,
-2.749996, -1.628178, -2.470805, 1, 0.007843138, 0, 1,
-2.708834, -1.098669, -3.44403, 1, 0.01176471, 0, 1,
-2.704307, -0.6359178, -1.341743, 1, 0.01960784, 0, 1,
-2.596671, 1.582651, -2.622552, 1, 0.02352941, 0, 1,
-2.576951, -0.1458658, -2.957325, 1, 0.03137255, 0, 1,
-2.459542, 1.019741, -1.965949, 1, 0.03529412, 0, 1,
-2.430449, 1.435233, -0.6195066, 1, 0.04313726, 0, 1,
-2.410916, -1.021826, -1.521548, 1, 0.04705882, 0, 1,
-2.38325, 0.2603486, -1.865984, 1, 0.05490196, 0, 1,
-2.316497, -0.3500643, 0.2558678, 1, 0.05882353, 0, 1,
-2.309804, 0.5540475, -0.9706361, 1, 0.06666667, 0, 1,
-2.292827, -0.5539668, -2.789856, 1, 0.07058824, 0, 1,
-2.223333, 0.8632133, -0.2784212, 1, 0.07843138, 0, 1,
-2.221288, -0.9346368, -1.135963, 1, 0.08235294, 0, 1,
-2.189677, -0.510419, -3.026301, 1, 0.09019608, 0, 1,
-2.147521, -0.3309992, -1.550419, 1, 0.09411765, 0, 1,
-2.046694, 0.07684068, 0.09942486, 1, 0.1019608, 0, 1,
-2.021878, -1.259989, -2.470305, 1, 0.1098039, 0, 1,
-2.013166, -1.316838, -0.1140539, 1, 0.1137255, 0, 1,
-2.001146, -0.1172412, -1.817848, 1, 0.1215686, 0, 1,
-1.941024, -0.8037313, -3.215107, 1, 0.1254902, 0, 1,
-1.937437, 1.494464, -1.740258, 1, 0.1333333, 0, 1,
-1.888755, 0.4802763, -2.253358, 1, 0.1372549, 0, 1,
-1.878622, -0.05093614, -2.362049, 1, 0.145098, 0, 1,
-1.872007, -0.63329, -2.011778, 1, 0.1490196, 0, 1,
-1.86509, 0.4788576, -0.8000979, 1, 0.1568628, 0, 1,
-1.839099, -2.029255, -4.49532, 1, 0.1607843, 0, 1,
-1.835617, -0.9745296, -1.558955, 1, 0.1686275, 0, 1,
-1.817225, -0.6787045, -2.415737, 1, 0.172549, 0, 1,
-1.769712, 0.4227001, -1.797382, 1, 0.1803922, 0, 1,
-1.768637, 0.3865929, -1.452069, 1, 0.1843137, 0, 1,
-1.749617, -0.2695932, -0.557879, 1, 0.1921569, 0, 1,
-1.695736, -0.5403894, -0.6805103, 1, 0.1960784, 0, 1,
-1.689304, 0.834142, -1.290129, 1, 0.2039216, 0, 1,
-1.656243, -0.2546426, -2.242876, 1, 0.2117647, 0, 1,
-1.64464, 0.4616561, -0.109029, 1, 0.2156863, 0, 1,
-1.625798, -0.1904714, -0.6233352, 1, 0.2235294, 0, 1,
-1.616512, -1.471971, -3.679358, 1, 0.227451, 0, 1,
-1.552867, -0.103726, -1.680584, 1, 0.2352941, 0, 1,
-1.540338, 1.060113, -0.2682253, 1, 0.2392157, 0, 1,
-1.536113, -1.4054, -2.71801, 1, 0.2470588, 0, 1,
-1.534234, 0.3797448, -0.9012716, 1, 0.2509804, 0, 1,
-1.528685, 0.1653069, -1.426779, 1, 0.2588235, 0, 1,
-1.527975, -1.336886, -2.298231, 1, 0.2627451, 0, 1,
-1.525522, -0.05005397, -1.473737, 1, 0.2705882, 0, 1,
-1.518215, 2.143373, -0.8101709, 1, 0.2745098, 0, 1,
-1.494626, -0.3254952, -1.772732, 1, 0.282353, 0, 1,
-1.493659, 0.07581605, -1.965883, 1, 0.2862745, 0, 1,
-1.480814, -0.7643789, -0.6369165, 1, 0.2941177, 0, 1,
-1.476578, 0.6656306, -0.01976861, 1, 0.3019608, 0, 1,
-1.469615, -0.7615515, -3.066701, 1, 0.3058824, 0, 1,
-1.45801, -0.08109396, -1.635259, 1, 0.3137255, 0, 1,
-1.457789, -0.06636953, -2.738866, 1, 0.3176471, 0, 1,
-1.434205, -1.047395, -1.363293, 1, 0.3254902, 0, 1,
-1.432631, 0.7093932, -1.568802, 1, 0.3294118, 0, 1,
-1.425559, 1.117283, -1.025305, 1, 0.3372549, 0, 1,
-1.424544, 0.4087863, -2.604207, 1, 0.3411765, 0, 1,
-1.420756, 0.7254015, -1.686761, 1, 0.3490196, 0, 1,
-1.410652, 0.5952673, -1.64401, 1, 0.3529412, 0, 1,
-1.406581, -0.08372584, -2.353276, 1, 0.3607843, 0, 1,
-1.404221, -1.05183, -2.975048, 1, 0.3647059, 0, 1,
-1.393844, 0.4742361, -1.364809, 1, 0.372549, 0, 1,
-1.39218, 0.3111189, -2.213892, 1, 0.3764706, 0, 1,
-1.384736, -0.8965546, -3.051271, 1, 0.3843137, 0, 1,
-1.383669, -1.216887, -2.985626, 1, 0.3882353, 0, 1,
-1.380871, 1.70502, 0.563294, 1, 0.3960784, 0, 1,
-1.376943, 1.229065, -0.6999922, 1, 0.4039216, 0, 1,
-1.361258, 0.1621733, -3.784616, 1, 0.4078431, 0, 1,
-1.358886, -0.9598151, -1.154754, 1, 0.4156863, 0, 1,
-1.356424, 1.805611, -3.312455, 1, 0.4196078, 0, 1,
-1.352898, -1.07822, -2.599617, 1, 0.427451, 0, 1,
-1.351123, -0.4178179, -1.482171, 1, 0.4313726, 0, 1,
-1.347929, -0.003201879, -2.858828, 1, 0.4392157, 0, 1,
-1.325584, 0.05820979, -1.545246, 1, 0.4431373, 0, 1,
-1.322147, 2.18629, -1.275618, 1, 0.4509804, 0, 1,
-1.316758, 0.3442883, -1.179901, 1, 0.454902, 0, 1,
-1.315908, 0.4323902, -1.260217, 1, 0.4627451, 0, 1,
-1.314307, 0.1019487, -1.507954, 1, 0.4666667, 0, 1,
-1.302335, 0.4625148, -0.7508405, 1, 0.4745098, 0, 1,
-1.280818, -2.108269, -2.579393, 1, 0.4784314, 0, 1,
-1.279083, 0.6975037, -1.211986, 1, 0.4862745, 0, 1,
-1.277062, -0.2182299, -1.335045, 1, 0.4901961, 0, 1,
-1.275372, 0.0960919, -0.308248, 1, 0.4980392, 0, 1,
-1.271832, 0.6632274, -1.869141, 1, 0.5058824, 0, 1,
-1.271683, -0.6732042, 0.5455286, 1, 0.509804, 0, 1,
-1.262863, 1.079613, -0.05709408, 1, 0.5176471, 0, 1,
-1.258159, 0.9399453, -0.4504482, 1, 0.5215687, 0, 1,
-1.253137, 2.387687, -0.2599442, 1, 0.5294118, 0, 1,
-1.245457, -0.5275045, -3.146727, 1, 0.5333334, 0, 1,
-1.240237, 0.2556144, 0.01806631, 1, 0.5411765, 0, 1,
-1.240158, -0.2539166, -1.716764, 1, 0.5450981, 0, 1,
-1.238178, -0.5707006, -2.105685, 1, 0.5529412, 0, 1,
-1.237674, -1.03691, -1.357476, 1, 0.5568628, 0, 1,
-1.234903, 1.888905, -0.857927, 1, 0.5647059, 0, 1,
-1.231947, -0.4810424, -2.767908, 1, 0.5686275, 0, 1,
-1.228538, 0.07918567, -2.723102, 1, 0.5764706, 0, 1,
-1.216583, 0.6442122, -1.552035, 1, 0.5803922, 0, 1,
-1.211966, 0.5680406, 0.7339155, 1, 0.5882353, 0, 1,
-1.205319, -1.70201, -2.379828, 1, 0.5921569, 0, 1,
-1.202223, 0.323226, -1.707163, 1, 0.6, 0, 1,
-1.201595, 1.566023, -2.135854, 1, 0.6078432, 0, 1,
-1.198586, -0.9359993, -3.164047, 1, 0.6117647, 0, 1,
-1.193838, -0.6846954, -2.229952, 1, 0.6196079, 0, 1,
-1.193188, 0.2929911, 0.2849526, 1, 0.6235294, 0, 1,
-1.185365, -0.5362508, -2.989399, 1, 0.6313726, 0, 1,
-1.177527, -0.4453415, -1.636005, 1, 0.6352941, 0, 1,
-1.177273, 0.4481586, -1.755035, 1, 0.6431373, 0, 1,
-1.173607, 0.2434225, -1.85601, 1, 0.6470588, 0, 1,
-1.165336, -0.5260275, -4.179069, 1, 0.654902, 0, 1,
-1.161158, -0.1516643, -0.366047, 1, 0.6588235, 0, 1,
-1.159597, -0.007433265, -2.590768, 1, 0.6666667, 0, 1,
-1.15361, 0.3550503, -1.111285, 1, 0.6705883, 0, 1,
-1.153057, 0.6118166, -2.117944, 1, 0.6784314, 0, 1,
-1.151611, -2.050378, -2.811487, 1, 0.682353, 0, 1,
-1.149915, 0.762621, -0.3239563, 1, 0.6901961, 0, 1,
-1.147525, 1.24085, -0.0348674, 1, 0.6941177, 0, 1,
-1.145625, 0.5842974, -0.1711577, 1, 0.7019608, 0, 1,
-1.136956, -1.095807, -3.209361, 1, 0.7098039, 0, 1,
-1.134144, -0.2419418, -2.310922, 1, 0.7137255, 0, 1,
-1.125978, 0.4068653, -0.1983701, 1, 0.7215686, 0, 1,
-1.119174, 0.05430167, -0.4877025, 1, 0.7254902, 0, 1,
-1.115861, 0.5654516, -2.257053, 1, 0.7333333, 0, 1,
-1.115818, 0.1106591, -2.406535, 1, 0.7372549, 0, 1,
-1.110557, -2.923205, -2.622818, 1, 0.7450981, 0, 1,
-1.096319, -0.07848367, -3.2286, 1, 0.7490196, 0, 1,
-1.095347, 0.9084893, 0.3087267, 1, 0.7568628, 0, 1,
-1.093453, -0.7458385, -3.06383, 1, 0.7607843, 0, 1,
-1.086321, -0.12553, -1.855605, 1, 0.7686275, 0, 1,
-1.080481, -1.566875, -1.646934, 1, 0.772549, 0, 1,
-1.079017, 1.051682, -1.983328, 1, 0.7803922, 0, 1,
-1.073792, -0.001475522, -3.07201, 1, 0.7843137, 0, 1,
-1.073159, 1.999595, -0.885282, 1, 0.7921569, 0, 1,
-1.07292, -0.01107261, -2.21582, 1, 0.7960784, 0, 1,
-1.070251, 0.4411947, -1.528249, 1, 0.8039216, 0, 1,
-1.069786, -1.404914, -2.722763, 1, 0.8117647, 0, 1,
-1.045043, -0.3782442, 0.7454355, 1, 0.8156863, 0, 1,
-1.038592, -0.9546399, -2.732517, 1, 0.8235294, 0, 1,
-1.038533, -0.5808289, -1.260404, 1, 0.827451, 0, 1,
-1.026056, 1.101473, -2.240569, 1, 0.8352941, 0, 1,
-1.025073, -1.166418, -2.734687, 1, 0.8392157, 0, 1,
-1.024713, 1.288268, 0.754187, 1, 0.8470588, 0, 1,
-1.009055, -1.231845, -3.225175, 1, 0.8509804, 0, 1,
-1.000699, 0.2546682, -2.368997, 1, 0.8588235, 0, 1,
-0.9953514, 0.4606355, -0.3703582, 1, 0.8627451, 0, 1,
-0.9922312, 1.75189, -1.594641, 1, 0.8705882, 0, 1,
-0.986351, -0.7755684, -3.907041, 1, 0.8745098, 0, 1,
-0.9709911, 0.3514631, -1.219383, 1, 0.8823529, 0, 1,
-0.9704575, 1.107893, -2.223953, 1, 0.8862745, 0, 1,
-0.9686922, -0.7449179, -1.255505, 1, 0.8941177, 0, 1,
-0.9635174, 1.476329, -0.3623047, 1, 0.8980392, 0, 1,
-0.9618529, 1.391552, -1.459152, 1, 0.9058824, 0, 1,
-0.9601914, -0.8271442, -1.85936, 1, 0.9137255, 0, 1,
-0.9588591, 0.2929513, 0.163846, 1, 0.9176471, 0, 1,
-0.9553989, 1.128057, -0.802637, 1, 0.9254902, 0, 1,
-0.9525424, -0.1434143, -0.02000639, 1, 0.9294118, 0, 1,
-0.9426522, -0.02545261, -1.603448, 1, 0.9372549, 0, 1,
-0.941498, 0.4723718, -1.006232, 1, 0.9411765, 0, 1,
-0.9400431, 1.388549, -1.82008, 1, 0.9490196, 0, 1,
-0.9384511, 0.7424809, -1.89862, 1, 0.9529412, 0, 1,
-0.9369699, 0.7118236, -0.1569365, 1, 0.9607843, 0, 1,
-0.9329773, -1.259673, -1.367375, 1, 0.9647059, 0, 1,
-0.9317498, -0.09891409, -2.512855, 1, 0.972549, 0, 1,
-0.9301092, -1.369688, -2.835173, 1, 0.9764706, 0, 1,
-0.9299637, -1.103954, -3.519173, 1, 0.9843137, 0, 1,
-0.9285848, -0.6624144, -4.200432, 1, 0.9882353, 0, 1,
-0.9284673, -0.2957129, -2.008796, 1, 0.9960784, 0, 1,
-0.9241219, 0.4752469, -2.599544, 0.9960784, 1, 0, 1,
-0.9172379, -0.3669945, -2.594653, 0.9921569, 1, 0, 1,
-0.9078582, -0.449957, -1.744812, 0.9843137, 1, 0, 1,
-0.8983723, -0.2837504, -2.412251, 0.9803922, 1, 0, 1,
-0.8980011, 1.547731, 1.162701, 0.972549, 1, 0, 1,
-0.8919348, 0.02862356, -1.991275, 0.9686275, 1, 0, 1,
-0.8905492, 0.6725799, -1.356018, 0.9607843, 1, 0, 1,
-0.889919, 0.2690928, -1.498342, 0.9568627, 1, 0, 1,
-0.8884219, 2.085539, -0.2950126, 0.9490196, 1, 0, 1,
-0.8834136, 1.25865, -2.498152, 0.945098, 1, 0, 1,
-0.8753371, 1.326416, 0.780574, 0.9372549, 1, 0, 1,
-0.8747594, -0.3076614, -2.186021, 0.9333333, 1, 0, 1,
-0.8743286, -1.232242, -4.019173, 0.9254902, 1, 0, 1,
-0.8738444, -0.59968, -2.899757, 0.9215686, 1, 0, 1,
-0.8736412, -1.298632, -0.6171223, 0.9137255, 1, 0, 1,
-0.8728327, -1.56828, -3.370603, 0.9098039, 1, 0, 1,
-0.8705217, 0.9123677, -0.6700007, 0.9019608, 1, 0, 1,
-0.8671553, 0.1142359, -1.856204, 0.8941177, 1, 0, 1,
-0.8610409, -0.930569, -2.130033, 0.8901961, 1, 0, 1,
-0.8607197, 0.1580058, -0.960142, 0.8823529, 1, 0, 1,
-0.8591154, 0.8853378, -1.528021, 0.8784314, 1, 0, 1,
-0.852732, 1.543422, 1.209286, 0.8705882, 1, 0, 1,
-0.8521897, -0.1875139, -1.410526, 0.8666667, 1, 0, 1,
-0.8499488, -0.1918882, -2.649945, 0.8588235, 1, 0, 1,
-0.8442395, 0.9182404, -1.176314, 0.854902, 1, 0, 1,
-0.8399345, -2.406991, -3.931273, 0.8470588, 1, 0, 1,
-0.8321119, 1.61738, -1.468419, 0.8431373, 1, 0, 1,
-0.8264247, 0.3052704, -0.4146337, 0.8352941, 1, 0, 1,
-0.8237244, 0.3346139, -0.1260729, 0.8313726, 1, 0, 1,
-0.8044378, -0.7622575, -2.667239, 0.8235294, 1, 0, 1,
-0.7999299, -0.6788579, -1.998899, 0.8196079, 1, 0, 1,
-0.7912174, 1.555594, -0.3249771, 0.8117647, 1, 0, 1,
-0.7890137, 1.2987, 1.323092, 0.8078431, 1, 0, 1,
-0.7861581, 1.123591, 0.5013143, 0.8, 1, 0, 1,
-0.7857687, 0.852612, -0.605365, 0.7921569, 1, 0, 1,
-0.7851405, -1.051452, -1.471277, 0.7882353, 1, 0, 1,
-0.7839537, 1.484782, -1.339123, 0.7803922, 1, 0, 1,
-0.7838008, 0.4305582, -1.545517, 0.7764706, 1, 0, 1,
-0.7826095, -0.9225534, -2.313515, 0.7686275, 1, 0, 1,
-0.7789836, -1.184045, -2.407939, 0.7647059, 1, 0, 1,
-0.7777176, -0.5434545, -2.461568, 0.7568628, 1, 0, 1,
-0.7753845, 0.03314084, 0.3937301, 0.7529412, 1, 0, 1,
-0.7752755, -1.277867, -2.963904, 0.7450981, 1, 0, 1,
-0.7749563, 0.1871515, -2.31264, 0.7411765, 1, 0, 1,
-0.7661839, -1.509329, -3.293042, 0.7333333, 1, 0, 1,
-0.7655566, 0.9791234, 0.4238313, 0.7294118, 1, 0, 1,
-0.763807, -1.538659, -1.762444, 0.7215686, 1, 0, 1,
-0.760779, -0.9944167, -3.897204, 0.7176471, 1, 0, 1,
-0.7606981, 0.1668042, -2.653636, 0.7098039, 1, 0, 1,
-0.7591318, -1.399745, -5.711203, 0.7058824, 1, 0, 1,
-0.7523067, -1.597124, -2.550453, 0.6980392, 1, 0, 1,
-0.7502989, -0.9508126, -1.980194, 0.6901961, 1, 0, 1,
-0.7499858, -2.075864, -4.557349, 0.6862745, 1, 0, 1,
-0.746696, 0.9051446, -0.01245784, 0.6784314, 1, 0, 1,
-0.7433104, 0.2820787, -2.148256, 0.6745098, 1, 0, 1,
-0.7415101, -1.129824, -3.136508, 0.6666667, 1, 0, 1,
-0.7410941, 0.2830047, -2.151728, 0.6627451, 1, 0, 1,
-0.7393203, 0.4809136, -1.804279, 0.654902, 1, 0, 1,
-0.7357751, -0.6445805, -2.558089, 0.6509804, 1, 0, 1,
-0.7336423, -0.02352783, -1.213236, 0.6431373, 1, 0, 1,
-0.729704, 1.075543, -1.127294, 0.6392157, 1, 0, 1,
-0.7288776, -1.236092, -2.974605, 0.6313726, 1, 0, 1,
-0.7276869, -0.1946107, -1.665354, 0.627451, 1, 0, 1,
-0.7248663, 0.87654, -1.543832, 0.6196079, 1, 0, 1,
-0.7228566, -0.8257073, -3.701634, 0.6156863, 1, 0, 1,
-0.7218018, 1.823016, -0.8262798, 0.6078432, 1, 0, 1,
-0.7115528, 0.4561426, -0.09449117, 0.6039216, 1, 0, 1,
-0.7092881, -1.264089, -2.954998, 0.5960785, 1, 0, 1,
-0.7089891, -0.3602074, -2.169397, 0.5882353, 1, 0, 1,
-0.7066734, -1.151698, -2.654657, 0.5843138, 1, 0, 1,
-0.70564, -0.8414487, -2.681083, 0.5764706, 1, 0, 1,
-0.7054417, -1.954861, -1.425081, 0.572549, 1, 0, 1,
-0.7048563, 0.3755034, 0.7503291, 0.5647059, 1, 0, 1,
-0.7011747, -0.5019258, -3.993608, 0.5607843, 1, 0, 1,
-0.6993406, -1.673169, -1.141444, 0.5529412, 1, 0, 1,
-0.697426, 0.7608346, -0.2608918, 0.5490196, 1, 0, 1,
-0.6889465, -1.161011, -3.275418, 0.5411765, 1, 0, 1,
-0.6850212, 0.736296, -1.016081, 0.5372549, 1, 0, 1,
-0.6844612, -1.014934, -3.03646, 0.5294118, 1, 0, 1,
-0.6722266, -0.07788906, -2.008788, 0.5254902, 1, 0, 1,
-0.6713085, -0.8898236, -3.257272, 0.5176471, 1, 0, 1,
-0.669656, -0.1020963, -0.8382367, 0.5137255, 1, 0, 1,
-0.6696032, 0.09618238, -1.213461, 0.5058824, 1, 0, 1,
-0.6681123, 0.5314093, -0.5460567, 0.5019608, 1, 0, 1,
-0.6674803, 0.863771, 0.6355588, 0.4941176, 1, 0, 1,
-0.6633024, -0.3204827, -1.413129, 0.4862745, 1, 0, 1,
-0.662701, 0.4017025, 0.8868091, 0.4823529, 1, 0, 1,
-0.6623705, 0.2487575, -1.323293, 0.4745098, 1, 0, 1,
-0.6616356, 0.3723898, -1.851267, 0.4705882, 1, 0, 1,
-0.6543198, -1.456628, -4.520545, 0.4627451, 1, 0, 1,
-0.6537525, -0.7947094, -0.5690187, 0.4588235, 1, 0, 1,
-0.6536772, -0.2317514, -0.8441751, 0.4509804, 1, 0, 1,
-0.6487278, -0.6286535, -0.6856673, 0.4470588, 1, 0, 1,
-0.6479734, 0.1724504, -2.188505, 0.4392157, 1, 0, 1,
-0.6472411, 0.6990072, -2.892141, 0.4352941, 1, 0, 1,
-0.6419082, -1.068546, -3.765118, 0.427451, 1, 0, 1,
-0.6403122, -0.2273466, -1.344454, 0.4235294, 1, 0, 1,
-0.6369878, 0.04987496, -2.195793, 0.4156863, 1, 0, 1,
-0.6358951, 0.158176, -2.715721, 0.4117647, 1, 0, 1,
-0.6345196, -0.2756231, -1.75989, 0.4039216, 1, 0, 1,
-0.6308854, 2.415451, -1.831594, 0.3960784, 1, 0, 1,
-0.6238713, -2.041454, -1.164874, 0.3921569, 1, 0, 1,
-0.6226501, -0.2949916, -1.364555, 0.3843137, 1, 0, 1,
-0.6214958, -0.2857994, -4.087805, 0.3803922, 1, 0, 1,
-0.6213113, -0.8926194, -2.60283, 0.372549, 1, 0, 1,
-0.6204452, 0.389787, -1.006014, 0.3686275, 1, 0, 1,
-0.614778, 0.3155868, -0.7442116, 0.3607843, 1, 0, 1,
-0.614634, -1.524001, -1.765834, 0.3568628, 1, 0, 1,
-0.6146336, 0.6496863, -0.2363264, 0.3490196, 1, 0, 1,
-0.6104813, -0.1336871, -2.012504, 0.345098, 1, 0, 1,
-0.6086071, -0.6589608, -2.821511, 0.3372549, 1, 0, 1,
-0.6057293, -1.396895, -2.876346, 0.3333333, 1, 0, 1,
-0.6053326, -0.6060496, -3.732863, 0.3254902, 1, 0, 1,
-0.6038319, -0.8174744, -2.555099, 0.3215686, 1, 0, 1,
-0.6018795, 0.3911264, -2.161092, 0.3137255, 1, 0, 1,
-0.5951957, 0.6241472, -0.568223, 0.3098039, 1, 0, 1,
-0.5936344, -2.306283, -1.960397, 0.3019608, 1, 0, 1,
-0.5928234, 1.768495, 0.02469941, 0.2941177, 1, 0, 1,
-0.5897464, -0.1896536, -0.9171158, 0.2901961, 1, 0, 1,
-0.5891583, 1.081902, -0.9054918, 0.282353, 1, 0, 1,
-0.5875664, -1.44788, -4.24044, 0.2784314, 1, 0, 1,
-0.5861956, -0.4784226, -0.768332, 0.2705882, 1, 0, 1,
-0.5860083, 1.577946, -1.247076, 0.2666667, 1, 0, 1,
-0.5839298, 2.224941, 0.7416218, 0.2588235, 1, 0, 1,
-0.5819554, -1.610631, -1.778233, 0.254902, 1, 0, 1,
-0.5615446, 0.7592498, 0.8361894, 0.2470588, 1, 0, 1,
-0.5579821, 0.866928, -0.9088448, 0.2431373, 1, 0, 1,
-0.5575795, -0.8948458, -4.411306, 0.2352941, 1, 0, 1,
-0.5565701, 0.02494996, 0.7081417, 0.2313726, 1, 0, 1,
-0.5563139, 1.093589, -0.2901548, 0.2235294, 1, 0, 1,
-0.5559235, 0.02747555, -2.167828, 0.2196078, 1, 0, 1,
-0.555028, 1.038486, 0.07295056, 0.2117647, 1, 0, 1,
-0.553933, 1.356346, -2.14363, 0.2078431, 1, 0, 1,
-0.5516222, -0.3344621, -1.309311, 0.2, 1, 0, 1,
-0.5505879, 1.277381, -0.356718, 0.1921569, 1, 0, 1,
-0.5505049, -0.1955123, -2.039193, 0.1882353, 1, 0, 1,
-0.5392975, -1.974431, -2.685849, 0.1803922, 1, 0, 1,
-0.5367547, 0.9754146, 0.7112948, 0.1764706, 1, 0, 1,
-0.5308497, -0.6934109, -3.560308, 0.1686275, 1, 0, 1,
-0.5295395, -0.7429255, -3.066453, 0.1647059, 1, 0, 1,
-0.5254228, -0.6596698, -2.202568, 0.1568628, 1, 0, 1,
-0.5194948, 1.084979, 0.4929373, 0.1529412, 1, 0, 1,
-0.5157977, -1.06529, -1.525301, 0.145098, 1, 0, 1,
-0.5154147, 0.6644659, -1.129777, 0.1411765, 1, 0, 1,
-0.5097177, 2.187444, -0.1245131, 0.1333333, 1, 0, 1,
-0.5032737, 1.397556, -0.09317337, 0.1294118, 1, 0, 1,
-0.5015562, -0.9493098, -3.104855, 0.1215686, 1, 0, 1,
-0.5013285, 0.4380671, -1.523619, 0.1176471, 1, 0, 1,
-0.5006626, 0.7325572, -1.497481, 0.1098039, 1, 0, 1,
-0.4962054, 0.4061294, -0.2707245, 0.1058824, 1, 0, 1,
-0.4955055, 2.301121, -1.568558, 0.09803922, 1, 0, 1,
-0.4937844, -1.153393, -1.848742, 0.09019608, 1, 0, 1,
-0.4800928, -0.1788331, -1.198075, 0.08627451, 1, 0, 1,
-0.4778933, -0.08612439, -2.436366, 0.07843138, 1, 0, 1,
-0.4770958, 0.2504598, -0.5463461, 0.07450981, 1, 0, 1,
-0.472588, -0.5391282, -2.852566, 0.06666667, 1, 0, 1,
-0.4715408, 0.8714023, -2.050087, 0.0627451, 1, 0, 1,
-0.4678226, 0.0108269, -2.514303, 0.05490196, 1, 0, 1,
-0.4676169, -0.7216018, -3.503283, 0.05098039, 1, 0, 1,
-0.4558607, -1.297647, -2.509735, 0.04313726, 1, 0, 1,
-0.4547415, 0.6450367, -1.365395, 0.03921569, 1, 0, 1,
-0.45177, -1.972461, -4.064028, 0.03137255, 1, 0, 1,
-0.4517691, 1.162204, 0.02043789, 0.02745098, 1, 0, 1,
-0.4503547, -0.9506623, -2.303387, 0.01960784, 1, 0, 1,
-0.4469457, 0.5602636, 0.9080845, 0.01568628, 1, 0, 1,
-0.4400342, 0.2077878, -2.188138, 0.007843138, 1, 0, 1,
-0.4346491, -0.8809736, -4.15208, 0.003921569, 1, 0, 1,
-0.4333779, -1.323219, -2.12743, 0, 1, 0.003921569, 1,
-0.4301616, 1.47265, -0.2645715, 0, 1, 0.01176471, 1,
-0.4286659, -0.8170616, -1.99536, 0, 1, 0.01568628, 1,
-0.4257342, 1.963406, -0.4494383, 0, 1, 0.02352941, 1,
-0.4255856, -0.6146851, -1.811121, 0, 1, 0.02745098, 1,
-0.4255462, -1.395773, -2.344876, 0, 1, 0.03529412, 1,
-0.4241585, -1.137119, -3.887093, 0, 1, 0.03921569, 1,
-0.423357, 0.9147758, 1.357476, 0, 1, 0.04705882, 1,
-0.41692, -0.5475937, -2.35876, 0, 1, 0.05098039, 1,
-0.4129352, 1.244333, 0.506457, 0, 1, 0.05882353, 1,
-0.4103175, -0.6359863, -1.543813, 0, 1, 0.0627451, 1,
-0.4078246, 1.335106, 1.056163, 0, 1, 0.07058824, 1,
-0.4070304, -0.8453692, -3.016074, 0, 1, 0.07450981, 1,
-0.4022954, -1.349539, -0.3196571, 0, 1, 0.08235294, 1,
-0.3984075, -0.7181273, -3.171692, 0, 1, 0.08627451, 1,
-0.3977771, -1.326988, -1.547717, 0, 1, 0.09411765, 1,
-0.3899373, 0.2677872, -1.317021, 0, 1, 0.1019608, 1,
-0.3879082, 1.006726, -0.01592211, 0, 1, 0.1058824, 1,
-0.3869575, -0.3638646, -1.626114, 0, 1, 0.1137255, 1,
-0.3857012, 0.3668455, -1.731612, 0, 1, 0.1176471, 1,
-0.3845744, -0.3763444, -2.100987, 0, 1, 0.1254902, 1,
-0.3844025, -2.355547, -3.923601, 0, 1, 0.1294118, 1,
-0.382428, -1.936233, -1.42689, 0, 1, 0.1372549, 1,
-0.3814038, 0.08760268, -0.7497203, 0, 1, 0.1411765, 1,
-0.3794002, 0.04598377, -2.895404, 0, 1, 0.1490196, 1,
-0.3786244, 0.1926122, -0.9534405, 0, 1, 0.1529412, 1,
-0.3765873, 1.387864, 0.6050504, 0, 1, 0.1607843, 1,
-0.3753712, 0.941869, 0.9072483, 0, 1, 0.1647059, 1,
-0.3737378, -1.13522, -2.085371, 0, 1, 0.172549, 1,
-0.3737363, 0.5730766, 0.5173117, 0, 1, 0.1764706, 1,
-0.3721008, 0.5954923, -1.867386, 0, 1, 0.1843137, 1,
-0.3696534, 0.3370504, -0.22686, 0, 1, 0.1882353, 1,
-0.3674104, 0.224116, -2.21473, 0, 1, 0.1960784, 1,
-0.3634366, 1.04446, -1.11902, 0, 1, 0.2039216, 1,
-0.3620518, -1.141787, -3.721092, 0, 1, 0.2078431, 1,
-0.3591822, 0.9950176, -0.08707583, 0, 1, 0.2156863, 1,
-0.3552302, -1.549582, -4.477758, 0, 1, 0.2196078, 1,
-0.3546859, 0.7073295, -1.184865, 0, 1, 0.227451, 1,
-0.354528, -0.6189866, -2.335176, 0, 1, 0.2313726, 1,
-0.3512163, 0.7897655, 0.1396922, 0, 1, 0.2392157, 1,
-0.3479916, 0.5477228, 0.7283651, 0, 1, 0.2431373, 1,
-0.3459194, -0.8045399, -3.595519, 0, 1, 0.2509804, 1,
-0.336238, 1.737481, 1.028458, 0, 1, 0.254902, 1,
-0.3360603, -1.048385, -2.848826, 0, 1, 0.2627451, 1,
-0.3359638, -1.026788, -3.38158, 0, 1, 0.2666667, 1,
-0.3349317, 0.3726445, -0.3651787, 0, 1, 0.2745098, 1,
-0.3345027, 1.566827, 0.02842098, 0, 1, 0.2784314, 1,
-0.3321432, 0.6856025, -1.293642, 0, 1, 0.2862745, 1,
-0.3293557, 0.7539145, -0.5358192, 0, 1, 0.2901961, 1,
-0.328298, -0.03392896, -3.261764, 0, 1, 0.2980392, 1,
-0.3274882, -2.812396, -1.999533, 0, 1, 0.3058824, 1,
-0.3237283, -0.01890197, -1.421712, 0, 1, 0.3098039, 1,
-0.3210219, 0.5664387, -0.8535593, 0, 1, 0.3176471, 1,
-0.3188903, -0.7685575, -2.222116, 0, 1, 0.3215686, 1,
-0.3172702, 1.107992, 0.4546436, 0, 1, 0.3294118, 1,
-0.3169329, -0.955384, -3.470252, 0, 1, 0.3333333, 1,
-0.3156497, -0.4285511, -2.7, 0, 1, 0.3411765, 1,
-0.3146851, 0.5058219, -1.455805, 0, 1, 0.345098, 1,
-0.3107479, -0.273826, -2.95138, 0, 1, 0.3529412, 1,
-0.3100554, 1.296263, 0.07698625, 0, 1, 0.3568628, 1,
-0.3078397, -1.822919, -2.146609, 0, 1, 0.3647059, 1,
-0.2968941, -0.3838827, -1.750066, 0, 1, 0.3686275, 1,
-0.2963862, -0.807621, -1.652746, 0, 1, 0.3764706, 1,
-0.2917352, 1.126324, 0.8828353, 0, 1, 0.3803922, 1,
-0.2907789, -0.3361454, -2.559896, 0, 1, 0.3882353, 1,
-0.2882376, -0.6411526, -1.501787, 0, 1, 0.3921569, 1,
-0.2761299, 0.213839, -2.744433, 0, 1, 0.4, 1,
-0.2747435, 0.8314478, -0.4465729, 0, 1, 0.4078431, 1,
-0.2738312, 0.2037618, -1.387472, 0, 1, 0.4117647, 1,
-0.2704849, 1.431443, -1.092452, 0, 1, 0.4196078, 1,
-0.2702554, 0.193671, 0.1742253, 0, 1, 0.4235294, 1,
-0.2670271, 0.8851296, -1.433644, 0, 1, 0.4313726, 1,
-0.2628137, 0.4382685, -0.140177, 0, 1, 0.4352941, 1,
-0.2621446, 1.74273, 0.5922974, 0, 1, 0.4431373, 1,
-0.2587272, -1.267297, -2.014445, 0, 1, 0.4470588, 1,
-0.257035, -0.4959506, -0.663269, 0, 1, 0.454902, 1,
-0.2560062, 1.097015, -0.2962952, 0, 1, 0.4588235, 1,
-0.2549644, 0.8257833, -0.6526816, 0, 1, 0.4666667, 1,
-0.2546839, 1.644101, 0.5590594, 0, 1, 0.4705882, 1,
-0.2524456, 0.5706872, -2.086571, 0, 1, 0.4784314, 1,
-0.2514467, -1.30944, -3.650977, 0, 1, 0.4823529, 1,
-0.2489626, 1.855665, 0.2116722, 0, 1, 0.4901961, 1,
-0.247317, 0.03366994, -1.959053, 0, 1, 0.4941176, 1,
-0.2443761, 1.343123, -0.5369194, 0, 1, 0.5019608, 1,
-0.2438628, 0.728386, 2.510831, 0, 1, 0.509804, 1,
-0.2420031, 0.2179963, -0.941888, 0, 1, 0.5137255, 1,
-0.2413075, -0.9001737, -1.749545, 0, 1, 0.5215687, 1,
-0.2411045, 0.1531085, -1.373902, 0, 1, 0.5254902, 1,
-0.2375799, 2.308951, -1.222213, 0, 1, 0.5333334, 1,
-0.2357224, -2.137072, -2.499053, 0, 1, 0.5372549, 1,
-0.2353462, 1.847824, -1.351379, 0, 1, 0.5450981, 1,
-0.2351731, 0.5582137, 1.684529, 0, 1, 0.5490196, 1,
-0.2335665, 0.1992362, -0.5204825, 0, 1, 0.5568628, 1,
-0.2325241, -1.195132, -3.855185, 0, 1, 0.5607843, 1,
-0.2302681, 1.68649, -0.5063783, 0, 1, 0.5686275, 1,
-0.2233576, 1.783161, 0.7866995, 0, 1, 0.572549, 1,
-0.2226519, -0.546007, -2.942958, 0, 1, 0.5803922, 1,
-0.2219329, 0.1523825, -1.369845, 0, 1, 0.5843138, 1,
-0.2217122, 0.4605869, 1.578839, 0, 1, 0.5921569, 1,
-0.2196454, 0.9225549, 1.668551, 0, 1, 0.5960785, 1,
-0.2165112, -0.8130988, -1.84306, 0, 1, 0.6039216, 1,
-0.216422, -1.16777, -2.540369, 0, 1, 0.6117647, 1,
-0.2136607, 1.633778, 0.5632527, 0, 1, 0.6156863, 1,
-0.2116615, 0.5642543, -1.005129, 0, 1, 0.6235294, 1,
-0.206675, -0.7523224, -3.315189, 0, 1, 0.627451, 1,
-0.2007101, -0.07435776, -1.897934, 0, 1, 0.6352941, 1,
-0.1969241, 3.533346, 0.5505369, 0, 1, 0.6392157, 1,
-0.1892337, 0.8963993, -0.365285, 0, 1, 0.6470588, 1,
-0.1829345, -1.401726, -2.827995, 0, 1, 0.6509804, 1,
-0.1817389, 0.7973813, 0.06953634, 0, 1, 0.6588235, 1,
-0.1814315, -0.08220852, -1.317302, 0, 1, 0.6627451, 1,
-0.1809354, 0.9111325, -0.1147752, 0, 1, 0.6705883, 1,
-0.1808652, 0.5481814, -2.319748, 0, 1, 0.6745098, 1,
-0.1797702, -0.4007224, -1.571614, 0, 1, 0.682353, 1,
-0.1793364, 0.5120538, -0.9368784, 0, 1, 0.6862745, 1,
-0.1786722, -0.4853031, -2.769386, 0, 1, 0.6941177, 1,
-0.1785661, -1.472933, -4.627025, 0, 1, 0.7019608, 1,
-0.1762948, -1.754388, -2.255202, 0, 1, 0.7058824, 1,
-0.1741922, 0.8489294, -1.423735, 0, 1, 0.7137255, 1,
-0.173018, 2.627606, 0.2468043, 0, 1, 0.7176471, 1,
-0.1711811, 0.02568249, -2.151357, 0, 1, 0.7254902, 1,
-0.170251, 0.6381386, -1.893999, 0, 1, 0.7294118, 1,
-0.1701975, 0.5488493, 0.9132239, 0, 1, 0.7372549, 1,
-0.1685502, -1.093001, -3.400387, 0, 1, 0.7411765, 1,
-0.1677012, -0.0393972, -1.433404, 0, 1, 0.7490196, 1,
-0.1659964, 0.5341797, 1.091089, 0, 1, 0.7529412, 1,
-0.1651134, 0.4230326, -0.3261441, 0, 1, 0.7607843, 1,
-0.1589012, -0.3556339, -1.694699, 0, 1, 0.7647059, 1,
-0.1581724, 0.6104969, 0.2663096, 0, 1, 0.772549, 1,
-0.1575058, 0.03223878, -0.2312267, 0, 1, 0.7764706, 1,
-0.1547764, 0.3416266, -1.151618, 0, 1, 0.7843137, 1,
-0.1535137, -0.08776828, -0.6641681, 0, 1, 0.7882353, 1,
-0.1495009, -0.7868629, -3.035691, 0, 1, 0.7960784, 1,
-0.1459532, -0.7971902, -4.10875, 0, 1, 0.8039216, 1,
-0.1457219, 0.2231847, -1.405181, 0, 1, 0.8078431, 1,
-0.1383671, -0.1189749, -3.222832, 0, 1, 0.8156863, 1,
-0.1302006, 1.387139, -0.9103405, 0, 1, 0.8196079, 1,
-0.1301023, -0.3241056, -2.82976, 0, 1, 0.827451, 1,
-0.1271958, -0.7296759, -3.77162, 0, 1, 0.8313726, 1,
-0.1250126, 1.427768, -1.756082, 0, 1, 0.8392157, 1,
-0.1223982, 0.1014444, -1.425895, 0, 1, 0.8431373, 1,
-0.1196158, -0.01379513, -1.064557, 0, 1, 0.8509804, 1,
-0.1182395, -0.6811272, -4.838143, 0, 1, 0.854902, 1,
-0.1181475, -0.4464597, -2.896956, 0, 1, 0.8627451, 1,
-0.1092784, 0.7776595, -0.2606961, 0, 1, 0.8666667, 1,
-0.108183, 0.7201118, 0.2634256, 0, 1, 0.8745098, 1,
-0.09815022, -0.3196488, -4.839729, 0, 1, 0.8784314, 1,
-0.09773013, 0.9384272, -0.03513594, 0, 1, 0.8862745, 1,
-0.09727944, 0.2817213, -0.1611012, 0, 1, 0.8901961, 1,
-0.09661353, 1.225495, 0.6584086, 0, 1, 0.8980392, 1,
-0.09660835, -0.7897473, -2.009162, 0, 1, 0.9058824, 1,
-0.09536065, -0.8658974, -3.222758, 0, 1, 0.9098039, 1,
-0.09350671, -2.303096, -2.947947, 0, 1, 0.9176471, 1,
-0.09195909, 0.6629761, -2.46162, 0, 1, 0.9215686, 1,
-0.09033403, -0.8636879, -3.235374, 0, 1, 0.9294118, 1,
-0.09015824, 0.2446952, 1.801812, 0, 1, 0.9333333, 1,
-0.090034, -0.5290393, -3.59637, 0, 1, 0.9411765, 1,
-0.0882194, -2.095972, -2.363087, 0, 1, 0.945098, 1,
-0.08729694, -0.1608199, -2.410349, 0, 1, 0.9529412, 1,
-0.08648615, 0.6376033, 0.2334755, 0, 1, 0.9568627, 1,
-0.08310287, -0.7012822, -2.742649, 0, 1, 0.9647059, 1,
-0.07912445, -0.3415652, -1.059845, 0, 1, 0.9686275, 1,
-0.0679751, 1.352683, 0.04539723, 0, 1, 0.9764706, 1,
-0.06322762, -1.755235, -1.073008, 0, 1, 0.9803922, 1,
-0.06123696, 0.6275865, 1.498203, 0, 1, 0.9882353, 1,
-0.05759073, 0.799538, -0.11056, 0, 1, 0.9921569, 1,
-0.05543228, 1.17119, -0.06247063, 0, 1, 1, 1,
-0.05513005, 0.2807804, 0.3172267, 0, 0.9921569, 1, 1,
-0.04446519, -0.6824566, -4.224277, 0, 0.9882353, 1, 1,
-0.04313673, -1.921417, -0.9769207, 0, 0.9803922, 1, 1,
-0.03747982, -1.683983, -5.118131, 0, 0.9764706, 1, 1,
-0.03696512, -1.378406, -2.37096, 0, 0.9686275, 1, 1,
-0.03614755, -2.916631, -3.426563, 0, 0.9647059, 1, 1,
-0.03127571, -0.303692, -3.619639, 0, 0.9568627, 1, 1,
-0.02871563, 1.255093, 1.728583, 0, 0.9529412, 1, 1,
-0.02542169, -0.8310897, -3.644746, 0, 0.945098, 1, 1,
-0.02159003, -2.486028, -2.70934, 0, 0.9411765, 1, 1,
-0.01067401, 2.080159, -1.112218, 0, 0.9333333, 1, 1,
-0.009037949, 1.430078, -0.7745128, 0, 0.9294118, 1, 1,
-0.007844909, 0.4298684, -1.265231, 0, 0.9215686, 1, 1,
-0.007002382, 0.3982371, -1.835453, 0, 0.9176471, 1, 1,
-0.004100132, -1.109538, -2.609163, 0, 0.9098039, 1, 1,
-0.00346834, 0.2929674, -0.2441506, 0, 0.9058824, 1, 1,
-0.002401281, 0.6720781, -0.315669, 0, 0.8980392, 1, 1,
-0.0008940608, -0.5709037, -3.194762, 0, 0.8901961, 1, 1,
0.00284051, -0.9221951, 3.687655, 0, 0.8862745, 1, 1,
0.00550047, -0.0167952, 2.586928, 0, 0.8784314, 1, 1,
0.006132471, -1.245114, 4.618945, 0, 0.8745098, 1, 1,
0.007236503, 0.4465111, -2.238446, 0, 0.8666667, 1, 1,
0.01125714, 0.2065271, 1.176005, 0, 0.8627451, 1, 1,
0.02503752, 0.1303972, 1.446968, 0, 0.854902, 1, 1,
0.02630853, -0.238284, 2.848257, 0, 0.8509804, 1, 1,
0.02994856, -1.196106, 3.508115, 0, 0.8431373, 1, 1,
0.0320327, 0.6254714, -0.8124937, 0, 0.8392157, 1, 1,
0.03473168, 0.4172587, 1.908917, 0, 0.8313726, 1, 1,
0.03505554, 1.779835, -1.838734, 0, 0.827451, 1, 1,
0.03699059, 0.6156712, -0.4144793, 0, 0.8196079, 1, 1,
0.03974426, -0.7656471, 2.397898, 0, 0.8156863, 1, 1,
0.03985926, -0.4876043, 2.814527, 0, 0.8078431, 1, 1,
0.04081586, 0.5352588, 0.4806488, 0, 0.8039216, 1, 1,
0.04408385, -0.1521129, 3.049956, 0, 0.7960784, 1, 1,
0.0500683, -0.2123731, 3.585713, 0, 0.7882353, 1, 1,
0.05244569, 0.6659576, -1.386188, 0, 0.7843137, 1, 1,
0.05296043, 1.086318, 0.7676314, 0, 0.7764706, 1, 1,
0.05581421, 0.08359236, 0.2610419, 0, 0.772549, 1, 1,
0.05584265, -0.1059213, 3.368872, 0, 0.7647059, 1, 1,
0.05600797, -1.3901, 1.523612, 0, 0.7607843, 1, 1,
0.05788901, -2.796612, 1.806043, 0, 0.7529412, 1, 1,
0.05921208, -0.6656427, 3.136906, 0, 0.7490196, 1, 1,
0.05925342, -0.400223, 2.585584, 0, 0.7411765, 1, 1,
0.06040925, -0.1558908, 3.055111, 0, 0.7372549, 1, 1,
0.06257084, -0.2244818, 0.7994245, 0, 0.7294118, 1, 1,
0.06335388, 2.092906, 0.7974277, 0, 0.7254902, 1, 1,
0.06405509, 1.038581, -0.08132832, 0, 0.7176471, 1, 1,
0.07157262, -0.404696, 3.98786, 0, 0.7137255, 1, 1,
0.07425956, 0.6353335, 0.09699827, 0, 0.7058824, 1, 1,
0.07460861, 0.0557816, 1.401528, 0, 0.6980392, 1, 1,
0.07485902, -0.2314624, 3.665193, 0, 0.6941177, 1, 1,
0.07500937, 0.7934262, -0.369147, 0, 0.6862745, 1, 1,
0.07603921, 0.2489844, 0.401796, 0, 0.682353, 1, 1,
0.08067755, -0.8873731, 2.976616, 0, 0.6745098, 1, 1,
0.08085431, 1.228345, -0.9551808, 0, 0.6705883, 1, 1,
0.08210008, -0.4282619, 2.36599, 0, 0.6627451, 1, 1,
0.08233696, 1.848849, 1.384284, 0, 0.6588235, 1, 1,
0.08276379, -1.083805, 1.752026, 0, 0.6509804, 1, 1,
0.0832354, -0.6719791, 3.429837, 0, 0.6470588, 1, 1,
0.08940767, -0.4233057, 2.472965, 0, 0.6392157, 1, 1,
0.09258039, 0.02226008, -0.1307167, 0, 0.6352941, 1, 1,
0.09493572, 1.067205, -0.9381106, 0, 0.627451, 1, 1,
0.1050625, -0.3366428, 3.642036, 0, 0.6235294, 1, 1,
0.1078097, 0.0714875, 2.113863, 0, 0.6156863, 1, 1,
0.112379, 0.2732734, 0.6524441, 0, 0.6117647, 1, 1,
0.1142492, 1.226742, -0.2664214, 0, 0.6039216, 1, 1,
0.1158575, 1.009906, 0.5136374, 0, 0.5960785, 1, 1,
0.1197996, 1.130641, -0.7977811, 0, 0.5921569, 1, 1,
0.1218248, -0.8611131, 3.672266, 0, 0.5843138, 1, 1,
0.1227672, -1.001093, 2.555211, 0, 0.5803922, 1, 1,
0.1262419, 1.075903, -1.391592, 0, 0.572549, 1, 1,
0.1276425, -1.5284, 1.303206, 0, 0.5686275, 1, 1,
0.1276769, -0.6120054, 1.559934, 0, 0.5607843, 1, 1,
0.131301, -1.852459, 1.833205, 0, 0.5568628, 1, 1,
0.1396037, -1.042466, 4.020468, 0, 0.5490196, 1, 1,
0.1415125, -0.2820172, 2.89974, 0, 0.5450981, 1, 1,
0.141794, -0.2340283, 2.097263, 0, 0.5372549, 1, 1,
0.1454522, -1.251101, 3.063862, 0, 0.5333334, 1, 1,
0.1469107, -0.114407, 0.7907274, 0, 0.5254902, 1, 1,
0.1519738, -0.1604649, 3.820651, 0, 0.5215687, 1, 1,
0.1532845, 1.615185, 0.2650104, 0, 0.5137255, 1, 1,
0.1545586, -1.238257, 4.008397, 0, 0.509804, 1, 1,
0.1545996, 0.9455223, 1.312362, 0, 0.5019608, 1, 1,
0.1548509, 0.3152499, 2.262319, 0, 0.4941176, 1, 1,
0.1553137, 0.2357926, 1.870668, 0, 0.4901961, 1, 1,
0.1571375, -1.031652, 1.307061, 0, 0.4823529, 1, 1,
0.1601758, -0.5860508, 3.982889, 0, 0.4784314, 1, 1,
0.1602915, -0.8359756, 2.841337, 0, 0.4705882, 1, 1,
0.1616264, -0.860433, 2.261122, 0, 0.4666667, 1, 1,
0.1627032, 1.371926, -0.1460988, 0, 0.4588235, 1, 1,
0.1646336, -1.147257, 4.69919, 0, 0.454902, 1, 1,
0.164767, -0.9739226, 3.857398, 0, 0.4470588, 1, 1,
0.1649034, -0.4298284, 0.7283266, 0, 0.4431373, 1, 1,
0.1722988, -0.960468, 1.396481, 0, 0.4352941, 1, 1,
0.177328, -0.7353552, 3.5265, 0, 0.4313726, 1, 1,
0.1777123, -0.9045513, 3.547926, 0, 0.4235294, 1, 1,
0.180936, 0.0833956, 0.1844535, 0, 0.4196078, 1, 1,
0.1810722, 1.026186, 1.837063, 0, 0.4117647, 1, 1,
0.1865263, 0.9283408, 1.441817, 0, 0.4078431, 1, 1,
0.1881239, 0.3044291, 2.467724, 0, 0.4, 1, 1,
0.1905759, -0.2065951, 2.760764, 0, 0.3921569, 1, 1,
0.1909095, -0.6246284, 2.308839, 0, 0.3882353, 1, 1,
0.1981802, -0.8152367, -0.008416227, 0, 0.3803922, 1, 1,
0.2013735, -0.5414895, 3.349721, 0, 0.3764706, 1, 1,
0.2079776, -0.5184805, 0.2173126, 0, 0.3686275, 1, 1,
0.2093899, 1.232126, 0.8861894, 0, 0.3647059, 1, 1,
0.2228155, -1.240545, 2.437834, 0, 0.3568628, 1, 1,
0.2270563, -0.7087907, 3.776902, 0, 0.3529412, 1, 1,
0.2402814, 0.2731928, -0.6024303, 0, 0.345098, 1, 1,
0.2436816, -0.0861206, 2.447254, 0, 0.3411765, 1, 1,
0.2483001, -0.8494698, 2.844774, 0, 0.3333333, 1, 1,
0.2499383, 0.2391113, 1.068944, 0, 0.3294118, 1, 1,
0.2514094, -0.5745306, 3.365371, 0, 0.3215686, 1, 1,
0.2557049, 1.449154, 1.188738, 0, 0.3176471, 1, 1,
0.2563112, 0.3064973, 1.482787, 0, 0.3098039, 1, 1,
0.2582462, 0.67883, 0.5460827, 0, 0.3058824, 1, 1,
0.2633108, 0.9886502, 0.9089192, 0, 0.2980392, 1, 1,
0.2645075, -0.1225107, 1.873362, 0, 0.2901961, 1, 1,
0.2670948, 0.03786441, 0.9893652, 0, 0.2862745, 1, 1,
0.2718938, -0.9963058, 2.726259, 0, 0.2784314, 1, 1,
0.2734904, -0.9328555, 3.461375, 0, 0.2745098, 1, 1,
0.2760486, -0.5358677, 1.593761, 0, 0.2666667, 1, 1,
0.2797395, 0.4415815, 0.4736386, 0, 0.2627451, 1, 1,
0.2884324, -1.509214, 4.364528, 0, 0.254902, 1, 1,
0.290579, 1.312948, -0.4704869, 0, 0.2509804, 1, 1,
0.2931392, 1.010332, -0.125494, 0, 0.2431373, 1, 1,
0.2968965, -1.27141, 3.187606, 0, 0.2392157, 1, 1,
0.2973913, -0.04650717, 2.84327, 0, 0.2313726, 1, 1,
0.299058, 0.1443185, 2.709833, 0, 0.227451, 1, 1,
0.2995184, -1.633304, 3.233314, 0, 0.2196078, 1, 1,
0.3045266, -0.9088577, 2.573876, 0, 0.2156863, 1, 1,
0.3071655, 1.818242, 0.2277552, 0, 0.2078431, 1, 1,
0.3141389, 0.8613532, 0.9266896, 0, 0.2039216, 1, 1,
0.3148246, -0.3104548, 1.757516, 0, 0.1960784, 1, 1,
0.3181958, 1.292367, 0.06286995, 0, 0.1882353, 1, 1,
0.3183889, -0.02226969, 0.6411489, 0, 0.1843137, 1, 1,
0.32247, -0.7820537, 2.422116, 0, 0.1764706, 1, 1,
0.3260414, -0.5924325, 3.324619, 0, 0.172549, 1, 1,
0.3336918, -0.15675, 2.443063, 0, 0.1647059, 1, 1,
0.3342203, 0.1310421, 1.131958, 0, 0.1607843, 1, 1,
0.3346693, -1.293512, 1.870105, 0, 0.1529412, 1, 1,
0.3371976, 0.1717065, 1.233881, 0, 0.1490196, 1, 1,
0.3444779, 2.081825, -0.8213184, 0, 0.1411765, 1, 1,
0.3446927, 0.08077807, 1.381828, 0, 0.1372549, 1, 1,
0.3520822, 1.519257, -0.6112654, 0, 0.1294118, 1, 1,
0.3522679, -0.4395354, 2.452102, 0, 0.1254902, 1, 1,
0.3525829, -1.954383, 1.51971, 0, 0.1176471, 1, 1,
0.3536416, 0.6092872, -0.3777459, 0, 0.1137255, 1, 1,
0.3594576, -0.6203842, 2.938827, 0, 0.1058824, 1, 1,
0.3617254, -2.049855, 1.850163, 0, 0.09803922, 1, 1,
0.3631475, 1.138397, 0.4578116, 0, 0.09411765, 1, 1,
0.3663881, 0.2605268, 1.455812, 0, 0.08627451, 1, 1,
0.3706971, -1.547978, 2.998843, 0, 0.08235294, 1, 1,
0.3715622, -0.6833977, 1.414759, 0, 0.07450981, 1, 1,
0.3748817, 0.4711743, 1.50611, 0, 0.07058824, 1, 1,
0.376983, -0.2713791, 1.944876, 0, 0.0627451, 1, 1,
0.3792947, -0.4213132, 2.957371, 0, 0.05882353, 1, 1,
0.3817612, -0.3693801, 2.193052, 0, 0.05098039, 1, 1,
0.382122, 1.189219, 0.4824254, 0, 0.04705882, 1, 1,
0.3844502, 0.7383133, 0.5117483, 0, 0.03921569, 1, 1,
0.387291, -0.8792192, 3.551811, 0, 0.03529412, 1, 1,
0.3876073, -0.81892, 4.210904, 0, 0.02745098, 1, 1,
0.3895109, 0.1616225, 1.965358, 0, 0.02352941, 1, 1,
0.391303, -1.286212, 2.483814, 0, 0.01568628, 1, 1,
0.3934237, 0.3966464, 0.5408158, 0, 0.01176471, 1, 1,
0.4018302, -0.8190686, 3.597668, 0, 0.003921569, 1, 1,
0.4114002, 1.052775, 1.063663, 0.003921569, 0, 1, 1,
0.4170512, 0.5163538, -0.09556487, 0.007843138, 0, 1, 1,
0.4244983, -2.350907, 4.329578, 0.01568628, 0, 1, 1,
0.43462, -1.15756, 1.926032, 0.01960784, 0, 1, 1,
0.4360411, 0.3193892, 3.853989, 0.02745098, 0, 1, 1,
0.4462382, -0.5568445, 2.708164, 0.03137255, 0, 1, 1,
0.4473799, -1.369334, 3.389441, 0.03921569, 0, 1, 1,
0.4500908, 1.60144, 0.6490614, 0.04313726, 0, 1, 1,
0.4501393, 0.4706346, 3.310674, 0.05098039, 0, 1, 1,
0.4556924, -0.6021668, 3.358621, 0.05490196, 0, 1, 1,
0.4557579, 0.6249105, 2.117254, 0.0627451, 0, 1, 1,
0.4569602, -0.1846124, 3.931555, 0.06666667, 0, 1, 1,
0.4579293, 0.5292029, 1.135329, 0.07450981, 0, 1, 1,
0.4619416, -0.5490473, 1.465058, 0.07843138, 0, 1, 1,
0.4650965, 0.2655202, -0.476271, 0.08627451, 0, 1, 1,
0.4651773, 0.6605742, -0.5813155, 0.09019608, 0, 1, 1,
0.4689403, 0.3798628, 1.911472, 0.09803922, 0, 1, 1,
0.469488, -0.7373666, 2.732107, 0.1058824, 0, 1, 1,
0.4710637, -0.7206289, 2.687116, 0.1098039, 0, 1, 1,
0.4742137, -0.296027, 1.77616, 0.1176471, 0, 1, 1,
0.4759305, -0.8277577, 3.507041, 0.1215686, 0, 1, 1,
0.478601, 1.755858, 0.278869, 0.1294118, 0, 1, 1,
0.4794075, -0.04335967, 2.164958, 0.1333333, 0, 1, 1,
0.4816133, 0.4279168, 1.635598, 0.1411765, 0, 1, 1,
0.4819816, 0.01557357, 2.688969, 0.145098, 0, 1, 1,
0.4836602, 0.0883516, 1.765307, 0.1529412, 0, 1, 1,
0.4872102, 0.1622695, 0.9577385, 0.1568628, 0, 1, 1,
0.4896672, 0.543358, 1.557557, 0.1647059, 0, 1, 1,
0.4928189, -0.4451969, 3.220006, 0.1686275, 0, 1, 1,
0.4950887, -0.1440366, 1.471078, 0.1764706, 0, 1, 1,
0.4972117, 1.177224, -0.5954286, 0.1803922, 0, 1, 1,
0.498248, 0.8277153, 1.066514, 0.1882353, 0, 1, 1,
0.5027373, -1.084527, 1.332137, 0.1921569, 0, 1, 1,
0.5068532, 0.2637923, 0.519778, 0.2, 0, 1, 1,
0.5076706, -0.1174529, -0.178549, 0.2078431, 0, 1, 1,
0.5088395, -0.9849278, 2.552884, 0.2117647, 0, 1, 1,
0.509148, -0.6615407, 1.237225, 0.2196078, 0, 1, 1,
0.5111065, 0.3059866, 0.8935384, 0.2235294, 0, 1, 1,
0.5128344, 0.448157, -0.2386865, 0.2313726, 0, 1, 1,
0.5151153, -1.030333, 1.730117, 0.2352941, 0, 1, 1,
0.5185758, -0.3669831, 2.096901, 0.2431373, 0, 1, 1,
0.5272726, -1.997544, 2.204546, 0.2470588, 0, 1, 1,
0.527477, -0.6083701, 0.968984, 0.254902, 0, 1, 1,
0.5340029, 0.02957067, 3.554017, 0.2588235, 0, 1, 1,
0.5373601, 1.791822, 1.848707, 0.2666667, 0, 1, 1,
0.5387672, -0.1488437, 0.9464749, 0.2705882, 0, 1, 1,
0.5468302, -0.08230143, 2.199789, 0.2784314, 0, 1, 1,
0.5480105, 1.985469, 0.3360661, 0.282353, 0, 1, 1,
0.5483287, -1.620499, 5.891028, 0.2901961, 0, 1, 1,
0.5536497, 0.7337358, 2.358282, 0.2941177, 0, 1, 1,
0.5610552, -0.3628128, 1.027737, 0.3019608, 0, 1, 1,
0.5619971, 0.000991577, 2.629603, 0.3098039, 0, 1, 1,
0.5639793, -0.8549971, 1.524439, 0.3137255, 0, 1, 1,
0.564886, 0.4670404, 2.052452, 0.3215686, 0, 1, 1,
0.5691183, -0.09235922, 1.181663, 0.3254902, 0, 1, 1,
0.5728506, -0.04988984, 0.601766, 0.3333333, 0, 1, 1,
0.574079, -1.239078, 2.357682, 0.3372549, 0, 1, 1,
0.5741901, 1.312539, -0.8605298, 0.345098, 0, 1, 1,
0.5838925, -1.834455, 5.532857, 0.3490196, 0, 1, 1,
0.5904255, -0.07055017, 1.406001, 0.3568628, 0, 1, 1,
0.5907869, 0.2268631, 1.447859, 0.3607843, 0, 1, 1,
0.5909001, 1.27176, -1.465299, 0.3686275, 0, 1, 1,
0.5924425, 0.498906, 1.009082, 0.372549, 0, 1, 1,
0.6102942, 0.9453487, 0.07656763, 0.3803922, 0, 1, 1,
0.6136807, -0.07888692, 2.995117, 0.3843137, 0, 1, 1,
0.6160985, -0.5682324, 2.472679, 0.3921569, 0, 1, 1,
0.620781, 0.4313898, 2.087575, 0.3960784, 0, 1, 1,
0.6232074, 0.6268477, 0.7890604, 0.4039216, 0, 1, 1,
0.6243941, 0.2656455, 1.024203, 0.4117647, 0, 1, 1,
0.6313941, 0.156025, 1.968336, 0.4156863, 0, 1, 1,
0.6332677, 1.349895, 1.659908, 0.4235294, 0, 1, 1,
0.6334108, -0.2529739, 2.051013, 0.427451, 0, 1, 1,
0.6349405, 0.2128221, 2.802226, 0.4352941, 0, 1, 1,
0.637627, 0.9084467, 0.1430964, 0.4392157, 0, 1, 1,
0.6378926, -0.5000086, 2.1977, 0.4470588, 0, 1, 1,
0.6384472, 0.7182179, -0.7894856, 0.4509804, 0, 1, 1,
0.6387842, -0.5356559, 4.596559, 0.4588235, 0, 1, 1,
0.6480906, 0.6732043, -1.579844, 0.4627451, 0, 1, 1,
0.6485812, 0.6131178, -0.2276942, 0.4705882, 0, 1, 1,
0.6488153, 0.9322421, -1.770349, 0.4745098, 0, 1, 1,
0.651684, 0.04125146, 1.486327, 0.4823529, 0, 1, 1,
0.654903, 0.2250633, 1.575961, 0.4862745, 0, 1, 1,
0.6551173, -0.6428022, 2.679712, 0.4941176, 0, 1, 1,
0.6564962, -0.9646339, 1.230155, 0.5019608, 0, 1, 1,
0.6661649, 0.6227857, -0.3551152, 0.5058824, 0, 1, 1,
0.6712463, 0.4581313, -0.6734831, 0.5137255, 0, 1, 1,
0.672344, 0.8973477, 2.197298, 0.5176471, 0, 1, 1,
0.6734536, -0.3533159, 1.917802, 0.5254902, 0, 1, 1,
0.6761383, 0.9166226, 1.289225, 0.5294118, 0, 1, 1,
0.6764598, 1.336833, -0.0389876, 0.5372549, 0, 1, 1,
0.6803784, -0.7964335, 3.796792, 0.5411765, 0, 1, 1,
0.6811209, -0.4207211, 3.647935, 0.5490196, 0, 1, 1,
0.6822774, 1.039698, 2.246356, 0.5529412, 0, 1, 1,
0.6825342, -0.03408432, 1.522701, 0.5607843, 0, 1, 1,
0.6902337, -0.8792664, 2.978305, 0.5647059, 0, 1, 1,
0.6973364, -1.510487, 1.47985, 0.572549, 0, 1, 1,
0.7016392, -2.670127, 3.389516, 0.5764706, 0, 1, 1,
0.7024519, -0.4962989, 2.467901, 0.5843138, 0, 1, 1,
0.7112572, 0.9029375, -0.09430236, 0.5882353, 0, 1, 1,
0.7119141, -0.5385412, 3.396672, 0.5960785, 0, 1, 1,
0.7163445, 0.345589, 0.6688568, 0.6039216, 0, 1, 1,
0.7232633, -0.4416271, 2.034858, 0.6078432, 0, 1, 1,
0.7271196, -0.02827901, 1.072984, 0.6156863, 0, 1, 1,
0.7281835, -0.6551026, 1.760685, 0.6196079, 0, 1, 1,
0.7297442, 0.2138312, 0.7739914, 0.627451, 0, 1, 1,
0.7314578, 0.5931486, 2.251796, 0.6313726, 0, 1, 1,
0.7316962, 0.3572525, -0.8859199, 0.6392157, 0, 1, 1,
0.7340547, -0.1527582, 2.115911, 0.6431373, 0, 1, 1,
0.7380632, -1.095563, 0.7829195, 0.6509804, 0, 1, 1,
0.7406964, -0.3900937, 1.987843, 0.654902, 0, 1, 1,
0.7468381, -0.4523596, 3.283639, 0.6627451, 0, 1, 1,
0.7477823, 1.066976, 1.846642, 0.6666667, 0, 1, 1,
0.7518672, 0.4485519, 1.503359, 0.6745098, 0, 1, 1,
0.7533619, -0.02823813, -0.5044557, 0.6784314, 0, 1, 1,
0.7564501, 1.02695, 0.9573176, 0.6862745, 0, 1, 1,
0.7670726, -0.7939928, 3.334419, 0.6901961, 0, 1, 1,
0.771378, 0.1194874, 2.76725, 0.6980392, 0, 1, 1,
0.7743501, 0.7675347, 1.235544, 0.7058824, 0, 1, 1,
0.7797145, 0.9461959, 0.5674539, 0.7098039, 0, 1, 1,
0.7814113, -1.699927, 4.188518, 0.7176471, 0, 1, 1,
0.7920986, 0.176864, 1.965, 0.7215686, 0, 1, 1,
0.7979067, -0.03470127, 2.796743, 0.7294118, 0, 1, 1,
0.8028097, -0.2607226, 2.656871, 0.7333333, 0, 1, 1,
0.8060533, 0.2687493, 1.46271, 0.7411765, 0, 1, 1,
0.8087928, 0.67932, 0.01634278, 0.7450981, 0, 1, 1,
0.8170115, -1.430082, 2.328504, 0.7529412, 0, 1, 1,
0.8233179, 0.3750505, 0.3324235, 0.7568628, 0, 1, 1,
0.8361507, 0.174801, 2.314025, 0.7647059, 0, 1, 1,
0.8450741, 1.157989, -1.146438, 0.7686275, 0, 1, 1,
0.845821, 1.008887, 0.1428648, 0.7764706, 0, 1, 1,
0.8459708, 1.11333, 1.513245, 0.7803922, 0, 1, 1,
0.8466046, -0.6464, 3.497232, 0.7882353, 0, 1, 1,
0.8517394, 1.66934, 0.2113986, 0.7921569, 0, 1, 1,
0.8535929, -0.9841943, 1.756081, 0.8, 0, 1, 1,
0.8597938, -1.10754, 3.760725, 0.8078431, 0, 1, 1,
0.8679311, 1.18985, 0.4731878, 0.8117647, 0, 1, 1,
0.8681679, -0.7479425, 2.034776, 0.8196079, 0, 1, 1,
0.8689986, 0.4932979, 1.999386, 0.8235294, 0, 1, 1,
0.8737335, -0.01111043, 3.448828, 0.8313726, 0, 1, 1,
0.8763407, -0.01086691, 3.782766, 0.8352941, 0, 1, 1,
0.8812467, -0.3112001, 2.231971, 0.8431373, 0, 1, 1,
0.8928933, 0.2665098, 2.038643, 0.8470588, 0, 1, 1,
0.8951104, 1.202924, -0.2339056, 0.854902, 0, 1, 1,
0.9026529, 0.4831346, 1.874678, 0.8588235, 0, 1, 1,
0.9033944, -0.1700707, 2.913882, 0.8666667, 0, 1, 1,
0.9084054, -0.7860163, 3.9185, 0.8705882, 0, 1, 1,
0.9242045, 1.401878, 0.06406453, 0.8784314, 0, 1, 1,
0.9244938, -0.9335464, 2.034308, 0.8823529, 0, 1, 1,
0.9277123, -0.1428012, 2.135834, 0.8901961, 0, 1, 1,
0.9292138, -0.8286492, 2.17956, 0.8941177, 0, 1, 1,
0.9507371, -0.7443936, 2.814602, 0.9019608, 0, 1, 1,
0.957638, 1.239267, 1.812534, 0.9098039, 0, 1, 1,
0.9603316, -2.648334, 2.334055, 0.9137255, 0, 1, 1,
0.9645411, 0.2315461, -0.966543, 0.9215686, 0, 1, 1,
0.9711831, 1.783011, -0.01504223, 0.9254902, 0, 1, 1,
0.9723675, -0.08449098, 0.9918046, 0.9333333, 0, 1, 1,
0.9764644, 1.012444, -1.233901, 0.9372549, 0, 1, 1,
0.9783996, 0.02034527, 1.315667, 0.945098, 0, 1, 1,
0.9811563, -0.4370382, 0.934705, 0.9490196, 0, 1, 1,
0.9839087, 0.8626139, -0.6269832, 0.9568627, 0, 1, 1,
0.9865314, 0.1529741, 2.103022, 0.9607843, 0, 1, 1,
0.9930691, -0.7342378, 0.7083288, 0.9686275, 0, 1, 1,
0.9958841, -1.998699, 3.027489, 0.972549, 0, 1, 1,
0.9967819, -0.8718256, 2.455917, 0.9803922, 0, 1, 1,
0.999226, 0.8538921, -0.2417891, 0.9843137, 0, 1, 1,
1.001162, -1.434242, 2.470738, 0.9921569, 0, 1, 1,
1.001495, -0.5263676, 0.8702254, 0.9960784, 0, 1, 1,
1.002071, -0.05635896, 0.748324, 1, 0, 0.9960784, 1,
1.002074, 1.070078, 0.03571012, 1, 0, 0.9882353, 1,
1.010316, -1.234207, 1.193703, 1, 0, 0.9843137, 1,
1.010922, 0.4286365, 1.622679, 1, 0, 0.9764706, 1,
1.013994, 1.110454, 2.041299, 1, 0, 0.972549, 1,
1.023641, -0.3528416, 3.226626, 1, 0, 0.9647059, 1,
1.023862, 1.158983, 1.456245, 1, 0, 0.9607843, 1,
1.027167, -0.7152611, 2.235549, 1, 0, 0.9529412, 1,
1.034301, 1.09861, 0.004813661, 1, 0, 0.9490196, 1,
1.037885, -1.52788, 1.702796, 1, 0, 0.9411765, 1,
1.039611, 0.3019041, 1.449367, 1, 0, 0.9372549, 1,
1.052878, 0.4674157, -0.3018289, 1, 0, 0.9294118, 1,
1.053061, -0.2386823, 2.670094, 1, 0, 0.9254902, 1,
1.053547, 0.03655381, 1.346276, 1, 0, 0.9176471, 1,
1.056982, 0.5008032, 2.806868, 1, 0, 0.9137255, 1,
1.068392, 0.1851346, -0.08255452, 1, 0, 0.9058824, 1,
1.068965, 1.313692, 0.7439224, 1, 0, 0.9019608, 1,
1.072113, -0.6903139, 3.418145, 1, 0, 0.8941177, 1,
1.078458, 1.807568, -0.5189432, 1, 0, 0.8862745, 1,
1.078534, -0.3754802, 1.696099, 1, 0, 0.8823529, 1,
1.083583, 0.1785163, 0.8840797, 1, 0, 0.8745098, 1,
1.084985, 0.2826929, 2.264841, 1, 0, 0.8705882, 1,
1.08559, 0.7955031, 0.6546994, 1, 0, 0.8627451, 1,
1.089796, -0.4208419, 2.411701, 1, 0, 0.8588235, 1,
1.098237, -0.732048, 2.986147, 1, 0, 0.8509804, 1,
1.098538, 1.38811, 2.602317, 1, 0, 0.8470588, 1,
1.098568, -0.5036176, 0.2832607, 1, 0, 0.8392157, 1,
1.102007, 0.8074313, 1.81874, 1, 0, 0.8352941, 1,
1.118898, 0.7726676, 1.895374, 1, 0, 0.827451, 1,
1.120604, -0.9642004, 2.393526, 1, 0, 0.8235294, 1,
1.124209, -0.2206372, 2.193045, 1, 0, 0.8156863, 1,
1.124224, -0.620181, 1.408712, 1, 0, 0.8117647, 1,
1.130012, 0.7736252, 2.423979, 1, 0, 0.8039216, 1,
1.130645, 0.8688267, 0.7752129, 1, 0, 0.7960784, 1,
1.143642, 0.7692739, 2.591285, 1, 0, 0.7921569, 1,
1.146299, 1.153704, 0.03865196, 1, 0, 0.7843137, 1,
1.152288, 0.4548403, 2.423205, 1, 0, 0.7803922, 1,
1.15594, -0.5204995, 2.498942, 1, 0, 0.772549, 1,
1.158388, 0.7948898, -0.4998654, 1, 0, 0.7686275, 1,
1.162944, 0.6134257, 0.3113635, 1, 0, 0.7607843, 1,
1.169467, 0.6614271, 0.2755125, 1, 0, 0.7568628, 1,
1.170345, 0.8245382, -0.2727023, 1, 0, 0.7490196, 1,
1.172975, 1.928864, -0.3971839, 1, 0, 0.7450981, 1,
1.174058, -2.652005, 1.412751, 1, 0, 0.7372549, 1,
1.179578, 0.908644, 2.276211, 1, 0, 0.7333333, 1,
1.185785, 0.8312941, 1.541037, 1, 0, 0.7254902, 1,
1.187811, 0.4822311, 2.495016, 1, 0, 0.7215686, 1,
1.191328, -0.9374979, 0.5865119, 1, 0, 0.7137255, 1,
1.197834, 1.226533, 0.7524528, 1, 0, 0.7098039, 1,
1.197966, 0.301266, 1.101942, 1, 0, 0.7019608, 1,
1.20933, 0.1647087, 0.9573402, 1, 0, 0.6941177, 1,
1.216784, 0.4322278, 0.8918988, 1, 0, 0.6901961, 1,
1.224462, 0.1343592, 3.035783, 1, 0, 0.682353, 1,
1.229345, 0.5515941, 1.283558, 1, 0, 0.6784314, 1,
1.229771, 0.9131403, 0.1039945, 1, 0, 0.6705883, 1,
1.236298, -0.3579681, 3.461359, 1, 0, 0.6666667, 1,
1.243604, 0.5656209, 1.116746, 1, 0, 0.6588235, 1,
1.244649, -0.5785804, 1.021598, 1, 0, 0.654902, 1,
1.265514, -1.064188, 3.178218, 1, 0, 0.6470588, 1,
1.26696, 0.3131324, 1.917798, 1, 0, 0.6431373, 1,
1.278965, 0.9621501, 1.934168, 1, 0, 0.6352941, 1,
1.279429, 0.05045598, 1.270605, 1, 0, 0.6313726, 1,
1.284885, -0.3868429, 1.933084, 1, 0, 0.6235294, 1,
1.288798, -0.5168791, 3.343407, 1, 0, 0.6196079, 1,
1.290386, -2.658336, 0.8087724, 1, 0, 0.6117647, 1,
1.306156, 1.605658, -0.8833517, 1, 0, 0.6078432, 1,
1.310758, 0.626648, -0.5998675, 1, 0, 0.6, 1,
1.315211, -0.370811, 1.885617, 1, 0, 0.5921569, 1,
1.32429, 0.5622449, 0.824586, 1, 0, 0.5882353, 1,
1.331186, -0.4121064, 1.535677, 1, 0, 0.5803922, 1,
1.33417, -1.768385, 1.993732, 1, 0, 0.5764706, 1,
1.337352, -0.2890457, 2.830832, 1, 0, 0.5686275, 1,
1.338216, 0.09153673, 1.999573, 1, 0, 0.5647059, 1,
1.339172, 0.337757, 0.6148525, 1, 0, 0.5568628, 1,
1.340333, 1.712008, 1.452062, 1, 0, 0.5529412, 1,
1.346006, 0.9302686, 0.8202183, 1, 0, 0.5450981, 1,
1.346502, 0.5055821, 0.8059456, 1, 0, 0.5411765, 1,
1.351693, -1.223215, 1.031097, 1, 0, 0.5333334, 1,
1.356604, 1.189351, -0.6837997, 1, 0, 0.5294118, 1,
1.373179, -0.6195646, 1.212331, 1, 0, 0.5215687, 1,
1.384412, 0.4426731, -0.5180709, 1, 0, 0.5176471, 1,
1.386541, -0.7645085, 1.012254, 1, 0, 0.509804, 1,
1.391421, -0.9434821, 1.937447, 1, 0, 0.5058824, 1,
1.394616, 0.8969465, 1.071546, 1, 0, 0.4980392, 1,
1.406265, 1.931164, 1.750156, 1, 0, 0.4901961, 1,
1.416275, 1.239593, 0.639908, 1, 0, 0.4862745, 1,
1.43604, 1.806378, -0.9004869, 1, 0, 0.4784314, 1,
1.450924, 1.890234, -0.0105511, 1, 0, 0.4745098, 1,
1.453301, -0.2912863, 2.113819, 1, 0, 0.4666667, 1,
1.454808, 0.6399744, -0.5960597, 1, 0, 0.4627451, 1,
1.461687, 1.753288, 0.6192433, 1, 0, 0.454902, 1,
1.472846, 0.1497262, -0.2599344, 1, 0, 0.4509804, 1,
1.488407, 0.02652975, -0.2351995, 1, 0, 0.4431373, 1,
1.491951, -0.3284772, 2.986345, 1, 0, 0.4392157, 1,
1.502389, -0.270537, 2.782556, 1, 0, 0.4313726, 1,
1.503297, -1.369132, 1.907219, 1, 0, 0.427451, 1,
1.509613, 0.04931024, 1.300098, 1, 0, 0.4196078, 1,
1.514227, -0.4264479, 3.692221, 1, 0, 0.4156863, 1,
1.517973, -0.7778546, 2.845313, 1, 0, 0.4078431, 1,
1.528572, -0.9216038, 0.35887, 1, 0, 0.4039216, 1,
1.530631, -1.033095, 2.008258, 1, 0, 0.3960784, 1,
1.535652, -0.6181352, 2.517511, 1, 0, 0.3882353, 1,
1.541514, -0.09657525, 2.769478, 1, 0, 0.3843137, 1,
1.557561, 1.670516, 1.2506, 1, 0, 0.3764706, 1,
1.567045, 1.902429, -0.1100378, 1, 0, 0.372549, 1,
1.570962, 1.744816, -1.09013, 1, 0, 0.3647059, 1,
1.572875, 0.3155659, 1.449844, 1, 0, 0.3607843, 1,
1.573411, -1.103157, 0.6327145, 1, 0, 0.3529412, 1,
1.620503, 1.039147, 0.009795447, 1, 0, 0.3490196, 1,
1.629733, 1.770267, 0.4173356, 1, 0, 0.3411765, 1,
1.640411, -1.448007, 1.50925, 1, 0, 0.3372549, 1,
1.642082, -0.5796554, 3.201728, 1, 0, 0.3294118, 1,
1.648162, -0.4750965, 1.998565, 1, 0, 0.3254902, 1,
1.65507, -1.116436, 2.633894, 1, 0, 0.3176471, 1,
1.655328, -2.265963, 2.781896, 1, 0, 0.3137255, 1,
1.678161, 0.5852426, 0.418425, 1, 0, 0.3058824, 1,
1.678657, -0.4832093, 2.388045, 1, 0, 0.2980392, 1,
1.701536, -2.440207, 2.865155, 1, 0, 0.2941177, 1,
1.727601, -0.5016048, 1.455631, 1, 0, 0.2862745, 1,
1.729099, 0.2799901, 1.67667, 1, 0, 0.282353, 1,
1.744923, 0.9649296, 1.617725, 1, 0, 0.2745098, 1,
1.773192, 1.188089, 2.431504, 1, 0, 0.2705882, 1,
1.795722, -0.800307, 0.8840396, 1, 0, 0.2627451, 1,
1.834229, 1.142677, -0.2362401, 1, 0, 0.2588235, 1,
1.856202, 0.5845631, 0.9073966, 1, 0, 0.2509804, 1,
1.857142, -0.1541598, 1.186743, 1, 0, 0.2470588, 1,
1.860005, 1.157353, 2.81142, 1, 0, 0.2392157, 1,
1.872814, -0.1860013, 1.941069, 1, 0, 0.2352941, 1,
1.889576, -1.53891, 1.834186, 1, 0, 0.227451, 1,
1.899157, -0.09684855, 1.642684, 1, 0, 0.2235294, 1,
1.902069, -0.01394061, 1.251678, 1, 0, 0.2156863, 1,
1.939653, 0.1600253, 1.803, 1, 0, 0.2117647, 1,
1.95323, -0.1123733, 3.710819, 1, 0, 0.2039216, 1,
1.970166, 1.048257, 4.734077, 1, 0, 0.1960784, 1,
1.972701, 0.8504203, 0.3074149, 1, 0, 0.1921569, 1,
1.974062, -0.008099047, 2.382018, 1, 0, 0.1843137, 1,
1.987192, 1.211306, 2.094937, 1, 0, 0.1803922, 1,
1.987267, 0.9549269, -0.353865, 1, 0, 0.172549, 1,
1.994663, 1.001725, 0.7118582, 1, 0, 0.1686275, 1,
2.000422, -0.5198731, 0.9976375, 1, 0, 0.1607843, 1,
2.028685, -1.941038, 1.958848, 1, 0, 0.1568628, 1,
2.050681, -0.4472133, 3.49535, 1, 0, 0.1490196, 1,
2.054845, 0.2585341, 1.32738, 1, 0, 0.145098, 1,
2.065776, -0.2951687, 0.5194209, 1, 0, 0.1372549, 1,
2.067575, 0.5181798, -1.008427, 1, 0, 0.1333333, 1,
2.068204, 1.155351, 1.080177, 1, 0, 0.1254902, 1,
2.068245, -0.9975756, 0.9938039, 1, 0, 0.1215686, 1,
2.104506, -0.01071482, 2.101086, 1, 0, 0.1137255, 1,
2.122266, -1.576585, 1.784678, 1, 0, 0.1098039, 1,
2.146262, 0.3799009, -0.02472945, 1, 0, 0.1019608, 1,
2.182216, -1.28589, 2.685343, 1, 0, 0.09411765, 1,
2.209117, 1.080137, 1.699755, 1, 0, 0.09019608, 1,
2.223386, 0.660323, 2.545288, 1, 0, 0.08235294, 1,
2.236945, -0.6591246, 3.19798, 1, 0, 0.07843138, 1,
2.280831, 0.985379, 1.311441, 1, 0, 0.07058824, 1,
2.346501, 0.5945104, 3.401764, 1, 0, 0.06666667, 1,
2.37058, 1.338732, 0.3663833, 1, 0, 0.05882353, 1,
2.406784, -0.6351584, 2.850998, 1, 0, 0.05490196, 1,
2.426629, -0.06726491, 3.315712, 1, 0, 0.04705882, 1,
2.675063, 1.205772, 0.7445262, 1, 0, 0.04313726, 1,
2.679586, -0.4700502, 1.807487, 1, 0, 0.03529412, 1,
2.684672, -1.093737, 3.203808, 1, 0, 0.03137255, 1,
2.718694, -0.2259045, 1.881664, 1, 0, 0.02352941, 1,
2.870673, -0.8780574, 0.5753698, 1, 0, 0.01960784, 1,
2.879472, 0.6327093, 1.494156, 1, 0, 0.01176471, 1,
3.040833, 0.09090053, 1.550467, 1, 0, 0.007843138, 1
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
0.04232168, -4.017591, -7.677781, 0, -0.5, 0.5, 0.5,
0.04232168, -4.017591, -7.677781, 1, -0.5, 0.5, 0.5,
0.04232168, -4.017591, -7.677781, 1, 1.5, 0.5, 0.5,
0.04232168, -4.017591, -7.677781, 0, 1.5, 0.5, 0.5
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
-3.972685, 0.3050703, -7.677781, 0, -0.5, 0.5, 0.5,
-3.972685, 0.3050703, -7.677781, 1, -0.5, 0.5, 0.5,
-3.972685, 0.3050703, -7.677781, 1, 1.5, 0.5, 0.5,
-3.972685, 0.3050703, -7.677781, 0, 1.5, 0.5, 0.5
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
-3.972685, -4.017591, 0.08991265, 0, -0.5, 0.5, 0.5,
-3.972685, -4.017591, 0.08991265, 1, -0.5, 0.5, 0.5,
-3.972685, -4.017591, 0.08991265, 1, 1.5, 0.5, 0.5,
-3.972685, -4.017591, 0.08991265, 0, 1.5, 0.5, 0.5
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
-2, -3.020053, -5.885236,
3, -3.020053, -5.885236,
-2, -3.020053, -5.885236,
-2, -3.18631, -6.183993,
-1, -3.020053, -5.885236,
-1, -3.18631, -6.183993,
0, -3.020053, -5.885236,
0, -3.18631, -6.183993,
1, -3.020053, -5.885236,
1, -3.18631, -6.183993,
2, -3.020053, -5.885236,
2, -3.18631, -6.183993,
3, -3.020053, -5.885236,
3, -3.18631, -6.183993
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
-2, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
-2, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
-2, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
-2, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5,
-1, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
-1, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
-1, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
-1, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5,
0, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
0, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
0, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
0, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5,
1, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
1, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
1, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
1, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5,
2, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
2, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
2, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
2, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5,
3, -3.518822, -6.781508, 0, -0.5, 0.5, 0.5,
3, -3.518822, -6.781508, 1, -0.5, 0.5, 0.5,
3, -3.518822, -6.781508, 1, 1.5, 0.5, 0.5,
3, -3.518822, -6.781508, 0, 1.5, 0.5, 0.5
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
-3.046145, -2, -5.885236,
-3.046145, 3, -5.885236,
-3.046145, -2, -5.885236,
-3.200568, -2, -6.183993,
-3.046145, -1, -5.885236,
-3.200568, -1, -6.183993,
-3.046145, 0, -5.885236,
-3.200568, 0, -6.183993,
-3.046145, 1, -5.885236,
-3.200568, 1, -6.183993,
-3.046145, 2, -5.885236,
-3.200568, 2, -6.183993,
-3.046145, 3, -5.885236,
-3.200568, 3, -6.183993
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
-3.509415, -2, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, -2, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, -2, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, -2, -6.781508, 0, 1.5, 0.5, 0.5,
-3.509415, -1, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, -1, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, -1, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, -1, -6.781508, 0, 1.5, 0.5, 0.5,
-3.509415, 0, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, 0, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, 0, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, 0, -6.781508, 0, 1.5, 0.5, 0.5,
-3.509415, 1, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, 1, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, 1, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, 1, -6.781508, 0, 1.5, 0.5, 0.5,
-3.509415, 2, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, 2, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, 2, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, 2, -6.781508, 0, 1.5, 0.5, 0.5,
-3.509415, 3, -6.781508, 0, -0.5, 0.5, 0.5,
-3.509415, 3, -6.781508, 1, -0.5, 0.5, 0.5,
-3.509415, 3, -6.781508, 1, 1.5, 0.5, 0.5,
-3.509415, 3, -6.781508, 0, 1.5, 0.5, 0.5
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
-3.046145, -3.020053, -4,
-3.046145, -3.020053, 4,
-3.046145, -3.020053, -4,
-3.200568, -3.18631, -4,
-3.046145, -3.020053, -2,
-3.200568, -3.18631, -2,
-3.046145, -3.020053, 0,
-3.200568, -3.18631, 0,
-3.046145, -3.020053, 2,
-3.200568, -3.18631, 2,
-3.046145, -3.020053, 4,
-3.200568, -3.18631, 4
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
-3.509415, -3.518822, -4, 0, -0.5, 0.5, 0.5,
-3.509415, -3.518822, -4, 1, -0.5, 0.5, 0.5,
-3.509415, -3.518822, -4, 1, 1.5, 0.5, 0.5,
-3.509415, -3.518822, -4, 0, 1.5, 0.5, 0.5,
-3.509415, -3.518822, -2, 0, -0.5, 0.5, 0.5,
-3.509415, -3.518822, -2, 1, -0.5, 0.5, 0.5,
-3.509415, -3.518822, -2, 1, 1.5, 0.5, 0.5,
-3.509415, -3.518822, -2, 0, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 0, 0, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 0, 1, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 0, 1, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 0, 0, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 2, 0, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 2, 1, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 2, 1, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 2, 0, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 4, 0, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 4, 1, -0.5, 0.5, 0.5,
-3.509415, -3.518822, 4, 1, 1.5, 0.5, 0.5,
-3.509415, -3.518822, 4, 0, 1.5, 0.5, 0.5
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
-3.046145, -3.020053, -5.885236,
-3.046145, 3.630194, -5.885236,
-3.046145, -3.020053, 6.065062,
-3.046145, 3.630194, 6.065062,
-3.046145, -3.020053, -5.885236,
-3.046145, -3.020053, 6.065062,
-3.046145, 3.630194, -5.885236,
-3.046145, 3.630194, 6.065062,
-3.046145, -3.020053, -5.885236,
3.130788, -3.020053, -5.885236,
-3.046145, -3.020053, 6.065062,
3.130788, -3.020053, 6.065062,
-3.046145, 3.630194, -5.885236,
3.130788, 3.630194, -5.885236,
-3.046145, 3.630194, 6.065062,
3.130788, 3.630194, 6.065062,
3.130788, -3.020053, -5.885236,
3.130788, 3.630194, -5.885236,
3.130788, -3.020053, 6.065062,
3.130788, 3.630194, 6.065062,
3.130788, -3.020053, -5.885236,
3.130788, -3.020053, 6.065062,
3.130788, 3.630194, -5.885236,
3.130788, 3.630194, 6.065062
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
var radius = 8.013088;
var distance = 35.65113;
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
mvMatrix.translate( -0.04232168, -0.3050703, -0.08991265 );
mvMatrix.scale( 1.402623, 1.302795, 0.7249951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65113);
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
Chlorfenvinphos<-read.table("Chlorfenvinphos.xyz")
```

```
## Error in read.table("Chlorfenvinphos.xyz"): no lines available in input
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
-2.956189, -0.8256826, -1.697079, 0, 0, 1, 1, 1,
-2.749996, -1.628178, -2.470805, 1, 0, 0, 1, 1,
-2.708834, -1.098669, -3.44403, 1, 0, 0, 1, 1,
-2.704307, -0.6359178, -1.341743, 1, 0, 0, 1, 1,
-2.596671, 1.582651, -2.622552, 1, 0, 0, 1, 1,
-2.576951, -0.1458658, -2.957325, 1, 0, 0, 1, 1,
-2.459542, 1.019741, -1.965949, 0, 0, 0, 1, 1,
-2.430449, 1.435233, -0.6195066, 0, 0, 0, 1, 1,
-2.410916, -1.021826, -1.521548, 0, 0, 0, 1, 1,
-2.38325, 0.2603486, -1.865984, 0, 0, 0, 1, 1,
-2.316497, -0.3500643, 0.2558678, 0, 0, 0, 1, 1,
-2.309804, 0.5540475, -0.9706361, 0, 0, 0, 1, 1,
-2.292827, -0.5539668, -2.789856, 0, 0, 0, 1, 1,
-2.223333, 0.8632133, -0.2784212, 1, 1, 1, 1, 1,
-2.221288, -0.9346368, -1.135963, 1, 1, 1, 1, 1,
-2.189677, -0.510419, -3.026301, 1, 1, 1, 1, 1,
-2.147521, -0.3309992, -1.550419, 1, 1, 1, 1, 1,
-2.046694, 0.07684068, 0.09942486, 1, 1, 1, 1, 1,
-2.021878, -1.259989, -2.470305, 1, 1, 1, 1, 1,
-2.013166, -1.316838, -0.1140539, 1, 1, 1, 1, 1,
-2.001146, -0.1172412, -1.817848, 1, 1, 1, 1, 1,
-1.941024, -0.8037313, -3.215107, 1, 1, 1, 1, 1,
-1.937437, 1.494464, -1.740258, 1, 1, 1, 1, 1,
-1.888755, 0.4802763, -2.253358, 1, 1, 1, 1, 1,
-1.878622, -0.05093614, -2.362049, 1, 1, 1, 1, 1,
-1.872007, -0.63329, -2.011778, 1, 1, 1, 1, 1,
-1.86509, 0.4788576, -0.8000979, 1, 1, 1, 1, 1,
-1.839099, -2.029255, -4.49532, 1, 1, 1, 1, 1,
-1.835617, -0.9745296, -1.558955, 0, 0, 1, 1, 1,
-1.817225, -0.6787045, -2.415737, 1, 0, 0, 1, 1,
-1.769712, 0.4227001, -1.797382, 1, 0, 0, 1, 1,
-1.768637, 0.3865929, -1.452069, 1, 0, 0, 1, 1,
-1.749617, -0.2695932, -0.557879, 1, 0, 0, 1, 1,
-1.695736, -0.5403894, -0.6805103, 1, 0, 0, 1, 1,
-1.689304, 0.834142, -1.290129, 0, 0, 0, 1, 1,
-1.656243, -0.2546426, -2.242876, 0, 0, 0, 1, 1,
-1.64464, 0.4616561, -0.109029, 0, 0, 0, 1, 1,
-1.625798, -0.1904714, -0.6233352, 0, 0, 0, 1, 1,
-1.616512, -1.471971, -3.679358, 0, 0, 0, 1, 1,
-1.552867, -0.103726, -1.680584, 0, 0, 0, 1, 1,
-1.540338, 1.060113, -0.2682253, 0, 0, 0, 1, 1,
-1.536113, -1.4054, -2.71801, 1, 1, 1, 1, 1,
-1.534234, 0.3797448, -0.9012716, 1, 1, 1, 1, 1,
-1.528685, 0.1653069, -1.426779, 1, 1, 1, 1, 1,
-1.527975, -1.336886, -2.298231, 1, 1, 1, 1, 1,
-1.525522, -0.05005397, -1.473737, 1, 1, 1, 1, 1,
-1.518215, 2.143373, -0.8101709, 1, 1, 1, 1, 1,
-1.494626, -0.3254952, -1.772732, 1, 1, 1, 1, 1,
-1.493659, 0.07581605, -1.965883, 1, 1, 1, 1, 1,
-1.480814, -0.7643789, -0.6369165, 1, 1, 1, 1, 1,
-1.476578, 0.6656306, -0.01976861, 1, 1, 1, 1, 1,
-1.469615, -0.7615515, -3.066701, 1, 1, 1, 1, 1,
-1.45801, -0.08109396, -1.635259, 1, 1, 1, 1, 1,
-1.457789, -0.06636953, -2.738866, 1, 1, 1, 1, 1,
-1.434205, -1.047395, -1.363293, 1, 1, 1, 1, 1,
-1.432631, 0.7093932, -1.568802, 1, 1, 1, 1, 1,
-1.425559, 1.117283, -1.025305, 0, 0, 1, 1, 1,
-1.424544, 0.4087863, -2.604207, 1, 0, 0, 1, 1,
-1.420756, 0.7254015, -1.686761, 1, 0, 0, 1, 1,
-1.410652, 0.5952673, -1.64401, 1, 0, 0, 1, 1,
-1.406581, -0.08372584, -2.353276, 1, 0, 0, 1, 1,
-1.404221, -1.05183, -2.975048, 1, 0, 0, 1, 1,
-1.393844, 0.4742361, -1.364809, 0, 0, 0, 1, 1,
-1.39218, 0.3111189, -2.213892, 0, 0, 0, 1, 1,
-1.384736, -0.8965546, -3.051271, 0, 0, 0, 1, 1,
-1.383669, -1.216887, -2.985626, 0, 0, 0, 1, 1,
-1.380871, 1.70502, 0.563294, 0, 0, 0, 1, 1,
-1.376943, 1.229065, -0.6999922, 0, 0, 0, 1, 1,
-1.361258, 0.1621733, -3.784616, 0, 0, 0, 1, 1,
-1.358886, -0.9598151, -1.154754, 1, 1, 1, 1, 1,
-1.356424, 1.805611, -3.312455, 1, 1, 1, 1, 1,
-1.352898, -1.07822, -2.599617, 1, 1, 1, 1, 1,
-1.351123, -0.4178179, -1.482171, 1, 1, 1, 1, 1,
-1.347929, -0.003201879, -2.858828, 1, 1, 1, 1, 1,
-1.325584, 0.05820979, -1.545246, 1, 1, 1, 1, 1,
-1.322147, 2.18629, -1.275618, 1, 1, 1, 1, 1,
-1.316758, 0.3442883, -1.179901, 1, 1, 1, 1, 1,
-1.315908, 0.4323902, -1.260217, 1, 1, 1, 1, 1,
-1.314307, 0.1019487, -1.507954, 1, 1, 1, 1, 1,
-1.302335, 0.4625148, -0.7508405, 1, 1, 1, 1, 1,
-1.280818, -2.108269, -2.579393, 1, 1, 1, 1, 1,
-1.279083, 0.6975037, -1.211986, 1, 1, 1, 1, 1,
-1.277062, -0.2182299, -1.335045, 1, 1, 1, 1, 1,
-1.275372, 0.0960919, -0.308248, 1, 1, 1, 1, 1,
-1.271832, 0.6632274, -1.869141, 0, 0, 1, 1, 1,
-1.271683, -0.6732042, 0.5455286, 1, 0, 0, 1, 1,
-1.262863, 1.079613, -0.05709408, 1, 0, 0, 1, 1,
-1.258159, 0.9399453, -0.4504482, 1, 0, 0, 1, 1,
-1.253137, 2.387687, -0.2599442, 1, 0, 0, 1, 1,
-1.245457, -0.5275045, -3.146727, 1, 0, 0, 1, 1,
-1.240237, 0.2556144, 0.01806631, 0, 0, 0, 1, 1,
-1.240158, -0.2539166, -1.716764, 0, 0, 0, 1, 1,
-1.238178, -0.5707006, -2.105685, 0, 0, 0, 1, 1,
-1.237674, -1.03691, -1.357476, 0, 0, 0, 1, 1,
-1.234903, 1.888905, -0.857927, 0, 0, 0, 1, 1,
-1.231947, -0.4810424, -2.767908, 0, 0, 0, 1, 1,
-1.228538, 0.07918567, -2.723102, 0, 0, 0, 1, 1,
-1.216583, 0.6442122, -1.552035, 1, 1, 1, 1, 1,
-1.211966, 0.5680406, 0.7339155, 1, 1, 1, 1, 1,
-1.205319, -1.70201, -2.379828, 1, 1, 1, 1, 1,
-1.202223, 0.323226, -1.707163, 1, 1, 1, 1, 1,
-1.201595, 1.566023, -2.135854, 1, 1, 1, 1, 1,
-1.198586, -0.9359993, -3.164047, 1, 1, 1, 1, 1,
-1.193838, -0.6846954, -2.229952, 1, 1, 1, 1, 1,
-1.193188, 0.2929911, 0.2849526, 1, 1, 1, 1, 1,
-1.185365, -0.5362508, -2.989399, 1, 1, 1, 1, 1,
-1.177527, -0.4453415, -1.636005, 1, 1, 1, 1, 1,
-1.177273, 0.4481586, -1.755035, 1, 1, 1, 1, 1,
-1.173607, 0.2434225, -1.85601, 1, 1, 1, 1, 1,
-1.165336, -0.5260275, -4.179069, 1, 1, 1, 1, 1,
-1.161158, -0.1516643, -0.366047, 1, 1, 1, 1, 1,
-1.159597, -0.007433265, -2.590768, 1, 1, 1, 1, 1,
-1.15361, 0.3550503, -1.111285, 0, 0, 1, 1, 1,
-1.153057, 0.6118166, -2.117944, 1, 0, 0, 1, 1,
-1.151611, -2.050378, -2.811487, 1, 0, 0, 1, 1,
-1.149915, 0.762621, -0.3239563, 1, 0, 0, 1, 1,
-1.147525, 1.24085, -0.0348674, 1, 0, 0, 1, 1,
-1.145625, 0.5842974, -0.1711577, 1, 0, 0, 1, 1,
-1.136956, -1.095807, -3.209361, 0, 0, 0, 1, 1,
-1.134144, -0.2419418, -2.310922, 0, 0, 0, 1, 1,
-1.125978, 0.4068653, -0.1983701, 0, 0, 0, 1, 1,
-1.119174, 0.05430167, -0.4877025, 0, 0, 0, 1, 1,
-1.115861, 0.5654516, -2.257053, 0, 0, 0, 1, 1,
-1.115818, 0.1106591, -2.406535, 0, 0, 0, 1, 1,
-1.110557, -2.923205, -2.622818, 0, 0, 0, 1, 1,
-1.096319, -0.07848367, -3.2286, 1, 1, 1, 1, 1,
-1.095347, 0.9084893, 0.3087267, 1, 1, 1, 1, 1,
-1.093453, -0.7458385, -3.06383, 1, 1, 1, 1, 1,
-1.086321, -0.12553, -1.855605, 1, 1, 1, 1, 1,
-1.080481, -1.566875, -1.646934, 1, 1, 1, 1, 1,
-1.079017, 1.051682, -1.983328, 1, 1, 1, 1, 1,
-1.073792, -0.001475522, -3.07201, 1, 1, 1, 1, 1,
-1.073159, 1.999595, -0.885282, 1, 1, 1, 1, 1,
-1.07292, -0.01107261, -2.21582, 1, 1, 1, 1, 1,
-1.070251, 0.4411947, -1.528249, 1, 1, 1, 1, 1,
-1.069786, -1.404914, -2.722763, 1, 1, 1, 1, 1,
-1.045043, -0.3782442, 0.7454355, 1, 1, 1, 1, 1,
-1.038592, -0.9546399, -2.732517, 1, 1, 1, 1, 1,
-1.038533, -0.5808289, -1.260404, 1, 1, 1, 1, 1,
-1.026056, 1.101473, -2.240569, 1, 1, 1, 1, 1,
-1.025073, -1.166418, -2.734687, 0, 0, 1, 1, 1,
-1.024713, 1.288268, 0.754187, 1, 0, 0, 1, 1,
-1.009055, -1.231845, -3.225175, 1, 0, 0, 1, 1,
-1.000699, 0.2546682, -2.368997, 1, 0, 0, 1, 1,
-0.9953514, 0.4606355, -0.3703582, 1, 0, 0, 1, 1,
-0.9922312, 1.75189, -1.594641, 1, 0, 0, 1, 1,
-0.986351, -0.7755684, -3.907041, 0, 0, 0, 1, 1,
-0.9709911, 0.3514631, -1.219383, 0, 0, 0, 1, 1,
-0.9704575, 1.107893, -2.223953, 0, 0, 0, 1, 1,
-0.9686922, -0.7449179, -1.255505, 0, 0, 0, 1, 1,
-0.9635174, 1.476329, -0.3623047, 0, 0, 0, 1, 1,
-0.9618529, 1.391552, -1.459152, 0, 0, 0, 1, 1,
-0.9601914, -0.8271442, -1.85936, 0, 0, 0, 1, 1,
-0.9588591, 0.2929513, 0.163846, 1, 1, 1, 1, 1,
-0.9553989, 1.128057, -0.802637, 1, 1, 1, 1, 1,
-0.9525424, -0.1434143, -0.02000639, 1, 1, 1, 1, 1,
-0.9426522, -0.02545261, -1.603448, 1, 1, 1, 1, 1,
-0.941498, 0.4723718, -1.006232, 1, 1, 1, 1, 1,
-0.9400431, 1.388549, -1.82008, 1, 1, 1, 1, 1,
-0.9384511, 0.7424809, -1.89862, 1, 1, 1, 1, 1,
-0.9369699, 0.7118236, -0.1569365, 1, 1, 1, 1, 1,
-0.9329773, -1.259673, -1.367375, 1, 1, 1, 1, 1,
-0.9317498, -0.09891409, -2.512855, 1, 1, 1, 1, 1,
-0.9301092, -1.369688, -2.835173, 1, 1, 1, 1, 1,
-0.9299637, -1.103954, -3.519173, 1, 1, 1, 1, 1,
-0.9285848, -0.6624144, -4.200432, 1, 1, 1, 1, 1,
-0.9284673, -0.2957129, -2.008796, 1, 1, 1, 1, 1,
-0.9241219, 0.4752469, -2.599544, 1, 1, 1, 1, 1,
-0.9172379, -0.3669945, -2.594653, 0, 0, 1, 1, 1,
-0.9078582, -0.449957, -1.744812, 1, 0, 0, 1, 1,
-0.8983723, -0.2837504, -2.412251, 1, 0, 0, 1, 1,
-0.8980011, 1.547731, 1.162701, 1, 0, 0, 1, 1,
-0.8919348, 0.02862356, -1.991275, 1, 0, 0, 1, 1,
-0.8905492, 0.6725799, -1.356018, 1, 0, 0, 1, 1,
-0.889919, 0.2690928, -1.498342, 0, 0, 0, 1, 1,
-0.8884219, 2.085539, -0.2950126, 0, 0, 0, 1, 1,
-0.8834136, 1.25865, -2.498152, 0, 0, 0, 1, 1,
-0.8753371, 1.326416, 0.780574, 0, 0, 0, 1, 1,
-0.8747594, -0.3076614, -2.186021, 0, 0, 0, 1, 1,
-0.8743286, -1.232242, -4.019173, 0, 0, 0, 1, 1,
-0.8738444, -0.59968, -2.899757, 0, 0, 0, 1, 1,
-0.8736412, -1.298632, -0.6171223, 1, 1, 1, 1, 1,
-0.8728327, -1.56828, -3.370603, 1, 1, 1, 1, 1,
-0.8705217, 0.9123677, -0.6700007, 1, 1, 1, 1, 1,
-0.8671553, 0.1142359, -1.856204, 1, 1, 1, 1, 1,
-0.8610409, -0.930569, -2.130033, 1, 1, 1, 1, 1,
-0.8607197, 0.1580058, -0.960142, 1, 1, 1, 1, 1,
-0.8591154, 0.8853378, -1.528021, 1, 1, 1, 1, 1,
-0.852732, 1.543422, 1.209286, 1, 1, 1, 1, 1,
-0.8521897, -0.1875139, -1.410526, 1, 1, 1, 1, 1,
-0.8499488, -0.1918882, -2.649945, 1, 1, 1, 1, 1,
-0.8442395, 0.9182404, -1.176314, 1, 1, 1, 1, 1,
-0.8399345, -2.406991, -3.931273, 1, 1, 1, 1, 1,
-0.8321119, 1.61738, -1.468419, 1, 1, 1, 1, 1,
-0.8264247, 0.3052704, -0.4146337, 1, 1, 1, 1, 1,
-0.8237244, 0.3346139, -0.1260729, 1, 1, 1, 1, 1,
-0.8044378, -0.7622575, -2.667239, 0, 0, 1, 1, 1,
-0.7999299, -0.6788579, -1.998899, 1, 0, 0, 1, 1,
-0.7912174, 1.555594, -0.3249771, 1, 0, 0, 1, 1,
-0.7890137, 1.2987, 1.323092, 1, 0, 0, 1, 1,
-0.7861581, 1.123591, 0.5013143, 1, 0, 0, 1, 1,
-0.7857687, 0.852612, -0.605365, 1, 0, 0, 1, 1,
-0.7851405, -1.051452, -1.471277, 0, 0, 0, 1, 1,
-0.7839537, 1.484782, -1.339123, 0, 0, 0, 1, 1,
-0.7838008, 0.4305582, -1.545517, 0, 0, 0, 1, 1,
-0.7826095, -0.9225534, -2.313515, 0, 0, 0, 1, 1,
-0.7789836, -1.184045, -2.407939, 0, 0, 0, 1, 1,
-0.7777176, -0.5434545, -2.461568, 0, 0, 0, 1, 1,
-0.7753845, 0.03314084, 0.3937301, 0, 0, 0, 1, 1,
-0.7752755, -1.277867, -2.963904, 1, 1, 1, 1, 1,
-0.7749563, 0.1871515, -2.31264, 1, 1, 1, 1, 1,
-0.7661839, -1.509329, -3.293042, 1, 1, 1, 1, 1,
-0.7655566, 0.9791234, 0.4238313, 1, 1, 1, 1, 1,
-0.763807, -1.538659, -1.762444, 1, 1, 1, 1, 1,
-0.760779, -0.9944167, -3.897204, 1, 1, 1, 1, 1,
-0.7606981, 0.1668042, -2.653636, 1, 1, 1, 1, 1,
-0.7591318, -1.399745, -5.711203, 1, 1, 1, 1, 1,
-0.7523067, -1.597124, -2.550453, 1, 1, 1, 1, 1,
-0.7502989, -0.9508126, -1.980194, 1, 1, 1, 1, 1,
-0.7499858, -2.075864, -4.557349, 1, 1, 1, 1, 1,
-0.746696, 0.9051446, -0.01245784, 1, 1, 1, 1, 1,
-0.7433104, 0.2820787, -2.148256, 1, 1, 1, 1, 1,
-0.7415101, -1.129824, -3.136508, 1, 1, 1, 1, 1,
-0.7410941, 0.2830047, -2.151728, 1, 1, 1, 1, 1,
-0.7393203, 0.4809136, -1.804279, 0, 0, 1, 1, 1,
-0.7357751, -0.6445805, -2.558089, 1, 0, 0, 1, 1,
-0.7336423, -0.02352783, -1.213236, 1, 0, 0, 1, 1,
-0.729704, 1.075543, -1.127294, 1, 0, 0, 1, 1,
-0.7288776, -1.236092, -2.974605, 1, 0, 0, 1, 1,
-0.7276869, -0.1946107, -1.665354, 1, 0, 0, 1, 1,
-0.7248663, 0.87654, -1.543832, 0, 0, 0, 1, 1,
-0.7228566, -0.8257073, -3.701634, 0, 0, 0, 1, 1,
-0.7218018, 1.823016, -0.8262798, 0, 0, 0, 1, 1,
-0.7115528, 0.4561426, -0.09449117, 0, 0, 0, 1, 1,
-0.7092881, -1.264089, -2.954998, 0, 0, 0, 1, 1,
-0.7089891, -0.3602074, -2.169397, 0, 0, 0, 1, 1,
-0.7066734, -1.151698, -2.654657, 0, 0, 0, 1, 1,
-0.70564, -0.8414487, -2.681083, 1, 1, 1, 1, 1,
-0.7054417, -1.954861, -1.425081, 1, 1, 1, 1, 1,
-0.7048563, 0.3755034, 0.7503291, 1, 1, 1, 1, 1,
-0.7011747, -0.5019258, -3.993608, 1, 1, 1, 1, 1,
-0.6993406, -1.673169, -1.141444, 1, 1, 1, 1, 1,
-0.697426, 0.7608346, -0.2608918, 1, 1, 1, 1, 1,
-0.6889465, -1.161011, -3.275418, 1, 1, 1, 1, 1,
-0.6850212, 0.736296, -1.016081, 1, 1, 1, 1, 1,
-0.6844612, -1.014934, -3.03646, 1, 1, 1, 1, 1,
-0.6722266, -0.07788906, -2.008788, 1, 1, 1, 1, 1,
-0.6713085, -0.8898236, -3.257272, 1, 1, 1, 1, 1,
-0.669656, -0.1020963, -0.8382367, 1, 1, 1, 1, 1,
-0.6696032, 0.09618238, -1.213461, 1, 1, 1, 1, 1,
-0.6681123, 0.5314093, -0.5460567, 1, 1, 1, 1, 1,
-0.6674803, 0.863771, 0.6355588, 1, 1, 1, 1, 1,
-0.6633024, -0.3204827, -1.413129, 0, 0, 1, 1, 1,
-0.662701, 0.4017025, 0.8868091, 1, 0, 0, 1, 1,
-0.6623705, 0.2487575, -1.323293, 1, 0, 0, 1, 1,
-0.6616356, 0.3723898, -1.851267, 1, 0, 0, 1, 1,
-0.6543198, -1.456628, -4.520545, 1, 0, 0, 1, 1,
-0.6537525, -0.7947094, -0.5690187, 1, 0, 0, 1, 1,
-0.6536772, -0.2317514, -0.8441751, 0, 0, 0, 1, 1,
-0.6487278, -0.6286535, -0.6856673, 0, 0, 0, 1, 1,
-0.6479734, 0.1724504, -2.188505, 0, 0, 0, 1, 1,
-0.6472411, 0.6990072, -2.892141, 0, 0, 0, 1, 1,
-0.6419082, -1.068546, -3.765118, 0, 0, 0, 1, 1,
-0.6403122, -0.2273466, -1.344454, 0, 0, 0, 1, 1,
-0.6369878, 0.04987496, -2.195793, 0, 0, 0, 1, 1,
-0.6358951, 0.158176, -2.715721, 1, 1, 1, 1, 1,
-0.6345196, -0.2756231, -1.75989, 1, 1, 1, 1, 1,
-0.6308854, 2.415451, -1.831594, 1, 1, 1, 1, 1,
-0.6238713, -2.041454, -1.164874, 1, 1, 1, 1, 1,
-0.6226501, -0.2949916, -1.364555, 1, 1, 1, 1, 1,
-0.6214958, -0.2857994, -4.087805, 1, 1, 1, 1, 1,
-0.6213113, -0.8926194, -2.60283, 1, 1, 1, 1, 1,
-0.6204452, 0.389787, -1.006014, 1, 1, 1, 1, 1,
-0.614778, 0.3155868, -0.7442116, 1, 1, 1, 1, 1,
-0.614634, -1.524001, -1.765834, 1, 1, 1, 1, 1,
-0.6146336, 0.6496863, -0.2363264, 1, 1, 1, 1, 1,
-0.6104813, -0.1336871, -2.012504, 1, 1, 1, 1, 1,
-0.6086071, -0.6589608, -2.821511, 1, 1, 1, 1, 1,
-0.6057293, -1.396895, -2.876346, 1, 1, 1, 1, 1,
-0.6053326, -0.6060496, -3.732863, 1, 1, 1, 1, 1,
-0.6038319, -0.8174744, -2.555099, 0, 0, 1, 1, 1,
-0.6018795, 0.3911264, -2.161092, 1, 0, 0, 1, 1,
-0.5951957, 0.6241472, -0.568223, 1, 0, 0, 1, 1,
-0.5936344, -2.306283, -1.960397, 1, 0, 0, 1, 1,
-0.5928234, 1.768495, 0.02469941, 1, 0, 0, 1, 1,
-0.5897464, -0.1896536, -0.9171158, 1, 0, 0, 1, 1,
-0.5891583, 1.081902, -0.9054918, 0, 0, 0, 1, 1,
-0.5875664, -1.44788, -4.24044, 0, 0, 0, 1, 1,
-0.5861956, -0.4784226, -0.768332, 0, 0, 0, 1, 1,
-0.5860083, 1.577946, -1.247076, 0, 0, 0, 1, 1,
-0.5839298, 2.224941, 0.7416218, 0, 0, 0, 1, 1,
-0.5819554, -1.610631, -1.778233, 0, 0, 0, 1, 1,
-0.5615446, 0.7592498, 0.8361894, 0, 0, 0, 1, 1,
-0.5579821, 0.866928, -0.9088448, 1, 1, 1, 1, 1,
-0.5575795, -0.8948458, -4.411306, 1, 1, 1, 1, 1,
-0.5565701, 0.02494996, 0.7081417, 1, 1, 1, 1, 1,
-0.5563139, 1.093589, -0.2901548, 1, 1, 1, 1, 1,
-0.5559235, 0.02747555, -2.167828, 1, 1, 1, 1, 1,
-0.555028, 1.038486, 0.07295056, 1, 1, 1, 1, 1,
-0.553933, 1.356346, -2.14363, 1, 1, 1, 1, 1,
-0.5516222, -0.3344621, -1.309311, 1, 1, 1, 1, 1,
-0.5505879, 1.277381, -0.356718, 1, 1, 1, 1, 1,
-0.5505049, -0.1955123, -2.039193, 1, 1, 1, 1, 1,
-0.5392975, -1.974431, -2.685849, 1, 1, 1, 1, 1,
-0.5367547, 0.9754146, 0.7112948, 1, 1, 1, 1, 1,
-0.5308497, -0.6934109, -3.560308, 1, 1, 1, 1, 1,
-0.5295395, -0.7429255, -3.066453, 1, 1, 1, 1, 1,
-0.5254228, -0.6596698, -2.202568, 1, 1, 1, 1, 1,
-0.5194948, 1.084979, 0.4929373, 0, 0, 1, 1, 1,
-0.5157977, -1.06529, -1.525301, 1, 0, 0, 1, 1,
-0.5154147, 0.6644659, -1.129777, 1, 0, 0, 1, 1,
-0.5097177, 2.187444, -0.1245131, 1, 0, 0, 1, 1,
-0.5032737, 1.397556, -0.09317337, 1, 0, 0, 1, 1,
-0.5015562, -0.9493098, -3.104855, 1, 0, 0, 1, 1,
-0.5013285, 0.4380671, -1.523619, 0, 0, 0, 1, 1,
-0.5006626, 0.7325572, -1.497481, 0, 0, 0, 1, 1,
-0.4962054, 0.4061294, -0.2707245, 0, 0, 0, 1, 1,
-0.4955055, 2.301121, -1.568558, 0, 0, 0, 1, 1,
-0.4937844, -1.153393, -1.848742, 0, 0, 0, 1, 1,
-0.4800928, -0.1788331, -1.198075, 0, 0, 0, 1, 1,
-0.4778933, -0.08612439, -2.436366, 0, 0, 0, 1, 1,
-0.4770958, 0.2504598, -0.5463461, 1, 1, 1, 1, 1,
-0.472588, -0.5391282, -2.852566, 1, 1, 1, 1, 1,
-0.4715408, 0.8714023, -2.050087, 1, 1, 1, 1, 1,
-0.4678226, 0.0108269, -2.514303, 1, 1, 1, 1, 1,
-0.4676169, -0.7216018, -3.503283, 1, 1, 1, 1, 1,
-0.4558607, -1.297647, -2.509735, 1, 1, 1, 1, 1,
-0.4547415, 0.6450367, -1.365395, 1, 1, 1, 1, 1,
-0.45177, -1.972461, -4.064028, 1, 1, 1, 1, 1,
-0.4517691, 1.162204, 0.02043789, 1, 1, 1, 1, 1,
-0.4503547, -0.9506623, -2.303387, 1, 1, 1, 1, 1,
-0.4469457, 0.5602636, 0.9080845, 1, 1, 1, 1, 1,
-0.4400342, 0.2077878, -2.188138, 1, 1, 1, 1, 1,
-0.4346491, -0.8809736, -4.15208, 1, 1, 1, 1, 1,
-0.4333779, -1.323219, -2.12743, 1, 1, 1, 1, 1,
-0.4301616, 1.47265, -0.2645715, 1, 1, 1, 1, 1,
-0.4286659, -0.8170616, -1.99536, 0, 0, 1, 1, 1,
-0.4257342, 1.963406, -0.4494383, 1, 0, 0, 1, 1,
-0.4255856, -0.6146851, -1.811121, 1, 0, 0, 1, 1,
-0.4255462, -1.395773, -2.344876, 1, 0, 0, 1, 1,
-0.4241585, -1.137119, -3.887093, 1, 0, 0, 1, 1,
-0.423357, 0.9147758, 1.357476, 1, 0, 0, 1, 1,
-0.41692, -0.5475937, -2.35876, 0, 0, 0, 1, 1,
-0.4129352, 1.244333, 0.506457, 0, 0, 0, 1, 1,
-0.4103175, -0.6359863, -1.543813, 0, 0, 0, 1, 1,
-0.4078246, 1.335106, 1.056163, 0, 0, 0, 1, 1,
-0.4070304, -0.8453692, -3.016074, 0, 0, 0, 1, 1,
-0.4022954, -1.349539, -0.3196571, 0, 0, 0, 1, 1,
-0.3984075, -0.7181273, -3.171692, 0, 0, 0, 1, 1,
-0.3977771, -1.326988, -1.547717, 1, 1, 1, 1, 1,
-0.3899373, 0.2677872, -1.317021, 1, 1, 1, 1, 1,
-0.3879082, 1.006726, -0.01592211, 1, 1, 1, 1, 1,
-0.3869575, -0.3638646, -1.626114, 1, 1, 1, 1, 1,
-0.3857012, 0.3668455, -1.731612, 1, 1, 1, 1, 1,
-0.3845744, -0.3763444, -2.100987, 1, 1, 1, 1, 1,
-0.3844025, -2.355547, -3.923601, 1, 1, 1, 1, 1,
-0.382428, -1.936233, -1.42689, 1, 1, 1, 1, 1,
-0.3814038, 0.08760268, -0.7497203, 1, 1, 1, 1, 1,
-0.3794002, 0.04598377, -2.895404, 1, 1, 1, 1, 1,
-0.3786244, 0.1926122, -0.9534405, 1, 1, 1, 1, 1,
-0.3765873, 1.387864, 0.6050504, 1, 1, 1, 1, 1,
-0.3753712, 0.941869, 0.9072483, 1, 1, 1, 1, 1,
-0.3737378, -1.13522, -2.085371, 1, 1, 1, 1, 1,
-0.3737363, 0.5730766, 0.5173117, 1, 1, 1, 1, 1,
-0.3721008, 0.5954923, -1.867386, 0, 0, 1, 1, 1,
-0.3696534, 0.3370504, -0.22686, 1, 0, 0, 1, 1,
-0.3674104, 0.224116, -2.21473, 1, 0, 0, 1, 1,
-0.3634366, 1.04446, -1.11902, 1, 0, 0, 1, 1,
-0.3620518, -1.141787, -3.721092, 1, 0, 0, 1, 1,
-0.3591822, 0.9950176, -0.08707583, 1, 0, 0, 1, 1,
-0.3552302, -1.549582, -4.477758, 0, 0, 0, 1, 1,
-0.3546859, 0.7073295, -1.184865, 0, 0, 0, 1, 1,
-0.354528, -0.6189866, -2.335176, 0, 0, 0, 1, 1,
-0.3512163, 0.7897655, 0.1396922, 0, 0, 0, 1, 1,
-0.3479916, 0.5477228, 0.7283651, 0, 0, 0, 1, 1,
-0.3459194, -0.8045399, -3.595519, 0, 0, 0, 1, 1,
-0.336238, 1.737481, 1.028458, 0, 0, 0, 1, 1,
-0.3360603, -1.048385, -2.848826, 1, 1, 1, 1, 1,
-0.3359638, -1.026788, -3.38158, 1, 1, 1, 1, 1,
-0.3349317, 0.3726445, -0.3651787, 1, 1, 1, 1, 1,
-0.3345027, 1.566827, 0.02842098, 1, 1, 1, 1, 1,
-0.3321432, 0.6856025, -1.293642, 1, 1, 1, 1, 1,
-0.3293557, 0.7539145, -0.5358192, 1, 1, 1, 1, 1,
-0.328298, -0.03392896, -3.261764, 1, 1, 1, 1, 1,
-0.3274882, -2.812396, -1.999533, 1, 1, 1, 1, 1,
-0.3237283, -0.01890197, -1.421712, 1, 1, 1, 1, 1,
-0.3210219, 0.5664387, -0.8535593, 1, 1, 1, 1, 1,
-0.3188903, -0.7685575, -2.222116, 1, 1, 1, 1, 1,
-0.3172702, 1.107992, 0.4546436, 1, 1, 1, 1, 1,
-0.3169329, -0.955384, -3.470252, 1, 1, 1, 1, 1,
-0.3156497, -0.4285511, -2.7, 1, 1, 1, 1, 1,
-0.3146851, 0.5058219, -1.455805, 1, 1, 1, 1, 1,
-0.3107479, -0.273826, -2.95138, 0, 0, 1, 1, 1,
-0.3100554, 1.296263, 0.07698625, 1, 0, 0, 1, 1,
-0.3078397, -1.822919, -2.146609, 1, 0, 0, 1, 1,
-0.2968941, -0.3838827, -1.750066, 1, 0, 0, 1, 1,
-0.2963862, -0.807621, -1.652746, 1, 0, 0, 1, 1,
-0.2917352, 1.126324, 0.8828353, 1, 0, 0, 1, 1,
-0.2907789, -0.3361454, -2.559896, 0, 0, 0, 1, 1,
-0.2882376, -0.6411526, -1.501787, 0, 0, 0, 1, 1,
-0.2761299, 0.213839, -2.744433, 0, 0, 0, 1, 1,
-0.2747435, 0.8314478, -0.4465729, 0, 0, 0, 1, 1,
-0.2738312, 0.2037618, -1.387472, 0, 0, 0, 1, 1,
-0.2704849, 1.431443, -1.092452, 0, 0, 0, 1, 1,
-0.2702554, 0.193671, 0.1742253, 0, 0, 0, 1, 1,
-0.2670271, 0.8851296, -1.433644, 1, 1, 1, 1, 1,
-0.2628137, 0.4382685, -0.140177, 1, 1, 1, 1, 1,
-0.2621446, 1.74273, 0.5922974, 1, 1, 1, 1, 1,
-0.2587272, -1.267297, -2.014445, 1, 1, 1, 1, 1,
-0.257035, -0.4959506, -0.663269, 1, 1, 1, 1, 1,
-0.2560062, 1.097015, -0.2962952, 1, 1, 1, 1, 1,
-0.2549644, 0.8257833, -0.6526816, 1, 1, 1, 1, 1,
-0.2546839, 1.644101, 0.5590594, 1, 1, 1, 1, 1,
-0.2524456, 0.5706872, -2.086571, 1, 1, 1, 1, 1,
-0.2514467, -1.30944, -3.650977, 1, 1, 1, 1, 1,
-0.2489626, 1.855665, 0.2116722, 1, 1, 1, 1, 1,
-0.247317, 0.03366994, -1.959053, 1, 1, 1, 1, 1,
-0.2443761, 1.343123, -0.5369194, 1, 1, 1, 1, 1,
-0.2438628, 0.728386, 2.510831, 1, 1, 1, 1, 1,
-0.2420031, 0.2179963, -0.941888, 1, 1, 1, 1, 1,
-0.2413075, -0.9001737, -1.749545, 0, 0, 1, 1, 1,
-0.2411045, 0.1531085, -1.373902, 1, 0, 0, 1, 1,
-0.2375799, 2.308951, -1.222213, 1, 0, 0, 1, 1,
-0.2357224, -2.137072, -2.499053, 1, 0, 0, 1, 1,
-0.2353462, 1.847824, -1.351379, 1, 0, 0, 1, 1,
-0.2351731, 0.5582137, 1.684529, 1, 0, 0, 1, 1,
-0.2335665, 0.1992362, -0.5204825, 0, 0, 0, 1, 1,
-0.2325241, -1.195132, -3.855185, 0, 0, 0, 1, 1,
-0.2302681, 1.68649, -0.5063783, 0, 0, 0, 1, 1,
-0.2233576, 1.783161, 0.7866995, 0, 0, 0, 1, 1,
-0.2226519, -0.546007, -2.942958, 0, 0, 0, 1, 1,
-0.2219329, 0.1523825, -1.369845, 0, 0, 0, 1, 1,
-0.2217122, 0.4605869, 1.578839, 0, 0, 0, 1, 1,
-0.2196454, 0.9225549, 1.668551, 1, 1, 1, 1, 1,
-0.2165112, -0.8130988, -1.84306, 1, 1, 1, 1, 1,
-0.216422, -1.16777, -2.540369, 1, 1, 1, 1, 1,
-0.2136607, 1.633778, 0.5632527, 1, 1, 1, 1, 1,
-0.2116615, 0.5642543, -1.005129, 1, 1, 1, 1, 1,
-0.206675, -0.7523224, -3.315189, 1, 1, 1, 1, 1,
-0.2007101, -0.07435776, -1.897934, 1, 1, 1, 1, 1,
-0.1969241, 3.533346, 0.5505369, 1, 1, 1, 1, 1,
-0.1892337, 0.8963993, -0.365285, 1, 1, 1, 1, 1,
-0.1829345, -1.401726, -2.827995, 1, 1, 1, 1, 1,
-0.1817389, 0.7973813, 0.06953634, 1, 1, 1, 1, 1,
-0.1814315, -0.08220852, -1.317302, 1, 1, 1, 1, 1,
-0.1809354, 0.9111325, -0.1147752, 1, 1, 1, 1, 1,
-0.1808652, 0.5481814, -2.319748, 1, 1, 1, 1, 1,
-0.1797702, -0.4007224, -1.571614, 1, 1, 1, 1, 1,
-0.1793364, 0.5120538, -0.9368784, 0, 0, 1, 1, 1,
-0.1786722, -0.4853031, -2.769386, 1, 0, 0, 1, 1,
-0.1785661, -1.472933, -4.627025, 1, 0, 0, 1, 1,
-0.1762948, -1.754388, -2.255202, 1, 0, 0, 1, 1,
-0.1741922, 0.8489294, -1.423735, 1, 0, 0, 1, 1,
-0.173018, 2.627606, 0.2468043, 1, 0, 0, 1, 1,
-0.1711811, 0.02568249, -2.151357, 0, 0, 0, 1, 1,
-0.170251, 0.6381386, -1.893999, 0, 0, 0, 1, 1,
-0.1701975, 0.5488493, 0.9132239, 0, 0, 0, 1, 1,
-0.1685502, -1.093001, -3.400387, 0, 0, 0, 1, 1,
-0.1677012, -0.0393972, -1.433404, 0, 0, 0, 1, 1,
-0.1659964, 0.5341797, 1.091089, 0, 0, 0, 1, 1,
-0.1651134, 0.4230326, -0.3261441, 0, 0, 0, 1, 1,
-0.1589012, -0.3556339, -1.694699, 1, 1, 1, 1, 1,
-0.1581724, 0.6104969, 0.2663096, 1, 1, 1, 1, 1,
-0.1575058, 0.03223878, -0.2312267, 1, 1, 1, 1, 1,
-0.1547764, 0.3416266, -1.151618, 1, 1, 1, 1, 1,
-0.1535137, -0.08776828, -0.6641681, 1, 1, 1, 1, 1,
-0.1495009, -0.7868629, -3.035691, 1, 1, 1, 1, 1,
-0.1459532, -0.7971902, -4.10875, 1, 1, 1, 1, 1,
-0.1457219, 0.2231847, -1.405181, 1, 1, 1, 1, 1,
-0.1383671, -0.1189749, -3.222832, 1, 1, 1, 1, 1,
-0.1302006, 1.387139, -0.9103405, 1, 1, 1, 1, 1,
-0.1301023, -0.3241056, -2.82976, 1, 1, 1, 1, 1,
-0.1271958, -0.7296759, -3.77162, 1, 1, 1, 1, 1,
-0.1250126, 1.427768, -1.756082, 1, 1, 1, 1, 1,
-0.1223982, 0.1014444, -1.425895, 1, 1, 1, 1, 1,
-0.1196158, -0.01379513, -1.064557, 1, 1, 1, 1, 1,
-0.1182395, -0.6811272, -4.838143, 0, 0, 1, 1, 1,
-0.1181475, -0.4464597, -2.896956, 1, 0, 0, 1, 1,
-0.1092784, 0.7776595, -0.2606961, 1, 0, 0, 1, 1,
-0.108183, 0.7201118, 0.2634256, 1, 0, 0, 1, 1,
-0.09815022, -0.3196488, -4.839729, 1, 0, 0, 1, 1,
-0.09773013, 0.9384272, -0.03513594, 1, 0, 0, 1, 1,
-0.09727944, 0.2817213, -0.1611012, 0, 0, 0, 1, 1,
-0.09661353, 1.225495, 0.6584086, 0, 0, 0, 1, 1,
-0.09660835, -0.7897473, -2.009162, 0, 0, 0, 1, 1,
-0.09536065, -0.8658974, -3.222758, 0, 0, 0, 1, 1,
-0.09350671, -2.303096, -2.947947, 0, 0, 0, 1, 1,
-0.09195909, 0.6629761, -2.46162, 0, 0, 0, 1, 1,
-0.09033403, -0.8636879, -3.235374, 0, 0, 0, 1, 1,
-0.09015824, 0.2446952, 1.801812, 1, 1, 1, 1, 1,
-0.090034, -0.5290393, -3.59637, 1, 1, 1, 1, 1,
-0.0882194, -2.095972, -2.363087, 1, 1, 1, 1, 1,
-0.08729694, -0.1608199, -2.410349, 1, 1, 1, 1, 1,
-0.08648615, 0.6376033, 0.2334755, 1, 1, 1, 1, 1,
-0.08310287, -0.7012822, -2.742649, 1, 1, 1, 1, 1,
-0.07912445, -0.3415652, -1.059845, 1, 1, 1, 1, 1,
-0.0679751, 1.352683, 0.04539723, 1, 1, 1, 1, 1,
-0.06322762, -1.755235, -1.073008, 1, 1, 1, 1, 1,
-0.06123696, 0.6275865, 1.498203, 1, 1, 1, 1, 1,
-0.05759073, 0.799538, -0.11056, 1, 1, 1, 1, 1,
-0.05543228, 1.17119, -0.06247063, 1, 1, 1, 1, 1,
-0.05513005, 0.2807804, 0.3172267, 1, 1, 1, 1, 1,
-0.04446519, -0.6824566, -4.224277, 1, 1, 1, 1, 1,
-0.04313673, -1.921417, -0.9769207, 1, 1, 1, 1, 1,
-0.03747982, -1.683983, -5.118131, 0, 0, 1, 1, 1,
-0.03696512, -1.378406, -2.37096, 1, 0, 0, 1, 1,
-0.03614755, -2.916631, -3.426563, 1, 0, 0, 1, 1,
-0.03127571, -0.303692, -3.619639, 1, 0, 0, 1, 1,
-0.02871563, 1.255093, 1.728583, 1, 0, 0, 1, 1,
-0.02542169, -0.8310897, -3.644746, 1, 0, 0, 1, 1,
-0.02159003, -2.486028, -2.70934, 0, 0, 0, 1, 1,
-0.01067401, 2.080159, -1.112218, 0, 0, 0, 1, 1,
-0.009037949, 1.430078, -0.7745128, 0, 0, 0, 1, 1,
-0.007844909, 0.4298684, -1.265231, 0, 0, 0, 1, 1,
-0.007002382, 0.3982371, -1.835453, 0, 0, 0, 1, 1,
-0.004100132, -1.109538, -2.609163, 0, 0, 0, 1, 1,
-0.00346834, 0.2929674, -0.2441506, 0, 0, 0, 1, 1,
-0.002401281, 0.6720781, -0.315669, 1, 1, 1, 1, 1,
-0.0008940608, -0.5709037, -3.194762, 1, 1, 1, 1, 1,
0.00284051, -0.9221951, 3.687655, 1, 1, 1, 1, 1,
0.00550047, -0.0167952, 2.586928, 1, 1, 1, 1, 1,
0.006132471, -1.245114, 4.618945, 1, 1, 1, 1, 1,
0.007236503, 0.4465111, -2.238446, 1, 1, 1, 1, 1,
0.01125714, 0.2065271, 1.176005, 1, 1, 1, 1, 1,
0.02503752, 0.1303972, 1.446968, 1, 1, 1, 1, 1,
0.02630853, -0.238284, 2.848257, 1, 1, 1, 1, 1,
0.02994856, -1.196106, 3.508115, 1, 1, 1, 1, 1,
0.0320327, 0.6254714, -0.8124937, 1, 1, 1, 1, 1,
0.03473168, 0.4172587, 1.908917, 1, 1, 1, 1, 1,
0.03505554, 1.779835, -1.838734, 1, 1, 1, 1, 1,
0.03699059, 0.6156712, -0.4144793, 1, 1, 1, 1, 1,
0.03974426, -0.7656471, 2.397898, 1, 1, 1, 1, 1,
0.03985926, -0.4876043, 2.814527, 0, 0, 1, 1, 1,
0.04081586, 0.5352588, 0.4806488, 1, 0, 0, 1, 1,
0.04408385, -0.1521129, 3.049956, 1, 0, 0, 1, 1,
0.0500683, -0.2123731, 3.585713, 1, 0, 0, 1, 1,
0.05244569, 0.6659576, -1.386188, 1, 0, 0, 1, 1,
0.05296043, 1.086318, 0.7676314, 1, 0, 0, 1, 1,
0.05581421, 0.08359236, 0.2610419, 0, 0, 0, 1, 1,
0.05584265, -0.1059213, 3.368872, 0, 0, 0, 1, 1,
0.05600797, -1.3901, 1.523612, 0, 0, 0, 1, 1,
0.05788901, -2.796612, 1.806043, 0, 0, 0, 1, 1,
0.05921208, -0.6656427, 3.136906, 0, 0, 0, 1, 1,
0.05925342, -0.400223, 2.585584, 0, 0, 0, 1, 1,
0.06040925, -0.1558908, 3.055111, 0, 0, 0, 1, 1,
0.06257084, -0.2244818, 0.7994245, 1, 1, 1, 1, 1,
0.06335388, 2.092906, 0.7974277, 1, 1, 1, 1, 1,
0.06405509, 1.038581, -0.08132832, 1, 1, 1, 1, 1,
0.07157262, -0.404696, 3.98786, 1, 1, 1, 1, 1,
0.07425956, 0.6353335, 0.09699827, 1, 1, 1, 1, 1,
0.07460861, 0.0557816, 1.401528, 1, 1, 1, 1, 1,
0.07485902, -0.2314624, 3.665193, 1, 1, 1, 1, 1,
0.07500937, 0.7934262, -0.369147, 1, 1, 1, 1, 1,
0.07603921, 0.2489844, 0.401796, 1, 1, 1, 1, 1,
0.08067755, -0.8873731, 2.976616, 1, 1, 1, 1, 1,
0.08085431, 1.228345, -0.9551808, 1, 1, 1, 1, 1,
0.08210008, -0.4282619, 2.36599, 1, 1, 1, 1, 1,
0.08233696, 1.848849, 1.384284, 1, 1, 1, 1, 1,
0.08276379, -1.083805, 1.752026, 1, 1, 1, 1, 1,
0.0832354, -0.6719791, 3.429837, 1, 1, 1, 1, 1,
0.08940767, -0.4233057, 2.472965, 0, 0, 1, 1, 1,
0.09258039, 0.02226008, -0.1307167, 1, 0, 0, 1, 1,
0.09493572, 1.067205, -0.9381106, 1, 0, 0, 1, 1,
0.1050625, -0.3366428, 3.642036, 1, 0, 0, 1, 1,
0.1078097, 0.0714875, 2.113863, 1, 0, 0, 1, 1,
0.112379, 0.2732734, 0.6524441, 1, 0, 0, 1, 1,
0.1142492, 1.226742, -0.2664214, 0, 0, 0, 1, 1,
0.1158575, 1.009906, 0.5136374, 0, 0, 0, 1, 1,
0.1197996, 1.130641, -0.7977811, 0, 0, 0, 1, 1,
0.1218248, -0.8611131, 3.672266, 0, 0, 0, 1, 1,
0.1227672, -1.001093, 2.555211, 0, 0, 0, 1, 1,
0.1262419, 1.075903, -1.391592, 0, 0, 0, 1, 1,
0.1276425, -1.5284, 1.303206, 0, 0, 0, 1, 1,
0.1276769, -0.6120054, 1.559934, 1, 1, 1, 1, 1,
0.131301, -1.852459, 1.833205, 1, 1, 1, 1, 1,
0.1396037, -1.042466, 4.020468, 1, 1, 1, 1, 1,
0.1415125, -0.2820172, 2.89974, 1, 1, 1, 1, 1,
0.141794, -0.2340283, 2.097263, 1, 1, 1, 1, 1,
0.1454522, -1.251101, 3.063862, 1, 1, 1, 1, 1,
0.1469107, -0.114407, 0.7907274, 1, 1, 1, 1, 1,
0.1519738, -0.1604649, 3.820651, 1, 1, 1, 1, 1,
0.1532845, 1.615185, 0.2650104, 1, 1, 1, 1, 1,
0.1545586, -1.238257, 4.008397, 1, 1, 1, 1, 1,
0.1545996, 0.9455223, 1.312362, 1, 1, 1, 1, 1,
0.1548509, 0.3152499, 2.262319, 1, 1, 1, 1, 1,
0.1553137, 0.2357926, 1.870668, 1, 1, 1, 1, 1,
0.1571375, -1.031652, 1.307061, 1, 1, 1, 1, 1,
0.1601758, -0.5860508, 3.982889, 1, 1, 1, 1, 1,
0.1602915, -0.8359756, 2.841337, 0, 0, 1, 1, 1,
0.1616264, -0.860433, 2.261122, 1, 0, 0, 1, 1,
0.1627032, 1.371926, -0.1460988, 1, 0, 0, 1, 1,
0.1646336, -1.147257, 4.69919, 1, 0, 0, 1, 1,
0.164767, -0.9739226, 3.857398, 1, 0, 0, 1, 1,
0.1649034, -0.4298284, 0.7283266, 1, 0, 0, 1, 1,
0.1722988, -0.960468, 1.396481, 0, 0, 0, 1, 1,
0.177328, -0.7353552, 3.5265, 0, 0, 0, 1, 1,
0.1777123, -0.9045513, 3.547926, 0, 0, 0, 1, 1,
0.180936, 0.0833956, 0.1844535, 0, 0, 0, 1, 1,
0.1810722, 1.026186, 1.837063, 0, 0, 0, 1, 1,
0.1865263, 0.9283408, 1.441817, 0, 0, 0, 1, 1,
0.1881239, 0.3044291, 2.467724, 0, 0, 0, 1, 1,
0.1905759, -0.2065951, 2.760764, 1, 1, 1, 1, 1,
0.1909095, -0.6246284, 2.308839, 1, 1, 1, 1, 1,
0.1981802, -0.8152367, -0.008416227, 1, 1, 1, 1, 1,
0.2013735, -0.5414895, 3.349721, 1, 1, 1, 1, 1,
0.2079776, -0.5184805, 0.2173126, 1, 1, 1, 1, 1,
0.2093899, 1.232126, 0.8861894, 1, 1, 1, 1, 1,
0.2228155, -1.240545, 2.437834, 1, 1, 1, 1, 1,
0.2270563, -0.7087907, 3.776902, 1, 1, 1, 1, 1,
0.2402814, 0.2731928, -0.6024303, 1, 1, 1, 1, 1,
0.2436816, -0.0861206, 2.447254, 1, 1, 1, 1, 1,
0.2483001, -0.8494698, 2.844774, 1, 1, 1, 1, 1,
0.2499383, 0.2391113, 1.068944, 1, 1, 1, 1, 1,
0.2514094, -0.5745306, 3.365371, 1, 1, 1, 1, 1,
0.2557049, 1.449154, 1.188738, 1, 1, 1, 1, 1,
0.2563112, 0.3064973, 1.482787, 1, 1, 1, 1, 1,
0.2582462, 0.67883, 0.5460827, 0, 0, 1, 1, 1,
0.2633108, 0.9886502, 0.9089192, 1, 0, 0, 1, 1,
0.2645075, -0.1225107, 1.873362, 1, 0, 0, 1, 1,
0.2670948, 0.03786441, 0.9893652, 1, 0, 0, 1, 1,
0.2718938, -0.9963058, 2.726259, 1, 0, 0, 1, 1,
0.2734904, -0.9328555, 3.461375, 1, 0, 0, 1, 1,
0.2760486, -0.5358677, 1.593761, 0, 0, 0, 1, 1,
0.2797395, 0.4415815, 0.4736386, 0, 0, 0, 1, 1,
0.2884324, -1.509214, 4.364528, 0, 0, 0, 1, 1,
0.290579, 1.312948, -0.4704869, 0, 0, 0, 1, 1,
0.2931392, 1.010332, -0.125494, 0, 0, 0, 1, 1,
0.2968965, -1.27141, 3.187606, 0, 0, 0, 1, 1,
0.2973913, -0.04650717, 2.84327, 0, 0, 0, 1, 1,
0.299058, 0.1443185, 2.709833, 1, 1, 1, 1, 1,
0.2995184, -1.633304, 3.233314, 1, 1, 1, 1, 1,
0.3045266, -0.9088577, 2.573876, 1, 1, 1, 1, 1,
0.3071655, 1.818242, 0.2277552, 1, 1, 1, 1, 1,
0.3141389, 0.8613532, 0.9266896, 1, 1, 1, 1, 1,
0.3148246, -0.3104548, 1.757516, 1, 1, 1, 1, 1,
0.3181958, 1.292367, 0.06286995, 1, 1, 1, 1, 1,
0.3183889, -0.02226969, 0.6411489, 1, 1, 1, 1, 1,
0.32247, -0.7820537, 2.422116, 1, 1, 1, 1, 1,
0.3260414, -0.5924325, 3.324619, 1, 1, 1, 1, 1,
0.3336918, -0.15675, 2.443063, 1, 1, 1, 1, 1,
0.3342203, 0.1310421, 1.131958, 1, 1, 1, 1, 1,
0.3346693, -1.293512, 1.870105, 1, 1, 1, 1, 1,
0.3371976, 0.1717065, 1.233881, 1, 1, 1, 1, 1,
0.3444779, 2.081825, -0.8213184, 1, 1, 1, 1, 1,
0.3446927, 0.08077807, 1.381828, 0, 0, 1, 1, 1,
0.3520822, 1.519257, -0.6112654, 1, 0, 0, 1, 1,
0.3522679, -0.4395354, 2.452102, 1, 0, 0, 1, 1,
0.3525829, -1.954383, 1.51971, 1, 0, 0, 1, 1,
0.3536416, 0.6092872, -0.3777459, 1, 0, 0, 1, 1,
0.3594576, -0.6203842, 2.938827, 1, 0, 0, 1, 1,
0.3617254, -2.049855, 1.850163, 0, 0, 0, 1, 1,
0.3631475, 1.138397, 0.4578116, 0, 0, 0, 1, 1,
0.3663881, 0.2605268, 1.455812, 0, 0, 0, 1, 1,
0.3706971, -1.547978, 2.998843, 0, 0, 0, 1, 1,
0.3715622, -0.6833977, 1.414759, 0, 0, 0, 1, 1,
0.3748817, 0.4711743, 1.50611, 0, 0, 0, 1, 1,
0.376983, -0.2713791, 1.944876, 0, 0, 0, 1, 1,
0.3792947, -0.4213132, 2.957371, 1, 1, 1, 1, 1,
0.3817612, -0.3693801, 2.193052, 1, 1, 1, 1, 1,
0.382122, 1.189219, 0.4824254, 1, 1, 1, 1, 1,
0.3844502, 0.7383133, 0.5117483, 1, 1, 1, 1, 1,
0.387291, -0.8792192, 3.551811, 1, 1, 1, 1, 1,
0.3876073, -0.81892, 4.210904, 1, 1, 1, 1, 1,
0.3895109, 0.1616225, 1.965358, 1, 1, 1, 1, 1,
0.391303, -1.286212, 2.483814, 1, 1, 1, 1, 1,
0.3934237, 0.3966464, 0.5408158, 1, 1, 1, 1, 1,
0.4018302, -0.8190686, 3.597668, 1, 1, 1, 1, 1,
0.4114002, 1.052775, 1.063663, 1, 1, 1, 1, 1,
0.4170512, 0.5163538, -0.09556487, 1, 1, 1, 1, 1,
0.4244983, -2.350907, 4.329578, 1, 1, 1, 1, 1,
0.43462, -1.15756, 1.926032, 1, 1, 1, 1, 1,
0.4360411, 0.3193892, 3.853989, 1, 1, 1, 1, 1,
0.4462382, -0.5568445, 2.708164, 0, 0, 1, 1, 1,
0.4473799, -1.369334, 3.389441, 1, 0, 0, 1, 1,
0.4500908, 1.60144, 0.6490614, 1, 0, 0, 1, 1,
0.4501393, 0.4706346, 3.310674, 1, 0, 0, 1, 1,
0.4556924, -0.6021668, 3.358621, 1, 0, 0, 1, 1,
0.4557579, 0.6249105, 2.117254, 1, 0, 0, 1, 1,
0.4569602, -0.1846124, 3.931555, 0, 0, 0, 1, 1,
0.4579293, 0.5292029, 1.135329, 0, 0, 0, 1, 1,
0.4619416, -0.5490473, 1.465058, 0, 0, 0, 1, 1,
0.4650965, 0.2655202, -0.476271, 0, 0, 0, 1, 1,
0.4651773, 0.6605742, -0.5813155, 0, 0, 0, 1, 1,
0.4689403, 0.3798628, 1.911472, 0, 0, 0, 1, 1,
0.469488, -0.7373666, 2.732107, 0, 0, 0, 1, 1,
0.4710637, -0.7206289, 2.687116, 1, 1, 1, 1, 1,
0.4742137, -0.296027, 1.77616, 1, 1, 1, 1, 1,
0.4759305, -0.8277577, 3.507041, 1, 1, 1, 1, 1,
0.478601, 1.755858, 0.278869, 1, 1, 1, 1, 1,
0.4794075, -0.04335967, 2.164958, 1, 1, 1, 1, 1,
0.4816133, 0.4279168, 1.635598, 1, 1, 1, 1, 1,
0.4819816, 0.01557357, 2.688969, 1, 1, 1, 1, 1,
0.4836602, 0.0883516, 1.765307, 1, 1, 1, 1, 1,
0.4872102, 0.1622695, 0.9577385, 1, 1, 1, 1, 1,
0.4896672, 0.543358, 1.557557, 1, 1, 1, 1, 1,
0.4928189, -0.4451969, 3.220006, 1, 1, 1, 1, 1,
0.4950887, -0.1440366, 1.471078, 1, 1, 1, 1, 1,
0.4972117, 1.177224, -0.5954286, 1, 1, 1, 1, 1,
0.498248, 0.8277153, 1.066514, 1, 1, 1, 1, 1,
0.5027373, -1.084527, 1.332137, 1, 1, 1, 1, 1,
0.5068532, 0.2637923, 0.519778, 0, 0, 1, 1, 1,
0.5076706, -0.1174529, -0.178549, 1, 0, 0, 1, 1,
0.5088395, -0.9849278, 2.552884, 1, 0, 0, 1, 1,
0.509148, -0.6615407, 1.237225, 1, 0, 0, 1, 1,
0.5111065, 0.3059866, 0.8935384, 1, 0, 0, 1, 1,
0.5128344, 0.448157, -0.2386865, 1, 0, 0, 1, 1,
0.5151153, -1.030333, 1.730117, 0, 0, 0, 1, 1,
0.5185758, -0.3669831, 2.096901, 0, 0, 0, 1, 1,
0.5272726, -1.997544, 2.204546, 0, 0, 0, 1, 1,
0.527477, -0.6083701, 0.968984, 0, 0, 0, 1, 1,
0.5340029, 0.02957067, 3.554017, 0, 0, 0, 1, 1,
0.5373601, 1.791822, 1.848707, 0, 0, 0, 1, 1,
0.5387672, -0.1488437, 0.9464749, 0, 0, 0, 1, 1,
0.5468302, -0.08230143, 2.199789, 1, 1, 1, 1, 1,
0.5480105, 1.985469, 0.3360661, 1, 1, 1, 1, 1,
0.5483287, -1.620499, 5.891028, 1, 1, 1, 1, 1,
0.5536497, 0.7337358, 2.358282, 1, 1, 1, 1, 1,
0.5610552, -0.3628128, 1.027737, 1, 1, 1, 1, 1,
0.5619971, 0.000991577, 2.629603, 1, 1, 1, 1, 1,
0.5639793, -0.8549971, 1.524439, 1, 1, 1, 1, 1,
0.564886, 0.4670404, 2.052452, 1, 1, 1, 1, 1,
0.5691183, -0.09235922, 1.181663, 1, 1, 1, 1, 1,
0.5728506, -0.04988984, 0.601766, 1, 1, 1, 1, 1,
0.574079, -1.239078, 2.357682, 1, 1, 1, 1, 1,
0.5741901, 1.312539, -0.8605298, 1, 1, 1, 1, 1,
0.5838925, -1.834455, 5.532857, 1, 1, 1, 1, 1,
0.5904255, -0.07055017, 1.406001, 1, 1, 1, 1, 1,
0.5907869, 0.2268631, 1.447859, 1, 1, 1, 1, 1,
0.5909001, 1.27176, -1.465299, 0, 0, 1, 1, 1,
0.5924425, 0.498906, 1.009082, 1, 0, 0, 1, 1,
0.6102942, 0.9453487, 0.07656763, 1, 0, 0, 1, 1,
0.6136807, -0.07888692, 2.995117, 1, 0, 0, 1, 1,
0.6160985, -0.5682324, 2.472679, 1, 0, 0, 1, 1,
0.620781, 0.4313898, 2.087575, 1, 0, 0, 1, 1,
0.6232074, 0.6268477, 0.7890604, 0, 0, 0, 1, 1,
0.6243941, 0.2656455, 1.024203, 0, 0, 0, 1, 1,
0.6313941, 0.156025, 1.968336, 0, 0, 0, 1, 1,
0.6332677, 1.349895, 1.659908, 0, 0, 0, 1, 1,
0.6334108, -0.2529739, 2.051013, 0, 0, 0, 1, 1,
0.6349405, 0.2128221, 2.802226, 0, 0, 0, 1, 1,
0.637627, 0.9084467, 0.1430964, 0, 0, 0, 1, 1,
0.6378926, -0.5000086, 2.1977, 1, 1, 1, 1, 1,
0.6384472, 0.7182179, -0.7894856, 1, 1, 1, 1, 1,
0.6387842, -0.5356559, 4.596559, 1, 1, 1, 1, 1,
0.6480906, 0.6732043, -1.579844, 1, 1, 1, 1, 1,
0.6485812, 0.6131178, -0.2276942, 1, 1, 1, 1, 1,
0.6488153, 0.9322421, -1.770349, 1, 1, 1, 1, 1,
0.651684, 0.04125146, 1.486327, 1, 1, 1, 1, 1,
0.654903, 0.2250633, 1.575961, 1, 1, 1, 1, 1,
0.6551173, -0.6428022, 2.679712, 1, 1, 1, 1, 1,
0.6564962, -0.9646339, 1.230155, 1, 1, 1, 1, 1,
0.6661649, 0.6227857, -0.3551152, 1, 1, 1, 1, 1,
0.6712463, 0.4581313, -0.6734831, 1, 1, 1, 1, 1,
0.672344, 0.8973477, 2.197298, 1, 1, 1, 1, 1,
0.6734536, -0.3533159, 1.917802, 1, 1, 1, 1, 1,
0.6761383, 0.9166226, 1.289225, 1, 1, 1, 1, 1,
0.6764598, 1.336833, -0.0389876, 0, 0, 1, 1, 1,
0.6803784, -0.7964335, 3.796792, 1, 0, 0, 1, 1,
0.6811209, -0.4207211, 3.647935, 1, 0, 0, 1, 1,
0.6822774, 1.039698, 2.246356, 1, 0, 0, 1, 1,
0.6825342, -0.03408432, 1.522701, 1, 0, 0, 1, 1,
0.6902337, -0.8792664, 2.978305, 1, 0, 0, 1, 1,
0.6973364, -1.510487, 1.47985, 0, 0, 0, 1, 1,
0.7016392, -2.670127, 3.389516, 0, 0, 0, 1, 1,
0.7024519, -0.4962989, 2.467901, 0, 0, 0, 1, 1,
0.7112572, 0.9029375, -0.09430236, 0, 0, 0, 1, 1,
0.7119141, -0.5385412, 3.396672, 0, 0, 0, 1, 1,
0.7163445, 0.345589, 0.6688568, 0, 0, 0, 1, 1,
0.7232633, -0.4416271, 2.034858, 0, 0, 0, 1, 1,
0.7271196, -0.02827901, 1.072984, 1, 1, 1, 1, 1,
0.7281835, -0.6551026, 1.760685, 1, 1, 1, 1, 1,
0.7297442, 0.2138312, 0.7739914, 1, 1, 1, 1, 1,
0.7314578, 0.5931486, 2.251796, 1, 1, 1, 1, 1,
0.7316962, 0.3572525, -0.8859199, 1, 1, 1, 1, 1,
0.7340547, -0.1527582, 2.115911, 1, 1, 1, 1, 1,
0.7380632, -1.095563, 0.7829195, 1, 1, 1, 1, 1,
0.7406964, -0.3900937, 1.987843, 1, 1, 1, 1, 1,
0.7468381, -0.4523596, 3.283639, 1, 1, 1, 1, 1,
0.7477823, 1.066976, 1.846642, 1, 1, 1, 1, 1,
0.7518672, 0.4485519, 1.503359, 1, 1, 1, 1, 1,
0.7533619, -0.02823813, -0.5044557, 1, 1, 1, 1, 1,
0.7564501, 1.02695, 0.9573176, 1, 1, 1, 1, 1,
0.7670726, -0.7939928, 3.334419, 1, 1, 1, 1, 1,
0.771378, 0.1194874, 2.76725, 1, 1, 1, 1, 1,
0.7743501, 0.7675347, 1.235544, 0, 0, 1, 1, 1,
0.7797145, 0.9461959, 0.5674539, 1, 0, 0, 1, 1,
0.7814113, -1.699927, 4.188518, 1, 0, 0, 1, 1,
0.7920986, 0.176864, 1.965, 1, 0, 0, 1, 1,
0.7979067, -0.03470127, 2.796743, 1, 0, 0, 1, 1,
0.8028097, -0.2607226, 2.656871, 1, 0, 0, 1, 1,
0.8060533, 0.2687493, 1.46271, 0, 0, 0, 1, 1,
0.8087928, 0.67932, 0.01634278, 0, 0, 0, 1, 1,
0.8170115, -1.430082, 2.328504, 0, 0, 0, 1, 1,
0.8233179, 0.3750505, 0.3324235, 0, 0, 0, 1, 1,
0.8361507, 0.174801, 2.314025, 0, 0, 0, 1, 1,
0.8450741, 1.157989, -1.146438, 0, 0, 0, 1, 1,
0.845821, 1.008887, 0.1428648, 0, 0, 0, 1, 1,
0.8459708, 1.11333, 1.513245, 1, 1, 1, 1, 1,
0.8466046, -0.6464, 3.497232, 1, 1, 1, 1, 1,
0.8517394, 1.66934, 0.2113986, 1, 1, 1, 1, 1,
0.8535929, -0.9841943, 1.756081, 1, 1, 1, 1, 1,
0.8597938, -1.10754, 3.760725, 1, 1, 1, 1, 1,
0.8679311, 1.18985, 0.4731878, 1, 1, 1, 1, 1,
0.8681679, -0.7479425, 2.034776, 1, 1, 1, 1, 1,
0.8689986, 0.4932979, 1.999386, 1, 1, 1, 1, 1,
0.8737335, -0.01111043, 3.448828, 1, 1, 1, 1, 1,
0.8763407, -0.01086691, 3.782766, 1, 1, 1, 1, 1,
0.8812467, -0.3112001, 2.231971, 1, 1, 1, 1, 1,
0.8928933, 0.2665098, 2.038643, 1, 1, 1, 1, 1,
0.8951104, 1.202924, -0.2339056, 1, 1, 1, 1, 1,
0.9026529, 0.4831346, 1.874678, 1, 1, 1, 1, 1,
0.9033944, -0.1700707, 2.913882, 1, 1, 1, 1, 1,
0.9084054, -0.7860163, 3.9185, 0, 0, 1, 1, 1,
0.9242045, 1.401878, 0.06406453, 1, 0, 0, 1, 1,
0.9244938, -0.9335464, 2.034308, 1, 0, 0, 1, 1,
0.9277123, -0.1428012, 2.135834, 1, 0, 0, 1, 1,
0.9292138, -0.8286492, 2.17956, 1, 0, 0, 1, 1,
0.9507371, -0.7443936, 2.814602, 1, 0, 0, 1, 1,
0.957638, 1.239267, 1.812534, 0, 0, 0, 1, 1,
0.9603316, -2.648334, 2.334055, 0, 0, 0, 1, 1,
0.9645411, 0.2315461, -0.966543, 0, 0, 0, 1, 1,
0.9711831, 1.783011, -0.01504223, 0, 0, 0, 1, 1,
0.9723675, -0.08449098, 0.9918046, 0, 0, 0, 1, 1,
0.9764644, 1.012444, -1.233901, 0, 0, 0, 1, 1,
0.9783996, 0.02034527, 1.315667, 0, 0, 0, 1, 1,
0.9811563, -0.4370382, 0.934705, 1, 1, 1, 1, 1,
0.9839087, 0.8626139, -0.6269832, 1, 1, 1, 1, 1,
0.9865314, 0.1529741, 2.103022, 1, 1, 1, 1, 1,
0.9930691, -0.7342378, 0.7083288, 1, 1, 1, 1, 1,
0.9958841, -1.998699, 3.027489, 1, 1, 1, 1, 1,
0.9967819, -0.8718256, 2.455917, 1, 1, 1, 1, 1,
0.999226, 0.8538921, -0.2417891, 1, 1, 1, 1, 1,
1.001162, -1.434242, 2.470738, 1, 1, 1, 1, 1,
1.001495, -0.5263676, 0.8702254, 1, 1, 1, 1, 1,
1.002071, -0.05635896, 0.748324, 1, 1, 1, 1, 1,
1.002074, 1.070078, 0.03571012, 1, 1, 1, 1, 1,
1.010316, -1.234207, 1.193703, 1, 1, 1, 1, 1,
1.010922, 0.4286365, 1.622679, 1, 1, 1, 1, 1,
1.013994, 1.110454, 2.041299, 1, 1, 1, 1, 1,
1.023641, -0.3528416, 3.226626, 1, 1, 1, 1, 1,
1.023862, 1.158983, 1.456245, 0, 0, 1, 1, 1,
1.027167, -0.7152611, 2.235549, 1, 0, 0, 1, 1,
1.034301, 1.09861, 0.004813661, 1, 0, 0, 1, 1,
1.037885, -1.52788, 1.702796, 1, 0, 0, 1, 1,
1.039611, 0.3019041, 1.449367, 1, 0, 0, 1, 1,
1.052878, 0.4674157, -0.3018289, 1, 0, 0, 1, 1,
1.053061, -0.2386823, 2.670094, 0, 0, 0, 1, 1,
1.053547, 0.03655381, 1.346276, 0, 0, 0, 1, 1,
1.056982, 0.5008032, 2.806868, 0, 0, 0, 1, 1,
1.068392, 0.1851346, -0.08255452, 0, 0, 0, 1, 1,
1.068965, 1.313692, 0.7439224, 0, 0, 0, 1, 1,
1.072113, -0.6903139, 3.418145, 0, 0, 0, 1, 1,
1.078458, 1.807568, -0.5189432, 0, 0, 0, 1, 1,
1.078534, -0.3754802, 1.696099, 1, 1, 1, 1, 1,
1.083583, 0.1785163, 0.8840797, 1, 1, 1, 1, 1,
1.084985, 0.2826929, 2.264841, 1, 1, 1, 1, 1,
1.08559, 0.7955031, 0.6546994, 1, 1, 1, 1, 1,
1.089796, -0.4208419, 2.411701, 1, 1, 1, 1, 1,
1.098237, -0.732048, 2.986147, 1, 1, 1, 1, 1,
1.098538, 1.38811, 2.602317, 1, 1, 1, 1, 1,
1.098568, -0.5036176, 0.2832607, 1, 1, 1, 1, 1,
1.102007, 0.8074313, 1.81874, 1, 1, 1, 1, 1,
1.118898, 0.7726676, 1.895374, 1, 1, 1, 1, 1,
1.120604, -0.9642004, 2.393526, 1, 1, 1, 1, 1,
1.124209, -0.2206372, 2.193045, 1, 1, 1, 1, 1,
1.124224, -0.620181, 1.408712, 1, 1, 1, 1, 1,
1.130012, 0.7736252, 2.423979, 1, 1, 1, 1, 1,
1.130645, 0.8688267, 0.7752129, 1, 1, 1, 1, 1,
1.143642, 0.7692739, 2.591285, 0, 0, 1, 1, 1,
1.146299, 1.153704, 0.03865196, 1, 0, 0, 1, 1,
1.152288, 0.4548403, 2.423205, 1, 0, 0, 1, 1,
1.15594, -0.5204995, 2.498942, 1, 0, 0, 1, 1,
1.158388, 0.7948898, -0.4998654, 1, 0, 0, 1, 1,
1.162944, 0.6134257, 0.3113635, 1, 0, 0, 1, 1,
1.169467, 0.6614271, 0.2755125, 0, 0, 0, 1, 1,
1.170345, 0.8245382, -0.2727023, 0, 0, 0, 1, 1,
1.172975, 1.928864, -0.3971839, 0, 0, 0, 1, 1,
1.174058, -2.652005, 1.412751, 0, 0, 0, 1, 1,
1.179578, 0.908644, 2.276211, 0, 0, 0, 1, 1,
1.185785, 0.8312941, 1.541037, 0, 0, 0, 1, 1,
1.187811, 0.4822311, 2.495016, 0, 0, 0, 1, 1,
1.191328, -0.9374979, 0.5865119, 1, 1, 1, 1, 1,
1.197834, 1.226533, 0.7524528, 1, 1, 1, 1, 1,
1.197966, 0.301266, 1.101942, 1, 1, 1, 1, 1,
1.20933, 0.1647087, 0.9573402, 1, 1, 1, 1, 1,
1.216784, 0.4322278, 0.8918988, 1, 1, 1, 1, 1,
1.224462, 0.1343592, 3.035783, 1, 1, 1, 1, 1,
1.229345, 0.5515941, 1.283558, 1, 1, 1, 1, 1,
1.229771, 0.9131403, 0.1039945, 1, 1, 1, 1, 1,
1.236298, -0.3579681, 3.461359, 1, 1, 1, 1, 1,
1.243604, 0.5656209, 1.116746, 1, 1, 1, 1, 1,
1.244649, -0.5785804, 1.021598, 1, 1, 1, 1, 1,
1.265514, -1.064188, 3.178218, 1, 1, 1, 1, 1,
1.26696, 0.3131324, 1.917798, 1, 1, 1, 1, 1,
1.278965, 0.9621501, 1.934168, 1, 1, 1, 1, 1,
1.279429, 0.05045598, 1.270605, 1, 1, 1, 1, 1,
1.284885, -0.3868429, 1.933084, 0, 0, 1, 1, 1,
1.288798, -0.5168791, 3.343407, 1, 0, 0, 1, 1,
1.290386, -2.658336, 0.8087724, 1, 0, 0, 1, 1,
1.306156, 1.605658, -0.8833517, 1, 0, 0, 1, 1,
1.310758, 0.626648, -0.5998675, 1, 0, 0, 1, 1,
1.315211, -0.370811, 1.885617, 1, 0, 0, 1, 1,
1.32429, 0.5622449, 0.824586, 0, 0, 0, 1, 1,
1.331186, -0.4121064, 1.535677, 0, 0, 0, 1, 1,
1.33417, -1.768385, 1.993732, 0, 0, 0, 1, 1,
1.337352, -0.2890457, 2.830832, 0, 0, 0, 1, 1,
1.338216, 0.09153673, 1.999573, 0, 0, 0, 1, 1,
1.339172, 0.337757, 0.6148525, 0, 0, 0, 1, 1,
1.340333, 1.712008, 1.452062, 0, 0, 0, 1, 1,
1.346006, 0.9302686, 0.8202183, 1, 1, 1, 1, 1,
1.346502, 0.5055821, 0.8059456, 1, 1, 1, 1, 1,
1.351693, -1.223215, 1.031097, 1, 1, 1, 1, 1,
1.356604, 1.189351, -0.6837997, 1, 1, 1, 1, 1,
1.373179, -0.6195646, 1.212331, 1, 1, 1, 1, 1,
1.384412, 0.4426731, -0.5180709, 1, 1, 1, 1, 1,
1.386541, -0.7645085, 1.012254, 1, 1, 1, 1, 1,
1.391421, -0.9434821, 1.937447, 1, 1, 1, 1, 1,
1.394616, 0.8969465, 1.071546, 1, 1, 1, 1, 1,
1.406265, 1.931164, 1.750156, 1, 1, 1, 1, 1,
1.416275, 1.239593, 0.639908, 1, 1, 1, 1, 1,
1.43604, 1.806378, -0.9004869, 1, 1, 1, 1, 1,
1.450924, 1.890234, -0.0105511, 1, 1, 1, 1, 1,
1.453301, -0.2912863, 2.113819, 1, 1, 1, 1, 1,
1.454808, 0.6399744, -0.5960597, 1, 1, 1, 1, 1,
1.461687, 1.753288, 0.6192433, 0, 0, 1, 1, 1,
1.472846, 0.1497262, -0.2599344, 1, 0, 0, 1, 1,
1.488407, 0.02652975, -0.2351995, 1, 0, 0, 1, 1,
1.491951, -0.3284772, 2.986345, 1, 0, 0, 1, 1,
1.502389, -0.270537, 2.782556, 1, 0, 0, 1, 1,
1.503297, -1.369132, 1.907219, 1, 0, 0, 1, 1,
1.509613, 0.04931024, 1.300098, 0, 0, 0, 1, 1,
1.514227, -0.4264479, 3.692221, 0, 0, 0, 1, 1,
1.517973, -0.7778546, 2.845313, 0, 0, 0, 1, 1,
1.528572, -0.9216038, 0.35887, 0, 0, 0, 1, 1,
1.530631, -1.033095, 2.008258, 0, 0, 0, 1, 1,
1.535652, -0.6181352, 2.517511, 0, 0, 0, 1, 1,
1.541514, -0.09657525, 2.769478, 0, 0, 0, 1, 1,
1.557561, 1.670516, 1.2506, 1, 1, 1, 1, 1,
1.567045, 1.902429, -0.1100378, 1, 1, 1, 1, 1,
1.570962, 1.744816, -1.09013, 1, 1, 1, 1, 1,
1.572875, 0.3155659, 1.449844, 1, 1, 1, 1, 1,
1.573411, -1.103157, 0.6327145, 1, 1, 1, 1, 1,
1.620503, 1.039147, 0.009795447, 1, 1, 1, 1, 1,
1.629733, 1.770267, 0.4173356, 1, 1, 1, 1, 1,
1.640411, -1.448007, 1.50925, 1, 1, 1, 1, 1,
1.642082, -0.5796554, 3.201728, 1, 1, 1, 1, 1,
1.648162, -0.4750965, 1.998565, 1, 1, 1, 1, 1,
1.65507, -1.116436, 2.633894, 1, 1, 1, 1, 1,
1.655328, -2.265963, 2.781896, 1, 1, 1, 1, 1,
1.678161, 0.5852426, 0.418425, 1, 1, 1, 1, 1,
1.678657, -0.4832093, 2.388045, 1, 1, 1, 1, 1,
1.701536, -2.440207, 2.865155, 1, 1, 1, 1, 1,
1.727601, -0.5016048, 1.455631, 0, 0, 1, 1, 1,
1.729099, 0.2799901, 1.67667, 1, 0, 0, 1, 1,
1.744923, 0.9649296, 1.617725, 1, 0, 0, 1, 1,
1.773192, 1.188089, 2.431504, 1, 0, 0, 1, 1,
1.795722, -0.800307, 0.8840396, 1, 0, 0, 1, 1,
1.834229, 1.142677, -0.2362401, 1, 0, 0, 1, 1,
1.856202, 0.5845631, 0.9073966, 0, 0, 0, 1, 1,
1.857142, -0.1541598, 1.186743, 0, 0, 0, 1, 1,
1.860005, 1.157353, 2.81142, 0, 0, 0, 1, 1,
1.872814, -0.1860013, 1.941069, 0, 0, 0, 1, 1,
1.889576, -1.53891, 1.834186, 0, 0, 0, 1, 1,
1.899157, -0.09684855, 1.642684, 0, 0, 0, 1, 1,
1.902069, -0.01394061, 1.251678, 0, 0, 0, 1, 1,
1.939653, 0.1600253, 1.803, 1, 1, 1, 1, 1,
1.95323, -0.1123733, 3.710819, 1, 1, 1, 1, 1,
1.970166, 1.048257, 4.734077, 1, 1, 1, 1, 1,
1.972701, 0.8504203, 0.3074149, 1, 1, 1, 1, 1,
1.974062, -0.008099047, 2.382018, 1, 1, 1, 1, 1,
1.987192, 1.211306, 2.094937, 1, 1, 1, 1, 1,
1.987267, 0.9549269, -0.353865, 1, 1, 1, 1, 1,
1.994663, 1.001725, 0.7118582, 1, 1, 1, 1, 1,
2.000422, -0.5198731, 0.9976375, 1, 1, 1, 1, 1,
2.028685, -1.941038, 1.958848, 1, 1, 1, 1, 1,
2.050681, -0.4472133, 3.49535, 1, 1, 1, 1, 1,
2.054845, 0.2585341, 1.32738, 1, 1, 1, 1, 1,
2.065776, -0.2951687, 0.5194209, 1, 1, 1, 1, 1,
2.067575, 0.5181798, -1.008427, 1, 1, 1, 1, 1,
2.068204, 1.155351, 1.080177, 1, 1, 1, 1, 1,
2.068245, -0.9975756, 0.9938039, 0, 0, 1, 1, 1,
2.104506, -0.01071482, 2.101086, 1, 0, 0, 1, 1,
2.122266, -1.576585, 1.784678, 1, 0, 0, 1, 1,
2.146262, 0.3799009, -0.02472945, 1, 0, 0, 1, 1,
2.182216, -1.28589, 2.685343, 1, 0, 0, 1, 1,
2.209117, 1.080137, 1.699755, 1, 0, 0, 1, 1,
2.223386, 0.660323, 2.545288, 0, 0, 0, 1, 1,
2.236945, -0.6591246, 3.19798, 0, 0, 0, 1, 1,
2.280831, 0.985379, 1.311441, 0, 0, 0, 1, 1,
2.346501, 0.5945104, 3.401764, 0, 0, 0, 1, 1,
2.37058, 1.338732, 0.3663833, 0, 0, 0, 1, 1,
2.406784, -0.6351584, 2.850998, 0, 0, 0, 1, 1,
2.426629, -0.06726491, 3.315712, 0, 0, 0, 1, 1,
2.675063, 1.205772, 0.7445262, 1, 1, 1, 1, 1,
2.679586, -0.4700502, 1.807487, 1, 1, 1, 1, 1,
2.684672, -1.093737, 3.203808, 1, 1, 1, 1, 1,
2.718694, -0.2259045, 1.881664, 1, 1, 1, 1, 1,
2.870673, -0.8780574, 0.5753698, 1, 1, 1, 1, 1,
2.879472, 0.6327093, 1.494156, 1, 1, 1, 1, 1,
3.040833, 0.09090053, 1.550467, 1, 1, 1, 1, 1
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
var radius = 9.846172;
var distance = 34.58426;
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
mvMatrix.translate( -0.04232156, -0.3050703, -0.08991265 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.58426);
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
