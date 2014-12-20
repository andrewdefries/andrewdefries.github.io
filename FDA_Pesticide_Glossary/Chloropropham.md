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
-3.009685, 0.5004714, -0.9557398, 1, 0, 0, 1,
-2.917432, 0.3314214, -0.5967289, 1, 0.007843138, 0, 1,
-2.674819, -1.795486, -1.329217, 1, 0.01176471, 0, 1,
-2.623091, 0.3482557, -1.906874, 1, 0.01960784, 0, 1,
-2.549874, 0.962716, -1.80344, 1, 0.02352941, 0, 1,
-2.475534, -0.8400347, -1.647046, 1, 0.03137255, 0, 1,
-2.450142, 0.7369844, -2.707567, 1, 0.03529412, 0, 1,
-2.394025, -0.9280055, -1.020149, 1, 0.04313726, 0, 1,
-2.369967, 0.6954994, -1.083433, 1, 0.04705882, 0, 1,
-2.363575, 1.493296, 0.05030928, 1, 0.05490196, 0, 1,
-2.319566, 0.1336667, -0.06989065, 1, 0.05882353, 0, 1,
-2.268273, -0.6551763, -1.789677, 1, 0.06666667, 0, 1,
-2.256811, -0.2679923, -1.811769, 1, 0.07058824, 0, 1,
-2.225796, 0.4900166, -1.550097, 1, 0.07843138, 0, 1,
-2.163302, -0.01810041, -0.2525391, 1, 0.08235294, 0, 1,
-2.152626, -1.024704, -1.002529, 1, 0.09019608, 0, 1,
-2.136137, 1.628407, -0.8463498, 1, 0.09411765, 0, 1,
-2.10262, 0.6402853, -0.8515091, 1, 0.1019608, 0, 1,
-2.09201, 0.2571763, -3.116259, 1, 0.1098039, 0, 1,
-2.036703, 1.040719, -0.9457018, 1, 0.1137255, 0, 1,
-2.025856, -0.08899533, -2.880539, 1, 0.1215686, 0, 1,
-2.010736, 0.09471383, -0.1391074, 1, 0.1254902, 0, 1,
-2.010096, -1.24212, -0.7703945, 1, 0.1333333, 0, 1,
-1.997847, 0.1551735, -0.2438542, 1, 0.1372549, 0, 1,
-1.996752, 0.4902905, -1.857444, 1, 0.145098, 0, 1,
-1.945004, 1.066608, -1.289009, 1, 0.1490196, 0, 1,
-1.934544, -0.07587252, -0.8723047, 1, 0.1568628, 0, 1,
-1.933669, 0.1375734, -2.401966, 1, 0.1607843, 0, 1,
-1.931477, -0.9376703, -2.052738, 1, 0.1686275, 0, 1,
-1.918078, -0.4418832, -0.5276352, 1, 0.172549, 0, 1,
-1.906782, 1.201932, 0.6086841, 1, 0.1803922, 0, 1,
-1.902842, 1.917431, -0.8193408, 1, 0.1843137, 0, 1,
-1.882908, 1.358892, -1.198252, 1, 0.1921569, 0, 1,
-1.874378, 0.1429073, -1.426356, 1, 0.1960784, 0, 1,
-1.847664, -0.278241, -0.4910846, 1, 0.2039216, 0, 1,
-1.82237, -0.310661, -0.70568, 1, 0.2117647, 0, 1,
-1.815833, -2.406065, -1.902063, 1, 0.2156863, 0, 1,
-1.806201, -1.181189, -1.990455, 1, 0.2235294, 0, 1,
-1.780007, -0.6544116, -1.918201, 1, 0.227451, 0, 1,
-1.767122, -2.084799, -3.100512, 1, 0.2352941, 0, 1,
-1.765989, -0.2530219, -1.905005, 1, 0.2392157, 0, 1,
-1.760139, 0.4128633, -2.356508, 1, 0.2470588, 0, 1,
-1.756198, -1.151719, -1.82332, 1, 0.2509804, 0, 1,
-1.752149, -0.5436049, -1.185772, 1, 0.2588235, 0, 1,
-1.750308, -0.08784479, -2.039054, 1, 0.2627451, 0, 1,
-1.747115, -0.836212, -2.08365, 1, 0.2705882, 0, 1,
-1.744999, 1.128288, -1.088439, 1, 0.2745098, 0, 1,
-1.715537, 0.4000127, 0.6068173, 1, 0.282353, 0, 1,
-1.70576, -0.7549323, -2.028323, 1, 0.2862745, 0, 1,
-1.702881, -0.1565714, -1.178652, 1, 0.2941177, 0, 1,
-1.694692, -0.2686096, -2.39672, 1, 0.3019608, 0, 1,
-1.68364, 1.305236, 0.01453387, 1, 0.3058824, 0, 1,
-1.654238, 0.9526692, 0.06832878, 1, 0.3137255, 0, 1,
-1.637099, -0.844229, -1.995463, 1, 0.3176471, 0, 1,
-1.629453, -0.8334946, -0.8743027, 1, 0.3254902, 0, 1,
-1.596154, 0.9101391, -0.1423585, 1, 0.3294118, 0, 1,
-1.593705, -0.5644292, -0.9234436, 1, 0.3372549, 0, 1,
-1.589465, -1.435537, -3.462876, 1, 0.3411765, 0, 1,
-1.574614, 1.43753, -0.02089702, 1, 0.3490196, 0, 1,
-1.56714, -0.9040533, -1.512171, 1, 0.3529412, 0, 1,
-1.565519, 0.1771661, -1.485661, 1, 0.3607843, 0, 1,
-1.55193, 1.827673, 0.04734035, 1, 0.3647059, 0, 1,
-1.532701, 0.5632687, -2.300907, 1, 0.372549, 0, 1,
-1.527662, 1.071808, -1.408174, 1, 0.3764706, 0, 1,
-1.517593, 0.1710276, -2.687988, 1, 0.3843137, 0, 1,
-1.517466, -1.776503, -2.652586, 1, 0.3882353, 0, 1,
-1.508866, 0.1157167, -1.48131, 1, 0.3960784, 0, 1,
-1.508014, 0.7615401, -2.882548, 1, 0.4039216, 0, 1,
-1.501082, 0.2117519, 0.1295877, 1, 0.4078431, 0, 1,
-1.484753, 0.1617864, -1.996499, 1, 0.4156863, 0, 1,
-1.477865, -0.258949, -0.8020217, 1, 0.4196078, 0, 1,
-1.44875, -0.1061805, -2.956592, 1, 0.427451, 0, 1,
-1.447403, 1.619957, -1.471896, 1, 0.4313726, 0, 1,
-1.433032, 1.207323, -2.347624, 1, 0.4392157, 0, 1,
-1.432688, -0.02701995, -2.27686, 1, 0.4431373, 0, 1,
-1.426271, -0.007602728, -0.602272, 1, 0.4509804, 0, 1,
-1.426214, -0.8192493, -1.648512, 1, 0.454902, 0, 1,
-1.421141, 2.316801, -1.978602, 1, 0.4627451, 0, 1,
-1.404076, -2.20241, -2.94642, 1, 0.4666667, 0, 1,
-1.399428, -0.1629755, -1.058665, 1, 0.4745098, 0, 1,
-1.395213, -1.169292, -2.937726, 1, 0.4784314, 0, 1,
-1.384213, 1.648169, 0.8995563, 1, 0.4862745, 0, 1,
-1.375553, 0.5055394, -0.3842527, 1, 0.4901961, 0, 1,
-1.354253, 0.1840837, -0.6205305, 1, 0.4980392, 0, 1,
-1.353559, -0.3007222, -0.6655915, 1, 0.5058824, 0, 1,
-1.352625, 0.3280422, -1.452943, 1, 0.509804, 0, 1,
-1.348233, 0.324104, 0.4619883, 1, 0.5176471, 0, 1,
-1.346616, 0.6144894, -1.66507, 1, 0.5215687, 0, 1,
-1.345814, 1.049456, -3.335123, 1, 0.5294118, 0, 1,
-1.337928, -0.5269828, -1.926959, 1, 0.5333334, 0, 1,
-1.33614, 0.3974553, -1.376826, 1, 0.5411765, 0, 1,
-1.334054, -0.8567836, -0.2249151, 1, 0.5450981, 0, 1,
-1.330435, -0.851622, -4.456449, 1, 0.5529412, 0, 1,
-1.326625, 0.8215156, -0.02824749, 1, 0.5568628, 0, 1,
-1.309322, -1.47948, -1.520004, 1, 0.5647059, 0, 1,
-1.285241, 0.4490812, -0.8437601, 1, 0.5686275, 0, 1,
-1.266752, 0.6023642, -2.498293, 1, 0.5764706, 0, 1,
-1.264621, 1.287262, -0.6895791, 1, 0.5803922, 0, 1,
-1.255109, 1.240911, -0.7121968, 1, 0.5882353, 0, 1,
-1.253018, -0.4242527, -3.083637, 1, 0.5921569, 0, 1,
-1.249803, -0.1516578, -2.581259, 1, 0.6, 0, 1,
-1.244597, -1.24732, -2.508061, 1, 0.6078432, 0, 1,
-1.242993, 0.7945053, -1.206442, 1, 0.6117647, 0, 1,
-1.242717, -1.199422, -2.054944, 1, 0.6196079, 0, 1,
-1.242535, -1.049579, -2.517894, 1, 0.6235294, 0, 1,
-1.23686, 2.496259, 0.5025636, 1, 0.6313726, 0, 1,
-1.228982, 0.5734029, -1.516181, 1, 0.6352941, 0, 1,
-1.209701, -0.4839651, -1.095666, 1, 0.6431373, 0, 1,
-1.205625, 0.6999244, -1.010324, 1, 0.6470588, 0, 1,
-1.200404, -0.1509189, -0.7843149, 1, 0.654902, 0, 1,
-1.195494, -0.268966, -2.01111, 1, 0.6588235, 0, 1,
-1.192786, -1.324333, -3.657537, 1, 0.6666667, 0, 1,
-1.189835, -0.1360539, -1.185819, 1, 0.6705883, 0, 1,
-1.179176, 0.5213392, -0.8054329, 1, 0.6784314, 0, 1,
-1.158836, -0.4036783, -1.540023, 1, 0.682353, 0, 1,
-1.147224, -0.01417017, -1.800233, 1, 0.6901961, 0, 1,
-1.141265, 0.9978134, 0.03084949, 1, 0.6941177, 0, 1,
-1.137204, -0.480015, -1.550706, 1, 0.7019608, 0, 1,
-1.134907, -0.5706618, -1.306243, 1, 0.7098039, 0, 1,
-1.127593, -0.3520668, -2.802579, 1, 0.7137255, 0, 1,
-1.127333, 1.570929, -3.486478, 1, 0.7215686, 0, 1,
-1.122598, -1.880005, -3.13701, 1, 0.7254902, 0, 1,
-1.114461, -0.03928308, -1.021763, 1, 0.7333333, 0, 1,
-1.111748, -1.446134, -3.114673, 1, 0.7372549, 0, 1,
-1.108856, 1.179763, -3.651711, 1, 0.7450981, 0, 1,
-1.090996, -0.04646164, -1.76309, 1, 0.7490196, 0, 1,
-1.090571, -1.282811, -3.465838, 1, 0.7568628, 0, 1,
-1.079368, -1.100293, -2.492797, 1, 0.7607843, 0, 1,
-1.076882, 0.3631083, -1.794696, 1, 0.7686275, 0, 1,
-1.070235, 3.062741, -0.1657724, 1, 0.772549, 0, 1,
-1.063955, 2.376565, 0.2467404, 1, 0.7803922, 0, 1,
-1.059061, 0.3480369, -0.8110995, 1, 0.7843137, 0, 1,
-1.058869, -1.199327, 0.511861, 1, 0.7921569, 0, 1,
-1.057086, -0.2454553, -1.533159, 1, 0.7960784, 0, 1,
-1.055427, 0.6220789, -0.6889774, 1, 0.8039216, 0, 1,
-1.052326, 0.8747357, -0.6523584, 1, 0.8117647, 0, 1,
-1.051472, -0.765576, -4.320167, 1, 0.8156863, 0, 1,
-1.050833, 1.645619, -0.3824427, 1, 0.8235294, 0, 1,
-1.050257, -0.9299778, -1.036595, 1, 0.827451, 0, 1,
-1.040496, -0.9925597, -1.057784, 1, 0.8352941, 0, 1,
-1.027314, -1.196503, -3.191103, 1, 0.8392157, 0, 1,
-1.025249, -0.9804278, -1.409295, 1, 0.8470588, 0, 1,
-1.021922, -1.039146, -1.561941, 1, 0.8509804, 0, 1,
-1.018908, 1.281886, -1.07132, 1, 0.8588235, 0, 1,
-1.017184, 0.05518037, -0.9566235, 1, 0.8627451, 0, 1,
-1.009156, 1.436508, -0.8912328, 1, 0.8705882, 0, 1,
-1.008807, -1.676726, -2.055667, 1, 0.8745098, 0, 1,
-1.001108, -1.438659, -2.584477, 1, 0.8823529, 0, 1,
-1.000381, 1.033236, 1.468421, 1, 0.8862745, 0, 1,
-0.9998986, -2.021186, -2.658989, 1, 0.8941177, 0, 1,
-0.9986197, 1.881174, 0.02892069, 1, 0.8980392, 0, 1,
-0.9972785, 0.155327, -1.91351, 1, 0.9058824, 0, 1,
-0.9961605, -1.705216, -2.570193, 1, 0.9137255, 0, 1,
-0.9746731, -1.102401, -3.017346, 1, 0.9176471, 0, 1,
-0.9739319, 0.6042892, -0.8214156, 1, 0.9254902, 0, 1,
-0.9673683, -0.3607309, -1.596293, 1, 0.9294118, 0, 1,
-0.9594908, 0.8423348, -1.650384, 1, 0.9372549, 0, 1,
-0.9541361, -0.1165268, -2.461666, 1, 0.9411765, 0, 1,
-0.9523488, 1.058361, -1.631898, 1, 0.9490196, 0, 1,
-0.9508161, -0.06095911, -2.394292, 1, 0.9529412, 0, 1,
-0.9503155, -0.9147171, -2.614391, 1, 0.9607843, 0, 1,
-0.9486111, 1.490413, -0.1903209, 1, 0.9647059, 0, 1,
-0.9456802, -1.610842, -1.346869, 1, 0.972549, 0, 1,
-0.9418713, -0.607738, -1.437508, 1, 0.9764706, 0, 1,
-0.9398359, 0.6617411, -2.230883, 1, 0.9843137, 0, 1,
-0.9349428, 0.1226775, -0.9567724, 1, 0.9882353, 0, 1,
-0.9281777, -1.272409, -1.825055, 1, 0.9960784, 0, 1,
-0.9236006, 0.9653254, -1.219904, 0.9960784, 1, 0, 1,
-0.922534, -1.048586, -2.676301, 0.9921569, 1, 0, 1,
-0.9200124, -1.461893, -2.225127, 0.9843137, 1, 0, 1,
-0.9161707, -0.1566901, -1.797496, 0.9803922, 1, 0, 1,
-0.9115134, -1.101962, -1.855187, 0.972549, 1, 0, 1,
-0.9091311, 1.16987, -0.03795015, 0.9686275, 1, 0, 1,
-0.9090014, 0.4850042, -1.875564, 0.9607843, 1, 0, 1,
-0.9037813, 0.8687305, -1.985108, 0.9568627, 1, 0, 1,
-0.9027078, 0.1758632, -2.012548, 0.9490196, 1, 0, 1,
-0.8992224, -0.6160725, -1.848736, 0.945098, 1, 0, 1,
-0.8966407, 0.04192917, -1.259218, 0.9372549, 1, 0, 1,
-0.8943365, -1.065849, -2.249245, 0.9333333, 1, 0, 1,
-0.8889133, 0.1636035, -1.489877, 0.9254902, 1, 0, 1,
-0.8809589, -1.727781, -2.520481, 0.9215686, 1, 0, 1,
-0.878525, 0.002387832, -1.81595, 0.9137255, 1, 0, 1,
-0.8746927, -0.5096919, -3.452032, 0.9098039, 1, 0, 1,
-0.8552288, 0.3806615, -1.194384, 0.9019608, 1, 0, 1,
-0.8544966, -0.1507531, -1.351444, 0.8941177, 1, 0, 1,
-0.8544635, -1.079969, -2.875175, 0.8901961, 1, 0, 1,
-0.8544399, -0.5320501, -2.727289, 0.8823529, 1, 0, 1,
-0.8530766, -2.21848, -1.930367, 0.8784314, 1, 0, 1,
-0.8408421, 1.416487, -1.349209, 0.8705882, 1, 0, 1,
-0.8328553, 0.8287851, 0.264459, 0.8666667, 1, 0, 1,
-0.8316239, -0.7431985, -2.283279, 0.8588235, 1, 0, 1,
-0.8314205, -1.743197, -2.096719, 0.854902, 1, 0, 1,
-0.8305345, 0.08747275, -2.28075, 0.8470588, 1, 0, 1,
-0.8297883, 1.808317, 0.4114138, 0.8431373, 1, 0, 1,
-0.8290965, 0.2403915, -2.136874, 0.8352941, 1, 0, 1,
-0.8268179, -0.2714432, -3.452711, 0.8313726, 1, 0, 1,
-0.8246287, -2.336561, -2.872605, 0.8235294, 1, 0, 1,
-0.82087, 1.604666, -1.882246, 0.8196079, 1, 0, 1,
-0.8207008, -1.335519, -2.401145, 0.8117647, 1, 0, 1,
-0.8197253, 0.4532885, -3.371471, 0.8078431, 1, 0, 1,
-0.8134879, 1.369727, -1.248741, 0.8, 1, 0, 1,
-0.8071588, -0.1450824, 0.6675002, 0.7921569, 1, 0, 1,
-0.8055373, -1.432894, -2.889517, 0.7882353, 1, 0, 1,
-0.8041114, -0.2016619, -1.612927, 0.7803922, 1, 0, 1,
-0.80411, 0.6559422, -0.5911286, 0.7764706, 1, 0, 1,
-0.8029689, -0.1562949, -0.4438016, 0.7686275, 1, 0, 1,
-0.7955866, -0.283493, -1.15946, 0.7647059, 1, 0, 1,
-0.7950628, -0.05734756, -1.145751, 0.7568628, 1, 0, 1,
-0.7940267, 0.1761328, -1.203495, 0.7529412, 1, 0, 1,
-0.7845727, -0.60534, -2.084085, 0.7450981, 1, 0, 1,
-0.7826361, 1.763502, -1.607855, 0.7411765, 1, 0, 1,
-0.7814378, 0.1370394, -1.889607, 0.7333333, 1, 0, 1,
-0.7720043, -0.2586829, -4.033219, 0.7294118, 1, 0, 1,
-0.7693612, 0.7575824, -0.643915, 0.7215686, 1, 0, 1,
-0.7670753, 0.8168877, -0.7662833, 0.7176471, 1, 0, 1,
-0.7651709, -1.223017, -3.324365, 0.7098039, 1, 0, 1,
-0.7609483, 1.504704, -0.6934147, 0.7058824, 1, 0, 1,
-0.7577046, 1.038041, -1.627819, 0.6980392, 1, 0, 1,
-0.7538753, 1.258814, 0.2754686, 0.6901961, 1, 0, 1,
-0.7532485, -0.07287836, -1.102571, 0.6862745, 1, 0, 1,
-0.741825, -2.527626, -1.276023, 0.6784314, 1, 0, 1,
-0.7336852, 0.3833362, -1.676135, 0.6745098, 1, 0, 1,
-0.7292402, 0.6854151, -1.616084, 0.6666667, 1, 0, 1,
-0.7259696, 0.4326383, -2.352389, 0.6627451, 1, 0, 1,
-0.7239286, -0.1015281, -1.829917, 0.654902, 1, 0, 1,
-0.7117026, -1.17116, -1.263634, 0.6509804, 1, 0, 1,
-0.7094451, 0.08802199, -2.014977, 0.6431373, 1, 0, 1,
-0.7093586, 0.6432871, -1.650925, 0.6392157, 1, 0, 1,
-0.7057921, 0.7109848, -1.562002, 0.6313726, 1, 0, 1,
-0.7037792, -1.144629, -3.591016, 0.627451, 1, 0, 1,
-0.6985502, -0.8685929, -2.306049, 0.6196079, 1, 0, 1,
-0.6979752, -2.268554, -3.496801, 0.6156863, 1, 0, 1,
-0.696128, -2.395152, -5.067002, 0.6078432, 1, 0, 1,
-0.6949697, -1.671869, -2.613374, 0.6039216, 1, 0, 1,
-0.694789, 1.480405, 0.1610916, 0.5960785, 1, 0, 1,
-0.6880886, 0.5125779, -0.7729191, 0.5882353, 1, 0, 1,
-0.6872023, -0.5831281, -4.183194, 0.5843138, 1, 0, 1,
-0.6821674, -0.6335055, -0.8817766, 0.5764706, 1, 0, 1,
-0.6799069, -0.362428, -1.980463, 0.572549, 1, 0, 1,
-0.6798946, -0.7346049, -2.295621, 0.5647059, 1, 0, 1,
-0.6787875, 1.367367, -0.4479944, 0.5607843, 1, 0, 1,
-0.6719556, -0.6907126, -3.491486, 0.5529412, 1, 0, 1,
-0.6682245, -0.7428778, -5.244544, 0.5490196, 1, 0, 1,
-0.6612496, 1.040846, -0.5089622, 0.5411765, 1, 0, 1,
-0.6600769, 2.066768, 0.8973286, 0.5372549, 1, 0, 1,
-0.6596423, -0.77606, 0.5113305, 0.5294118, 1, 0, 1,
-0.6592631, 0.5208997, 0.5594262, 0.5254902, 1, 0, 1,
-0.6583105, 1.096077, -0.8915874, 0.5176471, 1, 0, 1,
-0.6571035, -0.4407423, -2.348013, 0.5137255, 1, 0, 1,
-0.6544431, 0.4306142, -0.2512854, 0.5058824, 1, 0, 1,
-0.6523844, 0.6837295, -1.025642, 0.5019608, 1, 0, 1,
-0.6475965, 0.004617029, -0.9195887, 0.4941176, 1, 0, 1,
-0.6471438, 0.6395838, -1.145183, 0.4862745, 1, 0, 1,
-0.6442947, -0.02407276, -2.112009, 0.4823529, 1, 0, 1,
-0.643957, 0.2458711, 0.2623034, 0.4745098, 1, 0, 1,
-0.6436671, 1.536659, -0.5897503, 0.4705882, 1, 0, 1,
-0.6353765, 0.3868212, -0.4539684, 0.4627451, 1, 0, 1,
-0.6151145, -0.9450495, -3.396089, 0.4588235, 1, 0, 1,
-0.6145387, -0.4190028, -0.3356196, 0.4509804, 1, 0, 1,
-0.6056034, -1.350262, -2.342288, 0.4470588, 1, 0, 1,
-0.6019368, -0.9676431, -1.659775, 0.4392157, 1, 0, 1,
-0.6011159, 0.8434554, -2.409833, 0.4352941, 1, 0, 1,
-0.5973163, 0.47457, -1.225351, 0.427451, 1, 0, 1,
-0.5940969, 0.5689396, -0.4540376, 0.4235294, 1, 0, 1,
-0.5916865, -0.3696536, -2.50804, 0.4156863, 1, 0, 1,
-0.5899531, -0.4800819, -2.467713, 0.4117647, 1, 0, 1,
-0.5868106, 0.6444602, 0.9448605, 0.4039216, 1, 0, 1,
-0.5852916, 1.104102, -2.162564, 0.3960784, 1, 0, 1,
-0.5754097, 0.84583, -1.061428, 0.3921569, 1, 0, 1,
-0.5737983, -1.095703, -3.160523, 0.3843137, 1, 0, 1,
-0.5718657, -0.9153289, -2.965641, 0.3803922, 1, 0, 1,
-0.569497, 0.9036762, 0.4088788, 0.372549, 1, 0, 1,
-0.5663236, -0.1337192, -0.2639349, 0.3686275, 1, 0, 1,
-0.5601709, 0.3195077, 0.3161584, 0.3607843, 1, 0, 1,
-0.5530717, 0.01850559, -2.212986, 0.3568628, 1, 0, 1,
-0.5522737, -1.514015, -3.079297, 0.3490196, 1, 0, 1,
-0.5488148, -1.905104, -1.76287, 0.345098, 1, 0, 1,
-0.5403855, 0.8683718, 0.5014876, 0.3372549, 1, 0, 1,
-0.538192, -1.153598, -2.812146, 0.3333333, 1, 0, 1,
-0.5359223, -0.7318625, -3.024506, 0.3254902, 1, 0, 1,
-0.5292233, 0.3916034, -0.0136014, 0.3215686, 1, 0, 1,
-0.529192, 0.1372845, -2.073458, 0.3137255, 1, 0, 1,
-0.5205551, -1.169555, -2.572495, 0.3098039, 1, 0, 1,
-0.5175787, -1.569759, -1.153597, 0.3019608, 1, 0, 1,
-0.5164242, -0.4484461, -2.477429, 0.2941177, 1, 0, 1,
-0.5147813, 0.8459674, 0.8422809, 0.2901961, 1, 0, 1,
-0.5144485, 1.962436, -0.8358401, 0.282353, 1, 0, 1,
-0.5135955, -0.7566415, -4.107964, 0.2784314, 1, 0, 1,
-0.5124213, -1.51548, -0.8402712, 0.2705882, 1, 0, 1,
-0.5091161, -1.021445, -3.577637, 0.2666667, 1, 0, 1,
-0.5079699, 1.24603, -0.1179017, 0.2588235, 1, 0, 1,
-0.5077447, 0.7631962, 0.6965603, 0.254902, 1, 0, 1,
-0.5071304, 0.4083129, -0.07678245, 0.2470588, 1, 0, 1,
-0.4992743, 0.5476493, -1.221065, 0.2431373, 1, 0, 1,
-0.4977, 1.4956, -0.4262907, 0.2352941, 1, 0, 1,
-0.4882737, 0.6457763, -1.432914, 0.2313726, 1, 0, 1,
-0.4875246, -3.113822, -3.453502, 0.2235294, 1, 0, 1,
-0.4871601, -1.613229, -2.419985, 0.2196078, 1, 0, 1,
-0.4826998, -0.7277358, -2.787125, 0.2117647, 1, 0, 1,
-0.4813195, -2.25499, -2.19444, 0.2078431, 1, 0, 1,
-0.4636663, -0.2387295, -2.82594, 0.2, 1, 0, 1,
-0.4562162, -2.895323, -2.470759, 0.1921569, 1, 0, 1,
-0.4527831, 0.9525642, 1.14711, 0.1882353, 1, 0, 1,
-0.4523703, 0.5673388, -1.827255, 0.1803922, 1, 0, 1,
-0.4468996, -0.07437193, -1.214418, 0.1764706, 1, 0, 1,
-0.4460864, -1.785807, -4.121592, 0.1686275, 1, 0, 1,
-0.436657, 0.100574, -1.549104, 0.1647059, 1, 0, 1,
-0.4309961, 0.2335398, -3.003003, 0.1568628, 1, 0, 1,
-0.4299202, 2.073772, -0.3273664, 0.1529412, 1, 0, 1,
-0.4264562, 1.087352, -2.523288, 0.145098, 1, 0, 1,
-0.4258654, -1.840574, -2.622705, 0.1411765, 1, 0, 1,
-0.4192133, 1.068905, 0.06861915, 0.1333333, 1, 0, 1,
-0.4085461, 0.3460965, -2.932457, 0.1294118, 1, 0, 1,
-0.4058768, 0.9401838, -2.308193, 0.1215686, 1, 0, 1,
-0.4007969, 0.5773993, 1.090263, 0.1176471, 1, 0, 1,
-0.3994848, 1.909966, -0.105138, 0.1098039, 1, 0, 1,
-0.3978533, -0.9616359, -2.475189, 0.1058824, 1, 0, 1,
-0.3937632, -1.402899, -2.717782, 0.09803922, 1, 0, 1,
-0.391127, -0.3395797, -2.951341, 0.09019608, 1, 0, 1,
-0.3900186, -1.16109, -2.218721, 0.08627451, 1, 0, 1,
-0.3872955, 1.341183, 0.07447786, 0.07843138, 1, 0, 1,
-0.3829497, -0.6950629, -2.789365, 0.07450981, 1, 0, 1,
-0.3809604, -0.6498257, -3.418205, 0.06666667, 1, 0, 1,
-0.3773932, -0.5157186, -1.324151, 0.0627451, 1, 0, 1,
-0.3755383, -1.023645, -2.595668, 0.05490196, 1, 0, 1,
-0.3733474, -2.405754, -3.513147, 0.05098039, 1, 0, 1,
-0.3723456, -0.8724989, -3.692801, 0.04313726, 1, 0, 1,
-0.3704374, -0.4731608, -3.973629, 0.03921569, 1, 0, 1,
-0.3590669, 1.572694, -1.023094, 0.03137255, 1, 0, 1,
-0.3573222, -0.1294323, -2.545944, 0.02745098, 1, 0, 1,
-0.3523698, -0.2273383, -2.600292, 0.01960784, 1, 0, 1,
-0.3513131, -0.008322547, -1.342722, 0.01568628, 1, 0, 1,
-0.3476731, 0.5910465, -0.3455164, 0.007843138, 1, 0, 1,
-0.3453192, -0.6818178, -3.619192, 0.003921569, 1, 0, 1,
-0.3447331, 1.834317, -1.698207, 0, 1, 0.003921569, 1,
-0.3445106, -1.87606, -2.502679, 0, 1, 0.01176471, 1,
-0.3436391, -0.08208217, -1.93486, 0, 1, 0.01568628, 1,
-0.3404873, -0.9248578, -1.966908, 0, 1, 0.02352941, 1,
-0.3360619, -2.083602, -3.522059, 0, 1, 0.02745098, 1,
-0.334835, -0.5925917, -2.76607, 0, 1, 0.03529412, 1,
-0.3342086, 1.476435, -0.9806601, 0, 1, 0.03921569, 1,
-0.3335074, 0.672257, -1.65598, 0, 1, 0.04705882, 1,
-0.3331983, -0.6061019, -3.882258, 0, 1, 0.05098039, 1,
-0.3306343, -0.3407415, -1.035899, 0, 1, 0.05882353, 1,
-0.3305858, -0.7797466, -1.713237, 0, 1, 0.0627451, 1,
-0.3230571, 0.2645822, -1.728778, 0, 1, 0.07058824, 1,
-0.3211539, 0.5472871, 0.7713542, 0, 1, 0.07450981, 1,
-0.3190603, -0.4222453, -2.428619, 0, 1, 0.08235294, 1,
-0.319006, 1.591571, 0.8167824, 0, 1, 0.08627451, 1,
-0.318841, -1.091678, -3.157173, 0, 1, 0.09411765, 1,
-0.3170371, 2.209574, 0.3266077, 0, 1, 0.1019608, 1,
-0.3152825, 0.6418825, 0.6090142, 0, 1, 0.1058824, 1,
-0.3136221, 0.8570585, -0.1143709, 0, 1, 0.1137255, 1,
-0.3127222, -0.06999069, -2.50491, 0, 1, 0.1176471, 1,
-0.3121298, -0.5139956, -3.132828, 0, 1, 0.1254902, 1,
-0.3101248, 0.02403426, -0.5619139, 0, 1, 0.1294118, 1,
-0.3089539, -0.9162394, -4.22689, 0, 1, 0.1372549, 1,
-0.3085045, 0.6675819, -0.6658985, 0, 1, 0.1411765, 1,
-0.2996895, 1.406724, -0.2974451, 0, 1, 0.1490196, 1,
-0.2987572, 0.9154507, -0.184182, 0, 1, 0.1529412, 1,
-0.2958236, 1.163555, -0.2477301, 0, 1, 0.1607843, 1,
-0.2952984, -0.8476105, -2.500033, 0, 1, 0.1647059, 1,
-0.2951278, 0.4521572, -0.1721028, 0, 1, 0.172549, 1,
-0.2949056, 0.2076881, -2.839575, 0, 1, 0.1764706, 1,
-0.2902953, -0.4085611, -2.948699, 0, 1, 0.1843137, 1,
-0.2839665, -1.332093, -3.318629, 0, 1, 0.1882353, 1,
-0.2826064, 2.431098, -1.332195, 0, 1, 0.1960784, 1,
-0.2801921, -0.3406789, -1.356397, 0, 1, 0.2039216, 1,
-0.2800297, 0.3692802, -0.289519, 0, 1, 0.2078431, 1,
-0.2795517, -0.1686999, -2.555762, 0, 1, 0.2156863, 1,
-0.2732643, 0.01018324, -1.757396, 0, 1, 0.2196078, 1,
-0.268699, 1.117407, 0.4391874, 0, 1, 0.227451, 1,
-0.2648882, 0.1337481, 0.01537831, 0, 1, 0.2313726, 1,
-0.2622146, -1.395888, -4.305444, 0, 1, 0.2392157, 1,
-0.2574778, 0.6398837, 0.805604, 0, 1, 0.2431373, 1,
-0.2561687, -0.7040208, -1.556908, 0, 1, 0.2509804, 1,
-0.2553904, 0.2641894, -3.002845, 0, 1, 0.254902, 1,
-0.2548571, 0.41877, -0.8558306, 0, 1, 0.2627451, 1,
-0.2529888, 1.411385, -0.1088921, 0, 1, 0.2666667, 1,
-0.2489183, 0.2370258, 0.272525, 0, 1, 0.2745098, 1,
-0.244566, 0.5806591, -0.09601741, 0, 1, 0.2784314, 1,
-0.2442236, 0.8473664, 0.508622, 0, 1, 0.2862745, 1,
-0.2436669, 1.187479, -0.2093794, 0, 1, 0.2901961, 1,
-0.2408432, -0.6384864, -2.504406, 0, 1, 0.2980392, 1,
-0.2396148, -1.929843, -3.67957, 0, 1, 0.3058824, 1,
-0.2362131, 0.9658307, -1.771817, 0, 1, 0.3098039, 1,
-0.2358969, 1.369349, -2.159275, 0, 1, 0.3176471, 1,
-0.235417, 1.372497, 1.272101, 0, 1, 0.3215686, 1,
-0.2328622, -0.27195, -2.161988, 0, 1, 0.3294118, 1,
-0.2320244, 0.0101514, -1.130404, 0, 1, 0.3333333, 1,
-0.2311605, -0.7263385, -1.100641, 0, 1, 0.3411765, 1,
-0.2292682, 0.250728, -1.286571, 0, 1, 0.345098, 1,
-0.2248889, 2.349387, -0.9568011, 0, 1, 0.3529412, 1,
-0.2170654, -2.116711, -1.415053, 0, 1, 0.3568628, 1,
-0.2158199, -0.001233191, -1.040249, 0, 1, 0.3647059, 1,
-0.2136986, -2.776433, -1.609482, 0, 1, 0.3686275, 1,
-0.2089068, 0.6619147, -0.06247836, 0, 1, 0.3764706, 1,
-0.2057145, 0.1571139, -2.628575, 0, 1, 0.3803922, 1,
-0.2036079, -0.6533839, -2.305162, 0, 1, 0.3882353, 1,
-0.2011101, 0.6655568, 0.2326213, 0, 1, 0.3921569, 1,
-0.2002425, 0.4383332, 0.6400754, 0, 1, 0.4, 1,
-0.1988057, -0.5705155, -2.522994, 0, 1, 0.4078431, 1,
-0.1969839, 0.7294174, -0.9638987, 0, 1, 0.4117647, 1,
-0.1955238, -0.2293913, -3.803627, 0, 1, 0.4196078, 1,
-0.1908226, 0.1814497, -1.01601, 0, 1, 0.4235294, 1,
-0.1889594, 0.6821386, -1.080503, 0, 1, 0.4313726, 1,
-0.1884081, -1.887411, -3.069601, 0, 1, 0.4352941, 1,
-0.1882389, -0.2271531, -2.455566, 0, 1, 0.4431373, 1,
-0.1809617, -0.2492963, -2.942335, 0, 1, 0.4470588, 1,
-0.1795914, -0.2353386, -1.535286, 0, 1, 0.454902, 1,
-0.1784463, 0.2833855, -0.7390817, 0, 1, 0.4588235, 1,
-0.1728518, 0.4787827, -0.8786126, 0, 1, 0.4666667, 1,
-0.1705721, 0.644635, 0.08562125, 0, 1, 0.4705882, 1,
-0.1684416, -0.2932774, -4.077991, 0, 1, 0.4784314, 1,
-0.165806, 0.5436034, 1.723396, 0, 1, 0.4823529, 1,
-0.1651208, -0.4333366, -1.197701, 0, 1, 0.4901961, 1,
-0.1649085, 0.2047842, -0.1075502, 0, 1, 0.4941176, 1,
-0.1631243, -1.131277, -4.70193, 0, 1, 0.5019608, 1,
-0.1623861, -0.4682964, -2.723632, 0, 1, 0.509804, 1,
-0.1620481, 0.6287323, 0.5199263, 0, 1, 0.5137255, 1,
-0.1596749, 0.4887378, -0.7573216, 0, 1, 0.5215687, 1,
-0.1591651, 0.4934755, -1.272314, 0, 1, 0.5254902, 1,
-0.1590786, -0.5029485, -0.9727901, 0, 1, 0.5333334, 1,
-0.1409945, 1.139126, 0.1748451, 0, 1, 0.5372549, 1,
-0.1377373, -0.1616231, -2.042339, 0, 1, 0.5450981, 1,
-0.1357964, 1.211389, -0.6933292, 0, 1, 0.5490196, 1,
-0.1345247, 1.559798, -0.2484285, 0, 1, 0.5568628, 1,
-0.1298117, -0.4439385, -3.98559, 0, 1, 0.5607843, 1,
-0.1285822, -0.006970733, -2.301774, 0, 1, 0.5686275, 1,
-0.1245786, 0.832658, 0.5368559, 0, 1, 0.572549, 1,
-0.1244579, 0.835107, -0.3540075, 0, 1, 0.5803922, 1,
-0.1162071, 0.553721, -1.070855, 0, 1, 0.5843138, 1,
-0.1160975, 1.079193, -0.5944825, 0, 1, 0.5921569, 1,
-0.116014, 0.8882538, 0.7284551, 0, 1, 0.5960785, 1,
-0.1125781, -0.3352935, -2.879973, 0, 1, 0.6039216, 1,
-0.1117297, 1.042352, -0.635699, 0, 1, 0.6117647, 1,
-0.1101251, -0.3999675, -3.366131, 0, 1, 0.6156863, 1,
-0.109556, -0.03294455, -1.598178, 0, 1, 0.6235294, 1,
-0.109085, 0.04950651, -0.6160676, 0, 1, 0.627451, 1,
-0.1089879, -0.1334822, -3.604459, 0, 1, 0.6352941, 1,
-0.1055092, -0.3674036, -2.242347, 0, 1, 0.6392157, 1,
-0.1027221, 0.5289041, -0.9078186, 0, 1, 0.6470588, 1,
-0.09916796, -0.1998539, -2.963666, 0, 1, 0.6509804, 1,
-0.0988948, -0.8232629, -4.595662, 0, 1, 0.6588235, 1,
-0.09868716, 0.2531059, -2.288192, 0, 1, 0.6627451, 1,
-0.09867249, -0.1109921, -2.789102, 0, 1, 0.6705883, 1,
-0.09830581, 0.5047368, 0.1069125, 0, 1, 0.6745098, 1,
-0.09776127, 0.1668904, 0.8746032, 0, 1, 0.682353, 1,
-0.09458656, 0.9114938, 1.366227, 0, 1, 0.6862745, 1,
-0.08800384, 0.2096973, 0.436198, 0, 1, 0.6941177, 1,
-0.08488388, -0.8468501, -3.079144, 0, 1, 0.7019608, 1,
-0.08144146, -1.711023, -2.796097, 0, 1, 0.7058824, 1,
-0.06868321, -1.763277, -2.389837, 0, 1, 0.7137255, 1,
-0.0663887, -0.1474094, -0.5865071, 0, 1, 0.7176471, 1,
-0.06494856, -0.7733328, -1.630416, 0, 1, 0.7254902, 1,
-0.05955942, -0.8584635, -3.628887, 0, 1, 0.7294118, 1,
-0.05916392, 0.5570831, -0.1049778, 0, 1, 0.7372549, 1,
-0.05575372, 0.5538171, -1.497625, 0, 1, 0.7411765, 1,
-0.05533394, 0.1004987, -0.007004367, 0, 1, 0.7490196, 1,
-0.05478656, 0.9554929, -1.619904, 0, 1, 0.7529412, 1,
-0.04460463, -0.8654962, -2.82022, 0, 1, 0.7607843, 1,
-0.04044682, -0.05380015, -2.147524, 0, 1, 0.7647059, 1,
-0.03730959, 1.881462, -0.2363305, 0, 1, 0.772549, 1,
-0.03620032, -0.959941, -2.816712, 0, 1, 0.7764706, 1,
-0.03240233, 2.047727, -0.7175742, 0, 1, 0.7843137, 1,
-0.03156167, 0.5751264, 0.5578288, 0, 1, 0.7882353, 1,
-0.02913618, 1.251878, -1.050027, 0, 1, 0.7960784, 1,
-0.02896573, 0.6169535, 0.7981042, 0, 1, 0.8039216, 1,
-0.02771435, 0.8462821, 0.6071592, 0, 1, 0.8078431, 1,
-0.02739042, -1.773783, -4.304625, 0, 1, 0.8156863, 1,
-0.02411598, 0.1599375, -2.19249, 0, 1, 0.8196079, 1,
-0.02344388, 1.201062, 0.3494627, 0, 1, 0.827451, 1,
-0.02312567, -0.9740697, -4.582734, 0, 1, 0.8313726, 1,
-0.02193426, 0.7691563, 0.2180587, 0, 1, 0.8392157, 1,
-0.0201712, 0.5293157, -1.122256, 0, 1, 0.8431373, 1,
-0.01923391, -0.9987605, -1.588939, 0, 1, 0.8509804, 1,
-0.01341849, 0.584618, 1.076343, 0, 1, 0.854902, 1,
-0.01227156, -1.573005, -1.466308, 0, 1, 0.8627451, 1,
-0.01180715, 0.4058101, 0.5526009, 0, 1, 0.8666667, 1,
-0.01169354, 0.142888, -0.8280421, 0, 1, 0.8745098, 1,
-0.0106759, -1.24684, -3.176982, 0, 1, 0.8784314, 1,
-0.009230032, 0.3435724, -0.1651495, 0, 1, 0.8862745, 1,
-0.006108714, 0.980907, 1.042444, 0, 1, 0.8901961, 1,
-0.005306741, -0.9580265, -1.379195, 0, 1, 0.8980392, 1,
-0.004336783, 0.5635628, 0.2830014, 0, 1, 0.9058824, 1,
0.001305254, 0.699341, -0.7064031, 0, 1, 0.9098039, 1,
0.002818064, -0.5698307, 3.382517, 0, 1, 0.9176471, 1,
0.003902163, 0.5352008, -0.3621935, 0, 1, 0.9215686, 1,
0.004980025, -0.8546187, 3.246481, 0, 1, 0.9294118, 1,
0.005377326, 0.9629811, 0.004548421, 0, 1, 0.9333333, 1,
0.007009741, -0.6640077, 1.723088, 0, 1, 0.9411765, 1,
0.009102628, -0.1078339, 3.251005, 0, 1, 0.945098, 1,
0.013637, 0.06878668, 0.7644867, 0, 1, 0.9529412, 1,
0.0151413, 0.369435, 1.06487, 0, 1, 0.9568627, 1,
0.01600174, 1.573964, 0.1569253, 0, 1, 0.9647059, 1,
0.02612233, -0.2392829, 1.704776, 0, 1, 0.9686275, 1,
0.04039266, -1.349482, 4.426482, 0, 1, 0.9764706, 1,
0.04209058, -0.2527069, 3.728964, 0, 1, 0.9803922, 1,
0.04535402, -1.62491, 3.948448, 0, 1, 0.9882353, 1,
0.04741507, -0.1704745, 3.635886, 0, 1, 0.9921569, 1,
0.04788594, 1.359917, 0.08187678, 0, 1, 1, 1,
0.04933299, 0.9842782, 1.010347, 0, 0.9921569, 1, 1,
0.05168561, -0.07279113, 2.209659, 0, 0.9882353, 1, 1,
0.05170296, -1.121055, 3.806753, 0, 0.9803922, 1, 1,
0.05993368, 1.336158, -0.4613074, 0, 0.9764706, 1, 1,
0.06123411, -0.6415538, 2.137242, 0, 0.9686275, 1, 1,
0.06246635, -0.3463172, 3.971191, 0, 0.9647059, 1, 1,
0.0661578, 0.2667038, 1.883776, 0, 0.9568627, 1, 1,
0.06721808, -0.5497101, 2.325486, 0, 0.9529412, 1, 1,
0.06725314, -0.2001591, 1.859658, 0, 0.945098, 1, 1,
0.07065595, -0.6693721, 3.332561, 0, 0.9411765, 1, 1,
0.07454845, 0.2476098, -0.3080038, 0, 0.9333333, 1, 1,
0.0758794, -1.117574, 1.967045, 0, 0.9294118, 1, 1,
0.07644614, 0.4346528, 1.492061, 0, 0.9215686, 1, 1,
0.07984126, 0.5146633, 2.234962, 0, 0.9176471, 1, 1,
0.08091965, 0.2749201, -0.1457365, 0, 0.9098039, 1, 1,
0.08175209, -0.3028122, 2.125257, 0, 0.9058824, 1, 1,
0.0842839, -2.321286, 3.588416, 0, 0.8980392, 1, 1,
0.08845579, 0.1609259, 1.301782, 0, 0.8901961, 1, 1,
0.08989835, -1.689588, 2.123452, 0, 0.8862745, 1, 1,
0.09045594, 0.4256339, 0.7703612, 0, 0.8784314, 1, 1,
0.09155812, -0.706889, 2.369716, 0, 0.8745098, 1, 1,
0.09158377, -1.943757, 2.421093, 0, 0.8666667, 1, 1,
0.09183767, -0.1194179, 2.934808, 0, 0.8627451, 1, 1,
0.0944008, -0.4951694, 2.25466, 0, 0.854902, 1, 1,
0.09672588, -0.06845335, 2.386961, 0, 0.8509804, 1, 1,
0.09957825, -0.9644779, 2.650127, 0, 0.8431373, 1, 1,
0.1005547, 0.882769, 1.396395, 0, 0.8392157, 1, 1,
0.1040624, -0.1729461, 3.398723, 0, 0.8313726, 1, 1,
0.1072396, 1.269611, 2.46043, 0, 0.827451, 1, 1,
0.1080857, 0.3475133, -1.10485, 0, 0.8196079, 1, 1,
0.1111367, 0.2214539, 1.423339, 0, 0.8156863, 1, 1,
0.1143833, -0.1198496, 2.925234, 0, 0.8078431, 1, 1,
0.1147592, 0.7131089, 0.5335286, 0, 0.8039216, 1, 1,
0.1150075, 2.287333, -0.4267382, 0, 0.7960784, 1, 1,
0.1194289, 0.7471224, 0.4959361, 0, 0.7882353, 1, 1,
0.1227205, 0.8505004, 0.3899902, 0, 0.7843137, 1, 1,
0.1231529, -0.1352915, 3.18902, 0, 0.7764706, 1, 1,
0.1244568, -0.7361097, 3.296337, 0, 0.772549, 1, 1,
0.1250515, -0.2891675, 1.513281, 0, 0.7647059, 1, 1,
0.1256322, 0.9734662, 0.1291271, 0, 0.7607843, 1, 1,
0.1279585, 0.4127801, 0.05471907, 0, 0.7529412, 1, 1,
0.1283527, 0.09981857, 0.279251, 0, 0.7490196, 1, 1,
0.1288355, 0.0933485, 1.765089, 0, 0.7411765, 1, 1,
0.1316617, -0.8123477, 2.570046, 0, 0.7372549, 1, 1,
0.1350117, 1.1264, -0.5433406, 0, 0.7294118, 1, 1,
0.1352644, -0.5032421, 3.631153, 0, 0.7254902, 1, 1,
0.1369155, -0.5268943, 2.890565, 0, 0.7176471, 1, 1,
0.1369643, -0.1515817, 3.279874, 0, 0.7137255, 1, 1,
0.1396678, 0.3866521, 1.642911, 0, 0.7058824, 1, 1,
0.1459404, 0.1732883, 1.25989, 0, 0.6980392, 1, 1,
0.1463485, 0.2282201, 0.1795761, 0, 0.6941177, 1, 1,
0.1513612, -0.7499842, 4.089036, 0, 0.6862745, 1, 1,
0.1549611, 1.66934, 1.684801, 0, 0.682353, 1, 1,
0.1569458, -1.106812, 3.45563, 0, 0.6745098, 1, 1,
0.1593525, 2.279283, -0.8261143, 0, 0.6705883, 1, 1,
0.1617147, -2.33474, 1.644145, 0, 0.6627451, 1, 1,
0.1642132, -0.4091579, 3.773681, 0, 0.6588235, 1, 1,
0.166899, 1.211567, 0.4892148, 0, 0.6509804, 1, 1,
0.1688721, -0.5192404, 3.087814, 0, 0.6470588, 1, 1,
0.1731932, -0.1645719, 2.523811, 0, 0.6392157, 1, 1,
0.1744998, -0.695105, 4.155925, 0, 0.6352941, 1, 1,
0.1755373, -0.04474901, 1.702123, 0, 0.627451, 1, 1,
0.1784736, 0.09042472, 1.528365, 0, 0.6235294, 1, 1,
0.181197, 0.9616395, 0.7228578, 0, 0.6156863, 1, 1,
0.1830425, -1.393476, 4.156195, 0, 0.6117647, 1, 1,
0.1834416, 0.503647, -0.3736552, 0, 0.6039216, 1, 1,
0.1853563, 0.5148855, 0.6249989, 0, 0.5960785, 1, 1,
0.1866913, 0.02076486, 0.7758716, 0, 0.5921569, 1, 1,
0.1916079, 0.2534089, 1.988923, 0, 0.5843138, 1, 1,
0.1971605, 1.154128, -0.4544798, 0, 0.5803922, 1, 1,
0.1996767, -0.7125592, 1.855833, 0, 0.572549, 1, 1,
0.2014075, -0.4936897, 3.9754, 0, 0.5686275, 1, 1,
0.2020111, -0.8505655, 4.469669, 0, 0.5607843, 1, 1,
0.2067451, 0.932607, 2.069715, 0, 0.5568628, 1, 1,
0.2074281, 1.900736, -0.2473901, 0, 0.5490196, 1, 1,
0.2108672, 0.9965528, 1.315917, 0, 0.5450981, 1, 1,
0.2109506, -0.03714032, 0.9398697, 0, 0.5372549, 1, 1,
0.2114513, -1.298109, 2.164716, 0, 0.5333334, 1, 1,
0.2144535, 1.883415, 1.547611, 0, 0.5254902, 1, 1,
0.2168559, 1.562373, -0.3079686, 0, 0.5215687, 1, 1,
0.2255627, 0.8796462, 0.4096604, 0, 0.5137255, 1, 1,
0.228829, -0.08242456, -0.01702453, 0, 0.509804, 1, 1,
0.2289209, -0.2916909, 2.380584, 0, 0.5019608, 1, 1,
0.2305846, -0.1229001, 2.622255, 0, 0.4941176, 1, 1,
0.2352288, 1.387806, -1.363191, 0, 0.4901961, 1, 1,
0.2409677, 0.05128812, 1.40332, 0, 0.4823529, 1, 1,
0.2420234, 1.497496, -1.661345, 0, 0.4784314, 1, 1,
0.2439902, 1.749743, 0.6191804, 0, 0.4705882, 1, 1,
0.2513516, -0.920694, 3.696399, 0, 0.4666667, 1, 1,
0.2551856, -0.3249077, 2.47378, 0, 0.4588235, 1, 1,
0.2558506, -1.414545, 2.740943, 0, 0.454902, 1, 1,
0.2575305, 1.611712, -0.05515213, 0, 0.4470588, 1, 1,
0.260251, -0.5008905, 3.612095, 0, 0.4431373, 1, 1,
0.2603272, 0.1742759, 0.07395759, 0, 0.4352941, 1, 1,
0.2744954, 0.7445733, 0.8434581, 0, 0.4313726, 1, 1,
0.2754456, 2.234416, -0.618661, 0, 0.4235294, 1, 1,
0.2786336, 0.6882204, 0.4470269, 0, 0.4196078, 1, 1,
0.2821118, 0.2581052, -0.5229583, 0, 0.4117647, 1, 1,
0.2854203, 1.333407, -0.5424899, 0, 0.4078431, 1, 1,
0.2861661, 0.07045656, 0.5792387, 0, 0.4, 1, 1,
0.2874932, 0.8509756, 1.334594, 0, 0.3921569, 1, 1,
0.2889021, -0.532075, 3.476411, 0, 0.3882353, 1, 1,
0.291103, -1.700232, 6.123968, 0, 0.3803922, 1, 1,
0.295083, 0.2463661, 2.048436, 0, 0.3764706, 1, 1,
0.2967589, -3.533526, 1.373315, 0, 0.3686275, 1, 1,
0.3024576, -0.3088544, 3.445673, 0, 0.3647059, 1, 1,
0.3037639, -1.095318, 1.632583, 0, 0.3568628, 1, 1,
0.3059627, 0.6657225, 2.013278, 0, 0.3529412, 1, 1,
0.3081599, 0.4728452, -0.7002431, 0, 0.345098, 1, 1,
0.3154841, -0.4664925, 1.03362, 0, 0.3411765, 1, 1,
0.319355, 0.4069749, 1.246849, 0, 0.3333333, 1, 1,
0.3197717, 0.3271089, 3.180997, 0, 0.3294118, 1, 1,
0.3231314, -0.03213122, 0.8157821, 0, 0.3215686, 1, 1,
0.3267331, 0.1760357, 2.22905, 0, 0.3176471, 1, 1,
0.3283432, -1.293691, 1.496219, 0, 0.3098039, 1, 1,
0.3284045, 0.4993751, 0.916889, 0, 0.3058824, 1, 1,
0.3292628, -0.4641495, 1.980605, 0, 0.2980392, 1, 1,
0.3358559, 0.7574527, -0.4991642, 0, 0.2901961, 1, 1,
0.3360424, 0.01873838, 0.4372933, 0, 0.2862745, 1, 1,
0.3388703, 0.04008281, 3.344467, 0, 0.2784314, 1, 1,
0.339751, -1.663679, 2.451421, 0, 0.2745098, 1, 1,
0.3432639, 0.7450281, -1.106753, 0, 0.2666667, 1, 1,
0.3447334, -0.8820968, 2.542453, 0, 0.2627451, 1, 1,
0.3447663, 1.342732, -0.5130145, 0, 0.254902, 1, 1,
0.3476199, 0.139061, 0.7007452, 0, 0.2509804, 1, 1,
0.3484792, 0.5594313, 2.427874, 0, 0.2431373, 1, 1,
0.3497117, 0.7941682, -0.6156805, 0, 0.2392157, 1, 1,
0.3516757, -2.996782, 2.786123, 0, 0.2313726, 1, 1,
0.3541824, -1.843417, 2.351881, 0, 0.227451, 1, 1,
0.355631, -0.8457424, 1.749643, 0, 0.2196078, 1, 1,
0.358352, -2.384846, 3.421719, 0, 0.2156863, 1, 1,
0.3737199, -0.6950688, 3.017449, 0, 0.2078431, 1, 1,
0.3751077, -1.435817, 3.98589, 0, 0.2039216, 1, 1,
0.3797007, -0.09534252, 1.556837, 0, 0.1960784, 1, 1,
0.3848011, -0.5864956, 3.226578, 0, 0.1882353, 1, 1,
0.3848315, 0.5508197, -0.08360559, 0, 0.1843137, 1, 1,
0.3897604, -1.584325, 2.715574, 0, 0.1764706, 1, 1,
0.3961025, -0.4811145, 2.077883, 0, 0.172549, 1, 1,
0.3965622, 0.3775764, -0.3987278, 0, 0.1647059, 1, 1,
0.3981318, -0.1258529, 3.034079, 0, 0.1607843, 1, 1,
0.3983322, 0.3763793, 1.822698, 0, 0.1529412, 1, 1,
0.3994868, 0.1743705, 0.4928522, 0, 0.1490196, 1, 1,
0.4013455, -0.03532835, 3.423561, 0, 0.1411765, 1, 1,
0.4017476, -1.220313, 3.777729, 0, 0.1372549, 1, 1,
0.4023354, -0.620618, 3.472835, 0, 0.1294118, 1, 1,
0.4026369, 0.2891055, 0.1321659, 0, 0.1254902, 1, 1,
0.4026986, -1.996412, 2.926873, 0, 0.1176471, 1, 1,
0.4038308, 0.3279249, 2.708189, 0, 0.1137255, 1, 1,
0.4048026, -0.5259712, 3.146903, 0, 0.1058824, 1, 1,
0.4077185, 0.8939672, 1.342482, 0, 0.09803922, 1, 1,
0.4087645, -0.5940526, 1.992912, 0, 0.09411765, 1, 1,
0.4103473, -1.915613, 3.913851, 0, 0.08627451, 1, 1,
0.411366, 0.1528869, 0.5520821, 0, 0.08235294, 1, 1,
0.4146986, 0.04213972, 1.176157, 0, 0.07450981, 1, 1,
0.419305, -1.2595, 3.913012, 0, 0.07058824, 1, 1,
0.4236491, -0.7694392, 2.303994, 0, 0.0627451, 1, 1,
0.4250186, 1.392413, 1.066966, 0, 0.05882353, 1, 1,
0.4258068, 0.8656089, 0.1894163, 0, 0.05098039, 1, 1,
0.4304314, -0.549046, 1.836606, 0, 0.04705882, 1, 1,
0.4340855, 0.03517687, 1.857951, 0, 0.03921569, 1, 1,
0.4365968, -0.7381136, 2.57597, 0, 0.03529412, 1, 1,
0.4376056, 0.1275316, 1.795366, 0, 0.02745098, 1, 1,
0.4381879, -0.04003803, 2.258569, 0, 0.02352941, 1, 1,
0.4403098, -0.3013114, 1.451648, 0, 0.01568628, 1, 1,
0.446777, 1.968396, 1.183644, 0, 0.01176471, 1, 1,
0.4523444, 0.5072999, -0.4170794, 0, 0.003921569, 1, 1,
0.4558277, -0.3948472, 2.581179, 0.003921569, 0, 1, 1,
0.45661, 0.9824937, 0.6461673, 0.007843138, 0, 1, 1,
0.4642052, -0.04662837, 1.023724, 0.01568628, 0, 1, 1,
0.4675547, 0.4994423, 1.40531, 0.01960784, 0, 1, 1,
0.4682106, 0.7936969, 1.039992, 0.02745098, 0, 1, 1,
0.4699873, 0.3282084, 0.2490987, 0.03137255, 0, 1, 1,
0.4709264, 0.6776587, 0.7065777, 0.03921569, 0, 1, 1,
0.4724595, -0.2605683, 3.185574, 0.04313726, 0, 1, 1,
0.4769014, -1.436553, 4.204715, 0.05098039, 0, 1, 1,
0.4779133, 1.6038, -0.5978973, 0.05490196, 0, 1, 1,
0.4837926, 0.01239946, 2.431976, 0.0627451, 0, 1, 1,
0.4864061, 1.508357, 0.9109651, 0.06666667, 0, 1, 1,
0.4908637, 0.1480386, 2.594785, 0.07450981, 0, 1, 1,
0.494405, -0.2500598, 1.314937, 0.07843138, 0, 1, 1,
0.4990457, -0.03390367, 2.462212, 0.08627451, 0, 1, 1,
0.5004041, 0.8154646, 1.23705, 0.09019608, 0, 1, 1,
0.500807, -0.302036, 0.2949645, 0.09803922, 0, 1, 1,
0.5018407, -0.3660604, 2.010044, 0.1058824, 0, 1, 1,
0.5054936, -0.257513, 2.624434, 0.1098039, 0, 1, 1,
0.51269, 1.749112, 1.391208, 0.1176471, 0, 1, 1,
0.5152419, 0.4933867, 1.883829, 0.1215686, 0, 1, 1,
0.5156549, 1.094015, -0.06518877, 0.1294118, 0, 1, 1,
0.516153, -0.8999927, 0.5840612, 0.1333333, 0, 1, 1,
0.5172314, -0.4606007, 2.273067, 0.1411765, 0, 1, 1,
0.5195525, -2.066537, 4.614388, 0.145098, 0, 1, 1,
0.5237944, 1.103977, 0.4216056, 0.1529412, 0, 1, 1,
0.5297775, 0.03053169, 1.482638, 0.1568628, 0, 1, 1,
0.5395622, -0.1992509, 2.099123, 0.1647059, 0, 1, 1,
0.5396777, -2.021022, 4.894774, 0.1686275, 0, 1, 1,
0.5458242, 1.010745, 0.9734924, 0.1764706, 0, 1, 1,
0.5512539, 1.489562, 1.737128, 0.1803922, 0, 1, 1,
0.5718184, -1.011046, 2.495384, 0.1882353, 0, 1, 1,
0.5752357, 0.3923988, 0.2384508, 0.1921569, 0, 1, 1,
0.5774882, -0.2900046, 2.046797, 0.2, 0, 1, 1,
0.5793956, 2.613558, -1.245416, 0.2078431, 0, 1, 1,
0.5804055, 1.405859, -1.044712, 0.2117647, 0, 1, 1,
0.5833465, 1.417672, 1.940895, 0.2196078, 0, 1, 1,
0.611133, 1.170226, 0.1514172, 0.2235294, 0, 1, 1,
0.6164864, 1.158693, -0.04596151, 0.2313726, 0, 1, 1,
0.6184075, 0.8570797, 1.668845, 0.2352941, 0, 1, 1,
0.6201682, -0.2488551, 2.08406, 0.2431373, 0, 1, 1,
0.6233308, 0.002078232, 1.16586, 0.2470588, 0, 1, 1,
0.6267753, -0.6712407, 2.34394, 0.254902, 0, 1, 1,
0.6315863, 0.9570936, 0.759401, 0.2588235, 0, 1, 1,
0.6352186, 0.7639764, -0.6727997, 0.2666667, 0, 1, 1,
0.6390998, -0.8437372, 1.954971, 0.2705882, 0, 1, 1,
0.6391709, -0.432371, 2.377572, 0.2784314, 0, 1, 1,
0.6403238, -1.382077, 3.605305, 0.282353, 0, 1, 1,
0.6411429, -1.141036, 3.849064, 0.2901961, 0, 1, 1,
0.6486856, 0.4047639, 1.251576, 0.2941177, 0, 1, 1,
0.650328, 0.1005513, 3.086096, 0.3019608, 0, 1, 1,
0.6519184, -0.2269702, 4.087628, 0.3098039, 0, 1, 1,
0.653007, 1.344833, 0.004051874, 0.3137255, 0, 1, 1,
0.6530257, -0.3522847, 1.822134, 0.3215686, 0, 1, 1,
0.6575972, 0.6242521, 1.31762, 0.3254902, 0, 1, 1,
0.6600369, -0.02117554, 2.131474, 0.3333333, 0, 1, 1,
0.6750764, -0.1538183, 2.604252, 0.3372549, 0, 1, 1,
0.6794251, 0.3402953, 1.040485, 0.345098, 0, 1, 1,
0.6865817, 1.3913, 0.8516279, 0.3490196, 0, 1, 1,
0.6869459, 1.18891, 0.2056068, 0.3568628, 0, 1, 1,
0.6893405, -1.507435, 4.779871, 0.3607843, 0, 1, 1,
0.6894572, 0.4955538, 0.8663448, 0.3686275, 0, 1, 1,
0.6907313, -0.3662574, 1.739332, 0.372549, 0, 1, 1,
0.6970696, 1.467604, -0.7108896, 0.3803922, 0, 1, 1,
0.6983092, 0.1915707, 0.6151404, 0.3843137, 0, 1, 1,
0.7009654, -0.1923338, 1.602029, 0.3921569, 0, 1, 1,
0.7022325, 1.841232, 2.3374, 0.3960784, 0, 1, 1,
0.7051949, 0.5597473, 0.3500099, 0.4039216, 0, 1, 1,
0.710652, 1.164982, 0.6763706, 0.4117647, 0, 1, 1,
0.7106785, -1.921808, 3.823637, 0.4156863, 0, 1, 1,
0.7165198, 0.6842118, -0.03033291, 0.4235294, 0, 1, 1,
0.719928, -0.6724268, 1.659435, 0.427451, 0, 1, 1,
0.7274512, -1.24133, 3.419884, 0.4352941, 0, 1, 1,
0.7318629, -0.8103629, 1.604063, 0.4392157, 0, 1, 1,
0.732786, -0.3097161, 2.799172, 0.4470588, 0, 1, 1,
0.739959, 0.1849636, 1.889754, 0.4509804, 0, 1, 1,
0.7433906, -1.507734, 3.721595, 0.4588235, 0, 1, 1,
0.7444124, -0.615793, 0.990884, 0.4627451, 0, 1, 1,
0.7447619, 0.2430032, 2.589147, 0.4705882, 0, 1, 1,
0.7534021, -0.4106441, 1.115062, 0.4745098, 0, 1, 1,
0.7556027, 0.2070785, 0.7469758, 0.4823529, 0, 1, 1,
0.7579013, 0.5339481, 0.02521124, 0.4862745, 0, 1, 1,
0.758704, 0.6149722, 1.365407, 0.4941176, 0, 1, 1,
0.7687289, -0.7909487, 2.922271, 0.5019608, 0, 1, 1,
0.7693739, -0.6169415, 2.212805, 0.5058824, 0, 1, 1,
0.7696292, 0.5198899, 1.650288, 0.5137255, 0, 1, 1,
0.7706556, -1.047542, 1.989274, 0.5176471, 0, 1, 1,
0.7735119, 1.102819, 0.09505319, 0.5254902, 0, 1, 1,
0.7780645, -1.058876, 1.10484, 0.5294118, 0, 1, 1,
0.7802653, -1.155929, 3.803526, 0.5372549, 0, 1, 1,
0.7843813, -0.8138828, 3.448358, 0.5411765, 0, 1, 1,
0.7848201, -0.07387029, 2.918037, 0.5490196, 0, 1, 1,
0.7849666, 0.2974574, 1.893809, 0.5529412, 0, 1, 1,
0.7867081, -0.602226, 2.553918, 0.5607843, 0, 1, 1,
0.7898948, 1.469681, -0.01643851, 0.5647059, 0, 1, 1,
0.7905619, -1.627457, 2.746258, 0.572549, 0, 1, 1,
0.7925346, 0.2244516, 0.5516905, 0.5764706, 0, 1, 1,
0.7945277, -0.2406931, 3.428528, 0.5843138, 0, 1, 1,
0.7957805, 1.583112, 0.4354317, 0.5882353, 0, 1, 1,
0.7980683, -1.681002, 2.998913, 0.5960785, 0, 1, 1,
0.7993872, -0.9444137, 1.997324, 0.6039216, 0, 1, 1,
0.8038748, 0.5415688, 2.176513, 0.6078432, 0, 1, 1,
0.8069854, 1.178575, 1.448454, 0.6156863, 0, 1, 1,
0.8106413, -0.004523004, 1.054676, 0.6196079, 0, 1, 1,
0.8140532, 1.477981, -0.6662477, 0.627451, 0, 1, 1,
0.8160021, 0.4060995, 0.5573919, 0.6313726, 0, 1, 1,
0.8201721, -0.6772058, 1.74326, 0.6392157, 0, 1, 1,
0.8226829, 0.06159243, 1.63359, 0.6431373, 0, 1, 1,
0.8260649, 0.1857743, 0.009730507, 0.6509804, 0, 1, 1,
0.8284031, 1.57056, 1.885753, 0.654902, 0, 1, 1,
0.8343257, -0.2334878, 2.798106, 0.6627451, 0, 1, 1,
0.8408116, -0.9789145, 1.886091, 0.6666667, 0, 1, 1,
0.8552303, 0.03123651, 0.6566033, 0.6745098, 0, 1, 1,
0.8620847, -1.521158, 4.444999, 0.6784314, 0, 1, 1,
0.8668852, -0.205398, 2.650999, 0.6862745, 0, 1, 1,
0.872359, 0.2231552, 2.680051, 0.6901961, 0, 1, 1,
0.873445, -0.2867396, 2.947686, 0.6980392, 0, 1, 1,
0.8747382, 0.4771265, 0.8484139, 0.7058824, 0, 1, 1,
0.877158, 0.4779646, 0.5792897, 0.7098039, 0, 1, 1,
0.878026, 1.796885, -0.9998419, 0.7176471, 0, 1, 1,
0.8836213, -1.703232, 4.129608, 0.7215686, 0, 1, 1,
0.8903971, -0.2335785, 2.543503, 0.7294118, 0, 1, 1,
0.8926044, 1.272129, 0.05346535, 0.7333333, 0, 1, 1,
0.8949929, -0.7673163, 1.482579, 0.7411765, 0, 1, 1,
0.8954947, 0.2337618, 1.087615, 0.7450981, 0, 1, 1,
0.89652, 2.042348, 1.738076, 0.7529412, 0, 1, 1,
0.8996832, 1.126323, 0.7934386, 0.7568628, 0, 1, 1,
0.8999146, -1.042585, -0.05987889, 0.7647059, 0, 1, 1,
0.9004971, 0.4688734, 1.904382, 0.7686275, 0, 1, 1,
0.9006848, -2.521819, 2.077777, 0.7764706, 0, 1, 1,
0.9055909, 0.2985032, 1.137767, 0.7803922, 0, 1, 1,
0.9066662, -1.124333, 1.566985, 0.7882353, 0, 1, 1,
0.9067899, 0.03244224, -0.6706769, 0.7921569, 0, 1, 1,
0.9105082, -1.199242, 1.276045, 0.8, 0, 1, 1,
0.9125884, 1.638618, 0.6390755, 0.8078431, 0, 1, 1,
0.9139608, 1.414481, 1.276157, 0.8117647, 0, 1, 1,
0.9158614, 0.4285115, 1.087067, 0.8196079, 0, 1, 1,
0.9161016, -0.7476243, 2.588604, 0.8235294, 0, 1, 1,
0.9238945, 0.3187023, 1.689509, 0.8313726, 0, 1, 1,
0.9299278, -0.2215546, 2.946615, 0.8352941, 0, 1, 1,
0.9337583, -0.5581365, 1.778129, 0.8431373, 0, 1, 1,
0.9450979, 0.6173917, 2.15686, 0.8470588, 0, 1, 1,
0.9451292, 0.3899193, -0.1333473, 0.854902, 0, 1, 1,
0.9475772, 0.9782559, 0.2413406, 0.8588235, 0, 1, 1,
0.9481938, -0.4611349, 1.720635, 0.8666667, 0, 1, 1,
0.9524035, 0.09544226, 1.712346, 0.8705882, 0, 1, 1,
0.9553296, 1.880846, 2.562329, 0.8784314, 0, 1, 1,
0.9570891, -0.5978441, 1.407786, 0.8823529, 0, 1, 1,
0.9640107, 0.9325759, 0.3059534, 0.8901961, 0, 1, 1,
0.9728111, -0.6686226, 1.311761, 0.8941177, 0, 1, 1,
0.9744097, -1.016978, 2.322248, 0.9019608, 0, 1, 1,
0.9744269, 1.935791, -0.6899577, 0.9098039, 0, 1, 1,
0.9748031, 0.5406392, 0.3307096, 0.9137255, 0, 1, 1,
0.9771984, -0.8264905, 3.285812, 0.9215686, 0, 1, 1,
0.9823703, -0.5927188, 2.173668, 0.9254902, 0, 1, 1,
0.9838403, -1.657468, 4.958331, 0.9333333, 0, 1, 1,
0.9920976, 1.185819, 0.03553737, 0.9372549, 0, 1, 1,
0.995394, -1.628816, 1.86187, 0.945098, 0, 1, 1,
0.9961751, -0.2135725, 2.651229, 0.9490196, 0, 1, 1,
1.007247, 1.076849, 2.946197, 0.9568627, 0, 1, 1,
1.008685, -0.609485, 1.214677, 0.9607843, 0, 1, 1,
1.014238, -0.464292, 0.8431524, 0.9686275, 0, 1, 1,
1.018792, 1.324004, -0.5014463, 0.972549, 0, 1, 1,
1.020733, 0.4802617, 0.02499712, 0.9803922, 0, 1, 1,
1.022878, 0.9971703, 1.022734, 0.9843137, 0, 1, 1,
1.023125, 0.6696988, 1.610607, 0.9921569, 0, 1, 1,
1.023337, 1.189369, -0.3030526, 0.9960784, 0, 1, 1,
1.023691, -0.9601332, 1.803381, 1, 0, 0.9960784, 1,
1.034332, 0.5110723, -0.05933626, 1, 0, 0.9882353, 1,
1.043545, -0.1364176, 1.359034, 1, 0, 0.9843137, 1,
1.044647, 0.515379, 0.6215919, 1, 0, 0.9764706, 1,
1.063575, -0.6287345, 1.858195, 1, 0, 0.972549, 1,
1.073109, -0.140999, 1.524287, 1, 0, 0.9647059, 1,
1.074354, -0.3973186, 3.009169, 1, 0, 0.9607843, 1,
1.074976, -1.049761, 4.115361, 1, 0, 0.9529412, 1,
1.076015, -0.9549496, 2.172704, 1, 0, 0.9490196, 1,
1.076271, -0.2829515, 2.763601, 1, 0, 0.9411765, 1,
1.087543, -0.2201396, 2.739064, 1, 0, 0.9372549, 1,
1.088354, -1.070356, 2.193395, 1, 0, 0.9294118, 1,
1.089028, -0.3349791, -0.3688907, 1, 0, 0.9254902, 1,
1.092859, 1.23525, 1.526732, 1, 0, 0.9176471, 1,
1.096486, 0.7968783, 1.386725, 1, 0, 0.9137255, 1,
1.098642, 1.052229, 1.675423, 1, 0, 0.9058824, 1,
1.103612, 0.3578738, -0.5070801, 1, 0, 0.9019608, 1,
1.105455, 0.9499977, 1.286755, 1, 0, 0.8941177, 1,
1.115007, 1.142235, 2.366062, 1, 0, 0.8862745, 1,
1.116379, -0.6089412, 1.34935, 1, 0, 0.8823529, 1,
1.119477, -3.790392, 3.952981, 1, 0, 0.8745098, 1,
1.122264, 0.5556401, 0.7070555, 1, 0, 0.8705882, 1,
1.124011, 0.4260676, 1.495177, 1, 0, 0.8627451, 1,
1.129995, -2.451418, 2.426819, 1, 0, 0.8588235, 1,
1.13035, -1.908538, 2.332721, 1, 0, 0.8509804, 1,
1.131179, -0.9001265, 2.331768, 1, 0, 0.8470588, 1,
1.133006, -0.3174218, 2.115026, 1, 0, 0.8392157, 1,
1.134724, 2.751395, -0.1110445, 1, 0, 0.8352941, 1,
1.138154, -0.3905759, 2.275638, 1, 0, 0.827451, 1,
1.162553, -0.512246, 3.761478, 1, 0, 0.8235294, 1,
1.164215, 0.3544573, 1.521311, 1, 0, 0.8156863, 1,
1.171444, -1.33847, 1.154504, 1, 0, 0.8117647, 1,
1.173001, -1.393915, 4.966588, 1, 0, 0.8039216, 1,
1.174622, 0.1266443, 3.314709, 1, 0, 0.7960784, 1,
1.183322, 0.8035294, 0.6115439, 1, 0, 0.7921569, 1,
1.18683, -0.3002586, 0.6376467, 1, 0, 0.7843137, 1,
1.188211, 0.3742368, -0.6587151, 1, 0, 0.7803922, 1,
1.196597, 0.1585597, 2.723441, 1, 0, 0.772549, 1,
1.197757, 1.396529, 0.2225113, 1, 0, 0.7686275, 1,
1.198571, 1.177743, -0.5077988, 1, 0, 0.7607843, 1,
1.199334, 0.7276342, 4.648855, 1, 0, 0.7568628, 1,
1.211592, -1.500386, 2.440494, 1, 0, 0.7490196, 1,
1.220386, 1.008802, -0.1999641, 1, 0, 0.7450981, 1,
1.221182, 0.6942714, 0.7257139, 1, 0, 0.7372549, 1,
1.224258, 0.2838439, 0.9498667, 1, 0, 0.7333333, 1,
1.228004, 0.8093855, 1.314984, 1, 0, 0.7254902, 1,
1.232415, -1.219579, 1.583758, 1, 0, 0.7215686, 1,
1.243952, -2.506472, 3.224754, 1, 0, 0.7137255, 1,
1.247241, -0.7747952, 0.4848581, 1, 0, 0.7098039, 1,
1.254776, 1.57962, 1.0673, 1, 0, 0.7019608, 1,
1.258713, -1.242127, 4.377209, 1, 0, 0.6941177, 1,
1.26456, -0.403336, 1.928139, 1, 0, 0.6901961, 1,
1.267135, 1.129438, -1.569222, 1, 0, 0.682353, 1,
1.27132, -0.6056338, 2.498225, 1, 0, 0.6784314, 1,
1.28022, -1.005794, -0.9848719, 1, 0, 0.6705883, 1,
1.281438, -0.6417105, 0.5334575, 1, 0, 0.6666667, 1,
1.282289, -1.181523, 2.731144, 1, 0, 0.6588235, 1,
1.316808, 0.8912806, 1.203935, 1, 0, 0.654902, 1,
1.320174, 1.894741, 1.322042, 1, 0, 0.6470588, 1,
1.327102, -0.3783517, 1.198626, 1, 0, 0.6431373, 1,
1.328706, 0.6455488, 2.816138, 1, 0, 0.6352941, 1,
1.332132, 2.208488, 0.5545947, 1, 0, 0.6313726, 1,
1.334634, 0.06188802, 1.088086, 1, 0, 0.6235294, 1,
1.335268, 0.09565715, 1.378925, 1, 0, 0.6196079, 1,
1.345037, 2.596368, 0.6775324, 1, 0, 0.6117647, 1,
1.348055, -0.537845, 1.744531, 1, 0, 0.6078432, 1,
1.348264, 1.849327, 0.6221288, 1, 0, 0.6, 1,
1.352044, 0.4891266, 1.167502, 1, 0, 0.5921569, 1,
1.352767, 0.4983436, 1.947748, 1, 0, 0.5882353, 1,
1.355716, 0.7009833, 0.2619668, 1, 0, 0.5803922, 1,
1.35799, -0.2595446, 2.553004, 1, 0, 0.5764706, 1,
1.36073, -2.056847, 3.430798, 1, 0, 0.5686275, 1,
1.362095, 0.03712232, 2.000739, 1, 0, 0.5647059, 1,
1.371327, -0.1693621, 2.255566, 1, 0, 0.5568628, 1,
1.37656, -0.131473, 0.8711699, 1, 0, 0.5529412, 1,
1.377165, 0.4377019, 1.022956, 1, 0, 0.5450981, 1,
1.383201, 1.270336, 0.7725052, 1, 0, 0.5411765, 1,
1.38379, 1.218406, 1.54968, 1, 0, 0.5333334, 1,
1.384018, -1.809997, 2.604778, 1, 0, 0.5294118, 1,
1.386559, -0.4366989, 2.018132, 1, 0, 0.5215687, 1,
1.395468, -1.521066, 1.777383, 1, 0, 0.5176471, 1,
1.40357, -1.149482, 3.434878, 1, 0, 0.509804, 1,
1.413436, 0.3666151, 1.051738, 1, 0, 0.5058824, 1,
1.41819, 0.1648879, 1.972242, 1, 0, 0.4980392, 1,
1.425003, -0.4868183, 2.288741, 1, 0, 0.4901961, 1,
1.441929, -0.206147, 1.641276, 1, 0, 0.4862745, 1,
1.443933, -0.1438077, 1.69365, 1, 0, 0.4784314, 1,
1.455628, 0.2162036, 0.8499852, 1, 0, 0.4745098, 1,
1.483497, 0.0004252589, 2.224567, 1, 0, 0.4666667, 1,
1.484064, -1.29791, 2.574433, 1, 0, 0.4627451, 1,
1.488963, -0.5417601, -0.9294183, 1, 0, 0.454902, 1,
1.489861, -1.937035, 3.910417, 1, 0, 0.4509804, 1,
1.508734, -0.2789414, 0.9224514, 1, 0, 0.4431373, 1,
1.50889, 1.035766, 1.331074, 1, 0, 0.4392157, 1,
1.518956, 1.611568, 2.283003, 1, 0, 0.4313726, 1,
1.534081, 2.099084, 0.4913649, 1, 0, 0.427451, 1,
1.534103, 2.311155, 0.1670983, 1, 0, 0.4196078, 1,
1.562481, -0.344438, 3.110802, 1, 0, 0.4156863, 1,
1.568475, -1.459855, 2.985513, 1, 0, 0.4078431, 1,
1.571539, 1.054051, 0.8681881, 1, 0, 0.4039216, 1,
1.577025, 1.330605, 1.286699, 1, 0, 0.3960784, 1,
1.590447, 0.1114273, 3.355712, 1, 0, 0.3882353, 1,
1.59473, 0.7634864, 1.956784, 1, 0, 0.3843137, 1,
1.594952, 0.7275674, -0.132517, 1, 0, 0.3764706, 1,
1.595029, 2.241589, -0.5206622, 1, 0, 0.372549, 1,
1.595158, -0.4629221, 1.791321, 1, 0, 0.3647059, 1,
1.600784, -0.9644152, 3.819262, 1, 0, 0.3607843, 1,
1.614424, -0.2315575, 1.255313, 1, 0, 0.3529412, 1,
1.622896, -0.1681513, 0.9395896, 1, 0, 0.3490196, 1,
1.624614, 0.3676015, 0.632773, 1, 0, 0.3411765, 1,
1.631248, 0.9210072, 1.348451, 1, 0, 0.3372549, 1,
1.650687, -0.2755403, 2.395018, 1, 0, 0.3294118, 1,
1.654016, -1.164569, 4.014451, 1, 0, 0.3254902, 1,
1.654501, -0.04907241, 1.92579, 1, 0, 0.3176471, 1,
1.663052, 0.8508369, 2.097177, 1, 0, 0.3137255, 1,
1.676984, 1.760879, 1.381997, 1, 0, 0.3058824, 1,
1.681037, -0.1644661, 3.578573, 1, 0, 0.2980392, 1,
1.6826, 1.320315, -1.285745, 1, 0, 0.2941177, 1,
1.716029, -0.6058435, 1.556221, 1, 0, 0.2862745, 1,
1.721133, 0.2360798, 0.6145396, 1, 0, 0.282353, 1,
1.726765, 0.6621258, 1.332624, 1, 0, 0.2745098, 1,
1.727678, -0.1851467, 2.346262, 1, 0, 0.2705882, 1,
1.736424, 0.1639853, 3.037329, 1, 0, 0.2627451, 1,
1.738174, 0.1983775, 1.332698, 1, 0, 0.2588235, 1,
1.748322, -0.134396, 0.9936194, 1, 0, 0.2509804, 1,
1.752183, -0.822203, 0.7345904, 1, 0, 0.2470588, 1,
1.764534, -0.464075, 2.580836, 1, 0, 0.2392157, 1,
1.787456, 0.1881732, 2.864993, 1, 0, 0.2352941, 1,
1.791767, 0.7213752, 1.080891, 1, 0, 0.227451, 1,
1.81649, -1.289441, 2.640216, 1, 0, 0.2235294, 1,
1.823346, 0.3403787, 1.736131, 1, 0, 0.2156863, 1,
1.836981, 0.04945965, 1.623951, 1, 0, 0.2117647, 1,
1.849641, -1.220194, 3.510406, 1, 0, 0.2039216, 1,
1.880219, 1.495354, 0.6189948, 1, 0, 0.1960784, 1,
1.881218, -0.8802857, 2.784327, 1, 0, 0.1921569, 1,
1.903529, -0.8959542, 4.054623, 1, 0, 0.1843137, 1,
1.907345, -2.122025, 3.960279, 1, 0, 0.1803922, 1,
1.909269, -0.8009909, 2.461525, 1, 0, 0.172549, 1,
1.909963, -1.166514, 2.1451, 1, 0, 0.1686275, 1,
1.912006, 0.9205742, -0.1313908, 1, 0, 0.1607843, 1,
1.939488, -1.117602, 4.164378, 1, 0, 0.1568628, 1,
1.976762, -0.4113988, 2.7643, 1, 0, 0.1490196, 1,
1.990532, 1.037179, 0.03016034, 1, 0, 0.145098, 1,
1.995807, 0.367211, 3.083357, 1, 0, 0.1372549, 1,
2.029884, -0.2176699, 1.454312, 1, 0, 0.1333333, 1,
2.136666, 0.5076488, -0.9662712, 1, 0, 0.1254902, 1,
2.137504, 1.817113, 0.5727171, 1, 0, 0.1215686, 1,
2.147925, 0.4421276, 1.506768, 1, 0, 0.1137255, 1,
2.239379, 0.03250228, 1.660224, 1, 0, 0.1098039, 1,
2.240899, 1.35168, 3.652099, 1, 0, 0.1019608, 1,
2.25399, 0.155618, 1.3689, 1, 0, 0.09411765, 1,
2.276337, 0.3705514, 0.7555236, 1, 0, 0.09019608, 1,
2.285577, 0.8465372, 1.87722, 1, 0, 0.08235294, 1,
2.317385, 1.174508, 1.184344, 1, 0, 0.07843138, 1,
2.405884, 0.9723638, 1.265999, 1, 0, 0.07058824, 1,
2.4171, -0.2111437, 1.276249, 1, 0, 0.06666667, 1,
2.431167, -0.9479732, 1.6557, 1, 0, 0.05882353, 1,
2.51778, 0.9848343, 0.6065651, 1, 0, 0.05490196, 1,
2.551248, -1.115328, 2.324748, 1, 0, 0.04705882, 1,
2.623991, 0.0359848, 0.4770353, 1, 0, 0.04313726, 1,
2.63122, -0.2563621, 1.891464, 1, 0, 0.03529412, 1,
2.730905, 0.2590915, 2.289954, 1, 0, 0.03137255, 1,
2.781285, -1.14838, 1.722406, 1, 0, 0.02352941, 1,
2.833428, -0.2937329, 2.724865, 1, 0, 0.01960784, 1,
3.160964, -0.3510328, 3.866014, 1, 0, 0.01176471, 1,
3.165089, 0.9475409, 0.7168114, 1, 0, 0.007843138, 1
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
0.07770228, -4.951998, -7.171506, 0, -0.5, 0.5, 0.5,
0.07770228, -4.951998, -7.171506, 1, -0.5, 0.5, 0.5,
0.07770228, -4.951998, -7.171506, 1, 1.5, 0.5, 0.5,
0.07770228, -4.951998, -7.171506, 0, 1.5, 0.5, 0.5
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
-4.056309, -0.3638253, -7.171506, 0, -0.5, 0.5, 0.5,
-4.056309, -0.3638253, -7.171506, 1, -0.5, 0.5, 0.5,
-4.056309, -0.3638253, -7.171506, 1, 1.5, 0.5, 0.5,
-4.056309, -0.3638253, -7.171506, 0, 1.5, 0.5, 0.5
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
-4.056309, -4.951998, 0.4397123, 0, -0.5, 0.5, 0.5,
-4.056309, -4.951998, 0.4397123, 1, -0.5, 0.5, 0.5,
-4.056309, -4.951998, 0.4397123, 1, 1.5, 0.5, 0.5,
-4.056309, -4.951998, 0.4397123, 0, 1.5, 0.5, 0.5
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
-3, -3.893189, -5.415071,
3, -3.893189, -5.415071,
-3, -3.893189, -5.415071,
-3, -4.069657, -5.70781,
-2, -3.893189, -5.415071,
-2, -4.069657, -5.70781,
-1, -3.893189, -5.415071,
-1, -4.069657, -5.70781,
0, -3.893189, -5.415071,
0, -4.069657, -5.70781,
1, -3.893189, -5.415071,
1, -4.069657, -5.70781,
2, -3.893189, -5.415071,
2, -4.069657, -5.70781,
3, -3.893189, -5.415071,
3, -4.069657, -5.70781
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
-3, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
-3, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
-3, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
-3, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
-2, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
-2, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
-2, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
-2, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
-1, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
-1, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
-1, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
-1, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
0, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
0, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
0, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
0, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
1, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
1, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
1, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
1, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
2, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
2, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
2, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
2, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5,
3, -4.422594, -6.293289, 0, -0.5, 0.5, 0.5,
3, -4.422594, -6.293289, 1, -0.5, 0.5, 0.5,
3, -4.422594, -6.293289, 1, 1.5, 0.5, 0.5,
3, -4.422594, -6.293289, 0, 1.5, 0.5, 0.5
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
-3.102306, -3, -5.415071,
-3.102306, 3, -5.415071,
-3.102306, -3, -5.415071,
-3.261307, -3, -5.70781,
-3.102306, -2, -5.415071,
-3.261307, -2, -5.70781,
-3.102306, -1, -5.415071,
-3.261307, -1, -5.70781,
-3.102306, 0, -5.415071,
-3.261307, 0, -5.70781,
-3.102306, 1, -5.415071,
-3.261307, 1, -5.70781,
-3.102306, 2, -5.415071,
-3.261307, 2, -5.70781,
-3.102306, 3, -5.415071,
-3.261307, 3, -5.70781
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
-3.579307, -3, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, -3, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, -3, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, -3, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, -2, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, -2, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, -2, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, -2, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, -1, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, -1, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, -1, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, -1, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, 0, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, 0, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, 0, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, 0, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, 1, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, 1, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, 1, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, 1, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, 2, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, 2, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, 2, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, 2, -6.293289, 0, 1.5, 0.5, 0.5,
-3.579307, 3, -6.293289, 0, -0.5, 0.5, 0.5,
-3.579307, 3, -6.293289, 1, -0.5, 0.5, 0.5,
-3.579307, 3, -6.293289, 1, 1.5, 0.5, 0.5,
-3.579307, 3, -6.293289, 0, 1.5, 0.5, 0.5
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
-3.102306, -3.893189, -4,
-3.102306, -3.893189, 6,
-3.102306, -3.893189, -4,
-3.261307, -4.069657, -4,
-3.102306, -3.893189, -2,
-3.261307, -4.069657, -2,
-3.102306, -3.893189, 0,
-3.261307, -4.069657, 0,
-3.102306, -3.893189, 2,
-3.261307, -4.069657, 2,
-3.102306, -3.893189, 4,
-3.261307, -4.069657, 4,
-3.102306, -3.893189, 6,
-3.261307, -4.069657, 6
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
-3.579307, -4.422594, -4, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, -4, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, -4, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, -4, 0, 1.5, 0.5, 0.5,
-3.579307, -4.422594, -2, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, -2, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, -2, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, -2, 0, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 0, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 0, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 0, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 0, 0, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 2, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 2, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 2, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 2, 0, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 4, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 4, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 4, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 4, 0, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 6, 0, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 6, 1, -0.5, 0.5, 0.5,
-3.579307, -4.422594, 6, 1, 1.5, 0.5, 0.5,
-3.579307, -4.422594, 6, 0, 1.5, 0.5, 0.5
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
-3.102306, -3.893189, -5.415071,
-3.102306, 3.165538, -5.415071,
-3.102306, -3.893189, 6.294496,
-3.102306, 3.165538, 6.294496,
-3.102306, -3.893189, -5.415071,
-3.102306, -3.893189, 6.294496,
-3.102306, 3.165538, -5.415071,
-3.102306, 3.165538, 6.294496,
-3.102306, -3.893189, -5.415071,
3.257711, -3.893189, -5.415071,
-3.102306, -3.893189, 6.294496,
3.257711, -3.893189, 6.294496,
-3.102306, 3.165538, -5.415071,
3.257711, 3.165538, -5.415071,
-3.102306, 3.165538, 6.294496,
3.257711, 3.165538, 6.294496,
3.257711, -3.893189, -5.415071,
3.257711, 3.165538, -5.415071,
3.257711, -3.893189, 6.294496,
3.257711, 3.165538, 6.294496,
3.257711, -3.893189, -5.415071,
3.257711, -3.893189, 6.294496,
3.257711, 3.165538, -5.415071,
3.257711, 3.165538, 6.294496
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
var radius = 8.052126;
var distance = 35.82482;
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
mvMatrix.translate( -0.07770228, 0.3638253, -0.4397123 );
mvMatrix.scale( 1.368883, 1.233383, 0.7435046 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.82482);
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
Chloropropham<-read.table("Chloropropham.xyz")
```

```
## Error in read.table("Chloropropham.xyz"): no lines available in input
```

```r
x<-Chloropropham$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chloropropham' not found
```

```r
y<-Chloropropham$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chloropropham' not found
```

```r
z<-Chloropropham$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chloropropham' not found
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
-3.009685, 0.5004714, -0.9557398, 0, 0, 1, 1, 1,
-2.917432, 0.3314214, -0.5967289, 1, 0, 0, 1, 1,
-2.674819, -1.795486, -1.329217, 1, 0, 0, 1, 1,
-2.623091, 0.3482557, -1.906874, 1, 0, 0, 1, 1,
-2.549874, 0.962716, -1.80344, 1, 0, 0, 1, 1,
-2.475534, -0.8400347, -1.647046, 1, 0, 0, 1, 1,
-2.450142, 0.7369844, -2.707567, 0, 0, 0, 1, 1,
-2.394025, -0.9280055, -1.020149, 0, 0, 0, 1, 1,
-2.369967, 0.6954994, -1.083433, 0, 0, 0, 1, 1,
-2.363575, 1.493296, 0.05030928, 0, 0, 0, 1, 1,
-2.319566, 0.1336667, -0.06989065, 0, 0, 0, 1, 1,
-2.268273, -0.6551763, -1.789677, 0, 0, 0, 1, 1,
-2.256811, -0.2679923, -1.811769, 0, 0, 0, 1, 1,
-2.225796, 0.4900166, -1.550097, 1, 1, 1, 1, 1,
-2.163302, -0.01810041, -0.2525391, 1, 1, 1, 1, 1,
-2.152626, -1.024704, -1.002529, 1, 1, 1, 1, 1,
-2.136137, 1.628407, -0.8463498, 1, 1, 1, 1, 1,
-2.10262, 0.6402853, -0.8515091, 1, 1, 1, 1, 1,
-2.09201, 0.2571763, -3.116259, 1, 1, 1, 1, 1,
-2.036703, 1.040719, -0.9457018, 1, 1, 1, 1, 1,
-2.025856, -0.08899533, -2.880539, 1, 1, 1, 1, 1,
-2.010736, 0.09471383, -0.1391074, 1, 1, 1, 1, 1,
-2.010096, -1.24212, -0.7703945, 1, 1, 1, 1, 1,
-1.997847, 0.1551735, -0.2438542, 1, 1, 1, 1, 1,
-1.996752, 0.4902905, -1.857444, 1, 1, 1, 1, 1,
-1.945004, 1.066608, -1.289009, 1, 1, 1, 1, 1,
-1.934544, -0.07587252, -0.8723047, 1, 1, 1, 1, 1,
-1.933669, 0.1375734, -2.401966, 1, 1, 1, 1, 1,
-1.931477, -0.9376703, -2.052738, 0, 0, 1, 1, 1,
-1.918078, -0.4418832, -0.5276352, 1, 0, 0, 1, 1,
-1.906782, 1.201932, 0.6086841, 1, 0, 0, 1, 1,
-1.902842, 1.917431, -0.8193408, 1, 0, 0, 1, 1,
-1.882908, 1.358892, -1.198252, 1, 0, 0, 1, 1,
-1.874378, 0.1429073, -1.426356, 1, 0, 0, 1, 1,
-1.847664, -0.278241, -0.4910846, 0, 0, 0, 1, 1,
-1.82237, -0.310661, -0.70568, 0, 0, 0, 1, 1,
-1.815833, -2.406065, -1.902063, 0, 0, 0, 1, 1,
-1.806201, -1.181189, -1.990455, 0, 0, 0, 1, 1,
-1.780007, -0.6544116, -1.918201, 0, 0, 0, 1, 1,
-1.767122, -2.084799, -3.100512, 0, 0, 0, 1, 1,
-1.765989, -0.2530219, -1.905005, 0, 0, 0, 1, 1,
-1.760139, 0.4128633, -2.356508, 1, 1, 1, 1, 1,
-1.756198, -1.151719, -1.82332, 1, 1, 1, 1, 1,
-1.752149, -0.5436049, -1.185772, 1, 1, 1, 1, 1,
-1.750308, -0.08784479, -2.039054, 1, 1, 1, 1, 1,
-1.747115, -0.836212, -2.08365, 1, 1, 1, 1, 1,
-1.744999, 1.128288, -1.088439, 1, 1, 1, 1, 1,
-1.715537, 0.4000127, 0.6068173, 1, 1, 1, 1, 1,
-1.70576, -0.7549323, -2.028323, 1, 1, 1, 1, 1,
-1.702881, -0.1565714, -1.178652, 1, 1, 1, 1, 1,
-1.694692, -0.2686096, -2.39672, 1, 1, 1, 1, 1,
-1.68364, 1.305236, 0.01453387, 1, 1, 1, 1, 1,
-1.654238, 0.9526692, 0.06832878, 1, 1, 1, 1, 1,
-1.637099, -0.844229, -1.995463, 1, 1, 1, 1, 1,
-1.629453, -0.8334946, -0.8743027, 1, 1, 1, 1, 1,
-1.596154, 0.9101391, -0.1423585, 1, 1, 1, 1, 1,
-1.593705, -0.5644292, -0.9234436, 0, 0, 1, 1, 1,
-1.589465, -1.435537, -3.462876, 1, 0, 0, 1, 1,
-1.574614, 1.43753, -0.02089702, 1, 0, 0, 1, 1,
-1.56714, -0.9040533, -1.512171, 1, 0, 0, 1, 1,
-1.565519, 0.1771661, -1.485661, 1, 0, 0, 1, 1,
-1.55193, 1.827673, 0.04734035, 1, 0, 0, 1, 1,
-1.532701, 0.5632687, -2.300907, 0, 0, 0, 1, 1,
-1.527662, 1.071808, -1.408174, 0, 0, 0, 1, 1,
-1.517593, 0.1710276, -2.687988, 0, 0, 0, 1, 1,
-1.517466, -1.776503, -2.652586, 0, 0, 0, 1, 1,
-1.508866, 0.1157167, -1.48131, 0, 0, 0, 1, 1,
-1.508014, 0.7615401, -2.882548, 0, 0, 0, 1, 1,
-1.501082, 0.2117519, 0.1295877, 0, 0, 0, 1, 1,
-1.484753, 0.1617864, -1.996499, 1, 1, 1, 1, 1,
-1.477865, -0.258949, -0.8020217, 1, 1, 1, 1, 1,
-1.44875, -0.1061805, -2.956592, 1, 1, 1, 1, 1,
-1.447403, 1.619957, -1.471896, 1, 1, 1, 1, 1,
-1.433032, 1.207323, -2.347624, 1, 1, 1, 1, 1,
-1.432688, -0.02701995, -2.27686, 1, 1, 1, 1, 1,
-1.426271, -0.007602728, -0.602272, 1, 1, 1, 1, 1,
-1.426214, -0.8192493, -1.648512, 1, 1, 1, 1, 1,
-1.421141, 2.316801, -1.978602, 1, 1, 1, 1, 1,
-1.404076, -2.20241, -2.94642, 1, 1, 1, 1, 1,
-1.399428, -0.1629755, -1.058665, 1, 1, 1, 1, 1,
-1.395213, -1.169292, -2.937726, 1, 1, 1, 1, 1,
-1.384213, 1.648169, 0.8995563, 1, 1, 1, 1, 1,
-1.375553, 0.5055394, -0.3842527, 1, 1, 1, 1, 1,
-1.354253, 0.1840837, -0.6205305, 1, 1, 1, 1, 1,
-1.353559, -0.3007222, -0.6655915, 0, 0, 1, 1, 1,
-1.352625, 0.3280422, -1.452943, 1, 0, 0, 1, 1,
-1.348233, 0.324104, 0.4619883, 1, 0, 0, 1, 1,
-1.346616, 0.6144894, -1.66507, 1, 0, 0, 1, 1,
-1.345814, 1.049456, -3.335123, 1, 0, 0, 1, 1,
-1.337928, -0.5269828, -1.926959, 1, 0, 0, 1, 1,
-1.33614, 0.3974553, -1.376826, 0, 0, 0, 1, 1,
-1.334054, -0.8567836, -0.2249151, 0, 0, 0, 1, 1,
-1.330435, -0.851622, -4.456449, 0, 0, 0, 1, 1,
-1.326625, 0.8215156, -0.02824749, 0, 0, 0, 1, 1,
-1.309322, -1.47948, -1.520004, 0, 0, 0, 1, 1,
-1.285241, 0.4490812, -0.8437601, 0, 0, 0, 1, 1,
-1.266752, 0.6023642, -2.498293, 0, 0, 0, 1, 1,
-1.264621, 1.287262, -0.6895791, 1, 1, 1, 1, 1,
-1.255109, 1.240911, -0.7121968, 1, 1, 1, 1, 1,
-1.253018, -0.4242527, -3.083637, 1, 1, 1, 1, 1,
-1.249803, -0.1516578, -2.581259, 1, 1, 1, 1, 1,
-1.244597, -1.24732, -2.508061, 1, 1, 1, 1, 1,
-1.242993, 0.7945053, -1.206442, 1, 1, 1, 1, 1,
-1.242717, -1.199422, -2.054944, 1, 1, 1, 1, 1,
-1.242535, -1.049579, -2.517894, 1, 1, 1, 1, 1,
-1.23686, 2.496259, 0.5025636, 1, 1, 1, 1, 1,
-1.228982, 0.5734029, -1.516181, 1, 1, 1, 1, 1,
-1.209701, -0.4839651, -1.095666, 1, 1, 1, 1, 1,
-1.205625, 0.6999244, -1.010324, 1, 1, 1, 1, 1,
-1.200404, -0.1509189, -0.7843149, 1, 1, 1, 1, 1,
-1.195494, -0.268966, -2.01111, 1, 1, 1, 1, 1,
-1.192786, -1.324333, -3.657537, 1, 1, 1, 1, 1,
-1.189835, -0.1360539, -1.185819, 0, 0, 1, 1, 1,
-1.179176, 0.5213392, -0.8054329, 1, 0, 0, 1, 1,
-1.158836, -0.4036783, -1.540023, 1, 0, 0, 1, 1,
-1.147224, -0.01417017, -1.800233, 1, 0, 0, 1, 1,
-1.141265, 0.9978134, 0.03084949, 1, 0, 0, 1, 1,
-1.137204, -0.480015, -1.550706, 1, 0, 0, 1, 1,
-1.134907, -0.5706618, -1.306243, 0, 0, 0, 1, 1,
-1.127593, -0.3520668, -2.802579, 0, 0, 0, 1, 1,
-1.127333, 1.570929, -3.486478, 0, 0, 0, 1, 1,
-1.122598, -1.880005, -3.13701, 0, 0, 0, 1, 1,
-1.114461, -0.03928308, -1.021763, 0, 0, 0, 1, 1,
-1.111748, -1.446134, -3.114673, 0, 0, 0, 1, 1,
-1.108856, 1.179763, -3.651711, 0, 0, 0, 1, 1,
-1.090996, -0.04646164, -1.76309, 1, 1, 1, 1, 1,
-1.090571, -1.282811, -3.465838, 1, 1, 1, 1, 1,
-1.079368, -1.100293, -2.492797, 1, 1, 1, 1, 1,
-1.076882, 0.3631083, -1.794696, 1, 1, 1, 1, 1,
-1.070235, 3.062741, -0.1657724, 1, 1, 1, 1, 1,
-1.063955, 2.376565, 0.2467404, 1, 1, 1, 1, 1,
-1.059061, 0.3480369, -0.8110995, 1, 1, 1, 1, 1,
-1.058869, -1.199327, 0.511861, 1, 1, 1, 1, 1,
-1.057086, -0.2454553, -1.533159, 1, 1, 1, 1, 1,
-1.055427, 0.6220789, -0.6889774, 1, 1, 1, 1, 1,
-1.052326, 0.8747357, -0.6523584, 1, 1, 1, 1, 1,
-1.051472, -0.765576, -4.320167, 1, 1, 1, 1, 1,
-1.050833, 1.645619, -0.3824427, 1, 1, 1, 1, 1,
-1.050257, -0.9299778, -1.036595, 1, 1, 1, 1, 1,
-1.040496, -0.9925597, -1.057784, 1, 1, 1, 1, 1,
-1.027314, -1.196503, -3.191103, 0, 0, 1, 1, 1,
-1.025249, -0.9804278, -1.409295, 1, 0, 0, 1, 1,
-1.021922, -1.039146, -1.561941, 1, 0, 0, 1, 1,
-1.018908, 1.281886, -1.07132, 1, 0, 0, 1, 1,
-1.017184, 0.05518037, -0.9566235, 1, 0, 0, 1, 1,
-1.009156, 1.436508, -0.8912328, 1, 0, 0, 1, 1,
-1.008807, -1.676726, -2.055667, 0, 0, 0, 1, 1,
-1.001108, -1.438659, -2.584477, 0, 0, 0, 1, 1,
-1.000381, 1.033236, 1.468421, 0, 0, 0, 1, 1,
-0.9998986, -2.021186, -2.658989, 0, 0, 0, 1, 1,
-0.9986197, 1.881174, 0.02892069, 0, 0, 0, 1, 1,
-0.9972785, 0.155327, -1.91351, 0, 0, 0, 1, 1,
-0.9961605, -1.705216, -2.570193, 0, 0, 0, 1, 1,
-0.9746731, -1.102401, -3.017346, 1, 1, 1, 1, 1,
-0.9739319, 0.6042892, -0.8214156, 1, 1, 1, 1, 1,
-0.9673683, -0.3607309, -1.596293, 1, 1, 1, 1, 1,
-0.9594908, 0.8423348, -1.650384, 1, 1, 1, 1, 1,
-0.9541361, -0.1165268, -2.461666, 1, 1, 1, 1, 1,
-0.9523488, 1.058361, -1.631898, 1, 1, 1, 1, 1,
-0.9508161, -0.06095911, -2.394292, 1, 1, 1, 1, 1,
-0.9503155, -0.9147171, -2.614391, 1, 1, 1, 1, 1,
-0.9486111, 1.490413, -0.1903209, 1, 1, 1, 1, 1,
-0.9456802, -1.610842, -1.346869, 1, 1, 1, 1, 1,
-0.9418713, -0.607738, -1.437508, 1, 1, 1, 1, 1,
-0.9398359, 0.6617411, -2.230883, 1, 1, 1, 1, 1,
-0.9349428, 0.1226775, -0.9567724, 1, 1, 1, 1, 1,
-0.9281777, -1.272409, -1.825055, 1, 1, 1, 1, 1,
-0.9236006, 0.9653254, -1.219904, 1, 1, 1, 1, 1,
-0.922534, -1.048586, -2.676301, 0, 0, 1, 1, 1,
-0.9200124, -1.461893, -2.225127, 1, 0, 0, 1, 1,
-0.9161707, -0.1566901, -1.797496, 1, 0, 0, 1, 1,
-0.9115134, -1.101962, -1.855187, 1, 0, 0, 1, 1,
-0.9091311, 1.16987, -0.03795015, 1, 0, 0, 1, 1,
-0.9090014, 0.4850042, -1.875564, 1, 0, 0, 1, 1,
-0.9037813, 0.8687305, -1.985108, 0, 0, 0, 1, 1,
-0.9027078, 0.1758632, -2.012548, 0, 0, 0, 1, 1,
-0.8992224, -0.6160725, -1.848736, 0, 0, 0, 1, 1,
-0.8966407, 0.04192917, -1.259218, 0, 0, 0, 1, 1,
-0.8943365, -1.065849, -2.249245, 0, 0, 0, 1, 1,
-0.8889133, 0.1636035, -1.489877, 0, 0, 0, 1, 1,
-0.8809589, -1.727781, -2.520481, 0, 0, 0, 1, 1,
-0.878525, 0.002387832, -1.81595, 1, 1, 1, 1, 1,
-0.8746927, -0.5096919, -3.452032, 1, 1, 1, 1, 1,
-0.8552288, 0.3806615, -1.194384, 1, 1, 1, 1, 1,
-0.8544966, -0.1507531, -1.351444, 1, 1, 1, 1, 1,
-0.8544635, -1.079969, -2.875175, 1, 1, 1, 1, 1,
-0.8544399, -0.5320501, -2.727289, 1, 1, 1, 1, 1,
-0.8530766, -2.21848, -1.930367, 1, 1, 1, 1, 1,
-0.8408421, 1.416487, -1.349209, 1, 1, 1, 1, 1,
-0.8328553, 0.8287851, 0.264459, 1, 1, 1, 1, 1,
-0.8316239, -0.7431985, -2.283279, 1, 1, 1, 1, 1,
-0.8314205, -1.743197, -2.096719, 1, 1, 1, 1, 1,
-0.8305345, 0.08747275, -2.28075, 1, 1, 1, 1, 1,
-0.8297883, 1.808317, 0.4114138, 1, 1, 1, 1, 1,
-0.8290965, 0.2403915, -2.136874, 1, 1, 1, 1, 1,
-0.8268179, -0.2714432, -3.452711, 1, 1, 1, 1, 1,
-0.8246287, -2.336561, -2.872605, 0, 0, 1, 1, 1,
-0.82087, 1.604666, -1.882246, 1, 0, 0, 1, 1,
-0.8207008, -1.335519, -2.401145, 1, 0, 0, 1, 1,
-0.8197253, 0.4532885, -3.371471, 1, 0, 0, 1, 1,
-0.8134879, 1.369727, -1.248741, 1, 0, 0, 1, 1,
-0.8071588, -0.1450824, 0.6675002, 1, 0, 0, 1, 1,
-0.8055373, -1.432894, -2.889517, 0, 0, 0, 1, 1,
-0.8041114, -0.2016619, -1.612927, 0, 0, 0, 1, 1,
-0.80411, 0.6559422, -0.5911286, 0, 0, 0, 1, 1,
-0.8029689, -0.1562949, -0.4438016, 0, 0, 0, 1, 1,
-0.7955866, -0.283493, -1.15946, 0, 0, 0, 1, 1,
-0.7950628, -0.05734756, -1.145751, 0, 0, 0, 1, 1,
-0.7940267, 0.1761328, -1.203495, 0, 0, 0, 1, 1,
-0.7845727, -0.60534, -2.084085, 1, 1, 1, 1, 1,
-0.7826361, 1.763502, -1.607855, 1, 1, 1, 1, 1,
-0.7814378, 0.1370394, -1.889607, 1, 1, 1, 1, 1,
-0.7720043, -0.2586829, -4.033219, 1, 1, 1, 1, 1,
-0.7693612, 0.7575824, -0.643915, 1, 1, 1, 1, 1,
-0.7670753, 0.8168877, -0.7662833, 1, 1, 1, 1, 1,
-0.7651709, -1.223017, -3.324365, 1, 1, 1, 1, 1,
-0.7609483, 1.504704, -0.6934147, 1, 1, 1, 1, 1,
-0.7577046, 1.038041, -1.627819, 1, 1, 1, 1, 1,
-0.7538753, 1.258814, 0.2754686, 1, 1, 1, 1, 1,
-0.7532485, -0.07287836, -1.102571, 1, 1, 1, 1, 1,
-0.741825, -2.527626, -1.276023, 1, 1, 1, 1, 1,
-0.7336852, 0.3833362, -1.676135, 1, 1, 1, 1, 1,
-0.7292402, 0.6854151, -1.616084, 1, 1, 1, 1, 1,
-0.7259696, 0.4326383, -2.352389, 1, 1, 1, 1, 1,
-0.7239286, -0.1015281, -1.829917, 0, 0, 1, 1, 1,
-0.7117026, -1.17116, -1.263634, 1, 0, 0, 1, 1,
-0.7094451, 0.08802199, -2.014977, 1, 0, 0, 1, 1,
-0.7093586, 0.6432871, -1.650925, 1, 0, 0, 1, 1,
-0.7057921, 0.7109848, -1.562002, 1, 0, 0, 1, 1,
-0.7037792, -1.144629, -3.591016, 1, 0, 0, 1, 1,
-0.6985502, -0.8685929, -2.306049, 0, 0, 0, 1, 1,
-0.6979752, -2.268554, -3.496801, 0, 0, 0, 1, 1,
-0.696128, -2.395152, -5.067002, 0, 0, 0, 1, 1,
-0.6949697, -1.671869, -2.613374, 0, 0, 0, 1, 1,
-0.694789, 1.480405, 0.1610916, 0, 0, 0, 1, 1,
-0.6880886, 0.5125779, -0.7729191, 0, 0, 0, 1, 1,
-0.6872023, -0.5831281, -4.183194, 0, 0, 0, 1, 1,
-0.6821674, -0.6335055, -0.8817766, 1, 1, 1, 1, 1,
-0.6799069, -0.362428, -1.980463, 1, 1, 1, 1, 1,
-0.6798946, -0.7346049, -2.295621, 1, 1, 1, 1, 1,
-0.6787875, 1.367367, -0.4479944, 1, 1, 1, 1, 1,
-0.6719556, -0.6907126, -3.491486, 1, 1, 1, 1, 1,
-0.6682245, -0.7428778, -5.244544, 1, 1, 1, 1, 1,
-0.6612496, 1.040846, -0.5089622, 1, 1, 1, 1, 1,
-0.6600769, 2.066768, 0.8973286, 1, 1, 1, 1, 1,
-0.6596423, -0.77606, 0.5113305, 1, 1, 1, 1, 1,
-0.6592631, 0.5208997, 0.5594262, 1, 1, 1, 1, 1,
-0.6583105, 1.096077, -0.8915874, 1, 1, 1, 1, 1,
-0.6571035, -0.4407423, -2.348013, 1, 1, 1, 1, 1,
-0.6544431, 0.4306142, -0.2512854, 1, 1, 1, 1, 1,
-0.6523844, 0.6837295, -1.025642, 1, 1, 1, 1, 1,
-0.6475965, 0.004617029, -0.9195887, 1, 1, 1, 1, 1,
-0.6471438, 0.6395838, -1.145183, 0, 0, 1, 1, 1,
-0.6442947, -0.02407276, -2.112009, 1, 0, 0, 1, 1,
-0.643957, 0.2458711, 0.2623034, 1, 0, 0, 1, 1,
-0.6436671, 1.536659, -0.5897503, 1, 0, 0, 1, 1,
-0.6353765, 0.3868212, -0.4539684, 1, 0, 0, 1, 1,
-0.6151145, -0.9450495, -3.396089, 1, 0, 0, 1, 1,
-0.6145387, -0.4190028, -0.3356196, 0, 0, 0, 1, 1,
-0.6056034, -1.350262, -2.342288, 0, 0, 0, 1, 1,
-0.6019368, -0.9676431, -1.659775, 0, 0, 0, 1, 1,
-0.6011159, 0.8434554, -2.409833, 0, 0, 0, 1, 1,
-0.5973163, 0.47457, -1.225351, 0, 0, 0, 1, 1,
-0.5940969, 0.5689396, -0.4540376, 0, 0, 0, 1, 1,
-0.5916865, -0.3696536, -2.50804, 0, 0, 0, 1, 1,
-0.5899531, -0.4800819, -2.467713, 1, 1, 1, 1, 1,
-0.5868106, 0.6444602, 0.9448605, 1, 1, 1, 1, 1,
-0.5852916, 1.104102, -2.162564, 1, 1, 1, 1, 1,
-0.5754097, 0.84583, -1.061428, 1, 1, 1, 1, 1,
-0.5737983, -1.095703, -3.160523, 1, 1, 1, 1, 1,
-0.5718657, -0.9153289, -2.965641, 1, 1, 1, 1, 1,
-0.569497, 0.9036762, 0.4088788, 1, 1, 1, 1, 1,
-0.5663236, -0.1337192, -0.2639349, 1, 1, 1, 1, 1,
-0.5601709, 0.3195077, 0.3161584, 1, 1, 1, 1, 1,
-0.5530717, 0.01850559, -2.212986, 1, 1, 1, 1, 1,
-0.5522737, -1.514015, -3.079297, 1, 1, 1, 1, 1,
-0.5488148, -1.905104, -1.76287, 1, 1, 1, 1, 1,
-0.5403855, 0.8683718, 0.5014876, 1, 1, 1, 1, 1,
-0.538192, -1.153598, -2.812146, 1, 1, 1, 1, 1,
-0.5359223, -0.7318625, -3.024506, 1, 1, 1, 1, 1,
-0.5292233, 0.3916034, -0.0136014, 0, 0, 1, 1, 1,
-0.529192, 0.1372845, -2.073458, 1, 0, 0, 1, 1,
-0.5205551, -1.169555, -2.572495, 1, 0, 0, 1, 1,
-0.5175787, -1.569759, -1.153597, 1, 0, 0, 1, 1,
-0.5164242, -0.4484461, -2.477429, 1, 0, 0, 1, 1,
-0.5147813, 0.8459674, 0.8422809, 1, 0, 0, 1, 1,
-0.5144485, 1.962436, -0.8358401, 0, 0, 0, 1, 1,
-0.5135955, -0.7566415, -4.107964, 0, 0, 0, 1, 1,
-0.5124213, -1.51548, -0.8402712, 0, 0, 0, 1, 1,
-0.5091161, -1.021445, -3.577637, 0, 0, 0, 1, 1,
-0.5079699, 1.24603, -0.1179017, 0, 0, 0, 1, 1,
-0.5077447, 0.7631962, 0.6965603, 0, 0, 0, 1, 1,
-0.5071304, 0.4083129, -0.07678245, 0, 0, 0, 1, 1,
-0.4992743, 0.5476493, -1.221065, 1, 1, 1, 1, 1,
-0.4977, 1.4956, -0.4262907, 1, 1, 1, 1, 1,
-0.4882737, 0.6457763, -1.432914, 1, 1, 1, 1, 1,
-0.4875246, -3.113822, -3.453502, 1, 1, 1, 1, 1,
-0.4871601, -1.613229, -2.419985, 1, 1, 1, 1, 1,
-0.4826998, -0.7277358, -2.787125, 1, 1, 1, 1, 1,
-0.4813195, -2.25499, -2.19444, 1, 1, 1, 1, 1,
-0.4636663, -0.2387295, -2.82594, 1, 1, 1, 1, 1,
-0.4562162, -2.895323, -2.470759, 1, 1, 1, 1, 1,
-0.4527831, 0.9525642, 1.14711, 1, 1, 1, 1, 1,
-0.4523703, 0.5673388, -1.827255, 1, 1, 1, 1, 1,
-0.4468996, -0.07437193, -1.214418, 1, 1, 1, 1, 1,
-0.4460864, -1.785807, -4.121592, 1, 1, 1, 1, 1,
-0.436657, 0.100574, -1.549104, 1, 1, 1, 1, 1,
-0.4309961, 0.2335398, -3.003003, 1, 1, 1, 1, 1,
-0.4299202, 2.073772, -0.3273664, 0, 0, 1, 1, 1,
-0.4264562, 1.087352, -2.523288, 1, 0, 0, 1, 1,
-0.4258654, -1.840574, -2.622705, 1, 0, 0, 1, 1,
-0.4192133, 1.068905, 0.06861915, 1, 0, 0, 1, 1,
-0.4085461, 0.3460965, -2.932457, 1, 0, 0, 1, 1,
-0.4058768, 0.9401838, -2.308193, 1, 0, 0, 1, 1,
-0.4007969, 0.5773993, 1.090263, 0, 0, 0, 1, 1,
-0.3994848, 1.909966, -0.105138, 0, 0, 0, 1, 1,
-0.3978533, -0.9616359, -2.475189, 0, 0, 0, 1, 1,
-0.3937632, -1.402899, -2.717782, 0, 0, 0, 1, 1,
-0.391127, -0.3395797, -2.951341, 0, 0, 0, 1, 1,
-0.3900186, -1.16109, -2.218721, 0, 0, 0, 1, 1,
-0.3872955, 1.341183, 0.07447786, 0, 0, 0, 1, 1,
-0.3829497, -0.6950629, -2.789365, 1, 1, 1, 1, 1,
-0.3809604, -0.6498257, -3.418205, 1, 1, 1, 1, 1,
-0.3773932, -0.5157186, -1.324151, 1, 1, 1, 1, 1,
-0.3755383, -1.023645, -2.595668, 1, 1, 1, 1, 1,
-0.3733474, -2.405754, -3.513147, 1, 1, 1, 1, 1,
-0.3723456, -0.8724989, -3.692801, 1, 1, 1, 1, 1,
-0.3704374, -0.4731608, -3.973629, 1, 1, 1, 1, 1,
-0.3590669, 1.572694, -1.023094, 1, 1, 1, 1, 1,
-0.3573222, -0.1294323, -2.545944, 1, 1, 1, 1, 1,
-0.3523698, -0.2273383, -2.600292, 1, 1, 1, 1, 1,
-0.3513131, -0.008322547, -1.342722, 1, 1, 1, 1, 1,
-0.3476731, 0.5910465, -0.3455164, 1, 1, 1, 1, 1,
-0.3453192, -0.6818178, -3.619192, 1, 1, 1, 1, 1,
-0.3447331, 1.834317, -1.698207, 1, 1, 1, 1, 1,
-0.3445106, -1.87606, -2.502679, 1, 1, 1, 1, 1,
-0.3436391, -0.08208217, -1.93486, 0, 0, 1, 1, 1,
-0.3404873, -0.9248578, -1.966908, 1, 0, 0, 1, 1,
-0.3360619, -2.083602, -3.522059, 1, 0, 0, 1, 1,
-0.334835, -0.5925917, -2.76607, 1, 0, 0, 1, 1,
-0.3342086, 1.476435, -0.9806601, 1, 0, 0, 1, 1,
-0.3335074, 0.672257, -1.65598, 1, 0, 0, 1, 1,
-0.3331983, -0.6061019, -3.882258, 0, 0, 0, 1, 1,
-0.3306343, -0.3407415, -1.035899, 0, 0, 0, 1, 1,
-0.3305858, -0.7797466, -1.713237, 0, 0, 0, 1, 1,
-0.3230571, 0.2645822, -1.728778, 0, 0, 0, 1, 1,
-0.3211539, 0.5472871, 0.7713542, 0, 0, 0, 1, 1,
-0.3190603, -0.4222453, -2.428619, 0, 0, 0, 1, 1,
-0.319006, 1.591571, 0.8167824, 0, 0, 0, 1, 1,
-0.318841, -1.091678, -3.157173, 1, 1, 1, 1, 1,
-0.3170371, 2.209574, 0.3266077, 1, 1, 1, 1, 1,
-0.3152825, 0.6418825, 0.6090142, 1, 1, 1, 1, 1,
-0.3136221, 0.8570585, -0.1143709, 1, 1, 1, 1, 1,
-0.3127222, -0.06999069, -2.50491, 1, 1, 1, 1, 1,
-0.3121298, -0.5139956, -3.132828, 1, 1, 1, 1, 1,
-0.3101248, 0.02403426, -0.5619139, 1, 1, 1, 1, 1,
-0.3089539, -0.9162394, -4.22689, 1, 1, 1, 1, 1,
-0.3085045, 0.6675819, -0.6658985, 1, 1, 1, 1, 1,
-0.2996895, 1.406724, -0.2974451, 1, 1, 1, 1, 1,
-0.2987572, 0.9154507, -0.184182, 1, 1, 1, 1, 1,
-0.2958236, 1.163555, -0.2477301, 1, 1, 1, 1, 1,
-0.2952984, -0.8476105, -2.500033, 1, 1, 1, 1, 1,
-0.2951278, 0.4521572, -0.1721028, 1, 1, 1, 1, 1,
-0.2949056, 0.2076881, -2.839575, 1, 1, 1, 1, 1,
-0.2902953, -0.4085611, -2.948699, 0, 0, 1, 1, 1,
-0.2839665, -1.332093, -3.318629, 1, 0, 0, 1, 1,
-0.2826064, 2.431098, -1.332195, 1, 0, 0, 1, 1,
-0.2801921, -0.3406789, -1.356397, 1, 0, 0, 1, 1,
-0.2800297, 0.3692802, -0.289519, 1, 0, 0, 1, 1,
-0.2795517, -0.1686999, -2.555762, 1, 0, 0, 1, 1,
-0.2732643, 0.01018324, -1.757396, 0, 0, 0, 1, 1,
-0.268699, 1.117407, 0.4391874, 0, 0, 0, 1, 1,
-0.2648882, 0.1337481, 0.01537831, 0, 0, 0, 1, 1,
-0.2622146, -1.395888, -4.305444, 0, 0, 0, 1, 1,
-0.2574778, 0.6398837, 0.805604, 0, 0, 0, 1, 1,
-0.2561687, -0.7040208, -1.556908, 0, 0, 0, 1, 1,
-0.2553904, 0.2641894, -3.002845, 0, 0, 0, 1, 1,
-0.2548571, 0.41877, -0.8558306, 1, 1, 1, 1, 1,
-0.2529888, 1.411385, -0.1088921, 1, 1, 1, 1, 1,
-0.2489183, 0.2370258, 0.272525, 1, 1, 1, 1, 1,
-0.244566, 0.5806591, -0.09601741, 1, 1, 1, 1, 1,
-0.2442236, 0.8473664, 0.508622, 1, 1, 1, 1, 1,
-0.2436669, 1.187479, -0.2093794, 1, 1, 1, 1, 1,
-0.2408432, -0.6384864, -2.504406, 1, 1, 1, 1, 1,
-0.2396148, -1.929843, -3.67957, 1, 1, 1, 1, 1,
-0.2362131, 0.9658307, -1.771817, 1, 1, 1, 1, 1,
-0.2358969, 1.369349, -2.159275, 1, 1, 1, 1, 1,
-0.235417, 1.372497, 1.272101, 1, 1, 1, 1, 1,
-0.2328622, -0.27195, -2.161988, 1, 1, 1, 1, 1,
-0.2320244, 0.0101514, -1.130404, 1, 1, 1, 1, 1,
-0.2311605, -0.7263385, -1.100641, 1, 1, 1, 1, 1,
-0.2292682, 0.250728, -1.286571, 1, 1, 1, 1, 1,
-0.2248889, 2.349387, -0.9568011, 0, 0, 1, 1, 1,
-0.2170654, -2.116711, -1.415053, 1, 0, 0, 1, 1,
-0.2158199, -0.001233191, -1.040249, 1, 0, 0, 1, 1,
-0.2136986, -2.776433, -1.609482, 1, 0, 0, 1, 1,
-0.2089068, 0.6619147, -0.06247836, 1, 0, 0, 1, 1,
-0.2057145, 0.1571139, -2.628575, 1, 0, 0, 1, 1,
-0.2036079, -0.6533839, -2.305162, 0, 0, 0, 1, 1,
-0.2011101, 0.6655568, 0.2326213, 0, 0, 0, 1, 1,
-0.2002425, 0.4383332, 0.6400754, 0, 0, 0, 1, 1,
-0.1988057, -0.5705155, -2.522994, 0, 0, 0, 1, 1,
-0.1969839, 0.7294174, -0.9638987, 0, 0, 0, 1, 1,
-0.1955238, -0.2293913, -3.803627, 0, 0, 0, 1, 1,
-0.1908226, 0.1814497, -1.01601, 0, 0, 0, 1, 1,
-0.1889594, 0.6821386, -1.080503, 1, 1, 1, 1, 1,
-0.1884081, -1.887411, -3.069601, 1, 1, 1, 1, 1,
-0.1882389, -0.2271531, -2.455566, 1, 1, 1, 1, 1,
-0.1809617, -0.2492963, -2.942335, 1, 1, 1, 1, 1,
-0.1795914, -0.2353386, -1.535286, 1, 1, 1, 1, 1,
-0.1784463, 0.2833855, -0.7390817, 1, 1, 1, 1, 1,
-0.1728518, 0.4787827, -0.8786126, 1, 1, 1, 1, 1,
-0.1705721, 0.644635, 0.08562125, 1, 1, 1, 1, 1,
-0.1684416, -0.2932774, -4.077991, 1, 1, 1, 1, 1,
-0.165806, 0.5436034, 1.723396, 1, 1, 1, 1, 1,
-0.1651208, -0.4333366, -1.197701, 1, 1, 1, 1, 1,
-0.1649085, 0.2047842, -0.1075502, 1, 1, 1, 1, 1,
-0.1631243, -1.131277, -4.70193, 1, 1, 1, 1, 1,
-0.1623861, -0.4682964, -2.723632, 1, 1, 1, 1, 1,
-0.1620481, 0.6287323, 0.5199263, 1, 1, 1, 1, 1,
-0.1596749, 0.4887378, -0.7573216, 0, 0, 1, 1, 1,
-0.1591651, 0.4934755, -1.272314, 1, 0, 0, 1, 1,
-0.1590786, -0.5029485, -0.9727901, 1, 0, 0, 1, 1,
-0.1409945, 1.139126, 0.1748451, 1, 0, 0, 1, 1,
-0.1377373, -0.1616231, -2.042339, 1, 0, 0, 1, 1,
-0.1357964, 1.211389, -0.6933292, 1, 0, 0, 1, 1,
-0.1345247, 1.559798, -0.2484285, 0, 0, 0, 1, 1,
-0.1298117, -0.4439385, -3.98559, 0, 0, 0, 1, 1,
-0.1285822, -0.006970733, -2.301774, 0, 0, 0, 1, 1,
-0.1245786, 0.832658, 0.5368559, 0, 0, 0, 1, 1,
-0.1244579, 0.835107, -0.3540075, 0, 0, 0, 1, 1,
-0.1162071, 0.553721, -1.070855, 0, 0, 0, 1, 1,
-0.1160975, 1.079193, -0.5944825, 0, 0, 0, 1, 1,
-0.116014, 0.8882538, 0.7284551, 1, 1, 1, 1, 1,
-0.1125781, -0.3352935, -2.879973, 1, 1, 1, 1, 1,
-0.1117297, 1.042352, -0.635699, 1, 1, 1, 1, 1,
-0.1101251, -0.3999675, -3.366131, 1, 1, 1, 1, 1,
-0.109556, -0.03294455, -1.598178, 1, 1, 1, 1, 1,
-0.109085, 0.04950651, -0.6160676, 1, 1, 1, 1, 1,
-0.1089879, -0.1334822, -3.604459, 1, 1, 1, 1, 1,
-0.1055092, -0.3674036, -2.242347, 1, 1, 1, 1, 1,
-0.1027221, 0.5289041, -0.9078186, 1, 1, 1, 1, 1,
-0.09916796, -0.1998539, -2.963666, 1, 1, 1, 1, 1,
-0.0988948, -0.8232629, -4.595662, 1, 1, 1, 1, 1,
-0.09868716, 0.2531059, -2.288192, 1, 1, 1, 1, 1,
-0.09867249, -0.1109921, -2.789102, 1, 1, 1, 1, 1,
-0.09830581, 0.5047368, 0.1069125, 1, 1, 1, 1, 1,
-0.09776127, 0.1668904, 0.8746032, 1, 1, 1, 1, 1,
-0.09458656, 0.9114938, 1.366227, 0, 0, 1, 1, 1,
-0.08800384, 0.2096973, 0.436198, 1, 0, 0, 1, 1,
-0.08488388, -0.8468501, -3.079144, 1, 0, 0, 1, 1,
-0.08144146, -1.711023, -2.796097, 1, 0, 0, 1, 1,
-0.06868321, -1.763277, -2.389837, 1, 0, 0, 1, 1,
-0.0663887, -0.1474094, -0.5865071, 1, 0, 0, 1, 1,
-0.06494856, -0.7733328, -1.630416, 0, 0, 0, 1, 1,
-0.05955942, -0.8584635, -3.628887, 0, 0, 0, 1, 1,
-0.05916392, 0.5570831, -0.1049778, 0, 0, 0, 1, 1,
-0.05575372, 0.5538171, -1.497625, 0, 0, 0, 1, 1,
-0.05533394, 0.1004987, -0.007004367, 0, 0, 0, 1, 1,
-0.05478656, 0.9554929, -1.619904, 0, 0, 0, 1, 1,
-0.04460463, -0.8654962, -2.82022, 0, 0, 0, 1, 1,
-0.04044682, -0.05380015, -2.147524, 1, 1, 1, 1, 1,
-0.03730959, 1.881462, -0.2363305, 1, 1, 1, 1, 1,
-0.03620032, -0.959941, -2.816712, 1, 1, 1, 1, 1,
-0.03240233, 2.047727, -0.7175742, 1, 1, 1, 1, 1,
-0.03156167, 0.5751264, 0.5578288, 1, 1, 1, 1, 1,
-0.02913618, 1.251878, -1.050027, 1, 1, 1, 1, 1,
-0.02896573, 0.6169535, 0.7981042, 1, 1, 1, 1, 1,
-0.02771435, 0.8462821, 0.6071592, 1, 1, 1, 1, 1,
-0.02739042, -1.773783, -4.304625, 1, 1, 1, 1, 1,
-0.02411598, 0.1599375, -2.19249, 1, 1, 1, 1, 1,
-0.02344388, 1.201062, 0.3494627, 1, 1, 1, 1, 1,
-0.02312567, -0.9740697, -4.582734, 1, 1, 1, 1, 1,
-0.02193426, 0.7691563, 0.2180587, 1, 1, 1, 1, 1,
-0.0201712, 0.5293157, -1.122256, 1, 1, 1, 1, 1,
-0.01923391, -0.9987605, -1.588939, 1, 1, 1, 1, 1,
-0.01341849, 0.584618, 1.076343, 0, 0, 1, 1, 1,
-0.01227156, -1.573005, -1.466308, 1, 0, 0, 1, 1,
-0.01180715, 0.4058101, 0.5526009, 1, 0, 0, 1, 1,
-0.01169354, 0.142888, -0.8280421, 1, 0, 0, 1, 1,
-0.0106759, -1.24684, -3.176982, 1, 0, 0, 1, 1,
-0.009230032, 0.3435724, -0.1651495, 1, 0, 0, 1, 1,
-0.006108714, 0.980907, 1.042444, 0, 0, 0, 1, 1,
-0.005306741, -0.9580265, -1.379195, 0, 0, 0, 1, 1,
-0.004336783, 0.5635628, 0.2830014, 0, 0, 0, 1, 1,
0.001305254, 0.699341, -0.7064031, 0, 0, 0, 1, 1,
0.002818064, -0.5698307, 3.382517, 0, 0, 0, 1, 1,
0.003902163, 0.5352008, -0.3621935, 0, 0, 0, 1, 1,
0.004980025, -0.8546187, 3.246481, 0, 0, 0, 1, 1,
0.005377326, 0.9629811, 0.004548421, 1, 1, 1, 1, 1,
0.007009741, -0.6640077, 1.723088, 1, 1, 1, 1, 1,
0.009102628, -0.1078339, 3.251005, 1, 1, 1, 1, 1,
0.013637, 0.06878668, 0.7644867, 1, 1, 1, 1, 1,
0.0151413, 0.369435, 1.06487, 1, 1, 1, 1, 1,
0.01600174, 1.573964, 0.1569253, 1, 1, 1, 1, 1,
0.02612233, -0.2392829, 1.704776, 1, 1, 1, 1, 1,
0.04039266, -1.349482, 4.426482, 1, 1, 1, 1, 1,
0.04209058, -0.2527069, 3.728964, 1, 1, 1, 1, 1,
0.04535402, -1.62491, 3.948448, 1, 1, 1, 1, 1,
0.04741507, -0.1704745, 3.635886, 1, 1, 1, 1, 1,
0.04788594, 1.359917, 0.08187678, 1, 1, 1, 1, 1,
0.04933299, 0.9842782, 1.010347, 1, 1, 1, 1, 1,
0.05168561, -0.07279113, 2.209659, 1, 1, 1, 1, 1,
0.05170296, -1.121055, 3.806753, 1, 1, 1, 1, 1,
0.05993368, 1.336158, -0.4613074, 0, 0, 1, 1, 1,
0.06123411, -0.6415538, 2.137242, 1, 0, 0, 1, 1,
0.06246635, -0.3463172, 3.971191, 1, 0, 0, 1, 1,
0.0661578, 0.2667038, 1.883776, 1, 0, 0, 1, 1,
0.06721808, -0.5497101, 2.325486, 1, 0, 0, 1, 1,
0.06725314, -0.2001591, 1.859658, 1, 0, 0, 1, 1,
0.07065595, -0.6693721, 3.332561, 0, 0, 0, 1, 1,
0.07454845, 0.2476098, -0.3080038, 0, 0, 0, 1, 1,
0.0758794, -1.117574, 1.967045, 0, 0, 0, 1, 1,
0.07644614, 0.4346528, 1.492061, 0, 0, 0, 1, 1,
0.07984126, 0.5146633, 2.234962, 0, 0, 0, 1, 1,
0.08091965, 0.2749201, -0.1457365, 0, 0, 0, 1, 1,
0.08175209, -0.3028122, 2.125257, 0, 0, 0, 1, 1,
0.0842839, -2.321286, 3.588416, 1, 1, 1, 1, 1,
0.08845579, 0.1609259, 1.301782, 1, 1, 1, 1, 1,
0.08989835, -1.689588, 2.123452, 1, 1, 1, 1, 1,
0.09045594, 0.4256339, 0.7703612, 1, 1, 1, 1, 1,
0.09155812, -0.706889, 2.369716, 1, 1, 1, 1, 1,
0.09158377, -1.943757, 2.421093, 1, 1, 1, 1, 1,
0.09183767, -0.1194179, 2.934808, 1, 1, 1, 1, 1,
0.0944008, -0.4951694, 2.25466, 1, 1, 1, 1, 1,
0.09672588, -0.06845335, 2.386961, 1, 1, 1, 1, 1,
0.09957825, -0.9644779, 2.650127, 1, 1, 1, 1, 1,
0.1005547, 0.882769, 1.396395, 1, 1, 1, 1, 1,
0.1040624, -0.1729461, 3.398723, 1, 1, 1, 1, 1,
0.1072396, 1.269611, 2.46043, 1, 1, 1, 1, 1,
0.1080857, 0.3475133, -1.10485, 1, 1, 1, 1, 1,
0.1111367, 0.2214539, 1.423339, 1, 1, 1, 1, 1,
0.1143833, -0.1198496, 2.925234, 0, 0, 1, 1, 1,
0.1147592, 0.7131089, 0.5335286, 1, 0, 0, 1, 1,
0.1150075, 2.287333, -0.4267382, 1, 0, 0, 1, 1,
0.1194289, 0.7471224, 0.4959361, 1, 0, 0, 1, 1,
0.1227205, 0.8505004, 0.3899902, 1, 0, 0, 1, 1,
0.1231529, -0.1352915, 3.18902, 1, 0, 0, 1, 1,
0.1244568, -0.7361097, 3.296337, 0, 0, 0, 1, 1,
0.1250515, -0.2891675, 1.513281, 0, 0, 0, 1, 1,
0.1256322, 0.9734662, 0.1291271, 0, 0, 0, 1, 1,
0.1279585, 0.4127801, 0.05471907, 0, 0, 0, 1, 1,
0.1283527, 0.09981857, 0.279251, 0, 0, 0, 1, 1,
0.1288355, 0.0933485, 1.765089, 0, 0, 0, 1, 1,
0.1316617, -0.8123477, 2.570046, 0, 0, 0, 1, 1,
0.1350117, 1.1264, -0.5433406, 1, 1, 1, 1, 1,
0.1352644, -0.5032421, 3.631153, 1, 1, 1, 1, 1,
0.1369155, -0.5268943, 2.890565, 1, 1, 1, 1, 1,
0.1369643, -0.1515817, 3.279874, 1, 1, 1, 1, 1,
0.1396678, 0.3866521, 1.642911, 1, 1, 1, 1, 1,
0.1459404, 0.1732883, 1.25989, 1, 1, 1, 1, 1,
0.1463485, 0.2282201, 0.1795761, 1, 1, 1, 1, 1,
0.1513612, -0.7499842, 4.089036, 1, 1, 1, 1, 1,
0.1549611, 1.66934, 1.684801, 1, 1, 1, 1, 1,
0.1569458, -1.106812, 3.45563, 1, 1, 1, 1, 1,
0.1593525, 2.279283, -0.8261143, 1, 1, 1, 1, 1,
0.1617147, -2.33474, 1.644145, 1, 1, 1, 1, 1,
0.1642132, -0.4091579, 3.773681, 1, 1, 1, 1, 1,
0.166899, 1.211567, 0.4892148, 1, 1, 1, 1, 1,
0.1688721, -0.5192404, 3.087814, 1, 1, 1, 1, 1,
0.1731932, -0.1645719, 2.523811, 0, 0, 1, 1, 1,
0.1744998, -0.695105, 4.155925, 1, 0, 0, 1, 1,
0.1755373, -0.04474901, 1.702123, 1, 0, 0, 1, 1,
0.1784736, 0.09042472, 1.528365, 1, 0, 0, 1, 1,
0.181197, 0.9616395, 0.7228578, 1, 0, 0, 1, 1,
0.1830425, -1.393476, 4.156195, 1, 0, 0, 1, 1,
0.1834416, 0.503647, -0.3736552, 0, 0, 0, 1, 1,
0.1853563, 0.5148855, 0.6249989, 0, 0, 0, 1, 1,
0.1866913, 0.02076486, 0.7758716, 0, 0, 0, 1, 1,
0.1916079, 0.2534089, 1.988923, 0, 0, 0, 1, 1,
0.1971605, 1.154128, -0.4544798, 0, 0, 0, 1, 1,
0.1996767, -0.7125592, 1.855833, 0, 0, 0, 1, 1,
0.2014075, -0.4936897, 3.9754, 0, 0, 0, 1, 1,
0.2020111, -0.8505655, 4.469669, 1, 1, 1, 1, 1,
0.2067451, 0.932607, 2.069715, 1, 1, 1, 1, 1,
0.2074281, 1.900736, -0.2473901, 1, 1, 1, 1, 1,
0.2108672, 0.9965528, 1.315917, 1, 1, 1, 1, 1,
0.2109506, -0.03714032, 0.9398697, 1, 1, 1, 1, 1,
0.2114513, -1.298109, 2.164716, 1, 1, 1, 1, 1,
0.2144535, 1.883415, 1.547611, 1, 1, 1, 1, 1,
0.2168559, 1.562373, -0.3079686, 1, 1, 1, 1, 1,
0.2255627, 0.8796462, 0.4096604, 1, 1, 1, 1, 1,
0.228829, -0.08242456, -0.01702453, 1, 1, 1, 1, 1,
0.2289209, -0.2916909, 2.380584, 1, 1, 1, 1, 1,
0.2305846, -0.1229001, 2.622255, 1, 1, 1, 1, 1,
0.2352288, 1.387806, -1.363191, 1, 1, 1, 1, 1,
0.2409677, 0.05128812, 1.40332, 1, 1, 1, 1, 1,
0.2420234, 1.497496, -1.661345, 1, 1, 1, 1, 1,
0.2439902, 1.749743, 0.6191804, 0, 0, 1, 1, 1,
0.2513516, -0.920694, 3.696399, 1, 0, 0, 1, 1,
0.2551856, -0.3249077, 2.47378, 1, 0, 0, 1, 1,
0.2558506, -1.414545, 2.740943, 1, 0, 0, 1, 1,
0.2575305, 1.611712, -0.05515213, 1, 0, 0, 1, 1,
0.260251, -0.5008905, 3.612095, 1, 0, 0, 1, 1,
0.2603272, 0.1742759, 0.07395759, 0, 0, 0, 1, 1,
0.2744954, 0.7445733, 0.8434581, 0, 0, 0, 1, 1,
0.2754456, 2.234416, -0.618661, 0, 0, 0, 1, 1,
0.2786336, 0.6882204, 0.4470269, 0, 0, 0, 1, 1,
0.2821118, 0.2581052, -0.5229583, 0, 0, 0, 1, 1,
0.2854203, 1.333407, -0.5424899, 0, 0, 0, 1, 1,
0.2861661, 0.07045656, 0.5792387, 0, 0, 0, 1, 1,
0.2874932, 0.8509756, 1.334594, 1, 1, 1, 1, 1,
0.2889021, -0.532075, 3.476411, 1, 1, 1, 1, 1,
0.291103, -1.700232, 6.123968, 1, 1, 1, 1, 1,
0.295083, 0.2463661, 2.048436, 1, 1, 1, 1, 1,
0.2967589, -3.533526, 1.373315, 1, 1, 1, 1, 1,
0.3024576, -0.3088544, 3.445673, 1, 1, 1, 1, 1,
0.3037639, -1.095318, 1.632583, 1, 1, 1, 1, 1,
0.3059627, 0.6657225, 2.013278, 1, 1, 1, 1, 1,
0.3081599, 0.4728452, -0.7002431, 1, 1, 1, 1, 1,
0.3154841, -0.4664925, 1.03362, 1, 1, 1, 1, 1,
0.319355, 0.4069749, 1.246849, 1, 1, 1, 1, 1,
0.3197717, 0.3271089, 3.180997, 1, 1, 1, 1, 1,
0.3231314, -0.03213122, 0.8157821, 1, 1, 1, 1, 1,
0.3267331, 0.1760357, 2.22905, 1, 1, 1, 1, 1,
0.3283432, -1.293691, 1.496219, 1, 1, 1, 1, 1,
0.3284045, 0.4993751, 0.916889, 0, 0, 1, 1, 1,
0.3292628, -0.4641495, 1.980605, 1, 0, 0, 1, 1,
0.3358559, 0.7574527, -0.4991642, 1, 0, 0, 1, 1,
0.3360424, 0.01873838, 0.4372933, 1, 0, 0, 1, 1,
0.3388703, 0.04008281, 3.344467, 1, 0, 0, 1, 1,
0.339751, -1.663679, 2.451421, 1, 0, 0, 1, 1,
0.3432639, 0.7450281, -1.106753, 0, 0, 0, 1, 1,
0.3447334, -0.8820968, 2.542453, 0, 0, 0, 1, 1,
0.3447663, 1.342732, -0.5130145, 0, 0, 0, 1, 1,
0.3476199, 0.139061, 0.7007452, 0, 0, 0, 1, 1,
0.3484792, 0.5594313, 2.427874, 0, 0, 0, 1, 1,
0.3497117, 0.7941682, -0.6156805, 0, 0, 0, 1, 1,
0.3516757, -2.996782, 2.786123, 0, 0, 0, 1, 1,
0.3541824, -1.843417, 2.351881, 1, 1, 1, 1, 1,
0.355631, -0.8457424, 1.749643, 1, 1, 1, 1, 1,
0.358352, -2.384846, 3.421719, 1, 1, 1, 1, 1,
0.3737199, -0.6950688, 3.017449, 1, 1, 1, 1, 1,
0.3751077, -1.435817, 3.98589, 1, 1, 1, 1, 1,
0.3797007, -0.09534252, 1.556837, 1, 1, 1, 1, 1,
0.3848011, -0.5864956, 3.226578, 1, 1, 1, 1, 1,
0.3848315, 0.5508197, -0.08360559, 1, 1, 1, 1, 1,
0.3897604, -1.584325, 2.715574, 1, 1, 1, 1, 1,
0.3961025, -0.4811145, 2.077883, 1, 1, 1, 1, 1,
0.3965622, 0.3775764, -0.3987278, 1, 1, 1, 1, 1,
0.3981318, -0.1258529, 3.034079, 1, 1, 1, 1, 1,
0.3983322, 0.3763793, 1.822698, 1, 1, 1, 1, 1,
0.3994868, 0.1743705, 0.4928522, 1, 1, 1, 1, 1,
0.4013455, -0.03532835, 3.423561, 1, 1, 1, 1, 1,
0.4017476, -1.220313, 3.777729, 0, 0, 1, 1, 1,
0.4023354, -0.620618, 3.472835, 1, 0, 0, 1, 1,
0.4026369, 0.2891055, 0.1321659, 1, 0, 0, 1, 1,
0.4026986, -1.996412, 2.926873, 1, 0, 0, 1, 1,
0.4038308, 0.3279249, 2.708189, 1, 0, 0, 1, 1,
0.4048026, -0.5259712, 3.146903, 1, 0, 0, 1, 1,
0.4077185, 0.8939672, 1.342482, 0, 0, 0, 1, 1,
0.4087645, -0.5940526, 1.992912, 0, 0, 0, 1, 1,
0.4103473, -1.915613, 3.913851, 0, 0, 0, 1, 1,
0.411366, 0.1528869, 0.5520821, 0, 0, 0, 1, 1,
0.4146986, 0.04213972, 1.176157, 0, 0, 0, 1, 1,
0.419305, -1.2595, 3.913012, 0, 0, 0, 1, 1,
0.4236491, -0.7694392, 2.303994, 0, 0, 0, 1, 1,
0.4250186, 1.392413, 1.066966, 1, 1, 1, 1, 1,
0.4258068, 0.8656089, 0.1894163, 1, 1, 1, 1, 1,
0.4304314, -0.549046, 1.836606, 1, 1, 1, 1, 1,
0.4340855, 0.03517687, 1.857951, 1, 1, 1, 1, 1,
0.4365968, -0.7381136, 2.57597, 1, 1, 1, 1, 1,
0.4376056, 0.1275316, 1.795366, 1, 1, 1, 1, 1,
0.4381879, -0.04003803, 2.258569, 1, 1, 1, 1, 1,
0.4403098, -0.3013114, 1.451648, 1, 1, 1, 1, 1,
0.446777, 1.968396, 1.183644, 1, 1, 1, 1, 1,
0.4523444, 0.5072999, -0.4170794, 1, 1, 1, 1, 1,
0.4558277, -0.3948472, 2.581179, 1, 1, 1, 1, 1,
0.45661, 0.9824937, 0.6461673, 1, 1, 1, 1, 1,
0.4642052, -0.04662837, 1.023724, 1, 1, 1, 1, 1,
0.4675547, 0.4994423, 1.40531, 1, 1, 1, 1, 1,
0.4682106, 0.7936969, 1.039992, 1, 1, 1, 1, 1,
0.4699873, 0.3282084, 0.2490987, 0, 0, 1, 1, 1,
0.4709264, 0.6776587, 0.7065777, 1, 0, 0, 1, 1,
0.4724595, -0.2605683, 3.185574, 1, 0, 0, 1, 1,
0.4769014, -1.436553, 4.204715, 1, 0, 0, 1, 1,
0.4779133, 1.6038, -0.5978973, 1, 0, 0, 1, 1,
0.4837926, 0.01239946, 2.431976, 1, 0, 0, 1, 1,
0.4864061, 1.508357, 0.9109651, 0, 0, 0, 1, 1,
0.4908637, 0.1480386, 2.594785, 0, 0, 0, 1, 1,
0.494405, -0.2500598, 1.314937, 0, 0, 0, 1, 1,
0.4990457, -0.03390367, 2.462212, 0, 0, 0, 1, 1,
0.5004041, 0.8154646, 1.23705, 0, 0, 0, 1, 1,
0.500807, -0.302036, 0.2949645, 0, 0, 0, 1, 1,
0.5018407, -0.3660604, 2.010044, 0, 0, 0, 1, 1,
0.5054936, -0.257513, 2.624434, 1, 1, 1, 1, 1,
0.51269, 1.749112, 1.391208, 1, 1, 1, 1, 1,
0.5152419, 0.4933867, 1.883829, 1, 1, 1, 1, 1,
0.5156549, 1.094015, -0.06518877, 1, 1, 1, 1, 1,
0.516153, -0.8999927, 0.5840612, 1, 1, 1, 1, 1,
0.5172314, -0.4606007, 2.273067, 1, 1, 1, 1, 1,
0.5195525, -2.066537, 4.614388, 1, 1, 1, 1, 1,
0.5237944, 1.103977, 0.4216056, 1, 1, 1, 1, 1,
0.5297775, 0.03053169, 1.482638, 1, 1, 1, 1, 1,
0.5395622, -0.1992509, 2.099123, 1, 1, 1, 1, 1,
0.5396777, -2.021022, 4.894774, 1, 1, 1, 1, 1,
0.5458242, 1.010745, 0.9734924, 1, 1, 1, 1, 1,
0.5512539, 1.489562, 1.737128, 1, 1, 1, 1, 1,
0.5718184, -1.011046, 2.495384, 1, 1, 1, 1, 1,
0.5752357, 0.3923988, 0.2384508, 1, 1, 1, 1, 1,
0.5774882, -0.2900046, 2.046797, 0, 0, 1, 1, 1,
0.5793956, 2.613558, -1.245416, 1, 0, 0, 1, 1,
0.5804055, 1.405859, -1.044712, 1, 0, 0, 1, 1,
0.5833465, 1.417672, 1.940895, 1, 0, 0, 1, 1,
0.611133, 1.170226, 0.1514172, 1, 0, 0, 1, 1,
0.6164864, 1.158693, -0.04596151, 1, 0, 0, 1, 1,
0.6184075, 0.8570797, 1.668845, 0, 0, 0, 1, 1,
0.6201682, -0.2488551, 2.08406, 0, 0, 0, 1, 1,
0.6233308, 0.002078232, 1.16586, 0, 0, 0, 1, 1,
0.6267753, -0.6712407, 2.34394, 0, 0, 0, 1, 1,
0.6315863, 0.9570936, 0.759401, 0, 0, 0, 1, 1,
0.6352186, 0.7639764, -0.6727997, 0, 0, 0, 1, 1,
0.6390998, -0.8437372, 1.954971, 0, 0, 0, 1, 1,
0.6391709, -0.432371, 2.377572, 1, 1, 1, 1, 1,
0.6403238, -1.382077, 3.605305, 1, 1, 1, 1, 1,
0.6411429, -1.141036, 3.849064, 1, 1, 1, 1, 1,
0.6486856, 0.4047639, 1.251576, 1, 1, 1, 1, 1,
0.650328, 0.1005513, 3.086096, 1, 1, 1, 1, 1,
0.6519184, -0.2269702, 4.087628, 1, 1, 1, 1, 1,
0.653007, 1.344833, 0.004051874, 1, 1, 1, 1, 1,
0.6530257, -0.3522847, 1.822134, 1, 1, 1, 1, 1,
0.6575972, 0.6242521, 1.31762, 1, 1, 1, 1, 1,
0.6600369, -0.02117554, 2.131474, 1, 1, 1, 1, 1,
0.6750764, -0.1538183, 2.604252, 1, 1, 1, 1, 1,
0.6794251, 0.3402953, 1.040485, 1, 1, 1, 1, 1,
0.6865817, 1.3913, 0.8516279, 1, 1, 1, 1, 1,
0.6869459, 1.18891, 0.2056068, 1, 1, 1, 1, 1,
0.6893405, -1.507435, 4.779871, 1, 1, 1, 1, 1,
0.6894572, 0.4955538, 0.8663448, 0, 0, 1, 1, 1,
0.6907313, -0.3662574, 1.739332, 1, 0, 0, 1, 1,
0.6970696, 1.467604, -0.7108896, 1, 0, 0, 1, 1,
0.6983092, 0.1915707, 0.6151404, 1, 0, 0, 1, 1,
0.7009654, -0.1923338, 1.602029, 1, 0, 0, 1, 1,
0.7022325, 1.841232, 2.3374, 1, 0, 0, 1, 1,
0.7051949, 0.5597473, 0.3500099, 0, 0, 0, 1, 1,
0.710652, 1.164982, 0.6763706, 0, 0, 0, 1, 1,
0.7106785, -1.921808, 3.823637, 0, 0, 0, 1, 1,
0.7165198, 0.6842118, -0.03033291, 0, 0, 0, 1, 1,
0.719928, -0.6724268, 1.659435, 0, 0, 0, 1, 1,
0.7274512, -1.24133, 3.419884, 0, 0, 0, 1, 1,
0.7318629, -0.8103629, 1.604063, 0, 0, 0, 1, 1,
0.732786, -0.3097161, 2.799172, 1, 1, 1, 1, 1,
0.739959, 0.1849636, 1.889754, 1, 1, 1, 1, 1,
0.7433906, -1.507734, 3.721595, 1, 1, 1, 1, 1,
0.7444124, -0.615793, 0.990884, 1, 1, 1, 1, 1,
0.7447619, 0.2430032, 2.589147, 1, 1, 1, 1, 1,
0.7534021, -0.4106441, 1.115062, 1, 1, 1, 1, 1,
0.7556027, 0.2070785, 0.7469758, 1, 1, 1, 1, 1,
0.7579013, 0.5339481, 0.02521124, 1, 1, 1, 1, 1,
0.758704, 0.6149722, 1.365407, 1, 1, 1, 1, 1,
0.7687289, -0.7909487, 2.922271, 1, 1, 1, 1, 1,
0.7693739, -0.6169415, 2.212805, 1, 1, 1, 1, 1,
0.7696292, 0.5198899, 1.650288, 1, 1, 1, 1, 1,
0.7706556, -1.047542, 1.989274, 1, 1, 1, 1, 1,
0.7735119, 1.102819, 0.09505319, 1, 1, 1, 1, 1,
0.7780645, -1.058876, 1.10484, 1, 1, 1, 1, 1,
0.7802653, -1.155929, 3.803526, 0, 0, 1, 1, 1,
0.7843813, -0.8138828, 3.448358, 1, 0, 0, 1, 1,
0.7848201, -0.07387029, 2.918037, 1, 0, 0, 1, 1,
0.7849666, 0.2974574, 1.893809, 1, 0, 0, 1, 1,
0.7867081, -0.602226, 2.553918, 1, 0, 0, 1, 1,
0.7898948, 1.469681, -0.01643851, 1, 0, 0, 1, 1,
0.7905619, -1.627457, 2.746258, 0, 0, 0, 1, 1,
0.7925346, 0.2244516, 0.5516905, 0, 0, 0, 1, 1,
0.7945277, -0.2406931, 3.428528, 0, 0, 0, 1, 1,
0.7957805, 1.583112, 0.4354317, 0, 0, 0, 1, 1,
0.7980683, -1.681002, 2.998913, 0, 0, 0, 1, 1,
0.7993872, -0.9444137, 1.997324, 0, 0, 0, 1, 1,
0.8038748, 0.5415688, 2.176513, 0, 0, 0, 1, 1,
0.8069854, 1.178575, 1.448454, 1, 1, 1, 1, 1,
0.8106413, -0.004523004, 1.054676, 1, 1, 1, 1, 1,
0.8140532, 1.477981, -0.6662477, 1, 1, 1, 1, 1,
0.8160021, 0.4060995, 0.5573919, 1, 1, 1, 1, 1,
0.8201721, -0.6772058, 1.74326, 1, 1, 1, 1, 1,
0.8226829, 0.06159243, 1.63359, 1, 1, 1, 1, 1,
0.8260649, 0.1857743, 0.009730507, 1, 1, 1, 1, 1,
0.8284031, 1.57056, 1.885753, 1, 1, 1, 1, 1,
0.8343257, -0.2334878, 2.798106, 1, 1, 1, 1, 1,
0.8408116, -0.9789145, 1.886091, 1, 1, 1, 1, 1,
0.8552303, 0.03123651, 0.6566033, 1, 1, 1, 1, 1,
0.8620847, -1.521158, 4.444999, 1, 1, 1, 1, 1,
0.8668852, -0.205398, 2.650999, 1, 1, 1, 1, 1,
0.872359, 0.2231552, 2.680051, 1, 1, 1, 1, 1,
0.873445, -0.2867396, 2.947686, 1, 1, 1, 1, 1,
0.8747382, 0.4771265, 0.8484139, 0, 0, 1, 1, 1,
0.877158, 0.4779646, 0.5792897, 1, 0, 0, 1, 1,
0.878026, 1.796885, -0.9998419, 1, 0, 0, 1, 1,
0.8836213, -1.703232, 4.129608, 1, 0, 0, 1, 1,
0.8903971, -0.2335785, 2.543503, 1, 0, 0, 1, 1,
0.8926044, 1.272129, 0.05346535, 1, 0, 0, 1, 1,
0.8949929, -0.7673163, 1.482579, 0, 0, 0, 1, 1,
0.8954947, 0.2337618, 1.087615, 0, 0, 0, 1, 1,
0.89652, 2.042348, 1.738076, 0, 0, 0, 1, 1,
0.8996832, 1.126323, 0.7934386, 0, 0, 0, 1, 1,
0.8999146, -1.042585, -0.05987889, 0, 0, 0, 1, 1,
0.9004971, 0.4688734, 1.904382, 0, 0, 0, 1, 1,
0.9006848, -2.521819, 2.077777, 0, 0, 0, 1, 1,
0.9055909, 0.2985032, 1.137767, 1, 1, 1, 1, 1,
0.9066662, -1.124333, 1.566985, 1, 1, 1, 1, 1,
0.9067899, 0.03244224, -0.6706769, 1, 1, 1, 1, 1,
0.9105082, -1.199242, 1.276045, 1, 1, 1, 1, 1,
0.9125884, 1.638618, 0.6390755, 1, 1, 1, 1, 1,
0.9139608, 1.414481, 1.276157, 1, 1, 1, 1, 1,
0.9158614, 0.4285115, 1.087067, 1, 1, 1, 1, 1,
0.9161016, -0.7476243, 2.588604, 1, 1, 1, 1, 1,
0.9238945, 0.3187023, 1.689509, 1, 1, 1, 1, 1,
0.9299278, -0.2215546, 2.946615, 1, 1, 1, 1, 1,
0.9337583, -0.5581365, 1.778129, 1, 1, 1, 1, 1,
0.9450979, 0.6173917, 2.15686, 1, 1, 1, 1, 1,
0.9451292, 0.3899193, -0.1333473, 1, 1, 1, 1, 1,
0.9475772, 0.9782559, 0.2413406, 1, 1, 1, 1, 1,
0.9481938, -0.4611349, 1.720635, 1, 1, 1, 1, 1,
0.9524035, 0.09544226, 1.712346, 0, 0, 1, 1, 1,
0.9553296, 1.880846, 2.562329, 1, 0, 0, 1, 1,
0.9570891, -0.5978441, 1.407786, 1, 0, 0, 1, 1,
0.9640107, 0.9325759, 0.3059534, 1, 0, 0, 1, 1,
0.9728111, -0.6686226, 1.311761, 1, 0, 0, 1, 1,
0.9744097, -1.016978, 2.322248, 1, 0, 0, 1, 1,
0.9744269, 1.935791, -0.6899577, 0, 0, 0, 1, 1,
0.9748031, 0.5406392, 0.3307096, 0, 0, 0, 1, 1,
0.9771984, -0.8264905, 3.285812, 0, 0, 0, 1, 1,
0.9823703, -0.5927188, 2.173668, 0, 0, 0, 1, 1,
0.9838403, -1.657468, 4.958331, 0, 0, 0, 1, 1,
0.9920976, 1.185819, 0.03553737, 0, 0, 0, 1, 1,
0.995394, -1.628816, 1.86187, 0, 0, 0, 1, 1,
0.9961751, -0.2135725, 2.651229, 1, 1, 1, 1, 1,
1.007247, 1.076849, 2.946197, 1, 1, 1, 1, 1,
1.008685, -0.609485, 1.214677, 1, 1, 1, 1, 1,
1.014238, -0.464292, 0.8431524, 1, 1, 1, 1, 1,
1.018792, 1.324004, -0.5014463, 1, 1, 1, 1, 1,
1.020733, 0.4802617, 0.02499712, 1, 1, 1, 1, 1,
1.022878, 0.9971703, 1.022734, 1, 1, 1, 1, 1,
1.023125, 0.6696988, 1.610607, 1, 1, 1, 1, 1,
1.023337, 1.189369, -0.3030526, 1, 1, 1, 1, 1,
1.023691, -0.9601332, 1.803381, 1, 1, 1, 1, 1,
1.034332, 0.5110723, -0.05933626, 1, 1, 1, 1, 1,
1.043545, -0.1364176, 1.359034, 1, 1, 1, 1, 1,
1.044647, 0.515379, 0.6215919, 1, 1, 1, 1, 1,
1.063575, -0.6287345, 1.858195, 1, 1, 1, 1, 1,
1.073109, -0.140999, 1.524287, 1, 1, 1, 1, 1,
1.074354, -0.3973186, 3.009169, 0, 0, 1, 1, 1,
1.074976, -1.049761, 4.115361, 1, 0, 0, 1, 1,
1.076015, -0.9549496, 2.172704, 1, 0, 0, 1, 1,
1.076271, -0.2829515, 2.763601, 1, 0, 0, 1, 1,
1.087543, -0.2201396, 2.739064, 1, 0, 0, 1, 1,
1.088354, -1.070356, 2.193395, 1, 0, 0, 1, 1,
1.089028, -0.3349791, -0.3688907, 0, 0, 0, 1, 1,
1.092859, 1.23525, 1.526732, 0, 0, 0, 1, 1,
1.096486, 0.7968783, 1.386725, 0, 0, 0, 1, 1,
1.098642, 1.052229, 1.675423, 0, 0, 0, 1, 1,
1.103612, 0.3578738, -0.5070801, 0, 0, 0, 1, 1,
1.105455, 0.9499977, 1.286755, 0, 0, 0, 1, 1,
1.115007, 1.142235, 2.366062, 0, 0, 0, 1, 1,
1.116379, -0.6089412, 1.34935, 1, 1, 1, 1, 1,
1.119477, -3.790392, 3.952981, 1, 1, 1, 1, 1,
1.122264, 0.5556401, 0.7070555, 1, 1, 1, 1, 1,
1.124011, 0.4260676, 1.495177, 1, 1, 1, 1, 1,
1.129995, -2.451418, 2.426819, 1, 1, 1, 1, 1,
1.13035, -1.908538, 2.332721, 1, 1, 1, 1, 1,
1.131179, -0.9001265, 2.331768, 1, 1, 1, 1, 1,
1.133006, -0.3174218, 2.115026, 1, 1, 1, 1, 1,
1.134724, 2.751395, -0.1110445, 1, 1, 1, 1, 1,
1.138154, -0.3905759, 2.275638, 1, 1, 1, 1, 1,
1.162553, -0.512246, 3.761478, 1, 1, 1, 1, 1,
1.164215, 0.3544573, 1.521311, 1, 1, 1, 1, 1,
1.171444, -1.33847, 1.154504, 1, 1, 1, 1, 1,
1.173001, -1.393915, 4.966588, 1, 1, 1, 1, 1,
1.174622, 0.1266443, 3.314709, 1, 1, 1, 1, 1,
1.183322, 0.8035294, 0.6115439, 0, 0, 1, 1, 1,
1.18683, -0.3002586, 0.6376467, 1, 0, 0, 1, 1,
1.188211, 0.3742368, -0.6587151, 1, 0, 0, 1, 1,
1.196597, 0.1585597, 2.723441, 1, 0, 0, 1, 1,
1.197757, 1.396529, 0.2225113, 1, 0, 0, 1, 1,
1.198571, 1.177743, -0.5077988, 1, 0, 0, 1, 1,
1.199334, 0.7276342, 4.648855, 0, 0, 0, 1, 1,
1.211592, -1.500386, 2.440494, 0, 0, 0, 1, 1,
1.220386, 1.008802, -0.1999641, 0, 0, 0, 1, 1,
1.221182, 0.6942714, 0.7257139, 0, 0, 0, 1, 1,
1.224258, 0.2838439, 0.9498667, 0, 0, 0, 1, 1,
1.228004, 0.8093855, 1.314984, 0, 0, 0, 1, 1,
1.232415, -1.219579, 1.583758, 0, 0, 0, 1, 1,
1.243952, -2.506472, 3.224754, 1, 1, 1, 1, 1,
1.247241, -0.7747952, 0.4848581, 1, 1, 1, 1, 1,
1.254776, 1.57962, 1.0673, 1, 1, 1, 1, 1,
1.258713, -1.242127, 4.377209, 1, 1, 1, 1, 1,
1.26456, -0.403336, 1.928139, 1, 1, 1, 1, 1,
1.267135, 1.129438, -1.569222, 1, 1, 1, 1, 1,
1.27132, -0.6056338, 2.498225, 1, 1, 1, 1, 1,
1.28022, -1.005794, -0.9848719, 1, 1, 1, 1, 1,
1.281438, -0.6417105, 0.5334575, 1, 1, 1, 1, 1,
1.282289, -1.181523, 2.731144, 1, 1, 1, 1, 1,
1.316808, 0.8912806, 1.203935, 1, 1, 1, 1, 1,
1.320174, 1.894741, 1.322042, 1, 1, 1, 1, 1,
1.327102, -0.3783517, 1.198626, 1, 1, 1, 1, 1,
1.328706, 0.6455488, 2.816138, 1, 1, 1, 1, 1,
1.332132, 2.208488, 0.5545947, 1, 1, 1, 1, 1,
1.334634, 0.06188802, 1.088086, 0, 0, 1, 1, 1,
1.335268, 0.09565715, 1.378925, 1, 0, 0, 1, 1,
1.345037, 2.596368, 0.6775324, 1, 0, 0, 1, 1,
1.348055, -0.537845, 1.744531, 1, 0, 0, 1, 1,
1.348264, 1.849327, 0.6221288, 1, 0, 0, 1, 1,
1.352044, 0.4891266, 1.167502, 1, 0, 0, 1, 1,
1.352767, 0.4983436, 1.947748, 0, 0, 0, 1, 1,
1.355716, 0.7009833, 0.2619668, 0, 0, 0, 1, 1,
1.35799, -0.2595446, 2.553004, 0, 0, 0, 1, 1,
1.36073, -2.056847, 3.430798, 0, 0, 0, 1, 1,
1.362095, 0.03712232, 2.000739, 0, 0, 0, 1, 1,
1.371327, -0.1693621, 2.255566, 0, 0, 0, 1, 1,
1.37656, -0.131473, 0.8711699, 0, 0, 0, 1, 1,
1.377165, 0.4377019, 1.022956, 1, 1, 1, 1, 1,
1.383201, 1.270336, 0.7725052, 1, 1, 1, 1, 1,
1.38379, 1.218406, 1.54968, 1, 1, 1, 1, 1,
1.384018, -1.809997, 2.604778, 1, 1, 1, 1, 1,
1.386559, -0.4366989, 2.018132, 1, 1, 1, 1, 1,
1.395468, -1.521066, 1.777383, 1, 1, 1, 1, 1,
1.40357, -1.149482, 3.434878, 1, 1, 1, 1, 1,
1.413436, 0.3666151, 1.051738, 1, 1, 1, 1, 1,
1.41819, 0.1648879, 1.972242, 1, 1, 1, 1, 1,
1.425003, -0.4868183, 2.288741, 1, 1, 1, 1, 1,
1.441929, -0.206147, 1.641276, 1, 1, 1, 1, 1,
1.443933, -0.1438077, 1.69365, 1, 1, 1, 1, 1,
1.455628, 0.2162036, 0.8499852, 1, 1, 1, 1, 1,
1.483497, 0.0004252589, 2.224567, 1, 1, 1, 1, 1,
1.484064, -1.29791, 2.574433, 1, 1, 1, 1, 1,
1.488963, -0.5417601, -0.9294183, 0, 0, 1, 1, 1,
1.489861, -1.937035, 3.910417, 1, 0, 0, 1, 1,
1.508734, -0.2789414, 0.9224514, 1, 0, 0, 1, 1,
1.50889, 1.035766, 1.331074, 1, 0, 0, 1, 1,
1.518956, 1.611568, 2.283003, 1, 0, 0, 1, 1,
1.534081, 2.099084, 0.4913649, 1, 0, 0, 1, 1,
1.534103, 2.311155, 0.1670983, 0, 0, 0, 1, 1,
1.562481, -0.344438, 3.110802, 0, 0, 0, 1, 1,
1.568475, -1.459855, 2.985513, 0, 0, 0, 1, 1,
1.571539, 1.054051, 0.8681881, 0, 0, 0, 1, 1,
1.577025, 1.330605, 1.286699, 0, 0, 0, 1, 1,
1.590447, 0.1114273, 3.355712, 0, 0, 0, 1, 1,
1.59473, 0.7634864, 1.956784, 0, 0, 0, 1, 1,
1.594952, 0.7275674, -0.132517, 1, 1, 1, 1, 1,
1.595029, 2.241589, -0.5206622, 1, 1, 1, 1, 1,
1.595158, -0.4629221, 1.791321, 1, 1, 1, 1, 1,
1.600784, -0.9644152, 3.819262, 1, 1, 1, 1, 1,
1.614424, -0.2315575, 1.255313, 1, 1, 1, 1, 1,
1.622896, -0.1681513, 0.9395896, 1, 1, 1, 1, 1,
1.624614, 0.3676015, 0.632773, 1, 1, 1, 1, 1,
1.631248, 0.9210072, 1.348451, 1, 1, 1, 1, 1,
1.650687, -0.2755403, 2.395018, 1, 1, 1, 1, 1,
1.654016, -1.164569, 4.014451, 1, 1, 1, 1, 1,
1.654501, -0.04907241, 1.92579, 1, 1, 1, 1, 1,
1.663052, 0.8508369, 2.097177, 1, 1, 1, 1, 1,
1.676984, 1.760879, 1.381997, 1, 1, 1, 1, 1,
1.681037, -0.1644661, 3.578573, 1, 1, 1, 1, 1,
1.6826, 1.320315, -1.285745, 1, 1, 1, 1, 1,
1.716029, -0.6058435, 1.556221, 0, 0, 1, 1, 1,
1.721133, 0.2360798, 0.6145396, 1, 0, 0, 1, 1,
1.726765, 0.6621258, 1.332624, 1, 0, 0, 1, 1,
1.727678, -0.1851467, 2.346262, 1, 0, 0, 1, 1,
1.736424, 0.1639853, 3.037329, 1, 0, 0, 1, 1,
1.738174, 0.1983775, 1.332698, 1, 0, 0, 1, 1,
1.748322, -0.134396, 0.9936194, 0, 0, 0, 1, 1,
1.752183, -0.822203, 0.7345904, 0, 0, 0, 1, 1,
1.764534, -0.464075, 2.580836, 0, 0, 0, 1, 1,
1.787456, 0.1881732, 2.864993, 0, 0, 0, 1, 1,
1.791767, 0.7213752, 1.080891, 0, 0, 0, 1, 1,
1.81649, -1.289441, 2.640216, 0, 0, 0, 1, 1,
1.823346, 0.3403787, 1.736131, 0, 0, 0, 1, 1,
1.836981, 0.04945965, 1.623951, 1, 1, 1, 1, 1,
1.849641, -1.220194, 3.510406, 1, 1, 1, 1, 1,
1.880219, 1.495354, 0.6189948, 1, 1, 1, 1, 1,
1.881218, -0.8802857, 2.784327, 1, 1, 1, 1, 1,
1.903529, -0.8959542, 4.054623, 1, 1, 1, 1, 1,
1.907345, -2.122025, 3.960279, 1, 1, 1, 1, 1,
1.909269, -0.8009909, 2.461525, 1, 1, 1, 1, 1,
1.909963, -1.166514, 2.1451, 1, 1, 1, 1, 1,
1.912006, 0.9205742, -0.1313908, 1, 1, 1, 1, 1,
1.939488, -1.117602, 4.164378, 1, 1, 1, 1, 1,
1.976762, -0.4113988, 2.7643, 1, 1, 1, 1, 1,
1.990532, 1.037179, 0.03016034, 1, 1, 1, 1, 1,
1.995807, 0.367211, 3.083357, 1, 1, 1, 1, 1,
2.029884, -0.2176699, 1.454312, 1, 1, 1, 1, 1,
2.136666, 0.5076488, -0.9662712, 1, 1, 1, 1, 1,
2.137504, 1.817113, 0.5727171, 0, 0, 1, 1, 1,
2.147925, 0.4421276, 1.506768, 1, 0, 0, 1, 1,
2.239379, 0.03250228, 1.660224, 1, 0, 0, 1, 1,
2.240899, 1.35168, 3.652099, 1, 0, 0, 1, 1,
2.25399, 0.155618, 1.3689, 1, 0, 0, 1, 1,
2.276337, 0.3705514, 0.7555236, 1, 0, 0, 1, 1,
2.285577, 0.8465372, 1.87722, 0, 0, 0, 1, 1,
2.317385, 1.174508, 1.184344, 0, 0, 0, 1, 1,
2.405884, 0.9723638, 1.265999, 0, 0, 0, 1, 1,
2.4171, -0.2111437, 1.276249, 0, 0, 0, 1, 1,
2.431167, -0.9479732, 1.6557, 0, 0, 0, 1, 1,
2.51778, 0.9848343, 0.6065651, 0, 0, 0, 1, 1,
2.551248, -1.115328, 2.324748, 0, 0, 0, 1, 1,
2.623991, 0.0359848, 0.4770353, 1, 1, 1, 1, 1,
2.63122, -0.2563621, 1.891464, 1, 1, 1, 1, 1,
2.730905, 0.2590915, 2.289954, 1, 1, 1, 1, 1,
2.781285, -1.14838, 1.722406, 1, 1, 1, 1, 1,
2.833428, -0.2937329, 2.724865, 1, 1, 1, 1, 1,
3.160964, -0.3510328, 3.866014, 1, 1, 1, 1, 1,
3.165089, 0.9475409, 0.7168114, 1, 1, 1, 1, 1
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
var radius = 9.898808;
var distance = 34.76915;
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
mvMatrix.translate( -0.07770228, 0.3638253, -0.4397123 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76915);
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
