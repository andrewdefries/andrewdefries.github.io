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
-2.954447, -0.1097879, -3.934085, 1, 0, 0, 1,
-2.847068, -0.5987095, -3.328489, 1, 0.007843138, 0, 1,
-2.713084, -1.134649, -2.148316, 1, 0.01176471, 0, 1,
-2.697815, -0.2207051, -1.309428, 1, 0.01960784, 0, 1,
-2.666274, -0.2243666, -1.915438, 1, 0.02352941, 0, 1,
-2.54699, -1.963067, -1.571422, 1, 0.03137255, 0, 1,
-2.519404, 1.295686, -0.3969316, 1, 0.03529412, 0, 1,
-2.426409, 1.009597, -0.9516388, 1, 0.04313726, 0, 1,
-2.368173, -0.5356808, -1.312135, 1, 0.04705882, 0, 1,
-2.355397, -0.5186042, -4.16869, 1, 0.05490196, 0, 1,
-2.298346, 0.7923399, -0.2930886, 1, 0.05882353, 0, 1,
-2.272626, -0.05934566, -2.014548, 1, 0.06666667, 0, 1,
-2.175927, -0.4485472, -1.218065, 1, 0.07058824, 0, 1,
-2.167407, -0.1942085, -1.539554, 1, 0.07843138, 0, 1,
-2.164639, -0.05490809, -1.161651, 1, 0.08235294, 0, 1,
-2.128338, -0.8359146, 0.456355, 1, 0.09019608, 0, 1,
-2.093404, -0.08962605, -1.332909, 1, 0.09411765, 0, 1,
-2.090328, 0.8704996, -1.383375, 1, 0.1019608, 0, 1,
-2.031862, 1.07776, -2.978925, 1, 0.1098039, 0, 1,
-2.012598, -0.01752364, -0.6885623, 1, 0.1137255, 0, 1,
-2.011423, -0.5626454, -2.590657, 1, 0.1215686, 0, 1,
-1.999576, -2.014537, -0.79388, 1, 0.1254902, 0, 1,
-1.973451, 0.7255779, -1.367878, 1, 0.1333333, 0, 1,
-1.972529, 1.142809, -1.630256, 1, 0.1372549, 0, 1,
-1.960542, 0.07033161, -1.947018, 1, 0.145098, 0, 1,
-1.954413, 0.1716121, -0.8201038, 1, 0.1490196, 0, 1,
-1.92537, -0.2862442, -2.195865, 1, 0.1568628, 0, 1,
-1.91288, -0.9486415, -0.275822, 1, 0.1607843, 0, 1,
-1.879435, -0.8803024, -0.8720035, 1, 0.1686275, 0, 1,
-1.861933, -0.5351009, -4.094613, 1, 0.172549, 0, 1,
-1.86042, -1.70037, -1.161103, 1, 0.1803922, 0, 1,
-1.835513, -2.509929, -3.336475, 1, 0.1843137, 0, 1,
-1.811186, -0.1464288, -2.508322, 1, 0.1921569, 0, 1,
-1.807205, -0.02767625, -1.185776, 1, 0.1960784, 0, 1,
-1.802011, -1.267285, -0.4074979, 1, 0.2039216, 0, 1,
-1.78115, 0.009647688, -1.703559, 1, 0.2117647, 0, 1,
-1.714076, -0.2691816, -1.26618, 1, 0.2156863, 0, 1,
-1.707103, -0.1753957, -1.532928, 1, 0.2235294, 0, 1,
-1.697106, -0.9297326, -0.8665891, 1, 0.227451, 0, 1,
-1.691522, 0.3484874, -1.258123, 1, 0.2352941, 0, 1,
-1.685693, -1.266469, -1.148549, 1, 0.2392157, 0, 1,
-1.681849, -0.4544715, -1.039159, 1, 0.2470588, 0, 1,
-1.655293, -0.4024829, -1.613355, 1, 0.2509804, 0, 1,
-1.65519, -2.39465, -4.315038, 1, 0.2588235, 0, 1,
-1.64866, -1.290219, -3.512611, 1, 0.2627451, 0, 1,
-1.643711, -0.265675, 0.1375318, 1, 0.2705882, 0, 1,
-1.641895, -2.055678, -2.302527, 1, 0.2745098, 0, 1,
-1.631144, -3.051573, -2.563216, 1, 0.282353, 0, 1,
-1.623611, -0.8524283, -3.305509, 1, 0.2862745, 0, 1,
-1.61963, -1.124402, -1.701777, 1, 0.2941177, 0, 1,
-1.616725, 1.506144, 0.02113625, 1, 0.3019608, 0, 1,
-1.59367, 0.2650629, -2.189509, 1, 0.3058824, 0, 1,
-1.592435, -1.276098, -0.3177813, 1, 0.3137255, 0, 1,
-1.59131, 1.269117, 0.1996173, 1, 0.3176471, 0, 1,
-1.590619, 2.611579, -0.3513004, 1, 0.3254902, 0, 1,
-1.566939, 0.4302128, -2.190716, 1, 0.3294118, 0, 1,
-1.537891, 1.5332, -1.203939, 1, 0.3372549, 0, 1,
-1.485676, 0.7819766, 0.2600253, 1, 0.3411765, 0, 1,
-1.48124, 0.5735339, 0.1999474, 1, 0.3490196, 0, 1,
-1.47823, 0.07249789, -0.6577299, 1, 0.3529412, 0, 1,
-1.474508, -0.7111395, -0.1302578, 1, 0.3607843, 0, 1,
-1.467055, -0.9664734, -2.092797, 1, 0.3647059, 0, 1,
-1.457696, -0.1164645, -1.238306, 1, 0.372549, 0, 1,
-1.457025, 1.078483, -2.359736, 1, 0.3764706, 0, 1,
-1.455989, 0.7524112, -1.638135, 1, 0.3843137, 0, 1,
-1.453957, 1.106581, 0.2667202, 1, 0.3882353, 0, 1,
-1.452341, 0.6367511, -0.4742241, 1, 0.3960784, 0, 1,
-1.444334, 0.5503757, -0.9396151, 1, 0.4039216, 0, 1,
-1.433082, -0.09594601, -2.40875, 1, 0.4078431, 0, 1,
-1.424221, 0.0626962, -2.92232, 1, 0.4156863, 0, 1,
-1.423245, -0.9666455, -1.251707, 1, 0.4196078, 0, 1,
-1.4205, -0.3575175, -0.8677086, 1, 0.427451, 0, 1,
-1.410591, 0.8657615, -0.2529196, 1, 0.4313726, 0, 1,
-1.409844, -0.3530889, -1.525698, 1, 0.4392157, 0, 1,
-1.403928, -1.282138, -2.770711, 1, 0.4431373, 0, 1,
-1.401176, 0.08462261, -0.1319301, 1, 0.4509804, 0, 1,
-1.3919, 0.8478605, -1.41721, 1, 0.454902, 0, 1,
-1.372193, 1.005283, -1.4822, 1, 0.4627451, 0, 1,
-1.369134, -2.069762, -2.361979, 1, 0.4666667, 0, 1,
-1.360758, 0.4932789, -2.038956, 1, 0.4745098, 0, 1,
-1.354933, 0.2118059, -0.1742143, 1, 0.4784314, 0, 1,
-1.353392, -1.067292, -2.513204, 1, 0.4862745, 0, 1,
-1.349728, -1.475202, -1.954828, 1, 0.4901961, 0, 1,
-1.346975, 0.3385652, -1.096986, 1, 0.4980392, 0, 1,
-1.328813, -0.6023895, -2.260895, 1, 0.5058824, 0, 1,
-1.32087, -2.021132, -3.755885, 1, 0.509804, 0, 1,
-1.319888, -0.07194334, -1.522289, 1, 0.5176471, 0, 1,
-1.319763, -0.5454993, -0.9780337, 1, 0.5215687, 0, 1,
-1.316147, 0.0682172, -3.517587, 1, 0.5294118, 0, 1,
-1.308802, 0.3959606, -0.8443474, 1, 0.5333334, 0, 1,
-1.306515, 2.097618, -0.06710748, 1, 0.5411765, 0, 1,
-1.30625, -0.9384589, -2.816658, 1, 0.5450981, 0, 1,
-1.299382, -1.05303, -0.6939279, 1, 0.5529412, 0, 1,
-1.295662, -2.755735, -3.450251, 1, 0.5568628, 0, 1,
-1.292821, 0.5808177, -1.662055, 1, 0.5647059, 0, 1,
-1.290326, 1.057488, -0.8147237, 1, 0.5686275, 0, 1,
-1.28452, 0.468408, -1.493674, 1, 0.5764706, 0, 1,
-1.282993, -0.5515954, -0.2451437, 1, 0.5803922, 0, 1,
-1.279505, 0.2857738, -2.72504, 1, 0.5882353, 0, 1,
-1.275349, 1.958272, 0.2215966, 1, 0.5921569, 0, 1,
-1.253277, -0.4803983, -2.310466, 1, 0.6, 0, 1,
-1.249509, -0.0381784, -1.936956, 1, 0.6078432, 0, 1,
-1.249406, -0.6283289, -1.562157, 1, 0.6117647, 0, 1,
-1.24443, 0.5975815, -3.700396, 1, 0.6196079, 0, 1,
-1.243552, -0.003343524, -0.9027922, 1, 0.6235294, 0, 1,
-1.240113, -0.3870789, -1.381619, 1, 0.6313726, 0, 1,
-1.226889, -0.3074133, -2.002038, 1, 0.6352941, 0, 1,
-1.222997, 0.6233824, -0.7173199, 1, 0.6431373, 0, 1,
-1.199374, 1.504648, -0.2725301, 1, 0.6470588, 0, 1,
-1.195031, -0.7127869, -3.518489, 1, 0.654902, 0, 1,
-1.189237, -1.893468, -2.602599, 1, 0.6588235, 0, 1,
-1.180494, -2.586262, -2.765733, 1, 0.6666667, 0, 1,
-1.174983, 0.361221, -3.41571, 1, 0.6705883, 0, 1,
-1.174651, 1.245608, -0.5956361, 1, 0.6784314, 0, 1,
-1.173659, -0.3004003, -1.850663, 1, 0.682353, 0, 1,
-1.171783, -0.6709872, -1.408952, 1, 0.6901961, 0, 1,
-1.169791, 0.1357847, 0.3726326, 1, 0.6941177, 0, 1,
-1.158448, -0.2868719, -2.762197, 1, 0.7019608, 0, 1,
-1.156799, -0.4257687, -2.840374, 1, 0.7098039, 0, 1,
-1.15064, 0.9984523, -0.771224, 1, 0.7137255, 0, 1,
-1.149876, -1.177194, -1.692862, 1, 0.7215686, 0, 1,
-1.148299, -1.319581, -2.201332, 1, 0.7254902, 0, 1,
-1.147442, 1.15939, 1.036821, 1, 0.7333333, 0, 1,
-1.136902, -1.717308, -1.745519, 1, 0.7372549, 0, 1,
-1.134188, 0.7314485, -1.197009, 1, 0.7450981, 0, 1,
-1.133882, 0.561218, -1.298658, 1, 0.7490196, 0, 1,
-1.125647, -0.5475503, -2.570469, 1, 0.7568628, 0, 1,
-1.118479, 0.07413532, 0.1004441, 1, 0.7607843, 0, 1,
-1.118113, 0.06608186, -1.020776, 1, 0.7686275, 0, 1,
-1.116702, 0.2344534, -2.311059, 1, 0.772549, 0, 1,
-1.112936, -2.826784, -2.35294, 1, 0.7803922, 0, 1,
-1.112377, -1.063633, -2.878115, 1, 0.7843137, 0, 1,
-1.101603, 1.122838, -0.2058276, 1, 0.7921569, 0, 1,
-1.101481, -0.3081395, -2.693467, 1, 0.7960784, 0, 1,
-1.10126, 0.7473094, -2.335613, 1, 0.8039216, 0, 1,
-1.101171, 0.8784899, -0.2633656, 1, 0.8117647, 0, 1,
-1.100096, -0.356061, -2.253262, 1, 0.8156863, 0, 1,
-1.090102, -0.9060583, -4.877805, 1, 0.8235294, 0, 1,
-1.085911, -0.4493395, -2.912757, 1, 0.827451, 0, 1,
-1.084585, -1.64474, -2.031231, 1, 0.8352941, 0, 1,
-1.083073, -1.021377, -3.637749, 1, 0.8392157, 0, 1,
-1.075862, -0.02711226, -2.694433, 1, 0.8470588, 0, 1,
-1.066326, 0.1628974, -0.283911, 1, 0.8509804, 0, 1,
-1.060692, -0.005133251, -2.371753, 1, 0.8588235, 0, 1,
-1.057338, 1.124414, -0.0706977, 1, 0.8627451, 0, 1,
-1.057202, 1.046919, -0.4364263, 1, 0.8705882, 0, 1,
-1.054659, 1.072399, 1.969766, 1, 0.8745098, 0, 1,
-1.053216, -0.7936451, -3.418057, 1, 0.8823529, 0, 1,
-1.052488, 0.5760685, -0.02148129, 1, 0.8862745, 0, 1,
-1.046011, -0.235578, -0.7465253, 1, 0.8941177, 0, 1,
-1.040605, -0.5195667, -3.050605, 1, 0.8980392, 0, 1,
-1.022368, -3.609631, -3.222117, 1, 0.9058824, 0, 1,
-1.016094, 0.7429152, -1.91808, 1, 0.9137255, 0, 1,
-1.014312, -0.02103538, -2.599714, 1, 0.9176471, 0, 1,
-1.011078, 0.6061612, -1.350273, 1, 0.9254902, 0, 1,
-1.01105, 1.039152, 0.2649437, 1, 0.9294118, 0, 1,
-1.00906, -0.04852151, -2.538769, 1, 0.9372549, 0, 1,
-1.006811, -1.194984, -2.868887, 1, 0.9411765, 0, 1,
-1.005674, 0.8375985, -2.551132, 1, 0.9490196, 0, 1,
-1.002881, -1.704537, -3.24531, 1, 0.9529412, 0, 1,
-1.000074, -0.1707613, -2.943315, 1, 0.9607843, 0, 1,
-1.00002, -0.9955564, -2.449219, 1, 0.9647059, 0, 1,
-0.9970086, -0.02152532, -3.169987, 1, 0.972549, 0, 1,
-0.9809266, 0.2450875, -2.401155, 1, 0.9764706, 0, 1,
-0.9774104, -0.4365393, -0.9584202, 1, 0.9843137, 0, 1,
-0.9752015, 1.231101, -0.9133115, 1, 0.9882353, 0, 1,
-0.9719881, 1.288306, 0.5706669, 1, 0.9960784, 0, 1,
-0.9642084, 2.311241, -2.68965, 0.9960784, 1, 0, 1,
-0.957589, 1.254053, -1.902108, 0.9921569, 1, 0, 1,
-0.9551033, -1.070797, -2.271404, 0.9843137, 1, 0, 1,
-0.9477258, 0.3225534, -1.410685, 0.9803922, 1, 0, 1,
-0.9417967, -1.28998, -2.983071, 0.972549, 1, 0, 1,
-0.9415264, 0.5019623, -1.098079, 0.9686275, 1, 0, 1,
-0.936312, 0.729188, 0.2421914, 0.9607843, 1, 0, 1,
-0.9302557, 0.6901538, 0.1824105, 0.9568627, 1, 0, 1,
-0.9297669, 0.5618551, -0.6625823, 0.9490196, 1, 0, 1,
-0.9284027, 0.9147071, 0.01091925, 0.945098, 1, 0, 1,
-0.9281402, 1.230462, -1.212916, 0.9372549, 1, 0, 1,
-0.9175026, 1.087756, -0.3848884, 0.9333333, 1, 0, 1,
-0.9159896, 0.05761641, -1.44092, 0.9254902, 1, 0, 1,
-0.9141434, -0.005224986, -1.573067, 0.9215686, 1, 0, 1,
-0.9139354, 1.175451, -0.5819971, 0.9137255, 1, 0, 1,
-0.9138049, 1.334086, -1.447499, 0.9098039, 1, 0, 1,
-0.9106991, 0.1995406, -0.2816639, 0.9019608, 1, 0, 1,
-0.9032094, 0.1564574, -0.06046342, 0.8941177, 1, 0, 1,
-0.9018506, 0.8574868, 0.2188623, 0.8901961, 1, 0, 1,
-0.888236, -0.01181115, -1.356321, 0.8823529, 1, 0, 1,
-0.8832697, 0.09311582, -0.33136, 0.8784314, 1, 0, 1,
-0.8820138, -1.590456, -2.497054, 0.8705882, 1, 0, 1,
-0.8811914, 1.095866, 0.0004638363, 0.8666667, 1, 0, 1,
-0.8811486, 0.3920721, -1.070848, 0.8588235, 1, 0, 1,
-0.8807594, 0.8723502, -3.099787, 0.854902, 1, 0, 1,
-0.8751024, -0.7935931, -3.662561, 0.8470588, 1, 0, 1,
-0.8750318, -0.3326471, -2.56881, 0.8431373, 1, 0, 1,
-0.8730747, 0.3143076, -0.03038848, 0.8352941, 1, 0, 1,
-0.8729367, -0.7343186, -2.146021, 0.8313726, 1, 0, 1,
-0.8689211, 0.8902551, -0.6686109, 0.8235294, 1, 0, 1,
-0.862734, -1.240348, -3.051932, 0.8196079, 1, 0, 1,
-0.8581552, 0.6864583, -2.382019, 0.8117647, 1, 0, 1,
-0.856994, 1.693631, -0.9521757, 0.8078431, 1, 0, 1,
-0.8540009, -1.240992, -2.082762, 0.8, 1, 0, 1,
-0.8479471, -0.05383941, -2.748991, 0.7921569, 1, 0, 1,
-0.8382903, 1.112289, -0.2524044, 0.7882353, 1, 0, 1,
-0.8378079, -0.8147644, -1.296327, 0.7803922, 1, 0, 1,
-0.8374908, -2.279963, -4.189607, 0.7764706, 1, 0, 1,
-0.8241941, -0.1658982, -2.057957, 0.7686275, 1, 0, 1,
-0.8235777, -1.15873, -3.319684, 0.7647059, 1, 0, 1,
-0.8227763, -0.1139652, -1.351594, 0.7568628, 1, 0, 1,
-0.8224562, 0.1149175, -1.764559, 0.7529412, 1, 0, 1,
-0.8215749, -1.532915, -3.584066, 0.7450981, 1, 0, 1,
-0.817416, -2.347946, -2.553431, 0.7411765, 1, 0, 1,
-0.8155328, -0.5010302, -2.580248, 0.7333333, 1, 0, 1,
-0.8035489, 0.2478428, -0.2003251, 0.7294118, 1, 0, 1,
-0.8011373, 0.4575615, -1.695022, 0.7215686, 1, 0, 1,
-0.7981851, 0.3183568, -2.451046, 0.7176471, 1, 0, 1,
-0.7970231, -0.2178164, -0.6821874, 0.7098039, 1, 0, 1,
-0.7933103, 0.2051307, -0.7411216, 0.7058824, 1, 0, 1,
-0.792108, -1.803654, -2.806797, 0.6980392, 1, 0, 1,
-0.7911884, -1.702428, -2.422837, 0.6901961, 1, 0, 1,
-0.7909563, 1.093012, 0.1880611, 0.6862745, 1, 0, 1,
-0.786073, 0.602088, 0.5725149, 0.6784314, 1, 0, 1,
-0.7837569, 0.7802949, -1.223553, 0.6745098, 1, 0, 1,
-0.7823752, 1.028828, -0.4391926, 0.6666667, 1, 0, 1,
-0.7787788, -0.1440464, -1.438407, 0.6627451, 1, 0, 1,
-0.7762057, -0.9140859, -2.21328, 0.654902, 1, 0, 1,
-0.7711368, 0.01453392, -1.99567, 0.6509804, 1, 0, 1,
-0.7573934, -0.2723872, -1.529126, 0.6431373, 1, 0, 1,
-0.7512705, 0.3278194, -0.9712232, 0.6392157, 1, 0, 1,
-0.7504421, 1.195744, -0.7309231, 0.6313726, 1, 0, 1,
-0.7473051, -1.284568, -1.963555, 0.627451, 1, 0, 1,
-0.7464556, -0.5439016, -1.512206, 0.6196079, 1, 0, 1,
-0.7454397, 0.8227208, -2.422504, 0.6156863, 1, 0, 1,
-0.7412013, -0.2627132, -2.677836, 0.6078432, 1, 0, 1,
-0.7343221, 0.5212036, -0.1682473, 0.6039216, 1, 0, 1,
-0.7284901, -0.6056663, -3.027551, 0.5960785, 1, 0, 1,
-0.7277515, 1.255873, -1.271555, 0.5882353, 1, 0, 1,
-0.7224804, 0.8193197, -0.1162935, 0.5843138, 1, 0, 1,
-0.71739, -0.2025444, -2.387105, 0.5764706, 1, 0, 1,
-0.7116882, 1.451326, -0.4747616, 0.572549, 1, 0, 1,
-0.711001, 0.3316457, -0.1935215, 0.5647059, 1, 0, 1,
-0.7095269, 0.3427134, 1.309062, 0.5607843, 1, 0, 1,
-0.7074584, 0.2413169, -3.57545, 0.5529412, 1, 0, 1,
-0.7069435, -0.5879959, -1.466665, 0.5490196, 1, 0, 1,
-0.7038465, -1.84068, -1.480182, 0.5411765, 1, 0, 1,
-0.7031582, 1.954855, 1.00831, 0.5372549, 1, 0, 1,
-0.7014009, 0.06546759, -1.048853, 0.5294118, 1, 0, 1,
-0.7009479, 2.000905, 0.5583642, 0.5254902, 1, 0, 1,
-0.6910549, 2.225857, -0.5555299, 0.5176471, 1, 0, 1,
-0.6906701, -0.1065214, -0.8501613, 0.5137255, 1, 0, 1,
-0.6826066, 0.007455967, -0.4011032, 0.5058824, 1, 0, 1,
-0.6796595, -0.323487, -3.668924, 0.5019608, 1, 0, 1,
-0.6746189, -0.812906, -2.402065, 0.4941176, 1, 0, 1,
-0.6728044, -1.489387, -3.055143, 0.4862745, 1, 0, 1,
-0.6725029, -1.333756, -2.4338, 0.4823529, 1, 0, 1,
-0.668753, -0.3034154, -1.482538, 0.4745098, 1, 0, 1,
-0.6655932, 1.584053, 0.1184694, 0.4705882, 1, 0, 1,
-0.6652025, 0.0244292, -2.805497, 0.4627451, 1, 0, 1,
-0.6621853, 0.2694457, 0.5512549, 0.4588235, 1, 0, 1,
-0.6604165, -1.253681, -4.942961, 0.4509804, 1, 0, 1,
-0.6568989, -0.07917012, -2.214326, 0.4470588, 1, 0, 1,
-0.6455194, 0.2699384, -0.7717428, 0.4392157, 1, 0, 1,
-0.6415564, -0.4398995, -0.6598054, 0.4352941, 1, 0, 1,
-0.6340325, 0.04998893, -1.302447, 0.427451, 1, 0, 1,
-0.6284021, -1.383617, -2.089102, 0.4235294, 1, 0, 1,
-0.6270224, 1.388937, -0.5228217, 0.4156863, 1, 0, 1,
-0.6169465, -0.4715212, -1.794465, 0.4117647, 1, 0, 1,
-0.6161878, -0.7717568, -1.025883, 0.4039216, 1, 0, 1,
-0.6160588, 0.273505, -0.8743304, 0.3960784, 1, 0, 1,
-0.612535, -0.4095219, -0.6367442, 0.3921569, 1, 0, 1,
-0.612225, 2.072696, -0.3169646, 0.3843137, 1, 0, 1,
-0.6099759, -0.6232414, -2.871876, 0.3803922, 1, 0, 1,
-0.6019542, -0.5024624, -2.675391, 0.372549, 1, 0, 1,
-0.5881599, 0.9617753, -1.590839, 0.3686275, 1, 0, 1,
-0.5827146, -0.1763881, -2.868878, 0.3607843, 1, 0, 1,
-0.5826467, -0.03408056, -3.164657, 0.3568628, 1, 0, 1,
-0.5808048, -0.2792942, -2.708852, 0.3490196, 1, 0, 1,
-0.5791423, -0.9622378, -0.5226296, 0.345098, 1, 0, 1,
-0.5696428, 0.3604943, -1.578328, 0.3372549, 1, 0, 1,
-0.5674162, -0.819891, -3.264519, 0.3333333, 1, 0, 1,
-0.5660793, -0.7493113, -2.874873, 0.3254902, 1, 0, 1,
-0.5617107, 0.304705, -1.313248, 0.3215686, 1, 0, 1,
-0.5605233, -0.3346891, -0.1296808, 0.3137255, 1, 0, 1,
-0.5598392, -1.158852, -1.113668, 0.3098039, 1, 0, 1,
-0.5589911, -0.9898942, -4.09254, 0.3019608, 1, 0, 1,
-0.5500861, -0.3039472, -1.815862, 0.2941177, 1, 0, 1,
-0.5472344, -1.473416, -2.060779, 0.2901961, 1, 0, 1,
-0.5461855, 0.8899825, 0.6552299, 0.282353, 1, 0, 1,
-0.5448188, 0.01952445, -1.606068, 0.2784314, 1, 0, 1,
-0.5387577, 1.066703, -0.5163484, 0.2705882, 1, 0, 1,
-0.5352709, -0.293826, -3.550503, 0.2666667, 1, 0, 1,
-0.5352113, -1.009889, -2.451812, 0.2588235, 1, 0, 1,
-0.5334201, 1.946853, -1.168712, 0.254902, 1, 0, 1,
-0.5324317, -0.6131649, -0.826602, 0.2470588, 1, 0, 1,
-0.5319756, 0.810892, 0.2133759, 0.2431373, 1, 0, 1,
-0.5255555, 0.2918261, -1.816618, 0.2352941, 1, 0, 1,
-0.5239066, -0.8253605, -3.621895, 0.2313726, 1, 0, 1,
-0.5237816, -1.145561, -1.937204, 0.2235294, 1, 0, 1,
-0.5197615, -0.558818, -2.356675, 0.2196078, 1, 0, 1,
-0.518991, 0.7766073, -0.05226583, 0.2117647, 1, 0, 1,
-0.5186779, -0.4960862, -2.062901, 0.2078431, 1, 0, 1,
-0.5177947, 2.243085, -0.2929964, 0.2, 1, 0, 1,
-0.5140295, -0.2736406, -2.874896, 0.1921569, 1, 0, 1,
-0.513142, 0.0338386, -2.421876, 0.1882353, 1, 0, 1,
-0.5115626, -0.2741382, -0.9857115, 0.1803922, 1, 0, 1,
-0.5100843, 0.4926405, -0.1236158, 0.1764706, 1, 0, 1,
-0.509605, -1.956341, -2.245231, 0.1686275, 1, 0, 1,
-0.5093794, 1.592782, -0.9633104, 0.1647059, 1, 0, 1,
-0.5081666, -0.4933473, -3.433247, 0.1568628, 1, 0, 1,
-0.506301, -0.9176217, -2.750638, 0.1529412, 1, 0, 1,
-0.5039622, 0.9309777, -2.447971, 0.145098, 1, 0, 1,
-0.4987183, -0.6722192, -3.690375, 0.1411765, 1, 0, 1,
-0.4912913, -2.268598, -2.756045, 0.1333333, 1, 0, 1,
-0.4906947, 0.682496, 0.04559674, 0.1294118, 1, 0, 1,
-0.4906819, -1.115376, -2.350605, 0.1215686, 1, 0, 1,
-0.4894201, 0.4298199, -1.237674, 0.1176471, 1, 0, 1,
-0.487527, -0.1049536, -1.071101, 0.1098039, 1, 0, 1,
-0.4848798, -1.951976, -2.900595, 0.1058824, 1, 0, 1,
-0.4842308, 0.2717403, -1.642366, 0.09803922, 1, 0, 1,
-0.4766283, 0.2821762, -0.5004242, 0.09019608, 1, 0, 1,
-0.4743699, -0.944637, -3.506739, 0.08627451, 1, 0, 1,
-0.4724079, -0.06860959, -0.9944932, 0.07843138, 1, 0, 1,
-0.4711353, -1.561814, -2.20221, 0.07450981, 1, 0, 1,
-0.4705862, -0.3513442, -3.475652, 0.06666667, 1, 0, 1,
-0.4645078, -0.4935854, -0.7875412, 0.0627451, 1, 0, 1,
-0.4639691, 0.2131671, -1.805392, 0.05490196, 1, 0, 1,
-0.4539537, -0.4666355, -1.230438, 0.05098039, 1, 0, 1,
-0.4536134, 1.385345, -0.1664317, 0.04313726, 1, 0, 1,
-0.4467334, 0.1698834, -2.561543, 0.03921569, 1, 0, 1,
-0.444027, -1.286976, -3.634514, 0.03137255, 1, 0, 1,
-0.4429722, -0.3037972, -1.794478, 0.02745098, 1, 0, 1,
-0.4415841, -0.2555975, -2.459075, 0.01960784, 1, 0, 1,
-0.433626, -0.5370984, -3.355365, 0.01568628, 1, 0, 1,
-0.427901, 0.1240876, -2.087378, 0.007843138, 1, 0, 1,
-0.4276894, -1.292462, -2.939916, 0.003921569, 1, 0, 1,
-0.4234583, -0.705986, -3.73566, 0, 1, 0.003921569, 1,
-0.4232186, -0.3451379, -2.191657, 0, 1, 0.01176471, 1,
-0.4223889, 0.1152575, -0.4734291, 0, 1, 0.01568628, 1,
-0.4140616, 2.703192, -1.054419, 0, 1, 0.02352941, 1,
-0.4093447, 0.5380216, 0.7759096, 0, 1, 0.02745098, 1,
-0.4084681, 0.720538, -1.60518, 0, 1, 0.03529412, 1,
-0.4078842, -0.2139996, -2.670109, 0, 1, 0.03921569, 1,
-0.4035326, -0.1934582, -3.775466, 0, 1, 0.04705882, 1,
-0.4017847, -0.3438853, -1.000281, 0, 1, 0.05098039, 1,
-0.4013402, -1.37105, -2.734823, 0, 1, 0.05882353, 1,
-0.3915966, 0.5374607, -0.7540305, 0, 1, 0.0627451, 1,
-0.390825, -1.632642, -3.770458, 0, 1, 0.07058824, 1,
-0.3887803, 0.5100337, -1.182876, 0, 1, 0.07450981, 1,
-0.3885569, 0.818493, -1.508287, 0, 1, 0.08235294, 1,
-0.3851294, -1.224114, -3.247638, 0, 1, 0.08627451, 1,
-0.3820888, -0.2759148, -1.376459, 0, 1, 0.09411765, 1,
-0.380178, -0.4919714, -2.207412, 0, 1, 0.1019608, 1,
-0.3784473, 0.8394636, -0.986858, 0, 1, 0.1058824, 1,
-0.3766383, -0.259352, -0.6462353, 0, 1, 0.1137255, 1,
-0.374148, 1.110842, 0.5271195, 0, 1, 0.1176471, 1,
-0.3696601, 0.8852744, -1.416041, 0, 1, 0.1254902, 1,
-0.3655637, 1.725946, 1.064972, 0, 1, 0.1294118, 1,
-0.3641601, 0.4357035, -0.9309276, 0, 1, 0.1372549, 1,
-0.3636105, -1.077467, -5.007493, 0, 1, 0.1411765, 1,
-0.3635132, 0.2100538, -2.332302, 0, 1, 0.1490196, 1,
-0.3601418, 0.3883765, -0.4477933, 0, 1, 0.1529412, 1,
-0.3568252, 1.18041, -0.8916208, 0, 1, 0.1607843, 1,
-0.3545717, 0.03210663, -2.397716, 0, 1, 0.1647059, 1,
-0.3508298, -0.0453578, -0.7027311, 0, 1, 0.172549, 1,
-0.3488098, 1.460128, 0.9205692, 0, 1, 0.1764706, 1,
-0.34874, -0.3628944, -2.596022, 0, 1, 0.1843137, 1,
-0.3473839, 0.2805191, -1.346957, 0, 1, 0.1882353, 1,
-0.345304, 1.027721, -1.037696, 0, 1, 0.1960784, 1,
-0.3451118, -1.75189, -1.978883, 0, 1, 0.2039216, 1,
-0.3378148, -0.08841743, -2.356265, 0, 1, 0.2078431, 1,
-0.3375811, 0.01252249, -1.702073, 0, 1, 0.2156863, 1,
-0.3374583, -0.4048959, -1.115541, 0, 1, 0.2196078, 1,
-0.336696, -1.292739, -1.445423, 0, 1, 0.227451, 1,
-0.3349507, 2.961949, 0.7198161, 0, 1, 0.2313726, 1,
-0.3339543, -2.05199, -2.19741, 0, 1, 0.2392157, 1,
-0.3323646, 0.288621, -2.209218, 0, 1, 0.2431373, 1,
-0.3304606, 0.04227759, -0.3319356, 0, 1, 0.2509804, 1,
-0.3276607, -1.044031, -4.144258, 0, 1, 0.254902, 1,
-0.325592, 0.9801369, 0.1184288, 0, 1, 0.2627451, 1,
-0.3253404, 1.537327, -0.1004016, 0, 1, 0.2666667, 1,
-0.3233086, 0.9945234, -1.680587, 0, 1, 0.2745098, 1,
-0.32154, 0.1428309, -0.2607977, 0, 1, 0.2784314, 1,
-0.3183457, -0.8828194, -2.687644, 0, 1, 0.2862745, 1,
-0.3180386, -0.1422961, 0.487034, 0, 1, 0.2901961, 1,
-0.3161608, -1.453542, -1.95579, 0, 1, 0.2980392, 1,
-0.3153472, 0.3451456, -2.788291, 0, 1, 0.3058824, 1,
-0.3121753, 0.4011026, -0.5422593, 0, 1, 0.3098039, 1,
-0.3121636, 1.968599, 1.035349, 0, 1, 0.3176471, 1,
-0.309709, 3.273647, -1.307072, 0, 1, 0.3215686, 1,
-0.3083304, -0.791849, -3.167423, 0, 1, 0.3294118, 1,
-0.3029733, 1.169113, -0.2766235, 0, 1, 0.3333333, 1,
-0.2993106, 0.6566899, 0.3613963, 0, 1, 0.3411765, 1,
-0.2907654, 0.848394, -0.8937003, 0, 1, 0.345098, 1,
-0.2877413, -1.569999, -2.582991, 0, 1, 0.3529412, 1,
-0.2852639, 0.6310037, 0.8672373, 0, 1, 0.3568628, 1,
-0.2846158, 0.795583, -1.359024, 0, 1, 0.3647059, 1,
-0.2804815, -1.100857, -2.692263, 0, 1, 0.3686275, 1,
-0.2767228, -0.9809332, -3.485152, 0, 1, 0.3764706, 1,
-0.2760175, -0.5594516, -1.946922, 0, 1, 0.3803922, 1,
-0.2679956, -0.3423419, -3.629865, 0, 1, 0.3882353, 1,
-0.2653695, 1.27069, -0.1495724, 0, 1, 0.3921569, 1,
-0.2638989, 0.625407, -2.045685, 0, 1, 0.4, 1,
-0.2615171, -1.222474, -3.099438, 0, 1, 0.4078431, 1,
-0.2582925, -0.3262361, -0.9456791, 0, 1, 0.4117647, 1,
-0.2563949, -2.438966, -2.211155, 0, 1, 0.4196078, 1,
-0.2536974, 0.2287284, 0.122247, 0, 1, 0.4235294, 1,
-0.2514421, -0.3147504, -3.712417, 0, 1, 0.4313726, 1,
-0.2506656, -0.2183219, -2.563767, 0, 1, 0.4352941, 1,
-0.2437011, -1.209724, -3.861867, 0, 1, 0.4431373, 1,
-0.24043, -0.1503214, -1.690807, 0, 1, 0.4470588, 1,
-0.2381837, -0.3819749, -2.901705, 0, 1, 0.454902, 1,
-0.236807, -1.114175, -3.681478, 0, 1, 0.4588235, 1,
-0.2353177, 1.207849, 1.539677, 0, 1, 0.4666667, 1,
-0.2348176, -0.7141927, -1.32328, 0, 1, 0.4705882, 1,
-0.2338948, 0.234225, -1.482264, 0, 1, 0.4784314, 1,
-0.2324948, 2.628094, 0.5297928, 0, 1, 0.4823529, 1,
-0.2313927, -0.5691989, -3.236268, 0, 1, 0.4901961, 1,
-0.2272044, 0.5402294, -0.2530882, 0, 1, 0.4941176, 1,
-0.2265111, -0.6718335, -3.453614, 0, 1, 0.5019608, 1,
-0.2206593, -1.142578, -1.949362, 0, 1, 0.509804, 1,
-0.2171065, -0.7205359, -4.424501, 0, 1, 0.5137255, 1,
-0.2164613, -1.539398, -1.656398, 0, 1, 0.5215687, 1,
-0.2163891, -0.7210726, -3.226084, 0, 1, 0.5254902, 1,
-0.2141424, 1.069559, 1.555812, 0, 1, 0.5333334, 1,
-0.2080535, -1.292699, -2.591198, 0, 1, 0.5372549, 1,
-0.2012811, -0.8084504, -3.180861, 0, 1, 0.5450981, 1,
-0.1996256, 0.7090005, -0.7690713, 0, 1, 0.5490196, 1,
-0.1991078, -3.068609, -3.724656, 0, 1, 0.5568628, 1,
-0.1981685, -1.901264, -4.271255, 0, 1, 0.5607843, 1,
-0.1969968, 1.551767, -0.005912328, 0, 1, 0.5686275, 1,
-0.1968571, 0.6102962, -1.675108, 0, 1, 0.572549, 1,
-0.1933255, 1.33242, 0.5388299, 0, 1, 0.5803922, 1,
-0.1900158, -0.2972926, -2.891841, 0, 1, 0.5843138, 1,
-0.1851534, 0.7480171, -1.744128, 0, 1, 0.5921569, 1,
-0.1835118, -0.9648311, -1.76537, 0, 1, 0.5960785, 1,
-0.1817613, -0.2734583, -1.404051, 0, 1, 0.6039216, 1,
-0.1800556, 0.3819664, -0.8781508, 0, 1, 0.6117647, 1,
-0.1749131, -0.9710482, -5.466969, 0, 1, 0.6156863, 1,
-0.1734679, -0.5983536, -2.834198, 0, 1, 0.6235294, 1,
-0.1682865, 0.4818394, -0.3695359, 0, 1, 0.627451, 1,
-0.1635909, -0.09489079, -1.538002, 0, 1, 0.6352941, 1,
-0.1585716, -0.9665483, -3.257192, 0, 1, 0.6392157, 1,
-0.1545143, -1.666869, -2.931492, 0, 1, 0.6470588, 1,
-0.1527539, 0.7814137, -1.386099, 0, 1, 0.6509804, 1,
-0.1516614, 1.381057, -0.1238768, 0, 1, 0.6588235, 1,
-0.1481038, -0.9819655, -0.8789406, 0, 1, 0.6627451, 1,
-0.1473375, 0.2797112, -0.2745954, 0, 1, 0.6705883, 1,
-0.138178, 0.1822687, -1.002069, 0, 1, 0.6745098, 1,
-0.1303544, -1.001341, -2.583222, 0, 1, 0.682353, 1,
-0.1202206, -0.6571933, -2.872524, 0, 1, 0.6862745, 1,
-0.1197496, -0.04304368, -2.691194, 0, 1, 0.6941177, 1,
-0.1157126, -1.066053, -2.839529, 0, 1, 0.7019608, 1,
-0.1104746, 0.4487567, 1.086068, 0, 1, 0.7058824, 1,
-0.1060483, -1.243294, -2.836027, 0, 1, 0.7137255, 1,
-0.1059165, -0.4724671, -3.606532, 0, 1, 0.7176471, 1,
-0.1050124, 0.5872974, 0.4694756, 0, 1, 0.7254902, 1,
-0.1016107, 2.623112, -0.03569343, 0, 1, 0.7294118, 1,
-0.1007771, -0.9222611, -2.916764, 0, 1, 0.7372549, 1,
-0.09914377, 0.6060641, 0.478774, 0, 1, 0.7411765, 1,
-0.09908194, -0.2196495, -2.992619, 0, 1, 0.7490196, 1,
-0.09866617, -0.5872636, -1.735318, 0, 1, 0.7529412, 1,
-0.09535527, 1.562283, -0.514043, 0, 1, 0.7607843, 1,
-0.09510668, 0.2023057, -0.8367258, 0, 1, 0.7647059, 1,
-0.09306996, 0.2652689, -1.906096, 0, 1, 0.772549, 1,
-0.09218409, -0.4383824, -2.088839, 0, 1, 0.7764706, 1,
-0.08928517, -0.6070423, -2.383102, 0, 1, 0.7843137, 1,
-0.08864135, 0.4760456, -0.06832428, 0, 1, 0.7882353, 1,
-0.08822571, -0.5505849, -2.757501, 0, 1, 0.7960784, 1,
-0.08552727, 0.2910271, -1.188751, 0, 1, 0.8039216, 1,
-0.08395782, -0.3619929, -1.997363, 0, 1, 0.8078431, 1,
-0.08330292, -0.4406559, -3.998888, 0, 1, 0.8156863, 1,
-0.07610388, -0.362869, -2.447244, 0, 1, 0.8196079, 1,
-0.0756171, -0.09477206, -1.209398, 0, 1, 0.827451, 1,
-0.07475721, 0.06444133, -2.255176, 0, 1, 0.8313726, 1,
-0.0737462, 0.1325192, 0.08783574, 0, 1, 0.8392157, 1,
-0.07026721, -0.02919323, -1.663966, 0, 1, 0.8431373, 1,
-0.07002168, -0.7770497, -2.172218, 0, 1, 0.8509804, 1,
-0.06933716, 0.4718601, -0.1766744, 0, 1, 0.854902, 1,
-0.06886696, -0.6509336, -3.611818, 0, 1, 0.8627451, 1,
-0.06748962, -1.097985, -2.066493, 0, 1, 0.8666667, 1,
-0.05907924, -0.0462511, -1.55614, 0, 1, 0.8745098, 1,
-0.05893564, 0.2245105, -0.3832772, 0, 1, 0.8784314, 1,
-0.05870985, -0.5193025, -3.567178, 0, 1, 0.8862745, 1,
-0.05736827, 0.4267323, 0.440136, 0, 1, 0.8901961, 1,
-0.05356723, 1.43289, 0.6506566, 0, 1, 0.8980392, 1,
-0.05073937, -0.220617, -3.190017, 0, 1, 0.9058824, 1,
-0.05043241, -0.5243688, -3.074767, 0, 1, 0.9098039, 1,
-0.04948816, 0.9031423, 1.809842, 0, 1, 0.9176471, 1,
-0.04131223, -0.9188555, -2.073254, 0, 1, 0.9215686, 1,
-0.03862783, 1.282901, 0.2073134, 0, 1, 0.9294118, 1,
-0.03713193, 0.1056947, -0.5646737, 0, 1, 0.9333333, 1,
-0.02675385, 2.477206, 1.221223, 0, 1, 0.9411765, 1,
-0.02082973, -0.7099802, -2.992959, 0, 1, 0.945098, 1,
-0.01945619, -0.6195445, -4.447961, 0, 1, 0.9529412, 1,
-0.01790926, 0.8028168, -0.2418009, 0, 1, 0.9568627, 1,
-0.0170594, -2.075579, -2.967012, 0, 1, 0.9647059, 1,
-0.008544087, 1.627178, -0.8787684, 0, 1, 0.9686275, 1,
-0.007059315, -1.239516, -2.588663, 0, 1, 0.9764706, 1,
-0.004102787, -0.8196685, -5.410245, 0, 1, 0.9803922, 1,
-0.003485778, 1.535717, -0.2715284, 0, 1, 0.9882353, 1,
-0.003187185, 1.157667, 1.075101, 0, 1, 0.9921569, 1,
0.0003527309, -1.906722, 3.047742, 0, 1, 1, 1,
0.002404805, -0.6353824, 4.102901, 0, 0.9921569, 1, 1,
0.00388277, 0.009788496, 0.4902361, 0, 0.9882353, 1, 1,
0.006973451, -0.9317394, 3.488517, 0, 0.9803922, 1, 1,
0.009054868, -0.2417715, 2.892404, 0, 0.9764706, 1, 1,
0.01006837, -0.7706929, 2.967775, 0, 0.9686275, 1, 1,
0.0140441, -0.02835474, 1.957863, 0, 0.9647059, 1, 1,
0.01754288, 0.3601165, 0.1202539, 0, 0.9568627, 1, 1,
0.01849752, 0.302732, 0.1212525, 0, 0.9529412, 1, 1,
0.01900102, -0.4780367, 5.077897, 0, 0.945098, 1, 1,
0.0201915, 1.178948, -0.1551459, 0, 0.9411765, 1, 1,
0.02427404, -0.0153362, 0.907663, 0, 0.9333333, 1, 1,
0.02502237, 1.120767, 0.2549926, 0, 0.9294118, 1, 1,
0.03081718, -0.1997707, 2.806341, 0, 0.9215686, 1, 1,
0.0310112, 1.735297, 1.180966, 0, 0.9176471, 1, 1,
0.03165776, -1.400577, 1.84932, 0, 0.9098039, 1, 1,
0.03482663, -0.1195215, 5.225425, 0, 0.9058824, 1, 1,
0.04097575, -0.6329034, 2.929023, 0, 0.8980392, 1, 1,
0.04236663, 1.838341, 0.6149703, 0, 0.8901961, 1, 1,
0.04525287, -0.5406979, 2.341754, 0, 0.8862745, 1, 1,
0.04657038, 1.102601, -0.08469051, 0, 0.8784314, 1, 1,
0.04664706, 0.7196743, 0.4715765, 0, 0.8745098, 1, 1,
0.05286263, -0.1487535, 2.262043, 0, 0.8666667, 1, 1,
0.05890607, 1.322337, -1.333944, 0, 0.8627451, 1, 1,
0.05932623, 0.8581082, 0.1807768, 0, 0.854902, 1, 1,
0.06048296, -0.9836684, 2.732539, 0, 0.8509804, 1, 1,
0.06076725, 0.648762, 0.2071488, 0, 0.8431373, 1, 1,
0.06086411, -1.3532, 3.35765, 0, 0.8392157, 1, 1,
0.06175401, -0.2339419, 3.976353, 0, 0.8313726, 1, 1,
0.06494325, 1.306541, -0.4103411, 0, 0.827451, 1, 1,
0.06651261, 0.223857, 0.9508586, 0, 0.8196079, 1, 1,
0.06968648, 0.9146299, -0.5440222, 0, 0.8156863, 1, 1,
0.07056007, -0.8835855, 4.315115, 0, 0.8078431, 1, 1,
0.07533515, 0.08903681, 1.279779, 0, 0.8039216, 1, 1,
0.07644232, 0.8661774, 1.135064, 0, 0.7960784, 1, 1,
0.07957289, 0.4874005, -0.9097033, 0, 0.7882353, 1, 1,
0.0899331, -0.481268, 1.500952, 0, 0.7843137, 1, 1,
0.0911148, -1.125125, 4.592567, 0, 0.7764706, 1, 1,
0.09461484, 1.485078, -0.5937096, 0, 0.772549, 1, 1,
0.09463602, 0.7652352, 1.709193, 0, 0.7647059, 1, 1,
0.09632067, -1.086008, 3.641139, 0, 0.7607843, 1, 1,
0.09713241, 0.167385, 0.7912632, 0, 0.7529412, 1, 1,
0.09813965, -0.6049559, 2.551303, 0, 0.7490196, 1, 1,
0.1015429, -0.5543657, 3.354011, 0, 0.7411765, 1, 1,
0.1046276, -0.6116067, 2.471054, 0, 0.7372549, 1, 1,
0.1074897, -1.986789, 3.37096, 0, 0.7294118, 1, 1,
0.1099333, 0.06389207, 1.505758, 0, 0.7254902, 1, 1,
0.1155072, -0.1227951, 2.68242, 0, 0.7176471, 1, 1,
0.1198103, -2.54188, 3.029066, 0, 0.7137255, 1, 1,
0.1215586, 0.7123076, 1.285882, 0, 0.7058824, 1, 1,
0.1218485, 1.634832, 1.153388, 0, 0.6980392, 1, 1,
0.1285256, -1.181207, 1.477281, 0, 0.6941177, 1, 1,
0.1304574, 0.512746, 1.284553, 0, 0.6862745, 1, 1,
0.1310552, 0.8275551, 0.6076677, 0, 0.682353, 1, 1,
0.1349221, 0.5044004, 0.8594372, 0, 0.6745098, 1, 1,
0.137401, 1.407111, -0.4150135, 0, 0.6705883, 1, 1,
0.1382341, 0.2213395, 1.282613, 0, 0.6627451, 1, 1,
0.1396575, 1.30965, -1.097641, 0, 0.6588235, 1, 1,
0.1421555, -0.05105454, 1.715644, 0, 0.6509804, 1, 1,
0.146758, -2.028823, 5.059626, 0, 0.6470588, 1, 1,
0.1481335, -0.2277782, 4.256439, 0, 0.6392157, 1, 1,
0.1504937, -1.053488, 3.067398, 0, 0.6352941, 1, 1,
0.1607247, -2.418241, 3.543719, 0, 0.627451, 1, 1,
0.1608166, 0.4795162, 0.4664302, 0, 0.6235294, 1, 1,
0.1672411, 0.0613499, 1.588435, 0, 0.6156863, 1, 1,
0.1700474, 0.2161492, -0.6276711, 0, 0.6117647, 1, 1,
0.1700706, -0.7661822, 3.113065, 0, 0.6039216, 1, 1,
0.1708596, -1.269683, 1.562078, 0, 0.5960785, 1, 1,
0.1721586, 1.403957, 1.024462, 0, 0.5921569, 1, 1,
0.1762448, -0.5389088, 3.26724, 0, 0.5843138, 1, 1,
0.1775113, -0.05123026, 2.14086, 0, 0.5803922, 1, 1,
0.1789211, -0.4399022, 5.269973, 0, 0.572549, 1, 1,
0.1795417, -0.6966279, 3.834074, 0, 0.5686275, 1, 1,
0.1820044, 0.8719189, 0.7039792, 0, 0.5607843, 1, 1,
0.1840308, -0.1510282, 1.663062, 0, 0.5568628, 1, 1,
0.1866583, -0.244998, 3.501064, 0, 0.5490196, 1, 1,
0.1874044, 0.4809508, 2.482813, 0, 0.5450981, 1, 1,
0.1886049, -1.13385, 2.751386, 0, 0.5372549, 1, 1,
0.189825, 1.158543, -0.07810017, 0, 0.5333334, 1, 1,
0.1911031, 0.5653078, 0.2251119, 0, 0.5254902, 1, 1,
0.1948131, 0.6801375, 0.2849882, 0, 0.5215687, 1, 1,
0.1948762, -1.027077, 3.74714, 0, 0.5137255, 1, 1,
0.1977141, 1.172862, -1.347071, 0, 0.509804, 1, 1,
0.2008101, 1.044363, -0.6671264, 0, 0.5019608, 1, 1,
0.2062809, 0.06175478, 1.105624, 0, 0.4941176, 1, 1,
0.2067928, 0.9172401, -0.6404797, 0, 0.4901961, 1, 1,
0.2068468, 0.766202, 1.467647, 0, 0.4823529, 1, 1,
0.2086372, -0.4034244, 2.626922, 0, 0.4784314, 1, 1,
0.2169446, 0.8058063, -0.7146047, 0, 0.4705882, 1, 1,
0.231287, 0.4702271, 1.167445, 0, 0.4666667, 1, 1,
0.2341181, -0.7104703, 2.455239, 0, 0.4588235, 1, 1,
0.2354385, -0.1991236, 3.694445, 0, 0.454902, 1, 1,
0.2366938, 0.4583389, 1.864089, 0, 0.4470588, 1, 1,
0.2433, -0.02620371, 1.847707, 0, 0.4431373, 1, 1,
0.2439595, 0.2875458, 1.872548, 0, 0.4352941, 1, 1,
0.2442922, 0.56738, -0.2401995, 0, 0.4313726, 1, 1,
0.2461908, 0.6738778, 0.8798457, 0, 0.4235294, 1, 1,
0.2466753, -0.6471425, 2.046294, 0, 0.4196078, 1, 1,
0.2472666, -0.853866, 1.933293, 0, 0.4117647, 1, 1,
0.2473348, 0.5683089, 0.01879942, 0, 0.4078431, 1, 1,
0.2494787, 1.26213, 0.5342558, 0, 0.4, 1, 1,
0.2583109, -1.034817, 3.821008, 0, 0.3921569, 1, 1,
0.2632523, 0.07641351, 1.629154, 0, 0.3882353, 1, 1,
0.2652709, 0.1259523, 2.273438, 0, 0.3803922, 1, 1,
0.2691672, -0.2977999, 1.982618, 0, 0.3764706, 1, 1,
0.2713922, -0.8512235, 2.245536, 0, 0.3686275, 1, 1,
0.2755312, 0.09284353, -0.3339726, 0, 0.3647059, 1, 1,
0.2755386, 0.277012, 1.170137, 0, 0.3568628, 1, 1,
0.2834563, 0.9450846, 0.1720857, 0, 0.3529412, 1, 1,
0.2850778, -0.2219242, 4.595658, 0, 0.345098, 1, 1,
0.2851574, 0.1882363, 0.261766, 0, 0.3411765, 1, 1,
0.2984298, 1.954533, 0.2336349, 0, 0.3333333, 1, 1,
0.2985384, -0.5856677, 2.663391, 0, 0.3294118, 1, 1,
0.3014939, 1.860595, 0.8465713, 0, 0.3215686, 1, 1,
0.3044257, -1.417892, 2.369828, 0, 0.3176471, 1, 1,
0.3048494, 0.2029749, 1.959101, 0, 0.3098039, 1, 1,
0.30523, 0.2425843, -0.5507851, 0, 0.3058824, 1, 1,
0.3086522, 1.67142, 1.459575, 0, 0.2980392, 1, 1,
0.310241, -0.7772986, 0.7850261, 0, 0.2901961, 1, 1,
0.3110017, 0.5201976, 1.145982, 0, 0.2862745, 1, 1,
0.3126652, 0.6135054, -1.162154, 0, 0.2784314, 1, 1,
0.3131434, 0.8615693, 0.6372749, 0, 0.2745098, 1, 1,
0.3154154, 0.8055925, 1.251961, 0, 0.2666667, 1, 1,
0.3156755, 0.802694, 1.039554, 0, 0.2627451, 1, 1,
0.3214031, 0.9073731, -0.4121651, 0, 0.254902, 1, 1,
0.3222022, 1.162043, 0.2519599, 0, 0.2509804, 1, 1,
0.3222196, -0.3007266, 3.07219, 0, 0.2431373, 1, 1,
0.3239242, -0.6247774, 2.171468, 0, 0.2392157, 1, 1,
0.3276879, -0.95323, 1.827422, 0, 0.2313726, 1, 1,
0.3288988, 1.167588, -0.6547317, 0, 0.227451, 1, 1,
0.3368767, -0.4073225, 1.724688, 0, 0.2196078, 1, 1,
0.3382976, -0.2225093, 1.923739, 0, 0.2156863, 1, 1,
0.338677, 0.1612745, 0.8712128, 0, 0.2078431, 1, 1,
0.3392726, -1.131631, 3.825542, 0, 0.2039216, 1, 1,
0.3393691, -1.865518, 3.884105, 0, 0.1960784, 1, 1,
0.3424879, -0.7727777, 2.788634, 0, 0.1882353, 1, 1,
0.3429716, 0.3373365, -0.8250337, 0, 0.1843137, 1, 1,
0.3430102, 1.773354, -1.993847, 0, 0.1764706, 1, 1,
0.343846, -0.7881197, 4.412283, 0, 0.172549, 1, 1,
0.3443721, -0.4025305, 2.787258, 0, 0.1647059, 1, 1,
0.3474791, -1.939297, 0.9029332, 0, 0.1607843, 1, 1,
0.3485841, -0.1741606, 1.636706, 0, 0.1529412, 1, 1,
0.3572918, 0.01928764, 1.659685, 0, 0.1490196, 1, 1,
0.3600411, 0.1953066, 1.34724, 0, 0.1411765, 1, 1,
0.3729438, -1.991268, 3.246409, 0, 0.1372549, 1, 1,
0.3742688, -1.476434, 3.600773, 0, 0.1294118, 1, 1,
0.3822984, 0.2656296, 0.2495891, 0, 0.1254902, 1, 1,
0.3850407, -0.5351654, 2.395112, 0, 0.1176471, 1, 1,
0.3853146, 0.8745943, 0.2745266, 0, 0.1137255, 1, 1,
0.3898137, -0.896697, 3.979275, 0, 0.1058824, 1, 1,
0.3945281, -1.528162, 2.557627, 0, 0.09803922, 1, 1,
0.3960713, -0.8512989, 1.238083, 0, 0.09411765, 1, 1,
0.3961411, -0.1809464, 3.629538, 0, 0.08627451, 1, 1,
0.3980276, -0.2073691, 3.870132, 0, 0.08235294, 1, 1,
0.4050742, -0.8955562, 1.71188, 0, 0.07450981, 1, 1,
0.4064606, 1.544349, 0.5721222, 0, 0.07058824, 1, 1,
0.4092861, -0.5994135, 3.206291, 0, 0.0627451, 1, 1,
0.4113386, -0.6726702, 3.367445, 0, 0.05882353, 1, 1,
0.4114023, 0.2453879, -0.1191498, 0, 0.05098039, 1, 1,
0.4120504, 0.3329305, 1.552247, 0, 0.04705882, 1, 1,
0.4163431, 2.056401, -0.9939945, 0, 0.03921569, 1, 1,
0.4171364, 0.1145414, 1.785375, 0, 0.03529412, 1, 1,
0.4184847, 0.5309066, 1.876294, 0, 0.02745098, 1, 1,
0.420297, -0.5900208, 1.559393, 0, 0.02352941, 1, 1,
0.4216555, -0.4263852, 3.262613, 0, 0.01568628, 1, 1,
0.4229402, 1.555381, -0.9120659, 0, 0.01176471, 1, 1,
0.4266899, 0.2303479, 0.8629296, 0, 0.003921569, 1, 1,
0.4292793, -0.9075994, 4.312145, 0.003921569, 0, 1, 1,
0.4299226, -0.3429981, 4.568262, 0.007843138, 0, 1, 1,
0.4305474, 0.4729064, 1.020391, 0.01568628, 0, 1, 1,
0.4322386, -0.1939219, 2.168262, 0.01960784, 0, 1, 1,
0.4357097, -0.1269079, 3.103814, 0.02745098, 0, 1, 1,
0.4417141, -0.5457435, 1.859323, 0.03137255, 0, 1, 1,
0.4447263, 1.154808, 1.85734, 0.03921569, 0, 1, 1,
0.4482205, -0.209016, 3.295422, 0.04313726, 0, 1, 1,
0.4543509, 0.3066827, 1.714333, 0.05098039, 0, 1, 1,
0.4547091, -0.1157594, 2.935197, 0.05490196, 0, 1, 1,
0.4565068, 0.9555367, -0.05581934, 0.0627451, 0, 1, 1,
0.4569679, 0.697664, -0.9073204, 0.06666667, 0, 1, 1,
0.4601965, -1.743096, 3.311706, 0.07450981, 0, 1, 1,
0.4610808, -1.221491, 2.597373, 0.07843138, 0, 1, 1,
0.466666, -0.6656818, 3.073048, 0.08627451, 0, 1, 1,
0.469279, 0.3482312, -0.1361177, 0.09019608, 0, 1, 1,
0.4708063, -0.9711758, 1.463716, 0.09803922, 0, 1, 1,
0.4713146, -0.602159, 1.586682, 0.1058824, 0, 1, 1,
0.4725261, -0.05346857, 2.260846, 0.1098039, 0, 1, 1,
0.4746451, -0.197483, 1.703657, 0.1176471, 0, 1, 1,
0.4772278, 0.2282094, 1.149252, 0.1215686, 0, 1, 1,
0.4799252, 0.8333905, 0.1506234, 0.1294118, 0, 1, 1,
0.480275, -0.6268771, 1.074012, 0.1333333, 0, 1, 1,
0.4806398, 1.528821, 0.09322293, 0.1411765, 0, 1, 1,
0.4852534, -1.077158, 2.042706, 0.145098, 0, 1, 1,
0.4855722, 0.7535455, 0.2384191, 0.1529412, 0, 1, 1,
0.485943, 0.1328973, 2.577061, 0.1568628, 0, 1, 1,
0.4864344, 0.3376244, 1.817881, 0.1647059, 0, 1, 1,
0.4932907, 1.241155, 0.691934, 0.1686275, 0, 1, 1,
0.497189, -0.581738, 1.384547, 0.1764706, 0, 1, 1,
0.4984276, -0.7443183, 3.799568, 0.1803922, 0, 1, 1,
0.5008758, -1.007364, 3.81547, 0.1882353, 0, 1, 1,
0.5056198, 0.2802472, 1.158303, 0.1921569, 0, 1, 1,
0.5088402, 0.6668023, 0.4142159, 0.2, 0, 1, 1,
0.5096649, 0.4119467, -1.615794, 0.2078431, 0, 1, 1,
0.5129716, 0.06659738, 0.217491, 0.2117647, 0, 1, 1,
0.5132809, -0.6495154, 2.54132, 0.2196078, 0, 1, 1,
0.5138758, -0.2316798, 1.389438, 0.2235294, 0, 1, 1,
0.5147522, -1.439429, 2.294731, 0.2313726, 0, 1, 1,
0.5171097, 0.9134452, -0.6632857, 0.2352941, 0, 1, 1,
0.5184251, 1.485518, 1.476307, 0.2431373, 0, 1, 1,
0.5222554, -0.4825176, 2.340213, 0.2470588, 0, 1, 1,
0.5229796, -0.8617817, 0.6428617, 0.254902, 0, 1, 1,
0.5235835, 0.1288696, 0.9992818, 0.2588235, 0, 1, 1,
0.5250193, 0.05631446, 2.494724, 0.2666667, 0, 1, 1,
0.5279189, -0.6467748, 1.461115, 0.2705882, 0, 1, 1,
0.5279387, 1.284626, 0.536029, 0.2784314, 0, 1, 1,
0.528511, 0.5486124, 0.4063101, 0.282353, 0, 1, 1,
0.5347429, 1.169923, -0.06484195, 0.2901961, 0, 1, 1,
0.5378923, 0.8139737, 0.7739975, 0.2941177, 0, 1, 1,
0.5412926, -0.634497, 2.401579, 0.3019608, 0, 1, 1,
0.5417973, -0.6973237, 3.697943, 0.3098039, 0, 1, 1,
0.549215, -0.7179791, 2.846033, 0.3137255, 0, 1, 1,
0.5528414, 0.05765862, 2.335461, 0.3215686, 0, 1, 1,
0.553575, -0.4102984, 2.284972, 0.3254902, 0, 1, 1,
0.5541436, -0.8724557, 2.292875, 0.3333333, 0, 1, 1,
0.5549102, 0.008421023, 2.210472, 0.3372549, 0, 1, 1,
0.5561393, 1.52795, -0.4188357, 0.345098, 0, 1, 1,
0.5574509, -0.5739775, 1.249594, 0.3490196, 0, 1, 1,
0.5576911, -1.211664, 3.981873, 0.3568628, 0, 1, 1,
0.5636755, -0.4296472, 2.409382, 0.3607843, 0, 1, 1,
0.5638496, 0.5120605, 0.6692241, 0.3686275, 0, 1, 1,
0.5686116, -0.7809528, 3.04254, 0.372549, 0, 1, 1,
0.5714229, -1.771834, 3.444617, 0.3803922, 0, 1, 1,
0.5716053, -1.641151, 3.767679, 0.3843137, 0, 1, 1,
0.5739841, -0.1284762, 1.724862, 0.3921569, 0, 1, 1,
0.5740218, -0.6633764, 1.57416, 0.3960784, 0, 1, 1,
0.5811439, 0.7496598, -0.7131914, 0.4039216, 0, 1, 1,
0.5865397, -1.183042, 2.416385, 0.4117647, 0, 1, 1,
0.5912207, 0.1725437, 1.676399, 0.4156863, 0, 1, 1,
0.5963739, -1.241661, 2.074987, 0.4235294, 0, 1, 1,
0.5979528, -0.01533671, 2.45345, 0.427451, 0, 1, 1,
0.5985005, -0.02421428, 0.2216502, 0.4352941, 0, 1, 1,
0.599192, -1.071734, 3.012737, 0.4392157, 0, 1, 1,
0.6030149, -0.6422464, 1.784683, 0.4470588, 0, 1, 1,
0.6108778, 0.1308582, 0.8842297, 0.4509804, 0, 1, 1,
0.6135067, -0.8767351, 2.174539, 0.4588235, 0, 1, 1,
0.6139433, -1.053133, 2.615773, 0.4627451, 0, 1, 1,
0.6143102, -0.2739538, 1.436117, 0.4705882, 0, 1, 1,
0.621781, -0.008720919, 1.183147, 0.4745098, 0, 1, 1,
0.6232321, -0.7693074, 2.787415, 0.4823529, 0, 1, 1,
0.6233026, -0.645317, 3.363675, 0.4862745, 0, 1, 1,
0.6263235, -0.8031858, 2.516505, 0.4941176, 0, 1, 1,
0.6264921, 1.058995, 0.2651921, 0.5019608, 0, 1, 1,
0.6275069, 0.3383371, 1.622731, 0.5058824, 0, 1, 1,
0.6275593, -0.1216077, 2.34764, 0.5137255, 0, 1, 1,
0.6294373, -0.7901474, 3.299898, 0.5176471, 0, 1, 1,
0.6304138, 0.5244202, 0.1167977, 0.5254902, 0, 1, 1,
0.6364241, 0.52004, 1.376704, 0.5294118, 0, 1, 1,
0.6379967, 1.396181, -0.824356, 0.5372549, 0, 1, 1,
0.6437457, -0.8741292, 1.814693, 0.5411765, 0, 1, 1,
0.648909, -0.10355, 3.936162, 0.5490196, 0, 1, 1,
0.6547099, 1.922413, -0.6293789, 0.5529412, 0, 1, 1,
0.6641814, -1.229053, 1.596526, 0.5607843, 0, 1, 1,
0.6728506, 0.4481205, 1.939474, 0.5647059, 0, 1, 1,
0.6869662, -2.067687, 0.944552, 0.572549, 0, 1, 1,
0.6887558, 0.3688636, 1.37395, 0.5764706, 0, 1, 1,
0.6909582, -0.8561648, 3.903859, 0.5843138, 0, 1, 1,
0.6942154, -1.515966, 3.47257, 0.5882353, 0, 1, 1,
0.6972084, -0.5702708, 0.878864, 0.5960785, 0, 1, 1,
0.698332, 0.002648754, 2.094701, 0.6039216, 0, 1, 1,
0.7063149, -0.654554, 2.215386, 0.6078432, 0, 1, 1,
0.7081432, -1.390494, 2.774504, 0.6156863, 0, 1, 1,
0.7083033, -0.1199199, 2.17352, 0.6196079, 0, 1, 1,
0.7135921, 0.9358208, 0.524781, 0.627451, 0, 1, 1,
0.7137187, -0.2116446, 4.217924, 0.6313726, 0, 1, 1,
0.7144166, 1.264924, -0.3954948, 0.6392157, 0, 1, 1,
0.7183597, 1.432766, 2.394029, 0.6431373, 0, 1, 1,
0.7210413, 1.728278, -0.2178452, 0.6509804, 0, 1, 1,
0.7224072, 0.2127686, 2.642416, 0.654902, 0, 1, 1,
0.7257684, -1.071352, 3.822247, 0.6627451, 0, 1, 1,
0.7270426, 0.09732822, 1.812425, 0.6666667, 0, 1, 1,
0.7275935, 0.4983638, 0.604665, 0.6745098, 0, 1, 1,
0.7337064, -0.3692047, 1.587229, 0.6784314, 0, 1, 1,
0.7346916, -0.08294851, 2.750262, 0.6862745, 0, 1, 1,
0.739183, 2.464646, 1.002665, 0.6901961, 0, 1, 1,
0.7402279, -1.628019, 2.500637, 0.6980392, 0, 1, 1,
0.741689, -1.102211, 2.437841, 0.7058824, 0, 1, 1,
0.7448726, -0.3537863, 2.529526, 0.7098039, 0, 1, 1,
0.7460213, 0.7587805, 0.9491861, 0.7176471, 0, 1, 1,
0.748602, -0.7818201, 1.927758, 0.7215686, 0, 1, 1,
0.7504334, -1.211624, 2.889331, 0.7294118, 0, 1, 1,
0.761106, -0.6600857, 1.868924, 0.7333333, 0, 1, 1,
0.7700253, -1.346922, 3.838673, 0.7411765, 0, 1, 1,
0.7715447, 0.5288527, 0.1070488, 0.7450981, 0, 1, 1,
0.7743953, -0.3124477, 2.762818, 0.7529412, 0, 1, 1,
0.78758, -0.1939597, 3.131164, 0.7568628, 0, 1, 1,
0.793812, -2.055081, 3.26811, 0.7647059, 0, 1, 1,
0.7939847, 1.549398, 0.3248841, 0.7686275, 0, 1, 1,
0.7940794, -0.01791645, 3.331528, 0.7764706, 0, 1, 1,
0.7947745, -0.9158479, 2.724435, 0.7803922, 0, 1, 1,
0.798467, 1.1245, -1.197903, 0.7882353, 0, 1, 1,
0.7997029, 0.9514992, -0.2710638, 0.7921569, 0, 1, 1,
0.8008854, -1.047537, 3.536734, 0.8, 0, 1, 1,
0.8338042, -0.2953382, 1.874251, 0.8078431, 0, 1, 1,
0.8442679, -0.1703874, 0.3102488, 0.8117647, 0, 1, 1,
0.8442931, 0.5451582, 1.428302, 0.8196079, 0, 1, 1,
0.84485, -0.1882832, 2.387241, 0.8235294, 0, 1, 1,
0.8493716, -1.13863, 2.744422, 0.8313726, 0, 1, 1,
0.8530506, -1.210205, 2.135205, 0.8352941, 0, 1, 1,
0.859241, -0.3011546, 1.855087, 0.8431373, 0, 1, 1,
0.8684135, -1.176233, 2.143765, 0.8470588, 0, 1, 1,
0.8763998, 0.01915717, 1.827443, 0.854902, 0, 1, 1,
0.8898571, -0.2114365, 0.6026755, 0.8588235, 0, 1, 1,
0.8900645, -2.684687, 2.021555, 0.8666667, 0, 1, 1,
0.8913746, 1.089642, -1.129218, 0.8705882, 0, 1, 1,
0.8936643, -0.5622329, 2.022747, 0.8784314, 0, 1, 1,
0.8965202, -0.185999, 0.7258419, 0.8823529, 0, 1, 1,
0.8971937, 0.08837716, 2.201758, 0.8901961, 0, 1, 1,
0.9002666, -1.17338, 0.4938985, 0.8941177, 0, 1, 1,
0.9051343, 1.081858, 2.636944, 0.9019608, 0, 1, 1,
0.9226089, 0.7808951, 0.923245, 0.9098039, 0, 1, 1,
0.9299235, -0.2249699, 2.83598, 0.9137255, 0, 1, 1,
0.9309079, -0.2598881, 3.066644, 0.9215686, 0, 1, 1,
0.9393193, -1.121697, 4.652056, 0.9254902, 0, 1, 1,
0.9411739, 0.3576469, 0.3582938, 0.9333333, 0, 1, 1,
0.9415276, 0.5115016, 2.728415, 0.9372549, 0, 1, 1,
0.9489363, 0.4704894, 3.040332, 0.945098, 0, 1, 1,
0.9548434, -1.090894, 2.51261, 0.9490196, 0, 1, 1,
0.9570189, 0.2828946, 1.643937, 0.9568627, 0, 1, 1,
0.95876, 1.734802, 1.397069, 0.9607843, 0, 1, 1,
0.9658133, 0.9802263, 0.4963669, 0.9686275, 0, 1, 1,
0.9739121, -1.06593, 1.793708, 0.972549, 0, 1, 1,
0.9752532, 0.1392698, 1.56398, 0.9803922, 0, 1, 1,
0.9758506, 1.653694, 1.514466, 0.9843137, 0, 1, 1,
0.9774821, 1.506662, -0.4581208, 0.9921569, 0, 1, 1,
0.9779496, 0.6935979, 0.1727355, 0.9960784, 0, 1, 1,
0.9815628, 1.801163, 0.1406895, 1, 0, 0.9960784, 1,
0.982715, -0.5634167, 2.593821, 1, 0, 0.9882353, 1,
0.989071, 0.3158107, 1.699377, 1, 0, 0.9843137, 1,
0.9943767, -0.7694344, 1.844482, 1, 0, 0.9764706, 1,
0.9949565, -0.8216509, 0.8708802, 1, 0, 0.972549, 1,
1.005523, -0.04336791, 1.962787, 1, 0, 0.9647059, 1,
1.012476, 0.03391855, 1.010184, 1, 0, 0.9607843, 1,
1.012662, 0.009563557, 0.6247255, 1, 0, 0.9529412, 1,
1.012999, 1.987898, 1.065304, 1, 0, 0.9490196, 1,
1.018513, -0.1522766, 2.141038, 1, 0, 0.9411765, 1,
1.019548, 1.712878, 0.4075557, 1, 0, 0.9372549, 1,
1.020739, 1.697726, 0.8145854, 1, 0, 0.9294118, 1,
1.024236, -0.05410752, 1.322478, 1, 0, 0.9254902, 1,
1.024686, -0.8256536, 3.758971, 1, 0, 0.9176471, 1,
1.027486, -0.9152251, 2.038949, 1, 0, 0.9137255, 1,
1.028482, -1.124526, 2.620622, 1, 0, 0.9058824, 1,
1.03585, 1.511116, 0.3808471, 1, 0, 0.9019608, 1,
1.043609, 0.2440725, 2.671117, 1, 0, 0.8941177, 1,
1.044389, 0.0679848, 2.010708, 1, 0, 0.8862745, 1,
1.045349, -0.09469908, 1.736183, 1, 0, 0.8823529, 1,
1.048469, 1.275357, -0.6079067, 1, 0, 0.8745098, 1,
1.053254, -0.5373464, 3.155034, 1, 0, 0.8705882, 1,
1.05668, -0.4388669, 2.24113, 1, 0, 0.8627451, 1,
1.061821, 1.769219, 0.02750755, 1, 0, 0.8588235, 1,
1.082933, -0.4953939, 0.2394448, 1, 0, 0.8509804, 1,
1.090933, 0.5308816, 0.6323246, 1, 0, 0.8470588, 1,
1.092432, -0.3567909, 2.48632, 1, 0, 0.8392157, 1,
1.093687, 0.4135897, 1.423719, 1, 0, 0.8352941, 1,
1.095469, 1.147653, 2.824147, 1, 0, 0.827451, 1,
1.098221, 0.4169589, 0.8524916, 1, 0, 0.8235294, 1,
1.102762, 0.1015975, 0.481128, 1, 0, 0.8156863, 1,
1.104771, 0.8324225, 0.5634992, 1, 0, 0.8117647, 1,
1.109401, 1.200757, 2.402614, 1, 0, 0.8039216, 1,
1.119334, 0.1599891, 0.5068529, 1, 0, 0.7960784, 1,
1.120345, 1.71184, -0.05737177, 1, 0, 0.7921569, 1,
1.129091, 1.143059, 1.309507, 1, 0, 0.7843137, 1,
1.129701, 1.063835, 1.786747, 1, 0, 0.7803922, 1,
1.13151, -0.6727562, -0.1573172, 1, 0, 0.772549, 1,
1.133007, -1.651751, 2.452857, 1, 0, 0.7686275, 1,
1.141461, 0.525232, 2.022812, 1, 0, 0.7607843, 1,
1.150932, 0.2770395, 2.308122, 1, 0, 0.7568628, 1,
1.152284, 0.05211939, 1.006757, 1, 0, 0.7490196, 1,
1.154755, 0.9079094, -0.6912829, 1, 0, 0.7450981, 1,
1.164286, 1.224906, 1.406769, 1, 0, 0.7372549, 1,
1.166138, -0.4307589, 3.145338, 1, 0, 0.7333333, 1,
1.182381, 2.350926, -0.5747852, 1, 0, 0.7254902, 1,
1.183005, -0.6050684, 2.196069, 1, 0, 0.7215686, 1,
1.185963, 0.1465984, 1.205212, 1, 0, 0.7137255, 1,
1.186353, 0.4597583, 1.813389, 1, 0, 0.7098039, 1,
1.187526, 0.4000052, -0.02264681, 1, 0, 0.7019608, 1,
1.189715, 0.8633243, -1.245675, 1, 0, 0.6941177, 1,
1.191475, -0.1804244, -0.2872912, 1, 0, 0.6901961, 1,
1.199305, 0.5832899, 2.011444, 1, 0, 0.682353, 1,
1.19977, 0.1420509, 2.495609, 1, 0, 0.6784314, 1,
1.211053, 0.5600455, -0.2999156, 1, 0, 0.6705883, 1,
1.212005, 0.897764, 2.016787, 1, 0, 0.6666667, 1,
1.213782, -0.9679666, 2.981049, 1, 0, 0.6588235, 1,
1.215307, -1.326969, 3.78505, 1, 0, 0.654902, 1,
1.216715, 0.9332066, 0.6002974, 1, 0, 0.6470588, 1,
1.220374, 0.6323554, 0.8783305, 1, 0, 0.6431373, 1,
1.226699, 0.5842806, 0.6057767, 1, 0, 0.6352941, 1,
1.228876, -0.6851796, 2.831284, 1, 0, 0.6313726, 1,
1.233009, -0.3737116, 1.019121, 1, 0, 0.6235294, 1,
1.233675, -0.1215188, 2.806342, 1, 0, 0.6196079, 1,
1.240163, 0.8879548, 0.6728101, 1, 0, 0.6117647, 1,
1.246619, 1.681448, 1.195311, 1, 0, 0.6078432, 1,
1.249185, 1.038507, 0.63728, 1, 0, 0.6, 1,
1.250379, -0.7265099, 2.131831, 1, 0, 0.5921569, 1,
1.254243, 1.029449, -0.4381082, 1, 0, 0.5882353, 1,
1.265439, 0.01795508, 0.5630462, 1, 0, 0.5803922, 1,
1.27445, -0.276459, 1.638926, 1, 0, 0.5764706, 1,
1.276025, 0.9088233, 0.4270121, 1, 0, 0.5686275, 1,
1.279124, 1.008275, 0.0828224, 1, 0, 0.5647059, 1,
1.289945, 0.8690921, 0.3990613, 1, 0, 0.5568628, 1,
1.306572, -0.5658893, 1.664618, 1, 0, 0.5529412, 1,
1.307223, -0.6235836, 2.050094, 1, 0, 0.5450981, 1,
1.323622, -0.415949, 2.832335, 1, 0, 0.5411765, 1,
1.326962, -2.073219, 2.974006, 1, 0, 0.5333334, 1,
1.329283, -0.6661347, 2.590973, 1, 0, 0.5294118, 1,
1.342324, 0.5852816, 2.498967, 1, 0, 0.5215687, 1,
1.346084, 0.651052, 0.1527161, 1, 0, 0.5176471, 1,
1.351007, 0.1544676, 1.580558, 1, 0, 0.509804, 1,
1.356472, -0.4220334, 2.584736, 1, 0, 0.5058824, 1,
1.359127, 0.2708794, 0.03149896, 1, 0, 0.4980392, 1,
1.369766, -0.4792263, 0.9448196, 1, 0, 0.4901961, 1,
1.371318, 0.2498117, 0.7310887, 1, 0, 0.4862745, 1,
1.382618, 0.02296436, 1.34582, 1, 0, 0.4784314, 1,
1.39991, -0.8238597, 2.38535, 1, 0, 0.4745098, 1,
1.400468, -0.5903453, 3.664608, 1, 0, 0.4666667, 1,
1.400934, 0.2179593, 1.242694, 1, 0, 0.4627451, 1,
1.403839, 0.6203517, 1.313714, 1, 0, 0.454902, 1,
1.416224, 0.8157651, -0.3153035, 1, 0, 0.4509804, 1,
1.440584, -0.7106997, 1.797231, 1, 0, 0.4431373, 1,
1.446965, 0.3519938, 0.6789994, 1, 0, 0.4392157, 1,
1.447576, 0.719132, 0.990344, 1, 0, 0.4313726, 1,
1.459984, -0.3767004, 1.8101, 1, 0, 0.427451, 1,
1.464996, -1.734183, 1.759232, 1, 0, 0.4196078, 1,
1.477881, -0.5224714, 1.048264, 1, 0, 0.4156863, 1,
1.482435, -0.234256, 2.260822, 1, 0, 0.4078431, 1,
1.4851, -0.9907597, 1.220424, 1, 0, 0.4039216, 1,
1.506639, 0.7744393, 2.060416, 1, 0, 0.3960784, 1,
1.515122, 1.050327, -0.5580278, 1, 0, 0.3882353, 1,
1.52931, -1.962122, 2.393724, 1, 0, 0.3843137, 1,
1.547846, -0.2522575, -1.701112, 1, 0, 0.3764706, 1,
1.552864, -0.1273695, 0.02107448, 1, 0, 0.372549, 1,
1.565016, 0.8894144, 1.317063, 1, 0, 0.3647059, 1,
1.565212, 0.2865639, 1.916467, 1, 0, 0.3607843, 1,
1.567146, 0.6474717, 2.727904, 1, 0, 0.3529412, 1,
1.576392, 2.468741, 0.6059452, 1, 0, 0.3490196, 1,
1.578432, 0.6510187, 1.569096, 1, 0, 0.3411765, 1,
1.584812, -1.625434, 2.274893, 1, 0, 0.3372549, 1,
1.603807, -1.456351, 2.400499, 1, 0, 0.3294118, 1,
1.61787, -0.3535623, 2.134953, 1, 0, 0.3254902, 1,
1.633507, -0.8012422, 2.991866, 1, 0, 0.3176471, 1,
1.647343, 1.748397, 1.922806, 1, 0, 0.3137255, 1,
1.647928, 0.2116254, 1.689718, 1, 0, 0.3058824, 1,
1.670557, 0.2016522, 0.7183728, 1, 0, 0.2980392, 1,
1.688194, 1.972586, 2.42158, 1, 0, 0.2941177, 1,
1.693501, 0.7381905, 0.1997306, 1, 0, 0.2862745, 1,
1.711763, -0.02131187, 2.644425, 1, 0, 0.282353, 1,
1.715956, 0.3880841, 2.699227, 1, 0, 0.2745098, 1,
1.73221, -0.4743206, 2.025327, 1, 0, 0.2705882, 1,
1.738764, -0.3878932, 2.720005, 1, 0, 0.2627451, 1,
1.767146, -1.768448, 2.464873, 1, 0, 0.2588235, 1,
1.791608, -1.102512, 2.724316, 1, 0, 0.2509804, 1,
1.803376, 0.7047592, 1.67924, 1, 0, 0.2470588, 1,
1.814072, -0.7367554, 2.556644, 1, 0, 0.2392157, 1,
1.816017, -0.1200526, 1.645677, 1, 0, 0.2352941, 1,
1.840251, 0.1342606, 2.05073, 1, 0, 0.227451, 1,
1.858357, 0.754896, 1.815192, 1, 0, 0.2235294, 1,
1.859016, 0.215613, 1.744738, 1, 0, 0.2156863, 1,
1.860127, 0.6207983, 3.702074, 1, 0, 0.2117647, 1,
1.86412, 0.05753944, 0.7428564, 1, 0, 0.2039216, 1,
1.870101, 1.563349, 1.542288, 1, 0, 0.1960784, 1,
1.878637, -0.1688931, 1.742309, 1, 0, 0.1921569, 1,
1.879666, -0.4811698, 0.4510283, 1, 0, 0.1843137, 1,
1.886863, 0.5787538, 1.520835, 1, 0, 0.1803922, 1,
1.903822, 1.394053, 0.4017436, 1, 0, 0.172549, 1,
1.919607, -0.6651953, 3.701459, 1, 0, 0.1686275, 1,
1.920866, 1.564531, 1.152683, 1, 0, 0.1607843, 1,
1.931546, 2.425311, 0.8750812, 1, 0, 0.1568628, 1,
1.932936, -0.5314394, 2.079054, 1, 0, 0.1490196, 1,
1.933199, -0.9953771, 2.626756, 1, 0, 0.145098, 1,
1.937721, 0.5150505, 2.505745, 1, 0, 0.1372549, 1,
1.947758, 1.022798, -0.06500688, 1, 0, 0.1333333, 1,
1.964151, -0.8080407, 1.362034, 1, 0, 0.1254902, 1,
1.998748, -0.1420417, 3.241494, 1, 0, 0.1215686, 1,
2.022878, -0.08851893, -0.7960832, 1, 0, 0.1137255, 1,
2.037027, 0.3900912, -1.036043, 1, 0, 0.1098039, 1,
2.108089, 0.6466874, 1.648765, 1, 0, 0.1019608, 1,
2.127536, 0.002844471, 1.954208, 1, 0, 0.09411765, 1,
2.132015, -0.6798109, 1.196199, 1, 0, 0.09019608, 1,
2.160213, 1.09293, 2.086385, 1, 0, 0.08235294, 1,
2.171213, -0.6488447, 3.28893, 1, 0, 0.07843138, 1,
2.197404, 0.8185868, 0.498085, 1, 0, 0.07058824, 1,
2.277948, -0.4403004, 3.197672, 1, 0, 0.06666667, 1,
2.324162, 1.109214, 1.258532, 1, 0, 0.05882353, 1,
2.33296, 1.369645, 0.6452838, 1, 0, 0.05490196, 1,
2.373565, 1.557067, -0.005042776, 1, 0, 0.04705882, 1,
2.509625, 1.111694, 2.105538, 1, 0, 0.04313726, 1,
2.567004, -0.8148264, 2.240137, 1, 0, 0.03529412, 1,
2.689899, 0.01550993, 2.235793, 1, 0, 0.03137255, 1,
2.703907, 1.194681, 0.976099, 1, 0, 0.02352941, 1,
2.892431, 0.6245958, 2.132908, 1, 0, 0.01960784, 1,
2.999316, 0.8108528, 1.955754, 1, 0, 0.01176471, 1,
3.339018, 0.5915405, -0.02927789, 1, 0, 0.007843138, 1
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
0.1922854, -4.776347, -7.28688, 0, -0.5, 0.5, 0.5,
0.1922854, -4.776347, -7.28688, 1, -0.5, 0.5, 0.5,
0.1922854, -4.776347, -7.28688, 1, 1.5, 0.5, 0.5,
0.1922854, -4.776347, -7.28688, 0, 1.5, 0.5, 0.5
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
-4.021189, -0.1679922, -7.28688, 0, -0.5, 0.5, 0.5,
-4.021189, -0.1679922, -7.28688, 1, -0.5, 0.5, 0.5,
-4.021189, -0.1679922, -7.28688, 1, 1.5, 0.5, 0.5,
-4.021189, -0.1679922, -7.28688, 0, 1.5, 0.5, 0.5
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
-4.021189, -4.776347, -0.09849763, 0, -0.5, 0.5, 0.5,
-4.021189, -4.776347, -0.09849763, 1, -0.5, 0.5, 0.5,
-4.021189, -4.776347, -0.09849763, 1, 1.5, 0.5, 0.5,
-4.021189, -4.776347, -0.09849763, 0, 1.5, 0.5, 0.5
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
-2, -3.71288, -5.628023,
3, -3.71288, -5.628023,
-2, -3.71288, -5.628023,
-2, -3.890125, -5.904499,
-1, -3.71288, -5.628023,
-1, -3.890125, -5.904499,
0, -3.71288, -5.628023,
0, -3.890125, -5.904499,
1, -3.71288, -5.628023,
1, -3.890125, -5.904499,
2, -3.71288, -5.628023,
2, -3.890125, -5.904499,
3, -3.71288, -5.628023,
3, -3.890125, -5.904499
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
-2, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
-2, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
-2, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
-2, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5,
-1, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
-1, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
-1, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
-1, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5,
0, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
0, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
0, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
0, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5,
1, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
1, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
1, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
1, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5,
2, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
2, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
2, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
2, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5,
3, -4.244614, -6.457451, 0, -0.5, 0.5, 0.5,
3, -4.244614, -6.457451, 1, -0.5, 0.5, 0.5,
3, -4.244614, -6.457451, 1, 1.5, 0.5, 0.5,
3, -4.244614, -6.457451, 0, 1.5, 0.5, 0.5
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
-3.048849, -3, -5.628023,
-3.048849, 3, -5.628023,
-3.048849, -3, -5.628023,
-3.210906, -3, -5.904499,
-3.048849, -2, -5.628023,
-3.210906, -2, -5.904499,
-3.048849, -1, -5.628023,
-3.210906, -1, -5.904499,
-3.048849, 0, -5.628023,
-3.210906, 0, -5.904499,
-3.048849, 1, -5.628023,
-3.210906, 1, -5.904499,
-3.048849, 2, -5.628023,
-3.210906, 2, -5.904499,
-3.048849, 3, -5.628023,
-3.210906, 3, -5.904499
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
-3.535019, -3, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, -3, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, -3, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, -3, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, -2, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, -2, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, -2, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, -2, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, -1, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, -1, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, -1, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, -1, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, 0, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, 0, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, 0, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, 0, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, 1, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, 1, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, 1, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, 1, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, 2, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, 2, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, 2, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, 2, -6.457451, 0, 1.5, 0.5, 0.5,
-3.535019, 3, -6.457451, 0, -0.5, 0.5, 0.5,
-3.535019, 3, -6.457451, 1, -0.5, 0.5, 0.5,
-3.535019, 3, -6.457451, 1, 1.5, 0.5, 0.5,
-3.535019, 3, -6.457451, 0, 1.5, 0.5, 0.5
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
-3.048849, -3.71288, -4,
-3.048849, -3.71288, 4,
-3.048849, -3.71288, -4,
-3.210906, -3.890125, -4,
-3.048849, -3.71288, -2,
-3.210906, -3.890125, -2,
-3.048849, -3.71288, 0,
-3.210906, -3.890125, 0,
-3.048849, -3.71288, 2,
-3.210906, -3.890125, 2,
-3.048849, -3.71288, 4,
-3.210906, -3.890125, 4
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
-3.535019, -4.244614, -4, 0, -0.5, 0.5, 0.5,
-3.535019, -4.244614, -4, 1, -0.5, 0.5, 0.5,
-3.535019, -4.244614, -4, 1, 1.5, 0.5, 0.5,
-3.535019, -4.244614, -4, 0, 1.5, 0.5, 0.5,
-3.535019, -4.244614, -2, 0, -0.5, 0.5, 0.5,
-3.535019, -4.244614, -2, 1, -0.5, 0.5, 0.5,
-3.535019, -4.244614, -2, 1, 1.5, 0.5, 0.5,
-3.535019, -4.244614, -2, 0, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 0, 0, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 0, 1, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 0, 1, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 0, 0, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 2, 0, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 2, 1, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 2, 1, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 2, 0, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 4, 0, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 4, 1, -0.5, 0.5, 0.5,
-3.535019, -4.244614, 4, 1, 1.5, 0.5, 0.5,
-3.535019, -4.244614, 4, 0, 1.5, 0.5, 0.5
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
-3.048849, -3.71288, -5.628023,
-3.048849, 3.376896, -5.628023,
-3.048849, -3.71288, 5.431027,
-3.048849, 3.376896, 5.431027,
-3.048849, -3.71288, -5.628023,
-3.048849, -3.71288, 5.431027,
-3.048849, 3.376896, -5.628023,
-3.048849, 3.376896, 5.431027,
-3.048849, -3.71288, -5.628023,
3.43342, -3.71288, -5.628023,
-3.048849, -3.71288, 5.431027,
3.43342, -3.71288, 5.431027,
-3.048849, 3.376896, -5.628023,
3.43342, 3.376896, -5.628023,
-3.048849, 3.376896, 5.431027,
3.43342, 3.376896, 5.431027,
3.43342, -3.71288, -5.628023,
3.43342, 3.376896, -5.628023,
3.43342, -3.71288, 5.431027,
3.43342, 3.376896, 5.431027,
3.43342, -3.71288, -5.628023,
3.43342, -3.71288, 5.431027,
3.43342, 3.376896, -5.628023,
3.43342, 3.376896, 5.431027
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
var radius = 7.822175;
var distance = 34.80174;
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
mvMatrix.translate( -0.1922854, 0.1679922, 0.09849763 );
mvMatrix.scale( 1.304711, 1.192913, 0.7647572 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80174);
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
Chlorobenzene<-read.table("Chlorobenzene.xyz")
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
-2.954447, -0.1097879, -3.934085, 0, 0, 1, 1, 1,
-2.847068, -0.5987095, -3.328489, 1, 0, 0, 1, 1,
-2.713084, -1.134649, -2.148316, 1, 0, 0, 1, 1,
-2.697815, -0.2207051, -1.309428, 1, 0, 0, 1, 1,
-2.666274, -0.2243666, -1.915438, 1, 0, 0, 1, 1,
-2.54699, -1.963067, -1.571422, 1, 0, 0, 1, 1,
-2.519404, 1.295686, -0.3969316, 0, 0, 0, 1, 1,
-2.426409, 1.009597, -0.9516388, 0, 0, 0, 1, 1,
-2.368173, -0.5356808, -1.312135, 0, 0, 0, 1, 1,
-2.355397, -0.5186042, -4.16869, 0, 0, 0, 1, 1,
-2.298346, 0.7923399, -0.2930886, 0, 0, 0, 1, 1,
-2.272626, -0.05934566, -2.014548, 0, 0, 0, 1, 1,
-2.175927, -0.4485472, -1.218065, 0, 0, 0, 1, 1,
-2.167407, -0.1942085, -1.539554, 1, 1, 1, 1, 1,
-2.164639, -0.05490809, -1.161651, 1, 1, 1, 1, 1,
-2.128338, -0.8359146, 0.456355, 1, 1, 1, 1, 1,
-2.093404, -0.08962605, -1.332909, 1, 1, 1, 1, 1,
-2.090328, 0.8704996, -1.383375, 1, 1, 1, 1, 1,
-2.031862, 1.07776, -2.978925, 1, 1, 1, 1, 1,
-2.012598, -0.01752364, -0.6885623, 1, 1, 1, 1, 1,
-2.011423, -0.5626454, -2.590657, 1, 1, 1, 1, 1,
-1.999576, -2.014537, -0.79388, 1, 1, 1, 1, 1,
-1.973451, 0.7255779, -1.367878, 1, 1, 1, 1, 1,
-1.972529, 1.142809, -1.630256, 1, 1, 1, 1, 1,
-1.960542, 0.07033161, -1.947018, 1, 1, 1, 1, 1,
-1.954413, 0.1716121, -0.8201038, 1, 1, 1, 1, 1,
-1.92537, -0.2862442, -2.195865, 1, 1, 1, 1, 1,
-1.91288, -0.9486415, -0.275822, 1, 1, 1, 1, 1,
-1.879435, -0.8803024, -0.8720035, 0, 0, 1, 1, 1,
-1.861933, -0.5351009, -4.094613, 1, 0, 0, 1, 1,
-1.86042, -1.70037, -1.161103, 1, 0, 0, 1, 1,
-1.835513, -2.509929, -3.336475, 1, 0, 0, 1, 1,
-1.811186, -0.1464288, -2.508322, 1, 0, 0, 1, 1,
-1.807205, -0.02767625, -1.185776, 1, 0, 0, 1, 1,
-1.802011, -1.267285, -0.4074979, 0, 0, 0, 1, 1,
-1.78115, 0.009647688, -1.703559, 0, 0, 0, 1, 1,
-1.714076, -0.2691816, -1.26618, 0, 0, 0, 1, 1,
-1.707103, -0.1753957, -1.532928, 0, 0, 0, 1, 1,
-1.697106, -0.9297326, -0.8665891, 0, 0, 0, 1, 1,
-1.691522, 0.3484874, -1.258123, 0, 0, 0, 1, 1,
-1.685693, -1.266469, -1.148549, 0, 0, 0, 1, 1,
-1.681849, -0.4544715, -1.039159, 1, 1, 1, 1, 1,
-1.655293, -0.4024829, -1.613355, 1, 1, 1, 1, 1,
-1.65519, -2.39465, -4.315038, 1, 1, 1, 1, 1,
-1.64866, -1.290219, -3.512611, 1, 1, 1, 1, 1,
-1.643711, -0.265675, 0.1375318, 1, 1, 1, 1, 1,
-1.641895, -2.055678, -2.302527, 1, 1, 1, 1, 1,
-1.631144, -3.051573, -2.563216, 1, 1, 1, 1, 1,
-1.623611, -0.8524283, -3.305509, 1, 1, 1, 1, 1,
-1.61963, -1.124402, -1.701777, 1, 1, 1, 1, 1,
-1.616725, 1.506144, 0.02113625, 1, 1, 1, 1, 1,
-1.59367, 0.2650629, -2.189509, 1, 1, 1, 1, 1,
-1.592435, -1.276098, -0.3177813, 1, 1, 1, 1, 1,
-1.59131, 1.269117, 0.1996173, 1, 1, 1, 1, 1,
-1.590619, 2.611579, -0.3513004, 1, 1, 1, 1, 1,
-1.566939, 0.4302128, -2.190716, 1, 1, 1, 1, 1,
-1.537891, 1.5332, -1.203939, 0, 0, 1, 1, 1,
-1.485676, 0.7819766, 0.2600253, 1, 0, 0, 1, 1,
-1.48124, 0.5735339, 0.1999474, 1, 0, 0, 1, 1,
-1.47823, 0.07249789, -0.6577299, 1, 0, 0, 1, 1,
-1.474508, -0.7111395, -0.1302578, 1, 0, 0, 1, 1,
-1.467055, -0.9664734, -2.092797, 1, 0, 0, 1, 1,
-1.457696, -0.1164645, -1.238306, 0, 0, 0, 1, 1,
-1.457025, 1.078483, -2.359736, 0, 0, 0, 1, 1,
-1.455989, 0.7524112, -1.638135, 0, 0, 0, 1, 1,
-1.453957, 1.106581, 0.2667202, 0, 0, 0, 1, 1,
-1.452341, 0.6367511, -0.4742241, 0, 0, 0, 1, 1,
-1.444334, 0.5503757, -0.9396151, 0, 0, 0, 1, 1,
-1.433082, -0.09594601, -2.40875, 0, 0, 0, 1, 1,
-1.424221, 0.0626962, -2.92232, 1, 1, 1, 1, 1,
-1.423245, -0.9666455, -1.251707, 1, 1, 1, 1, 1,
-1.4205, -0.3575175, -0.8677086, 1, 1, 1, 1, 1,
-1.410591, 0.8657615, -0.2529196, 1, 1, 1, 1, 1,
-1.409844, -0.3530889, -1.525698, 1, 1, 1, 1, 1,
-1.403928, -1.282138, -2.770711, 1, 1, 1, 1, 1,
-1.401176, 0.08462261, -0.1319301, 1, 1, 1, 1, 1,
-1.3919, 0.8478605, -1.41721, 1, 1, 1, 1, 1,
-1.372193, 1.005283, -1.4822, 1, 1, 1, 1, 1,
-1.369134, -2.069762, -2.361979, 1, 1, 1, 1, 1,
-1.360758, 0.4932789, -2.038956, 1, 1, 1, 1, 1,
-1.354933, 0.2118059, -0.1742143, 1, 1, 1, 1, 1,
-1.353392, -1.067292, -2.513204, 1, 1, 1, 1, 1,
-1.349728, -1.475202, -1.954828, 1, 1, 1, 1, 1,
-1.346975, 0.3385652, -1.096986, 1, 1, 1, 1, 1,
-1.328813, -0.6023895, -2.260895, 0, 0, 1, 1, 1,
-1.32087, -2.021132, -3.755885, 1, 0, 0, 1, 1,
-1.319888, -0.07194334, -1.522289, 1, 0, 0, 1, 1,
-1.319763, -0.5454993, -0.9780337, 1, 0, 0, 1, 1,
-1.316147, 0.0682172, -3.517587, 1, 0, 0, 1, 1,
-1.308802, 0.3959606, -0.8443474, 1, 0, 0, 1, 1,
-1.306515, 2.097618, -0.06710748, 0, 0, 0, 1, 1,
-1.30625, -0.9384589, -2.816658, 0, 0, 0, 1, 1,
-1.299382, -1.05303, -0.6939279, 0, 0, 0, 1, 1,
-1.295662, -2.755735, -3.450251, 0, 0, 0, 1, 1,
-1.292821, 0.5808177, -1.662055, 0, 0, 0, 1, 1,
-1.290326, 1.057488, -0.8147237, 0, 0, 0, 1, 1,
-1.28452, 0.468408, -1.493674, 0, 0, 0, 1, 1,
-1.282993, -0.5515954, -0.2451437, 1, 1, 1, 1, 1,
-1.279505, 0.2857738, -2.72504, 1, 1, 1, 1, 1,
-1.275349, 1.958272, 0.2215966, 1, 1, 1, 1, 1,
-1.253277, -0.4803983, -2.310466, 1, 1, 1, 1, 1,
-1.249509, -0.0381784, -1.936956, 1, 1, 1, 1, 1,
-1.249406, -0.6283289, -1.562157, 1, 1, 1, 1, 1,
-1.24443, 0.5975815, -3.700396, 1, 1, 1, 1, 1,
-1.243552, -0.003343524, -0.9027922, 1, 1, 1, 1, 1,
-1.240113, -0.3870789, -1.381619, 1, 1, 1, 1, 1,
-1.226889, -0.3074133, -2.002038, 1, 1, 1, 1, 1,
-1.222997, 0.6233824, -0.7173199, 1, 1, 1, 1, 1,
-1.199374, 1.504648, -0.2725301, 1, 1, 1, 1, 1,
-1.195031, -0.7127869, -3.518489, 1, 1, 1, 1, 1,
-1.189237, -1.893468, -2.602599, 1, 1, 1, 1, 1,
-1.180494, -2.586262, -2.765733, 1, 1, 1, 1, 1,
-1.174983, 0.361221, -3.41571, 0, 0, 1, 1, 1,
-1.174651, 1.245608, -0.5956361, 1, 0, 0, 1, 1,
-1.173659, -0.3004003, -1.850663, 1, 0, 0, 1, 1,
-1.171783, -0.6709872, -1.408952, 1, 0, 0, 1, 1,
-1.169791, 0.1357847, 0.3726326, 1, 0, 0, 1, 1,
-1.158448, -0.2868719, -2.762197, 1, 0, 0, 1, 1,
-1.156799, -0.4257687, -2.840374, 0, 0, 0, 1, 1,
-1.15064, 0.9984523, -0.771224, 0, 0, 0, 1, 1,
-1.149876, -1.177194, -1.692862, 0, 0, 0, 1, 1,
-1.148299, -1.319581, -2.201332, 0, 0, 0, 1, 1,
-1.147442, 1.15939, 1.036821, 0, 0, 0, 1, 1,
-1.136902, -1.717308, -1.745519, 0, 0, 0, 1, 1,
-1.134188, 0.7314485, -1.197009, 0, 0, 0, 1, 1,
-1.133882, 0.561218, -1.298658, 1, 1, 1, 1, 1,
-1.125647, -0.5475503, -2.570469, 1, 1, 1, 1, 1,
-1.118479, 0.07413532, 0.1004441, 1, 1, 1, 1, 1,
-1.118113, 0.06608186, -1.020776, 1, 1, 1, 1, 1,
-1.116702, 0.2344534, -2.311059, 1, 1, 1, 1, 1,
-1.112936, -2.826784, -2.35294, 1, 1, 1, 1, 1,
-1.112377, -1.063633, -2.878115, 1, 1, 1, 1, 1,
-1.101603, 1.122838, -0.2058276, 1, 1, 1, 1, 1,
-1.101481, -0.3081395, -2.693467, 1, 1, 1, 1, 1,
-1.10126, 0.7473094, -2.335613, 1, 1, 1, 1, 1,
-1.101171, 0.8784899, -0.2633656, 1, 1, 1, 1, 1,
-1.100096, -0.356061, -2.253262, 1, 1, 1, 1, 1,
-1.090102, -0.9060583, -4.877805, 1, 1, 1, 1, 1,
-1.085911, -0.4493395, -2.912757, 1, 1, 1, 1, 1,
-1.084585, -1.64474, -2.031231, 1, 1, 1, 1, 1,
-1.083073, -1.021377, -3.637749, 0, 0, 1, 1, 1,
-1.075862, -0.02711226, -2.694433, 1, 0, 0, 1, 1,
-1.066326, 0.1628974, -0.283911, 1, 0, 0, 1, 1,
-1.060692, -0.005133251, -2.371753, 1, 0, 0, 1, 1,
-1.057338, 1.124414, -0.0706977, 1, 0, 0, 1, 1,
-1.057202, 1.046919, -0.4364263, 1, 0, 0, 1, 1,
-1.054659, 1.072399, 1.969766, 0, 0, 0, 1, 1,
-1.053216, -0.7936451, -3.418057, 0, 0, 0, 1, 1,
-1.052488, 0.5760685, -0.02148129, 0, 0, 0, 1, 1,
-1.046011, -0.235578, -0.7465253, 0, 0, 0, 1, 1,
-1.040605, -0.5195667, -3.050605, 0, 0, 0, 1, 1,
-1.022368, -3.609631, -3.222117, 0, 0, 0, 1, 1,
-1.016094, 0.7429152, -1.91808, 0, 0, 0, 1, 1,
-1.014312, -0.02103538, -2.599714, 1, 1, 1, 1, 1,
-1.011078, 0.6061612, -1.350273, 1, 1, 1, 1, 1,
-1.01105, 1.039152, 0.2649437, 1, 1, 1, 1, 1,
-1.00906, -0.04852151, -2.538769, 1, 1, 1, 1, 1,
-1.006811, -1.194984, -2.868887, 1, 1, 1, 1, 1,
-1.005674, 0.8375985, -2.551132, 1, 1, 1, 1, 1,
-1.002881, -1.704537, -3.24531, 1, 1, 1, 1, 1,
-1.000074, -0.1707613, -2.943315, 1, 1, 1, 1, 1,
-1.00002, -0.9955564, -2.449219, 1, 1, 1, 1, 1,
-0.9970086, -0.02152532, -3.169987, 1, 1, 1, 1, 1,
-0.9809266, 0.2450875, -2.401155, 1, 1, 1, 1, 1,
-0.9774104, -0.4365393, -0.9584202, 1, 1, 1, 1, 1,
-0.9752015, 1.231101, -0.9133115, 1, 1, 1, 1, 1,
-0.9719881, 1.288306, 0.5706669, 1, 1, 1, 1, 1,
-0.9642084, 2.311241, -2.68965, 1, 1, 1, 1, 1,
-0.957589, 1.254053, -1.902108, 0, 0, 1, 1, 1,
-0.9551033, -1.070797, -2.271404, 1, 0, 0, 1, 1,
-0.9477258, 0.3225534, -1.410685, 1, 0, 0, 1, 1,
-0.9417967, -1.28998, -2.983071, 1, 0, 0, 1, 1,
-0.9415264, 0.5019623, -1.098079, 1, 0, 0, 1, 1,
-0.936312, 0.729188, 0.2421914, 1, 0, 0, 1, 1,
-0.9302557, 0.6901538, 0.1824105, 0, 0, 0, 1, 1,
-0.9297669, 0.5618551, -0.6625823, 0, 0, 0, 1, 1,
-0.9284027, 0.9147071, 0.01091925, 0, 0, 0, 1, 1,
-0.9281402, 1.230462, -1.212916, 0, 0, 0, 1, 1,
-0.9175026, 1.087756, -0.3848884, 0, 0, 0, 1, 1,
-0.9159896, 0.05761641, -1.44092, 0, 0, 0, 1, 1,
-0.9141434, -0.005224986, -1.573067, 0, 0, 0, 1, 1,
-0.9139354, 1.175451, -0.5819971, 1, 1, 1, 1, 1,
-0.9138049, 1.334086, -1.447499, 1, 1, 1, 1, 1,
-0.9106991, 0.1995406, -0.2816639, 1, 1, 1, 1, 1,
-0.9032094, 0.1564574, -0.06046342, 1, 1, 1, 1, 1,
-0.9018506, 0.8574868, 0.2188623, 1, 1, 1, 1, 1,
-0.888236, -0.01181115, -1.356321, 1, 1, 1, 1, 1,
-0.8832697, 0.09311582, -0.33136, 1, 1, 1, 1, 1,
-0.8820138, -1.590456, -2.497054, 1, 1, 1, 1, 1,
-0.8811914, 1.095866, 0.0004638363, 1, 1, 1, 1, 1,
-0.8811486, 0.3920721, -1.070848, 1, 1, 1, 1, 1,
-0.8807594, 0.8723502, -3.099787, 1, 1, 1, 1, 1,
-0.8751024, -0.7935931, -3.662561, 1, 1, 1, 1, 1,
-0.8750318, -0.3326471, -2.56881, 1, 1, 1, 1, 1,
-0.8730747, 0.3143076, -0.03038848, 1, 1, 1, 1, 1,
-0.8729367, -0.7343186, -2.146021, 1, 1, 1, 1, 1,
-0.8689211, 0.8902551, -0.6686109, 0, 0, 1, 1, 1,
-0.862734, -1.240348, -3.051932, 1, 0, 0, 1, 1,
-0.8581552, 0.6864583, -2.382019, 1, 0, 0, 1, 1,
-0.856994, 1.693631, -0.9521757, 1, 0, 0, 1, 1,
-0.8540009, -1.240992, -2.082762, 1, 0, 0, 1, 1,
-0.8479471, -0.05383941, -2.748991, 1, 0, 0, 1, 1,
-0.8382903, 1.112289, -0.2524044, 0, 0, 0, 1, 1,
-0.8378079, -0.8147644, -1.296327, 0, 0, 0, 1, 1,
-0.8374908, -2.279963, -4.189607, 0, 0, 0, 1, 1,
-0.8241941, -0.1658982, -2.057957, 0, 0, 0, 1, 1,
-0.8235777, -1.15873, -3.319684, 0, 0, 0, 1, 1,
-0.8227763, -0.1139652, -1.351594, 0, 0, 0, 1, 1,
-0.8224562, 0.1149175, -1.764559, 0, 0, 0, 1, 1,
-0.8215749, -1.532915, -3.584066, 1, 1, 1, 1, 1,
-0.817416, -2.347946, -2.553431, 1, 1, 1, 1, 1,
-0.8155328, -0.5010302, -2.580248, 1, 1, 1, 1, 1,
-0.8035489, 0.2478428, -0.2003251, 1, 1, 1, 1, 1,
-0.8011373, 0.4575615, -1.695022, 1, 1, 1, 1, 1,
-0.7981851, 0.3183568, -2.451046, 1, 1, 1, 1, 1,
-0.7970231, -0.2178164, -0.6821874, 1, 1, 1, 1, 1,
-0.7933103, 0.2051307, -0.7411216, 1, 1, 1, 1, 1,
-0.792108, -1.803654, -2.806797, 1, 1, 1, 1, 1,
-0.7911884, -1.702428, -2.422837, 1, 1, 1, 1, 1,
-0.7909563, 1.093012, 0.1880611, 1, 1, 1, 1, 1,
-0.786073, 0.602088, 0.5725149, 1, 1, 1, 1, 1,
-0.7837569, 0.7802949, -1.223553, 1, 1, 1, 1, 1,
-0.7823752, 1.028828, -0.4391926, 1, 1, 1, 1, 1,
-0.7787788, -0.1440464, -1.438407, 1, 1, 1, 1, 1,
-0.7762057, -0.9140859, -2.21328, 0, 0, 1, 1, 1,
-0.7711368, 0.01453392, -1.99567, 1, 0, 0, 1, 1,
-0.7573934, -0.2723872, -1.529126, 1, 0, 0, 1, 1,
-0.7512705, 0.3278194, -0.9712232, 1, 0, 0, 1, 1,
-0.7504421, 1.195744, -0.7309231, 1, 0, 0, 1, 1,
-0.7473051, -1.284568, -1.963555, 1, 0, 0, 1, 1,
-0.7464556, -0.5439016, -1.512206, 0, 0, 0, 1, 1,
-0.7454397, 0.8227208, -2.422504, 0, 0, 0, 1, 1,
-0.7412013, -0.2627132, -2.677836, 0, 0, 0, 1, 1,
-0.7343221, 0.5212036, -0.1682473, 0, 0, 0, 1, 1,
-0.7284901, -0.6056663, -3.027551, 0, 0, 0, 1, 1,
-0.7277515, 1.255873, -1.271555, 0, 0, 0, 1, 1,
-0.7224804, 0.8193197, -0.1162935, 0, 0, 0, 1, 1,
-0.71739, -0.2025444, -2.387105, 1, 1, 1, 1, 1,
-0.7116882, 1.451326, -0.4747616, 1, 1, 1, 1, 1,
-0.711001, 0.3316457, -0.1935215, 1, 1, 1, 1, 1,
-0.7095269, 0.3427134, 1.309062, 1, 1, 1, 1, 1,
-0.7074584, 0.2413169, -3.57545, 1, 1, 1, 1, 1,
-0.7069435, -0.5879959, -1.466665, 1, 1, 1, 1, 1,
-0.7038465, -1.84068, -1.480182, 1, 1, 1, 1, 1,
-0.7031582, 1.954855, 1.00831, 1, 1, 1, 1, 1,
-0.7014009, 0.06546759, -1.048853, 1, 1, 1, 1, 1,
-0.7009479, 2.000905, 0.5583642, 1, 1, 1, 1, 1,
-0.6910549, 2.225857, -0.5555299, 1, 1, 1, 1, 1,
-0.6906701, -0.1065214, -0.8501613, 1, 1, 1, 1, 1,
-0.6826066, 0.007455967, -0.4011032, 1, 1, 1, 1, 1,
-0.6796595, -0.323487, -3.668924, 1, 1, 1, 1, 1,
-0.6746189, -0.812906, -2.402065, 1, 1, 1, 1, 1,
-0.6728044, -1.489387, -3.055143, 0, 0, 1, 1, 1,
-0.6725029, -1.333756, -2.4338, 1, 0, 0, 1, 1,
-0.668753, -0.3034154, -1.482538, 1, 0, 0, 1, 1,
-0.6655932, 1.584053, 0.1184694, 1, 0, 0, 1, 1,
-0.6652025, 0.0244292, -2.805497, 1, 0, 0, 1, 1,
-0.6621853, 0.2694457, 0.5512549, 1, 0, 0, 1, 1,
-0.6604165, -1.253681, -4.942961, 0, 0, 0, 1, 1,
-0.6568989, -0.07917012, -2.214326, 0, 0, 0, 1, 1,
-0.6455194, 0.2699384, -0.7717428, 0, 0, 0, 1, 1,
-0.6415564, -0.4398995, -0.6598054, 0, 0, 0, 1, 1,
-0.6340325, 0.04998893, -1.302447, 0, 0, 0, 1, 1,
-0.6284021, -1.383617, -2.089102, 0, 0, 0, 1, 1,
-0.6270224, 1.388937, -0.5228217, 0, 0, 0, 1, 1,
-0.6169465, -0.4715212, -1.794465, 1, 1, 1, 1, 1,
-0.6161878, -0.7717568, -1.025883, 1, 1, 1, 1, 1,
-0.6160588, 0.273505, -0.8743304, 1, 1, 1, 1, 1,
-0.612535, -0.4095219, -0.6367442, 1, 1, 1, 1, 1,
-0.612225, 2.072696, -0.3169646, 1, 1, 1, 1, 1,
-0.6099759, -0.6232414, -2.871876, 1, 1, 1, 1, 1,
-0.6019542, -0.5024624, -2.675391, 1, 1, 1, 1, 1,
-0.5881599, 0.9617753, -1.590839, 1, 1, 1, 1, 1,
-0.5827146, -0.1763881, -2.868878, 1, 1, 1, 1, 1,
-0.5826467, -0.03408056, -3.164657, 1, 1, 1, 1, 1,
-0.5808048, -0.2792942, -2.708852, 1, 1, 1, 1, 1,
-0.5791423, -0.9622378, -0.5226296, 1, 1, 1, 1, 1,
-0.5696428, 0.3604943, -1.578328, 1, 1, 1, 1, 1,
-0.5674162, -0.819891, -3.264519, 1, 1, 1, 1, 1,
-0.5660793, -0.7493113, -2.874873, 1, 1, 1, 1, 1,
-0.5617107, 0.304705, -1.313248, 0, 0, 1, 1, 1,
-0.5605233, -0.3346891, -0.1296808, 1, 0, 0, 1, 1,
-0.5598392, -1.158852, -1.113668, 1, 0, 0, 1, 1,
-0.5589911, -0.9898942, -4.09254, 1, 0, 0, 1, 1,
-0.5500861, -0.3039472, -1.815862, 1, 0, 0, 1, 1,
-0.5472344, -1.473416, -2.060779, 1, 0, 0, 1, 1,
-0.5461855, 0.8899825, 0.6552299, 0, 0, 0, 1, 1,
-0.5448188, 0.01952445, -1.606068, 0, 0, 0, 1, 1,
-0.5387577, 1.066703, -0.5163484, 0, 0, 0, 1, 1,
-0.5352709, -0.293826, -3.550503, 0, 0, 0, 1, 1,
-0.5352113, -1.009889, -2.451812, 0, 0, 0, 1, 1,
-0.5334201, 1.946853, -1.168712, 0, 0, 0, 1, 1,
-0.5324317, -0.6131649, -0.826602, 0, 0, 0, 1, 1,
-0.5319756, 0.810892, 0.2133759, 1, 1, 1, 1, 1,
-0.5255555, 0.2918261, -1.816618, 1, 1, 1, 1, 1,
-0.5239066, -0.8253605, -3.621895, 1, 1, 1, 1, 1,
-0.5237816, -1.145561, -1.937204, 1, 1, 1, 1, 1,
-0.5197615, -0.558818, -2.356675, 1, 1, 1, 1, 1,
-0.518991, 0.7766073, -0.05226583, 1, 1, 1, 1, 1,
-0.5186779, -0.4960862, -2.062901, 1, 1, 1, 1, 1,
-0.5177947, 2.243085, -0.2929964, 1, 1, 1, 1, 1,
-0.5140295, -0.2736406, -2.874896, 1, 1, 1, 1, 1,
-0.513142, 0.0338386, -2.421876, 1, 1, 1, 1, 1,
-0.5115626, -0.2741382, -0.9857115, 1, 1, 1, 1, 1,
-0.5100843, 0.4926405, -0.1236158, 1, 1, 1, 1, 1,
-0.509605, -1.956341, -2.245231, 1, 1, 1, 1, 1,
-0.5093794, 1.592782, -0.9633104, 1, 1, 1, 1, 1,
-0.5081666, -0.4933473, -3.433247, 1, 1, 1, 1, 1,
-0.506301, -0.9176217, -2.750638, 0, 0, 1, 1, 1,
-0.5039622, 0.9309777, -2.447971, 1, 0, 0, 1, 1,
-0.4987183, -0.6722192, -3.690375, 1, 0, 0, 1, 1,
-0.4912913, -2.268598, -2.756045, 1, 0, 0, 1, 1,
-0.4906947, 0.682496, 0.04559674, 1, 0, 0, 1, 1,
-0.4906819, -1.115376, -2.350605, 1, 0, 0, 1, 1,
-0.4894201, 0.4298199, -1.237674, 0, 0, 0, 1, 1,
-0.487527, -0.1049536, -1.071101, 0, 0, 0, 1, 1,
-0.4848798, -1.951976, -2.900595, 0, 0, 0, 1, 1,
-0.4842308, 0.2717403, -1.642366, 0, 0, 0, 1, 1,
-0.4766283, 0.2821762, -0.5004242, 0, 0, 0, 1, 1,
-0.4743699, -0.944637, -3.506739, 0, 0, 0, 1, 1,
-0.4724079, -0.06860959, -0.9944932, 0, 0, 0, 1, 1,
-0.4711353, -1.561814, -2.20221, 1, 1, 1, 1, 1,
-0.4705862, -0.3513442, -3.475652, 1, 1, 1, 1, 1,
-0.4645078, -0.4935854, -0.7875412, 1, 1, 1, 1, 1,
-0.4639691, 0.2131671, -1.805392, 1, 1, 1, 1, 1,
-0.4539537, -0.4666355, -1.230438, 1, 1, 1, 1, 1,
-0.4536134, 1.385345, -0.1664317, 1, 1, 1, 1, 1,
-0.4467334, 0.1698834, -2.561543, 1, 1, 1, 1, 1,
-0.444027, -1.286976, -3.634514, 1, 1, 1, 1, 1,
-0.4429722, -0.3037972, -1.794478, 1, 1, 1, 1, 1,
-0.4415841, -0.2555975, -2.459075, 1, 1, 1, 1, 1,
-0.433626, -0.5370984, -3.355365, 1, 1, 1, 1, 1,
-0.427901, 0.1240876, -2.087378, 1, 1, 1, 1, 1,
-0.4276894, -1.292462, -2.939916, 1, 1, 1, 1, 1,
-0.4234583, -0.705986, -3.73566, 1, 1, 1, 1, 1,
-0.4232186, -0.3451379, -2.191657, 1, 1, 1, 1, 1,
-0.4223889, 0.1152575, -0.4734291, 0, 0, 1, 1, 1,
-0.4140616, 2.703192, -1.054419, 1, 0, 0, 1, 1,
-0.4093447, 0.5380216, 0.7759096, 1, 0, 0, 1, 1,
-0.4084681, 0.720538, -1.60518, 1, 0, 0, 1, 1,
-0.4078842, -0.2139996, -2.670109, 1, 0, 0, 1, 1,
-0.4035326, -0.1934582, -3.775466, 1, 0, 0, 1, 1,
-0.4017847, -0.3438853, -1.000281, 0, 0, 0, 1, 1,
-0.4013402, -1.37105, -2.734823, 0, 0, 0, 1, 1,
-0.3915966, 0.5374607, -0.7540305, 0, 0, 0, 1, 1,
-0.390825, -1.632642, -3.770458, 0, 0, 0, 1, 1,
-0.3887803, 0.5100337, -1.182876, 0, 0, 0, 1, 1,
-0.3885569, 0.818493, -1.508287, 0, 0, 0, 1, 1,
-0.3851294, -1.224114, -3.247638, 0, 0, 0, 1, 1,
-0.3820888, -0.2759148, -1.376459, 1, 1, 1, 1, 1,
-0.380178, -0.4919714, -2.207412, 1, 1, 1, 1, 1,
-0.3784473, 0.8394636, -0.986858, 1, 1, 1, 1, 1,
-0.3766383, -0.259352, -0.6462353, 1, 1, 1, 1, 1,
-0.374148, 1.110842, 0.5271195, 1, 1, 1, 1, 1,
-0.3696601, 0.8852744, -1.416041, 1, 1, 1, 1, 1,
-0.3655637, 1.725946, 1.064972, 1, 1, 1, 1, 1,
-0.3641601, 0.4357035, -0.9309276, 1, 1, 1, 1, 1,
-0.3636105, -1.077467, -5.007493, 1, 1, 1, 1, 1,
-0.3635132, 0.2100538, -2.332302, 1, 1, 1, 1, 1,
-0.3601418, 0.3883765, -0.4477933, 1, 1, 1, 1, 1,
-0.3568252, 1.18041, -0.8916208, 1, 1, 1, 1, 1,
-0.3545717, 0.03210663, -2.397716, 1, 1, 1, 1, 1,
-0.3508298, -0.0453578, -0.7027311, 1, 1, 1, 1, 1,
-0.3488098, 1.460128, 0.9205692, 1, 1, 1, 1, 1,
-0.34874, -0.3628944, -2.596022, 0, 0, 1, 1, 1,
-0.3473839, 0.2805191, -1.346957, 1, 0, 0, 1, 1,
-0.345304, 1.027721, -1.037696, 1, 0, 0, 1, 1,
-0.3451118, -1.75189, -1.978883, 1, 0, 0, 1, 1,
-0.3378148, -0.08841743, -2.356265, 1, 0, 0, 1, 1,
-0.3375811, 0.01252249, -1.702073, 1, 0, 0, 1, 1,
-0.3374583, -0.4048959, -1.115541, 0, 0, 0, 1, 1,
-0.336696, -1.292739, -1.445423, 0, 0, 0, 1, 1,
-0.3349507, 2.961949, 0.7198161, 0, 0, 0, 1, 1,
-0.3339543, -2.05199, -2.19741, 0, 0, 0, 1, 1,
-0.3323646, 0.288621, -2.209218, 0, 0, 0, 1, 1,
-0.3304606, 0.04227759, -0.3319356, 0, 0, 0, 1, 1,
-0.3276607, -1.044031, -4.144258, 0, 0, 0, 1, 1,
-0.325592, 0.9801369, 0.1184288, 1, 1, 1, 1, 1,
-0.3253404, 1.537327, -0.1004016, 1, 1, 1, 1, 1,
-0.3233086, 0.9945234, -1.680587, 1, 1, 1, 1, 1,
-0.32154, 0.1428309, -0.2607977, 1, 1, 1, 1, 1,
-0.3183457, -0.8828194, -2.687644, 1, 1, 1, 1, 1,
-0.3180386, -0.1422961, 0.487034, 1, 1, 1, 1, 1,
-0.3161608, -1.453542, -1.95579, 1, 1, 1, 1, 1,
-0.3153472, 0.3451456, -2.788291, 1, 1, 1, 1, 1,
-0.3121753, 0.4011026, -0.5422593, 1, 1, 1, 1, 1,
-0.3121636, 1.968599, 1.035349, 1, 1, 1, 1, 1,
-0.309709, 3.273647, -1.307072, 1, 1, 1, 1, 1,
-0.3083304, -0.791849, -3.167423, 1, 1, 1, 1, 1,
-0.3029733, 1.169113, -0.2766235, 1, 1, 1, 1, 1,
-0.2993106, 0.6566899, 0.3613963, 1, 1, 1, 1, 1,
-0.2907654, 0.848394, -0.8937003, 1, 1, 1, 1, 1,
-0.2877413, -1.569999, -2.582991, 0, 0, 1, 1, 1,
-0.2852639, 0.6310037, 0.8672373, 1, 0, 0, 1, 1,
-0.2846158, 0.795583, -1.359024, 1, 0, 0, 1, 1,
-0.2804815, -1.100857, -2.692263, 1, 0, 0, 1, 1,
-0.2767228, -0.9809332, -3.485152, 1, 0, 0, 1, 1,
-0.2760175, -0.5594516, -1.946922, 1, 0, 0, 1, 1,
-0.2679956, -0.3423419, -3.629865, 0, 0, 0, 1, 1,
-0.2653695, 1.27069, -0.1495724, 0, 0, 0, 1, 1,
-0.2638989, 0.625407, -2.045685, 0, 0, 0, 1, 1,
-0.2615171, -1.222474, -3.099438, 0, 0, 0, 1, 1,
-0.2582925, -0.3262361, -0.9456791, 0, 0, 0, 1, 1,
-0.2563949, -2.438966, -2.211155, 0, 0, 0, 1, 1,
-0.2536974, 0.2287284, 0.122247, 0, 0, 0, 1, 1,
-0.2514421, -0.3147504, -3.712417, 1, 1, 1, 1, 1,
-0.2506656, -0.2183219, -2.563767, 1, 1, 1, 1, 1,
-0.2437011, -1.209724, -3.861867, 1, 1, 1, 1, 1,
-0.24043, -0.1503214, -1.690807, 1, 1, 1, 1, 1,
-0.2381837, -0.3819749, -2.901705, 1, 1, 1, 1, 1,
-0.236807, -1.114175, -3.681478, 1, 1, 1, 1, 1,
-0.2353177, 1.207849, 1.539677, 1, 1, 1, 1, 1,
-0.2348176, -0.7141927, -1.32328, 1, 1, 1, 1, 1,
-0.2338948, 0.234225, -1.482264, 1, 1, 1, 1, 1,
-0.2324948, 2.628094, 0.5297928, 1, 1, 1, 1, 1,
-0.2313927, -0.5691989, -3.236268, 1, 1, 1, 1, 1,
-0.2272044, 0.5402294, -0.2530882, 1, 1, 1, 1, 1,
-0.2265111, -0.6718335, -3.453614, 1, 1, 1, 1, 1,
-0.2206593, -1.142578, -1.949362, 1, 1, 1, 1, 1,
-0.2171065, -0.7205359, -4.424501, 1, 1, 1, 1, 1,
-0.2164613, -1.539398, -1.656398, 0, 0, 1, 1, 1,
-0.2163891, -0.7210726, -3.226084, 1, 0, 0, 1, 1,
-0.2141424, 1.069559, 1.555812, 1, 0, 0, 1, 1,
-0.2080535, -1.292699, -2.591198, 1, 0, 0, 1, 1,
-0.2012811, -0.8084504, -3.180861, 1, 0, 0, 1, 1,
-0.1996256, 0.7090005, -0.7690713, 1, 0, 0, 1, 1,
-0.1991078, -3.068609, -3.724656, 0, 0, 0, 1, 1,
-0.1981685, -1.901264, -4.271255, 0, 0, 0, 1, 1,
-0.1969968, 1.551767, -0.005912328, 0, 0, 0, 1, 1,
-0.1968571, 0.6102962, -1.675108, 0, 0, 0, 1, 1,
-0.1933255, 1.33242, 0.5388299, 0, 0, 0, 1, 1,
-0.1900158, -0.2972926, -2.891841, 0, 0, 0, 1, 1,
-0.1851534, 0.7480171, -1.744128, 0, 0, 0, 1, 1,
-0.1835118, -0.9648311, -1.76537, 1, 1, 1, 1, 1,
-0.1817613, -0.2734583, -1.404051, 1, 1, 1, 1, 1,
-0.1800556, 0.3819664, -0.8781508, 1, 1, 1, 1, 1,
-0.1749131, -0.9710482, -5.466969, 1, 1, 1, 1, 1,
-0.1734679, -0.5983536, -2.834198, 1, 1, 1, 1, 1,
-0.1682865, 0.4818394, -0.3695359, 1, 1, 1, 1, 1,
-0.1635909, -0.09489079, -1.538002, 1, 1, 1, 1, 1,
-0.1585716, -0.9665483, -3.257192, 1, 1, 1, 1, 1,
-0.1545143, -1.666869, -2.931492, 1, 1, 1, 1, 1,
-0.1527539, 0.7814137, -1.386099, 1, 1, 1, 1, 1,
-0.1516614, 1.381057, -0.1238768, 1, 1, 1, 1, 1,
-0.1481038, -0.9819655, -0.8789406, 1, 1, 1, 1, 1,
-0.1473375, 0.2797112, -0.2745954, 1, 1, 1, 1, 1,
-0.138178, 0.1822687, -1.002069, 1, 1, 1, 1, 1,
-0.1303544, -1.001341, -2.583222, 1, 1, 1, 1, 1,
-0.1202206, -0.6571933, -2.872524, 0, 0, 1, 1, 1,
-0.1197496, -0.04304368, -2.691194, 1, 0, 0, 1, 1,
-0.1157126, -1.066053, -2.839529, 1, 0, 0, 1, 1,
-0.1104746, 0.4487567, 1.086068, 1, 0, 0, 1, 1,
-0.1060483, -1.243294, -2.836027, 1, 0, 0, 1, 1,
-0.1059165, -0.4724671, -3.606532, 1, 0, 0, 1, 1,
-0.1050124, 0.5872974, 0.4694756, 0, 0, 0, 1, 1,
-0.1016107, 2.623112, -0.03569343, 0, 0, 0, 1, 1,
-0.1007771, -0.9222611, -2.916764, 0, 0, 0, 1, 1,
-0.09914377, 0.6060641, 0.478774, 0, 0, 0, 1, 1,
-0.09908194, -0.2196495, -2.992619, 0, 0, 0, 1, 1,
-0.09866617, -0.5872636, -1.735318, 0, 0, 0, 1, 1,
-0.09535527, 1.562283, -0.514043, 0, 0, 0, 1, 1,
-0.09510668, 0.2023057, -0.8367258, 1, 1, 1, 1, 1,
-0.09306996, 0.2652689, -1.906096, 1, 1, 1, 1, 1,
-0.09218409, -0.4383824, -2.088839, 1, 1, 1, 1, 1,
-0.08928517, -0.6070423, -2.383102, 1, 1, 1, 1, 1,
-0.08864135, 0.4760456, -0.06832428, 1, 1, 1, 1, 1,
-0.08822571, -0.5505849, -2.757501, 1, 1, 1, 1, 1,
-0.08552727, 0.2910271, -1.188751, 1, 1, 1, 1, 1,
-0.08395782, -0.3619929, -1.997363, 1, 1, 1, 1, 1,
-0.08330292, -0.4406559, -3.998888, 1, 1, 1, 1, 1,
-0.07610388, -0.362869, -2.447244, 1, 1, 1, 1, 1,
-0.0756171, -0.09477206, -1.209398, 1, 1, 1, 1, 1,
-0.07475721, 0.06444133, -2.255176, 1, 1, 1, 1, 1,
-0.0737462, 0.1325192, 0.08783574, 1, 1, 1, 1, 1,
-0.07026721, -0.02919323, -1.663966, 1, 1, 1, 1, 1,
-0.07002168, -0.7770497, -2.172218, 1, 1, 1, 1, 1,
-0.06933716, 0.4718601, -0.1766744, 0, 0, 1, 1, 1,
-0.06886696, -0.6509336, -3.611818, 1, 0, 0, 1, 1,
-0.06748962, -1.097985, -2.066493, 1, 0, 0, 1, 1,
-0.05907924, -0.0462511, -1.55614, 1, 0, 0, 1, 1,
-0.05893564, 0.2245105, -0.3832772, 1, 0, 0, 1, 1,
-0.05870985, -0.5193025, -3.567178, 1, 0, 0, 1, 1,
-0.05736827, 0.4267323, 0.440136, 0, 0, 0, 1, 1,
-0.05356723, 1.43289, 0.6506566, 0, 0, 0, 1, 1,
-0.05073937, -0.220617, -3.190017, 0, 0, 0, 1, 1,
-0.05043241, -0.5243688, -3.074767, 0, 0, 0, 1, 1,
-0.04948816, 0.9031423, 1.809842, 0, 0, 0, 1, 1,
-0.04131223, -0.9188555, -2.073254, 0, 0, 0, 1, 1,
-0.03862783, 1.282901, 0.2073134, 0, 0, 0, 1, 1,
-0.03713193, 0.1056947, -0.5646737, 1, 1, 1, 1, 1,
-0.02675385, 2.477206, 1.221223, 1, 1, 1, 1, 1,
-0.02082973, -0.7099802, -2.992959, 1, 1, 1, 1, 1,
-0.01945619, -0.6195445, -4.447961, 1, 1, 1, 1, 1,
-0.01790926, 0.8028168, -0.2418009, 1, 1, 1, 1, 1,
-0.0170594, -2.075579, -2.967012, 1, 1, 1, 1, 1,
-0.008544087, 1.627178, -0.8787684, 1, 1, 1, 1, 1,
-0.007059315, -1.239516, -2.588663, 1, 1, 1, 1, 1,
-0.004102787, -0.8196685, -5.410245, 1, 1, 1, 1, 1,
-0.003485778, 1.535717, -0.2715284, 1, 1, 1, 1, 1,
-0.003187185, 1.157667, 1.075101, 1, 1, 1, 1, 1,
0.0003527309, -1.906722, 3.047742, 1, 1, 1, 1, 1,
0.002404805, -0.6353824, 4.102901, 1, 1, 1, 1, 1,
0.00388277, 0.009788496, 0.4902361, 1, 1, 1, 1, 1,
0.006973451, -0.9317394, 3.488517, 1, 1, 1, 1, 1,
0.009054868, -0.2417715, 2.892404, 0, 0, 1, 1, 1,
0.01006837, -0.7706929, 2.967775, 1, 0, 0, 1, 1,
0.0140441, -0.02835474, 1.957863, 1, 0, 0, 1, 1,
0.01754288, 0.3601165, 0.1202539, 1, 0, 0, 1, 1,
0.01849752, 0.302732, 0.1212525, 1, 0, 0, 1, 1,
0.01900102, -0.4780367, 5.077897, 1, 0, 0, 1, 1,
0.0201915, 1.178948, -0.1551459, 0, 0, 0, 1, 1,
0.02427404, -0.0153362, 0.907663, 0, 0, 0, 1, 1,
0.02502237, 1.120767, 0.2549926, 0, 0, 0, 1, 1,
0.03081718, -0.1997707, 2.806341, 0, 0, 0, 1, 1,
0.0310112, 1.735297, 1.180966, 0, 0, 0, 1, 1,
0.03165776, -1.400577, 1.84932, 0, 0, 0, 1, 1,
0.03482663, -0.1195215, 5.225425, 0, 0, 0, 1, 1,
0.04097575, -0.6329034, 2.929023, 1, 1, 1, 1, 1,
0.04236663, 1.838341, 0.6149703, 1, 1, 1, 1, 1,
0.04525287, -0.5406979, 2.341754, 1, 1, 1, 1, 1,
0.04657038, 1.102601, -0.08469051, 1, 1, 1, 1, 1,
0.04664706, 0.7196743, 0.4715765, 1, 1, 1, 1, 1,
0.05286263, -0.1487535, 2.262043, 1, 1, 1, 1, 1,
0.05890607, 1.322337, -1.333944, 1, 1, 1, 1, 1,
0.05932623, 0.8581082, 0.1807768, 1, 1, 1, 1, 1,
0.06048296, -0.9836684, 2.732539, 1, 1, 1, 1, 1,
0.06076725, 0.648762, 0.2071488, 1, 1, 1, 1, 1,
0.06086411, -1.3532, 3.35765, 1, 1, 1, 1, 1,
0.06175401, -0.2339419, 3.976353, 1, 1, 1, 1, 1,
0.06494325, 1.306541, -0.4103411, 1, 1, 1, 1, 1,
0.06651261, 0.223857, 0.9508586, 1, 1, 1, 1, 1,
0.06968648, 0.9146299, -0.5440222, 1, 1, 1, 1, 1,
0.07056007, -0.8835855, 4.315115, 0, 0, 1, 1, 1,
0.07533515, 0.08903681, 1.279779, 1, 0, 0, 1, 1,
0.07644232, 0.8661774, 1.135064, 1, 0, 0, 1, 1,
0.07957289, 0.4874005, -0.9097033, 1, 0, 0, 1, 1,
0.0899331, -0.481268, 1.500952, 1, 0, 0, 1, 1,
0.0911148, -1.125125, 4.592567, 1, 0, 0, 1, 1,
0.09461484, 1.485078, -0.5937096, 0, 0, 0, 1, 1,
0.09463602, 0.7652352, 1.709193, 0, 0, 0, 1, 1,
0.09632067, -1.086008, 3.641139, 0, 0, 0, 1, 1,
0.09713241, 0.167385, 0.7912632, 0, 0, 0, 1, 1,
0.09813965, -0.6049559, 2.551303, 0, 0, 0, 1, 1,
0.1015429, -0.5543657, 3.354011, 0, 0, 0, 1, 1,
0.1046276, -0.6116067, 2.471054, 0, 0, 0, 1, 1,
0.1074897, -1.986789, 3.37096, 1, 1, 1, 1, 1,
0.1099333, 0.06389207, 1.505758, 1, 1, 1, 1, 1,
0.1155072, -0.1227951, 2.68242, 1, 1, 1, 1, 1,
0.1198103, -2.54188, 3.029066, 1, 1, 1, 1, 1,
0.1215586, 0.7123076, 1.285882, 1, 1, 1, 1, 1,
0.1218485, 1.634832, 1.153388, 1, 1, 1, 1, 1,
0.1285256, -1.181207, 1.477281, 1, 1, 1, 1, 1,
0.1304574, 0.512746, 1.284553, 1, 1, 1, 1, 1,
0.1310552, 0.8275551, 0.6076677, 1, 1, 1, 1, 1,
0.1349221, 0.5044004, 0.8594372, 1, 1, 1, 1, 1,
0.137401, 1.407111, -0.4150135, 1, 1, 1, 1, 1,
0.1382341, 0.2213395, 1.282613, 1, 1, 1, 1, 1,
0.1396575, 1.30965, -1.097641, 1, 1, 1, 1, 1,
0.1421555, -0.05105454, 1.715644, 1, 1, 1, 1, 1,
0.146758, -2.028823, 5.059626, 1, 1, 1, 1, 1,
0.1481335, -0.2277782, 4.256439, 0, 0, 1, 1, 1,
0.1504937, -1.053488, 3.067398, 1, 0, 0, 1, 1,
0.1607247, -2.418241, 3.543719, 1, 0, 0, 1, 1,
0.1608166, 0.4795162, 0.4664302, 1, 0, 0, 1, 1,
0.1672411, 0.0613499, 1.588435, 1, 0, 0, 1, 1,
0.1700474, 0.2161492, -0.6276711, 1, 0, 0, 1, 1,
0.1700706, -0.7661822, 3.113065, 0, 0, 0, 1, 1,
0.1708596, -1.269683, 1.562078, 0, 0, 0, 1, 1,
0.1721586, 1.403957, 1.024462, 0, 0, 0, 1, 1,
0.1762448, -0.5389088, 3.26724, 0, 0, 0, 1, 1,
0.1775113, -0.05123026, 2.14086, 0, 0, 0, 1, 1,
0.1789211, -0.4399022, 5.269973, 0, 0, 0, 1, 1,
0.1795417, -0.6966279, 3.834074, 0, 0, 0, 1, 1,
0.1820044, 0.8719189, 0.7039792, 1, 1, 1, 1, 1,
0.1840308, -0.1510282, 1.663062, 1, 1, 1, 1, 1,
0.1866583, -0.244998, 3.501064, 1, 1, 1, 1, 1,
0.1874044, 0.4809508, 2.482813, 1, 1, 1, 1, 1,
0.1886049, -1.13385, 2.751386, 1, 1, 1, 1, 1,
0.189825, 1.158543, -0.07810017, 1, 1, 1, 1, 1,
0.1911031, 0.5653078, 0.2251119, 1, 1, 1, 1, 1,
0.1948131, 0.6801375, 0.2849882, 1, 1, 1, 1, 1,
0.1948762, -1.027077, 3.74714, 1, 1, 1, 1, 1,
0.1977141, 1.172862, -1.347071, 1, 1, 1, 1, 1,
0.2008101, 1.044363, -0.6671264, 1, 1, 1, 1, 1,
0.2062809, 0.06175478, 1.105624, 1, 1, 1, 1, 1,
0.2067928, 0.9172401, -0.6404797, 1, 1, 1, 1, 1,
0.2068468, 0.766202, 1.467647, 1, 1, 1, 1, 1,
0.2086372, -0.4034244, 2.626922, 1, 1, 1, 1, 1,
0.2169446, 0.8058063, -0.7146047, 0, 0, 1, 1, 1,
0.231287, 0.4702271, 1.167445, 1, 0, 0, 1, 1,
0.2341181, -0.7104703, 2.455239, 1, 0, 0, 1, 1,
0.2354385, -0.1991236, 3.694445, 1, 0, 0, 1, 1,
0.2366938, 0.4583389, 1.864089, 1, 0, 0, 1, 1,
0.2433, -0.02620371, 1.847707, 1, 0, 0, 1, 1,
0.2439595, 0.2875458, 1.872548, 0, 0, 0, 1, 1,
0.2442922, 0.56738, -0.2401995, 0, 0, 0, 1, 1,
0.2461908, 0.6738778, 0.8798457, 0, 0, 0, 1, 1,
0.2466753, -0.6471425, 2.046294, 0, 0, 0, 1, 1,
0.2472666, -0.853866, 1.933293, 0, 0, 0, 1, 1,
0.2473348, 0.5683089, 0.01879942, 0, 0, 0, 1, 1,
0.2494787, 1.26213, 0.5342558, 0, 0, 0, 1, 1,
0.2583109, -1.034817, 3.821008, 1, 1, 1, 1, 1,
0.2632523, 0.07641351, 1.629154, 1, 1, 1, 1, 1,
0.2652709, 0.1259523, 2.273438, 1, 1, 1, 1, 1,
0.2691672, -0.2977999, 1.982618, 1, 1, 1, 1, 1,
0.2713922, -0.8512235, 2.245536, 1, 1, 1, 1, 1,
0.2755312, 0.09284353, -0.3339726, 1, 1, 1, 1, 1,
0.2755386, 0.277012, 1.170137, 1, 1, 1, 1, 1,
0.2834563, 0.9450846, 0.1720857, 1, 1, 1, 1, 1,
0.2850778, -0.2219242, 4.595658, 1, 1, 1, 1, 1,
0.2851574, 0.1882363, 0.261766, 1, 1, 1, 1, 1,
0.2984298, 1.954533, 0.2336349, 1, 1, 1, 1, 1,
0.2985384, -0.5856677, 2.663391, 1, 1, 1, 1, 1,
0.3014939, 1.860595, 0.8465713, 1, 1, 1, 1, 1,
0.3044257, -1.417892, 2.369828, 1, 1, 1, 1, 1,
0.3048494, 0.2029749, 1.959101, 1, 1, 1, 1, 1,
0.30523, 0.2425843, -0.5507851, 0, 0, 1, 1, 1,
0.3086522, 1.67142, 1.459575, 1, 0, 0, 1, 1,
0.310241, -0.7772986, 0.7850261, 1, 0, 0, 1, 1,
0.3110017, 0.5201976, 1.145982, 1, 0, 0, 1, 1,
0.3126652, 0.6135054, -1.162154, 1, 0, 0, 1, 1,
0.3131434, 0.8615693, 0.6372749, 1, 0, 0, 1, 1,
0.3154154, 0.8055925, 1.251961, 0, 0, 0, 1, 1,
0.3156755, 0.802694, 1.039554, 0, 0, 0, 1, 1,
0.3214031, 0.9073731, -0.4121651, 0, 0, 0, 1, 1,
0.3222022, 1.162043, 0.2519599, 0, 0, 0, 1, 1,
0.3222196, -0.3007266, 3.07219, 0, 0, 0, 1, 1,
0.3239242, -0.6247774, 2.171468, 0, 0, 0, 1, 1,
0.3276879, -0.95323, 1.827422, 0, 0, 0, 1, 1,
0.3288988, 1.167588, -0.6547317, 1, 1, 1, 1, 1,
0.3368767, -0.4073225, 1.724688, 1, 1, 1, 1, 1,
0.3382976, -0.2225093, 1.923739, 1, 1, 1, 1, 1,
0.338677, 0.1612745, 0.8712128, 1, 1, 1, 1, 1,
0.3392726, -1.131631, 3.825542, 1, 1, 1, 1, 1,
0.3393691, -1.865518, 3.884105, 1, 1, 1, 1, 1,
0.3424879, -0.7727777, 2.788634, 1, 1, 1, 1, 1,
0.3429716, 0.3373365, -0.8250337, 1, 1, 1, 1, 1,
0.3430102, 1.773354, -1.993847, 1, 1, 1, 1, 1,
0.343846, -0.7881197, 4.412283, 1, 1, 1, 1, 1,
0.3443721, -0.4025305, 2.787258, 1, 1, 1, 1, 1,
0.3474791, -1.939297, 0.9029332, 1, 1, 1, 1, 1,
0.3485841, -0.1741606, 1.636706, 1, 1, 1, 1, 1,
0.3572918, 0.01928764, 1.659685, 1, 1, 1, 1, 1,
0.3600411, 0.1953066, 1.34724, 1, 1, 1, 1, 1,
0.3729438, -1.991268, 3.246409, 0, 0, 1, 1, 1,
0.3742688, -1.476434, 3.600773, 1, 0, 0, 1, 1,
0.3822984, 0.2656296, 0.2495891, 1, 0, 0, 1, 1,
0.3850407, -0.5351654, 2.395112, 1, 0, 0, 1, 1,
0.3853146, 0.8745943, 0.2745266, 1, 0, 0, 1, 1,
0.3898137, -0.896697, 3.979275, 1, 0, 0, 1, 1,
0.3945281, -1.528162, 2.557627, 0, 0, 0, 1, 1,
0.3960713, -0.8512989, 1.238083, 0, 0, 0, 1, 1,
0.3961411, -0.1809464, 3.629538, 0, 0, 0, 1, 1,
0.3980276, -0.2073691, 3.870132, 0, 0, 0, 1, 1,
0.4050742, -0.8955562, 1.71188, 0, 0, 0, 1, 1,
0.4064606, 1.544349, 0.5721222, 0, 0, 0, 1, 1,
0.4092861, -0.5994135, 3.206291, 0, 0, 0, 1, 1,
0.4113386, -0.6726702, 3.367445, 1, 1, 1, 1, 1,
0.4114023, 0.2453879, -0.1191498, 1, 1, 1, 1, 1,
0.4120504, 0.3329305, 1.552247, 1, 1, 1, 1, 1,
0.4163431, 2.056401, -0.9939945, 1, 1, 1, 1, 1,
0.4171364, 0.1145414, 1.785375, 1, 1, 1, 1, 1,
0.4184847, 0.5309066, 1.876294, 1, 1, 1, 1, 1,
0.420297, -0.5900208, 1.559393, 1, 1, 1, 1, 1,
0.4216555, -0.4263852, 3.262613, 1, 1, 1, 1, 1,
0.4229402, 1.555381, -0.9120659, 1, 1, 1, 1, 1,
0.4266899, 0.2303479, 0.8629296, 1, 1, 1, 1, 1,
0.4292793, -0.9075994, 4.312145, 1, 1, 1, 1, 1,
0.4299226, -0.3429981, 4.568262, 1, 1, 1, 1, 1,
0.4305474, 0.4729064, 1.020391, 1, 1, 1, 1, 1,
0.4322386, -0.1939219, 2.168262, 1, 1, 1, 1, 1,
0.4357097, -0.1269079, 3.103814, 1, 1, 1, 1, 1,
0.4417141, -0.5457435, 1.859323, 0, 0, 1, 1, 1,
0.4447263, 1.154808, 1.85734, 1, 0, 0, 1, 1,
0.4482205, -0.209016, 3.295422, 1, 0, 0, 1, 1,
0.4543509, 0.3066827, 1.714333, 1, 0, 0, 1, 1,
0.4547091, -0.1157594, 2.935197, 1, 0, 0, 1, 1,
0.4565068, 0.9555367, -0.05581934, 1, 0, 0, 1, 1,
0.4569679, 0.697664, -0.9073204, 0, 0, 0, 1, 1,
0.4601965, -1.743096, 3.311706, 0, 0, 0, 1, 1,
0.4610808, -1.221491, 2.597373, 0, 0, 0, 1, 1,
0.466666, -0.6656818, 3.073048, 0, 0, 0, 1, 1,
0.469279, 0.3482312, -0.1361177, 0, 0, 0, 1, 1,
0.4708063, -0.9711758, 1.463716, 0, 0, 0, 1, 1,
0.4713146, -0.602159, 1.586682, 0, 0, 0, 1, 1,
0.4725261, -0.05346857, 2.260846, 1, 1, 1, 1, 1,
0.4746451, -0.197483, 1.703657, 1, 1, 1, 1, 1,
0.4772278, 0.2282094, 1.149252, 1, 1, 1, 1, 1,
0.4799252, 0.8333905, 0.1506234, 1, 1, 1, 1, 1,
0.480275, -0.6268771, 1.074012, 1, 1, 1, 1, 1,
0.4806398, 1.528821, 0.09322293, 1, 1, 1, 1, 1,
0.4852534, -1.077158, 2.042706, 1, 1, 1, 1, 1,
0.4855722, 0.7535455, 0.2384191, 1, 1, 1, 1, 1,
0.485943, 0.1328973, 2.577061, 1, 1, 1, 1, 1,
0.4864344, 0.3376244, 1.817881, 1, 1, 1, 1, 1,
0.4932907, 1.241155, 0.691934, 1, 1, 1, 1, 1,
0.497189, -0.581738, 1.384547, 1, 1, 1, 1, 1,
0.4984276, -0.7443183, 3.799568, 1, 1, 1, 1, 1,
0.5008758, -1.007364, 3.81547, 1, 1, 1, 1, 1,
0.5056198, 0.2802472, 1.158303, 1, 1, 1, 1, 1,
0.5088402, 0.6668023, 0.4142159, 0, 0, 1, 1, 1,
0.5096649, 0.4119467, -1.615794, 1, 0, 0, 1, 1,
0.5129716, 0.06659738, 0.217491, 1, 0, 0, 1, 1,
0.5132809, -0.6495154, 2.54132, 1, 0, 0, 1, 1,
0.5138758, -0.2316798, 1.389438, 1, 0, 0, 1, 1,
0.5147522, -1.439429, 2.294731, 1, 0, 0, 1, 1,
0.5171097, 0.9134452, -0.6632857, 0, 0, 0, 1, 1,
0.5184251, 1.485518, 1.476307, 0, 0, 0, 1, 1,
0.5222554, -0.4825176, 2.340213, 0, 0, 0, 1, 1,
0.5229796, -0.8617817, 0.6428617, 0, 0, 0, 1, 1,
0.5235835, 0.1288696, 0.9992818, 0, 0, 0, 1, 1,
0.5250193, 0.05631446, 2.494724, 0, 0, 0, 1, 1,
0.5279189, -0.6467748, 1.461115, 0, 0, 0, 1, 1,
0.5279387, 1.284626, 0.536029, 1, 1, 1, 1, 1,
0.528511, 0.5486124, 0.4063101, 1, 1, 1, 1, 1,
0.5347429, 1.169923, -0.06484195, 1, 1, 1, 1, 1,
0.5378923, 0.8139737, 0.7739975, 1, 1, 1, 1, 1,
0.5412926, -0.634497, 2.401579, 1, 1, 1, 1, 1,
0.5417973, -0.6973237, 3.697943, 1, 1, 1, 1, 1,
0.549215, -0.7179791, 2.846033, 1, 1, 1, 1, 1,
0.5528414, 0.05765862, 2.335461, 1, 1, 1, 1, 1,
0.553575, -0.4102984, 2.284972, 1, 1, 1, 1, 1,
0.5541436, -0.8724557, 2.292875, 1, 1, 1, 1, 1,
0.5549102, 0.008421023, 2.210472, 1, 1, 1, 1, 1,
0.5561393, 1.52795, -0.4188357, 1, 1, 1, 1, 1,
0.5574509, -0.5739775, 1.249594, 1, 1, 1, 1, 1,
0.5576911, -1.211664, 3.981873, 1, 1, 1, 1, 1,
0.5636755, -0.4296472, 2.409382, 1, 1, 1, 1, 1,
0.5638496, 0.5120605, 0.6692241, 0, 0, 1, 1, 1,
0.5686116, -0.7809528, 3.04254, 1, 0, 0, 1, 1,
0.5714229, -1.771834, 3.444617, 1, 0, 0, 1, 1,
0.5716053, -1.641151, 3.767679, 1, 0, 0, 1, 1,
0.5739841, -0.1284762, 1.724862, 1, 0, 0, 1, 1,
0.5740218, -0.6633764, 1.57416, 1, 0, 0, 1, 1,
0.5811439, 0.7496598, -0.7131914, 0, 0, 0, 1, 1,
0.5865397, -1.183042, 2.416385, 0, 0, 0, 1, 1,
0.5912207, 0.1725437, 1.676399, 0, 0, 0, 1, 1,
0.5963739, -1.241661, 2.074987, 0, 0, 0, 1, 1,
0.5979528, -0.01533671, 2.45345, 0, 0, 0, 1, 1,
0.5985005, -0.02421428, 0.2216502, 0, 0, 0, 1, 1,
0.599192, -1.071734, 3.012737, 0, 0, 0, 1, 1,
0.6030149, -0.6422464, 1.784683, 1, 1, 1, 1, 1,
0.6108778, 0.1308582, 0.8842297, 1, 1, 1, 1, 1,
0.6135067, -0.8767351, 2.174539, 1, 1, 1, 1, 1,
0.6139433, -1.053133, 2.615773, 1, 1, 1, 1, 1,
0.6143102, -0.2739538, 1.436117, 1, 1, 1, 1, 1,
0.621781, -0.008720919, 1.183147, 1, 1, 1, 1, 1,
0.6232321, -0.7693074, 2.787415, 1, 1, 1, 1, 1,
0.6233026, -0.645317, 3.363675, 1, 1, 1, 1, 1,
0.6263235, -0.8031858, 2.516505, 1, 1, 1, 1, 1,
0.6264921, 1.058995, 0.2651921, 1, 1, 1, 1, 1,
0.6275069, 0.3383371, 1.622731, 1, 1, 1, 1, 1,
0.6275593, -0.1216077, 2.34764, 1, 1, 1, 1, 1,
0.6294373, -0.7901474, 3.299898, 1, 1, 1, 1, 1,
0.6304138, 0.5244202, 0.1167977, 1, 1, 1, 1, 1,
0.6364241, 0.52004, 1.376704, 1, 1, 1, 1, 1,
0.6379967, 1.396181, -0.824356, 0, 0, 1, 1, 1,
0.6437457, -0.8741292, 1.814693, 1, 0, 0, 1, 1,
0.648909, -0.10355, 3.936162, 1, 0, 0, 1, 1,
0.6547099, 1.922413, -0.6293789, 1, 0, 0, 1, 1,
0.6641814, -1.229053, 1.596526, 1, 0, 0, 1, 1,
0.6728506, 0.4481205, 1.939474, 1, 0, 0, 1, 1,
0.6869662, -2.067687, 0.944552, 0, 0, 0, 1, 1,
0.6887558, 0.3688636, 1.37395, 0, 0, 0, 1, 1,
0.6909582, -0.8561648, 3.903859, 0, 0, 0, 1, 1,
0.6942154, -1.515966, 3.47257, 0, 0, 0, 1, 1,
0.6972084, -0.5702708, 0.878864, 0, 0, 0, 1, 1,
0.698332, 0.002648754, 2.094701, 0, 0, 0, 1, 1,
0.7063149, -0.654554, 2.215386, 0, 0, 0, 1, 1,
0.7081432, -1.390494, 2.774504, 1, 1, 1, 1, 1,
0.7083033, -0.1199199, 2.17352, 1, 1, 1, 1, 1,
0.7135921, 0.9358208, 0.524781, 1, 1, 1, 1, 1,
0.7137187, -0.2116446, 4.217924, 1, 1, 1, 1, 1,
0.7144166, 1.264924, -0.3954948, 1, 1, 1, 1, 1,
0.7183597, 1.432766, 2.394029, 1, 1, 1, 1, 1,
0.7210413, 1.728278, -0.2178452, 1, 1, 1, 1, 1,
0.7224072, 0.2127686, 2.642416, 1, 1, 1, 1, 1,
0.7257684, -1.071352, 3.822247, 1, 1, 1, 1, 1,
0.7270426, 0.09732822, 1.812425, 1, 1, 1, 1, 1,
0.7275935, 0.4983638, 0.604665, 1, 1, 1, 1, 1,
0.7337064, -0.3692047, 1.587229, 1, 1, 1, 1, 1,
0.7346916, -0.08294851, 2.750262, 1, 1, 1, 1, 1,
0.739183, 2.464646, 1.002665, 1, 1, 1, 1, 1,
0.7402279, -1.628019, 2.500637, 1, 1, 1, 1, 1,
0.741689, -1.102211, 2.437841, 0, 0, 1, 1, 1,
0.7448726, -0.3537863, 2.529526, 1, 0, 0, 1, 1,
0.7460213, 0.7587805, 0.9491861, 1, 0, 0, 1, 1,
0.748602, -0.7818201, 1.927758, 1, 0, 0, 1, 1,
0.7504334, -1.211624, 2.889331, 1, 0, 0, 1, 1,
0.761106, -0.6600857, 1.868924, 1, 0, 0, 1, 1,
0.7700253, -1.346922, 3.838673, 0, 0, 0, 1, 1,
0.7715447, 0.5288527, 0.1070488, 0, 0, 0, 1, 1,
0.7743953, -0.3124477, 2.762818, 0, 0, 0, 1, 1,
0.78758, -0.1939597, 3.131164, 0, 0, 0, 1, 1,
0.793812, -2.055081, 3.26811, 0, 0, 0, 1, 1,
0.7939847, 1.549398, 0.3248841, 0, 0, 0, 1, 1,
0.7940794, -0.01791645, 3.331528, 0, 0, 0, 1, 1,
0.7947745, -0.9158479, 2.724435, 1, 1, 1, 1, 1,
0.798467, 1.1245, -1.197903, 1, 1, 1, 1, 1,
0.7997029, 0.9514992, -0.2710638, 1, 1, 1, 1, 1,
0.8008854, -1.047537, 3.536734, 1, 1, 1, 1, 1,
0.8338042, -0.2953382, 1.874251, 1, 1, 1, 1, 1,
0.8442679, -0.1703874, 0.3102488, 1, 1, 1, 1, 1,
0.8442931, 0.5451582, 1.428302, 1, 1, 1, 1, 1,
0.84485, -0.1882832, 2.387241, 1, 1, 1, 1, 1,
0.8493716, -1.13863, 2.744422, 1, 1, 1, 1, 1,
0.8530506, -1.210205, 2.135205, 1, 1, 1, 1, 1,
0.859241, -0.3011546, 1.855087, 1, 1, 1, 1, 1,
0.8684135, -1.176233, 2.143765, 1, 1, 1, 1, 1,
0.8763998, 0.01915717, 1.827443, 1, 1, 1, 1, 1,
0.8898571, -0.2114365, 0.6026755, 1, 1, 1, 1, 1,
0.8900645, -2.684687, 2.021555, 1, 1, 1, 1, 1,
0.8913746, 1.089642, -1.129218, 0, 0, 1, 1, 1,
0.8936643, -0.5622329, 2.022747, 1, 0, 0, 1, 1,
0.8965202, -0.185999, 0.7258419, 1, 0, 0, 1, 1,
0.8971937, 0.08837716, 2.201758, 1, 0, 0, 1, 1,
0.9002666, -1.17338, 0.4938985, 1, 0, 0, 1, 1,
0.9051343, 1.081858, 2.636944, 1, 0, 0, 1, 1,
0.9226089, 0.7808951, 0.923245, 0, 0, 0, 1, 1,
0.9299235, -0.2249699, 2.83598, 0, 0, 0, 1, 1,
0.9309079, -0.2598881, 3.066644, 0, 0, 0, 1, 1,
0.9393193, -1.121697, 4.652056, 0, 0, 0, 1, 1,
0.9411739, 0.3576469, 0.3582938, 0, 0, 0, 1, 1,
0.9415276, 0.5115016, 2.728415, 0, 0, 0, 1, 1,
0.9489363, 0.4704894, 3.040332, 0, 0, 0, 1, 1,
0.9548434, -1.090894, 2.51261, 1, 1, 1, 1, 1,
0.9570189, 0.2828946, 1.643937, 1, 1, 1, 1, 1,
0.95876, 1.734802, 1.397069, 1, 1, 1, 1, 1,
0.9658133, 0.9802263, 0.4963669, 1, 1, 1, 1, 1,
0.9739121, -1.06593, 1.793708, 1, 1, 1, 1, 1,
0.9752532, 0.1392698, 1.56398, 1, 1, 1, 1, 1,
0.9758506, 1.653694, 1.514466, 1, 1, 1, 1, 1,
0.9774821, 1.506662, -0.4581208, 1, 1, 1, 1, 1,
0.9779496, 0.6935979, 0.1727355, 1, 1, 1, 1, 1,
0.9815628, 1.801163, 0.1406895, 1, 1, 1, 1, 1,
0.982715, -0.5634167, 2.593821, 1, 1, 1, 1, 1,
0.989071, 0.3158107, 1.699377, 1, 1, 1, 1, 1,
0.9943767, -0.7694344, 1.844482, 1, 1, 1, 1, 1,
0.9949565, -0.8216509, 0.8708802, 1, 1, 1, 1, 1,
1.005523, -0.04336791, 1.962787, 1, 1, 1, 1, 1,
1.012476, 0.03391855, 1.010184, 0, 0, 1, 1, 1,
1.012662, 0.009563557, 0.6247255, 1, 0, 0, 1, 1,
1.012999, 1.987898, 1.065304, 1, 0, 0, 1, 1,
1.018513, -0.1522766, 2.141038, 1, 0, 0, 1, 1,
1.019548, 1.712878, 0.4075557, 1, 0, 0, 1, 1,
1.020739, 1.697726, 0.8145854, 1, 0, 0, 1, 1,
1.024236, -0.05410752, 1.322478, 0, 0, 0, 1, 1,
1.024686, -0.8256536, 3.758971, 0, 0, 0, 1, 1,
1.027486, -0.9152251, 2.038949, 0, 0, 0, 1, 1,
1.028482, -1.124526, 2.620622, 0, 0, 0, 1, 1,
1.03585, 1.511116, 0.3808471, 0, 0, 0, 1, 1,
1.043609, 0.2440725, 2.671117, 0, 0, 0, 1, 1,
1.044389, 0.0679848, 2.010708, 0, 0, 0, 1, 1,
1.045349, -0.09469908, 1.736183, 1, 1, 1, 1, 1,
1.048469, 1.275357, -0.6079067, 1, 1, 1, 1, 1,
1.053254, -0.5373464, 3.155034, 1, 1, 1, 1, 1,
1.05668, -0.4388669, 2.24113, 1, 1, 1, 1, 1,
1.061821, 1.769219, 0.02750755, 1, 1, 1, 1, 1,
1.082933, -0.4953939, 0.2394448, 1, 1, 1, 1, 1,
1.090933, 0.5308816, 0.6323246, 1, 1, 1, 1, 1,
1.092432, -0.3567909, 2.48632, 1, 1, 1, 1, 1,
1.093687, 0.4135897, 1.423719, 1, 1, 1, 1, 1,
1.095469, 1.147653, 2.824147, 1, 1, 1, 1, 1,
1.098221, 0.4169589, 0.8524916, 1, 1, 1, 1, 1,
1.102762, 0.1015975, 0.481128, 1, 1, 1, 1, 1,
1.104771, 0.8324225, 0.5634992, 1, 1, 1, 1, 1,
1.109401, 1.200757, 2.402614, 1, 1, 1, 1, 1,
1.119334, 0.1599891, 0.5068529, 1, 1, 1, 1, 1,
1.120345, 1.71184, -0.05737177, 0, 0, 1, 1, 1,
1.129091, 1.143059, 1.309507, 1, 0, 0, 1, 1,
1.129701, 1.063835, 1.786747, 1, 0, 0, 1, 1,
1.13151, -0.6727562, -0.1573172, 1, 0, 0, 1, 1,
1.133007, -1.651751, 2.452857, 1, 0, 0, 1, 1,
1.141461, 0.525232, 2.022812, 1, 0, 0, 1, 1,
1.150932, 0.2770395, 2.308122, 0, 0, 0, 1, 1,
1.152284, 0.05211939, 1.006757, 0, 0, 0, 1, 1,
1.154755, 0.9079094, -0.6912829, 0, 0, 0, 1, 1,
1.164286, 1.224906, 1.406769, 0, 0, 0, 1, 1,
1.166138, -0.4307589, 3.145338, 0, 0, 0, 1, 1,
1.182381, 2.350926, -0.5747852, 0, 0, 0, 1, 1,
1.183005, -0.6050684, 2.196069, 0, 0, 0, 1, 1,
1.185963, 0.1465984, 1.205212, 1, 1, 1, 1, 1,
1.186353, 0.4597583, 1.813389, 1, 1, 1, 1, 1,
1.187526, 0.4000052, -0.02264681, 1, 1, 1, 1, 1,
1.189715, 0.8633243, -1.245675, 1, 1, 1, 1, 1,
1.191475, -0.1804244, -0.2872912, 1, 1, 1, 1, 1,
1.199305, 0.5832899, 2.011444, 1, 1, 1, 1, 1,
1.19977, 0.1420509, 2.495609, 1, 1, 1, 1, 1,
1.211053, 0.5600455, -0.2999156, 1, 1, 1, 1, 1,
1.212005, 0.897764, 2.016787, 1, 1, 1, 1, 1,
1.213782, -0.9679666, 2.981049, 1, 1, 1, 1, 1,
1.215307, -1.326969, 3.78505, 1, 1, 1, 1, 1,
1.216715, 0.9332066, 0.6002974, 1, 1, 1, 1, 1,
1.220374, 0.6323554, 0.8783305, 1, 1, 1, 1, 1,
1.226699, 0.5842806, 0.6057767, 1, 1, 1, 1, 1,
1.228876, -0.6851796, 2.831284, 1, 1, 1, 1, 1,
1.233009, -0.3737116, 1.019121, 0, 0, 1, 1, 1,
1.233675, -0.1215188, 2.806342, 1, 0, 0, 1, 1,
1.240163, 0.8879548, 0.6728101, 1, 0, 0, 1, 1,
1.246619, 1.681448, 1.195311, 1, 0, 0, 1, 1,
1.249185, 1.038507, 0.63728, 1, 0, 0, 1, 1,
1.250379, -0.7265099, 2.131831, 1, 0, 0, 1, 1,
1.254243, 1.029449, -0.4381082, 0, 0, 0, 1, 1,
1.265439, 0.01795508, 0.5630462, 0, 0, 0, 1, 1,
1.27445, -0.276459, 1.638926, 0, 0, 0, 1, 1,
1.276025, 0.9088233, 0.4270121, 0, 0, 0, 1, 1,
1.279124, 1.008275, 0.0828224, 0, 0, 0, 1, 1,
1.289945, 0.8690921, 0.3990613, 0, 0, 0, 1, 1,
1.306572, -0.5658893, 1.664618, 0, 0, 0, 1, 1,
1.307223, -0.6235836, 2.050094, 1, 1, 1, 1, 1,
1.323622, -0.415949, 2.832335, 1, 1, 1, 1, 1,
1.326962, -2.073219, 2.974006, 1, 1, 1, 1, 1,
1.329283, -0.6661347, 2.590973, 1, 1, 1, 1, 1,
1.342324, 0.5852816, 2.498967, 1, 1, 1, 1, 1,
1.346084, 0.651052, 0.1527161, 1, 1, 1, 1, 1,
1.351007, 0.1544676, 1.580558, 1, 1, 1, 1, 1,
1.356472, -0.4220334, 2.584736, 1, 1, 1, 1, 1,
1.359127, 0.2708794, 0.03149896, 1, 1, 1, 1, 1,
1.369766, -0.4792263, 0.9448196, 1, 1, 1, 1, 1,
1.371318, 0.2498117, 0.7310887, 1, 1, 1, 1, 1,
1.382618, 0.02296436, 1.34582, 1, 1, 1, 1, 1,
1.39991, -0.8238597, 2.38535, 1, 1, 1, 1, 1,
1.400468, -0.5903453, 3.664608, 1, 1, 1, 1, 1,
1.400934, 0.2179593, 1.242694, 1, 1, 1, 1, 1,
1.403839, 0.6203517, 1.313714, 0, 0, 1, 1, 1,
1.416224, 0.8157651, -0.3153035, 1, 0, 0, 1, 1,
1.440584, -0.7106997, 1.797231, 1, 0, 0, 1, 1,
1.446965, 0.3519938, 0.6789994, 1, 0, 0, 1, 1,
1.447576, 0.719132, 0.990344, 1, 0, 0, 1, 1,
1.459984, -0.3767004, 1.8101, 1, 0, 0, 1, 1,
1.464996, -1.734183, 1.759232, 0, 0, 0, 1, 1,
1.477881, -0.5224714, 1.048264, 0, 0, 0, 1, 1,
1.482435, -0.234256, 2.260822, 0, 0, 0, 1, 1,
1.4851, -0.9907597, 1.220424, 0, 0, 0, 1, 1,
1.506639, 0.7744393, 2.060416, 0, 0, 0, 1, 1,
1.515122, 1.050327, -0.5580278, 0, 0, 0, 1, 1,
1.52931, -1.962122, 2.393724, 0, 0, 0, 1, 1,
1.547846, -0.2522575, -1.701112, 1, 1, 1, 1, 1,
1.552864, -0.1273695, 0.02107448, 1, 1, 1, 1, 1,
1.565016, 0.8894144, 1.317063, 1, 1, 1, 1, 1,
1.565212, 0.2865639, 1.916467, 1, 1, 1, 1, 1,
1.567146, 0.6474717, 2.727904, 1, 1, 1, 1, 1,
1.576392, 2.468741, 0.6059452, 1, 1, 1, 1, 1,
1.578432, 0.6510187, 1.569096, 1, 1, 1, 1, 1,
1.584812, -1.625434, 2.274893, 1, 1, 1, 1, 1,
1.603807, -1.456351, 2.400499, 1, 1, 1, 1, 1,
1.61787, -0.3535623, 2.134953, 1, 1, 1, 1, 1,
1.633507, -0.8012422, 2.991866, 1, 1, 1, 1, 1,
1.647343, 1.748397, 1.922806, 1, 1, 1, 1, 1,
1.647928, 0.2116254, 1.689718, 1, 1, 1, 1, 1,
1.670557, 0.2016522, 0.7183728, 1, 1, 1, 1, 1,
1.688194, 1.972586, 2.42158, 1, 1, 1, 1, 1,
1.693501, 0.7381905, 0.1997306, 0, 0, 1, 1, 1,
1.711763, -0.02131187, 2.644425, 1, 0, 0, 1, 1,
1.715956, 0.3880841, 2.699227, 1, 0, 0, 1, 1,
1.73221, -0.4743206, 2.025327, 1, 0, 0, 1, 1,
1.738764, -0.3878932, 2.720005, 1, 0, 0, 1, 1,
1.767146, -1.768448, 2.464873, 1, 0, 0, 1, 1,
1.791608, -1.102512, 2.724316, 0, 0, 0, 1, 1,
1.803376, 0.7047592, 1.67924, 0, 0, 0, 1, 1,
1.814072, -0.7367554, 2.556644, 0, 0, 0, 1, 1,
1.816017, -0.1200526, 1.645677, 0, 0, 0, 1, 1,
1.840251, 0.1342606, 2.05073, 0, 0, 0, 1, 1,
1.858357, 0.754896, 1.815192, 0, 0, 0, 1, 1,
1.859016, 0.215613, 1.744738, 0, 0, 0, 1, 1,
1.860127, 0.6207983, 3.702074, 1, 1, 1, 1, 1,
1.86412, 0.05753944, 0.7428564, 1, 1, 1, 1, 1,
1.870101, 1.563349, 1.542288, 1, 1, 1, 1, 1,
1.878637, -0.1688931, 1.742309, 1, 1, 1, 1, 1,
1.879666, -0.4811698, 0.4510283, 1, 1, 1, 1, 1,
1.886863, 0.5787538, 1.520835, 1, 1, 1, 1, 1,
1.903822, 1.394053, 0.4017436, 1, 1, 1, 1, 1,
1.919607, -0.6651953, 3.701459, 1, 1, 1, 1, 1,
1.920866, 1.564531, 1.152683, 1, 1, 1, 1, 1,
1.931546, 2.425311, 0.8750812, 1, 1, 1, 1, 1,
1.932936, -0.5314394, 2.079054, 1, 1, 1, 1, 1,
1.933199, -0.9953771, 2.626756, 1, 1, 1, 1, 1,
1.937721, 0.5150505, 2.505745, 1, 1, 1, 1, 1,
1.947758, 1.022798, -0.06500688, 1, 1, 1, 1, 1,
1.964151, -0.8080407, 1.362034, 1, 1, 1, 1, 1,
1.998748, -0.1420417, 3.241494, 0, 0, 1, 1, 1,
2.022878, -0.08851893, -0.7960832, 1, 0, 0, 1, 1,
2.037027, 0.3900912, -1.036043, 1, 0, 0, 1, 1,
2.108089, 0.6466874, 1.648765, 1, 0, 0, 1, 1,
2.127536, 0.002844471, 1.954208, 1, 0, 0, 1, 1,
2.132015, -0.6798109, 1.196199, 1, 0, 0, 1, 1,
2.160213, 1.09293, 2.086385, 0, 0, 0, 1, 1,
2.171213, -0.6488447, 3.28893, 0, 0, 0, 1, 1,
2.197404, 0.8185868, 0.498085, 0, 0, 0, 1, 1,
2.277948, -0.4403004, 3.197672, 0, 0, 0, 1, 1,
2.324162, 1.109214, 1.258532, 0, 0, 0, 1, 1,
2.33296, 1.369645, 0.6452838, 0, 0, 0, 1, 1,
2.373565, 1.557067, -0.005042776, 0, 0, 0, 1, 1,
2.509625, 1.111694, 2.105538, 1, 1, 1, 1, 1,
2.567004, -0.8148264, 2.240137, 1, 1, 1, 1, 1,
2.689899, 0.01550993, 2.235793, 1, 1, 1, 1, 1,
2.703907, 1.194681, 0.976099, 1, 1, 1, 1, 1,
2.892431, 0.6245958, 2.132908, 1, 1, 1, 1, 1,
2.999316, 0.8108528, 1.955754, 1, 1, 1, 1, 1,
3.339018, 0.5915405, -0.02927789, 1, 1, 1, 1, 1
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
var radius = 9.68256;
var distance = 34.00958;
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
mvMatrix.translate( -0.1922854, 0.1679924, 0.09849763 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00958);
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
