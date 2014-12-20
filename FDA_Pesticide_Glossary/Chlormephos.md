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
-3.204408, -0.3906279, -0.9963682, 1, 0, 0, 1,
-3.023125, -0.1072164, -2.301734, 1, 0.007843138, 0, 1,
-2.729793, -0.7032451, -2.442597, 1, 0.01176471, 0, 1,
-2.598185, 0.9080409, -2.87555, 1, 0.01960784, 0, 1,
-2.534437, 0.4921848, -2.098297, 1, 0.02352941, 0, 1,
-2.502333, -1.675393, -1.935244, 1, 0.03137255, 0, 1,
-2.483257, 0.1856631, -0.4310697, 1, 0.03529412, 0, 1,
-2.452769, -1.25547, -2.938652, 1, 0.04313726, 0, 1,
-2.435543, 0.08341141, -1.795292, 1, 0.04705882, 0, 1,
-2.393067, 0.4453642, -2.138077, 1, 0.05490196, 0, 1,
-2.341206, 0.6522246, -1.394226, 1, 0.05882353, 0, 1,
-2.240505, -1.484309, -1.731682, 1, 0.06666667, 0, 1,
-2.218457, -0.6433318, -1.7352, 1, 0.07058824, 0, 1,
-2.202885, 0.03841605, -2.286137, 1, 0.07843138, 0, 1,
-2.097191, 0.5522531, -1.713188, 1, 0.08235294, 0, 1,
-2.076533, -0.7474099, -3.035752, 1, 0.09019608, 0, 1,
-2.047917, -0.661984, -2.677707, 1, 0.09411765, 0, 1,
-2.025382, -2.183961, -3.538878, 1, 0.1019608, 0, 1,
-2.020961, 0.1345274, -2.46649, 1, 0.1098039, 0, 1,
-2.017653, -0.01848172, -1.211425, 1, 0.1137255, 0, 1,
-2.009813, -0.104518, -2.789013, 1, 0.1215686, 0, 1,
-2.005897, -1.572542, -3.382248, 1, 0.1254902, 0, 1,
-1.937424, 0.09351027, -1.163942, 1, 0.1333333, 0, 1,
-1.920179, -1.810566, -3.958735, 1, 0.1372549, 0, 1,
-1.896538, 0.3646689, -1.162463, 1, 0.145098, 0, 1,
-1.896527, 0.1651684, -2.891314, 1, 0.1490196, 0, 1,
-1.894398, -0.639204, -1.224621, 1, 0.1568628, 0, 1,
-1.887711, 0.8893028, -0.9423483, 1, 0.1607843, 0, 1,
-1.886463, -1.243854, -1.99327, 1, 0.1686275, 0, 1,
-1.875948, -0.2615104, -3.571805, 1, 0.172549, 0, 1,
-1.838582, 0.8996844, -0.9717378, 1, 0.1803922, 0, 1,
-1.790333, -0.1660594, -2.618407, 1, 0.1843137, 0, 1,
-1.784897, 1.530329, -0.8595186, 1, 0.1921569, 0, 1,
-1.783431, -0.9943048, -0.4022232, 1, 0.1960784, 0, 1,
-1.783176, -0.28083, -2.81688, 1, 0.2039216, 0, 1,
-1.763701, -0.9476405, -0.2554875, 1, 0.2117647, 0, 1,
-1.743614, -0.3694535, -1.728747, 1, 0.2156863, 0, 1,
-1.733982, -0.0119886, -2.251052, 1, 0.2235294, 0, 1,
-1.727059, -1.340172, -2.265497, 1, 0.227451, 0, 1,
-1.724386, 1.983293, -1.694108, 1, 0.2352941, 0, 1,
-1.722882, 0.5465266, -1.07809, 1, 0.2392157, 0, 1,
-1.702013, 0.9086369, -0.6601205, 1, 0.2470588, 0, 1,
-1.69779, -0.6279221, -0.75503, 1, 0.2509804, 0, 1,
-1.678052, -1.560255, -1.425823, 1, 0.2588235, 0, 1,
-1.665631, 1.738198, -1.672662, 1, 0.2627451, 0, 1,
-1.658458, -0.2875207, -2.053936, 1, 0.2705882, 0, 1,
-1.645799, -0.9199308, -0.09569958, 1, 0.2745098, 0, 1,
-1.636562, -0.6435351, -3.089854, 1, 0.282353, 0, 1,
-1.595504, -0.6617442, -1.892115, 1, 0.2862745, 0, 1,
-1.577, -0.6306068, -0.597765, 1, 0.2941177, 0, 1,
-1.575489, 0.8758115, -1.037731, 1, 0.3019608, 0, 1,
-1.569691, -0.7712553, -1.053144, 1, 0.3058824, 0, 1,
-1.569156, -0.5990653, -2.409594, 1, 0.3137255, 0, 1,
-1.568388, -2.238177, -2.355142, 1, 0.3176471, 0, 1,
-1.562794, 0.431115, -0.964628, 1, 0.3254902, 0, 1,
-1.559147, -1.718585, -3.430481, 1, 0.3294118, 0, 1,
-1.546355, -1.532753, -1.515901, 1, 0.3372549, 0, 1,
-1.544866, 0.2953259, -1.901211, 1, 0.3411765, 0, 1,
-1.524693, -0.6589246, -1.97923, 1, 0.3490196, 0, 1,
-1.52281, -1.150276, -2.717855, 1, 0.3529412, 0, 1,
-1.514565, -0.149452, -0.8448023, 1, 0.3607843, 0, 1,
-1.503127, 0.5697623, -2.886482, 1, 0.3647059, 0, 1,
-1.494034, 0.6468022, -0.9387867, 1, 0.372549, 0, 1,
-1.4856, 0.9439276, -1.247582, 1, 0.3764706, 0, 1,
-1.484273, 0.2198528, 0.7620921, 1, 0.3843137, 0, 1,
-1.484069, 0.66966, -1.115147, 1, 0.3882353, 0, 1,
-1.48113, 1.351584, 0.3847593, 1, 0.3960784, 0, 1,
-1.463619, 0.3068773, 0.06774936, 1, 0.4039216, 0, 1,
-1.45998, 1.425412, -1.828973, 1, 0.4078431, 0, 1,
-1.448232, 0.6327741, -1.221649, 1, 0.4156863, 0, 1,
-1.43697, -1.042009, -1.428044, 1, 0.4196078, 0, 1,
-1.428662, 0.681461, -2.213586, 1, 0.427451, 0, 1,
-1.423993, -1.08506, -0.630376, 1, 0.4313726, 0, 1,
-1.420239, 0.4106328, -3.948186, 1, 0.4392157, 0, 1,
-1.417989, 1.400101, -1.932892, 1, 0.4431373, 0, 1,
-1.405199, 1.675813, -1.976924, 1, 0.4509804, 0, 1,
-1.399482, -1.657259, -2.92948, 1, 0.454902, 0, 1,
-1.39662, -0.633144, -1.148681, 1, 0.4627451, 0, 1,
-1.380219, 1.612046, 0.5170804, 1, 0.4666667, 0, 1,
-1.373041, 0.02277317, -3.087318, 1, 0.4745098, 0, 1,
-1.368304, 3.323169, 0.7399752, 1, 0.4784314, 0, 1,
-1.363174, -0.7324634, -2.647469, 1, 0.4862745, 0, 1,
-1.363036, -0.1879427, -1.852165, 1, 0.4901961, 0, 1,
-1.351907, -0.2743486, -0.7535733, 1, 0.4980392, 0, 1,
-1.340676, -0.2925205, -3.023, 1, 0.5058824, 0, 1,
-1.334683, -0.7292534, -1.883572, 1, 0.509804, 0, 1,
-1.32998, 0.3370388, -1.442487, 1, 0.5176471, 0, 1,
-1.321094, 0.8554421, -1.999747, 1, 0.5215687, 0, 1,
-1.301318, 0.2175193, -2.435849, 1, 0.5294118, 0, 1,
-1.299466, -0.1197885, 0.1720941, 1, 0.5333334, 0, 1,
-1.298782, 1.162235, -0.4115934, 1, 0.5411765, 0, 1,
-1.293518, 0.3083988, -1.290476, 1, 0.5450981, 0, 1,
-1.291919, -1.217326, -2.413872, 1, 0.5529412, 0, 1,
-1.284625, -1.276023, -2.514935, 1, 0.5568628, 0, 1,
-1.278438, 0.7300966, -0.8661891, 1, 0.5647059, 0, 1,
-1.276942, 0.3820619, -0.02478315, 1, 0.5686275, 0, 1,
-1.269293, 0.1532875, -1.536173, 1, 0.5764706, 0, 1,
-1.25393, -1.858282, -1.606091, 1, 0.5803922, 0, 1,
-1.241011, -0.02637265, -0.2256169, 1, 0.5882353, 0, 1,
-1.23914, -0.2275593, -2.618172, 1, 0.5921569, 0, 1,
-1.228993, -1.151677, -1.897191, 1, 0.6, 0, 1,
-1.221032, -0.9301533, -2.678003, 1, 0.6078432, 0, 1,
-1.211265, -1.135206, -3.597877, 1, 0.6117647, 0, 1,
-1.202211, -0.002830241, -2.906517, 1, 0.6196079, 0, 1,
-1.195893, -0.2138897, -1.212557, 1, 0.6235294, 0, 1,
-1.19479, 2.088499, -0.1882093, 1, 0.6313726, 0, 1,
-1.189737, 1.714217, 0.5972573, 1, 0.6352941, 0, 1,
-1.185659, 1.487869, -1.314655, 1, 0.6431373, 0, 1,
-1.181967, -1.533485, -1.956699, 1, 0.6470588, 0, 1,
-1.18149, 0.797663, -2.663074, 1, 0.654902, 0, 1,
-1.178787, 0.3079601, -2.270801, 1, 0.6588235, 0, 1,
-1.168733, -1.909752, -1.063369, 1, 0.6666667, 0, 1,
-1.149921, 0.1200841, -3.101925, 1, 0.6705883, 0, 1,
-1.149773, -0.6599371, -2.115274, 1, 0.6784314, 0, 1,
-1.1422, 0.7474849, 0.8757598, 1, 0.682353, 0, 1,
-1.139138, 0.1848553, 0.388228, 1, 0.6901961, 0, 1,
-1.138334, -0.7346181, -5.325824, 1, 0.6941177, 0, 1,
-1.128597, 0.6932521, 0.009232577, 1, 0.7019608, 0, 1,
-1.125829, 1.385188, -0.2091514, 1, 0.7098039, 0, 1,
-1.125299, 0.9906981, -2.124103, 1, 0.7137255, 0, 1,
-1.124529, 1.272839, -1.190142, 1, 0.7215686, 0, 1,
-1.124414, -0.6413974, -1.836553, 1, 0.7254902, 0, 1,
-1.124406, -1.301138, -2.50943, 1, 0.7333333, 0, 1,
-1.118139, 2.755031, -0.7079519, 1, 0.7372549, 0, 1,
-1.117775, -0.2043329, -1.310867, 1, 0.7450981, 0, 1,
-1.110582, 0.339969, -2.365607, 1, 0.7490196, 0, 1,
-1.104671, -0.5111018, -1.625312, 1, 0.7568628, 0, 1,
-1.101936, -0.6540463, -1.339418, 1, 0.7607843, 0, 1,
-1.095115, -0.3139887, -0.4969057, 1, 0.7686275, 0, 1,
-1.094749, -1.176183, -1.352199, 1, 0.772549, 0, 1,
-1.090031, -0.2745044, -1.223215, 1, 0.7803922, 0, 1,
-1.084777, 0.07473803, -2.243998, 1, 0.7843137, 0, 1,
-1.079706, -0.8551134, -2.443391, 1, 0.7921569, 0, 1,
-1.072431, -0.6079468, -4.015662, 1, 0.7960784, 0, 1,
-1.068284, 0.3764888, -0.7189685, 1, 0.8039216, 0, 1,
-1.055554, 0.7316627, -2.104298, 1, 0.8117647, 0, 1,
-1.048039, -0.2189155, -1.970789, 1, 0.8156863, 0, 1,
-1.047022, -0.4512065, -4.257105, 1, 0.8235294, 0, 1,
-1.043367, 0.6263334, -0.8122118, 1, 0.827451, 0, 1,
-1.041847, -2.057744, -2.91651, 1, 0.8352941, 0, 1,
-1.041329, 0.06805861, -1.616908, 1, 0.8392157, 0, 1,
-1.040486, -0.7251307, -1.431326, 1, 0.8470588, 0, 1,
-1.03621, 0.5424505, -0.6656533, 1, 0.8509804, 0, 1,
-1.035812, 0.07414726, -2.503028, 1, 0.8588235, 0, 1,
-1.020731, 1.888898, 0.3052575, 1, 0.8627451, 0, 1,
-1.019287, 1.319257, -0.08459556, 1, 0.8705882, 0, 1,
-1.018901, 0.637121, -0.9696705, 1, 0.8745098, 0, 1,
-1.016905, 0.2597488, -0.984565, 1, 0.8823529, 0, 1,
-1.015029, -0.2952056, -2.5468, 1, 0.8862745, 0, 1,
-1.011931, 1.543756, -0.5167857, 1, 0.8941177, 0, 1,
-1.008043, 0.2813742, -0.2093214, 1, 0.8980392, 0, 1,
-1.006161, -0.1317144, -0.4010095, 1, 0.9058824, 0, 1,
-0.9989555, -1.936631, -1.872843, 1, 0.9137255, 0, 1,
-0.9963057, -0.6141673, -2.45261, 1, 0.9176471, 0, 1,
-0.9878134, 1.218063, 0.3004149, 1, 0.9254902, 0, 1,
-0.9873378, -0.9052131, -2.555754, 1, 0.9294118, 0, 1,
-0.9829699, 0.6340727, 1.181683, 1, 0.9372549, 0, 1,
-0.981768, 1.875528, -0.4684075, 1, 0.9411765, 0, 1,
-0.974225, -0.3104305, -2.625241, 1, 0.9490196, 0, 1,
-0.9730944, -1.887328, -2.965652, 1, 0.9529412, 0, 1,
-0.9728426, -1.255191, -1.506626, 1, 0.9607843, 0, 1,
-0.9647927, 0.3902079, -1.477045, 1, 0.9647059, 0, 1,
-0.9585775, -0.02458443, -2.010929, 1, 0.972549, 0, 1,
-0.9569889, 0.1918495, -0.4573127, 1, 0.9764706, 0, 1,
-0.9552669, 0.6526605, -0.1900058, 1, 0.9843137, 0, 1,
-0.954611, -1.245495, -1.409669, 1, 0.9882353, 0, 1,
-0.9530016, -1.352922, -1.530333, 1, 0.9960784, 0, 1,
-0.9516781, 0.4996101, 0.04463881, 0.9960784, 1, 0, 1,
-0.9479488, -1.664659, -3.202263, 0.9921569, 1, 0, 1,
-0.9474157, -0.01324403, -2.272208, 0.9843137, 1, 0, 1,
-0.9460507, 1.53605, -0.6865207, 0.9803922, 1, 0, 1,
-0.9421694, 0.05443018, -1.861549, 0.972549, 1, 0, 1,
-0.9410378, -1.132221, -2.738624, 0.9686275, 1, 0, 1,
-0.9404365, 0.4626398, -1.75517, 0.9607843, 1, 0, 1,
-0.9247177, -1.029642, -3.030532, 0.9568627, 1, 0, 1,
-0.9228549, 0.2851776, 1.732143, 0.9490196, 1, 0, 1,
-0.9217291, 0.7087172, -0.6887643, 0.945098, 1, 0, 1,
-0.9118488, -0.06384634, -1.857925, 0.9372549, 1, 0, 1,
-0.9035453, -0.7547053, -2.398085, 0.9333333, 1, 0, 1,
-0.9028537, 0.593642, -2.115101, 0.9254902, 1, 0, 1,
-0.8934637, -0.7513304, -2.221745, 0.9215686, 1, 0, 1,
-0.8877931, -0.480572, -2.235171, 0.9137255, 1, 0, 1,
-0.8807618, -1.129586, -1.882862, 0.9098039, 1, 0, 1,
-0.8802519, -0.1037104, -1.827193, 0.9019608, 1, 0, 1,
-0.8785657, 1.381743, -0.1968653, 0.8941177, 1, 0, 1,
-0.8663889, 0.3317899, -2.536153, 0.8901961, 1, 0, 1,
-0.8629658, -2.040461, -1.574891, 0.8823529, 1, 0, 1,
-0.8586568, -0.281792, -2.724832, 0.8784314, 1, 0, 1,
-0.8544616, -0.301459, -4.17082, 0.8705882, 1, 0, 1,
-0.8491592, 0.6983091, -0.6409012, 0.8666667, 1, 0, 1,
-0.8489116, 0.6182913, -0.3645564, 0.8588235, 1, 0, 1,
-0.8423793, -0.8191391, -2.412394, 0.854902, 1, 0, 1,
-0.8350145, 1.302791, -0.2898321, 0.8470588, 1, 0, 1,
-0.8284052, 0.8882089, -0.4743349, 0.8431373, 1, 0, 1,
-0.8216494, 0.4484048, -1.270203, 0.8352941, 1, 0, 1,
-0.814527, -0.426547, -3.101624, 0.8313726, 1, 0, 1,
-0.811947, -0.7849208, -1.969224, 0.8235294, 1, 0, 1,
-0.8054995, -0.6539717, -0.9267302, 0.8196079, 1, 0, 1,
-0.8033474, -0.06650329, -0.9955421, 0.8117647, 1, 0, 1,
-0.798943, 0.3110433, -0.768936, 0.8078431, 1, 0, 1,
-0.7987425, 0.4868535, 0.08860371, 0.8, 1, 0, 1,
-0.7955669, -1.193596, -2.080108, 0.7921569, 1, 0, 1,
-0.7929896, 0.04478764, 0.284226, 0.7882353, 1, 0, 1,
-0.7865084, -0.3873135, -2.479581, 0.7803922, 1, 0, 1,
-0.7840916, 0.09843794, -1.487258, 0.7764706, 1, 0, 1,
-0.7828525, -0.08200752, 0.433605, 0.7686275, 1, 0, 1,
-0.7785825, -1.077523, -2.202189, 0.7647059, 1, 0, 1,
-0.7781739, -2.156773, -1.401706, 0.7568628, 1, 0, 1,
-0.7681968, 1.114545, -0.6335505, 0.7529412, 1, 0, 1,
-0.7657548, -0.3923588, -1.281471, 0.7450981, 1, 0, 1,
-0.7583308, -0.4000193, -1.749665, 0.7411765, 1, 0, 1,
-0.7564377, 0.630879, 0.2341383, 0.7333333, 1, 0, 1,
-0.7519402, -0.5964341, -1.672565, 0.7294118, 1, 0, 1,
-0.7508385, -0.2010773, -2.574731, 0.7215686, 1, 0, 1,
-0.7503328, 0.2003299, -1.430856, 0.7176471, 1, 0, 1,
-0.7365489, -0.9284136, -2.284992, 0.7098039, 1, 0, 1,
-0.7330377, 1.264648, -1.104472, 0.7058824, 1, 0, 1,
-0.7329494, -0.02709921, -2.38035, 0.6980392, 1, 0, 1,
-0.7266255, -1.36198, -2.591765, 0.6901961, 1, 0, 1,
-0.7234302, 0.1962037, -0.105854, 0.6862745, 1, 0, 1,
-0.7224486, 0.5622414, -0.08424677, 0.6784314, 1, 0, 1,
-0.7212303, 0.7986891, -1.388001, 0.6745098, 1, 0, 1,
-0.711364, -0.7450114, -4.44931, 0.6666667, 1, 0, 1,
-0.7113189, 1.197971, -2.061847, 0.6627451, 1, 0, 1,
-0.7057645, 1.642808, -2.280088, 0.654902, 1, 0, 1,
-0.7045797, -0.446804, -1.817361, 0.6509804, 1, 0, 1,
-0.7020229, -1.106351, -2.944382, 0.6431373, 1, 0, 1,
-0.6972144, -0.1473172, -0.6566122, 0.6392157, 1, 0, 1,
-0.6941727, 1.184129, -1.446579, 0.6313726, 1, 0, 1,
-0.6927304, -0.08297009, -0.7101916, 0.627451, 1, 0, 1,
-0.6923929, 0.5893826, 0.3116181, 0.6196079, 1, 0, 1,
-0.6885916, -1.545521, -2.783517, 0.6156863, 1, 0, 1,
-0.6862655, 1.048619, -0.4625648, 0.6078432, 1, 0, 1,
-0.6860358, -0.09712381, -0.5697361, 0.6039216, 1, 0, 1,
-0.6826858, 0.1731989, -2.880965, 0.5960785, 1, 0, 1,
-0.6823372, 1.696398, -1.028556, 0.5882353, 1, 0, 1,
-0.6816661, -0.04992316, -1.477925, 0.5843138, 1, 0, 1,
-0.665346, 1.291621, 1.524374, 0.5764706, 1, 0, 1,
-0.6630111, -0.2937612, -0.9768562, 0.572549, 1, 0, 1,
-0.6610516, 0.1382537, -0.1810909, 0.5647059, 1, 0, 1,
-0.6606709, 0.2630348, -2.695302, 0.5607843, 1, 0, 1,
-0.6599373, 0.09839743, -3.146401, 0.5529412, 1, 0, 1,
-0.6507583, -2.093495, -1.892008, 0.5490196, 1, 0, 1,
-0.6507007, -0.9447432, -2.048844, 0.5411765, 1, 0, 1,
-0.6493506, -0.480924, -2.566867, 0.5372549, 1, 0, 1,
-0.6476507, -1.090726, -2.369691, 0.5294118, 1, 0, 1,
-0.6472225, 0.07057472, -1.590487, 0.5254902, 1, 0, 1,
-0.6458765, -1.635106, -1.843726, 0.5176471, 1, 0, 1,
-0.6457462, -0.2354625, -3.212113, 0.5137255, 1, 0, 1,
-0.6436109, -0.5949124, -1.947424, 0.5058824, 1, 0, 1,
-0.6414005, 0.6037267, -1.255811, 0.5019608, 1, 0, 1,
-0.6384743, 1.194435, -1.027176, 0.4941176, 1, 0, 1,
-0.6379957, 0.6637648, -1.952439, 0.4862745, 1, 0, 1,
-0.6351975, 0.7373235, -1.632971, 0.4823529, 1, 0, 1,
-0.6333932, -0.2867739, -2.08759, 0.4745098, 1, 0, 1,
-0.6320373, 2.922773, 0.2117721, 0.4705882, 1, 0, 1,
-0.6309913, 1.083374, 0.4958293, 0.4627451, 1, 0, 1,
-0.6261048, -1.253999, -4.302659, 0.4588235, 1, 0, 1,
-0.6260083, 0.3494377, -1.744158, 0.4509804, 1, 0, 1,
-0.625509, -0.1668234, -2.376533, 0.4470588, 1, 0, 1,
-0.6242542, -0.01890996, -0.5661056, 0.4392157, 1, 0, 1,
-0.6227955, 0.5379252, -0.9370056, 0.4352941, 1, 0, 1,
-0.6198784, -0.4098088, -2.316056, 0.427451, 1, 0, 1,
-0.6127132, -1.472705, -4.12471, 0.4235294, 1, 0, 1,
-0.6118062, 0.0631031, -2.217046, 0.4156863, 1, 0, 1,
-0.6085455, -0.4185209, -3.037698, 0.4117647, 1, 0, 1,
-0.6074944, 0.5134601, -1.219785, 0.4039216, 1, 0, 1,
-0.6062025, 0.2531338, -2.761088, 0.3960784, 1, 0, 1,
-0.6020299, -1.666409, -2.037058, 0.3921569, 1, 0, 1,
-0.5978476, -0.5863287, -1.132978, 0.3843137, 1, 0, 1,
-0.5949058, -2.174611, -2.198581, 0.3803922, 1, 0, 1,
-0.5885316, -0.240201, -2.159057, 0.372549, 1, 0, 1,
-0.5851066, 0.4762862, -1.671308, 0.3686275, 1, 0, 1,
-0.5850289, 0.3299955, -0.2607181, 0.3607843, 1, 0, 1,
-0.5848761, 0.3442433, -0.03634952, 0.3568628, 1, 0, 1,
-0.584268, 0.7917454, -1.038878, 0.3490196, 1, 0, 1,
-0.58348, 1.056715, -0.5215595, 0.345098, 1, 0, 1,
-0.5820971, 0.06032935, -0.1428487, 0.3372549, 1, 0, 1,
-0.5755808, 0.149277, -1.059248, 0.3333333, 1, 0, 1,
-0.572951, -1.565556, -3.824332, 0.3254902, 1, 0, 1,
-0.5722389, -1.190467, -3.172157, 0.3215686, 1, 0, 1,
-0.5701333, 0.5760852, 0.1226068, 0.3137255, 1, 0, 1,
-0.5681986, -0.2844796, -0.7456767, 0.3098039, 1, 0, 1,
-0.5680851, -0.8444951, -2.568213, 0.3019608, 1, 0, 1,
-0.5676523, -1.354473, -3.307964, 0.2941177, 1, 0, 1,
-0.5667138, -1.373379, -4.005741, 0.2901961, 1, 0, 1,
-0.5645607, 1.446159, -0.1984202, 0.282353, 1, 0, 1,
-0.5547724, 1.624664, 1.004772, 0.2784314, 1, 0, 1,
-0.5539646, 0.7678938, -1.825215, 0.2705882, 1, 0, 1,
-0.5518823, -1.378165, -2.404329, 0.2666667, 1, 0, 1,
-0.5512106, -0.8517949, -1.37233, 0.2588235, 1, 0, 1,
-0.5495307, 1.088014, -0.9993318, 0.254902, 1, 0, 1,
-0.546445, -0.01981127, -1.126033, 0.2470588, 1, 0, 1,
-0.5440482, -0.820786, -2.870274, 0.2431373, 1, 0, 1,
-0.5440136, 1.25814, -0.7961288, 0.2352941, 1, 0, 1,
-0.5217677, -0.231087, -1.496436, 0.2313726, 1, 0, 1,
-0.5212519, -0.5606623, -1.223213, 0.2235294, 1, 0, 1,
-0.5196208, -0.1878849, -3.988288, 0.2196078, 1, 0, 1,
-0.5184143, 0.761646, -0.6328812, 0.2117647, 1, 0, 1,
-0.5136151, 1.072782, -0.587894, 0.2078431, 1, 0, 1,
-0.5132831, 0.09644631, -1.15307, 0.2, 1, 0, 1,
-0.5125725, -0.4090014, -0.7787414, 0.1921569, 1, 0, 1,
-0.5071383, -0.3154128, -2.292402, 0.1882353, 1, 0, 1,
-0.505249, 0.4379981, -1.654636, 0.1803922, 1, 0, 1,
-0.5045741, 1.011294, -0.8794318, 0.1764706, 1, 0, 1,
-0.5003451, 1.746037, -1.002254, 0.1686275, 1, 0, 1,
-0.4933684, -0.3805178, -0.7518395, 0.1647059, 1, 0, 1,
-0.4879828, 0.3713432, 0.1966122, 0.1568628, 1, 0, 1,
-0.4858842, -2.12817, -1.854358, 0.1529412, 1, 0, 1,
-0.4836224, -1.243581, -1.518994, 0.145098, 1, 0, 1,
-0.4828057, -0.2156837, -2.810629, 0.1411765, 1, 0, 1,
-0.4795596, -0.3112108, -1.351277, 0.1333333, 1, 0, 1,
-0.4733565, -0.7498263, -2.277677, 0.1294118, 1, 0, 1,
-0.4713397, 0.8982893, -0.699714, 0.1215686, 1, 0, 1,
-0.469398, -0.4451672, -1.255526, 0.1176471, 1, 0, 1,
-0.4670865, 0.9699398, 0.5669586, 0.1098039, 1, 0, 1,
-0.4629856, 0.04736172, -2.750629, 0.1058824, 1, 0, 1,
-0.4599316, -0.3149981, -1.849496, 0.09803922, 1, 0, 1,
-0.4582045, -0.009446823, -2.177505, 0.09019608, 1, 0, 1,
-0.4581203, -0.6691874, -2.687744, 0.08627451, 1, 0, 1,
-0.4521926, -0.2598665, -2.887272, 0.07843138, 1, 0, 1,
-0.4520625, 1.703724, -0.7256986, 0.07450981, 1, 0, 1,
-0.4497883, 0.5805208, -2.147746, 0.06666667, 1, 0, 1,
-0.4481375, 0.06832239, -2.14065, 0.0627451, 1, 0, 1,
-0.4479809, 0.4108475, 1.177839, 0.05490196, 1, 0, 1,
-0.447074, 0.1768782, -0.9004986, 0.05098039, 1, 0, 1,
-0.4455386, -0.523629, -0.6087129, 0.04313726, 1, 0, 1,
-0.4412746, -0.8382216, -2.191162, 0.03921569, 1, 0, 1,
-0.4407569, -0.08076275, -1.683804, 0.03137255, 1, 0, 1,
-0.4353298, 0.02465901, -1.308807, 0.02745098, 1, 0, 1,
-0.4350912, -0.4174813, -1.733834, 0.01960784, 1, 0, 1,
-0.4337299, -0.9366409, -2.138894, 0.01568628, 1, 0, 1,
-0.4321362, -0.2018404, 0.166423, 0.007843138, 1, 0, 1,
-0.4296004, -0.03096353, -2.417201, 0.003921569, 1, 0, 1,
-0.4288408, -0.1055112, -3.1644, 0, 1, 0.003921569, 1,
-0.4268878, 1.379278, -0.5365078, 0, 1, 0.01176471, 1,
-0.4252682, -1.390654, -4.123112, 0, 1, 0.01568628, 1,
-0.4220392, -0.4457026, -2.117529, 0, 1, 0.02352941, 1,
-0.4172747, -0.5255957, -1.316024, 0, 1, 0.02745098, 1,
-0.4156033, -1.505569, -2.272663, 0, 1, 0.03529412, 1,
-0.4149674, 0.1264526, -1.525777, 0, 1, 0.03921569, 1,
-0.4143105, -0.3491287, -1.64444, 0, 1, 0.04705882, 1,
-0.4113476, 1.068604, -0.4651771, 0, 1, 0.05098039, 1,
-0.4106628, -0.4888187, -3.91999, 0, 1, 0.05882353, 1,
-0.4056004, -1.238088, -5.255875, 0, 1, 0.0627451, 1,
-0.4005342, -0.8059657, -3.662198, 0, 1, 0.07058824, 1,
-0.4004808, -1.016365, -3.995116, 0, 1, 0.07450981, 1,
-0.3958612, -0.2330316, -1.864617, 0, 1, 0.08235294, 1,
-0.3888084, 1.829989, -1.415096, 0, 1, 0.08627451, 1,
-0.3808894, 0.2013779, -1.206554, 0, 1, 0.09411765, 1,
-0.3806784, -0.4455809, -2.139182, 0, 1, 0.1019608, 1,
-0.3805195, -2.115894, -4.269287, 0, 1, 0.1058824, 1,
-0.3775518, 0.4213849, 1.389437, 0, 1, 0.1137255, 1,
-0.372543, -0.3181454, -2.359083, 0, 1, 0.1176471, 1,
-0.3695219, -0.3021616, -1.980292, 0, 1, 0.1254902, 1,
-0.3621056, -0.207075, -2.35329, 0, 1, 0.1294118, 1,
-0.3604724, 0.08258858, -1.225887, 0, 1, 0.1372549, 1,
-0.358926, -0.08127964, -1.260111, 0, 1, 0.1411765, 1,
-0.3588302, 1.781365, -0.09348121, 0, 1, 0.1490196, 1,
-0.3581518, -1.689106, -1.592853, 0, 1, 0.1529412, 1,
-0.3545208, -0.02714787, -1.582715, 0, 1, 0.1607843, 1,
-0.3529269, -1.417009, -1.652343, 0, 1, 0.1647059, 1,
-0.3503879, -0.1620593, -0.414614, 0, 1, 0.172549, 1,
-0.3498226, 1.353568, -0.9560154, 0, 1, 0.1764706, 1,
-0.3442583, 0.3402252, -1.950776, 0, 1, 0.1843137, 1,
-0.3358712, -0.4040692, -1.313679, 0, 1, 0.1882353, 1,
-0.3332829, 0.7369843, -0.3565523, 0, 1, 0.1960784, 1,
-0.3325099, 1.431672, -0.5743536, 0, 1, 0.2039216, 1,
-0.3317457, -0.9948053, -2.747833, 0, 1, 0.2078431, 1,
-0.3313308, 1.405786, 0.3037979, 0, 1, 0.2156863, 1,
-0.3272024, -1.432541, -1.718992, 0, 1, 0.2196078, 1,
-0.3227099, -1.678747, -2.313329, 0, 1, 0.227451, 1,
-0.32055, 0.4552464, 0.3740467, 0, 1, 0.2313726, 1,
-0.3199591, -1.128506, -4.522583, 0, 1, 0.2392157, 1,
-0.3153247, 1.867855, -0.1810991, 0, 1, 0.2431373, 1,
-0.3097889, -1.271218, -2.141134, 0, 1, 0.2509804, 1,
-0.3047092, 0.346464, -0.6900069, 0, 1, 0.254902, 1,
-0.304257, -0.3640901, -2.349222, 0, 1, 0.2627451, 1,
-0.2971235, 1.698664, 0.7205259, 0, 1, 0.2666667, 1,
-0.2940647, 1.475015, -0.7836283, 0, 1, 0.2745098, 1,
-0.2922839, 0.864941, -0.5505092, 0, 1, 0.2784314, 1,
-0.2916075, 0.09039278, -1.280881, 0, 1, 0.2862745, 1,
-0.2914562, -0.610674, -2.227698, 0, 1, 0.2901961, 1,
-0.2912311, 0.6667018, -4.683704, 0, 1, 0.2980392, 1,
-0.290706, -0.4958827, -3.443123, 0, 1, 0.3058824, 1,
-0.2818339, -0.01055603, -1.520125, 0, 1, 0.3098039, 1,
-0.2811597, 1.594288, -1.621868, 0, 1, 0.3176471, 1,
-0.2757561, 0.4295803, -0.86207, 0, 1, 0.3215686, 1,
-0.2706063, -1.50369, -3.494339, 0, 1, 0.3294118, 1,
-0.2671663, -0.3652912, -3.781978, 0, 1, 0.3333333, 1,
-0.2640408, -0.05455093, -0.5939268, 0, 1, 0.3411765, 1,
-0.2617, -1.028951, -2.762642, 0, 1, 0.345098, 1,
-0.2603522, -1.08977, -3.235458, 0, 1, 0.3529412, 1,
-0.259543, 2.062257, 1.277241, 0, 1, 0.3568628, 1,
-0.2591508, 0.7110592, 0.629152, 0, 1, 0.3647059, 1,
-0.2574622, 1.1362, -0.1121015, 0, 1, 0.3686275, 1,
-0.2571668, 0.1354728, -1.301475, 0, 1, 0.3764706, 1,
-0.2570484, 2.014591, -0.2299605, 0, 1, 0.3803922, 1,
-0.2531801, 1.119435, 0.9674433, 0, 1, 0.3882353, 1,
-0.249269, 0.2727281, -3.806413, 0, 1, 0.3921569, 1,
-0.2449693, -0.230759, -1.443609, 0, 1, 0.4, 1,
-0.2416109, -1.025266, -2.001583, 0, 1, 0.4078431, 1,
-0.2401455, -0.9876701, -2.162634, 0, 1, 0.4117647, 1,
-0.2338102, -0.6102216, -3.462918, 0, 1, 0.4196078, 1,
-0.2295044, 0.4301175, -0.5914498, 0, 1, 0.4235294, 1,
-0.2221541, 0.3845357, -0.1895223, 0, 1, 0.4313726, 1,
-0.2125031, 0.4870425, 1.350793, 0, 1, 0.4352941, 1,
-0.2062492, -1.089079, -1.742312, 0, 1, 0.4431373, 1,
-0.2017461, -0.3995349, -4.041526, 0, 1, 0.4470588, 1,
-0.200053, 1.247872, 0.7847318, 0, 1, 0.454902, 1,
-0.1998215, -0.4732195, -3.584867, 0, 1, 0.4588235, 1,
-0.1933742, -0.1902339, -1.325799, 0, 1, 0.4666667, 1,
-0.193165, -1.201115, -1.78828, 0, 1, 0.4705882, 1,
-0.1879374, 0.6050347, 1.269888, 0, 1, 0.4784314, 1,
-0.18357, 1.519274, -0.04915401, 0, 1, 0.4823529, 1,
-0.1834819, -0.9724634, -2.757136, 0, 1, 0.4901961, 1,
-0.1821034, -1.038485, -2.443087, 0, 1, 0.4941176, 1,
-0.1818334, -0.05773138, -3.430241, 0, 1, 0.5019608, 1,
-0.1809531, 0.3094217, -0.09811933, 0, 1, 0.509804, 1,
-0.1733141, 1.482671, 1.000615, 0, 1, 0.5137255, 1,
-0.1714827, 1.971721, -0.7317515, 0, 1, 0.5215687, 1,
-0.168368, 0.2783305, 0.2417764, 0, 1, 0.5254902, 1,
-0.1660247, 0.5857407, -0.2844658, 0, 1, 0.5333334, 1,
-0.1648585, -0.8233851, -3.270372, 0, 1, 0.5372549, 1,
-0.16376, 0.2417993, 0.008214025, 0, 1, 0.5450981, 1,
-0.1631622, 1.715205, -1.451059, 0, 1, 0.5490196, 1,
-0.160845, 0.7054697, 0.6132601, 0, 1, 0.5568628, 1,
-0.1607792, 0.298509, 1.057028, 0, 1, 0.5607843, 1,
-0.1587484, -0.2198336, -2.864837, 0, 1, 0.5686275, 1,
-0.1572354, 0.03908589, -0.901064, 0, 1, 0.572549, 1,
-0.1562427, 0.1747244, -2.076406, 0, 1, 0.5803922, 1,
-0.1523376, -0.4541488, -3.71187, 0, 1, 0.5843138, 1,
-0.1507357, 0.6826258, -1.137843, 0, 1, 0.5921569, 1,
-0.1412837, 0.4780404, -2.007556, 0, 1, 0.5960785, 1,
-0.1407219, -0.8407974, -2.89957, 0, 1, 0.6039216, 1,
-0.1387925, 0.04987092, -1.995144, 0, 1, 0.6117647, 1,
-0.1387047, -1.351806, -1.601815, 0, 1, 0.6156863, 1,
-0.1369098, -0.2791381, -2.710051, 0, 1, 0.6235294, 1,
-0.1359092, 0.4059128, 0.4866399, 0, 1, 0.627451, 1,
-0.1355042, -0.4856384, -1.661652, 0, 1, 0.6352941, 1,
-0.132298, 0.3162998, -0.5000467, 0, 1, 0.6392157, 1,
-0.1174271, -0.3046149, -3.810524, 0, 1, 0.6470588, 1,
-0.1142495, 0.1679645, 0.005302168, 0, 1, 0.6509804, 1,
-0.1121812, -1.832666, -4.189874, 0, 1, 0.6588235, 1,
-0.1120035, 0.5081894, 0.9366397, 0, 1, 0.6627451, 1,
-0.110239, -0.3317335, -2.99874, 0, 1, 0.6705883, 1,
-0.1038654, 0.3798269, 0.5519043, 0, 1, 0.6745098, 1,
-0.1026341, 0.8677884, -0.05822719, 0, 1, 0.682353, 1,
-0.102275, 0.094778, -1.985152, 0, 1, 0.6862745, 1,
-0.1008529, 0.8027945, -0.1643065, 0, 1, 0.6941177, 1,
-0.09520454, 0.4491429, 0.1443614, 0, 1, 0.7019608, 1,
-0.09294816, -1.020918, -3.744526, 0, 1, 0.7058824, 1,
-0.09285618, 0.1068638, -0.9198587, 0, 1, 0.7137255, 1,
-0.08958305, 1.576377, 1.975312, 0, 1, 0.7176471, 1,
-0.08827438, -1.579852, -3.973755, 0, 1, 0.7254902, 1,
-0.08640278, 0.01157195, -2.037795, 0, 1, 0.7294118, 1,
-0.08445106, 0.7115634, -0.02881678, 0, 1, 0.7372549, 1,
-0.0816806, -0.3766299, -3.793546, 0, 1, 0.7411765, 1,
-0.07890531, -1.04038, -3.87882, 0, 1, 0.7490196, 1,
-0.07805431, 0.6485196, 0.555865, 0, 1, 0.7529412, 1,
-0.07708177, 0.816109, 0.06463453, 0, 1, 0.7607843, 1,
-0.07327549, -0.4914261, -2.85252, 0, 1, 0.7647059, 1,
-0.07167451, -0.7680153, -3.058844, 0, 1, 0.772549, 1,
-0.06982673, -0.05655368, -0.5710946, 0, 1, 0.7764706, 1,
-0.06833226, 0.5040411, 0.5572716, 0, 1, 0.7843137, 1,
-0.06061668, 0.563484, 1.174665, 0, 1, 0.7882353, 1,
-0.05532141, -0.4087676, -3.122339, 0, 1, 0.7960784, 1,
-0.05263498, -0.4261908, -2.094823, 0, 1, 0.8039216, 1,
-0.0464419, -2.981804, -4.955017, 0, 1, 0.8078431, 1,
-0.04127451, 0.2445622, -0.7290124, 0, 1, 0.8156863, 1,
-0.03966534, 1.258419, -0.440808, 0, 1, 0.8196079, 1,
-0.03426853, 1.771754, -0.08293068, 0, 1, 0.827451, 1,
-0.03037639, 0.5262635, -0.05096048, 0, 1, 0.8313726, 1,
-0.029185, -0.07339925, -3.438339, 0, 1, 0.8392157, 1,
-0.02582679, 0.4999098, -0.2288479, 0, 1, 0.8431373, 1,
-0.02467683, -1.681208, -2.921658, 0, 1, 0.8509804, 1,
-0.02136025, 2.005001, 1.182117, 0, 1, 0.854902, 1,
-0.01562478, 0.2523723, -0.2080002, 0, 1, 0.8627451, 1,
-0.01191156, 0.1778146, 2.043944, 0, 1, 0.8666667, 1,
-0.01167577, 0.1856626, 1.831718, 0, 1, 0.8745098, 1,
-0.01154257, 3.307039, 0.4887188, 0, 1, 0.8784314, 1,
-0.009763346, 0.3296277, 1.028633, 0, 1, 0.8862745, 1,
-0.009441532, -1.218447, -2.357015, 0, 1, 0.8901961, 1,
-0.00659556, -1.139634, -2.481694, 0, 1, 0.8980392, 1,
-0.004181833, -0.7812973, -3.551324, 0, 1, 0.9058824, 1,
-0.001410034, 1.591131, 0.4884585, 0, 1, 0.9098039, 1,
0.0009969909, -0.5152, 4.597332, 0, 1, 0.9176471, 1,
0.002660268, -0.3617936, 3.477284, 0, 1, 0.9215686, 1,
0.002914331, 0.1553241, 0.7631454, 0, 1, 0.9294118, 1,
0.00506869, 0.7986574, -1.423549, 0, 1, 0.9333333, 1,
0.005702719, 0.1449779, 1.38151, 0, 1, 0.9411765, 1,
0.008379528, -0.6534846, 3.753832, 0, 1, 0.945098, 1,
0.008456885, 0.2537113, -0.6502284, 0, 1, 0.9529412, 1,
0.01194755, -0.7077805, 3.124383, 0, 1, 0.9568627, 1,
0.01194876, -0.8314958, 2.302408, 0, 1, 0.9647059, 1,
0.01220476, 1.852679, -0.4759735, 0, 1, 0.9686275, 1,
0.01272995, 2.280735, -1.021345, 0, 1, 0.9764706, 1,
0.01472536, 1.095515, 0.1374959, 0, 1, 0.9803922, 1,
0.01571338, 0.9203936, -0.4287482, 0, 1, 0.9882353, 1,
0.0163746, -0.8385704, 4.13021, 0, 1, 0.9921569, 1,
0.01876206, -1.588093, 2.514569, 0, 1, 1, 1,
0.02280852, -0.3946326, 2.634599, 0, 0.9921569, 1, 1,
0.02344112, 0.7756109, 0.8144297, 0, 0.9882353, 1, 1,
0.0259023, 0.7031372, -0.1093068, 0, 0.9803922, 1, 1,
0.02753499, 1.146552, -0.6003551, 0, 0.9764706, 1, 1,
0.02800493, -0.5301082, 4.022059, 0, 0.9686275, 1, 1,
0.03202729, 1.019914, -1.212662, 0, 0.9647059, 1, 1,
0.03518105, 0.6529013, -1.478909, 0, 0.9568627, 1, 1,
0.03673396, -0.7634391, 4.01443, 0, 0.9529412, 1, 1,
0.04894409, 0.4163002, -0.9782103, 0, 0.945098, 1, 1,
0.05044736, -2.169366, 2.022001, 0, 0.9411765, 1, 1,
0.0566237, -1.184687, 2.112072, 0, 0.9333333, 1, 1,
0.05715071, -0.8673038, 1.160685, 0, 0.9294118, 1, 1,
0.05893488, 1.294518, 0.6580186, 0, 0.9215686, 1, 1,
0.06684513, -0.03912823, 2.999242, 0, 0.9176471, 1, 1,
0.06728511, 0.4517152, 0.1804926, 0, 0.9098039, 1, 1,
0.06782518, -1.190798, 5.961573, 0, 0.9058824, 1, 1,
0.06821547, 0.357198, 0.0817013, 0, 0.8980392, 1, 1,
0.07059813, -1.066861, 3.108815, 0, 0.8901961, 1, 1,
0.07314399, -0.476917, 2.93564, 0, 0.8862745, 1, 1,
0.07319996, 0.13313, 0.8087298, 0, 0.8784314, 1, 1,
0.07824969, -0.1512079, 2.125792, 0, 0.8745098, 1, 1,
0.07929175, -0.2919429, 2.122585, 0, 0.8666667, 1, 1,
0.08305365, 1.058047, 0.1376334, 0, 0.8627451, 1, 1,
0.08655898, -0.06143018, 1.913265, 0, 0.854902, 1, 1,
0.0948204, 3.384919, 2.083956, 0, 0.8509804, 1, 1,
0.09536372, -0.9132735, 2.628431, 0, 0.8431373, 1, 1,
0.09888582, 1.046677, 0.8020255, 0, 0.8392157, 1, 1,
0.09936067, -0.2523323, 2.036306, 0, 0.8313726, 1, 1,
0.1010918, -0.7009307, 3.246569, 0, 0.827451, 1, 1,
0.1053581, 0.1904368, 0.2886362, 0, 0.8196079, 1, 1,
0.1072053, -0.6274163, 2.806419, 0, 0.8156863, 1, 1,
0.1148366, 0.2464884, -0.02163846, 0, 0.8078431, 1, 1,
0.1157151, -1.021394, 2.076622, 0, 0.8039216, 1, 1,
0.1198913, 0.316092, 0.6381338, 0, 0.7960784, 1, 1,
0.1205984, -1.256997, 4.020498, 0, 0.7882353, 1, 1,
0.1210907, -0.6186371, 2.094605, 0, 0.7843137, 1, 1,
0.1214273, 0.2375866, 1.587587, 0, 0.7764706, 1, 1,
0.122053, -0.4118285, 3.776869, 0, 0.772549, 1, 1,
0.1301122, -1.618936, 4.303759, 0, 0.7647059, 1, 1,
0.1308936, -0.8194662, 2.317964, 0, 0.7607843, 1, 1,
0.1328454, 1.147944, 1.415558, 0, 0.7529412, 1, 1,
0.1356653, 1.462218, 0.5205775, 0, 0.7490196, 1, 1,
0.1397177, 1.155384, -1.684076, 0, 0.7411765, 1, 1,
0.144775, -0.1015244, 1.936518, 0, 0.7372549, 1, 1,
0.1487463, 0.4583367, 0.2395789, 0, 0.7294118, 1, 1,
0.1537466, 0.5457357, 1.076885, 0, 0.7254902, 1, 1,
0.1560985, -1.155029, 2.13477, 0, 0.7176471, 1, 1,
0.1663893, 0.3128173, 1.073058, 0, 0.7137255, 1, 1,
0.1680149, 1.095214, 1.220074, 0, 0.7058824, 1, 1,
0.1702098, 0.9530216, 1.101386, 0, 0.6980392, 1, 1,
0.170745, -1.524318, 0.9823461, 0, 0.6941177, 1, 1,
0.1709203, -1.285882, 1.884952, 0, 0.6862745, 1, 1,
0.1736837, -0.8554455, 2.006155, 0, 0.682353, 1, 1,
0.1741768, -0.1715816, 3.028082, 0, 0.6745098, 1, 1,
0.1742848, -1.758189, 1.728559, 0, 0.6705883, 1, 1,
0.1763024, 0.5176621, 0.7369148, 0, 0.6627451, 1, 1,
0.1775696, -0.211037, 1.397122, 0, 0.6588235, 1, 1,
0.1785325, -0.2287574, 0.6889438, 0, 0.6509804, 1, 1,
0.1800085, 0.06705661, 0.7336851, 0, 0.6470588, 1, 1,
0.18025, -0.5892814, 4.832133, 0, 0.6392157, 1, 1,
0.1805415, -2.359301, 2.289534, 0, 0.6352941, 1, 1,
0.1806859, 0.5117542, -0.2139055, 0, 0.627451, 1, 1,
0.1886151, -0.4130575, 1.821785, 0, 0.6235294, 1, 1,
0.191861, -2.088272, 4.814085, 0, 0.6156863, 1, 1,
0.1943199, -1.253524, 4.126207, 0, 0.6117647, 1, 1,
0.1943341, -0.4385266, 2.334717, 0, 0.6039216, 1, 1,
0.1952889, 0.7254976, -0.04276982, 0, 0.5960785, 1, 1,
0.1961611, 1.451037, -0.7854452, 0, 0.5921569, 1, 1,
0.1986186, -1.29101, 4.751793, 0, 0.5843138, 1, 1,
0.1986622, -0.1974272, 3.916845, 0, 0.5803922, 1, 1,
0.2008526, -0.456589, 2.959461, 0, 0.572549, 1, 1,
0.2080249, -1.373577, 1.809923, 0, 0.5686275, 1, 1,
0.2083868, -0.6520916, 1.62064, 0, 0.5607843, 1, 1,
0.2093101, 0.5231071, 1.401854, 0, 0.5568628, 1, 1,
0.2095802, 1.401379, -0.3349578, 0, 0.5490196, 1, 1,
0.2096668, 0.1220616, 0.09623794, 0, 0.5450981, 1, 1,
0.2125429, 0.5708835, 0.4409844, 0, 0.5372549, 1, 1,
0.2151278, 0.07748941, -0.1016637, 0, 0.5333334, 1, 1,
0.2154326, 0.5914291, 0.4398529, 0, 0.5254902, 1, 1,
0.2155149, -0.5438206, 4.015388, 0, 0.5215687, 1, 1,
0.2160217, -1.088388, 1.470944, 0, 0.5137255, 1, 1,
0.2221677, 1.396454, -0.06607579, 0, 0.509804, 1, 1,
0.2236409, -0.5050299, 2.413153, 0, 0.5019608, 1, 1,
0.2237916, -0.5266436, 1.424448, 0, 0.4941176, 1, 1,
0.2238239, 0.7677286, 0.2590068, 0, 0.4901961, 1, 1,
0.2248086, -2.109975, 4.119324, 0, 0.4823529, 1, 1,
0.2254705, 0.6222932, -0.0279561, 0, 0.4784314, 1, 1,
0.2268172, -0.6453384, 2.319336, 0, 0.4705882, 1, 1,
0.2291943, -2.385824, 4.366457, 0, 0.4666667, 1, 1,
0.2293217, 0.4648832, 1.314402, 0, 0.4588235, 1, 1,
0.2305345, 1.163078, -0.9542425, 0, 0.454902, 1, 1,
0.2354528, 0.02128453, 2.659123, 0, 0.4470588, 1, 1,
0.2366417, -0.7816244, 0.3771932, 0, 0.4431373, 1, 1,
0.237016, -1.294889, 3.486622, 0, 0.4352941, 1, 1,
0.2380656, -0.4830967, 0.8264057, 0, 0.4313726, 1, 1,
0.2412886, 2.246233, -0.07608489, 0, 0.4235294, 1, 1,
0.2472931, 0.8238673, -0.05842874, 0, 0.4196078, 1, 1,
0.24764, -0.4929013, 2.47862, 0, 0.4117647, 1, 1,
0.2501857, 0.2561039, 1.643703, 0, 0.4078431, 1, 1,
0.2526084, 0.1722029, 1.998615, 0, 0.4, 1, 1,
0.2586531, -1.125257, 3.140593, 0, 0.3921569, 1, 1,
0.2593497, 1.429498, -0.1944818, 0, 0.3882353, 1, 1,
0.2598275, -0.4975523, 4.082902, 0, 0.3803922, 1, 1,
0.2679721, -1.153191, 4.124109, 0, 0.3764706, 1, 1,
0.2703627, -1.427722, 1.534108, 0, 0.3686275, 1, 1,
0.2707554, -0.06747072, 1.762206, 0, 0.3647059, 1, 1,
0.2733656, 1.184507, -0.9883689, 0, 0.3568628, 1, 1,
0.2803055, 0.2568664, 0.7707229, 0, 0.3529412, 1, 1,
0.2803918, -0.5705171, 0.4023987, 0, 0.345098, 1, 1,
0.280674, 0.2442528, 1.946654, 0, 0.3411765, 1, 1,
0.2814872, 0.08891736, 1.970437, 0, 0.3333333, 1, 1,
0.2824962, -2.030568, 2.864121, 0, 0.3294118, 1, 1,
0.2840634, 1.002927, -0.4144982, 0, 0.3215686, 1, 1,
0.2857759, 1.409125, 0.8974701, 0, 0.3176471, 1, 1,
0.288689, -0.268857, 1.794152, 0, 0.3098039, 1, 1,
0.2888643, -1.675572, 2.626538, 0, 0.3058824, 1, 1,
0.2929929, 1.838341, 2.013619, 0, 0.2980392, 1, 1,
0.2938085, -0.4902433, 2.712867, 0, 0.2901961, 1, 1,
0.2954101, -0.2021921, 1.749479, 0, 0.2862745, 1, 1,
0.304196, 0.4911042, -0.8911822, 0, 0.2784314, 1, 1,
0.3044859, -1.061582, 1.893146, 0, 0.2745098, 1, 1,
0.3158376, 0.4650078, 0.01154481, 0, 0.2666667, 1, 1,
0.3175505, -0.3954814, 1.647884, 0, 0.2627451, 1, 1,
0.3198766, 0.1490738, 1.089195, 0, 0.254902, 1, 1,
0.3210504, -2.251164, 3.485275, 0, 0.2509804, 1, 1,
0.3230931, 0.3260551, -0.119796, 0, 0.2431373, 1, 1,
0.3265381, 0.1650222, 1.637007, 0, 0.2392157, 1, 1,
0.3343848, 0.2612014, -0.1362308, 0, 0.2313726, 1, 1,
0.3368836, -1.778332, 3.037946, 0, 0.227451, 1, 1,
0.3374486, -0.461763, 2.039253, 0, 0.2196078, 1, 1,
0.3543973, 1.236396, 0.2292588, 0, 0.2156863, 1, 1,
0.3609375, 0.5027614, 0.6969597, 0, 0.2078431, 1, 1,
0.3624561, -0.6456537, 3.695374, 0, 0.2039216, 1, 1,
0.3653884, 1.531574, 3.244447, 0, 0.1960784, 1, 1,
0.366334, -0.3898627, 1.679392, 0, 0.1882353, 1, 1,
0.3681744, 0.7595866, 0.1949399, 0, 0.1843137, 1, 1,
0.3707205, 1.917007, 0.5405054, 0, 0.1764706, 1, 1,
0.3798007, 1.631515, -0.559404, 0, 0.172549, 1, 1,
0.3874332, -0.7260821, 2.452807, 0, 0.1647059, 1, 1,
0.3899343, 1.615345, 0.3843721, 0, 0.1607843, 1, 1,
0.3909753, 0.6628816, 0.4122331, 0, 0.1529412, 1, 1,
0.3913044, 0.6204674, -0.4926023, 0, 0.1490196, 1, 1,
0.3930111, 1.156369, 2.548459, 0, 0.1411765, 1, 1,
0.395984, -0.6727746, 2.240607, 0, 0.1372549, 1, 1,
0.3967637, 1.619155, 0.3584752, 0, 0.1294118, 1, 1,
0.3976534, -0.1789421, 0.8463192, 0, 0.1254902, 1, 1,
0.4046767, 1.040809, 1.760956, 0, 0.1176471, 1, 1,
0.4068111, -0.4542426, 3.749105, 0, 0.1137255, 1, 1,
0.4128699, 0.7151428, -0.5863672, 0, 0.1058824, 1, 1,
0.4142807, -0.8443198, 2.495218, 0, 0.09803922, 1, 1,
0.4159618, -0.05523768, 1.450665, 0, 0.09411765, 1, 1,
0.4185791, 0.4977067, 2.396585, 0, 0.08627451, 1, 1,
0.4240838, 0.6445655, -0.6206733, 0, 0.08235294, 1, 1,
0.4260728, 0.06012397, 1.125964, 0, 0.07450981, 1, 1,
0.4274006, -0.759948, 3.942868, 0, 0.07058824, 1, 1,
0.4313293, -2.259756, 3.996621, 0, 0.0627451, 1, 1,
0.4361682, 0.2317599, 0.992753, 0, 0.05882353, 1, 1,
0.4450272, 1.314016, 0.5328375, 0, 0.05098039, 1, 1,
0.4482061, -0.7363163, 3.970234, 0, 0.04705882, 1, 1,
0.448622, -0.2174674, 1.883046, 0, 0.03921569, 1, 1,
0.4489325, -0.4393464, 3.58727, 0, 0.03529412, 1, 1,
0.4508623, -0.0002748248, 3.186733, 0, 0.02745098, 1, 1,
0.4568338, 0.7411337, 0.2967107, 0, 0.02352941, 1, 1,
0.4574509, 0.02533997, 0.5334212, 0, 0.01568628, 1, 1,
0.4585504, -0.5906126, 1.389681, 0, 0.01176471, 1, 1,
0.4586442, 0.08652265, 2.097818, 0, 0.003921569, 1, 1,
0.4628438, -0.78284, 3.133343, 0.003921569, 0, 1, 1,
0.4633918, 0.1112431, 1.17812, 0.007843138, 0, 1, 1,
0.4644367, -2.308576, 3.20628, 0.01568628, 0, 1, 1,
0.4650311, -0.6461134, 2.591769, 0.01960784, 0, 1, 1,
0.4650626, 1.297994, -0.4671403, 0.02745098, 0, 1, 1,
0.46662, -1.353348, 3.711517, 0.03137255, 0, 1, 1,
0.4719633, -0.6947597, 2.23852, 0.03921569, 0, 1, 1,
0.4732983, 0.9779195, 0.09475599, 0.04313726, 0, 1, 1,
0.4820256, 0.4239083, 1.901382, 0.05098039, 0, 1, 1,
0.4829143, 0.1497449, 1.960617, 0.05490196, 0, 1, 1,
0.4837714, -0.8259853, 1.005213, 0.0627451, 0, 1, 1,
0.4882357, -0.7936717, 1.760886, 0.06666667, 0, 1, 1,
0.4921257, -1.570371, 4.033628, 0.07450981, 0, 1, 1,
0.4947258, -0.5767391, 3.711428, 0.07843138, 0, 1, 1,
0.4985873, 0.7087139, -0.1790738, 0.08627451, 0, 1, 1,
0.4991168, -0.5442764, 2.809802, 0.09019608, 0, 1, 1,
0.4992125, 0.3057331, 0.03481056, 0.09803922, 0, 1, 1,
0.5019193, 1.101563, 0.6785765, 0.1058824, 0, 1, 1,
0.5020379, 0.02068473, 2.443342, 0.1098039, 0, 1, 1,
0.5036921, 0.9319274, -0.6946657, 0.1176471, 0, 1, 1,
0.5067547, 0.8672758, 0.1640812, 0.1215686, 0, 1, 1,
0.507808, -0.3434366, 2.505286, 0.1294118, 0, 1, 1,
0.5108544, -1.133788, 3.674101, 0.1333333, 0, 1, 1,
0.5109918, -0.2126969, 2.302017, 0.1411765, 0, 1, 1,
0.5117386, 0.3153951, 0.8228841, 0.145098, 0, 1, 1,
0.5131716, 2.00973, -1.697291, 0.1529412, 0, 1, 1,
0.521113, 0.496493, 1.432057, 0.1568628, 0, 1, 1,
0.5235221, -0.7856105, 3.018935, 0.1647059, 0, 1, 1,
0.5241284, 1.611152, -1.366602, 0.1686275, 0, 1, 1,
0.5281987, -0.4090093, 1.738637, 0.1764706, 0, 1, 1,
0.5289776, -0.4299493, 1.740731, 0.1803922, 0, 1, 1,
0.5312103, 0.5803464, -0.05031564, 0.1882353, 0, 1, 1,
0.5329247, -2.363689, 3.987942, 0.1921569, 0, 1, 1,
0.5400208, -0.1301577, 0.9220623, 0.2, 0, 1, 1,
0.5413333, 0.6173062, 0.6336365, 0.2078431, 0, 1, 1,
0.5469259, 0.2735741, 1.516413, 0.2117647, 0, 1, 1,
0.5550998, -0.4836557, 1.477828, 0.2196078, 0, 1, 1,
0.5600521, -2.862666, 1.901131, 0.2235294, 0, 1, 1,
0.5685447, -1.652475, 3.941312, 0.2313726, 0, 1, 1,
0.5728053, 1.046358, 1.979517, 0.2352941, 0, 1, 1,
0.5764738, -1.394605, 1.85079, 0.2431373, 0, 1, 1,
0.5801733, 0.2108935, 1.12481, 0.2470588, 0, 1, 1,
0.585654, 1.630286, 0.7992752, 0.254902, 0, 1, 1,
0.5907946, 0.2830009, 1.586951, 0.2588235, 0, 1, 1,
0.608228, 0.06023504, 0.6360801, 0.2666667, 0, 1, 1,
0.6102064, 0.9393151, 1.092277, 0.2705882, 0, 1, 1,
0.6142828, 0.9910817, 0.1376365, 0.2784314, 0, 1, 1,
0.6145575, -0.282317, 1.569337, 0.282353, 0, 1, 1,
0.6183928, 1.573771, 0.9002244, 0.2901961, 0, 1, 1,
0.6188743, -0.3716665, 2.441288, 0.2941177, 0, 1, 1,
0.6191133, -2.27334, 2.561743, 0.3019608, 0, 1, 1,
0.6250322, -0.8423129, 3.234694, 0.3098039, 0, 1, 1,
0.6361666, -0.3232309, 1.656759, 0.3137255, 0, 1, 1,
0.6377718, -0.1395254, 3.604687, 0.3215686, 0, 1, 1,
0.6388195, -0.8516116, 3.228819, 0.3254902, 0, 1, 1,
0.6401702, -0.06033465, 0.317583, 0.3333333, 0, 1, 1,
0.6423783, -0.5141509, 2.579191, 0.3372549, 0, 1, 1,
0.6427316, -1.170194, 2.910854, 0.345098, 0, 1, 1,
0.6492838, -0.6460487, 3.31285, 0.3490196, 0, 1, 1,
0.6500693, 0.8783805, 1.164056, 0.3568628, 0, 1, 1,
0.6508917, 1.201381, 0.03607015, 0.3607843, 0, 1, 1,
0.6518057, -0.2320603, 2.150733, 0.3686275, 0, 1, 1,
0.6538545, 0.5169894, 0.6912409, 0.372549, 0, 1, 1,
0.6539768, 0.9428624, 1.826202, 0.3803922, 0, 1, 1,
0.657544, 0.1463563, 1.444978, 0.3843137, 0, 1, 1,
0.6588468, -1.111033, 2.151536, 0.3921569, 0, 1, 1,
0.6596524, 2.970328, -1.622556, 0.3960784, 0, 1, 1,
0.6605471, -0.642077, -0.1858153, 0.4039216, 0, 1, 1,
0.6620309, 0.4101291, -1.601642, 0.4117647, 0, 1, 1,
0.6624985, 0.3170053, 2.362321, 0.4156863, 0, 1, 1,
0.6654818, 1.779157, -0.7355839, 0.4235294, 0, 1, 1,
0.6698345, -0.6993067, 2.587437, 0.427451, 0, 1, 1,
0.6725991, 2.38008, -0.1469653, 0.4352941, 0, 1, 1,
0.672932, 0.6058865, 0.4604683, 0.4392157, 0, 1, 1,
0.6745845, 0.6379153, 0.126877, 0.4470588, 0, 1, 1,
0.6772138, 0.9300994, 0.7062804, 0.4509804, 0, 1, 1,
0.6789595, -0.6271212, 2.046695, 0.4588235, 0, 1, 1,
0.6798488, -0.3340959, 2.287876, 0.4627451, 0, 1, 1,
0.6814782, -1.504011, 2.911962, 0.4705882, 0, 1, 1,
0.685911, -0.006576754, 1.928642, 0.4745098, 0, 1, 1,
0.6872393, 0.1382322, -0.07829661, 0.4823529, 0, 1, 1,
0.6878421, -0.2495653, 2.560544, 0.4862745, 0, 1, 1,
0.6899741, -2.086118, 1.820473, 0.4941176, 0, 1, 1,
0.6929808, 1.462973, -0.3470039, 0.5019608, 0, 1, 1,
0.6932718, 0.320712, 1.603045, 0.5058824, 0, 1, 1,
0.6936962, -0.4361756, 2.530154, 0.5137255, 0, 1, 1,
0.6959994, -1.31399, 2.697649, 0.5176471, 0, 1, 1,
0.6982719, -0.7294132, -0.002422039, 0.5254902, 0, 1, 1,
0.6993617, 0.1067013, 1.805036, 0.5294118, 0, 1, 1,
0.7022671, -1.136169, 4.264507, 0.5372549, 0, 1, 1,
0.7037752, 0.3121945, 0.06255617, 0.5411765, 0, 1, 1,
0.7100853, 0.6859643, 1.822271, 0.5490196, 0, 1, 1,
0.7102186, -0.02731801, 1.851139, 0.5529412, 0, 1, 1,
0.711467, 1.696928, 2.251332, 0.5607843, 0, 1, 1,
0.7133012, 0.2097889, -0.04909127, 0.5647059, 0, 1, 1,
0.7156343, -1.786698, 4.254157, 0.572549, 0, 1, 1,
0.7166833, 0.7535669, 0.5032498, 0.5764706, 0, 1, 1,
0.7177609, -0.1201066, 1.086904, 0.5843138, 0, 1, 1,
0.7209117, 1.175579, 0.7124226, 0.5882353, 0, 1, 1,
0.7250324, -0.473323, 4.262094, 0.5960785, 0, 1, 1,
0.7272928, -0.4387384, 3.987956, 0.6039216, 0, 1, 1,
0.7325366, 0.4579032, 1.222339, 0.6078432, 0, 1, 1,
0.7365709, 0.05734709, 0.6305057, 0.6156863, 0, 1, 1,
0.7386443, -2.26429, 2.848121, 0.6196079, 0, 1, 1,
0.7399495, 1.801889, -1.343731, 0.627451, 0, 1, 1,
0.7400228, 0.6133912, 1.257962, 0.6313726, 0, 1, 1,
0.7456143, -0.8919603, 2.088411, 0.6392157, 0, 1, 1,
0.7460222, 0.459339, -0.4809837, 0.6431373, 0, 1, 1,
0.7559078, 0.2166992, 1.150403, 0.6509804, 0, 1, 1,
0.759086, -0.9108184, 2.469104, 0.654902, 0, 1, 1,
0.7595181, 0.5390352, 1.906614, 0.6627451, 0, 1, 1,
0.7598709, -1.19822, 3.191875, 0.6666667, 0, 1, 1,
0.7603779, 0.29133, 1.632764, 0.6745098, 0, 1, 1,
0.7671534, 0.3683608, -0.6988217, 0.6784314, 0, 1, 1,
0.7705734, 1.117524, -1.453967, 0.6862745, 0, 1, 1,
0.7756552, -0.7945276, 0.4069406, 0.6901961, 0, 1, 1,
0.7783456, -0.3494119, 3.521463, 0.6980392, 0, 1, 1,
0.780275, 0.2752011, 2.6994, 0.7058824, 0, 1, 1,
0.7807563, 0.09969056, 2.509325, 0.7098039, 0, 1, 1,
0.7878113, -0.6368676, 2.650608, 0.7176471, 0, 1, 1,
0.7880308, 0.906843, 0.465708, 0.7215686, 0, 1, 1,
0.794073, -0.4796903, 1.684615, 0.7294118, 0, 1, 1,
0.7968109, -1.630529, 3.431284, 0.7333333, 0, 1, 1,
0.7987891, -0.9243403, 2.675786, 0.7411765, 0, 1, 1,
0.8030223, -0.4007414, 2.3084, 0.7450981, 0, 1, 1,
0.803975, 1.199272, 1.37932, 0.7529412, 0, 1, 1,
0.813421, 1.207424, 0.521642, 0.7568628, 0, 1, 1,
0.8140525, 0.8885108, -0.07127985, 0.7647059, 0, 1, 1,
0.8162663, 0.140428, 1.728734, 0.7686275, 0, 1, 1,
0.8185393, 0.9303085, 0.7705841, 0.7764706, 0, 1, 1,
0.8192751, 0.2369579, 2.399826, 0.7803922, 0, 1, 1,
0.822183, 1.271789, 0.5372639, 0.7882353, 0, 1, 1,
0.8258387, 0.9715983, 1.014656, 0.7921569, 0, 1, 1,
0.8293225, -0.2571427, 1.815901, 0.8, 0, 1, 1,
0.830246, -1.267821, 2.545405, 0.8078431, 0, 1, 1,
0.8323161, -0.6823524, 1.857906, 0.8117647, 0, 1, 1,
0.8331177, 0.586198, 0.9650999, 0.8196079, 0, 1, 1,
0.8332972, -0.7683313, 1.398778, 0.8235294, 0, 1, 1,
0.8334688, -0.3377282, 2.130457, 0.8313726, 0, 1, 1,
0.8434631, -0.6348652, 2.583819, 0.8352941, 0, 1, 1,
0.8436207, -2.398257, 3.530868, 0.8431373, 0, 1, 1,
0.8449104, -0.5853725, 3.010807, 0.8470588, 0, 1, 1,
0.8530415, -0.127249, 2.609063, 0.854902, 0, 1, 1,
0.8626916, 0.8598804, 1.41783, 0.8588235, 0, 1, 1,
0.8646283, -1.436313, 2.270698, 0.8666667, 0, 1, 1,
0.8783485, 0.2130698, 0.7737368, 0.8705882, 0, 1, 1,
0.8809708, -0.7108334, 1.94469, 0.8784314, 0, 1, 1,
0.8826388, 0.4746842, 0.5489274, 0.8823529, 0, 1, 1,
0.8867096, 0.1331699, 1.399624, 0.8901961, 0, 1, 1,
0.8879833, 1.346579, -0.07916699, 0.8941177, 0, 1, 1,
0.8883207, 1.082167, -0.1509533, 0.9019608, 0, 1, 1,
0.8901327, 0.6334404, 0.6784097, 0.9098039, 0, 1, 1,
0.8938674, -0.205762, 1.824182, 0.9137255, 0, 1, 1,
0.8939229, -0.3361998, 1.879019, 0.9215686, 0, 1, 1,
0.8971611, 1.352794, 2.200897, 0.9254902, 0, 1, 1,
0.8986136, -0.4931568, 2.269761, 0.9333333, 0, 1, 1,
0.8993756, -0.2320311, 0.9395326, 0.9372549, 0, 1, 1,
0.9038131, -0.7117377, 3.741287, 0.945098, 0, 1, 1,
0.9103037, 0.6956952, 1.322027, 0.9490196, 0, 1, 1,
0.9152712, 0.188573, 1.972088, 0.9568627, 0, 1, 1,
0.9155514, -0.8093351, 1.550044, 0.9607843, 0, 1, 1,
0.9285873, -1.890856, 2.755991, 0.9686275, 0, 1, 1,
0.9375089, -0.3131102, 1.932029, 0.972549, 0, 1, 1,
0.9411451, -0.5863219, 2.325377, 0.9803922, 0, 1, 1,
0.9535832, -0.7310638, 2.042339, 0.9843137, 0, 1, 1,
0.9550574, -2.263066, 1.811878, 0.9921569, 0, 1, 1,
0.9646965, 0.6360799, 2.5689, 0.9960784, 0, 1, 1,
0.9668362, -0.3236619, 2.034842, 1, 0, 0.9960784, 1,
0.9678115, -0.2285351, 1.960382, 1, 0, 0.9882353, 1,
0.9718317, -1.711295, 2.048035, 1, 0, 0.9843137, 1,
0.9781653, -0.8718986, 2.877967, 1, 0, 0.9764706, 1,
0.9784181, -0.498342, 0.2125295, 1, 0, 0.972549, 1,
0.979223, 1.276909, 1.749435, 1, 0, 0.9647059, 1,
0.9795223, -1.245956, 3.891414, 1, 0, 0.9607843, 1,
0.9883863, 1.684917, -1.758569, 1, 0, 0.9529412, 1,
0.9903144, 0.9555817, 1.240475, 1, 0, 0.9490196, 1,
0.9979499, 1.356449, -0.04427721, 1, 0, 0.9411765, 1,
1.002193, -1.747199, 2.292437, 1, 0, 0.9372549, 1,
1.010401, 0.3994716, 1.872328, 1, 0, 0.9294118, 1,
1.01734, -1.625882, 4.592278, 1, 0, 0.9254902, 1,
1.017914, 0.305494, 2.366592, 1, 0, 0.9176471, 1,
1.02574, 0.2865752, 1.819847, 1, 0, 0.9137255, 1,
1.027715, -0.4078709, 0.5262922, 1, 0, 0.9058824, 1,
1.031692, 0.01874467, 2.532422, 1, 0, 0.9019608, 1,
1.034427, -1.140111, 3.03881, 1, 0, 0.8941177, 1,
1.038359, 0.1116028, 0.3228297, 1, 0, 0.8862745, 1,
1.040531, 0.9592628, 1.154488, 1, 0, 0.8823529, 1,
1.042499, 1.335414, 0.9213026, 1, 0, 0.8745098, 1,
1.046845, 1.198772, -0.4988381, 1, 0, 0.8705882, 1,
1.048519, -0.1976067, 1.330615, 1, 0, 0.8627451, 1,
1.050943, -0.281771, 0.4003657, 1, 0, 0.8588235, 1,
1.062016, 0.3483801, 1.4075, 1, 0, 0.8509804, 1,
1.066694, 1.231412, 2.20644, 1, 0, 0.8470588, 1,
1.070034, -0.1700206, 1.871839, 1, 0, 0.8392157, 1,
1.074696, -1.246683, 3.41955, 1, 0, 0.8352941, 1,
1.079702, 0.05465515, 2.191149, 1, 0, 0.827451, 1,
1.080949, -0.3341055, 1.237913, 1, 0, 0.8235294, 1,
1.085394, -0.3289034, 1.000922, 1, 0, 0.8156863, 1,
1.090738, -1.088791, 1.461129, 1, 0, 0.8117647, 1,
1.095275, 0.6872469, 2.013915, 1, 0, 0.8039216, 1,
1.101238, 0.5269009, -0.5705047, 1, 0, 0.7960784, 1,
1.108094, -1.112699, 2.48735, 1, 0, 0.7921569, 1,
1.116812, -1.937149, 0.6278674, 1, 0, 0.7843137, 1,
1.118102, 1.727884, -1.525979, 1, 0, 0.7803922, 1,
1.125061, 0.4412076, 2.78786, 1, 0, 0.772549, 1,
1.129536, 0.6967822, 0.1370045, 1, 0, 0.7686275, 1,
1.135435, -1.363164, 0.5895824, 1, 0, 0.7607843, 1,
1.136798, 0.7885486, 3.114217, 1, 0, 0.7568628, 1,
1.137632, -0.7371848, 3.297048, 1, 0, 0.7490196, 1,
1.142803, 2.516984, 0.6327782, 1, 0, 0.7450981, 1,
1.149623, -0.7598379, 1.88338, 1, 0, 0.7372549, 1,
1.151341, -0.2435858, 1.589893, 1, 0, 0.7333333, 1,
1.1559, 1.066339, -0.07425468, 1, 0, 0.7254902, 1,
1.158956, 1.309046, 1.793205, 1, 0, 0.7215686, 1,
1.16074, -1.120337, 0.5625106, 1, 0, 0.7137255, 1,
1.162229, 0.2645541, 1.245354, 1, 0, 0.7098039, 1,
1.165499, 2.008757, 0.7415251, 1, 0, 0.7019608, 1,
1.168144, -0.4178871, 3.0866, 1, 0, 0.6941177, 1,
1.176331, -0.2742684, 0.9318575, 1, 0, 0.6901961, 1,
1.177057, 0.7963743, 0.6363339, 1, 0, 0.682353, 1,
1.197839, -1.851601, 2.073957, 1, 0, 0.6784314, 1,
1.234136, -0.5680792, 1.413561, 1, 0, 0.6705883, 1,
1.247701, -0.3427866, 3.139714, 1, 0, 0.6666667, 1,
1.264763, -0.580218, 2.318185, 1, 0, 0.6588235, 1,
1.266706, -1.067675, 1.149271, 1, 0, 0.654902, 1,
1.27586, -1.046801, 1.810482, 1, 0, 0.6470588, 1,
1.28445, 0.8927702, 1.381061, 1, 0, 0.6431373, 1,
1.286752, -0.08631725, 1.217085, 1, 0, 0.6352941, 1,
1.289271, 0.4806553, 0.1332137, 1, 0, 0.6313726, 1,
1.289375, -1.196588, 1.072154, 1, 0, 0.6235294, 1,
1.291038, -0.6332736, 1.166742, 1, 0, 0.6196079, 1,
1.299125, 0.2213149, 1.572128, 1, 0, 0.6117647, 1,
1.303089, -0.9381331, 2.855721, 1, 0, 0.6078432, 1,
1.313894, -0.738018, 1.859943, 1, 0, 0.6, 1,
1.317203, 0.8368186, 0.6681867, 1, 0, 0.5921569, 1,
1.326148, 0.04865493, 1.201285, 1, 0, 0.5882353, 1,
1.326962, 0.854291, 1.4934, 1, 0, 0.5803922, 1,
1.332191, 1.347051, 2.212861, 1, 0, 0.5764706, 1,
1.340583, 0.593641, 1.360062, 1, 0, 0.5686275, 1,
1.349936, -1.508823, 1.162221, 1, 0, 0.5647059, 1,
1.3604, 1.702083, 0.4094363, 1, 0, 0.5568628, 1,
1.371077, -0.7423501, 1.919583, 1, 0, 0.5529412, 1,
1.374292, 0.3695021, 2.152691, 1, 0, 0.5450981, 1,
1.378603, -0.8504044, 2.528551, 1, 0, 0.5411765, 1,
1.381604, -0.05161662, 1.289358, 1, 0, 0.5333334, 1,
1.38433, 0.4147069, 0.5105312, 1, 0, 0.5294118, 1,
1.395883, -0.8842022, 2.757157, 1, 0, 0.5215687, 1,
1.412874, -1.564057, 1.468306, 1, 0, 0.5176471, 1,
1.42152, -0.387684, 1.842623, 1, 0, 0.509804, 1,
1.423438, 0.2867266, 1.985988, 1, 0, 0.5058824, 1,
1.424057, 1.475093, 1.067115, 1, 0, 0.4980392, 1,
1.425178, -2.28063, 3.265501, 1, 0, 0.4901961, 1,
1.426307, -0.2153297, -0.4082084, 1, 0, 0.4862745, 1,
1.432673, 1.061301, 0.1661898, 1, 0, 0.4784314, 1,
1.458249, -0.6601737, 2.005664, 1, 0, 0.4745098, 1,
1.459885, -0.1101857, 0.01109544, 1, 0, 0.4666667, 1,
1.461668, 0.2053502, 1.691508, 1, 0, 0.4627451, 1,
1.463278, -1.112581, 1.567088, 1, 0, 0.454902, 1,
1.463323, 0.7478633, 1.247726, 1, 0, 0.4509804, 1,
1.463985, -0.7125926, 2.470384, 1, 0, 0.4431373, 1,
1.465793, 1.348615, 1.03662, 1, 0, 0.4392157, 1,
1.46588, 0.2757859, 2.17599, 1, 0, 0.4313726, 1,
1.467879, -0.04172153, 0.5695186, 1, 0, 0.427451, 1,
1.472024, -1.493733, 0.7488329, 1, 0, 0.4196078, 1,
1.483276, 2.332544, -0.08343359, 1, 0, 0.4156863, 1,
1.487979, -0.3251943, 2.800826, 1, 0, 0.4078431, 1,
1.489703, 2.375621, 1.720363, 1, 0, 0.4039216, 1,
1.499086, -1.138666, 0.01755405, 1, 0, 0.3960784, 1,
1.500659, 0.3347803, 0.2216854, 1, 0, 0.3882353, 1,
1.519997, 0.2532704, 1.100943, 1, 0, 0.3843137, 1,
1.527668, 0.6010706, 0.7786728, 1, 0, 0.3764706, 1,
1.543039, 1.479481, 1.033247, 1, 0, 0.372549, 1,
1.557497, -1.319699, 3.186025, 1, 0, 0.3647059, 1,
1.562337, -0.6363162, 3.744529, 1, 0, 0.3607843, 1,
1.562769, 0.2717338, 2.212059, 1, 0, 0.3529412, 1,
1.575288, 0.3378558, -0.7649055, 1, 0, 0.3490196, 1,
1.581823, 0.7633862, 2.344122, 1, 0, 0.3411765, 1,
1.610219, -1.933456, 2.351137, 1, 0, 0.3372549, 1,
1.612716, 0.1426049, 2.135139, 1, 0, 0.3294118, 1,
1.616371, 0.8591005, 1.883875, 1, 0, 0.3254902, 1,
1.625876, 0.3964918, 1.190244, 1, 0, 0.3176471, 1,
1.635589, 0.9917384, -0.3046155, 1, 0, 0.3137255, 1,
1.639645, -1.26285, 1.016301, 1, 0, 0.3058824, 1,
1.643047, -0.4347627, 3.426008, 1, 0, 0.2980392, 1,
1.649237, 0.3270248, 1.434784, 1, 0, 0.2941177, 1,
1.691493, -0.6134105, 0.6931719, 1, 0, 0.2862745, 1,
1.695579, -1.861373, 1.903068, 1, 0, 0.282353, 1,
1.715313, 2.091069, -0.02049677, 1, 0, 0.2745098, 1,
1.722353, 0.3380224, 2.185601, 1, 0, 0.2705882, 1,
1.757295, -0.9657916, 1.918839, 1, 0, 0.2627451, 1,
1.767829, 0.9169845, 1.110987, 1, 0, 0.2588235, 1,
1.776308, -0.2273454, 2.920261, 1, 0, 0.2509804, 1,
1.78211, -1.084679, 3.123053, 1, 0, 0.2470588, 1,
1.791858, 0.8422127, -0.2106619, 1, 0, 0.2392157, 1,
1.806028, 0.532122, 2.158314, 1, 0, 0.2352941, 1,
1.812673, 0.7443359, -0.8539395, 1, 0, 0.227451, 1,
1.815615, 0.6328917, 1.016203, 1, 0, 0.2235294, 1,
1.837768, -2.363584, 3.304299, 1, 0, 0.2156863, 1,
1.84532, 0.3502452, 1.492659, 1, 0, 0.2117647, 1,
1.853086, 0.03513334, 0.3481002, 1, 0, 0.2039216, 1,
1.857609, 0.1442717, 3.078359, 1, 0, 0.1960784, 1,
1.863912, 1.760906, 1.603359, 1, 0, 0.1921569, 1,
1.864251, -1.154428, 1.710874, 1, 0, 0.1843137, 1,
1.882794, 0.2538366, 2.125851, 1, 0, 0.1803922, 1,
1.883352, -0.7825227, 3.623988, 1, 0, 0.172549, 1,
1.94339, 2.427163, -0.1883046, 1, 0, 0.1686275, 1,
1.952567, 0.4989633, 0.8563027, 1, 0, 0.1607843, 1,
1.954733, -0.992605, 3.102204, 1, 0, 0.1568628, 1,
1.979174, -1.11627, 2.431807, 1, 0, 0.1490196, 1,
1.990145, -0.5377544, 3.591857, 1, 0, 0.145098, 1,
2.022681, 0.1443273, 3.397878, 1, 0, 0.1372549, 1,
2.027886, -0.3422263, 1.756941, 1, 0, 0.1333333, 1,
2.040908, -2.074487, 3.008803, 1, 0, 0.1254902, 1,
2.042426, 0.1089081, 2.26588, 1, 0, 0.1215686, 1,
2.048311, -1.086484, 1.723402, 1, 0, 0.1137255, 1,
2.055589, -0.2067565, 1.587175, 1, 0, 0.1098039, 1,
2.081989, -0.9711626, 2.012429, 1, 0, 0.1019608, 1,
2.097149, -0.4012674, 2.234087, 1, 0, 0.09411765, 1,
2.12638, 0.07827911, 2.344385, 1, 0, 0.09019608, 1,
2.139583, -0.1647063, 3.602559, 1, 0, 0.08235294, 1,
2.162657, -1.158979, 2.921651, 1, 0, 0.07843138, 1,
2.211244, 0.7078063, -0.5408027, 1, 0, 0.07058824, 1,
2.254107, -0.21973, -1.098555, 1, 0, 0.06666667, 1,
2.298271, -0.4005514, 3.745597, 1, 0, 0.05882353, 1,
2.319649, 0.5343976, 2.244801, 1, 0, 0.05490196, 1,
2.327381, -0.4469732, 2.086645, 1, 0, 0.04705882, 1,
2.706344, -1.210064, 1.418267, 1, 0, 0.04313726, 1,
2.738683, -1.674729, 2.41784, 1, 0, 0.03529412, 1,
2.861599, -0.5900572, 0.5307728, 1, 0, 0.03137255, 1,
2.868857, 0.1090724, 3.082246, 1, 0, 0.02352941, 1,
2.988771, 0.2005274, 2.349667, 1, 0, 0.01960784, 1,
3.213007, -0.853388, 1.46308, 1, 0, 0.01176471, 1,
3.648145, 1.050702, -0.2871784, 1, 0, 0.007843138, 1
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
0.2218688, -4.060964, -7.239038, 0, -0.5, 0.5, 0.5,
0.2218688, -4.060964, -7.239038, 1, -0.5, 0.5, 0.5,
0.2218688, -4.060964, -7.239038, 1, 1.5, 0.5, 0.5,
0.2218688, -4.060964, -7.239038, 0, 1.5, 0.5, 0.5
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
-4.365916, 0.2015575, -7.239038, 0, -0.5, 0.5, 0.5,
-4.365916, 0.2015575, -7.239038, 1, -0.5, 0.5, 0.5,
-4.365916, 0.2015575, -7.239038, 1, 1.5, 0.5, 0.5,
-4.365916, 0.2015575, -7.239038, 0, 1.5, 0.5, 0.5
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
-4.365916, -4.060964, 0.3178744, 0, -0.5, 0.5, 0.5,
-4.365916, -4.060964, 0.3178744, 1, -0.5, 0.5, 0.5,
-4.365916, -4.060964, 0.3178744, 1, 1.5, 0.5, 0.5,
-4.365916, -4.060964, 0.3178744, 0, 1.5, 0.5, 0.5
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
-3, -3.077305, -5.495135,
3, -3.077305, -5.495135,
-3, -3.077305, -5.495135,
-3, -3.241248, -5.785786,
-2, -3.077305, -5.495135,
-2, -3.241248, -5.785786,
-1, -3.077305, -5.495135,
-1, -3.241248, -5.785786,
0, -3.077305, -5.495135,
0, -3.241248, -5.785786,
1, -3.077305, -5.495135,
1, -3.241248, -5.785786,
2, -3.077305, -5.495135,
2, -3.241248, -5.785786,
3, -3.077305, -5.495135,
3, -3.241248, -5.785786
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
-3, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
-3, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
-3, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
-3, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
-2, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
-2, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
-2, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
-2, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
-1, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
-1, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
-1, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
-1, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
0, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
0, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
0, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
0, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
1, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
1, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
1, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
1, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
2, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
2, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
2, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
2, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5,
3, -3.569134, -6.367087, 0, -0.5, 0.5, 0.5,
3, -3.569134, -6.367087, 1, -0.5, 0.5, 0.5,
3, -3.569134, -6.367087, 1, 1.5, 0.5, 0.5,
3, -3.569134, -6.367087, 0, 1.5, 0.5, 0.5
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
-3.307196, -2, -5.495135,
-3.307196, 3, -5.495135,
-3.307196, -2, -5.495135,
-3.483649, -2, -5.785786,
-3.307196, -1, -5.495135,
-3.483649, -1, -5.785786,
-3.307196, 0, -5.495135,
-3.483649, 0, -5.785786,
-3.307196, 1, -5.495135,
-3.483649, 1, -5.785786,
-3.307196, 2, -5.495135,
-3.483649, 2, -5.785786,
-3.307196, 3, -5.495135,
-3.483649, 3, -5.785786
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
-3.836556, -2, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, -2, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, -2, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, -2, -6.367087, 0, 1.5, 0.5, 0.5,
-3.836556, -1, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, -1, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, -1, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, -1, -6.367087, 0, 1.5, 0.5, 0.5,
-3.836556, 0, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, 0, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, 0, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, 0, -6.367087, 0, 1.5, 0.5, 0.5,
-3.836556, 1, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, 1, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, 1, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, 1, -6.367087, 0, 1.5, 0.5, 0.5,
-3.836556, 2, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, 2, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, 2, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, 2, -6.367087, 0, 1.5, 0.5, 0.5,
-3.836556, 3, -6.367087, 0, -0.5, 0.5, 0.5,
-3.836556, 3, -6.367087, 1, -0.5, 0.5, 0.5,
-3.836556, 3, -6.367087, 1, 1.5, 0.5, 0.5,
-3.836556, 3, -6.367087, 0, 1.5, 0.5, 0.5
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
-3.307196, -3.077305, -4,
-3.307196, -3.077305, 4,
-3.307196, -3.077305, -4,
-3.483649, -3.241248, -4,
-3.307196, -3.077305, -2,
-3.483649, -3.241248, -2,
-3.307196, -3.077305, 0,
-3.483649, -3.241248, 0,
-3.307196, -3.077305, 2,
-3.483649, -3.241248, 2,
-3.307196, -3.077305, 4,
-3.483649, -3.241248, 4
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
-3.836556, -3.569134, -4, 0, -0.5, 0.5, 0.5,
-3.836556, -3.569134, -4, 1, -0.5, 0.5, 0.5,
-3.836556, -3.569134, -4, 1, 1.5, 0.5, 0.5,
-3.836556, -3.569134, -4, 0, 1.5, 0.5, 0.5,
-3.836556, -3.569134, -2, 0, -0.5, 0.5, 0.5,
-3.836556, -3.569134, -2, 1, -0.5, 0.5, 0.5,
-3.836556, -3.569134, -2, 1, 1.5, 0.5, 0.5,
-3.836556, -3.569134, -2, 0, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 0, 0, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 0, 1, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 0, 1, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 0, 0, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 2, 0, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 2, 1, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 2, 1, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 2, 0, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 4, 0, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 4, 1, -0.5, 0.5, 0.5,
-3.836556, -3.569134, 4, 1, 1.5, 0.5, 0.5,
-3.836556, -3.569134, 4, 0, 1.5, 0.5, 0.5
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
-3.307196, -3.077305, -5.495135,
-3.307196, 3.48042, -5.495135,
-3.307196, -3.077305, 6.130884,
-3.307196, 3.48042, 6.130884,
-3.307196, -3.077305, -5.495135,
-3.307196, -3.077305, 6.130884,
-3.307196, 3.48042, -5.495135,
-3.307196, 3.48042, 6.130884,
-3.307196, -3.077305, -5.495135,
3.750934, -3.077305, -5.495135,
-3.307196, -3.077305, 6.130884,
3.750934, -3.077305, 6.130884,
-3.307196, 3.48042, -5.495135,
3.750934, 3.48042, -5.495135,
-3.307196, 3.48042, 6.130884,
3.750934, 3.48042, 6.130884,
3.750934, -3.077305, -5.495135,
3.750934, 3.48042, -5.495135,
3.750934, -3.077305, 6.130884,
3.750934, 3.48042, 6.130884,
3.750934, -3.077305, -5.495135,
3.750934, -3.077305, 6.130884,
3.750934, 3.48042, -5.495135,
3.750934, 3.48042, 6.130884
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
var radius = 8.06267;
var distance = 35.87173;
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
mvMatrix.translate( -0.2218688, -0.2015575, -0.3178744 );
mvMatrix.scale( 1.235103, 1.329351, 0.7498282 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.87173);
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
Chlormephos<-read.table("Chlormephos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlormephos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlormephos' not found
```

```r
y<-Chlormephos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlormephos' not found
```

```r
z<-Chlormephos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlormephos' not found
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
-3.204408, -0.3906279, -0.9963682, 0, 0, 1, 1, 1,
-3.023125, -0.1072164, -2.301734, 1, 0, 0, 1, 1,
-2.729793, -0.7032451, -2.442597, 1, 0, 0, 1, 1,
-2.598185, 0.9080409, -2.87555, 1, 0, 0, 1, 1,
-2.534437, 0.4921848, -2.098297, 1, 0, 0, 1, 1,
-2.502333, -1.675393, -1.935244, 1, 0, 0, 1, 1,
-2.483257, 0.1856631, -0.4310697, 0, 0, 0, 1, 1,
-2.452769, -1.25547, -2.938652, 0, 0, 0, 1, 1,
-2.435543, 0.08341141, -1.795292, 0, 0, 0, 1, 1,
-2.393067, 0.4453642, -2.138077, 0, 0, 0, 1, 1,
-2.341206, 0.6522246, -1.394226, 0, 0, 0, 1, 1,
-2.240505, -1.484309, -1.731682, 0, 0, 0, 1, 1,
-2.218457, -0.6433318, -1.7352, 0, 0, 0, 1, 1,
-2.202885, 0.03841605, -2.286137, 1, 1, 1, 1, 1,
-2.097191, 0.5522531, -1.713188, 1, 1, 1, 1, 1,
-2.076533, -0.7474099, -3.035752, 1, 1, 1, 1, 1,
-2.047917, -0.661984, -2.677707, 1, 1, 1, 1, 1,
-2.025382, -2.183961, -3.538878, 1, 1, 1, 1, 1,
-2.020961, 0.1345274, -2.46649, 1, 1, 1, 1, 1,
-2.017653, -0.01848172, -1.211425, 1, 1, 1, 1, 1,
-2.009813, -0.104518, -2.789013, 1, 1, 1, 1, 1,
-2.005897, -1.572542, -3.382248, 1, 1, 1, 1, 1,
-1.937424, 0.09351027, -1.163942, 1, 1, 1, 1, 1,
-1.920179, -1.810566, -3.958735, 1, 1, 1, 1, 1,
-1.896538, 0.3646689, -1.162463, 1, 1, 1, 1, 1,
-1.896527, 0.1651684, -2.891314, 1, 1, 1, 1, 1,
-1.894398, -0.639204, -1.224621, 1, 1, 1, 1, 1,
-1.887711, 0.8893028, -0.9423483, 1, 1, 1, 1, 1,
-1.886463, -1.243854, -1.99327, 0, 0, 1, 1, 1,
-1.875948, -0.2615104, -3.571805, 1, 0, 0, 1, 1,
-1.838582, 0.8996844, -0.9717378, 1, 0, 0, 1, 1,
-1.790333, -0.1660594, -2.618407, 1, 0, 0, 1, 1,
-1.784897, 1.530329, -0.8595186, 1, 0, 0, 1, 1,
-1.783431, -0.9943048, -0.4022232, 1, 0, 0, 1, 1,
-1.783176, -0.28083, -2.81688, 0, 0, 0, 1, 1,
-1.763701, -0.9476405, -0.2554875, 0, 0, 0, 1, 1,
-1.743614, -0.3694535, -1.728747, 0, 0, 0, 1, 1,
-1.733982, -0.0119886, -2.251052, 0, 0, 0, 1, 1,
-1.727059, -1.340172, -2.265497, 0, 0, 0, 1, 1,
-1.724386, 1.983293, -1.694108, 0, 0, 0, 1, 1,
-1.722882, 0.5465266, -1.07809, 0, 0, 0, 1, 1,
-1.702013, 0.9086369, -0.6601205, 1, 1, 1, 1, 1,
-1.69779, -0.6279221, -0.75503, 1, 1, 1, 1, 1,
-1.678052, -1.560255, -1.425823, 1, 1, 1, 1, 1,
-1.665631, 1.738198, -1.672662, 1, 1, 1, 1, 1,
-1.658458, -0.2875207, -2.053936, 1, 1, 1, 1, 1,
-1.645799, -0.9199308, -0.09569958, 1, 1, 1, 1, 1,
-1.636562, -0.6435351, -3.089854, 1, 1, 1, 1, 1,
-1.595504, -0.6617442, -1.892115, 1, 1, 1, 1, 1,
-1.577, -0.6306068, -0.597765, 1, 1, 1, 1, 1,
-1.575489, 0.8758115, -1.037731, 1, 1, 1, 1, 1,
-1.569691, -0.7712553, -1.053144, 1, 1, 1, 1, 1,
-1.569156, -0.5990653, -2.409594, 1, 1, 1, 1, 1,
-1.568388, -2.238177, -2.355142, 1, 1, 1, 1, 1,
-1.562794, 0.431115, -0.964628, 1, 1, 1, 1, 1,
-1.559147, -1.718585, -3.430481, 1, 1, 1, 1, 1,
-1.546355, -1.532753, -1.515901, 0, 0, 1, 1, 1,
-1.544866, 0.2953259, -1.901211, 1, 0, 0, 1, 1,
-1.524693, -0.6589246, -1.97923, 1, 0, 0, 1, 1,
-1.52281, -1.150276, -2.717855, 1, 0, 0, 1, 1,
-1.514565, -0.149452, -0.8448023, 1, 0, 0, 1, 1,
-1.503127, 0.5697623, -2.886482, 1, 0, 0, 1, 1,
-1.494034, 0.6468022, -0.9387867, 0, 0, 0, 1, 1,
-1.4856, 0.9439276, -1.247582, 0, 0, 0, 1, 1,
-1.484273, 0.2198528, 0.7620921, 0, 0, 0, 1, 1,
-1.484069, 0.66966, -1.115147, 0, 0, 0, 1, 1,
-1.48113, 1.351584, 0.3847593, 0, 0, 0, 1, 1,
-1.463619, 0.3068773, 0.06774936, 0, 0, 0, 1, 1,
-1.45998, 1.425412, -1.828973, 0, 0, 0, 1, 1,
-1.448232, 0.6327741, -1.221649, 1, 1, 1, 1, 1,
-1.43697, -1.042009, -1.428044, 1, 1, 1, 1, 1,
-1.428662, 0.681461, -2.213586, 1, 1, 1, 1, 1,
-1.423993, -1.08506, -0.630376, 1, 1, 1, 1, 1,
-1.420239, 0.4106328, -3.948186, 1, 1, 1, 1, 1,
-1.417989, 1.400101, -1.932892, 1, 1, 1, 1, 1,
-1.405199, 1.675813, -1.976924, 1, 1, 1, 1, 1,
-1.399482, -1.657259, -2.92948, 1, 1, 1, 1, 1,
-1.39662, -0.633144, -1.148681, 1, 1, 1, 1, 1,
-1.380219, 1.612046, 0.5170804, 1, 1, 1, 1, 1,
-1.373041, 0.02277317, -3.087318, 1, 1, 1, 1, 1,
-1.368304, 3.323169, 0.7399752, 1, 1, 1, 1, 1,
-1.363174, -0.7324634, -2.647469, 1, 1, 1, 1, 1,
-1.363036, -0.1879427, -1.852165, 1, 1, 1, 1, 1,
-1.351907, -0.2743486, -0.7535733, 1, 1, 1, 1, 1,
-1.340676, -0.2925205, -3.023, 0, 0, 1, 1, 1,
-1.334683, -0.7292534, -1.883572, 1, 0, 0, 1, 1,
-1.32998, 0.3370388, -1.442487, 1, 0, 0, 1, 1,
-1.321094, 0.8554421, -1.999747, 1, 0, 0, 1, 1,
-1.301318, 0.2175193, -2.435849, 1, 0, 0, 1, 1,
-1.299466, -0.1197885, 0.1720941, 1, 0, 0, 1, 1,
-1.298782, 1.162235, -0.4115934, 0, 0, 0, 1, 1,
-1.293518, 0.3083988, -1.290476, 0, 0, 0, 1, 1,
-1.291919, -1.217326, -2.413872, 0, 0, 0, 1, 1,
-1.284625, -1.276023, -2.514935, 0, 0, 0, 1, 1,
-1.278438, 0.7300966, -0.8661891, 0, 0, 0, 1, 1,
-1.276942, 0.3820619, -0.02478315, 0, 0, 0, 1, 1,
-1.269293, 0.1532875, -1.536173, 0, 0, 0, 1, 1,
-1.25393, -1.858282, -1.606091, 1, 1, 1, 1, 1,
-1.241011, -0.02637265, -0.2256169, 1, 1, 1, 1, 1,
-1.23914, -0.2275593, -2.618172, 1, 1, 1, 1, 1,
-1.228993, -1.151677, -1.897191, 1, 1, 1, 1, 1,
-1.221032, -0.9301533, -2.678003, 1, 1, 1, 1, 1,
-1.211265, -1.135206, -3.597877, 1, 1, 1, 1, 1,
-1.202211, -0.002830241, -2.906517, 1, 1, 1, 1, 1,
-1.195893, -0.2138897, -1.212557, 1, 1, 1, 1, 1,
-1.19479, 2.088499, -0.1882093, 1, 1, 1, 1, 1,
-1.189737, 1.714217, 0.5972573, 1, 1, 1, 1, 1,
-1.185659, 1.487869, -1.314655, 1, 1, 1, 1, 1,
-1.181967, -1.533485, -1.956699, 1, 1, 1, 1, 1,
-1.18149, 0.797663, -2.663074, 1, 1, 1, 1, 1,
-1.178787, 0.3079601, -2.270801, 1, 1, 1, 1, 1,
-1.168733, -1.909752, -1.063369, 1, 1, 1, 1, 1,
-1.149921, 0.1200841, -3.101925, 0, 0, 1, 1, 1,
-1.149773, -0.6599371, -2.115274, 1, 0, 0, 1, 1,
-1.1422, 0.7474849, 0.8757598, 1, 0, 0, 1, 1,
-1.139138, 0.1848553, 0.388228, 1, 0, 0, 1, 1,
-1.138334, -0.7346181, -5.325824, 1, 0, 0, 1, 1,
-1.128597, 0.6932521, 0.009232577, 1, 0, 0, 1, 1,
-1.125829, 1.385188, -0.2091514, 0, 0, 0, 1, 1,
-1.125299, 0.9906981, -2.124103, 0, 0, 0, 1, 1,
-1.124529, 1.272839, -1.190142, 0, 0, 0, 1, 1,
-1.124414, -0.6413974, -1.836553, 0, 0, 0, 1, 1,
-1.124406, -1.301138, -2.50943, 0, 0, 0, 1, 1,
-1.118139, 2.755031, -0.7079519, 0, 0, 0, 1, 1,
-1.117775, -0.2043329, -1.310867, 0, 0, 0, 1, 1,
-1.110582, 0.339969, -2.365607, 1, 1, 1, 1, 1,
-1.104671, -0.5111018, -1.625312, 1, 1, 1, 1, 1,
-1.101936, -0.6540463, -1.339418, 1, 1, 1, 1, 1,
-1.095115, -0.3139887, -0.4969057, 1, 1, 1, 1, 1,
-1.094749, -1.176183, -1.352199, 1, 1, 1, 1, 1,
-1.090031, -0.2745044, -1.223215, 1, 1, 1, 1, 1,
-1.084777, 0.07473803, -2.243998, 1, 1, 1, 1, 1,
-1.079706, -0.8551134, -2.443391, 1, 1, 1, 1, 1,
-1.072431, -0.6079468, -4.015662, 1, 1, 1, 1, 1,
-1.068284, 0.3764888, -0.7189685, 1, 1, 1, 1, 1,
-1.055554, 0.7316627, -2.104298, 1, 1, 1, 1, 1,
-1.048039, -0.2189155, -1.970789, 1, 1, 1, 1, 1,
-1.047022, -0.4512065, -4.257105, 1, 1, 1, 1, 1,
-1.043367, 0.6263334, -0.8122118, 1, 1, 1, 1, 1,
-1.041847, -2.057744, -2.91651, 1, 1, 1, 1, 1,
-1.041329, 0.06805861, -1.616908, 0, 0, 1, 1, 1,
-1.040486, -0.7251307, -1.431326, 1, 0, 0, 1, 1,
-1.03621, 0.5424505, -0.6656533, 1, 0, 0, 1, 1,
-1.035812, 0.07414726, -2.503028, 1, 0, 0, 1, 1,
-1.020731, 1.888898, 0.3052575, 1, 0, 0, 1, 1,
-1.019287, 1.319257, -0.08459556, 1, 0, 0, 1, 1,
-1.018901, 0.637121, -0.9696705, 0, 0, 0, 1, 1,
-1.016905, 0.2597488, -0.984565, 0, 0, 0, 1, 1,
-1.015029, -0.2952056, -2.5468, 0, 0, 0, 1, 1,
-1.011931, 1.543756, -0.5167857, 0, 0, 0, 1, 1,
-1.008043, 0.2813742, -0.2093214, 0, 0, 0, 1, 1,
-1.006161, -0.1317144, -0.4010095, 0, 0, 0, 1, 1,
-0.9989555, -1.936631, -1.872843, 0, 0, 0, 1, 1,
-0.9963057, -0.6141673, -2.45261, 1, 1, 1, 1, 1,
-0.9878134, 1.218063, 0.3004149, 1, 1, 1, 1, 1,
-0.9873378, -0.9052131, -2.555754, 1, 1, 1, 1, 1,
-0.9829699, 0.6340727, 1.181683, 1, 1, 1, 1, 1,
-0.981768, 1.875528, -0.4684075, 1, 1, 1, 1, 1,
-0.974225, -0.3104305, -2.625241, 1, 1, 1, 1, 1,
-0.9730944, -1.887328, -2.965652, 1, 1, 1, 1, 1,
-0.9728426, -1.255191, -1.506626, 1, 1, 1, 1, 1,
-0.9647927, 0.3902079, -1.477045, 1, 1, 1, 1, 1,
-0.9585775, -0.02458443, -2.010929, 1, 1, 1, 1, 1,
-0.9569889, 0.1918495, -0.4573127, 1, 1, 1, 1, 1,
-0.9552669, 0.6526605, -0.1900058, 1, 1, 1, 1, 1,
-0.954611, -1.245495, -1.409669, 1, 1, 1, 1, 1,
-0.9530016, -1.352922, -1.530333, 1, 1, 1, 1, 1,
-0.9516781, 0.4996101, 0.04463881, 1, 1, 1, 1, 1,
-0.9479488, -1.664659, -3.202263, 0, 0, 1, 1, 1,
-0.9474157, -0.01324403, -2.272208, 1, 0, 0, 1, 1,
-0.9460507, 1.53605, -0.6865207, 1, 0, 0, 1, 1,
-0.9421694, 0.05443018, -1.861549, 1, 0, 0, 1, 1,
-0.9410378, -1.132221, -2.738624, 1, 0, 0, 1, 1,
-0.9404365, 0.4626398, -1.75517, 1, 0, 0, 1, 1,
-0.9247177, -1.029642, -3.030532, 0, 0, 0, 1, 1,
-0.9228549, 0.2851776, 1.732143, 0, 0, 0, 1, 1,
-0.9217291, 0.7087172, -0.6887643, 0, 0, 0, 1, 1,
-0.9118488, -0.06384634, -1.857925, 0, 0, 0, 1, 1,
-0.9035453, -0.7547053, -2.398085, 0, 0, 0, 1, 1,
-0.9028537, 0.593642, -2.115101, 0, 0, 0, 1, 1,
-0.8934637, -0.7513304, -2.221745, 0, 0, 0, 1, 1,
-0.8877931, -0.480572, -2.235171, 1, 1, 1, 1, 1,
-0.8807618, -1.129586, -1.882862, 1, 1, 1, 1, 1,
-0.8802519, -0.1037104, -1.827193, 1, 1, 1, 1, 1,
-0.8785657, 1.381743, -0.1968653, 1, 1, 1, 1, 1,
-0.8663889, 0.3317899, -2.536153, 1, 1, 1, 1, 1,
-0.8629658, -2.040461, -1.574891, 1, 1, 1, 1, 1,
-0.8586568, -0.281792, -2.724832, 1, 1, 1, 1, 1,
-0.8544616, -0.301459, -4.17082, 1, 1, 1, 1, 1,
-0.8491592, 0.6983091, -0.6409012, 1, 1, 1, 1, 1,
-0.8489116, 0.6182913, -0.3645564, 1, 1, 1, 1, 1,
-0.8423793, -0.8191391, -2.412394, 1, 1, 1, 1, 1,
-0.8350145, 1.302791, -0.2898321, 1, 1, 1, 1, 1,
-0.8284052, 0.8882089, -0.4743349, 1, 1, 1, 1, 1,
-0.8216494, 0.4484048, -1.270203, 1, 1, 1, 1, 1,
-0.814527, -0.426547, -3.101624, 1, 1, 1, 1, 1,
-0.811947, -0.7849208, -1.969224, 0, 0, 1, 1, 1,
-0.8054995, -0.6539717, -0.9267302, 1, 0, 0, 1, 1,
-0.8033474, -0.06650329, -0.9955421, 1, 0, 0, 1, 1,
-0.798943, 0.3110433, -0.768936, 1, 0, 0, 1, 1,
-0.7987425, 0.4868535, 0.08860371, 1, 0, 0, 1, 1,
-0.7955669, -1.193596, -2.080108, 1, 0, 0, 1, 1,
-0.7929896, 0.04478764, 0.284226, 0, 0, 0, 1, 1,
-0.7865084, -0.3873135, -2.479581, 0, 0, 0, 1, 1,
-0.7840916, 0.09843794, -1.487258, 0, 0, 0, 1, 1,
-0.7828525, -0.08200752, 0.433605, 0, 0, 0, 1, 1,
-0.7785825, -1.077523, -2.202189, 0, 0, 0, 1, 1,
-0.7781739, -2.156773, -1.401706, 0, 0, 0, 1, 1,
-0.7681968, 1.114545, -0.6335505, 0, 0, 0, 1, 1,
-0.7657548, -0.3923588, -1.281471, 1, 1, 1, 1, 1,
-0.7583308, -0.4000193, -1.749665, 1, 1, 1, 1, 1,
-0.7564377, 0.630879, 0.2341383, 1, 1, 1, 1, 1,
-0.7519402, -0.5964341, -1.672565, 1, 1, 1, 1, 1,
-0.7508385, -0.2010773, -2.574731, 1, 1, 1, 1, 1,
-0.7503328, 0.2003299, -1.430856, 1, 1, 1, 1, 1,
-0.7365489, -0.9284136, -2.284992, 1, 1, 1, 1, 1,
-0.7330377, 1.264648, -1.104472, 1, 1, 1, 1, 1,
-0.7329494, -0.02709921, -2.38035, 1, 1, 1, 1, 1,
-0.7266255, -1.36198, -2.591765, 1, 1, 1, 1, 1,
-0.7234302, 0.1962037, -0.105854, 1, 1, 1, 1, 1,
-0.7224486, 0.5622414, -0.08424677, 1, 1, 1, 1, 1,
-0.7212303, 0.7986891, -1.388001, 1, 1, 1, 1, 1,
-0.711364, -0.7450114, -4.44931, 1, 1, 1, 1, 1,
-0.7113189, 1.197971, -2.061847, 1, 1, 1, 1, 1,
-0.7057645, 1.642808, -2.280088, 0, 0, 1, 1, 1,
-0.7045797, -0.446804, -1.817361, 1, 0, 0, 1, 1,
-0.7020229, -1.106351, -2.944382, 1, 0, 0, 1, 1,
-0.6972144, -0.1473172, -0.6566122, 1, 0, 0, 1, 1,
-0.6941727, 1.184129, -1.446579, 1, 0, 0, 1, 1,
-0.6927304, -0.08297009, -0.7101916, 1, 0, 0, 1, 1,
-0.6923929, 0.5893826, 0.3116181, 0, 0, 0, 1, 1,
-0.6885916, -1.545521, -2.783517, 0, 0, 0, 1, 1,
-0.6862655, 1.048619, -0.4625648, 0, 0, 0, 1, 1,
-0.6860358, -0.09712381, -0.5697361, 0, 0, 0, 1, 1,
-0.6826858, 0.1731989, -2.880965, 0, 0, 0, 1, 1,
-0.6823372, 1.696398, -1.028556, 0, 0, 0, 1, 1,
-0.6816661, -0.04992316, -1.477925, 0, 0, 0, 1, 1,
-0.665346, 1.291621, 1.524374, 1, 1, 1, 1, 1,
-0.6630111, -0.2937612, -0.9768562, 1, 1, 1, 1, 1,
-0.6610516, 0.1382537, -0.1810909, 1, 1, 1, 1, 1,
-0.6606709, 0.2630348, -2.695302, 1, 1, 1, 1, 1,
-0.6599373, 0.09839743, -3.146401, 1, 1, 1, 1, 1,
-0.6507583, -2.093495, -1.892008, 1, 1, 1, 1, 1,
-0.6507007, -0.9447432, -2.048844, 1, 1, 1, 1, 1,
-0.6493506, -0.480924, -2.566867, 1, 1, 1, 1, 1,
-0.6476507, -1.090726, -2.369691, 1, 1, 1, 1, 1,
-0.6472225, 0.07057472, -1.590487, 1, 1, 1, 1, 1,
-0.6458765, -1.635106, -1.843726, 1, 1, 1, 1, 1,
-0.6457462, -0.2354625, -3.212113, 1, 1, 1, 1, 1,
-0.6436109, -0.5949124, -1.947424, 1, 1, 1, 1, 1,
-0.6414005, 0.6037267, -1.255811, 1, 1, 1, 1, 1,
-0.6384743, 1.194435, -1.027176, 1, 1, 1, 1, 1,
-0.6379957, 0.6637648, -1.952439, 0, 0, 1, 1, 1,
-0.6351975, 0.7373235, -1.632971, 1, 0, 0, 1, 1,
-0.6333932, -0.2867739, -2.08759, 1, 0, 0, 1, 1,
-0.6320373, 2.922773, 0.2117721, 1, 0, 0, 1, 1,
-0.6309913, 1.083374, 0.4958293, 1, 0, 0, 1, 1,
-0.6261048, -1.253999, -4.302659, 1, 0, 0, 1, 1,
-0.6260083, 0.3494377, -1.744158, 0, 0, 0, 1, 1,
-0.625509, -0.1668234, -2.376533, 0, 0, 0, 1, 1,
-0.6242542, -0.01890996, -0.5661056, 0, 0, 0, 1, 1,
-0.6227955, 0.5379252, -0.9370056, 0, 0, 0, 1, 1,
-0.6198784, -0.4098088, -2.316056, 0, 0, 0, 1, 1,
-0.6127132, -1.472705, -4.12471, 0, 0, 0, 1, 1,
-0.6118062, 0.0631031, -2.217046, 0, 0, 0, 1, 1,
-0.6085455, -0.4185209, -3.037698, 1, 1, 1, 1, 1,
-0.6074944, 0.5134601, -1.219785, 1, 1, 1, 1, 1,
-0.6062025, 0.2531338, -2.761088, 1, 1, 1, 1, 1,
-0.6020299, -1.666409, -2.037058, 1, 1, 1, 1, 1,
-0.5978476, -0.5863287, -1.132978, 1, 1, 1, 1, 1,
-0.5949058, -2.174611, -2.198581, 1, 1, 1, 1, 1,
-0.5885316, -0.240201, -2.159057, 1, 1, 1, 1, 1,
-0.5851066, 0.4762862, -1.671308, 1, 1, 1, 1, 1,
-0.5850289, 0.3299955, -0.2607181, 1, 1, 1, 1, 1,
-0.5848761, 0.3442433, -0.03634952, 1, 1, 1, 1, 1,
-0.584268, 0.7917454, -1.038878, 1, 1, 1, 1, 1,
-0.58348, 1.056715, -0.5215595, 1, 1, 1, 1, 1,
-0.5820971, 0.06032935, -0.1428487, 1, 1, 1, 1, 1,
-0.5755808, 0.149277, -1.059248, 1, 1, 1, 1, 1,
-0.572951, -1.565556, -3.824332, 1, 1, 1, 1, 1,
-0.5722389, -1.190467, -3.172157, 0, 0, 1, 1, 1,
-0.5701333, 0.5760852, 0.1226068, 1, 0, 0, 1, 1,
-0.5681986, -0.2844796, -0.7456767, 1, 0, 0, 1, 1,
-0.5680851, -0.8444951, -2.568213, 1, 0, 0, 1, 1,
-0.5676523, -1.354473, -3.307964, 1, 0, 0, 1, 1,
-0.5667138, -1.373379, -4.005741, 1, 0, 0, 1, 1,
-0.5645607, 1.446159, -0.1984202, 0, 0, 0, 1, 1,
-0.5547724, 1.624664, 1.004772, 0, 0, 0, 1, 1,
-0.5539646, 0.7678938, -1.825215, 0, 0, 0, 1, 1,
-0.5518823, -1.378165, -2.404329, 0, 0, 0, 1, 1,
-0.5512106, -0.8517949, -1.37233, 0, 0, 0, 1, 1,
-0.5495307, 1.088014, -0.9993318, 0, 0, 0, 1, 1,
-0.546445, -0.01981127, -1.126033, 0, 0, 0, 1, 1,
-0.5440482, -0.820786, -2.870274, 1, 1, 1, 1, 1,
-0.5440136, 1.25814, -0.7961288, 1, 1, 1, 1, 1,
-0.5217677, -0.231087, -1.496436, 1, 1, 1, 1, 1,
-0.5212519, -0.5606623, -1.223213, 1, 1, 1, 1, 1,
-0.5196208, -0.1878849, -3.988288, 1, 1, 1, 1, 1,
-0.5184143, 0.761646, -0.6328812, 1, 1, 1, 1, 1,
-0.5136151, 1.072782, -0.587894, 1, 1, 1, 1, 1,
-0.5132831, 0.09644631, -1.15307, 1, 1, 1, 1, 1,
-0.5125725, -0.4090014, -0.7787414, 1, 1, 1, 1, 1,
-0.5071383, -0.3154128, -2.292402, 1, 1, 1, 1, 1,
-0.505249, 0.4379981, -1.654636, 1, 1, 1, 1, 1,
-0.5045741, 1.011294, -0.8794318, 1, 1, 1, 1, 1,
-0.5003451, 1.746037, -1.002254, 1, 1, 1, 1, 1,
-0.4933684, -0.3805178, -0.7518395, 1, 1, 1, 1, 1,
-0.4879828, 0.3713432, 0.1966122, 1, 1, 1, 1, 1,
-0.4858842, -2.12817, -1.854358, 0, 0, 1, 1, 1,
-0.4836224, -1.243581, -1.518994, 1, 0, 0, 1, 1,
-0.4828057, -0.2156837, -2.810629, 1, 0, 0, 1, 1,
-0.4795596, -0.3112108, -1.351277, 1, 0, 0, 1, 1,
-0.4733565, -0.7498263, -2.277677, 1, 0, 0, 1, 1,
-0.4713397, 0.8982893, -0.699714, 1, 0, 0, 1, 1,
-0.469398, -0.4451672, -1.255526, 0, 0, 0, 1, 1,
-0.4670865, 0.9699398, 0.5669586, 0, 0, 0, 1, 1,
-0.4629856, 0.04736172, -2.750629, 0, 0, 0, 1, 1,
-0.4599316, -0.3149981, -1.849496, 0, 0, 0, 1, 1,
-0.4582045, -0.009446823, -2.177505, 0, 0, 0, 1, 1,
-0.4581203, -0.6691874, -2.687744, 0, 0, 0, 1, 1,
-0.4521926, -0.2598665, -2.887272, 0, 0, 0, 1, 1,
-0.4520625, 1.703724, -0.7256986, 1, 1, 1, 1, 1,
-0.4497883, 0.5805208, -2.147746, 1, 1, 1, 1, 1,
-0.4481375, 0.06832239, -2.14065, 1, 1, 1, 1, 1,
-0.4479809, 0.4108475, 1.177839, 1, 1, 1, 1, 1,
-0.447074, 0.1768782, -0.9004986, 1, 1, 1, 1, 1,
-0.4455386, -0.523629, -0.6087129, 1, 1, 1, 1, 1,
-0.4412746, -0.8382216, -2.191162, 1, 1, 1, 1, 1,
-0.4407569, -0.08076275, -1.683804, 1, 1, 1, 1, 1,
-0.4353298, 0.02465901, -1.308807, 1, 1, 1, 1, 1,
-0.4350912, -0.4174813, -1.733834, 1, 1, 1, 1, 1,
-0.4337299, -0.9366409, -2.138894, 1, 1, 1, 1, 1,
-0.4321362, -0.2018404, 0.166423, 1, 1, 1, 1, 1,
-0.4296004, -0.03096353, -2.417201, 1, 1, 1, 1, 1,
-0.4288408, -0.1055112, -3.1644, 1, 1, 1, 1, 1,
-0.4268878, 1.379278, -0.5365078, 1, 1, 1, 1, 1,
-0.4252682, -1.390654, -4.123112, 0, 0, 1, 1, 1,
-0.4220392, -0.4457026, -2.117529, 1, 0, 0, 1, 1,
-0.4172747, -0.5255957, -1.316024, 1, 0, 0, 1, 1,
-0.4156033, -1.505569, -2.272663, 1, 0, 0, 1, 1,
-0.4149674, 0.1264526, -1.525777, 1, 0, 0, 1, 1,
-0.4143105, -0.3491287, -1.64444, 1, 0, 0, 1, 1,
-0.4113476, 1.068604, -0.4651771, 0, 0, 0, 1, 1,
-0.4106628, -0.4888187, -3.91999, 0, 0, 0, 1, 1,
-0.4056004, -1.238088, -5.255875, 0, 0, 0, 1, 1,
-0.4005342, -0.8059657, -3.662198, 0, 0, 0, 1, 1,
-0.4004808, -1.016365, -3.995116, 0, 0, 0, 1, 1,
-0.3958612, -0.2330316, -1.864617, 0, 0, 0, 1, 1,
-0.3888084, 1.829989, -1.415096, 0, 0, 0, 1, 1,
-0.3808894, 0.2013779, -1.206554, 1, 1, 1, 1, 1,
-0.3806784, -0.4455809, -2.139182, 1, 1, 1, 1, 1,
-0.3805195, -2.115894, -4.269287, 1, 1, 1, 1, 1,
-0.3775518, 0.4213849, 1.389437, 1, 1, 1, 1, 1,
-0.372543, -0.3181454, -2.359083, 1, 1, 1, 1, 1,
-0.3695219, -0.3021616, -1.980292, 1, 1, 1, 1, 1,
-0.3621056, -0.207075, -2.35329, 1, 1, 1, 1, 1,
-0.3604724, 0.08258858, -1.225887, 1, 1, 1, 1, 1,
-0.358926, -0.08127964, -1.260111, 1, 1, 1, 1, 1,
-0.3588302, 1.781365, -0.09348121, 1, 1, 1, 1, 1,
-0.3581518, -1.689106, -1.592853, 1, 1, 1, 1, 1,
-0.3545208, -0.02714787, -1.582715, 1, 1, 1, 1, 1,
-0.3529269, -1.417009, -1.652343, 1, 1, 1, 1, 1,
-0.3503879, -0.1620593, -0.414614, 1, 1, 1, 1, 1,
-0.3498226, 1.353568, -0.9560154, 1, 1, 1, 1, 1,
-0.3442583, 0.3402252, -1.950776, 0, 0, 1, 1, 1,
-0.3358712, -0.4040692, -1.313679, 1, 0, 0, 1, 1,
-0.3332829, 0.7369843, -0.3565523, 1, 0, 0, 1, 1,
-0.3325099, 1.431672, -0.5743536, 1, 0, 0, 1, 1,
-0.3317457, -0.9948053, -2.747833, 1, 0, 0, 1, 1,
-0.3313308, 1.405786, 0.3037979, 1, 0, 0, 1, 1,
-0.3272024, -1.432541, -1.718992, 0, 0, 0, 1, 1,
-0.3227099, -1.678747, -2.313329, 0, 0, 0, 1, 1,
-0.32055, 0.4552464, 0.3740467, 0, 0, 0, 1, 1,
-0.3199591, -1.128506, -4.522583, 0, 0, 0, 1, 1,
-0.3153247, 1.867855, -0.1810991, 0, 0, 0, 1, 1,
-0.3097889, -1.271218, -2.141134, 0, 0, 0, 1, 1,
-0.3047092, 0.346464, -0.6900069, 0, 0, 0, 1, 1,
-0.304257, -0.3640901, -2.349222, 1, 1, 1, 1, 1,
-0.2971235, 1.698664, 0.7205259, 1, 1, 1, 1, 1,
-0.2940647, 1.475015, -0.7836283, 1, 1, 1, 1, 1,
-0.2922839, 0.864941, -0.5505092, 1, 1, 1, 1, 1,
-0.2916075, 0.09039278, -1.280881, 1, 1, 1, 1, 1,
-0.2914562, -0.610674, -2.227698, 1, 1, 1, 1, 1,
-0.2912311, 0.6667018, -4.683704, 1, 1, 1, 1, 1,
-0.290706, -0.4958827, -3.443123, 1, 1, 1, 1, 1,
-0.2818339, -0.01055603, -1.520125, 1, 1, 1, 1, 1,
-0.2811597, 1.594288, -1.621868, 1, 1, 1, 1, 1,
-0.2757561, 0.4295803, -0.86207, 1, 1, 1, 1, 1,
-0.2706063, -1.50369, -3.494339, 1, 1, 1, 1, 1,
-0.2671663, -0.3652912, -3.781978, 1, 1, 1, 1, 1,
-0.2640408, -0.05455093, -0.5939268, 1, 1, 1, 1, 1,
-0.2617, -1.028951, -2.762642, 1, 1, 1, 1, 1,
-0.2603522, -1.08977, -3.235458, 0, 0, 1, 1, 1,
-0.259543, 2.062257, 1.277241, 1, 0, 0, 1, 1,
-0.2591508, 0.7110592, 0.629152, 1, 0, 0, 1, 1,
-0.2574622, 1.1362, -0.1121015, 1, 0, 0, 1, 1,
-0.2571668, 0.1354728, -1.301475, 1, 0, 0, 1, 1,
-0.2570484, 2.014591, -0.2299605, 1, 0, 0, 1, 1,
-0.2531801, 1.119435, 0.9674433, 0, 0, 0, 1, 1,
-0.249269, 0.2727281, -3.806413, 0, 0, 0, 1, 1,
-0.2449693, -0.230759, -1.443609, 0, 0, 0, 1, 1,
-0.2416109, -1.025266, -2.001583, 0, 0, 0, 1, 1,
-0.2401455, -0.9876701, -2.162634, 0, 0, 0, 1, 1,
-0.2338102, -0.6102216, -3.462918, 0, 0, 0, 1, 1,
-0.2295044, 0.4301175, -0.5914498, 0, 0, 0, 1, 1,
-0.2221541, 0.3845357, -0.1895223, 1, 1, 1, 1, 1,
-0.2125031, 0.4870425, 1.350793, 1, 1, 1, 1, 1,
-0.2062492, -1.089079, -1.742312, 1, 1, 1, 1, 1,
-0.2017461, -0.3995349, -4.041526, 1, 1, 1, 1, 1,
-0.200053, 1.247872, 0.7847318, 1, 1, 1, 1, 1,
-0.1998215, -0.4732195, -3.584867, 1, 1, 1, 1, 1,
-0.1933742, -0.1902339, -1.325799, 1, 1, 1, 1, 1,
-0.193165, -1.201115, -1.78828, 1, 1, 1, 1, 1,
-0.1879374, 0.6050347, 1.269888, 1, 1, 1, 1, 1,
-0.18357, 1.519274, -0.04915401, 1, 1, 1, 1, 1,
-0.1834819, -0.9724634, -2.757136, 1, 1, 1, 1, 1,
-0.1821034, -1.038485, -2.443087, 1, 1, 1, 1, 1,
-0.1818334, -0.05773138, -3.430241, 1, 1, 1, 1, 1,
-0.1809531, 0.3094217, -0.09811933, 1, 1, 1, 1, 1,
-0.1733141, 1.482671, 1.000615, 1, 1, 1, 1, 1,
-0.1714827, 1.971721, -0.7317515, 0, 0, 1, 1, 1,
-0.168368, 0.2783305, 0.2417764, 1, 0, 0, 1, 1,
-0.1660247, 0.5857407, -0.2844658, 1, 0, 0, 1, 1,
-0.1648585, -0.8233851, -3.270372, 1, 0, 0, 1, 1,
-0.16376, 0.2417993, 0.008214025, 1, 0, 0, 1, 1,
-0.1631622, 1.715205, -1.451059, 1, 0, 0, 1, 1,
-0.160845, 0.7054697, 0.6132601, 0, 0, 0, 1, 1,
-0.1607792, 0.298509, 1.057028, 0, 0, 0, 1, 1,
-0.1587484, -0.2198336, -2.864837, 0, 0, 0, 1, 1,
-0.1572354, 0.03908589, -0.901064, 0, 0, 0, 1, 1,
-0.1562427, 0.1747244, -2.076406, 0, 0, 0, 1, 1,
-0.1523376, -0.4541488, -3.71187, 0, 0, 0, 1, 1,
-0.1507357, 0.6826258, -1.137843, 0, 0, 0, 1, 1,
-0.1412837, 0.4780404, -2.007556, 1, 1, 1, 1, 1,
-0.1407219, -0.8407974, -2.89957, 1, 1, 1, 1, 1,
-0.1387925, 0.04987092, -1.995144, 1, 1, 1, 1, 1,
-0.1387047, -1.351806, -1.601815, 1, 1, 1, 1, 1,
-0.1369098, -0.2791381, -2.710051, 1, 1, 1, 1, 1,
-0.1359092, 0.4059128, 0.4866399, 1, 1, 1, 1, 1,
-0.1355042, -0.4856384, -1.661652, 1, 1, 1, 1, 1,
-0.132298, 0.3162998, -0.5000467, 1, 1, 1, 1, 1,
-0.1174271, -0.3046149, -3.810524, 1, 1, 1, 1, 1,
-0.1142495, 0.1679645, 0.005302168, 1, 1, 1, 1, 1,
-0.1121812, -1.832666, -4.189874, 1, 1, 1, 1, 1,
-0.1120035, 0.5081894, 0.9366397, 1, 1, 1, 1, 1,
-0.110239, -0.3317335, -2.99874, 1, 1, 1, 1, 1,
-0.1038654, 0.3798269, 0.5519043, 1, 1, 1, 1, 1,
-0.1026341, 0.8677884, -0.05822719, 1, 1, 1, 1, 1,
-0.102275, 0.094778, -1.985152, 0, 0, 1, 1, 1,
-0.1008529, 0.8027945, -0.1643065, 1, 0, 0, 1, 1,
-0.09520454, 0.4491429, 0.1443614, 1, 0, 0, 1, 1,
-0.09294816, -1.020918, -3.744526, 1, 0, 0, 1, 1,
-0.09285618, 0.1068638, -0.9198587, 1, 0, 0, 1, 1,
-0.08958305, 1.576377, 1.975312, 1, 0, 0, 1, 1,
-0.08827438, -1.579852, -3.973755, 0, 0, 0, 1, 1,
-0.08640278, 0.01157195, -2.037795, 0, 0, 0, 1, 1,
-0.08445106, 0.7115634, -0.02881678, 0, 0, 0, 1, 1,
-0.0816806, -0.3766299, -3.793546, 0, 0, 0, 1, 1,
-0.07890531, -1.04038, -3.87882, 0, 0, 0, 1, 1,
-0.07805431, 0.6485196, 0.555865, 0, 0, 0, 1, 1,
-0.07708177, 0.816109, 0.06463453, 0, 0, 0, 1, 1,
-0.07327549, -0.4914261, -2.85252, 1, 1, 1, 1, 1,
-0.07167451, -0.7680153, -3.058844, 1, 1, 1, 1, 1,
-0.06982673, -0.05655368, -0.5710946, 1, 1, 1, 1, 1,
-0.06833226, 0.5040411, 0.5572716, 1, 1, 1, 1, 1,
-0.06061668, 0.563484, 1.174665, 1, 1, 1, 1, 1,
-0.05532141, -0.4087676, -3.122339, 1, 1, 1, 1, 1,
-0.05263498, -0.4261908, -2.094823, 1, 1, 1, 1, 1,
-0.0464419, -2.981804, -4.955017, 1, 1, 1, 1, 1,
-0.04127451, 0.2445622, -0.7290124, 1, 1, 1, 1, 1,
-0.03966534, 1.258419, -0.440808, 1, 1, 1, 1, 1,
-0.03426853, 1.771754, -0.08293068, 1, 1, 1, 1, 1,
-0.03037639, 0.5262635, -0.05096048, 1, 1, 1, 1, 1,
-0.029185, -0.07339925, -3.438339, 1, 1, 1, 1, 1,
-0.02582679, 0.4999098, -0.2288479, 1, 1, 1, 1, 1,
-0.02467683, -1.681208, -2.921658, 1, 1, 1, 1, 1,
-0.02136025, 2.005001, 1.182117, 0, 0, 1, 1, 1,
-0.01562478, 0.2523723, -0.2080002, 1, 0, 0, 1, 1,
-0.01191156, 0.1778146, 2.043944, 1, 0, 0, 1, 1,
-0.01167577, 0.1856626, 1.831718, 1, 0, 0, 1, 1,
-0.01154257, 3.307039, 0.4887188, 1, 0, 0, 1, 1,
-0.009763346, 0.3296277, 1.028633, 1, 0, 0, 1, 1,
-0.009441532, -1.218447, -2.357015, 0, 0, 0, 1, 1,
-0.00659556, -1.139634, -2.481694, 0, 0, 0, 1, 1,
-0.004181833, -0.7812973, -3.551324, 0, 0, 0, 1, 1,
-0.001410034, 1.591131, 0.4884585, 0, 0, 0, 1, 1,
0.0009969909, -0.5152, 4.597332, 0, 0, 0, 1, 1,
0.002660268, -0.3617936, 3.477284, 0, 0, 0, 1, 1,
0.002914331, 0.1553241, 0.7631454, 0, 0, 0, 1, 1,
0.00506869, 0.7986574, -1.423549, 1, 1, 1, 1, 1,
0.005702719, 0.1449779, 1.38151, 1, 1, 1, 1, 1,
0.008379528, -0.6534846, 3.753832, 1, 1, 1, 1, 1,
0.008456885, 0.2537113, -0.6502284, 1, 1, 1, 1, 1,
0.01194755, -0.7077805, 3.124383, 1, 1, 1, 1, 1,
0.01194876, -0.8314958, 2.302408, 1, 1, 1, 1, 1,
0.01220476, 1.852679, -0.4759735, 1, 1, 1, 1, 1,
0.01272995, 2.280735, -1.021345, 1, 1, 1, 1, 1,
0.01472536, 1.095515, 0.1374959, 1, 1, 1, 1, 1,
0.01571338, 0.9203936, -0.4287482, 1, 1, 1, 1, 1,
0.0163746, -0.8385704, 4.13021, 1, 1, 1, 1, 1,
0.01876206, -1.588093, 2.514569, 1, 1, 1, 1, 1,
0.02280852, -0.3946326, 2.634599, 1, 1, 1, 1, 1,
0.02344112, 0.7756109, 0.8144297, 1, 1, 1, 1, 1,
0.0259023, 0.7031372, -0.1093068, 1, 1, 1, 1, 1,
0.02753499, 1.146552, -0.6003551, 0, 0, 1, 1, 1,
0.02800493, -0.5301082, 4.022059, 1, 0, 0, 1, 1,
0.03202729, 1.019914, -1.212662, 1, 0, 0, 1, 1,
0.03518105, 0.6529013, -1.478909, 1, 0, 0, 1, 1,
0.03673396, -0.7634391, 4.01443, 1, 0, 0, 1, 1,
0.04894409, 0.4163002, -0.9782103, 1, 0, 0, 1, 1,
0.05044736, -2.169366, 2.022001, 0, 0, 0, 1, 1,
0.0566237, -1.184687, 2.112072, 0, 0, 0, 1, 1,
0.05715071, -0.8673038, 1.160685, 0, 0, 0, 1, 1,
0.05893488, 1.294518, 0.6580186, 0, 0, 0, 1, 1,
0.06684513, -0.03912823, 2.999242, 0, 0, 0, 1, 1,
0.06728511, 0.4517152, 0.1804926, 0, 0, 0, 1, 1,
0.06782518, -1.190798, 5.961573, 0, 0, 0, 1, 1,
0.06821547, 0.357198, 0.0817013, 1, 1, 1, 1, 1,
0.07059813, -1.066861, 3.108815, 1, 1, 1, 1, 1,
0.07314399, -0.476917, 2.93564, 1, 1, 1, 1, 1,
0.07319996, 0.13313, 0.8087298, 1, 1, 1, 1, 1,
0.07824969, -0.1512079, 2.125792, 1, 1, 1, 1, 1,
0.07929175, -0.2919429, 2.122585, 1, 1, 1, 1, 1,
0.08305365, 1.058047, 0.1376334, 1, 1, 1, 1, 1,
0.08655898, -0.06143018, 1.913265, 1, 1, 1, 1, 1,
0.0948204, 3.384919, 2.083956, 1, 1, 1, 1, 1,
0.09536372, -0.9132735, 2.628431, 1, 1, 1, 1, 1,
0.09888582, 1.046677, 0.8020255, 1, 1, 1, 1, 1,
0.09936067, -0.2523323, 2.036306, 1, 1, 1, 1, 1,
0.1010918, -0.7009307, 3.246569, 1, 1, 1, 1, 1,
0.1053581, 0.1904368, 0.2886362, 1, 1, 1, 1, 1,
0.1072053, -0.6274163, 2.806419, 1, 1, 1, 1, 1,
0.1148366, 0.2464884, -0.02163846, 0, 0, 1, 1, 1,
0.1157151, -1.021394, 2.076622, 1, 0, 0, 1, 1,
0.1198913, 0.316092, 0.6381338, 1, 0, 0, 1, 1,
0.1205984, -1.256997, 4.020498, 1, 0, 0, 1, 1,
0.1210907, -0.6186371, 2.094605, 1, 0, 0, 1, 1,
0.1214273, 0.2375866, 1.587587, 1, 0, 0, 1, 1,
0.122053, -0.4118285, 3.776869, 0, 0, 0, 1, 1,
0.1301122, -1.618936, 4.303759, 0, 0, 0, 1, 1,
0.1308936, -0.8194662, 2.317964, 0, 0, 0, 1, 1,
0.1328454, 1.147944, 1.415558, 0, 0, 0, 1, 1,
0.1356653, 1.462218, 0.5205775, 0, 0, 0, 1, 1,
0.1397177, 1.155384, -1.684076, 0, 0, 0, 1, 1,
0.144775, -0.1015244, 1.936518, 0, 0, 0, 1, 1,
0.1487463, 0.4583367, 0.2395789, 1, 1, 1, 1, 1,
0.1537466, 0.5457357, 1.076885, 1, 1, 1, 1, 1,
0.1560985, -1.155029, 2.13477, 1, 1, 1, 1, 1,
0.1663893, 0.3128173, 1.073058, 1, 1, 1, 1, 1,
0.1680149, 1.095214, 1.220074, 1, 1, 1, 1, 1,
0.1702098, 0.9530216, 1.101386, 1, 1, 1, 1, 1,
0.170745, -1.524318, 0.9823461, 1, 1, 1, 1, 1,
0.1709203, -1.285882, 1.884952, 1, 1, 1, 1, 1,
0.1736837, -0.8554455, 2.006155, 1, 1, 1, 1, 1,
0.1741768, -0.1715816, 3.028082, 1, 1, 1, 1, 1,
0.1742848, -1.758189, 1.728559, 1, 1, 1, 1, 1,
0.1763024, 0.5176621, 0.7369148, 1, 1, 1, 1, 1,
0.1775696, -0.211037, 1.397122, 1, 1, 1, 1, 1,
0.1785325, -0.2287574, 0.6889438, 1, 1, 1, 1, 1,
0.1800085, 0.06705661, 0.7336851, 1, 1, 1, 1, 1,
0.18025, -0.5892814, 4.832133, 0, 0, 1, 1, 1,
0.1805415, -2.359301, 2.289534, 1, 0, 0, 1, 1,
0.1806859, 0.5117542, -0.2139055, 1, 0, 0, 1, 1,
0.1886151, -0.4130575, 1.821785, 1, 0, 0, 1, 1,
0.191861, -2.088272, 4.814085, 1, 0, 0, 1, 1,
0.1943199, -1.253524, 4.126207, 1, 0, 0, 1, 1,
0.1943341, -0.4385266, 2.334717, 0, 0, 0, 1, 1,
0.1952889, 0.7254976, -0.04276982, 0, 0, 0, 1, 1,
0.1961611, 1.451037, -0.7854452, 0, 0, 0, 1, 1,
0.1986186, -1.29101, 4.751793, 0, 0, 0, 1, 1,
0.1986622, -0.1974272, 3.916845, 0, 0, 0, 1, 1,
0.2008526, -0.456589, 2.959461, 0, 0, 0, 1, 1,
0.2080249, -1.373577, 1.809923, 0, 0, 0, 1, 1,
0.2083868, -0.6520916, 1.62064, 1, 1, 1, 1, 1,
0.2093101, 0.5231071, 1.401854, 1, 1, 1, 1, 1,
0.2095802, 1.401379, -0.3349578, 1, 1, 1, 1, 1,
0.2096668, 0.1220616, 0.09623794, 1, 1, 1, 1, 1,
0.2125429, 0.5708835, 0.4409844, 1, 1, 1, 1, 1,
0.2151278, 0.07748941, -0.1016637, 1, 1, 1, 1, 1,
0.2154326, 0.5914291, 0.4398529, 1, 1, 1, 1, 1,
0.2155149, -0.5438206, 4.015388, 1, 1, 1, 1, 1,
0.2160217, -1.088388, 1.470944, 1, 1, 1, 1, 1,
0.2221677, 1.396454, -0.06607579, 1, 1, 1, 1, 1,
0.2236409, -0.5050299, 2.413153, 1, 1, 1, 1, 1,
0.2237916, -0.5266436, 1.424448, 1, 1, 1, 1, 1,
0.2238239, 0.7677286, 0.2590068, 1, 1, 1, 1, 1,
0.2248086, -2.109975, 4.119324, 1, 1, 1, 1, 1,
0.2254705, 0.6222932, -0.0279561, 1, 1, 1, 1, 1,
0.2268172, -0.6453384, 2.319336, 0, 0, 1, 1, 1,
0.2291943, -2.385824, 4.366457, 1, 0, 0, 1, 1,
0.2293217, 0.4648832, 1.314402, 1, 0, 0, 1, 1,
0.2305345, 1.163078, -0.9542425, 1, 0, 0, 1, 1,
0.2354528, 0.02128453, 2.659123, 1, 0, 0, 1, 1,
0.2366417, -0.7816244, 0.3771932, 1, 0, 0, 1, 1,
0.237016, -1.294889, 3.486622, 0, 0, 0, 1, 1,
0.2380656, -0.4830967, 0.8264057, 0, 0, 0, 1, 1,
0.2412886, 2.246233, -0.07608489, 0, 0, 0, 1, 1,
0.2472931, 0.8238673, -0.05842874, 0, 0, 0, 1, 1,
0.24764, -0.4929013, 2.47862, 0, 0, 0, 1, 1,
0.2501857, 0.2561039, 1.643703, 0, 0, 0, 1, 1,
0.2526084, 0.1722029, 1.998615, 0, 0, 0, 1, 1,
0.2586531, -1.125257, 3.140593, 1, 1, 1, 1, 1,
0.2593497, 1.429498, -0.1944818, 1, 1, 1, 1, 1,
0.2598275, -0.4975523, 4.082902, 1, 1, 1, 1, 1,
0.2679721, -1.153191, 4.124109, 1, 1, 1, 1, 1,
0.2703627, -1.427722, 1.534108, 1, 1, 1, 1, 1,
0.2707554, -0.06747072, 1.762206, 1, 1, 1, 1, 1,
0.2733656, 1.184507, -0.9883689, 1, 1, 1, 1, 1,
0.2803055, 0.2568664, 0.7707229, 1, 1, 1, 1, 1,
0.2803918, -0.5705171, 0.4023987, 1, 1, 1, 1, 1,
0.280674, 0.2442528, 1.946654, 1, 1, 1, 1, 1,
0.2814872, 0.08891736, 1.970437, 1, 1, 1, 1, 1,
0.2824962, -2.030568, 2.864121, 1, 1, 1, 1, 1,
0.2840634, 1.002927, -0.4144982, 1, 1, 1, 1, 1,
0.2857759, 1.409125, 0.8974701, 1, 1, 1, 1, 1,
0.288689, -0.268857, 1.794152, 1, 1, 1, 1, 1,
0.2888643, -1.675572, 2.626538, 0, 0, 1, 1, 1,
0.2929929, 1.838341, 2.013619, 1, 0, 0, 1, 1,
0.2938085, -0.4902433, 2.712867, 1, 0, 0, 1, 1,
0.2954101, -0.2021921, 1.749479, 1, 0, 0, 1, 1,
0.304196, 0.4911042, -0.8911822, 1, 0, 0, 1, 1,
0.3044859, -1.061582, 1.893146, 1, 0, 0, 1, 1,
0.3158376, 0.4650078, 0.01154481, 0, 0, 0, 1, 1,
0.3175505, -0.3954814, 1.647884, 0, 0, 0, 1, 1,
0.3198766, 0.1490738, 1.089195, 0, 0, 0, 1, 1,
0.3210504, -2.251164, 3.485275, 0, 0, 0, 1, 1,
0.3230931, 0.3260551, -0.119796, 0, 0, 0, 1, 1,
0.3265381, 0.1650222, 1.637007, 0, 0, 0, 1, 1,
0.3343848, 0.2612014, -0.1362308, 0, 0, 0, 1, 1,
0.3368836, -1.778332, 3.037946, 1, 1, 1, 1, 1,
0.3374486, -0.461763, 2.039253, 1, 1, 1, 1, 1,
0.3543973, 1.236396, 0.2292588, 1, 1, 1, 1, 1,
0.3609375, 0.5027614, 0.6969597, 1, 1, 1, 1, 1,
0.3624561, -0.6456537, 3.695374, 1, 1, 1, 1, 1,
0.3653884, 1.531574, 3.244447, 1, 1, 1, 1, 1,
0.366334, -0.3898627, 1.679392, 1, 1, 1, 1, 1,
0.3681744, 0.7595866, 0.1949399, 1, 1, 1, 1, 1,
0.3707205, 1.917007, 0.5405054, 1, 1, 1, 1, 1,
0.3798007, 1.631515, -0.559404, 1, 1, 1, 1, 1,
0.3874332, -0.7260821, 2.452807, 1, 1, 1, 1, 1,
0.3899343, 1.615345, 0.3843721, 1, 1, 1, 1, 1,
0.3909753, 0.6628816, 0.4122331, 1, 1, 1, 1, 1,
0.3913044, 0.6204674, -0.4926023, 1, 1, 1, 1, 1,
0.3930111, 1.156369, 2.548459, 1, 1, 1, 1, 1,
0.395984, -0.6727746, 2.240607, 0, 0, 1, 1, 1,
0.3967637, 1.619155, 0.3584752, 1, 0, 0, 1, 1,
0.3976534, -0.1789421, 0.8463192, 1, 0, 0, 1, 1,
0.4046767, 1.040809, 1.760956, 1, 0, 0, 1, 1,
0.4068111, -0.4542426, 3.749105, 1, 0, 0, 1, 1,
0.4128699, 0.7151428, -0.5863672, 1, 0, 0, 1, 1,
0.4142807, -0.8443198, 2.495218, 0, 0, 0, 1, 1,
0.4159618, -0.05523768, 1.450665, 0, 0, 0, 1, 1,
0.4185791, 0.4977067, 2.396585, 0, 0, 0, 1, 1,
0.4240838, 0.6445655, -0.6206733, 0, 0, 0, 1, 1,
0.4260728, 0.06012397, 1.125964, 0, 0, 0, 1, 1,
0.4274006, -0.759948, 3.942868, 0, 0, 0, 1, 1,
0.4313293, -2.259756, 3.996621, 0, 0, 0, 1, 1,
0.4361682, 0.2317599, 0.992753, 1, 1, 1, 1, 1,
0.4450272, 1.314016, 0.5328375, 1, 1, 1, 1, 1,
0.4482061, -0.7363163, 3.970234, 1, 1, 1, 1, 1,
0.448622, -0.2174674, 1.883046, 1, 1, 1, 1, 1,
0.4489325, -0.4393464, 3.58727, 1, 1, 1, 1, 1,
0.4508623, -0.0002748248, 3.186733, 1, 1, 1, 1, 1,
0.4568338, 0.7411337, 0.2967107, 1, 1, 1, 1, 1,
0.4574509, 0.02533997, 0.5334212, 1, 1, 1, 1, 1,
0.4585504, -0.5906126, 1.389681, 1, 1, 1, 1, 1,
0.4586442, 0.08652265, 2.097818, 1, 1, 1, 1, 1,
0.4628438, -0.78284, 3.133343, 1, 1, 1, 1, 1,
0.4633918, 0.1112431, 1.17812, 1, 1, 1, 1, 1,
0.4644367, -2.308576, 3.20628, 1, 1, 1, 1, 1,
0.4650311, -0.6461134, 2.591769, 1, 1, 1, 1, 1,
0.4650626, 1.297994, -0.4671403, 1, 1, 1, 1, 1,
0.46662, -1.353348, 3.711517, 0, 0, 1, 1, 1,
0.4719633, -0.6947597, 2.23852, 1, 0, 0, 1, 1,
0.4732983, 0.9779195, 0.09475599, 1, 0, 0, 1, 1,
0.4820256, 0.4239083, 1.901382, 1, 0, 0, 1, 1,
0.4829143, 0.1497449, 1.960617, 1, 0, 0, 1, 1,
0.4837714, -0.8259853, 1.005213, 1, 0, 0, 1, 1,
0.4882357, -0.7936717, 1.760886, 0, 0, 0, 1, 1,
0.4921257, -1.570371, 4.033628, 0, 0, 0, 1, 1,
0.4947258, -0.5767391, 3.711428, 0, 0, 0, 1, 1,
0.4985873, 0.7087139, -0.1790738, 0, 0, 0, 1, 1,
0.4991168, -0.5442764, 2.809802, 0, 0, 0, 1, 1,
0.4992125, 0.3057331, 0.03481056, 0, 0, 0, 1, 1,
0.5019193, 1.101563, 0.6785765, 0, 0, 0, 1, 1,
0.5020379, 0.02068473, 2.443342, 1, 1, 1, 1, 1,
0.5036921, 0.9319274, -0.6946657, 1, 1, 1, 1, 1,
0.5067547, 0.8672758, 0.1640812, 1, 1, 1, 1, 1,
0.507808, -0.3434366, 2.505286, 1, 1, 1, 1, 1,
0.5108544, -1.133788, 3.674101, 1, 1, 1, 1, 1,
0.5109918, -0.2126969, 2.302017, 1, 1, 1, 1, 1,
0.5117386, 0.3153951, 0.8228841, 1, 1, 1, 1, 1,
0.5131716, 2.00973, -1.697291, 1, 1, 1, 1, 1,
0.521113, 0.496493, 1.432057, 1, 1, 1, 1, 1,
0.5235221, -0.7856105, 3.018935, 1, 1, 1, 1, 1,
0.5241284, 1.611152, -1.366602, 1, 1, 1, 1, 1,
0.5281987, -0.4090093, 1.738637, 1, 1, 1, 1, 1,
0.5289776, -0.4299493, 1.740731, 1, 1, 1, 1, 1,
0.5312103, 0.5803464, -0.05031564, 1, 1, 1, 1, 1,
0.5329247, -2.363689, 3.987942, 1, 1, 1, 1, 1,
0.5400208, -0.1301577, 0.9220623, 0, 0, 1, 1, 1,
0.5413333, 0.6173062, 0.6336365, 1, 0, 0, 1, 1,
0.5469259, 0.2735741, 1.516413, 1, 0, 0, 1, 1,
0.5550998, -0.4836557, 1.477828, 1, 0, 0, 1, 1,
0.5600521, -2.862666, 1.901131, 1, 0, 0, 1, 1,
0.5685447, -1.652475, 3.941312, 1, 0, 0, 1, 1,
0.5728053, 1.046358, 1.979517, 0, 0, 0, 1, 1,
0.5764738, -1.394605, 1.85079, 0, 0, 0, 1, 1,
0.5801733, 0.2108935, 1.12481, 0, 0, 0, 1, 1,
0.585654, 1.630286, 0.7992752, 0, 0, 0, 1, 1,
0.5907946, 0.2830009, 1.586951, 0, 0, 0, 1, 1,
0.608228, 0.06023504, 0.6360801, 0, 0, 0, 1, 1,
0.6102064, 0.9393151, 1.092277, 0, 0, 0, 1, 1,
0.6142828, 0.9910817, 0.1376365, 1, 1, 1, 1, 1,
0.6145575, -0.282317, 1.569337, 1, 1, 1, 1, 1,
0.6183928, 1.573771, 0.9002244, 1, 1, 1, 1, 1,
0.6188743, -0.3716665, 2.441288, 1, 1, 1, 1, 1,
0.6191133, -2.27334, 2.561743, 1, 1, 1, 1, 1,
0.6250322, -0.8423129, 3.234694, 1, 1, 1, 1, 1,
0.6361666, -0.3232309, 1.656759, 1, 1, 1, 1, 1,
0.6377718, -0.1395254, 3.604687, 1, 1, 1, 1, 1,
0.6388195, -0.8516116, 3.228819, 1, 1, 1, 1, 1,
0.6401702, -0.06033465, 0.317583, 1, 1, 1, 1, 1,
0.6423783, -0.5141509, 2.579191, 1, 1, 1, 1, 1,
0.6427316, -1.170194, 2.910854, 1, 1, 1, 1, 1,
0.6492838, -0.6460487, 3.31285, 1, 1, 1, 1, 1,
0.6500693, 0.8783805, 1.164056, 1, 1, 1, 1, 1,
0.6508917, 1.201381, 0.03607015, 1, 1, 1, 1, 1,
0.6518057, -0.2320603, 2.150733, 0, 0, 1, 1, 1,
0.6538545, 0.5169894, 0.6912409, 1, 0, 0, 1, 1,
0.6539768, 0.9428624, 1.826202, 1, 0, 0, 1, 1,
0.657544, 0.1463563, 1.444978, 1, 0, 0, 1, 1,
0.6588468, -1.111033, 2.151536, 1, 0, 0, 1, 1,
0.6596524, 2.970328, -1.622556, 1, 0, 0, 1, 1,
0.6605471, -0.642077, -0.1858153, 0, 0, 0, 1, 1,
0.6620309, 0.4101291, -1.601642, 0, 0, 0, 1, 1,
0.6624985, 0.3170053, 2.362321, 0, 0, 0, 1, 1,
0.6654818, 1.779157, -0.7355839, 0, 0, 0, 1, 1,
0.6698345, -0.6993067, 2.587437, 0, 0, 0, 1, 1,
0.6725991, 2.38008, -0.1469653, 0, 0, 0, 1, 1,
0.672932, 0.6058865, 0.4604683, 0, 0, 0, 1, 1,
0.6745845, 0.6379153, 0.126877, 1, 1, 1, 1, 1,
0.6772138, 0.9300994, 0.7062804, 1, 1, 1, 1, 1,
0.6789595, -0.6271212, 2.046695, 1, 1, 1, 1, 1,
0.6798488, -0.3340959, 2.287876, 1, 1, 1, 1, 1,
0.6814782, -1.504011, 2.911962, 1, 1, 1, 1, 1,
0.685911, -0.006576754, 1.928642, 1, 1, 1, 1, 1,
0.6872393, 0.1382322, -0.07829661, 1, 1, 1, 1, 1,
0.6878421, -0.2495653, 2.560544, 1, 1, 1, 1, 1,
0.6899741, -2.086118, 1.820473, 1, 1, 1, 1, 1,
0.6929808, 1.462973, -0.3470039, 1, 1, 1, 1, 1,
0.6932718, 0.320712, 1.603045, 1, 1, 1, 1, 1,
0.6936962, -0.4361756, 2.530154, 1, 1, 1, 1, 1,
0.6959994, -1.31399, 2.697649, 1, 1, 1, 1, 1,
0.6982719, -0.7294132, -0.002422039, 1, 1, 1, 1, 1,
0.6993617, 0.1067013, 1.805036, 1, 1, 1, 1, 1,
0.7022671, -1.136169, 4.264507, 0, 0, 1, 1, 1,
0.7037752, 0.3121945, 0.06255617, 1, 0, 0, 1, 1,
0.7100853, 0.6859643, 1.822271, 1, 0, 0, 1, 1,
0.7102186, -0.02731801, 1.851139, 1, 0, 0, 1, 1,
0.711467, 1.696928, 2.251332, 1, 0, 0, 1, 1,
0.7133012, 0.2097889, -0.04909127, 1, 0, 0, 1, 1,
0.7156343, -1.786698, 4.254157, 0, 0, 0, 1, 1,
0.7166833, 0.7535669, 0.5032498, 0, 0, 0, 1, 1,
0.7177609, -0.1201066, 1.086904, 0, 0, 0, 1, 1,
0.7209117, 1.175579, 0.7124226, 0, 0, 0, 1, 1,
0.7250324, -0.473323, 4.262094, 0, 0, 0, 1, 1,
0.7272928, -0.4387384, 3.987956, 0, 0, 0, 1, 1,
0.7325366, 0.4579032, 1.222339, 0, 0, 0, 1, 1,
0.7365709, 0.05734709, 0.6305057, 1, 1, 1, 1, 1,
0.7386443, -2.26429, 2.848121, 1, 1, 1, 1, 1,
0.7399495, 1.801889, -1.343731, 1, 1, 1, 1, 1,
0.7400228, 0.6133912, 1.257962, 1, 1, 1, 1, 1,
0.7456143, -0.8919603, 2.088411, 1, 1, 1, 1, 1,
0.7460222, 0.459339, -0.4809837, 1, 1, 1, 1, 1,
0.7559078, 0.2166992, 1.150403, 1, 1, 1, 1, 1,
0.759086, -0.9108184, 2.469104, 1, 1, 1, 1, 1,
0.7595181, 0.5390352, 1.906614, 1, 1, 1, 1, 1,
0.7598709, -1.19822, 3.191875, 1, 1, 1, 1, 1,
0.7603779, 0.29133, 1.632764, 1, 1, 1, 1, 1,
0.7671534, 0.3683608, -0.6988217, 1, 1, 1, 1, 1,
0.7705734, 1.117524, -1.453967, 1, 1, 1, 1, 1,
0.7756552, -0.7945276, 0.4069406, 1, 1, 1, 1, 1,
0.7783456, -0.3494119, 3.521463, 1, 1, 1, 1, 1,
0.780275, 0.2752011, 2.6994, 0, 0, 1, 1, 1,
0.7807563, 0.09969056, 2.509325, 1, 0, 0, 1, 1,
0.7878113, -0.6368676, 2.650608, 1, 0, 0, 1, 1,
0.7880308, 0.906843, 0.465708, 1, 0, 0, 1, 1,
0.794073, -0.4796903, 1.684615, 1, 0, 0, 1, 1,
0.7968109, -1.630529, 3.431284, 1, 0, 0, 1, 1,
0.7987891, -0.9243403, 2.675786, 0, 0, 0, 1, 1,
0.8030223, -0.4007414, 2.3084, 0, 0, 0, 1, 1,
0.803975, 1.199272, 1.37932, 0, 0, 0, 1, 1,
0.813421, 1.207424, 0.521642, 0, 0, 0, 1, 1,
0.8140525, 0.8885108, -0.07127985, 0, 0, 0, 1, 1,
0.8162663, 0.140428, 1.728734, 0, 0, 0, 1, 1,
0.8185393, 0.9303085, 0.7705841, 0, 0, 0, 1, 1,
0.8192751, 0.2369579, 2.399826, 1, 1, 1, 1, 1,
0.822183, 1.271789, 0.5372639, 1, 1, 1, 1, 1,
0.8258387, 0.9715983, 1.014656, 1, 1, 1, 1, 1,
0.8293225, -0.2571427, 1.815901, 1, 1, 1, 1, 1,
0.830246, -1.267821, 2.545405, 1, 1, 1, 1, 1,
0.8323161, -0.6823524, 1.857906, 1, 1, 1, 1, 1,
0.8331177, 0.586198, 0.9650999, 1, 1, 1, 1, 1,
0.8332972, -0.7683313, 1.398778, 1, 1, 1, 1, 1,
0.8334688, -0.3377282, 2.130457, 1, 1, 1, 1, 1,
0.8434631, -0.6348652, 2.583819, 1, 1, 1, 1, 1,
0.8436207, -2.398257, 3.530868, 1, 1, 1, 1, 1,
0.8449104, -0.5853725, 3.010807, 1, 1, 1, 1, 1,
0.8530415, -0.127249, 2.609063, 1, 1, 1, 1, 1,
0.8626916, 0.8598804, 1.41783, 1, 1, 1, 1, 1,
0.8646283, -1.436313, 2.270698, 1, 1, 1, 1, 1,
0.8783485, 0.2130698, 0.7737368, 0, 0, 1, 1, 1,
0.8809708, -0.7108334, 1.94469, 1, 0, 0, 1, 1,
0.8826388, 0.4746842, 0.5489274, 1, 0, 0, 1, 1,
0.8867096, 0.1331699, 1.399624, 1, 0, 0, 1, 1,
0.8879833, 1.346579, -0.07916699, 1, 0, 0, 1, 1,
0.8883207, 1.082167, -0.1509533, 1, 0, 0, 1, 1,
0.8901327, 0.6334404, 0.6784097, 0, 0, 0, 1, 1,
0.8938674, -0.205762, 1.824182, 0, 0, 0, 1, 1,
0.8939229, -0.3361998, 1.879019, 0, 0, 0, 1, 1,
0.8971611, 1.352794, 2.200897, 0, 0, 0, 1, 1,
0.8986136, -0.4931568, 2.269761, 0, 0, 0, 1, 1,
0.8993756, -0.2320311, 0.9395326, 0, 0, 0, 1, 1,
0.9038131, -0.7117377, 3.741287, 0, 0, 0, 1, 1,
0.9103037, 0.6956952, 1.322027, 1, 1, 1, 1, 1,
0.9152712, 0.188573, 1.972088, 1, 1, 1, 1, 1,
0.9155514, -0.8093351, 1.550044, 1, 1, 1, 1, 1,
0.9285873, -1.890856, 2.755991, 1, 1, 1, 1, 1,
0.9375089, -0.3131102, 1.932029, 1, 1, 1, 1, 1,
0.9411451, -0.5863219, 2.325377, 1, 1, 1, 1, 1,
0.9535832, -0.7310638, 2.042339, 1, 1, 1, 1, 1,
0.9550574, -2.263066, 1.811878, 1, 1, 1, 1, 1,
0.9646965, 0.6360799, 2.5689, 1, 1, 1, 1, 1,
0.9668362, -0.3236619, 2.034842, 1, 1, 1, 1, 1,
0.9678115, -0.2285351, 1.960382, 1, 1, 1, 1, 1,
0.9718317, -1.711295, 2.048035, 1, 1, 1, 1, 1,
0.9781653, -0.8718986, 2.877967, 1, 1, 1, 1, 1,
0.9784181, -0.498342, 0.2125295, 1, 1, 1, 1, 1,
0.979223, 1.276909, 1.749435, 1, 1, 1, 1, 1,
0.9795223, -1.245956, 3.891414, 0, 0, 1, 1, 1,
0.9883863, 1.684917, -1.758569, 1, 0, 0, 1, 1,
0.9903144, 0.9555817, 1.240475, 1, 0, 0, 1, 1,
0.9979499, 1.356449, -0.04427721, 1, 0, 0, 1, 1,
1.002193, -1.747199, 2.292437, 1, 0, 0, 1, 1,
1.010401, 0.3994716, 1.872328, 1, 0, 0, 1, 1,
1.01734, -1.625882, 4.592278, 0, 0, 0, 1, 1,
1.017914, 0.305494, 2.366592, 0, 0, 0, 1, 1,
1.02574, 0.2865752, 1.819847, 0, 0, 0, 1, 1,
1.027715, -0.4078709, 0.5262922, 0, 0, 0, 1, 1,
1.031692, 0.01874467, 2.532422, 0, 0, 0, 1, 1,
1.034427, -1.140111, 3.03881, 0, 0, 0, 1, 1,
1.038359, 0.1116028, 0.3228297, 0, 0, 0, 1, 1,
1.040531, 0.9592628, 1.154488, 1, 1, 1, 1, 1,
1.042499, 1.335414, 0.9213026, 1, 1, 1, 1, 1,
1.046845, 1.198772, -0.4988381, 1, 1, 1, 1, 1,
1.048519, -0.1976067, 1.330615, 1, 1, 1, 1, 1,
1.050943, -0.281771, 0.4003657, 1, 1, 1, 1, 1,
1.062016, 0.3483801, 1.4075, 1, 1, 1, 1, 1,
1.066694, 1.231412, 2.20644, 1, 1, 1, 1, 1,
1.070034, -0.1700206, 1.871839, 1, 1, 1, 1, 1,
1.074696, -1.246683, 3.41955, 1, 1, 1, 1, 1,
1.079702, 0.05465515, 2.191149, 1, 1, 1, 1, 1,
1.080949, -0.3341055, 1.237913, 1, 1, 1, 1, 1,
1.085394, -0.3289034, 1.000922, 1, 1, 1, 1, 1,
1.090738, -1.088791, 1.461129, 1, 1, 1, 1, 1,
1.095275, 0.6872469, 2.013915, 1, 1, 1, 1, 1,
1.101238, 0.5269009, -0.5705047, 1, 1, 1, 1, 1,
1.108094, -1.112699, 2.48735, 0, 0, 1, 1, 1,
1.116812, -1.937149, 0.6278674, 1, 0, 0, 1, 1,
1.118102, 1.727884, -1.525979, 1, 0, 0, 1, 1,
1.125061, 0.4412076, 2.78786, 1, 0, 0, 1, 1,
1.129536, 0.6967822, 0.1370045, 1, 0, 0, 1, 1,
1.135435, -1.363164, 0.5895824, 1, 0, 0, 1, 1,
1.136798, 0.7885486, 3.114217, 0, 0, 0, 1, 1,
1.137632, -0.7371848, 3.297048, 0, 0, 0, 1, 1,
1.142803, 2.516984, 0.6327782, 0, 0, 0, 1, 1,
1.149623, -0.7598379, 1.88338, 0, 0, 0, 1, 1,
1.151341, -0.2435858, 1.589893, 0, 0, 0, 1, 1,
1.1559, 1.066339, -0.07425468, 0, 0, 0, 1, 1,
1.158956, 1.309046, 1.793205, 0, 0, 0, 1, 1,
1.16074, -1.120337, 0.5625106, 1, 1, 1, 1, 1,
1.162229, 0.2645541, 1.245354, 1, 1, 1, 1, 1,
1.165499, 2.008757, 0.7415251, 1, 1, 1, 1, 1,
1.168144, -0.4178871, 3.0866, 1, 1, 1, 1, 1,
1.176331, -0.2742684, 0.9318575, 1, 1, 1, 1, 1,
1.177057, 0.7963743, 0.6363339, 1, 1, 1, 1, 1,
1.197839, -1.851601, 2.073957, 1, 1, 1, 1, 1,
1.234136, -0.5680792, 1.413561, 1, 1, 1, 1, 1,
1.247701, -0.3427866, 3.139714, 1, 1, 1, 1, 1,
1.264763, -0.580218, 2.318185, 1, 1, 1, 1, 1,
1.266706, -1.067675, 1.149271, 1, 1, 1, 1, 1,
1.27586, -1.046801, 1.810482, 1, 1, 1, 1, 1,
1.28445, 0.8927702, 1.381061, 1, 1, 1, 1, 1,
1.286752, -0.08631725, 1.217085, 1, 1, 1, 1, 1,
1.289271, 0.4806553, 0.1332137, 1, 1, 1, 1, 1,
1.289375, -1.196588, 1.072154, 0, 0, 1, 1, 1,
1.291038, -0.6332736, 1.166742, 1, 0, 0, 1, 1,
1.299125, 0.2213149, 1.572128, 1, 0, 0, 1, 1,
1.303089, -0.9381331, 2.855721, 1, 0, 0, 1, 1,
1.313894, -0.738018, 1.859943, 1, 0, 0, 1, 1,
1.317203, 0.8368186, 0.6681867, 1, 0, 0, 1, 1,
1.326148, 0.04865493, 1.201285, 0, 0, 0, 1, 1,
1.326962, 0.854291, 1.4934, 0, 0, 0, 1, 1,
1.332191, 1.347051, 2.212861, 0, 0, 0, 1, 1,
1.340583, 0.593641, 1.360062, 0, 0, 0, 1, 1,
1.349936, -1.508823, 1.162221, 0, 0, 0, 1, 1,
1.3604, 1.702083, 0.4094363, 0, 0, 0, 1, 1,
1.371077, -0.7423501, 1.919583, 0, 0, 0, 1, 1,
1.374292, 0.3695021, 2.152691, 1, 1, 1, 1, 1,
1.378603, -0.8504044, 2.528551, 1, 1, 1, 1, 1,
1.381604, -0.05161662, 1.289358, 1, 1, 1, 1, 1,
1.38433, 0.4147069, 0.5105312, 1, 1, 1, 1, 1,
1.395883, -0.8842022, 2.757157, 1, 1, 1, 1, 1,
1.412874, -1.564057, 1.468306, 1, 1, 1, 1, 1,
1.42152, -0.387684, 1.842623, 1, 1, 1, 1, 1,
1.423438, 0.2867266, 1.985988, 1, 1, 1, 1, 1,
1.424057, 1.475093, 1.067115, 1, 1, 1, 1, 1,
1.425178, -2.28063, 3.265501, 1, 1, 1, 1, 1,
1.426307, -0.2153297, -0.4082084, 1, 1, 1, 1, 1,
1.432673, 1.061301, 0.1661898, 1, 1, 1, 1, 1,
1.458249, -0.6601737, 2.005664, 1, 1, 1, 1, 1,
1.459885, -0.1101857, 0.01109544, 1, 1, 1, 1, 1,
1.461668, 0.2053502, 1.691508, 1, 1, 1, 1, 1,
1.463278, -1.112581, 1.567088, 0, 0, 1, 1, 1,
1.463323, 0.7478633, 1.247726, 1, 0, 0, 1, 1,
1.463985, -0.7125926, 2.470384, 1, 0, 0, 1, 1,
1.465793, 1.348615, 1.03662, 1, 0, 0, 1, 1,
1.46588, 0.2757859, 2.17599, 1, 0, 0, 1, 1,
1.467879, -0.04172153, 0.5695186, 1, 0, 0, 1, 1,
1.472024, -1.493733, 0.7488329, 0, 0, 0, 1, 1,
1.483276, 2.332544, -0.08343359, 0, 0, 0, 1, 1,
1.487979, -0.3251943, 2.800826, 0, 0, 0, 1, 1,
1.489703, 2.375621, 1.720363, 0, 0, 0, 1, 1,
1.499086, -1.138666, 0.01755405, 0, 0, 0, 1, 1,
1.500659, 0.3347803, 0.2216854, 0, 0, 0, 1, 1,
1.519997, 0.2532704, 1.100943, 0, 0, 0, 1, 1,
1.527668, 0.6010706, 0.7786728, 1, 1, 1, 1, 1,
1.543039, 1.479481, 1.033247, 1, 1, 1, 1, 1,
1.557497, -1.319699, 3.186025, 1, 1, 1, 1, 1,
1.562337, -0.6363162, 3.744529, 1, 1, 1, 1, 1,
1.562769, 0.2717338, 2.212059, 1, 1, 1, 1, 1,
1.575288, 0.3378558, -0.7649055, 1, 1, 1, 1, 1,
1.581823, 0.7633862, 2.344122, 1, 1, 1, 1, 1,
1.610219, -1.933456, 2.351137, 1, 1, 1, 1, 1,
1.612716, 0.1426049, 2.135139, 1, 1, 1, 1, 1,
1.616371, 0.8591005, 1.883875, 1, 1, 1, 1, 1,
1.625876, 0.3964918, 1.190244, 1, 1, 1, 1, 1,
1.635589, 0.9917384, -0.3046155, 1, 1, 1, 1, 1,
1.639645, -1.26285, 1.016301, 1, 1, 1, 1, 1,
1.643047, -0.4347627, 3.426008, 1, 1, 1, 1, 1,
1.649237, 0.3270248, 1.434784, 1, 1, 1, 1, 1,
1.691493, -0.6134105, 0.6931719, 0, 0, 1, 1, 1,
1.695579, -1.861373, 1.903068, 1, 0, 0, 1, 1,
1.715313, 2.091069, -0.02049677, 1, 0, 0, 1, 1,
1.722353, 0.3380224, 2.185601, 1, 0, 0, 1, 1,
1.757295, -0.9657916, 1.918839, 1, 0, 0, 1, 1,
1.767829, 0.9169845, 1.110987, 1, 0, 0, 1, 1,
1.776308, -0.2273454, 2.920261, 0, 0, 0, 1, 1,
1.78211, -1.084679, 3.123053, 0, 0, 0, 1, 1,
1.791858, 0.8422127, -0.2106619, 0, 0, 0, 1, 1,
1.806028, 0.532122, 2.158314, 0, 0, 0, 1, 1,
1.812673, 0.7443359, -0.8539395, 0, 0, 0, 1, 1,
1.815615, 0.6328917, 1.016203, 0, 0, 0, 1, 1,
1.837768, -2.363584, 3.304299, 0, 0, 0, 1, 1,
1.84532, 0.3502452, 1.492659, 1, 1, 1, 1, 1,
1.853086, 0.03513334, 0.3481002, 1, 1, 1, 1, 1,
1.857609, 0.1442717, 3.078359, 1, 1, 1, 1, 1,
1.863912, 1.760906, 1.603359, 1, 1, 1, 1, 1,
1.864251, -1.154428, 1.710874, 1, 1, 1, 1, 1,
1.882794, 0.2538366, 2.125851, 1, 1, 1, 1, 1,
1.883352, -0.7825227, 3.623988, 1, 1, 1, 1, 1,
1.94339, 2.427163, -0.1883046, 1, 1, 1, 1, 1,
1.952567, 0.4989633, 0.8563027, 1, 1, 1, 1, 1,
1.954733, -0.992605, 3.102204, 1, 1, 1, 1, 1,
1.979174, -1.11627, 2.431807, 1, 1, 1, 1, 1,
1.990145, -0.5377544, 3.591857, 1, 1, 1, 1, 1,
2.022681, 0.1443273, 3.397878, 1, 1, 1, 1, 1,
2.027886, -0.3422263, 1.756941, 1, 1, 1, 1, 1,
2.040908, -2.074487, 3.008803, 1, 1, 1, 1, 1,
2.042426, 0.1089081, 2.26588, 0, 0, 1, 1, 1,
2.048311, -1.086484, 1.723402, 1, 0, 0, 1, 1,
2.055589, -0.2067565, 1.587175, 1, 0, 0, 1, 1,
2.081989, -0.9711626, 2.012429, 1, 0, 0, 1, 1,
2.097149, -0.4012674, 2.234087, 1, 0, 0, 1, 1,
2.12638, 0.07827911, 2.344385, 1, 0, 0, 1, 1,
2.139583, -0.1647063, 3.602559, 0, 0, 0, 1, 1,
2.162657, -1.158979, 2.921651, 0, 0, 0, 1, 1,
2.211244, 0.7078063, -0.5408027, 0, 0, 0, 1, 1,
2.254107, -0.21973, -1.098555, 0, 0, 0, 1, 1,
2.298271, -0.4005514, 3.745597, 0, 0, 0, 1, 1,
2.319649, 0.5343976, 2.244801, 0, 0, 0, 1, 1,
2.327381, -0.4469732, 2.086645, 0, 0, 0, 1, 1,
2.706344, -1.210064, 1.418267, 1, 1, 1, 1, 1,
2.738683, -1.674729, 2.41784, 1, 1, 1, 1, 1,
2.861599, -0.5900572, 0.5307728, 1, 1, 1, 1, 1,
2.868857, 0.1090724, 3.082246, 1, 1, 1, 1, 1,
2.988771, 0.2005274, 2.349667, 1, 1, 1, 1, 1,
3.213007, -0.853388, 1.46308, 1, 1, 1, 1, 1,
3.648145, 1.050702, -0.2871784, 1, 1, 1, 1, 1
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
var radius = 9.914117;
var distance = 34.82291;
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
mvMatrix.translate( -0.221869, -0.2015576, -0.3178744 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82291);
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
