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
-2.893723, 0.7156639, -2.512532, 1, 0, 0, 1,
-2.640228, 1.532656, -1.727501, 1, 0.007843138, 0, 1,
-2.605759, -0.8223054, -1.805333, 1, 0.01176471, 0, 1,
-2.544653, 0.2957462, -0.01679589, 1, 0.01960784, 0, 1,
-2.52114, 0.6943266, -0.6363894, 1, 0.02352941, 0, 1,
-2.496814, -0.2699273, -1.726812, 1, 0.03137255, 0, 1,
-2.47614, -0.355568, -2.220512, 1, 0.03529412, 0, 1,
-2.407975, 1.868596, -1.1813, 1, 0.04313726, 0, 1,
-2.367165, 0.0772156, -1.754849, 1, 0.04705882, 0, 1,
-2.359536, -0.001822526, -1.418169, 1, 0.05490196, 0, 1,
-2.253903, 0.8188721, 0.936673, 1, 0.05882353, 0, 1,
-2.228448, -0.2375287, -0.5390822, 1, 0.06666667, 0, 1,
-2.209297, -2.389957, -2.467697, 1, 0.07058824, 0, 1,
-2.141479, 0.4956792, 0.1834713, 1, 0.07843138, 0, 1,
-2.125419, 0.4927828, -1.3125, 1, 0.08235294, 0, 1,
-2.12259, -1.029765, -3.554913, 1, 0.09019608, 0, 1,
-2.112523, 0.190206, -2.725985, 1, 0.09411765, 0, 1,
-2.098184, -1.495217, -2.285996, 1, 0.1019608, 0, 1,
-2.056664, 1.276673, -0.5530982, 1, 0.1098039, 0, 1,
-2.008989, -0.5844207, -1.465764, 1, 0.1137255, 0, 1,
-1.989785, 0.4286011, -0.1096743, 1, 0.1215686, 0, 1,
-1.982323, 2.492965, 0.2306754, 1, 0.1254902, 0, 1,
-1.956968, 0.9398415, -2.148377, 1, 0.1333333, 0, 1,
-1.930392, -0.3443968, -1.380935, 1, 0.1372549, 0, 1,
-1.887542, 0.8577631, -0.3760444, 1, 0.145098, 0, 1,
-1.868955, 0.8405249, 0.1049589, 1, 0.1490196, 0, 1,
-1.836124, 0.07384693, -1.942142, 1, 0.1568628, 0, 1,
-1.833333, 0.08903224, -3.070618, 1, 0.1607843, 0, 1,
-1.822339, -0.5758626, -1.86616, 1, 0.1686275, 0, 1,
-1.820293, 0.2792374, -1.8314, 1, 0.172549, 0, 1,
-1.811959, -0.4928678, -1.474262, 1, 0.1803922, 0, 1,
-1.809448, -0.8318756, -1.708074, 1, 0.1843137, 0, 1,
-1.806621, -1.257157, -2.579067, 1, 0.1921569, 0, 1,
-1.802801, 1.176335, -1.976857, 1, 0.1960784, 0, 1,
-1.790248, 1.764056, -1.107271, 1, 0.2039216, 0, 1,
-1.789604, -0.8536547, -0.9236594, 1, 0.2117647, 0, 1,
-1.765093, 1.572402, -1.222088, 1, 0.2156863, 0, 1,
-1.759606, -0.7859876, -0.8770971, 1, 0.2235294, 0, 1,
-1.750435, -0.3629058, -3.229055, 1, 0.227451, 0, 1,
-1.726983, 0.3319849, -2.474731, 1, 0.2352941, 0, 1,
-1.715263, -0.04563672, -2.383356, 1, 0.2392157, 0, 1,
-1.691356, -1.481611, -2.54541, 1, 0.2470588, 0, 1,
-1.688702, 2.4354, -1.826691, 1, 0.2509804, 0, 1,
-1.674699, -0.6022683, -1.284727, 1, 0.2588235, 0, 1,
-1.64897, 0.3030438, -0.627906, 1, 0.2627451, 0, 1,
-1.630015, 1.043879, -0.6809235, 1, 0.2705882, 0, 1,
-1.629857, 0.3409216, 0.06080553, 1, 0.2745098, 0, 1,
-1.618862, 1.058521, 0.01384219, 1, 0.282353, 0, 1,
-1.596548, 1.446628, -0.5686855, 1, 0.2862745, 0, 1,
-1.577317, -1.469077, -2.413832, 1, 0.2941177, 0, 1,
-1.572941, -0.02571538, -1.370026, 1, 0.3019608, 0, 1,
-1.560216, -0.002900516, -1.9496, 1, 0.3058824, 0, 1,
-1.540581, -0.3479748, -1.219135, 1, 0.3137255, 0, 1,
-1.528072, -0.8872916, -1.288442, 1, 0.3176471, 0, 1,
-1.506344, -1.383012, -2.823268, 1, 0.3254902, 0, 1,
-1.49432, -0.6239046, -2.869223, 1, 0.3294118, 0, 1,
-1.48505, 0.05602548, -1.968763, 1, 0.3372549, 0, 1,
-1.478628, 0.3538055, -2.324836, 1, 0.3411765, 0, 1,
-1.47789, -1.917741, -1.542642, 1, 0.3490196, 0, 1,
-1.477234, 0.5901411, -2.842145, 1, 0.3529412, 0, 1,
-1.47561, -0.1639497, -0.4904042, 1, 0.3607843, 0, 1,
-1.47431, -0.3655482, -1.345522, 1, 0.3647059, 0, 1,
-1.473052, 0.2329793, -1.072662, 1, 0.372549, 0, 1,
-1.469599, -0.6415797, 0.5472641, 1, 0.3764706, 0, 1,
-1.453255, -0.6850146, -2.957046, 1, 0.3843137, 0, 1,
-1.452097, 0.3975116, -0.7477967, 1, 0.3882353, 0, 1,
-1.450666, -1.408972, -0.9739233, 1, 0.3960784, 0, 1,
-1.438119, -0.7209229, -1.977746, 1, 0.4039216, 0, 1,
-1.437679, 0.4362881, -1.485989, 1, 0.4078431, 0, 1,
-1.432948, -0.4929403, -2.016911, 1, 0.4156863, 0, 1,
-1.43237, -0.354415, -3.034074, 1, 0.4196078, 0, 1,
-1.431603, 0.2781255, -1.010752, 1, 0.427451, 0, 1,
-1.430584, 0.5851524, -1.600333, 1, 0.4313726, 0, 1,
-1.42981, -1.499915, -1.894607, 1, 0.4392157, 0, 1,
-1.429161, 0.6462605, 0.4057044, 1, 0.4431373, 0, 1,
-1.410407, 1.778955, -0.8718469, 1, 0.4509804, 0, 1,
-1.40216, 0.01931656, -3.013363, 1, 0.454902, 0, 1,
-1.402128, -0.3345955, -2.168631, 1, 0.4627451, 0, 1,
-1.399293, -1.009391, -3.656334, 1, 0.4666667, 0, 1,
-1.394865, -0.8924167, -3.704179, 1, 0.4745098, 0, 1,
-1.394711, 0.4416276, 0.4015397, 1, 0.4784314, 0, 1,
-1.385852, 1.104262, -2.078833, 1, 0.4862745, 0, 1,
-1.380771, -0.219558, -3.51041, 1, 0.4901961, 0, 1,
-1.377572, 0.275041, 0.1537807, 1, 0.4980392, 0, 1,
-1.369463, 0.8639045, 0.5261169, 1, 0.5058824, 0, 1,
-1.366334, -0.1778462, -1.541097, 1, 0.509804, 0, 1,
-1.338965, -0.6586831, -1.10051, 1, 0.5176471, 0, 1,
-1.332124, 0.3622197, -1.966115, 1, 0.5215687, 0, 1,
-1.324383, 0.7315822, -0.6917655, 1, 0.5294118, 0, 1,
-1.313309, -0.0570099, -4.46841, 1, 0.5333334, 0, 1,
-1.311918, -1.015664, -2.73929, 1, 0.5411765, 0, 1,
-1.295097, 0.2181668, -2.420625, 1, 0.5450981, 0, 1,
-1.284622, 1.242363, -1.200608, 1, 0.5529412, 0, 1,
-1.284548, -0.5149472, -3.162354, 1, 0.5568628, 0, 1,
-1.274741, -0.7919828, -2.508409, 1, 0.5647059, 0, 1,
-1.270291, -0.6337315, -2.325088, 1, 0.5686275, 0, 1,
-1.267339, -0.5087701, -2.831903, 1, 0.5764706, 0, 1,
-1.263608, -0.4531819, -1.788277, 1, 0.5803922, 0, 1,
-1.247787, -0.1481548, -1.657024, 1, 0.5882353, 0, 1,
-1.247723, 0.8340164, -2.359998, 1, 0.5921569, 0, 1,
-1.226228, 0.07282139, -1.377876, 1, 0.6, 0, 1,
-1.223644, -1.189067, -3.207126, 1, 0.6078432, 0, 1,
-1.221418, -0.1614758, -2.382735, 1, 0.6117647, 0, 1,
-1.216962, -0.2433055, -3.523425, 1, 0.6196079, 0, 1,
-1.212093, 0.002238968, -2.019643, 1, 0.6235294, 0, 1,
-1.207537, -0.9237455, -1.936289, 1, 0.6313726, 0, 1,
-1.205232, 1.467449, -2.509213, 1, 0.6352941, 0, 1,
-1.20139, 0.9512063, -0.5766939, 1, 0.6431373, 0, 1,
-1.194384, -1.550938, -3.212426, 1, 0.6470588, 0, 1,
-1.192308, 1.487561, 0.1996686, 1, 0.654902, 0, 1,
-1.192029, 0.3176216, -1.39089, 1, 0.6588235, 0, 1,
-1.191974, -0.7014344, -1.973622, 1, 0.6666667, 0, 1,
-1.179042, -1.004781, -0.9315369, 1, 0.6705883, 0, 1,
-1.169603, -0.6025658, -1.098132, 1, 0.6784314, 0, 1,
-1.163621, -0.3453098, -1.002035, 1, 0.682353, 0, 1,
-1.158301, 2.251242, -0.7949942, 1, 0.6901961, 0, 1,
-1.156043, -1.184556, -3.410721, 1, 0.6941177, 0, 1,
-1.154664, -0.0566768, -1.365237, 1, 0.7019608, 0, 1,
-1.150545, -0.9105632, -2.159312, 1, 0.7098039, 0, 1,
-1.14726, 0.5153697, -2.74433, 1, 0.7137255, 0, 1,
-1.146212, 1.360678, -2.358987, 1, 0.7215686, 0, 1,
-1.144797, 1.220353, -0.8598532, 1, 0.7254902, 0, 1,
-1.143235, 0.6704928, -1.305286, 1, 0.7333333, 0, 1,
-1.142897, -0.4014108, -2.940387, 1, 0.7372549, 0, 1,
-1.139447, 0.7429338, -1.129251, 1, 0.7450981, 0, 1,
-1.133272, 0.8154911, -0.6279862, 1, 0.7490196, 0, 1,
-1.126599, 0.5525303, -2.293258, 1, 0.7568628, 0, 1,
-1.125488, -3.047282, -3.140382, 1, 0.7607843, 0, 1,
-1.121385, -0.2862412, -0.5699699, 1, 0.7686275, 0, 1,
-1.107347, -0.2808506, -1.354796, 1, 0.772549, 0, 1,
-1.10003, -2.290783, -2.223204, 1, 0.7803922, 0, 1,
-1.098887, -0.769806, -1.173141, 1, 0.7843137, 0, 1,
-1.098024, -0.9792749, -1.976082, 1, 0.7921569, 0, 1,
-1.092216, 0.5994974, 0.1825095, 1, 0.7960784, 0, 1,
-1.09136, -0.954087, -2.434963, 1, 0.8039216, 0, 1,
-1.088445, 0.6799307, -1.074508, 1, 0.8117647, 0, 1,
-1.085643, 0.1382282, -1.237629, 1, 0.8156863, 0, 1,
-1.084956, 0.9614789, -1.858088, 1, 0.8235294, 0, 1,
-1.060524, 1.12243, -0.3207138, 1, 0.827451, 0, 1,
-1.058992, 0.6724432, -2.390079, 1, 0.8352941, 0, 1,
-1.058851, 1.193527, -1.968338, 1, 0.8392157, 0, 1,
-1.052886, 0.1907599, -1.504295, 1, 0.8470588, 0, 1,
-1.052754, -0.6417459, -3.565566, 1, 0.8509804, 0, 1,
-1.049529, -1.827808, -2.737032, 1, 0.8588235, 0, 1,
-1.047566, 0.07772242, 0.8005455, 1, 0.8627451, 0, 1,
-1.044539, 0.3908904, -0.6909443, 1, 0.8705882, 0, 1,
-1.042556, -1.294974, -2.224566, 1, 0.8745098, 0, 1,
-1.042492, -0.06405608, -2.280889, 1, 0.8823529, 0, 1,
-1.042188, -1.234231, -3.046068, 1, 0.8862745, 0, 1,
-1.040887, 1.668618, -1.811443, 1, 0.8941177, 0, 1,
-1.033746, 1.241793, 0.7170243, 1, 0.8980392, 0, 1,
-1.031894, 0.8389732, -0.9860045, 1, 0.9058824, 0, 1,
-1.031851, 1.102218, -0.3756466, 1, 0.9137255, 0, 1,
-1.022301, -2.167735, -1.867606, 1, 0.9176471, 0, 1,
-1.018053, 1.165643, -1.213977, 1, 0.9254902, 0, 1,
-1.016187, -0.2058134, 0.2461772, 1, 0.9294118, 0, 1,
-1.0097, 0.9288029, -0.205365, 1, 0.9372549, 0, 1,
-1.006297, -0.07558569, -0.5364745, 1, 0.9411765, 0, 1,
-1.006061, 0.3032037, -3.24929, 1, 0.9490196, 0, 1,
-1.000723, -0.07147168, -0.1104749, 1, 0.9529412, 0, 1,
-0.9947137, -0.4574221, -0.8331059, 1, 0.9607843, 0, 1,
-0.986591, 2.170793, 2.434468, 1, 0.9647059, 0, 1,
-0.9853259, 0.5727573, -0.07209431, 1, 0.972549, 0, 1,
-0.9838625, 2.566644, 0.0912386, 1, 0.9764706, 0, 1,
-0.9828939, 0.2870005, -1.13376, 1, 0.9843137, 0, 1,
-0.9802765, -1.918681, -2.175167, 1, 0.9882353, 0, 1,
-0.9735677, 0.01319413, -2.271836, 1, 0.9960784, 0, 1,
-0.9715646, 0.2745451, -0.9828721, 0.9960784, 1, 0, 1,
-0.9663216, 2.980236, -1.434432, 0.9921569, 1, 0, 1,
-0.9655892, -2.284408, -2.52094, 0.9843137, 1, 0, 1,
-0.9620012, -0.3408317, -1.647216, 0.9803922, 1, 0, 1,
-0.9611117, -0.5279274, -0.5021667, 0.972549, 1, 0, 1,
-0.9603958, 0.2008954, -2.273418, 0.9686275, 1, 0, 1,
-0.9559475, -1.33135, -4.397906, 0.9607843, 1, 0, 1,
-0.9540236, 0.2281162, 0.4146202, 0.9568627, 1, 0, 1,
-0.9524332, -0.7417321, -2.298762, 0.9490196, 1, 0, 1,
-0.9336321, -0.1340513, -0.726079, 0.945098, 1, 0, 1,
-0.9327924, 0.2381401, -0.8646675, 0.9372549, 1, 0, 1,
-0.9311889, 1.300073, -0.7198566, 0.9333333, 1, 0, 1,
-0.9309757, 0.5817057, -1.945912, 0.9254902, 1, 0, 1,
-0.9218212, 2.145006, -1.411931, 0.9215686, 1, 0, 1,
-0.9170729, -1.010963, -2.70791, 0.9137255, 1, 0, 1,
-0.9127358, -0.8412696, -2.045462, 0.9098039, 1, 0, 1,
-0.9114116, 0.3349264, -0.6580291, 0.9019608, 1, 0, 1,
-0.9100939, -0.7023944, -3.433096, 0.8941177, 1, 0, 1,
-0.9021732, -0.06416558, -1.615794, 0.8901961, 1, 0, 1,
-0.9010437, 0.9955075, -1.308414, 0.8823529, 1, 0, 1,
-0.8948455, -1.188876, -1.761372, 0.8784314, 1, 0, 1,
-0.8907717, -0.6955416, -2.176546, 0.8705882, 1, 0, 1,
-0.8889124, -1.00557, -3.724342, 0.8666667, 1, 0, 1,
-0.8864366, 0.3419777, -1.620078, 0.8588235, 1, 0, 1,
-0.8859506, -0.2038135, -3.409192, 0.854902, 1, 0, 1,
-0.8839882, 1.219367, -0.1750627, 0.8470588, 1, 0, 1,
-0.8801484, -0.7802154, -2.107315, 0.8431373, 1, 0, 1,
-0.8792421, 0.3961653, 0.4512095, 0.8352941, 1, 0, 1,
-0.8788093, 0.1165007, -2.725011, 0.8313726, 1, 0, 1,
-0.8748755, 1.161419, 0.1538965, 0.8235294, 1, 0, 1,
-0.868666, -1.091104, -2.442742, 0.8196079, 1, 0, 1,
-0.8626356, -0.6334836, -2.733067, 0.8117647, 1, 0, 1,
-0.8608122, 0.100794, -1.292368, 0.8078431, 1, 0, 1,
-0.8588758, 1.227891, -1.191973, 0.8, 1, 0, 1,
-0.8552804, -1.10698, -1.710504, 0.7921569, 1, 0, 1,
-0.8510538, -1.073097, -0.8702766, 0.7882353, 1, 0, 1,
-0.8416387, -0.4041246, -1.767535, 0.7803922, 1, 0, 1,
-0.8408571, -0.3646739, -2.22334, 0.7764706, 1, 0, 1,
-0.8366281, -0.7064358, -2.983544, 0.7686275, 1, 0, 1,
-0.827706, -0.107787, -0.5612492, 0.7647059, 1, 0, 1,
-0.827103, 0.1593768, -0.5286995, 0.7568628, 1, 0, 1,
-0.8269011, 0.3915812, -1.747212, 0.7529412, 1, 0, 1,
-0.8259832, -1.54598, -1.122862, 0.7450981, 1, 0, 1,
-0.8242217, -0.7907608, -2.418544, 0.7411765, 1, 0, 1,
-0.824034, 0.972217, -0.5563036, 0.7333333, 1, 0, 1,
-0.8203287, 0.5475165, -0.7492026, 0.7294118, 1, 0, 1,
-0.8172429, -0.7177919, -2.915031, 0.7215686, 1, 0, 1,
-0.8146169, -1.292467, -2.647508, 0.7176471, 1, 0, 1,
-0.812401, -0.5280017, -2.75862, 0.7098039, 1, 0, 1,
-0.8097929, -1.885815, -3.05669, 0.7058824, 1, 0, 1,
-0.7958038, -0.5488175, -2.243148, 0.6980392, 1, 0, 1,
-0.7955595, -0.02541422, -2.431321, 0.6901961, 1, 0, 1,
-0.7938911, 0.04763766, 0.4899183, 0.6862745, 1, 0, 1,
-0.7932878, -0.8444797, -2.349762, 0.6784314, 1, 0, 1,
-0.7930294, -0.2454052, -2.065824, 0.6745098, 1, 0, 1,
-0.7881007, -0.5375379, -3.307309, 0.6666667, 1, 0, 1,
-0.784586, 0.1191174, -0.08330636, 0.6627451, 1, 0, 1,
-0.7803122, 3.192656, -0.2162352, 0.654902, 1, 0, 1,
-0.7796873, 0.1656357, 0.5734909, 0.6509804, 1, 0, 1,
-0.777034, 1.101171, 0.1670063, 0.6431373, 1, 0, 1,
-0.7716051, 0.5312912, 0.1751356, 0.6392157, 1, 0, 1,
-0.7700509, 0.653476, -0.7882493, 0.6313726, 1, 0, 1,
-0.756664, 0.02881255, -3.065305, 0.627451, 1, 0, 1,
-0.7536244, -0.7124954, -2.962341, 0.6196079, 1, 0, 1,
-0.7526439, -0.53322, -2.294581, 0.6156863, 1, 0, 1,
-0.7520548, -0.159921, -1.939081, 0.6078432, 1, 0, 1,
-0.7500204, 2.246799, 0.5039184, 0.6039216, 1, 0, 1,
-0.7487273, -1.057145, -4.244445, 0.5960785, 1, 0, 1,
-0.748004, 1.382315, 0.7831498, 0.5882353, 1, 0, 1,
-0.7364784, 0.401326, -1.246685, 0.5843138, 1, 0, 1,
-0.7352084, -0.6472208, -3.175097, 0.5764706, 1, 0, 1,
-0.7296773, 0.6059706, -2.422962, 0.572549, 1, 0, 1,
-0.7214257, 0.6796681, -2.135285, 0.5647059, 1, 0, 1,
-0.719384, 1.720681, -1.229264, 0.5607843, 1, 0, 1,
-0.7182863, 0.5155902, -1.666531, 0.5529412, 1, 0, 1,
-0.7173194, -0.2403826, -3.992853, 0.5490196, 1, 0, 1,
-0.7121091, -1.334584, -1.505424, 0.5411765, 1, 0, 1,
-0.7100061, 0.5390248, -1.629416, 0.5372549, 1, 0, 1,
-0.7093565, -0.421606, -2.261909, 0.5294118, 1, 0, 1,
-0.7007024, 0.2093625, -1.618657, 0.5254902, 1, 0, 1,
-0.6952173, -1.854606, -3.686608, 0.5176471, 1, 0, 1,
-0.6941036, -0.9928217, -2.340015, 0.5137255, 1, 0, 1,
-0.6931221, -1.284187, -3.023915, 0.5058824, 1, 0, 1,
-0.6875325, 0.2723331, -1.785519, 0.5019608, 1, 0, 1,
-0.6835679, 0.1872919, -1.130607, 0.4941176, 1, 0, 1,
-0.6787123, 0.8400682, -0.9680752, 0.4862745, 1, 0, 1,
-0.676424, -0.3836418, -3.344354, 0.4823529, 1, 0, 1,
-0.669819, 0.353662, -2.195288, 0.4745098, 1, 0, 1,
-0.6685757, -1.846703, -1.626939, 0.4705882, 1, 0, 1,
-0.6641594, 0.9656726, -1.690399, 0.4627451, 1, 0, 1,
-0.6579124, 1.246389, -0.5556582, 0.4588235, 1, 0, 1,
-0.6567275, -1.477265, -2.567975, 0.4509804, 1, 0, 1,
-0.6558788, -0.8398181, -2.484967, 0.4470588, 1, 0, 1,
-0.6548498, 0.3438949, -0.535278, 0.4392157, 1, 0, 1,
-0.6539318, 0.4234344, -1.587451, 0.4352941, 1, 0, 1,
-0.6518736, -0.7961748, -2.424922, 0.427451, 1, 0, 1,
-0.6475366, -0.5430021, -2.329782, 0.4235294, 1, 0, 1,
-0.6444103, 0.6566526, -1.71083, 0.4156863, 1, 0, 1,
-0.6438093, -1.464236, -2.112661, 0.4117647, 1, 0, 1,
-0.637818, -0.1275924, -2.420761, 0.4039216, 1, 0, 1,
-0.6365233, 0.3353361, -1.315445, 0.3960784, 1, 0, 1,
-0.6303723, -1.207987, -2.637069, 0.3921569, 1, 0, 1,
-0.628749, 1.259258, 0.2037346, 0.3843137, 1, 0, 1,
-0.6254357, -1.898135, -2.867802, 0.3803922, 1, 0, 1,
-0.6220223, 1.044834, -2.039803, 0.372549, 1, 0, 1,
-0.6099631, 0.538815, 1.034719, 0.3686275, 1, 0, 1,
-0.6067526, 1.018522, -0.1729455, 0.3607843, 1, 0, 1,
-0.5859039, 0.6103742, -0.6698069, 0.3568628, 1, 0, 1,
-0.5808225, 0.1947854, -1.017426, 0.3490196, 1, 0, 1,
-0.5806986, 0.1227837, -2.978181, 0.345098, 1, 0, 1,
-0.5768676, -1.260034, -1.795969, 0.3372549, 1, 0, 1,
-0.5761961, 1.237692, 0.2353764, 0.3333333, 1, 0, 1,
-0.575981, 0.3695551, -1.065498, 0.3254902, 1, 0, 1,
-0.5758895, -0.7927544, -1.782268, 0.3215686, 1, 0, 1,
-0.5740868, -0.7435525, -1.347029, 0.3137255, 1, 0, 1,
-0.572972, -0.08201961, -3.901027, 0.3098039, 1, 0, 1,
-0.5718956, -1.222938, -3.652379, 0.3019608, 1, 0, 1,
-0.5651084, -1.007107, -1.072835, 0.2941177, 1, 0, 1,
-0.5618148, 0.04873009, -0.5344809, 0.2901961, 1, 0, 1,
-0.5575755, -1.637258, -1.407008, 0.282353, 1, 0, 1,
-0.5517437, 0.5202268, -2.328633, 0.2784314, 1, 0, 1,
-0.5512489, 0.450316, -2.172933, 0.2705882, 1, 0, 1,
-0.5455474, -0.02786705, -1.531064, 0.2666667, 1, 0, 1,
-0.5441546, 0.6926778, 1.108916, 0.2588235, 1, 0, 1,
-0.5431418, 0.4185733, -1.284029, 0.254902, 1, 0, 1,
-0.5418323, -1.07906, -4.152136, 0.2470588, 1, 0, 1,
-0.5384556, 2.306203, -0.5328047, 0.2431373, 1, 0, 1,
-0.5277081, 1.196741, 0.1040165, 0.2352941, 1, 0, 1,
-0.5152689, -1.776307, -3.561312, 0.2313726, 1, 0, 1,
-0.5149599, 0.02547946, -2.186147, 0.2235294, 1, 0, 1,
-0.5122961, 0.4915838, -0.3556397, 0.2196078, 1, 0, 1,
-0.5109329, -1.578783, -3.137621, 0.2117647, 1, 0, 1,
-0.5108688, -0.1831254, -2.218744, 0.2078431, 1, 0, 1,
-0.5093653, -1.150768, -4.004008, 0.2, 1, 0, 1,
-0.507641, -0.1354174, -3.316255, 0.1921569, 1, 0, 1,
-0.5016412, 0.1767209, -3.066649, 0.1882353, 1, 0, 1,
-0.4977931, -0.5997893, -2.187321, 0.1803922, 1, 0, 1,
-0.4970546, 1.231728, 0.5239122, 0.1764706, 1, 0, 1,
-0.4961115, 1.356158, 0.5127593, 0.1686275, 1, 0, 1,
-0.4944201, -1.321959, -2.754248, 0.1647059, 1, 0, 1,
-0.4934076, 2.279443, 0.5128604, 0.1568628, 1, 0, 1,
-0.4913914, 1.060741, 1.143901, 0.1529412, 1, 0, 1,
-0.4885869, -0.6944194, -2.064746, 0.145098, 1, 0, 1,
-0.4838738, 1.47412, -0.5039958, 0.1411765, 1, 0, 1,
-0.4704662, 1.680722, -2.634684, 0.1333333, 1, 0, 1,
-0.4670677, 0.1154442, -2.083377, 0.1294118, 1, 0, 1,
-0.4665273, 0.556725, -0.8633357, 0.1215686, 1, 0, 1,
-0.4633196, 0.88736, 0.5308396, 0.1176471, 1, 0, 1,
-0.4626491, -2.013362, -2.449151, 0.1098039, 1, 0, 1,
-0.4624101, 0.4094867, -0.3468238, 0.1058824, 1, 0, 1,
-0.4610658, -1.215975, -3.27471, 0.09803922, 1, 0, 1,
-0.4577875, -0.1103448, -2.383023, 0.09019608, 1, 0, 1,
-0.4575436, -0.7994057, -3.15504, 0.08627451, 1, 0, 1,
-0.4527557, 0.187284, -1.039394, 0.07843138, 1, 0, 1,
-0.4522355, 0.6718025, -0.03128152, 0.07450981, 1, 0, 1,
-0.4488921, 0.3963455, 0.2699171, 0.06666667, 1, 0, 1,
-0.4413516, -1.295495, -3.518563, 0.0627451, 1, 0, 1,
-0.4387451, -1.146806, -1.37822, 0.05490196, 1, 0, 1,
-0.4346491, 0.3360053, 0.2559898, 0.05098039, 1, 0, 1,
-0.4334777, -0.01147719, -1.1203, 0.04313726, 1, 0, 1,
-0.4310545, 0.8506434, -0.8132716, 0.03921569, 1, 0, 1,
-0.4307332, -2.317978, -2.099267, 0.03137255, 1, 0, 1,
-0.4285251, -0.01919285, -1.439485, 0.02745098, 1, 0, 1,
-0.4275112, -0.5381621, -2.505184, 0.01960784, 1, 0, 1,
-0.4274628, -0.141509, -3.422557, 0.01568628, 1, 0, 1,
-0.4231515, -1.493818, -2.789938, 0.007843138, 1, 0, 1,
-0.4229817, -1.014921, -1.897852, 0.003921569, 1, 0, 1,
-0.4135329, -0.906162, -1.865682, 0, 1, 0.003921569, 1,
-0.412522, 0.1744751, -1.033949, 0, 1, 0.01176471, 1,
-0.4112802, -1.22361, -4.004906, 0, 1, 0.01568628, 1,
-0.4083819, -0.2276359, -1.238843, 0, 1, 0.02352941, 1,
-0.4069749, 0.3930887, -1.208551, 0, 1, 0.02745098, 1,
-0.4037352, 0.8693703, -0.4280718, 0, 1, 0.03529412, 1,
-0.4013419, 0.9633712, 1.49165, 0, 1, 0.03921569, 1,
-0.3997836, -0.3632073, -0.9890876, 0, 1, 0.04705882, 1,
-0.3974423, -1.977669, -3.534417, 0, 1, 0.05098039, 1,
-0.3919216, -1.04612, -3.122163, 0, 1, 0.05882353, 1,
-0.3914049, -0.3819813, -2.375657, 0, 1, 0.0627451, 1,
-0.3873418, -0.2549603, -2.72472, 0, 1, 0.07058824, 1,
-0.3867752, -0.5226513, -2.972097, 0, 1, 0.07450981, 1,
-0.3858489, -1.726265, -3.252372, 0, 1, 0.08235294, 1,
-0.3855499, -1.44721, -3.622271, 0, 1, 0.08627451, 1,
-0.3834085, -0.01034034, -2.533491, 0, 1, 0.09411765, 1,
-0.3818205, 0.3982928, -1.287798, 0, 1, 0.1019608, 1,
-0.3808121, -0.9131331, -2.981411, 0, 1, 0.1058824, 1,
-0.377917, -0.07368527, -3.403427, 0, 1, 0.1137255, 1,
-0.3763823, 0.1703498, -0.6569507, 0, 1, 0.1176471, 1,
-0.3724786, -0.7239235, -2.37956, 0, 1, 0.1254902, 1,
-0.3719853, -0.6116575, -1.192909, 0, 1, 0.1294118, 1,
-0.3675232, -0.09326448, -1.972883, 0, 1, 0.1372549, 1,
-0.3608299, -1.334342, -3.308987, 0, 1, 0.1411765, 1,
-0.3599063, -0.7522668, -1.971004, 0, 1, 0.1490196, 1,
-0.3589089, 0.7417973, 0.745796, 0, 1, 0.1529412, 1,
-0.3562267, -0.4389693, -3.163857, 0, 1, 0.1607843, 1,
-0.3553571, 0.3018008, -0.5789577, 0, 1, 0.1647059, 1,
-0.355307, -0.534573, -3.647018, 0, 1, 0.172549, 1,
-0.3547945, -0.4007851, -2.277097, 0, 1, 0.1764706, 1,
-0.352826, 0.9176359, 0.7902012, 0, 1, 0.1843137, 1,
-0.3514644, 0.41368, -1.040952, 0, 1, 0.1882353, 1,
-0.3500645, 1.860132, -2.347363, 0, 1, 0.1960784, 1,
-0.349762, -1.919891, -3.2915, 0, 1, 0.2039216, 1,
-0.3496702, -1.114313, -3.214207, 0, 1, 0.2078431, 1,
-0.3494584, 0.8082142, -1.157745, 0, 1, 0.2156863, 1,
-0.3425293, 0.06352133, -2.155653, 0, 1, 0.2196078, 1,
-0.3404406, 0.1904366, -0.7610808, 0, 1, 0.227451, 1,
-0.3385651, -0.1685959, -2.331488, 0, 1, 0.2313726, 1,
-0.3366514, 0.5957245, -0.08311969, 0, 1, 0.2392157, 1,
-0.3350303, -0.06726169, -1.157117, 0, 1, 0.2431373, 1,
-0.3338162, -0.850216, -2.607238, 0, 1, 0.2509804, 1,
-0.3284944, -1.168629, -2.490241, 0, 1, 0.254902, 1,
-0.3272322, 1.476243, -0.9701608, 0, 1, 0.2627451, 1,
-0.3255809, -0.1501394, -2.883063, 0, 1, 0.2666667, 1,
-0.3229632, -1.799965, -2.153508, 0, 1, 0.2745098, 1,
-0.3176126, 1.691915, 1.657248, 0, 1, 0.2784314, 1,
-0.3160419, -0.3920233, -0.1742624, 0, 1, 0.2862745, 1,
-0.3156669, 1.358861, 1.666407, 0, 1, 0.2901961, 1,
-0.3129976, -0.4120403, -2.406163, 0, 1, 0.2980392, 1,
-0.3121319, 1.626535, -1.068233, 0, 1, 0.3058824, 1,
-0.3070834, -0.08347506, -1.995702, 0, 1, 0.3098039, 1,
-0.3065932, 0.608669, -0.8800341, 0, 1, 0.3176471, 1,
-0.3052426, 1.188848, -0.2300891, 0, 1, 0.3215686, 1,
-0.3028744, 0.7582868, 0.9610183, 0, 1, 0.3294118, 1,
-0.2828165, 0.1724314, -0.5062358, 0, 1, 0.3333333, 1,
-0.2787457, 0.4505086, -0.1597464, 0, 1, 0.3411765, 1,
-0.2734732, -2.364148, -1.959978, 0, 1, 0.345098, 1,
-0.2726191, 1.089436, -1.191741, 0, 1, 0.3529412, 1,
-0.2694717, -0.412843, -3.379162, 0, 1, 0.3568628, 1,
-0.2687574, -0.4330792, -1.104638, 0, 1, 0.3647059, 1,
-0.2647144, -0.7710017, -4.145859, 0, 1, 0.3686275, 1,
-0.2607966, 0.3622054, -0.8761655, 0, 1, 0.3764706, 1,
-0.2602474, 2.624937, 0.2743497, 0, 1, 0.3803922, 1,
-0.2600609, -0.6764418, -3.368929, 0, 1, 0.3882353, 1,
-0.259984, -1.236396, -2.96702, 0, 1, 0.3921569, 1,
-0.2545638, -0.2522233, -1.05101, 0, 1, 0.4, 1,
-0.253471, -0.8003726, -3.112558, 0, 1, 0.4078431, 1,
-0.2529708, 1.858525, -0.8084333, 0, 1, 0.4117647, 1,
-0.2526421, -0.8222087, -3.374645, 0, 1, 0.4196078, 1,
-0.2462648, 0.9544554, -0.3673973, 0, 1, 0.4235294, 1,
-0.2372413, -0.5420016, -5.580524, 0, 1, 0.4313726, 1,
-0.2352611, 1.107354, 0.09245779, 0, 1, 0.4352941, 1,
-0.2346683, 0.333708, -0.1116212, 0, 1, 0.4431373, 1,
-0.2286762, -1.623654, -2.789495, 0, 1, 0.4470588, 1,
-0.2259092, 0.8434561, 0.6760277, 0, 1, 0.454902, 1,
-0.2255306, -0.2428879, -3.940578, 0, 1, 0.4588235, 1,
-0.2221374, -0.8923315, -3.325799, 0, 1, 0.4666667, 1,
-0.2197818, 1.120834, -0.1207342, 0, 1, 0.4705882, 1,
-0.2110204, -0.5631163, -2.060861, 0, 1, 0.4784314, 1,
-0.2093159, 0.02419792, -2.07419, 0, 1, 0.4823529, 1,
-0.2091944, 0.1788948, -1.561863, 0, 1, 0.4901961, 1,
-0.2056638, -0.6090895, -1.540212, 0, 1, 0.4941176, 1,
-0.2046021, -0.2979326, -4.252727, 0, 1, 0.5019608, 1,
-0.2027393, 1.356164, 0.07279465, 0, 1, 0.509804, 1,
-0.1980563, -0.7025528, -2.069894, 0, 1, 0.5137255, 1,
-0.1970554, -0.02064732, -2.208146, 0, 1, 0.5215687, 1,
-0.1933075, -0.4456384, -2.640004, 0, 1, 0.5254902, 1,
-0.1862654, -1.545732, -4.012035, 0, 1, 0.5333334, 1,
-0.1846604, -2.036884, -2.958999, 0, 1, 0.5372549, 1,
-0.1684355, -0.4532304, -2.204321, 0, 1, 0.5450981, 1,
-0.1681752, -0.1801708, -2.778796, 0, 1, 0.5490196, 1,
-0.1632947, 1.147549, -0.1629854, 0, 1, 0.5568628, 1,
-0.1528756, 0.6574332, -1.63094, 0, 1, 0.5607843, 1,
-0.1499802, 0.3017696, -0.06892868, 0, 1, 0.5686275, 1,
-0.1490424, -0.694456, -3.416405, 0, 1, 0.572549, 1,
-0.1456603, -1.179342, -3.368495, 0, 1, 0.5803922, 1,
-0.1456542, 0.7761038, 0.1052006, 0, 1, 0.5843138, 1,
-0.1395447, 0.9496309, -1.28734, 0, 1, 0.5921569, 1,
-0.1368192, 0.9344928, -0.0469047, 0, 1, 0.5960785, 1,
-0.1359584, -0.9552299, -2.293331, 0, 1, 0.6039216, 1,
-0.1303932, -0.01234964, -2.271974, 0, 1, 0.6117647, 1,
-0.1290117, -0.4278533, -3.000298, 0, 1, 0.6156863, 1,
-0.1232585, -1.154133, -3.506338, 0, 1, 0.6235294, 1,
-0.1228276, 0.8934413, 1.436703, 0, 1, 0.627451, 1,
-0.1213761, 0.6027514, -1.075915, 0, 1, 0.6352941, 1,
-0.1213439, 0.5014322, 0.9593883, 0, 1, 0.6392157, 1,
-0.1210929, 0.4392469, -1.287677, 0, 1, 0.6470588, 1,
-0.1206135, 0.07253888, -1.01808, 0, 1, 0.6509804, 1,
-0.1205244, 0.1406545, -1.222306, 0, 1, 0.6588235, 1,
-0.1186136, 0.7363765, 2.920009, 0, 1, 0.6627451, 1,
-0.1078553, -0.7311626, -1.849567, 0, 1, 0.6705883, 1,
-0.107299, -0.1436827, -2.265137, 0, 1, 0.6745098, 1,
-0.1025006, 1.631345, 0.9601701, 0, 1, 0.682353, 1,
-0.09932837, 0.01348176, -2.221149, 0, 1, 0.6862745, 1,
-0.09429247, -0.9707308, -0.4452912, 0, 1, 0.6941177, 1,
-0.09223142, -0.2267563, -1.431821, 0, 1, 0.7019608, 1,
-0.0921996, 1.227192, 0.4581675, 0, 1, 0.7058824, 1,
-0.08657639, 0.8406272, 0.6034341, 0, 1, 0.7137255, 1,
-0.07890029, 2.172462, -2.27176, 0, 1, 0.7176471, 1,
-0.07532331, -0.303311, -3.37562, 0, 1, 0.7254902, 1,
-0.07369506, -2.33823, -3.419796, 0, 1, 0.7294118, 1,
-0.07363409, -0.6836054, -2.147803, 0, 1, 0.7372549, 1,
-0.0697506, 0.9025227, -0.3222097, 0, 1, 0.7411765, 1,
-0.06950045, 0.6000987, -0.1681267, 0, 1, 0.7490196, 1,
-0.06904301, 0.6722897, 0.4630459, 0, 1, 0.7529412, 1,
-0.0652508, 0.2458698, 0.3894898, 0, 1, 0.7607843, 1,
-0.06483763, -0.9675627, -3.588796, 0, 1, 0.7647059, 1,
-0.06411809, -0.4996262, -1.799407, 0, 1, 0.772549, 1,
-0.06260642, -0.03127094, -1.40664, 0, 1, 0.7764706, 1,
-0.06215094, 0.3078337, 0.6739965, 0, 1, 0.7843137, 1,
-0.06150182, 0.68505, -0.3764229, 0, 1, 0.7882353, 1,
-0.05870428, 0.1611816, -1.949003, 0, 1, 0.7960784, 1,
-0.05560138, 0.544802, -1.803984, 0, 1, 0.8039216, 1,
-0.0507498, 2.51121, 0.2390813, 0, 1, 0.8078431, 1,
-0.05007139, -0.03034679, -1.371933, 0, 1, 0.8156863, 1,
-0.04950439, 0.4195143, 0.9841596, 0, 1, 0.8196079, 1,
-0.0447008, -0.3426196, -5.185152, 0, 1, 0.827451, 1,
-0.04141314, -1.648978, -4.575644, 0, 1, 0.8313726, 1,
-0.03832392, 0.2986867, 3.465394, 0, 1, 0.8392157, 1,
-0.03548289, 0.193848, -0.3587061, 0, 1, 0.8431373, 1,
-0.03494026, -0.3261221, -3.400084, 0, 1, 0.8509804, 1,
-0.02947983, -0.3712146, -4.318459, 0, 1, 0.854902, 1,
-0.02736327, -1.493234, -2.626037, 0, 1, 0.8627451, 1,
-0.0261276, -0.1427897, -4.266633, 0, 1, 0.8666667, 1,
-0.01990545, 0.730828, 0.4449511, 0, 1, 0.8745098, 1,
-0.01615249, -0.3434562, -4.012319, 0, 1, 0.8784314, 1,
-0.01249127, -0.9337052, -3.345667, 0, 1, 0.8862745, 1,
-0.01218262, -0.6945121, -3.477672, 0, 1, 0.8901961, 1,
-0.01140238, 0.6005468, -0.9178236, 0, 1, 0.8980392, 1,
-0.01053947, -0.8937881, -1.944978, 0, 1, 0.9058824, 1,
-0.01030251, 0.7239891, -0.08591557, 0, 1, 0.9098039, 1,
-0.008681157, -0.336395, -3.289726, 0, 1, 0.9176471, 1,
-0.007427808, 0.4428012, 0.02376567, 0, 1, 0.9215686, 1,
-0.00316499, 0.5979604, -1.392657, 0, 1, 0.9294118, 1,
-0.0007475109, 0.8632262, 0.7575984, 0, 1, 0.9333333, 1,
0.003916262, -0.6427268, 2.440809, 0, 1, 0.9411765, 1,
0.006226787, -1.50308, 2.530527, 0, 1, 0.945098, 1,
0.01316009, 0.6472419, -0.3397316, 0, 1, 0.9529412, 1,
0.01980914, 0.7856148, -0.1128828, 0, 1, 0.9568627, 1,
0.01986491, 0.5717555, -0.467918, 0, 1, 0.9647059, 1,
0.01990545, -1.601762, 2.306429, 0, 1, 0.9686275, 1,
0.01995339, 1.263417, 0.9425294, 0, 1, 0.9764706, 1,
0.0207227, 0.6816465, -0.00245095, 0, 1, 0.9803922, 1,
0.02468695, -0.4011041, 3.519639, 0, 1, 0.9882353, 1,
0.02499841, -1.022509, 4.271219, 0, 1, 0.9921569, 1,
0.02644114, -0.1021859, 4.020007, 0, 1, 1, 1,
0.02696223, 0.3322864, -0.765678, 0, 0.9921569, 1, 1,
0.03201305, 1.657237, 0.4853953, 0, 0.9882353, 1, 1,
0.0386478, 0.5399266, 0.2582883, 0, 0.9803922, 1, 1,
0.04369166, 2.651117, -3.134673, 0, 0.9764706, 1, 1,
0.04799923, 0.1611196, -0.1360893, 0, 0.9686275, 1, 1,
0.04897536, -0.6235321, 2.360296, 0, 0.9647059, 1, 1,
0.05642063, -1.456333, 3.541041, 0, 0.9568627, 1, 1,
0.06092473, -0.4841053, 3.997644, 0, 0.9529412, 1, 1,
0.06589651, -1.655357, 2.641742, 0, 0.945098, 1, 1,
0.06602073, -1.509583, 0.3779329, 0, 0.9411765, 1, 1,
0.06778962, 0.4233745, 2.106325, 0, 0.9333333, 1, 1,
0.06921124, -0.6126641, 1.720385, 0, 0.9294118, 1, 1,
0.07272609, 0.369454, 1.435569, 0, 0.9215686, 1, 1,
0.07549286, 0.2319156, -0.505853, 0, 0.9176471, 1, 1,
0.07748364, -0.2466236, 3.342009, 0, 0.9098039, 1, 1,
0.08116899, 0.2991366, 1.218392, 0, 0.9058824, 1, 1,
0.08589237, -1.125893, 1.695152, 0, 0.8980392, 1, 1,
0.08925781, -0.6132584, 1.829752, 0, 0.8901961, 1, 1,
0.09351105, -0.8799741, 2.298824, 0, 0.8862745, 1, 1,
0.09408254, -0.9776986, 3.617625, 0, 0.8784314, 1, 1,
0.09516806, 0.5026796, 1.818573, 0, 0.8745098, 1, 1,
0.09545932, 0.306547, 0.6143989, 0, 0.8666667, 1, 1,
0.0987846, 1.243361, -1.722351, 0, 0.8627451, 1, 1,
0.09907453, -2.069731, 3.479663, 0, 0.854902, 1, 1,
0.09922215, -0.8286442, 2.876915, 0, 0.8509804, 1, 1,
0.1006387, -0.4376717, 2.437937, 0, 0.8431373, 1, 1,
0.1021142, -0.6669886, 4.062314, 0, 0.8392157, 1, 1,
0.1067294, -1.71558, 4.373234, 0, 0.8313726, 1, 1,
0.1072732, 1.542221, 0.575753, 0, 0.827451, 1, 1,
0.1109559, 0.1041862, -0.3907685, 0, 0.8196079, 1, 1,
0.111312, 0.878087, -0.3816931, 0, 0.8156863, 1, 1,
0.1183278, -0.1586261, 4.388933, 0, 0.8078431, 1, 1,
0.1184521, -0.2943644, 2.211149, 0, 0.8039216, 1, 1,
0.1198242, 0.5116323, 0.8641613, 0, 0.7960784, 1, 1,
0.1198586, -0.6377931, 3.617881, 0, 0.7882353, 1, 1,
0.1278283, 1.042693, 0.1211, 0, 0.7843137, 1, 1,
0.1320711, 1.265611, -2.180178, 0, 0.7764706, 1, 1,
0.1404441, -0.0927636, 2.777826, 0, 0.772549, 1, 1,
0.1405842, -0.1878778, 1.256362, 0, 0.7647059, 1, 1,
0.142086, 0.173477, 0.0534082, 0, 0.7607843, 1, 1,
0.142502, 0.1207521, 1.407578, 0, 0.7529412, 1, 1,
0.1426166, 0.2725909, 0.8613135, 0, 0.7490196, 1, 1,
0.1448155, 0.6901045, -2.069468, 0, 0.7411765, 1, 1,
0.1451551, -0.7222468, 4.146429, 0, 0.7372549, 1, 1,
0.1475713, 0.644276, -0.085846, 0, 0.7294118, 1, 1,
0.1477593, 0.4900666, 0.4350946, 0, 0.7254902, 1, 1,
0.1514451, -1.014236, 3.279175, 0, 0.7176471, 1, 1,
0.1538295, 0.6693529, -0.1701675, 0, 0.7137255, 1, 1,
0.1573832, -1.603166, 3.731411, 0, 0.7058824, 1, 1,
0.159076, 0.7390009, 0.2601265, 0, 0.6980392, 1, 1,
0.159766, -0.1864952, 3.037952, 0, 0.6941177, 1, 1,
0.1610479, 0.3724155, 1.389625, 0, 0.6862745, 1, 1,
0.1631708, 0.08841918, 0.6868609, 0, 0.682353, 1, 1,
0.1656229, 1.143136, 1.317153, 0, 0.6745098, 1, 1,
0.1658339, 0.7277544, 0.1546434, 0, 0.6705883, 1, 1,
0.1673239, -0.3187745, 2.988008, 0, 0.6627451, 1, 1,
0.1676773, 1.099664, -1.371803, 0, 0.6588235, 1, 1,
0.1684482, -0.6200131, 2.848826, 0, 0.6509804, 1, 1,
0.1689858, -0.3652458, 2.163391, 0, 0.6470588, 1, 1,
0.1695255, -2.404541, 2.503125, 0, 0.6392157, 1, 1,
0.1706504, -0.3944267, 3.226028, 0, 0.6352941, 1, 1,
0.1771635, 0.06325153, 0.8634838, 0, 0.627451, 1, 1,
0.1816068, 0.8961295, -0.05659576, 0, 0.6235294, 1, 1,
0.1818905, 1.567527, 1.224743, 0, 0.6156863, 1, 1,
0.1828595, 0.1553175, 1.019789, 0, 0.6117647, 1, 1,
0.1847496, 0.6143683, 0.01511475, 0, 0.6039216, 1, 1,
0.1863437, 0.7697026, 0.9692762, 0, 0.5960785, 1, 1,
0.1882804, 0.6172534, 0.2812593, 0, 0.5921569, 1, 1,
0.1898101, -0.4449573, 2.863036, 0, 0.5843138, 1, 1,
0.190074, 1.211778, 0.01637099, 0, 0.5803922, 1, 1,
0.192496, 1.342695, 0.3234327, 0, 0.572549, 1, 1,
0.1933069, 1.020221, 0.5185434, 0, 0.5686275, 1, 1,
0.1947304, 0.03050703, 0.2038271, 0, 0.5607843, 1, 1,
0.1964283, -0.5691413, 2.739273, 0, 0.5568628, 1, 1,
0.2024547, -0.5866945, 3.057443, 0, 0.5490196, 1, 1,
0.2075057, -0.6103415, 3.439422, 0, 0.5450981, 1, 1,
0.2076708, -0.6232848, 2.73525, 0, 0.5372549, 1, 1,
0.2087524, -0.407225, 3.371289, 0, 0.5333334, 1, 1,
0.2099814, -0.5312682, 0.7675869, 0, 0.5254902, 1, 1,
0.2113644, 2.601997, -0.6494545, 0, 0.5215687, 1, 1,
0.2137152, -0.822562, 4.883412, 0, 0.5137255, 1, 1,
0.2144333, -1.633807, 2.686734, 0, 0.509804, 1, 1,
0.21444, 0.6173713, 0.6788418, 0, 0.5019608, 1, 1,
0.2181647, -0.6146792, 3.909893, 0, 0.4941176, 1, 1,
0.2205427, -0.4390271, 1.721552, 0, 0.4901961, 1, 1,
0.2207451, -0.8965809, 3.885552, 0, 0.4823529, 1, 1,
0.2275434, 0.5075473, 0.5975996, 0, 0.4784314, 1, 1,
0.2294221, 0.08537924, 0.32787, 0, 0.4705882, 1, 1,
0.2318878, 0.3347931, 0.8232775, 0, 0.4666667, 1, 1,
0.232372, -0.2036039, 3.590333, 0, 0.4588235, 1, 1,
0.2351073, -2.128506, 3.15808, 0, 0.454902, 1, 1,
0.2394958, -0.5170415, 2.808245, 0, 0.4470588, 1, 1,
0.2462859, -0.07258748, 2.178771, 0, 0.4431373, 1, 1,
0.2536828, 0.3574822, -0.2255187, 0, 0.4352941, 1, 1,
0.2558469, -0.6854119, 3.101986, 0, 0.4313726, 1, 1,
0.2560443, 0.4762738, 0.3135148, 0, 0.4235294, 1, 1,
0.2587466, 0.2163338, 2.315885, 0, 0.4196078, 1, 1,
0.2597308, -0.5208831, 2.856579, 0, 0.4117647, 1, 1,
0.2606125, -0.9010679, 3.053689, 0, 0.4078431, 1, 1,
0.2640682, 0.2125337, 2.061839, 0, 0.4, 1, 1,
0.2655003, 1.146937, -0.6906404, 0, 0.3921569, 1, 1,
0.2695377, 0.3031386, 1.696878, 0, 0.3882353, 1, 1,
0.27139, -0.0613106, 3.201942, 0, 0.3803922, 1, 1,
0.2725163, -0.2491785, 0.8922677, 0, 0.3764706, 1, 1,
0.2734428, 0.4292074, 0.919844, 0, 0.3686275, 1, 1,
0.2734667, -2.140163, 1.492532, 0, 0.3647059, 1, 1,
0.2735458, 0.7402039, 1.324165, 0, 0.3568628, 1, 1,
0.2767564, 1.388745, 0.07453, 0, 0.3529412, 1, 1,
0.2783622, 0.2078815, 1.077764, 0, 0.345098, 1, 1,
0.2809404, 0.6672413, -0.9731426, 0, 0.3411765, 1, 1,
0.2897422, 3.013354, 0.5292991, 0, 0.3333333, 1, 1,
0.292712, 2.078287, -0.01359633, 0, 0.3294118, 1, 1,
0.2930598, -0.5381179, 1.48359, 0, 0.3215686, 1, 1,
0.2949559, -0.3319632, 1.512728, 0, 0.3176471, 1, 1,
0.2964938, 0.6654283, 1.015143, 0, 0.3098039, 1, 1,
0.2987114, 1.524958, 1.893699, 0, 0.3058824, 1, 1,
0.3010905, 0.353562, 0.9992068, 0, 0.2980392, 1, 1,
0.3024464, -1.00727, 2.151185, 0, 0.2901961, 1, 1,
0.3037335, -0.7917624, 2.46725, 0, 0.2862745, 1, 1,
0.3048356, 0.982121, 0.962911, 0, 0.2784314, 1, 1,
0.3057805, -1.203988, 2.486996, 0, 0.2745098, 1, 1,
0.3079972, 0.5723444, -1.003082, 0, 0.2666667, 1, 1,
0.3190015, -1.151889, 3.233279, 0, 0.2627451, 1, 1,
0.322516, -0.3276899, 3.701723, 0, 0.254902, 1, 1,
0.3262126, 0.02514987, 4.05394, 0, 0.2509804, 1, 1,
0.3293684, 1.780006, 0.04067186, 0, 0.2431373, 1, 1,
0.3298582, -0.2086527, 2.732702, 0, 0.2392157, 1, 1,
0.3353266, -1.420138, 3.019192, 0, 0.2313726, 1, 1,
0.3359626, 1.597563, -0.6425548, 0, 0.227451, 1, 1,
0.3408514, 0.7705334, 1.802105, 0, 0.2196078, 1, 1,
0.3421155, -0.06853183, 3.714524, 0, 0.2156863, 1, 1,
0.3430127, -0.8603103, 3.884468, 0, 0.2078431, 1, 1,
0.3440556, 1.111939, 1.749722, 0, 0.2039216, 1, 1,
0.3443816, -0.2827091, 1.794167, 0, 0.1960784, 1, 1,
0.3444641, 0.5577201, 0.2257395, 0, 0.1882353, 1, 1,
0.3465069, 0.6364892, 1.192915, 0, 0.1843137, 1, 1,
0.3470997, -0.3903188, 2.356912, 0, 0.1764706, 1, 1,
0.347415, 1.243606, -0.8735101, 0, 0.172549, 1, 1,
0.3476901, 0.3626453, -0.1074621, 0, 0.1647059, 1, 1,
0.3483481, -0.1195171, 0.08275291, 0, 0.1607843, 1, 1,
0.3497869, -2.262162, 2.588774, 0, 0.1529412, 1, 1,
0.3543727, -0.9377156, 3.16299, 0, 0.1490196, 1, 1,
0.3554056, -0.9065825, 2.973202, 0, 0.1411765, 1, 1,
0.3560915, -0.2515552, 0.4842555, 0, 0.1372549, 1, 1,
0.363167, 0.4640971, 0.7223032, 0, 0.1294118, 1, 1,
0.3631872, 0.3105181, 1.453507, 0, 0.1254902, 1, 1,
0.366957, 0.3403648, 0.5464218, 0, 0.1176471, 1, 1,
0.3685697, 2.008034, 0.4945969, 0, 0.1137255, 1, 1,
0.3695249, 0.06696155, 0.6426015, 0, 0.1058824, 1, 1,
0.3722755, 0.5896917, 1.199762, 0, 0.09803922, 1, 1,
0.3722762, -0.9792899, 3.792293, 0, 0.09411765, 1, 1,
0.3725844, 0.7840505, 4.036473, 0, 0.08627451, 1, 1,
0.3736353, 0.1493379, 0.22811, 0, 0.08235294, 1, 1,
0.3737163, 0.5488644, 0.193617, 0, 0.07450981, 1, 1,
0.374228, -0.2346893, 2.209313, 0, 0.07058824, 1, 1,
0.3758679, -0.6138605, 3.121674, 0, 0.0627451, 1, 1,
0.3761868, -0.2153893, 1.302616, 0, 0.05882353, 1, 1,
0.3788029, -0.824982, 2.166784, 0, 0.05098039, 1, 1,
0.385785, -0.06697004, 0.1926861, 0, 0.04705882, 1, 1,
0.3873596, 0.6844239, 0.7803844, 0, 0.03921569, 1, 1,
0.3888841, 0.3043478, 1.146863, 0, 0.03529412, 1, 1,
0.3899307, -1.363215, 2.296905, 0, 0.02745098, 1, 1,
0.3904765, 0.6257956, 0.1711308, 0, 0.02352941, 1, 1,
0.3908574, 1.599294, 0.2367449, 0, 0.01568628, 1, 1,
0.3929283, 0.5660246, 0.3325124, 0, 0.01176471, 1, 1,
0.3964577, 0.2615531, 0.7855135, 0, 0.003921569, 1, 1,
0.3995761, 0.4176485, 1.380204, 0.003921569, 0, 1, 1,
0.401628, -0.3811828, 2.330316, 0.007843138, 0, 1, 1,
0.403272, 1.445584, -0.6898396, 0.01568628, 0, 1, 1,
0.4096985, -0.3891533, 3.982036, 0.01960784, 0, 1, 1,
0.41098, 0.6324546, -0.9623748, 0.02745098, 0, 1, 1,
0.4186377, -0.8303716, 3.922719, 0.03137255, 0, 1, 1,
0.4226396, -0.6142922, 2.859243, 0.03921569, 0, 1, 1,
0.4245809, 0.2941916, 3.689683, 0.04313726, 0, 1, 1,
0.4246145, 1.04212, 0.6191941, 0.05098039, 0, 1, 1,
0.4276202, 0.4451441, 1.384126, 0.05490196, 0, 1, 1,
0.4309135, -1.987626, 3.478873, 0.0627451, 0, 1, 1,
0.4337873, 1.800997, 0.5402802, 0.06666667, 0, 1, 1,
0.4348311, -0.4287409, 4.135084, 0.07450981, 0, 1, 1,
0.4357497, -1.356323, 3.028039, 0.07843138, 0, 1, 1,
0.4484285, -0.122706, 2.806339, 0.08627451, 0, 1, 1,
0.4504943, 1.279343, 1.879196, 0.09019608, 0, 1, 1,
0.4536659, -1.259836, 2.654596, 0.09803922, 0, 1, 1,
0.4538957, 0.1860726, 1.517248, 0.1058824, 0, 1, 1,
0.462262, 1.086933, 1.369853, 0.1098039, 0, 1, 1,
0.4653789, -0.4029259, 0.8102444, 0.1176471, 0, 1, 1,
0.4729958, 1.091505, 0.6545065, 0.1215686, 0, 1, 1,
0.4764657, -0.7638716, 3.094654, 0.1294118, 0, 1, 1,
0.4768578, -0.2946426, 2.447907, 0.1333333, 0, 1, 1,
0.478645, 1.059755, 0.6749771, 0.1411765, 0, 1, 1,
0.4858115, -1.891428, 2.529976, 0.145098, 0, 1, 1,
0.4872055, 0.3206211, 0.2156018, 0.1529412, 0, 1, 1,
0.4908439, 0.3385875, 1.092356, 0.1568628, 0, 1, 1,
0.4934742, -0.9512914, 1.227587, 0.1647059, 0, 1, 1,
0.5008624, 1.007781, 2.368667, 0.1686275, 0, 1, 1,
0.5048203, 1.159058, 0.4111019, 0.1764706, 0, 1, 1,
0.5094867, 0.3391268, -0.4252183, 0.1803922, 0, 1, 1,
0.5133796, 0.4832574, 1.539701, 0.1882353, 0, 1, 1,
0.514119, 0.1863241, 2.71527, 0.1921569, 0, 1, 1,
0.5154437, -0.8137191, 3.231028, 0.2, 0, 1, 1,
0.5177297, -0.312623, 1.747334, 0.2078431, 0, 1, 1,
0.5216171, -0.09285478, 3.989322, 0.2117647, 0, 1, 1,
0.5438781, 0.4145537, 1.522711, 0.2196078, 0, 1, 1,
0.5515037, -0.2677101, 1.927127, 0.2235294, 0, 1, 1,
0.5535467, 2.051073, 0.684736, 0.2313726, 0, 1, 1,
0.5635569, 1.435322, -0.8243611, 0.2352941, 0, 1, 1,
0.5659031, -0.3241078, 0.5886298, 0.2431373, 0, 1, 1,
0.5686494, 0.2330209, 0.654991, 0.2470588, 0, 1, 1,
0.5703202, 0.5971869, 2.314128, 0.254902, 0, 1, 1,
0.5738561, 0.6010724, 1.599517, 0.2588235, 0, 1, 1,
0.5739915, 0.09865795, 0.9064894, 0.2666667, 0, 1, 1,
0.5761066, -0.3347139, 2.353634, 0.2705882, 0, 1, 1,
0.5767168, 1.898585, 0.3676068, 0.2784314, 0, 1, 1,
0.5809022, 0.1965161, 1.577391, 0.282353, 0, 1, 1,
0.5817449, -0.9293175, 2.937481, 0.2901961, 0, 1, 1,
0.5837596, -0.2586466, 1.504722, 0.2941177, 0, 1, 1,
0.5889979, -0.6343148, 2.616732, 0.3019608, 0, 1, 1,
0.5953858, -0.6053423, 1.702325, 0.3098039, 0, 1, 1,
0.59877, 0.03763583, 3.656455, 0.3137255, 0, 1, 1,
0.6004468, 1.475657, 0.3402644, 0.3215686, 0, 1, 1,
0.6084606, -0.1556907, 1.531347, 0.3254902, 0, 1, 1,
0.6121747, -0.6092885, 1.29935, 0.3333333, 0, 1, 1,
0.6223546, 0.3769522, 1.237586, 0.3372549, 0, 1, 1,
0.6242335, 1.363458, 2.045544, 0.345098, 0, 1, 1,
0.6277199, 0.9928194, 0.4980967, 0.3490196, 0, 1, 1,
0.6291733, -1.197855, 4.069691, 0.3568628, 0, 1, 1,
0.6322327, -1.132624, 3.977512, 0.3607843, 0, 1, 1,
0.6343771, 0.8863825, 0.08778556, 0.3686275, 0, 1, 1,
0.636249, -0.189535, 3.626342, 0.372549, 0, 1, 1,
0.6368065, 0.6372197, 0.2232161, 0.3803922, 0, 1, 1,
0.6449062, -0.6963978, 2.229307, 0.3843137, 0, 1, 1,
0.6449816, -1.418843, 3.646672, 0.3921569, 0, 1, 1,
0.6530271, -0.1179966, 1.240541, 0.3960784, 0, 1, 1,
0.6567753, -1.251571, 2.916883, 0.4039216, 0, 1, 1,
0.6635591, -0.1303631, 2.877582, 0.4117647, 0, 1, 1,
0.6656801, 3.121766, -0.6105382, 0.4156863, 0, 1, 1,
0.6665668, -1.187547, 3.907019, 0.4235294, 0, 1, 1,
0.6676818, 0.7451665, -1.064908, 0.427451, 0, 1, 1,
0.6754498, -0.6978056, 1.436715, 0.4352941, 0, 1, 1,
0.6786741, 1.680941, 0.4403833, 0.4392157, 0, 1, 1,
0.6802548, 0.0505477, 0.2978462, 0.4470588, 0, 1, 1,
0.6806234, -1.042698, 1.628294, 0.4509804, 0, 1, 1,
0.681915, -1.314637, 5.359037, 0.4588235, 0, 1, 1,
0.6952997, 0.09475817, 2.339192, 0.4627451, 0, 1, 1,
0.7017949, -0.1535683, 1.028208, 0.4705882, 0, 1, 1,
0.7102106, 0.3822816, 1.420761, 0.4745098, 0, 1, 1,
0.7216888, 2.077106, -1.701727, 0.4823529, 0, 1, 1,
0.722196, -0.6872035, 0.5795613, 0.4862745, 0, 1, 1,
0.7285165, -0.5898613, 1.166383, 0.4941176, 0, 1, 1,
0.7305757, 0.7790204, 2.178117, 0.5019608, 0, 1, 1,
0.7337823, -0.3837367, 2.85239, 0.5058824, 0, 1, 1,
0.7360655, 0.5774494, 0.9971795, 0.5137255, 0, 1, 1,
0.7419066, -2.837968, 2.374016, 0.5176471, 0, 1, 1,
0.7419513, 1.521939, -0.4558582, 0.5254902, 0, 1, 1,
0.7486359, 0.3306738, 3.894494, 0.5294118, 0, 1, 1,
0.7518508, -0.6029362, 1.842035, 0.5372549, 0, 1, 1,
0.7557166, 0.1096194, 2.378377, 0.5411765, 0, 1, 1,
0.7604596, 1.286716, -0.3086661, 0.5490196, 0, 1, 1,
0.7619222, -0.5682253, 2.986912, 0.5529412, 0, 1, 1,
0.7632024, -1.28842, 2.084954, 0.5607843, 0, 1, 1,
0.7635455, -0.382476, 2.527008, 0.5647059, 0, 1, 1,
0.7665001, -2.121834, 2.657716, 0.572549, 0, 1, 1,
0.7689623, 0.1375969, 1.098118, 0.5764706, 0, 1, 1,
0.7694811, 0.3268966, 2.568998, 0.5843138, 0, 1, 1,
0.7737727, -0.4541241, 2.322302, 0.5882353, 0, 1, 1,
0.7756241, -0.5569198, 1.715985, 0.5960785, 0, 1, 1,
0.7784453, 0.9803513, -0.6207696, 0.6039216, 0, 1, 1,
0.7838371, 0.3306829, 1.194715, 0.6078432, 0, 1, 1,
0.7860223, 0.117762, 0.4407619, 0.6156863, 0, 1, 1,
0.7907176, 0.2842224, 0.5807938, 0.6196079, 0, 1, 1,
0.7951312, -1.201414, 4.623095, 0.627451, 0, 1, 1,
0.7951918, -1.057692, 1.962489, 0.6313726, 0, 1, 1,
0.7966062, 1.275858, -0.2027669, 0.6392157, 0, 1, 1,
0.8019843, 0.7547213, -0.5520216, 0.6431373, 0, 1, 1,
0.8119317, -0.0740552, 2.457114, 0.6509804, 0, 1, 1,
0.8204752, 0.0209373, 1.064727, 0.654902, 0, 1, 1,
0.821105, -1.445206, 1.597187, 0.6627451, 0, 1, 1,
0.8270023, 0.183113, 2.386512, 0.6666667, 0, 1, 1,
0.8270811, 1.678243, 0.6580935, 0.6745098, 0, 1, 1,
0.8360416, 0.511264, 1.120223, 0.6784314, 0, 1, 1,
0.8411613, -1.090547, 2.503798, 0.6862745, 0, 1, 1,
0.8426541, 0.4834487, 1.916605, 0.6901961, 0, 1, 1,
0.8435348, 0.1027426, 0.3260601, 0.6980392, 0, 1, 1,
0.8481156, 0.7154592, 0.7925565, 0.7058824, 0, 1, 1,
0.8505374, -0.6533087, 2.480412, 0.7098039, 0, 1, 1,
0.8518222, -0.4612354, 2.271635, 0.7176471, 0, 1, 1,
0.8524435, -2.284743, 3.114927, 0.7215686, 0, 1, 1,
0.8540329, 0.4048662, 1.768448, 0.7294118, 0, 1, 1,
0.8560486, 2.841186, -0.2067003, 0.7333333, 0, 1, 1,
0.8617092, -0.4628576, 3.527168, 0.7411765, 0, 1, 1,
0.8638712, -0.008265737, 1.243102, 0.7450981, 0, 1, 1,
0.8645771, 0.2315454, 1.651266, 0.7529412, 0, 1, 1,
0.8663051, 1.121043, -0.5946191, 0.7568628, 0, 1, 1,
0.8692531, -1.116222, 1.33436, 0.7647059, 0, 1, 1,
0.8703995, -1.003723, 2.273344, 0.7686275, 0, 1, 1,
0.8715203, -1.296051, 4.45331, 0.7764706, 0, 1, 1,
0.8731026, -0.05483103, 1.579245, 0.7803922, 0, 1, 1,
0.8748374, 3.276172, 0.1157069, 0.7882353, 0, 1, 1,
0.874958, -0.1140791, 3.444941, 0.7921569, 0, 1, 1,
0.8801193, 0.3573996, 2.157245, 0.8, 0, 1, 1,
0.8835822, -0.829527, 0.02468063, 0.8078431, 0, 1, 1,
0.8860765, -0.8834389, 3.107546, 0.8117647, 0, 1, 1,
0.8877783, 0.6885698, 2.834032, 0.8196079, 0, 1, 1,
0.8882335, 0.6545401, 1.665808, 0.8235294, 0, 1, 1,
0.8901268, 0.5094075, 0.07983291, 0.8313726, 0, 1, 1,
0.8911827, 1.036968, 1.188437, 0.8352941, 0, 1, 1,
0.8933865, -0.560217, 1.818268, 0.8431373, 0, 1, 1,
0.8945478, -0.2634629, 1.971239, 0.8470588, 0, 1, 1,
0.8956608, -0.554797, 2.755636, 0.854902, 0, 1, 1,
0.8982331, -1.6546, 3.255484, 0.8588235, 0, 1, 1,
0.8982346, -0.6165572, 0.9245761, 0.8666667, 0, 1, 1,
0.8983088, 1.166582, -0.7540505, 0.8705882, 0, 1, 1,
0.8991084, 1.05242, -0.1870541, 0.8784314, 0, 1, 1,
0.9022177, 0.5236492, 1.06722, 0.8823529, 0, 1, 1,
0.9080139, 0.2757636, 1.14565, 0.8901961, 0, 1, 1,
0.9097012, 0.1445641, 1.539359, 0.8941177, 0, 1, 1,
0.9143, -0.7564841, 4.220297, 0.9019608, 0, 1, 1,
0.9194938, 0.1372784, 1.058718, 0.9098039, 0, 1, 1,
0.9238753, 1.754698, 0.9277546, 0.9137255, 0, 1, 1,
0.9362466, 0.4068303, -0.1542489, 0.9215686, 0, 1, 1,
0.9390235, 0.1220323, -0.2441216, 0.9254902, 0, 1, 1,
0.9464427, -0.4162745, 1.908588, 0.9333333, 0, 1, 1,
0.9484541, 0.6099954, 0.5881612, 0.9372549, 0, 1, 1,
0.9489184, -0.4864901, 1.747992, 0.945098, 0, 1, 1,
0.9540937, 1.351174, 2.397913, 0.9490196, 0, 1, 1,
0.9560318, -0.03175851, 3.48565, 0.9568627, 0, 1, 1,
0.9616735, 0.5975857, 0.4765626, 0.9607843, 0, 1, 1,
0.9760593, -0.7919915, 1.258032, 0.9686275, 0, 1, 1,
0.9845897, 0.23859, 1.138354, 0.972549, 0, 1, 1,
0.9874246, -0.4084051, 3.293304, 0.9803922, 0, 1, 1,
0.9904731, 0.2788389, 0.9838416, 0.9843137, 0, 1, 1,
0.9911344, 0.1758949, -0.2939112, 0.9921569, 0, 1, 1,
0.9942167, 0.1618221, 0.6964828, 0.9960784, 0, 1, 1,
0.9956522, 0.2629154, 1.883672, 1, 0, 0.9960784, 1,
1.004386, 0.7329969, 1.496503, 1, 0, 0.9882353, 1,
1.01029, -0.567795, 3.588638, 1, 0, 0.9843137, 1,
1.011107, 0.2878842, 2.310005, 1, 0, 0.9764706, 1,
1.012787, 0.6923883, 2.008836, 1, 0, 0.972549, 1,
1.014449, -0.6010676, 3.261143, 1, 0, 0.9647059, 1,
1.026757, 0.9166113, 1.160822, 1, 0, 0.9607843, 1,
1.031973, -1.19376, 2.288197, 1, 0, 0.9529412, 1,
1.03233, -2.085135, 2.85746, 1, 0, 0.9490196, 1,
1.04187, -0.1692988, 1.854647, 1, 0, 0.9411765, 1,
1.046432, -2.102592, 3.136248, 1, 0, 0.9372549, 1,
1.048895, -0.3140413, 1.10431, 1, 0, 0.9294118, 1,
1.051843, -1.623285, 3.109776, 1, 0, 0.9254902, 1,
1.053129, -0.1903634, 0.2141074, 1, 0, 0.9176471, 1,
1.056786, -0.1179741, 0.9671134, 1, 0, 0.9137255, 1,
1.057445, -0.6588861, 1.716032, 1, 0, 0.9058824, 1,
1.08215, 0.09010992, 1.895132, 1, 0, 0.9019608, 1,
1.084308, 1.041501, 0.3967132, 1, 0, 0.8941177, 1,
1.088143, -0.08115242, 1.280291, 1, 0, 0.8862745, 1,
1.089481, -0.8087359, 2.737386, 1, 0, 0.8823529, 1,
1.092358, -0.3425205, 2.32426, 1, 0, 0.8745098, 1,
1.096544, 1.195901, 0.2459163, 1, 0, 0.8705882, 1,
1.115609, -1.820458, 1.524926, 1, 0, 0.8627451, 1,
1.118169, 1.800679, -1.69746, 1, 0, 0.8588235, 1,
1.125174, 0.3185745, 1.412223, 1, 0, 0.8509804, 1,
1.128122, 0.2583624, 3.208682, 1, 0, 0.8470588, 1,
1.135494, -0.5440253, 3.428717, 1, 0, 0.8392157, 1,
1.13806, 0.09495153, 1.928583, 1, 0, 0.8352941, 1,
1.141214, 0.701228, 1.499415, 1, 0, 0.827451, 1,
1.141654, 0.1721559, 2.32726, 1, 0, 0.8235294, 1,
1.154734, 1.042283, -1.064478, 1, 0, 0.8156863, 1,
1.162682, -0.7133495, 2.160945, 1, 0, 0.8117647, 1,
1.168351, 0.6607722, 2.74195, 1, 0, 0.8039216, 1,
1.169107, 2.042927, 0.1041598, 1, 0, 0.7960784, 1,
1.181993, 0.09258831, 0.9968425, 1, 0, 0.7921569, 1,
1.193598, 0.9434628, 2.228578, 1, 0, 0.7843137, 1,
1.194572, 1.894235, 3.643377, 1, 0, 0.7803922, 1,
1.198012, 1.539739, -0.1293883, 1, 0, 0.772549, 1,
1.207905, -0.8672086, 2.482994, 1, 0, 0.7686275, 1,
1.217718, 0.1975145, 1.954811, 1, 0, 0.7607843, 1,
1.230399, -0.2476971, 0.03174926, 1, 0, 0.7568628, 1,
1.235363, 0.1805951, 1.345554, 1, 0, 0.7490196, 1,
1.237613, -0.8569453, 2.642828, 1, 0, 0.7450981, 1,
1.251457, 0.3282371, 1.56026, 1, 0, 0.7372549, 1,
1.269495, -1.104325, 3.070001, 1, 0, 0.7333333, 1,
1.28103, -0.0615378, 2.045713, 1, 0, 0.7254902, 1,
1.284276, 0.4602884, 1.413755, 1, 0, 0.7215686, 1,
1.28907, -0.5328442, 0.293307, 1, 0, 0.7137255, 1,
1.289412, 0.798683, 0.7800014, 1, 0, 0.7098039, 1,
1.289565, 0.9838165, 1.994632, 1, 0, 0.7019608, 1,
1.290729, -2.101692, 2.697711, 1, 0, 0.6941177, 1,
1.296604, -1.204039, 2.945898, 1, 0, 0.6901961, 1,
1.298259, -0.056168, 1.809124, 1, 0, 0.682353, 1,
1.298365, 0.2678713, 3.85348, 1, 0, 0.6784314, 1,
1.298666, 0.3173118, 1.080284, 1, 0, 0.6705883, 1,
1.302033, -0.3307917, 0.7086, 1, 0, 0.6666667, 1,
1.309003, -1.244536, 1.355331, 1, 0, 0.6588235, 1,
1.31535, 1.474518, 1.648995, 1, 0, 0.654902, 1,
1.317712, 1.521625, 1.11085, 1, 0, 0.6470588, 1,
1.327355, -0.06064936, 1.678395, 1, 0, 0.6431373, 1,
1.337757, -0.09269171, 1.026078, 1, 0, 0.6352941, 1,
1.340093, -1.649867, 3.864237, 1, 0, 0.6313726, 1,
1.345265, 0.4909418, 2.007036, 1, 0, 0.6235294, 1,
1.359706, 0.3965887, 1.144643, 1, 0, 0.6196079, 1,
1.360986, -0.4750922, 1.315103, 1, 0, 0.6117647, 1,
1.370052, 0.8373825, 0.8628992, 1, 0, 0.6078432, 1,
1.371351, -0.06075233, 0.9595062, 1, 0, 0.6, 1,
1.382573, -0.3021848, 2.953758, 1, 0, 0.5921569, 1,
1.391346, 0.5263029, 0.4410651, 1, 0, 0.5882353, 1,
1.392531, -0.8896416, 3.373959, 1, 0, 0.5803922, 1,
1.394747, -1.666745, 1.837105, 1, 0, 0.5764706, 1,
1.397058, -1.320048, 3.065233, 1, 0, 0.5686275, 1,
1.417261, 0.7751071, 1.564281, 1, 0, 0.5647059, 1,
1.429359, 1.675628, 2.09284, 1, 0, 0.5568628, 1,
1.43013, 1.452576, 1.458712, 1, 0, 0.5529412, 1,
1.43149, 0.1295988, 0.2650771, 1, 0, 0.5450981, 1,
1.437338, -0.5235046, 1.546141, 1, 0, 0.5411765, 1,
1.454845, 0.9257461, 0.2917555, 1, 0, 0.5333334, 1,
1.462767, -0.02367589, 0.4666972, 1, 0, 0.5294118, 1,
1.469266, -0.1850657, 1.640774, 1, 0, 0.5215687, 1,
1.47341, -1.526225, -0.03685279, 1, 0, 0.5176471, 1,
1.477506, 0.3045086, 3.300035, 1, 0, 0.509804, 1,
1.483954, 0.1760147, 3.364578, 1, 0, 0.5058824, 1,
1.488511, 0.3701114, 1.819417, 1, 0, 0.4980392, 1,
1.492958, 1.93875, 0.4982541, 1, 0, 0.4901961, 1,
1.512004, -0.2167796, 2.923167, 1, 0, 0.4862745, 1,
1.513427, -0.9141084, 2.852151, 1, 0, 0.4784314, 1,
1.517927, 0.1949431, 1.119057, 1, 0, 0.4745098, 1,
1.525995, 0.05644583, 0.4957574, 1, 0, 0.4666667, 1,
1.526805, 1.744548, 1.397209, 1, 0, 0.4627451, 1,
1.534009, 0.7458345, 2.404254, 1, 0, 0.454902, 1,
1.546729, -0.08319347, 0.2091972, 1, 0, 0.4509804, 1,
1.557367, 1.271255, -0.6174864, 1, 0, 0.4431373, 1,
1.567386, 1.551719, -0.1507979, 1, 0, 0.4392157, 1,
1.575788, -1.337226, 0.6060441, 1, 0, 0.4313726, 1,
1.579019, 1.025451, 0.5577624, 1, 0, 0.427451, 1,
1.581029, 0.2567891, 0.9474752, 1, 0, 0.4196078, 1,
1.587576, -1.442881, 0.553133, 1, 0, 0.4156863, 1,
1.588892, -0.5922868, 3.635555, 1, 0, 0.4078431, 1,
1.596052, 0.4471818, -0.6374302, 1, 0, 0.4039216, 1,
1.596286, -0.6159374, 2.82233, 1, 0, 0.3960784, 1,
1.607315, 1.990975, 1.9324, 1, 0, 0.3882353, 1,
1.609682, 0.4071014, 2.07758, 1, 0, 0.3843137, 1,
1.626262, 0.3138061, 2.073404, 1, 0, 0.3764706, 1,
1.642467, 0.6070936, -0.09654001, 1, 0, 0.372549, 1,
1.661525, -0.6976966, 4.709146, 1, 0, 0.3647059, 1,
1.670534, -0.7358134, 2.368474, 1, 0, 0.3607843, 1,
1.674672, -0.2472651, 2.384696, 1, 0, 0.3529412, 1,
1.703674, 0.265713, 1.480186, 1, 0, 0.3490196, 1,
1.707199, 1.818558, 2.100456, 1, 0, 0.3411765, 1,
1.747651, 1.096151, 1.714053, 1, 0, 0.3372549, 1,
1.748413, -0.694059, 2.568416, 1, 0, 0.3294118, 1,
1.754753, -1.106848, 1.313291, 1, 0, 0.3254902, 1,
1.763618, 0.04625842, 0.9763718, 1, 0, 0.3176471, 1,
1.766808, -0.3161418, -0.2158917, 1, 0, 0.3137255, 1,
1.771743, -1.916935, 3.660559, 1, 0, 0.3058824, 1,
1.7768, -0.824388, 2.879051, 1, 0, 0.2980392, 1,
1.789409, -2.199596, 2.545084, 1, 0, 0.2941177, 1,
1.791452, -0.3342651, 1.50035, 1, 0, 0.2862745, 1,
1.814159, 0.2535758, -0.2978799, 1, 0, 0.282353, 1,
1.814423, -0.3306779, 1.143932, 1, 0, 0.2745098, 1,
1.825363, 2.022076, 0.6904623, 1, 0, 0.2705882, 1,
1.836191, 0.3070547, 2.983061, 1, 0, 0.2627451, 1,
1.856788, 1.202548, 2.487563, 1, 0, 0.2588235, 1,
1.860518, -0.8831142, 1.574528, 1, 0, 0.2509804, 1,
1.8735, -0.8220609, 2.277144, 1, 0, 0.2470588, 1,
1.890686, -2.277845, 1.966701, 1, 0, 0.2392157, 1,
1.891241, 2.154465, 0.4878906, 1, 0, 0.2352941, 1,
1.915191, -0.3124419, 1.656357, 1, 0, 0.227451, 1,
1.922006, 1.012299, 1.954394, 1, 0, 0.2235294, 1,
1.923546, 0.114962, 3.701836, 1, 0, 0.2156863, 1,
1.92689, -0.4224492, 1.734064, 1, 0, 0.2117647, 1,
1.931026, -2.224467, 0.9125558, 1, 0, 0.2039216, 1,
1.950057, 1.330027, -0.3983192, 1, 0, 0.1960784, 1,
1.969649, 0.8363789, 1.445776, 1, 0, 0.1921569, 1,
1.984003, 2.177897, -0.1447164, 1, 0, 0.1843137, 1,
1.985236, 0.7819212, 0.8114235, 1, 0, 0.1803922, 1,
1.988103, 1.071136, 2.250416, 1, 0, 0.172549, 1,
2.00167, 0.0485168, 2.282502, 1, 0, 0.1686275, 1,
2.013648, 0.6713784, 2.112016, 1, 0, 0.1607843, 1,
2.04437, -0.5694401, 0.7811032, 1, 0, 0.1568628, 1,
2.048201, 0.4415801, 2.205733, 1, 0, 0.1490196, 1,
2.048812, 1.247132, 0.7630073, 1, 0, 0.145098, 1,
2.069051, -0.2424022, 1.951703, 1, 0, 0.1372549, 1,
2.155916, 1.109722, 0.9942849, 1, 0, 0.1333333, 1,
2.190724, 0.120198, 1.649996, 1, 0, 0.1254902, 1,
2.248735, 0.435691, 1.335565, 1, 0, 0.1215686, 1,
2.254228, 2.01768, 1.811237, 1, 0, 0.1137255, 1,
2.31708, -0.06370606, 1.415431, 1, 0, 0.1098039, 1,
2.31928, 1.704346, 0.04107406, 1, 0, 0.1019608, 1,
2.354689, -0.465966, 1.524977, 1, 0, 0.09411765, 1,
2.361106, 0.5877194, 2.233929, 1, 0, 0.09019608, 1,
2.369279, -0.05321972, 3.245489, 1, 0, 0.08235294, 1,
2.398899, 0.3547468, 2.217993, 1, 0, 0.07843138, 1,
2.407207, 0.165921, 1.250954, 1, 0, 0.07058824, 1,
2.446225, 2.351623, 0.7435965, 1, 0, 0.06666667, 1,
2.489134, -0.3622517, 2.339049, 1, 0, 0.05882353, 1,
2.5373, -1.853648, 1.854276, 1, 0, 0.05490196, 1,
2.589657, 0.7571678, 1.376587, 1, 0, 0.04705882, 1,
2.763744, -0.0415744, 3.351937, 1, 0, 0.04313726, 1,
2.844631, -0.4888042, 2.192927, 1, 0, 0.03529412, 1,
2.917335, 0.6144648, 1.350483, 1, 0, 0.03137255, 1,
2.939084, 0.6533014, 1.700897, 1, 0, 0.02352941, 1,
2.940606, -0.7524655, 2.990738, 1, 0, 0.01960784, 1,
2.955403, -0.2111727, 0.1011313, 1, 0, 0.01176471, 1,
3.190045, 1.2412, 3.431926, 1, 0, 0.007843138, 1
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
0.1481611, -4.119108, -7.43478, 0, -0.5, 0.5, 0.5,
0.1481611, -4.119108, -7.43478, 1, -0.5, 0.5, 0.5,
0.1481611, -4.119108, -7.43478, 1, 1.5, 0.5, 0.5,
0.1481611, -4.119108, -7.43478, 0, 1.5, 0.5, 0.5
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
-3.924921, 0.1144447, -7.43478, 0, -0.5, 0.5, 0.5,
-3.924921, 0.1144447, -7.43478, 1, -0.5, 0.5, 0.5,
-3.924921, 0.1144447, -7.43478, 1, 1.5, 0.5, 0.5,
-3.924921, 0.1144447, -7.43478, 0, 1.5, 0.5, 0.5
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
-3.924921, -4.119108, -0.1107433, 0, -0.5, 0.5, 0.5,
-3.924921, -4.119108, -0.1107433, 1, -0.5, 0.5, 0.5,
-3.924921, -4.119108, -0.1107433, 1, 1.5, 0.5, 0.5,
-3.924921, -4.119108, -0.1107433, 0, 1.5, 0.5, 0.5
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
-2, -3.142134, -5.744617,
3, -3.142134, -5.744617,
-2, -3.142134, -5.744617,
-2, -3.304963, -6.026311,
-1, -3.142134, -5.744617,
-1, -3.304963, -6.026311,
0, -3.142134, -5.744617,
0, -3.304963, -6.026311,
1, -3.142134, -5.744617,
1, -3.304963, -6.026311,
2, -3.142134, -5.744617,
2, -3.304963, -6.026311,
3, -3.142134, -5.744617,
3, -3.304963, -6.026311
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
-2, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
-2, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
-2, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
-2, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5,
-1, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
-1, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
-1, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
-1, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5,
0, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
0, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
0, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
0, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5,
1, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
1, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
1, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
1, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5,
2, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
2, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
2, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
2, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5,
3, -3.630621, -6.589698, 0, -0.5, 0.5, 0.5,
3, -3.630621, -6.589698, 1, -0.5, 0.5, 0.5,
3, -3.630621, -6.589698, 1, 1.5, 0.5, 0.5,
3, -3.630621, -6.589698, 0, 1.5, 0.5, 0.5
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
-2.984979, -3, -5.744617,
-2.984979, 3, -5.744617,
-2.984979, -3, -5.744617,
-3.141636, -3, -6.026311,
-2.984979, -2, -5.744617,
-3.141636, -2, -6.026311,
-2.984979, -1, -5.744617,
-3.141636, -1, -6.026311,
-2.984979, 0, -5.744617,
-3.141636, 0, -6.026311,
-2.984979, 1, -5.744617,
-3.141636, 1, -6.026311,
-2.984979, 2, -5.744617,
-3.141636, 2, -6.026311,
-2.984979, 3, -5.744617,
-3.141636, 3, -6.026311
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
-3.45495, -3, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, -3, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, -3, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, -3, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, -2, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, -2, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, -2, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, -2, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, -1, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, -1, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, -1, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, -1, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, 0, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, 0, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, 0, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, 0, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, 1, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, 1, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, 1, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, 1, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, 2, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, 2, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, 2, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, 2, -6.589698, 0, 1.5, 0.5, 0.5,
-3.45495, 3, -6.589698, 0, -0.5, 0.5, 0.5,
-3.45495, 3, -6.589698, 1, -0.5, 0.5, 0.5,
-3.45495, 3, -6.589698, 1, 1.5, 0.5, 0.5,
-3.45495, 3, -6.589698, 0, 1.5, 0.5, 0.5
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
-2.984979, -3.142134, -4,
-2.984979, -3.142134, 4,
-2.984979, -3.142134, -4,
-3.141636, -3.304963, -4,
-2.984979, -3.142134, -2,
-3.141636, -3.304963, -2,
-2.984979, -3.142134, 0,
-3.141636, -3.304963, 0,
-2.984979, -3.142134, 2,
-3.141636, -3.304963, 2,
-2.984979, -3.142134, 4,
-3.141636, -3.304963, 4
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
-3.45495, -3.630621, -4, 0, -0.5, 0.5, 0.5,
-3.45495, -3.630621, -4, 1, -0.5, 0.5, 0.5,
-3.45495, -3.630621, -4, 1, 1.5, 0.5, 0.5,
-3.45495, -3.630621, -4, 0, 1.5, 0.5, 0.5,
-3.45495, -3.630621, -2, 0, -0.5, 0.5, 0.5,
-3.45495, -3.630621, -2, 1, -0.5, 0.5, 0.5,
-3.45495, -3.630621, -2, 1, 1.5, 0.5, 0.5,
-3.45495, -3.630621, -2, 0, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 0, 0, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 0, 1, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 0, 1, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 0, 0, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 2, 0, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 2, 1, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 2, 1, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 2, 0, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 4, 0, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 4, 1, -0.5, 0.5, 0.5,
-3.45495, -3.630621, 4, 1, 1.5, 0.5, 0.5,
-3.45495, -3.630621, 4, 0, 1.5, 0.5, 0.5
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
-2.984979, -3.142134, -5.744617,
-2.984979, 3.371024, -5.744617,
-2.984979, -3.142134, 5.523131,
-2.984979, 3.371024, 5.523131,
-2.984979, -3.142134, -5.744617,
-2.984979, -3.142134, 5.523131,
-2.984979, 3.371024, -5.744617,
-2.984979, 3.371024, 5.523131,
-2.984979, -3.142134, -5.744617,
3.281301, -3.142134, -5.744617,
-2.984979, -3.142134, 5.523131,
3.281301, -3.142134, 5.523131,
-2.984979, 3.371024, -5.744617,
3.281301, 3.371024, -5.744617,
-2.984979, 3.371024, 5.523131,
3.281301, 3.371024, 5.523131,
3.281301, -3.142134, -5.744617,
3.281301, 3.371024, -5.744617,
3.281301, -3.142134, 5.523131,
3.281301, 3.371024, 5.523131,
3.281301, -3.142134, -5.744617,
3.281301, -3.142134, 5.523131,
3.281301, 3.371024, -5.744617,
3.281301, 3.371024, 5.523131
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
var radius = 7.713195;
var distance = 34.31688;
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
mvMatrix.translate( -0.1481611, -0.1144447, 0.1107433 );
mvMatrix.scale( 1.330878, 1.280432, 0.7401352 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31688);
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
Chloroxuron<-read.table("Chloroxuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chloroxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chloroxuron' not found
```

```r
y<-Chloroxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chloroxuron' not found
```

```r
z<-Chloroxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chloroxuron' not found
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
-2.893723, 0.7156639, -2.512532, 0, 0, 1, 1, 1,
-2.640228, 1.532656, -1.727501, 1, 0, 0, 1, 1,
-2.605759, -0.8223054, -1.805333, 1, 0, 0, 1, 1,
-2.544653, 0.2957462, -0.01679589, 1, 0, 0, 1, 1,
-2.52114, 0.6943266, -0.6363894, 1, 0, 0, 1, 1,
-2.496814, -0.2699273, -1.726812, 1, 0, 0, 1, 1,
-2.47614, -0.355568, -2.220512, 0, 0, 0, 1, 1,
-2.407975, 1.868596, -1.1813, 0, 0, 0, 1, 1,
-2.367165, 0.0772156, -1.754849, 0, 0, 0, 1, 1,
-2.359536, -0.001822526, -1.418169, 0, 0, 0, 1, 1,
-2.253903, 0.8188721, 0.936673, 0, 0, 0, 1, 1,
-2.228448, -0.2375287, -0.5390822, 0, 0, 0, 1, 1,
-2.209297, -2.389957, -2.467697, 0, 0, 0, 1, 1,
-2.141479, 0.4956792, 0.1834713, 1, 1, 1, 1, 1,
-2.125419, 0.4927828, -1.3125, 1, 1, 1, 1, 1,
-2.12259, -1.029765, -3.554913, 1, 1, 1, 1, 1,
-2.112523, 0.190206, -2.725985, 1, 1, 1, 1, 1,
-2.098184, -1.495217, -2.285996, 1, 1, 1, 1, 1,
-2.056664, 1.276673, -0.5530982, 1, 1, 1, 1, 1,
-2.008989, -0.5844207, -1.465764, 1, 1, 1, 1, 1,
-1.989785, 0.4286011, -0.1096743, 1, 1, 1, 1, 1,
-1.982323, 2.492965, 0.2306754, 1, 1, 1, 1, 1,
-1.956968, 0.9398415, -2.148377, 1, 1, 1, 1, 1,
-1.930392, -0.3443968, -1.380935, 1, 1, 1, 1, 1,
-1.887542, 0.8577631, -0.3760444, 1, 1, 1, 1, 1,
-1.868955, 0.8405249, 0.1049589, 1, 1, 1, 1, 1,
-1.836124, 0.07384693, -1.942142, 1, 1, 1, 1, 1,
-1.833333, 0.08903224, -3.070618, 1, 1, 1, 1, 1,
-1.822339, -0.5758626, -1.86616, 0, 0, 1, 1, 1,
-1.820293, 0.2792374, -1.8314, 1, 0, 0, 1, 1,
-1.811959, -0.4928678, -1.474262, 1, 0, 0, 1, 1,
-1.809448, -0.8318756, -1.708074, 1, 0, 0, 1, 1,
-1.806621, -1.257157, -2.579067, 1, 0, 0, 1, 1,
-1.802801, 1.176335, -1.976857, 1, 0, 0, 1, 1,
-1.790248, 1.764056, -1.107271, 0, 0, 0, 1, 1,
-1.789604, -0.8536547, -0.9236594, 0, 0, 0, 1, 1,
-1.765093, 1.572402, -1.222088, 0, 0, 0, 1, 1,
-1.759606, -0.7859876, -0.8770971, 0, 0, 0, 1, 1,
-1.750435, -0.3629058, -3.229055, 0, 0, 0, 1, 1,
-1.726983, 0.3319849, -2.474731, 0, 0, 0, 1, 1,
-1.715263, -0.04563672, -2.383356, 0, 0, 0, 1, 1,
-1.691356, -1.481611, -2.54541, 1, 1, 1, 1, 1,
-1.688702, 2.4354, -1.826691, 1, 1, 1, 1, 1,
-1.674699, -0.6022683, -1.284727, 1, 1, 1, 1, 1,
-1.64897, 0.3030438, -0.627906, 1, 1, 1, 1, 1,
-1.630015, 1.043879, -0.6809235, 1, 1, 1, 1, 1,
-1.629857, 0.3409216, 0.06080553, 1, 1, 1, 1, 1,
-1.618862, 1.058521, 0.01384219, 1, 1, 1, 1, 1,
-1.596548, 1.446628, -0.5686855, 1, 1, 1, 1, 1,
-1.577317, -1.469077, -2.413832, 1, 1, 1, 1, 1,
-1.572941, -0.02571538, -1.370026, 1, 1, 1, 1, 1,
-1.560216, -0.002900516, -1.9496, 1, 1, 1, 1, 1,
-1.540581, -0.3479748, -1.219135, 1, 1, 1, 1, 1,
-1.528072, -0.8872916, -1.288442, 1, 1, 1, 1, 1,
-1.506344, -1.383012, -2.823268, 1, 1, 1, 1, 1,
-1.49432, -0.6239046, -2.869223, 1, 1, 1, 1, 1,
-1.48505, 0.05602548, -1.968763, 0, 0, 1, 1, 1,
-1.478628, 0.3538055, -2.324836, 1, 0, 0, 1, 1,
-1.47789, -1.917741, -1.542642, 1, 0, 0, 1, 1,
-1.477234, 0.5901411, -2.842145, 1, 0, 0, 1, 1,
-1.47561, -0.1639497, -0.4904042, 1, 0, 0, 1, 1,
-1.47431, -0.3655482, -1.345522, 1, 0, 0, 1, 1,
-1.473052, 0.2329793, -1.072662, 0, 0, 0, 1, 1,
-1.469599, -0.6415797, 0.5472641, 0, 0, 0, 1, 1,
-1.453255, -0.6850146, -2.957046, 0, 0, 0, 1, 1,
-1.452097, 0.3975116, -0.7477967, 0, 0, 0, 1, 1,
-1.450666, -1.408972, -0.9739233, 0, 0, 0, 1, 1,
-1.438119, -0.7209229, -1.977746, 0, 0, 0, 1, 1,
-1.437679, 0.4362881, -1.485989, 0, 0, 0, 1, 1,
-1.432948, -0.4929403, -2.016911, 1, 1, 1, 1, 1,
-1.43237, -0.354415, -3.034074, 1, 1, 1, 1, 1,
-1.431603, 0.2781255, -1.010752, 1, 1, 1, 1, 1,
-1.430584, 0.5851524, -1.600333, 1, 1, 1, 1, 1,
-1.42981, -1.499915, -1.894607, 1, 1, 1, 1, 1,
-1.429161, 0.6462605, 0.4057044, 1, 1, 1, 1, 1,
-1.410407, 1.778955, -0.8718469, 1, 1, 1, 1, 1,
-1.40216, 0.01931656, -3.013363, 1, 1, 1, 1, 1,
-1.402128, -0.3345955, -2.168631, 1, 1, 1, 1, 1,
-1.399293, -1.009391, -3.656334, 1, 1, 1, 1, 1,
-1.394865, -0.8924167, -3.704179, 1, 1, 1, 1, 1,
-1.394711, 0.4416276, 0.4015397, 1, 1, 1, 1, 1,
-1.385852, 1.104262, -2.078833, 1, 1, 1, 1, 1,
-1.380771, -0.219558, -3.51041, 1, 1, 1, 1, 1,
-1.377572, 0.275041, 0.1537807, 1, 1, 1, 1, 1,
-1.369463, 0.8639045, 0.5261169, 0, 0, 1, 1, 1,
-1.366334, -0.1778462, -1.541097, 1, 0, 0, 1, 1,
-1.338965, -0.6586831, -1.10051, 1, 0, 0, 1, 1,
-1.332124, 0.3622197, -1.966115, 1, 0, 0, 1, 1,
-1.324383, 0.7315822, -0.6917655, 1, 0, 0, 1, 1,
-1.313309, -0.0570099, -4.46841, 1, 0, 0, 1, 1,
-1.311918, -1.015664, -2.73929, 0, 0, 0, 1, 1,
-1.295097, 0.2181668, -2.420625, 0, 0, 0, 1, 1,
-1.284622, 1.242363, -1.200608, 0, 0, 0, 1, 1,
-1.284548, -0.5149472, -3.162354, 0, 0, 0, 1, 1,
-1.274741, -0.7919828, -2.508409, 0, 0, 0, 1, 1,
-1.270291, -0.6337315, -2.325088, 0, 0, 0, 1, 1,
-1.267339, -0.5087701, -2.831903, 0, 0, 0, 1, 1,
-1.263608, -0.4531819, -1.788277, 1, 1, 1, 1, 1,
-1.247787, -0.1481548, -1.657024, 1, 1, 1, 1, 1,
-1.247723, 0.8340164, -2.359998, 1, 1, 1, 1, 1,
-1.226228, 0.07282139, -1.377876, 1, 1, 1, 1, 1,
-1.223644, -1.189067, -3.207126, 1, 1, 1, 1, 1,
-1.221418, -0.1614758, -2.382735, 1, 1, 1, 1, 1,
-1.216962, -0.2433055, -3.523425, 1, 1, 1, 1, 1,
-1.212093, 0.002238968, -2.019643, 1, 1, 1, 1, 1,
-1.207537, -0.9237455, -1.936289, 1, 1, 1, 1, 1,
-1.205232, 1.467449, -2.509213, 1, 1, 1, 1, 1,
-1.20139, 0.9512063, -0.5766939, 1, 1, 1, 1, 1,
-1.194384, -1.550938, -3.212426, 1, 1, 1, 1, 1,
-1.192308, 1.487561, 0.1996686, 1, 1, 1, 1, 1,
-1.192029, 0.3176216, -1.39089, 1, 1, 1, 1, 1,
-1.191974, -0.7014344, -1.973622, 1, 1, 1, 1, 1,
-1.179042, -1.004781, -0.9315369, 0, 0, 1, 1, 1,
-1.169603, -0.6025658, -1.098132, 1, 0, 0, 1, 1,
-1.163621, -0.3453098, -1.002035, 1, 0, 0, 1, 1,
-1.158301, 2.251242, -0.7949942, 1, 0, 0, 1, 1,
-1.156043, -1.184556, -3.410721, 1, 0, 0, 1, 1,
-1.154664, -0.0566768, -1.365237, 1, 0, 0, 1, 1,
-1.150545, -0.9105632, -2.159312, 0, 0, 0, 1, 1,
-1.14726, 0.5153697, -2.74433, 0, 0, 0, 1, 1,
-1.146212, 1.360678, -2.358987, 0, 0, 0, 1, 1,
-1.144797, 1.220353, -0.8598532, 0, 0, 0, 1, 1,
-1.143235, 0.6704928, -1.305286, 0, 0, 0, 1, 1,
-1.142897, -0.4014108, -2.940387, 0, 0, 0, 1, 1,
-1.139447, 0.7429338, -1.129251, 0, 0, 0, 1, 1,
-1.133272, 0.8154911, -0.6279862, 1, 1, 1, 1, 1,
-1.126599, 0.5525303, -2.293258, 1, 1, 1, 1, 1,
-1.125488, -3.047282, -3.140382, 1, 1, 1, 1, 1,
-1.121385, -0.2862412, -0.5699699, 1, 1, 1, 1, 1,
-1.107347, -0.2808506, -1.354796, 1, 1, 1, 1, 1,
-1.10003, -2.290783, -2.223204, 1, 1, 1, 1, 1,
-1.098887, -0.769806, -1.173141, 1, 1, 1, 1, 1,
-1.098024, -0.9792749, -1.976082, 1, 1, 1, 1, 1,
-1.092216, 0.5994974, 0.1825095, 1, 1, 1, 1, 1,
-1.09136, -0.954087, -2.434963, 1, 1, 1, 1, 1,
-1.088445, 0.6799307, -1.074508, 1, 1, 1, 1, 1,
-1.085643, 0.1382282, -1.237629, 1, 1, 1, 1, 1,
-1.084956, 0.9614789, -1.858088, 1, 1, 1, 1, 1,
-1.060524, 1.12243, -0.3207138, 1, 1, 1, 1, 1,
-1.058992, 0.6724432, -2.390079, 1, 1, 1, 1, 1,
-1.058851, 1.193527, -1.968338, 0, 0, 1, 1, 1,
-1.052886, 0.1907599, -1.504295, 1, 0, 0, 1, 1,
-1.052754, -0.6417459, -3.565566, 1, 0, 0, 1, 1,
-1.049529, -1.827808, -2.737032, 1, 0, 0, 1, 1,
-1.047566, 0.07772242, 0.8005455, 1, 0, 0, 1, 1,
-1.044539, 0.3908904, -0.6909443, 1, 0, 0, 1, 1,
-1.042556, -1.294974, -2.224566, 0, 0, 0, 1, 1,
-1.042492, -0.06405608, -2.280889, 0, 0, 0, 1, 1,
-1.042188, -1.234231, -3.046068, 0, 0, 0, 1, 1,
-1.040887, 1.668618, -1.811443, 0, 0, 0, 1, 1,
-1.033746, 1.241793, 0.7170243, 0, 0, 0, 1, 1,
-1.031894, 0.8389732, -0.9860045, 0, 0, 0, 1, 1,
-1.031851, 1.102218, -0.3756466, 0, 0, 0, 1, 1,
-1.022301, -2.167735, -1.867606, 1, 1, 1, 1, 1,
-1.018053, 1.165643, -1.213977, 1, 1, 1, 1, 1,
-1.016187, -0.2058134, 0.2461772, 1, 1, 1, 1, 1,
-1.0097, 0.9288029, -0.205365, 1, 1, 1, 1, 1,
-1.006297, -0.07558569, -0.5364745, 1, 1, 1, 1, 1,
-1.006061, 0.3032037, -3.24929, 1, 1, 1, 1, 1,
-1.000723, -0.07147168, -0.1104749, 1, 1, 1, 1, 1,
-0.9947137, -0.4574221, -0.8331059, 1, 1, 1, 1, 1,
-0.986591, 2.170793, 2.434468, 1, 1, 1, 1, 1,
-0.9853259, 0.5727573, -0.07209431, 1, 1, 1, 1, 1,
-0.9838625, 2.566644, 0.0912386, 1, 1, 1, 1, 1,
-0.9828939, 0.2870005, -1.13376, 1, 1, 1, 1, 1,
-0.9802765, -1.918681, -2.175167, 1, 1, 1, 1, 1,
-0.9735677, 0.01319413, -2.271836, 1, 1, 1, 1, 1,
-0.9715646, 0.2745451, -0.9828721, 1, 1, 1, 1, 1,
-0.9663216, 2.980236, -1.434432, 0, 0, 1, 1, 1,
-0.9655892, -2.284408, -2.52094, 1, 0, 0, 1, 1,
-0.9620012, -0.3408317, -1.647216, 1, 0, 0, 1, 1,
-0.9611117, -0.5279274, -0.5021667, 1, 0, 0, 1, 1,
-0.9603958, 0.2008954, -2.273418, 1, 0, 0, 1, 1,
-0.9559475, -1.33135, -4.397906, 1, 0, 0, 1, 1,
-0.9540236, 0.2281162, 0.4146202, 0, 0, 0, 1, 1,
-0.9524332, -0.7417321, -2.298762, 0, 0, 0, 1, 1,
-0.9336321, -0.1340513, -0.726079, 0, 0, 0, 1, 1,
-0.9327924, 0.2381401, -0.8646675, 0, 0, 0, 1, 1,
-0.9311889, 1.300073, -0.7198566, 0, 0, 0, 1, 1,
-0.9309757, 0.5817057, -1.945912, 0, 0, 0, 1, 1,
-0.9218212, 2.145006, -1.411931, 0, 0, 0, 1, 1,
-0.9170729, -1.010963, -2.70791, 1, 1, 1, 1, 1,
-0.9127358, -0.8412696, -2.045462, 1, 1, 1, 1, 1,
-0.9114116, 0.3349264, -0.6580291, 1, 1, 1, 1, 1,
-0.9100939, -0.7023944, -3.433096, 1, 1, 1, 1, 1,
-0.9021732, -0.06416558, -1.615794, 1, 1, 1, 1, 1,
-0.9010437, 0.9955075, -1.308414, 1, 1, 1, 1, 1,
-0.8948455, -1.188876, -1.761372, 1, 1, 1, 1, 1,
-0.8907717, -0.6955416, -2.176546, 1, 1, 1, 1, 1,
-0.8889124, -1.00557, -3.724342, 1, 1, 1, 1, 1,
-0.8864366, 0.3419777, -1.620078, 1, 1, 1, 1, 1,
-0.8859506, -0.2038135, -3.409192, 1, 1, 1, 1, 1,
-0.8839882, 1.219367, -0.1750627, 1, 1, 1, 1, 1,
-0.8801484, -0.7802154, -2.107315, 1, 1, 1, 1, 1,
-0.8792421, 0.3961653, 0.4512095, 1, 1, 1, 1, 1,
-0.8788093, 0.1165007, -2.725011, 1, 1, 1, 1, 1,
-0.8748755, 1.161419, 0.1538965, 0, 0, 1, 1, 1,
-0.868666, -1.091104, -2.442742, 1, 0, 0, 1, 1,
-0.8626356, -0.6334836, -2.733067, 1, 0, 0, 1, 1,
-0.8608122, 0.100794, -1.292368, 1, 0, 0, 1, 1,
-0.8588758, 1.227891, -1.191973, 1, 0, 0, 1, 1,
-0.8552804, -1.10698, -1.710504, 1, 0, 0, 1, 1,
-0.8510538, -1.073097, -0.8702766, 0, 0, 0, 1, 1,
-0.8416387, -0.4041246, -1.767535, 0, 0, 0, 1, 1,
-0.8408571, -0.3646739, -2.22334, 0, 0, 0, 1, 1,
-0.8366281, -0.7064358, -2.983544, 0, 0, 0, 1, 1,
-0.827706, -0.107787, -0.5612492, 0, 0, 0, 1, 1,
-0.827103, 0.1593768, -0.5286995, 0, 0, 0, 1, 1,
-0.8269011, 0.3915812, -1.747212, 0, 0, 0, 1, 1,
-0.8259832, -1.54598, -1.122862, 1, 1, 1, 1, 1,
-0.8242217, -0.7907608, -2.418544, 1, 1, 1, 1, 1,
-0.824034, 0.972217, -0.5563036, 1, 1, 1, 1, 1,
-0.8203287, 0.5475165, -0.7492026, 1, 1, 1, 1, 1,
-0.8172429, -0.7177919, -2.915031, 1, 1, 1, 1, 1,
-0.8146169, -1.292467, -2.647508, 1, 1, 1, 1, 1,
-0.812401, -0.5280017, -2.75862, 1, 1, 1, 1, 1,
-0.8097929, -1.885815, -3.05669, 1, 1, 1, 1, 1,
-0.7958038, -0.5488175, -2.243148, 1, 1, 1, 1, 1,
-0.7955595, -0.02541422, -2.431321, 1, 1, 1, 1, 1,
-0.7938911, 0.04763766, 0.4899183, 1, 1, 1, 1, 1,
-0.7932878, -0.8444797, -2.349762, 1, 1, 1, 1, 1,
-0.7930294, -0.2454052, -2.065824, 1, 1, 1, 1, 1,
-0.7881007, -0.5375379, -3.307309, 1, 1, 1, 1, 1,
-0.784586, 0.1191174, -0.08330636, 1, 1, 1, 1, 1,
-0.7803122, 3.192656, -0.2162352, 0, 0, 1, 1, 1,
-0.7796873, 0.1656357, 0.5734909, 1, 0, 0, 1, 1,
-0.777034, 1.101171, 0.1670063, 1, 0, 0, 1, 1,
-0.7716051, 0.5312912, 0.1751356, 1, 0, 0, 1, 1,
-0.7700509, 0.653476, -0.7882493, 1, 0, 0, 1, 1,
-0.756664, 0.02881255, -3.065305, 1, 0, 0, 1, 1,
-0.7536244, -0.7124954, -2.962341, 0, 0, 0, 1, 1,
-0.7526439, -0.53322, -2.294581, 0, 0, 0, 1, 1,
-0.7520548, -0.159921, -1.939081, 0, 0, 0, 1, 1,
-0.7500204, 2.246799, 0.5039184, 0, 0, 0, 1, 1,
-0.7487273, -1.057145, -4.244445, 0, 0, 0, 1, 1,
-0.748004, 1.382315, 0.7831498, 0, 0, 0, 1, 1,
-0.7364784, 0.401326, -1.246685, 0, 0, 0, 1, 1,
-0.7352084, -0.6472208, -3.175097, 1, 1, 1, 1, 1,
-0.7296773, 0.6059706, -2.422962, 1, 1, 1, 1, 1,
-0.7214257, 0.6796681, -2.135285, 1, 1, 1, 1, 1,
-0.719384, 1.720681, -1.229264, 1, 1, 1, 1, 1,
-0.7182863, 0.5155902, -1.666531, 1, 1, 1, 1, 1,
-0.7173194, -0.2403826, -3.992853, 1, 1, 1, 1, 1,
-0.7121091, -1.334584, -1.505424, 1, 1, 1, 1, 1,
-0.7100061, 0.5390248, -1.629416, 1, 1, 1, 1, 1,
-0.7093565, -0.421606, -2.261909, 1, 1, 1, 1, 1,
-0.7007024, 0.2093625, -1.618657, 1, 1, 1, 1, 1,
-0.6952173, -1.854606, -3.686608, 1, 1, 1, 1, 1,
-0.6941036, -0.9928217, -2.340015, 1, 1, 1, 1, 1,
-0.6931221, -1.284187, -3.023915, 1, 1, 1, 1, 1,
-0.6875325, 0.2723331, -1.785519, 1, 1, 1, 1, 1,
-0.6835679, 0.1872919, -1.130607, 1, 1, 1, 1, 1,
-0.6787123, 0.8400682, -0.9680752, 0, 0, 1, 1, 1,
-0.676424, -0.3836418, -3.344354, 1, 0, 0, 1, 1,
-0.669819, 0.353662, -2.195288, 1, 0, 0, 1, 1,
-0.6685757, -1.846703, -1.626939, 1, 0, 0, 1, 1,
-0.6641594, 0.9656726, -1.690399, 1, 0, 0, 1, 1,
-0.6579124, 1.246389, -0.5556582, 1, 0, 0, 1, 1,
-0.6567275, -1.477265, -2.567975, 0, 0, 0, 1, 1,
-0.6558788, -0.8398181, -2.484967, 0, 0, 0, 1, 1,
-0.6548498, 0.3438949, -0.535278, 0, 0, 0, 1, 1,
-0.6539318, 0.4234344, -1.587451, 0, 0, 0, 1, 1,
-0.6518736, -0.7961748, -2.424922, 0, 0, 0, 1, 1,
-0.6475366, -0.5430021, -2.329782, 0, 0, 0, 1, 1,
-0.6444103, 0.6566526, -1.71083, 0, 0, 0, 1, 1,
-0.6438093, -1.464236, -2.112661, 1, 1, 1, 1, 1,
-0.637818, -0.1275924, -2.420761, 1, 1, 1, 1, 1,
-0.6365233, 0.3353361, -1.315445, 1, 1, 1, 1, 1,
-0.6303723, -1.207987, -2.637069, 1, 1, 1, 1, 1,
-0.628749, 1.259258, 0.2037346, 1, 1, 1, 1, 1,
-0.6254357, -1.898135, -2.867802, 1, 1, 1, 1, 1,
-0.6220223, 1.044834, -2.039803, 1, 1, 1, 1, 1,
-0.6099631, 0.538815, 1.034719, 1, 1, 1, 1, 1,
-0.6067526, 1.018522, -0.1729455, 1, 1, 1, 1, 1,
-0.5859039, 0.6103742, -0.6698069, 1, 1, 1, 1, 1,
-0.5808225, 0.1947854, -1.017426, 1, 1, 1, 1, 1,
-0.5806986, 0.1227837, -2.978181, 1, 1, 1, 1, 1,
-0.5768676, -1.260034, -1.795969, 1, 1, 1, 1, 1,
-0.5761961, 1.237692, 0.2353764, 1, 1, 1, 1, 1,
-0.575981, 0.3695551, -1.065498, 1, 1, 1, 1, 1,
-0.5758895, -0.7927544, -1.782268, 0, 0, 1, 1, 1,
-0.5740868, -0.7435525, -1.347029, 1, 0, 0, 1, 1,
-0.572972, -0.08201961, -3.901027, 1, 0, 0, 1, 1,
-0.5718956, -1.222938, -3.652379, 1, 0, 0, 1, 1,
-0.5651084, -1.007107, -1.072835, 1, 0, 0, 1, 1,
-0.5618148, 0.04873009, -0.5344809, 1, 0, 0, 1, 1,
-0.5575755, -1.637258, -1.407008, 0, 0, 0, 1, 1,
-0.5517437, 0.5202268, -2.328633, 0, 0, 0, 1, 1,
-0.5512489, 0.450316, -2.172933, 0, 0, 0, 1, 1,
-0.5455474, -0.02786705, -1.531064, 0, 0, 0, 1, 1,
-0.5441546, 0.6926778, 1.108916, 0, 0, 0, 1, 1,
-0.5431418, 0.4185733, -1.284029, 0, 0, 0, 1, 1,
-0.5418323, -1.07906, -4.152136, 0, 0, 0, 1, 1,
-0.5384556, 2.306203, -0.5328047, 1, 1, 1, 1, 1,
-0.5277081, 1.196741, 0.1040165, 1, 1, 1, 1, 1,
-0.5152689, -1.776307, -3.561312, 1, 1, 1, 1, 1,
-0.5149599, 0.02547946, -2.186147, 1, 1, 1, 1, 1,
-0.5122961, 0.4915838, -0.3556397, 1, 1, 1, 1, 1,
-0.5109329, -1.578783, -3.137621, 1, 1, 1, 1, 1,
-0.5108688, -0.1831254, -2.218744, 1, 1, 1, 1, 1,
-0.5093653, -1.150768, -4.004008, 1, 1, 1, 1, 1,
-0.507641, -0.1354174, -3.316255, 1, 1, 1, 1, 1,
-0.5016412, 0.1767209, -3.066649, 1, 1, 1, 1, 1,
-0.4977931, -0.5997893, -2.187321, 1, 1, 1, 1, 1,
-0.4970546, 1.231728, 0.5239122, 1, 1, 1, 1, 1,
-0.4961115, 1.356158, 0.5127593, 1, 1, 1, 1, 1,
-0.4944201, -1.321959, -2.754248, 1, 1, 1, 1, 1,
-0.4934076, 2.279443, 0.5128604, 1, 1, 1, 1, 1,
-0.4913914, 1.060741, 1.143901, 0, 0, 1, 1, 1,
-0.4885869, -0.6944194, -2.064746, 1, 0, 0, 1, 1,
-0.4838738, 1.47412, -0.5039958, 1, 0, 0, 1, 1,
-0.4704662, 1.680722, -2.634684, 1, 0, 0, 1, 1,
-0.4670677, 0.1154442, -2.083377, 1, 0, 0, 1, 1,
-0.4665273, 0.556725, -0.8633357, 1, 0, 0, 1, 1,
-0.4633196, 0.88736, 0.5308396, 0, 0, 0, 1, 1,
-0.4626491, -2.013362, -2.449151, 0, 0, 0, 1, 1,
-0.4624101, 0.4094867, -0.3468238, 0, 0, 0, 1, 1,
-0.4610658, -1.215975, -3.27471, 0, 0, 0, 1, 1,
-0.4577875, -0.1103448, -2.383023, 0, 0, 0, 1, 1,
-0.4575436, -0.7994057, -3.15504, 0, 0, 0, 1, 1,
-0.4527557, 0.187284, -1.039394, 0, 0, 0, 1, 1,
-0.4522355, 0.6718025, -0.03128152, 1, 1, 1, 1, 1,
-0.4488921, 0.3963455, 0.2699171, 1, 1, 1, 1, 1,
-0.4413516, -1.295495, -3.518563, 1, 1, 1, 1, 1,
-0.4387451, -1.146806, -1.37822, 1, 1, 1, 1, 1,
-0.4346491, 0.3360053, 0.2559898, 1, 1, 1, 1, 1,
-0.4334777, -0.01147719, -1.1203, 1, 1, 1, 1, 1,
-0.4310545, 0.8506434, -0.8132716, 1, 1, 1, 1, 1,
-0.4307332, -2.317978, -2.099267, 1, 1, 1, 1, 1,
-0.4285251, -0.01919285, -1.439485, 1, 1, 1, 1, 1,
-0.4275112, -0.5381621, -2.505184, 1, 1, 1, 1, 1,
-0.4274628, -0.141509, -3.422557, 1, 1, 1, 1, 1,
-0.4231515, -1.493818, -2.789938, 1, 1, 1, 1, 1,
-0.4229817, -1.014921, -1.897852, 1, 1, 1, 1, 1,
-0.4135329, -0.906162, -1.865682, 1, 1, 1, 1, 1,
-0.412522, 0.1744751, -1.033949, 1, 1, 1, 1, 1,
-0.4112802, -1.22361, -4.004906, 0, 0, 1, 1, 1,
-0.4083819, -0.2276359, -1.238843, 1, 0, 0, 1, 1,
-0.4069749, 0.3930887, -1.208551, 1, 0, 0, 1, 1,
-0.4037352, 0.8693703, -0.4280718, 1, 0, 0, 1, 1,
-0.4013419, 0.9633712, 1.49165, 1, 0, 0, 1, 1,
-0.3997836, -0.3632073, -0.9890876, 1, 0, 0, 1, 1,
-0.3974423, -1.977669, -3.534417, 0, 0, 0, 1, 1,
-0.3919216, -1.04612, -3.122163, 0, 0, 0, 1, 1,
-0.3914049, -0.3819813, -2.375657, 0, 0, 0, 1, 1,
-0.3873418, -0.2549603, -2.72472, 0, 0, 0, 1, 1,
-0.3867752, -0.5226513, -2.972097, 0, 0, 0, 1, 1,
-0.3858489, -1.726265, -3.252372, 0, 0, 0, 1, 1,
-0.3855499, -1.44721, -3.622271, 0, 0, 0, 1, 1,
-0.3834085, -0.01034034, -2.533491, 1, 1, 1, 1, 1,
-0.3818205, 0.3982928, -1.287798, 1, 1, 1, 1, 1,
-0.3808121, -0.9131331, -2.981411, 1, 1, 1, 1, 1,
-0.377917, -0.07368527, -3.403427, 1, 1, 1, 1, 1,
-0.3763823, 0.1703498, -0.6569507, 1, 1, 1, 1, 1,
-0.3724786, -0.7239235, -2.37956, 1, 1, 1, 1, 1,
-0.3719853, -0.6116575, -1.192909, 1, 1, 1, 1, 1,
-0.3675232, -0.09326448, -1.972883, 1, 1, 1, 1, 1,
-0.3608299, -1.334342, -3.308987, 1, 1, 1, 1, 1,
-0.3599063, -0.7522668, -1.971004, 1, 1, 1, 1, 1,
-0.3589089, 0.7417973, 0.745796, 1, 1, 1, 1, 1,
-0.3562267, -0.4389693, -3.163857, 1, 1, 1, 1, 1,
-0.3553571, 0.3018008, -0.5789577, 1, 1, 1, 1, 1,
-0.355307, -0.534573, -3.647018, 1, 1, 1, 1, 1,
-0.3547945, -0.4007851, -2.277097, 1, 1, 1, 1, 1,
-0.352826, 0.9176359, 0.7902012, 0, 0, 1, 1, 1,
-0.3514644, 0.41368, -1.040952, 1, 0, 0, 1, 1,
-0.3500645, 1.860132, -2.347363, 1, 0, 0, 1, 1,
-0.349762, -1.919891, -3.2915, 1, 0, 0, 1, 1,
-0.3496702, -1.114313, -3.214207, 1, 0, 0, 1, 1,
-0.3494584, 0.8082142, -1.157745, 1, 0, 0, 1, 1,
-0.3425293, 0.06352133, -2.155653, 0, 0, 0, 1, 1,
-0.3404406, 0.1904366, -0.7610808, 0, 0, 0, 1, 1,
-0.3385651, -0.1685959, -2.331488, 0, 0, 0, 1, 1,
-0.3366514, 0.5957245, -0.08311969, 0, 0, 0, 1, 1,
-0.3350303, -0.06726169, -1.157117, 0, 0, 0, 1, 1,
-0.3338162, -0.850216, -2.607238, 0, 0, 0, 1, 1,
-0.3284944, -1.168629, -2.490241, 0, 0, 0, 1, 1,
-0.3272322, 1.476243, -0.9701608, 1, 1, 1, 1, 1,
-0.3255809, -0.1501394, -2.883063, 1, 1, 1, 1, 1,
-0.3229632, -1.799965, -2.153508, 1, 1, 1, 1, 1,
-0.3176126, 1.691915, 1.657248, 1, 1, 1, 1, 1,
-0.3160419, -0.3920233, -0.1742624, 1, 1, 1, 1, 1,
-0.3156669, 1.358861, 1.666407, 1, 1, 1, 1, 1,
-0.3129976, -0.4120403, -2.406163, 1, 1, 1, 1, 1,
-0.3121319, 1.626535, -1.068233, 1, 1, 1, 1, 1,
-0.3070834, -0.08347506, -1.995702, 1, 1, 1, 1, 1,
-0.3065932, 0.608669, -0.8800341, 1, 1, 1, 1, 1,
-0.3052426, 1.188848, -0.2300891, 1, 1, 1, 1, 1,
-0.3028744, 0.7582868, 0.9610183, 1, 1, 1, 1, 1,
-0.2828165, 0.1724314, -0.5062358, 1, 1, 1, 1, 1,
-0.2787457, 0.4505086, -0.1597464, 1, 1, 1, 1, 1,
-0.2734732, -2.364148, -1.959978, 1, 1, 1, 1, 1,
-0.2726191, 1.089436, -1.191741, 0, 0, 1, 1, 1,
-0.2694717, -0.412843, -3.379162, 1, 0, 0, 1, 1,
-0.2687574, -0.4330792, -1.104638, 1, 0, 0, 1, 1,
-0.2647144, -0.7710017, -4.145859, 1, 0, 0, 1, 1,
-0.2607966, 0.3622054, -0.8761655, 1, 0, 0, 1, 1,
-0.2602474, 2.624937, 0.2743497, 1, 0, 0, 1, 1,
-0.2600609, -0.6764418, -3.368929, 0, 0, 0, 1, 1,
-0.259984, -1.236396, -2.96702, 0, 0, 0, 1, 1,
-0.2545638, -0.2522233, -1.05101, 0, 0, 0, 1, 1,
-0.253471, -0.8003726, -3.112558, 0, 0, 0, 1, 1,
-0.2529708, 1.858525, -0.8084333, 0, 0, 0, 1, 1,
-0.2526421, -0.8222087, -3.374645, 0, 0, 0, 1, 1,
-0.2462648, 0.9544554, -0.3673973, 0, 0, 0, 1, 1,
-0.2372413, -0.5420016, -5.580524, 1, 1, 1, 1, 1,
-0.2352611, 1.107354, 0.09245779, 1, 1, 1, 1, 1,
-0.2346683, 0.333708, -0.1116212, 1, 1, 1, 1, 1,
-0.2286762, -1.623654, -2.789495, 1, 1, 1, 1, 1,
-0.2259092, 0.8434561, 0.6760277, 1, 1, 1, 1, 1,
-0.2255306, -0.2428879, -3.940578, 1, 1, 1, 1, 1,
-0.2221374, -0.8923315, -3.325799, 1, 1, 1, 1, 1,
-0.2197818, 1.120834, -0.1207342, 1, 1, 1, 1, 1,
-0.2110204, -0.5631163, -2.060861, 1, 1, 1, 1, 1,
-0.2093159, 0.02419792, -2.07419, 1, 1, 1, 1, 1,
-0.2091944, 0.1788948, -1.561863, 1, 1, 1, 1, 1,
-0.2056638, -0.6090895, -1.540212, 1, 1, 1, 1, 1,
-0.2046021, -0.2979326, -4.252727, 1, 1, 1, 1, 1,
-0.2027393, 1.356164, 0.07279465, 1, 1, 1, 1, 1,
-0.1980563, -0.7025528, -2.069894, 1, 1, 1, 1, 1,
-0.1970554, -0.02064732, -2.208146, 0, 0, 1, 1, 1,
-0.1933075, -0.4456384, -2.640004, 1, 0, 0, 1, 1,
-0.1862654, -1.545732, -4.012035, 1, 0, 0, 1, 1,
-0.1846604, -2.036884, -2.958999, 1, 0, 0, 1, 1,
-0.1684355, -0.4532304, -2.204321, 1, 0, 0, 1, 1,
-0.1681752, -0.1801708, -2.778796, 1, 0, 0, 1, 1,
-0.1632947, 1.147549, -0.1629854, 0, 0, 0, 1, 1,
-0.1528756, 0.6574332, -1.63094, 0, 0, 0, 1, 1,
-0.1499802, 0.3017696, -0.06892868, 0, 0, 0, 1, 1,
-0.1490424, -0.694456, -3.416405, 0, 0, 0, 1, 1,
-0.1456603, -1.179342, -3.368495, 0, 0, 0, 1, 1,
-0.1456542, 0.7761038, 0.1052006, 0, 0, 0, 1, 1,
-0.1395447, 0.9496309, -1.28734, 0, 0, 0, 1, 1,
-0.1368192, 0.9344928, -0.0469047, 1, 1, 1, 1, 1,
-0.1359584, -0.9552299, -2.293331, 1, 1, 1, 1, 1,
-0.1303932, -0.01234964, -2.271974, 1, 1, 1, 1, 1,
-0.1290117, -0.4278533, -3.000298, 1, 1, 1, 1, 1,
-0.1232585, -1.154133, -3.506338, 1, 1, 1, 1, 1,
-0.1228276, 0.8934413, 1.436703, 1, 1, 1, 1, 1,
-0.1213761, 0.6027514, -1.075915, 1, 1, 1, 1, 1,
-0.1213439, 0.5014322, 0.9593883, 1, 1, 1, 1, 1,
-0.1210929, 0.4392469, -1.287677, 1, 1, 1, 1, 1,
-0.1206135, 0.07253888, -1.01808, 1, 1, 1, 1, 1,
-0.1205244, 0.1406545, -1.222306, 1, 1, 1, 1, 1,
-0.1186136, 0.7363765, 2.920009, 1, 1, 1, 1, 1,
-0.1078553, -0.7311626, -1.849567, 1, 1, 1, 1, 1,
-0.107299, -0.1436827, -2.265137, 1, 1, 1, 1, 1,
-0.1025006, 1.631345, 0.9601701, 1, 1, 1, 1, 1,
-0.09932837, 0.01348176, -2.221149, 0, 0, 1, 1, 1,
-0.09429247, -0.9707308, -0.4452912, 1, 0, 0, 1, 1,
-0.09223142, -0.2267563, -1.431821, 1, 0, 0, 1, 1,
-0.0921996, 1.227192, 0.4581675, 1, 0, 0, 1, 1,
-0.08657639, 0.8406272, 0.6034341, 1, 0, 0, 1, 1,
-0.07890029, 2.172462, -2.27176, 1, 0, 0, 1, 1,
-0.07532331, -0.303311, -3.37562, 0, 0, 0, 1, 1,
-0.07369506, -2.33823, -3.419796, 0, 0, 0, 1, 1,
-0.07363409, -0.6836054, -2.147803, 0, 0, 0, 1, 1,
-0.0697506, 0.9025227, -0.3222097, 0, 0, 0, 1, 1,
-0.06950045, 0.6000987, -0.1681267, 0, 0, 0, 1, 1,
-0.06904301, 0.6722897, 0.4630459, 0, 0, 0, 1, 1,
-0.0652508, 0.2458698, 0.3894898, 0, 0, 0, 1, 1,
-0.06483763, -0.9675627, -3.588796, 1, 1, 1, 1, 1,
-0.06411809, -0.4996262, -1.799407, 1, 1, 1, 1, 1,
-0.06260642, -0.03127094, -1.40664, 1, 1, 1, 1, 1,
-0.06215094, 0.3078337, 0.6739965, 1, 1, 1, 1, 1,
-0.06150182, 0.68505, -0.3764229, 1, 1, 1, 1, 1,
-0.05870428, 0.1611816, -1.949003, 1, 1, 1, 1, 1,
-0.05560138, 0.544802, -1.803984, 1, 1, 1, 1, 1,
-0.0507498, 2.51121, 0.2390813, 1, 1, 1, 1, 1,
-0.05007139, -0.03034679, -1.371933, 1, 1, 1, 1, 1,
-0.04950439, 0.4195143, 0.9841596, 1, 1, 1, 1, 1,
-0.0447008, -0.3426196, -5.185152, 1, 1, 1, 1, 1,
-0.04141314, -1.648978, -4.575644, 1, 1, 1, 1, 1,
-0.03832392, 0.2986867, 3.465394, 1, 1, 1, 1, 1,
-0.03548289, 0.193848, -0.3587061, 1, 1, 1, 1, 1,
-0.03494026, -0.3261221, -3.400084, 1, 1, 1, 1, 1,
-0.02947983, -0.3712146, -4.318459, 0, 0, 1, 1, 1,
-0.02736327, -1.493234, -2.626037, 1, 0, 0, 1, 1,
-0.0261276, -0.1427897, -4.266633, 1, 0, 0, 1, 1,
-0.01990545, 0.730828, 0.4449511, 1, 0, 0, 1, 1,
-0.01615249, -0.3434562, -4.012319, 1, 0, 0, 1, 1,
-0.01249127, -0.9337052, -3.345667, 1, 0, 0, 1, 1,
-0.01218262, -0.6945121, -3.477672, 0, 0, 0, 1, 1,
-0.01140238, 0.6005468, -0.9178236, 0, 0, 0, 1, 1,
-0.01053947, -0.8937881, -1.944978, 0, 0, 0, 1, 1,
-0.01030251, 0.7239891, -0.08591557, 0, 0, 0, 1, 1,
-0.008681157, -0.336395, -3.289726, 0, 0, 0, 1, 1,
-0.007427808, 0.4428012, 0.02376567, 0, 0, 0, 1, 1,
-0.00316499, 0.5979604, -1.392657, 0, 0, 0, 1, 1,
-0.0007475109, 0.8632262, 0.7575984, 1, 1, 1, 1, 1,
0.003916262, -0.6427268, 2.440809, 1, 1, 1, 1, 1,
0.006226787, -1.50308, 2.530527, 1, 1, 1, 1, 1,
0.01316009, 0.6472419, -0.3397316, 1, 1, 1, 1, 1,
0.01980914, 0.7856148, -0.1128828, 1, 1, 1, 1, 1,
0.01986491, 0.5717555, -0.467918, 1, 1, 1, 1, 1,
0.01990545, -1.601762, 2.306429, 1, 1, 1, 1, 1,
0.01995339, 1.263417, 0.9425294, 1, 1, 1, 1, 1,
0.0207227, 0.6816465, -0.00245095, 1, 1, 1, 1, 1,
0.02468695, -0.4011041, 3.519639, 1, 1, 1, 1, 1,
0.02499841, -1.022509, 4.271219, 1, 1, 1, 1, 1,
0.02644114, -0.1021859, 4.020007, 1, 1, 1, 1, 1,
0.02696223, 0.3322864, -0.765678, 1, 1, 1, 1, 1,
0.03201305, 1.657237, 0.4853953, 1, 1, 1, 1, 1,
0.0386478, 0.5399266, 0.2582883, 1, 1, 1, 1, 1,
0.04369166, 2.651117, -3.134673, 0, 0, 1, 1, 1,
0.04799923, 0.1611196, -0.1360893, 1, 0, 0, 1, 1,
0.04897536, -0.6235321, 2.360296, 1, 0, 0, 1, 1,
0.05642063, -1.456333, 3.541041, 1, 0, 0, 1, 1,
0.06092473, -0.4841053, 3.997644, 1, 0, 0, 1, 1,
0.06589651, -1.655357, 2.641742, 1, 0, 0, 1, 1,
0.06602073, -1.509583, 0.3779329, 0, 0, 0, 1, 1,
0.06778962, 0.4233745, 2.106325, 0, 0, 0, 1, 1,
0.06921124, -0.6126641, 1.720385, 0, 0, 0, 1, 1,
0.07272609, 0.369454, 1.435569, 0, 0, 0, 1, 1,
0.07549286, 0.2319156, -0.505853, 0, 0, 0, 1, 1,
0.07748364, -0.2466236, 3.342009, 0, 0, 0, 1, 1,
0.08116899, 0.2991366, 1.218392, 0, 0, 0, 1, 1,
0.08589237, -1.125893, 1.695152, 1, 1, 1, 1, 1,
0.08925781, -0.6132584, 1.829752, 1, 1, 1, 1, 1,
0.09351105, -0.8799741, 2.298824, 1, 1, 1, 1, 1,
0.09408254, -0.9776986, 3.617625, 1, 1, 1, 1, 1,
0.09516806, 0.5026796, 1.818573, 1, 1, 1, 1, 1,
0.09545932, 0.306547, 0.6143989, 1, 1, 1, 1, 1,
0.0987846, 1.243361, -1.722351, 1, 1, 1, 1, 1,
0.09907453, -2.069731, 3.479663, 1, 1, 1, 1, 1,
0.09922215, -0.8286442, 2.876915, 1, 1, 1, 1, 1,
0.1006387, -0.4376717, 2.437937, 1, 1, 1, 1, 1,
0.1021142, -0.6669886, 4.062314, 1, 1, 1, 1, 1,
0.1067294, -1.71558, 4.373234, 1, 1, 1, 1, 1,
0.1072732, 1.542221, 0.575753, 1, 1, 1, 1, 1,
0.1109559, 0.1041862, -0.3907685, 1, 1, 1, 1, 1,
0.111312, 0.878087, -0.3816931, 1, 1, 1, 1, 1,
0.1183278, -0.1586261, 4.388933, 0, 0, 1, 1, 1,
0.1184521, -0.2943644, 2.211149, 1, 0, 0, 1, 1,
0.1198242, 0.5116323, 0.8641613, 1, 0, 0, 1, 1,
0.1198586, -0.6377931, 3.617881, 1, 0, 0, 1, 1,
0.1278283, 1.042693, 0.1211, 1, 0, 0, 1, 1,
0.1320711, 1.265611, -2.180178, 1, 0, 0, 1, 1,
0.1404441, -0.0927636, 2.777826, 0, 0, 0, 1, 1,
0.1405842, -0.1878778, 1.256362, 0, 0, 0, 1, 1,
0.142086, 0.173477, 0.0534082, 0, 0, 0, 1, 1,
0.142502, 0.1207521, 1.407578, 0, 0, 0, 1, 1,
0.1426166, 0.2725909, 0.8613135, 0, 0, 0, 1, 1,
0.1448155, 0.6901045, -2.069468, 0, 0, 0, 1, 1,
0.1451551, -0.7222468, 4.146429, 0, 0, 0, 1, 1,
0.1475713, 0.644276, -0.085846, 1, 1, 1, 1, 1,
0.1477593, 0.4900666, 0.4350946, 1, 1, 1, 1, 1,
0.1514451, -1.014236, 3.279175, 1, 1, 1, 1, 1,
0.1538295, 0.6693529, -0.1701675, 1, 1, 1, 1, 1,
0.1573832, -1.603166, 3.731411, 1, 1, 1, 1, 1,
0.159076, 0.7390009, 0.2601265, 1, 1, 1, 1, 1,
0.159766, -0.1864952, 3.037952, 1, 1, 1, 1, 1,
0.1610479, 0.3724155, 1.389625, 1, 1, 1, 1, 1,
0.1631708, 0.08841918, 0.6868609, 1, 1, 1, 1, 1,
0.1656229, 1.143136, 1.317153, 1, 1, 1, 1, 1,
0.1658339, 0.7277544, 0.1546434, 1, 1, 1, 1, 1,
0.1673239, -0.3187745, 2.988008, 1, 1, 1, 1, 1,
0.1676773, 1.099664, -1.371803, 1, 1, 1, 1, 1,
0.1684482, -0.6200131, 2.848826, 1, 1, 1, 1, 1,
0.1689858, -0.3652458, 2.163391, 1, 1, 1, 1, 1,
0.1695255, -2.404541, 2.503125, 0, 0, 1, 1, 1,
0.1706504, -0.3944267, 3.226028, 1, 0, 0, 1, 1,
0.1771635, 0.06325153, 0.8634838, 1, 0, 0, 1, 1,
0.1816068, 0.8961295, -0.05659576, 1, 0, 0, 1, 1,
0.1818905, 1.567527, 1.224743, 1, 0, 0, 1, 1,
0.1828595, 0.1553175, 1.019789, 1, 0, 0, 1, 1,
0.1847496, 0.6143683, 0.01511475, 0, 0, 0, 1, 1,
0.1863437, 0.7697026, 0.9692762, 0, 0, 0, 1, 1,
0.1882804, 0.6172534, 0.2812593, 0, 0, 0, 1, 1,
0.1898101, -0.4449573, 2.863036, 0, 0, 0, 1, 1,
0.190074, 1.211778, 0.01637099, 0, 0, 0, 1, 1,
0.192496, 1.342695, 0.3234327, 0, 0, 0, 1, 1,
0.1933069, 1.020221, 0.5185434, 0, 0, 0, 1, 1,
0.1947304, 0.03050703, 0.2038271, 1, 1, 1, 1, 1,
0.1964283, -0.5691413, 2.739273, 1, 1, 1, 1, 1,
0.2024547, -0.5866945, 3.057443, 1, 1, 1, 1, 1,
0.2075057, -0.6103415, 3.439422, 1, 1, 1, 1, 1,
0.2076708, -0.6232848, 2.73525, 1, 1, 1, 1, 1,
0.2087524, -0.407225, 3.371289, 1, 1, 1, 1, 1,
0.2099814, -0.5312682, 0.7675869, 1, 1, 1, 1, 1,
0.2113644, 2.601997, -0.6494545, 1, 1, 1, 1, 1,
0.2137152, -0.822562, 4.883412, 1, 1, 1, 1, 1,
0.2144333, -1.633807, 2.686734, 1, 1, 1, 1, 1,
0.21444, 0.6173713, 0.6788418, 1, 1, 1, 1, 1,
0.2181647, -0.6146792, 3.909893, 1, 1, 1, 1, 1,
0.2205427, -0.4390271, 1.721552, 1, 1, 1, 1, 1,
0.2207451, -0.8965809, 3.885552, 1, 1, 1, 1, 1,
0.2275434, 0.5075473, 0.5975996, 1, 1, 1, 1, 1,
0.2294221, 0.08537924, 0.32787, 0, 0, 1, 1, 1,
0.2318878, 0.3347931, 0.8232775, 1, 0, 0, 1, 1,
0.232372, -0.2036039, 3.590333, 1, 0, 0, 1, 1,
0.2351073, -2.128506, 3.15808, 1, 0, 0, 1, 1,
0.2394958, -0.5170415, 2.808245, 1, 0, 0, 1, 1,
0.2462859, -0.07258748, 2.178771, 1, 0, 0, 1, 1,
0.2536828, 0.3574822, -0.2255187, 0, 0, 0, 1, 1,
0.2558469, -0.6854119, 3.101986, 0, 0, 0, 1, 1,
0.2560443, 0.4762738, 0.3135148, 0, 0, 0, 1, 1,
0.2587466, 0.2163338, 2.315885, 0, 0, 0, 1, 1,
0.2597308, -0.5208831, 2.856579, 0, 0, 0, 1, 1,
0.2606125, -0.9010679, 3.053689, 0, 0, 0, 1, 1,
0.2640682, 0.2125337, 2.061839, 0, 0, 0, 1, 1,
0.2655003, 1.146937, -0.6906404, 1, 1, 1, 1, 1,
0.2695377, 0.3031386, 1.696878, 1, 1, 1, 1, 1,
0.27139, -0.0613106, 3.201942, 1, 1, 1, 1, 1,
0.2725163, -0.2491785, 0.8922677, 1, 1, 1, 1, 1,
0.2734428, 0.4292074, 0.919844, 1, 1, 1, 1, 1,
0.2734667, -2.140163, 1.492532, 1, 1, 1, 1, 1,
0.2735458, 0.7402039, 1.324165, 1, 1, 1, 1, 1,
0.2767564, 1.388745, 0.07453, 1, 1, 1, 1, 1,
0.2783622, 0.2078815, 1.077764, 1, 1, 1, 1, 1,
0.2809404, 0.6672413, -0.9731426, 1, 1, 1, 1, 1,
0.2897422, 3.013354, 0.5292991, 1, 1, 1, 1, 1,
0.292712, 2.078287, -0.01359633, 1, 1, 1, 1, 1,
0.2930598, -0.5381179, 1.48359, 1, 1, 1, 1, 1,
0.2949559, -0.3319632, 1.512728, 1, 1, 1, 1, 1,
0.2964938, 0.6654283, 1.015143, 1, 1, 1, 1, 1,
0.2987114, 1.524958, 1.893699, 0, 0, 1, 1, 1,
0.3010905, 0.353562, 0.9992068, 1, 0, 0, 1, 1,
0.3024464, -1.00727, 2.151185, 1, 0, 0, 1, 1,
0.3037335, -0.7917624, 2.46725, 1, 0, 0, 1, 1,
0.3048356, 0.982121, 0.962911, 1, 0, 0, 1, 1,
0.3057805, -1.203988, 2.486996, 1, 0, 0, 1, 1,
0.3079972, 0.5723444, -1.003082, 0, 0, 0, 1, 1,
0.3190015, -1.151889, 3.233279, 0, 0, 0, 1, 1,
0.322516, -0.3276899, 3.701723, 0, 0, 0, 1, 1,
0.3262126, 0.02514987, 4.05394, 0, 0, 0, 1, 1,
0.3293684, 1.780006, 0.04067186, 0, 0, 0, 1, 1,
0.3298582, -0.2086527, 2.732702, 0, 0, 0, 1, 1,
0.3353266, -1.420138, 3.019192, 0, 0, 0, 1, 1,
0.3359626, 1.597563, -0.6425548, 1, 1, 1, 1, 1,
0.3408514, 0.7705334, 1.802105, 1, 1, 1, 1, 1,
0.3421155, -0.06853183, 3.714524, 1, 1, 1, 1, 1,
0.3430127, -0.8603103, 3.884468, 1, 1, 1, 1, 1,
0.3440556, 1.111939, 1.749722, 1, 1, 1, 1, 1,
0.3443816, -0.2827091, 1.794167, 1, 1, 1, 1, 1,
0.3444641, 0.5577201, 0.2257395, 1, 1, 1, 1, 1,
0.3465069, 0.6364892, 1.192915, 1, 1, 1, 1, 1,
0.3470997, -0.3903188, 2.356912, 1, 1, 1, 1, 1,
0.347415, 1.243606, -0.8735101, 1, 1, 1, 1, 1,
0.3476901, 0.3626453, -0.1074621, 1, 1, 1, 1, 1,
0.3483481, -0.1195171, 0.08275291, 1, 1, 1, 1, 1,
0.3497869, -2.262162, 2.588774, 1, 1, 1, 1, 1,
0.3543727, -0.9377156, 3.16299, 1, 1, 1, 1, 1,
0.3554056, -0.9065825, 2.973202, 1, 1, 1, 1, 1,
0.3560915, -0.2515552, 0.4842555, 0, 0, 1, 1, 1,
0.363167, 0.4640971, 0.7223032, 1, 0, 0, 1, 1,
0.3631872, 0.3105181, 1.453507, 1, 0, 0, 1, 1,
0.366957, 0.3403648, 0.5464218, 1, 0, 0, 1, 1,
0.3685697, 2.008034, 0.4945969, 1, 0, 0, 1, 1,
0.3695249, 0.06696155, 0.6426015, 1, 0, 0, 1, 1,
0.3722755, 0.5896917, 1.199762, 0, 0, 0, 1, 1,
0.3722762, -0.9792899, 3.792293, 0, 0, 0, 1, 1,
0.3725844, 0.7840505, 4.036473, 0, 0, 0, 1, 1,
0.3736353, 0.1493379, 0.22811, 0, 0, 0, 1, 1,
0.3737163, 0.5488644, 0.193617, 0, 0, 0, 1, 1,
0.374228, -0.2346893, 2.209313, 0, 0, 0, 1, 1,
0.3758679, -0.6138605, 3.121674, 0, 0, 0, 1, 1,
0.3761868, -0.2153893, 1.302616, 1, 1, 1, 1, 1,
0.3788029, -0.824982, 2.166784, 1, 1, 1, 1, 1,
0.385785, -0.06697004, 0.1926861, 1, 1, 1, 1, 1,
0.3873596, 0.6844239, 0.7803844, 1, 1, 1, 1, 1,
0.3888841, 0.3043478, 1.146863, 1, 1, 1, 1, 1,
0.3899307, -1.363215, 2.296905, 1, 1, 1, 1, 1,
0.3904765, 0.6257956, 0.1711308, 1, 1, 1, 1, 1,
0.3908574, 1.599294, 0.2367449, 1, 1, 1, 1, 1,
0.3929283, 0.5660246, 0.3325124, 1, 1, 1, 1, 1,
0.3964577, 0.2615531, 0.7855135, 1, 1, 1, 1, 1,
0.3995761, 0.4176485, 1.380204, 1, 1, 1, 1, 1,
0.401628, -0.3811828, 2.330316, 1, 1, 1, 1, 1,
0.403272, 1.445584, -0.6898396, 1, 1, 1, 1, 1,
0.4096985, -0.3891533, 3.982036, 1, 1, 1, 1, 1,
0.41098, 0.6324546, -0.9623748, 1, 1, 1, 1, 1,
0.4186377, -0.8303716, 3.922719, 0, 0, 1, 1, 1,
0.4226396, -0.6142922, 2.859243, 1, 0, 0, 1, 1,
0.4245809, 0.2941916, 3.689683, 1, 0, 0, 1, 1,
0.4246145, 1.04212, 0.6191941, 1, 0, 0, 1, 1,
0.4276202, 0.4451441, 1.384126, 1, 0, 0, 1, 1,
0.4309135, -1.987626, 3.478873, 1, 0, 0, 1, 1,
0.4337873, 1.800997, 0.5402802, 0, 0, 0, 1, 1,
0.4348311, -0.4287409, 4.135084, 0, 0, 0, 1, 1,
0.4357497, -1.356323, 3.028039, 0, 0, 0, 1, 1,
0.4484285, -0.122706, 2.806339, 0, 0, 0, 1, 1,
0.4504943, 1.279343, 1.879196, 0, 0, 0, 1, 1,
0.4536659, -1.259836, 2.654596, 0, 0, 0, 1, 1,
0.4538957, 0.1860726, 1.517248, 0, 0, 0, 1, 1,
0.462262, 1.086933, 1.369853, 1, 1, 1, 1, 1,
0.4653789, -0.4029259, 0.8102444, 1, 1, 1, 1, 1,
0.4729958, 1.091505, 0.6545065, 1, 1, 1, 1, 1,
0.4764657, -0.7638716, 3.094654, 1, 1, 1, 1, 1,
0.4768578, -0.2946426, 2.447907, 1, 1, 1, 1, 1,
0.478645, 1.059755, 0.6749771, 1, 1, 1, 1, 1,
0.4858115, -1.891428, 2.529976, 1, 1, 1, 1, 1,
0.4872055, 0.3206211, 0.2156018, 1, 1, 1, 1, 1,
0.4908439, 0.3385875, 1.092356, 1, 1, 1, 1, 1,
0.4934742, -0.9512914, 1.227587, 1, 1, 1, 1, 1,
0.5008624, 1.007781, 2.368667, 1, 1, 1, 1, 1,
0.5048203, 1.159058, 0.4111019, 1, 1, 1, 1, 1,
0.5094867, 0.3391268, -0.4252183, 1, 1, 1, 1, 1,
0.5133796, 0.4832574, 1.539701, 1, 1, 1, 1, 1,
0.514119, 0.1863241, 2.71527, 1, 1, 1, 1, 1,
0.5154437, -0.8137191, 3.231028, 0, 0, 1, 1, 1,
0.5177297, -0.312623, 1.747334, 1, 0, 0, 1, 1,
0.5216171, -0.09285478, 3.989322, 1, 0, 0, 1, 1,
0.5438781, 0.4145537, 1.522711, 1, 0, 0, 1, 1,
0.5515037, -0.2677101, 1.927127, 1, 0, 0, 1, 1,
0.5535467, 2.051073, 0.684736, 1, 0, 0, 1, 1,
0.5635569, 1.435322, -0.8243611, 0, 0, 0, 1, 1,
0.5659031, -0.3241078, 0.5886298, 0, 0, 0, 1, 1,
0.5686494, 0.2330209, 0.654991, 0, 0, 0, 1, 1,
0.5703202, 0.5971869, 2.314128, 0, 0, 0, 1, 1,
0.5738561, 0.6010724, 1.599517, 0, 0, 0, 1, 1,
0.5739915, 0.09865795, 0.9064894, 0, 0, 0, 1, 1,
0.5761066, -0.3347139, 2.353634, 0, 0, 0, 1, 1,
0.5767168, 1.898585, 0.3676068, 1, 1, 1, 1, 1,
0.5809022, 0.1965161, 1.577391, 1, 1, 1, 1, 1,
0.5817449, -0.9293175, 2.937481, 1, 1, 1, 1, 1,
0.5837596, -0.2586466, 1.504722, 1, 1, 1, 1, 1,
0.5889979, -0.6343148, 2.616732, 1, 1, 1, 1, 1,
0.5953858, -0.6053423, 1.702325, 1, 1, 1, 1, 1,
0.59877, 0.03763583, 3.656455, 1, 1, 1, 1, 1,
0.6004468, 1.475657, 0.3402644, 1, 1, 1, 1, 1,
0.6084606, -0.1556907, 1.531347, 1, 1, 1, 1, 1,
0.6121747, -0.6092885, 1.29935, 1, 1, 1, 1, 1,
0.6223546, 0.3769522, 1.237586, 1, 1, 1, 1, 1,
0.6242335, 1.363458, 2.045544, 1, 1, 1, 1, 1,
0.6277199, 0.9928194, 0.4980967, 1, 1, 1, 1, 1,
0.6291733, -1.197855, 4.069691, 1, 1, 1, 1, 1,
0.6322327, -1.132624, 3.977512, 1, 1, 1, 1, 1,
0.6343771, 0.8863825, 0.08778556, 0, 0, 1, 1, 1,
0.636249, -0.189535, 3.626342, 1, 0, 0, 1, 1,
0.6368065, 0.6372197, 0.2232161, 1, 0, 0, 1, 1,
0.6449062, -0.6963978, 2.229307, 1, 0, 0, 1, 1,
0.6449816, -1.418843, 3.646672, 1, 0, 0, 1, 1,
0.6530271, -0.1179966, 1.240541, 1, 0, 0, 1, 1,
0.6567753, -1.251571, 2.916883, 0, 0, 0, 1, 1,
0.6635591, -0.1303631, 2.877582, 0, 0, 0, 1, 1,
0.6656801, 3.121766, -0.6105382, 0, 0, 0, 1, 1,
0.6665668, -1.187547, 3.907019, 0, 0, 0, 1, 1,
0.6676818, 0.7451665, -1.064908, 0, 0, 0, 1, 1,
0.6754498, -0.6978056, 1.436715, 0, 0, 0, 1, 1,
0.6786741, 1.680941, 0.4403833, 0, 0, 0, 1, 1,
0.6802548, 0.0505477, 0.2978462, 1, 1, 1, 1, 1,
0.6806234, -1.042698, 1.628294, 1, 1, 1, 1, 1,
0.681915, -1.314637, 5.359037, 1, 1, 1, 1, 1,
0.6952997, 0.09475817, 2.339192, 1, 1, 1, 1, 1,
0.7017949, -0.1535683, 1.028208, 1, 1, 1, 1, 1,
0.7102106, 0.3822816, 1.420761, 1, 1, 1, 1, 1,
0.7216888, 2.077106, -1.701727, 1, 1, 1, 1, 1,
0.722196, -0.6872035, 0.5795613, 1, 1, 1, 1, 1,
0.7285165, -0.5898613, 1.166383, 1, 1, 1, 1, 1,
0.7305757, 0.7790204, 2.178117, 1, 1, 1, 1, 1,
0.7337823, -0.3837367, 2.85239, 1, 1, 1, 1, 1,
0.7360655, 0.5774494, 0.9971795, 1, 1, 1, 1, 1,
0.7419066, -2.837968, 2.374016, 1, 1, 1, 1, 1,
0.7419513, 1.521939, -0.4558582, 1, 1, 1, 1, 1,
0.7486359, 0.3306738, 3.894494, 1, 1, 1, 1, 1,
0.7518508, -0.6029362, 1.842035, 0, 0, 1, 1, 1,
0.7557166, 0.1096194, 2.378377, 1, 0, 0, 1, 1,
0.7604596, 1.286716, -0.3086661, 1, 0, 0, 1, 1,
0.7619222, -0.5682253, 2.986912, 1, 0, 0, 1, 1,
0.7632024, -1.28842, 2.084954, 1, 0, 0, 1, 1,
0.7635455, -0.382476, 2.527008, 1, 0, 0, 1, 1,
0.7665001, -2.121834, 2.657716, 0, 0, 0, 1, 1,
0.7689623, 0.1375969, 1.098118, 0, 0, 0, 1, 1,
0.7694811, 0.3268966, 2.568998, 0, 0, 0, 1, 1,
0.7737727, -0.4541241, 2.322302, 0, 0, 0, 1, 1,
0.7756241, -0.5569198, 1.715985, 0, 0, 0, 1, 1,
0.7784453, 0.9803513, -0.6207696, 0, 0, 0, 1, 1,
0.7838371, 0.3306829, 1.194715, 0, 0, 0, 1, 1,
0.7860223, 0.117762, 0.4407619, 1, 1, 1, 1, 1,
0.7907176, 0.2842224, 0.5807938, 1, 1, 1, 1, 1,
0.7951312, -1.201414, 4.623095, 1, 1, 1, 1, 1,
0.7951918, -1.057692, 1.962489, 1, 1, 1, 1, 1,
0.7966062, 1.275858, -0.2027669, 1, 1, 1, 1, 1,
0.8019843, 0.7547213, -0.5520216, 1, 1, 1, 1, 1,
0.8119317, -0.0740552, 2.457114, 1, 1, 1, 1, 1,
0.8204752, 0.0209373, 1.064727, 1, 1, 1, 1, 1,
0.821105, -1.445206, 1.597187, 1, 1, 1, 1, 1,
0.8270023, 0.183113, 2.386512, 1, 1, 1, 1, 1,
0.8270811, 1.678243, 0.6580935, 1, 1, 1, 1, 1,
0.8360416, 0.511264, 1.120223, 1, 1, 1, 1, 1,
0.8411613, -1.090547, 2.503798, 1, 1, 1, 1, 1,
0.8426541, 0.4834487, 1.916605, 1, 1, 1, 1, 1,
0.8435348, 0.1027426, 0.3260601, 1, 1, 1, 1, 1,
0.8481156, 0.7154592, 0.7925565, 0, 0, 1, 1, 1,
0.8505374, -0.6533087, 2.480412, 1, 0, 0, 1, 1,
0.8518222, -0.4612354, 2.271635, 1, 0, 0, 1, 1,
0.8524435, -2.284743, 3.114927, 1, 0, 0, 1, 1,
0.8540329, 0.4048662, 1.768448, 1, 0, 0, 1, 1,
0.8560486, 2.841186, -0.2067003, 1, 0, 0, 1, 1,
0.8617092, -0.4628576, 3.527168, 0, 0, 0, 1, 1,
0.8638712, -0.008265737, 1.243102, 0, 0, 0, 1, 1,
0.8645771, 0.2315454, 1.651266, 0, 0, 0, 1, 1,
0.8663051, 1.121043, -0.5946191, 0, 0, 0, 1, 1,
0.8692531, -1.116222, 1.33436, 0, 0, 0, 1, 1,
0.8703995, -1.003723, 2.273344, 0, 0, 0, 1, 1,
0.8715203, -1.296051, 4.45331, 0, 0, 0, 1, 1,
0.8731026, -0.05483103, 1.579245, 1, 1, 1, 1, 1,
0.8748374, 3.276172, 0.1157069, 1, 1, 1, 1, 1,
0.874958, -0.1140791, 3.444941, 1, 1, 1, 1, 1,
0.8801193, 0.3573996, 2.157245, 1, 1, 1, 1, 1,
0.8835822, -0.829527, 0.02468063, 1, 1, 1, 1, 1,
0.8860765, -0.8834389, 3.107546, 1, 1, 1, 1, 1,
0.8877783, 0.6885698, 2.834032, 1, 1, 1, 1, 1,
0.8882335, 0.6545401, 1.665808, 1, 1, 1, 1, 1,
0.8901268, 0.5094075, 0.07983291, 1, 1, 1, 1, 1,
0.8911827, 1.036968, 1.188437, 1, 1, 1, 1, 1,
0.8933865, -0.560217, 1.818268, 1, 1, 1, 1, 1,
0.8945478, -0.2634629, 1.971239, 1, 1, 1, 1, 1,
0.8956608, -0.554797, 2.755636, 1, 1, 1, 1, 1,
0.8982331, -1.6546, 3.255484, 1, 1, 1, 1, 1,
0.8982346, -0.6165572, 0.9245761, 1, 1, 1, 1, 1,
0.8983088, 1.166582, -0.7540505, 0, 0, 1, 1, 1,
0.8991084, 1.05242, -0.1870541, 1, 0, 0, 1, 1,
0.9022177, 0.5236492, 1.06722, 1, 0, 0, 1, 1,
0.9080139, 0.2757636, 1.14565, 1, 0, 0, 1, 1,
0.9097012, 0.1445641, 1.539359, 1, 0, 0, 1, 1,
0.9143, -0.7564841, 4.220297, 1, 0, 0, 1, 1,
0.9194938, 0.1372784, 1.058718, 0, 0, 0, 1, 1,
0.9238753, 1.754698, 0.9277546, 0, 0, 0, 1, 1,
0.9362466, 0.4068303, -0.1542489, 0, 0, 0, 1, 1,
0.9390235, 0.1220323, -0.2441216, 0, 0, 0, 1, 1,
0.9464427, -0.4162745, 1.908588, 0, 0, 0, 1, 1,
0.9484541, 0.6099954, 0.5881612, 0, 0, 0, 1, 1,
0.9489184, -0.4864901, 1.747992, 0, 0, 0, 1, 1,
0.9540937, 1.351174, 2.397913, 1, 1, 1, 1, 1,
0.9560318, -0.03175851, 3.48565, 1, 1, 1, 1, 1,
0.9616735, 0.5975857, 0.4765626, 1, 1, 1, 1, 1,
0.9760593, -0.7919915, 1.258032, 1, 1, 1, 1, 1,
0.9845897, 0.23859, 1.138354, 1, 1, 1, 1, 1,
0.9874246, -0.4084051, 3.293304, 1, 1, 1, 1, 1,
0.9904731, 0.2788389, 0.9838416, 1, 1, 1, 1, 1,
0.9911344, 0.1758949, -0.2939112, 1, 1, 1, 1, 1,
0.9942167, 0.1618221, 0.6964828, 1, 1, 1, 1, 1,
0.9956522, 0.2629154, 1.883672, 1, 1, 1, 1, 1,
1.004386, 0.7329969, 1.496503, 1, 1, 1, 1, 1,
1.01029, -0.567795, 3.588638, 1, 1, 1, 1, 1,
1.011107, 0.2878842, 2.310005, 1, 1, 1, 1, 1,
1.012787, 0.6923883, 2.008836, 1, 1, 1, 1, 1,
1.014449, -0.6010676, 3.261143, 1, 1, 1, 1, 1,
1.026757, 0.9166113, 1.160822, 0, 0, 1, 1, 1,
1.031973, -1.19376, 2.288197, 1, 0, 0, 1, 1,
1.03233, -2.085135, 2.85746, 1, 0, 0, 1, 1,
1.04187, -0.1692988, 1.854647, 1, 0, 0, 1, 1,
1.046432, -2.102592, 3.136248, 1, 0, 0, 1, 1,
1.048895, -0.3140413, 1.10431, 1, 0, 0, 1, 1,
1.051843, -1.623285, 3.109776, 0, 0, 0, 1, 1,
1.053129, -0.1903634, 0.2141074, 0, 0, 0, 1, 1,
1.056786, -0.1179741, 0.9671134, 0, 0, 0, 1, 1,
1.057445, -0.6588861, 1.716032, 0, 0, 0, 1, 1,
1.08215, 0.09010992, 1.895132, 0, 0, 0, 1, 1,
1.084308, 1.041501, 0.3967132, 0, 0, 0, 1, 1,
1.088143, -0.08115242, 1.280291, 0, 0, 0, 1, 1,
1.089481, -0.8087359, 2.737386, 1, 1, 1, 1, 1,
1.092358, -0.3425205, 2.32426, 1, 1, 1, 1, 1,
1.096544, 1.195901, 0.2459163, 1, 1, 1, 1, 1,
1.115609, -1.820458, 1.524926, 1, 1, 1, 1, 1,
1.118169, 1.800679, -1.69746, 1, 1, 1, 1, 1,
1.125174, 0.3185745, 1.412223, 1, 1, 1, 1, 1,
1.128122, 0.2583624, 3.208682, 1, 1, 1, 1, 1,
1.135494, -0.5440253, 3.428717, 1, 1, 1, 1, 1,
1.13806, 0.09495153, 1.928583, 1, 1, 1, 1, 1,
1.141214, 0.701228, 1.499415, 1, 1, 1, 1, 1,
1.141654, 0.1721559, 2.32726, 1, 1, 1, 1, 1,
1.154734, 1.042283, -1.064478, 1, 1, 1, 1, 1,
1.162682, -0.7133495, 2.160945, 1, 1, 1, 1, 1,
1.168351, 0.6607722, 2.74195, 1, 1, 1, 1, 1,
1.169107, 2.042927, 0.1041598, 1, 1, 1, 1, 1,
1.181993, 0.09258831, 0.9968425, 0, 0, 1, 1, 1,
1.193598, 0.9434628, 2.228578, 1, 0, 0, 1, 1,
1.194572, 1.894235, 3.643377, 1, 0, 0, 1, 1,
1.198012, 1.539739, -0.1293883, 1, 0, 0, 1, 1,
1.207905, -0.8672086, 2.482994, 1, 0, 0, 1, 1,
1.217718, 0.1975145, 1.954811, 1, 0, 0, 1, 1,
1.230399, -0.2476971, 0.03174926, 0, 0, 0, 1, 1,
1.235363, 0.1805951, 1.345554, 0, 0, 0, 1, 1,
1.237613, -0.8569453, 2.642828, 0, 0, 0, 1, 1,
1.251457, 0.3282371, 1.56026, 0, 0, 0, 1, 1,
1.269495, -1.104325, 3.070001, 0, 0, 0, 1, 1,
1.28103, -0.0615378, 2.045713, 0, 0, 0, 1, 1,
1.284276, 0.4602884, 1.413755, 0, 0, 0, 1, 1,
1.28907, -0.5328442, 0.293307, 1, 1, 1, 1, 1,
1.289412, 0.798683, 0.7800014, 1, 1, 1, 1, 1,
1.289565, 0.9838165, 1.994632, 1, 1, 1, 1, 1,
1.290729, -2.101692, 2.697711, 1, 1, 1, 1, 1,
1.296604, -1.204039, 2.945898, 1, 1, 1, 1, 1,
1.298259, -0.056168, 1.809124, 1, 1, 1, 1, 1,
1.298365, 0.2678713, 3.85348, 1, 1, 1, 1, 1,
1.298666, 0.3173118, 1.080284, 1, 1, 1, 1, 1,
1.302033, -0.3307917, 0.7086, 1, 1, 1, 1, 1,
1.309003, -1.244536, 1.355331, 1, 1, 1, 1, 1,
1.31535, 1.474518, 1.648995, 1, 1, 1, 1, 1,
1.317712, 1.521625, 1.11085, 1, 1, 1, 1, 1,
1.327355, -0.06064936, 1.678395, 1, 1, 1, 1, 1,
1.337757, -0.09269171, 1.026078, 1, 1, 1, 1, 1,
1.340093, -1.649867, 3.864237, 1, 1, 1, 1, 1,
1.345265, 0.4909418, 2.007036, 0, 0, 1, 1, 1,
1.359706, 0.3965887, 1.144643, 1, 0, 0, 1, 1,
1.360986, -0.4750922, 1.315103, 1, 0, 0, 1, 1,
1.370052, 0.8373825, 0.8628992, 1, 0, 0, 1, 1,
1.371351, -0.06075233, 0.9595062, 1, 0, 0, 1, 1,
1.382573, -0.3021848, 2.953758, 1, 0, 0, 1, 1,
1.391346, 0.5263029, 0.4410651, 0, 0, 0, 1, 1,
1.392531, -0.8896416, 3.373959, 0, 0, 0, 1, 1,
1.394747, -1.666745, 1.837105, 0, 0, 0, 1, 1,
1.397058, -1.320048, 3.065233, 0, 0, 0, 1, 1,
1.417261, 0.7751071, 1.564281, 0, 0, 0, 1, 1,
1.429359, 1.675628, 2.09284, 0, 0, 0, 1, 1,
1.43013, 1.452576, 1.458712, 0, 0, 0, 1, 1,
1.43149, 0.1295988, 0.2650771, 1, 1, 1, 1, 1,
1.437338, -0.5235046, 1.546141, 1, 1, 1, 1, 1,
1.454845, 0.9257461, 0.2917555, 1, 1, 1, 1, 1,
1.462767, -0.02367589, 0.4666972, 1, 1, 1, 1, 1,
1.469266, -0.1850657, 1.640774, 1, 1, 1, 1, 1,
1.47341, -1.526225, -0.03685279, 1, 1, 1, 1, 1,
1.477506, 0.3045086, 3.300035, 1, 1, 1, 1, 1,
1.483954, 0.1760147, 3.364578, 1, 1, 1, 1, 1,
1.488511, 0.3701114, 1.819417, 1, 1, 1, 1, 1,
1.492958, 1.93875, 0.4982541, 1, 1, 1, 1, 1,
1.512004, -0.2167796, 2.923167, 1, 1, 1, 1, 1,
1.513427, -0.9141084, 2.852151, 1, 1, 1, 1, 1,
1.517927, 0.1949431, 1.119057, 1, 1, 1, 1, 1,
1.525995, 0.05644583, 0.4957574, 1, 1, 1, 1, 1,
1.526805, 1.744548, 1.397209, 1, 1, 1, 1, 1,
1.534009, 0.7458345, 2.404254, 0, 0, 1, 1, 1,
1.546729, -0.08319347, 0.2091972, 1, 0, 0, 1, 1,
1.557367, 1.271255, -0.6174864, 1, 0, 0, 1, 1,
1.567386, 1.551719, -0.1507979, 1, 0, 0, 1, 1,
1.575788, -1.337226, 0.6060441, 1, 0, 0, 1, 1,
1.579019, 1.025451, 0.5577624, 1, 0, 0, 1, 1,
1.581029, 0.2567891, 0.9474752, 0, 0, 0, 1, 1,
1.587576, -1.442881, 0.553133, 0, 0, 0, 1, 1,
1.588892, -0.5922868, 3.635555, 0, 0, 0, 1, 1,
1.596052, 0.4471818, -0.6374302, 0, 0, 0, 1, 1,
1.596286, -0.6159374, 2.82233, 0, 0, 0, 1, 1,
1.607315, 1.990975, 1.9324, 0, 0, 0, 1, 1,
1.609682, 0.4071014, 2.07758, 0, 0, 0, 1, 1,
1.626262, 0.3138061, 2.073404, 1, 1, 1, 1, 1,
1.642467, 0.6070936, -0.09654001, 1, 1, 1, 1, 1,
1.661525, -0.6976966, 4.709146, 1, 1, 1, 1, 1,
1.670534, -0.7358134, 2.368474, 1, 1, 1, 1, 1,
1.674672, -0.2472651, 2.384696, 1, 1, 1, 1, 1,
1.703674, 0.265713, 1.480186, 1, 1, 1, 1, 1,
1.707199, 1.818558, 2.100456, 1, 1, 1, 1, 1,
1.747651, 1.096151, 1.714053, 1, 1, 1, 1, 1,
1.748413, -0.694059, 2.568416, 1, 1, 1, 1, 1,
1.754753, -1.106848, 1.313291, 1, 1, 1, 1, 1,
1.763618, 0.04625842, 0.9763718, 1, 1, 1, 1, 1,
1.766808, -0.3161418, -0.2158917, 1, 1, 1, 1, 1,
1.771743, -1.916935, 3.660559, 1, 1, 1, 1, 1,
1.7768, -0.824388, 2.879051, 1, 1, 1, 1, 1,
1.789409, -2.199596, 2.545084, 1, 1, 1, 1, 1,
1.791452, -0.3342651, 1.50035, 0, 0, 1, 1, 1,
1.814159, 0.2535758, -0.2978799, 1, 0, 0, 1, 1,
1.814423, -0.3306779, 1.143932, 1, 0, 0, 1, 1,
1.825363, 2.022076, 0.6904623, 1, 0, 0, 1, 1,
1.836191, 0.3070547, 2.983061, 1, 0, 0, 1, 1,
1.856788, 1.202548, 2.487563, 1, 0, 0, 1, 1,
1.860518, -0.8831142, 1.574528, 0, 0, 0, 1, 1,
1.8735, -0.8220609, 2.277144, 0, 0, 0, 1, 1,
1.890686, -2.277845, 1.966701, 0, 0, 0, 1, 1,
1.891241, 2.154465, 0.4878906, 0, 0, 0, 1, 1,
1.915191, -0.3124419, 1.656357, 0, 0, 0, 1, 1,
1.922006, 1.012299, 1.954394, 0, 0, 0, 1, 1,
1.923546, 0.114962, 3.701836, 0, 0, 0, 1, 1,
1.92689, -0.4224492, 1.734064, 1, 1, 1, 1, 1,
1.931026, -2.224467, 0.9125558, 1, 1, 1, 1, 1,
1.950057, 1.330027, -0.3983192, 1, 1, 1, 1, 1,
1.969649, 0.8363789, 1.445776, 1, 1, 1, 1, 1,
1.984003, 2.177897, -0.1447164, 1, 1, 1, 1, 1,
1.985236, 0.7819212, 0.8114235, 1, 1, 1, 1, 1,
1.988103, 1.071136, 2.250416, 1, 1, 1, 1, 1,
2.00167, 0.0485168, 2.282502, 1, 1, 1, 1, 1,
2.013648, 0.6713784, 2.112016, 1, 1, 1, 1, 1,
2.04437, -0.5694401, 0.7811032, 1, 1, 1, 1, 1,
2.048201, 0.4415801, 2.205733, 1, 1, 1, 1, 1,
2.048812, 1.247132, 0.7630073, 1, 1, 1, 1, 1,
2.069051, -0.2424022, 1.951703, 1, 1, 1, 1, 1,
2.155916, 1.109722, 0.9942849, 1, 1, 1, 1, 1,
2.190724, 0.120198, 1.649996, 1, 1, 1, 1, 1,
2.248735, 0.435691, 1.335565, 0, 0, 1, 1, 1,
2.254228, 2.01768, 1.811237, 1, 0, 0, 1, 1,
2.31708, -0.06370606, 1.415431, 1, 0, 0, 1, 1,
2.31928, 1.704346, 0.04107406, 1, 0, 0, 1, 1,
2.354689, -0.465966, 1.524977, 1, 0, 0, 1, 1,
2.361106, 0.5877194, 2.233929, 1, 0, 0, 1, 1,
2.369279, -0.05321972, 3.245489, 0, 0, 0, 1, 1,
2.398899, 0.3547468, 2.217993, 0, 0, 0, 1, 1,
2.407207, 0.165921, 1.250954, 0, 0, 0, 1, 1,
2.446225, 2.351623, 0.7435965, 0, 0, 0, 1, 1,
2.489134, -0.3622517, 2.339049, 0, 0, 0, 1, 1,
2.5373, -1.853648, 1.854276, 0, 0, 0, 1, 1,
2.589657, 0.7571678, 1.376587, 0, 0, 0, 1, 1,
2.763744, -0.0415744, 3.351937, 1, 1, 1, 1, 1,
2.844631, -0.4888042, 2.192927, 1, 1, 1, 1, 1,
2.917335, 0.6144648, 1.350483, 1, 1, 1, 1, 1,
2.939084, 0.6533014, 1.700897, 1, 1, 1, 1, 1,
2.940606, -0.7524655, 2.990738, 1, 1, 1, 1, 1,
2.955403, -0.2111727, 0.1011313, 1, 1, 1, 1, 1,
3.190045, 1.2412, 3.431926, 1, 1, 1, 1, 1
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
var radius = 9.558921;
var distance = 33.57531;
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
mvMatrix.translate( -0.1481609, -0.1144447, 0.1107433 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57531);
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
