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
-3.322306, 0.2560868, -1.603176, 1, 0, 0, 1,
-2.895008, 0.6902188, -1.500407, 1, 0.007843138, 0, 1,
-2.87045, 1.603526, -1.806622, 1, 0.01176471, 0, 1,
-2.728581, -0.3547603, -2.387332, 1, 0.01960784, 0, 1,
-2.684168, 0.7821355, -1.342905, 1, 0.02352941, 0, 1,
-2.676746, -1.025853, -1.147963, 1, 0.03137255, 0, 1,
-2.613384, -0.1081663, -1.074123, 1, 0.03529412, 0, 1,
-2.443277, 1.760817, -0.645942, 1, 0.04313726, 0, 1,
-2.272706, -1.376905, -1.622172, 1, 0.04705882, 0, 1,
-2.259743, -0.5626009, -3.362653, 1, 0.05490196, 0, 1,
-2.221821, -0.1528374, -1.002357, 1, 0.05882353, 0, 1,
-2.186013, 0.3075134, -1.673834, 1, 0.06666667, 0, 1,
-2.152425, -0.5571919, -1.347801, 1, 0.07058824, 0, 1,
-2.146285, 0.7396551, -1.414895, 1, 0.07843138, 0, 1,
-2.116857, 1.63704, -1.254243, 1, 0.08235294, 0, 1,
-2.065959, 0.8996956, -1.143752, 1, 0.09019608, 0, 1,
-2.051291, -1.857874, -1.981961, 1, 0.09411765, 0, 1,
-2.045818, -0.5051405, -0.8522353, 1, 0.1019608, 0, 1,
-2.036411, 0.3237974, -2.235964, 1, 0.1098039, 0, 1,
-2.026081, 1.692409, -1.791568, 1, 0.1137255, 0, 1,
-2.020603, 0.4190918, -0.5569012, 1, 0.1215686, 0, 1,
-1.980049, -1.337689, -1.737591, 1, 0.1254902, 0, 1,
-1.969857, -0.5923232, -1.770872, 1, 0.1333333, 0, 1,
-1.945622, 0.6269874, 0.1422563, 1, 0.1372549, 0, 1,
-1.932289, -1.495626, -1.359814, 1, 0.145098, 0, 1,
-1.929475, 1.113395, 2.306298, 1, 0.1490196, 0, 1,
-1.856861, -0.4091947, -2.29492, 1, 0.1568628, 0, 1,
-1.854055, -1.284728, -2.232902, 1, 0.1607843, 0, 1,
-1.829449, 0.8486376, -2.896231, 1, 0.1686275, 0, 1,
-1.824968, -1.290508, -4.92627, 1, 0.172549, 0, 1,
-1.817443, 0.3058541, -0.1990664, 1, 0.1803922, 0, 1,
-1.797198, 1.902618, 0.324417, 1, 0.1843137, 0, 1,
-1.788556, 0.06961957, -2.383303, 1, 0.1921569, 0, 1,
-1.785705, 0.5730849, -0.4663024, 1, 0.1960784, 0, 1,
-1.765375, -0.5942706, -1.728037, 1, 0.2039216, 0, 1,
-1.763916, -1.047737, -1.802863, 1, 0.2117647, 0, 1,
-1.732232, 0.5562168, 1.144616, 1, 0.2156863, 0, 1,
-1.731248, -0.2932871, -0.1216336, 1, 0.2235294, 0, 1,
-1.714079, -0.7226819, -2.901792, 1, 0.227451, 0, 1,
-1.713247, -0.4622031, -0.7282547, 1, 0.2352941, 0, 1,
-1.70383, -0.9635556, -2.571448, 1, 0.2392157, 0, 1,
-1.697901, 0.5253633, -1.251105, 1, 0.2470588, 0, 1,
-1.694371, -0.6389862, -3.425518, 1, 0.2509804, 0, 1,
-1.679912, 0.5150093, -2.448965, 1, 0.2588235, 0, 1,
-1.668536, -1.362373, -1.581079, 1, 0.2627451, 0, 1,
-1.657246, 0.9957091, -0.657801, 1, 0.2705882, 0, 1,
-1.636624, -0.08871932, -2.044622, 1, 0.2745098, 0, 1,
-1.63033, 0.4070965, -1.68001, 1, 0.282353, 0, 1,
-1.627762, 0.03689642, -1.43165, 1, 0.2862745, 0, 1,
-1.624814, 1.437132, -1.115173, 1, 0.2941177, 0, 1,
-1.616599, -0.4973454, -1.953483, 1, 0.3019608, 0, 1,
-1.613342, 0.139428, -1.76862, 1, 0.3058824, 0, 1,
-1.610407, 2.172277, -1.357903, 1, 0.3137255, 0, 1,
-1.579322, -0.05834508, -1.006019, 1, 0.3176471, 0, 1,
-1.575147, 1.283624, -0.2966572, 1, 0.3254902, 0, 1,
-1.568037, 1.424104, -1.094756, 1, 0.3294118, 0, 1,
-1.557763, -0.4878969, -0.3816282, 1, 0.3372549, 0, 1,
-1.529646, 0.9883862, -1.089491, 1, 0.3411765, 0, 1,
-1.527027, -0.7180916, -2.908273, 1, 0.3490196, 0, 1,
-1.526377, -0.7064093, -1.640504, 1, 0.3529412, 0, 1,
-1.51796, -0.8827024, -0.03401056, 1, 0.3607843, 0, 1,
-1.514719, 0.1519201, 0.360104, 1, 0.3647059, 0, 1,
-1.494163, 0.346018, -2.129798, 1, 0.372549, 0, 1,
-1.493517, -0.2656489, -3.264924, 1, 0.3764706, 0, 1,
-1.491689, -0.9217749, -3.836906, 1, 0.3843137, 0, 1,
-1.485523, 1.37403, -0.9718129, 1, 0.3882353, 0, 1,
-1.480719, -1.352166, -1.734834, 1, 0.3960784, 0, 1,
-1.457244, 0.4351197, -0.7390572, 1, 0.4039216, 0, 1,
-1.456622, 0.8910976, -1.099966, 1, 0.4078431, 0, 1,
-1.448871, 0.297655, -0.5599181, 1, 0.4156863, 0, 1,
-1.447825, 0.4763105, -1.40989, 1, 0.4196078, 0, 1,
-1.43336, -1.486369, -2.065228, 1, 0.427451, 0, 1,
-1.427403, -0.8450047, -0.7938033, 1, 0.4313726, 0, 1,
-1.41442, 3.285757, -2.061209, 1, 0.4392157, 0, 1,
-1.407247, 0.283009, -2.801125, 1, 0.4431373, 0, 1,
-1.39246, 1.517425, -0.9739457, 1, 0.4509804, 0, 1,
-1.375355, 0.5246603, -1.999849, 1, 0.454902, 0, 1,
-1.374214, -2.543957, -3.743134, 1, 0.4627451, 0, 1,
-1.368685, -0.6135922, -2.158673, 1, 0.4666667, 0, 1,
-1.36337, 0.2109762, -1.609784, 1, 0.4745098, 0, 1,
-1.362303, 1.945349, -0.767023, 1, 0.4784314, 0, 1,
-1.351533, -0.1910475, -3.434099, 1, 0.4862745, 0, 1,
-1.34314, 1.045139, -1.492191, 1, 0.4901961, 0, 1,
-1.332258, -0.9346542, -2.628439, 1, 0.4980392, 0, 1,
-1.329864, -0.5980863, -3.745147, 1, 0.5058824, 0, 1,
-1.321951, 0.1251913, -0.4690992, 1, 0.509804, 0, 1,
-1.318941, -0.02584544, -0.3768164, 1, 0.5176471, 0, 1,
-1.308825, 1.262457, -1.297874, 1, 0.5215687, 0, 1,
-1.304598, -0.2433764, -0.7946307, 1, 0.5294118, 0, 1,
-1.302637, 0.4570771, -1.118701, 1, 0.5333334, 0, 1,
-1.301475, 0.685701, 0.789416, 1, 0.5411765, 0, 1,
-1.300905, 1.170034, 0.5293253, 1, 0.5450981, 0, 1,
-1.289177, -1.439736, -3.270312, 1, 0.5529412, 0, 1,
-1.286867, -1.65495, -2.918159, 1, 0.5568628, 0, 1,
-1.286489, 1.118832, -0.3717961, 1, 0.5647059, 0, 1,
-1.273746, 0.7919559, -1.37425, 1, 0.5686275, 0, 1,
-1.272572, -1.232937, -2.924855, 1, 0.5764706, 0, 1,
-1.267872, -0.5468972, -1.805842, 1, 0.5803922, 0, 1,
-1.259532, -0.1179616, -0.7922917, 1, 0.5882353, 0, 1,
-1.258863, -1.004276, -1.891221, 1, 0.5921569, 0, 1,
-1.258036, -0.1640383, -0.6138567, 1, 0.6, 0, 1,
-1.253146, 0.3741711, -2.636913, 1, 0.6078432, 0, 1,
-1.25284, 0.8731061, -1.499835, 1, 0.6117647, 0, 1,
-1.247169, 0.9096714, -0.9801652, 1, 0.6196079, 0, 1,
-1.237767, -0.3930043, -2.732459, 1, 0.6235294, 0, 1,
-1.23561, 1.160203, -0.6620205, 1, 0.6313726, 0, 1,
-1.212468, 0.01863336, -3.02194, 1, 0.6352941, 0, 1,
-1.211479, -0.8357695, -0.8525358, 1, 0.6431373, 0, 1,
-1.20978, -0.5364587, -1.99885, 1, 0.6470588, 0, 1,
-1.191802, 0.2364271, -1.663875, 1, 0.654902, 0, 1,
-1.183422, 1.835351, -1.223866, 1, 0.6588235, 0, 1,
-1.180063, 2.294722, -0.02172755, 1, 0.6666667, 0, 1,
-1.172407, 0.6299751, -0.1101196, 1, 0.6705883, 0, 1,
-1.168388, 0.4796297, -0.8167656, 1, 0.6784314, 0, 1,
-1.167545, -0.5907009, -0.784553, 1, 0.682353, 0, 1,
-1.158431, 0.5382265, -1.049675, 1, 0.6901961, 0, 1,
-1.157849, 1.40556, -1.036137, 1, 0.6941177, 0, 1,
-1.1516, -2.564575, -2.257052, 1, 0.7019608, 0, 1,
-1.150937, -1.69931, -3.265962, 1, 0.7098039, 0, 1,
-1.148569, 1.535725, 0.4844317, 1, 0.7137255, 0, 1,
-1.148241, 0.6529494, 0.05045537, 1, 0.7215686, 0, 1,
-1.144678, -0.1263499, -2.793202, 1, 0.7254902, 0, 1,
-1.141181, -0.7194291, -1.421204, 1, 0.7333333, 0, 1,
-1.139894, -0.2840112, -2.063651, 1, 0.7372549, 0, 1,
-1.130015, 0.4935827, -0.211401, 1, 0.7450981, 0, 1,
-1.128316, 0.6758928, -0.2164001, 1, 0.7490196, 0, 1,
-1.117615, 0.3494031, -0.5933936, 1, 0.7568628, 0, 1,
-1.117472, -0.2257594, -0.4047386, 1, 0.7607843, 0, 1,
-1.106457, 0.2112346, -0.8441411, 1, 0.7686275, 0, 1,
-1.092879, 0.3779846, -2.063094, 1, 0.772549, 0, 1,
-1.081522, -0.6748694, -1.710003, 1, 0.7803922, 0, 1,
-1.081521, 0.1389176, -1.812564, 1, 0.7843137, 0, 1,
-1.076125, 0.5372388, 0.2528531, 1, 0.7921569, 0, 1,
-1.075253, -0.4185337, -2.955916, 1, 0.7960784, 0, 1,
-1.072191, 1.574874, 0.4352629, 1, 0.8039216, 0, 1,
-1.06602, 1.16464, -0.501732, 1, 0.8117647, 0, 1,
-1.056929, 0.04040033, -2.779285, 1, 0.8156863, 0, 1,
-1.055501, -0.6348892, -0.3740444, 1, 0.8235294, 0, 1,
-1.050939, -0.274156, -1.443998, 1, 0.827451, 0, 1,
-1.048375, -1.722414, -3.068127, 1, 0.8352941, 0, 1,
-1.048323, -1.184962, -2.768571, 1, 0.8392157, 0, 1,
-1.045431, 0.4978622, -1.835709, 1, 0.8470588, 0, 1,
-1.042566, 0.6196484, -0.4026024, 1, 0.8509804, 0, 1,
-1.040787, -0.1166974, -2.609841, 1, 0.8588235, 0, 1,
-1.039008, 0.8365186, -0.3366635, 1, 0.8627451, 0, 1,
-1.028947, -0.2964522, -2.058931, 1, 0.8705882, 0, 1,
-1.0209, -0.2756343, -2.571103, 1, 0.8745098, 0, 1,
-1.020641, 0.2433616, -0.7328099, 1, 0.8823529, 0, 1,
-1.01164, 0.5589456, -1.178797, 1, 0.8862745, 0, 1,
-0.9979038, -0.1512813, -0.7660006, 1, 0.8941177, 0, 1,
-0.9957457, 0.127901, 0.1729912, 1, 0.8980392, 0, 1,
-0.9911106, 2.750685, -0.6988211, 1, 0.9058824, 0, 1,
-0.9868103, -0.9416181, -2.272122, 1, 0.9137255, 0, 1,
-0.9748133, 1.242891, -1.298084, 1, 0.9176471, 0, 1,
-0.9648857, -0.008263284, -2.671684, 1, 0.9254902, 0, 1,
-0.964817, 0.7927974, -2.358655, 1, 0.9294118, 0, 1,
-0.9563147, 0.1870643, -0.8364105, 1, 0.9372549, 0, 1,
-0.9538725, -0.7406612, -2.732839, 1, 0.9411765, 0, 1,
-0.9501399, -0.2795943, -2.97299, 1, 0.9490196, 0, 1,
-0.9441171, -0.1530899, -4.171863, 1, 0.9529412, 0, 1,
-0.9435135, 0.4409431, -0.3854243, 1, 0.9607843, 0, 1,
-0.9407543, -0.2382378, -1.540812, 1, 0.9647059, 0, 1,
-0.9368243, -0.9861146, -3.429434, 1, 0.972549, 0, 1,
-0.9276666, 0.2863846, -0.2145695, 1, 0.9764706, 0, 1,
-0.9201462, 0.1837267, -1.427988, 1, 0.9843137, 0, 1,
-0.9151652, 0.9170815, -1.490817, 1, 0.9882353, 0, 1,
-0.9147364, -0.5250698, -1.726853, 1, 0.9960784, 0, 1,
-0.9085549, -0.2948187, -2.991541, 0.9960784, 1, 0, 1,
-0.9084133, -0.186513, -0.8161191, 0.9921569, 1, 0, 1,
-0.904368, -0.3691027, -2.526103, 0.9843137, 1, 0, 1,
-0.9030944, 1.245485, 1.001252, 0.9803922, 1, 0, 1,
-0.9010903, 0.8478327, -1.550719, 0.972549, 1, 0, 1,
-0.8947515, -1.384989, -3.273485, 0.9686275, 1, 0, 1,
-0.8836811, -0.8495405, -1.329384, 0.9607843, 1, 0, 1,
-0.8815002, -0.1078878, -2.768214, 0.9568627, 1, 0, 1,
-0.8707166, -0.2092727, -0.2633348, 0.9490196, 1, 0, 1,
-0.8672884, 0.4379479, -1.566745, 0.945098, 1, 0, 1,
-0.865397, 0.1498659, -3.121031, 0.9372549, 1, 0, 1,
-0.8649262, 1.107152, -0.2195209, 0.9333333, 1, 0, 1,
-0.8647467, 0.5921428, -1.370027, 0.9254902, 1, 0, 1,
-0.8613632, 0.5453733, 1.444653, 0.9215686, 1, 0, 1,
-0.8581443, -1.568238, -2.373848, 0.9137255, 1, 0, 1,
-0.8578365, 0.8289841, -1.890393, 0.9098039, 1, 0, 1,
-0.8569415, 0.009912124, -1.095106, 0.9019608, 1, 0, 1,
-0.8353869, 0.4244359, 0.6007313, 0.8941177, 1, 0, 1,
-0.8348771, 0.4485163, -0.2270272, 0.8901961, 1, 0, 1,
-0.8299055, -0.06162842, -3.443168, 0.8823529, 1, 0, 1,
-0.823541, -0.3780125, -1.5429, 0.8784314, 1, 0, 1,
-0.8231131, 0.9800413, 0.6151651, 0.8705882, 1, 0, 1,
-0.8194337, -1.200186, -2.856211, 0.8666667, 1, 0, 1,
-0.8163752, 0.08551175, -0.5778254, 0.8588235, 1, 0, 1,
-0.8146147, 0.8117981, -0.3213218, 0.854902, 1, 0, 1,
-0.8135579, 0.900994, -1.4701, 0.8470588, 1, 0, 1,
-0.8126742, 1.333584, -0.195569, 0.8431373, 1, 0, 1,
-0.8113138, 0.7160493, -0.2634187, 0.8352941, 1, 0, 1,
-0.8110397, 0.5197468, -0.6206461, 0.8313726, 1, 0, 1,
-0.810196, 0.04672114, -1.137345, 0.8235294, 1, 0, 1,
-0.8037641, -0.3721524, -2.164042, 0.8196079, 1, 0, 1,
-0.803656, -1.011142, -1.856557, 0.8117647, 1, 0, 1,
-0.7982025, -1.431492, -2.554215, 0.8078431, 1, 0, 1,
-0.796635, -0.5866321, -4.647004, 0.8, 1, 0, 1,
-0.7926474, 0.08766091, -0.9915704, 0.7921569, 1, 0, 1,
-0.7914388, -0.1982275, -2.296772, 0.7882353, 1, 0, 1,
-0.7887579, 0.9171987, -1.79018, 0.7803922, 1, 0, 1,
-0.7879636, 0.1876973, -1.658972, 0.7764706, 1, 0, 1,
-0.7858585, 0.1505142, -0.929736, 0.7686275, 1, 0, 1,
-0.7857983, -0.7846683, -0.5959393, 0.7647059, 1, 0, 1,
-0.7854036, 1.26335, -1.945926, 0.7568628, 1, 0, 1,
-0.784653, -0.9758858, -3.176769, 0.7529412, 1, 0, 1,
-0.7799031, 1.603512, -0.9802946, 0.7450981, 1, 0, 1,
-0.7782542, -0.5768927, -2.426955, 0.7411765, 1, 0, 1,
-0.7703639, -0.5079526, -1.311909, 0.7333333, 1, 0, 1,
-0.7513626, -0.05316923, -0.8993201, 0.7294118, 1, 0, 1,
-0.7505345, 0.1762076, -1.390878, 0.7215686, 1, 0, 1,
-0.7458631, -0.6548846, -1.791044, 0.7176471, 1, 0, 1,
-0.7429401, 1.412521, -1.218257, 0.7098039, 1, 0, 1,
-0.7417516, -0.6658892, -0.5318853, 0.7058824, 1, 0, 1,
-0.7409389, 0.05693945, -1.630278, 0.6980392, 1, 0, 1,
-0.7356385, -1.08203, -2.974189, 0.6901961, 1, 0, 1,
-0.7297444, 0.1256402, -1.559969, 0.6862745, 1, 0, 1,
-0.7270518, 0.9584392, -1.633198, 0.6784314, 1, 0, 1,
-0.7227461, 0.02688298, -0.383875, 0.6745098, 1, 0, 1,
-0.7209253, -0.4351166, -0.8828338, 0.6666667, 1, 0, 1,
-0.714269, -1.281563, -1.905548, 0.6627451, 1, 0, 1,
-0.7102373, 0.1359509, -1.351026, 0.654902, 1, 0, 1,
-0.7048684, 1.710283, 0.562949, 0.6509804, 1, 0, 1,
-0.7029059, -1.372565, -2.532391, 0.6431373, 1, 0, 1,
-0.7024176, 0.9948232, -1.390125, 0.6392157, 1, 0, 1,
-0.6888157, 0.2347048, -1.423966, 0.6313726, 1, 0, 1,
-0.6882011, -0.4229751, -2.612665, 0.627451, 1, 0, 1,
-0.6670787, -1.683892, -2.644007, 0.6196079, 1, 0, 1,
-0.6655635, -0.8549715, -1.950936, 0.6156863, 1, 0, 1,
-0.6644493, 1.393786, -0.9197474, 0.6078432, 1, 0, 1,
-0.6569532, -0.5217748, -3.74809, 0.6039216, 1, 0, 1,
-0.6544953, -1.180631, -2.631847, 0.5960785, 1, 0, 1,
-0.6526859, 1.079677, 0.5210987, 0.5882353, 1, 0, 1,
-0.6489249, 0.8139737, -1.012893, 0.5843138, 1, 0, 1,
-0.646899, 0.04963322, -0.04270576, 0.5764706, 1, 0, 1,
-0.6425997, 0.6284612, 1.255829, 0.572549, 1, 0, 1,
-0.6370636, -0.7806615, -0.8833707, 0.5647059, 1, 0, 1,
-0.636807, -0.8564522, -1.485344, 0.5607843, 1, 0, 1,
-0.6358009, -0.1966838, -1.492456, 0.5529412, 1, 0, 1,
-0.6354905, -0.3628944, -1.032535, 0.5490196, 1, 0, 1,
-0.6311899, -1.774619, -2.105443, 0.5411765, 1, 0, 1,
-0.6304684, 0.5525759, -0.8468435, 0.5372549, 1, 0, 1,
-0.629636, 1.207256, 0.1728782, 0.5294118, 1, 0, 1,
-0.6287488, 0.7120216, -1.021158, 0.5254902, 1, 0, 1,
-0.6282175, -1.251677, -4.331572, 0.5176471, 1, 0, 1,
-0.6248344, 1.888269, 1.301705, 0.5137255, 1, 0, 1,
-0.622507, -0.1259414, -0.7170814, 0.5058824, 1, 0, 1,
-0.6172426, -0.2405173, -2.567918, 0.5019608, 1, 0, 1,
-0.6151365, 1.047857, -0.8982767, 0.4941176, 1, 0, 1,
-0.6143748, -0.530145, -3.074707, 0.4862745, 1, 0, 1,
-0.6096042, 0.9160649, -0.2934586, 0.4823529, 1, 0, 1,
-0.6082823, 0.6121086, -1.378135, 0.4745098, 1, 0, 1,
-0.6006286, 0.9793583, 0.5770308, 0.4705882, 1, 0, 1,
-0.5952461, -1.815575, -3.323605, 0.4627451, 1, 0, 1,
-0.5944797, -0.474486, -2.329631, 0.4588235, 1, 0, 1,
-0.5923246, 0.24725, -1.753644, 0.4509804, 1, 0, 1,
-0.5912887, -1.088279, -1.365652, 0.4470588, 1, 0, 1,
-0.5910648, 0.9859949, -0.7865403, 0.4392157, 1, 0, 1,
-0.5834797, -1.991327, -1.80042, 0.4352941, 1, 0, 1,
-0.5829552, -0.01286327, -0.6006675, 0.427451, 1, 0, 1,
-0.5821486, 1.094682, -0.5491836, 0.4235294, 1, 0, 1,
-0.5805317, -0.4474292, 0.2604942, 0.4156863, 1, 0, 1,
-0.5780549, 0.04787832, -0.8058527, 0.4117647, 1, 0, 1,
-0.5773057, -0.5827142, -2.29871, 0.4039216, 1, 0, 1,
-0.570104, -0.1114345, -1.965133, 0.3960784, 1, 0, 1,
-0.5689546, 2.400652, 1.36389, 0.3921569, 1, 0, 1,
-0.5685965, 0.4273844, -1.423143, 0.3843137, 1, 0, 1,
-0.568222, -0.0140744, -0.5849051, 0.3803922, 1, 0, 1,
-0.5673971, 1.215316, -1.222253, 0.372549, 1, 0, 1,
-0.5655017, -0.2792922, -2.351136, 0.3686275, 1, 0, 1,
-0.5619395, -0.5283098, -1.278302, 0.3607843, 1, 0, 1,
-0.5597502, -0.3619315, -4.321215, 0.3568628, 1, 0, 1,
-0.5525741, -1.6798, -2.251125, 0.3490196, 1, 0, 1,
-0.5523577, -1.274248, -2.427394, 0.345098, 1, 0, 1,
-0.5519794, -0.7390313, -1.829714, 0.3372549, 1, 0, 1,
-0.5475066, 0.5843269, -0.1382155, 0.3333333, 1, 0, 1,
-0.5421404, 1.996141, 0.5024899, 0.3254902, 1, 0, 1,
-0.538576, -0.09608676, -0.7206538, 0.3215686, 1, 0, 1,
-0.5372827, 1.491349, -0.459463, 0.3137255, 1, 0, 1,
-0.5363967, 0.6884134, 1.52081, 0.3098039, 1, 0, 1,
-0.5358214, 0.2741954, -0.6419415, 0.3019608, 1, 0, 1,
-0.5354437, -1.226406, -3.053924, 0.2941177, 1, 0, 1,
-0.5347918, 0.5936714, -0.7235867, 0.2901961, 1, 0, 1,
-0.5270947, -0.7987604, -2.389079, 0.282353, 1, 0, 1,
-0.5167073, 0.5322963, 0.9620429, 0.2784314, 1, 0, 1,
-0.513952, 1.469293, 0.2609234, 0.2705882, 1, 0, 1,
-0.5132348, 2.245247, -0.1425107, 0.2666667, 1, 0, 1,
-0.5126156, -0.01708972, -1.649066, 0.2588235, 1, 0, 1,
-0.5052112, 0.1292664, -1.397901, 0.254902, 1, 0, 1,
-0.5035941, 1.323161, -0.7282776, 0.2470588, 1, 0, 1,
-0.5009288, -0.1470805, -2.267193, 0.2431373, 1, 0, 1,
-0.499409, 0.6075719, -0.8779758, 0.2352941, 1, 0, 1,
-0.4977773, 0.1752191, -2.856353, 0.2313726, 1, 0, 1,
-0.4957346, 1.074987, 0.5490781, 0.2235294, 1, 0, 1,
-0.4956495, 0.02527532, -2.02492, 0.2196078, 1, 0, 1,
-0.4950972, 1.456914, -1.513526, 0.2117647, 1, 0, 1,
-0.4946144, -0.410224, -2.129331, 0.2078431, 1, 0, 1,
-0.4906021, 1.829452, -1.386275, 0.2, 1, 0, 1,
-0.4865144, 1.932736, 0.01229647, 0.1921569, 1, 0, 1,
-0.4812225, -0.5395328, -2.819581, 0.1882353, 1, 0, 1,
-0.4778918, -0.578546, -3.455924, 0.1803922, 1, 0, 1,
-0.4772322, -0.8997564, -3.556982, 0.1764706, 1, 0, 1,
-0.4738884, -0.5219721, -2.532229, 0.1686275, 1, 0, 1,
-0.4728298, -1.667561, -3.216776, 0.1647059, 1, 0, 1,
-0.4724144, -0.9404108, -2.888238, 0.1568628, 1, 0, 1,
-0.472376, 0.7884677, -0.07100488, 0.1529412, 1, 0, 1,
-0.4657313, -2.115912, -1.829694, 0.145098, 1, 0, 1,
-0.4654783, -0.1929114, -1.313959, 0.1411765, 1, 0, 1,
-0.4580758, 0.80747, 1.846529, 0.1333333, 1, 0, 1,
-0.4580126, 1.034805, -0.6018518, 0.1294118, 1, 0, 1,
-0.4563946, -0.1786902, -2.045146, 0.1215686, 1, 0, 1,
-0.4552779, 0.6158032, 0.6085486, 0.1176471, 1, 0, 1,
-0.4544088, -1.823591, -1.712239, 0.1098039, 1, 0, 1,
-0.4524, -1.122053, -1.945413, 0.1058824, 1, 0, 1,
-0.4441531, 0.8480912, 0.2288346, 0.09803922, 1, 0, 1,
-0.4434558, -0.8267905, -1.550506, 0.09019608, 1, 0, 1,
-0.4432049, 0.6506315, -2.149186, 0.08627451, 1, 0, 1,
-0.4382343, 0.4437336, -0.9561119, 0.07843138, 1, 0, 1,
-0.4336708, 2.606981, -0.5240812, 0.07450981, 1, 0, 1,
-0.4324667, 0.6310161, -1.190409, 0.06666667, 1, 0, 1,
-0.4317952, 0.8885904, -1.380448, 0.0627451, 1, 0, 1,
-0.4305703, 2.341141, -0.5131211, 0.05490196, 1, 0, 1,
-0.4277304, 0.321572, -1.62662, 0.05098039, 1, 0, 1,
-0.4212083, -0.5142382, -1.872981, 0.04313726, 1, 0, 1,
-0.4147969, 0.5110539, 0.5870111, 0.03921569, 1, 0, 1,
-0.3995479, -0.9157865, -1.977572, 0.03137255, 1, 0, 1,
-0.3993523, 0.1399995, -0.5290029, 0.02745098, 1, 0, 1,
-0.3983062, 0.6072353, 0.6804771, 0.01960784, 1, 0, 1,
-0.3965029, 0.08024936, -1.878297, 0.01568628, 1, 0, 1,
-0.3932252, 0.994659, -0.5274773, 0.007843138, 1, 0, 1,
-0.3931535, -0.4950244, -0.8670716, 0.003921569, 1, 0, 1,
-0.392634, -0.08538823, -3.270903, 0, 1, 0.003921569, 1,
-0.3920617, -1.857134, -2.488999, 0, 1, 0.01176471, 1,
-0.3835034, -0.08509409, -2.736208, 0, 1, 0.01568628, 1,
-0.3830989, 0.746212, -0.8184561, 0, 1, 0.02352941, 1,
-0.3737632, -0.4825224, -2.041579, 0, 1, 0.02745098, 1,
-0.3688786, -0.7480221, -0.9640588, 0, 1, 0.03529412, 1,
-0.3671016, 0.4345643, -0.410859, 0, 1, 0.03921569, 1,
-0.3620883, -0.1656264, -3.384122, 0, 1, 0.04705882, 1,
-0.3617632, -0.9938622, -1.213171, 0, 1, 0.05098039, 1,
-0.3561954, 0.1417187, -1.378585, 0, 1, 0.05882353, 1,
-0.3519379, -1.589274, -4.539435, 0, 1, 0.0627451, 1,
-0.3513821, -2.084118, -4.173219, 0, 1, 0.07058824, 1,
-0.3462231, 0.4236211, -1.48896, 0, 1, 0.07450981, 1,
-0.3458053, -1.959326, -2.617585, 0, 1, 0.08235294, 1,
-0.341894, -1.712417, -3.189986, 0, 1, 0.08627451, 1,
-0.3360687, 1.727669, 1.228016, 0, 1, 0.09411765, 1,
-0.3303221, 0.5422957, -3.62779, 0, 1, 0.1019608, 1,
-0.3291436, -2.159501, -2.375924, 0, 1, 0.1058824, 1,
-0.32753, 0.9083229, 0.7736385, 0, 1, 0.1137255, 1,
-0.3241985, -0.8167726, -3.073836, 0, 1, 0.1176471, 1,
-0.3202263, 2.542931, 0.1076172, 0, 1, 0.1254902, 1,
-0.3199879, -1.969561, -4.063522, 0, 1, 0.1294118, 1,
-0.3186731, 0.04154067, -0.9572482, 0, 1, 0.1372549, 1,
-0.3169258, -0.0710566, -1.278378, 0, 1, 0.1411765, 1,
-0.3153501, -0.1525743, -2.313863, 0, 1, 0.1490196, 1,
-0.3108312, 0.5019754, -1.731924, 0, 1, 0.1529412, 1,
-0.304203, -0.5643227, -4.695041, 0, 1, 0.1607843, 1,
-0.3024463, -0.4882759, -3.388369, 0, 1, 0.1647059, 1,
-0.298183, 0.6565591, 0.2254715, 0, 1, 0.172549, 1,
-0.2949753, -0.3661045, -1.844598, 0, 1, 0.1764706, 1,
-0.2898213, -2.347869, -3.158729, 0, 1, 0.1843137, 1,
-0.2855131, 0.9870043, -0.1769868, 0, 1, 0.1882353, 1,
-0.2851126, 0.1684521, -0.6831942, 0, 1, 0.1960784, 1,
-0.2819265, 0.3443489, -2.437549, 0, 1, 0.2039216, 1,
-0.2791622, 0.006110737, -0.1670043, 0, 1, 0.2078431, 1,
-0.2765884, 0.4689182, -0.7526106, 0, 1, 0.2156863, 1,
-0.2757795, 0.2010533, -1.228947, 0, 1, 0.2196078, 1,
-0.2757083, -1.370038, -2.855368, 0, 1, 0.227451, 1,
-0.2732214, -0.2818, -2.637873, 0, 1, 0.2313726, 1,
-0.2689168, -0.5847875, -2.445752, 0, 1, 0.2392157, 1,
-0.2688107, -1.118649, -5.042487, 0, 1, 0.2431373, 1,
-0.2659371, -0.9678703, -2.010819, 0, 1, 0.2509804, 1,
-0.2649608, 0.9820009, 0.2668001, 0, 1, 0.254902, 1,
-0.264557, -0.8648502, -2.966535, 0, 1, 0.2627451, 1,
-0.2613604, -0.2730753, -2.186915, 0, 1, 0.2666667, 1,
-0.259492, 0.6440976, -0.3000967, 0, 1, 0.2745098, 1,
-0.2565652, -1.207545, -2.721702, 0, 1, 0.2784314, 1,
-0.2549669, 0.1914445, -0.9564401, 0, 1, 0.2862745, 1,
-0.253334, 1.689286, 1.395652, 0, 1, 0.2901961, 1,
-0.2500138, 0.4907577, 0.8920156, 0, 1, 0.2980392, 1,
-0.2495199, -0.2457037, -4.415913, 0, 1, 0.3058824, 1,
-0.2471533, 1.610523, -2.603899, 0, 1, 0.3098039, 1,
-0.2429071, -0.9777265, -1.703624, 0, 1, 0.3176471, 1,
-0.2397478, 0.01952222, -2.66418, 0, 1, 0.3215686, 1,
-0.238823, 0.7993421, 1.153858, 0, 1, 0.3294118, 1,
-0.231705, -0.945179, -4.027064, 0, 1, 0.3333333, 1,
-0.2308273, -0.2931744, -1.977394, 0, 1, 0.3411765, 1,
-0.2236723, -0.100443, -2.746215, 0, 1, 0.345098, 1,
-0.2229793, 1.135409, 0.9181914, 0, 1, 0.3529412, 1,
-0.2167089, -1.213279, -1.868379, 0, 1, 0.3568628, 1,
-0.2135371, 0.758451, 0.5712415, 0, 1, 0.3647059, 1,
-0.2133875, -2.049802, -2.25553, 0, 1, 0.3686275, 1,
-0.2035204, 0.03431756, -0.715179, 0, 1, 0.3764706, 1,
-0.1985067, 0.1266195, 0.05894617, 0, 1, 0.3803922, 1,
-0.19764, -0.7931929, -1.688492, 0, 1, 0.3882353, 1,
-0.1950529, -0.872908, -3.391603, 0, 1, 0.3921569, 1,
-0.1943717, -1.277526, -1.630522, 0, 1, 0.4, 1,
-0.1854043, 1.304986, -0.5925151, 0, 1, 0.4078431, 1,
-0.1838889, 0.9672086, 0.521786, 0, 1, 0.4117647, 1,
-0.1804904, -1.336552, -3.996848, 0, 1, 0.4196078, 1,
-0.1801941, -0.5433949, -4.280687, 0, 1, 0.4235294, 1,
-0.1799166, -0.5951221, -2.040592, 0, 1, 0.4313726, 1,
-0.1775746, 0.6138577, 0.563541, 0, 1, 0.4352941, 1,
-0.1761609, -0.8254087, -4.080268, 0, 1, 0.4431373, 1,
-0.1758013, -0.781531, -2.298833, 0, 1, 0.4470588, 1,
-0.1741706, -0.6984749, -3.653632, 0, 1, 0.454902, 1,
-0.1725711, 0.9871903, 0.5768672, 0, 1, 0.4588235, 1,
-0.1722241, -0.9997127, -2.159308, 0, 1, 0.4666667, 1,
-0.1667078, -0.208247, -3.218741, 0, 1, 0.4705882, 1,
-0.1663974, 2.331758, 1.033139, 0, 1, 0.4784314, 1,
-0.1630461, -1.312635, -5.016823, 0, 1, 0.4823529, 1,
-0.1628633, 0.2307228, -0.7310466, 0, 1, 0.4901961, 1,
-0.161978, -0.201184, -1.883646, 0, 1, 0.4941176, 1,
-0.1601378, 0.2231284, -0.8136719, 0, 1, 0.5019608, 1,
-0.1567467, 1.26647, 0.5141548, 0, 1, 0.509804, 1,
-0.1531641, -0.6146878, -3.154777, 0, 1, 0.5137255, 1,
-0.152558, 0.3203942, -0.1645396, 0, 1, 0.5215687, 1,
-0.150285, -1.449592, -2.89916, 0, 1, 0.5254902, 1,
-0.1470105, 0.6335381, -0.02542255, 0, 1, 0.5333334, 1,
-0.1463926, -1.719247, -3.079069, 0, 1, 0.5372549, 1,
-0.1408546, 0.7519032, -0.2276597, 0, 1, 0.5450981, 1,
-0.1392019, 0.7681956, -0.4360163, 0, 1, 0.5490196, 1,
-0.1364049, -0.7616525, -3.187642, 0, 1, 0.5568628, 1,
-0.1327446, -0.5295041, -2.553401, 0, 1, 0.5607843, 1,
-0.1315334, -0.1943781, -2.754213, 0, 1, 0.5686275, 1,
-0.1296648, -0.5386364, -1.483025, 0, 1, 0.572549, 1,
-0.1270606, -0.4422735, -4.440909, 0, 1, 0.5803922, 1,
-0.1255046, 1.750136, 0.1081229, 0, 1, 0.5843138, 1,
-0.123797, 0.3473075, -1.565889, 0, 1, 0.5921569, 1,
-0.1229519, 1.013874, -0.1213229, 0, 1, 0.5960785, 1,
-0.1180825, -0.8509762, -3.161726, 0, 1, 0.6039216, 1,
-0.109081, -1.731432, -3.92954, 0, 1, 0.6117647, 1,
-0.1025757, 0.2617581, 0.1873599, 0, 1, 0.6156863, 1,
-0.1017258, 0.2805425, 1.041259, 0, 1, 0.6235294, 1,
-0.0864296, 1.560613, -0.1740878, 0, 1, 0.627451, 1,
-0.07942863, 0.8051287, 0.5655799, 0, 1, 0.6352941, 1,
-0.07880843, 0.7221005, 0.5187671, 0, 1, 0.6392157, 1,
-0.07683622, 2.084038, 1.075949, 0, 1, 0.6470588, 1,
-0.0742071, -0.1553756, -1.535767, 0, 1, 0.6509804, 1,
-0.06717578, 0.2191644, -0.2924169, 0, 1, 0.6588235, 1,
-0.06670493, 0.3814222, -0.4107145, 0, 1, 0.6627451, 1,
-0.06597378, -0.1168703, -4.27079, 0, 1, 0.6705883, 1,
-0.06430963, 0.3347183, -0.7331499, 0, 1, 0.6745098, 1,
-0.06360672, -0.9838134, -2.080962, 0, 1, 0.682353, 1,
-0.05827599, -0.1183183, -0.4851669, 0, 1, 0.6862745, 1,
-0.0562456, -0.4153232, -3.082751, 0, 1, 0.6941177, 1,
-0.03878697, -0.8186277, -2.972401, 0, 1, 0.7019608, 1,
-0.03855735, 0.9689242, 2.304296, 0, 1, 0.7058824, 1,
-0.03742868, -1.682741, -3.746859, 0, 1, 0.7137255, 1,
-0.03683601, -0.03389851, -1.489629, 0, 1, 0.7176471, 1,
-0.03280901, -0.6324895, -1.18739, 0, 1, 0.7254902, 1,
-0.0279682, -0.1030811, -4.629651, 0, 1, 0.7294118, 1,
-0.02792636, 0.7032765, -0.5018433, 0, 1, 0.7372549, 1,
-0.02424944, 0.1087519, -2.676831, 0, 1, 0.7411765, 1,
-0.019793, -0.6317614, -3.13605, 0, 1, 0.7490196, 1,
-0.0192708, -0.6979486, -3.225161, 0, 1, 0.7529412, 1,
-0.0133591, -1.377166, -2.151466, 0, 1, 0.7607843, 1,
-0.01271502, -0.5706071, -3.837095, 0, 1, 0.7647059, 1,
-0.01208556, -0.08209201, -2.445336, 0, 1, 0.772549, 1,
-0.009515908, -1.065043, -3.279671, 0, 1, 0.7764706, 1,
-0.006705731, 0.3962561, -1.83178, 0, 1, 0.7843137, 1,
-0.00315087, -0.5657312, -2.157092, 0, 1, 0.7882353, 1,
-0.003074371, -0.02779542, -2.358433, 0, 1, 0.7960784, 1,
-0.001482917, -0.04972043, -2.402824, 0, 1, 0.8039216, 1,
0.0006610292, -0.6368515, 4.413733, 0, 1, 0.8078431, 1,
0.008639102, -1.303906, 3.324512, 0, 1, 0.8156863, 1,
0.01077133, -1.398536, 2.937828, 0, 1, 0.8196079, 1,
0.01266224, -0.6800387, 2.999519, 0, 1, 0.827451, 1,
0.01613561, 0.3741613, -0.9236614, 0, 1, 0.8313726, 1,
0.0177937, -1.526556, 1.370463, 0, 1, 0.8392157, 1,
0.01845205, -0.4094865, 3.491159, 0, 1, 0.8431373, 1,
0.01867358, -1.309208, 6.358092, 0, 1, 0.8509804, 1,
0.02188201, 0.8066279, 0.7173311, 0, 1, 0.854902, 1,
0.02282664, 0.2118403, -0.4653385, 0, 1, 0.8627451, 1,
0.02629339, 0.7444677, -2.307359, 0, 1, 0.8666667, 1,
0.02675994, -0.07127051, 1.95208, 0, 1, 0.8745098, 1,
0.02874607, 0.8737648, 0.769291, 0, 1, 0.8784314, 1,
0.02943443, 0.3667819, 0.442917, 0, 1, 0.8862745, 1,
0.0322903, 1.60686, 0.1481947, 0, 1, 0.8901961, 1,
0.03277782, 0.5923412, 0.8141559, 0, 1, 0.8980392, 1,
0.03490544, -0.08900181, 2.337534, 0, 1, 0.9058824, 1,
0.03751352, -1.607041, 3.140839, 0, 1, 0.9098039, 1,
0.03841239, 0.2737927, 0.5273669, 0, 1, 0.9176471, 1,
0.04038601, 1.1315, 0.07696775, 0, 1, 0.9215686, 1,
0.04081387, 0.6129013, -0.6653046, 0, 1, 0.9294118, 1,
0.04180081, -0.3746536, 4.731886, 0, 1, 0.9333333, 1,
0.04194785, 1.31918, 0.6530704, 0, 1, 0.9411765, 1,
0.04288122, 2.600755, -1.563695, 0, 1, 0.945098, 1,
0.04489774, 0.2272199, -0.5548112, 0, 1, 0.9529412, 1,
0.05249687, 0.1641846, 0.5774441, 0, 1, 0.9568627, 1,
0.05272801, 1.237437, -1.583865, 0, 1, 0.9647059, 1,
0.05300907, -2.634742, 3.677501, 0, 1, 0.9686275, 1,
0.05303672, -1.90068, 1.569962, 0, 1, 0.9764706, 1,
0.05611897, 0.08738593, 1.607196, 0, 1, 0.9803922, 1,
0.0648857, 0.3302152, -0.4294496, 0, 1, 0.9882353, 1,
0.06563394, 1.656458, -0.5725667, 0, 1, 0.9921569, 1,
0.06617842, 0.546262, 1.202431, 0, 1, 1, 1,
0.06739043, 0.9665676, -1.203352, 0, 0.9921569, 1, 1,
0.06902619, -0.36162, 1.768832, 0, 0.9882353, 1, 1,
0.07116916, -0.3677103, 3.65428, 0, 0.9803922, 1, 1,
0.08659656, 2.058999, 0.9308516, 0, 0.9764706, 1, 1,
0.09076349, 0.0552306, 3.322106, 0, 0.9686275, 1, 1,
0.09233476, -0.7283471, 5.520117, 0, 0.9647059, 1, 1,
0.09669966, -0.8775603, 1.34812, 0, 0.9568627, 1, 1,
0.1029096, 1.279666, -1.383555, 0, 0.9529412, 1, 1,
0.1055462, -1.872251, 3.190598, 0, 0.945098, 1, 1,
0.1072234, 0.03518698, 1.421844, 0, 0.9411765, 1, 1,
0.1099417, -2.936667, 2.370789, 0, 0.9333333, 1, 1,
0.1160656, -0.2671491, 3.428293, 0, 0.9294118, 1, 1,
0.1161935, -0.9989052, 4.293704, 0, 0.9215686, 1, 1,
0.1167698, -1.478125, 1.549808, 0, 0.9176471, 1, 1,
0.1192663, -1.266138, 3.070301, 0, 0.9098039, 1, 1,
0.1205314, 0.2086703, 1.043801, 0, 0.9058824, 1, 1,
0.1258178, -0.4280732, 3.08362, 0, 0.8980392, 1, 1,
0.1261617, 0.1600208, 0.4808902, 0, 0.8901961, 1, 1,
0.1293326, -1.220193, 4.458565, 0, 0.8862745, 1, 1,
0.1314069, -1.46388, 5.388513, 0, 0.8784314, 1, 1,
0.1329044, 0.3236132, -1.3508, 0, 0.8745098, 1, 1,
0.1358412, -0.3575667, 4.37152, 0, 0.8666667, 1, 1,
0.1367736, -2.069262, 3.569243, 0, 0.8627451, 1, 1,
0.1395483, -1.462816, 4.03987, 0, 0.854902, 1, 1,
0.1413416, 0.8180011, 0.2251683, 0, 0.8509804, 1, 1,
0.1430139, 0.1621296, -0.5471452, 0, 0.8431373, 1, 1,
0.1445749, 0.2362762, -0.6935281, 0, 0.8392157, 1, 1,
0.1449303, -0.3033774, 1.489987, 0, 0.8313726, 1, 1,
0.1452601, -0.04722444, 0.3316965, 0, 0.827451, 1, 1,
0.1481955, 0.737912, 0.4717073, 0, 0.8196079, 1, 1,
0.1503815, -0.3304204, 4.579939, 0, 0.8156863, 1, 1,
0.1558544, 2.150984, -0.6272815, 0, 0.8078431, 1, 1,
0.1562082, 0.03827061, 1.786512, 0, 0.8039216, 1, 1,
0.156969, -0.741186, 3.044616, 0, 0.7960784, 1, 1,
0.1581558, 0.3604786, 1.761072, 0, 0.7882353, 1, 1,
0.1597861, 0.842461, 0.3954839, 0, 0.7843137, 1, 1,
0.1620796, -0.3016731, 4.34341, 0, 0.7764706, 1, 1,
0.1621161, 0.4550049, 1.776806, 0, 0.772549, 1, 1,
0.1623525, 2.055457, 0.2239205, 0, 0.7647059, 1, 1,
0.1625651, -0.1770046, 1.88753, 0, 0.7607843, 1, 1,
0.1632645, 1.778, -0.1339774, 0, 0.7529412, 1, 1,
0.1637383, 0.8093382, 0.3271964, 0, 0.7490196, 1, 1,
0.1637736, -0.9360348, 3.054891, 0, 0.7411765, 1, 1,
0.1701593, 0.3454293, 2.083938, 0, 0.7372549, 1, 1,
0.1735869, -0.3853427, 2.296879, 0, 0.7294118, 1, 1,
0.1747277, -1.262711, 2.545506, 0, 0.7254902, 1, 1,
0.1782803, 0.3355494, 0.3185838, 0, 0.7176471, 1, 1,
0.1816751, -0.6002453, 2.825031, 0, 0.7137255, 1, 1,
0.183345, -0.2181914, 1.786976, 0, 0.7058824, 1, 1,
0.1849264, 0.5644911, 0.09654178, 0, 0.6980392, 1, 1,
0.1869331, -0.2085303, 2.370636, 0, 0.6941177, 1, 1,
0.1873289, 0.6488032, 0.6780838, 0, 0.6862745, 1, 1,
0.1895578, 1.098749, 0.8840444, 0, 0.682353, 1, 1,
0.1907444, 0.1675102, 0.8316799, 0, 0.6745098, 1, 1,
0.1912631, -0.9173436, 5.12365, 0, 0.6705883, 1, 1,
0.1920027, -0.7460513, 2.047033, 0, 0.6627451, 1, 1,
0.1937883, -0.603453, 4.05658, 0, 0.6588235, 1, 1,
0.1971488, -1.598123, 2.875568, 0, 0.6509804, 1, 1,
0.2044617, 1.826418, 1.388904, 0, 0.6470588, 1, 1,
0.2095209, -0.6751704, 4.018598, 0, 0.6392157, 1, 1,
0.2114465, 1.547784, -0.1628764, 0, 0.6352941, 1, 1,
0.2122692, -1.44916, 2.764489, 0, 0.627451, 1, 1,
0.2131156, 2.073936, 0.9491034, 0, 0.6235294, 1, 1,
0.2136951, 0.3568705, 0.6498031, 0, 0.6156863, 1, 1,
0.2180851, -1.15793, 2.405135, 0, 0.6117647, 1, 1,
0.2200443, -0.5937611, 1.857675, 0, 0.6039216, 1, 1,
0.2207634, 1.022983, 0.9141656, 0, 0.5960785, 1, 1,
0.223176, 1.502219, -1.097282, 0, 0.5921569, 1, 1,
0.2237546, 1.378565, -0.5491968, 0, 0.5843138, 1, 1,
0.2261467, -1.908001, 1.880777, 0, 0.5803922, 1, 1,
0.2261526, -0.9210448, 3.095779, 0, 0.572549, 1, 1,
0.2262849, -0.03284073, 1.529766, 0, 0.5686275, 1, 1,
0.2325906, -0.06327468, 2.843599, 0, 0.5607843, 1, 1,
0.2374647, -0.4764341, 5.236248, 0, 0.5568628, 1, 1,
0.2376515, 0.5208607, 1.221092, 0, 0.5490196, 1, 1,
0.2377746, 0.5114316, -1.037433, 0, 0.5450981, 1, 1,
0.2386874, 1.544173, -0.6034353, 0, 0.5372549, 1, 1,
0.2405456, 0.8746023, 0.6206656, 0, 0.5333334, 1, 1,
0.2450505, 1.004076, -0.6357279, 0, 0.5254902, 1, 1,
0.2454335, 0.6556199, -1.118993, 0, 0.5215687, 1, 1,
0.24678, 1.402955, 0.3053083, 0, 0.5137255, 1, 1,
0.2470734, -0.7820228, 4.314115, 0, 0.509804, 1, 1,
0.247268, 1.047894, 0.5611109, 0, 0.5019608, 1, 1,
0.2476701, 1.09504, -0.8623941, 0, 0.4941176, 1, 1,
0.2487481, -0.2103059, 1.406744, 0, 0.4901961, 1, 1,
0.2496339, 0.2083569, 2.284678, 0, 0.4823529, 1, 1,
0.2504462, -0.4538514, 4.753875, 0, 0.4784314, 1, 1,
0.2505706, 1.313391, 0.5196128, 0, 0.4705882, 1, 1,
0.2548453, 0.4524008, 0.3955293, 0, 0.4666667, 1, 1,
0.2601549, -1.335086, 3.034618, 0, 0.4588235, 1, 1,
0.2634681, 0.05536271, 0.9634935, 0, 0.454902, 1, 1,
0.2692443, 0.1656281, 1.340942, 0, 0.4470588, 1, 1,
0.2731856, 0.3735149, 0.01885704, 0, 0.4431373, 1, 1,
0.2745261, -0.9619622, 1.5135, 0, 0.4352941, 1, 1,
0.2750095, 1.296698, -0.2271, 0, 0.4313726, 1, 1,
0.2767812, -2.73779, 4.143133, 0, 0.4235294, 1, 1,
0.2855751, 0.7047649, -0.1924956, 0, 0.4196078, 1, 1,
0.2908697, 1.367659, -0.1585875, 0, 0.4117647, 1, 1,
0.2916455, 0.327617, 0.6038427, 0, 0.4078431, 1, 1,
0.2957712, -0.4399455, 2.585445, 0, 0.4, 1, 1,
0.300343, 0.3511795, 1.018636, 0, 0.3921569, 1, 1,
0.3030609, -0.6080882, 2.060095, 0, 0.3882353, 1, 1,
0.3039474, 0.5808603, -1.209226, 0, 0.3803922, 1, 1,
0.3043064, -0.3117909, 0.6864656, 0, 0.3764706, 1, 1,
0.3046931, -1.078892, 4.291599, 0, 0.3686275, 1, 1,
0.3050023, -1.142541, 3.895271, 0, 0.3647059, 1, 1,
0.307544, 1.591974, 0.1393399, 0, 0.3568628, 1, 1,
0.3075962, 0.04424757, 1.117354, 0, 0.3529412, 1, 1,
0.3124622, -1.026294, 4.115753, 0, 0.345098, 1, 1,
0.3129143, -1.200783, 2.751146, 0, 0.3411765, 1, 1,
0.3163088, 0.6145275, -0.2216474, 0, 0.3333333, 1, 1,
0.319039, 1.311019, 0.8976869, 0, 0.3294118, 1, 1,
0.3230667, -0.3320721, 3.787477, 0, 0.3215686, 1, 1,
0.3276748, -1.095225, 0.9697407, 0, 0.3176471, 1, 1,
0.3281097, 1.903993, -0.1688021, 0, 0.3098039, 1, 1,
0.3298195, -0.9817099, 2.829975, 0, 0.3058824, 1, 1,
0.3301359, -0.01813085, 2.85446, 0, 0.2980392, 1, 1,
0.3317663, 0.3059816, 1.432238, 0, 0.2901961, 1, 1,
0.3317788, 0.1320066, -0.1050004, 0, 0.2862745, 1, 1,
0.3329335, -2.075589, 2.446484, 0, 0.2784314, 1, 1,
0.3341129, 0.3664518, 0.7828072, 0, 0.2745098, 1, 1,
0.3349246, 0.3188522, 0.9449852, 0, 0.2666667, 1, 1,
0.3360728, -0.3384282, 1.26623, 0, 0.2627451, 1, 1,
0.3365542, -0.2142132, 3.351222, 0, 0.254902, 1, 1,
0.3379807, 0.4960636, -1.51693, 0, 0.2509804, 1, 1,
0.3384038, -0.1684534, 2.108947, 0, 0.2431373, 1, 1,
0.3430997, -0.2713731, 1.133755, 0, 0.2392157, 1, 1,
0.34317, 0.9409629, 0.09117809, 0, 0.2313726, 1, 1,
0.3537799, 0.1948601, 0.2934411, 0, 0.227451, 1, 1,
0.3551715, 0.7266379, 1.230685, 0, 0.2196078, 1, 1,
0.358632, 1.757968, 0.6086263, 0, 0.2156863, 1, 1,
0.3597791, 0.8094077, 0.9806766, 0, 0.2078431, 1, 1,
0.3643698, -0.4741437, 1.403331, 0, 0.2039216, 1, 1,
0.3650914, -1.855037, 2.028091, 0, 0.1960784, 1, 1,
0.3651708, -0.4116641, 2.402738, 0, 0.1882353, 1, 1,
0.3703051, 1.103588, 0.07145665, 0, 0.1843137, 1, 1,
0.3753667, 0.5014324, -0.2983918, 0, 0.1764706, 1, 1,
0.3779646, -0.0364139, 3.133561, 0, 0.172549, 1, 1,
0.3794175, 0.002226923, -0.151287, 0, 0.1647059, 1, 1,
0.381685, 1.25686, -0.009001158, 0, 0.1607843, 1, 1,
0.384536, 1.495696, 0.8971521, 0, 0.1529412, 1, 1,
0.3866098, 0.3027528, 0.4283846, 0, 0.1490196, 1, 1,
0.3877563, -0.1330286, 2.519608, 0, 0.1411765, 1, 1,
0.39474, -0.3889129, 4.423863, 0, 0.1372549, 1, 1,
0.4019135, 0.4781606, 1.692248, 0, 0.1294118, 1, 1,
0.40536, 0.6388394, 0.9853954, 0, 0.1254902, 1, 1,
0.4056614, -0.5464256, 3.397493, 0, 0.1176471, 1, 1,
0.4085062, -0.7951871, 2.696478, 0, 0.1137255, 1, 1,
0.4142327, -2.050336, 1.76663, 0, 0.1058824, 1, 1,
0.4153609, -0.2670853, 2.082342, 0, 0.09803922, 1, 1,
0.4188299, 0.2952052, 1.25534, 0, 0.09411765, 1, 1,
0.4191957, -0.0123155, 1.126012, 0, 0.08627451, 1, 1,
0.4195197, 0.1110947, 0.3339577, 0, 0.08235294, 1, 1,
0.4354873, 1.809564, -0.4141822, 0, 0.07450981, 1, 1,
0.437476, -0.9838256, 2.114496, 0, 0.07058824, 1, 1,
0.4390365, 1.340929, -0.3041122, 0, 0.0627451, 1, 1,
0.4398421, -2.351609, 1.300866, 0, 0.05882353, 1, 1,
0.4419838, 0.07274591, 1.215232, 0, 0.05098039, 1, 1,
0.4432036, 0.2554476, 1.262753, 0, 0.04705882, 1, 1,
0.4486007, -0.02189877, 1.267216, 0, 0.03921569, 1, 1,
0.4511234, 1.297148, 0.6271372, 0, 0.03529412, 1, 1,
0.4516684, 0.2588258, 1.937664, 0, 0.02745098, 1, 1,
0.45706, 0.01841018, 0.1750595, 0, 0.02352941, 1, 1,
0.4600744, -0.9260826, 3.800735, 0, 0.01568628, 1, 1,
0.4637903, -0.4866281, 2.955521, 0, 0.01176471, 1, 1,
0.4645159, -0.6186669, 2.088331, 0, 0.003921569, 1, 1,
0.4667712, 0.5547419, -1.706221, 0.003921569, 0, 1, 1,
0.4703217, 0.2233858, 0.2897798, 0.007843138, 0, 1, 1,
0.4850983, -0.006531521, 1.10826, 0.01568628, 0, 1, 1,
0.489707, 0.05511115, 1.816559, 0.01960784, 0, 1, 1,
0.492238, 2.539423, 0.8358585, 0.02745098, 0, 1, 1,
0.4924251, 0.581587, 0.6214947, 0.03137255, 0, 1, 1,
0.493101, -0.5224698, 3.151556, 0.03921569, 0, 1, 1,
0.4936095, -0.2220041, 0.4928949, 0.04313726, 0, 1, 1,
0.4959574, -0.003945819, 3.97267, 0.05098039, 0, 1, 1,
0.4982034, -0.5850537, 1.388889, 0.05490196, 0, 1, 1,
0.5035053, 1.910982, 0.06623094, 0.0627451, 0, 1, 1,
0.503579, 0.006825596, 1.628595, 0.06666667, 0, 1, 1,
0.505209, -0.2045978, 1.4056, 0.07450981, 0, 1, 1,
0.5065384, -0.8825375, 1.595925, 0.07843138, 0, 1, 1,
0.521099, -0.9114803, 1.342289, 0.08627451, 0, 1, 1,
0.5227595, -0.09289622, 2.534811, 0.09019608, 0, 1, 1,
0.5235115, -1.763212, 3.363473, 0.09803922, 0, 1, 1,
0.5248433, 0.3864291, 1.512212, 0.1058824, 0, 1, 1,
0.5261133, -0.1716633, 2.766289, 0.1098039, 0, 1, 1,
0.5359872, 0.2516634, 2.597562, 0.1176471, 0, 1, 1,
0.536145, 0.1258204, 0.7426333, 0.1215686, 0, 1, 1,
0.5386378, 1.219395, 0.2946289, 0.1294118, 0, 1, 1,
0.5447997, -1.029666, 1.120579, 0.1333333, 0, 1, 1,
0.5453, 0.5936375, 2.614612, 0.1411765, 0, 1, 1,
0.5454832, 0.3959638, 2.422404, 0.145098, 0, 1, 1,
0.5480783, 0.7467185, 0.3751946, 0.1529412, 0, 1, 1,
0.5536243, 0.6304311, 0.2774529, 0.1568628, 0, 1, 1,
0.5544743, 1.357331, 0.8683051, 0.1647059, 0, 1, 1,
0.5579481, 2.859063, 0.3330622, 0.1686275, 0, 1, 1,
0.55981, -0.1621136, 1.4447, 0.1764706, 0, 1, 1,
0.5643122, 0.746931, 0.8235282, 0.1803922, 0, 1, 1,
0.5651816, -0.4458731, 1.862923, 0.1882353, 0, 1, 1,
0.566156, -2.353695, 3.592042, 0.1921569, 0, 1, 1,
0.5663572, 0.7936229, 0.5048656, 0.2, 0, 1, 1,
0.5667112, -1.394973, 1.951768, 0.2078431, 0, 1, 1,
0.5696441, 1.704688, -0.3131052, 0.2117647, 0, 1, 1,
0.5699918, 0.5099511, -0.9914793, 0.2196078, 0, 1, 1,
0.5707008, -1.344208, 1.013087, 0.2235294, 0, 1, 1,
0.572987, 0.8009832, 0.2202097, 0.2313726, 0, 1, 1,
0.5733086, 0.1514649, 3.719566, 0.2352941, 0, 1, 1,
0.5736972, 0.666472, 0.0553037, 0.2431373, 0, 1, 1,
0.5742434, 0.9724487, 0.6200513, 0.2470588, 0, 1, 1,
0.5750984, 0.5327201, -0.07659185, 0.254902, 0, 1, 1,
0.5959525, -1.260118, 2.514812, 0.2588235, 0, 1, 1,
0.5964905, -0.329781, 3.364193, 0.2666667, 0, 1, 1,
0.5969796, 2.108202, 0.7381307, 0.2705882, 0, 1, 1,
0.598088, 0.8701682, 1.029772, 0.2784314, 0, 1, 1,
0.6053549, -0.699247, 3.648371, 0.282353, 0, 1, 1,
0.6072354, 0.6462922, 1.267187, 0.2901961, 0, 1, 1,
0.6110452, -0.84583, 2.470293, 0.2941177, 0, 1, 1,
0.6128833, -0.7175958, 3.513216, 0.3019608, 0, 1, 1,
0.6155137, -1.405475, 2.699146, 0.3098039, 0, 1, 1,
0.6176999, 0.6935753, -0.2935104, 0.3137255, 0, 1, 1,
0.6192227, -1.113898, 3.170413, 0.3215686, 0, 1, 1,
0.6192728, -1.349695, 2.437479, 0.3254902, 0, 1, 1,
0.6269723, 0.1533032, -1.417593, 0.3333333, 0, 1, 1,
0.6283893, 0.6407251, 1.289499, 0.3372549, 0, 1, 1,
0.6312257, -0.469346, 2.914604, 0.345098, 0, 1, 1,
0.6333006, -0.5571219, 2.617125, 0.3490196, 0, 1, 1,
0.6338331, 0.2212101, -0.1078961, 0.3568628, 0, 1, 1,
0.6348212, -0.8368146, 2.228329, 0.3607843, 0, 1, 1,
0.6396773, 1.6895, 2.029231, 0.3686275, 0, 1, 1,
0.6409544, -0.6498452, 3.302172, 0.372549, 0, 1, 1,
0.6411888, 0.5818397, 2.413476, 0.3803922, 0, 1, 1,
0.6430631, -0.9919147, 3.377283, 0.3843137, 0, 1, 1,
0.643246, 2.457334, -0.5944817, 0.3921569, 0, 1, 1,
0.64537, 0.4876857, 1.493976, 0.3960784, 0, 1, 1,
0.6516641, 2.827881, 1.139345, 0.4039216, 0, 1, 1,
0.6540963, -1.427657, 2.98346, 0.4117647, 0, 1, 1,
0.6631265, -0.1900268, 1.251116, 0.4156863, 0, 1, 1,
0.6644737, 0.3622469, 0.6782125, 0.4235294, 0, 1, 1,
0.6677884, 1.57391, -1.068656, 0.427451, 0, 1, 1,
0.671095, 0.6626915, 1.313149, 0.4352941, 0, 1, 1,
0.6752721, 1.665988, 0.4558963, 0.4392157, 0, 1, 1,
0.6795911, 0.601503, 1.492551, 0.4470588, 0, 1, 1,
0.6813869, -0.52111, 1.758376, 0.4509804, 0, 1, 1,
0.6924101, 1.065182, 0.9261639, 0.4588235, 0, 1, 1,
0.6925849, -1.625494, 3.233611, 0.4627451, 0, 1, 1,
0.7067528, -1.418542, 1.447912, 0.4705882, 0, 1, 1,
0.7095156, -2.498768, 3.800703, 0.4745098, 0, 1, 1,
0.7095345, 1.040967, -0.2917965, 0.4823529, 0, 1, 1,
0.7118685, 0.2995557, 2.162908, 0.4862745, 0, 1, 1,
0.7155165, -0.6582215, 1.483151, 0.4941176, 0, 1, 1,
0.7159717, 3.114799, 1.154113, 0.5019608, 0, 1, 1,
0.7168871, 0.08585004, 0.8597321, 0.5058824, 0, 1, 1,
0.7215591, -0.163449, 1.575798, 0.5137255, 0, 1, 1,
0.7221153, 0.3419619, 0.9403425, 0.5176471, 0, 1, 1,
0.7281892, 0.6335488, -0.6720728, 0.5254902, 0, 1, 1,
0.7291691, -0.9303039, 2.270899, 0.5294118, 0, 1, 1,
0.736107, 0.3322043, 1.194673, 0.5372549, 0, 1, 1,
0.7517482, -0.7448345, 2.155648, 0.5411765, 0, 1, 1,
0.7519128, 0.953792, -0.873437, 0.5490196, 0, 1, 1,
0.7541744, 2.549894, -0.4814177, 0.5529412, 0, 1, 1,
0.7558524, 0.8025516, 2.339744, 0.5607843, 0, 1, 1,
0.756978, -0.3110953, 1.005894, 0.5647059, 0, 1, 1,
0.7599571, 0.7732748, 2.11728, 0.572549, 0, 1, 1,
0.764528, 0.2429462, 1.778096, 0.5764706, 0, 1, 1,
0.7686217, -0.717992, 1.040207, 0.5843138, 0, 1, 1,
0.7764328, -0.01483397, 2.832013, 0.5882353, 0, 1, 1,
0.7786672, 0.4433343, 1.360941, 0.5960785, 0, 1, 1,
0.7801253, 1.727695, 0.117951, 0.6039216, 0, 1, 1,
0.7874554, 0.6068203, -0.35038, 0.6078432, 0, 1, 1,
0.7883573, -0.2906177, 1.764733, 0.6156863, 0, 1, 1,
0.790773, -0.9187905, 2.235198, 0.6196079, 0, 1, 1,
0.7908946, 1.837791, 0.1072225, 0.627451, 0, 1, 1,
0.7915384, 0.6975418, 3.400797, 0.6313726, 0, 1, 1,
0.8057789, 0.1824645, 0.3027205, 0.6392157, 0, 1, 1,
0.807819, 0.04388867, 1.901942, 0.6431373, 0, 1, 1,
0.8088838, 0.6697664, -0.03656389, 0.6509804, 0, 1, 1,
0.8155881, 0.07282473, 3.440518, 0.654902, 0, 1, 1,
0.8165684, 0.1676299, 1.37565, 0.6627451, 0, 1, 1,
0.8195609, 0.3371012, 2.303848, 0.6666667, 0, 1, 1,
0.8217878, -0.1879224, -0.2325932, 0.6745098, 0, 1, 1,
0.8240005, 2.145894, -0.06928273, 0.6784314, 0, 1, 1,
0.8309094, -1.324461, 1.556012, 0.6862745, 0, 1, 1,
0.8387834, -1.168535, 2.540288, 0.6901961, 0, 1, 1,
0.8391703, -0.2152974, 2.16796, 0.6980392, 0, 1, 1,
0.8399574, 0.01422281, 2.203276, 0.7058824, 0, 1, 1,
0.841346, 0.7820219, -0.9215661, 0.7098039, 0, 1, 1,
0.8440961, -0.6894584, 2.42108, 0.7176471, 0, 1, 1,
0.8442627, -0.3893864, 2.030719, 0.7215686, 0, 1, 1,
0.8447854, 0.49621, 0.5557235, 0.7294118, 0, 1, 1,
0.8497822, -0.5063046, 2.245622, 0.7333333, 0, 1, 1,
0.8499232, 1.299081, 1.055604, 0.7411765, 0, 1, 1,
0.8539276, 1.547935, 1.572378, 0.7450981, 0, 1, 1,
0.8540638, 1.165532, 0.2711499, 0.7529412, 0, 1, 1,
0.8544405, 0.6667635, -0.903384, 0.7568628, 0, 1, 1,
0.8558009, -0.01581329, 2.883568, 0.7647059, 0, 1, 1,
0.8582472, -2.549013, 2.659721, 0.7686275, 0, 1, 1,
0.8605948, 1.631378, 1.888242, 0.7764706, 0, 1, 1,
0.8616903, -0.31449, 0.9237301, 0.7803922, 0, 1, 1,
0.8687567, -0.2769012, 1.102681, 0.7882353, 0, 1, 1,
0.8705561, 0.7672098, -0.01661776, 0.7921569, 0, 1, 1,
0.8712651, -1.664265, 3.798426, 0.8, 0, 1, 1,
0.8738036, -0.4094316, 0.7190873, 0.8078431, 0, 1, 1,
0.8738577, -1.201657, 2.254557, 0.8117647, 0, 1, 1,
0.8853361, -1.922845, 4.822145, 0.8196079, 0, 1, 1,
0.8927295, -0.6659904, 3.308224, 0.8235294, 0, 1, 1,
0.8951036, -1.668707, 2.437917, 0.8313726, 0, 1, 1,
0.8955886, 0.7773301, 1.685633, 0.8352941, 0, 1, 1,
0.8963392, 0.1952922, 0.1330823, 0.8431373, 0, 1, 1,
0.9008449, -0.7004567, 1.526031, 0.8470588, 0, 1, 1,
0.9105803, -0.05426729, 1.313684, 0.854902, 0, 1, 1,
0.9105998, 0.02203231, 2.398221, 0.8588235, 0, 1, 1,
0.915086, -1.86961, 2.698748, 0.8666667, 0, 1, 1,
0.9183171, -2.005966, 2.629026, 0.8705882, 0, 1, 1,
0.9183597, -0.7246104, 2.316774, 0.8784314, 0, 1, 1,
0.9233572, 0.7401226, -0.1424705, 0.8823529, 0, 1, 1,
0.9261024, -0.4717939, 3.81545, 0.8901961, 0, 1, 1,
0.9279159, -0.5041994, 1.398185, 0.8941177, 0, 1, 1,
0.9283554, -1.417609, 0.8138197, 0.9019608, 0, 1, 1,
0.9284332, -1.360286, 4.002483, 0.9098039, 0, 1, 1,
0.9346234, 1.821572, -0.3938296, 0.9137255, 0, 1, 1,
0.9355779, -0.1690631, 2.92335, 0.9215686, 0, 1, 1,
0.9364082, -0.01718764, 1.731872, 0.9254902, 0, 1, 1,
0.9469789, 0.9183615, 0.7900145, 0.9333333, 0, 1, 1,
0.9474895, 0.4084132, 1.400561, 0.9372549, 0, 1, 1,
0.9477068, -0.5527663, 0.02994469, 0.945098, 0, 1, 1,
0.9478156, 1.949912, 0.09328625, 0.9490196, 0, 1, 1,
0.9489055, -0.2436497, 2.786073, 0.9568627, 0, 1, 1,
0.9509674, 1.120764, 1.452488, 0.9607843, 0, 1, 1,
0.9535728, 0.4990097, -0.508041, 0.9686275, 0, 1, 1,
0.9790217, -0.9912744, 1.704731, 0.972549, 0, 1, 1,
0.9939757, 0.06131349, 1.010328, 0.9803922, 0, 1, 1,
1.004956, -1.71041, 1.865069, 0.9843137, 0, 1, 1,
1.012481, 1.582133, 1.598213, 0.9921569, 0, 1, 1,
1.013663, -0.5058089, 3.621763, 0.9960784, 0, 1, 1,
1.014822, -0.7210945, 2.04243, 1, 0, 0.9960784, 1,
1.022764, 0.2157563, 1.429383, 1, 0, 0.9882353, 1,
1.026872, 0.1127753, 1.147126, 1, 0, 0.9843137, 1,
1.028397, -1.54189, 1.529088, 1, 0, 0.9764706, 1,
1.036494, -2.127031, 3.008343, 1, 0, 0.972549, 1,
1.047446, -1.614274, 1.894276, 1, 0, 0.9647059, 1,
1.051692, 0.7347687, 2.070279, 1, 0, 0.9607843, 1,
1.056365, 0.543918, 2.326056, 1, 0, 0.9529412, 1,
1.060128, 1.672634, 2.619334, 1, 0, 0.9490196, 1,
1.064063, -1.489463, 2.791416, 1, 0, 0.9411765, 1,
1.074229, 0.4068764, 1.551908, 1, 0, 0.9372549, 1,
1.076997, 0.6120004, -0.6217893, 1, 0, 0.9294118, 1,
1.080196, 1.256518, -1.183116, 1, 0, 0.9254902, 1,
1.081179, -0.09087597, 0.792523, 1, 0, 0.9176471, 1,
1.08241, -0.1665015, 3.632899, 1, 0, 0.9137255, 1,
1.08507, 1.160431, 0.2850808, 1, 0, 0.9058824, 1,
1.085251, 0.4858449, 0.9201136, 1, 0, 0.9019608, 1,
1.088249, 2.492619, 0.9173625, 1, 0, 0.8941177, 1,
1.089241, -1.089838, 2.140492, 1, 0, 0.8862745, 1,
1.101577, 0.07338709, 3.285141, 1, 0, 0.8823529, 1,
1.106508, 1.48998, 1.184342, 1, 0, 0.8745098, 1,
1.110502, -1.983817, 2.332329, 1, 0, 0.8705882, 1,
1.112379, 0.6512612, 0.8868574, 1, 0, 0.8627451, 1,
1.112554, -0.4904397, 2.943383, 1, 0, 0.8588235, 1,
1.115737, -0.5110461, 1.363935, 1, 0, 0.8509804, 1,
1.116312, 0.831923, 1.566847, 1, 0, 0.8470588, 1,
1.117566, -0.6534551, 1.302805, 1, 0, 0.8392157, 1,
1.119516, 1.322924, 1.269755, 1, 0, 0.8352941, 1,
1.13743, -1.676066, 1.395598, 1, 0, 0.827451, 1,
1.145674, -1.428424, 3.761326, 1, 0, 0.8235294, 1,
1.147896, -0.5483432, 1.980497, 1, 0, 0.8156863, 1,
1.150677, 0.9332024, 0.8162974, 1, 0, 0.8117647, 1,
1.156777, -1.796267, 3.828444, 1, 0, 0.8039216, 1,
1.162023, -1.234409, 2.182291, 1, 0, 0.7960784, 1,
1.163287, -1.155587, 3.159909, 1, 0, 0.7921569, 1,
1.172936, -0.807474, -0.3052075, 1, 0, 0.7843137, 1,
1.175897, -0.408974, 0.01707122, 1, 0, 0.7803922, 1,
1.192209, 0.3894607, -1.138767, 1, 0, 0.772549, 1,
1.194236, 0.1226594, 1.714573, 1, 0, 0.7686275, 1,
1.1964, -0.1817092, -0.02719101, 1, 0, 0.7607843, 1,
1.20239, 0.5768821, 0.5966361, 1, 0, 0.7568628, 1,
1.202733, 1.130037, -0.2227756, 1, 0, 0.7490196, 1,
1.206194, -0.5337206, 1.979485, 1, 0, 0.7450981, 1,
1.207571, 0.3124117, 1.906155, 1, 0, 0.7372549, 1,
1.215938, 0.1411911, 2.305514, 1, 0, 0.7333333, 1,
1.21724, -0.6709523, 1.711829, 1, 0, 0.7254902, 1,
1.235819, -0.1812897, 3.049537, 1, 0, 0.7215686, 1,
1.249503, -0.3740853, 2.257028, 1, 0, 0.7137255, 1,
1.250831, -1.119563, 1.975327, 1, 0, 0.7098039, 1,
1.262276, -0.5538681, 1.117273, 1, 0, 0.7019608, 1,
1.26522, 0.197562, 2.741178, 1, 0, 0.6941177, 1,
1.26523, -0.08109391, 1.147668, 1, 0, 0.6901961, 1,
1.267265, -1.116574, 2.615494, 1, 0, 0.682353, 1,
1.271553, -0.691432, 1.357286, 1, 0, 0.6784314, 1,
1.275517, -0.1254528, 2.936486, 1, 0, 0.6705883, 1,
1.283915, -0.6819088, 3.287403, 1, 0, 0.6666667, 1,
1.284688, 1.545064, 0.02926756, 1, 0, 0.6588235, 1,
1.290187, 0.6719744, 1.363946, 1, 0, 0.654902, 1,
1.290388, -0.4256513, 2.244794, 1, 0, 0.6470588, 1,
1.295936, 0.6235633, 0.9306123, 1, 0, 0.6431373, 1,
1.297092, -1.675162, 2.172295, 1, 0, 0.6352941, 1,
1.301512, 0.3873351, 2.472991, 1, 0, 0.6313726, 1,
1.306508, -0.7396516, 1.442332, 1, 0, 0.6235294, 1,
1.311003, -2.230911, 3.820561, 1, 0, 0.6196079, 1,
1.325016, 0.2850774, 1.172673, 1, 0, 0.6117647, 1,
1.327918, 0.7089943, 2.160727, 1, 0, 0.6078432, 1,
1.328846, 0.3127333, 4.585503, 1, 0, 0.6, 1,
1.3371, 0.9074309, 0.884402, 1, 0, 0.5921569, 1,
1.337322, 1.234139, -0.6021146, 1, 0, 0.5882353, 1,
1.348329, -0.09910304, 2.258146, 1, 0, 0.5803922, 1,
1.35029, -0.1691689, 0.6855059, 1, 0, 0.5764706, 1,
1.361385, -1.428595, 3.334502, 1, 0, 0.5686275, 1,
1.361486, 1.142598, -0.3557791, 1, 0, 0.5647059, 1,
1.363622, 0.2755445, 1.898549, 1, 0, 0.5568628, 1,
1.36761, 0.6819549, 1.155424, 1, 0, 0.5529412, 1,
1.376727, -0.3085106, 2.006531, 1, 0, 0.5450981, 1,
1.381208, 0.3231869, 2.145409, 1, 0, 0.5411765, 1,
1.407424, 1.428486, -0.2753297, 1, 0, 0.5333334, 1,
1.410663, 1.896297, 0.9619123, 1, 0, 0.5294118, 1,
1.417284, -0.4947081, 1.928226, 1, 0, 0.5215687, 1,
1.41986, -0.7423452, 3.898413, 1, 0, 0.5176471, 1,
1.425404, 0.6572703, 1.032279, 1, 0, 0.509804, 1,
1.440285, 1.395199, 0.5215015, 1, 0, 0.5058824, 1,
1.443721, 0.822061, -0.530479, 1, 0, 0.4980392, 1,
1.446093, 0.2520342, 2.158485, 1, 0, 0.4901961, 1,
1.447233, 0.1583973, 1.842632, 1, 0, 0.4862745, 1,
1.455734, 0.03710199, 1.792267, 1, 0, 0.4784314, 1,
1.465812, 0.1110086, 1.21025, 1, 0, 0.4745098, 1,
1.465982, -0.8530559, 1.062, 1, 0, 0.4666667, 1,
1.468851, -0.5624471, 2.062275, 1, 0, 0.4627451, 1,
1.473868, -0.03713122, 2.170039, 1, 0, 0.454902, 1,
1.488017, -1.031985, 2.955727, 1, 0, 0.4509804, 1,
1.506938, 1.952819, 1.034834, 1, 0, 0.4431373, 1,
1.511461, -0.4666062, 2.372499, 1, 0, 0.4392157, 1,
1.5188, 0.1047432, 0.5586549, 1, 0, 0.4313726, 1,
1.520776, -1.125099, 2.726978, 1, 0, 0.427451, 1,
1.524729, -0.6070098, 1.593011, 1, 0, 0.4196078, 1,
1.532761, 1.244006, 3.065321, 1, 0, 0.4156863, 1,
1.533268, 0.2800958, 1.277097, 1, 0, 0.4078431, 1,
1.554889, 0.04566126, 1.584055, 1, 0, 0.4039216, 1,
1.55495, -0.08669326, 0.323787, 1, 0, 0.3960784, 1,
1.554963, 0.1936591, 1.120605, 1, 0, 0.3882353, 1,
1.559757, -0.8772829, 2.538244, 1, 0, 0.3843137, 1,
1.560262, -1.078537, 2.324276, 1, 0, 0.3764706, 1,
1.567149, -0.4279894, 2.446809, 1, 0, 0.372549, 1,
1.567955, -0.8229917, 2.39644, 1, 0, 0.3647059, 1,
1.568649, 1.977014, 1.225092, 1, 0, 0.3607843, 1,
1.572393, 0.6092287, 0.757546, 1, 0, 0.3529412, 1,
1.580414, -0.05527623, 1.487229, 1, 0, 0.3490196, 1,
1.588259, 1.385301, 1.136576, 1, 0, 0.3411765, 1,
1.588273, 2.161099, -1.092982, 1, 0, 0.3372549, 1,
1.609473, 2.228446, 0.7747739, 1, 0, 0.3294118, 1,
1.621446, 0.9567983, 0.02366665, 1, 0, 0.3254902, 1,
1.63777, 1.016076, -0.1241402, 1, 0, 0.3176471, 1,
1.637866, 0.3176108, 1.266745, 1, 0, 0.3137255, 1,
1.640492, 0.5032928, 1.237878, 1, 0, 0.3058824, 1,
1.665601, -1.348613, 2.377191, 1, 0, 0.2980392, 1,
1.672543, -2.338945, 2.623536, 1, 0, 0.2941177, 1,
1.67431, 0.8313662, 1.87436, 1, 0, 0.2862745, 1,
1.684471, -0.6719798, 3.118307, 1, 0, 0.282353, 1,
1.686226, -2.001839, 1.547767, 1, 0, 0.2745098, 1,
1.689395, -2.208136, 1.331517, 1, 0, 0.2705882, 1,
1.700152, -0.8183445, 0.06634405, 1, 0, 0.2627451, 1,
1.711623, 0.8117347, 1.862241, 1, 0, 0.2588235, 1,
1.716062, -0.9431813, 2.818412, 1, 0, 0.2509804, 1,
1.728093, -0.647506, 1.088965, 1, 0, 0.2470588, 1,
1.746075, 0.6698915, 1.577087, 1, 0, 0.2392157, 1,
1.748354, -0.8697858, -0.5558028, 1, 0, 0.2352941, 1,
1.780487, 0.4320483, -0.05755845, 1, 0, 0.227451, 1,
1.783474, 0.4588887, 0.9969286, 1, 0, 0.2235294, 1,
1.793743, 0.5410359, 2.352594, 1, 0, 0.2156863, 1,
1.804782, 0.525282, 0.841789, 1, 0, 0.2117647, 1,
1.829487, -0.3021003, 2.309108, 1, 0, 0.2039216, 1,
1.840839, 0.5188584, 0.2951326, 1, 0, 0.1960784, 1,
1.853817, 0.08144815, 2.537058, 1, 0, 0.1921569, 1,
1.863416, 1.997993, 2.232, 1, 0, 0.1843137, 1,
1.867554, 0.0107943, 2.006261, 1, 0, 0.1803922, 1,
1.875143, -0.4472142, 1.620633, 1, 0, 0.172549, 1,
1.92179, 2.515741, 0.06813155, 1, 0, 0.1686275, 1,
1.934417, 0.6494727, 0.7408819, 1, 0, 0.1607843, 1,
1.962681, 0.006321463, 0.7201769, 1, 0, 0.1568628, 1,
1.971119, 0.9010116, 2.700463, 1, 0, 0.1490196, 1,
1.973946, -1.479575, 3.040764, 1, 0, 0.145098, 1,
1.996737, 0.8565544, 1.677967, 1, 0, 0.1372549, 1,
2.005288, 0.4880518, 2.991958, 1, 0, 0.1333333, 1,
2.026918, 0.2167761, -0.2934498, 1, 0, 0.1254902, 1,
2.062617, 0.6042176, 0.4866695, 1, 0, 0.1215686, 1,
2.070254, 0.3901458, 0.9440823, 1, 0, 0.1137255, 1,
2.096299, -0.9161179, 1.33483, 1, 0, 0.1098039, 1,
2.113628, 0.5119774, -0.1151816, 1, 0, 0.1019608, 1,
2.131112, 0.3519653, 0.6734462, 1, 0, 0.09411765, 1,
2.141431, -1.295968, 0.7648692, 1, 0, 0.09019608, 1,
2.148203, 0.7045324, -1.17037, 1, 0, 0.08235294, 1,
2.154101, 0.1432035, 1.574135, 1, 0, 0.07843138, 1,
2.170191, -2.185009, 2.940065, 1, 0, 0.07058824, 1,
2.191043, -0.07150135, 2.007116, 1, 0, 0.06666667, 1,
2.226188, 0.07858467, 2.988305, 1, 0, 0.05882353, 1,
2.229788, 1.104333, 1.010158, 1, 0, 0.05490196, 1,
2.313548, -0.5879332, 1.534475, 1, 0, 0.04705882, 1,
2.377103, -0.3735082, 1.103512, 1, 0, 0.04313726, 1,
2.396893, -0.8276332, 2.096378, 1, 0, 0.03529412, 1,
2.665599, 0.359938, 0.7332413, 1, 0, 0.03137255, 1,
2.864344, 0.606858, 0.8896387, 1, 0, 0.02352941, 1,
2.967674, 1.773086, 0.9593415, 1, 0, 0.01960784, 1,
2.983247, -1.129447, 2.507719, 1, 0, 0.01176471, 1,
3.047145, -0.6157334, 2.476342, 1, 0, 0.007843138, 1
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
-0.1375809, -3.991368, -6.974885, 0, -0.5, 0.5, 0.5,
-0.1375809, -3.991368, -6.974885, 1, -0.5, 0.5, 0.5,
-0.1375809, -3.991368, -6.974885, 1, 1.5, 0.5, 0.5,
-0.1375809, -3.991368, -6.974885, 0, 1.5, 0.5, 0.5
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
-4.401928, 0.1745447, -6.974885, 0, -0.5, 0.5, 0.5,
-4.401928, 0.1745447, -6.974885, 1, -0.5, 0.5, 0.5,
-4.401928, 0.1745447, -6.974885, 1, 1.5, 0.5, 0.5,
-4.401928, 0.1745447, -6.974885, 0, 1.5, 0.5, 0.5
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
-4.401928, -3.991368, 0.6578023, 0, -0.5, 0.5, 0.5,
-4.401928, -3.991368, 0.6578023, 1, -0.5, 0.5, 0.5,
-4.401928, -3.991368, 0.6578023, 1, 1.5, 0.5, 0.5,
-4.401928, -3.991368, 0.6578023, 0, 1.5, 0.5, 0.5
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
-3, -3.030004, -5.213496,
3, -3.030004, -5.213496,
-3, -3.030004, -5.213496,
-3, -3.190231, -5.507061,
-2, -3.030004, -5.213496,
-2, -3.190231, -5.507061,
-1, -3.030004, -5.213496,
-1, -3.190231, -5.507061,
0, -3.030004, -5.213496,
0, -3.190231, -5.507061,
1, -3.030004, -5.213496,
1, -3.190231, -5.507061,
2, -3.030004, -5.213496,
2, -3.190231, -5.507061,
3, -3.030004, -5.213496,
3, -3.190231, -5.507061
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
-3, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
-3, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
-3, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
-3, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
-2, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
-2, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
-2, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
-2, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
-1, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
-1, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
-1, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
-1, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
0, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
0, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
0, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
0, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
1, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
1, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
1, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
1, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
2, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
2, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
2, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
2, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5,
3, -3.510686, -6.094191, 0, -0.5, 0.5, 0.5,
3, -3.510686, -6.094191, 1, -0.5, 0.5, 0.5,
3, -3.510686, -6.094191, 1, 1.5, 0.5, 0.5,
3, -3.510686, -6.094191, 0, 1.5, 0.5, 0.5
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
-3.417848, -2, -5.213496,
-3.417848, 3, -5.213496,
-3.417848, -2, -5.213496,
-3.581861, -2, -5.507061,
-3.417848, -1, -5.213496,
-3.581861, -1, -5.507061,
-3.417848, 0, -5.213496,
-3.581861, 0, -5.507061,
-3.417848, 1, -5.213496,
-3.581861, 1, -5.507061,
-3.417848, 2, -5.213496,
-3.581861, 2, -5.507061,
-3.417848, 3, -5.213496,
-3.581861, 3, -5.507061
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
-3.909888, -2, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, -2, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, -2, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, -2, -6.094191, 0, 1.5, 0.5, 0.5,
-3.909888, -1, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, -1, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, -1, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, -1, -6.094191, 0, 1.5, 0.5, 0.5,
-3.909888, 0, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, 0, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, 0, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, 0, -6.094191, 0, 1.5, 0.5, 0.5,
-3.909888, 1, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, 1, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, 1, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, 1, -6.094191, 0, 1.5, 0.5, 0.5,
-3.909888, 2, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, 2, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, 2, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, 2, -6.094191, 0, 1.5, 0.5, 0.5,
-3.909888, 3, -6.094191, 0, -0.5, 0.5, 0.5,
-3.909888, 3, -6.094191, 1, -0.5, 0.5, 0.5,
-3.909888, 3, -6.094191, 1, 1.5, 0.5, 0.5,
-3.909888, 3, -6.094191, 0, 1.5, 0.5, 0.5
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
-3.417848, -3.030004, -4,
-3.417848, -3.030004, 6,
-3.417848, -3.030004, -4,
-3.581861, -3.190231, -4,
-3.417848, -3.030004, -2,
-3.581861, -3.190231, -2,
-3.417848, -3.030004, 0,
-3.581861, -3.190231, 0,
-3.417848, -3.030004, 2,
-3.581861, -3.190231, 2,
-3.417848, -3.030004, 4,
-3.581861, -3.190231, 4,
-3.417848, -3.030004, 6,
-3.581861, -3.190231, 6
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
-3.909888, -3.510686, -4, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, -4, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, -4, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, -4, 0, 1.5, 0.5, 0.5,
-3.909888, -3.510686, -2, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, -2, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, -2, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, -2, 0, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 0, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 0, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 0, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 0, 0, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 2, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 2, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 2, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 2, 0, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 4, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 4, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 4, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 4, 0, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 6, 0, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 6, 1, -0.5, 0.5, 0.5,
-3.909888, -3.510686, 6, 1, 1.5, 0.5, 0.5,
-3.909888, -3.510686, 6, 0, 1.5, 0.5, 0.5
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
-3.417848, -3.030004, -5.213496,
-3.417848, 3.379093, -5.213496,
-3.417848, -3.030004, 6.5291,
-3.417848, 3.379093, 6.5291,
-3.417848, -3.030004, -5.213496,
-3.417848, -3.030004, 6.5291,
-3.417848, 3.379093, -5.213496,
-3.417848, 3.379093, 6.5291,
-3.417848, -3.030004, -5.213496,
3.142686, -3.030004, -5.213496,
-3.417848, -3.030004, 6.5291,
3.142686, -3.030004, 6.5291,
-3.417848, 3.379093, -5.213496,
3.142686, 3.379093, -5.213496,
-3.417848, 3.379093, 6.5291,
3.142686, 3.379093, 6.5291,
3.142686, -3.030004, -5.213496,
3.142686, 3.379093, -5.213496,
3.142686, -3.030004, 6.5291,
3.142686, 3.379093, 6.5291,
3.142686, -3.030004, -5.213496,
3.142686, -3.030004, 6.5291,
3.142686, 3.379093, -5.213496,
3.142686, 3.379093, 6.5291
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
var radius = 7.956234;
var distance = 35.39818;
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
mvMatrix.translate( 0.1375809, -0.1745447, -0.6578023 );
mvMatrix.scale( 1.31124, 1.342223, 0.7325838 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.39818);
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
Chlorothalonil<-read.table("Chlorothalonil.xyz")
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
-3.322306, 0.2560868, -1.603176, 0, 0, 1, 1, 1,
-2.895008, 0.6902188, -1.500407, 1, 0, 0, 1, 1,
-2.87045, 1.603526, -1.806622, 1, 0, 0, 1, 1,
-2.728581, -0.3547603, -2.387332, 1, 0, 0, 1, 1,
-2.684168, 0.7821355, -1.342905, 1, 0, 0, 1, 1,
-2.676746, -1.025853, -1.147963, 1, 0, 0, 1, 1,
-2.613384, -0.1081663, -1.074123, 0, 0, 0, 1, 1,
-2.443277, 1.760817, -0.645942, 0, 0, 0, 1, 1,
-2.272706, -1.376905, -1.622172, 0, 0, 0, 1, 1,
-2.259743, -0.5626009, -3.362653, 0, 0, 0, 1, 1,
-2.221821, -0.1528374, -1.002357, 0, 0, 0, 1, 1,
-2.186013, 0.3075134, -1.673834, 0, 0, 0, 1, 1,
-2.152425, -0.5571919, -1.347801, 0, 0, 0, 1, 1,
-2.146285, 0.7396551, -1.414895, 1, 1, 1, 1, 1,
-2.116857, 1.63704, -1.254243, 1, 1, 1, 1, 1,
-2.065959, 0.8996956, -1.143752, 1, 1, 1, 1, 1,
-2.051291, -1.857874, -1.981961, 1, 1, 1, 1, 1,
-2.045818, -0.5051405, -0.8522353, 1, 1, 1, 1, 1,
-2.036411, 0.3237974, -2.235964, 1, 1, 1, 1, 1,
-2.026081, 1.692409, -1.791568, 1, 1, 1, 1, 1,
-2.020603, 0.4190918, -0.5569012, 1, 1, 1, 1, 1,
-1.980049, -1.337689, -1.737591, 1, 1, 1, 1, 1,
-1.969857, -0.5923232, -1.770872, 1, 1, 1, 1, 1,
-1.945622, 0.6269874, 0.1422563, 1, 1, 1, 1, 1,
-1.932289, -1.495626, -1.359814, 1, 1, 1, 1, 1,
-1.929475, 1.113395, 2.306298, 1, 1, 1, 1, 1,
-1.856861, -0.4091947, -2.29492, 1, 1, 1, 1, 1,
-1.854055, -1.284728, -2.232902, 1, 1, 1, 1, 1,
-1.829449, 0.8486376, -2.896231, 0, 0, 1, 1, 1,
-1.824968, -1.290508, -4.92627, 1, 0, 0, 1, 1,
-1.817443, 0.3058541, -0.1990664, 1, 0, 0, 1, 1,
-1.797198, 1.902618, 0.324417, 1, 0, 0, 1, 1,
-1.788556, 0.06961957, -2.383303, 1, 0, 0, 1, 1,
-1.785705, 0.5730849, -0.4663024, 1, 0, 0, 1, 1,
-1.765375, -0.5942706, -1.728037, 0, 0, 0, 1, 1,
-1.763916, -1.047737, -1.802863, 0, 0, 0, 1, 1,
-1.732232, 0.5562168, 1.144616, 0, 0, 0, 1, 1,
-1.731248, -0.2932871, -0.1216336, 0, 0, 0, 1, 1,
-1.714079, -0.7226819, -2.901792, 0, 0, 0, 1, 1,
-1.713247, -0.4622031, -0.7282547, 0, 0, 0, 1, 1,
-1.70383, -0.9635556, -2.571448, 0, 0, 0, 1, 1,
-1.697901, 0.5253633, -1.251105, 1, 1, 1, 1, 1,
-1.694371, -0.6389862, -3.425518, 1, 1, 1, 1, 1,
-1.679912, 0.5150093, -2.448965, 1, 1, 1, 1, 1,
-1.668536, -1.362373, -1.581079, 1, 1, 1, 1, 1,
-1.657246, 0.9957091, -0.657801, 1, 1, 1, 1, 1,
-1.636624, -0.08871932, -2.044622, 1, 1, 1, 1, 1,
-1.63033, 0.4070965, -1.68001, 1, 1, 1, 1, 1,
-1.627762, 0.03689642, -1.43165, 1, 1, 1, 1, 1,
-1.624814, 1.437132, -1.115173, 1, 1, 1, 1, 1,
-1.616599, -0.4973454, -1.953483, 1, 1, 1, 1, 1,
-1.613342, 0.139428, -1.76862, 1, 1, 1, 1, 1,
-1.610407, 2.172277, -1.357903, 1, 1, 1, 1, 1,
-1.579322, -0.05834508, -1.006019, 1, 1, 1, 1, 1,
-1.575147, 1.283624, -0.2966572, 1, 1, 1, 1, 1,
-1.568037, 1.424104, -1.094756, 1, 1, 1, 1, 1,
-1.557763, -0.4878969, -0.3816282, 0, 0, 1, 1, 1,
-1.529646, 0.9883862, -1.089491, 1, 0, 0, 1, 1,
-1.527027, -0.7180916, -2.908273, 1, 0, 0, 1, 1,
-1.526377, -0.7064093, -1.640504, 1, 0, 0, 1, 1,
-1.51796, -0.8827024, -0.03401056, 1, 0, 0, 1, 1,
-1.514719, 0.1519201, 0.360104, 1, 0, 0, 1, 1,
-1.494163, 0.346018, -2.129798, 0, 0, 0, 1, 1,
-1.493517, -0.2656489, -3.264924, 0, 0, 0, 1, 1,
-1.491689, -0.9217749, -3.836906, 0, 0, 0, 1, 1,
-1.485523, 1.37403, -0.9718129, 0, 0, 0, 1, 1,
-1.480719, -1.352166, -1.734834, 0, 0, 0, 1, 1,
-1.457244, 0.4351197, -0.7390572, 0, 0, 0, 1, 1,
-1.456622, 0.8910976, -1.099966, 0, 0, 0, 1, 1,
-1.448871, 0.297655, -0.5599181, 1, 1, 1, 1, 1,
-1.447825, 0.4763105, -1.40989, 1, 1, 1, 1, 1,
-1.43336, -1.486369, -2.065228, 1, 1, 1, 1, 1,
-1.427403, -0.8450047, -0.7938033, 1, 1, 1, 1, 1,
-1.41442, 3.285757, -2.061209, 1, 1, 1, 1, 1,
-1.407247, 0.283009, -2.801125, 1, 1, 1, 1, 1,
-1.39246, 1.517425, -0.9739457, 1, 1, 1, 1, 1,
-1.375355, 0.5246603, -1.999849, 1, 1, 1, 1, 1,
-1.374214, -2.543957, -3.743134, 1, 1, 1, 1, 1,
-1.368685, -0.6135922, -2.158673, 1, 1, 1, 1, 1,
-1.36337, 0.2109762, -1.609784, 1, 1, 1, 1, 1,
-1.362303, 1.945349, -0.767023, 1, 1, 1, 1, 1,
-1.351533, -0.1910475, -3.434099, 1, 1, 1, 1, 1,
-1.34314, 1.045139, -1.492191, 1, 1, 1, 1, 1,
-1.332258, -0.9346542, -2.628439, 1, 1, 1, 1, 1,
-1.329864, -0.5980863, -3.745147, 0, 0, 1, 1, 1,
-1.321951, 0.1251913, -0.4690992, 1, 0, 0, 1, 1,
-1.318941, -0.02584544, -0.3768164, 1, 0, 0, 1, 1,
-1.308825, 1.262457, -1.297874, 1, 0, 0, 1, 1,
-1.304598, -0.2433764, -0.7946307, 1, 0, 0, 1, 1,
-1.302637, 0.4570771, -1.118701, 1, 0, 0, 1, 1,
-1.301475, 0.685701, 0.789416, 0, 0, 0, 1, 1,
-1.300905, 1.170034, 0.5293253, 0, 0, 0, 1, 1,
-1.289177, -1.439736, -3.270312, 0, 0, 0, 1, 1,
-1.286867, -1.65495, -2.918159, 0, 0, 0, 1, 1,
-1.286489, 1.118832, -0.3717961, 0, 0, 0, 1, 1,
-1.273746, 0.7919559, -1.37425, 0, 0, 0, 1, 1,
-1.272572, -1.232937, -2.924855, 0, 0, 0, 1, 1,
-1.267872, -0.5468972, -1.805842, 1, 1, 1, 1, 1,
-1.259532, -0.1179616, -0.7922917, 1, 1, 1, 1, 1,
-1.258863, -1.004276, -1.891221, 1, 1, 1, 1, 1,
-1.258036, -0.1640383, -0.6138567, 1, 1, 1, 1, 1,
-1.253146, 0.3741711, -2.636913, 1, 1, 1, 1, 1,
-1.25284, 0.8731061, -1.499835, 1, 1, 1, 1, 1,
-1.247169, 0.9096714, -0.9801652, 1, 1, 1, 1, 1,
-1.237767, -0.3930043, -2.732459, 1, 1, 1, 1, 1,
-1.23561, 1.160203, -0.6620205, 1, 1, 1, 1, 1,
-1.212468, 0.01863336, -3.02194, 1, 1, 1, 1, 1,
-1.211479, -0.8357695, -0.8525358, 1, 1, 1, 1, 1,
-1.20978, -0.5364587, -1.99885, 1, 1, 1, 1, 1,
-1.191802, 0.2364271, -1.663875, 1, 1, 1, 1, 1,
-1.183422, 1.835351, -1.223866, 1, 1, 1, 1, 1,
-1.180063, 2.294722, -0.02172755, 1, 1, 1, 1, 1,
-1.172407, 0.6299751, -0.1101196, 0, 0, 1, 1, 1,
-1.168388, 0.4796297, -0.8167656, 1, 0, 0, 1, 1,
-1.167545, -0.5907009, -0.784553, 1, 0, 0, 1, 1,
-1.158431, 0.5382265, -1.049675, 1, 0, 0, 1, 1,
-1.157849, 1.40556, -1.036137, 1, 0, 0, 1, 1,
-1.1516, -2.564575, -2.257052, 1, 0, 0, 1, 1,
-1.150937, -1.69931, -3.265962, 0, 0, 0, 1, 1,
-1.148569, 1.535725, 0.4844317, 0, 0, 0, 1, 1,
-1.148241, 0.6529494, 0.05045537, 0, 0, 0, 1, 1,
-1.144678, -0.1263499, -2.793202, 0, 0, 0, 1, 1,
-1.141181, -0.7194291, -1.421204, 0, 0, 0, 1, 1,
-1.139894, -0.2840112, -2.063651, 0, 0, 0, 1, 1,
-1.130015, 0.4935827, -0.211401, 0, 0, 0, 1, 1,
-1.128316, 0.6758928, -0.2164001, 1, 1, 1, 1, 1,
-1.117615, 0.3494031, -0.5933936, 1, 1, 1, 1, 1,
-1.117472, -0.2257594, -0.4047386, 1, 1, 1, 1, 1,
-1.106457, 0.2112346, -0.8441411, 1, 1, 1, 1, 1,
-1.092879, 0.3779846, -2.063094, 1, 1, 1, 1, 1,
-1.081522, -0.6748694, -1.710003, 1, 1, 1, 1, 1,
-1.081521, 0.1389176, -1.812564, 1, 1, 1, 1, 1,
-1.076125, 0.5372388, 0.2528531, 1, 1, 1, 1, 1,
-1.075253, -0.4185337, -2.955916, 1, 1, 1, 1, 1,
-1.072191, 1.574874, 0.4352629, 1, 1, 1, 1, 1,
-1.06602, 1.16464, -0.501732, 1, 1, 1, 1, 1,
-1.056929, 0.04040033, -2.779285, 1, 1, 1, 1, 1,
-1.055501, -0.6348892, -0.3740444, 1, 1, 1, 1, 1,
-1.050939, -0.274156, -1.443998, 1, 1, 1, 1, 1,
-1.048375, -1.722414, -3.068127, 1, 1, 1, 1, 1,
-1.048323, -1.184962, -2.768571, 0, 0, 1, 1, 1,
-1.045431, 0.4978622, -1.835709, 1, 0, 0, 1, 1,
-1.042566, 0.6196484, -0.4026024, 1, 0, 0, 1, 1,
-1.040787, -0.1166974, -2.609841, 1, 0, 0, 1, 1,
-1.039008, 0.8365186, -0.3366635, 1, 0, 0, 1, 1,
-1.028947, -0.2964522, -2.058931, 1, 0, 0, 1, 1,
-1.0209, -0.2756343, -2.571103, 0, 0, 0, 1, 1,
-1.020641, 0.2433616, -0.7328099, 0, 0, 0, 1, 1,
-1.01164, 0.5589456, -1.178797, 0, 0, 0, 1, 1,
-0.9979038, -0.1512813, -0.7660006, 0, 0, 0, 1, 1,
-0.9957457, 0.127901, 0.1729912, 0, 0, 0, 1, 1,
-0.9911106, 2.750685, -0.6988211, 0, 0, 0, 1, 1,
-0.9868103, -0.9416181, -2.272122, 0, 0, 0, 1, 1,
-0.9748133, 1.242891, -1.298084, 1, 1, 1, 1, 1,
-0.9648857, -0.008263284, -2.671684, 1, 1, 1, 1, 1,
-0.964817, 0.7927974, -2.358655, 1, 1, 1, 1, 1,
-0.9563147, 0.1870643, -0.8364105, 1, 1, 1, 1, 1,
-0.9538725, -0.7406612, -2.732839, 1, 1, 1, 1, 1,
-0.9501399, -0.2795943, -2.97299, 1, 1, 1, 1, 1,
-0.9441171, -0.1530899, -4.171863, 1, 1, 1, 1, 1,
-0.9435135, 0.4409431, -0.3854243, 1, 1, 1, 1, 1,
-0.9407543, -0.2382378, -1.540812, 1, 1, 1, 1, 1,
-0.9368243, -0.9861146, -3.429434, 1, 1, 1, 1, 1,
-0.9276666, 0.2863846, -0.2145695, 1, 1, 1, 1, 1,
-0.9201462, 0.1837267, -1.427988, 1, 1, 1, 1, 1,
-0.9151652, 0.9170815, -1.490817, 1, 1, 1, 1, 1,
-0.9147364, -0.5250698, -1.726853, 1, 1, 1, 1, 1,
-0.9085549, -0.2948187, -2.991541, 1, 1, 1, 1, 1,
-0.9084133, -0.186513, -0.8161191, 0, 0, 1, 1, 1,
-0.904368, -0.3691027, -2.526103, 1, 0, 0, 1, 1,
-0.9030944, 1.245485, 1.001252, 1, 0, 0, 1, 1,
-0.9010903, 0.8478327, -1.550719, 1, 0, 0, 1, 1,
-0.8947515, -1.384989, -3.273485, 1, 0, 0, 1, 1,
-0.8836811, -0.8495405, -1.329384, 1, 0, 0, 1, 1,
-0.8815002, -0.1078878, -2.768214, 0, 0, 0, 1, 1,
-0.8707166, -0.2092727, -0.2633348, 0, 0, 0, 1, 1,
-0.8672884, 0.4379479, -1.566745, 0, 0, 0, 1, 1,
-0.865397, 0.1498659, -3.121031, 0, 0, 0, 1, 1,
-0.8649262, 1.107152, -0.2195209, 0, 0, 0, 1, 1,
-0.8647467, 0.5921428, -1.370027, 0, 0, 0, 1, 1,
-0.8613632, 0.5453733, 1.444653, 0, 0, 0, 1, 1,
-0.8581443, -1.568238, -2.373848, 1, 1, 1, 1, 1,
-0.8578365, 0.8289841, -1.890393, 1, 1, 1, 1, 1,
-0.8569415, 0.009912124, -1.095106, 1, 1, 1, 1, 1,
-0.8353869, 0.4244359, 0.6007313, 1, 1, 1, 1, 1,
-0.8348771, 0.4485163, -0.2270272, 1, 1, 1, 1, 1,
-0.8299055, -0.06162842, -3.443168, 1, 1, 1, 1, 1,
-0.823541, -0.3780125, -1.5429, 1, 1, 1, 1, 1,
-0.8231131, 0.9800413, 0.6151651, 1, 1, 1, 1, 1,
-0.8194337, -1.200186, -2.856211, 1, 1, 1, 1, 1,
-0.8163752, 0.08551175, -0.5778254, 1, 1, 1, 1, 1,
-0.8146147, 0.8117981, -0.3213218, 1, 1, 1, 1, 1,
-0.8135579, 0.900994, -1.4701, 1, 1, 1, 1, 1,
-0.8126742, 1.333584, -0.195569, 1, 1, 1, 1, 1,
-0.8113138, 0.7160493, -0.2634187, 1, 1, 1, 1, 1,
-0.8110397, 0.5197468, -0.6206461, 1, 1, 1, 1, 1,
-0.810196, 0.04672114, -1.137345, 0, 0, 1, 1, 1,
-0.8037641, -0.3721524, -2.164042, 1, 0, 0, 1, 1,
-0.803656, -1.011142, -1.856557, 1, 0, 0, 1, 1,
-0.7982025, -1.431492, -2.554215, 1, 0, 0, 1, 1,
-0.796635, -0.5866321, -4.647004, 1, 0, 0, 1, 1,
-0.7926474, 0.08766091, -0.9915704, 1, 0, 0, 1, 1,
-0.7914388, -0.1982275, -2.296772, 0, 0, 0, 1, 1,
-0.7887579, 0.9171987, -1.79018, 0, 0, 0, 1, 1,
-0.7879636, 0.1876973, -1.658972, 0, 0, 0, 1, 1,
-0.7858585, 0.1505142, -0.929736, 0, 0, 0, 1, 1,
-0.7857983, -0.7846683, -0.5959393, 0, 0, 0, 1, 1,
-0.7854036, 1.26335, -1.945926, 0, 0, 0, 1, 1,
-0.784653, -0.9758858, -3.176769, 0, 0, 0, 1, 1,
-0.7799031, 1.603512, -0.9802946, 1, 1, 1, 1, 1,
-0.7782542, -0.5768927, -2.426955, 1, 1, 1, 1, 1,
-0.7703639, -0.5079526, -1.311909, 1, 1, 1, 1, 1,
-0.7513626, -0.05316923, -0.8993201, 1, 1, 1, 1, 1,
-0.7505345, 0.1762076, -1.390878, 1, 1, 1, 1, 1,
-0.7458631, -0.6548846, -1.791044, 1, 1, 1, 1, 1,
-0.7429401, 1.412521, -1.218257, 1, 1, 1, 1, 1,
-0.7417516, -0.6658892, -0.5318853, 1, 1, 1, 1, 1,
-0.7409389, 0.05693945, -1.630278, 1, 1, 1, 1, 1,
-0.7356385, -1.08203, -2.974189, 1, 1, 1, 1, 1,
-0.7297444, 0.1256402, -1.559969, 1, 1, 1, 1, 1,
-0.7270518, 0.9584392, -1.633198, 1, 1, 1, 1, 1,
-0.7227461, 0.02688298, -0.383875, 1, 1, 1, 1, 1,
-0.7209253, -0.4351166, -0.8828338, 1, 1, 1, 1, 1,
-0.714269, -1.281563, -1.905548, 1, 1, 1, 1, 1,
-0.7102373, 0.1359509, -1.351026, 0, 0, 1, 1, 1,
-0.7048684, 1.710283, 0.562949, 1, 0, 0, 1, 1,
-0.7029059, -1.372565, -2.532391, 1, 0, 0, 1, 1,
-0.7024176, 0.9948232, -1.390125, 1, 0, 0, 1, 1,
-0.6888157, 0.2347048, -1.423966, 1, 0, 0, 1, 1,
-0.6882011, -0.4229751, -2.612665, 1, 0, 0, 1, 1,
-0.6670787, -1.683892, -2.644007, 0, 0, 0, 1, 1,
-0.6655635, -0.8549715, -1.950936, 0, 0, 0, 1, 1,
-0.6644493, 1.393786, -0.9197474, 0, 0, 0, 1, 1,
-0.6569532, -0.5217748, -3.74809, 0, 0, 0, 1, 1,
-0.6544953, -1.180631, -2.631847, 0, 0, 0, 1, 1,
-0.6526859, 1.079677, 0.5210987, 0, 0, 0, 1, 1,
-0.6489249, 0.8139737, -1.012893, 0, 0, 0, 1, 1,
-0.646899, 0.04963322, -0.04270576, 1, 1, 1, 1, 1,
-0.6425997, 0.6284612, 1.255829, 1, 1, 1, 1, 1,
-0.6370636, -0.7806615, -0.8833707, 1, 1, 1, 1, 1,
-0.636807, -0.8564522, -1.485344, 1, 1, 1, 1, 1,
-0.6358009, -0.1966838, -1.492456, 1, 1, 1, 1, 1,
-0.6354905, -0.3628944, -1.032535, 1, 1, 1, 1, 1,
-0.6311899, -1.774619, -2.105443, 1, 1, 1, 1, 1,
-0.6304684, 0.5525759, -0.8468435, 1, 1, 1, 1, 1,
-0.629636, 1.207256, 0.1728782, 1, 1, 1, 1, 1,
-0.6287488, 0.7120216, -1.021158, 1, 1, 1, 1, 1,
-0.6282175, -1.251677, -4.331572, 1, 1, 1, 1, 1,
-0.6248344, 1.888269, 1.301705, 1, 1, 1, 1, 1,
-0.622507, -0.1259414, -0.7170814, 1, 1, 1, 1, 1,
-0.6172426, -0.2405173, -2.567918, 1, 1, 1, 1, 1,
-0.6151365, 1.047857, -0.8982767, 1, 1, 1, 1, 1,
-0.6143748, -0.530145, -3.074707, 0, 0, 1, 1, 1,
-0.6096042, 0.9160649, -0.2934586, 1, 0, 0, 1, 1,
-0.6082823, 0.6121086, -1.378135, 1, 0, 0, 1, 1,
-0.6006286, 0.9793583, 0.5770308, 1, 0, 0, 1, 1,
-0.5952461, -1.815575, -3.323605, 1, 0, 0, 1, 1,
-0.5944797, -0.474486, -2.329631, 1, 0, 0, 1, 1,
-0.5923246, 0.24725, -1.753644, 0, 0, 0, 1, 1,
-0.5912887, -1.088279, -1.365652, 0, 0, 0, 1, 1,
-0.5910648, 0.9859949, -0.7865403, 0, 0, 0, 1, 1,
-0.5834797, -1.991327, -1.80042, 0, 0, 0, 1, 1,
-0.5829552, -0.01286327, -0.6006675, 0, 0, 0, 1, 1,
-0.5821486, 1.094682, -0.5491836, 0, 0, 0, 1, 1,
-0.5805317, -0.4474292, 0.2604942, 0, 0, 0, 1, 1,
-0.5780549, 0.04787832, -0.8058527, 1, 1, 1, 1, 1,
-0.5773057, -0.5827142, -2.29871, 1, 1, 1, 1, 1,
-0.570104, -0.1114345, -1.965133, 1, 1, 1, 1, 1,
-0.5689546, 2.400652, 1.36389, 1, 1, 1, 1, 1,
-0.5685965, 0.4273844, -1.423143, 1, 1, 1, 1, 1,
-0.568222, -0.0140744, -0.5849051, 1, 1, 1, 1, 1,
-0.5673971, 1.215316, -1.222253, 1, 1, 1, 1, 1,
-0.5655017, -0.2792922, -2.351136, 1, 1, 1, 1, 1,
-0.5619395, -0.5283098, -1.278302, 1, 1, 1, 1, 1,
-0.5597502, -0.3619315, -4.321215, 1, 1, 1, 1, 1,
-0.5525741, -1.6798, -2.251125, 1, 1, 1, 1, 1,
-0.5523577, -1.274248, -2.427394, 1, 1, 1, 1, 1,
-0.5519794, -0.7390313, -1.829714, 1, 1, 1, 1, 1,
-0.5475066, 0.5843269, -0.1382155, 1, 1, 1, 1, 1,
-0.5421404, 1.996141, 0.5024899, 1, 1, 1, 1, 1,
-0.538576, -0.09608676, -0.7206538, 0, 0, 1, 1, 1,
-0.5372827, 1.491349, -0.459463, 1, 0, 0, 1, 1,
-0.5363967, 0.6884134, 1.52081, 1, 0, 0, 1, 1,
-0.5358214, 0.2741954, -0.6419415, 1, 0, 0, 1, 1,
-0.5354437, -1.226406, -3.053924, 1, 0, 0, 1, 1,
-0.5347918, 0.5936714, -0.7235867, 1, 0, 0, 1, 1,
-0.5270947, -0.7987604, -2.389079, 0, 0, 0, 1, 1,
-0.5167073, 0.5322963, 0.9620429, 0, 0, 0, 1, 1,
-0.513952, 1.469293, 0.2609234, 0, 0, 0, 1, 1,
-0.5132348, 2.245247, -0.1425107, 0, 0, 0, 1, 1,
-0.5126156, -0.01708972, -1.649066, 0, 0, 0, 1, 1,
-0.5052112, 0.1292664, -1.397901, 0, 0, 0, 1, 1,
-0.5035941, 1.323161, -0.7282776, 0, 0, 0, 1, 1,
-0.5009288, -0.1470805, -2.267193, 1, 1, 1, 1, 1,
-0.499409, 0.6075719, -0.8779758, 1, 1, 1, 1, 1,
-0.4977773, 0.1752191, -2.856353, 1, 1, 1, 1, 1,
-0.4957346, 1.074987, 0.5490781, 1, 1, 1, 1, 1,
-0.4956495, 0.02527532, -2.02492, 1, 1, 1, 1, 1,
-0.4950972, 1.456914, -1.513526, 1, 1, 1, 1, 1,
-0.4946144, -0.410224, -2.129331, 1, 1, 1, 1, 1,
-0.4906021, 1.829452, -1.386275, 1, 1, 1, 1, 1,
-0.4865144, 1.932736, 0.01229647, 1, 1, 1, 1, 1,
-0.4812225, -0.5395328, -2.819581, 1, 1, 1, 1, 1,
-0.4778918, -0.578546, -3.455924, 1, 1, 1, 1, 1,
-0.4772322, -0.8997564, -3.556982, 1, 1, 1, 1, 1,
-0.4738884, -0.5219721, -2.532229, 1, 1, 1, 1, 1,
-0.4728298, -1.667561, -3.216776, 1, 1, 1, 1, 1,
-0.4724144, -0.9404108, -2.888238, 1, 1, 1, 1, 1,
-0.472376, 0.7884677, -0.07100488, 0, 0, 1, 1, 1,
-0.4657313, -2.115912, -1.829694, 1, 0, 0, 1, 1,
-0.4654783, -0.1929114, -1.313959, 1, 0, 0, 1, 1,
-0.4580758, 0.80747, 1.846529, 1, 0, 0, 1, 1,
-0.4580126, 1.034805, -0.6018518, 1, 0, 0, 1, 1,
-0.4563946, -0.1786902, -2.045146, 1, 0, 0, 1, 1,
-0.4552779, 0.6158032, 0.6085486, 0, 0, 0, 1, 1,
-0.4544088, -1.823591, -1.712239, 0, 0, 0, 1, 1,
-0.4524, -1.122053, -1.945413, 0, 0, 0, 1, 1,
-0.4441531, 0.8480912, 0.2288346, 0, 0, 0, 1, 1,
-0.4434558, -0.8267905, -1.550506, 0, 0, 0, 1, 1,
-0.4432049, 0.6506315, -2.149186, 0, 0, 0, 1, 1,
-0.4382343, 0.4437336, -0.9561119, 0, 0, 0, 1, 1,
-0.4336708, 2.606981, -0.5240812, 1, 1, 1, 1, 1,
-0.4324667, 0.6310161, -1.190409, 1, 1, 1, 1, 1,
-0.4317952, 0.8885904, -1.380448, 1, 1, 1, 1, 1,
-0.4305703, 2.341141, -0.5131211, 1, 1, 1, 1, 1,
-0.4277304, 0.321572, -1.62662, 1, 1, 1, 1, 1,
-0.4212083, -0.5142382, -1.872981, 1, 1, 1, 1, 1,
-0.4147969, 0.5110539, 0.5870111, 1, 1, 1, 1, 1,
-0.3995479, -0.9157865, -1.977572, 1, 1, 1, 1, 1,
-0.3993523, 0.1399995, -0.5290029, 1, 1, 1, 1, 1,
-0.3983062, 0.6072353, 0.6804771, 1, 1, 1, 1, 1,
-0.3965029, 0.08024936, -1.878297, 1, 1, 1, 1, 1,
-0.3932252, 0.994659, -0.5274773, 1, 1, 1, 1, 1,
-0.3931535, -0.4950244, -0.8670716, 1, 1, 1, 1, 1,
-0.392634, -0.08538823, -3.270903, 1, 1, 1, 1, 1,
-0.3920617, -1.857134, -2.488999, 1, 1, 1, 1, 1,
-0.3835034, -0.08509409, -2.736208, 0, 0, 1, 1, 1,
-0.3830989, 0.746212, -0.8184561, 1, 0, 0, 1, 1,
-0.3737632, -0.4825224, -2.041579, 1, 0, 0, 1, 1,
-0.3688786, -0.7480221, -0.9640588, 1, 0, 0, 1, 1,
-0.3671016, 0.4345643, -0.410859, 1, 0, 0, 1, 1,
-0.3620883, -0.1656264, -3.384122, 1, 0, 0, 1, 1,
-0.3617632, -0.9938622, -1.213171, 0, 0, 0, 1, 1,
-0.3561954, 0.1417187, -1.378585, 0, 0, 0, 1, 1,
-0.3519379, -1.589274, -4.539435, 0, 0, 0, 1, 1,
-0.3513821, -2.084118, -4.173219, 0, 0, 0, 1, 1,
-0.3462231, 0.4236211, -1.48896, 0, 0, 0, 1, 1,
-0.3458053, -1.959326, -2.617585, 0, 0, 0, 1, 1,
-0.341894, -1.712417, -3.189986, 0, 0, 0, 1, 1,
-0.3360687, 1.727669, 1.228016, 1, 1, 1, 1, 1,
-0.3303221, 0.5422957, -3.62779, 1, 1, 1, 1, 1,
-0.3291436, -2.159501, -2.375924, 1, 1, 1, 1, 1,
-0.32753, 0.9083229, 0.7736385, 1, 1, 1, 1, 1,
-0.3241985, -0.8167726, -3.073836, 1, 1, 1, 1, 1,
-0.3202263, 2.542931, 0.1076172, 1, 1, 1, 1, 1,
-0.3199879, -1.969561, -4.063522, 1, 1, 1, 1, 1,
-0.3186731, 0.04154067, -0.9572482, 1, 1, 1, 1, 1,
-0.3169258, -0.0710566, -1.278378, 1, 1, 1, 1, 1,
-0.3153501, -0.1525743, -2.313863, 1, 1, 1, 1, 1,
-0.3108312, 0.5019754, -1.731924, 1, 1, 1, 1, 1,
-0.304203, -0.5643227, -4.695041, 1, 1, 1, 1, 1,
-0.3024463, -0.4882759, -3.388369, 1, 1, 1, 1, 1,
-0.298183, 0.6565591, 0.2254715, 1, 1, 1, 1, 1,
-0.2949753, -0.3661045, -1.844598, 1, 1, 1, 1, 1,
-0.2898213, -2.347869, -3.158729, 0, 0, 1, 1, 1,
-0.2855131, 0.9870043, -0.1769868, 1, 0, 0, 1, 1,
-0.2851126, 0.1684521, -0.6831942, 1, 0, 0, 1, 1,
-0.2819265, 0.3443489, -2.437549, 1, 0, 0, 1, 1,
-0.2791622, 0.006110737, -0.1670043, 1, 0, 0, 1, 1,
-0.2765884, 0.4689182, -0.7526106, 1, 0, 0, 1, 1,
-0.2757795, 0.2010533, -1.228947, 0, 0, 0, 1, 1,
-0.2757083, -1.370038, -2.855368, 0, 0, 0, 1, 1,
-0.2732214, -0.2818, -2.637873, 0, 0, 0, 1, 1,
-0.2689168, -0.5847875, -2.445752, 0, 0, 0, 1, 1,
-0.2688107, -1.118649, -5.042487, 0, 0, 0, 1, 1,
-0.2659371, -0.9678703, -2.010819, 0, 0, 0, 1, 1,
-0.2649608, 0.9820009, 0.2668001, 0, 0, 0, 1, 1,
-0.264557, -0.8648502, -2.966535, 1, 1, 1, 1, 1,
-0.2613604, -0.2730753, -2.186915, 1, 1, 1, 1, 1,
-0.259492, 0.6440976, -0.3000967, 1, 1, 1, 1, 1,
-0.2565652, -1.207545, -2.721702, 1, 1, 1, 1, 1,
-0.2549669, 0.1914445, -0.9564401, 1, 1, 1, 1, 1,
-0.253334, 1.689286, 1.395652, 1, 1, 1, 1, 1,
-0.2500138, 0.4907577, 0.8920156, 1, 1, 1, 1, 1,
-0.2495199, -0.2457037, -4.415913, 1, 1, 1, 1, 1,
-0.2471533, 1.610523, -2.603899, 1, 1, 1, 1, 1,
-0.2429071, -0.9777265, -1.703624, 1, 1, 1, 1, 1,
-0.2397478, 0.01952222, -2.66418, 1, 1, 1, 1, 1,
-0.238823, 0.7993421, 1.153858, 1, 1, 1, 1, 1,
-0.231705, -0.945179, -4.027064, 1, 1, 1, 1, 1,
-0.2308273, -0.2931744, -1.977394, 1, 1, 1, 1, 1,
-0.2236723, -0.100443, -2.746215, 1, 1, 1, 1, 1,
-0.2229793, 1.135409, 0.9181914, 0, 0, 1, 1, 1,
-0.2167089, -1.213279, -1.868379, 1, 0, 0, 1, 1,
-0.2135371, 0.758451, 0.5712415, 1, 0, 0, 1, 1,
-0.2133875, -2.049802, -2.25553, 1, 0, 0, 1, 1,
-0.2035204, 0.03431756, -0.715179, 1, 0, 0, 1, 1,
-0.1985067, 0.1266195, 0.05894617, 1, 0, 0, 1, 1,
-0.19764, -0.7931929, -1.688492, 0, 0, 0, 1, 1,
-0.1950529, -0.872908, -3.391603, 0, 0, 0, 1, 1,
-0.1943717, -1.277526, -1.630522, 0, 0, 0, 1, 1,
-0.1854043, 1.304986, -0.5925151, 0, 0, 0, 1, 1,
-0.1838889, 0.9672086, 0.521786, 0, 0, 0, 1, 1,
-0.1804904, -1.336552, -3.996848, 0, 0, 0, 1, 1,
-0.1801941, -0.5433949, -4.280687, 0, 0, 0, 1, 1,
-0.1799166, -0.5951221, -2.040592, 1, 1, 1, 1, 1,
-0.1775746, 0.6138577, 0.563541, 1, 1, 1, 1, 1,
-0.1761609, -0.8254087, -4.080268, 1, 1, 1, 1, 1,
-0.1758013, -0.781531, -2.298833, 1, 1, 1, 1, 1,
-0.1741706, -0.6984749, -3.653632, 1, 1, 1, 1, 1,
-0.1725711, 0.9871903, 0.5768672, 1, 1, 1, 1, 1,
-0.1722241, -0.9997127, -2.159308, 1, 1, 1, 1, 1,
-0.1667078, -0.208247, -3.218741, 1, 1, 1, 1, 1,
-0.1663974, 2.331758, 1.033139, 1, 1, 1, 1, 1,
-0.1630461, -1.312635, -5.016823, 1, 1, 1, 1, 1,
-0.1628633, 0.2307228, -0.7310466, 1, 1, 1, 1, 1,
-0.161978, -0.201184, -1.883646, 1, 1, 1, 1, 1,
-0.1601378, 0.2231284, -0.8136719, 1, 1, 1, 1, 1,
-0.1567467, 1.26647, 0.5141548, 1, 1, 1, 1, 1,
-0.1531641, -0.6146878, -3.154777, 1, 1, 1, 1, 1,
-0.152558, 0.3203942, -0.1645396, 0, 0, 1, 1, 1,
-0.150285, -1.449592, -2.89916, 1, 0, 0, 1, 1,
-0.1470105, 0.6335381, -0.02542255, 1, 0, 0, 1, 1,
-0.1463926, -1.719247, -3.079069, 1, 0, 0, 1, 1,
-0.1408546, 0.7519032, -0.2276597, 1, 0, 0, 1, 1,
-0.1392019, 0.7681956, -0.4360163, 1, 0, 0, 1, 1,
-0.1364049, -0.7616525, -3.187642, 0, 0, 0, 1, 1,
-0.1327446, -0.5295041, -2.553401, 0, 0, 0, 1, 1,
-0.1315334, -0.1943781, -2.754213, 0, 0, 0, 1, 1,
-0.1296648, -0.5386364, -1.483025, 0, 0, 0, 1, 1,
-0.1270606, -0.4422735, -4.440909, 0, 0, 0, 1, 1,
-0.1255046, 1.750136, 0.1081229, 0, 0, 0, 1, 1,
-0.123797, 0.3473075, -1.565889, 0, 0, 0, 1, 1,
-0.1229519, 1.013874, -0.1213229, 1, 1, 1, 1, 1,
-0.1180825, -0.8509762, -3.161726, 1, 1, 1, 1, 1,
-0.109081, -1.731432, -3.92954, 1, 1, 1, 1, 1,
-0.1025757, 0.2617581, 0.1873599, 1, 1, 1, 1, 1,
-0.1017258, 0.2805425, 1.041259, 1, 1, 1, 1, 1,
-0.0864296, 1.560613, -0.1740878, 1, 1, 1, 1, 1,
-0.07942863, 0.8051287, 0.5655799, 1, 1, 1, 1, 1,
-0.07880843, 0.7221005, 0.5187671, 1, 1, 1, 1, 1,
-0.07683622, 2.084038, 1.075949, 1, 1, 1, 1, 1,
-0.0742071, -0.1553756, -1.535767, 1, 1, 1, 1, 1,
-0.06717578, 0.2191644, -0.2924169, 1, 1, 1, 1, 1,
-0.06670493, 0.3814222, -0.4107145, 1, 1, 1, 1, 1,
-0.06597378, -0.1168703, -4.27079, 1, 1, 1, 1, 1,
-0.06430963, 0.3347183, -0.7331499, 1, 1, 1, 1, 1,
-0.06360672, -0.9838134, -2.080962, 1, 1, 1, 1, 1,
-0.05827599, -0.1183183, -0.4851669, 0, 0, 1, 1, 1,
-0.0562456, -0.4153232, -3.082751, 1, 0, 0, 1, 1,
-0.03878697, -0.8186277, -2.972401, 1, 0, 0, 1, 1,
-0.03855735, 0.9689242, 2.304296, 1, 0, 0, 1, 1,
-0.03742868, -1.682741, -3.746859, 1, 0, 0, 1, 1,
-0.03683601, -0.03389851, -1.489629, 1, 0, 0, 1, 1,
-0.03280901, -0.6324895, -1.18739, 0, 0, 0, 1, 1,
-0.0279682, -0.1030811, -4.629651, 0, 0, 0, 1, 1,
-0.02792636, 0.7032765, -0.5018433, 0, 0, 0, 1, 1,
-0.02424944, 0.1087519, -2.676831, 0, 0, 0, 1, 1,
-0.019793, -0.6317614, -3.13605, 0, 0, 0, 1, 1,
-0.0192708, -0.6979486, -3.225161, 0, 0, 0, 1, 1,
-0.0133591, -1.377166, -2.151466, 0, 0, 0, 1, 1,
-0.01271502, -0.5706071, -3.837095, 1, 1, 1, 1, 1,
-0.01208556, -0.08209201, -2.445336, 1, 1, 1, 1, 1,
-0.009515908, -1.065043, -3.279671, 1, 1, 1, 1, 1,
-0.006705731, 0.3962561, -1.83178, 1, 1, 1, 1, 1,
-0.00315087, -0.5657312, -2.157092, 1, 1, 1, 1, 1,
-0.003074371, -0.02779542, -2.358433, 1, 1, 1, 1, 1,
-0.001482917, -0.04972043, -2.402824, 1, 1, 1, 1, 1,
0.0006610292, -0.6368515, 4.413733, 1, 1, 1, 1, 1,
0.008639102, -1.303906, 3.324512, 1, 1, 1, 1, 1,
0.01077133, -1.398536, 2.937828, 1, 1, 1, 1, 1,
0.01266224, -0.6800387, 2.999519, 1, 1, 1, 1, 1,
0.01613561, 0.3741613, -0.9236614, 1, 1, 1, 1, 1,
0.0177937, -1.526556, 1.370463, 1, 1, 1, 1, 1,
0.01845205, -0.4094865, 3.491159, 1, 1, 1, 1, 1,
0.01867358, -1.309208, 6.358092, 1, 1, 1, 1, 1,
0.02188201, 0.8066279, 0.7173311, 0, 0, 1, 1, 1,
0.02282664, 0.2118403, -0.4653385, 1, 0, 0, 1, 1,
0.02629339, 0.7444677, -2.307359, 1, 0, 0, 1, 1,
0.02675994, -0.07127051, 1.95208, 1, 0, 0, 1, 1,
0.02874607, 0.8737648, 0.769291, 1, 0, 0, 1, 1,
0.02943443, 0.3667819, 0.442917, 1, 0, 0, 1, 1,
0.0322903, 1.60686, 0.1481947, 0, 0, 0, 1, 1,
0.03277782, 0.5923412, 0.8141559, 0, 0, 0, 1, 1,
0.03490544, -0.08900181, 2.337534, 0, 0, 0, 1, 1,
0.03751352, -1.607041, 3.140839, 0, 0, 0, 1, 1,
0.03841239, 0.2737927, 0.5273669, 0, 0, 0, 1, 1,
0.04038601, 1.1315, 0.07696775, 0, 0, 0, 1, 1,
0.04081387, 0.6129013, -0.6653046, 0, 0, 0, 1, 1,
0.04180081, -0.3746536, 4.731886, 1, 1, 1, 1, 1,
0.04194785, 1.31918, 0.6530704, 1, 1, 1, 1, 1,
0.04288122, 2.600755, -1.563695, 1, 1, 1, 1, 1,
0.04489774, 0.2272199, -0.5548112, 1, 1, 1, 1, 1,
0.05249687, 0.1641846, 0.5774441, 1, 1, 1, 1, 1,
0.05272801, 1.237437, -1.583865, 1, 1, 1, 1, 1,
0.05300907, -2.634742, 3.677501, 1, 1, 1, 1, 1,
0.05303672, -1.90068, 1.569962, 1, 1, 1, 1, 1,
0.05611897, 0.08738593, 1.607196, 1, 1, 1, 1, 1,
0.0648857, 0.3302152, -0.4294496, 1, 1, 1, 1, 1,
0.06563394, 1.656458, -0.5725667, 1, 1, 1, 1, 1,
0.06617842, 0.546262, 1.202431, 1, 1, 1, 1, 1,
0.06739043, 0.9665676, -1.203352, 1, 1, 1, 1, 1,
0.06902619, -0.36162, 1.768832, 1, 1, 1, 1, 1,
0.07116916, -0.3677103, 3.65428, 1, 1, 1, 1, 1,
0.08659656, 2.058999, 0.9308516, 0, 0, 1, 1, 1,
0.09076349, 0.0552306, 3.322106, 1, 0, 0, 1, 1,
0.09233476, -0.7283471, 5.520117, 1, 0, 0, 1, 1,
0.09669966, -0.8775603, 1.34812, 1, 0, 0, 1, 1,
0.1029096, 1.279666, -1.383555, 1, 0, 0, 1, 1,
0.1055462, -1.872251, 3.190598, 1, 0, 0, 1, 1,
0.1072234, 0.03518698, 1.421844, 0, 0, 0, 1, 1,
0.1099417, -2.936667, 2.370789, 0, 0, 0, 1, 1,
0.1160656, -0.2671491, 3.428293, 0, 0, 0, 1, 1,
0.1161935, -0.9989052, 4.293704, 0, 0, 0, 1, 1,
0.1167698, -1.478125, 1.549808, 0, 0, 0, 1, 1,
0.1192663, -1.266138, 3.070301, 0, 0, 0, 1, 1,
0.1205314, 0.2086703, 1.043801, 0, 0, 0, 1, 1,
0.1258178, -0.4280732, 3.08362, 1, 1, 1, 1, 1,
0.1261617, 0.1600208, 0.4808902, 1, 1, 1, 1, 1,
0.1293326, -1.220193, 4.458565, 1, 1, 1, 1, 1,
0.1314069, -1.46388, 5.388513, 1, 1, 1, 1, 1,
0.1329044, 0.3236132, -1.3508, 1, 1, 1, 1, 1,
0.1358412, -0.3575667, 4.37152, 1, 1, 1, 1, 1,
0.1367736, -2.069262, 3.569243, 1, 1, 1, 1, 1,
0.1395483, -1.462816, 4.03987, 1, 1, 1, 1, 1,
0.1413416, 0.8180011, 0.2251683, 1, 1, 1, 1, 1,
0.1430139, 0.1621296, -0.5471452, 1, 1, 1, 1, 1,
0.1445749, 0.2362762, -0.6935281, 1, 1, 1, 1, 1,
0.1449303, -0.3033774, 1.489987, 1, 1, 1, 1, 1,
0.1452601, -0.04722444, 0.3316965, 1, 1, 1, 1, 1,
0.1481955, 0.737912, 0.4717073, 1, 1, 1, 1, 1,
0.1503815, -0.3304204, 4.579939, 1, 1, 1, 1, 1,
0.1558544, 2.150984, -0.6272815, 0, 0, 1, 1, 1,
0.1562082, 0.03827061, 1.786512, 1, 0, 0, 1, 1,
0.156969, -0.741186, 3.044616, 1, 0, 0, 1, 1,
0.1581558, 0.3604786, 1.761072, 1, 0, 0, 1, 1,
0.1597861, 0.842461, 0.3954839, 1, 0, 0, 1, 1,
0.1620796, -0.3016731, 4.34341, 1, 0, 0, 1, 1,
0.1621161, 0.4550049, 1.776806, 0, 0, 0, 1, 1,
0.1623525, 2.055457, 0.2239205, 0, 0, 0, 1, 1,
0.1625651, -0.1770046, 1.88753, 0, 0, 0, 1, 1,
0.1632645, 1.778, -0.1339774, 0, 0, 0, 1, 1,
0.1637383, 0.8093382, 0.3271964, 0, 0, 0, 1, 1,
0.1637736, -0.9360348, 3.054891, 0, 0, 0, 1, 1,
0.1701593, 0.3454293, 2.083938, 0, 0, 0, 1, 1,
0.1735869, -0.3853427, 2.296879, 1, 1, 1, 1, 1,
0.1747277, -1.262711, 2.545506, 1, 1, 1, 1, 1,
0.1782803, 0.3355494, 0.3185838, 1, 1, 1, 1, 1,
0.1816751, -0.6002453, 2.825031, 1, 1, 1, 1, 1,
0.183345, -0.2181914, 1.786976, 1, 1, 1, 1, 1,
0.1849264, 0.5644911, 0.09654178, 1, 1, 1, 1, 1,
0.1869331, -0.2085303, 2.370636, 1, 1, 1, 1, 1,
0.1873289, 0.6488032, 0.6780838, 1, 1, 1, 1, 1,
0.1895578, 1.098749, 0.8840444, 1, 1, 1, 1, 1,
0.1907444, 0.1675102, 0.8316799, 1, 1, 1, 1, 1,
0.1912631, -0.9173436, 5.12365, 1, 1, 1, 1, 1,
0.1920027, -0.7460513, 2.047033, 1, 1, 1, 1, 1,
0.1937883, -0.603453, 4.05658, 1, 1, 1, 1, 1,
0.1971488, -1.598123, 2.875568, 1, 1, 1, 1, 1,
0.2044617, 1.826418, 1.388904, 1, 1, 1, 1, 1,
0.2095209, -0.6751704, 4.018598, 0, 0, 1, 1, 1,
0.2114465, 1.547784, -0.1628764, 1, 0, 0, 1, 1,
0.2122692, -1.44916, 2.764489, 1, 0, 0, 1, 1,
0.2131156, 2.073936, 0.9491034, 1, 0, 0, 1, 1,
0.2136951, 0.3568705, 0.6498031, 1, 0, 0, 1, 1,
0.2180851, -1.15793, 2.405135, 1, 0, 0, 1, 1,
0.2200443, -0.5937611, 1.857675, 0, 0, 0, 1, 1,
0.2207634, 1.022983, 0.9141656, 0, 0, 0, 1, 1,
0.223176, 1.502219, -1.097282, 0, 0, 0, 1, 1,
0.2237546, 1.378565, -0.5491968, 0, 0, 0, 1, 1,
0.2261467, -1.908001, 1.880777, 0, 0, 0, 1, 1,
0.2261526, -0.9210448, 3.095779, 0, 0, 0, 1, 1,
0.2262849, -0.03284073, 1.529766, 0, 0, 0, 1, 1,
0.2325906, -0.06327468, 2.843599, 1, 1, 1, 1, 1,
0.2374647, -0.4764341, 5.236248, 1, 1, 1, 1, 1,
0.2376515, 0.5208607, 1.221092, 1, 1, 1, 1, 1,
0.2377746, 0.5114316, -1.037433, 1, 1, 1, 1, 1,
0.2386874, 1.544173, -0.6034353, 1, 1, 1, 1, 1,
0.2405456, 0.8746023, 0.6206656, 1, 1, 1, 1, 1,
0.2450505, 1.004076, -0.6357279, 1, 1, 1, 1, 1,
0.2454335, 0.6556199, -1.118993, 1, 1, 1, 1, 1,
0.24678, 1.402955, 0.3053083, 1, 1, 1, 1, 1,
0.2470734, -0.7820228, 4.314115, 1, 1, 1, 1, 1,
0.247268, 1.047894, 0.5611109, 1, 1, 1, 1, 1,
0.2476701, 1.09504, -0.8623941, 1, 1, 1, 1, 1,
0.2487481, -0.2103059, 1.406744, 1, 1, 1, 1, 1,
0.2496339, 0.2083569, 2.284678, 1, 1, 1, 1, 1,
0.2504462, -0.4538514, 4.753875, 1, 1, 1, 1, 1,
0.2505706, 1.313391, 0.5196128, 0, 0, 1, 1, 1,
0.2548453, 0.4524008, 0.3955293, 1, 0, 0, 1, 1,
0.2601549, -1.335086, 3.034618, 1, 0, 0, 1, 1,
0.2634681, 0.05536271, 0.9634935, 1, 0, 0, 1, 1,
0.2692443, 0.1656281, 1.340942, 1, 0, 0, 1, 1,
0.2731856, 0.3735149, 0.01885704, 1, 0, 0, 1, 1,
0.2745261, -0.9619622, 1.5135, 0, 0, 0, 1, 1,
0.2750095, 1.296698, -0.2271, 0, 0, 0, 1, 1,
0.2767812, -2.73779, 4.143133, 0, 0, 0, 1, 1,
0.2855751, 0.7047649, -0.1924956, 0, 0, 0, 1, 1,
0.2908697, 1.367659, -0.1585875, 0, 0, 0, 1, 1,
0.2916455, 0.327617, 0.6038427, 0, 0, 0, 1, 1,
0.2957712, -0.4399455, 2.585445, 0, 0, 0, 1, 1,
0.300343, 0.3511795, 1.018636, 1, 1, 1, 1, 1,
0.3030609, -0.6080882, 2.060095, 1, 1, 1, 1, 1,
0.3039474, 0.5808603, -1.209226, 1, 1, 1, 1, 1,
0.3043064, -0.3117909, 0.6864656, 1, 1, 1, 1, 1,
0.3046931, -1.078892, 4.291599, 1, 1, 1, 1, 1,
0.3050023, -1.142541, 3.895271, 1, 1, 1, 1, 1,
0.307544, 1.591974, 0.1393399, 1, 1, 1, 1, 1,
0.3075962, 0.04424757, 1.117354, 1, 1, 1, 1, 1,
0.3124622, -1.026294, 4.115753, 1, 1, 1, 1, 1,
0.3129143, -1.200783, 2.751146, 1, 1, 1, 1, 1,
0.3163088, 0.6145275, -0.2216474, 1, 1, 1, 1, 1,
0.319039, 1.311019, 0.8976869, 1, 1, 1, 1, 1,
0.3230667, -0.3320721, 3.787477, 1, 1, 1, 1, 1,
0.3276748, -1.095225, 0.9697407, 1, 1, 1, 1, 1,
0.3281097, 1.903993, -0.1688021, 1, 1, 1, 1, 1,
0.3298195, -0.9817099, 2.829975, 0, 0, 1, 1, 1,
0.3301359, -0.01813085, 2.85446, 1, 0, 0, 1, 1,
0.3317663, 0.3059816, 1.432238, 1, 0, 0, 1, 1,
0.3317788, 0.1320066, -0.1050004, 1, 0, 0, 1, 1,
0.3329335, -2.075589, 2.446484, 1, 0, 0, 1, 1,
0.3341129, 0.3664518, 0.7828072, 1, 0, 0, 1, 1,
0.3349246, 0.3188522, 0.9449852, 0, 0, 0, 1, 1,
0.3360728, -0.3384282, 1.26623, 0, 0, 0, 1, 1,
0.3365542, -0.2142132, 3.351222, 0, 0, 0, 1, 1,
0.3379807, 0.4960636, -1.51693, 0, 0, 0, 1, 1,
0.3384038, -0.1684534, 2.108947, 0, 0, 0, 1, 1,
0.3430997, -0.2713731, 1.133755, 0, 0, 0, 1, 1,
0.34317, 0.9409629, 0.09117809, 0, 0, 0, 1, 1,
0.3537799, 0.1948601, 0.2934411, 1, 1, 1, 1, 1,
0.3551715, 0.7266379, 1.230685, 1, 1, 1, 1, 1,
0.358632, 1.757968, 0.6086263, 1, 1, 1, 1, 1,
0.3597791, 0.8094077, 0.9806766, 1, 1, 1, 1, 1,
0.3643698, -0.4741437, 1.403331, 1, 1, 1, 1, 1,
0.3650914, -1.855037, 2.028091, 1, 1, 1, 1, 1,
0.3651708, -0.4116641, 2.402738, 1, 1, 1, 1, 1,
0.3703051, 1.103588, 0.07145665, 1, 1, 1, 1, 1,
0.3753667, 0.5014324, -0.2983918, 1, 1, 1, 1, 1,
0.3779646, -0.0364139, 3.133561, 1, 1, 1, 1, 1,
0.3794175, 0.002226923, -0.151287, 1, 1, 1, 1, 1,
0.381685, 1.25686, -0.009001158, 1, 1, 1, 1, 1,
0.384536, 1.495696, 0.8971521, 1, 1, 1, 1, 1,
0.3866098, 0.3027528, 0.4283846, 1, 1, 1, 1, 1,
0.3877563, -0.1330286, 2.519608, 1, 1, 1, 1, 1,
0.39474, -0.3889129, 4.423863, 0, 0, 1, 1, 1,
0.4019135, 0.4781606, 1.692248, 1, 0, 0, 1, 1,
0.40536, 0.6388394, 0.9853954, 1, 0, 0, 1, 1,
0.4056614, -0.5464256, 3.397493, 1, 0, 0, 1, 1,
0.4085062, -0.7951871, 2.696478, 1, 0, 0, 1, 1,
0.4142327, -2.050336, 1.76663, 1, 0, 0, 1, 1,
0.4153609, -0.2670853, 2.082342, 0, 0, 0, 1, 1,
0.4188299, 0.2952052, 1.25534, 0, 0, 0, 1, 1,
0.4191957, -0.0123155, 1.126012, 0, 0, 0, 1, 1,
0.4195197, 0.1110947, 0.3339577, 0, 0, 0, 1, 1,
0.4354873, 1.809564, -0.4141822, 0, 0, 0, 1, 1,
0.437476, -0.9838256, 2.114496, 0, 0, 0, 1, 1,
0.4390365, 1.340929, -0.3041122, 0, 0, 0, 1, 1,
0.4398421, -2.351609, 1.300866, 1, 1, 1, 1, 1,
0.4419838, 0.07274591, 1.215232, 1, 1, 1, 1, 1,
0.4432036, 0.2554476, 1.262753, 1, 1, 1, 1, 1,
0.4486007, -0.02189877, 1.267216, 1, 1, 1, 1, 1,
0.4511234, 1.297148, 0.6271372, 1, 1, 1, 1, 1,
0.4516684, 0.2588258, 1.937664, 1, 1, 1, 1, 1,
0.45706, 0.01841018, 0.1750595, 1, 1, 1, 1, 1,
0.4600744, -0.9260826, 3.800735, 1, 1, 1, 1, 1,
0.4637903, -0.4866281, 2.955521, 1, 1, 1, 1, 1,
0.4645159, -0.6186669, 2.088331, 1, 1, 1, 1, 1,
0.4667712, 0.5547419, -1.706221, 1, 1, 1, 1, 1,
0.4703217, 0.2233858, 0.2897798, 1, 1, 1, 1, 1,
0.4850983, -0.006531521, 1.10826, 1, 1, 1, 1, 1,
0.489707, 0.05511115, 1.816559, 1, 1, 1, 1, 1,
0.492238, 2.539423, 0.8358585, 1, 1, 1, 1, 1,
0.4924251, 0.581587, 0.6214947, 0, 0, 1, 1, 1,
0.493101, -0.5224698, 3.151556, 1, 0, 0, 1, 1,
0.4936095, -0.2220041, 0.4928949, 1, 0, 0, 1, 1,
0.4959574, -0.003945819, 3.97267, 1, 0, 0, 1, 1,
0.4982034, -0.5850537, 1.388889, 1, 0, 0, 1, 1,
0.5035053, 1.910982, 0.06623094, 1, 0, 0, 1, 1,
0.503579, 0.006825596, 1.628595, 0, 0, 0, 1, 1,
0.505209, -0.2045978, 1.4056, 0, 0, 0, 1, 1,
0.5065384, -0.8825375, 1.595925, 0, 0, 0, 1, 1,
0.521099, -0.9114803, 1.342289, 0, 0, 0, 1, 1,
0.5227595, -0.09289622, 2.534811, 0, 0, 0, 1, 1,
0.5235115, -1.763212, 3.363473, 0, 0, 0, 1, 1,
0.5248433, 0.3864291, 1.512212, 0, 0, 0, 1, 1,
0.5261133, -0.1716633, 2.766289, 1, 1, 1, 1, 1,
0.5359872, 0.2516634, 2.597562, 1, 1, 1, 1, 1,
0.536145, 0.1258204, 0.7426333, 1, 1, 1, 1, 1,
0.5386378, 1.219395, 0.2946289, 1, 1, 1, 1, 1,
0.5447997, -1.029666, 1.120579, 1, 1, 1, 1, 1,
0.5453, 0.5936375, 2.614612, 1, 1, 1, 1, 1,
0.5454832, 0.3959638, 2.422404, 1, 1, 1, 1, 1,
0.5480783, 0.7467185, 0.3751946, 1, 1, 1, 1, 1,
0.5536243, 0.6304311, 0.2774529, 1, 1, 1, 1, 1,
0.5544743, 1.357331, 0.8683051, 1, 1, 1, 1, 1,
0.5579481, 2.859063, 0.3330622, 1, 1, 1, 1, 1,
0.55981, -0.1621136, 1.4447, 1, 1, 1, 1, 1,
0.5643122, 0.746931, 0.8235282, 1, 1, 1, 1, 1,
0.5651816, -0.4458731, 1.862923, 1, 1, 1, 1, 1,
0.566156, -2.353695, 3.592042, 1, 1, 1, 1, 1,
0.5663572, 0.7936229, 0.5048656, 0, 0, 1, 1, 1,
0.5667112, -1.394973, 1.951768, 1, 0, 0, 1, 1,
0.5696441, 1.704688, -0.3131052, 1, 0, 0, 1, 1,
0.5699918, 0.5099511, -0.9914793, 1, 0, 0, 1, 1,
0.5707008, -1.344208, 1.013087, 1, 0, 0, 1, 1,
0.572987, 0.8009832, 0.2202097, 1, 0, 0, 1, 1,
0.5733086, 0.1514649, 3.719566, 0, 0, 0, 1, 1,
0.5736972, 0.666472, 0.0553037, 0, 0, 0, 1, 1,
0.5742434, 0.9724487, 0.6200513, 0, 0, 0, 1, 1,
0.5750984, 0.5327201, -0.07659185, 0, 0, 0, 1, 1,
0.5959525, -1.260118, 2.514812, 0, 0, 0, 1, 1,
0.5964905, -0.329781, 3.364193, 0, 0, 0, 1, 1,
0.5969796, 2.108202, 0.7381307, 0, 0, 0, 1, 1,
0.598088, 0.8701682, 1.029772, 1, 1, 1, 1, 1,
0.6053549, -0.699247, 3.648371, 1, 1, 1, 1, 1,
0.6072354, 0.6462922, 1.267187, 1, 1, 1, 1, 1,
0.6110452, -0.84583, 2.470293, 1, 1, 1, 1, 1,
0.6128833, -0.7175958, 3.513216, 1, 1, 1, 1, 1,
0.6155137, -1.405475, 2.699146, 1, 1, 1, 1, 1,
0.6176999, 0.6935753, -0.2935104, 1, 1, 1, 1, 1,
0.6192227, -1.113898, 3.170413, 1, 1, 1, 1, 1,
0.6192728, -1.349695, 2.437479, 1, 1, 1, 1, 1,
0.6269723, 0.1533032, -1.417593, 1, 1, 1, 1, 1,
0.6283893, 0.6407251, 1.289499, 1, 1, 1, 1, 1,
0.6312257, -0.469346, 2.914604, 1, 1, 1, 1, 1,
0.6333006, -0.5571219, 2.617125, 1, 1, 1, 1, 1,
0.6338331, 0.2212101, -0.1078961, 1, 1, 1, 1, 1,
0.6348212, -0.8368146, 2.228329, 1, 1, 1, 1, 1,
0.6396773, 1.6895, 2.029231, 0, 0, 1, 1, 1,
0.6409544, -0.6498452, 3.302172, 1, 0, 0, 1, 1,
0.6411888, 0.5818397, 2.413476, 1, 0, 0, 1, 1,
0.6430631, -0.9919147, 3.377283, 1, 0, 0, 1, 1,
0.643246, 2.457334, -0.5944817, 1, 0, 0, 1, 1,
0.64537, 0.4876857, 1.493976, 1, 0, 0, 1, 1,
0.6516641, 2.827881, 1.139345, 0, 0, 0, 1, 1,
0.6540963, -1.427657, 2.98346, 0, 0, 0, 1, 1,
0.6631265, -0.1900268, 1.251116, 0, 0, 0, 1, 1,
0.6644737, 0.3622469, 0.6782125, 0, 0, 0, 1, 1,
0.6677884, 1.57391, -1.068656, 0, 0, 0, 1, 1,
0.671095, 0.6626915, 1.313149, 0, 0, 0, 1, 1,
0.6752721, 1.665988, 0.4558963, 0, 0, 0, 1, 1,
0.6795911, 0.601503, 1.492551, 1, 1, 1, 1, 1,
0.6813869, -0.52111, 1.758376, 1, 1, 1, 1, 1,
0.6924101, 1.065182, 0.9261639, 1, 1, 1, 1, 1,
0.6925849, -1.625494, 3.233611, 1, 1, 1, 1, 1,
0.7067528, -1.418542, 1.447912, 1, 1, 1, 1, 1,
0.7095156, -2.498768, 3.800703, 1, 1, 1, 1, 1,
0.7095345, 1.040967, -0.2917965, 1, 1, 1, 1, 1,
0.7118685, 0.2995557, 2.162908, 1, 1, 1, 1, 1,
0.7155165, -0.6582215, 1.483151, 1, 1, 1, 1, 1,
0.7159717, 3.114799, 1.154113, 1, 1, 1, 1, 1,
0.7168871, 0.08585004, 0.8597321, 1, 1, 1, 1, 1,
0.7215591, -0.163449, 1.575798, 1, 1, 1, 1, 1,
0.7221153, 0.3419619, 0.9403425, 1, 1, 1, 1, 1,
0.7281892, 0.6335488, -0.6720728, 1, 1, 1, 1, 1,
0.7291691, -0.9303039, 2.270899, 1, 1, 1, 1, 1,
0.736107, 0.3322043, 1.194673, 0, 0, 1, 1, 1,
0.7517482, -0.7448345, 2.155648, 1, 0, 0, 1, 1,
0.7519128, 0.953792, -0.873437, 1, 0, 0, 1, 1,
0.7541744, 2.549894, -0.4814177, 1, 0, 0, 1, 1,
0.7558524, 0.8025516, 2.339744, 1, 0, 0, 1, 1,
0.756978, -0.3110953, 1.005894, 1, 0, 0, 1, 1,
0.7599571, 0.7732748, 2.11728, 0, 0, 0, 1, 1,
0.764528, 0.2429462, 1.778096, 0, 0, 0, 1, 1,
0.7686217, -0.717992, 1.040207, 0, 0, 0, 1, 1,
0.7764328, -0.01483397, 2.832013, 0, 0, 0, 1, 1,
0.7786672, 0.4433343, 1.360941, 0, 0, 0, 1, 1,
0.7801253, 1.727695, 0.117951, 0, 0, 0, 1, 1,
0.7874554, 0.6068203, -0.35038, 0, 0, 0, 1, 1,
0.7883573, -0.2906177, 1.764733, 1, 1, 1, 1, 1,
0.790773, -0.9187905, 2.235198, 1, 1, 1, 1, 1,
0.7908946, 1.837791, 0.1072225, 1, 1, 1, 1, 1,
0.7915384, 0.6975418, 3.400797, 1, 1, 1, 1, 1,
0.8057789, 0.1824645, 0.3027205, 1, 1, 1, 1, 1,
0.807819, 0.04388867, 1.901942, 1, 1, 1, 1, 1,
0.8088838, 0.6697664, -0.03656389, 1, 1, 1, 1, 1,
0.8155881, 0.07282473, 3.440518, 1, 1, 1, 1, 1,
0.8165684, 0.1676299, 1.37565, 1, 1, 1, 1, 1,
0.8195609, 0.3371012, 2.303848, 1, 1, 1, 1, 1,
0.8217878, -0.1879224, -0.2325932, 1, 1, 1, 1, 1,
0.8240005, 2.145894, -0.06928273, 1, 1, 1, 1, 1,
0.8309094, -1.324461, 1.556012, 1, 1, 1, 1, 1,
0.8387834, -1.168535, 2.540288, 1, 1, 1, 1, 1,
0.8391703, -0.2152974, 2.16796, 1, 1, 1, 1, 1,
0.8399574, 0.01422281, 2.203276, 0, 0, 1, 1, 1,
0.841346, 0.7820219, -0.9215661, 1, 0, 0, 1, 1,
0.8440961, -0.6894584, 2.42108, 1, 0, 0, 1, 1,
0.8442627, -0.3893864, 2.030719, 1, 0, 0, 1, 1,
0.8447854, 0.49621, 0.5557235, 1, 0, 0, 1, 1,
0.8497822, -0.5063046, 2.245622, 1, 0, 0, 1, 1,
0.8499232, 1.299081, 1.055604, 0, 0, 0, 1, 1,
0.8539276, 1.547935, 1.572378, 0, 0, 0, 1, 1,
0.8540638, 1.165532, 0.2711499, 0, 0, 0, 1, 1,
0.8544405, 0.6667635, -0.903384, 0, 0, 0, 1, 1,
0.8558009, -0.01581329, 2.883568, 0, 0, 0, 1, 1,
0.8582472, -2.549013, 2.659721, 0, 0, 0, 1, 1,
0.8605948, 1.631378, 1.888242, 0, 0, 0, 1, 1,
0.8616903, -0.31449, 0.9237301, 1, 1, 1, 1, 1,
0.8687567, -0.2769012, 1.102681, 1, 1, 1, 1, 1,
0.8705561, 0.7672098, -0.01661776, 1, 1, 1, 1, 1,
0.8712651, -1.664265, 3.798426, 1, 1, 1, 1, 1,
0.8738036, -0.4094316, 0.7190873, 1, 1, 1, 1, 1,
0.8738577, -1.201657, 2.254557, 1, 1, 1, 1, 1,
0.8853361, -1.922845, 4.822145, 1, 1, 1, 1, 1,
0.8927295, -0.6659904, 3.308224, 1, 1, 1, 1, 1,
0.8951036, -1.668707, 2.437917, 1, 1, 1, 1, 1,
0.8955886, 0.7773301, 1.685633, 1, 1, 1, 1, 1,
0.8963392, 0.1952922, 0.1330823, 1, 1, 1, 1, 1,
0.9008449, -0.7004567, 1.526031, 1, 1, 1, 1, 1,
0.9105803, -0.05426729, 1.313684, 1, 1, 1, 1, 1,
0.9105998, 0.02203231, 2.398221, 1, 1, 1, 1, 1,
0.915086, -1.86961, 2.698748, 1, 1, 1, 1, 1,
0.9183171, -2.005966, 2.629026, 0, 0, 1, 1, 1,
0.9183597, -0.7246104, 2.316774, 1, 0, 0, 1, 1,
0.9233572, 0.7401226, -0.1424705, 1, 0, 0, 1, 1,
0.9261024, -0.4717939, 3.81545, 1, 0, 0, 1, 1,
0.9279159, -0.5041994, 1.398185, 1, 0, 0, 1, 1,
0.9283554, -1.417609, 0.8138197, 1, 0, 0, 1, 1,
0.9284332, -1.360286, 4.002483, 0, 0, 0, 1, 1,
0.9346234, 1.821572, -0.3938296, 0, 0, 0, 1, 1,
0.9355779, -0.1690631, 2.92335, 0, 0, 0, 1, 1,
0.9364082, -0.01718764, 1.731872, 0, 0, 0, 1, 1,
0.9469789, 0.9183615, 0.7900145, 0, 0, 0, 1, 1,
0.9474895, 0.4084132, 1.400561, 0, 0, 0, 1, 1,
0.9477068, -0.5527663, 0.02994469, 0, 0, 0, 1, 1,
0.9478156, 1.949912, 0.09328625, 1, 1, 1, 1, 1,
0.9489055, -0.2436497, 2.786073, 1, 1, 1, 1, 1,
0.9509674, 1.120764, 1.452488, 1, 1, 1, 1, 1,
0.9535728, 0.4990097, -0.508041, 1, 1, 1, 1, 1,
0.9790217, -0.9912744, 1.704731, 1, 1, 1, 1, 1,
0.9939757, 0.06131349, 1.010328, 1, 1, 1, 1, 1,
1.004956, -1.71041, 1.865069, 1, 1, 1, 1, 1,
1.012481, 1.582133, 1.598213, 1, 1, 1, 1, 1,
1.013663, -0.5058089, 3.621763, 1, 1, 1, 1, 1,
1.014822, -0.7210945, 2.04243, 1, 1, 1, 1, 1,
1.022764, 0.2157563, 1.429383, 1, 1, 1, 1, 1,
1.026872, 0.1127753, 1.147126, 1, 1, 1, 1, 1,
1.028397, -1.54189, 1.529088, 1, 1, 1, 1, 1,
1.036494, -2.127031, 3.008343, 1, 1, 1, 1, 1,
1.047446, -1.614274, 1.894276, 1, 1, 1, 1, 1,
1.051692, 0.7347687, 2.070279, 0, 0, 1, 1, 1,
1.056365, 0.543918, 2.326056, 1, 0, 0, 1, 1,
1.060128, 1.672634, 2.619334, 1, 0, 0, 1, 1,
1.064063, -1.489463, 2.791416, 1, 0, 0, 1, 1,
1.074229, 0.4068764, 1.551908, 1, 0, 0, 1, 1,
1.076997, 0.6120004, -0.6217893, 1, 0, 0, 1, 1,
1.080196, 1.256518, -1.183116, 0, 0, 0, 1, 1,
1.081179, -0.09087597, 0.792523, 0, 0, 0, 1, 1,
1.08241, -0.1665015, 3.632899, 0, 0, 0, 1, 1,
1.08507, 1.160431, 0.2850808, 0, 0, 0, 1, 1,
1.085251, 0.4858449, 0.9201136, 0, 0, 0, 1, 1,
1.088249, 2.492619, 0.9173625, 0, 0, 0, 1, 1,
1.089241, -1.089838, 2.140492, 0, 0, 0, 1, 1,
1.101577, 0.07338709, 3.285141, 1, 1, 1, 1, 1,
1.106508, 1.48998, 1.184342, 1, 1, 1, 1, 1,
1.110502, -1.983817, 2.332329, 1, 1, 1, 1, 1,
1.112379, 0.6512612, 0.8868574, 1, 1, 1, 1, 1,
1.112554, -0.4904397, 2.943383, 1, 1, 1, 1, 1,
1.115737, -0.5110461, 1.363935, 1, 1, 1, 1, 1,
1.116312, 0.831923, 1.566847, 1, 1, 1, 1, 1,
1.117566, -0.6534551, 1.302805, 1, 1, 1, 1, 1,
1.119516, 1.322924, 1.269755, 1, 1, 1, 1, 1,
1.13743, -1.676066, 1.395598, 1, 1, 1, 1, 1,
1.145674, -1.428424, 3.761326, 1, 1, 1, 1, 1,
1.147896, -0.5483432, 1.980497, 1, 1, 1, 1, 1,
1.150677, 0.9332024, 0.8162974, 1, 1, 1, 1, 1,
1.156777, -1.796267, 3.828444, 1, 1, 1, 1, 1,
1.162023, -1.234409, 2.182291, 1, 1, 1, 1, 1,
1.163287, -1.155587, 3.159909, 0, 0, 1, 1, 1,
1.172936, -0.807474, -0.3052075, 1, 0, 0, 1, 1,
1.175897, -0.408974, 0.01707122, 1, 0, 0, 1, 1,
1.192209, 0.3894607, -1.138767, 1, 0, 0, 1, 1,
1.194236, 0.1226594, 1.714573, 1, 0, 0, 1, 1,
1.1964, -0.1817092, -0.02719101, 1, 0, 0, 1, 1,
1.20239, 0.5768821, 0.5966361, 0, 0, 0, 1, 1,
1.202733, 1.130037, -0.2227756, 0, 0, 0, 1, 1,
1.206194, -0.5337206, 1.979485, 0, 0, 0, 1, 1,
1.207571, 0.3124117, 1.906155, 0, 0, 0, 1, 1,
1.215938, 0.1411911, 2.305514, 0, 0, 0, 1, 1,
1.21724, -0.6709523, 1.711829, 0, 0, 0, 1, 1,
1.235819, -0.1812897, 3.049537, 0, 0, 0, 1, 1,
1.249503, -0.3740853, 2.257028, 1, 1, 1, 1, 1,
1.250831, -1.119563, 1.975327, 1, 1, 1, 1, 1,
1.262276, -0.5538681, 1.117273, 1, 1, 1, 1, 1,
1.26522, 0.197562, 2.741178, 1, 1, 1, 1, 1,
1.26523, -0.08109391, 1.147668, 1, 1, 1, 1, 1,
1.267265, -1.116574, 2.615494, 1, 1, 1, 1, 1,
1.271553, -0.691432, 1.357286, 1, 1, 1, 1, 1,
1.275517, -0.1254528, 2.936486, 1, 1, 1, 1, 1,
1.283915, -0.6819088, 3.287403, 1, 1, 1, 1, 1,
1.284688, 1.545064, 0.02926756, 1, 1, 1, 1, 1,
1.290187, 0.6719744, 1.363946, 1, 1, 1, 1, 1,
1.290388, -0.4256513, 2.244794, 1, 1, 1, 1, 1,
1.295936, 0.6235633, 0.9306123, 1, 1, 1, 1, 1,
1.297092, -1.675162, 2.172295, 1, 1, 1, 1, 1,
1.301512, 0.3873351, 2.472991, 1, 1, 1, 1, 1,
1.306508, -0.7396516, 1.442332, 0, 0, 1, 1, 1,
1.311003, -2.230911, 3.820561, 1, 0, 0, 1, 1,
1.325016, 0.2850774, 1.172673, 1, 0, 0, 1, 1,
1.327918, 0.7089943, 2.160727, 1, 0, 0, 1, 1,
1.328846, 0.3127333, 4.585503, 1, 0, 0, 1, 1,
1.3371, 0.9074309, 0.884402, 1, 0, 0, 1, 1,
1.337322, 1.234139, -0.6021146, 0, 0, 0, 1, 1,
1.348329, -0.09910304, 2.258146, 0, 0, 0, 1, 1,
1.35029, -0.1691689, 0.6855059, 0, 0, 0, 1, 1,
1.361385, -1.428595, 3.334502, 0, 0, 0, 1, 1,
1.361486, 1.142598, -0.3557791, 0, 0, 0, 1, 1,
1.363622, 0.2755445, 1.898549, 0, 0, 0, 1, 1,
1.36761, 0.6819549, 1.155424, 0, 0, 0, 1, 1,
1.376727, -0.3085106, 2.006531, 1, 1, 1, 1, 1,
1.381208, 0.3231869, 2.145409, 1, 1, 1, 1, 1,
1.407424, 1.428486, -0.2753297, 1, 1, 1, 1, 1,
1.410663, 1.896297, 0.9619123, 1, 1, 1, 1, 1,
1.417284, -0.4947081, 1.928226, 1, 1, 1, 1, 1,
1.41986, -0.7423452, 3.898413, 1, 1, 1, 1, 1,
1.425404, 0.6572703, 1.032279, 1, 1, 1, 1, 1,
1.440285, 1.395199, 0.5215015, 1, 1, 1, 1, 1,
1.443721, 0.822061, -0.530479, 1, 1, 1, 1, 1,
1.446093, 0.2520342, 2.158485, 1, 1, 1, 1, 1,
1.447233, 0.1583973, 1.842632, 1, 1, 1, 1, 1,
1.455734, 0.03710199, 1.792267, 1, 1, 1, 1, 1,
1.465812, 0.1110086, 1.21025, 1, 1, 1, 1, 1,
1.465982, -0.8530559, 1.062, 1, 1, 1, 1, 1,
1.468851, -0.5624471, 2.062275, 1, 1, 1, 1, 1,
1.473868, -0.03713122, 2.170039, 0, 0, 1, 1, 1,
1.488017, -1.031985, 2.955727, 1, 0, 0, 1, 1,
1.506938, 1.952819, 1.034834, 1, 0, 0, 1, 1,
1.511461, -0.4666062, 2.372499, 1, 0, 0, 1, 1,
1.5188, 0.1047432, 0.5586549, 1, 0, 0, 1, 1,
1.520776, -1.125099, 2.726978, 1, 0, 0, 1, 1,
1.524729, -0.6070098, 1.593011, 0, 0, 0, 1, 1,
1.532761, 1.244006, 3.065321, 0, 0, 0, 1, 1,
1.533268, 0.2800958, 1.277097, 0, 0, 0, 1, 1,
1.554889, 0.04566126, 1.584055, 0, 0, 0, 1, 1,
1.55495, -0.08669326, 0.323787, 0, 0, 0, 1, 1,
1.554963, 0.1936591, 1.120605, 0, 0, 0, 1, 1,
1.559757, -0.8772829, 2.538244, 0, 0, 0, 1, 1,
1.560262, -1.078537, 2.324276, 1, 1, 1, 1, 1,
1.567149, -0.4279894, 2.446809, 1, 1, 1, 1, 1,
1.567955, -0.8229917, 2.39644, 1, 1, 1, 1, 1,
1.568649, 1.977014, 1.225092, 1, 1, 1, 1, 1,
1.572393, 0.6092287, 0.757546, 1, 1, 1, 1, 1,
1.580414, -0.05527623, 1.487229, 1, 1, 1, 1, 1,
1.588259, 1.385301, 1.136576, 1, 1, 1, 1, 1,
1.588273, 2.161099, -1.092982, 1, 1, 1, 1, 1,
1.609473, 2.228446, 0.7747739, 1, 1, 1, 1, 1,
1.621446, 0.9567983, 0.02366665, 1, 1, 1, 1, 1,
1.63777, 1.016076, -0.1241402, 1, 1, 1, 1, 1,
1.637866, 0.3176108, 1.266745, 1, 1, 1, 1, 1,
1.640492, 0.5032928, 1.237878, 1, 1, 1, 1, 1,
1.665601, -1.348613, 2.377191, 1, 1, 1, 1, 1,
1.672543, -2.338945, 2.623536, 1, 1, 1, 1, 1,
1.67431, 0.8313662, 1.87436, 0, 0, 1, 1, 1,
1.684471, -0.6719798, 3.118307, 1, 0, 0, 1, 1,
1.686226, -2.001839, 1.547767, 1, 0, 0, 1, 1,
1.689395, -2.208136, 1.331517, 1, 0, 0, 1, 1,
1.700152, -0.8183445, 0.06634405, 1, 0, 0, 1, 1,
1.711623, 0.8117347, 1.862241, 1, 0, 0, 1, 1,
1.716062, -0.9431813, 2.818412, 0, 0, 0, 1, 1,
1.728093, -0.647506, 1.088965, 0, 0, 0, 1, 1,
1.746075, 0.6698915, 1.577087, 0, 0, 0, 1, 1,
1.748354, -0.8697858, -0.5558028, 0, 0, 0, 1, 1,
1.780487, 0.4320483, -0.05755845, 0, 0, 0, 1, 1,
1.783474, 0.4588887, 0.9969286, 0, 0, 0, 1, 1,
1.793743, 0.5410359, 2.352594, 0, 0, 0, 1, 1,
1.804782, 0.525282, 0.841789, 1, 1, 1, 1, 1,
1.829487, -0.3021003, 2.309108, 1, 1, 1, 1, 1,
1.840839, 0.5188584, 0.2951326, 1, 1, 1, 1, 1,
1.853817, 0.08144815, 2.537058, 1, 1, 1, 1, 1,
1.863416, 1.997993, 2.232, 1, 1, 1, 1, 1,
1.867554, 0.0107943, 2.006261, 1, 1, 1, 1, 1,
1.875143, -0.4472142, 1.620633, 1, 1, 1, 1, 1,
1.92179, 2.515741, 0.06813155, 1, 1, 1, 1, 1,
1.934417, 0.6494727, 0.7408819, 1, 1, 1, 1, 1,
1.962681, 0.006321463, 0.7201769, 1, 1, 1, 1, 1,
1.971119, 0.9010116, 2.700463, 1, 1, 1, 1, 1,
1.973946, -1.479575, 3.040764, 1, 1, 1, 1, 1,
1.996737, 0.8565544, 1.677967, 1, 1, 1, 1, 1,
2.005288, 0.4880518, 2.991958, 1, 1, 1, 1, 1,
2.026918, 0.2167761, -0.2934498, 1, 1, 1, 1, 1,
2.062617, 0.6042176, 0.4866695, 0, 0, 1, 1, 1,
2.070254, 0.3901458, 0.9440823, 1, 0, 0, 1, 1,
2.096299, -0.9161179, 1.33483, 1, 0, 0, 1, 1,
2.113628, 0.5119774, -0.1151816, 1, 0, 0, 1, 1,
2.131112, 0.3519653, 0.6734462, 1, 0, 0, 1, 1,
2.141431, -1.295968, 0.7648692, 1, 0, 0, 1, 1,
2.148203, 0.7045324, -1.17037, 0, 0, 0, 1, 1,
2.154101, 0.1432035, 1.574135, 0, 0, 0, 1, 1,
2.170191, -2.185009, 2.940065, 0, 0, 0, 1, 1,
2.191043, -0.07150135, 2.007116, 0, 0, 0, 1, 1,
2.226188, 0.07858467, 2.988305, 0, 0, 0, 1, 1,
2.229788, 1.104333, 1.010158, 0, 0, 0, 1, 1,
2.313548, -0.5879332, 1.534475, 0, 0, 0, 1, 1,
2.377103, -0.3735082, 1.103512, 1, 1, 1, 1, 1,
2.396893, -0.8276332, 2.096378, 1, 1, 1, 1, 1,
2.665599, 0.359938, 0.7332413, 1, 1, 1, 1, 1,
2.864344, 0.606858, 0.8896387, 1, 1, 1, 1, 1,
2.967674, 1.773086, 0.9593415, 1, 1, 1, 1, 1,
2.983247, -1.129447, 2.507719, 1, 1, 1, 1, 1,
3.047145, -0.6157334, 2.476342, 1, 1, 1, 1, 1
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
var radius = 9.796046;
var distance = 34.4082;
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
mvMatrix.translate( 0.1375809, -0.1745447, -0.6578023 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.4082);
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
