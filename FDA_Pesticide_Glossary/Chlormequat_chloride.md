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
-3.14416, 1.383775, -0.6850901, 1, 0, 0, 1,
-2.908911, -0.4409117, -0.2126815, 1, 0.007843138, 0, 1,
-2.772228, 1.100563, -1.209824, 1, 0.01176471, 0, 1,
-2.750558, -2.116142, -3.307698, 1, 0.01960784, 0, 1,
-2.750289, 0.8939587, -2.221322, 1, 0.02352941, 0, 1,
-2.722813, 1.233852, -0.7245889, 1, 0.03137255, 0, 1,
-2.573859, -0.4209735, -1.127094, 1, 0.03529412, 0, 1,
-2.511392, 0.3197689, -0.1792163, 1, 0.04313726, 0, 1,
-2.482853, -0.4770652, -1.4199, 1, 0.04705882, 0, 1,
-2.425148, 0.2245645, -2.198369, 1, 0.05490196, 0, 1,
-2.422868, 0.7713822, -0.08171573, 1, 0.05882353, 0, 1,
-2.377636, 0.3304937, -0.8636101, 1, 0.06666667, 0, 1,
-2.268386, -0.5652996, -1.116106, 1, 0.07058824, 0, 1,
-2.245906, -1.344335, -0.5454815, 1, 0.07843138, 0, 1,
-2.165964, 0.08309688, -0.8805009, 1, 0.08235294, 0, 1,
-2.148033, 0.9342374, -0.7679889, 1, 0.09019608, 0, 1,
-2.145219, -0.6548485, -2.890781, 1, 0.09411765, 0, 1,
-2.143539, -1.550438, -1.489358, 1, 0.1019608, 0, 1,
-2.094658, -2.077473, -1.760218, 1, 0.1098039, 0, 1,
-2.055632, -0.6234763, -2.131829, 1, 0.1137255, 0, 1,
-2.034457, -0.7351348, -2.183486, 1, 0.1215686, 0, 1,
-2.021663, 1.385968, -0.07913335, 1, 0.1254902, 0, 1,
-2.00945, -0.7475918, -2.630912, 1, 0.1333333, 0, 1,
-2.005333, 1.213481, -0.5828223, 1, 0.1372549, 0, 1,
-1.997307, 1.058334, -0.2722045, 1, 0.145098, 0, 1,
-1.994627, 0.9690543, -1.323052, 1, 0.1490196, 0, 1,
-1.953296, 0.2053336, -0.1117632, 1, 0.1568628, 0, 1,
-1.951673, 0.5415808, -1.004591, 1, 0.1607843, 0, 1,
-1.950597, -0.7413018, -1.970684, 1, 0.1686275, 0, 1,
-1.938162, 0.01993514, -1.079473, 1, 0.172549, 0, 1,
-1.927685, 1.077856, -0.974124, 1, 0.1803922, 0, 1,
-1.920044, -1.282481, -4.005402, 1, 0.1843137, 0, 1,
-1.910292, 0.1531417, 0.1606268, 1, 0.1921569, 0, 1,
-1.881666, 0.2162903, -0.9058176, 1, 0.1960784, 0, 1,
-1.874462, 1.294878, -1.601578, 1, 0.2039216, 0, 1,
-1.86167, -0.9735382, -2.594454, 1, 0.2117647, 0, 1,
-1.848497, -0.6274135, -1.389823, 1, 0.2156863, 0, 1,
-1.845524, 0.02123134, -1.01987, 1, 0.2235294, 0, 1,
-1.841873, 0.4126032, -2.284869, 1, 0.227451, 0, 1,
-1.834608, 0.5254842, -1.82432, 1, 0.2352941, 0, 1,
-1.833802, -0.6293624, -0.8051918, 1, 0.2392157, 0, 1,
-1.821779, 0.6131977, -1.514258, 1, 0.2470588, 0, 1,
-1.81573, -0.9161324, -1.376984, 1, 0.2509804, 0, 1,
-1.789786, 1.161233, 0.4179783, 1, 0.2588235, 0, 1,
-1.784384, -1.224081, -2.241835, 1, 0.2627451, 0, 1,
-1.780592, 0.3189671, -2.553778, 1, 0.2705882, 0, 1,
-1.761374, -1.367572, -2.642721, 1, 0.2745098, 0, 1,
-1.745109, 0.1021526, -3.993767, 1, 0.282353, 0, 1,
-1.720602, -0.5218322, -2.610518, 1, 0.2862745, 0, 1,
-1.719046, 0.1999185, -0.07834364, 1, 0.2941177, 0, 1,
-1.714348, 0.2920319, -1.914392, 1, 0.3019608, 0, 1,
-1.701646, 0.1004553, -2.955346, 1, 0.3058824, 0, 1,
-1.69571, 1.604059, -1.353559, 1, 0.3137255, 0, 1,
-1.69136, -0.3705269, -3.138785, 1, 0.3176471, 0, 1,
-1.687566, 0.8462704, -0.8464262, 1, 0.3254902, 0, 1,
-1.685521, -0.02878058, 0.602219, 1, 0.3294118, 0, 1,
-1.684808, -0.07026516, -1.827073, 1, 0.3372549, 0, 1,
-1.669479, -2.17451, -2.113151, 1, 0.3411765, 0, 1,
-1.667208, -0.7940155, -0.143629, 1, 0.3490196, 0, 1,
-1.639285, 0.06428928, -2.192623, 1, 0.3529412, 0, 1,
-1.625391, -0.7800016, -3.495428, 1, 0.3607843, 0, 1,
-1.610267, 0.3797543, -0.2048011, 1, 0.3647059, 0, 1,
-1.600683, -0.09432226, -2.49839, 1, 0.372549, 0, 1,
-1.596681, 0.9361891, -0.7344035, 1, 0.3764706, 0, 1,
-1.583827, 1.060106, -0.9176252, 1, 0.3843137, 0, 1,
-1.5683, 0.5746797, -0.1864944, 1, 0.3882353, 0, 1,
-1.558202, -1.356988, -2.040192, 1, 0.3960784, 0, 1,
-1.5281, 0.800034, -1.13948, 1, 0.4039216, 0, 1,
-1.526955, 1.285162, -1.244187, 1, 0.4078431, 0, 1,
-1.497952, 0.7276392, -1.179894, 1, 0.4156863, 0, 1,
-1.48252, -1.151482, -2.027104, 1, 0.4196078, 0, 1,
-1.481512, 0.7609777, -1.253893, 1, 0.427451, 0, 1,
-1.479286, 0.01199115, -2.777447, 1, 0.4313726, 0, 1,
-1.467589, 1.815484, -1.656766, 1, 0.4392157, 0, 1,
-1.462005, -0.7577404, -1.482373, 1, 0.4431373, 0, 1,
-1.457964, -0.5842299, -1.004609, 1, 0.4509804, 0, 1,
-1.446681, -0.2842733, -2.538525, 1, 0.454902, 0, 1,
-1.436984, 0.2905569, 0.2303562, 1, 0.4627451, 0, 1,
-1.432898, 0.3000407, -1.02589, 1, 0.4666667, 0, 1,
-1.418812, -0.4010753, -2.579744, 1, 0.4745098, 0, 1,
-1.416413, -0.4542624, -3.818859, 1, 0.4784314, 0, 1,
-1.415596, -0.3941906, -1.619164, 1, 0.4862745, 0, 1,
-1.390308, 0.2612391, -0.6553387, 1, 0.4901961, 0, 1,
-1.386034, -0.3698465, -0.448784, 1, 0.4980392, 0, 1,
-1.382197, 0.3614454, -3.882205, 1, 0.5058824, 0, 1,
-1.38125, 0.07297174, -2.056011, 1, 0.509804, 0, 1,
-1.380483, -0.1063257, -2.619228, 1, 0.5176471, 0, 1,
-1.372064, -0.1234702, 0.1980142, 1, 0.5215687, 0, 1,
-1.368063, 0.5135604, -1.133009, 1, 0.5294118, 0, 1,
-1.365747, -0.1322266, -1.82768, 1, 0.5333334, 0, 1,
-1.364497, 1.718998, -2.634941, 1, 0.5411765, 0, 1,
-1.346331, -0.4252729, -3.550225, 1, 0.5450981, 0, 1,
-1.340839, 0.831741, -2.571954, 1, 0.5529412, 0, 1,
-1.332289, 0.2599941, -0.3359445, 1, 0.5568628, 0, 1,
-1.325478, 1.310688, -0.6225729, 1, 0.5647059, 0, 1,
-1.323715, -1.649751, -0.4221447, 1, 0.5686275, 0, 1,
-1.322524, -0.3304989, 0.07071467, 1, 0.5764706, 0, 1,
-1.319765, 1.071572, -1.058735, 1, 0.5803922, 0, 1,
-1.316389, -1.081461, 1.073569, 1, 0.5882353, 0, 1,
-1.312544, 0.2892505, -0.7486005, 1, 0.5921569, 0, 1,
-1.295433, 0.1105811, -0.6182444, 1, 0.6, 0, 1,
-1.281222, 0.01524319, -3.770706, 1, 0.6078432, 0, 1,
-1.277137, -0.288677, -2.174984, 1, 0.6117647, 0, 1,
-1.275796, -1.263309, -1.516094, 1, 0.6196079, 0, 1,
-1.263507, 1.743655, -1.602638, 1, 0.6235294, 0, 1,
-1.249699, 2.003686, -1.24806, 1, 0.6313726, 0, 1,
-1.246684, 0.3904987, -1.961405, 1, 0.6352941, 0, 1,
-1.246358, -0.4975413, -1.148851, 1, 0.6431373, 0, 1,
-1.246099, 0.9781948, 0.3709221, 1, 0.6470588, 0, 1,
-1.245526, 0.01305069, -1.695245, 1, 0.654902, 0, 1,
-1.235747, -1.506194, -2.964592, 1, 0.6588235, 0, 1,
-1.230099, 0.8185016, -0.1351242, 1, 0.6666667, 0, 1,
-1.227542, 1.048821, -0.7607301, 1, 0.6705883, 0, 1,
-1.227493, 0.2421216, -0.4882354, 1, 0.6784314, 0, 1,
-1.210186, -0.3387544, -1.351349, 1, 0.682353, 0, 1,
-1.208131, 0.4651131, 0.3622147, 1, 0.6901961, 0, 1,
-1.208064, 0.3828274, -3.063158, 1, 0.6941177, 0, 1,
-1.201784, -0.5895857, -1.616408, 1, 0.7019608, 0, 1,
-1.196149, 0.898435, -1.1169, 1, 0.7098039, 0, 1,
-1.194479, -0.8599632, -1.384065, 1, 0.7137255, 0, 1,
-1.194127, 1.475749, 0.8799995, 1, 0.7215686, 0, 1,
-1.194042, -0.662729, -2.612889, 1, 0.7254902, 0, 1,
-1.184937, 0.3737464, -2.088585, 1, 0.7333333, 0, 1,
-1.182124, -0.1433114, -1.030838, 1, 0.7372549, 0, 1,
-1.180906, -1.323695, -4.028861, 1, 0.7450981, 0, 1,
-1.176558, -0.2031093, -2.422758, 1, 0.7490196, 0, 1,
-1.171843, 0.4132691, -0.8891262, 1, 0.7568628, 0, 1,
-1.171283, 1.683448, -0.9220616, 1, 0.7607843, 0, 1,
-1.166016, 0.3684338, -0.3039678, 1, 0.7686275, 0, 1,
-1.163124, -0.3673433, -2.598214, 1, 0.772549, 0, 1,
-1.146242, 0.7706724, -0.2025161, 1, 0.7803922, 0, 1,
-1.145741, 0.1590318, -4.070727, 1, 0.7843137, 0, 1,
-1.143582, 2.256188, 0.1513021, 1, 0.7921569, 0, 1,
-1.143535, 1.226557, -2.056596, 1, 0.7960784, 0, 1,
-1.13676, 0.1894689, -3.373566, 1, 0.8039216, 0, 1,
-1.12317, -0.1198691, -3.194743, 1, 0.8117647, 0, 1,
-1.121854, -0.1331531, -1.430975, 1, 0.8156863, 0, 1,
-1.115342, -0.8427691, -1.999003, 1, 0.8235294, 0, 1,
-1.109063, -1.496296, -3.093358, 1, 0.827451, 0, 1,
-1.106964, -1.109203, -3.165623, 1, 0.8352941, 0, 1,
-1.104715, 1.654271, -1.74967, 1, 0.8392157, 0, 1,
-1.102028, -0.2994457, -1.885727, 1, 0.8470588, 0, 1,
-1.093789, -0.5838863, -2.623487, 1, 0.8509804, 0, 1,
-1.091413, 0.4474485, -0.9644217, 1, 0.8588235, 0, 1,
-1.082699, 0.04427943, -2.200508, 1, 0.8627451, 0, 1,
-1.079506, -1.458067, -2.539135, 1, 0.8705882, 0, 1,
-1.078789, 1.333685, -0.6837846, 1, 0.8745098, 0, 1,
-1.077531, 0.5555031, -1.049519, 1, 0.8823529, 0, 1,
-1.067034, 1.42988, 0.1717098, 1, 0.8862745, 0, 1,
-1.061614, -0.8658987, -2.731507, 1, 0.8941177, 0, 1,
-1.060218, -0.279721, -2.14716, 1, 0.8980392, 0, 1,
-1.05812, -0.01396418, -3.377986, 1, 0.9058824, 0, 1,
-1.048292, 0.8801591, 0.8460015, 1, 0.9137255, 0, 1,
-1.047002, 1.884839, -1.288965, 1, 0.9176471, 0, 1,
-1.046731, 1.396682, -0.8714558, 1, 0.9254902, 0, 1,
-1.04398, 0.297166, -1.982087, 1, 0.9294118, 0, 1,
-1.041308, 0.2728269, -0.3453874, 1, 0.9372549, 0, 1,
-1.039287, 2.202626, -1.395917, 1, 0.9411765, 0, 1,
-1.034256, -0.1411987, -2.72167, 1, 0.9490196, 0, 1,
-1.033353, 0.549516, -2.2474, 1, 0.9529412, 0, 1,
-1.031961, -0.004378096, -1.411904, 1, 0.9607843, 0, 1,
-1.031853, 0.6194346, -1.838769, 1, 0.9647059, 0, 1,
-1.031245, -0.5506194, -2.7888, 1, 0.972549, 0, 1,
-1.024535, -0.552031, -3.353302, 1, 0.9764706, 0, 1,
-1.024482, -0.2019868, -0.8286605, 1, 0.9843137, 0, 1,
-1.014618, -0.3766779, -1.491051, 1, 0.9882353, 0, 1,
-1.013806, -0.6010514, -0.9122188, 1, 0.9960784, 0, 1,
-1.012466, 0.04523296, -2.283772, 0.9960784, 1, 0, 1,
-1.012183, -2.10896, -2.865644, 0.9921569, 1, 0, 1,
-1.010382, -0.7188973, -3.277174, 0.9843137, 1, 0, 1,
-1.008809, -0.4269272, 0.3662327, 0.9803922, 1, 0, 1,
-1.006083, 0.3143773, -1.631144, 0.972549, 1, 0, 1,
-1.003511, -2.271083, -1.193324, 0.9686275, 1, 0, 1,
-1.000211, 0.2823661, 0.8731809, 0.9607843, 1, 0, 1,
-0.9963324, -2.60946, -5.556752, 0.9568627, 1, 0, 1,
-0.9948424, 1.337651, -1.05136, 0.9490196, 1, 0, 1,
-0.9879621, -1.371782, -5.099994, 0.945098, 1, 0, 1,
-0.9828792, 0.7651015, -2.671672, 0.9372549, 1, 0, 1,
-0.9721422, 1.014649, -1.146806, 0.9333333, 1, 0, 1,
-0.9706495, 1.794927, -0.009389127, 0.9254902, 1, 0, 1,
-0.9694861, 0.4872452, 0.02149193, 0.9215686, 1, 0, 1,
-0.9677015, -1.312856, -1.802536, 0.9137255, 1, 0, 1,
-0.9599453, -1.765855, -3.861759, 0.9098039, 1, 0, 1,
-0.9509583, -0.8021889, -2.048707, 0.9019608, 1, 0, 1,
-0.9505689, 0.9654071, 0.09984227, 0.8941177, 1, 0, 1,
-0.9490814, 1.532276, -0.288171, 0.8901961, 1, 0, 1,
-0.9484223, 2.395691, 0.6773146, 0.8823529, 1, 0, 1,
-0.9470365, -0.5746782, -3.23244, 0.8784314, 1, 0, 1,
-0.9467182, 1.900165, 1.298137, 0.8705882, 1, 0, 1,
-0.9437601, 0.09258465, -0.7667601, 0.8666667, 1, 0, 1,
-0.9414716, 0.102057, -0.5997823, 0.8588235, 1, 0, 1,
-0.9402142, 0.8302461, -0.8916457, 0.854902, 1, 0, 1,
-0.9388287, -0.8219453, -1.469149, 0.8470588, 1, 0, 1,
-0.9350936, 0.7874816, -0.7207077, 0.8431373, 1, 0, 1,
-0.9254128, -0.4457194, -0.9513142, 0.8352941, 1, 0, 1,
-0.9219164, 1.420157, -1.206215, 0.8313726, 1, 0, 1,
-0.9185899, 0.5990877, -1.819707, 0.8235294, 1, 0, 1,
-0.9176558, -0.5801821, -2.647015, 0.8196079, 1, 0, 1,
-0.9171203, -0.3677443, -2.274492, 0.8117647, 1, 0, 1,
-0.9162036, -0.8667159, -2.577215, 0.8078431, 1, 0, 1,
-0.9104165, 0.5676157, -0.04741063, 0.8, 1, 0, 1,
-0.9091068, -0.6429508, -1.193251, 0.7921569, 1, 0, 1,
-0.8965275, -0.2395064, -4.913369, 0.7882353, 1, 0, 1,
-0.8869981, 0.7460812, -1.510331, 0.7803922, 1, 0, 1,
-0.885467, -0.09586589, 0.5508051, 0.7764706, 1, 0, 1,
-0.8845922, -0.1004384, -0.9002998, 0.7686275, 1, 0, 1,
-0.8838351, 0.767136, -0.3011276, 0.7647059, 1, 0, 1,
-0.883085, 0.8355759, 0.0635786, 0.7568628, 1, 0, 1,
-0.8716206, 0.8572354, -0.9413653, 0.7529412, 1, 0, 1,
-0.8654034, -1.508037, -1.293171, 0.7450981, 1, 0, 1,
-0.8634599, 0.0558857, -1.729929, 0.7411765, 1, 0, 1,
-0.8628464, -0.2701609, -2.186654, 0.7333333, 1, 0, 1,
-0.8580085, -0.5379297, -0.8061798, 0.7294118, 1, 0, 1,
-0.8525451, 0.2853658, 0.03926064, 0.7215686, 1, 0, 1,
-0.8480685, -1.359592, -2.176495, 0.7176471, 1, 0, 1,
-0.847972, -1.163175, -0.4113073, 0.7098039, 1, 0, 1,
-0.847392, -0.08950312, -1.429349, 0.7058824, 1, 0, 1,
-0.8456355, -0.3418685, -0.6604461, 0.6980392, 1, 0, 1,
-0.840661, 2.639514, -0.2221051, 0.6901961, 1, 0, 1,
-0.8405941, 1.201419, 0.9086579, 0.6862745, 1, 0, 1,
-0.8382307, 1.15996, 0.553307, 0.6784314, 1, 0, 1,
-0.836344, 1.258891, -0.75117, 0.6745098, 1, 0, 1,
-0.8327694, 0.8724545, 0.5302108, 0.6666667, 1, 0, 1,
-0.8301526, 0.9736699, 0.3891514, 0.6627451, 1, 0, 1,
-0.8276311, 1.456685, 0.4283566, 0.654902, 1, 0, 1,
-0.8247356, -2.107314, -4.386156, 0.6509804, 1, 0, 1,
-0.8154879, -1.232906, -2.673856, 0.6431373, 1, 0, 1,
-0.8100725, 0.7554797, -0.4643856, 0.6392157, 1, 0, 1,
-0.8009627, 1.635588, -1.583338, 0.6313726, 1, 0, 1,
-0.7975984, -0.3858922, -1.022246, 0.627451, 1, 0, 1,
-0.7967817, -0.2494567, -2.429519, 0.6196079, 1, 0, 1,
-0.7933143, -1.183223, -3.454285, 0.6156863, 1, 0, 1,
-0.7881536, -0.7103391, -3.518767, 0.6078432, 1, 0, 1,
-0.7858641, -1.939487, -2.345008, 0.6039216, 1, 0, 1,
-0.7847435, -0.2956798, -2.010472, 0.5960785, 1, 0, 1,
-0.7832454, 0.03142414, 0.9178869, 0.5882353, 1, 0, 1,
-0.7828556, -0.05192314, -2.109407, 0.5843138, 1, 0, 1,
-0.782293, 0.2384448, -4.397103, 0.5764706, 1, 0, 1,
-0.7816272, 0.5616935, -2.884727, 0.572549, 1, 0, 1,
-0.7778167, -2.436899, -3.266974, 0.5647059, 1, 0, 1,
-0.772839, 0.03069556, -0.8218383, 0.5607843, 1, 0, 1,
-0.7715961, -1.051232, -1.140374, 0.5529412, 1, 0, 1,
-0.7701024, -0.4019014, -1.720082, 0.5490196, 1, 0, 1,
-0.7696562, -0.3773614, -1.962812, 0.5411765, 1, 0, 1,
-0.7691401, 1.914031, 0.7284714, 0.5372549, 1, 0, 1,
-0.7681761, 0.7547932, -1.238253, 0.5294118, 1, 0, 1,
-0.7671774, -1.655925, -2.663967, 0.5254902, 1, 0, 1,
-0.764694, -1.409748, -2.412925, 0.5176471, 1, 0, 1,
-0.7645302, 1.664741, -1.036027, 0.5137255, 1, 0, 1,
-0.7618226, 0.5472919, -0.6243886, 0.5058824, 1, 0, 1,
-0.7518665, -0.9655643, -3.734712, 0.5019608, 1, 0, 1,
-0.7516512, 2.134722, 0.8387977, 0.4941176, 1, 0, 1,
-0.7508692, -0.1889637, -0.4468453, 0.4862745, 1, 0, 1,
-0.7506764, -0.422866, -2.809241, 0.4823529, 1, 0, 1,
-0.7478788, 0.5027043, -0.5383685, 0.4745098, 1, 0, 1,
-0.7468991, 1.68435, 0.08777799, 0.4705882, 1, 0, 1,
-0.7410073, 1.770105, -0.2262442, 0.4627451, 1, 0, 1,
-0.7369919, -1.068277, -4.110152, 0.4588235, 1, 0, 1,
-0.7349444, -0.5229515, -0.7406878, 0.4509804, 1, 0, 1,
-0.7334694, -0.07751078, -1.033829, 0.4470588, 1, 0, 1,
-0.7300214, -2.164585, -0.7240236, 0.4392157, 1, 0, 1,
-0.7188072, -0.61702, -4.264363, 0.4352941, 1, 0, 1,
-0.7140007, -1.421427, -3.929071, 0.427451, 1, 0, 1,
-0.7083865, 1.233508, -0.1624772, 0.4235294, 1, 0, 1,
-0.7029278, -0.5115929, -1.633463, 0.4156863, 1, 0, 1,
-0.7026035, 0.8119033, -0.8117615, 0.4117647, 1, 0, 1,
-0.7009596, 0.2983598, -1.080824, 0.4039216, 1, 0, 1,
-0.6934606, 0.9055933, -2.554846, 0.3960784, 1, 0, 1,
-0.68378, 0.3169056, -0.04313174, 0.3921569, 1, 0, 1,
-0.6830653, -1.032045, -2.30741, 0.3843137, 1, 0, 1,
-0.681034, 0.3899203, -1.563207, 0.3803922, 1, 0, 1,
-0.6785603, 1.395256, -0.3976904, 0.372549, 1, 0, 1,
-0.6775057, 1.190631, -1.027146, 0.3686275, 1, 0, 1,
-0.6723104, 0.4422306, -1.039308, 0.3607843, 1, 0, 1,
-0.6709262, -1.163961, -2.33281, 0.3568628, 1, 0, 1,
-0.6623076, -2.369927, -3.324908, 0.3490196, 1, 0, 1,
-0.6590216, 1.283918, -0.6987175, 0.345098, 1, 0, 1,
-0.6572418, -0.5712815, -1.703631, 0.3372549, 1, 0, 1,
-0.6462601, -1.01732, -3.386095, 0.3333333, 1, 0, 1,
-0.6451231, 0.4869258, -0.6196398, 0.3254902, 1, 0, 1,
-0.6438553, -0.4323235, -1.793142, 0.3215686, 1, 0, 1,
-0.6354606, 0.607424, 2.022031, 0.3137255, 1, 0, 1,
-0.6353545, -0.7204874, -2.646902, 0.3098039, 1, 0, 1,
-0.6339527, -0.6131712, -3.000118, 0.3019608, 1, 0, 1,
-0.621857, -0.3469628, -0.9013578, 0.2941177, 1, 0, 1,
-0.6198076, 0.06312364, -2.384167, 0.2901961, 1, 0, 1,
-0.6174846, -0.8664043, -1.667881, 0.282353, 1, 0, 1,
-0.6146306, -0.5477377, -3.34336, 0.2784314, 1, 0, 1,
-0.6120735, 1.608805, -2.076537, 0.2705882, 1, 0, 1,
-0.6116873, 0.09356146, -2.531154, 0.2666667, 1, 0, 1,
-0.6116269, -0.8522855, -1.971032, 0.2588235, 1, 0, 1,
-0.6115039, -1.089116, -4.089741, 0.254902, 1, 0, 1,
-0.606905, 0.8576866, -1.152328, 0.2470588, 1, 0, 1,
-0.6045466, 0.9392881, 0.5009662, 0.2431373, 1, 0, 1,
-0.6026747, -0.6288075, -3.495158, 0.2352941, 1, 0, 1,
-0.5987127, -1.1087, -2.280983, 0.2313726, 1, 0, 1,
-0.5960264, 0.03943184, 0.4869089, 0.2235294, 1, 0, 1,
-0.5899243, 0.7251897, -1.730181, 0.2196078, 1, 0, 1,
-0.5860239, -0.8964838, -3.297902, 0.2117647, 1, 0, 1,
-0.5788044, 0.3336808, -0.2050825, 0.2078431, 1, 0, 1,
-0.5783973, 1.71718, -1.179783, 0.2, 1, 0, 1,
-0.5773512, 0.6871715, -0.6766199, 0.1921569, 1, 0, 1,
-0.575457, 0.2471675, 0.5624443, 0.1882353, 1, 0, 1,
-0.5715127, -0.5165738, -3.092459, 0.1803922, 1, 0, 1,
-0.5669782, 0.2991532, -0.6231428, 0.1764706, 1, 0, 1,
-0.5648361, 0.4302262, -0.808252, 0.1686275, 1, 0, 1,
-0.5619645, 1.053223, -0.207427, 0.1647059, 1, 0, 1,
-0.5600772, -1.077674, -2.144409, 0.1568628, 1, 0, 1,
-0.5586, 1.965056, -1.238207, 0.1529412, 1, 0, 1,
-0.5584615, 0.0119262, -2.311807, 0.145098, 1, 0, 1,
-0.5525834, -0.3317491, -3.449382, 0.1411765, 1, 0, 1,
-0.5522752, 1.631486, 0.6974493, 0.1333333, 1, 0, 1,
-0.5518513, -0.9248973, -2.752591, 0.1294118, 1, 0, 1,
-0.5475752, 0.2731701, -1.217653, 0.1215686, 1, 0, 1,
-0.5437473, 0.2570111, -1.13339, 0.1176471, 1, 0, 1,
-0.5410503, -0.6243379, -3.375011, 0.1098039, 1, 0, 1,
-0.5283574, -1.240636, -2.753677, 0.1058824, 1, 0, 1,
-0.5225649, 0.1462712, -0.4336621, 0.09803922, 1, 0, 1,
-0.5195647, -0.3323256, -2.51491, 0.09019608, 1, 0, 1,
-0.5192074, 0.4659224, -0.3561716, 0.08627451, 1, 0, 1,
-0.5133304, -0.3250545, -0.4556907, 0.07843138, 1, 0, 1,
-0.5120011, 0.08060626, -1.547187, 0.07450981, 1, 0, 1,
-0.5101484, -0.4005941, -1.738642, 0.06666667, 1, 0, 1,
-0.5083396, -1.291674, -3.200704, 0.0627451, 1, 0, 1,
-0.5057721, -1.871096, -2.466994, 0.05490196, 1, 0, 1,
-0.5029112, -0.03938309, 0.4871615, 0.05098039, 1, 0, 1,
-0.4990639, -1.682683, -3.572013, 0.04313726, 1, 0, 1,
-0.4990389, 1.459891, -0.002219341, 0.03921569, 1, 0, 1,
-0.4947289, -0.3842778, -0.8159984, 0.03137255, 1, 0, 1,
-0.4922212, -0.1420207, -1.252875, 0.02745098, 1, 0, 1,
-0.4906402, -1.332423, -4.139155, 0.01960784, 1, 0, 1,
-0.4868133, -0.5691772, -3.143023, 0.01568628, 1, 0, 1,
-0.4866004, 2.055225, 0.2253759, 0.007843138, 1, 0, 1,
-0.4826408, 0.4353957, 0.07524346, 0.003921569, 1, 0, 1,
-0.4823847, 0.5490316, -0.8050381, 0, 1, 0.003921569, 1,
-0.4791398, 3.033188, -1.228761, 0, 1, 0.01176471, 1,
-0.4786102, 0.1252767, -0.2656437, 0, 1, 0.01568628, 1,
-0.4780749, 0.448963, -2.259288, 0, 1, 0.02352941, 1,
-0.4778144, 0.87006, -0.7462013, 0, 1, 0.02745098, 1,
-0.477047, -1.736713, -0.7076845, 0, 1, 0.03529412, 1,
-0.4767718, 0.6289385, -0.3310589, 0, 1, 0.03921569, 1,
-0.4704869, -1.412281, -1.421381, 0, 1, 0.04705882, 1,
-0.4673161, -0.9298428, -3.922974, 0, 1, 0.05098039, 1,
-0.4600157, -0.09112642, -0.9873301, 0, 1, 0.05882353, 1,
-0.4599127, 0.5990967, -2.212239, 0, 1, 0.0627451, 1,
-0.4597006, 0.2486942, -0.9285044, 0, 1, 0.07058824, 1,
-0.459282, 1.373951, -1.576674, 0, 1, 0.07450981, 1,
-0.4588924, -0.187104, -2.339695, 0, 1, 0.08235294, 1,
-0.4513173, -0.8497064, -3.07274, 0, 1, 0.08627451, 1,
-0.4497122, -0.1277747, -3.438361, 0, 1, 0.09411765, 1,
-0.4487496, 0.8870088, 0.4570004, 0, 1, 0.1019608, 1,
-0.4428776, -1.453177, -3.311895, 0, 1, 0.1058824, 1,
-0.4399566, 0.6520106, -0.4218732, 0, 1, 0.1137255, 1,
-0.437671, -1.097852, -2.052153, 0, 1, 0.1176471, 1,
-0.4374461, 0.9225943, 0.2882544, 0, 1, 0.1254902, 1,
-0.4317632, -0.8801149, -0.1801425, 0, 1, 0.1294118, 1,
-0.4317609, 0.2182489, 0.1312015, 0, 1, 0.1372549, 1,
-0.4298481, -1.206493, -2.556206, 0, 1, 0.1411765, 1,
-0.4273708, 0.4447309, -1.837433, 0, 1, 0.1490196, 1,
-0.4235605, 1.908441, 1.042715, 0, 1, 0.1529412, 1,
-0.4219784, 0.8543582, -0.2667953, 0, 1, 0.1607843, 1,
-0.4202551, 1.744508, -0.1015369, 0, 1, 0.1647059, 1,
-0.4166936, 1.356986, 0.9882754, 0, 1, 0.172549, 1,
-0.4157227, 1.113071, -0.9693159, 0, 1, 0.1764706, 1,
-0.4153766, 0.1587042, -0.5508705, 0, 1, 0.1843137, 1,
-0.4125131, 0.01030923, -2.1128, 0, 1, 0.1882353, 1,
-0.4117991, -0.1652703, -1.198206, 0, 1, 0.1960784, 1,
-0.4094299, 0.2735186, 0.7660762, 0, 1, 0.2039216, 1,
-0.4082473, 1.258453, 0.1147743, 0, 1, 0.2078431, 1,
-0.4081755, -0.9118524, -2.100677, 0, 1, 0.2156863, 1,
-0.4077627, 0.5500996, -0.3439529, 0, 1, 0.2196078, 1,
-0.4038845, 0.05480738, -0.1613807, 0, 1, 0.227451, 1,
-0.3997803, 1.224083, -1.438972, 0, 1, 0.2313726, 1,
-0.3970935, 0.6571095, -0.5906672, 0, 1, 0.2392157, 1,
-0.3951362, -0.8781009, -1.514898, 0, 1, 0.2431373, 1,
-0.3950193, 1.751478, -0.6564552, 0, 1, 0.2509804, 1,
-0.3937901, -0.06171435, -1.686761, 0, 1, 0.254902, 1,
-0.3889678, -0.4327714, -3.369779, 0, 1, 0.2627451, 1,
-0.3745234, -1.55987, -2.105159, 0, 1, 0.2666667, 1,
-0.3702482, 0.1978827, -0.4460663, 0, 1, 0.2745098, 1,
-0.3678685, 0.444647, 1.263258, 0, 1, 0.2784314, 1,
-0.3647764, -1.125285, -1.655253, 0, 1, 0.2862745, 1,
-0.3627833, 1.243984, -0.05604041, 0, 1, 0.2901961, 1,
-0.3597723, 0.09503077, -0.268391, 0, 1, 0.2980392, 1,
-0.3566982, -0.6006483, -2.73461, 0, 1, 0.3058824, 1,
-0.3541674, -0.04667747, -0.5395252, 0, 1, 0.3098039, 1,
-0.3530344, 1.360157, -2.058962, 0, 1, 0.3176471, 1,
-0.3473273, -0.8296229, -2.917192, 0, 1, 0.3215686, 1,
-0.3471808, 1.547681, -0.345746, 0, 1, 0.3294118, 1,
-0.3468546, 0.1396189, -0.3629081, 0, 1, 0.3333333, 1,
-0.3460767, 0.5698991, -0.5241873, 0, 1, 0.3411765, 1,
-0.3435962, -0.439424, -2.276968, 0, 1, 0.345098, 1,
-0.3423575, 0.5210574, -0.617884, 0, 1, 0.3529412, 1,
-0.3408745, 2.765688, -1.221099, 0, 1, 0.3568628, 1,
-0.3395333, -1.904938, -2.41901, 0, 1, 0.3647059, 1,
-0.3384081, -1.202059, -3.695901, 0, 1, 0.3686275, 1,
-0.3292636, -0.7574565, -3.006941, 0, 1, 0.3764706, 1,
-0.3237011, -0.3640167, -2.319319, 0, 1, 0.3803922, 1,
-0.3210314, -0.4829267, -3.130406, 0, 1, 0.3882353, 1,
-0.3154289, -2.044857, -2.610178, 0, 1, 0.3921569, 1,
-0.3107625, -0.5578688, -2.14936, 0, 1, 0.4, 1,
-0.309747, 0.9683027, -0.3635032, 0, 1, 0.4078431, 1,
-0.3095566, 0.8209568, 1.244653, 0, 1, 0.4117647, 1,
-0.3049268, -1.825219, -4.91585, 0, 1, 0.4196078, 1,
-0.3045099, 0.2311467, -2.244967, 0, 1, 0.4235294, 1,
-0.2985049, 0.6165892, -1.891456, 0, 1, 0.4313726, 1,
-0.2971914, 1.175332, -0.8038352, 0, 1, 0.4352941, 1,
-0.2959828, -0.9329938, -2.01832, 0, 1, 0.4431373, 1,
-0.2958794, 0.06826582, -1.694632, 0, 1, 0.4470588, 1,
-0.2908325, -0.3047377, -2.871348, 0, 1, 0.454902, 1,
-0.2900239, -0.3979299, -2.927648, 0, 1, 0.4588235, 1,
-0.2897871, 0.7235345, -0.2710115, 0, 1, 0.4666667, 1,
-0.2891457, 0.9271339, 0.7648726, 0, 1, 0.4705882, 1,
-0.2871552, -0.3790133, -2.614413, 0, 1, 0.4784314, 1,
-0.2863347, 0.7486429, -0.8166804, 0, 1, 0.4823529, 1,
-0.2847887, 1.292495, -0.5719575, 0, 1, 0.4901961, 1,
-0.2772969, 0.3202784, 0.205553, 0, 1, 0.4941176, 1,
-0.2764067, -0.340142, -2.886381, 0, 1, 0.5019608, 1,
-0.2720799, -0.004379182, -1.630313, 0, 1, 0.509804, 1,
-0.270913, -1.517847, -1.557862, 0, 1, 0.5137255, 1,
-0.2686249, -0.6709114, -2.380778, 0, 1, 0.5215687, 1,
-0.2681758, 2.150822, -1.171854, 0, 1, 0.5254902, 1,
-0.2665514, 0.2105314, 0.1298469, 0, 1, 0.5333334, 1,
-0.2640084, -0.2384678, -2.166899, 0, 1, 0.5372549, 1,
-0.2564964, 0.7792324, 0.9828902, 0, 1, 0.5450981, 1,
-0.2547262, -0.1560209, -2.269699, 0, 1, 0.5490196, 1,
-0.2534807, -1.334525, -1.137135, 0, 1, 0.5568628, 1,
-0.2528829, 0.7268105, -1.139603, 0, 1, 0.5607843, 1,
-0.2528472, -0.1512887, -1.712665, 0, 1, 0.5686275, 1,
-0.2521827, 0.6880732, -2.341443, 0, 1, 0.572549, 1,
-0.250524, 0.4854986, 0.2268928, 0, 1, 0.5803922, 1,
-0.248455, 0.5992066, 0.9003548, 0, 1, 0.5843138, 1,
-0.2472489, 1.027237, -0.3416729, 0, 1, 0.5921569, 1,
-0.246336, -1.061053, -2.957978, 0, 1, 0.5960785, 1,
-0.2455463, 0.01531332, -1.418714, 0, 1, 0.6039216, 1,
-0.2445507, -1.604273, -1.124277, 0, 1, 0.6117647, 1,
-0.2420679, -0.8387073, -1.24212, 0, 1, 0.6156863, 1,
-0.241491, 0.6087193, 0.0126549, 0, 1, 0.6235294, 1,
-0.2400767, -2.597757, -2.310508, 0, 1, 0.627451, 1,
-0.2322806, 1.254275, 0.1331925, 0, 1, 0.6352941, 1,
-0.2247063, -1.624985, -4.566406, 0, 1, 0.6392157, 1,
-0.2229503, -0.02265489, -1.257188, 0, 1, 0.6470588, 1,
-0.2206678, -0.5605527, -2.517805, 0, 1, 0.6509804, 1,
-0.219397, -1.179652, -1.751121, 0, 1, 0.6588235, 1,
-0.2166224, 0.4594744, -0.9229538, 0, 1, 0.6627451, 1,
-0.2147423, -1.178954, -3.348329, 0, 1, 0.6705883, 1,
-0.2141304, -0.5122537, -1.234884, 0, 1, 0.6745098, 1,
-0.2107579, -0.2243819, -3.465335, 0, 1, 0.682353, 1,
-0.2083242, 0.3771684, -1.309197, 0, 1, 0.6862745, 1,
-0.20771, -0.6653398, -3.888357, 0, 1, 0.6941177, 1,
-0.2058158, -0.1715521, -2.274936, 0, 1, 0.7019608, 1,
-0.1993912, -0.3275155, -4.241779, 0, 1, 0.7058824, 1,
-0.1962148, 0.04535628, 0.1536819, 0, 1, 0.7137255, 1,
-0.1961346, 1.050108, -0.04286732, 0, 1, 0.7176471, 1,
-0.1947057, -0.2124618, -2.975002, 0, 1, 0.7254902, 1,
-0.1942224, -1.358208, -4.352506, 0, 1, 0.7294118, 1,
-0.1906479, -0.1020204, -0.5721205, 0, 1, 0.7372549, 1,
-0.1886372, 0.6035154, -0.9897422, 0, 1, 0.7411765, 1,
-0.1884143, 0.5689474, -2.03191, 0, 1, 0.7490196, 1,
-0.1881476, 0.9545993, -1.455633, 0, 1, 0.7529412, 1,
-0.1853981, 0.9556085, 0.3263911, 0, 1, 0.7607843, 1,
-0.1845972, -1.46227, -3.082268, 0, 1, 0.7647059, 1,
-0.1840732, 0.7540787, 0.2477196, 0, 1, 0.772549, 1,
-0.1821942, -0.6172794, -4.090614, 0, 1, 0.7764706, 1,
-0.1681015, 0.07820801, -1.489337, 0, 1, 0.7843137, 1,
-0.166751, 0.693449, -1.708614, 0, 1, 0.7882353, 1,
-0.163079, -1.026937, -2.727889, 0, 1, 0.7960784, 1,
-0.1567355, -1.775324, -1.885306, 0, 1, 0.8039216, 1,
-0.1466458, 0.4859424, -0.3911214, 0, 1, 0.8078431, 1,
-0.1463318, 0.3468688, -1.908278, 0, 1, 0.8156863, 1,
-0.1446289, 0.4038124, -0.1422874, 0, 1, 0.8196079, 1,
-0.1419404, 1.021836, 1.226942, 0, 1, 0.827451, 1,
-0.1418013, 1.090134, -0.9323894, 0, 1, 0.8313726, 1,
-0.1417659, 0.3392908, -1.711871, 0, 1, 0.8392157, 1,
-0.1403313, 1.232021, -0.492017, 0, 1, 0.8431373, 1,
-0.1355518, 0.2156144, -1.185139, 0, 1, 0.8509804, 1,
-0.1354902, 1.573491, 0.4675868, 0, 1, 0.854902, 1,
-0.1340131, 1.512535, -0.2175226, 0, 1, 0.8627451, 1,
-0.1338665, -0.3521551, -1.9191, 0, 1, 0.8666667, 1,
-0.1251597, -1.22814, -2.689399, 0, 1, 0.8745098, 1,
-0.121932, -0.7435488, -4.362929, 0, 1, 0.8784314, 1,
-0.1211499, -0.6097904, -2.765373, 0, 1, 0.8862745, 1,
-0.1146969, -1.168013, -2.974562, 0, 1, 0.8901961, 1,
-0.1144992, 0.1589483, -1.696662, 0, 1, 0.8980392, 1,
-0.1106662, 0.8054643, 0.04650472, 0, 1, 0.9058824, 1,
-0.1058609, -0.5855663, -3.043236, 0, 1, 0.9098039, 1,
-0.101778, 0.08665118, -0.3524383, 0, 1, 0.9176471, 1,
-0.09821169, -0.8677353, -2.745261, 0, 1, 0.9215686, 1,
-0.09743222, -1.707548, -6.235295, 0, 1, 0.9294118, 1,
-0.09721737, 0.7977322, 0.4297448, 0, 1, 0.9333333, 1,
-0.09698883, -1.296341, -3.649789, 0, 1, 0.9411765, 1,
-0.09694421, 0.05573269, -1.181187, 0, 1, 0.945098, 1,
-0.09520531, 0.5310826, 0.08224593, 0, 1, 0.9529412, 1,
-0.09268203, -1.451367, -1.736944, 0, 1, 0.9568627, 1,
-0.09100214, 2.124096, -1.328347, 0, 1, 0.9647059, 1,
-0.08933973, -0.8965445, -2.276935, 0, 1, 0.9686275, 1,
-0.08694842, 0.1199766, -1.831071, 0, 1, 0.9764706, 1,
-0.08508758, 0.08844949, -1.335069, 0, 1, 0.9803922, 1,
-0.08496188, -0.7158799, -3.214448, 0, 1, 0.9882353, 1,
-0.08246857, 1.563916, -0.4200596, 0, 1, 0.9921569, 1,
-0.0805869, -0.1995779, -1.135108, 0, 1, 1, 1,
-0.07899566, 0.8935119, 0.245024, 0, 0.9921569, 1, 1,
-0.07778997, -2.680242, -3.567485, 0, 0.9882353, 1, 1,
-0.07618614, 1.219449, 1.702232, 0, 0.9803922, 1, 1,
-0.07378174, 0.5455784, 0.3196699, 0, 0.9764706, 1, 1,
-0.06934021, -1.300347, -2.77878, 0, 0.9686275, 1, 1,
-0.068896, -1.738664, -2.29743, 0, 0.9647059, 1, 1,
-0.0650398, 0.1411536, -1.089635, 0, 0.9568627, 1, 1,
-0.06250066, 0.03989653, -1.934242, 0, 0.9529412, 1, 1,
-0.05513516, -1.318302, -2.418931, 0, 0.945098, 1, 1,
-0.05478922, 0.04427064, -2.772007, 0, 0.9411765, 1, 1,
-0.05443049, -1.083053, -2.468818, 0, 0.9333333, 1, 1,
-0.05234073, -0.180195, -3.007511, 0, 0.9294118, 1, 1,
-0.04958551, 1.726241, 0.4698898, 0, 0.9215686, 1, 1,
-0.04738846, -1.922323, -1.265052, 0, 0.9176471, 1, 1,
-0.04715589, 0.4009066, 1.313778, 0, 0.9098039, 1, 1,
-0.04270953, -0.2924497, -2.666747, 0, 0.9058824, 1, 1,
-0.03620702, 1.228315, -0.1390059, 0, 0.8980392, 1, 1,
-0.03595614, -0.8765572, -2.154873, 0, 0.8901961, 1, 1,
-0.03072694, -1.129272, -2.815495, 0, 0.8862745, 1, 1,
-0.02888758, -1.481939, -1.938353, 0, 0.8784314, 1, 1,
-0.02660325, -1.362577, -2.970647, 0, 0.8745098, 1, 1,
-0.02604086, 0.5480534, 0.380641, 0, 0.8666667, 1, 1,
-0.02591061, 1.278234, 0.08093079, 0, 0.8627451, 1, 1,
-0.02211864, -0.5717777, -2.605469, 0, 0.854902, 1, 1,
-0.01659347, 1.696846, -1.121714, 0, 0.8509804, 1, 1,
-0.01638977, -1.182183, -4.240119, 0, 0.8431373, 1, 1,
-0.01394028, -0.06504141, -2.325019, 0, 0.8392157, 1, 1,
-0.01351308, -0.4316762, -0.3939922, 0, 0.8313726, 1, 1,
-0.01326135, -0.322618, -2.338086, 0, 0.827451, 1, 1,
-0.01220074, 0.0309927, -0.5758834, 0, 0.8196079, 1, 1,
-0.009294805, 1.011063, -1.200035, 0, 0.8156863, 1, 1,
-0.001727813, -1.358526, -2.335948, 0, 0.8078431, 1, 1,
-0.001465546, -1.873019, -2.236085, 0, 0.8039216, 1, 1,
0.001687325, 0.807488, 0.004328516, 0, 0.7960784, 1, 1,
0.003174098, -0.4587892, 3.421299, 0, 0.7882353, 1, 1,
0.003321742, -1.104127, 4.352208, 0, 0.7843137, 1, 1,
0.005751556, 0.561692, -0.1766269, 0, 0.7764706, 1, 1,
0.01157653, 1.116072, 0.9008619, 0, 0.772549, 1, 1,
0.01226298, -1.567369, 3.243512, 0, 0.7647059, 1, 1,
0.0166925, 0.7866324, -0.8372458, 0, 0.7607843, 1, 1,
0.01674943, 0.1969364, 0.7684391, 0, 0.7529412, 1, 1,
0.01995612, 0.798655, 0.8079061, 0, 0.7490196, 1, 1,
0.02038919, -0.2078505, 3.964955, 0, 0.7411765, 1, 1,
0.0307526, -0.5337386, 3.654504, 0, 0.7372549, 1, 1,
0.03163873, -0.820792, 2.505713, 0, 0.7294118, 1, 1,
0.03320829, 0.6140583, -1.158299, 0, 0.7254902, 1, 1,
0.03720218, 1.356142, -0.7123311, 0, 0.7176471, 1, 1,
0.03931364, -0.104566, 3.953519, 0, 0.7137255, 1, 1,
0.03995531, 0.5477362, -0.3915944, 0, 0.7058824, 1, 1,
0.04997617, -0.2596269, 4.061515, 0, 0.6980392, 1, 1,
0.05424013, 1.364116, 0.7098125, 0, 0.6941177, 1, 1,
0.05480794, -0.2329956, 1.921689, 0, 0.6862745, 1, 1,
0.05578646, 0.1993663, -2.694086, 0, 0.682353, 1, 1,
0.05683066, -0.00379101, 3.057202, 0, 0.6745098, 1, 1,
0.05854248, -0.1811005, 2.850313, 0, 0.6705883, 1, 1,
0.06133502, -2.527858, 2.47618, 0, 0.6627451, 1, 1,
0.06407276, -0.4581499, 3.086396, 0, 0.6588235, 1, 1,
0.06409086, -0.1891645, 2.517033, 0, 0.6509804, 1, 1,
0.06700756, -1.204506, 4.37233, 0, 0.6470588, 1, 1,
0.06937715, 0.2724033, -0.08660953, 0, 0.6392157, 1, 1,
0.07647284, -0.6009752, 4.275511, 0, 0.6352941, 1, 1,
0.07957619, 2.257632, 0.2349225, 0, 0.627451, 1, 1,
0.08301091, -2.129423, 1.296373, 0, 0.6235294, 1, 1,
0.08690832, 0.4526702, 0.346738, 0, 0.6156863, 1, 1,
0.08766538, 1.401699, -2.133579, 0, 0.6117647, 1, 1,
0.09546538, 1.830955, 0.5107771, 0, 0.6039216, 1, 1,
0.104484, 0.6804587, 0.5602472, 0, 0.5960785, 1, 1,
0.1056108, 0.1121969, 1.964158, 0, 0.5921569, 1, 1,
0.1086101, -0.7592998, 2.953817, 0, 0.5843138, 1, 1,
0.1108999, -0.7683566, 3.196039, 0, 0.5803922, 1, 1,
0.1152832, -0.531204, 5.195416, 0, 0.572549, 1, 1,
0.1165088, -0.124383, 3.021193, 0, 0.5686275, 1, 1,
0.1173898, 0.5212356, 1.783439, 0, 0.5607843, 1, 1,
0.1182263, -1.744624, 3.057988, 0, 0.5568628, 1, 1,
0.1188094, 0.2920598, -0.05189107, 0, 0.5490196, 1, 1,
0.1249852, -1.38139, 4.469126, 0, 0.5450981, 1, 1,
0.1252595, 1.622617, -0.8911132, 0, 0.5372549, 1, 1,
0.1262893, -0.5961953, 1.827813, 0, 0.5333334, 1, 1,
0.1276437, -0.640002, 2.189422, 0, 0.5254902, 1, 1,
0.1307667, 0.169205, 0.6009381, 0, 0.5215687, 1, 1,
0.135199, 1.49164, 0.7204098, 0, 0.5137255, 1, 1,
0.1359851, 0.7291086, 0.4445789, 0, 0.509804, 1, 1,
0.1369889, -0.3227648, 4.300913, 0, 0.5019608, 1, 1,
0.1371778, 0.505034, -0.4759498, 0, 0.4941176, 1, 1,
0.1378296, 0.7285995, 2.759398, 0, 0.4901961, 1, 1,
0.1477236, 0.7871569, 0.1069418, 0, 0.4823529, 1, 1,
0.148691, -0.1275368, 2.948094, 0, 0.4784314, 1, 1,
0.1543498, 0.2234517, -1.035349, 0, 0.4705882, 1, 1,
0.1563769, -0.08157768, 4.117412, 0, 0.4666667, 1, 1,
0.1648194, -0.1660763, 2.573197, 0, 0.4588235, 1, 1,
0.1690113, -1.909416, 4.094234, 0, 0.454902, 1, 1,
0.1702403, 0.3966938, -0.4629277, 0, 0.4470588, 1, 1,
0.1719621, 0.4300607, 0.1602413, 0, 0.4431373, 1, 1,
0.1769641, -0.3345693, 2.454001, 0, 0.4352941, 1, 1,
0.1783153, 0.1815102, -1.533193, 0, 0.4313726, 1, 1,
0.1912502, 1.479061, 0.6405882, 0, 0.4235294, 1, 1,
0.1933854, -0.279059, 2.673266, 0, 0.4196078, 1, 1,
0.1942089, 1.975961, -0.001953679, 0, 0.4117647, 1, 1,
0.1947247, 0.8091964, 0.224331, 0, 0.4078431, 1, 1,
0.196015, 0.4141784, -1.131867, 0, 0.4, 1, 1,
0.1993618, 1.749677, -0.01748592, 0, 0.3921569, 1, 1,
0.2003335, 1.391253, 0.06292854, 0, 0.3882353, 1, 1,
0.200816, -0.4356044, 3.396322, 0, 0.3803922, 1, 1,
0.2069523, 0.9692631, 1.283108, 0, 0.3764706, 1, 1,
0.2117832, 0.9947661, 0.4905636, 0, 0.3686275, 1, 1,
0.2179826, 0.6749437, 2.323117, 0, 0.3647059, 1, 1,
0.2184408, 0.2353026, 0.01293062, 0, 0.3568628, 1, 1,
0.2198433, -0.184397, 1.925392, 0, 0.3529412, 1, 1,
0.2210814, 0.9893112, 0.2044541, 0, 0.345098, 1, 1,
0.2212219, 0.8672079, -0.3017178, 0, 0.3411765, 1, 1,
0.221266, 0.04599125, 2.11615, 0, 0.3333333, 1, 1,
0.2240269, 2.1953, 0.2309166, 0, 0.3294118, 1, 1,
0.232984, -0.9944233, 2.066637, 0, 0.3215686, 1, 1,
0.2363988, -0.6601755, 4.556568, 0, 0.3176471, 1, 1,
0.2396675, -0.6506775, 3.018605, 0, 0.3098039, 1, 1,
0.2432783, -0.3583425, 2.623332, 0, 0.3058824, 1, 1,
0.2442831, 1.662149, 0.839964, 0, 0.2980392, 1, 1,
0.2452181, -0.06050365, 3.60149, 0, 0.2901961, 1, 1,
0.2458913, -0.9245666, 2.297028, 0, 0.2862745, 1, 1,
0.2501842, -0.3335862, 3.519743, 0, 0.2784314, 1, 1,
0.2569877, 0.787832, 1.410502, 0, 0.2745098, 1, 1,
0.2598474, 0.3489259, 0.501983, 0, 0.2666667, 1, 1,
0.2607544, 0.1499982, 3.163378, 0, 0.2627451, 1, 1,
0.2630508, -0.7032427, 1.313097, 0, 0.254902, 1, 1,
0.2663119, 0.6781118, 1.351921, 0, 0.2509804, 1, 1,
0.2672438, 0.01463216, 1.432032, 0, 0.2431373, 1, 1,
0.2672765, 0.476171, 0.1282586, 0, 0.2392157, 1, 1,
0.2677399, 0.1117246, -0.6279829, 0, 0.2313726, 1, 1,
0.2690981, 0.9717966, 2.101842, 0, 0.227451, 1, 1,
0.2693981, 0.1668079, 1.401903, 0, 0.2196078, 1, 1,
0.2766843, -1.364818, 3.350854, 0, 0.2156863, 1, 1,
0.2775191, 0.8474435, 0.9294852, 0, 0.2078431, 1, 1,
0.2777466, -0.01241854, 0.9692251, 0, 0.2039216, 1, 1,
0.2782398, -0.3593622, 2.937626, 0, 0.1960784, 1, 1,
0.2840282, -0.7162436, 1.210231, 0, 0.1882353, 1, 1,
0.286004, -0.152764, 0.922478, 0, 0.1843137, 1, 1,
0.2869503, 0.09240017, 0.1059847, 0, 0.1764706, 1, 1,
0.292976, -0.8809704, 2.107306, 0, 0.172549, 1, 1,
0.2938899, -1.216339, 3.499051, 0, 0.1647059, 1, 1,
0.3053599, 2.052981, 1.112048, 0, 0.1607843, 1, 1,
0.3069682, 1.085765, -0.9588982, 0, 0.1529412, 1, 1,
0.3073182, -1.303844, 2.974515, 0, 0.1490196, 1, 1,
0.3098949, 1.876825, 0.3556333, 0, 0.1411765, 1, 1,
0.3111014, 0.2338391, 3.040527, 0, 0.1372549, 1, 1,
0.3128386, 0.9927684, -0.2406235, 0, 0.1294118, 1, 1,
0.3128756, -0.2054854, 1.798889, 0, 0.1254902, 1, 1,
0.3191923, 0.1350307, -0.1879778, 0, 0.1176471, 1, 1,
0.3203724, -0.5125419, 1.493155, 0, 0.1137255, 1, 1,
0.3291772, 0.09100419, 0.7610917, 0, 0.1058824, 1, 1,
0.3295013, -0.2471395, 2.932653, 0, 0.09803922, 1, 1,
0.3329838, -0.1561007, 3.312087, 0, 0.09411765, 1, 1,
0.3353559, 1.160354, 0.002031682, 0, 0.08627451, 1, 1,
0.3365398, 0.1603613, 2.688896, 0, 0.08235294, 1, 1,
0.3387858, -1.509319, 2.290364, 0, 0.07450981, 1, 1,
0.3392067, -0.9088669, 2.358896, 0, 0.07058824, 1, 1,
0.3409871, 0.3138468, -0.4486454, 0, 0.0627451, 1, 1,
0.3429772, 0.6992458, 3.345508, 0, 0.05882353, 1, 1,
0.344865, -0.1756763, 1.205153, 0, 0.05098039, 1, 1,
0.3536243, 0.3650867, -1.120971, 0, 0.04705882, 1, 1,
0.3553323, -0.1133757, 1.582643, 0, 0.03921569, 1, 1,
0.3569813, 1.270707, -0.5791912, 0, 0.03529412, 1, 1,
0.3571996, 0.5802637, 1.643066, 0, 0.02745098, 1, 1,
0.3577732, 1.397022, 0.5337057, 0, 0.02352941, 1, 1,
0.3582484, -1.00858, 3.198727, 0, 0.01568628, 1, 1,
0.3584017, -0.9173448, 3.379139, 0, 0.01176471, 1, 1,
0.3631368, 0.7099991, 1.751215, 0, 0.003921569, 1, 1,
0.3646784, -1.000601, 3.143419, 0.003921569, 0, 1, 1,
0.3685237, 0.2531604, 0.6088008, 0.007843138, 0, 1, 1,
0.3696552, 2.175339, -0.3747765, 0.01568628, 0, 1, 1,
0.3718416, -0.6392837, 3.06679, 0.01960784, 0, 1, 1,
0.3719741, 1.958713, -1.21032, 0.02745098, 0, 1, 1,
0.3727513, -0.8593607, 4.105965, 0.03137255, 0, 1, 1,
0.3744267, -0.1982025, 1.035156, 0.03921569, 0, 1, 1,
0.3813044, -0.6927859, 0.9585425, 0.04313726, 0, 1, 1,
0.3851561, 0.4991995, 0.8243979, 0.05098039, 0, 1, 1,
0.3854133, -0.08633694, 0.7989623, 0.05490196, 0, 1, 1,
0.3930647, -0.1321257, 0.889734, 0.0627451, 0, 1, 1,
0.3933183, -2.023385, 1.127842, 0.06666667, 0, 1, 1,
0.3938267, -1.13212, 3.243467, 0.07450981, 0, 1, 1,
0.3939572, -0.2357597, 2.198245, 0.07843138, 0, 1, 1,
0.4026164, -0.6607862, 1.388121, 0.08627451, 0, 1, 1,
0.4029498, 0.7036313, 0.3463401, 0.09019608, 0, 1, 1,
0.4104017, 0.3254215, 2.421052, 0.09803922, 0, 1, 1,
0.4158083, 0.01313625, 1.309786, 0.1058824, 0, 1, 1,
0.4182708, -0.02873122, 0.7085082, 0.1098039, 0, 1, 1,
0.4245654, -1.657043, 1.573851, 0.1176471, 0, 1, 1,
0.4252454, 0.4265883, 2.106557, 0.1215686, 0, 1, 1,
0.4261923, 0.008495932, 0.7192947, 0.1294118, 0, 1, 1,
0.428862, -0.008752606, -0.01423184, 0.1333333, 0, 1, 1,
0.4302814, 1.007715, 0.2006725, 0.1411765, 0, 1, 1,
0.431889, -0.4244474, 3.24779, 0.145098, 0, 1, 1,
0.4321675, -1.052954, 3.649645, 0.1529412, 0, 1, 1,
0.4348885, 0.8174691, -0.8392342, 0.1568628, 0, 1, 1,
0.4355933, -0.3642896, 3.726812, 0.1647059, 0, 1, 1,
0.43738, 0.4383311, 1.384829, 0.1686275, 0, 1, 1,
0.4388598, 1.775345, 0.6852639, 0.1764706, 0, 1, 1,
0.4431444, 0.4571872, 0.3171685, 0.1803922, 0, 1, 1,
0.4451222, -0.187166, 2.671719, 0.1882353, 0, 1, 1,
0.4487444, -0.8607629, 2.164453, 0.1921569, 0, 1, 1,
0.4545229, 2.343462, 0.6865825, 0.2, 0, 1, 1,
0.4574718, -0.03627326, 0.7557237, 0.2078431, 0, 1, 1,
0.464268, 1.714672, 0.73972, 0.2117647, 0, 1, 1,
0.4745448, -0.3937646, 2.207848, 0.2196078, 0, 1, 1,
0.474578, 0.04030841, 1.687843, 0.2235294, 0, 1, 1,
0.4776163, 0.3124694, -1.142344, 0.2313726, 0, 1, 1,
0.4785622, 0.669274, -1.312974, 0.2352941, 0, 1, 1,
0.4796361, 1.081371, 1.894338, 0.2431373, 0, 1, 1,
0.479911, -0.2454693, 2.054667, 0.2470588, 0, 1, 1,
0.4806352, -0.09957666, 2.17681, 0.254902, 0, 1, 1,
0.4981355, 0.06355444, 1.650812, 0.2588235, 0, 1, 1,
0.5063995, 1.652163, -0.461962, 0.2666667, 0, 1, 1,
0.5084065, -0.5819209, 3.261465, 0.2705882, 0, 1, 1,
0.5121158, 0.9482526, 1.688685, 0.2784314, 0, 1, 1,
0.5132684, -0.2945535, 1.498387, 0.282353, 0, 1, 1,
0.5175089, -0.4705567, 1.144252, 0.2901961, 0, 1, 1,
0.5205802, 1.384489, -0.944087, 0.2941177, 0, 1, 1,
0.5230603, -0.930837, 2.61949, 0.3019608, 0, 1, 1,
0.5299111, -1.436225, 4.332911, 0.3098039, 0, 1, 1,
0.5304875, 0.1577507, 1.502296, 0.3137255, 0, 1, 1,
0.533534, -0.4475805, 1.067328, 0.3215686, 0, 1, 1,
0.5337653, 0.09208425, 0.4232858, 0.3254902, 0, 1, 1,
0.534051, 0.7489661, -0.003960086, 0.3333333, 0, 1, 1,
0.5392944, -1.124086, 3.109847, 0.3372549, 0, 1, 1,
0.5441903, 0.005945281, 4.367476, 0.345098, 0, 1, 1,
0.5520865, 0.8708249, 0.8877078, 0.3490196, 0, 1, 1,
0.5525019, -0.9321278, 1.785914, 0.3568628, 0, 1, 1,
0.5544463, 0.5355018, 0.8094575, 0.3607843, 0, 1, 1,
0.5558007, 1.83981, 0.619508, 0.3686275, 0, 1, 1,
0.5575542, -0.9650842, 2.410002, 0.372549, 0, 1, 1,
0.5578783, -1.227131, 3.004453, 0.3803922, 0, 1, 1,
0.5616541, 1.109007, 0.3990467, 0.3843137, 0, 1, 1,
0.5619656, -0.9695988, 3.139857, 0.3921569, 0, 1, 1,
0.5633668, 0.4709451, 0.1718497, 0.3960784, 0, 1, 1,
0.5660856, -0.2926791, 0.7457166, 0.4039216, 0, 1, 1,
0.5677662, 0.9391283, 0.5116286, 0.4117647, 0, 1, 1,
0.568458, -1.939029, 2.903011, 0.4156863, 0, 1, 1,
0.5687768, -1.512901, 4.124245, 0.4235294, 0, 1, 1,
0.575116, 0.8274585, 0.6452897, 0.427451, 0, 1, 1,
0.5759102, -0.2367183, 0.7589614, 0.4352941, 0, 1, 1,
0.5810692, 0.008010427, 1.412003, 0.4392157, 0, 1, 1,
0.5831964, 0.5516003, 1.794378, 0.4470588, 0, 1, 1,
0.585043, -0.6454718, 2.672383, 0.4509804, 0, 1, 1,
0.5869638, -0.1538848, 0.3093556, 0.4588235, 0, 1, 1,
0.601359, 1.443789, -1.402319, 0.4627451, 0, 1, 1,
0.6025963, -0.2605972, 0.08415331, 0.4705882, 0, 1, 1,
0.6057176, -2.138483, 2.684915, 0.4745098, 0, 1, 1,
0.6076071, 0.1968745, 1.459227, 0.4823529, 0, 1, 1,
0.6206438, -0.3910042, 1.508847, 0.4862745, 0, 1, 1,
0.6207342, 0.6088642, 0.1172237, 0.4941176, 0, 1, 1,
0.6210941, -0.08735603, 1.088826, 0.5019608, 0, 1, 1,
0.6249841, -1.310279, 5.045136, 0.5058824, 0, 1, 1,
0.6289304, 0.3762781, 1.460095, 0.5137255, 0, 1, 1,
0.6310188, -1.13084, 0.05314756, 0.5176471, 0, 1, 1,
0.6347812, -1.741252, 4.524123, 0.5254902, 0, 1, 1,
0.6371519, 0.1615615, 2.164632, 0.5294118, 0, 1, 1,
0.6377658, 1.152117, 1.489597, 0.5372549, 0, 1, 1,
0.6391153, -1.734981, 2.789007, 0.5411765, 0, 1, 1,
0.6464876, -0.3072971, 1.84744, 0.5490196, 0, 1, 1,
0.6492246, -0.3611653, 0.5870199, 0.5529412, 0, 1, 1,
0.6524642, -1.340791, 1.920808, 0.5607843, 0, 1, 1,
0.6534497, -0.7995447, 2.401399, 0.5647059, 0, 1, 1,
0.6565174, -1.739226, 2.589308, 0.572549, 0, 1, 1,
0.6589435, -1.245604, 4.174212, 0.5764706, 0, 1, 1,
0.6595139, -0.5326481, 4.139939, 0.5843138, 0, 1, 1,
0.6610015, -1.088526, 2.421497, 0.5882353, 0, 1, 1,
0.6647384, -0.3036154, 1.6432, 0.5960785, 0, 1, 1,
0.6659116, 0.1490274, 1.682527, 0.6039216, 0, 1, 1,
0.6669526, -1.009125, 2.135799, 0.6078432, 0, 1, 1,
0.6720062, 0.6634049, -0.6105015, 0.6156863, 0, 1, 1,
0.6761013, 0.9321057, 1.134678, 0.6196079, 0, 1, 1,
0.6768358, 0.3353239, 0.8174332, 0.627451, 0, 1, 1,
0.684138, -0.3627745, 1.000473, 0.6313726, 0, 1, 1,
0.6867313, -0.1641378, 1.828129, 0.6392157, 0, 1, 1,
0.688025, -1.073168, 3.240332, 0.6431373, 0, 1, 1,
0.6889163, 0.2842148, 0.2047682, 0.6509804, 0, 1, 1,
0.6902917, 0.5584517, 0.2512276, 0.654902, 0, 1, 1,
0.6911086, -0.2334211, 2.070866, 0.6627451, 0, 1, 1,
0.6913649, 1.85465, 0.4584768, 0.6666667, 0, 1, 1,
0.6931787, -1.186177, 3.50489, 0.6745098, 0, 1, 1,
0.6934323, 0.4299722, 0.9112646, 0.6784314, 0, 1, 1,
0.6936609, 1.116484, 1.024294, 0.6862745, 0, 1, 1,
0.6959791, -0.4784176, 2.474467, 0.6901961, 0, 1, 1,
0.6979104, 1.539427, 0.005908979, 0.6980392, 0, 1, 1,
0.6990386, 0.9067021, 0.3577479, 0.7058824, 0, 1, 1,
0.6998521, 0.9771919, 0.2285833, 0.7098039, 0, 1, 1,
0.7001067, 0.6761848, 0.9222476, 0.7176471, 0, 1, 1,
0.7091842, 0.3084891, 1.946404, 0.7215686, 0, 1, 1,
0.7100434, 0.1623928, 1.868205, 0.7294118, 0, 1, 1,
0.7105457, -2.320779, 4.620788, 0.7333333, 0, 1, 1,
0.7110045, 0.5722561, 0.8919865, 0.7411765, 0, 1, 1,
0.7194059, -1.036592, 1.572844, 0.7450981, 0, 1, 1,
0.7289877, 1.164902, 1.081757, 0.7529412, 0, 1, 1,
0.7303432, -1.733951, 4.58088, 0.7568628, 0, 1, 1,
0.7399799, 0.05995176, 3.535855, 0.7647059, 0, 1, 1,
0.740811, -1.650179, 2.113158, 0.7686275, 0, 1, 1,
0.7442025, -1.134598, 3.739888, 0.7764706, 0, 1, 1,
0.7508894, -0.03707556, 2.578077, 0.7803922, 0, 1, 1,
0.751027, -0.2561399, 2.881212, 0.7882353, 0, 1, 1,
0.7618762, 0.1047346, 0.6510099, 0.7921569, 0, 1, 1,
0.7621351, 0.1697165, -0.6478277, 0.8, 0, 1, 1,
0.7652976, 0.09519285, 1.497812, 0.8078431, 0, 1, 1,
0.7702875, 0.5637879, 2.350888, 0.8117647, 0, 1, 1,
0.7705692, 2.77661, -0.1447783, 0.8196079, 0, 1, 1,
0.7710295, 1.407947, 0.1390455, 0.8235294, 0, 1, 1,
0.7788954, -0.2073226, 2.230449, 0.8313726, 0, 1, 1,
0.7878974, 0.4083138, 3.232414, 0.8352941, 0, 1, 1,
0.7879325, -0.7397702, 2.736758, 0.8431373, 0, 1, 1,
0.7896474, -1.832961, 2.476731, 0.8470588, 0, 1, 1,
0.7984875, -0.3303493, 1.195264, 0.854902, 0, 1, 1,
0.8041515, -0.332992, 2.359314, 0.8588235, 0, 1, 1,
0.8156324, 0.9450819, -0.2174499, 0.8666667, 0, 1, 1,
0.8195385, 0.2168932, 2.151178, 0.8705882, 0, 1, 1,
0.8245636, -1.203697, 3.109703, 0.8784314, 0, 1, 1,
0.8329485, 1.237919, 0.5671369, 0.8823529, 0, 1, 1,
0.8367067, 0.5825816, -0.8513207, 0.8901961, 0, 1, 1,
0.8444836, 0.1087837, -0.8305151, 0.8941177, 0, 1, 1,
0.8481835, -0.03200487, 2.268417, 0.9019608, 0, 1, 1,
0.8483897, -0.1250851, -0.1012938, 0.9098039, 0, 1, 1,
0.852092, -1.985612, 1.333888, 0.9137255, 0, 1, 1,
0.8541318, -0.01478199, 2.65169, 0.9215686, 0, 1, 1,
0.8572392, -1.638514, 2.07642, 0.9254902, 0, 1, 1,
0.85947, 0.3915456, 1.397537, 0.9333333, 0, 1, 1,
0.8670839, 0.7356868, 0.1479811, 0.9372549, 0, 1, 1,
0.8690696, 0.6771371, 0.6473142, 0.945098, 0, 1, 1,
0.8729132, -1.641975, 3.374424, 0.9490196, 0, 1, 1,
0.8746495, 0.05157369, 0.2293742, 0.9568627, 0, 1, 1,
0.8747002, -0.1280107, 1.769261, 0.9607843, 0, 1, 1,
0.8785591, -0.5992771, 0.5629715, 0.9686275, 0, 1, 1,
0.8867345, 0.874468, -1.020593, 0.972549, 0, 1, 1,
0.8935803, -1.851466, 0.7930729, 0.9803922, 0, 1, 1,
0.8968919, 0.3688031, 1.513091, 0.9843137, 0, 1, 1,
0.8972904, -0.9587932, 2.722502, 0.9921569, 0, 1, 1,
0.9032966, -1.021371, 4.201243, 0.9960784, 0, 1, 1,
0.9059467, -0.7147707, 0.0606716, 1, 0, 0.9960784, 1,
0.9077888, -0.8766957, 2.59286, 1, 0, 0.9882353, 1,
0.9121019, 1.318451, 0.3354839, 1, 0, 0.9843137, 1,
0.9254298, 1.271014, -1.100907, 1, 0, 0.9764706, 1,
0.925851, -1.396269, 2.428079, 1, 0, 0.972549, 1,
0.9260545, 0.3745766, 1.163642, 1, 0, 0.9647059, 1,
0.9263594, 1.559814, 0.1504215, 1, 0, 0.9607843, 1,
0.9331539, 1.795488, -0.01196956, 1, 0, 0.9529412, 1,
0.9387645, 0.8493049, 2.312732, 1, 0, 0.9490196, 1,
0.946297, -1.270276, 2.943459, 1, 0, 0.9411765, 1,
0.9479904, 0.242392, 0.1548133, 1, 0, 0.9372549, 1,
0.949499, 0.2633443, 2.408077, 1, 0, 0.9294118, 1,
0.954927, 0.6936951, 2.407056, 1, 0, 0.9254902, 1,
0.9566884, -0.9284682, 4.400961, 1, 0, 0.9176471, 1,
0.9686248, -1.334235, 4.168216, 1, 0, 0.9137255, 1,
0.9688983, -0.9096234, 1.589832, 1, 0, 0.9058824, 1,
0.976868, 1.277934, 0.6172354, 1, 0, 0.9019608, 1,
0.9814066, 1.469756, 0.5503837, 1, 0, 0.8941177, 1,
0.9815169, -1.043134, 2.155841, 1, 0, 0.8862745, 1,
0.9837682, -0.2408415, 1.734881, 1, 0, 0.8823529, 1,
0.9902784, 0.5520808, 0.1930746, 1, 0, 0.8745098, 1,
0.9929196, 0.4165001, 1.20284, 1, 0, 0.8705882, 1,
0.9939365, -1.245284, 2.413262, 1, 0, 0.8627451, 1,
1.004898, -0.1589645, 2.175546, 1, 0, 0.8588235, 1,
1.01205, -0.3724182, 1.137732, 1, 0, 0.8509804, 1,
1.012053, 0.5896966, 2.224167, 1, 0, 0.8470588, 1,
1.015014, -0.6707736, 3.098675, 1, 0, 0.8392157, 1,
1.030158, -0.1980963, 2.245478, 1, 0, 0.8352941, 1,
1.031323, 0.1527795, 1.321736, 1, 0, 0.827451, 1,
1.034651, -0.2253581, 1.376029, 1, 0, 0.8235294, 1,
1.039382, -0.6288452, 1.643517, 1, 0, 0.8156863, 1,
1.040822, 0.3813879, -0.7569472, 1, 0, 0.8117647, 1,
1.042626, -0.08736422, 1.980844, 1, 0, 0.8039216, 1,
1.045773, -0.2792278, 2.114249, 1, 0, 0.7960784, 1,
1.050425, 0.1285006, 2.39549, 1, 0, 0.7921569, 1,
1.058244, 0.5046057, 0.4319324, 1, 0, 0.7843137, 1,
1.059278, 1.226666, 1.183334, 1, 0, 0.7803922, 1,
1.059811, -1.566688, 2.011459, 1, 0, 0.772549, 1,
1.067734, -0.7710758, 2.767387, 1, 0, 0.7686275, 1,
1.076126, -0.05791304, 0.04989499, 1, 0, 0.7607843, 1,
1.081846, -0.5775512, 2.569183, 1, 0, 0.7568628, 1,
1.08578, -1.005417, 1.86294, 1, 0, 0.7490196, 1,
1.086004, 1.367461, -1.489285, 1, 0, 0.7450981, 1,
1.087174, -0.9383937, 1.515114, 1, 0, 0.7372549, 1,
1.089946, 0.4634989, 1.423406, 1, 0, 0.7333333, 1,
1.093708, -1.07133, 3.932833, 1, 0, 0.7254902, 1,
1.094018, 0.2079702, 1.03283, 1, 0, 0.7215686, 1,
1.099406, 2.658352, -0.6088859, 1, 0, 0.7137255, 1,
1.112877, -0.2942169, 1.926752, 1, 0, 0.7098039, 1,
1.112959, -0.8119688, 1.649508, 1, 0, 0.7019608, 1,
1.119133, -0.6027967, 3.370613, 1, 0, 0.6941177, 1,
1.125673, 2.09881, -0.2185612, 1, 0, 0.6901961, 1,
1.125763, 0.3359098, 3.09557, 1, 0, 0.682353, 1,
1.134568, 0.1629681, 1.238304, 1, 0, 0.6784314, 1,
1.141989, 1.495389, -1.074454, 1, 0, 0.6705883, 1,
1.142078, 1.150187, 0.3800502, 1, 0, 0.6666667, 1,
1.146696, -2.138132, 2.466112, 1, 0, 0.6588235, 1,
1.152705, -1.346286, 2.328589, 1, 0, 0.654902, 1,
1.155544, 0.2374774, 3.228735, 1, 0, 0.6470588, 1,
1.156902, 0.6227393, 0.06182708, 1, 0, 0.6431373, 1,
1.180066, -0.004448795, 0.6726596, 1, 0, 0.6352941, 1,
1.180181, -1.09132, 2.178142, 1, 0, 0.6313726, 1,
1.180532, -0.4334565, 2.325685, 1, 0, 0.6235294, 1,
1.184519, 0.5182592, 1.739532, 1, 0, 0.6196079, 1,
1.194862, -0.7409582, 2.692142, 1, 0, 0.6117647, 1,
1.204368, 0.425728, 1.424825, 1, 0, 0.6078432, 1,
1.20937, -1.14432, 1.235617, 1, 0, 0.6, 1,
1.215043, 0.8457375, -0.7890424, 1, 0, 0.5921569, 1,
1.254046, -1.378232, 4.11016, 1, 0, 0.5882353, 1,
1.263989, -0.7679425, 0.3571967, 1, 0, 0.5803922, 1,
1.282923, 1.921814, 0.4737043, 1, 0, 0.5764706, 1,
1.283868, -0.919673, 2.521735, 1, 0, 0.5686275, 1,
1.293158, -0.2106925, 1.180041, 1, 0, 0.5647059, 1,
1.29638, 1.352175, 0.8985969, 1, 0, 0.5568628, 1,
1.303485, -0.3088787, 2.421743, 1, 0, 0.5529412, 1,
1.314834, -0.4501163, 3.063811, 1, 0, 0.5450981, 1,
1.323182, 0.4771762, 1.730066, 1, 0, 0.5411765, 1,
1.323453, 0.2962528, 1.587542, 1, 0, 0.5333334, 1,
1.330022, -0.2518513, 1.981413, 1, 0, 0.5294118, 1,
1.335733, -0.02906437, 1.203374, 1, 0, 0.5215687, 1,
1.347363, 0.3789361, 2.595826, 1, 0, 0.5176471, 1,
1.348409, 0.4227809, 1.729527, 1, 0, 0.509804, 1,
1.352533, 0.8235271, 2.11196, 1, 0, 0.5058824, 1,
1.364406, 1.600773, 3.190641, 1, 0, 0.4980392, 1,
1.372228, -0.8054646, 0.1944394, 1, 0, 0.4901961, 1,
1.372411, -1.153327, 3.10364, 1, 0, 0.4862745, 1,
1.375048, -0.3833506, 0.745475, 1, 0, 0.4784314, 1,
1.389283, 0.2346734, 1.435551, 1, 0, 0.4745098, 1,
1.404779, -1.28371, 1.889426, 1, 0, 0.4666667, 1,
1.405021, -1.379497, 0.6803464, 1, 0, 0.4627451, 1,
1.407843, 0.2865515, 1.224165, 1, 0, 0.454902, 1,
1.408141, -0.8477264, 2.864151, 1, 0, 0.4509804, 1,
1.409543, 0.8205488, 0.2540716, 1, 0, 0.4431373, 1,
1.418406, 0.2630212, 0.04624158, 1, 0, 0.4392157, 1,
1.419555, -0.6558676, 1.922309, 1, 0, 0.4313726, 1,
1.420224, 1.206331, 1.736047, 1, 0, 0.427451, 1,
1.43372, -0.5393675, 1.958325, 1, 0, 0.4196078, 1,
1.437047, 0.5069862, 1.998867, 1, 0, 0.4156863, 1,
1.463045, -0.1058186, 0.7484285, 1, 0, 0.4078431, 1,
1.472661, -0.04336805, 1.200232, 1, 0, 0.4039216, 1,
1.476351, 0.6552604, 0.1446328, 1, 0, 0.3960784, 1,
1.481634, -0.4290373, 1.114415, 1, 0, 0.3882353, 1,
1.495391, 0.7419122, -0.08981009, 1, 0, 0.3843137, 1,
1.517998, 1.511362, 0.5787826, 1, 0, 0.3764706, 1,
1.521547, -0.9762437, 2.724695, 1, 0, 0.372549, 1,
1.522194, 1.061953, 1.730005, 1, 0, 0.3647059, 1,
1.524932, -1.249757, 2.886937, 1, 0, 0.3607843, 1,
1.532296, -0.3050322, 0.3540815, 1, 0, 0.3529412, 1,
1.534006, 0.209538, -0.3064961, 1, 0, 0.3490196, 1,
1.534391, -0.03694658, 2.863839, 1, 0, 0.3411765, 1,
1.536302, -0.3418012, 1.629274, 1, 0, 0.3372549, 1,
1.555138, 0.8341205, -0.268048, 1, 0, 0.3294118, 1,
1.568394, -0.08047992, 1.748541, 1, 0, 0.3254902, 1,
1.577384, -0.008764197, 2.277377, 1, 0, 0.3176471, 1,
1.578442, -1.362643, 1.836199, 1, 0, 0.3137255, 1,
1.579237, 0.7139624, 0.3431884, 1, 0, 0.3058824, 1,
1.581071, -0.1282012, 0.7920829, 1, 0, 0.2980392, 1,
1.58115, -1.579046, 1.907507, 1, 0, 0.2941177, 1,
1.594083, 0.2705262, 1.614473, 1, 0, 0.2862745, 1,
1.599595, 0.3917324, 1.527644, 1, 0, 0.282353, 1,
1.607692, 0.3629788, 0.6620412, 1, 0, 0.2745098, 1,
1.613695, -2.219906, 2.101689, 1, 0, 0.2705882, 1,
1.627669, 1.90028, -0.1990676, 1, 0, 0.2627451, 1,
1.635234, 1.074787, -0.901471, 1, 0, 0.2588235, 1,
1.66384, 0.8799047, 1.120333, 1, 0, 0.2509804, 1,
1.666182, 0.2792023, 1.1344, 1, 0, 0.2470588, 1,
1.695254, -1.313583, 2.038843, 1, 0, 0.2392157, 1,
1.701518, -0.484557, 3.141111, 1, 0, 0.2352941, 1,
1.727763, 1.157025, 0.02817564, 1, 0, 0.227451, 1,
1.734341, 0.7590185, 0.5007989, 1, 0, 0.2235294, 1,
1.741226, -0.842505, 1.610474, 1, 0, 0.2156863, 1,
1.749336, 0.587141, 2.72871, 1, 0, 0.2117647, 1,
1.762691, -2.811247, 2.361492, 1, 0, 0.2039216, 1,
1.776282, -1.856231, 4.551031, 1, 0, 0.1960784, 1,
1.777909, -0.1036079, 1.545521, 1, 0, 0.1921569, 1,
1.788389, -0.1276484, 1.979236, 1, 0, 0.1843137, 1,
1.80689, 1.062091, 0.9913294, 1, 0, 0.1803922, 1,
1.810933, 0.3793228, 0.07600083, 1, 0, 0.172549, 1,
1.815213, 1.115575, 0.6509452, 1, 0, 0.1686275, 1,
1.845206, 0.6127381, 1.490464, 1, 0, 0.1607843, 1,
1.862448, -0.6894647, 2.118443, 1, 0, 0.1568628, 1,
1.902277, 0.4568355, -0.7554685, 1, 0, 0.1490196, 1,
1.912511, 0.1201867, 0.2509432, 1, 0, 0.145098, 1,
1.949083, -0.9384212, 1.317273, 1, 0, 0.1372549, 1,
1.982683, -0.7382346, 3.442436, 1, 0, 0.1333333, 1,
2.003395, 0.05305608, 4.44796, 1, 0, 0.1254902, 1,
2.015793, 0.3721727, 2.501311, 1, 0, 0.1215686, 1,
2.048006, 0.2515607, 1.860982, 1, 0, 0.1137255, 1,
2.061749, -0.9145007, 3.258219, 1, 0, 0.1098039, 1,
2.066096, 1.167026, 0.4845, 1, 0, 0.1019608, 1,
2.088843, 0.2868518, 2.551953, 1, 0, 0.09411765, 1,
2.112684, -1.829841, 0.1343787, 1, 0, 0.09019608, 1,
2.116474, -0.3077069, 1.048766, 1, 0, 0.08235294, 1,
2.122896, -1.334562, 3.296856, 1, 0, 0.07843138, 1,
2.134626, -0.261013, 1.034561, 1, 0, 0.07058824, 1,
2.140928, -1.012453, 3.432406, 1, 0, 0.06666667, 1,
2.142583, 1.354089, -0.4577563, 1, 0, 0.05882353, 1,
2.174475, -0.5740882, 0.4094509, 1, 0, 0.05490196, 1,
2.349026, -0.5211505, 0.7590345, 1, 0, 0.04705882, 1,
2.543667, 0.6126577, 0.4540019, 1, 0, 0.04313726, 1,
2.554361, -0.4425489, 1.965096, 1, 0, 0.03529412, 1,
2.570632, -0.2797687, 2.340138, 1, 0, 0.03137255, 1,
2.810538, 1.685954, 0.5176249, 1, 0, 0.02352941, 1,
2.830132, -0.7866938, 1.877093, 1, 0, 0.01960784, 1,
3.140548, -0.04315969, 0.5111093, 1, 0, 0.01176471, 1,
3.594797, -0.2884609, 1.706256, 1, 0, 0.007843138, 1
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
0.2253186, -3.801878, -8.1728, 0, -0.5, 0.5, 0.5,
0.2253186, -3.801878, -8.1728, 1, -0.5, 0.5, 0.5,
0.2253186, -3.801878, -8.1728, 1, 1.5, 0.5, 0.5,
0.2253186, -3.801878, -8.1728, 0, 1.5, 0.5, 0.5
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
-4.286413, 0.1109706, -8.1728, 0, -0.5, 0.5, 0.5,
-4.286413, 0.1109706, -8.1728, 1, -0.5, 0.5, 0.5,
-4.286413, 0.1109706, -8.1728, 1, 1.5, 0.5, 0.5,
-4.286413, 0.1109706, -8.1728, 0, 1.5, 0.5, 0.5
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
-4.286413, -3.801878, -0.5199394, 0, -0.5, 0.5, 0.5,
-4.286413, -3.801878, -0.5199394, 1, -0.5, 0.5, 0.5,
-4.286413, -3.801878, -0.5199394, 1, 1.5, 0.5, 0.5,
-4.286413, -3.801878, -0.5199394, 0, 1.5, 0.5, 0.5
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
-3, -2.898913, -6.406755,
3, -2.898913, -6.406755,
-3, -2.898913, -6.406755,
-3, -3.049407, -6.701096,
-2, -2.898913, -6.406755,
-2, -3.049407, -6.701096,
-1, -2.898913, -6.406755,
-1, -3.049407, -6.701096,
0, -2.898913, -6.406755,
0, -3.049407, -6.701096,
1, -2.898913, -6.406755,
1, -3.049407, -6.701096,
2, -2.898913, -6.406755,
2, -3.049407, -6.701096,
3, -2.898913, -6.406755,
3, -3.049407, -6.701096
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
-3, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
-3, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
-3, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
-3, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
-2, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
-2, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
-2, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
-2, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
-1, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
-1, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
-1, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
-1, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
0, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
0, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
0, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
0, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
1, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
1, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
1, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
1, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
2, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
2, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
2, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
2, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5,
3, -3.350396, -7.289778, 0, -0.5, 0.5, 0.5,
3, -3.350396, -7.289778, 1, -0.5, 0.5, 0.5,
3, -3.350396, -7.289778, 1, 1.5, 0.5, 0.5,
3, -3.350396, -7.289778, 0, 1.5, 0.5, 0.5
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
-3.245244, -2, -6.406755,
-3.245244, 3, -6.406755,
-3.245244, -2, -6.406755,
-3.418772, -2, -6.701096,
-3.245244, -1, -6.406755,
-3.418772, -1, -6.701096,
-3.245244, 0, -6.406755,
-3.418772, 0, -6.701096,
-3.245244, 1, -6.406755,
-3.418772, 1, -6.701096,
-3.245244, 2, -6.406755,
-3.418772, 2, -6.701096,
-3.245244, 3, -6.406755,
-3.418772, 3, -6.701096
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
-3.765828, -2, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, -2, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, -2, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, -2, -7.289778, 0, 1.5, 0.5, 0.5,
-3.765828, -1, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, -1, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, -1, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, -1, -7.289778, 0, 1.5, 0.5, 0.5,
-3.765828, 0, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, 0, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, 0, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, 0, -7.289778, 0, 1.5, 0.5, 0.5,
-3.765828, 1, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, 1, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, 1, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, 1, -7.289778, 0, 1.5, 0.5, 0.5,
-3.765828, 2, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, 2, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, 2, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, 2, -7.289778, 0, 1.5, 0.5, 0.5,
-3.765828, 3, -7.289778, 0, -0.5, 0.5, 0.5,
-3.765828, 3, -7.289778, 1, -0.5, 0.5, 0.5,
-3.765828, 3, -7.289778, 1, 1.5, 0.5, 0.5,
-3.765828, 3, -7.289778, 0, 1.5, 0.5, 0.5
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
-3.245244, -2.898913, -6,
-3.245244, -2.898913, 4,
-3.245244, -2.898913, -6,
-3.418772, -3.049407, -6,
-3.245244, -2.898913, -4,
-3.418772, -3.049407, -4,
-3.245244, -2.898913, -2,
-3.418772, -3.049407, -2,
-3.245244, -2.898913, 0,
-3.418772, -3.049407, 0,
-3.245244, -2.898913, 2,
-3.418772, -3.049407, 2,
-3.245244, -2.898913, 4,
-3.418772, -3.049407, 4
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
-3.765828, -3.350396, -6, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -6, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -6, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, -6, 0, 1.5, 0.5, 0.5,
-3.765828, -3.350396, -4, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -4, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -4, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, -4, 0, 1.5, 0.5, 0.5,
-3.765828, -3.350396, -2, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -2, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, -2, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, -2, 0, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 0, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 0, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 0, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 0, 0, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 2, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 2, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 2, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 2, 0, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 4, 0, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 4, 1, -0.5, 0.5, 0.5,
-3.765828, -3.350396, 4, 1, 1.5, 0.5, 0.5,
-3.765828, -3.350396, 4, 0, 1.5, 0.5, 0.5
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
-3.245244, -2.898913, -6.406755,
-3.245244, 3.120854, -6.406755,
-3.245244, -2.898913, 5.366877,
-3.245244, 3.120854, 5.366877,
-3.245244, -2.898913, -6.406755,
-3.245244, -2.898913, 5.366877,
-3.245244, 3.120854, -6.406755,
-3.245244, 3.120854, 5.366877,
-3.245244, -2.898913, -6.406755,
3.695881, -2.898913, -6.406755,
-3.245244, -2.898913, 5.366877,
3.695881, -2.898913, 5.366877,
-3.245244, 3.120854, -6.406755,
3.695881, 3.120854, -6.406755,
-3.245244, 3.120854, 5.366877,
3.695881, 3.120854, 5.366877,
3.695881, -2.898913, -6.406755,
3.695881, 3.120854, -6.406755,
3.695881, -2.898913, 5.366877,
3.695881, 3.120854, 5.366877,
3.695881, -2.898913, -6.406755,
3.695881, -2.898913, 5.366877,
3.695881, 3.120854, -6.406755,
3.695881, 3.120854, 5.366877
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
var radius = 7.97466;
var distance = 35.48016;
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
mvMatrix.translate( -0.2253186, -0.1109706, 0.5199394 );
mvMatrix.scale( 1.242213, 1.432341, 0.7323449 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48016);
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
Chlormequat_chloride<-read.table("Chlormequat_chloride.xyz")
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
-3.14416, 1.383775, -0.6850901, 0, 0, 1, 1, 1,
-2.908911, -0.4409117, -0.2126815, 1, 0, 0, 1, 1,
-2.772228, 1.100563, -1.209824, 1, 0, 0, 1, 1,
-2.750558, -2.116142, -3.307698, 1, 0, 0, 1, 1,
-2.750289, 0.8939587, -2.221322, 1, 0, 0, 1, 1,
-2.722813, 1.233852, -0.7245889, 1, 0, 0, 1, 1,
-2.573859, -0.4209735, -1.127094, 0, 0, 0, 1, 1,
-2.511392, 0.3197689, -0.1792163, 0, 0, 0, 1, 1,
-2.482853, -0.4770652, -1.4199, 0, 0, 0, 1, 1,
-2.425148, 0.2245645, -2.198369, 0, 0, 0, 1, 1,
-2.422868, 0.7713822, -0.08171573, 0, 0, 0, 1, 1,
-2.377636, 0.3304937, -0.8636101, 0, 0, 0, 1, 1,
-2.268386, -0.5652996, -1.116106, 0, 0, 0, 1, 1,
-2.245906, -1.344335, -0.5454815, 1, 1, 1, 1, 1,
-2.165964, 0.08309688, -0.8805009, 1, 1, 1, 1, 1,
-2.148033, 0.9342374, -0.7679889, 1, 1, 1, 1, 1,
-2.145219, -0.6548485, -2.890781, 1, 1, 1, 1, 1,
-2.143539, -1.550438, -1.489358, 1, 1, 1, 1, 1,
-2.094658, -2.077473, -1.760218, 1, 1, 1, 1, 1,
-2.055632, -0.6234763, -2.131829, 1, 1, 1, 1, 1,
-2.034457, -0.7351348, -2.183486, 1, 1, 1, 1, 1,
-2.021663, 1.385968, -0.07913335, 1, 1, 1, 1, 1,
-2.00945, -0.7475918, -2.630912, 1, 1, 1, 1, 1,
-2.005333, 1.213481, -0.5828223, 1, 1, 1, 1, 1,
-1.997307, 1.058334, -0.2722045, 1, 1, 1, 1, 1,
-1.994627, 0.9690543, -1.323052, 1, 1, 1, 1, 1,
-1.953296, 0.2053336, -0.1117632, 1, 1, 1, 1, 1,
-1.951673, 0.5415808, -1.004591, 1, 1, 1, 1, 1,
-1.950597, -0.7413018, -1.970684, 0, 0, 1, 1, 1,
-1.938162, 0.01993514, -1.079473, 1, 0, 0, 1, 1,
-1.927685, 1.077856, -0.974124, 1, 0, 0, 1, 1,
-1.920044, -1.282481, -4.005402, 1, 0, 0, 1, 1,
-1.910292, 0.1531417, 0.1606268, 1, 0, 0, 1, 1,
-1.881666, 0.2162903, -0.9058176, 1, 0, 0, 1, 1,
-1.874462, 1.294878, -1.601578, 0, 0, 0, 1, 1,
-1.86167, -0.9735382, -2.594454, 0, 0, 0, 1, 1,
-1.848497, -0.6274135, -1.389823, 0, 0, 0, 1, 1,
-1.845524, 0.02123134, -1.01987, 0, 0, 0, 1, 1,
-1.841873, 0.4126032, -2.284869, 0, 0, 0, 1, 1,
-1.834608, 0.5254842, -1.82432, 0, 0, 0, 1, 1,
-1.833802, -0.6293624, -0.8051918, 0, 0, 0, 1, 1,
-1.821779, 0.6131977, -1.514258, 1, 1, 1, 1, 1,
-1.81573, -0.9161324, -1.376984, 1, 1, 1, 1, 1,
-1.789786, 1.161233, 0.4179783, 1, 1, 1, 1, 1,
-1.784384, -1.224081, -2.241835, 1, 1, 1, 1, 1,
-1.780592, 0.3189671, -2.553778, 1, 1, 1, 1, 1,
-1.761374, -1.367572, -2.642721, 1, 1, 1, 1, 1,
-1.745109, 0.1021526, -3.993767, 1, 1, 1, 1, 1,
-1.720602, -0.5218322, -2.610518, 1, 1, 1, 1, 1,
-1.719046, 0.1999185, -0.07834364, 1, 1, 1, 1, 1,
-1.714348, 0.2920319, -1.914392, 1, 1, 1, 1, 1,
-1.701646, 0.1004553, -2.955346, 1, 1, 1, 1, 1,
-1.69571, 1.604059, -1.353559, 1, 1, 1, 1, 1,
-1.69136, -0.3705269, -3.138785, 1, 1, 1, 1, 1,
-1.687566, 0.8462704, -0.8464262, 1, 1, 1, 1, 1,
-1.685521, -0.02878058, 0.602219, 1, 1, 1, 1, 1,
-1.684808, -0.07026516, -1.827073, 0, 0, 1, 1, 1,
-1.669479, -2.17451, -2.113151, 1, 0, 0, 1, 1,
-1.667208, -0.7940155, -0.143629, 1, 0, 0, 1, 1,
-1.639285, 0.06428928, -2.192623, 1, 0, 0, 1, 1,
-1.625391, -0.7800016, -3.495428, 1, 0, 0, 1, 1,
-1.610267, 0.3797543, -0.2048011, 1, 0, 0, 1, 1,
-1.600683, -0.09432226, -2.49839, 0, 0, 0, 1, 1,
-1.596681, 0.9361891, -0.7344035, 0, 0, 0, 1, 1,
-1.583827, 1.060106, -0.9176252, 0, 0, 0, 1, 1,
-1.5683, 0.5746797, -0.1864944, 0, 0, 0, 1, 1,
-1.558202, -1.356988, -2.040192, 0, 0, 0, 1, 1,
-1.5281, 0.800034, -1.13948, 0, 0, 0, 1, 1,
-1.526955, 1.285162, -1.244187, 0, 0, 0, 1, 1,
-1.497952, 0.7276392, -1.179894, 1, 1, 1, 1, 1,
-1.48252, -1.151482, -2.027104, 1, 1, 1, 1, 1,
-1.481512, 0.7609777, -1.253893, 1, 1, 1, 1, 1,
-1.479286, 0.01199115, -2.777447, 1, 1, 1, 1, 1,
-1.467589, 1.815484, -1.656766, 1, 1, 1, 1, 1,
-1.462005, -0.7577404, -1.482373, 1, 1, 1, 1, 1,
-1.457964, -0.5842299, -1.004609, 1, 1, 1, 1, 1,
-1.446681, -0.2842733, -2.538525, 1, 1, 1, 1, 1,
-1.436984, 0.2905569, 0.2303562, 1, 1, 1, 1, 1,
-1.432898, 0.3000407, -1.02589, 1, 1, 1, 1, 1,
-1.418812, -0.4010753, -2.579744, 1, 1, 1, 1, 1,
-1.416413, -0.4542624, -3.818859, 1, 1, 1, 1, 1,
-1.415596, -0.3941906, -1.619164, 1, 1, 1, 1, 1,
-1.390308, 0.2612391, -0.6553387, 1, 1, 1, 1, 1,
-1.386034, -0.3698465, -0.448784, 1, 1, 1, 1, 1,
-1.382197, 0.3614454, -3.882205, 0, 0, 1, 1, 1,
-1.38125, 0.07297174, -2.056011, 1, 0, 0, 1, 1,
-1.380483, -0.1063257, -2.619228, 1, 0, 0, 1, 1,
-1.372064, -0.1234702, 0.1980142, 1, 0, 0, 1, 1,
-1.368063, 0.5135604, -1.133009, 1, 0, 0, 1, 1,
-1.365747, -0.1322266, -1.82768, 1, 0, 0, 1, 1,
-1.364497, 1.718998, -2.634941, 0, 0, 0, 1, 1,
-1.346331, -0.4252729, -3.550225, 0, 0, 0, 1, 1,
-1.340839, 0.831741, -2.571954, 0, 0, 0, 1, 1,
-1.332289, 0.2599941, -0.3359445, 0, 0, 0, 1, 1,
-1.325478, 1.310688, -0.6225729, 0, 0, 0, 1, 1,
-1.323715, -1.649751, -0.4221447, 0, 0, 0, 1, 1,
-1.322524, -0.3304989, 0.07071467, 0, 0, 0, 1, 1,
-1.319765, 1.071572, -1.058735, 1, 1, 1, 1, 1,
-1.316389, -1.081461, 1.073569, 1, 1, 1, 1, 1,
-1.312544, 0.2892505, -0.7486005, 1, 1, 1, 1, 1,
-1.295433, 0.1105811, -0.6182444, 1, 1, 1, 1, 1,
-1.281222, 0.01524319, -3.770706, 1, 1, 1, 1, 1,
-1.277137, -0.288677, -2.174984, 1, 1, 1, 1, 1,
-1.275796, -1.263309, -1.516094, 1, 1, 1, 1, 1,
-1.263507, 1.743655, -1.602638, 1, 1, 1, 1, 1,
-1.249699, 2.003686, -1.24806, 1, 1, 1, 1, 1,
-1.246684, 0.3904987, -1.961405, 1, 1, 1, 1, 1,
-1.246358, -0.4975413, -1.148851, 1, 1, 1, 1, 1,
-1.246099, 0.9781948, 0.3709221, 1, 1, 1, 1, 1,
-1.245526, 0.01305069, -1.695245, 1, 1, 1, 1, 1,
-1.235747, -1.506194, -2.964592, 1, 1, 1, 1, 1,
-1.230099, 0.8185016, -0.1351242, 1, 1, 1, 1, 1,
-1.227542, 1.048821, -0.7607301, 0, 0, 1, 1, 1,
-1.227493, 0.2421216, -0.4882354, 1, 0, 0, 1, 1,
-1.210186, -0.3387544, -1.351349, 1, 0, 0, 1, 1,
-1.208131, 0.4651131, 0.3622147, 1, 0, 0, 1, 1,
-1.208064, 0.3828274, -3.063158, 1, 0, 0, 1, 1,
-1.201784, -0.5895857, -1.616408, 1, 0, 0, 1, 1,
-1.196149, 0.898435, -1.1169, 0, 0, 0, 1, 1,
-1.194479, -0.8599632, -1.384065, 0, 0, 0, 1, 1,
-1.194127, 1.475749, 0.8799995, 0, 0, 0, 1, 1,
-1.194042, -0.662729, -2.612889, 0, 0, 0, 1, 1,
-1.184937, 0.3737464, -2.088585, 0, 0, 0, 1, 1,
-1.182124, -0.1433114, -1.030838, 0, 0, 0, 1, 1,
-1.180906, -1.323695, -4.028861, 0, 0, 0, 1, 1,
-1.176558, -0.2031093, -2.422758, 1, 1, 1, 1, 1,
-1.171843, 0.4132691, -0.8891262, 1, 1, 1, 1, 1,
-1.171283, 1.683448, -0.9220616, 1, 1, 1, 1, 1,
-1.166016, 0.3684338, -0.3039678, 1, 1, 1, 1, 1,
-1.163124, -0.3673433, -2.598214, 1, 1, 1, 1, 1,
-1.146242, 0.7706724, -0.2025161, 1, 1, 1, 1, 1,
-1.145741, 0.1590318, -4.070727, 1, 1, 1, 1, 1,
-1.143582, 2.256188, 0.1513021, 1, 1, 1, 1, 1,
-1.143535, 1.226557, -2.056596, 1, 1, 1, 1, 1,
-1.13676, 0.1894689, -3.373566, 1, 1, 1, 1, 1,
-1.12317, -0.1198691, -3.194743, 1, 1, 1, 1, 1,
-1.121854, -0.1331531, -1.430975, 1, 1, 1, 1, 1,
-1.115342, -0.8427691, -1.999003, 1, 1, 1, 1, 1,
-1.109063, -1.496296, -3.093358, 1, 1, 1, 1, 1,
-1.106964, -1.109203, -3.165623, 1, 1, 1, 1, 1,
-1.104715, 1.654271, -1.74967, 0, 0, 1, 1, 1,
-1.102028, -0.2994457, -1.885727, 1, 0, 0, 1, 1,
-1.093789, -0.5838863, -2.623487, 1, 0, 0, 1, 1,
-1.091413, 0.4474485, -0.9644217, 1, 0, 0, 1, 1,
-1.082699, 0.04427943, -2.200508, 1, 0, 0, 1, 1,
-1.079506, -1.458067, -2.539135, 1, 0, 0, 1, 1,
-1.078789, 1.333685, -0.6837846, 0, 0, 0, 1, 1,
-1.077531, 0.5555031, -1.049519, 0, 0, 0, 1, 1,
-1.067034, 1.42988, 0.1717098, 0, 0, 0, 1, 1,
-1.061614, -0.8658987, -2.731507, 0, 0, 0, 1, 1,
-1.060218, -0.279721, -2.14716, 0, 0, 0, 1, 1,
-1.05812, -0.01396418, -3.377986, 0, 0, 0, 1, 1,
-1.048292, 0.8801591, 0.8460015, 0, 0, 0, 1, 1,
-1.047002, 1.884839, -1.288965, 1, 1, 1, 1, 1,
-1.046731, 1.396682, -0.8714558, 1, 1, 1, 1, 1,
-1.04398, 0.297166, -1.982087, 1, 1, 1, 1, 1,
-1.041308, 0.2728269, -0.3453874, 1, 1, 1, 1, 1,
-1.039287, 2.202626, -1.395917, 1, 1, 1, 1, 1,
-1.034256, -0.1411987, -2.72167, 1, 1, 1, 1, 1,
-1.033353, 0.549516, -2.2474, 1, 1, 1, 1, 1,
-1.031961, -0.004378096, -1.411904, 1, 1, 1, 1, 1,
-1.031853, 0.6194346, -1.838769, 1, 1, 1, 1, 1,
-1.031245, -0.5506194, -2.7888, 1, 1, 1, 1, 1,
-1.024535, -0.552031, -3.353302, 1, 1, 1, 1, 1,
-1.024482, -0.2019868, -0.8286605, 1, 1, 1, 1, 1,
-1.014618, -0.3766779, -1.491051, 1, 1, 1, 1, 1,
-1.013806, -0.6010514, -0.9122188, 1, 1, 1, 1, 1,
-1.012466, 0.04523296, -2.283772, 1, 1, 1, 1, 1,
-1.012183, -2.10896, -2.865644, 0, 0, 1, 1, 1,
-1.010382, -0.7188973, -3.277174, 1, 0, 0, 1, 1,
-1.008809, -0.4269272, 0.3662327, 1, 0, 0, 1, 1,
-1.006083, 0.3143773, -1.631144, 1, 0, 0, 1, 1,
-1.003511, -2.271083, -1.193324, 1, 0, 0, 1, 1,
-1.000211, 0.2823661, 0.8731809, 1, 0, 0, 1, 1,
-0.9963324, -2.60946, -5.556752, 0, 0, 0, 1, 1,
-0.9948424, 1.337651, -1.05136, 0, 0, 0, 1, 1,
-0.9879621, -1.371782, -5.099994, 0, 0, 0, 1, 1,
-0.9828792, 0.7651015, -2.671672, 0, 0, 0, 1, 1,
-0.9721422, 1.014649, -1.146806, 0, 0, 0, 1, 1,
-0.9706495, 1.794927, -0.009389127, 0, 0, 0, 1, 1,
-0.9694861, 0.4872452, 0.02149193, 0, 0, 0, 1, 1,
-0.9677015, -1.312856, -1.802536, 1, 1, 1, 1, 1,
-0.9599453, -1.765855, -3.861759, 1, 1, 1, 1, 1,
-0.9509583, -0.8021889, -2.048707, 1, 1, 1, 1, 1,
-0.9505689, 0.9654071, 0.09984227, 1, 1, 1, 1, 1,
-0.9490814, 1.532276, -0.288171, 1, 1, 1, 1, 1,
-0.9484223, 2.395691, 0.6773146, 1, 1, 1, 1, 1,
-0.9470365, -0.5746782, -3.23244, 1, 1, 1, 1, 1,
-0.9467182, 1.900165, 1.298137, 1, 1, 1, 1, 1,
-0.9437601, 0.09258465, -0.7667601, 1, 1, 1, 1, 1,
-0.9414716, 0.102057, -0.5997823, 1, 1, 1, 1, 1,
-0.9402142, 0.8302461, -0.8916457, 1, 1, 1, 1, 1,
-0.9388287, -0.8219453, -1.469149, 1, 1, 1, 1, 1,
-0.9350936, 0.7874816, -0.7207077, 1, 1, 1, 1, 1,
-0.9254128, -0.4457194, -0.9513142, 1, 1, 1, 1, 1,
-0.9219164, 1.420157, -1.206215, 1, 1, 1, 1, 1,
-0.9185899, 0.5990877, -1.819707, 0, 0, 1, 1, 1,
-0.9176558, -0.5801821, -2.647015, 1, 0, 0, 1, 1,
-0.9171203, -0.3677443, -2.274492, 1, 0, 0, 1, 1,
-0.9162036, -0.8667159, -2.577215, 1, 0, 0, 1, 1,
-0.9104165, 0.5676157, -0.04741063, 1, 0, 0, 1, 1,
-0.9091068, -0.6429508, -1.193251, 1, 0, 0, 1, 1,
-0.8965275, -0.2395064, -4.913369, 0, 0, 0, 1, 1,
-0.8869981, 0.7460812, -1.510331, 0, 0, 0, 1, 1,
-0.885467, -0.09586589, 0.5508051, 0, 0, 0, 1, 1,
-0.8845922, -0.1004384, -0.9002998, 0, 0, 0, 1, 1,
-0.8838351, 0.767136, -0.3011276, 0, 0, 0, 1, 1,
-0.883085, 0.8355759, 0.0635786, 0, 0, 0, 1, 1,
-0.8716206, 0.8572354, -0.9413653, 0, 0, 0, 1, 1,
-0.8654034, -1.508037, -1.293171, 1, 1, 1, 1, 1,
-0.8634599, 0.0558857, -1.729929, 1, 1, 1, 1, 1,
-0.8628464, -0.2701609, -2.186654, 1, 1, 1, 1, 1,
-0.8580085, -0.5379297, -0.8061798, 1, 1, 1, 1, 1,
-0.8525451, 0.2853658, 0.03926064, 1, 1, 1, 1, 1,
-0.8480685, -1.359592, -2.176495, 1, 1, 1, 1, 1,
-0.847972, -1.163175, -0.4113073, 1, 1, 1, 1, 1,
-0.847392, -0.08950312, -1.429349, 1, 1, 1, 1, 1,
-0.8456355, -0.3418685, -0.6604461, 1, 1, 1, 1, 1,
-0.840661, 2.639514, -0.2221051, 1, 1, 1, 1, 1,
-0.8405941, 1.201419, 0.9086579, 1, 1, 1, 1, 1,
-0.8382307, 1.15996, 0.553307, 1, 1, 1, 1, 1,
-0.836344, 1.258891, -0.75117, 1, 1, 1, 1, 1,
-0.8327694, 0.8724545, 0.5302108, 1, 1, 1, 1, 1,
-0.8301526, 0.9736699, 0.3891514, 1, 1, 1, 1, 1,
-0.8276311, 1.456685, 0.4283566, 0, 0, 1, 1, 1,
-0.8247356, -2.107314, -4.386156, 1, 0, 0, 1, 1,
-0.8154879, -1.232906, -2.673856, 1, 0, 0, 1, 1,
-0.8100725, 0.7554797, -0.4643856, 1, 0, 0, 1, 1,
-0.8009627, 1.635588, -1.583338, 1, 0, 0, 1, 1,
-0.7975984, -0.3858922, -1.022246, 1, 0, 0, 1, 1,
-0.7967817, -0.2494567, -2.429519, 0, 0, 0, 1, 1,
-0.7933143, -1.183223, -3.454285, 0, 0, 0, 1, 1,
-0.7881536, -0.7103391, -3.518767, 0, 0, 0, 1, 1,
-0.7858641, -1.939487, -2.345008, 0, 0, 0, 1, 1,
-0.7847435, -0.2956798, -2.010472, 0, 0, 0, 1, 1,
-0.7832454, 0.03142414, 0.9178869, 0, 0, 0, 1, 1,
-0.7828556, -0.05192314, -2.109407, 0, 0, 0, 1, 1,
-0.782293, 0.2384448, -4.397103, 1, 1, 1, 1, 1,
-0.7816272, 0.5616935, -2.884727, 1, 1, 1, 1, 1,
-0.7778167, -2.436899, -3.266974, 1, 1, 1, 1, 1,
-0.772839, 0.03069556, -0.8218383, 1, 1, 1, 1, 1,
-0.7715961, -1.051232, -1.140374, 1, 1, 1, 1, 1,
-0.7701024, -0.4019014, -1.720082, 1, 1, 1, 1, 1,
-0.7696562, -0.3773614, -1.962812, 1, 1, 1, 1, 1,
-0.7691401, 1.914031, 0.7284714, 1, 1, 1, 1, 1,
-0.7681761, 0.7547932, -1.238253, 1, 1, 1, 1, 1,
-0.7671774, -1.655925, -2.663967, 1, 1, 1, 1, 1,
-0.764694, -1.409748, -2.412925, 1, 1, 1, 1, 1,
-0.7645302, 1.664741, -1.036027, 1, 1, 1, 1, 1,
-0.7618226, 0.5472919, -0.6243886, 1, 1, 1, 1, 1,
-0.7518665, -0.9655643, -3.734712, 1, 1, 1, 1, 1,
-0.7516512, 2.134722, 0.8387977, 1, 1, 1, 1, 1,
-0.7508692, -0.1889637, -0.4468453, 0, 0, 1, 1, 1,
-0.7506764, -0.422866, -2.809241, 1, 0, 0, 1, 1,
-0.7478788, 0.5027043, -0.5383685, 1, 0, 0, 1, 1,
-0.7468991, 1.68435, 0.08777799, 1, 0, 0, 1, 1,
-0.7410073, 1.770105, -0.2262442, 1, 0, 0, 1, 1,
-0.7369919, -1.068277, -4.110152, 1, 0, 0, 1, 1,
-0.7349444, -0.5229515, -0.7406878, 0, 0, 0, 1, 1,
-0.7334694, -0.07751078, -1.033829, 0, 0, 0, 1, 1,
-0.7300214, -2.164585, -0.7240236, 0, 0, 0, 1, 1,
-0.7188072, -0.61702, -4.264363, 0, 0, 0, 1, 1,
-0.7140007, -1.421427, -3.929071, 0, 0, 0, 1, 1,
-0.7083865, 1.233508, -0.1624772, 0, 0, 0, 1, 1,
-0.7029278, -0.5115929, -1.633463, 0, 0, 0, 1, 1,
-0.7026035, 0.8119033, -0.8117615, 1, 1, 1, 1, 1,
-0.7009596, 0.2983598, -1.080824, 1, 1, 1, 1, 1,
-0.6934606, 0.9055933, -2.554846, 1, 1, 1, 1, 1,
-0.68378, 0.3169056, -0.04313174, 1, 1, 1, 1, 1,
-0.6830653, -1.032045, -2.30741, 1, 1, 1, 1, 1,
-0.681034, 0.3899203, -1.563207, 1, 1, 1, 1, 1,
-0.6785603, 1.395256, -0.3976904, 1, 1, 1, 1, 1,
-0.6775057, 1.190631, -1.027146, 1, 1, 1, 1, 1,
-0.6723104, 0.4422306, -1.039308, 1, 1, 1, 1, 1,
-0.6709262, -1.163961, -2.33281, 1, 1, 1, 1, 1,
-0.6623076, -2.369927, -3.324908, 1, 1, 1, 1, 1,
-0.6590216, 1.283918, -0.6987175, 1, 1, 1, 1, 1,
-0.6572418, -0.5712815, -1.703631, 1, 1, 1, 1, 1,
-0.6462601, -1.01732, -3.386095, 1, 1, 1, 1, 1,
-0.6451231, 0.4869258, -0.6196398, 1, 1, 1, 1, 1,
-0.6438553, -0.4323235, -1.793142, 0, 0, 1, 1, 1,
-0.6354606, 0.607424, 2.022031, 1, 0, 0, 1, 1,
-0.6353545, -0.7204874, -2.646902, 1, 0, 0, 1, 1,
-0.6339527, -0.6131712, -3.000118, 1, 0, 0, 1, 1,
-0.621857, -0.3469628, -0.9013578, 1, 0, 0, 1, 1,
-0.6198076, 0.06312364, -2.384167, 1, 0, 0, 1, 1,
-0.6174846, -0.8664043, -1.667881, 0, 0, 0, 1, 1,
-0.6146306, -0.5477377, -3.34336, 0, 0, 0, 1, 1,
-0.6120735, 1.608805, -2.076537, 0, 0, 0, 1, 1,
-0.6116873, 0.09356146, -2.531154, 0, 0, 0, 1, 1,
-0.6116269, -0.8522855, -1.971032, 0, 0, 0, 1, 1,
-0.6115039, -1.089116, -4.089741, 0, 0, 0, 1, 1,
-0.606905, 0.8576866, -1.152328, 0, 0, 0, 1, 1,
-0.6045466, 0.9392881, 0.5009662, 1, 1, 1, 1, 1,
-0.6026747, -0.6288075, -3.495158, 1, 1, 1, 1, 1,
-0.5987127, -1.1087, -2.280983, 1, 1, 1, 1, 1,
-0.5960264, 0.03943184, 0.4869089, 1, 1, 1, 1, 1,
-0.5899243, 0.7251897, -1.730181, 1, 1, 1, 1, 1,
-0.5860239, -0.8964838, -3.297902, 1, 1, 1, 1, 1,
-0.5788044, 0.3336808, -0.2050825, 1, 1, 1, 1, 1,
-0.5783973, 1.71718, -1.179783, 1, 1, 1, 1, 1,
-0.5773512, 0.6871715, -0.6766199, 1, 1, 1, 1, 1,
-0.575457, 0.2471675, 0.5624443, 1, 1, 1, 1, 1,
-0.5715127, -0.5165738, -3.092459, 1, 1, 1, 1, 1,
-0.5669782, 0.2991532, -0.6231428, 1, 1, 1, 1, 1,
-0.5648361, 0.4302262, -0.808252, 1, 1, 1, 1, 1,
-0.5619645, 1.053223, -0.207427, 1, 1, 1, 1, 1,
-0.5600772, -1.077674, -2.144409, 1, 1, 1, 1, 1,
-0.5586, 1.965056, -1.238207, 0, 0, 1, 1, 1,
-0.5584615, 0.0119262, -2.311807, 1, 0, 0, 1, 1,
-0.5525834, -0.3317491, -3.449382, 1, 0, 0, 1, 1,
-0.5522752, 1.631486, 0.6974493, 1, 0, 0, 1, 1,
-0.5518513, -0.9248973, -2.752591, 1, 0, 0, 1, 1,
-0.5475752, 0.2731701, -1.217653, 1, 0, 0, 1, 1,
-0.5437473, 0.2570111, -1.13339, 0, 0, 0, 1, 1,
-0.5410503, -0.6243379, -3.375011, 0, 0, 0, 1, 1,
-0.5283574, -1.240636, -2.753677, 0, 0, 0, 1, 1,
-0.5225649, 0.1462712, -0.4336621, 0, 0, 0, 1, 1,
-0.5195647, -0.3323256, -2.51491, 0, 0, 0, 1, 1,
-0.5192074, 0.4659224, -0.3561716, 0, 0, 0, 1, 1,
-0.5133304, -0.3250545, -0.4556907, 0, 0, 0, 1, 1,
-0.5120011, 0.08060626, -1.547187, 1, 1, 1, 1, 1,
-0.5101484, -0.4005941, -1.738642, 1, 1, 1, 1, 1,
-0.5083396, -1.291674, -3.200704, 1, 1, 1, 1, 1,
-0.5057721, -1.871096, -2.466994, 1, 1, 1, 1, 1,
-0.5029112, -0.03938309, 0.4871615, 1, 1, 1, 1, 1,
-0.4990639, -1.682683, -3.572013, 1, 1, 1, 1, 1,
-0.4990389, 1.459891, -0.002219341, 1, 1, 1, 1, 1,
-0.4947289, -0.3842778, -0.8159984, 1, 1, 1, 1, 1,
-0.4922212, -0.1420207, -1.252875, 1, 1, 1, 1, 1,
-0.4906402, -1.332423, -4.139155, 1, 1, 1, 1, 1,
-0.4868133, -0.5691772, -3.143023, 1, 1, 1, 1, 1,
-0.4866004, 2.055225, 0.2253759, 1, 1, 1, 1, 1,
-0.4826408, 0.4353957, 0.07524346, 1, 1, 1, 1, 1,
-0.4823847, 0.5490316, -0.8050381, 1, 1, 1, 1, 1,
-0.4791398, 3.033188, -1.228761, 1, 1, 1, 1, 1,
-0.4786102, 0.1252767, -0.2656437, 0, 0, 1, 1, 1,
-0.4780749, 0.448963, -2.259288, 1, 0, 0, 1, 1,
-0.4778144, 0.87006, -0.7462013, 1, 0, 0, 1, 1,
-0.477047, -1.736713, -0.7076845, 1, 0, 0, 1, 1,
-0.4767718, 0.6289385, -0.3310589, 1, 0, 0, 1, 1,
-0.4704869, -1.412281, -1.421381, 1, 0, 0, 1, 1,
-0.4673161, -0.9298428, -3.922974, 0, 0, 0, 1, 1,
-0.4600157, -0.09112642, -0.9873301, 0, 0, 0, 1, 1,
-0.4599127, 0.5990967, -2.212239, 0, 0, 0, 1, 1,
-0.4597006, 0.2486942, -0.9285044, 0, 0, 0, 1, 1,
-0.459282, 1.373951, -1.576674, 0, 0, 0, 1, 1,
-0.4588924, -0.187104, -2.339695, 0, 0, 0, 1, 1,
-0.4513173, -0.8497064, -3.07274, 0, 0, 0, 1, 1,
-0.4497122, -0.1277747, -3.438361, 1, 1, 1, 1, 1,
-0.4487496, 0.8870088, 0.4570004, 1, 1, 1, 1, 1,
-0.4428776, -1.453177, -3.311895, 1, 1, 1, 1, 1,
-0.4399566, 0.6520106, -0.4218732, 1, 1, 1, 1, 1,
-0.437671, -1.097852, -2.052153, 1, 1, 1, 1, 1,
-0.4374461, 0.9225943, 0.2882544, 1, 1, 1, 1, 1,
-0.4317632, -0.8801149, -0.1801425, 1, 1, 1, 1, 1,
-0.4317609, 0.2182489, 0.1312015, 1, 1, 1, 1, 1,
-0.4298481, -1.206493, -2.556206, 1, 1, 1, 1, 1,
-0.4273708, 0.4447309, -1.837433, 1, 1, 1, 1, 1,
-0.4235605, 1.908441, 1.042715, 1, 1, 1, 1, 1,
-0.4219784, 0.8543582, -0.2667953, 1, 1, 1, 1, 1,
-0.4202551, 1.744508, -0.1015369, 1, 1, 1, 1, 1,
-0.4166936, 1.356986, 0.9882754, 1, 1, 1, 1, 1,
-0.4157227, 1.113071, -0.9693159, 1, 1, 1, 1, 1,
-0.4153766, 0.1587042, -0.5508705, 0, 0, 1, 1, 1,
-0.4125131, 0.01030923, -2.1128, 1, 0, 0, 1, 1,
-0.4117991, -0.1652703, -1.198206, 1, 0, 0, 1, 1,
-0.4094299, 0.2735186, 0.7660762, 1, 0, 0, 1, 1,
-0.4082473, 1.258453, 0.1147743, 1, 0, 0, 1, 1,
-0.4081755, -0.9118524, -2.100677, 1, 0, 0, 1, 1,
-0.4077627, 0.5500996, -0.3439529, 0, 0, 0, 1, 1,
-0.4038845, 0.05480738, -0.1613807, 0, 0, 0, 1, 1,
-0.3997803, 1.224083, -1.438972, 0, 0, 0, 1, 1,
-0.3970935, 0.6571095, -0.5906672, 0, 0, 0, 1, 1,
-0.3951362, -0.8781009, -1.514898, 0, 0, 0, 1, 1,
-0.3950193, 1.751478, -0.6564552, 0, 0, 0, 1, 1,
-0.3937901, -0.06171435, -1.686761, 0, 0, 0, 1, 1,
-0.3889678, -0.4327714, -3.369779, 1, 1, 1, 1, 1,
-0.3745234, -1.55987, -2.105159, 1, 1, 1, 1, 1,
-0.3702482, 0.1978827, -0.4460663, 1, 1, 1, 1, 1,
-0.3678685, 0.444647, 1.263258, 1, 1, 1, 1, 1,
-0.3647764, -1.125285, -1.655253, 1, 1, 1, 1, 1,
-0.3627833, 1.243984, -0.05604041, 1, 1, 1, 1, 1,
-0.3597723, 0.09503077, -0.268391, 1, 1, 1, 1, 1,
-0.3566982, -0.6006483, -2.73461, 1, 1, 1, 1, 1,
-0.3541674, -0.04667747, -0.5395252, 1, 1, 1, 1, 1,
-0.3530344, 1.360157, -2.058962, 1, 1, 1, 1, 1,
-0.3473273, -0.8296229, -2.917192, 1, 1, 1, 1, 1,
-0.3471808, 1.547681, -0.345746, 1, 1, 1, 1, 1,
-0.3468546, 0.1396189, -0.3629081, 1, 1, 1, 1, 1,
-0.3460767, 0.5698991, -0.5241873, 1, 1, 1, 1, 1,
-0.3435962, -0.439424, -2.276968, 1, 1, 1, 1, 1,
-0.3423575, 0.5210574, -0.617884, 0, 0, 1, 1, 1,
-0.3408745, 2.765688, -1.221099, 1, 0, 0, 1, 1,
-0.3395333, -1.904938, -2.41901, 1, 0, 0, 1, 1,
-0.3384081, -1.202059, -3.695901, 1, 0, 0, 1, 1,
-0.3292636, -0.7574565, -3.006941, 1, 0, 0, 1, 1,
-0.3237011, -0.3640167, -2.319319, 1, 0, 0, 1, 1,
-0.3210314, -0.4829267, -3.130406, 0, 0, 0, 1, 1,
-0.3154289, -2.044857, -2.610178, 0, 0, 0, 1, 1,
-0.3107625, -0.5578688, -2.14936, 0, 0, 0, 1, 1,
-0.309747, 0.9683027, -0.3635032, 0, 0, 0, 1, 1,
-0.3095566, 0.8209568, 1.244653, 0, 0, 0, 1, 1,
-0.3049268, -1.825219, -4.91585, 0, 0, 0, 1, 1,
-0.3045099, 0.2311467, -2.244967, 0, 0, 0, 1, 1,
-0.2985049, 0.6165892, -1.891456, 1, 1, 1, 1, 1,
-0.2971914, 1.175332, -0.8038352, 1, 1, 1, 1, 1,
-0.2959828, -0.9329938, -2.01832, 1, 1, 1, 1, 1,
-0.2958794, 0.06826582, -1.694632, 1, 1, 1, 1, 1,
-0.2908325, -0.3047377, -2.871348, 1, 1, 1, 1, 1,
-0.2900239, -0.3979299, -2.927648, 1, 1, 1, 1, 1,
-0.2897871, 0.7235345, -0.2710115, 1, 1, 1, 1, 1,
-0.2891457, 0.9271339, 0.7648726, 1, 1, 1, 1, 1,
-0.2871552, -0.3790133, -2.614413, 1, 1, 1, 1, 1,
-0.2863347, 0.7486429, -0.8166804, 1, 1, 1, 1, 1,
-0.2847887, 1.292495, -0.5719575, 1, 1, 1, 1, 1,
-0.2772969, 0.3202784, 0.205553, 1, 1, 1, 1, 1,
-0.2764067, -0.340142, -2.886381, 1, 1, 1, 1, 1,
-0.2720799, -0.004379182, -1.630313, 1, 1, 1, 1, 1,
-0.270913, -1.517847, -1.557862, 1, 1, 1, 1, 1,
-0.2686249, -0.6709114, -2.380778, 0, 0, 1, 1, 1,
-0.2681758, 2.150822, -1.171854, 1, 0, 0, 1, 1,
-0.2665514, 0.2105314, 0.1298469, 1, 0, 0, 1, 1,
-0.2640084, -0.2384678, -2.166899, 1, 0, 0, 1, 1,
-0.2564964, 0.7792324, 0.9828902, 1, 0, 0, 1, 1,
-0.2547262, -0.1560209, -2.269699, 1, 0, 0, 1, 1,
-0.2534807, -1.334525, -1.137135, 0, 0, 0, 1, 1,
-0.2528829, 0.7268105, -1.139603, 0, 0, 0, 1, 1,
-0.2528472, -0.1512887, -1.712665, 0, 0, 0, 1, 1,
-0.2521827, 0.6880732, -2.341443, 0, 0, 0, 1, 1,
-0.250524, 0.4854986, 0.2268928, 0, 0, 0, 1, 1,
-0.248455, 0.5992066, 0.9003548, 0, 0, 0, 1, 1,
-0.2472489, 1.027237, -0.3416729, 0, 0, 0, 1, 1,
-0.246336, -1.061053, -2.957978, 1, 1, 1, 1, 1,
-0.2455463, 0.01531332, -1.418714, 1, 1, 1, 1, 1,
-0.2445507, -1.604273, -1.124277, 1, 1, 1, 1, 1,
-0.2420679, -0.8387073, -1.24212, 1, 1, 1, 1, 1,
-0.241491, 0.6087193, 0.0126549, 1, 1, 1, 1, 1,
-0.2400767, -2.597757, -2.310508, 1, 1, 1, 1, 1,
-0.2322806, 1.254275, 0.1331925, 1, 1, 1, 1, 1,
-0.2247063, -1.624985, -4.566406, 1, 1, 1, 1, 1,
-0.2229503, -0.02265489, -1.257188, 1, 1, 1, 1, 1,
-0.2206678, -0.5605527, -2.517805, 1, 1, 1, 1, 1,
-0.219397, -1.179652, -1.751121, 1, 1, 1, 1, 1,
-0.2166224, 0.4594744, -0.9229538, 1, 1, 1, 1, 1,
-0.2147423, -1.178954, -3.348329, 1, 1, 1, 1, 1,
-0.2141304, -0.5122537, -1.234884, 1, 1, 1, 1, 1,
-0.2107579, -0.2243819, -3.465335, 1, 1, 1, 1, 1,
-0.2083242, 0.3771684, -1.309197, 0, 0, 1, 1, 1,
-0.20771, -0.6653398, -3.888357, 1, 0, 0, 1, 1,
-0.2058158, -0.1715521, -2.274936, 1, 0, 0, 1, 1,
-0.1993912, -0.3275155, -4.241779, 1, 0, 0, 1, 1,
-0.1962148, 0.04535628, 0.1536819, 1, 0, 0, 1, 1,
-0.1961346, 1.050108, -0.04286732, 1, 0, 0, 1, 1,
-0.1947057, -0.2124618, -2.975002, 0, 0, 0, 1, 1,
-0.1942224, -1.358208, -4.352506, 0, 0, 0, 1, 1,
-0.1906479, -0.1020204, -0.5721205, 0, 0, 0, 1, 1,
-0.1886372, 0.6035154, -0.9897422, 0, 0, 0, 1, 1,
-0.1884143, 0.5689474, -2.03191, 0, 0, 0, 1, 1,
-0.1881476, 0.9545993, -1.455633, 0, 0, 0, 1, 1,
-0.1853981, 0.9556085, 0.3263911, 0, 0, 0, 1, 1,
-0.1845972, -1.46227, -3.082268, 1, 1, 1, 1, 1,
-0.1840732, 0.7540787, 0.2477196, 1, 1, 1, 1, 1,
-0.1821942, -0.6172794, -4.090614, 1, 1, 1, 1, 1,
-0.1681015, 0.07820801, -1.489337, 1, 1, 1, 1, 1,
-0.166751, 0.693449, -1.708614, 1, 1, 1, 1, 1,
-0.163079, -1.026937, -2.727889, 1, 1, 1, 1, 1,
-0.1567355, -1.775324, -1.885306, 1, 1, 1, 1, 1,
-0.1466458, 0.4859424, -0.3911214, 1, 1, 1, 1, 1,
-0.1463318, 0.3468688, -1.908278, 1, 1, 1, 1, 1,
-0.1446289, 0.4038124, -0.1422874, 1, 1, 1, 1, 1,
-0.1419404, 1.021836, 1.226942, 1, 1, 1, 1, 1,
-0.1418013, 1.090134, -0.9323894, 1, 1, 1, 1, 1,
-0.1417659, 0.3392908, -1.711871, 1, 1, 1, 1, 1,
-0.1403313, 1.232021, -0.492017, 1, 1, 1, 1, 1,
-0.1355518, 0.2156144, -1.185139, 1, 1, 1, 1, 1,
-0.1354902, 1.573491, 0.4675868, 0, 0, 1, 1, 1,
-0.1340131, 1.512535, -0.2175226, 1, 0, 0, 1, 1,
-0.1338665, -0.3521551, -1.9191, 1, 0, 0, 1, 1,
-0.1251597, -1.22814, -2.689399, 1, 0, 0, 1, 1,
-0.121932, -0.7435488, -4.362929, 1, 0, 0, 1, 1,
-0.1211499, -0.6097904, -2.765373, 1, 0, 0, 1, 1,
-0.1146969, -1.168013, -2.974562, 0, 0, 0, 1, 1,
-0.1144992, 0.1589483, -1.696662, 0, 0, 0, 1, 1,
-0.1106662, 0.8054643, 0.04650472, 0, 0, 0, 1, 1,
-0.1058609, -0.5855663, -3.043236, 0, 0, 0, 1, 1,
-0.101778, 0.08665118, -0.3524383, 0, 0, 0, 1, 1,
-0.09821169, -0.8677353, -2.745261, 0, 0, 0, 1, 1,
-0.09743222, -1.707548, -6.235295, 0, 0, 0, 1, 1,
-0.09721737, 0.7977322, 0.4297448, 1, 1, 1, 1, 1,
-0.09698883, -1.296341, -3.649789, 1, 1, 1, 1, 1,
-0.09694421, 0.05573269, -1.181187, 1, 1, 1, 1, 1,
-0.09520531, 0.5310826, 0.08224593, 1, 1, 1, 1, 1,
-0.09268203, -1.451367, -1.736944, 1, 1, 1, 1, 1,
-0.09100214, 2.124096, -1.328347, 1, 1, 1, 1, 1,
-0.08933973, -0.8965445, -2.276935, 1, 1, 1, 1, 1,
-0.08694842, 0.1199766, -1.831071, 1, 1, 1, 1, 1,
-0.08508758, 0.08844949, -1.335069, 1, 1, 1, 1, 1,
-0.08496188, -0.7158799, -3.214448, 1, 1, 1, 1, 1,
-0.08246857, 1.563916, -0.4200596, 1, 1, 1, 1, 1,
-0.0805869, -0.1995779, -1.135108, 1, 1, 1, 1, 1,
-0.07899566, 0.8935119, 0.245024, 1, 1, 1, 1, 1,
-0.07778997, -2.680242, -3.567485, 1, 1, 1, 1, 1,
-0.07618614, 1.219449, 1.702232, 1, 1, 1, 1, 1,
-0.07378174, 0.5455784, 0.3196699, 0, 0, 1, 1, 1,
-0.06934021, -1.300347, -2.77878, 1, 0, 0, 1, 1,
-0.068896, -1.738664, -2.29743, 1, 0, 0, 1, 1,
-0.0650398, 0.1411536, -1.089635, 1, 0, 0, 1, 1,
-0.06250066, 0.03989653, -1.934242, 1, 0, 0, 1, 1,
-0.05513516, -1.318302, -2.418931, 1, 0, 0, 1, 1,
-0.05478922, 0.04427064, -2.772007, 0, 0, 0, 1, 1,
-0.05443049, -1.083053, -2.468818, 0, 0, 0, 1, 1,
-0.05234073, -0.180195, -3.007511, 0, 0, 0, 1, 1,
-0.04958551, 1.726241, 0.4698898, 0, 0, 0, 1, 1,
-0.04738846, -1.922323, -1.265052, 0, 0, 0, 1, 1,
-0.04715589, 0.4009066, 1.313778, 0, 0, 0, 1, 1,
-0.04270953, -0.2924497, -2.666747, 0, 0, 0, 1, 1,
-0.03620702, 1.228315, -0.1390059, 1, 1, 1, 1, 1,
-0.03595614, -0.8765572, -2.154873, 1, 1, 1, 1, 1,
-0.03072694, -1.129272, -2.815495, 1, 1, 1, 1, 1,
-0.02888758, -1.481939, -1.938353, 1, 1, 1, 1, 1,
-0.02660325, -1.362577, -2.970647, 1, 1, 1, 1, 1,
-0.02604086, 0.5480534, 0.380641, 1, 1, 1, 1, 1,
-0.02591061, 1.278234, 0.08093079, 1, 1, 1, 1, 1,
-0.02211864, -0.5717777, -2.605469, 1, 1, 1, 1, 1,
-0.01659347, 1.696846, -1.121714, 1, 1, 1, 1, 1,
-0.01638977, -1.182183, -4.240119, 1, 1, 1, 1, 1,
-0.01394028, -0.06504141, -2.325019, 1, 1, 1, 1, 1,
-0.01351308, -0.4316762, -0.3939922, 1, 1, 1, 1, 1,
-0.01326135, -0.322618, -2.338086, 1, 1, 1, 1, 1,
-0.01220074, 0.0309927, -0.5758834, 1, 1, 1, 1, 1,
-0.009294805, 1.011063, -1.200035, 1, 1, 1, 1, 1,
-0.001727813, -1.358526, -2.335948, 0, 0, 1, 1, 1,
-0.001465546, -1.873019, -2.236085, 1, 0, 0, 1, 1,
0.001687325, 0.807488, 0.004328516, 1, 0, 0, 1, 1,
0.003174098, -0.4587892, 3.421299, 1, 0, 0, 1, 1,
0.003321742, -1.104127, 4.352208, 1, 0, 0, 1, 1,
0.005751556, 0.561692, -0.1766269, 1, 0, 0, 1, 1,
0.01157653, 1.116072, 0.9008619, 0, 0, 0, 1, 1,
0.01226298, -1.567369, 3.243512, 0, 0, 0, 1, 1,
0.0166925, 0.7866324, -0.8372458, 0, 0, 0, 1, 1,
0.01674943, 0.1969364, 0.7684391, 0, 0, 0, 1, 1,
0.01995612, 0.798655, 0.8079061, 0, 0, 0, 1, 1,
0.02038919, -0.2078505, 3.964955, 0, 0, 0, 1, 1,
0.0307526, -0.5337386, 3.654504, 0, 0, 0, 1, 1,
0.03163873, -0.820792, 2.505713, 1, 1, 1, 1, 1,
0.03320829, 0.6140583, -1.158299, 1, 1, 1, 1, 1,
0.03720218, 1.356142, -0.7123311, 1, 1, 1, 1, 1,
0.03931364, -0.104566, 3.953519, 1, 1, 1, 1, 1,
0.03995531, 0.5477362, -0.3915944, 1, 1, 1, 1, 1,
0.04997617, -0.2596269, 4.061515, 1, 1, 1, 1, 1,
0.05424013, 1.364116, 0.7098125, 1, 1, 1, 1, 1,
0.05480794, -0.2329956, 1.921689, 1, 1, 1, 1, 1,
0.05578646, 0.1993663, -2.694086, 1, 1, 1, 1, 1,
0.05683066, -0.00379101, 3.057202, 1, 1, 1, 1, 1,
0.05854248, -0.1811005, 2.850313, 1, 1, 1, 1, 1,
0.06133502, -2.527858, 2.47618, 1, 1, 1, 1, 1,
0.06407276, -0.4581499, 3.086396, 1, 1, 1, 1, 1,
0.06409086, -0.1891645, 2.517033, 1, 1, 1, 1, 1,
0.06700756, -1.204506, 4.37233, 1, 1, 1, 1, 1,
0.06937715, 0.2724033, -0.08660953, 0, 0, 1, 1, 1,
0.07647284, -0.6009752, 4.275511, 1, 0, 0, 1, 1,
0.07957619, 2.257632, 0.2349225, 1, 0, 0, 1, 1,
0.08301091, -2.129423, 1.296373, 1, 0, 0, 1, 1,
0.08690832, 0.4526702, 0.346738, 1, 0, 0, 1, 1,
0.08766538, 1.401699, -2.133579, 1, 0, 0, 1, 1,
0.09546538, 1.830955, 0.5107771, 0, 0, 0, 1, 1,
0.104484, 0.6804587, 0.5602472, 0, 0, 0, 1, 1,
0.1056108, 0.1121969, 1.964158, 0, 0, 0, 1, 1,
0.1086101, -0.7592998, 2.953817, 0, 0, 0, 1, 1,
0.1108999, -0.7683566, 3.196039, 0, 0, 0, 1, 1,
0.1152832, -0.531204, 5.195416, 0, 0, 0, 1, 1,
0.1165088, -0.124383, 3.021193, 0, 0, 0, 1, 1,
0.1173898, 0.5212356, 1.783439, 1, 1, 1, 1, 1,
0.1182263, -1.744624, 3.057988, 1, 1, 1, 1, 1,
0.1188094, 0.2920598, -0.05189107, 1, 1, 1, 1, 1,
0.1249852, -1.38139, 4.469126, 1, 1, 1, 1, 1,
0.1252595, 1.622617, -0.8911132, 1, 1, 1, 1, 1,
0.1262893, -0.5961953, 1.827813, 1, 1, 1, 1, 1,
0.1276437, -0.640002, 2.189422, 1, 1, 1, 1, 1,
0.1307667, 0.169205, 0.6009381, 1, 1, 1, 1, 1,
0.135199, 1.49164, 0.7204098, 1, 1, 1, 1, 1,
0.1359851, 0.7291086, 0.4445789, 1, 1, 1, 1, 1,
0.1369889, -0.3227648, 4.300913, 1, 1, 1, 1, 1,
0.1371778, 0.505034, -0.4759498, 1, 1, 1, 1, 1,
0.1378296, 0.7285995, 2.759398, 1, 1, 1, 1, 1,
0.1477236, 0.7871569, 0.1069418, 1, 1, 1, 1, 1,
0.148691, -0.1275368, 2.948094, 1, 1, 1, 1, 1,
0.1543498, 0.2234517, -1.035349, 0, 0, 1, 1, 1,
0.1563769, -0.08157768, 4.117412, 1, 0, 0, 1, 1,
0.1648194, -0.1660763, 2.573197, 1, 0, 0, 1, 1,
0.1690113, -1.909416, 4.094234, 1, 0, 0, 1, 1,
0.1702403, 0.3966938, -0.4629277, 1, 0, 0, 1, 1,
0.1719621, 0.4300607, 0.1602413, 1, 0, 0, 1, 1,
0.1769641, -0.3345693, 2.454001, 0, 0, 0, 1, 1,
0.1783153, 0.1815102, -1.533193, 0, 0, 0, 1, 1,
0.1912502, 1.479061, 0.6405882, 0, 0, 0, 1, 1,
0.1933854, -0.279059, 2.673266, 0, 0, 0, 1, 1,
0.1942089, 1.975961, -0.001953679, 0, 0, 0, 1, 1,
0.1947247, 0.8091964, 0.224331, 0, 0, 0, 1, 1,
0.196015, 0.4141784, -1.131867, 0, 0, 0, 1, 1,
0.1993618, 1.749677, -0.01748592, 1, 1, 1, 1, 1,
0.2003335, 1.391253, 0.06292854, 1, 1, 1, 1, 1,
0.200816, -0.4356044, 3.396322, 1, 1, 1, 1, 1,
0.2069523, 0.9692631, 1.283108, 1, 1, 1, 1, 1,
0.2117832, 0.9947661, 0.4905636, 1, 1, 1, 1, 1,
0.2179826, 0.6749437, 2.323117, 1, 1, 1, 1, 1,
0.2184408, 0.2353026, 0.01293062, 1, 1, 1, 1, 1,
0.2198433, -0.184397, 1.925392, 1, 1, 1, 1, 1,
0.2210814, 0.9893112, 0.2044541, 1, 1, 1, 1, 1,
0.2212219, 0.8672079, -0.3017178, 1, 1, 1, 1, 1,
0.221266, 0.04599125, 2.11615, 1, 1, 1, 1, 1,
0.2240269, 2.1953, 0.2309166, 1, 1, 1, 1, 1,
0.232984, -0.9944233, 2.066637, 1, 1, 1, 1, 1,
0.2363988, -0.6601755, 4.556568, 1, 1, 1, 1, 1,
0.2396675, -0.6506775, 3.018605, 1, 1, 1, 1, 1,
0.2432783, -0.3583425, 2.623332, 0, 0, 1, 1, 1,
0.2442831, 1.662149, 0.839964, 1, 0, 0, 1, 1,
0.2452181, -0.06050365, 3.60149, 1, 0, 0, 1, 1,
0.2458913, -0.9245666, 2.297028, 1, 0, 0, 1, 1,
0.2501842, -0.3335862, 3.519743, 1, 0, 0, 1, 1,
0.2569877, 0.787832, 1.410502, 1, 0, 0, 1, 1,
0.2598474, 0.3489259, 0.501983, 0, 0, 0, 1, 1,
0.2607544, 0.1499982, 3.163378, 0, 0, 0, 1, 1,
0.2630508, -0.7032427, 1.313097, 0, 0, 0, 1, 1,
0.2663119, 0.6781118, 1.351921, 0, 0, 0, 1, 1,
0.2672438, 0.01463216, 1.432032, 0, 0, 0, 1, 1,
0.2672765, 0.476171, 0.1282586, 0, 0, 0, 1, 1,
0.2677399, 0.1117246, -0.6279829, 0, 0, 0, 1, 1,
0.2690981, 0.9717966, 2.101842, 1, 1, 1, 1, 1,
0.2693981, 0.1668079, 1.401903, 1, 1, 1, 1, 1,
0.2766843, -1.364818, 3.350854, 1, 1, 1, 1, 1,
0.2775191, 0.8474435, 0.9294852, 1, 1, 1, 1, 1,
0.2777466, -0.01241854, 0.9692251, 1, 1, 1, 1, 1,
0.2782398, -0.3593622, 2.937626, 1, 1, 1, 1, 1,
0.2840282, -0.7162436, 1.210231, 1, 1, 1, 1, 1,
0.286004, -0.152764, 0.922478, 1, 1, 1, 1, 1,
0.2869503, 0.09240017, 0.1059847, 1, 1, 1, 1, 1,
0.292976, -0.8809704, 2.107306, 1, 1, 1, 1, 1,
0.2938899, -1.216339, 3.499051, 1, 1, 1, 1, 1,
0.3053599, 2.052981, 1.112048, 1, 1, 1, 1, 1,
0.3069682, 1.085765, -0.9588982, 1, 1, 1, 1, 1,
0.3073182, -1.303844, 2.974515, 1, 1, 1, 1, 1,
0.3098949, 1.876825, 0.3556333, 1, 1, 1, 1, 1,
0.3111014, 0.2338391, 3.040527, 0, 0, 1, 1, 1,
0.3128386, 0.9927684, -0.2406235, 1, 0, 0, 1, 1,
0.3128756, -0.2054854, 1.798889, 1, 0, 0, 1, 1,
0.3191923, 0.1350307, -0.1879778, 1, 0, 0, 1, 1,
0.3203724, -0.5125419, 1.493155, 1, 0, 0, 1, 1,
0.3291772, 0.09100419, 0.7610917, 1, 0, 0, 1, 1,
0.3295013, -0.2471395, 2.932653, 0, 0, 0, 1, 1,
0.3329838, -0.1561007, 3.312087, 0, 0, 0, 1, 1,
0.3353559, 1.160354, 0.002031682, 0, 0, 0, 1, 1,
0.3365398, 0.1603613, 2.688896, 0, 0, 0, 1, 1,
0.3387858, -1.509319, 2.290364, 0, 0, 0, 1, 1,
0.3392067, -0.9088669, 2.358896, 0, 0, 0, 1, 1,
0.3409871, 0.3138468, -0.4486454, 0, 0, 0, 1, 1,
0.3429772, 0.6992458, 3.345508, 1, 1, 1, 1, 1,
0.344865, -0.1756763, 1.205153, 1, 1, 1, 1, 1,
0.3536243, 0.3650867, -1.120971, 1, 1, 1, 1, 1,
0.3553323, -0.1133757, 1.582643, 1, 1, 1, 1, 1,
0.3569813, 1.270707, -0.5791912, 1, 1, 1, 1, 1,
0.3571996, 0.5802637, 1.643066, 1, 1, 1, 1, 1,
0.3577732, 1.397022, 0.5337057, 1, 1, 1, 1, 1,
0.3582484, -1.00858, 3.198727, 1, 1, 1, 1, 1,
0.3584017, -0.9173448, 3.379139, 1, 1, 1, 1, 1,
0.3631368, 0.7099991, 1.751215, 1, 1, 1, 1, 1,
0.3646784, -1.000601, 3.143419, 1, 1, 1, 1, 1,
0.3685237, 0.2531604, 0.6088008, 1, 1, 1, 1, 1,
0.3696552, 2.175339, -0.3747765, 1, 1, 1, 1, 1,
0.3718416, -0.6392837, 3.06679, 1, 1, 1, 1, 1,
0.3719741, 1.958713, -1.21032, 1, 1, 1, 1, 1,
0.3727513, -0.8593607, 4.105965, 0, 0, 1, 1, 1,
0.3744267, -0.1982025, 1.035156, 1, 0, 0, 1, 1,
0.3813044, -0.6927859, 0.9585425, 1, 0, 0, 1, 1,
0.3851561, 0.4991995, 0.8243979, 1, 0, 0, 1, 1,
0.3854133, -0.08633694, 0.7989623, 1, 0, 0, 1, 1,
0.3930647, -0.1321257, 0.889734, 1, 0, 0, 1, 1,
0.3933183, -2.023385, 1.127842, 0, 0, 0, 1, 1,
0.3938267, -1.13212, 3.243467, 0, 0, 0, 1, 1,
0.3939572, -0.2357597, 2.198245, 0, 0, 0, 1, 1,
0.4026164, -0.6607862, 1.388121, 0, 0, 0, 1, 1,
0.4029498, 0.7036313, 0.3463401, 0, 0, 0, 1, 1,
0.4104017, 0.3254215, 2.421052, 0, 0, 0, 1, 1,
0.4158083, 0.01313625, 1.309786, 0, 0, 0, 1, 1,
0.4182708, -0.02873122, 0.7085082, 1, 1, 1, 1, 1,
0.4245654, -1.657043, 1.573851, 1, 1, 1, 1, 1,
0.4252454, 0.4265883, 2.106557, 1, 1, 1, 1, 1,
0.4261923, 0.008495932, 0.7192947, 1, 1, 1, 1, 1,
0.428862, -0.008752606, -0.01423184, 1, 1, 1, 1, 1,
0.4302814, 1.007715, 0.2006725, 1, 1, 1, 1, 1,
0.431889, -0.4244474, 3.24779, 1, 1, 1, 1, 1,
0.4321675, -1.052954, 3.649645, 1, 1, 1, 1, 1,
0.4348885, 0.8174691, -0.8392342, 1, 1, 1, 1, 1,
0.4355933, -0.3642896, 3.726812, 1, 1, 1, 1, 1,
0.43738, 0.4383311, 1.384829, 1, 1, 1, 1, 1,
0.4388598, 1.775345, 0.6852639, 1, 1, 1, 1, 1,
0.4431444, 0.4571872, 0.3171685, 1, 1, 1, 1, 1,
0.4451222, -0.187166, 2.671719, 1, 1, 1, 1, 1,
0.4487444, -0.8607629, 2.164453, 1, 1, 1, 1, 1,
0.4545229, 2.343462, 0.6865825, 0, 0, 1, 1, 1,
0.4574718, -0.03627326, 0.7557237, 1, 0, 0, 1, 1,
0.464268, 1.714672, 0.73972, 1, 0, 0, 1, 1,
0.4745448, -0.3937646, 2.207848, 1, 0, 0, 1, 1,
0.474578, 0.04030841, 1.687843, 1, 0, 0, 1, 1,
0.4776163, 0.3124694, -1.142344, 1, 0, 0, 1, 1,
0.4785622, 0.669274, -1.312974, 0, 0, 0, 1, 1,
0.4796361, 1.081371, 1.894338, 0, 0, 0, 1, 1,
0.479911, -0.2454693, 2.054667, 0, 0, 0, 1, 1,
0.4806352, -0.09957666, 2.17681, 0, 0, 0, 1, 1,
0.4981355, 0.06355444, 1.650812, 0, 0, 0, 1, 1,
0.5063995, 1.652163, -0.461962, 0, 0, 0, 1, 1,
0.5084065, -0.5819209, 3.261465, 0, 0, 0, 1, 1,
0.5121158, 0.9482526, 1.688685, 1, 1, 1, 1, 1,
0.5132684, -0.2945535, 1.498387, 1, 1, 1, 1, 1,
0.5175089, -0.4705567, 1.144252, 1, 1, 1, 1, 1,
0.5205802, 1.384489, -0.944087, 1, 1, 1, 1, 1,
0.5230603, -0.930837, 2.61949, 1, 1, 1, 1, 1,
0.5299111, -1.436225, 4.332911, 1, 1, 1, 1, 1,
0.5304875, 0.1577507, 1.502296, 1, 1, 1, 1, 1,
0.533534, -0.4475805, 1.067328, 1, 1, 1, 1, 1,
0.5337653, 0.09208425, 0.4232858, 1, 1, 1, 1, 1,
0.534051, 0.7489661, -0.003960086, 1, 1, 1, 1, 1,
0.5392944, -1.124086, 3.109847, 1, 1, 1, 1, 1,
0.5441903, 0.005945281, 4.367476, 1, 1, 1, 1, 1,
0.5520865, 0.8708249, 0.8877078, 1, 1, 1, 1, 1,
0.5525019, -0.9321278, 1.785914, 1, 1, 1, 1, 1,
0.5544463, 0.5355018, 0.8094575, 1, 1, 1, 1, 1,
0.5558007, 1.83981, 0.619508, 0, 0, 1, 1, 1,
0.5575542, -0.9650842, 2.410002, 1, 0, 0, 1, 1,
0.5578783, -1.227131, 3.004453, 1, 0, 0, 1, 1,
0.5616541, 1.109007, 0.3990467, 1, 0, 0, 1, 1,
0.5619656, -0.9695988, 3.139857, 1, 0, 0, 1, 1,
0.5633668, 0.4709451, 0.1718497, 1, 0, 0, 1, 1,
0.5660856, -0.2926791, 0.7457166, 0, 0, 0, 1, 1,
0.5677662, 0.9391283, 0.5116286, 0, 0, 0, 1, 1,
0.568458, -1.939029, 2.903011, 0, 0, 0, 1, 1,
0.5687768, -1.512901, 4.124245, 0, 0, 0, 1, 1,
0.575116, 0.8274585, 0.6452897, 0, 0, 0, 1, 1,
0.5759102, -0.2367183, 0.7589614, 0, 0, 0, 1, 1,
0.5810692, 0.008010427, 1.412003, 0, 0, 0, 1, 1,
0.5831964, 0.5516003, 1.794378, 1, 1, 1, 1, 1,
0.585043, -0.6454718, 2.672383, 1, 1, 1, 1, 1,
0.5869638, -0.1538848, 0.3093556, 1, 1, 1, 1, 1,
0.601359, 1.443789, -1.402319, 1, 1, 1, 1, 1,
0.6025963, -0.2605972, 0.08415331, 1, 1, 1, 1, 1,
0.6057176, -2.138483, 2.684915, 1, 1, 1, 1, 1,
0.6076071, 0.1968745, 1.459227, 1, 1, 1, 1, 1,
0.6206438, -0.3910042, 1.508847, 1, 1, 1, 1, 1,
0.6207342, 0.6088642, 0.1172237, 1, 1, 1, 1, 1,
0.6210941, -0.08735603, 1.088826, 1, 1, 1, 1, 1,
0.6249841, -1.310279, 5.045136, 1, 1, 1, 1, 1,
0.6289304, 0.3762781, 1.460095, 1, 1, 1, 1, 1,
0.6310188, -1.13084, 0.05314756, 1, 1, 1, 1, 1,
0.6347812, -1.741252, 4.524123, 1, 1, 1, 1, 1,
0.6371519, 0.1615615, 2.164632, 1, 1, 1, 1, 1,
0.6377658, 1.152117, 1.489597, 0, 0, 1, 1, 1,
0.6391153, -1.734981, 2.789007, 1, 0, 0, 1, 1,
0.6464876, -0.3072971, 1.84744, 1, 0, 0, 1, 1,
0.6492246, -0.3611653, 0.5870199, 1, 0, 0, 1, 1,
0.6524642, -1.340791, 1.920808, 1, 0, 0, 1, 1,
0.6534497, -0.7995447, 2.401399, 1, 0, 0, 1, 1,
0.6565174, -1.739226, 2.589308, 0, 0, 0, 1, 1,
0.6589435, -1.245604, 4.174212, 0, 0, 0, 1, 1,
0.6595139, -0.5326481, 4.139939, 0, 0, 0, 1, 1,
0.6610015, -1.088526, 2.421497, 0, 0, 0, 1, 1,
0.6647384, -0.3036154, 1.6432, 0, 0, 0, 1, 1,
0.6659116, 0.1490274, 1.682527, 0, 0, 0, 1, 1,
0.6669526, -1.009125, 2.135799, 0, 0, 0, 1, 1,
0.6720062, 0.6634049, -0.6105015, 1, 1, 1, 1, 1,
0.6761013, 0.9321057, 1.134678, 1, 1, 1, 1, 1,
0.6768358, 0.3353239, 0.8174332, 1, 1, 1, 1, 1,
0.684138, -0.3627745, 1.000473, 1, 1, 1, 1, 1,
0.6867313, -0.1641378, 1.828129, 1, 1, 1, 1, 1,
0.688025, -1.073168, 3.240332, 1, 1, 1, 1, 1,
0.6889163, 0.2842148, 0.2047682, 1, 1, 1, 1, 1,
0.6902917, 0.5584517, 0.2512276, 1, 1, 1, 1, 1,
0.6911086, -0.2334211, 2.070866, 1, 1, 1, 1, 1,
0.6913649, 1.85465, 0.4584768, 1, 1, 1, 1, 1,
0.6931787, -1.186177, 3.50489, 1, 1, 1, 1, 1,
0.6934323, 0.4299722, 0.9112646, 1, 1, 1, 1, 1,
0.6936609, 1.116484, 1.024294, 1, 1, 1, 1, 1,
0.6959791, -0.4784176, 2.474467, 1, 1, 1, 1, 1,
0.6979104, 1.539427, 0.005908979, 1, 1, 1, 1, 1,
0.6990386, 0.9067021, 0.3577479, 0, 0, 1, 1, 1,
0.6998521, 0.9771919, 0.2285833, 1, 0, 0, 1, 1,
0.7001067, 0.6761848, 0.9222476, 1, 0, 0, 1, 1,
0.7091842, 0.3084891, 1.946404, 1, 0, 0, 1, 1,
0.7100434, 0.1623928, 1.868205, 1, 0, 0, 1, 1,
0.7105457, -2.320779, 4.620788, 1, 0, 0, 1, 1,
0.7110045, 0.5722561, 0.8919865, 0, 0, 0, 1, 1,
0.7194059, -1.036592, 1.572844, 0, 0, 0, 1, 1,
0.7289877, 1.164902, 1.081757, 0, 0, 0, 1, 1,
0.7303432, -1.733951, 4.58088, 0, 0, 0, 1, 1,
0.7399799, 0.05995176, 3.535855, 0, 0, 0, 1, 1,
0.740811, -1.650179, 2.113158, 0, 0, 0, 1, 1,
0.7442025, -1.134598, 3.739888, 0, 0, 0, 1, 1,
0.7508894, -0.03707556, 2.578077, 1, 1, 1, 1, 1,
0.751027, -0.2561399, 2.881212, 1, 1, 1, 1, 1,
0.7618762, 0.1047346, 0.6510099, 1, 1, 1, 1, 1,
0.7621351, 0.1697165, -0.6478277, 1, 1, 1, 1, 1,
0.7652976, 0.09519285, 1.497812, 1, 1, 1, 1, 1,
0.7702875, 0.5637879, 2.350888, 1, 1, 1, 1, 1,
0.7705692, 2.77661, -0.1447783, 1, 1, 1, 1, 1,
0.7710295, 1.407947, 0.1390455, 1, 1, 1, 1, 1,
0.7788954, -0.2073226, 2.230449, 1, 1, 1, 1, 1,
0.7878974, 0.4083138, 3.232414, 1, 1, 1, 1, 1,
0.7879325, -0.7397702, 2.736758, 1, 1, 1, 1, 1,
0.7896474, -1.832961, 2.476731, 1, 1, 1, 1, 1,
0.7984875, -0.3303493, 1.195264, 1, 1, 1, 1, 1,
0.8041515, -0.332992, 2.359314, 1, 1, 1, 1, 1,
0.8156324, 0.9450819, -0.2174499, 1, 1, 1, 1, 1,
0.8195385, 0.2168932, 2.151178, 0, 0, 1, 1, 1,
0.8245636, -1.203697, 3.109703, 1, 0, 0, 1, 1,
0.8329485, 1.237919, 0.5671369, 1, 0, 0, 1, 1,
0.8367067, 0.5825816, -0.8513207, 1, 0, 0, 1, 1,
0.8444836, 0.1087837, -0.8305151, 1, 0, 0, 1, 1,
0.8481835, -0.03200487, 2.268417, 1, 0, 0, 1, 1,
0.8483897, -0.1250851, -0.1012938, 0, 0, 0, 1, 1,
0.852092, -1.985612, 1.333888, 0, 0, 0, 1, 1,
0.8541318, -0.01478199, 2.65169, 0, 0, 0, 1, 1,
0.8572392, -1.638514, 2.07642, 0, 0, 0, 1, 1,
0.85947, 0.3915456, 1.397537, 0, 0, 0, 1, 1,
0.8670839, 0.7356868, 0.1479811, 0, 0, 0, 1, 1,
0.8690696, 0.6771371, 0.6473142, 0, 0, 0, 1, 1,
0.8729132, -1.641975, 3.374424, 1, 1, 1, 1, 1,
0.8746495, 0.05157369, 0.2293742, 1, 1, 1, 1, 1,
0.8747002, -0.1280107, 1.769261, 1, 1, 1, 1, 1,
0.8785591, -0.5992771, 0.5629715, 1, 1, 1, 1, 1,
0.8867345, 0.874468, -1.020593, 1, 1, 1, 1, 1,
0.8935803, -1.851466, 0.7930729, 1, 1, 1, 1, 1,
0.8968919, 0.3688031, 1.513091, 1, 1, 1, 1, 1,
0.8972904, -0.9587932, 2.722502, 1, 1, 1, 1, 1,
0.9032966, -1.021371, 4.201243, 1, 1, 1, 1, 1,
0.9059467, -0.7147707, 0.0606716, 1, 1, 1, 1, 1,
0.9077888, -0.8766957, 2.59286, 1, 1, 1, 1, 1,
0.9121019, 1.318451, 0.3354839, 1, 1, 1, 1, 1,
0.9254298, 1.271014, -1.100907, 1, 1, 1, 1, 1,
0.925851, -1.396269, 2.428079, 1, 1, 1, 1, 1,
0.9260545, 0.3745766, 1.163642, 1, 1, 1, 1, 1,
0.9263594, 1.559814, 0.1504215, 0, 0, 1, 1, 1,
0.9331539, 1.795488, -0.01196956, 1, 0, 0, 1, 1,
0.9387645, 0.8493049, 2.312732, 1, 0, 0, 1, 1,
0.946297, -1.270276, 2.943459, 1, 0, 0, 1, 1,
0.9479904, 0.242392, 0.1548133, 1, 0, 0, 1, 1,
0.949499, 0.2633443, 2.408077, 1, 0, 0, 1, 1,
0.954927, 0.6936951, 2.407056, 0, 0, 0, 1, 1,
0.9566884, -0.9284682, 4.400961, 0, 0, 0, 1, 1,
0.9686248, -1.334235, 4.168216, 0, 0, 0, 1, 1,
0.9688983, -0.9096234, 1.589832, 0, 0, 0, 1, 1,
0.976868, 1.277934, 0.6172354, 0, 0, 0, 1, 1,
0.9814066, 1.469756, 0.5503837, 0, 0, 0, 1, 1,
0.9815169, -1.043134, 2.155841, 0, 0, 0, 1, 1,
0.9837682, -0.2408415, 1.734881, 1, 1, 1, 1, 1,
0.9902784, 0.5520808, 0.1930746, 1, 1, 1, 1, 1,
0.9929196, 0.4165001, 1.20284, 1, 1, 1, 1, 1,
0.9939365, -1.245284, 2.413262, 1, 1, 1, 1, 1,
1.004898, -0.1589645, 2.175546, 1, 1, 1, 1, 1,
1.01205, -0.3724182, 1.137732, 1, 1, 1, 1, 1,
1.012053, 0.5896966, 2.224167, 1, 1, 1, 1, 1,
1.015014, -0.6707736, 3.098675, 1, 1, 1, 1, 1,
1.030158, -0.1980963, 2.245478, 1, 1, 1, 1, 1,
1.031323, 0.1527795, 1.321736, 1, 1, 1, 1, 1,
1.034651, -0.2253581, 1.376029, 1, 1, 1, 1, 1,
1.039382, -0.6288452, 1.643517, 1, 1, 1, 1, 1,
1.040822, 0.3813879, -0.7569472, 1, 1, 1, 1, 1,
1.042626, -0.08736422, 1.980844, 1, 1, 1, 1, 1,
1.045773, -0.2792278, 2.114249, 1, 1, 1, 1, 1,
1.050425, 0.1285006, 2.39549, 0, 0, 1, 1, 1,
1.058244, 0.5046057, 0.4319324, 1, 0, 0, 1, 1,
1.059278, 1.226666, 1.183334, 1, 0, 0, 1, 1,
1.059811, -1.566688, 2.011459, 1, 0, 0, 1, 1,
1.067734, -0.7710758, 2.767387, 1, 0, 0, 1, 1,
1.076126, -0.05791304, 0.04989499, 1, 0, 0, 1, 1,
1.081846, -0.5775512, 2.569183, 0, 0, 0, 1, 1,
1.08578, -1.005417, 1.86294, 0, 0, 0, 1, 1,
1.086004, 1.367461, -1.489285, 0, 0, 0, 1, 1,
1.087174, -0.9383937, 1.515114, 0, 0, 0, 1, 1,
1.089946, 0.4634989, 1.423406, 0, 0, 0, 1, 1,
1.093708, -1.07133, 3.932833, 0, 0, 0, 1, 1,
1.094018, 0.2079702, 1.03283, 0, 0, 0, 1, 1,
1.099406, 2.658352, -0.6088859, 1, 1, 1, 1, 1,
1.112877, -0.2942169, 1.926752, 1, 1, 1, 1, 1,
1.112959, -0.8119688, 1.649508, 1, 1, 1, 1, 1,
1.119133, -0.6027967, 3.370613, 1, 1, 1, 1, 1,
1.125673, 2.09881, -0.2185612, 1, 1, 1, 1, 1,
1.125763, 0.3359098, 3.09557, 1, 1, 1, 1, 1,
1.134568, 0.1629681, 1.238304, 1, 1, 1, 1, 1,
1.141989, 1.495389, -1.074454, 1, 1, 1, 1, 1,
1.142078, 1.150187, 0.3800502, 1, 1, 1, 1, 1,
1.146696, -2.138132, 2.466112, 1, 1, 1, 1, 1,
1.152705, -1.346286, 2.328589, 1, 1, 1, 1, 1,
1.155544, 0.2374774, 3.228735, 1, 1, 1, 1, 1,
1.156902, 0.6227393, 0.06182708, 1, 1, 1, 1, 1,
1.180066, -0.004448795, 0.6726596, 1, 1, 1, 1, 1,
1.180181, -1.09132, 2.178142, 1, 1, 1, 1, 1,
1.180532, -0.4334565, 2.325685, 0, 0, 1, 1, 1,
1.184519, 0.5182592, 1.739532, 1, 0, 0, 1, 1,
1.194862, -0.7409582, 2.692142, 1, 0, 0, 1, 1,
1.204368, 0.425728, 1.424825, 1, 0, 0, 1, 1,
1.20937, -1.14432, 1.235617, 1, 0, 0, 1, 1,
1.215043, 0.8457375, -0.7890424, 1, 0, 0, 1, 1,
1.254046, -1.378232, 4.11016, 0, 0, 0, 1, 1,
1.263989, -0.7679425, 0.3571967, 0, 0, 0, 1, 1,
1.282923, 1.921814, 0.4737043, 0, 0, 0, 1, 1,
1.283868, -0.919673, 2.521735, 0, 0, 0, 1, 1,
1.293158, -0.2106925, 1.180041, 0, 0, 0, 1, 1,
1.29638, 1.352175, 0.8985969, 0, 0, 0, 1, 1,
1.303485, -0.3088787, 2.421743, 0, 0, 0, 1, 1,
1.314834, -0.4501163, 3.063811, 1, 1, 1, 1, 1,
1.323182, 0.4771762, 1.730066, 1, 1, 1, 1, 1,
1.323453, 0.2962528, 1.587542, 1, 1, 1, 1, 1,
1.330022, -0.2518513, 1.981413, 1, 1, 1, 1, 1,
1.335733, -0.02906437, 1.203374, 1, 1, 1, 1, 1,
1.347363, 0.3789361, 2.595826, 1, 1, 1, 1, 1,
1.348409, 0.4227809, 1.729527, 1, 1, 1, 1, 1,
1.352533, 0.8235271, 2.11196, 1, 1, 1, 1, 1,
1.364406, 1.600773, 3.190641, 1, 1, 1, 1, 1,
1.372228, -0.8054646, 0.1944394, 1, 1, 1, 1, 1,
1.372411, -1.153327, 3.10364, 1, 1, 1, 1, 1,
1.375048, -0.3833506, 0.745475, 1, 1, 1, 1, 1,
1.389283, 0.2346734, 1.435551, 1, 1, 1, 1, 1,
1.404779, -1.28371, 1.889426, 1, 1, 1, 1, 1,
1.405021, -1.379497, 0.6803464, 1, 1, 1, 1, 1,
1.407843, 0.2865515, 1.224165, 0, 0, 1, 1, 1,
1.408141, -0.8477264, 2.864151, 1, 0, 0, 1, 1,
1.409543, 0.8205488, 0.2540716, 1, 0, 0, 1, 1,
1.418406, 0.2630212, 0.04624158, 1, 0, 0, 1, 1,
1.419555, -0.6558676, 1.922309, 1, 0, 0, 1, 1,
1.420224, 1.206331, 1.736047, 1, 0, 0, 1, 1,
1.43372, -0.5393675, 1.958325, 0, 0, 0, 1, 1,
1.437047, 0.5069862, 1.998867, 0, 0, 0, 1, 1,
1.463045, -0.1058186, 0.7484285, 0, 0, 0, 1, 1,
1.472661, -0.04336805, 1.200232, 0, 0, 0, 1, 1,
1.476351, 0.6552604, 0.1446328, 0, 0, 0, 1, 1,
1.481634, -0.4290373, 1.114415, 0, 0, 0, 1, 1,
1.495391, 0.7419122, -0.08981009, 0, 0, 0, 1, 1,
1.517998, 1.511362, 0.5787826, 1, 1, 1, 1, 1,
1.521547, -0.9762437, 2.724695, 1, 1, 1, 1, 1,
1.522194, 1.061953, 1.730005, 1, 1, 1, 1, 1,
1.524932, -1.249757, 2.886937, 1, 1, 1, 1, 1,
1.532296, -0.3050322, 0.3540815, 1, 1, 1, 1, 1,
1.534006, 0.209538, -0.3064961, 1, 1, 1, 1, 1,
1.534391, -0.03694658, 2.863839, 1, 1, 1, 1, 1,
1.536302, -0.3418012, 1.629274, 1, 1, 1, 1, 1,
1.555138, 0.8341205, -0.268048, 1, 1, 1, 1, 1,
1.568394, -0.08047992, 1.748541, 1, 1, 1, 1, 1,
1.577384, -0.008764197, 2.277377, 1, 1, 1, 1, 1,
1.578442, -1.362643, 1.836199, 1, 1, 1, 1, 1,
1.579237, 0.7139624, 0.3431884, 1, 1, 1, 1, 1,
1.581071, -0.1282012, 0.7920829, 1, 1, 1, 1, 1,
1.58115, -1.579046, 1.907507, 1, 1, 1, 1, 1,
1.594083, 0.2705262, 1.614473, 0, 0, 1, 1, 1,
1.599595, 0.3917324, 1.527644, 1, 0, 0, 1, 1,
1.607692, 0.3629788, 0.6620412, 1, 0, 0, 1, 1,
1.613695, -2.219906, 2.101689, 1, 0, 0, 1, 1,
1.627669, 1.90028, -0.1990676, 1, 0, 0, 1, 1,
1.635234, 1.074787, -0.901471, 1, 0, 0, 1, 1,
1.66384, 0.8799047, 1.120333, 0, 0, 0, 1, 1,
1.666182, 0.2792023, 1.1344, 0, 0, 0, 1, 1,
1.695254, -1.313583, 2.038843, 0, 0, 0, 1, 1,
1.701518, -0.484557, 3.141111, 0, 0, 0, 1, 1,
1.727763, 1.157025, 0.02817564, 0, 0, 0, 1, 1,
1.734341, 0.7590185, 0.5007989, 0, 0, 0, 1, 1,
1.741226, -0.842505, 1.610474, 0, 0, 0, 1, 1,
1.749336, 0.587141, 2.72871, 1, 1, 1, 1, 1,
1.762691, -2.811247, 2.361492, 1, 1, 1, 1, 1,
1.776282, -1.856231, 4.551031, 1, 1, 1, 1, 1,
1.777909, -0.1036079, 1.545521, 1, 1, 1, 1, 1,
1.788389, -0.1276484, 1.979236, 1, 1, 1, 1, 1,
1.80689, 1.062091, 0.9913294, 1, 1, 1, 1, 1,
1.810933, 0.3793228, 0.07600083, 1, 1, 1, 1, 1,
1.815213, 1.115575, 0.6509452, 1, 1, 1, 1, 1,
1.845206, 0.6127381, 1.490464, 1, 1, 1, 1, 1,
1.862448, -0.6894647, 2.118443, 1, 1, 1, 1, 1,
1.902277, 0.4568355, -0.7554685, 1, 1, 1, 1, 1,
1.912511, 0.1201867, 0.2509432, 1, 1, 1, 1, 1,
1.949083, -0.9384212, 1.317273, 1, 1, 1, 1, 1,
1.982683, -0.7382346, 3.442436, 1, 1, 1, 1, 1,
2.003395, 0.05305608, 4.44796, 1, 1, 1, 1, 1,
2.015793, 0.3721727, 2.501311, 0, 0, 1, 1, 1,
2.048006, 0.2515607, 1.860982, 1, 0, 0, 1, 1,
2.061749, -0.9145007, 3.258219, 1, 0, 0, 1, 1,
2.066096, 1.167026, 0.4845, 1, 0, 0, 1, 1,
2.088843, 0.2868518, 2.551953, 1, 0, 0, 1, 1,
2.112684, -1.829841, 0.1343787, 1, 0, 0, 1, 1,
2.116474, -0.3077069, 1.048766, 0, 0, 0, 1, 1,
2.122896, -1.334562, 3.296856, 0, 0, 0, 1, 1,
2.134626, -0.261013, 1.034561, 0, 0, 0, 1, 1,
2.140928, -1.012453, 3.432406, 0, 0, 0, 1, 1,
2.142583, 1.354089, -0.4577563, 0, 0, 0, 1, 1,
2.174475, -0.5740882, 0.4094509, 0, 0, 0, 1, 1,
2.349026, -0.5211505, 0.7590345, 0, 0, 0, 1, 1,
2.543667, 0.6126577, 0.4540019, 1, 1, 1, 1, 1,
2.554361, -0.4425489, 1.965096, 1, 1, 1, 1, 1,
2.570632, -0.2797687, 2.340138, 1, 1, 1, 1, 1,
2.810538, 1.685954, 0.5176249, 1, 1, 1, 1, 1,
2.830132, -0.7866938, 1.877093, 1, 1, 1, 1, 1,
3.140548, -0.04315969, 0.5111093, 1, 1, 1, 1, 1,
3.594797, -0.2884609, 1.706256, 1, 1, 1, 1, 1
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
var radius = 9.812353;
var distance = 34.46548;
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
mvMatrix.translate( -0.2253187, -0.1109706, 0.5199394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46548);
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
