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
-2.988639, 0.2892491, -0.561469, 1, 0, 0, 1,
-2.764318, -1.515142, -2.476136, 1, 0.007843138, 0, 1,
-2.712648, -0.03044418, -2.34145, 1, 0.01176471, 0, 1,
-2.554677, 1.727613, -0.06882573, 1, 0.01960784, 0, 1,
-2.443963, 0.780803, -1.461604, 1, 0.02352941, 0, 1,
-2.37469, -0.02103905, -0.6674482, 1, 0.03137255, 0, 1,
-2.210465, -1.024969, -2.782748, 1, 0.03529412, 0, 1,
-2.196845, 0.8382086, -0.8145983, 1, 0.04313726, 0, 1,
-2.180021, 0.2905976, -0.9746557, 1, 0.04705882, 0, 1,
-2.157686, 0.4192038, 0.6244518, 1, 0.05490196, 0, 1,
-2.144499, -1.184738, -1.878895, 1, 0.05882353, 0, 1,
-2.133475, -0.6461763, -2.734634, 1, 0.06666667, 0, 1,
-2.126426, -0.2148293, -1.031173, 1, 0.07058824, 0, 1,
-2.115101, -1.029284, -2.955971, 1, 0.07843138, 0, 1,
-2.101329, -0.2779518, -1.381267, 1, 0.08235294, 0, 1,
-2.090308, 0.4902556, -1.622435, 1, 0.09019608, 0, 1,
-2.078438, 0.7628042, -2.022758, 1, 0.09411765, 0, 1,
-2.05468, -0.2214063, -1.302784, 1, 0.1019608, 0, 1,
-2.014235, -0.09171277, -1.202318, 1, 0.1098039, 0, 1,
-2.006504, -0.7888629, -2.248264, 1, 0.1137255, 0, 1,
-1.99675, 0.4538054, -0.4670072, 1, 0.1215686, 0, 1,
-1.97792, -0.3291227, -2.417866, 1, 0.1254902, 0, 1,
-1.932596, 0.7425871, -0.6267161, 1, 0.1333333, 0, 1,
-1.901793, -1.042482, -3.181624, 1, 0.1372549, 0, 1,
-1.891843, 0.6064595, -1.565994, 1, 0.145098, 0, 1,
-1.864958, -0.5122775, -1.076327, 1, 0.1490196, 0, 1,
-1.842215, 0.2194897, -1.99246, 1, 0.1568628, 0, 1,
-1.837455, -0.7315251, -2.102442, 1, 0.1607843, 0, 1,
-1.818352, 0.8214484, -1.659491, 1, 0.1686275, 0, 1,
-1.80682, 2.205027, -0.4050587, 1, 0.172549, 0, 1,
-1.796773, -0.1422597, -1.881566, 1, 0.1803922, 0, 1,
-1.777755, -0.4233283, -1.449632, 1, 0.1843137, 0, 1,
-1.771279, 0.5051036, -0.9001643, 1, 0.1921569, 0, 1,
-1.763422, -0.0146167, -3.339556, 1, 0.1960784, 0, 1,
-1.748555, -0.4310545, -1.527297, 1, 0.2039216, 0, 1,
-1.732732, -1.006791, -0.7719831, 1, 0.2117647, 0, 1,
-1.716237, 2.066626, -0.1540414, 1, 0.2156863, 0, 1,
-1.707566, 0.09917562, -0.4554025, 1, 0.2235294, 0, 1,
-1.705609, -0.778267, -1.972703, 1, 0.227451, 0, 1,
-1.704205, 2.112162, 0.09057259, 1, 0.2352941, 0, 1,
-1.70392, 0.7457562, -0.007140748, 1, 0.2392157, 0, 1,
-1.695713, 0.8640208, -0.6123474, 1, 0.2470588, 0, 1,
-1.688574, -0.3081289, -1.101038, 1, 0.2509804, 0, 1,
-1.682389, -0.1841648, -1.843407, 1, 0.2588235, 0, 1,
-1.677536, 1.549143, -1.767748, 1, 0.2627451, 0, 1,
-1.672341, 1.058154, 0.7027616, 1, 0.2705882, 0, 1,
-1.66502, -0.2275731, -1.350492, 1, 0.2745098, 0, 1,
-1.648513, -0.9824814, -2.394279, 1, 0.282353, 0, 1,
-1.64008, 0.5682076, -2.134161, 1, 0.2862745, 0, 1,
-1.637053, -1.134579, -2.76076, 1, 0.2941177, 0, 1,
-1.629233, -0.8099116, -2.951601, 1, 0.3019608, 0, 1,
-1.627171, 0.6443184, 0.7793432, 1, 0.3058824, 0, 1,
-1.625695, 0.7416252, -1.843889, 1, 0.3137255, 0, 1,
-1.620352, -0.5074043, -2.801169, 1, 0.3176471, 0, 1,
-1.540156, -0.2851803, -1.084968, 1, 0.3254902, 0, 1,
-1.539057, -0.1600391, -2.599913, 1, 0.3294118, 0, 1,
-1.533104, 0.1146487, -0.9573786, 1, 0.3372549, 0, 1,
-1.527547, 0.8062862, -0.7763978, 1, 0.3411765, 0, 1,
-1.526114, -0.1729802, -2.947259, 1, 0.3490196, 0, 1,
-1.520824, -0.2235273, -0.5972244, 1, 0.3529412, 0, 1,
-1.518385, -0.4192102, -1.253241, 1, 0.3607843, 0, 1,
-1.511302, -0.7289191, -1.274669, 1, 0.3647059, 0, 1,
-1.498411, -0.2052, -0.746975, 1, 0.372549, 0, 1,
-1.497455, 1.322795, -1.138978, 1, 0.3764706, 0, 1,
-1.478383, -1.661942, -3.549181, 1, 0.3843137, 0, 1,
-1.475557, 0.5268558, -1.224128, 1, 0.3882353, 0, 1,
-1.473093, 1.555349, -0.9547361, 1, 0.3960784, 0, 1,
-1.471554, -3.082499, -1.591356, 1, 0.4039216, 0, 1,
-1.468789, 0.7462986, -0.4202106, 1, 0.4078431, 0, 1,
-1.463429, -1.559863, -2.058917, 1, 0.4156863, 0, 1,
-1.425726, 0.773946, -0.3871032, 1, 0.4196078, 0, 1,
-1.419127, 0.4889996, -0.7031727, 1, 0.427451, 0, 1,
-1.418629, -0.8921815, -3.281935, 1, 0.4313726, 0, 1,
-1.413786, 0.3349881, -0.9298388, 1, 0.4392157, 0, 1,
-1.405952, 0.01126969, -0.786527, 1, 0.4431373, 0, 1,
-1.397832, 0.5819111, -0.1320882, 1, 0.4509804, 0, 1,
-1.396238, 0.1715967, -1.133867, 1, 0.454902, 0, 1,
-1.382696, -1.292439, -3.547357, 1, 0.4627451, 0, 1,
-1.381913, -1.288326, -3.474352, 1, 0.4666667, 0, 1,
-1.377696, 0.2190042, -2.251857, 1, 0.4745098, 0, 1,
-1.360407, -1.71958, -0.1697802, 1, 0.4784314, 0, 1,
-1.357409, -0.2606578, -3.17617, 1, 0.4862745, 0, 1,
-1.356765, -1.400348, -1.5435, 1, 0.4901961, 0, 1,
-1.354849, -0.02494235, 0.2913137, 1, 0.4980392, 0, 1,
-1.351588, -1.401011, -0.8028026, 1, 0.5058824, 0, 1,
-1.344276, -2.286903, -3.192299, 1, 0.509804, 0, 1,
-1.340458, 0.1186395, -1.651293, 1, 0.5176471, 0, 1,
-1.339783, -0.8814968, -2.140161, 1, 0.5215687, 0, 1,
-1.32007, 0.3702056, -2.584931, 1, 0.5294118, 0, 1,
-1.313763, 0.02564459, -2.269956, 1, 0.5333334, 0, 1,
-1.306852, -0.1766303, -3.40829, 1, 0.5411765, 0, 1,
-1.30629, -0.9090359, -1.554174, 1, 0.5450981, 0, 1,
-1.303243, 0.7731461, 0.1154122, 1, 0.5529412, 0, 1,
-1.289907, -0.2964933, -2.769223, 1, 0.5568628, 0, 1,
-1.281909, -1.690494, -2.771491, 1, 0.5647059, 0, 1,
-1.281881, 0.005360409, -0.08164874, 1, 0.5686275, 0, 1,
-1.280753, 0.261274, -0.0388432, 1, 0.5764706, 0, 1,
-1.277512, -0.2003051, -0.6106683, 1, 0.5803922, 0, 1,
-1.277287, -1.372401, -2.093836, 1, 0.5882353, 0, 1,
-1.254565, -0.2619687, -0.9580839, 1, 0.5921569, 0, 1,
-1.238645, -0.3847156, -1.943654, 1, 0.6, 0, 1,
-1.238554, 0.7017121, -3.466366, 1, 0.6078432, 0, 1,
-1.238377, 0.6365064, -1.089387, 1, 0.6117647, 0, 1,
-1.237417, 0.289219, -2.248354, 1, 0.6196079, 0, 1,
-1.217621, -0.2702623, -2.700487, 1, 0.6235294, 0, 1,
-1.216215, 0.8298334, 0.03282591, 1, 0.6313726, 0, 1,
-1.215099, 0.7539965, -0.4453714, 1, 0.6352941, 0, 1,
-1.211402, 0.06929623, -2.57385, 1, 0.6431373, 0, 1,
-1.203538, 0.1530023, -0.8297614, 1, 0.6470588, 0, 1,
-1.19748, -0.9061064, -4.298963, 1, 0.654902, 0, 1,
-1.195078, 0.629593, -2.47851, 1, 0.6588235, 0, 1,
-1.192266, 0.186487, -2.703154, 1, 0.6666667, 0, 1,
-1.184062, 1.755173, 0.3217647, 1, 0.6705883, 0, 1,
-1.176088, -0.3452002, -2.785403, 1, 0.6784314, 0, 1,
-1.170947, -0.9405859, -2.846082, 1, 0.682353, 0, 1,
-1.164539, 0.7159327, -1.509686, 1, 0.6901961, 0, 1,
-1.161265, -1.201511, -3.00757, 1, 0.6941177, 0, 1,
-1.157615, -1.535167, -1.678332, 1, 0.7019608, 0, 1,
-1.151087, 0.02158053, -0.8568957, 1, 0.7098039, 0, 1,
-1.150533, -0.3111314, -2.250792, 1, 0.7137255, 0, 1,
-1.150383, 0.7180273, -0.7301438, 1, 0.7215686, 0, 1,
-1.14324, -0.4067908, -2.107402, 1, 0.7254902, 0, 1,
-1.135214, 0.8631231, -0.9266633, 1, 0.7333333, 0, 1,
-1.127116, -0.8287802, -2.696148, 1, 0.7372549, 0, 1,
-1.126617, -1.614112, -3.672491, 1, 0.7450981, 0, 1,
-1.124498, -0.541913, -2.753616, 1, 0.7490196, 0, 1,
-1.118633, 0.6607486, -0.5238283, 1, 0.7568628, 0, 1,
-1.115848, 0.001519409, -1.758498, 1, 0.7607843, 0, 1,
-1.113429, -1.16972, -1.910121, 1, 0.7686275, 0, 1,
-1.109327, -0.6169247, -3.143325, 1, 0.772549, 0, 1,
-1.102897, 1.054819, -0.2843603, 1, 0.7803922, 0, 1,
-1.102757, -0.3809057, -1.981696, 1, 0.7843137, 0, 1,
-1.101148, -1.033785, -1.310403, 1, 0.7921569, 0, 1,
-1.101064, 0.1030559, -2.720447, 1, 0.7960784, 0, 1,
-1.097612, -0.3508433, -1.26443, 1, 0.8039216, 0, 1,
-1.095272, 0.2879919, -1.961153, 1, 0.8117647, 0, 1,
-1.086511, 0.32409, -1.563395, 1, 0.8156863, 0, 1,
-1.08469, -0.7364228, -1.39578, 1, 0.8235294, 0, 1,
-1.083655, 0.9230537, -0.6715756, 1, 0.827451, 0, 1,
-1.078973, 0.8975064, 0.6245862, 1, 0.8352941, 0, 1,
-1.078873, -0.6097785, -2.632932, 1, 0.8392157, 0, 1,
-1.071741, 0.1748989, -2.887046, 1, 0.8470588, 0, 1,
-1.061581, 0.1962157, -1.332221, 1, 0.8509804, 0, 1,
-1.045545, -0.6667102, -0.7586129, 1, 0.8588235, 0, 1,
-1.040992, -1.20934, -3.118033, 1, 0.8627451, 0, 1,
-1.037473, -2.391036, -2.934169, 1, 0.8705882, 0, 1,
-1.037164, 0.3860544, -1.221265, 1, 0.8745098, 0, 1,
-1.024139, 0.0830017, -1.213496, 1, 0.8823529, 0, 1,
-1.016969, 0.05848464, -1.509308, 1, 0.8862745, 0, 1,
-1.008579, 0.02809516, 0.4086103, 1, 0.8941177, 0, 1,
-1.000751, 0.7184768, -0.6652606, 1, 0.8980392, 0, 1,
-0.9984163, 1.354986, 0.8041779, 1, 0.9058824, 0, 1,
-0.9961545, 0.3173897, -1.11917, 1, 0.9137255, 0, 1,
-0.9940368, 0.3102475, -0.4814462, 1, 0.9176471, 0, 1,
-0.9896051, 0.1932574, -0.3442759, 1, 0.9254902, 0, 1,
-0.9704431, 0.249679, -0.1788854, 1, 0.9294118, 0, 1,
-0.97005, -0.9091837, -2.41188, 1, 0.9372549, 0, 1,
-0.9697117, -0.3287295, -2.633354, 1, 0.9411765, 0, 1,
-0.9676076, -0.4618202, -2.736739, 1, 0.9490196, 0, 1,
-0.9666188, -0.4717578, -2.49723, 1, 0.9529412, 0, 1,
-0.9654812, -0.4001977, -3.269831, 1, 0.9607843, 0, 1,
-0.9644722, 0.1849573, -1.133186, 1, 0.9647059, 0, 1,
-0.9622868, 0.0850316, -3.769845, 1, 0.972549, 0, 1,
-0.9620241, 0.4134577, -0.1125502, 1, 0.9764706, 0, 1,
-0.9577727, -0.6304925, -1.539424, 1, 0.9843137, 0, 1,
-0.9577632, -1.590207, -3.369632, 1, 0.9882353, 0, 1,
-0.9562353, -1.431821, -1.059128, 1, 0.9960784, 0, 1,
-0.9420296, 1.485394, -1.649873, 0.9960784, 1, 0, 1,
-0.9413908, -0.6056551, -3.3468, 0.9921569, 1, 0, 1,
-0.9397694, -1.796051, -1.704926, 0.9843137, 1, 0, 1,
-0.9349309, -0.5614461, -2.166438, 0.9803922, 1, 0, 1,
-0.9333611, 0.8187386, -3.030714, 0.972549, 1, 0, 1,
-0.9304426, -1.259954, -2.79514, 0.9686275, 1, 0, 1,
-0.9277325, 1.339873, -0.9461991, 0.9607843, 1, 0, 1,
-0.9176502, -0.2188057, -0.8583583, 0.9568627, 1, 0, 1,
-0.9173102, -1.429933, -3.365263, 0.9490196, 1, 0, 1,
-0.9145229, -0.9271879, -4.787924, 0.945098, 1, 0, 1,
-0.9116327, -0.8243504, -2.103155, 0.9372549, 1, 0, 1,
-0.90921, -0.1078363, -2.210145, 0.9333333, 1, 0, 1,
-0.9049783, 1.372827, 0.1451565, 0.9254902, 1, 0, 1,
-0.8987342, 0.7033576, -1.414308, 0.9215686, 1, 0, 1,
-0.895926, -1.503112, -1.402285, 0.9137255, 1, 0, 1,
-0.8937352, 0.2521273, -0.7942413, 0.9098039, 1, 0, 1,
-0.89098, -0.283425, -1.721891, 0.9019608, 1, 0, 1,
-0.8748375, 1.193958, -0.7588692, 0.8941177, 1, 0, 1,
-0.8714544, 1.820689, 0.6309413, 0.8901961, 1, 0, 1,
-0.8665833, -0.5298334, -0.7216982, 0.8823529, 1, 0, 1,
-0.8655334, 2.211581, -1.737799, 0.8784314, 1, 0, 1,
-0.8635858, 0.6332314, -1.635615, 0.8705882, 1, 0, 1,
-0.8627143, -2.11188, -2.35238, 0.8666667, 1, 0, 1,
-0.8614304, 0.1508603, -2.154271, 0.8588235, 1, 0, 1,
-0.8553674, 0.4518457, -0.5307407, 0.854902, 1, 0, 1,
-0.8447636, -1.860327, -2.050756, 0.8470588, 1, 0, 1,
-0.844026, -0.2334639, -0.5441454, 0.8431373, 1, 0, 1,
-0.8424551, -0.7915337, -3.317118, 0.8352941, 1, 0, 1,
-0.8422805, -0.2568157, -2.108747, 0.8313726, 1, 0, 1,
-0.839323, 1.495128, -0.2939488, 0.8235294, 1, 0, 1,
-0.8353492, 2.500254, -0.7222776, 0.8196079, 1, 0, 1,
-0.8295317, 0.367959, -0.5969478, 0.8117647, 1, 0, 1,
-0.8225309, -0.4688492, -0.3403328, 0.8078431, 1, 0, 1,
-0.8173869, -0.6840495, -1.024099, 0.8, 1, 0, 1,
-0.8149909, -0.02986615, 0.9913251, 0.7921569, 1, 0, 1,
-0.8100904, -0.8347864, -0.2147505, 0.7882353, 1, 0, 1,
-0.8085839, -0.446412, -2.352742, 0.7803922, 1, 0, 1,
-0.8073868, -0.79144, -1.860341, 0.7764706, 1, 0, 1,
-0.8072815, 1.178113, 1.974551, 0.7686275, 1, 0, 1,
-0.8062093, 0.3278863, -1.182393, 0.7647059, 1, 0, 1,
-0.8042471, -0.1809902, -1.91419, 0.7568628, 1, 0, 1,
-0.7962224, 0.875743, -1.519796, 0.7529412, 1, 0, 1,
-0.7923753, -0.647779, -1.493592, 0.7450981, 1, 0, 1,
-0.7871654, -0.08591285, -1.330435, 0.7411765, 1, 0, 1,
-0.7857739, 0.9022048, -0.6137128, 0.7333333, 1, 0, 1,
-0.7850057, 1.283482, -0.3032599, 0.7294118, 1, 0, 1,
-0.7818441, 1.056547, -2.163583, 0.7215686, 1, 0, 1,
-0.7794685, -1.271631, -1.085128, 0.7176471, 1, 0, 1,
-0.7730409, 1.458952, 0.008395188, 0.7098039, 1, 0, 1,
-0.7699625, 0.9172724, -1.292044, 0.7058824, 1, 0, 1,
-0.7663611, -0.1854709, -2.197363, 0.6980392, 1, 0, 1,
-0.7620215, -0.4965839, -2.184588, 0.6901961, 1, 0, 1,
-0.7487099, 0.9683005, -0.3031671, 0.6862745, 1, 0, 1,
-0.747466, -0.1106146, -0.771713, 0.6784314, 1, 0, 1,
-0.744481, -0.2834374, -2.56141, 0.6745098, 1, 0, 1,
-0.7427151, -1.245206, -2.780154, 0.6666667, 1, 0, 1,
-0.7421606, -0.5817781, -1.852981, 0.6627451, 1, 0, 1,
-0.7420576, 1.284111, 0.728921, 0.654902, 1, 0, 1,
-0.7349297, -1.153492, -2.700972, 0.6509804, 1, 0, 1,
-0.7345977, -0.9919651, -3.982832, 0.6431373, 1, 0, 1,
-0.7315931, -0.730697, -3.049824, 0.6392157, 1, 0, 1,
-0.7292538, -1.19689, -3.049368, 0.6313726, 1, 0, 1,
-0.7234402, 3.143068, -0.2527265, 0.627451, 1, 0, 1,
-0.7213167, -1.299734, -3.899548, 0.6196079, 1, 0, 1,
-0.716882, -0.5105989, -2.497433, 0.6156863, 1, 0, 1,
-0.7157686, -0.5660483, -0.9659904, 0.6078432, 1, 0, 1,
-0.7151139, -0.04674615, -1.242003, 0.6039216, 1, 0, 1,
-0.7135034, -0.8773935, -2.393574, 0.5960785, 1, 0, 1,
-0.7114925, 0.5246086, -2.424144, 0.5882353, 1, 0, 1,
-0.7108077, -0.3662508, -2.031572, 0.5843138, 1, 0, 1,
-0.706332, 1.784842, -1.714379, 0.5764706, 1, 0, 1,
-0.7048229, -1.730711, -2.264066, 0.572549, 1, 0, 1,
-0.7020734, 0.1378632, -2.557599, 0.5647059, 1, 0, 1,
-0.6996595, -0.02008956, -3.363908, 0.5607843, 1, 0, 1,
-0.6990266, 0.721568, -0.6951891, 0.5529412, 1, 0, 1,
-0.6945264, -0.2407764, -0.03060206, 0.5490196, 1, 0, 1,
-0.6923752, 0.9853368, -0.5339159, 0.5411765, 1, 0, 1,
-0.6917477, -1.937019, -2.794708, 0.5372549, 1, 0, 1,
-0.6908177, 1.871201, 0.3713087, 0.5294118, 1, 0, 1,
-0.6767648, 0.04569671, -1.950462, 0.5254902, 1, 0, 1,
-0.6697475, 1.142391, -1.239798, 0.5176471, 1, 0, 1,
-0.6681096, -2.378139, -4.065893, 0.5137255, 1, 0, 1,
-0.6635284, 0.3745719, -1.462442, 0.5058824, 1, 0, 1,
-0.6629108, 0.3589377, -1.565527, 0.5019608, 1, 0, 1,
-0.6626019, 0.9226565, -0.00721232, 0.4941176, 1, 0, 1,
-0.6594554, 0.8110723, -0.7289183, 0.4862745, 1, 0, 1,
-0.6574692, -1.256347, -3.095902, 0.4823529, 1, 0, 1,
-0.6544895, -0.5311091, -1.937107, 0.4745098, 1, 0, 1,
-0.6511537, -0.3737487, -3.033283, 0.4705882, 1, 0, 1,
-0.6493335, 0.6877348, -1.907888, 0.4627451, 1, 0, 1,
-0.6488409, -0.3064466, -1.015024, 0.4588235, 1, 0, 1,
-0.647884, -0.5605651, -2.336126, 0.4509804, 1, 0, 1,
-0.6456583, 0.7257186, -0.5678772, 0.4470588, 1, 0, 1,
-0.6393895, 0.4299603, -0.7477149, 0.4392157, 1, 0, 1,
-0.6388865, 0.7376847, 0.1025821, 0.4352941, 1, 0, 1,
-0.6349823, 2.376084, -1.869155, 0.427451, 1, 0, 1,
-0.6310155, 0.8262845, 0.3535114, 0.4235294, 1, 0, 1,
-0.6277422, 0.7352877, 0.7042733, 0.4156863, 1, 0, 1,
-0.6255998, -1.115939, -1.321789, 0.4117647, 1, 0, 1,
-0.621857, 0.7714582, -1.355849, 0.4039216, 1, 0, 1,
-0.6200896, 0.1742738, -0.4031911, 0.3960784, 1, 0, 1,
-0.6174319, 1.345945, 1.229197, 0.3921569, 1, 0, 1,
-0.6128479, 0.1553837, -0.8781716, 0.3843137, 1, 0, 1,
-0.6116302, -0.8355428, -1.655035, 0.3803922, 1, 0, 1,
-0.6093001, -0.2417912, -0.2492186, 0.372549, 1, 0, 1,
-0.6064203, 0.2995897, -2.751408, 0.3686275, 1, 0, 1,
-0.604923, 0.07793921, -0.7347398, 0.3607843, 1, 0, 1,
-0.6008829, -0.4311705, -1.377443, 0.3568628, 1, 0, 1,
-0.5994565, 1.126758, 0.5679291, 0.3490196, 1, 0, 1,
-0.5978546, 0.5872417, -1.106713, 0.345098, 1, 0, 1,
-0.5969284, 1.790692, -0.3541523, 0.3372549, 1, 0, 1,
-0.5927048, 0.2193254, -0.1959572, 0.3333333, 1, 0, 1,
-0.5810865, -0.6825479, -2.310278, 0.3254902, 1, 0, 1,
-0.5807778, -1.365165, -1.0442, 0.3215686, 1, 0, 1,
-0.5768828, 0.9832038, 0.08883481, 0.3137255, 1, 0, 1,
-0.5736745, -1.081592, -2.747385, 0.3098039, 1, 0, 1,
-0.5706624, -0.904023, -1.58999, 0.3019608, 1, 0, 1,
-0.5657257, -1.400261, -2.680676, 0.2941177, 1, 0, 1,
-0.563122, -1.512833, -3.639553, 0.2901961, 1, 0, 1,
-0.5621178, -0.749518, -3.856404, 0.282353, 1, 0, 1,
-0.5616311, 0.1237342, -1.115281, 0.2784314, 1, 0, 1,
-0.5608469, -0.877131, -3.533813, 0.2705882, 1, 0, 1,
-0.5529845, 1.255298, -0.1438736, 0.2666667, 1, 0, 1,
-0.5484903, -0.297246, -3.306222, 0.2588235, 1, 0, 1,
-0.5442801, -0.5716305, -1.245238, 0.254902, 1, 0, 1,
-0.5364685, 0.5321441, -0.3651472, 0.2470588, 1, 0, 1,
-0.5347507, -0.5710918, -3.889854, 0.2431373, 1, 0, 1,
-0.533093, -1.723482, -4.724235, 0.2352941, 1, 0, 1,
-0.5259967, 0.2896506, 0.5341854, 0.2313726, 1, 0, 1,
-0.5121924, -1.127109, -3.386613, 0.2235294, 1, 0, 1,
-0.5084665, 0.3796452, 0.6831552, 0.2196078, 1, 0, 1,
-0.505487, -0.713598, -2.210451, 0.2117647, 1, 0, 1,
-0.5015811, 1.573248, 0.2514774, 0.2078431, 1, 0, 1,
-0.5006618, 1.723661, -0.2847303, 0.2, 1, 0, 1,
-0.4988891, -2.691339, -1.990073, 0.1921569, 1, 0, 1,
-0.4988153, 0.4208293, -0.724697, 0.1882353, 1, 0, 1,
-0.4984078, -0.7415454, -1.511749, 0.1803922, 1, 0, 1,
-0.4928513, 0.1294458, -2.197299, 0.1764706, 1, 0, 1,
-0.4921971, -1.315025, -3.935803, 0.1686275, 1, 0, 1,
-0.4913911, -2.012273, -2.181667, 0.1647059, 1, 0, 1,
-0.4898666, 3.06698, 0.3846343, 0.1568628, 1, 0, 1,
-0.4865821, -0.3890831, -3.504088, 0.1529412, 1, 0, 1,
-0.4763137, -0.5063235, -1.170591, 0.145098, 1, 0, 1,
-0.4760953, 1.355605, 0.4633621, 0.1411765, 1, 0, 1,
-0.4759821, -0.813715, -3.088301, 0.1333333, 1, 0, 1,
-0.4637628, -0.6295992, -1.352395, 0.1294118, 1, 0, 1,
-0.4630807, -1.437584, -4.286488, 0.1215686, 1, 0, 1,
-0.4595205, 0.8460587, -0.3729516, 0.1176471, 1, 0, 1,
-0.4588751, 0.08152192, -0.7161982, 0.1098039, 1, 0, 1,
-0.4572456, -1.715446, -3.79923, 0.1058824, 1, 0, 1,
-0.45217, -0.08826786, -1.042805, 0.09803922, 1, 0, 1,
-0.4416917, -1.145317, -1.909092, 0.09019608, 1, 0, 1,
-0.4387236, 0.3480243, -2.230682, 0.08627451, 1, 0, 1,
-0.4361342, 0.8251542, -0.488004, 0.07843138, 1, 0, 1,
-0.4336698, -1.072197, -2.480919, 0.07450981, 1, 0, 1,
-0.4297978, -0.8579553, -2.70113, 0.06666667, 1, 0, 1,
-0.427167, 0.4343779, -0.572651, 0.0627451, 1, 0, 1,
-0.4142091, -0.249222, -3.207368, 0.05490196, 1, 0, 1,
-0.4097447, 0.9984211, 2.03, 0.05098039, 1, 0, 1,
-0.4020443, 0.3990755, 0.5403968, 0.04313726, 1, 0, 1,
-0.4007619, -1.071019, -3.75797, 0.03921569, 1, 0, 1,
-0.3971072, -1.109531, -4.459305, 0.03137255, 1, 0, 1,
-0.3929132, 0.7222353, -1.404854, 0.02745098, 1, 0, 1,
-0.3926797, -0.2221717, -1.547467, 0.01960784, 1, 0, 1,
-0.3892609, -0.1015316, -0.3270451, 0.01568628, 1, 0, 1,
-0.3851749, -0.5636244, -2.778748, 0.007843138, 1, 0, 1,
-0.3804166, 1.621574, 0.5172145, 0.003921569, 1, 0, 1,
-0.3785347, 0.3566259, -0.5466859, 0, 1, 0.003921569, 1,
-0.3742216, -0.8199964, -3.571865, 0, 1, 0.01176471, 1,
-0.3701262, -1.02792, -2.151397, 0, 1, 0.01568628, 1,
-0.3685099, -0.2365926, -1.627908, 0, 1, 0.02352941, 1,
-0.3644693, 0.6237325, 0.1394727, 0, 1, 0.02745098, 1,
-0.3637002, -1.416635, -2.566386, 0, 1, 0.03529412, 1,
-0.358518, 0.1764088, -1.300191, 0, 1, 0.03921569, 1,
-0.3583096, 1.186546, -1.089161, 0, 1, 0.04705882, 1,
-0.3577791, 1.106648, 1.192818, 0, 1, 0.05098039, 1,
-0.3534754, -2.04765, -1.133744, 0, 1, 0.05882353, 1,
-0.3495964, -1.870552, -3.156385, 0, 1, 0.0627451, 1,
-0.3476378, 1.463214, -0.4103877, 0, 1, 0.07058824, 1,
-0.3386666, 0.05014653, -1.47256, 0, 1, 0.07450981, 1,
-0.336162, -0.02140603, 0.2171224, 0, 1, 0.08235294, 1,
-0.3339935, 0.7236609, -0.598668, 0, 1, 0.08627451, 1,
-0.3316027, -0.2134104, -1.322379, 0, 1, 0.09411765, 1,
-0.3307056, 0.2434728, -0.2500119, 0, 1, 0.1019608, 1,
-0.3282061, 1.531947, -1.757055, 0, 1, 0.1058824, 1,
-0.3269744, 0.1763409, -1.124782, 0, 1, 0.1137255, 1,
-0.3263923, -1.969667, -1.339603, 0, 1, 0.1176471, 1,
-0.3180221, 1.309424, -0.7910342, 0, 1, 0.1254902, 1,
-0.3178483, -0.6363159, -3.680647, 0, 1, 0.1294118, 1,
-0.3127344, -1.005679, -3.337832, 0, 1, 0.1372549, 1,
-0.3050897, -1.349308, -2.493419, 0, 1, 0.1411765, 1,
-0.305077, -0.09499256, -2.736053, 0, 1, 0.1490196, 1,
-0.3028049, 0.4950197, -0.4636536, 0, 1, 0.1529412, 1,
-0.3000628, -0.75267, -1.712066, 0, 1, 0.1607843, 1,
-0.2995091, -1.751031, -3.798016, 0, 1, 0.1647059, 1,
-0.2962443, 0.3809566, 0.231521, 0, 1, 0.172549, 1,
-0.2932861, 0.7868202, 0.4602106, 0, 1, 0.1764706, 1,
-0.2927064, -0.2903252, -1.748198, 0, 1, 0.1843137, 1,
-0.2850843, 0.4917534, -0.4059063, 0, 1, 0.1882353, 1,
-0.2849624, -0.06232171, -3.084948, 0, 1, 0.1960784, 1,
-0.2798956, -1.803844, -1.905799, 0, 1, 0.2039216, 1,
-0.278491, 0.7904556, 0.3437422, 0, 1, 0.2078431, 1,
-0.277085, -0.5479337, -3.360765, 0, 1, 0.2156863, 1,
-0.2766747, -0.4815298, -1.553065, 0, 1, 0.2196078, 1,
-0.2718531, 1.537513, 0.6052991, 0, 1, 0.227451, 1,
-0.2678935, 1.276523, -0.237787, 0, 1, 0.2313726, 1,
-0.2648021, 0.9835882, 0.6291168, 0, 1, 0.2392157, 1,
-0.2647893, -0.140698, -1.593797, 0, 1, 0.2431373, 1,
-0.2618175, -0.6212704, -2.33553, 0, 1, 0.2509804, 1,
-0.2612578, -1.951179, -2.420811, 0, 1, 0.254902, 1,
-0.2589379, -0.09819678, -2.820745, 0, 1, 0.2627451, 1,
-0.2557224, 1.744652, -0.7191655, 0, 1, 0.2666667, 1,
-0.2525167, 0.1946309, -0.6769767, 0, 1, 0.2745098, 1,
-0.2504707, 1.105501, 0.4931609, 0, 1, 0.2784314, 1,
-0.2463084, 0.5885555, 1.742382, 0, 1, 0.2862745, 1,
-0.2408631, 0.8683113, 0.619611, 0, 1, 0.2901961, 1,
-0.2381658, 0.2337899, -1.550316, 0, 1, 0.2980392, 1,
-0.2366759, -1.090654, -3.539376, 0, 1, 0.3058824, 1,
-0.2302382, 0.05928399, -1.02447, 0, 1, 0.3098039, 1,
-0.222103, -0.5873361, -5.28574, 0, 1, 0.3176471, 1,
-0.2170413, -0.09743744, -1.256414, 0, 1, 0.3215686, 1,
-0.21235, 1.296584, 0.3166938, 0, 1, 0.3294118, 1,
-0.2120053, 0.8033155, -0.06480449, 0, 1, 0.3333333, 1,
-0.2117097, -0.08554953, -0.35541, 0, 1, 0.3411765, 1,
-0.2082212, -1.319272, -1.628111, 0, 1, 0.345098, 1,
-0.2004306, 0.6120888, -2.003694, 0, 1, 0.3529412, 1,
-0.2001722, -0.3799407, -1.559335, 0, 1, 0.3568628, 1,
-0.1997263, 0.07969845, -2.123122, 0, 1, 0.3647059, 1,
-0.1995192, 0.9276919, -1.220726, 0, 1, 0.3686275, 1,
-0.1982287, -0.6989292, -2.406615, 0, 1, 0.3764706, 1,
-0.1981375, 1.18135, -0.5597016, 0, 1, 0.3803922, 1,
-0.1978605, -1.569424, -2.017859, 0, 1, 0.3882353, 1,
-0.1931694, 0.0254269, -0.8160162, 0, 1, 0.3921569, 1,
-0.1867672, -0.3999817, -3.555908, 0, 1, 0.4, 1,
-0.1660071, 0.7469029, -2.257599, 0, 1, 0.4078431, 1,
-0.1651732, -1.554426, -1.99334, 0, 1, 0.4117647, 1,
-0.1625881, -0.2169276, -3.721525, 0, 1, 0.4196078, 1,
-0.1609386, 0.9349408, 0.9032808, 0, 1, 0.4235294, 1,
-0.1599094, 0.8724932, -0.06949091, 0, 1, 0.4313726, 1,
-0.1598946, 0.3230527, 0.2795094, 0, 1, 0.4352941, 1,
-0.1588656, -1.211057, -3.366425, 0, 1, 0.4431373, 1,
-0.1521456, 0.0935116, -1.665583, 0, 1, 0.4470588, 1,
-0.1510123, -1.210811, -4.503641, 0, 1, 0.454902, 1,
-0.1468938, -0.05333053, -2.099224, 0, 1, 0.4588235, 1,
-0.1452466, -0.9828379, -2.634988, 0, 1, 0.4666667, 1,
-0.1444327, -0.5226787, -3.33067, 0, 1, 0.4705882, 1,
-0.1401747, 0.3582427, 0.4142202, 0, 1, 0.4784314, 1,
-0.137826, -0.9130602, -1.039663, 0, 1, 0.4823529, 1,
-0.1364318, 0.1677946, 0.907586, 0, 1, 0.4901961, 1,
-0.1362634, 0.5768519, -1.085193, 0, 1, 0.4941176, 1,
-0.1337824, -0.2290306, -2.26214, 0, 1, 0.5019608, 1,
-0.1336857, 2.08799, -1.794682, 0, 1, 0.509804, 1,
-0.1288194, 0.2180683, -1.677294, 0, 1, 0.5137255, 1,
-0.1284219, -0.6606861, -2.565082, 0, 1, 0.5215687, 1,
-0.1284095, -0.7098275, -2.269004, 0, 1, 0.5254902, 1,
-0.1267349, 1.639666, -1.159905, 0, 1, 0.5333334, 1,
-0.1247983, -1.428059, -2.023701, 0, 1, 0.5372549, 1,
-0.1173114, -0.9995955, -2.808698, 0, 1, 0.5450981, 1,
-0.1150721, -0.822531, -2.967462, 0, 1, 0.5490196, 1,
-0.107222, -0.01699762, -1.550156, 0, 1, 0.5568628, 1,
-0.1064013, 1.306378, 0.02605393, 0, 1, 0.5607843, 1,
-0.1034234, -2.190459, -1.754009, 0, 1, 0.5686275, 1,
-0.0953036, -1.598804, -2.730117, 0, 1, 0.572549, 1,
-0.09385636, 0.9897383, -0.171648, 0, 1, 0.5803922, 1,
-0.09317461, -0.8122729, -3.210147, 0, 1, 0.5843138, 1,
-0.09278616, -1.407717, -3.495223, 0, 1, 0.5921569, 1,
-0.09261212, -0.7428057, -4.086826, 0, 1, 0.5960785, 1,
-0.09203313, -1.037148, -2.884266, 0, 1, 0.6039216, 1,
-0.0900039, -0.5434724, -1.881452, 0, 1, 0.6117647, 1,
-0.08446472, -1.250685, -3.002674, 0, 1, 0.6156863, 1,
-0.08068557, -0.5689057, -1.665543, 0, 1, 0.6235294, 1,
-0.07859433, 0.1456044, -0.7412184, 0, 1, 0.627451, 1,
-0.07724848, -0.4598747, -2.204653, 0, 1, 0.6352941, 1,
-0.07437954, 0.7597252, -0.978549, 0, 1, 0.6392157, 1,
-0.07035403, -0.8178734, -3.416684, 0, 1, 0.6470588, 1,
-0.06983157, -1.632786, -3.100981, 0, 1, 0.6509804, 1,
-0.06781323, 0.6479066, -1.453516, 0, 1, 0.6588235, 1,
-0.06706268, -0.3899769, -3.159128, 0, 1, 0.6627451, 1,
-0.05244656, 3.251346, -0.3325177, 0, 1, 0.6705883, 1,
-0.05126413, 0.2994632, 0.4586406, 0, 1, 0.6745098, 1,
-0.04938034, 0.780925, -3.457983, 0, 1, 0.682353, 1,
-0.04884925, 2.333094, 0.5366194, 0, 1, 0.6862745, 1,
-0.04630749, 0.43842, -0.9502808, 0, 1, 0.6941177, 1,
-0.04615651, -0.1713425, -2.988936, 0, 1, 0.7019608, 1,
-0.04440641, -0.660642, -4.104895, 0, 1, 0.7058824, 1,
-0.04314795, -0.2272135, -2.288256, 0, 1, 0.7137255, 1,
-0.04306533, 1.153904, -1.221565, 0, 1, 0.7176471, 1,
-0.0414948, -1.15389, -3.576939, 0, 1, 0.7254902, 1,
-0.04111621, -0.1376702, -2.147899, 0, 1, 0.7294118, 1,
-0.04089706, -0.1373859, -2.478332, 0, 1, 0.7372549, 1,
-0.03685437, 1.288764, 0.02752279, 0, 1, 0.7411765, 1,
-0.03643166, -0.7679477, -3.684889, 0, 1, 0.7490196, 1,
-0.02894471, -0.5972144, -2.768964, 0, 1, 0.7529412, 1,
-0.02458942, 0.9123216, 0.02246049, 0, 1, 0.7607843, 1,
-0.02446251, 0.1247909, -0.6162582, 0, 1, 0.7647059, 1,
-0.02006448, -0.0175704, -1.928424, 0, 1, 0.772549, 1,
-0.01406284, -0.2698762, -3.636701, 0, 1, 0.7764706, 1,
-0.0119648, 0.4294993, 0.3032481, 0, 1, 0.7843137, 1,
-0.01183312, -0.2028501, -5.085498, 0, 1, 0.7882353, 1,
-0.01078865, 0.6916357, 2.049107, 0, 1, 0.7960784, 1,
-0.01040734, 1.197084, 0.1356221, 0, 1, 0.8039216, 1,
-0.008652891, 0.120962, -0.1373224, 0, 1, 0.8078431, 1,
-0.006923938, 0.07677758, -0.005303777, 0, 1, 0.8156863, 1,
-0.00634934, -0.4395576, -4.775979, 0, 1, 0.8196079, 1,
-0.0005760663, 0.09951185, 0.1141296, 0, 1, 0.827451, 1,
-0.0003127761, -0.04702719, -3.674538, 0, 1, 0.8313726, 1,
-0.0003061171, -0.5913755, -1.557333, 0, 1, 0.8392157, 1,
0.000766821, 0.2322698, 1.549549, 0, 1, 0.8431373, 1,
0.002437188, -2.094643, 2.965505, 0, 1, 0.8509804, 1,
0.003158684, -0.2720185, 3.597396, 0, 1, 0.854902, 1,
0.003491625, -1.644253, 1.566936, 0, 1, 0.8627451, 1,
0.006190346, 0.5231191, 2.535556, 0, 1, 0.8666667, 1,
0.006528949, 1.21321, 0.1491844, 0, 1, 0.8745098, 1,
0.01338658, 0.4457611, -0.3061238, 0, 1, 0.8784314, 1,
0.01406709, -0.3958321, 2.489043, 0, 1, 0.8862745, 1,
0.01420898, 1.323094, 1.632587, 0, 1, 0.8901961, 1,
0.02067606, -0.7055008, 2.976134, 0, 1, 0.8980392, 1,
0.02259091, -1.570805, 2.009796, 0, 1, 0.9058824, 1,
0.02312255, -0.6364586, 3.649097, 0, 1, 0.9098039, 1,
0.02528591, 0.530055, 0.2817562, 0, 1, 0.9176471, 1,
0.02761343, 0.5757719, 2.444583, 0, 1, 0.9215686, 1,
0.03924141, -0.7029557, 3.896373, 0, 1, 0.9294118, 1,
0.04115793, 0.4954356, 0.1151487, 0, 1, 0.9333333, 1,
0.042687, -1.269807, 2.094305, 0, 1, 0.9411765, 1,
0.04277069, 2.691858, 0.1488657, 0, 1, 0.945098, 1,
0.04524902, 0.1304284, 0.2649189, 0, 1, 0.9529412, 1,
0.04937675, 0.4191288, -0.4640498, 0, 1, 0.9568627, 1,
0.04984028, 0.1478383, -0.7809975, 0, 1, 0.9647059, 1,
0.05058308, -2.290344, 3.8476, 0, 1, 0.9686275, 1,
0.05639389, -1.36612, 3.361823, 0, 1, 0.9764706, 1,
0.05697206, 0.777935, -1.415283, 0, 1, 0.9803922, 1,
0.06090711, -0.9579623, 4.181592, 0, 1, 0.9882353, 1,
0.06655457, 1.691934, -0.626403, 0, 1, 0.9921569, 1,
0.06811964, -0.5017425, 3.088649, 0, 1, 1, 1,
0.07363678, 1.848617, 0.1287755, 0, 0.9921569, 1, 1,
0.07526269, -0.1070913, 2.830427, 0, 0.9882353, 1, 1,
0.07611899, -0.7643162, 2.270872, 0, 0.9803922, 1, 1,
0.07809274, -1.47729, 2.804607, 0, 0.9764706, 1, 1,
0.07815176, 0.3875385, 1.008491, 0, 0.9686275, 1, 1,
0.07860187, -1.657229, 3.719276, 0, 0.9647059, 1, 1,
0.07889014, 0.2250823, 0.9605247, 0, 0.9568627, 1, 1,
0.07954378, -1.675184, 4.207066, 0, 0.9529412, 1, 1,
0.07997496, -0.258531, 1.986668, 0, 0.945098, 1, 1,
0.08675206, 0.04854311, 1.947241, 0, 0.9411765, 1, 1,
0.08912231, 0.3525676, -0.2618118, 0, 0.9333333, 1, 1,
0.09005619, -0.5500569, 3.614567, 0, 0.9294118, 1, 1,
0.09252916, 0.479407, 1.147144, 0, 0.9215686, 1, 1,
0.09322314, 0.3439818, 1.216406, 0, 0.9176471, 1, 1,
0.09429646, -1.120563, 3.108818, 0, 0.9098039, 1, 1,
0.09505928, 1.216218, -1.039887, 0, 0.9058824, 1, 1,
0.09622771, 1.798522, -0.8717127, 0, 0.8980392, 1, 1,
0.09738336, 0.6803457, -1.347784, 0, 0.8901961, 1, 1,
0.1010394, -0.6885929, 2.867168, 0, 0.8862745, 1, 1,
0.1028418, 0.7010254, 0.03105989, 0, 0.8784314, 1, 1,
0.1057744, 0.2566165, 0.8368917, 0, 0.8745098, 1, 1,
0.1097699, -1.403529, 1.566175, 0, 0.8666667, 1, 1,
0.1111313, -0.05159337, 1.659579, 0, 0.8627451, 1, 1,
0.112803, -1.303348, 2.746799, 0, 0.854902, 1, 1,
0.1151044, -0.3548434, 3.203299, 0, 0.8509804, 1, 1,
0.1172897, -0.4516233, 0.6451831, 0, 0.8431373, 1, 1,
0.1176386, -0.5039732, 3.248646, 0, 0.8392157, 1, 1,
0.1224832, 2.693588, -0.8543828, 0, 0.8313726, 1, 1,
0.1243927, 1.364295, -0.5071955, 0, 0.827451, 1, 1,
0.1264482, 0.2961654, -1.119572, 0, 0.8196079, 1, 1,
0.1305103, -0.3360513, 3.126309, 0, 0.8156863, 1, 1,
0.1333334, 1.035529, 0.05956075, 0, 0.8078431, 1, 1,
0.1342873, 0.8840969, -0.1171835, 0, 0.8039216, 1, 1,
0.1348018, -0.05158669, 1.550356, 0, 0.7960784, 1, 1,
0.1363301, 0.008544261, 2.910944, 0, 0.7882353, 1, 1,
0.136389, 0.3143024, 0.2047692, 0, 0.7843137, 1, 1,
0.1364157, 0.7611189, 0.399545, 0, 0.7764706, 1, 1,
0.1398831, -0.5001017, 1.444202, 0, 0.772549, 1, 1,
0.1401269, 1.359765, -1.160075, 0, 0.7647059, 1, 1,
0.1406091, 2.32234, -1.286455, 0, 0.7607843, 1, 1,
0.1431548, 0.1684246, -0.5847881, 0, 0.7529412, 1, 1,
0.1446142, 0.07198252, 2.610486, 0, 0.7490196, 1, 1,
0.145498, -0.2547001, 1.299074, 0, 0.7411765, 1, 1,
0.1465068, -1.874234, 1.552565, 0, 0.7372549, 1, 1,
0.1475854, -0.7408436, 3.059966, 0, 0.7294118, 1, 1,
0.1476296, -0.2943804, 3.28539, 0, 0.7254902, 1, 1,
0.1518645, -0.7371762, 2.899853, 0, 0.7176471, 1, 1,
0.1526128, -0.8156672, 1.843648, 0, 0.7137255, 1, 1,
0.1587009, 1.147836, -0.07656278, 0, 0.7058824, 1, 1,
0.1595382, -0.1878095, 1.702286, 0, 0.6980392, 1, 1,
0.1600556, 1.292014, -0.5836663, 0, 0.6941177, 1, 1,
0.1618756, -0.737017, 2.161763, 0, 0.6862745, 1, 1,
0.1621788, -0.6320806, 2.79318, 0, 0.682353, 1, 1,
0.1695113, 1.106329, 0.5927576, 0, 0.6745098, 1, 1,
0.1731423, 1.584615, -0.5104042, 0, 0.6705883, 1, 1,
0.1768617, -1.747392, 3.716354, 0, 0.6627451, 1, 1,
0.1769335, 0.06532694, 2.954136, 0, 0.6588235, 1, 1,
0.1814191, 0.7013335, 0.6210603, 0, 0.6509804, 1, 1,
0.1836264, 0.3577094, 1.956508, 0, 0.6470588, 1, 1,
0.1846307, 0.6837034, -1.039097, 0, 0.6392157, 1, 1,
0.1847061, 1.87457, 1.613346, 0, 0.6352941, 1, 1,
0.1870529, -1.575068, 3.201275, 0, 0.627451, 1, 1,
0.1895757, -0.06293639, 3.596733, 0, 0.6235294, 1, 1,
0.1941923, 0.2751159, -0.6900627, 0, 0.6156863, 1, 1,
0.1959806, -0.4441618, 3.580312, 0, 0.6117647, 1, 1,
0.196924, -0.3852396, 3.533701, 0, 0.6039216, 1, 1,
0.197104, 0.9429214, 0.9403536, 0, 0.5960785, 1, 1,
0.197452, 0.7050227, 1.14515, 0, 0.5921569, 1, 1,
0.1980846, 0.123372, -1.423965, 0, 0.5843138, 1, 1,
0.2044299, -1.760272, 2.943216, 0, 0.5803922, 1, 1,
0.2057801, 0.4281078, -0.4917907, 0, 0.572549, 1, 1,
0.2065681, 0.1340732, -0.2783543, 0, 0.5686275, 1, 1,
0.207841, 0.8457236, 0.1867883, 0, 0.5607843, 1, 1,
0.2165274, 0.9563587, -0.7967091, 0, 0.5568628, 1, 1,
0.2215413, -1.483929, 2.050866, 0, 0.5490196, 1, 1,
0.2219086, -0.702027, 5.003302, 0, 0.5450981, 1, 1,
0.2237588, -0.2235199, 3.064698, 0, 0.5372549, 1, 1,
0.2242307, -1.996719, 4.339787, 0, 0.5333334, 1, 1,
0.2266286, 0.2317542, 0.2278417, 0, 0.5254902, 1, 1,
0.2317946, 0.6260419, -0.3941974, 0, 0.5215687, 1, 1,
0.2362348, 1.73576, 0.1572618, 0, 0.5137255, 1, 1,
0.2365697, -0.8654914, 2.649788, 0, 0.509804, 1, 1,
0.2376379, 1.509937, -0.1271014, 0, 0.5019608, 1, 1,
0.2396187, -0.1157267, 1.338718, 0, 0.4941176, 1, 1,
0.2400469, -0.1510337, 2.736695, 0, 0.4901961, 1, 1,
0.2409686, -0.1719309, 3.523412, 0, 0.4823529, 1, 1,
0.2414589, -1.1244, 1.557338, 0, 0.4784314, 1, 1,
0.2425224, 1.442622, 0.2526219, 0, 0.4705882, 1, 1,
0.2441215, 0.4295432, 0.3300766, 0, 0.4666667, 1, 1,
0.2444917, 1.282591, 0.3124324, 0, 0.4588235, 1, 1,
0.2451728, -0.1042611, 3.725623, 0, 0.454902, 1, 1,
0.2488261, 0.7104561, -1.513295, 0, 0.4470588, 1, 1,
0.2494521, 0.5142577, 0.2570094, 0, 0.4431373, 1, 1,
0.2504323, -0.5886754, 3.376641, 0, 0.4352941, 1, 1,
0.2551077, 0.1899574, 1.255215, 0, 0.4313726, 1, 1,
0.2580471, -1.388682, 1.520946, 0, 0.4235294, 1, 1,
0.2623211, 1.167169, 1.064423, 0, 0.4196078, 1, 1,
0.2630475, 1.154188, 0.7336692, 0, 0.4117647, 1, 1,
0.2637473, 0.1631074, 1.001345, 0, 0.4078431, 1, 1,
0.2661794, -1.241882, 2.724531, 0, 0.4, 1, 1,
0.2687206, -1.729578, 3.685471, 0, 0.3921569, 1, 1,
0.2723797, -0.126617, 1.375527, 0, 0.3882353, 1, 1,
0.2725105, 0.6207713, 1.083877, 0, 0.3803922, 1, 1,
0.27506, -1.03898, 4.266479, 0, 0.3764706, 1, 1,
0.2836762, 0.1860184, 1.989993, 0, 0.3686275, 1, 1,
0.2839193, 0.7939711, -0.7034759, 0, 0.3647059, 1, 1,
0.2848843, -1.262551, 3.23401, 0, 0.3568628, 1, 1,
0.2876972, -2.080026, 1.700841, 0, 0.3529412, 1, 1,
0.290347, -0.07447761, 1.251897, 0, 0.345098, 1, 1,
0.2975602, -0.9688862, 3.625247, 0, 0.3411765, 1, 1,
0.3029681, 0.2858911, 0.3007562, 0, 0.3333333, 1, 1,
0.3032627, -0.9341136, 1.448059, 0, 0.3294118, 1, 1,
0.3045013, 0.3014107, 0.9068357, 0, 0.3215686, 1, 1,
0.3096175, -0.1938021, 0.1860247, 0, 0.3176471, 1, 1,
0.3116847, -0.02819095, 1.703176, 0, 0.3098039, 1, 1,
0.3117167, -1.05991, 0.9284755, 0, 0.3058824, 1, 1,
0.3150094, -0.3705482, 1.632176, 0, 0.2980392, 1, 1,
0.317705, -0.5257792, 4.582369, 0, 0.2901961, 1, 1,
0.3225264, -1.144013, 2.474312, 0, 0.2862745, 1, 1,
0.3242922, -1.312972, 5.047001, 0, 0.2784314, 1, 1,
0.3256036, 1.221339, -1.317584, 0, 0.2745098, 1, 1,
0.3359309, 0.08794689, 1.221186, 0, 0.2666667, 1, 1,
0.3366296, -1.052139, 1.533747, 0, 0.2627451, 1, 1,
0.349762, 0.9352033, 0.8381048, 0, 0.254902, 1, 1,
0.3518901, -0.3919735, 3.83932, 0, 0.2509804, 1, 1,
0.3532945, 1.044908, 0.9490056, 0, 0.2431373, 1, 1,
0.3568754, -1.394464, 5.000811, 0, 0.2392157, 1, 1,
0.3588424, 0.1395868, -0.1817603, 0, 0.2313726, 1, 1,
0.3610656, 1.020358, -0.5274315, 0, 0.227451, 1, 1,
0.3646549, 0.6305811, 1.916524, 0, 0.2196078, 1, 1,
0.3671375, 1.079838, 1.924481, 0, 0.2156863, 1, 1,
0.3706213, -1.660123, 5.097391, 0, 0.2078431, 1, 1,
0.372312, -0.6034606, 3.304461, 0, 0.2039216, 1, 1,
0.3729225, 0.2550843, 1.898446, 0, 0.1960784, 1, 1,
0.3732511, -0.0002135973, 2.436706, 0, 0.1882353, 1, 1,
0.3741724, -2.032588, 4.252008, 0, 0.1843137, 1, 1,
0.3759031, 1.201777, 0.1689616, 0, 0.1764706, 1, 1,
0.3781192, -0.6131569, 3.070848, 0, 0.172549, 1, 1,
0.3838118, 0.7357932, 1.665095, 0, 0.1647059, 1, 1,
0.3851984, 0.2482875, -0.7834749, 0, 0.1607843, 1, 1,
0.3863153, 0.03498105, 2.033098, 0, 0.1529412, 1, 1,
0.388369, -0.3148163, 1.959278, 0, 0.1490196, 1, 1,
0.3898095, -0.5806096, 2.153429, 0, 0.1411765, 1, 1,
0.3911421, -0.2841355, 3.108529, 0, 0.1372549, 1, 1,
0.393339, -0.1291585, 2.23994, 0, 0.1294118, 1, 1,
0.3976781, 0.0188792, 2.638201, 0, 0.1254902, 1, 1,
0.3986999, -0.4642101, 1.191267, 0, 0.1176471, 1, 1,
0.4015968, -2.273846, 4.149616, 0, 0.1137255, 1, 1,
0.402571, -0.09997554, 0.9712967, 0, 0.1058824, 1, 1,
0.4084302, 0.2658092, -0.3584905, 0, 0.09803922, 1, 1,
0.4110925, -0.02295269, 1.69765, 0, 0.09411765, 1, 1,
0.413866, -0.976426, 2.959885, 0, 0.08627451, 1, 1,
0.4190407, -1.524449, 4.072905, 0, 0.08235294, 1, 1,
0.4229339, -0.05381537, 2.213756, 0, 0.07450981, 1, 1,
0.427412, -0.6045777, 2.454542, 0, 0.07058824, 1, 1,
0.4318034, 0.1581365, -0.006968594, 0, 0.0627451, 1, 1,
0.4322413, 0.7466158, 0.01002571, 0, 0.05882353, 1, 1,
0.4359363, -0.8418893, 2.935501, 0, 0.05098039, 1, 1,
0.4377441, -1.349179, 2.228317, 0, 0.04705882, 1, 1,
0.4429744, 0.6048288, 0.01731366, 0, 0.03921569, 1, 1,
0.4430819, 0.8159785, 0.3689281, 0, 0.03529412, 1, 1,
0.4461147, 1.24499, -0.9495854, 0, 0.02745098, 1, 1,
0.4522763, 1.54958, 1.807514, 0, 0.02352941, 1, 1,
0.4547069, -0.5202869, 3.975678, 0, 0.01568628, 1, 1,
0.4628076, 0.9574797, 0.629126, 0, 0.01176471, 1, 1,
0.464524, -0.09622207, 3.461015, 0, 0.003921569, 1, 1,
0.4693542, -0.2547464, 2.391358, 0.003921569, 0, 1, 1,
0.4709976, 1.340662, 0.376164, 0.007843138, 0, 1, 1,
0.4720916, 0.2552524, 0.4346885, 0.01568628, 0, 1, 1,
0.4723336, 0.2411212, 1.028794, 0.01960784, 0, 1, 1,
0.4736298, -0.8932362, 2.932435, 0.02745098, 0, 1, 1,
0.4792148, -0.2230619, 3.568091, 0.03137255, 0, 1, 1,
0.4795015, 1.698039, 1.247323, 0.03921569, 0, 1, 1,
0.4809183, -0.5246174, 3.75924, 0.04313726, 0, 1, 1,
0.4811282, 0.6798366, 0.2892781, 0.05098039, 0, 1, 1,
0.4837409, -0.9504407, 2.998859, 0.05490196, 0, 1, 1,
0.4852609, 2.109595, -0.01963115, 0.0627451, 0, 1, 1,
0.486342, -0.910168, 2.292296, 0.06666667, 0, 1, 1,
0.4865871, 2.001725, 0.7078247, 0.07450981, 0, 1, 1,
0.4867864, 1.1015, 0.01167143, 0.07843138, 0, 1, 1,
0.4895881, -1.512442, 4.042581, 0.08627451, 0, 1, 1,
0.4935961, 0.6318364, -0.2455975, 0.09019608, 0, 1, 1,
0.496911, -0.6167579, 2.615568, 0.09803922, 0, 1, 1,
0.5007622, -0.360154, 2.10936, 0.1058824, 0, 1, 1,
0.5031271, 0.0211638, 0.5869228, 0.1098039, 0, 1, 1,
0.5091204, 0.6660822, 0.7100037, 0.1176471, 0, 1, 1,
0.518831, 0.2368934, 1.88279, 0.1215686, 0, 1, 1,
0.5188516, -0.3276537, 3.046007, 0.1294118, 0, 1, 1,
0.5192111, -1.250352, 1.447631, 0.1333333, 0, 1, 1,
0.5193772, 1.209395, 1.898145, 0.1411765, 0, 1, 1,
0.5199997, -0.5418186, 0.754938, 0.145098, 0, 1, 1,
0.5217997, -0.2354645, 0.9875816, 0.1529412, 0, 1, 1,
0.5261112, -0.9907719, 1.679957, 0.1568628, 0, 1, 1,
0.5271425, -0.1790566, 2.318314, 0.1647059, 0, 1, 1,
0.5296525, -0.2029035, 0.2446125, 0.1686275, 0, 1, 1,
0.5301337, -0.2247056, 1.327778, 0.1764706, 0, 1, 1,
0.5322241, 0.69328, 1.134637, 0.1803922, 0, 1, 1,
0.5323144, 1.120019, -2.12609, 0.1882353, 0, 1, 1,
0.5346237, -0.6478433, 3.533082, 0.1921569, 0, 1, 1,
0.5351366, 0.08350536, 0.7660544, 0.2, 0, 1, 1,
0.5359954, 0.6526964, 0.4493814, 0.2078431, 0, 1, 1,
0.5404316, 0.0567684, 1.785898, 0.2117647, 0, 1, 1,
0.5457353, 1.583854, 0.5848843, 0.2196078, 0, 1, 1,
0.5474494, 1.520029, 0.1779435, 0.2235294, 0, 1, 1,
0.5478253, -0.3911572, 1.630608, 0.2313726, 0, 1, 1,
0.5482046, 0.3738024, 0.8123818, 0.2352941, 0, 1, 1,
0.5536243, -0.2566625, 3.687526, 0.2431373, 0, 1, 1,
0.5538961, -1.323029, 2.429516, 0.2470588, 0, 1, 1,
0.5580196, 1.447112, 0.7900549, 0.254902, 0, 1, 1,
0.5583342, -0.04185466, 2.860549, 0.2588235, 0, 1, 1,
0.562557, 1.374857, 0.4022419, 0.2666667, 0, 1, 1,
0.56392, -0.708741, 3.419316, 0.2705882, 0, 1, 1,
0.5648664, -0.1361523, 2.131941, 0.2784314, 0, 1, 1,
0.569571, -1.623721, 3.338232, 0.282353, 0, 1, 1,
0.5723196, 1.011289, 0.6499382, 0.2901961, 0, 1, 1,
0.5757677, 0.7442629, -0.3148284, 0.2941177, 0, 1, 1,
0.5766669, 0.05367401, 2.136338, 0.3019608, 0, 1, 1,
0.5776281, 1.837149, -1.607155, 0.3098039, 0, 1, 1,
0.579962, -0.1291392, 2.32855, 0.3137255, 0, 1, 1,
0.5806804, -0.4304852, 1.380009, 0.3215686, 0, 1, 1,
0.5860723, -0.5984992, 2.253987, 0.3254902, 0, 1, 1,
0.588963, 1.581313, 2.459663, 0.3333333, 0, 1, 1,
0.5920894, -2.233086, 3.701962, 0.3372549, 0, 1, 1,
0.5945658, -1.420655, 2.750889, 0.345098, 0, 1, 1,
0.5963836, -1.356337, 2.201948, 0.3490196, 0, 1, 1,
0.6028651, -2.191442, 1.748739, 0.3568628, 0, 1, 1,
0.6051227, -0.5787748, 4.019711, 0.3607843, 0, 1, 1,
0.6078486, 1.922335, 0.2680867, 0.3686275, 0, 1, 1,
0.6080269, -0.5300359, 2.508331, 0.372549, 0, 1, 1,
0.6119202, 1.203189, 0.8676295, 0.3803922, 0, 1, 1,
0.6166061, 0.04250059, -0.2324387, 0.3843137, 0, 1, 1,
0.6240899, -0.4595834, 3.844612, 0.3921569, 0, 1, 1,
0.6243628, 1.188769, -1.0688, 0.3960784, 0, 1, 1,
0.6243742, -0.04911249, 0.5147457, 0.4039216, 0, 1, 1,
0.6271998, -0.9022179, 3.164025, 0.4117647, 0, 1, 1,
0.6301155, -0.2159974, 2.132988, 0.4156863, 0, 1, 1,
0.6306578, 0.0005951186, 2.616448, 0.4235294, 0, 1, 1,
0.6319705, -1.212211, 1.998763, 0.427451, 0, 1, 1,
0.6328993, -1.893391, 2.289901, 0.4352941, 0, 1, 1,
0.6378543, -0.08713198, 1.686956, 0.4392157, 0, 1, 1,
0.6408072, 1.834577, 0.4651372, 0.4470588, 0, 1, 1,
0.6459948, 0.4350641, 0.6847693, 0.4509804, 0, 1, 1,
0.6468332, 0.11901, 0.944986, 0.4588235, 0, 1, 1,
0.6475608, 0.7410318, -0.9842803, 0.4627451, 0, 1, 1,
0.6505825, -0.7132886, 3.146676, 0.4705882, 0, 1, 1,
0.6520473, 1.587451, 0.3551998, 0.4745098, 0, 1, 1,
0.6594965, -0.5993606, 3.418567, 0.4823529, 0, 1, 1,
0.6612638, -0.8048866, 1.531896, 0.4862745, 0, 1, 1,
0.6630344, -0.1734308, 1.168994, 0.4941176, 0, 1, 1,
0.6650895, -1.762119, 3.329366, 0.5019608, 0, 1, 1,
0.6689488, 1.405438, -0.6990173, 0.5058824, 0, 1, 1,
0.6704497, -1.385638, 1.254363, 0.5137255, 0, 1, 1,
0.6718603, -0.3657673, 3.159375, 0.5176471, 0, 1, 1,
0.6723225, 1.396001, -0.2205636, 0.5254902, 0, 1, 1,
0.674585, -0.1841657, -0.5600532, 0.5294118, 0, 1, 1,
0.6798224, 1.684794, -0.6038365, 0.5372549, 0, 1, 1,
0.6799846, -1.239691, 1.535814, 0.5411765, 0, 1, 1,
0.685061, 0.3733952, 1.717229, 0.5490196, 0, 1, 1,
0.6871798, 2.433701, 0.8047726, 0.5529412, 0, 1, 1,
0.6886385, -1.29898, 1.921777, 0.5607843, 0, 1, 1,
0.6925259, -0.1262955, 1.248915, 0.5647059, 0, 1, 1,
0.6943622, 0.6863878, 0.8789104, 0.572549, 0, 1, 1,
0.694501, -0.462632, 1.112068, 0.5764706, 0, 1, 1,
0.6954313, 0.5176198, 2.694558, 0.5843138, 0, 1, 1,
0.6977731, -1.661324, 3.255788, 0.5882353, 0, 1, 1,
0.6996124, -0.3659015, 2.431021, 0.5960785, 0, 1, 1,
0.699782, -2.397481, 1.405329, 0.6039216, 0, 1, 1,
0.7025589, -0.9834238, 2.280811, 0.6078432, 0, 1, 1,
0.7043124, -1.200075, 1.891441, 0.6156863, 0, 1, 1,
0.7069829, -0.1947454, 1.660882, 0.6196079, 0, 1, 1,
0.7077304, -0.7331507, 1.253192, 0.627451, 0, 1, 1,
0.7082974, -0.515685, 3.052369, 0.6313726, 0, 1, 1,
0.7101855, 0.9636582, -1.148909, 0.6392157, 0, 1, 1,
0.7229146, -0.2673939, 1.829589, 0.6431373, 0, 1, 1,
0.724229, -1.106828, 2.409035, 0.6509804, 0, 1, 1,
0.7248839, 0.6391827, 0.5834216, 0.654902, 0, 1, 1,
0.7250205, 0.4511231, -0.2552609, 0.6627451, 0, 1, 1,
0.7368973, -0.307303, 1.969134, 0.6666667, 0, 1, 1,
0.7408915, -2.32946, 2.356606, 0.6745098, 0, 1, 1,
0.745009, 0.5897208, 2.165717, 0.6784314, 0, 1, 1,
0.7462562, 0.2309753, 0.6719637, 0.6862745, 0, 1, 1,
0.7463421, 1.262952, -0.5465215, 0.6901961, 0, 1, 1,
0.7474613, -0.3879871, 2.405756, 0.6980392, 0, 1, 1,
0.7634997, 0.3773292, 2.285506, 0.7058824, 0, 1, 1,
0.7650803, -0.7390826, 2.063665, 0.7098039, 0, 1, 1,
0.7652383, -0.9250048, 1.846394, 0.7176471, 0, 1, 1,
0.7672868, -0.502071, 1.706755, 0.7215686, 0, 1, 1,
0.7795468, -0.6540946, 1.992917, 0.7294118, 0, 1, 1,
0.7834905, -0.7097535, 2.833853, 0.7333333, 0, 1, 1,
0.7845782, 0.6519354, 1.487182, 0.7411765, 0, 1, 1,
0.7888749, 0.8456014, 0.5280087, 0.7450981, 0, 1, 1,
0.7923759, 0.9306955, 1.216304, 0.7529412, 0, 1, 1,
0.7949766, 0.5113331, 2.90479, 0.7568628, 0, 1, 1,
0.8082266, 1.839814, -1.180022, 0.7647059, 0, 1, 1,
0.8087961, -0.09081247, 2.232692, 0.7686275, 0, 1, 1,
0.8130482, 1.58167, -1.09779, 0.7764706, 0, 1, 1,
0.8152471, 0.1623705, 1.869932, 0.7803922, 0, 1, 1,
0.8167, 0.2893772, 1.103268, 0.7882353, 0, 1, 1,
0.8181806, -1.006773, 2.651682, 0.7921569, 0, 1, 1,
0.8184052, 0.3739175, 1.674335, 0.8, 0, 1, 1,
0.8284366, 0.9565699, -1.308741, 0.8078431, 0, 1, 1,
0.8327508, 2.381572, 2.336472, 0.8117647, 0, 1, 1,
0.8430406, 0.7677955, 1.677346, 0.8196079, 0, 1, 1,
0.8446649, -0.3670579, 1.084903, 0.8235294, 0, 1, 1,
0.8509219, 0.3858647, 2.985526, 0.8313726, 0, 1, 1,
0.8515264, -1.611749, 2.890475, 0.8352941, 0, 1, 1,
0.8574286, 2.566029, -0.2584098, 0.8431373, 0, 1, 1,
0.8684962, 0.02682229, 1.106818, 0.8470588, 0, 1, 1,
0.8782055, 1.036513, -0.2866831, 0.854902, 0, 1, 1,
0.8786708, 0.2129667, -0.4154091, 0.8588235, 0, 1, 1,
0.8964548, 1.202599, 2.7354, 0.8666667, 0, 1, 1,
0.9135095, 1.081208, 2.29121, 0.8705882, 0, 1, 1,
0.9164509, -0.3137558, 3.053704, 0.8784314, 0, 1, 1,
0.9211791, -0.09586724, 1.121944, 0.8823529, 0, 1, 1,
0.923553, -0.8451749, 1.430303, 0.8901961, 0, 1, 1,
0.9246505, -0.4235204, 2.147181, 0.8941177, 0, 1, 1,
0.9348217, 1.202247, -0.04061662, 0.9019608, 0, 1, 1,
0.9353629, 1.210479, 0.2111985, 0.9098039, 0, 1, 1,
0.9376386, 0.2487649, 0.03758337, 0.9137255, 0, 1, 1,
0.9387299, 0.01297457, 1.249954, 0.9215686, 0, 1, 1,
0.9442302, -1.114017, 0.9806412, 0.9254902, 0, 1, 1,
0.9498967, -2.161735, 2.423643, 0.9333333, 0, 1, 1,
0.9523937, -0.2202179, 4.787965, 0.9372549, 0, 1, 1,
0.9526441, 1.138749, 1.092492, 0.945098, 0, 1, 1,
0.9535001, 0.1053892, 2.840053, 0.9490196, 0, 1, 1,
0.9571543, 1.296874, 0.3278631, 0.9568627, 0, 1, 1,
0.9661877, -0.8531142, 2.018571, 0.9607843, 0, 1, 1,
0.9662958, 1.267157, 1.106361, 0.9686275, 0, 1, 1,
0.9675161, 0.7357624, 1.309916, 0.972549, 0, 1, 1,
0.9727774, 1.341684, -0.5195287, 0.9803922, 0, 1, 1,
0.9787219, 1.07127, 2.252806, 0.9843137, 0, 1, 1,
0.9836289, 0.04827931, 2.148145, 0.9921569, 0, 1, 1,
0.9872087, 0.03498259, 0.8549666, 0.9960784, 0, 1, 1,
0.9874659, -0.2989164, 3.131969, 1, 0, 0.9960784, 1,
0.9887908, 0.8643352, -0.4537995, 1, 0, 0.9882353, 1,
0.9942517, -0.4588583, 2.154744, 1, 0, 0.9843137, 1,
1.007125, 0.3791027, 1.98406, 1, 0, 0.9764706, 1,
1.015937, -0.2311427, 2.016644, 1, 0, 0.972549, 1,
1.021714, -0.2901421, 3.235846, 1, 0, 0.9647059, 1,
1.028669, -0.2426383, 1.934452, 1, 0, 0.9607843, 1,
1.04021, 1.686615, 1.059051, 1, 0, 0.9529412, 1,
1.044196, -1.267686, 2.051785, 1, 0, 0.9490196, 1,
1.049106, 0.07851893, 1.072667, 1, 0, 0.9411765, 1,
1.056453, -0.3420637, 0.5855747, 1, 0, 0.9372549, 1,
1.063073, 0.02762053, 1.874681, 1, 0, 0.9294118, 1,
1.064324, 2.100449, 1.785317, 1, 0, 0.9254902, 1,
1.067593, 1.46667, 1.1556, 1, 0, 0.9176471, 1,
1.067861, -2.592023, 3.305991, 1, 0, 0.9137255, 1,
1.0691, -1.213888, 4.246792, 1, 0, 0.9058824, 1,
1.078743, 0.4325405, 0.5095687, 1, 0, 0.9019608, 1,
1.087241, 0.5203475, 1.113301, 1, 0, 0.8941177, 1,
1.095445, 0.4133785, -0.2234057, 1, 0, 0.8862745, 1,
1.101948, -1.559246, 1.996511, 1, 0, 0.8823529, 1,
1.102708, -0.1624243, 2.374431, 1, 0, 0.8745098, 1,
1.103525, 0.4545729, 0.04751385, 1, 0, 0.8705882, 1,
1.103923, -2.216267, 1.830166, 1, 0, 0.8627451, 1,
1.109838, 1.393455, -0.4531632, 1, 0, 0.8588235, 1,
1.11349, 1.26583, 0.788184, 1, 0, 0.8509804, 1,
1.12937, 1.828307, 0.8078383, 1, 0, 0.8470588, 1,
1.129801, 0.1993498, 3.20238, 1, 0, 0.8392157, 1,
1.130726, -0.1379095, 1.7356, 1, 0, 0.8352941, 1,
1.133051, 1.377725, 1.095596, 1, 0, 0.827451, 1,
1.135351, 0.7803331, 2.215398, 1, 0, 0.8235294, 1,
1.14277, 0.4762425, 0.4486377, 1, 0, 0.8156863, 1,
1.158937, -0.15448, 0.3083679, 1, 0, 0.8117647, 1,
1.164666, 1.251819, -0.19563, 1, 0, 0.8039216, 1,
1.168656, -1.027593, 3.565561, 1, 0, 0.7960784, 1,
1.172443, 1.510432, 2.649605, 1, 0, 0.7921569, 1,
1.17393, 0.3276055, 0.6234865, 1, 0, 0.7843137, 1,
1.18766, 0.5837616, 0.08230472, 1, 0, 0.7803922, 1,
1.188593, 1.354784, 1.040527, 1, 0, 0.772549, 1,
1.196074, 0.6512678, 2.35586, 1, 0, 0.7686275, 1,
1.196746, -1.488781, 1.660292, 1, 0, 0.7607843, 1,
1.197661, -0.09595466, 1.997709, 1, 0, 0.7568628, 1,
1.201646, 1.363791, -0.3964687, 1, 0, 0.7490196, 1,
1.201764, 2.410164, 1.751073, 1, 0, 0.7450981, 1,
1.21461, -0.1964516, 0.9884934, 1, 0, 0.7372549, 1,
1.260486, -0.1549513, 1.1836, 1, 0, 0.7333333, 1,
1.262645, -0.7993681, 1.99254, 1, 0, 0.7254902, 1,
1.268581, 0.987276, 0.9503843, 1, 0, 0.7215686, 1,
1.272028, -0.06232464, 2.572809, 1, 0, 0.7137255, 1,
1.281207, 1.695643, 1.921468, 1, 0, 0.7098039, 1,
1.284626, 1.38815, 1.010796, 1, 0, 0.7019608, 1,
1.298409, 1.056104, 0.6701318, 1, 0, 0.6941177, 1,
1.302044, 0.1095833, 0.3453227, 1, 0, 0.6901961, 1,
1.305163, -0.8995196, 0.7696846, 1, 0, 0.682353, 1,
1.306982, 0.7134917, 1.255099, 1, 0, 0.6784314, 1,
1.313312, -1.316808, 2.624043, 1, 0, 0.6705883, 1,
1.314602, -0.8054385, 2.347777, 1, 0, 0.6666667, 1,
1.315206, 1.335851, 0.5557589, 1, 0, 0.6588235, 1,
1.318346, -1.516672, 2.951692, 1, 0, 0.654902, 1,
1.323818, 0.3885197, 1.120579, 1, 0, 0.6470588, 1,
1.33653, -0.9115522, 3.542734, 1, 0, 0.6431373, 1,
1.34552, -0.3008945, 0.8471261, 1, 0, 0.6352941, 1,
1.34655, -0.9436784, 3.069076, 1, 0, 0.6313726, 1,
1.352413, -0.4336371, 2.857448, 1, 0, 0.6235294, 1,
1.357815, 1.045614, 0.08634117, 1, 0, 0.6196079, 1,
1.358264, 0.2481608, 2.266388, 1, 0, 0.6117647, 1,
1.361559, -1.149857, 3.262871, 1, 0, 0.6078432, 1,
1.364568, 0.5626581, -0.02382536, 1, 0, 0.6, 1,
1.389131, -1.343134, 3.885705, 1, 0, 0.5921569, 1,
1.394755, 0.1440333, 2.379097, 1, 0, 0.5882353, 1,
1.41588, 0.7629285, 1.078613, 1, 0, 0.5803922, 1,
1.416708, 0.1865692, 1.085391, 1, 0, 0.5764706, 1,
1.421974, -0.9743071, 2.377572, 1, 0, 0.5686275, 1,
1.430623, -1.231825, 2.031904, 1, 0, 0.5647059, 1,
1.435645, -0.9802139, 1.786952, 1, 0, 0.5568628, 1,
1.436239, -0.5995515, 1.435034, 1, 0, 0.5529412, 1,
1.450394, 0.05121734, 1.438227, 1, 0, 0.5450981, 1,
1.456854, -0.8493202, 2.216106, 1, 0, 0.5411765, 1,
1.458274, -1.164122, 1.87383, 1, 0, 0.5333334, 1,
1.458969, -0.4389437, 1.56631, 1, 0, 0.5294118, 1,
1.461162, -0.8274474, 3.326133, 1, 0, 0.5215687, 1,
1.467667, -0.5187277, 1.126958, 1, 0, 0.5176471, 1,
1.467826, -1.049107, 1.801772, 1, 0, 0.509804, 1,
1.468515, 2.024543, 0.3339619, 1, 0, 0.5058824, 1,
1.476462, -0.6917973, 0.6911888, 1, 0, 0.4980392, 1,
1.477022, -0.0780311, 1.100876, 1, 0, 0.4901961, 1,
1.480395, -0.6922391, 1.058223, 1, 0, 0.4862745, 1,
1.484558, 1.305847, -0.02651784, 1, 0, 0.4784314, 1,
1.49683, 0.232209, 1.325718, 1, 0, 0.4745098, 1,
1.51382, -0.0987654, 2.153546, 1, 0, 0.4666667, 1,
1.518891, 0.2157034, 1.382084, 1, 0, 0.4627451, 1,
1.519785, -0.7011329, 3.546676, 1, 0, 0.454902, 1,
1.53383, 0.9853535, 2.196608, 1, 0, 0.4509804, 1,
1.551468, -0.0672194, 1.850191, 1, 0, 0.4431373, 1,
1.55314, -2.095524, 1.412827, 1, 0, 0.4392157, 1,
1.559664, 1.845111, -1.369154, 1, 0, 0.4313726, 1,
1.5866, -0.05308422, 3.359229, 1, 0, 0.427451, 1,
1.587696, 1.395834, 0.07401011, 1, 0, 0.4196078, 1,
1.592711, -0.4522425, 0.1848556, 1, 0, 0.4156863, 1,
1.593007, 0.336095, -0.2623225, 1, 0, 0.4078431, 1,
1.595937, -0.5985848, 3.08351, 1, 0, 0.4039216, 1,
1.602862, -0.254789, 1.756719, 1, 0, 0.3960784, 1,
1.609597, -0.1053181, 3.664051, 1, 0, 0.3882353, 1,
1.620339, -0.640574, 2.947166, 1, 0, 0.3843137, 1,
1.63085, 0.5580306, 1.628086, 1, 0, 0.3764706, 1,
1.634068, -1.059954, 2.500424, 1, 0, 0.372549, 1,
1.641526, -0.07775213, 0.4434389, 1, 0, 0.3647059, 1,
1.644599, -0.3521078, 4.162167, 1, 0, 0.3607843, 1,
1.652447, 1.685499, -0.2730686, 1, 0, 0.3529412, 1,
1.665926, -0.350712, 1.428154, 1, 0, 0.3490196, 1,
1.678757, -0.1598624, 3.245353, 1, 0, 0.3411765, 1,
1.679099, -0.9825945, 1.088162, 1, 0, 0.3372549, 1,
1.686302, -0.4415347, 4.03445, 1, 0, 0.3294118, 1,
1.692581, 0.1275416, 2.21968, 1, 0, 0.3254902, 1,
1.697472, 1.080982, 2.421597, 1, 0, 0.3176471, 1,
1.719518, 2.556017, 0.212681, 1, 0, 0.3137255, 1,
1.735956, 0.6398555, 3.112362, 1, 0, 0.3058824, 1,
1.739872, -0.07050098, 0.3059088, 1, 0, 0.2980392, 1,
1.75782, -1.865327, 2.925774, 1, 0, 0.2941177, 1,
1.769242, -0.2197517, 0.8118296, 1, 0, 0.2862745, 1,
1.782295, 0.8807449, -1.361354, 1, 0, 0.282353, 1,
1.787765, 0.4381519, 2.442746, 1, 0, 0.2745098, 1,
1.788698, 0.3275461, 2.102915, 1, 0, 0.2705882, 1,
1.790789, -0.994121, 2.593546, 1, 0, 0.2627451, 1,
1.806883, 1.000612, 2.257181, 1, 0, 0.2588235, 1,
1.81537, -0.5019102, 0.8746695, 1, 0, 0.2509804, 1,
1.816942, -1.599582, 1.172196, 1, 0, 0.2470588, 1,
1.819808, -0.2349775, 1.494327, 1, 0, 0.2392157, 1,
1.852035, 1.260743, 1.331139, 1, 0, 0.2352941, 1,
1.862933, 0.4151738, 1.795872, 1, 0, 0.227451, 1,
1.869719, 0.3971836, 0.8457493, 1, 0, 0.2235294, 1,
1.871113, 0.2769686, 0.8169226, 1, 0, 0.2156863, 1,
1.873204, -2.214382, 1.641699, 1, 0, 0.2117647, 1,
1.889034, 0.946183, 2.059667, 1, 0, 0.2039216, 1,
1.901356, 1.031558, 1.900929, 1, 0, 0.1960784, 1,
1.902716, -1.341671, 1.293492, 1, 0, 0.1921569, 1,
1.912014, -0.05897731, 1.47168, 1, 0, 0.1843137, 1,
1.941624, 0.178691, 0.9267198, 1, 0, 0.1803922, 1,
1.964626, 1.30359, 1.189039, 1, 0, 0.172549, 1,
1.968445, 1.334229, 0.7512045, 1, 0, 0.1686275, 1,
1.972349, 1.037612, 0.8460282, 1, 0, 0.1607843, 1,
1.99053, -1.956387, 2.150047, 1, 0, 0.1568628, 1,
2.017649, -0.250187, 2.649532, 1, 0, 0.1490196, 1,
2.092148, 1.526734, 1.434134, 1, 0, 0.145098, 1,
2.16927, -0.7241879, 3.221133, 1, 0, 0.1372549, 1,
2.174011, 0.3086543, 2.169911, 1, 0, 0.1333333, 1,
2.222431, -1.306819, 3.287708, 1, 0, 0.1254902, 1,
2.267524, 1.195002, 1.872236, 1, 0, 0.1215686, 1,
2.286261, -0.3791113, 1.348087, 1, 0, 0.1137255, 1,
2.295119, -0.7357999, 2.468012, 1, 0, 0.1098039, 1,
2.311047, 0.5593106, 1.842511, 1, 0, 0.1019608, 1,
2.338956, -0.1646899, 3.372729, 1, 0, 0.09411765, 1,
2.37092, 1.626214, 1.607636, 1, 0, 0.09019608, 1,
2.403501, -0.5936576, 0.03704533, 1, 0, 0.08235294, 1,
2.441731, 1.493289, 1.366748, 1, 0, 0.07843138, 1,
2.4491, -1.308541, 3.968558, 1, 0, 0.07058824, 1,
2.473021, -1.890409, 0.7619352, 1, 0, 0.06666667, 1,
2.499869, -0.9529619, 1.9828, 1, 0, 0.05882353, 1,
2.503551, -0.4591857, 1.308842, 1, 0, 0.05490196, 1,
2.526081, 0.1650076, 0.4819572, 1, 0, 0.04705882, 1,
2.540173, -0.1160858, 2.406849, 1, 0, 0.04313726, 1,
2.541144, 0.5820184, 1.475777, 1, 0, 0.03529412, 1,
2.556857, 0.3408634, 1.90163, 1, 0, 0.03137255, 1,
2.568654, -0.1418741, 0.5672309, 1, 0, 0.02352941, 1,
2.769816, -0.1153153, 2.494347, 1, 0, 0.01960784, 1,
2.984717, -0.8701024, 1.008992, 1, 0, 0.01176471, 1,
3.404517, -0.9840494, 1.222005, 1, 0, 0.007843138, 1
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
0.2079387, -4.156086, -7.045681, 0, -0.5, 0.5, 0.5,
0.2079387, -4.156086, -7.045681, 1, -0.5, 0.5, 0.5,
0.2079387, -4.156086, -7.045681, 1, 1.5, 0.5, 0.5,
0.2079387, -4.156086, -7.045681, 0, 1.5, 0.5, 0.5
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
-4.072279, 0.08442366, -7.045681, 0, -0.5, 0.5, 0.5,
-4.072279, 0.08442366, -7.045681, 1, -0.5, 0.5, 0.5,
-4.072279, 0.08442366, -7.045681, 1, 1.5, 0.5, 0.5,
-4.072279, 0.08442366, -7.045681, 0, 1.5, 0.5, 0.5
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
-4.072279, -4.156086, -0.09417462, 0, -0.5, 0.5, 0.5,
-4.072279, -4.156086, -0.09417462, 1, -0.5, 0.5, 0.5,
-4.072279, -4.156086, -0.09417462, 1, 1.5, 0.5, 0.5,
-4.072279, -4.156086, -0.09417462, 0, 1.5, 0.5, 0.5
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
-2, -3.177507, -5.441487,
3, -3.177507, -5.441487,
-2, -3.177507, -5.441487,
-2, -3.340603, -5.708853,
-1, -3.177507, -5.441487,
-1, -3.340603, -5.708853,
0, -3.177507, -5.441487,
0, -3.340603, -5.708853,
1, -3.177507, -5.441487,
1, -3.340603, -5.708853,
2, -3.177507, -5.441487,
2, -3.340603, -5.708853,
3, -3.177507, -5.441487,
3, -3.340603, -5.708853
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
-2, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
-2, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
-2, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
-2, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5,
-1, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
-1, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
-1, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
-1, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5,
0, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
0, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
0, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
0, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5,
1, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
1, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
1, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
1, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5,
2, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
2, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
2, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
2, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5,
3, -3.666796, -6.243584, 0, -0.5, 0.5, 0.5,
3, -3.666796, -6.243584, 1, -0.5, 0.5, 0.5,
3, -3.666796, -6.243584, 1, 1.5, 0.5, 0.5,
3, -3.666796, -6.243584, 0, 1.5, 0.5, 0.5
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
-3.084537, -3, -5.441487,
-3.084537, 3, -5.441487,
-3.084537, -3, -5.441487,
-3.249161, -3, -5.708853,
-3.084537, -2, -5.441487,
-3.249161, -2, -5.708853,
-3.084537, -1, -5.441487,
-3.249161, -1, -5.708853,
-3.084537, 0, -5.441487,
-3.249161, 0, -5.708853,
-3.084537, 1, -5.441487,
-3.249161, 1, -5.708853,
-3.084537, 2, -5.441487,
-3.249161, 2, -5.708853,
-3.084537, 3, -5.441487,
-3.249161, 3, -5.708853
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
-3.578408, -3, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, -3, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, -3, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, -3, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, -2, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, -2, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, -2, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, -2, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, -1, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, -1, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, -1, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, -1, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, 0, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, 0, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, 0, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, 0, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, 1, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, 1, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, 1, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, 1, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, 2, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, 2, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, 2, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, 2, -6.243584, 0, 1.5, 0.5, 0.5,
-3.578408, 3, -6.243584, 0, -0.5, 0.5, 0.5,
-3.578408, 3, -6.243584, 1, -0.5, 0.5, 0.5,
-3.578408, 3, -6.243584, 1, 1.5, 0.5, 0.5,
-3.578408, 3, -6.243584, 0, 1.5, 0.5, 0.5
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
-3.084537, -3.177507, -4,
-3.084537, -3.177507, 4,
-3.084537, -3.177507, -4,
-3.249161, -3.340603, -4,
-3.084537, -3.177507, -2,
-3.249161, -3.340603, -2,
-3.084537, -3.177507, 0,
-3.249161, -3.340603, 0,
-3.084537, -3.177507, 2,
-3.249161, -3.340603, 2,
-3.084537, -3.177507, 4,
-3.249161, -3.340603, 4
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
-3.578408, -3.666796, -4, 0, -0.5, 0.5, 0.5,
-3.578408, -3.666796, -4, 1, -0.5, 0.5, 0.5,
-3.578408, -3.666796, -4, 1, 1.5, 0.5, 0.5,
-3.578408, -3.666796, -4, 0, 1.5, 0.5, 0.5,
-3.578408, -3.666796, -2, 0, -0.5, 0.5, 0.5,
-3.578408, -3.666796, -2, 1, -0.5, 0.5, 0.5,
-3.578408, -3.666796, -2, 1, 1.5, 0.5, 0.5,
-3.578408, -3.666796, -2, 0, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 0, 0, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 0, 1, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 0, 1, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 0, 0, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 2, 0, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 2, 1, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 2, 1, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 2, 0, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 4, 0, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 4, 1, -0.5, 0.5, 0.5,
-3.578408, -3.666796, 4, 1, 1.5, 0.5, 0.5,
-3.578408, -3.666796, 4, 0, 1.5, 0.5, 0.5
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
-3.084537, -3.177507, -5.441487,
-3.084537, 3.346354, -5.441487,
-3.084537, -3.177507, 5.253138,
-3.084537, 3.346354, 5.253138,
-3.084537, -3.177507, -5.441487,
-3.084537, -3.177507, 5.253138,
-3.084537, 3.346354, -5.441487,
-3.084537, 3.346354, 5.253138,
-3.084537, -3.177507, -5.441487,
3.500414, -3.177507, -5.441487,
-3.084537, -3.177507, 5.253138,
3.500414, -3.177507, 5.253138,
-3.084537, 3.346354, -5.441487,
3.500414, 3.346354, -5.441487,
-3.084537, 3.346354, 5.253138,
3.500414, 3.346354, 5.253138,
3.500414, -3.177507, -5.441487,
3.500414, 3.346354, -5.441487,
3.500414, -3.177507, 5.253138,
3.500414, 3.346354, 5.253138,
3.500414, -3.177507, -5.441487,
3.500414, -3.177507, 5.253138,
3.500414, 3.346354, -5.441487,
3.500414, 3.346354, 5.253138
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
var radius = 7.557237;
var distance = 33.623;
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
mvMatrix.translate( -0.2079387, -0.08442366, 0.09417462 );
mvMatrix.scale( 1.240865, 1.252484, 0.7640317 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.623);
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
Chlormephos<-read.table("Chlormephos.xyz", skip=1)
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
-2.988639, 0.2892491, -0.561469, 0, 0, 1, 1, 1,
-2.764318, -1.515142, -2.476136, 1, 0, 0, 1, 1,
-2.712648, -0.03044418, -2.34145, 1, 0, 0, 1, 1,
-2.554677, 1.727613, -0.06882573, 1, 0, 0, 1, 1,
-2.443963, 0.780803, -1.461604, 1, 0, 0, 1, 1,
-2.37469, -0.02103905, -0.6674482, 1, 0, 0, 1, 1,
-2.210465, -1.024969, -2.782748, 0, 0, 0, 1, 1,
-2.196845, 0.8382086, -0.8145983, 0, 0, 0, 1, 1,
-2.180021, 0.2905976, -0.9746557, 0, 0, 0, 1, 1,
-2.157686, 0.4192038, 0.6244518, 0, 0, 0, 1, 1,
-2.144499, -1.184738, -1.878895, 0, 0, 0, 1, 1,
-2.133475, -0.6461763, -2.734634, 0, 0, 0, 1, 1,
-2.126426, -0.2148293, -1.031173, 0, 0, 0, 1, 1,
-2.115101, -1.029284, -2.955971, 1, 1, 1, 1, 1,
-2.101329, -0.2779518, -1.381267, 1, 1, 1, 1, 1,
-2.090308, 0.4902556, -1.622435, 1, 1, 1, 1, 1,
-2.078438, 0.7628042, -2.022758, 1, 1, 1, 1, 1,
-2.05468, -0.2214063, -1.302784, 1, 1, 1, 1, 1,
-2.014235, -0.09171277, -1.202318, 1, 1, 1, 1, 1,
-2.006504, -0.7888629, -2.248264, 1, 1, 1, 1, 1,
-1.99675, 0.4538054, -0.4670072, 1, 1, 1, 1, 1,
-1.97792, -0.3291227, -2.417866, 1, 1, 1, 1, 1,
-1.932596, 0.7425871, -0.6267161, 1, 1, 1, 1, 1,
-1.901793, -1.042482, -3.181624, 1, 1, 1, 1, 1,
-1.891843, 0.6064595, -1.565994, 1, 1, 1, 1, 1,
-1.864958, -0.5122775, -1.076327, 1, 1, 1, 1, 1,
-1.842215, 0.2194897, -1.99246, 1, 1, 1, 1, 1,
-1.837455, -0.7315251, -2.102442, 1, 1, 1, 1, 1,
-1.818352, 0.8214484, -1.659491, 0, 0, 1, 1, 1,
-1.80682, 2.205027, -0.4050587, 1, 0, 0, 1, 1,
-1.796773, -0.1422597, -1.881566, 1, 0, 0, 1, 1,
-1.777755, -0.4233283, -1.449632, 1, 0, 0, 1, 1,
-1.771279, 0.5051036, -0.9001643, 1, 0, 0, 1, 1,
-1.763422, -0.0146167, -3.339556, 1, 0, 0, 1, 1,
-1.748555, -0.4310545, -1.527297, 0, 0, 0, 1, 1,
-1.732732, -1.006791, -0.7719831, 0, 0, 0, 1, 1,
-1.716237, 2.066626, -0.1540414, 0, 0, 0, 1, 1,
-1.707566, 0.09917562, -0.4554025, 0, 0, 0, 1, 1,
-1.705609, -0.778267, -1.972703, 0, 0, 0, 1, 1,
-1.704205, 2.112162, 0.09057259, 0, 0, 0, 1, 1,
-1.70392, 0.7457562, -0.007140748, 0, 0, 0, 1, 1,
-1.695713, 0.8640208, -0.6123474, 1, 1, 1, 1, 1,
-1.688574, -0.3081289, -1.101038, 1, 1, 1, 1, 1,
-1.682389, -0.1841648, -1.843407, 1, 1, 1, 1, 1,
-1.677536, 1.549143, -1.767748, 1, 1, 1, 1, 1,
-1.672341, 1.058154, 0.7027616, 1, 1, 1, 1, 1,
-1.66502, -0.2275731, -1.350492, 1, 1, 1, 1, 1,
-1.648513, -0.9824814, -2.394279, 1, 1, 1, 1, 1,
-1.64008, 0.5682076, -2.134161, 1, 1, 1, 1, 1,
-1.637053, -1.134579, -2.76076, 1, 1, 1, 1, 1,
-1.629233, -0.8099116, -2.951601, 1, 1, 1, 1, 1,
-1.627171, 0.6443184, 0.7793432, 1, 1, 1, 1, 1,
-1.625695, 0.7416252, -1.843889, 1, 1, 1, 1, 1,
-1.620352, -0.5074043, -2.801169, 1, 1, 1, 1, 1,
-1.540156, -0.2851803, -1.084968, 1, 1, 1, 1, 1,
-1.539057, -0.1600391, -2.599913, 1, 1, 1, 1, 1,
-1.533104, 0.1146487, -0.9573786, 0, 0, 1, 1, 1,
-1.527547, 0.8062862, -0.7763978, 1, 0, 0, 1, 1,
-1.526114, -0.1729802, -2.947259, 1, 0, 0, 1, 1,
-1.520824, -0.2235273, -0.5972244, 1, 0, 0, 1, 1,
-1.518385, -0.4192102, -1.253241, 1, 0, 0, 1, 1,
-1.511302, -0.7289191, -1.274669, 1, 0, 0, 1, 1,
-1.498411, -0.2052, -0.746975, 0, 0, 0, 1, 1,
-1.497455, 1.322795, -1.138978, 0, 0, 0, 1, 1,
-1.478383, -1.661942, -3.549181, 0, 0, 0, 1, 1,
-1.475557, 0.5268558, -1.224128, 0, 0, 0, 1, 1,
-1.473093, 1.555349, -0.9547361, 0, 0, 0, 1, 1,
-1.471554, -3.082499, -1.591356, 0, 0, 0, 1, 1,
-1.468789, 0.7462986, -0.4202106, 0, 0, 0, 1, 1,
-1.463429, -1.559863, -2.058917, 1, 1, 1, 1, 1,
-1.425726, 0.773946, -0.3871032, 1, 1, 1, 1, 1,
-1.419127, 0.4889996, -0.7031727, 1, 1, 1, 1, 1,
-1.418629, -0.8921815, -3.281935, 1, 1, 1, 1, 1,
-1.413786, 0.3349881, -0.9298388, 1, 1, 1, 1, 1,
-1.405952, 0.01126969, -0.786527, 1, 1, 1, 1, 1,
-1.397832, 0.5819111, -0.1320882, 1, 1, 1, 1, 1,
-1.396238, 0.1715967, -1.133867, 1, 1, 1, 1, 1,
-1.382696, -1.292439, -3.547357, 1, 1, 1, 1, 1,
-1.381913, -1.288326, -3.474352, 1, 1, 1, 1, 1,
-1.377696, 0.2190042, -2.251857, 1, 1, 1, 1, 1,
-1.360407, -1.71958, -0.1697802, 1, 1, 1, 1, 1,
-1.357409, -0.2606578, -3.17617, 1, 1, 1, 1, 1,
-1.356765, -1.400348, -1.5435, 1, 1, 1, 1, 1,
-1.354849, -0.02494235, 0.2913137, 1, 1, 1, 1, 1,
-1.351588, -1.401011, -0.8028026, 0, 0, 1, 1, 1,
-1.344276, -2.286903, -3.192299, 1, 0, 0, 1, 1,
-1.340458, 0.1186395, -1.651293, 1, 0, 0, 1, 1,
-1.339783, -0.8814968, -2.140161, 1, 0, 0, 1, 1,
-1.32007, 0.3702056, -2.584931, 1, 0, 0, 1, 1,
-1.313763, 0.02564459, -2.269956, 1, 0, 0, 1, 1,
-1.306852, -0.1766303, -3.40829, 0, 0, 0, 1, 1,
-1.30629, -0.9090359, -1.554174, 0, 0, 0, 1, 1,
-1.303243, 0.7731461, 0.1154122, 0, 0, 0, 1, 1,
-1.289907, -0.2964933, -2.769223, 0, 0, 0, 1, 1,
-1.281909, -1.690494, -2.771491, 0, 0, 0, 1, 1,
-1.281881, 0.005360409, -0.08164874, 0, 0, 0, 1, 1,
-1.280753, 0.261274, -0.0388432, 0, 0, 0, 1, 1,
-1.277512, -0.2003051, -0.6106683, 1, 1, 1, 1, 1,
-1.277287, -1.372401, -2.093836, 1, 1, 1, 1, 1,
-1.254565, -0.2619687, -0.9580839, 1, 1, 1, 1, 1,
-1.238645, -0.3847156, -1.943654, 1, 1, 1, 1, 1,
-1.238554, 0.7017121, -3.466366, 1, 1, 1, 1, 1,
-1.238377, 0.6365064, -1.089387, 1, 1, 1, 1, 1,
-1.237417, 0.289219, -2.248354, 1, 1, 1, 1, 1,
-1.217621, -0.2702623, -2.700487, 1, 1, 1, 1, 1,
-1.216215, 0.8298334, 0.03282591, 1, 1, 1, 1, 1,
-1.215099, 0.7539965, -0.4453714, 1, 1, 1, 1, 1,
-1.211402, 0.06929623, -2.57385, 1, 1, 1, 1, 1,
-1.203538, 0.1530023, -0.8297614, 1, 1, 1, 1, 1,
-1.19748, -0.9061064, -4.298963, 1, 1, 1, 1, 1,
-1.195078, 0.629593, -2.47851, 1, 1, 1, 1, 1,
-1.192266, 0.186487, -2.703154, 1, 1, 1, 1, 1,
-1.184062, 1.755173, 0.3217647, 0, 0, 1, 1, 1,
-1.176088, -0.3452002, -2.785403, 1, 0, 0, 1, 1,
-1.170947, -0.9405859, -2.846082, 1, 0, 0, 1, 1,
-1.164539, 0.7159327, -1.509686, 1, 0, 0, 1, 1,
-1.161265, -1.201511, -3.00757, 1, 0, 0, 1, 1,
-1.157615, -1.535167, -1.678332, 1, 0, 0, 1, 1,
-1.151087, 0.02158053, -0.8568957, 0, 0, 0, 1, 1,
-1.150533, -0.3111314, -2.250792, 0, 0, 0, 1, 1,
-1.150383, 0.7180273, -0.7301438, 0, 0, 0, 1, 1,
-1.14324, -0.4067908, -2.107402, 0, 0, 0, 1, 1,
-1.135214, 0.8631231, -0.9266633, 0, 0, 0, 1, 1,
-1.127116, -0.8287802, -2.696148, 0, 0, 0, 1, 1,
-1.126617, -1.614112, -3.672491, 0, 0, 0, 1, 1,
-1.124498, -0.541913, -2.753616, 1, 1, 1, 1, 1,
-1.118633, 0.6607486, -0.5238283, 1, 1, 1, 1, 1,
-1.115848, 0.001519409, -1.758498, 1, 1, 1, 1, 1,
-1.113429, -1.16972, -1.910121, 1, 1, 1, 1, 1,
-1.109327, -0.6169247, -3.143325, 1, 1, 1, 1, 1,
-1.102897, 1.054819, -0.2843603, 1, 1, 1, 1, 1,
-1.102757, -0.3809057, -1.981696, 1, 1, 1, 1, 1,
-1.101148, -1.033785, -1.310403, 1, 1, 1, 1, 1,
-1.101064, 0.1030559, -2.720447, 1, 1, 1, 1, 1,
-1.097612, -0.3508433, -1.26443, 1, 1, 1, 1, 1,
-1.095272, 0.2879919, -1.961153, 1, 1, 1, 1, 1,
-1.086511, 0.32409, -1.563395, 1, 1, 1, 1, 1,
-1.08469, -0.7364228, -1.39578, 1, 1, 1, 1, 1,
-1.083655, 0.9230537, -0.6715756, 1, 1, 1, 1, 1,
-1.078973, 0.8975064, 0.6245862, 1, 1, 1, 1, 1,
-1.078873, -0.6097785, -2.632932, 0, 0, 1, 1, 1,
-1.071741, 0.1748989, -2.887046, 1, 0, 0, 1, 1,
-1.061581, 0.1962157, -1.332221, 1, 0, 0, 1, 1,
-1.045545, -0.6667102, -0.7586129, 1, 0, 0, 1, 1,
-1.040992, -1.20934, -3.118033, 1, 0, 0, 1, 1,
-1.037473, -2.391036, -2.934169, 1, 0, 0, 1, 1,
-1.037164, 0.3860544, -1.221265, 0, 0, 0, 1, 1,
-1.024139, 0.0830017, -1.213496, 0, 0, 0, 1, 1,
-1.016969, 0.05848464, -1.509308, 0, 0, 0, 1, 1,
-1.008579, 0.02809516, 0.4086103, 0, 0, 0, 1, 1,
-1.000751, 0.7184768, -0.6652606, 0, 0, 0, 1, 1,
-0.9984163, 1.354986, 0.8041779, 0, 0, 0, 1, 1,
-0.9961545, 0.3173897, -1.11917, 0, 0, 0, 1, 1,
-0.9940368, 0.3102475, -0.4814462, 1, 1, 1, 1, 1,
-0.9896051, 0.1932574, -0.3442759, 1, 1, 1, 1, 1,
-0.9704431, 0.249679, -0.1788854, 1, 1, 1, 1, 1,
-0.97005, -0.9091837, -2.41188, 1, 1, 1, 1, 1,
-0.9697117, -0.3287295, -2.633354, 1, 1, 1, 1, 1,
-0.9676076, -0.4618202, -2.736739, 1, 1, 1, 1, 1,
-0.9666188, -0.4717578, -2.49723, 1, 1, 1, 1, 1,
-0.9654812, -0.4001977, -3.269831, 1, 1, 1, 1, 1,
-0.9644722, 0.1849573, -1.133186, 1, 1, 1, 1, 1,
-0.9622868, 0.0850316, -3.769845, 1, 1, 1, 1, 1,
-0.9620241, 0.4134577, -0.1125502, 1, 1, 1, 1, 1,
-0.9577727, -0.6304925, -1.539424, 1, 1, 1, 1, 1,
-0.9577632, -1.590207, -3.369632, 1, 1, 1, 1, 1,
-0.9562353, -1.431821, -1.059128, 1, 1, 1, 1, 1,
-0.9420296, 1.485394, -1.649873, 1, 1, 1, 1, 1,
-0.9413908, -0.6056551, -3.3468, 0, 0, 1, 1, 1,
-0.9397694, -1.796051, -1.704926, 1, 0, 0, 1, 1,
-0.9349309, -0.5614461, -2.166438, 1, 0, 0, 1, 1,
-0.9333611, 0.8187386, -3.030714, 1, 0, 0, 1, 1,
-0.9304426, -1.259954, -2.79514, 1, 0, 0, 1, 1,
-0.9277325, 1.339873, -0.9461991, 1, 0, 0, 1, 1,
-0.9176502, -0.2188057, -0.8583583, 0, 0, 0, 1, 1,
-0.9173102, -1.429933, -3.365263, 0, 0, 0, 1, 1,
-0.9145229, -0.9271879, -4.787924, 0, 0, 0, 1, 1,
-0.9116327, -0.8243504, -2.103155, 0, 0, 0, 1, 1,
-0.90921, -0.1078363, -2.210145, 0, 0, 0, 1, 1,
-0.9049783, 1.372827, 0.1451565, 0, 0, 0, 1, 1,
-0.8987342, 0.7033576, -1.414308, 0, 0, 0, 1, 1,
-0.895926, -1.503112, -1.402285, 1, 1, 1, 1, 1,
-0.8937352, 0.2521273, -0.7942413, 1, 1, 1, 1, 1,
-0.89098, -0.283425, -1.721891, 1, 1, 1, 1, 1,
-0.8748375, 1.193958, -0.7588692, 1, 1, 1, 1, 1,
-0.8714544, 1.820689, 0.6309413, 1, 1, 1, 1, 1,
-0.8665833, -0.5298334, -0.7216982, 1, 1, 1, 1, 1,
-0.8655334, 2.211581, -1.737799, 1, 1, 1, 1, 1,
-0.8635858, 0.6332314, -1.635615, 1, 1, 1, 1, 1,
-0.8627143, -2.11188, -2.35238, 1, 1, 1, 1, 1,
-0.8614304, 0.1508603, -2.154271, 1, 1, 1, 1, 1,
-0.8553674, 0.4518457, -0.5307407, 1, 1, 1, 1, 1,
-0.8447636, -1.860327, -2.050756, 1, 1, 1, 1, 1,
-0.844026, -0.2334639, -0.5441454, 1, 1, 1, 1, 1,
-0.8424551, -0.7915337, -3.317118, 1, 1, 1, 1, 1,
-0.8422805, -0.2568157, -2.108747, 1, 1, 1, 1, 1,
-0.839323, 1.495128, -0.2939488, 0, 0, 1, 1, 1,
-0.8353492, 2.500254, -0.7222776, 1, 0, 0, 1, 1,
-0.8295317, 0.367959, -0.5969478, 1, 0, 0, 1, 1,
-0.8225309, -0.4688492, -0.3403328, 1, 0, 0, 1, 1,
-0.8173869, -0.6840495, -1.024099, 1, 0, 0, 1, 1,
-0.8149909, -0.02986615, 0.9913251, 1, 0, 0, 1, 1,
-0.8100904, -0.8347864, -0.2147505, 0, 0, 0, 1, 1,
-0.8085839, -0.446412, -2.352742, 0, 0, 0, 1, 1,
-0.8073868, -0.79144, -1.860341, 0, 0, 0, 1, 1,
-0.8072815, 1.178113, 1.974551, 0, 0, 0, 1, 1,
-0.8062093, 0.3278863, -1.182393, 0, 0, 0, 1, 1,
-0.8042471, -0.1809902, -1.91419, 0, 0, 0, 1, 1,
-0.7962224, 0.875743, -1.519796, 0, 0, 0, 1, 1,
-0.7923753, -0.647779, -1.493592, 1, 1, 1, 1, 1,
-0.7871654, -0.08591285, -1.330435, 1, 1, 1, 1, 1,
-0.7857739, 0.9022048, -0.6137128, 1, 1, 1, 1, 1,
-0.7850057, 1.283482, -0.3032599, 1, 1, 1, 1, 1,
-0.7818441, 1.056547, -2.163583, 1, 1, 1, 1, 1,
-0.7794685, -1.271631, -1.085128, 1, 1, 1, 1, 1,
-0.7730409, 1.458952, 0.008395188, 1, 1, 1, 1, 1,
-0.7699625, 0.9172724, -1.292044, 1, 1, 1, 1, 1,
-0.7663611, -0.1854709, -2.197363, 1, 1, 1, 1, 1,
-0.7620215, -0.4965839, -2.184588, 1, 1, 1, 1, 1,
-0.7487099, 0.9683005, -0.3031671, 1, 1, 1, 1, 1,
-0.747466, -0.1106146, -0.771713, 1, 1, 1, 1, 1,
-0.744481, -0.2834374, -2.56141, 1, 1, 1, 1, 1,
-0.7427151, -1.245206, -2.780154, 1, 1, 1, 1, 1,
-0.7421606, -0.5817781, -1.852981, 1, 1, 1, 1, 1,
-0.7420576, 1.284111, 0.728921, 0, 0, 1, 1, 1,
-0.7349297, -1.153492, -2.700972, 1, 0, 0, 1, 1,
-0.7345977, -0.9919651, -3.982832, 1, 0, 0, 1, 1,
-0.7315931, -0.730697, -3.049824, 1, 0, 0, 1, 1,
-0.7292538, -1.19689, -3.049368, 1, 0, 0, 1, 1,
-0.7234402, 3.143068, -0.2527265, 1, 0, 0, 1, 1,
-0.7213167, -1.299734, -3.899548, 0, 0, 0, 1, 1,
-0.716882, -0.5105989, -2.497433, 0, 0, 0, 1, 1,
-0.7157686, -0.5660483, -0.9659904, 0, 0, 0, 1, 1,
-0.7151139, -0.04674615, -1.242003, 0, 0, 0, 1, 1,
-0.7135034, -0.8773935, -2.393574, 0, 0, 0, 1, 1,
-0.7114925, 0.5246086, -2.424144, 0, 0, 0, 1, 1,
-0.7108077, -0.3662508, -2.031572, 0, 0, 0, 1, 1,
-0.706332, 1.784842, -1.714379, 1, 1, 1, 1, 1,
-0.7048229, -1.730711, -2.264066, 1, 1, 1, 1, 1,
-0.7020734, 0.1378632, -2.557599, 1, 1, 1, 1, 1,
-0.6996595, -0.02008956, -3.363908, 1, 1, 1, 1, 1,
-0.6990266, 0.721568, -0.6951891, 1, 1, 1, 1, 1,
-0.6945264, -0.2407764, -0.03060206, 1, 1, 1, 1, 1,
-0.6923752, 0.9853368, -0.5339159, 1, 1, 1, 1, 1,
-0.6917477, -1.937019, -2.794708, 1, 1, 1, 1, 1,
-0.6908177, 1.871201, 0.3713087, 1, 1, 1, 1, 1,
-0.6767648, 0.04569671, -1.950462, 1, 1, 1, 1, 1,
-0.6697475, 1.142391, -1.239798, 1, 1, 1, 1, 1,
-0.6681096, -2.378139, -4.065893, 1, 1, 1, 1, 1,
-0.6635284, 0.3745719, -1.462442, 1, 1, 1, 1, 1,
-0.6629108, 0.3589377, -1.565527, 1, 1, 1, 1, 1,
-0.6626019, 0.9226565, -0.00721232, 1, 1, 1, 1, 1,
-0.6594554, 0.8110723, -0.7289183, 0, 0, 1, 1, 1,
-0.6574692, -1.256347, -3.095902, 1, 0, 0, 1, 1,
-0.6544895, -0.5311091, -1.937107, 1, 0, 0, 1, 1,
-0.6511537, -0.3737487, -3.033283, 1, 0, 0, 1, 1,
-0.6493335, 0.6877348, -1.907888, 1, 0, 0, 1, 1,
-0.6488409, -0.3064466, -1.015024, 1, 0, 0, 1, 1,
-0.647884, -0.5605651, -2.336126, 0, 0, 0, 1, 1,
-0.6456583, 0.7257186, -0.5678772, 0, 0, 0, 1, 1,
-0.6393895, 0.4299603, -0.7477149, 0, 0, 0, 1, 1,
-0.6388865, 0.7376847, 0.1025821, 0, 0, 0, 1, 1,
-0.6349823, 2.376084, -1.869155, 0, 0, 0, 1, 1,
-0.6310155, 0.8262845, 0.3535114, 0, 0, 0, 1, 1,
-0.6277422, 0.7352877, 0.7042733, 0, 0, 0, 1, 1,
-0.6255998, -1.115939, -1.321789, 1, 1, 1, 1, 1,
-0.621857, 0.7714582, -1.355849, 1, 1, 1, 1, 1,
-0.6200896, 0.1742738, -0.4031911, 1, 1, 1, 1, 1,
-0.6174319, 1.345945, 1.229197, 1, 1, 1, 1, 1,
-0.6128479, 0.1553837, -0.8781716, 1, 1, 1, 1, 1,
-0.6116302, -0.8355428, -1.655035, 1, 1, 1, 1, 1,
-0.6093001, -0.2417912, -0.2492186, 1, 1, 1, 1, 1,
-0.6064203, 0.2995897, -2.751408, 1, 1, 1, 1, 1,
-0.604923, 0.07793921, -0.7347398, 1, 1, 1, 1, 1,
-0.6008829, -0.4311705, -1.377443, 1, 1, 1, 1, 1,
-0.5994565, 1.126758, 0.5679291, 1, 1, 1, 1, 1,
-0.5978546, 0.5872417, -1.106713, 1, 1, 1, 1, 1,
-0.5969284, 1.790692, -0.3541523, 1, 1, 1, 1, 1,
-0.5927048, 0.2193254, -0.1959572, 1, 1, 1, 1, 1,
-0.5810865, -0.6825479, -2.310278, 1, 1, 1, 1, 1,
-0.5807778, -1.365165, -1.0442, 0, 0, 1, 1, 1,
-0.5768828, 0.9832038, 0.08883481, 1, 0, 0, 1, 1,
-0.5736745, -1.081592, -2.747385, 1, 0, 0, 1, 1,
-0.5706624, -0.904023, -1.58999, 1, 0, 0, 1, 1,
-0.5657257, -1.400261, -2.680676, 1, 0, 0, 1, 1,
-0.563122, -1.512833, -3.639553, 1, 0, 0, 1, 1,
-0.5621178, -0.749518, -3.856404, 0, 0, 0, 1, 1,
-0.5616311, 0.1237342, -1.115281, 0, 0, 0, 1, 1,
-0.5608469, -0.877131, -3.533813, 0, 0, 0, 1, 1,
-0.5529845, 1.255298, -0.1438736, 0, 0, 0, 1, 1,
-0.5484903, -0.297246, -3.306222, 0, 0, 0, 1, 1,
-0.5442801, -0.5716305, -1.245238, 0, 0, 0, 1, 1,
-0.5364685, 0.5321441, -0.3651472, 0, 0, 0, 1, 1,
-0.5347507, -0.5710918, -3.889854, 1, 1, 1, 1, 1,
-0.533093, -1.723482, -4.724235, 1, 1, 1, 1, 1,
-0.5259967, 0.2896506, 0.5341854, 1, 1, 1, 1, 1,
-0.5121924, -1.127109, -3.386613, 1, 1, 1, 1, 1,
-0.5084665, 0.3796452, 0.6831552, 1, 1, 1, 1, 1,
-0.505487, -0.713598, -2.210451, 1, 1, 1, 1, 1,
-0.5015811, 1.573248, 0.2514774, 1, 1, 1, 1, 1,
-0.5006618, 1.723661, -0.2847303, 1, 1, 1, 1, 1,
-0.4988891, -2.691339, -1.990073, 1, 1, 1, 1, 1,
-0.4988153, 0.4208293, -0.724697, 1, 1, 1, 1, 1,
-0.4984078, -0.7415454, -1.511749, 1, 1, 1, 1, 1,
-0.4928513, 0.1294458, -2.197299, 1, 1, 1, 1, 1,
-0.4921971, -1.315025, -3.935803, 1, 1, 1, 1, 1,
-0.4913911, -2.012273, -2.181667, 1, 1, 1, 1, 1,
-0.4898666, 3.06698, 0.3846343, 1, 1, 1, 1, 1,
-0.4865821, -0.3890831, -3.504088, 0, 0, 1, 1, 1,
-0.4763137, -0.5063235, -1.170591, 1, 0, 0, 1, 1,
-0.4760953, 1.355605, 0.4633621, 1, 0, 0, 1, 1,
-0.4759821, -0.813715, -3.088301, 1, 0, 0, 1, 1,
-0.4637628, -0.6295992, -1.352395, 1, 0, 0, 1, 1,
-0.4630807, -1.437584, -4.286488, 1, 0, 0, 1, 1,
-0.4595205, 0.8460587, -0.3729516, 0, 0, 0, 1, 1,
-0.4588751, 0.08152192, -0.7161982, 0, 0, 0, 1, 1,
-0.4572456, -1.715446, -3.79923, 0, 0, 0, 1, 1,
-0.45217, -0.08826786, -1.042805, 0, 0, 0, 1, 1,
-0.4416917, -1.145317, -1.909092, 0, 0, 0, 1, 1,
-0.4387236, 0.3480243, -2.230682, 0, 0, 0, 1, 1,
-0.4361342, 0.8251542, -0.488004, 0, 0, 0, 1, 1,
-0.4336698, -1.072197, -2.480919, 1, 1, 1, 1, 1,
-0.4297978, -0.8579553, -2.70113, 1, 1, 1, 1, 1,
-0.427167, 0.4343779, -0.572651, 1, 1, 1, 1, 1,
-0.4142091, -0.249222, -3.207368, 1, 1, 1, 1, 1,
-0.4097447, 0.9984211, 2.03, 1, 1, 1, 1, 1,
-0.4020443, 0.3990755, 0.5403968, 1, 1, 1, 1, 1,
-0.4007619, -1.071019, -3.75797, 1, 1, 1, 1, 1,
-0.3971072, -1.109531, -4.459305, 1, 1, 1, 1, 1,
-0.3929132, 0.7222353, -1.404854, 1, 1, 1, 1, 1,
-0.3926797, -0.2221717, -1.547467, 1, 1, 1, 1, 1,
-0.3892609, -0.1015316, -0.3270451, 1, 1, 1, 1, 1,
-0.3851749, -0.5636244, -2.778748, 1, 1, 1, 1, 1,
-0.3804166, 1.621574, 0.5172145, 1, 1, 1, 1, 1,
-0.3785347, 0.3566259, -0.5466859, 1, 1, 1, 1, 1,
-0.3742216, -0.8199964, -3.571865, 1, 1, 1, 1, 1,
-0.3701262, -1.02792, -2.151397, 0, 0, 1, 1, 1,
-0.3685099, -0.2365926, -1.627908, 1, 0, 0, 1, 1,
-0.3644693, 0.6237325, 0.1394727, 1, 0, 0, 1, 1,
-0.3637002, -1.416635, -2.566386, 1, 0, 0, 1, 1,
-0.358518, 0.1764088, -1.300191, 1, 0, 0, 1, 1,
-0.3583096, 1.186546, -1.089161, 1, 0, 0, 1, 1,
-0.3577791, 1.106648, 1.192818, 0, 0, 0, 1, 1,
-0.3534754, -2.04765, -1.133744, 0, 0, 0, 1, 1,
-0.3495964, -1.870552, -3.156385, 0, 0, 0, 1, 1,
-0.3476378, 1.463214, -0.4103877, 0, 0, 0, 1, 1,
-0.3386666, 0.05014653, -1.47256, 0, 0, 0, 1, 1,
-0.336162, -0.02140603, 0.2171224, 0, 0, 0, 1, 1,
-0.3339935, 0.7236609, -0.598668, 0, 0, 0, 1, 1,
-0.3316027, -0.2134104, -1.322379, 1, 1, 1, 1, 1,
-0.3307056, 0.2434728, -0.2500119, 1, 1, 1, 1, 1,
-0.3282061, 1.531947, -1.757055, 1, 1, 1, 1, 1,
-0.3269744, 0.1763409, -1.124782, 1, 1, 1, 1, 1,
-0.3263923, -1.969667, -1.339603, 1, 1, 1, 1, 1,
-0.3180221, 1.309424, -0.7910342, 1, 1, 1, 1, 1,
-0.3178483, -0.6363159, -3.680647, 1, 1, 1, 1, 1,
-0.3127344, -1.005679, -3.337832, 1, 1, 1, 1, 1,
-0.3050897, -1.349308, -2.493419, 1, 1, 1, 1, 1,
-0.305077, -0.09499256, -2.736053, 1, 1, 1, 1, 1,
-0.3028049, 0.4950197, -0.4636536, 1, 1, 1, 1, 1,
-0.3000628, -0.75267, -1.712066, 1, 1, 1, 1, 1,
-0.2995091, -1.751031, -3.798016, 1, 1, 1, 1, 1,
-0.2962443, 0.3809566, 0.231521, 1, 1, 1, 1, 1,
-0.2932861, 0.7868202, 0.4602106, 1, 1, 1, 1, 1,
-0.2927064, -0.2903252, -1.748198, 0, 0, 1, 1, 1,
-0.2850843, 0.4917534, -0.4059063, 1, 0, 0, 1, 1,
-0.2849624, -0.06232171, -3.084948, 1, 0, 0, 1, 1,
-0.2798956, -1.803844, -1.905799, 1, 0, 0, 1, 1,
-0.278491, 0.7904556, 0.3437422, 1, 0, 0, 1, 1,
-0.277085, -0.5479337, -3.360765, 1, 0, 0, 1, 1,
-0.2766747, -0.4815298, -1.553065, 0, 0, 0, 1, 1,
-0.2718531, 1.537513, 0.6052991, 0, 0, 0, 1, 1,
-0.2678935, 1.276523, -0.237787, 0, 0, 0, 1, 1,
-0.2648021, 0.9835882, 0.6291168, 0, 0, 0, 1, 1,
-0.2647893, -0.140698, -1.593797, 0, 0, 0, 1, 1,
-0.2618175, -0.6212704, -2.33553, 0, 0, 0, 1, 1,
-0.2612578, -1.951179, -2.420811, 0, 0, 0, 1, 1,
-0.2589379, -0.09819678, -2.820745, 1, 1, 1, 1, 1,
-0.2557224, 1.744652, -0.7191655, 1, 1, 1, 1, 1,
-0.2525167, 0.1946309, -0.6769767, 1, 1, 1, 1, 1,
-0.2504707, 1.105501, 0.4931609, 1, 1, 1, 1, 1,
-0.2463084, 0.5885555, 1.742382, 1, 1, 1, 1, 1,
-0.2408631, 0.8683113, 0.619611, 1, 1, 1, 1, 1,
-0.2381658, 0.2337899, -1.550316, 1, 1, 1, 1, 1,
-0.2366759, -1.090654, -3.539376, 1, 1, 1, 1, 1,
-0.2302382, 0.05928399, -1.02447, 1, 1, 1, 1, 1,
-0.222103, -0.5873361, -5.28574, 1, 1, 1, 1, 1,
-0.2170413, -0.09743744, -1.256414, 1, 1, 1, 1, 1,
-0.21235, 1.296584, 0.3166938, 1, 1, 1, 1, 1,
-0.2120053, 0.8033155, -0.06480449, 1, 1, 1, 1, 1,
-0.2117097, -0.08554953, -0.35541, 1, 1, 1, 1, 1,
-0.2082212, -1.319272, -1.628111, 1, 1, 1, 1, 1,
-0.2004306, 0.6120888, -2.003694, 0, 0, 1, 1, 1,
-0.2001722, -0.3799407, -1.559335, 1, 0, 0, 1, 1,
-0.1997263, 0.07969845, -2.123122, 1, 0, 0, 1, 1,
-0.1995192, 0.9276919, -1.220726, 1, 0, 0, 1, 1,
-0.1982287, -0.6989292, -2.406615, 1, 0, 0, 1, 1,
-0.1981375, 1.18135, -0.5597016, 1, 0, 0, 1, 1,
-0.1978605, -1.569424, -2.017859, 0, 0, 0, 1, 1,
-0.1931694, 0.0254269, -0.8160162, 0, 0, 0, 1, 1,
-0.1867672, -0.3999817, -3.555908, 0, 0, 0, 1, 1,
-0.1660071, 0.7469029, -2.257599, 0, 0, 0, 1, 1,
-0.1651732, -1.554426, -1.99334, 0, 0, 0, 1, 1,
-0.1625881, -0.2169276, -3.721525, 0, 0, 0, 1, 1,
-0.1609386, 0.9349408, 0.9032808, 0, 0, 0, 1, 1,
-0.1599094, 0.8724932, -0.06949091, 1, 1, 1, 1, 1,
-0.1598946, 0.3230527, 0.2795094, 1, 1, 1, 1, 1,
-0.1588656, -1.211057, -3.366425, 1, 1, 1, 1, 1,
-0.1521456, 0.0935116, -1.665583, 1, 1, 1, 1, 1,
-0.1510123, -1.210811, -4.503641, 1, 1, 1, 1, 1,
-0.1468938, -0.05333053, -2.099224, 1, 1, 1, 1, 1,
-0.1452466, -0.9828379, -2.634988, 1, 1, 1, 1, 1,
-0.1444327, -0.5226787, -3.33067, 1, 1, 1, 1, 1,
-0.1401747, 0.3582427, 0.4142202, 1, 1, 1, 1, 1,
-0.137826, -0.9130602, -1.039663, 1, 1, 1, 1, 1,
-0.1364318, 0.1677946, 0.907586, 1, 1, 1, 1, 1,
-0.1362634, 0.5768519, -1.085193, 1, 1, 1, 1, 1,
-0.1337824, -0.2290306, -2.26214, 1, 1, 1, 1, 1,
-0.1336857, 2.08799, -1.794682, 1, 1, 1, 1, 1,
-0.1288194, 0.2180683, -1.677294, 1, 1, 1, 1, 1,
-0.1284219, -0.6606861, -2.565082, 0, 0, 1, 1, 1,
-0.1284095, -0.7098275, -2.269004, 1, 0, 0, 1, 1,
-0.1267349, 1.639666, -1.159905, 1, 0, 0, 1, 1,
-0.1247983, -1.428059, -2.023701, 1, 0, 0, 1, 1,
-0.1173114, -0.9995955, -2.808698, 1, 0, 0, 1, 1,
-0.1150721, -0.822531, -2.967462, 1, 0, 0, 1, 1,
-0.107222, -0.01699762, -1.550156, 0, 0, 0, 1, 1,
-0.1064013, 1.306378, 0.02605393, 0, 0, 0, 1, 1,
-0.1034234, -2.190459, -1.754009, 0, 0, 0, 1, 1,
-0.0953036, -1.598804, -2.730117, 0, 0, 0, 1, 1,
-0.09385636, 0.9897383, -0.171648, 0, 0, 0, 1, 1,
-0.09317461, -0.8122729, -3.210147, 0, 0, 0, 1, 1,
-0.09278616, -1.407717, -3.495223, 0, 0, 0, 1, 1,
-0.09261212, -0.7428057, -4.086826, 1, 1, 1, 1, 1,
-0.09203313, -1.037148, -2.884266, 1, 1, 1, 1, 1,
-0.0900039, -0.5434724, -1.881452, 1, 1, 1, 1, 1,
-0.08446472, -1.250685, -3.002674, 1, 1, 1, 1, 1,
-0.08068557, -0.5689057, -1.665543, 1, 1, 1, 1, 1,
-0.07859433, 0.1456044, -0.7412184, 1, 1, 1, 1, 1,
-0.07724848, -0.4598747, -2.204653, 1, 1, 1, 1, 1,
-0.07437954, 0.7597252, -0.978549, 1, 1, 1, 1, 1,
-0.07035403, -0.8178734, -3.416684, 1, 1, 1, 1, 1,
-0.06983157, -1.632786, -3.100981, 1, 1, 1, 1, 1,
-0.06781323, 0.6479066, -1.453516, 1, 1, 1, 1, 1,
-0.06706268, -0.3899769, -3.159128, 1, 1, 1, 1, 1,
-0.05244656, 3.251346, -0.3325177, 1, 1, 1, 1, 1,
-0.05126413, 0.2994632, 0.4586406, 1, 1, 1, 1, 1,
-0.04938034, 0.780925, -3.457983, 1, 1, 1, 1, 1,
-0.04884925, 2.333094, 0.5366194, 0, 0, 1, 1, 1,
-0.04630749, 0.43842, -0.9502808, 1, 0, 0, 1, 1,
-0.04615651, -0.1713425, -2.988936, 1, 0, 0, 1, 1,
-0.04440641, -0.660642, -4.104895, 1, 0, 0, 1, 1,
-0.04314795, -0.2272135, -2.288256, 1, 0, 0, 1, 1,
-0.04306533, 1.153904, -1.221565, 1, 0, 0, 1, 1,
-0.0414948, -1.15389, -3.576939, 0, 0, 0, 1, 1,
-0.04111621, -0.1376702, -2.147899, 0, 0, 0, 1, 1,
-0.04089706, -0.1373859, -2.478332, 0, 0, 0, 1, 1,
-0.03685437, 1.288764, 0.02752279, 0, 0, 0, 1, 1,
-0.03643166, -0.7679477, -3.684889, 0, 0, 0, 1, 1,
-0.02894471, -0.5972144, -2.768964, 0, 0, 0, 1, 1,
-0.02458942, 0.9123216, 0.02246049, 0, 0, 0, 1, 1,
-0.02446251, 0.1247909, -0.6162582, 1, 1, 1, 1, 1,
-0.02006448, -0.0175704, -1.928424, 1, 1, 1, 1, 1,
-0.01406284, -0.2698762, -3.636701, 1, 1, 1, 1, 1,
-0.0119648, 0.4294993, 0.3032481, 1, 1, 1, 1, 1,
-0.01183312, -0.2028501, -5.085498, 1, 1, 1, 1, 1,
-0.01078865, 0.6916357, 2.049107, 1, 1, 1, 1, 1,
-0.01040734, 1.197084, 0.1356221, 1, 1, 1, 1, 1,
-0.008652891, 0.120962, -0.1373224, 1, 1, 1, 1, 1,
-0.006923938, 0.07677758, -0.005303777, 1, 1, 1, 1, 1,
-0.00634934, -0.4395576, -4.775979, 1, 1, 1, 1, 1,
-0.0005760663, 0.09951185, 0.1141296, 1, 1, 1, 1, 1,
-0.0003127761, -0.04702719, -3.674538, 1, 1, 1, 1, 1,
-0.0003061171, -0.5913755, -1.557333, 1, 1, 1, 1, 1,
0.000766821, 0.2322698, 1.549549, 1, 1, 1, 1, 1,
0.002437188, -2.094643, 2.965505, 1, 1, 1, 1, 1,
0.003158684, -0.2720185, 3.597396, 0, 0, 1, 1, 1,
0.003491625, -1.644253, 1.566936, 1, 0, 0, 1, 1,
0.006190346, 0.5231191, 2.535556, 1, 0, 0, 1, 1,
0.006528949, 1.21321, 0.1491844, 1, 0, 0, 1, 1,
0.01338658, 0.4457611, -0.3061238, 1, 0, 0, 1, 1,
0.01406709, -0.3958321, 2.489043, 1, 0, 0, 1, 1,
0.01420898, 1.323094, 1.632587, 0, 0, 0, 1, 1,
0.02067606, -0.7055008, 2.976134, 0, 0, 0, 1, 1,
0.02259091, -1.570805, 2.009796, 0, 0, 0, 1, 1,
0.02312255, -0.6364586, 3.649097, 0, 0, 0, 1, 1,
0.02528591, 0.530055, 0.2817562, 0, 0, 0, 1, 1,
0.02761343, 0.5757719, 2.444583, 0, 0, 0, 1, 1,
0.03924141, -0.7029557, 3.896373, 0, 0, 0, 1, 1,
0.04115793, 0.4954356, 0.1151487, 1, 1, 1, 1, 1,
0.042687, -1.269807, 2.094305, 1, 1, 1, 1, 1,
0.04277069, 2.691858, 0.1488657, 1, 1, 1, 1, 1,
0.04524902, 0.1304284, 0.2649189, 1, 1, 1, 1, 1,
0.04937675, 0.4191288, -0.4640498, 1, 1, 1, 1, 1,
0.04984028, 0.1478383, -0.7809975, 1, 1, 1, 1, 1,
0.05058308, -2.290344, 3.8476, 1, 1, 1, 1, 1,
0.05639389, -1.36612, 3.361823, 1, 1, 1, 1, 1,
0.05697206, 0.777935, -1.415283, 1, 1, 1, 1, 1,
0.06090711, -0.9579623, 4.181592, 1, 1, 1, 1, 1,
0.06655457, 1.691934, -0.626403, 1, 1, 1, 1, 1,
0.06811964, -0.5017425, 3.088649, 1, 1, 1, 1, 1,
0.07363678, 1.848617, 0.1287755, 1, 1, 1, 1, 1,
0.07526269, -0.1070913, 2.830427, 1, 1, 1, 1, 1,
0.07611899, -0.7643162, 2.270872, 1, 1, 1, 1, 1,
0.07809274, -1.47729, 2.804607, 0, 0, 1, 1, 1,
0.07815176, 0.3875385, 1.008491, 1, 0, 0, 1, 1,
0.07860187, -1.657229, 3.719276, 1, 0, 0, 1, 1,
0.07889014, 0.2250823, 0.9605247, 1, 0, 0, 1, 1,
0.07954378, -1.675184, 4.207066, 1, 0, 0, 1, 1,
0.07997496, -0.258531, 1.986668, 1, 0, 0, 1, 1,
0.08675206, 0.04854311, 1.947241, 0, 0, 0, 1, 1,
0.08912231, 0.3525676, -0.2618118, 0, 0, 0, 1, 1,
0.09005619, -0.5500569, 3.614567, 0, 0, 0, 1, 1,
0.09252916, 0.479407, 1.147144, 0, 0, 0, 1, 1,
0.09322314, 0.3439818, 1.216406, 0, 0, 0, 1, 1,
0.09429646, -1.120563, 3.108818, 0, 0, 0, 1, 1,
0.09505928, 1.216218, -1.039887, 0, 0, 0, 1, 1,
0.09622771, 1.798522, -0.8717127, 1, 1, 1, 1, 1,
0.09738336, 0.6803457, -1.347784, 1, 1, 1, 1, 1,
0.1010394, -0.6885929, 2.867168, 1, 1, 1, 1, 1,
0.1028418, 0.7010254, 0.03105989, 1, 1, 1, 1, 1,
0.1057744, 0.2566165, 0.8368917, 1, 1, 1, 1, 1,
0.1097699, -1.403529, 1.566175, 1, 1, 1, 1, 1,
0.1111313, -0.05159337, 1.659579, 1, 1, 1, 1, 1,
0.112803, -1.303348, 2.746799, 1, 1, 1, 1, 1,
0.1151044, -0.3548434, 3.203299, 1, 1, 1, 1, 1,
0.1172897, -0.4516233, 0.6451831, 1, 1, 1, 1, 1,
0.1176386, -0.5039732, 3.248646, 1, 1, 1, 1, 1,
0.1224832, 2.693588, -0.8543828, 1, 1, 1, 1, 1,
0.1243927, 1.364295, -0.5071955, 1, 1, 1, 1, 1,
0.1264482, 0.2961654, -1.119572, 1, 1, 1, 1, 1,
0.1305103, -0.3360513, 3.126309, 1, 1, 1, 1, 1,
0.1333334, 1.035529, 0.05956075, 0, 0, 1, 1, 1,
0.1342873, 0.8840969, -0.1171835, 1, 0, 0, 1, 1,
0.1348018, -0.05158669, 1.550356, 1, 0, 0, 1, 1,
0.1363301, 0.008544261, 2.910944, 1, 0, 0, 1, 1,
0.136389, 0.3143024, 0.2047692, 1, 0, 0, 1, 1,
0.1364157, 0.7611189, 0.399545, 1, 0, 0, 1, 1,
0.1398831, -0.5001017, 1.444202, 0, 0, 0, 1, 1,
0.1401269, 1.359765, -1.160075, 0, 0, 0, 1, 1,
0.1406091, 2.32234, -1.286455, 0, 0, 0, 1, 1,
0.1431548, 0.1684246, -0.5847881, 0, 0, 0, 1, 1,
0.1446142, 0.07198252, 2.610486, 0, 0, 0, 1, 1,
0.145498, -0.2547001, 1.299074, 0, 0, 0, 1, 1,
0.1465068, -1.874234, 1.552565, 0, 0, 0, 1, 1,
0.1475854, -0.7408436, 3.059966, 1, 1, 1, 1, 1,
0.1476296, -0.2943804, 3.28539, 1, 1, 1, 1, 1,
0.1518645, -0.7371762, 2.899853, 1, 1, 1, 1, 1,
0.1526128, -0.8156672, 1.843648, 1, 1, 1, 1, 1,
0.1587009, 1.147836, -0.07656278, 1, 1, 1, 1, 1,
0.1595382, -0.1878095, 1.702286, 1, 1, 1, 1, 1,
0.1600556, 1.292014, -0.5836663, 1, 1, 1, 1, 1,
0.1618756, -0.737017, 2.161763, 1, 1, 1, 1, 1,
0.1621788, -0.6320806, 2.79318, 1, 1, 1, 1, 1,
0.1695113, 1.106329, 0.5927576, 1, 1, 1, 1, 1,
0.1731423, 1.584615, -0.5104042, 1, 1, 1, 1, 1,
0.1768617, -1.747392, 3.716354, 1, 1, 1, 1, 1,
0.1769335, 0.06532694, 2.954136, 1, 1, 1, 1, 1,
0.1814191, 0.7013335, 0.6210603, 1, 1, 1, 1, 1,
0.1836264, 0.3577094, 1.956508, 1, 1, 1, 1, 1,
0.1846307, 0.6837034, -1.039097, 0, 0, 1, 1, 1,
0.1847061, 1.87457, 1.613346, 1, 0, 0, 1, 1,
0.1870529, -1.575068, 3.201275, 1, 0, 0, 1, 1,
0.1895757, -0.06293639, 3.596733, 1, 0, 0, 1, 1,
0.1941923, 0.2751159, -0.6900627, 1, 0, 0, 1, 1,
0.1959806, -0.4441618, 3.580312, 1, 0, 0, 1, 1,
0.196924, -0.3852396, 3.533701, 0, 0, 0, 1, 1,
0.197104, 0.9429214, 0.9403536, 0, 0, 0, 1, 1,
0.197452, 0.7050227, 1.14515, 0, 0, 0, 1, 1,
0.1980846, 0.123372, -1.423965, 0, 0, 0, 1, 1,
0.2044299, -1.760272, 2.943216, 0, 0, 0, 1, 1,
0.2057801, 0.4281078, -0.4917907, 0, 0, 0, 1, 1,
0.2065681, 0.1340732, -0.2783543, 0, 0, 0, 1, 1,
0.207841, 0.8457236, 0.1867883, 1, 1, 1, 1, 1,
0.2165274, 0.9563587, -0.7967091, 1, 1, 1, 1, 1,
0.2215413, -1.483929, 2.050866, 1, 1, 1, 1, 1,
0.2219086, -0.702027, 5.003302, 1, 1, 1, 1, 1,
0.2237588, -0.2235199, 3.064698, 1, 1, 1, 1, 1,
0.2242307, -1.996719, 4.339787, 1, 1, 1, 1, 1,
0.2266286, 0.2317542, 0.2278417, 1, 1, 1, 1, 1,
0.2317946, 0.6260419, -0.3941974, 1, 1, 1, 1, 1,
0.2362348, 1.73576, 0.1572618, 1, 1, 1, 1, 1,
0.2365697, -0.8654914, 2.649788, 1, 1, 1, 1, 1,
0.2376379, 1.509937, -0.1271014, 1, 1, 1, 1, 1,
0.2396187, -0.1157267, 1.338718, 1, 1, 1, 1, 1,
0.2400469, -0.1510337, 2.736695, 1, 1, 1, 1, 1,
0.2409686, -0.1719309, 3.523412, 1, 1, 1, 1, 1,
0.2414589, -1.1244, 1.557338, 1, 1, 1, 1, 1,
0.2425224, 1.442622, 0.2526219, 0, 0, 1, 1, 1,
0.2441215, 0.4295432, 0.3300766, 1, 0, 0, 1, 1,
0.2444917, 1.282591, 0.3124324, 1, 0, 0, 1, 1,
0.2451728, -0.1042611, 3.725623, 1, 0, 0, 1, 1,
0.2488261, 0.7104561, -1.513295, 1, 0, 0, 1, 1,
0.2494521, 0.5142577, 0.2570094, 1, 0, 0, 1, 1,
0.2504323, -0.5886754, 3.376641, 0, 0, 0, 1, 1,
0.2551077, 0.1899574, 1.255215, 0, 0, 0, 1, 1,
0.2580471, -1.388682, 1.520946, 0, 0, 0, 1, 1,
0.2623211, 1.167169, 1.064423, 0, 0, 0, 1, 1,
0.2630475, 1.154188, 0.7336692, 0, 0, 0, 1, 1,
0.2637473, 0.1631074, 1.001345, 0, 0, 0, 1, 1,
0.2661794, -1.241882, 2.724531, 0, 0, 0, 1, 1,
0.2687206, -1.729578, 3.685471, 1, 1, 1, 1, 1,
0.2723797, -0.126617, 1.375527, 1, 1, 1, 1, 1,
0.2725105, 0.6207713, 1.083877, 1, 1, 1, 1, 1,
0.27506, -1.03898, 4.266479, 1, 1, 1, 1, 1,
0.2836762, 0.1860184, 1.989993, 1, 1, 1, 1, 1,
0.2839193, 0.7939711, -0.7034759, 1, 1, 1, 1, 1,
0.2848843, -1.262551, 3.23401, 1, 1, 1, 1, 1,
0.2876972, -2.080026, 1.700841, 1, 1, 1, 1, 1,
0.290347, -0.07447761, 1.251897, 1, 1, 1, 1, 1,
0.2975602, -0.9688862, 3.625247, 1, 1, 1, 1, 1,
0.3029681, 0.2858911, 0.3007562, 1, 1, 1, 1, 1,
0.3032627, -0.9341136, 1.448059, 1, 1, 1, 1, 1,
0.3045013, 0.3014107, 0.9068357, 1, 1, 1, 1, 1,
0.3096175, -0.1938021, 0.1860247, 1, 1, 1, 1, 1,
0.3116847, -0.02819095, 1.703176, 1, 1, 1, 1, 1,
0.3117167, -1.05991, 0.9284755, 0, 0, 1, 1, 1,
0.3150094, -0.3705482, 1.632176, 1, 0, 0, 1, 1,
0.317705, -0.5257792, 4.582369, 1, 0, 0, 1, 1,
0.3225264, -1.144013, 2.474312, 1, 0, 0, 1, 1,
0.3242922, -1.312972, 5.047001, 1, 0, 0, 1, 1,
0.3256036, 1.221339, -1.317584, 1, 0, 0, 1, 1,
0.3359309, 0.08794689, 1.221186, 0, 0, 0, 1, 1,
0.3366296, -1.052139, 1.533747, 0, 0, 0, 1, 1,
0.349762, 0.9352033, 0.8381048, 0, 0, 0, 1, 1,
0.3518901, -0.3919735, 3.83932, 0, 0, 0, 1, 1,
0.3532945, 1.044908, 0.9490056, 0, 0, 0, 1, 1,
0.3568754, -1.394464, 5.000811, 0, 0, 0, 1, 1,
0.3588424, 0.1395868, -0.1817603, 0, 0, 0, 1, 1,
0.3610656, 1.020358, -0.5274315, 1, 1, 1, 1, 1,
0.3646549, 0.6305811, 1.916524, 1, 1, 1, 1, 1,
0.3671375, 1.079838, 1.924481, 1, 1, 1, 1, 1,
0.3706213, -1.660123, 5.097391, 1, 1, 1, 1, 1,
0.372312, -0.6034606, 3.304461, 1, 1, 1, 1, 1,
0.3729225, 0.2550843, 1.898446, 1, 1, 1, 1, 1,
0.3732511, -0.0002135973, 2.436706, 1, 1, 1, 1, 1,
0.3741724, -2.032588, 4.252008, 1, 1, 1, 1, 1,
0.3759031, 1.201777, 0.1689616, 1, 1, 1, 1, 1,
0.3781192, -0.6131569, 3.070848, 1, 1, 1, 1, 1,
0.3838118, 0.7357932, 1.665095, 1, 1, 1, 1, 1,
0.3851984, 0.2482875, -0.7834749, 1, 1, 1, 1, 1,
0.3863153, 0.03498105, 2.033098, 1, 1, 1, 1, 1,
0.388369, -0.3148163, 1.959278, 1, 1, 1, 1, 1,
0.3898095, -0.5806096, 2.153429, 1, 1, 1, 1, 1,
0.3911421, -0.2841355, 3.108529, 0, 0, 1, 1, 1,
0.393339, -0.1291585, 2.23994, 1, 0, 0, 1, 1,
0.3976781, 0.0188792, 2.638201, 1, 0, 0, 1, 1,
0.3986999, -0.4642101, 1.191267, 1, 0, 0, 1, 1,
0.4015968, -2.273846, 4.149616, 1, 0, 0, 1, 1,
0.402571, -0.09997554, 0.9712967, 1, 0, 0, 1, 1,
0.4084302, 0.2658092, -0.3584905, 0, 0, 0, 1, 1,
0.4110925, -0.02295269, 1.69765, 0, 0, 0, 1, 1,
0.413866, -0.976426, 2.959885, 0, 0, 0, 1, 1,
0.4190407, -1.524449, 4.072905, 0, 0, 0, 1, 1,
0.4229339, -0.05381537, 2.213756, 0, 0, 0, 1, 1,
0.427412, -0.6045777, 2.454542, 0, 0, 0, 1, 1,
0.4318034, 0.1581365, -0.006968594, 0, 0, 0, 1, 1,
0.4322413, 0.7466158, 0.01002571, 1, 1, 1, 1, 1,
0.4359363, -0.8418893, 2.935501, 1, 1, 1, 1, 1,
0.4377441, -1.349179, 2.228317, 1, 1, 1, 1, 1,
0.4429744, 0.6048288, 0.01731366, 1, 1, 1, 1, 1,
0.4430819, 0.8159785, 0.3689281, 1, 1, 1, 1, 1,
0.4461147, 1.24499, -0.9495854, 1, 1, 1, 1, 1,
0.4522763, 1.54958, 1.807514, 1, 1, 1, 1, 1,
0.4547069, -0.5202869, 3.975678, 1, 1, 1, 1, 1,
0.4628076, 0.9574797, 0.629126, 1, 1, 1, 1, 1,
0.464524, -0.09622207, 3.461015, 1, 1, 1, 1, 1,
0.4693542, -0.2547464, 2.391358, 1, 1, 1, 1, 1,
0.4709976, 1.340662, 0.376164, 1, 1, 1, 1, 1,
0.4720916, 0.2552524, 0.4346885, 1, 1, 1, 1, 1,
0.4723336, 0.2411212, 1.028794, 1, 1, 1, 1, 1,
0.4736298, -0.8932362, 2.932435, 1, 1, 1, 1, 1,
0.4792148, -0.2230619, 3.568091, 0, 0, 1, 1, 1,
0.4795015, 1.698039, 1.247323, 1, 0, 0, 1, 1,
0.4809183, -0.5246174, 3.75924, 1, 0, 0, 1, 1,
0.4811282, 0.6798366, 0.2892781, 1, 0, 0, 1, 1,
0.4837409, -0.9504407, 2.998859, 1, 0, 0, 1, 1,
0.4852609, 2.109595, -0.01963115, 1, 0, 0, 1, 1,
0.486342, -0.910168, 2.292296, 0, 0, 0, 1, 1,
0.4865871, 2.001725, 0.7078247, 0, 0, 0, 1, 1,
0.4867864, 1.1015, 0.01167143, 0, 0, 0, 1, 1,
0.4895881, -1.512442, 4.042581, 0, 0, 0, 1, 1,
0.4935961, 0.6318364, -0.2455975, 0, 0, 0, 1, 1,
0.496911, -0.6167579, 2.615568, 0, 0, 0, 1, 1,
0.5007622, -0.360154, 2.10936, 0, 0, 0, 1, 1,
0.5031271, 0.0211638, 0.5869228, 1, 1, 1, 1, 1,
0.5091204, 0.6660822, 0.7100037, 1, 1, 1, 1, 1,
0.518831, 0.2368934, 1.88279, 1, 1, 1, 1, 1,
0.5188516, -0.3276537, 3.046007, 1, 1, 1, 1, 1,
0.5192111, -1.250352, 1.447631, 1, 1, 1, 1, 1,
0.5193772, 1.209395, 1.898145, 1, 1, 1, 1, 1,
0.5199997, -0.5418186, 0.754938, 1, 1, 1, 1, 1,
0.5217997, -0.2354645, 0.9875816, 1, 1, 1, 1, 1,
0.5261112, -0.9907719, 1.679957, 1, 1, 1, 1, 1,
0.5271425, -0.1790566, 2.318314, 1, 1, 1, 1, 1,
0.5296525, -0.2029035, 0.2446125, 1, 1, 1, 1, 1,
0.5301337, -0.2247056, 1.327778, 1, 1, 1, 1, 1,
0.5322241, 0.69328, 1.134637, 1, 1, 1, 1, 1,
0.5323144, 1.120019, -2.12609, 1, 1, 1, 1, 1,
0.5346237, -0.6478433, 3.533082, 1, 1, 1, 1, 1,
0.5351366, 0.08350536, 0.7660544, 0, 0, 1, 1, 1,
0.5359954, 0.6526964, 0.4493814, 1, 0, 0, 1, 1,
0.5404316, 0.0567684, 1.785898, 1, 0, 0, 1, 1,
0.5457353, 1.583854, 0.5848843, 1, 0, 0, 1, 1,
0.5474494, 1.520029, 0.1779435, 1, 0, 0, 1, 1,
0.5478253, -0.3911572, 1.630608, 1, 0, 0, 1, 1,
0.5482046, 0.3738024, 0.8123818, 0, 0, 0, 1, 1,
0.5536243, -0.2566625, 3.687526, 0, 0, 0, 1, 1,
0.5538961, -1.323029, 2.429516, 0, 0, 0, 1, 1,
0.5580196, 1.447112, 0.7900549, 0, 0, 0, 1, 1,
0.5583342, -0.04185466, 2.860549, 0, 0, 0, 1, 1,
0.562557, 1.374857, 0.4022419, 0, 0, 0, 1, 1,
0.56392, -0.708741, 3.419316, 0, 0, 0, 1, 1,
0.5648664, -0.1361523, 2.131941, 1, 1, 1, 1, 1,
0.569571, -1.623721, 3.338232, 1, 1, 1, 1, 1,
0.5723196, 1.011289, 0.6499382, 1, 1, 1, 1, 1,
0.5757677, 0.7442629, -0.3148284, 1, 1, 1, 1, 1,
0.5766669, 0.05367401, 2.136338, 1, 1, 1, 1, 1,
0.5776281, 1.837149, -1.607155, 1, 1, 1, 1, 1,
0.579962, -0.1291392, 2.32855, 1, 1, 1, 1, 1,
0.5806804, -0.4304852, 1.380009, 1, 1, 1, 1, 1,
0.5860723, -0.5984992, 2.253987, 1, 1, 1, 1, 1,
0.588963, 1.581313, 2.459663, 1, 1, 1, 1, 1,
0.5920894, -2.233086, 3.701962, 1, 1, 1, 1, 1,
0.5945658, -1.420655, 2.750889, 1, 1, 1, 1, 1,
0.5963836, -1.356337, 2.201948, 1, 1, 1, 1, 1,
0.6028651, -2.191442, 1.748739, 1, 1, 1, 1, 1,
0.6051227, -0.5787748, 4.019711, 1, 1, 1, 1, 1,
0.6078486, 1.922335, 0.2680867, 0, 0, 1, 1, 1,
0.6080269, -0.5300359, 2.508331, 1, 0, 0, 1, 1,
0.6119202, 1.203189, 0.8676295, 1, 0, 0, 1, 1,
0.6166061, 0.04250059, -0.2324387, 1, 0, 0, 1, 1,
0.6240899, -0.4595834, 3.844612, 1, 0, 0, 1, 1,
0.6243628, 1.188769, -1.0688, 1, 0, 0, 1, 1,
0.6243742, -0.04911249, 0.5147457, 0, 0, 0, 1, 1,
0.6271998, -0.9022179, 3.164025, 0, 0, 0, 1, 1,
0.6301155, -0.2159974, 2.132988, 0, 0, 0, 1, 1,
0.6306578, 0.0005951186, 2.616448, 0, 0, 0, 1, 1,
0.6319705, -1.212211, 1.998763, 0, 0, 0, 1, 1,
0.6328993, -1.893391, 2.289901, 0, 0, 0, 1, 1,
0.6378543, -0.08713198, 1.686956, 0, 0, 0, 1, 1,
0.6408072, 1.834577, 0.4651372, 1, 1, 1, 1, 1,
0.6459948, 0.4350641, 0.6847693, 1, 1, 1, 1, 1,
0.6468332, 0.11901, 0.944986, 1, 1, 1, 1, 1,
0.6475608, 0.7410318, -0.9842803, 1, 1, 1, 1, 1,
0.6505825, -0.7132886, 3.146676, 1, 1, 1, 1, 1,
0.6520473, 1.587451, 0.3551998, 1, 1, 1, 1, 1,
0.6594965, -0.5993606, 3.418567, 1, 1, 1, 1, 1,
0.6612638, -0.8048866, 1.531896, 1, 1, 1, 1, 1,
0.6630344, -0.1734308, 1.168994, 1, 1, 1, 1, 1,
0.6650895, -1.762119, 3.329366, 1, 1, 1, 1, 1,
0.6689488, 1.405438, -0.6990173, 1, 1, 1, 1, 1,
0.6704497, -1.385638, 1.254363, 1, 1, 1, 1, 1,
0.6718603, -0.3657673, 3.159375, 1, 1, 1, 1, 1,
0.6723225, 1.396001, -0.2205636, 1, 1, 1, 1, 1,
0.674585, -0.1841657, -0.5600532, 1, 1, 1, 1, 1,
0.6798224, 1.684794, -0.6038365, 0, 0, 1, 1, 1,
0.6799846, -1.239691, 1.535814, 1, 0, 0, 1, 1,
0.685061, 0.3733952, 1.717229, 1, 0, 0, 1, 1,
0.6871798, 2.433701, 0.8047726, 1, 0, 0, 1, 1,
0.6886385, -1.29898, 1.921777, 1, 0, 0, 1, 1,
0.6925259, -0.1262955, 1.248915, 1, 0, 0, 1, 1,
0.6943622, 0.6863878, 0.8789104, 0, 0, 0, 1, 1,
0.694501, -0.462632, 1.112068, 0, 0, 0, 1, 1,
0.6954313, 0.5176198, 2.694558, 0, 0, 0, 1, 1,
0.6977731, -1.661324, 3.255788, 0, 0, 0, 1, 1,
0.6996124, -0.3659015, 2.431021, 0, 0, 0, 1, 1,
0.699782, -2.397481, 1.405329, 0, 0, 0, 1, 1,
0.7025589, -0.9834238, 2.280811, 0, 0, 0, 1, 1,
0.7043124, -1.200075, 1.891441, 1, 1, 1, 1, 1,
0.7069829, -0.1947454, 1.660882, 1, 1, 1, 1, 1,
0.7077304, -0.7331507, 1.253192, 1, 1, 1, 1, 1,
0.7082974, -0.515685, 3.052369, 1, 1, 1, 1, 1,
0.7101855, 0.9636582, -1.148909, 1, 1, 1, 1, 1,
0.7229146, -0.2673939, 1.829589, 1, 1, 1, 1, 1,
0.724229, -1.106828, 2.409035, 1, 1, 1, 1, 1,
0.7248839, 0.6391827, 0.5834216, 1, 1, 1, 1, 1,
0.7250205, 0.4511231, -0.2552609, 1, 1, 1, 1, 1,
0.7368973, -0.307303, 1.969134, 1, 1, 1, 1, 1,
0.7408915, -2.32946, 2.356606, 1, 1, 1, 1, 1,
0.745009, 0.5897208, 2.165717, 1, 1, 1, 1, 1,
0.7462562, 0.2309753, 0.6719637, 1, 1, 1, 1, 1,
0.7463421, 1.262952, -0.5465215, 1, 1, 1, 1, 1,
0.7474613, -0.3879871, 2.405756, 1, 1, 1, 1, 1,
0.7634997, 0.3773292, 2.285506, 0, 0, 1, 1, 1,
0.7650803, -0.7390826, 2.063665, 1, 0, 0, 1, 1,
0.7652383, -0.9250048, 1.846394, 1, 0, 0, 1, 1,
0.7672868, -0.502071, 1.706755, 1, 0, 0, 1, 1,
0.7795468, -0.6540946, 1.992917, 1, 0, 0, 1, 1,
0.7834905, -0.7097535, 2.833853, 1, 0, 0, 1, 1,
0.7845782, 0.6519354, 1.487182, 0, 0, 0, 1, 1,
0.7888749, 0.8456014, 0.5280087, 0, 0, 0, 1, 1,
0.7923759, 0.9306955, 1.216304, 0, 0, 0, 1, 1,
0.7949766, 0.5113331, 2.90479, 0, 0, 0, 1, 1,
0.8082266, 1.839814, -1.180022, 0, 0, 0, 1, 1,
0.8087961, -0.09081247, 2.232692, 0, 0, 0, 1, 1,
0.8130482, 1.58167, -1.09779, 0, 0, 0, 1, 1,
0.8152471, 0.1623705, 1.869932, 1, 1, 1, 1, 1,
0.8167, 0.2893772, 1.103268, 1, 1, 1, 1, 1,
0.8181806, -1.006773, 2.651682, 1, 1, 1, 1, 1,
0.8184052, 0.3739175, 1.674335, 1, 1, 1, 1, 1,
0.8284366, 0.9565699, -1.308741, 1, 1, 1, 1, 1,
0.8327508, 2.381572, 2.336472, 1, 1, 1, 1, 1,
0.8430406, 0.7677955, 1.677346, 1, 1, 1, 1, 1,
0.8446649, -0.3670579, 1.084903, 1, 1, 1, 1, 1,
0.8509219, 0.3858647, 2.985526, 1, 1, 1, 1, 1,
0.8515264, -1.611749, 2.890475, 1, 1, 1, 1, 1,
0.8574286, 2.566029, -0.2584098, 1, 1, 1, 1, 1,
0.8684962, 0.02682229, 1.106818, 1, 1, 1, 1, 1,
0.8782055, 1.036513, -0.2866831, 1, 1, 1, 1, 1,
0.8786708, 0.2129667, -0.4154091, 1, 1, 1, 1, 1,
0.8964548, 1.202599, 2.7354, 1, 1, 1, 1, 1,
0.9135095, 1.081208, 2.29121, 0, 0, 1, 1, 1,
0.9164509, -0.3137558, 3.053704, 1, 0, 0, 1, 1,
0.9211791, -0.09586724, 1.121944, 1, 0, 0, 1, 1,
0.923553, -0.8451749, 1.430303, 1, 0, 0, 1, 1,
0.9246505, -0.4235204, 2.147181, 1, 0, 0, 1, 1,
0.9348217, 1.202247, -0.04061662, 1, 0, 0, 1, 1,
0.9353629, 1.210479, 0.2111985, 0, 0, 0, 1, 1,
0.9376386, 0.2487649, 0.03758337, 0, 0, 0, 1, 1,
0.9387299, 0.01297457, 1.249954, 0, 0, 0, 1, 1,
0.9442302, -1.114017, 0.9806412, 0, 0, 0, 1, 1,
0.9498967, -2.161735, 2.423643, 0, 0, 0, 1, 1,
0.9523937, -0.2202179, 4.787965, 0, 0, 0, 1, 1,
0.9526441, 1.138749, 1.092492, 0, 0, 0, 1, 1,
0.9535001, 0.1053892, 2.840053, 1, 1, 1, 1, 1,
0.9571543, 1.296874, 0.3278631, 1, 1, 1, 1, 1,
0.9661877, -0.8531142, 2.018571, 1, 1, 1, 1, 1,
0.9662958, 1.267157, 1.106361, 1, 1, 1, 1, 1,
0.9675161, 0.7357624, 1.309916, 1, 1, 1, 1, 1,
0.9727774, 1.341684, -0.5195287, 1, 1, 1, 1, 1,
0.9787219, 1.07127, 2.252806, 1, 1, 1, 1, 1,
0.9836289, 0.04827931, 2.148145, 1, 1, 1, 1, 1,
0.9872087, 0.03498259, 0.8549666, 1, 1, 1, 1, 1,
0.9874659, -0.2989164, 3.131969, 1, 1, 1, 1, 1,
0.9887908, 0.8643352, -0.4537995, 1, 1, 1, 1, 1,
0.9942517, -0.4588583, 2.154744, 1, 1, 1, 1, 1,
1.007125, 0.3791027, 1.98406, 1, 1, 1, 1, 1,
1.015937, -0.2311427, 2.016644, 1, 1, 1, 1, 1,
1.021714, -0.2901421, 3.235846, 1, 1, 1, 1, 1,
1.028669, -0.2426383, 1.934452, 0, 0, 1, 1, 1,
1.04021, 1.686615, 1.059051, 1, 0, 0, 1, 1,
1.044196, -1.267686, 2.051785, 1, 0, 0, 1, 1,
1.049106, 0.07851893, 1.072667, 1, 0, 0, 1, 1,
1.056453, -0.3420637, 0.5855747, 1, 0, 0, 1, 1,
1.063073, 0.02762053, 1.874681, 1, 0, 0, 1, 1,
1.064324, 2.100449, 1.785317, 0, 0, 0, 1, 1,
1.067593, 1.46667, 1.1556, 0, 0, 0, 1, 1,
1.067861, -2.592023, 3.305991, 0, 0, 0, 1, 1,
1.0691, -1.213888, 4.246792, 0, 0, 0, 1, 1,
1.078743, 0.4325405, 0.5095687, 0, 0, 0, 1, 1,
1.087241, 0.5203475, 1.113301, 0, 0, 0, 1, 1,
1.095445, 0.4133785, -0.2234057, 0, 0, 0, 1, 1,
1.101948, -1.559246, 1.996511, 1, 1, 1, 1, 1,
1.102708, -0.1624243, 2.374431, 1, 1, 1, 1, 1,
1.103525, 0.4545729, 0.04751385, 1, 1, 1, 1, 1,
1.103923, -2.216267, 1.830166, 1, 1, 1, 1, 1,
1.109838, 1.393455, -0.4531632, 1, 1, 1, 1, 1,
1.11349, 1.26583, 0.788184, 1, 1, 1, 1, 1,
1.12937, 1.828307, 0.8078383, 1, 1, 1, 1, 1,
1.129801, 0.1993498, 3.20238, 1, 1, 1, 1, 1,
1.130726, -0.1379095, 1.7356, 1, 1, 1, 1, 1,
1.133051, 1.377725, 1.095596, 1, 1, 1, 1, 1,
1.135351, 0.7803331, 2.215398, 1, 1, 1, 1, 1,
1.14277, 0.4762425, 0.4486377, 1, 1, 1, 1, 1,
1.158937, -0.15448, 0.3083679, 1, 1, 1, 1, 1,
1.164666, 1.251819, -0.19563, 1, 1, 1, 1, 1,
1.168656, -1.027593, 3.565561, 1, 1, 1, 1, 1,
1.172443, 1.510432, 2.649605, 0, 0, 1, 1, 1,
1.17393, 0.3276055, 0.6234865, 1, 0, 0, 1, 1,
1.18766, 0.5837616, 0.08230472, 1, 0, 0, 1, 1,
1.188593, 1.354784, 1.040527, 1, 0, 0, 1, 1,
1.196074, 0.6512678, 2.35586, 1, 0, 0, 1, 1,
1.196746, -1.488781, 1.660292, 1, 0, 0, 1, 1,
1.197661, -0.09595466, 1.997709, 0, 0, 0, 1, 1,
1.201646, 1.363791, -0.3964687, 0, 0, 0, 1, 1,
1.201764, 2.410164, 1.751073, 0, 0, 0, 1, 1,
1.21461, -0.1964516, 0.9884934, 0, 0, 0, 1, 1,
1.260486, -0.1549513, 1.1836, 0, 0, 0, 1, 1,
1.262645, -0.7993681, 1.99254, 0, 0, 0, 1, 1,
1.268581, 0.987276, 0.9503843, 0, 0, 0, 1, 1,
1.272028, -0.06232464, 2.572809, 1, 1, 1, 1, 1,
1.281207, 1.695643, 1.921468, 1, 1, 1, 1, 1,
1.284626, 1.38815, 1.010796, 1, 1, 1, 1, 1,
1.298409, 1.056104, 0.6701318, 1, 1, 1, 1, 1,
1.302044, 0.1095833, 0.3453227, 1, 1, 1, 1, 1,
1.305163, -0.8995196, 0.7696846, 1, 1, 1, 1, 1,
1.306982, 0.7134917, 1.255099, 1, 1, 1, 1, 1,
1.313312, -1.316808, 2.624043, 1, 1, 1, 1, 1,
1.314602, -0.8054385, 2.347777, 1, 1, 1, 1, 1,
1.315206, 1.335851, 0.5557589, 1, 1, 1, 1, 1,
1.318346, -1.516672, 2.951692, 1, 1, 1, 1, 1,
1.323818, 0.3885197, 1.120579, 1, 1, 1, 1, 1,
1.33653, -0.9115522, 3.542734, 1, 1, 1, 1, 1,
1.34552, -0.3008945, 0.8471261, 1, 1, 1, 1, 1,
1.34655, -0.9436784, 3.069076, 1, 1, 1, 1, 1,
1.352413, -0.4336371, 2.857448, 0, 0, 1, 1, 1,
1.357815, 1.045614, 0.08634117, 1, 0, 0, 1, 1,
1.358264, 0.2481608, 2.266388, 1, 0, 0, 1, 1,
1.361559, -1.149857, 3.262871, 1, 0, 0, 1, 1,
1.364568, 0.5626581, -0.02382536, 1, 0, 0, 1, 1,
1.389131, -1.343134, 3.885705, 1, 0, 0, 1, 1,
1.394755, 0.1440333, 2.379097, 0, 0, 0, 1, 1,
1.41588, 0.7629285, 1.078613, 0, 0, 0, 1, 1,
1.416708, 0.1865692, 1.085391, 0, 0, 0, 1, 1,
1.421974, -0.9743071, 2.377572, 0, 0, 0, 1, 1,
1.430623, -1.231825, 2.031904, 0, 0, 0, 1, 1,
1.435645, -0.9802139, 1.786952, 0, 0, 0, 1, 1,
1.436239, -0.5995515, 1.435034, 0, 0, 0, 1, 1,
1.450394, 0.05121734, 1.438227, 1, 1, 1, 1, 1,
1.456854, -0.8493202, 2.216106, 1, 1, 1, 1, 1,
1.458274, -1.164122, 1.87383, 1, 1, 1, 1, 1,
1.458969, -0.4389437, 1.56631, 1, 1, 1, 1, 1,
1.461162, -0.8274474, 3.326133, 1, 1, 1, 1, 1,
1.467667, -0.5187277, 1.126958, 1, 1, 1, 1, 1,
1.467826, -1.049107, 1.801772, 1, 1, 1, 1, 1,
1.468515, 2.024543, 0.3339619, 1, 1, 1, 1, 1,
1.476462, -0.6917973, 0.6911888, 1, 1, 1, 1, 1,
1.477022, -0.0780311, 1.100876, 1, 1, 1, 1, 1,
1.480395, -0.6922391, 1.058223, 1, 1, 1, 1, 1,
1.484558, 1.305847, -0.02651784, 1, 1, 1, 1, 1,
1.49683, 0.232209, 1.325718, 1, 1, 1, 1, 1,
1.51382, -0.0987654, 2.153546, 1, 1, 1, 1, 1,
1.518891, 0.2157034, 1.382084, 1, 1, 1, 1, 1,
1.519785, -0.7011329, 3.546676, 0, 0, 1, 1, 1,
1.53383, 0.9853535, 2.196608, 1, 0, 0, 1, 1,
1.551468, -0.0672194, 1.850191, 1, 0, 0, 1, 1,
1.55314, -2.095524, 1.412827, 1, 0, 0, 1, 1,
1.559664, 1.845111, -1.369154, 1, 0, 0, 1, 1,
1.5866, -0.05308422, 3.359229, 1, 0, 0, 1, 1,
1.587696, 1.395834, 0.07401011, 0, 0, 0, 1, 1,
1.592711, -0.4522425, 0.1848556, 0, 0, 0, 1, 1,
1.593007, 0.336095, -0.2623225, 0, 0, 0, 1, 1,
1.595937, -0.5985848, 3.08351, 0, 0, 0, 1, 1,
1.602862, -0.254789, 1.756719, 0, 0, 0, 1, 1,
1.609597, -0.1053181, 3.664051, 0, 0, 0, 1, 1,
1.620339, -0.640574, 2.947166, 0, 0, 0, 1, 1,
1.63085, 0.5580306, 1.628086, 1, 1, 1, 1, 1,
1.634068, -1.059954, 2.500424, 1, 1, 1, 1, 1,
1.641526, -0.07775213, 0.4434389, 1, 1, 1, 1, 1,
1.644599, -0.3521078, 4.162167, 1, 1, 1, 1, 1,
1.652447, 1.685499, -0.2730686, 1, 1, 1, 1, 1,
1.665926, -0.350712, 1.428154, 1, 1, 1, 1, 1,
1.678757, -0.1598624, 3.245353, 1, 1, 1, 1, 1,
1.679099, -0.9825945, 1.088162, 1, 1, 1, 1, 1,
1.686302, -0.4415347, 4.03445, 1, 1, 1, 1, 1,
1.692581, 0.1275416, 2.21968, 1, 1, 1, 1, 1,
1.697472, 1.080982, 2.421597, 1, 1, 1, 1, 1,
1.719518, 2.556017, 0.212681, 1, 1, 1, 1, 1,
1.735956, 0.6398555, 3.112362, 1, 1, 1, 1, 1,
1.739872, -0.07050098, 0.3059088, 1, 1, 1, 1, 1,
1.75782, -1.865327, 2.925774, 1, 1, 1, 1, 1,
1.769242, -0.2197517, 0.8118296, 0, 0, 1, 1, 1,
1.782295, 0.8807449, -1.361354, 1, 0, 0, 1, 1,
1.787765, 0.4381519, 2.442746, 1, 0, 0, 1, 1,
1.788698, 0.3275461, 2.102915, 1, 0, 0, 1, 1,
1.790789, -0.994121, 2.593546, 1, 0, 0, 1, 1,
1.806883, 1.000612, 2.257181, 1, 0, 0, 1, 1,
1.81537, -0.5019102, 0.8746695, 0, 0, 0, 1, 1,
1.816942, -1.599582, 1.172196, 0, 0, 0, 1, 1,
1.819808, -0.2349775, 1.494327, 0, 0, 0, 1, 1,
1.852035, 1.260743, 1.331139, 0, 0, 0, 1, 1,
1.862933, 0.4151738, 1.795872, 0, 0, 0, 1, 1,
1.869719, 0.3971836, 0.8457493, 0, 0, 0, 1, 1,
1.871113, 0.2769686, 0.8169226, 0, 0, 0, 1, 1,
1.873204, -2.214382, 1.641699, 1, 1, 1, 1, 1,
1.889034, 0.946183, 2.059667, 1, 1, 1, 1, 1,
1.901356, 1.031558, 1.900929, 1, 1, 1, 1, 1,
1.902716, -1.341671, 1.293492, 1, 1, 1, 1, 1,
1.912014, -0.05897731, 1.47168, 1, 1, 1, 1, 1,
1.941624, 0.178691, 0.9267198, 1, 1, 1, 1, 1,
1.964626, 1.30359, 1.189039, 1, 1, 1, 1, 1,
1.968445, 1.334229, 0.7512045, 1, 1, 1, 1, 1,
1.972349, 1.037612, 0.8460282, 1, 1, 1, 1, 1,
1.99053, -1.956387, 2.150047, 1, 1, 1, 1, 1,
2.017649, -0.250187, 2.649532, 1, 1, 1, 1, 1,
2.092148, 1.526734, 1.434134, 1, 1, 1, 1, 1,
2.16927, -0.7241879, 3.221133, 1, 1, 1, 1, 1,
2.174011, 0.3086543, 2.169911, 1, 1, 1, 1, 1,
2.222431, -1.306819, 3.287708, 1, 1, 1, 1, 1,
2.267524, 1.195002, 1.872236, 0, 0, 1, 1, 1,
2.286261, -0.3791113, 1.348087, 1, 0, 0, 1, 1,
2.295119, -0.7357999, 2.468012, 1, 0, 0, 1, 1,
2.311047, 0.5593106, 1.842511, 1, 0, 0, 1, 1,
2.338956, -0.1646899, 3.372729, 1, 0, 0, 1, 1,
2.37092, 1.626214, 1.607636, 1, 0, 0, 1, 1,
2.403501, -0.5936576, 0.03704533, 0, 0, 0, 1, 1,
2.441731, 1.493289, 1.366748, 0, 0, 0, 1, 1,
2.4491, -1.308541, 3.968558, 0, 0, 0, 1, 1,
2.473021, -1.890409, 0.7619352, 0, 0, 0, 1, 1,
2.499869, -0.9529619, 1.9828, 0, 0, 0, 1, 1,
2.503551, -0.4591857, 1.308842, 0, 0, 0, 1, 1,
2.526081, 0.1650076, 0.4819572, 0, 0, 0, 1, 1,
2.540173, -0.1160858, 2.406849, 1, 1, 1, 1, 1,
2.541144, 0.5820184, 1.475777, 1, 1, 1, 1, 1,
2.556857, 0.3408634, 1.90163, 1, 1, 1, 1, 1,
2.568654, -0.1418741, 0.5672309, 1, 1, 1, 1, 1,
2.769816, -0.1153153, 2.494347, 1, 1, 1, 1, 1,
2.984717, -0.8701024, 1.008992, 1, 1, 1, 1, 1,
3.404517, -0.9840494, 1.222005, 1, 1, 1, 1, 1
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
var radius = 9.418338;
var distance = 33.08152;
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
mvMatrix.translate( -0.2079387, -0.08442378, 0.09417462 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08152);
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
