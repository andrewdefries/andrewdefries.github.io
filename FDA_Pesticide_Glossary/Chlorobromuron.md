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
-3.66981, -1.376292, -3.134487, 1, 0, 0, 1,
-3.262919, 1.259666, -1.693018, 1, 0.007843138, 0, 1,
-3.086682, 1.922945, -0.5748156, 1, 0.01176471, 0, 1,
-2.938828, 1.645865, -3.175118, 1, 0.01960784, 0, 1,
-2.734811, -1.156938, -0.7922236, 1, 0.02352941, 0, 1,
-2.733613, -0.6954123, -2.496859, 1, 0.03137255, 0, 1,
-2.696772, 0.9425728, -1.108658, 1, 0.03529412, 0, 1,
-2.63062, -0.8027361, -2.589146, 1, 0.04313726, 0, 1,
-2.573578, 0.08619023, -1.410329, 1, 0.04705882, 0, 1,
-2.529916, 0.8831657, -2.966129, 1, 0.05490196, 0, 1,
-2.521501, 1.178, -1.153478, 1, 0.05882353, 0, 1,
-2.491425, 0.1849161, 0.1505234, 1, 0.06666667, 0, 1,
-2.376339, -0.6051621, -2.308309, 1, 0.07058824, 0, 1,
-2.37121, 0.0758692, -1.793255, 1, 0.07843138, 0, 1,
-2.357597, -0.8753268, -2.130806, 1, 0.08235294, 0, 1,
-2.283998, -0.2724599, -0.7431985, 1, 0.09019608, 0, 1,
-2.243019, 1.004972, -0.7280589, 1, 0.09411765, 0, 1,
-2.230738, 1.032421, -1.126171, 1, 0.1019608, 0, 1,
-2.20975, 1.895515, -0.6239255, 1, 0.1098039, 0, 1,
-2.192353, 1.533081, 0.465591, 1, 0.1137255, 0, 1,
-2.154581, -0.7925146, -1.115207, 1, 0.1215686, 0, 1,
-2.153711, -0.3458911, -2.057273, 1, 0.1254902, 0, 1,
-2.145123, 1.107624, -2.8397, 1, 0.1333333, 0, 1,
-2.145103, -0.703381, -1.721542, 1, 0.1372549, 0, 1,
-2.125184, 0.3824134, -1.442112, 1, 0.145098, 0, 1,
-2.097904, -0.4049381, -2.496634, 1, 0.1490196, 0, 1,
-2.097031, 0.5074198, -1.289325, 1, 0.1568628, 0, 1,
-2.06423, -0.09853608, 0.08577611, 1, 0.1607843, 0, 1,
-2.060612, 1.136024, -3.220717, 1, 0.1686275, 0, 1,
-2.012597, -0.1471841, -1.194649, 1, 0.172549, 0, 1,
-1.965691, -1.968014, -0.1923331, 1, 0.1803922, 0, 1,
-1.94108, 0.3995489, -3.733104, 1, 0.1843137, 0, 1,
-1.940404, 0.4725409, -0.9484715, 1, 0.1921569, 0, 1,
-1.922485, 0.6112624, -1.422365, 1, 0.1960784, 0, 1,
-1.911225, -2.455586, -0.8662525, 1, 0.2039216, 0, 1,
-1.889124, -0.2610579, -0.2795898, 1, 0.2117647, 0, 1,
-1.875225, -0.5597988, -2.358685, 1, 0.2156863, 0, 1,
-1.830368, 1.558218, -0.4312097, 1, 0.2235294, 0, 1,
-1.80969, -0.8958225, -0.9485897, 1, 0.227451, 0, 1,
-1.804842, 1.175595, -0.1519658, 1, 0.2352941, 0, 1,
-1.803295, -2.07492, -1.627724, 1, 0.2392157, 0, 1,
-1.767156, 0.8604608, -0.5572723, 1, 0.2470588, 0, 1,
-1.765731, 0.9393142, -1.63056, 1, 0.2509804, 0, 1,
-1.758343, 0.6004314, -0.2337056, 1, 0.2588235, 0, 1,
-1.754757, 0.6703882, -1.756336, 1, 0.2627451, 0, 1,
-1.745183, -1.168652, -1.010818, 1, 0.2705882, 0, 1,
-1.717301, 1.075267, -2.36932, 1, 0.2745098, 0, 1,
-1.71705, -1.69313, -2.13219, 1, 0.282353, 0, 1,
-1.709933, 1.157711, -2.837848, 1, 0.2862745, 0, 1,
-1.7093, 1.456854, -0.2200334, 1, 0.2941177, 0, 1,
-1.693574, 1.235067, -1.451274, 1, 0.3019608, 0, 1,
-1.690146, -0.4199792, -2.634941, 1, 0.3058824, 0, 1,
-1.680001, -0.8461377, -1.918979, 1, 0.3137255, 0, 1,
-1.675225, -0.7909255, -3.060474, 1, 0.3176471, 0, 1,
-1.672624, 2.025768, -2.445089, 1, 0.3254902, 0, 1,
-1.668733, 1.426358, 0.3000281, 1, 0.3294118, 0, 1,
-1.665259, 0.6907846, -2.067162, 1, 0.3372549, 0, 1,
-1.646942, 0.3986022, -3.318727, 1, 0.3411765, 0, 1,
-1.642388, 1.45961, -0.720068, 1, 0.3490196, 0, 1,
-1.62086, -0.4294642, -0.5324365, 1, 0.3529412, 0, 1,
-1.618206, -1.390364, -2.104698, 1, 0.3607843, 0, 1,
-1.60474, -0.07754773, -2.035438, 1, 0.3647059, 0, 1,
-1.599213, -0.5800662, -2.177189, 1, 0.372549, 0, 1,
-1.599202, -0.7634333, -0.8385704, 1, 0.3764706, 0, 1,
-1.580894, -0.02176162, -2.530499, 1, 0.3843137, 0, 1,
-1.569984, -0.9608191, -3.042162, 1, 0.3882353, 0, 1,
-1.533868, -1.029068, -2.120948, 1, 0.3960784, 0, 1,
-1.5173, -0.0289451, -0.7115891, 1, 0.4039216, 0, 1,
-1.516545, -0.9404117, -3.472117, 1, 0.4078431, 0, 1,
-1.514319, -2.415166, -2.813057, 1, 0.4156863, 0, 1,
-1.503445, -0.8201299, -1.496838, 1, 0.4196078, 0, 1,
-1.499543, 0.5475103, -0.9373851, 1, 0.427451, 0, 1,
-1.494319, -0.4293014, -0.7402949, 1, 0.4313726, 0, 1,
-1.48479, 0.36821, -0.9891722, 1, 0.4392157, 0, 1,
-1.478088, -0.3477917, -2.429568, 1, 0.4431373, 0, 1,
-1.465913, -0.2397793, -2.770547, 1, 0.4509804, 0, 1,
-1.456338, -1.164394, -2.746501, 1, 0.454902, 0, 1,
-1.454928, 0.9484035, -0.4939207, 1, 0.4627451, 0, 1,
-1.452077, 1.376938, -0.3027422, 1, 0.4666667, 0, 1,
-1.427942, 3.140551, -0.4745711, 1, 0.4745098, 0, 1,
-1.414956, 0.026762, -2.148054, 1, 0.4784314, 0, 1,
-1.408681, -2.304846, -2.594496, 1, 0.4862745, 0, 1,
-1.403613, 0.7667422, -1.950405, 1, 0.4901961, 0, 1,
-1.401544, 1.979835, -0.3924667, 1, 0.4980392, 0, 1,
-1.398161, -0.2726336, -1.198458, 1, 0.5058824, 0, 1,
-1.380716, 0.839874, -1.674426, 1, 0.509804, 0, 1,
-1.377321, -0.08352944, -2.625892, 1, 0.5176471, 0, 1,
-1.366461, -0.01370046, -1.380409, 1, 0.5215687, 0, 1,
-1.359572, 0.2215944, -2.13223, 1, 0.5294118, 0, 1,
-1.353109, 0.3788279, -1.938078, 1, 0.5333334, 0, 1,
-1.347768, 0.265878, -0.7450619, 1, 0.5411765, 0, 1,
-1.346269, -0.05638435, -3.076018, 1, 0.5450981, 0, 1,
-1.343475, -0.5570804, -2.701619, 1, 0.5529412, 0, 1,
-1.339804, -0.05984453, -2.568892, 1, 0.5568628, 0, 1,
-1.326579, -0.4039868, -2.457985, 1, 0.5647059, 0, 1,
-1.321409, 0.6551591, -0.7023018, 1, 0.5686275, 0, 1,
-1.304475, -0.6621039, -2.922423, 1, 0.5764706, 0, 1,
-1.303434, -0.5800776, -1.372754, 1, 0.5803922, 0, 1,
-1.302388, 0.6170945, -1.136784, 1, 0.5882353, 0, 1,
-1.297895, -0.01087794, -3.236692, 1, 0.5921569, 0, 1,
-1.269993, 1.020279, -0.2737209, 1, 0.6, 0, 1,
-1.261475, 1.817762, -1.249766, 1, 0.6078432, 0, 1,
-1.254277, -0.8679701, -0.8730552, 1, 0.6117647, 0, 1,
-1.249697, -0.4424942, -2.955871, 1, 0.6196079, 0, 1,
-1.246695, -0.7489106, -3.090951, 1, 0.6235294, 0, 1,
-1.242245, -0.2508107, -0.6375307, 1, 0.6313726, 0, 1,
-1.235596, 0.3479679, -0.3553785, 1, 0.6352941, 0, 1,
-1.231872, -0.5492749, -3.195481, 1, 0.6431373, 0, 1,
-1.222584, -0.7135482, -1.858192, 1, 0.6470588, 0, 1,
-1.219891, 1.001698, -0.5691518, 1, 0.654902, 0, 1,
-1.208128, 0.4148709, -1.535715, 1, 0.6588235, 0, 1,
-1.202169, 0.6376626, -0.1956963, 1, 0.6666667, 0, 1,
-1.194394, 0.400298, -0.2187898, 1, 0.6705883, 0, 1,
-1.192964, 0.5045925, -0.6236754, 1, 0.6784314, 0, 1,
-1.187754, 1.570877, -0.5400143, 1, 0.682353, 0, 1,
-1.18313, -0.3766958, -0.5509976, 1, 0.6901961, 0, 1,
-1.180974, 0.03165936, -0.07200512, 1, 0.6941177, 0, 1,
-1.174958, -1.663298, -0.7291585, 1, 0.7019608, 0, 1,
-1.173069, 0.7594931, -1.740754, 1, 0.7098039, 0, 1,
-1.169822, 0.8671252, 0.1205175, 1, 0.7137255, 0, 1,
-1.168038, -0.7021756, -2.18852, 1, 0.7215686, 0, 1,
-1.167513, -0.4025019, -2.556983, 1, 0.7254902, 0, 1,
-1.167019, -1.318272, -1.371271, 1, 0.7333333, 0, 1,
-1.158034, -0.3243918, -2.369772, 1, 0.7372549, 0, 1,
-1.153192, 0.3046166, -2.166907, 1, 0.7450981, 0, 1,
-1.144205, 0.7902724, -1.349191, 1, 0.7490196, 0, 1,
-1.143971, 1.095313, -0.01362782, 1, 0.7568628, 0, 1,
-1.137773, -0.7747769, -1.328585, 1, 0.7607843, 0, 1,
-1.132634, -0.6166256, -0.6241558, 1, 0.7686275, 0, 1,
-1.124119, -0.1110074, -2.315736, 1, 0.772549, 0, 1,
-1.118377, -0.624712, -2.871202, 1, 0.7803922, 0, 1,
-1.116989, -0.7673106, -2.253994, 1, 0.7843137, 0, 1,
-1.113752, 0.3257632, -1.753947, 1, 0.7921569, 0, 1,
-1.108179, -0.5320951, -3.017603, 1, 0.7960784, 0, 1,
-1.107537, -1.222419, -4.904784, 1, 0.8039216, 0, 1,
-1.101131, -0.7542396, -3.03942, 1, 0.8117647, 0, 1,
-1.095219, -0.0222517, -0.5439748, 1, 0.8156863, 0, 1,
-1.094051, -1.525953, -4.275587, 1, 0.8235294, 0, 1,
-1.084713, -1.504047, -4.041069, 1, 0.827451, 0, 1,
-1.082569, 0.2054728, 0.09296645, 1, 0.8352941, 0, 1,
-1.077363, 0.3971308, -1.071608, 1, 0.8392157, 0, 1,
-1.073452, 0.6736432, 1.069439, 1, 0.8470588, 0, 1,
-1.07231, -0.7847415, -4.683669, 1, 0.8509804, 0, 1,
-1.071033, 0.8676519, -0.7794983, 1, 0.8588235, 0, 1,
-1.061254, 0.06356943, -1.242236, 1, 0.8627451, 0, 1,
-1.060826, -3.694741, -4.347311, 1, 0.8705882, 0, 1,
-1.056828, 2.189862, 0.2006278, 1, 0.8745098, 0, 1,
-1.050877, -2.113009, -3.689095, 1, 0.8823529, 0, 1,
-1.04982, -0.8703281, -0.8817305, 1, 0.8862745, 0, 1,
-1.044724, -1.227658, -2.628382, 1, 0.8941177, 0, 1,
-1.039812, 0.8037856, -0.3412435, 1, 0.8980392, 0, 1,
-1.034428, 0.5869863, -0.3189015, 1, 0.9058824, 0, 1,
-1.029559, -0.3896686, -2.718337, 1, 0.9137255, 0, 1,
-1.027964, -1.990152, -2.710246, 1, 0.9176471, 0, 1,
-1.024678, -2.377913, -1.752336, 1, 0.9254902, 0, 1,
-1.024383, 0.369388, -1.733581, 1, 0.9294118, 0, 1,
-1.023912, -1.120605, -4.031366, 1, 0.9372549, 0, 1,
-1.014621, 1.711983, -0.3063866, 1, 0.9411765, 0, 1,
-1.013832, 0.2062946, -0.7385879, 1, 0.9490196, 0, 1,
-1.01158, -0.7108806, -1.458625, 1, 0.9529412, 0, 1,
-1.007359, 0.8412673, -0.7614779, 1, 0.9607843, 0, 1,
-1.00735, -1.93422, -2.388903, 1, 0.9647059, 0, 1,
-1.002284, 1.036124, -0.7328283, 1, 0.972549, 0, 1,
-1.000507, -0.6225989, -1.257388, 1, 0.9764706, 0, 1,
-0.9933248, 0.4923308, -0.9188394, 1, 0.9843137, 0, 1,
-0.9928091, 0.5036235, -1.158419, 1, 0.9882353, 0, 1,
-0.98841, 0.02217237, -1.123834, 1, 0.9960784, 0, 1,
-0.9880947, 1.861893, -0.4136484, 0.9960784, 1, 0, 1,
-0.9864287, 1.363613, -1.382306, 0.9921569, 1, 0, 1,
-0.9852105, -1.609646, -1.687016, 0.9843137, 1, 0, 1,
-0.9821837, 0.488952, -2.287766, 0.9803922, 1, 0, 1,
-0.9819873, -0.2373377, -2.299966, 0.972549, 1, 0, 1,
-0.9783541, -1.628524, -3.964048, 0.9686275, 1, 0, 1,
-0.9746171, 0.7855887, -1.708949, 0.9607843, 1, 0, 1,
-0.9714232, -0.8390191, -1.344035, 0.9568627, 1, 0, 1,
-0.9685336, -0.6776291, -1.773802, 0.9490196, 1, 0, 1,
-0.9625099, 0.7046096, 0.08595439, 0.945098, 1, 0, 1,
-0.9604734, -0.4447648, -2.32679, 0.9372549, 1, 0, 1,
-0.9548231, -0.3946775, -1.115225, 0.9333333, 1, 0, 1,
-0.9540197, 0.4417764, -1.719544, 0.9254902, 1, 0, 1,
-0.9515278, 0.7941438, 0.5640633, 0.9215686, 1, 0, 1,
-0.9425438, -0.5276917, -2.411607, 0.9137255, 1, 0, 1,
-0.9336089, 0.2169172, -1.026483, 0.9098039, 1, 0, 1,
-0.9300823, -0.3722059, -3.000284, 0.9019608, 1, 0, 1,
-0.9179634, -1.410111, -3.338427, 0.8941177, 1, 0, 1,
-0.916842, 0.8262931, -2.183564, 0.8901961, 1, 0, 1,
-0.9117165, -1.866308, -3.564869, 0.8823529, 1, 0, 1,
-0.905225, 0.4850514, -0.6350976, 0.8784314, 1, 0, 1,
-0.9026872, 0.08491058, -1.727037, 0.8705882, 1, 0, 1,
-0.8978765, -0.7914428, -1.876767, 0.8666667, 1, 0, 1,
-0.8969906, 0.6098259, -1.959414, 0.8588235, 1, 0, 1,
-0.8926615, -2.164002, -4.710548, 0.854902, 1, 0, 1,
-0.8794001, -0.4087774, -0.5143551, 0.8470588, 1, 0, 1,
-0.8790654, -0.8925185, -1.808215, 0.8431373, 1, 0, 1,
-0.8779028, -0.5321345, -2.293858, 0.8352941, 1, 0, 1,
-0.8731834, 1.089141, 0.4046528, 0.8313726, 1, 0, 1,
-0.8710244, 1.167089, -0.4793161, 0.8235294, 1, 0, 1,
-0.8708906, -0.6053776, -0.1056633, 0.8196079, 1, 0, 1,
-0.8700832, 2.274351, -1.374772, 0.8117647, 1, 0, 1,
-0.8663236, -1.395393, -1.659035, 0.8078431, 1, 0, 1,
-0.8612286, 0.6788893, -0.4106174, 0.8, 1, 0, 1,
-0.8609132, 0.2731098, -1.330048, 0.7921569, 1, 0, 1,
-0.8593658, -1.094997, -2.02316, 0.7882353, 1, 0, 1,
-0.8562939, -0.3991061, -1.494681, 0.7803922, 1, 0, 1,
-0.8557258, -0.0942141, -2.473219, 0.7764706, 1, 0, 1,
-0.8551683, 1.08386, 0.2454118, 0.7686275, 1, 0, 1,
-0.8531663, 0.2517339, -1.812953, 0.7647059, 1, 0, 1,
-0.8502027, 1.168217, -2.16587, 0.7568628, 1, 0, 1,
-0.844565, -0.03276942, -2.817095, 0.7529412, 1, 0, 1,
-0.8441535, 1.078496, -3.548554, 0.7450981, 1, 0, 1,
-0.840072, -1.527255, -1.138125, 0.7411765, 1, 0, 1,
-0.8376709, 0.4629858, -1.19392, 0.7333333, 1, 0, 1,
-0.8342192, -0.4259758, -3.259186, 0.7294118, 1, 0, 1,
-0.8274294, -0.5855114, -2.989361, 0.7215686, 1, 0, 1,
-0.8268095, -0.4029195, -3.420357, 0.7176471, 1, 0, 1,
-0.8244812, 0.9358233, 0.05287249, 0.7098039, 1, 0, 1,
-0.8218249, -0.8184471, -3.466705, 0.7058824, 1, 0, 1,
-0.8178711, 1.394521, -1.242195, 0.6980392, 1, 0, 1,
-0.8175691, -0.1962389, -1.294614, 0.6901961, 1, 0, 1,
-0.8062465, -0.7098234, -1.216405, 0.6862745, 1, 0, 1,
-0.8048242, -0.1288349, -1.628738, 0.6784314, 1, 0, 1,
-0.8000869, 0.2709481, -1.059871, 0.6745098, 1, 0, 1,
-0.7976486, 0.7888983, -0.3737931, 0.6666667, 1, 0, 1,
-0.7952791, -0.5947177, -2.382054, 0.6627451, 1, 0, 1,
-0.7932082, 0.8041666, 0.4507742, 0.654902, 1, 0, 1,
-0.7860316, -0.3453911, -2.817296, 0.6509804, 1, 0, 1,
-0.7821867, 0.1009867, -0.4049352, 0.6431373, 1, 0, 1,
-0.7806237, -0.2202313, -1.067191, 0.6392157, 1, 0, 1,
-0.780196, 0.5686094, -2.190386, 0.6313726, 1, 0, 1,
-0.7785255, -0.4832369, -2.091289, 0.627451, 1, 0, 1,
-0.7758396, -1.142685, -2.582731, 0.6196079, 1, 0, 1,
-0.7745516, 0.5207669, 0.04156177, 0.6156863, 1, 0, 1,
-0.7744079, 1.119742, -0.6140673, 0.6078432, 1, 0, 1,
-0.7640889, 0.04600179, -0.9901499, 0.6039216, 1, 0, 1,
-0.7616904, 0.642279, -0.7839656, 0.5960785, 1, 0, 1,
-0.7596867, 0.9914788, 0.1780149, 0.5882353, 1, 0, 1,
-0.7585935, -1.879691, -2.792688, 0.5843138, 1, 0, 1,
-0.7544816, -1.495996, -1.328954, 0.5764706, 1, 0, 1,
-0.7391257, -0.6106911, -2.198486, 0.572549, 1, 0, 1,
-0.7388748, 0.04336141, -1.695361, 0.5647059, 1, 0, 1,
-0.7289937, -0.453778, -2.737691, 0.5607843, 1, 0, 1,
-0.7289116, 0.9961311, -0.5860127, 0.5529412, 1, 0, 1,
-0.7239596, -0.9814596, -2.345669, 0.5490196, 1, 0, 1,
-0.719694, -1.411969, -2.816786, 0.5411765, 1, 0, 1,
-0.7131154, -0.2852417, -3.471369, 0.5372549, 1, 0, 1,
-0.7108654, 2.234076, -1.376622, 0.5294118, 1, 0, 1,
-0.7094007, -0.9095477, -0.1453017, 0.5254902, 1, 0, 1,
-0.707871, -1.126752, -2.606972, 0.5176471, 1, 0, 1,
-0.7067125, 0.2256712, -1.067705, 0.5137255, 1, 0, 1,
-0.6991231, 1.18605, -0.0823004, 0.5058824, 1, 0, 1,
-0.6916407, 0.7579767, -2.353128, 0.5019608, 1, 0, 1,
-0.683714, -0.3127967, -0.2053408, 0.4941176, 1, 0, 1,
-0.6779096, 0.7378085, -1.418074, 0.4862745, 1, 0, 1,
-0.6753735, -0.7823761, -3.761004, 0.4823529, 1, 0, 1,
-0.6749884, 0.4842241, -1.384855, 0.4745098, 1, 0, 1,
-0.6731758, -0.7701354, -2.475475, 0.4705882, 1, 0, 1,
-0.6703227, 1.929987, -0.3915077, 0.4627451, 1, 0, 1,
-0.6691283, 0.1619845, -3.89774, 0.4588235, 1, 0, 1,
-0.6679887, -0.1214551, -0.9607377, 0.4509804, 1, 0, 1,
-0.6654437, -0.9221342, -1.807481, 0.4470588, 1, 0, 1,
-0.6647421, -0.991843, -2.196926, 0.4392157, 1, 0, 1,
-0.6624195, -1.533987, -3.354406, 0.4352941, 1, 0, 1,
-0.6618063, 2.193703, 1.49974, 0.427451, 1, 0, 1,
-0.6586655, -0.5851675, -2.010602, 0.4235294, 1, 0, 1,
-0.6555142, 0.5672365, -0.479537, 0.4156863, 1, 0, 1,
-0.6508169, -0.1377603, -2.547905, 0.4117647, 1, 0, 1,
-0.6500648, -0.0734951, -2.395812, 0.4039216, 1, 0, 1,
-0.6497849, -1.322372, -1.225369, 0.3960784, 1, 0, 1,
-0.6460733, -0.1744769, -1.105687, 0.3921569, 1, 0, 1,
-0.6445001, -1.701452, -3.682572, 0.3843137, 1, 0, 1,
-0.6442454, -1.836353, -3.154429, 0.3803922, 1, 0, 1,
-0.6439925, -0.5734806, -2.017685, 0.372549, 1, 0, 1,
-0.6425872, 0.07640108, -0.6516019, 0.3686275, 1, 0, 1,
-0.6422, -0.1041331, -4.189827, 0.3607843, 1, 0, 1,
-0.6375943, -0.6029301, -2.311929, 0.3568628, 1, 0, 1,
-0.6335562, 0.1747856, -1.238452, 0.3490196, 1, 0, 1,
-0.6267359, -0.01071701, -1.115552, 0.345098, 1, 0, 1,
-0.6241084, 0.6174714, -0.3251041, 0.3372549, 1, 0, 1,
-0.6240906, 0.3288712, -0.3730903, 0.3333333, 1, 0, 1,
-0.6232859, -0.8341882, -2.235161, 0.3254902, 1, 0, 1,
-0.6153063, 0.9866757, -0.4700149, 0.3215686, 1, 0, 1,
-0.6114536, 1.655069, -1.953095, 0.3137255, 1, 0, 1,
-0.6092362, -1.204205, -1.708561, 0.3098039, 1, 0, 1,
-0.6090707, 0.5049773, -1.527137, 0.3019608, 1, 0, 1,
-0.6060994, -0.07908518, -1.861487, 0.2941177, 1, 0, 1,
-0.6055001, 0.9848542, -1.803943, 0.2901961, 1, 0, 1,
-0.6029167, 1.081414, -0.01690678, 0.282353, 1, 0, 1,
-0.5981742, -1.684252, -3.377224, 0.2784314, 1, 0, 1,
-0.5922861, 0.3984614, 0.7217519, 0.2705882, 1, 0, 1,
-0.5888032, -0.4892401, -0.8129727, 0.2666667, 1, 0, 1,
-0.5875771, -0.5374588, -2.606658, 0.2588235, 1, 0, 1,
-0.5863234, 0.7709659, -0.2059732, 0.254902, 1, 0, 1,
-0.5791033, 0.7566471, -1.062671, 0.2470588, 1, 0, 1,
-0.5756846, 1.925691, 0.1280006, 0.2431373, 1, 0, 1,
-0.561673, 0.2609838, -1.043882, 0.2352941, 1, 0, 1,
-0.5600443, -1.688781, -3.822825, 0.2313726, 1, 0, 1,
-0.5560253, -1.271068, -3.673149, 0.2235294, 1, 0, 1,
-0.552943, -0.2247159, -1.484433, 0.2196078, 1, 0, 1,
-0.5521833, -1.240116, -2.415895, 0.2117647, 1, 0, 1,
-0.5517718, 1.233902, -0.437654, 0.2078431, 1, 0, 1,
-0.5496576, 0.4830732, 0.618354, 0.2, 1, 0, 1,
-0.548991, 0.3536503, -0.1023269, 0.1921569, 1, 0, 1,
-0.5487177, 0.9987378, 0.06356324, 0.1882353, 1, 0, 1,
-0.5482179, -0.7289112, -3.796788, 0.1803922, 1, 0, 1,
-0.5447428, -0.4272078, -1.88037, 0.1764706, 1, 0, 1,
-0.5394973, -0.271698, -2.345495, 0.1686275, 1, 0, 1,
-0.5354689, 1.335207, 0.4577156, 0.1647059, 1, 0, 1,
-0.5351788, -0.09765291, -2.301986, 0.1568628, 1, 0, 1,
-0.5332386, 0.2011622, -1.939774, 0.1529412, 1, 0, 1,
-0.5329629, -2.015902, -2.334797, 0.145098, 1, 0, 1,
-0.532081, -0.5428233, -1.690305, 0.1411765, 1, 0, 1,
-0.5193014, 0.8348529, -0.3907314, 0.1333333, 1, 0, 1,
-0.518575, -1.414744, -3.598505, 0.1294118, 1, 0, 1,
-0.5168942, -0.1377252, -2.939093, 0.1215686, 1, 0, 1,
-0.5148601, 1.066949, 0.7829195, 0.1176471, 1, 0, 1,
-0.5103378, 0.02862305, -0.0880016, 0.1098039, 1, 0, 1,
-0.5075766, 1.415921, -0.8597437, 0.1058824, 1, 0, 1,
-0.5054291, -0.002192897, -2.476791, 0.09803922, 1, 0, 1,
-0.5039026, 0.03835366, -0.8748198, 0.09019608, 1, 0, 1,
-0.50166, -0.05600476, -0.4365149, 0.08627451, 1, 0, 1,
-0.497209, 1.539462, 1.053686, 0.07843138, 1, 0, 1,
-0.495405, 1.240524, -0.5747178, 0.07450981, 1, 0, 1,
-0.4908887, -0.6285106, -2.743649, 0.06666667, 1, 0, 1,
-0.4899475, 0.1586039, -0.7700301, 0.0627451, 1, 0, 1,
-0.4896491, -1.988328, -2.010267, 0.05490196, 1, 0, 1,
-0.4860955, 0.6275222, -0.01615288, 0.05098039, 1, 0, 1,
-0.4833875, -0.3015149, -2.157503, 0.04313726, 1, 0, 1,
-0.4807993, 0.3555748, -0.1832938, 0.03921569, 1, 0, 1,
-0.4758563, -0.3044373, -0.7007044, 0.03137255, 1, 0, 1,
-0.4715751, 0.1598909, -1.282556, 0.02745098, 1, 0, 1,
-0.4715015, 0.8543788, 1.023592, 0.01960784, 1, 0, 1,
-0.4597107, -0.8786807, -4.566535, 0.01568628, 1, 0, 1,
-0.4566622, -0.5198479, -2.940362, 0.007843138, 1, 0, 1,
-0.4544061, -2.025234, -2.286673, 0.003921569, 1, 0, 1,
-0.4481856, -0.1359389, -1.148156, 0, 1, 0.003921569, 1,
-0.447139, -1.307904, -3.525713, 0, 1, 0.01176471, 1,
-0.4455244, -1.462195, -5.19482, 0, 1, 0.01568628, 1,
-0.4451737, -0.2007619, -2.701327, 0, 1, 0.02352941, 1,
-0.4394267, 1.648522, 1.118584, 0, 1, 0.02745098, 1,
-0.437304, 3.086608, -0.6890994, 0, 1, 0.03529412, 1,
-0.4284129, 1.838444, -0.0140274, 0, 1, 0.03921569, 1,
-0.4235228, 1.008458, -0.07631844, 0, 1, 0.04705882, 1,
-0.4200383, 0.2103634, -2.552295, 0, 1, 0.05098039, 1,
-0.4157189, -0.8534474, -1.281193, 0, 1, 0.05882353, 1,
-0.4147474, 0.678795, -1.631675, 0, 1, 0.0627451, 1,
-0.4128731, -2.097366, -4.545744, 0, 1, 0.07058824, 1,
-0.4117264, -1.072486, -2.43497, 0, 1, 0.07450981, 1,
-0.4110109, 1.060019, 1.679989, 0, 1, 0.08235294, 1,
-0.4044656, 0.4158101, -2.000681, 0, 1, 0.08627451, 1,
-0.3973124, 0.3893559, -0.7039113, 0, 1, 0.09411765, 1,
-0.3962102, -0.7430682, -1.323111, 0, 1, 0.1019608, 1,
-0.390323, 1.366307, -0.6532029, 0, 1, 0.1058824, 1,
-0.389823, 0.4315839, -1.427062, 0, 1, 0.1137255, 1,
-0.3809794, 1.029967, -0.9932531, 0, 1, 0.1176471, 1,
-0.3792357, 0.08571947, 1.141366, 0, 1, 0.1254902, 1,
-0.3737191, 0.5110488, -0.01862793, 0, 1, 0.1294118, 1,
-0.3734255, 0.262056, -1.334762, 0, 1, 0.1372549, 1,
-0.3734157, 1.14618, -1.814828, 0, 1, 0.1411765, 1,
-0.3685795, -2.305633, -4.114092, 0, 1, 0.1490196, 1,
-0.3655662, -1.192574, -3.264319, 0, 1, 0.1529412, 1,
-0.3532966, 0.496063, 0.002378403, 0, 1, 0.1607843, 1,
-0.3464077, -0.8744906, -3.37155, 0, 1, 0.1647059, 1,
-0.3457498, 0.425685, -0.3380627, 0, 1, 0.172549, 1,
-0.3451281, 0.3703064, 0.1236127, 0, 1, 0.1764706, 1,
-0.3441976, 0.9148189, 0.6885925, 0, 1, 0.1843137, 1,
-0.3437569, -1.41064, -3.497592, 0, 1, 0.1882353, 1,
-0.341963, -1.130126, -1.979185, 0, 1, 0.1960784, 1,
-0.3363108, -1.042541, -4.6242, 0, 1, 0.2039216, 1,
-0.3346432, 0.8860217, -0.3813953, 0, 1, 0.2078431, 1,
-0.3333401, -1.226953, -2.514733, 0, 1, 0.2156863, 1,
-0.333218, 1.0864, 0.007035585, 0, 1, 0.2196078, 1,
-0.3278144, 1.382901, 1.198732, 0, 1, 0.227451, 1,
-0.3272034, -0.5403689, -3.875278, 0, 1, 0.2313726, 1,
-0.3265363, -0.4552435, -2.53442, 0, 1, 0.2392157, 1,
-0.3235215, 0.1629961, -1.198119, 0, 1, 0.2431373, 1,
-0.3206181, 2.584302, -0.5850918, 0, 1, 0.2509804, 1,
-0.3102447, 0.8671633, -0.5244791, 0, 1, 0.254902, 1,
-0.3084633, -2.074895, -1.757067, 0, 1, 0.2627451, 1,
-0.298644, 0.441098, -0.1282495, 0, 1, 0.2666667, 1,
-0.2978576, 0.007491414, -1.843187, 0, 1, 0.2745098, 1,
-0.2919459, 0.09060477, -2.963751, 0, 1, 0.2784314, 1,
-0.2815679, 0.2992962, -2.219824, 0, 1, 0.2862745, 1,
-0.2802159, 0.1144482, -2.348503, 0, 1, 0.2901961, 1,
-0.2801872, -0.2371232, -1.511055, 0, 1, 0.2980392, 1,
-0.2775493, -0.6957464, -3.874464, 0, 1, 0.3058824, 1,
-0.2774144, 1.36952, -1.929806, 0, 1, 0.3098039, 1,
-0.274546, -0.4756467, -2.753465, 0, 1, 0.3176471, 1,
-0.2671232, -0.6955426, -3.144809, 0, 1, 0.3215686, 1,
-0.2619908, -0.1669164, -3.149524, 0, 1, 0.3294118, 1,
-0.2565875, 0.1576787, -1.697207, 0, 1, 0.3333333, 1,
-0.2554529, 0.8047351, -1.08227, 0, 1, 0.3411765, 1,
-0.2518132, -0.3066767, -2.444819, 0, 1, 0.345098, 1,
-0.2509837, 0.2875611, 0.8723074, 0, 1, 0.3529412, 1,
-0.2504781, 0.6613491, -2.082895, 0, 1, 0.3568628, 1,
-0.2496717, -0.7975401, -5.309347, 0, 1, 0.3647059, 1,
-0.2482694, -0.0259741, -3.094935, 0, 1, 0.3686275, 1,
-0.2441066, -0.4854829, -2.019712, 0, 1, 0.3764706, 1,
-0.240246, -0.2648184, -1.304589, 0, 1, 0.3803922, 1,
-0.2402206, 0.8727455, 0.04510781, 0, 1, 0.3882353, 1,
-0.2373343, 2.763983, -0.6515588, 0, 1, 0.3921569, 1,
-0.2362769, -0.6218411, -1.335536, 0, 1, 0.4, 1,
-0.2356199, -1.053054, -2.349144, 0, 1, 0.4078431, 1,
-0.232955, 0.06274667, 0.1898892, 0, 1, 0.4117647, 1,
-0.2276008, -0.4625504, -2.908756, 0, 1, 0.4196078, 1,
-0.2267568, -0.9450707, -0.9241519, 0, 1, 0.4235294, 1,
-0.22659, 1.648979, -0.8296568, 0, 1, 0.4313726, 1,
-0.2185034, 1.001277, -0.2373654, 0, 1, 0.4352941, 1,
-0.2164802, 0.1431138, -1.060317, 0, 1, 0.4431373, 1,
-0.2160655, 0.9402419, 0.6486298, 0, 1, 0.4470588, 1,
-0.2157913, 1.5196, -1.454033, 0, 1, 0.454902, 1,
-0.2138477, -0.1785222, -3.404941, 0, 1, 0.4588235, 1,
-0.2055974, 0.5377212, -1.466968, 0, 1, 0.4666667, 1,
-0.2033877, 0.366048, -0.4462695, 0, 1, 0.4705882, 1,
-0.2010947, -1.585005, -4.223873, 0, 1, 0.4784314, 1,
-0.200116, 1.747766, 0.553571, 0, 1, 0.4823529, 1,
-0.1950143, -0.2489036, -1.58838, 0, 1, 0.4901961, 1,
-0.194812, 0.3673582, -0.7330941, 0, 1, 0.4941176, 1,
-0.1925086, -1.6052, -2.443809, 0, 1, 0.5019608, 1,
-0.189892, -0.05302809, -1.92351, 0, 1, 0.509804, 1,
-0.1879077, -0.4116532, -1.092473, 0, 1, 0.5137255, 1,
-0.1872478, -0.7566484, -2.545576, 0, 1, 0.5215687, 1,
-0.1857116, 0.6114713, -0.7572362, 0, 1, 0.5254902, 1,
-0.1774755, 0.559508, -0.8841301, 0, 1, 0.5333334, 1,
-0.1723329, -1.115731, -3.366684, 0, 1, 0.5372549, 1,
-0.1721477, -0.2652187, -3.395685, 0, 1, 0.5450981, 1,
-0.1663654, -0.8201984, -2.969032, 0, 1, 0.5490196, 1,
-0.1633676, 1.60159, 0.7779973, 0, 1, 0.5568628, 1,
-0.1631589, 0.4208433, -1.203357, 0, 1, 0.5607843, 1,
-0.1581578, 1.257546, 0.8161104, 0, 1, 0.5686275, 1,
-0.149143, 0.08458658, 1.303385, 0, 1, 0.572549, 1,
-0.1480518, 0.2059738, -0.3069192, 0, 1, 0.5803922, 1,
-0.143636, 0.655377, -0.5844667, 0, 1, 0.5843138, 1,
-0.1341229, -0.9673575, -4.687915, 0, 1, 0.5921569, 1,
-0.134032, -1.180998, -3.381631, 0, 1, 0.5960785, 1,
-0.1329231, -0.8464811, -2.969663, 0, 1, 0.6039216, 1,
-0.1318944, 0.1370083, -1.419737, 0, 1, 0.6117647, 1,
-0.1313382, -0.5557839, -2.682178, 0, 1, 0.6156863, 1,
-0.1304766, 0.1590661, -0.3694549, 0, 1, 0.6235294, 1,
-0.1240933, 0.7211344, -0.997371, 0, 1, 0.627451, 1,
-0.1162831, -0.03840466, -2.678951, 0, 1, 0.6352941, 1,
-0.1153859, -0.8237131, -3.563377, 0, 1, 0.6392157, 1,
-0.1140538, -0.7225916, -1.288062, 0, 1, 0.6470588, 1,
-0.111073, -0.5777641, -3.679511, 0, 1, 0.6509804, 1,
-0.1090619, 0.03887723, -1.746472, 0, 1, 0.6588235, 1,
-0.107903, -1.37813, -3.449277, 0, 1, 0.6627451, 1,
-0.1073925, 0.7838334, 0.5443284, 0, 1, 0.6705883, 1,
-0.1071519, 1.128306, -2.381771, 0, 1, 0.6745098, 1,
-0.106092, -1.229074, -2.490374, 0, 1, 0.682353, 1,
-0.1052312, -0.3838786, -1.991217, 0, 1, 0.6862745, 1,
-0.09945529, -1.406591, -2.444105, 0, 1, 0.6941177, 1,
-0.0992215, -0.2450515, -1.522514, 0, 1, 0.7019608, 1,
-0.09509528, -0.3115246, -1.983403, 0, 1, 0.7058824, 1,
-0.09208485, 0.6316443, -0.8078588, 0, 1, 0.7137255, 1,
-0.08441065, -0.5422678, -2.578882, 0, 1, 0.7176471, 1,
-0.0806146, 0.04145086, -0.1538327, 0, 1, 0.7254902, 1,
-0.06999856, -1.010754, -3.894193, 0, 1, 0.7294118, 1,
-0.06844906, -0.3312303, -1.307243, 0, 1, 0.7372549, 1,
-0.06149238, 0.4732064, 1.181605, 0, 1, 0.7411765, 1,
-0.0599695, -0.3341186, -3.251806, 0, 1, 0.7490196, 1,
-0.05913294, 1.833261, -0.321169, 0, 1, 0.7529412, 1,
-0.05774337, -1.672769, -3.921152, 0, 1, 0.7607843, 1,
-0.05712817, -0.3656474, -3.94639, 0, 1, 0.7647059, 1,
-0.04770344, 0.4941763, 0.6372417, 0, 1, 0.772549, 1,
-0.04151968, 1.003388, 0.933654, 0, 1, 0.7764706, 1,
-0.03784562, 1.346152, -0.401071, 0, 1, 0.7843137, 1,
-0.03539582, 0.7665968, 1.034965, 0, 1, 0.7882353, 1,
-0.02437962, 0.1056156, 0.5936825, 0, 1, 0.7960784, 1,
-0.02224653, 0.7608408, 0.654265, 0, 1, 0.8039216, 1,
-0.01724857, -1.604344, -3.081819, 0, 1, 0.8078431, 1,
-0.01106377, 0.1746463, -0.6478977, 0, 1, 0.8156863, 1,
-0.006896699, -0.927388, -2.166001, 0, 1, 0.8196079, 1,
-0.006117022, -0.7424961, -2.599161, 0, 1, 0.827451, 1,
-0.001970254, -0.6013138, -3.954022, 0, 1, 0.8313726, 1,
0.002192312, -1.40309, 0.9152437, 0, 1, 0.8392157, 1,
0.005540379, -0.7197835, 4.091898, 0, 1, 0.8431373, 1,
0.007699481, -0.3293916, 4.654112, 0, 1, 0.8509804, 1,
0.007998354, -1.069252, 5.140298, 0, 1, 0.854902, 1,
0.009553963, -1.083338, 3.240622, 0, 1, 0.8627451, 1,
0.01656934, -1.87078, 4.298189, 0, 1, 0.8666667, 1,
0.0169273, -0.4153757, 3.744391, 0, 1, 0.8745098, 1,
0.01716402, 0.1255368, -1.038608, 0, 1, 0.8784314, 1,
0.02031971, -1.830188, 2.812468, 0, 1, 0.8862745, 1,
0.02547808, 1.565038, -0.8282934, 0, 1, 0.8901961, 1,
0.02811086, 1.073826, -0.862632, 0, 1, 0.8980392, 1,
0.02944211, -0.5234926, 2.730978, 0, 1, 0.9058824, 1,
0.02953409, 0.7927585, -0.1282481, 0, 1, 0.9098039, 1,
0.03077183, 0.2411242, -0.9929118, 0, 1, 0.9176471, 1,
0.0340302, -0.3363823, 3.270572, 0, 1, 0.9215686, 1,
0.0359533, 0.1529972, -1.012324, 0, 1, 0.9294118, 1,
0.03930483, -0.5317898, 2.792452, 0, 1, 0.9333333, 1,
0.04302055, 0.03769899, 0.4073379, 0, 1, 0.9411765, 1,
0.04352627, -0.9489573, 3.079464, 0, 1, 0.945098, 1,
0.04479655, 0.07037036, -0.01634594, 0, 1, 0.9529412, 1,
0.04894819, -0.6501182, 2.943127, 0, 1, 0.9568627, 1,
0.05262131, -0.6624345, 2.596817, 0, 1, 0.9647059, 1,
0.06176769, -0.01156888, 2.190301, 0, 1, 0.9686275, 1,
0.06290666, -0.1823646, 1.907056, 0, 1, 0.9764706, 1,
0.06462537, 1.499413, -0.9753205, 0, 1, 0.9803922, 1,
0.0653269, -0.3331623, 2.857084, 0, 1, 0.9882353, 1,
0.06693445, -0.5657679, 2.22989, 0, 1, 0.9921569, 1,
0.06770638, -1.191746, 3.857065, 0, 1, 1, 1,
0.06803045, -0.02189998, 3.074565, 0, 0.9921569, 1, 1,
0.0690885, -0.1235159, 3.667674, 0, 0.9882353, 1, 1,
0.07158152, 0.6953742, 0.6961539, 0, 0.9803922, 1, 1,
0.07282758, -1.047254, 2.190687, 0, 0.9764706, 1, 1,
0.07370601, -0.9653314, 2.737172, 0, 0.9686275, 1, 1,
0.07394291, -1.602411, 4.201653, 0, 0.9647059, 1, 1,
0.07601833, 1.530357, 0.1583504, 0, 0.9568627, 1, 1,
0.0805744, -1.803281, 1.643934, 0, 0.9529412, 1, 1,
0.08085011, 1.11957, 1.818642, 0, 0.945098, 1, 1,
0.08337344, 0.8014802, -1.642601, 0, 0.9411765, 1, 1,
0.08811191, -0.04984829, 0.9132929, 0, 0.9333333, 1, 1,
0.09091096, 0.3329671, 0.2247282, 0, 0.9294118, 1, 1,
0.09316658, -0.2167271, 1.597749, 0, 0.9215686, 1, 1,
0.09322659, -0.1682065, 2.13478, 0, 0.9176471, 1, 1,
0.0946854, 0.05614595, 1.400954, 0, 0.9098039, 1, 1,
0.09634245, -0.6815329, 2.294906, 0, 0.9058824, 1, 1,
0.09732238, 0.2382849, 0.08690186, 0, 0.8980392, 1, 1,
0.0991964, -0.004463926, 1.956133, 0, 0.8901961, 1, 1,
0.1011893, -0.9818587, 2.433006, 0, 0.8862745, 1, 1,
0.1019574, 0.6864661, -0.07496005, 0, 0.8784314, 1, 1,
0.1022552, 0.04055316, 1.816766, 0, 0.8745098, 1, 1,
0.102934, -0.9689586, 4.302843, 0, 0.8666667, 1, 1,
0.1098569, -0.1601284, 2.475885, 0, 0.8627451, 1, 1,
0.1211966, 1.074367, -0.3707818, 0, 0.854902, 1, 1,
0.1218617, 1.13937, -0.6281497, 0, 0.8509804, 1, 1,
0.1230405, -0.8926179, 3.941762, 0, 0.8431373, 1, 1,
0.1237461, -1.30199, 4.062952, 0, 0.8392157, 1, 1,
0.1263322, -1.548496, 2.491314, 0, 0.8313726, 1, 1,
0.126542, -0.8494686, 2.754596, 0, 0.827451, 1, 1,
0.1275011, -1.30926, 2.237875, 0, 0.8196079, 1, 1,
0.1316143, 1.115974, 1.225387, 0, 0.8156863, 1, 1,
0.1334309, -0.3819729, 3.135817, 0, 0.8078431, 1, 1,
0.1367266, 0.2792837, -0.2971492, 0, 0.8039216, 1, 1,
0.1422609, 0.9886498, 2.06288, 0, 0.7960784, 1, 1,
0.1433524, -0.6471801, 3.541849, 0, 0.7882353, 1, 1,
0.1443829, -0.105092, 2.370098, 0, 0.7843137, 1, 1,
0.1483437, -0.05265478, 2.58728, 0, 0.7764706, 1, 1,
0.1489335, -1.902461, 3.907327, 0, 0.772549, 1, 1,
0.1536174, -0.6437904, 3.754217, 0, 0.7647059, 1, 1,
0.15798, -0.2370624, 2.258689, 0, 0.7607843, 1, 1,
0.1590979, -0.02481716, 1.99546, 0, 0.7529412, 1, 1,
0.1628879, 1.031023, -0.1109291, 0, 0.7490196, 1, 1,
0.1640051, 0.06018485, 1.7427, 0, 0.7411765, 1, 1,
0.1647113, -0.0239671, 1.30399, 0, 0.7372549, 1, 1,
0.1667061, 0.6101741, -1.633946, 0, 0.7294118, 1, 1,
0.1708287, 0.800786, -0.2536424, 0, 0.7254902, 1, 1,
0.1745817, -1.724241, 3.475328, 0, 0.7176471, 1, 1,
0.1768554, -0.6025472, 4.152991, 0, 0.7137255, 1, 1,
0.17781, 0.2569683, 1.477012, 0, 0.7058824, 1, 1,
0.178057, 1.058172, 0.5440103, 0, 0.6980392, 1, 1,
0.1796655, -0.1886715, 3.233935, 0, 0.6941177, 1, 1,
0.1814425, -0.04535051, 2.894841, 0, 0.6862745, 1, 1,
0.1821425, -1.056315, 3.304955, 0, 0.682353, 1, 1,
0.1826728, -2.060899, 2.338409, 0, 0.6745098, 1, 1,
0.1837543, -0.004219307, 1.109718, 0, 0.6705883, 1, 1,
0.1863952, 0.1645437, 1.362672, 0, 0.6627451, 1, 1,
0.1888966, -0.3873324, 3.903969, 0, 0.6588235, 1, 1,
0.1905537, 0.7327669, 0.1922213, 0, 0.6509804, 1, 1,
0.1950009, 1.05121, -1.363292, 0, 0.6470588, 1, 1,
0.196257, -0.1427856, 4.190557, 0, 0.6392157, 1, 1,
0.196943, -1.133763, 2.470955, 0, 0.6352941, 1, 1,
0.1977744, 0.6097212, 2.320587, 0, 0.627451, 1, 1,
0.201866, 1.809897, -1.236973, 0, 0.6235294, 1, 1,
0.2049745, -0.1360972, 3.046421, 0, 0.6156863, 1, 1,
0.2114373, -1.348778, 3.687627, 0, 0.6117647, 1, 1,
0.2123318, -0.7906812, 3.950047, 0, 0.6039216, 1, 1,
0.2132064, -1.133058, 4.838552, 0, 0.5960785, 1, 1,
0.2134898, 0.6400005, -0.2502786, 0, 0.5921569, 1, 1,
0.2149294, -0.08275072, 0.9822263, 0, 0.5843138, 1, 1,
0.2168308, 0.8988748, -0.5817551, 0, 0.5803922, 1, 1,
0.2222781, -0.3800751, 2.393128, 0, 0.572549, 1, 1,
0.2228881, -1.608508, 3.839903, 0, 0.5686275, 1, 1,
0.2273472, -0.0905149, 4.355267, 0, 0.5607843, 1, 1,
0.2291428, 0.220348, 1.208722, 0, 0.5568628, 1, 1,
0.2300276, 0.2032514, 0.85988, 0, 0.5490196, 1, 1,
0.2308422, 0.6469907, 1.110608, 0, 0.5450981, 1, 1,
0.2360355, -0.4203571, 3.950493, 0, 0.5372549, 1, 1,
0.2361844, 0.1571177, -0.1204681, 0, 0.5333334, 1, 1,
0.2392338, 0.6710356, -1.119929, 0, 0.5254902, 1, 1,
0.243819, -0.9487912, 2.858956, 0, 0.5215687, 1, 1,
0.2474116, -0.03238869, 1.07238, 0, 0.5137255, 1, 1,
0.2482842, -0.6943877, 3.671722, 0, 0.509804, 1, 1,
0.2528337, -0.8639231, 2.556438, 0, 0.5019608, 1, 1,
0.2534415, 1.252442, -1.601474, 0, 0.4941176, 1, 1,
0.2566272, -0.151386, 2.676219, 0, 0.4901961, 1, 1,
0.2607571, -0.5154339, 3.541653, 0, 0.4823529, 1, 1,
0.2620127, 0.3105159, 1.507267, 0, 0.4784314, 1, 1,
0.2651233, 0.4414857, -1.072607, 0, 0.4705882, 1, 1,
0.268123, 0.1236025, -1.088988, 0, 0.4666667, 1, 1,
0.2725896, -0.743517, 1.768094, 0, 0.4588235, 1, 1,
0.2825527, -0.6442078, 2.812026, 0, 0.454902, 1, 1,
0.2920142, 0.7421046, -0.05734311, 0, 0.4470588, 1, 1,
0.2938244, 0.05518312, 0.9735513, 0, 0.4431373, 1, 1,
0.2958149, 0.4563746, 0.007589899, 0, 0.4352941, 1, 1,
0.2979502, -1.504483, 2.296098, 0, 0.4313726, 1, 1,
0.3043274, -2.09404, 3.398981, 0, 0.4235294, 1, 1,
0.3063492, 1.585458, 0.9291657, 0, 0.4196078, 1, 1,
0.3070115, -0.9003137, 1.827069, 0, 0.4117647, 1, 1,
0.3092685, -0.277463, 2.9239, 0, 0.4078431, 1, 1,
0.3097831, -0.00200554, 1.033379, 0, 0.4, 1, 1,
0.3164738, 2.700789, -0.1603128, 0, 0.3921569, 1, 1,
0.3177412, 0.8419581, 1.452072, 0, 0.3882353, 1, 1,
0.3258642, -0.3606164, 0.5717413, 0, 0.3803922, 1, 1,
0.3259859, -0.8952183, 2.48531, 0, 0.3764706, 1, 1,
0.3269668, -1.234359, 3.083806, 0, 0.3686275, 1, 1,
0.328465, -0.610166, 4.63054, 0, 0.3647059, 1, 1,
0.3311237, 0.6474445, 2.265146, 0, 0.3568628, 1, 1,
0.3318898, 0.9816208, 1.024928, 0, 0.3529412, 1, 1,
0.3343046, 1.76594, -0.1976244, 0, 0.345098, 1, 1,
0.3347906, -1.087751, 0.279604, 0, 0.3411765, 1, 1,
0.3359776, -0.5905823, 2.020791, 0, 0.3333333, 1, 1,
0.3400362, -0.8446905, 1.558418, 0, 0.3294118, 1, 1,
0.3403056, -1.124579, 2.376492, 0, 0.3215686, 1, 1,
0.3418565, -0.3099755, 2.175535, 0, 0.3176471, 1, 1,
0.3420344, 0.2438014, 1.396544, 0, 0.3098039, 1, 1,
0.3449967, -0.903823, 1.893026, 0, 0.3058824, 1, 1,
0.3450917, 1.664544, -1.004763, 0, 0.2980392, 1, 1,
0.345865, -1.063885, 1.857083, 0, 0.2901961, 1, 1,
0.3537904, -0.1477237, 2.239169, 0, 0.2862745, 1, 1,
0.3552207, 0.1809631, 2.215691, 0, 0.2784314, 1, 1,
0.3599901, 0.3882547, 1.114033, 0, 0.2745098, 1, 1,
0.3639936, 0.2610299, 1.307872, 0, 0.2666667, 1, 1,
0.3653949, -0.7246702, 3.234216, 0, 0.2627451, 1, 1,
0.3686571, -0.5747633, 2.384703, 0, 0.254902, 1, 1,
0.3689857, -0.6169552, 1.224024, 0, 0.2509804, 1, 1,
0.369709, -0.6343778, 3.168446, 0, 0.2431373, 1, 1,
0.3713672, 0.4605981, 1.945882, 0, 0.2392157, 1, 1,
0.3741915, -0.8589683, 2.143889, 0, 0.2313726, 1, 1,
0.3767109, 0.5397393, 0.5756916, 0, 0.227451, 1, 1,
0.3798285, 0.3817943, 1.813046, 0, 0.2196078, 1, 1,
0.3798944, -1.077281, 3.882619, 0, 0.2156863, 1, 1,
0.3808135, 1.905625, -0.2933727, 0, 0.2078431, 1, 1,
0.3855154, 0.4531501, 0.5034419, 0, 0.2039216, 1, 1,
0.3869005, 1.2147, -0.6288254, 0, 0.1960784, 1, 1,
0.3889266, 0.6339941, 0.4042507, 0, 0.1882353, 1, 1,
0.3967546, 0.3874311, 2.388782, 0, 0.1843137, 1, 1,
0.3983823, 1.59891, -0.3304873, 0, 0.1764706, 1, 1,
0.4112744, -1.336866, 2.368221, 0, 0.172549, 1, 1,
0.411944, 1.159464, 2.145026, 0, 0.1647059, 1, 1,
0.4128793, -0.1532192, 2.014807, 0, 0.1607843, 1, 1,
0.4218164, -1.350726, 2.488345, 0, 0.1529412, 1, 1,
0.4234852, 0.08788834, 1.530264, 0, 0.1490196, 1, 1,
0.426396, -0.9960481, 3.222492, 0, 0.1411765, 1, 1,
0.4287626, -0.4995791, 1.187674, 0, 0.1372549, 1, 1,
0.432272, -1.19741, 4.179331, 0, 0.1294118, 1, 1,
0.4350695, -0.5764099, 4.45525, 0, 0.1254902, 1, 1,
0.4360496, -0.4406176, 2.290128, 0, 0.1176471, 1, 1,
0.4393417, 1.197986, 1.979254, 0, 0.1137255, 1, 1,
0.440008, -0.3861504, 1.30189, 0, 0.1058824, 1, 1,
0.440121, -0.7347345, 2.321737, 0, 0.09803922, 1, 1,
0.4444559, 0.5729297, 1.409095, 0, 0.09411765, 1, 1,
0.4462512, -0.4178946, 2.585474, 0, 0.08627451, 1, 1,
0.4481473, -0.3027147, 3.272361, 0, 0.08235294, 1, 1,
0.4505083, 0.2265871, 0.9275528, 0, 0.07450981, 1, 1,
0.4541422, 1.134191, 0.5624837, 0, 0.07058824, 1, 1,
0.4584581, -0.8687344, 2.803235, 0, 0.0627451, 1, 1,
0.4605339, 0.6214935, 0.2654485, 0, 0.05882353, 1, 1,
0.463954, 0.06880397, 2.400329, 0, 0.05098039, 1, 1,
0.4640865, -0.8735224, 1.292704, 0, 0.04705882, 1, 1,
0.4700924, 0.3104712, 0.2491859, 0, 0.03921569, 1, 1,
0.4748069, 0.5437092, 0.06964236, 0, 0.03529412, 1, 1,
0.4756607, 0.951884, 0.6955729, 0, 0.02745098, 1, 1,
0.4789283, -0.713118, 2.577124, 0, 0.02352941, 1, 1,
0.4798925, -0.02372481, 1.480767, 0, 0.01568628, 1, 1,
0.4800207, -1.043341, 4.076311, 0, 0.01176471, 1, 1,
0.484436, -2.478109, 1.753216, 0, 0.003921569, 1, 1,
0.4857419, -0.6140017, 3.203728, 0.003921569, 0, 1, 1,
0.4938957, -1.442249, 2.288011, 0.007843138, 0, 1, 1,
0.4941081, -0.05900293, 0.6897524, 0.01568628, 0, 1, 1,
0.5003465, 0.6567411, 1.031373, 0.01960784, 0, 1, 1,
0.5027395, 0.1669149, 2.445924, 0.02745098, 0, 1, 1,
0.5096103, 0.5575707, 0.0680396, 0.03137255, 0, 1, 1,
0.5183686, 1.755683, 1.431489, 0.03921569, 0, 1, 1,
0.5203601, -1.569896, 2.288125, 0.04313726, 0, 1, 1,
0.520534, 0.3534837, 1.363674, 0.05098039, 0, 1, 1,
0.5206918, -0.6535664, 3.609802, 0.05490196, 0, 1, 1,
0.5214821, -2.742135, 0.3658589, 0.0627451, 0, 1, 1,
0.5254029, -2.010249, 3.108911, 0.06666667, 0, 1, 1,
0.5391841, -1.341378, 1.255681, 0.07450981, 0, 1, 1,
0.5398233, 0.4876818, 1.732823, 0.07843138, 0, 1, 1,
0.5467878, 0.6375391, 0.5070825, 0.08627451, 0, 1, 1,
0.5498729, 1.240019, 0.6180051, 0.09019608, 0, 1, 1,
0.5519372, 0.9871145, -0.3565429, 0.09803922, 0, 1, 1,
0.5523415, 0.7462961, 0.399587, 0.1058824, 0, 1, 1,
0.5549802, -1.178161, 4.322696, 0.1098039, 0, 1, 1,
0.5612392, 0.3921309, 1.198722, 0.1176471, 0, 1, 1,
0.5620522, -1.022766, 2.736698, 0.1215686, 0, 1, 1,
0.5620675, -0.1732026, -0.7735971, 0.1294118, 0, 1, 1,
0.5673249, -1.441095, 3.082721, 0.1333333, 0, 1, 1,
0.5675191, -0.5561494, 2.587103, 0.1411765, 0, 1, 1,
0.569348, -1.092001, 2.848801, 0.145098, 0, 1, 1,
0.576018, 0.9702407, -0.1116195, 0.1529412, 0, 1, 1,
0.5772724, -0.8040292, 1.861436, 0.1568628, 0, 1, 1,
0.581284, -0.658964, 3.046954, 0.1647059, 0, 1, 1,
0.5837219, -0.7564109, 2.146059, 0.1686275, 0, 1, 1,
0.5839001, -0.1649526, 1.075243, 0.1764706, 0, 1, 1,
0.5863081, 0.01819798, 1.610839, 0.1803922, 0, 1, 1,
0.5922319, 1.109355, 1.761304, 0.1882353, 0, 1, 1,
0.594755, 1.07536, -1.094364, 0.1921569, 0, 1, 1,
0.5958315, -0.318772, 2.717678, 0.2, 0, 1, 1,
0.6064311, -0.5785796, 1.935249, 0.2078431, 0, 1, 1,
0.6108402, 0.8782991, 0.4725719, 0.2117647, 0, 1, 1,
0.6160939, 1.569978, -1.027449, 0.2196078, 0, 1, 1,
0.6249703, 0.3750161, 2.249232, 0.2235294, 0, 1, 1,
0.6288713, 0.1833517, 0.9875464, 0.2313726, 0, 1, 1,
0.6326255, -0.5190529, 3.195797, 0.2352941, 0, 1, 1,
0.6362383, 1.197409, -0.1934442, 0.2431373, 0, 1, 1,
0.6366823, -0.4729969, 1.867277, 0.2470588, 0, 1, 1,
0.6391552, -1.133512, 3.558629, 0.254902, 0, 1, 1,
0.6399832, 0.7200465, 0.03980603, 0.2588235, 0, 1, 1,
0.6459337, 1.045464, -0.0489991, 0.2666667, 0, 1, 1,
0.6521243, 0.6769528, 3.399274, 0.2705882, 0, 1, 1,
0.6533441, 0.3086227, 0.9153268, 0.2784314, 0, 1, 1,
0.653716, 0.8672279, 2.174155, 0.282353, 0, 1, 1,
0.6564834, 0.4044131, 2.41401, 0.2901961, 0, 1, 1,
0.65702, 0.0002933801, 2.178554, 0.2941177, 0, 1, 1,
0.6614596, 0.655144, 0.5820721, 0.3019608, 0, 1, 1,
0.6637052, 1.148379, 0.363257, 0.3098039, 0, 1, 1,
0.6654586, -0.3864286, 2.403149, 0.3137255, 0, 1, 1,
0.6670696, 0.2032556, 2.904203, 0.3215686, 0, 1, 1,
0.6701483, 0.3346167, 0.8634076, 0.3254902, 0, 1, 1,
0.6704153, -1.470767, 2.934426, 0.3333333, 0, 1, 1,
0.6712754, 0.6164887, 1.125163, 0.3372549, 0, 1, 1,
0.6751226, -0.3241892, 1.934927, 0.345098, 0, 1, 1,
0.6774018, 1.603612, -0.2609944, 0.3490196, 0, 1, 1,
0.6805378, 1.470506, -0.3278552, 0.3568628, 0, 1, 1,
0.6814976, 1.808782, 1.335479, 0.3607843, 0, 1, 1,
0.6822107, -0.6005552, 1.617772, 0.3686275, 0, 1, 1,
0.6828721, -0.107969, 1.52293, 0.372549, 0, 1, 1,
0.6903936, 0.3252337, 1.856804, 0.3803922, 0, 1, 1,
0.6925806, -1.146033, 2.834527, 0.3843137, 0, 1, 1,
0.6992733, -0.6396086, 2.950855, 0.3921569, 0, 1, 1,
0.6996851, -2.034912, 3.19631, 0.3960784, 0, 1, 1,
0.7003463, -0.6794781, 1.800076, 0.4039216, 0, 1, 1,
0.7003954, -0.7461339, 1.507737, 0.4117647, 0, 1, 1,
0.7023529, -0.8714956, 1.924803, 0.4156863, 0, 1, 1,
0.7044795, -0.8838933, 3.209968, 0.4235294, 0, 1, 1,
0.7044936, 0.7788484, 2.363034, 0.427451, 0, 1, 1,
0.7060357, 0.1485361, 2.663696, 0.4352941, 0, 1, 1,
0.70608, 0.8347076, 1.863606, 0.4392157, 0, 1, 1,
0.7062778, 0.1606641, 2.360608, 0.4470588, 0, 1, 1,
0.708252, 0.06556101, -0.4901322, 0.4509804, 0, 1, 1,
0.7112368, -1.445034, 3.236833, 0.4588235, 0, 1, 1,
0.7128272, -0.7699562, 1.793238, 0.4627451, 0, 1, 1,
0.7190976, -0.9969959, 1.805012, 0.4705882, 0, 1, 1,
0.7214023, -0.4722393, 1.956355, 0.4745098, 0, 1, 1,
0.7243313, 0.2258528, 1.437991, 0.4823529, 0, 1, 1,
0.7304713, 0.4719378, -0.5561623, 0.4862745, 0, 1, 1,
0.7307369, 0.005326312, 1.714633, 0.4941176, 0, 1, 1,
0.7385588, -0.1084871, 1.877244, 0.5019608, 0, 1, 1,
0.73927, -0.230258, 2.284606, 0.5058824, 0, 1, 1,
0.7393999, 0.6632133, 1.90371, 0.5137255, 0, 1, 1,
0.7424011, 0.8704131, 2.631759, 0.5176471, 0, 1, 1,
0.7474979, 0.08725096, 1.028107, 0.5254902, 0, 1, 1,
0.7496812, 0.5764298, -0.721666, 0.5294118, 0, 1, 1,
0.7608425, 0.8985832, 1.495986, 0.5372549, 0, 1, 1,
0.76144, 1.55686, -0.3403528, 0.5411765, 0, 1, 1,
0.7617388, 0.08807433, 0.7250587, 0.5490196, 0, 1, 1,
0.7672184, -1.431181, 2.158808, 0.5529412, 0, 1, 1,
0.7692962, 0.9273661, -0.4475921, 0.5607843, 0, 1, 1,
0.7741072, 1.036281, 1.864312, 0.5647059, 0, 1, 1,
0.7797477, 0.1019158, 0.46565, 0.572549, 0, 1, 1,
0.7820077, -0.05990839, 1.632298, 0.5764706, 0, 1, 1,
0.782661, 0.1207941, 3.011073, 0.5843138, 0, 1, 1,
0.7866753, -0.3925291, 3.303662, 0.5882353, 0, 1, 1,
0.789531, 0.5140422, -0.2153128, 0.5960785, 0, 1, 1,
0.7909575, -2.336167, 3.650771, 0.6039216, 0, 1, 1,
0.7979022, -1.868419, 4.416384, 0.6078432, 0, 1, 1,
0.8067219, 0.3523071, 0.3185435, 0.6156863, 0, 1, 1,
0.8229129, -0.8828592, 1.480411, 0.6196079, 0, 1, 1,
0.8246862, -1.228106, 2.535759, 0.627451, 0, 1, 1,
0.8249775, 1.322086, 3.198239, 0.6313726, 0, 1, 1,
0.8264365, 0.4932263, 2.031872, 0.6392157, 0, 1, 1,
0.8313623, 1.141168, 1.10253, 0.6431373, 0, 1, 1,
0.832294, 0.4899387, 0.4990866, 0.6509804, 0, 1, 1,
0.8342396, -0.4556316, 3.293725, 0.654902, 0, 1, 1,
0.8382733, 1.98282, 1.173669, 0.6627451, 0, 1, 1,
0.8407641, 0.2451741, 1.243251, 0.6666667, 0, 1, 1,
0.8438748, -0.444053, 2.566201, 0.6745098, 0, 1, 1,
0.8499677, 0.947369, -0.05890013, 0.6784314, 0, 1, 1,
0.8548967, 0.1246725, 0.6755391, 0.6862745, 0, 1, 1,
0.8591354, -2.077877, 1.956907, 0.6901961, 0, 1, 1,
0.8598208, -0.8587714, 2.392954, 0.6980392, 0, 1, 1,
0.860291, 0.6203644, 1.93091, 0.7058824, 0, 1, 1,
0.8606084, -1.437862, 3.266237, 0.7098039, 0, 1, 1,
0.8616368, 0.9287127, 0.4348312, 0.7176471, 0, 1, 1,
0.8624076, 1.013098, 1.516988, 0.7215686, 0, 1, 1,
0.8649136, -0.3967231, 2.402997, 0.7294118, 0, 1, 1,
0.8677437, 0.649788, 3.478561, 0.7333333, 0, 1, 1,
0.875047, -0.2718557, 2.682291, 0.7411765, 0, 1, 1,
0.8753001, -1.982793, 6.128181, 0.7450981, 0, 1, 1,
0.8753148, 1.009138, 0.4079943, 0.7529412, 0, 1, 1,
0.8768447, 0.8322874, -0.08156276, 0.7568628, 0, 1, 1,
0.8817071, 0.7936286, 2.015699, 0.7647059, 0, 1, 1,
0.8838794, 0.7083011, -0.5320001, 0.7686275, 0, 1, 1,
0.8912212, 0.1324434, 1.257125, 0.7764706, 0, 1, 1,
0.8965074, 0.7420915, -0.871656, 0.7803922, 0, 1, 1,
0.9081336, -0.2551523, 2.053332, 0.7882353, 0, 1, 1,
0.9159688, -2.054886, 1.261935, 0.7921569, 0, 1, 1,
0.9205512, 0.9278331, 0.7536602, 0.8, 0, 1, 1,
0.9210377, 1.054512, -0.7208272, 0.8078431, 0, 1, 1,
0.9220852, -1.341082, 1.321715, 0.8117647, 0, 1, 1,
0.9264446, -0.1123051, 0.9438813, 0.8196079, 0, 1, 1,
0.9271428, 0.3226623, 1.575649, 0.8235294, 0, 1, 1,
0.9280305, 0.8981868, 1.704756, 0.8313726, 0, 1, 1,
0.9299124, -0.318462, 3.133165, 0.8352941, 0, 1, 1,
0.9308994, -0.4539998, 2.490171, 0.8431373, 0, 1, 1,
0.934858, -0.9021592, 3.685482, 0.8470588, 0, 1, 1,
0.9353606, -1.124832, 2.364629, 0.854902, 0, 1, 1,
0.9381741, -1.218001, 0.742749, 0.8588235, 0, 1, 1,
0.9481319, -0.1828791, 1.921157, 0.8666667, 0, 1, 1,
0.9510233, 1.966893, 1.042834, 0.8705882, 0, 1, 1,
0.9534023, 0.05102276, 0.9024522, 0.8784314, 0, 1, 1,
0.9548497, 0.9151648, 1.259202, 0.8823529, 0, 1, 1,
0.9599669, -0.2997833, 0.6684839, 0.8901961, 0, 1, 1,
0.9615989, -0.8308731, -0.1554314, 0.8941177, 0, 1, 1,
0.9666285, -0.5659101, 2.874767, 0.9019608, 0, 1, 1,
0.9669657, 0.3857445, 1.184072, 0.9098039, 0, 1, 1,
0.9702234, -1.423973, 2.596866, 0.9137255, 0, 1, 1,
0.9771028, 0.8132483, 0.5188803, 0.9215686, 0, 1, 1,
0.977833, 0.7344158, -0.03410498, 0.9254902, 0, 1, 1,
0.9836197, 0.9889933, 2.733262, 0.9333333, 0, 1, 1,
0.9974228, -1.56044, 2.336283, 0.9372549, 0, 1, 1,
0.997584, -1.105925, 2.9601, 0.945098, 0, 1, 1,
0.9985218, 1.259048, 1.452443, 0.9490196, 0, 1, 1,
0.9998454, 1.585412, 1.737316, 0.9568627, 0, 1, 1,
1.000765, 0.2852006, 0.07400405, 0.9607843, 0, 1, 1,
1.012854, -0.1901002, 0.7966552, 0.9686275, 0, 1, 1,
1.014534, 4.496371, 0.35859, 0.972549, 0, 1, 1,
1.015444, -0.1218272, 3.273486, 0.9803922, 0, 1, 1,
1.01594, 0.03046022, 2.297854, 0.9843137, 0, 1, 1,
1.023198, 1.029158, 1.433399, 0.9921569, 0, 1, 1,
1.033299, 1.085039, -0.777333, 0.9960784, 0, 1, 1,
1.033748, -0.4611225, 0.5083064, 1, 0, 0.9960784, 1,
1.043669, -0.2857032, 2.00017, 1, 0, 0.9882353, 1,
1.047223, 0.9214059, 0.360333, 1, 0, 0.9843137, 1,
1.051178, 1.05572, -0.9387612, 1, 0, 0.9764706, 1,
1.058044, 0.6999196, 0.7525946, 1, 0, 0.972549, 1,
1.061408, -0.06552617, 2.873768, 1, 0, 0.9647059, 1,
1.073101, 0.5645531, 1.091631, 1, 0, 0.9607843, 1,
1.074598, -1.267743, 3.103383, 1, 0, 0.9529412, 1,
1.079171, -0.4243598, 1.857449, 1, 0, 0.9490196, 1,
1.079254, -0.4318989, 2.594519, 1, 0, 0.9411765, 1,
1.09413, -0.3636606, 4.412871, 1, 0, 0.9372549, 1,
1.103975, 0.922352, 1.573382, 1, 0, 0.9294118, 1,
1.104091, 0.7372816, -0.1657612, 1, 0, 0.9254902, 1,
1.104576, 1.648071, 1.086344, 1, 0, 0.9176471, 1,
1.104738, 1.021283, -0.1652931, 1, 0, 0.9137255, 1,
1.105265, -0.7421455, 4.73085, 1, 0, 0.9058824, 1,
1.107283, -0.08365539, 1.894486, 1, 0, 0.9019608, 1,
1.107543, 1.404254, -0.2780351, 1, 0, 0.8941177, 1,
1.113751, 0.4285424, 2.169668, 1, 0, 0.8862745, 1,
1.114432, -0.7148781, 2.673167, 1, 0, 0.8823529, 1,
1.117239, 0.4000225, 0.4954997, 1, 0, 0.8745098, 1,
1.124745, 0.438964, 1.004887, 1, 0, 0.8705882, 1,
1.126224, 0.8932486, 0.4537029, 1, 0, 0.8627451, 1,
1.132714, -0.4717407, 1.554499, 1, 0, 0.8588235, 1,
1.136519, 0.1678408, 1.964445, 1, 0, 0.8509804, 1,
1.137326, 1.115106, 2.465848, 1, 0, 0.8470588, 1,
1.140304, -1.32897, 1.893302, 1, 0, 0.8392157, 1,
1.141056, -1.429683, 1.906214, 1, 0, 0.8352941, 1,
1.144729, -0.4278413, 3.34726, 1, 0, 0.827451, 1,
1.147423, -0.4238031, 2.2673, 1, 0, 0.8235294, 1,
1.15443, 0.2169626, 0.7656805, 1, 0, 0.8156863, 1,
1.157599, 1.913611, 0.2768357, 1, 0, 0.8117647, 1,
1.164015, -0.2388878, 0.7935659, 1, 0, 0.8039216, 1,
1.164857, 1.296798, 0.925997, 1, 0, 0.7960784, 1,
1.176898, -0.1771093, 2.054935, 1, 0, 0.7921569, 1,
1.17978, -1.415694, 3.219819, 1, 0, 0.7843137, 1,
1.191967, 2.382605, 0.8957661, 1, 0, 0.7803922, 1,
1.195929, -0.4969767, 1.526215, 1, 0, 0.772549, 1,
1.198, -0.6354426, 1.189223, 1, 0, 0.7686275, 1,
1.198183, 1.430794, 0.8743644, 1, 0, 0.7607843, 1,
1.201225, -0.3122785, 1.745337, 1, 0, 0.7568628, 1,
1.201429, 0.0670498, 0.1207129, 1, 0, 0.7490196, 1,
1.203474, 0.6994841, 1.749589, 1, 0, 0.7450981, 1,
1.212591, -1.759388, 3.572726, 1, 0, 0.7372549, 1,
1.21443, -1.200135, -0.1478086, 1, 0, 0.7333333, 1,
1.21695, 1.761603, -1.605824, 1, 0, 0.7254902, 1,
1.218808, -0.6890602, 0.8402978, 1, 0, 0.7215686, 1,
1.228711, -0.1959906, 1.627385, 1, 0, 0.7137255, 1,
1.23237, 1.353449, 1.485431, 1, 0, 0.7098039, 1,
1.234782, -0.6687592, 0.8406401, 1, 0, 0.7019608, 1,
1.25712, 0.4621567, 0.71975, 1, 0, 0.6941177, 1,
1.262362, 0.1536695, 1.830679, 1, 0, 0.6901961, 1,
1.263742, 0.1579424, 1.822141, 1, 0, 0.682353, 1,
1.270486, -2.220809, 1.924535, 1, 0, 0.6784314, 1,
1.2794, -0.1653715, 1.425245, 1, 0, 0.6705883, 1,
1.28437, -0.8758845, 2.413638, 1, 0, 0.6666667, 1,
1.286043, -1.30262, 1.720822, 1, 0, 0.6588235, 1,
1.291902, 1.59917, 0.05803839, 1, 0, 0.654902, 1,
1.296831, 2.168993, 1.960025, 1, 0, 0.6470588, 1,
1.302413, -0.6368142, 2.262052, 1, 0, 0.6431373, 1,
1.31527, 0.4678918, 1.670973, 1, 0, 0.6352941, 1,
1.326216, -2.403601, 2.756044, 1, 0, 0.6313726, 1,
1.326217, -2.254488, 4.788807, 1, 0, 0.6235294, 1,
1.328718, -0.2655912, 1.272168, 1, 0, 0.6196079, 1,
1.335636, -1.333896, 3.395072, 1, 0, 0.6117647, 1,
1.340391, 0.0994148, 2.300724, 1, 0, 0.6078432, 1,
1.342151, -1.270933, 0.7494882, 1, 0, 0.6, 1,
1.343105, -0.1040207, 2.423917, 1, 0, 0.5921569, 1,
1.351617, 1.140886, 0.2082446, 1, 0, 0.5882353, 1,
1.371752, 0.3806649, 2.269459, 1, 0, 0.5803922, 1,
1.386132, -0.4291416, 1.151955, 1, 0, 0.5764706, 1,
1.386349, -0.674204, 2.274691, 1, 0, 0.5686275, 1,
1.390489, 0.4928164, 0.0286455, 1, 0, 0.5647059, 1,
1.394504, 0.0330552, -0.09450208, 1, 0, 0.5568628, 1,
1.398731, 0.09997214, 1.785106, 1, 0, 0.5529412, 1,
1.404359, 0.8310539, 2.329946, 1, 0, 0.5450981, 1,
1.423699, -1.463984, 1.073134, 1, 0, 0.5411765, 1,
1.429562, -0.6003028, 1.400095, 1, 0, 0.5333334, 1,
1.431922, -1.299543, 0.7719351, 1, 0, 0.5294118, 1,
1.449692, -0.813037, 1.361664, 1, 0, 0.5215687, 1,
1.451643, 0.9178849, -0.14797, 1, 0, 0.5176471, 1,
1.460798, -0.9029856, 2.170305, 1, 0, 0.509804, 1,
1.468036, -0.6534229, 1.998526, 1, 0, 0.5058824, 1,
1.473049, 0.2444752, 1.693472, 1, 0, 0.4980392, 1,
1.490111, -1.210458, 1.280142, 1, 0, 0.4901961, 1,
1.493164, -0.2800191, 1.370567, 1, 0, 0.4862745, 1,
1.496385, -1.253619, 1.788721, 1, 0, 0.4784314, 1,
1.511548, -0.704437, 0.6268151, 1, 0, 0.4745098, 1,
1.536449, 1.414119, 0.6325079, 1, 0, 0.4666667, 1,
1.539074, -0.04740413, 2.678436, 1, 0, 0.4627451, 1,
1.542276, 2.616154, 0.3540555, 1, 0, 0.454902, 1,
1.544179, 0.4346617, 0.4873574, 1, 0, 0.4509804, 1,
1.556988, -0.5779046, 1.060159, 1, 0, 0.4431373, 1,
1.567274, -0.7252864, 1.230135, 1, 0, 0.4392157, 1,
1.569781, -0.1358517, 2.267074, 1, 0, 0.4313726, 1,
1.570028, 2.613502, -0.2200026, 1, 0, 0.427451, 1,
1.583657, 0.1910323, 1.902904, 1, 0, 0.4196078, 1,
1.58934, -0.8299099, 5.147916, 1, 0, 0.4156863, 1,
1.591006, -0.1643413, 1.716677, 1, 0, 0.4078431, 1,
1.614238, 0.9796674, 2.375888, 1, 0, 0.4039216, 1,
1.616255, -0.5227622, -0.6487404, 1, 0, 0.3960784, 1,
1.617103, -1.390778, 2.246043, 1, 0, 0.3882353, 1,
1.618439, -0.4091485, 2.518752, 1, 0, 0.3843137, 1,
1.619186, -0.5692959, 2.363169, 1, 0, 0.3764706, 1,
1.624943, -0.4479451, 0.2577785, 1, 0, 0.372549, 1,
1.642894, -0.8216071, 0.7289851, 1, 0, 0.3647059, 1,
1.661388, 2.174668, 1.552337, 1, 0, 0.3607843, 1,
1.666966, -0.3053328, 4.221533, 1, 0, 0.3529412, 1,
1.673923, -0.7237722, 1.82328, 1, 0, 0.3490196, 1,
1.678804, 0.3321932, 0.4462727, 1, 0, 0.3411765, 1,
1.68387, 0.2710767, 2.483324, 1, 0, 0.3372549, 1,
1.68499, -0.3844962, 1.351477, 1, 0, 0.3294118, 1,
1.704036, -0.3555326, 1.490146, 1, 0, 0.3254902, 1,
1.704761, 0.1106448, 0.4065288, 1, 0, 0.3176471, 1,
1.711623, -0.1920313, 1.022915, 1, 0, 0.3137255, 1,
1.712625, 1.158579, 2.393408, 1, 0, 0.3058824, 1,
1.735514, 0.2905883, 2.750961, 1, 0, 0.2980392, 1,
1.737471, -0.9165503, 4.066362, 1, 0, 0.2941177, 1,
1.738684, 1.644634, -0.2762026, 1, 0, 0.2862745, 1,
1.761126, 0.322271, 0.3990612, 1, 0, 0.282353, 1,
1.763921, 0.134836, 2.209381, 1, 0, 0.2745098, 1,
1.775565, 1.214625, 1.618738, 1, 0, 0.2705882, 1,
1.77593, -0.3020159, 2.527981, 1, 0, 0.2627451, 1,
1.781429, 0.1196016, 1.188146, 1, 0, 0.2588235, 1,
1.787231, 1.020745, 1.195696, 1, 0, 0.2509804, 1,
1.823825, 0.9696844, 0.1364462, 1, 0, 0.2470588, 1,
1.832141, -1.559852, 2.138994, 1, 0, 0.2392157, 1,
1.863884, -1.41192, 2.357073, 1, 0, 0.2352941, 1,
1.874619, -1.820658, 1.527603, 1, 0, 0.227451, 1,
1.882293, -0.8442019, 1.63271, 1, 0, 0.2235294, 1,
1.892671, -0.5220439, 3.064534, 1, 0, 0.2156863, 1,
1.914898, 0.009719478, 1.138947, 1, 0, 0.2117647, 1,
1.957548, -0.4212056, 4.35029, 1, 0, 0.2039216, 1,
1.961851, 0.2907681, 2.466518, 1, 0, 0.1960784, 1,
1.962853, 2.445719, 1.058975, 1, 0, 0.1921569, 1,
1.964614, -0.9947695, 1.726705, 1, 0, 0.1843137, 1,
1.970541, 1.251808, -0.09826148, 1, 0, 0.1803922, 1,
1.976691, -1.581993, 2.694996, 1, 0, 0.172549, 1,
2.030207, 0.6662414, 0.9421763, 1, 0, 0.1686275, 1,
2.050481, -0.7117962, 2.721291, 1, 0, 0.1607843, 1,
2.064387, 0.05913788, 0.7076906, 1, 0, 0.1568628, 1,
2.07821, 0.48478, -0.251949, 1, 0, 0.1490196, 1,
2.122303, 0.06669747, -0.4985064, 1, 0, 0.145098, 1,
2.122613, 0.09196591, 2.062732, 1, 0, 0.1372549, 1,
2.124611, 0.3807114, 0.09255439, 1, 0, 0.1333333, 1,
2.133947, -1.364933, 0.170123, 1, 0, 0.1254902, 1,
2.136389, 0.9807469, 0.6294613, 1, 0, 0.1215686, 1,
2.137218, 0.3968789, 0.5962547, 1, 0, 0.1137255, 1,
2.142564, -0.01132905, 0.5577649, 1, 0, 0.1098039, 1,
2.16421, -0.04620337, 2.138936, 1, 0, 0.1019608, 1,
2.17735, -0.07729083, 1.476804, 1, 0, 0.09411765, 1,
2.196638, -0.8465312, 3.062969, 1, 0, 0.09019608, 1,
2.212439, 2.141643, -0.03907085, 1, 0, 0.08235294, 1,
2.250659, 1.229189, 0.4482993, 1, 0, 0.07843138, 1,
2.256034, -0.6509293, 1.551123, 1, 0, 0.07058824, 1,
2.273223, 0.5765554, 0.5217723, 1, 0, 0.06666667, 1,
2.320387, -1.259263, 1.960467, 1, 0, 0.05882353, 1,
2.357192, -0.2440372, 2.992787, 1, 0, 0.05490196, 1,
2.362909, 1.00385, 0.4188666, 1, 0, 0.04705882, 1,
2.365306, -0.3294326, 2.9834, 1, 0, 0.04313726, 1,
2.483086, -0.0763467, 3.978686, 1, 0, 0.03529412, 1,
2.573073, 1.310668, 2.267326, 1, 0, 0.03137255, 1,
2.630038, 1.657308, 0.4966416, 1, 0, 0.02352941, 1,
2.651378, 1.064165, 0.8936971, 1, 0, 0.01960784, 1,
2.707305, 0.8486803, 0.7015554, 1, 0, 0.01176471, 1,
3.671641, 0.9537684, -0.1393572, 1, 0, 0.007843138, 1
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
0.0009156466, -5.083134, -7.248008, 0, -0.5, 0.5, 0.5,
0.0009156466, -5.083134, -7.248008, 1, -0.5, 0.5, 0.5,
0.0009156466, -5.083134, -7.248008, 1, 1.5, 0.5, 0.5,
0.0009156466, -5.083134, -7.248008, 0, 1.5, 0.5, 0.5
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
-4.914186, 0.4008151, -7.248008, 0, -0.5, 0.5, 0.5,
-4.914186, 0.4008151, -7.248008, 1, -0.5, 0.5, 0.5,
-4.914186, 0.4008151, -7.248008, 1, 1.5, 0.5, 0.5,
-4.914186, 0.4008151, -7.248008, 0, 1.5, 0.5, 0.5
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
-4.914186, -5.083134, 0.4094174, 0, -0.5, 0.5, 0.5,
-4.914186, -5.083134, 0.4094174, 1, -0.5, 0.5, 0.5,
-4.914186, -5.083134, 0.4094174, 1, 1.5, 0.5, 0.5,
-4.914186, -5.083134, 0.4094174, 0, 1.5, 0.5, 0.5
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
-2, -3.817607, -5.48091,
2, -3.817607, -5.48091,
-2, -3.817607, -5.48091,
-2, -4.028528, -5.775426,
0, -3.817607, -5.48091,
0, -4.028528, -5.775426,
2, -3.817607, -5.48091,
2, -4.028528, -5.775426
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
"0",
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
-2, -4.450371, -6.364459, 0, -0.5, 0.5, 0.5,
-2, -4.450371, -6.364459, 1, -0.5, 0.5, 0.5,
-2, -4.450371, -6.364459, 1, 1.5, 0.5, 0.5,
-2, -4.450371, -6.364459, 0, 1.5, 0.5, 0.5,
0, -4.450371, -6.364459, 0, -0.5, 0.5, 0.5,
0, -4.450371, -6.364459, 1, -0.5, 0.5, 0.5,
0, -4.450371, -6.364459, 1, 1.5, 0.5, 0.5,
0, -4.450371, -6.364459, 0, 1.5, 0.5, 0.5,
2, -4.450371, -6.364459, 0, -0.5, 0.5, 0.5,
2, -4.450371, -6.364459, 1, -0.5, 0.5, 0.5,
2, -4.450371, -6.364459, 1, 1.5, 0.5, 0.5,
2, -4.450371, -6.364459, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.779932, -2, -5.48091,
-3.779932, 4, -5.48091,
-3.779932, -2, -5.48091,
-3.968974, -2, -5.775426,
-3.779932, 0, -5.48091,
-3.968974, 0, -5.775426,
-3.779932, 2, -5.48091,
-3.968974, 2, -5.775426,
-3.779932, 4, -5.48091,
-3.968974, 4, -5.775426
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
-4.347059, -2, -6.364459, 0, -0.5, 0.5, 0.5,
-4.347059, -2, -6.364459, 1, -0.5, 0.5, 0.5,
-4.347059, -2, -6.364459, 1, 1.5, 0.5, 0.5,
-4.347059, -2, -6.364459, 0, 1.5, 0.5, 0.5,
-4.347059, 0, -6.364459, 0, -0.5, 0.5, 0.5,
-4.347059, 0, -6.364459, 1, -0.5, 0.5, 0.5,
-4.347059, 0, -6.364459, 1, 1.5, 0.5, 0.5,
-4.347059, 0, -6.364459, 0, 1.5, 0.5, 0.5,
-4.347059, 2, -6.364459, 0, -0.5, 0.5, 0.5,
-4.347059, 2, -6.364459, 1, -0.5, 0.5, 0.5,
-4.347059, 2, -6.364459, 1, 1.5, 0.5, 0.5,
-4.347059, 2, -6.364459, 0, 1.5, 0.5, 0.5,
-4.347059, 4, -6.364459, 0, -0.5, 0.5, 0.5,
-4.347059, 4, -6.364459, 1, -0.5, 0.5, 0.5,
-4.347059, 4, -6.364459, 1, 1.5, 0.5, 0.5,
-4.347059, 4, -6.364459, 0, 1.5, 0.5, 0.5
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
-3.779932, -3.817607, -4,
-3.779932, -3.817607, 6,
-3.779932, -3.817607, -4,
-3.968974, -4.028528, -4,
-3.779932, -3.817607, -2,
-3.968974, -4.028528, -2,
-3.779932, -3.817607, 0,
-3.968974, -4.028528, 0,
-3.779932, -3.817607, 2,
-3.968974, -4.028528, 2,
-3.779932, -3.817607, 4,
-3.968974, -4.028528, 4,
-3.779932, -3.817607, 6,
-3.968974, -4.028528, 6
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
"4",
"6"
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
-4.347059, -4.450371, -4, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, -4, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, -4, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, -4, 0, 1.5, 0.5, 0.5,
-4.347059, -4.450371, -2, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, -2, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, -2, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, -2, 0, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 0, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 0, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 0, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 0, 0, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 2, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 2, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 2, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 2, 0, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 4, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 4, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 4, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 4, 0, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 6, 0, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 6, 1, -0.5, 0.5, 0.5,
-4.347059, -4.450371, 6, 1, 1.5, 0.5, 0.5,
-4.347059, -4.450371, 6, 0, 1.5, 0.5, 0.5
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
-3.779932, -3.817607, -5.48091,
-3.779932, 4.619237, -5.48091,
-3.779932, -3.817607, 6.299745,
-3.779932, 4.619237, 6.299745,
-3.779932, -3.817607, -5.48091,
-3.779932, -3.817607, 6.299745,
-3.779932, 4.619237, -5.48091,
-3.779932, 4.619237, 6.299745,
-3.779932, -3.817607, -5.48091,
3.781763, -3.817607, -5.48091,
-3.779932, -3.817607, 6.299745,
3.781763, -3.817607, 6.299745,
-3.779932, 4.619237, -5.48091,
3.781763, 4.619237, -5.48091,
-3.779932, 4.619237, 6.299745,
3.781763, 4.619237, 6.299745,
3.781763, -3.817607, -5.48091,
3.781763, 4.619237, -5.48091,
3.781763, -3.817607, 6.299745,
3.781763, 4.619237, 6.299745,
3.781763, -3.817607, -5.48091,
3.781763, -3.817607, 6.299745,
3.781763, 4.619237, -5.48091,
3.781763, 4.619237, 6.299745
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
var radius = 8.727657;
var distance = 38.83033;
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
mvMatrix.translate( -0.0009156466, -0.4008151, -0.4094174 );
mvMatrix.scale( 1.247936, 1.118489, 0.8010178 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.83033);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Chlorobromuron<-read.table("Chlorobromuron.xyz", skip=1)
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
-3.66981, -1.376292, -3.134487, 0, 0, 1, 1, 1,
-3.262919, 1.259666, -1.693018, 1, 0, 0, 1, 1,
-3.086682, 1.922945, -0.5748156, 1, 0, 0, 1, 1,
-2.938828, 1.645865, -3.175118, 1, 0, 0, 1, 1,
-2.734811, -1.156938, -0.7922236, 1, 0, 0, 1, 1,
-2.733613, -0.6954123, -2.496859, 1, 0, 0, 1, 1,
-2.696772, 0.9425728, -1.108658, 0, 0, 0, 1, 1,
-2.63062, -0.8027361, -2.589146, 0, 0, 0, 1, 1,
-2.573578, 0.08619023, -1.410329, 0, 0, 0, 1, 1,
-2.529916, 0.8831657, -2.966129, 0, 0, 0, 1, 1,
-2.521501, 1.178, -1.153478, 0, 0, 0, 1, 1,
-2.491425, 0.1849161, 0.1505234, 0, 0, 0, 1, 1,
-2.376339, -0.6051621, -2.308309, 0, 0, 0, 1, 1,
-2.37121, 0.0758692, -1.793255, 1, 1, 1, 1, 1,
-2.357597, -0.8753268, -2.130806, 1, 1, 1, 1, 1,
-2.283998, -0.2724599, -0.7431985, 1, 1, 1, 1, 1,
-2.243019, 1.004972, -0.7280589, 1, 1, 1, 1, 1,
-2.230738, 1.032421, -1.126171, 1, 1, 1, 1, 1,
-2.20975, 1.895515, -0.6239255, 1, 1, 1, 1, 1,
-2.192353, 1.533081, 0.465591, 1, 1, 1, 1, 1,
-2.154581, -0.7925146, -1.115207, 1, 1, 1, 1, 1,
-2.153711, -0.3458911, -2.057273, 1, 1, 1, 1, 1,
-2.145123, 1.107624, -2.8397, 1, 1, 1, 1, 1,
-2.145103, -0.703381, -1.721542, 1, 1, 1, 1, 1,
-2.125184, 0.3824134, -1.442112, 1, 1, 1, 1, 1,
-2.097904, -0.4049381, -2.496634, 1, 1, 1, 1, 1,
-2.097031, 0.5074198, -1.289325, 1, 1, 1, 1, 1,
-2.06423, -0.09853608, 0.08577611, 1, 1, 1, 1, 1,
-2.060612, 1.136024, -3.220717, 0, 0, 1, 1, 1,
-2.012597, -0.1471841, -1.194649, 1, 0, 0, 1, 1,
-1.965691, -1.968014, -0.1923331, 1, 0, 0, 1, 1,
-1.94108, 0.3995489, -3.733104, 1, 0, 0, 1, 1,
-1.940404, 0.4725409, -0.9484715, 1, 0, 0, 1, 1,
-1.922485, 0.6112624, -1.422365, 1, 0, 0, 1, 1,
-1.911225, -2.455586, -0.8662525, 0, 0, 0, 1, 1,
-1.889124, -0.2610579, -0.2795898, 0, 0, 0, 1, 1,
-1.875225, -0.5597988, -2.358685, 0, 0, 0, 1, 1,
-1.830368, 1.558218, -0.4312097, 0, 0, 0, 1, 1,
-1.80969, -0.8958225, -0.9485897, 0, 0, 0, 1, 1,
-1.804842, 1.175595, -0.1519658, 0, 0, 0, 1, 1,
-1.803295, -2.07492, -1.627724, 0, 0, 0, 1, 1,
-1.767156, 0.8604608, -0.5572723, 1, 1, 1, 1, 1,
-1.765731, 0.9393142, -1.63056, 1, 1, 1, 1, 1,
-1.758343, 0.6004314, -0.2337056, 1, 1, 1, 1, 1,
-1.754757, 0.6703882, -1.756336, 1, 1, 1, 1, 1,
-1.745183, -1.168652, -1.010818, 1, 1, 1, 1, 1,
-1.717301, 1.075267, -2.36932, 1, 1, 1, 1, 1,
-1.71705, -1.69313, -2.13219, 1, 1, 1, 1, 1,
-1.709933, 1.157711, -2.837848, 1, 1, 1, 1, 1,
-1.7093, 1.456854, -0.2200334, 1, 1, 1, 1, 1,
-1.693574, 1.235067, -1.451274, 1, 1, 1, 1, 1,
-1.690146, -0.4199792, -2.634941, 1, 1, 1, 1, 1,
-1.680001, -0.8461377, -1.918979, 1, 1, 1, 1, 1,
-1.675225, -0.7909255, -3.060474, 1, 1, 1, 1, 1,
-1.672624, 2.025768, -2.445089, 1, 1, 1, 1, 1,
-1.668733, 1.426358, 0.3000281, 1, 1, 1, 1, 1,
-1.665259, 0.6907846, -2.067162, 0, 0, 1, 1, 1,
-1.646942, 0.3986022, -3.318727, 1, 0, 0, 1, 1,
-1.642388, 1.45961, -0.720068, 1, 0, 0, 1, 1,
-1.62086, -0.4294642, -0.5324365, 1, 0, 0, 1, 1,
-1.618206, -1.390364, -2.104698, 1, 0, 0, 1, 1,
-1.60474, -0.07754773, -2.035438, 1, 0, 0, 1, 1,
-1.599213, -0.5800662, -2.177189, 0, 0, 0, 1, 1,
-1.599202, -0.7634333, -0.8385704, 0, 0, 0, 1, 1,
-1.580894, -0.02176162, -2.530499, 0, 0, 0, 1, 1,
-1.569984, -0.9608191, -3.042162, 0, 0, 0, 1, 1,
-1.533868, -1.029068, -2.120948, 0, 0, 0, 1, 1,
-1.5173, -0.0289451, -0.7115891, 0, 0, 0, 1, 1,
-1.516545, -0.9404117, -3.472117, 0, 0, 0, 1, 1,
-1.514319, -2.415166, -2.813057, 1, 1, 1, 1, 1,
-1.503445, -0.8201299, -1.496838, 1, 1, 1, 1, 1,
-1.499543, 0.5475103, -0.9373851, 1, 1, 1, 1, 1,
-1.494319, -0.4293014, -0.7402949, 1, 1, 1, 1, 1,
-1.48479, 0.36821, -0.9891722, 1, 1, 1, 1, 1,
-1.478088, -0.3477917, -2.429568, 1, 1, 1, 1, 1,
-1.465913, -0.2397793, -2.770547, 1, 1, 1, 1, 1,
-1.456338, -1.164394, -2.746501, 1, 1, 1, 1, 1,
-1.454928, 0.9484035, -0.4939207, 1, 1, 1, 1, 1,
-1.452077, 1.376938, -0.3027422, 1, 1, 1, 1, 1,
-1.427942, 3.140551, -0.4745711, 1, 1, 1, 1, 1,
-1.414956, 0.026762, -2.148054, 1, 1, 1, 1, 1,
-1.408681, -2.304846, -2.594496, 1, 1, 1, 1, 1,
-1.403613, 0.7667422, -1.950405, 1, 1, 1, 1, 1,
-1.401544, 1.979835, -0.3924667, 1, 1, 1, 1, 1,
-1.398161, -0.2726336, -1.198458, 0, 0, 1, 1, 1,
-1.380716, 0.839874, -1.674426, 1, 0, 0, 1, 1,
-1.377321, -0.08352944, -2.625892, 1, 0, 0, 1, 1,
-1.366461, -0.01370046, -1.380409, 1, 0, 0, 1, 1,
-1.359572, 0.2215944, -2.13223, 1, 0, 0, 1, 1,
-1.353109, 0.3788279, -1.938078, 1, 0, 0, 1, 1,
-1.347768, 0.265878, -0.7450619, 0, 0, 0, 1, 1,
-1.346269, -0.05638435, -3.076018, 0, 0, 0, 1, 1,
-1.343475, -0.5570804, -2.701619, 0, 0, 0, 1, 1,
-1.339804, -0.05984453, -2.568892, 0, 0, 0, 1, 1,
-1.326579, -0.4039868, -2.457985, 0, 0, 0, 1, 1,
-1.321409, 0.6551591, -0.7023018, 0, 0, 0, 1, 1,
-1.304475, -0.6621039, -2.922423, 0, 0, 0, 1, 1,
-1.303434, -0.5800776, -1.372754, 1, 1, 1, 1, 1,
-1.302388, 0.6170945, -1.136784, 1, 1, 1, 1, 1,
-1.297895, -0.01087794, -3.236692, 1, 1, 1, 1, 1,
-1.269993, 1.020279, -0.2737209, 1, 1, 1, 1, 1,
-1.261475, 1.817762, -1.249766, 1, 1, 1, 1, 1,
-1.254277, -0.8679701, -0.8730552, 1, 1, 1, 1, 1,
-1.249697, -0.4424942, -2.955871, 1, 1, 1, 1, 1,
-1.246695, -0.7489106, -3.090951, 1, 1, 1, 1, 1,
-1.242245, -0.2508107, -0.6375307, 1, 1, 1, 1, 1,
-1.235596, 0.3479679, -0.3553785, 1, 1, 1, 1, 1,
-1.231872, -0.5492749, -3.195481, 1, 1, 1, 1, 1,
-1.222584, -0.7135482, -1.858192, 1, 1, 1, 1, 1,
-1.219891, 1.001698, -0.5691518, 1, 1, 1, 1, 1,
-1.208128, 0.4148709, -1.535715, 1, 1, 1, 1, 1,
-1.202169, 0.6376626, -0.1956963, 1, 1, 1, 1, 1,
-1.194394, 0.400298, -0.2187898, 0, 0, 1, 1, 1,
-1.192964, 0.5045925, -0.6236754, 1, 0, 0, 1, 1,
-1.187754, 1.570877, -0.5400143, 1, 0, 0, 1, 1,
-1.18313, -0.3766958, -0.5509976, 1, 0, 0, 1, 1,
-1.180974, 0.03165936, -0.07200512, 1, 0, 0, 1, 1,
-1.174958, -1.663298, -0.7291585, 1, 0, 0, 1, 1,
-1.173069, 0.7594931, -1.740754, 0, 0, 0, 1, 1,
-1.169822, 0.8671252, 0.1205175, 0, 0, 0, 1, 1,
-1.168038, -0.7021756, -2.18852, 0, 0, 0, 1, 1,
-1.167513, -0.4025019, -2.556983, 0, 0, 0, 1, 1,
-1.167019, -1.318272, -1.371271, 0, 0, 0, 1, 1,
-1.158034, -0.3243918, -2.369772, 0, 0, 0, 1, 1,
-1.153192, 0.3046166, -2.166907, 0, 0, 0, 1, 1,
-1.144205, 0.7902724, -1.349191, 1, 1, 1, 1, 1,
-1.143971, 1.095313, -0.01362782, 1, 1, 1, 1, 1,
-1.137773, -0.7747769, -1.328585, 1, 1, 1, 1, 1,
-1.132634, -0.6166256, -0.6241558, 1, 1, 1, 1, 1,
-1.124119, -0.1110074, -2.315736, 1, 1, 1, 1, 1,
-1.118377, -0.624712, -2.871202, 1, 1, 1, 1, 1,
-1.116989, -0.7673106, -2.253994, 1, 1, 1, 1, 1,
-1.113752, 0.3257632, -1.753947, 1, 1, 1, 1, 1,
-1.108179, -0.5320951, -3.017603, 1, 1, 1, 1, 1,
-1.107537, -1.222419, -4.904784, 1, 1, 1, 1, 1,
-1.101131, -0.7542396, -3.03942, 1, 1, 1, 1, 1,
-1.095219, -0.0222517, -0.5439748, 1, 1, 1, 1, 1,
-1.094051, -1.525953, -4.275587, 1, 1, 1, 1, 1,
-1.084713, -1.504047, -4.041069, 1, 1, 1, 1, 1,
-1.082569, 0.2054728, 0.09296645, 1, 1, 1, 1, 1,
-1.077363, 0.3971308, -1.071608, 0, 0, 1, 1, 1,
-1.073452, 0.6736432, 1.069439, 1, 0, 0, 1, 1,
-1.07231, -0.7847415, -4.683669, 1, 0, 0, 1, 1,
-1.071033, 0.8676519, -0.7794983, 1, 0, 0, 1, 1,
-1.061254, 0.06356943, -1.242236, 1, 0, 0, 1, 1,
-1.060826, -3.694741, -4.347311, 1, 0, 0, 1, 1,
-1.056828, 2.189862, 0.2006278, 0, 0, 0, 1, 1,
-1.050877, -2.113009, -3.689095, 0, 0, 0, 1, 1,
-1.04982, -0.8703281, -0.8817305, 0, 0, 0, 1, 1,
-1.044724, -1.227658, -2.628382, 0, 0, 0, 1, 1,
-1.039812, 0.8037856, -0.3412435, 0, 0, 0, 1, 1,
-1.034428, 0.5869863, -0.3189015, 0, 0, 0, 1, 1,
-1.029559, -0.3896686, -2.718337, 0, 0, 0, 1, 1,
-1.027964, -1.990152, -2.710246, 1, 1, 1, 1, 1,
-1.024678, -2.377913, -1.752336, 1, 1, 1, 1, 1,
-1.024383, 0.369388, -1.733581, 1, 1, 1, 1, 1,
-1.023912, -1.120605, -4.031366, 1, 1, 1, 1, 1,
-1.014621, 1.711983, -0.3063866, 1, 1, 1, 1, 1,
-1.013832, 0.2062946, -0.7385879, 1, 1, 1, 1, 1,
-1.01158, -0.7108806, -1.458625, 1, 1, 1, 1, 1,
-1.007359, 0.8412673, -0.7614779, 1, 1, 1, 1, 1,
-1.00735, -1.93422, -2.388903, 1, 1, 1, 1, 1,
-1.002284, 1.036124, -0.7328283, 1, 1, 1, 1, 1,
-1.000507, -0.6225989, -1.257388, 1, 1, 1, 1, 1,
-0.9933248, 0.4923308, -0.9188394, 1, 1, 1, 1, 1,
-0.9928091, 0.5036235, -1.158419, 1, 1, 1, 1, 1,
-0.98841, 0.02217237, -1.123834, 1, 1, 1, 1, 1,
-0.9880947, 1.861893, -0.4136484, 1, 1, 1, 1, 1,
-0.9864287, 1.363613, -1.382306, 0, 0, 1, 1, 1,
-0.9852105, -1.609646, -1.687016, 1, 0, 0, 1, 1,
-0.9821837, 0.488952, -2.287766, 1, 0, 0, 1, 1,
-0.9819873, -0.2373377, -2.299966, 1, 0, 0, 1, 1,
-0.9783541, -1.628524, -3.964048, 1, 0, 0, 1, 1,
-0.9746171, 0.7855887, -1.708949, 1, 0, 0, 1, 1,
-0.9714232, -0.8390191, -1.344035, 0, 0, 0, 1, 1,
-0.9685336, -0.6776291, -1.773802, 0, 0, 0, 1, 1,
-0.9625099, 0.7046096, 0.08595439, 0, 0, 0, 1, 1,
-0.9604734, -0.4447648, -2.32679, 0, 0, 0, 1, 1,
-0.9548231, -0.3946775, -1.115225, 0, 0, 0, 1, 1,
-0.9540197, 0.4417764, -1.719544, 0, 0, 0, 1, 1,
-0.9515278, 0.7941438, 0.5640633, 0, 0, 0, 1, 1,
-0.9425438, -0.5276917, -2.411607, 1, 1, 1, 1, 1,
-0.9336089, 0.2169172, -1.026483, 1, 1, 1, 1, 1,
-0.9300823, -0.3722059, -3.000284, 1, 1, 1, 1, 1,
-0.9179634, -1.410111, -3.338427, 1, 1, 1, 1, 1,
-0.916842, 0.8262931, -2.183564, 1, 1, 1, 1, 1,
-0.9117165, -1.866308, -3.564869, 1, 1, 1, 1, 1,
-0.905225, 0.4850514, -0.6350976, 1, 1, 1, 1, 1,
-0.9026872, 0.08491058, -1.727037, 1, 1, 1, 1, 1,
-0.8978765, -0.7914428, -1.876767, 1, 1, 1, 1, 1,
-0.8969906, 0.6098259, -1.959414, 1, 1, 1, 1, 1,
-0.8926615, -2.164002, -4.710548, 1, 1, 1, 1, 1,
-0.8794001, -0.4087774, -0.5143551, 1, 1, 1, 1, 1,
-0.8790654, -0.8925185, -1.808215, 1, 1, 1, 1, 1,
-0.8779028, -0.5321345, -2.293858, 1, 1, 1, 1, 1,
-0.8731834, 1.089141, 0.4046528, 1, 1, 1, 1, 1,
-0.8710244, 1.167089, -0.4793161, 0, 0, 1, 1, 1,
-0.8708906, -0.6053776, -0.1056633, 1, 0, 0, 1, 1,
-0.8700832, 2.274351, -1.374772, 1, 0, 0, 1, 1,
-0.8663236, -1.395393, -1.659035, 1, 0, 0, 1, 1,
-0.8612286, 0.6788893, -0.4106174, 1, 0, 0, 1, 1,
-0.8609132, 0.2731098, -1.330048, 1, 0, 0, 1, 1,
-0.8593658, -1.094997, -2.02316, 0, 0, 0, 1, 1,
-0.8562939, -0.3991061, -1.494681, 0, 0, 0, 1, 1,
-0.8557258, -0.0942141, -2.473219, 0, 0, 0, 1, 1,
-0.8551683, 1.08386, 0.2454118, 0, 0, 0, 1, 1,
-0.8531663, 0.2517339, -1.812953, 0, 0, 0, 1, 1,
-0.8502027, 1.168217, -2.16587, 0, 0, 0, 1, 1,
-0.844565, -0.03276942, -2.817095, 0, 0, 0, 1, 1,
-0.8441535, 1.078496, -3.548554, 1, 1, 1, 1, 1,
-0.840072, -1.527255, -1.138125, 1, 1, 1, 1, 1,
-0.8376709, 0.4629858, -1.19392, 1, 1, 1, 1, 1,
-0.8342192, -0.4259758, -3.259186, 1, 1, 1, 1, 1,
-0.8274294, -0.5855114, -2.989361, 1, 1, 1, 1, 1,
-0.8268095, -0.4029195, -3.420357, 1, 1, 1, 1, 1,
-0.8244812, 0.9358233, 0.05287249, 1, 1, 1, 1, 1,
-0.8218249, -0.8184471, -3.466705, 1, 1, 1, 1, 1,
-0.8178711, 1.394521, -1.242195, 1, 1, 1, 1, 1,
-0.8175691, -0.1962389, -1.294614, 1, 1, 1, 1, 1,
-0.8062465, -0.7098234, -1.216405, 1, 1, 1, 1, 1,
-0.8048242, -0.1288349, -1.628738, 1, 1, 1, 1, 1,
-0.8000869, 0.2709481, -1.059871, 1, 1, 1, 1, 1,
-0.7976486, 0.7888983, -0.3737931, 1, 1, 1, 1, 1,
-0.7952791, -0.5947177, -2.382054, 1, 1, 1, 1, 1,
-0.7932082, 0.8041666, 0.4507742, 0, 0, 1, 1, 1,
-0.7860316, -0.3453911, -2.817296, 1, 0, 0, 1, 1,
-0.7821867, 0.1009867, -0.4049352, 1, 0, 0, 1, 1,
-0.7806237, -0.2202313, -1.067191, 1, 0, 0, 1, 1,
-0.780196, 0.5686094, -2.190386, 1, 0, 0, 1, 1,
-0.7785255, -0.4832369, -2.091289, 1, 0, 0, 1, 1,
-0.7758396, -1.142685, -2.582731, 0, 0, 0, 1, 1,
-0.7745516, 0.5207669, 0.04156177, 0, 0, 0, 1, 1,
-0.7744079, 1.119742, -0.6140673, 0, 0, 0, 1, 1,
-0.7640889, 0.04600179, -0.9901499, 0, 0, 0, 1, 1,
-0.7616904, 0.642279, -0.7839656, 0, 0, 0, 1, 1,
-0.7596867, 0.9914788, 0.1780149, 0, 0, 0, 1, 1,
-0.7585935, -1.879691, -2.792688, 0, 0, 0, 1, 1,
-0.7544816, -1.495996, -1.328954, 1, 1, 1, 1, 1,
-0.7391257, -0.6106911, -2.198486, 1, 1, 1, 1, 1,
-0.7388748, 0.04336141, -1.695361, 1, 1, 1, 1, 1,
-0.7289937, -0.453778, -2.737691, 1, 1, 1, 1, 1,
-0.7289116, 0.9961311, -0.5860127, 1, 1, 1, 1, 1,
-0.7239596, -0.9814596, -2.345669, 1, 1, 1, 1, 1,
-0.719694, -1.411969, -2.816786, 1, 1, 1, 1, 1,
-0.7131154, -0.2852417, -3.471369, 1, 1, 1, 1, 1,
-0.7108654, 2.234076, -1.376622, 1, 1, 1, 1, 1,
-0.7094007, -0.9095477, -0.1453017, 1, 1, 1, 1, 1,
-0.707871, -1.126752, -2.606972, 1, 1, 1, 1, 1,
-0.7067125, 0.2256712, -1.067705, 1, 1, 1, 1, 1,
-0.6991231, 1.18605, -0.0823004, 1, 1, 1, 1, 1,
-0.6916407, 0.7579767, -2.353128, 1, 1, 1, 1, 1,
-0.683714, -0.3127967, -0.2053408, 1, 1, 1, 1, 1,
-0.6779096, 0.7378085, -1.418074, 0, 0, 1, 1, 1,
-0.6753735, -0.7823761, -3.761004, 1, 0, 0, 1, 1,
-0.6749884, 0.4842241, -1.384855, 1, 0, 0, 1, 1,
-0.6731758, -0.7701354, -2.475475, 1, 0, 0, 1, 1,
-0.6703227, 1.929987, -0.3915077, 1, 0, 0, 1, 1,
-0.6691283, 0.1619845, -3.89774, 1, 0, 0, 1, 1,
-0.6679887, -0.1214551, -0.9607377, 0, 0, 0, 1, 1,
-0.6654437, -0.9221342, -1.807481, 0, 0, 0, 1, 1,
-0.6647421, -0.991843, -2.196926, 0, 0, 0, 1, 1,
-0.6624195, -1.533987, -3.354406, 0, 0, 0, 1, 1,
-0.6618063, 2.193703, 1.49974, 0, 0, 0, 1, 1,
-0.6586655, -0.5851675, -2.010602, 0, 0, 0, 1, 1,
-0.6555142, 0.5672365, -0.479537, 0, 0, 0, 1, 1,
-0.6508169, -0.1377603, -2.547905, 1, 1, 1, 1, 1,
-0.6500648, -0.0734951, -2.395812, 1, 1, 1, 1, 1,
-0.6497849, -1.322372, -1.225369, 1, 1, 1, 1, 1,
-0.6460733, -0.1744769, -1.105687, 1, 1, 1, 1, 1,
-0.6445001, -1.701452, -3.682572, 1, 1, 1, 1, 1,
-0.6442454, -1.836353, -3.154429, 1, 1, 1, 1, 1,
-0.6439925, -0.5734806, -2.017685, 1, 1, 1, 1, 1,
-0.6425872, 0.07640108, -0.6516019, 1, 1, 1, 1, 1,
-0.6422, -0.1041331, -4.189827, 1, 1, 1, 1, 1,
-0.6375943, -0.6029301, -2.311929, 1, 1, 1, 1, 1,
-0.6335562, 0.1747856, -1.238452, 1, 1, 1, 1, 1,
-0.6267359, -0.01071701, -1.115552, 1, 1, 1, 1, 1,
-0.6241084, 0.6174714, -0.3251041, 1, 1, 1, 1, 1,
-0.6240906, 0.3288712, -0.3730903, 1, 1, 1, 1, 1,
-0.6232859, -0.8341882, -2.235161, 1, 1, 1, 1, 1,
-0.6153063, 0.9866757, -0.4700149, 0, 0, 1, 1, 1,
-0.6114536, 1.655069, -1.953095, 1, 0, 0, 1, 1,
-0.6092362, -1.204205, -1.708561, 1, 0, 0, 1, 1,
-0.6090707, 0.5049773, -1.527137, 1, 0, 0, 1, 1,
-0.6060994, -0.07908518, -1.861487, 1, 0, 0, 1, 1,
-0.6055001, 0.9848542, -1.803943, 1, 0, 0, 1, 1,
-0.6029167, 1.081414, -0.01690678, 0, 0, 0, 1, 1,
-0.5981742, -1.684252, -3.377224, 0, 0, 0, 1, 1,
-0.5922861, 0.3984614, 0.7217519, 0, 0, 0, 1, 1,
-0.5888032, -0.4892401, -0.8129727, 0, 0, 0, 1, 1,
-0.5875771, -0.5374588, -2.606658, 0, 0, 0, 1, 1,
-0.5863234, 0.7709659, -0.2059732, 0, 0, 0, 1, 1,
-0.5791033, 0.7566471, -1.062671, 0, 0, 0, 1, 1,
-0.5756846, 1.925691, 0.1280006, 1, 1, 1, 1, 1,
-0.561673, 0.2609838, -1.043882, 1, 1, 1, 1, 1,
-0.5600443, -1.688781, -3.822825, 1, 1, 1, 1, 1,
-0.5560253, -1.271068, -3.673149, 1, 1, 1, 1, 1,
-0.552943, -0.2247159, -1.484433, 1, 1, 1, 1, 1,
-0.5521833, -1.240116, -2.415895, 1, 1, 1, 1, 1,
-0.5517718, 1.233902, -0.437654, 1, 1, 1, 1, 1,
-0.5496576, 0.4830732, 0.618354, 1, 1, 1, 1, 1,
-0.548991, 0.3536503, -0.1023269, 1, 1, 1, 1, 1,
-0.5487177, 0.9987378, 0.06356324, 1, 1, 1, 1, 1,
-0.5482179, -0.7289112, -3.796788, 1, 1, 1, 1, 1,
-0.5447428, -0.4272078, -1.88037, 1, 1, 1, 1, 1,
-0.5394973, -0.271698, -2.345495, 1, 1, 1, 1, 1,
-0.5354689, 1.335207, 0.4577156, 1, 1, 1, 1, 1,
-0.5351788, -0.09765291, -2.301986, 1, 1, 1, 1, 1,
-0.5332386, 0.2011622, -1.939774, 0, 0, 1, 1, 1,
-0.5329629, -2.015902, -2.334797, 1, 0, 0, 1, 1,
-0.532081, -0.5428233, -1.690305, 1, 0, 0, 1, 1,
-0.5193014, 0.8348529, -0.3907314, 1, 0, 0, 1, 1,
-0.518575, -1.414744, -3.598505, 1, 0, 0, 1, 1,
-0.5168942, -0.1377252, -2.939093, 1, 0, 0, 1, 1,
-0.5148601, 1.066949, 0.7829195, 0, 0, 0, 1, 1,
-0.5103378, 0.02862305, -0.0880016, 0, 0, 0, 1, 1,
-0.5075766, 1.415921, -0.8597437, 0, 0, 0, 1, 1,
-0.5054291, -0.002192897, -2.476791, 0, 0, 0, 1, 1,
-0.5039026, 0.03835366, -0.8748198, 0, 0, 0, 1, 1,
-0.50166, -0.05600476, -0.4365149, 0, 0, 0, 1, 1,
-0.497209, 1.539462, 1.053686, 0, 0, 0, 1, 1,
-0.495405, 1.240524, -0.5747178, 1, 1, 1, 1, 1,
-0.4908887, -0.6285106, -2.743649, 1, 1, 1, 1, 1,
-0.4899475, 0.1586039, -0.7700301, 1, 1, 1, 1, 1,
-0.4896491, -1.988328, -2.010267, 1, 1, 1, 1, 1,
-0.4860955, 0.6275222, -0.01615288, 1, 1, 1, 1, 1,
-0.4833875, -0.3015149, -2.157503, 1, 1, 1, 1, 1,
-0.4807993, 0.3555748, -0.1832938, 1, 1, 1, 1, 1,
-0.4758563, -0.3044373, -0.7007044, 1, 1, 1, 1, 1,
-0.4715751, 0.1598909, -1.282556, 1, 1, 1, 1, 1,
-0.4715015, 0.8543788, 1.023592, 1, 1, 1, 1, 1,
-0.4597107, -0.8786807, -4.566535, 1, 1, 1, 1, 1,
-0.4566622, -0.5198479, -2.940362, 1, 1, 1, 1, 1,
-0.4544061, -2.025234, -2.286673, 1, 1, 1, 1, 1,
-0.4481856, -0.1359389, -1.148156, 1, 1, 1, 1, 1,
-0.447139, -1.307904, -3.525713, 1, 1, 1, 1, 1,
-0.4455244, -1.462195, -5.19482, 0, 0, 1, 1, 1,
-0.4451737, -0.2007619, -2.701327, 1, 0, 0, 1, 1,
-0.4394267, 1.648522, 1.118584, 1, 0, 0, 1, 1,
-0.437304, 3.086608, -0.6890994, 1, 0, 0, 1, 1,
-0.4284129, 1.838444, -0.0140274, 1, 0, 0, 1, 1,
-0.4235228, 1.008458, -0.07631844, 1, 0, 0, 1, 1,
-0.4200383, 0.2103634, -2.552295, 0, 0, 0, 1, 1,
-0.4157189, -0.8534474, -1.281193, 0, 0, 0, 1, 1,
-0.4147474, 0.678795, -1.631675, 0, 0, 0, 1, 1,
-0.4128731, -2.097366, -4.545744, 0, 0, 0, 1, 1,
-0.4117264, -1.072486, -2.43497, 0, 0, 0, 1, 1,
-0.4110109, 1.060019, 1.679989, 0, 0, 0, 1, 1,
-0.4044656, 0.4158101, -2.000681, 0, 0, 0, 1, 1,
-0.3973124, 0.3893559, -0.7039113, 1, 1, 1, 1, 1,
-0.3962102, -0.7430682, -1.323111, 1, 1, 1, 1, 1,
-0.390323, 1.366307, -0.6532029, 1, 1, 1, 1, 1,
-0.389823, 0.4315839, -1.427062, 1, 1, 1, 1, 1,
-0.3809794, 1.029967, -0.9932531, 1, 1, 1, 1, 1,
-0.3792357, 0.08571947, 1.141366, 1, 1, 1, 1, 1,
-0.3737191, 0.5110488, -0.01862793, 1, 1, 1, 1, 1,
-0.3734255, 0.262056, -1.334762, 1, 1, 1, 1, 1,
-0.3734157, 1.14618, -1.814828, 1, 1, 1, 1, 1,
-0.3685795, -2.305633, -4.114092, 1, 1, 1, 1, 1,
-0.3655662, -1.192574, -3.264319, 1, 1, 1, 1, 1,
-0.3532966, 0.496063, 0.002378403, 1, 1, 1, 1, 1,
-0.3464077, -0.8744906, -3.37155, 1, 1, 1, 1, 1,
-0.3457498, 0.425685, -0.3380627, 1, 1, 1, 1, 1,
-0.3451281, 0.3703064, 0.1236127, 1, 1, 1, 1, 1,
-0.3441976, 0.9148189, 0.6885925, 0, 0, 1, 1, 1,
-0.3437569, -1.41064, -3.497592, 1, 0, 0, 1, 1,
-0.341963, -1.130126, -1.979185, 1, 0, 0, 1, 1,
-0.3363108, -1.042541, -4.6242, 1, 0, 0, 1, 1,
-0.3346432, 0.8860217, -0.3813953, 1, 0, 0, 1, 1,
-0.3333401, -1.226953, -2.514733, 1, 0, 0, 1, 1,
-0.333218, 1.0864, 0.007035585, 0, 0, 0, 1, 1,
-0.3278144, 1.382901, 1.198732, 0, 0, 0, 1, 1,
-0.3272034, -0.5403689, -3.875278, 0, 0, 0, 1, 1,
-0.3265363, -0.4552435, -2.53442, 0, 0, 0, 1, 1,
-0.3235215, 0.1629961, -1.198119, 0, 0, 0, 1, 1,
-0.3206181, 2.584302, -0.5850918, 0, 0, 0, 1, 1,
-0.3102447, 0.8671633, -0.5244791, 0, 0, 0, 1, 1,
-0.3084633, -2.074895, -1.757067, 1, 1, 1, 1, 1,
-0.298644, 0.441098, -0.1282495, 1, 1, 1, 1, 1,
-0.2978576, 0.007491414, -1.843187, 1, 1, 1, 1, 1,
-0.2919459, 0.09060477, -2.963751, 1, 1, 1, 1, 1,
-0.2815679, 0.2992962, -2.219824, 1, 1, 1, 1, 1,
-0.2802159, 0.1144482, -2.348503, 1, 1, 1, 1, 1,
-0.2801872, -0.2371232, -1.511055, 1, 1, 1, 1, 1,
-0.2775493, -0.6957464, -3.874464, 1, 1, 1, 1, 1,
-0.2774144, 1.36952, -1.929806, 1, 1, 1, 1, 1,
-0.274546, -0.4756467, -2.753465, 1, 1, 1, 1, 1,
-0.2671232, -0.6955426, -3.144809, 1, 1, 1, 1, 1,
-0.2619908, -0.1669164, -3.149524, 1, 1, 1, 1, 1,
-0.2565875, 0.1576787, -1.697207, 1, 1, 1, 1, 1,
-0.2554529, 0.8047351, -1.08227, 1, 1, 1, 1, 1,
-0.2518132, -0.3066767, -2.444819, 1, 1, 1, 1, 1,
-0.2509837, 0.2875611, 0.8723074, 0, 0, 1, 1, 1,
-0.2504781, 0.6613491, -2.082895, 1, 0, 0, 1, 1,
-0.2496717, -0.7975401, -5.309347, 1, 0, 0, 1, 1,
-0.2482694, -0.0259741, -3.094935, 1, 0, 0, 1, 1,
-0.2441066, -0.4854829, -2.019712, 1, 0, 0, 1, 1,
-0.240246, -0.2648184, -1.304589, 1, 0, 0, 1, 1,
-0.2402206, 0.8727455, 0.04510781, 0, 0, 0, 1, 1,
-0.2373343, 2.763983, -0.6515588, 0, 0, 0, 1, 1,
-0.2362769, -0.6218411, -1.335536, 0, 0, 0, 1, 1,
-0.2356199, -1.053054, -2.349144, 0, 0, 0, 1, 1,
-0.232955, 0.06274667, 0.1898892, 0, 0, 0, 1, 1,
-0.2276008, -0.4625504, -2.908756, 0, 0, 0, 1, 1,
-0.2267568, -0.9450707, -0.9241519, 0, 0, 0, 1, 1,
-0.22659, 1.648979, -0.8296568, 1, 1, 1, 1, 1,
-0.2185034, 1.001277, -0.2373654, 1, 1, 1, 1, 1,
-0.2164802, 0.1431138, -1.060317, 1, 1, 1, 1, 1,
-0.2160655, 0.9402419, 0.6486298, 1, 1, 1, 1, 1,
-0.2157913, 1.5196, -1.454033, 1, 1, 1, 1, 1,
-0.2138477, -0.1785222, -3.404941, 1, 1, 1, 1, 1,
-0.2055974, 0.5377212, -1.466968, 1, 1, 1, 1, 1,
-0.2033877, 0.366048, -0.4462695, 1, 1, 1, 1, 1,
-0.2010947, -1.585005, -4.223873, 1, 1, 1, 1, 1,
-0.200116, 1.747766, 0.553571, 1, 1, 1, 1, 1,
-0.1950143, -0.2489036, -1.58838, 1, 1, 1, 1, 1,
-0.194812, 0.3673582, -0.7330941, 1, 1, 1, 1, 1,
-0.1925086, -1.6052, -2.443809, 1, 1, 1, 1, 1,
-0.189892, -0.05302809, -1.92351, 1, 1, 1, 1, 1,
-0.1879077, -0.4116532, -1.092473, 1, 1, 1, 1, 1,
-0.1872478, -0.7566484, -2.545576, 0, 0, 1, 1, 1,
-0.1857116, 0.6114713, -0.7572362, 1, 0, 0, 1, 1,
-0.1774755, 0.559508, -0.8841301, 1, 0, 0, 1, 1,
-0.1723329, -1.115731, -3.366684, 1, 0, 0, 1, 1,
-0.1721477, -0.2652187, -3.395685, 1, 0, 0, 1, 1,
-0.1663654, -0.8201984, -2.969032, 1, 0, 0, 1, 1,
-0.1633676, 1.60159, 0.7779973, 0, 0, 0, 1, 1,
-0.1631589, 0.4208433, -1.203357, 0, 0, 0, 1, 1,
-0.1581578, 1.257546, 0.8161104, 0, 0, 0, 1, 1,
-0.149143, 0.08458658, 1.303385, 0, 0, 0, 1, 1,
-0.1480518, 0.2059738, -0.3069192, 0, 0, 0, 1, 1,
-0.143636, 0.655377, -0.5844667, 0, 0, 0, 1, 1,
-0.1341229, -0.9673575, -4.687915, 0, 0, 0, 1, 1,
-0.134032, -1.180998, -3.381631, 1, 1, 1, 1, 1,
-0.1329231, -0.8464811, -2.969663, 1, 1, 1, 1, 1,
-0.1318944, 0.1370083, -1.419737, 1, 1, 1, 1, 1,
-0.1313382, -0.5557839, -2.682178, 1, 1, 1, 1, 1,
-0.1304766, 0.1590661, -0.3694549, 1, 1, 1, 1, 1,
-0.1240933, 0.7211344, -0.997371, 1, 1, 1, 1, 1,
-0.1162831, -0.03840466, -2.678951, 1, 1, 1, 1, 1,
-0.1153859, -0.8237131, -3.563377, 1, 1, 1, 1, 1,
-0.1140538, -0.7225916, -1.288062, 1, 1, 1, 1, 1,
-0.111073, -0.5777641, -3.679511, 1, 1, 1, 1, 1,
-0.1090619, 0.03887723, -1.746472, 1, 1, 1, 1, 1,
-0.107903, -1.37813, -3.449277, 1, 1, 1, 1, 1,
-0.1073925, 0.7838334, 0.5443284, 1, 1, 1, 1, 1,
-0.1071519, 1.128306, -2.381771, 1, 1, 1, 1, 1,
-0.106092, -1.229074, -2.490374, 1, 1, 1, 1, 1,
-0.1052312, -0.3838786, -1.991217, 0, 0, 1, 1, 1,
-0.09945529, -1.406591, -2.444105, 1, 0, 0, 1, 1,
-0.0992215, -0.2450515, -1.522514, 1, 0, 0, 1, 1,
-0.09509528, -0.3115246, -1.983403, 1, 0, 0, 1, 1,
-0.09208485, 0.6316443, -0.8078588, 1, 0, 0, 1, 1,
-0.08441065, -0.5422678, -2.578882, 1, 0, 0, 1, 1,
-0.0806146, 0.04145086, -0.1538327, 0, 0, 0, 1, 1,
-0.06999856, -1.010754, -3.894193, 0, 0, 0, 1, 1,
-0.06844906, -0.3312303, -1.307243, 0, 0, 0, 1, 1,
-0.06149238, 0.4732064, 1.181605, 0, 0, 0, 1, 1,
-0.0599695, -0.3341186, -3.251806, 0, 0, 0, 1, 1,
-0.05913294, 1.833261, -0.321169, 0, 0, 0, 1, 1,
-0.05774337, -1.672769, -3.921152, 0, 0, 0, 1, 1,
-0.05712817, -0.3656474, -3.94639, 1, 1, 1, 1, 1,
-0.04770344, 0.4941763, 0.6372417, 1, 1, 1, 1, 1,
-0.04151968, 1.003388, 0.933654, 1, 1, 1, 1, 1,
-0.03784562, 1.346152, -0.401071, 1, 1, 1, 1, 1,
-0.03539582, 0.7665968, 1.034965, 1, 1, 1, 1, 1,
-0.02437962, 0.1056156, 0.5936825, 1, 1, 1, 1, 1,
-0.02224653, 0.7608408, 0.654265, 1, 1, 1, 1, 1,
-0.01724857, -1.604344, -3.081819, 1, 1, 1, 1, 1,
-0.01106377, 0.1746463, -0.6478977, 1, 1, 1, 1, 1,
-0.006896699, -0.927388, -2.166001, 1, 1, 1, 1, 1,
-0.006117022, -0.7424961, -2.599161, 1, 1, 1, 1, 1,
-0.001970254, -0.6013138, -3.954022, 1, 1, 1, 1, 1,
0.002192312, -1.40309, 0.9152437, 1, 1, 1, 1, 1,
0.005540379, -0.7197835, 4.091898, 1, 1, 1, 1, 1,
0.007699481, -0.3293916, 4.654112, 1, 1, 1, 1, 1,
0.007998354, -1.069252, 5.140298, 0, 0, 1, 1, 1,
0.009553963, -1.083338, 3.240622, 1, 0, 0, 1, 1,
0.01656934, -1.87078, 4.298189, 1, 0, 0, 1, 1,
0.0169273, -0.4153757, 3.744391, 1, 0, 0, 1, 1,
0.01716402, 0.1255368, -1.038608, 1, 0, 0, 1, 1,
0.02031971, -1.830188, 2.812468, 1, 0, 0, 1, 1,
0.02547808, 1.565038, -0.8282934, 0, 0, 0, 1, 1,
0.02811086, 1.073826, -0.862632, 0, 0, 0, 1, 1,
0.02944211, -0.5234926, 2.730978, 0, 0, 0, 1, 1,
0.02953409, 0.7927585, -0.1282481, 0, 0, 0, 1, 1,
0.03077183, 0.2411242, -0.9929118, 0, 0, 0, 1, 1,
0.0340302, -0.3363823, 3.270572, 0, 0, 0, 1, 1,
0.0359533, 0.1529972, -1.012324, 0, 0, 0, 1, 1,
0.03930483, -0.5317898, 2.792452, 1, 1, 1, 1, 1,
0.04302055, 0.03769899, 0.4073379, 1, 1, 1, 1, 1,
0.04352627, -0.9489573, 3.079464, 1, 1, 1, 1, 1,
0.04479655, 0.07037036, -0.01634594, 1, 1, 1, 1, 1,
0.04894819, -0.6501182, 2.943127, 1, 1, 1, 1, 1,
0.05262131, -0.6624345, 2.596817, 1, 1, 1, 1, 1,
0.06176769, -0.01156888, 2.190301, 1, 1, 1, 1, 1,
0.06290666, -0.1823646, 1.907056, 1, 1, 1, 1, 1,
0.06462537, 1.499413, -0.9753205, 1, 1, 1, 1, 1,
0.0653269, -0.3331623, 2.857084, 1, 1, 1, 1, 1,
0.06693445, -0.5657679, 2.22989, 1, 1, 1, 1, 1,
0.06770638, -1.191746, 3.857065, 1, 1, 1, 1, 1,
0.06803045, -0.02189998, 3.074565, 1, 1, 1, 1, 1,
0.0690885, -0.1235159, 3.667674, 1, 1, 1, 1, 1,
0.07158152, 0.6953742, 0.6961539, 1, 1, 1, 1, 1,
0.07282758, -1.047254, 2.190687, 0, 0, 1, 1, 1,
0.07370601, -0.9653314, 2.737172, 1, 0, 0, 1, 1,
0.07394291, -1.602411, 4.201653, 1, 0, 0, 1, 1,
0.07601833, 1.530357, 0.1583504, 1, 0, 0, 1, 1,
0.0805744, -1.803281, 1.643934, 1, 0, 0, 1, 1,
0.08085011, 1.11957, 1.818642, 1, 0, 0, 1, 1,
0.08337344, 0.8014802, -1.642601, 0, 0, 0, 1, 1,
0.08811191, -0.04984829, 0.9132929, 0, 0, 0, 1, 1,
0.09091096, 0.3329671, 0.2247282, 0, 0, 0, 1, 1,
0.09316658, -0.2167271, 1.597749, 0, 0, 0, 1, 1,
0.09322659, -0.1682065, 2.13478, 0, 0, 0, 1, 1,
0.0946854, 0.05614595, 1.400954, 0, 0, 0, 1, 1,
0.09634245, -0.6815329, 2.294906, 0, 0, 0, 1, 1,
0.09732238, 0.2382849, 0.08690186, 1, 1, 1, 1, 1,
0.0991964, -0.004463926, 1.956133, 1, 1, 1, 1, 1,
0.1011893, -0.9818587, 2.433006, 1, 1, 1, 1, 1,
0.1019574, 0.6864661, -0.07496005, 1, 1, 1, 1, 1,
0.1022552, 0.04055316, 1.816766, 1, 1, 1, 1, 1,
0.102934, -0.9689586, 4.302843, 1, 1, 1, 1, 1,
0.1098569, -0.1601284, 2.475885, 1, 1, 1, 1, 1,
0.1211966, 1.074367, -0.3707818, 1, 1, 1, 1, 1,
0.1218617, 1.13937, -0.6281497, 1, 1, 1, 1, 1,
0.1230405, -0.8926179, 3.941762, 1, 1, 1, 1, 1,
0.1237461, -1.30199, 4.062952, 1, 1, 1, 1, 1,
0.1263322, -1.548496, 2.491314, 1, 1, 1, 1, 1,
0.126542, -0.8494686, 2.754596, 1, 1, 1, 1, 1,
0.1275011, -1.30926, 2.237875, 1, 1, 1, 1, 1,
0.1316143, 1.115974, 1.225387, 1, 1, 1, 1, 1,
0.1334309, -0.3819729, 3.135817, 0, 0, 1, 1, 1,
0.1367266, 0.2792837, -0.2971492, 1, 0, 0, 1, 1,
0.1422609, 0.9886498, 2.06288, 1, 0, 0, 1, 1,
0.1433524, -0.6471801, 3.541849, 1, 0, 0, 1, 1,
0.1443829, -0.105092, 2.370098, 1, 0, 0, 1, 1,
0.1483437, -0.05265478, 2.58728, 1, 0, 0, 1, 1,
0.1489335, -1.902461, 3.907327, 0, 0, 0, 1, 1,
0.1536174, -0.6437904, 3.754217, 0, 0, 0, 1, 1,
0.15798, -0.2370624, 2.258689, 0, 0, 0, 1, 1,
0.1590979, -0.02481716, 1.99546, 0, 0, 0, 1, 1,
0.1628879, 1.031023, -0.1109291, 0, 0, 0, 1, 1,
0.1640051, 0.06018485, 1.7427, 0, 0, 0, 1, 1,
0.1647113, -0.0239671, 1.30399, 0, 0, 0, 1, 1,
0.1667061, 0.6101741, -1.633946, 1, 1, 1, 1, 1,
0.1708287, 0.800786, -0.2536424, 1, 1, 1, 1, 1,
0.1745817, -1.724241, 3.475328, 1, 1, 1, 1, 1,
0.1768554, -0.6025472, 4.152991, 1, 1, 1, 1, 1,
0.17781, 0.2569683, 1.477012, 1, 1, 1, 1, 1,
0.178057, 1.058172, 0.5440103, 1, 1, 1, 1, 1,
0.1796655, -0.1886715, 3.233935, 1, 1, 1, 1, 1,
0.1814425, -0.04535051, 2.894841, 1, 1, 1, 1, 1,
0.1821425, -1.056315, 3.304955, 1, 1, 1, 1, 1,
0.1826728, -2.060899, 2.338409, 1, 1, 1, 1, 1,
0.1837543, -0.004219307, 1.109718, 1, 1, 1, 1, 1,
0.1863952, 0.1645437, 1.362672, 1, 1, 1, 1, 1,
0.1888966, -0.3873324, 3.903969, 1, 1, 1, 1, 1,
0.1905537, 0.7327669, 0.1922213, 1, 1, 1, 1, 1,
0.1950009, 1.05121, -1.363292, 1, 1, 1, 1, 1,
0.196257, -0.1427856, 4.190557, 0, 0, 1, 1, 1,
0.196943, -1.133763, 2.470955, 1, 0, 0, 1, 1,
0.1977744, 0.6097212, 2.320587, 1, 0, 0, 1, 1,
0.201866, 1.809897, -1.236973, 1, 0, 0, 1, 1,
0.2049745, -0.1360972, 3.046421, 1, 0, 0, 1, 1,
0.2114373, -1.348778, 3.687627, 1, 0, 0, 1, 1,
0.2123318, -0.7906812, 3.950047, 0, 0, 0, 1, 1,
0.2132064, -1.133058, 4.838552, 0, 0, 0, 1, 1,
0.2134898, 0.6400005, -0.2502786, 0, 0, 0, 1, 1,
0.2149294, -0.08275072, 0.9822263, 0, 0, 0, 1, 1,
0.2168308, 0.8988748, -0.5817551, 0, 0, 0, 1, 1,
0.2222781, -0.3800751, 2.393128, 0, 0, 0, 1, 1,
0.2228881, -1.608508, 3.839903, 0, 0, 0, 1, 1,
0.2273472, -0.0905149, 4.355267, 1, 1, 1, 1, 1,
0.2291428, 0.220348, 1.208722, 1, 1, 1, 1, 1,
0.2300276, 0.2032514, 0.85988, 1, 1, 1, 1, 1,
0.2308422, 0.6469907, 1.110608, 1, 1, 1, 1, 1,
0.2360355, -0.4203571, 3.950493, 1, 1, 1, 1, 1,
0.2361844, 0.1571177, -0.1204681, 1, 1, 1, 1, 1,
0.2392338, 0.6710356, -1.119929, 1, 1, 1, 1, 1,
0.243819, -0.9487912, 2.858956, 1, 1, 1, 1, 1,
0.2474116, -0.03238869, 1.07238, 1, 1, 1, 1, 1,
0.2482842, -0.6943877, 3.671722, 1, 1, 1, 1, 1,
0.2528337, -0.8639231, 2.556438, 1, 1, 1, 1, 1,
0.2534415, 1.252442, -1.601474, 1, 1, 1, 1, 1,
0.2566272, -0.151386, 2.676219, 1, 1, 1, 1, 1,
0.2607571, -0.5154339, 3.541653, 1, 1, 1, 1, 1,
0.2620127, 0.3105159, 1.507267, 1, 1, 1, 1, 1,
0.2651233, 0.4414857, -1.072607, 0, 0, 1, 1, 1,
0.268123, 0.1236025, -1.088988, 1, 0, 0, 1, 1,
0.2725896, -0.743517, 1.768094, 1, 0, 0, 1, 1,
0.2825527, -0.6442078, 2.812026, 1, 0, 0, 1, 1,
0.2920142, 0.7421046, -0.05734311, 1, 0, 0, 1, 1,
0.2938244, 0.05518312, 0.9735513, 1, 0, 0, 1, 1,
0.2958149, 0.4563746, 0.007589899, 0, 0, 0, 1, 1,
0.2979502, -1.504483, 2.296098, 0, 0, 0, 1, 1,
0.3043274, -2.09404, 3.398981, 0, 0, 0, 1, 1,
0.3063492, 1.585458, 0.9291657, 0, 0, 0, 1, 1,
0.3070115, -0.9003137, 1.827069, 0, 0, 0, 1, 1,
0.3092685, -0.277463, 2.9239, 0, 0, 0, 1, 1,
0.3097831, -0.00200554, 1.033379, 0, 0, 0, 1, 1,
0.3164738, 2.700789, -0.1603128, 1, 1, 1, 1, 1,
0.3177412, 0.8419581, 1.452072, 1, 1, 1, 1, 1,
0.3258642, -0.3606164, 0.5717413, 1, 1, 1, 1, 1,
0.3259859, -0.8952183, 2.48531, 1, 1, 1, 1, 1,
0.3269668, -1.234359, 3.083806, 1, 1, 1, 1, 1,
0.328465, -0.610166, 4.63054, 1, 1, 1, 1, 1,
0.3311237, 0.6474445, 2.265146, 1, 1, 1, 1, 1,
0.3318898, 0.9816208, 1.024928, 1, 1, 1, 1, 1,
0.3343046, 1.76594, -0.1976244, 1, 1, 1, 1, 1,
0.3347906, -1.087751, 0.279604, 1, 1, 1, 1, 1,
0.3359776, -0.5905823, 2.020791, 1, 1, 1, 1, 1,
0.3400362, -0.8446905, 1.558418, 1, 1, 1, 1, 1,
0.3403056, -1.124579, 2.376492, 1, 1, 1, 1, 1,
0.3418565, -0.3099755, 2.175535, 1, 1, 1, 1, 1,
0.3420344, 0.2438014, 1.396544, 1, 1, 1, 1, 1,
0.3449967, -0.903823, 1.893026, 0, 0, 1, 1, 1,
0.3450917, 1.664544, -1.004763, 1, 0, 0, 1, 1,
0.345865, -1.063885, 1.857083, 1, 0, 0, 1, 1,
0.3537904, -0.1477237, 2.239169, 1, 0, 0, 1, 1,
0.3552207, 0.1809631, 2.215691, 1, 0, 0, 1, 1,
0.3599901, 0.3882547, 1.114033, 1, 0, 0, 1, 1,
0.3639936, 0.2610299, 1.307872, 0, 0, 0, 1, 1,
0.3653949, -0.7246702, 3.234216, 0, 0, 0, 1, 1,
0.3686571, -0.5747633, 2.384703, 0, 0, 0, 1, 1,
0.3689857, -0.6169552, 1.224024, 0, 0, 0, 1, 1,
0.369709, -0.6343778, 3.168446, 0, 0, 0, 1, 1,
0.3713672, 0.4605981, 1.945882, 0, 0, 0, 1, 1,
0.3741915, -0.8589683, 2.143889, 0, 0, 0, 1, 1,
0.3767109, 0.5397393, 0.5756916, 1, 1, 1, 1, 1,
0.3798285, 0.3817943, 1.813046, 1, 1, 1, 1, 1,
0.3798944, -1.077281, 3.882619, 1, 1, 1, 1, 1,
0.3808135, 1.905625, -0.2933727, 1, 1, 1, 1, 1,
0.3855154, 0.4531501, 0.5034419, 1, 1, 1, 1, 1,
0.3869005, 1.2147, -0.6288254, 1, 1, 1, 1, 1,
0.3889266, 0.6339941, 0.4042507, 1, 1, 1, 1, 1,
0.3967546, 0.3874311, 2.388782, 1, 1, 1, 1, 1,
0.3983823, 1.59891, -0.3304873, 1, 1, 1, 1, 1,
0.4112744, -1.336866, 2.368221, 1, 1, 1, 1, 1,
0.411944, 1.159464, 2.145026, 1, 1, 1, 1, 1,
0.4128793, -0.1532192, 2.014807, 1, 1, 1, 1, 1,
0.4218164, -1.350726, 2.488345, 1, 1, 1, 1, 1,
0.4234852, 0.08788834, 1.530264, 1, 1, 1, 1, 1,
0.426396, -0.9960481, 3.222492, 1, 1, 1, 1, 1,
0.4287626, -0.4995791, 1.187674, 0, 0, 1, 1, 1,
0.432272, -1.19741, 4.179331, 1, 0, 0, 1, 1,
0.4350695, -0.5764099, 4.45525, 1, 0, 0, 1, 1,
0.4360496, -0.4406176, 2.290128, 1, 0, 0, 1, 1,
0.4393417, 1.197986, 1.979254, 1, 0, 0, 1, 1,
0.440008, -0.3861504, 1.30189, 1, 0, 0, 1, 1,
0.440121, -0.7347345, 2.321737, 0, 0, 0, 1, 1,
0.4444559, 0.5729297, 1.409095, 0, 0, 0, 1, 1,
0.4462512, -0.4178946, 2.585474, 0, 0, 0, 1, 1,
0.4481473, -0.3027147, 3.272361, 0, 0, 0, 1, 1,
0.4505083, 0.2265871, 0.9275528, 0, 0, 0, 1, 1,
0.4541422, 1.134191, 0.5624837, 0, 0, 0, 1, 1,
0.4584581, -0.8687344, 2.803235, 0, 0, 0, 1, 1,
0.4605339, 0.6214935, 0.2654485, 1, 1, 1, 1, 1,
0.463954, 0.06880397, 2.400329, 1, 1, 1, 1, 1,
0.4640865, -0.8735224, 1.292704, 1, 1, 1, 1, 1,
0.4700924, 0.3104712, 0.2491859, 1, 1, 1, 1, 1,
0.4748069, 0.5437092, 0.06964236, 1, 1, 1, 1, 1,
0.4756607, 0.951884, 0.6955729, 1, 1, 1, 1, 1,
0.4789283, -0.713118, 2.577124, 1, 1, 1, 1, 1,
0.4798925, -0.02372481, 1.480767, 1, 1, 1, 1, 1,
0.4800207, -1.043341, 4.076311, 1, 1, 1, 1, 1,
0.484436, -2.478109, 1.753216, 1, 1, 1, 1, 1,
0.4857419, -0.6140017, 3.203728, 1, 1, 1, 1, 1,
0.4938957, -1.442249, 2.288011, 1, 1, 1, 1, 1,
0.4941081, -0.05900293, 0.6897524, 1, 1, 1, 1, 1,
0.5003465, 0.6567411, 1.031373, 1, 1, 1, 1, 1,
0.5027395, 0.1669149, 2.445924, 1, 1, 1, 1, 1,
0.5096103, 0.5575707, 0.0680396, 0, 0, 1, 1, 1,
0.5183686, 1.755683, 1.431489, 1, 0, 0, 1, 1,
0.5203601, -1.569896, 2.288125, 1, 0, 0, 1, 1,
0.520534, 0.3534837, 1.363674, 1, 0, 0, 1, 1,
0.5206918, -0.6535664, 3.609802, 1, 0, 0, 1, 1,
0.5214821, -2.742135, 0.3658589, 1, 0, 0, 1, 1,
0.5254029, -2.010249, 3.108911, 0, 0, 0, 1, 1,
0.5391841, -1.341378, 1.255681, 0, 0, 0, 1, 1,
0.5398233, 0.4876818, 1.732823, 0, 0, 0, 1, 1,
0.5467878, 0.6375391, 0.5070825, 0, 0, 0, 1, 1,
0.5498729, 1.240019, 0.6180051, 0, 0, 0, 1, 1,
0.5519372, 0.9871145, -0.3565429, 0, 0, 0, 1, 1,
0.5523415, 0.7462961, 0.399587, 0, 0, 0, 1, 1,
0.5549802, -1.178161, 4.322696, 1, 1, 1, 1, 1,
0.5612392, 0.3921309, 1.198722, 1, 1, 1, 1, 1,
0.5620522, -1.022766, 2.736698, 1, 1, 1, 1, 1,
0.5620675, -0.1732026, -0.7735971, 1, 1, 1, 1, 1,
0.5673249, -1.441095, 3.082721, 1, 1, 1, 1, 1,
0.5675191, -0.5561494, 2.587103, 1, 1, 1, 1, 1,
0.569348, -1.092001, 2.848801, 1, 1, 1, 1, 1,
0.576018, 0.9702407, -0.1116195, 1, 1, 1, 1, 1,
0.5772724, -0.8040292, 1.861436, 1, 1, 1, 1, 1,
0.581284, -0.658964, 3.046954, 1, 1, 1, 1, 1,
0.5837219, -0.7564109, 2.146059, 1, 1, 1, 1, 1,
0.5839001, -0.1649526, 1.075243, 1, 1, 1, 1, 1,
0.5863081, 0.01819798, 1.610839, 1, 1, 1, 1, 1,
0.5922319, 1.109355, 1.761304, 1, 1, 1, 1, 1,
0.594755, 1.07536, -1.094364, 1, 1, 1, 1, 1,
0.5958315, -0.318772, 2.717678, 0, 0, 1, 1, 1,
0.6064311, -0.5785796, 1.935249, 1, 0, 0, 1, 1,
0.6108402, 0.8782991, 0.4725719, 1, 0, 0, 1, 1,
0.6160939, 1.569978, -1.027449, 1, 0, 0, 1, 1,
0.6249703, 0.3750161, 2.249232, 1, 0, 0, 1, 1,
0.6288713, 0.1833517, 0.9875464, 1, 0, 0, 1, 1,
0.6326255, -0.5190529, 3.195797, 0, 0, 0, 1, 1,
0.6362383, 1.197409, -0.1934442, 0, 0, 0, 1, 1,
0.6366823, -0.4729969, 1.867277, 0, 0, 0, 1, 1,
0.6391552, -1.133512, 3.558629, 0, 0, 0, 1, 1,
0.6399832, 0.7200465, 0.03980603, 0, 0, 0, 1, 1,
0.6459337, 1.045464, -0.0489991, 0, 0, 0, 1, 1,
0.6521243, 0.6769528, 3.399274, 0, 0, 0, 1, 1,
0.6533441, 0.3086227, 0.9153268, 1, 1, 1, 1, 1,
0.653716, 0.8672279, 2.174155, 1, 1, 1, 1, 1,
0.6564834, 0.4044131, 2.41401, 1, 1, 1, 1, 1,
0.65702, 0.0002933801, 2.178554, 1, 1, 1, 1, 1,
0.6614596, 0.655144, 0.5820721, 1, 1, 1, 1, 1,
0.6637052, 1.148379, 0.363257, 1, 1, 1, 1, 1,
0.6654586, -0.3864286, 2.403149, 1, 1, 1, 1, 1,
0.6670696, 0.2032556, 2.904203, 1, 1, 1, 1, 1,
0.6701483, 0.3346167, 0.8634076, 1, 1, 1, 1, 1,
0.6704153, -1.470767, 2.934426, 1, 1, 1, 1, 1,
0.6712754, 0.6164887, 1.125163, 1, 1, 1, 1, 1,
0.6751226, -0.3241892, 1.934927, 1, 1, 1, 1, 1,
0.6774018, 1.603612, -0.2609944, 1, 1, 1, 1, 1,
0.6805378, 1.470506, -0.3278552, 1, 1, 1, 1, 1,
0.6814976, 1.808782, 1.335479, 1, 1, 1, 1, 1,
0.6822107, -0.6005552, 1.617772, 0, 0, 1, 1, 1,
0.6828721, -0.107969, 1.52293, 1, 0, 0, 1, 1,
0.6903936, 0.3252337, 1.856804, 1, 0, 0, 1, 1,
0.6925806, -1.146033, 2.834527, 1, 0, 0, 1, 1,
0.6992733, -0.6396086, 2.950855, 1, 0, 0, 1, 1,
0.6996851, -2.034912, 3.19631, 1, 0, 0, 1, 1,
0.7003463, -0.6794781, 1.800076, 0, 0, 0, 1, 1,
0.7003954, -0.7461339, 1.507737, 0, 0, 0, 1, 1,
0.7023529, -0.8714956, 1.924803, 0, 0, 0, 1, 1,
0.7044795, -0.8838933, 3.209968, 0, 0, 0, 1, 1,
0.7044936, 0.7788484, 2.363034, 0, 0, 0, 1, 1,
0.7060357, 0.1485361, 2.663696, 0, 0, 0, 1, 1,
0.70608, 0.8347076, 1.863606, 0, 0, 0, 1, 1,
0.7062778, 0.1606641, 2.360608, 1, 1, 1, 1, 1,
0.708252, 0.06556101, -0.4901322, 1, 1, 1, 1, 1,
0.7112368, -1.445034, 3.236833, 1, 1, 1, 1, 1,
0.7128272, -0.7699562, 1.793238, 1, 1, 1, 1, 1,
0.7190976, -0.9969959, 1.805012, 1, 1, 1, 1, 1,
0.7214023, -0.4722393, 1.956355, 1, 1, 1, 1, 1,
0.7243313, 0.2258528, 1.437991, 1, 1, 1, 1, 1,
0.7304713, 0.4719378, -0.5561623, 1, 1, 1, 1, 1,
0.7307369, 0.005326312, 1.714633, 1, 1, 1, 1, 1,
0.7385588, -0.1084871, 1.877244, 1, 1, 1, 1, 1,
0.73927, -0.230258, 2.284606, 1, 1, 1, 1, 1,
0.7393999, 0.6632133, 1.90371, 1, 1, 1, 1, 1,
0.7424011, 0.8704131, 2.631759, 1, 1, 1, 1, 1,
0.7474979, 0.08725096, 1.028107, 1, 1, 1, 1, 1,
0.7496812, 0.5764298, -0.721666, 1, 1, 1, 1, 1,
0.7608425, 0.8985832, 1.495986, 0, 0, 1, 1, 1,
0.76144, 1.55686, -0.3403528, 1, 0, 0, 1, 1,
0.7617388, 0.08807433, 0.7250587, 1, 0, 0, 1, 1,
0.7672184, -1.431181, 2.158808, 1, 0, 0, 1, 1,
0.7692962, 0.9273661, -0.4475921, 1, 0, 0, 1, 1,
0.7741072, 1.036281, 1.864312, 1, 0, 0, 1, 1,
0.7797477, 0.1019158, 0.46565, 0, 0, 0, 1, 1,
0.7820077, -0.05990839, 1.632298, 0, 0, 0, 1, 1,
0.782661, 0.1207941, 3.011073, 0, 0, 0, 1, 1,
0.7866753, -0.3925291, 3.303662, 0, 0, 0, 1, 1,
0.789531, 0.5140422, -0.2153128, 0, 0, 0, 1, 1,
0.7909575, -2.336167, 3.650771, 0, 0, 0, 1, 1,
0.7979022, -1.868419, 4.416384, 0, 0, 0, 1, 1,
0.8067219, 0.3523071, 0.3185435, 1, 1, 1, 1, 1,
0.8229129, -0.8828592, 1.480411, 1, 1, 1, 1, 1,
0.8246862, -1.228106, 2.535759, 1, 1, 1, 1, 1,
0.8249775, 1.322086, 3.198239, 1, 1, 1, 1, 1,
0.8264365, 0.4932263, 2.031872, 1, 1, 1, 1, 1,
0.8313623, 1.141168, 1.10253, 1, 1, 1, 1, 1,
0.832294, 0.4899387, 0.4990866, 1, 1, 1, 1, 1,
0.8342396, -0.4556316, 3.293725, 1, 1, 1, 1, 1,
0.8382733, 1.98282, 1.173669, 1, 1, 1, 1, 1,
0.8407641, 0.2451741, 1.243251, 1, 1, 1, 1, 1,
0.8438748, -0.444053, 2.566201, 1, 1, 1, 1, 1,
0.8499677, 0.947369, -0.05890013, 1, 1, 1, 1, 1,
0.8548967, 0.1246725, 0.6755391, 1, 1, 1, 1, 1,
0.8591354, -2.077877, 1.956907, 1, 1, 1, 1, 1,
0.8598208, -0.8587714, 2.392954, 1, 1, 1, 1, 1,
0.860291, 0.6203644, 1.93091, 0, 0, 1, 1, 1,
0.8606084, -1.437862, 3.266237, 1, 0, 0, 1, 1,
0.8616368, 0.9287127, 0.4348312, 1, 0, 0, 1, 1,
0.8624076, 1.013098, 1.516988, 1, 0, 0, 1, 1,
0.8649136, -0.3967231, 2.402997, 1, 0, 0, 1, 1,
0.8677437, 0.649788, 3.478561, 1, 0, 0, 1, 1,
0.875047, -0.2718557, 2.682291, 0, 0, 0, 1, 1,
0.8753001, -1.982793, 6.128181, 0, 0, 0, 1, 1,
0.8753148, 1.009138, 0.4079943, 0, 0, 0, 1, 1,
0.8768447, 0.8322874, -0.08156276, 0, 0, 0, 1, 1,
0.8817071, 0.7936286, 2.015699, 0, 0, 0, 1, 1,
0.8838794, 0.7083011, -0.5320001, 0, 0, 0, 1, 1,
0.8912212, 0.1324434, 1.257125, 0, 0, 0, 1, 1,
0.8965074, 0.7420915, -0.871656, 1, 1, 1, 1, 1,
0.9081336, -0.2551523, 2.053332, 1, 1, 1, 1, 1,
0.9159688, -2.054886, 1.261935, 1, 1, 1, 1, 1,
0.9205512, 0.9278331, 0.7536602, 1, 1, 1, 1, 1,
0.9210377, 1.054512, -0.7208272, 1, 1, 1, 1, 1,
0.9220852, -1.341082, 1.321715, 1, 1, 1, 1, 1,
0.9264446, -0.1123051, 0.9438813, 1, 1, 1, 1, 1,
0.9271428, 0.3226623, 1.575649, 1, 1, 1, 1, 1,
0.9280305, 0.8981868, 1.704756, 1, 1, 1, 1, 1,
0.9299124, -0.318462, 3.133165, 1, 1, 1, 1, 1,
0.9308994, -0.4539998, 2.490171, 1, 1, 1, 1, 1,
0.934858, -0.9021592, 3.685482, 1, 1, 1, 1, 1,
0.9353606, -1.124832, 2.364629, 1, 1, 1, 1, 1,
0.9381741, -1.218001, 0.742749, 1, 1, 1, 1, 1,
0.9481319, -0.1828791, 1.921157, 1, 1, 1, 1, 1,
0.9510233, 1.966893, 1.042834, 0, 0, 1, 1, 1,
0.9534023, 0.05102276, 0.9024522, 1, 0, 0, 1, 1,
0.9548497, 0.9151648, 1.259202, 1, 0, 0, 1, 1,
0.9599669, -0.2997833, 0.6684839, 1, 0, 0, 1, 1,
0.9615989, -0.8308731, -0.1554314, 1, 0, 0, 1, 1,
0.9666285, -0.5659101, 2.874767, 1, 0, 0, 1, 1,
0.9669657, 0.3857445, 1.184072, 0, 0, 0, 1, 1,
0.9702234, -1.423973, 2.596866, 0, 0, 0, 1, 1,
0.9771028, 0.8132483, 0.5188803, 0, 0, 0, 1, 1,
0.977833, 0.7344158, -0.03410498, 0, 0, 0, 1, 1,
0.9836197, 0.9889933, 2.733262, 0, 0, 0, 1, 1,
0.9974228, -1.56044, 2.336283, 0, 0, 0, 1, 1,
0.997584, -1.105925, 2.9601, 0, 0, 0, 1, 1,
0.9985218, 1.259048, 1.452443, 1, 1, 1, 1, 1,
0.9998454, 1.585412, 1.737316, 1, 1, 1, 1, 1,
1.000765, 0.2852006, 0.07400405, 1, 1, 1, 1, 1,
1.012854, -0.1901002, 0.7966552, 1, 1, 1, 1, 1,
1.014534, 4.496371, 0.35859, 1, 1, 1, 1, 1,
1.015444, -0.1218272, 3.273486, 1, 1, 1, 1, 1,
1.01594, 0.03046022, 2.297854, 1, 1, 1, 1, 1,
1.023198, 1.029158, 1.433399, 1, 1, 1, 1, 1,
1.033299, 1.085039, -0.777333, 1, 1, 1, 1, 1,
1.033748, -0.4611225, 0.5083064, 1, 1, 1, 1, 1,
1.043669, -0.2857032, 2.00017, 1, 1, 1, 1, 1,
1.047223, 0.9214059, 0.360333, 1, 1, 1, 1, 1,
1.051178, 1.05572, -0.9387612, 1, 1, 1, 1, 1,
1.058044, 0.6999196, 0.7525946, 1, 1, 1, 1, 1,
1.061408, -0.06552617, 2.873768, 1, 1, 1, 1, 1,
1.073101, 0.5645531, 1.091631, 0, 0, 1, 1, 1,
1.074598, -1.267743, 3.103383, 1, 0, 0, 1, 1,
1.079171, -0.4243598, 1.857449, 1, 0, 0, 1, 1,
1.079254, -0.4318989, 2.594519, 1, 0, 0, 1, 1,
1.09413, -0.3636606, 4.412871, 1, 0, 0, 1, 1,
1.103975, 0.922352, 1.573382, 1, 0, 0, 1, 1,
1.104091, 0.7372816, -0.1657612, 0, 0, 0, 1, 1,
1.104576, 1.648071, 1.086344, 0, 0, 0, 1, 1,
1.104738, 1.021283, -0.1652931, 0, 0, 0, 1, 1,
1.105265, -0.7421455, 4.73085, 0, 0, 0, 1, 1,
1.107283, -0.08365539, 1.894486, 0, 0, 0, 1, 1,
1.107543, 1.404254, -0.2780351, 0, 0, 0, 1, 1,
1.113751, 0.4285424, 2.169668, 0, 0, 0, 1, 1,
1.114432, -0.7148781, 2.673167, 1, 1, 1, 1, 1,
1.117239, 0.4000225, 0.4954997, 1, 1, 1, 1, 1,
1.124745, 0.438964, 1.004887, 1, 1, 1, 1, 1,
1.126224, 0.8932486, 0.4537029, 1, 1, 1, 1, 1,
1.132714, -0.4717407, 1.554499, 1, 1, 1, 1, 1,
1.136519, 0.1678408, 1.964445, 1, 1, 1, 1, 1,
1.137326, 1.115106, 2.465848, 1, 1, 1, 1, 1,
1.140304, -1.32897, 1.893302, 1, 1, 1, 1, 1,
1.141056, -1.429683, 1.906214, 1, 1, 1, 1, 1,
1.144729, -0.4278413, 3.34726, 1, 1, 1, 1, 1,
1.147423, -0.4238031, 2.2673, 1, 1, 1, 1, 1,
1.15443, 0.2169626, 0.7656805, 1, 1, 1, 1, 1,
1.157599, 1.913611, 0.2768357, 1, 1, 1, 1, 1,
1.164015, -0.2388878, 0.7935659, 1, 1, 1, 1, 1,
1.164857, 1.296798, 0.925997, 1, 1, 1, 1, 1,
1.176898, -0.1771093, 2.054935, 0, 0, 1, 1, 1,
1.17978, -1.415694, 3.219819, 1, 0, 0, 1, 1,
1.191967, 2.382605, 0.8957661, 1, 0, 0, 1, 1,
1.195929, -0.4969767, 1.526215, 1, 0, 0, 1, 1,
1.198, -0.6354426, 1.189223, 1, 0, 0, 1, 1,
1.198183, 1.430794, 0.8743644, 1, 0, 0, 1, 1,
1.201225, -0.3122785, 1.745337, 0, 0, 0, 1, 1,
1.201429, 0.0670498, 0.1207129, 0, 0, 0, 1, 1,
1.203474, 0.6994841, 1.749589, 0, 0, 0, 1, 1,
1.212591, -1.759388, 3.572726, 0, 0, 0, 1, 1,
1.21443, -1.200135, -0.1478086, 0, 0, 0, 1, 1,
1.21695, 1.761603, -1.605824, 0, 0, 0, 1, 1,
1.218808, -0.6890602, 0.8402978, 0, 0, 0, 1, 1,
1.228711, -0.1959906, 1.627385, 1, 1, 1, 1, 1,
1.23237, 1.353449, 1.485431, 1, 1, 1, 1, 1,
1.234782, -0.6687592, 0.8406401, 1, 1, 1, 1, 1,
1.25712, 0.4621567, 0.71975, 1, 1, 1, 1, 1,
1.262362, 0.1536695, 1.830679, 1, 1, 1, 1, 1,
1.263742, 0.1579424, 1.822141, 1, 1, 1, 1, 1,
1.270486, -2.220809, 1.924535, 1, 1, 1, 1, 1,
1.2794, -0.1653715, 1.425245, 1, 1, 1, 1, 1,
1.28437, -0.8758845, 2.413638, 1, 1, 1, 1, 1,
1.286043, -1.30262, 1.720822, 1, 1, 1, 1, 1,
1.291902, 1.59917, 0.05803839, 1, 1, 1, 1, 1,
1.296831, 2.168993, 1.960025, 1, 1, 1, 1, 1,
1.302413, -0.6368142, 2.262052, 1, 1, 1, 1, 1,
1.31527, 0.4678918, 1.670973, 1, 1, 1, 1, 1,
1.326216, -2.403601, 2.756044, 1, 1, 1, 1, 1,
1.326217, -2.254488, 4.788807, 0, 0, 1, 1, 1,
1.328718, -0.2655912, 1.272168, 1, 0, 0, 1, 1,
1.335636, -1.333896, 3.395072, 1, 0, 0, 1, 1,
1.340391, 0.0994148, 2.300724, 1, 0, 0, 1, 1,
1.342151, -1.270933, 0.7494882, 1, 0, 0, 1, 1,
1.343105, -0.1040207, 2.423917, 1, 0, 0, 1, 1,
1.351617, 1.140886, 0.2082446, 0, 0, 0, 1, 1,
1.371752, 0.3806649, 2.269459, 0, 0, 0, 1, 1,
1.386132, -0.4291416, 1.151955, 0, 0, 0, 1, 1,
1.386349, -0.674204, 2.274691, 0, 0, 0, 1, 1,
1.390489, 0.4928164, 0.0286455, 0, 0, 0, 1, 1,
1.394504, 0.0330552, -0.09450208, 0, 0, 0, 1, 1,
1.398731, 0.09997214, 1.785106, 0, 0, 0, 1, 1,
1.404359, 0.8310539, 2.329946, 1, 1, 1, 1, 1,
1.423699, -1.463984, 1.073134, 1, 1, 1, 1, 1,
1.429562, -0.6003028, 1.400095, 1, 1, 1, 1, 1,
1.431922, -1.299543, 0.7719351, 1, 1, 1, 1, 1,
1.449692, -0.813037, 1.361664, 1, 1, 1, 1, 1,
1.451643, 0.9178849, -0.14797, 1, 1, 1, 1, 1,
1.460798, -0.9029856, 2.170305, 1, 1, 1, 1, 1,
1.468036, -0.6534229, 1.998526, 1, 1, 1, 1, 1,
1.473049, 0.2444752, 1.693472, 1, 1, 1, 1, 1,
1.490111, -1.210458, 1.280142, 1, 1, 1, 1, 1,
1.493164, -0.2800191, 1.370567, 1, 1, 1, 1, 1,
1.496385, -1.253619, 1.788721, 1, 1, 1, 1, 1,
1.511548, -0.704437, 0.6268151, 1, 1, 1, 1, 1,
1.536449, 1.414119, 0.6325079, 1, 1, 1, 1, 1,
1.539074, -0.04740413, 2.678436, 1, 1, 1, 1, 1,
1.542276, 2.616154, 0.3540555, 0, 0, 1, 1, 1,
1.544179, 0.4346617, 0.4873574, 1, 0, 0, 1, 1,
1.556988, -0.5779046, 1.060159, 1, 0, 0, 1, 1,
1.567274, -0.7252864, 1.230135, 1, 0, 0, 1, 1,
1.569781, -0.1358517, 2.267074, 1, 0, 0, 1, 1,
1.570028, 2.613502, -0.2200026, 1, 0, 0, 1, 1,
1.583657, 0.1910323, 1.902904, 0, 0, 0, 1, 1,
1.58934, -0.8299099, 5.147916, 0, 0, 0, 1, 1,
1.591006, -0.1643413, 1.716677, 0, 0, 0, 1, 1,
1.614238, 0.9796674, 2.375888, 0, 0, 0, 1, 1,
1.616255, -0.5227622, -0.6487404, 0, 0, 0, 1, 1,
1.617103, -1.390778, 2.246043, 0, 0, 0, 1, 1,
1.618439, -0.4091485, 2.518752, 0, 0, 0, 1, 1,
1.619186, -0.5692959, 2.363169, 1, 1, 1, 1, 1,
1.624943, -0.4479451, 0.2577785, 1, 1, 1, 1, 1,
1.642894, -0.8216071, 0.7289851, 1, 1, 1, 1, 1,
1.661388, 2.174668, 1.552337, 1, 1, 1, 1, 1,
1.666966, -0.3053328, 4.221533, 1, 1, 1, 1, 1,
1.673923, -0.7237722, 1.82328, 1, 1, 1, 1, 1,
1.678804, 0.3321932, 0.4462727, 1, 1, 1, 1, 1,
1.68387, 0.2710767, 2.483324, 1, 1, 1, 1, 1,
1.68499, -0.3844962, 1.351477, 1, 1, 1, 1, 1,
1.704036, -0.3555326, 1.490146, 1, 1, 1, 1, 1,
1.704761, 0.1106448, 0.4065288, 1, 1, 1, 1, 1,
1.711623, -0.1920313, 1.022915, 1, 1, 1, 1, 1,
1.712625, 1.158579, 2.393408, 1, 1, 1, 1, 1,
1.735514, 0.2905883, 2.750961, 1, 1, 1, 1, 1,
1.737471, -0.9165503, 4.066362, 1, 1, 1, 1, 1,
1.738684, 1.644634, -0.2762026, 0, 0, 1, 1, 1,
1.761126, 0.322271, 0.3990612, 1, 0, 0, 1, 1,
1.763921, 0.134836, 2.209381, 1, 0, 0, 1, 1,
1.775565, 1.214625, 1.618738, 1, 0, 0, 1, 1,
1.77593, -0.3020159, 2.527981, 1, 0, 0, 1, 1,
1.781429, 0.1196016, 1.188146, 1, 0, 0, 1, 1,
1.787231, 1.020745, 1.195696, 0, 0, 0, 1, 1,
1.823825, 0.9696844, 0.1364462, 0, 0, 0, 1, 1,
1.832141, -1.559852, 2.138994, 0, 0, 0, 1, 1,
1.863884, -1.41192, 2.357073, 0, 0, 0, 1, 1,
1.874619, -1.820658, 1.527603, 0, 0, 0, 1, 1,
1.882293, -0.8442019, 1.63271, 0, 0, 0, 1, 1,
1.892671, -0.5220439, 3.064534, 0, 0, 0, 1, 1,
1.914898, 0.009719478, 1.138947, 1, 1, 1, 1, 1,
1.957548, -0.4212056, 4.35029, 1, 1, 1, 1, 1,
1.961851, 0.2907681, 2.466518, 1, 1, 1, 1, 1,
1.962853, 2.445719, 1.058975, 1, 1, 1, 1, 1,
1.964614, -0.9947695, 1.726705, 1, 1, 1, 1, 1,
1.970541, 1.251808, -0.09826148, 1, 1, 1, 1, 1,
1.976691, -1.581993, 2.694996, 1, 1, 1, 1, 1,
2.030207, 0.6662414, 0.9421763, 1, 1, 1, 1, 1,
2.050481, -0.7117962, 2.721291, 1, 1, 1, 1, 1,
2.064387, 0.05913788, 0.7076906, 1, 1, 1, 1, 1,
2.07821, 0.48478, -0.251949, 1, 1, 1, 1, 1,
2.122303, 0.06669747, -0.4985064, 1, 1, 1, 1, 1,
2.122613, 0.09196591, 2.062732, 1, 1, 1, 1, 1,
2.124611, 0.3807114, 0.09255439, 1, 1, 1, 1, 1,
2.133947, -1.364933, 0.170123, 1, 1, 1, 1, 1,
2.136389, 0.9807469, 0.6294613, 0, 0, 1, 1, 1,
2.137218, 0.3968789, 0.5962547, 1, 0, 0, 1, 1,
2.142564, -0.01132905, 0.5577649, 1, 0, 0, 1, 1,
2.16421, -0.04620337, 2.138936, 1, 0, 0, 1, 1,
2.17735, -0.07729083, 1.476804, 1, 0, 0, 1, 1,
2.196638, -0.8465312, 3.062969, 1, 0, 0, 1, 1,
2.212439, 2.141643, -0.03907085, 0, 0, 0, 1, 1,
2.250659, 1.229189, 0.4482993, 0, 0, 0, 1, 1,
2.256034, -0.6509293, 1.551123, 0, 0, 0, 1, 1,
2.273223, 0.5765554, 0.5217723, 0, 0, 0, 1, 1,
2.320387, -1.259263, 1.960467, 0, 0, 0, 1, 1,
2.357192, -0.2440372, 2.992787, 0, 0, 0, 1, 1,
2.362909, 1.00385, 0.4188666, 0, 0, 0, 1, 1,
2.365306, -0.3294326, 2.9834, 1, 1, 1, 1, 1,
2.483086, -0.0763467, 3.978686, 1, 1, 1, 1, 1,
2.573073, 1.310668, 2.267326, 1, 1, 1, 1, 1,
2.630038, 1.657308, 0.4966416, 1, 1, 1, 1, 1,
2.651378, 1.064165, 0.8936971, 1, 1, 1, 1, 1,
2.707305, 0.8486803, 0.7015554, 1, 1, 1, 1, 1,
3.671641, 0.9537684, -0.1393572, 1, 1, 1, 1, 1
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
var radius = 10.60358;
var distance = 37.24461;
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
mvMatrix.translate( -0.0009157658, -0.4008152, -0.4094174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.24461);
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