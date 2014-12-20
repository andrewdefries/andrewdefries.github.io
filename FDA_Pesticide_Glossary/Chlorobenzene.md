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
-2.744951, 0.3655516, -1.244065, 1, 0, 0, 1,
-2.715061, -0.2273592, -0.7168748, 1, 0.007843138, 0, 1,
-2.367858, -1.324472, -1.384778, 1, 0.01176471, 0, 1,
-2.342215, 0.7521884, -0.627574, 1, 0.01960784, 0, 1,
-2.303357, -0.3325144, -1.333491, 1, 0.02352941, 0, 1,
-2.301683, -0.4663512, -1.274042, 1, 0.03137255, 0, 1,
-2.244392, -1.069447, -1.115889, 1, 0.03529412, 0, 1,
-2.244045, -0.1656985, -1.639147, 1, 0.04313726, 0, 1,
-2.24325, 1.131765, -0.2135375, 1, 0.04705882, 0, 1,
-2.225118, 0.4967012, -0.9028569, 1, 0.05490196, 0, 1,
-2.190771, 0.1963201, -1.861909, 1, 0.05882353, 0, 1,
-2.173601, -0.4985089, -0.9214755, 1, 0.06666667, 0, 1,
-2.163814, -0.9300029, -1.307531, 1, 0.07058824, 0, 1,
-2.136088, -1.665937, -0.5819969, 1, 0.07843138, 0, 1,
-2.122252, -0.9763141, -0.06130936, 1, 0.08235294, 0, 1,
-2.102897, 0.09516744, -0.969736, 1, 0.09019608, 0, 1,
-2.099225, -1.433116, -1.348062, 1, 0.09411765, 0, 1,
-2.097167, 0.9277237, -1.718251, 1, 0.1019608, 0, 1,
-2.070772, 0.7804507, -1.11643, 1, 0.1098039, 0, 1,
-2.066882, 2.47489, 0.6698545, 1, 0.1137255, 0, 1,
-1.981964, 0.171762, -1.725802, 1, 0.1215686, 0, 1,
-1.963051, -2.352414, -1.574542, 1, 0.1254902, 0, 1,
-1.959792, 1.397755, -0.6661134, 1, 0.1333333, 0, 1,
-1.941158, 0.1778458, 0.8775392, 1, 0.1372549, 0, 1,
-1.937091, -0.2050527, -2.513469, 1, 0.145098, 0, 1,
-1.927524, 1.318396, -1.328836, 1, 0.1490196, 0, 1,
-1.926165, 1.060121, -0.5171345, 1, 0.1568628, 0, 1,
-1.912862, -1.616369, -1.167876, 1, 0.1607843, 0, 1,
-1.897393, -0.008077821, -2.804907, 1, 0.1686275, 0, 1,
-1.879787, -0.6222749, -1.72747, 1, 0.172549, 0, 1,
-1.869827, 0.4121199, -1.75438, 1, 0.1803922, 0, 1,
-1.867192, -0.2410252, -2.259305, 1, 0.1843137, 0, 1,
-1.860566, 1.049048, 0.8311663, 1, 0.1921569, 0, 1,
-1.859103, 0.06402733, -0.9585727, 1, 0.1960784, 0, 1,
-1.858594, 0.8829306, -1.951779, 1, 0.2039216, 0, 1,
-1.813598, -0.3016935, -1.824116, 1, 0.2117647, 0, 1,
-1.793344, -0.1951531, -2.017864, 1, 0.2156863, 0, 1,
-1.782488, 1.063457, -0.8627224, 1, 0.2235294, 0, 1,
-1.773963, 2.28613, -0.4250113, 1, 0.227451, 0, 1,
-1.770837, 1.393374, -1.77504, 1, 0.2352941, 0, 1,
-1.755975, -0.4339655, -3.464521, 1, 0.2392157, 0, 1,
-1.744595, 1.698488, -0.3556808, 1, 0.2470588, 0, 1,
-1.743678, 1.092323, -0.4914193, 1, 0.2509804, 0, 1,
-1.72915, -1.022999, -1.130322, 1, 0.2588235, 0, 1,
-1.713549, 1.156389, 0.8278971, 1, 0.2627451, 0, 1,
-1.698012, -1.478795, -2.494749, 1, 0.2705882, 0, 1,
-1.671045, -0.1340735, -1.9303, 1, 0.2745098, 0, 1,
-1.66136, -1.746778, -1.822309, 1, 0.282353, 0, 1,
-1.651065, -1.40756, -3.012367, 1, 0.2862745, 0, 1,
-1.648568, 0.1873792, -0.1694425, 1, 0.2941177, 0, 1,
-1.641617, -0.1991151, -1.463935, 1, 0.3019608, 0, 1,
-1.637283, -0.6505407, -2.5721, 1, 0.3058824, 0, 1,
-1.632386, 0.8971964, -2.870517, 1, 0.3137255, 0, 1,
-1.614102, 1.121625, -0.2053659, 1, 0.3176471, 0, 1,
-1.597229, -0.1949923, -3.526706, 1, 0.3254902, 0, 1,
-1.586674, -0.9645031, -1.747527, 1, 0.3294118, 0, 1,
-1.575545, 0.4412591, -1.896968, 1, 0.3372549, 0, 1,
-1.573021, -0.2038265, -1.586664, 1, 0.3411765, 0, 1,
-1.566324, 0.03297471, -2.029995, 1, 0.3490196, 0, 1,
-1.556873, 1.422174, -0.601225, 1, 0.3529412, 0, 1,
-1.549081, -0.4969741, -2.099169, 1, 0.3607843, 0, 1,
-1.538196, 0.2837991, -3.066831, 1, 0.3647059, 0, 1,
-1.534562, 0.447131, -2.73944, 1, 0.372549, 0, 1,
-1.51648, 1.652821, -1.190261, 1, 0.3764706, 0, 1,
-1.511842, -0.1277706, -0.290931, 1, 0.3843137, 0, 1,
-1.510165, -0.3653353, -2.458826, 1, 0.3882353, 0, 1,
-1.500681, -0.7583177, -1.556108, 1, 0.3960784, 0, 1,
-1.495269, 0.6870012, -1.660165, 1, 0.4039216, 0, 1,
-1.490814, -1.605928, -1.676927, 1, 0.4078431, 0, 1,
-1.473871, 1.171264, -1.140638, 1, 0.4156863, 0, 1,
-1.47272, 0.4001279, 0.5048606, 1, 0.4196078, 0, 1,
-1.466443, 0.8002317, -0.9599879, 1, 0.427451, 0, 1,
-1.454494, -0.6048631, -2.370213, 1, 0.4313726, 0, 1,
-1.451993, -0.1545361, -1.399882, 1, 0.4392157, 0, 1,
-1.450391, -1.881991, -3.415739, 1, 0.4431373, 0, 1,
-1.4477, -2.139173, -2.379413, 1, 0.4509804, 0, 1,
-1.439474, 1.85374, -1.064881, 1, 0.454902, 0, 1,
-1.403985, -0.01280752, 0.2136924, 1, 0.4627451, 0, 1,
-1.402324, -1.262768, -1.628367, 1, 0.4666667, 0, 1,
-1.393126, 0.876629, -0.3812024, 1, 0.4745098, 0, 1,
-1.392838, -0.6679794, -2.71276, 1, 0.4784314, 0, 1,
-1.38487, -1.299353, -3.359803, 1, 0.4862745, 0, 1,
-1.380205, -1.101737, -2.242011, 1, 0.4901961, 0, 1,
-1.376023, 0.8578839, -3.42817, 1, 0.4980392, 0, 1,
-1.375416, 0.209224, -1.618786, 1, 0.5058824, 0, 1,
-1.366884, -0.5361037, -3.494372, 1, 0.509804, 0, 1,
-1.362636, 0.00895872, -1.652998, 1, 0.5176471, 0, 1,
-1.339395, 2.442822, -1.565506, 1, 0.5215687, 0, 1,
-1.334752, 1.841399, 0.03688522, 1, 0.5294118, 0, 1,
-1.333469, -1.025507, -3.045432, 1, 0.5333334, 0, 1,
-1.328323, 0.9570361, -0.4018078, 1, 0.5411765, 0, 1,
-1.311649, 1.233617, -1.283255, 1, 0.5450981, 0, 1,
-1.303716, -0.1968524, -1.739343, 1, 0.5529412, 0, 1,
-1.294728, -0.9106817, 0.2282056, 1, 0.5568628, 0, 1,
-1.291494, -0.8684304, -0.844194, 1, 0.5647059, 0, 1,
-1.280187, -1.057168, -2.177843, 1, 0.5686275, 0, 1,
-1.276545, 0.9427042, 1.077438, 1, 0.5764706, 0, 1,
-1.273501, -1.535157, -1.966271, 1, 0.5803922, 0, 1,
-1.267985, 0.9415516, -0.6168588, 1, 0.5882353, 0, 1,
-1.263616, -1.983637, -2.797015, 1, 0.5921569, 0, 1,
-1.256538, -0.5479541, -1.453603, 1, 0.6, 0, 1,
-1.246512, 0.3766058, -3.136564, 1, 0.6078432, 0, 1,
-1.245056, 1.181853, -1.539969, 1, 0.6117647, 0, 1,
-1.242871, 0.07021281, -0.5769918, 1, 0.6196079, 0, 1,
-1.235439, 0.2649235, -0.7249929, 1, 0.6235294, 0, 1,
-1.234972, 0.436309, -2.363288, 1, 0.6313726, 0, 1,
-1.217835, 1.463916, -1.684257, 1, 0.6352941, 0, 1,
-1.215658, -0.2766536, -1.83243, 1, 0.6431373, 0, 1,
-1.215124, 0.1042012, 0.2025379, 1, 0.6470588, 0, 1,
-1.211605, -0.5150768, -0.7402645, 1, 0.654902, 0, 1,
-1.210286, -0.3380511, -0.8171856, 1, 0.6588235, 0, 1,
-1.202015, 0.02015948, -1.924149, 1, 0.6666667, 0, 1,
-1.201736, -0.05917175, -2.730661, 1, 0.6705883, 0, 1,
-1.187716, -0.5018331, -2.765481, 1, 0.6784314, 0, 1,
-1.181521, -1.070097, -3.133221, 1, 0.682353, 0, 1,
-1.167212, -1.412171, -4.345281, 1, 0.6901961, 0, 1,
-1.152083, -0.2116532, -1.616176, 1, 0.6941177, 0, 1,
-1.150344, 1.258759, -1.430682, 1, 0.7019608, 0, 1,
-1.140807, 0.76117, -2.559091, 1, 0.7098039, 0, 1,
-1.138448, -0.1594478, -2.93543, 1, 0.7137255, 0, 1,
-1.133793, 0.424434, -0.6574597, 1, 0.7215686, 0, 1,
-1.128038, -0.09665422, -1.433959, 1, 0.7254902, 0, 1,
-1.126638, 1.296162, -1.749648, 1, 0.7333333, 0, 1,
-1.125787, 0.9457539, -0.9443954, 1, 0.7372549, 0, 1,
-1.119482, 2.217812, -0.5594031, 1, 0.7450981, 0, 1,
-1.116963, -1.512514, -2.598428, 1, 0.7490196, 0, 1,
-1.103966, 0.5373592, -2.524897, 1, 0.7568628, 0, 1,
-1.096647, -1.066488, -3.453956, 1, 0.7607843, 0, 1,
-1.09461, 0.2862357, -1.129076, 1, 0.7686275, 0, 1,
-1.094083, -0.5530375, -2.089188, 1, 0.772549, 0, 1,
-1.093817, -0.9510086, -0.9325829, 1, 0.7803922, 0, 1,
-1.090418, 0.1606483, -1.156646, 1, 0.7843137, 0, 1,
-1.083259, -0.1220808, -1.420862, 1, 0.7921569, 0, 1,
-1.081676, 1.947209, -1.283904, 1, 0.7960784, 0, 1,
-1.077698, 0.5954565, -0.2377705, 1, 0.8039216, 0, 1,
-1.07122, -1.400756, -2.110925, 1, 0.8117647, 0, 1,
-1.06123, 2.460635, -0.8142487, 1, 0.8156863, 0, 1,
-1.060161, -0.9527302, -3.187203, 1, 0.8235294, 0, 1,
-1.054332, -1.088888, -1.066793, 1, 0.827451, 0, 1,
-1.050939, -1.433989, -2.508289, 1, 0.8352941, 0, 1,
-1.043952, -0.1633261, -2.198556, 1, 0.8392157, 0, 1,
-1.037127, -1.167571, -4.027101, 1, 0.8470588, 0, 1,
-1.036974, -1.47901, -2.756451, 1, 0.8509804, 0, 1,
-1.036287, -0.4032842, -0.4656042, 1, 0.8588235, 0, 1,
-1.032652, -0.9320562, -2.427476, 1, 0.8627451, 0, 1,
-1.031468, 1.590195, -2.144946, 1, 0.8705882, 0, 1,
-1.025418, 2.936508, 0.05853042, 1, 0.8745098, 0, 1,
-1.024614, -0.9498426, -2.295741, 1, 0.8823529, 0, 1,
-1.011373, -0.1247669, -0.7353774, 1, 0.8862745, 0, 1,
-1.003119, 0.7059783, -0.4205527, 1, 0.8941177, 0, 1,
-1.001024, 0.9214796, -0.636937, 1, 0.8980392, 0, 1,
-0.9912083, 0.8768413, -1.872011, 1, 0.9058824, 0, 1,
-0.9898187, 0.8566071, -0.5166458, 1, 0.9137255, 0, 1,
-0.984179, -1.045885, -2.080275, 1, 0.9176471, 0, 1,
-0.9683842, 0.6175982, 0.05814662, 1, 0.9254902, 0, 1,
-0.9679796, -0.2407563, -1.899882, 1, 0.9294118, 0, 1,
-0.9651389, -0.3083156, -2.773961, 1, 0.9372549, 0, 1,
-0.9558347, 0.4708152, 0.02295504, 1, 0.9411765, 0, 1,
-0.9544111, 1.334273, -2.267348, 1, 0.9490196, 0, 1,
-0.9521496, -1.309382, -2.631799, 1, 0.9529412, 0, 1,
-0.9470316, -1.660199, -1.912235, 1, 0.9607843, 0, 1,
-0.9425668, 0.2585344, -1.660889, 1, 0.9647059, 0, 1,
-0.9374342, -0.5532879, -2.294332, 1, 0.972549, 0, 1,
-0.9354877, 0.2342829, -0.6958645, 1, 0.9764706, 0, 1,
-0.9340815, -1.192633, -2.449925, 1, 0.9843137, 0, 1,
-0.9321005, -0.4028348, -2.345667, 1, 0.9882353, 0, 1,
-0.9319863, 0.04967959, -1.622031, 1, 0.9960784, 0, 1,
-0.9319517, 0.2250809, -0.1028138, 0.9960784, 1, 0, 1,
-0.9273987, -2.160075, -2.126886, 0.9921569, 1, 0, 1,
-0.9147659, 1.144612, -1.277945, 0.9843137, 1, 0, 1,
-0.9119271, -0.2372026, -1.318848, 0.9803922, 1, 0, 1,
-0.91175, -2.14711, -4.202084, 0.972549, 1, 0, 1,
-0.9057972, 0.5347165, -0.8472426, 0.9686275, 1, 0, 1,
-0.8901601, -1.374058, -2.348342, 0.9607843, 1, 0, 1,
-0.8839322, 0.04086471, -0.9859629, 0.9568627, 1, 0, 1,
-0.8816206, -1.163441, -2.060036, 0.9490196, 1, 0, 1,
-0.8806329, -1.222246, -2.800564, 0.945098, 1, 0, 1,
-0.878958, 1.277451, 0.6564036, 0.9372549, 1, 0, 1,
-0.8776079, -0.170106, -0.5535004, 0.9333333, 1, 0, 1,
-0.8640963, -0.8082538, -1.082371, 0.9254902, 1, 0, 1,
-0.8619308, 0.8053173, 1.159682, 0.9215686, 1, 0, 1,
-0.8593056, 0.008249357, -0.9844697, 0.9137255, 1, 0, 1,
-0.8576015, 0.648789, -0.4801023, 0.9098039, 1, 0, 1,
-0.8540722, -0.1891116, -2.507383, 0.9019608, 1, 0, 1,
-0.8509195, 0.5384395, 1.667368, 0.8941177, 1, 0, 1,
-0.8446742, 0.8036391, 0.3596556, 0.8901961, 1, 0, 1,
-0.8411131, 1.196842, -0.1591019, 0.8823529, 1, 0, 1,
-0.8385619, -1.088565, -2.983113, 0.8784314, 1, 0, 1,
-0.8381167, 0.2696452, -0.07721087, 0.8705882, 1, 0, 1,
-0.8363209, -1.579024, -3.098102, 0.8666667, 1, 0, 1,
-0.8354084, -1.421786, -3.78593, 0.8588235, 1, 0, 1,
-0.8354017, 0.2342101, -1.783145, 0.854902, 1, 0, 1,
-0.8180861, -1.684546, -2.209009, 0.8470588, 1, 0, 1,
-0.8171372, 0.7074245, 0.4933823, 0.8431373, 1, 0, 1,
-0.8167791, 0.6206974, -0.7919406, 0.8352941, 1, 0, 1,
-0.8145218, -0.4705947, 0.6660591, 0.8313726, 1, 0, 1,
-0.8107453, 0.6419822, -0.556766, 0.8235294, 1, 0, 1,
-0.808097, 0.9050551, 0.4300785, 0.8196079, 1, 0, 1,
-0.8038234, 0.7337022, 1.071385, 0.8117647, 1, 0, 1,
-0.7929404, 0.6389836, -0.3680618, 0.8078431, 1, 0, 1,
-0.782811, 0.5367728, -0.1850656, 0.8, 1, 0, 1,
-0.7803493, -1.398073, -1.87781, 0.7921569, 1, 0, 1,
-0.7767287, -0.05944443, -1.909243, 0.7882353, 1, 0, 1,
-0.7751159, -0.2069006, -2.632472, 0.7803922, 1, 0, 1,
-0.7745935, -1.226563, -2.341107, 0.7764706, 1, 0, 1,
-0.7734511, 0.7003695, -1.794567, 0.7686275, 1, 0, 1,
-0.7731987, -0.4533277, -1.83102, 0.7647059, 1, 0, 1,
-0.7703465, 0.192825, -1.991404, 0.7568628, 1, 0, 1,
-0.767504, 0.6069889, -0.9425988, 0.7529412, 1, 0, 1,
-0.7662362, 0.1448288, -2.164402, 0.7450981, 1, 0, 1,
-0.7629928, 0.7827942, 1.259974, 0.7411765, 1, 0, 1,
-0.7595874, -0.4974045, -2.245508, 0.7333333, 1, 0, 1,
-0.759243, 1.6763, 0.4650617, 0.7294118, 1, 0, 1,
-0.7566792, 0.4285502, 0.620946, 0.7215686, 1, 0, 1,
-0.7481687, 0.9706691, -2.13974, 0.7176471, 1, 0, 1,
-0.7470421, 0.1762246, -1.368318, 0.7098039, 1, 0, 1,
-0.746978, 0.8838387, -1.646947, 0.7058824, 1, 0, 1,
-0.7453169, 1.942859, 0.1033365, 0.6980392, 1, 0, 1,
-0.7438201, -0.1417187, -1.891564, 0.6901961, 1, 0, 1,
-0.7423112, 0.5478421, -0.02011903, 0.6862745, 1, 0, 1,
-0.7420909, -0.6399575, -0.9665576, 0.6784314, 1, 0, 1,
-0.733924, 2.075751, -0.4244371, 0.6745098, 1, 0, 1,
-0.7330691, -0.4068797, -2.206543, 0.6666667, 1, 0, 1,
-0.7282499, -0.360477, -0.03001561, 0.6627451, 1, 0, 1,
-0.7243539, 0.6811351, -0.09303083, 0.654902, 1, 0, 1,
-0.7229974, 0.7590654, 0.4905288, 0.6509804, 1, 0, 1,
-0.7229205, 0.3167165, 1.659481, 0.6431373, 1, 0, 1,
-0.7200599, -0.8296076, -1.172502, 0.6392157, 1, 0, 1,
-0.7192427, -0.621237, -1.393505, 0.6313726, 1, 0, 1,
-0.7188241, -0.5511558, -0.5400002, 0.627451, 1, 0, 1,
-0.7148344, 0.04789459, -1.730642, 0.6196079, 1, 0, 1,
-0.7144732, 0.2083435, 0.01865004, 0.6156863, 1, 0, 1,
-0.7135787, -1.777398, -2.688612, 0.6078432, 1, 0, 1,
-0.7134052, 1.117627, 0.2809401, 0.6039216, 1, 0, 1,
-0.7131058, 1.89756, 3.006342, 0.5960785, 1, 0, 1,
-0.712194, -0.9295964, -1.659315, 0.5882353, 1, 0, 1,
-0.7002249, 0.05523498, -2.275999, 0.5843138, 1, 0, 1,
-0.6987082, -0.1631879, -1.241363, 0.5764706, 1, 0, 1,
-0.6955448, 2.03592, 0.8533732, 0.572549, 1, 0, 1,
-0.6936972, 0.0003032958, -0.5581765, 0.5647059, 1, 0, 1,
-0.687033, 1.325172, 0.4625631, 0.5607843, 1, 0, 1,
-0.6856313, 0.0911582, -1.26899, 0.5529412, 1, 0, 1,
-0.6817875, -1.07924, -3.217541, 0.5490196, 1, 0, 1,
-0.6801621, -0.2671323, -1.968076, 0.5411765, 1, 0, 1,
-0.676219, -0.3695582, -1.341362, 0.5372549, 1, 0, 1,
-0.6751472, 0.4384671, -0.5045437, 0.5294118, 1, 0, 1,
-0.6605665, -0.113036, -1.722668, 0.5254902, 1, 0, 1,
-0.6580661, -1.114682, -2.343944, 0.5176471, 1, 0, 1,
-0.6567345, -0.9173638, -3.279191, 0.5137255, 1, 0, 1,
-0.655681, -1.612143, -1.684198, 0.5058824, 1, 0, 1,
-0.6543949, 1.380581, -0.7505307, 0.5019608, 1, 0, 1,
-0.6528539, -1.061573, -1.314282, 0.4941176, 1, 0, 1,
-0.6524172, 2.558041, -0.9214441, 0.4862745, 1, 0, 1,
-0.6512983, 0.5859962, -0.8500007, 0.4823529, 1, 0, 1,
-0.6509675, 1.089176, -0.8478339, 0.4745098, 1, 0, 1,
-0.6497494, 0.2927392, -1.284801, 0.4705882, 1, 0, 1,
-0.6493121, -0.5829122, -2.100404, 0.4627451, 1, 0, 1,
-0.645375, -0.6348584, -3.691366, 0.4588235, 1, 0, 1,
-0.6383833, -0.4889977, -1.799498, 0.4509804, 1, 0, 1,
-0.6375096, 1.214247, -0.7086475, 0.4470588, 1, 0, 1,
-0.6366542, 1.859022, 2.4938, 0.4392157, 1, 0, 1,
-0.6359233, -0.8472156, -2.56359, 0.4352941, 1, 0, 1,
-0.6339043, 0.6489105, -0.7706035, 0.427451, 1, 0, 1,
-0.6297911, 1.199461, -1.513414, 0.4235294, 1, 0, 1,
-0.6205041, 0.361829, -0.1515094, 0.4156863, 1, 0, 1,
-0.6178456, 0.1935284, -1.733267, 0.4117647, 1, 0, 1,
-0.6178244, -1.482806, -2.046252, 0.4039216, 1, 0, 1,
-0.6141088, 0.4854836, -0.9367428, 0.3960784, 1, 0, 1,
-0.6123993, -0.2881994, -3.039568, 0.3921569, 1, 0, 1,
-0.6106158, -0.04134725, -1.876743, 0.3843137, 1, 0, 1,
-0.6094816, -1.267312, -1.723995, 0.3803922, 1, 0, 1,
-0.6038207, 0.3651428, -1.771641, 0.372549, 1, 0, 1,
-0.603056, 0.3103279, -2.110864, 0.3686275, 1, 0, 1,
-0.5986544, -0.6873152, -2.857049, 0.3607843, 1, 0, 1,
-0.5924109, -0.5395894, -1.702615, 0.3568628, 1, 0, 1,
-0.5853786, 0.830368, -1.890406, 0.3490196, 1, 0, 1,
-0.5831139, 0.9023505, -0.6463031, 0.345098, 1, 0, 1,
-0.5822919, -2.230145, -3.212239, 0.3372549, 1, 0, 1,
-0.5811551, -0.8216954, -0.5830717, 0.3333333, 1, 0, 1,
-0.579128, -1.101646, 0.08083311, 0.3254902, 1, 0, 1,
-0.5779195, -0.3186736, -1.194056, 0.3215686, 1, 0, 1,
-0.5753168, -0.9208072, -1.744943, 0.3137255, 1, 0, 1,
-0.5707059, -0.7855794, -2.541716, 0.3098039, 1, 0, 1,
-0.5621693, 0.3288163, -0.03584611, 0.3019608, 1, 0, 1,
-0.5600342, -0.1574799, -1.879065, 0.2941177, 1, 0, 1,
-0.5580459, 0.6617042, -0.7947167, 0.2901961, 1, 0, 1,
-0.557785, -0.08657437, -2.726422, 0.282353, 1, 0, 1,
-0.557647, 1.922547, -0.8843935, 0.2784314, 1, 0, 1,
-0.5569605, 0.368675, 2.13623, 0.2705882, 1, 0, 1,
-0.5538003, 1.011286, -1.775243, 0.2666667, 1, 0, 1,
-0.545578, -0.3088083, -3.272162, 0.2588235, 1, 0, 1,
-0.5443932, 0.1419549, -2.172487, 0.254902, 1, 0, 1,
-0.5429748, -0.6679198, -3.744882, 0.2470588, 1, 0, 1,
-0.5417714, -1.496745, -3.532941, 0.2431373, 1, 0, 1,
-0.5340294, -0.4997846, -1.924191, 0.2352941, 1, 0, 1,
-0.5322818, -1.446037, -3.038825, 0.2313726, 1, 0, 1,
-0.5287116, 0.1298558, -0.3613903, 0.2235294, 1, 0, 1,
-0.5270191, -1.344042, -2.098801, 0.2196078, 1, 0, 1,
-0.5240136, -1.936296, -1.898933, 0.2117647, 1, 0, 1,
-0.5202519, -0.01684418, -2.310793, 0.2078431, 1, 0, 1,
-0.5144733, 0.8539309, -1.553252, 0.2, 1, 0, 1,
-0.5134441, 1.00845, 0.6200253, 0.1921569, 1, 0, 1,
-0.5100629, -0.7353267, -1.391045, 0.1882353, 1, 0, 1,
-0.509369, 0.4165236, -0.6143512, 0.1803922, 1, 0, 1,
-0.5041968, 0.7208192, 0.4100732, 0.1764706, 1, 0, 1,
-0.502481, 1.373728, 0.2275067, 0.1686275, 1, 0, 1,
-0.5002229, 1.314085, 1.715562, 0.1647059, 1, 0, 1,
-0.4993612, -1.763461, -0.8732703, 0.1568628, 1, 0, 1,
-0.4977264, 0.432786, -1.254151, 0.1529412, 1, 0, 1,
-0.4944063, -0.2241094, -0.8763903, 0.145098, 1, 0, 1,
-0.4920998, 0.07122213, -0.5121555, 0.1411765, 1, 0, 1,
-0.4863695, -0.3352994, -4.794975, 0.1333333, 1, 0, 1,
-0.4720001, -0.5931882, -2.698288, 0.1294118, 1, 0, 1,
-0.4714607, 0.8112459, -0.1451249, 0.1215686, 1, 0, 1,
-0.4707783, -3.107881, -1.522203, 0.1176471, 1, 0, 1,
-0.4636365, -0.06536417, -0.9401405, 0.1098039, 1, 0, 1,
-0.4632951, -2.414865, -2.785554, 0.1058824, 1, 0, 1,
-0.4611744, -0.4942225, -3.222814, 0.09803922, 1, 0, 1,
-0.457209, -0.02816168, -0.537425, 0.09019608, 1, 0, 1,
-0.4550655, 1.600842, -0.413738, 0.08627451, 1, 0, 1,
-0.4541757, 1.114673, -0.2323467, 0.07843138, 1, 0, 1,
-0.4531518, -1.561625, -2.235069, 0.07450981, 1, 0, 1,
-0.4529047, 1.152905, -1.401687, 0.06666667, 1, 0, 1,
-0.4518347, 0.7788306, -1.038987, 0.0627451, 1, 0, 1,
-0.4404822, -0.7517118, -3.644041, 0.05490196, 1, 0, 1,
-0.4399105, -1.383096, -2.606265, 0.05098039, 1, 0, 1,
-0.4391166, 0.2840838, -1.24794, 0.04313726, 1, 0, 1,
-0.4311652, -1.505955, -1.323831, 0.03921569, 1, 0, 1,
-0.428305, -2.216862, -3.959906, 0.03137255, 1, 0, 1,
-0.4261396, 0.2034782, -0.2318566, 0.02745098, 1, 0, 1,
-0.4241282, 0.6306214, -2.009223, 0.01960784, 1, 0, 1,
-0.4238217, -0.3795846, -2.164571, 0.01568628, 1, 0, 1,
-0.421017, -0.6308179, -2.488117, 0.007843138, 1, 0, 1,
-0.4165138, -1.142666, -2.821952, 0.003921569, 1, 0, 1,
-0.4152283, -0.7599946, -1.70775, 0, 1, 0.003921569, 1,
-0.4056838, -0.4718495, -3.498228, 0, 1, 0.01176471, 1,
-0.4008833, -0.1395871, -1.568785, 0, 1, 0.01568628, 1,
-0.3997629, 0.4818322, -0.2789672, 0, 1, 0.02352941, 1,
-0.3991279, 0.8917101, -0.5498233, 0, 1, 0.02745098, 1,
-0.3934532, 0.5358397, 0.9674233, 0, 1, 0.03529412, 1,
-0.3892001, 0.1776641, 0.4470282, 0, 1, 0.03921569, 1,
-0.3890652, -0.7570436, -2.86004, 0, 1, 0.04705882, 1,
-0.3879313, 0.6477174, -0.3243165, 0, 1, 0.05098039, 1,
-0.3856237, 1.25567, 0.1094898, 0, 1, 0.05882353, 1,
-0.3848583, -0.7615741, -2.440314, 0, 1, 0.0627451, 1,
-0.3814945, 1.689663, 0.1130893, 0, 1, 0.07058824, 1,
-0.3792279, 0.3246159, -0.6013002, 0, 1, 0.07450981, 1,
-0.377872, -0.4065113, -1.345716, 0, 1, 0.08235294, 1,
-0.3757359, -0.7005617, -2.864487, 0, 1, 0.08627451, 1,
-0.3729125, 0.9370717, -1.526998, 0, 1, 0.09411765, 1,
-0.3693751, -1.013156, -2.013608, 0, 1, 0.1019608, 1,
-0.3675754, -0.8068244, -3.199134, 0, 1, 0.1058824, 1,
-0.3668088, 1.753146, -0.3256827, 0, 1, 0.1137255, 1,
-0.3639001, 1.167415, -1.398823, 0, 1, 0.1176471, 1,
-0.3628707, 0.6374483, -0.8339669, 0, 1, 0.1254902, 1,
-0.3576761, 0.6332241, -0.9944239, 0, 1, 0.1294118, 1,
-0.3565958, 1.883815, -1.311746, 0, 1, 0.1372549, 1,
-0.3510973, 0.7216692, -0.5072791, 0, 1, 0.1411765, 1,
-0.3458879, -0.4565426, -0.9019327, 0, 1, 0.1490196, 1,
-0.3420263, -0.8577535, -2.336989, 0, 1, 0.1529412, 1,
-0.3414261, 0.04618961, -3.054569, 0, 1, 0.1607843, 1,
-0.3411483, 0.2335829, -1.420766, 0, 1, 0.1647059, 1,
-0.3318957, -0.3142975, -0.2406214, 0, 1, 0.172549, 1,
-0.3293735, -0.1128597, -1.356352, 0, 1, 0.1764706, 1,
-0.3130535, 2.212753, 0.718603, 0, 1, 0.1843137, 1,
-0.3112166, 0.2203257, -1.974848, 0, 1, 0.1882353, 1,
-0.3093335, 1.359132, -0.7023519, 0, 1, 0.1960784, 1,
-0.3063269, -0.3793128, -2.803496, 0, 1, 0.2039216, 1,
-0.3053246, 0.8620665, 0.9912611, 0, 1, 0.2078431, 1,
-0.3022783, 1.392003, -0.6442278, 0, 1, 0.2156863, 1,
-0.302162, -0.99113, -2.460514, 0, 1, 0.2196078, 1,
-0.2969941, -0.4788699, 0.02124539, 0, 1, 0.227451, 1,
-0.2968762, 0.6373871, -1.699657, 0, 1, 0.2313726, 1,
-0.2959258, -0.585917, -2.364848, 0, 1, 0.2392157, 1,
-0.293008, -1.33441, -2.32216, 0, 1, 0.2431373, 1,
-0.2912075, 1.371411, 1.747735, 0, 1, 0.2509804, 1,
-0.290148, 1.79055, -0.4331151, 0, 1, 0.254902, 1,
-0.2880348, -0.2340651, -2.973724, 0, 1, 0.2627451, 1,
-0.285797, -0.1295638, -5.107488, 0, 1, 0.2666667, 1,
-0.2817167, 0.8957418, 0.1651974, 0, 1, 0.2745098, 1,
-0.2815572, -0.3772348, -1.809538, 0, 1, 0.2784314, 1,
-0.2813938, 0.08972079, -1.08931, 0, 1, 0.2862745, 1,
-0.2811883, -0.8361607, -4.337259, 0, 1, 0.2901961, 1,
-0.2770702, -0.4831486, -4.08982, 0, 1, 0.2980392, 1,
-0.2759849, -0.7059582, -0.3835405, 0, 1, 0.3058824, 1,
-0.2759313, -1.499488, -2.569022, 0, 1, 0.3098039, 1,
-0.2737352, 0.6515986, 0.9092063, 0, 1, 0.3176471, 1,
-0.2713509, 0.0889568, -1.367401, 0, 1, 0.3215686, 1,
-0.268611, -1.910899, -2.424046, 0, 1, 0.3294118, 1,
-0.2676744, -2.365245, -3.442057, 0, 1, 0.3333333, 1,
-0.2633192, -0.4451336, -1.865375, 0, 1, 0.3411765, 1,
-0.2601193, -0.9190025, -1.790675, 0, 1, 0.345098, 1,
-0.2599446, -0.9382222, -3.20034, 0, 1, 0.3529412, 1,
-0.25734, -0.92, -2.389704, 0, 1, 0.3568628, 1,
-0.2573048, 2.304913, -0.8386611, 0, 1, 0.3647059, 1,
-0.2552998, 0.5282614, -0.8391069, 0, 1, 0.3686275, 1,
-0.2537977, 0.3778869, -0.9575596, 0, 1, 0.3764706, 1,
-0.2535855, 0.08079776, -1.734101, 0, 1, 0.3803922, 1,
-0.2532783, -0.4684105, -2.783502, 0, 1, 0.3882353, 1,
-0.2529141, 2.129082, -2.575284, 0, 1, 0.3921569, 1,
-0.2507416, 0.1407554, -0.01554309, 0, 1, 0.4, 1,
-0.2482542, -0.4270261, -3.799996, 0, 1, 0.4078431, 1,
-0.2406492, -0.5819408, -2.405677, 0, 1, 0.4117647, 1,
-0.2358187, -0.195885, -1.450416, 0, 1, 0.4196078, 1,
-0.2325053, -0.6706221, -1.055099, 0, 1, 0.4235294, 1,
-0.2300484, -0.1761623, -2.043954, 0, 1, 0.4313726, 1,
-0.2241531, 1.107828, -0.9720085, 0, 1, 0.4352941, 1,
-0.222828, -0.2236861, -1.800489, 0, 1, 0.4431373, 1,
-0.2211049, 0.9924543, -0.9933178, 0, 1, 0.4470588, 1,
-0.219399, -0.7853066, -0.7719243, 0, 1, 0.454902, 1,
-0.2191283, 1.178675, 0.362038, 0, 1, 0.4588235, 1,
-0.2186642, 0.664767, -0.7157263, 0, 1, 0.4666667, 1,
-0.2163861, -1.284063, -2.981328, 0, 1, 0.4705882, 1,
-0.2102676, -0.02690723, -1.422162, 0, 1, 0.4784314, 1,
-0.2094572, 1.753985, -0.7843031, 0, 1, 0.4823529, 1,
-0.2062164, -1.087893, -4.193593, 0, 1, 0.4901961, 1,
-0.2007584, 1.259996, 0.2659954, 0, 1, 0.4941176, 1,
-0.1994728, -0.6389744, -2.726611, 0, 1, 0.5019608, 1,
-0.1976765, 2.726282, 1.555817, 0, 1, 0.509804, 1,
-0.1950607, -0.4135073, -2.723281, 0, 1, 0.5137255, 1,
-0.1887619, 0.3543109, -0.860445, 0, 1, 0.5215687, 1,
-0.1868397, -0.4180946, -3.448823, 0, 1, 0.5254902, 1,
-0.1866331, 0.2587385, 0.6770146, 0, 1, 0.5333334, 1,
-0.1836731, -0.1905989, -2.735468, 0, 1, 0.5372549, 1,
-0.1835991, -0.6971707, -4.075989, 0, 1, 0.5450981, 1,
-0.17574, 0.4796217, 0.5140437, 0, 1, 0.5490196, 1,
-0.1748331, 0.0580926, -0.3454253, 0, 1, 0.5568628, 1,
-0.1740062, 1.628137, -0.1870052, 0, 1, 0.5607843, 1,
-0.1735495, 0.9130076, -0.5074183, 0, 1, 0.5686275, 1,
-0.1639682, 0.3732387, 0.8021423, 0, 1, 0.572549, 1,
-0.1633913, 0.2451143, -0.8895255, 0, 1, 0.5803922, 1,
-0.1625496, 0.2562475, 0.9046018, 0, 1, 0.5843138, 1,
-0.1601487, 1.61204, -0.07195307, 0, 1, 0.5921569, 1,
-0.1542138, -0.2837687, -3.031566, 0, 1, 0.5960785, 1,
-0.1512713, -1.343728, -3.491458, 0, 1, 0.6039216, 1,
-0.1498396, 0.4500912, -2.939311, 0, 1, 0.6117647, 1,
-0.1478098, -0.8461471, -3.369164, 0, 1, 0.6156863, 1,
-0.1452104, 1.71398, 1.093955, 0, 1, 0.6235294, 1,
-0.1419087, -0.3437986, -2.797355, 0, 1, 0.627451, 1,
-0.1409376, 1.476507, -1.295324, 0, 1, 0.6352941, 1,
-0.1407297, 0.4728935, -1.002915, 0, 1, 0.6392157, 1,
-0.1396858, 0.8087234, 1.804497, 0, 1, 0.6470588, 1,
-0.1391788, 1.38076, 1.242021, 0, 1, 0.6509804, 1,
-0.1388644, 0.8098875, 0.2856456, 0, 1, 0.6588235, 1,
-0.1372275, -1.016239, -4.3414, 0, 1, 0.6627451, 1,
-0.1325195, -1.261363, -2.724396, 0, 1, 0.6705883, 1,
-0.1253961, 0.5522895, -1.529059, 0, 1, 0.6745098, 1,
-0.1216262, 1.59398, -1.188267, 0, 1, 0.682353, 1,
-0.1193822, -0.781192, -2.0801, 0, 1, 0.6862745, 1,
-0.1144439, -0.8560051, -4.253644, 0, 1, 0.6941177, 1,
-0.1138762, 1.760424, 0.7757111, 0, 1, 0.7019608, 1,
-0.1091682, -0.4371771, -3.283157, 0, 1, 0.7058824, 1,
-0.1054499, -0.7302642, -3.241085, 0, 1, 0.7137255, 1,
-0.1050038, -2.481519, -3.798807, 0, 1, 0.7176471, 1,
-0.1028514, -0.0303925, -1.01484, 0, 1, 0.7254902, 1,
-0.09500901, -0.5070841, -2.186723, 0, 1, 0.7294118, 1,
-0.0939223, 0.06429385, -0.4156062, 0, 1, 0.7372549, 1,
-0.09311326, -1.17213, -3.707277, 0, 1, 0.7411765, 1,
-0.09253166, 0.4967543, -0.6223791, 0, 1, 0.7490196, 1,
-0.09200108, 0.7478078, -0.9338673, 0, 1, 0.7529412, 1,
-0.09165833, -0.03196177, -2.220512, 0, 1, 0.7607843, 1,
-0.0901501, 0.2977363, 0.6372137, 0, 1, 0.7647059, 1,
-0.08658705, 1.234689, 0.479746, 0, 1, 0.772549, 1,
-0.0860184, -0.3955546, -1.525229, 0, 1, 0.7764706, 1,
-0.08097744, 0.5946892, -1.779068, 0, 1, 0.7843137, 1,
-0.07770225, 0.9361026, -0.8100901, 0, 1, 0.7882353, 1,
-0.07343038, 0.06669771, -1.199794, 0, 1, 0.7960784, 1,
-0.07063641, 1.65074, 0.4411851, 0, 1, 0.8039216, 1,
-0.06727572, 1.209012, -0.8485523, 0, 1, 0.8078431, 1,
-0.0666023, 0.5130329, 0.2569002, 0, 1, 0.8156863, 1,
-0.06061405, -0.6972929, -2.998955, 0, 1, 0.8196079, 1,
-0.04833828, -1.524677, -3.051245, 0, 1, 0.827451, 1,
-0.04209368, 0.8121848, -0.5476525, 0, 1, 0.8313726, 1,
-0.04193921, 0.04730486, -0.5467932, 0, 1, 0.8392157, 1,
-0.03994258, -0.7058142, -2.623525, 0, 1, 0.8431373, 1,
-0.03727378, 0.2032857, 0.2425206, 0, 1, 0.8509804, 1,
-0.03268121, 0.8943205, -0.1911445, 0, 1, 0.854902, 1,
-0.03039843, -1.774423, -3.731238, 0, 1, 0.8627451, 1,
-0.02750252, -0.6829062, -2.830153, 0, 1, 0.8666667, 1,
-0.02333697, 2.357401, -0.0850952, 0, 1, 0.8745098, 1,
-0.01955244, 0.3172132, -1.601753, 0, 1, 0.8784314, 1,
-0.01912452, 0.6738352, 0.6917572, 0, 1, 0.8862745, 1,
-0.01842877, 0.4657657, -1.773664, 0, 1, 0.8901961, 1,
-0.01658506, 1.18455, -0.144047, 0, 1, 0.8980392, 1,
-0.01064097, 0.2661416, 1.429972, 0, 1, 0.9058824, 1,
-0.006627118, 1.359129, 0.1453895, 0, 1, 0.9098039, 1,
-0.006470209, 0.4949749, 0.2539696, 0, 1, 0.9176471, 1,
-0.005495197, -0.108122, -3.822927, 0, 1, 0.9215686, 1,
-0.003029414, 0.5253465, 0.1719615, 0, 1, 0.9294118, 1,
0.0009193625, 1.582689, -0.3909646, 0, 1, 0.9333333, 1,
0.001451849, 0.3990427, -0.4250959, 0, 1, 0.9411765, 1,
0.00233437, 1.315948, 0.04336008, 0, 1, 0.945098, 1,
0.003163706, -0.6170452, 1.906039, 0, 1, 0.9529412, 1,
0.005629525, -1.582724, 3.853174, 0, 1, 0.9568627, 1,
0.006474986, 1.184769, -0.7523872, 0, 1, 0.9647059, 1,
0.01158142, 0.007608201, -0.3581576, 0, 1, 0.9686275, 1,
0.0117093, 1.355445, -0.459419, 0, 1, 0.9764706, 1,
0.01353826, 1.396135, -0.6437263, 0, 1, 0.9803922, 1,
0.01440236, -0.09597237, 3.757751, 0, 1, 0.9882353, 1,
0.01638254, -0.7393175, 3.826175, 0, 1, 0.9921569, 1,
0.02156825, 0.190431, 0.244373, 0, 1, 1, 1,
0.02523511, 1.219711, 0.1694794, 0, 0.9921569, 1, 1,
0.03263015, -0.9017719, 2.294974, 0, 0.9882353, 1, 1,
0.03470964, -1.100246, 1.859879, 0, 0.9803922, 1, 1,
0.0361437, 1.027562, -0.5713505, 0, 0.9764706, 1, 1,
0.03627311, -0.1940597, 3.750637, 0, 0.9686275, 1, 1,
0.03991555, 2.163237, -1.266606, 0, 0.9647059, 1, 1,
0.04203256, 0.6308542, 0.9701243, 0, 0.9568627, 1, 1,
0.04247536, 0.2992417, 2.307561, 0, 0.9529412, 1, 1,
0.04598029, -0.2642357, 2.05302, 0, 0.945098, 1, 1,
0.04625735, 0.06538181, -0.4029261, 0, 0.9411765, 1, 1,
0.04708984, 0.2829181, -0.6983862, 0, 0.9333333, 1, 1,
0.0480666, -1.150579, 3.110859, 0, 0.9294118, 1, 1,
0.04871279, -0.6325351, 3.083856, 0, 0.9215686, 1, 1,
0.05040043, 1.080202, 0.5784965, 0, 0.9176471, 1, 1,
0.05236473, -0.610865, 2.268405, 0, 0.9098039, 1, 1,
0.05571635, -0.7414567, 2.275885, 0, 0.9058824, 1, 1,
0.05624155, -0.39661, 2.439272, 0, 0.8980392, 1, 1,
0.05698426, 2.027028, 0.6458615, 0, 0.8901961, 1, 1,
0.05799023, -0.5355409, 1.313307, 0, 0.8862745, 1, 1,
0.05960082, 0.921616, 0.5524108, 0, 0.8784314, 1, 1,
0.06108169, 0.3891369, 1.214976, 0, 0.8745098, 1, 1,
0.06446037, -0.3079421, 1.774099, 0, 0.8666667, 1, 1,
0.06758787, 1.359577, 0.8140614, 0, 0.8627451, 1, 1,
0.07054137, 0.3415062, 0.08994124, 0, 0.854902, 1, 1,
0.07062142, 0.1464924, -1.355709, 0, 0.8509804, 1, 1,
0.07158948, 1.432389, -0.4428382, 0, 0.8431373, 1, 1,
0.07311708, -0.7263874, 1.735766, 0, 0.8392157, 1, 1,
0.07533827, 1.720174, 1.23803, 0, 0.8313726, 1, 1,
0.07639082, -1.021952, 2.127664, 0, 0.827451, 1, 1,
0.08150104, 0.7122738, 0.9283656, 0, 0.8196079, 1, 1,
0.08418182, -0.1843491, 2.010419, 0, 0.8156863, 1, 1,
0.08682491, -0.999773, 3.694507, 0, 0.8078431, 1, 1,
0.08767802, -0.9362178, 4.45888, 0, 0.8039216, 1, 1,
0.09079088, -0.7134222, 3.764228, 0, 0.7960784, 1, 1,
0.09153204, -1.522233, 2.562502, 0, 0.7882353, 1, 1,
0.09267203, 0.2462614, 1.120914, 0, 0.7843137, 1, 1,
0.09506962, 0.4180045, 0.4142772, 0, 0.7764706, 1, 1,
0.09974344, -0.4369745, 1.5365, 0, 0.772549, 1, 1,
0.1016315, -0.3181441, 1.928533, 0, 0.7647059, 1, 1,
0.1040123, 0.1173312, 2.304646, 0, 0.7607843, 1, 1,
0.1064698, -0.3030834, 3.440102, 0, 0.7529412, 1, 1,
0.1167165, 0.1886283, 0.7265888, 0, 0.7490196, 1, 1,
0.1179742, 0.9628051, -0.2829034, 0, 0.7411765, 1, 1,
0.1188029, 0.9272482, 0.9835976, 0, 0.7372549, 1, 1,
0.1266216, 0.3297674, 0.2546235, 0, 0.7294118, 1, 1,
0.1282039, -0.6722505, 3.40338, 0, 0.7254902, 1, 1,
0.128606, 0.3664047, -1.046344, 0, 0.7176471, 1, 1,
0.1334218, -1.274357, 2.186418, 0, 0.7137255, 1, 1,
0.1358776, -0.1087566, 2.297525, 0, 0.7058824, 1, 1,
0.1364376, -0.6603377, 4.122422, 0, 0.6980392, 1, 1,
0.1367757, -1.091219, 3.488442, 0, 0.6941177, 1, 1,
0.1418371, -0.3180274, 2.127427, 0, 0.6862745, 1, 1,
0.1454925, -0.1211081, 2.320687, 0, 0.682353, 1, 1,
0.1539399, 1.085389, 1.048289, 0, 0.6745098, 1, 1,
0.1561189, 0.4315502, -1.105014, 0, 0.6705883, 1, 1,
0.1597937, -0.6146734, 2.264834, 0, 0.6627451, 1, 1,
0.1598873, -1.422515, 4.403564, 0, 0.6588235, 1, 1,
0.1610137, 1.842538, 1.884276, 0, 0.6509804, 1, 1,
0.1631225, -1.795817, 5.006429, 0, 0.6470588, 1, 1,
0.1656545, -1.160052, 1.791066, 0, 0.6392157, 1, 1,
0.1657871, -0.6424605, 3.675084, 0, 0.6352941, 1, 1,
0.1663143, 0.1034139, 0.861918, 0, 0.627451, 1, 1,
0.1667083, -1.120697, 2.615239, 0, 0.6235294, 1, 1,
0.1765935, -0.635758, 2.431748, 0, 0.6156863, 1, 1,
0.1771268, -0.2777247, 3.306576, 0, 0.6117647, 1, 1,
0.181062, 0.1274147, 1.111469, 0, 0.6039216, 1, 1,
0.1817811, -0.1314054, 2.388943, 0, 0.5960785, 1, 1,
0.1838798, 0.2421032, 0.5450495, 0, 0.5921569, 1, 1,
0.1839805, -1.208547, 3.244554, 0, 0.5843138, 1, 1,
0.1861217, -1.909923, 3.581245, 0, 0.5803922, 1, 1,
0.1882001, 0.2724423, 0.2169584, 0, 0.572549, 1, 1,
0.1932763, -0.1844888, 2.659548, 0, 0.5686275, 1, 1,
0.1956525, -1.070231, 3.934897, 0, 0.5607843, 1, 1,
0.1993898, 0.3923957, -0.7010704, 0, 0.5568628, 1, 1,
0.1996687, -0.2123002, 2.000777, 0, 0.5490196, 1, 1,
0.2043433, -0.9299935, 2.973645, 0, 0.5450981, 1, 1,
0.2050507, -0.4238597, 1.965176, 0, 0.5372549, 1, 1,
0.206157, 0.09755293, 1.471371, 0, 0.5333334, 1, 1,
0.2070882, 0.3354548, 0.1710223, 0, 0.5254902, 1, 1,
0.2084289, -0.5895625, 4.329536, 0, 0.5215687, 1, 1,
0.2094443, -0.975669, 2.499238, 0, 0.5137255, 1, 1,
0.2111003, -0.07310835, 0.9879592, 0, 0.509804, 1, 1,
0.211231, 0.7650578, 0.06926653, 0, 0.5019608, 1, 1,
0.217932, 1.322082, 1.723466, 0, 0.4941176, 1, 1,
0.21857, -1.17817, 2.697939, 0, 0.4901961, 1, 1,
0.2197186, -1.840967, 2.650452, 0, 0.4823529, 1, 1,
0.2224702, 1.422597, 0.9271758, 0, 0.4784314, 1, 1,
0.224603, 0.7732739, -0.8366915, 0, 0.4705882, 1, 1,
0.2254566, -0.9635088, 3.183884, 0, 0.4666667, 1, 1,
0.227883, 0.564077, 0.4665223, 0, 0.4588235, 1, 1,
0.2350957, 0.276294, 1.042692, 0, 0.454902, 1, 1,
0.2371646, 0.104811, 1.310256, 0, 0.4470588, 1, 1,
0.2392938, -0.9039844, 2.755622, 0, 0.4431373, 1, 1,
0.2459956, 4.102329, 0.05600966, 0, 0.4352941, 1, 1,
0.2462246, 0.0003744813, 3.51723, 0, 0.4313726, 1, 1,
0.2526774, -0.1874503, 2.808999, 0, 0.4235294, 1, 1,
0.2597058, 0.6184362, 0.05820785, 0, 0.4196078, 1, 1,
0.2612276, 0.9811526, -1.822576, 0, 0.4117647, 1, 1,
0.2651482, -0.9228151, 1.211355, 0, 0.4078431, 1, 1,
0.2699841, -1.622959, 2.990492, 0, 0.4, 1, 1,
0.2702312, -0.7972597, 3.614184, 0, 0.3921569, 1, 1,
0.2727289, -0.2344533, 1.787402, 0, 0.3882353, 1, 1,
0.2730466, -1.096213, 2.453101, 0, 0.3803922, 1, 1,
0.2828906, -0.2418577, 3.364545, 0, 0.3764706, 1, 1,
0.2830687, -1.683011, 2.747483, 0, 0.3686275, 1, 1,
0.2846513, 1.023942, 1.011351, 0, 0.3647059, 1, 1,
0.294187, -0.3757066, 2.65249, 0, 0.3568628, 1, 1,
0.2970356, 0.756609, 0.3748745, 0, 0.3529412, 1, 1,
0.2995402, 1.443164, -0.06539729, 0, 0.345098, 1, 1,
0.3023915, 1.373709, -0.7819656, 0, 0.3411765, 1, 1,
0.3029482, -0.2023366, 2.926908, 0, 0.3333333, 1, 1,
0.3030752, 1.292468, -0.2052853, 0, 0.3294118, 1, 1,
0.30459, -1.000968, 2.504383, 0, 0.3215686, 1, 1,
0.3052548, -1.287933, 1.959883, 0, 0.3176471, 1, 1,
0.3053366, -0.8084663, 1.617126, 0, 0.3098039, 1, 1,
0.3060289, 1.626215, 0.3050388, 0, 0.3058824, 1, 1,
0.3078377, -1.232804, 4.025359, 0, 0.2980392, 1, 1,
0.3128858, -1.952985, 1.166513, 0, 0.2901961, 1, 1,
0.3238676, 0.4219602, 0.7467144, 0, 0.2862745, 1, 1,
0.3321087, 1.536361, -1.074854, 0, 0.2784314, 1, 1,
0.3323688, 0.1370093, 1.8038, 0, 0.2745098, 1, 1,
0.3326899, 0.968326, 2.142658, 0, 0.2666667, 1, 1,
0.3335086, -0.5918108, 1.222381, 0, 0.2627451, 1, 1,
0.3347363, 0.1239793, 1.401967, 0, 0.254902, 1, 1,
0.3410498, 0.5053943, 0.1306821, 0, 0.2509804, 1, 1,
0.3425193, 1.852026, 0.08173901, 0, 0.2431373, 1, 1,
0.3442498, -0.939271, 3.679891, 0, 0.2392157, 1, 1,
0.346721, -0.3646512, 2.150678, 0, 0.2313726, 1, 1,
0.3482183, 0.3936757, 0.7647339, 0, 0.227451, 1, 1,
0.3505142, 1.33315, 0.6838369, 0, 0.2196078, 1, 1,
0.3537168, 0.6627676, 0.7407926, 0, 0.2156863, 1, 1,
0.3547828, 0.346619, 1.202882, 0, 0.2078431, 1, 1,
0.3563791, 0.159829, 1.59027, 0, 0.2039216, 1, 1,
0.3619521, -0.8437754, 1.466235, 0, 0.1960784, 1, 1,
0.3629424, -1.742031, 2.490262, 0, 0.1882353, 1, 1,
0.3641764, 0.05618358, 2.883018, 0, 0.1843137, 1, 1,
0.3681115, 1.162988, 0.5740494, 0, 0.1764706, 1, 1,
0.3714741, 0.07647628, 2.715105, 0, 0.172549, 1, 1,
0.3777612, 0.1555507, 0.7313436, 0, 0.1647059, 1, 1,
0.3792694, 1.257742, -0.2723121, 0, 0.1607843, 1, 1,
0.3809512, -1.191365, 1.913959, 0, 0.1529412, 1, 1,
0.3838031, 1.901552, -1.06393, 0, 0.1490196, 1, 1,
0.3868511, -1.017383, 2.700957, 0, 0.1411765, 1, 1,
0.3875372, 0.7667522, 1.340637, 0, 0.1372549, 1, 1,
0.3882887, -0.962382, 2.666481, 0, 0.1294118, 1, 1,
0.3885998, -0.3326578, 2.684322, 0, 0.1254902, 1, 1,
0.3886659, -0.6965303, 2.681595, 0, 0.1176471, 1, 1,
0.3935766, 0.6042784, 0.612367, 0, 0.1137255, 1, 1,
0.3945751, 0.8656034, 0.2446615, 0, 0.1058824, 1, 1,
0.3953226, 0.1083625, 1.257584, 0, 0.09803922, 1, 1,
0.3955041, -2.439327, 4.47888, 0, 0.09411765, 1, 1,
0.4056677, 0.4373487, -0.187578, 0, 0.08627451, 1, 1,
0.4082815, 2.32036, -0.2172964, 0, 0.08235294, 1, 1,
0.4092645, -1.080051, 0.7363604, 0, 0.07450981, 1, 1,
0.411114, -0.4444618, 3.346642, 0, 0.07058824, 1, 1,
0.412712, -0.9279723, 3.16488, 0, 0.0627451, 1, 1,
0.4138868, 0.6801864, 2.252368, 0, 0.05882353, 1, 1,
0.4141751, 0.05542303, 1.00236, 0, 0.05098039, 1, 1,
0.4166121, -1.275212, 2.005718, 0, 0.04705882, 1, 1,
0.4174931, 0.3930791, 0.4771613, 0, 0.03921569, 1, 1,
0.4201339, -0.610485, 2.444305, 0, 0.03529412, 1, 1,
0.4227093, -0.3810732, 2.378967, 0, 0.02745098, 1, 1,
0.4269525, -1.212516, 2.545273, 0, 0.02352941, 1, 1,
0.4275136, 1.991791, -0.8459983, 0, 0.01568628, 1, 1,
0.4277609, -2.437982, 1.822544, 0, 0.01176471, 1, 1,
0.4277982, -0.3705611, 2.510672, 0, 0.003921569, 1, 1,
0.4289347, 0.1975683, 0.4178583, 0.003921569, 0, 1, 1,
0.4301718, -0.453813, 2.263372, 0.007843138, 0, 1, 1,
0.4316263, -0.3976671, 2.304148, 0.01568628, 0, 1, 1,
0.4336834, 0.5858802, -0.02674599, 0.01960784, 0, 1, 1,
0.434508, 1.540478, 1.927247, 0.02745098, 0, 1, 1,
0.4357772, -1.415925, 2.354038, 0.03137255, 0, 1, 1,
0.438089, 1.449208, -1.177504, 0.03921569, 0, 1, 1,
0.4407366, -0.7502331, 2.68081, 0.04313726, 0, 1, 1,
0.4412268, -0.5691985, 3.109457, 0.05098039, 0, 1, 1,
0.4420668, 1.307464, -0.9486284, 0.05490196, 0, 1, 1,
0.444803, 0.5962864, -0.01066813, 0.0627451, 0, 1, 1,
0.4483555, -0.375972, 4.178509, 0.06666667, 0, 1, 1,
0.4500199, 0.151087, 1.420385, 0.07450981, 0, 1, 1,
0.4577561, -1.655562, 3.020396, 0.07843138, 0, 1, 1,
0.4584184, -0.9035665, 3.097179, 0.08627451, 0, 1, 1,
0.4585733, -0.797124, 3.483731, 0.09019608, 0, 1, 1,
0.4619508, -0.03091927, 1.021485, 0.09803922, 0, 1, 1,
0.4641197, 0.8402984, -0.525424, 0.1058824, 0, 1, 1,
0.466978, -2.388552, 3.899926, 0.1098039, 0, 1, 1,
0.4732848, -0.6317511, 3.49729, 0.1176471, 0, 1, 1,
0.4784458, -1.603707, 3.754878, 0.1215686, 0, 1, 1,
0.4809133, -0.191213, -0.2924965, 0.1294118, 0, 1, 1,
0.4855616, -0.1863046, 1.99352, 0.1333333, 0, 1, 1,
0.504302, -0.279232, 4.172375, 0.1411765, 0, 1, 1,
0.5043297, -0.436718, 0.873336, 0.145098, 0, 1, 1,
0.5068559, 0.04771569, 0.747142, 0.1529412, 0, 1, 1,
0.5199547, 0.6090181, 0.0317161, 0.1568628, 0, 1, 1,
0.5211226, 0.5998958, 1.627267, 0.1647059, 0, 1, 1,
0.5215065, 1.167102, 0.6875596, 0.1686275, 0, 1, 1,
0.5223437, -0.9325443, 2.91924, 0.1764706, 0, 1, 1,
0.5285805, 0.6895895, 0.6686786, 0.1803922, 0, 1, 1,
0.530217, 0.5127013, 1.603888, 0.1882353, 0, 1, 1,
0.5302734, 1.190021, -1.475919, 0.1921569, 0, 1, 1,
0.5320118, 1.673227, -0.3819201, 0.2, 0, 1, 1,
0.5320551, 0.05644465, 2.731488, 0.2078431, 0, 1, 1,
0.5386573, 1.247773, -0.237831, 0.2117647, 0, 1, 1,
0.5412386, 0.4980213, -0.6368327, 0.2196078, 0, 1, 1,
0.543558, 0.8097125, -0.7002011, 0.2235294, 0, 1, 1,
0.5466784, 0.5204605, -0.2142145, 0.2313726, 0, 1, 1,
0.547028, 2.077555, 1.272784, 0.2352941, 0, 1, 1,
0.5492671, 1.131285, -0.3487772, 0.2431373, 0, 1, 1,
0.5543452, 1.881414, 0.6496315, 0.2470588, 0, 1, 1,
0.5547788, 1.242746, -0.4643237, 0.254902, 0, 1, 1,
0.5615965, 0.7303353, 0.5050743, 0.2588235, 0, 1, 1,
0.5687776, 1.224332, 0.2384768, 0.2666667, 0, 1, 1,
0.5702003, 0.3704599, 1.041565, 0.2705882, 0, 1, 1,
0.5744181, 0.08306918, 2.928297, 0.2784314, 0, 1, 1,
0.5775043, 0.05187963, 1.60452, 0.282353, 0, 1, 1,
0.5787496, 0.0923366, -0.03701132, 0.2901961, 0, 1, 1,
0.581607, -0.2809519, 1.38149, 0.2941177, 0, 1, 1,
0.5838557, 1.387792, 2.083987, 0.3019608, 0, 1, 1,
0.5860832, 0.4783393, 2.089554, 0.3098039, 0, 1, 1,
0.5864727, -0.4743733, 2.311825, 0.3137255, 0, 1, 1,
0.6040991, -0.6992302, 1.359557, 0.3215686, 0, 1, 1,
0.605552, 1.490171, 1.04999, 0.3254902, 0, 1, 1,
0.6069445, 1.856542, 1.596402, 0.3333333, 0, 1, 1,
0.6076645, 1.546309, 0.2278251, 0.3372549, 0, 1, 1,
0.610226, 1.021597, -0.366898, 0.345098, 0, 1, 1,
0.614424, 0.721959, -0.2779335, 0.3490196, 0, 1, 1,
0.6145598, 1.287176, 0.8506378, 0.3568628, 0, 1, 1,
0.6190274, 1.161387, -0.1273487, 0.3607843, 0, 1, 1,
0.6197835, -0.6025428, 4.338241, 0.3686275, 0, 1, 1,
0.6267247, -0.8498663, 0.7021157, 0.372549, 0, 1, 1,
0.638761, 0.780747, 0.4784451, 0.3803922, 0, 1, 1,
0.6503215, -1.559829, 1.904975, 0.3843137, 0, 1, 1,
0.65051, 0.7386722, 0.4659441, 0.3921569, 0, 1, 1,
0.6543514, 2.333066, 1.414197, 0.3960784, 0, 1, 1,
0.6717505, -0.04861362, 0.2428142, 0.4039216, 0, 1, 1,
0.6737525, -1.577919, 2.598246, 0.4117647, 0, 1, 1,
0.6758988, 1.541347, 2.160623, 0.4156863, 0, 1, 1,
0.6782232, -0.4525145, 2.802709, 0.4235294, 0, 1, 1,
0.685017, 0.7659421, 0.636539, 0.427451, 0, 1, 1,
0.6863802, -1.062483, 4.659753, 0.4352941, 0, 1, 1,
0.6884729, -0.2059833, 1.981183, 0.4392157, 0, 1, 1,
0.6895838, -1.581731, 3.641179, 0.4470588, 0, 1, 1,
0.6933493, -0.8258322, 1.94005, 0.4509804, 0, 1, 1,
0.6960687, 0.6451335, 3.411298, 0.4588235, 0, 1, 1,
0.6969993, -0.8934102, 1.302926, 0.4627451, 0, 1, 1,
0.6972376, 0.2014241, 2.58561, 0.4705882, 0, 1, 1,
0.697677, 1.382328, 0.6373687, 0.4745098, 0, 1, 1,
0.6983252, 0.8648546, 1.019075, 0.4823529, 0, 1, 1,
0.70522, -0.6154553, 2.954199, 0.4862745, 0, 1, 1,
0.7105312, -1.211403, 4.526131, 0.4941176, 0, 1, 1,
0.720161, -0.3197707, 1.069715, 0.5019608, 0, 1, 1,
0.7255381, -0.430315, 1.426884, 0.5058824, 0, 1, 1,
0.7255592, -0.5190767, 3.074016, 0.5137255, 0, 1, 1,
0.7286626, 2.61516, -0.3346239, 0.5176471, 0, 1, 1,
0.7303434, 0.8808411, -1.871812, 0.5254902, 0, 1, 1,
0.7355794, 1.207023, 1.708093, 0.5294118, 0, 1, 1,
0.741079, 1.435483, 1.323093, 0.5372549, 0, 1, 1,
0.7411294, 0.1166568, 0.3044181, 0.5411765, 0, 1, 1,
0.7414529, 1.047896, 0.6544048, 0.5490196, 0, 1, 1,
0.7469822, -0.1251263, 0.002699299, 0.5529412, 0, 1, 1,
0.7573644, -0.1043684, 2.602154, 0.5607843, 0, 1, 1,
0.762588, -1.865495, 4.386149, 0.5647059, 0, 1, 1,
0.7629185, -0.06788068, 1.338568, 0.572549, 0, 1, 1,
0.7747127, 0.02826868, 1.449752, 0.5764706, 0, 1, 1,
0.7826571, 0.4085848, 0.7283359, 0.5843138, 0, 1, 1,
0.7838495, 0.01347658, 1.436476, 0.5882353, 0, 1, 1,
0.7867592, 0.09804058, 1.206943, 0.5960785, 0, 1, 1,
0.7918176, 0.182775, 0.3759046, 0.6039216, 0, 1, 1,
0.7918373, 0.3125191, 1.995827, 0.6078432, 0, 1, 1,
0.7940639, 0.2680444, 0.9903479, 0.6156863, 0, 1, 1,
0.7967703, -0.2345947, 1.795436, 0.6196079, 0, 1, 1,
0.8001755, 1.204234, 2.895552, 0.627451, 0, 1, 1,
0.8071154, 1.644625, 2.142874, 0.6313726, 0, 1, 1,
0.8093667, 0.4033299, 0.914927, 0.6392157, 0, 1, 1,
0.8109491, -0.6832671, 2.05652, 0.6431373, 0, 1, 1,
0.8130279, -1.005787, 2.121634, 0.6509804, 0, 1, 1,
0.814678, 0.5091988, 1.132295, 0.654902, 0, 1, 1,
0.8159194, 1.277089, -1.299586, 0.6627451, 0, 1, 1,
0.8306463, 0.4827484, 0.1083695, 0.6666667, 0, 1, 1,
0.8329202, -1.135058, 0.2537367, 0.6745098, 0, 1, 1,
0.8338748, -1.278018, 3.503218, 0.6784314, 0, 1, 1,
0.8381566, 1.000998, 0.7936152, 0.6862745, 0, 1, 1,
0.8426783, -0.5521592, 1.719344, 0.6901961, 0, 1, 1,
0.8428301, 0.5500913, -0.3827983, 0.6980392, 0, 1, 1,
0.847713, -0.174096, 2.837898, 0.7058824, 0, 1, 1,
0.8492408, -0.9690456, 1.246434, 0.7098039, 0, 1, 1,
0.8577266, -0.6577612, 1.638708, 0.7176471, 0, 1, 1,
0.8596437, 1.868668, 1.291798, 0.7215686, 0, 1, 1,
0.8641764, -1.644232, 3.195534, 0.7294118, 0, 1, 1,
0.8721688, -0.3624147, 1.627865, 0.7333333, 0, 1, 1,
0.8748093, 0.3610606, 0.6092965, 0.7411765, 0, 1, 1,
0.8820485, 1.118177, -0.01631563, 0.7450981, 0, 1, 1,
0.8841027, -0.9972436, 2.227647, 0.7529412, 0, 1, 1,
0.884451, -0.1057694, 2.414623, 0.7568628, 0, 1, 1,
0.8862393, 0.1289225, 0.5977443, 0.7647059, 0, 1, 1,
0.8864549, 0.1889991, 1.330473, 0.7686275, 0, 1, 1,
0.8920466, -2.242621, 3.211218, 0.7764706, 0, 1, 1,
0.8957136, -0.3541715, 1.540607, 0.7803922, 0, 1, 1,
0.9073085, -0.4444864, 3.299196, 0.7882353, 0, 1, 1,
0.9101492, 1.581999, 1.436061, 0.7921569, 0, 1, 1,
0.9175382, -0.3161893, 1.192729, 0.8, 0, 1, 1,
0.9242508, -1.044545, 3.177241, 0.8078431, 0, 1, 1,
0.9305797, -0.6534638, 3.083776, 0.8117647, 0, 1, 1,
0.9310589, -0.4729916, 1.802014, 0.8196079, 0, 1, 1,
0.9313678, 0.9754286, 0.846576, 0.8235294, 0, 1, 1,
0.9324734, 0.1019542, 3.160861, 0.8313726, 0, 1, 1,
0.9366918, -0.7397587, 2.604763, 0.8352941, 0, 1, 1,
0.9401526, -0.4893156, 2.984353, 0.8431373, 0, 1, 1,
0.9450137, 0.1991725, 1.717095, 0.8470588, 0, 1, 1,
0.9467636, -0.1381427, 0.5427004, 0.854902, 0, 1, 1,
0.9496772, 0.7002307, 1.394888, 0.8588235, 0, 1, 1,
0.951949, -0.4767252, 3.008309, 0.8666667, 0, 1, 1,
0.9526249, 0.7950811, 0.3391574, 0.8705882, 0, 1, 1,
0.9543158, 0.1204084, 1.926543, 0.8784314, 0, 1, 1,
0.9582657, 1.908491, 1.544126, 0.8823529, 0, 1, 1,
0.9601074, -1.187771, 1.213829, 0.8901961, 0, 1, 1,
0.9653189, 2.598256, -0.1399112, 0.8941177, 0, 1, 1,
0.9685801, -1.185067, 1.896281, 0.9019608, 0, 1, 1,
0.9751275, -0.5083154, 3.194344, 0.9098039, 0, 1, 1,
0.9773428, 0.1834955, 2.789992, 0.9137255, 0, 1, 1,
0.9870834, -1.756522, 1.296521, 0.9215686, 0, 1, 1,
0.9924405, 0.9336865, 2.644759, 0.9254902, 0, 1, 1,
0.9952704, -0.8208103, 1.713989, 0.9333333, 0, 1, 1,
0.9966252, 0.5135283, 0.9400899, 0.9372549, 0, 1, 1,
0.9983145, -0.5167344, 2.100257, 0.945098, 0, 1, 1,
0.9992351, -0.7390914, 1.897604, 0.9490196, 0, 1, 1,
0.9995912, 0.1768716, 1.253406, 0.9568627, 0, 1, 1,
1.004776, 1.627561, 0.9503795, 0.9607843, 0, 1, 1,
1.006232, 1.973848, 0.3469767, 0.9686275, 0, 1, 1,
1.010629, 1.102991, 1.916191, 0.972549, 0, 1, 1,
1.011476, -0.8413053, 3.38521, 0.9803922, 0, 1, 1,
1.021416, 2.168788, -0.7231206, 0.9843137, 0, 1, 1,
1.024291, 1.819097, 1.248396, 0.9921569, 0, 1, 1,
1.02472, 1.88812, 1.662018, 0.9960784, 0, 1, 1,
1.043286, -0.06820358, 1.893772, 1, 0, 0.9960784, 1,
1.052419, -0.1408394, 2.953922, 1, 0, 0.9882353, 1,
1.053005, -1.46891, 3.443589, 1, 0, 0.9843137, 1,
1.055346, -1.330029, 1.49457, 1, 0, 0.9764706, 1,
1.057785, -1.238317, 0.3344817, 1, 0, 0.972549, 1,
1.059549, -0.04795161, 1.896757, 1, 0, 0.9647059, 1,
1.069985, -0.148587, 1.721123, 1, 0, 0.9607843, 1,
1.07825, -0.7398643, 1.067838, 1, 0, 0.9529412, 1,
1.081997, -0.07393542, 1.30352, 1, 0, 0.9490196, 1,
1.084153, -0.6384588, 3.398365, 1, 0, 0.9411765, 1,
1.089676, 0.9467666, 1.336463, 1, 0, 0.9372549, 1,
1.09163, 1.978538, 1.079508, 1, 0, 0.9294118, 1,
1.093199, -0.6873096, 3.666805, 1, 0, 0.9254902, 1,
1.093486, -2.123491, 2.92916, 1, 0, 0.9176471, 1,
1.096844, -0.7172216, 2.476122, 1, 0, 0.9137255, 1,
1.102201, 1.053291, 0.4836306, 1, 0, 0.9058824, 1,
1.105761, -0.4877731, 1.046567, 1, 0, 0.9019608, 1,
1.107687, 0.1043689, 3.102388, 1, 0, 0.8941177, 1,
1.113192, 0.4347485, 2.119629, 1, 0, 0.8862745, 1,
1.113492, -0.7572971, 0.423007, 1, 0, 0.8823529, 1,
1.113793, 0.2277434, 1.85712, 1, 0, 0.8745098, 1,
1.114423, 0.9567502, 1.63105, 1, 0, 0.8705882, 1,
1.122372, -0.7192134, 3.024146, 1, 0, 0.8627451, 1,
1.150905, 0.9093228, 3.416511, 1, 0, 0.8588235, 1,
1.152213, -1.268189, 2.139168, 1, 0, 0.8509804, 1,
1.175519, 0.6938307, 0.1765068, 1, 0, 0.8470588, 1,
1.179131, 0.4604494, 1.608526, 1, 0, 0.8392157, 1,
1.179756, -0.2007635, 2.873274, 1, 0, 0.8352941, 1,
1.184109, 0.2705777, 1.368239, 1, 0, 0.827451, 1,
1.187192, -2.093514, 2.654391, 1, 0, 0.8235294, 1,
1.190618, -2.176524, 1.943106, 1, 0, 0.8156863, 1,
1.205854, 0.3443594, 0.5910099, 1, 0, 0.8117647, 1,
1.214866, -0.5937245, 0.9987876, 1, 0, 0.8039216, 1,
1.216701, -0.4866171, 1.194306, 1, 0, 0.7960784, 1,
1.227709, -0.0187606, 2.346784, 1, 0, 0.7921569, 1,
1.228134, 1.539605, 0.08119974, 1, 0, 0.7843137, 1,
1.237633, 0.4182863, 1.306191, 1, 0, 0.7803922, 1,
1.238956, 0.0562081, 1.270499, 1, 0, 0.772549, 1,
1.246439, 2.07086, 0.549404, 1, 0, 0.7686275, 1,
1.256958, -0.3617322, 3.663257, 1, 0, 0.7607843, 1,
1.275313, -0.5442228, 0.7535777, 1, 0, 0.7568628, 1,
1.277012, 1.436606, -0.5180372, 1, 0, 0.7490196, 1,
1.277339, 0.479103, 3.375661, 1, 0, 0.7450981, 1,
1.278296, -0.6233207, 3.859189, 1, 0, 0.7372549, 1,
1.279489, -1.657558, 1.246518, 1, 0, 0.7333333, 1,
1.280009, -0.8364993, 1.627295, 1, 0, 0.7254902, 1,
1.283882, 1.385257, 0.08310609, 1, 0, 0.7215686, 1,
1.288513, 2.532281, -0.9023291, 1, 0, 0.7137255, 1,
1.290335, 0.4657424, 1.212362, 1, 0, 0.7098039, 1,
1.290578, -1.213975, 2.420021, 1, 0, 0.7019608, 1,
1.293211, -1.072332e-06, 2.374994, 1, 0, 0.6941177, 1,
1.305612, 0.1228323, 1.108902, 1, 0, 0.6901961, 1,
1.305941, -0.04286269, 0.7548408, 1, 0, 0.682353, 1,
1.30951, 0.05752914, 1.160074, 1, 0, 0.6784314, 1,
1.315482, 1.902102, -2.224026, 1, 0, 0.6705883, 1,
1.320722, -1.788645, 0.5829564, 1, 0, 0.6666667, 1,
1.325083, -0.5330802, 2.261028, 1, 0, 0.6588235, 1,
1.330553, -0.2911334, 2.648889, 1, 0, 0.654902, 1,
1.33693, 1.807983, 0.3241865, 1, 0, 0.6470588, 1,
1.354154, 2.5344, 1.24172, 1, 0, 0.6431373, 1,
1.355053, 0.6815155, 1.098352, 1, 0, 0.6352941, 1,
1.357268, 0.8886318, 0.7711517, 1, 0, 0.6313726, 1,
1.358128, 0.7295276, 3.161024, 1, 0, 0.6235294, 1,
1.361706, 1.055008, 0.6930562, 1, 0, 0.6196079, 1,
1.364932, 1.082722, 0.02968388, 1, 0, 0.6117647, 1,
1.370272, 0.719588, 1.756117, 1, 0, 0.6078432, 1,
1.370901, 1.36365, 1.314321, 1, 0, 0.6, 1,
1.381747, 0.3453939, 2.392583, 1, 0, 0.5921569, 1,
1.388915, 0.2119471, 2.431704, 1, 0, 0.5882353, 1,
1.403197, 0.4784631, 1.742885, 1, 0, 0.5803922, 1,
1.404302, 0.4997773, 1.264434, 1, 0, 0.5764706, 1,
1.417293, 0.3364122, 1.756444, 1, 0, 0.5686275, 1,
1.420805, -0.04011137, 1.367722, 1, 0, 0.5647059, 1,
1.421691, 0.1447398, 2.722135, 1, 0, 0.5568628, 1,
1.423257, 0.5711069, 2.593639, 1, 0, 0.5529412, 1,
1.432727, -0.3719388, 1.82784, 1, 0, 0.5450981, 1,
1.439054, -1.232303, 3.003329, 1, 0, 0.5411765, 1,
1.443401, 0.9915663, 2.400524, 1, 0, 0.5333334, 1,
1.444539, 0.02989529, 1.798291, 1, 0, 0.5294118, 1,
1.445725, -0.2515439, 1.938983, 1, 0, 0.5215687, 1,
1.458767, -1.052341, 2.935035, 1, 0, 0.5176471, 1,
1.469236, 0.663137, 1.101877, 1, 0, 0.509804, 1,
1.482493, -0.3788897, 2.120404, 1, 0, 0.5058824, 1,
1.48253, 1.029417, 0.9329922, 1, 0, 0.4980392, 1,
1.502255, 0.7184694, 1.805171, 1, 0, 0.4901961, 1,
1.508578, -0.2331614, 2.045628, 1, 0, 0.4862745, 1,
1.511924, 0.06456637, 0.8055115, 1, 0, 0.4784314, 1,
1.515926, -0.6580887, 2.495498, 1, 0, 0.4745098, 1,
1.521986, 0.5590599, 1.155689, 1, 0, 0.4666667, 1,
1.524163, 1.732171, -0.6438676, 1, 0, 0.4627451, 1,
1.536098, 0.1304878, 0.1306498, 1, 0, 0.454902, 1,
1.572774, 0.1239385, 1.543413, 1, 0, 0.4509804, 1,
1.576671, 0.4860741, 4.142318, 1, 0, 0.4431373, 1,
1.580492, 1.547562, 0.7978685, 1, 0, 0.4392157, 1,
1.581312, 0.647702, 1.08433, 1, 0, 0.4313726, 1,
1.584771, -0.5074007, 2.144655, 1, 0, 0.427451, 1,
1.588043, 0.3465546, 0.1978946, 1, 0, 0.4196078, 1,
1.592095, 0.3060577, 2.348341, 1, 0, 0.4156863, 1,
1.599892, -0.3764964, 2.608463, 1, 0, 0.4078431, 1,
1.603694, -0.4765852, 0.8293743, 1, 0, 0.4039216, 1,
1.633567, -0.2226395, 0.5169563, 1, 0, 0.3960784, 1,
1.641138, 0.7379622, 1.139718, 1, 0, 0.3882353, 1,
1.647407, 1.20624, -0.1756975, 1, 0, 0.3843137, 1,
1.656345, -1.136992, 2.148917, 1, 0, 0.3764706, 1,
1.660245, -0.5496608, 1.826658, 1, 0, 0.372549, 1,
1.66221, 0.8397426, 2.037079, 1, 0, 0.3647059, 1,
1.665014, -0.6451623, 0.8019414, 1, 0, 0.3607843, 1,
1.665463, -0.9699686, 2.169111, 1, 0, 0.3529412, 1,
1.673316, -0.8891777, 1.266751, 1, 0, 0.3490196, 1,
1.678161, 0.1600104, 2.696387, 1, 0, 0.3411765, 1,
1.687218, 0.9946333, -1.010273, 1, 0, 0.3372549, 1,
1.69441, 0.1201451, 0.3833694, 1, 0, 0.3294118, 1,
1.697423, -0.4947656, 4.13762, 1, 0, 0.3254902, 1,
1.698533, -1.897315, 1.043264, 1, 0, 0.3176471, 1,
1.717563, 0.2431651, 0.7946445, 1, 0, 0.3137255, 1,
1.720105, -0.05075732, -0.8639932, 1, 0, 0.3058824, 1,
1.728157, 0.5475804, 1.874985, 1, 0, 0.2980392, 1,
1.736607, 0.4274185, 2.896199, 1, 0, 0.2941177, 1,
1.740068, 0.3529064, 0.7636069, 1, 0, 0.2862745, 1,
1.751548, 1.560721, -0.02349282, 1, 0, 0.282353, 1,
1.769198, -0.3517066, 2.394258, 1, 0, 0.2745098, 1,
1.782003, 0.3546726, 0.3438695, 1, 0, 0.2705882, 1,
1.788413, -1.532423, 1.411678, 1, 0, 0.2627451, 1,
1.791726, -1.041307, 2.91874, 1, 0, 0.2588235, 1,
1.797297, -1.39125, 1.303435, 1, 0, 0.2509804, 1,
1.812044, -0.89651, 2.688147, 1, 0, 0.2470588, 1,
1.813794, -0.7527726, 3.595313, 1, 0, 0.2392157, 1,
1.817645, -1.175722, 1.300016, 1, 0, 0.2352941, 1,
1.832395, 0.2086501, 0.9090422, 1, 0, 0.227451, 1,
1.834254, -0.7413669, 2.887504, 1, 0, 0.2235294, 1,
1.848516, 0.5877212, 1.266149, 1, 0, 0.2156863, 1,
1.879132, 1.117067, 2.184714, 1, 0, 0.2117647, 1,
1.900622, 1.353761, 1.503121, 1, 0, 0.2039216, 1,
1.923692, -0.3742751, 2.975381, 1, 0, 0.1960784, 1,
1.924865, 1.011357, 1.428099, 1, 0, 0.1921569, 1,
1.968708, 0.72496, 1.27712, 1, 0, 0.1843137, 1,
1.975274, -1.186833, 4.58976, 1, 0, 0.1803922, 1,
1.976948, -0.3844196, 0.3722922, 1, 0, 0.172549, 1,
1.98461, -0.8078569, 0.348797, 1, 0, 0.1686275, 1,
2.032578, 0.08554017, 1.568265, 1, 0, 0.1607843, 1,
2.038618, -1.591756, 3.788173, 1, 0, 0.1568628, 1,
2.065983, 0.1671419, 2.728538, 1, 0, 0.1490196, 1,
2.081718, 0.01004443, 1.815748, 1, 0, 0.145098, 1,
2.113662, -0.4884043, 2.596095, 1, 0, 0.1372549, 1,
2.121408, -0.5377318, 2.251618, 1, 0, 0.1333333, 1,
2.124342, 0.3538396, 0.1375049, 1, 0, 0.1254902, 1,
2.132102, 0.4486314, 2.326904, 1, 0, 0.1215686, 1,
2.143342, 0.4422497, 0.9661976, 1, 0, 0.1137255, 1,
2.146013, -0.6894553, 2.125158, 1, 0, 0.1098039, 1,
2.151987, -1.833034, 4.331157, 1, 0, 0.1019608, 1,
2.153035, -0.9504636, 3.680128, 1, 0, 0.09411765, 1,
2.201038, -1.404478, 1.215899, 1, 0, 0.09019608, 1,
2.220427, 1.261521, 0.9533283, 1, 0, 0.08235294, 1,
2.222476, 0.695201, 0.1490619, 1, 0, 0.07843138, 1,
2.249701, -0.4305158, 2.255881, 1, 0, 0.07058824, 1,
2.250012, -1.193914, 3.893586, 1, 0, 0.06666667, 1,
2.265721, 0.4300634, -0.1578804, 1, 0, 0.05882353, 1,
2.272025, 1.275962, 1.843188, 1, 0, 0.05490196, 1,
2.331142, 1.145889, 2.050451, 1, 0, 0.04705882, 1,
2.355642, 0.1159151, 2.868954, 1, 0, 0.04313726, 1,
2.394758, -0.3139742, 0.9822957, 1, 0, 0.03529412, 1,
2.413404, 0.3369791, 1.549483, 1, 0, 0.03137255, 1,
2.441731, 1.622108, 1.639407, 1, 0, 0.02352941, 1,
2.470126, -0.4723874, 2.613379, 1, 0, 0.01960784, 1,
2.530925, 2.502213, 0.5728164, 1, 0, 0.01176471, 1,
2.868692, -0.8495346, 0.5247299, 1, 0, 0.007843138, 1
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
0.06187046, -4.330012, -6.821796, 0, -0.5, 0.5, 0.5,
0.06187046, -4.330012, -6.821796, 1, -0.5, 0.5, 0.5,
0.06187046, -4.330012, -6.821796, 1, 1.5, 0.5, 0.5,
0.06187046, -4.330012, -6.821796, 0, 1.5, 0.5, 0.5
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
-3.696463, 0.4972239, -6.821796, 0, -0.5, 0.5, 0.5,
-3.696463, 0.4972239, -6.821796, 1, -0.5, 0.5, 0.5,
-3.696463, 0.4972239, -6.821796, 1, 1.5, 0.5, 0.5,
-3.696463, 0.4972239, -6.821796, 0, 1.5, 0.5, 0.5
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
-3.696463, -4.330012, -0.05052948, 0, -0.5, 0.5, 0.5,
-3.696463, -4.330012, -0.05052948, 1, -0.5, 0.5, 0.5,
-3.696463, -4.330012, -0.05052948, 1, 1.5, 0.5, 0.5,
-3.696463, -4.330012, -0.05052948, 0, 1.5, 0.5, 0.5
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
-2, -3.216034, -5.259196,
2, -3.216034, -5.259196,
-2, -3.216034, -5.259196,
-2, -3.401697, -5.51963,
-1, -3.216034, -5.259196,
-1, -3.401697, -5.51963,
0, -3.216034, -5.259196,
0, -3.401697, -5.51963,
1, -3.216034, -5.259196,
1, -3.401697, -5.51963,
2, -3.216034, -5.259196,
2, -3.401697, -5.51963
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
-2, -3.773023, -6.040496, 0, -0.5, 0.5, 0.5,
-2, -3.773023, -6.040496, 1, -0.5, 0.5, 0.5,
-2, -3.773023, -6.040496, 1, 1.5, 0.5, 0.5,
-2, -3.773023, -6.040496, 0, 1.5, 0.5, 0.5,
-1, -3.773023, -6.040496, 0, -0.5, 0.5, 0.5,
-1, -3.773023, -6.040496, 1, -0.5, 0.5, 0.5,
-1, -3.773023, -6.040496, 1, 1.5, 0.5, 0.5,
-1, -3.773023, -6.040496, 0, 1.5, 0.5, 0.5,
0, -3.773023, -6.040496, 0, -0.5, 0.5, 0.5,
0, -3.773023, -6.040496, 1, -0.5, 0.5, 0.5,
0, -3.773023, -6.040496, 1, 1.5, 0.5, 0.5,
0, -3.773023, -6.040496, 0, 1.5, 0.5, 0.5,
1, -3.773023, -6.040496, 0, -0.5, 0.5, 0.5,
1, -3.773023, -6.040496, 1, -0.5, 0.5, 0.5,
1, -3.773023, -6.040496, 1, 1.5, 0.5, 0.5,
1, -3.773023, -6.040496, 0, 1.5, 0.5, 0.5,
2, -3.773023, -6.040496, 0, -0.5, 0.5, 0.5,
2, -3.773023, -6.040496, 1, -0.5, 0.5, 0.5,
2, -3.773023, -6.040496, 1, 1.5, 0.5, 0.5,
2, -3.773023, -6.040496, 0, 1.5, 0.5, 0.5
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
-2.829155, -2, -5.259196,
-2.829155, 4, -5.259196,
-2.829155, -2, -5.259196,
-2.973707, -2, -5.51963,
-2.829155, 0, -5.259196,
-2.973707, 0, -5.51963,
-2.829155, 2, -5.259196,
-2.973707, 2, -5.51963,
-2.829155, 4, -5.259196,
-2.973707, 4, -5.51963
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
-3.262809, -2, -6.040496, 0, -0.5, 0.5, 0.5,
-3.262809, -2, -6.040496, 1, -0.5, 0.5, 0.5,
-3.262809, -2, -6.040496, 1, 1.5, 0.5, 0.5,
-3.262809, -2, -6.040496, 0, 1.5, 0.5, 0.5,
-3.262809, 0, -6.040496, 0, -0.5, 0.5, 0.5,
-3.262809, 0, -6.040496, 1, -0.5, 0.5, 0.5,
-3.262809, 0, -6.040496, 1, 1.5, 0.5, 0.5,
-3.262809, 0, -6.040496, 0, 1.5, 0.5, 0.5,
-3.262809, 2, -6.040496, 0, -0.5, 0.5, 0.5,
-3.262809, 2, -6.040496, 1, -0.5, 0.5, 0.5,
-3.262809, 2, -6.040496, 1, 1.5, 0.5, 0.5,
-3.262809, 2, -6.040496, 0, 1.5, 0.5, 0.5,
-3.262809, 4, -6.040496, 0, -0.5, 0.5, 0.5,
-3.262809, 4, -6.040496, 1, -0.5, 0.5, 0.5,
-3.262809, 4, -6.040496, 1, 1.5, 0.5, 0.5,
-3.262809, 4, -6.040496, 0, 1.5, 0.5, 0.5
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
-2.829155, -3.216034, -4,
-2.829155, -3.216034, 4,
-2.829155, -3.216034, -4,
-2.973707, -3.401697, -4,
-2.829155, -3.216034, -2,
-2.973707, -3.401697, -2,
-2.829155, -3.216034, 0,
-2.973707, -3.401697, 0,
-2.829155, -3.216034, 2,
-2.973707, -3.401697, 2,
-2.829155, -3.216034, 4,
-2.973707, -3.401697, 4
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
-3.262809, -3.773023, -4, 0, -0.5, 0.5, 0.5,
-3.262809, -3.773023, -4, 1, -0.5, 0.5, 0.5,
-3.262809, -3.773023, -4, 1, 1.5, 0.5, 0.5,
-3.262809, -3.773023, -4, 0, 1.5, 0.5, 0.5,
-3.262809, -3.773023, -2, 0, -0.5, 0.5, 0.5,
-3.262809, -3.773023, -2, 1, -0.5, 0.5, 0.5,
-3.262809, -3.773023, -2, 1, 1.5, 0.5, 0.5,
-3.262809, -3.773023, -2, 0, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 0, 0, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 0, 1, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 0, 1, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 0, 0, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 2, 0, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 2, 1, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 2, 1, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 2, 0, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 4, 0, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 4, 1, -0.5, 0.5, 0.5,
-3.262809, -3.773023, 4, 1, 1.5, 0.5, 0.5,
-3.262809, -3.773023, 4, 0, 1.5, 0.5, 0.5
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
-2.829155, -3.216034, -5.259196,
-2.829155, 4.210482, -5.259196,
-2.829155, -3.216034, 5.158137,
-2.829155, 4.210482, 5.158137,
-2.829155, -3.216034, -5.259196,
-2.829155, -3.216034, 5.158137,
-2.829155, 4.210482, -5.259196,
-2.829155, 4.210482, 5.158137,
-2.829155, -3.216034, -5.259196,
2.952896, -3.216034, -5.259196,
-2.829155, -3.216034, 5.158137,
2.952896, -3.216034, 5.158137,
-2.829155, 4.210482, -5.259196,
2.952896, 4.210482, -5.259196,
-2.829155, 4.210482, 5.158137,
2.952896, 4.210482, 5.158137,
2.952896, -3.216034, -5.259196,
2.952896, 4.210482, -5.259196,
2.952896, -3.216034, 5.158137,
2.952896, 4.210482, 5.158137,
2.952896, -3.216034, -5.259196,
2.952896, -3.216034, 5.158137,
2.952896, 4.210482, -5.259196,
2.952896, 4.210482, 5.158137
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
var radius = 7.496793;
var distance = 33.35408;
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
mvMatrix.translate( -0.06187046, -0.4972239, 0.05052948 );
mvMatrix.scale( 1.401869, 1.091451, 0.7780954 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.35408);
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
Chlorobenzene<-read.table("Chlorobenzene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorobenzene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzene' not found
```

```r
y<-Chlorobenzene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzene' not found
```

```r
z<-Chlorobenzene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzene' not found
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
-2.744951, 0.3655516, -1.244065, 0, 0, 1, 1, 1,
-2.715061, -0.2273592, -0.7168748, 1, 0, 0, 1, 1,
-2.367858, -1.324472, -1.384778, 1, 0, 0, 1, 1,
-2.342215, 0.7521884, -0.627574, 1, 0, 0, 1, 1,
-2.303357, -0.3325144, -1.333491, 1, 0, 0, 1, 1,
-2.301683, -0.4663512, -1.274042, 1, 0, 0, 1, 1,
-2.244392, -1.069447, -1.115889, 0, 0, 0, 1, 1,
-2.244045, -0.1656985, -1.639147, 0, 0, 0, 1, 1,
-2.24325, 1.131765, -0.2135375, 0, 0, 0, 1, 1,
-2.225118, 0.4967012, -0.9028569, 0, 0, 0, 1, 1,
-2.190771, 0.1963201, -1.861909, 0, 0, 0, 1, 1,
-2.173601, -0.4985089, -0.9214755, 0, 0, 0, 1, 1,
-2.163814, -0.9300029, -1.307531, 0, 0, 0, 1, 1,
-2.136088, -1.665937, -0.5819969, 1, 1, 1, 1, 1,
-2.122252, -0.9763141, -0.06130936, 1, 1, 1, 1, 1,
-2.102897, 0.09516744, -0.969736, 1, 1, 1, 1, 1,
-2.099225, -1.433116, -1.348062, 1, 1, 1, 1, 1,
-2.097167, 0.9277237, -1.718251, 1, 1, 1, 1, 1,
-2.070772, 0.7804507, -1.11643, 1, 1, 1, 1, 1,
-2.066882, 2.47489, 0.6698545, 1, 1, 1, 1, 1,
-1.981964, 0.171762, -1.725802, 1, 1, 1, 1, 1,
-1.963051, -2.352414, -1.574542, 1, 1, 1, 1, 1,
-1.959792, 1.397755, -0.6661134, 1, 1, 1, 1, 1,
-1.941158, 0.1778458, 0.8775392, 1, 1, 1, 1, 1,
-1.937091, -0.2050527, -2.513469, 1, 1, 1, 1, 1,
-1.927524, 1.318396, -1.328836, 1, 1, 1, 1, 1,
-1.926165, 1.060121, -0.5171345, 1, 1, 1, 1, 1,
-1.912862, -1.616369, -1.167876, 1, 1, 1, 1, 1,
-1.897393, -0.008077821, -2.804907, 0, 0, 1, 1, 1,
-1.879787, -0.6222749, -1.72747, 1, 0, 0, 1, 1,
-1.869827, 0.4121199, -1.75438, 1, 0, 0, 1, 1,
-1.867192, -0.2410252, -2.259305, 1, 0, 0, 1, 1,
-1.860566, 1.049048, 0.8311663, 1, 0, 0, 1, 1,
-1.859103, 0.06402733, -0.9585727, 1, 0, 0, 1, 1,
-1.858594, 0.8829306, -1.951779, 0, 0, 0, 1, 1,
-1.813598, -0.3016935, -1.824116, 0, 0, 0, 1, 1,
-1.793344, -0.1951531, -2.017864, 0, 0, 0, 1, 1,
-1.782488, 1.063457, -0.8627224, 0, 0, 0, 1, 1,
-1.773963, 2.28613, -0.4250113, 0, 0, 0, 1, 1,
-1.770837, 1.393374, -1.77504, 0, 0, 0, 1, 1,
-1.755975, -0.4339655, -3.464521, 0, 0, 0, 1, 1,
-1.744595, 1.698488, -0.3556808, 1, 1, 1, 1, 1,
-1.743678, 1.092323, -0.4914193, 1, 1, 1, 1, 1,
-1.72915, -1.022999, -1.130322, 1, 1, 1, 1, 1,
-1.713549, 1.156389, 0.8278971, 1, 1, 1, 1, 1,
-1.698012, -1.478795, -2.494749, 1, 1, 1, 1, 1,
-1.671045, -0.1340735, -1.9303, 1, 1, 1, 1, 1,
-1.66136, -1.746778, -1.822309, 1, 1, 1, 1, 1,
-1.651065, -1.40756, -3.012367, 1, 1, 1, 1, 1,
-1.648568, 0.1873792, -0.1694425, 1, 1, 1, 1, 1,
-1.641617, -0.1991151, -1.463935, 1, 1, 1, 1, 1,
-1.637283, -0.6505407, -2.5721, 1, 1, 1, 1, 1,
-1.632386, 0.8971964, -2.870517, 1, 1, 1, 1, 1,
-1.614102, 1.121625, -0.2053659, 1, 1, 1, 1, 1,
-1.597229, -0.1949923, -3.526706, 1, 1, 1, 1, 1,
-1.586674, -0.9645031, -1.747527, 1, 1, 1, 1, 1,
-1.575545, 0.4412591, -1.896968, 0, 0, 1, 1, 1,
-1.573021, -0.2038265, -1.586664, 1, 0, 0, 1, 1,
-1.566324, 0.03297471, -2.029995, 1, 0, 0, 1, 1,
-1.556873, 1.422174, -0.601225, 1, 0, 0, 1, 1,
-1.549081, -0.4969741, -2.099169, 1, 0, 0, 1, 1,
-1.538196, 0.2837991, -3.066831, 1, 0, 0, 1, 1,
-1.534562, 0.447131, -2.73944, 0, 0, 0, 1, 1,
-1.51648, 1.652821, -1.190261, 0, 0, 0, 1, 1,
-1.511842, -0.1277706, -0.290931, 0, 0, 0, 1, 1,
-1.510165, -0.3653353, -2.458826, 0, 0, 0, 1, 1,
-1.500681, -0.7583177, -1.556108, 0, 0, 0, 1, 1,
-1.495269, 0.6870012, -1.660165, 0, 0, 0, 1, 1,
-1.490814, -1.605928, -1.676927, 0, 0, 0, 1, 1,
-1.473871, 1.171264, -1.140638, 1, 1, 1, 1, 1,
-1.47272, 0.4001279, 0.5048606, 1, 1, 1, 1, 1,
-1.466443, 0.8002317, -0.9599879, 1, 1, 1, 1, 1,
-1.454494, -0.6048631, -2.370213, 1, 1, 1, 1, 1,
-1.451993, -0.1545361, -1.399882, 1, 1, 1, 1, 1,
-1.450391, -1.881991, -3.415739, 1, 1, 1, 1, 1,
-1.4477, -2.139173, -2.379413, 1, 1, 1, 1, 1,
-1.439474, 1.85374, -1.064881, 1, 1, 1, 1, 1,
-1.403985, -0.01280752, 0.2136924, 1, 1, 1, 1, 1,
-1.402324, -1.262768, -1.628367, 1, 1, 1, 1, 1,
-1.393126, 0.876629, -0.3812024, 1, 1, 1, 1, 1,
-1.392838, -0.6679794, -2.71276, 1, 1, 1, 1, 1,
-1.38487, -1.299353, -3.359803, 1, 1, 1, 1, 1,
-1.380205, -1.101737, -2.242011, 1, 1, 1, 1, 1,
-1.376023, 0.8578839, -3.42817, 1, 1, 1, 1, 1,
-1.375416, 0.209224, -1.618786, 0, 0, 1, 1, 1,
-1.366884, -0.5361037, -3.494372, 1, 0, 0, 1, 1,
-1.362636, 0.00895872, -1.652998, 1, 0, 0, 1, 1,
-1.339395, 2.442822, -1.565506, 1, 0, 0, 1, 1,
-1.334752, 1.841399, 0.03688522, 1, 0, 0, 1, 1,
-1.333469, -1.025507, -3.045432, 1, 0, 0, 1, 1,
-1.328323, 0.9570361, -0.4018078, 0, 0, 0, 1, 1,
-1.311649, 1.233617, -1.283255, 0, 0, 0, 1, 1,
-1.303716, -0.1968524, -1.739343, 0, 0, 0, 1, 1,
-1.294728, -0.9106817, 0.2282056, 0, 0, 0, 1, 1,
-1.291494, -0.8684304, -0.844194, 0, 0, 0, 1, 1,
-1.280187, -1.057168, -2.177843, 0, 0, 0, 1, 1,
-1.276545, 0.9427042, 1.077438, 0, 0, 0, 1, 1,
-1.273501, -1.535157, -1.966271, 1, 1, 1, 1, 1,
-1.267985, 0.9415516, -0.6168588, 1, 1, 1, 1, 1,
-1.263616, -1.983637, -2.797015, 1, 1, 1, 1, 1,
-1.256538, -0.5479541, -1.453603, 1, 1, 1, 1, 1,
-1.246512, 0.3766058, -3.136564, 1, 1, 1, 1, 1,
-1.245056, 1.181853, -1.539969, 1, 1, 1, 1, 1,
-1.242871, 0.07021281, -0.5769918, 1, 1, 1, 1, 1,
-1.235439, 0.2649235, -0.7249929, 1, 1, 1, 1, 1,
-1.234972, 0.436309, -2.363288, 1, 1, 1, 1, 1,
-1.217835, 1.463916, -1.684257, 1, 1, 1, 1, 1,
-1.215658, -0.2766536, -1.83243, 1, 1, 1, 1, 1,
-1.215124, 0.1042012, 0.2025379, 1, 1, 1, 1, 1,
-1.211605, -0.5150768, -0.7402645, 1, 1, 1, 1, 1,
-1.210286, -0.3380511, -0.8171856, 1, 1, 1, 1, 1,
-1.202015, 0.02015948, -1.924149, 1, 1, 1, 1, 1,
-1.201736, -0.05917175, -2.730661, 0, 0, 1, 1, 1,
-1.187716, -0.5018331, -2.765481, 1, 0, 0, 1, 1,
-1.181521, -1.070097, -3.133221, 1, 0, 0, 1, 1,
-1.167212, -1.412171, -4.345281, 1, 0, 0, 1, 1,
-1.152083, -0.2116532, -1.616176, 1, 0, 0, 1, 1,
-1.150344, 1.258759, -1.430682, 1, 0, 0, 1, 1,
-1.140807, 0.76117, -2.559091, 0, 0, 0, 1, 1,
-1.138448, -0.1594478, -2.93543, 0, 0, 0, 1, 1,
-1.133793, 0.424434, -0.6574597, 0, 0, 0, 1, 1,
-1.128038, -0.09665422, -1.433959, 0, 0, 0, 1, 1,
-1.126638, 1.296162, -1.749648, 0, 0, 0, 1, 1,
-1.125787, 0.9457539, -0.9443954, 0, 0, 0, 1, 1,
-1.119482, 2.217812, -0.5594031, 0, 0, 0, 1, 1,
-1.116963, -1.512514, -2.598428, 1, 1, 1, 1, 1,
-1.103966, 0.5373592, -2.524897, 1, 1, 1, 1, 1,
-1.096647, -1.066488, -3.453956, 1, 1, 1, 1, 1,
-1.09461, 0.2862357, -1.129076, 1, 1, 1, 1, 1,
-1.094083, -0.5530375, -2.089188, 1, 1, 1, 1, 1,
-1.093817, -0.9510086, -0.9325829, 1, 1, 1, 1, 1,
-1.090418, 0.1606483, -1.156646, 1, 1, 1, 1, 1,
-1.083259, -0.1220808, -1.420862, 1, 1, 1, 1, 1,
-1.081676, 1.947209, -1.283904, 1, 1, 1, 1, 1,
-1.077698, 0.5954565, -0.2377705, 1, 1, 1, 1, 1,
-1.07122, -1.400756, -2.110925, 1, 1, 1, 1, 1,
-1.06123, 2.460635, -0.8142487, 1, 1, 1, 1, 1,
-1.060161, -0.9527302, -3.187203, 1, 1, 1, 1, 1,
-1.054332, -1.088888, -1.066793, 1, 1, 1, 1, 1,
-1.050939, -1.433989, -2.508289, 1, 1, 1, 1, 1,
-1.043952, -0.1633261, -2.198556, 0, 0, 1, 1, 1,
-1.037127, -1.167571, -4.027101, 1, 0, 0, 1, 1,
-1.036974, -1.47901, -2.756451, 1, 0, 0, 1, 1,
-1.036287, -0.4032842, -0.4656042, 1, 0, 0, 1, 1,
-1.032652, -0.9320562, -2.427476, 1, 0, 0, 1, 1,
-1.031468, 1.590195, -2.144946, 1, 0, 0, 1, 1,
-1.025418, 2.936508, 0.05853042, 0, 0, 0, 1, 1,
-1.024614, -0.9498426, -2.295741, 0, 0, 0, 1, 1,
-1.011373, -0.1247669, -0.7353774, 0, 0, 0, 1, 1,
-1.003119, 0.7059783, -0.4205527, 0, 0, 0, 1, 1,
-1.001024, 0.9214796, -0.636937, 0, 0, 0, 1, 1,
-0.9912083, 0.8768413, -1.872011, 0, 0, 0, 1, 1,
-0.9898187, 0.8566071, -0.5166458, 0, 0, 0, 1, 1,
-0.984179, -1.045885, -2.080275, 1, 1, 1, 1, 1,
-0.9683842, 0.6175982, 0.05814662, 1, 1, 1, 1, 1,
-0.9679796, -0.2407563, -1.899882, 1, 1, 1, 1, 1,
-0.9651389, -0.3083156, -2.773961, 1, 1, 1, 1, 1,
-0.9558347, 0.4708152, 0.02295504, 1, 1, 1, 1, 1,
-0.9544111, 1.334273, -2.267348, 1, 1, 1, 1, 1,
-0.9521496, -1.309382, -2.631799, 1, 1, 1, 1, 1,
-0.9470316, -1.660199, -1.912235, 1, 1, 1, 1, 1,
-0.9425668, 0.2585344, -1.660889, 1, 1, 1, 1, 1,
-0.9374342, -0.5532879, -2.294332, 1, 1, 1, 1, 1,
-0.9354877, 0.2342829, -0.6958645, 1, 1, 1, 1, 1,
-0.9340815, -1.192633, -2.449925, 1, 1, 1, 1, 1,
-0.9321005, -0.4028348, -2.345667, 1, 1, 1, 1, 1,
-0.9319863, 0.04967959, -1.622031, 1, 1, 1, 1, 1,
-0.9319517, 0.2250809, -0.1028138, 1, 1, 1, 1, 1,
-0.9273987, -2.160075, -2.126886, 0, 0, 1, 1, 1,
-0.9147659, 1.144612, -1.277945, 1, 0, 0, 1, 1,
-0.9119271, -0.2372026, -1.318848, 1, 0, 0, 1, 1,
-0.91175, -2.14711, -4.202084, 1, 0, 0, 1, 1,
-0.9057972, 0.5347165, -0.8472426, 1, 0, 0, 1, 1,
-0.8901601, -1.374058, -2.348342, 1, 0, 0, 1, 1,
-0.8839322, 0.04086471, -0.9859629, 0, 0, 0, 1, 1,
-0.8816206, -1.163441, -2.060036, 0, 0, 0, 1, 1,
-0.8806329, -1.222246, -2.800564, 0, 0, 0, 1, 1,
-0.878958, 1.277451, 0.6564036, 0, 0, 0, 1, 1,
-0.8776079, -0.170106, -0.5535004, 0, 0, 0, 1, 1,
-0.8640963, -0.8082538, -1.082371, 0, 0, 0, 1, 1,
-0.8619308, 0.8053173, 1.159682, 0, 0, 0, 1, 1,
-0.8593056, 0.008249357, -0.9844697, 1, 1, 1, 1, 1,
-0.8576015, 0.648789, -0.4801023, 1, 1, 1, 1, 1,
-0.8540722, -0.1891116, -2.507383, 1, 1, 1, 1, 1,
-0.8509195, 0.5384395, 1.667368, 1, 1, 1, 1, 1,
-0.8446742, 0.8036391, 0.3596556, 1, 1, 1, 1, 1,
-0.8411131, 1.196842, -0.1591019, 1, 1, 1, 1, 1,
-0.8385619, -1.088565, -2.983113, 1, 1, 1, 1, 1,
-0.8381167, 0.2696452, -0.07721087, 1, 1, 1, 1, 1,
-0.8363209, -1.579024, -3.098102, 1, 1, 1, 1, 1,
-0.8354084, -1.421786, -3.78593, 1, 1, 1, 1, 1,
-0.8354017, 0.2342101, -1.783145, 1, 1, 1, 1, 1,
-0.8180861, -1.684546, -2.209009, 1, 1, 1, 1, 1,
-0.8171372, 0.7074245, 0.4933823, 1, 1, 1, 1, 1,
-0.8167791, 0.6206974, -0.7919406, 1, 1, 1, 1, 1,
-0.8145218, -0.4705947, 0.6660591, 1, 1, 1, 1, 1,
-0.8107453, 0.6419822, -0.556766, 0, 0, 1, 1, 1,
-0.808097, 0.9050551, 0.4300785, 1, 0, 0, 1, 1,
-0.8038234, 0.7337022, 1.071385, 1, 0, 0, 1, 1,
-0.7929404, 0.6389836, -0.3680618, 1, 0, 0, 1, 1,
-0.782811, 0.5367728, -0.1850656, 1, 0, 0, 1, 1,
-0.7803493, -1.398073, -1.87781, 1, 0, 0, 1, 1,
-0.7767287, -0.05944443, -1.909243, 0, 0, 0, 1, 1,
-0.7751159, -0.2069006, -2.632472, 0, 0, 0, 1, 1,
-0.7745935, -1.226563, -2.341107, 0, 0, 0, 1, 1,
-0.7734511, 0.7003695, -1.794567, 0, 0, 0, 1, 1,
-0.7731987, -0.4533277, -1.83102, 0, 0, 0, 1, 1,
-0.7703465, 0.192825, -1.991404, 0, 0, 0, 1, 1,
-0.767504, 0.6069889, -0.9425988, 0, 0, 0, 1, 1,
-0.7662362, 0.1448288, -2.164402, 1, 1, 1, 1, 1,
-0.7629928, 0.7827942, 1.259974, 1, 1, 1, 1, 1,
-0.7595874, -0.4974045, -2.245508, 1, 1, 1, 1, 1,
-0.759243, 1.6763, 0.4650617, 1, 1, 1, 1, 1,
-0.7566792, 0.4285502, 0.620946, 1, 1, 1, 1, 1,
-0.7481687, 0.9706691, -2.13974, 1, 1, 1, 1, 1,
-0.7470421, 0.1762246, -1.368318, 1, 1, 1, 1, 1,
-0.746978, 0.8838387, -1.646947, 1, 1, 1, 1, 1,
-0.7453169, 1.942859, 0.1033365, 1, 1, 1, 1, 1,
-0.7438201, -0.1417187, -1.891564, 1, 1, 1, 1, 1,
-0.7423112, 0.5478421, -0.02011903, 1, 1, 1, 1, 1,
-0.7420909, -0.6399575, -0.9665576, 1, 1, 1, 1, 1,
-0.733924, 2.075751, -0.4244371, 1, 1, 1, 1, 1,
-0.7330691, -0.4068797, -2.206543, 1, 1, 1, 1, 1,
-0.7282499, -0.360477, -0.03001561, 1, 1, 1, 1, 1,
-0.7243539, 0.6811351, -0.09303083, 0, 0, 1, 1, 1,
-0.7229974, 0.7590654, 0.4905288, 1, 0, 0, 1, 1,
-0.7229205, 0.3167165, 1.659481, 1, 0, 0, 1, 1,
-0.7200599, -0.8296076, -1.172502, 1, 0, 0, 1, 1,
-0.7192427, -0.621237, -1.393505, 1, 0, 0, 1, 1,
-0.7188241, -0.5511558, -0.5400002, 1, 0, 0, 1, 1,
-0.7148344, 0.04789459, -1.730642, 0, 0, 0, 1, 1,
-0.7144732, 0.2083435, 0.01865004, 0, 0, 0, 1, 1,
-0.7135787, -1.777398, -2.688612, 0, 0, 0, 1, 1,
-0.7134052, 1.117627, 0.2809401, 0, 0, 0, 1, 1,
-0.7131058, 1.89756, 3.006342, 0, 0, 0, 1, 1,
-0.712194, -0.9295964, -1.659315, 0, 0, 0, 1, 1,
-0.7002249, 0.05523498, -2.275999, 0, 0, 0, 1, 1,
-0.6987082, -0.1631879, -1.241363, 1, 1, 1, 1, 1,
-0.6955448, 2.03592, 0.8533732, 1, 1, 1, 1, 1,
-0.6936972, 0.0003032958, -0.5581765, 1, 1, 1, 1, 1,
-0.687033, 1.325172, 0.4625631, 1, 1, 1, 1, 1,
-0.6856313, 0.0911582, -1.26899, 1, 1, 1, 1, 1,
-0.6817875, -1.07924, -3.217541, 1, 1, 1, 1, 1,
-0.6801621, -0.2671323, -1.968076, 1, 1, 1, 1, 1,
-0.676219, -0.3695582, -1.341362, 1, 1, 1, 1, 1,
-0.6751472, 0.4384671, -0.5045437, 1, 1, 1, 1, 1,
-0.6605665, -0.113036, -1.722668, 1, 1, 1, 1, 1,
-0.6580661, -1.114682, -2.343944, 1, 1, 1, 1, 1,
-0.6567345, -0.9173638, -3.279191, 1, 1, 1, 1, 1,
-0.655681, -1.612143, -1.684198, 1, 1, 1, 1, 1,
-0.6543949, 1.380581, -0.7505307, 1, 1, 1, 1, 1,
-0.6528539, -1.061573, -1.314282, 1, 1, 1, 1, 1,
-0.6524172, 2.558041, -0.9214441, 0, 0, 1, 1, 1,
-0.6512983, 0.5859962, -0.8500007, 1, 0, 0, 1, 1,
-0.6509675, 1.089176, -0.8478339, 1, 0, 0, 1, 1,
-0.6497494, 0.2927392, -1.284801, 1, 0, 0, 1, 1,
-0.6493121, -0.5829122, -2.100404, 1, 0, 0, 1, 1,
-0.645375, -0.6348584, -3.691366, 1, 0, 0, 1, 1,
-0.6383833, -0.4889977, -1.799498, 0, 0, 0, 1, 1,
-0.6375096, 1.214247, -0.7086475, 0, 0, 0, 1, 1,
-0.6366542, 1.859022, 2.4938, 0, 0, 0, 1, 1,
-0.6359233, -0.8472156, -2.56359, 0, 0, 0, 1, 1,
-0.6339043, 0.6489105, -0.7706035, 0, 0, 0, 1, 1,
-0.6297911, 1.199461, -1.513414, 0, 0, 0, 1, 1,
-0.6205041, 0.361829, -0.1515094, 0, 0, 0, 1, 1,
-0.6178456, 0.1935284, -1.733267, 1, 1, 1, 1, 1,
-0.6178244, -1.482806, -2.046252, 1, 1, 1, 1, 1,
-0.6141088, 0.4854836, -0.9367428, 1, 1, 1, 1, 1,
-0.6123993, -0.2881994, -3.039568, 1, 1, 1, 1, 1,
-0.6106158, -0.04134725, -1.876743, 1, 1, 1, 1, 1,
-0.6094816, -1.267312, -1.723995, 1, 1, 1, 1, 1,
-0.6038207, 0.3651428, -1.771641, 1, 1, 1, 1, 1,
-0.603056, 0.3103279, -2.110864, 1, 1, 1, 1, 1,
-0.5986544, -0.6873152, -2.857049, 1, 1, 1, 1, 1,
-0.5924109, -0.5395894, -1.702615, 1, 1, 1, 1, 1,
-0.5853786, 0.830368, -1.890406, 1, 1, 1, 1, 1,
-0.5831139, 0.9023505, -0.6463031, 1, 1, 1, 1, 1,
-0.5822919, -2.230145, -3.212239, 1, 1, 1, 1, 1,
-0.5811551, -0.8216954, -0.5830717, 1, 1, 1, 1, 1,
-0.579128, -1.101646, 0.08083311, 1, 1, 1, 1, 1,
-0.5779195, -0.3186736, -1.194056, 0, 0, 1, 1, 1,
-0.5753168, -0.9208072, -1.744943, 1, 0, 0, 1, 1,
-0.5707059, -0.7855794, -2.541716, 1, 0, 0, 1, 1,
-0.5621693, 0.3288163, -0.03584611, 1, 0, 0, 1, 1,
-0.5600342, -0.1574799, -1.879065, 1, 0, 0, 1, 1,
-0.5580459, 0.6617042, -0.7947167, 1, 0, 0, 1, 1,
-0.557785, -0.08657437, -2.726422, 0, 0, 0, 1, 1,
-0.557647, 1.922547, -0.8843935, 0, 0, 0, 1, 1,
-0.5569605, 0.368675, 2.13623, 0, 0, 0, 1, 1,
-0.5538003, 1.011286, -1.775243, 0, 0, 0, 1, 1,
-0.545578, -0.3088083, -3.272162, 0, 0, 0, 1, 1,
-0.5443932, 0.1419549, -2.172487, 0, 0, 0, 1, 1,
-0.5429748, -0.6679198, -3.744882, 0, 0, 0, 1, 1,
-0.5417714, -1.496745, -3.532941, 1, 1, 1, 1, 1,
-0.5340294, -0.4997846, -1.924191, 1, 1, 1, 1, 1,
-0.5322818, -1.446037, -3.038825, 1, 1, 1, 1, 1,
-0.5287116, 0.1298558, -0.3613903, 1, 1, 1, 1, 1,
-0.5270191, -1.344042, -2.098801, 1, 1, 1, 1, 1,
-0.5240136, -1.936296, -1.898933, 1, 1, 1, 1, 1,
-0.5202519, -0.01684418, -2.310793, 1, 1, 1, 1, 1,
-0.5144733, 0.8539309, -1.553252, 1, 1, 1, 1, 1,
-0.5134441, 1.00845, 0.6200253, 1, 1, 1, 1, 1,
-0.5100629, -0.7353267, -1.391045, 1, 1, 1, 1, 1,
-0.509369, 0.4165236, -0.6143512, 1, 1, 1, 1, 1,
-0.5041968, 0.7208192, 0.4100732, 1, 1, 1, 1, 1,
-0.502481, 1.373728, 0.2275067, 1, 1, 1, 1, 1,
-0.5002229, 1.314085, 1.715562, 1, 1, 1, 1, 1,
-0.4993612, -1.763461, -0.8732703, 1, 1, 1, 1, 1,
-0.4977264, 0.432786, -1.254151, 0, 0, 1, 1, 1,
-0.4944063, -0.2241094, -0.8763903, 1, 0, 0, 1, 1,
-0.4920998, 0.07122213, -0.5121555, 1, 0, 0, 1, 1,
-0.4863695, -0.3352994, -4.794975, 1, 0, 0, 1, 1,
-0.4720001, -0.5931882, -2.698288, 1, 0, 0, 1, 1,
-0.4714607, 0.8112459, -0.1451249, 1, 0, 0, 1, 1,
-0.4707783, -3.107881, -1.522203, 0, 0, 0, 1, 1,
-0.4636365, -0.06536417, -0.9401405, 0, 0, 0, 1, 1,
-0.4632951, -2.414865, -2.785554, 0, 0, 0, 1, 1,
-0.4611744, -0.4942225, -3.222814, 0, 0, 0, 1, 1,
-0.457209, -0.02816168, -0.537425, 0, 0, 0, 1, 1,
-0.4550655, 1.600842, -0.413738, 0, 0, 0, 1, 1,
-0.4541757, 1.114673, -0.2323467, 0, 0, 0, 1, 1,
-0.4531518, -1.561625, -2.235069, 1, 1, 1, 1, 1,
-0.4529047, 1.152905, -1.401687, 1, 1, 1, 1, 1,
-0.4518347, 0.7788306, -1.038987, 1, 1, 1, 1, 1,
-0.4404822, -0.7517118, -3.644041, 1, 1, 1, 1, 1,
-0.4399105, -1.383096, -2.606265, 1, 1, 1, 1, 1,
-0.4391166, 0.2840838, -1.24794, 1, 1, 1, 1, 1,
-0.4311652, -1.505955, -1.323831, 1, 1, 1, 1, 1,
-0.428305, -2.216862, -3.959906, 1, 1, 1, 1, 1,
-0.4261396, 0.2034782, -0.2318566, 1, 1, 1, 1, 1,
-0.4241282, 0.6306214, -2.009223, 1, 1, 1, 1, 1,
-0.4238217, -0.3795846, -2.164571, 1, 1, 1, 1, 1,
-0.421017, -0.6308179, -2.488117, 1, 1, 1, 1, 1,
-0.4165138, -1.142666, -2.821952, 1, 1, 1, 1, 1,
-0.4152283, -0.7599946, -1.70775, 1, 1, 1, 1, 1,
-0.4056838, -0.4718495, -3.498228, 1, 1, 1, 1, 1,
-0.4008833, -0.1395871, -1.568785, 0, 0, 1, 1, 1,
-0.3997629, 0.4818322, -0.2789672, 1, 0, 0, 1, 1,
-0.3991279, 0.8917101, -0.5498233, 1, 0, 0, 1, 1,
-0.3934532, 0.5358397, 0.9674233, 1, 0, 0, 1, 1,
-0.3892001, 0.1776641, 0.4470282, 1, 0, 0, 1, 1,
-0.3890652, -0.7570436, -2.86004, 1, 0, 0, 1, 1,
-0.3879313, 0.6477174, -0.3243165, 0, 0, 0, 1, 1,
-0.3856237, 1.25567, 0.1094898, 0, 0, 0, 1, 1,
-0.3848583, -0.7615741, -2.440314, 0, 0, 0, 1, 1,
-0.3814945, 1.689663, 0.1130893, 0, 0, 0, 1, 1,
-0.3792279, 0.3246159, -0.6013002, 0, 0, 0, 1, 1,
-0.377872, -0.4065113, -1.345716, 0, 0, 0, 1, 1,
-0.3757359, -0.7005617, -2.864487, 0, 0, 0, 1, 1,
-0.3729125, 0.9370717, -1.526998, 1, 1, 1, 1, 1,
-0.3693751, -1.013156, -2.013608, 1, 1, 1, 1, 1,
-0.3675754, -0.8068244, -3.199134, 1, 1, 1, 1, 1,
-0.3668088, 1.753146, -0.3256827, 1, 1, 1, 1, 1,
-0.3639001, 1.167415, -1.398823, 1, 1, 1, 1, 1,
-0.3628707, 0.6374483, -0.8339669, 1, 1, 1, 1, 1,
-0.3576761, 0.6332241, -0.9944239, 1, 1, 1, 1, 1,
-0.3565958, 1.883815, -1.311746, 1, 1, 1, 1, 1,
-0.3510973, 0.7216692, -0.5072791, 1, 1, 1, 1, 1,
-0.3458879, -0.4565426, -0.9019327, 1, 1, 1, 1, 1,
-0.3420263, -0.8577535, -2.336989, 1, 1, 1, 1, 1,
-0.3414261, 0.04618961, -3.054569, 1, 1, 1, 1, 1,
-0.3411483, 0.2335829, -1.420766, 1, 1, 1, 1, 1,
-0.3318957, -0.3142975, -0.2406214, 1, 1, 1, 1, 1,
-0.3293735, -0.1128597, -1.356352, 1, 1, 1, 1, 1,
-0.3130535, 2.212753, 0.718603, 0, 0, 1, 1, 1,
-0.3112166, 0.2203257, -1.974848, 1, 0, 0, 1, 1,
-0.3093335, 1.359132, -0.7023519, 1, 0, 0, 1, 1,
-0.3063269, -0.3793128, -2.803496, 1, 0, 0, 1, 1,
-0.3053246, 0.8620665, 0.9912611, 1, 0, 0, 1, 1,
-0.3022783, 1.392003, -0.6442278, 1, 0, 0, 1, 1,
-0.302162, -0.99113, -2.460514, 0, 0, 0, 1, 1,
-0.2969941, -0.4788699, 0.02124539, 0, 0, 0, 1, 1,
-0.2968762, 0.6373871, -1.699657, 0, 0, 0, 1, 1,
-0.2959258, -0.585917, -2.364848, 0, 0, 0, 1, 1,
-0.293008, -1.33441, -2.32216, 0, 0, 0, 1, 1,
-0.2912075, 1.371411, 1.747735, 0, 0, 0, 1, 1,
-0.290148, 1.79055, -0.4331151, 0, 0, 0, 1, 1,
-0.2880348, -0.2340651, -2.973724, 1, 1, 1, 1, 1,
-0.285797, -0.1295638, -5.107488, 1, 1, 1, 1, 1,
-0.2817167, 0.8957418, 0.1651974, 1, 1, 1, 1, 1,
-0.2815572, -0.3772348, -1.809538, 1, 1, 1, 1, 1,
-0.2813938, 0.08972079, -1.08931, 1, 1, 1, 1, 1,
-0.2811883, -0.8361607, -4.337259, 1, 1, 1, 1, 1,
-0.2770702, -0.4831486, -4.08982, 1, 1, 1, 1, 1,
-0.2759849, -0.7059582, -0.3835405, 1, 1, 1, 1, 1,
-0.2759313, -1.499488, -2.569022, 1, 1, 1, 1, 1,
-0.2737352, 0.6515986, 0.9092063, 1, 1, 1, 1, 1,
-0.2713509, 0.0889568, -1.367401, 1, 1, 1, 1, 1,
-0.268611, -1.910899, -2.424046, 1, 1, 1, 1, 1,
-0.2676744, -2.365245, -3.442057, 1, 1, 1, 1, 1,
-0.2633192, -0.4451336, -1.865375, 1, 1, 1, 1, 1,
-0.2601193, -0.9190025, -1.790675, 1, 1, 1, 1, 1,
-0.2599446, -0.9382222, -3.20034, 0, 0, 1, 1, 1,
-0.25734, -0.92, -2.389704, 1, 0, 0, 1, 1,
-0.2573048, 2.304913, -0.8386611, 1, 0, 0, 1, 1,
-0.2552998, 0.5282614, -0.8391069, 1, 0, 0, 1, 1,
-0.2537977, 0.3778869, -0.9575596, 1, 0, 0, 1, 1,
-0.2535855, 0.08079776, -1.734101, 1, 0, 0, 1, 1,
-0.2532783, -0.4684105, -2.783502, 0, 0, 0, 1, 1,
-0.2529141, 2.129082, -2.575284, 0, 0, 0, 1, 1,
-0.2507416, 0.1407554, -0.01554309, 0, 0, 0, 1, 1,
-0.2482542, -0.4270261, -3.799996, 0, 0, 0, 1, 1,
-0.2406492, -0.5819408, -2.405677, 0, 0, 0, 1, 1,
-0.2358187, -0.195885, -1.450416, 0, 0, 0, 1, 1,
-0.2325053, -0.6706221, -1.055099, 0, 0, 0, 1, 1,
-0.2300484, -0.1761623, -2.043954, 1, 1, 1, 1, 1,
-0.2241531, 1.107828, -0.9720085, 1, 1, 1, 1, 1,
-0.222828, -0.2236861, -1.800489, 1, 1, 1, 1, 1,
-0.2211049, 0.9924543, -0.9933178, 1, 1, 1, 1, 1,
-0.219399, -0.7853066, -0.7719243, 1, 1, 1, 1, 1,
-0.2191283, 1.178675, 0.362038, 1, 1, 1, 1, 1,
-0.2186642, 0.664767, -0.7157263, 1, 1, 1, 1, 1,
-0.2163861, -1.284063, -2.981328, 1, 1, 1, 1, 1,
-0.2102676, -0.02690723, -1.422162, 1, 1, 1, 1, 1,
-0.2094572, 1.753985, -0.7843031, 1, 1, 1, 1, 1,
-0.2062164, -1.087893, -4.193593, 1, 1, 1, 1, 1,
-0.2007584, 1.259996, 0.2659954, 1, 1, 1, 1, 1,
-0.1994728, -0.6389744, -2.726611, 1, 1, 1, 1, 1,
-0.1976765, 2.726282, 1.555817, 1, 1, 1, 1, 1,
-0.1950607, -0.4135073, -2.723281, 1, 1, 1, 1, 1,
-0.1887619, 0.3543109, -0.860445, 0, 0, 1, 1, 1,
-0.1868397, -0.4180946, -3.448823, 1, 0, 0, 1, 1,
-0.1866331, 0.2587385, 0.6770146, 1, 0, 0, 1, 1,
-0.1836731, -0.1905989, -2.735468, 1, 0, 0, 1, 1,
-0.1835991, -0.6971707, -4.075989, 1, 0, 0, 1, 1,
-0.17574, 0.4796217, 0.5140437, 1, 0, 0, 1, 1,
-0.1748331, 0.0580926, -0.3454253, 0, 0, 0, 1, 1,
-0.1740062, 1.628137, -0.1870052, 0, 0, 0, 1, 1,
-0.1735495, 0.9130076, -0.5074183, 0, 0, 0, 1, 1,
-0.1639682, 0.3732387, 0.8021423, 0, 0, 0, 1, 1,
-0.1633913, 0.2451143, -0.8895255, 0, 0, 0, 1, 1,
-0.1625496, 0.2562475, 0.9046018, 0, 0, 0, 1, 1,
-0.1601487, 1.61204, -0.07195307, 0, 0, 0, 1, 1,
-0.1542138, -0.2837687, -3.031566, 1, 1, 1, 1, 1,
-0.1512713, -1.343728, -3.491458, 1, 1, 1, 1, 1,
-0.1498396, 0.4500912, -2.939311, 1, 1, 1, 1, 1,
-0.1478098, -0.8461471, -3.369164, 1, 1, 1, 1, 1,
-0.1452104, 1.71398, 1.093955, 1, 1, 1, 1, 1,
-0.1419087, -0.3437986, -2.797355, 1, 1, 1, 1, 1,
-0.1409376, 1.476507, -1.295324, 1, 1, 1, 1, 1,
-0.1407297, 0.4728935, -1.002915, 1, 1, 1, 1, 1,
-0.1396858, 0.8087234, 1.804497, 1, 1, 1, 1, 1,
-0.1391788, 1.38076, 1.242021, 1, 1, 1, 1, 1,
-0.1388644, 0.8098875, 0.2856456, 1, 1, 1, 1, 1,
-0.1372275, -1.016239, -4.3414, 1, 1, 1, 1, 1,
-0.1325195, -1.261363, -2.724396, 1, 1, 1, 1, 1,
-0.1253961, 0.5522895, -1.529059, 1, 1, 1, 1, 1,
-0.1216262, 1.59398, -1.188267, 1, 1, 1, 1, 1,
-0.1193822, -0.781192, -2.0801, 0, 0, 1, 1, 1,
-0.1144439, -0.8560051, -4.253644, 1, 0, 0, 1, 1,
-0.1138762, 1.760424, 0.7757111, 1, 0, 0, 1, 1,
-0.1091682, -0.4371771, -3.283157, 1, 0, 0, 1, 1,
-0.1054499, -0.7302642, -3.241085, 1, 0, 0, 1, 1,
-0.1050038, -2.481519, -3.798807, 1, 0, 0, 1, 1,
-0.1028514, -0.0303925, -1.01484, 0, 0, 0, 1, 1,
-0.09500901, -0.5070841, -2.186723, 0, 0, 0, 1, 1,
-0.0939223, 0.06429385, -0.4156062, 0, 0, 0, 1, 1,
-0.09311326, -1.17213, -3.707277, 0, 0, 0, 1, 1,
-0.09253166, 0.4967543, -0.6223791, 0, 0, 0, 1, 1,
-0.09200108, 0.7478078, -0.9338673, 0, 0, 0, 1, 1,
-0.09165833, -0.03196177, -2.220512, 0, 0, 0, 1, 1,
-0.0901501, 0.2977363, 0.6372137, 1, 1, 1, 1, 1,
-0.08658705, 1.234689, 0.479746, 1, 1, 1, 1, 1,
-0.0860184, -0.3955546, -1.525229, 1, 1, 1, 1, 1,
-0.08097744, 0.5946892, -1.779068, 1, 1, 1, 1, 1,
-0.07770225, 0.9361026, -0.8100901, 1, 1, 1, 1, 1,
-0.07343038, 0.06669771, -1.199794, 1, 1, 1, 1, 1,
-0.07063641, 1.65074, 0.4411851, 1, 1, 1, 1, 1,
-0.06727572, 1.209012, -0.8485523, 1, 1, 1, 1, 1,
-0.0666023, 0.5130329, 0.2569002, 1, 1, 1, 1, 1,
-0.06061405, -0.6972929, -2.998955, 1, 1, 1, 1, 1,
-0.04833828, -1.524677, -3.051245, 1, 1, 1, 1, 1,
-0.04209368, 0.8121848, -0.5476525, 1, 1, 1, 1, 1,
-0.04193921, 0.04730486, -0.5467932, 1, 1, 1, 1, 1,
-0.03994258, -0.7058142, -2.623525, 1, 1, 1, 1, 1,
-0.03727378, 0.2032857, 0.2425206, 1, 1, 1, 1, 1,
-0.03268121, 0.8943205, -0.1911445, 0, 0, 1, 1, 1,
-0.03039843, -1.774423, -3.731238, 1, 0, 0, 1, 1,
-0.02750252, -0.6829062, -2.830153, 1, 0, 0, 1, 1,
-0.02333697, 2.357401, -0.0850952, 1, 0, 0, 1, 1,
-0.01955244, 0.3172132, -1.601753, 1, 0, 0, 1, 1,
-0.01912452, 0.6738352, 0.6917572, 1, 0, 0, 1, 1,
-0.01842877, 0.4657657, -1.773664, 0, 0, 0, 1, 1,
-0.01658506, 1.18455, -0.144047, 0, 0, 0, 1, 1,
-0.01064097, 0.2661416, 1.429972, 0, 0, 0, 1, 1,
-0.006627118, 1.359129, 0.1453895, 0, 0, 0, 1, 1,
-0.006470209, 0.4949749, 0.2539696, 0, 0, 0, 1, 1,
-0.005495197, -0.108122, -3.822927, 0, 0, 0, 1, 1,
-0.003029414, 0.5253465, 0.1719615, 0, 0, 0, 1, 1,
0.0009193625, 1.582689, -0.3909646, 1, 1, 1, 1, 1,
0.001451849, 0.3990427, -0.4250959, 1, 1, 1, 1, 1,
0.00233437, 1.315948, 0.04336008, 1, 1, 1, 1, 1,
0.003163706, -0.6170452, 1.906039, 1, 1, 1, 1, 1,
0.005629525, -1.582724, 3.853174, 1, 1, 1, 1, 1,
0.006474986, 1.184769, -0.7523872, 1, 1, 1, 1, 1,
0.01158142, 0.007608201, -0.3581576, 1, 1, 1, 1, 1,
0.0117093, 1.355445, -0.459419, 1, 1, 1, 1, 1,
0.01353826, 1.396135, -0.6437263, 1, 1, 1, 1, 1,
0.01440236, -0.09597237, 3.757751, 1, 1, 1, 1, 1,
0.01638254, -0.7393175, 3.826175, 1, 1, 1, 1, 1,
0.02156825, 0.190431, 0.244373, 1, 1, 1, 1, 1,
0.02523511, 1.219711, 0.1694794, 1, 1, 1, 1, 1,
0.03263015, -0.9017719, 2.294974, 1, 1, 1, 1, 1,
0.03470964, -1.100246, 1.859879, 1, 1, 1, 1, 1,
0.0361437, 1.027562, -0.5713505, 0, 0, 1, 1, 1,
0.03627311, -0.1940597, 3.750637, 1, 0, 0, 1, 1,
0.03991555, 2.163237, -1.266606, 1, 0, 0, 1, 1,
0.04203256, 0.6308542, 0.9701243, 1, 0, 0, 1, 1,
0.04247536, 0.2992417, 2.307561, 1, 0, 0, 1, 1,
0.04598029, -0.2642357, 2.05302, 1, 0, 0, 1, 1,
0.04625735, 0.06538181, -0.4029261, 0, 0, 0, 1, 1,
0.04708984, 0.2829181, -0.6983862, 0, 0, 0, 1, 1,
0.0480666, -1.150579, 3.110859, 0, 0, 0, 1, 1,
0.04871279, -0.6325351, 3.083856, 0, 0, 0, 1, 1,
0.05040043, 1.080202, 0.5784965, 0, 0, 0, 1, 1,
0.05236473, -0.610865, 2.268405, 0, 0, 0, 1, 1,
0.05571635, -0.7414567, 2.275885, 0, 0, 0, 1, 1,
0.05624155, -0.39661, 2.439272, 1, 1, 1, 1, 1,
0.05698426, 2.027028, 0.6458615, 1, 1, 1, 1, 1,
0.05799023, -0.5355409, 1.313307, 1, 1, 1, 1, 1,
0.05960082, 0.921616, 0.5524108, 1, 1, 1, 1, 1,
0.06108169, 0.3891369, 1.214976, 1, 1, 1, 1, 1,
0.06446037, -0.3079421, 1.774099, 1, 1, 1, 1, 1,
0.06758787, 1.359577, 0.8140614, 1, 1, 1, 1, 1,
0.07054137, 0.3415062, 0.08994124, 1, 1, 1, 1, 1,
0.07062142, 0.1464924, -1.355709, 1, 1, 1, 1, 1,
0.07158948, 1.432389, -0.4428382, 1, 1, 1, 1, 1,
0.07311708, -0.7263874, 1.735766, 1, 1, 1, 1, 1,
0.07533827, 1.720174, 1.23803, 1, 1, 1, 1, 1,
0.07639082, -1.021952, 2.127664, 1, 1, 1, 1, 1,
0.08150104, 0.7122738, 0.9283656, 1, 1, 1, 1, 1,
0.08418182, -0.1843491, 2.010419, 1, 1, 1, 1, 1,
0.08682491, -0.999773, 3.694507, 0, 0, 1, 1, 1,
0.08767802, -0.9362178, 4.45888, 1, 0, 0, 1, 1,
0.09079088, -0.7134222, 3.764228, 1, 0, 0, 1, 1,
0.09153204, -1.522233, 2.562502, 1, 0, 0, 1, 1,
0.09267203, 0.2462614, 1.120914, 1, 0, 0, 1, 1,
0.09506962, 0.4180045, 0.4142772, 1, 0, 0, 1, 1,
0.09974344, -0.4369745, 1.5365, 0, 0, 0, 1, 1,
0.1016315, -0.3181441, 1.928533, 0, 0, 0, 1, 1,
0.1040123, 0.1173312, 2.304646, 0, 0, 0, 1, 1,
0.1064698, -0.3030834, 3.440102, 0, 0, 0, 1, 1,
0.1167165, 0.1886283, 0.7265888, 0, 0, 0, 1, 1,
0.1179742, 0.9628051, -0.2829034, 0, 0, 0, 1, 1,
0.1188029, 0.9272482, 0.9835976, 0, 0, 0, 1, 1,
0.1266216, 0.3297674, 0.2546235, 1, 1, 1, 1, 1,
0.1282039, -0.6722505, 3.40338, 1, 1, 1, 1, 1,
0.128606, 0.3664047, -1.046344, 1, 1, 1, 1, 1,
0.1334218, -1.274357, 2.186418, 1, 1, 1, 1, 1,
0.1358776, -0.1087566, 2.297525, 1, 1, 1, 1, 1,
0.1364376, -0.6603377, 4.122422, 1, 1, 1, 1, 1,
0.1367757, -1.091219, 3.488442, 1, 1, 1, 1, 1,
0.1418371, -0.3180274, 2.127427, 1, 1, 1, 1, 1,
0.1454925, -0.1211081, 2.320687, 1, 1, 1, 1, 1,
0.1539399, 1.085389, 1.048289, 1, 1, 1, 1, 1,
0.1561189, 0.4315502, -1.105014, 1, 1, 1, 1, 1,
0.1597937, -0.6146734, 2.264834, 1, 1, 1, 1, 1,
0.1598873, -1.422515, 4.403564, 1, 1, 1, 1, 1,
0.1610137, 1.842538, 1.884276, 1, 1, 1, 1, 1,
0.1631225, -1.795817, 5.006429, 1, 1, 1, 1, 1,
0.1656545, -1.160052, 1.791066, 0, 0, 1, 1, 1,
0.1657871, -0.6424605, 3.675084, 1, 0, 0, 1, 1,
0.1663143, 0.1034139, 0.861918, 1, 0, 0, 1, 1,
0.1667083, -1.120697, 2.615239, 1, 0, 0, 1, 1,
0.1765935, -0.635758, 2.431748, 1, 0, 0, 1, 1,
0.1771268, -0.2777247, 3.306576, 1, 0, 0, 1, 1,
0.181062, 0.1274147, 1.111469, 0, 0, 0, 1, 1,
0.1817811, -0.1314054, 2.388943, 0, 0, 0, 1, 1,
0.1838798, 0.2421032, 0.5450495, 0, 0, 0, 1, 1,
0.1839805, -1.208547, 3.244554, 0, 0, 0, 1, 1,
0.1861217, -1.909923, 3.581245, 0, 0, 0, 1, 1,
0.1882001, 0.2724423, 0.2169584, 0, 0, 0, 1, 1,
0.1932763, -0.1844888, 2.659548, 0, 0, 0, 1, 1,
0.1956525, -1.070231, 3.934897, 1, 1, 1, 1, 1,
0.1993898, 0.3923957, -0.7010704, 1, 1, 1, 1, 1,
0.1996687, -0.2123002, 2.000777, 1, 1, 1, 1, 1,
0.2043433, -0.9299935, 2.973645, 1, 1, 1, 1, 1,
0.2050507, -0.4238597, 1.965176, 1, 1, 1, 1, 1,
0.206157, 0.09755293, 1.471371, 1, 1, 1, 1, 1,
0.2070882, 0.3354548, 0.1710223, 1, 1, 1, 1, 1,
0.2084289, -0.5895625, 4.329536, 1, 1, 1, 1, 1,
0.2094443, -0.975669, 2.499238, 1, 1, 1, 1, 1,
0.2111003, -0.07310835, 0.9879592, 1, 1, 1, 1, 1,
0.211231, 0.7650578, 0.06926653, 1, 1, 1, 1, 1,
0.217932, 1.322082, 1.723466, 1, 1, 1, 1, 1,
0.21857, -1.17817, 2.697939, 1, 1, 1, 1, 1,
0.2197186, -1.840967, 2.650452, 1, 1, 1, 1, 1,
0.2224702, 1.422597, 0.9271758, 1, 1, 1, 1, 1,
0.224603, 0.7732739, -0.8366915, 0, 0, 1, 1, 1,
0.2254566, -0.9635088, 3.183884, 1, 0, 0, 1, 1,
0.227883, 0.564077, 0.4665223, 1, 0, 0, 1, 1,
0.2350957, 0.276294, 1.042692, 1, 0, 0, 1, 1,
0.2371646, 0.104811, 1.310256, 1, 0, 0, 1, 1,
0.2392938, -0.9039844, 2.755622, 1, 0, 0, 1, 1,
0.2459956, 4.102329, 0.05600966, 0, 0, 0, 1, 1,
0.2462246, 0.0003744813, 3.51723, 0, 0, 0, 1, 1,
0.2526774, -0.1874503, 2.808999, 0, 0, 0, 1, 1,
0.2597058, 0.6184362, 0.05820785, 0, 0, 0, 1, 1,
0.2612276, 0.9811526, -1.822576, 0, 0, 0, 1, 1,
0.2651482, -0.9228151, 1.211355, 0, 0, 0, 1, 1,
0.2699841, -1.622959, 2.990492, 0, 0, 0, 1, 1,
0.2702312, -0.7972597, 3.614184, 1, 1, 1, 1, 1,
0.2727289, -0.2344533, 1.787402, 1, 1, 1, 1, 1,
0.2730466, -1.096213, 2.453101, 1, 1, 1, 1, 1,
0.2828906, -0.2418577, 3.364545, 1, 1, 1, 1, 1,
0.2830687, -1.683011, 2.747483, 1, 1, 1, 1, 1,
0.2846513, 1.023942, 1.011351, 1, 1, 1, 1, 1,
0.294187, -0.3757066, 2.65249, 1, 1, 1, 1, 1,
0.2970356, 0.756609, 0.3748745, 1, 1, 1, 1, 1,
0.2995402, 1.443164, -0.06539729, 1, 1, 1, 1, 1,
0.3023915, 1.373709, -0.7819656, 1, 1, 1, 1, 1,
0.3029482, -0.2023366, 2.926908, 1, 1, 1, 1, 1,
0.3030752, 1.292468, -0.2052853, 1, 1, 1, 1, 1,
0.30459, -1.000968, 2.504383, 1, 1, 1, 1, 1,
0.3052548, -1.287933, 1.959883, 1, 1, 1, 1, 1,
0.3053366, -0.8084663, 1.617126, 1, 1, 1, 1, 1,
0.3060289, 1.626215, 0.3050388, 0, 0, 1, 1, 1,
0.3078377, -1.232804, 4.025359, 1, 0, 0, 1, 1,
0.3128858, -1.952985, 1.166513, 1, 0, 0, 1, 1,
0.3238676, 0.4219602, 0.7467144, 1, 0, 0, 1, 1,
0.3321087, 1.536361, -1.074854, 1, 0, 0, 1, 1,
0.3323688, 0.1370093, 1.8038, 1, 0, 0, 1, 1,
0.3326899, 0.968326, 2.142658, 0, 0, 0, 1, 1,
0.3335086, -0.5918108, 1.222381, 0, 0, 0, 1, 1,
0.3347363, 0.1239793, 1.401967, 0, 0, 0, 1, 1,
0.3410498, 0.5053943, 0.1306821, 0, 0, 0, 1, 1,
0.3425193, 1.852026, 0.08173901, 0, 0, 0, 1, 1,
0.3442498, -0.939271, 3.679891, 0, 0, 0, 1, 1,
0.346721, -0.3646512, 2.150678, 0, 0, 0, 1, 1,
0.3482183, 0.3936757, 0.7647339, 1, 1, 1, 1, 1,
0.3505142, 1.33315, 0.6838369, 1, 1, 1, 1, 1,
0.3537168, 0.6627676, 0.7407926, 1, 1, 1, 1, 1,
0.3547828, 0.346619, 1.202882, 1, 1, 1, 1, 1,
0.3563791, 0.159829, 1.59027, 1, 1, 1, 1, 1,
0.3619521, -0.8437754, 1.466235, 1, 1, 1, 1, 1,
0.3629424, -1.742031, 2.490262, 1, 1, 1, 1, 1,
0.3641764, 0.05618358, 2.883018, 1, 1, 1, 1, 1,
0.3681115, 1.162988, 0.5740494, 1, 1, 1, 1, 1,
0.3714741, 0.07647628, 2.715105, 1, 1, 1, 1, 1,
0.3777612, 0.1555507, 0.7313436, 1, 1, 1, 1, 1,
0.3792694, 1.257742, -0.2723121, 1, 1, 1, 1, 1,
0.3809512, -1.191365, 1.913959, 1, 1, 1, 1, 1,
0.3838031, 1.901552, -1.06393, 1, 1, 1, 1, 1,
0.3868511, -1.017383, 2.700957, 1, 1, 1, 1, 1,
0.3875372, 0.7667522, 1.340637, 0, 0, 1, 1, 1,
0.3882887, -0.962382, 2.666481, 1, 0, 0, 1, 1,
0.3885998, -0.3326578, 2.684322, 1, 0, 0, 1, 1,
0.3886659, -0.6965303, 2.681595, 1, 0, 0, 1, 1,
0.3935766, 0.6042784, 0.612367, 1, 0, 0, 1, 1,
0.3945751, 0.8656034, 0.2446615, 1, 0, 0, 1, 1,
0.3953226, 0.1083625, 1.257584, 0, 0, 0, 1, 1,
0.3955041, -2.439327, 4.47888, 0, 0, 0, 1, 1,
0.4056677, 0.4373487, -0.187578, 0, 0, 0, 1, 1,
0.4082815, 2.32036, -0.2172964, 0, 0, 0, 1, 1,
0.4092645, -1.080051, 0.7363604, 0, 0, 0, 1, 1,
0.411114, -0.4444618, 3.346642, 0, 0, 0, 1, 1,
0.412712, -0.9279723, 3.16488, 0, 0, 0, 1, 1,
0.4138868, 0.6801864, 2.252368, 1, 1, 1, 1, 1,
0.4141751, 0.05542303, 1.00236, 1, 1, 1, 1, 1,
0.4166121, -1.275212, 2.005718, 1, 1, 1, 1, 1,
0.4174931, 0.3930791, 0.4771613, 1, 1, 1, 1, 1,
0.4201339, -0.610485, 2.444305, 1, 1, 1, 1, 1,
0.4227093, -0.3810732, 2.378967, 1, 1, 1, 1, 1,
0.4269525, -1.212516, 2.545273, 1, 1, 1, 1, 1,
0.4275136, 1.991791, -0.8459983, 1, 1, 1, 1, 1,
0.4277609, -2.437982, 1.822544, 1, 1, 1, 1, 1,
0.4277982, -0.3705611, 2.510672, 1, 1, 1, 1, 1,
0.4289347, 0.1975683, 0.4178583, 1, 1, 1, 1, 1,
0.4301718, -0.453813, 2.263372, 1, 1, 1, 1, 1,
0.4316263, -0.3976671, 2.304148, 1, 1, 1, 1, 1,
0.4336834, 0.5858802, -0.02674599, 1, 1, 1, 1, 1,
0.434508, 1.540478, 1.927247, 1, 1, 1, 1, 1,
0.4357772, -1.415925, 2.354038, 0, 0, 1, 1, 1,
0.438089, 1.449208, -1.177504, 1, 0, 0, 1, 1,
0.4407366, -0.7502331, 2.68081, 1, 0, 0, 1, 1,
0.4412268, -0.5691985, 3.109457, 1, 0, 0, 1, 1,
0.4420668, 1.307464, -0.9486284, 1, 0, 0, 1, 1,
0.444803, 0.5962864, -0.01066813, 1, 0, 0, 1, 1,
0.4483555, -0.375972, 4.178509, 0, 0, 0, 1, 1,
0.4500199, 0.151087, 1.420385, 0, 0, 0, 1, 1,
0.4577561, -1.655562, 3.020396, 0, 0, 0, 1, 1,
0.4584184, -0.9035665, 3.097179, 0, 0, 0, 1, 1,
0.4585733, -0.797124, 3.483731, 0, 0, 0, 1, 1,
0.4619508, -0.03091927, 1.021485, 0, 0, 0, 1, 1,
0.4641197, 0.8402984, -0.525424, 0, 0, 0, 1, 1,
0.466978, -2.388552, 3.899926, 1, 1, 1, 1, 1,
0.4732848, -0.6317511, 3.49729, 1, 1, 1, 1, 1,
0.4784458, -1.603707, 3.754878, 1, 1, 1, 1, 1,
0.4809133, -0.191213, -0.2924965, 1, 1, 1, 1, 1,
0.4855616, -0.1863046, 1.99352, 1, 1, 1, 1, 1,
0.504302, -0.279232, 4.172375, 1, 1, 1, 1, 1,
0.5043297, -0.436718, 0.873336, 1, 1, 1, 1, 1,
0.5068559, 0.04771569, 0.747142, 1, 1, 1, 1, 1,
0.5199547, 0.6090181, 0.0317161, 1, 1, 1, 1, 1,
0.5211226, 0.5998958, 1.627267, 1, 1, 1, 1, 1,
0.5215065, 1.167102, 0.6875596, 1, 1, 1, 1, 1,
0.5223437, -0.9325443, 2.91924, 1, 1, 1, 1, 1,
0.5285805, 0.6895895, 0.6686786, 1, 1, 1, 1, 1,
0.530217, 0.5127013, 1.603888, 1, 1, 1, 1, 1,
0.5302734, 1.190021, -1.475919, 1, 1, 1, 1, 1,
0.5320118, 1.673227, -0.3819201, 0, 0, 1, 1, 1,
0.5320551, 0.05644465, 2.731488, 1, 0, 0, 1, 1,
0.5386573, 1.247773, -0.237831, 1, 0, 0, 1, 1,
0.5412386, 0.4980213, -0.6368327, 1, 0, 0, 1, 1,
0.543558, 0.8097125, -0.7002011, 1, 0, 0, 1, 1,
0.5466784, 0.5204605, -0.2142145, 1, 0, 0, 1, 1,
0.547028, 2.077555, 1.272784, 0, 0, 0, 1, 1,
0.5492671, 1.131285, -0.3487772, 0, 0, 0, 1, 1,
0.5543452, 1.881414, 0.6496315, 0, 0, 0, 1, 1,
0.5547788, 1.242746, -0.4643237, 0, 0, 0, 1, 1,
0.5615965, 0.7303353, 0.5050743, 0, 0, 0, 1, 1,
0.5687776, 1.224332, 0.2384768, 0, 0, 0, 1, 1,
0.5702003, 0.3704599, 1.041565, 0, 0, 0, 1, 1,
0.5744181, 0.08306918, 2.928297, 1, 1, 1, 1, 1,
0.5775043, 0.05187963, 1.60452, 1, 1, 1, 1, 1,
0.5787496, 0.0923366, -0.03701132, 1, 1, 1, 1, 1,
0.581607, -0.2809519, 1.38149, 1, 1, 1, 1, 1,
0.5838557, 1.387792, 2.083987, 1, 1, 1, 1, 1,
0.5860832, 0.4783393, 2.089554, 1, 1, 1, 1, 1,
0.5864727, -0.4743733, 2.311825, 1, 1, 1, 1, 1,
0.6040991, -0.6992302, 1.359557, 1, 1, 1, 1, 1,
0.605552, 1.490171, 1.04999, 1, 1, 1, 1, 1,
0.6069445, 1.856542, 1.596402, 1, 1, 1, 1, 1,
0.6076645, 1.546309, 0.2278251, 1, 1, 1, 1, 1,
0.610226, 1.021597, -0.366898, 1, 1, 1, 1, 1,
0.614424, 0.721959, -0.2779335, 1, 1, 1, 1, 1,
0.6145598, 1.287176, 0.8506378, 1, 1, 1, 1, 1,
0.6190274, 1.161387, -0.1273487, 1, 1, 1, 1, 1,
0.6197835, -0.6025428, 4.338241, 0, 0, 1, 1, 1,
0.6267247, -0.8498663, 0.7021157, 1, 0, 0, 1, 1,
0.638761, 0.780747, 0.4784451, 1, 0, 0, 1, 1,
0.6503215, -1.559829, 1.904975, 1, 0, 0, 1, 1,
0.65051, 0.7386722, 0.4659441, 1, 0, 0, 1, 1,
0.6543514, 2.333066, 1.414197, 1, 0, 0, 1, 1,
0.6717505, -0.04861362, 0.2428142, 0, 0, 0, 1, 1,
0.6737525, -1.577919, 2.598246, 0, 0, 0, 1, 1,
0.6758988, 1.541347, 2.160623, 0, 0, 0, 1, 1,
0.6782232, -0.4525145, 2.802709, 0, 0, 0, 1, 1,
0.685017, 0.7659421, 0.636539, 0, 0, 0, 1, 1,
0.6863802, -1.062483, 4.659753, 0, 0, 0, 1, 1,
0.6884729, -0.2059833, 1.981183, 0, 0, 0, 1, 1,
0.6895838, -1.581731, 3.641179, 1, 1, 1, 1, 1,
0.6933493, -0.8258322, 1.94005, 1, 1, 1, 1, 1,
0.6960687, 0.6451335, 3.411298, 1, 1, 1, 1, 1,
0.6969993, -0.8934102, 1.302926, 1, 1, 1, 1, 1,
0.6972376, 0.2014241, 2.58561, 1, 1, 1, 1, 1,
0.697677, 1.382328, 0.6373687, 1, 1, 1, 1, 1,
0.6983252, 0.8648546, 1.019075, 1, 1, 1, 1, 1,
0.70522, -0.6154553, 2.954199, 1, 1, 1, 1, 1,
0.7105312, -1.211403, 4.526131, 1, 1, 1, 1, 1,
0.720161, -0.3197707, 1.069715, 1, 1, 1, 1, 1,
0.7255381, -0.430315, 1.426884, 1, 1, 1, 1, 1,
0.7255592, -0.5190767, 3.074016, 1, 1, 1, 1, 1,
0.7286626, 2.61516, -0.3346239, 1, 1, 1, 1, 1,
0.7303434, 0.8808411, -1.871812, 1, 1, 1, 1, 1,
0.7355794, 1.207023, 1.708093, 1, 1, 1, 1, 1,
0.741079, 1.435483, 1.323093, 0, 0, 1, 1, 1,
0.7411294, 0.1166568, 0.3044181, 1, 0, 0, 1, 1,
0.7414529, 1.047896, 0.6544048, 1, 0, 0, 1, 1,
0.7469822, -0.1251263, 0.002699299, 1, 0, 0, 1, 1,
0.7573644, -0.1043684, 2.602154, 1, 0, 0, 1, 1,
0.762588, -1.865495, 4.386149, 1, 0, 0, 1, 1,
0.7629185, -0.06788068, 1.338568, 0, 0, 0, 1, 1,
0.7747127, 0.02826868, 1.449752, 0, 0, 0, 1, 1,
0.7826571, 0.4085848, 0.7283359, 0, 0, 0, 1, 1,
0.7838495, 0.01347658, 1.436476, 0, 0, 0, 1, 1,
0.7867592, 0.09804058, 1.206943, 0, 0, 0, 1, 1,
0.7918176, 0.182775, 0.3759046, 0, 0, 0, 1, 1,
0.7918373, 0.3125191, 1.995827, 0, 0, 0, 1, 1,
0.7940639, 0.2680444, 0.9903479, 1, 1, 1, 1, 1,
0.7967703, -0.2345947, 1.795436, 1, 1, 1, 1, 1,
0.8001755, 1.204234, 2.895552, 1, 1, 1, 1, 1,
0.8071154, 1.644625, 2.142874, 1, 1, 1, 1, 1,
0.8093667, 0.4033299, 0.914927, 1, 1, 1, 1, 1,
0.8109491, -0.6832671, 2.05652, 1, 1, 1, 1, 1,
0.8130279, -1.005787, 2.121634, 1, 1, 1, 1, 1,
0.814678, 0.5091988, 1.132295, 1, 1, 1, 1, 1,
0.8159194, 1.277089, -1.299586, 1, 1, 1, 1, 1,
0.8306463, 0.4827484, 0.1083695, 1, 1, 1, 1, 1,
0.8329202, -1.135058, 0.2537367, 1, 1, 1, 1, 1,
0.8338748, -1.278018, 3.503218, 1, 1, 1, 1, 1,
0.8381566, 1.000998, 0.7936152, 1, 1, 1, 1, 1,
0.8426783, -0.5521592, 1.719344, 1, 1, 1, 1, 1,
0.8428301, 0.5500913, -0.3827983, 1, 1, 1, 1, 1,
0.847713, -0.174096, 2.837898, 0, 0, 1, 1, 1,
0.8492408, -0.9690456, 1.246434, 1, 0, 0, 1, 1,
0.8577266, -0.6577612, 1.638708, 1, 0, 0, 1, 1,
0.8596437, 1.868668, 1.291798, 1, 0, 0, 1, 1,
0.8641764, -1.644232, 3.195534, 1, 0, 0, 1, 1,
0.8721688, -0.3624147, 1.627865, 1, 0, 0, 1, 1,
0.8748093, 0.3610606, 0.6092965, 0, 0, 0, 1, 1,
0.8820485, 1.118177, -0.01631563, 0, 0, 0, 1, 1,
0.8841027, -0.9972436, 2.227647, 0, 0, 0, 1, 1,
0.884451, -0.1057694, 2.414623, 0, 0, 0, 1, 1,
0.8862393, 0.1289225, 0.5977443, 0, 0, 0, 1, 1,
0.8864549, 0.1889991, 1.330473, 0, 0, 0, 1, 1,
0.8920466, -2.242621, 3.211218, 0, 0, 0, 1, 1,
0.8957136, -0.3541715, 1.540607, 1, 1, 1, 1, 1,
0.9073085, -0.4444864, 3.299196, 1, 1, 1, 1, 1,
0.9101492, 1.581999, 1.436061, 1, 1, 1, 1, 1,
0.9175382, -0.3161893, 1.192729, 1, 1, 1, 1, 1,
0.9242508, -1.044545, 3.177241, 1, 1, 1, 1, 1,
0.9305797, -0.6534638, 3.083776, 1, 1, 1, 1, 1,
0.9310589, -0.4729916, 1.802014, 1, 1, 1, 1, 1,
0.9313678, 0.9754286, 0.846576, 1, 1, 1, 1, 1,
0.9324734, 0.1019542, 3.160861, 1, 1, 1, 1, 1,
0.9366918, -0.7397587, 2.604763, 1, 1, 1, 1, 1,
0.9401526, -0.4893156, 2.984353, 1, 1, 1, 1, 1,
0.9450137, 0.1991725, 1.717095, 1, 1, 1, 1, 1,
0.9467636, -0.1381427, 0.5427004, 1, 1, 1, 1, 1,
0.9496772, 0.7002307, 1.394888, 1, 1, 1, 1, 1,
0.951949, -0.4767252, 3.008309, 1, 1, 1, 1, 1,
0.9526249, 0.7950811, 0.3391574, 0, 0, 1, 1, 1,
0.9543158, 0.1204084, 1.926543, 1, 0, 0, 1, 1,
0.9582657, 1.908491, 1.544126, 1, 0, 0, 1, 1,
0.9601074, -1.187771, 1.213829, 1, 0, 0, 1, 1,
0.9653189, 2.598256, -0.1399112, 1, 0, 0, 1, 1,
0.9685801, -1.185067, 1.896281, 1, 0, 0, 1, 1,
0.9751275, -0.5083154, 3.194344, 0, 0, 0, 1, 1,
0.9773428, 0.1834955, 2.789992, 0, 0, 0, 1, 1,
0.9870834, -1.756522, 1.296521, 0, 0, 0, 1, 1,
0.9924405, 0.9336865, 2.644759, 0, 0, 0, 1, 1,
0.9952704, -0.8208103, 1.713989, 0, 0, 0, 1, 1,
0.9966252, 0.5135283, 0.9400899, 0, 0, 0, 1, 1,
0.9983145, -0.5167344, 2.100257, 0, 0, 0, 1, 1,
0.9992351, -0.7390914, 1.897604, 1, 1, 1, 1, 1,
0.9995912, 0.1768716, 1.253406, 1, 1, 1, 1, 1,
1.004776, 1.627561, 0.9503795, 1, 1, 1, 1, 1,
1.006232, 1.973848, 0.3469767, 1, 1, 1, 1, 1,
1.010629, 1.102991, 1.916191, 1, 1, 1, 1, 1,
1.011476, -0.8413053, 3.38521, 1, 1, 1, 1, 1,
1.021416, 2.168788, -0.7231206, 1, 1, 1, 1, 1,
1.024291, 1.819097, 1.248396, 1, 1, 1, 1, 1,
1.02472, 1.88812, 1.662018, 1, 1, 1, 1, 1,
1.043286, -0.06820358, 1.893772, 1, 1, 1, 1, 1,
1.052419, -0.1408394, 2.953922, 1, 1, 1, 1, 1,
1.053005, -1.46891, 3.443589, 1, 1, 1, 1, 1,
1.055346, -1.330029, 1.49457, 1, 1, 1, 1, 1,
1.057785, -1.238317, 0.3344817, 1, 1, 1, 1, 1,
1.059549, -0.04795161, 1.896757, 1, 1, 1, 1, 1,
1.069985, -0.148587, 1.721123, 0, 0, 1, 1, 1,
1.07825, -0.7398643, 1.067838, 1, 0, 0, 1, 1,
1.081997, -0.07393542, 1.30352, 1, 0, 0, 1, 1,
1.084153, -0.6384588, 3.398365, 1, 0, 0, 1, 1,
1.089676, 0.9467666, 1.336463, 1, 0, 0, 1, 1,
1.09163, 1.978538, 1.079508, 1, 0, 0, 1, 1,
1.093199, -0.6873096, 3.666805, 0, 0, 0, 1, 1,
1.093486, -2.123491, 2.92916, 0, 0, 0, 1, 1,
1.096844, -0.7172216, 2.476122, 0, 0, 0, 1, 1,
1.102201, 1.053291, 0.4836306, 0, 0, 0, 1, 1,
1.105761, -0.4877731, 1.046567, 0, 0, 0, 1, 1,
1.107687, 0.1043689, 3.102388, 0, 0, 0, 1, 1,
1.113192, 0.4347485, 2.119629, 0, 0, 0, 1, 1,
1.113492, -0.7572971, 0.423007, 1, 1, 1, 1, 1,
1.113793, 0.2277434, 1.85712, 1, 1, 1, 1, 1,
1.114423, 0.9567502, 1.63105, 1, 1, 1, 1, 1,
1.122372, -0.7192134, 3.024146, 1, 1, 1, 1, 1,
1.150905, 0.9093228, 3.416511, 1, 1, 1, 1, 1,
1.152213, -1.268189, 2.139168, 1, 1, 1, 1, 1,
1.175519, 0.6938307, 0.1765068, 1, 1, 1, 1, 1,
1.179131, 0.4604494, 1.608526, 1, 1, 1, 1, 1,
1.179756, -0.2007635, 2.873274, 1, 1, 1, 1, 1,
1.184109, 0.2705777, 1.368239, 1, 1, 1, 1, 1,
1.187192, -2.093514, 2.654391, 1, 1, 1, 1, 1,
1.190618, -2.176524, 1.943106, 1, 1, 1, 1, 1,
1.205854, 0.3443594, 0.5910099, 1, 1, 1, 1, 1,
1.214866, -0.5937245, 0.9987876, 1, 1, 1, 1, 1,
1.216701, -0.4866171, 1.194306, 1, 1, 1, 1, 1,
1.227709, -0.0187606, 2.346784, 0, 0, 1, 1, 1,
1.228134, 1.539605, 0.08119974, 1, 0, 0, 1, 1,
1.237633, 0.4182863, 1.306191, 1, 0, 0, 1, 1,
1.238956, 0.0562081, 1.270499, 1, 0, 0, 1, 1,
1.246439, 2.07086, 0.549404, 1, 0, 0, 1, 1,
1.256958, -0.3617322, 3.663257, 1, 0, 0, 1, 1,
1.275313, -0.5442228, 0.7535777, 0, 0, 0, 1, 1,
1.277012, 1.436606, -0.5180372, 0, 0, 0, 1, 1,
1.277339, 0.479103, 3.375661, 0, 0, 0, 1, 1,
1.278296, -0.6233207, 3.859189, 0, 0, 0, 1, 1,
1.279489, -1.657558, 1.246518, 0, 0, 0, 1, 1,
1.280009, -0.8364993, 1.627295, 0, 0, 0, 1, 1,
1.283882, 1.385257, 0.08310609, 0, 0, 0, 1, 1,
1.288513, 2.532281, -0.9023291, 1, 1, 1, 1, 1,
1.290335, 0.4657424, 1.212362, 1, 1, 1, 1, 1,
1.290578, -1.213975, 2.420021, 1, 1, 1, 1, 1,
1.293211, -1.072332e-06, 2.374994, 1, 1, 1, 1, 1,
1.305612, 0.1228323, 1.108902, 1, 1, 1, 1, 1,
1.305941, -0.04286269, 0.7548408, 1, 1, 1, 1, 1,
1.30951, 0.05752914, 1.160074, 1, 1, 1, 1, 1,
1.315482, 1.902102, -2.224026, 1, 1, 1, 1, 1,
1.320722, -1.788645, 0.5829564, 1, 1, 1, 1, 1,
1.325083, -0.5330802, 2.261028, 1, 1, 1, 1, 1,
1.330553, -0.2911334, 2.648889, 1, 1, 1, 1, 1,
1.33693, 1.807983, 0.3241865, 1, 1, 1, 1, 1,
1.354154, 2.5344, 1.24172, 1, 1, 1, 1, 1,
1.355053, 0.6815155, 1.098352, 1, 1, 1, 1, 1,
1.357268, 0.8886318, 0.7711517, 1, 1, 1, 1, 1,
1.358128, 0.7295276, 3.161024, 0, 0, 1, 1, 1,
1.361706, 1.055008, 0.6930562, 1, 0, 0, 1, 1,
1.364932, 1.082722, 0.02968388, 1, 0, 0, 1, 1,
1.370272, 0.719588, 1.756117, 1, 0, 0, 1, 1,
1.370901, 1.36365, 1.314321, 1, 0, 0, 1, 1,
1.381747, 0.3453939, 2.392583, 1, 0, 0, 1, 1,
1.388915, 0.2119471, 2.431704, 0, 0, 0, 1, 1,
1.403197, 0.4784631, 1.742885, 0, 0, 0, 1, 1,
1.404302, 0.4997773, 1.264434, 0, 0, 0, 1, 1,
1.417293, 0.3364122, 1.756444, 0, 0, 0, 1, 1,
1.420805, -0.04011137, 1.367722, 0, 0, 0, 1, 1,
1.421691, 0.1447398, 2.722135, 0, 0, 0, 1, 1,
1.423257, 0.5711069, 2.593639, 0, 0, 0, 1, 1,
1.432727, -0.3719388, 1.82784, 1, 1, 1, 1, 1,
1.439054, -1.232303, 3.003329, 1, 1, 1, 1, 1,
1.443401, 0.9915663, 2.400524, 1, 1, 1, 1, 1,
1.444539, 0.02989529, 1.798291, 1, 1, 1, 1, 1,
1.445725, -0.2515439, 1.938983, 1, 1, 1, 1, 1,
1.458767, -1.052341, 2.935035, 1, 1, 1, 1, 1,
1.469236, 0.663137, 1.101877, 1, 1, 1, 1, 1,
1.482493, -0.3788897, 2.120404, 1, 1, 1, 1, 1,
1.48253, 1.029417, 0.9329922, 1, 1, 1, 1, 1,
1.502255, 0.7184694, 1.805171, 1, 1, 1, 1, 1,
1.508578, -0.2331614, 2.045628, 1, 1, 1, 1, 1,
1.511924, 0.06456637, 0.8055115, 1, 1, 1, 1, 1,
1.515926, -0.6580887, 2.495498, 1, 1, 1, 1, 1,
1.521986, 0.5590599, 1.155689, 1, 1, 1, 1, 1,
1.524163, 1.732171, -0.6438676, 1, 1, 1, 1, 1,
1.536098, 0.1304878, 0.1306498, 0, 0, 1, 1, 1,
1.572774, 0.1239385, 1.543413, 1, 0, 0, 1, 1,
1.576671, 0.4860741, 4.142318, 1, 0, 0, 1, 1,
1.580492, 1.547562, 0.7978685, 1, 0, 0, 1, 1,
1.581312, 0.647702, 1.08433, 1, 0, 0, 1, 1,
1.584771, -0.5074007, 2.144655, 1, 0, 0, 1, 1,
1.588043, 0.3465546, 0.1978946, 0, 0, 0, 1, 1,
1.592095, 0.3060577, 2.348341, 0, 0, 0, 1, 1,
1.599892, -0.3764964, 2.608463, 0, 0, 0, 1, 1,
1.603694, -0.4765852, 0.8293743, 0, 0, 0, 1, 1,
1.633567, -0.2226395, 0.5169563, 0, 0, 0, 1, 1,
1.641138, 0.7379622, 1.139718, 0, 0, 0, 1, 1,
1.647407, 1.20624, -0.1756975, 0, 0, 0, 1, 1,
1.656345, -1.136992, 2.148917, 1, 1, 1, 1, 1,
1.660245, -0.5496608, 1.826658, 1, 1, 1, 1, 1,
1.66221, 0.8397426, 2.037079, 1, 1, 1, 1, 1,
1.665014, -0.6451623, 0.8019414, 1, 1, 1, 1, 1,
1.665463, -0.9699686, 2.169111, 1, 1, 1, 1, 1,
1.673316, -0.8891777, 1.266751, 1, 1, 1, 1, 1,
1.678161, 0.1600104, 2.696387, 1, 1, 1, 1, 1,
1.687218, 0.9946333, -1.010273, 1, 1, 1, 1, 1,
1.69441, 0.1201451, 0.3833694, 1, 1, 1, 1, 1,
1.697423, -0.4947656, 4.13762, 1, 1, 1, 1, 1,
1.698533, -1.897315, 1.043264, 1, 1, 1, 1, 1,
1.717563, 0.2431651, 0.7946445, 1, 1, 1, 1, 1,
1.720105, -0.05075732, -0.8639932, 1, 1, 1, 1, 1,
1.728157, 0.5475804, 1.874985, 1, 1, 1, 1, 1,
1.736607, 0.4274185, 2.896199, 1, 1, 1, 1, 1,
1.740068, 0.3529064, 0.7636069, 0, 0, 1, 1, 1,
1.751548, 1.560721, -0.02349282, 1, 0, 0, 1, 1,
1.769198, -0.3517066, 2.394258, 1, 0, 0, 1, 1,
1.782003, 0.3546726, 0.3438695, 1, 0, 0, 1, 1,
1.788413, -1.532423, 1.411678, 1, 0, 0, 1, 1,
1.791726, -1.041307, 2.91874, 1, 0, 0, 1, 1,
1.797297, -1.39125, 1.303435, 0, 0, 0, 1, 1,
1.812044, -0.89651, 2.688147, 0, 0, 0, 1, 1,
1.813794, -0.7527726, 3.595313, 0, 0, 0, 1, 1,
1.817645, -1.175722, 1.300016, 0, 0, 0, 1, 1,
1.832395, 0.2086501, 0.9090422, 0, 0, 0, 1, 1,
1.834254, -0.7413669, 2.887504, 0, 0, 0, 1, 1,
1.848516, 0.5877212, 1.266149, 0, 0, 0, 1, 1,
1.879132, 1.117067, 2.184714, 1, 1, 1, 1, 1,
1.900622, 1.353761, 1.503121, 1, 1, 1, 1, 1,
1.923692, -0.3742751, 2.975381, 1, 1, 1, 1, 1,
1.924865, 1.011357, 1.428099, 1, 1, 1, 1, 1,
1.968708, 0.72496, 1.27712, 1, 1, 1, 1, 1,
1.975274, -1.186833, 4.58976, 1, 1, 1, 1, 1,
1.976948, -0.3844196, 0.3722922, 1, 1, 1, 1, 1,
1.98461, -0.8078569, 0.348797, 1, 1, 1, 1, 1,
2.032578, 0.08554017, 1.568265, 1, 1, 1, 1, 1,
2.038618, -1.591756, 3.788173, 1, 1, 1, 1, 1,
2.065983, 0.1671419, 2.728538, 1, 1, 1, 1, 1,
2.081718, 0.01004443, 1.815748, 1, 1, 1, 1, 1,
2.113662, -0.4884043, 2.596095, 1, 1, 1, 1, 1,
2.121408, -0.5377318, 2.251618, 1, 1, 1, 1, 1,
2.124342, 0.3538396, 0.1375049, 1, 1, 1, 1, 1,
2.132102, 0.4486314, 2.326904, 0, 0, 1, 1, 1,
2.143342, 0.4422497, 0.9661976, 1, 0, 0, 1, 1,
2.146013, -0.6894553, 2.125158, 1, 0, 0, 1, 1,
2.151987, -1.833034, 4.331157, 1, 0, 0, 1, 1,
2.153035, -0.9504636, 3.680128, 1, 0, 0, 1, 1,
2.201038, -1.404478, 1.215899, 1, 0, 0, 1, 1,
2.220427, 1.261521, 0.9533283, 0, 0, 0, 1, 1,
2.222476, 0.695201, 0.1490619, 0, 0, 0, 1, 1,
2.249701, -0.4305158, 2.255881, 0, 0, 0, 1, 1,
2.250012, -1.193914, 3.893586, 0, 0, 0, 1, 1,
2.265721, 0.4300634, -0.1578804, 0, 0, 0, 1, 1,
2.272025, 1.275962, 1.843188, 0, 0, 0, 1, 1,
2.331142, 1.145889, 2.050451, 0, 0, 0, 1, 1,
2.355642, 0.1159151, 2.868954, 1, 1, 1, 1, 1,
2.394758, -0.3139742, 0.9822957, 1, 1, 1, 1, 1,
2.413404, 0.3369791, 1.549483, 1, 1, 1, 1, 1,
2.441731, 1.622108, 1.639407, 1, 1, 1, 1, 1,
2.470126, -0.4723874, 2.613379, 1, 1, 1, 1, 1,
2.530925, 2.502213, 0.5728164, 1, 1, 1, 1, 1,
2.868692, -0.8495346, 0.5247299, 1, 1, 1, 1, 1
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
var radius = 9.358771;
var distance = 32.87229;
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
mvMatrix.translate( -0.06187046, -0.4972239, 0.05052948 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87229);
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
