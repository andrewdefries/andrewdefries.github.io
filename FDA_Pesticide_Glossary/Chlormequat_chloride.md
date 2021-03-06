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
-3.254727, -0.6081257, -3.314504, 1, 0, 0, 1,
-2.796791, -0.7558874, -2.914145, 1, 0.007843138, 0, 1,
-2.724088, 1.660229, -0.7336465, 1, 0.01176471, 0, 1,
-2.585685, -0.7811774, -3.941547, 1, 0.01960784, 0, 1,
-2.539878, 0.7751793, -0.8970974, 1, 0.02352941, 0, 1,
-2.456356, -0.1052141, -0.7683629, 1, 0.03137255, 0, 1,
-2.438866, -0.5733402, -2.25642, 1, 0.03529412, 0, 1,
-2.338183, -0.8249604, -1.538448, 1, 0.04313726, 0, 1,
-2.335237, 0.9126605, -1.634605, 1, 0.04705882, 0, 1,
-2.326379, 2.333843, -2.061308, 1, 0.05490196, 0, 1,
-2.312744, -0.7902965, -1.180303, 1, 0.05882353, 0, 1,
-2.304877, -1.907845, -1.802468, 1, 0.06666667, 0, 1,
-2.277732, 1.562827, 0.2246201, 1, 0.07058824, 0, 1,
-2.214515, -0.30861, -3.108464, 1, 0.07843138, 0, 1,
-2.142541, -0.03162542, 1.869305, 1, 0.08235294, 0, 1,
-2.085268, 0.5025856, -3.096073, 1, 0.09019608, 0, 1,
-2.073484, -0.3118155, -2.529672, 1, 0.09411765, 0, 1,
-2.029708, -0.9798607, -2.78704, 1, 0.1019608, 0, 1,
-2.007435, 0.3260404, -1.283896, 1, 0.1098039, 0, 1,
-2.007139, 0.5985728, -2.168796, 1, 0.1137255, 0, 1,
-1.997835, 2.002396, 0.3574531, 1, 0.1215686, 0, 1,
-1.992126, 0.7676923, -1.285076, 1, 0.1254902, 0, 1,
-1.986747, -0.1237204, -0.8276259, 1, 0.1333333, 0, 1,
-1.981123, -0.9033808, -2.781835, 1, 0.1372549, 0, 1,
-1.976671, 0.00089142, -0.64379, 1, 0.145098, 0, 1,
-1.975063, 0.007314659, -0.7112169, 1, 0.1490196, 0, 1,
-1.973452, -1.162792, -2.424595, 1, 0.1568628, 0, 1,
-1.962474, 0.1694198, -1.121102, 1, 0.1607843, 0, 1,
-1.939222, 0.6363187, -0.2307144, 1, 0.1686275, 0, 1,
-1.938754, -0.1252461, -3.867815, 1, 0.172549, 0, 1,
-1.916789, 1.272979, -0.8653865, 1, 0.1803922, 0, 1,
-1.91331, 0.4262861, -1.06096, 1, 0.1843137, 0, 1,
-1.910669, 0.5008584, -0.4397315, 1, 0.1921569, 0, 1,
-1.903662, 0.7922563, -0.2901692, 1, 0.1960784, 0, 1,
-1.900738, -0.1196257, -3.300481, 1, 0.2039216, 0, 1,
-1.900249, -1.796523, -2.25352, 1, 0.2117647, 0, 1,
-1.898277, 0.06810499, -3.035884, 1, 0.2156863, 0, 1,
-1.843102, -0.3620858, -2.949027, 1, 0.2235294, 0, 1,
-1.830909, 0.1927719, -1.9076, 1, 0.227451, 0, 1,
-1.823457, 1.623183, -0.576885, 1, 0.2352941, 0, 1,
-1.809829, -0.0240689, -0.8078501, 1, 0.2392157, 0, 1,
-1.796372, -0.01749733, 1.119731, 1, 0.2470588, 0, 1,
-1.791061, 2.608217, -0.5887863, 1, 0.2509804, 0, 1,
-1.754222, -0.4903182, -2.122449, 1, 0.2588235, 0, 1,
-1.751845, 0.05440808, -1.284494, 1, 0.2627451, 0, 1,
-1.751503, 0.412315, -0.8322412, 1, 0.2705882, 0, 1,
-1.749124, -0.4110232, -1.778691, 1, 0.2745098, 0, 1,
-1.73738, 0.1887913, -1.052373, 1, 0.282353, 0, 1,
-1.729128, -1.201977, -2.516909, 1, 0.2862745, 0, 1,
-1.693616, 1.242338, -1.591285, 1, 0.2941177, 0, 1,
-1.670687, -0.329814, 0.004892007, 1, 0.3019608, 0, 1,
-1.665603, 0.006515299, -1.432171, 1, 0.3058824, 0, 1,
-1.658365, -1.557367, -2.667139, 1, 0.3137255, 0, 1,
-1.645842, -0.786116, -3.663706, 1, 0.3176471, 0, 1,
-1.639638, -0.05661548, -2.221582, 1, 0.3254902, 0, 1,
-1.636921, 0.3438193, -1.572543, 1, 0.3294118, 0, 1,
-1.622942, -1.007416, -2.020833, 1, 0.3372549, 0, 1,
-1.607104, -2.238099, -2.374916, 1, 0.3411765, 0, 1,
-1.579898, -0.8738531, -1.759709, 1, 0.3490196, 0, 1,
-1.572254, -0.500048, -1.564924, 1, 0.3529412, 0, 1,
-1.559015, 0.1005677, -1.884561, 1, 0.3607843, 0, 1,
-1.556009, 0.9121752, -1.373684, 1, 0.3647059, 0, 1,
-1.539323, -0.1589289, -2.263512, 1, 0.372549, 0, 1,
-1.52841, -0.1866183, -2.491812, 1, 0.3764706, 0, 1,
-1.528055, -0.2906066, -3.069122, 1, 0.3843137, 0, 1,
-1.52348, 0.06612014, -0.5583377, 1, 0.3882353, 0, 1,
-1.523472, 1.115462, -5.034604, 1, 0.3960784, 0, 1,
-1.493801, -0.6157496, -0.4130225, 1, 0.4039216, 0, 1,
-1.4903, 0.1560581, -1.95956, 1, 0.4078431, 0, 1,
-1.490115, -1.331901, -2.500991, 1, 0.4156863, 0, 1,
-1.489149, 0.6541395, 1.30226, 1, 0.4196078, 0, 1,
-1.488749, 0.6901357, -1.392779, 1, 0.427451, 0, 1,
-1.488468, -2.694006, -2.024706, 1, 0.4313726, 0, 1,
-1.480698, -0.657205, -0.7866009, 1, 0.4392157, 0, 1,
-1.458991, 2.252246, -1.829774, 1, 0.4431373, 0, 1,
-1.458925, 1.68456, -1.131893, 1, 0.4509804, 0, 1,
-1.458421, -0.6029275, -2.119632, 1, 0.454902, 0, 1,
-1.457808, -0.5330681, -1.03164, 1, 0.4627451, 0, 1,
-1.454616, -1.073, -2.151944, 1, 0.4666667, 0, 1,
-1.450469, 0.6444232, -2.385643, 1, 0.4745098, 0, 1,
-1.438269, -0.1317713, -2.33901, 1, 0.4784314, 0, 1,
-1.435012, -0.508495, -2.37363, 1, 0.4862745, 0, 1,
-1.429545, -1.157255, -1.718527, 1, 0.4901961, 0, 1,
-1.4182, -0.4645174, -0.9947463, 1, 0.4980392, 0, 1,
-1.400025, 0.09189118, -1.677608, 1, 0.5058824, 0, 1,
-1.397949, -1.526403, -2.431067, 1, 0.509804, 0, 1,
-1.397868, 0.5772009, -1.647363, 1, 0.5176471, 0, 1,
-1.394873, -0.7144557, -3.204472, 1, 0.5215687, 0, 1,
-1.383067, -0.3768389, -0.9737567, 1, 0.5294118, 0, 1,
-1.37844, -0.1186729, -1.091769, 1, 0.5333334, 0, 1,
-1.371646, -0.4832097, -1.544899, 1, 0.5411765, 0, 1,
-1.370315, 0.5576295, 1.684065, 1, 0.5450981, 0, 1,
-1.362418, -0.2178199, -1.340778, 1, 0.5529412, 0, 1,
-1.348606, -0.6581079, -0.9216475, 1, 0.5568628, 0, 1,
-1.346217, -0.3662376, -3.83948, 1, 0.5647059, 0, 1,
-1.346192, -0.03780784, -1.894658, 1, 0.5686275, 0, 1,
-1.339721, -2.472726, -3.000423, 1, 0.5764706, 0, 1,
-1.339503, 0.9944543, -1.510099, 1, 0.5803922, 0, 1,
-1.328305, -1.542918, -1.711984, 1, 0.5882353, 0, 1,
-1.318715, -0.06967081, -1.634746, 1, 0.5921569, 0, 1,
-1.309224, -0.149258, -1.354679, 1, 0.6, 0, 1,
-1.303488, 0.5643395, -1.112266, 1, 0.6078432, 0, 1,
-1.302875, -1.510971, -3.701869, 1, 0.6117647, 0, 1,
-1.301366, 1.143144, 0.3045099, 1, 0.6196079, 0, 1,
-1.29767, -0.4054545, -2.143382, 1, 0.6235294, 0, 1,
-1.296592, 1.081999, -0.08804198, 1, 0.6313726, 0, 1,
-1.291535, -0.5530456, -1.049395, 1, 0.6352941, 0, 1,
-1.291301, -0.03940471, -1.690843, 1, 0.6431373, 0, 1,
-1.287713, -1.804713, -2.961692, 1, 0.6470588, 0, 1,
-1.283254, -0.3946065, -2.431537, 1, 0.654902, 0, 1,
-1.279543, -1.312771, -2.711023, 1, 0.6588235, 0, 1,
-1.278425, 0.2016237, -1.004254, 1, 0.6666667, 0, 1,
-1.26479, 1.355924, -0.2372606, 1, 0.6705883, 0, 1,
-1.259386, 1.549204, 0.1945613, 1, 0.6784314, 0, 1,
-1.257196, -1.667115, -2.887216, 1, 0.682353, 0, 1,
-1.253932, -0.2584046, -3.525805, 1, 0.6901961, 0, 1,
-1.250934, 0.312938, -2.67386, 1, 0.6941177, 0, 1,
-1.250475, -0.4426636, -2.175198, 1, 0.7019608, 0, 1,
-1.247778, -0.5428229, -2.798537, 1, 0.7098039, 0, 1,
-1.247329, -0.3937268, -2.969707, 1, 0.7137255, 0, 1,
-1.245343, 0.2167547, -1.206029, 1, 0.7215686, 0, 1,
-1.244404, 0.4097795, -2.881871, 1, 0.7254902, 0, 1,
-1.231542, 2.192738, -0.01025556, 1, 0.7333333, 0, 1,
-1.226838, -0.2352538, -1.245981, 1, 0.7372549, 0, 1,
-1.224484, -0.5649295, -0.7407192, 1, 0.7450981, 0, 1,
-1.204416, -1.040329, -2.921658, 1, 0.7490196, 0, 1,
-1.186018, -0.3496373, -0.3556454, 1, 0.7568628, 0, 1,
-1.178638, 0.01585432, -1.818921, 1, 0.7607843, 0, 1,
-1.175763, -0.8034583, -2.578021, 1, 0.7686275, 0, 1,
-1.175451, -0.7357276, -2.599332, 1, 0.772549, 0, 1,
-1.175126, -0.3829654, -0.9497703, 1, 0.7803922, 0, 1,
-1.156801, -1.521089, -1.559988, 1, 0.7843137, 0, 1,
-1.154083, -0.04398325, -2.078975, 1, 0.7921569, 0, 1,
-1.146464, -1.384379, -1.581779, 1, 0.7960784, 0, 1,
-1.140719, -0.4467532, -2.242202, 1, 0.8039216, 0, 1,
-1.135029, -0.4872148, -2.472594, 1, 0.8117647, 0, 1,
-1.129839, 0.09221569, -1.369257, 1, 0.8156863, 0, 1,
-1.122142, 0.4596241, -0.3593341, 1, 0.8235294, 0, 1,
-1.117198, 0.877331, -0.1890846, 1, 0.827451, 0, 1,
-1.103603, -1.097386, -2.74759, 1, 0.8352941, 0, 1,
-1.103169, -0.6377038, -3.01308, 1, 0.8392157, 0, 1,
-1.102759, 0.2303573, -0.2801241, 1, 0.8470588, 0, 1,
-1.101547, -1.394332, -2.244342, 1, 0.8509804, 0, 1,
-1.094913, 1.64239, 1.228882, 1, 0.8588235, 0, 1,
-1.093979, -0.4812305, -2.838027, 1, 0.8627451, 0, 1,
-1.085613, -0.6452163, -2.724995, 1, 0.8705882, 0, 1,
-1.081824, -0.6934218, -2.759786, 1, 0.8745098, 0, 1,
-1.075261, 0.7394353, -0.8110625, 1, 0.8823529, 0, 1,
-1.074909, -2.133019, -1.861718, 1, 0.8862745, 0, 1,
-1.074348, 0.1192698, -0.3119745, 1, 0.8941177, 0, 1,
-1.07367, 1.60168, -0.7122396, 1, 0.8980392, 0, 1,
-1.06548, 0.9751289, -0.4947, 1, 0.9058824, 0, 1,
-1.062567, 0.2025978, -2.044052, 1, 0.9137255, 0, 1,
-1.058053, 2.37171, -1.111153, 1, 0.9176471, 0, 1,
-1.05282, 0.3094233, -0.8620661, 1, 0.9254902, 0, 1,
-1.052065, -0.06468368, -1.41836, 1, 0.9294118, 0, 1,
-1.049639, -1.076441, -2.276165, 1, 0.9372549, 0, 1,
-1.034648, 0.5954016, -1.860741, 1, 0.9411765, 0, 1,
-1.033171, 0.09220185, -4.282261, 1, 0.9490196, 0, 1,
-1.019065, -0.162295, -1.461222, 1, 0.9529412, 0, 1,
-1.017272, 0.6137972, -0.4778227, 1, 0.9607843, 0, 1,
-1.013513, -0.6829658, -1.070257, 1, 0.9647059, 0, 1,
-1.007375, 0.5289615, 0.9396039, 1, 0.972549, 0, 1,
-1.004163, 1.702678, 0.429123, 1, 0.9764706, 0, 1,
-1.002963, 0.8191072, 1.421857, 1, 0.9843137, 0, 1,
-0.9974504, 0.5999816, -1.154477, 1, 0.9882353, 0, 1,
-0.9910332, 0.7250661, -0.939005, 1, 0.9960784, 0, 1,
-0.9858894, -0.08484277, -2.103387, 0.9960784, 1, 0, 1,
-0.9837199, -1.553566, -2.789609, 0.9921569, 1, 0, 1,
-0.9791099, -0.5501752, -0.8749481, 0.9843137, 1, 0, 1,
-0.9747137, 1.539103, 0.6219057, 0.9803922, 1, 0, 1,
-0.9714466, 1.578823, -0.8422987, 0.972549, 1, 0, 1,
-0.9699395, -0.9741573, -2.219134, 0.9686275, 1, 0, 1,
-0.9694416, 0.4860118, 0.4643792, 0.9607843, 1, 0, 1,
-0.9689968, -1.627959, -2.493798, 0.9568627, 1, 0, 1,
-0.962163, 0.4572487, -2.404517, 0.9490196, 1, 0, 1,
-0.9555795, 1.78741, -1.602185, 0.945098, 1, 0, 1,
-0.9538836, -0.7747983, -2.515003, 0.9372549, 1, 0, 1,
-0.9524401, -0.0188304, -2.558265, 0.9333333, 1, 0, 1,
-0.9516382, -1.499759, -1.145746, 0.9254902, 1, 0, 1,
-0.9462215, 0.5680094, -0.3514401, 0.9215686, 1, 0, 1,
-0.9381385, -0.1923792, -0.7085597, 0.9137255, 1, 0, 1,
-0.935077, 1.227109, 0.01114578, 0.9098039, 1, 0, 1,
-0.9340245, 1.285326, -1.257666, 0.9019608, 1, 0, 1,
-0.9334871, -1.646703, -2.409372, 0.8941177, 1, 0, 1,
-0.9311455, 1.512461, 0.5635097, 0.8901961, 1, 0, 1,
-0.925105, 0.845952, -2.063953, 0.8823529, 1, 0, 1,
-0.9247046, -1.491536, -2.26702, 0.8784314, 1, 0, 1,
-0.9225523, -0.188524, -2.012912, 0.8705882, 1, 0, 1,
-0.9218407, -0.2317355, -2.182459, 0.8666667, 1, 0, 1,
-0.9178494, 0.6993554, -0.4190555, 0.8588235, 1, 0, 1,
-0.915232, -0.4267081, -4.543833, 0.854902, 1, 0, 1,
-0.9124421, 0.03530251, -1.39397, 0.8470588, 1, 0, 1,
-0.9114508, 0.7797379, -1.182163, 0.8431373, 1, 0, 1,
-0.9108815, 0.1151377, -1.494232, 0.8352941, 1, 0, 1,
-0.9061627, -1.44814, -2.445388, 0.8313726, 1, 0, 1,
-0.9058196, 1.095314, -1.526324, 0.8235294, 1, 0, 1,
-0.9036627, -0.9615797, -2.835938, 0.8196079, 1, 0, 1,
-0.9035727, 0.9145523, -1.361973, 0.8117647, 1, 0, 1,
-0.9034929, -0.6149325, -2.658141, 0.8078431, 1, 0, 1,
-0.9033365, 2.063294, 0.2842468, 0.8, 1, 0, 1,
-0.9015747, -0.8614462, -1.747178, 0.7921569, 1, 0, 1,
-0.8961634, -0.8524654, -3.558874, 0.7882353, 1, 0, 1,
-0.8951607, 0.6151944, -0.4998513, 0.7803922, 1, 0, 1,
-0.8915662, -0.6742048, -0.5328754, 0.7764706, 1, 0, 1,
-0.8915502, 0.488445, -0.4421726, 0.7686275, 1, 0, 1,
-0.8776774, 0.5046176, -0.3235987, 0.7647059, 1, 0, 1,
-0.8737319, -0.2030321, -1.833417, 0.7568628, 1, 0, 1,
-0.8715736, -0.8395407, -1.97978, 0.7529412, 1, 0, 1,
-0.8709594, -1.358293, -1.607207, 0.7450981, 1, 0, 1,
-0.8601325, -0.3197538, -1.059573, 0.7411765, 1, 0, 1,
-0.8574831, 1.644971, -1.867269, 0.7333333, 1, 0, 1,
-0.8509625, -1.040083, -0.8065882, 0.7294118, 1, 0, 1,
-0.8463003, -1.011787, -1.554125, 0.7215686, 1, 0, 1,
-0.846298, 0.6228678, 0.08721887, 0.7176471, 1, 0, 1,
-0.8444049, -0.59247, -2.586851, 0.7098039, 1, 0, 1,
-0.8402935, -0.3077003, -1.780961, 0.7058824, 1, 0, 1,
-0.8293841, -1.155288, -1.897953, 0.6980392, 1, 0, 1,
-0.829029, -1.150597, -3.811906, 0.6901961, 1, 0, 1,
-0.8210953, 1.01331, -0.8050219, 0.6862745, 1, 0, 1,
-0.8169926, -0.2847047, -4.538053, 0.6784314, 1, 0, 1,
-0.8133598, -0.115343, -1.163391, 0.6745098, 1, 0, 1,
-0.8099609, -0.04595967, -1.353638, 0.6666667, 1, 0, 1,
-0.8045416, 0.9411134, -0.05717256, 0.6627451, 1, 0, 1,
-0.7997271, -1.529096, -3.522624, 0.654902, 1, 0, 1,
-0.7987451, -0.1474467, -1.033696, 0.6509804, 1, 0, 1,
-0.7982419, 0.6255199, -1.321907, 0.6431373, 1, 0, 1,
-0.7971377, -0.5336379, -2.335248, 0.6392157, 1, 0, 1,
-0.7953671, 0.2391423, -2.726023, 0.6313726, 1, 0, 1,
-0.7930621, -0.4351275, -2.546022, 0.627451, 1, 0, 1,
-0.787036, -0.5795521, -2.934844, 0.6196079, 1, 0, 1,
-0.7827112, -0.7157605, -1.419862, 0.6156863, 1, 0, 1,
-0.7790984, -0.7282398, -1.585351, 0.6078432, 1, 0, 1,
-0.7758845, -1.09168, -2.388016, 0.6039216, 1, 0, 1,
-0.7715072, -0.2960484, -3.119799, 0.5960785, 1, 0, 1,
-0.77123, -0.4510626, -0.8468586, 0.5882353, 1, 0, 1,
-0.7576066, 0.2380198, -1.83761, 0.5843138, 1, 0, 1,
-0.7571474, -0.6371269, -1.909918, 0.5764706, 1, 0, 1,
-0.7538857, -0.7583274, -3.544889, 0.572549, 1, 0, 1,
-0.7510777, -2.754885, -2.114498, 0.5647059, 1, 0, 1,
-0.7479724, -0.4225414, -1.733544, 0.5607843, 1, 0, 1,
-0.7431127, -1.280457, -1.545345, 0.5529412, 1, 0, 1,
-0.7376087, 0.3104467, -1.187449, 0.5490196, 1, 0, 1,
-0.7306213, 0.2300678, -0.9386796, 0.5411765, 1, 0, 1,
-0.7306027, 1.273367, 0.7080078, 0.5372549, 1, 0, 1,
-0.7293207, 1.146358, -0.005686835, 0.5294118, 1, 0, 1,
-0.7251531, -0.5370156, -1.527325, 0.5254902, 1, 0, 1,
-0.7231224, 1.0329, -0.714412, 0.5176471, 1, 0, 1,
-0.7201057, 0.3202679, -0.7604988, 0.5137255, 1, 0, 1,
-0.7180054, -1.232125, -1.986777, 0.5058824, 1, 0, 1,
-0.713352, 1.482491, 0.8844725, 0.5019608, 1, 0, 1,
-0.7118759, -1.863935, -2.698737, 0.4941176, 1, 0, 1,
-0.7105325, -0.6945999, -3.420936, 0.4862745, 1, 0, 1,
-0.7086479, -0.9747753, -1.53871, 0.4823529, 1, 0, 1,
-0.7051554, 0.461574, -1.959719, 0.4745098, 1, 0, 1,
-0.6984148, -0.07438254, -2.209069, 0.4705882, 1, 0, 1,
-0.6983052, 0.5735462, 0.05163443, 0.4627451, 1, 0, 1,
-0.6979792, -1.092135, -2.495492, 0.4588235, 1, 0, 1,
-0.6957635, -0.05409367, -0.8808391, 0.4509804, 1, 0, 1,
-0.6950219, 1.159613, -0.0438991, 0.4470588, 1, 0, 1,
-0.6943247, 0.6681471, 0.7892951, 0.4392157, 1, 0, 1,
-0.6898689, 0.8303258, 1.273016, 0.4352941, 1, 0, 1,
-0.6893056, 0.7971378, 0.8704196, 0.427451, 1, 0, 1,
-0.677009, 0.02515693, -1.933, 0.4235294, 1, 0, 1,
-0.6754007, 0.4918748, 1.041174, 0.4156863, 1, 0, 1,
-0.6728647, 0.4157513, -0.8886762, 0.4117647, 1, 0, 1,
-0.6655645, -0.5945662, -2.054574, 0.4039216, 1, 0, 1,
-0.6646543, -1.321563, -2.55049, 0.3960784, 1, 0, 1,
-0.6642419, -0.5393168, -3.381577, 0.3921569, 1, 0, 1,
-0.6631395, 0.2650841, -0.1793097, 0.3843137, 1, 0, 1,
-0.6578676, -0.7574576, -1.150159, 0.3803922, 1, 0, 1,
-0.6535631, -0.05717031, -0.7145084, 0.372549, 1, 0, 1,
-0.6483852, 1.425398, -0.6110993, 0.3686275, 1, 0, 1,
-0.6447666, 0.568533, -0.3126029, 0.3607843, 1, 0, 1,
-0.6446431, -0.4123103, -1.5206, 0.3568628, 1, 0, 1,
-0.6416894, -0.3701977, -1.194948, 0.3490196, 1, 0, 1,
-0.6367314, -0.1866001, -2.499417, 0.345098, 1, 0, 1,
-0.632091, 2.307402, -0.5969744, 0.3372549, 1, 0, 1,
-0.6315069, -0.9506314, -4.672157, 0.3333333, 1, 0, 1,
-0.6266852, -1.111518, -2.89475, 0.3254902, 1, 0, 1,
-0.6263652, -0.1517683, -2.50155, 0.3215686, 1, 0, 1,
-0.6249252, -0.1725514, -0.6921765, 0.3137255, 1, 0, 1,
-0.6240744, 0.09225589, -2.198679, 0.3098039, 1, 0, 1,
-0.6213692, 0.9926236, -3.139035, 0.3019608, 1, 0, 1,
-0.6180184, -1.834114, -4.01013, 0.2941177, 1, 0, 1,
-0.617911, -0.5447236, -2.718852, 0.2901961, 1, 0, 1,
-0.6167663, 1.465487, -1.711749, 0.282353, 1, 0, 1,
-0.614453, -0.4735631, -0.7099334, 0.2784314, 1, 0, 1,
-0.6124071, 0.7743811, -0.9940609, 0.2705882, 1, 0, 1,
-0.6094717, 0.2001874, -1.057546, 0.2666667, 1, 0, 1,
-0.6085947, 0.3373215, -1.608975, 0.2588235, 1, 0, 1,
-0.6083291, 3.285762, 0.3819028, 0.254902, 1, 0, 1,
-0.5987609, -1.002856, -2.442383, 0.2470588, 1, 0, 1,
-0.5958717, -0.5241309, -1.335191, 0.2431373, 1, 0, 1,
-0.5912833, -0.03857967, -0.8590623, 0.2352941, 1, 0, 1,
-0.5905783, 1.002772, -0.976358, 0.2313726, 1, 0, 1,
-0.5859351, 0.6999282, -2.037634, 0.2235294, 1, 0, 1,
-0.5857719, -0.420004, -2.859188, 0.2196078, 1, 0, 1,
-0.5832371, 0.3950191, -2.414553, 0.2117647, 1, 0, 1,
-0.5809075, 0.04923553, -1.396207, 0.2078431, 1, 0, 1,
-0.5794094, -1.23091, -4.068139, 0.2, 1, 0, 1,
-0.5792115, -0.6343201, -2.603287, 0.1921569, 1, 0, 1,
-0.574739, -0.2155205, -3.155504, 0.1882353, 1, 0, 1,
-0.5744436, -0.4200712, -1.326591, 0.1803922, 1, 0, 1,
-0.5724892, 2.306753, -0.642207, 0.1764706, 1, 0, 1,
-0.5723678, 1.484731, 0.7363637, 0.1686275, 1, 0, 1,
-0.5680547, -0.3902731, -1.359024, 0.1647059, 1, 0, 1,
-0.5677956, -1.197825, -2.727353, 0.1568628, 1, 0, 1,
-0.5627175, -0.8509396, -4.082235, 0.1529412, 1, 0, 1,
-0.5603335, 2.75889, -0.7312847, 0.145098, 1, 0, 1,
-0.5569958, -0.8025302, -2.398314, 0.1411765, 1, 0, 1,
-0.5558891, 0.172409, -2.754615, 0.1333333, 1, 0, 1,
-0.5540303, 1.074184, -0.3035439, 0.1294118, 1, 0, 1,
-0.5500266, -0.03755299, -0.7610655, 0.1215686, 1, 0, 1,
-0.549983, -1.281582, -2.172644, 0.1176471, 1, 0, 1,
-0.5475587, -0.8259215, -3.150534, 0.1098039, 1, 0, 1,
-0.5463669, -1.595188, -2.006517, 0.1058824, 1, 0, 1,
-0.5439326, 1.460643, -0.4969171, 0.09803922, 1, 0, 1,
-0.5410461, 0.6161823, 0.2409995, 0.09019608, 1, 0, 1,
-0.5399317, -0.009307517, -1.827815, 0.08627451, 1, 0, 1,
-0.5394343, -1.175516, -5.254412, 0.07843138, 1, 0, 1,
-0.5333225, -0.5537419, -2.504668, 0.07450981, 1, 0, 1,
-0.5288447, -0.0602241, -1.213425, 0.06666667, 1, 0, 1,
-0.527256, -2.058797, -3.455512, 0.0627451, 1, 0, 1,
-0.5257018, -1.122201, -2.971401, 0.05490196, 1, 0, 1,
-0.5212796, -0.9135587, -0.3248025, 0.05098039, 1, 0, 1,
-0.5176557, -0.1872149, -3.250152, 0.04313726, 1, 0, 1,
-0.5170362, -0.6981468, -0.8615263, 0.03921569, 1, 0, 1,
-0.5079523, -0.8814916, -1.99808, 0.03137255, 1, 0, 1,
-0.5058587, 1.113248, -0.08868203, 0.02745098, 1, 0, 1,
-0.5031498, -1.525349, -1.865685, 0.01960784, 1, 0, 1,
-0.5026853, 1.145726, -0.9265021, 0.01568628, 1, 0, 1,
-0.5013662, 1.532304, -1.134879, 0.007843138, 1, 0, 1,
-0.5002717, 0.8093292, -0.1399126, 0.003921569, 1, 0, 1,
-0.4995454, -0.2446128, -2.65996, 0, 1, 0.003921569, 1,
-0.4994523, -1.705645, -2.95112, 0, 1, 0.01176471, 1,
-0.4981636, -0.7793558, -0.9690861, 0, 1, 0.01568628, 1,
-0.4962341, -0.3526257, -3.302547, 0, 1, 0.02352941, 1,
-0.493332, -1.405693, -1.104323, 0, 1, 0.02745098, 1,
-0.4821133, -0.1083466, -1.948366, 0, 1, 0.03529412, 1,
-0.4764376, -1.615375, -4.611981, 0, 1, 0.03921569, 1,
-0.474446, -0.07082235, -1.284394, 0, 1, 0.04705882, 1,
-0.4734911, -0.6339422, -2.28684, 0, 1, 0.05098039, 1,
-0.4734634, -1.184116, -2.42532, 0, 1, 0.05882353, 1,
-0.4675638, 0.1796133, -2.02306, 0, 1, 0.0627451, 1,
-0.4666972, -0.8108958, -1.388512, 0, 1, 0.07058824, 1,
-0.4645126, 0.7197879, -1.995882, 0, 1, 0.07450981, 1,
-0.4610765, 1.284093, -0.4448639, 0, 1, 0.08235294, 1,
-0.4610345, -2.294843, -4.165063, 0, 1, 0.08627451, 1,
-0.4578843, -0.03699729, -1.819051, 0, 1, 0.09411765, 1,
-0.456405, -0.8662159, -2.098757, 0, 1, 0.1019608, 1,
-0.4522445, 0.829193, -0.9966708, 0, 1, 0.1058824, 1,
-0.4459258, -0.4576772, -1.809731, 0, 1, 0.1137255, 1,
-0.4457311, 0.1952404, -3.043078, 0, 1, 0.1176471, 1,
-0.4451185, 0.8968662, 0.7456759, 0, 1, 0.1254902, 1,
-0.4436626, -0.2988826, -1.338842, 0, 1, 0.1294118, 1,
-0.4391634, -0.1018093, -0.512055, 0, 1, 0.1372549, 1,
-0.4380747, -0.4946743, -2.209223, 0, 1, 0.1411765, 1,
-0.4284979, -0.3214802, -3.054416, 0, 1, 0.1490196, 1,
-0.4283031, -0.7408315, -3.738046, 0, 1, 0.1529412, 1,
-0.4239906, 0.1531048, -1.676353, 0, 1, 0.1607843, 1,
-0.4212741, 0.06512934, -1.782568, 0, 1, 0.1647059, 1,
-0.4195166, -0.7896213, -3.643727, 0, 1, 0.172549, 1,
-0.4178726, 0.1281676, -0.2123143, 0, 1, 0.1764706, 1,
-0.4147559, 1.503933, 2.080982, 0, 1, 0.1843137, 1,
-0.4142295, -0.144966, -3.029569, 0, 1, 0.1882353, 1,
-0.4128637, 0.7771832, -1.73813, 0, 1, 0.1960784, 1,
-0.4102069, -1.059721, -3.03762, 0, 1, 0.2039216, 1,
-0.4082629, -0.4443814, -1.951995, 0, 1, 0.2078431, 1,
-0.4056612, 0.4665837, 0.09144179, 0, 1, 0.2156863, 1,
-0.4051959, 0.6558307, 0.6354964, 0, 1, 0.2196078, 1,
-0.3998813, 1.620098, -1.592091, 0, 1, 0.227451, 1,
-0.3893207, -0.5379929, -2.971932, 0, 1, 0.2313726, 1,
-0.3865043, 1.81742, 0.1895126, 0, 1, 0.2392157, 1,
-0.3845398, -1.414588, -4.448014, 0, 1, 0.2431373, 1,
-0.3839504, -0.8628627, -2.466208, 0, 1, 0.2509804, 1,
-0.3795872, -0.1789946, -0.508697, 0, 1, 0.254902, 1,
-0.3775794, 0.8628474, 0.6737642, 0, 1, 0.2627451, 1,
-0.373078, -0.295759, -1.679068, 0, 1, 0.2666667, 1,
-0.3721137, -0.08894914, -0.634351, 0, 1, 0.2745098, 1,
-0.3658398, -0.2896153, -1.85482, 0, 1, 0.2784314, 1,
-0.3627062, -0.1695229, -2.187844, 0, 1, 0.2862745, 1,
-0.3623026, -1.134355, -2.767243, 0, 1, 0.2901961, 1,
-0.3611827, 1.112391, 0.8243266, 0, 1, 0.2980392, 1,
-0.359595, -0.3133531, -1.133459, 0, 1, 0.3058824, 1,
-0.3592799, -1.748788, -3.650444, 0, 1, 0.3098039, 1,
-0.356623, -0.7711294, -2.290554, 0, 1, 0.3176471, 1,
-0.3552457, 0.2480051, -0.1000673, 0, 1, 0.3215686, 1,
-0.3549693, -1.021192, -2.507932, 0, 1, 0.3294118, 1,
-0.3513571, 0.3285292, -1.001079, 0, 1, 0.3333333, 1,
-0.3500269, -0.1453627, -3.59854, 0, 1, 0.3411765, 1,
-0.3489413, -0.80778, -2.68119, 0, 1, 0.345098, 1,
-0.3374926, 0.5147609, -0.4113182, 0, 1, 0.3529412, 1,
-0.333486, -0.5828809, -2.812074, 0, 1, 0.3568628, 1,
-0.3265955, 0.1645391, -1.14317, 0, 1, 0.3647059, 1,
-0.3265181, 0.2102837, -0.1385108, 0, 1, 0.3686275, 1,
-0.3251575, -0.7965823, -3.638326, 0, 1, 0.3764706, 1,
-0.3123581, 0.3585762, 1.838863, 0, 1, 0.3803922, 1,
-0.3078448, 0.4045038, -0.3055314, 0, 1, 0.3882353, 1,
-0.3052958, -2.211536, -0.9856458, 0, 1, 0.3921569, 1,
-0.3001652, -1.065098, -4.358105, 0, 1, 0.4, 1,
-0.2999619, 0.3138428, -2.131519, 0, 1, 0.4078431, 1,
-0.2947937, 1.524229, 0.2705202, 0, 1, 0.4117647, 1,
-0.2898196, 1.987381, -1.135145, 0, 1, 0.4196078, 1,
-0.2839141, -0.6512123, -2.33123, 0, 1, 0.4235294, 1,
-0.2783736, -0.4589789, -1.857594, 0, 1, 0.4313726, 1,
-0.276648, -0.4937802, -4.551169, 0, 1, 0.4352941, 1,
-0.2702624, 0.6011986, -0.5256097, 0, 1, 0.4431373, 1,
-0.2656912, -0.1854518, -0.1774613, 0, 1, 0.4470588, 1,
-0.2614312, -0.2143806, -3.05936, 0, 1, 0.454902, 1,
-0.2606797, 0.8226218, -0.6389503, 0, 1, 0.4588235, 1,
-0.2603905, 0.5617341, 0.2093099, 0, 1, 0.4666667, 1,
-0.2603662, 0.6992171, -1.321149, 0, 1, 0.4705882, 1,
-0.2588819, 0.1818453, -0.3179982, 0, 1, 0.4784314, 1,
-0.253446, 0.4329004, -0.287319, 0, 1, 0.4823529, 1,
-0.2518227, -0.3866847, -2.809598, 0, 1, 0.4901961, 1,
-0.2501424, 0.9245125, -0.1944581, 0, 1, 0.4941176, 1,
-0.2451425, -0.111106, -1.649348, 0, 1, 0.5019608, 1,
-0.2449712, 0.8121275, 0.2034908, 0, 1, 0.509804, 1,
-0.2328039, 0.681809, -1.284845, 0, 1, 0.5137255, 1,
-0.2322441, -1.434204, -3.868524, 0, 1, 0.5215687, 1,
-0.2313533, -1.006545, -3.95604, 0, 1, 0.5254902, 1,
-0.2304688, 1.756976, -0.7047934, 0, 1, 0.5333334, 1,
-0.2303645, -0.9691621, -3.644819, 0, 1, 0.5372549, 1,
-0.2297461, -0.6307921, -3.446719, 0, 1, 0.5450981, 1,
-0.2285618, -0.5938326, -2.375178, 0, 1, 0.5490196, 1,
-0.2269589, -1.117704, -3.104495, 0, 1, 0.5568628, 1,
-0.2255727, -0.1676127, -2.15527, 0, 1, 0.5607843, 1,
-0.2252443, -0.9426097, -2.558956, 0, 1, 0.5686275, 1,
-0.2188546, 0.3568233, -0.3150036, 0, 1, 0.572549, 1,
-0.2154864, -0.5530919, -1.948257, 0, 1, 0.5803922, 1,
-0.2142837, -2.257919, -3.805005, 0, 1, 0.5843138, 1,
-0.2125186, 2.244729, -0.169943, 0, 1, 0.5921569, 1,
-0.2118935, -1.163474, -1.676226, 0, 1, 0.5960785, 1,
-0.2118131, 0.6514204, 0.1181415, 0, 1, 0.6039216, 1,
-0.2081634, 0.3205332, 0.6294211, 0, 1, 0.6117647, 1,
-0.2029815, 1.480157, -1.733389, 0, 1, 0.6156863, 1,
-0.200502, 0.1058626, -2.17949, 0, 1, 0.6235294, 1,
-0.1924278, 1.217274, 1.040847, 0, 1, 0.627451, 1,
-0.1920917, -0.4621518, -3.649475, 0, 1, 0.6352941, 1,
-0.1903273, 0.4816506, -1.154782, 0, 1, 0.6392157, 1,
-0.1869262, -1.031525, -1.9856, 0, 1, 0.6470588, 1,
-0.186589, -0.8440348, -2.359846, 0, 1, 0.6509804, 1,
-0.1819508, -1.035866, -2.62122, 0, 1, 0.6588235, 1,
-0.179482, -1.170255, -3.308728, 0, 1, 0.6627451, 1,
-0.1788357, -0.2047024, -1.529684, 0, 1, 0.6705883, 1,
-0.1780678, -0.5585012, -1.164057, 0, 1, 0.6745098, 1,
-0.1770998, 0.004384397, -2.492393, 0, 1, 0.682353, 1,
-0.1715507, 1.224872, 0.4827059, 0, 1, 0.6862745, 1,
-0.1712268, 0.5709208, 1.03116, 0, 1, 0.6941177, 1,
-0.1706175, 0.2653612, -1.503847, 0, 1, 0.7019608, 1,
-0.1702197, -0.16988, -1.901919, 0, 1, 0.7058824, 1,
-0.1668851, -1.022854, -3.662705, 0, 1, 0.7137255, 1,
-0.1658528, -0.6423537, -3.790611, 0, 1, 0.7176471, 1,
-0.1572015, -0.9505625, -2.400688, 0, 1, 0.7254902, 1,
-0.1571752, -0.4246933, -2.283717, 0, 1, 0.7294118, 1,
-0.1570529, 0.4893219, 0.05069279, 0, 1, 0.7372549, 1,
-0.1556209, -0.002971057, -2.291798, 0, 1, 0.7411765, 1,
-0.1515526, 0.01676076, -2.047341, 0, 1, 0.7490196, 1,
-0.1512128, 0.9477415, -0.02356827, 0, 1, 0.7529412, 1,
-0.150116, 2.331666, -1.067738, 0, 1, 0.7607843, 1,
-0.1444744, 0.1910515, -1.261233, 0, 1, 0.7647059, 1,
-0.1421394, 0.04278271, -1.934206, 0, 1, 0.772549, 1,
-0.13974, -1.291051, -2.118245, 0, 1, 0.7764706, 1,
-0.1385261, -0.4092774, -3.850174, 0, 1, 0.7843137, 1,
-0.1370154, 1.074177, 1.002343, 0, 1, 0.7882353, 1,
-0.1341297, 0.2056433, -1.000756, 0, 1, 0.7960784, 1,
-0.1325311, 0.8579983, 0.04879045, 0, 1, 0.8039216, 1,
-0.1315232, -0.3910796, -3.626481, 0, 1, 0.8078431, 1,
-0.1267086, 1.78915, -1.611812, 0, 1, 0.8156863, 1,
-0.125003, -0.4935087, -3.388945, 0, 1, 0.8196079, 1,
-0.1243391, -0.03050239, -2.53516, 0, 1, 0.827451, 1,
-0.123874, -0.5092937, -2.224801, 0, 1, 0.8313726, 1,
-0.09645955, 1.183135, -1.256892, 0, 1, 0.8392157, 1,
-0.09207112, -0.03674291, -1.951212, 0, 1, 0.8431373, 1,
-0.08885928, -0.03735564, -2.343837, 0, 1, 0.8509804, 1,
-0.08826461, 0.2817827, -0.5396258, 0, 1, 0.854902, 1,
-0.08642469, -1.224549, -3.918395, 0, 1, 0.8627451, 1,
-0.08283113, 2.00515, 1.102428, 0, 1, 0.8666667, 1,
-0.08242063, 0.3109873, -0.8512299, 0, 1, 0.8745098, 1,
-0.08159567, -0.620297, -3.083646, 0, 1, 0.8784314, 1,
-0.07885616, 1.044895, 0.6061746, 0, 1, 0.8862745, 1,
-0.07797509, 1.372662, 0.06907417, 0, 1, 0.8901961, 1,
-0.06916419, 1.545728, 0.9143837, 0, 1, 0.8980392, 1,
-0.06422299, 0.3500284, -0.1527686, 0, 1, 0.9058824, 1,
-0.05777286, -0.2437809, -5.058256, 0, 1, 0.9098039, 1,
-0.05411403, -0.7037472, -1.681548, 0, 1, 0.9176471, 1,
-0.05220207, 0.6515865, -0.2841832, 0, 1, 0.9215686, 1,
-0.04692768, -1.709894, -2.268258, 0, 1, 0.9294118, 1,
-0.04395812, -0.5065645, -2.189245, 0, 1, 0.9333333, 1,
-0.04273185, 1.631007, 0.3681489, 0, 1, 0.9411765, 1,
-0.03898308, -1.064888, -3.035415, 0, 1, 0.945098, 1,
-0.03765642, 1.28099, 0.8772362, 0, 1, 0.9529412, 1,
-0.03289242, 0.6761242, 0.4707756, 0, 1, 0.9568627, 1,
-0.03164633, -2.801135, -2.898777, 0, 1, 0.9647059, 1,
-0.02448296, 0.355202, -1.434269, 0, 1, 0.9686275, 1,
-0.01333667, -0.3536127, -2.202203, 0, 1, 0.9764706, 1,
-0.01087591, 1.350465, 2.58106, 0, 1, 0.9803922, 1,
-0.008170562, 0.5186456, -0.03359802, 0, 1, 0.9882353, 1,
-0.005869813, -0.7412563, -2.588397, 0, 1, 0.9921569, 1,
-0.003605091, -0.2928633, -2.858891, 0, 1, 1, 1,
-0.002470556, -0.543648, -3.636447, 0, 0.9921569, 1, 1,
-0.001839869, 0.4802221, 0.6700375, 0, 0.9882353, 1, 1,
0.001320567, 0.06775819, 0.4865365, 0, 0.9803922, 1, 1,
0.002151835, 1.428687, -0.7113572, 0, 0.9764706, 1, 1,
0.003361145, 0.4585138, 0.389647, 0, 0.9686275, 1, 1,
0.00452354, -0.06957339, 3.775876, 0, 0.9647059, 1, 1,
0.004650021, -1.476146, 2.462363, 0, 0.9568627, 1, 1,
0.005595504, -0.5629013, 3.006033, 0, 0.9529412, 1, 1,
0.006714487, 1.149317, -0.411649, 0, 0.945098, 1, 1,
0.007612652, -0.8650613, 3.362487, 0, 0.9411765, 1, 1,
0.009763785, -0.1316642, 2.832507, 0, 0.9333333, 1, 1,
0.01013626, 0.2164542, -0.9488948, 0, 0.9294118, 1, 1,
0.01017216, 0.4250636, -1.469277, 0, 0.9215686, 1, 1,
0.01200123, -0.9548669, 2.767372, 0, 0.9176471, 1, 1,
0.01289365, 1.952346, 0.7947173, 0, 0.9098039, 1, 1,
0.02036373, 0.3847486, 1.848648, 0, 0.9058824, 1, 1,
0.02683788, -0.4984746, 1.768183, 0, 0.8980392, 1, 1,
0.02938323, -0.7759911, 4.77096, 0, 0.8901961, 1, 1,
0.0325856, 1.896563, 0.00933769, 0, 0.8862745, 1, 1,
0.03422917, -0.2997196, 3.735767, 0, 0.8784314, 1, 1,
0.0343309, 0.03718502, 1.259021, 0, 0.8745098, 1, 1,
0.03632069, -0.8058579, 2.68292, 0, 0.8666667, 1, 1,
0.04555354, -2.029847, 3.419699, 0, 0.8627451, 1, 1,
0.04746513, -0.6379282, 1.856561, 0, 0.854902, 1, 1,
0.04876034, 0.5862673, -0.4123843, 0, 0.8509804, 1, 1,
0.04892651, 0.7701787, -0.2102475, 0, 0.8431373, 1, 1,
0.04968673, -2.005192, 4.50799, 0, 0.8392157, 1, 1,
0.05250352, 0.6900408, 0.5912027, 0, 0.8313726, 1, 1,
0.05420624, -0.08743615, 3.089627, 0, 0.827451, 1, 1,
0.05429592, 0.3443616, -1.834264, 0, 0.8196079, 1, 1,
0.05578813, 1.987132, 1.928034, 0, 0.8156863, 1, 1,
0.056924, 0.90234, -1.737184, 0, 0.8078431, 1, 1,
0.06333858, -1.465858, 4.304425, 0, 0.8039216, 1, 1,
0.06674113, 0.5263773, -0.4237094, 0, 0.7960784, 1, 1,
0.06750089, -1.491786, 3.497568, 0, 0.7882353, 1, 1,
0.06931632, 1.489003, 0.483352, 0, 0.7843137, 1, 1,
0.07379057, -0.1261989, 1.668712, 0, 0.7764706, 1, 1,
0.07525998, 0.1640091, 2.088332, 0, 0.772549, 1, 1,
0.07537225, 1.688397, 0.1129388, 0, 0.7647059, 1, 1,
0.07620451, 0.2978608, 0.3014974, 0, 0.7607843, 1, 1,
0.07653586, -0.7992297, 2.940683, 0, 0.7529412, 1, 1,
0.07821041, -0.3606488, 3.324267, 0, 0.7490196, 1, 1,
0.08073247, -1.649607, 2.034122, 0, 0.7411765, 1, 1,
0.08125237, 0.5061237, -0.03683041, 0, 0.7372549, 1, 1,
0.08166651, 0.05850668, 0.01190777, 0, 0.7294118, 1, 1,
0.08487437, -0.2513648, 3.300289, 0, 0.7254902, 1, 1,
0.08665681, -0.3245485, 1.504374, 0, 0.7176471, 1, 1,
0.08670667, 0.05701543, 0.1352035, 0, 0.7137255, 1, 1,
0.08851492, -1.519207, 1.679143, 0, 0.7058824, 1, 1,
0.09864669, 1.115483, -1.463523, 0, 0.6980392, 1, 1,
0.09909366, 1.030858, 0.9305658, 0, 0.6941177, 1, 1,
0.100733, -2.313847, 3.428236, 0, 0.6862745, 1, 1,
0.1011755, -1.012249, 5.039994, 0, 0.682353, 1, 1,
0.1030306, -0.39088, 3.481058, 0, 0.6745098, 1, 1,
0.1039308, 1.893443, 0.2846889, 0, 0.6705883, 1, 1,
0.1056855, 0.7403938, 0.6983536, 0, 0.6627451, 1, 1,
0.1077292, 2.070787, 0.353022, 0, 0.6588235, 1, 1,
0.1091886, -0.7131553, 2.681618, 0, 0.6509804, 1, 1,
0.1120548, -0.3574437, 4.008328, 0, 0.6470588, 1, 1,
0.1132665, 0.3347118, -0.3003135, 0, 0.6392157, 1, 1,
0.1167285, -0.7185798, 2.256514, 0, 0.6352941, 1, 1,
0.1189467, 1.35265, -0.1148305, 0, 0.627451, 1, 1,
0.1208859, 0.1369879, 2.352554, 0, 0.6235294, 1, 1,
0.1237278, -2.739559, 2.4604, 0, 0.6156863, 1, 1,
0.1247004, -1.318267, 1.782074, 0, 0.6117647, 1, 1,
0.1277742, 0.5689321, -0.2904288, 0, 0.6039216, 1, 1,
0.1291548, -0.3836256, 1.620834, 0, 0.5960785, 1, 1,
0.1299003, 1.506566, -0.5657979, 0, 0.5921569, 1, 1,
0.131052, -0.4199774, 3.758629, 0, 0.5843138, 1, 1,
0.1355669, -1.42774, 1.391731, 0, 0.5803922, 1, 1,
0.1362792, -0.8614051, 2.92286, 0, 0.572549, 1, 1,
0.1370004, 0.6152046, 1.636956, 0, 0.5686275, 1, 1,
0.1410126, 0.9095543, -0.3001446, 0, 0.5607843, 1, 1,
0.1414114, -0.4309968, 0.8977277, 0, 0.5568628, 1, 1,
0.1418476, 1.099385, -0.931533, 0, 0.5490196, 1, 1,
0.142661, 0.2475047, 1.487341, 0, 0.5450981, 1, 1,
0.1446649, -0.4739357, 4.890757, 0, 0.5372549, 1, 1,
0.1466486, -0.2328798, 3.230406, 0, 0.5333334, 1, 1,
0.1484863, -0.883594, 2.46465, 0, 0.5254902, 1, 1,
0.1535061, -1.13008, 4.201193, 0, 0.5215687, 1, 1,
0.1575289, 0.5977746, -1.512484, 0, 0.5137255, 1, 1,
0.157922, -1.354586, 0.8350326, 0, 0.509804, 1, 1,
0.1598528, 1.664255, 0.008767051, 0, 0.5019608, 1, 1,
0.1605826, 0.231114, -0.1492836, 0, 0.4941176, 1, 1,
0.1609473, 0.8831377, 0.6347257, 0, 0.4901961, 1, 1,
0.1613439, -1.532884, 2.375582, 0, 0.4823529, 1, 1,
0.1679294, -0.9436888, 3.289928, 0, 0.4784314, 1, 1,
0.1706361, -1.043404, 3.443669, 0, 0.4705882, 1, 1,
0.1726853, -0.3300101, 2.035206, 0, 0.4666667, 1, 1,
0.1754506, -0.3256212, 2.46012, 0, 0.4588235, 1, 1,
0.1760838, -2.990313, 3.579297, 0, 0.454902, 1, 1,
0.1773183, -0.3435548, 1.526315, 0, 0.4470588, 1, 1,
0.181932, -0.2398615, 2.256902, 0, 0.4431373, 1, 1,
0.1860633, 0.1361147, 1.743858, 0, 0.4352941, 1, 1,
0.1865689, 0.3370049, 0.4726168, 0, 0.4313726, 1, 1,
0.1868221, -1.814004, 2.214849, 0, 0.4235294, 1, 1,
0.1880523, 2.24335, -0.7989354, 0, 0.4196078, 1, 1,
0.188944, 0.361594, -0.6658074, 0, 0.4117647, 1, 1,
0.1899916, -1.962922, 4.740617, 0, 0.4078431, 1, 1,
0.1901612, 2.025379, 1.237936, 0, 0.4, 1, 1,
0.1915011, -0.5830805, 2.661253, 0, 0.3921569, 1, 1,
0.1926095, 1.338163, -1.300071, 0, 0.3882353, 1, 1,
0.1944251, -0.7591904, 2.981397, 0, 0.3803922, 1, 1,
0.1950361, 0.5555416, 1.924949, 0, 0.3764706, 1, 1,
0.1956936, -0.500323, 2.948101, 0, 0.3686275, 1, 1,
0.1987773, 1.034877, 0.6941129, 0, 0.3647059, 1, 1,
0.2127658, -0.960667, 2.947298, 0, 0.3568628, 1, 1,
0.2177982, 0.9987538, 0.09180624, 0, 0.3529412, 1, 1,
0.223665, -1.444638, 2.094348, 0, 0.345098, 1, 1,
0.2304815, -0.8670635, 1.291556, 0, 0.3411765, 1, 1,
0.2330395, -0.1174481, 1.988604, 0, 0.3333333, 1, 1,
0.2353606, 1.730044, 1.479525, 0, 0.3294118, 1, 1,
0.2357326, -0.5067097, 4.034116, 0, 0.3215686, 1, 1,
0.2357649, 0.03286136, 0.1018596, 0, 0.3176471, 1, 1,
0.2359712, 0.5972079, 0.5623867, 0, 0.3098039, 1, 1,
0.2377903, 0.09952946, 2.116141, 0, 0.3058824, 1, 1,
0.2379344, 1.994286, 0.9461678, 0, 0.2980392, 1, 1,
0.2387575, 0.4208482, 1.113996, 0, 0.2901961, 1, 1,
0.2403524, 0.2351434, 0.4847541, 0, 0.2862745, 1, 1,
0.2435241, -0.7066727, 4.008166, 0, 0.2784314, 1, 1,
0.2436769, -1.598647, 3.261577, 0, 0.2745098, 1, 1,
0.2449511, 0.1906096, 2.061474, 0, 0.2666667, 1, 1,
0.2463885, -1.438457, 3.144063, 0, 0.2627451, 1, 1,
0.2477253, 0.5138068, -0.1531438, 0, 0.254902, 1, 1,
0.2508534, 1.527359, -0.2431996, 0, 0.2509804, 1, 1,
0.2532739, 0.4356483, 0.4257588, 0, 0.2431373, 1, 1,
0.2586677, -1.714966, 5.558977, 0, 0.2392157, 1, 1,
0.2622244, -0.05446267, 1.600634, 0, 0.2313726, 1, 1,
0.2647411, 1.651358, -1.256642, 0, 0.227451, 1, 1,
0.2685772, 0.04495921, 2.970204, 0, 0.2196078, 1, 1,
0.2712576, -0.9528017, 3.821707, 0, 0.2156863, 1, 1,
0.2713168, -0.280178, 1.769367, 0, 0.2078431, 1, 1,
0.2726521, -1.107949, 3.5813, 0, 0.2039216, 1, 1,
0.2733109, 0.3980517, 0.6983993, 0, 0.1960784, 1, 1,
0.2736577, -0.4731716, 2.673072, 0, 0.1882353, 1, 1,
0.279088, 1.925344, -0.101219, 0, 0.1843137, 1, 1,
0.2794157, -0.6605058, 0.7410013, 0, 0.1764706, 1, 1,
0.282616, 0.8419021, -0.4252937, 0, 0.172549, 1, 1,
0.2826515, -1.851526, 2.345407, 0, 0.1647059, 1, 1,
0.2831825, 0.01407001, 1.632073, 0, 0.1607843, 1, 1,
0.2842382, -0.2540854, 2.740408, 0, 0.1529412, 1, 1,
0.2892703, -0.6985888, 3.573601, 0, 0.1490196, 1, 1,
0.2950389, 0.6942886, 0.9331388, 0, 0.1411765, 1, 1,
0.2966557, 0.490426, 0.2831638, 0, 0.1372549, 1, 1,
0.2997403, -0.4194907, 3.458383, 0, 0.1294118, 1, 1,
0.3039996, 0.4300376, -0.6257757, 0, 0.1254902, 1, 1,
0.30544, 1.740314, -1.230271, 0, 0.1176471, 1, 1,
0.3128306, -0.7605618, 3.133989, 0, 0.1137255, 1, 1,
0.3149491, -0.8915736, 2.942381, 0, 0.1058824, 1, 1,
0.3153706, 1.088853, 0.3807082, 0, 0.09803922, 1, 1,
0.3184341, -1.072865, 1.967861, 0, 0.09411765, 1, 1,
0.3232868, -0.2311947, 1.406107, 0, 0.08627451, 1, 1,
0.3234017, 1.218314, -0.1447081, 0, 0.08235294, 1, 1,
0.3274532, -0.7241773, 4.119177, 0, 0.07450981, 1, 1,
0.3319408, -0.3526693, 2.28071, 0, 0.07058824, 1, 1,
0.3353887, 1.741448, 0.3038377, 0, 0.0627451, 1, 1,
0.3355308, -0.2225449, 3.643403, 0, 0.05882353, 1, 1,
0.342644, -0.3966904, 3.027792, 0, 0.05098039, 1, 1,
0.344312, 1.170645, -0.01652866, 0, 0.04705882, 1, 1,
0.3473889, -0.9667253, 2.836933, 0, 0.03921569, 1, 1,
0.3480725, -0.5802054, 1.515078, 0, 0.03529412, 1, 1,
0.3505839, 0.8397555, 2.389058, 0, 0.02745098, 1, 1,
0.3510958, 0.4901302, 0.4755361, 0, 0.02352941, 1, 1,
0.353503, -0.07392313, 2.843873, 0, 0.01568628, 1, 1,
0.353838, 0.3558467, 1.840201, 0, 0.01176471, 1, 1,
0.3556177, -0.6807225, 4.043301, 0, 0.003921569, 1, 1,
0.3574771, 1.378223, 0.1832815, 0.003921569, 0, 1, 1,
0.3585846, -1.400655, 1.043004, 0.007843138, 0, 1, 1,
0.3597009, -1.331362, 4.204565, 0.01568628, 0, 1, 1,
0.360658, -0.4208196, 2.569235, 0.01960784, 0, 1, 1,
0.3614123, 0.9786792, -1.671, 0.02745098, 0, 1, 1,
0.3635014, -0.02683417, 1.537459, 0.03137255, 0, 1, 1,
0.3642318, -1.017135, 3.298209, 0.03921569, 0, 1, 1,
0.3661068, -0.5645909, 1.837773, 0.04313726, 0, 1, 1,
0.3685721, 0.6418658, 1.932799, 0.05098039, 0, 1, 1,
0.3705316, 0.3609363, -0.2957486, 0.05490196, 0, 1, 1,
0.3745021, 0.5591852, -1.760398, 0.0627451, 0, 1, 1,
0.3753515, -0.1289032, 1.663245, 0.06666667, 0, 1, 1,
0.3810694, 0.2634034, 1.680987, 0.07450981, 0, 1, 1,
0.3860114, 0.760315, -0.1057822, 0.07843138, 0, 1, 1,
0.3910277, 0.6561479, -1.335772, 0.08627451, 0, 1, 1,
0.3958546, -0.9515798, 2.976689, 0.09019608, 0, 1, 1,
0.3960496, 1.47605, -0.8199033, 0.09803922, 0, 1, 1,
0.4004871, -1.026425, 2.47222, 0.1058824, 0, 1, 1,
0.4010542, 0.2632259, 0.5134534, 0.1098039, 0, 1, 1,
0.4046721, -1.136111, 3.28913, 0.1176471, 0, 1, 1,
0.407135, 0.7272496, 0.4409622, 0.1215686, 0, 1, 1,
0.4091255, -0.08530269, 0.3568586, 0.1294118, 0, 1, 1,
0.4102109, -2.833294, 3.135111, 0.1333333, 0, 1, 1,
0.4153774, -1.548542, 3.027081, 0.1411765, 0, 1, 1,
0.4244819, -1.956363, 2.738547, 0.145098, 0, 1, 1,
0.4263005, -0.2892819, 2.954098, 0.1529412, 0, 1, 1,
0.4296367, 1.365108, 0.05659253, 0.1568628, 0, 1, 1,
0.4312682, -0.02946232, 2.303766, 0.1647059, 0, 1, 1,
0.4400076, -0.1792905, 2.18356, 0.1686275, 0, 1, 1,
0.4408995, -1.57732, 3.606506, 0.1764706, 0, 1, 1,
0.4454964, -1.452065, 3.060601, 0.1803922, 0, 1, 1,
0.4511102, 0.7502779, -0.08247196, 0.1882353, 0, 1, 1,
0.4517224, 1.302838, -0.7490846, 0.1921569, 0, 1, 1,
0.4527712, -1.099668, 2.233776, 0.2, 0, 1, 1,
0.4532305, -0.3112136, 2.240949, 0.2078431, 0, 1, 1,
0.4540102, -0.5283681, 0.2004834, 0.2117647, 0, 1, 1,
0.45571, 0.7844375, 0.841671, 0.2196078, 0, 1, 1,
0.4604124, 1.181207, 0.4111306, 0.2235294, 0, 1, 1,
0.4613793, 0.1585744, 0.7001064, 0.2313726, 0, 1, 1,
0.4632516, 0.7815946, 2.124426, 0.2352941, 0, 1, 1,
0.4673694, 0.4038176, 0.1720921, 0.2431373, 0, 1, 1,
0.4686174, -0.6184844, 3.846903, 0.2470588, 0, 1, 1,
0.4699962, 1.397967, 0.3261563, 0.254902, 0, 1, 1,
0.4712614, -0.5859393, 3.301488, 0.2588235, 0, 1, 1,
0.4731811, 0.03815161, 1.987568, 0.2666667, 0, 1, 1,
0.4772161, -0.6664271, 2.161657, 0.2705882, 0, 1, 1,
0.4774727, 1.376962, -1.466145, 0.2784314, 0, 1, 1,
0.4786307, -0.07549613, 2.354309, 0.282353, 0, 1, 1,
0.4788354, -0.07937922, 2.38563, 0.2901961, 0, 1, 1,
0.4795892, -0.6281345, 2.750911, 0.2941177, 0, 1, 1,
0.47974, 1.77159, 0.1356989, 0.3019608, 0, 1, 1,
0.4805665, -0.9547339, 3.789777, 0.3098039, 0, 1, 1,
0.4810307, 1.695008, 0.7854298, 0.3137255, 0, 1, 1,
0.4810872, -1.074879, 2.682763, 0.3215686, 0, 1, 1,
0.485056, 0.8654731, 1.450223, 0.3254902, 0, 1, 1,
0.4858285, -0.8189163, 0.1074441, 0.3333333, 0, 1, 1,
0.4891739, 0.6768478, 0.4161377, 0.3372549, 0, 1, 1,
0.4893841, -2.078893, 5.067284, 0.345098, 0, 1, 1,
0.4893895, 0.4827065, 1.411152, 0.3490196, 0, 1, 1,
0.496502, 0.8167142, 2.103398, 0.3568628, 0, 1, 1,
0.4978741, 0.2285623, 0.4922811, 0.3607843, 0, 1, 1,
0.4979407, -0.4233266, 0.1321766, 0.3686275, 0, 1, 1,
0.5002266, 1.895144, -0.8703603, 0.372549, 0, 1, 1,
0.500946, 1.947978, 0.8570295, 0.3803922, 0, 1, 1,
0.5041362, -1.43161, 1.904997, 0.3843137, 0, 1, 1,
0.5095658, -0.2719891, 2.102389, 0.3921569, 0, 1, 1,
0.5109283, -0.256204, 1.469492, 0.3960784, 0, 1, 1,
0.514506, 0.2826922, 0.1260319, 0.4039216, 0, 1, 1,
0.5221579, -0.3656192, 2.745571, 0.4117647, 0, 1, 1,
0.5222613, 1.097818, -0.4420815, 0.4156863, 0, 1, 1,
0.5228057, 0.9303285, 1.949042, 0.4235294, 0, 1, 1,
0.5235136, -1.918138, 4.315857, 0.427451, 0, 1, 1,
0.5239158, -2.806376, 2.577852, 0.4352941, 0, 1, 1,
0.5262179, 1.972872, 2.018779, 0.4392157, 0, 1, 1,
0.5271518, -0.2459982, 0.9312784, 0.4470588, 0, 1, 1,
0.5287946, 1.356479, 0.3864263, 0.4509804, 0, 1, 1,
0.5288875, -1.226771, 2.883267, 0.4588235, 0, 1, 1,
0.532519, -2.893691, 1.774315, 0.4627451, 0, 1, 1,
0.53423, -0.5212145, 1.315114, 0.4705882, 0, 1, 1,
0.5390438, 0.5701337, 0.5290874, 0.4745098, 0, 1, 1,
0.539571, 1.497055, -1.548388, 0.4823529, 0, 1, 1,
0.5401435, -1.537242, 3.841474, 0.4862745, 0, 1, 1,
0.5435458, -0.602252, 1.941838, 0.4941176, 0, 1, 1,
0.5556898, 0.6827649, 1.991497, 0.5019608, 0, 1, 1,
0.5683419, -0.6736721, 1.473175, 0.5058824, 0, 1, 1,
0.5693828, -0.8586465, 2.947196, 0.5137255, 0, 1, 1,
0.5699434, -0.8252204, 2.977718, 0.5176471, 0, 1, 1,
0.5795905, 0.5832921, 1.262479, 0.5254902, 0, 1, 1,
0.5804564, -0.1144066, 3.121112, 0.5294118, 0, 1, 1,
0.5839095, 1.357073, 2.499266, 0.5372549, 0, 1, 1,
0.5843679, -0.3753103, 2.879454, 0.5411765, 0, 1, 1,
0.5921806, 0.3356045, 0.6179171, 0.5490196, 0, 1, 1,
0.592182, -1.310063, 2.53484, 0.5529412, 0, 1, 1,
0.592972, 0.9873529, 2.135383, 0.5607843, 0, 1, 1,
0.5961024, -0.3358078, 2.363132, 0.5647059, 0, 1, 1,
0.5971528, 2.662845, -1.423397, 0.572549, 0, 1, 1,
0.597542, 0.7782317, -0.4745798, 0.5764706, 0, 1, 1,
0.6036728, 0.4891144, 3.092275, 0.5843138, 0, 1, 1,
0.6057369, 1.151383, 0.04464869, 0.5882353, 0, 1, 1,
0.6261449, -2.381016, 3.388664, 0.5960785, 0, 1, 1,
0.6278499, 2.704576, -0.02888088, 0.6039216, 0, 1, 1,
0.6383638, 0.04806098, 1.919952, 0.6078432, 0, 1, 1,
0.6385977, -0.8449065, 2.592319, 0.6156863, 0, 1, 1,
0.6391113, 1.041689, 1.083641, 0.6196079, 0, 1, 1,
0.6392391, -2.400257, 4.674817, 0.627451, 0, 1, 1,
0.6418829, 0.8157891, 0.3872557, 0.6313726, 0, 1, 1,
0.641922, -0.8945737, 2.551739, 0.6392157, 0, 1, 1,
0.6473476, -0.3224725, 3.371017, 0.6431373, 0, 1, 1,
0.6518382, 1.344778, 1.042742, 0.6509804, 0, 1, 1,
0.6573358, -1.440579, 2.679688, 0.654902, 0, 1, 1,
0.6627705, 0.4021809, 1.214374, 0.6627451, 0, 1, 1,
0.663499, 1.310525, 2.823149, 0.6666667, 0, 1, 1,
0.6682209, 0.2043624, 1.19022, 0.6745098, 0, 1, 1,
0.6693175, -1.129186, 3.381839, 0.6784314, 0, 1, 1,
0.6700357, 0.6052588, -0.5661067, 0.6862745, 0, 1, 1,
0.6733695, 0.1468698, 2.668452, 0.6901961, 0, 1, 1,
0.6759074, 0.8281438, 2.096412, 0.6980392, 0, 1, 1,
0.6886522, -0.388839, 3.955292, 0.7058824, 0, 1, 1,
0.6887471, -0.6967428, 2.147956, 0.7098039, 0, 1, 1,
0.6890357, -1.633035, 2.215621, 0.7176471, 0, 1, 1,
0.6917533, 1.668055, -0.1561227, 0.7215686, 0, 1, 1,
0.6938742, 1.233982, 1.348869, 0.7294118, 0, 1, 1,
0.6953022, 0.2072397, 1.623664, 0.7333333, 0, 1, 1,
0.701411, -0.6787664, 0.8739202, 0.7411765, 0, 1, 1,
0.7036116, -0.3539949, 0.5547413, 0.7450981, 0, 1, 1,
0.7108762, -0.3154088, 1.385579, 0.7529412, 0, 1, 1,
0.7112693, 1.199921, 0.3730084, 0.7568628, 0, 1, 1,
0.714181, 1.103221, -0.1683567, 0.7647059, 0, 1, 1,
0.7163525, -0.2525775, 2.397593, 0.7686275, 0, 1, 1,
0.7168175, 0.3932811, 1.892191, 0.7764706, 0, 1, 1,
0.7241992, -1.723031, 2.093177, 0.7803922, 0, 1, 1,
0.7249266, 0.8736069, -0.666513, 0.7882353, 0, 1, 1,
0.738812, 0.3536018, 1.521772, 0.7921569, 0, 1, 1,
0.7450572, 2.027761, 0.1019638, 0.8, 0, 1, 1,
0.7501259, -0.5716799, 0.02314155, 0.8078431, 0, 1, 1,
0.7525442, 0.03477224, 2.319818, 0.8117647, 0, 1, 1,
0.757287, 0.166138, 1.301865, 0.8196079, 0, 1, 1,
0.760181, 1.174927, -0.3214883, 0.8235294, 0, 1, 1,
0.7602957, 1.199922, 1.79991, 0.8313726, 0, 1, 1,
0.7605485, 0.9455403, 0.05116669, 0.8352941, 0, 1, 1,
0.7629186, 1.719961, 1.49465, 0.8431373, 0, 1, 1,
0.7817923, 0.09826699, 0.5363126, 0.8470588, 0, 1, 1,
0.785073, 0.6416354, -0.01079097, 0.854902, 0, 1, 1,
0.7895657, 0.1771277, 0.5839134, 0.8588235, 0, 1, 1,
0.7897821, 0.1208398, 3.525224, 0.8666667, 0, 1, 1,
0.7962838, 0.05747642, 1.39823, 0.8705882, 0, 1, 1,
0.797949, -0.5254459, 2.954475, 0.8784314, 0, 1, 1,
0.8021257, -0.6524098, 0.7500492, 0.8823529, 0, 1, 1,
0.8036026, -1.438858, 2.738291, 0.8901961, 0, 1, 1,
0.8043667, 1.253613, -2.642769, 0.8941177, 0, 1, 1,
0.8059033, 0.4719999, 1.2924, 0.9019608, 0, 1, 1,
0.8073114, -0.5332023, 1.054641, 0.9098039, 0, 1, 1,
0.8110613, 0.2384323, 0.02738311, 0.9137255, 0, 1, 1,
0.8130631, -0.8400633, 2.566639, 0.9215686, 0, 1, 1,
0.8159922, 1.529321, 2.20923, 0.9254902, 0, 1, 1,
0.8164181, -1.374115, 0.8517659, 0.9333333, 0, 1, 1,
0.8189114, 0.7477016, 0.2307103, 0.9372549, 0, 1, 1,
0.8202295, -1.28919, 2.506078, 0.945098, 0, 1, 1,
0.8210331, -0.3012232, 0.5151162, 0.9490196, 0, 1, 1,
0.8231077, -2.68995, 3.270494, 0.9568627, 0, 1, 1,
0.8254716, -0.1529059, 2.139608, 0.9607843, 0, 1, 1,
0.8275926, 0.8308824, 0.02292079, 0.9686275, 0, 1, 1,
0.8299097, 0.5629215, 0.2023653, 0.972549, 0, 1, 1,
0.8373642, 0.01856067, 2.587828, 0.9803922, 0, 1, 1,
0.8391322, -0.6621355, 1.899239, 0.9843137, 0, 1, 1,
0.8491229, 0.6540955, 0.8331965, 0.9921569, 0, 1, 1,
0.8544507, -0.2744533, 2.407219, 0.9960784, 0, 1, 1,
0.8561794, 0.5009008, 1.986392, 1, 0, 0.9960784, 1,
0.8623542, 0.4878151, 2.452813, 1, 0, 0.9882353, 1,
0.8629645, 0.6460911, 1.03857, 1, 0, 0.9843137, 1,
0.8635949, 1.321489, -0.2716543, 1, 0, 0.9764706, 1,
0.8639484, -0.6648193, 0.9029448, 1, 0, 0.972549, 1,
0.8644481, 1.375632, 0.6806914, 1, 0, 0.9647059, 1,
0.8746923, 0.3273251, 2.046439, 1, 0, 0.9607843, 1,
0.8801292, 0.5175641, 1.389768, 1, 0, 0.9529412, 1,
0.8838981, -0.1155757, 0.5444949, 1, 0, 0.9490196, 1,
0.8872475, -0.5031186, -0.2819806, 1, 0, 0.9411765, 1,
0.8976463, 0.6143318, -0.1844777, 1, 0, 0.9372549, 1,
0.8978594, -2.077874, 3.247799, 1, 0, 0.9294118, 1,
0.9022914, -1.117694, 1.626238, 1, 0, 0.9254902, 1,
0.9082265, -0.4157549, 0.4666678, 1, 0, 0.9176471, 1,
0.9113876, 0.8765618, 0.5565464, 1, 0, 0.9137255, 1,
0.9183924, -1.708571, 2.170336, 1, 0, 0.9058824, 1,
0.9286959, -1.650724, 3.032533, 1, 0, 0.9019608, 1,
0.9423473, 1.238931, 0.9354607, 1, 0, 0.8941177, 1,
0.9459289, 0.1363105, 2.64008, 1, 0, 0.8862745, 1,
0.9530124, 0.9152169, 2.186527, 1, 0, 0.8823529, 1,
0.9651638, 0.4583681, 3.258252, 1, 0, 0.8745098, 1,
0.9746081, 0.004474981, 0.9328009, 1, 0, 0.8705882, 1,
0.9789345, -0.1725166, 3.488168, 1, 0, 0.8627451, 1,
0.9793857, 0.7442393, 0.3684114, 1, 0, 0.8588235, 1,
0.9840381, -0.9807702, 3.532475, 1, 0, 0.8509804, 1,
0.9847419, 0.006482688, 2.549939, 1, 0, 0.8470588, 1,
0.9851249, -0.8494027, 1.499152, 1, 0, 0.8392157, 1,
1.006083, -1.312439, 1.798647, 1, 0, 0.8352941, 1,
1.006152, 1.688417, 0.3393072, 1, 0, 0.827451, 1,
1.006887, -1.108449, 1.815205, 1, 0, 0.8235294, 1,
1.00978, -0.7072654, 1.88967, 1, 0, 0.8156863, 1,
1.010178, 0.8780556, 0.1310408, 1, 0, 0.8117647, 1,
1.011609, 0.8814374, 1.297257, 1, 0, 0.8039216, 1,
1.013983, -0.1758962, 1.93238, 1, 0, 0.7960784, 1,
1.016492, -0.5102946, 2.610868, 1, 0, 0.7921569, 1,
1.017509, -0.1010417, 3.153464, 1, 0, 0.7843137, 1,
1.019219, -0.9330342, 3.280358, 1, 0, 0.7803922, 1,
1.019632, -0.6686456, 2.375416, 1, 0, 0.772549, 1,
1.024286, -0.663622, 1.83499, 1, 0, 0.7686275, 1,
1.028122, 1.176457, 0.1607439, 1, 0, 0.7607843, 1,
1.030657, -0.2656548, 2.16134, 1, 0, 0.7568628, 1,
1.038079, -0.300887, 1.28027, 1, 0, 0.7490196, 1,
1.039925, -0.1153438, 2.187536, 1, 0, 0.7450981, 1,
1.042394, -0.5281113, 1.280088, 1, 0, 0.7372549, 1,
1.045505, 0.9755466, -1.367774, 1, 0, 0.7333333, 1,
1.046271, 0.4714016, 1.600848, 1, 0, 0.7254902, 1,
1.048216, 0.4111087, -0.008657668, 1, 0, 0.7215686, 1,
1.050666, -0.287403, 3.632987, 1, 0, 0.7137255, 1,
1.059462, -0.8826062, 2.708874, 1, 0, 0.7098039, 1,
1.069186, 0.1580195, 2.502285, 1, 0, 0.7019608, 1,
1.069451, -0.8869742, 2.355141, 1, 0, 0.6941177, 1,
1.077715, 0.03618373, 2.085481, 1, 0, 0.6901961, 1,
1.078447, 0.002626362, 0.9568419, 1, 0, 0.682353, 1,
1.088514, 1.005432, 0.05780262, 1, 0, 0.6784314, 1,
1.091357, 1.971642, 1.266266, 1, 0, 0.6705883, 1,
1.094924, -0.5627274, 3.61724, 1, 0, 0.6666667, 1,
1.100075, 0.444144, -0.02536186, 1, 0, 0.6588235, 1,
1.108216, -0.511322, 1.45226, 1, 0, 0.654902, 1,
1.115372, -1.988778, 1.467542, 1, 0, 0.6470588, 1,
1.116473, 1.19368, 0.06665396, 1, 0, 0.6431373, 1,
1.120907, -0.1269073, 0.08440761, 1, 0, 0.6352941, 1,
1.144453, 0.3177907, 2.116168, 1, 0, 0.6313726, 1,
1.147805, -0.9991779, 2.436788, 1, 0, 0.6235294, 1,
1.154649, 0.2597125, 0.1582266, 1, 0, 0.6196079, 1,
1.155231, 0.9721367, 2.967612, 1, 0, 0.6117647, 1,
1.160167, -0.150719, 0.6504393, 1, 0, 0.6078432, 1,
1.161643, -0.6198948, 0.5181317, 1, 0, 0.6, 1,
1.163612, 0.6405833, 3.050369, 1, 0, 0.5921569, 1,
1.171087, -0.6231601, 1.566651, 1, 0, 0.5882353, 1,
1.172703, -0.1002577, 3.149637, 1, 0, 0.5803922, 1,
1.181306, 2.197397, -0.5906439, 1, 0, 0.5764706, 1,
1.193435, -0.04031442, 2.201754, 1, 0, 0.5686275, 1,
1.199388, -1.35255, 3.570045, 1, 0, 0.5647059, 1,
1.199879, -0.9360991, 1.863172, 1, 0, 0.5568628, 1,
1.215037, 0.8832526, 0.6016493, 1, 0, 0.5529412, 1,
1.219413, 1.385537, -0.3476351, 1, 0, 0.5450981, 1,
1.22032, 0.2050226, -0.207507, 1, 0, 0.5411765, 1,
1.225322, 0.5278223, 1.741647, 1, 0, 0.5333334, 1,
1.229815, -1.764003, 3.506639, 1, 0, 0.5294118, 1,
1.230232, -1.722504, 1.637181, 1, 0, 0.5215687, 1,
1.231727, -0.7863662, 2.336699, 1, 0, 0.5176471, 1,
1.233512, 0.3861012, -0.2467205, 1, 0, 0.509804, 1,
1.249091, -0.8606787, 0.2917202, 1, 0, 0.5058824, 1,
1.254173, 0.3510357, 1.859316, 1, 0, 0.4980392, 1,
1.254343, -0.5795997, 2.829505, 1, 0, 0.4901961, 1,
1.254656, -0.9597097, 2.615, 1, 0, 0.4862745, 1,
1.256328, 0.9355799, 1.089404, 1, 0, 0.4784314, 1,
1.262873, 0.5369735, 0.2292267, 1, 0, 0.4745098, 1,
1.281957, 0.7054594, 1.703178, 1, 0, 0.4666667, 1,
1.295185, -1.133923, 2.534184, 1, 0, 0.4627451, 1,
1.3172, -0.7034009, 1.984825, 1, 0, 0.454902, 1,
1.318829, -0.0874076, 1.668648, 1, 0, 0.4509804, 1,
1.327416, -3.420699, 4.286627, 1, 0, 0.4431373, 1,
1.339802, -0.07916806, 0.5261632, 1, 0, 0.4392157, 1,
1.341237, -0.5129293, 0.5788298, 1, 0, 0.4313726, 1,
1.34154, -0.03233495, 2.836167, 1, 0, 0.427451, 1,
1.345267, -0.2789105, 3.34638, 1, 0, 0.4196078, 1,
1.353303, 0.5738956, 0.9267074, 1, 0, 0.4156863, 1,
1.360668, -0.927312, 0.55333, 1, 0, 0.4078431, 1,
1.376542, 1.52486, -0.2577549, 1, 0, 0.4039216, 1,
1.384085, 0.4020865, 3.019291, 1, 0, 0.3960784, 1,
1.392874, -0.6632237, 1.092519, 1, 0, 0.3882353, 1,
1.394232, -0.2956982, 3.160514, 1, 0, 0.3843137, 1,
1.440545, 2.276558, 1.174574, 1, 0, 0.3764706, 1,
1.46915, -1.218568, 0.9476765, 1, 0, 0.372549, 1,
1.491986, 0.655732, -0.01270092, 1, 0, 0.3647059, 1,
1.503958, 2.188695, -0.166984, 1, 0, 0.3607843, 1,
1.520457, -0.8705716, 2.001767, 1, 0, 0.3529412, 1,
1.521288, 2.096048, 1.689915, 1, 0, 0.3490196, 1,
1.522111, 1.726689, 2.12205, 1, 0, 0.3411765, 1,
1.522151, -1.047748, 2.676121, 1, 0, 0.3372549, 1,
1.5353, -0.3378153, 2.374078, 1, 0, 0.3294118, 1,
1.547351, -0.6565947, 1.398854, 1, 0, 0.3254902, 1,
1.554109, -1.078057, 2.071514, 1, 0, 0.3176471, 1,
1.566593, 0.558489, 1.006787, 1, 0, 0.3137255, 1,
1.576478, 1.429703, -0.07492182, 1, 0, 0.3058824, 1,
1.577965, 2.060087, 1.460505, 1, 0, 0.2980392, 1,
1.595293, -2.104376, 2.384298, 1, 0, 0.2941177, 1,
1.607204, -1.036106, 4.04026, 1, 0, 0.2862745, 1,
1.625112, -0.5461915, 1.832935, 1, 0, 0.282353, 1,
1.629647, -0.225041, 1.923099, 1, 0, 0.2745098, 1,
1.632456, 0.3244604, 2.295728, 1, 0, 0.2705882, 1,
1.635666, -0.2991849, 3.646567, 1, 0, 0.2627451, 1,
1.658979, -0.7265458, 2.834515, 1, 0, 0.2588235, 1,
1.666863, -0.134374, -0.2048402, 1, 0, 0.2509804, 1,
1.670876, 0.2376501, 2.096271, 1, 0, 0.2470588, 1,
1.677963, -0.1229796, 1.347151, 1, 0, 0.2392157, 1,
1.683179, -0.6794257, 1.440098, 1, 0, 0.2352941, 1,
1.709647, -1.124744, 1.127777, 1, 0, 0.227451, 1,
1.716708, -0.3778848, 2.243611, 1, 0, 0.2235294, 1,
1.741753, 0.6803671, 0.7174083, 1, 0, 0.2156863, 1,
1.753509, -3.272021, 3.16488, 1, 0, 0.2117647, 1,
1.763892, 0.06876165, 0.5708463, 1, 0, 0.2039216, 1,
1.776507, 0.541642, 0.2775627, 1, 0, 0.1960784, 1,
1.789155, -0.07661895, 3.18969, 1, 0, 0.1921569, 1,
1.808455, -0.2150663, 2.214324, 1, 0, 0.1843137, 1,
1.848215, -0.6076574, 1.709647, 1, 0, 0.1803922, 1,
1.86751, -0.1277092, 1.131693, 1, 0, 0.172549, 1,
1.868765, -1.408297, 3.331266, 1, 0, 0.1686275, 1,
1.882616, 0.1001816, 1.094681, 1, 0, 0.1607843, 1,
1.904354, -1.388724, 2.21645, 1, 0, 0.1568628, 1,
1.916195, -0.6134774, 1.500395, 1, 0, 0.1490196, 1,
1.929428, -0.1139434, 1.776314, 1, 0, 0.145098, 1,
1.947383, 0.8834938, 1.150291, 1, 0, 0.1372549, 1,
1.967909, -0.8744438, 1.626573, 1, 0, 0.1333333, 1,
1.974261, 0.7072795, 0.3968352, 1, 0, 0.1254902, 1,
1.979925, 0.1698632, 1.612839, 1, 0, 0.1215686, 1,
2.012076, 1.768805, 0.3554518, 1, 0, 0.1137255, 1,
2.02335, -1.027925, 2.11154, 1, 0, 0.1098039, 1,
2.026824, -0.9314214, 2.378783, 1, 0, 0.1019608, 1,
2.07591, 0.04868413, 1.051437, 1, 0, 0.09411765, 1,
2.078011, -1.007092, 2.300717, 1, 0, 0.09019608, 1,
2.11035, 0.5310499, 1.922308, 1, 0, 0.08235294, 1,
2.141746, -0.7791419, 1.802183, 1, 0, 0.07843138, 1,
2.18231, 1.17386, 0.4110971, 1, 0, 0.07058824, 1,
2.185371, -0.1907415, 2.580141, 1, 0, 0.06666667, 1,
2.199597, -1.063897, 2.349319, 1, 0, 0.05882353, 1,
2.200282, 0.3642503, 0.3048296, 1, 0, 0.05490196, 1,
2.220398, -1.338844, 0.3619075, 1, 0, 0.04705882, 1,
2.404347, -0.8984935, 3.678465, 1, 0, 0.04313726, 1,
2.443103, -1.123068, 1.521473, 1, 0, 0.03529412, 1,
2.522241, -1.05585, 1.870488, 1, 0, 0.03137255, 1,
2.532315, 1.138335, 0.7753653, 1, 0, 0.02352941, 1,
2.674521, -0.827723, -0.1293701, 1, 0, 0.01960784, 1,
2.824139, 1.66308, 1.212296, 1, 0, 0.01176471, 1,
3.207071, 1.346859, 2.930161, 1, 0, 0.007843138, 1
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
-0.02382779, -4.557445, -7.087282, 0, -0.5, 0.5, 0.5,
-0.02382779, -4.557445, -7.087282, 1, -0.5, 0.5, 0.5,
-0.02382779, -4.557445, -7.087282, 1, 1.5, 0.5, 0.5,
-0.02382779, -4.557445, -7.087282, 0, 1.5, 0.5, 0.5
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
-4.350001, -0.06746876, -7.087282, 0, -0.5, 0.5, 0.5,
-4.350001, -0.06746876, -7.087282, 1, -0.5, 0.5, 0.5,
-4.350001, -0.06746876, -7.087282, 1, 1.5, 0.5, 0.5,
-4.350001, -0.06746876, -7.087282, 0, 1.5, 0.5, 0.5
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
-4.350001, -4.557445, 0.1522822, 0, -0.5, 0.5, 0.5,
-4.350001, -4.557445, 0.1522822, 1, -0.5, 0.5, 0.5,
-4.350001, -4.557445, 0.1522822, 1, 1.5, 0.5, 0.5,
-4.350001, -4.557445, 0.1522822, 0, 1.5, 0.5, 0.5
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
-3, -3.521296, -5.416613,
3, -3.521296, -5.416613,
-3, -3.521296, -5.416613,
-3, -3.693988, -5.695058,
-2, -3.521296, -5.416613,
-2, -3.693988, -5.695058,
-1, -3.521296, -5.416613,
-1, -3.693988, -5.695058,
0, -3.521296, -5.416613,
0, -3.693988, -5.695058,
1, -3.521296, -5.416613,
1, -3.693988, -5.695058,
2, -3.521296, -5.416613,
2, -3.693988, -5.695058,
3, -3.521296, -5.416613,
3, -3.693988, -5.695058
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
-3, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
-3, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
-3, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
-3, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
-2, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
-2, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
-2, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
-2, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
-1, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
-1, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
-1, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
-1, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
0, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
0, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
0, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
0, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
1, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
1, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
1, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
1, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
2, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
2, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
2, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
2, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5,
3, -4.039371, -6.251947, 0, -0.5, 0.5, 0.5,
3, -4.039371, -6.251947, 1, -0.5, 0.5, 0.5,
3, -4.039371, -6.251947, 1, 1.5, 0.5, 0.5,
3, -4.039371, -6.251947, 0, 1.5, 0.5, 0.5
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
-3.351654, -3, -5.416613,
-3.351654, 3, -5.416613,
-3.351654, -3, -5.416613,
-3.518045, -3, -5.695058,
-3.351654, -2, -5.416613,
-3.518045, -2, -5.695058,
-3.351654, -1, -5.416613,
-3.518045, -1, -5.695058,
-3.351654, 0, -5.416613,
-3.518045, 0, -5.695058,
-3.351654, 1, -5.416613,
-3.518045, 1, -5.695058,
-3.351654, 2, -5.416613,
-3.518045, 2, -5.695058,
-3.351654, 3, -5.416613,
-3.518045, 3, -5.695058
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
-3.850827, -3, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, -3, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, -3, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, -3, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, -2, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, -2, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, -2, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, -2, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, -1, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, -1, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, -1, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, -1, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, 0, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, 0, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, 0, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, 0, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, 1, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, 1, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, 1, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, 1, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, 2, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, 2, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, 2, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, 2, -6.251947, 0, 1.5, 0.5, 0.5,
-3.850827, 3, -6.251947, 0, -0.5, 0.5, 0.5,
-3.850827, 3, -6.251947, 1, -0.5, 0.5, 0.5,
-3.850827, 3, -6.251947, 1, 1.5, 0.5, 0.5,
-3.850827, 3, -6.251947, 0, 1.5, 0.5, 0.5
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
-3.351654, -3.521296, -4,
-3.351654, -3.521296, 4,
-3.351654, -3.521296, -4,
-3.518045, -3.693988, -4,
-3.351654, -3.521296, -2,
-3.518045, -3.693988, -2,
-3.351654, -3.521296, 0,
-3.518045, -3.693988, 0,
-3.351654, -3.521296, 2,
-3.518045, -3.693988, 2,
-3.351654, -3.521296, 4,
-3.518045, -3.693988, 4
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
-3.850827, -4.039371, -4, 0, -0.5, 0.5, 0.5,
-3.850827, -4.039371, -4, 1, -0.5, 0.5, 0.5,
-3.850827, -4.039371, -4, 1, 1.5, 0.5, 0.5,
-3.850827, -4.039371, -4, 0, 1.5, 0.5, 0.5,
-3.850827, -4.039371, -2, 0, -0.5, 0.5, 0.5,
-3.850827, -4.039371, -2, 1, -0.5, 0.5, 0.5,
-3.850827, -4.039371, -2, 1, 1.5, 0.5, 0.5,
-3.850827, -4.039371, -2, 0, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 0, 0, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 0, 1, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 0, 1, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 0, 0, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 2, 0, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 2, 1, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 2, 1, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 2, 0, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 4, 0, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 4, 1, -0.5, 0.5, 0.5,
-3.850827, -4.039371, 4, 1, 1.5, 0.5, 0.5,
-3.850827, -4.039371, 4, 0, 1.5, 0.5, 0.5
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
-3.351654, -3.521296, -5.416613,
-3.351654, 3.386359, -5.416613,
-3.351654, -3.521296, 5.721178,
-3.351654, 3.386359, 5.721178,
-3.351654, -3.521296, -5.416613,
-3.351654, -3.521296, 5.721178,
-3.351654, 3.386359, -5.416613,
-3.351654, 3.386359, 5.721178,
-3.351654, -3.521296, -5.416613,
3.303998, -3.521296, -5.416613,
-3.351654, -3.521296, 5.721178,
3.303998, -3.521296, 5.721178,
-3.351654, 3.386359, -5.416613,
3.303998, 3.386359, -5.416613,
-3.351654, 3.386359, 5.721178,
3.303998, 3.386359, 5.721178,
3.303998, -3.521296, -5.416613,
3.303998, 3.386359, -5.416613,
3.303998, -3.521296, 5.721178,
3.303998, 3.386359, 5.721178,
3.303998, -3.521296, -5.416613,
3.303998, -3.521296, 5.721178,
3.303998, 3.386359, -5.416613,
3.303998, 3.386359, 5.721178
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
var radius = 7.849038;
var distance = 34.92126;
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
mvMatrix.translate( 0.02382779, 0.06746876, -0.1522822 );
mvMatrix.scale( 1.275087, 1.228569, 0.7619585 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92126);
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
Chlormequat_chloride<-read.table("Chlormequat_chloride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlormequat_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlormequat_chloride' not found
```

```r
y<-Chlormequat_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlormequat_chloride' not found
```

```r
z<-Chlormequat_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlormequat_chloride' not found
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
-3.254727, -0.6081257, -3.314504, 0, 0, 1, 1, 1,
-2.796791, -0.7558874, -2.914145, 1, 0, 0, 1, 1,
-2.724088, 1.660229, -0.7336465, 1, 0, 0, 1, 1,
-2.585685, -0.7811774, -3.941547, 1, 0, 0, 1, 1,
-2.539878, 0.7751793, -0.8970974, 1, 0, 0, 1, 1,
-2.456356, -0.1052141, -0.7683629, 1, 0, 0, 1, 1,
-2.438866, -0.5733402, -2.25642, 0, 0, 0, 1, 1,
-2.338183, -0.8249604, -1.538448, 0, 0, 0, 1, 1,
-2.335237, 0.9126605, -1.634605, 0, 0, 0, 1, 1,
-2.326379, 2.333843, -2.061308, 0, 0, 0, 1, 1,
-2.312744, -0.7902965, -1.180303, 0, 0, 0, 1, 1,
-2.304877, -1.907845, -1.802468, 0, 0, 0, 1, 1,
-2.277732, 1.562827, 0.2246201, 0, 0, 0, 1, 1,
-2.214515, -0.30861, -3.108464, 1, 1, 1, 1, 1,
-2.142541, -0.03162542, 1.869305, 1, 1, 1, 1, 1,
-2.085268, 0.5025856, -3.096073, 1, 1, 1, 1, 1,
-2.073484, -0.3118155, -2.529672, 1, 1, 1, 1, 1,
-2.029708, -0.9798607, -2.78704, 1, 1, 1, 1, 1,
-2.007435, 0.3260404, -1.283896, 1, 1, 1, 1, 1,
-2.007139, 0.5985728, -2.168796, 1, 1, 1, 1, 1,
-1.997835, 2.002396, 0.3574531, 1, 1, 1, 1, 1,
-1.992126, 0.7676923, -1.285076, 1, 1, 1, 1, 1,
-1.986747, -0.1237204, -0.8276259, 1, 1, 1, 1, 1,
-1.981123, -0.9033808, -2.781835, 1, 1, 1, 1, 1,
-1.976671, 0.00089142, -0.64379, 1, 1, 1, 1, 1,
-1.975063, 0.007314659, -0.7112169, 1, 1, 1, 1, 1,
-1.973452, -1.162792, -2.424595, 1, 1, 1, 1, 1,
-1.962474, 0.1694198, -1.121102, 1, 1, 1, 1, 1,
-1.939222, 0.6363187, -0.2307144, 0, 0, 1, 1, 1,
-1.938754, -0.1252461, -3.867815, 1, 0, 0, 1, 1,
-1.916789, 1.272979, -0.8653865, 1, 0, 0, 1, 1,
-1.91331, 0.4262861, -1.06096, 1, 0, 0, 1, 1,
-1.910669, 0.5008584, -0.4397315, 1, 0, 0, 1, 1,
-1.903662, 0.7922563, -0.2901692, 1, 0, 0, 1, 1,
-1.900738, -0.1196257, -3.300481, 0, 0, 0, 1, 1,
-1.900249, -1.796523, -2.25352, 0, 0, 0, 1, 1,
-1.898277, 0.06810499, -3.035884, 0, 0, 0, 1, 1,
-1.843102, -0.3620858, -2.949027, 0, 0, 0, 1, 1,
-1.830909, 0.1927719, -1.9076, 0, 0, 0, 1, 1,
-1.823457, 1.623183, -0.576885, 0, 0, 0, 1, 1,
-1.809829, -0.0240689, -0.8078501, 0, 0, 0, 1, 1,
-1.796372, -0.01749733, 1.119731, 1, 1, 1, 1, 1,
-1.791061, 2.608217, -0.5887863, 1, 1, 1, 1, 1,
-1.754222, -0.4903182, -2.122449, 1, 1, 1, 1, 1,
-1.751845, 0.05440808, -1.284494, 1, 1, 1, 1, 1,
-1.751503, 0.412315, -0.8322412, 1, 1, 1, 1, 1,
-1.749124, -0.4110232, -1.778691, 1, 1, 1, 1, 1,
-1.73738, 0.1887913, -1.052373, 1, 1, 1, 1, 1,
-1.729128, -1.201977, -2.516909, 1, 1, 1, 1, 1,
-1.693616, 1.242338, -1.591285, 1, 1, 1, 1, 1,
-1.670687, -0.329814, 0.004892007, 1, 1, 1, 1, 1,
-1.665603, 0.006515299, -1.432171, 1, 1, 1, 1, 1,
-1.658365, -1.557367, -2.667139, 1, 1, 1, 1, 1,
-1.645842, -0.786116, -3.663706, 1, 1, 1, 1, 1,
-1.639638, -0.05661548, -2.221582, 1, 1, 1, 1, 1,
-1.636921, 0.3438193, -1.572543, 1, 1, 1, 1, 1,
-1.622942, -1.007416, -2.020833, 0, 0, 1, 1, 1,
-1.607104, -2.238099, -2.374916, 1, 0, 0, 1, 1,
-1.579898, -0.8738531, -1.759709, 1, 0, 0, 1, 1,
-1.572254, -0.500048, -1.564924, 1, 0, 0, 1, 1,
-1.559015, 0.1005677, -1.884561, 1, 0, 0, 1, 1,
-1.556009, 0.9121752, -1.373684, 1, 0, 0, 1, 1,
-1.539323, -0.1589289, -2.263512, 0, 0, 0, 1, 1,
-1.52841, -0.1866183, -2.491812, 0, 0, 0, 1, 1,
-1.528055, -0.2906066, -3.069122, 0, 0, 0, 1, 1,
-1.52348, 0.06612014, -0.5583377, 0, 0, 0, 1, 1,
-1.523472, 1.115462, -5.034604, 0, 0, 0, 1, 1,
-1.493801, -0.6157496, -0.4130225, 0, 0, 0, 1, 1,
-1.4903, 0.1560581, -1.95956, 0, 0, 0, 1, 1,
-1.490115, -1.331901, -2.500991, 1, 1, 1, 1, 1,
-1.489149, 0.6541395, 1.30226, 1, 1, 1, 1, 1,
-1.488749, 0.6901357, -1.392779, 1, 1, 1, 1, 1,
-1.488468, -2.694006, -2.024706, 1, 1, 1, 1, 1,
-1.480698, -0.657205, -0.7866009, 1, 1, 1, 1, 1,
-1.458991, 2.252246, -1.829774, 1, 1, 1, 1, 1,
-1.458925, 1.68456, -1.131893, 1, 1, 1, 1, 1,
-1.458421, -0.6029275, -2.119632, 1, 1, 1, 1, 1,
-1.457808, -0.5330681, -1.03164, 1, 1, 1, 1, 1,
-1.454616, -1.073, -2.151944, 1, 1, 1, 1, 1,
-1.450469, 0.6444232, -2.385643, 1, 1, 1, 1, 1,
-1.438269, -0.1317713, -2.33901, 1, 1, 1, 1, 1,
-1.435012, -0.508495, -2.37363, 1, 1, 1, 1, 1,
-1.429545, -1.157255, -1.718527, 1, 1, 1, 1, 1,
-1.4182, -0.4645174, -0.9947463, 1, 1, 1, 1, 1,
-1.400025, 0.09189118, -1.677608, 0, 0, 1, 1, 1,
-1.397949, -1.526403, -2.431067, 1, 0, 0, 1, 1,
-1.397868, 0.5772009, -1.647363, 1, 0, 0, 1, 1,
-1.394873, -0.7144557, -3.204472, 1, 0, 0, 1, 1,
-1.383067, -0.3768389, -0.9737567, 1, 0, 0, 1, 1,
-1.37844, -0.1186729, -1.091769, 1, 0, 0, 1, 1,
-1.371646, -0.4832097, -1.544899, 0, 0, 0, 1, 1,
-1.370315, 0.5576295, 1.684065, 0, 0, 0, 1, 1,
-1.362418, -0.2178199, -1.340778, 0, 0, 0, 1, 1,
-1.348606, -0.6581079, -0.9216475, 0, 0, 0, 1, 1,
-1.346217, -0.3662376, -3.83948, 0, 0, 0, 1, 1,
-1.346192, -0.03780784, -1.894658, 0, 0, 0, 1, 1,
-1.339721, -2.472726, -3.000423, 0, 0, 0, 1, 1,
-1.339503, 0.9944543, -1.510099, 1, 1, 1, 1, 1,
-1.328305, -1.542918, -1.711984, 1, 1, 1, 1, 1,
-1.318715, -0.06967081, -1.634746, 1, 1, 1, 1, 1,
-1.309224, -0.149258, -1.354679, 1, 1, 1, 1, 1,
-1.303488, 0.5643395, -1.112266, 1, 1, 1, 1, 1,
-1.302875, -1.510971, -3.701869, 1, 1, 1, 1, 1,
-1.301366, 1.143144, 0.3045099, 1, 1, 1, 1, 1,
-1.29767, -0.4054545, -2.143382, 1, 1, 1, 1, 1,
-1.296592, 1.081999, -0.08804198, 1, 1, 1, 1, 1,
-1.291535, -0.5530456, -1.049395, 1, 1, 1, 1, 1,
-1.291301, -0.03940471, -1.690843, 1, 1, 1, 1, 1,
-1.287713, -1.804713, -2.961692, 1, 1, 1, 1, 1,
-1.283254, -0.3946065, -2.431537, 1, 1, 1, 1, 1,
-1.279543, -1.312771, -2.711023, 1, 1, 1, 1, 1,
-1.278425, 0.2016237, -1.004254, 1, 1, 1, 1, 1,
-1.26479, 1.355924, -0.2372606, 0, 0, 1, 1, 1,
-1.259386, 1.549204, 0.1945613, 1, 0, 0, 1, 1,
-1.257196, -1.667115, -2.887216, 1, 0, 0, 1, 1,
-1.253932, -0.2584046, -3.525805, 1, 0, 0, 1, 1,
-1.250934, 0.312938, -2.67386, 1, 0, 0, 1, 1,
-1.250475, -0.4426636, -2.175198, 1, 0, 0, 1, 1,
-1.247778, -0.5428229, -2.798537, 0, 0, 0, 1, 1,
-1.247329, -0.3937268, -2.969707, 0, 0, 0, 1, 1,
-1.245343, 0.2167547, -1.206029, 0, 0, 0, 1, 1,
-1.244404, 0.4097795, -2.881871, 0, 0, 0, 1, 1,
-1.231542, 2.192738, -0.01025556, 0, 0, 0, 1, 1,
-1.226838, -0.2352538, -1.245981, 0, 0, 0, 1, 1,
-1.224484, -0.5649295, -0.7407192, 0, 0, 0, 1, 1,
-1.204416, -1.040329, -2.921658, 1, 1, 1, 1, 1,
-1.186018, -0.3496373, -0.3556454, 1, 1, 1, 1, 1,
-1.178638, 0.01585432, -1.818921, 1, 1, 1, 1, 1,
-1.175763, -0.8034583, -2.578021, 1, 1, 1, 1, 1,
-1.175451, -0.7357276, -2.599332, 1, 1, 1, 1, 1,
-1.175126, -0.3829654, -0.9497703, 1, 1, 1, 1, 1,
-1.156801, -1.521089, -1.559988, 1, 1, 1, 1, 1,
-1.154083, -0.04398325, -2.078975, 1, 1, 1, 1, 1,
-1.146464, -1.384379, -1.581779, 1, 1, 1, 1, 1,
-1.140719, -0.4467532, -2.242202, 1, 1, 1, 1, 1,
-1.135029, -0.4872148, -2.472594, 1, 1, 1, 1, 1,
-1.129839, 0.09221569, -1.369257, 1, 1, 1, 1, 1,
-1.122142, 0.4596241, -0.3593341, 1, 1, 1, 1, 1,
-1.117198, 0.877331, -0.1890846, 1, 1, 1, 1, 1,
-1.103603, -1.097386, -2.74759, 1, 1, 1, 1, 1,
-1.103169, -0.6377038, -3.01308, 0, 0, 1, 1, 1,
-1.102759, 0.2303573, -0.2801241, 1, 0, 0, 1, 1,
-1.101547, -1.394332, -2.244342, 1, 0, 0, 1, 1,
-1.094913, 1.64239, 1.228882, 1, 0, 0, 1, 1,
-1.093979, -0.4812305, -2.838027, 1, 0, 0, 1, 1,
-1.085613, -0.6452163, -2.724995, 1, 0, 0, 1, 1,
-1.081824, -0.6934218, -2.759786, 0, 0, 0, 1, 1,
-1.075261, 0.7394353, -0.8110625, 0, 0, 0, 1, 1,
-1.074909, -2.133019, -1.861718, 0, 0, 0, 1, 1,
-1.074348, 0.1192698, -0.3119745, 0, 0, 0, 1, 1,
-1.07367, 1.60168, -0.7122396, 0, 0, 0, 1, 1,
-1.06548, 0.9751289, -0.4947, 0, 0, 0, 1, 1,
-1.062567, 0.2025978, -2.044052, 0, 0, 0, 1, 1,
-1.058053, 2.37171, -1.111153, 1, 1, 1, 1, 1,
-1.05282, 0.3094233, -0.8620661, 1, 1, 1, 1, 1,
-1.052065, -0.06468368, -1.41836, 1, 1, 1, 1, 1,
-1.049639, -1.076441, -2.276165, 1, 1, 1, 1, 1,
-1.034648, 0.5954016, -1.860741, 1, 1, 1, 1, 1,
-1.033171, 0.09220185, -4.282261, 1, 1, 1, 1, 1,
-1.019065, -0.162295, -1.461222, 1, 1, 1, 1, 1,
-1.017272, 0.6137972, -0.4778227, 1, 1, 1, 1, 1,
-1.013513, -0.6829658, -1.070257, 1, 1, 1, 1, 1,
-1.007375, 0.5289615, 0.9396039, 1, 1, 1, 1, 1,
-1.004163, 1.702678, 0.429123, 1, 1, 1, 1, 1,
-1.002963, 0.8191072, 1.421857, 1, 1, 1, 1, 1,
-0.9974504, 0.5999816, -1.154477, 1, 1, 1, 1, 1,
-0.9910332, 0.7250661, -0.939005, 1, 1, 1, 1, 1,
-0.9858894, -0.08484277, -2.103387, 1, 1, 1, 1, 1,
-0.9837199, -1.553566, -2.789609, 0, 0, 1, 1, 1,
-0.9791099, -0.5501752, -0.8749481, 1, 0, 0, 1, 1,
-0.9747137, 1.539103, 0.6219057, 1, 0, 0, 1, 1,
-0.9714466, 1.578823, -0.8422987, 1, 0, 0, 1, 1,
-0.9699395, -0.9741573, -2.219134, 1, 0, 0, 1, 1,
-0.9694416, 0.4860118, 0.4643792, 1, 0, 0, 1, 1,
-0.9689968, -1.627959, -2.493798, 0, 0, 0, 1, 1,
-0.962163, 0.4572487, -2.404517, 0, 0, 0, 1, 1,
-0.9555795, 1.78741, -1.602185, 0, 0, 0, 1, 1,
-0.9538836, -0.7747983, -2.515003, 0, 0, 0, 1, 1,
-0.9524401, -0.0188304, -2.558265, 0, 0, 0, 1, 1,
-0.9516382, -1.499759, -1.145746, 0, 0, 0, 1, 1,
-0.9462215, 0.5680094, -0.3514401, 0, 0, 0, 1, 1,
-0.9381385, -0.1923792, -0.7085597, 1, 1, 1, 1, 1,
-0.935077, 1.227109, 0.01114578, 1, 1, 1, 1, 1,
-0.9340245, 1.285326, -1.257666, 1, 1, 1, 1, 1,
-0.9334871, -1.646703, -2.409372, 1, 1, 1, 1, 1,
-0.9311455, 1.512461, 0.5635097, 1, 1, 1, 1, 1,
-0.925105, 0.845952, -2.063953, 1, 1, 1, 1, 1,
-0.9247046, -1.491536, -2.26702, 1, 1, 1, 1, 1,
-0.9225523, -0.188524, -2.012912, 1, 1, 1, 1, 1,
-0.9218407, -0.2317355, -2.182459, 1, 1, 1, 1, 1,
-0.9178494, 0.6993554, -0.4190555, 1, 1, 1, 1, 1,
-0.915232, -0.4267081, -4.543833, 1, 1, 1, 1, 1,
-0.9124421, 0.03530251, -1.39397, 1, 1, 1, 1, 1,
-0.9114508, 0.7797379, -1.182163, 1, 1, 1, 1, 1,
-0.9108815, 0.1151377, -1.494232, 1, 1, 1, 1, 1,
-0.9061627, -1.44814, -2.445388, 1, 1, 1, 1, 1,
-0.9058196, 1.095314, -1.526324, 0, 0, 1, 1, 1,
-0.9036627, -0.9615797, -2.835938, 1, 0, 0, 1, 1,
-0.9035727, 0.9145523, -1.361973, 1, 0, 0, 1, 1,
-0.9034929, -0.6149325, -2.658141, 1, 0, 0, 1, 1,
-0.9033365, 2.063294, 0.2842468, 1, 0, 0, 1, 1,
-0.9015747, -0.8614462, -1.747178, 1, 0, 0, 1, 1,
-0.8961634, -0.8524654, -3.558874, 0, 0, 0, 1, 1,
-0.8951607, 0.6151944, -0.4998513, 0, 0, 0, 1, 1,
-0.8915662, -0.6742048, -0.5328754, 0, 0, 0, 1, 1,
-0.8915502, 0.488445, -0.4421726, 0, 0, 0, 1, 1,
-0.8776774, 0.5046176, -0.3235987, 0, 0, 0, 1, 1,
-0.8737319, -0.2030321, -1.833417, 0, 0, 0, 1, 1,
-0.8715736, -0.8395407, -1.97978, 0, 0, 0, 1, 1,
-0.8709594, -1.358293, -1.607207, 1, 1, 1, 1, 1,
-0.8601325, -0.3197538, -1.059573, 1, 1, 1, 1, 1,
-0.8574831, 1.644971, -1.867269, 1, 1, 1, 1, 1,
-0.8509625, -1.040083, -0.8065882, 1, 1, 1, 1, 1,
-0.8463003, -1.011787, -1.554125, 1, 1, 1, 1, 1,
-0.846298, 0.6228678, 0.08721887, 1, 1, 1, 1, 1,
-0.8444049, -0.59247, -2.586851, 1, 1, 1, 1, 1,
-0.8402935, -0.3077003, -1.780961, 1, 1, 1, 1, 1,
-0.8293841, -1.155288, -1.897953, 1, 1, 1, 1, 1,
-0.829029, -1.150597, -3.811906, 1, 1, 1, 1, 1,
-0.8210953, 1.01331, -0.8050219, 1, 1, 1, 1, 1,
-0.8169926, -0.2847047, -4.538053, 1, 1, 1, 1, 1,
-0.8133598, -0.115343, -1.163391, 1, 1, 1, 1, 1,
-0.8099609, -0.04595967, -1.353638, 1, 1, 1, 1, 1,
-0.8045416, 0.9411134, -0.05717256, 1, 1, 1, 1, 1,
-0.7997271, -1.529096, -3.522624, 0, 0, 1, 1, 1,
-0.7987451, -0.1474467, -1.033696, 1, 0, 0, 1, 1,
-0.7982419, 0.6255199, -1.321907, 1, 0, 0, 1, 1,
-0.7971377, -0.5336379, -2.335248, 1, 0, 0, 1, 1,
-0.7953671, 0.2391423, -2.726023, 1, 0, 0, 1, 1,
-0.7930621, -0.4351275, -2.546022, 1, 0, 0, 1, 1,
-0.787036, -0.5795521, -2.934844, 0, 0, 0, 1, 1,
-0.7827112, -0.7157605, -1.419862, 0, 0, 0, 1, 1,
-0.7790984, -0.7282398, -1.585351, 0, 0, 0, 1, 1,
-0.7758845, -1.09168, -2.388016, 0, 0, 0, 1, 1,
-0.7715072, -0.2960484, -3.119799, 0, 0, 0, 1, 1,
-0.77123, -0.4510626, -0.8468586, 0, 0, 0, 1, 1,
-0.7576066, 0.2380198, -1.83761, 0, 0, 0, 1, 1,
-0.7571474, -0.6371269, -1.909918, 1, 1, 1, 1, 1,
-0.7538857, -0.7583274, -3.544889, 1, 1, 1, 1, 1,
-0.7510777, -2.754885, -2.114498, 1, 1, 1, 1, 1,
-0.7479724, -0.4225414, -1.733544, 1, 1, 1, 1, 1,
-0.7431127, -1.280457, -1.545345, 1, 1, 1, 1, 1,
-0.7376087, 0.3104467, -1.187449, 1, 1, 1, 1, 1,
-0.7306213, 0.2300678, -0.9386796, 1, 1, 1, 1, 1,
-0.7306027, 1.273367, 0.7080078, 1, 1, 1, 1, 1,
-0.7293207, 1.146358, -0.005686835, 1, 1, 1, 1, 1,
-0.7251531, -0.5370156, -1.527325, 1, 1, 1, 1, 1,
-0.7231224, 1.0329, -0.714412, 1, 1, 1, 1, 1,
-0.7201057, 0.3202679, -0.7604988, 1, 1, 1, 1, 1,
-0.7180054, -1.232125, -1.986777, 1, 1, 1, 1, 1,
-0.713352, 1.482491, 0.8844725, 1, 1, 1, 1, 1,
-0.7118759, -1.863935, -2.698737, 1, 1, 1, 1, 1,
-0.7105325, -0.6945999, -3.420936, 0, 0, 1, 1, 1,
-0.7086479, -0.9747753, -1.53871, 1, 0, 0, 1, 1,
-0.7051554, 0.461574, -1.959719, 1, 0, 0, 1, 1,
-0.6984148, -0.07438254, -2.209069, 1, 0, 0, 1, 1,
-0.6983052, 0.5735462, 0.05163443, 1, 0, 0, 1, 1,
-0.6979792, -1.092135, -2.495492, 1, 0, 0, 1, 1,
-0.6957635, -0.05409367, -0.8808391, 0, 0, 0, 1, 1,
-0.6950219, 1.159613, -0.0438991, 0, 0, 0, 1, 1,
-0.6943247, 0.6681471, 0.7892951, 0, 0, 0, 1, 1,
-0.6898689, 0.8303258, 1.273016, 0, 0, 0, 1, 1,
-0.6893056, 0.7971378, 0.8704196, 0, 0, 0, 1, 1,
-0.677009, 0.02515693, -1.933, 0, 0, 0, 1, 1,
-0.6754007, 0.4918748, 1.041174, 0, 0, 0, 1, 1,
-0.6728647, 0.4157513, -0.8886762, 1, 1, 1, 1, 1,
-0.6655645, -0.5945662, -2.054574, 1, 1, 1, 1, 1,
-0.6646543, -1.321563, -2.55049, 1, 1, 1, 1, 1,
-0.6642419, -0.5393168, -3.381577, 1, 1, 1, 1, 1,
-0.6631395, 0.2650841, -0.1793097, 1, 1, 1, 1, 1,
-0.6578676, -0.7574576, -1.150159, 1, 1, 1, 1, 1,
-0.6535631, -0.05717031, -0.7145084, 1, 1, 1, 1, 1,
-0.6483852, 1.425398, -0.6110993, 1, 1, 1, 1, 1,
-0.6447666, 0.568533, -0.3126029, 1, 1, 1, 1, 1,
-0.6446431, -0.4123103, -1.5206, 1, 1, 1, 1, 1,
-0.6416894, -0.3701977, -1.194948, 1, 1, 1, 1, 1,
-0.6367314, -0.1866001, -2.499417, 1, 1, 1, 1, 1,
-0.632091, 2.307402, -0.5969744, 1, 1, 1, 1, 1,
-0.6315069, -0.9506314, -4.672157, 1, 1, 1, 1, 1,
-0.6266852, -1.111518, -2.89475, 1, 1, 1, 1, 1,
-0.6263652, -0.1517683, -2.50155, 0, 0, 1, 1, 1,
-0.6249252, -0.1725514, -0.6921765, 1, 0, 0, 1, 1,
-0.6240744, 0.09225589, -2.198679, 1, 0, 0, 1, 1,
-0.6213692, 0.9926236, -3.139035, 1, 0, 0, 1, 1,
-0.6180184, -1.834114, -4.01013, 1, 0, 0, 1, 1,
-0.617911, -0.5447236, -2.718852, 1, 0, 0, 1, 1,
-0.6167663, 1.465487, -1.711749, 0, 0, 0, 1, 1,
-0.614453, -0.4735631, -0.7099334, 0, 0, 0, 1, 1,
-0.6124071, 0.7743811, -0.9940609, 0, 0, 0, 1, 1,
-0.6094717, 0.2001874, -1.057546, 0, 0, 0, 1, 1,
-0.6085947, 0.3373215, -1.608975, 0, 0, 0, 1, 1,
-0.6083291, 3.285762, 0.3819028, 0, 0, 0, 1, 1,
-0.5987609, -1.002856, -2.442383, 0, 0, 0, 1, 1,
-0.5958717, -0.5241309, -1.335191, 1, 1, 1, 1, 1,
-0.5912833, -0.03857967, -0.8590623, 1, 1, 1, 1, 1,
-0.5905783, 1.002772, -0.976358, 1, 1, 1, 1, 1,
-0.5859351, 0.6999282, -2.037634, 1, 1, 1, 1, 1,
-0.5857719, -0.420004, -2.859188, 1, 1, 1, 1, 1,
-0.5832371, 0.3950191, -2.414553, 1, 1, 1, 1, 1,
-0.5809075, 0.04923553, -1.396207, 1, 1, 1, 1, 1,
-0.5794094, -1.23091, -4.068139, 1, 1, 1, 1, 1,
-0.5792115, -0.6343201, -2.603287, 1, 1, 1, 1, 1,
-0.574739, -0.2155205, -3.155504, 1, 1, 1, 1, 1,
-0.5744436, -0.4200712, -1.326591, 1, 1, 1, 1, 1,
-0.5724892, 2.306753, -0.642207, 1, 1, 1, 1, 1,
-0.5723678, 1.484731, 0.7363637, 1, 1, 1, 1, 1,
-0.5680547, -0.3902731, -1.359024, 1, 1, 1, 1, 1,
-0.5677956, -1.197825, -2.727353, 1, 1, 1, 1, 1,
-0.5627175, -0.8509396, -4.082235, 0, 0, 1, 1, 1,
-0.5603335, 2.75889, -0.7312847, 1, 0, 0, 1, 1,
-0.5569958, -0.8025302, -2.398314, 1, 0, 0, 1, 1,
-0.5558891, 0.172409, -2.754615, 1, 0, 0, 1, 1,
-0.5540303, 1.074184, -0.3035439, 1, 0, 0, 1, 1,
-0.5500266, -0.03755299, -0.7610655, 1, 0, 0, 1, 1,
-0.549983, -1.281582, -2.172644, 0, 0, 0, 1, 1,
-0.5475587, -0.8259215, -3.150534, 0, 0, 0, 1, 1,
-0.5463669, -1.595188, -2.006517, 0, 0, 0, 1, 1,
-0.5439326, 1.460643, -0.4969171, 0, 0, 0, 1, 1,
-0.5410461, 0.6161823, 0.2409995, 0, 0, 0, 1, 1,
-0.5399317, -0.009307517, -1.827815, 0, 0, 0, 1, 1,
-0.5394343, -1.175516, -5.254412, 0, 0, 0, 1, 1,
-0.5333225, -0.5537419, -2.504668, 1, 1, 1, 1, 1,
-0.5288447, -0.0602241, -1.213425, 1, 1, 1, 1, 1,
-0.527256, -2.058797, -3.455512, 1, 1, 1, 1, 1,
-0.5257018, -1.122201, -2.971401, 1, 1, 1, 1, 1,
-0.5212796, -0.9135587, -0.3248025, 1, 1, 1, 1, 1,
-0.5176557, -0.1872149, -3.250152, 1, 1, 1, 1, 1,
-0.5170362, -0.6981468, -0.8615263, 1, 1, 1, 1, 1,
-0.5079523, -0.8814916, -1.99808, 1, 1, 1, 1, 1,
-0.5058587, 1.113248, -0.08868203, 1, 1, 1, 1, 1,
-0.5031498, -1.525349, -1.865685, 1, 1, 1, 1, 1,
-0.5026853, 1.145726, -0.9265021, 1, 1, 1, 1, 1,
-0.5013662, 1.532304, -1.134879, 1, 1, 1, 1, 1,
-0.5002717, 0.8093292, -0.1399126, 1, 1, 1, 1, 1,
-0.4995454, -0.2446128, -2.65996, 1, 1, 1, 1, 1,
-0.4994523, -1.705645, -2.95112, 1, 1, 1, 1, 1,
-0.4981636, -0.7793558, -0.9690861, 0, 0, 1, 1, 1,
-0.4962341, -0.3526257, -3.302547, 1, 0, 0, 1, 1,
-0.493332, -1.405693, -1.104323, 1, 0, 0, 1, 1,
-0.4821133, -0.1083466, -1.948366, 1, 0, 0, 1, 1,
-0.4764376, -1.615375, -4.611981, 1, 0, 0, 1, 1,
-0.474446, -0.07082235, -1.284394, 1, 0, 0, 1, 1,
-0.4734911, -0.6339422, -2.28684, 0, 0, 0, 1, 1,
-0.4734634, -1.184116, -2.42532, 0, 0, 0, 1, 1,
-0.4675638, 0.1796133, -2.02306, 0, 0, 0, 1, 1,
-0.4666972, -0.8108958, -1.388512, 0, 0, 0, 1, 1,
-0.4645126, 0.7197879, -1.995882, 0, 0, 0, 1, 1,
-0.4610765, 1.284093, -0.4448639, 0, 0, 0, 1, 1,
-0.4610345, -2.294843, -4.165063, 0, 0, 0, 1, 1,
-0.4578843, -0.03699729, -1.819051, 1, 1, 1, 1, 1,
-0.456405, -0.8662159, -2.098757, 1, 1, 1, 1, 1,
-0.4522445, 0.829193, -0.9966708, 1, 1, 1, 1, 1,
-0.4459258, -0.4576772, -1.809731, 1, 1, 1, 1, 1,
-0.4457311, 0.1952404, -3.043078, 1, 1, 1, 1, 1,
-0.4451185, 0.8968662, 0.7456759, 1, 1, 1, 1, 1,
-0.4436626, -0.2988826, -1.338842, 1, 1, 1, 1, 1,
-0.4391634, -0.1018093, -0.512055, 1, 1, 1, 1, 1,
-0.4380747, -0.4946743, -2.209223, 1, 1, 1, 1, 1,
-0.4284979, -0.3214802, -3.054416, 1, 1, 1, 1, 1,
-0.4283031, -0.7408315, -3.738046, 1, 1, 1, 1, 1,
-0.4239906, 0.1531048, -1.676353, 1, 1, 1, 1, 1,
-0.4212741, 0.06512934, -1.782568, 1, 1, 1, 1, 1,
-0.4195166, -0.7896213, -3.643727, 1, 1, 1, 1, 1,
-0.4178726, 0.1281676, -0.2123143, 1, 1, 1, 1, 1,
-0.4147559, 1.503933, 2.080982, 0, 0, 1, 1, 1,
-0.4142295, -0.144966, -3.029569, 1, 0, 0, 1, 1,
-0.4128637, 0.7771832, -1.73813, 1, 0, 0, 1, 1,
-0.4102069, -1.059721, -3.03762, 1, 0, 0, 1, 1,
-0.4082629, -0.4443814, -1.951995, 1, 0, 0, 1, 1,
-0.4056612, 0.4665837, 0.09144179, 1, 0, 0, 1, 1,
-0.4051959, 0.6558307, 0.6354964, 0, 0, 0, 1, 1,
-0.3998813, 1.620098, -1.592091, 0, 0, 0, 1, 1,
-0.3893207, -0.5379929, -2.971932, 0, 0, 0, 1, 1,
-0.3865043, 1.81742, 0.1895126, 0, 0, 0, 1, 1,
-0.3845398, -1.414588, -4.448014, 0, 0, 0, 1, 1,
-0.3839504, -0.8628627, -2.466208, 0, 0, 0, 1, 1,
-0.3795872, -0.1789946, -0.508697, 0, 0, 0, 1, 1,
-0.3775794, 0.8628474, 0.6737642, 1, 1, 1, 1, 1,
-0.373078, -0.295759, -1.679068, 1, 1, 1, 1, 1,
-0.3721137, -0.08894914, -0.634351, 1, 1, 1, 1, 1,
-0.3658398, -0.2896153, -1.85482, 1, 1, 1, 1, 1,
-0.3627062, -0.1695229, -2.187844, 1, 1, 1, 1, 1,
-0.3623026, -1.134355, -2.767243, 1, 1, 1, 1, 1,
-0.3611827, 1.112391, 0.8243266, 1, 1, 1, 1, 1,
-0.359595, -0.3133531, -1.133459, 1, 1, 1, 1, 1,
-0.3592799, -1.748788, -3.650444, 1, 1, 1, 1, 1,
-0.356623, -0.7711294, -2.290554, 1, 1, 1, 1, 1,
-0.3552457, 0.2480051, -0.1000673, 1, 1, 1, 1, 1,
-0.3549693, -1.021192, -2.507932, 1, 1, 1, 1, 1,
-0.3513571, 0.3285292, -1.001079, 1, 1, 1, 1, 1,
-0.3500269, -0.1453627, -3.59854, 1, 1, 1, 1, 1,
-0.3489413, -0.80778, -2.68119, 1, 1, 1, 1, 1,
-0.3374926, 0.5147609, -0.4113182, 0, 0, 1, 1, 1,
-0.333486, -0.5828809, -2.812074, 1, 0, 0, 1, 1,
-0.3265955, 0.1645391, -1.14317, 1, 0, 0, 1, 1,
-0.3265181, 0.2102837, -0.1385108, 1, 0, 0, 1, 1,
-0.3251575, -0.7965823, -3.638326, 1, 0, 0, 1, 1,
-0.3123581, 0.3585762, 1.838863, 1, 0, 0, 1, 1,
-0.3078448, 0.4045038, -0.3055314, 0, 0, 0, 1, 1,
-0.3052958, -2.211536, -0.9856458, 0, 0, 0, 1, 1,
-0.3001652, -1.065098, -4.358105, 0, 0, 0, 1, 1,
-0.2999619, 0.3138428, -2.131519, 0, 0, 0, 1, 1,
-0.2947937, 1.524229, 0.2705202, 0, 0, 0, 1, 1,
-0.2898196, 1.987381, -1.135145, 0, 0, 0, 1, 1,
-0.2839141, -0.6512123, -2.33123, 0, 0, 0, 1, 1,
-0.2783736, -0.4589789, -1.857594, 1, 1, 1, 1, 1,
-0.276648, -0.4937802, -4.551169, 1, 1, 1, 1, 1,
-0.2702624, 0.6011986, -0.5256097, 1, 1, 1, 1, 1,
-0.2656912, -0.1854518, -0.1774613, 1, 1, 1, 1, 1,
-0.2614312, -0.2143806, -3.05936, 1, 1, 1, 1, 1,
-0.2606797, 0.8226218, -0.6389503, 1, 1, 1, 1, 1,
-0.2603905, 0.5617341, 0.2093099, 1, 1, 1, 1, 1,
-0.2603662, 0.6992171, -1.321149, 1, 1, 1, 1, 1,
-0.2588819, 0.1818453, -0.3179982, 1, 1, 1, 1, 1,
-0.253446, 0.4329004, -0.287319, 1, 1, 1, 1, 1,
-0.2518227, -0.3866847, -2.809598, 1, 1, 1, 1, 1,
-0.2501424, 0.9245125, -0.1944581, 1, 1, 1, 1, 1,
-0.2451425, -0.111106, -1.649348, 1, 1, 1, 1, 1,
-0.2449712, 0.8121275, 0.2034908, 1, 1, 1, 1, 1,
-0.2328039, 0.681809, -1.284845, 1, 1, 1, 1, 1,
-0.2322441, -1.434204, -3.868524, 0, 0, 1, 1, 1,
-0.2313533, -1.006545, -3.95604, 1, 0, 0, 1, 1,
-0.2304688, 1.756976, -0.7047934, 1, 0, 0, 1, 1,
-0.2303645, -0.9691621, -3.644819, 1, 0, 0, 1, 1,
-0.2297461, -0.6307921, -3.446719, 1, 0, 0, 1, 1,
-0.2285618, -0.5938326, -2.375178, 1, 0, 0, 1, 1,
-0.2269589, -1.117704, -3.104495, 0, 0, 0, 1, 1,
-0.2255727, -0.1676127, -2.15527, 0, 0, 0, 1, 1,
-0.2252443, -0.9426097, -2.558956, 0, 0, 0, 1, 1,
-0.2188546, 0.3568233, -0.3150036, 0, 0, 0, 1, 1,
-0.2154864, -0.5530919, -1.948257, 0, 0, 0, 1, 1,
-0.2142837, -2.257919, -3.805005, 0, 0, 0, 1, 1,
-0.2125186, 2.244729, -0.169943, 0, 0, 0, 1, 1,
-0.2118935, -1.163474, -1.676226, 1, 1, 1, 1, 1,
-0.2118131, 0.6514204, 0.1181415, 1, 1, 1, 1, 1,
-0.2081634, 0.3205332, 0.6294211, 1, 1, 1, 1, 1,
-0.2029815, 1.480157, -1.733389, 1, 1, 1, 1, 1,
-0.200502, 0.1058626, -2.17949, 1, 1, 1, 1, 1,
-0.1924278, 1.217274, 1.040847, 1, 1, 1, 1, 1,
-0.1920917, -0.4621518, -3.649475, 1, 1, 1, 1, 1,
-0.1903273, 0.4816506, -1.154782, 1, 1, 1, 1, 1,
-0.1869262, -1.031525, -1.9856, 1, 1, 1, 1, 1,
-0.186589, -0.8440348, -2.359846, 1, 1, 1, 1, 1,
-0.1819508, -1.035866, -2.62122, 1, 1, 1, 1, 1,
-0.179482, -1.170255, -3.308728, 1, 1, 1, 1, 1,
-0.1788357, -0.2047024, -1.529684, 1, 1, 1, 1, 1,
-0.1780678, -0.5585012, -1.164057, 1, 1, 1, 1, 1,
-0.1770998, 0.004384397, -2.492393, 1, 1, 1, 1, 1,
-0.1715507, 1.224872, 0.4827059, 0, 0, 1, 1, 1,
-0.1712268, 0.5709208, 1.03116, 1, 0, 0, 1, 1,
-0.1706175, 0.2653612, -1.503847, 1, 0, 0, 1, 1,
-0.1702197, -0.16988, -1.901919, 1, 0, 0, 1, 1,
-0.1668851, -1.022854, -3.662705, 1, 0, 0, 1, 1,
-0.1658528, -0.6423537, -3.790611, 1, 0, 0, 1, 1,
-0.1572015, -0.9505625, -2.400688, 0, 0, 0, 1, 1,
-0.1571752, -0.4246933, -2.283717, 0, 0, 0, 1, 1,
-0.1570529, 0.4893219, 0.05069279, 0, 0, 0, 1, 1,
-0.1556209, -0.002971057, -2.291798, 0, 0, 0, 1, 1,
-0.1515526, 0.01676076, -2.047341, 0, 0, 0, 1, 1,
-0.1512128, 0.9477415, -0.02356827, 0, 0, 0, 1, 1,
-0.150116, 2.331666, -1.067738, 0, 0, 0, 1, 1,
-0.1444744, 0.1910515, -1.261233, 1, 1, 1, 1, 1,
-0.1421394, 0.04278271, -1.934206, 1, 1, 1, 1, 1,
-0.13974, -1.291051, -2.118245, 1, 1, 1, 1, 1,
-0.1385261, -0.4092774, -3.850174, 1, 1, 1, 1, 1,
-0.1370154, 1.074177, 1.002343, 1, 1, 1, 1, 1,
-0.1341297, 0.2056433, -1.000756, 1, 1, 1, 1, 1,
-0.1325311, 0.8579983, 0.04879045, 1, 1, 1, 1, 1,
-0.1315232, -0.3910796, -3.626481, 1, 1, 1, 1, 1,
-0.1267086, 1.78915, -1.611812, 1, 1, 1, 1, 1,
-0.125003, -0.4935087, -3.388945, 1, 1, 1, 1, 1,
-0.1243391, -0.03050239, -2.53516, 1, 1, 1, 1, 1,
-0.123874, -0.5092937, -2.224801, 1, 1, 1, 1, 1,
-0.09645955, 1.183135, -1.256892, 1, 1, 1, 1, 1,
-0.09207112, -0.03674291, -1.951212, 1, 1, 1, 1, 1,
-0.08885928, -0.03735564, -2.343837, 1, 1, 1, 1, 1,
-0.08826461, 0.2817827, -0.5396258, 0, 0, 1, 1, 1,
-0.08642469, -1.224549, -3.918395, 1, 0, 0, 1, 1,
-0.08283113, 2.00515, 1.102428, 1, 0, 0, 1, 1,
-0.08242063, 0.3109873, -0.8512299, 1, 0, 0, 1, 1,
-0.08159567, -0.620297, -3.083646, 1, 0, 0, 1, 1,
-0.07885616, 1.044895, 0.6061746, 1, 0, 0, 1, 1,
-0.07797509, 1.372662, 0.06907417, 0, 0, 0, 1, 1,
-0.06916419, 1.545728, 0.9143837, 0, 0, 0, 1, 1,
-0.06422299, 0.3500284, -0.1527686, 0, 0, 0, 1, 1,
-0.05777286, -0.2437809, -5.058256, 0, 0, 0, 1, 1,
-0.05411403, -0.7037472, -1.681548, 0, 0, 0, 1, 1,
-0.05220207, 0.6515865, -0.2841832, 0, 0, 0, 1, 1,
-0.04692768, -1.709894, -2.268258, 0, 0, 0, 1, 1,
-0.04395812, -0.5065645, -2.189245, 1, 1, 1, 1, 1,
-0.04273185, 1.631007, 0.3681489, 1, 1, 1, 1, 1,
-0.03898308, -1.064888, -3.035415, 1, 1, 1, 1, 1,
-0.03765642, 1.28099, 0.8772362, 1, 1, 1, 1, 1,
-0.03289242, 0.6761242, 0.4707756, 1, 1, 1, 1, 1,
-0.03164633, -2.801135, -2.898777, 1, 1, 1, 1, 1,
-0.02448296, 0.355202, -1.434269, 1, 1, 1, 1, 1,
-0.01333667, -0.3536127, -2.202203, 1, 1, 1, 1, 1,
-0.01087591, 1.350465, 2.58106, 1, 1, 1, 1, 1,
-0.008170562, 0.5186456, -0.03359802, 1, 1, 1, 1, 1,
-0.005869813, -0.7412563, -2.588397, 1, 1, 1, 1, 1,
-0.003605091, -0.2928633, -2.858891, 1, 1, 1, 1, 1,
-0.002470556, -0.543648, -3.636447, 1, 1, 1, 1, 1,
-0.001839869, 0.4802221, 0.6700375, 1, 1, 1, 1, 1,
0.001320567, 0.06775819, 0.4865365, 1, 1, 1, 1, 1,
0.002151835, 1.428687, -0.7113572, 0, 0, 1, 1, 1,
0.003361145, 0.4585138, 0.389647, 1, 0, 0, 1, 1,
0.00452354, -0.06957339, 3.775876, 1, 0, 0, 1, 1,
0.004650021, -1.476146, 2.462363, 1, 0, 0, 1, 1,
0.005595504, -0.5629013, 3.006033, 1, 0, 0, 1, 1,
0.006714487, 1.149317, -0.411649, 1, 0, 0, 1, 1,
0.007612652, -0.8650613, 3.362487, 0, 0, 0, 1, 1,
0.009763785, -0.1316642, 2.832507, 0, 0, 0, 1, 1,
0.01013626, 0.2164542, -0.9488948, 0, 0, 0, 1, 1,
0.01017216, 0.4250636, -1.469277, 0, 0, 0, 1, 1,
0.01200123, -0.9548669, 2.767372, 0, 0, 0, 1, 1,
0.01289365, 1.952346, 0.7947173, 0, 0, 0, 1, 1,
0.02036373, 0.3847486, 1.848648, 0, 0, 0, 1, 1,
0.02683788, -0.4984746, 1.768183, 1, 1, 1, 1, 1,
0.02938323, -0.7759911, 4.77096, 1, 1, 1, 1, 1,
0.0325856, 1.896563, 0.00933769, 1, 1, 1, 1, 1,
0.03422917, -0.2997196, 3.735767, 1, 1, 1, 1, 1,
0.0343309, 0.03718502, 1.259021, 1, 1, 1, 1, 1,
0.03632069, -0.8058579, 2.68292, 1, 1, 1, 1, 1,
0.04555354, -2.029847, 3.419699, 1, 1, 1, 1, 1,
0.04746513, -0.6379282, 1.856561, 1, 1, 1, 1, 1,
0.04876034, 0.5862673, -0.4123843, 1, 1, 1, 1, 1,
0.04892651, 0.7701787, -0.2102475, 1, 1, 1, 1, 1,
0.04968673, -2.005192, 4.50799, 1, 1, 1, 1, 1,
0.05250352, 0.6900408, 0.5912027, 1, 1, 1, 1, 1,
0.05420624, -0.08743615, 3.089627, 1, 1, 1, 1, 1,
0.05429592, 0.3443616, -1.834264, 1, 1, 1, 1, 1,
0.05578813, 1.987132, 1.928034, 1, 1, 1, 1, 1,
0.056924, 0.90234, -1.737184, 0, 0, 1, 1, 1,
0.06333858, -1.465858, 4.304425, 1, 0, 0, 1, 1,
0.06674113, 0.5263773, -0.4237094, 1, 0, 0, 1, 1,
0.06750089, -1.491786, 3.497568, 1, 0, 0, 1, 1,
0.06931632, 1.489003, 0.483352, 1, 0, 0, 1, 1,
0.07379057, -0.1261989, 1.668712, 1, 0, 0, 1, 1,
0.07525998, 0.1640091, 2.088332, 0, 0, 0, 1, 1,
0.07537225, 1.688397, 0.1129388, 0, 0, 0, 1, 1,
0.07620451, 0.2978608, 0.3014974, 0, 0, 0, 1, 1,
0.07653586, -0.7992297, 2.940683, 0, 0, 0, 1, 1,
0.07821041, -0.3606488, 3.324267, 0, 0, 0, 1, 1,
0.08073247, -1.649607, 2.034122, 0, 0, 0, 1, 1,
0.08125237, 0.5061237, -0.03683041, 0, 0, 0, 1, 1,
0.08166651, 0.05850668, 0.01190777, 1, 1, 1, 1, 1,
0.08487437, -0.2513648, 3.300289, 1, 1, 1, 1, 1,
0.08665681, -0.3245485, 1.504374, 1, 1, 1, 1, 1,
0.08670667, 0.05701543, 0.1352035, 1, 1, 1, 1, 1,
0.08851492, -1.519207, 1.679143, 1, 1, 1, 1, 1,
0.09864669, 1.115483, -1.463523, 1, 1, 1, 1, 1,
0.09909366, 1.030858, 0.9305658, 1, 1, 1, 1, 1,
0.100733, -2.313847, 3.428236, 1, 1, 1, 1, 1,
0.1011755, -1.012249, 5.039994, 1, 1, 1, 1, 1,
0.1030306, -0.39088, 3.481058, 1, 1, 1, 1, 1,
0.1039308, 1.893443, 0.2846889, 1, 1, 1, 1, 1,
0.1056855, 0.7403938, 0.6983536, 1, 1, 1, 1, 1,
0.1077292, 2.070787, 0.353022, 1, 1, 1, 1, 1,
0.1091886, -0.7131553, 2.681618, 1, 1, 1, 1, 1,
0.1120548, -0.3574437, 4.008328, 1, 1, 1, 1, 1,
0.1132665, 0.3347118, -0.3003135, 0, 0, 1, 1, 1,
0.1167285, -0.7185798, 2.256514, 1, 0, 0, 1, 1,
0.1189467, 1.35265, -0.1148305, 1, 0, 0, 1, 1,
0.1208859, 0.1369879, 2.352554, 1, 0, 0, 1, 1,
0.1237278, -2.739559, 2.4604, 1, 0, 0, 1, 1,
0.1247004, -1.318267, 1.782074, 1, 0, 0, 1, 1,
0.1277742, 0.5689321, -0.2904288, 0, 0, 0, 1, 1,
0.1291548, -0.3836256, 1.620834, 0, 0, 0, 1, 1,
0.1299003, 1.506566, -0.5657979, 0, 0, 0, 1, 1,
0.131052, -0.4199774, 3.758629, 0, 0, 0, 1, 1,
0.1355669, -1.42774, 1.391731, 0, 0, 0, 1, 1,
0.1362792, -0.8614051, 2.92286, 0, 0, 0, 1, 1,
0.1370004, 0.6152046, 1.636956, 0, 0, 0, 1, 1,
0.1410126, 0.9095543, -0.3001446, 1, 1, 1, 1, 1,
0.1414114, -0.4309968, 0.8977277, 1, 1, 1, 1, 1,
0.1418476, 1.099385, -0.931533, 1, 1, 1, 1, 1,
0.142661, 0.2475047, 1.487341, 1, 1, 1, 1, 1,
0.1446649, -0.4739357, 4.890757, 1, 1, 1, 1, 1,
0.1466486, -0.2328798, 3.230406, 1, 1, 1, 1, 1,
0.1484863, -0.883594, 2.46465, 1, 1, 1, 1, 1,
0.1535061, -1.13008, 4.201193, 1, 1, 1, 1, 1,
0.1575289, 0.5977746, -1.512484, 1, 1, 1, 1, 1,
0.157922, -1.354586, 0.8350326, 1, 1, 1, 1, 1,
0.1598528, 1.664255, 0.008767051, 1, 1, 1, 1, 1,
0.1605826, 0.231114, -0.1492836, 1, 1, 1, 1, 1,
0.1609473, 0.8831377, 0.6347257, 1, 1, 1, 1, 1,
0.1613439, -1.532884, 2.375582, 1, 1, 1, 1, 1,
0.1679294, -0.9436888, 3.289928, 1, 1, 1, 1, 1,
0.1706361, -1.043404, 3.443669, 0, 0, 1, 1, 1,
0.1726853, -0.3300101, 2.035206, 1, 0, 0, 1, 1,
0.1754506, -0.3256212, 2.46012, 1, 0, 0, 1, 1,
0.1760838, -2.990313, 3.579297, 1, 0, 0, 1, 1,
0.1773183, -0.3435548, 1.526315, 1, 0, 0, 1, 1,
0.181932, -0.2398615, 2.256902, 1, 0, 0, 1, 1,
0.1860633, 0.1361147, 1.743858, 0, 0, 0, 1, 1,
0.1865689, 0.3370049, 0.4726168, 0, 0, 0, 1, 1,
0.1868221, -1.814004, 2.214849, 0, 0, 0, 1, 1,
0.1880523, 2.24335, -0.7989354, 0, 0, 0, 1, 1,
0.188944, 0.361594, -0.6658074, 0, 0, 0, 1, 1,
0.1899916, -1.962922, 4.740617, 0, 0, 0, 1, 1,
0.1901612, 2.025379, 1.237936, 0, 0, 0, 1, 1,
0.1915011, -0.5830805, 2.661253, 1, 1, 1, 1, 1,
0.1926095, 1.338163, -1.300071, 1, 1, 1, 1, 1,
0.1944251, -0.7591904, 2.981397, 1, 1, 1, 1, 1,
0.1950361, 0.5555416, 1.924949, 1, 1, 1, 1, 1,
0.1956936, -0.500323, 2.948101, 1, 1, 1, 1, 1,
0.1987773, 1.034877, 0.6941129, 1, 1, 1, 1, 1,
0.2127658, -0.960667, 2.947298, 1, 1, 1, 1, 1,
0.2177982, 0.9987538, 0.09180624, 1, 1, 1, 1, 1,
0.223665, -1.444638, 2.094348, 1, 1, 1, 1, 1,
0.2304815, -0.8670635, 1.291556, 1, 1, 1, 1, 1,
0.2330395, -0.1174481, 1.988604, 1, 1, 1, 1, 1,
0.2353606, 1.730044, 1.479525, 1, 1, 1, 1, 1,
0.2357326, -0.5067097, 4.034116, 1, 1, 1, 1, 1,
0.2357649, 0.03286136, 0.1018596, 1, 1, 1, 1, 1,
0.2359712, 0.5972079, 0.5623867, 1, 1, 1, 1, 1,
0.2377903, 0.09952946, 2.116141, 0, 0, 1, 1, 1,
0.2379344, 1.994286, 0.9461678, 1, 0, 0, 1, 1,
0.2387575, 0.4208482, 1.113996, 1, 0, 0, 1, 1,
0.2403524, 0.2351434, 0.4847541, 1, 0, 0, 1, 1,
0.2435241, -0.7066727, 4.008166, 1, 0, 0, 1, 1,
0.2436769, -1.598647, 3.261577, 1, 0, 0, 1, 1,
0.2449511, 0.1906096, 2.061474, 0, 0, 0, 1, 1,
0.2463885, -1.438457, 3.144063, 0, 0, 0, 1, 1,
0.2477253, 0.5138068, -0.1531438, 0, 0, 0, 1, 1,
0.2508534, 1.527359, -0.2431996, 0, 0, 0, 1, 1,
0.2532739, 0.4356483, 0.4257588, 0, 0, 0, 1, 1,
0.2586677, -1.714966, 5.558977, 0, 0, 0, 1, 1,
0.2622244, -0.05446267, 1.600634, 0, 0, 0, 1, 1,
0.2647411, 1.651358, -1.256642, 1, 1, 1, 1, 1,
0.2685772, 0.04495921, 2.970204, 1, 1, 1, 1, 1,
0.2712576, -0.9528017, 3.821707, 1, 1, 1, 1, 1,
0.2713168, -0.280178, 1.769367, 1, 1, 1, 1, 1,
0.2726521, -1.107949, 3.5813, 1, 1, 1, 1, 1,
0.2733109, 0.3980517, 0.6983993, 1, 1, 1, 1, 1,
0.2736577, -0.4731716, 2.673072, 1, 1, 1, 1, 1,
0.279088, 1.925344, -0.101219, 1, 1, 1, 1, 1,
0.2794157, -0.6605058, 0.7410013, 1, 1, 1, 1, 1,
0.282616, 0.8419021, -0.4252937, 1, 1, 1, 1, 1,
0.2826515, -1.851526, 2.345407, 1, 1, 1, 1, 1,
0.2831825, 0.01407001, 1.632073, 1, 1, 1, 1, 1,
0.2842382, -0.2540854, 2.740408, 1, 1, 1, 1, 1,
0.2892703, -0.6985888, 3.573601, 1, 1, 1, 1, 1,
0.2950389, 0.6942886, 0.9331388, 1, 1, 1, 1, 1,
0.2966557, 0.490426, 0.2831638, 0, 0, 1, 1, 1,
0.2997403, -0.4194907, 3.458383, 1, 0, 0, 1, 1,
0.3039996, 0.4300376, -0.6257757, 1, 0, 0, 1, 1,
0.30544, 1.740314, -1.230271, 1, 0, 0, 1, 1,
0.3128306, -0.7605618, 3.133989, 1, 0, 0, 1, 1,
0.3149491, -0.8915736, 2.942381, 1, 0, 0, 1, 1,
0.3153706, 1.088853, 0.3807082, 0, 0, 0, 1, 1,
0.3184341, -1.072865, 1.967861, 0, 0, 0, 1, 1,
0.3232868, -0.2311947, 1.406107, 0, 0, 0, 1, 1,
0.3234017, 1.218314, -0.1447081, 0, 0, 0, 1, 1,
0.3274532, -0.7241773, 4.119177, 0, 0, 0, 1, 1,
0.3319408, -0.3526693, 2.28071, 0, 0, 0, 1, 1,
0.3353887, 1.741448, 0.3038377, 0, 0, 0, 1, 1,
0.3355308, -0.2225449, 3.643403, 1, 1, 1, 1, 1,
0.342644, -0.3966904, 3.027792, 1, 1, 1, 1, 1,
0.344312, 1.170645, -0.01652866, 1, 1, 1, 1, 1,
0.3473889, -0.9667253, 2.836933, 1, 1, 1, 1, 1,
0.3480725, -0.5802054, 1.515078, 1, 1, 1, 1, 1,
0.3505839, 0.8397555, 2.389058, 1, 1, 1, 1, 1,
0.3510958, 0.4901302, 0.4755361, 1, 1, 1, 1, 1,
0.353503, -0.07392313, 2.843873, 1, 1, 1, 1, 1,
0.353838, 0.3558467, 1.840201, 1, 1, 1, 1, 1,
0.3556177, -0.6807225, 4.043301, 1, 1, 1, 1, 1,
0.3574771, 1.378223, 0.1832815, 1, 1, 1, 1, 1,
0.3585846, -1.400655, 1.043004, 1, 1, 1, 1, 1,
0.3597009, -1.331362, 4.204565, 1, 1, 1, 1, 1,
0.360658, -0.4208196, 2.569235, 1, 1, 1, 1, 1,
0.3614123, 0.9786792, -1.671, 1, 1, 1, 1, 1,
0.3635014, -0.02683417, 1.537459, 0, 0, 1, 1, 1,
0.3642318, -1.017135, 3.298209, 1, 0, 0, 1, 1,
0.3661068, -0.5645909, 1.837773, 1, 0, 0, 1, 1,
0.3685721, 0.6418658, 1.932799, 1, 0, 0, 1, 1,
0.3705316, 0.3609363, -0.2957486, 1, 0, 0, 1, 1,
0.3745021, 0.5591852, -1.760398, 1, 0, 0, 1, 1,
0.3753515, -0.1289032, 1.663245, 0, 0, 0, 1, 1,
0.3810694, 0.2634034, 1.680987, 0, 0, 0, 1, 1,
0.3860114, 0.760315, -0.1057822, 0, 0, 0, 1, 1,
0.3910277, 0.6561479, -1.335772, 0, 0, 0, 1, 1,
0.3958546, -0.9515798, 2.976689, 0, 0, 0, 1, 1,
0.3960496, 1.47605, -0.8199033, 0, 0, 0, 1, 1,
0.4004871, -1.026425, 2.47222, 0, 0, 0, 1, 1,
0.4010542, 0.2632259, 0.5134534, 1, 1, 1, 1, 1,
0.4046721, -1.136111, 3.28913, 1, 1, 1, 1, 1,
0.407135, 0.7272496, 0.4409622, 1, 1, 1, 1, 1,
0.4091255, -0.08530269, 0.3568586, 1, 1, 1, 1, 1,
0.4102109, -2.833294, 3.135111, 1, 1, 1, 1, 1,
0.4153774, -1.548542, 3.027081, 1, 1, 1, 1, 1,
0.4244819, -1.956363, 2.738547, 1, 1, 1, 1, 1,
0.4263005, -0.2892819, 2.954098, 1, 1, 1, 1, 1,
0.4296367, 1.365108, 0.05659253, 1, 1, 1, 1, 1,
0.4312682, -0.02946232, 2.303766, 1, 1, 1, 1, 1,
0.4400076, -0.1792905, 2.18356, 1, 1, 1, 1, 1,
0.4408995, -1.57732, 3.606506, 1, 1, 1, 1, 1,
0.4454964, -1.452065, 3.060601, 1, 1, 1, 1, 1,
0.4511102, 0.7502779, -0.08247196, 1, 1, 1, 1, 1,
0.4517224, 1.302838, -0.7490846, 1, 1, 1, 1, 1,
0.4527712, -1.099668, 2.233776, 0, 0, 1, 1, 1,
0.4532305, -0.3112136, 2.240949, 1, 0, 0, 1, 1,
0.4540102, -0.5283681, 0.2004834, 1, 0, 0, 1, 1,
0.45571, 0.7844375, 0.841671, 1, 0, 0, 1, 1,
0.4604124, 1.181207, 0.4111306, 1, 0, 0, 1, 1,
0.4613793, 0.1585744, 0.7001064, 1, 0, 0, 1, 1,
0.4632516, 0.7815946, 2.124426, 0, 0, 0, 1, 1,
0.4673694, 0.4038176, 0.1720921, 0, 0, 0, 1, 1,
0.4686174, -0.6184844, 3.846903, 0, 0, 0, 1, 1,
0.4699962, 1.397967, 0.3261563, 0, 0, 0, 1, 1,
0.4712614, -0.5859393, 3.301488, 0, 0, 0, 1, 1,
0.4731811, 0.03815161, 1.987568, 0, 0, 0, 1, 1,
0.4772161, -0.6664271, 2.161657, 0, 0, 0, 1, 1,
0.4774727, 1.376962, -1.466145, 1, 1, 1, 1, 1,
0.4786307, -0.07549613, 2.354309, 1, 1, 1, 1, 1,
0.4788354, -0.07937922, 2.38563, 1, 1, 1, 1, 1,
0.4795892, -0.6281345, 2.750911, 1, 1, 1, 1, 1,
0.47974, 1.77159, 0.1356989, 1, 1, 1, 1, 1,
0.4805665, -0.9547339, 3.789777, 1, 1, 1, 1, 1,
0.4810307, 1.695008, 0.7854298, 1, 1, 1, 1, 1,
0.4810872, -1.074879, 2.682763, 1, 1, 1, 1, 1,
0.485056, 0.8654731, 1.450223, 1, 1, 1, 1, 1,
0.4858285, -0.8189163, 0.1074441, 1, 1, 1, 1, 1,
0.4891739, 0.6768478, 0.4161377, 1, 1, 1, 1, 1,
0.4893841, -2.078893, 5.067284, 1, 1, 1, 1, 1,
0.4893895, 0.4827065, 1.411152, 1, 1, 1, 1, 1,
0.496502, 0.8167142, 2.103398, 1, 1, 1, 1, 1,
0.4978741, 0.2285623, 0.4922811, 1, 1, 1, 1, 1,
0.4979407, -0.4233266, 0.1321766, 0, 0, 1, 1, 1,
0.5002266, 1.895144, -0.8703603, 1, 0, 0, 1, 1,
0.500946, 1.947978, 0.8570295, 1, 0, 0, 1, 1,
0.5041362, -1.43161, 1.904997, 1, 0, 0, 1, 1,
0.5095658, -0.2719891, 2.102389, 1, 0, 0, 1, 1,
0.5109283, -0.256204, 1.469492, 1, 0, 0, 1, 1,
0.514506, 0.2826922, 0.1260319, 0, 0, 0, 1, 1,
0.5221579, -0.3656192, 2.745571, 0, 0, 0, 1, 1,
0.5222613, 1.097818, -0.4420815, 0, 0, 0, 1, 1,
0.5228057, 0.9303285, 1.949042, 0, 0, 0, 1, 1,
0.5235136, -1.918138, 4.315857, 0, 0, 0, 1, 1,
0.5239158, -2.806376, 2.577852, 0, 0, 0, 1, 1,
0.5262179, 1.972872, 2.018779, 0, 0, 0, 1, 1,
0.5271518, -0.2459982, 0.9312784, 1, 1, 1, 1, 1,
0.5287946, 1.356479, 0.3864263, 1, 1, 1, 1, 1,
0.5288875, -1.226771, 2.883267, 1, 1, 1, 1, 1,
0.532519, -2.893691, 1.774315, 1, 1, 1, 1, 1,
0.53423, -0.5212145, 1.315114, 1, 1, 1, 1, 1,
0.5390438, 0.5701337, 0.5290874, 1, 1, 1, 1, 1,
0.539571, 1.497055, -1.548388, 1, 1, 1, 1, 1,
0.5401435, -1.537242, 3.841474, 1, 1, 1, 1, 1,
0.5435458, -0.602252, 1.941838, 1, 1, 1, 1, 1,
0.5556898, 0.6827649, 1.991497, 1, 1, 1, 1, 1,
0.5683419, -0.6736721, 1.473175, 1, 1, 1, 1, 1,
0.5693828, -0.8586465, 2.947196, 1, 1, 1, 1, 1,
0.5699434, -0.8252204, 2.977718, 1, 1, 1, 1, 1,
0.5795905, 0.5832921, 1.262479, 1, 1, 1, 1, 1,
0.5804564, -0.1144066, 3.121112, 1, 1, 1, 1, 1,
0.5839095, 1.357073, 2.499266, 0, 0, 1, 1, 1,
0.5843679, -0.3753103, 2.879454, 1, 0, 0, 1, 1,
0.5921806, 0.3356045, 0.6179171, 1, 0, 0, 1, 1,
0.592182, -1.310063, 2.53484, 1, 0, 0, 1, 1,
0.592972, 0.9873529, 2.135383, 1, 0, 0, 1, 1,
0.5961024, -0.3358078, 2.363132, 1, 0, 0, 1, 1,
0.5971528, 2.662845, -1.423397, 0, 0, 0, 1, 1,
0.597542, 0.7782317, -0.4745798, 0, 0, 0, 1, 1,
0.6036728, 0.4891144, 3.092275, 0, 0, 0, 1, 1,
0.6057369, 1.151383, 0.04464869, 0, 0, 0, 1, 1,
0.6261449, -2.381016, 3.388664, 0, 0, 0, 1, 1,
0.6278499, 2.704576, -0.02888088, 0, 0, 0, 1, 1,
0.6383638, 0.04806098, 1.919952, 0, 0, 0, 1, 1,
0.6385977, -0.8449065, 2.592319, 1, 1, 1, 1, 1,
0.6391113, 1.041689, 1.083641, 1, 1, 1, 1, 1,
0.6392391, -2.400257, 4.674817, 1, 1, 1, 1, 1,
0.6418829, 0.8157891, 0.3872557, 1, 1, 1, 1, 1,
0.641922, -0.8945737, 2.551739, 1, 1, 1, 1, 1,
0.6473476, -0.3224725, 3.371017, 1, 1, 1, 1, 1,
0.6518382, 1.344778, 1.042742, 1, 1, 1, 1, 1,
0.6573358, -1.440579, 2.679688, 1, 1, 1, 1, 1,
0.6627705, 0.4021809, 1.214374, 1, 1, 1, 1, 1,
0.663499, 1.310525, 2.823149, 1, 1, 1, 1, 1,
0.6682209, 0.2043624, 1.19022, 1, 1, 1, 1, 1,
0.6693175, -1.129186, 3.381839, 1, 1, 1, 1, 1,
0.6700357, 0.6052588, -0.5661067, 1, 1, 1, 1, 1,
0.6733695, 0.1468698, 2.668452, 1, 1, 1, 1, 1,
0.6759074, 0.8281438, 2.096412, 1, 1, 1, 1, 1,
0.6886522, -0.388839, 3.955292, 0, 0, 1, 1, 1,
0.6887471, -0.6967428, 2.147956, 1, 0, 0, 1, 1,
0.6890357, -1.633035, 2.215621, 1, 0, 0, 1, 1,
0.6917533, 1.668055, -0.1561227, 1, 0, 0, 1, 1,
0.6938742, 1.233982, 1.348869, 1, 0, 0, 1, 1,
0.6953022, 0.2072397, 1.623664, 1, 0, 0, 1, 1,
0.701411, -0.6787664, 0.8739202, 0, 0, 0, 1, 1,
0.7036116, -0.3539949, 0.5547413, 0, 0, 0, 1, 1,
0.7108762, -0.3154088, 1.385579, 0, 0, 0, 1, 1,
0.7112693, 1.199921, 0.3730084, 0, 0, 0, 1, 1,
0.714181, 1.103221, -0.1683567, 0, 0, 0, 1, 1,
0.7163525, -0.2525775, 2.397593, 0, 0, 0, 1, 1,
0.7168175, 0.3932811, 1.892191, 0, 0, 0, 1, 1,
0.7241992, -1.723031, 2.093177, 1, 1, 1, 1, 1,
0.7249266, 0.8736069, -0.666513, 1, 1, 1, 1, 1,
0.738812, 0.3536018, 1.521772, 1, 1, 1, 1, 1,
0.7450572, 2.027761, 0.1019638, 1, 1, 1, 1, 1,
0.7501259, -0.5716799, 0.02314155, 1, 1, 1, 1, 1,
0.7525442, 0.03477224, 2.319818, 1, 1, 1, 1, 1,
0.757287, 0.166138, 1.301865, 1, 1, 1, 1, 1,
0.760181, 1.174927, -0.3214883, 1, 1, 1, 1, 1,
0.7602957, 1.199922, 1.79991, 1, 1, 1, 1, 1,
0.7605485, 0.9455403, 0.05116669, 1, 1, 1, 1, 1,
0.7629186, 1.719961, 1.49465, 1, 1, 1, 1, 1,
0.7817923, 0.09826699, 0.5363126, 1, 1, 1, 1, 1,
0.785073, 0.6416354, -0.01079097, 1, 1, 1, 1, 1,
0.7895657, 0.1771277, 0.5839134, 1, 1, 1, 1, 1,
0.7897821, 0.1208398, 3.525224, 1, 1, 1, 1, 1,
0.7962838, 0.05747642, 1.39823, 0, 0, 1, 1, 1,
0.797949, -0.5254459, 2.954475, 1, 0, 0, 1, 1,
0.8021257, -0.6524098, 0.7500492, 1, 0, 0, 1, 1,
0.8036026, -1.438858, 2.738291, 1, 0, 0, 1, 1,
0.8043667, 1.253613, -2.642769, 1, 0, 0, 1, 1,
0.8059033, 0.4719999, 1.2924, 1, 0, 0, 1, 1,
0.8073114, -0.5332023, 1.054641, 0, 0, 0, 1, 1,
0.8110613, 0.2384323, 0.02738311, 0, 0, 0, 1, 1,
0.8130631, -0.8400633, 2.566639, 0, 0, 0, 1, 1,
0.8159922, 1.529321, 2.20923, 0, 0, 0, 1, 1,
0.8164181, -1.374115, 0.8517659, 0, 0, 0, 1, 1,
0.8189114, 0.7477016, 0.2307103, 0, 0, 0, 1, 1,
0.8202295, -1.28919, 2.506078, 0, 0, 0, 1, 1,
0.8210331, -0.3012232, 0.5151162, 1, 1, 1, 1, 1,
0.8231077, -2.68995, 3.270494, 1, 1, 1, 1, 1,
0.8254716, -0.1529059, 2.139608, 1, 1, 1, 1, 1,
0.8275926, 0.8308824, 0.02292079, 1, 1, 1, 1, 1,
0.8299097, 0.5629215, 0.2023653, 1, 1, 1, 1, 1,
0.8373642, 0.01856067, 2.587828, 1, 1, 1, 1, 1,
0.8391322, -0.6621355, 1.899239, 1, 1, 1, 1, 1,
0.8491229, 0.6540955, 0.8331965, 1, 1, 1, 1, 1,
0.8544507, -0.2744533, 2.407219, 1, 1, 1, 1, 1,
0.8561794, 0.5009008, 1.986392, 1, 1, 1, 1, 1,
0.8623542, 0.4878151, 2.452813, 1, 1, 1, 1, 1,
0.8629645, 0.6460911, 1.03857, 1, 1, 1, 1, 1,
0.8635949, 1.321489, -0.2716543, 1, 1, 1, 1, 1,
0.8639484, -0.6648193, 0.9029448, 1, 1, 1, 1, 1,
0.8644481, 1.375632, 0.6806914, 1, 1, 1, 1, 1,
0.8746923, 0.3273251, 2.046439, 0, 0, 1, 1, 1,
0.8801292, 0.5175641, 1.389768, 1, 0, 0, 1, 1,
0.8838981, -0.1155757, 0.5444949, 1, 0, 0, 1, 1,
0.8872475, -0.5031186, -0.2819806, 1, 0, 0, 1, 1,
0.8976463, 0.6143318, -0.1844777, 1, 0, 0, 1, 1,
0.8978594, -2.077874, 3.247799, 1, 0, 0, 1, 1,
0.9022914, -1.117694, 1.626238, 0, 0, 0, 1, 1,
0.9082265, -0.4157549, 0.4666678, 0, 0, 0, 1, 1,
0.9113876, 0.8765618, 0.5565464, 0, 0, 0, 1, 1,
0.9183924, -1.708571, 2.170336, 0, 0, 0, 1, 1,
0.9286959, -1.650724, 3.032533, 0, 0, 0, 1, 1,
0.9423473, 1.238931, 0.9354607, 0, 0, 0, 1, 1,
0.9459289, 0.1363105, 2.64008, 0, 0, 0, 1, 1,
0.9530124, 0.9152169, 2.186527, 1, 1, 1, 1, 1,
0.9651638, 0.4583681, 3.258252, 1, 1, 1, 1, 1,
0.9746081, 0.004474981, 0.9328009, 1, 1, 1, 1, 1,
0.9789345, -0.1725166, 3.488168, 1, 1, 1, 1, 1,
0.9793857, 0.7442393, 0.3684114, 1, 1, 1, 1, 1,
0.9840381, -0.9807702, 3.532475, 1, 1, 1, 1, 1,
0.9847419, 0.006482688, 2.549939, 1, 1, 1, 1, 1,
0.9851249, -0.8494027, 1.499152, 1, 1, 1, 1, 1,
1.006083, -1.312439, 1.798647, 1, 1, 1, 1, 1,
1.006152, 1.688417, 0.3393072, 1, 1, 1, 1, 1,
1.006887, -1.108449, 1.815205, 1, 1, 1, 1, 1,
1.00978, -0.7072654, 1.88967, 1, 1, 1, 1, 1,
1.010178, 0.8780556, 0.1310408, 1, 1, 1, 1, 1,
1.011609, 0.8814374, 1.297257, 1, 1, 1, 1, 1,
1.013983, -0.1758962, 1.93238, 1, 1, 1, 1, 1,
1.016492, -0.5102946, 2.610868, 0, 0, 1, 1, 1,
1.017509, -0.1010417, 3.153464, 1, 0, 0, 1, 1,
1.019219, -0.9330342, 3.280358, 1, 0, 0, 1, 1,
1.019632, -0.6686456, 2.375416, 1, 0, 0, 1, 1,
1.024286, -0.663622, 1.83499, 1, 0, 0, 1, 1,
1.028122, 1.176457, 0.1607439, 1, 0, 0, 1, 1,
1.030657, -0.2656548, 2.16134, 0, 0, 0, 1, 1,
1.038079, -0.300887, 1.28027, 0, 0, 0, 1, 1,
1.039925, -0.1153438, 2.187536, 0, 0, 0, 1, 1,
1.042394, -0.5281113, 1.280088, 0, 0, 0, 1, 1,
1.045505, 0.9755466, -1.367774, 0, 0, 0, 1, 1,
1.046271, 0.4714016, 1.600848, 0, 0, 0, 1, 1,
1.048216, 0.4111087, -0.008657668, 0, 0, 0, 1, 1,
1.050666, -0.287403, 3.632987, 1, 1, 1, 1, 1,
1.059462, -0.8826062, 2.708874, 1, 1, 1, 1, 1,
1.069186, 0.1580195, 2.502285, 1, 1, 1, 1, 1,
1.069451, -0.8869742, 2.355141, 1, 1, 1, 1, 1,
1.077715, 0.03618373, 2.085481, 1, 1, 1, 1, 1,
1.078447, 0.002626362, 0.9568419, 1, 1, 1, 1, 1,
1.088514, 1.005432, 0.05780262, 1, 1, 1, 1, 1,
1.091357, 1.971642, 1.266266, 1, 1, 1, 1, 1,
1.094924, -0.5627274, 3.61724, 1, 1, 1, 1, 1,
1.100075, 0.444144, -0.02536186, 1, 1, 1, 1, 1,
1.108216, -0.511322, 1.45226, 1, 1, 1, 1, 1,
1.115372, -1.988778, 1.467542, 1, 1, 1, 1, 1,
1.116473, 1.19368, 0.06665396, 1, 1, 1, 1, 1,
1.120907, -0.1269073, 0.08440761, 1, 1, 1, 1, 1,
1.144453, 0.3177907, 2.116168, 1, 1, 1, 1, 1,
1.147805, -0.9991779, 2.436788, 0, 0, 1, 1, 1,
1.154649, 0.2597125, 0.1582266, 1, 0, 0, 1, 1,
1.155231, 0.9721367, 2.967612, 1, 0, 0, 1, 1,
1.160167, -0.150719, 0.6504393, 1, 0, 0, 1, 1,
1.161643, -0.6198948, 0.5181317, 1, 0, 0, 1, 1,
1.163612, 0.6405833, 3.050369, 1, 0, 0, 1, 1,
1.171087, -0.6231601, 1.566651, 0, 0, 0, 1, 1,
1.172703, -0.1002577, 3.149637, 0, 0, 0, 1, 1,
1.181306, 2.197397, -0.5906439, 0, 0, 0, 1, 1,
1.193435, -0.04031442, 2.201754, 0, 0, 0, 1, 1,
1.199388, -1.35255, 3.570045, 0, 0, 0, 1, 1,
1.199879, -0.9360991, 1.863172, 0, 0, 0, 1, 1,
1.215037, 0.8832526, 0.6016493, 0, 0, 0, 1, 1,
1.219413, 1.385537, -0.3476351, 1, 1, 1, 1, 1,
1.22032, 0.2050226, -0.207507, 1, 1, 1, 1, 1,
1.225322, 0.5278223, 1.741647, 1, 1, 1, 1, 1,
1.229815, -1.764003, 3.506639, 1, 1, 1, 1, 1,
1.230232, -1.722504, 1.637181, 1, 1, 1, 1, 1,
1.231727, -0.7863662, 2.336699, 1, 1, 1, 1, 1,
1.233512, 0.3861012, -0.2467205, 1, 1, 1, 1, 1,
1.249091, -0.8606787, 0.2917202, 1, 1, 1, 1, 1,
1.254173, 0.3510357, 1.859316, 1, 1, 1, 1, 1,
1.254343, -0.5795997, 2.829505, 1, 1, 1, 1, 1,
1.254656, -0.9597097, 2.615, 1, 1, 1, 1, 1,
1.256328, 0.9355799, 1.089404, 1, 1, 1, 1, 1,
1.262873, 0.5369735, 0.2292267, 1, 1, 1, 1, 1,
1.281957, 0.7054594, 1.703178, 1, 1, 1, 1, 1,
1.295185, -1.133923, 2.534184, 1, 1, 1, 1, 1,
1.3172, -0.7034009, 1.984825, 0, 0, 1, 1, 1,
1.318829, -0.0874076, 1.668648, 1, 0, 0, 1, 1,
1.327416, -3.420699, 4.286627, 1, 0, 0, 1, 1,
1.339802, -0.07916806, 0.5261632, 1, 0, 0, 1, 1,
1.341237, -0.5129293, 0.5788298, 1, 0, 0, 1, 1,
1.34154, -0.03233495, 2.836167, 1, 0, 0, 1, 1,
1.345267, -0.2789105, 3.34638, 0, 0, 0, 1, 1,
1.353303, 0.5738956, 0.9267074, 0, 0, 0, 1, 1,
1.360668, -0.927312, 0.55333, 0, 0, 0, 1, 1,
1.376542, 1.52486, -0.2577549, 0, 0, 0, 1, 1,
1.384085, 0.4020865, 3.019291, 0, 0, 0, 1, 1,
1.392874, -0.6632237, 1.092519, 0, 0, 0, 1, 1,
1.394232, -0.2956982, 3.160514, 0, 0, 0, 1, 1,
1.440545, 2.276558, 1.174574, 1, 1, 1, 1, 1,
1.46915, -1.218568, 0.9476765, 1, 1, 1, 1, 1,
1.491986, 0.655732, -0.01270092, 1, 1, 1, 1, 1,
1.503958, 2.188695, -0.166984, 1, 1, 1, 1, 1,
1.520457, -0.8705716, 2.001767, 1, 1, 1, 1, 1,
1.521288, 2.096048, 1.689915, 1, 1, 1, 1, 1,
1.522111, 1.726689, 2.12205, 1, 1, 1, 1, 1,
1.522151, -1.047748, 2.676121, 1, 1, 1, 1, 1,
1.5353, -0.3378153, 2.374078, 1, 1, 1, 1, 1,
1.547351, -0.6565947, 1.398854, 1, 1, 1, 1, 1,
1.554109, -1.078057, 2.071514, 1, 1, 1, 1, 1,
1.566593, 0.558489, 1.006787, 1, 1, 1, 1, 1,
1.576478, 1.429703, -0.07492182, 1, 1, 1, 1, 1,
1.577965, 2.060087, 1.460505, 1, 1, 1, 1, 1,
1.595293, -2.104376, 2.384298, 1, 1, 1, 1, 1,
1.607204, -1.036106, 4.04026, 0, 0, 1, 1, 1,
1.625112, -0.5461915, 1.832935, 1, 0, 0, 1, 1,
1.629647, -0.225041, 1.923099, 1, 0, 0, 1, 1,
1.632456, 0.3244604, 2.295728, 1, 0, 0, 1, 1,
1.635666, -0.2991849, 3.646567, 1, 0, 0, 1, 1,
1.658979, -0.7265458, 2.834515, 1, 0, 0, 1, 1,
1.666863, -0.134374, -0.2048402, 0, 0, 0, 1, 1,
1.670876, 0.2376501, 2.096271, 0, 0, 0, 1, 1,
1.677963, -0.1229796, 1.347151, 0, 0, 0, 1, 1,
1.683179, -0.6794257, 1.440098, 0, 0, 0, 1, 1,
1.709647, -1.124744, 1.127777, 0, 0, 0, 1, 1,
1.716708, -0.3778848, 2.243611, 0, 0, 0, 1, 1,
1.741753, 0.6803671, 0.7174083, 0, 0, 0, 1, 1,
1.753509, -3.272021, 3.16488, 1, 1, 1, 1, 1,
1.763892, 0.06876165, 0.5708463, 1, 1, 1, 1, 1,
1.776507, 0.541642, 0.2775627, 1, 1, 1, 1, 1,
1.789155, -0.07661895, 3.18969, 1, 1, 1, 1, 1,
1.808455, -0.2150663, 2.214324, 1, 1, 1, 1, 1,
1.848215, -0.6076574, 1.709647, 1, 1, 1, 1, 1,
1.86751, -0.1277092, 1.131693, 1, 1, 1, 1, 1,
1.868765, -1.408297, 3.331266, 1, 1, 1, 1, 1,
1.882616, 0.1001816, 1.094681, 1, 1, 1, 1, 1,
1.904354, -1.388724, 2.21645, 1, 1, 1, 1, 1,
1.916195, -0.6134774, 1.500395, 1, 1, 1, 1, 1,
1.929428, -0.1139434, 1.776314, 1, 1, 1, 1, 1,
1.947383, 0.8834938, 1.150291, 1, 1, 1, 1, 1,
1.967909, -0.8744438, 1.626573, 1, 1, 1, 1, 1,
1.974261, 0.7072795, 0.3968352, 1, 1, 1, 1, 1,
1.979925, 0.1698632, 1.612839, 0, 0, 1, 1, 1,
2.012076, 1.768805, 0.3554518, 1, 0, 0, 1, 1,
2.02335, -1.027925, 2.11154, 1, 0, 0, 1, 1,
2.026824, -0.9314214, 2.378783, 1, 0, 0, 1, 1,
2.07591, 0.04868413, 1.051437, 1, 0, 0, 1, 1,
2.078011, -1.007092, 2.300717, 1, 0, 0, 1, 1,
2.11035, 0.5310499, 1.922308, 0, 0, 0, 1, 1,
2.141746, -0.7791419, 1.802183, 0, 0, 0, 1, 1,
2.18231, 1.17386, 0.4110971, 0, 0, 0, 1, 1,
2.185371, -0.1907415, 2.580141, 0, 0, 0, 1, 1,
2.199597, -1.063897, 2.349319, 0, 0, 0, 1, 1,
2.200282, 0.3642503, 0.3048296, 0, 0, 0, 1, 1,
2.220398, -1.338844, 0.3619075, 0, 0, 0, 1, 1,
2.404347, -0.8984935, 3.678465, 1, 1, 1, 1, 1,
2.443103, -1.123068, 1.521473, 1, 1, 1, 1, 1,
2.522241, -1.05585, 1.870488, 1, 1, 1, 1, 1,
2.532315, 1.138335, 0.7753653, 1, 1, 1, 1, 1,
2.674521, -0.827723, -0.1293701, 1, 1, 1, 1, 1,
2.824139, 1.66308, 1.212296, 1, 1, 1, 1, 1,
3.207071, 1.346859, 2.930161, 1, 1, 1, 1, 1
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
var radius = 9.708511;
var distance = 34.10073;
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
mvMatrix.translate( 0.02382755, 0.06746864, -0.1522822 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10073);
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
