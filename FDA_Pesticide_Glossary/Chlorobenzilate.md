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
-3.241168, -0.5509527, -1.699136, 1, 0, 0, 1,
-2.72984, -1.482289, -3.203829, 1, 0.007843138, 0, 1,
-2.715278, 2.623493, -0.7250769, 1, 0.01176471, 0, 1,
-2.58515, 0.8105092, 0.2646399, 1, 0.01960784, 0, 1,
-2.578481, 2.285479, -1.663154, 1, 0.02352941, 0, 1,
-2.485095, 1.082354, -1.483036, 1, 0.03137255, 0, 1,
-2.466732, 2.307997, -0.2285219, 1, 0.03529412, 0, 1,
-2.432055, -1.235557, -2.02197, 1, 0.04313726, 0, 1,
-2.391559, -0.5430461, -0.1134731, 1, 0.04705882, 0, 1,
-2.231849, 1.331851, -2.293082, 1, 0.05490196, 0, 1,
-2.202155, 0.8268305, 1.360536, 1, 0.05882353, 0, 1,
-2.197056, -0.4049717, -1.073271, 1, 0.06666667, 0, 1,
-2.119276, -1.080067, -2.077846, 1, 0.07058824, 0, 1,
-2.107034, 0.5590283, -1.94507, 1, 0.07843138, 0, 1,
-2.095955, 0.04550851, -0.2041105, 1, 0.08235294, 0, 1,
-2.061261, -1.110008, -2.964823, 1, 0.09019608, 0, 1,
-2.054565, 0.2642525, -2.101075, 1, 0.09411765, 0, 1,
-2.050619, 0.7749658, -3.218616, 1, 0.1019608, 0, 1,
-2.034105, -1.548517, -1.425861, 1, 0.1098039, 0, 1,
-2.004739, 1.513798, -0.8614494, 1, 0.1137255, 0, 1,
-1.92624, 1.159416, -1.040333, 1, 0.1215686, 0, 1,
-1.901218, 1.42981, -1.125962, 1, 0.1254902, 0, 1,
-1.886793, -0.5802386, -3.919312, 1, 0.1333333, 0, 1,
-1.874668, -1.295712, -3.181186, 1, 0.1372549, 0, 1,
-1.8338, -0.05755914, -1.602842, 1, 0.145098, 0, 1,
-1.815828, -1.306668, -0.2189368, 1, 0.1490196, 0, 1,
-1.801569, 0.7092529, -1.984686, 1, 0.1568628, 0, 1,
-1.789511, 0.2607997, -2.94409, 1, 0.1607843, 0, 1,
-1.787407, -0.2372795, -3.547053, 1, 0.1686275, 0, 1,
-1.782673, -0.7679591, -1.25008, 1, 0.172549, 0, 1,
-1.766598, 0.2318141, -1.834754, 1, 0.1803922, 0, 1,
-1.762954, -0.2309017, -1.625528, 1, 0.1843137, 0, 1,
-1.761428, -1.404601, -0.3895229, 1, 0.1921569, 0, 1,
-1.736498, 1.347465, -1.044325, 1, 0.1960784, 0, 1,
-1.689021, 1.13677, 0.3143665, 1, 0.2039216, 0, 1,
-1.679754, -0.848493, -2.105032, 1, 0.2117647, 0, 1,
-1.658454, 0.5211032, -1.934945, 1, 0.2156863, 0, 1,
-1.655279, 2.805468, -0.5091241, 1, 0.2235294, 0, 1,
-1.655199, -0.4031194, -1.945488, 1, 0.227451, 0, 1,
-1.652855, 0.7556941, -0.7335865, 1, 0.2352941, 0, 1,
-1.649514, -1.268292, -3.031055, 1, 0.2392157, 0, 1,
-1.646115, -0.8297719, -3.003649, 1, 0.2470588, 0, 1,
-1.644943, 1.644408, 0.03479762, 1, 0.2509804, 0, 1,
-1.641246, 1.566665, -0.8910692, 1, 0.2588235, 0, 1,
-1.639718, 0.005024586, -2.430387, 1, 0.2627451, 0, 1,
-1.636602, 0.7932447, -2.497271, 1, 0.2705882, 0, 1,
-1.633327, 0.914888, -0.6048182, 1, 0.2745098, 0, 1,
-1.629558, -0.9676951, -3.546566, 1, 0.282353, 0, 1,
-1.62567, -1.677744, -3.480044, 1, 0.2862745, 0, 1,
-1.618475, 1.128552, -1.040547, 1, 0.2941177, 0, 1,
-1.615964, -0.663072, -2.451986, 1, 0.3019608, 0, 1,
-1.612217, -0.959397, -2.840093, 1, 0.3058824, 0, 1,
-1.609966, 0.6399608, -2.671705, 1, 0.3137255, 0, 1,
-1.597917, -0.7747527, -2.103662, 1, 0.3176471, 0, 1,
-1.595182, 0.7168177, -2.652191, 1, 0.3254902, 0, 1,
-1.580801, -0.5296744, -1.752352, 1, 0.3294118, 0, 1,
-1.580522, 1.349443, -1.407503, 1, 0.3372549, 0, 1,
-1.569853, 1.417356, -1.395613, 1, 0.3411765, 0, 1,
-1.557128, -1.792433, -0.7877106, 1, 0.3490196, 0, 1,
-1.552893, -0.6685753, -4.476015, 1, 0.3529412, 0, 1,
-1.541253, 2.490287, -0.5980756, 1, 0.3607843, 0, 1,
-1.520718, -0.2161424, 0.1458151, 1, 0.3647059, 0, 1,
-1.501617, -0.3750613, -2.230335, 1, 0.372549, 0, 1,
-1.498763, -0.9341878, -1.950868, 1, 0.3764706, 0, 1,
-1.49865, -0.8101745, -2.749119, 1, 0.3843137, 0, 1,
-1.495418, 0.1431685, -1.929462, 1, 0.3882353, 0, 1,
-1.491367, -1.487235, -3.184452, 1, 0.3960784, 0, 1,
-1.48809, -2.027442, -0.5011056, 1, 0.4039216, 0, 1,
-1.487823, -0.1678267, -1.835637, 1, 0.4078431, 0, 1,
-1.474514, 0.2492737, -0.7960748, 1, 0.4156863, 0, 1,
-1.471497, 0.8561017, -0.1249566, 1, 0.4196078, 0, 1,
-1.470077, -0.1184412, -2.711829, 1, 0.427451, 0, 1,
-1.469119, -0.3497043, -3.442974, 1, 0.4313726, 0, 1,
-1.465638, 0.4803008, -0.9609697, 1, 0.4392157, 0, 1,
-1.452579, 0.5591964, -1.054566, 1, 0.4431373, 0, 1,
-1.451025, -0.02170957, -2.88827, 1, 0.4509804, 0, 1,
-1.440404, 0.5993574, -0.5938729, 1, 0.454902, 0, 1,
-1.434026, 0.2694035, -1.234399, 1, 0.4627451, 0, 1,
-1.433253, -0.4777675, -2.34418, 1, 0.4666667, 0, 1,
-1.426215, 0.83754, -0.9185727, 1, 0.4745098, 0, 1,
-1.416767, 0.7309551, -2.751843, 1, 0.4784314, 0, 1,
-1.404845, -0.9351535, -0.8493405, 1, 0.4862745, 0, 1,
-1.40392, 0.1173403, -2.425395, 1, 0.4901961, 0, 1,
-1.391678, 0.6149887, -3.207182, 1, 0.4980392, 0, 1,
-1.377662, 0.9466922, -1.606953, 1, 0.5058824, 0, 1,
-1.373355, 1.043362, 0.2842541, 1, 0.509804, 0, 1,
-1.368694, 0.4021803, -2.038511, 1, 0.5176471, 0, 1,
-1.366101, -0.2263587, -2.535805, 1, 0.5215687, 0, 1,
-1.363777, -1.298624, -2.297047, 1, 0.5294118, 0, 1,
-1.361567, 0.5524758, 0.08901551, 1, 0.5333334, 0, 1,
-1.358548, -1.178784, -2.686328, 1, 0.5411765, 0, 1,
-1.358303, -0.8847414, -3.594429, 1, 0.5450981, 0, 1,
-1.354561, 0.8955805, -0.8500041, 1, 0.5529412, 0, 1,
-1.352537, 0.7140023, -1.864621, 1, 0.5568628, 0, 1,
-1.344773, 2.121979, -1.552686, 1, 0.5647059, 0, 1,
-1.330568, -1.18579, -1.264844, 1, 0.5686275, 0, 1,
-1.317756, 0.6926079, -0.5338636, 1, 0.5764706, 0, 1,
-1.314809, 1.132648, -0.5316215, 1, 0.5803922, 0, 1,
-1.307251, 1.102524, -2.033264, 1, 0.5882353, 0, 1,
-1.30608, 0.6333163, -2.099586, 1, 0.5921569, 0, 1,
-1.298977, -0.7985491, -3.785387, 1, 0.6, 0, 1,
-1.289196, -0.4428407, -3.053812, 1, 0.6078432, 0, 1,
-1.278188, 0.6683694, 0.562336, 1, 0.6117647, 0, 1,
-1.278174, -0.4961566, -2.334137, 1, 0.6196079, 0, 1,
-1.274308, 0.03584721, -2.185917, 1, 0.6235294, 0, 1,
-1.270635, 0.2994813, -0.9189983, 1, 0.6313726, 0, 1,
-1.269727, -0.2624483, -2.774215, 1, 0.6352941, 0, 1,
-1.264214, 0.7203571, -0.7907688, 1, 0.6431373, 0, 1,
-1.260674, 0.8931663, -0.8827274, 1, 0.6470588, 0, 1,
-1.257921, 0.1944113, -3.419489, 1, 0.654902, 0, 1,
-1.254608, 1.24616, 0.3555523, 1, 0.6588235, 0, 1,
-1.249918, 0.8043619, -0.5067641, 1, 0.6666667, 0, 1,
-1.2488, 1.942321, -2.166041, 1, 0.6705883, 0, 1,
-1.236689, -0.2820195, -1.809751, 1, 0.6784314, 0, 1,
-1.232505, 0.9830651, -1.000946, 1, 0.682353, 0, 1,
-1.229823, 1.854532, -2.102531, 1, 0.6901961, 0, 1,
-1.220419, 0.5781078, -2.919801, 1, 0.6941177, 0, 1,
-1.219829, 0.4072761, -2.101036, 1, 0.7019608, 0, 1,
-1.213714, 0.6201264, -0.2640276, 1, 0.7098039, 0, 1,
-1.207469, -0.06679767, -2.025942, 1, 0.7137255, 0, 1,
-1.205767, 0.3048812, -1.763018, 1, 0.7215686, 0, 1,
-1.205464, 0.1109006, -2.260789, 1, 0.7254902, 0, 1,
-1.192417, -0.5878685, -2.035656, 1, 0.7333333, 0, 1,
-1.189305, 0.4665799, -1.167673, 1, 0.7372549, 0, 1,
-1.187116, 0.08426706, -2.715504, 1, 0.7450981, 0, 1,
-1.186563, -0.646494, -2.004292, 1, 0.7490196, 0, 1,
-1.186558, -2.502897, -2.525257, 1, 0.7568628, 0, 1,
-1.179601, -1.212199, -2.731708, 1, 0.7607843, 0, 1,
-1.178921, 0.8984746, -2.287812, 1, 0.7686275, 0, 1,
-1.16839, 0.255422, -0.5032799, 1, 0.772549, 0, 1,
-1.166687, 0.1642496, -0.824828, 1, 0.7803922, 0, 1,
-1.157612, 0.5779307, -2.540364, 1, 0.7843137, 0, 1,
-1.152847, 0.1281866, -1.104579, 1, 0.7921569, 0, 1,
-1.149693, 0.2997567, -2.437421, 1, 0.7960784, 0, 1,
-1.14341, 0.3649543, -1.976316, 1, 0.8039216, 0, 1,
-1.140342, -0.68843, -2.065028, 1, 0.8117647, 0, 1,
-1.137509, -0.7329385, -2.623232, 1, 0.8156863, 0, 1,
-1.132752, 1.54717, -0.03923384, 1, 0.8235294, 0, 1,
-1.12749, -0.07341666, -0.7888205, 1, 0.827451, 0, 1,
-1.116954, 0.3122739, -1.768599, 1, 0.8352941, 0, 1,
-1.109035, -0.59683, -1.76996, 1, 0.8392157, 0, 1,
-1.107645, -0.6022175, -3.244616, 1, 0.8470588, 0, 1,
-1.107069, -0.354304, -2.688677, 1, 0.8509804, 0, 1,
-1.106542, 1.385505, -1.192863, 1, 0.8588235, 0, 1,
-1.105042, 0.6372671, -2.284521, 1, 0.8627451, 0, 1,
-1.103766, 0.1508444, -1.235756, 1, 0.8705882, 0, 1,
-1.103194, -0.5951522, -2.909686, 1, 0.8745098, 0, 1,
-1.102087, -0.9818732, -2.252055, 1, 0.8823529, 0, 1,
-1.097551, -0.5075647, -2.708319, 1, 0.8862745, 0, 1,
-1.096455, 1.924424, 0.6613988, 1, 0.8941177, 0, 1,
-1.094572, -1.182922, -2.128947, 1, 0.8980392, 0, 1,
-1.087782, 1.521094, -0.8814805, 1, 0.9058824, 0, 1,
-1.086784, -0.4181259, -3.093988, 1, 0.9137255, 0, 1,
-1.08272, -1.13442, -1.284827, 1, 0.9176471, 0, 1,
-1.069409, 0.5405639, -0.868709, 1, 0.9254902, 0, 1,
-1.065628, 2.73148, 0.8753003, 1, 0.9294118, 0, 1,
-1.062007, -0.1813243, -2.864569, 1, 0.9372549, 0, 1,
-1.059882, -0.2625644, 1.847715, 1, 0.9411765, 0, 1,
-1.056794, 1.659656, -0.703279, 1, 0.9490196, 0, 1,
-1.056776, 0.4048164, -1.512194, 1, 0.9529412, 0, 1,
-1.056358, -0.2955628, -2.410125, 1, 0.9607843, 0, 1,
-1.056236, -0.3570852, -1.15854, 1, 0.9647059, 0, 1,
-1.054796, 0.7629588, -0.1940549, 1, 0.972549, 0, 1,
-1.05359, 0.2514593, -2.403324, 1, 0.9764706, 0, 1,
-1.050277, 0.666775, -2.485514, 1, 0.9843137, 0, 1,
-1.049293, -0.1471345, 0.0005019691, 1, 0.9882353, 0, 1,
-1.04481, -0.4009975, -1.858555, 1, 0.9960784, 0, 1,
-1.040128, -0.298395, -2.614111, 0.9960784, 1, 0, 1,
-1.029859, 0.7506334, -0.8407073, 0.9921569, 1, 0, 1,
-1.022314, 0.0587056, -2.072106, 0.9843137, 1, 0, 1,
-1.019888, -0.7263824, -2.754063, 0.9803922, 1, 0, 1,
-1.008056, -1.609657, -3.559149, 0.972549, 1, 0, 1,
-1.005202, 1.488534, -1.549094, 0.9686275, 1, 0, 1,
-0.9984332, 2.06494, -0.9733928, 0.9607843, 1, 0, 1,
-0.9862289, -0.7674855, -3.157492, 0.9568627, 1, 0, 1,
-0.9859414, 0.2706532, -1.622951, 0.9490196, 1, 0, 1,
-0.9812483, 0.6481801, -2.420326, 0.945098, 1, 0, 1,
-0.9812399, -0.2665281, 0.1458418, 0.9372549, 1, 0, 1,
-0.9793357, 1.654563, -0.2409674, 0.9333333, 1, 0, 1,
-0.9746728, 0.6534773, -0.6077774, 0.9254902, 1, 0, 1,
-0.9725504, 0.4407193, -2.774886, 0.9215686, 1, 0, 1,
-0.972379, 0.7230612, 1.064863, 0.9137255, 1, 0, 1,
-0.9718882, -0.3509962, -1.693691, 0.9098039, 1, 0, 1,
-0.9701506, 0.3785376, -0.6823885, 0.9019608, 1, 0, 1,
-0.9699792, -0.3772505, 0.2638621, 0.8941177, 1, 0, 1,
-0.9696382, 1.359973, 0.8954237, 0.8901961, 1, 0, 1,
-0.9614712, 0.9880099, -1.949208, 0.8823529, 1, 0, 1,
-0.9600797, -0.3142264, -4.181259, 0.8784314, 1, 0, 1,
-0.9442235, 0.9685568, -1.16043, 0.8705882, 1, 0, 1,
-0.9437271, 1.605523, -1.917517, 0.8666667, 1, 0, 1,
-0.943503, 1.693622, 1.116956, 0.8588235, 1, 0, 1,
-0.9361423, 0.2834812, -1.618649, 0.854902, 1, 0, 1,
-0.9344858, -0.2018942, -3.020795, 0.8470588, 1, 0, 1,
-0.9329677, -0.06643765, -2.261214, 0.8431373, 1, 0, 1,
-0.9292534, -2.1834, -4.137844, 0.8352941, 1, 0, 1,
-0.9222192, 1.528951, 0.5459328, 0.8313726, 1, 0, 1,
-0.9214646, 0.1109902, -1.367805, 0.8235294, 1, 0, 1,
-0.9184635, -0.2692917, -3.216018, 0.8196079, 1, 0, 1,
-0.9114974, 0.5172083, -2.296037, 0.8117647, 1, 0, 1,
-0.9013435, -0.04611714, -0.7980344, 0.8078431, 1, 0, 1,
-0.8943121, 0.1000701, -3.567847, 0.8, 1, 0, 1,
-0.8941715, 0.7352875, -1.098563, 0.7921569, 1, 0, 1,
-0.8854963, -2.046294, -3.930341, 0.7882353, 1, 0, 1,
-0.8848928, 0.3550706, -2.745776, 0.7803922, 1, 0, 1,
-0.8844625, -1.635064, -4.427543, 0.7764706, 1, 0, 1,
-0.8785768, 0.1366929, -2.957765, 0.7686275, 1, 0, 1,
-0.8702598, 0.1500978, -2.403789, 0.7647059, 1, 0, 1,
-0.8690038, 1.733069, 1.281926, 0.7568628, 1, 0, 1,
-0.8682228, 0.7723469, -2.06324, 0.7529412, 1, 0, 1,
-0.8566285, -0.0119509, 0.658313, 0.7450981, 1, 0, 1,
-0.8538783, 0.08787142, -0.7048261, 0.7411765, 1, 0, 1,
-0.8504669, -0.6011689, -1.903898, 0.7333333, 1, 0, 1,
-0.8496816, -1.36998, -1.182207, 0.7294118, 1, 0, 1,
-0.841951, 0.5572934, -0.9648028, 0.7215686, 1, 0, 1,
-0.8390776, 2.398881, -2.239889, 0.7176471, 1, 0, 1,
-0.8360014, 0.582997, -0.5034254, 0.7098039, 1, 0, 1,
-0.8348792, 1.435209, -1.852951, 0.7058824, 1, 0, 1,
-0.8327475, 0.7552999, -0.8050969, 0.6980392, 1, 0, 1,
-0.8287238, 0.04125895, -1.279548, 0.6901961, 1, 0, 1,
-0.827964, 1.988879, 1.038314, 0.6862745, 1, 0, 1,
-0.8253969, 0.132972, -2.516984, 0.6784314, 1, 0, 1,
-0.8234356, 0.9012362, 0.2912931, 0.6745098, 1, 0, 1,
-0.8194675, 0.2331804, -1.718477, 0.6666667, 1, 0, 1,
-0.8158371, 1.060127, 0.4681439, 0.6627451, 1, 0, 1,
-0.8146534, 1.06196, -0.4414108, 0.654902, 1, 0, 1,
-0.8145429, -0.2604816, -1.253788, 0.6509804, 1, 0, 1,
-0.8144369, -1.013417, -2.449476, 0.6431373, 1, 0, 1,
-0.8065133, -0.246336, -1.458437, 0.6392157, 1, 0, 1,
-0.8036671, 0.5048437, -1.232577, 0.6313726, 1, 0, 1,
-0.8006713, -1.831234, -1.80927, 0.627451, 1, 0, 1,
-0.7992991, -0.7374687, -1.416991, 0.6196079, 1, 0, 1,
-0.7971326, 1.043566, -0.9646626, 0.6156863, 1, 0, 1,
-0.7892595, 0.01387824, -3.837806, 0.6078432, 1, 0, 1,
-0.7876623, 0.6320665, -1.237016, 0.6039216, 1, 0, 1,
-0.7780182, -0.7583798, -1.786583, 0.5960785, 1, 0, 1,
-0.7702991, -0.9023721, -2.198508, 0.5882353, 1, 0, 1,
-0.7634988, -0.4066126, -2.243151, 0.5843138, 1, 0, 1,
-0.7598259, 0.2582077, -0.9483008, 0.5764706, 1, 0, 1,
-0.7570004, -0.2405044, -0.9923093, 0.572549, 1, 0, 1,
-0.7545736, -1.18366, -2.998348, 0.5647059, 1, 0, 1,
-0.7531959, -0.4161964, -2.790877, 0.5607843, 1, 0, 1,
-0.7504545, -0.8704451, -2.359942, 0.5529412, 1, 0, 1,
-0.7482385, 1.303345, 0.3003057, 0.5490196, 1, 0, 1,
-0.7466519, -0.4720935, -1.921813, 0.5411765, 1, 0, 1,
-0.7457183, -0.2518938, -1.695409, 0.5372549, 1, 0, 1,
-0.7432178, 1.276368, -0.8404264, 0.5294118, 1, 0, 1,
-0.7425244, 1.447065, 0.3637053, 0.5254902, 1, 0, 1,
-0.7349739, 1.376721, -1.221342, 0.5176471, 1, 0, 1,
-0.7335158, -0.3713607, -0.4477075, 0.5137255, 1, 0, 1,
-0.725825, -0.176564, -2.430567, 0.5058824, 1, 0, 1,
-0.7241113, -1.663019, -3.068297, 0.5019608, 1, 0, 1,
-0.716352, -0.3377462, -2.815281, 0.4941176, 1, 0, 1,
-0.7100763, 0.9732223, 0.6495931, 0.4862745, 1, 0, 1,
-0.7070384, -1.013291, -2.950036, 0.4823529, 1, 0, 1,
-0.7039211, 1.054967, 0.4273431, 0.4745098, 1, 0, 1,
-0.7038826, -0.7837669, -2.615715, 0.4705882, 1, 0, 1,
-0.7009052, -0.8973055, -1.282335, 0.4627451, 1, 0, 1,
-0.6976218, -0.5369979, -4.38069, 0.4588235, 1, 0, 1,
-0.6970446, 0.2798215, -0.9386954, 0.4509804, 1, 0, 1,
-0.6949726, -0.7858785, -3.383529, 0.4470588, 1, 0, 1,
-0.6937933, 0.5561545, -1.378683, 0.4392157, 1, 0, 1,
-0.692795, 0.2195167, -2.27401, 0.4352941, 1, 0, 1,
-0.6911808, 0.3816366, 0.7363802, 0.427451, 1, 0, 1,
-0.6896337, -0.6713364, -2.541268, 0.4235294, 1, 0, 1,
-0.6867815, -1.521226, -2.134023, 0.4156863, 1, 0, 1,
-0.684255, 1.20699, -0.6453444, 0.4117647, 1, 0, 1,
-0.6817619, 0.260901, 0.5040889, 0.4039216, 1, 0, 1,
-0.677439, 1.03319, 0.1932023, 0.3960784, 1, 0, 1,
-0.6767272, -0.1468258, -1.85457, 0.3921569, 1, 0, 1,
-0.6713452, -0.3789909, -2.424138, 0.3843137, 1, 0, 1,
-0.6699302, 0.6685591, -1.281762, 0.3803922, 1, 0, 1,
-0.667257, 0.8379734, -1.127824, 0.372549, 1, 0, 1,
-0.6599134, -0.1401689, -0.5487701, 0.3686275, 1, 0, 1,
-0.6581042, 0.9833722, -0.00335241, 0.3607843, 1, 0, 1,
-0.6556432, -0.09131959, -2.814657, 0.3568628, 1, 0, 1,
-0.6541198, -0.07241914, -1.002835, 0.3490196, 1, 0, 1,
-0.6453028, 0.9254962, -0.6259835, 0.345098, 1, 0, 1,
-0.6435337, 1.051795, -1.183801, 0.3372549, 1, 0, 1,
-0.643076, 0.1888776, -0.7424756, 0.3333333, 1, 0, 1,
-0.6378784, -0.493339, -1.746367, 0.3254902, 1, 0, 1,
-0.6350869, -0.1774825, -2.848989, 0.3215686, 1, 0, 1,
-0.6340067, 0.9296948, 1.998049, 0.3137255, 1, 0, 1,
-0.6324835, -2.212216, -2.540895, 0.3098039, 1, 0, 1,
-0.6304565, 0.9748838, 1.446062, 0.3019608, 1, 0, 1,
-0.6271392, -0.9379527, -1.83507, 0.2941177, 1, 0, 1,
-0.6259344, -0.4012248, -4.037313, 0.2901961, 1, 0, 1,
-0.625046, 0.2128576, -0.000735771, 0.282353, 1, 0, 1,
-0.6173009, -0.4643943, -1.97617, 0.2784314, 1, 0, 1,
-0.6160662, 0.283236, -2.176649, 0.2705882, 1, 0, 1,
-0.6153234, 0.8523971, -0.2467598, 0.2666667, 1, 0, 1,
-0.6138375, -0.5677108, -3.434636, 0.2588235, 1, 0, 1,
-0.6087148, -0.620916, -4.272941, 0.254902, 1, 0, 1,
-0.6078448, -0.9458122, -3.199323, 0.2470588, 1, 0, 1,
-0.6067437, 1.441995, -1.214116, 0.2431373, 1, 0, 1,
-0.5993513, 1.95985, 0.01005658, 0.2352941, 1, 0, 1,
-0.5989121, -0.4374274, -2.44491, 0.2313726, 1, 0, 1,
-0.5969814, 1.340036, 0.4610482, 0.2235294, 1, 0, 1,
-0.5949748, 0.03736626, -0.6422876, 0.2196078, 1, 0, 1,
-0.5940637, -1.317178, -1.832694, 0.2117647, 1, 0, 1,
-0.5825589, 1.296371, 1.205333, 0.2078431, 1, 0, 1,
-0.5798135, 0.4181001, -1.166102, 0.2, 1, 0, 1,
-0.5787756, -0.04960166, -1.965635, 0.1921569, 1, 0, 1,
-0.5744126, -0.9600367, -2.735507, 0.1882353, 1, 0, 1,
-0.5702353, -0.3274201, -0.4386962, 0.1803922, 1, 0, 1,
-0.5682154, 1.046905, 0.8907723, 0.1764706, 1, 0, 1,
-0.5660006, -0.3712955, -4.226355, 0.1686275, 1, 0, 1,
-0.563704, -1.312343, -3.643446, 0.1647059, 1, 0, 1,
-0.5625813, -0.4235795, -3.808824, 0.1568628, 1, 0, 1,
-0.5618762, -1.168723, -3.726204, 0.1529412, 1, 0, 1,
-0.5594341, -0.4111403, -3.527114, 0.145098, 1, 0, 1,
-0.5565607, 0.3141882, -1.50771, 0.1411765, 1, 0, 1,
-0.5490157, 1.047191, 0.6175154, 0.1333333, 1, 0, 1,
-0.5458488, 0.482835, -0.5610272, 0.1294118, 1, 0, 1,
-0.5438396, -0.6030661, -0.5674374, 0.1215686, 1, 0, 1,
-0.5380664, -0.5405448, -2.883136, 0.1176471, 1, 0, 1,
-0.5353963, 2.058987, 1.641759, 0.1098039, 1, 0, 1,
-0.5347086, 0.36479, 0.09627844, 0.1058824, 1, 0, 1,
-0.5330312, -0.2681279, -0.9983608, 0.09803922, 1, 0, 1,
-0.5316971, -0.258594, -2.397239, 0.09019608, 1, 0, 1,
-0.5306374, -0.8958608, -2.576583, 0.08627451, 1, 0, 1,
-0.5282062, -1.40751, -1.169984, 0.07843138, 1, 0, 1,
-0.5246574, 0.1181761, -1.186466, 0.07450981, 1, 0, 1,
-0.5220711, -0.1820121, -4.150719, 0.06666667, 1, 0, 1,
-0.5114086, -0.07589938, -1.649852, 0.0627451, 1, 0, 1,
-0.5102924, -0.11331, -0.817682, 0.05490196, 1, 0, 1,
-0.509006, -0.8621321, -3.678389, 0.05098039, 1, 0, 1,
-0.5080795, -0.3687325, -3.469725, 0.04313726, 1, 0, 1,
-0.5021828, 0.46381, -1.14046, 0.03921569, 1, 0, 1,
-0.4974418, -0.5568376, -1.055477, 0.03137255, 1, 0, 1,
-0.4960111, -2.400687, -3.355179, 0.02745098, 1, 0, 1,
-0.495822, 0.29703, -1.551117, 0.01960784, 1, 0, 1,
-0.4955285, -0.7908233, -1.021072, 0.01568628, 1, 0, 1,
-0.49398, 1.143635, -0.4560304, 0.007843138, 1, 0, 1,
-0.4935471, -0.02100567, -2.887505, 0.003921569, 1, 0, 1,
-0.4930966, -1.504318, -1.878773, 0, 1, 0.003921569, 1,
-0.4929241, 0.01438234, -1.685307, 0, 1, 0.01176471, 1,
-0.4921999, -0.1772194, -2.625544, 0, 1, 0.01568628, 1,
-0.4919317, -0.1858314, -1.74529, 0, 1, 0.02352941, 1,
-0.4902847, 0.5784833, -1.588697, 0, 1, 0.02745098, 1,
-0.488157, -0.8462182, -3.379493, 0, 1, 0.03529412, 1,
-0.487356, 0.4158736, -1.074251, 0, 1, 0.03921569, 1,
-0.4717795, -0.3997256, -2.071233, 0, 1, 0.04705882, 1,
-0.4668176, -0.9038342, -2.786619, 0, 1, 0.05098039, 1,
-0.4644129, 1.404455, 0.5899556, 0, 1, 0.05882353, 1,
-0.4633613, -0.6388872, -1.086608, 0, 1, 0.0627451, 1,
-0.4601797, 1.219333, -1.228777, 0, 1, 0.07058824, 1,
-0.4599338, 1.702675, -0.197769, 0, 1, 0.07450981, 1,
-0.458822, 0.1607841, -0.8416612, 0, 1, 0.08235294, 1,
-0.4587569, -0.2753351, -1.554048, 0, 1, 0.08627451, 1,
-0.4577919, -1.885619, -3.783202, 0, 1, 0.09411765, 1,
-0.4564803, 0.9950655, 0.510146, 0, 1, 0.1019608, 1,
-0.4548239, -0.9481608, -2.724477, 0, 1, 0.1058824, 1,
-0.4534547, 0.4322776, -0.8125855, 0, 1, 0.1137255, 1,
-0.4533275, 0.2120791, -0.3161268, 0, 1, 0.1176471, 1,
-0.4531963, 1.565914, -1.221494, 0, 1, 0.1254902, 1,
-0.4520318, -0.5221923, -1.796732, 0, 1, 0.1294118, 1,
-0.4423011, -0.5720224, -4.111126, 0, 1, 0.1372549, 1,
-0.4280648, -1.334555, -2.378583, 0, 1, 0.1411765, 1,
-0.4178278, -0.1129595, -2.647017, 0, 1, 0.1490196, 1,
-0.4151035, -0.420499, -4.127417, 0, 1, 0.1529412, 1,
-0.4122432, -0.3661558, -2.118246, 0, 1, 0.1607843, 1,
-0.4076511, 0.03091441, -1.003884, 0, 1, 0.1647059, 1,
-0.4046297, -0.5080217, -2.359079, 0, 1, 0.172549, 1,
-0.4039235, 1.047215, -1.035735, 0, 1, 0.1764706, 1,
-0.4032119, -1.725389, -2.815211, 0, 1, 0.1843137, 1,
-0.4012973, -0.09665108, -2.621631, 0, 1, 0.1882353, 1,
-0.3997106, -0.7005653, -1.972186, 0, 1, 0.1960784, 1,
-0.3972992, 0.9327362, -0.7877956, 0, 1, 0.2039216, 1,
-0.3970013, -0.3178785, -2.450541, 0, 1, 0.2078431, 1,
-0.3956269, -0.5903557, -2.841017, 0, 1, 0.2156863, 1,
-0.3931734, 0.4090004, -0.7832742, 0, 1, 0.2196078, 1,
-0.3880359, -0.3262252, -0.8164755, 0, 1, 0.227451, 1,
-0.3851968, 0.4081526, -1.89232, 0, 1, 0.2313726, 1,
-0.3849764, -0.0869865, -2.366684, 0, 1, 0.2392157, 1,
-0.3844829, 1.63429, 0.7358415, 0, 1, 0.2431373, 1,
-0.3731686, -1.236337, -3.502819, 0, 1, 0.2509804, 1,
-0.3730527, -0.2664243, -3.785908, 0, 1, 0.254902, 1,
-0.3692533, 1.074625, -1.234792, 0, 1, 0.2627451, 1,
-0.3650255, 0.6672325, -0.4123445, 0, 1, 0.2666667, 1,
-0.3642561, 0.6420393, -2.718228, 0, 1, 0.2745098, 1,
-0.3624961, 0.1331661, 0.2976644, 0, 1, 0.2784314, 1,
-0.3620085, 1.588746, 0.6313307, 0, 1, 0.2862745, 1,
-0.3557863, 1.400905, -1.531503, 0, 1, 0.2901961, 1,
-0.3545369, 2.216292, 0.3516122, 0, 1, 0.2980392, 1,
-0.3538634, -0.2659774, -3.207193, 0, 1, 0.3058824, 1,
-0.3524945, 0.1128859, -1.062162, 0, 1, 0.3098039, 1,
-0.3516858, 0.02719144, -1.202399, 0, 1, 0.3176471, 1,
-0.3460385, -0.03209234, -1.470754, 0, 1, 0.3215686, 1,
-0.3377954, -1.257386, -4.387557, 0, 1, 0.3294118, 1,
-0.3301067, -1.583591, -1.156975, 0, 1, 0.3333333, 1,
-0.3252264, 0.7386004, -1.966298, 0, 1, 0.3411765, 1,
-0.3230704, 1.07312, -0.4450398, 0, 1, 0.345098, 1,
-0.3206377, 0.0754059, -2.347094, 0, 1, 0.3529412, 1,
-0.3197605, -0.5410182, -0.8317274, 0, 1, 0.3568628, 1,
-0.3159388, -0.173801, -2.710524, 0, 1, 0.3647059, 1,
-0.3116363, 0.779991, -0.2322393, 0, 1, 0.3686275, 1,
-0.3107905, 0.1158963, -1.231841, 0, 1, 0.3764706, 1,
-0.3095605, -0.4447727, -1.181378, 0, 1, 0.3803922, 1,
-0.3071651, -1.524379, -2.668947, 0, 1, 0.3882353, 1,
-0.3062753, 0.2557179, -0.1775714, 0, 1, 0.3921569, 1,
-0.305148, -0.2355733, -2.485947, 0, 1, 0.4, 1,
-0.3013918, 0.3714866, -1.100632, 0, 1, 0.4078431, 1,
-0.2950374, -0.7072237, -2.371089, 0, 1, 0.4117647, 1,
-0.2914821, -0.2090922, -1.594974, 0, 1, 0.4196078, 1,
-0.2904885, 0.0937162, -2.02599, 0, 1, 0.4235294, 1,
-0.2897897, -0.959753, -5.346226, 0, 1, 0.4313726, 1,
-0.2896867, 2.436228, 0.4497948, 0, 1, 0.4352941, 1,
-0.2861272, 0.1130284, -1.763916, 0, 1, 0.4431373, 1,
-0.2846444, 0.9163537, -1.82276, 0, 1, 0.4470588, 1,
-0.2843279, -0.2629962, -2.772085, 0, 1, 0.454902, 1,
-0.2812853, 0.05052297, -1.625873, 0, 1, 0.4588235, 1,
-0.2744672, 1.271583, -0.2394066, 0, 1, 0.4666667, 1,
-0.2698455, -3.274878, -2.315139, 0, 1, 0.4705882, 1,
-0.2671717, -0.1628828, -2.347851, 0, 1, 0.4784314, 1,
-0.2668173, 0.1120263, -0.494938, 0, 1, 0.4823529, 1,
-0.2627078, 0.978, -1.963578, 0, 1, 0.4901961, 1,
-0.2600124, 0.8009803, -0.3389939, 0, 1, 0.4941176, 1,
-0.2576212, 0.3543699, -1.215848, 0, 1, 0.5019608, 1,
-0.2519825, 0.4442085, 0.9858003, 0, 1, 0.509804, 1,
-0.2511179, 0.06850134, -1.67498, 0, 1, 0.5137255, 1,
-0.2502538, 0.7810013, -0.7451389, 0, 1, 0.5215687, 1,
-0.2474704, -0.8145649, -3.692419, 0, 1, 0.5254902, 1,
-0.2467777, 0.4721278, -1.962237, 0, 1, 0.5333334, 1,
-0.2459766, 0.5136158, 1.586016, 0, 1, 0.5372549, 1,
-0.2452009, 2.641699, -0.4427006, 0, 1, 0.5450981, 1,
-0.2373503, -0.545165, -2.9451, 0, 1, 0.5490196, 1,
-0.2356372, 0.04816192, 0.268612, 0, 1, 0.5568628, 1,
-0.2337795, 0.9076478, -0.8574108, 0, 1, 0.5607843, 1,
-0.2320259, -1.17689, -2.321386, 0, 1, 0.5686275, 1,
-0.2317733, 0.5699983, -0.9340422, 0, 1, 0.572549, 1,
-0.2245711, -1.541046, -2.237631, 0, 1, 0.5803922, 1,
-0.2199468, -0.4959454, -3.190894, 0, 1, 0.5843138, 1,
-0.2177739, -0.07890322, -2.352136, 0, 1, 0.5921569, 1,
-0.2129007, 0.05563086, -1.041134, 0, 1, 0.5960785, 1,
-0.2103491, -0.4718635, -3.853029, 0, 1, 0.6039216, 1,
-0.2024882, -0.9528174, -5.639493, 0, 1, 0.6117647, 1,
-0.1977007, 1.161113, -1.066114, 0, 1, 0.6156863, 1,
-0.1960922, -1.966346, -2.053922, 0, 1, 0.6235294, 1,
-0.1937767, -2.091055, -3.847241, 0, 1, 0.627451, 1,
-0.1868781, -1.370722, -3.380904, 0, 1, 0.6352941, 1,
-0.1859739, 0.01496697, -0.9318097, 0, 1, 0.6392157, 1,
-0.1856987, -1.251554, -3.017718, 0, 1, 0.6470588, 1,
-0.1807085, -0.5901582, -3.846379, 0, 1, 0.6509804, 1,
-0.179885, 0.7973691, -0.06380414, 0, 1, 0.6588235, 1,
-0.1771899, 0.1771553, -0.5131184, 0, 1, 0.6627451, 1,
-0.1729167, -0.3733068, -1.767447, 0, 1, 0.6705883, 1,
-0.170685, 0.7584007, 0.6576683, 0, 1, 0.6745098, 1,
-0.1660545, -0.09796245, -4.62339, 0, 1, 0.682353, 1,
-0.1625113, 0.9382097, 0.4164194, 0, 1, 0.6862745, 1,
-0.1568737, -0.7148382, -3.287295, 0, 1, 0.6941177, 1,
-0.1567663, 0.8099915, 1.870605, 0, 1, 0.7019608, 1,
-0.1547585, -0.2158571, -2.348341, 0, 1, 0.7058824, 1,
-0.1514654, 0.6596101, -0.2957446, 0, 1, 0.7137255, 1,
-0.136992, 0.02935142, -0.54528, 0, 1, 0.7176471, 1,
-0.1295694, 0.7740615, -0.501128, 0, 1, 0.7254902, 1,
-0.1293122, 0.656969, -1.67005, 0, 1, 0.7294118, 1,
-0.1292903, -0.762786, -4.470113, 0, 1, 0.7372549, 1,
-0.1237822, 2.144342, 0.8126729, 0, 1, 0.7411765, 1,
-0.117075, 1.344685, -0.8855959, 0, 1, 0.7490196, 1,
-0.1128352, -0.9438956, -3.382699, 0, 1, 0.7529412, 1,
-0.1120958, 1.107441, -1.086251, 0, 1, 0.7607843, 1,
-0.1104753, -0.8726751, -2.05062, 0, 1, 0.7647059, 1,
-0.1096858, -2.927809, -2.190644, 0, 1, 0.772549, 1,
-0.1082571, -0.4537177, -4.993396, 0, 1, 0.7764706, 1,
-0.1062144, 1.05233, 1.162334, 0, 1, 0.7843137, 1,
-0.1057075, -0.4029544, -3.382183, 0, 1, 0.7882353, 1,
-0.1042157, -0.25198, -3.956084, 0, 1, 0.7960784, 1,
-0.1020651, -0.05968776, -2.48554, 0, 1, 0.8039216, 1,
-0.1007523, -0.6042545, -2.644907, 0, 1, 0.8078431, 1,
-0.100563, 1.086848, 1.454837, 0, 1, 0.8156863, 1,
-0.09886429, -1.80327, -4.089808, 0, 1, 0.8196079, 1,
-0.09830573, -0.9224304, -1.993382, 0, 1, 0.827451, 1,
-0.09608877, -1.32593, -1.925379, 0, 1, 0.8313726, 1,
-0.09509038, -0.1011066, -2.822275, 0, 1, 0.8392157, 1,
-0.09248914, -0.4008134, -1.753533, 0, 1, 0.8431373, 1,
-0.08589462, -0.5083691, -3.280165, 0, 1, 0.8509804, 1,
-0.08134374, 0.2910258, 0.4176816, 0, 1, 0.854902, 1,
-0.07347642, 0.4796817, -1.34015, 0, 1, 0.8627451, 1,
-0.07048383, 0.9667589, -1.433793, 0, 1, 0.8666667, 1,
-0.06945347, -0.8406951, -2.161406, 0, 1, 0.8745098, 1,
-0.06432837, -0.1365839, -2.675999, 0, 1, 0.8784314, 1,
-0.06384791, -0.4353807, -2.741261, 0, 1, 0.8862745, 1,
-0.05808377, -0.5561032, -2.982421, 0, 1, 0.8901961, 1,
-0.05794677, -1.041119, -4.806923, 0, 1, 0.8980392, 1,
-0.05750713, -0.5518921, -1.948738, 0, 1, 0.9058824, 1,
-0.05241704, 0.1053667, -1.413109, 0, 1, 0.9098039, 1,
-0.0509242, -1.054955, -3.310959, 0, 1, 0.9176471, 1,
-0.04863196, 1.03572, 0.6309111, 0, 1, 0.9215686, 1,
-0.03779051, 0.3901955, 2.313108, 0, 1, 0.9294118, 1,
-0.03758643, 1.493659, 0.7518175, 0, 1, 0.9333333, 1,
-0.037126, 0.1324748, -0.5325124, 0, 1, 0.9411765, 1,
-0.03683684, 1.139487, -0.9223662, 0, 1, 0.945098, 1,
-0.03449659, -0.6776612, -3.266447, 0, 1, 0.9529412, 1,
-0.03336843, -1.183334, -3.811436, 0, 1, 0.9568627, 1,
-0.03317759, 0.6744034, 1.094198, 0, 1, 0.9647059, 1,
-0.02103058, 1.35188, 0.2144498, 0, 1, 0.9686275, 1,
-0.02041273, 1.267943, -0.7975565, 0, 1, 0.9764706, 1,
-0.01988828, 0.1219401, 2.215853, 0, 1, 0.9803922, 1,
-0.01901694, 1.255516, -1.734102, 0, 1, 0.9882353, 1,
-0.01136675, -0.6684496, -1.257952, 0, 1, 0.9921569, 1,
-0.008683544, 0.4412345, -0.9994172, 0, 1, 1, 1,
-0.008668429, 0.279322, -2.020093, 0, 0.9921569, 1, 1,
-0.00600406, 0.7130387, 0.1455946, 0, 0.9882353, 1, 1,
0.001475929, 0.211081, -0.7954109, 0, 0.9803922, 1, 1,
0.001577878, -1.350023, 3.202081, 0, 0.9764706, 1, 1,
0.005746447, 0.3757381, 1.540851, 0, 0.9686275, 1, 1,
0.006787454, -0.9293543, 1.4865, 0, 0.9647059, 1, 1,
0.00783231, 0.1065071, -0.1896456, 0, 0.9568627, 1, 1,
0.01010652, 0.1314836, 0.3191988, 0, 0.9529412, 1, 1,
0.01029897, -0.4882461, 3.38396, 0, 0.945098, 1, 1,
0.01093018, 0.09789984, 0.360491, 0, 0.9411765, 1, 1,
0.01337995, 0.9795261, -0.3951568, 0, 0.9333333, 1, 1,
0.0144075, 0.7509436, 0.6454569, 0, 0.9294118, 1, 1,
0.01638909, 1.088592, 0.8511537, 0, 0.9215686, 1, 1,
0.01837463, 1.854435, 2.133972, 0, 0.9176471, 1, 1,
0.02254822, 2.408391, 0.6078641, 0, 0.9098039, 1, 1,
0.02400968, 0.9491194, -0.2078542, 0, 0.9058824, 1, 1,
0.02826361, -1.317061, 1.197187, 0, 0.8980392, 1, 1,
0.0325717, 1.355127, 0.5370331, 0, 0.8901961, 1, 1,
0.03637625, 2.37417, 2.766379, 0, 0.8862745, 1, 1,
0.03706966, 1.093236, -0.6000013, 0, 0.8784314, 1, 1,
0.03877234, -0.9456022, 3.230689, 0, 0.8745098, 1, 1,
0.04037018, 1.198475, -0.3154429, 0, 0.8666667, 1, 1,
0.04457937, 1.183412, 1.10365, 0, 0.8627451, 1, 1,
0.04557682, 0.5765503, 1.295661, 0, 0.854902, 1, 1,
0.04630962, -1.905233, 3.082108, 0, 0.8509804, 1, 1,
0.0467194, -0.2082144, 2.740532, 0, 0.8431373, 1, 1,
0.04937662, 1.445828, 1.190412, 0, 0.8392157, 1, 1,
0.04942147, -0.231073, 2.539042, 0, 0.8313726, 1, 1,
0.05179939, 1.122616, 0.5694917, 0, 0.827451, 1, 1,
0.05468543, 0.5320115, -1.337357, 0, 0.8196079, 1, 1,
0.05946017, -1.381019, 2.432155, 0, 0.8156863, 1, 1,
0.06512988, -2.639368, 2.709569, 0, 0.8078431, 1, 1,
0.06618003, 0.5479603, 0.6570225, 0, 0.8039216, 1, 1,
0.07214882, 0.6710351, 0.4862484, 0, 0.7960784, 1, 1,
0.08519699, -1.156399, 3.487967, 0, 0.7882353, 1, 1,
0.08828037, -0.3179537, 3.537192, 0, 0.7843137, 1, 1,
0.08961069, 1.91311, -1.51716, 0, 0.7764706, 1, 1,
0.0937965, -1.367882, 3.712985, 0, 0.772549, 1, 1,
0.09512875, -1.001803, 4.281068, 0, 0.7647059, 1, 1,
0.09922606, -0.9395513, 3.38238, 0, 0.7607843, 1, 1,
0.1003545, -0.3726673, 3.849303, 0, 0.7529412, 1, 1,
0.1050914, -0.6257039, 2.960038, 0, 0.7490196, 1, 1,
0.1056905, -0.6939905, 2.63016, 0, 0.7411765, 1, 1,
0.1074738, 1.485671, 1.669818, 0, 0.7372549, 1, 1,
0.1086342, 1.402237, -0.5865354, 0, 0.7294118, 1, 1,
0.1111936, -0.1292353, 2.631945, 0, 0.7254902, 1, 1,
0.1182458, 0.000228936, 0.6425874, 0, 0.7176471, 1, 1,
0.1259313, -0.6043875, 2.372597, 0, 0.7137255, 1, 1,
0.1315261, 0.8201159, 0.1437494, 0, 0.7058824, 1, 1,
0.1319301, -0.5022289, 4.930256, 0, 0.6980392, 1, 1,
0.1327336, 1.179698, 0.8298088, 0, 0.6941177, 1, 1,
0.140989, -0.77959, 3.223743, 0, 0.6862745, 1, 1,
0.1414361, -1.487114, 3.62758, 0, 0.682353, 1, 1,
0.1480317, -0.2558838, 3.489776, 0, 0.6745098, 1, 1,
0.1499565, -1.174199, 2.128395, 0, 0.6705883, 1, 1,
0.1601365, -1.890459, 2.670899, 0, 0.6627451, 1, 1,
0.1627661, -0.2735378, 4.242521, 0, 0.6588235, 1, 1,
0.165493, -0.5976059, 2.716426, 0, 0.6509804, 1, 1,
0.1661723, 0.3481058, -0.09781034, 0, 0.6470588, 1, 1,
0.168708, 0.7459954, 1.453934, 0, 0.6392157, 1, 1,
0.169611, -0.6205652, 2.805743, 0, 0.6352941, 1, 1,
0.1697158, 0.4979295, 1.740037, 0, 0.627451, 1, 1,
0.1732338, 0.9554771, 0.7499627, 0, 0.6235294, 1, 1,
0.1734102, 2.148583, -1.238172, 0, 0.6156863, 1, 1,
0.1738036, -0.8212997, 2.288459, 0, 0.6117647, 1, 1,
0.1765123, -0.3822809, 1.784907, 0, 0.6039216, 1, 1,
0.1784694, -1.487449, 3.436075, 0, 0.5960785, 1, 1,
0.1813579, -0.04837044, 1.211183, 0, 0.5921569, 1, 1,
0.1866229, 0.2104233, 1.271236, 0, 0.5843138, 1, 1,
0.1871711, -0.8118829, 3.43259, 0, 0.5803922, 1, 1,
0.1938692, -1.069737, 2.404013, 0, 0.572549, 1, 1,
0.1986799, 0.0159819, -0.7946257, 0, 0.5686275, 1, 1,
0.2023163, -0.3257652, 1.834046, 0, 0.5607843, 1, 1,
0.2041643, 0.4884889, 0.9629055, 0, 0.5568628, 1, 1,
0.2043658, -0.6536858, 2.829973, 0, 0.5490196, 1, 1,
0.2080262, 0.2117771, -0.8720834, 0, 0.5450981, 1, 1,
0.2105476, -1.428231, 4.145168, 0, 0.5372549, 1, 1,
0.2106022, 1.083971, 0.3856122, 0, 0.5333334, 1, 1,
0.2114787, -0.2704996, 4.116705, 0, 0.5254902, 1, 1,
0.2187314, -0.3609395, 3.275937, 0, 0.5215687, 1, 1,
0.2235914, -1.19646, 2.930432, 0, 0.5137255, 1, 1,
0.2237239, -0.9605367, 2.602211, 0, 0.509804, 1, 1,
0.2255241, -0.8726655, 2.114841, 0, 0.5019608, 1, 1,
0.2265921, -0.9416027, 2.812706, 0, 0.4941176, 1, 1,
0.2291274, -0.595723, 3.970055, 0, 0.4901961, 1, 1,
0.2397157, 0.3039438, 1.509933, 0, 0.4823529, 1, 1,
0.2443274, -0.19496, 2.353785, 0, 0.4784314, 1, 1,
0.2447166, 0.4312183, -0.2133365, 0, 0.4705882, 1, 1,
0.2478096, -0.6764377, 1.082675, 0, 0.4666667, 1, 1,
0.2509502, -1.381348, 2.065593, 0, 0.4588235, 1, 1,
0.2542941, 1.296307, 0.516238, 0, 0.454902, 1, 1,
0.2551951, -1.297795, 1.62775, 0, 0.4470588, 1, 1,
0.256862, -2.691599, 1.986834, 0, 0.4431373, 1, 1,
0.2580146, -1.242723, 2.945812, 0, 0.4352941, 1, 1,
0.2601354, 0.09892538, 0.7905995, 0, 0.4313726, 1, 1,
0.2606865, -0.2000577, 2.324694, 0, 0.4235294, 1, 1,
0.2628396, 0.4999847, 0.1721081, 0, 0.4196078, 1, 1,
0.2658016, 0.1769154, -0.1491025, 0, 0.4117647, 1, 1,
0.2767882, -1.165804, 3.178743, 0, 0.4078431, 1, 1,
0.2842007, -1.127121, 2.781415, 0, 0.4, 1, 1,
0.2843941, 0.0245342, 2.523366, 0, 0.3921569, 1, 1,
0.2862597, 0.934202, -0.3490762, 0, 0.3882353, 1, 1,
0.2866788, 0.3518851, 0.6892822, 0, 0.3803922, 1, 1,
0.2889153, 0.451041, 0.02809111, 0, 0.3764706, 1, 1,
0.2909629, -1.453292, 2.510896, 0, 0.3686275, 1, 1,
0.2996107, -0.1596418, 3.778231, 0, 0.3647059, 1, 1,
0.3008181, 0.4651717, 0.974435, 0, 0.3568628, 1, 1,
0.301652, 0.9973377, 0.5433732, 0, 0.3529412, 1, 1,
0.3026005, 0.4322125, -1.285837, 0, 0.345098, 1, 1,
0.3032084, -2.194259, 1.468961, 0, 0.3411765, 1, 1,
0.3056935, -0.6581027, 4.421305, 0, 0.3333333, 1, 1,
0.3081326, -0.9321061, 3.542974, 0, 0.3294118, 1, 1,
0.3126394, -0.1869107, 1.006272, 0, 0.3215686, 1, 1,
0.3127826, -1.557903, 2.272484, 0, 0.3176471, 1, 1,
0.3163367, 1.207306, 0.08583751, 0, 0.3098039, 1, 1,
0.3168488, 0.7887842, 1.182996, 0, 0.3058824, 1, 1,
0.3189174, 1.312076, -1.302728, 0, 0.2980392, 1, 1,
0.3214941, -0.8923805, 3.393677, 0, 0.2901961, 1, 1,
0.3232516, -1.599359, 2.333283, 0, 0.2862745, 1, 1,
0.3289428, 0.219885, -0.3740413, 0, 0.2784314, 1, 1,
0.3303166, -0.912132, 3.21627, 0, 0.2745098, 1, 1,
0.3380096, -1.420179, 4.06392, 0, 0.2666667, 1, 1,
0.341342, -0.8018031, 3.293458, 0, 0.2627451, 1, 1,
0.343072, 0.6776814, 0.08872452, 0, 0.254902, 1, 1,
0.3441711, -0.1550493, 4.045948, 0, 0.2509804, 1, 1,
0.3482319, 0.7503917, 0.5348023, 0, 0.2431373, 1, 1,
0.3499342, -1.397746, 2.333857, 0, 0.2392157, 1, 1,
0.3522559, 0.1920733, 0.9415045, 0, 0.2313726, 1, 1,
0.355507, 0.6297156, 0.4658282, 0, 0.227451, 1, 1,
0.3596371, -0.6568471, 3.406713, 0, 0.2196078, 1, 1,
0.3599184, -0.5560676, 3.276698, 0, 0.2156863, 1, 1,
0.3630584, 0.8023697, 0.8852069, 0, 0.2078431, 1, 1,
0.3634861, -1.628923, 2.121463, 0, 0.2039216, 1, 1,
0.3648917, -0.4005022, 2.9749, 0, 0.1960784, 1, 1,
0.3654057, 1.105279, 0.7232292, 0, 0.1882353, 1, 1,
0.3686276, 0.2751227, -0.2436163, 0, 0.1843137, 1, 1,
0.3686427, -0.2827138, 1.041488, 0, 0.1764706, 1, 1,
0.3729947, 1.510503, 1.105052, 0, 0.172549, 1, 1,
0.3763024, -0.3005862, 1.497627, 0, 0.1647059, 1, 1,
0.3818767, 0.3487658, 2.973334, 0, 0.1607843, 1, 1,
0.3830093, 0.9183843, 1.544147, 0, 0.1529412, 1, 1,
0.3837103, -0.4027193, 3.620422, 0, 0.1490196, 1, 1,
0.3837401, -0.940357, 2.2087, 0, 0.1411765, 1, 1,
0.3873175, 0.207439, 1.078431, 0, 0.1372549, 1, 1,
0.3884045, -0.08598655, 0.8374323, 0, 0.1294118, 1, 1,
0.3888884, -0.1903212, 0.4315525, 0, 0.1254902, 1, 1,
0.396446, 1.033409, 1.178239, 0, 0.1176471, 1, 1,
0.4008216, 1.361838, 1.330201, 0, 0.1137255, 1, 1,
0.4024931, -0.8512859, 1.953063, 0, 0.1058824, 1, 1,
0.4029194, -0.2028203, 2.51151, 0, 0.09803922, 1, 1,
0.4030233, 0.7469748, -0.06429967, 0, 0.09411765, 1, 1,
0.4093656, -1.627321, 1.936932, 0, 0.08627451, 1, 1,
0.4100408, -0.4571028, 2.153554, 0, 0.08235294, 1, 1,
0.4106012, 0.7452739, 0.9006086, 0, 0.07450981, 1, 1,
0.4192093, -0.0613068, 1.119205, 0, 0.07058824, 1, 1,
0.4203593, -1.217262, 2.773839, 0, 0.0627451, 1, 1,
0.4216579, 0.1717533, 0.5597076, 0, 0.05882353, 1, 1,
0.4233105, 0.05465515, 2.328524, 0, 0.05098039, 1, 1,
0.4255265, -0.4259248, 2.676722, 0, 0.04705882, 1, 1,
0.4256071, -2.033718, 3.522284, 0, 0.03921569, 1, 1,
0.4275796, -0.461371, 3.18896, 0, 0.03529412, 1, 1,
0.4352696, -1.18223, 3.827755, 0, 0.02745098, 1, 1,
0.4386487, 0.2843379, 0.7621973, 0, 0.02352941, 1, 1,
0.4502727, -0.7068771, 2.319495, 0, 0.01568628, 1, 1,
0.4515197, -0.5444499, 2.744348, 0, 0.01176471, 1, 1,
0.4532762, -0.1851552, 2.562845, 0, 0.003921569, 1, 1,
0.453854, 0.1764921, -0.6954473, 0.003921569, 0, 1, 1,
0.4544125, -0.03366403, 2.213979, 0.007843138, 0, 1, 1,
0.4586483, 0.9591234, -1.475373, 0.01568628, 0, 1, 1,
0.4607326, -0.6519611, 2.828345, 0.01960784, 0, 1, 1,
0.4616219, 1.294907, -0.5663057, 0.02745098, 0, 1, 1,
0.4628252, 1.194227, -1.173571, 0.03137255, 0, 1, 1,
0.4649163, -1.225182, 3.575189, 0.03921569, 0, 1, 1,
0.4670136, 0.5756421, -0.228565, 0.04313726, 0, 1, 1,
0.4753525, 0.4921826, 0.7715056, 0.05098039, 0, 1, 1,
0.4754321, 0.5351805, -0.9043007, 0.05490196, 0, 1, 1,
0.4793042, -0.7100304, 2.945409, 0.0627451, 0, 1, 1,
0.4855735, 1.220702, -1.076378, 0.06666667, 0, 1, 1,
0.489244, 1.103273, 0.2010035, 0.07450981, 0, 1, 1,
0.4918567, -0.7721735, 2.409622, 0.07843138, 0, 1, 1,
0.4949297, 0.7678559, -0.08639459, 0.08627451, 0, 1, 1,
0.5042552, 1.740359, -0.5258187, 0.09019608, 0, 1, 1,
0.5122684, 0.03850515, 1.488139, 0.09803922, 0, 1, 1,
0.5133564, -1.952893, 5.380984, 0.1058824, 0, 1, 1,
0.5141998, 0.2393817, 1.433394, 0.1098039, 0, 1, 1,
0.5151828, 0.7351229, 2.560227, 0.1176471, 0, 1, 1,
0.5233855, -0.2024526, 2.787361, 0.1215686, 0, 1, 1,
0.5237047, 0.0434381, 1.743987, 0.1294118, 0, 1, 1,
0.5275816, -0.2235654, 1.224853, 0.1333333, 0, 1, 1,
0.5280005, -1.086812, 2.911981, 0.1411765, 0, 1, 1,
0.5332743, -0.05910604, 2.729176, 0.145098, 0, 1, 1,
0.5431191, 0.2670089, 0.0953915, 0.1529412, 0, 1, 1,
0.5437359, 1.677234, 0.8972982, 0.1568628, 0, 1, 1,
0.5441244, 1.158615, 1.185624, 0.1647059, 0, 1, 1,
0.545681, 1.442035, -0.1796314, 0.1686275, 0, 1, 1,
0.5461504, -0.5767785, 0.6971162, 0.1764706, 0, 1, 1,
0.5497062, -0.2063333, 1.912966, 0.1803922, 0, 1, 1,
0.5530778, 0.05349166, 1.179515, 0.1882353, 0, 1, 1,
0.5554087, 0.1133419, 0.2158204, 0.1921569, 0, 1, 1,
0.5582945, 0.2830362, 0.3639977, 0.2, 0, 1, 1,
0.5655816, -0.3162593, 3.495909, 0.2078431, 0, 1, 1,
0.5658304, 0.1344844, 2.476797, 0.2117647, 0, 1, 1,
0.5659993, 0.1693389, 0.0500621, 0.2196078, 0, 1, 1,
0.5740547, -1.08089, 3.811257, 0.2235294, 0, 1, 1,
0.5771698, 0.1076088, 2.355434, 0.2313726, 0, 1, 1,
0.579646, 0.6879255, 1.883911, 0.2352941, 0, 1, 1,
0.5809348, 0.5657843, -0.8329065, 0.2431373, 0, 1, 1,
0.5830323, -2.43701, 4.335605, 0.2470588, 0, 1, 1,
0.5861361, 0.2024232, -0.4588724, 0.254902, 0, 1, 1,
0.5886295, -0.3565378, 1.097939, 0.2588235, 0, 1, 1,
0.5894821, -0.1752516, 1.549781, 0.2666667, 0, 1, 1,
0.5897124, 1.208835, 0.00732673, 0.2705882, 0, 1, 1,
0.5900442, -0.3475791, 2.904192, 0.2784314, 0, 1, 1,
0.6019005, -0.3499322, 3.33892, 0.282353, 0, 1, 1,
0.6076636, 1.553669, -0.172384, 0.2901961, 0, 1, 1,
0.6083294, 0.0009484575, 0.5497249, 0.2941177, 0, 1, 1,
0.6093408, -0.6638637, 3.456322, 0.3019608, 0, 1, 1,
0.6109333, 0.4698656, 0.1816625, 0.3098039, 0, 1, 1,
0.6152546, 0.3984887, 0.5073041, 0.3137255, 0, 1, 1,
0.6167022, -1.231794, 3.156589, 0.3215686, 0, 1, 1,
0.6168776, 0.2049665, 0.5367773, 0.3254902, 0, 1, 1,
0.6207041, 0.1459225, 1.533201, 0.3333333, 0, 1, 1,
0.6209407, 1.659568, 0.512882, 0.3372549, 0, 1, 1,
0.621994, 2.047098, 0.05728192, 0.345098, 0, 1, 1,
0.623437, 0.1016745, 1.438115, 0.3490196, 0, 1, 1,
0.6236761, -0.7387594, 3.404986, 0.3568628, 0, 1, 1,
0.624255, 0.02030054, 1.143041, 0.3607843, 0, 1, 1,
0.6298687, 0.6291382, -1.216122, 0.3686275, 0, 1, 1,
0.6315305, 1.191866, 1.344857, 0.372549, 0, 1, 1,
0.6386954, -0.007536283, -0.3624111, 0.3803922, 0, 1, 1,
0.6411381, 1.004426, 0.8062624, 0.3843137, 0, 1, 1,
0.657348, -0.3517258, 2.494479, 0.3921569, 0, 1, 1,
0.6585208, -0.397583, 0.6235119, 0.3960784, 0, 1, 1,
0.660544, -0.1480332, 2.602183, 0.4039216, 0, 1, 1,
0.6762627, -0.5185602, 2.088159, 0.4117647, 0, 1, 1,
0.6764372, -0.893584, 1.991125, 0.4156863, 0, 1, 1,
0.677031, -1.206814, 4.019071, 0.4235294, 0, 1, 1,
0.6773297, 0.6906314, 2.925984, 0.427451, 0, 1, 1,
0.6778134, 0.3598075, 1.231605, 0.4352941, 0, 1, 1,
0.6782157, -1.167291, 2.700789, 0.4392157, 0, 1, 1,
0.6820027, -0.0891356, 2.627388, 0.4470588, 0, 1, 1,
0.6845162, -0.9087865, 1.070801, 0.4509804, 0, 1, 1,
0.6863756, -2.393674, 4.142763, 0.4588235, 0, 1, 1,
0.6917461, -0.288316, 1.894127, 0.4627451, 0, 1, 1,
0.6946164, -1.26162, 2.305704, 0.4705882, 0, 1, 1,
0.6980239, 0.6945597, 0.4339218, 0.4745098, 0, 1, 1,
0.6987107, -0.8187773, 3.649457, 0.4823529, 0, 1, 1,
0.709269, -0.4126191, 3.031472, 0.4862745, 0, 1, 1,
0.7109712, -1.071937, 0.6899403, 0.4941176, 0, 1, 1,
0.7118337, -0.4564458, 2.006341, 0.5019608, 0, 1, 1,
0.7149723, -0.3042609, 1.906226, 0.5058824, 0, 1, 1,
0.7170221, -0.4248302, 1.322294, 0.5137255, 0, 1, 1,
0.7192194, 0.8997707, 1.157391, 0.5176471, 0, 1, 1,
0.720182, -0.5396811, 0.9883781, 0.5254902, 0, 1, 1,
0.7240056, -0.1323728, -0.08805523, 0.5294118, 0, 1, 1,
0.7249081, -0.3222055, 4.950067, 0.5372549, 0, 1, 1,
0.7266015, -0.2231259, 1.838945, 0.5411765, 0, 1, 1,
0.7268981, -0.6531955, 2.125321, 0.5490196, 0, 1, 1,
0.7283155, 1.133616, 1.068755, 0.5529412, 0, 1, 1,
0.7301298, 0.34661, -0.03406594, 0.5607843, 0, 1, 1,
0.7303383, -0.3743227, 2.085506, 0.5647059, 0, 1, 1,
0.7353366, 0.142598, 2.119358, 0.572549, 0, 1, 1,
0.7368199, -0.3150426, 0.7449805, 0.5764706, 0, 1, 1,
0.7374036, -0.3985371, 1.662746, 0.5843138, 0, 1, 1,
0.7408737, 0.2925921, -0.8670013, 0.5882353, 0, 1, 1,
0.7412829, 0.6709447, 1.250765, 0.5960785, 0, 1, 1,
0.7452236, -0.3123998, 1.907365, 0.6039216, 0, 1, 1,
0.7490556, -0.2065354, -1.039976, 0.6078432, 0, 1, 1,
0.7498966, -1.723493, 1.789003, 0.6156863, 0, 1, 1,
0.7518554, 0.4243132, -0.1715261, 0.6196079, 0, 1, 1,
0.7532257, -0.2815527, 1.113419, 0.627451, 0, 1, 1,
0.7532738, -0.6812536, 3.418536, 0.6313726, 0, 1, 1,
0.7601618, -1.266282, 2.271569, 0.6392157, 0, 1, 1,
0.760585, 0.695436, 0.6159622, 0.6431373, 0, 1, 1,
0.7628932, 1.322053, 0.6398598, 0.6509804, 0, 1, 1,
0.7731632, 0.5728906, -0.2820967, 0.654902, 0, 1, 1,
0.7742496, 1.032226, 1.312508, 0.6627451, 0, 1, 1,
0.7775595, -0.210478, 1.331995, 0.6666667, 0, 1, 1,
0.7808553, 1.514594, -0.3481798, 0.6745098, 0, 1, 1,
0.7848688, -0.3176369, 0.819797, 0.6784314, 0, 1, 1,
0.7856418, 0.6115487, 0.7264429, 0.6862745, 0, 1, 1,
0.7952972, 0.283965, 1.727707, 0.6901961, 0, 1, 1,
0.7983836, 0.7146429, -0.9445515, 0.6980392, 0, 1, 1,
0.8074111, 1.036446, 1.080891, 0.7058824, 0, 1, 1,
0.8097869, 0.216233, 0.355925, 0.7098039, 0, 1, 1,
0.8172382, -0.2843461, 1.374509, 0.7176471, 0, 1, 1,
0.8203662, 2.528793, 0.2750908, 0.7215686, 0, 1, 1,
0.8214378, 0.4775651, 1.487087, 0.7294118, 0, 1, 1,
0.8228378, 2.591008, 1.576559, 0.7333333, 0, 1, 1,
0.8228446, 1.612127, 1.287328, 0.7411765, 0, 1, 1,
0.823919, 1.287525, 1.576976, 0.7450981, 0, 1, 1,
0.8248343, 0.3342676, 2.19312, 0.7529412, 0, 1, 1,
0.8249053, -1.251207, 2.218817, 0.7568628, 0, 1, 1,
0.8279854, 0.09395275, 2.285493, 0.7647059, 0, 1, 1,
0.8344098, -0.8245773, 1.106976, 0.7686275, 0, 1, 1,
0.8472072, 0.8740816, 1.499899, 0.7764706, 0, 1, 1,
0.8487057, 1.387775, 0.6104097, 0.7803922, 0, 1, 1,
0.8568391, -0.7955849, 4.233688, 0.7882353, 0, 1, 1,
0.8570945, -0.1682647, 3.08304, 0.7921569, 0, 1, 1,
0.8572936, -2.683478, 1.877294, 0.8, 0, 1, 1,
0.8578112, 1.62658, 0.7711368, 0.8078431, 0, 1, 1,
0.8598382, 0.5194261, 0.7418429, 0.8117647, 0, 1, 1,
0.860725, 1.222487, -0.3341972, 0.8196079, 0, 1, 1,
0.8615225, -0.1326266, 2.600605, 0.8235294, 0, 1, 1,
0.8680234, 1.110691, -1.511623, 0.8313726, 0, 1, 1,
0.8700411, 0.7394428, 0.8493067, 0.8352941, 0, 1, 1,
0.8720413, 1.111324, 0.4162262, 0.8431373, 0, 1, 1,
0.8724282, 1.099412, 1.717257, 0.8470588, 0, 1, 1,
0.873744, 1.598803, 0.4174186, 0.854902, 0, 1, 1,
0.8745289, -1.742824, 1.674332, 0.8588235, 0, 1, 1,
0.8758751, -1.249653, 2.09657, 0.8666667, 0, 1, 1,
0.8868672, -0.4088486, 0.8409485, 0.8705882, 0, 1, 1,
0.8945276, -0.04756162, 2.746935, 0.8784314, 0, 1, 1,
0.8972028, -1.223091, 2.515623, 0.8823529, 0, 1, 1,
0.8993075, 0.1486851, 0.8334039, 0.8901961, 0, 1, 1,
0.9022061, -1.280917, 2.250508, 0.8941177, 0, 1, 1,
0.9046004, 2.152712, -0.8406484, 0.9019608, 0, 1, 1,
0.9049094, 0.1658877, -0.08372448, 0.9098039, 0, 1, 1,
0.9050225, 0.8590207, -0.07829651, 0.9137255, 0, 1, 1,
0.9109036, 1.495848, 1.294517, 0.9215686, 0, 1, 1,
0.9110179, -0.8097742, 4.953218, 0.9254902, 0, 1, 1,
0.9280361, 0.224213, 2.690637, 0.9333333, 0, 1, 1,
0.9307327, -1.018027, 1.832354, 0.9372549, 0, 1, 1,
0.9339713, -1.264672, 1.905307, 0.945098, 0, 1, 1,
0.9343783, -1.852642, 3.745623, 0.9490196, 0, 1, 1,
0.9366943, 0.2304537, 2.043873, 0.9568627, 0, 1, 1,
0.9369319, -1.176584, 3.051157, 0.9607843, 0, 1, 1,
0.9392338, 1.267751, 0.4674458, 0.9686275, 0, 1, 1,
0.9421323, 0.4297586, 1.712952, 0.972549, 0, 1, 1,
0.9459941, 0.7924074, 0.6860403, 0.9803922, 0, 1, 1,
0.9478908, 1.731671, -1.518205, 0.9843137, 0, 1, 1,
0.9531925, -1.596961, 3.437265, 0.9921569, 0, 1, 1,
0.9600574, 0.8843537, 1.549806, 0.9960784, 0, 1, 1,
0.9648083, -1.951276, 2.309426, 1, 0, 0.9960784, 1,
0.969514, -1.953661, 2.592114, 1, 0, 0.9882353, 1,
0.9695521, 1.034047, -0.5372726, 1, 0, 0.9843137, 1,
0.9781642, 1.249296, 0.1474263, 1, 0, 0.9764706, 1,
0.9863489, -0.5461557, 3.464718, 1, 0, 0.972549, 1,
0.994559, 0.01798142, 0.2949183, 1, 0, 0.9647059, 1,
0.9954353, 0.2525325, 2.012366, 1, 0, 0.9607843, 1,
0.9957346, -0.3327251, 2.124751, 1, 0, 0.9529412, 1,
1.006113, 0.5557817, 0.3587033, 1, 0, 0.9490196, 1,
1.009435, -0.9698753, 2.736826, 1, 0, 0.9411765, 1,
1.015829, -0.4587184, 3.151722, 1, 0, 0.9372549, 1,
1.021082, 0.492514, 1.01352, 1, 0, 0.9294118, 1,
1.022116, -0.4791983, 4.075218, 1, 0, 0.9254902, 1,
1.045341, -0.6260871, -0.1644983, 1, 0, 0.9176471, 1,
1.046595, 2.106012, 2.416424, 1, 0, 0.9137255, 1,
1.048923, -0.2942683, 1.48275, 1, 0, 0.9058824, 1,
1.053224, -0.2121974, 1.451486, 1, 0, 0.9019608, 1,
1.056996, 2.383121, -0.20607, 1, 0, 0.8941177, 1,
1.060847, -2.271731, 2.901872, 1, 0, 0.8862745, 1,
1.065923, -1.573677, 1.517777, 1, 0, 0.8823529, 1,
1.072078, -1.68337, 3.14045, 1, 0, 0.8745098, 1,
1.07358, 0.9544238, 1.478421, 1, 0, 0.8705882, 1,
1.075414, 1.133788, 1.799084, 1, 0, 0.8627451, 1,
1.07547, -0.7829506, 3.26638, 1, 0, 0.8588235, 1,
1.07757, -0.4273101, 3.514398, 1, 0, 0.8509804, 1,
1.079948, -1.144617, 3.970355, 1, 0, 0.8470588, 1,
1.080912, -2.060389, 2.229208, 1, 0, 0.8392157, 1,
1.082675, -1.061492, 2.358834, 1, 0, 0.8352941, 1,
1.090557, 2.233974, -0.4843385, 1, 0, 0.827451, 1,
1.091833, 1.165271, -0.4100775, 1, 0, 0.8235294, 1,
1.098135, -0.9736643, 0.6830961, 1, 0, 0.8156863, 1,
1.112251, 1.195982, 0.1470036, 1, 0, 0.8117647, 1,
1.117269, -1.230137, 2.353915, 1, 0, 0.8039216, 1,
1.119685, 0.434444, 0.1314093, 1, 0, 0.7960784, 1,
1.133969, -0.3988787, 0.936137, 1, 0, 0.7921569, 1,
1.13613, 2.18843, -0.0009512265, 1, 0, 0.7843137, 1,
1.137005, 1.552207, 0.3760445, 1, 0, 0.7803922, 1,
1.143136, -0.9343576, 2.757676, 1, 0, 0.772549, 1,
1.145896, -0.6404663, 4.620314, 1, 0, 0.7686275, 1,
1.151961, -0.2142574, 0.4440988, 1, 0, 0.7607843, 1,
1.15586, 0.6851355, 1.566699, 1, 0, 0.7568628, 1,
1.160092, -0.4498799, 1.908688, 1, 0, 0.7490196, 1,
1.161079, 0.3980841, 0.7746444, 1, 0, 0.7450981, 1,
1.161554, 0.3179687, 1.214263, 1, 0, 0.7372549, 1,
1.163799, -0.8889878, 1.081146, 1, 0, 0.7333333, 1,
1.167488, -0.3172841, 1.238366, 1, 0, 0.7254902, 1,
1.16763, -0.04069732, 2.112794, 1, 0, 0.7215686, 1,
1.167726, 1.132279, 0.8902615, 1, 0, 0.7137255, 1,
1.168731, -0.815279, 1.86088, 1, 0, 0.7098039, 1,
1.170066, 0.7318864, 1.15185, 1, 0, 0.7019608, 1,
1.176991, 0.1375968, 1.963752, 1, 0, 0.6941177, 1,
1.180989, -1.21786, 2.574108, 1, 0, 0.6901961, 1,
1.184839, 0.3801567, 2.53571, 1, 0, 0.682353, 1,
1.184874, -1.395691, 0.8047324, 1, 0, 0.6784314, 1,
1.19228, -0.5627408, 1.286809, 1, 0, 0.6705883, 1,
1.201072, -0.02109881, 1.780334, 1, 0, 0.6666667, 1,
1.20229, 0.76906, 1.782399, 1, 0, 0.6588235, 1,
1.20493, -0.5183305, 1.203568, 1, 0, 0.654902, 1,
1.206981, -1.09786, 1.696858, 1, 0, 0.6470588, 1,
1.214924, 1.48918, -0.1011891, 1, 0, 0.6431373, 1,
1.220535, 1.450733, 0.3711466, 1, 0, 0.6352941, 1,
1.238526, -1.058903, 2.867895, 1, 0, 0.6313726, 1,
1.245856, 1.099508, 2.529675, 1, 0, 0.6235294, 1,
1.250162, 0.7135618, 0.9423615, 1, 0, 0.6196079, 1,
1.253801, -0.4205321, 1.063815, 1, 0, 0.6117647, 1,
1.26574, 0.4988197, -0.3206511, 1, 0, 0.6078432, 1,
1.265841, 0.5707491, 2.544393, 1, 0, 0.6, 1,
1.276194, -1.871311, 1.387464, 1, 0, 0.5921569, 1,
1.2784, -0.9323234, 3.91404, 1, 0, 0.5882353, 1,
1.293788, -0.4535501, 0.2598877, 1, 0, 0.5803922, 1,
1.297052, 0.9849393, 2.517003, 1, 0, 0.5764706, 1,
1.312728, 0.1448488, 3.673851, 1, 0, 0.5686275, 1,
1.319642, -1.334922, 2.94422, 1, 0, 0.5647059, 1,
1.319912, -0.07872693, 2.380993, 1, 0, 0.5568628, 1,
1.329151, -1.216477, 3.395458, 1, 0, 0.5529412, 1,
1.329506, 1.845531, 3.187075, 1, 0, 0.5450981, 1,
1.339196, 0.1996145, 0.3374221, 1, 0, 0.5411765, 1,
1.34263, -1.100808, 2.237582, 1, 0, 0.5333334, 1,
1.344033, 0.8690977, 1.280281, 1, 0, 0.5294118, 1,
1.345831, -0.3517486, 0.5394368, 1, 0, 0.5215687, 1,
1.34674, -0.9986747, 2.64128, 1, 0, 0.5176471, 1,
1.36815, 0.1290469, 2.193334, 1, 0, 0.509804, 1,
1.374881, 0.107161, 1.358512, 1, 0, 0.5058824, 1,
1.376613, -0.9571035, 3.284388, 1, 0, 0.4980392, 1,
1.398111, -0.191097, 3.384392, 1, 0, 0.4901961, 1,
1.404125, 0.8603086, 2.521135, 1, 0, 0.4862745, 1,
1.411857, 0.02215529, 2.983392, 1, 0, 0.4784314, 1,
1.418546, 0.6979854, 1.834307, 1, 0, 0.4745098, 1,
1.419906, -0.2235333, 1.834378, 1, 0, 0.4666667, 1,
1.426229, -0.8243584, 2.4072, 1, 0, 0.4627451, 1,
1.429582, -0.04270434, 2.294423, 1, 0, 0.454902, 1,
1.432882, -0.5295982, 2.011317, 1, 0, 0.4509804, 1,
1.435439, 0.8593156, 1.146745, 1, 0, 0.4431373, 1,
1.444451, 1.04746, 1.31129, 1, 0, 0.4392157, 1,
1.445588, 0.9770439, 2.994083, 1, 0, 0.4313726, 1,
1.459956, -1.812368, 2.491819, 1, 0, 0.427451, 1,
1.474335, -0.1745153, 3.439074, 1, 0, 0.4196078, 1,
1.486963, -1.0926, 2.206751, 1, 0, 0.4156863, 1,
1.507847, -0.3257025, 3.231601, 1, 0, 0.4078431, 1,
1.509328, -0.4108545, 2.693793, 1, 0, 0.4039216, 1,
1.512311, -1.100689, 2.496021, 1, 0, 0.3960784, 1,
1.521478, 0.09936397, 1.030275, 1, 0, 0.3882353, 1,
1.522277, -0.6953575, 1.944412, 1, 0, 0.3843137, 1,
1.52303, -0.4814495, 2.788093, 1, 0, 0.3764706, 1,
1.531839, 0.4292385, 0.9136336, 1, 0, 0.372549, 1,
1.540947, -0.9437703, 2.846336, 1, 0, 0.3647059, 1,
1.553017, 1.088924, 1.295017, 1, 0, 0.3607843, 1,
1.562781, 0.7542782, 3.91346, 1, 0, 0.3529412, 1,
1.565544, -0.4831727, 3.226053, 1, 0, 0.3490196, 1,
1.568151, -1.090792, 1.289634, 1, 0, 0.3411765, 1,
1.574973, -0.3911411, 2.628753, 1, 0, 0.3372549, 1,
1.576251, -0.8044128, 1.174423, 1, 0, 0.3294118, 1,
1.593877, 1.113449, 2.097012, 1, 0, 0.3254902, 1,
1.634814, -0.7840618, 4.322622, 1, 0, 0.3176471, 1,
1.645163, 2.758982, 1.5493, 1, 0, 0.3137255, 1,
1.648282, -1.347679, 3.280857, 1, 0, 0.3058824, 1,
1.651548, -2.093364, 3.42827, 1, 0, 0.2980392, 1,
1.653248, -0.9368957, 3.152774, 1, 0, 0.2941177, 1,
1.655105, -1.085281, 2.509888, 1, 0, 0.2862745, 1,
1.668589, 0.2411658, 0.726032, 1, 0, 0.282353, 1,
1.684821, 0.4680588, 1.456849, 1, 0, 0.2745098, 1,
1.689282, 0.4672237, 2.364031, 1, 0, 0.2705882, 1,
1.691839, -0.2388722, 1.864284, 1, 0, 0.2627451, 1,
1.703938, -0.01865432, 1.616592, 1, 0, 0.2588235, 1,
1.715454, 2.05113, -0.3646479, 1, 0, 0.2509804, 1,
1.730465, -0.4086443, 0.09675361, 1, 0, 0.2470588, 1,
1.776818, 0.4878728, 0.8292136, 1, 0, 0.2392157, 1,
1.777979, 0.2579069, 1.877865, 1, 0, 0.2352941, 1,
1.784875, 0.2957314, 2.55938, 1, 0, 0.227451, 1,
1.825171, -0.8907954, 1.620435, 1, 0, 0.2235294, 1,
1.828143, -0.05796118, 2.731777, 1, 0, 0.2156863, 1,
1.828429, -1.063197, 2.919472, 1, 0, 0.2117647, 1,
1.837021, -1.251587, 1.604162, 1, 0, 0.2039216, 1,
1.854707, 0.2761113, 2.350639, 1, 0, 0.1960784, 1,
1.866982, -0.4848407, 1.050928, 1, 0, 0.1921569, 1,
1.871734, -0.4881248, 1.361447, 1, 0, 0.1843137, 1,
1.878064, -0.6095544, 3.861561, 1, 0, 0.1803922, 1,
1.894323, 0.02448604, 1.19827, 1, 0, 0.172549, 1,
1.905635, -0.8261612, 2.36818, 1, 0, 0.1686275, 1,
1.90692, -0.956153, 2.451996, 1, 0, 0.1607843, 1,
1.964501, 0.01959513, 2.557258, 1, 0, 0.1568628, 1,
2.060387, -0.4769974, 0.9218358, 1, 0, 0.1490196, 1,
2.081089, 0.4174653, 2.403481, 1, 0, 0.145098, 1,
2.082948, -0.3089989, 1.066173, 1, 0, 0.1372549, 1,
2.089732, -0.4648872, -0.02290606, 1, 0, 0.1333333, 1,
2.110208, 0.3146612, 1.352232, 1, 0, 0.1254902, 1,
2.172026, -0.6372181, 3.258887, 1, 0, 0.1215686, 1,
2.19323, -0.1666345, 2.493239, 1, 0, 0.1137255, 1,
2.205421, -1.483525, 1.698676, 1, 0, 0.1098039, 1,
2.219477, 1.005884, 1.537411, 1, 0, 0.1019608, 1,
2.240536, -1.209144, 1.133079, 1, 0, 0.09411765, 1,
2.280937, 0.6562067, 2.357151, 1, 0, 0.09019608, 1,
2.306745, 1.898255, 0.7274578, 1, 0, 0.08235294, 1,
2.310041, 0.08484066, 2.690426, 1, 0, 0.07843138, 1,
2.36494, 1.729445, 3.479161, 1, 0, 0.07058824, 1,
2.415732, 0.4621851, 1.86363, 1, 0, 0.06666667, 1,
2.417048, -1.336741, 1.54944, 1, 0, 0.05882353, 1,
2.42289, 0.2602344, 1.605438, 1, 0, 0.05490196, 1,
2.461152, 0.09512847, 1.903525, 1, 0, 0.04705882, 1,
2.498407, 1.91574, -0.1114447, 1, 0, 0.04313726, 1,
2.531173, -0.736813, 2.120521, 1, 0, 0.03529412, 1,
2.533701, 1.756753, -0.1541766, 1, 0, 0.03137255, 1,
2.55363, 0.1807518, 1.461004, 1, 0, 0.02352941, 1,
2.577071, 0.2293644, 1.124135, 1, 0, 0.01960784, 1,
2.585357, 1.330409, 2.62617, 1, 0, 0.01176471, 1,
2.846541, -0.7180517, 1.966259, 1, 0, 0.007843138, 1
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
-0.1973134, -4.305497, -7.507464, 0, -0.5, 0.5, 0.5,
-0.1973134, -4.305497, -7.507464, 1, -0.5, 0.5, 0.5,
-0.1973134, -4.305497, -7.507464, 1, 1.5, 0.5, 0.5,
-0.1973134, -4.305497, -7.507464, 0, 1.5, 0.5, 0.5
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
-4.273035, -0.234705, -7.507464, 0, -0.5, 0.5, 0.5,
-4.273035, -0.234705, -7.507464, 1, -0.5, 0.5, 0.5,
-4.273035, -0.234705, -7.507464, 1, 1.5, 0.5, 0.5,
-4.273035, -0.234705, -7.507464, 0, 1.5, 0.5, 0.5
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
-4.273035, -4.305497, -0.1292546, 0, -0.5, 0.5, 0.5,
-4.273035, -4.305497, -0.1292546, 1, -0.5, 0.5, 0.5,
-4.273035, -4.305497, -0.1292546, 1, 1.5, 0.5, 0.5,
-4.273035, -4.305497, -0.1292546, 0, 1.5, 0.5, 0.5
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
-3, -3.366083, -5.8048,
2, -3.366083, -5.8048,
-3, -3.366083, -5.8048,
-3, -3.522652, -6.088577,
-2, -3.366083, -5.8048,
-2, -3.522652, -6.088577,
-1, -3.366083, -5.8048,
-1, -3.522652, -6.088577,
0, -3.366083, -5.8048,
0, -3.522652, -6.088577,
1, -3.366083, -5.8048,
1, -3.522652, -6.088577,
2, -3.366083, -5.8048,
2, -3.522652, -6.088577
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
-3, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
-3, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
-3, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
-3, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5,
-2, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
-2, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
-2, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
-2, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5,
-1, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
-1, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
-1, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
-1, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5,
0, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
0, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
0, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
0, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5,
1, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
1, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
1, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
1, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5,
2, -3.83579, -6.656132, 0, -0.5, 0.5, 0.5,
2, -3.83579, -6.656132, 1, -0.5, 0.5, 0.5,
2, -3.83579, -6.656132, 1, 1.5, 0.5, 0.5,
2, -3.83579, -6.656132, 0, 1.5, 0.5, 0.5
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
-3.332484, -3, -5.8048,
-3.332484, 2, -5.8048,
-3.332484, -3, -5.8048,
-3.489242, -3, -6.088577,
-3.332484, -2, -5.8048,
-3.489242, -2, -6.088577,
-3.332484, -1, -5.8048,
-3.489242, -1, -6.088577,
-3.332484, 0, -5.8048,
-3.489242, 0, -6.088577,
-3.332484, 1, -5.8048,
-3.489242, 1, -6.088577,
-3.332484, 2, -5.8048,
-3.489242, 2, -6.088577
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
"2"
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
-3.802759, -3, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, -3, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, -3, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, -3, -6.656132, 0, 1.5, 0.5, 0.5,
-3.802759, -2, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, -2, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, -2, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, -2, -6.656132, 0, 1.5, 0.5, 0.5,
-3.802759, -1, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, -1, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, -1, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, -1, -6.656132, 0, 1.5, 0.5, 0.5,
-3.802759, 0, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, 0, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, 0, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, 0, -6.656132, 0, 1.5, 0.5, 0.5,
-3.802759, 1, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, 1, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, 1, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, 1, -6.656132, 0, 1.5, 0.5, 0.5,
-3.802759, 2, -6.656132, 0, -0.5, 0.5, 0.5,
-3.802759, 2, -6.656132, 1, -0.5, 0.5, 0.5,
-3.802759, 2, -6.656132, 1, 1.5, 0.5, 0.5,
-3.802759, 2, -6.656132, 0, 1.5, 0.5, 0.5
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
-3.332484, -3.366083, -4,
-3.332484, -3.366083, 4,
-3.332484, -3.366083, -4,
-3.489242, -3.522652, -4,
-3.332484, -3.366083, -2,
-3.489242, -3.522652, -2,
-3.332484, -3.366083, 0,
-3.489242, -3.522652, 0,
-3.332484, -3.366083, 2,
-3.489242, -3.522652, 2,
-3.332484, -3.366083, 4,
-3.489242, -3.522652, 4
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
-3.802759, -3.83579, -4, 0, -0.5, 0.5, 0.5,
-3.802759, -3.83579, -4, 1, -0.5, 0.5, 0.5,
-3.802759, -3.83579, -4, 1, 1.5, 0.5, 0.5,
-3.802759, -3.83579, -4, 0, 1.5, 0.5, 0.5,
-3.802759, -3.83579, -2, 0, -0.5, 0.5, 0.5,
-3.802759, -3.83579, -2, 1, -0.5, 0.5, 0.5,
-3.802759, -3.83579, -2, 1, 1.5, 0.5, 0.5,
-3.802759, -3.83579, -2, 0, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 0, 0, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 0, 1, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 0, 1, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 0, 0, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 2, 0, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 2, 1, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 2, 1, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 2, 0, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 4, 0, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 4, 1, -0.5, 0.5, 0.5,
-3.802759, -3.83579, 4, 1, 1.5, 0.5, 0.5,
-3.802759, -3.83579, 4, 0, 1.5, 0.5, 0.5
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
-3.332484, -3.366083, -5.8048,
-3.332484, 2.896673, -5.8048,
-3.332484, -3.366083, 5.546291,
-3.332484, 2.896673, 5.546291,
-3.332484, -3.366083, -5.8048,
-3.332484, -3.366083, 5.546291,
-3.332484, 2.896673, -5.8048,
-3.332484, 2.896673, 5.546291,
-3.332484, -3.366083, -5.8048,
2.937857, -3.366083, -5.8048,
-3.332484, -3.366083, 5.546291,
2.937857, -3.366083, 5.546291,
-3.332484, 2.896673, -5.8048,
2.937857, 2.896673, -5.8048,
-3.332484, 2.896673, 5.546291,
2.937857, 2.896673, 5.546291,
2.937857, -3.366083, -5.8048,
2.937857, 2.896673, -5.8048,
2.937857, -3.366083, 5.546291,
2.937857, 2.896673, 5.546291,
2.937857, -3.366083, -5.8048,
2.937857, -3.366083, 5.546291,
2.937857, 2.896673, -5.8048,
2.937857, 2.896673, 5.546291
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
var radius = 7.689813;
var distance = 34.21285;
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
mvMatrix.translate( 0.1973134, 0.234705, 0.1292546 );
mvMatrix.scale( 1.325985, 1.32759, 0.7324737 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.21285);
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
Chlorobenzilate<-read.table("Chlorobenzilate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorobenzilate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzilate' not found
```

```r
y<-Chlorobenzilate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzilate' not found
```

```r
z<-Chlorobenzilate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobenzilate' not found
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
-3.241168, -0.5509527, -1.699136, 0, 0, 1, 1, 1,
-2.72984, -1.482289, -3.203829, 1, 0, 0, 1, 1,
-2.715278, 2.623493, -0.7250769, 1, 0, 0, 1, 1,
-2.58515, 0.8105092, 0.2646399, 1, 0, 0, 1, 1,
-2.578481, 2.285479, -1.663154, 1, 0, 0, 1, 1,
-2.485095, 1.082354, -1.483036, 1, 0, 0, 1, 1,
-2.466732, 2.307997, -0.2285219, 0, 0, 0, 1, 1,
-2.432055, -1.235557, -2.02197, 0, 0, 0, 1, 1,
-2.391559, -0.5430461, -0.1134731, 0, 0, 0, 1, 1,
-2.231849, 1.331851, -2.293082, 0, 0, 0, 1, 1,
-2.202155, 0.8268305, 1.360536, 0, 0, 0, 1, 1,
-2.197056, -0.4049717, -1.073271, 0, 0, 0, 1, 1,
-2.119276, -1.080067, -2.077846, 0, 0, 0, 1, 1,
-2.107034, 0.5590283, -1.94507, 1, 1, 1, 1, 1,
-2.095955, 0.04550851, -0.2041105, 1, 1, 1, 1, 1,
-2.061261, -1.110008, -2.964823, 1, 1, 1, 1, 1,
-2.054565, 0.2642525, -2.101075, 1, 1, 1, 1, 1,
-2.050619, 0.7749658, -3.218616, 1, 1, 1, 1, 1,
-2.034105, -1.548517, -1.425861, 1, 1, 1, 1, 1,
-2.004739, 1.513798, -0.8614494, 1, 1, 1, 1, 1,
-1.92624, 1.159416, -1.040333, 1, 1, 1, 1, 1,
-1.901218, 1.42981, -1.125962, 1, 1, 1, 1, 1,
-1.886793, -0.5802386, -3.919312, 1, 1, 1, 1, 1,
-1.874668, -1.295712, -3.181186, 1, 1, 1, 1, 1,
-1.8338, -0.05755914, -1.602842, 1, 1, 1, 1, 1,
-1.815828, -1.306668, -0.2189368, 1, 1, 1, 1, 1,
-1.801569, 0.7092529, -1.984686, 1, 1, 1, 1, 1,
-1.789511, 0.2607997, -2.94409, 1, 1, 1, 1, 1,
-1.787407, -0.2372795, -3.547053, 0, 0, 1, 1, 1,
-1.782673, -0.7679591, -1.25008, 1, 0, 0, 1, 1,
-1.766598, 0.2318141, -1.834754, 1, 0, 0, 1, 1,
-1.762954, -0.2309017, -1.625528, 1, 0, 0, 1, 1,
-1.761428, -1.404601, -0.3895229, 1, 0, 0, 1, 1,
-1.736498, 1.347465, -1.044325, 1, 0, 0, 1, 1,
-1.689021, 1.13677, 0.3143665, 0, 0, 0, 1, 1,
-1.679754, -0.848493, -2.105032, 0, 0, 0, 1, 1,
-1.658454, 0.5211032, -1.934945, 0, 0, 0, 1, 1,
-1.655279, 2.805468, -0.5091241, 0, 0, 0, 1, 1,
-1.655199, -0.4031194, -1.945488, 0, 0, 0, 1, 1,
-1.652855, 0.7556941, -0.7335865, 0, 0, 0, 1, 1,
-1.649514, -1.268292, -3.031055, 0, 0, 0, 1, 1,
-1.646115, -0.8297719, -3.003649, 1, 1, 1, 1, 1,
-1.644943, 1.644408, 0.03479762, 1, 1, 1, 1, 1,
-1.641246, 1.566665, -0.8910692, 1, 1, 1, 1, 1,
-1.639718, 0.005024586, -2.430387, 1, 1, 1, 1, 1,
-1.636602, 0.7932447, -2.497271, 1, 1, 1, 1, 1,
-1.633327, 0.914888, -0.6048182, 1, 1, 1, 1, 1,
-1.629558, -0.9676951, -3.546566, 1, 1, 1, 1, 1,
-1.62567, -1.677744, -3.480044, 1, 1, 1, 1, 1,
-1.618475, 1.128552, -1.040547, 1, 1, 1, 1, 1,
-1.615964, -0.663072, -2.451986, 1, 1, 1, 1, 1,
-1.612217, -0.959397, -2.840093, 1, 1, 1, 1, 1,
-1.609966, 0.6399608, -2.671705, 1, 1, 1, 1, 1,
-1.597917, -0.7747527, -2.103662, 1, 1, 1, 1, 1,
-1.595182, 0.7168177, -2.652191, 1, 1, 1, 1, 1,
-1.580801, -0.5296744, -1.752352, 1, 1, 1, 1, 1,
-1.580522, 1.349443, -1.407503, 0, 0, 1, 1, 1,
-1.569853, 1.417356, -1.395613, 1, 0, 0, 1, 1,
-1.557128, -1.792433, -0.7877106, 1, 0, 0, 1, 1,
-1.552893, -0.6685753, -4.476015, 1, 0, 0, 1, 1,
-1.541253, 2.490287, -0.5980756, 1, 0, 0, 1, 1,
-1.520718, -0.2161424, 0.1458151, 1, 0, 0, 1, 1,
-1.501617, -0.3750613, -2.230335, 0, 0, 0, 1, 1,
-1.498763, -0.9341878, -1.950868, 0, 0, 0, 1, 1,
-1.49865, -0.8101745, -2.749119, 0, 0, 0, 1, 1,
-1.495418, 0.1431685, -1.929462, 0, 0, 0, 1, 1,
-1.491367, -1.487235, -3.184452, 0, 0, 0, 1, 1,
-1.48809, -2.027442, -0.5011056, 0, 0, 0, 1, 1,
-1.487823, -0.1678267, -1.835637, 0, 0, 0, 1, 1,
-1.474514, 0.2492737, -0.7960748, 1, 1, 1, 1, 1,
-1.471497, 0.8561017, -0.1249566, 1, 1, 1, 1, 1,
-1.470077, -0.1184412, -2.711829, 1, 1, 1, 1, 1,
-1.469119, -0.3497043, -3.442974, 1, 1, 1, 1, 1,
-1.465638, 0.4803008, -0.9609697, 1, 1, 1, 1, 1,
-1.452579, 0.5591964, -1.054566, 1, 1, 1, 1, 1,
-1.451025, -0.02170957, -2.88827, 1, 1, 1, 1, 1,
-1.440404, 0.5993574, -0.5938729, 1, 1, 1, 1, 1,
-1.434026, 0.2694035, -1.234399, 1, 1, 1, 1, 1,
-1.433253, -0.4777675, -2.34418, 1, 1, 1, 1, 1,
-1.426215, 0.83754, -0.9185727, 1, 1, 1, 1, 1,
-1.416767, 0.7309551, -2.751843, 1, 1, 1, 1, 1,
-1.404845, -0.9351535, -0.8493405, 1, 1, 1, 1, 1,
-1.40392, 0.1173403, -2.425395, 1, 1, 1, 1, 1,
-1.391678, 0.6149887, -3.207182, 1, 1, 1, 1, 1,
-1.377662, 0.9466922, -1.606953, 0, 0, 1, 1, 1,
-1.373355, 1.043362, 0.2842541, 1, 0, 0, 1, 1,
-1.368694, 0.4021803, -2.038511, 1, 0, 0, 1, 1,
-1.366101, -0.2263587, -2.535805, 1, 0, 0, 1, 1,
-1.363777, -1.298624, -2.297047, 1, 0, 0, 1, 1,
-1.361567, 0.5524758, 0.08901551, 1, 0, 0, 1, 1,
-1.358548, -1.178784, -2.686328, 0, 0, 0, 1, 1,
-1.358303, -0.8847414, -3.594429, 0, 0, 0, 1, 1,
-1.354561, 0.8955805, -0.8500041, 0, 0, 0, 1, 1,
-1.352537, 0.7140023, -1.864621, 0, 0, 0, 1, 1,
-1.344773, 2.121979, -1.552686, 0, 0, 0, 1, 1,
-1.330568, -1.18579, -1.264844, 0, 0, 0, 1, 1,
-1.317756, 0.6926079, -0.5338636, 0, 0, 0, 1, 1,
-1.314809, 1.132648, -0.5316215, 1, 1, 1, 1, 1,
-1.307251, 1.102524, -2.033264, 1, 1, 1, 1, 1,
-1.30608, 0.6333163, -2.099586, 1, 1, 1, 1, 1,
-1.298977, -0.7985491, -3.785387, 1, 1, 1, 1, 1,
-1.289196, -0.4428407, -3.053812, 1, 1, 1, 1, 1,
-1.278188, 0.6683694, 0.562336, 1, 1, 1, 1, 1,
-1.278174, -0.4961566, -2.334137, 1, 1, 1, 1, 1,
-1.274308, 0.03584721, -2.185917, 1, 1, 1, 1, 1,
-1.270635, 0.2994813, -0.9189983, 1, 1, 1, 1, 1,
-1.269727, -0.2624483, -2.774215, 1, 1, 1, 1, 1,
-1.264214, 0.7203571, -0.7907688, 1, 1, 1, 1, 1,
-1.260674, 0.8931663, -0.8827274, 1, 1, 1, 1, 1,
-1.257921, 0.1944113, -3.419489, 1, 1, 1, 1, 1,
-1.254608, 1.24616, 0.3555523, 1, 1, 1, 1, 1,
-1.249918, 0.8043619, -0.5067641, 1, 1, 1, 1, 1,
-1.2488, 1.942321, -2.166041, 0, 0, 1, 1, 1,
-1.236689, -0.2820195, -1.809751, 1, 0, 0, 1, 1,
-1.232505, 0.9830651, -1.000946, 1, 0, 0, 1, 1,
-1.229823, 1.854532, -2.102531, 1, 0, 0, 1, 1,
-1.220419, 0.5781078, -2.919801, 1, 0, 0, 1, 1,
-1.219829, 0.4072761, -2.101036, 1, 0, 0, 1, 1,
-1.213714, 0.6201264, -0.2640276, 0, 0, 0, 1, 1,
-1.207469, -0.06679767, -2.025942, 0, 0, 0, 1, 1,
-1.205767, 0.3048812, -1.763018, 0, 0, 0, 1, 1,
-1.205464, 0.1109006, -2.260789, 0, 0, 0, 1, 1,
-1.192417, -0.5878685, -2.035656, 0, 0, 0, 1, 1,
-1.189305, 0.4665799, -1.167673, 0, 0, 0, 1, 1,
-1.187116, 0.08426706, -2.715504, 0, 0, 0, 1, 1,
-1.186563, -0.646494, -2.004292, 1, 1, 1, 1, 1,
-1.186558, -2.502897, -2.525257, 1, 1, 1, 1, 1,
-1.179601, -1.212199, -2.731708, 1, 1, 1, 1, 1,
-1.178921, 0.8984746, -2.287812, 1, 1, 1, 1, 1,
-1.16839, 0.255422, -0.5032799, 1, 1, 1, 1, 1,
-1.166687, 0.1642496, -0.824828, 1, 1, 1, 1, 1,
-1.157612, 0.5779307, -2.540364, 1, 1, 1, 1, 1,
-1.152847, 0.1281866, -1.104579, 1, 1, 1, 1, 1,
-1.149693, 0.2997567, -2.437421, 1, 1, 1, 1, 1,
-1.14341, 0.3649543, -1.976316, 1, 1, 1, 1, 1,
-1.140342, -0.68843, -2.065028, 1, 1, 1, 1, 1,
-1.137509, -0.7329385, -2.623232, 1, 1, 1, 1, 1,
-1.132752, 1.54717, -0.03923384, 1, 1, 1, 1, 1,
-1.12749, -0.07341666, -0.7888205, 1, 1, 1, 1, 1,
-1.116954, 0.3122739, -1.768599, 1, 1, 1, 1, 1,
-1.109035, -0.59683, -1.76996, 0, 0, 1, 1, 1,
-1.107645, -0.6022175, -3.244616, 1, 0, 0, 1, 1,
-1.107069, -0.354304, -2.688677, 1, 0, 0, 1, 1,
-1.106542, 1.385505, -1.192863, 1, 0, 0, 1, 1,
-1.105042, 0.6372671, -2.284521, 1, 0, 0, 1, 1,
-1.103766, 0.1508444, -1.235756, 1, 0, 0, 1, 1,
-1.103194, -0.5951522, -2.909686, 0, 0, 0, 1, 1,
-1.102087, -0.9818732, -2.252055, 0, 0, 0, 1, 1,
-1.097551, -0.5075647, -2.708319, 0, 0, 0, 1, 1,
-1.096455, 1.924424, 0.6613988, 0, 0, 0, 1, 1,
-1.094572, -1.182922, -2.128947, 0, 0, 0, 1, 1,
-1.087782, 1.521094, -0.8814805, 0, 0, 0, 1, 1,
-1.086784, -0.4181259, -3.093988, 0, 0, 0, 1, 1,
-1.08272, -1.13442, -1.284827, 1, 1, 1, 1, 1,
-1.069409, 0.5405639, -0.868709, 1, 1, 1, 1, 1,
-1.065628, 2.73148, 0.8753003, 1, 1, 1, 1, 1,
-1.062007, -0.1813243, -2.864569, 1, 1, 1, 1, 1,
-1.059882, -0.2625644, 1.847715, 1, 1, 1, 1, 1,
-1.056794, 1.659656, -0.703279, 1, 1, 1, 1, 1,
-1.056776, 0.4048164, -1.512194, 1, 1, 1, 1, 1,
-1.056358, -0.2955628, -2.410125, 1, 1, 1, 1, 1,
-1.056236, -0.3570852, -1.15854, 1, 1, 1, 1, 1,
-1.054796, 0.7629588, -0.1940549, 1, 1, 1, 1, 1,
-1.05359, 0.2514593, -2.403324, 1, 1, 1, 1, 1,
-1.050277, 0.666775, -2.485514, 1, 1, 1, 1, 1,
-1.049293, -0.1471345, 0.0005019691, 1, 1, 1, 1, 1,
-1.04481, -0.4009975, -1.858555, 1, 1, 1, 1, 1,
-1.040128, -0.298395, -2.614111, 1, 1, 1, 1, 1,
-1.029859, 0.7506334, -0.8407073, 0, 0, 1, 1, 1,
-1.022314, 0.0587056, -2.072106, 1, 0, 0, 1, 1,
-1.019888, -0.7263824, -2.754063, 1, 0, 0, 1, 1,
-1.008056, -1.609657, -3.559149, 1, 0, 0, 1, 1,
-1.005202, 1.488534, -1.549094, 1, 0, 0, 1, 1,
-0.9984332, 2.06494, -0.9733928, 1, 0, 0, 1, 1,
-0.9862289, -0.7674855, -3.157492, 0, 0, 0, 1, 1,
-0.9859414, 0.2706532, -1.622951, 0, 0, 0, 1, 1,
-0.9812483, 0.6481801, -2.420326, 0, 0, 0, 1, 1,
-0.9812399, -0.2665281, 0.1458418, 0, 0, 0, 1, 1,
-0.9793357, 1.654563, -0.2409674, 0, 0, 0, 1, 1,
-0.9746728, 0.6534773, -0.6077774, 0, 0, 0, 1, 1,
-0.9725504, 0.4407193, -2.774886, 0, 0, 0, 1, 1,
-0.972379, 0.7230612, 1.064863, 1, 1, 1, 1, 1,
-0.9718882, -0.3509962, -1.693691, 1, 1, 1, 1, 1,
-0.9701506, 0.3785376, -0.6823885, 1, 1, 1, 1, 1,
-0.9699792, -0.3772505, 0.2638621, 1, 1, 1, 1, 1,
-0.9696382, 1.359973, 0.8954237, 1, 1, 1, 1, 1,
-0.9614712, 0.9880099, -1.949208, 1, 1, 1, 1, 1,
-0.9600797, -0.3142264, -4.181259, 1, 1, 1, 1, 1,
-0.9442235, 0.9685568, -1.16043, 1, 1, 1, 1, 1,
-0.9437271, 1.605523, -1.917517, 1, 1, 1, 1, 1,
-0.943503, 1.693622, 1.116956, 1, 1, 1, 1, 1,
-0.9361423, 0.2834812, -1.618649, 1, 1, 1, 1, 1,
-0.9344858, -0.2018942, -3.020795, 1, 1, 1, 1, 1,
-0.9329677, -0.06643765, -2.261214, 1, 1, 1, 1, 1,
-0.9292534, -2.1834, -4.137844, 1, 1, 1, 1, 1,
-0.9222192, 1.528951, 0.5459328, 1, 1, 1, 1, 1,
-0.9214646, 0.1109902, -1.367805, 0, 0, 1, 1, 1,
-0.9184635, -0.2692917, -3.216018, 1, 0, 0, 1, 1,
-0.9114974, 0.5172083, -2.296037, 1, 0, 0, 1, 1,
-0.9013435, -0.04611714, -0.7980344, 1, 0, 0, 1, 1,
-0.8943121, 0.1000701, -3.567847, 1, 0, 0, 1, 1,
-0.8941715, 0.7352875, -1.098563, 1, 0, 0, 1, 1,
-0.8854963, -2.046294, -3.930341, 0, 0, 0, 1, 1,
-0.8848928, 0.3550706, -2.745776, 0, 0, 0, 1, 1,
-0.8844625, -1.635064, -4.427543, 0, 0, 0, 1, 1,
-0.8785768, 0.1366929, -2.957765, 0, 0, 0, 1, 1,
-0.8702598, 0.1500978, -2.403789, 0, 0, 0, 1, 1,
-0.8690038, 1.733069, 1.281926, 0, 0, 0, 1, 1,
-0.8682228, 0.7723469, -2.06324, 0, 0, 0, 1, 1,
-0.8566285, -0.0119509, 0.658313, 1, 1, 1, 1, 1,
-0.8538783, 0.08787142, -0.7048261, 1, 1, 1, 1, 1,
-0.8504669, -0.6011689, -1.903898, 1, 1, 1, 1, 1,
-0.8496816, -1.36998, -1.182207, 1, 1, 1, 1, 1,
-0.841951, 0.5572934, -0.9648028, 1, 1, 1, 1, 1,
-0.8390776, 2.398881, -2.239889, 1, 1, 1, 1, 1,
-0.8360014, 0.582997, -0.5034254, 1, 1, 1, 1, 1,
-0.8348792, 1.435209, -1.852951, 1, 1, 1, 1, 1,
-0.8327475, 0.7552999, -0.8050969, 1, 1, 1, 1, 1,
-0.8287238, 0.04125895, -1.279548, 1, 1, 1, 1, 1,
-0.827964, 1.988879, 1.038314, 1, 1, 1, 1, 1,
-0.8253969, 0.132972, -2.516984, 1, 1, 1, 1, 1,
-0.8234356, 0.9012362, 0.2912931, 1, 1, 1, 1, 1,
-0.8194675, 0.2331804, -1.718477, 1, 1, 1, 1, 1,
-0.8158371, 1.060127, 0.4681439, 1, 1, 1, 1, 1,
-0.8146534, 1.06196, -0.4414108, 0, 0, 1, 1, 1,
-0.8145429, -0.2604816, -1.253788, 1, 0, 0, 1, 1,
-0.8144369, -1.013417, -2.449476, 1, 0, 0, 1, 1,
-0.8065133, -0.246336, -1.458437, 1, 0, 0, 1, 1,
-0.8036671, 0.5048437, -1.232577, 1, 0, 0, 1, 1,
-0.8006713, -1.831234, -1.80927, 1, 0, 0, 1, 1,
-0.7992991, -0.7374687, -1.416991, 0, 0, 0, 1, 1,
-0.7971326, 1.043566, -0.9646626, 0, 0, 0, 1, 1,
-0.7892595, 0.01387824, -3.837806, 0, 0, 0, 1, 1,
-0.7876623, 0.6320665, -1.237016, 0, 0, 0, 1, 1,
-0.7780182, -0.7583798, -1.786583, 0, 0, 0, 1, 1,
-0.7702991, -0.9023721, -2.198508, 0, 0, 0, 1, 1,
-0.7634988, -0.4066126, -2.243151, 0, 0, 0, 1, 1,
-0.7598259, 0.2582077, -0.9483008, 1, 1, 1, 1, 1,
-0.7570004, -0.2405044, -0.9923093, 1, 1, 1, 1, 1,
-0.7545736, -1.18366, -2.998348, 1, 1, 1, 1, 1,
-0.7531959, -0.4161964, -2.790877, 1, 1, 1, 1, 1,
-0.7504545, -0.8704451, -2.359942, 1, 1, 1, 1, 1,
-0.7482385, 1.303345, 0.3003057, 1, 1, 1, 1, 1,
-0.7466519, -0.4720935, -1.921813, 1, 1, 1, 1, 1,
-0.7457183, -0.2518938, -1.695409, 1, 1, 1, 1, 1,
-0.7432178, 1.276368, -0.8404264, 1, 1, 1, 1, 1,
-0.7425244, 1.447065, 0.3637053, 1, 1, 1, 1, 1,
-0.7349739, 1.376721, -1.221342, 1, 1, 1, 1, 1,
-0.7335158, -0.3713607, -0.4477075, 1, 1, 1, 1, 1,
-0.725825, -0.176564, -2.430567, 1, 1, 1, 1, 1,
-0.7241113, -1.663019, -3.068297, 1, 1, 1, 1, 1,
-0.716352, -0.3377462, -2.815281, 1, 1, 1, 1, 1,
-0.7100763, 0.9732223, 0.6495931, 0, 0, 1, 1, 1,
-0.7070384, -1.013291, -2.950036, 1, 0, 0, 1, 1,
-0.7039211, 1.054967, 0.4273431, 1, 0, 0, 1, 1,
-0.7038826, -0.7837669, -2.615715, 1, 0, 0, 1, 1,
-0.7009052, -0.8973055, -1.282335, 1, 0, 0, 1, 1,
-0.6976218, -0.5369979, -4.38069, 1, 0, 0, 1, 1,
-0.6970446, 0.2798215, -0.9386954, 0, 0, 0, 1, 1,
-0.6949726, -0.7858785, -3.383529, 0, 0, 0, 1, 1,
-0.6937933, 0.5561545, -1.378683, 0, 0, 0, 1, 1,
-0.692795, 0.2195167, -2.27401, 0, 0, 0, 1, 1,
-0.6911808, 0.3816366, 0.7363802, 0, 0, 0, 1, 1,
-0.6896337, -0.6713364, -2.541268, 0, 0, 0, 1, 1,
-0.6867815, -1.521226, -2.134023, 0, 0, 0, 1, 1,
-0.684255, 1.20699, -0.6453444, 1, 1, 1, 1, 1,
-0.6817619, 0.260901, 0.5040889, 1, 1, 1, 1, 1,
-0.677439, 1.03319, 0.1932023, 1, 1, 1, 1, 1,
-0.6767272, -0.1468258, -1.85457, 1, 1, 1, 1, 1,
-0.6713452, -0.3789909, -2.424138, 1, 1, 1, 1, 1,
-0.6699302, 0.6685591, -1.281762, 1, 1, 1, 1, 1,
-0.667257, 0.8379734, -1.127824, 1, 1, 1, 1, 1,
-0.6599134, -0.1401689, -0.5487701, 1, 1, 1, 1, 1,
-0.6581042, 0.9833722, -0.00335241, 1, 1, 1, 1, 1,
-0.6556432, -0.09131959, -2.814657, 1, 1, 1, 1, 1,
-0.6541198, -0.07241914, -1.002835, 1, 1, 1, 1, 1,
-0.6453028, 0.9254962, -0.6259835, 1, 1, 1, 1, 1,
-0.6435337, 1.051795, -1.183801, 1, 1, 1, 1, 1,
-0.643076, 0.1888776, -0.7424756, 1, 1, 1, 1, 1,
-0.6378784, -0.493339, -1.746367, 1, 1, 1, 1, 1,
-0.6350869, -0.1774825, -2.848989, 0, 0, 1, 1, 1,
-0.6340067, 0.9296948, 1.998049, 1, 0, 0, 1, 1,
-0.6324835, -2.212216, -2.540895, 1, 0, 0, 1, 1,
-0.6304565, 0.9748838, 1.446062, 1, 0, 0, 1, 1,
-0.6271392, -0.9379527, -1.83507, 1, 0, 0, 1, 1,
-0.6259344, -0.4012248, -4.037313, 1, 0, 0, 1, 1,
-0.625046, 0.2128576, -0.000735771, 0, 0, 0, 1, 1,
-0.6173009, -0.4643943, -1.97617, 0, 0, 0, 1, 1,
-0.6160662, 0.283236, -2.176649, 0, 0, 0, 1, 1,
-0.6153234, 0.8523971, -0.2467598, 0, 0, 0, 1, 1,
-0.6138375, -0.5677108, -3.434636, 0, 0, 0, 1, 1,
-0.6087148, -0.620916, -4.272941, 0, 0, 0, 1, 1,
-0.6078448, -0.9458122, -3.199323, 0, 0, 0, 1, 1,
-0.6067437, 1.441995, -1.214116, 1, 1, 1, 1, 1,
-0.5993513, 1.95985, 0.01005658, 1, 1, 1, 1, 1,
-0.5989121, -0.4374274, -2.44491, 1, 1, 1, 1, 1,
-0.5969814, 1.340036, 0.4610482, 1, 1, 1, 1, 1,
-0.5949748, 0.03736626, -0.6422876, 1, 1, 1, 1, 1,
-0.5940637, -1.317178, -1.832694, 1, 1, 1, 1, 1,
-0.5825589, 1.296371, 1.205333, 1, 1, 1, 1, 1,
-0.5798135, 0.4181001, -1.166102, 1, 1, 1, 1, 1,
-0.5787756, -0.04960166, -1.965635, 1, 1, 1, 1, 1,
-0.5744126, -0.9600367, -2.735507, 1, 1, 1, 1, 1,
-0.5702353, -0.3274201, -0.4386962, 1, 1, 1, 1, 1,
-0.5682154, 1.046905, 0.8907723, 1, 1, 1, 1, 1,
-0.5660006, -0.3712955, -4.226355, 1, 1, 1, 1, 1,
-0.563704, -1.312343, -3.643446, 1, 1, 1, 1, 1,
-0.5625813, -0.4235795, -3.808824, 1, 1, 1, 1, 1,
-0.5618762, -1.168723, -3.726204, 0, 0, 1, 1, 1,
-0.5594341, -0.4111403, -3.527114, 1, 0, 0, 1, 1,
-0.5565607, 0.3141882, -1.50771, 1, 0, 0, 1, 1,
-0.5490157, 1.047191, 0.6175154, 1, 0, 0, 1, 1,
-0.5458488, 0.482835, -0.5610272, 1, 0, 0, 1, 1,
-0.5438396, -0.6030661, -0.5674374, 1, 0, 0, 1, 1,
-0.5380664, -0.5405448, -2.883136, 0, 0, 0, 1, 1,
-0.5353963, 2.058987, 1.641759, 0, 0, 0, 1, 1,
-0.5347086, 0.36479, 0.09627844, 0, 0, 0, 1, 1,
-0.5330312, -0.2681279, -0.9983608, 0, 0, 0, 1, 1,
-0.5316971, -0.258594, -2.397239, 0, 0, 0, 1, 1,
-0.5306374, -0.8958608, -2.576583, 0, 0, 0, 1, 1,
-0.5282062, -1.40751, -1.169984, 0, 0, 0, 1, 1,
-0.5246574, 0.1181761, -1.186466, 1, 1, 1, 1, 1,
-0.5220711, -0.1820121, -4.150719, 1, 1, 1, 1, 1,
-0.5114086, -0.07589938, -1.649852, 1, 1, 1, 1, 1,
-0.5102924, -0.11331, -0.817682, 1, 1, 1, 1, 1,
-0.509006, -0.8621321, -3.678389, 1, 1, 1, 1, 1,
-0.5080795, -0.3687325, -3.469725, 1, 1, 1, 1, 1,
-0.5021828, 0.46381, -1.14046, 1, 1, 1, 1, 1,
-0.4974418, -0.5568376, -1.055477, 1, 1, 1, 1, 1,
-0.4960111, -2.400687, -3.355179, 1, 1, 1, 1, 1,
-0.495822, 0.29703, -1.551117, 1, 1, 1, 1, 1,
-0.4955285, -0.7908233, -1.021072, 1, 1, 1, 1, 1,
-0.49398, 1.143635, -0.4560304, 1, 1, 1, 1, 1,
-0.4935471, -0.02100567, -2.887505, 1, 1, 1, 1, 1,
-0.4930966, -1.504318, -1.878773, 1, 1, 1, 1, 1,
-0.4929241, 0.01438234, -1.685307, 1, 1, 1, 1, 1,
-0.4921999, -0.1772194, -2.625544, 0, 0, 1, 1, 1,
-0.4919317, -0.1858314, -1.74529, 1, 0, 0, 1, 1,
-0.4902847, 0.5784833, -1.588697, 1, 0, 0, 1, 1,
-0.488157, -0.8462182, -3.379493, 1, 0, 0, 1, 1,
-0.487356, 0.4158736, -1.074251, 1, 0, 0, 1, 1,
-0.4717795, -0.3997256, -2.071233, 1, 0, 0, 1, 1,
-0.4668176, -0.9038342, -2.786619, 0, 0, 0, 1, 1,
-0.4644129, 1.404455, 0.5899556, 0, 0, 0, 1, 1,
-0.4633613, -0.6388872, -1.086608, 0, 0, 0, 1, 1,
-0.4601797, 1.219333, -1.228777, 0, 0, 0, 1, 1,
-0.4599338, 1.702675, -0.197769, 0, 0, 0, 1, 1,
-0.458822, 0.1607841, -0.8416612, 0, 0, 0, 1, 1,
-0.4587569, -0.2753351, -1.554048, 0, 0, 0, 1, 1,
-0.4577919, -1.885619, -3.783202, 1, 1, 1, 1, 1,
-0.4564803, 0.9950655, 0.510146, 1, 1, 1, 1, 1,
-0.4548239, -0.9481608, -2.724477, 1, 1, 1, 1, 1,
-0.4534547, 0.4322776, -0.8125855, 1, 1, 1, 1, 1,
-0.4533275, 0.2120791, -0.3161268, 1, 1, 1, 1, 1,
-0.4531963, 1.565914, -1.221494, 1, 1, 1, 1, 1,
-0.4520318, -0.5221923, -1.796732, 1, 1, 1, 1, 1,
-0.4423011, -0.5720224, -4.111126, 1, 1, 1, 1, 1,
-0.4280648, -1.334555, -2.378583, 1, 1, 1, 1, 1,
-0.4178278, -0.1129595, -2.647017, 1, 1, 1, 1, 1,
-0.4151035, -0.420499, -4.127417, 1, 1, 1, 1, 1,
-0.4122432, -0.3661558, -2.118246, 1, 1, 1, 1, 1,
-0.4076511, 0.03091441, -1.003884, 1, 1, 1, 1, 1,
-0.4046297, -0.5080217, -2.359079, 1, 1, 1, 1, 1,
-0.4039235, 1.047215, -1.035735, 1, 1, 1, 1, 1,
-0.4032119, -1.725389, -2.815211, 0, 0, 1, 1, 1,
-0.4012973, -0.09665108, -2.621631, 1, 0, 0, 1, 1,
-0.3997106, -0.7005653, -1.972186, 1, 0, 0, 1, 1,
-0.3972992, 0.9327362, -0.7877956, 1, 0, 0, 1, 1,
-0.3970013, -0.3178785, -2.450541, 1, 0, 0, 1, 1,
-0.3956269, -0.5903557, -2.841017, 1, 0, 0, 1, 1,
-0.3931734, 0.4090004, -0.7832742, 0, 0, 0, 1, 1,
-0.3880359, -0.3262252, -0.8164755, 0, 0, 0, 1, 1,
-0.3851968, 0.4081526, -1.89232, 0, 0, 0, 1, 1,
-0.3849764, -0.0869865, -2.366684, 0, 0, 0, 1, 1,
-0.3844829, 1.63429, 0.7358415, 0, 0, 0, 1, 1,
-0.3731686, -1.236337, -3.502819, 0, 0, 0, 1, 1,
-0.3730527, -0.2664243, -3.785908, 0, 0, 0, 1, 1,
-0.3692533, 1.074625, -1.234792, 1, 1, 1, 1, 1,
-0.3650255, 0.6672325, -0.4123445, 1, 1, 1, 1, 1,
-0.3642561, 0.6420393, -2.718228, 1, 1, 1, 1, 1,
-0.3624961, 0.1331661, 0.2976644, 1, 1, 1, 1, 1,
-0.3620085, 1.588746, 0.6313307, 1, 1, 1, 1, 1,
-0.3557863, 1.400905, -1.531503, 1, 1, 1, 1, 1,
-0.3545369, 2.216292, 0.3516122, 1, 1, 1, 1, 1,
-0.3538634, -0.2659774, -3.207193, 1, 1, 1, 1, 1,
-0.3524945, 0.1128859, -1.062162, 1, 1, 1, 1, 1,
-0.3516858, 0.02719144, -1.202399, 1, 1, 1, 1, 1,
-0.3460385, -0.03209234, -1.470754, 1, 1, 1, 1, 1,
-0.3377954, -1.257386, -4.387557, 1, 1, 1, 1, 1,
-0.3301067, -1.583591, -1.156975, 1, 1, 1, 1, 1,
-0.3252264, 0.7386004, -1.966298, 1, 1, 1, 1, 1,
-0.3230704, 1.07312, -0.4450398, 1, 1, 1, 1, 1,
-0.3206377, 0.0754059, -2.347094, 0, 0, 1, 1, 1,
-0.3197605, -0.5410182, -0.8317274, 1, 0, 0, 1, 1,
-0.3159388, -0.173801, -2.710524, 1, 0, 0, 1, 1,
-0.3116363, 0.779991, -0.2322393, 1, 0, 0, 1, 1,
-0.3107905, 0.1158963, -1.231841, 1, 0, 0, 1, 1,
-0.3095605, -0.4447727, -1.181378, 1, 0, 0, 1, 1,
-0.3071651, -1.524379, -2.668947, 0, 0, 0, 1, 1,
-0.3062753, 0.2557179, -0.1775714, 0, 0, 0, 1, 1,
-0.305148, -0.2355733, -2.485947, 0, 0, 0, 1, 1,
-0.3013918, 0.3714866, -1.100632, 0, 0, 0, 1, 1,
-0.2950374, -0.7072237, -2.371089, 0, 0, 0, 1, 1,
-0.2914821, -0.2090922, -1.594974, 0, 0, 0, 1, 1,
-0.2904885, 0.0937162, -2.02599, 0, 0, 0, 1, 1,
-0.2897897, -0.959753, -5.346226, 1, 1, 1, 1, 1,
-0.2896867, 2.436228, 0.4497948, 1, 1, 1, 1, 1,
-0.2861272, 0.1130284, -1.763916, 1, 1, 1, 1, 1,
-0.2846444, 0.9163537, -1.82276, 1, 1, 1, 1, 1,
-0.2843279, -0.2629962, -2.772085, 1, 1, 1, 1, 1,
-0.2812853, 0.05052297, -1.625873, 1, 1, 1, 1, 1,
-0.2744672, 1.271583, -0.2394066, 1, 1, 1, 1, 1,
-0.2698455, -3.274878, -2.315139, 1, 1, 1, 1, 1,
-0.2671717, -0.1628828, -2.347851, 1, 1, 1, 1, 1,
-0.2668173, 0.1120263, -0.494938, 1, 1, 1, 1, 1,
-0.2627078, 0.978, -1.963578, 1, 1, 1, 1, 1,
-0.2600124, 0.8009803, -0.3389939, 1, 1, 1, 1, 1,
-0.2576212, 0.3543699, -1.215848, 1, 1, 1, 1, 1,
-0.2519825, 0.4442085, 0.9858003, 1, 1, 1, 1, 1,
-0.2511179, 0.06850134, -1.67498, 1, 1, 1, 1, 1,
-0.2502538, 0.7810013, -0.7451389, 0, 0, 1, 1, 1,
-0.2474704, -0.8145649, -3.692419, 1, 0, 0, 1, 1,
-0.2467777, 0.4721278, -1.962237, 1, 0, 0, 1, 1,
-0.2459766, 0.5136158, 1.586016, 1, 0, 0, 1, 1,
-0.2452009, 2.641699, -0.4427006, 1, 0, 0, 1, 1,
-0.2373503, -0.545165, -2.9451, 1, 0, 0, 1, 1,
-0.2356372, 0.04816192, 0.268612, 0, 0, 0, 1, 1,
-0.2337795, 0.9076478, -0.8574108, 0, 0, 0, 1, 1,
-0.2320259, -1.17689, -2.321386, 0, 0, 0, 1, 1,
-0.2317733, 0.5699983, -0.9340422, 0, 0, 0, 1, 1,
-0.2245711, -1.541046, -2.237631, 0, 0, 0, 1, 1,
-0.2199468, -0.4959454, -3.190894, 0, 0, 0, 1, 1,
-0.2177739, -0.07890322, -2.352136, 0, 0, 0, 1, 1,
-0.2129007, 0.05563086, -1.041134, 1, 1, 1, 1, 1,
-0.2103491, -0.4718635, -3.853029, 1, 1, 1, 1, 1,
-0.2024882, -0.9528174, -5.639493, 1, 1, 1, 1, 1,
-0.1977007, 1.161113, -1.066114, 1, 1, 1, 1, 1,
-0.1960922, -1.966346, -2.053922, 1, 1, 1, 1, 1,
-0.1937767, -2.091055, -3.847241, 1, 1, 1, 1, 1,
-0.1868781, -1.370722, -3.380904, 1, 1, 1, 1, 1,
-0.1859739, 0.01496697, -0.9318097, 1, 1, 1, 1, 1,
-0.1856987, -1.251554, -3.017718, 1, 1, 1, 1, 1,
-0.1807085, -0.5901582, -3.846379, 1, 1, 1, 1, 1,
-0.179885, 0.7973691, -0.06380414, 1, 1, 1, 1, 1,
-0.1771899, 0.1771553, -0.5131184, 1, 1, 1, 1, 1,
-0.1729167, -0.3733068, -1.767447, 1, 1, 1, 1, 1,
-0.170685, 0.7584007, 0.6576683, 1, 1, 1, 1, 1,
-0.1660545, -0.09796245, -4.62339, 1, 1, 1, 1, 1,
-0.1625113, 0.9382097, 0.4164194, 0, 0, 1, 1, 1,
-0.1568737, -0.7148382, -3.287295, 1, 0, 0, 1, 1,
-0.1567663, 0.8099915, 1.870605, 1, 0, 0, 1, 1,
-0.1547585, -0.2158571, -2.348341, 1, 0, 0, 1, 1,
-0.1514654, 0.6596101, -0.2957446, 1, 0, 0, 1, 1,
-0.136992, 0.02935142, -0.54528, 1, 0, 0, 1, 1,
-0.1295694, 0.7740615, -0.501128, 0, 0, 0, 1, 1,
-0.1293122, 0.656969, -1.67005, 0, 0, 0, 1, 1,
-0.1292903, -0.762786, -4.470113, 0, 0, 0, 1, 1,
-0.1237822, 2.144342, 0.8126729, 0, 0, 0, 1, 1,
-0.117075, 1.344685, -0.8855959, 0, 0, 0, 1, 1,
-0.1128352, -0.9438956, -3.382699, 0, 0, 0, 1, 1,
-0.1120958, 1.107441, -1.086251, 0, 0, 0, 1, 1,
-0.1104753, -0.8726751, -2.05062, 1, 1, 1, 1, 1,
-0.1096858, -2.927809, -2.190644, 1, 1, 1, 1, 1,
-0.1082571, -0.4537177, -4.993396, 1, 1, 1, 1, 1,
-0.1062144, 1.05233, 1.162334, 1, 1, 1, 1, 1,
-0.1057075, -0.4029544, -3.382183, 1, 1, 1, 1, 1,
-0.1042157, -0.25198, -3.956084, 1, 1, 1, 1, 1,
-0.1020651, -0.05968776, -2.48554, 1, 1, 1, 1, 1,
-0.1007523, -0.6042545, -2.644907, 1, 1, 1, 1, 1,
-0.100563, 1.086848, 1.454837, 1, 1, 1, 1, 1,
-0.09886429, -1.80327, -4.089808, 1, 1, 1, 1, 1,
-0.09830573, -0.9224304, -1.993382, 1, 1, 1, 1, 1,
-0.09608877, -1.32593, -1.925379, 1, 1, 1, 1, 1,
-0.09509038, -0.1011066, -2.822275, 1, 1, 1, 1, 1,
-0.09248914, -0.4008134, -1.753533, 1, 1, 1, 1, 1,
-0.08589462, -0.5083691, -3.280165, 1, 1, 1, 1, 1,
-0.08134374, 0.2910258, 0.4176816, 0, 0, 1, 1, 1,
-0.07347642, 0.4796817, -1.34015, 1, 0, 0, 1, 1,
-0.07048383, 0.9667589, -1.433793, 1, 0, 0, 1, 1,
-0.06945347, -0.8406951, -2.161406, 1, 0, 0, 1, 1,
-0.06432837, -0.1365839, -2.675999, 1, 0, 0, 1, 1,
-0.06384791, -0.4353807, -2.741261, 1, 0, 0, 1, 1,
-0.05808377, -0.5561032, -2.982421, 0, 0, 0, 1, 1,
-0.05794677, -1.041119, -4.806923, 0, 0, 0, 1, 1,
-0.05750713, -0.5518921, -1.948738, 0, 0, 0, 1, 1,
-0.05241704, 0.1053667, -1.413109, 0, 0, 0, 1, 1,
-0.0509242, -1.054955, -3.310959, 0, 0, 0, 1, 1,
-0.04863196, 1.03572, 0.6309111, 0, 0, 0, 1, 1,
-0.03779051, 0.3901955, 2.313108, 0, 0, 0, 1, 1,
-0.03758643, 1.493659, 0.7518175, 1, 1, 1, 1, 1,
-0.037126, 0.1324748, -0.5325124, 1, 1, 1, 1, 1,
-0.03683684, 1.139487, -0.9223662, 1, 1, 1, 1, 1,
-0.03449659, -0.6776612, -3.266447, 1, 1, 1, 1, 1,
-0.03336843, -1.183334, -3.811436, 1, 1, 1, 1, 1,
-0.03317759, 0.6744034, 1.094198, 1, 1, 1, 1, 1,
-0.02103058, 1.35188, 0.2144498, 1, 1, 1, 1, 1,
-0.02041273, 1.267943, -0.7975565, 1, 1, 1, 1, 1,
-0.01988828, 0.1219401, 2.215853, 1, 1, 1, 1, 1,
-0.01901694, 1.255516, -1.734102, 1, 1, 1, 1, 1,
-0.01136675, -0.6684496, -1.257952, 1, 1, 1, 1, 1,
-0.008683544, 0.4412345, -0.9994172, 1, 1, 1, 1, 1,
-0.008668429, 0.279322, -2.020093, 1, 1, 1, 1, 1,
-0.00600406, 0.7130387, 0.1455946, 1, 1, 1, 1, 1,
0.001475929, 0.211081, -0.7954109, 1, 1, 1, 1, 1,
0.001577878, -1.350023, 3.202081, 0, 0, 1, 1, 1,
0.005746447, 0.3757381, 1.540851, 1, 0, 0, 1, 1,
0.006787454, -0.9293543, 1.4865, 1, 0, 0, 1, 1,
0.00783231, 0.1065071, -0.1896456, 1, 0, 0, 1, 1,
0.01010652, 0.1314836, 0.3191988, 1, 0, 0, 1, 1,
0.01029897, -0.4882461, 3.38396, 1, 0, 0, 1, 1,
0.01093018, 0.09789984, 0.360491, 0, 0, 0, 1, 1,
0.01337995, 0.9795261, -0.3951568, 0, 0, 0, 1, 1,
0.0144075, 0.7509436, 0.6454569, 0, 0, 0, 1, 1,
0.01638909, 1.088592, 0.8511537, 0, 0, 0, 1, 1,
0.01837463, 1.854435, 2.133972, 0, 0, 0, 1, 1,
0.02254822, 2.408391, 0.6078641, 0, 0, 0, 1, 1,
0.02400968, 0.9491194, -0.2078542, 0, 0, 0, 1, 1,
0.02826361, -1.317061, 1.197187, 1, 1, 1, 1, 1,
0.0325717, 1.355127, 0.5370331, 1, 1, 1, 1, 1,
0.03637625, 2.37417, 2.766379, 1, 1, 1, 1, 1,
0.03706966, 1.093236, -0.6000013, 1, 1, 1, 1, 1,
0.03877234, -0.9456022, 3.230689, 1, 1, 1, 1, 1,
0.04037018, 1.198475, -0.3154429, 1, 1, 1, 1, 1,
0.04457937, 1.183412, 1.10365, 1, 1, 1, 1, 1,
0.04557682, 0.5765503, 1.295661, 1, 1, 1, 1, 1,
0.04630962, -1.905233, 3.082108, 1, 1, 1, 1, 1,
0.0467194, -0.2082144, 2.740532, 1, 1, 1, 1, 1,
0.04937662, 1.445828, 1.190412, 1, 1, 1, 1, 1,
0.04942147, -0.231073, 2.539042, 1, 1, 1, 1, 1,
0.05179939, 1.122616, 0.5694917, 1, 1, 1, 1, 1,
0.05468543, 0.5320115, -1.337357, 1, 1, 1, 1, 1,
0.05946017, -1.381019, 2.432155, 1, 1, 1, 1, 1,
0.06512988, -2.639368, 2.709569, 0, 0, 1, 1, 1,
0.06618003, 0.5479603, 0.6570225, 1, 0, 0, 1, 1,
0.07214882, 0.6710351, 0.4862484, 1, 0, 0, 1, 1,
0.08519699, -1.156399, 3.487967, 1, 0, 0, 1, 1,
0.08828037, -0.3179537, 3.537192, 1, 0, 0, 1, 1,
0.08961069, 1.91311, -1.51716, 1, 0, 0, 1, 1,
0.0937965, -1.367882, 3.712985, 0, 0, 0, 1, 1,
0.09512875, -1.001803, 4.281068, 0, 0, 0, 1, 1,
0.09922606, -0.9395513, 3.38238, 0, 0, 0, 1, 1,
0.1003545, -0.3726673, 3.849303, 0, 0, 0, 1, 1,
0.1050914, -0.6257039, 2.960038, 0, 0, 0, 1, 1,
0.1056905, -0.6939905, 2.63016, 0, 0, 0, 1, 1,
0.1074738, 1.485671, 1.669818, 0, 0, 0, 1, 1,
0.1086342, 1.402237, -0.5865354, 1, 1, 1, 1, 1,
0.1111936, -0.1292353, 2.631945, 1, 1, 1, 1, 1,
0.1182458, 0.000228936, 0.6425874, 1, 1, 1, 1, 1,
0.1259313, -0.6043875, 2.372597, 1, 1, 1, 1, 1,
0.1315261, 0.8201159, 0.1437494, 1, 1, 1, 1, 1,
0.1319301, -0.5022289, 4.930256, 1, 1, 1, 1, 1,
0.1327336, 1.179698, 0.8298088, 1, 1, 1, 1, 1,
0.140989, -0.77959, 3.223743, 1, 1, 1, 1, 1,
0.1414361, -1.487114, 3.62758, 1, 1, 1, 1, 1,
0.1480317, -0.2558838, 3.489776, 1, 1, 1, 1, 1,
0.1499565, -1.174199, 2.128395, 1, 1, 1, 1, 1,
0.1601365, -1.890459, 2.670899, 1, 1, 1, 1, 1,
0.1627661, -0.2735378, 4.242521, 1, 1, 1, 1, 1,
0.165493, -0.5976059, 2.716426, 1, 1, 1, 1, 1,
0.1661723, 0.3481058, -0.09781034, 1, 1, 1, 1, 1,
0.168708, 0.7459954, 1.453934, 0, 0, 1, 1, 1,
0.169611, -0.6205652, 2.805743, 1, 0, 0, 1, 1,
0.1697158, 0.4979295, 1.740037, 1, 0, 0, 1, 1,
0.1732338, 0.9554771, 0.7499627, 1, 0, 0, 1, 1,
0.1734102, 2.148583, -1.238172, 1, 0, 0, 1, 1,
0.1738036, -0.8212997, 2.288459, 1, 0, 0, 1, 1,
0.1765123, -0.3822809, 1.784907, 0, 0, 0, 1, 1,
0.1784694, -1.487449, 3.436075, 0, 0, 0, 1, 1,
0.1813579, -0.04837044, 1.211183, 0, 0, 0, 1, 1,
0.1866229, 0.2104233, 1.271236, 0, 0, 0, 1, 1,
0.1871711, -0.8118829, 3.43259, 0, 0, 0, 1, 1,
0.1938692, -1.069737, 2.404013, 0, 0, 0, 1, 1,
0.1986799, 0.0159819, -0.7946257, 0, 0, 0, 1, 1,
0.2023163, -0.3257652, 1.834046, 1, 1, 1, 1, 1,
0.2041643, 0.4884889, 0.9629055, 1, 1, 1, 1, 1,
0.2043658, -0.6536858, 2.829973, 1, 1, 1, 1, 1,
0.2080262, 0.2117771, -0.8720834, 1, 1, 1, 1, 1,
0.2105476, -1.428231, 4.145168, 1, 1, 1, 1, 1,
0.2106022, 1.083971, 0.3856122, 1, 1, 1, 1, 1,
0.2114787, -0.2704996, 4.116705, 1, 1, 1, 1, 1,
0.2187314, -0.3609395, 3.275937, 1, 1, 1, 1, 1,
0.2235914, -1.19646, 2.930432, 1, 1, 1, 1, 1,
0.2237239, -0.9605367, 2.602211, 1, 1, 1, 1, 1,
0.2255241, -0.8726655, 2.114841, 1, 1, 1, 1, 1,
0.2265921, -0.9416027, 2.812706, 1, 1, 1, 1, 1,
0.2291274, -0.595723, 3.970055, 1, 1, 1, 1, 1,
0.2397157, 0.3039438, 1.509933, 1, 1, 1, 1, 1,
0.2443274, -0.19496, 2.353785, 1, 1, 1, 1, 1,
0.2447166, 0.4312183, -0.2133365, 0, 0, 1, 1, 1,
0.2478096, -0.6764377, 1.082675, 1, 0, 0, 1, 1,
0.2509502, -1.381348, 2.065593, 1, 0, 0, 1, 1,
0.2542941, 1.296307, 0.516238, 1, 0, 0, 1, 1,
0.2551951, -1.297795, 1.62775, 1, 0, 0, 1, 1,
0.256862, -2.691599, 1.986834, 1, 0, 0, 1, 1,
0.2580146, -1.242723, 2.945812, 0, 0, 0, 1, 1,
0.2601354, 0.09892538, 0.7905995, 0, 0, 0, 1, 1,
0.2606865, -0.2000577, 2.324694, 0, 0, 0, 1, 1,
0.2628396, 0.4999847, 0.1721081, 0, 0, 0, 1, 1,
0.2658016, 0.1769154, -0.1491025, 0, 0, 0, 1, 1,
0.2767882, -1.165804, 3.178743, 0, 0, 0, 1, 1,
0.2842007, -1.127121, 2.781415, 0, 0, 0, 1, 1,
0.2843941, 0.0245342, 2.523366, 1, 1, 1, 1, 1,
0.2862597, 0.934202, -0.3490762, 1, 1, 1, 1, 1,
0.2866788, 0.3518851, 0.6892822, 1, 1, 1, 1, 1,
0.2889153, 0.451041, 0.02809111, 1, 1, 1, 1, 1,
0.2909629, -1.453292, 2.510896, 1, 1, 1, 1, 1,
0.2996107, -0.1596418, 3.778231, 1, 1, 1, 1, 1,
0.3008181, 0.4651717, 0.974435, 1, 1, 1, 1, 1,
0.301652, 0.9973377, 0.5433732, 1, 1, 1, 1, 1,
0.3026005, 0.4322125, -1.285837, 1, 1, 1, 1, 1,
0.3032084, -2.194259, 1.468961, 1, 1, 1, 1, 1,
0.3056935, -0.6581027, 4.421305, 1, 1, 1, 1, 1,
0.3081326, -0.9321061, 3.542974, 1, 1, 1, 1, 1,
0.3126394, -0.1869107, 1.006272, 1, 1, 1, 1, 1,
0.3127826, -1.557903, 2.272484, 1, 1, 1, 1, 1,
0.3163367, 1.207306, 0.08583751, 1, 1, 1, 1, 1,
0.3168488, 0.7887842, 1.182996, 0, 0, 1, 1, 1,
0.3189174, 1.312076, -1.302728, 1, 0, 0, 1, 1,
0.3214941, -0.8923805, 3.393677, 1, 0, 0, 1, 1,
0.3232516, -1.599359, 2.333283, 1, 0, 0, 1, 1,
0.3289428, 0.219885, -0.3740413, 1, 0, 0, 1, 1,
0.3303166, -0.912132, 3.21627, 1, 0, 0, 1, 1,
0.3380096, -1.420179, 4.06392, 0, 0, 0, 1, 1,
0.341342, -0.8018031, 3.293458, 0, 0, 0, 1, 1,
0.343072, 0.6776814, 0.08872452, 0, 0, 0, 1, 1,
0.3441711, -0.1550493, 4.045948, 0, 0, 0, 1, 1,
0.3482319, 0.7503917, 0.5348023, 0, 0, 0, 1, 1,
0.3499342, -1.397746, 2.333857, 0, 0, 0, 1, 1,
0.3522559, 0.1920733, 0.9415045, 0, 0, 0, 1, 1,
0.355507, 0.6297156, 0.4658282, 1, 1, 1, 1, 1,
0.3596371, -0.6568471, 3.406713, 1, 1, 1, 1, 1,
0.3599184, -0.5560676, 3.276698, 1, 1, 1, 1, 1,
0.3630584, 0.8023697, 0.8852069, 1, 1, 1, 1, 1,
0.3634861, -1.628923, 2.121463, 1, 1, 1, 1, 1,
0.3648917, -0.4005022, 2.9749, 1, 1, 1, 1, 1,
0.3654057, 1.105279, 0.7232292, 1, 1, 1, 1, 1,
0.3686276, 0.2751227, -0.2436163, 1, 1, 1, 1, 1,
0.3686427, -0.2827138, 1.041488, 1, 1, 1, 1, 1,
0.3729947, 1.510503, 1.105052, 1, 1, 1, 1, 1,
0.3763024, -0.3005862, 1.497627, 1, 1, 1, 1, 1,
0.3818767, 0.3487658, 2.973334, 1, 1, 1, 1, 1,
0.3830093, 0.9183843, 1.544147, 1, 1, 1, 1, 1,
0.3837103, -0.4027193, 3.620422, 1, 1, 1, 1, 1,
0.3837401, -0.940357, 2.2087, 1, 1, 1, 1, 1,
0.3873175, 0.207439, 1.078431, 0, 0, 1, 1, 1,
0.3884045, -0.08598655, 0.8374323, 1, 0, 0, 1, 1,
0.3888884, -0.1903212, 0.4315525, 1, 0, 0, 1, 1,
0.396446, 1.033409, 1.178239, 1, 0, 0, 1, 1,
0.4008216, 1.361838, 1.330201, 1, 0, 0, 1, 1,
0.4024931, -0.8512859, 1.953063, 1, 0, 0, 1, 1,
0.4029194, -0.2028203, 2.51151, 0, 0, 0, 1, 1,
0.4030233, 0.7469748, -0.06429967, 0, 0, 0, 1, 1,
0.4093656, -1.627321, 1.936932, 0, 0, 0, 1, 1,
0.4100408, -0.4571028, 2.153554, 0, 0, 0, 1, 1,
0.4106012, 0.7452739, 0.9006086, 0, 0, 0, 1, 1,
0.4192093, -0.0613068, 1.119205, 0, 0, 0, 1, 1,
0.4203593, -1.217262, 2.773839, 0, 0, 0, 1, 1,
0.4216579, 0.1717533, 0.5597076, 1, 1, 1, 1, 1,
0.4233105, 0.05465515, 2.328524, 1, 1, 1, 1, 1,
0.4255265, -0.4259248, 2.676722, 1, 1, 1, 1, 1,
0.4256071, -2.033718, 3.522284, 1, 1, 1, 1, 1,
0.4275796, -0.461371, 3.18896, 1, 1, 1, 1, 1,
0.4352696, -1.18223, 3.827755, 1, 1, 1, 1, 1,
0.4386487, 0.2843379, 0.7621973, 1, 1, 1, 1, 1,
0.4502727, -0.7068771, 2.319495, 1, 1, 1, 1, 1,
0.4515197, -0.5444499, 2.744348, 1, 1, 1, 1, 1,
0.4532762, -0.1851552, 2.562845, 1, 1, 1, 1, 1,
0.453854, 0.1764921, -0.6954473, 1, 1, 1, 1, 1,
0.4544125, -0.03366403, 2.213979, 1, 1, 1, 1, 1,
0.4586483, 0.9591234, -1.475373, 1, 1, 1, 1, 1,
0.4607326, -0.6519611, 2.828345, 1, 1, 1, 1, 1,
0.4616219, 1.294907, -0.5663057, 1, 1, 1, 1, 1,
0.4628252, 1.194227, -1.173571, 0, 0, 1, 1, 1,
0.4649163, -1.225182, 3.575189, 1, 0, 0, 1, 1,
0.4670136, 0.5756421, -0.228565, 1, 0, 0, 1, 1,
0.4753525, 0.4921826, 0.7715056, 1, 0, 0, 1, 1,
0.4754321, 0.5351805, -0.9043007, 1, 0, 0, 1, 1,
0.4793042, -0.7100304, 2.945409, 1, 0, 0, 1, 1,
0.4855735, 1.220702, -1.076378, 0, 0, 0, 1, 1,
0.489244, 1.103273, 0.2010035, 0, 0, 0, 1, 1,
0.4918567, -0.7721735, 2.409622, 0, 0, 0, 1, 1,
0.4949297, 0.7678559, -0.08639459, 0, 0, 0, 1, 1,
0.5042552, 1.740359, -0.5258187, 0, 0, 0, 1, 1,
0.5122684, 0.03850515, 1.488139, 0, 0, 0, 1, 1,
0.5133564, -1.952893, 5.380984, 0, 0, 0, 1, 1,
0.5141998, 0.2393817, 1.433394, 1, 1, 1, 1, 1,
0.5151828, 0.7351229, 2.560227, 1, 1, 1, 1, 1,
0.5233855, -0.2024526, 2.787361, 1, 1, 1, 1, 1,
0.5237047, 0.0434381, 1.743987, 1, 1, 1, 1, 1,
0.5275816, -0.2235654, 1.224853, 1, 1, 1, 1, 1,
0.5280005, -1.086812, 2.911981, 1, 1, 1, 1, 1,
0.5332743, -0.05910604, 2.729176, 1, 1, 1, 1, 1,
0.5431191, 0.2670089, 0.0953915, 1, 1, 1, 1, 1,
0.5437359, 1.677234, 0.8972982, 1, 1, 1, 1, 1,
0.5441244, 1.158615, 1.185624, 1, 1, 1, 1, 1,
0.545681, 1.442035, -0.1796314, 1, 1, 1, 1, 1,
0.5461504, -0.5767785, 0.6971162, 1, 1, 1, 1, 1,
0.5497062, -0.2063333, 1.912966, 1, 1, 1, 1, 1,
0.5530778, 0.05349166, 1.179515, 1, 1, 1, 1, 1,
0.5554087, 0.1133419, 0.2158204, 1, 1, 1, 1, 1,
0.5582945, 0.2830362, 0.3639977, 0, 0, 1, 1, 1,
0.5655816, -0.3162593, 3.495909, 1, 0, 0, 1, 1,
0.5658304, 0.1344844, 2.476797, 1, 0, 0, 1, 1,
0.5659993, 0.1693389, 0.0500621, 1, 0, 0, 1, 1,
0.5740547, -1.08089, 3.811257, 1, 0, 0, 1, 1,
0.5771698, 0.1076088, 2.355434, 1, 0, 0, 1, 1,
0.579646, 0.6879255, 1.883911, 0, 0, 0, 1, 1,
0.5809348, 0.5657843, -0.8329065, 0, 0, 0, 1, 1,
0.5830323, -2.43701, 4.335605, 0, 0, 0, 1, 1,
0.5861361, 0.2024232, -0.4588724, 0, 0, 0, 1, 1,
0.5886295, -0.3565378, 1.097939, 0, 0, 0, 1, 1,
0.5894821, -0.1752516, 1.549781, 0, 0, 0, 1, 1,
0.5897124, 1.208835, 0.00732673, 0, 0, 0, 1, 1,
0.5900442, -0.3475791, 2.904192, 1, 1, 1, 1, 1,
0.6019005, -0.3499322, 3.33892, 1, 1, 1, 1, 1,
0.6076636, 1.553669, -0.172384, 1, 1, 1, 1, 1,
0.6083294, 0.0009484575, 0.5497249, 1, 1, 1, 1, 1,
0.6093408, -0.6638637, 3.456322, 1, 1, 1, 1, 1,
0.6109333, 0.4698656, 0.1816625, 1, 1, 1, 1, 1,
0.6152546, 0.3984887, 0.5073041, 1, 1, 1, 1, 1,
0.6167022, -1.231794, 3.156589, 1, 1, 1, 1, 1,
0.6168776, 0.2049665, 0.5367773, 1, 1, 1, 1, 1,
0.6207041, 0.1459225, 1.533201, 1, 1, 1, 1, 1,
0.6209407, 1.659568, 0.512882, 1, 1, 1, 1, 1,
0.621994, 2.047098, 0.05728192, 1, 1, 1, 1, 1,
0.623437, 0.1016745, 1.438115, 1, 1, 1, 1, 1,
0.6236761, -0.7387594, 3.404986, 1, 1, 1, 1, 1,
0.624255, 0.02030054, 1.143041, 1, 1, 1, 1, 1,
0.6298687, 0.6291382, -1.216122, 0, 0, 1, 1, 1,
0.6315305, 1.191866, 1.344857, 1, 0, 0, 1, 1,
0.6386954, -0.007536283, -0.3624111, 1, 0, 0, 1, 1,
0.6411381, 1.004426, 0.8062624, 1, 0, 0, 1, 1,
0.657348, -0.3517258, 2.494479, 1, 0, 0, 1, 1,
0.6585208, -0.397583, 0.6235119, 1, 0, 0, 1, 1,
0.660544, -0.1480332, 2.602183, 0, 0, 0, 1, 1,
0.6762627, -0.5185602, 2.088159, 0, 0, 0, 1, 1,
0.6764372, -0.893584, 1.991125, 0, 0, 0, 1, 1,
0.677031, -1.206814, 4.019071, 0, 0, 0, 1, 1,
0.6773297, 0.6906314, 2.925984, 0, 0, 0, 1, 1,
0.6778134, 0.3598075, 1.231605, 0, 0, 0, 1, 1,
0.6782157, -1.167291, 2.700789, 0, 0, 0, 1, 1,
0.6820027, -0.0891356, 2.627388, 1, 1, 1, 1, 1,
0.6845162, -0.9087865, 1.070801, 1, 1, 1, 1, 1,
0.6863756, -2.393674, 4.142763, 1, 1, 1, 1, 1,
0.6917461, -0.288316, 1.894127, 1, 1, 1, 1, 1,
0.6946164, -1.26162, 2.305704, 1, 1, 1, 1, 1,
0.6980239, 0.6945597, 0.4339218, 1, 1, 1, 1, 1,
0.6987107, -0.8187773, 3.649457, 1, 1, 1, 1, 1,
0.709269, -0.4126191, 3.031472, 1, 1, 1, 1, 1,
0.7109712, -1.071937, 0.6899403, 1, 1, 1, 1, 1,
0.7118337, -0.4564458, 2.006341, 1, 1, 1, 1, 1,
0.7149723, -0.3042609, 1.906226, 1, 1, 1, 1, 1,
0.7170221, -0.4248302, 1.322294, 1, 1, 1, 1, 1,
0.7192194, 0.8997707, 1.157391, 1, 1, 1, 1, 1,
0.720182, -0.5396811, 0.9883781, 1, 1, 1, 1, 1,
0.7240056, -0.1323728, -0.08805523, 1, 1, 1, 1, 1,
0.7249081, -0.3222055, 4.950067, 0, 0, 1, 1, 1,
0.7266015, -0.2231259, 1.838945, 1, 0, 0, 1, 1,
0.7268981, -0.6531955, 2.125321, 1, 0, 0, 1, 1,
0.7283155, 1.133616, 1.068755, 1, 0, 0, 1, 1,
0.7301298, 0.34661, -0.03406594, 1, 0, 0, 1, 1,
0.7303383, -0.3743227, 2.085506, 1, 0, 0, 1, 1,
0.7353366, 0.142598, 2.119358, 0, 0, 0, 1, 1,
0.7368199, -0.3150426, 0.7449805, 0, 0, 0, 1, 1,
0.7374036, -0.3985371, 1.662746, 0, 0, 0, 1, 1,
0.7408737, 0.2925921, -0.8670013, 0, 0, 0, 1, 1,
0.7412829, 0.6709447, 1.250765, 0, 0, 0, 1, 1,
0.7452236, -0.3123998, 1.907365, 0, 0, 0, 1, 1,
0.7490556, -0.2065354, -1.039976, 0, 0, 0, 1, 1,
0.7498966, -1.723493, 1.789003, 1, 1, 1, 1, 1,
0.7518554, 0.4243132, -0.1715261, 1, 1, 1, 1, 1,
0.7532257, -0.2815527, 1.113419, 1, 1, 1, 1, 1,
0.7532738, -0.6812536, 3.418536, 1, 1, 1, 1, 1,
0.7601618, -1.266282, 2.271569, 1, 1, 1, 1, 1,
0.760585, 0.695436, 0.6159622, 1, 1, 1, 1, 1,
0.7628932, 1.322053, 0.6398598, 1, 1, 1, 1, 1,
0.7731632, 0.5728906, -0.2820967, 1, 1, 1, 1, 1,
0.7742496, 1.032226, 1.312508, 1, 1, 1, 1, 1,
0.7775595, -0.210478, 1.331995, 1, 1, 1, 1, 1,
0.7808553, 1.514594, -0.3481798, 1, 1, 1, 1, 1,
0.7848688, -0.3176369, 0.819797, 1, 1, 1, 1, 1,
0.7856418, 0.6115487, 0.7264429, 1, 1, 1, 1, 1,
0.7952972, 0.283965, 1.727707, 1, 1, 1, 1, 1,
0.7983836, 0.7146429, -0.9445515, 1, 1, 1, 1, 1,
0.8074111, 1.036446, 1.080891, 0, 0, 1, 1, 1,
0.8097869, 0.216233, 0.355925, 1, 0, 0, 1, 1,
0.8172382, -0.2843461, 1.374509, 1, 0, 0, 1, 1,
0.8203662, 2.528793, 0.2750908, 1, 0, 0, 1, 1,
0.8214378, 0.4775651, 1.487087, 1, 0, 0, 1, 1,
0.8228378, 2.591008, 1.576559, 1, 0, 0, 1, 1,
0.8228446, 1.612127, 1.287328, 0, 0, 0, 1, 1,
0.823919, 1.287525, 1.576976, 0, 0, 0, 1, 1,
0.8248343, 0.3342676, 2.19312, 0, 0, 0, 1, 1,
0.8249053, -1.251207, 2.218817, 0, 0, 0, 1, 1,
0.8279854, 0.09395275, 2.285493, 0, 0, 0, 1, 1,
0.8344098, -0.8245773, 1.106976, 0, 0, 0, 1, 1,
0.8472072, 0.8740816, 1.499899, 0, 0, 0, 1, 1,
0.8487057, 1.387775, 0.6104097, 1, 1, 1, 1, 1,
0.8568391, -0.7955849, 4.233688, 1, 1, 1, 1, 1,
0.8570945, -0.1682647, 3.08304, 1, 1, 1, 1, 1,
0.8572936, -2.683478, 1.877294, 1, 1, 1, 1, 1,
0.8578112, 1.62658, 0.7711368, 1, 1, 1, 1, 1,
0.8598382, 0.5194261, 0.7418429, 1, 1, 1, 1, 1,
0.860725, 1.222487, -0.3341972, 1, 1, 1, 1, 1,
0.8615225, -0.1326266, 2.600605, 1, 1, 1, 1, 1,
0.8680234, 1.110691, -1.511623, 1, 1, 1, 1, 1,
0.8700411, 0.7394428, 0.8493067, 1, 1, 1, 1, 1,
0.8720413, 1.111324, 0.4162262, 1, 1, 1, 1, 1,
0.8724282, 1.099412, 1.717257, 1, 1, 1, 1, 1,
0.873744, 1.598803, 0.4174186, 1, 1, 1, 1, 1,
0.8745289, -1.742824, 1.674332, 1, 1, 1, 1, 1,
0.8758751, -1.249653, 2.09657, 1, 1, 1, 1, 1,
0.8868672, -0.4088486, 0.8409485, 0, 0, 1, 1, 1,
0.8945276, -0.04756162, 2.746935, 1, 0, 0, 1, 1,
0.8972028, -1.223091, 2.515623, 1, 0, 0, 1, 1,
0.8993075, 0.1486851, 0.8334039, 1, 0, 0, 1, 1,
0.9022061, -1.280917, 2.250508, 1, 0, 0, 1, 1,
0.9046004, 2.152712, -0.8406484, 1, 0, 0, 1, 1,
0.9049094, 0.1658877, -0.08372448, 0, 0, 0, 1, 1,
0.9050225, 0.8590207, -0.07829651, 0, 0, 0, 1, 1,
0.9109036, 1.495848, 1.294517, 0, 0, 0, 1, 1,
0.9110179, -0.8097742, 4.953218, 0, 0, 0, 1, 1,
0.9280361, 0.224213, 2.690637, 0, 0, 0, 1, 1,
0.9307327, -1.018027, 1.832354, 0, 0, 0, 1, 1,
0.9339713, -1.264672, 1.905307, 0, 0, 0, 1, 1,
0.9343783, -1.852642, 3.745623, 1, 1, 1, 1, 1,
0.9366943, 0.2304537, 2.043873, 1, 1, 1, 1, 1,
0.9369319, -1.176584, 3.051157, 1, 1, 1, 1, 1,
0.9392338, 1.267751, 0.4674458, 1, 1, 1, 1, 1,
0.9421323, 0.4297586, 1.712952, 1, 1, 1, 1, 1,
0.9459941, 0.7924074, 0.6860403, 1, 1, 1, 1, 1,
0.9478908, 1.731671, -1.518205, 1, 1, 1, 1, 1,
0.9531925, -1.596961, 3.437265, 1, 1, 1, 1, 1,
0.9600574, 0.8843537, 1.549806, 1, 1, 1, 1, 1,
0.9648083, -1.951276, 2.309426, 1, 1, 1, 1, 1,
0.969514, -1.953661, 2.592114, 1, 1, 1, 1, 1,
0.9695521, 1.034047, -0.5372726, 1, 1, 1, 1, 1,
0.9781642, 1.249296, 0.1474263, 1, 1, 1, 1, 1,
0.9863489, -0.5461557, 3.464718, 1, 1, 1, 1, 1,
0.994559, 0.01798142, 0.2949183, 1, 1, 1, 1, 1,
0.9954353, 0.2525325, 2.012366, 0, 0, 1, 1, 1,
0.9957346, -0.3327251, 2.124751, 1, 0, 0, 1, 1,
1.006113, 0.5557817, 0.3587033, 1, 0, 0, 1, 1,
1.009435, -0.9698753, 2.736826, 1, 0, 0, 1, 1,
1.015829, -0.4587184, 3.151722, 1, 0, 0, 1, 1,
1.021082, 0.492514, 1.01352, 1, 0, 0, 1, 1,
1.022116, -0.4791983, 4.075218, 0, 0, 0, 1, 1,
1.045341, -0.6260871, -0.1644983, 0, 0, 0, 1, 1,
1.046595, 2.106012, 2.416424, 0, 0, 0, 1, 1,
1.048923, -0.2942683, 1.48275, 0, 0, 0, 1, 1,
1.053224, -0.2121974, 1.451486, 0, 0, 0, 1, 1,
1.056996, 2.383121, -0.20607, 0, 0, 0, 1, 1,
1.060847, -2.271731, 2.901872, 0, 0, 0, 1, 1,
1.065923, -1.573677, 1.517777, 1, 1, 1, 1, 1,
1.072078, -1.68337, 3.14045, 1, 1, 1, 1, 1,
1.07358, 0.9544238, 1.478421, 1, 1, 1, 1, 1,
1.075414, 1.133788, 1.799084, 1, 1, 1, 1, 1,
1.07547, -0.7829506, 3.26638, 1, 1, 1, 1, 1,
1.07757, -0.4273101, 3.514398, 1, 1, 1, 1, 1,
1.079948, -1.144617, 3.970355, 1, 1, 1, 1, 1,
1.080912, -2.060389, 2.229208, 1, 1, 1, 1, 1,
1.082675, -1.061492, 2.358834, 1, 1, 1, 1, 1,
1.090557, 2.233974, -0.4843385, 1, 1, 1, 1, 1,
1.091833, 1.165271, -0.4100775, 1, 1, 1, 1, 1,
1.098135, -0.9736643, 0.6830961, 1, 1, 1, 1, 1,
1.112251, 1.195982, 0.1470036, 1, 1, 1, 1, 1,
1.117269, -1.230137, 2.353915, 1, 1, 1, 1, 1,
1.119685, 0.434444, 0.1314093, 1, 1, 1, 1, 1,
1.133969, -0.3988787, 0.936137, 0, 0, 1, 1, 1,
1.13613, 2.18843, -0.0009512265, 1, 0, 0, 1, 1,
1.137005, 1.552207, 0.3760445, 1, 0, 0, 1, 1,
1.143136, -0.9343576, 2.757676, 1, 0, 0, 1, 1,
1.145896, -0.6404663, 4.620314, 1, 0, 0, 1, 1,
1.151961, -0.2142574, 0.4440988, 1, 0, 0, 1, 1,
1.15586, 0.6851355, 1.566699, 0, 0, 0, 1, 1,
1.160092, -0.4498799, 1.908688, 0, 0, 0, 1, 1,
1.161079, 0.3980841, 0.7746444, 0, 0, 0, 1, 1,
1.161554, 0.3179687, 1.214263, 0, 0, 0, 1, 1,
1.163799, -0.8889878, 1.081146, 0, 0, 0, 1, 1,
1.167488, -0.3172841, 1.238366, 0, 0, 0, 1, 1,
1.16763, -0.04069732, 2.112794, 0, 0, 0, 1, 1,
1.167726, 1.132279, 0.8902615, 1, 1, 1, 1, 1,
1.168731, -0.815279, 1.86088, 1, 1, 1, 1, 1,
1.170066, 0.7318864, 1.15185, 1, 1, 1, 1, 1,
1.176991, 0.1375968, 1.963752, 1, 1, 1, 1, 1,
1.180989, -1.21786, 2.574108, 1, 1, 1, 1, 1,
1.184839, 0.3801567, 2.53571, 1, 1, 1, 1, 1,
1.184874, -1.395691, 0.8047324, 1, 1, 1, 1, 1,
1.19228, -0.5627408, 1.286809, 1, 1, 1, 1, 1,
1.201072, -0.02109881, 1.780334, 1, 1, 1, 1, 1,
1.20229, 0.76906, 1.782399, 1, 1, 1, 1, 1,
1.20493, -0.5183305, 1.203568, 1, 1, 1, 1, 1,
1.206981, -1.09786, 1.696858, 1, 1, 1, 1, 1,
1.214924, 1.48918, -0.1011891, 1, 1, 1, 1, 1,
1.220535, 1.450733, 0.3711466, 1, 1, 1, 1, 1,
1.238526, -1.058903, 2.867895, 1, 1, 1, 1, 1,
1.245856, 1.099508, 2.529675, 0, 0, 1, 1, 1,
1.250162, 0.7135618, 0.9423615, 1, 0, 0, 1, 1,
1.253801, -0.4205321, 1.063815, 1, 0, 0, 1, 1,
1.26574, 0.4988197, -0.3206511, 1, 0, 0, 1, 1,
1.265841, 0.5707491, 2.544393, 1, 0, 0, 1, 1,
1.276194, -1.871311, 1.387464, 1, 0, 0, 1, 1,
1.2784, -0.9323234, 3.91404, 0, 0, 0, 1, 1,
1.293788, -0.4535501, 0.2598877, 0, 0, 0, 1, 1,
1.297052, 0.9849393, 2.517003, 0, 0, 0, 1, 1,
1.312728, 0.1448488, 3.673851, 0, 0, 0, 1, 1,
1.319642, -1.334922, 2.94422, 0, 0, 0, 1, 1,
1.319912, -0.07872693, 2.380993, 0, 0, 0, 1, 1,
1.329151, -1.216477, 3.395458, 0, 0, 0, 1, 1,
1.329506, 1.845531, 3.187075, 1, 1, 1, 1, 1,
1.339196, 0.1996145, 0.3374221, 1, 1, 1, 1, 1,
1.34263, -1.100808, 2.237582, 1, 1, 1, 1, 1,
1.344033, 0.8690977, 1.280281, 1, 1, 1, 1, 1,
1.345831, -0.3517486, 0.5394368, 1, 1, 1, 1, 1,
1.34674, -0.9986747, 2.64128, 1, 1, 1, 1, 1,
1.36815, 0.1290469, 2.193334, 1, 1, 1, 1, 1,
1.374881, 0.107161, 1.358512, 1, 1, 1, 1, 1,
1.376613, -0.9571035, 3.284388, 1, 1, 1, 1, 1,
1.398111, -0.191097, 3.384392, 1, 1, 1, 1, 1,
1.404125, 0.8603086, 2.521135, 1, 1, 1, 1, 1,
1.411857, 0.02215529, 2.983392, 1, 1, 1, 1, 1,
1.418546, 0.6979854, 1.834307, 1, 1, 1, 1, 1,
1.419906, -0.2235333, 1.834378, 1, 1, 1, 1, 1,
1.426229, -0.8243584, 2.4072, 1, 1, 1, 1, 1,
1.429582, -0.04270434, 2.294423, 0, 0, 1, 1, 1,
1.432882, -0.5295982, 2.011317, 1, 0, 0, 1, 1,
1.435439, 0.8593156, 1.146745, 1, 0, 0, 1, 1,
1.444451, 1.04746, 1.31129, 1, 0, 0, 1, 1,
1.445588, 0.9770439, 2.994083, 1, 0, 0, 1, 1,
1.459956, -1.812368, 2.491819, 1, 0, 0, 1, 1,
1.474335, -0.1745153, 3.439074, 0, 0, 0, 1, 1,
1.486963, -1.0926, 2.206751, 0, 0, 0, 1, 1,
1.507847, -0.3257025, 3.231601, 0, 0, 0, 1, 1,
1.509328, -0.4108545, 2.693793, 0, 0, 0, 1, 1,
1.512311, -1.100689, 2.496021, 0, 0, 0, 1, 1,
1.521478, 0.09936397, 1.030275, 0, 0, 0, 1, 1,
1.522277, -0.6953575, 1.944412, 0, 0, 0, 1, 1,
1.52303, -0.4814495, 2.788093, 1, 1, 1, 1, 1,
1.531839, 0.4292385, 0.9136336, 1, 1, 1, 1, 1,
1.540947, -0.9437703, 2.846336, 1, 1, 1, 1, 1,
1.553017, 1.088924, 1.295017, 1, 1, 1, 1, 1,
1.562781, 0.7542782, 3.91346, 1, 1, 1, 1, 1,
1.565544, -0.4831727, 3.226053, 1, 1, 1, 1, 1,
1.568151, -1.090792, 1.289634, 1, 1, 1, 1, 1,
1.574973, -0.3911411, 2.628753, 1, 1, 1, 1, 1,
1.576251, -0.8044128, 1.174423, 1, 1, 1, 1, 1,
1.593877, 1.113449, 2.097012, 1, 1, 1, 1, 1,
1.634814, -0.7840618, 4.322622, 1, 1, 1, 1, 1,
1.645163, 2.758982, 1.5493, 1, 1, 1, 1, 1,
1.648282, -1.347679, 3.280857, 1, 1, 1, 1, 1,
1.651548, -2.093364, 3.42827, 1, 1, 1, 1, 1,
1.653248, -0.9368957, 3.152774, 1, 1, 1, 1, 1,
1.655105, -1.085281, 2.509888, 0, 0, 1, 1, 1,
1.668589, 0.2411658, 0.726032, 1, 0, 0, 1, 1,
1.684821, 0.4680588, 1.456849, 1, 0, 0, 1, 1,
1.689282, 0.4672237, 2.364031, 1, 0, 0, 1, 1,
1.691839, -0.2388722, 1.864284, 1, 0, 0, 1, 1,
1.703938, -0.01865432, 1.616592, 1, 0, 0, 1, 1,
1.715454, 2.05113, -0.3646479, 0, 0, 0, 1, 1,
1.730465, -0.4086443, 0.09675361, 0, 0, 0, 1, 1,
1.776818, 0.4878728, 0.8292136, 0, 0, 0, 1, 1,
1.777979, 0.2579069, 1.877865, 0, 0, 0, 1, 1,
1.784875, 0.2957314, 2.55938, 0, 0, 0, 1, 1,
1.825171, -0.8907954, 1.620435, 0, 0, 0, 1, 1,
1.828143, -0.05796118, 2.731777, 0, 0, 0, 1, 1,
1.828429, -1.063197, 2.919472, 1, 1, 1, 1, 1,
1.837021, -1.251587, 1.604162, 1, 1, 1, 1, 1,
1.854707, 0.2761113, 2.350639, 1, 1, 1, 1, 1,
1.866982, -0.4848407, 1.050928, 1, 1, 1, 1, 1,
1.871734, -0.4881248, 1.361447, 1, 1, 1, 1, 1,
1.878064, -0.6095544, 3.861561, 1, 1, 1, 1, 1,
1.894323, 0.02448604, 1.19827, 1, 1, 1, 1, 1,
1.905635, -0.8261612, 2.36818, 1, 1, 1, 1, 1,
1.90692, -0.956153, 2.451996, 1, 1, 1, 1, 1,
1.964501, 0.01959513, 2.557258, 1, 1, 1, 1, 1,
2.060387, -0.4769974, 0.9218358, 1, 1, 1, 1, 1,
2.081089, 0.4174653, 2.403481, 1, 1, 1, 1, 1,
2.082948, -0.3089989, 1.066173, 1, 1, 1, 1, 1,
2.089732, -0.4648872, -0.02290606, 1, 1, 1, 1, 1,
2.110208, 0.3146612, 1.352232, 1, 1, 1, 1, 1,
2.172026, -0.6372181, 3.258887, 0, 0, 1, 1, 1,
2.19323, -0.1666345, 2.493239, 1, 0, 0, 1, 1,
2.205421, -1.483525, 1.698676, 1, 0, 0, 1, 1,
2.219477, 1.005884, 1.537411, 1, 0, 0, 1, 1,
2.240536, -1.209144, 1.133079, 1, 0, 0, 1, 1,
2.280937, 0.6562067, 2.357151, 1, 0, 0, 1, 1,
2.306745, 1.898255, 0.7274578, 0, 0, 0, 1, 1,
2.310041, 0.08484066, 2.690426, 0, 0, 0, 1, 1,
2.36494, 1.729445, 3.479161, 0, 0, 0, 1, 1,
2.415732, 0.4621851, 1.86363, 0, 0, 0, 1, 1,
2.417048, -1.336741, 1.54944, 0, 0, 0, 1, 1,
2.42289, 0.2602344, 1.605438, 0, 0, 0, 1, 1,
2.461152, 0.09512847, 1.903525, 0, 0, 0, 1, 1,
2.498407, 1.91574, -0.1114447, 1, 1, 1, 1, 1,
2.531173, -0.736813, 2.120521, 1, 1, 1, 1, 1,
2.533701, 1.756753, -0.1541766, 1, 1, 1, 1, 1,
2.55363, 0.1807518, 1.461004, 1, 1, 1, 1, 1,
2.577071, 0.2293644, 1.124135, 1, 1, 1, 1, 1,
2.585357, 1.330409, 2.62617, 1, 1, 1, 1, 1,
2.846541, -0.7180517, 1.966259, 1, 1, 1, 1, 1
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
var radius = 9.530024;
var distance = 33.4738;
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
mvMatrix.translate( 0.1973134, 0.2347051, 0.1292546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4738);
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
