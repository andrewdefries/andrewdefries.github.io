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
-3.017459, -0.4490249, -1.899222, 1, 0, 0, 1,
-2.888969, -0.402097, -2.945573, 1, 0.007843138, 0, 1,
-2.598169, 0.6587347, -1.911882, 1, 0.01176471, 0, 1,
-2.588191, -0.1491331, -2.692926, 1, 0.01960784, 0, 1,
-2.504915, -0.7876945, -1.321263, 1, 0.02352941, 0, 1,
-2.464777, -1.931152, -1.328828, 1, 0.03137255, 0, 1,
-2.446012, -1.688616, -1.138026, 1, 0.03529412, 0, 1,
-2.415755, 0.903235, -2.742936, 1, 0.04313726, 0, 1,
-2.377135, 0.006458381, -0.8919579, 1, 0.04705882, 0, 1,
-2.342951, 0.1835077, -2.521235, 1, 0.05490196, 0, 1,
-2.33739, 0.7172257, -0.108269, 1, 0.05882353, 0, 1,
-2.313412, 0.487351, 0.5402289, 1, 0.06666667, 0, 1,
-2.310923, 2.258425, 0.8650507, 1, 0.07058824, 0, 1,
-2.248198, -0.6546912, -0.6259847, 1, 0.07843138, 0, 1,
-2.224016, -0.9721182, -1.472679, 1, 0.08235294, 0, 1,
-2.16323, 1.300689, 0.4699776, 1, 0.09019608, 0, 1,
-2.140692, -0.3700269, -2.43005, 1, 0.09411765, 0, 1,
-2.12985, -2.007745, -1.068541, 1, 0.1019608, 0, 1,
-2.117674, -0.5813127, -0.3447502, 1, 0.1098039, 0, 1,
-2.001785, -0.301488, -2.764278, 1, 0.1137255, 0, 1,
-2.000872, -2.0813, -3.896015, 1, 0.1215686, 0, 1,
-1.977396, 0.8714207, -0.6783867, 1, 0.1254902, 0, 1,
-1.960312, 0.2601849, -1.863976, 1, 0.1333333, 0, 1,
-1.925349, 1.231824, -2.272757, 1, 0.1372549, 0, 1,
-1.90049, -0.06001665, 0.2327681, 1, 0.145098, 0, 1,
-1.881564, 1.074496, -0.5083062, 1, 0.1490196, 0, 1,
-1.873765, 1.123755, -0.1784604, 1, 0.1568628, 0, 1,
-1.854451, -0.6601523, -3.204552, 1, 0.1607843, 0, 1,
-1.851729, 0.4596464, -1.733112, 1, 0.1686275, 0, 1,
-1.828449, 0.7351791, -2.468738, 1, 0.172549, 0, 1,
-1.809675, 0.2744017, -1.307532, 1, 0.1803922, 0, 1,
-1.786632, 0.3076651, -0.5825832, 1, 0.1843137, 0, 1,
-1.745458, -0.5219651, -2.03546, 1, 0.1921569, 0, 1,
-1.745293, 1.69022, -0.8648681, 1, 0.1960784, 0, 1,
-1.707171, 0.8579071, -2.542741, 1, 0.2039216, 0, 1,
-1.701999, 0.3945695, -1.902218, 1, 0.2117647, 0, 1,
-1.691892, 0.2128008, -0.6866837, 1, 0.2156863, 0, 1,
-1.671877, -1.509967, -3.892883, 1, 0.2235294, 0, 1,
-1.667224, -0.6454935, -2.011808, 1, 0.227451, 0, 1,
-1.664392, -0.450013, 1.021649, 1, 0.2352941, 0, 1,
-1.660615, 0.3453452, -1.835924, 1, 0.2392157, 0, 1,
-1.660308, -1.055921, -0.343841, 1, 0.2470588, 0, 1,
-1.653678, 1.316651, -0.5294168, 1, 0.2509804, 0, 1,
-1.631149, -1.298767, -2.586653, 1, 0.2588235, 0, 1,
-1.609028, 0.121221, -1.744882, 1, 0.2627451, 0, 1,
-1.603757, 0.5740292, -0.9123825, 1, 0.2705882, 0, 1,
-1.601702, -0.3969121, -1.228927, 1, 0.2745098, 0, 1,
-1.60054, 1.097021, -0.9929922, 1, 0.282353, 0, 1,
-1.592833, 0.6201869, -0.2807308, 1, 0.2862745, 0, 1,
-1.577937, 1.507114, -1.748327, 1, 0.2941177, 0, 1,
-1.573171, -1.788898, -1.185791, 1, 0.3019608, 0, 1,
-1.55409, 0.09161326, -0.8388016, 1, 0.3058824, 0, 1,
-1.548197, -1.644431, -2.892755, 1, 0.3137255, 0, 1,
-1.547753, -1.477716, -1.149511, 1, 0.3176471, 0, 1,
-1.536064, 0.3996133, -3.104372, 1, 0.3254902, 0, 1,
-1.531644, 0.5033168, -0.6935102, 1, 0.3294118, 0, 1,
-1.516203, -0.8797514, -2.176544, 1, 0.3372549, 0, 1,
-1.507419, 0.6590592, -0.6495044, 1, 0.3411765, 0, 1,
-1.505127, -0.4680981, -1.271382, 1, 0.3490196, 0, 1,
-1.463835, 0.1155451, -0.8120155, 1, 0.3529412, 0, 1,
-1.457813, -0.5877087, -3.53317, 1, 0.3607843, 0, 1,
-1.452412, 0.08974194, -2.322346, 1, 0.3647059, 0, 1,
-1.445987, -0.01186989, -1.668114, 1, 0.372549, 0, 1,
-1.428866, -0.8104802, 0.09307128, 1, 0.3764706, 0, 1,
-1.423981, -1.014754, -4.232929, 1, 0.3843137, 0, 1,
-1.415537, 2.10011, -3.167216, 1, 0.3882353, 0, 1,
-1.412666, 1.976338, -1.748113, 1, 0.3960784, 0, 1,
-1.386176, 0.2063758, -0.6490703, 1, 0.4039216, 0, 1,
-1.373488, 0.532944, -1.598486, 1, 0.4078431, 0, 1,
-1.370907, -0.644665, -0.1564279, 1, 0.4156863, 0, 1,
-1.363757, -0.4105391, -0.8764834, 1, 0.4196078, 0, 1,
-1.36025, -0.4668156, -2.533424, 1, 0.427451, 0, 1,
-1.359899, -0.3390976, -2.813566, 1, 0.4313726, 0, 1,
-1.359221, -0.02509286, -0.2303951, 1, 0.4392157, 0, 1,
-1.341336, 1.122873, -0.6473064, 1, 0.4431373, 0, 1,
-1.312611, -0.9307807, -2.470417, 1, 0.4509804, 0, 1,
-1.310905, -0.3951777, -2.111938, 1, 0.454902, 0, 1,
-1.303964, 0.639392, 0.3317771, 1, 0.4627451, 0, 1,
-1.30131, 0.2170501, -2.355649, 1, 0.4666667, 0, 1,
-1.299914, -3.292461, -1.727536, 1, 0.4745098, 0, 1,
-1.298335, 0.7286457, -0.3738907, 1, 0.4784314, 0, 1,
-1.291607, 0.04083043, -0.9517119, 1, 0.4862745, 0, 1,
-1.290353, 0.08911323, -3.603345, 1, 0.4901961, 0, 1,
-1.289334, 0.3360575, -0.5478036, 1, 0.4980392, 0, 1,
-1.287533, -0.5851843, -1.960559, 1, 0.5058824, 0, 1,
-1.278557, -0.5542118, -2.705227, 1, 0.509804, 0, 1,
-1.274302, 1.860367, 0.4039861, 1, 0.5176471, 0, 1,
-1.269703, 2.170071, -0.9678336, 1, 0.5215687, 0, 1,
-1.268293, -0.3363534, -1.63848, 1, 0.5294118, 0, 1,
-1.260185, 0.3230489, -1.93877, 1, 0.5333334, 0, 1,
-1.252701, 0.001444181, -2.540447, 1, 0.5411765, 0, 1,
-1.252305, 1.462817, -0.5522825, 1, 0.5450981, 0, 1,
-1.249737, -0.6098663, -2.858342, 1, 0.5529412, 0, 1,
-1.248839, 3.280934, -0.5577525, 1, 0.5568628, 0, 1,
-1.246371, 0.1988965, -0.4631334, 1, 0.5647059, 0, 1,
-1.245313, 1.071982, 0.3061568, 1, 0.5686275, 0, 1,
-1.242652, 0.19195, 0.7306673, 1, 0.5764706, 0, 1,
-1.223573, 0.7421523, -2.341506, 1, 0.5803922, 0, 1,
-1.216085, 0.03891121, 0.8904299, 1, 0.5882353, 0, 1,
-1.215749, 1.625611, -0.09896341, 1, 0.5921569, 0, 1,
-1.20595, 0.9553103, -0.6236808, 1, 0.6, 0, 1,
-1.201309, 0.7068028, -0.3220367, 1, 0.6078432, 0, 1,
-1.198488, 1.47389, -1.375316, 1, 0.6117647, 0, 1,
-1.198333, -0.3718064, -1.371622, 1, 0.6196079, 0, 1,
-1.197679, 0.5532742, -1.135232, 1, 0.6235294, 0, 1,
-1.194731, 0.3449607, 0.09669643, 1, 0.6313726, 0, 1,
-1.194372, 0.4941248, 0.427188, 1, 0.6352941, 0, 1,
-1.193939, 1.551774, 0.1468255, 1, 0.6431373, 0, 1,
-1.19387, -1.210029, 0.1053111, 1, 0.6470588, 0, 1,
-1.193134, -2.305837, -2.260583, 1, 0.654902, 0, 1,
-1.175394, 0.09346532, -1.462801, 1, 0.6588235, 0, 1,
-1.168594, 0.8447641, -1.066351, 1, 0.6666667, 0, 1,
-1.166477, -0.8123941, -2.861202, 1, 0.6705883, 0, 1,
-1.16466, 0.453143, -1.256719, 1, 0.6784314, 0, 1,
-1.158815, 0.1505427, -1.47146, 1, 0.682353, 0, 1,
-1.1524, 0.7387732, 0.455936, 1, 0.6901961, 0, 1,
-1.131716, -0.1485735, -0.8976144, 1, 0.6941177, 0, 1,
-1.131016, 1.352468, -2.040193, 1, 0.7019608, 0, 1,
-1.101252, 0.2009547, -2.7282, 1, 0.7098039, 0, 1,
-1.096442, -0.1917999, -3.044113, 1, 0.7137255, 0, 1,
-1.095543, -0.3336169, -2.646972, 1, 0.7215686, 0, 1,
-1.0883, 0.7177945, -0.3369975, 1, 0.7254902, 0, 1,
-1.087834, 0.6787092, -0.710421, 1, 0.7333333, 0, 1,
-1.086383, -1.848982, -3.580151, 1, 0.7372549, 0, 1,
-1.085627, 0.6438441, -0.2540366, 1, 0.7450981, 0, 1,
-1.078872, -0.2878625, -2.402126, 1, 0.7490196, 0, 1,
-1.064311, -1.466243, -3.132722, 1, 0.7568628, 0, 1,
-1.057473, 1.065267, -0.1504292, 1, 0.7607843, 0, 1,
-1.043798, 0.288159, -1.505309, 1, 0.7686275, 0, 1,
-1.040281, -0.3727075, -0.3328571, 1, 0.772549, 0, 1,
-1.036343, -0.2962066, -1.800027, 1, 0.7803922, 0, 1,
-1.03152, 0.07037307, 0.32865, 1, 0.7843137, 0, 1,
-1.030525, 0.2942843, -2.394135, 1, 0.7921569, 0, 1,
-1.022911, 0.007085587, -1.239543, 1, 0.7960784, 0, 1,
-1.020395, 0.9223258, -0.765928, 1, 0.8039216, 0, 1,
-1.019434, -0.6701314, -3.859049, 1, 0.8117647, 0, 1,
-1.016979, -0.7630175, -2.520808, 1, 0.8156863, 0, 1,
-1.001493, 0.7052139, -0.5397772, 1, 0.8235294, 0, 1,
-0.9998796, 1.299887, -1.361476, 1, 0.827451, 0, 1,
-0.993807, 0.3572232, -3.589948, 1, 0.8352941, 0, 1,
-0.9895647, 0.8243237, 0.2057749, 1, 0.8392157, 0, 1,
-0.9824227, -0.7354414, -0.8530124, 1, 0.8470588, 0, 1,
-0.972011, -0.7624223, -3.315418, 1, 0.8509804, 0, 1,
-0.9685407, -0.09235697, -1.03268, 1, 0.8588235, 0, 1,
-0.9638318, -0.7658459, -1.136409, 1, 0.8627451, 0, 1,
-0.9584944, 0.04832628, 0.5694441, 1, 0.8705882, 0, 1,
-0.9492224, -0.4898465, -1.029091, 1, 0.8745098, 0, 1,
-0.9489222, 1.618831, -0.3430392, 1, 0.8823529, 0, 1,
-0.9423461, 0.07475163, -0.1050353, 1, 0.8862745, 0, 1,
-0.9390638, -0.09954094, -1.687619, 1, 0.8941177, 0, 1,
-0.9321864, -0.9394363, -2.934492, 1, 0.8980392, 0, 1,
-0.926551, 1.516612, -1.146419, 1, 0.9058824, 0, 1,
-0.9258628, -1.658444, -2.61946, 1, 0.9137255, 0, 1,
-0.9248496, 0.621525, -2.860527, 1, 0.9176471, 0, 1,
-0.923832, 0.6305974, -1.045833, 1, 0.9254902, 0, 1,
-0.9173928, -0.6337766, -2.26758, 1, 0.9294118, 0, 1,
-0.9170939, 0.06783335, -1.621537, 1, 0.9372549, 0, 1,
-0.9089532, 0.3556086, -3.089933, 1, 0.9411765, 0, 1,
-0.9074821, 1.404264, -0.5741478, 1, 0.9490196, 0, 1,
-0.9065585, -0.180855, -2.844864, 1, 0.9529412, 0, 1,
-0.904097, -0.2133649, -2.628333, 1, 0.9607843, 0, 1,
-0.9015222, -0.4543681, -2.589567, 1, 0.9647059, 0, 1,
-0.8995661, -0.8949471, -3.920057, 1, 0.972549, 0, 1,
-0.8962514, 0.3221854, -0.5973318, 1, 0.9764706, 0, 1,
-0.8940355, -0.849103, 0.01242354, 1, 0.9843137, 0, 1,
-0.8915244, -1.179461, -4.086806, 1, 0.9882353, 0, 1,
-0.890111, 0.7601439, 0.4017122, 1, 0.9960784, 0, 1,
-0.8841217, 1.270704, -1.894396, 0.9960784, 1, 0, 1,
-0.8807228, 2.477586, 0.6733556, 0.9921569, 1, 0, 1,
-0.8753209, 0.2391701, -0.6014559, 0.9843137, 1, 0, 1,
-0.8672122, 0.05537556, -0.9135852, 0.9803922, 1, 0, 1,
-0.8670654, 1.688727, 0.2306803, 0.972549, 1, 0, 1,
-0.8591997, -0.2703548, -1.763387, 0.9686275, 1, 0, 1,
-0.8551914, 2.7661, 1.252152, 0.9607843, 1, 0, 1,
-0.8485531, -0.3305711, -2.995371, 0.9568627, 1, 0, 1,
-0.8446079, -2.566518, -2.737545, 0.9490196, 1, 0, 1,
-0.8409959, 0.3786388, -2.612874, 0.945098, 1, 0, 1,
-0.8391443, 0.4923242, -0.9864168, 0.9372549, 1, 0, 1,
-0.8290649, -0.2416363, -0.3695543, 0.9333333, 1, 0, 1,
-0.8256171, 2.411159, 0.3124094, 0.9254902, 1, 0, 1,
-0.8232989, -2.021522, -2.335149, 0.9215686, 1, 0, 1,
-0.8201278, -1.963969, -2.601565, 0.9137255, 1, 0, 1,
-0.8187004, 1.38011, 0.2766909, 0.9098039, 1, 0, 1,
-0.8153217, -0.6180447, -1.561173, 0.9019608, 1, 0, 1,
-0.8118457, -1.123385, -3.652512, 0.8941177, 1, 0, 1,
-0.8099087, -1.144709, -3.465859, 0.8901961, 1, 0, 1,
-0.8009176, -2.207375, -3.155306, 0.8823529, 1, 0, 1,
-0.8001797, -1.346041, -1.474901, 0.8784314, 1, 0, 1,
-0.8000746, -0.7369236, -1.937084, 0.8705882, 1, 0, 1,
-0.7934434, 0.4848579, -2.00899, 0.8666667, 1, 0, 1,
-0.7852521, -0.2569212, -2.164027, 0.8588235, 1, 0, 1,
-0.7807065, -0.1921916, -1.726876, 0.854902, 1, 0, 1,
-0.7795036, -0.1026606, -3.34726, 0.8470588, 1, 0, 1,
-0.7789298, 0.9172431, -1.040316, 0.8431373, 1, 0, 1,
-0.7771396, -0.2429802, -1.940955, 0.8352941, 1, 0, 1,
-0.7767956, -0.2460137, -2.275751, 0.8313726, 1, 0, 1,
-0.7705171, 0.5980144, -1.035768, 0.8235294, 1, 0, 1,
-0.7673372, 1.186135, -1.887262, 0.8196079, 1, 0, 1,
-0.7663155, -1.336388, -2.184394, 0.8117647, 1, 0, 1,
-0.7640316, -1.226327, -3.989779, 0.8078431, 1, 0, 1,
-0.7637212, 0.08433889, -1.667007, 0.8, 1, 0, 1,
-0.7624821, -1.015962, -1.852549, 0.7921569, 1, 0, 1,
-0.7591522, -0.5191363, -0.8972579, 0.7882353, 1, 0, 1,
-0.7552308, 0.6507887, 0.6032359, 0.7803922, 1, 0, 1,
-0.7503139, 1.401784, -2.095237, 0.7764706, 1, 0, 1,
-0.7459039, -1.962806, -2.735005, 0.7686275, 1, 0, 1,
-0.7457287, -1.318944, -2.986817, 0.7647059, 1, 0, 1,
-0.74246, -0.4862061, -2.29247, 0.7568628, 1, 0, 1,
-0.7320328, -0.4551291, -2.29546, 0.7529412, 1, 0, 1,
-0.730612, 0.5567893, -0.7131257, 0.7450981, 1, 0, 1,
-0.7293348, 1.319934, 0.1704682, 0.7411765, 1, 0, 1,
-0.7149965, 0.1010835, -1.730016, 0.7333333, 1, 0, 1,
-0.7147692, -0.6823726, -1.704025, 0.7294118, 1, 0, 1,
-0.7146365, -0.7292548, -3.401007, 0.7215686, 1, 0, 1,
-0.7135171, 0.2355119, -0.9887536, 0.7176471, 1, 0, 1,
-0.712029, 0.5851485, -1.128967, 0.7098039, 1, 0, 1,
-0.7102256, 0.786841, -1.737419, 0.7058824, 1, 0, 1,
-0.7098718, 0.1236077, -1.875774, 0.6980392, 1, 0, 1,
-0.7090206, -0.6590241, -2.989492, 0.6901961, 1, 0, 1,
-0.7071532, 0.1049116, 0.5441662, 0.6862745, 1, 0, 1,
-0.6961107, -2.526693, -2.19445, 0.6784314, 1, 0, 1,
-0.6952985, -0.7099608, -0.5699914, 0.6745098, 1, 0, 1,
-0.6949719, -0.8801214, -4.294146, 0.6666667, 1, 0, 1,
-0.6913185, 1.163444, -1.931513, 0.6627451, 1, 0, 1,
-0.6863521, 0.3605353, -1.032243, 0.654902, 1, 0, 1,
-0.6787894, -0.01014852, -2.146884, 0.6509804, 1, 0, 1,
-0.6768835, 1.471469, -2.380924, 0.6431373, 1, 0, 1,
-0.6750141, -0.1182946, -3.221416, 0.6392157, 1, 0, 1,
-0.6742973, -1.781824, -2.430414, 0.6313726, 1, 0, 1,
-0.6738743, 0.13231, -0.9648436, 0.627451, 1, 0, 1,
-0.6732935, 1.025055, -0.03202729, 0.6196079, 1, 0, 1,
-0.6698265, 0.3746231, -1.359181, 0.6156863, 1, 0, 1,
-0.6685075, -0.07737866, -1.965396, 0.6078432, 1, 0, 1,
-0.6596406, -0.682234, -3.633329, 0.6039216, 1, 0, 1,
-0.6462343, -0.3321267, -3.125935, 0.5960785, 1, 0, 1,
-0.6424183, 0.2118046, -0.5284743, 0.5882353, 1, 0, 1,
-0.6416672, -0.3207599, -2.727166, 0.5843138, 1, 0, 1,
-0.6368165, 0.7391679, 1.611468, 0.5764706, 1, 0, 1,
-0.6350232, -0.7032608, 0.4837464, 0.572549, 1, 0, 1,
-0.6342003, -0.6871217, -4.179299, 0.5647059, 1, 0, 1,
-0.633055, -1.030393, -2.951663, 0.5607843, 1, 0, 1,
-0.6258568, 0.5129349, -0.9398806, 0.5529412, 1, 0, 1,
-0.6258251, 0.8210492, -1.449359, 0.5490196, 1, 0, 1,
-0.6234875, 1.666461, 0.2727276, 0.5411765, 1, 0, 1,
-0.6228085, -0.736133, -1.994407, 0.5372549, 1, 0, 1,
-0.6206781, -1.210587, -4.247745, 0.5294118, 1, 0, 1,
-0.619349, 1.187437, 0.4043891, 0.5254902, 1, 0, 1,
-0.6151595, -0.04785224, -1.192371, 0.5176471, 1, 0, 1,
-0.6137757, -0.501659, -3.00614, 0.5137255, 1, 0, 1,
-0.6110089, -0.592, -1.402117, 0.5058824, 1, 0, 1,
-0.607127, -0.1769186, -0.1911631, 0.5019608, 1, 0, 1,
-0.6031907, -0.5017259, -1.509369, 0.4941176, 1, 0, 1,
-0.6025257, 0.6998322, -0.7536935, 0.4862745, 1, 0, 1,
-0.6017929, 0.04869856, -1.793988, 0.4823529, 1, 0, 1,
-0.5989984, 1.484657, 0.8659443, 0.4745098, 1, 0, 1,
-0.5980808, 0.2802026, 0.226168, 0.4705882, 1, 0, 1,
-0.5976616, -1.228134, -3.241791, 0.4627451, 1, 0, 1,
-0.5935886, 0.09945552, -1.322067, 0.4588235, 1, 0, 1,
-0.5919952, 1.894328, -0.1978415, 0.4509804, 1, 0, 1,
-0.5907502, 0.7237868, -0.1739071, 0.4470588, 1, 0, 1,
-0.5868212, 1.561754, 1.566338, 0.4392157, 1, 0, 1,
-0.5844412, -1.135691, -2.960321, 0.4352941, 1, 0, 1,
-0.5835489, 1.392768, 0.5188268, 0.427451, 1, 0, 1,
-0.5827822, -1.405036, -1.497981, 0.4235294, 1, 0, 1,
-0.5812708, 0.03950167, -1.554598, 0.4156863, 1, 0, 1,
-0.5791099, 1.266899, -0.5990694, 0.4117647, 1, 0, 1,
-0.5774255, 0.5568749, -0.57147, 0.4039216, 1, 0, 1,
-0.5761698, -0.2696292, -3.488624, 0.3960784, 1, 0, 1,
-0.5742455, 0.7154179, -1.871475, 0.3921569, 1, 0, 1,
-0.5732458, -0.8792257, -2.818999, 0.3843137, 1, 0, 1,
-0.5688554, -1.849922, -1.886196, 0.3803922, 1, 0, 1,
-0.5683177, 0.9549726, 0.1600051, 0.372549, 1, 0, 1,
-0.5665091, 1.224355, -0.02982931, 0.3686275, 1, 0, 1,
-0.5640665, 0.24946, -2.826918, 0.3607843, 1, 0, 1,
-0.5589147, -0.05877937, -2.83186, 0.3568628, 1, 0, 1,
-0.5566962, -0.6502594, -2.081633, 0.3490196, 1, 0, 1,
-0.5551257, 1.955932, 0.2007828, 0.345098, 1, 0, 1,
-0.5527768, -0.70008, -3.315497, 0.3372549, 1, 0, 1,
-0.5479462, -0.8007789, -4.066781, 0.3333333, 1, 0, 1,
-0.5478218, 0.1408571, -1.087831, 0.3254902, 1, 0, 1,
-0.546369, -0.1142201, -1.888028, 0.3215686, 1, 0, 1,
-0.5444496, 0.1136275, -2.88174, 0.3137255, 1, 0, 1,
-0.5374097, 1.959244, -1.101878, 0.3098039, 1, 0, 1,
-0.5358435, 0.627395, -2.913549, 0.3019608, 1, 0, 1,
-0.5358173, 1.259183, -1.142758, 0.2941177, 1, 0, 1,
-0.5331304, 1.551246, -1.982893, 0.2901961, 1, 0, 1,
-0.533121, -1.095825, -0.7706506, 0.282353, 1, 0, 1,
-0.5313394, -0.9830663, -3.015769, 0.2784314, 1, 0, 1,
-0.5293629, -1.111474, -2.336069, 0.2705882, 1, 0, 1,
-0.5271999, -1.284357, -2.049753, 0.2666667, 1, 0, 1,
-0.5265191, 0.8931825, -0.6738006, 0.2588235, 1, 0, 1,
-0.5263508, -1.017738, -1.759939, 0.254902, 1, 0, 1,
-0.5159981, -0.1892672, -1.446294, 0.2470588, 1, 0, 1,
-0.5158832, 0.9466432, -0.3582138, 0.2431373, 1, 0, 1,
-0.5148873, 1.624956, -0.2513307, 0.2352941, 1, 0, 1,
-0.5079499, -0.1047481, -3.15657, 0.2313726, 1, 0, 1,
-0.5068082, -1.523343, -3.026269, 0.2235294, 1, 0, 1,
-0.5025918, 0.3635929, -1.052737, 0.2196078, 1, 0, 1,
-0.5011619, -1.229335, -1.827601, 0.2117647, 1, 0, 1,
-0.5005419, -1.696511, -3.389769, 0.2078431, 1, 0, 1,
-0.4931801, -0.606774, -3.24134, 0.2, 1, 0, 1,
-0.4906115, -0.9509694, -1.926182, 0.1921569, 1, 0, 1,
-0.4821619, -1.150351, -3.085248, 0.1882353, 1, 0, 1,
-0.4814361, 0.5269337, -0.9512229, 0.1803922, 1, 0, 1,
-0.4797586, -0.6777957, -3.692946, 0.1764706, 1, 0, 1,
-0.4784562, -2.305096, -2.579848, 0.1686275, 1, 0, 1,
-0.4763127, 1.044698, -1.210329, 0.1647059, 1, 0, 1,
-0.4724641, -0.8618999, -2.465218, 0.1568628, 1, 0, 1,
-0.4666166, -0.395559, -1.062103, 0.1529412, 1, 0, 1,
-0.4600478, -0.02171174, -1.894845, 0.145098, 1, 0, 1,
-0.4558019, 2.669238, -0.2918053, 0.1411765, 1, 0, 1,
-0.4494804, -0.0519849, -0.615223, 0.1333333, 1, 0, 1,
-0.4480757, 0.4292902, -0.5172349, 0.1294118, 1, 0, 1,
-0.4473077, 0.3168084, 0.2607556, 0.1215686, 1, 0, 1,
-0.4465574, 0.8034793, 0.01035085, 0.1176471, 1, 0, 1,
-0.4408436, -0.8091539, -1.649737, 0.1098039, 1, 0, 1,
-0.4398765, 0.3157429, -1.032928, 0.1058824, 1, 0, 1,
-0.4396471, -0.3109986, -3.69237, 0.09803922, 1, 0, 1,
-0.4325394, 0.4102119, 0.07051474, 0.09019608, 1, 0, 1,
-0.4278029, -0.3419349, -1.85746, 0.08627451, 1, 0, 1,
-0.4250672, -0.3972106, -3.80393, 0.07843138, 1, 0, 1,
-0.4231871, -0.6610845, -3.245443, 0.07450981, 1, 0, 1,
-0.4223295, 0.009527887, -1.544237, 0.06666667, 1, 0, 1,
-0.421067, -1.059973, -2.132647, 0.0627451, 1, 0, 1,
-0.4156032, -1.914544, -3.370724, 0.05490196, 1, 0, 1,
-0.4148894, 0.1019113, -2.366831, 0.05098039, 1, 0, 1,
-0.4144205, -1.468847, -2.051579, 0.04313726, 1, 0, 1,
-0.4140109, -0.1783013, -1.580839, 0.03921569, 1, 0, 1,
-0.4108985, -1.162769, -4.258506, 0.03137255, 1, 0, 1,
-0.4106797, 0.6588734, -1.045764, 0.02745098, 1, 0, 1,
-0.4103087, 0.5953612, -1.553055, 0.01960784, 1, 0, 1,
-0.40818, 0.6901999, -1.155739, 0.01568628, 1, 0, 1,
-0.4081711, 0.6815738, -1.252045, 0.007843138, 1, 0, 1,
-0.4027717, -0.6558588, -3.366644, 0.003921569, 1, 0, 1,
-0.392411, 0.02079513, -0.9087115, 0, 1, 0.003921569, 1,
-0.3869523, 1.007407, -1.258282, 0, 1, 0.01176471, 1,
-0.3857718, 0.3922498, -1.547977, 0, 1, 0.01568628, 1,
-0.3831416, -1.12249, -2.398822, 0, 1, 0.02352941, 1,
-0.3830257, -0.3527525, -1.742258, 0, 1, 0.02745098, 1,
-0.3777206, 0.07892273, -1.393514, 0, 1, 0.03529412, 1,
-0.3728685, -1.593988, -4.381612, 0, 1, 0.03921569, 1,
-0.3720639, -0.8002191, -3.451736, 0, 1, 0.04705882, 1,
-0.3718178, 1.224611, 1.258853, 0, 1, 0.05098039, 1,
-0.3708917, -0.5026656, -1.622206, 0, 1, 0.05882353, 1,
-0.3697159, -0.3146985, -1.993017, 0, 1, 0.0627451, 1,
-0.3684638, -2.317228, -5.21265, 0, 1, 0.07058824, 1,
-0.3683026, -1.122803, -3.811382, 0, 1, 0.07450981, 1,
-0.3681493, -0.247931, -1.679096, 0, 1, 0.08235294, 1,
-0.3681071, 0.9194959, -0.4910511, 0, 1, 0.08627451, 1,
-0.3669311, 0.4985403, 0.6507866, 0, 1, 0.09411765, 1,
-0.3644421, -0.1333618, -2.161058, 0, 1, 0.1019608, 1,
-0.3623558, 0.2843775, -0.5582569, 0, 1, 0.1058824, 1,
-0.3592899, -0.7920542, -4.998128, 0, 1, 0.1137255, 1,
-0.3586923, 0.6511348, -0.7032373, 0, 1, 0.1176471, 1,
-0.3559624, -0.1848438, -1.647343, 0, 1, 0.1254902, 1,
-0.3520458, -0.1598987, -2.00263, 0, 1, 0.1294118, 1,
-0.3479508, 1.134081, -2.176764, 0, 1, 0.1372549, 1,
-0.3478391, -2.381716, -2.633018, 0, 1, 0.1411765, 1,
-0.3453001, 0.6261955, -0.8495916, 0, 1, 0.1490196, 1,
-0.3444875, 0.1356038, -0.7299378, 0, 1, 0.1529412, 1,
-0.3398683, -1.759428, -2.821672, 0, 1, 0.1607843, 1,
-0.3348513, -2.904058, -1.388591, 0, 1, 0.1647059, 1,
-0.3257163, 0.1150404, -0.3907888, 0, 1, 0.172549, 1,
-0.3250695, 1.116145, -0.6936747, 0, 1, 0.1764706, 1,
-0.323205, 0.2443991, -0.5016044, 0, 1, 0.1843137, 1,
-0.322047, -1.498727, -3.040294, 0, 1, 0.1882353, 1,
-0.3199244, -0.5767092, -4.912271, 0, 1, 0.1960784, 1,
-0.3196983, -0.3350672, -2.296614, 0, 1, 0.2039216, 1,
-0.3170107, 0.2224894, -1.160202, 0, 1, 0.2078431, 1,
-0.3158077, 0.8813851, -0.9861553, 0, 1, 0.2156863, 1,
-0.3132522, 1.16697, 0.3188004, 0, 1, 0.2196078, 1,
-0.3107602, -1.112482, -3.117261, 0, 1, 0.227451, 1,
-0.3091934, -0.783054, -4.247135, 0, 1, 0.2313726, 1,
-0.3072097, -0.5447131, -3.588481, 0, 1, 0.2392157, 1,
-0.3067762, -0.6980384, -2.920137, 0, 1, 0.2431373, 1,
-0.3038175, -0.08931668, -2.160457, 0, 1, 0.2509804, 1,
-0.3025412, 0.5582246, -0.1463696, 0, 1, 0.254902, 1,
-0.3023271, 0.7091002, -0.9685983, 0, 1, 0.2627451, 1,
-0.2964635, 2.179001, -1.075891, 0, 1, 0.2666667, 1,
-0.2954574, 1.493447, -1.520583, 0, 1, 0.2745098, 1,
-0.2953483, 1.235038, -1.377135, 0, 1, 0.2784314, 1,
-0.2943844, -0.4959963, -2.890225, 0, 1, 0.2862745, 1,
-0.2938992, -0.02200415, -1.144176, 0, 1, 0.2901961, 1,
-0.2936988, -0.522512, -2.886262, 0, 1, 0.2980392, 1,
-0.288895, 1.079786, -0.802911, 0, 1, 0.3058824, 1,
-0.2821167, -0.6595287, -2.788845, 0, 1, 0.3098039, 1,
-0.2815358, -0.3775942, -2.20337, 0, 1, 0.3176471, 1,
-0.2805259, 0.2198146, -0.1872841, 0, 1, 0.3215686, 1,
-0.2761847, 1.045362, 0.06754246, 0, 1, 0.3294118, 1,
-0.2741975, -1.203663, -2.864588, 0, 1, 0.3333333, 1,
-0.2696343, -0.7193468, -3.613656, 0, 1, 0.3411765, 1,
-0.2604216, -0.5996178, -3.968759, 0, 1, 0.345098, 1,
-0.2592658, 2.24375, -0.51182, 0, 1, 0.3529412, 1,
-0.2589193, -0.5318466, -1.203332, 0, 1, 0.3568628, 1,
-0.2557672, -0.4474969, -0.1013478, 0, 1, 0.3647059, 1,
-0.2556869, -0.9808165, -4.826857, 0, 1, 0.3686275, 1,
-0.2542838, -1.310249, -1.866407, 0, 1, 0.3764706, 1,
-0.2528647, 0.7853417, -0.6486047, 0, 1, 0.3803922, 1,
-0.2522745, 0.09782735, -0.8484475, 0, 1, 0.3882353, 1,
-0.2506973, -0.003708441, -2.177242, 0, 1, 0.3921569, 1,
-0.2489775, 1.477661, -0.9265519, 0, 1, 0.4, 1,
-0.2486364, -1.048928, -4.423654, 0, 1, 0.4078431, 1,
-0.2470717, -0.264024, -1.891327, 0, 1, 0.4117647, 1,
-0.2444867, 1.036954, 0.7483968, 0, 1, 0.4196078, 1,
-0.2336723, -1.041276, -2.844592, 0, 1, 0.4235294, 1,
-0.2335171, 0.1212558, -1.798574, 0, 1, 0.4313726, 1,
-0.2301801, 0.2844807, -0.6029019, 0, 1, 0.4352941, 1,
-0.2298415, 0.4680598, 1.070547, 0, 1, 0.4431373, 1,
-0.2286206, -0.5134596, -2.339103, 0, 1, 0.4470588, 1,
-0.2279633, 2.61795, -1.022265, 0, 1, 0.454902, 1,
-0.2187873, 1.126098, -1.771239, 0, 1, 0.4588235, 1,
-0.2174964, -1.136929, -4.043645, 0, 1, 0.4666667, 1,
-0.2164609, -0.8335306, -3.167798, 0, 1, 0.4705882, 1,
-0.21582, 0.3483433, -1.543132, 0, 1, 0.4784314, 1,
-0.2156406, 1.067671, 0.2129615, 0, 1, 0.4823529, 1,
-0.2145733, -0.2327984, -2.78222, 0, 1, 0.4901961, 1,
-0.2142393, -0.08850777, -2.037348, 0, 1, 0.4941176, 1,
-0.2084116, -1.485765, -1.813813, 0, 1, 0.5019608, 1,
-0.2054742, 0.8163035, 0.1046358, 0, 1, 0.509804, 1,
-0.2048113, 1.312942, -1.840456, 0, 1, 0.5137255, 1,
-0.1998628, 0.283472, -0.5900648, 0, 1, 0.5215687, 1,
-0.1964335, 0.6183152, -1.42322, 0, 1, 0.5254902, 1,
-0.1960967, 0.4147521, -1.374904, 0, 1, 0.5333334, 1,
-0.1918631, -0.1440049, -0.510987, 0, 1, 0.5372549, 1,
-0.1860271, 0.763282, 1.173272, 0, 1, 0.5450981, 1,
-0.1851307, 1.186996, 0.8927891, 0, 1, 0.5490196, 1,
-0.1838022, -0.1804312, -1.970465, 0, 1, 0.5568628, 1,
-0.1835057, 0.2352546, -0.6064659, 0, 1, 0.5607843, 1,
-0.179354, 0.6768983, -1.360802, 0, 1, 0.5686275, 1,
-0.1787174, -0.654096, -3.135298, 0, 1, 0.572549, 1,
-0.1749182, -1.062769, -6.092625, 0, 1, 0.5803922, 1,
-0.1734293, 1.148351, -1.069425, 0, 1, 0.5843138, 1,
-0.1730297, 0.04733301, -0.03758689, 0, 1, 0.5921569, 1,
-0.16841, -0.4813688, -2.323975, 0, 1, 0.5960785, 1,
-0.166927, 0.7322817, -1.548171, 0, 1, 0.6039216, 1,
-0.1664061, -0.1634059, -2.288921, 0, 1, 0.6117647, 1,
-0.1638399, -0.02765749, -2.496133, 0, 1, 0.6156863, 1,
-0.1635608, 0.9602334, 0.1001362, 0, 1, 0.6235294, 1,
-0.1616168, -0.175355, 0.02060353, 0, 1, 0.627451, 1,
-0.1608816, -0.4608319, -2.752614, 0, 1, 0.6352941, 1,
-0.1574129, 0.7430609, -0.9642936, 0, 1, 0.6392157, 1,
-0.1570892, -2.713834, -3.19998, 0, 1, 0.6470588, 1,
-0.155864, 0.07136192, -0.5078321, 0, 1, 0.6509804, 1,
-0.1499127, 0.5733889, -1.290469, 0, 1, 0.6588235, 1,
-0.1451962, 1.035059, -0.03783458, 0, 1, 0.6627451, 1,
-0.1421788, 0.7740839, -1.021343, 0, 1, 0.6705883, 1,
-0.1350153, 0.1027693, -1.47885, 0, 1, 0.6745098, 1,
-0.1348792, 1.250257, -0.8783664, 0, 1, 0.682353, 1,
-0.1346685, 0.6283777, -1.490392, 0, 1, 0.6862745, 1,
-0.1301477, 0.5309191, -0.5916387, 0, 1, 0.6941177, 1,
-0.1260556, -0.6864911, -3.650657, 0, 1, 0.7019608, 1,
-0.1260408, -0.2708302, -3.049498, 0, 1, 0.7058824, 1,
-0.1241637, 0.05920777, -1.744152, 0, 1, 0.7137255, 1,
-0.1232311, 2.383482, -0.2165756, 0, 1, 0.7176471, 1,
-0.1206733, -0.3306978, -1.936542, 0, 1, 0.7254902, 1,
-0.1195468, -0.5847583, -4.242805, 0, 1, 0.7294118, 1,
-0.1170434, 1.686362, -0.3232033, 0, 1, 0.7372549, 1,
-0.1144713, -0.1018354, -2.158509, 0, 1, 0.7411765, 1,
-0.1119523, 1.794347, -0.7589928, 0, 1, 0.7490196, 1,
-0.1088278, 0.5050963, -0.6479211, 0, 1, 0.7529412, 1,
-0.1051469, -0.02357401, -1.364135, 0, 1, 0.7607843, 1,
-0.09886679, -1.124662, -1.717893, 0, 1, 0.7647059, 1,
-0.09681651, -1.769188, -4.333953, 0, 1, 0.772549, 1,
-0.09655125, 0.1411106, 0.6532548, 0, 1, 0.7764706, 1,
-0.09519245, -0.3320944, -4.008043, 0, 1, 0.7843137, 1,
-0.0941162, 0.5197021, -2.572262, 0, 1, 0.7882353, 1,
-0.09348025, 0.9760847, -0.6232274, 0, 1, 0.7960784, 1,
-0.09174049, 0.3323139, 0.9530613, 0, 1, 0.8039216, 1,
-0.08669118, 0.8178387, 0.8485399, 0, 1, 0.8078431, 1,
-0.08651412, 0.2499781, -1.428305, 0, 1, 0.8156863, 1,
-0.08155784, -0.6326602, -3.00978, 0, 1, 0.8196079, 1,
-0.08095933, 0.3146262, 0.6326183, 0, 1, 0.827451, 1,
-0.07663561, 0.2032387, -2.167497, 0, 1, 0.8313726, 1,
-0.07065669, 1.475618, -0.8774924, 0, 1, 0.8392157, 1,
-0.06971998, 0.02293316, -0.001514694, 0, 1, 0.8431373, 1,
-0.06871164, 0.5419419, -0.1815778, 0, 1, 0.8509804, 1,
-0.06008651, -0.09474957, -1.889778, 0, 1, 0.854902, 1,
-0.05496679, 0.02192368, -1.586329, 0, 1, 0.8627451, 1,
-0.05347458, -1.104249, -3.244634, 0, 1, 0.8666667, 1,
-0.05176471, 1.164244, 0.597088, 0, 1, 0.8745098, 1,
-0.05117326, 0.6561614, -1.427107, 0, 1, 0.8784314, 1,
-0.04733245, -0.4831853, -2.148672, 0, 1, 0.8862745, 1,
-0.04663347, -1.935325, -2.790377, 0, 1, 0.8901961, 1,
-0.04570462, 0.8409673, 1.678745, 0, 1, 0.8980392, 1,
-0.04342876, -0.7590852, -3.180784, 0, 1, 0.9058824, 1,
-0.04153575, -0.4238804, -2.691502, 0, 1, 0.9098039, 1,
-0.04062954, 2.039769, -0.5979098, 0, 1, 0.9176471, 1,
-0.04062333, 0.8127923, 1.967304, 0, 1, 0.9215686, 1,
-0.03936519, 0.5329999, -1.650396, 0, 1, 0.9294118, 1,
-0.03873793, -0.4068639, -1.934241, 0, 1, 0.9333333, 1,
-0.03820591, -0.3352727, -2.87812, 0, 1, 0.9411765, 1,
-0.03081681, -0.4584536, -4.621538, 0, 1, 0.945098, 1,
-0.02947739, -0.1746053, -1.870923, 0, 1, 0.9529412, 1,
-0.02894891, 0.6445979, -0.1553367, 0, 1, 0.9568627, 1,
-0.02102293, -0.1039185, -4.71908, 0, 1, 0.9647059, 1,
-0.01745521, -0.4648465, -3.380492, 0, 1, 0.9686275, 1,
-0.01624474, 0.8177743, -1.153621, 0, 1, 0.9764706, 1,
-0.01410405, 0.1351943, 1.473284, 0, 1, 0.9803922, 1,
-0.0125893, -2.057421, -2.054312, 0, 1, 0.9882353, 1,
-0.01240838, -3.456338, -4.443949, 0, 1, 0.9921569, 1,
-0.01011959, 0.672657, 1.06904, 0, 1, 1, 1,
-0.009155332, 1.027858, -0.9901125, 0, 0.9921569, 1, 1,
-0.003695099, -0.3657564, -4.325793, 0, 0.9882353, 1, 1,
-0.003334252, -0.6164919, -4.768945, 0, 0.9803922, 1, 1,
-0.003169826, -0.3686806, -1.937221, 0, 0.9764706, 1, 1,
-0.001138018, -0.3824048, -5.886183, 0, 0.9686275, 1, 1,
0.004425981, 1.390363, 1.63053, 0, 0.9647059, 1, 1,
0.00469733, -0.2425308, 4.723472, 0, 0.9568627, 1, 1,
0.005198532, 0.900138, 1.143841, 0, 0.9529412, 1, 1,
0.006425368, 0.8634915, -0.751341, 0, 0.945098, 1, 1,
0.01084176, -1.80431, 2.402204, 0, 0.9411765, 1, 1,
0.01132552, 0.5348047, 1.043048, 0, 0.9333333, 1, 1,
0.01720068, 1.161315, 1.3414, 0, 0.9294118, 1, 1,
0.01752049, -2.228414, 4.322899, 0, 0.9215686, 1, 1,
0.01759953, 0.03745874, 1.686822, 0, 0.9176471, 1, 1,
0.01798897, -1.720492, 3.41448, 0, 0.9098039, 1, 1,
0.01841405, 0.9864494, 0.1019533, 0, 0.9058824, 1, 1,
0.01861705, 1.163553, -0.0997981, 0, 0.8980392, 1, 1,
0.02002566, -0.8135059, 3.353284, 0, 0.8901961, 1, 1,
0.02245785, 0.5963483, 0.3631401, 0, 0.8862745, 1, 1,
0.02937909, 0.3277483, -0.462372, 0, 0.8784314, 1, 1,
0.03428864, 1.794809, 2.919305, 0, 0.8745098, 1, 1,
0.03746499, 1.15304, 0.4966097, 0, 0.8666667, 1, 1,
0.03762111, -1.789147, 1.641234, 0, 0.8627451, 1, 1,
0.03959683, 0.5398014, -0.5028851, 0, 0.854902, 1, 1,
0.04068226, -0.4619131, 2.664362, 0, 0.8509804, 1, 1,
0.042355, 0.1717073, 0.05790583, 0, 0.8431373, 1, 1,
0.04542144, 0.5688487, 0.2270908, 0, 0.8392157, 1, 1,
0.04567563, 1.025512, 0.1769501, 0, 0.8313726, 1, 1,
0.04890216, 0.9494856, -0.2018932, 0, 0.827451, 1, 1,
0.05470057, -1.383803, 2.341793, 0, 0.8196079, 1, 1,
0.06630295, 0.01758305, 1.198062, 0, 0.8156863, 1, 1,
0.06743925, -0.3216009, 2.655854, 0, 0.8078431, 1, 1,
0.07455098, -2.300675, 3.597272, 0, 0.8039216, 1, 1,
0.07614671, 1.628148, -0.3863518, 0, 0.7960784, 1, 1,
0.07770837, -0.0001426147, 2.323681, 0, 0.7882353, 1, 1,
0.07892369, 0.09968801, 1.110523, 0, 0.7843137, 1, 1,
0.08002145, 0.01163976, 1.494646, 0, 0.7764706, 1, 1,
0.08100335, 2.114943, 0.6208854, 0, 0.772549, 1, 1,
0.08325889, -0.4852515, 3.385394, 0, 0.7647059, 1, 1,
0.08609706, 0.3924445, -1.060269, 0, 0.7607843, 1, 1,
0.08849033, -1.138883, 2.0872, 0, 0.7529412, 1, 1,
0.08868698, 1.752097, -1.06561, 0, 0.7490196, 1, 1,
0.08882026, -0.6062073, 5.142779, 0, 0.7411765, 1, 1,
0.09061179, -0.6019953, 2.11992, 0, 0.7372549, 1, 1,
0.09147777, -0.7984348, 4.667773, 0, 0.7294118, 1, 1,
0.09184199, -0.9627467, 0.9861175, 0, 0.7254902, 1, 1,
0.09252011, 0.185704, 2.577241, 0, 0.7176471, 1, 1,
0.09326874, 0.7378505, 2.574343, 0, 0.7137255, 1, 1,
0.1028967, 0.305114, 2.006064, 0, 0.7058824, 1, 1,
0.1043188, -1.791731, 4.476543, 0, 0.6980392, 1, 1,
0.1090446, 2.03959, 1.282328, 0, 0.6941177, 1, 1,
0.1118171, 1.290814, 1.589544, 0, 0.6862745, 1, 1,
0.1118398, -0.2730879, 3.390777, 0, 0.682353, 1, 1,
0.1126503, 0.7241279, -0.2942096, 0, 0.6745098, 1, 1,
0.1126911, 0.07253937, 0.9187117, 0, 0.6705883, 1, 1,
0.113291, 0.6547248, 1.384602, 0, 0.6627451, 1, 1,
0.1150922, -0.1639037, 2.398898, 0, 0.6588235, 1, 1,
0.1178957, -0.9405308, 2.042686, 0, 0.6509804, 1, 1,
0.1186896, 0.1785653, 1.106074, 0, 0.6470588, 1, 1,
0.1193066, 0.13515, -0.2615352, 0, 0.6392157, 1, 1,
0.1206868, -1.163297, 1.953053, 0, 0.6352941, 1, 1,
0.1226339, 1.482552, -0.9840945, 0, 0.627451, 1, 1,
0.1268372, -0.5524286, 3.039749, 0, 0.6235294, 1, 1,
0.1272013, 0.8876362, 0.4258109, 0, 0.6156863, 1, 1,
0.1281772, -1.788391, 3.016406, 0, 0.6117647, 1, 1,
0.1291073, -0.01568582, 0.8844681, 0, 0.6039216, 1, 1,
0.1303508, -2.401475, 1.951074, 0, 0.5960785, 1, 1,
0.1327765, 1.32751, 1.615176, 0, 0.5921569, 1, 1,
0.1334992, 0.5828701, -0.08451789, 0, 0.5843138, 1, 1,
0.1336771, 0.672259, 1.112168, 0, 0.5803922, 1, 1,
0.133928, -0.1892727, 2.569935, 0, 0.572549, 1, 1,
0.1419663, -1.380914, 3.053088, 0, 0.5686275, 1, 1,
0.142533, -0.6908071, 2.674497, 0, 0.5607843, 1, 1,
0.1438423, 0.3661978, 1.160578, 0, 0.5568628, 1, 1,
0.1451977, -1.017955, 1.882571, 0, 0.5490196, 1, 1,
0.1512694, 1.306298, 1.892499, 0, 0.5450981, 1, 1,
0.1515139, -0.1974707, 1.661448, 0, 0.5372549, 1, 1,
0.1535276, 1.244556, -1.60023, 0, 0.5333334, 1, 1,
0.1541989, -0.8121413, 1.405518, 0, 0.5254902, 1, 1,
0.1609117, 0.7166758, 0.4301937, 0, 0.5215687, 1, 1,
0.1612742, -1.008003, 4.123762, 0, 0.5137255, 1, 1,
0.161313, 1.007103, -0.6600618, 0, 0.509804, 1, 1,
0.1661039, 0.2960937, 2.141752, 0, 0.5019608, 1, 1,
0.1724471, 0.8229124, 0.5133554, 0, 0.4941176, 1, 1,
0.1765085, -0.1496568, 3.2216, 0, 0.4901961, 1, 1,
0.181856, 0.646929, 0.5960802, 0, 0.4823529, 1, 1,
0.1855078, 1.841396, -0.4018111, 0, 0.4784314, 1, 1,
0.1866332, -0.9273058, 2.970905, 0, 0.4705882, 1, 1,
0.1920079, 0.0772119, 0.7633826, 0, 0.4666667, 1, 1,
0.1959269, -0.889182, 1.47717, 0, 0.4588235, 1, 1,
0.1965718, -0.303967, 3.173568, 0, 0.454902, 1, 1,
0.1976549, -0.4163714, 3.591265, 0, 0.4470588, 1, 1,
0.201363, 0.8390093, 1.351171, 0, 0.4431373, 1, 1,
0.2041693, 0.6444728, -2.482841, 0, 0.4352941, 1, 1,
0.2072933, 0.298502, -0.3436088, 0, 0.4313726, 1, 1,
0.2079013, 0.4699858, 1.448322, 0, 0.4235294, 1, 1,
0.2168491, 0.4408332, 0.4074116, 0, 0.4196078, 1, 1,
0.2198469, 0.03172207, 3.217048, 0, 0.4117647, 1, 1,
0.2288256, -1.066964, 2.581045, 0, 0.4078431, 1, 1,
0.2298325, -0.0378459, 2.029767, 0, 0.4, 1, 1,
0.2308729, -0.1145435, 2.527799, 0, 0.3921569, 1, 1,
0.2318671, 0.07413118, 0.2561208, 0, 0.3882353, 1, 1,
0.2341643, 0.4551981, -0.8138844, 0, 0.3803922, 1, 1,
0.2390453, 0.723978, -1.371131, 0, 0.3764706, 1, 1,
0.2432996, -0.4755687, 1.216634, 0, 0.3686275, 1, 1,
0.2442055, -0.4957571, 2.910323, 0, 0.3647059, 1, 1,
0.2476431, -0.009536542, 3.411405, 0, 0.3568628, 1, 1,
0.248451, -1.297305, 4.07936, 0, 0.3529412, 1, 1,
0.2524787, -0.6283692, 3.6738, 0, 0.345098, 1, 1,
0.2577239, -1.053128, 2.716012, 0, 0.3411765, 1, 1,
0.2631551, -0.701999, 3.21766, 0, 0.3333333, 1, 1,
0.2639766, 0.432572, 0.7778769, 0, 0.3294118, 1, 1,
0.2654356, 1.000515, 0.5747755, 0, 0.3215686, 1, 1,
0.2681756, -0.1430564, 0.412102, 0, 0.3176471, 1, 1,
0.2730744, -0.3064274, 2.29727, 0, 0.3098039, 1, 1,
0.2737879, -0.1452338, 2.13795, 0, 0.3058824, 1, 1,
0.2744474, 0.3987525, 0.7637413, 0, 0.2980392, 1, 1,
0.2747052, 0.9534931, 0.3916337, 0, 0.2901961, 1, 1,
0.2779393, -1.147821, 3.010284, 0, 0.2862745, 1, 1,
0.2790136, 0.7071401, 0.3900549, 0, 0.2784314, 1, 1,
0.2793309, -1.089874, 3.438445, 0, 0.2745098, 1, 1,
0.2825958, 0.3180668, 0.5862887, 0, 0.2666667, 1, 1,
0.2828586, 1.803823, 1.073569, 0, 0.2627451, 1, 1,
0.2840425, 0.7756523, 0.05700348, 0, 0.254902, 1, 1,
0.2904011, 0.3401217, 0.6796912, 0, 0.2509804, 1, 1,
0.2920556, 0.790467, -0.4010813, 0, 0.2431373, 1, 1,
0.2941154, 0.7278043, -0.05250194, 0, 0.2392157, 1, 1,
0.29964, 1.207773, 1.515324, 0, 0.2313726, 1, 1,
0.3051361, -1.840336, 2.097213, 0, 0.227451, 1, 1,
0.3116635, -1.036928, 2.787983, 0, 0.2196078, 1, 1,
0.3188105, 0.5024031, -0.757172, 0, 0.2156863, 1, 1,
0.322691, 0.8834769, 0.532645, 0, 0.2078431, 1, 1,
0.3234161, -1.328142, 2.600646, 0, 0.2039216, 1, 1,
0.323565, -1.180601, 0.7204128, 0, 0.1960784, 1, 1,
0.3274153, 0.7944719, 0.6270504, 0, 0.1882353, 1, 1,
0.3412573, -0.4514677, 2.652625, 0, 0.1843137, 1, 1,
0.3414958, 0.3583293, -0.5270307, 0, 0.1764706, 1, 1,
0.3417398, 0.6966473, 1.247366, 0, 0.172549, 1, 1,
0.3458701, -1.393977, 3.276869, 0, 0.1647059, 1, 1,
0.346117, -0.7747293, 1.75943, 0, 0.1607843, 1, 1,
0.3499338, 3.342952, -1.170159, 0, 0.1529412, 1, 1,
0.3512106, 0.2556669, 1.096994, 0, 0.1490196, 1, 1,
0.3527341, -0.8978263, 2.475857, 0, 0.1411765, 1, 1,
0.3531563, 1.938391, 0.6183831, 0, 0.1372549, 1, 1,
0.3547556, 0.8530768, -0.07890246, 0, 0.1294118, 1, 1,
0.3583294, -0.4322612, 3.047845, 0, 0.1254902, 1, 1,
0.3644765, 0.288509, 0.8010877, 0, 0.1176471, 1, 1,
0.3672998, -0.4408732, 1.216786, 0, 0.1137255, 1, 1,
0.3692475, 0.08102541, 1.688434, 0, 0.1058824, 1, 1,
0.3712245, 0.09124428, 0.5594199, 0, 0.09803922, 1, 1,
0.3719905, -1.003801, 2.697078, 0, 0.09411765, 1, 1,
0.3726337, 0.5610633, -0.3373734, 0, 0.08627451, 1, 1,
0.3729847, 0.2688242, 1.852263, 0, 0.08235294, 1, 1,
0.3748462, -0.7973436, 2.364472, 0, 0.07450981, 1, 1,
0.3749089, -0.06430401, 2.309593, 0, 0.07058824, 1, 1,
0.3750646, 1.318676, 1.304968, 0, 0.0627451, 1, 1,
0.3802606, -0.9916824, 2.36456, 0, 0.05882353, 1, 1,
0.3807169, 0.7197576, 0.04930576, 0, 0.05098039, 1, 1,
0.3837662, 0.6805223, -0.1388334, 0, 0.04705882, 1, 1,
0.3851175, -0.3773589, 2.215866, 0, 0.03921569, 1, 1,
0.386489, 0.008008479, 1.044327, 0, 0.03529412, 1, 1,
0.387896, -1.736835, 3.342517, 0, 0.02745098, 1, 1,
0.3940043, -0.1739324, 1.643694, 0, 0.02352941, 1, 1,
0.4000532, -0.8848983, 3.484304, 0, 0.01568628, 1, 1,
0.4006113, -0.3145782, 1.791236, 0, 0.01176471, 1, 1,
0.4035488, 2.347769, 0.01317756, 0, 0.003921569, 1, 1,
0.4050629, -0.1288793, 1.085709, 0.003921569, 0, 1, 1,
0.4067602, -1.202496, 3.392251, 0.007843138, 0, 1, 1,
0.4127257, 1.028091, 1.88783, 0.01568628, 0, 1, 1,
0.4134625, -0.7715992, 1.358163, 0.01960784, 0, 1, 1,
0.4186489, -0.6725816, 1.490385, 0.02745098, 0, 1, 1,
0.4192548, 0.153411, 0.2332641, 0.03137255, 0, 1, 1,
0.4215518, 0.5195712, 0.1335809, 0.03921569, 0, 1, 1,
0.4281628, 0.6145834, 0.98185, 0.04313726, 0, 1, 1,
0.4284202, 0.586171, -0.02184819, 0.05098039, 0, 1, 1,
0.4307752, -0.3515427, 1.071261, 0.05490196, 0, 1, 1,
0.4380385, 0.001496769, 1.300158, 0.0627451, 0, 1, 1,
0.446609, -0.3379278, 2.761205, 0.06666667, 0, 1, 1,
0.4475831, -0.4349292, 2.186669, 0.07450981, 0, 1, 1,
0.4478456, -2.330404, 2.865906, 0.07843138, 0, 1, 1,
0.4496451, -0.9039693, 1.803987, 0.08627451, 0, 1, 1,
0.4522592, -0.5369183, 1.731318, 0.09019608, 0, 1, 1,
0.4541345, 1.133657, 0.2359567, 0.09803922, 0, 1, 1,
0.4578162, 0.1807249, 1.785184, 0.1058824, 0, 1, 1,
0.4579125, -0.5575386, 2.547414, 0.1098039, 0, 1, 1,
0.4602116, -0.2747841, 1.84315, 0.1176471, 0, 1, 1,
0.4639558, -0.7970755, 2.159198, 0.1215686, 0, 1, 1,
0.4641183, -1.567467, 3.220163, 0.1294118, 0, 1, 1,
0.4647649, 0.8939166, 2.056059, 0.1333333, 0, 1, 1,
0.4820119, 0.1615156, 0.7496916, 0.1411765, 0, 1, 1,
0.4894599, 0.2676252, 2.054669, 0.145098, 0, 1, 1,
0.4894962, 0.3051994, -0.4047323, 0.1529412, 0, 1, 1,
0.4917623, -0.3865926, 3.601399, 0.1568628, 0, 1, 1,
0.4960259, 0.9851929, 0.9084842, 0.1647059, 0, 1, 1,
0.5000448, -0.2672444, 2.646254, 0.1686275, 0, 1, 1,
0.5033328, -1.048962, 2.746528, 0.1764706, 0, 1, 1,
0.5064632, 0.6880774, -0.03396775, 0.1803922, 0, 1, 1,
0.5070037, -0.1671804, 2.196453, 0.1882353, 0, 1, 1,
0.5082702, 1.635813, 1.188979, 0.1921569, 0, 1, 1,
0.5089807, 0.4545827, 1.368436, 0.2, 0, 1, 1,
0.5091435, -1.111695, 1.30037, 0.2078431, 0, 1, 1,
0.5149224, 1.592544, -0.2212458, 0.2117647, 0, 1, 1,
0.5181568, -0.04402675, -0.08803956, 0.2196078, 0, 1, 1,
0.5300332, 0.4901443, 1.671677, 0.2235294, 0, 1, 1,
0.5304999, 3.179594, -1.302126, 0.2313726, 0, 1, 1,
0.5348328, 0.6097016, 0.919067, 0.2352941, 0, 1, 1,
0.5365474, -0.3986408, 3.932052, 0.2431373, 0, 1, 1,
0.540937, -0.06020584, 1.748955, 0.2470588, 0, 1, 1,
0.5453851, -0.1454231, 1.691003, 0.254902, 0, 1, 1,
0.547603, 1.215139, 0.1132657, 0.2588235, 0, 1, 1,
0.5511968, -0.5505278, 1.881933, 0.2666667, 0, 1, 1,
0.5521433, -0.1234974, 1.852627, 0.2705882, 0, 1, 1,
0.5570992, 0.5379184, 1.525155, 0.2784314, 0, 1, 1,
0.5589415, 0.1315367, 2.032344, 0.282353, 0, 1, 1,
0.5595558, -1.285859, 2.82341, 0.2901961, 0, 1, 1,
0.5598727, -1.10544, 3.519299, 0.2941177, 0, 1, 1,
0.5662829, 0.3928306, 0.7114625, 0.3019608, 0, 1, 1,
0.5703244, -0.3644957, 2.371399, 0.3098039, 0, 1, 1,
0.5723934, 0.2778124, 2.057714, 0.3137255, 0, 1, 1,
0.5744808, 1.088849, -0.6956872, 0.3215686, 0, 1, 1,
0.5766549, -0.9703699, 1.254738, 0.3254902, 0, 1, 1,
0.5781723, 0.7430037, 0.9194096, 0.3333333, 0, 1, 1,
0.5927352, -0.09026505, 2.236244, 0.3372549, 0, 1, 1,
0.6009793, -0.3296878, 0.8885146, 0.345098, 0, 1, 1,
0.6023512, -0.05762845, -0.08737466, 0.3490196, 0, 1, 1,
0.6044222, 0.2858392, 1.298975, 0.3568628, 0, 1, 1,
0.607031, 1.828108, 2.022169, 0.3607843, 0, 1, 1,
0.6087419, 0.4007458, 1.061272, 0.3686275, 0, 1, 1,
0.6100867, 0.07431005, 1.018825, 0.372549, 0, 1, 1,
0.612168, -0.1141114, 2.700408, 0.3803922, 0, 1, 1,
0.6258141, -1.639874, 1.429785, 0.3843137, 0, 1, 1,
0.6305914, -0.4066521, 3.052507, 0.3921569, 0, 1, 1,
0.6309153, 0.1473684, 1.509398, 0.3960784, 0, 1, 1,
0.6311746, -0.2141422, 1.919749, 0.4039216, 0, 1, 1,
0.6327469, -0.09128159, 1.589791, 0.4117647, 0, 1, 1,
0.6365605, -0.698942, 1.717892, 0.4156863, 0, 1, 1,
0.6420976, -0.7699446, 1.958323, 0.4235294, 0, 1, 1,
0.6465673, -1.879651, 0.4887156, 0.427451, 0, 1, 1,
0.6491782, 1.077118, 1.125761, 0.4352941, 0, 1, 1,
0.6501589, 0.2103473, -0.7281535, 0.4392157, 0, 1, 1,
0.6577486, 1.690575, 0.9156874, 0.4470588, 0, 1, 1,
0.6601299, 0.3180092, 1.352376, 0.4509804, 0, 1, 1,
0.6603064, 1.243862, 1.570453, 0.4588235, 0, 1, 1,
0.6691115, 0.52584, -0.2336252, 0.4627451, 0, 1, 1,
0.6691684, 1.30302, -1.319691, 0.4705882, 0, 1, 1,
0.6738363, -3.221711, 2.823607, 0.4745098, 0, 1, 1,
0.6780485, 0.4454892, 0.6610982, 0.4823529, 0, 1, 1,
0.6824391, 0.3120584, 0.9628743, 0.4862745, 0, 1, 1,
0.6875678, -2.345129, 0.838487, 0.4941176, 0, 1, 1,
0.6897163, 0.3173771, 0.7639223, 0.5019608, 0, 1, 1,
0.6902554, -1.15666, 2.144986, 0.5058824, 0, 1, 1,
0.6908001, -0.6547089, 1.09702, 0.5137255, 0, 1, 1,
0.6924183, -0.5463771, 0.6842489, 0.5176471, 0, 1, 1,
0.6959937, 0.8819687, 2.159779, 0.5254902, 0, 1, 1,
0.700022, -0.1016391, 0.6123021, 0.5294118, 0, 1, 1,
0.7009017, -1.228394, 3.965026, 0.5372549, 0, 1, 1,
0.7072454, -0.3864464, 1.940986, 0.5411765, 0, 1, 1,
0.718583, -0.1298063, 1.72366, 0.5490196, 0, 1, 1,
0.721761, 2.100513, 0.8436205, 0.5529412, 0, 1, 1,
0.72449, -0.1902575, 3.633935, 0.5607843, 0, 1, 1,
0.7245539, 0.07783068, 1.990185, 0.5647059, 0, 1, 1,
0.7249187, -1.627339, 3.889178, 0.572549, 0, 1, 1,
0.7313604, -0.4537203, 3.627593, 0.5764706, 0, 1, 1,
0.7325809, 1.965921, 0.6794697, 0.5843138, 0, 1, 1,
0.7326013, 0.3209224, 1.960363, 0.5882353, 0, 1, 1,
0.7327341, 1.19724, 2.328138, 0.5960785, 0, 1, 1,
0.738445, 0.5581611, -0.423656, 0.6039216, 0, 1, 1,
0.7429299, 0.2662807, 2.599632, 0.6078432, 0, 1, 1,
0.7579688, 1.267715, 1.028462, 0.6156863, 0, 1, 1,
0.7582669, -0.03383451, 3.537619, 0.6196079, 0, 1, 1,
0.758405, 0.2872902, 0.8383158, 0.627451, 0, 1, 1,
0.7611606, -2.032686, 3.734191, 0.6313726, 0, 1, 1,
0.7644966, 0.7291379, 0.707357, 0.6392157, 0, 1, 1,
0.7665452, -0.4932578, 2.004315, 0.6431373, 0, 1, 1,
0.7719499, 0.6632168, 0.3504911, 0.6509804, 0, 1, 1,
0.7726916, 0.1321315, 3.381227, 0.654902, 0, 1, 1,
0.7731174, 0.4439499, 0.6538505, 0.6627451, 0, 1, 1,
0.7770226, -0.7047626, 1.982096, 0.6666667, 0, 1, 1,
0.7791039, 1.090929, 0.8064098, 0.6745098, 0, 1, 1,
0.7857755, 0.03700113, -0.1698536, 0.6784314, 0, 1, 1,
0.785781, 1.831547, 0.5520561, 0.6862745, 0, 1, 1,
0.7983229, -0.5403534, 2.97065, 0.6901961, 0, 1, 1,
0.8019935, 1.049099, 0.6343175, 0.6980392, 0, 1, 1,
0.8036256, 0.2300601, 1.308623, 0.7058824, 0, 1, 1,
0.8045447, -0.1246457, 1.043142, 0.7098039, 0, 1, 1,
0.8046086, -0.2959315, 1.02751, 0.7176471, 0, 1, 1,
0.811742, -0.03584788, 1.202779, 0.7215686, 0, 1, 1,
0.8214511, -0.5768471, 0.6178304, 0.7294118, 0, 1, 1,
0.8223941, 0.6337923, 2.098312, 0.7333333, 0, 1, 1,
0.8224139, 0.9234181, 0.4118409, 0.7411765, 0, 1, 1,
0.8230692, -0.979519, 2.114837, 0.7450981, 0, 1, 1,
0.8284201, -0.1595219, 1.134642, 0.7529412, 0, 1, 1,
0.8313946, -1.47836, 2.801678, 0.7568628, 0, 1, 1,
0.8360817, -0.5765063, 1.666532, 0.7647059, 0, 1, 1,
0.837106, -0.4556245, 1.834977, 0.7686275, 0, 1, 1,
0.838576, 0.2306116, 0.699204, 0.7764706, 0, 1, 1,
0.8409769, 0.9827535, -1.134532, 0.7803922, 0, 1, 1,
0.8437462, -1.470875, 1.685261, 0.7882353, 0, 1, 1,
0.8482884, 0.8956466, 1.261309, 0.7921569, 0, 1, 1,
0.8490316, -0.6452451, 1.581115, 0.8, 0, 1, 1,
0.8513528, -0.982261, 1.802621, 0.8078431, 0, 1, 1,
0.8523689, -0.1215909, 2.263748, 0.8117647, 0, 1, 1,
0.8527136, -0.2969869, 2.870755, 0.8196079, 0, 1, 1,
0.8544288, -0.9586911, 1.276913, 0.8235294, 0, 1, 1,
0.8599254, -0.3269919, 2.612254, 0.8313726, 0, 1, 1,
0.8629681, 0.6357998, 1.76773, 0.8352941, 0, 1, 1,
0.8650037, 0.8396536, -0.963921, 0.8431373, 0, 1, 1,
0.8686572, -0.5416633, 0.8073871, 0.8470588, 0, 1, 1,
0.8706739, -0.05869843, 1.217073, 0.854902, 0, 1, 1,
0.8745884, -0.5895486, 3.657518, 0.8588235, 0, 1, 1,
0.8783982, -0.02438132, 1.426587, 0.8666667, 0, 1, 1,
0.8831094, 0.08220538, 2.383082, 0.8705882, 0, 1, 1,
0.9072562, 0.8324489, 0.6424354, 0.8784314, 0, 1, 1,
0.9126938, -0.6038443, 2.07155, 0.8823529, 0, 1, 1,
0.9141095, 0.4731684, -0.3061599, 0.8901961, 0, 1, 1,
0.9214819, -1.323412, 1.915904, 0.8941177, 0, 1, 1,
0.9261733, -0.5530168, 3.354111, 0.9019608, 0, 1, 1,
0.9364364, 0.2004776, 2.20163, 0.9098039, 0, 1, 1,
0.9417143, -0.5955086, 1.564576, 0.9137255, 0, 1, 1,
0.9436398, -1.001815, 2.831631, 0.9215686, 0, 1, 1,
0.947411, -1.324601, 3.742671, 0.9254902, 0, 1, 1,
0.9491243, -1.016299, 2.720146, 0.9333333, 0, 1, 1,
0.9525558, 0.642743, 0.8440337, 0.9372549, 0, 1, 1,
0.9554846, -0.04260245, 0.3576438, 0.945098, 0, 1, 1,
0.9604589, 1.70057, -1.038098, 0.9490196, 0, 1, 1,
0.9617775, -0.1897112, 1.515823, 0.9568627, 0, 1, 1,
0.962418, 1.215636, 0.9704966, 0.9607843, 0, 1, 1,
0.9695766, -0.02518964, 2.741077, 0.9686275, 0, 1, 1,
0.9711538, -0.7578659, 3.10849, 0.972549, 0, 1, 1,
0.9714356, 0.9466532, 0.6872615, 0.9803922, 0, 1, 1,
0.9723193, 0.1329982, 2.553889, 0.9843137, 0, 1, 1,
0.9834169, -0.378649, 3.665334, 0.9921569, 0, 1, 1,
0.9875739, -0.6628403, 2.799643, 0.9960784, 0, 1, 1,
0.9915528, 2.121204, 0.7910119, 1, 0, 0.9960784, 1,
0.9957335, 0.4325908, 0.1410304, 1, 0, 0.9882353, 1,
0.9964437, -1.269372, 0.5184022, 1, 0, 0.9843137, 1,
0.9964962, 0.1616458, 2.168193, 1, 0, 0.9764706, 1,
0.9991966, 0.1577544, 0.7252518, 1, 0, 0.972549, 1,
1.006077, 0.02383646, -1.010917, 1, 0, 0.9647059, 1,
1.006166, -2.652764, 3.654605, 1, 0, 0.9607843, 1,
1.006642, -0.06357158, -0.04227415, 1, 0, 0.9529412, 1,
1.008445, -0.2205353, 2.613465, 1, 0, 0.9490196, 1,
1.013169, -0.651776, 2.624256, 1, 0, 0.9411765, 1,
1.014174, -0.8638349, 3.414443, 1, 0, 0.9372549, 1,
1.01714, 2.450184, -0.6176715, 1, 0, 0.9294118, 1,
1.029025, -0.3571569, 1.370873, 1, 0, 0.9254902, 1,
1.029272, 0.7548735, 1.527614, 1, 0, 0.9176471, 1,
1.03649, 0.8429889, 0.955704, 1, 0, 0.9137255, 1,
1.039233, 2.726598, 0.5923507, 1, 0, 0.9058824, 1,
1.04026, -1.035683, 1.498513, 1, 0, 0.9019608, 1,
1.052931, 1.43275, -0.8092596, 1, 0, 0.8941177, 1,
1.056533, 0.3624863, 1.521041, 1, 0, 0.8862745, 1,
1.058636, 0.238562, 0.5868863, 1, 0, 0.8823529, 1,
1.062398, -0.2028282, 1.540086, 1, 0, 0.8745098, 1,
1.062989, -0.1479963, 1.155799, 1, 0, 0.8705882, 1,
1.068257, -0.1029365, -0.543822, 1, 0, 0.8627451, 1,
1.07049, 0.5513926, 1.039001, 1, 0, 0.8588235, 1,
1.072107, -1.206481, 1.403428, 1, 0, 0.8509804, 1,
1.076094, 0.6495606, 0.7932686, 1, 0, 0.8470588, 1,
1.078185, 0.7740443, 1.926761, 1, 0, 0.8392157, 1,
1.080542, -1.404252, 3.101983, 1, 0, 0.8352941, 1,
1.089161, -1.311315, 3.064036, 1, 0, 0.827451, 1,
1.090153, -0.0767922, 1.875599, 1, 0, 0.8235294, 1,
1.093793, -0.9095504, 3.854116, 1, 0, 0.8156863, 1,
1.100419, -0.4634329, 1.48292, 1, 0, 0.8117647, 1,
1.101422, -0.3823332, 0.4930624, 1, 0, 0.8039216, 1,
1.113637, -0.5409604, 2.056411, 1, 0, 0.7960784, 1,
1.114859, 1.02317, 1.437254, 1, 0, 0.7921569, 1,
1.117612, 0.9307035, -1.904836, 1, 0, 0.7843137, 1,
1.118781, -0.6667156, 3.834026, 1, 0, 0.7803922, 1,
1.127546, 1.297014, 2.137925, 1, 0, 0.772549, 1,
1.134326, 0.4298186, 1.767618, 1, 0, 0.7686275, 1,
1.144503, 0.393626, 2.263257, 1, 0, 0.7607843, 1,
1.147514, 0.4779975, 2.385548, 1, 0, 0.7568628, 1,
1.155668, 0.8348516, 2.364148, 1, 0, 0.7490196, 1,
1.158826, -0.2116036, 0.5182954, 1, 0, 0.7450981, 1,
1.15991, -1.66742, 4.591458, 1, 0, 0.7372549, 1,
1.163665, -0.1658672, 1.39431, 1, 0, 0.7333333, 1,
1.170097, -0.1648457, 1.844916, 1, 0, 0.7254902, 1,
1.17506, 0.0009414599, 1.377434, 1, 0, 0.7215686, 1,
1.186217, 0.5234988, -0.2342303, 1, 0, 0.7137255, 1,
1.190596, -0.4941829, 1.52479, 1, 0, 0.7098039, 1,
1.194462, -0.2980529, 5.226073, 1, 0, 0.7019608, 1,
1.199268, -0.4827387, 2.350603, 1, 0, 0.6941177, 1,
1.212742, -2.475664, 2.486971, 1, 0, 0.6901961, 1,
1.220779, 1.791265, 1.529881, 1, 0, 0.682353, 1,
1.226776, -0.3450075, 1.565283, 1, 0, 0.6784314, 1,
1.228048, -0.6838689, 1.647011, 1, 0, 0.6705883, 1,
1.228299, 0.9078184, -0.2633181, 1, 0, 0.6666667, 1,
1.231399, -1.216019, 1.676569, 1, 0, 0.6588235, 1,
1.232066, -0.8541151, 3.114813, 1, 0, 0.654902, 1,
1.237407, 0.746627, 2.192871, 1, 0, 0.6470588, 1,
1.248625, -0.06902894, 0.199409, 1, 0, 0.6431373, 1,
1.257987, 1.158696, 1.721854, 1, 0, 0.6352941, 1,
1.263721, -1.206094, 4.099609, 1, 0, 0.6313726, 1,
1.265785, -0.3302848, 1.44346, 1, 0, 0.6235294, 1,
1.26907, 1.44914, 1.198981, 1, 0, 0.6196079, 1,
1.274467, 3.293069, 1.046397, 1, 0, 0.6117647, 1,
1.279612, -0.3778598, 2.815958, 1, 0, 0.6078432, 1,
1.302195, 0.8136401, 0.6614582, 1, 0, 0.6, 1,
1.302995, 1.061778, 0.4520414, 1, 0, 0.5921569, 1,
1.303012, -1.10581, 4.38089, 1, 0, 0.5882353, 1,
1.305, 1.100212, 1.26204, 1, 0, 0.5803922, 1,
1.307336, 0.6243175, 1.554031, 1, 0, 0.5764706, 1,
1.308882, -0.621151, 2.560381, 1, 0, 0.5686275, 1,
1.315398, 0.3319998, 1.155436, 1, 0, 0.5647059, 1,
1.31793, -1.685663, 2.075011, 1, 0, 0.5568628, 1,
1.318489, 0.2831544, 1.183137, 1, 0, 0.5529412, 1,
1.322308, -1.178589, 1.720535, 1, 0, 0.5450981, 1,
1.333014, -0.07566624, 2.076849, 1, 0, 0.5411765, 1,
1.333177, 0.6380274, 1.415437, 1, 0, 0.5333334, 1,
1.342196, 0.6335721, 2.101293, 1, 0, 0.5294118, 1,
1.344995, -0.7472727, 3.138485, 1, 0, 0.5215687, 1,
1.346621, -0.03456222, 1.340764, 1, 0, 0.5176471, 1,
1.35705, 0.6568432, 2.630105, 1, 0, 0.509804, 1,
1.360081, -0.3035331, 1.965289, 1, 0, 0.5058824, 1,
1.377368, 0.7316971, -0.5535616, 1, 0, 0.4980392, 1,
1.382535, -0.7619837, 2.928948, 1, 0, 0.4901961, 1,
1.389064, -2.875788, 4.163469, 1, 0, 0.4862745, 1,
1.40386, 0.1105293, 2.092791, 1, 0, 0.4784314, 1,
1.40577, 0.7613229, 1.969263, 1, 0, 0.4745098, 1,
1.407316, -1.292581, 0.6983178, 1, 0, 0.4666667, 1,
1.414253, 0.6151181, 0.3440602, 1, 0, 0.4627451, 1,
1.422282, -0.1837872, 1.381565, 1, 0, 0.454902, 1,
1.422633, -1.488732, 2.359855, 1, 0, 0.4509804, 1,
1.431346, -0.9768035, 2.213517, 1, 0, 0.4431373, 1,
1.473377, -0.5652431, 3.190918, 1, 0, 0.4392157, 1,
1.475241, 0.9406893, 0.4734838, 1, 0, 0.4313726, 1,
1.479317, -1.292922, 1.67877, 1, 0, 0.427451, 1,
1.490807, -0.3679948, 1.819999, 1, 0, 0.4196078, 1,
1.492122, 1.661105, 0.04511934, 1, 0, 0.4156863, 1,
1.50702, -1.535786, 3.099881, 1, 0, 0.4078431, 1,
1.509697, -0.2701342, 0.6550008, 1, 0, 0.4039216, 1,
1.513792, -0.02446107, 1.893095, 1, 0, 0.3960784, 1,
1.518911, -0.7918382, 1.829692, 1, 0, 0.3882353, 1,
1.527375, 0.8888425, -0.7487798, 1, 0, 0.3843137, 1,
1.53612, 0.6081482, 1.445738, 1, 0, 0.3764706, 1,
1.536469, 0.5542845, 1.815093, 1, 0, 0.372549, 1,
1.550368, 0.7154346, -1.243772, 1, 0, 0.3647059, 1,
1.554044, -0.2512091, 3.065129, 1, 0, 0.3607843, 1,
1.55697, 0.1736685, 2.678687, 1, 0, 0.3529412, 1,
1.558653, 0.8049572, 0.05946857, 1, 0, 0.3490196, 1,
1.566244, -0.7889219, 1.194608, 1, 0, 0.3411765, 1,
1.576372, -0.2680789, 0.981519, 1, 0, 0.3372549, 1,
1.577805, -0.9414188, 1.639985, 1, 0, 0.3294118, 1,
1.578928, -0.6394762, 2.577, 1, 0, 0.3254902, 1,
1.591014, -1.847681, 2.905832, 1, 0, 0.3176471, 1,
1.611565, -0.3104809, 1.357222, 1, 0, 0.3137255, 1,
1.615176, 0.869477, 1.0204, 1, 0, 0.3058824, 1,
1.620869, -2.097389, 2.266642, 1, 0, 0.2980392, 1,
1.632544, -2.383596, 2.610287, 1, 0, 0.2941177, 1,
1.641264, -1.256032, 1.342193, 1, 0, 0.2862745, 1,
1.645089, -2.693416, 3.48181, 1, 0, 0.282353, 1,
1.654087, -0.1967885, 2.150427, 1, 0, 0.2745098, 1,
1.662054, -1.366923, 2.131134, 1, 0, 0.2705882, 1,
1.669727, 0.3982513, 1.552545, 1, 0, 0.2627451, 1,
1.671451, 1.314746, 1.067522, 1, 0, 0.2588235, 1,
1.672548, 1.216398, 0.2068124, 1, 0, 0.2509804, 1,
1.673453, 0.5734585, 2.653871, 1, 0, 0.2470588, 1,
1.676365, 0.8450842, 1.604196, 1, 0, 0.2392157, 1,
1.683385, 0.6075376, 3.416637, 1, 0, 0.2352941, 1,
1.686231, -0.3114596, 1.088396, 1, 0, 0.227451, 1,
1.707909, -1.592186, 2.473813, 1, 0, 0.2235294, 1,
1.76506, -1.564714, 1.414088, 1, 0, 0.2156863, 1,
1.767731, -0.1334332, 2.098709, 1, 0, 0.2117647, 1,
1.783161, 2.138214, -0.3332151, 1, 0, 0.2039216, 1,
1.78904, 2.488565, -0.5214337, 1, 0, 0.1960784, 1,
1.796098, 1.347797, -0.2538245, 1, 0, 0.1921569, 1,
1.815023, -0.4397494, 3.326566, 1, 0, 0.1843137, 1,
1.821658, -0.945914, 1.775183, 1, 0, 0.1803922, 1,
1.836683, 0.9217731, 0.1521085, 1, 0, 0.172549, 1,
1.855483, 2.43723, 0.6624205, 1, 0, 0.1686275, 1,
1.916419, -1.581552, 2.083306, 1, 0, 0.1607843, 1,
1.91774, 0.8190772, 1.980333, 1, 0, 0.1568628, 1,
1.926725, -0.02884437, 2.378867, 1, 0, 0.1490196, 1,
1.939433, 0.2031989, 0.6964076, 1, 0, 0.145098, 1,
1.966276, 2.652383, 1.066811, 1, 0, 0.1372549, 1,
1.984743, -0.1407108, 2.818402, 1, 0, 0.1333333, 1,
1.990002, 0.7627347, 0.7111108, 1, 0, 0.1254902, 1,
2.001422, 0.5208929, 4.158026, 1, 0, 0.1215686, 1,
2.025591, -2.003227, 2.981075, 1, 0, 0.1137255, 1,
2.030689, 1.14326, 1.246745, 1, 0, 0.1098039, 1,
2.05308, -0.03962092, 3.072127, 1, 0, 0.1019608, 1,
2.106417, -0.03569576, 1.810897, 1, 0, 0.09411765, 1,
2.16646, 0.7524753, -0.1473982, 1, 0, 0.09019608, 1,
2.264037, -1.107289, 3.056024, 1, 0, 0.08235294, 1,
2.337224, -0.4923392, -0.5595034, 1, 0, 0.07843138, 1,
2.40666, 0.8278682, 0.1523395, 1, 0, 0.07058824, 1,
2.414945, -1.893974, 2.934655, 1, 0, 0.06666667, 1,
2.422521, 0.0153825, 3.058852, 1, 0, 0.05882353, 1,
2.43909, -1.350713, 2.104102, 1, 0, 0.05490196, 1,
2.452475, 1.473567, 1.7422, 1, 0, 0.04705882, 1,
2.461804, -1.415377, 4.114786, 1, 0, 0.04313726, 1,
2.492429, 0.1979302, 2.512165, 1, 0, 0.03529412, 1,
2.673523, -1.042982, 4.088168, 1, 0, 0.03137255, 1,
2.854398, -0.02991584, -1.021093, 1, 0, 0.02352941, 1,
2.8778, 0.1455778, 1.086528, 1, 0, 0.01960784, 1,
2.885041, -0.2829558, 3.760181, 1, 0, 0.01176471, 1,
2.908483, -1.402609, 1.797242, 1, 0, 0.007843138, 1
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
-0.0544883, -4.608818, -8.011145, 0, -0.5, 0.5, 0.5,
-0.0544883, -4.608818, -8.011145, 1, -0.5, 0.5, 0.5,
-0.0544883, -4.608818, -8.011145, 1, 1.5, 0.5, 0.5,
-0.0544883, -4.608818, -8.011145, 0, 1.5, 0.5, 0.5
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
-4.021906, -0.05669343, -8.011145, 0, -0.5, 0.5, 0.5,
-4.021906, -0.05669343, -8.011145, 1, -0.5, 0.5, 0.5,
-4.021906, -0.05669343, -8.011145, 1, 1.5, 0.5, 0.5,
-4.021906, -0.05669343, -8.011145, 0, 1.5, 0.5, 0.5
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
-4.021906, -4.608818, -0.4332762, 0, -0.5, 0.5, 0.5,
-4.021906, -4.608818, -0.4332762, 1, -0.5, 0.5, 0.5,
-4.021906, -4.608818, -0.4332762, 1, 1.5, 0.5, 0.5,
-4.021906, -4.608818, -0.4332762, 0, 1.5, 0.5, 0.5
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
-3, -3.558328, -6.262405,
2, -3.558328, -6.262405,
-3, -3.558328, -6.262405,
-3, -3.733409, -6.553862,
-2, -3.558328, -6.262405,
-2, -3.733409, -6.553862,
-1, -3.558328, -6.262405,
-1, -3.733409, -6.553862,
0, -3.558328, -6.262405,
0, -3.733409, -6.553862,
1, -3.558328, -6.262405,
1, -3.733409, -6.553862,
2, -3.558328, -6.262405,
2, -3.733409, -6.553862
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
-3, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
-3, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
-3, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
-3, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5,
-2, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
-2, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
-2, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
-2, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5,
-1, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
-1, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
-1, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
-1, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5,
0, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
0, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
0, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
0, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5,
1, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
1, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
1, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
1, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5,
2, -4.083573, -7.136775, 0, -0.5, 0.5, 0.5,
2, -4.083573, -7.136775, 1, -0.5, 0.5, 0.5,
2, -4.083573, -7.136775, 1, 1.5, 0.5, 0.5,
2, -4.083573, -7.136775, 0, 1.5, 0.5, 0.5
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
-3.106349, -3, -6.262405,
-3.106349, 3, -6.262405,
-3.106349, -3, -6.262405,
-3.258942, -3, -6.553862,
-3.106349, -2, -6.262405,
-3.258942, -2, -6.553862,
-3.106349, -1, -6.262405,
-3.258942, -1, -6.553862,
-3.106349, 0, -6.262405,
-3.258942, 0, -6.553862,
-3.106349, 1, -6.262405,
-3.258942, 1, -6.553862,
-3.106349, 2, -6.262405,
-3.258942, 2, -6.553862,
-3.106349, 3, -6.262405,
-3.258942, 3, -6.553862
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
-3.564127, -3, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, -3, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, -3, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, -3, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, -2, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, -2, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, -2, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, -2, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, -1, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, -1, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, -1, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, -1, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, 0, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, 0, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, 0, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, 0, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, 1, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, 1, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, 1, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, 1, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, 2, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, 2, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, 2, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, 2, -7.136775, 0, 1.5, 0.5, 0.5,
-3.564127, 3, -7.136775, 0, -0.5, 0.5, 0.5,
-3.564127, 3, -7.136775, 1, -0.5, 0.5, 0.5,
-3.564127, 3, -7.136775, 1, 1.5, 0.5, 0.5,
-3.564127, 3, -7.136775, 0, 1.5, 0.5, 0.5
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
-3.106349, -3.558328, -6,
-3.106349, -3.558328, 4,
-3.106349, -3.558328, -6,
-3.258942, -3.733409, -6,
-3.106349, -3.558328, -4,
-3.258942, -3.733409, -4,
-3.106349, -3.558328, -2,
-3.258942, -3.733409, -2,
-3.106349, -3.558328, 0,
-3.258942, -3.733409, 0,
-3.106349, -3.558328, 2,
-3.258942, -3.733409, 2,
-3.106349, -3.558328, 4,
-3.258942, -3.733409, 4
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
-3.564127, -4.083573, -6, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -6, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -6, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, -6, 0, 1.5, 0.5, 0.5,
-3.564127, -4.083573, -4, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -4, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -4, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, -4, 0, 1.5, 0.5, 0.5,
-3.564127, -4.083573, -2, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -2, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, -2, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, -2, 0, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 0, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 0, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 0, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 0, 0, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 2, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 2, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 2, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 2, 0, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 4, 0, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 4, 1, -0.5, 0.5, 0.5,
-3.564127, -4.083573, 4, 1, 1.5, 0.5, 0.5,
-3.564127, -4.083573, 4, 0, 1.5, 0.5, 0.5
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
-3.106349, -3.558328, -6.262405,
-3.106349, 3.444941, -6.262405,
-3.106349, -3.558328, 5.395853,
-3.106349, 3.444941, 5.395853,
-3.106349, -3.558328, -6.262405,
-3.106349, -3.558328, 5.395853,
-3.106349, 3.444941, -6.262405,
-3.106349, 3.444941, 5.395853,
-3.106349, -3.558328, -6.262405,
2.997372, -3.558328, -6.262405,
-3.106349, -3.558328, 5.395853,
2.997372, -3.558328, 5.395853,
-3.106349, 3.444941, -6.262405,
2.997372, 3.444941, -6.262405,
-3.106349, 3.444941, 5.395853,
2.997372, 3.444941, 5.395853,
2.997372, -3.558328, -6.262405,
2.997372, 3.444941, -6.262405,
2.997372, -3.558328, 5.395853,
2.997372, 3.444941, 5.395853,
2.997372, -3.558328, -6.262405,
2.997372, -3.558328, 5.395853,
2.997372, 3.444941, -6.262405,
2.997372, 3.444941, 5.395853
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
var radius = 7.960004;
var distance = 35.41496;
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
mvMatrix.translate( 0.0544883, 0.05669343, 0.4332762 );
mvMatrix.scale( 1.410044, 1.228928, 0.7382331 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41496);
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
Chlorothalonil<-read.table("Chlorothalonil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorothalonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorothalonil' not found
```

```r
y<-Chlorothalonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorothalonil' not found
```

```r
z<-Chlorothalonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorothalonil' not found
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
-3.017459, -0.4490249, -1.899222, 0, 0, 1, 1, 1,
-2.888969, -0.402097, -2.945573, 1, 0, 0, 1, 1,
-2.598169, 0.6587347, -1.911882, 1, 0, 0, 1, 1,
-2.588191, -0.1491331, -2.692926, 1, 0, 0, 1, 1,
-2.504915, -0.7876945, -1.321263, 1, 0, 0, 1, 1,
-2.464777, -1.931152, -1.328828, 1, 0, 0, 1, 1,
-2.446012, -1.688616, -1.138026, 0, 0, 0, 1, 1,
-2.415755, 0.903235, -2.742936, 0, 0, 0, 1, 1,
-2.377135, 0.006458381, -0.8919579, 0, 0, 0, 1, 1,
-2.342951, 0.1835077, -2.521235, 0, 0, 0, 1, 1,
-2.33739, 0.7172257, -0.108269, 0, 0, 0, 1, 1,
-2.313412, 0.487351, 0.5402289, 0, 0, 0, 1, 1,
-2.310923, 2.258425, 0.8650507, 0, 0, 0, 1, 1,
-2.248198, -0.6546912, -0.6259847, 1, 1, 1, 1, 1,
-2.224016, -0.9721182, -1.472679, 1, 1, 1, 1, 1,
-2.16323, 1.300689, 0.4699776, 1, 1, 1, 1, 1,
-2.140692, -0.3700269, -2.43005, 1, 1, 1, 1, 1,
-2.12985, -2.007745, -1.068541, 1, 1, 1, 1, 1,
-2.117674, -0.5813127, -0.3447502, 1, 1, 1, 1, 1,
-2.001785, -0.301488, -2.764278, 1, 1, 1, 1, 1,
-2.000872, -2.0813, -3.896015, 1, 1, 1, 1, 1,
-1.977396, 0.8714207, -0.6783867, 1, 1, 1, 1, 1,
-1.960312, 0.2601849, -1.863976, 1, 1, 1, 1, 1,
-1.925349, 1.231824, -2.272757, 1, 1, 1, 1, 1,
-1.90049, -0.06001665, 0.2327681, 1, 1, 1, 1, 1,
-1.881564, 1.074496, -0.5083062, 1, 1, 1, 1, 1,
-1.873765, 1.123755, -0.1784604, 1, 1, 1, 1, 1,
-1.854451, -0.6601523, -3.204552, 1, 1, 1, 1, 1,
-1.851729, 0.4596464, -1.733112, 0, 0, 1, 1, 1,
-1.828449, 0.7351791, -2.468738, 1, 0, 0, 1, 1,
-1.809675, 0.2744017, -1.307532, 1, 0, 0, 1, 1,
-1.786632, 0.3076651, -0.5825832, 1, 0, 0, 1, 1,
-1.745458, -0.5219651, -2.03546, 1, 0, 0, 1, 1,
-1.745293, 1.69022, -0.8648681, 1, 0, 0, 1, 1,
-1.707171, 0.8579071, -2.542741, 0, 0, 0, 1, 1,
-1.701999, 0.3945695, -1.902218, 0, 0, 0, 1, 1,
-1.691892, 0.2128008, -0.6866837, 0, 0, 0, 1, 1,
-1.671877, -1.509967, -3.892883, 0, 0, 0, 1, 1,
-1.667224, -0.6454935, -2.011808, 0, 0, 0, 1, 1,
-1.664392, -0.450013, 1.021649, 0, 0, 0, 1, 1,
-1.660615, 0.3453452, -1.835924, 0, 0, 0, 1, 1,
-1.660308, -1.055921, -0.343841, 1, 1, 1, 1, 1,
-1.653678, 1.316651, -0.5294168, 1, 1, 1, 1, 1,
-1.631149, -1.298767, -2.586653, 1, 1, 1, 1, 1,
-1.609028, 0.121221, -1.744882, 1, 1, 1, 1, 1,
-1.603757, 0.5740292, -0.9123825, 1, 1, 1, 1, 1,
-1.601702, -0.3969121, -1.228927, 1, 1, 1, 1, 1,
-1.60054, 1.097021, -0.9929922, 1, 1, 1, 1, 1,
-1.592833, 0.6201869, -0.2807308, 1, 1, 1, 1, 1,
-1.577937, 1.507114, -1.748327, 1, 1, 1, 1, 1,
-1.573171, -1.788898, -1.185791, 1, 1, 1, 1, 1,
-1.55409, 0.09161326, -0.8388016, 1, 1, 1, 1, 1,
-1.548197, -1.644431, -2.892755, 1, 1, 1, 1, 1,
-1.547753, -1.477716, -1.149511, 1, 1, 1, 1, 1,
-1.536064, 0.3996133, -3.104372, 1, 1, 1, 1, 1,
-1.531644, 0.5033168, -0.6935102, 1, 1, 1, 1, 1,
-1.516203, -0.8797514, -2.176544, 0, 0, 1, 1, 1,
-1.507419, 0.6590592, -0.6495044, 1, 0, 0, 1, 1,
-1.505127, -0.4680981, -1.271382, 1, 0, 0, 1, 1,
-1.463835, 0.1155451, -0.8120155, 1, 0, 0, 1, 1,
-1.457813, -0.5877087, -3.53317, 1, 0, 0, 1, 1,
-1.452412, 0.08974194, -2.322346, 1, 0, 0, 1, 1,
-1.445987, -0.01186989, -1.668114, 0, 0, 0, 1, 1,
-1.428866, -0.8104802, 0.09307128, 0, 0, 0, 1, 1,
-1.423981, -1.014754, -4.232929, 0, 0, 0, 1, 1,
-1.415537, 2.10011, -3.167216, 0, 0, 0, 1, 1,
-1.412666, 1.976338, -1.748113, 0, 0, 0, 1, 1,
-1.386176, 0.2063758, -0.6490703, 0, 0, 0, 1, 1,
-1.373488, 0.532944, -1.598486, 0, 0, 0, 1, 1,
-1.370907, -0.644665, -0.1564279, 1, 1, 1, 1, 1,
-1.363757, -0.4105391, -0.8764834, 1, 1, 1, 1, 1,
-1.36025, -0.4668156, -2.533424, 1, 1, 1, 1, 1,
-1.359899, -0.3390976, -2.813566, 1, 1, 1, 1, 1,
-1.359221, -0.02509286, -0.2303951, 1, 1, 1, 1, 1,
-1.341336, 1.122873, -0.6473064, 1, 1, 1, 1, 1,
-1.312611, -0.9307807, -2.470417, 1, 1, 1, 1, 1,
-1.310905, -0.3951777, -2.111938, 1, 1, 1, 1, 1,
-1.303964, 0.639392, 0.3317771, 1, 1, 1, 1, 1,
-1.30131, 0.2170501, -2.355649, 1, 1, 1, 1, 1,
-1.299914, -3.292461, -1.727536, 1, 1, 1, 1, 1,
-1.298335, 0.7286457, -0.3738907, 1, 1, 1, 1, 1,
-1.291607, 0.04083043, -0.9517119, 1, 1, 1, 1, 1,
-1.290353, 0.08911323, -3.603345, 1, 1, 1, 1, 1,
-1.289334, 0.3360575, -0.5478036, 1, 1, 1, 1, 1,
-1.287533, -0.5851843, -1.960559, 0, 0, 1, 1, 1,
-1.278557, -0.5542118, -2.705227, 1, 0, 0, 1, 1,
-1.274302, 1.860367, 0.4039861, 1, 0, 0, 1, 1,
-1.269703, 2.170071, -0.9678336, 1, 0, 0, 1, 1,
-1.268293, -0.3363534, -1.63848, 1, 0, 0, 1, 1,
-1.260185, 0.3230489, -1.93877, 1, 0, 0, 1, 1,
-1.252701, 0.001444181, -2.540447, 0, 0, 0, 1, 1,
-1.252305, 1.462817, -0.5522825, 0, 0, 0, 1, 1,
-1.249737, -0.6098663, -2.858342, 0, 0, 0, 1, 1,
-1.248839, 3.280934, -0.5577525, 0, 0, 0, 1, 1,
-1.246371, 0.1988965, -0.4631334, 0, 0, 0, 1, 1,
-1.245313, 1.071982, 0.3061568, 0, 0, 0, 1, 1,
-1.242652, 0.19195, 0.7306673, 0, 0, 0, 1, 1,
-1.223573, 0.7421523, -2.341506, 1, 1, 1, 1, 1,
-1.216085, 0.03891121, 0.8904299, 1, 1, 1, 1, 1,
-1.215749, 1.625611, -0.09896341, 1, 1, 1, 1, 1,
-1.20595, 0.9553103, -0.6236808, 1, 1, 1, 1, 1,
-1.201309, 0.7068028, -0.3220367, 1, 1, 1, 1, 1,
-1.198488, 1.47389, -1.375316, 1, 1, 1, 1, 1,
-1.198333, -0.3718064, -1.371622, 1, 1, 1, 1, 1,
-1.197679, 0.5532742, -1.135232, 1, 1, 1, 1, 1,
-1.194731, 0.3449607, 0.09669643, 1, 1, 1, 1, 1,
-1.194372, 0.4941248, 0.427188, 1, 1, 1, 1, 1,
-1.193939, 1.551774, 0.1468255, 1, 1, 1, 1, 1,
-1.19387, -1.210029, 0.1053111, 1, 1, 1, 1, 1,
-1.193134, -2.305837, -2.260583, 1, 1, 1, 1, 1,
-1.175394, 0.09346532, -1.462801, 1, 1, 1, 1, 1,
-1.168594, 0.8447641, -1.066351, 1, 1, 1, 1, 1,
-1.166477, -0.8123941, -2.861202, 0, 0, 1, 1, 1,
-1.16466, 0.453143, -1.256719, 1, 0, 0, 1, 1,
-1.158815, 0.1505427, -1.47146, 1, 0, 0, 1, 1,
-1.1524, 0.7387732, 0.455936, 1, 0, 0, 1, 1,
-1.131716, -0.1485735, -0.8976144, 1, 0, 0, 1, 1,
-1.131016, 1.352468, -2.040193, 1, 0, 0, 1, 1,
-1.101252, 0.2009547, -2.7282, 0, 0, 0, 1, 1,
-1.096442, -0.1917999, -3.044113, 0, 0, 0, 1, 1,
-1.095543, -0.3336169, -2.646972, 0, 0, 0, 1, 1,
-1.0883, 0.7177945, -0.3369975, 0, 0, 0, 1, 1,
-1.087834, 0.6787092, -0.710421, 0, 0, 0, 1, 1,
-1.086383, -1.848982, -3.580151, 0, 0, 0, 1, 1,
-1.085627, 0.6438441, -0.2540366, 0, 0, 0, 1, 1,
-1.078872, -0.2878625, -2.402126, 1, 1, 1, 1, 1,
-1.064311, -1.466243, -3.132722, 1, 1, 1, 1, 1,
-1.057473, 1.065267, -0.1504292, 1, 1, 1, 1, 1,
-1.043798, 0.288159, -1.505309, 1, 1, 1, 1, 1,
-1.040281, -0.3727075, -0.3328571, 1, 1, 1, 1, 1,
-1.036343, -0.2962066, -1.800027, 1, 1, 1, 1, 1,
-1.03152, 0.07037307, 0.32865, 1, 1, 1, 1, 1,
-1.030525, 0.2942843, -2.394135, 1, 1, 1, 1, 1,
-1.022911, 0.007085587, -1.239543, 1, 1, 1, 1, 1,
-1.020395, 0.9223258, -0.765928, 1, 1, 1, 1, 1,
-1.019434, -0.6701314, -3.859049, 1, 1, 1, 1, 1,
-1.016979, -0.7630175, -2.520808, 1, 1, 1, 1, 1,
-1.001493, 0.7052139, -0.5397772, 1, 1, 1, 1, 1,
-0.9998796, 1.299887, -1.361476, 1, 1, 1, 1, 1,
-0.993807, 0.3572232, -3.589948, 1, 1, 1, 1, 1,
-0.9895647, 0.8243237, 0.2057749, 0, 0, 1, 1, 1,
-0.9824227, -0.7354414, -0.8530124, 1, 0, 0, 1, 1,
-0.972011, -0.7624223, -3.315418, 1, 0, 0, 1, 1,
-0.9685407, -0.09235697, -1.03268, 1, 0, 0, 1, 1,
-0.9638318, -0.7658459, -1.136409, 1, 0, 0, 1, 1,
-0.9584944, 0.04832628, 0.5694441, 1, 0, 0, 1, 1,
-0.9492224, -0.4898465, -1.029091, 0, 0, 0, 1, 1,
-0.9489222, 1.618831, -0.3430392, 0, 0, 0, 1, 1,
-0.9423461, 0.07475163, -0.1050353, 0, 0, 0, 1, 1,
-0.9390638, -0.09954094, -1.687619, 0, 0, 0, 1, 1,
-0.9321864, -0.9394363, -2.934492, 0, 0, 0, 1, 1,
-0.926551, 1.516612, -1.146419, 0, 0, 0, 1, 1,
-0.9258628, -1.658444, -2.61946, 0, 0, 0, 1, 1,
-0.9248496, 0.621525, -2.860527, 1, 1, 1, 1, 1,
-0.923832, 0.6305974, -1.045833, 1, 1, 1, 1, 1,
-0.9173928, -0.6337766, -2.26758, 1, 1, 1, 1, 1,
-0.9170939, 0.06783335, -1.621537, 1, 1, 1, 1, 1,
-0.9089532, 0.3556086, -3.089933, 1, 1, 1, 1, 1,
-0.9074821, 1.404264, -0.5741478, 1, 1, 1, 1, 1,
-0.9065585, -0.180855, -2.844864, 1, 1, 1, 1, 1,
-0.904097, -0.2133649, -2.628333, 1, 1, 1, 1, 1,
-0.9015222, -0.4543681, -2.589567, 1, 1, 1, 1, 1,
-0.8995661, -0.8949471, -3.920057, 1, 1, 1, 1, 1,
-0.8962514, 0.3221854, -0.5973318, 1, 1, 1, 1, 1,
-0.8940355, -0.849103, 0.01242354, 1, 1, 1, 1, 1,
-0.8915244, -1.179461, -4.086806, 1, 1, 1, 1, 1,
-0.890111, 0.7601439, 0.4017122, 1, 1, 1, 1, 1,
-0.8841217, 1.270704, -1.894396, 1, 1, 1, 1, 1,
-0.8807228, 2.477586, 0.6733556, 0, 0, 1, 1, 1,
-0.8753209, 0.2391701, -0.6014559, 1, 0, 0, 1, 1,
-0.8672122, 0.05537556, -0.9135852, 1, 0, 0, 1, 1,
-0.8670654, 1.688727, 0.2306803, 1, 0, 0, 1, 1,
-0.8591997, -0.2703548, -1.763387, 1, 0, 0, 1, 1,
-0.8551914, 2.7661, 1.252152, 1, 0, 0, 1, 1,
-0.8485531, -0.3305711, -2.995371, 0, 0, 0, 1, 1,
-0.8446079, -2.566518, -2.737545, 0, 0, 0, 1, 1,
-0.8409959, 0.3786388, -2.612874, 0, 0, 0, 1, 1,
-0.8391443, 0.4923242, -0.9864168, 0, 0, 0, 1, 1,
-0.8290649, -0.2416363, -0.3695543, 0, 0, 0, 1, 1,
-0.8256171, 2.411159, 0.3124094, 0, 0, 0, 1, 1,
-0.8232989, -2.021522, -2.335149, 0, 0, 0, 1, 1,
-0.8201278, -1.963969, -2.601565, 1, 1, 1, 1, 1,
-0.8187004, 1.38011, 0.2766909, 1, 1, 1, 1, 1,
-0.8153217, -0.6180447, -1.561173, 1, 1, 1, 1, 1,
-0.8118457, -1.123385, -3.652512, 1, 1, 1, 1, 1,
-0.8099087, -1.144709, -3.465859, 1, 1, 1, 1, 1,
-0.8009176, -2.207375, -3.155306, 1, 1, 1, 1, 1,
-0.8001797, -1.346041, -1.474901, 1, 1, 1, 1, 1,
-0.8000746, -0.7369236, -1.937084, 1, 1, 1, 1, 1,
-0.7934434, 0.4848579, -2.00899, 1, 1, 1, 1, 1,
-0.7852521, -0.2569212, -2.164027, 1, 1, 1, 1, 1,
-0.7807065, -0.1921916, -1.726876, 1, 1, 1, 1, 1,
-0.7795036, -0.1026606, -3.34726, 1, 1, 1, 1, 1,
-0.7789298, 0.9172431, -1.040316, 1, 1, 1, 1, 1,
-0.7771396, -0.2429802, -1.940955, 1, 1, 1, 1, 1,
-0.7767956, -0.2460137, -2.275751, 1, 1, 1, 1, 1,
-0.7705171, 0.5980144, -1.035768, 0, 0, 1, 1, 1,
-0.7673372, 1.186135, -1.887262, 1, 0, 0, 1, 1,
-0.7663155, -1.336388, -2.184394, 1, 0, 0, 1, 1,
-0.7640316, -1.226327, -3.989779, 1, 0, 0, 1, 1,
-0.7637212, 0.08433889, -1.667007, 1, 0, 0, 1, 1,
-0.7624821, -1.015962, -1.852549, 1, 0, 0, 1, 1,
-0.7591522, -0.5191363, -0.8972579, 0, 0, 0, 1, 1,
-0.7552308, 0.6507887, 0.6032359, 0, 0, 0, 1, 1,
-0.7503139, 1.401784, -2.095237, 0, 0, 0, 1, 1,
-0.7459039, -1.962806, -2.735005, 0, 0, 0, 1, 1,
-0.7457287, -1.318944, -2.986817, 0, 0, 0, 1, 1,
-0.74246, -0.4862061, -2.29247, 0, 0, 0, 1, 1,
-0.7320328, -0.4551291, -2.29546, 0, 0, 0, 1, 1,
-0.730612, 0.5567893, -0.7131257, 1, 1, 1, 1, 1,
-0.7293348, 1.319934, 0.1704682, 1, 1, 1, 1, 1,
-0.7149965, 0.1010835, -1.730016, 1, 1, 1, 1, 1,
-0.7147692, -0.6823726, -1.704025, 1, 1, 1, 1, 1,
-0.7146365, -0.7292548, -3.401007, 1, 1, 1, 1, 1,
-0.7135171, 0.2355119, -0.9887536, 1, 1, 1, 1, 1,
-0.712029, 0.5851485, -1.128967, 1, 1, 1, 1, 1,
-0.7102256, 0.786841, -1.737419, 1, 1, 1, 1, 1,
-0.7098718, 0.1236077, -1.875774, 1, 1, 1, 1, 1,
-0.7090206, -0.6590241, -2.989492, 1, 1, 1, 1, 1,
-0.7071532, 0.1049116, 0.5441662, 1, 1, 1, 1, 1,
-0.6961107, -2.526693, -2.19445, 1, 1, 1, 1, 1,
-0.6952985, -0.7099608, -0.5699914, 1, 1, 1, 1, 1,
-0.6949719, -0.8801214, -4.294146, 1, 1, 1, 1, 1,
-0.6913185, 1.163444, -1.931513, 1, 1, 1, 1, 1,
-0.6863521, 0.3605353, -1.032243, 0, 0, 1, 1, 1,
-0.6787894, -0.01014852, -2.146884, 1, 0, 0, 1, 1,
-0.6768835, 1.471469, -2.380924, 1, 0, 0, 1, 1,
-0.6750141, -0.1182946, -3.221416, 1, 0, 0, 1, 1,
-0.6742973, -1.781824, -2.430414, 1, 0, 0, 1, 1,
-0.6738743, 0.13231, -0.9648436, 1, 0, 0, 1, 1,
-0.6732935, 1.025055, -0.03202729, 0, 0, 0, 1, 1,
-0.6698265, 0.3746231, -1.359181, 0, 0, 0, 1, 1,
-0.6685075, -0.07737866, -1.965396, 0, 0, 0, 1, 1,
-0.6596406, -0.682234, -3.633329, 0, 0, 0, 1, 1,
-0.6462343, -0.3321267, -3.125935, 0, 0, 0, 1, 1,
-0.6424183, 0.2118046, -0.5284743, 0, 0, 0, 1, 1,
-0.6416672, -0.3207599, -2.727166, 0, 0, 0, 1, 1,
-0.6368165, 0.7391679, 1.611468, 1, 1, 1, 1, 1,
-0.6350232, -0.7032608, 0.4837464, 1, 1, 1, 1, 1,
-0.6342003, -0.6871217, -4.179299, 1, 1, 1, 1, 1,
-0.633055, -1.030393, -2.951663, 1, 1, 1, 1, 1,
-0.6258568, 0.5129349, -0.9398806, 1, 1, 1, 1, 1,
-0.6258251, 0.8210492, -1.449359, 1, 1, 1, 1, 1,
-0.6234875, 1.666461, 0.2727276, 1, 1, 1, 1, 1,
-0.6228085, -0.736133, -1.994407, 1, 1, 1, 1, 1,
-0.6206781, -1.210587, -4.247745, 1, 1, 1, 1, 1,
-0.619349, 1.187437, 0.4043891, 1, 1, 1, 1, 1,
-0.6151595, -0.04785224, -1.192371, 1, 1, 1, 1, 1,
-0.6137757, -0.501659, -3.00614, 1, 1, 1, 1, 1,
-0.6110089, -0.592, -1.402117, 1, 1, 1, 1, 1,
-0.607127, -0.1769186, -0.1911631, 1, 1, 1, 1, 1,
-0.6031907, -0.5017259, -1.509369, 1, 1, 1, 1, 1,
-0.6025257, 0.6998322, -0.7536935, 0, 0, 1, 1, 1,
-0.6017929, 0.04869856, -1.793988, 1, 0, 0, 1, 1,
-0.5989984, 1.484657, 0.8659443, 1, 0, 0, 1, 1,
-0.5980808, 0.2802026, 0.226168, 1, 0, 0, 1, 1,
-0.5976616, -1.228134, -3.241791, 1, 0, 0, 1, 1,
-0.5935886, 0.09945552, -1.322067, 1, 0, 0, 1, 1,
-0.5919952, 1.894328, -0.1978415, 0, 0, 0, 1, 1,
-0.5907502, 0.7237868, -0.1739071, 0, 0, 0, 1, 1,
-0.5868212, 1.561754, 1.566338, 0, 0, 0, 1, 1,
-0.5844412, -1.135691, -2.960321, 0, 0, 0, 1, 1,
-0.5835489, 1.392768, 0.5188268, 0, 0, 0, 1, 1,
-0.5827822, -1.405036, -1.497981, 0, 0, 0, 1, 1,
-0.5812708, 0.03950167, -1.554598, 0, 0, 0, 1, 1,
-0.5791099, 1.266899, -0.5990694, 1, 1, 1, 1, 1,
-0.5774255, 0.5568749, -0.57147, 1, 1, 1, 1, 1,
-0.5761698, -0.2696292, -3.488624, 1, 1, 1, 1, 1,
-0.5742455, 0.7154179, -1.871475, 1, 1, 1, 1, 1,
-0.5732458, -0.8792257, -2.818999, 1, 1, 1, 1, 1,
-0.5688554, -1.849922, -1.886196, 1, 1, 1, 1, 1,
-0.5683177, 0.9549726, 0.1600051, 1, 1, 1, 1, 1,
-0.5665091, 1.224355, -0.02982931, 1, 1, 1, 1, 1,
-0.5640665, 0.24946, -2.826918, 1, 1, 1, 1, 1,
-0.5589147, -0.05877937, -2.83186, 1, 1, 1, 1, 1,
-0.5566962, -0.6502594, -2.081633, 1, 1, 1, 1, 1,
-0.5551257, 1.955932, 0.2007828, 1, 1, 1, 1, 1,
-0.5527768, -0.70008, -3.315497, 1, 1, 1, 1, 1,
-0.5479462, -0.8007789, -4.066781, 1, 1, 1, 1, 1,
-0.5478218, 0.1408571, -1.087831, 1, 1, 1, 1, 1,
-0.546369, -0.1142201, -1.888028, 0, 0, 1, 1, 1,
-0.5444496, 0.1136275, -2.88174, 1, 0, 0, 1, 1,
-0.5374097, 1.959244, -1.101878, 1, 0, 0, 1, 1,
-0.5358435, 0.627395, -2.913549, 1, 0, 0, 1, 1,
-0.5358173, 1.259183, -1.142758, 1, 0, 0, 1, 1,
-0.5331304, 1.551246, -1.982893, 1, 0, 0, 1, 1,
-0.533121, -1.095825, -0.7706506, 0, 0, 0, 1, 1,
-0.5313394, -0.9830663, -3.015769, 0, 0, 0, 1, 1,
-0.5293629, -1.111474, -2.336069, 0, 0, 0, 1, 1,
-0.5271999, -1.284357, -2.049753, 0, 0, 0, 1, 1,
-0.5265191, 0.8931825, -0.6738006, 0, 0, 0, 1, 1,
-0.5263508, -1.017738, -1.759939, 0, 0, 0, 1, 1,
-0.5159981, -0.1892672, -1.446294, 0, 0, 0, 1, 1,
-0.5158832, 0.9466432, -0.3582138, 1, 1, 1, 1, 1,
-0.5148873, 1.624956, -0.2513307, 1, 1, 1, 1, 1,
-0.5079499, -0.1047481, -3.15657, 1, 1, 1, 1, 1,
-0.5068082, -1.523343, -3.026269, 1, 1, 1, 1, 1,
-0.5025918, 0.3635929, -1.052737, 1, 1, 1, 1, 1,
-0.5011619, -1.229335, -1.827601, 1, 1, 1, 1, 1,
-0.5005419, -1.696511, -3.389769, 1, 1, 1, 1, 1,
-0.4931801, -0.606774, -3.24134, 1, 1, 1, 1, 1,
-0.4906115, -0.9509694, -1.926182, 1, 1, 1, 1, 1,
-0.4821619, -1.150351, -3.085248, 1, 1, 1, 1, 1,
-0.4814361, 0.5269337, -0.9512229, 1, 1, 1, 1, 1,
-0.4797586, -0.6777957, -3.692946, 1, 1, 1, 1, 1,
-0.4784562, -2.305096, -2.579848, 1, 1, 1, 1, 1,
-0.4763127, 1.044698, -1.210329, 1, 1, 1, 1, 1,
-0.4724641, -0.8618999, -2.465218, 1, 1, 1, 1, 1,
-0.4666166, -0.395559, -1.062103, 0, 0, 1, 1, 1,
-0.4600478, -0.02171174, -1.894845, 1, 0, 0, 1, 1,
-0.4558019, 2.669238, -0.2918053, 1, 0, 0, 1, 1,
-0.4494804, -0.0519849, -0.615223, 1, 0, 0, 1, 1,
-0.4480757, 0.4292902, -0.5172349, 1, 0, 0, 1, 1,
-0.4473077, 0.3168084, 0.2607556, 1, 0, 0, 1, 1,
-0.4465574, 0.8034793, 0.01035085, 0, 0, 0, 1, 1,
-0.4408436, -0.8091539, -1.649737, 0, 0, 0, 1, 1,
-0.4398765, 0.3157429, -1.032928, 0, 0, 0, 1, 1,
-0.4396471, -0.3109986, -3.69237, 0, 0, 0, 1, 1,
-0.4325394, 0.4102119, 0.07051474, 0, 0, 0, 1, 1,
-0.4278029, -0.3419349, -1.85746, 0, 0, 0, 1, 1,
-0.4250672, -0.3972106, -3.80393, 0, 0, 0, 1, 1,
-0.4231871, -0.6610845, -3.245443, 1, 1, 1, 1, 1,
-0.4223295, 0.009527887, -1.544237, 1, 1, 1, 1, 1,
-0.421067, -1.059973, -2.132647, 1, 1, 1, 1, 1,
-0.4156032, -1.914544, -3.370724, 1, 1, 1, 1, 1,
-0.4148894, 0.1019113, -2.366831, 1, 1, 1, 1, 1,
-0.4144205, -1.468847, -2.051579, 1, 1, 1, 1, 1,
-0.4140109, -0.1783013, -1.580839, 1, 1, 1, 1, 1,
-0.4108985, -1.162769, -4.258506, 1, 1, 1, 1, 1,
-0.4106797, 0.6588734, -1.045764, 1, 1, 1, 1, 1,
-0.4103087, 0.5953612, -1.553055, 1, 1, 1, 1, 1,
-0.40818, 0.6901999, -1.155739, 1, 1, 1, 1, 1,
-0.4081711, 0.6815738, -1.252045, 1, 1, 1, 1, 1,
-0.4027717, -0.6558588, -3.366644, 1, 1, 1, 1, 1,
-0.392411, 0.02079513, -0.9087115, 1, 1, 1, 1, 1,
-0.3869523, 1.007407, -1.258282, 1, 1, 1, 1, 1,
-0.3857718, 0.3922498, -1.547977, 0, 0, 1, 1, 1,
-0.3831416, -1.12249, -2.398822, 1, 0, 0, 1, 1,
-0.3830257, -0.3527525, -1.742258, 1, 0, 0, 1, 1,
-0.3777206, 0.07892273, -1.393514, 1, 0, 0, 1, 1,
-0.3728685, -1.593988, -4.381612, 1, 0, 0, 1, 1,
-0.3720639, -0.8002191, -3.451736, 1, 0, 0, 1, 1,
-0.3718178, 1.224611, 1.258853, 0, 0, 0, 1, 1,
-0.3708917, -0.5026656, -1.622206, 0, 0, 0, 1, 1,
-0.3697159, -0.3146985, -1.993017, 0, 0, 0, 1, 1,
-0.3684638, -2.317228, -5.21265, 0, 0, 0, 1, 1,
-0.3683026, -1.122803, -3.811382, 0, 0, 0, 1, 1,
-0.3681493, -0.247931, -1.679096, 0, 0, 0, 1, 1,
-0.3681071, 0.9194959, -0.4910511, 0, 0, 0, 1, 1,
-0.3669311, 0.4985403, 0.6507866, 1, 1, 1, 1, 1,
-0.3644421, -0.1333618, -2.161058, 1, 1, 1, 1, 1,
-0.3623558, 0.2843775, -0.5582569, 1, 1, 1, 1, 1,
-0.3592899, -0.7920542, -4.998128, 1, 1, 1, 1, 1,
-0.3586923, 0.6511348, -0.7032373, 1, 1, 1, 1, 1,
-0.3559624, -0.1848438, -1.647343, 1, 1, 1, 1, 1,
-0.3520458, -0.1598987, -2.00263, 1, 1, 1, 1, 1,
-0.3479508, 1.134081, -2.176764, 1, 1, 1, 1, 1,
-0.3478391, -2.381716, -2.633018, 1, 1, 1, 1, 1,
-0.3453001, 0.6261955, -0.8495916, 1, 1, 1, 1, 1,
-0.3444875, 0.1356038, -0.7299378, 1, 1, 1, 1, 1,
-0.3398683, -1.759428, -2.821672, 1, 1, 1, 1, 1,
-0.3348513, -2.904058, -1.388591, 1, 1, 1, 1, 1,
-0.3257163, 0.1150404, -0.3907888, 1, 1, 1, 1, 1,
-0.3250695, 1.116145, -0.6936747, 1, 1, 1, 1, 1,
-0.323205, 0.2443991, -0.5016044, 0, 0, 1, 1, 1,
-0.322047, -1.498727, -3.040294, 1, 0, 0, 1, 1,
-0.3199244, -0.5767092, -4.912271, 1, 0, 0, 1, 1,
-0.3196983, -0.3350672, -2.296614, 1, 0, 0, 1, 1,
-0.3170107, 0.2224894, -1.160202, 1, 0, 0, 1, 1,
-0.3158077, 0.8813851, -0.9861553, 1, 0, 0, 1, 1,
-0.3132522, 1.16697, 0.3188004, 0, 0, 0, 1, 1,
-0.3107602, -1.112482, -3.117261, 0, 0, 0, 1, 1,
-0.3091934, -0.783054, -4.247135, 0, 0, 0, 1, 1,
-0.3072097, -0.5447131, -3.588481, 0, 0, 0, 1, 1,
-0.3067762, -0.6980384, -2.920137, 0, 0, 0, 1, 1,
-0.3038175, -0.08931668, -2.160457, 0, 0, 0, 1, 1,
-0.3025412, 0.5582246, -0.1463696, 0, 0, 0, 1, 1,
-0.3023271, 0.7091002, -0.9685983, 1, 1, 1, 1, 1,
-0.2964635, 2.179001, -1.075891, 1, 1, 1, 1, 1,
-0.2954574, 1.493447, -1.520583, 1, 1, 1, 1, 1,
-0.2953483, 1.235038, -1.377135, 1, 1, 1, 1, 1,
-0.2943844, -0.4959963, -2.890225, 1, 1, 1, 1, 1,
-0.2938992, -0.02200415, -1.144176, 1, 1, 1, 1, 1,
-0.2936988, -0.522512, -2.886262, 1, 1, 1, 1, 1,
-0.288895, 1.079786, -0.802911, 1, 1, 1, 1, 1,
-0.2821167, -0.6595287, -2.788845, 1, 1, 1, 1, 1,
-0.2815358, -0.3775942, -2.20337, 1, 1, 1, 1, 1,
-0.2805259, 0.2198146, -0.1872841, 1, 1, 1, 1, 1,
-0.2761847, 1.045362, 0.06754246, 1, 1, 1, 1, 1,
-0.2741975, -1.203663, -2.864588, 1, 1, 1, 1, 1,
-0.2696343, -0.7193468, -3.613656, 1, 1, 1, 1, 1,
-0.2604216, -0.5996178, -3.968759, 1, 1, 1, 1, 1,
-0.2592658, 2.24375, -0.51182, 0, 0, 1, 1, 1,
-0.2589193, -0.5318466, -1.203332, 1, 0, 0, 1, 1,
-0.2557672, -0.4474969, -0.1013478, 1, 0, 0, 1, 1,
-0.2556869, -0.9808165, -4.826857, 1, 0, 0, 1, 1,
-0.2542838, -1.310249, -1.866407, 1, 0, 0, 1, 1,
-0.2528647, 0.7853417, -0.6486047, 1, 0, 0, 1, 1,
-0.2522745, 0.09782735, -0.8484475, 0, 0, 0, 1, 1,
-0.2506973, -0.003708441, -2.177242, 0, 0, 0, 1, 1,
-0.2489775, 1.477661, -0.9265519, 0, 0, 0, 1, 1,
-0.2486364, -1.048928, -4.423654, 0, 0, 0, 1, 1,
-0.2470717, -0.264024, -1.891327, 0, 0, 0, 1, 1,
-0.2444867, 1.036954, 0.7483968, 0, 0, 0, 1, 1,
-0.2336723, -1.041276, -2.844592, 0, 0, 0, 1, 1,
-0.2335171, 0.1212558, -1.798574, 1, 1, 1, 1, 1,
-0.2301801, 0.2844807, -0.6029019, 1, 1, 1, 1, 1,
-0.2298415, 0.4680598, 1.070547, 1, 1, 1, 1, 1,
-0.2286206, -0.5134596, -2.339103, 1, 1, 1, 1, 1,
-0.2279633, 2.61795, -1.022265, 1, 1, 1, 1, 1,
-0.2187873, 1.126098, -1.771239, 1, 1, 1, 1, 1,
-0.2174964, -1.136929, -4.043645, 1, 1, 1, 1, 1,
-0.2164609, -0.8335306, -3.167798, 1, 1, 1, 1, 1,
-0.21582, 0.3483433, -1.543132, 1, 1, 1, 1, 1,
-0.2156406, 1.067671, 0.2129615, 1, 1, 1, 1, 1,
-0.2145733, -0.2327984, -2.78222, 1, 1, 1, 1, 1,
-0.2142393, -0.08850777, -2.037348, 1, 1, 1, 1, 1,
-0.2084116, -1.485765, -1.813813, 1, 1, 1, 1, 1,
-0.2054742, 0.8163035, 0.1046358, 1, 1, 1, 1, 1,
-0.2048113, 1.312942, -1.840456, 1, 1, 1, 1, 1,
-0.1998628, 0.283472, -0.5900648, 0, 0, 1, 1, 1,
-0.1964335, 0.6183152, -1.42322, 1, 0, 0, 1, 1,
-0.1960967, 0.4147521, -1.374904, 1, 0, 0, 1, 1,
-0.1918631, -0.1440049, -0.510987, 1, 0, 0, 1, 1,
-0.1860271, 0.763282, 1.173272, 1, 0, 0, 1, 1,
-0.1851307, 1.186996, 0.8927891, 1, 0, 0, 1, 1,
-0.1838022, -0.1804312, -1.970465, 0, 0, 0, 1, 1,
-0.1835057, 0.2352546, -0.6064659, 0, 0, 0, 1, 1,
-0.179354, 0.6768983, -1.360802, 0, 0, 0, 1, 1,
-0.1787174, -0.654096, -3.135298, 0, 0, 0, 1, 1,
-0.1749182, -1.062769, -6.092625, 0, 0, 0, 1, 1,
-0.1734293, 1.148351, -1.069425, 0, 0, 0, 1, 1,
-0.1730297, 0.04733301, -0.03758689, 0, 0, 0, 1, 1,
-0.16841, -0.4813688, -2.323975, 1, 1, 1, 1, 1,
-0.166927, 0.7322817, -1.548171, 1, 1, 1, 1, 1,
-0.1664061, -0.1634059, -2.288921, 1, 1, 1, 1, 1,
-0.1638399, -0.02765749, -2.496133, 1, 1, 1, 1, 1,
-0.1635608, 0.9602334, 0.1001362, 1, 1, 1, 1, 1,
-0.1616168, -0.175355, 0.02060353, 1, 1, 1, 1, 1,
-0.1608816, -0.4608319, -2.752614, 1, 1, 1, 1, 1,
-0.1574129, 0.7430609, -0.9642936, 1, 1, 1, 1, 1,
-0.1570892, -2.713834, -3.19998, 1, 1, 1, 1, 1,
-0.155864, 0.07136192, -0.5078321, 1, 1, 1, 1, 1,
-0.1499127, 0.5733889, -1.290469, 1, 1, 1, 1, 1,
-0.1451962, 1.035059, -0.03783458, 1, 1, 1, 1, 1,
-0.1421788, 0.7740839, -1.021343, 1, 1, 1, 1, 1,
-0.1350153, 0.1027693, -1.47885, 1, 1, 1, 1, 1,
-0.1348792, 1.250257, -0.8783664, 1, 1, 1, 1, 1,
-0.1346685, 0.6283777, -1.490392, 0, 0, 1, 1, 1,
-0.1301477, 0.5309191, -0.5916387, 1, 0, 0, 1, 1,
-0.1260556, -0.6864911, -3.650657, 1, 0, 0, 1, 1,
-0.1260408, -0.2708302, -3.049498, 1, 0, 0, 1, 1,
-0.1241637, 0.05920777, -1.744152, 1, 0, 0, 1, 1,
-0.1232311, 2.383482, -0.2165756, 1, 0, 0, 1, 1,
-0.1206733, -0.3306978, -1.936542, 0, 0, 0, 1, 1,
-0.1195468, -0.5847583, -4.242805, 0, 0, 0, 1, 1,
-0.1170434, 1.686362, -0.3232033, 0, 0, 0, 1, 1,
-0.1144713, -0.1018354, -2.158509, 0, 0, 0, 1, 1,
-0.1119523, 1.794347, -0.7589928, 0, 0, 0, 1, 1,
-0.1088278, 0.5050963, -0.6479211, 0, 0, 0, 1, 1,
-0.1051469, -0.02357401, -1.364135, 0, 0, 0, 1, 1,
-0.09886679, -1.124662, -1.717893, 1, 1, 1, 1, 1,
-0.09681651, -1.769188, -4.333953, 1, 1, 1, 1, 1,
-0.09655125, 0.1411106, 0.6532548, 1, 1, 1, 1, 1,
-0.09519245, -0.3320944, -4.008043, 1, 1, 1, 1, 1,
-0.0941162, 0.5197021, -2.572262, 1, 1, 1, 1, 1,
-0.09348025, 0.9760847, -0.6232274, 1, 1, 1, 1, 1,
-0.09174049, 0.3323139, 0.9530613, 1, 1, 1, 1, 1,
-0.08669118, 0.8178387, 0.8485399, 1, 1, 1, 1, 1,
-0.08651412, 0.2499781, -1.428305, 1, 1, 1, 1, 1,
-0.08155784, -0.6326602, -3.00978, 1, 1, 1, 1, 1,
-0.08095933, 0.3146262, 0.6326183, 1, 1, 1, 1, 1,
-0.07663561, 0.2032387, -2.167497, 1, 1, 1, 1, 1,
-0.07065669, 1.475618, -0.8774924, 1, 1, 1, 1, 1,
-0.06971998, 0.02293316, -0.001514694, 1, 1, 1, 1, 1,
-0.06871164, 0.5419419, -0.1815778, 1, 1, 1, 1, 1,
-0.06008651, -0.09474957, -1.889778, 0, 0, 1, 1, 1,
-0.05496679, 0.02192368, -1.586329, 1, 0, 0, 1, 1,
-0.05347458, -1.104249, -3.244634, 1, 0, 0, 1, 1,
-0.05176471, 1.164244, 0.597088, 1, 0, 0, 1, 1,
-0.05117326, 0.6561614, -1.427107, 1, 0, 0, 1, 1,
-0.04733245, -0.4831853, -2.148672, 1, 0, 0, 1, 1,
-0.04663347, -1.935325, -2.790377, 0, 0, 0, 1, 1,
-0.04570462, 0.8409673, 1.678745, 0, 0, 0, 1, 1,
-0.04342876, -0.7590852, -3.180784, 0, 0, 0, 1, 1,
-0.04153575, -0.4238804, -2.691502, 0, 0, 0, 1, 1,
-0.04062954, 2.039769, -0.5979098, 0, 0, 0, 1, 1,
-0.04062333, 0.8127923, 1.967304, 0, 0, 0, 1, 1,
-0.03936519, 0.5329999, -1.650396, 0, 0, 0, 1, 1,
-0.03873793, -0.4068639, -1.934241, 1, 1, 1, 1, 1,
-0.03820591, -0.3352727, -2.87812, 1, 1, 1, 1, 1,
-0.03081681, -0.4584536, -4.621538, 1, 1, 1, 1, 1,
-0.02947739, -0.1746053, -1.870923, 1, 1, 1, 1, 1,
-0.02894891, 0.6445979, -0.1553367, 1, 1, 1, 1, 1,
-0.02102293, -0.1039185, -4.71908, 1, 1, 1, 1, 1,
-0.01745521, -0.4648465, -3.380492, 1, 1, 1, 1, 1,
-0.01624474, 0.8177743, -1.153621, 1, 1, 1, 1, 1,
-0.01410405, 0.1351943, 1.473284, 1, 1, 1, 1, 1,
-0.0125893, -2.057421, -2.054312, 1, 1, 1, 1, 1,
-0.01240838, -3.456338, -4.443949, 1, 1, 1, 1, 1,
-0.01011959, 0.672657, 1.06904, 1, 1, 1, 1, 1,
-0.009155332, 1.027858, -0.9901125, 1, 1, 1, 1, 1,
-0.003695099, -0.3657564, -4.325793, 1, 1, 1, 1, 1,
-0.003334252, -0.6164919, -4.768945, 1, 1, 1, 1, 1,
-0.003169826, -0.3686806, -1.937221, 0, 0, 1, 1, 1,
-0.001138018, -0.3824048, -5.886183, 1, 0, 0, 1, 1,
0.004425981, 1.390363, 1.63053, 1, 0, 0, 1, 1,
0.00469733, -0.2425308, 4.723472, 1, 0, 0, 1, 1,
0.005198532, 0.900138, 1.143841, 1, 0, 0, 1, 1,
0.006425368, 0.8634915, -0.751341, 1, 0, 0, 1, 1,
0.01084176, -1.80431, 2.402204, 0, 0, 0, 1, 1,
0.01132552, 0.5348047, 1.043048, 0, 0, 0, 1, 1,
0.01720068, 1.161315, 1.3414, 0, 0, 0, 1, 1,
0.01752049, -2.228414, 4.322899, 0, 0, 0, 1, 1,
0.01759953, 0.03745874, 1.686822, 0, 0, 0, 1, 1,
0.01798897, -1.720492, 3.41448, 0, 0, 0, 1, 1,
0.01841405, 0.9864494, 0.1019533, 0, 0, 0, 1, 1,
0.01861705, 1.163553, -0.0997981, 1, 1, 1, 1, 1,
0.02002566, -0.8135059, 3.353284, 1, 1, 1, 1, 1,
0.02245785, 0.5963483, 0.3631401, 1, 1, 1, 1, 1,
0.02937909, 0.3277483, -0.462372, 1, 1, 1, 1, 1,
0.03428864, 1.794809, 2.919305, 1, 1, 1, 1, 1,
0.03746499, 1.15304, 0.4966097, 1, 1, 1, 1, 1,
0.03762111, -1.789147, 1.641234, 1, 1, 1, 1, 1,
0.03959683, 0.5398014, -0.5028851, 1, 1, 1, 1, 1,
0.04068226, -0.4619131, 2.664362, 1, 1, 1, 1, 1,
0.042355, 0.1717073, 0.05790583, 1, 1, 1, 1, 1,
0.04542144, 0.5688487, 0.2270908, 1, 1, 1, 1, 1,
0.04567563, 1.025512, 0.1769501, 1, 1, 1, 1, 1,
0.04890216, 0.9494856, -0.2018932, 1, 1, 1, 1, 1,
0.05470057, -1.383803, 2.341793, 1, 1, 1, 1, 1,
0.06630295, 0.01758305, 1.198062, 1, 1, 1, 1, 1,
0.06743925, -0.3216009, 2.655854, 0, 0, 1, 1, 1,
0.07455098, -2.300675, 3.597272, 1, 0, 0, 1, 1,
0.07614671, 1.628148, -0.3863518, 1, 0, 0, 1, 1,
0.07770837, -0.0001426147, 2.323681, 1, 0, 0, 1, 1,
0.07892369, 0.09968801, 1.110523, 1, 0, 0, 1, 1,
0.08002145, 0.01163976, 1.494646, 1, 0, 0, 1, 1,
0.08100335, 2.114943, 0.6208854, 0, 0, 0, 1, 1,
0.08325889, -0.4852515, 3.385394, 0, 0, 0, 1, 1,
0.08609706, 0.3924445, -1.060269, 0, 0, 0, 1, 1,
0.08849033, -1.138883, 2.0872, 0, 0, 0, 1, 1,
0.08868698, 1.752097, -1.06561, 0, 0, 0, 1, 1,
0.08882026, -0.6062073, 5.142779, 0, 0, 0, 1, 1,
0.09061179, -0.6019953, 2.11992, 0, 0, 0, 1, 1,
0.09147777, -0.7984348, 4.667773, 1, 1, 1, 1, 1,
0.09184199, -0.9627467, 0.9861175, 1, 1, 1, 1, 1,
0.09252011, 0.185704, 2.577241, 1, 1, 1, 1, 1,
0.09326874, 0.7378505, 2.574343, 1, 1, 1, 1, 1,
0.1028967, 0.305114, 2.006064, 1, 1, 1, 1, 1,
0.1043188, -1.791731, 4.476543, 1, 1, 1, 1, 1,
0.1090446, 2.03959, 1.282328, 1, 1, 1, 1, 1,
0.1118171, 1.290814, 1.589544, 1, 1, 1, 1, 1,
0.1118398, -0.2730879, 3.390777, 1, 1, 1, 1, 1,
0.1126503, 0.7241279, -0.2942096, 1, 1, 1, 1, 1,
0.1126911, 0.07253937, 0.9187117, 1, 1, 1, 1, 1,
0.113291, 0.6547248, 1.384602, 1, 1, 1, 1, 1,
0.1150922, -0.1639037, 2.398898, 1, 1, 1, 1, 1,
0.1178957, -0.9405308, 2.042686, 1, 1, 1, 1, 1,
0.1186896, 0.1785653, 1.106074, 1, 1, 1, 1, 1,
0.1193066, 0.13515, -0.2615352, 0, 0, 1, 1, 1,
0.1206868, -1.163297, 1.953053, 1, 0, 0, 1, 1,
0.1226339, 1.482552, -0.9840945, 1, 0, 0, 1, 1,
0.1268372, -0.5524286, 3.039749, 1, 0, 0, 1, 1,
0.1272013, 0.8876362, 0.4258109, 1, 0, 0, 1, 1,
0.1281772, -1.788391, 3.016406, 1, 0, 0, 1, 1,
0.1291073, -0.01568582, 0.8844681, 0, 0, 0, 1, 1,
0.1303508, -2.401475, 1.951074, 0, 0, 0, 1, 1,
0.1327765, 1.32751, 1.615176, 0, 0, 0, 1, 1,
0.1334992, 0.5828701, -0.08451789, 0, 0, 0, 1, 1,
0.1336771, 0.672259, 1.112168, 0, 0, 0, 1, 1,
0.133928, -0.1892727, 2.569935, 0, 0, 0, 1, 1,
0.1419663, -1.380914, 3.053088, 0, 0, 0, 1, 1,
0.142533, -0.6908071, 2.674497, 1, 1, 1, 1, 1,
0.1438423, 0.3661978, 1.160578, 1, 1, 1, 1, 1,
0.1451977, -1.017955, 1.882571, 1, 1, 1, 1, 1,
0.1512694, 1.306298, 1.892499, 1, 1, 1, 1, 1,
0.1515139, -0.1974707, 1.661448, 1, 1, 1, 1, 1,
0.1535276, 1.244556, -1.60023, 1, 1, 1, 1, 1,
0.1541989, -0.8121413, 1.405518, 1, 1, 1, 1, 1,
0.1609117, 0.7166758, 0.4301937, 1, 1, 1, 1, 1,
0.1612742, -1.008003, 4.123762, 1, 1, 1, 1, 1,
0.161313, 1.007103, -0.6600618, 1, 1, 1, 1, 1,
0.1661039, 0.2960937, 2.141752, 1, 1, 1, 1, 1,
0.1724471, 0.8229124, 0.5133554, 1, 1, 1, 1, 1,
0.1765085, -0.1496568, 3.2216, 1, 1, 1, 1, 1,
0.181856, 0.646929, 0.5960802, 1, 1, 1, 1, 1,
0.1855078, 1.841396, -0.4018111, 1, 1, 1, 1, 1,
0.1866332, -0.9273058, 2.970905, 0, 0, 1, 1, 1,
0.1920079, 0.0772119, 0.7633826, 1, 0, 0, 1, 1,
0.1959269, -0.889182, 1.47717, 1, 0, 0, 1, 1,
0.1965718, -0.303967, 3.173568, 1, 0, 0, 1, 1,
0.1976549, -0.4163714, 3.591265, 1, 0, 0, 1, 1,
0.201363, 0.8390093, 1.351171, 1, 0, 0, 1, 1,
0.2041693, 0.6444728, -2.482841, 0, 0, 0, 1, 1,
0.2072933, 0.298502, -0.3436088, 0, 0, 0, 1, 1,
0.2079013, 0.4699858, 1.448322, 0, 0, 0, 1, 1,
0.2168491, 0.4408332, 0.4074116, 0, 0, 0, 1, 1,
0.2198469, 0.03172207, 3.217048, 0, 0, 0, 1, 1,
0.2288256, -1.066964, 2.581045, 0, 0, 0, 1, 1,
0.2298325, -0.0378459, 2.029767, 0, 0, 0, 1, 1,
0.2308729, -0.1145435, 2.527799, 1, 1, 1, 1, 1,
0.2318671, 0.07413118, 0.2561208, 1, 1, 1, 1, 1,
0.2341643, 0.4551981, -0.8138844, 1, 1, 1, 1, 1,
0.2390453, 0.723978, -1.371131, 1, 1, 1, 1, 1,
0.2432996, -0.4755687, 1.216634, 1, 1, 1, 1, 1,
0.2442055, -0.4957571, 2.910323, 1, 1, 1, 1, 1,
0.2476431, -0.009536542, 3.411405, 1, 1, 1, 1, 1,
0.248451, -1.297305, 4.07936, 1, 1, 1, 1, 1,
0.2524787, -0.6283692, 3.6738, 1, 1, 1, 1, 1,
0.2577239, -1.053128, 2.716012, 1, 1, 1, 1, 1,
0.2631551, -0.701999, 3.21766, 1, 1, 1, 1, 1,
0.2639766, 0.432572, 0.7778769, 1, 1, 1, 1, 1,
0.2654356, 1.000515, 0.5747755, 1, 1, 1, 1, 1,
0.2681756, -0.1430564, 0.412102, 1, 1, 1, 1, 1,
0.2730744, -0.3064274, 2.29727, 1, 1, 1, 1, 1,
0.2737879, -0.1452338, 2.13795, 0, 0, 1, 1, 1,
0.2744474, 0.3987525, 0.7637413, 1, 0, 0, 1, 1,
0.2747052, 0.9534931, 0.3916337, 1, 0, 0, 1, 1,
0.2779393, -1.147821, 3.010284, 1, 0, 0, 1, 1,
0.2790136, 0.7071401, 0.3900549, 1, 0, 0, 1, 1,
0.2793309, -1.089874, 3.438445, 1, 0, 0, 1, 1,
0.2825958, 0.3180668, 0.5862887, 0, 0, 0, 1, 1,
0.2828586, 1.803823, 1.073569, 0, 0, 0, 1, 1,
0.2840425, 0.7756523, 0.05700348, 0, 0, 0, 1, 1,
0.2904011, 0.3401217, 0.6796912, 0, 0, 0, 1, 1,
0.2920556, 0.790467, -0.4010813, 0, 0, 0, 1, 1,
0.2941154, 0.7278043, -0.05250194, 0, 0, 0, 1, 1,
0.29964, 1.207773, 1.515324, 0, 0, 0, 1, 1,
0.3051361, -1.840336, 2.097213, 1, 1, 1, 1, 1,
0.3116635, -1.036928, 2.787983, 1, 1, 1, 1, 1,
0.3188105, 0.5024031, -0.757172, 1, 1, 1, 1, 1,
0.322691, 0.8834769, 0.532645, 1, 1, 1, 1, 1,
0.3234161, -1.328142, 2.600646, 1, 1, 1, 1, 1,
0.323565, -1.180601, 0.7204128, 1, 1, 1, 1, 1,
0.3274153, 0.7944719, 0.6270504, 1, 1, 1, 1, 1,
0.3412573, -0.4514677, 2.652625, 1, 1, 1, 1, 1,
0.3414958, 0.3583293, -0.5270307, 1, 1, 1, 1, 1,
0.3417398, 0.6966473, 1.247366, 1, 1, 1, 1, 1,
0.3458701, -1.393977, 3.276869, 1, 1, 1, 1, 1,
0.346117, -0.7747293, 1.75943, 1, 1, 1, 1, 1,
0.3499338, 3.342952, -1.170159, 1, 1, 1, 1, 1,
0.3512106, 0.2556669, 1.096994, 1, 1, 1, 1, 1,
0.3527341, -0.8978263, 2.475857, 1, 1, 1, 1, 1,
0.3531563, 1.938391, 0.6183831, 0, 0, 1, 1, 1,
0.3547556, 0.8530768, -0.07890246, 1, 0, 0, 1, 1,
0.3583294, -0.4322612, 3.047845, 1, 0, 0, 1, 1,
0.3644765, 0.288509, 0.8010877, 1, 0, 0, 1, 1,
0.3672998, -0.4408732, 1.216786, 1, 0, 0, 1, 1,
0.3692475, 0.08102541, 1.688434, 1, 0, 0, 1, 1,
0.3712245, 0.09124428, 0.5594199, 0, 0, 0, 1, 1,
0.3719905, -1.003801, 2.697078, 0, 0, 0, 1, 1,
0.3726337, 0.5610633, -0.3373734, 0, 0, 0, 1, 1,
0.3729847, 0.2688242, 1.852263, 0, 0, 0, 1, 1,
0.3748462, -0.7973436, 2.364472, 0, 0, 0, 1, 1,
0.3749089, -0.06430401, 2.309593, 0, 0, 0, 1, 1,
0.3750646, 1.318676, 1.304968, 0, 0, 0, 1, 1,
0.3802606, -0.9916824, 2.36456, 1, 1, 1, 1, 1,
0.3807169, 0.7197576, 0.04930576, 1, 1, 1, 1, 1,
0.3837662, 0.6805223, -0.1388334, 1, 1, 1, 1, 1,
0.3851175, -0.3773589, 2.215866, 1, 1, 1, 1, 1,
0.386489, 0.008008479, 1.044327, 1, 1, 1, 1, 1,
0.387896, -1.736835, 3.342517, 1, 1, 1, 1, 1,
0.3940043, -0.1739324, 1.643694, 1, 1, 1, 1, 1,
0.4000532, -0.8848983, 3.484304, 1, 1, 1, 1, 1,
0.4006113, -0.3145782, 1.791236, 1, 1, 1, 1, 1,
0.4035488, 2.347769, 0.01317756, 1, 1, 1, 1, 1,
0.4050629, -0.1288793, 1.085709, 1, 1, 1, 1, 1,
0.4067602, -1.202496, 3.392251, 1, 1, 1, 1, 1,
0.4127257, 1.028091, 1.88783, 1, 1, 1, 1, 1,
0.4134625, -0.7715992, 1.358163, 1, 1, 1, 1, 1,
0.4186489, -0.6725816, 1.490385, 1, 1, 1, 1, 1,
0.4192548, 0.153411, 0.2332641, 0, 0, 1, 1, 1,
0.4215518, 0.5195712, 0.1335809, 1, 0, 0, 1, 1,
0.4281628, 0.6145834, 0.98185, 1, 0, 0, 1, 1,
0.4284202, 0.586171, -0.02184819, 1, 0, 0, 1, 1,
0.4307752, -0.3515427, 1.071261, 1, 0, 0, 1, 1,
0.4380385, 0.001496769, 1.300158, 1, 0, 0, 1, 1,
0.446609, -0.3379278, 2.761205, 0, 0, 0, 1, 1,
0.4475831, -0.4349292, 2.186669, 0, 0, 0, 1, 1,
0.4478456, -2.330404, 2.865906, 0, 0, 0, 1, 1,
0.4496451, -0.9039693, 1.803987, 0, 0, 0, 1, 1,
0.4522592, -0.5369183, 1.731318, 0, 0, 0, 1, 1,
0.4541345, 1.133657, 0.2359567, 0, 0, 0, 1, 1,
0.4578162, 0.1807249, 1.785184, 0, 0, 0, 1, 1,
0.4579125, -0.5575386, 2.547414, 1, 1, 1, 1, 1,
0.4602116, -0.2747841, 1.84315, 1, 1, 1, 1, 1,
0.4639558, -0.7970755, 2.159198, 1, 1, 1, 1, 1,
0.4641183, -1.567467, 3.220163, 1, 1, 1, 1, 1,
0.4647649, 0.8939166, 2.056059, 1, 1, 1, 1, 1,
0.4820119, 0.1615156, 0.7496916, 1, 1, 1, 1, 1,
0.4894599, 0.2676252, 2.054669, 1, 1, 1, 1, 1,
0.4894962, 0.3051994, -0.4047323, 1, 1, 1, 1, 1,
0.4917623, -0.3865926, 3.601399, 1, 1, 1, 1, 1,
0.4960259, 0.9851929, 0.9084842, 1, 1, 1, 1, 1,
0.5000448, -0.2672444, 2.646254, 1, 1, 1, 1, 1,
0.5033328, -1.048962, 2.746528, 1, 1, 1, 1, 1,
0.5064632, 0.6880774, -0.03396775, 1, 1, 1, 1, 1,
0.5070037, -0.1671804, 2.196453, 1, 1, 1, 1, 1,
0.5082702, 1.635813, 1.188979, 1, 1, 1, 1, 1,
0.5089807, 0.4545827, 1.368436, 0, 0, 1, 1, 1,
0.5091435, -1.111695, 1.30037, 1, 0, 0, 1, 1,
0.5149224, 1.592544, -0.2212458, 1, 0, 0, 1, 1,
0.5181568, -0.04402675, -0.08803956, 1, 0, 0, 1, 1,
0.5300332, 0.4901443, 1.671677, 1, 0, 0, 1, 1,
0.5304999, 3.179594, -1.302126, 1, 0, 0, 1, 1,
0.5348328, 0.6097016, 0.919067, 0, 0, 0, 1, 1,
0.5365474, -0.3986408, 3.932052, 0, 0, 0, 1, 1,
0.540937, -0.06020584, 1.748955, 0, 0, 0, 1, 1,
0.5453851, -0.1454231, 1.691003, 0, 0, 0, 1, 1,
0.547603, 1.215139, 0.1132657, 0, 0, 0, 1, 1,
0.5511968, -0.5505278, 1.881933, 0, 0, 0, 1, 1,
0.5521433, -0.1234974, 1.852627, 0, 0, 0, 1, 1,
0.5570992, 0.5379184, 1.525155, 1, 1, 1, 1, 1,
0.5589415, 0.1315367, 2.032344, 1, 1, 1, 1, 1,
0.5595558, -1.285859, 2.82341, 1, 1, 1, 1, 1,
0.5598727, -1.10544, 3.519299, 1, 1, 1, 1, 1,
0.5662829, 0.3928306, 0.7114625, 1, 1, 1, 1, 1,
0.5703244, -0.3644957, 2.371399, 1, 1, 1, 1, 1,
0.5723934, 0.2778124, 2.057714, 1, 1, 1, 1, 1,
0.5744808, 1.088849, -0.6956872, 1, 1, 1, 1, 1,
0.5766549, -0.9703699, 1.254738, 1, 1, 1, 1, 1,
0.5781723, 0.7430037, 0.9194096, 1, 1, 1, 1, 1,
0.5927352, -0.09026505, 2.236244, 1, 1, 1, 1, 1,
0.6009793, -0.3296878, 0.8885146, 1, 1, 1, 1, 1,
0.6023512, -0.05762845, -0.08737466, 1, 1, 1, 1, 1,
0.6044222, 0.2858392, 1.298975, 1, 1, 1, 1, 1,
0.607031, 1.828108, 2.022169, 1, 1, 1, 1, 1,
0.6087419, 0.4007458, 1.061272, 0, 0, 1, 1, 1,
0.6100867, 0.07431005, 1.018825, 1, 0, 0, 1, 1,
0.612168, -0.1141114, 2.700408, 1, 0, 0, 1, 1,
0.6258141, -1.639874, 1.429785, 1, 0, 0, 1, 1,
0.6305914, -0.4066521, 3.052507, 1, 0, 0, 1, 1,
0.6309153, 0.1473684, 1.509398, 1, 0, 0, 1, 1,
0.6311746, -0.2141422, 1.919749, 0, 0, 0, 1, 1,
0.6327469, -0.09128159, 1.589791, 0, 0, 0, 1, 1,
0.6365605, -0.698942, 1.717892, 0, 0, 0, 1, 1,
0.6420976, -0.7699446, 1.958323, 0, 0, 0, 1, 1,
0.6465673, -1.879651, 0.4887156, 0, 0, 0, 1, 1,
0.6491782, 1.077118, 1.125761, 0, 0, 0, 1, 1,
0.6501589, 0.2103473, -0.7281535, 0, 0, 0, 1, 1,
0.6577486, 1.690575, 0.9156874, 1, 1, 1, 1, 1,
0.6601299, 0.3180092, 1.352376, 1, 1, 1, 1, 1,
0.6603064, 1.243862, 1.570453, 1, 1, 1, 1, 1,
0.6691115, 0.52584, -0.2336252, 1, 1, 1, 1, 1,
0.6691684, 1.30302, -1.319691, 1, 1, 1, 1, 1,
0.6738363, -3.221711, 2.823607, 1, 1, 1, 1, 1,
0.6780485, 0.4454892, 0.6610982, 1, 1, 1, 1, 1,
0.6824391, 0.3120584, 0.9628743, 1, 1, 1, 1, 1,
0.6875678, -2.345129, 0.838487, 1, 1, 1, 1, 1,
0.6897163, 0.3173771, 0.7639223, 1, 1, 1, 1, 1,
0.6902554, -1.15666, 2.144986, 1, 1, 1, 1, 1,
0.6908001, -0.6547089, 1.09702, 1, 1, 1, 1, 1,
0.6924183, -0.5463771, 0.6842489, 1, 1, 1, 1, 1,
0.6959937, 0.8819687, 2.159779, 1, 1, 1, 1, 1,
0.700022, -0.1016391, 0.6123021, 1, 1, 1, 1, 1,
0.7009017, -1.228394, 3.965026, 0, 0, 1, 1, 1,
0.7072454, -0.3864464, 1.940986, 1, 0, 0, 1, 1,
0.718583, -0.1298063, 1.72366, 1, 0, 0, 1, 1,
0.721761, 2.100513, 0.8436205, 1, 0, 0, 1, 1,
0.72449, -0.1902575, 3.633935, 1, 0, 0, 1, 1,
0.7245539, 0.07783068, 1.990185, 1, 0, 0, 1, 1,
0.7249187, -1.627339, 3.889178, 0, 0, 0, 1, 1,
0.7313604, -0.4537203, 3.627593, 0, 0, 0, 1, 1,
0.7325809, 1.965921, 0.6794697, 0, 0, 0, 1, 1,
0.7326013, 0.3209224, 1.960363, 0, 0, 0, 1, 1,
0.7327341, 1.19724, 2.328138, 0, 0, 0, 1, 1,
0.738445, 0.5581611, -0.423656, 0, 0, 0, 1, 1,
0.7429299, 0.2662807, 2.599632, 0, 0, 0, 1, 1,
0.7579688, 1.267715, 1.028462, 1, 1, 1, 1, 1,
0.7582669, -0.03383451, 3.537619, 1, 1, 1, 1, 1,
0.758405, 0.2872902, 0.8383158, 1, 1, 1, 1, 1,
0.7611606, -2.032686, 3.734191, 1, 1, 1, 1, 1,
0.7644966, 0.7291379, 0.707357, 1, 1, 1, 1, 1,
0.7665452, -0.4932578, 2.004315, 1, 1, 1, 1, 1,
0.7719499, 0.6632168, 0.3504911, 1, 1, 1, 1, 1,
0.7726916, 0.1321315, 3.381227, 1, 1, 1, 1, 1,
0.7731174, 0.4439499, 0.6538505, 1, 1, 1, 1, 1,
0.7770226, -0.7047626, 1.982096, 1, 1, 1, 1, 1,
0.7791039, 1.090929, 0.8064098, 1, 1, 1, 1, 1,
0.7857755, 0.03700113, -0.1698536, 1, 1, 1, 1, 1,
0.785781, 1.831547, 0.5520561, 1, 1, 1, 1, 1,
0.7983229, -0.5403534, 2.97065, 1, 1, 1, 1, 1,
0.8019935, 1.049099, 0.6343175, 1, 1, 1, 1, 1,
0.8036256, 0.2300601, 1.308623, 0, 0, 1, 1, 1,
0.8045447, -0.1246457, 1.043142, 1, 0, 0, 1, 1,
0.8046086, -0.2959315, 1.02751, 1, 0, 0, 1, 1,
0.811742, -0.03584788, 1.202779, 1, 0, 0, 1, 1,
0.8214511, -0.5768471, 0.6178304, 1, 0, 0, 1, 1,
0.8223941, 0.6337923, 2.098312, 1, 0, 0, 1, 1,
0.8224139, 0.9234181, 0.4118409, 0, 0, 0, 1, 1,
0.8230692, -0.979519, 2.114837, 0, 0, 0, 1, 1,
0.8284201, -0.1595219, 1.134642, 0, 0, 0, 1, 1,
0.8313946, -1.47836, 2.801678, 0, 0, 0, 1, 1,
0.8360817, -0.5765063, 1.666532, 0, 0, 0, 1, 1,
0.837106, -0.4556245, 1.834977, 0, 0, 0, 1, 1,
0.838576, 0.2306116, 0.699204, 0, 0, 0, 1, 1,
0.8409769, 0.9827535, -1.134532, 1, 1, 1, 1, 1,
0.8437462, -1.470875, 1.685261, 1, 1, 1, 1, 1,
0.8482884, 0.8956466, 1.261309, 1, 1, 1, 1, 1,
0.8490316, -0.6452451, 1.581115, 1, 1, 1, 1, 1,
0.8513528, -0.982261, 1.802621, 1, 1, 1, 1, 1,
0.8523689, -0.1215909, 2.263748, 1, 1, 1, 1, 1,
0.8527136, -0.2969869, 2.870755, 1, 1, 1, 1, 1,
0.8544288, -0.9586911, 1.276913, 1, 1, 1, 1, 1,
0.8599254, -0.3269919, 2.612254, 1, 1, 1, 1, 1,
0.8629681, 0.6357998, 1.76773, 1, 1, 1, 1, 1,
0.8650037, 0.8396536, -0.963921, 1, 1, 1, 1, 1,
0.8686572, -0.5416633, 0.8073871, 1, 1, 1, 1, 1,
0.8706739, -0.05869843, 1.217073, 1, 1, 1, 1, 1,
0.8745884, -0.5895486, 3.657518, 1, 1, 1, 1, 1,
0.8783982, -0.02438132, 1.426587, 1, 1, 1, 1, 1,
0.8831094, 0.08220538, 2.383082, 0, 0, 1, 1, 1,
0.9072562, 0.8324489, 0.6424354, 1, 0, 0, 1, 1,
0.9126938, -0.6038443, 2.07155, 1, 0, 0, 1, 1,
0.9141095, 0.4731684, -0.3061599, 1, 0, 0, 1, 1,
0.9214819, -1.323412, 1.915904, 1, 0, 0, 1, 1,
0.9261733, -0.5530168, 3.354111, 1, 0, 0, 1, 1,
0.9364364, 0.2004776, 2.20163, 0, 0, 0, 1, 1,
0.9417143, -0.5955086, 1.564576, 0, 0, 0, 1, 1,
0.9436398, -1.001815, 2.831631, 0, 0, 0, 1, 1,
0.947411, -1.324601, 3.742671, 0, 0, 0, 1, 1,
0.9491243, -1.016299, 2.720146, 0, 0, 0, 1, 1,
0.9525558, 0.642743, 0.8440337, 0, 0, 0, 1, 1,
0.9554846, -0.04260245, 0.3576438, 0, 0, 0, 1, 1,
0.9604589, 1.70057, -1.038098, 1, 1, 1, 1, 1,
0.9617775, -0.1897112, 1.515823, 1, 1, 1, 1, 1,
0.962418, 1.215636, 0.9704966, 1, 1, 1, 1, 1,
0.9695766, -0.02518964, 2.741077, 1, 1, 1, 1, 1,
0.9711538, -0.7578659, 3.10849, 1, 1, 1, 1, 1,
0.9714356, 0.9466532, 0.6872615, 1, 1, 1, 1, 1,
0.9723193, 0.1329982, 2.553889, 1, 1, 1, 1, 1,
0.9834169, -0.378649, 3.665334, 1, 1, 1, 1, 1,
0.9875739, -0.6628403, 2.799643, 1, 1, 1, 1, 1,
0.9915528, 2.121204, 0.7910119, 1, 1, 1, 1, 1,
0.9957335, 0.4325908, 0.1410304, 1, 1, 1, 1, 1,
0.9964437, -1.269372, 0.5184022, 1, 1, 1, 1, 1,
0.9964962, 0.1616458, 2.168193, 1, 1, 1, 1, 1,
0.9991966, 0.1577544, 0.7252518, 1, 1, 1, 1, 1,
1.006077, 0.02383646, -1.010917, 1, 1, 1, 1, 1,
1.006166, -2.652764, 3.654605, 0, 0, 1, 1, 1,
1.006642, -0.06357158, -0.04227415, 1, 0, 0, 1, 1,
1.008445, -0.2205353, 2.613465, 1, 0, 0, 1, 1,
1.013169, -0.651776, 2.624256, 1, 0, 0, 1, 1,
1.014174, -0.8638349, 3.414443, 1, 0, 0, 1, 1,
1.01714, 2.450184, -0.6176715, 1, 0, 0, 1, 1,
1.029025, -0.3571569, 1.370873, 0, 0, 0, 1, 1,
1.029272, 0.7548735, 1.527614, 0, 0, 0, 1, 1,
1.03649, 0.8429889, 0.955704, 0, 0, 0, 1, 1,
1.039233, 2.726598, 0.5923507, 0, 0, 0, 1, 1,
1.04026, -1.035683, 1.498513, 0, 0, 0, 1, 1,
1.052931, 1.43275, -0.8092596, 0, 0, 0, 1, 1,
1.056533, 0.3624863, 1.521041, 0, 0, 0, 1, 1,
1.058636, 0.238562, 0.5868863, 1, 1, 1, 1, 1,
1.062398, -0.2028282, 1.540086, 1, 1, 1, 1, 1,
1.062989, -0.1479963, 1.155799, 1, 1, 1, 1, 1,
1.068257, -0.1029365, -0.543822, 1, 1, 1, 1, 1,
1.07049, 0.5513926, 1.039001, 1, 1, 1, 1, 1,
1.072107, -1.206481, 1.403428, 1, 1, 1, 1, 1,
1.076094, 0.6495606, 0.7932686, 1, 1, 1, 1, 1,
1.078185, 0.7740443, 1.926761, 1, 1, 1, 1, 1,
1.080542, -1.404252, 3.101983, 1, 1, 1, 1, 1,
1.089161, -1.311315, 3.064036, 1, 1, 1, 1, 1,
1.090153, -0.0767922, 1.875599, 1, 1, 1, 1, 1,
1.093793, -0.9095504, 3.854116, 1, 1, 1, 1, 1,
1.100419, -0.4634329, 1.48292, 1, 1, 1, 1, 1,
1.101422, -0.3823332, 0.4930624, 1, 1, 1, 1, 1,
1.113637, -0.5409604, 2.056411, 1, 1, 1, 1, 1,
1.114859, 1.02317, 1.437254, 0, 0, 1, 1, 1,
1.117612, 0.9307035, -1.904836, 1, 0, 0, 1, 1,
1.118781, -0.6667156, 3.834026, 1, 0, 0, 1, 1,
1.127546, 1.297014, 2.137925, 1, 0, 0, 1, 1,
1.134326, 0.4298186, 1.767618, 1, 0, 0, 1, 1,
1.144503, 0.393626, 2.263257, 1, 0, 0, 1, 1,
1.147514, 0.4779975, 2.385548, 0, 0, 0, 1, 1,
1.155668, 0.8348516, 2.364148, 0, 0, 0, 1, 1,
1.158826, -0.2116036, 0.5182954, 0, 0, 0, 1, 1,
1.15991, -1.66742, 4.591458, 0, 0, 0, 1, 1,
1.163665, -0.1658672, 1.39431, 0, 0, 0, 1, 1,
1.170097, -0.1648457, 1.844916, 0, 0, 0, 1, 1,
1.17506, 0.0009414599, 1.377434, 0, 0, 0, 1, 1,
1.186217, 0.5234988, -0.2342303, 1, 1, 1, 1, 1,
1.190596, -0.4941829, 1.52479, 1, 1, 1, 1, 1,
1.194462, -0.2980529, 5.226073, 1, 1, 1, 1, 1,
1.199268, -0.4827387, 2.350603, 1, 1, 1, 1, 1,
1.212742, -2.475664, 2.486971, 1, 1, 1, 1, 1,
1.220779, 1.791265, 1.529881, 1, 1, 1, 1, 1,
1.226776, -0.3450075, 1.565283, 1, 1, 1, 1, 1,
1.228048, -0.6838689, 1.647011, 1, 1, 1, 1, 1,
1.228299, 0.9078184, -0.2633181, 1, 1, 1, 1, 1,
1.231399, -1.216019, 1.676569, 1, 1, 1, 1, 1,
1.232066, -0.8541151, 3.114813, 1, 1, 1, 1, 1,
1.237407, 0.746627, 2.192871, 1, 1, 1, 1, 1,
1.248625, -0.06902894, 0.199409, 1, 1, 1, 1, 1,
1.257987, 1.158696, 1.721854, 1, 1, 1, 1, 1,
1.263721, -1.206094, 4.099609, 1, 1, 1, 1, 1,
1.265785, -0.3302848, 1.44346, 0, 0, 1, 1, 1,
1.26907, 1.44914, 1.198981, 1, 0, 0, 1, 1,
1.274467, 3.293069, 1.046397, 1, 0, 0, 1, 1,
1.279612, -0.3778598, 2.815958, 1, 0, 0, 1, 1,
1.302195, 0.8136401, 0.6614582, 1, 0, 0, 1, 1,
1.302995, 1.061778, 0.4520414, 1, 0, 0, 1, 1,
1.303012, -1.10581, 4.38089, 0, 0, 0, 1, 1,
1.305, 1.100212, 1.26204, 0, 0, 0, 1, 1,
1.307336, 0.6243175, 1.554031, 0, 0, 0, 1, 1,
1.308882, -0.621151, 2.560381, 0, 0, 0, 1, 1,
1.315398, 0.3319998, 1.155436, 0, 0, 0, 1, 1,
1.31793, -1.685663, 2.075011, 0, 0, 0, 1, 1,
1.318489, 0.2831544, 1.183137, 0, 0, 0, 1, 1,
1.322308, -1.178589, 1.720535, 1, 1, 1, 1, 1,
1.333014, -0.07566624, 2.076849, 1, 1, 1, 1, 1,
1.333177, 0.6380274, 1.415437, 1, 1, 1, 1, 1,
1.342196, 0.6335721, 2.101293, 1, 1, 1, 1, 1,
1.344995, -0.7472727, 3.138485, 1, 1, 1, 1, 1,
1.346621, -0.03456222, 1.340764, 1, 1, 1, 1, 1,
1.35705, 0.6568432, 2.630105, 1, 1, 1, 1, 1,
1.360081, -0.3035331, 1.965289, 1, 1, 1, 1, 1,
1.377368, 0.7316971, -0.5535616, 1, 1, 1, 1, 1,
1.382535, -0.7619837, 2.928948, 1, 1, 1, 1, 1,
1.389064, -2.875788, 4.163469, 1, 1, 1, 1, 1,
1.40386, 0.1105293, 2.092791, 1, 1, 1, 1, 1,
1.40577, 0.7613229, 1.969263, 1, 1, 1, 1, 1,
1.407316, -1.292581, 0.6983178, 1, 1, 1, 1, 1,
1.414253, 0.6151181, 0.3440602, 1, 1, 1, 1, 1,
1.422282, -0.1837872, 1.381565, 0, 0, 1, 1, 1,
1.422633, -1.488732, 2.359855, 1, 0, 0, 1, 1,
1.431346, -0.9768035, 2.213517, 1, 0, 0, 1, 1,
1.473377, -0.5652431, 3.190918, 1, 0, 0, 1, 1,
1.475241, 0.9406893, 0.4734838, 1, 0, 0, 1, 1,
1.479317, -1.292922, 1.67877, 1, 0, 0, 1, 1,
1.490807, -0.3679948, 1.819999, 0, 0, 0, 1, 1,
1.492122, 1.661105, 0.04511934, 0, 0, 0, 1, 1,
1.50702, -1.535786, 3.099881, 0, 0, 0, 1, 1,
1.509697, -0.2701342, 0.6550008, 0, 0, 0, 1, 1,
1.513792, -0.02446107, 1.893095, 0, 0, 0, 1, 1,
1.518911, -0.7918382, 1.829692, 0, 0, 0, 1, 1,
1.527375, 0.8888425, -0.7487798, 0, 0, 0, 1, 1,
1.53612, 0.6081482, 1.445738, 1, 1, 1, 1, 1,
1.536469, 0.5542845, 1.815093, 1, 1, 1, 1, 1,
1.550368, 0.7154346, -1.243772, 1, 1, 1, 1, 1,
1.554044, -0.2512091, 3.065129, 1, 1, 1, 1, 1,
1.55697, 0.1736685, 2.678687, 1, 1, 1, 1, 1,
1.558653, 0.8049572, 0.05946857, 1, 1, 1, 1, 1,
1.566244, -0.7889219, 1.194608, 1, 1, 1, 1, 1,
1.576372, -0.2680789, 0.981519, 1, 1, 1, 1, 1,
1.577805, -0.9414188, 1.639985, 1, 1, 1, 1, 1,
1.578928, -0.6394762, 2.577, 1, 1, 1, 1, 1,
1.591014, -1.847681, 2.905832, 1, 1, 1, 1, 1,
1.611565, -0.3104809, 1.357222, 1, 1, 1, 1, 1,
1.615176, 0.869477, 1.0204, 1, 1, 1, 1, 1,
1.620869, -2.097389, 2.266642, 1, 1, 1, 1, 1,
1.632544, -2.383596, 2.610287, 1, 1, 1, 1, 1,
1.641264, -1.256032, 1.342193, 0, 0, 1, 1, 1,
1.645089, -2.693416, 3.48181, 1, 0, 0, 1, 1,
1.654087, -0.1967885, 2.150427, 1, 0, 0, 1, 1,
1.662054, -1.366923, 2.131134, 1, 0, 0, 1, 1,
1.669727, 0.3982513, 1.552545, 1, 0, 0, 1, 1,
1.671451, 1.314746, 1.067522, 1, 0, 0, 1, 1,
1.672548, 1.216398, 0.2068124, 0, 0, 0, 1, 1,
1.673453, 0.5734585, 2.653871, 0, 0, 0, 1, 1,
1.676365, 0.8450842, 1.604196, 0, 0, 0, 1, 1,
1.683385, 0.6075376, 3.416637, 0, 0, 0, 1, 1,
1.686231, -0.3114596, 1.088396, 0, 0, 0, 1, 1,
1.707909, -1.592186, 2.473813, 0, 0, 0, 1, 1,
1.76506, -1.564714, 1.414088, 0, 0, 0, 1, 1,
1.767731, -0.1334332, 2.098709, 1, 1, 1, 1, 1,
1.783161, 2.138214, -0.3332151, 1, 1, 1, 1, 1,
1.78904, 2.488565, -0.5214337, 1, 1, 1, 1, 1,
1.796098, 1.347797, -0.2538245, 1, 1, 1, 1, 1,
1.815023, -0.4397494, 3.326566, 1, 1, 1, 1, 1,
1.821658, -0.945914, 1.775183, 1, 1, 1, 1, 1,
1.836683, 0.9217731, 0.1521085, 1, 1, 1, 1, 1,
1.855483, 2.43723, 0.6624205, 1, 1, 1, 1, 1,
1.916419, -1.581552, 2.083306, 1, 1, 1, 1, 1,
1.91774, 0.8190772, 1.980333, 1, 1, 1, 1, 1,
1.926725, -0.02884437, 2.378867, 1, 1, 1, 1, 1,
1.939433, 0.2031989, 0.6964076, 1, 1, 1, 1, 1,
1.966276, 2.652383, 1.066811, 1, 1, 1, 1, 1,
1.984743, -0.1407108, 2.818402, 1, 1, 1, 1, 1,
1.990002, 0.7627347, 0.7111108, 1, 1, 1, 1, 1,
2.001422, 0.5208929, 4.158026, 0, 0, 1, 1, 1,
2.025591, -2.003227, 2.981075, 1, 0, 0, 1, 1,
2.030689, 1.14326, 1.246745, 1, 0, 0, 1, 1,
2.05308, -0.03962092, 3.072127, 1, 0, 0, 1, 1,
2.106417, -0.03569576, 1.810897, 1, 0, 0, 1, 1,
2.16646, 0.7524753, -0.1473982, 1, 0, 0, 1, 1,
2.264037, -1.107289, 3.056024, 0, 0, 0, 1, 1,
2.337224, -0.4923392, -0.5595034, 0, 0, 0, 1, 1,
2.40666, 0.8278682, 0.1523395, 0, 0, 0, 1, 1,
2.414945, -1.893974, 2.934655, 0, 0, 0, 1, 1,
2.422521, 0.0153825, 3.058852, 0, 0, 0, 1, 1,
2.43909, -1.350713, 2.104102, 0, 0, 0, 1, 1,
2.452475, 1.473567, 1.7422, 0, 0, 0, 1, 1,
2.461804, -1.415377, 4.114786, 1, 1, 1, 1, 1,
2.492429, 0.1979302, 2.512165, 1, 1, 1, 1, 1,
2.673523, -1.042982, 4.088168, 1, 1, 1, 1, 1,
2.854398, -0.02991584, -1.021093, 1, 1, 1, 1, 1,
2.8778, 0.1455778, 1.086528, 1, 1, 1, 1, 1,
2.885041, -0.2829558, 3.760181, 1, 1, 1, 1, 1,
2.908483, -1.402609, 1.797242, 1, 1, 1, 1, 1
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
var radius = 9.802287;
var distance = 34.43012;
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
mvMatrix.translate( 0.0544883, 0.05669332, 0.4332762 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43012);
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