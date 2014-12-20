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
-3.228567, 2.198306, 0.1453008, 1, 0, 0, 1,
-3.197484, -0.8302345, -1.815471, 1, 0.007843138, 0, 1,
-2.984877, -1.455838, -1.239864, 1, 0.01176471, 0, 1,
-2.832129, 1.276247, -1.415941, 1, 0.01960784, 0, 1,
-2.610919, -0.5533327, -3.047644, 1, 0.02352941, 0, 1,
-2.465416, -0.8825067, -1.063305, 1, 0.03137255, 0, 1,
-2.449674, 0.01134038, -2.071918, 1, 0.03529412, 0, 1,
-2.41765, -0.613933, -1.581869, 1, 0.04313726, 0, 1,
-2.344319, 1.425463, -0.5896927, 1, 0.04705882, 0, 1,
-2.29496, -0.5681266, -1.034226, 1, 0.05490196, 0, 1,
-2.08924, 1.535518, -2.663391, 1, 0.05882353, 0, 1,
-2.073709, 2.283693, -0.1503327, 1, 0.06666667, 0, 1,
-2.073524, 1.309099, -1.23561, 1, 0.07058824, 0, 1,
-2.067449, 0.620963, -0.7995688, 1, 0.07843138, 0, 1,
-2.065194, -0.2095477, -1.094762, 1, 0.08235294, 0, 1,
-2.046989, 0.4096936, -1.280413, 1, 0.09019608, 0, 1,
-2.034166, -0.3833598, -2.475146, 1, 0.09411765, 0, 1,
-2.008329, -0.1466639, -0.8640572, 1, 0.1019608, 0, 1,
-2.004967, 1.084534, 0.3574718, 1, 0.1098039, 0, 1,
-1.982901, -0.7868482, -1.902105, 1, 0.1137255, 0, 1,
-1.964982, -0.5664562, -0.9690986, 1, 0.1215686, 0, 1,
-1.945941, -0.08954225, -3.016144, 1, 0.1254902, 0, 1,
-1.943028, -0.7986496, -2.872844, 1, 0.1333333, 0, 1,
-1.906095, -0.243248, -1.226863, 1, 0.1372549, 0, 1,
-1.889576, -0.5499219, -2.270794, 1, 0.145098, 0, 1,
-1.848323, -1.240298, -1.782766, 1, 0.1490196, 0, 1,
-1.840525, 0.881162, -1.665331, 1, 0.1568628, 0, 1,
-1.81971, 0.05643839, -2.465645, 1, 0.1607843, 0, 1,
-1.818005, -0.7749524, -1.393032, 1, 0.1686275, 0, 1,
-1.811283, -0.6890361, -2.241841, 1, 0.172549, 0, 1,
-1.794283, 0.7204891, -0.1811008, 1, 0.1803922, 0, 1,
-1.786086, 0.7003125, -1.310564, 1, 0.1843137, 0, 1,
-1.748518, -0.01289936, -0.2616606, 1, 0.1921569, 0, 1,
-1.746532, 0.004030297, -2.297552, 1, 0.1960784, 0, 1,
-1.744915, -0.3941006, -1.769652, 1, 0.2039216, 0, 1,
-1.73935, 0.2575485, -1.961412, 1, 0.2117647, 0, 1,
-1.723287, -2.002696, -2.090638, 1, 0.2156863, 0, 1,
-1.722193, 1.297263, -1.325309, 1, 0.2235294, 0, 1,
-1.699102, 1.347328, 0.2548304, 1, 0.227451, 0, 1,
-1.69423, 0.5091084, -0.9345817, 1, 0.2352941, 0, 1,
-1.679618, -1.572334, -2.802833, 1, 0.2392157, 0, 1,
-1.663689, 0.5275386, -0.8679734, 1, 0.2470588, 0, 1,
-1.662764, -0.3059777, -1.111582, 1, 0.2509804, 0, 1,
-1.662361, -0.9533815, -1.86549, 1, 0.2588235, 0, 1,
-1.660725, 0.1210042, -0.7079719, 1, 0.2627451, 0, 1,
-1.658449, -1.260155, -3.293399, 1, 0.2705882, 0, 1,
-1.64259, 0.6690183, -2.19278, 1, 0.2745098, 0, 1,
-1.637744, 1.53795, -0.4530899, 1, 0.282353, 0, 1,
-1.617787, -0.210136, -1.785836, 1, 0.2862745, 0, 1,
-1.615835, 2.153932, -0.4883213, 1, 0.2941177, 0, 1,
-1.608052, 0.8880893, 0.762431, 1, 0.3019608, 0, 1,
-1.607683, -0.09466792, -1.925554, 1, 0.3058824, 0, 1,
-1.607024, 1.460696, -0.7599949, 1, 0.3137255, 0, 1,
-1.58583, -0.6969794, -3.20056, 1, 0.3176471, 0, 1,
-1.572877, -1.76155, -3.104155, 1, 0.3254902, 0, 1,
-1.57086, -0.06290575, -1.224571, 1, 0.3294118, 0, 1,
-1.570183, -0.1765593, -0.2502224, 1, 0.3372549, 0, 1,
-1.566987, 1.1773, -0.9280531, 1, 0.3411765, 0, 1,
-1.564843, 1.120415, -1.539583, 1, 0.3490196, 0, 1,
-1.561167, 0.9738687, -1.461109, 1, 0.3529412, 0, 1,
-1.533431, 0.2261418, -2.404852, 1, 0.3607843, 0, 1,
-1.52962, -1.049778, -2.217623, 1, 0.3647059, 0, 1,
-1.5212, -1.224763, -2.021433, 1, 0.372549, 0, 1,
-1.514846, -1.108377, -1.560418, 1, 0.3764706, 0, 1,
-1.513258, 0.1893381, -0.7552727, 1, 0.3843137, 0, 1,
-1.510285, 0.04749667, -1.308909, 1, 0.3882353, 0, 1,
-1.502832, -0.09498066, -1.728348, 1, 0.3960784, 0, 1,
-1.48704, 1.650755, -0.0458759, 1, 0.4039216, 0, 1,
-1.485177, 1.195792, -0.6903745, 1, 0.4078431, 0, 1,
-1.484278, -0.8273692, -0.9905131, 1, 0.4156863, 0, 1,
-1.466572, 0.1569364, -1.321286, 1, 0.4196078, 0, 1,
-1.451603, -0.4495445, -0.3583204, 1, 0.427451, 0, 1,
-1.430937, 0.09118821, -2.818775, 1, 0.4313726, 0, 1,
-1.412132, 0.4433016, -1.283431, 1, 0.4392157, 0, 1,
-1.409342, 0.977011, 0.7878235, 1, 0.4431373, 0, 1,
-1.408554, 1.227313, -0.1845049, 1, 0.4509804, 0, 1,
-1.404697, 1.455865, 0.2220071, 1, 0.454902, 0, 1,
-1.399963, 1.46302, -1.201548, 1, 0.4627451, 0, 1,
-1.395457, -0.6976441, -3.021286, 1, 0.4666667, 0, 1,
-1.375528, -0.4662393, -1.151357, 1, 0.4745098, 0, 1,
-1.369829, 0.378597, 2.056934, 1, 0.4784314, 0, 1,
-1.362599, 0.5526302, -2.037215, 1, 0.4862745, 0, 1,
-1.357709, 1.506695, -0.4222303, 1, 0.4901961, 0, 1,
-1.331817, 1.831825, -0.7814455, 1, 0.4980392, 0, 1,
-1.330304, 0.7880403, -0.6169873, 1, 0.5058824, 0, 1,
-1.327661, -0.1806229, -0.7339975, 1, 0.509804, 0, 1,
-1.321197, -0.5191165, -1.493487, 1, 0.5176471, 0, 1,
-1.307792, -0.3361696, -2.468719, 1, 0.5215687, 0, 1,
-1.305341, 0.5192969, 0.1181112, 1, 0.5294118, 0, 1,
-1.30344, -0.1629261, -1.501138, 1, 0.5333334, 0, 1,
-1.297825, 0.5462913, 0.4032755, 1, 0.5411765, 0, 1,
-1.293564, -1.152958, -3.014329, 1, 0.5450981, 0, 1,
-1.28683, 0.8069072, -0.9280238, 1, 0.5529412, 0, 1,
-1.285295, 1.865812, -1.225971, 1, 0.5568628, 0, 1,
-1.270269, 1.112867, 0.5473808, 1, 0.5647059, 0, 1,
-1.259201, -1.050464, -2.471612, 1, 0.5686275, 0, 1,
-1.258893, 0.476355, -2.715821, 1, 0.5764706, 0, 1,
-1.256139, -1.266815, -2.981029, 1, 0.5803922, 0, 1,
-1.216277, -2.282192, -2.910586, 1, 0.5882353, 0, 1,
-1.213006, 1.746908, -0.8261039, 1, 0.5921569, 0, 1,
-1.212924, 0.9725868, -0.1874281, 1, 0.6, 0, 1,
-1.207177, 0.2377231, -1.493703, 1, 0.6078432, 0, 1,
-1.199136, 0.2063001, -1.704326, 1, 0.6117647, 0, 1,
-1.194712, -0.03139097, -1.726634, 1, 0.6196079, 0, 1,
-1.19425, 0.9398986, -0.04712579, 1, 0.6235294, 0, 1,
-1.188822, 2.061893, -1.914949, 1, 0.6313726, 0, 1,
-1.188725, 2.373909, -1.259265, 1, 0.6352941, 0, 1,
-1.187871, 0.1262098, -2.353472, 1, 0.6431373, 0, 1,
-1.187195, 1.051678, 0.4976907, 1, 0.6470588, 0, 1,
-1.186149, 0.7290656, 1.275157, 1, 0.654902, 0, 1,
-1.180019, 0.8266777, -1.731344, 1, 0.6588235, 0, 1,
-1.172127, 1.920488, -0.3121209, 1, 0.6666667, 0, 1,
-1.172099, -1.012106, -2.068373, 1, 0.6705883, 0, 1,
-1.169637, -0.5301128, -1.697093, 1, 0.6784314, 0, 1,
-1.165335, -1.609149, -3.750064, 1, 0.682353, 0, 1,
-1.163853, -1.756853, -2.291465, 1, 0.6901961, 0, 1,
-1.159266, -1.678334, -1.366781, 1, 0.6941177, 0, 1,
-1.158557, 1.241418, -1.790428, 1, 0.7019608, 0, 1,
-1.142027, 0.7381169, 0.2031653, 1, 0.7098039, 0, 1,
-1.136058, -1.640671, -3.07637, 1, 0.7137255, 0, 1,
-1.134538, 0.6327953, -3.617499, 1, 0.7215686, 0, 1,
-1.126737, 0.1029727, -1.035962, 1, 0.7254902, 0, 1,
-1.116952, 0.3124533, 1.955631, 1, 0.7333333, 0, 1,
-1.114359, 0.5182374, -2.5076, 1, 0.7372549, 0, 1,
-1.108558, 0.7538897, 0.940945, 1, 0.7450981, 0, 1,
-1.10504, -1.326701, -2.286781, 1, 0.7490196, 0, 1,
-1.104559, 0.7641895, -2.127066, 1, 0.7568628, 0, 1,
-1.102821, -0.7782262, -2.542451, 1, 0.7607843, 0, 1,
-1.098313, -0.538785, -3.633313, 1, 0.7686275, 0, 1,
-1.082872, -0.3298886, -2.073677, 1, 0.772549, 0, 1,
-1.074332, -0.1417617, -0.3406541, 1, 0.7803922, 0, 1,
-1.073155, 0.7901681, -1.680778, 1, 0.7843137, 0, 1,
-1.07068, -0.5003014, -2.739397, 1, 0.7921569, 0, 1,
-1.069823, -0.2500803, -2.278325, 1, 0.7960784, 0, 1,
-1.068289, 1.99895, -0.3547018, 1, 0.8039216, 0, 1,
-1.066695, -0.8834457, -2.025893, 1, 0.8117647, 0, 1,
-1.066089, -0.9950129, -4.313587, 1, 0.8156863, 0, 1,
-1.06513, -0.6707022, -2.338691, 1, 0.8235294, 0, 1,
-1.063964, 0.6440915, -2.751197, 1, 0.827451, 0, 1,
-1.062469, -0.3602579, -2.633582, 1, 0.8352941, 0, 1,
-1.055266, 0.3211983, -0.4933215, 1, 0.8392157, 0, 1,
-1.05361, 3.104391, -1.255975, 1, 0.8470588, 0, 1,
-1.053401, -0.6143953, -1.753575, 1, 0.8509804, 0, 1,
-1.053372, -0.8939852, -2.538375, 1, 0.8588235, 0, 1,
-1.052967, 0.5030201, -1.486421, 1, 0.8627451, 0, 1,
-1.051062, -0.4856959, -2.729792, 1, 0.8705882, 0, 1,
-1.050603, 0.634082, -0.4768701, 1, 0.8745098, 0, 1,
-1.045811, 1.724751, -1.260453, 1, 0.8823529, 0, 1,
-1.045246, -0.2581698, -1.659402, 1, 0.8862745, 0, 1,
-1.039206, 0.07715043, -0.3681304, 1, 0.8941177, 0, 1,
-1.037044, 0.1253393, -2.057826, 1, 0.8980392, 0, 1,
-1.034507, 1.472018, -1.028649, 1, 0.9058824, 0, 1,
-1.026942, -0.8905905, -0.7246218, 1, 0.9137255, 0, 1,
-1.026638, -1.688154, -4.008214, 1, 0.9176471, 0, 1,
-1.024038, 0.4855746, -0.03374976, 1, 0.9254902, 0, 1,
-1.022766, -0.95865, -2.345723, 1, 0.9294118, 0, 1,
-1.018435, 1.51221, -0.3352927, 1, 0.9372549, 0, 1,
-1.018333, -0.008782834, -1.665527, 1, 0.9411765, 0, 1,
-1.013376, -0.2395586, -1.578543, 1, 0.9490196, 0, 1,
-1.010271, 1.367965, -0.3927229, 1, 0.9529412, 0, 1,
-1.008184, -0.8480458, -1.220359, 1, 0.9607843, 0, 1,
-1.006432, 0.7213793, 0.04842867, 1, 0.9647059, 0, 1,
-1.002298, -0.06420087, -2.535452, 1, 0.972549, 0, 1,
-0.9982999, 0.2361751, -1.270182, 1, 0.9764706, 0, 1,
-0.9865275, 0.1591575, -1.720705, 1, 0.9843137, 0, 1,
-0.9838458, 0.5947656, -1.353873, 1, 0.9882353, 0, 1,
-0.9761892, -1.345825, -2.325435, 1, 0.9960784, 0, 1,
-0.9758698, 1.845945, 0.2761412, 0.9960784, 1, 0, 1,
-0.9745875, -0.1818153, -1.61782, 0.9921569, 1, 0, 1,
-0.9731592, 0.1782802, -2.069808, 0.9843137, 1, 0, 1,
-0.9727332, 0.5703524, -2.606148, 0.9803922, 1, 0, 1,
-0.9715137, 0.08433904, -1.401586, 0.972549, 1, 0, 1,
-0.9710615, -0.3958356, -2.957996, 0.9686275, 1, 0, 1,
-0.970951, -0.8259085, -4.044145, 0.9607843, 1, 0, 1,
-0.9700508, 0.610526, -0.6584064, 0.9568627, 1, 0, 1,
-0.9674406, -0.4168736, -2.004057, 0.9490196, 1, 0, 1,
-0.9662814, 1.694387, -0.6416128, 0.945098, 1, 0, 1,
-0.9523926, 2.366894, -1.208546, 0.9372549, 1, 0, 1,
-0.9476778, 0.4749972, -1.39283, 0.9333333, 1, 0, 1,
-0.9459743, 0.05203896, -2.860658, 0.9254902, 1, 0, 1,
-0.9447711, 1.066428, -0.6381196, 0.9215686, 1, 0, 1,
-0.9436595, -0.4857333, -2.75146, 0.9137255, 1, 0, 1,
-0.943483, -0.7193311, -3.030042, 0.9098039, 1, 0, 1,
-0.9357942, 0.0117795, -0.2347524, 0.9019608, 1, 0, 1,
-0.9309028, -0.5135114, -2.020024, 0.8941177, 1, 0, 1,
-0.9294411, 0.9326097, 0.5503684, 0.8901961, 1, 0, 1,
-0.9279023, 0.1012162, -1.087291, 0.8823529, 1, 0, 1,
-0.9273809, 1.409577, -0.5548037, 0.8784314, 1, 0, 1,
-0.9272678, -0.03670143, -2.183221, 0.8705882, 1, 0, 1,
-0.9256319, 1.774766, 1.356661, 0.8666667, 1, 0, 1,
-0.9248222, -0.6571509, -2.03405, 0.8588235, 1, 0, 1,
-0.9243347, -0.04302143, -0.7079317, 0.854902, 1, 0, 1,
-0.9194396, 0.1871038, -0.7792014, 0.8470588, 1, 0, 1,
-0.9158442, 0.8939779, -3.997527, 0.8431373, 1, 0, 1,
-0.9152514, 0.4397499, -0.8642219, 0.8352941, 1, 0, 1,
-0.9132245, -0.4060582, -3.295304, 0.8313726, 1, 0, 1,
-0.9096083, -0.8640122, -0.08738216, 0.8235294, 1, 0, 1,
-0.903644, -0.3409488, -2.279135, 0.8196079, 1, 0, 1,
-0.8968962, 1.017541, -1.594893, 0.8117647, 1, 0, 1,
-0.8930346, -0.644057, -0.6653221, 0.8078431, 1, 0, 1,
-0.8902158, -0.1169289, -0.9713622, 0.8, 1, 0, 1,
-0.8874258, 0.5535884, -1.074764, 0.7921569, 1, 0, 1,
-0.8856667, 1.163152, -2.96208, 0.7882353, 1, 0, 1,
-0.8855481, -0.660417, -1.387715, 0.7803922, 1, 0, 1,
-0.8842583, -0.9635676, -3.463869, 0.7764706, 1, 0, 1,
-0.8805165, 1.157726, -0.3202405, 0.7686275, 1, 0, 1,
-0.8776631, 0.6192392, -0.4485017, 0.7647059, 1, 0, 1,
-0.8726969, -0.7496163, -2.741074, 0.7568628, 1, 0, 1,
-0.870838, -0.5123406, -3.697479, 0.7529412, 1, 0, 1,
-0.8694603, -0.1320457, -0.2192202, 0.7450981, 1, 0, 1,
-0.8480691, -0.8638905, -2.08272, 0.7411765, 1, 0, 1,
-0.8443706, 0.2614352, -1.567924, 0.7333333, 1, 0, 1,
-0.8435513, -1.507393, -4.051653, 0.7294118, 1, 0, 1,
-0.8379412, 1.552822, -1.217079, 0.7215686, 1, 0, 1,
-0.8360885, -0.5176777, -2.39167, 0.7176471, 1, 0, 1,
-0.8331667, -1.479139, -3.095711, 0.7098039, 1, 0, 1,
-0.8321121, 0.4637935, 0.2964315, 0.7058824, 1, 0, 1,
-0.8294213, 0.1331615, -2.275964, 0.6980392, 1, 0, 1,
-0.8288913, -0.1948592, 0.2022847, 0.6901961, 1, 0, 1,
-0.8258203, -1.406643, -2.283994, 0.6862745, 1, 0, 1,
-0.8145772, -0.9692253, -3.399428, 0.6784314, 1, 0, 1,
-0.8044268, -0.04699644, -1.642651, 0.6745098, 1, 0, 1,
-0.7969043, 0.4345088, -0.06759524, 0.6666667, 1, 0, 1,
-0.7947699, 1.021605, -2.196838, 0.6627451, 1, 0, 1,
-0.7932256, 0.2107083, -2.29087, 0.654902, 1, 0, 1,
-0.7910861, -0.5701426, -2.900943, 0.6509804, 1, 0, 1,
-0.7847642, 0.4141957, -1.237513, 0.6431373, 1, 0, 1,
-0.7825211, -0.9079008, -1.928764, 0.6392157, 1, 0, 1,
-0.7686384, 0.06783892, -1.462036, 0.6313726, 1, 0, 1,
-0.7632217, 0.2398743, -2.829318, 0.627451, 1, 0, 1,
-0.7628351, -0.7080841, -1.438671, 0.6196079, 1, 0, 1,
-0.7617075, 0.4200729, -0.7677112, 0.6156863, 1, 0, 1,
-0.7567334, 1.586936, 0.0903943, 0.6078432, 1, 0, 1,
-0.7554048, 0.3710695, -0.3084587, 0.6039216, 1, 0, 1,
-0.7502852, -0.836026, -3.344318, 0.5960785, 1, 0, 1,
-0.7486354, 0.6559536, -1.900658, 0.5882353, 1, 0, 1,
-0.7484135, -0.5594119, -0.9004239, 0.5843138, 1, 0, 1,
-0.7478884, -1.024292, -0.7035531, 0.5764706, 1, 0, 1,
-0.7473652, -0.2611962, -3.632624, 0.572549, 1, 0, 1,
-0.746551, -1.56894, -2.311609, 0.5647059, 1, 0, 1,
-0.746126, 1.073825, -0.1591977, 0.5607843, 1, 0, 1,
-0.7453555, -0.3571123, -2.06297, 0.5529412, 1, 0, 1,
-0.7390552, 0.5005227, -1.529298, 0.5490196, 1, 0, 1,
-0.7356831, 1.280402, -0.1697048, 0.5411765, 1, 0, 1,
-0.7280353, -0.593276, -3.363687, 0.5372549, 1, 0, 1,
-0.727521, -0.5220222, -4.159299, 0.5294118, 1, 0, 1,
-0.726863, 0.5569504, -0.5128715, 0.5254902, 1, 0, 1,
-0.7175431, -0.1177071, -2.017332, 0.5176471, 1, 0, 1,
-0.7164372, -0.4499796, -2.631918, 0.5137255, 1, 0, 1,
-0.7140339, 0.5478479, 0.2948208, 0.5058824, 1, 0, 1,
-0.7077907, 0.3147455, -1.558932, 0.5019608, 1, 0, 1,
-0.705712, -0.1175054, -2.778473, 0.4941176, 1, 0, 1,
-0.6951265, -0.1475585, -2.408633, 0.4862745, 1, 0, 1,
-0.6944229, -0.9666672, -2.447797, 0.4823529, 1, 0, 1,
-0.6923505, 1.390221, -0.4505789, 0.4745098, 1, 0, 1,
-0.6897387, -2.185508, -2.695668, 0.4705882, 1, 0, 1,
-0.6876481, -0.3083074, -2.102354, 0.4627451, 1, 0, 1,
-0.6853827, -0.8126739, -3.461699, 0.4588235, 1, 0, 1,
-0.685216, 0.8513345, -0.633689, 0.4509804, 1, 0, 1,
-0.6851195, 0.3842697, -0.9777468, 0.4470588, 1, 0, 1,
-0.684352, -0.7332724, -3.197015, 0.4392157, 1, 0, 1,
-0.6834003, -0.5354788, -1.644541, 0.4352941, 1, 0, 1,
-0.6824673, 0.1314979, -1.628317, 0.427451, 1, 0, 1,
-0.6786968, -1.062039, -3.16243, 0.4235294, 1, 0, 1,
-0.6775807, -1.427529, -1.576723, 0.4156863, 1, 0, 1,
-0.668353, -0.7783987, -2.473283, 0.4117647, 1, 0, 1,
-0.6616036, 0.4480671, -1.067394, 0.4039216, 1, 0, 1,
-0.6584243, -0.9456078, -2.302824, 0.3960784, 1, 0, 1,
-0.6509516, 0.4087987, -1.070317, 0.3921569, 1, 0, 1,
-0.6468097, 0.8424329, -1.844795, 0.3843137, 1, 0, 1,
-0.6464821, -0.8741611, -4.127131, 0.3803922, 1, 0, 1,
-0.6406234, -1.501018, -1.878107, 0.372549, 1, 0, 1,
-0.6354325, 0.3635438, 0.9136454, 0.3686275, 1, 0, 1,
-0.6335145, 0.8542274, -0.07589748, 0.3607843, 1, 0, 1,
-0.6332695, -0.359552, -2.29165, 0.3568628, 1, 0, 1,
-0.6330663, 1.408783, -0.03731599, 0.3490196, 1, 0, 1,
-0.6322948, 0.3130804, -2.709585, 0.345098, 1, 0, 1,
-0.6283151, -0.4286786, -1.267856, 0.3372549, 1, 0, 1,
-0.62624, -0.1729383, -2.032253, 0.3333333, 1, 0, 1,
-0.6242391, -1.332668, -2.575894, 0.3254902, 1, 0, 1,
-0.6222554, -0.3476448, -4.038533, 0.3215686, 1, 0, 1,
-0.6140199, 0.4761424, -0.8607835, 0.3137255, 1, 0, 1,
-0.611782, 0.7991825, -0.3825437, 0.3098039, 1, 0, 1,
-0.6075513, -0.3512532, -1.186617, 0.3019608, 1, 0, 1,
-0.6041124, 0.5432254, -0.770804, 0.2941177, 1, 0, 1,
-0.5961397, 0.1241745, -3.002736, 0.2901961, 1, 0, 1,
-0.5948804, 0.3867494, -0.8708897, 0.282353, 1, 0, 1,
-0.5905843, 1.151197, -0.5469586, 0.2784314, 1, 0, 1,
-0.5894761, -0.8224962, -3.760558, 0.2705882, 1, 0, 1,
-0.5866786, 1.558076, -0.2626089, 0.2666667, 1, 0, 1,
-0.5846968, 0.7455536, -0.3590645, 0.2588235, 1, 0, 1,
-0.5830933, -0.8629357, -2.463255, 0.254902, 1, 0, 1,
-0.5825561, 0.4767756, -1.937003, 0.2470588, 1, 0, 1,
-0.5809874, -0.4297857, -1.397063, 0.2431373, 1, 0, 1,
-0.568953, -0.4490893, -2.111729, 0.2352941, 1, 0, 1,
-0.5679093, -1.20259, -1.970378, 0.2313726, 1, 0, 1,
-0.5664627, -0.2869599, -0.8286716, 0.2235294, 1, 0, 1,
-0.5663611, -1.266324, -2.511348, 0.2196078, 1, 0, 1,
-0.56631, -0.1412547, -1.874794, 0.2117647, 1, 0, 1,
-0.5654037, -0.6695846, -0.7439709, 0.2078431, 1, 0, 1,
-0.560073, -0.2365034, -2.813581, 0.2, 1, 0, 1,
-0.5579552, 2.107561, 0.7120264, 0.1921569, 1, 0, 1,
-0.5459549, 0.2173763, -1.659258, 0.1882353, 1, 0, 1,
-0.5457833, 0.5125397, -2.325585, 0.1803922, 1, 0, 1,
-0.5375065, 0.03335685, -1.740047, 0.1764706, 1, 0, 1,
-0.5333433, -0.546664, -0.1444728, 0.1686275, 1, 0, 1,
-0.5276417, 0.9881343, -1.098561, 0.1647059, 1, 0, 1,
-0.5247563, -1.200296, -3.494423, 0.1568628, 1, 0, 1,
-0.5142323, 1.42516, -1.326527, 0.1529412, 1, 0, 1,
-0.5133389, 0.3597463, 0.5530439, 0.145098, 1, 0, 1,
-0.5076866, -0.08184522, -2.079343, 0.1411765, 1, 0, 1,
-0.5076743, -0.6662211, -3.415464, 0.1333333, 1, 0, 1,
-0.5073416, -0.550909, -2.591422, 0.1294118, 1, 0, 1,
-0.5043412, 0.2028019, -0.7670484, 0.1215686, 1, 0, 1,
-0.4994965, 2.011078, -1.016413, 0.1176471, 1, 0, 1,
-0.497817, 0.4735823, -0.1537221, 0.1098039, 1, 0, 1,
-0.496999, -0.5231026, -2.39681, 0.1058824, 1, 0, 1,
-0.4924769, 0.01943131, -0.7073627, 0.09803922, 1, 0, 1,
-0.4923396, 1.108427, -0.1061349, 0.09019608, 1, 0, 1,
-0.4898812, -0.5867953, -0.1503045, 0.08627451, 1, 0, 1,
-0.4896865, -0.3670943, -3.477385, 0.07843138, 1, 0, 1,
-0.4825293, 0.00119162, -2.483422, 0.07450981, 1, 0, 1,
-0.4813146, -0.2655379, -2.49101, 0.06666667, 1, 0, 1,
-0.4727816, -0.07974999, -1.005738, 0.0627451, 1, 0, 1,
-0.4658361, -0.2002124, -3.211904, 0.05490196, 1, 0, 1,
-0.4655026, -0.006909863, -1.905334, 0.05098039, 1, 0, 1,
-0.462547, -0.3102971, -1.297256, 0.04313726, 1, 0, 1,
-0.46106, -0.224812, -1.799184, 0.03921569, 1, 0, 1,
-0.4605463, 1.51157, 0.06977913, 0.03137255, 1, 0, 1,
-0.4571558, 0.1713089, -2.488861, 0.02745098, 1, 0, 1,
-0.4568596, 1.859566, -0.4966973, 0.01960784, 1, 0, 1,
-0.4550339, -0.5607514, -2.416341, 0.01568628, 1, 0, 1,
-0.4539732, -0.09243483, -1.942655, 0.007843138, 1, 0, 1,
-0.4511675, -0.1665975, -0.8479066, 0.003921569, 1, 0, 1,
-0.4475497, 1.221633, -1.922458, 0, 1, 0.003921569, 1,
-0.4445124, 0.777444, -0.8759128, 0, 1, 0.01176471, 1,
-0.4438293, 0.1047232, -1.918458, 0, 1, 0.01568628, 1,
-0.4419321, 1.321321, 0.1248735, 0, 1, 0.02352941, 1,
-0.4393972, 0.466995, -1.961314, 0, 1, 0.02745098, 1,
-0.4388303, -0.004258712, -1.154124, 0, 1, 0.03529412, 1,
-0.4381678, -0.06563484, -2.246641, 0, 1, 0.03921569, 1,
-0.437319, -1.130967, -2.641914, 0, 1, 0.04705882, 1,
-0.4319028, -0.539384, -2.179524, 0, 1, 0.05098039, 1,
-0.4316599, 0.4611363, -1.235213, 0, 1, 0.05882353, 1,
-0.4296175, -1.024967, -2.808365, 0, 1, 0.0627451, 1,
-0.429037, -1.71196, -4.22177, 0, 1, 0.07058824, 1,
-0.4285424, 1.695109, 1.846589, 0, 1, 0.07450981, 1,
-0.4271227, -1.01361, -3.580511, 0, 1, 0.08235294, 1,
-0.4260982, 0.8917559, -0.1017804, 0, 1, 0.08627451, 1,
-0.4196924, 0.09937858, -1.151691, 0, 1, 0.09411765, 1,
-0.4193572, 0.5794011, -0.3303624, 0, 1, 0.1019608, 1,
-0.4155364, 0.322998, -2.165209, 0, 1, 0.1058824, 1,
-0.4118278, -1.056261, -2.456295, 0, 1, 0.1137255, 1,
-0.4110523, 0.8557932, -1.365295, 0, 1, 0.1176471, 1,
-0.4103543, -1.135267, -1.709017, 0, 1, 0.1254902, 1,
-0.4060113, -0.9749372, -2.902421, 0, 1, 0.1294118, 1,
-0.4003336, -0.160775, 0.1978001, 0, 1, 0.1372549, 1,
-0.3961582, 0.1764267, 0.5123658, 0, 1, 0.1411765, 1,
-0.3910035, -0.08479966, -1.634426, 0, 1, 0.1490196, 1,
-0.3899188, 1.472315, -0.2536445, 0, 1, 0.1529412, 1,
-0.3855432, -2.148281, -3.188111, 0, 1, 0.1607843, 1,
-0.3815181, 0.1439447, -3.203177, 0, 1, 0.1647059, 1,
-0.3797277, 0.6931835, -1.034436, 0, 1, 0.172549, 1,
-0.3689488, -1.980656, -2.671434, 0, 1, 0.1764706, 1,
-0.3663386, 0.1984919, -1.96832, 0, 1, 0.1843137, 1,
-0.3640597, 0.4793865, -0.2560115, 0, 1, 0.1882353, 1,
-0.362952, 0.2925069, -0.2562808, 0, 1, 0.1960784, 1,
-0.3627016, 0.8447403, 0.113043, 0, 1, 0.2039216, 1,
-0.3602308, -0.6009784, -1.623438, 0, 1, 0.2078431, 1,
-0.3570067, -0.2991923, 0.1672519, 0, 1, 0.2156863, 1,
-0.3564985, -0.5603033, -2.044439, 0, 1, 0.2196078, 1,
-0.3534357, -0.242868, -0.8788331, 0, 1, 0.227451, 1,
-0.3526145, 1.652918, 0.1137902, 0, 1, 0.2313726, 1,
-0.35006, 0.3967183, 0.0669148, 0, 1, 0.2392157, 1,
-0.3498275, 0.8944594, -0.006127408, 0, 1, 0.2431373, 1,
-0.3488309, -0.726414, -2.664321, 0, 1, 0.2509804, 1,
-0.3449845, -1.354999, -2.793982, 0, 1, 0.254902, 1,
-0.3389667, -1.143131, -4.041997, 0, 1, 0.2627451, 1,
-0.3343149, 1.115221, 0.09491302, 0, 1, 0.2666667, 1,
-0.3340577, -0.4809532, -1.214896, 0, 1, 0.2745098, 1,
-0.3321821, 1.015857, -0.293619, 0, 1, 0.2784314, 1,
-0.3308144, -1.790935, -3.587497, 0, 1, 0.2862745, 1,
-0.3241057, -1.130685, -2.7719, 0, 1, 0.2901961, 1,
-0.3162901, 2.010844, 0.4928551, 0, 1, 0.2980392, 1,
-0.3161861, -0.9899025, -3.156038, 0, 1, 0.3058824, 1,
-0.3128637, -0.1564304, -1.856964, 0, 1, 0.3098039, 1,
-0.311904, 1.032242, 0.02334552, 0, 1, 0.3176471, 1,
-0.307731, 0.03101165, -0.5615515, 0, 1, 0.3215686, 1,
-0.3065793, -0.7632375, -2.160986, 0, 1, 0.3294118, 1,
-0.3063742, 0.9261391, 0.1734756, 0, 1, 0.3333333, 1,
-0.3014225, 1.242396, 0.797101, 0, 1, 0.3411765, 1,
-0.2995589, 1.543115, -0.9131524, 0, 1, 0.345098, 1,
-0.2941423, -0.8183918, -1.755789, 0, 1, 0.3529412, 1,
-0.2913673, -0.1496422, -0.9310225, 0, 1, 0.3568628, 1,
-0.2892852, -0.8107389, -3.525917, 0, 1, 0.3647059, 1,
-0.2864965, 0.4310626, -2.568678, 0, 1, 0.3686275, 1,
-0.2854618, 0.4968401, -0.08800729, 0, 1, 0.3764706, 1,
-0.2848214, 0.9373342, 0.7086601, 0, 1, 0.3803922, 1,
-0.2831769, 2.081943, -0.559553, 0, 1, 0.3882353, 1,
-0.2824861, 1.675046, -0.406335, 0, 1, 0.3921569, 1,
-0.2811489, -1.237286, -1.54099, 0, 1, 0.4, 1,
-0.2811444, -1.575808, -2.861205, 0, 1, 0.4078431, 1,
-0.2792734, -0.5607346, -2.421069, 0, 1, 0.4117647, 1,
-0.2783093, 0.1850686, -1.233103, 0, 1, 0.4196078, 1,
-0.2778812, 0.9805902, 0.122109, 0, 1, 0.4235294, 1,
-0.2759326, -0.366338, -3.13204, 0, 1, 0.4313726, 1,
-0.272909, 0.2959348, 0.005251145, 0, 1, 0.4352941, 1,
-0.2722107, -0.6493249, -2.807061, 0, 1, 0.4431373, 1,
-0.2720858, -0.54041, -3.496308, 0, 1, 0.4470588, 1,
-0.269593, -0.5071765, -3.719468, 0, 1, 0.454902, 1,
-0.267627, 1.606391, -2.357898, 0, 1, 0.4588235, 1,
-0.2673839, -1.068788, -1.233105, 0, 1, 0.4666667, 1,
-0.2667651, 1.013144, -0.147374, 0, 1, 0.4705882, 1,
-0.2665326, 0.5948739, -1.859704, 0, 1, 0.4784314, 1,
-0.2618234, 0.1000367, -0.59, 0, 1, 0.4823529, 1,
-0.2570491, 0.543862, -1.2909, 0, 1, 0.4901961, 1,
-0.2564625, 1.919417, -0.7845374, 0, 1, 0.4941176, 1,
-0.2511904, -0.3644691, -2.729723, 0, 1, 0.5019608, 1,
-0.25085, 1.911496, -0.1540463, 0, 1, 0.509804, 1,
-0.2450712, -0.4397937, -3.377094, 0, 1, 0.5137255, 1,
-0.244279, -0.7547036, -2.780272, 0, 1, 0.5215687, 1,
-0.2432643, -1.180469, -2.941377, 0, 1, 0.5254902, 1,
-0.2350274, 1.564058, -1.491569, 0, 1, 0.5333334, 1,
-0.2336506, -0.6286808, -3.666382, 0, 1, 0.5372549, 1,
-0.2264381, 0.03014795, -1.26952, 0, 1, 0.5450981, 1,
-0.2194752, 0.3008151, -0.5095773, 0, 1, 0.5490196, 1,
-0.2142924, 0.9929984, 0.2302928, 0, 1, 0.5568628, 1,
-0.2141517, 0.762731, -0.2064228, 0, 1, 0.5607843, 1,
-0.2139668, -0.5180283, -2.095088, 0, 1, 0.5686275, 1,
-0.2091258, 0.5606149, -0.6715784, 0, 1, 0.572549, 1,
-0.203597, 0.5723945, -0.06407142, 0, 1, 0.5803922, 1,
-0.1950769, -0.2213122, -0.403641, 0, 1, 0.5843138, 1,
-0.1946428, -0.5841113, -2.994205, 0, 1, 0.5921569, 1,
-0.1937704, 0.3303804, -0.6587407, 0, 1, 0.5960785, 1,
-0.193343, -0.2482258, -4.222381, 0, 1, 0.6039216, 1,
-0.1923836, 0.4853371, -0.1772504, 0, 1, 0.6117647, 1,
-0.1906258, -0.6423492, -2.466379, 0, 1, 0.6156863, 1,
-0.1822092, 0.1426024, -3.632125, 0, 1, 0.6235294, 1,
-0.181669, -0.6256315, -1.728838, 0, 1, 0.627451, 1,
-0.1809454, -1.182644, -3.260149, 0, 1, 0.6352941, 1,
-0.17647, -3.080439, -2.855904, 0, 1, 0.6392157, 1,
-0.1758765, -0.06558271, -1.360474, 0, 1, 0.6470588, 1,
-0.175624, -1.284529, -2.092259, 0, 1, 0.6509804, 1,
-0.1698439, 0.6903603, 0.3099186, 0, 1, 0.6588235, 1,
-0.169366, -1.10903, -4.447251, 0, 1, 0.6627451, 1,
-0.1676057, 0.394058, 1.05617, 0, 1, 0.6705883, 1,
-0.1662483, 0.5131789, 0.7729117, 0, 1, 0.6745098, 1,
-0.1608499, -0.5526335, -4.01982, 0, 1, 0.682353, 1,
-0.1588238, -2.112645, -2.945574, 0, 1, 0.6862745, 1,
-0.1570346, -1.709448, -4.032726, 0, 1, 0.6941177, 1,
-0.1564809, 0.2721111, -0.1943498, 0, 1, 0.7019608, 1,
-0.1540697, -0.4405986, -3.948423, 0, 1, 0.7058824, 1,
-0.1524075, 0.1041453, -0.72324, 0, 1, 0.7137255, 1,
-0.1520533, 0.5750719, -0.08145766, 0, 1, 0.7176471, 1,
-0.1515227, 1.165379, -0.1179402, 0, 1, 0.7254902, 1,
-0.1514626, -0.3353809, -5.010319, 0, 1, 0.7294118, 1,
-0.1503113, 2.198823, -1.303942, 0, 1, 0.7372549, 1,
-0.1452066, 0.7502176, -0.1198671, 0, 1, 0.7411765, 1,
-0.1332943, -0.1818291, -2.230156, 0, 1, 0.7490196, 1,
-0.1307362, -1.070648, -2.172805, 0, 1, 0.7529412, 1,
-0.129855, 0.8590045, -1.089976, 0, 1, 0.7607843, 1,
-0.1290417, 1.578787, -0.3314452, 0, 1, 0.7647059, 1,
-0.1271205, 0.2820191, 2.756636, 0, 1, 0.772549, 1,
-0.1221928, 1.216624, -0.7502555, 0, 1, 0.7764706, 1,
-0.1201867, 0.04508374, -1.07558, 0, 1, 0.7843137, 1,
-0.1178401, -1.10434, -1.782596, 0, 1, 0.7882353, 1,
-0.1138359, -0.2842321, -4.217121, 0, 1, 0.7960784, 1,
-0.1123931, -0.1763974, -2.785199, 0, 1, 0.8039216, 1,
-0.1121797, -0.7808658, -2.395552, 0, 1, 0.8078431, 1,
-0.09757932, 1.91737, -0.4886927, 0, 1, 0.8156863, 1,
-0.09712212, 1.807672, -1.109879, 0, 1, 0.8196079, 1,
-0.09673871, -0.6219475, -1.547373, 0, 1, 0.827451, 1,
-0.09663987, -0.02070853, -2.834918, 0, 1, 0.8313726, 1,
-0.09498581, -3.007219, -3.881836, 0, 1, 0.8392157, 1,
-0.09381501, 0.004339097, -2.622926, 0, 1, 0.8431373, 1,
-0.09223595, -1.114867, -3.694057, 0, 1, 0.8509804, 1,
-0.09211823, -0.1341138, -3.225584, 0, 1, 0.854902, 1,
-0.09209585, -0.4682502, -3.308833, 0, 1, 0.8627451, 1,
-0.08700795, -0.4407136, -3.539138, 0, 1, 0.8666667, 1,
-0.08663461, -0.872445, -4.175882, 0, 1, 0.8745098, 1,
-0.08409734, -0.1629765, -3.851283, 0, 1, 0.8784314, 1,
-0.08213932, -0.4007541, -1.510507, 0, 1, 0.8862745, 1,
-0.07477172, -1.003925, -2.006239, 0, 1, 0.8901961, 1,
-0.07265908, -1.730706, -2.704143, 0, 1, 0.8980392, 1,
-0.07038148, -0.9271016, -3.741268, 0, 1, 0.9058824, 1,
-0.06950376, 1.680895, 0.5815211, 0, 1, 0.9098039, 1,
-0.06898455, -0.3816662, -3.413883, 0, 1, 0.9176471, 1,
-0.06622452, 0.3685337, 1.365528, 0, 1, 0.9215686, 1,
-0.06194957, 1.7858, 1.361884, 0, 1, 0.9294118, 1,
-0.05630859, -1.818669, -2.78102, 0, 1, 0.9333333, 1,
-0.05503333, 0.7338471, 0.1868282, 0, 1, 0.9411765, 1,
-0.0537882, 1.677633, -1.353373, 0, 1, 0.945098, 1,
-0.04624573, 1.997578, 1.720983, 0, 1, 0.9529412, 1,
-0.0450016, 0.2639958, -0.6977572, 0, 1, 0.9568627, 1,
-0.04366128, -0.4024166, -2.475934, 0, 1, 0.9647059, 1,
-0.04137687, 1.776861, -0.9172098, 0, 1, 0.9686275, 1,
-0.04017251, 0.8196868, -0.2625712, 0, 1, 0.9764706, 1,
-0.03913585, -0.1439986, -0.8500894, 0, 1, 0.9803922, 1,
-0.03541693, 0.6830262, -0.7282298, 0, 1, 0.9882353, 1,
-0.0349636, 0.1381912, -1.116039, 0, 1, 0.9921569, 1,
-0.03382022, -0.1815629, -1.483576, 0, 1, 1, 1,
-0.03356227, -1.219538, -2.918831, 0, 0.9921569, 1, 1,
-0.03199156, 1.686545, 0.730992, 0, 0.9882353, 1, 1,
-0.02997067, 0.6072382, 0.2487001, 0, 0.9803922, 1, 1,
-0.0238113, 0.1243473, -0.8022931, 0, 0.9764706, 1, 1,
-0.02280251, 0.4658683, 1.37022, 0, 0.9686275, 1, 1,
-0.02234193, -0.8171479, -4.422737, 0, 0.9647059, 1, 1,
-0.01891379, 0.3279165, 0.02103732, 0, 0.9568627, 1, 1,
-0.01863714, -1.205397, -2.845793, 0, 0.9529412, 1, 1,
-0.01365534, 2.765661, -0.2959454, 0, 0.945098, 1, 1,
-0.007078069, 1.019642, -1.433358, 0, 0.9411765, 1, 1,
-0.006973313, 0.8794131, 0.8272602, 0, 0.9333333, 1, 1,
-0.006968459, 0.5608964, -0.08600041, 0, 0.9294118, 1, 1,
0.002363631, -0.4367485, 4.912905, 0, 0.9215686, 1, 1,
0.002605342, -0.4472744, 1.683433, 0, 0.9176471, 1, 1,
0.004694011, 0.004018715, 1.93002, 0, 0.9098039, 1, 1,
0.006879879, -0.6183304, 3.403306, 0, 0.9058824, 1, 1,
0.007294054, 0.03343064, -2.08938, 0, 0.8980392, 1, 1,
0.007715211, 1.444724, -0.9949902, 0, 0.8901961, 1, 1,
0.008886999, -0.7362096, 3.630392, 0, 0.8862745, 1, 1,
0.0090462, -0.3019503, 2.232096, 0, 0.8784314, 1, 1,
0.01286382, -0.8184397, 2.123328, 0, 0.8745098, 1, 1,
0.01643088, 0.2015638, -0.0624877, 0, 0.8666667, 1, 1,
0.01791526, -0.02169755, 2.985252, 0, 0.8627451, 1, 1,
0.01879257, 0.4914396, 1.112013, 0, 0.854902, 1, 1,
0.01906447, -0.2775689, 2.811913, 0, 0.8509804, 1, 1,
0.01920205, 0.9238743, -0.8435903, 0, 0.8431373, 1, 1,
0.02090885, 0.8071685, 0.3142452, 0, 0.8392157, 1, 1,
0.02091168, 1.194032, -0.6462619, 0, 0.8313726, 1, 1,
0.02092198, 1.307326, -0.5740618, 0, 0.827451, 1, 1,
0.02349626, -0.8495794, 4.589953, 0, 0.8196079, 1, 1,
0.02502284, -1.277227, 3.485235, 0, 0.8156863, 1, 1,
0.02693292, -0.2013235, 1.356104, 0, 0.8078431, 1, 1,
0.0280494, 1.839309, -0.8689715, 0, 0.8039216, 1, 1,
0.0280954, -0.7978542, 1.979156, 0, 0.7960784, 1, 1,
0.02938231, -1.158683, 4.282554, 0, 0.7882353, 1, 1,
0.03327759, -1.228771, 3.306356, 0, 0.7843137, 1, 1,
0.0350401, 0.5604255, 1.643974, 0, 0.7764706, 1, 1,
0.03606488, 0.1649386, 0.5533186, 0, 0.772549, 1, 1,
0.03679302, -0.4912583, 3.015936, 0, 0.7647059, 1, 1,
0.03748308, 0.3270015, -0.8780674, 0, 0.7607843, 1, 1,
0.04510465, -0.6617799, 2.891643, 0, 0.7529412, 1, 1,
0.05920618, -0.03945037, 0.9294785, 0, 0.7490196, 1, 1,
0.05986089, 1.042725, 0.4881841, 0, 0.7411765, 1, 1,
0.06075966, -1.294617, 1.034178, 0, 0.7372549, 1, 1,
0.06093204, -1.980085, 3.620239, 0, 0.7294118, 1, 1,
0.06196642, 0.4125542, 1.54384, 0, 0.7254902, 1, 1,
0.0650806, 0.2406413, -1.433183, 0, 0.7176471, 1, 1,
0.06739898, -1.296239, 3.358031, 0, 0.7137255, 1, 1,
0.06836177, -0.3802686, 1.935815, 0, 0.7058824, 1, 1,
0.06861918, -1.093277, 1.184617, 0, 0.6980392, 1, 1,
0.06938444, 1.262671, 0.4120071, 0, 0.6941177, 1, 1,
0.07195994, -0.8423939, 4.395065, 0, 0.6862745, 1, 1,
0.07380203, -1.043322, 3.89113, 0, 0.682353, 1, 1,
0.08162757, 0.01939965, 0.001776611, 0, 0.6745098, 1, 1,
0.08322843, 0.3756744, -1.224321, 0, 0.6705883, 1, 1,
0.09211916, -2.205542, 5.23034, 0, 0.6627451, 1, 1,
0.09317705, -1.976064, 2.854324, 0, 0.6588235, 1, 1,
0.09646024, -1.543, 3.870964, 0, 0.6509804, 1, 1,
0.09646252, 0.8194014, 1.229719, 0, 0.6470588, 1, 1,
0.1026311, 0.2646594, -0.5726429, 0, 0.6392157, 1, 1,
0.1055774, 0.3720797, 0.1614511, 0, 0.6352941, 1, 1,
0.1059066, -1.72276, 4.185511, 0, 0.627451, 1, 1,
0.1091023, 1.426262, -0.9815264, 0, 0.6235294, 1, 1,
0.1137129, 0.9497214, -0.005403187, 0, 0.6156863, 1, 1,
0.1153041, -0.08314259, 0.2367045, 0, 0.6117647, 1, 1,
0.1170232, 0.1959801, 0.7276726, 0, 0.6039216, 1, 1,
0.1232962, -0.408265, 1.220484, 0, 0.5960785, 1, 1,
0.125659, 1.340573, 1.619795, 0, 0.5921569, 1, 1,
0.1286154, 0.64895, 1.114317, 0, 0.5843138, 1, 1,
0.1298499, 0.3884194, 1.645402, 0, 0.5803922, 1, 1,
0.1322577, -0.2508059, 4.297632, 0, 0.572549, 1, 1,
0.135731, 0.3481887, -1.910738, 0, 0.5686275, 1, 1,
0.1362713, 0.494591, -0.4961644, 0, 0.5607843, 1, 1,
0.1406024, 0.2928404, 1.550964, 0, 0.5568628, 1, 1,
0.1413519, -0.6296169, 3.772915, 0, 0.5490196, 1, 1,
0.141845, 0.4106638, -0.3314025, 0, 0.5450981, 1, 1,
0.1474005, 0.1596565, 1.00743, 0, 0.5372549, 1, 1,
0.1490643, 0.110498, 1.010346, 0, 0.5333334, 1, 1,
0.1522017, 2.214066, -0.7762507, 0, 0.5254902, 1, 1,
0.1545549, -0.5925648, 1.001214, 0, 0.5215687, 1, 1,
0.154763, -1.181132, 3.469416, 0, 0.5137255, 1, 1,
0.1559272, 1.312219, 2.492872, 0, 0.509804, 1, 1,
0.1568739, -0.3966136, 1.9646, 0, 0.5019608, 1, 1,
0.1593039, -0.695321, 3.392888, 0, 0.4941176, 1, 1,
0.1617257, 1.158816, 1.068152, 0, 0.4901961, 1, 1,
0.1621383, 0.8323066, -0.2480714, 0, 0.4823529, 1, 1,
0.1765991, -0.01514691, 0.4512168, 0, 0.4784314, 1, 1,
0.178998, 0.2767482, -0.3164669, 0, 0.4705882, 1, 1,
0.1800128, 0.9542329, 0.3575929, 0, 0.4666667, 1, 1,
0.1815506, -0.6269076, 2.213495, 0, 0.4588235, 1, 1,
0.1825123, 0.1769441, 3.046482, 0, 0.454902, 1, 1,
0.1847208, -0.2728656, 3.639881, 0, 0.4470588, 1, 1,
0.1849428, -0.6523159, 3.575395, 0, 0.4431373, 1, 1,
0.1867316, 0.6351703, -0.4185019, 0, 0.4352941, 1, 1,
0.1885431, 0.4915045, 1.493177, 0, 0.4313726, 1, 1,
0.1897174, -0.1508152, 1.232719, 0, 0.4235294, 1, 1,
0.1903225, 0.3055977, 1.260463, 0, 0.4196078, 1, 1,
0.1930884, -1.680826, 3.255607, 0, 0.4117647, 1, 1,
0.1953248, -0.6948033, 2.810273, 0, 0.4078431, 1, 1,
0.1970333, 0.1693919, -0.9638023, 0, 0.4, 1, 1,
0.19827, 0.2864937, -0.9204, 0, 0.3921569, 1, 1,
0.2009017, 1.546097, -1.110725, 0, 0.3882353, 1, 1,
0.2091275, -0.2011555, 0.3168971, 0, 0.3803922, 1, 1,
0.2102256, 0.6321589, -0.5234529, 0, 0.3764706, 1, 1,
0.2135101, -0.5974491, 3.503374, 0, 0.3686275, 1, 1,
0.2184891, 2.181345, -0.1744674, 0, 0.3647059, 1, 1,
0.2185693, -0.2813572, 0.473222, 0, 0.3568628, 1, 1,
0.2219813, -1.219835, 1.520306, 0, 0.3529412, 1, 1,
0.2239479, -1.175782, 4.013314, 0, 0.345098, 1, 1,
0.2255027, -1.769869, 1.226912, 0, 0.3411765, 1, 1,
0.2378167, -0.7847561, 3.738636, 0, 0.3333333, 1, 1,
0.2458054, -0.7775268, 4.510586, 0, 0.3294118, 1, 1,
0.2489278, -0.4520616, 3.263923, 0, 0.3215686, 1, 1,
0.2498884, -1.240396, 2.345129, 0, 0.3176471, 1, 1,
0.254297, -0.5799107, 2.584948, 0, 0.3098039, 1, 1,
0.2547623, -0.407457, 3.873585, 0, 0.3058824, 1, 1,
0.2548203, -0.6442258, 2.337025, 0, 0.2980392, 1, 1,
0.2564578, 0.497723, 0.693336, 0, 0.2901961, 1, 1,
0.2567607, -2.627468, 3.149986, 0, 0.2862745, 1, 1,
0.2583197, 0.3168626, 0.5419888, 0, 0.2784314, 1, 1,
0.2603052, -0.2383604, 1.457761, 0, 0.2745098, 1, 1,
0.2621598, -0.1657394, -0.06263345, 0, 0.2666667, 1, 1,
0.2637708, -1.491642, 3.85265, 0, 0.2627451, 1, 1,
0.2716591, -0.2016561, 2.340929, 0, 0.254902, 1, 1,
0.2763696, 0.3577244, 0.006691985, 0, 0.2509804, 1, 1,
0.2817598, -0.5253359, 2.03603, 0, 0.2431373, 1, 1,
0.285027, -0.2842168, 3.221093, 0, 0.2392157, 1, 1,
0.2859516, 0.8824583, -0.9633495, 0, 0.2313726, 1, 1,
0.2861955, 1.023687, -0.5048077, 0, 0.227451, 1, 1,
0.2939354, 1.876326, -1.020592, 0, 0.2196078, 1, 1,
0.2943345, -0.842884, 0.6409339, 0, 0.2156863, 1, 1,
0.2975304, -2.110941, 3.512962, 0, 0.2078431, 1, 1,
0.2977951, 0.6109446, 1.600119, 0, 0.2039216, 1, 1,
0.3040161, -3.194108, 3.13595, 0, 0.1960784, 1, 1,
0.3057401, -0.5016229, 2.161962, 0, 0.1882353, 1, 1,
0.3164997, 0.785278, -0.5239713, 0, 0.1843137, 1, 1,
0.321668, 0.4715614, -0.6985801, 0, 0.1764706, 1, 1,
0.331077, -0.851629, 1.093848, 0, 0.172549, 1, 1,
0.3371134, 0.08083548, 1.942921, 0, 0.1647059, 1, 1,
0.3403373, 0.04765531, -0.04333795, 0, 0.1607843, 1, 1,
0.3406425, 0.883441, 2.248489, 0, 0.1529412, 1, 1,
0.3412286, 0.3769041, -0.2588976, 0, 0.1490196, 1, 1,
0.3442517, -0.2531593, -0.1394627, 0, 0.1411765, 1, 1,
0.3484586, 0.906834, -0.5734366, 0, 0.1372549, 1, 1,
0.3487548, -0.3365594, 2.11032, 0, 0.1294118, 1, 1,
0.35122, -0.9277943, 3.857239, 0, 0.1254902, 1, 1,
0.3581581, -0.6851098, 2.427704, 0, 0.1176471, 1, 1,
0.3597511, -0.03583274, 1.489189, 0, 0.1137255, 1, 1,
0.3605426, 0.5504911, 0.8081167, 0, 0.1058824, 1, 1,
0.3631981, 0.2975361, 0.2871192, 0, 0.09803922, 1, 1,
0.3633391, -1.358874, 3.585371, 0, 0.09411765, 1, 1,
0.3638008, 0.1909779, 1.692732, 0, 0.08627451, 1, 1,
0.3651802, -0.2277713, 4.453263, 0, 0.08235294, 1, 1,
0.3682832, 0.2487064, -0.3160028, 0, 0.07450981, 1, 1,
0.3692137, -1.173619, 3.22585, 0, 0.07058824, 1, 1,
0.3715499, 0.1494058, 0.3612308, 0, 0.0627451, 1, 1,
0.3733577, 1.799459, 1.243492, 0, 0.05882353, 1, 1,
0.3819735, 1.207843, 1.295112, 0, 0.05098039, 1, 1,
0.3900437, -0.1982584, 2.271112, 0, 0.04705882, 1, 1,
0.3907268, 0.06802595, 0.1879718, 0, 0.03921569, 1, 1,
0.3929034, 0.1692825, 0.08952439, 0, 0.03529412, 1, 1,
0.3943301, -1.01002, 3.711816, 0, 0.02745098, 1, 1,
0.400701, 1.76832, -0.008680844, 0, 0.02352941, 1, 1,
0.4021833, 0.5680807, 1.905877, 0, 0.01568628, 1, 1,
0.4036938, 0.05630222, 0.7658862, 0, 0.01176471, 1, 1,
0.4052156, -2.054617, 1.879912, 0, 0.003921569, 1, 1,
0.4128038, -0.861662, 1.710936, 0.003921569, 0, 1, 1,
0.4150175, -0.08488775, 1.748023, 0.007843138, 0, 1, 1,
0.4151657, -0.5741602, 1.969633, 0.01568628, 0, 1, 1,
0.419855, -0.563184, 2.416538, 0.01960784, 0, 1, 1,
0.4199904, -1.576168, 3.164859, 0.02745098, 0, 1, 1,
0.4211176, 0.2160367, -0.6558209, 0.03137255, 0, 1, 1,
0.4229821, 1.113293, 1.10674, 0.03921569, 0, 1, 1,
0.4297975, -0.6860529, 4.180657, 0.04313726, 0, 1, 1,
0.4302394, 1.466815, 0.0216364, 0.05098039, 0, 1, 1,
0.4330589, -0.1297718, 0.7916365, 0.05490196, 0, 1, 1,
0.4332433, 0.2212389, 1.795119, 0.0627451, 0, 1, 1,
0.4333535, 1.087196, 1.59057, 0.06666667, 0, 1, 1,
0.4423352, 1.485064, 0.1405735, 0.07450981, 0, 1, 1,
0.4448602, 0.9441529, -1.642491, 0.07843138, 0, 1, 1,
0.4466839, -1.204472, 1.408125, 0.08627451, 0, 1, 1,
0.4487871, 0.3123684, -0.3420589, 0.09019608, 0, 1, 1,
0.4489289, 1.705404, 0.6563472, 0.09803922, 0, 1, 1,
0.4616064, 0.3245569, 0.4947425, 0.1058824, 0, 1, 1,
0.4659669, 1.981112, 0.02863668, 0.1098039, 0, 1, 1,
0.4678923, 0.7624508, 1.469889, 0.1176471, 0, 1, 1,
0.4686024, 0.3712777, 0.9046549, 0.1215686, 0, 1, 1,
0.4689263, -1.124678, 1.869882, 0.1294118, 0, 1, 1,
0.4694412, 0.5073776, 3.141778, 0.1333333, 0, 1, 1,
0.470222, -0.7978925, 2.687543, 0.1411765, 0, 1, 1,
0.4712447, -0.6651966, 1.803012, 0.145098, 0, 1, 1,
0.4721554, -0.1900962, 2.276826, 0.1529412, 0, 1, 1,
0.4739941, -0.04980801, 0.4257618, 0.1568628, 0, 1, 1,
0.4796167, 0.516944, 2.275898, 0.1647059, 0, 1, 1,
0.4797396, -0.380351, 1.6729, 0.1686275, 0, 1, 1,
0.4800717, -0.9380921, 0.9998526, 0.1764706, 0, 1, 1,
0.4830672, -0.6960194, 3.39255, 0.1803922, 0, 1, 1,
0.4831246, -0.1394099, 0.703378, 0.1882353, 0, 1, 1,
0.4840571, -0.5491306, 3.234127, 0.1921569, 0, 1, 1,
0.4846197, -0.8096482, 2.554465, 0.2, 0, 1, 1,
0.4847642, 1.745365, -0.4275292, 0.2078431, 0, 1, 1,
0.486855, -1.142359, 3.468049, 0.2117647, 0, 1, 1,
0.4902573, 0.2124799, 1.472941, 0.2196078, 0, 1, 1,
0.4912935, -0.03935136, 1.5962, 0.2235294, 0, 1, 1,
0.4916345, -1.434839, 3.071617, 0.2313726, 0, 1, 1,
0.4920989, -0.3742425, 1.342301, 0.2352941, 0, 1, 1,
0.4968511, -1.363472, 1.63388, 0.2431373, 0, 1, 1,
0.4991549, 0.8895567, -0.6971349, 0.2470588, 0, 1, 1,
0.5020083, 0.4096494, 2.890384, 0.254902, 0, 1, 1,
0.5051377, -0.6792519, 2.864301, 0.2588235, 0, 1, 1,
0.5053895, -0.255967, -0.1221415, 0.2666667, 0, 1, 1,
0.5113223, 0.002654, 1.845717, 0.2705882, 0, 1, 1,
0.5137086, -0.1833173, 3.48955, 0.2784314, 0, 1, 1,
0.5139329, 1.065816, 2.538595, 0.282353, 0, 1, 1,
0.5243294, 0.9264502, 0.9017287, 0.2901961, 0, 1, 1,
0.527877, -1.001687, 1.042664, 0.2941177, 0, 1, 1,
0.5283574, -1.109212, 3.636835, 0.3019608, 0, 1, 1,
0.5285577, -0.9139383, 2.025775, 0.3098039, 0, 1, 1,
0.5287353, -1.974505, 3.724479, 0.3137255, 0, 1, 1,
0.5292919, -0.6000182, 2.525598, 0.3215686, 0, 1, 1,
0.5390878, 1.100646, -0.1202453, 0.3254902, 0, 1, 1,
0.5423261, 0.8495127, 1.151455, 0.3333333, 0, 1, 1,
0.5431577, -1.017439, 3.402021, 0.3372549, 0, 1, 1,
0.5438369, 0.1719924, 3.543319, 0.345098, 0, 1, 1,
0.5632459, 2.145104, -0.2721155, 0.3490196, 0, 1, 1,
0.5791764, -0.7644567, 3.550319, 0.3568628, 0, 1, 1,
0.5808275, -0.2342679, 3.952858, 0.3607843, 0, 1, 1,
0.5838872, -0.6596424, 2.056222, 0.3686275, 0, 1, 1,
0.5908009, 0.3846921, -0.3775113, 0.372549, 0, 1, 1,
0.5962254, -0.6501988, 0.9937506, 0.3803922, 0, 1, 1,
0.5962314, -0.03862475, 2.191952, 0.3843137, 0, 1, 1,
0.5964419, 1.66488, 0.1008764, 0.3921569, 0, 1, 1,
0.5997547, 0.0509908, 1.494983, 0.3960784, 0, 1, 1,
0.6003749, -0.492787, 1.114454, 0.4039216, 0, 1, 1,
0.601176, 0.7241659, -0.01884287, 0.4117647, 0, 1, 1,
0.6032795, 0.8253734, 1.040255, 0.4156863, 0, 1, 1,
0.616013, 0.1369091, 1.863457, 0.4235294, 0, 1, 1,
0.6168181, -0.4540767, 2.263191, 0.427451, 0, 1, 1,
0.6210161, 0.1835361, 3.161533, 0.4352941, 0, 1, 1,
0.6233234, 0.7244949, 0.6289687, 0.4392157, 0, 1, 1,
0.6249511, -1.023475, 1.341516, 0.4470588, 0, 1, 1,
0.6251913, 0.3014642, 1.710919, 0.4509804, 0, 1, 1,
0.6334822, 0.30606, 2.04214, 0.4588235, 0, 1, 1,
0.6335182, 0.4471629, 1.743776, 0.4627451, 0, 1, 1,
0.6336147, 1.837222, -0.6274447, 0.4705882, 0, 1, 1,
0.6355954, -0.7678591, 1.441085, 0.4745098, 0, 1, 1,
0.6391327, 0.1119157, 0.5116331, 0.4823529, 0, 1, 1,
0.6396296, -0.674255, 2.447659, 0.4862745, 0, 1, 1,
0.6462811, -1.457205, 1.001909, 0.4941176, 0, 1, 1,
0.6464099, -0.2160981, 0.5409139, 0.5019608, 0, 1, 1,
0.6475333, -1.205805, 3.620189, 0.5058824, 0, 1, 1,
0.6500195, -0.3670508, 3.209591, 0.5137255, 0, 1, 1,
0.650022, -0.7280034, 4.301964, 0.5176471, 0, 1, 1,
0.6500797, -0.6208267, 1.797762, 0.5254902, 0, 1, 1,
0.6508496, 0.2600577, 0.3520089, 0.5294118, 0, 1, 1,
0.6630203, 1.515394, 0.3196794, 0.5372549, 0, 1, 1,
0.6639673, -0.6073332, 2.00114, 0.5411765, 0, 1, 1,
0.6647785, 0.835128, -0.05584143, 0.5490196, 0, 1, 1,
0.6724972, 0.3966057, 1.149504, 0.5529412, 0, 1, 1,
0.6756881, -1.743842, 2.586718, 0.5607843, 0, 1, 1,
0.6758082, -0.4615988, 2.633354, 0.5647059, 0, 1, 1,
0.6822811, -1.040747, 2.610601, 0.572549, 0, 1, 1,
0.6841976, -0.5634875, -0.06337054, 0.5764706, 0, 1, 1,
0.6870126, 0.919636, -0.2602698, 0.5843138, 0, 1, 1,
0.6948582, -2.032855, 1.608765, 0.5882353, 0, 1, 1,
0.7004902, 0.8114752, -0.3579409, 0.5960785, 0, 1, 1,
0.7049384, 0.00729855, 3.001084, 0.6039216, 0, 1, 1,
0.7166826, 1.842584, 0.007776363, 0.6078432, 0, 1, 1,
0.7174181, -1.166446, 2.786086, 0.6156863, 0, 1, 1,
0.7213397, -0.7418808, 2.236604, 0.6196079, 0, 1, 1,
0.7227984, 0.9041377, 1.352223, 0.627451, 0, 1, 1,
0.7229934, 0.4173793, 0.5015633, 0.6313726, 0, 1, 1,
0.7248536, 0.7559032, 3.408098, 0.6392157, 0, 1, 1,
0.7264909, -0.3374169, 3.15645, 0.6431373, 0, 1, 1,
0.7314572, 1.385815, -0.607571, 0.6509804, 0, 1, 1,
0.7322284, -1.225854, 1.674708, 0.654902, 0, 1, 1,
0.7356918, -0.2111616, 1.378808, 0.6627451, 0, 1, 1,
0.7366732, 0.3258183, 0.8315676, 0.6666667, 0, 1, 1,
0.7402632, -0.6992167, 3.460731, 0.6745098, 0, 1, 1,
0.7467518, -1.050593, 3.841288, 0.6784314, 0, 1, 1,
0.7468303, -2.042507, 4.191764, 0.6862745, 0, 1, 1,
0.748326, 2.24331, 1.545606, 0.6901961, 0, 1, 1,
0.7514946, -1.428973, 3.855771, 0.6980392, 0, 1, 1,
0.7544188, 0.477758, 0.4830599, 0.7058824, 0, 1, 1,
0.7621431, -0.07869806, 1.762554, 0.7098039, 0, 1, 1,
0.7637182, 0.6751243, 1.524569, 0.7176471, 0, 1, 1,
0.7650618, 1.046519, -0.873867, 0.7215686, 0, 1, 1,
0.7680716, -0.7783077, 2.741804, 0.7294118, 0, 1, 1,
0.7703262, -0.1777501, 2.228721, 0.7333333, 0, 1, 1,
0.7709965, -0.8192782, 1.523073, 0.7411765, 0, 1, 1,
0.7745054, 1.576931, 0.4095777, 0.7450981, 0, 1, 1,
0.776691, -0.1482525, 2.592061, 0.7529412, 0, 1, 1,
0.7792709, 0.3374803, 0.1313115, 0.7568628, 0, 1, 1,
0.7794955, 0.468011, 1.759241, 0.7647059, 0, 1, 1,
0.7864195, -1.462538, 2.633226, 0.7686275, 0, 1, 1,
0.7869835, 2.354104, -0.1125787, 0.7764706, 0, 1, 1,
0.7967165, 0.0429748, 2.010849, 0.7803922, 0, 1, 1,
0.7983925, -0.294135, 3.204842, 0.7882353, 0, 1, 1,
0.8087184, 0.974674, 2.091792, 0.7921569, 0, 1, 1,
0.8101673, 0.52495, 0.896422, 0.8, 0, 1, 1,
0.8146707, 1.080151, -0.919108, 0.8078431, 0, 1, 1,
0.8172532, -1.109588, 1.043618, 0.8117647, 0, 1, 1,
0.8218345, 0.3114816, 1.371992, 0.8196079, 0, 1, 1,
0.8291992, -0.2794577, 2.879364, 0.8235294, 0, 1, 1,
0.829686, -0.7521198, 2.951413, 0.8313726, 0, 1, 1,
0.8309231, 0.123452, 1.74752, 0.8352941, 0, 1, 1,
0.8340167, -0.7039178, 3.104561, 0.8431373, 0, 1, 1,
0.8358674, 0.230756, 3.326953, 0.8470588, 0, 1, 1,
0.837873, -1.192689, 0.9176275, 0.854902, 0, 1, 1,
0.8409588, -0.203431, 2.437498, 0.8588235, 0, 1, 1,
0.843125, -1.20149, 1.483641, 0.8666667, 0, 1, 1,
0.8440957, 0.4681301, 2.70392, 0.8705882, 0, 1, 1,
0.8454367, -0.433404, 1.825956, 0.8784314, 0, 1, 1,
0.846602, -0.163108, 0.8869404, 0.8823529, 0, 1, 1,
0.8470714, 0.1079565, 2.44017, 0.8901961, 0, 1, 1,
0.8484155, -1.028954, 1.55904, 0.8941177, 0, 1, 1,
0.8504092, 2.193683, 1.158358, 0.9019608, 0, 1, 1,
0.8561168, -1.247273, 2.845382, 0.9098039, 0, 1, 1,
0.8584816, -0.09050807, 2.170254, 0.9137255, 0, 1, 1,
0.8702613, -0.1920596, 0.2061367, 0.9215686, 0, 1, 1,
0.8715217, -0.5956138, 2.076627, 0.9254902, 0, 1, 1,
0.8731435, 0.1993265, 1.691963, 0.9333333, 0, 1, 1,
0.8862748, -1.394797, 0.4778477, 0.9372549, 0, 1, 1,
0.8872152, 1.405751, 1.705759, 0.945098, 0, 1, 1,
0.8879786, 0.728309, 0.05677894, 0.9490196, 0, 1, 1,
0.8949876, 0.2109486, 1.883972, 0.9568627, 0, 1, 1,
0.901846, 0.3268121, 1.34497, 0.9607843, 0, 1, 1,
0.9047107, 2.110865, 0.9018537, 0.9686275, 0, 1, 1,
0.9054189, -1.387914, 2.378753, 0.972549, 0, 1, 1,
0.9064696, -0.1609945, 2.213059, 0.9803922, 0, 1, 1,
0.9142599, 0.1182571, 4.117186, 0.9843137, 0, 1, 1,
0.9184802, 1.183936, 1.736952, 0.9921569, 0, 1, 1,
0.9222374, 0.2749811, 0.6822819, 0.9960784, 0, 1, 1,
0.9252579, -0.8352693, 2.812518, 1, 0, 0.9960784, 1,
0.9328017, -0.4194529, 1.989655, 1, 0, 0.9882353, 1,
0.933058, 0.9900576, 2.113627, 1, 0, 0.9843137, 1,
0.941346, -0.6009515, 1.565955, 1, 0, 0.9764706, 1,
0.9457425, -0.759467, 1.968829, 1, 0, 0.972549, 1,
0.9491237, -0.2550401, 3.692548, 1, 0, 0.9647059, 1,
0.949306, 0.5614237, 1.132693, 1, 0, 0.9607843, 1,
0.95363, 0.7386425, 0.7863504, 1, 0, 0.9529412, 1,
0.9548389, -2.415322, 3.239283, 1, 0, 0.9490196, 1,
0.9552636, 0.2717285, 2.899078, 1, 0, 0.9411765, 1,
0.955928, -0.7457992, 3.199482, 1, 0, 0.9372549, 1,
0.9602457, 0.2692411, 0.1915525, 1, 0, 0.9294118, 1,
0.9627948, 0.7883341, 1.17956, 1, 0, 0.9254902, 1,
0.9632112, -2.408982, 2.930918, 1, 0, 0.9176471, 1,
0.9684687, 0.657487, 2.543262, 1, 0, 0.9137255, 1,
0.9750899, 1.117598, 0.7570888, 1, 0, 0.9058824, 1,
0.9790896, 0.5758687, 0.2804195, 1, 0, 0.9019608, 1,
0.9880648, 0.6162359, 0.251835, 1, 0, 0.8941177, 1,
0.9907229, 0.920697, 1.003025, 1, 0, 0.8862745, 1,
0.9947477, -0.7690759, 0.142998, 1, 0, 0.8823529, 1,
0.9974664, 2.265409, 0.8199669, 1, 0, 0.8745098, 1,
1.000629, 0.4596402, 2.101569, 1, 0, 0.8705882, 1,
1.011756, -1.526527, 2.494761, 1, 0, 0.8627451, 1,
1.012774, -0.5714782, 2.080521, 1, 0, 0.8588235, 1,
1.013405, -0.2902778, 0.9446787, 1, 0, 0.8509804, 1,
1.021614, 0.2205832, 2.145116, 1, 0, 0.8470588, 1,
1.02544, 0.3427518, 1.741777, 1, 0, 0.8392157, 1,
1.029557, 1.146035, 2.393301, 1, 0, 0.8352941, 1,
1.036954, 0.3864885, -0.2837455, 1, 0, 0.827451, 1,
1.046294, 0.3478266, 1.384487, 1, 0, 0.8235294, 1,
1.047387, -1.171645, 1.898206, 1, 0, 0.8156863, 1,
1.057372, -0.8597876, 2.467045, 1, 0, 0.8117647, 1,
1.057886, 0.7403688, 0.4233508, 1, 0, 0.8039216, 1,
1.060161, -1.321949, 2.125037, 1, 0, 0.7960784, 1,
1.068653, -0.7312236, 2.934137, 1, 0, 0.7921569, 1,
1.08015, -0.5194614, 0.3887077, 1, 0, 0.7843137, 1,
1.083114, 0.4940825, 1.40649, 1, 0, 0.7803922, 1,
1.085323, -0.1830858, 1.177723, 1, 0, 0.772549, 1,
1.086708, 2.113507, -1.343806, 1, 0, 0.7686275, 1,
1.089342, -1.184603, 1.507811, 1, 0, 0.7607843, 1,
1.096716, -1.238399, 2.705242, 1, 0, 0.7568628, 1,
1.101, 0.3174382, 1.978266, 1, 0, 0.7490196, 1,
1.10684, 0.03912873, 3.006752, 1, 0, 0.7450981, 1,
1.110104, -0.9616458, 2.194511, 1, 0, 0.7372549, 1,
1.118078, -0.3828982, 0.933565, 1, 0, 0.7333333, 1,
1.118097, -0.4133352, 1.44827, 1, 0, 0.7254902, 1,
1.129237, -0.3372034, 2.268154, 1, 0, 0.7215686, 1,
1.131867, -0.6114213, 0.6387637, 1, 0, 0.7137255, 1,
1.132084, 0.8280839, 0.8999937, 1, 0, 0.7098039, 1,
1.135283, 0.1045359, 1.244268, 1, 0, 0.7019608, 1,
1.139822, 0.5709153, -1.608842, 1, 0, 0.6941177, 1,
1.142353, 1.312693, 1.068473, 1, 0, 0.6901961, 1,
1.143461, 0.6678419, 0.6134578, 1, 0, 0.682353, 1,
1.146471, 0.6369466, 1.15171, 1, 0, 0.6784314, 1,
1.149836, 0.05300694, 3.244728, 1, 0, 0.6705883, 1,
1.150547, -1.117144, 4.094184, 1, 0, 0.6666667, 1,
1.151476, -0.7001863, 0.9470553, 1, 0, 0.6588235, 1,
1.161729, -1.492199, 2.550973, 1, 0, 0.654902, 1,
1.163427, -0.2166493, 1.130797, 1, 0, 0.6470588, 1,
1.16398, -0.09905439, 1.700429, 1, 0, 0.6431373, 1,
1.1803, 0.1510895, 0.8293126, 1, 0, 0.6352941, 1,
1.180779, -1.51376, 2.138818, 1, 0, 0.6313726, 1,
1.182894, -0.6283237, 1.022824, 1, 0, 0.6235294, 1,
1.20168, -0.7354534, 1.650056, 1, 0, 0.6196079, 1,
1.205088, 0.1679795, 0.1663655, 1, 0, 0.6117647, 1,
1.216774, 0.4088845, 1.0592, 1, 0, 0.6078432, 1,
1.222565, -0.9164499, 1.093895, 1, 0, 0.6, 1,
1.226045, -0.2947014, 2.503723, 1, 0, 0.5921569, 1,
1.234352, -0.2437773, 1.048539, 1, 0, 0.5882353, 1,
1.245604, 0.6618341, 3.008689, 1, 0, 0.5803922, 1,
1.246027, 0.726916, 1.654942, 1, 0, 0.5764706, 1,
1.252549, -0.6819005, 1.959672, 1, 0, 0.5686275, 1,
1.254639, 1.600938, 0.06331331, 1, 0, 0.5647059, 1,
1.274991, 1.391413, 1.549729, 1, 0, 0.5568628, 1,
1.277228, 1.137738, 1.692033, 1, 0, 0.5529412, 1,
1.277902, -0.2542946, 1.071962, 1, 0, 0.5450981, 1,
1.280643, -0.1483922, 2.137523, 1, 0, 0.5411765, 1,
1.290098, -0.3143395, 3.907081, 1, 0, 0.5333334, 1,
1.290291, -0.3103838, 1.004533, 1, 0, 0.5294118, 1,
1.294395, 1.028678, 0.2861201, 1, 0, 0.5215687, 1,
1.305631, -0.1384586, 3.022802, 1, 0, 0.5176471, 1,
1.308413, -0.2036061, 1.230575, 1, 0, 0.509804, 1,
1.313274, -0.4217021, 0.9230462, 1, 0, 0.5058824, 1,
1.33174, -0.09172837, 2.728201, 1, 0, 0.4980392, 1,
1.333585, -0.5096706, 3.500674, 1, 0, 0.4901961, 1,
1.334399, 0.2655387, 1.861529, 1, 0, 0.4862745, 1,
1.337367, -0.3035328, 0.6422241, 1, 0, 0.4784314, 1,
1.33781, 0.4263878, 2.643521, 1, 0, 0.4745098, 1,
1.353648, 2.249806, 1.083011, 1, 0, 0.4666667, 1,
1.357705, -1.561065, 3.727139, 1, 0, 0.4627451, 1,
1.357851, 0.510188, 1.770919, 1, 0, 0.454902, 1,
1.368794, -1.681573, 2.750472, 1, 0, 0.4509804, 1,
1.371924, 0.3391035, 1.877602, 1, 0, 0.4431373, 1,
1.371995, 0.1887883, 0.02501225, 1, 0, 0.4392157, 1,
1.375308, -0.2823857, 2.401457, 1, 0, 0.4313726, 1,
1.376121, -0.8912897, 0.6979635, 1, 0, 0.427451, 1,
1.382585, 1.214443, 1.919959, 1, 0, 0.4196078, 1,
1.383077, 0.5584498, -0.530696, 1, 0, 0.4156863, 1,
1.387858, -0.263644, 1.834717, 1, 0, 0.4078431, 1,
1.389504, -0.2162945, 1.764366, 1, 0, 0.4039216, 1,
1.426774, 0.3636499, 2.729774, 1, 0, 0.3960784, 1,
1.431995, 1.118926, 2.015919, 1, 0, 0.3882353, 1,
1.432535, -0.5379007, 1.08159, 1, 0, 0.3843137, 1,
1.434568, 1.828129, 0.9544205, 1, 0, 0.3764706, 1,
1.437886, 0.01172849, 3.758713, 1, 0, 0.372549, 1,
1.439019, 0.01646462, 2.094908, 1, 0, 0.3647059, 1,
1.453251, 1.429252, 1.603515, 1, 0, 0.3607843, 1,
1.469889, 1.074674, 0.2527163, 1, 0, 0.3529412, 1,
1.476251, -0.9353505, 3.160405, 1, 0, 0.3490196, 1,
1.484102, 0.9016337, 1.723676, 1, 0, 0.3411765, 1,
1.511897, -0.6266386, 2.990165, 1, 0, 0.3372549, 1,
1.521388, -0.6618854, 1.066317, 1, 0, 0.3294118, 1,
1.529857, 0.453686, 0.6067995, 1, 0, 0.3254902, 1,
1.537326, -1.656699, 1.732538, 1, 0, 0.3176471, 1,
1.541356, -0.4707606, 1.25414, 1, 0, 0.3137255, 1,
1.555444, 1.136356, 1.391058, 1, 0, 0.3058824, 1,
1.568594, -0.4710447, 1.420289, 1, 0, 0.2980392, 1,
1.585037, 1.637859, -0.0309309, 1, 0, 0.2941177, 1,
1.587522, 0.2792409, 0.9834433, 1, 0, 0.2862745, 1,
1.60044, -1.850145, 1.875875, 1, 0, 0.282353, 1,
1.632807, -0.7815391, 1.84886, 1, 0, 0.2745098, 1,
1.644736, 1.728327, 0.1851785, 1, 0, 0.2705882, 1,
1.645141, 1.061938, 0.5486811, 1, 0, 0.2627451, 1,
1.656829, 0.829671, 0.4468757, 1, 0, 0.2588235, 1,
1.66138, -1.435754, 1.693206, 1, 0, 0.2509804, 1,
1.662239, -0.6736212, 0.5971887, 1, 0, 0.2470588, 1,
1.663888, 0.4459019, 1.602423, 1, 0, 0.2392157, 1,
1.702413, -1.190042, 1.278102, 1, 0, 0.2352941, 1,
1.721246, -1.253829, 2.55439, 1, 0, 0.227451, 1,
1.721379, -0.3332997, 2.04369, 1, 0, 0.2235294, 1,
1.723371, -0.9050192, 1.050078, 1, 0, 0.2156863, 1,
1.775938, 0.3591723, 3.033791, 1, 0, 0.2117647, 1,
1.793227, -1.073564, 2.014041, 1, 0, 0.2039216, 1,
1.815604, 0.4760002, 0.7588624, 1, 0, 0.1960784, 1,
1.822905, -0.04288889, 1.262269, 1, 0, 0.1921569, 1,
1.82924, 2.171946, 2.429021, 1, 0, 0.1843137, 1,
1.843252, -0.1086993, 1.433776, 1, 0, 0.1803922, 1,
1.845912, -0.5197846, 0.766721, 1, 0, 0.172549, 1,
1.876035, 0.868547, 0.5001289, 1, 0, 0.1686275, 1,
1.884661, 0.361923, 0.9896405, 1, 0, 0.1607843, 1,
1.888461, 0.1250029, 2.118173, 1, 0, 0.1568628, 1,
1.907742, -3.44776, 4.35389, 1, 0, 0.1490196, 1,
1.914087, 2.561142, 0.2036341, 1, 0, 0.145098, 1,
1.919418, 0.3519286, 1.087546, 1, 0, 0.1372549, 1,
1.944051, -1.648306, 0.9844486, 1, 0, 0.1333333, 1,
2.062645, 0.6443847, 1.084195, 1, 0, 0.1254902, 1,
2.063549, -1.0882, 2.614371, 1, 0, 0.1215686, 1,
2.071391, 0.1714276, 0.568915, 1, 0, 0.1137255, 1,
2.085321, -2.151622, 2.612284, 1, 0, 0.1098039, 1,
2.089914, -0.1059998, 0.6383262, 1, 0, 0.1019608, 1,
2.105152, 1.266214, 0.3610212, 1, 0, 0.09411765, 1,
2.175498, 1.027888, 1.039303, 1, 0, 0.09019608, 1,
2.21529, -1.449388, 0.4415835, 1, 0, 0.08235294, 1,
2.223415, -0.7850086, 1.301616, 1, 0, 0.07843138, 1,
2.226197, -0.001660868, 1.640172, 1, 0, 0.07058824, 1,
2.295404, 0.387919, 2.428681, 1, 0, 0.06666667, 1,
2.305963, 0.2660897, 3.162751, 1, 0, 0.05882353, 1,
2.340397, 1.191321, 0.7156215, 1, 0, 0.05490196, 1,
2.47509, 2.097224, 1.982218, 1, 0, 0.04705882, 1,
2.565233, -0.6346731, 2.607223, 1, 0, 0.04313726, 1,
2.600548, -0.4313941, 2.209529, 1, 0, 0.03529412, 1,
2.799498, -1.188411, 1.997778, 1, 0, 0.03137255, 1,
2.810208, -0.1300651, 2.401479, 1, 0, 0.02352941, 1,
3.054081, -0.1857505, 1.18774, 1, 0, 0.01960784, 1,
3.067398, -0.08875074, 0.588537, 1, 0, 0.01176471, 1,
3.33032, 1.016331, 0.8493771, 1, 0, 0.007843138, 1
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
0.05087638, -4.558349, -6.74611, 0, -0.5, 0.5, 0.5,
0.05087638, -4.558349, -6.74611, 1, -0.5, 0.5, 0.5,
0.05087638, -4.558349, -6.74611, 1, 1.5, 0.5, 0.5,
0.05087638, -4.558349, -6.74611, 0, 1.5, 0.5, 0.5
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
-4.340299, -0.1716841, -6.74611, 0, -0.5, 0.5, 0.5,
-4.340299, -0.1716841, -6.74611, 1, -0.5, 0.5, 0.5,
-4.340299, -0.1716841, -6.74611, 1, 1.5, 0.5, 0.5,
-4.340299, -0.1716841, -6.74611, 0, 1.5, 0.5, 0.5
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
-4.340299, -4.558349, 0.1100106, 0, -0.5, 0.5, 0.5,
-4.340299, -4.558349, 0.1100106, 1, -0.5, 0.5, 0.5,
-4.340299, -4.558349, 0.1100106, 1, 1.5, 0.5, 0.5,
-4.340299, -4.558349, 0.1100106, 0, 1.5, 0.5, 0.5
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
-3, -3.546042, -5.163929,
3, -3.546042, -5.163929,
-3, -3.546042, -5.163929,
-3, -3.71476, -5.427626,
-2, -3.546042, -5.163929,
-2, -3.71476, -5.427626,
-1, -3.546042, -5.163929,
-1, -3.71476, -5.427626,
0, -3.546042, -5.163929,
0, -3.71476, -5.427626,
1, -3.546042, -5.163929,
1, -3.71476, -5.427626,
2, -3.546042, -5.163929,
2, -3.71476, -5.427626,
3, -3.546042, -5.163929,
3, -3.71476, -5.427626
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
-3, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
-3, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
-3, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
-3, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
-2, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
-2, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
-2, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
-2, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
-1, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
-1, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
-1, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
-1, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
0, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
0, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
0, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
0, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
1, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
1, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
1, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
1, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
2, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
2, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
2, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
2, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5,
3, -4.052196, -5.955019, 0, -0.5, 0.5, 0.5,
3, -4.052196, -5.955019, 1, -0.5, 0.5, 0.5,
3, -4.052196, -5.955019, 1, 1.5, 0.5, 0.5,
3, -4.052196, -5.955019, 0, 1.5, 0.5, 0.5
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
-3.326951, -3, -5.163929,
-3.326951, 3, -5.163929,
-3.326951, -3, -5.163929,
-3.495842, -3, -5.427626,
-3.326951, -2, -5.163929,
-3.495842, -2, -5.427626,
-3.326951, -1, -5.163929,
-3.495842, -1, -5.427626,
-3.326951, 0, -5.163929,
-3.495842, 0, -5.427626,
-3.326951, 1, -5.163929,
-3.495842, 1, -5.427626,
-3.326951, 2, -5.163929,
-3.495842, 2, -5.427626,
-3.326951, 3, -5.163929,
-3.495842, 3, -5.427626
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
-3.833625, -3, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, -3, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, -3, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, -3, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, -2, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, -2, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, -2, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, -2, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, -1, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, -1, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, -1, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, -1, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, 0, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, 0, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, 0, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, 0, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, 1, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, 1, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, 1, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, 1, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, 2, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, 2, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, 2, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, 2, -5.955019, 0, 1.5, 0.5, 0.5,
-3.833625, 3, -5.955019, 0, -0.5, 0.5, 0.5,
-3.833625, 3, -5.955019, 1, -0.5, 0.5, 0.5,
-3.833625, 3, -5.955019, 1, 1.5, 0.5, 0.5,
-3.833625, 3, -5.955019, 0, 1.5, 0.5, 0.5
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
-3.326951, -3.546042, -4,
-3.326951, -3.546042, 4,
-3.326951, -3.546042, -4,
-3.495842, -3.71476, -4,
-3.326951, -3.546042, -2,
-3.495842, -3.71476, -2,
-3.326951, -3.546042, 0,
-3.495842, -3.71476, 0,
-3.326951, -3.546042, 2,
-3.495842, -3.71476, 2,
-3.326951, -3.546042, 4,
-3.495842, -3.71476, 4
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
-3.833625, -4.052196, -4, 0, -0.5, 0.5, 0.5,
-3.833625, -4.052196, -4, 1, -0.5, 0.5, 0.5,
-3.833625, -4.052196, -4, 1, 1.5, 0.5, 0.5,
-3.833625, -4.052196, -4, 0, 1.5, 0.5, 0.5,
-3.833625, -4.052196, -2, 0, -0.5, 0.5, 0.5,
-3.833625, -4.052196, -2, 1, -0.5, 0.5, 0.5,
-3.833625, -4.052196, -2, 1, 1.5, 0.5, 0.5,
-3.833625, -4.052196, -2, 0, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 0, 0, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 0, 1, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 0, 1, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 0, 0, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 2, 0, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 2, 1, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 2, 1, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 2, 0, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 4, 0, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 4, 1, -0.5, 0.5, 0.5,
-3.833625, -4.052196, 4, 1, 1.5, 0.5, 0.5,
-3.833625, -4.052196, 4, 0, 1.5, 0.5, 0.5
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
-3.326951, -3.546042, -5.163929,
-3.326951, 3.202674, -5.163929,
-3.326951, -3.546042, 5.38395,
-3.326951, 3.202674, 5.38395,
-3.326951, -3.546042, -5.163929,
-3.326951, -3.546042, 5.38395,
-3.326951, 3.202674, -5.163929,
-3.326951, 3.202674, 5.38395,
-3.326951, -3.546042, -5.163929,
3.428704, -3.546042, -5.163929,
-3.326951, -3.546042, 5.38395,
3.428704, -3.546042, 5.38395,
-3.326951, 3.202674, -5.163929,
3.428704, 3.202674, -5.163929,
-3.326951, 3.202674, 5.38395,
3.428704, 3.202674, 5.38395,
3.428704, -3.546042, -5.163929,
3.428704, 3.202674, -5.163929,
3.428704, -3.546042, 5.38395,
3.428704, 3.202674, 5.38395,
3.428704, -3.546042, -5.163929,
3.428704, -3.546042, 5.38395,
3.428704, 3.202674, -5.163929,
3.428704, 3.202674, 5.38395
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
var radius = 7.597584;
var distance = 33.80251;
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
mvMatrix.translate( -0.05087638, 0.1716841, -0.1100106 );
mvMatrix.scale( 1.215968, 1.217218, 0.7787971 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80251);
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
Chlorophacinone<-read.table("Chlorophacinone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorophacinone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorophacinone' not found
```

```r
y<-Chlorophacinone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorophacinone' not found
```

```r
z<-Chlorophacinone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorophacinone' not found
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
-3.228567, 2.198306, 0.1453008, 0, 0, 1, 1, 1,
-3.197484, -0.8302345, -1.815471, 1, 0, 0, 1, 1,
-2.984877, -1.455838, -1.239864, 1, 0, 0, 1, 1,
-2.832129, 1.276247, -1.415941, 1, 0, 0, 1, 1,
-2.610919, -0.5533327, -3.047644, 1, 0, 0, 1, 1,
-2.465416, -0.8825067, -1.063305, 1, 0, 0, 1, 1,
-2.449674, 0.01134038, -2.071918, 0, 0, 0, 1, 1,
-2.41765, -0.613933, -1.581869, 0, 0, 0, 1, 1,
-2.344319, 1.425463, -0.5896927, 0, 0, 0, 1, 1,
-2.29496, -0.5681266, -1.034226, 0, 0, 0, 1, 1,
-2.08924, 1.535518, -2.663391, 0, 0, 0, 1, 1,
-2.073709, 2.283693, -0.1503327, 0, 0, 0, 1, 1,
-2.073524, 1.309099, -1.23561, 0, 0, 0, 1, 1,
-2.067449, 0.620963, -0.7995688, 1, 1, 1, 1, 1,
-2.065194, -0.2095477, -1.094762, 1, 1, 1, 1, 1,
-2.046989, 0.4096936, -1.280413, 1, 1, 1, 1, 1,
-2.034166, -0.3833598, -2.475146, 1, 1, 1, 1, 1,
-2.008329, -0.1466639, -0.8640572, 1, 1, 1, 1, 1,
-2.004967, 1.084534, 0.3574718, 1, 1, 1, 1, 1,
-1.982901, -0.7868482, -1.902105, 1, 1, 1, 1, 1,
-1.964982, -0.5664562, -0.9690986, 1, 1, 1, 1, 1,
-1.945941, -0.08954225, -3.016144, 1, 1, 1, 1, 1,
-1.943028, -0.7986496, -2.872844, 1, 1, 1, 1, 1,
-1.906095, -0.243248, -1.226863, 1, 1, 1, 1, 1,
-1.889576, -0.5499219, -2.270794, 1, 1, 1, 1, 1,
-1.848323, -1.240298, -1.782766, 1, 1, 1, 1, 1,
-1.840525, 0.881162, -1.665331, 1, 1, 1, 1, 1,
-1.81971, 0.05643839, -2.465645, 1, 1, 1, 1, 1,
-1.818005, -0.7749524, -1.393032, 0, 0, 1, 1, 1,
-1.811283, -0.6890361, -2.241841, 1, 0, 0, 1, 1,
-1.794283, 0.7204891, -0.1811008, 1, 0, 0, 1, 1,
-1.786086, 0.7003125, -1.310564, 1, 0, 0, 1, 1,
-1.748518, -0.01289936, -0.2616606, 1, 0, 0, 1, 1,
-1.746532, 0.004030297, -2.297552, 1, 0, 0, 1, 1,
-1.744915, -0.3941006, -1.769652, 0, 0, 0, 1, 1,
-1.73935, 0.2575485, -1.961412, 0, 0, 0, 1, 1,
-1.723287, -2.002696, -2.090638, 0, 0, 0, 1, 1,
-1.722193, 1.297263, -1.325309, 0, 0, 0, 1, 1,
-1.699102, 1.347328, 0.2548304, 0, 0, 0, 1, 1,
-1.69423, 0.5091084, -0.9345817, 0, 0, 0, 1, 1,
-1.679618, -1.572334, -2.802833, 0, 0, 0, 1, 1,
-1.663689, 0.5275386, -0.8679734, 1, 1, 1, 1, 1,
-1.662764, -0.3059777, -1.111582, 1, 1, 1, 1, 1,
-1.662361, -0.9533815, -1.86549, 1, 1, 1, 1, 1,
-1.660725, 0.1210042, -0.7079719, 1, 1, 1, 1, 1,
-1.658449, -1.260155, -3.293399, 1, 1, 1, 1, 1,
-1.64259, 0.6690183, -2.19278, 1, 1, 1, 1, 1,
-1.637744, 1.53795, -0.4530899, 1, 1, 1, 1, 1,
-1.617787, -0.210136, -1.785836, 1, 1, 1, 1, 1,
-1.615835, 2.153932, -0.4883213, 1, 1, 1, 1, 1,
-1.608052, 0.8880893, 0.762431, 1, 1, 1, 1, 1,
-1.607683, -0.09466792, -1.925554, 1, 1, 1, 1, 1,
-1.607024, 1.460696, -0.7599949, 1, 1, 1, 1, 1,
-1.58583, -0.6969794, -3.20056, 1, 1, 1, 1, 1,
-1.572877, -1.76155, -3.104155, 1, 1, 1, 1, 1,
-1.57086, -0.06290575, -1.224571, 1, 1, 1, 1, 1,
-1.570183, -0.1765593, -0.2502224, 0, 0, 1, 1, 1,
-1.566987, 1.1773, -0.9280531, 1, 0, 0, 1, 1,
-1.564843, 1.120415, -1.539583, 1, 0, 0, 1, 1,
-1.561167, 0.9738687, -1.461109, 1, 0, 0, 1, 1,
-1.533431, 0.2261418, -2.404852, 1, 0, 0, 1, 1,
-1.52962, -1.049778, -2.217623, 1, 0, 0, 1, 1,
-1.5212, -1.224763, -2.021433, 0, 0, 0, 1, 1,
-1.514846, -1.108377, -1.560418, 0, 0, 0, 1, 1,
-1.513258, 0.1893381, -0.7552727, 0, 0, 0, 1, 1,
-1.510285, 0.04749667, -1.308909, 0, 0, 0, 1, 1,
-1.502832, -0.09498066, -1.728348, 0, 0, 0, 1, 1,
-1.48704, 1.650755, -0.0458759, 0, 0, 0, 1, 1,
-1.485177, 1.195792, -0.6903745, 0, 0, 0, 1, 1,
-1.484278, -0.8273692, -0.9905131, 1, 1, 1, 1, 1,
-1.466572, 0.1569364, -1.321286, 1, 1, 1, 1, 1,
-1.451603, -0.4495445, -0.3583204, 1, 1, 1, 1, 1,
-1.430937, 0.09118821, -2.818775, 1, 1, 1, 1, 1,
-1.412132, 0.4433016, -1.283431, 1, 1, 1, 1, 1,
-1.409342, 0.977011, 0.7878235, 1, 1, 1, 1, 1,
-1.408554, 1.227313, -0.1845049, 1, 1, 1, 1, 1,
-1.404697, 1.455865, 0.2220071, 1, 1, 1, 1, 1,
-1.399963, 1.46302, -1.201548, 1, 1, 1, 1, 1,
-1.395457, -0.6976441, -3.021286, 1, 1, 1, 1, 1,
-1.375528, -0.4662393, -1.151357, 1, 1, 1, 1, 1,
-1.369829, 0.378597, 2.056934, 1, 1, 1, 1, 1,
-1.362599, 0.5526302, -2.037215, 1, 1, 1, 1, 1,
-1.357709, 1.506695, -0.4222303, 1, 1, 1, 1, 1,
-1.331817, 1.831825, -0.7814455, 1, 1, 1, 1, 1,
-1.330304, 0.7880403, -0.6169873, 0, 0, 1, 1, 1,
-1.327661, -0.1806229, -0.7339975, 1, 0, 0, 1, 1,
-1.321197, -0.5191165, -1.493487, 1, 0, 0, 1, 1,
-1.307792, -0.3361696, -2.468719, 1, 0, 0, 1, 1,
-1.305341, 0.5192969, 0.1181112, 1, 0, 0, 1, 1,
-1.30344, -0.1629261, -1.501138, 1, 0, 0, 1, 1,
-1.297825, 0.5462913, 0.4032755, 0, 0, 0, 1, 1,
-1.293564, -1.152958, -3.014329, 0, 0, 0, 1, 1,
-1.28683, 0.8069072, -0.9280238, 0, 0, 0, 1, 1,
-1.285295, 1.865812, -1.225971, 0, 0, 0, 1, 1,
-1.270269, 1.112867, 0.5473808, 0, 0, 0, 1, 1,
-1.259201, -1.050464, -2.471612, 0, 0, 0, 1, 1,
-1.258893, 0.476355, -2.715821, 0, 0, 0, 1, 1,
-1.256139, -1.266815, -2.981029, 1, 1, 1, 1, 1,
-1.216277, -2.282192, -2.910586, 1, 1, 1, 1, 1,
-1.213006, 1.746908, -0.8261039, 1, 1, 1, 1, 1,
-1.212924, 0.9725868, -0.1874281, 1, 1, 1, 1, 1,
-1.207177, 0.2377231, -1.493703, 1, 1, 1, 1, 1,
-1.199136, 0.2063001, -1.704326, 1, 1, 1, 1, 1,
-1.194712, -0.03139097, -1.726634, 1, 1, 1, 1, 1,
-1.19425, 0.9398986, -0.04712579, 1, 1, 1, 1, 1,
-1.188822, 2.061893, -1.914949, 1, 1, 1, 1, 1,
-1.188725, 2.373909, -1.259265, 1, 1, 1, 1, 1,
-1.187871, 0.1262098, -2.353472, 1, 1, 1, 1, 1,
-1.187195, 1.051678, 0.4976907, 1, 1, 1, 1, 1,
-1.186149, 0.7290656, 1.275157, 1, 1, 1, 1, 1,
-1.180019, 0.8266777, -1.731344, 1, 1, 1, 1, 1,
-1.172127, 1.920488, -0.3121209, 1, 1, 1, 1, 1,
-1.172099, -1.012106, -2.068373, 0, 0, 1, 1, 1,
-1.169637, -0.5301128, -1.697093, 1, 0, 0, 1, 1,
-1.165335, -1.609149, -3.750064, 1, 0, 0, 1, 1,
-1.163853, -1.756853, -2.291465, 1, 0, 0, 1, 1,
-1.159266, -1.678334, -1.366781, 1, 0, 0, 1, 1,
-1.158557, 1.241418, -1.790428, 1, 0, 0, 1, 1,
-1.142027, 0.7381169, 0.2031653, 0, 0, 0, 1, 1,
-1.136058, -1.640671, -3.07637, 0, 0, 0, 1, 1,
-1.134538, 0.6327953, -3.617499, 0, 0, 0, 1, 1,
-1.126737, 0.1029727, -1.035962, 0, 0, 0, 1, 1,
-1.116952, 0.3124533, 1.955631, 0, 0, 0, 1, 1,
-1.114359, 0.5182374, -2.5076, 0, 0, 0, 1, 1,
-1.108558, 0.7538897, 0.940945, 0, 0, 0, 1, 1,
-1.10504, -1.326701, -2.286781, 1, 1, 1, 1, 1,
-1.104559, 0.7641895, -2.127066, 1, 1, 1, 1, 1,
-1.102821, -0.7782262, -2.542451, 1, 1, 1, 1, 1,
-1.098313, -0.538785, -3.633313, 1, 1, 1, 1, 1,
-1.082872, -0.3298886, -2.073677, 1, 1, 1, 1, 1,
-1.074332, -0.1417617, -0.3406541, 1, 1, 1, 1, 1,
-1.073155, 0.7901681, -1.680778, 1, 1, 1, 1, 1,
-1.07068, -0.5003014, -2.739397, 1, 1, 1, 1, 1,
-1.069823, -0.2500803, -2.278325, 1, 1, 1, 1, 1,
-1.068289, 1.99895, -0.3547018, 1, 1, 1, 1, 1,
-1.066695, -0.8834457, -2.025893, 1, 1, 1, 1, 1,
-1.066089, -0.9950129, -4.313587, 1, 1, 1, 1, 1,
-1.06513, -0.6707022, -2.338691, 1, 1, 1, 1, 1,
-1.063964, 0.6440915, -2.751197, 1, 1, 1, 1, 1,
-1.062469, -0.3602579, -2.633582, 1, 1, 1, 1, 1,
-1.055266, 0.3211983, -0.4933215, 0, 0, 1, 1, 1,
-1.05361, 3.104391, -1.255975, 1, 0, 0, 1, 1,
-1.053401, -0.6143953, -1.753575, 1, 0, 0, 1, 1,
-1.053372, -0.8939852, -2.538375, 1, 0, 0, 1, 1,
-1.052967, 0.5030201, -1.486421, 1, 0, 0, 1, 1,
-1.051062, -0.4856959, -2.729792, 1, 0, 0, 1, 1,
-1.050603, 0.634082, -0.4768701, 0, 0, 0, 1, 1,
-1.045811, 1.724751, -1.260453, 0, 0, 0, 1, 1,
-1.045246, -0.2581698, -1.659402, 0, 0, 0, 1, 1,
-1.039206, 0.07715043, -0.3681304, 0, 0, 0, 1, 1,
-1.037044, 0.1253393, -2.057826, 0, 0, 0, 1, 1,
-1.034507, 1.472018, -1.028649, 0, 0, 0, 1, 1,
-1.026942, -0.8905905, -0.7246218, 0, 0, 0, 1, 1,
-1.026638, -1.688154, -4.008214, 1, 1, 1, 1, 1,
-1.024038, 0.4855746, -0.03374976, 1, 1, 1, 1, 1,
-1.022766, -0.95865, -2.345723, 1, 1, 1, 1, 1,
-1.018435, 1.51221, -0.3352927, 1, 1, 1, 1, 1,
-1.018333, -0.008782834, -1.665527, 1, 1, 1, 1, 1,
-1.013376, -0.2395586, -1.578543, 1, 1, 1, 1, 1,
-1.010271, 1.367965, -0.3927229, 1, 1, 1, 1, 1,
-1.008184, -0.8480458, -1.220359, 1, 1, 1, 1, 1,
-1.006432, 0.7213793, 0.04842867, 1, 1, 1, 1, 1,
-1.002298, -0.06420087, -2.535452, 1, 1, 1, 1, 1,
-0.9982999, 0.2361751, -1.270182, 1, 1, 1, 1, 1,
-0.9865275, 0.1591575, -1.720705, 1, 1, 1, 1, 1,
-0.9838458, 0.5947656, -1.353873, 1, 1, 1, 1, 1,
-0.9761892, -1.345825, -2.325435, 1, 1, 1, 1, 1,
-0.9758698, 1.845945, 0.2761412, 1, 1, 1, 1, 1,
-0.9745875, -0.1818153, -1.61782, 0, 0, 1, 1, 1,
-0.9731592, 0.1782802, -2.069808, 1, 0, 0, 1, 1,
-0.9727332, 0.5703524, -2.606148, 1, 0, 0, 1, 1,
-0.9715137, 0.08433904, -1.401586, 1, 0, 0, 1, 1,
-0.9710615, -0.3958356, -2.957996, 1, 0, 0, 1, 1,
-0.970951, -0.8259085, -4.044145, 1, 0, 0, 1, 1,
-0.9700508, 0.610526, -0.6584064, 0, 0, 0, 1, 1,
-0.9674406, -0.4168736, -2.004057, 0, 0, 0, 1, 1,
-0.9662814, 1.694387, -0.6416128, 0, 0, 0, 1, 1,
-0.9523926, 2.366894, -1.208546, 0, 0, 0, 1, 1,
-0.9476778, 0.4749972, -1.39283, 0, 0, 0, 1, 1,
-0.9459743, 0.05203896, -2.860658, 0, 0, 0, 1, 1,
-0.9447711, 1.066428, -0.6381196, 0, 0, 0, 1, 1,
-0.9436595, -0.4857333, -2.75146, 1, 1, 1, 1, 1,
-0.943483, -0.7193311, -3.030042, 1, 1, 1, 1, 1,
-0.9357942, 0.0117795, -0.2347524, 1, 1, 1, 1, 1,
-0.9309028, -0.5135114, -2.020024, 1, 1, 1, 1, 1,
-0.9294411, 0.9326097, 0.5503684, 1, 1, 1, 1, 1,
-0.9279023, 0.1012162, -1.087291, 1, 1, 1, 1, 1,
-0.9273809, 1.409577, -0.5548037, 1, 1, 1, 1, 1,
-0.9272678, -0.03670143, -2.183221, 1, 1, 1, 1, 1,
-0.9256319, 1.774766, 1.356661, 1, 1, 1, 1, 1,
-0.9248222, -0.6571509, -2.03405, 1, 1, 1, 1, 1,
-0.9243347, -0.04302143, -0.7079317, 1, 1, 1, 1, 1,
-0.9194396, 0.1871038, -0.7792014, 1, 1, 1, 1, 1,
-0.9158442, 0.8939779, -3.997527, 1, 1, 1, 1, 1,
-0.9152514, 0.4397499, -0.8642219, 1, 1, 1, 1, 1,
-0.9132245, -0.4060582, -3.295304, 1, 1, 1, 1, 1,
-0.9096083, -0.8640122, -0.08738216, 0, 0, 1, 1, 1,
-0.903644, -0.3409488, -2.279135, 1, 0, 0, 1, 1,
-0.8968962, 1.017541, -1.594893, 1, 0, 0, 1, 1,
-0.8930346, -0.644057, -0.6653221, 1, 0, 0, 1, 1,
-0.8902158, -0.1169289, -0.9713622, 1, 0, 0, 1, 1,
-0.8874258, 0.5535884, -1.074764, 1, 0, 0, 1, 1,
-0.8856667, 1.163152, -2.96208, 0, 0, 0, 1, 1,
-0.8855481, -0.660417, -1.387715, 0, 0, 0, 1, 1,
-0.8842583, -0.9635676, -3.463869, 0, 0, 0, 1, 1,
-0.8805165, 1.157726, -0.3202405, 0, 0, 0, 1, 1,
-0.8776631, 0.6192392, -0.4485017, 0, 0, 0, 1, 1,
-0.8726969, -0.7496163, -2.741074, 0, 0, 0, 1, 1,
-0.870838, -0.5123406, -3.697479, 0, 0, 0, 1, 1,
-0.8694603, -0.1320457, -0.2192202, 1, 1, 1, 1, 1,
-0.8480691, -0.8638905, -2.08272, 1, 1, 1, 1, 1,
-0.8443706, 0.2614352, -1.567924, 1, 1, 1, 1, 1,
-0.8435513, -1.507393, -4.051653, 1, 1, 1, 1, 1,
-0.8379412, 1.552822, -1.217079, 1, 1, 1, 1, 1,
-0.8360885, -0.5176777, -2.39167, 1, 1, 1, 1, 1,
-0.8331667, -1.479139, -3.095711, 1, 1, 1, 1, 1,
-0.8321121, 0.4637935, 0.2964315, 1, 1, 1, 1, 1,
-0.8294213, 0.1331615, -2.275964, 1, 1, 1, 1, 1,
-0.8288913, -0.1948592, 0.2022847, 1, 1, 1, 1, 1,
-0.8258203, -1.406643, -2.283994, 1, 1, 1, 1, 1,
-0.8145772, -0.9692253, -3.399428, 1, 1, 1, 1, 1,
-0.8044268, -0.04699644, -1.642651, 1, 1, 1, 1, 1,
-0.7969043, 0.4345088, -0.06759524, 1, 1, 1, 1, 1,
-0.7947699, 1.021605, -2.196838, 1, 1, 1, 1, 1,
-0.7932256, 0.2107083, -2.29087, 0, 0, 1, 1, 1,
-0.7910861, -0.5701426, -2.900943, 1, 0, 0, 1, 1,
-0.7847642, 0.4141957, -1.237513, 1, 0, 0, 1, 1,
-0.7825211, -0.9079008, -1.928764, 1, 0, 0, 1, 1,
-0.7686384, 0.06783892, -1.462036, 1, 0, 0, 1, 1,
-0.7632217, 0.2398743, -2.829318, 1, 0, 0, 1, 1,
-0.7628351, -0.7080841, -1.438671, 0, 0, 0, 1, 1,
-0.7617075, 0.4200729, -0.7677112, 0, 0, 0, 1, 1,
-0.7567334, 1.586936, 0.0903943, 0, 0, 0, 1, 1,
-0.7554048, 0.3710695, -0.3084587, 0, 0, 0, 1, 1,
-0.7502852, -0.836026, -3.344318, 0, 0, 0, 1, 1,
-0.7486354, 0.6559536, -1.900658, 0, 0, 0, 1, 1,
-0.7484135, -0.5594119, -0.9004239, 0, 0, 0, 1, 1,
-0.7478884, -1.024292, -0.7035531, 1, 1, 1, 1, 1,
-0.7473652, -0.2611962, -3.632624, 1, 1, 1, 1, 1,
-0.746551, -1.56894, -2.311609, 1, 1, 1, 1, 1,
-0.746126, 1.073825, -0.1591977, 1, 1, 1, 1, 1,
-0.7453555, -0.3571123, -2.06297, 1, 1, 1, 1, 1,
-0.7390552, 0.5005227, -1.529298, 1, 1, 1, 1, 1,
-0.7356831, 1.280402, -0.1697048, 1, 1, 1, 1, 1,
-0.7280353, -0.593276, -3.363687, 1, 1, 1, 1, 1,
-0.727521, -0.5220222, -4.159299, 1, 1, 1, 1, 1,
-0.726863, 0.5569504, -0.5128715, 1, 1, 1, 1, 1,
-0.7175431, -0.1177071, -2.017332, 1, 1, 1, 1, 1,
-0.7164372, -0.4499796, -2.631918, 1, 1, 1, 1, 1,
-0.7140339, 0.5478479, 0.2948208, 1, 1, 1, 1, 1,
-0.7077907, 0.3147455, -1.558932, 1, 1, 1, 1, 1,
-0.705712, -0.1175054, -2.778473, 1, 1, 1, 1, 1,
-0.6951265, -0.1475585, -2.408633, 0, 0, 1, 1, 1,
-0.6944229, -0.9666672, -2.447797, 1, 0, 0, 1, 1,
-0.6923505, 1.390221, -0.4505789, 1, 0, 0, 1, 1,
-0.6897387, -2.185508, -2.695668, 1, 0, 0, 1, 1,
-0.6876481, -0.3083074, -2.102354, 1, 0, 0, 1, 1,
-0.6853827, -0.8126739, -3.461699, 1, 0, 0, 1, 1,
-0.685216, 0.8513345, -0.633689, 0, 0, 0, 1, 1,
-0.6851195, 0.3842697, -0.9777468, 0, 0, 0, 1, 1,
-0.684352, -0.7332724, -3.197015, 0, 0, 0, 1, 1,
-0.6834003, -0.5354788, -1.644541, 0, 0, 0, 1, 1,
-0.6824673, 0.1314979, -1.628317, 0, 0, 0, 1, 1,
-0.6786968, -1.062039, -3.16243, 0, 0, 0, 1, 1,
-0.6775807, -1.427529, -1.576723, 0, 0, 0, 1, 1,
-0.668353, -0.7783987, -2.473283, 1, 1, 1, 1, 1,
-0.6616036, 0.4480671, -1.067394, 1, 1, 1, 1, 1,
-0.6584243, -0.9456078, -2.302824, 1, 1, 1, 1, 1,
-0.6509516, 0.4087987, -1.070317, 1, 1, 1, 1, 1,
-0.6468097, 0.8424329, -1.844795, 1, 1, 1, 1, 1,
-0.6464821, -0.8741611, -4.127131, 1, 1, 1, 1, 1,
-0.6406234, -1.501018, -1.878107, 1, 1, 1, 1, 1,
-0.6354325, 0.3635438, 0.9136454, 1, 1, 1, 1, 1,
-0.6335145, 0.8542274, -0.07589748, 1, 1, 1, 1, 1,
-0.6332695, -0.359552, -2.29165, 1, 1, 1, 1, 1,
-0.6330663, 1.408783, -0.03731599, 1, 1, 1, 1, 1,
-0.6322948, 0.3130804, -2.709585, 1, 1, 1, 1, 1,
-0.6283151, -0.4286786, -1.267856, 1, 1, 1, 1, 1,
-0.62624, -0.1729383, -2.032253, 1, 1, 1, 1, 1,
-0.6242391, -1.332668, -2.575894, 1, 1, 1, 1, 1,
-0.6222554, -0.3476448, -4.038533, 0, 0, 1, 1, 1,
-0.6140199, 0.4761424, -0.8607835, 1, 0, 0, 1, 1,
-0.611782, 0.7991825, -0.3825437, 1, 0, 0, 1, 1,
-0.6075513, -0.3512532, -1.186617, 1, 0, 0, 1, 1,
-0.6041124, 0.5432254, -0.770804, 1, 0, 0, 1, 1,
-0.5961397, 0.1241745, -3.002736, 1, 0, 0, 1, 1,
-0.5948804, 0.3867494, -0.8708897, 0, 0, 0, 1, 1,
-0.5905843, 1.151197, -0.5469586, 0, 0, 0, 1, 1,
-0.5894761, -0.8224962, -3.760558, 0, 0, 0, 1, 1,
-0.5866786, 1.558076, -0.2626089, 0, 0, 0, 1, 1,
-0.5846968, 0.7455536, -0.3590645, 0, 0, 0, 1, 1,
-0.5830933, -0.8629357, -2.463255, 0, 0, 0, 1, 1,
-0.5825561, 0.4767756, -1.937003, 0, 0, 0, 1, 1,
-0.5809874, -0.4297857, -1.397063, 1, 1, 1, 1, 1,
-0.568953, -0.4490893, -2.111729, 1, 1, 1, 1, 1,
-0.5679093, -1.20259, -1.970378, 1, 1, 1, 1, 1,
-0.5664627, -0.2869599, -0.8286716, 1, 1, 1, 1, 1,
-0.5663611, -1.266324, -2.511348, 1, 1, 1, 1, 1,
-0.56631, -0.1412547, -1.874794, 1, 1, 1, 1, 1,
-0.5654037, -0.6695846, -0.7439709, 1, 1, 1, 1, 1,
-0.560073, -0.2365034, -2.813581, 1, 1, 1, 1, 1,
-0.5579552, 2.107561, 0.7120264, 1, 1, 1, 1, 1,
-0.5459549, 0.2173763, -1.659258, 1, 1, 1, 1, 1,
-0.5457833, 0.5125397, -2.325585, 1, 1, 1, 1, 1,
-0.5375065, 0.03335685, -1.740047, 1, 1, 1, 1, 1,
-0.5333433, -0.546664, -0.1444728, 1, 1, 1, 1, 1,
-0.5276417, 0.9881343, -1.098561, 1, 1, 1, 1, 1,
-0.5247563, -1.200296, -3.494423, 1, 1, 1, 1, 1,
-0.5142323, 1.42516, -1.326527, 0, 0, 1, 1, 1,
-0.5133389, 0.3597463, 0.5530439, 1, 0, 0, 1, 1,
-0.5076866, -0.08184522, -2.079343, 1, 0, 0, 1, 1,
-0.5076743, -0.6662211, -3.415464, 1, 0, 0, 1, 1,
-0.5073416, -0.550909, -2.591422, 1, 0, 0, 1, 1,
-0.5043412, 0.2028019, -0.7670484, 1, 0, 0, 1, 1,
-0.4994965, 2.011078, -1.016413, 0, 0, 0, 1, 1,
-0.497817, 0.4735823, -0.1537221, 0, 0, 0, 1, 1,
-0.496999, -0.5231026, -2.39681, 0, 0, 0, 1, 1,
-0.4924769, 0.01943131, -0.7073627, 0, 0, 0, 1, 1,
-0.4923396, 1.108427, -0.1061349, 0, 0, 0, 1, 1,
-0.4898812, -0.5867953, -0.1503045, 0, 0, 0, 1, 1,
-0.4896865, -0.3670943, -3.477385, 0, 0, 0, 1, 1,
-0.4825293, 0.00119162, -2.483422, 1, 1, 1, 1, 1,
-0.4813146, -0.2655379, -2.49101, 1, 1, 1, 1, 1,
-0.4727816, -0.07974999, -1.005738, 1, 1, 1, 1, 1,
-0.4658361, -0.2002124, -3.211904, 1, 1, 1, 1, 1,
-0.4655026, -0.006909863, -1.905334, 1, 1, 1, 1, 1,
-0.462547, -0.3102971, -1.297256, 1, 1, 1, 1, 1,
-0.46106, -0.224812, -1.799184, 1, 1, 1, 1, 1,
-0.4605463, 1.51157, 0.06977913, 1, 1, 1, 1, 1,
-0.4571558, 0.1713089, -2.488861, 1, 1, 1, 1, 1,
-0.4568596, 1.859566, -0.4966973, 1, 1, 1, 1, 1,
-0.4550339, -0.5607514, -2.416341, 1, 1, 1, 1, 1,
-0.4539732, -0.09243483, -1.942655, 1, 1, 1, 1, 1,
-0.4511675, -0.1665975, -0.8479066, 1, 1, 1, 1, 1,
-0.4475497, 1.221633, -1.922458, 1, 1, 1, 1, 1,
-0.4445124, 0.777444, -0.8759128, 1, 1, 1, 1, 1,
-0.4438293, 0.1047232, -1.918458, 0, 0, 1, 1, 1,
-0.4419321, 1.321321, 0.1248735, 1, 0, 0, 1, 1,
-0.4393972, 0.466995, -1.961314, 1, 0, 0, 1, 1,
-0.4388303, -0.004258712, -1.154124, 1, 0, 0, 1, 1,
-0.4381678, -0.06563484, -2.246641, 1, 0, 0, 1, 1,
-0.437319, -1.130967, -2.641914, 1, 0, 0, 1, 1,
-0.4319028, -0.539384, -2.179524, 0, 0, 0, 1, 1,
-0.4316599, 0.4611363, -1.235213, 0, 0, 0, 1, 1,
-0.4296175, -1.024967, -2.808365, 0, 0, 0, 1, 1,
-0.429037, -1.71196, -4.22177, 0, 0, 0, 1, 1,
-0.4285424, 1.695109, 1.846589, 0, 0, 0, 1, 1,
-0.4271227, -1.01361, -3.580511, 0, 0, 0, 1, 1,
-0.4260982, 0.8917559, -0.1017804, 0, 0, 0, 1, 1,
-0.4196924, 0.09937858, -1.151691, 1, 1, 1, 1, 1,
-0.4193572, 0.5794011, -0.3303624, 1, 1, 1, 1, 1,
-0.4155364, 0.322998, -2.165209, 1, 1, 1, 1, 1,
-0.4118278, -1.056261, -2.456295, 1, 1, 1, 1, 1,
-0.4110523, 0.8557932, -1.365295, 1, 1, 1, 1, 1,
-0.4103543, -1.135267, -1.709017, 1, 1, 1, 1, 1,
-0.4060113, -0.9749372, -2.902421, 1, 1, 1, 1, 1,
-0.4003336, -0.160775, 0.1978001, 1, 1, 1, 1, 1,
-0.3961582, 0.1764267, 0.5123658, 1, 1, 1, 1, 1,
-0.3910035, -0.08479966, -1.634426, 1, 1, 1, 1, 1,
-0.3899188, 1.472315, -0.2536445, 1, 1, 1, 1, 1,
-0.3855432, -2.148281, -3.188111, 1, 1, 1, 1, 1,
-0.3815181, 0.1439447, -3.203177, 1, 1, 1, 1, 1,
-0.3797277, 0.6931835, -1.034436, 1, 1, 1, 1, 1,
-0.3689488, -1.980656, -2.671434, 1, 1, 1, 1, 1,
-0.3663386, 0.1984919, -1.96832, 0, 0, 1, 1, 1,
-0.3640597, 0.4793865, -0.2560115, 1, 0, 0, 1, 1,
-0.362952, 0.2925069, -0.2562808, 1, 0, 0, 1, 1,
-0.3627016, 0.8447403, 0.113043, 1, 0, 0, 1, 1,
-0.3602308, -0.6009784, -1.623438, 1, 0, 0, 1, 1,
-0.3570067, -0.2991923, 0.1672519, 1, 0, 0, 1, 1,
-0.3564985, -0.5603033, -2.044439, 0, 0, 0, 1, 1,
-0.3534357, -0.242868, -0.8788331, 0, 0, 0, 1, 1,
-0.3526145, 1.652918, 0.1137902, 0, 0, 0, 1, 1,
-0.35006, 0.3967183, 0.0669148, 0, 0, 0, 1, 1,
-0.3498275, 0.8944594, -0.006127408, 0, 0, 0, 1, 1,
-0.3488309, -0.726414, -2.664321, 0, 0, 0, 1, 1,
-0.3449845, -1.354999, -2.793982, 0, 0, 0, 1, 1,
-0.3389667, -1.143131, -4.041997, 1, 1, 1, 1, 1,
-0.3343149, 1.115221, 0.09491302, 1, 1, 1, 1, 1,
-0.3340577, -0.4809532, -1.214896, 1, 1, 1, 1, 1,
-0.3321821, 1.015857, -0.293619, 1, 1, 1, 1, 1,
-0.3308144, -1.790935, -3.587497, 1, 1, 1, 1, 1,
-0.3241057, -1.130685, -2.7719, 1, 1, 1, 1, 1,
-0.3162901, 2.010844, 0.4928551, 1, 1, 1, 1, 1,
-0.3161861, -0.9899025, -3.156038, 1, 1, 1, 1, 1,
-0.3128637, -0.1564304, -1.856964, 1, 1, 1, 1, 1,
-0.311904, 1.032242, 0.02334552, 1, 1, 1, 1, 1,
-0.307731, 0.03101165, -0.5615515, 1, 1, 1, 1, 1,
-0.3065793, -0.7632375, -2.160986, 1, 1, 1, 1, 1,
-0.3063742, 0.9261391, 0.1734756, 1, 1, 1, 1, 1,
-0.3014225, 1.242396, 0.797101, 1, 1, 1, 1, 1,
-0.2995589, 1.543115, -0.9131524, 1, 1, 1, 1, 1,
-0.2941423, -0.8183918, -1.755789, 0, 0, 1, 1, 1,
-0.2913673, -0.1496422, -0.9310225, 1, 0, 0, 1, 1,
-0.2892852, -0.8107389, -3.525917, 1, 0, 0, 1, 1,
-0.2864965, 0.4310626, -2.568678, 1, 0, 0, 1, 1,
-0.2854618, 0.4968401, -0.08800729, 1, 0, 0, 1, 1,
-0.2848214, 0.9373342, 0.7086601, 1, 0, 0, 1, 1,
-0.2831769, 2.081943, -0.559553, 0, 0, 0, 1, 1,
-0.2824861, 1.675046, -0.406335, 0, 0, 0, 1, 1,
-0.2811489, -1.237286, -1.54099, 0, 0, 0, 1, 1,
-0.2811444, -1.575808, -2.861205, 0, 0, 0, 1, 1,
-0.2792734, -0.5607346, -2.421069, 0, 0, 0, 1, 1,
-0.2783093, 0.1850686, -1.233103, 0, 0, 0, 1, 1,
-0.2778812, 0.9805902, 0.122109, 0, 0, 0, 1, 1,
-0.2759326, -0.366338, -3.13204, 1, 1, 1, 1, 1,
-0.272909, 0.2959348, 0.005251145, 1, 1, 1, 1, 1,
-0.2722107, -0.6493249, -2.807061, 1, 1, 1, 1, 1,
-0.2720858, -0.54041, -3.496308, 1, 1, 1, 1, 1,
-0.269593, -0.5071765, -3.719468, 1, 1, 1, 1, 1,
-0.267627, 1.606391, -2.357898, 1, 1, 1, 1, 1,
-0.2673839, -1.068788, -1.233105, 1, 1, 1, 1, 1,
-0.2667651, 1.013144, -0.147374, 1, 1, 1, 1, 1,
-0.2665326, 0.5948739, -1.859704, 1, 1, 1, 1, 1,
-0.2618234, 0.1000367, -0.59, 1, 1, 1, 1, 1,
-0.2570491, 0.543862, -1.2909, 1, 1, 1, 1, 1,
-0.2564625, 1.919417, -0.7845374, 1, 1, 1, 1, 1,
-0.2511904, -0.3644691, -2.729723, 1, 1, 1, 1, 1,
-0.25085, 1.911496, -0.1540463, 1, 1, 1, 1, 1,
-0.2450712, -0.4397937, -3.377094, 1, 1, 1, 1, 1,
-0.244279, -0.7547036, -2.780272, 0, 0, 1, 1, 1,
-0.2432643, -1.180469, -2.941377, 1, 0, 0, 1, 1,
-0.2350274, 1.564058, -1.491569, 1, 0, 0, 1, 1,
-0.2336506, -0.6286808, -3.666382, 1, 0, 0, 1, 1,
-0.2264381, 0.03014795, -1.26952, 1, 0, 0, 1, 1,
-0.2194752, 0.3008151, -0.5095773, 1, 0, 0, 1, 1,
-0.2142924, 0.9929984, 0.2302928, 0, 0, 0, 1, 1,
-0.2141517, 0.762731, -0.2064228, 0, 0, 0, 1, 1,
-0.2139668, -0.5180283, -2.095088, 0, 0, 0, 1, 1,
-0.2091258, 0.5606149, -0.6715784, 0, 0, 0, 1, 1,
-0.203597, 0.5723945, -0.06407142, 0, 0, 0, 1, 1,
-0.1950769, -0.2213122, -0.403641, 0, 0, 0, 1, 1,
-0.1946428, -0.5841113, -2.994205, 0, 0, 0, 1, 1,
-0.1937704, 0.3303804, -0.6587407, 1, 1, 1, 1, 1,
-0.193343, -0.2482258, -4.222381, 1, 1, 1, 1, 1,
-0.1923836, 0.4853371, -0.1772504, 1, 1, 1, 1, 1,
-0.1906258, -0.6423492, -2.466379, 1, 1, 1, 1, 1,
-0.1822092, 0.1426024, -3.632125, 1, 1, 1, 1, 1,
-0.181669, -0.6256315, -1.728838, 1, 1, 1, 1, 1,
-0.1809454, -1.182644, -3.260149, 1, 1, 1, 1, 1,
-0.17647, -3.080439, -2.855904, 1, 1, 1, 1, 1,
-0.1758765, -0.06558271, -1.360474, 1, 1, 1, 1, 1,
-0.175624, -1.284529, -2.092259, 1, 1, 1, 1, 1,
-0.1698439, 0.6903603, 0.3099186, 1, 1, 1, 1, 1,
-0.169366, -1.10903, -4.447251, 1, 1, 1, 1, 1,
-0.1676057, 0.394058, 1.05617, 1, 1, 1, 1, 1,
-0.1662483, 0.5131789, 0.7729117, 1, 1, 1, 1, 1,
-0.1608499, -0.5526335, -4.01982, 1, 1, 1, 1, 1,
-0.1588238, -2.112645, -2.945574, 0, 0, 1, 1, 1,
-0.1570346, -1.709448, -4.032726, 1, 0, 0, 1, 1,
-0.1564809, 0.2721111, -0.1943498, 1, 0, 0, 1, 1,
-0.1540697, -0.4405986, -3.948423, 1, 0, 0, 1, 1,
-0.1524075, 0.1041453, -0.72324, 1, 0, 0, 1, 1,
-0.1520533, 0.5750719, -0.08145766, 1, 0, 0, 1, 1,
-0.1515227, 1.165379, -0.1179402, 0, 0, 0, 1, 1,
-0.1514626, -0.3353809, -5.010319, 0, 0, 0, 1, 1,
-0.1503113, 2.198823, -1.303942, 0, 0, 0, 1, 1,
-0.1452066, 0.7502176, -0.1198671, 0, 0, 0, 1, 1,
-0.1332943, -0.1818291, -2.230156, 0, 0, 0, 1, 1,
-0.1307362, -1.070648, -2.172805, 0, 0, 0, 1, 1,
-0.129855, 0.8590045, -1.089976, 0, 0, 0, 1, 1,
-0.1290417, 1.578787, -0.3314452, 1, 1, 1, 1, 1,
-0.1271205, 0.2820191, 2.756636, 1, 1, 1, 1, 1,
-0.1221928, 1.216624, -0.7502555, 1, 1, 1, 1, 1,
-0.1201867, 0.04508374, -1.07558, 1, 1, 1, 1, 1,
-0.1178401, -1.10434, -1.782596, 1, 1, 1, 1, 1,
-0.1138359, -0.2842321, -4.217121, 1, 1, 1, 1, 1,
-0.1123931, -0.1763974, -2.785199, 1, 1, 1, 1, 1,
-0.1121797, -0.7808658, -2.395552, 1, 1, 1, 1, 1,
-0.09757932, 1.91737, -0.4886927, 1, 1, 1, 1, 1,
-0.09712212, 1.807672, -1.109879, 1, 1, 1, 1, 1,
-0.09673871, -0.6219475, -1.547373, 1, 1, 1, 1, 1,
-0.09663987, -0.02070853, -2.834918, 1, 1, 1, 1, 1,
-0.09498581, -3.007219, -3.881836, 1, 1, 1, 1, 1,
-0.09381501, 0.004339097, -2.622926, 1, 1, 1, 1, 1,
-0.09223595, -1.114867, -3.694057, 1, 1, 1, 1, 1,
-0.09211823, -0.1341138, -3.225584, 0, 0, 1, 1, 1,
-0.09209585, -0.4682502, -3.308833, 1, 0, 0, 1, 1,
-0.08700795, -0.4407136, -3.539138, 1, 0, 0, 1, 1,
-0.08663461, -0.872445, -4.175882, 1, 0, 0, 1, 1,
-0.08409734, -0.1629765, -3.851283, 1, 0, 0, 1, 1,
-0.08213932, -0.4007541, -1.510507, 1, 0, 0, 1, 1,
-0.07477172, -1.003925, -2.006239, 0, 0, 0, 1, 1,
-0.07265908, -1.730706, -2.704143, 0, 0, 0, 1, 1,
-0.07038148, -0.9271016, -3.741268, 0, 0, 0, 1, 1,
-0.06950376, 1.680895, 0.5815211, 0, 0, 0, 1, 1,
-0.06898455, -0.3816662, -3.413883, 0, 0, 0, 1, 1,
-0.06622452, 0.3685337, 1.365528, 0, 0, 0, 1, 1,
-0.06194957, 1.7858, 1.361884, 0, 0, 0, 1, 1,
-0.05630859, -1.818669, -2.78102, 1, 1, 1, 1, 1,
-0.05503333, 0.7338471, 0.1868282, 1, 1, 1, 1, 1,
-0.0537882, 1.677633, -1.353373, 1, 1, 1, 1, 1,
-0.04624573, 1.997578, 1.720983, 1, 1, 1, 1, 1,
-0.0450016, 0.2639958, -0.6977572, 1, 1, 1, 1, 1,
-0.04366128, -0.4024166, -2.475934, 1, 1, 1, 1, 1,
-0.04137687, 1.776861, -0.9172098, 1, 1, 1, 1, 1,
-0.04017251, 0.8196868, -0.2625712, 1, 1, 1, 1, 1,
-0.03913585, -0.1439986, -0.8500894, 1, 1, 1, 1, 1,
-0.03541693, 0.6830262, -0.7282298, 1, 1, 1, 1, 1,
-0.0349636, 0.1381912, -1.116039, 1, 1, 1, 1, 1,
-0.03382022, -0.1815629, -1.483576, 1, 1, 1, 1, 1,
-0.03356227, -1.219538, -2.918831, 1, 1, 1, 1, 1,
-0.03199156, 1.686545, 0.730992, 1, 1, 1, 1, 1,
-0.02997067, 0.6072382, 0.2487001, 1, 1, 1, 1, 1,
-0.0238113, 0.1243473, -0.8022931, 0, 0, 1, 1, 1,
-0.02280251, 0.4658683, 1.37022, 1, 0, 0, 1, 1,
-0.02234193, -0.8171479, -4.422737, 1, 0, 0, 1, 1,
-0.01891379, 0.3279165, 0.02103732, 1, 0, 0, 1, 1,
-0.01863714, -1.205397, -2.845793, 1, 0, 0, 1, 1,
-0.01365534, 2.765661, -0.2959454, 1, 0, 0, 1, 1,
-0.007078069, 1.019642, -1.433358, 0, 0, 0, 1, 1,
-0.006973313, 0.8794131, 0.8272602, 0, 0, 0, 1, 1,
-0.006968459, 0.5608964, -0.08600041, 0, 0, 0, 1, 1,
0.002363631, -0.4367485, 4.912905, 0, 0, 0, 1, 1,
0.002605342, -0.4472744, 1.683433, 0, 0, 0, 1, 1,
0.004694011, 0.004018715, 1.93002, 0, 0, 0, 1, 1,
0.006879879, -0.6183304, 3.403306, 0, 0, 0, 1, 1,
0.007294054, 0.03343064, -2.08938, 1, 1, 1, 1, 1,
0.007715211, 1.444724, -0.9949902, 1, 1, 1, 1, 1,
0.008886999, -0.7362096, 3.630392, 1, 1, 1, 1, 1,
0.0090462, -0.3019503, 2.232096, 1, 1, 1, 1, 1,
0.01286382, -0.8184397, 2.123328, 1, 1, 1, 1, 1,
0.01643088, 0.2015638, -0.0624877, 1, 1, 1, 1, 1,
0.01791526, -0.02169755, 2.985252, 1, 1, 1, 1, 1,
0.01879257, 0.4914396, 1.112013, 1, 1, 1, 1, 1,
0.01906447, -0.2775689, 2.811913, 1, 1, 1, 1, 1,
0.01920205, 0.9238743, -0.8435903, 1, 1, 1, 1, 1,
0.02090885, 0.8071685, 0.3142452, 1, 1, 1, 1, 1,
0.02091168, 1.194032, -0.6462619, 1, 1, 1, 1, 1,
0.02092198, 1.307326, -0.5740618, 1, 1, 1, 1, 1,
0.02349626, -0.8495794, 4.589953, 1, 1, 1, 1, 1,
0.02502284, -1.277227, 3.485235, 1, 1, 1, 1, 1,
0.02693292, -0.2013235, 1.356104, 0, 0, 1, 1, 1,
0.0280494, 1.839309, -0.8689715, 1, 0, 0, 1, 1,
0.0280954, -0.7978542, 1.979156, 1, 0, 0, 1, 1,
0.02938231, -1.158683, 4.282554, 1, 0, 0, 1, 1,
0.03327759, -1.228771, 3.306356, 1, 0, 0, 1, 1,
0.0350401, 0.5604255, 1.643974, 1, 0, 0, 1, 1,
0.03606488, 0.1649386, 0.5533186, 0, 0, 0, 1, 1,
0.03679302, -0.4912583, 3.015936, 0, 0, 0, 1, 1,
0.03748308, 0.3270015, -0.8780674, 0, 0, 0, 1, 1,
0.04510465, -0.6617799, 2.891643, 0, 0, 0, 1, 1,
0.05920618, -0.03945037, 0.9294785, 0, 0, 0, 1, 1,
0.05986089, 1.042725, 0.4881841, 0, 0, 0, 1, 1,
0.06075966, -1.294617, 1.034178, 0, 0, 0, 1, 1,
0.06093204, -1.980085, 3.620239, 1, 1, 1, 1, 1,
0.06196642, 0.4125542, 1.54384, 1, 1, 1, 1, 1,
0.0650806, 0.2406413, -1.433183, 1, 1, 1, 1, 1,
0.06739898, -1.296239, 3.358031, 1, 1, 1, 1, 1,
0.06836177, -0.3802686, 1.935815, 1, 1, 1, 1, 1,
0.06861918, -1.093277, 1.184617, 1, 1, 1, 1, 1,
0.06938444, 1.262671, 0.4120071, 1, 1, 1, 1, 1,
0.07195994, -0.8423939, 4.395065, 1, 1, 1, 1, 1,
0.07380203, -1.043322, 3.89113, 1, 1, 1, 1, 1,
0.08162757, 0.01939965, 0.001776611, 1, 1, 1, 1, 1,
0.08322843, 0.3756744, -1.224321, 1, 1, 1, 1, 1,
0.09211916, -2.205542, 5.23034, 1, 1, 1, 1, 1,
0.09317705, -1.976064, 2.854324, 1, 1, 1, 1, 1,
0.09646024, -1.543, 3.870964, 1, 1, 1, 1, 1,
0.09646252, 0.8194014, 1.229719, 1, 1, 1, 1, 1,
0.1026311, 0.2646594, -0.5726429, 0, 0, 1, 1, 1,
0.1055774, 0.3720797, 0.1614511, 1, 0, 0, 1, 1,
0.1059066, -1.72276, 4.185511, 1, 0, 0, 1, 1,
0.1091023, 1.426262, -0.9815264, 1, 0, 0, 1, 1,
0.1137129, 0.9497214, -0.005403187, 1, 0, 0, 1, 1,
0.1153041, -0.08314259, 0.2367045, 1, 0, 0, 1, 1,
0.1170232, 0.1959801, 0.7276726, 0, 0, 0, 1, 1,
0.1232962, -0.408265, 1.220484, 0, 0, 0, 1, 1,
0.125659, 1.340573, 1.619795, 0, 0, 0, 1, 1,
0.1286154, 0.64895, 1.114317, 0, 0, 0, 1, 1,
0.1298499, 0.3884194, 1.645402, 0, 0, 0, 1, 1,
0.1322577, -0.2508059, 4.297632, 0, 0, 0, 1, 1,
0.135731, 0.3481887, -1.910738, 0, 0, 0, 1, 1,
0.1362713, 0.494591, -0.4961644, 1, 1, 1, 1, 1,
0.1406024, 0.2928404, 1.550964, 1, 1, 1, 1, 1,
0.1413519, -0.6296169, 3.772915, 1, 1, 1, 1, 1,
0.141845, 0.4106638, -0.3314025, 1, 1, 1, 1, 1,
0.1474005, 0.1596565, 1.00743, 1, 1, 1, 1, 1,
0.1490643, 0.110498, 1.010346, 1, 1, 1, 1, 1,
0.1522017, 2.214066, -0.7762507, 1, 1, 1, 1, 1,
0.1545549, -0.5925648, 1.001214, 1, 1, 1, 1, 1,
0.154763, -1.181132, 3.469416, 1, 1, 1, 1, 1,
0.1559272, 1.312219, 2.492872, 1, 1, 1, 1, 1,
0.1568739, -0.3966136, 1.9646, 1, 1, 1, 1, 1,
0.1593039, -0.695321, 3.392888, 1, 1, 1, 1, 1,
0.1617257, 1.158816, 1.068152, 1, 1, 1, 1, 1,
0.1621383, 0.8323066, -0.2480714, 1, 1, 1, 1, 1,
0.1765991, -0.01514691, 0.4512168, 1, 1, 1, 1, 1,
0.178998, 0.2767482, -0.3164669, 0, 0, 1, 1, 1,
0.1800128, 0.9542329, 0.3575929, 1, 0, 0, 1, 1,
0.1815506, -0.6269076, 2.213495, 1, 0, 0, 1, 1,
0.1825123, 0.1769441, 3.046482, 1, 0, 0, 1, 1,
0.1847208, -0.2728656, 3.639881, 1, 0, 0, 1, 1,
0.1849428, -0.6523159, 3.575395, 1, 0, 0, 1, 1,
0.1867316, 0.6351703, -0.4185019, 0, 0, 0, 1, 1,
0.1885431, 0.4915045, 1.493177, 0, 0, 0, 1, 1,
0.1897174, -0.1508152, 1.232719, 0, 0, 0, 1, 1,
0.1903225, 0.3055977, 1.260463, 0, 0, 0, 1, 1,
0.1930884, -1.680826, 3.255607, 0, 0, 0, 1, 1,
0.1953248, -0.6948033, 2.810273, 0, 0, 0, 1, 1,
0.1970333, 0.1693919, -0.9638023, 0, 0, 0, 1, 1,
0.19827, 0.2864937, -0.9204, 1, 1, 1, 1, 1,
0.2009017, 1.546097, -1.110725, 1, 1, 1, 1, 1,
0.2091275, -0.2011555, 0.3168971, 1, 1, 1, 1, 1,
0.2102256, 0.6321589, -0.5234529, 1, 1, 1, 1, 1,
0.2135101, -0.5974491, 3.503374, 1, 1, 1, 1, 1,
0.2184891, 2.181345, -0.1744674, 1, 1, 1, 1, 1,
0.2185693, -0.2813572, 0.473222, 1, 1, 1, 1, 1,
0.2219813, -1.219835, 1.520306, 1, 1, 1, 1, 1,
0.2239479, -1.175782, 4.013314, 1, 1, 1, 1, 1,
0.2255027, -1.769869, 1.226912, 1, 1, 1, 1, 1,
0.2378167, -0.7847561, 3.738636, 1, 1, 1, 1, 1,
0.2458054, -0.7775268, 4.510586, 1, 1, 1, 1, 1,
0.2489278, -0.4520616, 3.263923, 1, 1, 1, 1, 1,
0.2498884, -1.240396, 2.345129, 1, 1, 1, 1, 1,
0.254297, -0.5799107, 2.584948, 1, 1, 1, 1, 1,
0.2547623, -0.407457, 3.873585, 0, 0, 1, 1, 1,
0.2548203, -0.6442258, 2.337025, 1, 0, 0, 1, 1,
0.2564578, 0.497723, 0.693336, 1, 0, 0, 1, 1,
0.2567607, -2.627468, 3.149986, 1, 0, 0, 1, 1,
0.2583197, 0.3168626, 0.5419888, 1, 0, 0, 1, 1,
0.2603052, -0.2383604, 1.457761, 1, 0, 0, 1, 1,
0.2621598, -0.1657394, -0.06263345, 0, 0, 0, 1, 1,
0.2637708, -1.491642, 3.85265, 0, 0, 0, 1, 1,
0.2716591, -0.2016561, 2.340929, 0, 0, 0, 1, 1,
0.2763696, 0.3577244, 0.006691985, 0, 0, 0, 1, 1,
0.2817598, -0.5253359, 2.03603, 0, 0, 0, 1, 1,
0.285027, -0.2842168, 3.221093, 0, 0, 0, 1, 1,
0.2859516, 0.8824583, -0.9633495, 0, 0, 0, 1, 1,
0.2861955, 1.023687, -0.5048077, 1, 1, 1, 1, 1,
0.2939354, 1.876326, -1.020592, 1, 1, 1, 1, 1,
0.2943345, -0.842884, 0.6409339, 1, 1, 1, 1, 1,
0.2975304, -2.110941, 3.512962, 1, 1, 1, 1, 1,
0.2977951, 0.6109446, 1.600119, 1, 1, 1, 1, 1,
0.3040161, -3.194108, 3.13595, 1, 1, 1, 1, 1,
0.3057401, -0.5016229, 2.161962, 1, 1, 1, 1, 1,
0.3164997, 0.785278, -0.5239713, 1, 1, 1, 1, 1,
0.321668, 0.4715614, -0.6985801, 1, 1, 1, 1, 1,
0.331077, -0.851629, 1.093848, 1, 1, 1, 1, 1,
0.3371134, 0.08083548, 1.942921, 1, 1, 1, 1, 1,
0.3403373, 0.04765531, -0.04333795, 1, 1, 1, 1, 1,
0.3406425, 0.883441, 2.248489, 1, 1, 1, 1, 1,
0.3412286, 0.3769041, -0.2588976, 1, 1, 1, 1, 1,
0.3442517, -0.2531593, -0.1394627, 1, 1, 1, 1, 1,
0.3484586, 0.906834, -0.5734366, 0, 0, 1, 1, 1,
0.3487548, -0.3365594, 2.11032, 1, 0, 0, 1, 1,
0.35122, -0.9277943, 3.857239, 1, 0, 0, 1, 1,
0.3581581, -0.6851098, 2.427704, 1, 0, 0, 1, 1,
0.3597511, -0.03583274, 1.489189, 1, 0, 0, 1, 1,
0.3605426, 0.5504911, 0.8081167, 1, 0, 0, 1, 1,
0.3631981, 0.2975361, 0.2871192, 0, 0, 0, 1, 1,
0.3633391, -1.358874, 3.585371, 0, 0, 0, 1, 1,
0.3638008, 0.1909779, 1.692732, 0, 0, 0, 1, 1,
0.3651802, -0.2277713, 4.453263, 0, 0, 0, 1, 1,
0.3682832, 0.2487064, -0.3160028, 0, 0, 0, 1, 1,
0.3692137, -1.173619, 3.22585, 0, 0, 0, 1, 1,
0.3715499, 0.1494058, 0.3612308, 0, 0, 0, 1, 1,
0.3733577, 1.799459, 1.243492, 1, 1, 1, 1, 1,
0.3819735, 1.207843, 1.295112, 1, 1, 1, 1, 1,
0.3900437, -0.1982584, 2.271112, 1, 1, 1, 1, 1,
0.3907268, 0.06802595, 0.1879718, 1, 1, 1, 1, 1,
0.3929034, 0.1692825, 0.08952439, 1, 1, 1, 1, 1,
0.3943301, -1.01002, 3.711816, 1, 1, 1, 1, 1,
0.400701, 1.76832, -0.008680844, 1, 1, 1, 1, 1,
0.4021833, 0.5680807, 1.905877, 1, 1, 1, 1, 1,
0.4036938, 0.05630222, 0.7658862, 1, 1, 1, 1, 1,
0.4052156, -2.054617, 1.879912, 1, 1, 1, 1, 1,
0.4128038, -0.861662, 1.710936, 1, 1, 1, 1, 1,
0.4150175, -0.08488775, 1.748023, 1, 1, 1, 1, 1,
0.4151657, -0.5741602, 1.969633, 1, 1, 1, 1, 1,
0.419855, -0.563184, 2.416538, 1, 1, 1, 1, 1,
0.4199904, -1.576168, 3.164859, 1, 1, 1, 1, 1,
0.4211176, 0.2160367, -0.6558209, 0, 0, 1, 1, 1,
0.4229821, 1.113293, 1.10674, 1, 0, 0, 1, 1,
0.4297975, -0.6860529, 4.180657, 1, 0, 0, 1, 1,
0.4302394, 1.466815, 0.0216364, 1, 0, 0, 1, 1,
0.4330589, -0.1297718, 0.7916365, 1, 0, 0, 1, 1,
0.4332433, 0.2212389, 1.795119, 1, 0, 0, 1, 1,
0.4333535, 1.087196, 1.59057, 0, 0, 0, 1, 1,
0.4423352, 1.485064, 0.1405735, 0, 0, 0, 1, 1,
0.4448602, 0.9441529, -1.642491, 0, 0, 0, 1, 1,
0.4466839, -1.204472, 1.408125, 0, 0, 0, 1, 1,
0.4487871, 0.3123684, -0.3420589, 0, 0, 0, 1, 1,
0.4489289, 1.705404, 0.6563472, 0, 0, 0, 1, 1,
0.4616064, 0.3245569, 0.4947425, 0, 0, 0, 1, 1,
0.4659669, 1.981112, 0.02863668, 1, 1, 1, 1, 1,
0.4678923, 0.7624508, 1.469889, 1, 1, 1, 1, 1,
0.4686024, 0.3712777, 0.9046549, 1, 1, 1, 1, 1,
0.4689263, -1.124678, 1.869882, 1, 1, 1, 1, 1,
0.4694412, 0.5073776, 3.141778, 1, 1, 1, 1, 1,
0.470222, -0.7978925, 2.687543, 1, 1, 1, 1, 1,
0.4712447, -0.6651966, 1.803012, 1, 1, 1, 1, 1,
0.4721554, -0.1900962, 2.276826, 1, 1, 1, 1, 1,
0.4739941, -0.04980801, 0.4257618, 1, 1, 1, 1, 1,
0.4796167, 0.516944, 2.275898, 1, 1, 1, 1, 1,
0.4797396, -0.380351, 1.6729, 1, 1, 1, 1, 1,
0.4800717, -0.9380921, 0.9998526, 1, 1, 1, 1, 1,
0.4830672, -0.6960194, 3.39255, 1, 1, 1, 1, 1,
0.4831246, -0.1394099, 0.703378, 1, 1, 1, 1, 1,
0.4840571, -0.5491306, 3.234127, 1, 1, 1, 1, 1,
0.4846197, -0.8096482, 2.554465, 0, 0, 1, 1, 1,
0.4847642, 1.745365, -0.4275292, 1, 0, 0, 1, 1,
0.486855, -1.142359, 3.468049, 1, 0, 0, 1, 1,
0.4902573, 0.2124799, 1.472941, 1, 0, 0, 1, 1,
0.4912935, -0.03935136, 1.5962, 1, 0, 0, 1, 1,
0.4916345, -1.434839, 3.071617, 1, 0, 0, 1, 1,
0.4920989, -0.3742425, 1.342301, 0, 0, 0, 1, 1,
0.4968511, -1.363472, 1.63388, 0, 0, 0, 1, 1,
0.4991549, 0.8895567, -0.6971349, 0, 0, 0, 1, 1,
0.5020083, 0.4096494, 2.890384, 0, 0, 0, 1, 1,
0.5051377, -0.6792519, 2.864301, 0, 0, 0, 1, 1,
0.5053895, -0.255967, -0.1221415, 0, 0, 0, 1, 1,
0.5113223, 0.002654, 1.845717, 0, 0, 0, 1, 1,
0.5137086, -0.1833173, 3.48955, 1, 1, 1, 1, 1,
0.5139329, 1.065816, 2.538595, 1, 1, 1, 1, 1,
0.5243294, 0.9264502, 0.9017287, 1, 1, 1, 1, 1,
0.527877, -1.001687, 1.042664, 1, 1, 1, 1, 1,
0.5283574, -1.109212, 3.636835, 1, 1, 1, 1, 1,
0.5285577, -0.9139383, 2.025775, 1, 1, 1, 1, 1,
0.5287353, -1.974505, 3.724479, 1, 1, 1, 1, 1,
0.5292919, -0.6000182, 2.525598, 1, 1, 1, 1, 1,
0.5390878, 1.100646, -0.1202453, 1, 1, 1, 1, 1,
0.5423261, 0.8495127, 1.151455, 1, 1, 1, 1, 1,
0.5431577, -1.017439, 3.402021, 1, 1, 1, 1, 1,
0.5438369, 0.1719924, 3.543319, 1, 1, 1, 1, 1,
0.5632459, 2.145104, -0.2721155, 1, 1, 1, 1, 1,
0.5791764, -0.7644567, 3.550319, 1, 1, 1, 1, 1,
0.5808275, -0.2342679, 3.952858, 1, 1, 1, 1, 1,
0.5838872, -0.6596424, 2.056222, 0, 0, 1, 1, 1,
0.5908009, 0.3846921, -0.3775113, 1, 0, 0, 1, 1,
0.5962254, -0.6501988, 0.9937506, 1, 0, 0, 1, 1,
0.5962314, -0.03862475, 2.191952, 1, 0, 0, 1, 1,
0.5964419, 1.66488, 0.1008764, 1, 0, 0, 1, 1,
0.5997547, 0.0509908, 1.494983, 1, 0, 0, 1, 1,
0.6003749, -0.492787, 1.114454, 0, 0, 0, 1, 1,
0.601176, 0.7241659, -0.01884287, 0, 0, 0, 1, 1,
0.6032795, 0.8253734, 1.040255, 0, 0, 0, 1, 1,
0.616013, 0.1369091, 1.863457, 0, 0, 0, 1, 1,
0.6168181, -0.4540767, 2.263191, 0, 0, 0, 1, 1,
0.6210161, 0.1835361, 3.161533, 0, 0, 0, 1, 1,
0.6233234, 0.7244949, 0.6289687, 0, 0, 0, 1, 1,
0.6249511, -1.023475, 1.341516, 1, 1, 1, 1, 1,
0.6251913, 0.3014642, 1.710919, 1, 1, 1, 1, 1,
0.6334822, 0.30606, 2.04214, 1, 1, 1, 1, 1,
0.6335182, 0.4471629, 1.743776, 1, 1, 1, 1, 1,
0.6336147, 1.837222, -0.6274447, 1, 1, 1, 1, 1,
0.6355954, -0.7678591, 1.441085, 1, 1, 1, 1, 1,
0.6391327, 0.1119157, 0.5116331, 1, 1, 1, 1, 1,
0.6396296, -0.674255, 2.447659, 1, 1, 1, 1, 1,
0.6462811, -1.457205, 1.001909, 1, 1, 1, 1, 1,
0.6464099, -0.2160981, 0.5409139, 1, 1, 1, 1, 1,
0.6475333, -1.205805, 3.620189, 1, 1, 1, 1, 1,
0.6500195, -0.3670508, 3.209591, 1, 1, 1, 1, 1,
0.650022, -0.7280034, 4.301964, 1, 1, 1, 1, 1,
0.6500797, -0.6208267, 1.797762, 1, 1, 1, 1, 1,
0.6508496, 0.2600577, 0.3520089, 1, 1, 1, 1, 1,
0.6630203, 1.515394, 0.3196794, 0, 0, 1, 1, 1,
0.6639673, -0.6073332, 2.00114, 1, 0, 0, 1, 1,
0.6647785, 0.835128, -0.05584143, 1, 0, 0, 1, 1,
0.6724972, 0.3966057, 1.149504, 1, 0, 0, 1, 1,
0.6756881, -1.743842, 2.586718, 1, 0, 0, 1, 1,
0.6758082, -0.4615988, 2.633354, 1, 0, 0, 1, 1,
0.6822811, -1.040747, 2.610601, 0, 0, 0, 1, 1,
0.6841976, -0.5634875, -0.06337054, 0, 0, 0, 1, 1,
0.6870126, 0.919636, -0.2602698, 0, 0, 0, 1, 1,
0.6948582, -2.032855, 1.608765, 0, 0, 0, 1, 1,
0.7004902, 0.8114752, -0.3579409, 0, 0, 0, 1, 1,
0.7049384, 0.00729855, 3.001084, 0, 0, 0, 1, 1,
0.7166826, 1.842584, 0.007776363, 0, 0, 0, 1, 1,
0.7174181, -1.166446, 2.786086, 1, 1, 1, 1, 1,
0.7213397, -0.7418808, 2.236604, 1, 1, 1, 1, 1,
0.7227984, 0.9041377, 1.352223, 1, 1, 1, 1, 1,
0.7229934, 0.4173793, 0.5015633, 1, 1, 1, 1, 1,
0.7248536, 0.7559032, 3.408098, 1, 1, 1, 1, 1,
0.7264909, -0.3374169, 3.15645, 1, 1, 1, 1, 1,
0.7314572, 1.385815, -0.607571, 1, 1, 1, 1, 1,
0.7322284, -1.225854, 1.674708, 1, 1, 1, 1, 1,
0.7356918, -0.2111616, 1.378808, 1, 1, 1, 1, 1,
0.7366732, 0.3258183, 0.8315676, 1, 1, 1, 1, 1,
0.7402632, -0.6992167, 3.460731, 1, 1, 1, 1, 1,
0.7467518, -1.050593, 3.841288, 1, 1, 1, 1, 1,
0.7468303, -2.042507, 4.191764, 1, 1, 1, 1, 1,
0.748326, 2.24331, 1.545606, 1, 1, 1, 1, 1,
0.7514946, -1.428973, 3.855771, 1, 1, 1, 1, 1,
0.7544188, 0.477758, 0.4830599, 0, 0, 1, 1, 1,
0.7621431, -0.07869806, 1.762554, 1, 0, 0, 1, 1,
0.7637182, 0.6751243, 1.524569, 1, 0, 0, 1, 1,
0.7650618, 1.046519, -0.873867, 1, 0, 0, 1, 1,
0.7680716, -0.7783077, 2.741804, 1, 0, 0, 1, 1,
0.7703262, -0.1777501, 2.228721, 1, 0, 0, 1, 1,
0.7709965, -0.8192782, 1.523073, 0, 0, 0, 1, 1,
0.7745054, 1.576931, 0.4095777, 0, 0, 0, 1, 1,
0.776691, -0.1482525, 2.592061, 0, 0, 0, 1, 1,
0.7792709, 0.3374803, 0.1313115, 0, 0, 0, 1, 1,
0.7794955, 0.468011, 1.759241, 0, 0, 0, 1, 1,
0.7864195, -1.462538, 2.633226, 0, 0, 0, 1, 1,
0.7869835, 2.354104, -0.1125787, 0, 0, 0, 1, 1,
0.7967165, 0.0429748, 2.010849, 1, 1, 1, 1, 1,
0.7983925, -0.294135, 3.204842, 1, 1, 1, 1, 1,
0.8087184, 0.974674, 2.091792, 1, 1, 1, 1, 1,
0.8101673, 0.52495, 0.896422, 1, 1, 1, 1, 1,
0.8146707, 1.080151, -0.919108, 1, 1, 1, 1, 1,
0.8172532, -1.109588, 1.043618, 1, 1, 1, 1, 1,
0.8218345, 0.3114816, 1.371992, 1, 1, 1, 1, 1,
0.8291992, -0.2794577, 2.879364, 1, 1, 1, 1, 1,
0.829686, -0.7521198, 2.951413, 1, 1, 1, 1, 1,
0.8309231, 0.123452, 1.74752, 1, 1, 1, 1, 1,
0.8340167, -0.7039178, 3.104561, 1, 1, 1, 1, 1,
0.8358674, 0.230756, 3.326953, 1, 1, 1, 1, 1,
0.837873, -1.192689, 0.9176275, 1, 1, 1, 1, 1,
0.8409588, -0.203431, 2.437498, 1, 1, 1, 1, 1,
0.843125, -1.20149, 1.483641, 1, 1, 1, 1, 1,
0.8440957, 0.4681301, 2.70392, 0, 0, 1, 1, 1,
0.8454367, -0.433404, 1.825956, 1, 0, 0, 1, 1,
0.846602, -0.163108, 0.8869404, 1, 0, 0, 1, 1,
0.8470714, 0.1079565, 2.44017, 1, 0, 0, 1, 1,
0.8484155, -1.028954, 1.55904, 1, 0, 0, 1, 1,
0.8504092, 2.193683, 1.158358, 1, 0, 0, 1, 1,
0.8561168, -1.247273, 2.845382, 0, 0, 0, 1, 1,
0.8584816, -0.09050807, 2.170254, 0, 0, 0, 1, 1,
0.8702613, -0.1920596, 0.2061367, 0, 0, 0, 1, 1,
0.8715217, -0.5956138, 2.076627, 0, 0, 0, 1, 1,
0.8731435, 0.1993265, 1.691963, 0, 0, 0, 1, 1,
0.8862748, -1.394797, 0.4778477, 0, 0, 0, 1, 1,
0.8872152, 1.405751, 1.705759, 0, 0, 0, 1, 1,
0.8879786, 0.728309, 0.05677894, 1, 1, 1, 1, 1,
0.8949876, 0.2109486, 1.883972, 1, 1, 1, 1, 1,
0.901846, 0.3268121, 1.34497, 1, 1, 1, 1, 1,
0.9047107, 2.110865, 0.9018537, 1, 1, 1, 1, 1,
0.9054189, -1.387914, 2.378753, 1, 1, 1, 1, 1,
0.9064696, -0.1609945, 2.213059, 1, 1, 1, 1, 1,
0.9142599, 0.1182571, 4.117186, 1, 1, 1, 1, 1,
0.9184802, 1.183936, 1.736952, 1, 1, 1, 1, 1,
0.9222374, 0.2749811, 0.6822819, 1, 1, 1, 1, 1,
0.9252579, -0.8352693, 2.812518, 1, 1, 1, 1, 1,
0.9328017, -0.4194529, 1.989655, 1, 1, 1, 1, 1,
0.933058, 0.9900576, 2.113627, 1, 1, 1, 1, 1,
0.941346, -0.6009515, 1.565955, 1, 1, 1, 1, 1,
0.9457425, -0.759467, 1.968829, 1, 1, 1, 1, 1,
0.9491237, -0.2550401, 3.692548, 1, 1, 1, 1, 1,
0.949306, 0.5614237, 1.132693, 0, 0, 1, 1, 1,
0.95363, 0.7386425, 0.7863504, 1, 0, 0, 1, 1,
0.9548389, -2.415322, 3.239283, 1, 0, 0, 1, 1,
0.9552636, 0.2717285, 2.899078, 1, 0, 0, 1, 1,
0.955928, -0.7457992, 3.199482, 1, 0, 0, 1, 1,
0.9602457, 0.2692411, 0.1915525, 1, 0, 0, 1, 1,
0.9627948, 0.7883341, 1.17956, 0, 0, 0, 1, 1,
0.9632112, -2.408982, 2.930918, 0, 0, 0, 1, 1,
0.9684687, 0.657487, 2.543262, 0, 0, 0, 1, 1,
0.9750899, 1.117598, 0.7570888, 0, 0, 0, 1, 1,
0.9790896, 0.5758687, 0.2804195, 0, 0, 0, 1, 1,
0.9880648, 0.6162359, 0.251835, 0, 0, 0, 1, 1,
0.9907229, 0.920697, 1.003025, 0, 0, 0, 1, 1,
0.9947477, -0.7690759, 0.142998, 1, 1, 1, 1, 1,
0.9974664, 2.265409, 0.8199669, 1, 1, 1, 1, 1,
1.000629, 0.4596402, 2.101569, 1, 1, 1, 1, 1,
1.011756, -1.526527, 2.494761, 1, 1, 1, 1, 1,
1.012774, -0.5714782, 2.080521, 1, 1, 1, 1, 1,
1.013405, -0.2902778, 0.9446787, 1, 1, 1, 1, 1,
1.021614, 0.2205832, 2.145116, 1, 1, 1, 1, 1,
1.02544, 0.3427518, 1.741777, 1, 1, 1, 1, 1,
1.029557, 1.146035, 2.393301, 1, 1, 1, 1, 1,
1.036954, 0.3864885, -0.2837455, 1, 1, 1, 1, 1,
1.046294, 0.3478266, 1.384487, 1, 1, 1, 1, 1,
1.047387, -1.171645, 1.898206, 1, 1, 1, 1, 1,
1.057372, -0.8597876, 2.467045, 1, 1, 1, 1, 1,
1.057886, 0.7403688, 0.4233508, 1, 1, 1, 1, 1,
1.060161, -1.321949, 2.125037, 1, 1, 1, 1, 1,
1.068653, -0.7312236, 2.934137, 0, 0, 1, 1, 1,
1.08015, -0.5194614, 0.3887077, 1, 0, 0, 1, 1,
1.083114, 0.4940825, 1.40649, 1, 0, 0, 1, 1,
1.085323, -0.1830858, 1.177723, 1, 0, 0, 1, 1,
1.086708, 2.113507, -1.343806, 1, 0, 0, 1, 1,
1.089342, -1.184603, 1.507811, 1, 0, 0, 1, 1,
1.096716, -1.238399, 2.705242, 0, 0, 0, 1, 1,
1.101, 0.3174382, 1.978266, 0, 0, 0, 1, 1,
1.10684, 0.03912873, 3.006752, 0, 0, 0, 1, 1,
1.110104, -0.9616458, 2.194511, 0, 0, 0, 1, 1,
1.118078, -0.3828982, 0.933565, 0, 0, 0, 1, 1,
1.118097, -0.4133352, 1.44827, 0, 0, 0, 1, 1,
1.129237, -0.3372034, 2.268154, 0, 0, 0, 1, 1,
1.131867, -0.6114213, 0.6387637, 1, 1, 1, 1, 1,
1.132084, 0.8280839, 0.8999937, 1, 1, 1, 1, 1,
1.135283, 0.1045359, 1.244268, 1, 1, 1, 1, 1,
1.139822, 0.5709153, -1.608842, 1, 1, 1, 1, 1,
1.142353, 1.312693, 1.068473, 1, 1, 1, 1, 1,
1.143461, 0.6678419, 0.6134578, 1, 1, 1, 1, 1,
1.146471, 0.6369466, 1.15171, 1, 1, 1, 1, 1,
1.149836, 0.05300694, 3.244728, 1, 1, 1, 1, 1,
1.150547, -1.117144, 4.094184, 1, 1, 1, 1, 1,
1.151476, -0.7001863, 0.9470553, 1, 1, 1, 1, 1,
1.161729, -1.492199, 2.550973, 1, 1, 1, 1, 1,
1.163427, -0.2166493, 1.130797, 1, 1, 1, 1, 1,
1.16398, -0.09905439, 1.700429, 1, 1, 1, 1, 1,
1.1803, 0.1510895, 0.8293126, 1, 1, 1, 1, 1,
1.180779, -1.51376, 2.138818, 1, 1, 1, 1, 1,
1.182894, -0.6283237, 1.022824, 0, 0, 1, 1, 1,
1.20168, -0.7354534, 1.650056, 1, 0, 0, 1, 1,
1.205088, 0.1679795, 0.1663655, 1, 0, 0, 1, 1,
1.216774, 0.4088845, 1.0592, 1, 0, 0, 1, 1,
1.222565, -0.9164499, 1.093895, 1, 0, 0, 1, 1,
1.226045, -0.2947014, 2.503723, 1, 0, 0, 1, 1,
1.234352, -0.2437773, 1.048539, 0, 0, 0, 1, 1,
1.245604, 0.6618341, 3.008689, 0, 0, 0, 1, 1,
1.246027, 0.726916, 1.654942, 0, 0, 0, 1, 1,
1.252549, -0.6819005, 1.959672, 0, 0, 0, 1, 1,
1.254639, 1.600938, 0.06331331, 0, 0, 0, 1, 1,
1.274991, 1.391413, 1.549729, 0, 0, 0, 1, 1,
1.277228, 1.137738, 1.692033, 0, 0, 0, 1, 1,
1.277902, -0.2542946, 1.071962, 1, 1, 1, 1, 1,
1.280643, -0.1483922, 2.137523, 1, 1, 1, 1, 1,
1.290098, -0.3143395, 3.907081, 1, 1, 1, 1, 1,
1.290291, -0.3103838, 1.004533, 1, 1, 1, 1, 1,
1.294395, 1.028678, 0.2861201, 1, 1, 1, 1, 1,
1.305631, -0.1384586, 3.022802, 1, 1, 1, 1, 1,
1.308413, -0.2036061, 1.230575, 1, 1, 1, 1, 1,
1.313274, -0.4217021, 0.9230462, 1, 1, 1, 1, 1,
1.33174, -0.09172837, 2.728201, 1, 1, 1, 1, 1,
1.333585, -0.5096706, 3.500674, 1, 1, 1, 1, 1,
1.334399, 0.2655387, 1.861529, 1, 1, 1, 1, 1,
1.337367, -0.3035328, 0.6422241, 1, 1, 1, 1, 1,
1.33781, 0.4263878, 2.643521, 1, 1, 1, 1, 1,
1.353648, 2.249806, 1.083011, 1, 1, 1, 1, 1,
1.357705, -1.561065, 3.727139, 1, 1, 1, 1, 1,
1.357851, 0.510188, 1.770919, 0, 0, 1, 1, 1,
1.368794, -1.681573, 2.750472, 1, 0, 0, 1, 1,
1.371924, 0.3391035, 1.877602, 1, 0, 0, 1, 1,
1.371995, 0.1887883, 0.02501225, 1, 0, 0, 1, 1,
1.375308, -0.2823857, 2.401457, 1, 0, 0, 1, 1,
1.376121, -0.8912897, 0.6979635, 1, 0, 0, 1, 1,
1.382585, 1.214443, 1.919959, 0, 0, 0, 1, 1,
1.383077, 0.5584498, -0.530696, 0, 0, 0, 1, 1,
1.387858, -0.263644, 1.834717, 0, 0, 0, 1, 1,
1.389504, -0.2162945, 1.764366, 0, 0, 0, 1, 1,
1.426774, 0.3636499, 2.729774, 0, 0, 0, 1, 1,
1.431995, 1.118926, 2.015919, 0, 0, 0, 1, 1,
1.432535, -0.5379007, 1.08159, 0, 0, 0, 1, 1,
1.434568, 1.828129, 0.9544205, 1, 1, 1, 1, 1,
1.437886, 0.01172849, 3.758713, 1, 1, 1, 1, 1,
1.439019, 0.01646462, 2.094908, 1, 1, 1, 1, 1,
1.453251, 1.429252, 1.603515, 1, 1, 1, 1, 1,
1.469889, 1.074674, 0.2527163, 1, 1, 1, 1, 1,
1.476251, -0.9353505, 3.160405, 1, 1, 1, 1, 1,
1.484102, 0.9016337, 1.723676, 1, 1, 1, 1, 1,
1.511897, -0.6266386, 2.990165, 1, 1, 1, 1, 1,
1.521388, -0.6618854, 1.066317, 1, 1, 1, 1, 1,
1.529857, 0.453686, 0.6067995, 1, 1, 1, 1, 1,
1.537326, -1.656699, 1.732538, 1, 1, 1, 1, 1,
1.541356, -0.4707606, 1.25414, 1, 1, 1, 1, 1,
1.555444, 1.136356, 1.391058, 1, 1, 1, 1, 1,
1.568594, -0.4710447, 1.420289, 1, 1, 1, 1, 1,
1.585037, 1.637859, -0.0309309, 1, 1, 1, 1, 1,
1.587522, 0.2792409, 0.9834433, 0, 0, 1, 1, 1,
1.60044, -1.850145, 1.875875, 1, 0, 0, 1, 1,
1.632807, -0.7815391, 1.84886, 1, 0, 0, 1, 1,
1.644736, 1.728327, 0.1851785, 1, 0, 0, 1, 1,
1.645141, 1.061938, 0.5486811, 1, 0, 0, 1, 1,
1.656829, 0.829671, 0.4468757, 1, 0, 0, 1, 1,
1.66138, -1.435754, 1.693206, 0, 0, 0, 1, 1,
1.662239, -0.6736212, 0.5971887, 0, 0, 0, 1, 1,
1.663888, 0.4459019, 1.602423, 0, 0, 0, 1, 1,
1.702413, -1.190042, 1.278102, 0, 0, 0, 1, 1,
1.721246, -1.253829, 2.55439, 0, 0, 0, 1, 1,
1.721379, -0.3332997, 2.04369, 0, 0, 0, 1, 1,
1.723371, -0.9050192, 1.050078, 0, 0, 0, 1, 1,
1.775938, 0.3591723, 3.033791, 1, 1, 1, 1, 1,
1.793227, -1.073564, 2.014041, 1, 1, 1, 1, 1,
1.815604, 0.4760002, 0.7588624, 1, 1, 1, 1, 1,
1.822905, -0.04288889, 1.262269, 1, 1, 1, 1, 1,
1.82924, 2.171946, 2.429021, 1, 1, 1, 1, 1,
1.843252, -0.1086993, 1.433776, 1, 1, 1, 1, 1,
1.845912, -0.5197846, 0.766721, 1, 1, 1, 1, 1,
1.876035, 0.868547, 0.5001289, 1, 1, 1, 1, 1,
1.884661, 0.361923, 0.9896405, 1, 1, 1, 1, 1,
1.888461, 0.1250029, 2.118173, 1, 1, 1, 1, 1,
1.907742, -3.44776, 4.35389, 1, 1, 1, 1, 1,
1.914087, 2.561142, 0.2036341, 1, 1, 1, 1, 1,
1.919418, 0.3519286, 1.087546, 1, 1, 1, 1, 1,
1.944051, -1.648306, 0.9844486, 1, 1, 1, 1, 1,
2.062645, 0.6443847, 1.084195, 1, 1, 1, 1, 1,
2.063549, -1.0882, 2.614371, 0, 0, 1, 1, 1,
2.071391, 0.1714276, 0.568915, 1, 0, 0, 1, 1,
2.085321, -2.151622, 2.612284, 1, 0, 0, 1, 1,
2.089914, -0.1059998, 0.6383262, 1, 0, 0, 1, 1,
2.105152, 1.266214, 0.3610212, 1, 0, 0, 1, 1,
2.175498, 1.027888, 1.039303, 1, 0, 0, 1, 1,
2.21529, -1.449388, 0.4415835, 0, 0, 0, 1, 1,
2.223415, -0.7850086, 1.301616, 0, 0, 0, 1, 1,
2.226197, -0.001660868, 1.640172, 0, 0, 0, 1, 1,
2.295404, 0.387919, 2.428681, 0, 0, 0, 1, 1,
2.305963, 0.2660897, 3.162751, 0, 0, 0, 1, 1,
2.340397, 1.191321, 0.7156215, 0, 0, 0, 1, 1,
2.47509, 2.097224, 1.982218, 0, 0, 0, 1, 1,
2.565233, -0.6346731, 2.607223, 1, 1, 1, 1, 1,
2.600548, -0.4313941, 2.209529, 1, 1, 1, 1, 1,
2.799498, -1.188411, 1.997778, 1, 1, 1, 1, 1,
2.810208, -0.1300651, 2.401479, 1, 1, 1, 1, 1,
3.054081, -0.1857505, 1.18774, 1, 1, 1, 1, 1,
3.067398, -0.08875074, 0.588537, 1, 1, 1, 1, 1,
3.33032, 1.016331, 0.8493771, 1, 1, 1, 1, 1
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
var radius = 9.466194;
var distance = 33.2496;
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
mvMatrix.translate( -0.05087662, 0.1716843, -0.1100106 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.2496);
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
