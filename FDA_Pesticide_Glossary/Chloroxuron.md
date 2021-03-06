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
-3.583481, -0.3284553, -2.391547, 1, 0, 0, 1,
-3.014145, 0.2031195, -1.193535, 1, 0.007843138, 0, 1,
-2.827651, -2.240789, -1.318256, 1, 0.01176471, 0, 1,
-2.793427, 0.02137967, -0.4423579, 1, 0.01960784, 0, 1,
-2.748348, -0.001232852, -2.818575, 1, 0.02352941, 0, 1,
-2.722267, 1.735126, -0.8140649, 1, 0.03137255, 0, 1,
-2.719172, -0.9940587, -1.369608, 1, 0.03529412, 0, 1,
-2.653171, -0.6628651, -1.530477, 1, 0.04313726, 0, 1,
-2.609804, 0.08372325, -3.142952, 1, 0.04705882, 0, 1,
-2.594673, 1.493272, -0.804311, 1, 0.05490196, 0, 1,
-2.480047, 0.1465414, -0.3895481, 1, 0.05882353, 0, 1,
-2.459278, -1.174824, -0.1661913, 1, 0.06666667, 0, 1,
-2.389112, -0.07705003, -1.095065, 1, 0.07058824, 0, 1,
-2.363635, -0.1016667, -1.976948, 1, 0.07843138, 0, 1,
-2.3386, 0.7439758, -1.700448, 1, 0.08235294, 0, 1,
-2.337913, -1.188594, 0.505628, 1, 0.09019608, 0, 1,
-2.304017, 0.5400257, -2.078956, 1, 0.09411765, 0, 1,
-2.281113, -0.42119, -2.309335, 1, 0.1019608, 0, 1,
-2.276832, 0.2332031, -0.3072796, 1, 0.1098039, 0, 1,
-2.154719, 0.2476092, -1.267742, 1, 0.1137255, 0, 1,
-1.995989, 0.5466584, -1.397476, 1, 0.1215686, 0, 1,
-1.986362, -1.121556, -1.571317, 1, 0.1254902, 0, 1,
-1.985391, 0.6517053, -0.9629045, 1, 0.1333333, 0, 1,
-1.967547, -0.7832661, -0.256908, 1, 0.1372549, 0, 1,
-1.965095, 1.093163, -1.922264, 1, 0.145098, 0, 1,
-1.928539, -0.2914869, -0.8175082, 1, 0.1490196, 0, 1,
-1.917495, -1.053488, -0.7124851, 1, 0.1568628, 0, 1,
-1.886747, -0.2470367, -1.153924, 1, 0.1607843, 0, 1,
-1.884794, -0.8625429, -1.383353, 1, 0.1686275, 0, 1,
-1.868954, 0.204025, -0.5890652, 1, 0.172549, 0, 1,
-1.822476, 1.655935, -2.449388, 1, 0.1803922, 0, 1,
-1.805362, -0.431573, -1.654614, 1, 0.1843137, 0, 1,
-1.801566, -0.172033, 0.1127685, 1, 0.1921569, 0, 1,
-1.762371, -0.3053089, -3.418308, 1, 0.1960784, 0, 1,
-1.756966, 1.553553, 0.6861803, 1, 0.2039216, 0, 1,
-1.74044, 0.2771938, 0.1060364, 1, 0.2117647, 0, 1,
-1.73861, 0.810384, -1.619152, 1, 0.2156863, 0, 1,
-1.721295, 0.5387161, -0.2452167, 1, 0.2235294, 0, 1,
-1.707607, -0.3786539, 0.6631511, 1, 0.227451, 0, 1,
-1.700753, -1.091913, -2.767517, 1, 0.2352941, 0, 1,
-1.690158, 0.1061547, -0.919797, 1, 0.2392157, 0, 1,
-1.688263, 0.05743501, -1.069869, 1, 0.2470588, 0, 1,
-1.688163, 0.6279239, -0.2398755, 1, 0.2509804, 0, 1,
-1.677098, -0.1983266, -1.628856, 1, 0.2588235, 0, 1,
-1.667481, -0.4834819, -1.779287, 1, 0.2627451, 0, 1,
-1.666049, 0.1713492, -0.1598031, 1, 0.2705882, 0, 1,
-1.64856, -0.04327355, -2.03181, 1, 0.2745098, 0, 1,
-1.644763, -0.9326239, -3.15044, 1, 0.282353, 0, 1,
-1.64332, -1.521499, -1.917035, 1, 0.2862745, 0, 1,
-1.638313, -0.9804495, 1.014458, 1, 0.2941177, 0, 1,
-1.637741, 0.8432297, -0.8286385, 1, 0.3019608, 0, 1,
-1.625724, -0.05471687, 0.107868, 1, 0.3058824, 0, 1,
-1.598937, 1.610074, -0.136339, 1, 0.3137255, 0, 1,
-1.588284, -1.062667, -3.25569, 1, 0.3176471, 0, 1,
-1.58777, 0.6842871, 0.7395588, 1, 0.3254902, 0, 1,
-1.568783, -1.284498, -2.426011, 1, 0.3294118, 0, 1,
-1.562763, 1.734004, -0.9083008, 1, 0.3372549, 0, 1,
-1.545426, -0.2710799, -0.3821413, 1, 0.3411765, 0, 1,
-1.543198, -0.7895896, -1.789548, 1, 0.3490196, 0, 1,
-1.5322, 2.062879, 0.2147578, 1, 0.3529412, 0, 1,
-1.531395, 0.491494, -0.5481167, 1, 0.3607843, 0, 1,
-1.516136, -0.3133934, -2.755459, 1, 0.3647059, 0, 1,
-1.515229, 1.032317, -0.3169798, 1, 0.372549, 0, 1,
-1.50994, -0.03005574, -4.059981, 1, 0.3764706, 0, 1,
-1.507288, -0.2336794, -1.559695, 1, 0.3843137, 0, 1,
-1.505926, 0.2216409, -1.304527, 1, 0.3882353, 0, 1,
-1.499478, -0.4678873, -1.128601, 1, 0.3960784, 0, 1,
-1.487293, 0.6156376, -2.3672, 1, 0.4039216, 0, 1,
-1.48489, -0.0006158587, -3.031695, 1, 0.4078431, 0, 1,
-1.461395, 0.5201447, -1.122116, 1, 0.4156863, 0, 1,
-1.452434, 0.6747332, -0.9299367, 1, 0.4196078, 0, 1,
-1.447334, 1.118316, -1.065343, 1, 0.427451, 0, 1,
-1.440486, -0.5863005, -1.018391, 1, 0.4313726, 0, 1,
-1.432565, 1.863889, -0.6317042, 1, 0.4392157, 0, 1,
-1.427273, 1.322472, 0.9424105, 1, 0.4431373, 0, 1,
-1.419246, 0.1895494, -0.1588022, 1, 0.4509804, 0, 1,
-1.417557, 1.188585, -2.791153, 1, 0.454902, 0, 1,
-1.407766, 0.2441117, -1.262052, 1, 0.4627451, 0, 1,
-1.402724, 0.1508401, -2.620133, 1, 0.4666667, 0, 1,
-1.395995, -0.5987251, -0.814236, 1, 0.4745098, 0, 1,
-1.38633, 1.552788, -0.5045763, 1, 0.4784314, 0, 1,
-1.377733, 2.191432, -0.2561493, 1, 0.4862745, 0, 1,
-1.375014, 1.386383, -1.048365, 1, 0.4901961, 0, 1,
-1.366227, -1.064484, -3.116431, 1, 0.4980392, 0, 1,
-1.366012, -0.1115395, -1.125864, 1, 0.5058824, 0, 1,
-1.355036, 0.08428416, -1.452413, 1, 0.509804, 0, 1,
-1.340844, -0.5267646, -1.590433, 1, 0.5176471, 0, 1,
-1.325241, 1.072435, -0.6150838, 1, 0.5215687, 0, 1,
-1.314947, 0.7229249, 0.2089529, 1, 0.5294118, 0, 1,
-1.312611, -0.05972753, -2.049117, 1, 0.5333334, 0, 1,
-1.309571, 1.013038, -1.237491, 1, 0.5411765, 0, 1,
-1.304413, 0.1520146, -2.295309, 1, 0.5450981, 0, 1,
-1.298784, 1.090476, -2.526354, 1, 0.5529412, 0, 1,
-1.289893, 0.9915161, -0.4044661, 1, 0.5568628, 0, 1,
-1.286232, 0.9116718, 0.4503357, 1, 0.5647059, 0, 1,
-1.273778, 0.4420633, -0.1843065, 1, 0.5686275, 0, 1,
-1.273328, -0.1707542, -0.7886921, 1, 0.5764706, 0, 1,
-1.265586, -0.5686636, -1.916051, 1, 0.5803922, 0, 1,
-1.262249, 0.3734274, -1.06139, 1, 0.5882353, 0, 1,
-1.259367, -1.20997, -2.177071, 1, 0.5921569, 0, 1,
-1.258528, 1.152807, -2.674646, 1, 0.6, 0, 1,
-1.239814, -0.5951384, -3.007708, 1, 0.6078432, 0, 1,
-1.237488, -0.3222323, -2.100145, 1, 0.6117647, 0, 1,
-1.23659, -0.1832939, -1.910508, 1, 0.6196079, 0, 1,
-1.236359, -0.6177739, -3.708407, 1, 0.6235294, 0, 1,
-1.230941, 0.5989742, -1.927093, 1, 0.6313726, 0, 1,
-1.230263, -1.081683, -1.933423, 1, 0.6352941, 0, 1,
-1.2281, 1.196146, 0.4582021, 1, 0.6431373, 0, 1,
-1.221974, 0.4488137, -1.886055, 1, 0.6470588, 0, 1,
-1.218813, 0.62084, -0.7164717, 1, 0.654902, 0, 1,
-1.206873, 0.1229044, -1.316962, 1, 0.6588235, 0, 1,
-1.201035, -0.9673411, -2.614751, 1, 0.6666667, 0, 1,
-1.194928, -1.341558, -2.893788, 1, 0.6705883, 0, 1,
-1.194186, -0.7681936, -1.830396, 1, 0.6784314, 0, 1,
-1.184646, -1.621144, -3.183417, 1, 0.682353, 0, 1,
-1.178891, -0.1772436, -0.8816761, 1, 0.6901961, 0, 1,
-1.17794, -1.225887, -2.71305, 1, 0.6941177, 0, 1,
-1.170003, 1.396056, -0.8166305, 1, 0.7019608, 0, 1,
-1.166957, -0.3355581, -2.417963, 1, 0.7098039, 0, 1,
-1.166571, -0.9971648, -1.174202, 1, 0.7137255, 0, 1,
-1.165343, -0.2981844, -1.733841, 1, 0.7215686, 0, 1,
-1.161854, 0.2805947, -1.902831, 1, 0.7254902, 0, 1,
-1.161358, 1.934023, 0.6998314, 1, 0.7333333, 0, 1,
-1.160275, 0.3894147, -1.872884, 1, 0.7372549, 0, 1,
-1.159318, -1.145523, -2.767906, 1, 0.7450981, 0, 1,
-1.157882, -0.003507033, -2.573311, 1, 0.7490196, 0, 1,
-1.152003, 2.690659, -0.02145724, 1, 0.7568628, 0, 1,
-1.14298, -0.5921209, -0.760777, 1, 0.7607843, 0, 1,
-1.139889, -0.4229386, -0.3949887, 1, 0.7686275, 0, 1,
-1.135499, 1.811681, -0.8723245, 1, 0.772549, 0, 1,
-1.134617, 1.979167, 0.6719819, 1, 0.7803922, 0, 1,
-1.132252, -0.2669407, -0.09501106, 1, 0.7843137, 0, 1,
-1.128613, 0.8022142, -1.691631, 1, 0.7921569, 0, 1,
-1.125025, -0.329966, -1.099535, 1, 0.7960784, 0, 1,
-1.118041, 1.044807, -1.652122, 1, 0.8039216, 0, 1,
-1.114004, 0.4638406, -1.44049, 1, 0.8117647, 0, 1,
-1.09113, 0.2118384, -1.617527, 1, 0.8156863, 0, 1,
-1.08281, 1.070692, -1.347932, 1, 0.8235294, 0, 1,
-1.082576, -1.433705, -3.886137, 1, 0.827451, 0, 1,
-1.076357, 0.5288364, 0.4423291, 1, 0.8352941, 0, 1,
-1.073527, -1.505231, -1.648521, 1, 0.8392157, 0, 1,
-1.072897, 1.713809, -0.01907898, 1, 0.8470588, 0, 1,
-1.069457, -0.9582837, -2.610227, 1, 0.8509804, 0, 1,
-1.069055, 0.302287, -1.699149, 1, 0.8588235, 0, 1,
-1.068975, -1.190841, -2.492114, 1, 0.8627451, 0, 1,
-1.061024, -0.3633364, -3.760431, 1, 0.8705882, 0, 1,
-1.06095, -0.6282309, -3.20083, 1, 0.8745098, 0, 1,
-1.054174, 0.2530354, -1.460941, 1, 0.8823529, 0, 1,
-1.051206, 0.1280525, -2.476454, 1, 0.8862745, 0, 1,
-1.041278, -0.8923137, -2.184056, 1, 0.8941177, 0, 1,
-1.037621, 0.1318684, -1.098587, 1, 0.8980392, 0, 1,
-1.033781, 0.7650373, -1.709108, 1, 0.9058824, 0, 1,
-1.03272, 0.2647568, 0.139979, 1, 0.9137255, 0, 1,
-1.030247, -0.05948307, -3.393614, 1, 0.9176471, 0, 1,
-1.02882, -0.1289272, -2.633553, 1, 0.9254902, 0, 1,
-1.026579, 0.8977206, -0.7378338, 1, 0.9294118, 0, 1,
-1.024942, 1.391303, 0.7834216, 1, 0.9372549, 0, 1,
-1.020071, -0.3655078, -2.82169, 1, 0.9411765, 0, 1,
-1.018455, 2.195399, -0.110436, 1, 0.9490196, 0, 1,
-1.005574, 0.08315956, 0.1882817, 1, 0.9529412, 0, 1,
-0.9979571, -0.8916856, -1.373098, 1, 0.9607843, 0, 1,
-0.9848638, -0.8343206, -0.6737466, 1, 0.9647059, 0, 1,
-0.9767839, -1.314101, -1.604702, 1, 0.972549, 0, 1,
-0.9766657, -0.4763494, -0.3851801, 1, 0.9764706, 0, 1,
-0.962589, -0.541748, -3.224993, 1, 0.9843137, 0, 1,
-0.9619813, -1.086526, -1.09577, 1, 0.9882353, 0, 1,
-0.9561303, -0.995607, -2.903496, 1, 0.9960784, 0, 1,
-0.9446165, -0.2284255, -2.320694, 0.9960784, 1, 0, 1,
-0.9405488, 0.5057703, -1.5473, 0.9921569, 1, 0, 1,
-0.9397094, 0.01354426, -1.804161, 0.9843137, 1, 0, 1,
-0.9319232, -1.157494, -2.42648, 0.9803922, 1, 0, 1,
-0.9286965, 0.7747281, -0.9460383, 0.972549, 1, 0, 1,
-0.9273927, 0.4539634, -0.1936381, 0.9686275, 1, 0, 1,
-0.9240563, 0.9958811, -1.882338, 0.9607843, 1, 0, 1,
-0.9236554, 0.1218573, -1.368641, 0.9568627, 1, 0, 1,
-0.9213372, 1.142963, -0.5617365, 0.9490196, 1, 0, 1,
-0.9210719, 0.5612189, -1.502215, 0.945098, 1, 0, 1,
-0.9189273, -1.325222, -2.564016, 0.9372549, 1, 0, 1,
-0.9159368, 0.1466074, -0.6788519, 0.9333333, 1, 0, 1,
-0.9148397, -0.03407038, -2.477344, 0.9254902, 1, 0, 1,
-0.9142686, -0.6052172, -2.716645, 0.9215686, 1, 0, 1,
-0.9139118, 0.5575952, -1.824017, 0.9137255, 1, 0, 1,
-0.913344, 0.233648, -3.090899, 0.9098039, 1, 0, 1,
-0.9129345, 0.5313318, -2.902093, 0.9019608, 1, 0, 1,
-0.9118549, -1.076909, -2.253434, 0.8941177, 1, 0, 1,
-0.9088559, -0.5472925, -2.786734, 0.8901961, 1, 0, 1,
-0.9023572, 1.034218, -0.6923963, 0.8823529, 1, 0, 1,
-0.9009051, 0.3620567, 0.4292928, 0.8784314, 1, 0, 1,
-0.8974304, 0.04707441, -3.226981, 0.8705882, 1, 0, 1,
-0.8955408, 0.5992542, 1.392271, 0.8666667, 1, 0, 1,
-0.8949142, 0.5878611, -0.00411322, 0.8588235, 1, 0, 1,
-0.8907447, 2.266855, -1.72545, 0.854902, 1, 0, 1,
-0.8903435, 0.9677081, 0.5584514, 0.8470588, 1, 0, 1,
-0.8898695, -2.03005, -3.125762, 0.8431373, 1, 0, 1,
-0.8876486, 1.309497, 0.676053, 0.8352941, 1, 0, 1,
-0.883437, -0.2443661, -2.665904, 0.8313726, 1, 0, 1,
-0.8827172, 1.36313, -1.282993, 0.8235294, 1, 0, 1,
-0.8800083, 1.488297, -0.2084341, 0.8196079, 1, 0, 1,
-0.8797969, -0.5944563, -2.853765, 0.8117647, 1, 0, 1,
-0.8734782, -0.8655728, -2.129993, 0.8078431, 1, 0, 1,
-0.8710926, -0.6871622, -2.920827, 0.8, 1, 0, 1,
-0.8707098, -0.9971807, -3.107644, 0.7921569, 1, 0, 1,
-0.8685963, -2.183447, -2.995719, 0.7882353, 1, 0, 1,
-0.8670937, 1.127561, -0.4219988, 0.7803922, 1, 0, 1,
-0.8667551, -0.4405039, -2.916121, 0.7764706, 1, 0, 1,
-0.8608262, 0.04117353, -3.380352, 0.7686275, 1, 0, 1,
-0.8578275, 0.9236866, -1.237328, 0.7647059, 1, 0, 1,
-0.853756, 0.3157538, -3.362769, 0.7568628, 1, 0, 1,
-0.8516847, -0.03851578, -1.064397, 0.7529412, 1, 0, 1,
-0.8490896, 2.309128, -0.2356465, 0.7450981, 1, 0, 1,
-0.8484765, 0.1323431, -2.141791, 0.7411765, 1, 0, 1,
-0.8400463, -2.097127, -1.40419, 0.7333333, 1, 0, 1,
-0.8393005, 0.2482317, -0.5159885, 0.7294118, 1, 0, 1,
-0.8386204, -0.7302448, -3.823213, 0.7215686, 1, 0, 1,
-0.8333035, -1.145208, -3.042435, 0.7176471, 1, 0, 1,
-0.8211859, -0.429141, -2.417734, 0.7098039, 1, 0, 1,
-0.8202478, -1.269043, -2.766295, 0.7058824, 1, 0, 1,
-0.8197654, 0.528276, -1.598513, 0.6980392, 1, 0, 1,
-0.8189148, -1.003051, -2.329161, 0.6901961, 1, 0, 1,
-0.8176153, -0.194469, -1.518423, 0.6862745, 1, 0, 1,
-0.8159636, -1.160963, -4.120917, 0.6784314, 1, 0, 1,
-0.8138266, 0.1644527, -1.546348, 0.6745098, 1, 0, 1,
-0.8136683, -0.02720235, -0.998419, 0.6666667, 1, 0, 1,
-0.8124173, 0.181324, -0.8618935, 0.6627451, 1, 0, 1,
-0.811324, 0.4494206, -0.2338067, 0.654902, 1, 0, 1,
-0.8059258, 0.001163513, -1.380274, 0.6509804, 1, 0, 1,
-0.8020398, 0.003678612, -1.092725, 0.6431373, 1, 0, 1,
-0.7999288, 0.7991554, -0.084314, 0.6392157, 1, 0, 1,
-0.7997538, -0.5179828, -1.346892, 0.6313726, 1, 0, 1,
-0.7959561, -0.7748532, 0.1877961, 0.627451, 1, 0, 1,
-0.7914866, 0.2025643, -0.704411, 0.6196079, 1, 0, 1,
-0.7871901, 2.317327, 0.3172388, 0.6156863, 1, 0, 1,
-0.7869458, 1.224982, -1.125907, 0.6078432, 1, 0, 1,
-0.7835379, -1.670427, -1.713375, 0.6039216, 1, 0, 1,
-0.7734931, 0.8157932, -0.5215158, 0.5960785, 1, 0, 1,
-0.7666434, 0.984553, -1.521885, 0.5882353, 1, 0, 1,
-0.7601132, -0.445833, -1.686533, 0.5843138, 1, 0, 1,
-0.7537047, -0.6768584, -2.333297, 0.5764706, 1, 0, 1,
-0.752873, -0.3233154, -1.927437, 0.572549, 1, 0, 1,
-0.7525901, 1.613738, -0.9307507, 0.5647059, 1, 0, 1,
-0.7499436, 0.5038929, -1.81309, 0.5607843, 1, 0, 1,
-0.7476218, 0.5499498, -0.7610829, 0.5529412, 1, 0, 1,
-0.7464666, 0.5417007, -1.039502, 0.5490196, 1, 0, 1,
-0.7432711, -0.7977504, -3.251309, 0.5411765, 1, 0, 1,
-0.7394513, 0.6129078, -1.630496, 0.5372549, 1, 0, 1,
-0.733585, 2.994554, -1.886579, 0.5294118, 1, 0, 1,
-0.7240116, -0.05323181, -0.8288618, 0.5254902, 1, 0, 1,
-0.7156922, -0.6932855, -0.9576456, 0.5176471, 1, 0, 1,
-0.7153264, -0.3357972, -1.267825, 0.5137255, 1, 0, 1,
-0.7148352, -1.074309, -2.756012, 0.5058824, 1, 0, 1,
-0.7085143, 0.6449773, 0.5582663, 0.5019608, 1, 0, 1,
-0.7041665, 1.685151, -2.698412, 0.4941176, 1, 0, 1,
-0.7035285, -0.4387489, -2.60854, 0.4862745, 1, 0, 1,
-0.7026731, -0.1762875, -1.937373, 0.4823529, 1, 0, 1,
-0.6946037, -1.240437, -2.467132, 0.4745098, 1, 0, 1,
-0.6901404, -0.2862879, -3.354241, 0.4705882, 1, 0, 1,
-0.6897149, -0.492351, -1.216226, 0.4627451, 1, 0, 1,
-0.6844468, 0.2394095, -1.648113, 0.4588235, 1, 0, 1,
-0.6828459, -0.574441, -1.854495, 0.4509804, 1, 0, 1,
-0.6773376, 0.5457411, -1.774305, 0.4470588, 1, 0, 1,
-0.6745758, -0.7100238, -1.316191, 0.4392157, 1, 0, 1,
-0.6709544, -0.1188354, -2.788563, 0.4352941, 1, 0, 1,
-0.6684963, -1.688582, -1.146696, 0.427451, 1, 0, 1,
-0.6657978, -0.3387688, -2.388461, 0.4235294, 1, 0, 1,
-0.660895, 1.161476, -0.3784938, 0.4156863, 1, 0, 1,
-0.6504188, 0.1135576, -3.006776, 0.4117647, 1, 0, 1,
-0.6493644, 0.361575, -2.786864, 0.4039216, 1, 0, 1,
-0.6483666, 0.310228, -0.2756709, 0.3960784, 1, 0, 1,
-0.6464878, -0.8537673, -2.992421, 0.3921569, 1, 0, 1,
-0.6394886, -0.5308529, -1.524298, 0.3843137, 1, 0, 1,
-0.6385373, -1.146147, -1.16865, 0.3803922, 1, 0, 1,
-0.6367596, 1.727291, 0.5090696, 0.372549, 1, 0, 1,
-0.6337712, -0.7026342, -3.361992, 0.3686275, 1, 0, 1,
-0.6313131, 0.1199037, -0.2211801, 0.3607843, 1, 0, 1,
-0.6303103, -0.6458102, -4.264836, 0.3568628, 1, 0, 1,
-0.6262093, 0.6807106, -2.246522, 0.3490196, 1, 0, 1,
-0.6169796, -0.07785401, -0.6107551, 0.345098, 1, 0, 1,
-0.6119297, 0.4479355, -2.813428, 0.3372549, 1, 0, 1,
-0.6057222, 0.4722499, -0.5163736, 0.3333333, 1, 0, 1,
-0.6052201, -0.9857064, -2.643872, 0.3254902, 1, 0, 1,
-0.601379, -2.685478, -3.354831, 0.3215686, 1, 0, 1,
-0.5975965, 1.437748, 0.9368773, 0.3137255, 1, 0, 1,
-0.5925965, -1.327226, -3.246119, 0.3098039, 1, 0, 1,
-0.5917444, -1.138012, -1.418054, 0.3019608, 1, 0, 1,
-0.5917094, -0.3145704, -1.625378, 0.2941177, 1, 0, 1,
-0.590923, -0.4750576, -2.221381, 0.2901961, 1, 0, 1,
-0.5890186, 0.2555938, -1.09874, 0.282353, 1, 0, 1,
-0.5868306, -0.2909685, -3.253754, 0.2784314, 1, 0, 1,
-0.5835213, 1.384833, -1.465639, 0.2705882, 1, 0, 1,
-0.5817443, 0.2606966, -2.686808, 0.2666667, 1, 0, 1,
-0.5784519, -1.407764, -2.640997, 0.2588235, 1, 0, 1,
-0.5771135, 0.08502102, -0.9457281, 0.254902, 1, 0, 1,
-0.5747784, -0.008412242, -0.494677, 0.2470588, 1, 0, 1,
-0.5671127, -1.048338, -3.83346, 0.2431373, 1, 0, 1,
-0.5668957, -0.1213419, -0.4707081, 0.2352941, 1, 0, 1,
-0.5664328, -1.231011, -2.016919, 0.2313726, 1, 0, 1,
-0.5608051, -0.2369413, -1.372378, 0.2235294, 1, 0, 1,
-0.5591834, -0.1748724, -0.5306386, 0.2196078, 1, 0, 1,
-0.5570338, -1.659138, -1.787491, 0.2117647, 1, 0, 1,
-0.5536156, 0.2243151, -1.024807, 0.2078431, 1, 0, 1,
-0.5409563, 0.5469658, -0.7171298, 0.2, 1, 0, 1,
-0.5398628, -1.922462, -4.713374, 0.1921569, 1, 0, 1,
-0.5397357, -1.187827, -1.073119, 0.1882353, 1, 0, 1,
-0.5375957, 0.191245, -2.409104, 0.1803922, 1, 0, 1,
-0.5362275, 0.7410079, -1.743744, 0.1764706, 1, 0, 1,
-0.536045, -1.933295, -1.641141, 0.1686275, 1, 0, 1,
-0.5356926, -0.6280351, -2.074096, 0.1647059, 1, 0, 1,
-0.5352471, 1.633885, -0.334886, 0.1568628, 1, 0, 1,
-0.5348955, -0.9905737, -3.276393, 0.1529412, 1, 0, 1,
-0.5312183, -0.333075, -2.282774, 0.145098, 1, 0, 1,
-0.5286831, -1.210553, -2.688078, 0.1411765, 1, 0, 1,
-0.5282741, 1.949307, -0.9382084, 0.1333333, 1, 0, 1,
-0.5246805, 0.03947982, -2.48005, 0.1294118, 1, 0, 1,
-0.522644, 0.1729235, -1.860553, 0.1215686, 1, 0, 1,
-0.5221049, -1.04971, -2.650338, 0.1176471, 1, 0, 1,
-0.521735, 0.7689874, -0.09435039, 0.1098039, 1, 0, 1,
-0.5193987, 1.479356, 1.849415, 0.1058824, 1, 0, 1,
-0.5185924, 0.2130179, -2.470251, 0.09803922, 1, 0, 1,
-0.5167497, 0.1072821, -1.494159, 0.09019608, 1, 0, 1,
-0.5161093, 0.3145635, 0.4362066, 0.08627451, 1, 0, 1,
-0.5125358, -1.589499, -2.048463, 0.07843138, 1, 0, 1,
-0.5081405, 1.432011, 0.3631397, 0.07450981, 1, 0, 1,
-0.507204, 0.4007568, -1.119898, 0.06666667, 1, 0, 1,
-0.506874, 2.919884, -1.264788, 0.0627451, 1, 0, 1,
-0.5059853, -0.5477479, -2.920519, 0.05490196, 1, 0, 1,
-0.5017383, -1.743873, -2.419829, 0.05098039, 1, 0, 1,
-0.4989567, -0.1791131, -1.20356, 0.04313726, 1, 0, 1,
-0.4989468, 0.9058611, -0.8352032, 0.03921569, 1, 0, 1,
-0.4988676, 0.575808, -0.5458508, 0.03137255, 1, 0, 1,
-0.4971055, -2.005082, -2.443678, 0.02745098, 1, 0, 1,
-0.4967182, 1.716931, -0.8808861, 0.01960784, 1, 0, 1,
-0.4961096, 0.1046571, -1.773041, 0.01568628, 1, 0, 1,
-0.4947886, 0.1882142, -2.380752, 0.007843138, 1, 0, 1,
-0.4943252, -0.4374642, -4.655188, 0.003921569, 1, 0, 1,
-0.4904104, -1.302624, -3.770782, 0, 1, 0.003921569, 1,
-0.4885396, -0.3556553, -1.004161, 0, 1, 0.01176471, 1,
-0.4879106, 0.4498094, 0.4847986, 0, 1, 0.01568628, 1,
-0.4874563, -1.272827, -4.969987, 0, 1, 0.02352941, 1,
-0.4805432, 0.4191336, 0.9274812, 0, 1, 0.02745098, 1,
-0.4801971, 0.5260241, 0.3884577, 0, 1, 0.03529412, 1,
-0.4784801, -0.2946541, -4.371262, 0, 1, 0.03921569, 1,
-0.4784372, 0.7639717, 0.9155456, 0, 1, 0.04705882, 1,
-0.4772726, -1.690552, -3.057028, 0, 1, 0.05098039, 1,
-0.4766962, 0.1626857, -1.289896, 0, 1, 0.05882353, 1,
-0.4727715, 0.732128, -0.8719897, 0, 1, 0.0627451, 1,
-0.4692378, -0.7796571, -2.564941, 0, 1, 0.07058824, 1,
-0.4692269, -1.22306, -3.164753, 0, 1, 0.07450981, 1,
-0.4588818, 0.5022285, 1.380235, 0, 1, 0.08235294, 1,
-0.4537868, 0.2030441, -1.817815, 0, 1, 0.08627451, 1,
-0.4532906, 0.3446755, -0.9077927, 0, 1, 0.09411765, 1,
-0.4513745, 0.3867291, 0.09866862, 0, 1, 0.1019608, 1,
-0.4488634, 0.9111144, -0.6539194, 0, 1, 0.1058824, 1,
-0.4480587, -0.3169301, -2.913303, 0, 1, 0.1137255, 1,
-0.4429898, -0.1444764, -2.764446, 0, 1, 0.1176471, 1,
-0.4420243, -1.224243, -3.792261, 0, 1, 0.1254902, 1,
-0.4411342, 0.379845, -1.050464, 0, 1, 0.1294118, 1,
-0.4382586, -1.191104, -3.15553, 0, 1, 0.1372549, 1,
-0.4309864, -0.6677337, -3.109008, 0, 1, 0.1411765, 1,
-0.4281716, 0.837562, -0.8779439, 0, 1, 0.1490196, 1,
-0.4276164, -1.625913, -2.842579, 0, 1, 0.1529412, 1,
-0.4259034, 1.308922, 0.06313153, 0, 1, 0.1607843, 1,
-0.4144144, -1.12655, -3.949468, 0, 1, 0.1647059, 1,
-0.4138977, -1.246033, -2.028796, 0, 1, 0.172549, 1,
-0.4128133, -1.566702, -3.029576, 0, 1, 0.1764706, 1,
-0.4125223, -0.06216644, -0.6550949, 0, 1, 0.1843137, 1,
-0.4123344, 0.06938688, -0.3730003, 0, 1, 0.1882353, 1,
-0.3949647, 1.616543, -0.8050346, 0, 1, 0.1960784, 1,
-0.3905273, -0.04086392, -0.9763755, 0, 1, 0.2039216, 1,
-0.3895268, -1.558297, -3.66807, 0, 1, 0.2078431, 1,
-0.3868954, 0.7761716, 0.2308971, 0, 1, 0.2156863, 1,
-0.3850352, 0.6679318, 0.8078378, 0, 1, 0.2196078, 1,
-0.3847147, -0.5341932, -1.767405, 0, 1, 0.227451, 1,
-0.3824815, -0.1301708, -2.738177, 0, 1, 0.2313726, 1,
-0.380438, -0.3629786, -0.9199257, 0, 1, 0.2392157, 1,
-0.377362, -0.6568629, -4.191491, 0, 1, 0.2431373, 1,
-0.3765654, 1.182647, -0.3924051, 0, 1, 0.2509804, 1,
-0.363001, -0.4918262, -3.226453, 0, 1, 0.254902, 1,
-0.3620335, 0.01096154, 0.1235125, 0, 1, 0.2627451, 1,
-0.3612535, -2.088919, -3.168745, 0, 1, 0.2666667, 1,
-0.3609217, 0.05625604, -2.335107, 0, 1, 0.2745098, 1,
-0.3602987, 1.204457, -1.850262, 0, 1, 0.2784314, 1,
-0.3595484, -1.205217, -3.16206, 0, 1, 0.2862745, 1,
-0.3588779, 0.7336891, -0.8878881, 0, 1, 0.2901961, 1,
-0.3563721, -0.5442165, -0.727942, 0, 1, 0.2980392, 1,
-0.3562238, 0.2335934, -1.96597, 0, 1, 0.3058824, 1,
-0.3521504, -0.4678623, -1.112681, 0, 1, 0.3098039, 1,
-0.3487442, -0.1285581, -1.609513, 0, 1, 0.3176471, 1,
-0.3462152, -0.8793418, -2.797912, 0, 1, 0.3215686, 1,
-0.3442391, -0.648896, -3.386837, 0, 1, 0.3294118, 1,
-0.3420611, -0.02438299, -1.328934, 0, 1, 0.3333333, 1,
-0.3419659, 1.30175, 0.2348515, 0, 1, 0.3411765, 1,
-0.3411153, 0.5304684, 2.234552, 0, 1, 0.345098, 1,
-0.3402649, 0.2993609, 0.3333417, 0, 1, 0.3529412, 1,
-0.3353797, -0.3993213, -1.961404, 0, 1, 0.3568628, 1,
-0.3286358, -0.9349887, -2.601437, 0, 1, 0.3647059, 1,
-0.327116, -1.687162, -3.218555, 0, 1, 0.3686275, 1,
-0.3228654, 1.859114, -1.298882, 0, 1, 0.3764706, 1,
-0.3160433, -0.8859085, -2.545174, 0, 1, 0.3803922, 1,
-0.3073291, -0.176626, -4.456121, 0, 1, 0.3882353, 1,
-0.306845, -0.6218383, -1.968406, 0, 1, 0.3921569, 1,
-0.3026479, 0.06979454, -2.163316, 0, 1, 0.4, 1,
-0.2961293, 2.215639, -1.085495, 0, 1, 0.4078431, 1,
-0.2948403, 2.282631, 1.272282, 0, 1, 0.4117647, 1,
-0.2940795, 0.3235117, -0.8237028, 0, 1, 0.4196078, 1,
-0.2903256, -0.7186586, -2.898533, 0, 1, 0.4235294, 1,
-0.2836761, -2.571761, -2.543682, 0, 1, 0.4313726, 1,
-0.2773523, 1.109886, -0.03437812, 0, 1, 0.4352941, 1,
-0.2722451, -0.3920773, -2.596633, 0, 1, 0.4431373, 1,
-0.2673673, 2.293657, -1.165035, 0, 1, 0.4470588, 1,
-0.2661424, 0.009303862, -1.884516, 0, 1, 0.454902, 1,
-0.2658052, -2.645582, -3.936137, 0, 1, 0.4588235, 1,
-0.2633393, -0.8641292, -3.101448, 0, 1, 0.4666667, 1,
-0.2547785, 0.4139305, 0.01545686, 0, 1, 0.4705882, 1,
-0.2543638, -0.383207, -3.859688, 0, 1, 0.4784314, 1,
-0.2463026, -0.0146081, -0.5205225, 0, 1, 0.4823529, 1,
-0.2446278, -1.770163, -3.117797, 0, 1, 0.4901961, 1,
-0.2417875, 0.5866571, -1.504282, 0, 1, 0.4941176, 1,
-0.2393452, 1.219027, 0.3898198, 0, 1, 0.5019608, 1,
-0.2380422, 0.5362584, -1.794219, 0, 1, 0.509804, 1,
-0.2327557, -1.129535, -1.783178, 0, 1, 0.5137255, 1,
-0.2298904, -0.4052751, -2.326941, 0, 1, 0.5215687, 1,
-0.22967, 1.186054, 0.4644892, 0, 1, 0.5254902, 1,
-0.2259383, -0.6585265, -2.142242, 0, 1, 0.5333334, 1,
-0.2235672, 0.2432057, -1.934448, 0, 1, 0.5372549, 1,
-0.2182922, 0.3543873, -1.185523, 0, 1, 0.5450981, 1,
-0.2155286, 0.9214412, -0.6801149, 0, 1, 0.5490196, 1,
-0.2115435, -0.6644416, -2.44394, 0, 1, 0.5568628, 1,
-0.2073876, 0.5512202, -1.988794, 0, 1, 0.5607843, 1,
-0.1983269, 0.03336842, 0.5466002, 0, 1, 0.5686275, 1,
-0.1914183, 0.7784876, -0.563425, 0, 1, 0.572549, 1,
-0.1906348, 0.1590788, -1.713632, 0, 1, 0.5803922, 1,
-0.1903833, -1.262988, -2.78858, 0, 1, 0.5843138, 1,
-0.1883911, -0.6039759, -3.197551, 0, 1, 0.5921569, 1,
-0.179318, -0.9660696, -1.330654, 0, 1, 0.5960785, 1,
-0.1789537, -1.80184, -1.696167, 0, 1, 0.6039216, 1,
-0.1788907, -1.094841, -3.042087, 0, 1, 0.6117647, 1,
-0.1707907, -0.9979088, -1.486452, 0, 1, 0.6156863, 1,
-0.1655531, -1.057471, -2.930516, 0, 1, 0.6235294, 1,
-0.1571089, -0.7931299, -3.185517, 0, 1, 0.627451, 1,
-0.1569284, -1.277719, -2.57553, 0, 1, 0.6352941, 1,
-0.1524377, -1.328457, -3.446528, 0, 1, 0.6392157, 1,
-0.151903, -0.758161, -3.740342, 0, 1, 0.6470588, 1,
-0.1482729, 1.707776, 1.017161, 0, 1, 0.6509804, 1,
-0.1479269, -1.530198, -3.622856, 0, 1, 0.6588235, 1,
-0.1467281, -0.649251, -4.450402, 0, 1, 0.6627451, 1,
-0.1436297, -1.02321, -0.8996102, 0, 1, 0.6705883, 1,
-0.1416406, 0.6235164, -0.09393653, 0, 1, 0.6745098, 1,
-0.1387699, 0.2797869, 0.2716346, 0, 1, 0.682353, 1,
-0.1383424, 0.3245926, -0.53144, 0, 1, 0.6862745, 1,
-0.1356864, -0.2633319, -3.816496, 0, 1, 0.6941177, 1,
-0.1345691, -1.392382, -2.955705, 0, 1, 0.7019608, 1,
-0.1326008, 0.05270793, -1.028088, 0, 1, 0.7058824, 1,
-0.1268694, 0.7257435, -1.398715, 0, 1, 0.7137255, 1,
-0.1231358, -2.833087, -1.785041, 0, 1, 0.7176471, 1,
-0.1225508, -1.55567, -3.190312, 0, 1, 0.7254902, 1,
-0.1206574, 0.1736419, -1.04798, 0, 1, 0.7294118, 1,
-0.1201062, 2.188388, 1.409096, 0, 1, 0.7372549, 1,
-0.1195155, 0.3011048, 0.9642883, 0, 1, 0.7411765, 1,
-0.1192743, 0.9677351, -2.270302, 0, 1, 0.7490196, 1,
-0.1185565, 0.09026249, -0.2499997, 0, 1, 0.7529412, 1,
-0.1175375, 0.3368293, -0.6945029, 0, 1, 0.7607843, 1,
-0.1156612, -0.9511583, -3.075561, 0, 1, 0.7647059, 1,
-0.1143763, 0.6365418, -0.6242497, 0, 1, 0.772549, 1,
-0.111378, 0.1031595, 1.577876, 0, 1, 0.7764706, 1,
-0.1097802, 0.2881835, -1.22847, 0, 1, 0.7843137, 1,
-0.1088842, -1.052023, -3.219399, 0, 1, 0.7882353, 1,
-0.1081398, -0.4147173, -4.303187, 0, 1, 0.7960784, 1,
-0.1077467, 1.502937, 0.9899174, 0, 1, 0.8039216, 1,
-0.1042209, -0.05131036, -2.777678, 0, 1, 0.8078431, 1,
-0.1028681, -1.098174, -0.8455148, 0, 1, 0.8156863, 1,
-0.1019414, -1.445847, -2.733485, 0, 1, 0.8196079, 1,
-0.1010595, 0.1828646, -1.657905, 0, 1, 0.827451, 1,
-0.08950042, 0.6717137, 0.1741055, 0, 1, 0.8313726, 1,
-0.08920728, 0.5892118, -0.1933939, 0, 1, 0.8392157, 1,
-0.08822589, 0.9765735, -0.4294559, 0, 1, 0.8431373, 1,
-0.08710226, 0.4020937, 0.07947605, 0, 1, 0.8509804, 1,
-0.08256221, 0.136516, -1.069595, 0, 1, 0.854902, 1,
-0.08222637, 0.4005699, -1.477416, 0, 1, 0.8627451, 1,
-0.08158778, 0.3485998, -1.002346, 0, 1, 0.8666667, 1,
-0.07267939, -0.6185207, -3.698281, 0, 1, 0.8745098, 1,
-0.07126956, 0.1944483, -0.1606378, 0, 1, 0.8784314, 1,
-0.06910694, -1.21862, -2.584873, 0, 1, 0.8862745, 1,
-0.06897743, -0.2164246, -1.870437, 0, 1, 0.8901961, 1,
-0.06893025, 0.1092818, -2.12155, 0, 1, 0.8980392, 1,
-0.0659588, 0.7806053, 0.9864433, 0, 1, 0.9058824, 1,
-0.06514107, 0.6829708, -0.6133112, 0, 1, 0.9098039, 1,
-0.06401858, 1.752975, 1.25376, 0, 1, 0.9176471, 1,
-0.05963496, 0.3416083, -0.6909593, 0, 1, 0.9215686, 1,
-0.05679101, 0.9132529, -1.693686, 0, 1, 0.9294118, 1,
-0.05675947, -0.5268128, -4.656372, 0, 1, 0.9333333, 1,
-0.05671464, 0.4334192, -1.016028, 0, 1, 0.9411765, 1,
-0.05471951, -0.8767601, -3.698737, 0, 1, 0.945098, 1,
-0.05378172, -0.9075385, -2.920125, 0, 1, 0.9529412, 1,
-0.05207861, -0.6357141, -2.471197, 0, 1, 0.9568627, 1,
-0.0509514, 0.532007, 1.233652, 0, 1, 0.9647059, 1,
-0.04919821, -0.3838893, -2.768388, 0, 1, 0.9686275, 1,
-0.0488811, -1.392364, -5.34976, 0, 1, 0.9764706, 1,
-0.04130158, -1.284988, -2.948638, 0, 1, 0.9803922, 1,
-0.03734087, -0.4431707, -3.983729, 0, 1, 0.9882353, 1,
-0.03428967, -0.4468228, -3.338274, 0, 1, 0.9921569, 1,
-0.02950003, 0.3528278, 1.219768, 0, 1, 1, 1,
-0.02748167, 0.1857632, -0.4268861, 0, 0.9921569, 1, 1,
-0.02526331, 0.8819326, -0.4825983, 0, 0.9882353, 1, 1,
-0.006828759, 0.5330586, 0.90749, 0, 0.9803922, 1, 1,
-0.005558029, 1.416294, -0.1649821, 0, 0.9764706, 1, 1,
-0.003128354, 1.293944, -0.2061412, 0, 0.9686275, 1, 1,
-0.00282207, 1.053642, -0.02057888, 0, 0.9647059, 1, 1,
-0.002288544, 1.535533, -0.3931289, 0, 0.9568627, 1, 1,
-0.001940549, -2.614124, -2.632501, 0, 0.9529412, 1, 1,
0.007425072, 2.182108, 0.5713052, 0, 0.945098, 1, 1,
0.008372331, 0.7943689, 0.3741486, 0, 0.9411765, 1, 1,
0.008616781, 0.03297148, -0.5069136, 0, 0.9333333, 1, 1,
0.01403251, 0.1599495, 0.2776562, 0, 0.9294118, 1, 1,
0.01450252, -0.519726, 1.809425, 0, 0.9215686, 1, 1,
0.01632093, 0.4457535, -0.7650034, 0, 0.9176471, 1, 1,
0.01650912, 0.6716152, 1.020915, 0, 0.9098039, 1, 1,
0.0187715, -0.3757309, 4.150522, 0, 0.9058824, 1, 1,
0.02337675, 0.990198, 1.202986, 0, 0.8980392, 1, 1,
0.02626667, -0.3446532, 3.025518, 0, 0.8901961, 1, 1,
0.03225082, -0.3331794, 4.628332, 0, 0.8862745, 1, 1,
0.03398469, 0.1109467, 1.854494, 0, 0.8784314, 1, 1,
0.03407083, -0.2617859, 1.695643, 0, 0.8745098, 1, 1,
0.03656906, -0.1354906, 2.046844, 0, 0.8666667, 1, 1,
0.04135778, 0.9526227, -1.281427, 0, 0.8627451, 1, 1,
0.04294395, 0.5198888, 0.4928165, 0, 0.854902, 1, 1,
0.04322213, 0.6550035, -0.6205949, 0, 0.8509804, 1, 1,
0.04352799, -0.05829458, 4.355587, 0, 0.8431373, 1, 1,
0.04557894, 0.9197236, 0.1758103, 0, 0.8392157, 1, 1,
0.04981001, 0.233883, 0.6020139, 0, 0.8313726, 1, 1,
0.05683012, 0.2301754, -1.322133, 0, 0.827451, 1, 1,
0.0572645, 1.366612, -0.9177098, 0, 0.8196079, 1, 1,
0.05861118, 0.2948339, 0.8252159, 0, 0.8156863, 1, 1,
0.05909074, 0.3632746, 0.5721753, 0, 0.8078431, 1, 1,
0.06476463, -1.562732, 2.238087, 0, 0.8039216, 1, 1,
0.06709519, 1.030945, -0.5319584, 0, 0.7960784, 1, 1,
0.07083139, -0.7841685, 3.815326, 0, 0.7882353, 1, 1,
0.07088236, 1.258915, -1.879317, 0, 0.7843137, 1, 1,
0.07372083, 0.7948177, 0.9272296, 0, 0.7764706, 1, 1,
0.08077805, -0.5504299, 3.158578, 0, 0.772549, 1, 1,
0.08135084, -0.5273048, 4.072583, 0, 0.7647059, 1, 1,
0.08213005, 1.101951, 1.029521, 0, 0.7607843, 1, 1,
0.08547869, -0.2731649, 2.54315, 0, 0.7529412, 1, 1,
0.08624794, -0.125411, 2.324266, 0, 0.7490196, 1, 1,
0.0930135, 0.1947375, 0.5391093, 0, 0.7411765, 1, 1,
0.09341692, 0.910333, 1.90732, 0, 0.7372549, 1, 1,
0.09899878, 0.7969932, 0.2139807, 0, 0.7294118, 1, 1,
0.1015737, -0.6860273, 3.97566, 0, 0.7254902, 1, 1,
0.103872, -0.3965821, 2.152286, 0, 0.7176471, 1, 1,
0.1073468, -0.0321126, 1.631685, 0, 0.7137255, 1, 1,
0.108211, -0.5928764, 1.932091, 0, 0.7058824, 1, 1,
0.1141769, 0.3422397, 0.3536522, 0, 0.6980392, 1, 1,
0.1154174, 0.1765907, 0.7326733, 0, 0.6941177, 1, 1,
0.1187427, -0.6724665, 3.988463, 0, 0.6862745, 1, 1,
0.1247635, -1.087814, 3.109389, 0, 0.682353, 1, 1,
0.1280922, -1.230731, 3.231465, 0, 0.6745098, 1, 1,
0.1295601, 2.475624, -1.026639, 0, 0.6705883, 1, 1,
0.1300861, 1.3069, 0.09445821, 0, 0.6627451, 1, 1,
0.1337896, 0.4223976, -0.02316151, 0, 0.6588235, 1, 1,
0.1375084, 0.8161231, -1.978552, 0, 0.6509804, 1, 1,
0.1386027, -0.04725906, 1.328934, 0, 0.6470588, 1, 1,
0.1581222, 0.6765216, 1.754996, 0, 0.6392157, 1, 1,
0.1640147, -0.05463931, 1.979797, 0, 0.6352941, 1, 1,
0.1644577, 0.3342679, -0.1283289, 0, 0.627451, 1, 1,
0.1693882, -0.1694124, 4.206568, 0, 0.6235294, 1, 1,
0.1729576, 0.4636083, 0.2072122, 0, 0.6156863, 1, 1,
0.1752421, -1.252582, 3.743462, 0, 0.6117647, 1, 1,
0.1757188, -0.1490763, 1.83645, 0, 0.6039216, 1, 1,
0.179043, 0.2446777, 1.26659, 0, 0.5960785, 1, 1,
0.1801509, -0.7755299, 3.905697, 0, 0.5921569, 1, 1,
0.1803911, 0.6348736, 1.735739, 0, 0.5843138, 1, 1,
0.183318, 0.05272913, 0.5418359, 0, 0.5803922, 1, 1,
0.1960512, 0.06742185, 2.412777, 0, 0.572549, 1, 1,
0.1966109, 0.07093844, -0.7166119, 0, 0.5686275, 1, 1,
0.1997603, -0.7997074, 3.680564, 0, 0.5607843, 1, 1,
0.1999437, 0.5914996, 0.004195213, 0, 0.5568628, 1, 1,
0.200563, 0.1062256, 1.691392, 0, 0.5490196, 1, 1,
0.2011547, -0.01280422, 1.859704, 0, 0.5450981, 1, 1,
0.2018923, 0.5114316, 1.585331, 0, 0.5372549, 1, 1,
0.2084285, 0.05386617, 0.6650431, 0, 0.5333334, 1, 1,
0.2096917, -0.1177995, 2.521564, 0, 0.5254902, 1, 1,
0.2132873, 1.889914, 0.8226426, 0, 0.5215687, 1, 1,
0.2137165, -0.2064438, 0.4729371, 0, 0.5137255, 1, 1,
0.2199434, 1.440343, 0.8653678, 0, 0.509804, 1, 1,
0.2222573, 0.7715508, 0.1074238, 0, 0.5019608, 1, 1,
0.2247572, -0.06957929, 2.250728, 0, 0.4941176, 1, 1,
0.2301301, 1.355862, -0.717463, 0, 0.4901961, 1, 1,
0.230506, -1.107125, 3.051156, 0, 0.4823529, 1, 1,
0.2309143, -0.3819211, 2.250315, 0, 0.4784314, 1, 1,
0.2332265, 0.6789169, -1.750319, 0, 0.4705882, 1, 1,
0.2332428, 0.8139369, 0.09008516, 0, 0.4666667, 1, 1,
0.2484959, -0.5017618, 0.9558093, 0, 0.4588235, 1, 1,
0.2525126, 0.3771853, 1.887478, 0, 0.454902, 1, 1,
0.2547773, -0.7653821, 2.885313, 0, 0.4470588, 1, 1,
0.2552133, -0.3386448, 2.546658, 0, 0.4431373, 1, 1,
0.2567038, 0.5026082, 0.3907545, 0, 0.4352941, 1, 1,
0.2601552, 0.3318367, 0.1056785, 0, 0.4313726, 1, 1,
0.2663909, -0.6221398, 1.360556, 0, 0.4235294, 1, 1,
0.2690135, -0.8764927, 2.523987, 0, 0.4196078, 1, 1,
0.2693798, -0.1716831, 3.406701, 0, 0.4117647, 1, 1,
0.2709067, 1.242165, 0.2733071, 0, 0.4078431, 1, 1,
0.2747598, -1.019335, 5.583975, 0, 0.4, 1, 1,
0.2804466, -0.01055938, 2.176651, 0, 0.3921569, 1, 1,
0.2810601, 1.618166, -0.566009, 0, 0.3882353, 1, 1,
0.2863054, -0.6152003, 4.805604, 0, 0.3803922, 1, 1,
0.2893739, -1.379281, 2.146646, 0, 0.3764706, 1, 1,
0.2942615, 0.1645191, 0.449138, 0, 0.3686275, 1, 1,
0.2999737, -0.9085063, 1.326898, 0, 0.3647059, 1, 1,
0.3039564, -0.340529, 4.201502, 0, 0.3568628, 1, 1,
0.3064373, -2.005301, 3.173, 0, 0.3529412, 1, 1,
0.3115555, 2.408159, 0.1300666, 0, 0.345098, 1, 1,
0.3148492, 0.8387792, -0.1385156, 0, 0.3411765, 1, 1,
0.3154901, 1.689359, 1.972497, 0, 0.3333333, 1, 1,
0.3183627, -0.5773021, 1.908677, 0, 0.3294118, 1, 1,
0.3218103, 0.535351, 0.06262019, 0, 0.3215686, 1, 1,
0.3234107, -1.237183, 4.723512, 0, 0.3176471, 1, 1,
0.3320348, -2.81697, 1.795178, 0, 0.3098039, 1, 1,
0.3325106, -0.1159859, -0.4063512, 0, 0.3058824, 1, 1,
0.3336167, -0.4666278, 4.69688, 0, 0.2980392, 1, 1,
0.3370522, -0.539046, 2.766475, 0, 0.2901961, 1, 1,
0.3397393, -2.373704, 2.728989, 0, 0.2862745, 1, 1,
0.3411731, -0.8178256, 2.39508, 0, 0.2784314, 1, 1,
0.3425508, 0.06545638, 2.47217, 0, 0.2745098, 1, 1,
0.3467831, 0.9338984, -0.1840841, 0, 0.2666667, 1, 1,
0.3476833, -0.8508849, 2.275291, 0, 0.2627451, 1, 1,
0.350309, 2.926549, -0.3928337, 0, 0.254902, 1, 1,
0.3526687, 0.149248, 2.445326, 0, 0.2509804, 1, 1,
0.3540745, -0.6369971, 2.024438, 0, 0.2431373, 1, 1,
0.356584, 0.8793595, 0.7344315, 0, 0.2392157, 1, 1,
0.358815, -1.237168, 1.014399, 0, 0.2313726, 1, 1,
0.3606409, 1.323167, 0.2653265, 0, 0.227451, 1, 1,
0.3607195, -1.636189, 2.653223, 0, 0.2196078, 1, 1,
0.3669062, 2.022867, -0.7427971, 0, 0.2156863, 1, 1,
0.3680768, -0.5217683, 4.366771, 0, 0.2078431, 1, 1,
0.3681739, 1.313595, 1.983059, 0, 0.2039216, 1, 1,
0.3711607, -1.588013, 2.563181, 0, 0.1960784, 1, 1,
0.3732671, 0.3586603, -0.6838977, 0, 0.1882353, 1, 1,
0.3751211, 0.8670295, 0.8421402, 0, 0.1843137, 1, 1,
0.3761252, -0.3588704, 0.2901255, 0, 0.1764706, 1, 1,
0.3778839, 0.742943, 0.04145363, 0, 0.172549, 1, 1,
0.3811108, -0.4996349, 2.078425, 0, 0.1647059, 1, 1,
0.3830094, 0.5089781, -0.0422653, 0, 0.1607843, 1, 1,
0.3837182, -0.865749, 2.490633, 0, 0.1529412, 1, 1,
0.3837734, 0.7281096, 0.5667342, 0, 0.1490196, 1, 1,
0.3886477, 0.08027753, 2.0418, 0, 0.1411765, 1, 1,
0.3980034, -0.694603, 2.431055, 0, 0.1372549, 1, 1,
0.4029743, -0.7758216, 3.062126, 0, 0.1294118, 1, 1,
0.4062226, -0.6318422, 2.485153, 0, 0.1254902, 1, 1,
0.407001, 0.6102586, 0.6737971, 0, 0.1176471, 1, 1,
0.4131002, 0.4033484, 1.054671, 0, 0.1137255, 1, 1,
0.4145109, -0.4200148, 3.114794, 0, 0.1058824, 1, 1,
0.4166411, 1.053931, -1.716916, 0, 0.09803922, 1, 1,
0.4170862, 0.2396526, 1.89793, 0, 0.09411765, 1, 1,
0.4186644, -0.2918102, 2.507645, 0, 0.08627451, 1, 1,
0.423746, -0.687149, 2.716629, 0, 0.08235294, 1, 1,
0.4250806, -0.7485058, 1.681283, 0, 0.07450981, 1, 1,
0.42546, 1.120728, 2.37038, 0, 0.07058824, 1, 1,
0.4265276, 1.605654, -0.5872341, 0, 0.0627451, 1, 1,
0.4297464, -0.5356007, 1.158277, 0, 0.05882353, 1, 1,
0.4305733, -0.02822853, 3.593474, 0, 0.05098039, 1, 1,
0.434595, 1.018873, 2.624626, 0, 0.04705882, 1, 1,
0.4388429, -1.335414, 4.626987, 0, 0.03921569, 1, 1,
0.4399628, -0.3726839, 2.769247, 0, 0.03529412, 1, 1,
0.4402494, 0.894086, -0.4731623, 0, 0.02745098, 1, 1,
0.4408984, -0.2556032, 3.037721, 0, 0.02352941, 1, 1,
0.4499202, 0.2026576, 1.06315, 0, 0.01568628, 1, 1,
0.4516482, 1.265575, -2.30964, 0, 0.01176471, 1, 1,
0.4518648, 1.629642, 0.1797031, 0, 0.003921569, 1, 1,
0.4747328, 0.1344699, 0.6494769, 0.003921569, 0, 1, 1,
0.4754242, 0.2440447, 1.036327, 0.007843138, 0, 1, 1,
0.4792151, 0.3804929, 1.822337, 0.01568628, 0, 1, 1,
0.4827811, -0.8353865, 1.763185, 0.01960784, 0, 1, 1,
0.4830696, 0.1231163, 2.285697, 0.02745098, 0, 1, 1,
0.4832454, -0.7700553, 2.612525, 0.03137255, 0, 1, 1,
0.4835164, -0.4618575, 4.348787, 0.03921569, 0, 1, 1,
0.4838518, -0.4349074, 3.582439, 0.04313726, 0, 1, 1,
0.4931777, -0.06528874, 1.691478, 0.05098039, 0, 1, 1,
0.4933162, 0.9315027, 1.160703, 0.05490196, 0, 1, 1,
0.4955514, -0.4022062, 2.434741, 0.0627451, 0, 1, 1,
0.496525, -0.08781879, 1.500154, 0.06666667, 0, 1, 1,
0.4981032, -0.9605268, 4.625347, 0.07450981, 0, 1, 1,
0.5006247, 0.1975739, 3.081371, 0.07843138, 0, 1, 1,
0.5023298, -1.221903, 3.261188, 0.08627451, 0, 1, 1,
0.5057021, 0.6461892, -1.033107, 0.09019608, 0, 1, 1,
0.5086686, -0.3244753, 2.121733, 0.09803922, 0, 1, 1,
0.5101327, 0.8648657, 1.534794, 0.1058824, 0, 1, 1,
0.5117558, -0.2652912, 2.845374, 0.1098039, 0, 1, 1,
0.5140901, 0.1815684, -0.1847886, 0.1176471, 0, 1, 1,
0.5163626, -0.07199816, 2.112, 0.1215686, 0, 1, 1,
0.5202982, -0.3082592, 0.4689341, 0.1294118, 0, 1, 1,
0.5279205, 0.4137613, 0.964563, 0.1333333, 0, 1, 1,
0.5283793, -0.01875659, 1.456249, 0.1411765, 0, 1, 1,
0.5307417, 1.697172, 1.259474, 0.145098, 0, 1, 1,
0.5314831, 2.953001, 0.9240871, 0.1529412, 0, 1, 1,
0.5329026, -1.201279, 2.171944, 0.1568628, 0, 1, 1,
0.5338351, -0.02582533, 0.9853967, 0.1647059, 0, 1, 1,
0.5340183, -1.07581, 4.201872, 0.1686275, 0, 1, 1,
0.5376487, -1.216958, 1.771081, 0.1764706, 0, 1, 1,
0.5444866, -1.734852, 1.643088, 0.1803922, 0, 1, 1,
0.5446942, 0.2942957, 0.4980639, 0.1882353, 0, 1, 1,
0.5534061, 0.1410698, 0.1004453, 0.1921569, 0, 1, 1,
0.5540001, 1.108406, -0.1445197, 0.2, 0, 1, 1,
0.5591009, 0.2797956, 0.5842813, 0.2078431, 0, 1, 1,
0.5602828, -0.3888773, 1.577969, 0.2117647, 0, 1, 1,
0.5611216, -0.6077299, 2.852249, 0.2196078, 0, 1, 1,
0.561744, -0.3448707, 1.791264, 0.2235294, 0, 1, 1,
0.5640598, 0.1918797, 3.657273, 0.2313726, 0, 1, 1,
0.564419, 0.3739438, 1.693283, 0.2352941, 0, 1, 1,
0.565537, 0.0286119, 0.7363488, 0.2431373, 0, 1, 1,
0.5709527, 2.450952, 0.4201621, 0.2470588, 0, 1, 1,
0.5747075, -0.7199427, 0.8594171, 0.254902, 0, 1, 1,
0.5802727, 0.2853451, 1.867963, 0.2588235, 0, 1, 1,
0.5848557, 0.6539634, 0.4847555, 0.2666667, 0, 1, 1,
0.5850753, -0.47578, 4.503779, 0.2705882, 0, 1, 1,
0.5867149, 0.08296946, 3.865524, 0.2784314, 0, 1, 1,
0.5875633, -0.2119368, 3.028112, 0.282353, 0, 1, 1,
0.5902964, 1.017934, 1.041899, 0.2901961, 0, 1, 1,
0.5968992, 0.2050078, 2.319643, 0.2941177, 0, 1, 1,
0.598401, -1.435466, 2.42379, 0.3019608, 0, 1, 1,
0.6015133, -0.05279566, 1.711286, 0.3098039, 0, 1, 1,
0.602208, -0.04121347, 2.153055, 0.3137255, 0, 1, 1,
0.6025714, -0.6231274, 1.582283, 0.3215686, 0, 1, 1,
0.6049687, -0.597294, 2.526, 0.3254902, 0, 1, 1,
0.619122, -0.7204045, 3.174342, 0.3333333, 0, 1, 1,
0.621675, -1.949779, 1.962087, 0.3372549, 0, 1, 1,
0.6237339, 0.2773389, 0.4632591, 0.345098, 0, 1, 1,
0.6243836, 1.597753, 0.1082379, 0.3490196, 0, 1, 1,
0.6258385, 0.3685711, 1.156637, 0.3568628, 0, 1, 1,
0.6263046, 0.7026142, 0.3878739, 0.3607843, 0, 1, 1,
0.6270208, 0.09773763, 2.209544, 0.3686275, 0, 1, 1,
0.6305838, -0.9110035, 3.773578, 0.372549, 0, 1, 1,
0.6370813, -0.05203927, 1.40374, 0.3803922, 0, 1, 1,
0.6384565, -0.3925919, 1.424326, 0.3843137, 0, 1, 1,
0.6408985, -2.648975, 2.723576, 0.3921569, 0, 1, 1,
0.6437973, 1.017322, -0.1299301, 0.3960784, 0, 1, 1,
0.6555359, 0.9656627, 0.9901115, 0.4039216, 0, 1, 1,
0.6557671, -0.2249915, 2.396087, 0.4117647, 0, 1, 1,
0.6571813, -0.7045803, 1.826168, 0.4156863, 0, 1, 1,
0.6574859, -0.1200898, 3.015345, 0.4235294, 0, 1, 1,
0.6576208, -0.9532942, 1.419881, 0.427451, 0, 1, 1,
0.6577474, -0.4974385, 1.187816, 0.4352941, 0, 1, 1,
0.6609644, 1.58744, 0.135753, 0.4392157, 0, 1, 1,
0.6630237, 0.1427039, 0.9479323, 0.4470588, 0, 1, 1,
0.6634024, 0.6569909, -0.06073653, 0.4509804, 0, 1, 1,
0.6642567, 0.6066324, 0.3988601, 0.4588235, 0, 1, 1,
0.6648883, 0.8725412, 0.8585824, 0.4627451, 0, 1, 1,
0.6669349, 0.8174371, 1.954952, 0.4705882, 0, 1, 1,
0.6746346, 1.3245, 0.778731, 0.4745098, 0, 1, 1,
0.6751407, -1.399651, 3.712857, 0.4823529, 0, 1, 1,
0.6802472, -0.7294853, 4.118594, 0.4862745, 0, 1, 1,
0.6812765, 0.2158864, 0.03666554, 0.4941176, 0, 1, 1,
0.6818272, -1.52849, 0.7544968, 0.5019608, 0, 1, 1,
0.6837744, 1.292668, -1.652507, 0.5058824, 0, 1, 1,
0.6888884, 0.6691492, 0.3347928, 0.5137255, 0, 1, 1,
0.69184, 1.388163, -0.7676907, 0.5176471, 0, 1, 1,
0.6944314, -1.223001, 2.722501, 0.5254902, 0, 1, 1,
0.6971468, -0.5781345, 1.110464, 0.5294118, 0, 1, 1,
0.6978825, 1.571532, 0.6015704, 0.5372549, 0, 1, 1,
0.7032724, -0.2652805, 2.802371, 0.5411765, 0, 1, 1,
0.7044873, -1.957479, 3.182413, 0.5490196, 0, 1, 1,
0.7068592, -0.9264312, 3.499903, 0.5529412, 0, 1, 1,
0.7121682, -1.222973, 2.344891, 0.5607843, 0, 1, 1,
0.7161397, -0.660866, 2.437739, 0.5647059, 0, 1, 1,
0.7185118, -0.541727, 2.950313, 0.572549, 0, 1, 1,
0.7202905, 0.1255188, 1.903944, 0.5764706, 0, 1, 1,
0.7213888, 0.9610272, 0.1210936, 0.5843138, 0, 1, 1,
0.7277794, 1.743688, 0.2797372, 0.5882353, 0, 1, 1,
0.7292243, -0.993688, 2.803919, 0.5960785, 0, 1, 1,
0.730428, 0.1792886, 2.428077, 0.6039216, 0, 1, 1,
0.7308327, -0.03871818, 0.5995576, 0.6078432, 0, 1, 1,
0.7338805, -0.1584261, 2.114665, 0.6156863, 0, 1, 1,
0.7356447, 0.3526662, 0.8705336, 0.6196079, 0, 1, 1,
0.7358741, -2.095927, 2.298899, 0.627451, 0, 1, 1,
0.7379577, 1.718393, 1.102206, 0.6313726, 0, 1, 1,
0.7391942, -0.9682032, 1.221191, 0.6392157, 0, 1, 1,
0.7428555, -0.6848544, 3.584671, 0.6431373, 0, 1, 1,
0.7430855, -1.170004, 3.113105, 0.6509804, 0, 1, 1,
0.7444632, 0.1470302, 1.491303, 0.654902, 0, 1, 1,
0.7500984, -1.591982, 3.980675, 0.6627451, 0, 1, 1,
0.75042, -0.7420405, 1.907895, 0.6666667, 0, 1, 1,
0.7508921, 1.999404, 1.450131, 0.6745098, 0, 1, 1,
0.7515313, -0.876291, 3.646315, 0.6784314, 0, 1, 1,
0.7547346, 0.8885618, 1.109335, 0.6862745, 0, 1, 1,
0.7560145, 0.6057705, 0.8738591, 0.6901961, 0, 1, 1,
0.7569711, -0.3468764, 3.327511, 0.6980392, 0, 1, 1,
0.7612937, -1.142555, 2.514317, 0.7058824, 0, 1, 1,
0.7620757, 0.9546003, -0.8453436, 0.7098039, 0, 1, 1,
0.7663342, -0.1868577, 2.064517, 0.7176471, 0, 1, 1,
0.7762342, -0.4990658, 1.580581, 0.7215686, 0, 1, 1,
0.777957, 1.179535, 1.365412, 0.7294118, 0, 1, 1,
0.7785655, 0.5645454, 0.2718024, 0.7333333, 0, 1, 1,
0.779312, -0.4722271, 2.452684, 0.7411765, 0, 1, 1,
0.7862883, 0.1604462, 0.3245312, 0.7450981, 0, 1, 1,
0.7917175, 0.01290541, 0.8034429, 0.7529412, 0, 1, 1,
0.800631, 1.504166, 1.067429, 0.7568628, 0, 1, 1,
0.8023351, -0.4353036, 1.504901, 0.7647059, 0, 1, 1,
0.807158, 0.8842027, 0.8748456, 0.7686275, 0, 1, 1,
0.810241, 0.4215891, 0.5998966, 0.7764706, 0, 1, 1,
0.8117931, 1.270735, 0.6782684, 0.7803922, 0, 1, 1,
0.8134013, -0.2568243, 2.575368, 0.7882353, 0, 1, 1,
0.816747, 1.647939, 0.8467456, 0.7921569, 0, 1, 1,
0.8168169, -0.3983484, 1.194781, 0.8, 0, 1, 1,
0.8227007, -0.5988505, 1.93908, 0.8078431, 0, 1, 1,
0.8270369, -1.385349, 1.557339, 0.8117647, 0, 1, 1,
0.8289729, -0.08287932, 0.8111479, 0.8196079, 0, 1, 1,
0.8334675, -0.9087853, 2.401683, 0.8235294, 0, 1, 1,
0.8371704, 0.2932098, 2.042004, 0.8313726, 0, 1, 1,
0.8375719, -0.6840399, 2.624444, 0.8352941, 0, 1, 1,
0.839522, -0.09203421, 3.792031, 0.8431373, 0, 1, 1,
0.8435506, 1.822758, 0.1475812, 0.8470588, 0, 1, 1,
0.8471956, 1.371548, -0.2070201, 0.854902, 0, 1, 1,
0.8475088, 0.608588, 1.037073, 0.8588235, 0, 1, 1,
0.8502081, 2.075647, 1.306364, 0.8666667, 0, 1, 1,
0.8513077, -0.4117742, 1.515525, 0.8705882, 0, 1, 1,
0.8532852, -1.896425, 4.381704, 0.8784314, 0, 1, 1,
0.8536906, -1.450749, 3.869009, 0.8823529, 0, 1, 1,
0.857721, 0.8884248, 1.839238, 0.8901961, 0, 1, 1,
0.861391, -0.2640561, 1.642842, 0.8941177, 0, 1, 1,
0.864193, 0.7371928, 0.4291731, 0.9019608, 0, 1, 1,
0.8706807, 0.5299549, 2.935323, 0.9098039, 0, 1, 1,
0.8716589, 0.2092351, 1.62876, 0.9137255, 0, 1, 1,
0.8749787, 0.5346662, 1.671921, 0.9215686, 0, 1, 1,
0.878601, -0.6491578, 3.175314, 0.9254902, 0, 1, 1,
0.8786648, 0.5982952, 0.6916053, 0.9333333, 0, 1, 1,
0.8843191, -1.390163, 3.547043, 0.9372549, 0, 1, 1,
0.8852232, 0.8127103, -0.3373959, 0.945098, 0, 1, 1,
0.8919483, -0.5729536, 2.002592, 0.9490196, 0, 1, 1,
0.8921767, 1.276972, 2.337806, 0.9568627, 0, 1, 1,
0.8922201, -0.04824525, 3.342659, 0.9607843, 0, 1, 1,
0.8935527, -0.5193235, 3.484799, 0.9686275, 0, 1, 1,
0.8977963, 0.5923595, -0.9094414, 0.972549, 0, 1, 1,
0.908533, -1.829858, 2.343341, 0.9803922, 0, 1, 1,
0.9246861, -0.3945287, 0.6838807, 0.9843137, 0, 1, 1,
0.9293365, -0.2522049, 2.724546, 0.9921569, 0, 1, 1,
0.9380142, -0.4751656, 1.688257, 0.9960784, 0, 1, 1,
0.9451067, 1.100658, 2.253276, 1, 0, 0.9960784, 1,
0.9468396, -0.6589329, 0.9598696, 1, 0, 0.9882353, 1,
0.9480129, 0.3531222, -0.5672603, 1, 0, 0.9843137, 1,
0.949858, -0.5037436, 1.090089, 1, 0, 0.9764706, 1,
0.9522386, -0.5048593, 2.417758, 1, 0, 0.972549, 1,
0.9663563, -0.6583322, 3.351634, 1, 0, 0.9647059, 1,
0.976023, -1.57772, 2.833243, 1, 0, 0.9607843, 1,
0.995935, 0.5379743, 1.120211, 1, 0, 0.9529412, 1,
1.006295, 0.1797442, 0.7732075, 1, 0, 0.9490196, 1,
1.008238, 0.09161849, 2.478514, 1, 0, 0.9411765, 1,
1.009662, 0.1545722, 0.2404163, 1, 0, 0.9372549, 1,
1.012182, -0.02722112, 2.967161, 1, 0, 0.9294118, 1,
1.018744, 1.032466, -0.9234875, 1, 0, 0.9254902, 1,
1.019835, 0.4839376, 1.57899, 1, 0, 0.9176471, 1,
1.019855, -1.087596, 1.563078, 1, 0, 0.9137255, 1,
1.025734, 0.54088, 1.051346, 1, 0, 0.9058824, 1,
1.02844, -0.6950035, 1.923816, 1, 0, 0.9019608, 1,
1.029177, 1.438283, -0.3658997, 1, 0, 0.8941177, 1,
1.03229, -0.9928134, 3.899846, 1, 0, 0.8862745, 1,
1.035619, 0.8787382, 0.3727244, 1, 0, 0.8823529, 1,
1.036127, 3.148869, 0.1427369, 1, 0, 0.8745098, 1,
1.037342, 0.1973203, 0.8059171, 1, 0, 0.8705882, 1,
1.054115, 0.4391891, 0.9955537, 1, 0, 0.8627451, 1,
1.061204, 0.2203236, 1.682773, 1, 0, 0.8588235, 1,
1.064006, -1.804968, 3.40918, 1, 0, 0.8509804, 1,
1.065762, 0.02182527, 1.67621, 1, 0, 0.8470588, 1,
1.074714, -1.17408, 2.935253, 1, 0, 0.8392157, 1,
1.079477, -0.3946519, 1.028597, 1, 0, 0.8352941, 1,
1.09197, -0.1013254, 3.024748, 1, 0, 0.827451, 1,
1.096046, 2.678479, 0.4346983, 1, 0, 0.8235294, 1,
1.098843, -1.45312, 3.656733, 1, 0, 0.8156863, 1,
1.101081, -0.9148794, 3.912542, 1, 0, 0.8117647, 1,
1.105301, -0.4111468, 1.424657, 1, 0, 0.8039216, 1,
1.110291, 1.064474, 1.362074, 1, 0, 0.7960784, 1,
1.113206, -0.1871476, 2.198051, 1, 0, 0.7921569, 1,
1.116438, -0.2002802, 0.2893154, 1, 0, 0.7843137, 1,
1.124834, -1.909516, 4.182868, 1, 0, 0.7803922, 1,
1.125573, 0.7908053, 0.08648907, 1, 0, 0.772549, 1,
1.132836, 0.8349534, 0.5959028, 1, 0, 0.7686275, 1,
1.136125, -1.660666, 1.98099, 1, 0, 0.7607843, 1,
1.139144, 0.6695678, 1.314022, 1, 0, 0.7568628, 1,
1.143142, 2.813806, -0.3519854, 1, 0, 0.7490196, 1,
1.150286, 0.3308343, 0.7094805, 1, 0, 0.7450981, 1,
1.154476, 0.2463511, 3.607371, 1, 0, 0.7372549, 1,
1.177571, -0.5685335, 1.534398, 1, 0, 0.7333333, 1,
1.185494, 0.1805177, 2.22746, 1, 0, 0.7254902, 1,
1.185897, -1.323649, 2.536997, 1, 0, 0.7215686, 1,
1.18738, -1.313681, 4.087025, 1, 0, 0.7137255, 1,
1.199732, 0.2188375, 0.02812818, 1, 0, 0.7098039, 1,
1.200688, 1.683853, 0.4212087, 1, 0, 0.7019608, 1,
1.203931, 1.088356, 0.6830486, 1, 0, 0.6941177, 1,
1.211116, 1.547767, 1.059714, 1, 0, 0.6901961, 1,
1.213449, 1.716699, 0.08539277, 1, 0, 0.682353, 1,
1.224477, -1.063399, 2.142985, 1, 0, 0.6784314, 1,
1.230633, 1.669091, -0.9820032, 1, 0, 0.6705883, 1,
1.232381, -0.7342226, 0.8860914, 1, 0, 0.6666667, 1,
1.236305, 0.7379832, 1.158952, 1, 0, 0.6588235, 1,
1.243005, 1.404978, 0.7370911, 1, 0, 0.654902, 1,
1.247604, -1.149481, 1.386551, 1, 0, 0.6470588, 1,
1.248654, 0.9715438, 0.9912816, 1, 0, 0.6431373, 1,
1.249679, -0.1840222, -0.5928763, 1, 0, 0.6352941, 1,
1.255409, -0.2683343, 1.874858, 1, 0, 0.6313726, 1,
1.264681, -1.331077, 1.68933, 1, 0, 0.6235294, 1,
1.268798, 1.297948, 0.4212759, 1, 0, 0.6196079, 1,
1.27108, -0.1525435, 2.855288, 1, 0, 0.6117647, 1,
1.275845, 0.5244775, 1.226927, 1, 0, 0.6078432, 1,
1.28274, 0.08901401, 2.417489, 1, 0, 0.6, 1,
1.287262, 2.75198, 0.8159077, 1, 0, 0.5921569, 1,
1.289319, 1.675936, -0.7134086, 1, 0, 0.5882353, 1,
1.289553, -0.6623774, 2.228153, 1, 0, 0.5803922, 1,
1.290365, -0.4032041, 1.910997, 1, 0, 0.5764706, 1,
1.297071, 0.8092686, 1.963628, 1, 0, 0.5686275, 1,
1.304919, -0.175349, 0.7551626, 1, 0, 0.5647059, 1,
1.306167, -0.1241911, -0.3275683, 1, 0, 0.5568628, 1,
1.316603, 1.105104, 0.1135008, 1, 0, 0.5529412, 1,
1.335073, -1.245001, 2.752607, 1, 0, 0.5450981, 1,
1.345364, -0.3893141, 3.264202, 1, 0, 0.5411765, 1,
1.347585, -2.302257, 1.226741, 1, 0, 0.5333334, 1,
1.356797, -0.5839094, 2.11713, 1, 0, 0.5294118, 1,
1.378655, -1.720515, 2.588965, 1, 0, 0.5215687, 1,
1.379791, 0.6386933, 0.4104451, 1, 0, 0.5176471, 1,
1.383367, -0.7052311, 0.8134913, 1, 0, 0.509804, 1,
1.393471, 0.2093903, 1.967128, 1, 0, 0.5058824, 1,
1.396304, -1.318858, 4.120642, 1, 0, 0.4980392, 1,
1.397536, 0.1627074, 2.287313, 1, 0, 0.4901961, 1,
1.403313, 0.04116001, 2.994426, 1, 0, 0.4862745, 1,
1.408195, -0.816435, 3.511024, 1, 0, 0.4784314, 1,
1.427343, -0.8632153, 2.261037, 1, 0, 0.4745098, 1,
1.428108, -1.136516, 1.514869, 1, 0, 0.4666667, 1,
1.435024, -0.4262746, 2.763812, 1, 0, 0.4627451, 1,
1.43552, -0.6053508, 3.504795, 1, 0, 0.454902, 1,
1.436637, 0.07300017, 1.733794, 1, 0, 0.4509804, 1,
1.439946, -1.952473, 3.103634, 1, 0, 0.4431373, 1,
1.467247, -0.9887233, 3.059863, 1, 0, 0.4392157, 1,
1.474756, 0.08820537, 1.630334, 1, 0, 0.4313726, 1,
1.480009, -0.2180727, 1.223583, 1, 0, 0.427451, 1,
1.484101, -0.6474221, 0.3201362, 1, 0, 0.4196078, 1,
1.484604, -1.333707, 1.616009, 1, 0, 0.4156863, 1,
1.489314, -0.2512407, 3.608109, 1, 0, 0.4078431, 1,
1.494038, -1.255194, 1.735753, 1, 0, 0.4039216, 1,
1.495152, -0.2291998, 2.612748, 1, 0, 0.3960784, 1,
1.511186, 1.583499, 0.3069089, 1, 0, 0.3882353, 1,
1.538748, 0.1837057, 1.13257, 1, 0, 0.3843137, 1,
1.540518, -0.6931043, 1.190584, 1, 0, 0.3764706, 1,
1.545325, 0.1212623, 1.545287, 1, 0, 0.372549, 1,
1.54805, 0.2817041, 2.545124, 1, 0, 0.3647059, 1,
1.554473, 1.681911, 2.111981, 1, 0, 0.3607843, 1,
1.570019, 1.685534, 2.356434, 1, 0, 0.3529412, 1,
1.581617, -1.533483, 2.182895, 1, 0, 0.3490196, 1,
1.596902, 0.09381394, 1.970408, 1, 0, 0.3411765, 1,
1.614668, -0.3840309, 1.510192, 1, 0, 0.3372549, 1,
1.629133, -1.028638, 3.640988, 1, 0, 0.3294118, 1,
1.647907, -0.9210156, 1.198318, 1, 0, 0.3254902, 1,
1.654158, 0.06229172, 1.587319, 1, 0, 0.3176471, 1,
1.659552, -0.393811, 1.180631, 1, 0, 0.3137255, 1,
1.661313, 0.272717, 1.892447, 1, 0, 0.3058824, 1,
1.670392, -0.9095485, 0.8489708, 1, 0, 0.2980392, 1,
1.671573, -1.079838, 0.8743712, 1, 0, 0.2941177, 1,
1.675939, 1.119617, 1.215688, 1, 0, 0.2862745, 1,
1.678167, -0.3246557, 0.7406641, 1, 0, 0.282353, 1,
1.694645, 0.7477022, 0.4084261, 1, 0, 0.2745098, 1,
1.709495, 0.9668609, 0.4587729, 1, 0, 0.2705882, 1,
1.730472, -0.8523397, 1.994595, 1, 0, 0.2627451, 1,
1.75261, 0.2936754, 0.1788813, 1, 0, 0.2588235, 1,
1.756507, 0.2359064, 2.164225, 1, 0, 0.2509804, 1,
1.761157, 2.209272, 2.152624, 1, 0, 0.2470588, 1,
1.765144, 0.2347961, 1.278088, 1, 0, 0.2392157, 1,
1.769617, -1.136097, 2.825558, 1, 0, 0.2352941, 1,
1.771961, 0.2563851, -0.5392204, 1, 0, 0.227451, 1,
1.789557, -0.6307607, 3.753353, 1, 0, 0.2235294, 1,
1.81526, 0.07239736, 0.3105476, 1, 0, 0.2156863, 1,
1.849042, -1.16768, 2.833857, 1, 0, 0.2117647, 1,
1.850187, 0.8726088, 1.891119, 1, 0, 0.2039216, 1,
1.876976, -0.2574926, 0.7166502, 1, 0, 0.1960784, 1,
1.883204, 0.2668947, 1.821453, 1, 0, 0.1921569, 1,
1.88572, 1.480187, 0.7582025, 1, 0, 0.1843137, 1,
1.897431, 1.219281, 2.671192, 1, 0, 0.1803922, 1,
1.906101, -0.5782123, 2.455682, 1, 0, 0.172549, 1,
1.922292, 0.3786643, 1.535051, 1, 0, 0.1686275, 1,
1.931134, -0.08035561, 0.9084498, 1, 0, 0.1607843, 1,
1.938826, -1.455371, 3.44515, 1, 0, 0.1568628, 1,
1.944319, 0.4835376, 1.345626, 1, 0, 0.1490196, 1,
1.946227, 0.03655136, 1.217926, 1, 0, 0.145098, 1,
1.966629, -1.15109, 1.458795, 1, 0, 0.1372549, 1,
1.977143, -1.372875, 2.089207, 1, 0, 0.1333333, 1,
2.000568, 0.720027, 1.19683, 1, 0, 0.1254902, 1,
2.003122, -1.151456, 2.841383, 1, 0, 0.1215686, 1,
2.003884, -1.499262, 1.815238, 1, 0, 0.1137255, 1,
2.011048, 1.506609, -0.02853899, 1, 0, 0.1098039, 1,
2.027668, 1.549476, 0.09604183, 1, 0, 0.1019608, 1,
2.047102, -0.207552, 2.757448, 1, 0, 0.09411765, 1,
2.076594, -0.8297439, 2.362874, 1, 0, 0.09019608, 1,
2.116039, -1.24387, 2.441583, 1, 0, 0.08235294, 1,
2.141816, -0.1205459, 2.483958, 1, 0, 0.07843138, 1,
2.17615, 0.4591842, 4.694636, 1, 0, 0.07058824, 1,
2.191671, -0.6874734, 1.561092, 1, 0, 0.06666667, 1,
2.283077, -1.400038, 2.13448, 1, 0, 0.05882353, 1,
2.299923, 0.6572302, 1.991266, 1, 0, 0.05490196, 1,
2.317101, -0.2257446, 0.657061, 1, 0, 0.04705882, 1,
2.345356, -0.4501978, 1.058495, 1, 0, 0.04313726, 1,
2.701548, -0.4741849, 1.341942, 1, 0, 0.03529412, 1,
2.770907, 0.7794292, 2.146943, 1, 0, 0.03137255, 1,
2.778212, 2.717352, 3.591263, 1, 0, 0.02352941, 1,
2.955841, 0.04200898, 1.677783, 1, 0, 0.01960784, 1,
3.144869, -0.3264993, 0.8229545, 1, 0, 0.01176471, 1,
3.486912, 0.720437, 0.7438984, 1, 0, 0.007843138, 1
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
-0.04828453, -3.847029, -7.203028, 0, -0.5, 0.5, 0.5,
-0.04828453, -3.847029, -7.203028, 1, -0.5, 0.5, 0.5,
-0.04828453, -3.847029, -7.203028, 1, 1.5, 0.5, 0.5,
-0.04828453, -3.847029, -7.203028, 0, 1.5, 0.5, 0.5
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
-4.781912, 0.1578909, -7.203028, 0, -0.5, 0.5, 0.5,
-4.781912, 0.1578909, -7.203028, 1, -0.5, 0.5, 0.5,
-4.781912, 0.1578909, -7.203028, 1, 1.5, 0.5, 0.5,
-4.781912, 0.1578909, -7.203028, 0, 1.5, 0.5, 0.5
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
-4.781912, -3.847029, 0.1171076, 0, -0.5, 0.5, 0.5,
-4.781912, -3.847029, 0.1171076, 1, -0.5, 0.5, 0.5,
-4.781912, -3.847029, 0.1171076, 1, 1.5, 0.5, 0.5,
-4.781912, -3.847029, 0.1171076, 0, 1.5, 0.5, 0.5
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
-2, -2.922817, -5.513766,
2, -2.922817, -5.513766,
-2, -2.922817, -5.513766,
-2, -3.076852, -5.79531,
0, -2.922817, -5.513766,
0, -3.076852, -5.79531,
2, -2.922817, -5.513766,
2, -3.076852, -5.79531
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
-2, -3.384923, -6.358397, 0, -0.5, 0.5, 0.5,
-2, -3.384923, -6.358397, 1, -0.5, 0.5, 0.5,
-2, -3.384923, -6.358397, 1, 1.5, 0.5, 0.5,
-2, -3.384923, -6.358397, 0, 1.5, 0.5, 0.5,
0, -3.384923, -6.358397, 0, -0.5, 0.5, 0.5,
0, -3.384923, -6.358397, 1, -0.5, 0.5, 0.5,
0, -3.384923, -6.358397, 1, 1.5, 0.5, 0.5,
0, -3.384923, -6.358397, 0, 1.5, 0.5, 0.5,
2, -3.384923, -6.358397, 0, -0.5, 0.5, 0.5,
2, -3.384923, -6.358397, 1, -0.5, 0.5, 0.5,
2, -3.384923, -6.358397, 1, 1.5, 0.5, 0.5,
2, -3.384923, -6.358397, 0, 1.5, 0.5, 0.5
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
-3.689537, -2, -5.513766,
-3.689537, 3, -5.513766,
-3.689537, -2, -5.513766,
-3.871599, -2, -5.79531,
-3.689537, -1, -5.513766,
-3.871599, -1, -5.79531,
-3.689537, 0, -5.513766,
-3.871599, 0, -5.79531,
-3.689537, 1, -5.513766,
-3.871599, 1, -5.79531,
-3.689537, 2, -5.513766,
-3.871599, 2, -5.79531,
-3.689537, 3, -5.513766,
-3.871599, 3, -5.79531
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
-4.235724, -2, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, -2, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, -2, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, -2, -6.358397, 0, 1.5, 0.5, 0.5,
-4.235724, -1, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, -1, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, -1, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, -1, -6.358397, 0, 1.5, 0.5, 0.5,
-4.235724, 0, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, 0, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, 0, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, 0, -6.358397, 0, 1.5, 0.5, 0.5,
-4.235724, 1, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, 1, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, 1, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, 1, -6.358397, 0, 1.5, 0.5, 0.5,
-4.235724, 2, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, 2, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, 2, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, 2, -6.358397, 0, 1.5, 0.5, 0.5,
-4.235724, 3, -6.358397, 0, -0.5, 0.5, 0.5,
-4.235724, 3, -6.358397, 1, -0.5, 0.5, 0.5,
-4.235724, 3, -6.358397, 1, 1.5, 0.5, 0.5,
-4.235724, 3, -6.358397, 0, 1.5, 0.5, 0.5
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
-3.689537, -2.922817, -4,
-3.689537, -2.922817, 4,
-3.689537, -2.922817, -4,
-3.871599, -3.076852, -4,
-3.689537, -2.922817, -2,
-3.871599, -3.076852, -2,
-3.689537, -2.922817, 0,
-3.871599, -3.076852, 0,
-3.689537, -2.922817, 2,
-3.871599, -3.076852, 2,
-3.689537, -2.922817, 4,
-3.871599, -3.076852, 4
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
-4.235724, -3.384923, -4, 0, -0.5, 0.5, 0.5,
-4.235724, -3.384923, -4, 1, -0.5, 0.5, 0.5,
-4.235724, -3.384923, -4, 1, 1.5, 0.5, 0.5,
-4.235724, -3.384923, -4, 0, 1.5, 0.5, 0.5,
-4.235724, -3.384923, -2, 0, -0.5, 0.5, 0.5,
-4.235724, -3.384923, -2, 1, -0.5, 0.5, 0.5,
-4.235724, -3.384923, -2, 1, 1.5, 0.5, 0.5,
-4.235724, -3.384923, -2, 0, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 0, 0, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 0, 1, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 0, 1, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 0, 0, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 2, 0, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 2, 1, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 2, 1, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 2, 0, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 4, 0, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 4, 1, -0.5, 0.5, 0.5,
-4.235724, -3.384923, 4, 1, 1.5, 0.5, 0.5,
-4.235724, -3.384923, 4, 0, 1.5, 0.5, 0.5
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
-3.689537, -2.922817, -5.513766,
-3.689537, 3.238598, -5.513766,
-3.689537, -2.922817, 5.747982,
-3.689537, 3.238598, 5.747982,
-3.689537, -2.922817, -5.513766,
-3.689537, -2.922817, 5.747982,
-3.689537, 3.238598, -5.513766,
-3.689537, 3.238598, 5.747982,
-3.689537, -2.922817, -5.513766,
3.592968, -2.922817, -5.513766,
-3.689537, -2.922817, 5.747982,
3.592968, -2.922817, 5.747982,
-3.689537, 3.238598, -5.513766,
3.592968, 3.238598, -5.513766,
-3.689537, 3.238598, 5.747982,
3.592968, 3.238598, 5.747982,
3.592968, -2.922817, -5.513766,
3.592968, 3.238598, -5.513766,
3.592968, -2.922817, 5.747982,
3.592968, 3.238598, 5.747982,
3.592968, -2.922817, -5.513766,
3.592968, -2.922817, 5.747982,
3.592968, 3.238598, -5.513766,
3.592968, 3.238598, 5.747982
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
var radius = 7.880961;
var distance = 35.06329;
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
mvMatrix.translate( 0.04828453, -0.1578909, -0.1171076 );
mvMatrix.scale( 1.170071, 1.38297, 0.7566366 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06329);
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
Chloroxuron<-read.table("Chloroxuron.xyz", skip=1)
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
-3.583481, -0.3284553, -2.391547, 0, 0, 1, 1, 1,
-3.014145, 0.2031195, -1.193535, 1, 0, 0, 1, 1,
-2.827651, -2.240789, -1.318256, 1, 0, 0, 1, 1,
-2.793427, 0.02137967, -0.4423579, 1, 0, 0, 1, 1,
-2.748348, -0.001232852, -2.818575, 1, 0, 0, 1, 1,
-2.722267, 1.735126, -0.8140649, 1, 0, 0, 1, 1,
-2.719172, -0.9940587, -1.369608, 0, 0, 0, 1, 1,
-2.653171, -0.6628651, -1.530477, 0, 0, 0, 1, 1,
-2.609804, 0.08372325, -3.142952, 0, 0, 0, 1, 1,
-2.594673, 1.493272, -0.804311, 0, 0, 0, 1, 1,
-2.480047, 0.1465414, -0.3895481, 0, 0, 0, 1, 1,
-2.459278, -1.174824, -0.1661913, 0, 0, 0, 1, 1,
-2.389112, -0.07705003, -1.095065, 0, 0, 0, 1, 1,
-2.363635, -0.1016667, -1.976948, 1, 1, 1, 1, 1,
-2.3386, 0.7439758, -1.700448, 1, 1, 1, 1, 1,
-2.337913, -1.188594, 0.505628, 1, 1, 1, 1, 1,
-2.304017, 0.5400257, -2.078956, 1, 1, 1, 1, 1,
-2.281113, -0.42119, -2.309335, 1, 1, 1, 1, 1,
-2.276832, 0.2332031, -0.3072796, 1, 1, 1, 1, 1,
-2.154719, 0.2476092, -1.267742, 1, 1, 1, 1, 1,
-1.995989, 0.5466584, -1.397476, 1, 1, 1, 1, 1,
-1.986362, -1.121556, -1.571317, 1, 1, 1, 1, 1,
-1.985391, 0.6517053, -0.9629045, 1, 1, 1, 1, 1,
-1.967547, -0.7832661, -0.256908, 1, 1, 1, 1, 1,
-1.965095, 1.093163, -1.922264, 1, 1, 1, 1, 1,
-1.928539, -0.2914869, -0.8175082, 1, 1, 1, 1, 1,
-1.917495, -1.053488, -0.7124851, 1, 1, 1, 1, 1,
-1.886747, -0.2470367, -1.153924, 1, 1, 1, 1, 1,
-1.884794, -0.8625429, -1.383353, 0, 0, 1, 1, 1,
-1.868954, 0.204025, -0.5890652, 1, 0, 0, 1, 1,
-1.822476, 1.655935, -2.449388, 1, 0, 0, 1, 1,
-1.805362, -0.431573, -1.654614, 1, 0, 0, 1, 1,
-1.801566, -0.172033, 0.1127685, 1, 0, 0, 1, 1,
-1.762371, -0.3053089, -3.418308, 1, 0, 0, 1, 1,
-1.756966, 1.553553, 0.6861803, 0, 0, 0, 1, 1,
-1.74044, 0.2771938, 0.1060364, 0, 0, 0, 1, 1,
-1.73861, 0.810384, -1.619152, 0, 0, 0, 1, 1,
-1.721295, 0.5387161, -0.2452167, 0, 0, 0, 1, 1,
-1.707607, -0.3786539, 0.6631511, 0, 0, 0, 1, 1,
-1.700753, -1.091913, -2.767517, 0, 0, 0, 1, 1,
-1.690158, 0.1061547, -0.919797, 0, 0, 0, 1, 1,
-1.688263, 0.05743501, -1.069869, 1, 1, 1, 1, 1,
-1.688163, 0.6279239, -0.2398755, 1, 1, 1, 1, 1,
-1.677098, -0.1983266, -1.628856, 1, 1, 1, 1, 1,
-1.667481, -0.4834819, -1.779287, 1, 1, 1, 1, 1,
-1.666049, 0.1713492, -0.1598031, 1, 1, 1, 1, 1,
-1.64856, -0.04327355, -2.03181, 1, 1, 1, 1, 1,
-1.644763, -0.9326239, -3.15044, 1, 1, 1, 1, 1,
-1.64332, -1.521499, -1.917035, 1, 1, 1, 1, 1,
-1.638313, -0.9804495, 1.014458, 1, 1, 1, 1, 1,
-1.637741, 0.8432297, -0.8286385, 1, 1, 1, 1, 1,
-1.625724, -0.05471687, 0.107868, 1, 1, 1, 1, 1,
-1.598937, 1.610074, -0.136339, 1, 1, 1, 1, 1,
-1.588284, -1.062667, -3.25569, 1, 1, 1, 1, 1,
-1.58777, 0.6842871, 0.7395588, 1, 1, 1, 1, 1,
-1.568783, -1.284498, -2.426011, 1, 1, 1, 1, 1,
-1.562763, 1.734004, -0.9083008, 0, 0, 1, 1, 1,
-1.545426, -0.2710799, -0.3821413, 1, 0, 0, 1, 1,
-1.543198, -0.7895896, -1.789548, 1, 0, 0, 1, 1,
-1.5322, 2.062879, 0.2147578, 1, 0, 0, 1, 1,
-1.531395, 0.491494, -0.5481167, 1, 0, 0, 1, 1,
-1.516136, -0.3133934, -2.755459, 1, 0, 0, 1, 1,
-1.515229, 1.032317, -0.3169798, 0, 0, 0, 1, 1,
-1.50994, -0.03005574, -4.059981, 0, 0, 0, 1, 1,
-1.507288, -0.2336794, -1.559695, 0, 0, 0, 1, 1,
-1.505926, 0.2216409, -1.304527, 0, 0, 0, 1, 1,
-1.499478, -0.4678873, -1.128601, 0, 0, 0, 1, 1,
-1.487293, 0.6156376, -2.3672, 0, 0, 0, 1, 1,
-1.48489, -0.0006158587, -3.031695, 0, 0, 0, 1, 1,
-1.461395, 0.5201447, -1.122116, 1, 1, 1, 1, 1,
-1.452434, 0.6747332, -0.9299367, 1, 1, 1, 1, 1,
-1.447334, 1.118316, -1.065343, 1, 1, 1, 1, 1,
-1.440486, -0.5863005, -1.018391, 1, 1, 1, 1, 1,
-1.432565, 1.863889, -0.6317042, 1, 1, 1, 1, 1,
-1.427273, 1.322472, 0.9424105, 1, 1, 1, 1, 1,
-1.419246, 0.1895494, -0.1588022, 1, 1, 1, 1, 1,
-1.417557, 1.188585, -2.791153, 1, 1, 1, 1, 1,
-1.407766, 0.2441117, -1.262052, 1, 1, 1, 1, 1,
-1.402724, 0.1508401, -2.620133, 1, 1, 1, 1, 1,
-1.395995, -0.5987251, -0.814236, 1, 1, 1, 1, 1,
-1.38633, 1.552788, -0.5045763, 1, 1, 1, 1, 1,
-1.377733, 2.191432, -0.2561493, 1, 1, 1, 1, 1,
-1.375014, 1.386383, -1.048365, 1, 1, 1, 1, 1,
-1.366227, -1.064484, -3.116431, 1, 1, 1, 1, 1,
-1.366012, -0.1115395, -1.125864, 0, 0, 1, 1, 1,
-1.355036, 0.08428416, -1.452413, 1, 0, 0, 1, 1,
-1.340844, -0.5267646, -1.590433, 1, 0, 0, 1, 1,
-1.325241, 1.072435, -0.6150838, 1, 0, 0, 1, 1,
-1.314947, 0.7229249, 0.2089529, 1, 0, 0, 1, 1,
-1.312611, -0.05972753, -2.049117, 1, 0, 0, 1, 1,
-1.309571, 1.013038, -1.237491, 0, 0, 0, 1, 1,
-1.304413, 0.1520146, -2.295309, 0, 0, 0, 1, 1,
-1.298784, 1.090476, -2.526354, 0, 0, 0, 1, 1,
-1.289893, 0.9915161, -0.4044661, 0, 0, 0, 1, 1,
-1.286232, 0.9116718, 0.4503357, 0, 0, 0, 1, 1,
-1.273778, 0.4420633, -0.1843065, 0, 0, 0, 1, 1,
-1.273328, -0.1707542, -0.7886921, 0, 0, 0, 1, 1,
-1.265586, -0.5686636, -1.916051, 1, 1, 1, 1, 1,
-1.262249, 0.3734274, -1.06139, 1, 1, 1, 1, 1,
-1.259367, -1.20997, -2.177071, 1, 1, 1, 1, 1,
-1.258528, 1.152807, -2.674646, 1, 1, 1, 1, 1,
-1.239814, -0.5951384, -3.007708, 1, 1, 1, 1, 1,
-1.237488, -0.3222323, -2.100145, 1, 1, 1, 1, 1,
-1.23659, -0.1832939, -1.910508, 1, 1, 1, 1, 1,
-1.236359, -0.6177739, -3.708407, 1, 1, 1, 1, 1,
-1.230941, 0.5989742, -1.927093, 1, 1, 1, 1, 1,
-1.230263, -1.081683, -1.933423, 1, 1, 1, 1, 1,
-1.2281, 1.196146, 0.4582021, 1, 1, 1, 1, 1,
-1.221974, 0.4488137, -1.886055, 1, 1, 1, 1, 1,
-1.218813, 0.62084, -0.7164717, 1, 1, 1, 1, 1,
-1.206873, 0.1229044, -1.316962, 1, 1, 1, 1, 1,
-1.201035, -0.9673411, -2.614751, 1, 1, 1, 1, 1,
-1.194928, -1.341558, -2.893788, 0, 0, 1, 1, 1,
-1.194186, -0.7681936, -1.830396, 1, 0, 0, 1, 1,
-1.184646, -1.621144, -3.183417, 1, 0, 0, 1, 1,
-1.178891, -0.1772436, -0.8816761, 1, 0, 0, 1, 1,
-1.17794, -1.225887, -2.71305, 1, 0, 0, 1, 1,
-1.170003, 1.396056, -0.8166305, 1, 0, 0, 1, 1,
-1.166957, -0.3355581, -2.417963, 0, 0, 0, 1, 1,
-1.166571, -0.9971648, -1.174202, 0, 0, 0, 1, 1,
-1.165343, -0.2981844, -1.733841, 0, 0, 0, 1, 1,
-1.161854, 0.2805947, -1.902831, 0, 0, 0, 1, 1,
-1.161358, 1.934023, 0.6998314, 0, 0, 0, 1, 1,
-1.160275, 0.3894147, -1.872884, 0, 0, 0, 1, 1,
-1.159318, -1.145523, -2.767906, 0, 0, 0, 1, 1,
-1.157882, -0.003507033, -2.573311, 1, 1, 1, 1, 1,
-1.152003, 2.690659, -0.02145724, 1, 1, 1, 1, 1,
-1.14298, -0.5921209, -0.760777, 1, 1, 1, 1, 1,
-1.139889, -0.4229386, -0.3949887, 1, 1, 1, 1, 1,
-1.135499, 1.811681, -0.8723245, 1, 1, 1, 1, 1,
-1.134617, 1.979167, 0.6719819, 1, 1, 1, 1, 1,
-1.132252, -0.2669407, -0.09501106, 1, 1, 1, 1, 1,
-1.128613, 0.8022142, -1.691631, 1, 1, 1, 1, 1,
-1.125025, -0.329966, -1.099535, 1, 1, 1, 1, 1,
-1.118041, 1.044807, -1.652122, 1, 1, 1, 1, 1,
-1.114004, 0.4638406, -1.44049, 1, 1, 1, 1, 1,
-1.09113, 0.2118384, -1.617527, 1, 1, 1, 1, 1,
-1.08281, 1.070692, -1.347932, 1, 1, 1, 1, 1,
-1.082576, -1.433705, -3.886137, 1, 1, 1, 1, 1,
-1.076357, 0.5288364, 0.4423291, 1, 1, 1, 1, 1,
-1.073527, -1.505231, -1.648521, 0, 0, 1, 1, 1,
-1.072897, 1.713809, -0.01907898, 1, 0, 0, 1, 1,
-1.069457, -0.9582837, -2.610227, 1, 0, 0, 1, 1,
-1.069055, 0.302287, -1.699149, 1, 0, 0, 1, 1,
-1.068975, -1.190841, -2.492114, 1, 0, 0, 1, 1,
-1.061024, -0.3633364, -3.760431, 1, 0, 0, 1, 1,
-1.06095, -0.6282309, -3.20083, 0, 0, 0, 1, 1,
-1.054174, 0.2530354, -1.460941, 0, 0, 0, 1, 1,
-1.051206, 0.1280525, -2.476454, 0, 0, 0, 1, 1,
-1.041278, -0.8923137, -2.184056, 0, 0, 0, 1, 1,
-1.037621, 0.1318684, -1.098587, 0, 0, 0, 1, 1,
-1.033781, 0.7650373, -1.709108, 0, 0, 0, 1, 1,
-1.03272, 0.2647568, 0.139979, 0, 0, 0, 1, 1,
-1.030247, -0.05948307, -3.393614, 1, 1, 1, 1, 1,
-1.02882, -0.1289272, -2.633553, 1, 1, 1, 1, 1,
-1.026579, 0.8977206, -0.7378338, 1, 1, 1, 1, 1,
-1.024942, 1.391303, 0.7834216, 1, 1, 1, 1, 1,
-1.020071, -0.3655078, -2.82169, 1, 1, 1, 1, 1,
-1.018455, 2.195399, -0.110436, 1, 1, 1, 1, 1,
-1.005574, 0.08315956, 0.1882817, 1, 1, 1, 1, 1,
-0.9979571, -0.8916856, -1.373098, 1, 1, 1, 1, 1,
-0.9848638, -0.8343206, -0.6737466, 1, 1, 1, 1, 1,
-0.9767839, -1.314101, -1.604702, 1, 1, 1, 1, 1,
-0.9766657, -0.4763494, -0.3851801, 1, 1, 1, 1, 1,
-0.962589, -0.541748, -3.224993, 1, 1, 1, 1, 1,
-0.9619813, -1.086526, -1.09577, 1, 1, 1, 1, 1,
-0.9561303, -0.995607, -2.903496, 1, 1, 1, 1, 1,
-0.9446165, -0.2284255, -2.320694, 1, 1, 1, 1, 1,
-0.9405488, 0.5057703, -1.5473, 0, 0, 1, 1, 1,
-0.9397094, 0.01354426, -1.804161, 1, 0, 0, 1, 1,
-0.9319232, -1.157494, -2.42648, 1, 0, 0, 1, 1,
-0.9286965, 0.7747281, -0.9460383, 1, 0, 0, 1, 1,
-0.9273927, 0.4539634, -0.1936381, 1, 0, 0, 1, 1,
-0.9240563, 0.9958811, -1.882338, 1, 0, 0, 1, 1,
-0.9236554, 0.1218573, -1.368641, 0, 0, 0, 1, 1,
-0.9213372, 1.142963, -0.5617365, 0, 0, 0, 1, 1,
-0.9210719, 0.5612189, -1.502215, 0, 0, 0, 1, 1,
-0.9189273, -1.325222, -2.564016, 0, 0, 0, 1, 1,
-0.9159368, 0.1466074, -0.6788519, 0, 0, 0, 1, 1,
-0.9148397, -0.03407038, -2.477344, 0, 0, 0, 1, 1,
-0.9142686, -0.6052172, -2.716645, 0, 0, 0, 1, 1,
-0.9139118, 0.5575952, -1.824017, 1, 1, 1, 1, 1,
-0.913344, 0.233648, -3.090899, 1, 1, 1, 1, 1,
-0.9129345, 0.5313318, -2.902093, 1, 1, 1, 1, 1,
-0.9118549, -1.076909, -2.253434, 1, 1, 1, 1, 1,
-0.9088559, -0.5472925, -2.786734, 1, 1, 1, 1, 1,
-0.9023572, 1.034218, -0.6923963, 1, 1, 1, 1, 1,
-0.9009051, 0.3620567, 0.4292928, 1, 1, 1, 1, 1,
-0.8974304, 0.04707441, -3.226981, 1, 1, 1, 1, 1,
-0.8955408, 0.5992542, 1.392271, 1, 1, 1, 1, 1,
-0.8949142, 0.5878611, -0.00411322, 1, 1, 1, 1, 1,
-0.8907447, 2.266855, -1.72545, 1, 1, 1, 1, 1,
-0.8903435, 0.9677081, 0.5584514, 1, 1, 1, 1, 1,
-0.8898695, -2.03005, -3.125762, 1, 1, 1, 1, 1,
-0.8876486, 1.309497, 0.676053, 1, 1, 1, 1, 1,
-0.883437, -0.2443661, -2.665904, 1, 1, 1, 1, 1,
-0.8827172, 1.36313, -1.282993, 0, 0, 1, 1, 1,
-0.8800083, 1.488297, -0.2084341, 1, 0, 0, 1, 1,
-0.8797969, -0.5944563, -2.853765, 1, 0, 0, 1, 1,
-0.8734782, -0.8655728, -2.129993, 1, 0, 0, 1, 1,
-0.8710926, -0.6871622, -2.920827, 1, 0, 0, 1, 1,
-0.8707098, -0.9971807, -3.107644, 1, 0, 0, 1, 1,
-0.8685963, -2.183447, -2.995719, 0, 0, 0, 1, 1,
-0.8670937, 1.127561, -0.4219988, 0, 0, 0, 1, 1,
-0.8667551, -0.4405039, -2.916121, 0, 0, 0, 1, 1,
-0.8608262, 0.04117353, -3.380352, 0, 0, 0, 1, 1,
-0.8578275, 0.9236866, -1.237328, 0, 0, 0, 1, 1,
-0.853756, 0.3157538, -3.362769, 0, 0, 0, 1, 1,
-0.8516847, -0.03851578, -1.064397, 0, 0, 0, 1, 1,
-0.8490896, 2.309128, -0.2356465, 1, 1, 1, 1, 1,
-0.8484765, 0.1323431, -2.141791, 1, 1, 1, 1, 1,
-0.8400463, -2.097127, -1.40419, 1, 1, 1, 1, 1,
-0.8393005, 0.2482317, -0.5159885, 1, 1, 1, 1, 1,
-0.8386204, -0.7302448, -3.823213, 1, 1, 1, 1, 1,
-0.8333035, -1.145208, -3.042435, 1, 1, 1, 1, 1,
-0.8211859, -0.429141, -2.417734, 1, 1, 1, 1, 1,
-0.8202478, -1.269043, -2.766295, 1, 1, 1, 1, 1,
-0.8197654, 0.528276, -1.598513, 1, 1, 1, 1, 1,
-0.8189148, -1.003051, -2.329161, 1, 1, 1, 1, 1,
-0.8176153, -0.194469, -1.518423, 1, 1, 1, 1, 1,
-0.8159636, -1.160963, -4.120917, 1, 1, 1, 1, 1,
-0.8138266, 0.1644527, -1.546348, 1, 1, 1, 1, 1,
-0.8136683, -0.02720235, -0.998419, 1, 1, 1, 1, 1,
-0.8124173, 0.181324, -0.8618935, 1, 1, 1, 1, 1,
-0.811324, 0.4494206, -0.2338067, 0, 0, 1, 1, 1,
-0.8059258, 0.001163513, -1.380274, 1, 0, 0, 1, 1,
-0.8020398, 0.003678612, -1.092725, 1, 0, 0, 1, 1,
-0.7999288, 0.7991554, -0.084314, 1, 0, 0, 1, 1,
-0.7997538, -0.5179828, -1.346892, 1, 0, 0, 1, 1,
-0.7959561, -0.7748532, 0.1877961, 1, 0, 0, 1, 1,
-0.7914866, 0.2025643, -0.704411, 0, 0, 0, 1, 1,
-0.7871901, 2.317327, 0.3172388, 0, 0, 0, 1, 1,
-0.7869458, 1.224982, -1.125907, 0, 0, 0, 1, 1,
-0.7835379, -1.670427, -1.713375, 0, 0, 0, 1, 1,
-0.7734931, 0.8157932, -0.5215158, 0, 0, 0, 1, 1,
-0.7666434, 0.984553, -1.521885, 0, 0, 0, 1, 1,
-0.7601132, -0.445833, -1.686533, 0, 0, 0, 1, 1,
-0.7537047, -0.6768584, -2.333297, 1, 1, 1, 1, 1,
-0.752873, -0.3233154, -1.927437, 1, 1, 1, 1, 1,
-0.7525901, 1.613738, -0.9307507, 1, 1, 1, 1, 1,
-0.7499436, 0.5038929, -1.81309, 1, 1, 1, 1, 1,
-0.7476218, 0.5499498, -0.7610829, 1, 1, 1, 1, 1,
-0.7464666, 0.5417007, -1.039502, 1, 1, 1, 1, 1,
-0.7432711, -0.7977504, -3.251309, 1, 1, 1, 1, 1,
-0.7394513, 0.6129078, -1.630496, 1, 1, 1, 1, 1,
-0.733585, 2.994554, -1.886579, 1, 1, 1, 1, 1,
-0.7240116, -0.05323181, -0.8288618, 1, 1, 1, 1, 1,
-0.7156922, -0.6932855, -0.9576456, 1, 1, 1, 1, 1,
-0.7153264, -0.3357972, -1.267825, 1, 1, 1, 1, 1,
-0.7148352, -1.074309, -2.756012, 1, 1, 1, 1, 1,
-0.7085143, 0.6449773, 0.5582663, 1, 1, 1, 1, 1,
-0.7041665, 1.685151, -2.698412, 1, 1, 1, 1, 1,
-0.7035285, -0.4387489, -2.60854, 0, 0, 1, 1, 1,
-0.7026731, -0.1762875, -1.937373, 1, 0, 0, 1, 1,
-0.6946037, -1.240437, -2.467132, 1, 0, 0, 1, 1,
-0.6901404, -0.2862879, -3.354241, 1, 0, 0, 1, 1,
-0.6897149, -0.492351, -1.216226, 1, 0, 0, 1, 1,
-0.6844468, 0.2394095, -1.648113, 1, 0, 0, 1, 1,
-0.6828459, -0.574441, -1.854495, 0, 0, 0, 1, 1,
-0.6773376, 0.5457411, -1.774305, 0, 0, 0, 1, 1,
-0.6745758, -0.7100238, -1.316191, 0, 0, 0, 1, 1,
-0.6709544, -0.1188354, -2.788563, 0, 0, 0, 1, 1,
-0.6684963, -1.688582, -1.146696, 0, 0, 0, 1, 1,
-0.6657978, -0.3387688, -2.388461, 0, 0, 0, 1, 1,
-0.660895, 1.161476, -0.3784938, 0, 0, 0, 1, 1,
-0.6504188, 0.1135576, -3.006776, 1, 1, 1, 1, 1,
-0.6493644, 0.361575, -2.786864, 1, 1, 1, 1, 1,
-0.6483666, 0.310228, -0.2756709, 1, 1, 1, 1, 1,
-0.6464878, -0.8537673, -2.992421, 1, 1, 1, 1, 1,
-0.6394886, -0.5308529, -1.524298, 1, 1, 1, 1, 1,
-0.6385373, -1.146147, -1.16865, 1, 1, 1, 1, 1,
-0.6367596, 1.727291, 0.5090696, 1, 1, 1, 1, 1,
-0.6337712, -0.7026342, -3.361992, 1, 1, 1, 1, 1,
-0.6313131, 0.1199037, -0.2211801, 1, 1, 1, 1, 1,
-0.6303103, -0.6458102, -4.264836, 1, 1, 1, 1, 1,
-0.6262093, 0.6807106, -2.246522, 1, 1, 1, 1, 1,
-0.6169796, -0.07785401, -0.6107551, 1, 1, 1, 1, 1,
-0.6119297, 0.4479355, -2.813428, 1, 1, 1, 1, 1,
-0.6057222, 0.4722499, -0.5163736, 1, 1, 1, 1, 1,
-0.6052201, -0.9857064, -2.643872, 1, 1, 1, 1, 1,
-0.601379, -2.685478, -3.354831, 0, 0, 1, 1, 1,
-0.5975965, 1.437748, 0.9368773, 1, 0, 0, 1, 1,
-0.5925965, -1.327226, -3.246119, 1, 0, 0, 1, 1,
-0.5917444, -1.138012, -1.418054, 1, 0, 0, 1, 1,
-0.5917094, -0.3145704, -1.625378, 1, 0, 0, 1, 1,
-0.590923, -0.4750576, -2.221381, 1, 0, 0, 1, 1,
-0.5890186, 0.2555938, -1.09874, 0, 0, 0, 1, 1,
-0.5868306, -0.2909685, -3.253754, 0, 0, 0, 1, 1,
-0.5835213, 1.384833, -1.465639, 0, 0, 0, 1, 1,
-0.5817443, 0.2606966, -2.686808, 0, 0, 0, 1, 1,
-0.5784519, -1.407764, -2.640997, 0, 0, 0, 1, 1,
-0.5771135, 0.08502102, -0.9457281, 0, 0, 0, 1, 1,
-0.5747784, -0.008412242, -0.494677, 0, 0, 0, 1, 1,
-0.5671127, -1.048338, -3.83346, 1, 1, 1, 1, 1,
-0.5668957, -0.1213419, -0.4707081, 1, 1, 1, 1, 1,
-0.5664328, -1.231011, -2.016919, 1, 1, 1, 1, 1,
-0.5608051, -0.2369413, -1.372378, 1, 1, 1, 1, 1,
-0.5591834, -0.1748724, -0.5306386, 1, 1, 1, 1, 1,
-0.5570338, -1.659138, -1.787491, 1, 1, 1, 1, 1,
-0.5536156, 0.2243151, -1.024807, 1, 1, 1, 1, 1,
-0.5409563, 0.5469658, -0.7171298, 1, 1, 1, 1, 1,
-0.5398628, -1.922462, -4.713374, 1, 1, 1, 1, 1,
-0.5397357, -1.187827, -1.073119, 1, 1, 1, 1, 1,
-0.5375957, 0.191245, -2.409104, 1, 1, 1, 1, 1,
-0.5362275, 0.7410079, -1.743744, 1, 1, 1, 1, 1,
-0.536045, -1.933295, -1.641141, 1, 1, 1, 1, 1,
-0.5356926, -0.6280351, -2.074096, 1, 1, 1, 1, 1,
-0.5352471, 1.633885, -0.334886, 1, 1, 1, 1, 1,
-0.5348955, -0.9905737, -3.276393, 0, 0, 1, 1, 1,
-0.5312183, -0.333075, -2.282774, 1, 0, 0, 1, 1,
-0.5286831, -1.210553, -2.688078, 1, 0, 0, 1, 1,
-0.5282741, 1.949307, -0.9382084, 1, 0, 0, 1, 1,
-0.5246805, 0.03947982, -2.48005, 1, 0, 0, 1, 1,
-0.522644, 0.1729235, -1.860553, 1, 0, 0, 1, 1,
-0.5221049, -1.04971, -2.650338, 0, 0, 0, 1, 1,
-0.521735, 0.7689874, -0.09435039, 0, 0, 0, 1, 1,
-0.5193987, 1.479356, 1.849415, 0, 0, 0, 1, 1,
-0.5185924, 0.2130179, -2.470251, 0, 0, 0, 1, 1,
-0.5167497, 0.1072821, -1.494159, 0, 0, 0, 1, 1,
-0.5161093, 0.3145635, 0.4362066, 0, 0, 0, 1, 1,
-0.5125358, -1.589499, -2.048463, 0, 0, 0, 1, 1,
-0.5081405, 1.432011, 0.3631397, 1, 1, 1, 1, 1,
-0.507204, 0.4007568, -1.119898, 1, 1, 1, 1, 1,
-0.506874, 2.919884, -1.264788, 1, 1, 1, 1, 1,
-0.5059853, -0.5477479, -2.920519, 1, 1, 1, 1, 1,
-0.5017383, -1.743873, -2.419829, 1, 1, 1, 1, 1,
-0.4989567, -0.1791131, -1.20356, 1, 1, 1, 1, 1,
-0.4989468, 0.9058611, -0.8352032, 1, 1, 1, 1, 1,
-0.4988676, 0.575808, -0.5458508, 1, 1, 1, 1, 1,
-0.4971055, -2.005082, -2.443678, 1, 1, 1, 1, 1,
-0.4967182, 1.716931, -0.8808861, 1, 1, 1, 1, 1,
-0.4961096, 0.1046571, -1.773041, 1, 1, 1, 1, 1,
-0.4947886, 0.1882142, -2.380752, 1, 1, 1, 1, 1,
-0.4943252, -0.4374642, -4.655188, 1, 1, 1, 1, 1,
-0.4904104, -1.302624, -3.770782, 1, 1, 1, 1, 1,
-0.4885396, -0.3556553, -1.004161, 1, 1, 1, 1, 1,
-0.4879106, 0.4498094, 0.4847986, 0, 0, 1, 1, 1,
-0.4874563, -1.272827, -4.969987, 1, 0, 0, 1, 1,
-0.4805432, 0.4191336, 0.9274812, 1, 0, 0, 1, 1,
-0.4801971, 0.5260241, 0.3884577, 1, 0, 0, 1, 1,
-0.4784801, -0.2946541, -4.371262, 1, 0, 0, 1, 1,
-0.4784372, 0.7639717, 0.9155456, 1, 0, 0, 1, 1,
-0.4772726, -1.690552, -3.057028, 0, 0, 0, 1, 1,
-0.4766962, 0.1626857, -1.289896, 0, 0, 0, 1, 1,
-0.4727715, 0.732128, -0.8719897, 0, 0, 0, 1, 1,
-0.4692378, -0.7796571, -2.564941, 0, 0, 0, 1, 1,
-0.4692269, -1.22306, -3.164753, 0, 0, 0, 1, 1,
-0.4588818, 0.5022285, 1.380235, 0, 0, 0, 1, 1,
-0.4537868, 0.2030441, -1.817815, 0, 0, 0, 1, 1,
-0.4532906, 0.3446755, -0.9077927, 1, 1, 1, 1, 1,
-0.4513745, 0.3867291, 0.09866862, 1, 1, 1, 1, 1,
-0.4488634, 0.9111144, -0.6539194, 1, 1, 1, 1, 1,
-0.4480587, -0.3169301, -2.913303, 1, 1, 1, 1, 1,
-0.4429898, -0.1444764, -2.764446, 1, 1, 1, 1, 1,
-0.4420243, -1.224243, -3.792261, 1, 1, 1, 1, 1,
-0.4411342, 0.379845, -1.050464, 1, 1, 1, 1, 1,
-0.4382586, -1.191104, -3.15553, 1, 1, 1, 1, 1,
-0.4309864, -0.6677337, -3.109008, 1, 1, 1, 1, 1,
-0.4281716, 0.837562, -0.8779439, 1, 1, 1, 1, 1,
-0.4276164, -1.625913, -2.842579, 1, 1, 1, 1, 1,
-0.4259034, 1.308922, 0.06313153, 1, 1, 1, 1, 1,
-0.4144144, -1.12655, -3.949468, 1, 1, 1, 1, 1,
-0.4138977, -1.246033, -2.028796, 1, 1, 1, 1, 1,
-0.4128133, -1.566702, -3.029576, 1, 1, 1, 1, 1,
-0.4125223, -0.06216644, -0.6550949, 0, 0, 1, 1, 1,
-0.4123344, 0.06938688, -0.3730003, 1, 0, 0, 1, 1,
-0.3949647, 1.616543, -0.8050346, 1, 0, 0, 1, 1,
-0.3905273, -0.04086392, -0.9763755, 1, 0, 0, 1, 1,
-0.3895268, -1.558297, -3.66807, 1, 0, 0, 1, 1,
-0.3868954, 0.7761716, 0.2308971, 1, 0, 0, 1, 1,
-0.3850352, 0.6679318, 0.8078378, 0, 0, 0, 1, 1,
-0.3847147, -0.5341932, -1.767405, 0, 0, 0, 1, 1,
-0.3824815, -0.1301708, -2.738177, 0, 0, 0, 1, 1,
-0.380438, -0.3629786, -0.9199257, 0, 0, 0, 1, 1,
-0.377362, -0.6568629, -4.191491, 0, 0, 0, 1, 1,
-0.3765654, 1.182647, -0.3924051, 0, 0, 0, 1, 1,
-0.363001, -0.4918262, -3.226453, 0, 0, 0, 1, 1,
-0.3620335, 0.01096154, 0.1235125, 1, 1, 1, 1, 1,
-0.3612535, -2.088919, -3.168745, 1, 1, 1, 1, 1,
-0.3609217, 0.05625604, -2.335107, 1, 1, 1, 1, 1,
-0.3602987, 1.204457, -1.850262, 1, 1, 1, 1, 1,
-0.3595484, -1.205217, -3.16206, 1, 1, 1, 1, 1,
-0.3588779, 0.7336891, -0.8878881, 1, 1, 1, 1, 1,
-0.3563721, -0.5442165, -0.727942, 1, 1, 1, 1, 1,
-0.3562238, 0.2335934, -1.96597, 1, 1, 1, 1, 1,
-0.3521504, -0.4678623, -1.112681, 1, 1, 1, 1, 1,
-0.3487442, -0.1285581, -1.609513, 1, 1, 1, 1, 1,
-0.3462152, -0.8793418, -2.797912, 1, 1, 1, 1, 1,
-0.3442391, -0.648896, -3.386837, 1, 1, 1, 1, 1,
-0.3420611, -0.02438299, -1.328934, 1, 1, 1, 1, 1,
-0.3419659, 1.30175, 0.2348515, 1, 1, 1, 1, 1,
-0.3411153, 0.5304684, 2.234552, 1, 1, 1, 1, 1,
-0.3402649, 0.2993609, 0.3333417, 0, 0, 1, 1, 1,
-0.3353797, -0.3993213, -1.961404, 1, 0, 0, 1, 1,
-0.3286358, -0.9349887, -2.601437, 1, 0, 0, 1, 1,
-0.327116, -1.687162, -3.218555, 1, 0, 0, 1, 1,
-0.3228654, 1.859114, -1.298882, 1, 0, 0, 1, 1,
-0.3160433, -0.8859085, -2.545174, 1, 0, 0, 1, 1,
-0.3073291, -0.176626, -4.456121, 0, 0, 0, 1, 1,
-0.306845, -0.6218383, -1.968406, 0, 0, 0, 1, 1,
-0.3026479, 0.06979454, -2.163316, 0, 0, 0, 1, 1,
-0.2961293, 2.215639, -1.085495, 0, 0, 0, 1, 1,
-0.2948403, 2.282631, 1.272282, 0, 0, 0, 1, 1,
-0.2940795, 0.3235117, -0.8237028, 0, 0, 0, 1, 1,
-0.2903256, -0.7186586, -2.898533, 0, 0, 0, 1, 1,
-0.2836761, -2.571761, -2.543682, 1, 1, 1, 1, 1,
-0.2773523, 1.109886, -0.03437812, 1, 1, 1, 1, 1,
-0.2722451, -0.3920773, -2.596633, 1, 1, 1, 1, 1,
-0.2673673, 2.293657, -1.165035, 1, 1, 1, 1, 1,
-0.2661424, 0.009303862, -1.884516, 1, 1, 1, 1, 1,
-0.2658052, -2.645582, -3.936137, 1, 1, 1, 1, 1,
-0.2633393, -0.8641292, -3.101448, 1, 1, 1, 1, 1,
-0.2547785, 0.4139305, 0.01545686, 1, 1, 1, 1, 1,
-0.2543638, -0.383207, -3.859688, 1, 1, 1, 1, 1,
-0.2463026, -0.0146081, -0.5205225, 1, 1, 1, 1, 1,
-0.2446278, -1.770163, -3.117797, 1, 1, 1, 1, 1,
-0.2417875, 0.5866571, -1.504282, 1, 1, 1, 1, 1,
-0.2393452, 1.219027, 0.3898198, 1, 1, 1, 1, 1,
-0.2380422, 0.5362584, -1.794219, 1, 1, 1, 1, 1,
-0.2327557, -1.129535, -1.783178, 1, 1, 1, 1, 1,
-0.2298904, -0.4052751, -2.326941, 0, 0, 1, 1, 1,
-0.22967, 1.186054, 0.4644892, 1, 0, 0, 1, 1,
-0.2259383, -0.6585265, -2.142242, 1, 0, 0, 1, 1,
-0.2235672, 0.2432057, -1.934448, 1, 0, 0, 1, 1,
-0.2182922, 0.3543873, -1.185523, 1, 0, 0, 1, 1,
-0.2155286, 0.9214412, -0.6801149, 1, 0, 0, 1, 1,
-0.2115435, -0.6644416, -2.44394, 0, 0, 0, 1, 1,
-0.2073876, 0.5512202, -1.988794, 0, 0, 0, 1, 1,
-0.1983269, 0.03336842, 0.5466002, 0, 0, 0, 1, 1,
-0.1914183, 0.7784876, -0.563425, 0, 0, 0, 1, 1,
-0.1906348, 0.1590788, -1.713632, 0, 0, 0, 1, 1,
-0.1903833, -1.262988, -2.78858, 0, 0, 0, 1, 1,
-0.1883911, -0.6039759, -3.197551, 0, 0, 0, 1, 1,
-0.179318, -0.9660696, -1.330654, 1, 1, 1, 1, 1,
-0.1789537, -1.80184, -1.696167, 1, 1, 1, 1, 1,
-0.1788907, -1.094841, -3.042087, 1, 1, 1, 1, 1,
-0.1707907, -0.9979088, -1.486452, 1, 1, 1, 1, 1,
-0.1655531, -1.057471, -2.930516, 1, 1, 1, 1, 1,
-0.1571089, -0.7931299, -3.185517, 1, 1, 1, 1, 1,
-0.1569284, -1.277719, -2.57553, 1, 1, 1, 1, 1,
-0.1524377, -1.328457, -3.446528, 1, 1, 1, 1, 1,
-0.151903, -0.758161, -3.740342, 1, 1, 1, 1, 1,
-0.1482729, 1.707776, 1.017161, 1, 1, 1, 1, 1,
-0.1479269, -1.530198, -3.622856, 1, 1, 1, 1, 1,
-0.1467281, -0.649251, -4.450402, 1, 1, 1, 1, 1,
-0.1436297, -1.02321, -0.8996102, 1, 1, 1, 1, 1,
-0.1416406, 0.6235164, -0.09393653, 1, 1, 1, 1, 1,
-0.1387699, 0.2797869, 0.2716346, 1, 1, 1, 1, 1,
-0.1383424, 0.3245926, -0.53144, 0, 0, 1, 1, 1,
-0.1356864, -0.2633319, -3.816496, 1, 0, 0, 1, 1,
-0.1345691, -1.392382, -2.955705, 1, 0, 0, 1, 1,
-0.1326008, 0.05270793, -1.028088, 1, 0, 0, 1, 1,
-0.1268694, 0.7257435, -1.398715, 1, 0, 0, 1, 1,
-0.1231358, -2.833087, -1.785041, 1, 0, 0, 1, 1,
-0.1225508, -1.55567, -3.190312, 0, 0, 0, 1, 1,
-0.1206574, 0.1736419, -1.04798, 0, 0, 0, 1, 1,
-0.1201062, 2.188388, 1.409096, 0, 0, 0, 1, 1,
-0.1195155, 0.3011048, 0.9642883, 0, 0, 0, 1, 1,
-0.1192743, 0.9677351, -2.270302, 0, 0, 0, 1, 1,
-0.1185565, 0.09026249, -0.2499997, 0, 0, 0, 1, 1,
-0.1175375, 0.3368293, -0.6945029, 0, 0, 0, 1, 1,
-0.1156612, -0.9511583, -3.075561, 1, 1, 1, 1, 1,
-0.1143763, 0.6365418, -0.6242497, 1, 1, 1, 1, 1,
-0.111378, 0.1031595, 1.577876, 1, 1, 1, 1, 1,
-0.1097802, 0.2881835, -1.22847, 1, 1, 1, 1, 1,
-0.1088842, -1.052023, -3.219399, 1, 1, 1, 1, 1,
-0.1081398, -0.4147173, -4.303187, 1, 1, 1, 1, 1,
-0.1077467, 1.502937, 0.9899174, 1, 1, 1, 1, 1,
-0.1042209, -0.05131036, -2.777678, 1, 1, 1, 1, 1,
-0.1028681, -1.098174, -0.8455148, 1, 1, 1, 1, 1,
-0.1019414, -1.445847, -2.733485, 1, 1, 1, 1, 1,
-0.1010595, 0.1828646, -1.657905, 1, 1, 1, 1, 1,
-0.08950042, 0.6717137, 0.1741055, 1, 1, 1, 1, 1,
-0.08920728, 0.5892118, -0.1933939, 1, 1, 1, 1, 1,
-0.08822589, 0.9765735, -0.4294559, 1, 1, 1, 1, 1,
-0.08710226, 0.4020937, 0.07947605, 1, 1, 1, 1, 1,
-0.08256221, 0.136516, -1.069595, 0, 0, 1, 1, 1,
-0.08222637, 0.4005699, -1.477416, 1, 0, 0, 1, 1,
-0.08158778, 0.3485998, -1.002346, 1, 0, 0, 1, 1,
-0.07267939, -0.6185207, -3.698281, 1, 0, 0, 1, 1,
-0.07126956, 0.1944483, -0.1606378, 1, 0, 0, 1, 1,
-0.06910694, -1.21862, -2.584873, 1, 0, 0, 1, 1,
-0.06897743, -0.2164246, -1.870437, 0, 0, 0, 1, 1,
-0.06893025, 0.1092818, -2.12155, 0, 0, 0, 1, 1,
-0.0659588, 0.7806053, 0.9864433, 0, 0, 0, 1, 1,
-0.06514107, 0.6829708, -0.6133112, 0, 0, 0, 1, 1,
-0.06401858, 1.752975, 1.25376, 0, 0, 0, 1, 1,
-0.05963496, 0.3416083, -0.6909593, 0, 0, 0, 1, 1,
-0.05679101, 0.9132529, -1.693686, 0, 0, 0, 1, 1,
-0.05675947, -0.5268128, -4.656372, 1, 1, 1, 1, 1,
-0.05671464, 0.4334192, -1.016028, 1, 1, 1, 1, 1,
-0.05471951, -0.8767601, -3.698737, 1, 1, 1, 1, 1,
-0.05378172, -0.9075385, -2.920125, 1, 1, 1, 1, 1,
-0.05207861, -0.6357141, -2.471197, 1, 1, 1, 1, 1,
-0.0509514, 0.532007, 1.233652, 1, 1, 1, 1, 1,
-0.04919821, -0.3838893, -2.768388, 1, 1, 1, 1, 1,
-0.0488811, -1.392364, -5.34976, 1, 1, 1, 1, 1,
-0.04130158, -1.284988, -2.948638, 1, 1, 1, 1, 1,
-0.03734087, -0.4431707, -3.983729, 1, 1, 1, 1, 1,
-0.03428967, -0.4468228, -3.338274, 1, 1, 1, 1, 1,
-0.02950003, 0.3528278, 1.219768, 1, 1, 1, 1, 1,
-0.02748167, 0.1857632, -0.4268861, 1, 1, 1, 1, 1,
-0.02526331, 0.8819326, -0.4825983, 1, 1, 1, 1, 1,
-0.006828759, 0.5330586, 0.90749, 1, 1, 1, 1, 1,
-0.005558029, 1.416294, -0.1649821, 0, 0, 1, 1, 1,
-0.003128354, 1.293944, -0.2061412, 1, 0, 0, 1, 1,
-0.00282207, 1.053642, -0.02057888, 1, 0, 0, 1, 1,
-0.002288544, 1.535533, -0.3931289, 1, 0, 0, 1, 1,
-0.001940549, -2.614124, -2.632501, 1, 0, 0, 1, 1,
0.007425072, 2.182108, 0.5713052, 1, 0, 0, 1, 1,
0.008372331, 0.7943689, 0.3741486, 0, 0, 0, 1, 1,
0.008616781, 0.03297148, -0.5069136, 0, 0, 0, 1, 1,
0.01403251, 0.1599495, 0.2776562, 0, 0, 0, 1, 1,
0.01450252, -0.519726, 1.809425, 0, 0, 0, 1, 1,
0.01632093, 0.4457535, -0.7650034, 0, 0, 0, 1, 1,
0.01650912, 0.6716152, 1.020915, 0, 0, 0, 1, 1,
0.0187715, -0.3757309, 4.150522, 0, 0, 0, 1, 1,
0.02337675, 0.990198, 1.202986, 1, 1, 1, 1, 1,
0.02626667, -0.3446532, 3.025518, 1, 1, 1, 1, 1,
0.03225082, -0.3331794, 4.628332, 1, 1, 1, 1, 1,
0.03398469, 0.1109467, 1.854494, 1, 1, 1, 1, 1,
0.03407083, -0.2617859, 1.695643, 1, 1, 1, 1, 1,
0.03656906, -0.1354906, 2.046844, 1, 1, 1, 1, 1,
0.04135778, 0.9526227, -1.281427, 1, 1, 1, 1, 1,
0.04294395, 0.5198888, 0.4928165, 1, 1, 1, 1, 1,
0.04322213, 0.6550035, -0.6205949, 1, 1, 1, 1, 1,
0.04352799, -0.05829458, 4.355587, 1, 1, 1, 1, 1,
0.04557894, 0.9197236, 0.1758103, 1, 1, 1, 1, 1,
0.04981001, 0.233883, 0.6020139, 1, 1, 1, 1, 1,
0.05683012, 0.2301754, -1.322133, 1, 1, 1, 1, 1,
0.0572645, 1.366612, -0.9177098, 1, 1, 1, 1, 1,
0.05861118, 0.2948339, 0.8252159, 1, 1, 1, 1, 1,
0.05909074, 0.3632746, 0.5721753, 0, 0, 1, 1, 1,
0.06476463, -1.562732, 2.238087, 1, 0, 0, 1, 1,
0.06709519, 1.030945, -0.5319584, 1, 0, 0, 1, 1,
0.07083139, -0.7841685, 3.815326, 1, 0, 0, 1, 1,
0.07088236, 1.258915, -1.879317, 1, 0, 0, 1, 1,
0.07372083, 0.7948177, 0.9272296, 1, 0, 0, 1, 1,
0.08077805, -0.5504299, 3.158578, 0, 0, 0, 1, 1,
0.08135084, -0.5273048, 4.072583, 0, 0, 0, 1, 1,
0.08213005, 1.101951, 1.029521, 0, 0, 0, 1, 1,
0.08547869, -0.2731649, 2.54315, 0, 0, 0, 1, 1,
0.08624794, -0.125411, 2.324266, 0, 0, 0, 1, 1,
0.0930135, 0.1947375, 0.5391093, 0, 0, 0, 1, 1,
0.09341692, 0.910333, 1.90732, 0, 0, 0, 1, 1,
0.09899878, 0.7969932, 0.2139807, 1, 1, 1, 1, 1,
0.1015737, -0.6860273, 3.97566, 1, 1, 1, 1, 1,
0.103872, -0.3965821, 2.152286, 1, 1, 1, 1, 1,
0.1073468, -0.0321126, 1.631685, 1, 1, 1, 1, 1,
0.108211, -0.5928764, 1.932091, 1, 1, 1, 1, 1,
0.1141769, 0.3422397, 0.3536522, 1, 1, 1, 1, 1,
0.1154174, 0.1765907, 0.7326733, 1, 1, 1, 1, 1,
0.1187427, -0.6724665, 3.988463, 1, 1, 1, 1, 1,
0.1247635, -1.087814, 3.109389, 1, 1, 1, 1, 1,
0.1280922, -1.230731, 3.231465, 1, 1, 1, 1, 1,
0.1295601, 2.475624, -1.026639, 1, 1, 1, 1, 1,
0.1300861, 1.3069, 0.09445821, 1, 1, 1, 1, 1,
0.1337896, 0.4223976, -0.02316151, 1, 1, 1, 1, 1,
0.1375084, 0.8161231, -1.978552, 1, 1, 1, 1, 1,
0.1386027, -0.04725906, 1.328934, 1, 1, 1, 1, 1,
0.1581222, 0.6765216, 1.754996, 0, 0, 1, 1, 1,
0.1640147, -0.05463931, 1.979797, 1, 0, 0, 1, 1,
0.1644577, 0.3342679, -0.1283289, 1, 0, 0, 1, 1,
0.1693882, -0.1694124, 4.206568, 1, 0, 0, 1, 1,
0.1729576, 0.4636083, 0.2072122, 1, 0, 0, 1, 1,
0.1752421, -1.252582, 3.743462, 1, 0, 0, 1, 1,
0.1757188, -0.1490763, 1.83645, 0, 0, 0, 1, 1,
0.179043, 0.2446777, 1.26659, 0, 0, 0, 1, 1,
0.1801509, -0.7755299, 3.905697, 0, 0, 0, 1, 1,
0.1803911, 0.6348736, 1.735739, 0, 0, 0, 1, 1,
0.183318, 0.05272913, 0.5418359, 0, 0, 0, 1, 1,
0.1960512, 0.06742185, 2.412777, 0, 0, 0, 1, 1,
0.1966109, 0.07093844, -0.7166119, 0, 0, 0, 1, 1,
0.1997603, -0.7997074, 3.680564, 1, 1, 1, 1, 1,
0.1999437, 0.5914996, 0.004195213, 1, 1, 1, 1, 1,
0.200563, 0.1062256, 1.691392, 1, 1, 1, 1, 1,
0.2011547, -0.01280422, 1.859704, 1, 1, 1, 1, 1,
0.2018923, 0.5114316, 1.585331, 1, 1, 1, 1, 1,
0.2084285, 0.05386617, 0.6650431, 1, 1, 1, 1, 1,
0.2096917, -0.1177995, 2.521564, 1, 1, 1, 1, 1,
0.2132873, 1.889914, 0.8226426, 1, 1, 1, 1, 1,
0.2137165, -0.2064438, 0.4729371, 1, 1, 1, 1, 1,
0.2199434, 1.440343, 0.8653678, 1, 1, 1, 1, 1,
0.2222573, 0.7715508, 0.1074238, 1, 1, 1, 1, 1,
0.2247572, -0.06957929, 2.250728, 1, 1, 1, 1, 1,
0.2301301, 1.355862, -0.717463, 1, 1, 1, 1, 1,
0.230506, -1.107125, 3.051156, 1, 1, 1, 1, 1,
0.2309143, -0.3819211, 2.250315, 1, 1, 1, 1, 1,
0.2332265, 0.6789169, -1.750319, 0, 0, 1, 1, 1,
0.2332428, 0.8139369, 0.09008516, 1, 0, 0, 1, 1,
0.2484959, -0.5017618, 0.9558093, 1, 0, 0, 1, 1,
0.2525126, 0.3771853, 1.887478, 1, 0, 0, 1, 1,
0.2547773, -0.7653821, 2.885313, 1, 0, 0, 1, 1,
0.2552133, -0.3386448, 2.546658, 1, 0, 0, 1, 1,
0.2567038, 0.5026082, 0.3907545, 0, 0, 0, 1, 1,
0.2601552, 0.3318367, 0.1056785, 0, 0, 0, 1, 1,
0.2663909, -0.6221398, 1.360556, 0, 0, 0, 1, 1,
0.2690135, -0.8764927, 2.523987, 0, 0, 0, 1, 1,
0.2693798, -0.1716831, 3.406701, 0, 0, 0, 1, 1,
0.2709067, 1.242165, 0.2733071, 0, 0, 0, 1, 1,
0.2747598, -1.019335, 5.583975, 0, 0, 0, 1, 1,
0.2804466, -0.01055938, 2.176651, 1, 1, 1, 1, 1,
0.2810601, 1.618166, -0.566009, 1, 1, 1, 1, 1,
0.2863054, -0.6152003, 4.805604, 1, 1, 1, 1, 1,
0.2893739, -1.379281, 2.146646, 1, 1, 1, 1, 1,
0.2942615, 0.1645191, 0.449138, 1, 1, 1, 1, 1,
0.2999737, -0.9085063, 1.326898, 1, 1, 1, 1, 1,
0.3039564, -0.340529, 4.201502, 1, 1, 1, 1, 1,
0.3064373, -2.005301, 3.173, 1, 1, 1, 1, 1,
0.3115555, 2.408159, 0.1300666, 1, 1, 1, 1, 1,
0.3148492, 0.8387792, -0.1385156, 1, 1, 1, 1, 1,
0.3154901, 1.689359, 1.972497, 1, 1, 1, 1, 1,
0.3183627, -0.5773021, 1.908677, 1, 1, 1, 1, 1,
0.3218103, 0.535351, 0.06262019, 1, 1, 1, 1, 1,
0.3234107, -1.237183, 4.723512, 1, 1, 1, 1, 1,
0.3320348, -2.81697, 1.795178, 1, 1, 1, 1, 1,
0.3325106, -0.1159859, -0.4063512, 0, 0, 1, 1, 1,
0.3336167, -0.4666278, 4.69688, 1, 0, 0, 1, 1,
0.3370522, -0.539046, 2.766475, 1, 0, 0, 1, 1,
0.3397393, -2.373704, 2.728989, 1, 0, 0, 1, 1,
0.3411731, -0.8178256, 2.39508, 1, 0, 0, 1, 1,
0.3425508, 0.06545638, 2.47217, 1, 0, 0, 1, 1,
0.3467831, 0.9338984, -0.1840841, 0, 0, 0, 1, 1,
0.3476833, -0.8508849, 2.275291, 0, 0, 0, 1, 1,
0.350309, 2.926549, -0.3928337, 0, 0, 0, 1, 1,
0.3526687, 0.149248, 2.445326, 0, 0, 0, 1, 1,
0.3540745, -0.6369971, 2.024438, 0, 0, 0, 1, 1,
0.356584, 0.8793595, 0.7344315, 0, 0, 0, 1, 1,
0.358815, -1.237168, 1.014399, 0, 0, 0, 1, 1,
0.3606409, 1.323167, 0.2653265, 1, 1, 1, 1, 1,
0.3607195, -1.636189, 2.653223, 1, 1, 1, 1, 1,
0.3669062, 2.022867, -0.7427971, 1, 1, 1, 1, 1,
0.3680768, -0.5217683, 4.366771, 1, 1, 1, 1, 1,
0.3681739, 1.313595, 1.983059, 1, 1, 1, 1, 1,
0.3711607, -1.588013, 2.563181, 1, 1, 1, 1, 1,
0.3732671, 0.3586603, -0.6838977, 1, 1, 1, 1, 1,
0.3751211, 0.8670295, 0.8421402, 1, 1, 1, 1, 1,
0.3761252, -0.3588704, 0.2901255, 1, 1, 1, 1, 1,
0.3778839, 0.742943, 0.04145363, 1, 1, 1, 1, 1,
0.3811108, -0.4996349, 2.078425, 1, 1, 1, 1, 1,
0.3830094, 0.5089781, -0.0422653, 1, 1, 1, 1, 1,
0.3837182, -0.865749, 2.490633, 1, 1, 1, 1, 1,
0.3837734, 0.7281096, 0.5667342, 1, 1, 1, 1, 1,
0.3886477, 0.08027753, 2.0418, 1, 1, 1, 1, 1,
0.3980034, -0.694603, 2.431055, 0, 0, 1, 1, 1,
0.4029743, -0.7758216, 3.062126, 1, 0, 0, 1, 1,
0.4062226, -0.6318422, 2.485153, 1, 0, 0, 1, 1,
0.407001, 0.6102586, 0.6737971, 1, 0, 0, 1, 1,
0.4131002, 0.4033484, 1.054671, 1, 0, 0, 1, 1,
0.4145109, -0.4200148, 3.114794, 1, 0, 0, 1, 1,
0.4166411, 1.053931, -1.716916, 0, 0, 0, 1, 1,
0.4170862, 0.2396526, 1.89793, 0, 0, 0, 1, 1,
0.4186644, -0.2918102, 2.507645, 0, 0, 0, 1, 1,
0.423746, -0.687149, 2.716629, 0, 0, 0, 1, 1,
0.4250806, -0.7485058, 1.681283, 0, 0, 0, 1, 1,
0.42546, 1.120728, 2.37038, 0, 0, 0, 1, 1,
0.4265276, 1.605654, -0.5872341, 0, 0, 0, 1, 1,
0.4297464, -0.5356007, 1.158277, 1, 1, 1, 1, 1,
0.4305733, -0.02822853, 3.593474, 1, 1, 1, 1, 1,
0.434595, 1.018873, 2.624626, 1, 1, 1, 1, 1,
0.4388429, -1.335414, 4.626987, 1, 1, 1, 1, 1,
0.4399628, -0.3726839, 2.769247, 1, 1, 1, 1, 1,
0.4402494, 0.894086, -0.4731623, 1, 1, 1, 1, 1,
0.4408984, -0.2556032, 3.037721, 1, 1, 1, 1, 1,
0.4499202, 0.2026576, 1.06315, 1, 1, 1, 1, 1,
0.4516482, 1.265575, -2.30964, 1, 1, 1, 1, 1,
0.4518648, 1.629642, 0.1797031, 1, 1, 1, 1, 1,
0.4747328, 0.1344699, 0.6494769, 1, 1, 1, 1, 1,
0.4754242, 0.2440447, 1.036327, 1, 1, 1, 1, 1,
0.4792151, 0.3804929, 1.822337, 1, 1, 1, 1, 1,
0.4827811, -0.8353865, 1.763185, 1, 1, 1, 1, 1,
0.4830696, 0.1231163, 2.285697, 1, 1, 1, 1, 1,
0.4832454, -0.7700553, 2.612525, 0, 0, 1, 1, 1,
0.4835164, -0.4618575, 4.348787, 1, 0, 0, 1, 1,
0.4838518, -0.4349074, 3.582439, 1, 0, 0, 1, 1,
0.4931777, -0.06528874, 1.691478, 1, 0, 0, 1, 1,
0.4933162, 0.9315027, 1.160703, 1, 0, 0, 1, 1,
0.4955514, -0.4022062, 2.434741, 1, 0, 0, 1, 1,
0.496525, -0.08781879, 1.500154, 0, 0, 0, 1, 1,
0.4981032, -0.9605268, 4.625347, 0, 0, 0, 1, 1,
0.5006247, 0.1975739, 3.081371, 0, 0, 0, 1, 1,
0.5023298, -1.221903, 3.261188, 0, 0, 0, 1, 1,
0.5057021, 0.6461892, -1.033107, 0, 0, 0, 1, 1,
0.5086686, -0.3244753, 2.121733, 0, 0, 0, 1, 1,
0.5101327, 0.8648657, 1.534794, 0, 0, 0, 1, 1,
0.5117558, -0.2652912, 2.845374, 1, 1, 1, 1, 1,
0.5140901, 0.1815684, -0.1847886, 1, 1, 1, 1, 1,
0.5163626, -0.07199816, 2.112, 1, 1, 1, 1, 1,
0.5202982, -0.3082592, 0.4689341, 1, 1, 1, 1, 1,
0.5279205, 0.4137613, 0.964563, 1, 1, 1, 1, 1,
0.5283793, -0.01875659, 1.456249, 1, 1, 1, 1, 1,
0.5307417, 1.697172, 1.259474, 1, 1, 1, 1, 1,
0.5314831, 2.953001, 0.9240871, 1, 1, 1, 1, 1,
0.5329026, -1.201279, 2.171944, 1, 1, 1, 1, 1,
0.5338351, -0.02582533, 0.9853967, 1, 1, 1, 1, 1,
0.5340183, -1.07581, 4.201872, 1, 1, 1, 1, 1,
0.5376487, -1.216958, 1.771081, 1, 1, 1, 1, 1,
0.5444866, -1.734852, 1.643088, 1, 1, 1, 1, 1,
0.5446942, 0.2942957, 0.4980639, 1, 1, 1, 1, 1,
0.5534061, 0.1410698, 0.1004453, 1, 1, 1, 1, 1,
0.5540001, 1.108406, -0.1445197, 0, 0, 1, 1, 1,
0.5591009, 0.2797956, 0.5842813, 1, 0, 0, 1, 1,
0.5602828, -0.3888773, 1.577969, 1, 0, 0, 1, 1,
0.5611216, -0.6077299, 2.852249, 1, 0, 0, 1, 1,
0.561744, -0.3448707, 1.791264, 1, 0, 0, 1, 1,
0.5640598, 0.1918797, 3.657273, 1, 0, 0, 1, 1,
0.564419, 0.3739438, 1.693283, 0, 0, 0, 1, 1,
0.565537, 0.0286119, 0.7363488, 0, 0, 0, 1, 1,
0.5709527, 2.450952, 0.4201621, 0, 0, 0, 1, 1,
0.5747075, -0.7199427, 0.8594171, 0, 0, 0, 1, 1,
0.5802727, 0.2853451, 1.867963, 0, 0, 0, 1, 1,
0.5848557, 0.6539634, 0.4847555, 0, 0, 0, 1, 1,
0.5850753, -0.47578, 4.503779, 0, 0, 0, 1, 1,
0.5867149, 0.08296946, 3.865524, 1, 1, 1, 1, 1,
0.5875633, -0.2119368, 3.028112, 1, 1, 1, 1, 1,
0.5902964, 1.017934, 1.041899, 1, 1, 1, 1, 1,
0.5968992, 0.2050078, 2.319643, 1, 1, 1, 1, 1,
0.598401, -1.435466, 2.42379, 1, 1, 1, 1, 1,
0.6015133, -0.05279566, 1.711286, 1, 1, 1, 1, 1,
0.602208, -0.04121347, 2.153055, 1, 1, 1, 1, 1,
0.6025714, -0.6231274, 1.582283, 1, 1, 1, 1, 1,
0.6049687, -0.597294, 2.526, 1, 1, 1, 1, 1,
0.619122, -0.7204045, 3.174342, 1, 1, 1, 1, 1,
0.621675, -1.949779, 1.962087, 1, 1, 1, 1, 1,
0.6237339, 0.2773389, 0.4632591, 1, 1, 1, 1, 1,
0.6243836, 1.597753, 0.1082379, 1, 1, 1, 1, 1,
0.6258385, 0.3685711, 1.156637, 1, 1, 1, 1, 1,
0.6263046, 0.7026142, 0.3878739, 1, 1, 1, 1, 1,
0.6270208, 0.09773763, 2.209544, 0, 0, 1, 1, 1,
0.6305838, -0.9110035, 3.773578, 1, 0, 0, 1, 1,
0.6370813, -0.05203927, 1.40374, 1, 0, 0, 1, 1,
0.6384565, -0.3925919, 1.424326, 1, 0, 0, 1, 1,
0.6408985, -2.648975, 2.723576, 1, 0, 0, 1, 1,
0.6437973, 1.017322, -0.1299301, 1, 0, 0, 1, 1,
0.6555359, 0.9656627, 0.9901115, 0, 0, 0, 1, 1,
0.6557671, -0.2249915, 2.396087, 0, 0, 0, 1, 1,
0.6571813, -0.7045803, 1.826168, 0, 0, 0, 1, 1,
0.6574859, -0.1200898, 3.015345, 0, 0, 0, 1, 1,
0.6576208, -0.9532942, 1.419881, 0, 0, 0, 1, 1,
0.6577474, -0.4974385, 1.187816, 0, 0, 0, 1, 1,
0.6609644, 1.58744, 0.135753, 0, 0, 0, 1, 1,
0.6630237, 0.1427039, 0.9479323, 1, 1, 1, 1, 1,
0.6634024, 0.6569909, -0.06073653, 1, 1, 1, 1, 1,
0.6642567, 0.6066324, 0.3988601, 1, 1, 1, 1, 1,
0.6648883, 0.8725412, 0.8585824, 1, 1, 1, 1, 1,
0.6669349, 0.8174371, 1.954952, 1, 1, 1, 1, 1,
0.6746346, 1.3245, 0.778731, 1, 1, 1, 1, 1,
0.6751407, -1.399651, 3.712857, 1, 1, 1, 1, 1,
0.6802472, -0.7294853, 4.118594, 1, 1, 1, 1, 1,
0.6812765, 0.2158864, 0.03666554, 1, 1, 1, 1, 1,
0.6818272, -1.52849, 0.7544968, 1, 1, 1, 1, 1,
0.6837744, 1.292668, -1.652507, 1, 1, 1, 1, 1,
0.6888884, 0.6691492, 0.3347928, 1, 1, 1, 1, 1,
0.69184, 1.388163, -0.7676907, 1, 1, 1, 1, 1,
0.6944314, -1.223001, 2.722501, 1, 1, 1, 1, 1,
0.6971468, -0.5781345, 1.110464, 1, 1, 1, 1, 1,
0.6978825, 1.571532, 0.6015704, 0, 0, 1, 1, 1,
0.7032724, -0.2652805, 2.802371, 1, 0, 0, 1, 1,
0.7044873, -1.957479, 3.182413, 1, 0, 0, 1, 1,
0.7068592, -0.9264312, 3.499903, 1, 0, 0, 1, 1,
0.7121682, -1.222973, 2.344891, 1, 0, 0, 1, 1,
0.7161397, -0.660866, 2.437739, 1, 0, 0, 1, 1,
0.7185118, -0.541727, 2.950313, 0, 0, 0, 1, 1,
0.7202905, 0.1255188, 1.903944, 0, 0, 0, 1, 1,
0.7213888, 0.9610272, 0.1210936, 0, 0, 0, 1, 1,
0.7277794, 1.743688, 0.2797372, 0, 0, 0, 1, 1,
0.7292243, -0.993688, 2.803919, 0, 0, 0, 1, 1,
0.730428, 0.1792886, 2.428077, 0, 0, 0, 1, 1,
0.7308327, -0.03871818, 0.5995576, 0, 0, 0, 1, 1,
0.7338805, -0.1584261, 2.114665, 1, 1, 1, 1, 1,
0.7356447, 0.3526662, 0.8705336, 1, 1, 1, 1, 1,
0.7358741, -2.095927, 2.298899, 1, 1, 1, 1, 1,
0.7379577, 1.718393, 1.102206, 1, 1, 1, 1, 1,
0.7391942, -0.9682032, 1.221191, 1, 1, 1, 1, 1,
0.7428555, -0.6848544, 3.584671, 1, 1, 1, 1, 1,
0.7430855, -1.170004, 3.113105, 1, 1, 1, 1, 1,
0.7444632, 0.1470302, 1.491303, 1, 1, 1, 1, 1,
0.7500984, -1.591982, 3.980675, 1, 1, 1, 1, 1,
0.75042, -0.7420405, 1.907895, 1, 1, 1, 1, 1,
0.7508921, 1.999404, 1.450131, 1, 1, 1, 1, 1,
0.7515313, -0.876291, 3.646315, 1, 1, 1, 1, 1,
0.7547346, 0.8885618, 1.109335, 1, 1, 1, 1, 1,
0.7560145, 0.6057705, 0.8738591, 1, 1, 1, 1, 1,
0.7569711, -0.3468764, 3.327511, 1, 1, 1, 1, 1,
0.7612937, -1.142555, 2.514317, 0, 0, 1, 1, 1,
0.7620757, 0.9546003, -0.8453436, 1, 0, 0, 1, 1,
0.7663342, -0.1868577, 2.064517, 1, 0, 0, 1, 1,
0.7762342, -0.4990658, 1.580581, 1, 0, 0, 1, 1,
0.777957, 1.179535, 1.365412, 1, 0, 0, 1, 1,
0.7785655, 0.5645454, 0.2718024, 1, 0, 0, 1, 1,
0.779312, -0.4722271, 2.452684, 0, 0, 0, 1, 1,
0.7862883, 0.1604462, 0.3245312, 0, 0, 0, 1, 1,
0.7917175, 0.01290541, 0.8034429, 0, 0, 0, 1, 1,
0.800631, 1.504166, 1.067429, 0, 0, 0, 1, 1,
0.8023351, -0.4353036, 1.504901, 0, 0, 0, 1, 1,
0.807158, 0.8842027, 0.8748456, 0, 0, 0, 1, 1,
0.810241, 0.4215891, 0.5998966, 0, 0, 0, 1, 1,
0.8117931, 1.270735, 0.6782684, 1, 1, 1, 1, 1,
0.8134013, -0.2568243, 2.575368, 1, 1, 1, 1, 1,
0.816747, 1.647939, 0.8467456, 1, 1, 1, 1, 1,
0.8168169, -0.3983484, 1.194781, 1, 1, 1, 1, 1,
0.8227007, -0.5988505, 1.93908, 1, 1, 1, 1, 1,
0.8270369, -1.385349, 1.557339, 1, 1, 1, 1, 1,
0.8289729, -0.08287932, 0.8111479, 1, 1, 1, 1, 1,
0.8334675, -0.9087853, 2.401683, 1, 1, 1, 1, 1,
0.8371704, 0.2932098, 2.042004, 1, 1, 1, 1, 1,
0.8375719, -0.6840399, 2.624444, 1, 1, 1, 1, 1,
0.839522, -0.09203421, 3.792031, 1, 1, 1, 1, 1,
0.8435506, 1.822758, 0.1475812, 1, 1, 1, 1, 1,
0.8471956, 1.371548, -0.2070201, 1, 1, 1, 1, 1,
0.8475088, 0.608588, 1.037073, 1, 1, 1, 1, 1,
0.8502081, 2.075647, 1.306364, 1, 1, 1, 1, 1,
0.8513077, -0.4117742, 1.515525, 0, 0, 1, 1, 1,
0.8532852, -1.896425, 4.381704, 1, 0, 0, 1, 1,
0.8536906, -1.450749, 3.869009, 1, 0, 0, 1, 1,
0.857721, 0.8884248, 1.839238, 1, 0, 0, 1, 1,
0.861391, -0.2640561, 1.642842, 1, 0, 0, 1, 1,
0.864193, 0.7371928, 0.4291731, 1, 0, 0, 1, 1,
0.8706807, 0.5299549, 2.935323, 0, 0, 0, 1, 1,
0.8716589, 0.2092351, 1.62876, 0, 0, 0, 1, 1,
0.8749787, 0.5346662, 1.671921, 0, 0, 0, 1, 1,
0.878601, -0.6491578, 3.175314, 0, 0, 0, 1, 1,
0.8786648, 0.5982952, 0.6916053, 0, 0, 0, 1, 1,
0.8843191, -1.390163, 3.547043, 0, 0, 0, 1, 1,
0.8852232, 0.8127103, -0.3373959, 0, 0, 0, 1, 1,
0.8919483, -0.5729536, 2.002592, 1, 1, 1, 1, 1,
0.8921767, 1.276972, 2.337806, 1, 1, 1, 1, 1,
0.8922201, -0.04824525, 3.342659, 1, 1, 1, 1, 1,
0.8935527, -0.5193235, 3.484799, 1, 1, 1, 1, 1,
0.8977963, 0.5923595, -0.9094414, 1, 1, 1, 1, 1,
0.908533, -1.829858, 2.343341, 1, 1, 1, 1, 1,
0.9246861, -0.3945287, 0.6838807, 1, 1, 1, 1, 1,
0.9293365, -0.2522049, 2.724546, 1, 1, 1, 1, 1,
0.9380142, -0.4751656, 1.688257, 1, 1, 1, 1, 1,
0.9451067, 1.100658, 2.253276, 1, 1, 1, 1, 1,
0.9468396, -0.6589329, 0.9598696, 1, 1, 1, 1, 1,
0.9480129, 0.3531222, -0.5672603, 1, 1, 1, 1, 1,
0.949858, -0.5037436, 1.090089, 1, 1, 1, 1, 1,
0.9522386, -0.5048593, 2.417758, 1, 1, 1, 1, 1,
0.9663563, -0.6583322, 3.351634, 1, 1, 1, 1, 1,
0.976023, -1.57772, 2.833243, 0, 0, 1, 1, 1,
0.995935, 0.5379743, 1.120211, 1, 0, 0, 1, 1,
1.006295, 0.1797442, 0.7732075, 1, 0, 0, 1, 1,
1.008238, 0.09161849, 2.478514, 1, 0, 0, 1, 1,
1.009662, 0.1545722, 0.2404163, 1, 0, 0, 1, 1,
1.012182, -0.02722112, 2.967161, 1, 0, 0, 1, 1,
1.018744, 1.032466, -0.9234875, 0, 0, 0, 1, 1,
1.019835, 0.4839376, 1.57899, 0, 0, 0, 1, 1,
1.019855, -1.087596, 1.563078, 0, 0, 0, 1, 1,
1.025734, 0.54088, 1.051346, 0, 0, 0, 1, 1,
1.02844, -0.6950035, 1.923816, 0, 0, 0, 1, 1,
1.029177, 1.438283, -0.3658997, 0, 0, 0, 1, 1,
1.03229, -0.9928134, 3.899846, 0, 0, 0, 1, 1,
1.035619, 0.8787382, 0.3727244, 1, 1, 1, 1, 1,
1.036127, 3.148869, 0.1427369, 1, 1, 1, 1, 1,
1.037342, 0.1973203, 0.8059171, 1, 1, 1, 1, 1,
1.054115, 0.4391891, 0.9955537, 1, 1, 1, 1, 1,
1.061204, 0.2203236, 1.682773, 1, 1, 1, 1, 1,
1.064006, -1.804968, 3.40918, 1, 1, 1, 1, 1,
1.065762, 0.02182527, 1.67621, 1, 1, 1, 1, 1,
1.074714, -1.17408, 2.935253, 1, 1, 1, 1, 1,
1.079477, -0.3946519, 1.028597, 1, 1, 1, 1, 1,
1.09197, -0.1013254, 3.024748, 1, 1, 1, 1, 1,
1.096046, 2.678479, 0.4346983, 1, 1, 1, 1, 1,
1.098843, -1.45312, 3.656733, 1, 1, 1, 1, 1,
1.101081, -0.9148794, 3.912542, 1, 1, 1, 1, 1,
1.105301, -0.4111468, 1.424657, 1, 1, 1, 1, 1,
1.110291, 1.064474, 1.362074, 1, 1, 1, 1, 1,
1.113206, -0.1871476, 2.198051, 0, 0, 1, 1, 1,
1.116438, -0.2002802, 0.2893154, 1, 0, 0, 1, 1,
1.124834, -1.909516, 4.182868, 1, 0, 0, 1, 1,
1.125573, 0.7908053, 0.08648907, 1, 0, 0, 1, 1,
1.132836, 0.8349534, 0.5959028, 1, 0, 0, 1, 1,
1.136125, -1.660666, 1.98099, 1, 0, 0, 1, 1,
1.139144, 0.6695678, 1.314022, 0, 0, 0, 1, 1,
1.143142, 2.813806, -0.3519854, 0, 0, 0, 1, 1,
1.150286, 0.3308343, 0.7094805, 0, 0, 0, 1, 1,
1.154476, 0.2463511, 3.607371, 0, 0, 0, 1, 1,
1.177571, -0.5685335, 1.534398, 0, 0, 0, 1, 1,
1.185494, 0.1805177, 2.22746, 0, 0, 0, 1, 1,
1.185897, -1.323649, 2.536997, 0, 0, 0, 1, 1,
1.18738, -1.313681, 4.087025, 1, 1, 1, 1, 1,
1.199732, 0.2188375, 0.02812818, 1, 1, 1, 1, 1,
1.200688, 1.683853, 0.4212087, 1, 1, 1, 1, 1,
1.203931, 1.088356, 0.6830486, 1, 1, 1, 1, 1,
1.211116, 1.547767, 1.059714, 1, 1, 1, 1, 1,
1.213449, 1.716699, 0.08539277, 1, 1, 1, 1, 1,
1.224477, -1.063399, 2.142985, 1, 1, 1, 1, 1,
1.230633, 1.669091, -0.9820032, 1, 1, 1, 1, 1,
1.232381, -0.7342226, 0.8860914, 1, 1, 1, 1, 1,
1.236305, 0.7379832, 1.158952, 1, 1, 1, 1, 1,
1.243005, 1.404978, 0.7370911, 1, 1, 1, 1, 1,
1.247604, -1.149481, 1.386551, 1, 1, 1, 1, 1,
1.248654, 0.9715438, 0.9912816, 1, 1, 1, 1, 1,
1.249679, -0.1840222, -0.5928763, 1, 1, 1, 1, 1,
1.255409, -0.2683343, 1.874858, 1, 1, 1, 1, 1,
1.264681, -1.331077, 1.68933, 0, 0, 1, 1, 1,
1.268798, 1.297948, 0.4212759, 1, 0, 0, 1, 1,
1.27108, -0.1525435, 2.855288, 1, 0, 0, 1, 1,
1.275845, 0.5244775, 1.226927, 1, 0, 0, 1, 1,
1.28274, 0.08901401, 2.417489, 1, 0, 0, 1, 1,
1.287262, 2.75198, 0.8159077, 1, 0, 0, 1, 1,
1.289319, 1.675936, -0.7134086, 0, 0, 0, 1, 1,
1.289553, -0.6623774, 2.228153, 0, 0, 0, 1, 1,
1.290365, -0.4032041, 1.910997, 0, 0, 0, 1, 1,
1.297071, 0.8092686, 1.963628, 0, 0, 0, 1, 1,
1.304919, -0.175349, 0.7551626, 0, 0, 0, 1, 1,
1.306167, -0.1241911, -0.3275683, 0, 0, 0, 1, 1,
1.316603, 1.105104, 0.1135008, 0, 0, 0, 1, 1,
1.335073, -1.245001, 2.752607, 1, 1, 1, 1, 1,
1.345364, -0.3893141, 3.264202, 1, 1, 1, 1, 1,
1.347585, -2.302257, 1.226741, 1, 1, 1, 1, 1,
1.356797, -0.5839094, 2.11713, 1, 1, 1, 1, 1,
1.378655, -1.720515, 2.588965, 1, 1, 1, 1, 1,
1.379791, 0.6386933, 0.4104451, 1, 1, 1, 1, 1,
1.383367, -0.7052311, 0.8134913, 1, 1, 1, 1, 1,
1.393471, 0.2093903, 1.967128, 1, 1, 1, 1, 1,
1.396304, -1.318858, 4.120642, 1, 1, 1, 1, 1,
1.397536, 0.1627074, 2.287313, 1, 1, 1, 1, 1,
1.403313, 0.04116001, 2.994426, 1, 1, 1, 1, 1,
1.408195, -0.816435, 3.511024, 1, 1, 1, 1, 1,
1.427343, -0.8632153, 2.261037, 1, 1, 1, 1, 1,
1.428108, -1.136516, 1.514869, 1, 1, 1, 1, 1,
1.435024, -0.4262746, 2.763812, 1, 1, 1, 1, 1,
1.43552, -0.6053508, 3.504795, 0, 0, 1, 1, 1,
1.436637, 0.07300017, 1.733794, 1, 0, 0, 1, 1,
1.439946, -1.952473, 3.103634, 1, 0, 0, 1, 1,
1.467247, -0.9887233, 3.059863, 1, 0, 0, 1, 1,
1.474756, 0.08820537, 1.630334, 1, 0, 0, 1, 1,
1.480009, -0.2180727, 1.223583, 1, 0, 0, 1, 1,
1.484101, -0.6474221, 0.3201362, 0, 0, 0, 1, 1,
1.484604, -1.333707, 1.616009, 0, 0, 0, 1, 1,
1.489314, -0.2512407, 3.608109, 0, 0, 0, 1, 1,
1.494038, -1.255194, 1.735753, 0, 0, 0, 1, 1,
1.495152, -0.2291998, 2.612748, 0, 0, 0, 1, 1,
1.511186, 1.583499, 0.3069089, 0, 0, 0, 1, 1,
1.538748, 0.1837057, 1.13257, 0, 0, 0, 1, 1,
1.540518, -0.6931043, 1.190584, 1, 1, 1, 1, 1,
1.545325, 0.1212623, 1.545287, 1, 1, 1, 1, 1,
1.54805, 0.2817041, 2.545124, 1, 1, 1, 1, 1,
1.554473, 1.681911, 2.111981, 1, 1, 1, 1, 1,
1.570019, 1.685534, 2.356434, 1, 1, 1, 1, 1,
1.581617, -1.533483, 2.182895, 1, 1, 1, 1, 1,
1.596902, 0.09381394, 1.970408, 1, 1, 1, 1, 1,
1.614668, -0.3840309, 1.510192, 1, 1, 1, 1, 1,
1.629133, -1.028638, 3.640988, 1, 1, 1, 1, 1,
1.647907, -0.9210156, 1.198318, 1, 1, 1, 1, 1,
1.654158, 0.06229172, 1.587319, 1, 1, 1, 1, 1,
1.659552, -0.393811, 1.180631, 1, 1, 1, 1, 1,
1.661313, 0.272717, 1.892447, 1, 1, 1, 1, 1,
1.670392, -0.9095485, 0.8489708, 1, 1, 1, 1, 1,
1.671573, -1.079838, 0.8743712, 1, 1, 1, 1, 1,
1.675939, 1.119617, 1.215688, 0, 0, 1, 1, 1,
1.678167, -0.3246557, 0.7406641, 1, 0, 0, 1, 1,
1.694645, 0.7477022, 0.4084261, 1, 0, 0, 1, 1,
1.709495, 0.9668609, 0.4587729, 1, 0, 0, 1, 1,
1.730472, -0.8523397, 1.994595, 1, 0, 0, 1, 1,
1.75261, 0.2936754, 0.1788813, 1, 0, 0, 1, 1,
1.756507, 0.2359064, 2.164225, 0, 0, 0, 1, 1,
1.761157, 2.209272, 2.152624, 0, 0, 0, 1, 1,
1.765144, 0.2347961, 1.278088, 0, 0, 0, 1, 1,
1.769617, -1.136097, 2.825558, 0, 0, 0, 1, 1,
1.771961, 0.2563851, -0.5392204, 0, 0, 0, 1, 1,
1.789557, -0.6307607, 3.753353, 0, 0, 0, 1, 1,
1.81526, 0.07239736, 0.3105476, 0, 0, 0, 1, 1,
1.849042, -1.16768, 2.833857, 1, 1, 1, 1, 1,
1.850187, 0.8726088, 1.891119, 1, 1, 1, 1, 1,
1.876976, -0.2574926, 0.7166502, 1, 1, 1, 1, 1,
1.883204, 0.2668947, 1.821453, 1, 1, 1, 1, 1,
1.88572, 1.480187, 0.7582025, 1, 1, 1, 1, 1,
1.897431, 1.219281, 2.671192, 1, 1, 1, 1, 1,
1.906101, -0.5782123, 2.455682, 1, 1, 1, 1, 1,
1.922292, 0.3786643, 1.535051, 1, 1, 1, 1, 1,
1.931134, -0.08035561, 0.9084498, 1, 1, 1, 1, 1,
1.938826, -1.455371, 3.44515, 1, 1, 1, 1, 1,
1.944319, 0.4835376, 1.345626, 1, 1, 1, 1, 1,
1.946227, 0.03655136, 1.217926, 1, 1, 1, 1, 1,
1.966629, -1.15109, 1.458795, 1, 1, 1, 1, 1,
1.977143, -1.372875, 2.089207, 1, 1, 1, 1, 1,
2.000568, 0.720027, 1.19683, 1, 1, 1, 1, 1,
2.003122, -1.151456, 2.841383, 0, 0, 1, 1, 1,
2.003884, -1.499262, 1.815238, 1, 0, 0, 1, 1,
2.011048, 1.506609, -0.02853899, 1, 0, 0, 1, 1,
2.027668, 1.549476, 0.09604183, 1, 0, 0, 1, 1,
2.047102, -0.207552, 2.757448, 1, 0, 0, 1, 1,
2.076594, -0.8297439, 2.362874, 1, 0, 0, 1, 1,
2.116039, -1.24387, 2.441583, 0, 0, 0, 1, 1,
2.141816, -0.1205459, 2.483958, 0, 0, 0, 1, 1,
2.17615, 0.4591842, 4.694636, 0, 0, 0, 1, 1,
2.191671, -0.6874734, 1.561092, 0, 0, 0, 1, 1,
2.283077, -1.400038, 2.13448, 0, 0, 0, 1, 1,
2.299923, 0.6572302, 1.991266, 0, 0, 0, 1, 1,
2.317101, -0.2257446, 0.657061, 0, 0, 0, 1, 1,
2.345356, -0.4501978, 1.058495, 1, 1, 1, 1, 1,
2.701548, -0.4741849, 1.341942, 1, 1, 1, 1, 1,
2.770907, 0.7794292, 2.146943, 1, 1, 1, 1, 1,
2.778212, 2.717352, 3.591263, 1, 1, 1, 1, 1,
2.955841, 0.04200898, 1.677783, 1, 1, 1, 1, 1,
3.144869, -0.3264993, 0.8229545, 1, 1, 1, 1, 1,
3.486912, 0.720437, 0.7438984, 1, 1, 1, 1, 1
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
var radius = 9.734614;
var distance = 34.19242;
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
mvMatrix.translate( 0.04828453, -0.1578909, -0.1171076 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19242);
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
