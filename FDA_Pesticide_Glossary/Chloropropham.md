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
-3.45697, -0.01018515, -0.6501895, 1, 0, 0, 1,
-2.924641, 1.126938, -1.126666, 1, 0.007843138, 0, 1,
-2.913572, -0.4846381, -1.071673, 1, 0.01176471, 0, 1,
-2.817816, 1.020797, -0.7069138, 1, 0.01960784, 0, 1,
-2.797239, -1.010332, -2.275256, 1, 0.02352941, 0, 1,
-2.767593, 2.008498, -2.403524, 1, 0.03137255, 0, 1,
-2.615914, 0.1133216, -0.5242007, 1, 0.03529412, 0, 1,
-2.59812, 0.5155289, -0.9797841, 1, 0.04313726, 0, 1,
-2.590568, 1.711207, -0.5782598, 1, 0.04705882, 0, 1,
-2.56576, 1.100176, -0.9682829, 1, 0.05490196, 0, 1,
-2.560845, -1.442973, -3.534178, 1, 0.05882353, 0, 1,
-2.552327, 1.457496, -1.347323, 1, 0.06666667, 0, 1,
-2.462795, -0.5680798, -1.337382, 1, 0.07058824, 0, 1,
-2.428269, -1.445574, -1.323485, 1, 0.07843138, 0, 1,
-2.345689, -1.631352, -1.782109, 1, 0.08235294, 0, 1,
-2.313027, -0.1563449, -1.735004, 1, 0.09019608, 0, 1,
-2.294347, 0.5704635, -1.786532, 1, 0.09411765, 0, 1,
-2.234027, -0.3316553, -0.8801551, 1, 0.1019608, 0, 1,
-2.21349, -0.9840182, -3.098669, 1, 0.1098039, 0, 1,
-2.152676, -0.8347577, -1.940473, 1, 0.1137255, 0, 1,
-2.124033, -0.891708, -2.114066, 1, 0.1215686, 0, 1,
-2.123526, -2.290939, -3.857141, 1, 0.1254902, 0, 1,
-2.069898, -0.622602, -0.9106723, 1, 0.1333333, 0, 1,
-2.060832, 1.138607, -0.7436252, 1, 0.1372549, 0, 1,
-2.04457, 0.8862509, -0.4672959, 1, 0.145098, 0, 1,
-2.028621, -1.60913, -3.368821, 1, 0.1490196, 0, 1,
-2.025415, -1.396482, -1.35394, 1, 0.1568628, 0, 1,
-2.010355, -0.01699563, -2.032394, 1, 0.1607843, 0, 1,
-2.00916, 0.4959702, -0.1484838, 1, 0.1686275, 0, 1,
-1.981688, 0.7176412, -0.3368123, 1, 0.172549, 0, 1,
-1.980537, 1.009249, 0.1673153, 1, 0.1803922, 0, 1,
-1.941759, 0.4922285, -0.262078, 1, 0.1843137, 0, 1,
-1.933518, 0.7124438, -1.347122, 1, 0.1921569, 0, 1,
-1.897392, -0.1603394, -3.564078, 1, 0.1960784, 0, 1,
-1.8966, 1.026147, -0.72695, 1, 0.2039216, 0, 1,
-1.868994, -1.088164, 0.7703818, 1, 0.2117647, 0, 1,
-1.863985, 0.6753171, -0.3873253, 1, 0.2156863, 0, 1,
-1.860426, 0.1226839, 0.4741213, 1, 0.2235294, 0, 1,
-1.855304, -2.646932, -1.666171, 1, 0.227451, 0, 1,
-1.854419, -0.8619897, -2.121103, 1, 0.2352941, 0, 1,
-1.824809, -0.9379427, -1.512448, 1, 0.2392157, 0, 1,
-1.817362, 1.014647, -1.267061, 1, 0.2470588, 0, 1,
-1.814609, -0.9107243, -2.076754, 1, 0.2509804, 0, 1,
-1.808596, 1.354603, -0.208411, 1, 0.2588235, 0, 1,
-1.800719, -1.747326, -3.408334, 1, 0.2627451, 0, 1,
-1.797956, 0.01936217, -1.599556, 1, 0.2705882, 0, 1,
-1.777528, 0.2309667, -0.9187731, 1, 0.2745098, 0, 1,
-1.777269, 0.3147614, -2.35856, 1, 0.282353, 0, 1,
-1.771905, 0.4134095, -2.24771, 1, 0.2862745, 0, 1,
-1.759688, -1.049322, -0.43649, 1, 0.2941177, 0, 1,
-1.749871, 0.1483355, -0.3305873, 1, 0.3019608, 0, 1,
-1.744138, 0.420805, -0.7016622, 1, 0.3058824, 0, 1,
-1.716894, -0.1105568, -1.89289, 1, 0.3137255, 0, 1,
-1.716004, -0.3357662, -1.246692, 1, 0.3176471, 0, 1,
-1.695039, 0.6888814, 0.7474572, 1, 0.3254902, 0, 1,
-1.679217, -0.9402826, -2.107138, 1, 0.3294118, 0, 1,
-1.671244, 0.2398026, -2.697536, 1, 0.3372549, 0, 1,
-1.671078, -0.5695911, -0.9872893, 1, 0.3411765, 0, 1,
-1.668276, 1.369368, 1.205347, 1, 0.3490196, 0, 1,
-1.66216, 1.809477, -0.3677184, 1, 0.3529412, 0, 1,
-1.656131, -0.02805784, -2.665077, 1, 0.3607843, 0, 1,
-1.643733, 0.05949468, -1.594004, 1, 0.3647059, 0, 1,
-1.641128, -0.1712881, -2.093778, 1, 0.372549, 0, 1,
-1.638424, 0.9647352, 0.1817027, 1, 0.3764706, 0, 1,
-1.631644, 0.5852288, -2.288362, 1, 0.3843137, 0, 1,
-1.616301, 2.588466, 1.038336, 1, 0.3882353, 0, 1,
-1.604294, 1.647967, -2.246316, 1, 0.3960784, 0, 1,
-1.597219, 1.345901, -2.368172, 1, 0.4039216, 0, 1,
-1.577052, -1.063745, -2.119445, 1, 0.4078431, 0, 1,
-1.566582, -1.08505, -2.476171, 1, 0.4156863, 0, 1,
-1.565885, -0.09479514, -1.146963, 1, 0.4196078, 0, 1,
-1.562796, -0.9131967, -2.726582, 1, 0.427451, 0, 1,
-1.562183, 0.444502, -0.4756444, 1, 0.4313726, 0, 1,
-1.559176, -0.1149282, -1.342234, 1, 0.4392157, 0, 1,
-1.557568, 1.059269, -0.7119896, 1, 0.4431373, 0, 1,
-1.545186, 0.8769044, -1.17667, 1, 0.4509804, 0, 1,
-1.5425, -0.6619492, -1.567395, 1, 0.454902, 0, 1,
-1.534718, -0.1153532, -2.684546, 1, 0.4627451, 0, 1,
-1.533987, 0.8981631, -2.842693, 1, 0.4666667, 0, 1,
-1.513291, 0.8153293, -0.6502479, 1, 0.4745098, 0, 1,
-1.511572, 0.6469943, -1.105379, 1, 0.4784314, 0, 1,
-1.470271, -0.6949963, -2.959043, 1, 0.4862745, 0, 1,
-1.455311, 0.5030906, -1.10125, 1, 0.4901961, 0, 1,
-1.452559, 0.1675012, -3.761379, 1, 0.4980392, 0, 1,
-1.446855, 1.276242, -0.4591086, 1, 0.5058824, 0, 1,
-1.421181, -0.8169087, -1.991788, 1, 0.509804, 0, 1,
-1.413647, 0.0774233, -1.864381, 1, 0.5176471, 0, 1,
-1.411712, -1.447949, -2.932752, 1, 0.5215687, 0, 1,
-1.409506, -0.004714453, -3.345001, 1, 0.5294118, 0, 1,
-1.398385, -1.063983, -0.5712572, 1, 0.5333334, 0, 1,
-1.394721, -0.3008792, -1.117119, 1, 0.5411765, 0, 1,
-1.385599, -1.399423, -2.146626, 1, 0.5450981, 0, 1,
-1.385223, -0.738109, -1.95286, 1, 0.5529412, 0, 1,
-1.38368, 1.202832, -1.080628, 1, 0.5568628, 0, 1,
-1.380841, 1.041198, 1.732657, 1, 0.5647059, 0, 1,
-1.376824, -0.02756052, -2.853468, 1, 0.5686275, 0, 1,
-1.374605, 1.283546, 0.3254784, 1, 0.5764706, 0, 1,
-1.369197, -0.08393699, -3.004545, 1, 0.5803922, 0, 1,
-1.351144, 0.3800296, -0.4492781, 1, 0.5882353, 0, 1,
-1.332189, 0.9161067, 0.5803329, 1, 0.5921569, 0, 1,
-1.320711, 1.304452, -0.7401405, 1, 0.6, 0, 1,
-1.318534, 0.2258369, -0.9619988, 1, 0.6078432, 0, 1,
-1.318215, -0.6339269, -3.113161, 1, 0.6117647, 0, 1,
-1.318018, 1.872229, 0.4917437, 1, 0.6196079, 0, 1,
-1.305223, -1.509444, -4.082494, 1, 0.6235294, 0, 1,
-1.280432, -0.3344586, -1.107163, 1, 0.6313726, 0, 1,
-1.278613, 0.8040695, 1.02992, 1, 0.6352941, 0, 1,
-1.275235, -1.013462, -2.128127, 1, 0.6431373, 0, 1,
-1.272149, -0.4316289, -2.623516, 1, 0.6470588, 0, 1,
-1.270143, -0.8335091, -2.024132, 1, 0.654902, 0, 1,
-1.267356, 0.9044317, -1.573962, 1, 0.6588235, 0, 1,
-1.261532, -0.7479252, -0.952015, 1, 0.6666667, 0, 1,
-1.258326, -0.2022986, -2.567753, 1, 0.6705883, 0, 1,
-1.252625, -1.275712, -1.052637, 1, 0.6784314, 0, 1,
-1.250074, -0.2508255, -3.777827, 1, 0.682353, 0, 1,
-1.249571, -1.138715, -3.970495, 1, 0.6901961, 0, 1,
-1.248054, -0.3025297, -1.279594, 1, 0.6941177, 0, 1,
-1.247833, 2.109286, -4.369287, 1, 0.7019608, 0, 1,
-1.237205, 0.59515, -1.292557, 1, 0.7098039, 0, 1,
-1.228606, 1.174629, 0.2666523, 1, 0.7137255, 0, 1,
-1.227693, 0.5919222, -1.703592, 1, 0.7215686, 0, 1,
-1.214712, -1.273733, -1.655371, 1, 0.7254902, 0, 1,
-1.211709, 1.338505, -0.5111439, 1, 0.7333333, 0, 1,
-1.211417, 1.222896, -0.6577333, 1, 0.7372549, 0, 1,
-1.202338, -0.2575698, -0.9282992, 1, 0.7450981, 0, 1,
-1.199322, 0.006210409, -1.942946, 1, 0.7490196, 0, 1,
-1.193813, -0.1502508, -2.531433, 1, 0.7568628, 0, 1,
-1.192636, 0.7826241, -1.019921, 1, 0.7607843, 0, 1,
-1.188671, 0.5226153, -1.703055, 1, 0.7686275, 0, 1,
-1.184621, -1.384341, -3.818848, 1, 0.772549, 0, 1,
-1.175695, 1.467169, -0.5865586, 1, 0.7803922, 0, 1,
-1.169505, -0.3396332, -0.9341567, 1, 0.7843137, 0, 1,
-1.167179, 1.28302, -0.957397, 1, 0.7921569, 0, 1,
-1.166343, -0.4679752, -1.674759, 1, 0.7960784, 0, 1,
-1.157261, -1.045931, -3.0603, 1, 0.8039216, 0, 1,
-1.148513, 0.1355696, -2.415025, 1, 0.8117647, 0, 1,
-1.142338, 0.2300598, -2.250293, 1, 0.8156863, 0, 1,
-1.140928, -1.253464, -4.177712, 1, 0.8235294, 0, 1,
-1.140595, -1.627697, -3.437541, 1, 0.827451, 0, 1,
-1.13253, -2.501722, -1.799356, 1, 0.8352941, 0, 1,
-1.12601, 0.4950004, -1.869822, 1, 0.8392157, 0, 1,
-1.123245, 0.6987466, -1.199008, 1, 0.8470588, 0, 1,
-1.119129, -0.2104282, -2.855202, 1, 0.8509804, 0, 1,
-1.118363, 1.798542, -2.047304, 1, 0.8588235, 0, 1,
-1.115735, 0.9747321, -1.903238, 1, 0.8627451, 0, 1,
-1.113459, 0.6343145, -1.170427, 1, 0.8705882, 0, 1,
-1.108983, 0.1186391, -1.819215, 1, 0.8745098, 0, 1,
-1.106193, -0.03596211, -1.962941, 1, 0.8823529, 0, 1,
-1.104597, 0.3240044, -1.566284, 1, 0.8862745, 0, 1,
-1.101972, -0.5689057, -3.227447, 1, 0.8941177, 0, 1,
-1.098316, 0.8930181, -0.9810988, 1, 0.8980392, 0, 1,
-1.093219, 0.9130061, -1.25146, 1, 0.9058824, 0, 1,
-1.091413, -0.5084951, -3.516749, 1, 0.9137255, 0, 1,
-1.085191, 0.1936294, -0.07890432, 1, 0.9176471, 0, 1,
-1.083946, -0.1972454, -1.459704, 1, 0.9254902, 0, 1,
-1.070269, -0.2318912, -2.6362, 1, 0.9294118, 0, 1,
-1.069307, 1.488855, -1.247348, 1, 0.9372549, 0, 1,
-1.066468, -0.000918526, -2.306437, 1, 0.9411765, 0, 1,
-1.065911, -1.191321, -2.873675, 1, 0.9490196, 0, 1,
-1.060276, 0.2870244, -2.123449, 1, 0.9529412, 0, 1,
-1.060022, 0.4543516, -1.301552, 1, 0.9607843, 0, 1,
-1.040103, 0.5067071, -1.196426, 1, 0.9647059, 0, 1,
-1.039979, 0.3793167, -1.761103, 1, 0.972549, 0, 1,
-1.039071, 0.3358243, -0.8688301, 1, 0.9764706, 0, 1,
-1.035735, 0.3529035, -1.13889, 1, 0.9843137, 0, 1,
-1.031809, 0.1978729, -1.342907, 1, 0.9882353, 0, 1,
-1.023548, 1.05275, -0.09740487, 1, 0.9960784, 0, 1,
-1.014656, -0.01719395, -0.9803313, 0.9960784, 1, 0, 1,
-1.014035, -0.2238451, -1.726634, 0.9921569, 1, 0, 1,
-1.012828, -0.5606515, -1.740832, 0.9843137, 1, 0, 1,
-1.011847, 0.9699658, -1.969654, 0.9803922, 1, 0, 1,
-1.011308, 1.045634, -1.969532, 0.972549, 1, 0, 1,
-1.009076, -1.593731, -4.026806, 0.9686275, 1, 0, 1,
-1.005657, -0.5721903, -2.170143, 0.9607843, 1, 0, 1,
-0.9934185, 0.02401203, -0.4178176, 0.9568627, 1, 0, 1,
-0.9896898, 0.05072346, -2.23648, 0.9490196, 1, 0, 1,
-0.9892456, -0.4894031, -2.246917, 0.945098, 1, 0, 1,
-0.9871306, -0.9446262, -0.6642479, 0.9372549, 1, 0, 1,
-0.9859402, 0.2310723, -1.113249, 0.9333333, 1, 0, 1,
-0.98509, -1.973378, -2.97079, 0.9254902, 1, 0, 1,
-0.9837286, -0.6767113, -2.762041, 0.9215686, 1, 0, 1,
-0.9836383, -0.004667026, -0.3468626, 0.9137255, 1, 0, 1,
-0.9769353, -1.04404, -3.214594, 0.9098039, 1, 0, 1,
-0.9767183, -0.3102109, -2.110697, 0.9019608, 1, 0, 1,
-0.9713041, -0.4746628, -1.560292, 0.8941177, 1, 0, 1,
-0.970997, 0.7215695, -0.8034691, 0.8901961, 1, 0, 1,
-0.9672731, 2.128551, 0.6136888, 0.8823529, 1, 0, 1,
-0.9633243, 0.6571248, 0.4286058, 0.8784314, 1, 0, 1,
-0.9519165, -1.03586, -2.137425, 0.8705882, 1, 0, 1,
-0.9476511, 1.011546, 0.08636349, 0.8666667, 1, 0, 1,
-0.9458571, 0.7638072, -0.5858384, 0.8588235, 1, 0, 1,
-0.9408754, -1.508707, -3.327841, 0.854902, 1, 0, 1,
-0.9349993, -0.8929572, -2.324463, 0.8470588, 1, 0, 1,
-0.9315715, 0.9464467, 0.2248733, 0.8431373, 1, 0, 1,
-0.9296904, -0.7922099, -2.960157, 0.8352941, 1, 0, 1,
-0.9260014, 0.2955445, -1.542277, 0.8313726, 1, 0, 1,
-0.924213, 1.418189, -0.1815472, 0.8235294, 1, 0, 1,
-0.9228625, 0.0421247, -1.385139, 0.8196079, 1, 0, 1,
-0.9150409, -1.590695, -2.73359, 0.8117647, 1, 0, 1,
-0.9149553, -2.470219, -2.553599, 0.8078431, 1, 0, 1,
-0.9013441, -0.6732158, -1.86523, 0.8, 1, 0, 1,
-0.9005355, 0.4419617, -1.310272, 0.7921569, 1, 0, 1,
-0.8978968, 0.9586461, -1.553376, 0.7882353, 1, 0, 1,
-0.8946204, 1.680517, -1.014117, 0.7803922, 1, 0, 1,
-0.8904744, 0.6055764, 0.4577014, 0.7764706, 1, 0, 1,
-0.8867506, -0.3855113, -0.08120371, 0.7686275, 1, 0, 1,
-0.8840588, -1.131139, -2.684449, 0.7647059, 1, 0, 1,
-0.8780788, 1.095343, -2.032546, 0.7568628, 1, 0, 1,
-0.8745339, 1.318678, 1.682931, 0.7529412, 1, 0, 1,
-0.8697761, 0.9046267, -1.99606, 0.7450981, 1, 0, 1,
-0.857133, -1.049328, 0.2073298, 0.7411765, 1, 0, 1,
-0.8530768, -2.071043, -1.740405, 0.7333333, 1, 0, 1,
-0.8374724, -2.057466, -1.31167, 0.7294118, 1, 0, 1,
-0.8366286, -1.34056, -1.960752, 0.7215686, 1, 0, 1,
-0.8282732, -1.52258, -0.3862484, 0.7176471, 1, 0, 1,
-0.8218662, 0.2322359, -2.384781, 0.7098039, 1, 0, 1,
-0.8208499, -0.6424393, -2.77377, 0.7058824, 1, 0, 1,
-0.8205689, -0.4029362, -1.5896, 0.6980392, 1, 0, 1,
-0.8201885, 3.722514, -0.9961948, 0.6901961, 1, 0, 1,
-0.8100656, 1.386995, -0.6894906, 0.6862745, 1, 0, 1,
-0.8066524, -1.215255, -2.259925, 0.6784314, 1, 0, 1,
-0.8065853, 0.01517741, -2.952966, 0.6745098, 1, 0, 1,
-0.7982373, -0.2302801, -1.124387, 0.6666667, 1, 0, 1,
-0.7971154, 0.9943898, -0.9570422, 0.6627451, 1, 0, 1,
-0.7950979, -1.591065, -1.031296, 0.654902, 1, 0, 1,
-0.7938375, -0.09913946, -2.412817, 0.6509804, 1, 0, 1,
-0.7861838, -0.6463999, -1.590069, 0.6431373, 1, 0, 1,
-0.7842357, 2.89454, -0.3773876, 0.6392157, 1, 0, 1,
-0.782697, -1.513872, -2.32965, 0.6313726, 1, 0, 1,
-0.7822956, 1.078192, -0.4848105, 0.627451, 1, 0, 1,
-0.7774265, 0.7866587, -0.9667195, 0.6196079, 1, 0, 1,
-0.7734991, -0.7409765, -1.94461, 0.6156863, 1, 0, 1,
-0.772388, 0.7392628, -1.015021, 0.6078432, 1, 0, 1,
-0.7721554, -0.5724218, -2.207286, 0.6039216, 1, 0, 1,
-0.7554228, -1.872691, -2.027503, 0.5960785, 1, 0, 1,
-0.7535327, -0.3310253, -2.322828, 0.5882353, 1, 0, 1,
-0.753294, -1.086265, -3.291912, 0.5843138, 1, 0, 1,
-0.7531171, 1.149809, -1.026832, 0.5764706, 1, 0, 1,
-0.7526266, 0.5811552, -1.24046, 0.572549, 1, 0, 1,
-0.7473532, 1.789973, -0.0315046, 0.5647059, 1, 0, 1,
-0.7348427, 1.582056, -1.732263, 0.5607843, 1, 0, 1,
-0.7331097, 0.423383, -0.226905, 0.5529412, 1, 0, 1,
-0.7306741, 1.476045, -0.16474, 0.5490196, 1, 0, 1,
-0.7300895, 0.9823939, -1.542133, 0.5411765, 1, 0, 1,
-0.7249498, 0.4459942, -1.906277, 0.5372549, 1, 0, 1,
-0.7193737, -0.1219698, -1.291543, 0.5294118, 1, 0, 1,
-0.7102922, -0.4709307, -1.021959, 0.5254902, 1, 0, 1,
-0.7085131, 1.283549, -1.060227, 0.5176471, 1, 0, 1,
-0.7069011, 0.1919521, 0.484416, 0.5137255, 1, 0, 1,
-0.6978195, 1.198451, -1.728397, 0.5058824, 1, 0, 1,
-0.6961612, 0.6172826, -0.5921444, 0.5019608, 1, 0, 1,
-0.6922255, 1.736775, 0.9888256, 0.4941176, 1, 0, 1,
-0.6862667, 0.3904364, 0.4391972, 0.4862745, 1, 0, 1,
-0.685051, -0.4590909, -1.531481, 0.4823529, 1, 0, 1,
-0.6820694, -0.09638104, -1.175476, 0.4745098, 1, 0, 1,
-0.6791741, -2.241498, 0.1066878, 0.4705882, 1, 0, 1,
-0.6783377, -1.231481, -3.649387, 0.4627451, 1, 0, 1,
-0.6761799, 1.091524, 0.1394549, 0.4588235, 1, 0, 1,
-0.6747437, 0.8414199, -0.6004334, 0.4509804, 1, 0, 1,
-0.6711916, -0.004243894, -2.683674, 0.4470588, 1, 0, 1,
-0.6668157, 1.092784, -0.2095616, 0.4392157, 1, 0, 1,
-0.6618547, 0.128792, -1.881608, 0.4352941, 1, 0, 1,
-0.6607647, 0.1614553, -0.916441, 0.427451, 1, 0, 1,
-0.6599848, 0.6421211, -0.9996864, 0.4235294, 1, 0, 1,
-0.654004, -0.1578282, -1.655998, 0.4156863, 1, 0, 1,
-0.6532119, 0.6424984, -0.483741, 0.4117647, 1, 0, 1,
-0.6500425, -0.5312495, -1.535435, 0.4039216, 1, 0, 1,
-0.6497081, -0.2428056, -1.714141, 0.3960784, 1, 0, 1,
-0.6496862, 0.09562027, -2.404065, 0.3921569, 1, 0, 1,
-0.6488313, -0.8118628, -2.007371, 0.3843137, 1, 0, 1,
-0.6477958, -0.8999727, -2.62676, 0.3803922, 1, 0, 1,
-0.6449954, 0.4405347, -0.9278433, 0.372549, 1, 0, 1,
-0.6443489, 0.08653228, -2.529898, 0.3686275, 1, 0, 1,
-0.6437297, 1.207127, -1.92987, 0.3607843, 1, 0, 1,
-0.6424696, -0.0706735, -1.511474, 0.3568628, 1, 0, 1,
-0.6333497, 1.134855, -1.409744, 0.3490196, 1, 0, 1,
-0.6284911, 1.763673, 0.2649147, 0.345098, 1, 0, 1,
-0.6244777, 0.4181821, -3.4408, 0.3372549, 1, 0, 1,
-0.620444, 0.2530755, -2.238523, 0.3333333, 1, 0, 1,
-0.6148428, -0.6059591, -3.128994, 0.3254902, 1, 0, 1,
-0.6146715, 0.2348731, -0.1683511, 0.3215686, 1, 0, 1,
-0.6123512, -1.01716, -0.9396257, 0.3137255, 1, 0, 1,
-0.6089491, -0.7587422, -3.431403, 0.3098039, 1, 0, 1,
-0.6081386, 2.390375, -0.2914668, 0.3019608, 1, 0, 1,
-0.6060408, 1.034063, -1.073026, 0.2941177, 1, 0, 1,
-0.6001772, -0.004513548, -2.631855, 0.2901961, 1, 0, 1,
-0.5935329, -0.1512978, -1.089028, 0.282353, 1, 0, 1,
-0.5932388, -0.227284, -1.00597, 0.2784314, 1, 0, 1,
-0.5929043, -0.8532601, -2.250726, 0.2705882, 1, 0, 1,
-0.5928916, 0.3586141, 0.7881857, 0.2666667, 1, 0, 1,
-0.5861467, -0.524352, -1.356276, 0.2588235, 1, 0, 1,
-0.5834105, -0.1082943, -2.331448, 0.254902, 1, 0, 1,
-0.5824701, 2.432873, 0.2975993, 0.2470588, 1, 0, 1,
-0.5789692, 1.593046, -0.7314061, 0.2431373, 1, 0, 1,
-0.576719, -1.586328, -4.687797, 0.2352941, 1, 0, 1,
-0.576618, -0.5124499, -4.131292, 0.2313726, 1, 0, 1,
-0.564677, -0.3455016, -3.291101, 0.2235294, 1, 0, 1,
-0.5641047, -1.489536, -2.890026, 0.2196078, 1, 0, 1,
-0.563068, 1.243688, -0.5499326, 0.2117647, 1, 0, 1,
-0.5623842, -0.5719484, -2.113889, 0.2078431, 1, 0, 1,
-0.5591129, 0.8044196, 0.8081765, 0.2, 1, 0, 1,
-0.5568548, -1.240258, -1.707666, 0.1921569, 1, 0, 1,
-0.5525885, -0.01589372, -0.662004, 0.1882353, 1, 0, 1,
-0.5488471, -0.05510871, -1.888253, 0.1803922, 1, 0, 1,
-0.5483257, -1.211892, -1.971802, 0.1764706, 1, 0, 1,
-0.5465418, 0.3866967, -0.7931945, 0.1686275, 1, 0, 1,
-0.5451549, -0.4181625, -1.983285, 0.1647059, 1, 0, 1,
-0.5433986, 0.8289673, -0.3845612, 0.1568628, 1, 0, 1,
-0.5413423, -1.165727, -0.8590379, 0.1529412, 1, 0, 1,
-0.540842, -0.418913, -1.589063, 0.145098, 1, 0, 1,
-0.5404677, -0.7675987, -0.8453662, 0.1411765, 1, 0, 1,
-0.5381858, 2.679639, 1.023126, 0.1333333, 1, 0, 1,
-0.5362032, -0.9300127, -2.560323, 0.1294118, 1, 0, 1,
-0.5333605, 0.3118064, -1.779863, 0.1215686, 1, 0, 1,
-0.5319803, -0.8902735, -2.449421, 0.1176471, 1, 0, 1,
-0.5294197, -0.693587, -2.837728, 0.1098039, 1, 0, 1,
-0.527676, -2.50499, -3.721552, 0.1058824, 1, 0, 1,
-0.5268585, 0.2244268, 1.051332, 0.09803922, 1, 0, 1,
-0.5264841, -1.477084, -2.557111, 0.09019608, 1, 0, 1,
-0.5036382, 0.2255019, -1.552261, 0.08627451, 1, 0, 1,
-0.499048, 0.09848487, -1.267437, 0.07843138, 1, 0, 1,
-0.4979724, 0.07235524, -0.8468116, 0.07450981, 1, 0, 1,
-0.4960962, -0.043058, -0.9841895, 0.06666667, 1, 0, 1,
-0.4891809, 1.220141, -0.4640962, 0.0627451, 1, 0, 1,
-0.483885, -0.2151228, -1.98116, 0.05490196, 1, 0, 1,
-0.4799894, 0.1671823, -0.7179075, 0.05098039, 1, 0, 1,
-0.4789833, 0.9753262, -0.1590419, 0.04313726, 1, 0, 1,
-0.4763362, 0.9154308, -0.9418406, 0.03921569, 1, 0, 1,
-0.4753555, -1.377754, -3.838273, 0.03137255, 1, 0, 1,
-0.4748978, -1.72642, -2.26396, 0.02745098, 1, 0, 1,
-0.4727772, -0.4361228, -3.36412, 0.01960784, 1, 0, 1,
-0.4686314, 2.709339, -0.6285911, 0.01568628, 1, 0, 1,
-0.4675825, -0.6826015, -2.021644, 0.007843138, 1, 0, 1,
-0.4670263, -0.1398743, -1.716672, 0.003921569, 1, 0, 1,
-0.462331, 0.0288968, -0.9680526, 0, 1, 0.003921569, 1,
-0.45703, 0.5406055, -1.040635, 0, 1, 0.01176471, 1,
-0.4543575, 0.4137373, -0.2984731, 0, 1, 0.01568628, 1,
-0.4536375, 0.3948638, 0.01128884, 0, 1, 0.02352941, 1,
-0.4521088, 0.1789934, -0.4195578, 0, 1, 0.02745098, 1,
-0.4519287, -0.9905915, -4.059731, 0, 1, 0.03529412, 1,
-0.4512588, 1.902371, -0.5641199, 0, 1, 0.03921569, 1,
-0.4488784, -0.0107016, -1.608243, 0, 1, 0.04705882, 1,
-0.4450727, -0.9997398, -2.472374, 0, 1, 0.05098039, 1,
-0.4437078, -0.4501318, -1.851495, 0, 1, 0.05882353, 1,
-0.4343993, 0.06422219, -1.517834, 0, 1, 0.0627451, 1,
-0.4326108, -1.192261, -2.278589, 0, 1, 0.07058824, 1,
-0.4304929, -0.3424833, -2.330034, 0, 1, 0.07450981, 1,
-0.4264438, -0.9125439, -4.138519, 0, 1, 0.08235294, 1,
-0.4255316, -0.1853537, -3.49989, 0, 1, 0.08627451, 1,
-0.423346, -0.3793499, -2.243168, 0, 1, 0.09411765, 1,
-0.4228533, 0.06658923, -1.335236, 0, 1, 0.1019608, 1,
-0.4183401, -0.3597413, -0.4924257, 0, 1, 0.1058824, 1,
-0.4161811, -0.1597805, -3.165438, 0, 1, 0.1137255, 1,
-0.4150628, -0.6954335, -3.608103, 0, 1, 0.1176471, 1,
-0.4146994, 0.1351506, -0.4946206, 0, 1, 0.1254902, 1,
-0.4124869, -0.00184357, -1.344444, 0, 1, 0.1294118, 1,
-0.4111868, -0.8602565, -3.291235, 0, 1, 0.1372549, 1,
-0.405456, 1.569306, -1.13325, 0, 1, 0.1411765, 1,
-0.4049542, 1.093886, -1.447969, 0, 1, 0.1490196, 1,
-0.403764, -0.2119958, -1.627136, 0, 1, 0.1529412, 1,
-0.3967453, 0.7369845, -2.483184, 0, 1, 0.1607843, 1,
-0.3945745, -0.2142326, -1.01308, 0, 1, 0.1647059, 1,
-0.3909574, 1.226817, 0.7532953, 0, 1, 0.172549, 1,
-0.3903657, 1.034251, -0.6074077, 0, 1, 0.1764706, 1,
-0.3821411, -0.30455, -2.497326, 0, 1, 0.1843137, 1,
-0.3769104, -0.2457269, -1.205479, 0, 1, 0.1882353, 1,
-0.3763462, 1.584638, 0.7455348, 0, 1, 0.1960784, 1,
-0.3740677, -0.05432628, -2.019419, 0, 1, 0.2039216, 1,
-0.3730967, -0.0443362, -1.547967, 0, 1, 0.2078431, 1,
-0.3703187, 1.110226, -0.1620079, 0, 1, 0.2156863, 1,
-0.3694256, 1.190949, -0.5123388, 0, 1, 0.2196078, 1,
-0.3532613, 0.3037796, -0.1325653, 0, 1, 0.227451, 1,
-0.3490045, -1.735285, -2.466874, 0, 1, 0.2313726, 1,
-0.3478063, -1.262102, -2.827287, 0, 1, 0.2392157, 1,
-0.3415035, 0.06536925, -2.020396, 0, 1, 0.2431373, 1,
-0.332305, 0.5735987, -1.159886, 0, 1, 0.2509804, 1,
-0.3317098, 0.08901965, -0.5703708, 0, 1, 0.254902, 1,
-0.3230243, 1.012955, 1.266317, 0, 1, 0.2627451, 1,
-0.3211779, 1.787938, 0.859001, 0, 1, 0.2666667, 1,
-0.3164937, -0.349032, -2.095627, 0, 1, 0.2745098, 1,
-0.3131766, -0.9542304, -2.546845, 0, 1, 0.2784314, 1,
-0.3125495, 0.8306469, -2.44216, 0, 1, 0.2862745, 1,
-0.3114426, 0.4059272, -2.492782, 0, 1, 0.2901961, 1,
-0.3101082, 0.7905833, 0.08696721, 0, 1, 0.2980392, 1,
-0.3094359, -0.1024877, -2.354461, 0, 1, 0.3058824, 1,
-0.3081159, 2.425189, 0.1613464, 0, 1, 0.3098039, 1,
-0.307828, -0.5488838, -2.359986, 0, 1, 0.3176471, 1,
-0.3036129, 1.296228, 0.7624493, 0, 1, 0.3215686, 1,
-0.3023179, 0.4207116, -0.6835207, 0, 1, 0.3294118, 1,
-0.2986903, -1.310292, -1.756063, 0, 1, 0.3333333, 1,
-0.2972665, -0.02611037, -2.001849, 0, 1, 0.3411765, 1,
-0.2971116, 1.537018, -0.5769886, 0, 1, 0.345098, 1,
-0.2909625, 1.090426, -0.6256974, 0, 1, 0.3529412, 1,
-0.2849396, 0.8357258, -0.9809054, 0, 1, 0.3568628, 1,
-0.2843279, -0.6914697, -4.134982, 0, 1, 0.3647059, 1,
-0.282717, -0.5875086, -2.129783, 0, 1, 0.3686275, 1,
-0.2820601, -0.08675826, -4.96334, 0, 1, 0.3764706, 1,
-0.2820254, -1.020637, -3.642396, 0, 1, 0.3803922, 1,
-0.2760029, 0.05217659, -0.1357719, 0, 1, 0.3882353, 1,
-0.2756199, 1.088912, -0.5025168, 0, 1, 0.3921569, 1,
-0.2755914, 0.1385801, 0.2422316, 0, 1, 0.4, 1,
-0.26884, -0.7566896, -2.326928, 0, 1, 0.4078431, 1,
-0.2683198, -0.3466203, -3.282081, 0, 1, 0.4117647, 1,
-0.2678915, -1.050807, -1.59314, 0, 1, 0.4196078, 1,
-0.2673025, 0.5304989, 0.1384051, 0, 1, 0.4235294, 1,
-0.2629417, 1.37233, -0.4380151, 0, 1, 0.4313726, 1,
-0.2573736, -1.930684, -1.826463, 0, 1, 0.4352941, 1,
-0.2573061, 1.598805, 0.7653112, 0, 1, 0.4431373, 1,
-0.2564293, 0.427458, -1.565954, 0, 1, 0.4470588, 1,
-0.2524395, -0.3558561, -1.210074, 0, 1, 0.454902, 1,
-0.2498979, -0.679954, -1.792721, 0, 1, 0.4588235, 1,
-0.2485645, -1.16189, -1.169173, 0, 1, 0.4666667, 1,
-0.2441824, -0.1943737, -3.045047, 0, 1, 0.4705882, 1,
-0.2413944, -0.2128442, -3.625658, 0, 1, 0.4784314, 1,
-0.2388445, -1.785973, -3.346038, 0, 1, 0.4823529, 1,
-0.232608, 1.241471, -0.6493922, 0, 1, 0.4901961, 1,
-0.2316471, -1.899701, -4.285908, 0, 1, 0.4941176, 1,
-0.2302962, -0.04615989, -0.2971365, 0, 1, 0.5019608, 1,
-0.228989, -1.572794, -2.462063, 0, 1, 0.509804, 1,
-0.2151524, 1.716607, -0.01169157, 0, 1, 0.5137255, 1,
-0.2142482, -1.107213, -2.995428, 0, 1, 0.5215687, 1,
-0.2142013, 0.737244, -0.2566316, 0, 1, 0.5254902, 1,
-0.2129283, -1.865782, -4.407444, 0, 1, 0.5333334, 1,
-0.2111558, -1.077219, -1.500052, 0, 1, 0.5372549, 1,
-0.2096214, -0.06558172, -2.355906, 0, 1, 0.5450981, 1,
-0.2088047, 0.684333, -0.1283964, 0, 1, 0.5490196, 1,
-0.2075718, -0.6053928, -2.988976, 0, 1, 0.5568628, 1,
-0.2064268, 0.5366403, 0.9170135, 0, 1, 0.5607843, 1,
-0.2038687, -0.1082725, -0.2916577, 0, 1, 0.5686275, 1,
-0.2038492, 0.2695909, -0.5168889, 0, 1, 0.572549, 1,
-0.2034273, -1.666496, -2.726083, 0, 1, 0.5803922, 1,
-0.2021524, 0.1868652, -2.134987, 0, 1, 0.5843138, 1,
-0.1984925, -0.3266983, -1.966291, 0, 1, 0.5921569, 1,
-0.1962483, -1.237252, -3.202841, 0, 1, 0.5960785, 1,
-0.1864723, 2.101292, -1.4077, 0, 1, 0.6039216, 1,
-0.1845151, 0.6530315, -2.247688, 0, 1, 0.6117647, 1,
-0.1824349, 0.6046429, 0.3057087, 0, 1, 0.6156863, 1,
-0.176887, 0.2030827, -0.5040316, 0, 1, 0.6235294, 1,
-0.1766162, -0.4593286, -2.927052, 0, 1, 0.627451, 1,
-0.1710745, -1.064426, -2.730853, 0, 1, 0.6352941, 1,
-0.1680286, -0.7005697, -1.716613, 0, 1, 0.6392157, 1,
-0.164538, 0.4101878, -0.7671953, 0, 1, 0.6470588, 1,
-0.1641488, -0.5823539, -4.519701, 0, 1, 0.6509804, 1,
-0.1603555, 1.761325, -1.517862, 0, 1, 0.6588235, 1,
-0.1579679, -0.694228, -1.490019, 0, 1, 0.6627451, 1,
-0.154862, 0.5854152, 0.004978565, 0, 1, 0.6705883, 1,
-0.1539544, -0.2634832, -3.312557, 0, 1, 0.6745098, 1,
-0.1531083, 3.16767, 0.5808461, 0, 1, 0.682353, 1,
-0.1522331, -0.07466315, -1.063065, 0, 1, 0.6862745, 1,
-0.1510019, 1.745666, -0.2308701, 0, 1, 0.6941177, 1,
-0.1439993, -0.2362928, -3.499941, 0, 1, 0.7019608, 1,
-0.1428355, 0.1570822, -1.495539, 0, 1, 0.7058824, 1,
-0.1426087, -0.5255017, -0.8787674, 0, 1, 0.7137255, 1,
-0.1385411, 0.4554451, 1.052166, 0, 1, 0.7176471, 1,
-0.1372526, 0.7859208, 0.03075666, 0, 1, 0.7254902, 1,
-0.1337408, 0.1126817, -0.533098, 0, 1, 0.7294118, 1,
-0.1296983, -0.6594155, -2.917372, 0, 1, 0.7372549, 1,
-0.129188, -1.716404, -1.944835, 0, 1, 0.7411765, 1,
-0.1273851, 0.4012659, -0.6425955, 0, 1, 0.7490196, 1,
-0.127119, 1.312085, 0.4811316, 0, 1, 0.7529412, 1,
-0.1256696, 0.2551641, -0.4834008, 0, 1, 0.7607843, 1,
-0.1233047, -0.5460814, -2.912847, 0, 1, 0.7647059, 1,
-0.1210346, 0.5799726, -0.05676174, 0, 1, 0.772549, 1,
-0.120784, 0.008693405, -1.257874, 0, 1, 0.7764706, 1,
-0.1194557, -1.070054, -2.46793, 0, 1, 0.7843137, 1,
-0.1174644, 0.6591816, 0.07940771, 0, 1, 0.7882353, 1,
-0.114722, 0.1543744, -0.3156569, 0, 1, 0.7960784, 1,
-0.1145597, -0.4766311, -2.096953, 0, 1, 0.8039216, 1,
-0.114507, -0.8863583, -4.0609, 0, 1, 0.8078431, 1,
-0.1102591, 0.4361054, 1.484392, 0, 1, 0.8156863, 1,
-0.1079901, 0.3998385, 0.9003518, 0, 1, 0.8196079, 1,
-0.1065602, -2.80373, -6.069437, 0, 1, 0.827451, 1,
-0.1029685, 0.8737931, -0.006786184, 0, 1, 0.8313726, 1,
-0.102588, -0.2701502, -3.249523, 0, 1, 0.8392157, 1,
-0.1002057, 0.2074434, -0.8822038, 0, 1, 0.8431373, 1,
-0.09491739, -1.049296, -3.169138, 0, 1, 0.8509804, 1,
-0.09412641, 1.088158, -1.618251, 0, 1, 0.854902, 1,
-0.09404309, -0.5785033, -2.755469, 0, 1, 0.8627451, 1,
-0.09301034, 0.1287584, -0.9912096, 0, 1, 0.8666667, 1,
-0.09184168, 0.8512574, 3.642132, 0, 1, 0.8745098, 1,
-0.08787905, -1.984846, -2.22659, 0, 1, 0.8784314, 1,
-0.08464292, -0.6624542, -3.366704, 0, 1, 0.8862745, 1,
-0.08171873, 0.5702723, -0.7664942, 0, 1, 0.8901961, 1,
-0.07901849, 0.01231119, -1.561268, 0, 1, 0.8980392, 1,
-0.07561717, -0.4263704, -2.896778, 0, 1, 0.9058824, 1,
-0.07554084, -0.4452933, -2.421255, 0, 1, 0.9098039, 1,
-0.07373881, -1.612063, -1.881498, 0, 1, 0.9176471, 1,
-0.07259605, -0.9942535, -2.303982, 0, 1, 0.9215686, 1,
-0.07250915, -1.083789, -3.874321, 0, 1, 0.9294118, 1,
-0.06810538, -0.1608385, -2.404706, 0, 1, 0.9333333, 1,
-0.06661069, 1.769001, 0.4513636, 0, 1, 0.9411765, 1,
-0.06541223, 2.19474, -0.4442472, 0, 1, 0.945098, 1,
-0.06523672, 0.2933657, -1.780843, 0, 1, 0.9529412, 1,
-0.06395835, -0.5385998, -1.804049, 0, 1, 0.9568627, 1,
-0.06270359, 1.202794, -1.7499, 0, 1, 0.9647059, 1,
-0.06128023, -0.01877676, -0.6621609, 0, 1, 0.9686275, 1,
-0.05553012, -0.9349766, -2.0837, 0, 1, 0.9764706, 1,
-0.05028243, 0.587451, -1.685348, 0, 1, 0.9803922, 1,
-0.04913625, -1.574282, -2.152528, 0, 1, 0.9882353, 1,
-0.0475449, 1.955335, 0.4084259, 0, 1, 0.9921569, 1,
-0.0470586, 0.4334877, 0.5613407, 0, 1, 1, 1,
-0.04682632, -0.6912707, -3.497711, 0, 0.9921569, 1, 1,
-0.04444173, -0.61164, -3.082204, 0, 0.9882353, 1, 1,
-0.03996611, -0.9723918, -4.204679, 0, 0.9803922, 1, 1,
-0.03966616, 0.6567186, 0.4687615, 0, 0.9764706, 1, 1,
-0.03809801, 0.8257208, -0.4535789, 0, 0.9686275, 1, 1,
-0.03244977, 0.82294, -0.5439476, 0, 0.9647059, 1, 1,
-0.03146632, 0.8243626, -0.05276085, 0, 0.9568627, 1, 1,
-0.02823221, 1.334978, 0.9784392, 0, 0.9529412, 1, 1,
-0.02781886, -0.1942542, -2.979435, 0, 0.945098, 1, 1,
-0.01243816, -1.084664, -4.291248, 0, 0.9411765, 1, 1,
-0.006138646, -1.123699, -2.511124, 0, 0.9333333, 1, 1,
0.002923233, -0.2150865, 2.678522, 0, 0.9294118, 1, 1,
0.005778712, 0.5704295, -0.4479287, 0, 0.9215686, 1, 1,
0.009286036, 0.3316247, -2.732009, 0, 0.9176471, 1, 1,
0.009491023, -0.07758962, 3.8617, 0, 0.9098039, 1, 1,
0.01083911, -2.303931, 3.149457, 0, 0.9058824, 1, 1,
0.01538653, -0.5755959, 4.064023, 0, 0.8980392, 1, 1,
0.02140449, -0.0872321, 3.545106, 0, 0.8901961, 1, 1,
0.02175496, 1.865565, -0.08709992, 0, 0.8862745, 1, 1,
0.02360476, -1.603646, 3.37542, 0, 0.8784314, 1, 1,
0.02444887, -1.327783, 3.029857, 0, 0.8745098, 1, 1,
0.02575299, 0.3291378, -1.161808, 0, 0.8666667, 1, 1,
0.03144574, 1.445524, 1.143397, 0, 0.8627451, 1, 1,
0.03180262, 1.142816, -0.05747728, 0, 0.854902, 1, 1,
0.03239914, -0.6268967, 2.424919, 0, 0.8509804, 1, 1,
0.03246275, 0.6503549, -1.903929, 0, 0.8431373, 1, 1,
0.03362482, 0.2454347, -0.7535174, 0, 0.8392157, 1, 1,
0.03588961, -0.658182, 4.346743, 0, 0.8313726, 1, 1,
0.03613157, -0.9971351, 1.397275, 0, 0.827451, 1, 1,
0.03970863, -0.7426628, 2.660766, 0, 0.8196079, 1, 1,
0.04113716, -1.205597, 3.911423, 0, 0.8156863, 1, 1,
0.04512314, -1.20149, 2.971494, 0, 0.8078431, 1, 1,
0.05545665, 0.2599339, 2.009858, 0, 0.8039216, 1, 1,
0.05827773, 0.3773573, 1.398088, 0, 0.7960784, 1, 1,
0.06080336, -0.9922196, 4.154249, 0, 0.7882353, 1, 1,
0.06195191, 0.05140245, 1.332638, 0, 0.7843137, 1, 1,
0.06652846, 0.6662655, -0.8787861, 0, 0.7764706, 1, 1,
0.06864081, 1.235283, 1.13292, 0, 0.772549, 1, 1,
0.07138652, 0.1960638, 0.9575228, 0, 0.7647059, 1, 1,
0.0732674, -0.9443597, 2.828638, 0, 0.7607843, 1, 1,
0.07541586, 0.05732976, 0.681444, 0, 0.7529412, 1, 1,
0.08054513, -0.739208, 4.259399, 0, 0.7490196, 1, 1,
0.08098041, 0.8145056, -1.771984, 0, 0.7411765, 1, 1,
0.08346508, 0.2332132, 0.4686846, 0, 0.7372549, 1, 1,
0.0903853, 0.848194, -1.481013, 0, 0.7294118, 1, 1,
0.09162368, -0.3163394, 2.309836, 0, 0.7254902, 1, 1,
0.09202673, -0.3860394, 3.695779, 0, 0.7176471, 1, 1,
0.0967005, -0.8394765, 2.244506, 0, 0.7137255, 1, 1,
0.1009971, 0.8315477, 0.1730375, 0, 0.7058824, 1, 1,
0.1027462, -0.7934695, 2.030816, 0, 0.6980392, 1, 1,
0.1081069, 0.5499572, -0.07769941, 0, 0.6941177, 1, 1,
0.1116735, 0.6540899, 2.259473, 0, 0.6862745, 1, 1,
0.1158214, -0.7016571, -0.1376025, 0, 0.682353, 1, 1,
0.1177327, -0.9122165, 3.260344, 0, 0.6745098, 1, 1,
0.1193292, -1.849464, 3.030463, 0, 0.6705883, 1, 1,
0.1215134, -1.982335, 4.468907, 0, 0.6627451, 1, 1,
0.1229954, 0.8718835, 1.533775, 0, 0.6588235, 1, 1,
0.1263066, -0.7014325, 1.559986, 0, 0.6509804, 1, 1,
0.129652, 0.6779413, 0.8129206, 0, 0.6470588, 1, 1,
0.1297728, -0.3952527, 3.422979, 0, 0.6392157, 1, 1,
0.1321628, -0.7405742, 3.028463, 0, 0.6352941, 1, 1,
0.1329434, 1.17532, 1.716863, 0, 0.627451, 1, 1,
0.1346311, 0.4587757, -1.48551, 0, 0.6235294, 1, 1,
0.1375139, -1.113186, 3.600358, 0, 0.6156863, 1, 1,
0.1413627, 0.7502105, -1.040148, 0, 0.6117647, 1, 1,
0.1445125, 0.7888484, 1.320918, 0, 0.6039216, 1, 1,
0.1465435, 0.689518, 0.1690941, 0, 0.5960785, 1, 1,
0.1476478, 1.964473, 0.7049595, 0, 0.5921569, 1, 1,
0.1485456, 1.141051, -0.0892, 0, 0.5843138, 1, 1,
0.149087, 1.85094, -0.7202592, 0, 0.5803922, 1, 1,
0.1518756, 0.3263193, 0.6880975, 0, 0.572549, 1, 1,
0.1539676, 0.2311386, 0.1320739, 0, 0.5686275, 1, 1,
0.1582706, 0.5183263, 1.739717, 0, 0.5607843, 1, 1,
0.1586979, -2.324104, 2.472877, 0, 0.5568628, 1, 1,
0.1611033, 1.034028, -1.236083, 0, 0.5490196, 1, 1,
0.1619485, -0.008037826, 1.469468, 0, 0.5450981, 1, 1,
0.1630087, 2.018641, -0.8517822, 0, 0.5372549, 1, 1,
0.164122, -0.08331349, 2.03766, 0, 0.5333334, 1, 1,
0.1659252, -0.4349692, 2.732632, 0, 0.5254902, 1, 1,
0.1674025, 0.4228211, 0.8157939, 0, 0.5215687, 1, 1,
0.1685219, 0.5528036, -1.317051, 0, 0.5137255, 1, 1,
0.1701146, -0.7510709, 2.872061, 0, 0.509804, 1, 1,
0.1703026, -0.06044905, 1.157702, 0, 0.5019608, 1, 1,
0.1829301, -1.02937, 5.120265, 0, 0.4941176, 1, 1,
0.1842078, 0.4681534, 0.06815177, 0, 0.4901961, 1, 1,
0.1870537, -1.077292, 2.485238, 0, 0.4823529, 1, 1,
0.1960718, -0.4592848, 1.890134, 0, 0.4784314, 1, 1,
0.1969179, 1.371438, 0.9709271, 0, 0.4705882, 1, 1,
0.19795, 0.8281736, -0.2608788, 0, 0.4666667, 1, 1,
0.1991302, -0.2545903, 2.499318, 0, 0.4588235, 1, 1,
0.2019767, 0.337054, 1.264317, 0, 0.454902, 1, 1,
0.2020725, -0.3214397, 0.1453936, 0, 0.4470588, 1, 1,
0.2056127, -1.854905, 2.585936, 0, 0.4431373, 1, 1,
0.2060227, 0.3108418, 1.77665, 0, 0.4352941, 1, 1,
0.2066035, 0.3879452, 0.7007942, 0, 0.4313726, 1, 1,
0.2081025, 0.1604719, 0.4885228, 0, 0.4235294, 1, 1,
0.2120053, 1.594447, 0.5135852, 0, 0.4196078, 1, 1,
0.2134924, 0.6356636, -0.3804142, 0, 0.4117647, 1, 1,
0.2168429, -1.011032, 1.295854, 0, 0.4078431, 1, 1,
0.2225523, -0.5549822, 2.976351, 0, 0.4, 1, 1,
0.2240861, 0.4528277, 0.4358997, 0, 0.3921569, 1, 1,
0.2246731, 0.679149, -0.2153077, 0, 0.3882353, 1, 1,
0.2278574, -0.371113, 4.268169, 0, 0.3803922, 1, 1,
0.2282763, -1.021047, 2.973715, 0, 0.3764706, 1, 1,
0.2301185, 0.0250247, 0.03876812, 0, 0.3686275, 1, 1,
0.2314868, 0.8190156, 1.477058, 0, 0.3647059, 1, 1,
0.232224, 0.4329029, 0.670327, 0, 0.3568628, 1, 1,
0.2323141, 1.640619, -0.2553563, 0, 0.3529412, 1, 1,
0.2333834, 0.5797181, 2.966804, 0, 0.345098, 1, 1,
0.2397824, -0.2500759, 3.356402, 0, 0.3411765, 1, 1,
0.2400424, -2.098132, 0.198574, 0, 0.3333333, 1, 1,
0.2409335, -1.579971, 1.123389, 0, 0.3294118, 1, 1,
0.2409526, -1.033243, 3.695512, 0, 0.3215686, 1, 1,
0.2451081, 0.1059255, 2.91577, 0, 0.3176471, 1, 1,
0.2452984, 1.340188, 1.384367, 0, 0.3098039, 1, 1,
0.2484872, -1.161819, 3.237522, 0, 0.3058824, 1, 1,
0.2495064, 1.263557, 0.4092088, 0, 0.2980392, 1, 1,
0.2576861, 0.3734421, 1.116816, 0, 0.2901961, 1, 1,
0.2591677, -2.603785, 2.509837, 0, 0.2862745, 1, 1,
0.2591946, 1.970163, -0.4730697, 0, 0.2784314, 1, 1,
0.2611986, -0.7310678, 2.85816, 0, 0.2745098, 1, 1,
0.2640217, -0.8072238, 3.113072, 0, 0.2666667, 1, 1,
0.2683527, 0.4641292, 1.562433, 0, 0.2627451, 1, 1,
0.2701442, -0.1845103, 3.403548, 0, 0.254902, 1, 1,
0.2716548, -1.208909, 2.227018, 0, 0.2509804, 1, 1,
0.2724218, -1.328203, 2.84927, 0, 0.2431373, 1, 1,
0.2734931, 0.6579049, -0.270669, 0, 0.2392157, 1, 1,
0.2759131, -0.01355381, 0.147267, 0, 0.2313726, 1, 1,
0.2777601, 0.997646, 0.5348329, 0, 0.227451, 1, 1,
0.281946, -0.6492757, 4.798581, 0, 0.2196078, 1, 1,
0.2835762, -0.1950825, 2.885182, 0, 0.2156863, 1, 1,
0.284566, 1.14288, -2.537075, 0, 0.2078431, 1, 1,
0.2852111, 1.080161, -0.5671285, 0, 0.2039216, 1, 1,
0.2880485, -0.656445, 2.036653, 0, 0.1960784, 1, 1,
0.2946003, 0.1224465, 3.150336, 0, 0.1882353, 1, 1,
0.2958333, -1.30883, 2.178962, 0, 0.1843137, 1, 1,
0.2992282, 0.3505666, -0.5465888, 0, 0.1764706, 1, 1,
0.3014407, 1.240981, 1.570887, 0, 0.172549, 1, 1,
0.3017879, -0.766943, 2.281553, 0, 0.1647059, 1, 1,
0.3031635, -2.493158, 3.344977, 0, 0.1607843, 1, 1,
0.3038924, 0.9875441, -0.7940812, 0, 0.1529412, 1, 1,
0.3049338, 0.175565, 0.3680156, 0, 0.1490196, 1, 1,
0.3068663, 0.696337, 2.346362, 0, 0.1411765, 1, 1,
0.3068976, 0.2385717, 1.999223, 0, 0.1372549, 1, 1,
0.3087819, -0.4881992, 3.692801, 0, 0.1294118, 1, 1,
0.3097599, 0.8313152, 0.4000377, 0, 0.1254902, 1, 1,
0.3099992, -0.1167799, 1.134209, 0, 0.1176471, 1, 1,
0.3166886, -0.6673285, 1.772678, 0, 0.1137255, 1, 1,
0.3204868, -2.227225, 4.055588, 0, 0.1058824, 1, 1,
0.323302, 0.890077, 1.256259, 0, 0.09803922, 1, 1,
0.3253812, -0.34343, 2.531236, 0, 0.09411765, 1, 1,
0.3324516, -0.3356825, 1.400101, 0, 0.08627451, 1, 1,
0.3374193, -0.8273919, 3.877551, 0, 0.08235294, 1, 1,
0.3387686, 0.6927008, 1.305688, 0, 0.07450981, 1, 1,
0.3394675, -0.6770414, 2.460383, 0, 0.07058824, 1, 1,
0.3404696, 0.2279161, 1.301822, 0, 0.0627451, 1, 1,
0.3412808, -1.941944, 1.756648, 0, 0.05882353, 1, 1,
0.3424275, 0.2595411, 1.326172, 0, 0.05098039, 1, 1,
0.3493976, -1.384501, 2.338792, 0, 0.04705882, 1, 1,
0.3529982, 0.8186174, 0.3609307, 0, 0.03921569, 1, 1,
0.3543019, 0.8665121, 1.101021, 0, 0.03529412, 1, 1,
0.3543714, 0.4600121, 0.3297782, 0, 0.02745098, 1, 1,
0.3611478, 2.659183, -1.016315, 0, 0.02352941, 1, 1,
0.3629584, -0.8254317, 3.311515, 0, 0.01568628, 1, 1,
0.3684635, 0.8545761, 0.7077277, 0, 0.01176471, 1, 1,
0.3727534, -0.2340602, 2.093824, 0, 0.003921569, 1, 1,
0.3760475, 0.5460767, 1.716943, 0.003921569, 0, 1, 1,
0.3787294, -0.8683146, 1.655386, 0.007843138, 0, 1, 1,
0.381552, 0.4914922, 0.8999704, 0.01568628, 0, 1, 1,
0.3817563, 1.548639, 2.480805, 0.01960784, 0, 1, 1,
0.3826056, 1.119513, 1.030956, 0.02745098, 0, 1, 1,
0.3832243, 0.7362785, -0.1974402, 0.03137255, 0, 1, 1,
0.3851106, -0.5724497, 2.128423, 0.03921569, 0, 1, 1,
0.3864518, -1.006463, 2.793826, 0.04313726, 0, 1, 1,
0.3905503, -0.3565632, 3.625963, 0.05098039, 0, 1, 1,
0.3988365, 0.2762649, 0.6322594, 0.05490196, 0, 1, 1,
0.3989484, -2.748793, 0.2721231, 0.0627451, 0, 1, 1,
0.4076546, 1.439713, -0.05717977, 0.06666667, 0, 1, 1,
0.4089232, 1.437629, -1.062246, 0.07450981, 0, 1, 1,
0.4098537, -1.212891, 2.784829, 0.07843138, 0, 1, 1,
0.4101398, 1.863763, 1.086629, 0.08627451, 0, 1, 1,
0.4120464, 0.1503588, 0.7015204, 0.09019608, 0, 1, 1,
0.4137155, -0.2444885, 3.68161, 0.09803922, 0, 1, 1,
0.4174275, -1.386357, 2.322842, 0.1058824, 0, 1, 1,
0.4179262, 0.9695911, 2.344589, 0.1098039, 0, 1, 1,
0.4232676, -1.123173, 1.855614, 0.1176471, 0, 1, 1,
0.4247901, 1.248359, -0.9750552, 0.1215686, 0, 1, 1,
0.4255498, 0.1734954, -0.7557659, 0.1294118, 0, 1, 1,
0.4258451, -1.330307, 1.683615, 0.1333333, 0, 1, 1,
0.4271279, 1.378862, 1.874334, 0.1411765, 0, 1, 1,
0.43039, 0.8358975, -1.380677, 0.145098, 0, 1, 1,
0.4314237, 0.2344304, 1.641561, 0.1529412, 0, 1, 1,
0.4316056, 1.229811, -0.3320902, 0.1568628, 0, 1, 1,
0.4316814, 0.1543041, 0.016642, 0.1647059, 0, 1, 1,
0.4323801, 0.404943, 1.923313, 0.1686275, 0, 1, 1,
0.4341971, -0.2051798, 2.949153, 0.1764706, 0, 1, 1,
0.4360426, -1.33811, 3.355438, 0.1803922, 0, 1, 1,
0.445112, 1.941944, -0.7174097, 0.1882353, 0, 1, 1,
0.4488011, 1.427532, 0.7549469, 0.1921569, 0, 1, 1,
0.4532323, 0.2135641, -0.04865737, 0.2, 0, 1, 1,
0.4564769, -1.289483, 4.350277, 0.2078431, 0, 1, 1,
0.4604771, -0.05393012, 1.336522, 0.2117647, 0, 1, 1,
0.4615624, -1.263966, 1.349016, 0.2196078, 0, 1, 1,
0.4646115, -0.1736515, 0.6432737, 0.2235294, 0, 1, 1,
0.4662439, 1.987838, -0.02148593, 0.2313726, 0, 1, 1,
0.4709096, 0.1110627, 1.699588, 0.2352941, 0, 1, 1,
0.47909, -1.48515, 1.77791, 0.2431373, 0, 1, 1,
0.4884752, 1.498365, 1.012525, 0.2470588, 0, 1, 1,
0.4926209, -0.8979845, 2.781052, 0.254902, 0, 1, 1,
0.4931069, 0.4827251, -1.963713, 0.2588235, 0, 1, 1,
0.4937212, 0.8634744, -0.717783, 0.2666667, 0, 1, 1,
0.4982958, -0.3516337, 0.8404062, 0.2705882, 0, 1, 1,
0.5036452, 0.2015042, 1.653231, 0.2784314, 0, 1, 1,
0.5043795, -0.765121, 1.252704, 0.282353, 0, 1, 1,
0.5064259, -0.6281608, 1.338507, 0.2901961, 0, 1, 1,
0.5074822, -0.4139195, 1.407936, 0.2941177, 0, 1, 1,
0.5075514, -0.8247226, 2.093111, 0.3019608, 0, 1, 1,
0.5091084, 0.4841132, -0.8174657, 0.3098039, 0, 1, 1,
0.5091251, 0.287303, 1.940615, 0.3137255, 0, 1, 1,
0.5138412, 0.2188431, 2.256697, 0.3215686, 0, 1, 1,
0.5150409, -1.398407, 1.768517, 0.3254902, 0, 1, 1,
0.5182539, -0.7214426, 2.023695, 0.3333333, 0, 1, 1,
0.5182836, -1.087445, 3.807444, 0.3372549, 0, 1, 1,
0.5264848, -0.2683551, 1.559168, 0.345098, 0, 1, 1,
0.5318766, -0.6322886, 3.000024, 0.3490196, 0, 1, 1,
0.5327041, -1.729405, 3.955628, 0.3568628, 0, 1, 1,
0.534347, -0.2542123, 1.934003, 0.3607843, 0, 1, 1,
0.5353041, 0.1338993, 2.285907, 0.3686275, 0, 1, 1,
0.5354712, -2.63173, 3.279217, 0.372549, 0, 1, 1,
0.5374295, -1.80938, 2.75082, 0.3803922, 0, 1, 1,
0.5386971, 0.4578176, 2.711378, 0.3843137, 0, 1, 1,
0.5440528, -0.9431169, 2.481401, 0.3921569, 0, 1, 1,
0.550563, 1.850456, 2.805442, 0.3960784, 0, 1, 1,
0.5533623, 0.4474863, 0.6516328, 0.4039216, 0, 1, 1,
0.553734, -0.07799902, 1.236106, 0.4117647, 0, 1, 1,
0.5543599, -1.134175, 2.329937, 0.4156863, 0, 1, 1,
0.5548288, 1.682711, -0.3245772, 0.4235294, 0, 1, 1,
0.5548847, -0.2853505, -0.1515938, 0.427451, 0, 1, 1,
0.5557861, 1.266569, -0.9423746, 0.4352941, 0, 1, 1,
0.5595697, 1.138399, 0.7633576, 0.4392157, 0, 1, 1,
0.5624545, -0.2538018, 3.071792, 0.4470588, 0, 1, 1,
0.5641368, 0.6102825, -1.528904, 0.4509804, 0, 1, 1,
0.569618, -0.6405594, 2.337225, 0.4588235, 0, 1, 1,
0.5713615, -0.09480007, 1.984931, 0.4627451, 0, 1, 1,
0.5764918, -2.344967, 3.76488, 0.4705882, 0, 1, 1,
0.5768799, -0.5892282, 1.940637, 0.4745098, 0, 1, 1,
0.5853028, 0.5960361, 1.209989, 0.4823529, 0, 1, 1,
0.5866095, -0.9034599, 3.307196, 0.4862745, 0, 1, 1,
0.5954714, 0.3125187, 1.025895, 0.4941176, 0, 1, 1,
0.6006564, 1.113675, 2.582031, 0.5019608, 0, 1, 1,
0.602195, 0.878835, 0.3856836, 0.5058824, 0, 1, 1,
0.602507, 0.3642389, 1.514378, 0.5137255, 0, 1, 1,
0.6047682, -0.05431168, 3.003015, 0.5176471, 0, 1, 1,
0.610768, 1.289581, -0.6770813, 0.5254902, 0, 1, 1,
0.61123, 0.2939074, 1.965365, 0.5294118, 0, 1, 1,
0.6146103, 0.8962111, 3.144863, 0.5372549, 0, 1, 1,
0.6164657, -0.4064795, 3.244665, 0.5411765, 0, 1, 1,
0.6197307, -0.3832216, 3.712667, 0.5490196, 0, 1, 1,
0.6293859, 0.5760582, -0.2732929, 0.5529412, 0, 1, 1,
0.6306078, 0.314032, 0.8350731, 0.5607843, 0, 1, 1,
0.6455403, -1.911395, 2.131541, 0.5647059, 0, 1, 1,
0.6465945, -0.785605, 3.2998, 0.572549, 0, 1, 1,
0.6475047, 0.8098319, 2.349436, 0.5764706, 0, 1, 1,
0.6515023, -0.4690959, 2.092854, 0.5843138, 0, 1, 1,
0.6528187, 0.436319, -0.03950046, 0.5882353, 0, 1, 1,
0.6538509, 0.858588, 0.8640148, 0.5960785, 0, 1, 1,
0.6540752, 0.1400881, 0.7725876, 0.6039216, 0, 1, 1,
0.654623, -1.736174, 2.503058, 0.6078432, 0, 1, 1,
0.6580282, -0.1974316, 1.864182, 0.6156863, 0, 1, 1,
0.6594647, -0.7485698, 2.698635, 0.6196079, 0, 1, 1,
0.6606269, 0.8111515, -0.02933446, 0.627451, 0, 1, 1,
0.6615351, -1.632468, 2.261227, 0.6313726, 0, 1, 1,
0.6656525, -0.5731546, 5.232517, 0.6392157, 0, 1, 1,
0.6680482, -1.449236, 2.670686, 0.6431373, 0, 1, 1,
0.6775568, -1.736739, 2.680673, 0.6509804, 0, 1, 1,
0.6792712, 0.3499475, 1.691026, 0.654902, 0, 1, 1,
0.681661, 1.10341, 1.254471, 0.6627451, 0, 1, 1,
0.6851937, -1.219697, 3.308, 0.6666667, 0, 1, 1,
0.6854365, -1.565773, 3.760833, 0.6745098, 0, 1, 1,
0.6874954, 1.472921, 0.9017036, 0.6784314, 0, 1, 1,
0.6894509, 0.4559707, 0.2019386, 0.6862745, 0, 1, 1,
0.6950793, -0.2594628, 1.860985, 0.6901961, 0, 1, 1,
0.6971392, -0.11478, 0.9493078, 0.6980392, 0, 1, 1,
0.7059826, 0.6879435, 1.564714, 0.7058824, 0, 1, 1,
0.7102693, -0.1364998, 3.053803, 0.7098039, 0, 1, 1,
0.7145491, -0.9516965, 2.509446, 0.7176471, 0, 1, 1,
0.7194376, 0.1259289, 1.101591, 0.7215686, 0, 1, 1,
0.7198152, -0.7924191, 1.794066, 0.7294118, 0, 1, 1,
0.7272914, 0.6844374, -0.4224955, 0.7333333, 0, 1, 1,
0.7333166, -1.332178, 2.519991, 0.7411765, 0, 1, 1,
0.7461642, 0.4317226, 0.6738443, 0.7450981, 0, 1, 1,
0.7496675, -0.9614797, 2.570807, 0.7529412, 0, 1, 1,
0.7502781, -3.158959, 4.509208, 0.7568628, 0, 1, 1,
0.7526503, 0.4390151, 0.6752334, 0.7647059, 0, 1, 1,
0.7553581, -2.588356, 5.54726, 0.7686275, 0, 1, 1,
0.755654, -0.2078589, 1.826223, 0.7764706, 0, 1, 1,
0.758104, -0.0001598184, 0.4665546, 0.7803922, 0, 1, 1,
0.7638285, 1.27802, 0.9741042, 0.7882353, 0, 1, 1,
0.7642776, 1.0405, 1.045598, 0.7921569, 0, 1, 1,
0.764867, -0.4850537, 2.674987, 0.8, 0, 1, 1,
0.7668564, 0.8242473, 2.592105, 0.8078431, 0, 1, 1,
0.7709851, -0.5813605, 1.791459, 0.8117647, 0, 1, 1,
0.784188, -0.09786283, -0.8520738, 0.8196079, 0, 1, 1,
0.7851528, 0.5264431, 0.1300746, 0.8235294, 0, 1, 1,
0.7879224, -0.4398062, 3.119414, 0.8313726, 0, 1, 1,
0.788857, 1.284698, 0.8868871, 0.8352941, 0, 1, 1,
0.7891017, 0.3992291, 1.43568, 0.8431373, 0, 1, 1,
0.7893834, 1.031541, 0.5348026, 0.8470588, 0, 1, 1,
0.7902271, 0.2246874, 0.03711847, 0.854902, 0, 1, 1,
0.7909133, -0.4982542, 1.451437, 0.8588235, 0, 1, 1,
0.7944937, 0.4973435, 1.238454, 0.8666667, 0, 1, 1,
0.7950841, 0.115286, 0.2067014, 0.8705882, 0, 1, 1,
0.797111, 0.5750248, 2.396742, 0.8784314, 0, 1, 1,
0.8172892, -0.04517876, 0.453906, 0.8823529, 0, 1, 1,
0.8182946, 0.6865478, 2.886194, 0.8901961, 0, 1, 1,
0.8228224, 0.5976709, 1.864606, 0.8941177, 0, 1, 1,
0.8334522, 0.8448651, 1.30662, 0.9019608, 0, 1, 1,
0.8334686, -2.038633, 2.09147, 0.9098039, 0, 1, 1,
0.8346778, 0.3911659, 1.180106, 0.9137255, 0, 1, 1,
0.8388653, 0.339186, 0.5892735, 0.9215686, 0, 1, 1,
0.8410552, 1.845332, 0.5608442, 0.9254902, 0, 1, 1,
0.8456088, -1.611166, 3.718237, 0.9333333, 0, 1, 1,
0.8500066, 1.247107, 0.04770238, 0.9372549, 0, 1, 1,
0.8515651, -0.4612076, 3.293533, 0.945098, 0, 1, 1,
0.8538641, -0.6945397, 2.358077, 0.9490196, 0, 1, 1,
0.8584988, -1.121091, 1.827592, 0.9568627, 0, 1, 1,
0.8655485, -0.5061114, 1.549591, 0.9607843, 0, 1, 1,
0.8661394, -0.3052047, 1.544562, 0.9686275, 0, 1, 1,
0.8677047, -1.375937, 1.995518, 0.972549, 0, 1, 1,
0.8692955, -0.1148154, 2.948913, 0.9803922, 0, 1, 1,
0.8726907, -2.092463, 2.275774, 0.9843137, 0, 1, 1,
0.8738255, -0.1189663, 3.02252, 0.9921569, 0, 1, 1,
0.8753233, 0.1812176, 1.295257, 0.9960784, 0, 1, 1,
0.8767521, 0.1498315, 1.16134, 1, 0, 0.9960784, 1,
0.8813496, 0.9672998, 1.346045, 1, 0, 0.9882353, 1,
0.8831953, 0.8070957, -0.03265238, 1, 0, 0.9843137, 1,
0.8834793, 0.9348468, -1.110969, 1, 0, 0.9764706, 1,
0.8844799, 1.60842, 1.136281, 1, 0, 0.972549, 1,
0.8868533, 1.243066, -0.493426, 1, 0, 0.9647059, 1,
0.8872605, -2.405707, 4.121266, 1, 0, 0.9607843, 1,
0.8956184, 0.4140854, 0.2137425, 1, 0, 0.9529412, 1,
0.8960706, 0.6198886, -0.03713793, 1, 0, 0.9490196, 1,
0.896672, -1.205503, 3.318562, 1, 0, 0.9411765, 1,
0.8971361, -0.4627952, 2.354583, 1, 0, 0.9372549, 1,
0.8971687, 0.3857842, 1.591707, 1, 0, 0.9294118, 1,
0.8988746, 0.5988159, 1.995422, 1, 0, 0.9254902, 1,
0.9117789, 0.1654733, 2.218532, 1, 0, 0.9176471, 1,
0.9166965, -2.467123, 4.148834, 1, 0, 0.9137255, 1,
0.9175055, -1.054166, 1.927144, 1, 0, 0.9058824, 1,
0.9254842, 1.170081, 0.7937068, 1, 0, 0.9019608, 1,
0.9277915, 0.1828222, 2.515334, 1, 0, 0.8941177, 1,
0.9354212, -0.9677641, 1.607771, 1, 0, 0.8862745, 1,
0.9433357, -1.789, 3.523121, 1, 0, 0.8823529, 1,
0.9436274, 0.1665644, 1.826919, 1, 0, 0.8745098, 1,
0.9462567, -0.6360715, 2.359332, 1, 0, 0.8705882, 1,
0.9538973, -0.8393345, 3.382886, 1, 0, 0.8627451, 1,
0.956132, -0.8001388, 2.656268, 1, 0, 0.8588235, 1,
0.9635104, 0.9041231, 1.031291, 1, 0, 0.8509804, 1,
0.9677426, 0.1771, 2.192452, 1, 0, 0.8470588, 1,
0.9677985, 1.324744, 0.7619382, 1, 0, 0.8392157, 1,
0.9697951, -1.560359, 1.302207, 1, 0, 0.8352941, 1,
0.9715793, -0.01073018, 0.8066556, 1, 0, 0.827451, 1,
0.9742695, -1.019944, 3.4684, 1, 0, 0.8235294, 1,
0.9755074, 0.3266779, 1.616872, 1, 0, 0.8156863, 1,
0.9771125, -0.6624262, 1.704364, 1, 0, 0.8117647, 1,
0.985783, 0.8893228, 1.630962, 1, 0, 0.8039216, 1,
1.008746, 0.5042355, 0.5867472, 1, 0, 0.7960784, 1,
1.008861, -2.465137, 2.415385, 1, 0, 0.7921569, 1,
1.009635, 0.9850997, 0.5326895, 1, 0, 0.7843137, 1,
1.02174, -0.8311199, 3.683044, 1, 0, 0.7803922, 1,
1.023116, 0.5557014, 0.5859585, 1, 0, 0.772549, 1,
1.030709, 1.065414, -0.6482188, 1, 0, 0.7686275, 1,
1.034415, 1.092207, 0.808937, 1, 0, 0.7607843, 1,
1.039181, -0.2213903, 3.056422, 1, 0, 0.7568628, 1,
1.054942, 1.013711, 1.140072, 1, 0, 0.7490196, 1,
1.070155, 0.6944792, 0.7504601, 1, 0, 0.7450981, 1,
1.072229, 0.08522617, 0.9440181, 1, 0, 0.7372549, 1,
1.073242, -0.1852066, 0.3901384, 1, 0, 0.7333333, 1,
1.07498, 1.289721, 0.4082263, 1, 0, 0.7254902, 1,
1.075797, -1.957442, 1.675397, 1, 0, 0.7215686, 1,
1.079346, 1.779211, 0.32511, 1, 0, 0.7137255, 1,
1.079397, -0.3720939, 1.454724, 1, 0, 0.7098039, 1,
1.100895, 1.250894, 1.700455, 1, 0, 0.7019608, 1,
1.110949, -0.6511414, 1.44916, 1, 0, 0.6941177, 1,
1.130654, 0.9096454, 2.016965, 1, 0, 0.6901961, 1,
1.133858, -1.477698, 0.6813968, 1, 0, 0.682353, 1,
1.135616, 0.8043547, 0.3295199, 1, 0, 0.6784314, 1,
1.140833, -0.3718705, 2.018882, 1, 0, 0.6705883, 1,
1.158067, -0.7301239, 2.897104, 1, 0, 0.6666667, 1,
1.158194, -1.973616, 1.100266, 1, 0, 0.6588235, 1,
1.167232, -0.4037491, 1.073744, 1, 0, 0.654902, 1,
1.17468, 1.105091, 0.482123, 1, 0, 0.6470588, 1,
1.194985, 1.383554, 0.3009586, 1, 0, 0.6431373, 1,
1.196599, 0.5101891, 0.02598557, 1, 0, 0.6352941, 1,
1.205066, 0.9729411, 2.002525, 1, 0, 0.6313726, 1,
1.220709, -0.4300272, 3.965153, 1, 0, 0.6235294, 1,
1.228675, -0.6108881, 0.2956328, 1, 0, 0.6196079, 1,
1.24234, -1.146826, 3.435367, 1, 0, 0.6117647, 1,
1.242481, 0.1281103, -1.771085, 1, 0, 0.6078432, 1,
1.248787, -0.2279576, 3.163633, 1, 0, 0.6, 1,
1.252086, 1.187398, 0.6102178, 1, 0, 0.5921569, 1,
1.255574, 1.004493, 1.704791, 1, 0, 0.5882353, 1,
1.258475, 0.5014282, 0.6710486, 1, 0, 0.5803922, 1,
1.25988, -0.2790766, 3.748256, 1, 0, 0.5764706, 1,
1.266073, -2.298094, 3.494929, 1, 0, 0.5686275, 1,
1.268968, -1.18106, 1.728416, 1, 0, 0.5647059, 1,
1.269589, 0.8945981, 2.104852, 1, 0, 0.5568628, 1,
1.272176, -1.994554, 1.716, 1, 0, 0.5529412, 1,
1.276847, -0.08545063, 1.679694, 1, 0, 0.5450981, 1,
1.279923, 0.1580803, 2.154068, 1, 0, 0.5411765, 1,
1.282307, -0.4539416, 0.7496868, 1, 0, 0.5333334, 1,
1.28296, 0.9018196, 0.567648, 1, 0, 0.5294118, 1,
1.296271, -1.574644, 3.350047, 1, 0, 0.5215687, 1,
1.296682, -0.4004122, 3.230464, 1, 0, 0.5176471, 1,
1.298913, 1.391708, 0.7503719, 1, 0, 0.509804, 1,
1.309464, 0.1714314, 1.163985, 1, 0, 0.5058824, 1,
1.317357, -1.003226, 2.885625, 1, 0, 0.4980392, 1,
1.348415, 0.9757483, -0.4653837, 1, 0, 0.4901961, 1,
1.348603, -1.211252, 3.046057, 1, 0, 0.4862745, 1,
1.356068, -0.1426257, 1.736567, 1, 0, 0.4784314, 1,
1.3714, 0.1205829, 2.423078, 1, 0, 0.4745098, 1,
1.379968, -0.3045121, 1.459632, 1, 0, 0.4666667, 1,
1.382577, 0.2099836, 1.928375, 1, 0, 0.4627451, 1,
1.387161, -1.516738, 4.116466, 1, 0, 0.454902, 1,
1.401423, -0.8031862, 3.239394, 1, 0, 0.4509804, 1,
1.408634, -1.15706, 2.733705, 1, 0, 0.4431373, 1,
1.418849, 0.03795259, 2.363233, 1, 0, 0.4392157, 1,
1.42252, -0.5717464, 3.329727, 1, 0, 0.4313726, 1,
1.432505, -1.06625, 1.640597, 1, 0, 0.427451, 1,
1.443756, 0.6929411, 1.378616, 1, 0, 0.4196078, 1,
1.448549, 1.215437, 0.3853343, 1, 0, 0.4156863, 1,
1.451637, -1.026631, 3.05058, 1, 0, 0.4078431, 1,
1.452289, 1.452669, 0.5623002, 1, 0, 0.4039216, 1,
1.465501, -0.749177, 2.853292, 1, 0, 0.3960784, 1,
1.496603, -0.2091097, 1.026161, 1, 0, 0.3882353, 1,
1.506289, 0.187051, 2.716033, 1, 0, 0.3843137, 1,
1.51203, -0.6565912, 2.085192, 1, 0, 0.3764706, 1,
1.512211, 0.6974248, -0.8082449, 1, 0, 0.372549, 1,
1.515884, -0.3525447, 1.87285, 1, 0, 0.3647059, 1,
1.540719, -0.2666671, 1.833879, 1, 0, 0.3607843, 1,
1.551912, -0.175059, 3.892056, 1, 0, 0.3529412, 1,
1.553966, -1.41206, 0.1692542, 1, 0, 0.3490196, 1,
1.558299, -2.371428, 2.486432, 1, 0, 0.3411765, 1,
1.559285, 0.7045721, 1.784368, 1, 0, 0.3372549, 1,
1.564447, 0.7744502, 1.804748, 1, 0, 0.3294118, 1,
1.568305, -0.8958929, 3.211864, 1, 0, 0.3254902, 1,
1.570643, 0.8807256, 0.8653753, 1, 0, 0.3176471, 1,
1.608085, -1.034958, 2.823252, 1, 0, 0.3137255, 1,
1.613024, -0.08167375, 2.484834, 1, 0, 0.3058824, 1,
1.63019, -1.117393, 2.492247, 1, 0, 0.2980392, 1,
1.638301, 0.2297781, -0.6766288, 1, 0, 0.2941177, 1,
1.669912, -1.726196, 2.676049, 1, 0, 0.2862745, 1,
1.688946, 0.6094919, 0.2585746, 1, 0, 0.282353, 1,
1.689272, 0.01610635, 1.452414, 1, 0, 0.2745098, 1,
1.697783, -0.2546043, -0.05442305, 1, 0, 0.2705882, 1,
1.705663, -1.334508, 2.947338, 1, 0, 0.2627451, 1,
1.705821, -0.9035935, 1.693872, 1, 0, 0.2588235, 1,
1.710392, -0.5239263, 1.416797, 1, 0, 0.2509804, 1,
1.733045, -0.9009444, 1.799112, 1, 0, 0.2470588, 1,
1.739251, -0.07446378, 2.803485, 1, 0, 0.2392157, 1,
1.739511, -1.182538, 0.5623771, 1, 0, 0.2352941, 1,
1.743032, 0.3240778, -0.6945792, 1, 0, 0.227451, 1,
1.744892, 0.07936396, -0.2286458, 1, 0, 0.2235294, 1,
1.786398, 0.1414504, 2.577147, 1, 0, 0.2156863, 1,
1.792351, 0.2125489, 1.921097, 1, 0, 0.2117647, 1,
1.819244, -0.8204162, 2.048294, 1, 0, 0.2039216, 1,
1.845272, -1.400764, 2.040848, 1, 0, 0.1960784, 1,
1.847934, -0.3231499, 1.299814, 1, 0, 0.1921569, 1,
1.858003, -1.236844, 2.822143, 1, 0, 0.1843137, 1,
1.914442, 0.5371115, 2.056102, 1, 0, 0.1803922, 1,
1.978653, 2.567848, 1.23955, 1, 0, 0.172549, 1,
1.995153, 0.01742691, 2.738554, 1, 0, 0.1686275, 1,
2.014896, 0.4315147, 0.888147, 1, 0, 0.1607843, 1,
2.028035, -0.1797836, 1.870952, 1, 0, 0.1568628, 1,
2.030705, -0.5264883, 1.73116, 1, 0, 0.1490196, 1,
2.034819, 1.074384, 1.527814, 1, 0, 0.145098, 1,
2.057752, 0.07797046, 1.100778, 1, 0, 0.1372549, 1,
2.077315, 0.5320867, 1.416819, 1, 0, 0.1333333, 1,
2.090542, 0.3624642, 1.995545, 1, 0, 0.1254902, 1,
2.09614, 0.6058819, 1.923922, 1, 0, 0.1215686, 1,
2.112358, -0.5676753, 1.075094, 1, 0, 0.1137255, 1,
2.156461, -0.6413727, 1.619164, 1, 0, 0.1098039, 1,
2.18696, 1.162134, 0.2278133, 1, 0, 0.1019608, 1,
2.198667, -0.9780299, 2.597946, 1, 0, 0.09411765, 1,
2.300419, -0.5522724, 2.97353, 1, 0, 0.09019608, 1,
2.328456, 1.154855, 2.176084, 1, 0, 0.08235294, 1,
2.335185, 0.4432732, 1.811426, 1, 0, 0.07843138, 1,
2.339471, 0.4496157, 2.447442, 1, 0, 0.07058824, 1,
2.360719, -0.4017262, 0.64306, 1, 0, 0.06666667, 1,
2.469424, 2.30603, 1.00718, 1, 0, 0.05882353, 1,
2.470108, 1.071534, -0.4893771, 1, 0, 0.05490196, 1,
2.481086, 1.309143, 0.5350243, 1, 0, 0.04705882, 1,
2.489857, -0.7908311, 1.948523, 1, 0, 0.04313726, 1,
2.734436, -0.805663, 2.803123, 1, 0, 0.03529412, 1,
2.80475, 0.4608795, 0.8906963, 1, 0, 0.03137255, 1,
2.815619, 1.483654, 4.009062, 1, 0, 0.02352941, 1,
2.8805, -0.722698, 1.300666, 1, 0, 0.01960784, 1,
3.282542, -1.166801, 0.9521965, 1, 0, 0.01176471, 1,
3.429822, 1.018223, -0.02664759, 1, 0, 0.007843138, 1
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
-0.013574, -4.325368, -8.038466, 0, -0.5, 0.5, 0.5,
-0.013574, -4.325368, -8.038466, 1, -0.5, 0.5, 0.5,
-0.013574, -4.325368, -8.038466, 1, 1.5, 0.5, 0.5,
-0.013574, -4.325368, -8.038466, 0, 1.5, 0.5, 0.5
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
-4.624281, 0.2817777, -8.038466, 0, -0.5, 0.5, 0.5,
-4.624281, 0.2817777, -8.038466, 1, -0.5, 0.5, 0.5,
-4.624281, 0.2817777, -8.038466, 1, 1.5, 0.5, 0.5,
-4.624281, 0.2817777, -8.038466, 0, 1.5, 0.5, 0.5
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
-4.624281, -4.325368, -0.2610881, 0, -0.5, 0.5, 0.5,
-4.624281, -4.325368, -0.2610881, 1, -0.5, 0.5, 0.5,
-4.624281, -4.325368, -0.2610881, 1, 1.5, 0.5, 0.5,
-4.624281, -4.325368, -0.2610881, 0, 1.5, 0.5, 0.5
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
-3, -3.262181, -6.243687,
3, -3.262181, -6.243687,
-3, -3.262181, -6.243687,
-3, -3.439379, -6.542817,
-2, -3.262181, -6.243687,
-2, -3.439379, -6.542817,
-1, -3.262181, -6.243687,
-1, -3.439379, -6.542817,
0, -3.262181, -6.243687,
0, -3.439379, -6.542817,
1, -3.262181, -6.243687,
1, -3.439379, -6.542817,
2, -3.262181, -6.243687,
2, -3.439379, -6.542817,
3, -3.262181, -6.243687,
3, -3.439379, -6.542817
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
-3, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
-3, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
-3, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
-3, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
-2, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
-2, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
-2, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
-2, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
-1, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
-1, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
-1, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
-1, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
0, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
0, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
0, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
0, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
1, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
1, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
1, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
1, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
2, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
2, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
2, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
2, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5,
3, -3.793775, -7.141077, 0, -0.5, 0.5, 0.5,
3, -3.793775, -7.141077, 1, -0.5, 0.5, 0.5,
3, -3.793775, -7.141077, 1, 1.5, 0.5, 0.5,
3, -3.793775, -7.141077, 0, 1.5, 0.5, 0.5
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
-3.560272, -3, -6.243687,
-3.560272, 3, -6.243687,
-3.560272, -3, -6.243687,
-3.737607, -3, -6.542817,
-3.560272, -2, -6.243687,
-3.737607, -2, -6.542817,
-3.560272, -1, -6.243687,
-3.737607, -1, -6.542817,
-3.560272, 0, -6.243687,
-3.737607, 0, -6.542817,
-3.560272, 1, -6.243687,
-3.737607, 1, -6.542817,
-3.560272, 2, -6.243687,
-3.737607, 2, -6.542817,
-3.560272, 3, -6.243687,
-3.737607, 3, -6.542817
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
-4.092277, -3, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, -3, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, -3, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, -3, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, -2, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, -2, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, -2, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, -2, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, -1, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, -1, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, -1, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, -1, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, 0, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, 0, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, 0, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, 0, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, 1, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, 1, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, 1, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, 1, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, 2, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, 2, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, 2, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, 2, -7.141077, 0, 1.5, 0.5, 0.5,
-4.092277, 3, -7.141077, 0, -0.5, 0.5, 0.5,
-4.092277, 3, -7.141077, 1, -0.5, 0.5, 0.5,
-4.092277, 3, -7.141077, 1, 1.5, 0.5, 0.5,
-4.092277, 3, -7.141077, 0, 1.5, 0.5, 0.5
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
-3.560272, -3.262181, -6,
-3.560272, -3.262181, 4,
-3.560272, -3.262181, -6,
-3.737607, -3.439379, -6,
-3.560272, -3.262181, -4,
-3.737607, -3.439379, -4,
-3.560272, -3.262181, -2,
-3.737607, -3.439379, -2,
-3.560272, -3.262181, 0,
-3.737607, -3.439379, 0,
-3.560272, -3.262181, 2,
-3.737607, -3.439379, 2,
-3.560272, -3.262181, 4,
-3.737607, -3.439379, 4
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
-4.092277, -3.793775, -6, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -6, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -6, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, -6, 0, 1.5, 0.5, 0.5,
-4.092277, -3.793775, -4, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -4, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -4, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, -4, 0, 1.5, 0.5, 0.5,
-4.092277, -3.793775, -2, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -2, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, -2, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, -2, 0, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 0, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 0, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 0, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 0, 0, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 2, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 2, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 2, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 2, 0, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 4, 0, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 4, 1, -0.5, 0.5, 0.5,
-4.092277, -3.793775, 4, 1, 1.5, 0.5, 0.5,
-4.092277, -3.793775, 4, 0, 1.5, 0.5, 0.5
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
-3.560272, -3.262181, -6.243687,
-3.560272, 3.825736, -6.243687,
-3.560272, -3.262181, 5.721511,
-3.560272, 3.825736, 5.721511,
-3.560272, -3.262181, -6.243687,
-3.560272, -3.262181, 5.721511,
-3.560272, 3.825736, -6.243687,
-3.560272, 3.825736, 5.721511,
-3.560272, -3.262181, -6.243687,
3.533124, -3.262181, -6.243687,
-3.560272, -3.262181, 5.721511,
3.533124, -3.262181, 5.721511,
-3.560272, 3.825736, -6.243687,
3.533124, 3.825736, -6.243687,
-3.560272, 3.825736, 5.721511,
3.533124, 3.825736, 5.721511,
3.533124, -3.262181, -6.243687,
3.533124, 3.825736, -6.243687,
3.533124, -3.262181, 5.721511,
3.533124, 3.825736, 5.721511,
3.533124, -3.262181, -6.243687,
3.533124, -3.262181, 5.721511,
3.533124, 3.825736, -6.243687,
3.533124, 3.825736, 5.721511
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
var radius = 8.33627;
var distance = 37.089;
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
mvMatrix.translate( 0.013574, -0.2817777, 0.2610881 );
mvMatrix.scale( 1.270666, 1.271648, 0.7532962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.089);
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
Chloropropham<-read.table("Chloropropham.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.45697, -0.01018515, -0.6501895, 0, 0, 1, 1, 1,
-2.924641, 1.126938, -1.126666, 1, 0, 0, 1, 1,
-2.913572, -0.4846381, -1.071673, 1, 0, 0, 1, 1,
-2.817816, 1.020797, -0.7069138, 1, 0, 0, 1, 1,
-2.797239, -1.010332, -2.275256, 1, 0, 0, 1, 1,
-2.767593, 2.008498, -2.403524, 1, 0, 0, 1, 1,
-2.615914, 0.1133216, -0.5242007, 0, 0, 0, 1, 1,
-2.59812, 0.5155289, -0.9797841, 0, 0, 0, 1, 1,
-2.590568, 1.711207, -0.5782598, 0, 0, 0, 1, 1,
-2.56576, 1.100176, -0.9682829, 0, 0, 0, 1, 1,
-2.560845, -1.442973, -3.534178, 0, 0, 0, 1, 1,
-2.552327, 1.457496, -1.347323, 0, 0, 0, 1, 1,
-2.462795, -0.5680798, -1.337382, 0, 0, 0, 1, 1,
-2.428269, -1.445574, -1.323485, 1, 1, 1, 1, 1,
-2.345689, -1.631352, -1.782109, 1, 1, 1, 1, 1,
-2.313027, -0.1563449, -1.735004, 1, 1, 1, 1, 1,
-2.294347, 0.5704635, -1.786532, 1, 1, 1, 1, 1,
-2.234027, -0.3316553, -0.8801551, 1, 1, 1, 1, 1,
-2.21349, -0.9840182, -3.098669, 1, 1, 1, 1, 1,
-2.152676, -0.8347577, -1.940473, 1, 1, 1, 1, 1,
-2.124033, -0.891708, -2.114066, 1, 1, 1, 1, 1,
-2.123526, -2.290939, -3.857141, 1, 1, 1, 1, 1,
-2.069898, -0.622602, -0.9106723, 1, 1, 1, 1, 1,
-2.060832, 1.138607, -0.7436252, 1, 1, 1, 1, 1,
-2.04457, 0.8862509, -0.4672959, 1, 1, 1, 1, 1,
-2.028621, -1.60913, -3.368821, 1, 1, 1, 1, 1,
-2.025415, -1.396482, -1.35394, 1, 1, 1, 1, 1,
-2.010355, -0.01699563, -2.032394, 1, 1, 1, 1, 1,
-2.00916, 0.4959702, -0.1484838, 0, 0, 1, 1, 1,
-1.981688, 0.7176412, -0.3368123, 1, 0, 0, 1, 1,
-1.980537, 1.009249, 0.1673153, 1, 0, 0, 1, 1,
-1.941759, 0.4922285, -0.262078, 1, 0, 0, 1, 1,
-1.933518, 0.7124438, -1.347122, 1, 0, 0, 1, 1,
-1.897392, -0.1603394, -3.564078, 1, 0, 0, 1, 1,
-1.8966, 1.026147, -0.72695, 0, 0, 0, 1, 1,
-1.868994, -1.088164, 0.7703818, 0, 0, 0, 1, 1,
-1.863985, 0.6753171, -0.3873253, 0, 0, 0, 1, 1,
-1.860426, 0.1226839, 0.4741213, 0, 0, 0, 1, 1,
-1.855304, -2.646932, -1.666171, 0, 0, 0, 1, 1,
-1.854419, -0.8619897, -2.121103, 0, 0, 0, 1, 1,
-1.824809, -0.9379427, -1.512448, 0, 0, 0, 1, 1,
-1.817362, 1.014647, -1.267061, 1, 1, 1, 1, 1,
-1.814609, -0.9107243, -2.076754, 1, 1, 1, 1, 1,
-1.808596, 1.354603, -0.208411, 1, 1, 1, 1, 1,
-1.800719, -1.747326, -3.408334, 1, 1, 1, 1, 1,
-1.797956, 0.01936217, -1.599556, 1, 1, 1, 1, 1,
-1.777528, 0.2309667, -0.9187731, 1, 1, 1, 1, 1,
-1.777269, 0.3147614, -2.35856, 1, 1, 1, 1, 1,
-1.771905, 0.4134095, -2.24771, 1, 1, 1, 1, 1,
-1.759688, -1.049322, -0.43649, 1, 1, 1, 1, 1,
-1.749871, 0.1483355, -0.3305873, 1, 1, 1, 1, 1,
-1.744138, 0.420805, -0.7016622, 1, 1, 1, 1, 1,
-1.716894, -0.1105568, -1.89289, 1, 1, 1, 1, 1,
-1.716004, -0.3357662, -1.246692, 1, 1, 1, 1, 1,
-1.695039, 0.6888814, 0.7474572, 1, 1, 1, 1, 1,
-1.679217, -0.9402826, -2.107138, 1, 1, 1, 1, 1,
-1.671244, 0.2398026, -2.697536, 0, 0, 1, 1, 1,
-1.671078, -0.5695911, -0.9872893, 1, 0, 0, 1, 1,
-1.668276, 1.369368, 1.205347, 1, 0, 0, 1, 1,
-1.66216, 1.809477, -0.3677184, 1, 0, 0, 1, 1,
-1.656131, -0.02805784, -2.665077, 1, 0, 0, 1, 1,
-1.643733, 0.05949468, -1.594004, 1, 0, 0, 1, 1,
-1.641128, -0.1712881, -2.093778, 0, 0, 0, 1, 1,
-1.638424, 0.9647352, 0.1817027, 0, 0, 0, 1, 1,
-1.631644, 0.5852288, -2.288362, 0, 0, 0, 1, 1,
-1.616301, 2.588466, 1.038336, 0, 0, 0, 1, 1,
-1.604294, 1.647967, -2.246316, 0, 0, 0, 1, 1,
-1.597219, 1.345901, -2.368172, 0, 0, 0, 1, 1,
-1.577052, -1.063745, -2.119445, 0, 0, 0, 1, 1,
-1.566582, -1.08505, -2.476171, 1, 1, 1, 1, 1,
-1.565885, -0.09479514, -1.146963, 1, 1, 1, 1, 1,
-1.562796, -0.9131967, -2.726582, 1, 1, 1, 1, 1,
-1.562183, 0.444502, -0.4756444, 1, 1, 1, 1, 1,
-1.559176, -0.1149282, -1.342234, 1, 1, 1, 1, 1,
-1.557568, 1.059269, -0.7119896, 1, 1, 1, 1, 1,
-1.545186, 0.8769044, -1.17667, 1, 1, 1, 1, 1,
-1.5425, -0.6619492, -1.567395, 1, 1, 1, 1, 1,
-1.534718, -0.1153532, -2.684546, 1, 1, 1, 1, 1,
-1.533987, 0.8981631, -2.842693, 1, 1, 1, 1, 1,
-1.513291, 0.8153293, -0.6502479, 1, 1, 1, 1, 1,
-1.511572, 0.6469943, -1.105379, 1, 1, 1, 1, 1,
-1.470271, -0.6949963, -2.959043, 1, 1, 1, 1, 1,
-1.455311, 0.5030906, -1.10125, 1, 1, 1, 1, 1,
-1.452559, 0.1675012, -3.761379, 1, 1, 1, 1, 1,
-1.446855, 1.276242, -0.4591086, 0, 0, 1, 1, 1,
-1.421181, -0.8169087, -1.991788, 1, 0, 0, 1, 1,
-1.413647, 0.0774233, -1.864381, 1, 0, 0, 1, 1,
-1.411712, -1.447949, -2.932752, 1, 0, 0, 1, 1,
-1.409506, -0.004714453, -3.345001, 1, 0, 0, 1, 1,
-1.398385, -1.063983, -0.5712572, 1, 0, 0, 1, 1,
-1.394721, -0.3008792, -1.117119, 0, 0, 0, 1, 1,
-1.385599, -1.399423, -2.146626, 0, 0, 0, 1, 1,
-1.385223, -0.738109, -1.95286, 0, 0, 0, 1, 1,
-1.38368, 1.202832, -1.080628, 0, 0, 0, 1, 1,
-1.380841, 1.041198, 1.732657, 0, 0, 0, 1, 1,
-1.376824, -0.02756052, -2.853468, 0, 0, 0, 1, 1,
-1.374605, 1.283546, 0.3254784, 0, 0, 0, 1, 1,
-1.369197, -0.08393699, -3.004545, 1, 1, 1, 1, 1,
-1.351144, 0.3800296, -0.4492781, 1, 1, 1, 1, 1,
-1.332189, 0.9161067, 0.5803329, 1, 1, 1, 1, 1,
-1.320711, 1.304452, -0.7401405, 1, 1, 1, 1, 1,
-1.318534, 0.2258369, -0.9619988, 1, 1, 1, 1, 1,
-1.318215, -0.6339269, -3.113161, 1, 1, 1, 1, 1,
-1.318018, 1.872229, 0.4917437, 1, 1, 1, 1, 1,
-1.305223, -1.509444, -4.082494, 1, 1, 1, 1, 1,
-1.280432, -0.3344586, -1.107163, 1, 1, 1, 1, 1,
-1.278613, 0.8040695, 1.02992, 1, 1, 1, 1, 1,
-1.275235, -1.013462, -2.128127, 1, 1, 1, 1, 1,
-1.272149, -0.4316289, -2.623516, 1, 1, 1, 1, 1,
-1.270143, -0.8335091, -2.024132, 1, 1, 1, 1, 1,
-1.267356, 0.9044317, -1.573962, 1, 1, 1, 1, 1,
-1.261532, -0.7479252, -0.952015, 1, 1, 1, 1, 1,
-1.258326, -0.2022986, -2.567753, 0, 0, 1, 1, 1,
-1.252625, -1.275712, -1.052637, 1, 0, 0, 1, 1,
-1.250074, -0.2508255, -3.777827, 1, 0, 0, 1, 1,
-1.249571, -1.138715, -3.970495, 1, 0, 0, 1, 1,
-1.248054, -0.3025297, -1.279594, 1, 0, 0, 1, 1,
-1.247833, 2.109286, -4.369287, 1, 0, 0, 1, 1,
-1.237205, 0.59515, -1.292557, 0, 0, 0, 1, 1,
-1.228606, 1.174629, 0.2666523, 0, 0, 0, 1, 1,
-1.227693, 0.5919222, -1.703592, 0, 0, 0, 1, 1,
-1.214712, -1.273733, -1.655371, 0, 0, 0, 1, 1,
-1.211709, 1.338505, -0.5111439, 0, 0, 0, 1, 1,
-1.211417, 1.222896, -0.6577333, 0, 0, 0, 1, 1,
-1.202338, -0.2575698, -0.9282992, 0, 0, 0, 1, 1,
-1.199322, 0.006210409, -1.942946, 1, 1, 1, 1, 1,
-1.193813, -0.1502508, -2.531433, 1, 1, 1, 1, 1,
-1.192636, 0.7826241, -1.019921, 1, 1, 1, 1, 1,
-1.188671, 0.5226153, -1.703055, 1, 1, 1, 1, 1,
-1.184621, -1.384341, -3.818848, 1, 1, 1, 1, 1,
-1.175695, 1.467169, -0.5865586, 1, 1, 1, 1, 1,
-1.169505, -0.3396332, -0.9341567, 1, 1, 1, 1, 1,
-1.167179, 1.28302, -0.957397, 1, 1, 1, 1, 1,
-1.166343, -0.4679752, -1.674759, 1, 1, 1, 1, 1,
-1.157261, -1.045931, -3.0603, 1, 1, 1, 1, 1,
-1.148513, 0.1355696, -2.415025, 1, 1, 1, 1, 1,
-1.142338, 0.2300598, -2.250293, 1, 1, 1, 1, 1,
-1.140928, -1.253464, -4.177712, 1, 1, 1, 1, 1,
-1.140595, -1.627697, -3.437541, 1, 1, 1, 1, 1,
-1.13253, -2.501722, -1.799356, 1, 1, 1, 1, 1,
-1.12601, 0.4950004, -1.869822, 0, 0, 1, 1, 1,
-1.123245, 0.6987466, -1.199008, 1, 0, 0, 1, 1,
-1.119129, -0.2104282, -2.855202, 1, 0, 0, 1, 1,
-1.118363, 1.798542, -2.047304, 1, 0, 0, 1, 1,
-1.115735, 0.9747321, -1.903238, 1, 0, 0, 1, 1,
-1.113459, 0.6343145, -1.170427, 1, 0, 0, 1, 1,
-1.108983, 0.1186391, -1.819215, 0, 0, 0, 1, 1,
-1.106193, -0.03596211, -1.962941, 0, 0, 0, 1, 1,
-1.104597, 0.3240044, -1.566284, 0, 0, 0, 1, 1,
-1.101972, -0.5689057, -3.227447, 0, 0, 0, 1, 1,
-1.098316, 0.8930181, -0.9810988, 0, 0, 0, 1, 1,
-1.093219, 0.9130061, -1.25146, 0, 0, 0, 1, 1,
-1.091413, -0.5084951, -3.516749, 0, 0, 0, 1, 1,
-1.085191, 0.1936294, -0.07890432, 1, 1, 1, 1, 1,
-1.083946, -0.1972454, -1.459704, 1, 1, 1, 1, 1,
-1.070269, -0.2318912, -2.6362, 1, 1, 1, 1, 1,
-1.069307, 1.488855, -1.247348, 1, 1, 1, 1, 1,
-1.066468, -0.000918526, -2.306437, 1, 1, 1, 1, 1,
-1.065911, -1.191321, -2.873675, 1, 1, 1, 1, 1,
-1.060276, 0.2870244, -2.123449, 1, 1, 1, 1, 1,
-1.060022, 0.4543516, -1.301552, 1, 1, 1, 1, 1,
-1.040103, 0.5067071, -1.196426, 1, 1, 1, 1, 1,
-1.039979, 0.3793167, -1.761103, 1, 1, 1, 1, 1,
-1.039071, 0.3358243, -0.8688301, 1, 1, 1, 1, 1,
-1.035735, 0.3529035, -1.13889, 1, 1, 1, 1, 1,
-1.031809, 0.1978729, -1.342907, 1, 1, 1, 1, 1,
-1.023548, 1.05275, -0.09740487, 1, 1, 1, 1, 1,
-1.014656, -0.01719395, -0.9803313, 1, 1, 1, 1, 1,
-1.014035, -0.2238451, -1.726634, 0, 0, 1, 1, 1,
-1.012828, -0.5606515, -1.740832, 1, 0, 0, 1, 1,
-1.011847, 0.9699658, -1.969654, 1, 0, 0, 1, 1,
-1.011308, 1.045634, -1.969532, 1, 0, 0, 1, 1,
-1.009076, -1.593731, -4.026806, 1, 0, 0, 1, 1,
-1.005657, -0.5721903, -2.170143, 1, 0, 0, 1, 1,
-0.9934185, 0.02401203, -0.4178176, 0, 0, 0, 1, 1,
-0.9896898, 0.05072346, -2.23648, 0, 0, 0, 1, 1,
-0.9892456, -0.4894031, -2.246917, 0, 0, 0, 1, 1,
-0.9871306, -0.9446262, -0.6642479, 0, 0, 0, 1, 1,
-0.9859402, 0.2310723, -1.113249, 0, 0, 0, 1, 1,
-0.98509, -1.973378, -2.97079, 0, 0, 0, 1, 1,
-0.9837286, -0.6767113, -2.762041, 0, 0, 0, 1, 1,
-0.9836383, -0.004667026, -0.3468626, 1, 1, 1, 1, 1,
-0.9769353, -1.04404, -3.214594, 1, 1, 1, 1, 1,
-0.9767183, -0.3102109, -2.110697, 1, 1, 1, 1, 1,
-0.9713041, -0.4746628, -1.560292, 1, 1, 1, 1, 1,
-0.970997, 0.7215695, -0.8034691, 1, 1, 1, 1, 1,
-0.9672731, 2.128551, 0.6136888, 1, 1, 1, 1, 1,
-0.9633243, 0.6571248, 0.4286058, 1, 1, 1, 1, 1,
-0.9519165, -1.03586, -2.137425, 1, 1, 1, 1, 1,
-0.9476511, 1.011546, 0.08636349, 1, 1, 1, 1, 1,
-0.9458571, 0.7638072, -0.5858384, 1, 1, 1, 1, 1,
-0.9408754, -1.508707, -3.327841, 1, 1, 1, 1, 1,
-0.9349993, -0.8929572, -2.324463, 1, 1, 1, 1, 1,
-0.9315715, 0.9464467, 0.2248733, 1, 1, 1, 1, 1,
-0.9296904, -0.7922099, -2.960157, 1, 1, 1, 1, 1,
-0.9260014, 0.2955445, -1.542277, 1, 1, 1, 1, 1,
-0.924213, 1.418189, -0.1815472, 0, 0, 1, 1, 1,
-0.9228625, 0.0421247, -1.385139, 1, 0, 0, 1, 1,
-0.9150409, -1.590695, -2.73359, 1, 0, 0, 1, 1,
-0.9149553, -2.470219, -2.553599, 1, 0, 0, 1, 1,
-0.9013441, -0.6732158, -1.86523, 1, 0, 0, 1, 1,
-0.9005355, 0.4419617, -1.310272, 1, 0, 0, 1, 1,
-0.8978968, 0.9586461, -1.553376, 0, 0, 0, 1, 1,
-0.8946204, 1.680517, -1.014117, 0, 0, 0, 1, 1,
-0.8904744, 0.6055764, 0.4577014, 0, 0, 0, 1, 1,
-0.8867506, -0.3855113, -0.08120371, 0, 0, 0, 1, 1,
-0.8840588, -1.131139, -2.684449, 0, 0, 0, 1, 1,
-0.8780788, 1.095343, -2.032546, 0, 0, 0, 1, 1,
-0.8745339, 1.318678, 1.682931, 0, 0, 0, 1, 1,
-0.8697761, 0.9046267, -1.99606, 1, 1, 1, 1, 1,
-0.857133, -1.049328, 0.2073298, 1, 1, 1, 1, 1,
-0.8530768, -2.071043, -1.740405, 1, 1, 1, 1, 1,
-0.8374724, -2.057466, -1.31167, 1, 1, 1, 1, 1,
-0.8366286, -1.34056, -1.960752, 1, 1, 1, 1, 1,
-0.8282732, -1.52258, -0.3862484, 1, 1, 1, 1, 1,
-0.8218662, 0.2322359, -2.384781, 1, 1, 1, 1, 1,
-0.8208499, -0.6424393, -2.77377, 1, 1, 1, 1, 1,
-0.8205689, -0.4029362, -1.5896, 1, 1, 1, 1, 1,
-0.8201885, 3.722514, -0.9961948, 1, 1, 1, 1, 1,
-0.8100656, 1.386995, -0.6894906, 1, 1, 1, 1, 1,
-0.8066524, -1.215255, -2.259925, 1, 1, 1, 1, 1,
-0.8065853, 0.01517741, -2.952966, 1, 1, 1, 1, 1,
-0.7982373, -0.2302801, -1.124387, 1, 1, 1, 1, 1,
-0.7971154, 0.9943898, -0.9570422, 1, 1, 1, 1, 1,
-0.7950979, -1.591065, -1.031296, 0, 0, 1, 1, 1,
-0.7938375, -0.09913946, -2.412817, 1, 0, 0, 1, 1,
-0.7861838, -0.6463999, -1.590069, 1, 0, 0, 1, 1,
-0.7842357, 2.89454, -0.3773876, 1, 0, 0, 1, 1,
-0.782697, -1.513872, -2.32965, 1, 0, 0, 1, 1,
-0.7822956, 1.078192, -0.4848105, 1, 0, 0, 1, 1,
-0.7774265, 0.7866587, -0.9667195, 0, 0, 0, 1, 1,
-0.7734991, -0.7409765, -1.94461, 0, 0, 0, 1, 1,
-0.772388, 0.7392628, -1.015021, 0, 0, 0, 1, 1,
-0.7721554, -0.5724218, -2.207286, 0, 0, 0, 1, 1,
-0.7554228, -1.872691, -2.027503, 0, 0, 0, 1, 1,
-0.7535327, -0.3310253, -2.322828, 0, 0, 0, 1, 1,
-0.753294, -1.086265, -3.291912, 0, 0, 0, 1, 1,
-0.7531171, 1.149809, -1.026832, 1, 1, 1, 1, 1,
-0.7526266, 0.5811552, -1.24046, 1, 1, 1, 1, 1,
-0.7473532, 1.789973, -0.0315046, 1, 1, 1, 1, 1,
-0.7348427, 1.582056, -1.732263, 1, 1, 1, 1, 1,
-0.7331097, 0.423383, -0.226905, 1, 1, 1, 1, 1,
-0.7306741, 1.476045, -0.16474, 1, 1, 1, 1, 1,
-0.7300895, 0.9823939, -1.542133, 1, 1, 1, 1, 1,
-0.7249498, 0.4459942, -1.906277, 1, 1, 1, 1, 1,
-0.7193737, -0.1219698, -1.291543, 1, 1, 1, 1, 1,
-0.7102922, -0.4709307, -1.021959, 1, 1, 1, 1, 1,
-0.7085131, 1.283549, -1.060227, 1, 1, 1, 1, 1,
-0.7069011, 0.1919521, 0.484416, 1, 1, 1, 1, 1,
-0.6978195, 1.198451, -1.728397, 1, 1, 1, 1, 1,
-0.6961612, 0.6172826, -0.5921444, 1, 1, 1, 1, 1,
-0.6922255, 1.736775, 0.9888256, 1, 1, 1, 1, 1,
-0.6862667, 0.3904364, 0.4391972, 0, 0, 1, 1, 1,
-0.685051, -0.4590909, -1.531481, 1, 0, 0, 1, 1,
-0.6820694, -0.09638104, -1.175476, 1, 0, 0, 1, 1,
-0.6791741, -2.241498, 0.1066878, 1, 0, 0, 1, 1,
-0.6783377, -1.231481, -3.649387, 1, 0, 0, 1, 1,
-0.6761799, 1.091524, 0.1394549, 1, 0, 0, 1, 1,
-0.6747437, 0.8414199, -0.6004334, 0, 0, 0, 1, 1,
-0.6711916, -0.004243894, -2.683674, 0, 0, 0, 1, 1,
-0.6668157, 1.092784, -0.2095616, 0, 0, 0, 1, 1,
-0.6618547, 0.128792, -1.881608, 0, 0, 0, 1, 1,
-0.6607647, 0.1614553, -0.916441, 0, 0, 0, 1, 1,
-0.6599848, 0.6421211, -0.9996864, 0, 0, 0, 1, 1,
-0.654004, -0.1578282, -1.655998, 0, 0, 0, 1, 1,
-0.6532119, 0.6424984, -0.483741, 1, 1, 1, 1, 1,
-0.6500425, -0.5312495, -1.535435, 1, 1, 1, 1, 1,
-0.6497081, -0.2428056, -1.714141, 1, 1, 1, 1, 1,
-0.6496862, 0.09562027, -2.404065, 1, 1, 1, 1, 1,
-0.6488313, -0.8118628, -2.007371, 1, 1, 1, 1, 1,
-0.6477958, -0.8999727, -2.62676, 1, 1, 1, 1, 1,
-0.6449954, 0.4405347, -0.9278433, 1, 1, 1, 1, 1,
-0.6443489, 0.08653228, -2.529898, 1, 1, 1, 1, 1,
-0.6437297, 1.207127, -1.92987, 1, 1, 1, 1, 1,
-0.6424696, -0.0706735, -1.511474, 1, 1, 1, 1, 1,
-0.6333497, 1.134855, -1.409744, 1, 1, 1, 1, 1,
-0.6284911, 1.763673, 0.2649147, 1, 1, 1, 1, 1,
-0.6244777, 0.4181821, -3.4408, 1, 1, 1, 1, 1,
-0.620444, 0.2530755, -2.238523, 1, 1, 1, 1, 1,
-0.6148428, -0.6059591, -3.128994, 1, 1, 1, 1, 1,
-0.6146715, 0.2348731, -0.1683511, 0, 0, 1, 1, 1,
-0.6123512, -1.01716, -0.9396257, 1, 0, 0, 1, 1,
-0.6089491, -0.7587422, -3.431403, 1, 0, 0, 1, 1,
-0.6081386, 2.390375, -0.2914668, 1, 0, 0, 1, 1,
-0.6060408, 1.034063, -1.073026, 1, 0, 0, 1, 1,
-0.6001772, -0.004513548, -2.631855, 1, 0, 0, 1, 1,
-0.5935329, -0.1512978, -1.089028, 0, 0, 0, 1, 1,
-0.5932388, -0.227284, -1.00597, 0, 0, 0, 1, 1,
-0.5929043, -0.8532601, -2.250726, 0, 0, 0, 1, 1,
-0.5928916, 0.3586141, 0.7881857, 0, 0, 0, 1, 1,
-0.5861467, -0.524352, -1.356276, 0, 0, 0, 1, 1,
-0.5834105, -0.1082943, -2.331448, 0, 0, 0, 1, 1,
-0.5824701, 2.432873, 0.2975993, 0, 0, 0, 1, 1,
-0.5789692, 1.593046, -0.7314061, 1, 1, 1, 1, 1,
-0.576719, -1.586328, -4.687797, 1, 1, 1, 1, 1,
-0.576618, -0.5124499, -4.131292, 1, 1, 1, 1, 1,
-0.564677, -0.3455016, -3.291101, 1, 1, 1, 1, 1,
-0.5641047, -1.489536, -2.890026, 1, 1, 1, 1, 1,
-0.563068, 1.243688, -0.5499326, 1, 1, 1, 1, 1,
-0.5623842, -0.5719484, -2.113889, 1, 1, 1, 1, 1,
-0.5591129, 0.8044196, 0.8081765, 1, 1, 1, 1, 1,
-0.5568548, -1.240258, -1.707666, 1, 1, 1, 1, 1,
-0.5525885, -0.01589372, -0.662004, 1, 1, 1, 1, 1,
-0.5488471, -0.05510871, -1.888253, 1, 1, 1, 1, 1,
-0.5483257, -1.211892, -1.971802, 1, 1, 1, 1, 1,
-0.5465418, 0.3866967, -0.7931945, 1, 1, 1, 1, 1,
-0.5451549, -0.4181625, -1.983285, 1, 1, 1, 1, 1,
-0.5433986, 0.8289673, -0.3845612, 1, 1, 1, 1, 1,
-0.5413423, -1.165727, -0.8590379, 0, 0, 1, 1, 1,
-0.540842, -0.418913, -1.589063, 1, 0, 0, 1, 1,
-0.5404677, -0.7675987, -0.8453662, 1, 0, 0, 1, 1,
-0.5381858, 2.679639, 1.023126, 1, 0, 0, 1, 1,
-0.5362032, -0.9300127, -2.560323, 1, 0, 0, 1, 1,
-0.5333605, 0.3118064, -1.779863, 1, 0, 0, 1, 1,
-0.5319803, -0.8902735, -2.449421, 0, 0, 0, 1, 1,
-0.5294197, -0.693587, -2.837728, 0, 0, 0, 1, 1,
-0.527676, -2.50499, -3.721552, 0, 0, 0, 1, 1,
-0.5268585, 0.2244268, 1.051332, 0, 0, 0, 1, 1,
-0.5264841, -1.477084, -2.557111, 0, 0, 0, 1, 1,
-0.5036382, 0.2255019, -1.552261, 0, 0, 0, 1, 1,
-0.499048, 0.09848487, -1.267437, 0, 0, 0, 1, 1,
-0.4979724, 0.07235524, -0.8468116, 1, 1, 1, 1, 1,
-0.4960962, -0.043058, -0.9841895, 1, 1, 1, 1, 1,
-0.4891809, 1.220141, -0.4640962, 1, 1, 1, 1, 1,
-0.483885, -0.2151228, -1.98116, 1, 1, 1, 1, 1,
-0.4799894, 0.1671823, -0.7179075, 1, 1, 1, 1, 1,
-0.4789833, 0.9753262, -0.1590419, 1, 1, 1, 1, 1,
-0.4763362, 0.9154308, -0.9418406, 1, 1, 1, 1, 1,
-0.4753555, -1.377754, -3.838273, 1, 1, 1, 1, 1,
-0.4748978, -1.72642, -2.26396, 1, 1, 1, 1, 1,
-0.4727772, -0.4361228, -3.36412, 1, 1, 1, 1, 1,
-0.4686314, 2.709339, -0.6285911, 1, 1, 1, 1, 1,
-0.4675825, -0.6826015, -2.021644, 1, 1, 1, 1, 1,
-0.4670263, -0.1398743, -1.716672, 1, 1, 1, 1, 1,
-0.462331, 0.0288968, -0.9680526, 1, 1, 1, 1, 1,
-0.45703, 0.5406055, -1.040635, 1, 1, 1, 1, 1,
-0.4543575, 0.4137373, -0.2984731, 0, 0, 1, 1, 1,
-0.4536375, 0.3948638, 0.01128884, 1, 0, 0, 1, 1,
-0.4521088, 0.1789934, -0.4195578, 1, 0, 0, 1, 1,
-0.4519287, -0.9905915, -4.059731, 1, 0, 0, 1, 1,
-0.4512588, 1.902371, -0.5641199, 1, 0, 0, 1, 1,
-0.4488784, -0.0107016, -1.608243, 1, 0, 0, 1, 1,
-0.4450727, -0.9997398, -2.472374, 0, 0, 0, 1, 1,
-0.4437078, -0.4501318, -1.851495, 0, 0, 0, 1, 1,
-0.4343993, 0.06422219, -1.517834, 0, 0, 0, 1, 1,
-0.4326108, -1.192261, -2.278589, 0, 0, 0, 1, 1,
-0.4304929, -0.3424833, -2.330034, 0, 0, 0, 1, 1,
-0.4264438, -0.9125439, -4.138519, 0, 0, 0, 1, 1,
-0.4255316, -0.1853537, -3.49989, 0, 0, 0, 1, 1,
-0.423346, -0.3793499, -2.243168, 1, 1, 1, 1, 1,
-0.4228533, 0.06658923, -1.335236, 1, 1, 1, 1, 1,
-0.4183401, -0.3597413, -0.4924257, 1, 1, 1, 1, 1,
-0.4161811, -0.1597805, -3.165438, 1, 1, 1, 1, 1,
-0.4150628, -0.6954335, -3.608103, 1, 1, 1, 1, 1,
-0.4146994, 0.1351506, -0.4946206, 1, 1, 1, 1, 1,
-0.4124869, -0.00184357, -1.344444, 1, 1, 1, 1, 1,
-0.4111868, -0.8602565, -3.291235, 1, 1, 1, 1, 1,
-0.405456, 1.569306, -1.13325, 1, 1, 1, 1, 1,
-0.4049542, 1.093886, -1.447969, 1, 1, 1, 1, 1,
-0.403764, -0.2119958, -1.627136, 1, 1, 1, 1, 1,
-0.3967453, 0.7369845, -2.483184, 1, 1, 1, 1, 1,
-0.3945745, -0.2142326, -1.01308, 1, 1, 1, 1, 1,
-0.3909574, 1.226817, 0.7532953, 1, 1, 1, 1, 1,
-0.3903657, 1.034251, -0.6074077, 1, 1, 1, 1, 1,
-0.3821411, -0.30455, -2.497326, 0, 0, 1, 1, 1,
-0.3769104, -0.2457269, -1.205479, 1, 0, 0, 1, 1,
-0.3763462, 1.584638, 0.7455348, 1, 0, 0, 1, 1,
-0.3740677, -0.05432628, -2.019419, 1, 0, 0, 1, 1,
-0.3730967, -0.0443362, -1.547967, 1, 0, 0, 1, 1,
-0.3703187, 1.110226, -0.1620079, 1, 0, 0, 1, 1,
-0.3694256, 1.190949, -0.5123388, 0, 0, 0, 1, 1,
-0.3532613, 0.3037796, -0.1325653, 0, 0, 0, 1, 1,
-0.3490045, -1.735285, -2.466874, 0, 0, 0, 1, 1,
-0.3478063, -1.262102, -2.827287, 0, 0, 0, 1, 1,
-0.3415035, 0.06536925, -2.020396, 0, 0, 0, 1, 1,
-0.332305, 0.5735987, -1.159886, 0, 0, 0, 1, 1,
-0.3317098, 0.08901965, -0.5703708, 0, 0, 0, 1, 1,
-0.3230243, 1.012955, 1.266317, 1, 1, 1, 1, 1,
-0.3211779, 1.787938, 0.859001, 1, 1, 1, 1, 1,
-0.3164937, -0.349032, -2.095627, 1, 1, 1, 1, 1,
-0.3131766, -0.9542304, -2.546845, 1, 1, 1, 1, 1,
-0.3125495, 0.8306469, -2.44216, 1, 1, 1, 1, 1,
-0.3114426, 0.4059272, -2.492782, 1, 1, 1, 1, 1,
-0.3101082, 0.7905833, 0.08696721, 1, 1, 1, 1, 1,
-0.3094359, -0.1024877, -2.354461, 1, 1, 1, 1, 1,
-0.3081159, 2.425189, 0.1613464, 1, 1, 1, 1, 1,
-0.307828, -0.5488838, -2.359986, 1, 1, 1, 1, 1,
-0.3036129, 1.296228, 0.7624493, 1, 1, 1, 1, 1,
-0.3023179, 0.4207116, -0.6835207, 1, 1, 1, 1, 1,
-0.2986903, -1.310292, -1.756063, 1, 1, 1, 1, 1,
-0.2972665, -0.02611037, -2.001849, 1, 1, 1, 1, 1,
-0.2971116, 1.537018, -0.5769886, 1, 1, 1, 1, 1,
-0.2909625, 1.090426, -0.6256974, 0, 0, 1, 1, 1,
-0.2849396, 0.8357258, -0.9809054, 1, 0, 0, 1, 1,
-0.2843279, -0.6914697, -4.134982, 1, 0, 0, 1, 1,
-0.282717, -0.5875086, -2.129783, 1, 0, 0, 1, 1,
-0.2820601, -0.08675826, -4.96334, 1, 0, 0, 1, 1,
-0.2820254, -1.020637, -3.642396, 1, 0, 0, 1, 1,
-0.2760029, 0.05217659, -0.1357719, 0, 0, 0, 1, 1,
-0.2756199, 1.088912, -0.5025168, 0, 0, 0, 1, 1,
-0.2755914, 0.1385801, 0.2422316, 0, 0, 0, 1, 1,
-0.26884, -0.7566896, -2.326928, 0, 0, 0, 1, 1,
-0.2683198, -0.3466203, -3.282081, 0, 0, 0, 1, 1,
-0.2678915, -1.050807, -1.59314, 0, 0, 0, 1, 1,
-0.2673025, 0.5304989, 0.1384051, 0, 0, 0, 1, 1,
-0.2629417, 1.37233, -0.4380151, 1, 1, 1, 1, 1,
-0.2573736, -1.930684, -1.826463, 1, 1, 1, 1, 1,
-0.2573061, 1.598805, 0.7653112, 1, 1, 1, 1, 1,
-0.2564293, 0.427458, -1.565954, 1, 1, 1, 1, 1,
-0.2524395, -0.3558561, -1.210074, 1, 1, 1, 1, 1,
-0.2498979, -0.679954, -1.792721, 1, 1, 1, 1, 1,
-0.2485645, -1.16189, -1.169173, 1, 1, 1, 1, 1,
-0.2441824, -0.1943737, -3.045047, 1, 1, 1, 1, 1,
-0.2413944, -0.2128442, -3.625658, 1, 1, 1, 1, 1,
-0.2388445, -1.785973, -3.346038, 1, 1, 1, 1, 1,
-0.232608, 1.241471, -0.6493922, 1, 1, 1, 1, 1,
-0.2316471, -1.899701, -4.285908, 1, 1, 1, 1, 1,
-0.2302962, -0.04615989, -0.2971365, 1, 1, 1, 1, 1,
-0.228989, -1.572794, -2.462063, 1, 1, 1, 1, 1,
-0.2151524, 1.716607, -0.01169157, 1, 1, 1, 1, 1,
-0.2142482, -1.107213, -2.995428, 0, 0, 1, 1, 1,
-0.2142013, 0.737244, -0.2566316, 1, 0, 0, 1, 1,
-0.2129283, -1.865782, -4.407444, 1, 0, 0, 1, 1,
-0.2111558, -1.077219, -1.500052, 1, 0, 0, 1, 1,
-0.2096214, -0.06558172, -2.355906, 1, 0, 0, 1, 1,
-0.2088047, 0.684333, -0.1283964, 1, 0, 0, 1, 1,
-0.2075718, -0.6053928, -2.988976, 0, 0, 0, 1, 1,
-0.2064268, 0.5366403, 0.9170135, 0, 0, 0, 1, 1,
-0.2038687, -0.1082725, -0.2916577, 0, 0, 0, 1, 1,
-0.2038492, 0.2695909, -0.5168889, 0, 0, 0, 1, 1,
-0.2034273, -1.666496, -2.726083, 0, 0, 0, 1, 1,
-0.2021524, 0.1868652, -2.134987, 0, 0, 0, 1, 1,
-0.1984925, -0.3266983, -1.966291, 0, 0, 0, 1, 1,
-0.1962483, -1.237252, -3.202841, 1, 1, 1, 1, 1,
-0.1864723, 2.101292, -1.4077, 1, 1, 1, 1, 1,
-0.1845151, 0.6530315, -2.247688, 1, 1, 1, 1, 1,
-0.1824349, 0.6046429, 0.3057087, 1, 1, 1, 1, 1,
-0.176887, 0.2030827, -0.5040316, 1, 1, 1, 1, 1,
-0.1766162, -0.4593286, -2.927052, 1, 1, 1, 1, 1,
-0.1710745, -1.064426, -2.730853, 1, 1, 1, 1, 1,
-0.1680286, -0.7005697, -1.716613, 1, 1, 1, 1, 1,
-0.164538, 0.4101878, -0.7671953, 1, 1, 1, 1, 1,
-0.1641488, -0.5823539, -4.519701, 1, 1, 1, 1, 1,
-0.1603555, 1.761325, -1.517862, 1, 1, 1, 1, 1,
-0.1579679, -0.694228, -1.490019, 1, 1, 1, 1, 1,
-0.154862, 0.5854152, 0.004978565, 1, 1, 1, 1, 1,
-0.1539544, -0.2634832, -3.312557, 1, 1, 1, 1, 1,
-0.1531083, 3.16767, 0.5808461, 1, 1, 1, 1, 1,
-0.1522331, -0.07466315, -1.063065, 0, 0, 1, 1, 1,
-0.1510019, 1.745666, -0.2308701, 1, 0, 0, 1, 1,
-0.1439993, -0.2362928, -3.499941, 1, 0, 0, 1, 1,
-0.1428355, 0.1570822, -1.495539, 1, 0, 0, 1, 1,
-0.1426087, -0.5255017, -0.8787674, 1, 0, 0, 1, 1,
-0.1385411, 0.4554451, 1.052166, 1, 0, 0, 1, 1,
-0.1372526, 0.7859208, 0.03075666, 0, 0, 0, 1, 1,
-0.1337408, 0.1126817, -0.533098, 0, 0, 0, 1, 1,
-0.1296983, -0.6594155, -2.917372, 0, 0, 0, 1, 1,
-0.129188, -1.716404, -1.944835, 0, 0, 0, 1, 1,
-0.1273851, 0.4012659, -0.6425955, 0, 0, 0, 1, 1,
-0.127119, 1.312085, 0.4811316, 0, 0, 0, 1, 1,
-0.1256696, 0.2551641, -0.4834008, 0, 0, 0, 1, 1,
-0.1233047, -0.5460814, -2.912847, 1, 1, 1, 1, 1,
-0.1210346, 0.5799726, -0.05676174, 1, 1, 1, 1, 1,
-0.120784, 0.008693405, -1.257874, 1, 1, 1, 1, 1,
-0.1194557, -1.070054, -2.46793, 1, 1, 1, 1, 1,
-0.1174644, 0.6591816, 0.07940771, 1, 1, 1, 1, 1,
-0.114722, 0.1543744, -0.3156569, 1, 1, 1, 1, 1,
-0.1145597, -0.4766311, -2.096953, 1, 1, 1, 1, 1,
-0.114507, -0.8863583, -4.0609, 1, 1, 1, 1, 1,
-0.1102591, 0.4361054, 1.484392, 1, 1, 1, 1, 1,
-0.1079901, 0.3998385, 0.9003518, 1, 1, 1, 1, 1,
-0.1065602, -2.80373, -6.069437, 1, 1, 1, 1, 1,
-0.1029685, 0.8737931, -0.006786184, 1, 1, 1, 1, 1,
-0.102588, -0.2701502, -3.249523, 1, 1, 1, 1, 1,
-0.1002057, 0.2074434, -0.8822038, 1, 1, 1, 1, 1,
-0.09491739, -1.049296, -3.169138, 1, 1, 1, 1, 1,
-0.09412641, 1.088158, -1.618251, 0, 0, 1, 1, 1,
-0.09404309, -0.5785033, -2.755469, 1, 0, 0, 1, 1,
-0.09301034, 0.1287584, -0.9912096, 1, 0, 0, 1, 1,
-0.09184168, 0.8512574, 3.642132, 1, 0, 0, 1, 1,
-0.08787905, -1.984846, -2.22659, 1, 0, 0, 1, 1,
-0.08464292, -0.6624542, -3.366704, 1, 0, 0, 1, 1,
-0.08171873, 0.5702723, -0.7664942, 0, 0, 0, 1, 1,
-0.07901849, 0.01231119, -1.561268, 0, 0, 0, 1, 1,
-0.07561717, -0.4263704, -2.896778, 0, 0, 0, 1, 1,
-0.07554084, -0.4452933, -2.421255, 0, 0, 0, 1, 1,
-0.07373881, -1.612063, -1.881498, 0, 0, 0, 1, 1,
-0.07259605, -0.9942535, -2.303982, 0, 0, 0, 1, 1,
-0.07250915, -1.083789, -3.874321, 0, 0, 0, 1, 1,
-0.06810538, -0.1608385, -2.404706, 1, 1, 1, 1, 1,
-0.06661069, 1.769001, 0.4513636, 1, 1, 1, 1, 1,
-0.06541223, 2.19474, -0.4442472, 1, 1, 1, 1, 1,
-0.06523672, 0.2933657, -1.780843, 1, 1, 1, 1, 1,
-0.06395835, -0.5385998, -1.804049, 1, 1, 1, 1, 1,
-0.06270359, 1.202794, -1.7499, 1, 1, 1, 1, 1,
-0.06128023, -0.01877676, -0.6621609, 1, 1, 1, 1, 1,
-0.05553012, -0.9349766, -2.0837, 1, 1, 1, 1, 1,
-0.05028243, 0.587451, -1.685348, 1, 1, 1, 1, 1,
-0.04913625, -1.574282, -2.152528, 1, 1, 1, 1, 1,
-0.0475449, 1.955335, 0.4084259, 1, 1, 1, 1, 1,
-0.0470586, 0.4334877, 0.5613407, 1, 1, 1, 1, 1,
-0.04682632, -0.6912707, -3.497711, 1, 1, 1, 1, 1,
-0.04444173, -0.61164, -3.082204, 1, 1, 1, 1, 1,
-0.03996611, -0.9723918, -4.204679, 1, 1, 1, 1, 1,
-0.03966616, 0.6567186, 0.4687615, 0, 0, 1, 1, 1,
-0.03809801, 0.8257208, -0.4535789, 1, 0, 0, 1, 1,
-0.03244977, 0.82294, -0.5439476, 1, 0, 0, 1, 1,
-0.03146632, 0.8243626, -0.05276085, 1, 0, 0, 1, 1,
-0.02823221, 1.334978, 0.9784392, 1, 0, 0, 1, 1,
-0.02781886, -0.1942542, -2.979435, 1, 0, 0, 1, 1,
-0.01243816, -1.084664, -4.291248, 0, 0, 0, 1, 1,
-0.006138646, -1.123699, -2.511124, 0, 0, 0, 1, 1,
0.002923233, -0.2150865, 2.678522, 0, 0, 0, 1, 1,
0.005778712, 0.5704295, -0.4479287, 0, 0, 0, 1, 1,
0.009286036, 0.3316247, -2.732009, 0, 0, 0, 1, 1,
0.009491023, -0.07758962, 3.8617, 0, 0, 0, 1, 1,
0.01083911, -2.303931, 3.149457, 0, 0, 0, 1, 1,
0.01538653, -0.5755959, 4.064023, 1, 1, 1, 1, 1,
0.02140449, -0.0872321, 3.545106, 1, 1, 1, 1, 1,
0.02175496, 1.865565, -0.08709992, 1, 1, 1, 1, 1,
0.02360476, -1.603646, 3.37542, 1, 1, 1, 1, 1,
0.02444887, -1.327783, 3.029857, 1, 1, 1, 1, 1,
0.02575299, 0.3291378, -1.161808, 1, 1, 1, 1, 1,
0.03144574, 1.445524, 1.143397, 1, 1, 1, 1, 1,
0.03180262, 1.142816, -0.05747728, 1, 1, 1, 1, 1,
0.03239914, -0.6268967, 2.424919, 1, 1, 1, 1, 1,
0.03246275, 0.6503549, -1.903929, 1, 1, 1, 1, 1,
0.03362482, 0.2454347, -0.7535174, 1, 1, 1, 1, 1,
0.03588961, -0.658182, 4.346743, 1, 1, 1, 1, 1,
0.03613157, -0.9971351, 1.397275, 1, 1, 1, 1, 1,
0.03970863, -0.7426628, 2.660766, 1, 1, 1, 1, 1,
0.04113716, -1.205597, 3.911423, 1, 1, 1, 1, 1,
0.04512314, -1.20149, 2.971494, 0, 0, 1, 1, 1,
0.05545665, 0.2599339, 2.009858, 1, 0, 0, 1, 1,
0.05827773, 0.3773573, 1.398088, 1, 0, 0, 1, 1,
0.06080336, -0.9922196, 4.154249, 1, 0, 0, 1, 1,
0.06195191, 0.05140245, 1.332638, 1, 0, 0, 1, 1,
0.06652846, 0.6662655, -0.8787861, 1, 0, 0, 1, 1,
0.06864081, 1.235283, 1.13292, 0, 0, 0, 1, 1,
0.07138652, 0.1960638, 0.9575228, 0, 0, 0, 1, 1,
0.0732674, -0.9443597, 2.828638, 0, 0, 0, 1, 1,
0.07541586, 0.05732976, 0.681444, 0, 0, 0, 1, 1,
0.08054513, -0.739208, 4.259399, 0, 0, 0, 1, 1,
0.08098041, 0.8145056, -1.771984, 0, 0, 0, 1, 1,
0.08346508, 0.2332132, 0.4686846, 0, 0, 0, 1, 1,
0.0903853, 0.848194, -1.481013, 1, 1, 1, 1, 1,
0.09162368, -0.3163394, 2.309836, 1, 1, 1, 1, 1,
0.09202673, -0.3860394, 3.695779, 1, 1, 1, 1, 1,
0.0967005, -0.8394765, 2.244506, 1, 1, 1, 1, 1,
0.1009971, 0.8315477, 0.1730375, 1, 1, 1, 1, 1,
0.1027462, -0.7934695, 2.030816, 1, 1, 1, 1, 1,
0.1081069, 0.5499572, -0.07769941, 1, 1, 1, 1, 1,
0.1116735, 0.6540899, 2.259473, 1, 1, 1, 1, 1,
0.1158214, -0.7016571, -0.1376025, 1, 1, 1, 1, 1,
0.1177327, -0.9122165, 3.260344, 1, 1, 1, 1, 1,
0.1193292, -1.849464, 3.030463, 1, 1, 1, 1, 1,
0.1215134, -1.982335, 4.468907, 1, 1, 1, 1, 1,
0.1229954, 0.8718835, 1.533775, 1, 1, 1, 1, 1,
0.1263066, -0.7014325, 1.559986, 1, 1, 1, 1, 1,
0.129652, 0.6779413, 0.8129206, 1, 1, 1, 1, 1,
0.1297728, -0.3952527, 3.422979, 0, 0, 1, 1, 1,
0.1321628, -0.7405742, 3.028463, 1, 0, 0, 1, 1,
0.1329434, 1.17532, 1.716863, 1, 0, 0, 1, 1,
0.1346311, 0.4587757, -1.48551, 1, 0, 0, 1, 1,
0.1375139, -1.113186, 3.600358, 1, 0, 0, 1, 1,
0.1413627, 0.7502105, -1.040148, 1, 0, 0, 1, 1,
0.1445125, 0.7888484, 1.320918, 0, 0, 0, 1, 1,
0.1465435, 0.689518, 0.1690941, 0, 0, 0, 1, 1,
0.1476478, 1.964473, 0.7049595, 0, 0, 0, 1, 1,
0.1485456, 1.141051, -0.0892, 0, 0, 0, 1, 1,
0.149087, 1.85094, -0.7202592, 0, 0, 0, 1, 1,
0.1518756, 0.3263193, 0.6880975, 0, 0, 0, 1, 1,
0.1539676, 0.2311386, 0.1320739, 0, 0, 0, 1, 1,
0.1582706, 0.5183263, 1.739717, 1, 1, 1, 1, 1,
0.1586979, -2.324104, 2.472877, 1, 1, 1, 1, 1,
0.1611033, 1.034028, -1.236083, 1, 1, 1, 1, 1,
0.1619485, -0.008037826, 1.469468, 1, 1, 1, 1, 1,
0.1630087, 2.018641, -0.8517822, 1, 1, 1, 1, 1,
0.164122, -0.08331349, 2.03766, 1, 1, 1, 1, 1,
0.1659252, -0.4349692, 2.732632, 1, 1, 1, 1, 1,
0.1674025, 0.4228211, 0.8157939, 1, 1, 1, 1, 1,
0.1685219, 0.5528036, -1.317051, 1, 1, 1, 1, 1,
0.1701146, -0.7510709, 2.872061, 1, 1, 1, 1, 1,
0.1703026, -0.06044905, 1.157702, 1, 1, 1, 1, 1,
0.1829301, -1.02937, 5.120265, 1, 1, 1, 1, 1,
0.1842078, 0.4681534, 0.06815177, 1, 1, 1, 1, 1,
0.1870537, -1.077292, 2.485238, 1, 1, 1, 1, 1,
0.1960718, -0.4592848, 1.890134, 1, 1, 1, 1, 1,
0.1969179, 1.371438, 0.9709271, 0, 0, 1, 1, 1,
0.19795, 0.8281736, -0.2608788, 1, 0, 0, 1, 1,
0.1991302, -0.2545903, 2.499318, 1, 0, 0, 1, 1,
0.2019767, 0.337054, 1.264317, 1, 0, 0, 1, 1,
0.2020725, -0.3214397, 0.1453936, 1, 0, 0, 1, 1,
0.2056127, -1.854905, 2.585936, 1, 0, 0, 1, 1,
0.2060227, 0.3108418, 1.77665, 0, 0, 0, 1, 1,
0.2066035, 0.3879452, 0.7007942, 0, 0, 0, 1, 1,
0.2081025, 0.1604719, 0.4885228, 0, 0, 0, 1, 1,
0.2120053, 1.594447, 0.5135852, 0, 0, 0, 1, 1,
0.2134924, 0.6356636, -0.3804142, 0, 0, 0, 1, 1,
0.2168429, -1.011032, 1.295854, 0, 0, 0, 1, 1,
0.2225523, -0.5549822, 2.976351, 0, 0, 0, 1, 1,
0.2240861, 0.4528277, 0.4358997, 1, 1, 1, 1, 1,
0.2246731, 0.679149, -0.2153077, 1, 1, 1, 1, 1,
0.2278574, -0.371113, 4.268169, 1, 1, 1, 1, 1,
0.2282763, -1.021047, 2.973715, 1, 1, 1, 1, 1,
0.2301185, 0.0250247, 0.03876812, 1, 1, 1, 1, 1,
0.2314868, 0.8190156, 1.477058, 1, 1, 1, 1, 1,
0.232224, 0.4329029, 0.670327, 1, 1, 1, 1, 1,
0.2323141, 1.640619, -0.2553563, 1, 1, 1, 1, 1,
0.2333834, 0.5797181, 2.966804, 1, 1, 1, 1, 1,
0.2397824, -0.2500759, 3.356402, 1, 1, 1, 1, 1,
0.2400424, -2.098132, 0.198574, 1, 1, 1, 1, 1,
0.2409335, -1.579971, 1.123389, 1, 1, 1, 1, 1,
0.2409526, -1.033243, 3.695512, 1, 1, 1, 1, 1,
0.2451081, 0.1059255, 2.91577, 1, 1, 1, 1, 1,
0.2452984, 1.340188, 1.384367, 1, 1, 1, 1, 1,
0.2484872, -1.161819, 3.237522, 0, 0, 1, 1, 1,
0.2495064, 1.263557, 0.4092088, 1, 0, 0, 1, 1,
0.2576861, 0.3734421, 1.116816, 1, 0, 0, 1, 1,
0.2591677, -2.603785, 2.509837, 1, 0, 0, 1, 1,
0.2591946, 1.970163, -0.4730697, 1, 0, 0, 1, 1,
0.2611986, -0.7310678, 2.85816, 1, 0, 0, 1, 1,
0.2640217, -0.8072238, 3.113072, 0, 0, 0, 1, 1,
0.2683527, 0.4641292, 1.562433, 0, 0, 0, 1, 1,
0.2701442, -0.1845103, 3.403548, 0, 0, 0, 1, 1,
0.2716548, -1.208909, 2.227018, 0, 0, 0, 1, 1,
0.2724218, -1.328203, 2.84927, 0, 0, 0, 1, 1,
0.2734931, 0.6579049, -0.270669, 0, 0, 0, 1, 1,
0.2759131, -0.01355381, 0.147267, 0, 0, 0, 1, 1,
0.2777601, 0.997646, 0.5348329, 1, 1, 1, 1, 1,
0.281946, -0.6492757, 4.798581, 1, 1, 1, 1, 1,
0.2835762, -0.1950825, 2.885182, 1, 1, 1, 1, 1,
0.284566, 1.14288, -2.537075, 1, 1, 1, 1, 1,
0.2852111, 1.080161, -0.5671285, 1, 1, 1, 1, 1,
0.2880485, -0.656445, 2.036653, 1, 1, 1, 1, 1,
0.2946003, 0.1224465, 3.150336, 1, 1, 1, 1, 1,
0.2958333, -1.30883, 2.178962, 1, 1, 1, 1, 1,
0.2992282, 0.3505666, -0.5465888, 1, 1, 1, 1, 1,
0.3014407, 1.240981, 1.570887, 1, 1, 1, 1, 1,
0.3017879, -0.766943, 2.281553, 1, 1, 1, 1, 1,
0.3031635, -2.493158, 3.344977, 1, 1, 1, 1, 1,
0.3038924, 0.9875441, -0.7940812, 1, 1, 1, 1, 1,
0.3049338, 0.175565, 0.3680156, 1, 1, 1, 1, 1,
0.3068663, 0.696337, 2.346362, 1, 1, 1, 1, 1,
0.3068976, 0.2385717, 1.999223, 0, 0, 1, 1, 1,
0.3087819, -0.4881992, 3.692801, 1, 0, 0, 1, 1,
0.3097599, 0.8313152, 0.4000377, 1, 0, 0, 1, 1,
0.3099992, -0.1167799, 1.134209, 1, 0, 0, 1, 1,
0.3166886, -0.6673285, 1.772678, 1, 0, 0, 1, 1,
0.3204868, -2.227225, 4.055588, 1, 0, 0, 1, 1,
0.323302, 0.890077, 1.256259, 0, 0, 0, 1, 1,
0.3253812, -0.34343, 2.531236, 0, 0, 0, 1, 1,
0.3324516, -0.3356825, 1.400101, 0, 0, 0, 1, 1,
0.3374193, -0.8273919, 3.877551, 0, 0, 0, 1, 1,
0.3387686, 0.6927008, 1.305688, 0, 0, 0, 1, 1,
0.3394675, -0.6770414, 2.460383, 0, 0, 0, 1, 1,
0.3404696, 0.2279161, 1.301822, 0, 0, 0, 1, 1,
0.3412808, -1.941944, 1.756648, 1, 1, 1, 1, 1,
0.3424275, 0.2595411, 1.326172, 1, 1, 1, 1, 1,
0.3493976, -1.384501, 2.338792, 1, 1, 1, 1, 1,
0.3529982, 0.8186174, 0.3609307, 1, 1, 1, 1, 1,
0.3543019, 0.8665121, 1.101021, 1, 1, 1, 1, 1,
0.3543714, 0.4600121, 0.3297782, 1, 1, 1, 1, 1,
0.3611478, 2.659183, -1.016315, 1, 1, 1, 1, 1,
0.3629584, -0.8254317, 3.311515, 1, 1, 1, 1, 1,
0.3684635, 0.8545761, 0.7077277, 1, 1, 1, 1, 1,
0.3727534, -0.2340602, 2.093824, 1, 1, 1, 1, 1,
0.3760475, 0.5460767, 1.716943, 1, 1, 1, 1, 1,
0.3787294, -0.8683146, 1.655386, 1, 1, 1, 1, 1,
0.381552, 0.4914922, 0.8999704, 1, 1, 1, 1, 1,
0.3817563, 1.548639, 2.480805, 1, 1, 1, 1, 1,
0.3826056, 1.119513, 1.030956, 1, 1, 1, 1, 1,
0.3832243, 0.7362785, -0.1974402, 0, 0, 1, 1, 1,
0.3851106, -0.5724497, 2.128423, 1, 0, 0, 1, 1,
0.3864518, -1.006463, 2.793826, 1, 0, 0, 1, 1,
0.3905503, -0.3565632, 3.625963, 1, 0, 0, 1, 1,
0.3988365, 0.2762649, 0.6322594, 1, 0, 0, 1, 1,
0.3989484, -2.748793, 0.2721231, 1, 0, 0, 1, 1,
0.4076546, 1.439713, -0.05717977, 0, 0, 0, 1, 1,
0.4089232, 1.437629, -1.062246, 0, 0, 0, 1, 1,
0.4098537, -1.212891, 2.784829, 0, 0, 0, 1, 1,
0.4101398, 1.863763, 1.086629, 0, 0, 0, 1, 1,
0.4120464, 0.1503588, 0.7015204, 0, 0, 0, 1, 1,
0.4137155, -0.2444885, 3.68161, 0, 0, 0, 1, 1,
0.4174275, -1.386357, 2.322842, 0, 0, 0, 1, 1,
0.4179262, 0.9695911, 2.344589, 1, 1, 1, 1, 1,
0.4232676, -1.123173, 1.855614, 1, 1, 1, 1, 1,
0.4247901, 1.248359, -0.9750552, 1, 1, 1, 1, 1,
0.4255498, 0.1734954, -0.7557659, 1, 1, 1, 1, 1,
0.4258451, -1.330307, 1.683615, 1, 1, 1, 1, 1,
0.4271279, 1.378862, 1.874334, 1, 1, 1, 1, 1,
0.43039, 0.8358975, -1.380677, 1, 1, 1, 1, 1,
0.4314237, 0.2344304, 1.641561, 1, 1, 1, 1, 1,
0.4316056, 1.229811, -0.3320902, 1, 1, 1, 1, 1,
0.4316814, 0.1543041, 0.016642, 1, 1, 1, 1, 1,
0.4323801, 0.404943, 1.923313, 1, 1, 1, 1, 1,
0.4341971, -0.2051798, 2.949153, 1, 1, 1, 1, 1,
0.4360426, -1.33811, 3.355438, 1, 1, 1, 1, 1,
0.445112, 1.941944, -0.7174097, 1, 1, 1, 1, 1,
0.4488011, 1.427532, 0.7549469, 1, 1, 1, 1, 1,
0.4532323, 0.2135641, -0.04865737, 0, 0, 1, 1, 1,
0.4564769, -1.289483, 4.350277, 1, 0, 0, 1, 1,
0.4604771, -0.05393012, 1.336522, 1, 0, 0, 1, 1,
0.4615624, -1.263966, 1.349016, 1, 0, 0, 1, 1,
0.4646115, -0.1736515, 0.6432737, 1, 0, 0, 1, 1,
0.4662439, 1.987838, -0.02148593, 1, 0, 0, 1, 1,
0.4709096, 0.1110627, 1.699588, 0, 0, 0, 1, 1,
0.47909, -1.48515, 1.77791, 0, 0, 0, 1, 1,
0.4884752, 1.498365, 1.012525, 0, 0, 0, 1, 1,
0.4926209, -0.8979845, 2.781052, 0, 0, 0, 1, 1,
0.4931069, 0.4827251, -1.963713, 0, 0, 0, 1, 1,
0.4937212, 0.8634744, -0.717783, 0, 0, 0, 1, 1,
0.4982958, -0.3516337, 0.8404062, 0, 0, 0, 1, 1,
0.5036452, 0.2015042, 1.653231, 1, 1, 1, 1, 1,
0.5043795, -0.765121, 1.252704, 1, 1, 1, 1, 1,
0.5064259, -0.6281608, 1.338507, 1, 1, 1, 1, 1,
0.5074822, -0.4139195, 1.407936, 1, 1, 1, 1, 1,
0.5075514, -0.8247226, 2.093111, 1, 1, 1, 1, 1,
0.5091084, 0.4841132, -0.8174657, 1, 1, 1, 1, 1,
0.5091251, 0.287303, 1.940615, 1, 1, 1, 1, 1,
0.5138412, 0.2188431, 2.256697, 1, 1, 1, 1, 1,
0.5150409, -1.398407, 1.768517, 1, 1, 1, 1, 1,
0.5182539, -0.7214426, 2.023695, 1, 1, 1, 1, 1,
0.5182836, -1.087445, 3.807444, 1, 1, 1, 1, 1,
0.5264848, -0.2683551, 1.559168, 1, 1, 1, 1, 1,
0.5318766, -0.6322886, 3.000024, 1, 1, 1, 1, 1,
0.5327041, -1.729405, 3.955628, 1, 1, 1, 1, 1,
0.534347, -0.2542123, 1.934003, 1, 1, 1, 1, 1,
0.5353041, 0.1338993, 2.285907, 0, 0, 1, 1, 1,
0.5354712, -2.63173, 3.279217, 1, 0, 0, 1, 1,
0.5374295, -1.80938, 2.75082, 1, 0, 0, 1, 1,
0.5386971, 0.4578176, 2.711378, 1, 0, 0, 1, 1,
0.5440528, -0.9431169, 2.481401, 1, 0, 0, 1, 1,
0.550563, 1.850456, 2.805442, 1, 0, 0, 1, 1,
0.5533623, 0.4474863, 0.6516328, 0, 0, 0, 1, 1,
0.553734, -0.07799902, 1.236106, 0, 0, 0, 1, 1,
0.5543599, -1.134175, 2.329937, 0, 0, 0, 1, 1,
0.5548288, 1.682711, -0.3245772, 0, 0, 0, 1, 1,
0.5548847, -0.2853505, -0.1515938, 0, 0, 0, 1, 1,
0.5557861, 1.266569, -0.9423746, 0, 0, 0, 1, 1,
0.5595697, 1.138399, 0.7633576, 0, 0, 0, 1, 1,
0.5624545, -0.2538018, 3.071792, 1, 1, 1, 1, 1,
0.5641368, 0.6102825, -1.528904, 1, 1, 1, 1, 1,
0.569618, -0.6405594, 2.337225, 1, 1, 1, 1, 1,
0.5713615, -0.09480007, 1.984931, 1, 1, 1, 1, 1,
0.5764918, -2.344967, 3.76488, 1, 1, 1, 1, 1,
0.5768799, -0.5892282, 1.940637, 1, 1, 1, 1, 1,
0.5853028, 0.5960361, 1.209989, 1, 1, 1, 1, 1,
0.5866095, -0.9034599, 3.307196, 1, 1, 1, 1, 1,
0.5954714, 0.3125187, 1.025895, 1, 1, 1, 1, 1,
0.6006564, 1.113675, 2.582031, 1, 1, 1, 1, 1,
0.602195, 0.878835, 0.3856836, 1, 1, 1, 1, 1,
0.602507, 0.3642389, 1.514378, 1, 1, 1, 1, 1,
0.6047682, -0.05431168, 3.003015, 1, 1, 1, 1, 1,
0.610768, 1.289581, -0.6770813, 1, 1, 1, 1, 1,
0.61123, 0.2939074, 1.965365, 1, 1, 1, 1, 1,
0.6146103, 0.8962111, 3.144863, 0, 0, 1, 1, 1,
0.6164657, -0.4064795, 3.244665, 1, 0, 0, 1, 1,
0.6197307, -0.3832216, 3.712667, 1, 0, 0, 1, 1,
0.6293859, 0.5760582, -0.2732929, 1, 0, 0, 1, 1,
0.6306078, 0.314032, 0.8350731, 1, 0, 0, 1, 1,
0.6455403, -1.911395, 2.131541, 1, 0, 0, 1, 1,
0.6465945, -0.785605, 3.2998, 0, 0, 0, 1, 1,
0.6475047, 0.8098319, 2.349436, 0, 0, 0, 1, 1,
0.6515023, -0.4690959, 2.092854, 0, 0, 0, 1, 1,
0.6528187, 0.436319, -0.03950046, 0, 0, 0, 1, 1,
0.6538509, 0.858588, 0.8640148, 0, 0, 0, 1, 1,
0.6540752, 0.1400881, 0.7725876, 0, 0, 0, 1, 1,
0.654623, -1.736174, 2.503058, 0, 0, 0, 1, 1,
0.6580282, -0.1974316, 1.864182, 1, 1, 1, 1, 1,
0.6594647, -0.7485698, 2.698635, 1, 1, 1, 1, 1,
0.6606269, 0.8111515, -0.02933446, 1, 1, 1, 1, 1,
0.6615351, -1.632468, 2.261227, 1, 1, 1, 1, 1,
0.6656525, -0.5731546, 5.232517, 1, 1, 1, 1, 1,
0.6680482, -1.449236, 2.670686, 1, 1, 1, 1, 1,
0.6775568, -1.736739, 2.680673, 1, 1, 1, 1, 1,
0.6792712, 0.3499475, 1.691026, 1, 1, 1, 1, 1,
0.681661, 1.10341, 1.254471, 1, 1, 1, 1, 1,
0.6851937, -1.219697, 3.308, 1, 1, 1, 1, 1,
0.6854365, -1.565773, 3.760833, 1, 1, 1, 1, 1,
0.6874954, 1.472921, 0.9017036, 1, 1, 1, 1, 1,
0.6894509, 0.4559707, 0.2019386, 1, 1, 1, 1, 1,
0.6950793, -0.2594628, 1.860985, 1, 1, 1, 1, 1,
0.6971392, -0.11478, 0.9493078, 1, 1, 1, 1, 1,
0.7059826, 0.6879435, 1.564714, 0, 0, 1, 1, 1,
0.7102693, -0.1364998, 3.053803, 1, 0, 0, 1, 1,
0.7145491, -0.9516965, 2.509446, 1, 0, 0, 1, 1,
0.7194376, 0.1259289, 1.101591, 1, 0, 0, 1, 1,
0.7198152, -0.7924191, 1.794066, 1, 0, 0, 1, 1,
0.7272914, 0.6844374, -0.4224955, 1, 0, 0, 1, 1,
0.7333166, -1.332178, 2.519991, 0, 0, 0, 1, 1,
0.7461642, 0.4317226, 0.6738443, 0, 0, 0, 1, 1,
0.7496675, -0.9614797, 2.570807, 0, 0, 0, 1, 1,
0.7502781, -3.158959, 4.509208, 0, 0, 0, 1, 1,
0.7526503, 0.4390151, 0.6752334, 0, 0, 0, 1, 1,
0.7553581, -2.588356, 5.54726, 0, 0, 0, 1, 1,
0.755654, -0.2078589, 1.826223, 0, 0, 0, 1, 1,
0.758104, -0.0001598184, 0.4665546, 1, 1, 1, 1, 1,
0.7638285, 1.27802, 0.9741042, 1, 1, 1, 1, 1,
0.7642776, 1.0405, 1.045598, 1, 1, 1, 1, 1,
0.764867, -0.4850537, 2.674987, 1, 1, 1, 1, 1,
0.7668564, 0.8242473, 2.592105, 1, 1, 1, 1, 1,
0.7709851, -0.5813605, 1.791459, 1, 1, 1, 1, 1,
0.784188, -0.09786283, -0.8520738, 1, 1, 1, 1, 1,
0.7851528, 0.5264431, 0.1300746, 1, 1, 1, 1, 1,
0.7879224, -0.4398062, 3.119414, 1, 1, 1, 1, 1,
0.788857, 1.284698, 0.8868871, 1, 1, 1, 1, 1,
0.7891017, 0.3992291, 1.43568, 1, 1, 1, 1, 1,
0.7893834, 1.031541, 0.5348026, 1, 1, 1, 1, 1,
0.7902271, 0.2246874, 0.03711847, 1, 1, 1, 1, 1,
0.7909133, -0.4982542, 1.451437, 1, 1, 1, 1, 1,
0.7944937, 0.4973435, 1.238454, 1, 1, 1, 1, 1,
0.7950841, 0.115286, 0.2067014, 0, 0, 1, 1, 1,
0.797111, 0.5750248, 2.396742, 1, 0, 0, 1, 1,
0.8172892, -0.04517876, 0.453906, 1, 0, 0, 1, 1,
0.8182946, 0.6865478, 2.886194, 1, 0, 0, 1, 1,
0.8228224, 0.5976709, 1.864606, 1, 0, 0, 1, 1,
0.8334522, 0.8448651, 1.30662, 1, 0, 0, 1, 1,
0.8334686, -2.038633, 2.09147, 0, 0, 0, 1, 1,
0.8346778, 0.3911659, 1.180106, 0, 0, 0, 1, 1,
0.8388653, 0.339186, 0.5892735, 0, 0, 0, 1, 1,
0.8410552, 1.845332, 0.5608442, 0, 0, 0, 1, 1,
0.8456088, -1.611166, 3.718237, 0, 0, 0, 1, 1,
0.8500066, 1.247107, 0.04770238, 0, 0, 0, 1, 1,
0.8515651, -0.4612076, 3.293533, 0, 0, 0, 1, 1,
0.8538641, -0.6945397, 2.358077, 1, 1, 1, 1, 1,
0.8584988, -1.121091, 1.827592, 1, 1, 1, 1, 1,
0.8655485, -0.5061114, 1.549591, 1, 1, 1, 1, 1,
0.8661394, -0.3052047, 1.544562, 1, 1, 1, 1, 1,
0.8677047, -1.375937, 1.995518, 1, 1, 1, 1, 1,
0.8692955, -0.1148154, 2.948913, 1, 1, 1, 1, 1,
0.8726907, -2.092463, 2.275774, 1, 1, 1, 1, 1,
0.8738255, -0.1189663, 3.02252, 1, 1, 1, 1, 1,
0.8753233, 0.1812176, 1.295257, 1, 1, 1, 1, 1,
0.8767521, 0.1498315, 1.16134, 1, 1, 1, 1, 1,
0.8813496, 0.9672998, 1.346045, 1, 1, 1, 1, 1,
0.8831953, 0.8070957, -0.03265238, 1, 1, 1, 1, 1,
0.8834793, 0.9348468, -1.110969, 1, 1, 1, 1, 1,
0.8844799, 1.60842, 1.136281, 1, 1, 1, 1, 1,
0.8868533, 1.243066, -0.493426, 1, 1, 1, 1, 1,
0.8872605, -2.405707, 4.121266, 0, 0, 1, 1, 1,
0.8956184, 0.4140854, 0.2137425, 1, 0, 0, 1, 1,
0.8960706, 0.6198886, -0.03713793, 1, 0, 0, 1, 1,
0.896672, -1.205503, 3.318562, 1, 0, 0, 1, 1,
0.8971361, -0.4627952, 2.354583, 1, 0, 0, 1, 1,
0.8971687, 0.3857842, 1.591707, 1, 0, 0, 1, 1,
0.8988746, 0.5988159, 1.995422, 0, 0, 0, 1, 1,
0.9117789, 0.1654733, 2.218532, 0, 0, 0, 1, 1,
0.9166965, -2.467123, 4.148834, 0, 0, 0, 1, 1,
0.9175055, -1.054166, 1.927144, 0, 0, 0, 1, 1,
0.9254842, 1.170081, 0.7937068, 0, 0, 0, 1, 1,
0.9277915, 0.1828222, 2.515334, 0, 0, 0, 1, 1,
0.9354212, -0.9677641, 1.607771, 0, 0, 0, 1, 1,
0.9433357, -1.789, 3.523121, 1, 1, 1, 1, 1,
0.9436274, 0.1665644, 1.826919, 1, 1, 1, 1, 1,
0.9462567, -0.6360715, 2.359332, 1, 1, 1, 1, 1,
0.9538973, -0.8393345, 3.382886, 1, 1, 1, 1, 1,
0.956132, -0.8001388, 2.656268, 1, 1, 1, 1, 1,
0.9635104, 0.9041231, 1.031291, 1, 1, 1, 1, 1,
0.9677426, 0.1771, 2.192452, 1, 1, 1, 1, 1,
0.9677985, 1.324744, 0.7619382, 1, 1, 1, 1, 1,
0.9697951, -1.560359, 1.302207, 1, 1, 1, 1, 1,
0.9715793, -0.01073018, 0.8066556, 1, 1, 1, 1, 1,
0.9742695, -1.019944, 3.4684, 1, 1, 1, 1, 1,
0.9755074, 0.3266779, 1.616872, 1, 1, 1, 1, 1,
0.9771125, -0.6624262, 1.704364, 1, 1, 1, 1, 1,
0.985783, 0.8893228, 1.630962, 1, 1, 1, 1, 1,
1.008746, 0.5042355, 0.5867472, 1, 1, 1, 1, 1,
1.008861, -2.465137, 2.415385, 0, 0, 1, 1, 1,
1.009635, 0.9850997, 0.5326895, 1, 0, 0, 1, 1,
1.02174, -0.8311199, 3.683044, 1, 0, 0, 1, 1,
1.023116, 0.5557014, 0.5859585, 1, 0, 0, 1, 1,
1.030709, 1.065414, -0.6482188, 1, 0, 0, 1, 1,
1.034415, 1.092207, 0.808937, 1, 0, 0, 1, 1,
1.039181, -0.2213903, 3.056422, 0, 0, 0, 1, 1,
1.054942, 1.013711, 1.140072, 0, 0, 0, 1, 1,
1.070155, 0.6944792, 0.7504601, 0, 0, 0, 1, 1,
1.072229, 0.08522617, 0.9440181, 0, 0, 0, 1, 1,
1.073242, -0.1852066, 0.3901384, 0, 0, 0, 1, 1,
1.07498, 1.289721, 0.4082263, 0, 0, 0, 1, 1,
1.075797, -1.957442, 1.675397, 0, 0, 0, 1, 1,
1.079346, 1.779211, 0.32511, 1, 1, 1, 1, 1,
1.079397, -0.3720939, 1.454724, 1, 1, 1, 1, 1,
1.100895, 1.250894, 1.700455, 1, 1, 1, 1, 1,
1.110949, -0.6511414, 1.44916, 1, 1, 1, 1, 1,
1.130654, 0.9096454, 2.016965, 1, 1, 1, 1, 1,
1.133858, -1.477698, 0.6813968, 1, 1, 1, 1, 1,
1.135616, 0.8043547, 0.3295199, 1, 1, 1, 1, 1,
1.140833, -0.3718705, 2.018882, 1, 1, 1, 1, 1,
1.158067, -0.7301239, 2.897104, 1, 1, 1, 1, 1,
1.158194, -1.973616, 1.100266, 1, 1, 1, 1, 1,
1.167232, -0.4037491, 1.073744, 1, 1, 1, 1, 1,
1.17468, 1.105091, 0.482123, 1, 1, 1, 1, 1,
1.194985, 1.383554, 0.3009586, 1, 1, 1, 1, 1,
1.196599, 0.5101891, 0.02598557, 1, 1, 1, 1, 1,
1.205066, 0.9729411, 2.002525, 1, 1, 1, 1, 1,
1.220709, -0.4300272, 3.965153, 0, 0, 1, 1, 1,
1.228675, -0.6108881, 0.2956328, 1, 0, 0, 1, 1,
1.24234, -1.146826, 3.435367, 1, 0, 0, 1, 1,
1.242481, 0.1281103, -1.771085, 1, 0, 0, 1, 1,
1.248787, -0.2279576, 3.163633, 1, 0, 0, 1, 1,
1.252086, 1.187398, 0.6102178, 1, 0, 0, 1, 1,
1.255574, 1.004493, 1.704791, 0, 0, 0, 1, 1,
1.258475, 0.5014282, 0.6710486, 0, 0, 0, 1, 1,
1.25988, -0.2790766, 3.748256, 0, 0, 0, 1, 1,
1.266073, -2.298094, 3.494929, 0, 0, 0, 1, 1,
1.268968, -1.18106, 1.728416, 0, 0, 0, 1, 1,
1.269589, 0.8945981, 2.104852, 0, 0, 0, 1, 1,
1.272176, -1.994554, 1.716, 0, 0, 0, 1, 1,
1.276847, -0.08545063, 1.679694, 1, 1, 1, 1, 1,
1.279923, 0.1580803, 2.154068, 1, 1, 1, 1, 1,
1.282307, -0.4539416, 0.7496868, 1, 1, 1, 1, 1,
1.28296, 0.9018196, 0.567648, 1, 1, 1, 1, 1,
1.296271, -1.574644, 3.350047, 1, 1, 1, 1, 1,
1.296682, -0.4004122, 3.230464, 1, 1, 1, 1, 1,
1.298913, 1.391708, 0.7503719, 1, 1, 1, 1, 1,
1.309464, 0.1714314, 1.163985, 1, 1, 1, 1, 1,
1.317357, -1.003226, 2.885625, 1, 1, 1, 1, 1,
1.348415, 0.9757483, -0.4653837, 1, 1, 1, 1, 1,
1.348603, -1.211252, 3.046057, 1, 1, 1, 1, 1,
1.356068, -0.1426257, 1.736567, 1, 1, 1, 1, 1,
1.3714, 0.1205829, 2.423078, 1, 1, 1, 1, 1,
1.379968, -0.3045121, 1.459632, 1, 1, 1, 1, 1,
1.382577, 0.2099836, 1.928375, 1, 1, 1, 1, 1,
1.387161, -1.516738, 4.116466, 0, 0, 1, 1, 1,
1.401423, -0.8031862, 3.239394, 1, 0, 0, 1, 1,
1.408634, -1.15706, 2.733705, 1, 0, 0, 1, 1,
1.418849, 0.03795259, 2.363233, 1, 0, 0, 1, 1,
1.42252, -0.5717464, 3.329727, 1, 0, 0, 1, 1,
1.432505, -1.06625, 1.640597, 1, 0, 0, 1, 1,
1.443756, 0.6929411, 1.378616, 0, 0, 0, 1, 1,
1.448549, 1.215437, 0.3853343, 0, 0, 0, 1, 1,
1.451637, -1.026631, 3.05058, 0, 0, 0, 1, 1,
1.452289, 1.452669, 0.5623002, 0, 0, 0, 1, 1,
1.465501, -0.749177, 2.853292, 0, 0, 0, 1, 1,
1.496603, -0.2091097, 1.026161, 0, 0, 0, 1, 1,
1.506289, 0.187051, 2.716033, 0, 0, 0, 1, 1,
1.51203, -0.6565912, 2.085192, 1, 1, 1, 1, 1,
1.512211, 0.6974248, -0.8082449, 1, 1, 1, 1, 1,
1.515884, -0.3525447, 1.87285, 1, 1, 1, 1, 1,
1.540719, -0.2666671, 1.833879, 1, 1, 1, 1, 1,
1.551912, -0.175059, 3.892056, 1, 1, 1, 1, 1,
1.553966, -1.41206, 0.1692542, 1, 1, 1, 1, 1,
1.558299, -2.371428, 2.486432, 1, 1, 1, 1, 1,
1.559285, 0.7045721, 1.784368, 1, 1, 1, 1, 1,
1.564447, 0.7744502, 1.804748, 1, 1, 1, 1, 1,
1.568305, -0.8958929, 3.211864, 1, 1, 1, 1, 1,
1.570643, 0.8807256, 0.8653753, 1, 1, 1, 1, 1,
1.608085, -1.034958, 2.823252, 1, 1, 1, 1, 1,
1.613024, -0.08167375, 2.484834, 1, 1, 1, 1, 1,
1.63019, -1.117393, 2.492247, 1, 1, 1, 1, 1,
1.638301, 0.2297781, -0.6766288, 1, 1, 1, 1, 1,
1.669912, -1.726196, 2.676049, 0, 0, 1, 1, 1,
1.688946, 0.6094919, 0.2585746, 1, 0, 0, 1, 1,
1.689272, 0.01610635, 1.452414, 1, 0, 0, 1, 1,
1.697783, -0.2546043, -0.05442305, 1, 0, 0, 1, 1,
1.705663, -1.334508, 2.947338, 1, 0, 0, 1, 1,
1.705821, -0.9035935, 1.693872, 1, 0, 0, 1, 1,
1.710392, -0.5239263, 1.416797, 0, 0, 0, 1, 1,
1.733045, -0.9009444, 1.799112, 0, 0, 0, 1, 1,
1.739251, -0.07446378, 2.803485, 0, 0, 0, 1, 1,
1.739511, -1.182538, 0.5623771, 0, 0, 0, 1, 1,
1.743032, 0.3240778, -0.6945792, 0, 0, 0, 1, 1,
1.744892, 0.07936396, -0.2286458, 0, 0, 0, 1, 1,
1.786398, 0.1414504, 2.577147, 0, 0, 0, 1, 1,
1.792351, 0.2125489, 1.921097, 1, 1, 1, 1, 1,
1.819244, -0.8204162, 2.048294, 1, 1, 1, 1, 1,
1.845272, -1.400764, 2.040848, 1, 1, 1, 1, 1,
1.847934, -0.3231499, 1.299814, 1, 1, 1, 1, 1,
1.858003, -1.236844, 2.822143, 1, 1, 1, 1, 1,
1.914442, 0.5371115, 2.056102, 1, 1, 1, 1, 1,
1.978653, 2.567848, 1.23955, 1, 1, 1, 1, 1,
1.995153, 0.01742691, 2.738554, 1, 1, 1, 1, 1,
2.014896, 0.4315147, 0.888147, 1, 1, 1, 1, 1,
2.028035, -0.1797836, 1.870952, 1, 1, 1, 1, 1,
2.030705, -0.5264883, 1.73116, 1, 1, 1, 1, 1,
2.034819, 1.074384, 1.527814, 1, 1, 1, 1, 1,
2.057752, 0.07797046, 1.100778, 1, 1, 1, 1, 1,
2.077315, 0.5320867, 1.416819, 1, 1, 1, 1, 1,
2.090542, 0.3624642, 1.995545, 1, 1, 1, 1, 1,
2.09614, 0.6058819, 1.923922, 0, 0, 1, 1, 1,
2.112358, -0.5676753, 1.075094, 1, 0, 0, 1, 1,
2.156461, -0.6413727, 1.619164, 1, 0, 0, 1, 1,
2.18696, 1.162134, 0.2278133, 1, 0, 0, 1, 1,
2.198667, -0.9780299, 2.597946, 1, 0, 0, 1, 1,
2.300419, -0.5522724, 2.97353, 1, 0, 0, 1, 1,
2.328456, 1.154855, 2.176084, 0, 0, 0, 1, 1,
2.335185, 0.4432732, 1.811426, 0, 0, 0, 1, 1,
2.339471, 0.4496157, 2.447442, 0, 0, 0, 1, 1,
2.360719, -0.4017262, 0.64306, 0, 0, 0, 1, 1,
2.469424, 2.30603, 1.00718, 0, 0, 0, 1, 1,
2.470108, 1.071534, -0.4893771, 0, 0, 0, 1, 1,
2.481086, 1.309143, 0.5350243, 0, 0, 0, 1, 1,
2.489857, -0.7908311, 1.948523, 1, 1, 1, 1, 1,
2.734436, -0.805663, 2.803123, 1, 1, 1, 1, 1,
2.80475, 0.4608795, 0.8906963, 1, 1, 1, 1, 1,
2.815619, 1.483654, 4.009062, 1, 1, 1, 1, 1,
2.8805, -0.722698, 1.300666, 1, 1, 1, 1, 1,
3.282542, -1.166801, 0.9521965, 1, 1, 1, 1, 1,
3.429822, 1.018223, -0.02664759, 1, 1, 1, 1, 1
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
var radius = 10.19015;
var distance = 35.79248;
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
mvMatrix.translate( 0.01357412, -0.2817779, 0.2610881 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.79248);
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
