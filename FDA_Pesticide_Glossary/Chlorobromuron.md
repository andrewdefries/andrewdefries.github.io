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
-3.074998, 1.77294, 0.04305209, 1, 0, 0, 1,
-3.030138, 1.25094, -2.452041, 1, 0.007843138, 0, 1,
-2.82528, 0.2711979, 0.3736255, 1, 0.01176471, 0, 1,
-2.667385, -0.2096308, -0.3097295, 1, 0.01960784, 0, 1,
-2.469252, -1.541409, -0.09547269, 1, 0.02352941, 0, 1,
-2.414995, -1.107505, -3.081426, 1, 0.03137255, 0, 1,
-2.240783, -0.3880244, -1.565012, 1, 0.03529412, 0, 1,
-2.222356, 1.185216, -1.817616, 1, 0.04313726, 0, 1,
-2.152651, 0.05886469, -2.333995, 1, 0.04705882, 0, 1,
-2.137516, 1.821678, -0.4575808, 1, 0.05490196, 0, 1,
-2.133153, -2.058722, -1.952, 1, 0.05882353, 0, 1,
-2.095425, 0.3117453, -1.7411, 1, 0.06666667, 0, 1,
-2.047486, 0.2361062, -1.147676, 1, 0.07058824, 0, 1,
-2.043983, -0.7690768, -2.839079, 1, 0.07843138, 0, 1,
-2.007664, 0.7725415, 0.213892, 1, 0.08235294, 0, 1,
-1.99106, -2.332001, -5.421713, 1, 0.09019608, 0, 1,
-1.986944, -0.944961, -0.6220539, 1, 0.09411765, 0, 1,
-1.978488, 0.8385925, -1.85477, 1, 0.1019608, 0, 1,
-1.922413, 1.272327, -2.248951, 1, 0.1098039, 0, 1,
-1.899357, -1.630019, -2.855267, 1, 0.1137255, 0, 1,
-1.884024, 0.2548633, -3.8652, 1, 0.1215686, 0, 1,
-1.874626, 0.9613093, -1.441771, 1, 0.1254902, 0, 1,
-1.862918, 1.904283, -0.0851213, 1, 0.1333333, 0, 1,
-1.858637, -0.03203192, -1.076699, 1, 0.1372549, 0, 1,
-1.858521, -0.2731206, -0.1148944, 1, 0.145098, 0, 1,
-1.79904, 0.6628734, 0.6262327, 1, 0.1490196, 0, 1,
-1.786842, 2.693234, -1.414898, 1, 0.1568628, 0, 1,
-1.78563, 0.4909708, -3.05431, 1, 0.1607843, 0, 1,
-1.784426, -1.430143, -2.993484, 1, 0.1686275, 0, 1,
-1.782704, -1.026506, -2.528998, 1, 0.172549, 0, 1,
-1.771288, 0.3021912, -1.087552, 1, 0.1803922, 0, 1,
-1.766687, 0.311262, -0.5671856, 1, 0.1843137, 0, 1,
-1.761957, 0.2473894, -1.41094, 1, 0.1921569, 0, 1,
-1.756994, 0.1342102, -1.875571, 1, 0.1960784, 0, 1,
-1.73769, 0.468432, -2.539133, 1, 0.2039216, 0, 1,
-1.732641, 0.6026538, -1.180951, 1, 0.2117647, 0, 1,
-1.726947, 0.3799151, -2.55986, 1, 0.2156863, 0, 1,
-1.725944, 0.04306677, -2.148907, 1, 0.2235294, 0, 1,
-1.721921, -0.4259894, -1.383618, 1, 0.227451, 0, 1,
-1.71342, 0.4844178, -3.125878, 1, 0.2352941, 0, 1,
-1.705652, 0.4374265, 0.01240438, 1, 0.2392157, 0, 1,
-1.699877, -0.7401935, -2.473781, 1, 0.2470588, 0, 1,
-1.692241, -1.235045, -3.040013, 1, 0.2509804, 0, 1,
-1.691406, 0.1901783, -0.3255745, 1, 0.2588235, 0, 1,
-1.68935, -0.5720067, -0.9114481, 1, 0.2627451, 0, 1,
-1.687263, 0.7659221, -0.1596913, 1, 0.2705882, 0, 1,
-1.685637, 1.083657, -2.341737, 1, 0.2745098, 0, 1,
-1.68379, 1.420428, -1.624074, 1, 0.282353, 0, 1,
-1.671545, 0.1460991, -2.967925, 1, 0.2862745, 0, 1,
-1.669162, -1.19065, -2.004029, 1, 0.2941177, 0, 1,
-1.653877, -0.09327868, 0.02065871, 1, 0.3019608, 0, 1,
-1.651213, -1.544889, -1.810349, 1, 0.3058824, 0, 1,
-1.644727, 0.1314212, -0.9628325, 1, 0.3137255, 0, 1,
-1.629787, 0.7874889, -2.426744, 1, 0.3176471, 0, 1,
-1.627414, 0.392486, -0.4684866, 1, 0.3254902, 0, 1,
-1.627102, -1.094156, -1.461101, 1, 0.3294118, 0, 1,
-1.618091, -1.150057, -3.512651, 1, 0.3372549, 0, 1,
-1.603933, -1.172131, -1.991032, 1, 0.3411765, 0, 1,
-1.596781, 0.2857097, -1.249408, 1, 0.3490196, 0, 1,
-1.582565, 0.6213151, -0.4917501, 1, 0.3529412, 0, 1,
-1.575822, 1.651889, -1.788822, 1, 0.3607843, 0, 1,
-1.567528, 0.6571128, -1.129386, 1, 0.3647059, 0, 1,
-1.55609, 0.894765, -1.701609, 1, 0.372549, 0, 1,
-1.546783, -0.3874973, -1.884532, 1, 0.3764706, 0, 1,
-1.543125, 0.6989336, -0.897086, 1, 0.3843137, 0, 1,
-1.524841, 0.4509749, -0.7043515, 1, 0.3882353, 0, 1,
-1.524128, 0.01858246, -2.174069, 1, 0.3960784, 0, 1,
-1.521681, -2.28987, -2.443941, 1, 0.4039216, 0, 1,
-1.52087, -0.846856, -3.085883, 1, 0.4078431, 0, 1,
-1.515905, 1.218889, -2.150816, 1, 0.4156863, 0, 1,
-1.506477, 1.867239, -0.5045453, 1, 0.4196078, 0, 1,
-1.471953, 0.2064217, -1.262287, 1, 0.427451, 0, 1,
-1.445056, -0.3749526, -1.948696, 1, 0.4313726, 0, 1,
-1.429643, -0.6931123, -1.204706, 1, 0.4392157, 0, 1,
-1.426698, 0.3457516, -1.549679, 1, 0.4431373, 0, 1,
-1.42571, 0.8695784, -0.6130461, 1, 0.4509804, 0, 1,
-1.413417, 0.2998597, -1.955956, 1, 0.454902, 0, 1,
-1.406242, 0.8635783, -2.233769, 1, 0.4627451, 0, 1,
-1.39366, 0.07242677, -3.417146, 1, 0.4666667, 0, 1,
-1.375624, 0.776969, -1.412968, 1, 0.4745098, 0, 1,
-1.371547, 0.5245491, -1.885032, 1, 0.4784314, 0, 1,
-1.365071, 1.798953, -0.1350343, 1, 0.4862745, 0, 1,
-1.357423, -1.465812, -2.948461, 1, 0.4901961, 0, 1,
-1.340379, -1.102335, -1.517197, 1, 0.4980392, 0, 1,
-1.337158, -0.5684246, -3.120103, 1, 0.5058824, 0, 1,
-1.321656, 0.4597685, -0.3035104, 1, 0.509804, 0, 1,
-1.32155, 0.8386713, 0.04225224, 1, 0.5176471, 0, 1,
-1.313606, -0.3660828, -2.401447, 1, 0.5215687, 0, 1,
-1.311205, -0.6372744, -1.53903, 1, 0.5294118, 0, 1,
-1.310308, 0.8392025, 0.2918852, 1, 0.5333334, 0, 1,
-1.307936, 0.2857229, -2.813065, 1, 0.5411765, 0, 1,
-1.298553, -1.614408, -2.849596, 1, 0.5450981, 0, 1,
-1.298038, 0.717568, 0.3151431, 1, 0.5529412, 0, 1,
-1.293191, -0.6094334, -2.409752, 1, 0.5568628, 0, 1,
-1.267563, -0.6966, -2.270804, 1, 0.5647059, 0, 1,
-1.263998, 0.206741, -0.1536717, 1, 0.5686275, 0, 1,
-1.257657, 0.4186403, -3.423237, 1, 0.5764706, 0, 1,
-1.254727, -0.02321902, -2.579527, 1, 0.5803922, 0, 1,
-1.251149, -0.5630394, -1.777671, 1, 0.5882353, 0, 1,
-1.250065, -0.8154119, -4.187778, 1, 0.5921569, 0, 1,
-1.23766, 0.5945992, -0.713513, 1, 0.6, 0, 1,
-1.234422, 1.847339, -0.03325349, 1, 0.6078432, 0, 1,
-1.233015, 0.5170264, -1.895358, 1, 0.6117647, 0, 1,
-1.231126, 1.373219, -1.372697, 1, 0.6196079, 0, 1,
-1.224237, -0.07702136, -0.5693929, 1, 0.6235294, 0, 1,
-1.221516, 1.152665, -0.9375745, 1, 0.6313726, 0, 1,
-1.215026, 0.00990055, -1.715176, 1, 0.6352941, 0, 1,
-1.212362, 0.3236606, 1.163312, 1, 0.6431373, 0, 1,
-1.208291, -0.6817476, -0.8078302, 1, 0.6470588, 0, 1,
-1.207462, -0.1284982, -0.3285682, 1, 0.654902, 0, 1,
-1.194232, -0.428905, -1.243883, 1, 0.6588235, 0, 1,
-1.193087, -0.7609825, -2.124964, 1, 0.6666667, 0, 1,
-1.192005, 1.244803, 0.7184556, 1, 0.6705883, 0, 1,
-1.189802, -1.131876, -1.963115, 1, 0.6784314, 0, 1,
-1.187866, -1.153724, -1.962812, 1, 0.682353, 0, 1,
-1.176426, -1.053544, -2.107678, 1, 0.6901961, 0, 1,
-1.176293, -0.187877, -2.457231, 1, 0.6941177, 0, 1,
-1.175463, 1.018617, 0.3141597, 1, 0.7019608, 0, 1,
-1.166664, 0.4549416, 0.1427775, 1, 0.7098039, 0, 1,
-1.159603, 1.245607, -0.5881809, 1, 0.7137255, 0, 1,
-1.152317, 1.151361, -1.552012, 1, 0.7215686, 0, 1,
-1.151659, 1.422196, -0.6564963, 1, 0.7254902, 0, 1,
-1.116094, 0.5789402, 1.017386, 1, 0.7333333, 0, 1,
-1.107715, 2.365532, -1.020179, 1, 0.7372549, 0, 1,
-1.10402, -0.6080657, -2.224487, 1, 0.7450981, 0, 1,
-1.095164, 0.5359058, -0.2728094, 1, 0.7490196, 0, 1,
-1.083223, -0.576624, -1.847905, 1, 0.7568628, 0, 1,
-1.076756, 0.6746414, -4.12887, 1, 0.7607843, 0, 1,
-1.062983, 0.9444001, -0.3680905, 1, 0.7686275, 0, 1,
-1.054917, 0.4142609, -0.5386837, 1, 0.772549, 0, 1,
-1.05334, 1.070284, -2.598797, 1, 0.7803922, 0, 1,
-1.052088, -0.1276212, -1.876054, 1, 0.7843137, 0, 1,
-1.051607, -0.4642679, -2.590405, 1, 0.7921569, 0, 1,
-1.05065, -0.5131961, -2.825862, 1, 0.7960784, 0, 1,
-1.043343, 1.247012, -1.937462, 1, 0.8039216, 0, 1,
-1.042929, -0.3115089, -0.1293424, 1, 0.8117647, 0, 1,
-1.037262, 0.7191023, 0.06529155, 1, 0.8156863, 0, 1,
-1.030735, 0.333128, -0.7404879, 1, 0.8235294, 0, 1,
-1.023488, 1.314491, 0.328386, 1, 0.827451, 0, 1,
-1.007983, -0.3993683, -2.450951, 1, 0.8352941, 0, 1,
-1.006837, -0.5896819, -1.011695, 1, 0.8392157, 0, 1,
-1.006734, -0.06708074, -0.3106816, 1, 0.8470588, 0, 1,
-1.005629, 1.077576, -0.5014361, 1, 0.8509804, 0, 1,
-1.002164, -0.3989724, -1.70672, 1, 0.8588235, 0, 1,
-1.000681, -1.024819, -1.656662, 1, 0.8627451, 0, 1,
-0.9994366, 1.504833, -0.5552123, 1, 0.8705882, 0, 1,
-0.9979923, 0.7527376, -0.4201413, 1, 0.8745098, 0, 1,
-0.9952926, -1.435008, -2.628803, 1, 0.8823529, 0, 1,
-0.9846489, -0.6047332, -1.305165, 1, 0.8862745, 0, 1,
-0.9842972, 0.3448468, -0.2252601, 1, 0.8941177, 0, 1,
-0.9810189, -0.5235785, -2.29498, 1, 0.8980392, 0, 1,
-0.9723698, -1.57758, -2.863854, 1, 0.9058824, 0, 1,
-0.9697915, -0.8650163, 0.3097643, 1, 0.9137255, 0, 1,
-0.9683974, -0.4704597, -2.159013, 1, 0.9176471, 0, 1,
-0.9679981, 0.434248, -1.435012, 1, 0.9254902, 0, 1,
-0.9670894, 0.4153245, 0.3900821, 1, 0.9294118, 0, 1,
-0.9670076, -0.392902, -2.869145, 1, 0.9372549, 0, 1,
-0.957021, 0.6023983, -0.6521393, 1, 0.9411765, 0, 1,
-0.9532622, 0.04668928, -0.9298412, 1, 0.9490196, 0, 1,
-0.9514237, -0.2932309, -3.130845, 1, 0.9529412, 0, 1,
-0.9502713, -0.1289226, -2.03934, 1, 0.9607843, 0, 1,
-0.9447283, 0.0365191, -2.24382, 1, 0.9647059, 0, 1,
-0.9430171, -0.5760893, -2.804123, 1, 0.972549, 0, 1,
-0.942794, -0.2651162, -0.2809411, 1, 0.9764706, 0, 1,
-0.9383546, 1.691209, -1.647414, 1, 0.9843137, 0, 1,
-0.9347489, -0.5274282, -2.700295, 1, 0.9882353, 0, 1,
-0.9331006, -0.403933, -1.297305, 1, 0.9960784, 0, 1,
-0.9316472, -0.6581887, -1.868356, 0.9960784, 1, 0, 1,
-0.9216301, -0.8483954, -1.756732, 0.9921569, 1, 0, 1,
-0.9195189, -0.3860181, -2.873797, 0.9843137, 1, 0, 1,
-0.919164, 0.8734556, -1.04178, 0.9803922, 1, 0, 1,
-0.9188831, -0.8065595, -1.550868, 0.972549, 1, 0, 1,
-0.9126941, 0.02053098, -1.877156, 0.9686275, 1, 0, 1,
-0.9125162, -0.5153517, -2.256582, 0.9607843, 1, 0, 1,
-0.9123924, -0.3473524, -2.022162, 0.9568627, 1, 0, 1,
-0.9050006, 0.4216424, -1.393155, 0.9490196, 1, 0, 1,
-0.9016577, 0.7763416, -1.991067, 0.945098, 1, 0, 1,
-0.9013525, 2.248355, 0.3914226, 0.9372549, 1, 0, 1,
-0.8963993, 0.03982721, -1.35799, 0.9333333, 1, 0, 1,
-0.8960703, 0.7821112, -1.440998, 0.9254902, 1, 0, 1,
-0.8820507, 0.8105512, -0.4809584, 0.9215686, 1, 0, 1,
-0.8778519, -1.390724, -1.797747, 0.9137255, 1, 0, 1,
-0.8773229, 1.058332, -1.68602, 0.9098039, 1, 0, 1,
-0.8624874, 0.7233645, -1.110542, 0.9019608, 1, 0, 1,
-0.8558202, 0.2726333, -3.310561, 0.8941177, 1, 0, 1,
-0.8418556, 0.4828765, -1.16837, 0.8901961, 1, 0, 1,
-0.8399786, 0.2659378, -0.8001642, 0.8823529, 1, 0, 1,
-0.83946, -0.3079568, -0.3506666, 0.8784314, 1, 0, 1,
-0.8381784, -1.152399, -1.970092, 0.8705882, 1, 0, 1,
-0.837011, 1.688963, 0.3477507, 0.8666667, 1, 0, 1,
-0.8345902, -0.1156697, -1.802806, 0.8588235, 1, 0, 1,
-0.8238887, -0.07134121, -1.101255, 0.854902, 1, 0, 1,
-0.8206224, -1.425151, -0.9339327, 0.8470588, 1, 0, 1,
-0.8137898, 0.211094, -0.7627529, 0.8431373, 1, 0, 1,
-0.8102944, -0.03351272, -1.80764, 0.8352941, 1, 0, 1,
-0.8028167, 0.703732, 0.3287586, 0.8313726, 1, 0, 1,
-0.8011622, 0.3078315, -1.266932, 0.8235294, 1, 0, 1,
-0.7970689, -0.4322425, -2.120334, 0.8196079, 1, 0, 1,
-0.7884267, -1.79316, -1.57614, 0.8117647, 1, 0, 1,
-0.7855134, -0.6983424, -3.178161, 0.8078431, 1, 0, 1,
-0.7837158, -1.57458, -2.990482, 0.8, 1, 0, 1,
-0.7780356, -1.049903, -3.005338, 0.7921569, 1, 0, 1,
-0.7770692, -0.6015848, -1.897333, 0.7882353, 1, 0, 1,
-0.7757517, -0.6439424, -1.933197, 0.7803922, 1, 0, 1,
-0.7746971, -2.004399, -1.431737, 0.7764706, 1, 0, 1,
-0.7725741, -1.728114, -2.950234, 0.7686275, 1, 0, 1,
-0.7693075, -0.6910121, -0.353844, 0.7647059, 1, 0, 1,
-0.7675315, 1.398396, -0.2296399, 0.7568628, 1, 0, 1,
-0.7673012, -0.611434, -2.618369, 0.7529412, 1, 0, 1,
-0.765857, -0.64671, -1.616593, 0.7450981, 1, 0, 1,
-0.7607353, 0.6981933, -2.395802, 0.7411765, 1, 0, 1,
-0.7592321, 1.870101, 0.671072, 0.7333333, 1, 0, 1,
-0.7579353, 1.399766, -0.46935, 0.7294118, 1, 0, 1,
-0.7564153, -0.635236, -2.69311, 0.7215686, 1, 0, 1,
-0.7537397, 0.9897686, -2.483405, 0.7176471, 1, 0, 1,
-0.7535607, -0.09405408, -1.367479, 0.7098039, 1, 0, 1,
-0.7458336, -1.87904, -2.418503, 0.7058824, 1, 0, 1,
-0.7428876, 0.3003404, -1.408246, 0.6980392, 1, 0, 1,
-0.7418747, -2.198145, -0.4459075, 0.6901961, 1, 0, 1,
-0.7378562, 0.6394023, -0.7871595, 0.6862745, 1, 0, 1,
-0.7372867, 1.236433, -0.5322241, 0.6784314, 1, 0, 1,
-0.7357596, 1.855185, 0.3156446, 0.6745098, 1, 0, 1,
-0.7330428, 0.3681209, -0.9207765, 0.6666667, 1, 0, 1,
-0.7204443, -0.7605433, -0.4218284, 0.6627451, 1, 0, 1,
-0.7193233, 1.810625, -1.411538, 0.654902, 1, 0, 1,
-0.7171919, 0.5441244, -1.490682, 0.6509804, 1, 0, 1,
-0.7128792, 0.2369792, -1.476566, 0.6431373, 1, 0, 1,
-0.7068585, -0.5320816, -2.211711, 0.6392157, 1, 0, 1,
-0.6964432, -0.5914263, -1.663468, 0.6313726, 1, 0, 1,
-0.6898323, -0.5129814, -0.6558751, 0.627451, 1, 0, 1,
-0.6882439, -0.4101856, -1.263981, 0.6196079, 1, 0, 1,
-0.6873308, 1.726215, -2.335567, 0.6156863, 1, 0, 1,
-0.6796157, -0.8156297, -2.57166, 0.6078432, 1, 0, 1,
-0.6785418, 1.152519, -0.7491019, 0.6039216, 1, 0, 1,
-0.6772088, -0.4777365, -0.5365085, 0.5960785, 1, 0, 1,
-0.6767653, -0.6114963, -2.447074, 0.5882353, 1, 0, 1,
-0.6741783, 0.2068794, -1.096478, 0.5843138, 1, 0, 1,
-0.6703328, -0.3283893, -1.499939, 0.5764706, 1, 0, 1,
-0.6625873, -1.253581, -1.814702, 0.572549, 1, 0, 1,
-0.6585404, 0.1541098, -1.696727, 0.5647059, 1, 0, 1,
-0.6578715, 0.5804061, 0.2212412, 0.5607843, 1, 0, 1,
-0.6578167, 0.09038766, -0.90202, 0.5529412, 1, 0, 1,
-0.6535385, -1.12115, -4.333243, 0.5490196, 1, 0, 1,
-0.6493828, 0.2882506, -0.4288258, 0.5411765, 1, 0, 1,
-0.645655, -0.4948723, -1.779057, 0.5372549, 1, 0, 1,
-0.6438648, -1.957224, -3.997737, 0.5294118, 1, 0, 1,
-0.6402846, -0.4691616, -2.885253, 0.5254902, 1, 0, 1,
-0.6359869, -0.893719, -2.832613, 0.5176471, 1, 0, 1,
-0.6332232, -0.7306914, -1.650674, 0.5137255, 1, 0, 1,
-0.6327975, -0.718917, -2.115233, 0.5058824, 1, 0, 1,
-0.6323919, 0.4542927, -1.34486, 0.5019608, 1, 0, 1,
-0.6279072, -0.3587643, -1.945196, 0.4941176, 1, 0, 1,
-0.6262023, 0.6775061, -0.806609, 0.4862745, 1, 0, 1,
-0.6242307, -0.3741723, -0.09872127, 0.4823529, 1, 0, 1,
-0.6232113, -1.005441, -2.991144, 0.4745098, 1, 0, 1,
-0.6216266, 0.5263291, -1.53328, 0.4705882, 1, 0, 1,
-0.6189358, -0.3868089, -0.8053523, 0.4627451, 1, 0, 1,
-0.6185879, 1.306578, -0.6520132, 0.4588235, 1, 0, 1,
-0.616215, -0.9817656, -2.61377, 0.4509804, 1, 0, 1,
-0.6158156, 0.1566915, -3.215603, 0.4470588, 1, 0, 1,
-0.6152306, 1.486144, -0.769953, 0.4392157, 1, 0, 1,
-0.6141491, -0.1856067, -2.146354, 0.4352941, 1, 0, 1,
-0.6137919, 0.2233901, -1.042565, 0.427451, 1, 0, 1,
-0.6064368, -0.7709404, -2.436789, 0.4235294, 1, 0, 1,
-0.6003267, -0.8199121, -3.393, 0.4156863, 1, 0, 1,
-0.5992379, 1.779746, 0.6378527, 0.4117647, 1, 0, 1,
-0.5924411, -1.5466, -2.385811, 0.4039216, 1, 0, 1,
-0.5870478, -0.4748749, -1.336333, 0.3960784, 1, 0, 1,
-0.5832894, -0.2747706, -2.921646, 0.3921569, 1, 0, 1,
-0.5799601, 0.7531811, -1.817168, 0.3843137, 1, 0, 1,
-0.5798625, -1.421598, -3.238727, 0.3803922, 1, 0, 1,
-0.5765766, 0.1313087, -2.483636, 0.372549, 1, 0, 1,
-0.5749874, -0.3200502, -1.798522, 0.3686275, 1, 0, 1,
-0.5718263, -0.328562, -1.884065, 0.3607843, 1, 0, 1,
-0.5686887, 0.2531771, -0.5464426, 0.3568628, 1, 0, 1,
-0.5682451, 1.348045, 0.0005459865, 0.3490196, 1, 0, 1,
-0.5676051, -0.8964358, -1.081527, 0.345098, 1, 0, 1,
-0.5642259, 0.510646, -1.199318, 0.3372549, 1, 0, 1,
-0.5559584, -0.499877, -1.957646, 0.3333333, 1, 0, 1,
-0.5539576, -1.572782, -3.64897, 0.3254902, 1, 0, 1,
-0.5534529, -0.4512637, 0.1910899, 0.3215686, 1, 0, 1,
-0.5458808, -0.5633798, -1.967123, 0.3137255, 1, 0, 1,
-0.5451034, 1.172756, -0.9465372, 0.3098039, 1, 0, 1,
-0.5447771, 0.4439881, -1.077283, 0.3019608, 1, 0, 1,
-0.54162, -0.6180273, -0.5582569, 0.2941177, 1, 0, 1,
-0.5413177, 0.9806863, -0.2201746, 0.2901961, 1, 0, 1,
-0.5402373, -1.22055, -2.810293, 0.282353, 1, 0, 1,
-0.5402264, 0.2833101, -0.6204557, 0.2784314, 1, 0, 1,
-0.5359453, 0.1361014, 0.2919019, 0.2705882, 1, 0, 1,
-0.5354558, -0.02676105, -0.41561, 0.2666667, 1, 0, 1,
-0.5312448, -0.7734428, -2.627588, 0.2588235, 1, 0, 1,
-0.5302163, -0.48309, -2.463783, 0.254902, 1, 0, 1,
-0.5297674, 0.5226539, -1.476463, 0.2470588, 1, 0, 1,
-0.5265118, 1.20459, -2.644792, 0.2431373, 1, 0, 1,
-0.5255811, 0.1997057, -0.841134, 0.2352941, 1, 0, 1,
-0.5203292, 0.5781827, -2.601749, 0.2313726, 1, 0, 1,
-0.5200045, 0.4058744, 0.0240736, 0.2235294, 1, 0, 1,
-0.5150766, -1.313931, -2.814531, 0.2196078, 1, 0, 1,
-0.5137978, -0.3882065, -3.176617, 0.2117647, 1, 0, 1,
-0.5108543, 0.01625076, -2.259439, 0.2078431, 1, 0, 1,
-0.5062658, 0.443997, -0.7281966, 0.2, 1, 0, 1,
-0.5061982, -0.1584202, -0.03686333, 0.1921569, 1, 0, 1,
-0.5058875, 0.5831771, -0.4896373, 0.1882353, 1, 0, 1,
-0.5057532, 0.6854213, 0.2234965, 0.1803922, 1, 0, 1,
-0.500588, 0.9424869, 0.996214, 0.1764706, 1, 0, 1,
-0.4969915, -0.1994634, -2.185258, 0.1686275, 1, 0, 1,
-0.49312, 2.011864, -3.15275, 0.1647059, 1, 0, 1,
-0.4925224, 0.2744969, -1.482211, 0.1568628, 1, 0, 1,
-0.4903741, -1.053286, -2.283965, 0.1529412, 1, 0, 1,
-0.4879919, 1.345488, -0.654183, 0.145098, 1, 0, 1,
-0.4828396, 1.414295, 1.79984, 0.1411765, 1, 0, 1,
-0.4828079, -1.025797, -3.620223, 0.1333333, 1, 0, 1,
-0.4820332, 1.532996, 0.7347679, 0.1294118, 1, 0, 1,
-0.4813795, -0.1190101, -3.068701, 0.1215686, 1, 0, 1,
-0.4769566, -0.7886473, -2.602096, 0.1176471, 1, 0, 1,
-0.474231, 0.05460808, -3.403658, 0.1098039, 1, 0, 1,
-0.4740878, -0.9271594, -1.175412, 0.1058824, 1, 0, 1,
-0.4664818, -1.482874, -2.61474, 0.09803922, 1, 0, 1,
-0.4664364, -0.758534, -4.272133, 0.09019608, 1, 0, 1,
-0.4663352, -0.1066099, -0.5973945, 0.08627451, 1, 0, 1,
-0.4652689, 0.3304065, 0.1718246, 0.07843138, 1, 0, 1,
-0.465267, -0.5641895, -2.362682, 0.07450981, 1, 0, 1,
-0.463834, -0.4279356, -1.554627, 0.06666667, 1, 0, 1,
-0.4610706, -0.988631, -3.463441, 0.0627451, 1, 0, 1,
-0.4592601, -0.243578, -1.677475, 0.05490196, 1, 0, 1,
-0.4589286, 0.4326715, -0.006120705, 0.05098039, 1, 0, 1,
-0.4546669, 0.8311821, -1.910837, 0.04313726, 1, 0, 1,
-0.4532327, 0.1477367, -1.660393, 0.03921569, 1, 0, 1,
-0.4526297, 0.05716249, -1.586297, 0.03137255, 1, 0, 1,
-0.4525166, -0.3662215, -4.183096, 0.02745098, 1, 0, 1,
-0.447077, -0.9292122, -4.378647, 0.01960784, 1, 0, 1,
-0.4435535, 0.909287, -1.115592, 0.01568628, 1, 0, 1,
-0.4412149, -1.8204, -3.601136, 0.007843138, 1, 0, 1,
-0.4356279, -0.3551135, -3.404895, 0.003921569, 1, 0, 1,
-0.4355737, -0.8292504, -1.897955, 0, 1, 0.003921569, 1,
-0.4308748, -0.696113, -2.39582, 0, 1, 0.01176471, 1,
-0.4232424, 1.287297, -1.658587, 0, 1, 0.01568628, 1,
-0.4204516, 0.1800548, 0.3380864, 0, 1, 0.02352941, 1,
-0.4187307, 1.473941, -1.299811, 0, 1, 0.02745098, 1,
-0.4183797, -1.148098, -3.269687, 0, 1, 0.03529412, 1,
-0.4156568, 0.6662034, -0.7468593, 0, 1, 0.03921569, 1,
-0.4152958, -0.5116881, -1.557215, 0, 1, 0.04705882, 1,
-0.4140833, 0.9053941, 0.684853, 0, 1, 0.05098039, 1,
-0.4121365, 0.856468, -0.9749889, 0, 1, 0.05882353, 1,
-0.4116623, 0.4207194, 0.06381796, 0, 1, 0.0627451, 1,
-0.4104943, 0.4735046, 1.472638, 0, 1, 0.07058824, 1,
-0.4094903, 0.622494, -0.2072381, 0, 1, 0.07450981, 1,
-0.404673, -0.9633303, -2.836303, 0, 1, 0.08235294, 1,
-0.402077, 0.2424673, -1.281261, 0, 1, 0.08627451, 1,
-0.3991894, -1.997715, -2.828632, 0, 1, 0.09411765, 1,
-0.3990534, -0.7410734, -3.559451, 0, 1, 0.1019608, 1,
-0.3986009, -0.4378201, -2.668477, 0, 1, 0.1058824, 1,
-0.396376, -0.7713057, -4.31135, 0, 1, 0.1137255, 1,
-0.3948946, -0.4490294, -3.276359, 0, 1, 0.1176471, 1,
-0.3946657, 0.3782469, 0.005850988, 0, 1, 0.1254902, 1,
-0.3915935, 0.5210554, 0.386703, 0, 1, 0.1294118, 1,
-0.3915665, 0.1510751, -0.829178, 0, 1, 0.1372549, 1,
-0.391083, -1.166839, -3.685742, 0, 1, 0.1411765, 1,
-0.3902672, -1.127652, -2.401056, 0, 1, 0.1490196, 1,
-0.3855142, 1.155928, 1.29887, 0, 1, 0.1529412, 1,
-0.3827176, -0.4084689, -0.9885352, 0, 1, 0.1607843, 1,
-0.3743144, 0.7602484, -0.5638353, 0, 1, 0.1647059, 1,
-0.3732032, 0.5968167, -2.362334, 0, 1, 0.172549, 1,
-0.3710712, -0.290526, -3.954533, 0, 1, 0.1764706, 1,
-0.3708894, -0.574546, -2.888112, 0, 1, 0.1843137, 1,
-0.3686323, 1.388744, -0.7441055, 0, 1, 0.1882353, 1,
-0.3660817, 1.400819, 0.01092626, 0, 1, 0.1960784, 1,
-0.3649309, 0.2314638, -1.160923, 0, 1, 0.2039216, 1,
-0.3643681, 0.5220104, -0.5580968, 0, 1, 0.2078431, 1,
-0.3609688, 0.6868047, 1.044002, 0, 1, 0.2156863, 1,
-0.3589695, -1.338971, -3.208442, 0, 1, 0.2196078, 1,
-0.3522485, 0.0701466, -1.500343, 0, 1, 0.227451, 1,
-0.3507971, 1.426867, -0.2545058, 0, 1, 0.2313726, 1,
-0.3507666, 0.1984994, -1.37532, 0, 1, 0.2392157, 1,
-0.3489526, -0.1165217, -0.6130795, 0, 1, 0.2431373, 1,
-0.3453036, -0.3045577, -1.734877, 0, 1, 0.2509804, 1,
-0.3392163, -0.7063756, -2.8581, 0, 1, 0.254902, 1,
-0.3292015, 0.7129162, 1.101472, 0, 1, 0.2627451, 1,
-0.3228642, -1.464085, -2.602443, 0, 1, 0.2666667, 1,
-0.3165228, -2.374069, -3.524637, 0, 1, 0.2745098, 1,
-0.3147719, -1.113022, -3.419467, 0, 1, 0.2784314, 1,
-0.3126051, -0.1656776, -2.896173, 0, 1, 0.2862745, 1,
-0.311594, -0.2515651, -2.611396, 0, 1, 0.2901961, 1,
-0.3113, 1.267986, -0.6685036, 0, 1, 0.2980392, 1,
-0.3108347, 1.306894, -1.670582, 0, 1, 0.3058824, 1,
-0.3089427, 0.5649875, -0.5340215, 0, 1, 0.3098039, 1,
-0.308611, -0.357085, -0.8360006, 0, 1, 0.3176471, 1,
-0.3071253, -3.018509, -1.958786, 0, 1, 0.3215686, 1,
-0.3045487, 0.2394571, -0.4220866, 0, 1, 0.3294118, 1,
-0.3033536, 0.1326389, 0.9143397, 0, 1, 0.3333333, 1,
-0.3017685, -0.7729469, -3.864846, 0, 1, 0.3411765, 1,
-0.3013853, -0.883068, -2.76627, 0, 1, 0.345098, 1,
-0.2953509, 0.2418768, -0.7521495, 0, 1, 0.3529412, 1,
-0.2930928, 0.2315065, -2.332224, 0, 1, 0.3568628, 1,
-0.2925333, -0.8700081, -3.163853, 0, 1, 0.3647059, 1,
-0.2903117, -1.762975, -2.649768, 0, 1, 0.3686275, 1,
-0.2881917, 1.415826, 0.1262016, 0, 1, 0.3764706, 1,
-0.2849985, 3.430976, 0.491182, 0, 1, 0.3803922, 1,
-0.2832132, 0.8843665, 0.5735418, 0, 1, 0.3882353, 1,
-0.2773266, 1.390353, -1.340717, 0, 1, 0.3921569, 1,
-0.273916, 0.0262039, -0.5420439, 0, 1, 0.4, 1,
-0.2735642, -1.344146, -1.813999, 0, 1, 0.4078431, 1,
-0.2724857, -0.355206, -3.678195, 0, 1, 0.4117647, 1,
-0.2723043, -0.3994286, -2.954053, 0, 1, 0.4196078, 1,
-0.2710088, -1.17566, -2.227297, 0, 1, 0.4235294, 1,
-0.2709453, -0.02517712, -2.163917, 0, 1, 0.4313726, 1,
-0.2674619, -0.7013503, -1.939661, 0, 1, 0.4352941, 1,
-0.2638093, 1.485255, 0.3863852, 0, 1, 0.4431373, 1,
-0.2637588, -1.85299, -3.921213, 0, 1, 0.4470588, 1,
-0.2634622, -0.2584456, -2.909747, 0, 1, 0.454902, 1,
-0.2569638, -0.5784773, -2.651212, 0, 1, 0.4588235, 1,
-0.2502906, -1.238142, -3.958365, 0, 1, 0.4666667, 1,
-0.2492602, -1.778691, -1.992006, 0, 1, 0.4705882, 1,
-0.2489706, -2.515561, -3.541914, 0, 1, 0.4784314, 1,
-0.2473535, -1.512019, -3.765668, 0, 1, 0.4823529, 1,
-0.2456611, -0.2091026, -1.941103, 0, 1, 0.4901961, 1,
-0.2408235, -0.4048331, -1.341206, 0, 1, 0.4941176, 1,
-0.2406763, -0.4749105, -2.744723, 0, 1, 0.5019608, 1,
-0.2348569, -1.284574, -4.340839, 0, 1, 0.509804, 1,
-0.2346057, -1.562458, -4.29809, 0, 1, 0.5137255, 1,
-0.2268573, -0.3874627, -2.691725, 0, 1, 0.5215687, 1,
-0.2254188, 0.05346943, -3.363971, 0, 1, 0.5254902, 1,
-0.2235661, 1.149672, 0.6453708, 0, 1, 0.5333334, 1,
-0.2197617, 1.544273, -1.26654, 0, 1, 0.5372549, 1,
-0.2165838, -0.4322422, -3.755364, 0, 1, 0.5450981, 1,
-0.2138488, -0.2735555, -4.140925, 0, 1, 0.5490196, 1,
-0.2117831, -0.8568901, -2.224515, 0, 1, 0.5568628, 1,
-0.2101413, -2.328869, -1.10849, 0, 1, 0.5607843, 1,
-0.2079647, -2.16615, -2.265585, 0, 1, 0.5686275, 1,
-0.2067377, -2.10831, 0.4053957, 0, 1, 0.572549, 1,
-0.2065216, 2.622759, 0.1687071, 0, 1, 0.5803922, 1,
-0.2048879, 0.1376856, -1.843408, 0, 1, 0.5843138, 1,
-0.2009091, -1.267711, -2.401844, 0, 1, 0.5921569, 1,
-0.1946872, -0.09269658, -1.920526, 0, 1, 0.5960785, 1,
-0.1946681, 1.014305, -3.016766, 0, 1, 0.6039216, 1,
-0.192789, -0.1087832, -1.910356, 0, 1, 0.6117647, 1,
-0.1893462, 0.9146284, 0.443031, 0, 1, 0.6156863, 1,
-0.1805984, -0.0289399, -1.601392, 0, 1, 0.6235294, 1,
-0.1794691, 0.1167752, -3.2632, 0, 1, 0.627451, 1,
-0.1752896, -0.6050141, -3.491078, 0, 1, 0.6352941, 1,
-0.1744172, 0.3207281, 0.3581322, 0, 1, 0.6392157, 1,
-0.1722424, 0.07029945, -3.292241, 0, 1, 0.6470588, 1,
-0.1692934, 0.5473624, 1.662172, 0, 1, 0.6509804, 1,
-0.168994, 1.545603, -0.8499154, 0, 1, 0.6588235, 1,
-0.1657408, -0.4209247, -2.797005, 0, 1, 0.6627451, 1,
-0.1655758, -0.8240536, -1.375047, 0, 1, 0.6705883, 1,
-0.1640388, 0.256541, 0.3679783, 0, 1, 0.6745098, 1,
-0.1636324, 0.5401806, 0.3264484, 0, 1, 0.682353, 1,
-0.1589394, 1.135056, -0.2050006, 0, 1, 0.6862745, 1,
-0.1584064, 0.2548337, -0.4174442, 0, 1, 0.6941177, 1,
-0.1579742, 0.9154563, 1.213303, 0, 1, 0.7019608, 1,
-0.1568902, 2.276506, -1.891884, 0, 1, 0.7058824, 1,
-0.1532224, -0.4232463, -3.293867, 0, 1, 0.7137255, 1,
-0.1449967, 0.3238162, -0.6648098, 0, 1, 0.7176471, 1,
-0.142143, -0.2460909, -3.49845, 0, 1, 0.7254902, 1,
-0.1417983, 0.7645901, -0.2226886, 0, 1, 0.7294118, 1,
-0.1389403, 1.373159, 1.021745, 0, 1, 0.7372549, 1,
-0.1364954, 2.084787, 0.6329431, 0, 1, 0.7411765, 1,
-0.134493, -0.8689176, -3.674398, 0, 1, 0.7490196, 1,
-0.1309409, -0.4167348, -3.946584, 0, 1, 0.7529412, 1,
-0.1247201, -0.3630811, -1.832171, 0, 1, 0.7607843, 1,
-0.1177032, -0.6736771, -2.536747, 0, 1, 0.7647059, 1,
-0.1150855, 1.360124, -0.4639967, 0, 1, 0.772549, 1,
-0.1125641, -1.043571, -2.170475, 0, 1, 0.7764706, 1,
-0.1092259, -0.1704234, -1.901206, 0, 1, 0.7843137, 1,
-0.1073614, 0.3230831, -0.9210473, 0, 1, 0.7882353, 1,
-0.106815, 1.610687, 0.6664975, 0, 1, 0.7960784, 1,
-0.1065221, -1.087913, -3.105984, 0, 1, 0.8039216, 1,
-0.1048707, 0.6206096, 0.08049417, 0, 1, 0.8078431, 1,
-0.1021101, -0.7348561, -2.144373, 0, 1, 0.8156863, 1,
-0.1014298, -1.27215, -3.875175, 0, 1, 0.8196079, 1,
-0.09529478, 0.7952591, 0.2958418, 0, 1, 0.827451, 1,
-0.09381674, 1.013517, 1.249644, 0, 1, 0.8313726, 1,
-0.09251967, -1.008592, -1.626122, 0, 1, 0.8392157, 1,
-0.09203152, -0.8049485, -2.466069, 0, 1, 0.8431373, 1,
-0.08714905, -1.025523, -2.853171, 0, 1, 0.8509804, 1,
-0.08570327, -1.514627, -2.407808, 0, 1, 0.854902, 1,
-0.08030896, -1.761024, -1.542102, 0, 1, 0.8627451, 1,
-0.07968276, 1.49279, -0.5627882, 0, 1, 0.8666667, 1,
-0.07331217, 0.2551661, -2.178083, 0, 1, 0.8745098, 1,
-0.06996138, 0.7707434, -0.1340214, 0, 1, 0.8784314, 1,
-0.06492659, -1.080461, -4.703275, 0, 1, 0.8862745, 1,
-0.06300977, 0.4139968, -1.333999, 0, 1, 0.8901961, 1,
-0.06279595, 0.7460144, -1.251966, 0, 1, 0.8980392, 1,
-0.06099967, -0.6906376, -3.375343, 0, 1, 0.9058824, 1,
-0.04992149, -0.06283171, -1.931009, 0, 1, 0.9098039, 1,
-0.04929875, 1.359186, -1.326592, 0, 1, 0.9176471, 1,
-0.04745379, 0.3694009, 0.3478782, 0, 1, 0.9215686, 1,
-0.04214298, 0.6117345, 2.401366, 0, 1, 0.9294118, 1,
-0.03608526, 1.166345, 1.198836, 0, 1, 0.9333333, 1,
-0.03436239, -1.887932, -3.868773, 0, 1, 0.9411765, 1,
-0.03168455, -0.2481904, -3.691078, 0, 1, 0.945098, 1,
-0.03113835, 0.888656, 0.7527707, 0, 1, 0.9529412, 1,
-0.03063814, 1.553626, -0.4774781, 0, 1, 0.9568627, 1,
-0.02923729, -1.134777, -2.266438, 0, 1, 0.9647059, 1,
-0.02332329, -1.236193, -0.5127891, 0, 1, 0.9686275, 1,
-0.02109748, 2.167422, -1.053485, 0, 1, 0.9764706, 1,
-0.01776457, -0.2341554, -1.479896, 0, 1, 0.9803922, 1,
-0.01016373, 0.2934859, -1.703448, 0, 1, 0.9882353, 1,
-0.008192301, -0.3146909, -2.586975, 0, 1, 0.9921569, 1,
-0.003234099, -1.353883, -3.231996, 0, 1, 1, 1,
0.0004042333, 1.224765, -0.5946008, 0, 0.9921569, 1, 1,
0.001008003, 2.019737, 0.4799828, 0, 0.9882353, 1, 1,
0.002775478, -1.133088, 3.852261, 0, 0.9803922, 1, 1,
0.008451773, -0.3928986, 5.571472, 0, 0.9764706, 1, 1,
0.01114778, -0.005430442, 0.4525507, 0, 0.9686275, 1, 1,
0.01249028, -2.52564, 2.897633, 0, 0.9647059, 1, 1,
0.01295989, 1.326713, -1.360709, 0, 0.9568627, 1, 1,
0.01482968, -1.24632, 1.465387, 0, 0.9529412, 1, 1,
0.01485142, -1.866606, 3.386857, 0, 0.945098, 1, 1,
0.02763201, 0.8294553, 0.5173332, 0, 0.9411765, 1, 1,
0.02975098, 0.8433942, 0.0970924, 0, 0.9333333, 1, 1,
0.03390254, 0.8131665, -0.2061336, 0, 0.9294118, 1, 1,
0.0359645, 0.09884007, -1.088543, 0, 0.9215686, 1, 1,
0.03624764, -0.7249603, 2.305941, 0, 0.9176471, 1, 1,
0.03719931, 0.3173954, -1.006267, 0, 0.9098039, 1, 1,
0.0373098, -1.065032, 2.491844, 0, 0.9058824, 1, 1,
0.0393632, -0.3727202, 3.505292, 0, 0.8980392, 1, 1,
0.03983375, 0.2243219, -1.199004, 0, 0.8901961, 1, 1,
0.04240988, 1.848655, -0.6731066, 0, 0.8862745, 1, 1,
0.04406124, -1.222861, 3.581698, 0, 0.8784314, 1, 1,
0.04467322, 0.7379127, 0.7445163, 0, 0.8745098, 1, 1,
0.04656846, -0.03563759, 1.934032, 0, 0.8666667, 1, 1,
0.05314115, -0.5438946, 3.825148, 0, 0.8627451, 1, 1,
0.05330266, 0.1576783, -2.036084, 0, 0.854902, 1, 1,
0.0563642, -0.5678196, 4.002445, 0, 0.8509804, 1, 1,
0.05936379, 0.4396057, -1.485256, 0, 0.8431373, 1, 1,
0.05948015, -0.3203163, 3.773938, 0, 0.8392157, 1, 1,
0.06003445, -0.1504974, 2.725231, 0, 0.8313726, 1, 1,
0.06028379, -0.6106782, 4.603229, 0, 0.827451, 1, 1,
0.06080208, -0.4972249, 1.226619, 0, 0.8196079, 1, 1,
0.06236097, -0.303832, 3.397257, 0, 0.8156863, 1, 1,
0.06239175, 0.3004372, -1.143637, 0, 0.8078431, 1, 1,
0.06565082, 0.02862213, 0.4210065, 0, 0.8039216, 1, 1,
0.06573603, 1.01356, -0.9873943, 0, 0.7960784, 1, 1,
0.07154049, -0.2641148, 2.755359, 0, 0.7882353, 1, 1,
0.07732263, -0.8028917, 2.388478, 0, 0.7843137, 1, 1,
0.08353507, -2.334372, 1.389491, 0, 0.7764706, 1, 1,
0.08709558, -0.1223869, 3.199741, 0, 0.772549, 1, 1,
0.08919555, -1.202996, 2.713465, 0, 0.7647059, 1, 1,
0.08967818, -0.1914501, 1.395201, 0, 0.7607843, 1, 1,
0.0915718, -1.110558, 4.512185, 0, 0.7529412, 1, 1,
0.09796063, -0.2956936, 1.314847, 0, 0.7490196, 1, 1,
0.09860859, 0.02089732, 2.191704, 0, 0.7411765, 1, 1,
0.09943489, 1.233787, 0.3835518, 0, 0.7372549, 1, 1,
0.103878, 0.5628928, -0.02417895, 0, 0.7294118, 1, 1,
0.104698, -0.4592935, 3.74174, 0, 0.7254902, 1, 1,
0.1047028, 1.296029, 0.04812597, 0, 0.7176471, 1, 1,
0.1079848, -2.001637, 2.221983, 0, 0.7137255, 1, 1,
0.1097757, 3.525113, -0.1585767, 0, 0.7058824, 1, 1,
0.1132395, -0.5339534, 4.822582, 0, 0.6980392, 1, 1,
0.116159, 0.2052537, 0.9318762, 0, 0.6941177, 1, 1,
0.1163251, -1.288064, 1.934391, 0, 0.6862745, 1, 1,
0.1173567, -0.8807619, 3.366721, 0, 0.682353, 1, 1,
0.11754, -0.2198321, 3.704453, 0, 0.6745098, 1, 1,
0.1202125, -1.062942, 2.525764, 0, 0.6705883, 1, 1,
0.1208919, 0.9524218, 0.08524031, 0, 0.6627451, 1, 1,
0.1232042, 0.6059527, -0.3598979, 0, 0.6588235, 1, 1,
0.1283823, -1.746855, 2.628993, 0, 0.6509804, 1, 1,
0.1365981, 1.366814, 2.379625, 0, 0.6470588, 1, 1,
0.1426842, 2.127843, 1.762702, 0, 0.6392157, 1, 1,
0.1445827, -1.05688, 2.852524, 0, 0.6352941, 1, 1,
0.1462551, 0.2032737, 2.245683, 0, 0.627451, 1, 1,
0.1482308, 0.09881154, 1.420574, 0, 0.6235294, 1, 1,
0.1501993, 1.322102, -0.58234, 0, 0.6156863, 1, 1,
0.1515988, -0.9309846, 2.336961, 0, 0.6117647, 1, 1,
0.1518206, 0.7220243, 0.9401799, 0, 0.6039216, 1, 1,
0.1585855, 0.9420623, -0.4065074, 0, 0.5960785, 1, 1,
0.1592307, -2.369231, 2.780334, 0, 0.5921569, 1, 1,
0.1628917, 0.3421089, 0.7608865, 0, 0.5843138, 1, 1,
0.176752, -1.793775, 2.472424, 0, 0.5803922, 1, 1,
0.1791421, -1.649801, 2.262859, 0, 0.572549, 1, 1,
0.1793917, 0.8955302, -0.1765093, 0, 0.5686275, 1, 1,
0.1817145, -0.7916298, 4.297075, 0, 0.5607843, 1, 1,
0.1830283, -0.430707, 1.635474, 0, 0.5568628, 1, 1,
0.1945083, 0.1896985, 2.470282, 0, 0.5490196, 1, 1,
0.196129, -0.06601281, 1.614963, 0, 0.5450981, 1, 1,
0.1968358, -0.05502051, 0.5746916, 0, 0.5372549, 1, 1,
0.1974276, -0.5179751, 1.50085, 0, 0.5333334, 1, 1,
0.2027305, 0.5499793, 1.448837, 0, 0.5254902, 1, 1,
0.2039021, 0.06952216, 0.2955753, 0, 0.5215687, 1, 1,
0.2047904, 1.46798, 0.6309205, 0, 0.5137255, 1, 1,
0.2078493, 0.810182, -1.904338, 0, 0.509804, 1, 1,
0.209148, -0.5782683, 3.198764, 0, 0.5019608, 1, 1,
0.2164353, -0.5673109, 3.82684, 0, 0.4941176, 1, 1,
0.2192484, 0.9893152, -0.6933706, 0, 0.4901961, 1, 1,
0.2286405, -1.481491, 3.748274, 0, 0.4823529, 1, 1,
0.2299653, -1.270249, 4.33726, 0, 0.4784314, 1, 1,
0.2326511, 0.8708143, 1.405028, 0, 0.4705882, 1, 1,
0.2339095, 0.6885403, 0.7526582, 0, 0.4666667, 1, 1,
0.2358102, 0.1405897, -1.426537, 0, 0.4588235, 1, 1,
0.2369893, 0.05259757, 2.813698, 0, 0.454902, 1, 1,
0.2373927, 0.3407988, 1.107975, 0, 0.4470588, 1, 1,
0.2389143, -0.111033, 2.07661, 0, 0.4431373, 1, 1,
0.239736, -1.014518, 3.974663, 0, 0.4352941, 1, 1,
0.2439324, -0.5779107, 3.341533, 0, 0.4313726, 1, 1,
0.2467438, -1.140786, 2.177282, 0, 0.4235294, 1, 1,
0.2546357, -0.04651467, 2.212276, 0, 0.4196078, 1, 1,
0.256948, 1.16534, -0.3522267, 0, 0.4117647, 1, 1,
0.2580434, -0.02817058, 1.944542, 0, 0.4078431, 1, 1,
0.2623635, 1.840095, -0.06728444, 0, 0.4, 1, 1,
0.2690986, -0.4672033, 1.152634, 0, 0.3921569, 1, 1,
0.2743075, -0.7629922, 2.645984, 0, 0.3882353, 1, 1,
0.2748886, -0.3584137, 4.040026, 0, 0.3803922, 1, 1,
0.2788515, -0.6701332, 2.437222, 0, 0.3764706, 1, 1,
0.2790002, -0.7850166, 5.315515, 0, 0.3686275, 1, 1,
0.2793268, -0.03803674, 1.001721, 0, 0.3647059, 1, 1,
0.280013, 1.565415, 0.3631175, 0, 0.3568628, 1, 1,
0.289114, 1.562037, -0.2950886, 0, 0.3529412, 1, 1,
0.2902986, 0.3776903, 2.707234, 0, 0.345098, 1, 1,
0.2940638, 2.784932, -1.386416, 0, 0.3411765, 1, 1,
0.2945553, 1.806854, 1.219269, 0, 0.3333333, 1, 1,
0.3015197, -1.181651, 5.644094, 0, 0.3294118, 1, 1,
0.3084321, -0.2125543, 1.234391, 0, 0.3215686, 1, 1,
0.3085435, -0.6633046, 2.543712, 0, 0.3176471, 1, 1,
0.3108145, 1.364084, 0.8084738, 0, 0.3098039, 1, 1,
0.3111481, -0.3162, 2.803963, 0, 0.3058824, 1, 1,
0.3129678, -0.643335, 2.407614, 0, 0.2980392, 1, 1,
0.3146742, 0.7134561, -0.2083151, 0, 0.2901961, 1, 1,
0.3201998, 1.278278, -1.009919, 0, 0.2862745, 1, 1,
0.3218576, 1.09778, 0.5335059, 0, 0.2784314, 1, 1,
0.3228832, -1.859305, 3.221394, 0, 0.2745098, 1, 1,
0.3239952, -0.2518079, 4.515306, 0, 0.2666667, 1, 1,
0.324688, -0.1233743, 2.239193, 0, 0.2627451, 1, 1,
0.328078, -1.075198, 5.776026, 0, 0.254902, 1, 1,
0.3315727, 1.401377, -1.271394, 0, 0.2509804, 1, 1,
0.3332498, -1.485923, 1.491123, 0, 0.2431373, 1, 1,
0.3342641, -0.5538894, 1.888315, 0, 0.2392157, 1, 1,
0.3355075, -0.5221123, 2.437395, 0, 0.2313726, 1, 1,
0.3363704, 1.051286, 0.6206014, 0, 0.227451, 1, 1,
0.3396925, -0.09872746, 1.937628, 0, 0.2196078, 1, 1,
0.3442062, -0.5852467, 2.842226, 0, 0.2156863, 1, 1,
0.3508845, -0.5045866, 5.199627, 0, 0.2078431, 1, 1,
0.3510945, -0.6422573, 3.388858, 0, 0.2039216, 1, 1,
0.3539398, 0.8052043, -0.1724982, 0, 0.1960784, 1, 1,
0.3567564, -1.922174, 1.471807, 0, 0.1882353, 1, 1,
0.358126, -0.351665, 3.317227, 0, 0.1843137, 1, 1,
0.3671984, 0.4429534, 1.507908, 0, 0.1764706, 1, 1,
0.3674299, 0.2596385, -1.314573, 0, 0.172549, 1, 1,
0.3719642, 2.002446, 1.424253, 0, 0.1647059, 1, 1,
0.3731077, -0.05022639, 1.043495, 0, 0.1607843, 1, 1,
0.3756271, -0.0428578, 2.137509, 0, 0.1529412, 1, 1,
0.3817737, 1.026966, -1.558078, 0, 0.1490196, 1, 1,
0.3837116, 0.4689036, -0.5208014, 0, 0.1411765, 1, 1,
0.3847795, 2.070026, 0.05433334, 0, 0.1372549, 1, 1,
0.3867146, 1.118344, 1.409291, 0, 0.1294118, 1, 1,
0.3868526, -1.194985, 2.348656, 0, 0.1254902, 1, 1,
0.3891145, -0.3268047, 1.48854, 0, 0.1176471, 1, 1,
0.389991, 0.5816916, -0.8999899, 0, 0.1137255, 1, 1,
0.3974784, -0.01533145, 1.90919, 0, 0.1058824, 1, 1,
0.3975803, -0.6497768, 3.115407, 0, 0.09803922, 1, 1,
0.3997849, 1.268878, -0.8601969, 0, 0.09411765, 1, 1,
0.4049988, 1.277859, 1.707991, 0, 0.08627451, 1, 1,
0.4057543, -0.9067429, 2.237981, 0, 0.08235294, 1, 1,
0.4060021, -1.160609, 1.740986, 0, 0.07450981, 1, 1,
0.4140806, -0.1555339, 2.283246, 0, 0.07058824, 1, 1,
0.414439, 0.8764818, -0.2729812, 0, 0.0627451, 1, 1,
0.4154717, -0.4662634, 3.845172, 0, 0.05882353, 1, 1,
0.4210232, -0.2758124, 0.8540442, 0, 0.05098039, 1, 1,
0.4259529, 1.412111, 1.862643, 0, 0.04705882, 1, 1,
0.437094, -1.602028, 2.989431, 0, 0.03921569, 1, 1,
0.4385776, 1.650003, -1.498601, 0, 0.03529412, 1, 1,
0.4405213, 0.6187843, 1.459822, 0, 0.02745098, 1, 1,
0.4448867, -0.7075306, 1.42001, 0, 0.02352941, 1, 1,
0.4467893, 0.211121, -0.03866576, 0, 0.01568628, 1, 1,
0.4511434, -0.831136, 1.719718, 0, 0.01176471, 1, 1,
0.4523969, 0.8438529, 0.1265128, 0, 0.003921569, 1, 1,
0.4526869, -0.3101048, 0.7236408, 0.003921569, 0, 1, 1,
0.4560149, 0.6691415, -0.4094911, 0.007843138, 0, 1, 1,
0.4587872, 0.6385279, 0.899856, 0.01568628, 0, 1, 1,
0.460181, -1.571754, 4.147845, 0.01960784, 0, 1, 1,
0.461725, 1.449087, 1.438743, 0.02745098, 0, 1, 1,
0.4625973, 0.4698631, 4.29001, 0.03137255, 0, 1, 1,
0.4628815, -0.4678535, 2.66671, 0.03921569, 0, 1, 1,
0.4724078, 0.6116121, -0.3534141, 0.04313726, 0, 1, 1,
0.4786689, 1.405251, 0.8013254, 0.05098039, 0, 1, 1,
0.4804455, 0.5057505, 1.373666, 0.05490196, 0, 1, 1,
0.4823556, -0.8417888, 1.408767, 0.0627451, 0, 1, 1,
0.4829492, -0.2028155, 1.397421, 0.06666667, 0, 1, 1,
0.4843152, -0.3247508, 2.91967, 0.07450981, 0, 1, 1,
0.4868983, 1.028117, 1.425681, 0.07843138, 0, 1, 1,
0.4871782, -0.6706216, 2.26295, 0.08627451, 0, 1, 1,
0.4894022, 1.805241, -0.7196679, 0.09019608, 0, 1, 1,
0.4901976, -0.3157417, 1.753885, 0.09803922, 0, 1, 1,
0.4911353, 0.5155833, 1.334745, 0.1058824, 0, 1, 1,
0.4991271, -0.451672, 5.224021, 0.1098039, 0, 1, 1,
0.502234, 1.295804, -0.03027096, 0.1176471, 0, 1, 1,
0.5064053, -0.1259958, 1.738439, 0.1215686, 0, 1, 1,
0.5087701, 0.05681995, 0.6652011, 0.1294118, 0, 1, 1,
0.5088203, 1.20635, 0.2099299, 0.1333333, 0, 1, 1,
0.5104614, -0.651982, 1.810565, 0.1411765, 0, 1, 1,
0.5148366, 0.1283128, 1.373527, 0.145098, 0, 1, 1,
0.5157897, 0.4008214, 1.481729, 0.1529412, 0, 1, 1,
0.5184335, -0.09828739, 3.28746, 0.1568628, 0, 1, 1,
0.5194337, -0.5720648, 3.72532, 0.1647059, 0, 1, 1,
0.5231598, 0.004704366, 0.1384982, 0.1686275, 0, 1, 1,
0.5235213, -0.9970971, 2.258985, 0.1764706, 0, 1, 1,
0.5239002, 1.927802, 0.3419981, 0.1803922, 0, 1, 1,
0.5261645, -0.6069198, 2.024491, 0.1882353, 0, 1, 1,
0.5335144, 0.4884724, -1.110379, 0.1921569, 0, 1, 1,
0.5361894, -1.000555, 0.9046929, 0.2, 0, 1, 1,
0.5396741, 0.6246639, -0.4510432, 0.2078431, 0, 1, 1,
0.5404581, -0.8964589, 5.029099, 0.2117647, 0, 1, 1,
0.5424407, 0.05938429, 1.490223, 0.2196078, 0, 1, 1,
0.542743, 1.338386, 1.540883, 0.2235294, 0, 1, 1,
0.5461463, 0.4028946, 0.7495288, 0.2313726, 0, 1, 1,
0.547049, -0.7620797, 2.260488, 0.2352941, 0, 1, 1,
0.5499016, -1.578267, 1.933983, 0.2431373, 0, 1, 1,
0.5547985, -1.702313, 1.724012, 0.2470588, 0, 1, 1,
0.557443, 0.8775885, 0.7053538, 0.254902, 0, 1, 1,
0.5583445, 1.243142, 0.795459, 0.2588235, 0, 1, 1,
0.5605195, -0.7636678, 0.3530772, 0.2666667, 0, 1, 1,
0.5626718, -0.8743863, 2.186565, 0.2705882, 0, 1, 1,
0.5664833, -0.3181985, 2.545224, 0.2784314, 0, 1, 1,
0.5690436, 0.0405522, 3.002788, 0.282353, 0, 1, 1,
0.5747923, -0.2999369, 2.377374, 0.2901961, 0, 1, 1,
0.5806459, -0.8747772, 2.091012, 0.2941177, 0, 1, 1,
0.5913404, 0.4618282, -0.6928437, 0.3019608, 0, 1, 1,
0.5923129, 0.7912914, 1.692751, 0.3098039, 0, 1, 1,
0.6020197, -0.2522427, 1.898537, 0.3137255, 0, 1, 1,
0.6036815, 0.2859703, -0.3629766, 0.3215686, 0, 1, 1,
0.6043146, -0.7529693, 1.985158, 0.3254902, 0, 1, 1,
0.6056628, 1.583032, 1.137197, 0.3333333, 0, 1, 1,
0.6085003, -0.3828251, 2.353788, 0.3372549, 0, 1, 1,
0.6141151, 0.7443856, -0.1491325, 0.345098, 0, 1, 1,
0.6174051, -0.8740767, 2.811541, 0.3490196, 0, 1, 1,
0.6282573, 1.100275, 0.3604957, 0.3568628, 0, 1, 1,
0.6295636, -0.2300471, 2.548501, 0.3607843, 0, 1, 1,
0.6431556, -0.4066, 3.161095, 0.3686275, 0, 1, 1,
0.6504831, 0.2379272, 1.904573, 0.372549, 0, 1, 1,
0.650986, -0.6861658, 3.613404, 0.3803922, 0, 1, 1,
0.6516187, -0.4761779, 1.066795, 0.3843137, 0, 1, 1,
0.6528774, 0.3532016, 0.7425229, 0.3921569, 0, 1, 1,
0.6554807, -0.01082196, 0.7592564, 0.3960784, 0, 1, 1,
0.6558526, 0.1057296, 0.5973626, 0.4039216, 0, 1, 1,
0.6586556, 1.705975, 0.5908896, 0.4117647, 0, 1, 1,
0.6590952, -1.425748, 2.469894, 0.4156863, 0, 1, 1,
0.6608875, -1.481222, 2.680788, 0.4235294, 0, 1, 1,
0.663011, -3.223757, 1.120859, 0.427451, 0, 1, 1,
0.6645098, -0.6384662, 2.637851, 0.4352941, 0, 1, 1,
0.6677191, 0.7154742, 1.778024, 0.4392157, 0, 1, 1,
0.6683072, -0.5329303, 2.103495, 0.4470588, 0, 1, 1,
0.6691315, -0.9762096, 4.318718, 0.4509804, 0, 1, 1,
0.6715007, 0.6344791, 1.146726, 0.4588235, 0, 1, 1,
0.6741246, 0.1374042, 4.074121, 0.4627451, 0, 1, 1,
0.6764185, 0.4419831, 0.9839544, 0.4705882, 0, 1, 1,
0.6769925, 1.688212, 0.4298143, 0.4745098, 0, 1, 1,
0.6770673, -0.217511, 0.6396132, 0.4823529, 0, 1, 1,
0.6811139, 0.5135587, 0.8456035, 0.4862745, 0, 1, 1,
0.6832275, 0.5365919, 0.6456836, 0.4941176, 0, 1, 1,
0.6862438, -0.306701, 1.484195, 0.5019608, 0, 1, 1,
0.6897728, 0.8075857, -0.5913699, 0.5058824, 0, 1, 1,
0.6898581, 0.437229, -1.034331, 0.5137255, 0, 1, 1,
0.6948215, 0.4085361, 1.344498, 0.5176471, 0, 1, 1,
0.6954688, 0.1154573, 0.7134867, 0.5254902, 0, 1, 1,
0.701328, 2.000562, -2.594586, 0.5294118, 0, 1, 1,
0.7076472, -0.6257389, 3.913218, 0.5372549, 0, 1, 1,
0.7177173, -0.41989, 2.353692, 0.5411765, 0, 1, 1,
0.7178555, -1.387945, 3.917569, 0.5490196, 0, 1, 1,
0.7183088, 0.6302569, 0.5842347, 0.5529412, 0, 1, 1,
0.7206011, -0.4280731, 1.005236, 0.5607843, 0, 1, 1,
0.7221288, -1.229163, 1.341755, 0.5647059, 0, 1, 1,
0.7250681, 1.073181, 0.9892848, 0.572549, 0, 1, 1,
0.7285379, 2.333122, 1.002532, 0.5764706, 0, 1, 1,
0.7292764, -0.05865194, 1.206111, 0.5843138, 0, 1, 1,
0.7320079, 0.1586739, 1.035627, 0.5882353, 0, 1, 1,
0.7354246, -0.077025, 0.5625038, 0.5960785, 0, 1, 1,
0.7428383, -1.129506, 3.638315, 0.6039216, 0, 1, 1,
0.7440771, 0.5175316, 1.44693, 0.6078432, 0, 1, 1,
0.7461928, 1.590762, 2.193163, 0.6156863, 0, 1, 1,
0.7462915, -0.03968544, 1.273269, 0.6196079, 0, 1, 1,
0.7504843, 0.7038257, 0.03969667, 0.627451, 0, 1, 1,
0.7536188, 1.300845, 1.143008, 0.6313726, 0, 1, 1,
0.7559891, -1.577933, 3.296633, 0.6392157, 0, 1, 1,
0.7594859, 1.312835, -0.2049771, 0.6431373, 0, 1, 1,
0.7615443, -1.123203, 1.381072, 0.6509804, 0, 1, 1,
0.7625477, 0.3155441, 1.568658, 0.654902, 0, 1, 1,
0.7667074, -2.378132, 3.051435, 0.6627451, 0, 1, 1,
0.7707676, -0.02588627, 3.747511, 0.6666667, 0, 1, 1,
0.7707896, -0.08253019, 5.049839, 0.6745098, 0, 1, 1,
0.7844717, -0.9077832, 1.57374, 0.6784314, 0, 1, 1,
0.7872431, 1.066514, 0.8573655, 0.6862745, 0, 1, 1,
0.7964867, 0.3778053, 1.156357, 0.6901961, 0, 1, 1,
0.7969614, -0.2720138, 1.341288, 0.6980392, 0, 1, 1,
0.7972574, 1.268832, -0.153235, 0.7058824, 0, 1, 1,
0.8066204, -2.103501, 2.087566, 0.7098039, 0, 1, 1,
0.8082281, 1.177699, 2.138092, 0.7176471, 0, 1, 1,
0.8102419, 0.3428699, 0.3954422, 0.7215686, 0, 1, 1,
0.8166548, -0.5189387, 0.7325516, 0.7294118, 0, 1, 1,
0.8186576, -0.4834169, 1.942451, 0.7333333, 0, 1, 1,
0.8209772, -0.6622064, 3.553214, 0.7411765, 0, 1, 1,
0.8227215, -0.3830533, 4.08705, 0.7450981, 0, 1, 1,
0.8284246, -1.345328, 1.752493, 0.7529412, 0, 1, 1,
0.832943, 0.4096712, 1.504917, 0.7568628, 0, 1, 1,
0.834423, 0.3628404, 2.146197, 0.7647059, 0, 1, 1,
0.8358696, -0.5129185, 3.272015, 0.7686275, 0, 1, 1,
0.8385455, -1.547731, 2.081354, 0.7764706, 0, 1, 1,
0.8388674, -2.959672, 2.335513, 0.7803922, 0, 1, 1,
0.8500879, 0.6993389, 1.104284, 0.7882353, 0, 1, 1,
0.8530409, 0.1548841, 0.04996808, 0.7921569, 0, 1, 1,
0.8593785, 1.152778, 1.355821, 0.8, 0, 1, 1,
0.865712, 0.8154128, -0.4825314, 0.8078431, 0, 1, 1,
0.8671908, -1.313577, 3.03966, 0.8117647, 0, 1, 1,
0.8698381, 0.4063471, 0.2964643, 0.8196079, 0, 1, 1,
0.8751549, 0.2069859, 1.80015, 0.8235294, 0, 1, 1,
0.8783672, -0.7298081, 1.90963, 0.8313726, 0, 1, 1,
0.8813623, 0.0252323, 2.072774, 0.8352941, 0, 1, 1,
0.8843199, -1.05011, 1.665969, 0.8431373, 0, 1, 1,
0.8843749, 1.32967, -0.5460508, 0.8470588, 0, 1, 1,
0.8867739, 0.01933189, 3.631133, 0.854902, 0, 1, 1,
0.8905882, 0.1118253, 0.8692302, 0.8588235, 0, 1, 1,
0.8947806, -1.146325, 3.973245, 0.8666667, 0, 1, 1,
0.8966334, -1.09064, 2.761256, 0.8705882, 0, 1, 1,
0.9015975, -1.126389, 3.048042, 0.8784314, 0, 1, 1,
0.901848, 0.8781238, -0.3674637, 0.8823529, 0, 1, 1,
0.9021925, 0.07139118, 0.1068687, 0.8901961, 0, 1, 1,
0.9044781, 0.4817164, 1.386766, 0.8941177, 0, 1, 1,
0.904505, -0.1613201, 2.447755, 0.9019608, 0, 1, 1,
0.9073144, -0.5330783, 1.231965, 0.9098039, 0, 1, 1,
0.910332, -2.457158, 2.826516, 0.9137255, 0, 1, 1,
0.9122056, 1.68794, 0.1337771, 0.9215686, 0, 1, 1,
0.9153824, -0.5461364, 2.914576, 0.9254902, 0, 1, 1,
0.9181248, -1.693876, 2.029145, 0.9333333, 0, 1, 1,
0.9213058, -0.3800454, 2.8327, 0.9372549, 0, 1, 1,
0.9246058, 2.786454, -0.01637919, 0.945098, 0, 1, 1,
0.936267, 0.3696467, 0.1145737, 0.9490196, 0, 1, 1,
0.9537924, -0.04223225, 2.721408, 0.9568627, 0, 1, 1,
0.9563565, -1.627045, 3.351825, 0.9607843, 0, 1, 1,
0.9610497, 1.826846, 0.2211665, 0.9686275, 0, 1, 1,
0.9706305, -0.4149331, 1.8097, 0.972549, 0, 1, 1,
0.9726562, 0.3015477, 0.3350337, 0.9803922, 0, 1, 1,
0.9813482, -0.3559411, 1.760596, 0.9843137, 0, 1, 1,
0.9851837, -0.1927357, 1.475649, 0.9921569, 0, 1, 1,
0.988851, 1.851859, 1.037019, 0.9960784, 0, 1, 1,
0.9986909, 0.2309922, 1.563693, 1, 0, 0.9960784, 1,
1.001478, -1.309805, 2.131856, 1, 0, 0.9882353, 1,
1.002403, -1.13315, 3.553133, 1, 0, 0.9843137, 1,
1.006643, 1.849087, -0.2187946, 1, 0, 0.9764706, 1,
1.008096, 0.5650282, 1.006508, 1, 0, 0.972549, 1,
1.008409, 0.05708059, 1.98398, 1, 0, 0.9647059, 1,
1.010505, -0.9226642, 2.104066, 1, 0, 0.9607843, 1,
1.017375, 1.985759, 0.1526477, 1, 0, 0.9529412, 1,
1.017494, -0.1345315, 2.414562, 1, 0, 0.9490196, 1,
1.030173, -1.112844, 3.421698, 1, 0, 0.9411765, 1,
1.039443, -1.684377, 3.268481, 1, 0, 0.9372549, 1,
1.039474, 1.655914, 1.020628, 1, 0, 0.9294118, 1,
1.044237, -0.8695141, 2.176158, 1, 0, 0.9254902, 1,
1.047771, 0.6662995, 0.7839485, 1, 0, 0.9176471, 1,
1.048911, -0.148233, 3.374766, 1, 0, 0.9137255, 1,
1.048956, -0.3410778, 0.3138905, 1, 0, 0.9058824, 1,
1.052562, 0.3472189, 0.4645001, 1, 0, 0.9019608, 1,
1.062903, 0.3289996, 2.162985, 1, 0, 0.8941177, 1,
1.069794, 1.587466, 0.4816222, 1, 0, 0.8862745, 1,
1.07004, -1.613119, 1.846965, 1, 0, 0.8823529, 1,
1.078378, 0.4899827, -1.103694, 1, 0, 0.8745098, 1,
1.091145, 1.338557, 1.03927, 1, 0, 0.8705882, 1,
1.093749, 0.2269891, 1.109302, 1, 0, 0.8627451, 1,
1.107608, -0.1825687, 1.670544, 1, 0, 0.8588235, 1,
1.108072, -0.7133774, 2.311172, 1, 0, 0.8509804, 1,
1.121452, -0.6515478, 1.801381, 1, 0, 0.8470588, 1,
1.133625, 0.5087927, 3.008911, 1, 0, 0.8392157, 1,
1.134219, -1.531879, 1.77696, 1, 0, 0.8352941, 1,
1.138542, 1.460565, 0.1523644, 1, 0, 0.827451, 1,
1.145654, -0.01361734, 1.795385, 1, 0, 0.8235294, 1,
1.147143, 0.5174843, 1.076803, 1, 0, 0.8156863, 1,
1.160285, 1.1021, 1.664978, 1, 0, 0.8117647, 1,
1.175126, 0.9361436, 1.378296, 1, 0, 0.8039216, 1,
1.176337, 1.072363, 0.3144608, 1, 0, 0.7960784, 1,
1.178762, 0.8091444, 1.984361, 1, 0, 0.7921569, 1,
1.180752, 0.2356555, 0.9737924, 1, 0, 0.7843137, 1,
1.185465, -1.274863, 3.397344, 1, 0, 0.7803922, 1,
1.199065, 2.299401, 1.532366, 1, 0, 0.772549, 1,
1.201818, 0.6559939, -0.08360844, 1, 0, 0.7686275, 1,
1.207954, 0.6030351, 0.2353628, 1, 0, 0.7607843, 1,
1.213481, 0.3997298, 0.9780654, 1, 0, 0.7568628, 1,
1.214754, 0.165018, -0.147833, 1, 0, 0.7490196, 1,
1.214867, 0.5136433, 1.808777, 1, 0, 0.7450981, 1,
1.23911, 0.4374551, 0.5883642, 1, 0, 0.7372549, 1,
1.239665, 0.5591153, -1.069213, 1, 0, 0.7333333, 1,
1.252865, 0.1856686, 3.070006, 1, 0, 0.7254902, 1,
1.256799, 0.9281054, 0.1263374, 1, 0, 0.7215686, 1,
1.259036, -0.3086902, 0.8476523, 1, 0, 0.7137255, 1,
1.260879, -0.02991768, 2.00248, 1, 0, 0.7098039, 1,
1.267898, -0.8744788, 1.636128, 1, 0, 0.7019608, 1,
1.272463, -0.3994557, -0.3889495, 1, 0, 0.6941177, 1,
1.274123, 1.423488, 0.240337, 1, 0, 0.6901961, 1,
1.281145, -0.427104, 3.134602, 1, 0, 0.682353, 1,
1.283833, 0.4819535, -0.02877485, 1, 0, 0.6784314, 1,
1.299469, -0.0929584, 1.472021, 1, 0, 0.6705883, 1,
1.304625, 0.008164275, 2.235526, 1, 0, 0.6666667, 1,
1.306617, 0.7504408, 3.631158, 1, 0, 0.6588235, 1,
1.307484, -0.231976, 2.607116, 1, 0, 0.654902, 1,
1.318993, -0.4294197, 1.282281, 1, 0, 0.6470588, 1,
1.320513, -1.150019, 0.9282946, 1, 0, 0.6431373, 1,
1.32697, 0.2080738, 0.8861275, 1, 0, 0.6352941, 1,
1.3271, 0.6662211, 2.036467, 1, 0, 0.6313726, 1,
1.328634, 0.582242, 1.595175, 1, 0, 0.6235294, 1,
1.340538, 0.8246603, 2.080714, 1, 0, 0.6196079, 1,
1.34084, 1.714306, 0.4436375, 1, 0, 0.6117647, 1,
1.340852, 0.09277441, 2.117953, 1, 0, 0.6078432, 1,
1.343833, 0.07343313, 0.8712209, 1, 0, 0.6, 1,
1.347077, -0.1231501, 1.952788, 1, 0, 0.5921569, 1,
1.34908, -0.2017962, 1.807693, 1, 0, 0.5882353, 1,
1.35975, 0.73627, 1.25643, 1, 0, 0.5803922, 1,
1.360169, -1.474085, 2.342576, 1, 0, 0.5764706, 1,
1.368619, -0.6678267, 1.738686, 1, 0, 0.5686275, 1,
1.372967, 0.9886619, 1.096033, 1, 0, 0.5647059, 1,
1.374074, -0.3154455, 2.60784, 1, 0, 0.5568628, 1,
1.375738, 1.53082, 0.8783276, 1, 0, 0.5529412, 1,
1.379397, 0.8565304, 0.4224274, 1, 0, 0.5450981, 1,
1.386018, 0.7046403, 0.5955989, 1, 0, 0.5411765, 1,
1.394265, 0.0991803, 2.771694, 1, 0, 0.5333334, 1,
1.409127, 1.439491, 0.4544096, 1, 0, 0.5294118, 1,
1.41543, 1.685395, 2.669166, 1, 0, 0.5215687, 1,
1.419067, -0.9590335, 2.78874, 1, 0, 0.5176471, 1,
1.439101, -0.3443031, 1.514996, 1, 0, 0.509804, 1,
1.44026, -0.2598582, 1.251094, 1, 0, 0.5058824, 1,
1.448939, -1.261421, 2.426421, 1, 0, 0.4980392, 1,
1.453179, -1.330937, 2.055051, 1, 0, 0.4901961, 1,
1.454095, -0.07282458, 2.827204, 1, 0, 0.4862745, 1,
1.462425, 1.57934, -1.061383, 1, 0, 0.4784314, 1,
1.463961, -0.1098782, 2.386857, 1, 0, 0.4745098, 1,
1.469214, 1.314812, 1.355798, 1, 0, 0.4666667, 1,
1.474258, 0.8228236, -0.7100548, 1, 0, 0.4627451, 1,
1.487258, -2.761809, 1.224176, 1, 0, 0.454902, 1,
1.524955, -0.7794417, 2.893845, 1, 0, 0.4509804, 1,
1.540188, -0.7090985, 2.009264, 1, 0, 0.4431373, 1,
1.552588, 0.6359692, -0.1881881, 1, 0, 0.4392157, 1,
1.55259, 2.031181, 1.457287, 1, 0, 0.4313726, 1,
1.553732, -0.03277984, 1.784341, 1, 0, 0.427451, 1,
1.558458, 0.0443849, 2.050867, 1, 0, 0.4196078, 1,
1.58405, 1.5458, -0.03705516, 1, 0, 0.4156863, 1,
1.593136, -1.768751, 3.496587, 1, 0, 0.4078431, 1,
1.596289, 0.09091018, 1.720973, 1, 0, 0.4039216, 1,
1.6015, -0.1300179, 2.790681, 1, 0, 0.3960784, 1,
1.602042, 0.8942208, 1.629169, 1, 0, 0.3882353, 1,
1.616262, 0.3883978, 2.124264, 1, 0, 0.3843137, 1,
1.617037, -0.2971335, 2.963965, 1, 0, 0.3764706, 1,
1.624238, 1.038228, 1.15706, 1, 0, 0.372549, 1,
1.638978, -1.181059, 2.22741, 1, 0, 0.3647059, 1,
1.65366, 0.2770602, 0.5215856, 1, 0, 0.3607843, 1,
1.655655, -1.159473, 1.813969, 1, 0, 0.3529412, 1,
1.669476, 1.110211, 0.8172294, 1, 0, 0.3490196, 1,
1.678273, 0.7473665, 2.350401, 1, 0, 0.3411765, 1,
1.704426, 1.016639, 0.5347412, 1, 0, 0.3372549, 1,
1.70654, -0.5307328, 2.56991, 1, 0, 0.3294118, 1,
1.711012, 0.7224805, 0.1935164, 1, 0, 0.3254902, 1,
1.711234, 0.2768374, 1.294964, 1, 0, 0.3176471, 1,
1.717843, -0.559241, 2.126067, 1, 0, 0.3137255, 1,
1.722535, 2.274152, 2.009899, 1, 0, 0.3058824, 1,
1.7236, 0.7632778, 0.9488255, 1, 0, 0.2980392, 1,
1.731914, 1.147948, 0.04302128, 1, 0, 0.2941177, 1,
1.736144, 0.8548664, 1.375647, 1, 0, 0.2862745, 1,
1.740122, -1.799872, 2.706842, 1, 0, 0.282353, 1,
1.745442, 0.4235072, 0.2751904, 1, 0, 0.2745098, 1,
1.749805, -0.8639039, 3.259523, 1, 0, 0.2705882, 1,
1.756013, 0.1949601, 1.52472, 1, 0, 0.2627451, 1,
1.764339, -0.1349416, 2.846442, 1, 0, 0.2588235, 1,
1.781427, 0.1955391, 2.128261, 1, 0, 0.2509804, 1,
1.784337, 0.08154381, -0.2772579, 1, 0, 0.2470588, 1,
1.784771, -0.249986, 0.5335001, 1, 0, 0.2392157, 1,
1.81236, -1.446827, 1.232743, 1, 0, 0.2352941, 1,
1.818678, -0.4708383, 2.078383, 1, 0, 0.227451, 1,
1.826209, -0.834909, 1.159378, 1, 0, 0.2235294, 1,
1.856824, -0.4371001, 3.518139, 1, 0, 0.2156863, 1,
1.859201, 0.4789234, -0.06886657, 1, 0, 0.2117647, 1,
1.870216, -0.4951681, 2.196873, 1, 0, 0.2039216, 1,
1.883094, 0.8342801, 1.526622, 1, 0, 0.1960784, 1,
1.901318, -0.7809183, 2.38786, 1, 0, 0.1921569, 1,
1.963048, -0.5469005, 1.060227, 1, 0, 0.1843137, 1,
1.968108, 0.1327009, -0.3575802, 1, 0, 0.1803922, 1,
1.996081, 0.8401772, -0.1826954, 1, 0, 0.172549, 1,
2.01153, -0.0164244, -0.5074236, 1, 0, 0.1686275, 1,
2.0348, -2.299434, 3.811208, 1, 0, 0.1607843, 1,
2.054706, 1.638774, 0.8594278, 1, 0, 0.1568628, 1,
2.073007, -1.356733, 3.989121, 1, 0, 0.1490196, 1,
2.094498, 0.8880104, 1.935834, 1, 0, 0.145098, 1,
2.114512, -0.9426777, 2.229565, 1, 0, 0.1372549, 1,
2.117097, -1.386195, 3.653189, 1, 0, 0.1333333, 1,
2.138613, 0.08992149, 1.769828, 1, 0, 0.1254902, 1,
2.14607, -1.701545, 2.303515, 1, 0, 0.1215686, 1,
2.164226, -0.9786969, 1.998371, 1, 0, 0.1137255, 1,
2.231064, 0.5181846, 2.474181, 1, 0, 0.1098039, 1,
2.264931, 0.1078404, 1.541659, 1, 0, 0.1019608, 1,
2.299083, -1.267088, 1.508671, 1, 0, 0.09411765, 1,
2.339118, -0.6732436, 2.081886, 1, 0, 0.09019608, 1,
2.344565, 0.4386042, 1.677596, 1, 0, 0.08235294, 1,
2.361223, -0.8623933, 2.523127, 1, 0, 0.07843138, 1,
2.508606, 0.2799728, 1.312205, 1, 0, 0.07058824, 1,
2.552257, -0.3934134, 0.9643731, 1, 0, 0.06666667, 1,
2.566506, 0.7040382, 3.472252, 1, 0, 0.05882353, 1,
2.601556, -0.4974759, 1.160795, 1, 0, 0.05490196, 1,
2.637152, 1.629759, 0.3186414, 1, 0, 0.04705882, 1,
2.645416, -0.2131481, 1.632758, 1, 0, 0.04313726, 1,
2.656273, -0.2968687, 0.6798803, 1, 0, 0.03529412, 1,
2.71627, 1.115055, 0.2434811, 1, 0, 0.03137255, 1,
2.890031, 1.219206, 0.7750307, 1, 0, 0.02352941, 1,
2.980537, 1.122788, 1.97947, 1, 0, 0.01960784, 1,
3.234253, -0.1387059, -0.657008, 1, 0, 0.01176471, 1,
3.908962, -0.6001927, 3.701139, 1, 0, 0.007843138, 1
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
0.4169818, -4.367691, -7.31973, 0, -0.5, 0.5, 0.5,
0.4169818, -4.367691, -7.31973, 1, -0.5, 0.5, 0.5,
0.4169818, -4.367691, -7.31973, 1, 1.5, 0.5, 0.5,
0.4169818, -4.367691, -7.31973, 0, 1.5, 0.5, 0.5
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
-4.258779, 0.1506782, -7.31973, 0, -0.5, 0.5, 0.5,
-4.258779, 0.1506782, -7.31973, 1, -0.5, 0.5, 0.5,
-4.258779, 0.1506782, -7.31973, 1, 1.5, 0.5, 0.5,
-4.258779, 0.1506782, -7.31973, 0, 1.5, 0.5, 0.5
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
-4.258779, -4.367691, 0.1771567, 0, -0.5, 0.5, 0.5,
-4.258779, -4.367691, 0.1771567, 1, -0.5, 0.5, 0.5,
-4.258779, -4.367691, 0.1771567, 1, 1.5, 0.5, 0.5,
-4.258779, -4.367691, 0.1771567, 0, 1.5, 0.5, 0.5
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
-3, -3.32499, -5.589679,
3, -3.32499, -5.589679,
-3, -3.32499, -5.589679,
-3, -3.498774, -5.878021,
-2, -3.32499, -5.589679,
-2, -3.498774, -5.878021,
-1, -3.32499, -5.589679,
-1, -3.498774, -5.878021,
0, -3.32499, -5.589679,
0, -3.498774, -5.878021,
1, -3.32499, -5.589679,
1, -3.498774, -5.878021,
2, -3.32499, -5.589679,
2, -3.498774, -5.878021,
3, -3.32499, -5.589679,
3, -3.498774, -5.878021
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
-3, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
-3, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
-3, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
-3, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
-2, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
-2, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
-2, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
-2, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
-1, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
-1, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
-1, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
-1, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
0, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
0, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
0, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
0, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
1, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
1, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
1, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
1, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
2, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
2, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
2, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
2, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5,
3, -3.84634, -6.454704, 0, -0.5, 0.5, 0.5,
3, -3.84634, -6.454704, 1, -0.5, 0.5, 0.5,
3, -3.84634, -6.454704, 1, 1.5, 0.5, 0.5,
3, -3.84634, -6.454704, 0, 1.5, 0.5, 0.5
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
-3.179757, -3, -5.589679,
-3.179757, 3, -5.589679,
-3.179757, -3, -5.589679,
-3.359594, -3, -5.878021,
-3.179757, -2, -5.589679,
-3.359594, -2, -5.878021,
-3.179757, -1, -5.589679,
-3.359594, -1, -5.878021,
-3.179757, 0, -5.589679,
-3.359594, 0, -5.878021,
-3.179757, 1, -5.589679,
-3.359594, 1, -5.878021,
-3.179757, 2, -5.589679,
-3.359594, 2, -5.878021,
-3.179757, 3, -5.589679,
-3.359594, 3, -5.878021
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
-3.719268, -3, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, -3, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, -3, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, -3, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, -2, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, -2, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, -2, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, -2, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, -1, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, -1, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, -1, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, -1, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, 0, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, 0, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, 0, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, 0, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, 1, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, 1, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, 1, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, 1, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, 2, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, 2, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, 2, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, 2, -6.454704, 0, 1.5, 0.5, 0.5,
-3.719268, 3, -6.454704, 0, -0.5, 0.5, 0.5,
-3.719268, 3, -6.454704, 1, -0.5, 0.5, 0.5,
-3.719268, 3, -6.454704, 1, 1.5, 0.5, 0.5,
-3.719268, 3, -6.454704, 0, 1.5, 0.5, 0.5
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
-3.179757, -3.32499, -4,
-3.179757, -3.32499, 4,
-3.179757, -3.32499, -4,
-3.359594, -3.498774, -4,
-3.179757, -3.32499, -2,
-3.359594, -3.498774, -2,
-3.179757, -3.32499, 0,
-3.359594, -3.498774, 0,
-3.179757, -3.32499, 2,
-3.359594, -3.498774, 2,
-3.179757, -3.32499, 4,
-3.359594, -3.498774, 4
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
-3.719268, -3.84634, -4, 0, -0.5, 0.5, 0.5,
-3.719268, -3.84634, -4, 1, -0.5, 0.5, 0.5,
-3.719268, -3.84634, -4, 1, 1.5, 0.5, 0.5,
-3.719268, -3.84634, -4, 0, 1.5, 0.5, 0.5,
-3.719268, -3.84634, -2, 0, -0.5, 0.5, 0.5,
-3.719268, -3.84634, -2, 1, -0.5, 0.5, 0.5,
-3.719268, -3.84634, -2, 1, 1.5, 0.5, 0.5,
-3.719268, -3.84634, -2, 0, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 0, 0, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 0, 1, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 0, 1, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 0, 0, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 2, 0, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 2, 1, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 2, 1, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 2, 0, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 4, 0, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 4, 1, -0.5, 0.5, 0.5,
-3.719268, -3.84634, 4, 1, 1.5, 0.5, 0.5,
-3.719268, -3.84634, 4, 0, 1.5, 0.5, 0.5
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
-3.179757, -3.32499, -5.589679,
-3.179757, 3.626346, -5.589679,
-3.179757, -3.32499, 5.943992,
-3.179757, 3.626346, 5.943992,
-3.179757, -3.32499, -5.589679,
-3.179757, -3.32499, 5.943992,
-3.179757, 3.626346, -5.589679,
-3.179757, 3.626346, 5.943992,
-3.179757, -3.32499, -5.589679,
4.013721, -3.32499, -5.589679,
-3.179757, -3.32499, 5.943992,
4.013721, -3.32499, 5.943992,
-3.179757, 3.626346, -5.589679,
4.013721, 3.626346, -5.589679,
-3.179757, 3.626346, 5.943992,
4.013721, 3.626346, 5.943992,
4.013721, -3.32499, -5.589679,
4.013721, 3.626346, -5.589679,
4.013721, -3.32499, 5.943992,
4.013721, 3.626346, 5.943992,
4.013721, -3.32499, -5.589679,
4.013721, -3.32499, 5.943992,
4.013721, 3.626346, -5.589679,
4.013721, 3.626346, 5.943992
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
var radius = 8.152482;
var distance = 36.27131;
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
mvMatrix.translate( -0.4169818, -0.1506782, -0.1771567 );
mvMatrix.scale( 1.225363, 1.268047, 0.7642514 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.27131);
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
Chlorobromuron<-read.table("Chlorobromuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorobromuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobromuron' not found
```

```r
y<-Chlorobromuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobromuron' not found
```

```r
z<-Chlorobromuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorobromuron' not found
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
-3.074998, 1.77294, 0.04305209, 0, 0, 1, 1, 1,
-3.030138, 1.25094, -2.452041, 1, 0, 0, 1, 1,
-2.82528, 0.2711979, 0.3736255, 1, 0, 0, 1, 1,
-2.667385, -0.2096308, -0.3097295, 1, 0, 0, 1, 1,
-2.469252, -1.541409, -0.09547269, 1, 0, 0, 1, 1,
-2.414995, -1.107505, -3.081426, 1, 0, 0, 1, 1,
-2.240783, -0.3880244, -1.565012, 0, 0, 0, 1, 1,
-2.222356, 1.185216, -1.817616, 0, 0, 0, 1, 1,
-2.152651, 0.05886469, -2.333995, 0, 0, 0, 1, 1,
-2.137516, 1.821678, -0.4575808, 0, 0, 0, 1, 1,
-2.133153, -2.058722, -1.952, 0, 0, 0, 1, 1,
-2.095425, 0.3117453, -1.7411, 0, 0, 0, 1, 1,
-2.047486, 0.2361062, -1.147676, 0, 0, 0, 1, 1,
-2.043983, -0.7690768, -2.839079, 1, 1, 1, 1, 1,
-2.007664, 0.7725415, 0.213892, 1, 1, 1, 1, 1,
-1.99106, -2.332001, -5.421713, 1, 1, 1, 1, 1,
-1.986944, -0.944961, -0.6220539, 1, 1, 1, 1, 1,
-1.978488, 0.8385925, -1.85477, 1, 1, 1, 1, 1,
-1.922413, 1.272327, -2.248951, 1, 1, 1, 1, 1,
-1.899357, -1.630019, -2.855267, 1, 1, 1, 1, 1,
-1.884024, 0.2548633, -3.8652, 1, 1, 1, 1, 1,
-1.874626, 0.9613093, -1.441771, 1, 1, 1, 1, 1,
-1.862918, 1.904283, -0.0851213, 1, 1, 1, 1, 1,
-1.858637, -0.03203192, -1.076699, 1, 1, 1, 1, 1,
-1.858521, -0.2731206, -0.1148944, 1, 1, 1, 1, 1,
-1.79904, 0.6628734, 0.6262327, 1, 1, 1, 1, 1,
-1.786842, 2.693234, -1.414898, 1, 1, 1, 1, 1,
-1.78563, 0.4909708, -3.05431, 1, 1, 1, 1, 1,
-1.784426, -1.430143, -2.993484, 0, 0, 1, 1, 1,
-1.782704, -1.026506, -2.528998, 1, 0, 0, 1, 1,
-1.771288, 0.3021912, -1.087552, 1, 0, 0, 1, 1,
-1.766687, 0.311262, -0.5671856, 1, 0, 0, 1, 1,
-1.761957, 0.2473894, -1.41094, 1, 0, 0, 1, 1,
-1.756994, 0.1342102, -1.875571, 1, 0, 0, 1, 1,
-1.73769, 0.468432, -2.539133, 0, 0, 0, 1, 1,
-1.732641, 0.6026538, -1.180951, 0, 0, 0, 1, 1,
-1.726947, 0.3799151, -2.55986, 0, 0, 0, 1, 1,
-1.725944, 0.04306677, -2.148907, 0, 0, 0, 1, 1,
-1.721921, -0.4259894, -1.383618, 0, 0, 0, 1, 1,
-1.71342, 0.4844178, -3.125878, 0, 0, 0, 1, 1,
-1.705652, 0.4374265, 0.01240438, 0, 0, 0, 1, 1,
-1.699877, -0.7401935, -2.473781, 1, 1, 1, 1, 1,
-1.692241, -1.235045, -3.040013, 1, 1, 1, 1, 1,
-1.691406, 0.1901783, -0.3255745, 1, 1, 1, 1, 1,
-1.68935, -0.5720067, -0.9114481, 1, 1, 1, 1, 1,
-1.687263, 0.7659221, -0.1596913, 1, 1, 1, 1, 1,
-1.685637, 1.083657, -2.341737, 1, 1, 1, 1, 1,
-1.68379, 1.420428, -1.624074, 1, 1, 1, 1, 1,
-1.671545, 0.1460991, -2.967925, 1, 1, 1, 1, 1,
-1.669162, -1.19065, -2.004029, 1, 1, 1, 1, 1,
-1.653877, -0.09327868, 0.02065871, 1, 1, 1, 1, 1,
-1.651213, -1.544889, -1.810349, 1, 1, 1, 1, 1,
-1.644727, 0.1314212, -0.9628325, 1, 1, 1, 1, 1,
-1.629787, 0.7874889, -2.426744, 1, 1, 1, 1, 1,
-1.627414, 0.392486, -0.4684866, 1, 1, 1, 1, 1,
-1.627102, -1.094156, -1.461101, 1, 1, 1, 1, 1,
-1.618091, -1.150057, -3.512651, 0, 0, 1, 1, 1,
-1.603933, -1.172131, -1.991032, 1, 0, 0, 1, 1,
-1.596781, 0.2857097, -1.249408, 1, 0, 0, 1, 1,
-1.582565, 0.6213151, -0.4917501, 1, 0, 0, 1, 1,
-1.575822, 1.651889, -1.788822, 1, 0, 0, 1, 1,
-1.567528, 0.6571128, -1.129386, 1, 0, 0, 1, 1,
-1.55609, 0.894765, -1.701609, 0, 0, 0, 1, 1,
-1.546783, -0.3874973, -1.884532, 0, 0, 0, 1, 1,
-1.543125, 0.6989336, -0.897086, 0, 0, 0, 1, 1,
-1.524841, 0.4509749, -0.7043515, 0, 0, 0, 1, 1,
-1.524128, 0.01858246, -2.174069, 0, 0, 0, 1, 1,
-1.521681, -2.28987, -2.443941, 0, 0, 0, 1, 1,
-1.52087, -0.846856, -3.085883, 0, 0, 0, 1, 1,
-1.515905, 1.218889, -2.150816, 1, 1, 1, 1, 1,
-1.506477, 1.867239, -0.5045453, 1, 1, 1, 1, 1,
-1.471953, 0.2064217, -1.262287, 1, 1, 1, 1, 1,
-1.445056, -0.3749526, -1.948696, 1, 1, 1, 1, 1,
-1.429643, -0.6931123, -1.204706, 1, 1, 1, 1, 1,
-1.426698, 0.3457516, -1.549679, 1, 1, 1, 1, 1,
-1.42571, 0.8695784, -0.6130461, 1, 1, 1, 1, 1,
-1.413417, 0.2998597, -1.955956, 1, 1, 1, 1, 1,
-1.406242, 0.8635783, -2.233769, 1, 1, 1, 1, 1,
-1.39366, 0.07242677, -3.417146, 1, 1, 1, 1, 1,
-1.375624, 0.776969, -1.412968, 1, 1, 1, 1, 1,
-1.371547, 0.5245491, -1.885032, 1, 1, 1, 1, 1,
-1.365071, 1.798953, -0.1350343, 1, 1, 1, 1, 1,
-1.357423, -1.465812, -2.948461, 1, 1, 1, 1, 1,
-1.340379, -1.102335, -1.517197, 1, 1, 1, 1, 1,
-1.337158, -0.5684246, -3.120103, 0, 0, 1, 1, 1,
-1.321656, 0.4597685, -0.3035104, 1, 0, 0, 1, 1,
-1.32155, 0.8386713, 0.04225224, 1, 0, 0, 1, 1,
-1.313606, -0.3660828, -2.401447, 1, 0, 0, 1, 1,
-1.311205, -0.6372744, -1.53903, 1, 0, 0, 1, 1,
-1.310308, 0.8392025, 0.2918852, 1, 0, 0, 1, 1,
-1.307936, 0.2857229, -2.813065, 0, 0, 0, 1, 1,
-1.298553, -1.614408, -2.849596, 0, 0, 0, 1, 1,
-1.298038, 0.717568, 0.3151431, 0, 0, 0, 1, 1,
-1.293191, -0.6094334, -2.409752, 0, 0, 0, 1, 1,
-1.267563, -0.6966, -2.270804, 0, 0, 0, 1, 1,
-1.263998, 0.206741, -0.1536717, 0, 0, 0, 1, 1,
-1.257657, 0.4186403, -3.423237, 0, 0, 0, 1, 1,
-1.254727, -0.02321902, -2.579527, 1, 1, 1, 1, 1,
-1.251149, -0.5630394, -1.777671, 1, 1, 1, 1, 1,
-1.250065, -0.8154119, -4.187778, 1, 1, 1, 1, 1,
-1.23766, 0.5945992, -0.713513, 1, 1, 1, 1, 1,
-1.234422, 1.847339, -0.03325349, 1, 1, 1, 1, 1,
-1.233015, 0.5170264, -1.895358, 1, 1, 1, 1, 1,
-1.231126, 1.373219, -1.372697, 1, 1, 1, 1, 1,
-1.224237, -0.07702136, -0.5693929, 1, 1, 1, 1, 1,
-1.221516, 1.152665, -0.9375745, 1, 1, 1, 1, 1,
-1.215026, 0.00990055, -1.715176, 1, 1, 1, 1, 1,
-1.212362, 0.3236606, 1.163312, 1, 1, 1, 1, 1,
-1.208291, -0.6817476, -0.8078302, 1, 1, 1, 1, 1,
-1.207462, -0.1284982, -0.3285682, 1, 1, 1, 1, 1,
-1.194232, -0.428905, -1.243883, 1, 1, 1, 1, 1,
-1.193087, -0.7609825, -2.124964, 1, 1, 1, 1, 1,
-1.192005, 1.244803, 0.7184556, 0, 0, 1, 1, 1,
-1.189802, -1.131876, -1.963115, 1, 0, 0, 1, 1,
-1.187866, -1.153724, -1.962812, 1, 0, 0, 1, 1,
-1.176426, -1.053544, -2.107678, 1, 0, 0, 1, 1,
-1.176293, -0.187877, -2.457231, 1, 0, 0, 1, 1,
-1.175463, 1.018617, 0.3141597, 1, 0, 0, 1, 1,
-1.166664, 0.4549416, 0.1427775, 0, 0, 0, 1, 1,
-1.159603, 1.245607, -0.5881809, 0, 0, 0, 1, 1,
-1.152317, 1.151361, -1.552012, 0, 0, 0, 1, 1,
-1.151659, 1.422196, -0.6564963, 0, 0, 0, 1, 1,
-1.116094, 0.5789402, 1.017386, 0, 0, 0, 1, 1,
-1.107715, 2.365532, -1.020179, 0, 0, 0, 1, 1,
-1.10402, -0.6080657, -2.224487, 0, 0, 0, 1, 1,
-1.095164, 0.5359058, -0.2728094, 1, 1, 1, 1, 1,
-1.083223, -0.576624, -1.847905, 1, 1, 1, 1, 1,
-1.076756, 0.6746414, -4.12887, 1, 1, 1, 1, 1,
-1.062983, 0.9444001, -0.3680905, 1, 1, 1, 1, 1,
-1.054917, 0.4142609, -0.5386837, 1, 1, 1, 1, 1,
-1.05334, 1.070284, -2.598797, 1, 1, 1, 1, 1,
-1.052088, -0.1276212, -1.876054, 1, 1, 1, 1, 1,
-1.051607, -0.4642679, -2.590405, 1, 1, 1, 1, 1,
-1.05065, -0.5131961, -2.825862, 1, 1, 1, 1, 1,
-1.043343, 1.247012, -1.937462, 1, 1, 1, 1, 1,
-1.042929, -0.3115089, -0.1293424, 1, 1, 1, 1, 1,
-1.037262, 0.7191023, 0.06529155, 1, 1, 1, 1, 1,
-1.030735, 0.333128, -0.7404879, 1, 1, 1, 1, 1,
-1.023488, 1.314491, 0.328386, 1, 1, 1, 1, 1,
-1.007983, -0.3993683, -2.450951, 1, 1, 1, 1, 1,
-1.006837, -0.5896819, -1.011695, 0, 0, 1, 1, 1,
-1.006734, -0.06708074, -0.3106816, 1, 0, 0, 1, 1,
-1.005629, 1.077576, -0.5014361, 1, 0, 0, 1, 1,
-1.002164, -0.3989724, -1.70672, 1, 0, 0, 1, 1,
-1.000681, -1.024819, -1.656662, 1, 0, 0, 1, 1,
-0.9994366, 1.504833, -0.5552123, 1, 0, 0, 1, 1,
-0.9979923, 0.7527376, -0.4201413, 0, 0, 0, 1, 1,
-0.9952926, -1.435008, -2.628803, 0, 0, 0, 1, 1,
-0.9846489, -0.6047332, -1.305165, 0, 0, 0, 1, 1,
-0.9842972, 0.3448468, -0.2252601, 0, 0, 0, 1, 1,
-0.9810189, -0.5235785, -2.29498, 0, 0, 0, 1, 1,
-0.9723698, -1.57758, -2.863854, 0, 0, 0, 1, 1,
-0.9697915, -0.8650163, 0.3097643, 0, 0, 0, 1, 1,
-0.9683974, -0.4704597, -2.159013, 1, 1, 1, 1, 1,
-0.9679981, 0.434248, -1.435012, 1, 1, 1, 1, 1,
-0.9670894, 0.4153245, 0.3900821, 1, 1, 1, 1, 1,
-0.9670076, -0.392902, -2.869145, 1, 1, 1, 1, 1,
-0.957021, 0.6023983, -0.6521393, 1, 1, 1, 1, 1,
-0.9532622, 0.04668928, -0.9298412, 1, 1, 1, 1, 1,
-0.9514237, -0.2932309, -3.130845, 1, 1, 1, 1, 1,
-0.9502713, -0.1289226, -2.03934, 1, 1, 1, 1, 1,
-0.9447283, 0.0365191, -2.24382, 1, 1, 1, 1, 1,
-0.9430171, -0.5760893, -2.804123, 1, 1, 1, 1, 1,
-0.942794, -0.2651162, -0.2809411, 1, 1, 1, 1, 1,
-0.9383546, 1.691209, -1.647414, 1, 1, 1, 1, 1,
-0.9347489, -0.5274282, -2.700295, 1, 1, 1, 1, 1,
-0.9331006, -0.403933, -1.297305, 1, 1, 1, 1, 1,
-0.9316472, -0.6581887, -1.868356, 1, 1, 1, 1, 1,
-0.9216301, -0.8483954, -1.756732, 0, 0, 1, 1, 1,
-0.9195189, -0.3860181, -2.873797, 1, 0, 0, 1, 1,
-0.919164, 0.8734556, -1.04178, 1, 0, 0, 1, 1,
-0.9188831, -0.8065595, -1.550868, 1, 0, 0, 1, 1,
-0.9126941, 0.02053098, -1.877156, 1, 0, 0, 1, 1,
-0.9125162, -0.5153517, -2.256582, 1, 0, 0, 1, 1,
-0.9123924, -0.3473524, -2.022162, 0, 0, 0, 1, 1,
-0.9050006, 0.4216424, -1.393155, 0, 0, 0, 1, 1,
-0.9016577, 0.7763416, -1.991067, 0, 0, 0, 1, 1,
-0.9013525, 2.248355, 0.3914226, 0, 0, 0, 1, 1,
-0.8963993, 0.03982721, -1.35799, 0, 0, 0, 1, 1,
-0.8960703, 0.7821112, -1.440998, 0, 0, 0, 1, 1,
-0.8820507, 0.8105512, -0.4809584, 0, 0, 0, 1, 1,
-0.8778519, -1.390724, -1.797747, 1, 1, 1, 1, 1,
-0.8773229, 1.058332, -1.68602, 1, 1, 1, 1, 1,
-0.8624874, 0.7233645, -1.110542, 1, 1, 1, 1, 1,
-0.8558202, 0.2726333, -3.310561, 1, 1, 1, 1, 1,
-0.8418556, 0.4828765, -1.16837, 1, 1, 1, 1, 1,
-0.8399786, 0.2659378, -0.8001642, 1, 1, 1, 1, 1,
-0.83946, -0.3079568, -0.3506666, 1, 1, 1, 1, 1,
-0.8381784, -1.152399, -1.970092, 1, 1, 1, 1, 1,
-0.837011, 1.688963, 0.3477507, 1, 1, 1, 1, 1,
-0.8345902, -0.1156697, -1.802806, 1, 1, 1, 1, 1,
-0.8238887, -0.07134121, -1.101255, 1, 1, 1, 1, 1,
-0.8206224, -1.425151, -0.9339327, 1, 1, 1, 1, 1,
-0.8137898, 0.211094, -0.7627529, 1, 1, 1, 1, 1,
-0.8102944, -0.03351272, -1.80764, 1, 1, 1, 1, 1,
-0.8028167, 0.703732, 0.3287586, 1, 1, 1, 1, 1,
-0.8011622, 0.3078315, -1.266932, 0, 0, 1, 1, 1,
-0.7970689, -0.4322425, -2.120334, 1, 0, 0, 1, 1,
-0.7884267, -1.79316, -1.57614, 1, 0, 0, 1, 1,
-0.7855134, -0.6983424, -3.178161, 1, 0, 0, 1, 1,
-0.7837158, -1.57458, -2.990482, 1, 0, 0, 1, 1,
-0.7780356, -1.049903, -3.005338, 1, 0, 0, 1, 1,
-0.7770692, -0.6015848, -1.897333, 0, 0, 0, 1, 1,
-0.7757517, -0.6439424, -1.933197, 0, 0, 0, 1, 1,
-0.7746971, -2.004399, -1.431737, 0, 0, 0, 1, 1,
-0.7725741, -1.728114, -2.950234, 0, 0, 0, 1, 1,
-0.7693075, -0.6910121, -0.353844, 0, 0, 0, 1, 1,
-0.7675315, 1.398396, -0.2296399, 0, 0, 0, 1, 1,
-0.7673012, -0.611434, -2.618369, 0, 0, 0, 1, 1,
-0.765857, -0.64671, -1.616593, 1, 1, 1, 1, 1,
-0.7607353, 0.6981933, -2.395802, 1, 1, 1, 1, 1,
-0.7592321, 1.870101, 0.671072, 1, 1, 1, 1, 1,
-0.7579353, 1.399766, -0.46935, 1, 1, 1, 1, 1,
-0.7564153, -0.635236, -2.69311, 1, 1, 1, 1, 1,
-0.7537397, 0.9897686, -2.483405, 1, 1, 1, 1, 1,
-0.7535607, -0.09405408, -1.367479, 1, 1, 1, 1, 1,
-0.7458336, -1.87904, -2.418503, 1, 1, 1, 1, 1,
-0.7428876, 0.3003404, -1.408246, 1, 1, 1, 1, 1,
-0.7418747, -2.198145, -0.4459075, 1, 1, 1, 1, 1,
-0.7378562, 0.6394023, -0.7871595, 1, 1, 1, 1, 1,
-0.7372867, 1.236433, -0.5322241, 1, 1, 1, 1, 1,
-0.7357596, 1.855185, 0.3156446, 1, 1, 1, 1, 1,
-0.7330428, 0.3681209, -0.9207765, 1, 1, 1, 1, 1,
-0.7204443, -0.7605433, -0.4218284, 1, 1, 1, 1, 1,
-0.7193233, 1.810625, -1.411538, 0, 0, 1, 1, 1,
-0.7171919, 0.5441244, -1.490682, 1, 0, 0, 1, 1,
-0.7128792, 0.2369792, -1.476566, 1, 0, 0, 1, 1,
-0.7068585, -0.5320816, -2.211711, 1, 0, 0, 1, 1,
-0.6964432, -0.5914263, -1.663468, 1, 0, 0, 1, 1,
-0.6898323, -0.5129814, -0.6558751, 1, 0, 0, 1, 1,
-0.6882439, -0.4101856, -1.263981, 0, 0, 0, 1, 1,
-0.6873308, 1.726215, -2.335567, 0, 0, 0, 1, 1,
-0.6796157, -0.8156297, -2.57166, 0, 0, 0, 1, 1,
-0.6785418, 1.152519, -0.7491019, 0, 0, 0, 1, 1,
-0.6772088, -0.4777365, -0.5365085, 0, 0, 0, 1, 1,
-0.6767653, -0.6114963, -2.447074, 0, 0, 0, 1, 1,
-0.6741783, 0.2068794, -1.096478, 0, 0, 0, 1, 1,
-0.6703328, -0.3283893, -1.499939, 1, 1, 1, 1, 1,
-0.6625873, -1.253581, -1.814702, 1, 1, 1, 1, 1,
-0.6585404, 0.1541098, -1.696727, 1, 1, 1, 1, 1,
-0.6578715, 0.5804061, 0.2212412, 1, 1, 1, 1, 1,
-0.6578167, 0.09038766, -0.90202, 1, 1, 1, 1, 1,
-0.6535385, -1.12115, -4.333243, 1, 1, 1, 1, 1,
-0.6493828, 0.2882506, -0.4288258, 1, 1, 1, 1, 1,
-0.645655, -0.4948723, -1.779057, 1, 1, 1, 1, 1,
-0.6438648, -1.957224, -3.997737, 1, 1, 1, 1, 1,
-0.6402846, -0.4691616, -2.885253, 1, 1, 1, 1, 1,
-0.6359869, -0.893719, -2.832613, 1, 1, 1, 1, 1,
-0.6332232, -0.7306914, -1.650674, 1, 1, 1, 1, 1,
-0.6327975, -0.718917, -2.115233, 1, 1, 1, 1, 1,
-0.6323919, 0.4542927, -1.34486, 1, 1, 1, 1, 1,
-0.6279072, -0.3587643, -1.945196, 1, 1, 1, 1, 1,
-0.6262023, 0.6775061, -0.806609, 0, 0, 1, 1, 1,
-0.6242307, -0.3741723, -0.09872127, 1, 0, 0, 1, 1,
-0.6232113, -1.005441, -2.991144, 1, 0, 0, 1, 1,
-0.6216266, 0.5263291, -1.53328, 1, 0, 0, 1, 1,
-0.6189358, -0.3868089, -0.8053523, 1, 0, 0, 1, 1,
-0.6185879, 1.306578, -0.6520132, 1, 0, 0, 1, 1,
-0.616215, -0.9817656, -2.61377, 0, 0, 0, 1, 1,
-0.6158156, 0.1566915, -3.215603, 0, 0, 0, 1, 1,
-0.6152306, 1.486144, -0.769953, 0, 0, 0, 1, 1,
-0.6141491, -0.1856067, -2.146354, 0, 0, 0, 1, 1,
-0.6137919, 0.2233901, -1.042565, 0, 0, 0, 1, 1,
-0.6064368, -0.7709404, -2.436789, 0, 0, 0, 1, 1,
-0.6003267, -0.8199121, -3.393, 0, 0, 0, 1, 1,
-0.5992379, 1.779746, 0.6378527, 1, 1, 1, 1, 1,
-0.5924411, -1.5466, -2.385811, 1, 1, 1, 1, 1,
-0.5870478, -0.4748749, -1.336333, 1, 1, 1, 1, 1,
-0.5832894, -0.2747706, -2.921646, 1, 1, 1, 1, 1,
-0.5799601, 0.7531811, -1.817168, 1, 1, 1, 1, 1,
-0.5798625, -1.421598, -3.238727, 1, 1, 1, 1, 1,
-0.5765766, 0.1313087, -2.483636, 1, 1, 1, 1, 1,
-0.5749874, -0.3200502, -1.798522, 1, 1, 1, 1, 1,
-0.5718263, -0.328562, -1.884065, 1, 1, 1, 1, 1,
-0.5686887, 0.2531771, -0.5464426, 1, 1, 1, 1, 1,
-0.5682451, 1.348045, 0.0005459865, 1, 1, 1, 1, 1,
-0.5676051, -0.8964358, -1.081527, 1, 1, 1, 1, 1,
-0.5642259, 0.510646, -1.199318, 1, 1, 1, 1, 1,
-0.5559584, -0.499877, -1.957646, 1, 1, 1, 1, 1,
-0.5539576, -1.572782, -3.64897, 1, 1, 1, 1, 1,
-0.5534529, -0.4512637, 0.1910899, 0, 0, 1, 1, 1,
-0.5458808, -0.5633798, -1.967123, 1, 0, 0, 1, 1,
-0.5451034, 1.172756, -0.9465372, 1, 0, 0, 1, 1,
-0.5447771, 0.4439881, -1.077283, 1, 0, 0, 1, 1,
-0.54162, -0.6180273, -0.5582569, 1, 0, 0, 1, 1,
-0.5413177, 0.9806863, -0.2201746, 1, 0, 0, 1, 1,
-0.5402373, -1.22055, -2.810293, 0, 0, 0, 1, 1,
-0.5402264, 0.2833101, -0.6204557, 0, 0, 0, 1, 1,
-0.5359453, 0.1361014, 0.2919019, 0, 0, 0, 1, 1,
-0.5354558, -0.02676105, -0.41561, 0, 0, 0, 1, 1,
-0.5312448, -0.7734428, -2.627588, 0, 0, 0, 1, 1,
-0.5302163, -0.48309, -2.463783, 0, 0, 0, 1, 1,
-0.5297674, 0.5226539, -1.476463, 0, 0, 0, 1, 1,
-0.5265118, 1.20459, -2.644792, 1, 1, 1, 1, 1,
-0.5255811, 0.1997057, -0.841134, 1, 1, 1, 1, 1,
-0.5203292, 0.5781827, -2.601749, 1, 1, 1, 1, 1,
-0.5200045, 0.4058744, 0.0240736, 1, 1, 1, 1, 1,
-0.5150766, -1.313931, -2.814531, 1, 1, 1, 1, 1,
-0.5137978, -0.3882065, -3.176617, 1, 1, 1, 1, 1,
-0.5108543, 0.01625076, -2.259439, 1, 1, 1, 1, 1,
-0.5062658, 0.443997, -0.7281966, 1, 1, 1, 1, 1,
-0.5061982, -0.1584202, -0.03686333, 1, 1, 1, 1, 1,
-0.5058875, 0.5831771, -0.4896373, 1, 1, 1, 1, 1,
-0.5057532, 0.6854213, 0.2234965, 1, 1, 1, 1, 1,
-0.500588, 0.9424869, 0.996214, 1, 1, 1, 1, 1,
-0.4969915, -0.1994634, -2.185258, 1, 1, 1, 1, 1,
-0.49312, 2.011864, -3.15275, 1, 1, 1, 1, 1,
-0.4925224, 0.2744969, -1.482211, 1, 1, 1, 1, 1,
-0.4903741, -1.053286, -2.283965, 0, 0, 1, 1, 1,
-0.4879919, 1.345488, -0.654183, 1, 0, 0, 1, 1,
-0.4828396, 1.414295, 1.79984, 1, 0, 0, 1, 1,
-0.4828079, -1.025797, -3.620223, 1, 0, 0, 1, 1,
-0.4820332, 1.532996, 0.7347679, 1, 0, 0, 1, 1,
-0.4813795, -0.1190101, -3.068701, 1, 0, 0, 1, 1,
-0.4769566, -0.7886473, -2.602096, 0, 0, 0, 1, 1,
-0.474231, 0.05460808, -3.403658, 0, 0, 0, 1, 1,
-0.4740878, -0.9271594, -1.175412, 0, 0, 0, 1, 1,
-0.4664818, -1.482874, -2.61474, 0, 0, 0, 1, 1,
-0.4664364, -0.758534, -4.272133, 0, 0, 0, 1, 1,
-0.4663352, -0.1066099, -0.5973945, 0, 0, 0, 1, 1,
-0.4652689, 0.3304065, 0.1718246, 0, 0, 0, 1, 1,
-0.465267, -0.5641895, -2.362682, 1, 1, 1, 1, 1,
-0.463834, -0.4279356, -1.554627, 1, 1, 1, 1, 1,
-0.4610706, -0.988631, -3.463441, 1, 1, 1, 1, 1,
-0.4592601, -0.243578, -1.677475, 1, 1, 1, 1, 1,
-0.4589286, 0.4326715, -0.006120705, 1, 1, 1, 1, 1,
-0.4546669, 0.8311821, -1.910837, 1, 1, 1, 1, 1,
-0.4532327, 0.1477367, -1.660393, 1, 1, 1, 1, 1,
-0.4526297, 0.05716249, -1.586297, 1, 1, 1, 1, 1,
-0.4525166, -0.3662215, -4.183096, 1, 1, 1, 1, 1,
-0.447077, -0.9292122, -4.378647, 1, 1, 1, 1, 1,
-0.4435535, 0.909287, -1.115592, 1, 1, 1, 1, 1,
-0.4412149, -1.8204, -3.601136, 1, 1, 1, 1, 1,
-0.4356279, -0.3551135, -3.404895, 1, 1, 1, 1, 1,
-0.4355737, -0.8292504, -1.897955, 1, 1, 1, 1, 1,
-0.4308748, -0.696113, -2.39582, 1, 1, 1, 1, 1,
-0.4232424, 1.287297, -1.658587, 0, 0, 1, 1, 1,
-0.4204516, 0.1800548, 0.3380864, 1, 0, 0, 1, 1,
-0.4187307, 1.473941, -1.299811, 1, 0, 0, 1, 1,
-0.4183797, -1.148098, -3.269687, 1, 0, 0, 1, 1,
-0.4156568, 0.6662034, -0.7468593, 1, 0, 0, 1, 1,
-0.4152958, -0.5116881, -1.557215, 1, 0, 0, 1, 1,
-0.4140833, 0.9053941, 0.684853, 0, 0, 0, 1, 1,
-0.4121365, 0.856468, -0.9749889, 0, 0, 0, 1, 1,
-0.4116623, 0.4207194, 0.06381796, 0, 0, 0, 1, 1,
-0.4104943, 0.4735046, 1.472638, 0, 0, 0, 1, 1,
-0.4094903, 0.622494, -0.2072381, 0, 0, 0, 1, 1,
-0.404673, -0.9633303, -2.836303, 0, 0, 0, 1, 1,
-0.402077, 0.2424673, -1.281261, 0, 0, 0, 1, 1,
-0.3991894, -1.997715, -2.828632, 1, 1, 1, 1, 1,
-0.3990534, -0.7410734, -3.559451, 1, 1, 1, 1, 1,
-0.3986009, -0.4378201, -2.668477, 1, 1, 1, 1, 1,
-0.396376, -0.7713057, -4.31135, 1, 1, 1, 1, 1,
-0.3948946, -0.4490294, -3.276359, 1, 1, 1, 1, 1,
-0.3946657, 0.3782469, 0.005850988, 1, 1, 1, 1, 1,
-0.3915935, 0.5210554, 0.386703, 1, 1, 1, 1, 1,
-0.3915665, 0.1510751, -0.829178, 1, 1, 1, 1, 1,
-0.391083, -1.166839, -3.685742, 1, 1, 1, 1, 1,
-0.3902672, -1.127652, -2.401056, 1, 1, 1, 1, 1,
-0.3855142, 1.155928, 1.29887, 1, 1, 1, 1, 1,
-0.3827176, -0.4084689, -0.9885352, 1, 1, 1, 1, 1,
-0.3743144, 0.7602484, -0.5638353, 1, 1, 1, 1, 1,
-0.3732032, 0.5968167, -2.362334, 1, 1, 1, 1, 1,
-0.3710712, -0.290526, -3.954533, 1, 1, 1, 1, 1,
-0.3708894, -0.574546, -2.888112, 0, 0, 1, 1, 1,
-0.3686323, 1.388744, -0.7441055, 1, 0, 0, 1, 1,
-0.3660817, 1.400819, 0.01092626, 1, 0, 0, 1, 1,
-0.3649309, 0.2314638, -1.160923, 1, 0, 0, 1, 1,
-0.3643681, 0.5220104, -0.5580968, 1, 0, 0, 1, 1,
-0.3609688, 0.6868047, 1.044002, 1, 0, 0, 1, 1,
-0.3589695, -1.338971, -3.208442, 0, 0, 0, 1, 1,
-0.3522485, 0.0701466, -1.500343, 0, 0, 0, 1, 1,
-0.3507971, 1.426867, -0.2545058, 0, 0, 0, 1, 1,
-0.3507666, 0.1984994, -1.37532, 0, 0, 0, 1, 1,
-0.3489526, -0.1165217, -0.6130795, 0, 0, 0, 1, 1,
-0.3453036, -0.3045577, -1.734877, 0, 0, 0, 1, 1,
-0.3392163, -0.7063756, -2.8581, 0, 0, 0, 1, 1,
-0.3292015, 0.7129162, 1.101472, 1, 1, 1, 1, 1,
-0.3228642, -1.464085, -2.602443, 1, 1, 1, 1, 1,
-0.3165228, -2.374069, -3.524637, 1, 1, 1, 1, 1,
-0.3147719, -1.113022, -3.419467, 1, 1, 1, 1, 1,
-0.3126051, -0.1656776, -2.896173, 1, 1, 1, 1, 1,
-0.311594, -0.2515651, -2.611396, 1, 1, 1, 1, 1,
-0.3113, 1.267986, -0.6685036, 1, 1, 1, 1, 1,
-0.3108347, 1.306894, -1.670582, 1, 1, 1, 1, 1,
-0.3089427, 0.5649875, -0.5340215, 1, 1, 1, 1, 1,
-0.308611, -0.357085, -0.8360006, 1, 1, 1, 1, 1,
-0.3071253, -3.018509, -1.958786, 1, 1, 1, 1, 1,
-0.3045487, 0.2394571, -0.4220866, 1, 1, 1, 1, 1,
-0.3033536, 0.1326389, 0.9143397, 1, 1, 1, 1, 1,
-0.3017685, -0.7729469, -3.864846, 1, 1, 1, 1, 1,
-0.3013853, -0.883068, -2.76627, 1, 1, 1, 1, 1,
-0.2953509, 0.2418768, -0.7521495, 0, 0, 1, 1, 1,
-0.2930928, 0.2315065, -2.332224, 1, 0, 0, 1, 1,
-0.2925333, -0.8700081, -3.163853, 1, 0, 0, 1, 1,
-0.2903117, -1.762975, -2.649768, 1, 0, 0, 1, 1,
-0.2881917, 1.415826, 0.1262016, 1, 0, 0, 1, 1,
-0.2849985, 3.430976, 0.491182, 1, 0, 0, 1, 1,
-0.2832132, 0.8843665, 0.5735418, 0, 0, 0, 1, 1,
-0.2773266, 1.390353, -1.340717, 0, 0, 0, 1, 1,
-0.273916, 0.0262039, -0.5420439, 0, 0, 0, 1, 1,
-0.2735642, -1.344146, -1.813999, 0, 0, 0, 1, 1,
-0.2724857, -0.355206, -3.678195, 0, 0, 0, 1, 1,
-0.2723043, -0.3994286, -2.954053, 0, 0, 0, 1, 1,
-0.2710088, -1.17566, -2.227297, 0, 0, 0, 1, 1,
-0.2709453, -0.02517712, -2.163917, 1, 1, 1, 1, 1,
-0.2674619, -0.7013503, -1.939661, 1, 1, 1, 1, 1,
-0.2638093, 1.485255, 0.3863852, 1, 1, 1, 1, 1,
-0.2637588, -1.85299, -3.921213, 1, 1, 1, 1, 1,
-0.2634622, -0.2584456, -2.909747, 1, 1, 1, 1, 1,
-0.2569638, -0.5784773, -2.651212, 1, 1, 1, 1, 1,
-0.2502906, -1.238142, -3.958365, 1, 1, 1, 1, 1,
-0.2492602, -1.778691, -1.992006, 1, 1, 1, 1, 1,
-0.2489706, -2.515561, -3.541914, 1, 1, 1, 1, 1,
-0.2473535, -1.512019, -3.765668, 1, 1, 1, 1, 1,
-0.2456611, -0.2091026, -1.941103, 1, 1, 1, 1, 1,
-0.2408235, -0.4048331, -1.341206, 1, 1, 1, 1, 1,
-0.2406763, -0.4749105, -2.744723, 1, 1, 1, 1, 1,
-0.2348569, -1.284574, -4.340839, 1, 1, 1, 1, 1,
-0.2346057, -1.562458, -4.29809, 1, 1, 1, 1, 1,
-0.2268573, -0.3874627, -2.691725, 0, 0, 1, 1, 1,
-0.2254188, 0.05346943, -3.363971, 1, 0, 0, 1, 1,
-0.2235661, 1.149672, 0.6453708, 1, 0, 0, 1, 1,
-0.2197617, 1.544273, -1.26654, 1, 0, 0, 1, 1,
-0.2165838, -0.4322422, -3.755364, 1, 0, 0, 1, 1,
-0.2138488, -0.2735555, -4.140925, 1, 0, 0, 1, 1,
-0.2117831, -0.8568901, -2.224515, 0, 0, 0, 1, 1,
-0.2101413, -2.328869, -1.10849, 0, 0, 0, 1, 1,
-0.2079647, -2.16615, -2.265585, 0, 0, 0, 1, 1,
-0.2067377, -2.10831, 0.4053957, 0, 0, 0, 1, 1,
-0.2065216, 2.622759, 0.1687071, 0, 0, 0, 1, 1,
-0.2048879, 0.1376856, -1.843408, 0, 0, 0, 1, 1,
-0.2009091, -1.267711, -2.401844, 0, 0, 0, 1, 1,
-0.1946872, -0.09269658, -1.920526, 1, 1, 1, 1, 1,
-0.1946681, 1.014305, -3.016766, 1, 1, 1, 1, 1,
-0.192789, -0.1087832, -1.910356, 1, 1, 1, 1, 1,
-0.1893462, 0.9146284, 0.443031, 1, 1, 1, 1, 1,
-0.1805984, -0.0289399, -1.601392, 1, 1, 1, 1, 1,
-0.1794691, 0.1167752, -3.2632, 1, 1, 1, 1, 1,
-0.1752896, -0.6050141, -3.491078, 1, 1, 1, 1, 1,
-0.1744172, 0.3207281, 0.3581322, 1, 1, 1, 1, 1,
-0.1722424, 0.07029945, -3.292241, 1, 1, 1, 1, 1,
-0.1692934, 0.5473624, 1.662172, 1, 1, 1, 1, 1,
-0.168994, 1.545603, -0.8499154, 1, 1, 1, 1, 1,
-0.1657408, -0.4209247, -2.797005, 1, 1, 1, 1, 1,
-0.1655758, -0.8240536, -1.375047, 1, 1, 1, 1, 1,
-0.1640388, 0.256541, 0.3679783, 1, 1, 1, 1, 1,
-0.1636324, 0.5401806, 0.3264484, 1, 1, 1, 1, 1,
-0.1589394, 1.135056, -0.2050006, 0, 0, 1, 1, 1,
-0.1584064, 0.2548337, -0.4174442, 1, 0, 0, 1, 1,
-0.1579742, 0.9154563, 1.213303, 1, 0, 0, 1, 1,
-0.1568902, 2.276506, -1.891884, 1, 0, 0, 1, 1,
-0.1532224, -0.4232463, -3.293867, 1, 0, 0, 1, 1,
-0.1449967, 0.3238162, -0.6648098, 1, 0, 0, 1, 1,
-0.142143, -0.2460909, -3.49845, 0, 0, 0, 1, 1,
-0.1417983, 0.7645901, -0.2226886, 0, 0, 0, 1, 1,
-0.1389403, 1.373159, 1.021745, 0, 0, 0, 1, 1,
-0.1364954, 2.084787, 0.6329431, 0, 0, 0, 1, 1,
-0.134493, -0.8689176, -3.674398, 0, 0, 0, 1, 1,
-0.1309409, -0.4167348, -3.946584, 0, 0, 0, 1, 1,
-0.1247201, -0.3630811, -1.832171, 0, 0, 0, 1, 1,
-0.1177032, -0.6736771, -2.536747, 1, 1, 1, 1, 1,
-0.1150855, 1.360124, -0.4639967, 1, 1, 1, 1, 1,
-0.1125641, -1.043571, -2.170475, 1, 1, 1, 1, 1,
-0.1092259, -0.1704234, -1.901206, 1, 1, 1, 1, 1,
-0.1073614, 0.3230831, -0.9210473, 1, 1, 1, 1, 1,
-0.106815, 1.610687, 0.6664975, 1, 1, 1, 1, 1,
-0.1065221, -1.087913, -3.105984, 1, 1, 1, 1, 1,
-0.1048707, 0.6206096, 0.08049417, 1, 1, 1, 1, 1,
-0.1021101, -0.7348561, -2.144373, 1, 1, 1, 1, 1,
-0.1014298, -1.27215, -3.875175, 1, 1, 1, 1, 1,
-0.09529478, 0.7952591, 0.2958418, 1, 1, 1, 1, 1,
-0.09381674, 1.013517, 1.249644, 1, 1, 1, 1, 1,
-0.09251967, -1.008592, -1.626122, 1, 1, 1, 1, 1,
-0.09203152, -0.8049485, -2.466069, 1, 1, 1, 1, 1,
-0.08714905, -1.025523, -2.853171, 1, 1, 1, 1, 1,
-0.08570327, -1.514627, -2.407808, 0, 0, 1, 1, 1,
-0.08030896, -1.761024, -1.542102, 1, 0, 0, 1, 1,
-0.07968276, 1.49279, -0.5627882, 1, 0, 0, 1, 1,
-0.07331217, 0.2551661, -2.178083, 1, 0, 0, 1, 1,
-0.06996138, 0.7707434, -0.1340214, 1, 0, 0, 1, 1,
-0.06492659, -1.080461, -4.703275, 1, 0, 0, 1, 1,
-0.06300977, 0.4139968, -1.333999, 0, 0, 0, 1, 1,
-0.06279595, 0.7460144, -1.251966, 0, 0, 0, 1, 1,
-0.06099967, -0.6906376, -3.375343, 0, 0, 0, 1, 1,
-0.04992149, -0.06283171, -1.931009, 0, 0, 0, 1, 1,
-0.04929875, 1.359186, -1.326592, 0, 0, 0, 1, 1,
-0.04745379, 0.3694009, 0.3478782, 0, 0, 0, 1, 1,
-0.04214298, 0.6117345, 2.401366, 0, 0, 0, 1, 1,
-0.03608526, 1.166345, 1.198836, 1, 1, 1, 1, 1,
-0.03436239, -1.887932, -3.868773, 1, 1, 1, 1, 1,
-0.03168455, -0.2481904, -3.691078, 1, 1, 1, 1, 1,
-0.03113835, 0.888656, 0.7527707, 1, 1, 1, 1, 1,
-0.03063814, 1.553626, -0.4774781, 1, 1, 1, 1, 1,
-0.02923729, -1.134777, -2.266438, 1, 1, 1, 1, 1,
-0.02332329, -1.236193, -0.5127891, 1, 1, 1, 1, 1,
-0.02109748, 2.167422, -1.053485, 1, 1, 1, 1, 1,
-0.01776457, -0.2341554, -1.479896, 1, 1, 1, 1, 1,
-0.01016373, 0.2934859, -1.703448, 1, 1, 1, 1, 1,
-0.008192301, -0.3146909, -2.586975, 1, 1, 1, 1, 1,
-0.003234099, -1.353883, -3.231996, 1, 1, 1, 1, 1,
0.0004042333, 1.224765, -0.5946008, 1, 1, 1, 1, 1,
0.001008003, 2.019737, 0.4799828, 1, 1, 1, 1, 1,
0.002775478, -1.133088, 3.852261, 1, 1, 1, 1, 1,
0.008451773, -0.3928986, 5.571472, 0, 0, 1, 1, 1,
0.01114778, -0.005430442, 0.4525507, 1, 0, 0, 1, 1,
0.01249028, -2.52564, 2.897633, 1, 0, 0, 1, 1,
0.01295989, 1.326713, -1.360709, 1, 0, 0, 1, 1,
0.01482968, -1.24632, 1.465387, 1, 0, 0, 1, 1,
0.01485142, -1.866606, 3.386857, 1, 0, 0, 1, 1,
0.02763201, 0.8294553, 0.5173332, 0, 0, 0, 1, 1,
0.02975098, 0.8433942, 0.0970924, 0, 0, 0, 1, 1,
0.03390254, 0.8131665, -0.2061336, 0, 0, 0, 1, 1,
0.0359645, 0.09884007, -1.088543, 0, 0, 0, 1, 1,
0.03624764, -0.7249603, 2.305941, 0, 0, 0, 1, 1,
0.03719931, 0.3173954, -1.006267, 0, 0, 0, 1, 1,
0.0373098, -1.065032, 2.491844, 0, 0, 0, 1, 1,
0.0393632, -0.3727202, 3.505292, 1, 1, 1, 1, 1,
0.03983375, 0.2243219, -1.199004, 1, 1, 1, 1, 1,
0.04240988, 1.848655, -0.6731066, 1, 1, 1, 1, 1,
0.04406124, -1.222861, 3.581698, 1, 1, 1, 1, 1,
0.04467322, 0.7379127, 0.7445163, 1, 1, 1, 1, 1,
0.04656846, -0.03563759, 1.934032, 1, 1, 1, 1, 1,
0.05314115, -0.5438946, 3.825148, 1, 1, 1, 1, 1,
0.05330266, 0.1576783, -2.036084, 1, 1, 1, 1, 1,
0.0563642, -0.5678196, 4.002445, 1, 1, 1, 1, 1,
0.05936379, 0.4396057, -1.485256, 1, 1, 1, 1, 1,
0.05948015, -0.3203163, 3.773938, 1, 1, 1, 1, 1,
0.06003445, -0.1504974, 2.725231, 1, 1, 1, 1, 1,
0.06028379, -0.6106782, 4.603229, 1, 1, 1, 1, 1,
0.06080208, -0.4972249, 1.226619, 1, 1, 1, 1, 1,
0.06236097, -0.303832, 3.397257, 1, 1, 1, 1, 1,
0.06239175, 0.3004372, -1.143637, 0, 0, 1, 1, 1,
0.06565082, 0.02862213, 0.4210065, 1, 0, 0, 1, 1,
0.06573603, 1.01356, -0.9873943, 1, 0, 0, 1, 1,
0.07154049, -0.2641148, 2.755359, 1, 0, 0, 1, 1,
0.07732263, -0.8028917, 2.388478, 1, 0, 0, 1, 1,
0.08353507, -2.334372, 1.389491, 1, 0, 0, 1, 1,
0.08709558, -0.1223869, 3.199741, 0, 0, 0, 1, 1,
0.08919555, -1.202996, 2.713465, 0, 0, 0, 1, 1,
0.08967818, -0.1914501, 1.395201, 0, 0, 0, 1, 1,
0.0915718, -1.110558, 4.512185, 0, 0, 0, 1, 1,
0.09796063, -0.2956936, 1.314847, 0, 0, 0, 1, 1,
0.09860859, 0.02089732, 2.191704, 0, 0, 0, 1, 1,
0.09943489, 1.233787, 0.3835518, 0, 0, 0, 1, 1,
0.103878, 0.5628928, -0.02417895, 1, 1, 1, 1, 1,
0.104698, -0.4592935, 3.74174, 1, 1, 1, 1, 1,
0.1047028, 1.296029, 0.04812597, 1, 1, 1, 1, 1,
0.1079848, -2.001637, 2.221983, 1, 1, 1, 1, 1,
0.1097757, 3.525113, -0.1585767, 1, 1, 1, 1, 1,
0.1132395, -0.5339534, 4.822582, 1, 1, 1, 1, 1,
0.116159, 0.2052537, 0.9318762, 1, 1, 1, 1, 1,
0.1163251, -1.288064, 1.934391, 1, 1, 1, 1, 1,
0.1173567, -0.8807619, 3.366721, 1, 1, 1, 1, 1,
0.11754, -0.2198321, 3.704453, 1, 1, 1, 1, 1,
0.1202125, -1.062942, 2.525764, 1, 1, 1, 1, 1,
0.1208919, 0.9524218, 0.08524031, 1, 1, 1, 1, 1,
0.1232042, 0.6059527, -0.3598979, 1, 1, 1, 1, 1,
0.1283823, -1.746855, 2.628993, 1, 1, 1, 1, 1,
0.1365981, 1.366814, 2.379625, 1, 1, 1, 1, 1,
0.1426842, 2.127843, 1.762702, 0, 0, 1, 1, 1,
0.1445827, -1.05688, 2.852524, 1, 0, 0, 1, 1,
0.1462551, 0.2032737, 2.245683, 1, 0, 0, 1, 1,
0.1482308, 0.09881154, 1.420574, 1, 0, 0, 1, 1,
0.1501993, 1.322102, -0.58234, 1, 0, 0, 1, 1,
0.1515988, -0.9309846, 2.336961, 1, 0, 0, 1, 1,
0.1518206, 0.7220243, 0.9401799, 0, 0, 0, 1, 1,
0.1585855, 0.9420623, -0.4065074, 0, 0, 0, 1, 1,
0.1592307, -2.369231, 2.780334, 0, 0, 0, 1, 1,
0.1628917, 0.3421089, 0.7608865, 0, 0, 0, 1, 1,
0.176752, -1.793775, 2.472424, 0, 0, 0, 1, 1,
0.1791421, -1.649801, 2.262859, 0, 0, 0, 1, 1,
0.1793917, 0.8955302, -0.1765093, 0, 0, 0, 1, 1,
0.1817145, -0.7916298, 4.297075, 1, 1, 1, 1, 1,
0.1830283, -0.430707, 1.635474, 1, 1, 1, 1, 1,
0.1945083, 0.1896985, 2.470282, 1, 1, 1, 1, 1,
0.196129, -0.06601281, 1.614963, 1, 1, 1, 1, 1,
0.1968358, -0.05502051, 0.5746916, 1, 1, 1, 1, 1,
0.1974276, -0.5179751, 1.50085, 1, 1, 1, 1, 1,
0.2027305, 0.5499793, 1.448837, 1, 1, 1, 1, 1,
0.2039021, 0.06952216, 0.2955753, 1, 1, 1, 1, 1,
0.2047904, 1.46798, 0.6309205, 1, 1, 1, 1, 1,
0.2078493, 0.810182, -1.904338, 1, 1, 1, 1, 1,
0.209148, -0.5782683, 3.198764, 1, 1, 1, 1, 1,
0.2164353, -0.5673109, 3.82684, 1, 1, 1, 1, 1,
0.2192484, 0.9893152, -0.6933706, 1, 1, 1, 1, 1,
0.2286405, -1.481491, 3.748274, 1, 1, 1, 1, 1,
0.2299653, -1.270249, 4.33726, 1, 1, 1, 1, 1,
0.2326511, 0.8708143, 1.405028, 0, 0, 1, 1, 1,
0.2339095, 0.6885403, 0.7526582, 1, 0, 0, 1, 1,
0.2358102, 0.1405897, -1.426537, 1, 0, 0, 1, 1,
0.2369893, 0.05259757, 2.813698, 1, 0, 0, 1, 1,
0.2373927, 0.3407988, 1.107975, 1, 0, 0, 1, 1,
0.2389143, -0.111033, 2.07661, 1, 0, 0, 1, 1,
0.239736, -1.014518, 3.974663, 0, 0, 0, 1, 1,
0.2439324, -0.5779107, 3.341533, 0, 0, 0, 1, 1,
0.2467438, -1.140786, 2.177282, 0, 0, 0, 1, 1,
0.2546357, -0.04651467, 2.212276, 0, 0, 0, 1, 1,
0.256948, 1.16534, -0.3522267, 0, 0, 0, 1, 1,
0.2580434, -0.02817058, 1.944542, 0, 0, 0, 1, 1,
0.2623635, 1.840095, -0.06728444, 0, 0, 0, 1, 1,
0.2690986, -0.4672033, 1.152634, 1, 1, 1, 1, 1,
0.2743075, -0.7629922, 2.645984, 1, 1, 1, 1, 1,
0.2748886, -0.3584137, 4.040026, 1, 1, 1, 1, 1,
0.2788515, -0.6701332, 2.437222, 1, 1, 1, 1, 1,
0.2790002, -0.7850166, 5.315515, 1, 1, 1, 1, 1,
0.2793268, -0.03803674, 1.001721, 1, 1, 1, 1, 1,
0.280013, 1.565415, 0.3631175, 1, 1, 1, 1, 1,
0.289114, 1.562037, -0.2950886, 1, 1, 1, 1, 1,
0.2902986, 0.3776903, 2.707234, 1, 1, 1, 1, 1,
0.2940638, 2.784932, -1.386416, 1, 1, 1, 1, 1,
0.2945553, 1.806854, 1.219269, 1, 1, 1, 1, 1,
0.3015197, -1.181651, 5.644094, 1, 1, 1, 1, 1,
0.3084321, -0.2125543, 1.234391, 1, 1, 1, 1, 1,
0.3085435, -0.6633046, 2.543712, 1, 1, 1, 1, 1,
0.3108145, 1.364084, 0.8084738, 1, 1, 1, 1, 1,
0.3111481, -0.3162, 2.803963, 0, 0, 1, 1, 1,
0.3129678, -0.643335, 2.407614, 1, 0, 0, 1, 1,
0.3146742, 0.7134561, -0.2083151, 1, 0, 0, 1, 1,
0.3201998, 1.278278, -1.009919, 1, 0, 0, 1, 1,
0.3218576, 1.09778, 0.5335059, 1, 0, 0, 1, 1,
0.3228832, -1.859305, 3.221394, 1, 0, 0, 1, 1,
0.3239952, -0.2518079, 4.515306, 0, 0, 0, 1, 1,
0.324688, -0.1233743, 2.239193, 0, 0, 0, 1, 1,
0.328078, -1.075198, 5.776026, 0, 0, 0, 1, 1,
0.3315727, 1.401377, -1.271394, 0, 0, 0, 1, 1,
0.3332498, -1.485923, 1.491123, 0, 0, 0, 1, 1,
0.3342641, -0.5538894, 1.888315, 0, 0, 0, 1, 1,
0.3355075, -0.5221123, 2.437395, 0, 0, 0, 1, 1,
0.3363704, 1.051286, 0.6206014, 1, 1, 1, 1, 1,
0.3396925, -0.09872746, 1.937628, 1, 1, 1, 1, 1,
0.3442062, -0.5852467, 2.842226, 1, 1, 1, 1, 1,
0.3508845, -0.5045866, 5.199627, 1, 1, 1, 1, 1,
0.3510945, -0.6422573, 3.388858, 1, 1, 1, 1, 1,
0.3539398, 0.8052043, -0.1724982, 1, 1, 1, 1, 1,
0.3567564, -1.922174, 1.471807, 1, 1, 1, 1, 1,
0.358126, -0.351665, 3.317227, 1, 1, 1, 1, 1,
0.3671984, 0.4429534, 1.507908, 1, 1, 1, 1, 1,
0.3674299, 0.2596385, -1.314573, 1, 1, 1, 1, 1,
0.3719642, 2.002446, 1.424253, 1, 1, 1, 1, 1,
0.3731077, -0.05022639, 1.043495, 1, 1, 1, 1, 1,
0.3756271, -0.0428578, 2.137509, 1, 1, 1, 1, 1,
0.3817737, 1.026966, -1.558078, 1, 1, 1, 1, 1,
0.3837116, 0.4689036, -0.5208014, 1, 1, 1, 1, 1,
0.3847795, 2.070026, 0.05433334, 0, 0, 1, 1, 1,
0.3867146, 1.118344, 1.409291, 1, 0, 0, 1, 1,
0.3868526, -1.194985, 2.348656, 1, 0, 0, 1, 1,
0.3891145, -0.3268047, 1.48854, 1, 0, 0, 1, 1,
0.389991, 0.5816916, -0.8999899, 1, 0, 0, 1, 1,
0.3974784, -0.01533145, 1.90919, 1, 0, 0, 1, 1,
0.3975803, -0.6497768, 3.115407, 0, 0, 0, 1, 1,
0.3997849, 1.268878, -0.8601969, 0, 0, 0, 1, 1,
0.4049988, 1.277859, 1.707991, 0, 0, 0, 1, 1,
0.4057543, -0.9067429, 2.237981, 0, 0, 0, 1, 1,
0.4060021, -1.160609, 1.740986, 0, 0, 0, 1, 1,
0.4140806, -0.1555339, 2.283246, 0, 0, 0, 1, 1,
0.414439, 0.8764818, -0.2729812, 0, 0, 0, 1, 1,
0.4154717, -0.4662634, 3.845172, 1, 1, 1, 1, 1,
0.4210232, -0.2758124, 0.8540442, 1, 1, 1, 1, 1,
0.4259529, 1.412111, 1.862643, 1, 1, 1, 1, 1,
0.437094, -1.602028, 2.989431, 1, 1, 1, 1, 1,
0.4385776, 1.650003, -1.498601, 1, 1, 1, 1, 1,
0.4405213, 0.6187843, 1.459822, 1, 1, 1, 1, 1,
0.4448867, -0.7075306, 1.42001, 1, 1, 1, 1, 1,
0.4467893, 0.211121, -0.03866576, 1, 1, 1, 1, 1,
0.4511434, -0.831136, 1.719718, 1, 1, 1, 1, 1,
0.4523969, 0.8438529, 0.1265128, 1, 1, 1, 1, 1,
0.4526869, -0.3101048, 0.7236408, 1, 1, 1, 1, 1,
0.4560149, 0.6691415, -0.4094911, 1, 1, 1, 1, 1,
0.4587872, 0.6385279, 0.899856, 1, 1, 1, 1, 1,
0.460181, -1.571754, 4.147845, 1, 1, 1, 1, 1,
0.461725, 1.449087, 1.438743, 1, 1, 1, 1, 1,
0.4625973, 0.4698631, 4.29001, 0, 0, 1, 1, 1,
0.4628815, -0.4678535, 2.66671, 1, 0, 0, 1, 1,
0.4724078, 0.6116121, -0.3534141, 1, 0, 0, 1, 1,
0.4786689, 1.405251, 0.8013254, 1, 0, 0, 1, 1,
0.4804455, 0.5057505, 1.373666, 1, 0, 0, 1, 1,
0.4823556, -0.8417888, 1.408767, 1, 0, 0, 1, 1,
0.4829492, -0.2028155, 1.397421, 0, 0, 0, 1, 1,
0.4843152, -0.3247508, 2.91967, 0, 0, 0, 1, 1,
0.4868983, 1.028117, 1.425681, 0, 0, 0, 1, 1,
0.4871782, -0.6706216, 2.26295, 0, 0, 0, 1, 1,
0.4894022, 1.805241, -0.7196679, 0, 0, 0, 1, 1,
0.4901976, -0.3157417, 1.753885, 0, 0, 0, 1, 1,
0.4911353, 0.5155833, 1.334745, 0, 0, 0, 1, 1,
0.4991271, -0.451672, 5.224021, 1, 1, 1, 1, 1,
0.502234, 1.295804, -0.03027096, 1, 1, 1, 1, 1,
0.5064053, -0.1259958, 1.738439, 1, 1, 1, 1, 1,
0.5087701, 0.05681995, 0.6652011, 1, 1, 1, 1, 1,
0.5088203, 1.20635, 0.2099299, 1, 1, 1, 1, 1,
0.5104614, -0.651982, 1.810565, 1, 1, 1, 1, 1,
0.5148366, 0.1283128, 1.373527, 1, 1, 1, 1, 1,
0.5157897, 0.4008214, 1.481729, 1, 1, 1, 1, 1,
0.5184335, -0.09828739, 3.28746, 1, 1, 1, 1, 1,
0.5194337, -0.5720648, 3.72532, 1, 1, 1, 1, 1,
0.5231598, 0.004704366, 0.1384982, 1, 1, 1, 1, 1,
0.5235213, -0.9970971, 2.258985, 1, 1, 1, 1, 1,
0.5239002, 1.927802, 0.3419981, 1, 1, 1, 1, 1,
0.5261645, -0.6069198, 2.024491, 1, 1, 1, 1, 1,
0.5335144, 0.4884724, -1.110379, 1, 1, 1, 1, 1,
0.5361894, -1.000555, 0.9046929, 0, 0, 1, 1, 1,
0.5396741, 0.6246639, -0.4510432, 1, 0, 0, 1, 1,
0.5404581, -0.8964589, 5.029099, 1, 0, 0, 1, 1,
0.5424407, 0.05938429, 1.490223, 1, 0, 0, 1, 1,
0.542743, 1.338386, 1.540883, 1, 0, 0, 1, 1,
0.5461463, 0.4028946, 0.7495288, 1, 0, 0, 1, 1,
0.547049, -0.7620797, 2.260488, 0, 0, 0, 1, 1,
0.5499016, -1.578267, 1.933983, 0, 0, 0, 1, 1,
0.5547985, -1.702313, 1.724012, 0, 0, 0, 1, 1,
0.557443, 0.8775885, 0.7053538, 0, 0, 0, 1, 1,
0.5583445, 1.243142, 0.795459, 0, 0, 0, 1, 1,
0.5605195, -0.7636678, 0.3530772, 0, 0, 0, 1, 1,
0.5626718, -0.8743863, 2.186565, 0, 0, 0, 1, 1,
0.5664833, -0.3181985, 2.545224, 1, 1, 1, 1, 1,
0.5690436, 0.0405522, 3.002788, 1, 1, 1, 1, 1,
0.5747923, -0.2999369, 2.377374, 1, 1, 1, 1, 1,
0.5806459, -0.8747772, 2.091012, 1, 1, 1, 1, 1,
0.5913404, 0.4618282, -0.6928437, 1, 1, 1, 1, 1,
0.5923129, 0.7912914, 1.692751, 1, 1, 1, 1, 1,
0.6020197, -0.2522427, 1.898537, 1, 1, 1, 1, 1,
0.6036815, 0.2859703, -0.3629766, 1, 1, 1, 1, 1,
0.6043146, -0.7529693, 1.985158, 1, 1, 1, 1, 1,
0.6056628, 1.583032, 1.137197, 1, 1, 1, 1, 1,
0.6085003, -0.3828251, 2.353788, 1, 1, 1, 1, 1,
0.6141151, 0.7443856, -0.1491325, 1, 1, 1, 1, 1,
0.6174051, -0.8740767, 2.811541, 1, 1, 1, 1, 1,
0.6282573, 1.100275, 0.3604957, 1, 1, 1, 1, 1,
0.6295636, -0.2300471, 2.548501, 1, 1, 1, 1, 1,
0.6431556, -0.4066, 3.161095, 0, 0, 1, 1, 1,
0.6504831, 0.2379272, 1.904573, 1, 0, 0, 1, 1,
0.650986, -0.6861658, 3.613404, 1, 0, 0, 1, 1,
0.6516187, -0.4761779, 1.066795, 1, 0, 0, 1, 1,
0.6528774, 0.3532016, 0.7425229, 1, 0, 0, 1, 1,
0.6554807, -0.01082196, 0.7592564, 1, 0, 0, 1, 1,
0.6558526, 0.1057296, 0.5973626, 0, 0, 0, 1, 1,
0.6586556, 1.705975, 0.5908896, 0, 0, 0, 1, 1,
0.6590952, -1.425748, 2.469894, 0, 0, 0, 1, 1,
0.6608875, -1.481222, 2.680788, 0, 0, 0, 1, 1,
0.663011, -3.223757, 1.120859, 0, 0, 0, 1, 1,
0.6645098, -0.6384662, 2.637851, 0, 0, 0, 1, 1,
0.6677191, 0.7154742, 1.778024, 0, 0, 0, 1, 1,
0.6683072, -0.5329303, 2.103495, 1, 1, 1, 1, 1,
0.6691315, -0.9762096, 4.318718, 1, 1, 1, 1, 1,
0.6715007, 0.6344791, 1.146726, 1, 1, 1, 1, 1,
0.6741246, 0.1374042, 4.074121, 1, 1, 1, 1, 1,
0.6764185, 0.4419831, 0.9839544, 1, 1, 1, 1, 1,
0.6769925, 1.688212, 0.4298143, 1, 1, 1, 1, 1,
0.6770673, -0.217511, 0.6396132, 1, 1, 1, 1, 1,
0.6811139, 0.5135587, 0.8456035, 1, 1, 1, 1, 1,
0.6832275, 0.5365919, 0.6456836, 1, 1, 1, 1, 1,
0.6862438, -0.306701, 1.484195, 1, 1, 1, 1, 1,
0.6897728, 0.8075857, -0.5913699, 1, 1, 1, 1, 1,
0.6898581, 0.437229, -1.034331, 1, 1, 1, 1, 1,
0.6948215, 0.4085361, 1.344498, 1, 1, 1, 1, 1,
0.6954688, 0.1154573, 0.7134867, 1, 1, 1, 1, 1,
0.701328, 2.000562, -2.594586, 1, 1, 1, 1, 1,
0.7076472, -0.6257389, 3.913218, 0, 0, 1, 1, 1,
0.7177173, -0.41989, 2.353692, 1, 0, 0, 1, 1,
0.7178555, -1.387945, 3.917569, 1, 0, 0, 1, 1,
0.7183088, 0.6302569, 0.5842347, 1, 0, 0, 1, 1,
0.7206011, -0.4280731, 1.005236, 1, 0, 0, 1, 1,
0.7221288, -1.229163, 1.341755, 1, 0, 0, 1, 1,
0.7250681, 1.073181, 0.9892848, 0, 0, 0, 1, 1,
0.7285379, 2.333122, 1.002532, 0, 0, 0, 1, 1,
0.7292764, -0.05865194, 1.206111, 0, 0, 0, 1, 1,
0.7320079, 0.1586739, 1.035627, 0, 0, 0, 1, 1,
0.7354246, -0.077025, 0.5625038, 0, 0, 0, 1, 1,
0.7428383, -1.129506, 3.638315, 0, 0, 0, 1, 1,
0.7440771, 0.5175316, 1.44693, 0, 0, 0, 1, 1,
0.7461928, 1.590762, 2.193163, 1, 1, 1, 1, 1,
0.7462915, -0.03968544, 1.273269, 1, 1, 1, 1, 1,
0.7504843, 0.7038257, 0.03969667, 1, 1, 1, 1, 1,
0.7536188, 1.300845, 1.143008, 1, 1, 1, 1, 1,
0.7559891, -1.577933, 3.296633, 1, 1, 1, 1, 1,
0.7594859, 1.312835, -0.2049771, 1, 1, 1, 1, 1,
0.7615443, -1.123203, 1.381072, 1, 1, 1, 1, 1,
0.7625477, 0.3155441, 1.568658, 1, 1, 1, 1, 1,
0.7667074, -2.378132, 3.051435, 1, 1, 1, 1, 1,
0.7707676, -0.02588627, 3.747511, 1, 1, 1, 1, 1,
0.7707896, -0.08253019, 5.049839, 1, 1, 1, 1, 1,
0.7844717, -0.9077832, 1.57374, 1, 1, 1, 1, 1,
0.7872431, 1.066514, 0.8573655, 1, 1, 1, 1, 1,
0.7964867, 0.3778053, 1.156357, 1, 1, 1, 1, 1,
0.7969614, -0.2720138, 1.341288, 1, 1, 1, 1, 1,
0.7972574, 1.268832, -0.153235, 0, 0, 1, 1, 1,
0.8066204, -2.103501, 2.087566, 1, 0, 0, 1, 1,
0.8082281, 1.177699, 2.138092, 1, 0, 0, 1, 1,
0.8102419, 0.3428699, 0.3954422, 1, 0, 0, 1, 1,
0.8166548, -0.5189387, 0.7325516, 1, 0, 0, 1, 1,
0.8186576, -0.4834169, 1.942451, 1, 0, 0, 1, 1,
0.8209772, -0.6622064, 3.553214, 0, 0, 0, 1, 1,
0.8227215, -0.3830533, 4.08705, 0, 0, 0, 1, 1,
0.8284246, -1.345328, 1.752493, 0, 0, 0, 1, 1,
0.832943, 0.4096712, 1.504917, 0, 0, 0, 1, 1,
0.834423, 0.3628404, 2.146197, 0, 0, 0, 1, 1,
0.8358696, -0.5129185, 3.272015, 0, 0, 0, 1, 1,
0.8385455, -1.547731, 2.081354, 0, 0, 0, 1, 1,
0.8388674, -2.959672, 2.335513, 1, 1, 1, 1, 1,
0.8500879, 0.6993389, 1.104284, 1, 1, 1, 1, 1,
0.8530409, 0.1548841, 0.04996808, 1, 1, 1, 1, 1,
0.8593785, 1.152778, 1.355821, 1, 1, 1, 1, 1,
0.865712, 0.8154128, -0.4825314, 1, 1, 1, 1, 1,
0.8671908, -1.313577, 3.03966, 1, 1, 1, 1, 1,
0.8698381, 0.4063471, 0.2964643, 1, 1, 1, 1, 1,
0.8751549, 0.2069859, 1.80015, 1, 1, 1, 1, 1,
0.8783672, -0.7298081, 1.90963, 1, 1, 1, 1, 1,
0.8813623, 0.0252323, 2.072774, 1, 1, 1, 1, 1,
0.8843199, -1.05011, 1.665969, 1, 1, 1, 1, 1,
0.8843749, 1.32967, -0.5460508, 1, 1, 1, 1, 1,
0.8867739, 0.01933189, 3.631133, 1, 1, 1, 1, 1,
0.8905882, 0.1118253, 0.8692302, 1, 1, 1, 1, 1,
0.8947806, -1.146325, 3.973245, 1, 1, 1, 1, 1,
0.8966334, -1.09064, 2.761256, 0, 0, 1, 1, 1,
0.9015975, -1.126389, 3.048042, 1, 0, 0, 1, 1,
0.901848, 0.8781238, -0.3674637, 1, 0, 0, 1, 1,
0.9021925, 0.07139118, 0.1068687, 1, 0, 0, 1, 1,
0.9044781, 0.4817164, 1.386766, 1, 0, 0, 1, 1,
0.904505, -0.1613201, 2.447755, 1, 0, 0, 1, 1,
0.9073144, -0.5330783, 1.231965, 0, 0, 0, 1, 1,
0.910332, -2.457158, 2.826516, 0, 0, 0, 1, 1,
0.9122056, 1.68794, 0.1337771, 0, 0, 0, 1, 1,
0.9153824, -0.5461364, 2.914576, 0, 0, 0, 1, 1,
0.9181248, -1.693876, 2.029145, 0, 0, 0, 1, 1,
0.9213058, -0.3800454, 2.8327, 0, 0, 0, 1, 1,
0.9246058, 2.786454, -0.01637919, 0, 0, 0, 1, 1,
0.936267, 0.3696467, 0.1145737, 1, 1, 1, 1, 1,
0.9537924, -0.04223225, 2.721408, 1, 1, 1, 1, 1,
0.9563565, -1.627045, 3.351825, 1, 1, 1, 1, 1,
0.9610497, 1.826846, 0.2211665, 1, 1, 1, 1, 1,
0.9706305, -0.4149331, 1.8097, 1, 1, 1, 1, 1,
0.9726562, 0.3015477, 0.3350337, 1, 1, 1, 1, 1,
0.9813482, -0.3559411, 1.760596, 1, 1, 1, 1, 1,
0.9851837, -0.1927357, 1.475649, 1, 1, 1, 1, 1,
0.988851, 1.851859, 1.037019, 1, 1, 1, 1, 1,
0.9986909, 0.2309922, 1.563693, 1, 1, 1, 1, 1,
1.001478, -1.309805, 2.131856, 1, 1, 1, 1, 1,
1.002403, -1.13315, 3.553133, 1, 1, 1, 1, 1,
1.006643, 1.849087, -0.2187946, 1, 1, 1, 1, 1,
1.008096, 0.5650282, 1.006508, 1, 1, 1, 1, 1,
1.008409, 0.05708059, 1.98398, 1, 1, 1, 1, 1,
1.010505, -0.9226642, 2.104066, 0, 0, 1, 1, 1,
1.017375, 1.985759, 0.1526477, 1, 0, 0, 1, 1,
1.017494, -0.1345315, 2.414562, 1, 0, 0, 1, 1,
1.030173, -1.112844, 3.421698, 1, 0, 0, 1, 1,
1.039443, -1.684377, 3.268481, 1, 0, 0, 1, 1,
1.039474, 1.655914, 1.020628, 1, 0, 0, 1, 1,
1.044237, -0.8695141, 2.176158, 0, 0, 0, 1, 1,
1.047771, 0.6662995, 0.7839485, 0, 0, 0, 1, 1,
1.048911, -0.148233, 3.374766, 0, 0, 0, 1, 1,
1.048956, -0.3410778, 0.3138905, 0, 0, 0, 1, 1,
1.052562, 0.3472189, 0.4645001, 0, 0, 0, 1, 1,
1.062903, 0.3289996, 2.162985, 0, 0, 0, 1, 1,
1.069794, 1.587466, 0.4816222, 0, 0, 0, 1, 1,
1.07004, -1.613119, 1.846965, 1, 1, 1, 1, 1,
1.078378, 0.4899827, -1.103694, 1, 1, 1, 1, 1,
1.091145, 1.338557, 1.03927, 1, 1, 1, 1, 1,
1.093749, 0.2269891, 1.109302, 1, 1, 1, 1, 1,
1.107608, -0.1825687, 1.670544, 1, 1, 1, 1, 1,
1.108072, -0.7133774, 2.311172, 1, 1, 1, 1, 1,
1.121452, -0.6515478, 1.801381, 1, 1, 1, 1, 1,
1.133625, 0.5087927, 3.008911, 1, 1, 1, 1, 1,
1.134219, -1.531879, 1.77696, 1, 1, 1, 1, 1,
1.138542, 1.460565, 0.1523644, 1, 1, 1, 1, 1,
1.145654, -0.01361734, 1.795385, 1, 1, 1, 1, 1,
1.147143, 0.5174843, 1.076803, 1, 1, 1, 1, 1,
1.160285, 1.1021, 1.664978, 1, 1, 1, 1, 1,
1.175126, 0.9361436, 1.378296, 1, 1, 1, 1, 1,
1.176337, 1.072363, 0.3144608, 1, 1, 1, 1, 1,
1.178762, 0.8091444, 1.984361, 0, 0, 1, 1, 1,
1.180752, 0.2356555, 0.9737924, 1, 0, 0, 1, 1,
1.185465, -1.274863, 3.397344, 1, 0, 0, 1, 1,
1.199065, 2.299401, 1.532366, 1, 0, 0, 1, 1,
1.201818, 0.6559939, -0.08360844, 1, 0, 0, 1, 1,
1.207954, 0.6030351, 0.2353628, 1, 0, 0, 1, 1,
1.213481, 0.3997298, 0.9780654, 0, 0, 0, 1, 1,
1.214754, 0.165018, -0.147833, 0, 0, 0, 1, 1,
1.214867, 0.5136433, 1.808777, 0, 0, 0, 1, 1,
1.23911, 0.4374551, 0.5883642, 0, 0, 0, 1, 1,
1.239665, 0.5591153, -1.069213, 0, 0, 0, 1, 1,
1.252865, 0.1856686, 3.070006, 0, 0, 0, 1, 1,
1.256799, 0.9281054, 0.1263374, 0, 0, 0, 1, 1,
1.259036, -0.3086902, 0.8476523, 1, 1, 1, 1, 1,
1.260879, -0.02991768, 2.00248, 1, 1, 1, 1, 1,
1.267898, -0.8744788, 1.636128, 1, 1, 1, 1, 1,
1.272463, -0.3994557, -0.3889495, 1, 1, 1, 1, 1,
1.274123, 1.423488, 0.240337, 1, 1, 1, 1, 1,
1.281145, -0.427104, 3.134602, 1, 1, 1, 1, 1,
1.283833, 0.4819535, -0.02877485, 1, 1, 1, 1, 1,
1.299469, -0.0929584, 1.472021, 1, 1, 1, 1, 1,
1.304625, 0.008164275, 2.235526, 1, 1, 1, 1, 1,
1.306617, 0.7504408, 3.631158, 1, 1, 1, 1, 1,
1.307484, -0.231976, 2.607116, 1, 1, 1, 1, 1,
1.318993, -0.4294197, 1.282281, 1, 1, 1, 1, 1,
1.320513, -1.150019, 0.9282946, 1, 1, 1, 1, 1,
1.32697, 0.2080738, 0.8861275, 1, 1, 1, 1, 1,
1.3271, 0.6662211, 2.036467, 1, 1, 1, 1, 1,
1.328634, 0.582242, 1.595175, 0, 0, 1, 1, 1,
1.340538, 0.8246603, 2.080714, 1, 0, 0, 1, 1,
1.34084, 1.714306, 0.4436375, 1, 0, 0, 1, 1,
1.340852, 0.09277441, 2.117953, 1, 0, 0, 1, 1,
1.343833, 0.07343313, 0.8712209, 1, 0, 0, 1, 1,
1.347077, -0.1231501, 1.952788, 1, 0, 0, 1, 1,
1.34908, -0.2017962, 1.807693, 0, 0, 0, 1, 1,
1.35975, 0.73627, 1.25643, 0, 0, 0, 1, 1,
1.360169, -1.474085, 2.342576, 0, 0, 0, 1, 1,
1.368619, -0.6678267, 1.738686, 0, 0, 0, 1, 1,
1.372967, 0.9886619, 1.096033, 0, 0, 0, 1, 1,
1.374074, -0.3154455, 2.60784, 0, 0, 0, 1, 1,
1.375738, 1.53082, 0.8783276, 0, 0, 0, 1, 1,
1.379397, 0.8565304, 0.4224274, 1, 1, 1, 1, 1,
1.386018, 0.7046403, 0.5955989, 1, 1, 1, 1, 1,
1.394265, 0.0991803, 2.771694, 1, 1, 1, 1, 1,
1.409127, 1.439491, 0.4544096, 1, 1, 1, 1, 1,
1.41543, 1.685395, 2.669166, 1, 1, 1, 1, 1,
1.419067, -0.9590335, 2.78874, 1, 1, 1, 1, 1,
1.439101, -0.3443031, 1.514996, 1, 1, 1, 1, 1,
1.44026, -0.2598582, 1.251094, 1, 1, 1, 1, 1,
1.448939, -1.261421, 2.426421, 1, 1, 1, 1, 1,
1.453179, -1.330937, 2.055051, 1, 1, 1, 1, 1,
1.454095, -0.07282458, 2.827204, 1, 1, 1, 1, 1,
1.462425, 1.57934, -1.061383, 1, 1, 1, 1, 1,
1.463961, -0.1098782, 2.386857, 1, 1, 1, 1, 1,
1.469214, 1.314812, 1.355798, 1, 1, 1, 1, 1,
1.474258, 0.8228236, -0.7100548, 1, 1, 1, 1, 1,
1.487258, -2.761809, 1.224176, 0, 0, 1, 1, 1,
1.524955, -0.7794417, 2.893845, 1, 0, 0, 1, 1,
1.540188, -0.7090985, 2.009264, 1, 0, 0, 1, 1,
1.552588, 0.6359692, -0.1881881, 1, 0, 0, 1, 1,
1.55259, 2.031181, 1.457287, 1, 0, 0, 1, 1,
1.553732, -0.03277984, 1.784341, 1, 0, 0, 1, 1,
1.558458, 0.0443849, 2.050867, 0, 0, 0, 1, 1,
1.58405, 1.5458, -0.03705516, 0, 0, 0, 1, 1,
1.593136, -1.768751, 3.496587, 0, 0, 0, 1, 1,
1.596289, 0.09091018, 1.720973, 0, 0, 0, 1, 1,
1.6015, -0.1300179, 2.790681, 0, 0, 0, 1, 1,
1.602042, 0.8942208, 1.629169, 0, 0, 0, 1, 1,
1.616262, 0.3883978, 2.124264, 0, 0, 0, 1, 1,
1.617037, -0.2971335, 2.963965, 1, 1, 1, 1, 1,
1.624238, 1.038228, 1.15706, 1, 1, 1, 1, 1,
1.638978, -1.181059, 2.22741, 1, 1, 1, 1, 1,
1.65366, 0.2770602, 0.5215856, 1, 1, 1, 1, 1,
1.655655, -1.159473, 1.813969, 1, 1, 1, 1, 1,
1.669476, 1.110211, 0.8172294, 1, 1, 1, 1, 1,
1.678273, 0.7473665, 2.350401, 1, 1, 1, 1, 1,
1.704426, 1.016639, 0.5347412, 1, 1, 1, 1, 1,
1.70654, -0.5307328, 2.56991, 1, 1, 1, 1, 1,
1.711012, 0.7224805, 0.1935164, 1, 1, 1, 1, 1,
1.711234, 0.2768374, 1.294964, 1, 1, 1, 1, 1,
1.717843, -0.559241, 2.126067, 1, 1, 1, 1, 1,
1.722535, 2.274152, 2.009899, 1, 1, 1, 1, 1,
1.7236, 0.7632778, 0.9488255, 1, 1, 1, 1, 1,
1.731914, 1.147948, 0.04302128, 1, 1, 1, 1, 1,
1.736144, 0.8548664, 1.375647, 0, 0, 1, 1, 1,
1.740122, -1.799872, 2.706842, 1, 0, 0, 1, 1,
1.745442, 0.4235072, 0.2751904, 1, 0, 0, 1, 1,
1.749805, -0.8639039, 3.259523, 1, 0, 0, 1, 1,
1.756013, 0.1949601, 1.52472, 1, 0, 0, 1, 1,
1.764339, -0.1349416, 2.846442, 1, 0, 0, 1, 1,
1.781427, 0.1955391, 2.128261, 0, 0, 0, 1, 1,
1.784337, 0.08154381, -0.2772579, 0, 0, 0, 1, 1,
1.784771, -0.249986, 0.5335001, 0, 0, 0, 1, 1,
1.81236, -1.446827, 1.232743, 0, 0, 0, 1, 1,
1.818678, -0.4708383, 2.078383, 0, 0, 0, 1, 1,
1.826209, -0.834909, 1.159378, 0, 0, 0, 1, 1,
1.856824, -0.4371001, 3.518139, 0, 0, 0, 1, 1,
1.859201, 0.4789234, -0.06886657, 1, 1, 1, 1, 1,
1.870216, -0.4951681, 2.196873, 1, 1, 1, 1, 1,
1.883094, 0.8342801, 1.526622, 1, 1, 1, 1, 1,
1.901318, -0.7809183, 2.38786, 1, 1, 1, 1, 1,
1.963048, -0.5469005, 1.060227, 1, 1, 1, 1, 1,
1.968108, 0.1327009, -0.3575802, 1, 1, 1, 1, 1,
1.996081, 0.8401772, -0.1826954, 1, 1, 1, 1, 1,
2.01153, -0.0164244, -0.5074236, 1, 1, 1, 1, 1,
2.0348, -2.299434, 3.811208, 1, 1, 1, 1, 1,
2.054706, 1.638774, 0.8594278, 1, 1, 1, 1, 1,
2.073007, -1.356733, 3.989121, 1, 1, 1, 1, 1,
2.094498, 0.8880104, 1.935834, 1, 1, 1, 1, 1,
2.114512, -0.9426777, 2.229565, 1, 1, 1, 1, 1,
2.117097, -1.386195, 3.653189, 1, 1, 1, 1, 1,
2.138613, 0.08992149, 1.769828, 1, 1, 1, 1, 1,
2.14607, -1.701545, 2.303515, 0, 0, 1, 1, 1,
2.164226, -0.9786969, 1.998371, 1, 0, 0, 1, 1,
2.231064, 0.5181846, 2.474181, 1, 0, 0, 1, 1,
2.264931, 0.1078404, 1.541659, 1, 0, 0, 1, 1,
2.299083, -1.267088, 1.508671, 1, 0, 0, 1, 1,
2.339118, -0.6732436, 2.081886, 1, 0, 0, 1, 1,
2.344565, 0.4386042, 1.677596, 0, 0, 0, 1, 1,
2.361223, -0.8623933, 2.523127, 0, 0, 0, 1, 1,
2.508606, 0.2799728, 1.312205, 0, 0, 0, 1, 1,
2.552257, -0.3934134, 0.9643731, 0, 0, 0, 1, 1,
2.566506, 0.7040382, 3.472252, 0, 0, 0, 1, 1,
2.601556, -0.4974759, 1.160795, 0, 0, 0, 1, 1,
2.637152, 1.629759, 0.3186414, 0, 0, 0, 1, 1,
2.645416, -0.2131481, 1.632758, 1, 1, 1, 1, 1,
2.656273, -0.2968687, 0.6798803, 1, 1, 1, 1, 1,
2.71627, 1.115055, 0.2434811, 1, 1, 1, 1, 1,
2.890031, 1.219206, 0.7750307, 1, 1, 1, 1, 1,
2.980537, 1.122788, 1.97947, 1, 1, 1, 1, 1,
3.234253, -0.1387059, -0.657008, 1, 1, 1, 1, 1,
3.908962, -0.6001927, 3.701139, 1, 1, 1, 1, 1
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
var radius = 10.01294;
var distance = 35.17002;
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
mvMatrix.translate( -0.4169817, -0.1506782, -0.1771567 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.17002);
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
