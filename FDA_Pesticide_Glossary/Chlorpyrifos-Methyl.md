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
-3.228297, 0.3173604, -1.592195, 1, 0, 0, 1,
-3.089786, 1.067547, -1.592904, 1, 0.007843138, 0, 1,
-2.839047, 0.9828352, -1.432805, 1, 0.01176471, 0, 1,
-2.707356, 1.06962, -0.7454985, 1, 0.01960784, 0, 1,
-2.669174, 1.461496, -2.313901, 1, 0.02352941, 0, 1,
-2.466027, 1.365983, 0.3526385, 1, 0.03137255, 0, 1,
-2.459134, -0.8923116, -2.852853, 1, 0.03529412, 0, 1,
-2.45696, -0.7014374, -1.74843, 1, 0.04313726, 0, 1,
-2.40373, -1.355324, -1.850848, 1, 0.04705882, 0, 1,
-2.4029, 1.14138, 0.1509162, 1, 0.05490196, 0, 1,
-2.392196, 0.4925625, -2.193583, 1, 0.05882353, 0, 1,
-2.373856, 0.02330265, -1.992181, 1, 0.06666667, 0, 1,
-2.35856, -0.4720338, -1.064583, 1, 0.07058824, 0, 1,
-2.348085, 0.6065356, -1.456524, 1, 0.07843138, 0, 1,
-2.316492, 0.3202235, -1.990039, 1, 0.08235294, 0, 1,
-2.306219, 1.122865, -0.9089175, 1, 0.09019608, 0, 1,
-2.286639, -1.426338, -1.746031, 1, 0.09411765, 0, 1,
-2.278496, 0.02478122, -2.692332, 1, 0.1019608, 0, 1,
-2.124935, 0.1831972, -0.6400994, 1, 0.1098039, 0, 1,
-2.098172, -1.785598, -1.949413, 1, 0.1137255, 0, 1,
-2.075299, -1.562703, -1.630272, 1, 0.1215686, 0, 1,
-2.069499, 0.04522744, -1.740666, 1, 0.1254902, 0, 1,
-2.028163, -0.6306998, -0.4647065, 1, 0.1333333, 0, 1,
-1.971023, -0.5189292, -4.124734, 1, 0.1372549, 0, 1,
-1.963153, 0.5399747, -1.471844, 1, 0.145098, 0, 1,
-1.916962, 0.5519626, -2.404578, 1, 0.1490196, 0, 1,
-1.916446, 0.7044417, -1.155255, 1, 0.1568628, 0, 1,
-1.91149, 1.033062, -2.067563, 1, 0.1607843, 0, 1,
-1.908303, -0.2545795, -1.029981, 1, 0.1686275, 0, 1,
-1.895054, -0.05816988, -1.351309, 1, 0.172549, 0, 1,
-1.874694, -1.430972, -1.476599, 1, 0.1803922, 0, 1,
-1.86017, -0.4850493, -1.575303, 1, 0.1843137, 0, 1,
-1.852471, -0.108407, -0.975684, 1, 0.1921569, 0, 1,
-1.850636, 0.4253922, -1.622543, 1, 0.1960784, 0, 1,
-1.833013, 1.313493, -1.599614, 1, 0.2039216, 0, 1,
-1.789914, 1.32607, -1.339481, 1, 0.2117647, 0, 1,
-1.765117, 1.072069, -0.7241464, 1, 0.2156863, 0, 1,
-1.752938, -0.522741, -1.598254, 1, 0.2235294, 0, 1,
-1.749939, -0.01652711, -1.43338, 1, 0.227451, 0, 1,
-1.746901, 1.087252, -1.49549, 1, 0.2352941, 0, 1,
-1.739199, -0.6090062, -2.124439, 1, 0.2392157, 0, 1,
-1.720827, -0.4447396, -2.333451, 1, 0.2470588, 0, 1,
-1.690946, -0.1917418, -1.0028, 1, 0.2509804, 0, 1,
-1.680909, -1.669672, -1.51483, 1, 0.2588235, 0, 1,
-1.671198, 0.9067821, -1.643904, 1, 0.2627451, 0, 1,
-1.660144, -0.3804323, -4.184521, 1, 0.2705882, 0, 1,
-1.646432, -0.6024988, -1.294828, 1, 0.2745098, 0, 1,
-1.644136, 0.2652668, -1.401219, 1, 0.282353, 0, 1,
-1.635731, 0.6885694, -1.486625, 1, 0.2862745, 0, 1,
-1.624887, 0.2146268, -0.4777936, 1, 0.2941177, 0, 1,
-1.608128, 1.156896, -1.960363, 1, 0.3019608, 0, 1,
-1.60176, -0.5721468, -2.748032, 1, 0.3058824, 0, 1,
-1.601541, 0.8618991, -1.558739, 1, 0.3137255, 0, 1,
-1.596802, -2.099968, -1.150051, 1, 0.3176471, 0, 1,
-1.591061, -1.618773, -2.139992, 1, 0.3254902, 0, 1,
-1.589718, 0.1552439, -1.077363, 1, 0.3294118, 0, 1,
-1.584265, -0.9113817, -1.444109, 1, 0.3372549, 0, 1,
-1.583519, 0.4769618, -1.624001, 1, 0.3411765, 0, 1,
-1.581497, 0.7567222, -0.4115194, 1, 0.3490196, 0, 1,
-1.571465, -1.079221, -1.155295, 1, 0.3529412, 0, 1,
-1.559232, 0.728289, -0.5700742, 1, 0.3607843, 0, 1,
-1.554869, 1.155015, -1.040534, 1, 0.3647059, 0, 1,
-1.554422, 0.9348514, -1.11728, 1, 0.372549, 0, 1,
-1.551925, 0.3885112, -1.448238, 1, 0.3764706, 0, 1,
-1.550545, 0.790854, -1.205459, 1, 0.3843137, 0, 1,
-1.540002, -1.95736, -2.71022, 1, 0.3882353, 0, 1,
-1.52601, -0.7253193, -0.3832432, 1, 0.3960784, 0, 1,
-1.517777, 1.018214, -1.911853, 1, 0.4039216, 0, 1,
-1.501277, 0.87271, -0.9359694, 1, 0.4078431, 0, 1,
-1.498256, -1.105862, -3.836087, 1, 0.4156863, 0, 1,
-1.480378, -0.1108435, -0.3777851, 1, 0.4196078, 0, 1,
-1.474624, -1.053406, -1.71008, 1, 0.427451, 0, 1,
-1.470451, -0.743251, -1.547095, 1, 0.4313726, 0, 1,
-1.457391, -1.850993, -3.49207, 1, 0.4392157, 0, 1,
-1.44915, 0.7326376, -1.79367, 1, 0.4431373, 0, 1,
-1.439278, 1.011468, -0.6786197, 1, 0.4509804, 0, 1,
-1.435351, 1.503526, -1.077337, 1, 0.454902, 0, 1,
-1.434341, -0.5191344, -1.473621, 1, 0.4627451, 0, 1,
-1.409396, 0.4958379, 0.6247723, 1, 0.4666667, 0, 1,
-1.389822, 1.511296, -0.1487449, 1, 0.4745098, 0, 1,
-1.389146, 1.448839, -1.103873, 1, 0.4784314, 0, 1,
-1.37563, 0.1917375, -2.968694, 1, 0.4862745, 0, 1,
-1.370995, 0.5469955, -1.303247, 1, 0.4901961, 0, 1,
-1.359059, -1.072347, -1.114835, 1, 0.4980392, 0, 1,
-1.354332, 1.555914, 0.428652, 1, 0.5058824, 0, 1,
-1.343912, 1.045529, -0.6465829, 1, 0.509804, 0, 1,
-1.338208, 0.04968735, -1.3065, 1, 0.5176471, 0, 1,
-1.328904, -1.672742, -3.101953, 1, 0.5215687, 0, 1,
-1.325074, 0.9007757, -0.4091186, 1, 0.5294118, 0, 1,
-1.32255, 0.1397029, -1.157997, 1, 0.5333334, 0, 1,
-1.313077, -0.8940142, -3.132083, 1, 0.5411765, 0, 1,
-1.309882, 0.4290207, -0.7056096, 1, 0.5450981, 0, 1,
-1.309426, -0.4754326, -1.116976, 1, 0.5529412, 0, 1,
-1.3085, -1.746038, -4.235128, 1, 0.5568628, 0, 1,
-1.302569, -0.276652, -1.313061, 1, 0.5647059, 0, 1,
-1.287736, -1.386598, -3.333732, 1, 0.5686275, 0, 1,
-1.282736, 0.1834068, -1.071593, 1, 0.5764706, 0, 1,
-1.282427, -0.963784, 0.8831751, 1, 0.5803922, 0, 1,
-1.273406, 1.113989, -0.701063, 1, 0.5882353, 0, 1,
-1.260818, -0.4835917, -1.673109, 1, 0.5921569, 0, 1,
-1.258357, 1.275162, -0.9583699, 1, 0.6, 0, 1,
-1.257219, -1.594831, -3.971091, 1, 0.6078432, 0, 1,
-1.255938, 0.8217689, -1.38627, 1, 0.6117647, 0, 1,
-1.253183, 0.2912517, -2.94779, 1, 0.6196079, 0, 1,
-1.2517, -0.5477592, -0.9903237, 1, 0.6235294, 0, 1,
-1.247683, -1.378983, -1.274952, 1, 0.6313726, 0, 1,
-1.247345, 0.9916462, -0.9777567, 1, 0.6352941, 0, 1,
-1.244565, -1.734681, -2.910449, 1, 0.6431373, 0, 1,
-1.239627, 1.005584, -1.421344, 1, 0.6470588, 0, 1,
-1.229118, -1.341768, -2.246666, 1, 0.654902, 0, 1,
-1.228614, 0.7134462, -2.279029, 1, 0.6588235, 0, 1,
-1.219327, -0.225358, -1.272171, 1, 0.6666667, 0, 1,
-1.213785, -0.7778485, -1.702387, 1, 0.6705883, 0, 1,
-1.213112, 0.8298172, -1.338801, 1, 0.6784314, 0, 1,
-1.211638, -1.539626, -2.638148, 1, 0.682353, 0, 1,
-1.207115, 0.4158897, 0.007070887, 1, 0.6901961, 0, 1,
-1.203909, 1.629304, -0.2658603, 1, 0.6941177, 0, 1,
-1.203709, -0.2903408, -2.557883, 1, 0.7019608, 0, 1,
-1.201631, -1.164901, -0.6945368, 1, 0.7098039, 0, 1,
-1.196496, 0.8529549, 0.5552985, 1, 0.7137255, 0, 1,
-1.189679, 1.334688, -0.9916257, 1, 0.7215686, 0, 1,
-1.185686, 0.6329681, -2.269602, 1, 0.7254902, 0, 1,
-1.172864, -1.653075, -2.074013, 1, 0.7333333, 0, 1,
-1.171115, -1.664578, -2.173233, 1, 0.7372549, 0, 1,
-1.165473, -1.590271, -1.878768, 1, 0.7450981, 0, 1,
-1.163472, -0.7160366, -4.38318, 1, 0.7490196, 0, 1,
-1.16221, 0.5432225, -2.22852, 1, 0.7568628, 0, 1,
-1.157761, -2.142297, -2.834048, 1, 0.7607843, 0, 1,
-1.153534, 1.083306, -1.407615, 1, 0.7686275, 0, 1,
-1.150509, 0.8773572, -0.7812877, 1, 0.772549, 0, 1,
-1.147216, -0.5689232, -2.38106, 1, 0.7803922, 0, 1,
-1.139689, 0.3625951, -2.250864, 1, 0.7843137, 0, 1,
-1.136203, -0.4473682, -2.382856, 1, 0.7921569, 0, 1,
-1.134279, -0.7090791, -2.018437, 1, 0.7960784, 0, 1,
-1.109088, 0.1170966, -1.896031, 1, 0.8039216, 0, 1,
-1.10431, 1.107894, -0.5372801, 1, 0.8117647, 0, 1,
-1.095985, 0.2739944, -2.086889, 1, 0.8156863, 0, 1,
-1.086365, -1.509042, -3.253412, 1, 0.8235294, 0, 1,
-1.076852, -0.7305598, -3.343551, 1, 0.827451, 0, 1,
-1.07103, 0.8551015, -1.439308, 1, 0.8352941, 0, 1,
-1.069661, -0.423845, -1.816962, 1, 0.8392157, 0, 1,
-1.063877, 0.5532259, 0.1652437, 1, 0.8470588, 0, 1,
-1.063729, 0.3917433, -1.610425, 1, 0.8509804, 0, 1,
-1.049092, 0.3648982, 0.8074499, 1, 0.8588235, 0, 1,
-1.047488, 0.2119673, -0.9917345, 1, 0.8627451, 0, 1,
-1.044379, 1.251107, 0.3094216, 1, 0.8705882, 0, 1,
-1.039315, -1.105891, -1.06217, 1, 0.8745098, 0, 1,
-1.035327, -0.8105674, -2.88321, 1, 0.8823529, 0, 1,
-1.025965, 0.8107589, 0.1914984, 1, 0.8862745, 0, 1,
-1.023167, -0.2746086, -0.9107331, 1, 0.8941177, 0, 1,
-1.022512, 1.136615, -0.4206401, 1, 0.8980392, 0, 1,
-1.013628, 0.6087475, -0.5901332, 1, 0.9058824, 0, 1,
-1.004415, 1.254503, -1.550558, 1, 0.9137255, 0, 1,
-1.004365, -0.1844735, -2.29247, 1, 0.9176471, 0, 1,
-0.9991804, -0.02495806, -2.463744, 1, 0.9254902, 0, 1,
-0.994247, 0.4738076, -0.350812, 1, 0.9294118, 0, 1,
-0.992669, -1.205164, -0.542717, 1, 0.9372549, 0, 1,
-0.9903086, 1.673306, 0.6184688, 1, 0.9411765, 0, 1,
-0.9881147, 0.6083077, 0.2645299, 1, 0.9490196, 0, 1,
-0.9834775, -0.8928301, -0.9544701, 1, 0.9529412, 0, 1,
-0.9834192, 0.5673451, -1.645584, 1, 0.9607843, 0, 1,
-0.9823656, 1.283785, 0.9784797, 1, 0.9647059, 0, 1,
-0.9816669, 1.171712, -1.49807, 1, 0.972549, 0, 1,
-0.9810615, -2.134253, -1.908888, 1, 0.9764706, 0, 1,
-0.9735594, 1.338161, -0.1026791, 1, 0.9843137, 0, 1,
-0.9725227, -0.05611733, -0.539754, 1, 0.9882353, 0, 1,
-0.9697276, 0.9801064, -1.483233, 1, 0.9960784, 0, 1,
-0.9647195, 1.127464, -0.3684292, 0.9960784, 1, 0, 1,
-0.9638474, 0.6489187, 0.2979535, 0.9921569, 1, 0, 1,
-0.9620677, 1.014599, -1.340871, 0.9843137, 1, 0, 1,
-0.9612318, -0.5760448, -1.206009, 0.9803922, 1, 0, 1,
-0.9456103, -0.8253711, -0.3753445, 0.972549, 1, 0, 1,
-0.9418033, 0.1859508, -0.9966644, 0.9686275, 1, 0, 1,
-0.9404339, -0.1362525, -0.7151015, 0.9607843, 1, 0, 1,
-0.9367325, 1.031411, 0.7183359, 0.9568627, 1, 0, 1,
-0.9322703, -1.985965, -3.101574, 0.9490196, 1, 0, 1,
-0.9309832, 0.2228448, -0.1469703, 0.945098, 1, 0, 1,
-0.9302201, -0.2310036, 0.8565834, 0.9372549, 1, 0, 1,
-0.9234494, -0.1089324, -2.665194, 0.9333333, 1, 0, 1,
-0.9202885, -0.3938953, -2.370354, 0.9254902, 1, 0, 1,
-0.9123239, 0.1934654, 0.037384, 0.9215686, 1, 0, 1,
-0.9114065, -0.2140214, -1.993757, 0.9137255, 1, 0, 1,
-0.9046968, 0.5264732, -0.6317509, 0.9098039, 1, 0, 1,
-0.8901241, 1.681564, 0.06201812, 0.9019608, 1, 0, 1,
-0.8881176, -0.07535498, -1.477252, 0.8941177, 1, 0, 1,
-0.8878368, 1.149016, -0.3699403, 0.8901961, 1, 0, 1,
-0.8876556, 1.472032, -1.028513, 0.8823529, 1, 0, 1,
-0.884989, -0.1640285, -0.5371737, 0.8784314, 1, 0, 1,
-0.8814062, 1.372482, -1.300161, 0.8705882, 1, 0, 1,
-0.8809826, -0.09529503, -1.145594, 0.8666667, 1, 0, 1,
-0.8761199, -0.3035261, -0.9274828, 0.8588235, 1, 0, 1,
-0.8691472, 0.5610955, 0.1616597, 0.854902, 1, 0, 1,
-0.8669127, 0.07490151, -1.239786, 0.8470588, 1, 0, 1,
-0.8591757, -0.5604834, -2.201659, 0.8431373, 1, 0, 1,
-0.8561482, 0.09833396, -2.319594, 0.8352941, 1, 0, 1,
-0.855846, 1.310167, -0.1316026, 0.8313726, 1, 0, 1,
-0.846834, 1.567107, -0.729537, 0.8235294, 1, 0, 1,
-0.8429085, -0.3914441, -1.642397, 0.8196079, 1, 0, 1,
-0.8404533, -0.8070055, -0.7081499, 0.8117647, 1, 0, 1,
-0.8350223, 0.1074882, -1.630435, 0.8078431, 1, 0, 1,
-0.8338141, 1.399174, -0.3849185, 0.8, 1, 0, 1,
-0.8301217, 0.1066883, -3.576169, 0.7921569, 1, 0, 1,
-0.8222447, 1.600204, -1.793224, 0.7882353, 1, 0, 1,
-0.8181792, -0.4746819, -3.218352, 0.7803922, 1, 0, 1,
-0.8171731, 0.8167067, 0.2993487, 0.7764706, 1, 0, 1,
-0.8169515, 0.8075103, -1.825745, 0.7686275, 1, 0, 1,
-0.812152, -0.5933668, -3.039348, 0.7647059, 1, 0, 1,
-0.8106968, -1.189216, -2.182659, 0.7568628, 1, 0, 1,
-0.7983354, 0.845818, -0.2814066, 0.7529412, 1, 0, 1,
-0.7901428, -0.6145554, -2.785945, 0.7450981, 1, 0, 1,
-0.7833635, 0.3865959, -0.9790833, 0.7411765, 1, 0, 1,
-0.7827885, -0.09553721, -2.814925, 0.7333333, 1, 0, 1,
-0.7787827, -0.2190623, -2.433962, 0.7294118, 1, 0, 1,
-0.775364, 0.5689295, -2.888648, 0.7215686, 1, 0, 1,
-0.7733883, -2.479609, -3.117296, 0.7176471, 1, 0, 1,
-0.7654221, -1.158693, -1.722296, 0.7098039, 1, 0, 1,
-0.7632849, 0.07385825, -1.671653, 0.7058824, 1, 0, 1,
-0.7596388, 1.133178, -2.202297, 0.6980392, 1, 0, 1,
-0.759154, -0.1286514, -1.409871, 0.6901961, 1, 0, 1,
-0.7564508, 0.7488199, -0.6468798, 0.6862745, 1, 0, 1,
-0.7538629, 0.1518182, -0.7759807, 0.6784314, 1, 0, 1,
-0.7525228, -1.922991, -2.927571, 0.6745098, 1, 0, 1,
-0.7509919, 0.8169961, -1.253739, 0.6666667, 1, 0, 1,
-0.739818, -2.563264, -1.787403, 0.6627451, 1, 0, 1,
-0.7337005, 0.3137457, -1.952199, 0.654902, 1, 0, 1,
-0.7292621, -0.6892714, -0.4253838, 0.6509804, 1, 0, 1,
-0.7288834, 0.1362379, -0.7381889, 0.6431373, 1, 0, 1,
-0.7234932, 0.755116, -2.273097, 0.6392157, 1, 0, 1,
-0.7228032, -1.168446, -2.976378, 0.6313726, 1, 0, 1,
-0.7227158, -1.373065, -2.946961, 0.627451, 1, 0, 1,
-0.7117411, 0.9084968, -0.3173865, 0.6196079, 1, 0, 1,
-0.7063866, -0.061783, -0.8435073, 0.6156863, 1, 0, 1,
-0.6967505, -0.1517561, -1.594064, 0.6078432, 1, 0, 1,
-0.6938382, -0.3817307, -0.6428764, 0.6039216, 1, 0, 1,
-0.6927022, -0.4999637, -2.023767, 0.5960785, 1, 0, 1,
-0.6925483, 0.367199, -1.464847, 0.5882353, 1, 0, 1,
-0.6907855, -0.9862534, -2.589074, 0.5843138, 1, 0, 1,
-0.6901909, -1.062424, -1.53529, 0.5764706, 1, 0, 1,
-0.6884744, 0.2545722, 0.00900742, 0.572549, 1, 0, 1,
-0.6884585, 0.401055, -0.5332937, 0.5647059, 1, 0, 1,
-0.6863799, 2.287677, -0.5894409, 0.5607843, 1, 0, 1,
-0.6811836, 1.192556, 0.3437983, 0.5529412, 1, 0, 1,
-0.6800846, -1.070705, -3.128939, 0.5490196, 1, 0, 1,
-0.6766306, 0.3681234, -2.174436, 0.5411765, 1, 0, 1,
-0.6750361, 0.6887333, -0.9619345, 0.5372549, 1, 0, 1,
-0.6737723, 1.390282, -1.293238, 0.5294118, 1, 0, 1,
-0.6735645, 1.917404, 0.5643728, 0.5254902, 1, 0, 1,
-0.6710678, -0.7558491, -1.118229, 0.5176471, 1, 0, 1,
-0.6654793, -0.8244514, -2.014135, 0.5137255, 1, 0, 1,
-0.663261, 0.3224513, -0.1454871, 0.5058824, 1, 0, 1,
-0.6595066, 1.010729, -2.12677, 0.5019608, 1, 0, 1,
-0.6508329, -0.6562489, -2.281379, 0.4941176, 1, 0, 1,
-0.6482875, 2.065785, 1.426183, 0.4862745, 1, 0, 1,
-0.645741, 0.1495154, -1.559165, 0.4823529, 1, 0, 1,
-0.6447678, -0.08281374, 0.179078, 0.4745098, 1, 0, 1,
-0.643159, 0.522631, -1.656532, 0.4705882, 1, 0, 1,
-0.6387967, -0.6567329, -3.888286, 0.4627451, 1, 0, 1,
-0.6386437, -0.0968769, -2.587426, 0.4588235, 1, 0, 1,
-0.6384093, 0.6806409, 0.4912966, 0.4509804, 1, 0, 1,
-0.6379445, 0.1184089, -2.159825, 0.4470588, 1, 0, 1,
-0.6372399, 1.426288, 0.5546278, 0.4392157, 1, 0, 1,
-0.6262921, 0.003624785, -2.027331, 0.4352941, 1, 0, 1,
-0.616069, -1.370348, -2.432539, 0.427451, 1, 0, 1,
-0.6160396, -0.7092412, -1.472002, 0.4235294, 1, 0, 1,
-0.6137488, -0.1972661, -1.451226, 0.4156863, 1, 0, 1,
-0.6124312, 0.7895938, 0.02068798, 0.4117647, 1, 0, 1,
-0.6051059, 0.3469146, -0.0798869, 0.4039216, 1, 0, 1,
-0.6050883, -0.4384113, -3.82889, 0.3960784, 1, 0, 1,
-0.6037849, 1.582113, 0.1823458, 0.3921569, 1, 0, 1,
-0.5998302, -0.8182451, -4.270764, 0.3843137, 1, 0, 1,
-0.5973569, 0.5055642, 0.006719691, 0.3803922, 1, 0, 1,
-0.5920184, 0.1347242, -2.935947, 0.372549, 1, 0, 1,
-0.5890858, 0.6166835, -0.3324792, 0.3686275, 1, 0, 1,
-0.5802711, -0.6013271, -2.182414, 0.3607843, 1, 0, 1,
-0.5782132, -0.5198306, -2.563829, 0.3568628, 1, 0, 1,
-0.5771698, 0.777694, -0.5271412, 0.3490196, 1, 0, 1,
-0.5760466, -0.0380027, -0.9259925, 0.345098, 1, 0, 1,
-0.5692136, 0.8171254, -1.916886, 0.3372549, 1, 0, 1,
-0.5649468, 0.8581867, 0.9407593, 0.3333333, 1, 0, 1,
-0.5629868, -1.019108, -2.226758, 0.3254902, 1, 0, 1,
-0.5594441, 1.12913, 0.7854093, 0.3215686, 1, 0, 1,
-0.5582702, 2.018705, -1.026656, 0.3137255, 1, 0, 1,
-0.5551608, -0.4757366, -3.262021, 0.3098039, 1, 0, 1,
-0.5548909, -1.983772, -2.46423, 0.3019608, 1, 0, 1,
-0.5538425, -1.515022, -1.006381, 0.2941177, 1, 0, 1,
-0.553841, 0.1566256, -0.8967512, 0.2901961, 1, 0, 1,
-0.5461715, 0.2731372, -0.6573976, 0.282353, 1, 0, 1,
-0.5460227, 0.09880073, -1.755294, 0.2784314, 1, 0, 1,
-0.5438291, -0.5210264, -2.53458, 0.2705882, 1, 0, 1,
-0.5382091, 0.2824854, -3.665324, 0.2666667, 1, 0, 1,
-0.5376115, -1.028017, -2.117099, 0.2588235, 1, 0, 1,
-0.5375433, 0.2138688, -2.114137, 0.254902, 1, 0, 1,
-0.5351892, -0.5550038, -2.598394, 0.2470588, 1, 0, 1,
-0.532387, -0.7067417, -2.673548, 0.2431373, 1, 0, 1,
-0.5304403, 0.9527562, -1.778097, 0.2352941, 1, 0, 1,
-0.5281403, 0.3251883, -2.608161, 0.2313726, 1, 0, 1,
-0.5248023, 0.4084438, -1.473325, 0.2235294, 1, 0, 1,
-0.523779, -0.899412, -4.169927, 0.2196078, 1, 0, 1,
-0.5224158, 0.8934207, 0.5567227, 0.2117647, 1, 0, 1,
-0.517483, 0.9175579, -0.117804, 0.2078431, 1, 0, 1,
-0.5150297, 0.12727, -2.534034, 0.2, 1, 0, 1,
-0.5093332, -1.097154, -3.142648, 0.1921569, 1, 0, 1,
-0.505748, 0.6219768, 0.3555786, 0.1882353, 1, 0, 1,
-0.5026824, -0.6666346, -2.778681, 0.1803922, 1, 0, 1,
-0.5025067, 0.02594375, -2.886358, 0.1764706, 1, 0, 1,
-0.5021234, -0.03638669, -2.389233, 0.1686275, 1, 0, 1,
-0.5001085, 0.5371687, 0.6424686, 0.1647059, 1, 0, 1,
-0.4991344, -0.5375036, -2.863415, 0.1568628, 1, 0, 1,
-0.4941798, 0.2244601, 0.03955018, 0.1529412, 1, 0, 1,
-0.4924174, -0.3597776, -0.2847271, 0.145098, 1, 0, 1,
-0.4903117, -1.395705, -3.699577, 0.1411765, 1, 0, 1,
-0.489365, -1.538925, -2.358805, 0.1333333, 1, 0, 1,
-0.4879231, -0.9798273, -2.518026, 0.1294118, 1, 0, 1,
-0.4856119, -1.602844, -1.881446, 0.1215686, 1, 0, 1,
-0.4854719, 0.5755039, 0.8806027, 0.1176471, 1, 0, 1,
-0.4837278, -0.4431493, -2.535212, 0.1098039, 1, 0, 1,
-0.4773109, 2.416821, 0.006289537, 0.1058824, 1, 0, 1,
-0.4739399, 0.6739463, 1.51387, 0.09803922, 1, 0, 1,
-0.472453, -0.06452935, -1.674196, 0.09019608, 1, 0, 1,
-0.4703196, -0.6165539, -2.46212, 0.08627451, 1, 0, 1,
-0.4699569, -0.5678263, -2.846842, 0.07843138, 1, 0, 1,
-0.4591077, -0.2726798, -1.919818, 0.07450981, 1, 0, 1,
-0.4565163, -0.5999374, -3.665004, 0.06666667, 1, 0, 1,
-0.4548427, -1.233296, -2.265931, 0.0627451, 1, 0, 1,
-0.4496439, 1.171061, 0.3656858, 0.05490196, 1, 0, 1,
-0.4496094, -0.3694989, -2.473633, 0.05098039, 1, 0, 1,
-0.4412886, -0.1257908, -0.303256, 0.04313726, 1, 0, 1,
-0.4346399, 0.6719963, 0.875691, 0.03921569, 1, 0, 1,
-0.4337011, 1.689772, -0.5347468, 0.03137255, 1, 0, 1,
-0.4332165, 0.4571324, -1.515799, 0.02745098, 1, 0, 1,
-0.4326955, 0.5250702, -2.034369, 0.01960784, 1, 0, 1,
-0.4286533, -0.1312124, -3.443663, 0.01568628, 1, 0, 1,
-0.4272952, 0.6259089, 1.361893, 0.007843138, 1, 0, 1,
-0.4270176, 0.4612899, -1.187574, 0.003921569, 1, 0, 1,
-0.4261117, 1.184646, -1.081766, 0, 1, 0.003921569, 1,
-0.4241923, 0.695176, -0.2552116, 0, 1, 0.01176471, 1,
-0.4237441, 0.1611555, -1.82399, 0, 1, 0.01568628, 1,
-0.4194193, -0.1196345, -2.154982, 0, 1, 0.02352941, 1,
-0.4105148, -1.054817, -2.60234, 0, 1, 0.02745098, 1,
-0.4092795, -1.735029, -5.015149, 0, 1, 0.03529412, 1,
-0.403219, 0.4717474, 1.288663, 0, 1, 0.03921569, 1,
-0.4029802, -0.5035772, -3.148534, 0, 1, 0.04705882, 1,
-0.3998705, -2.010478, -3.161491, 0, 1, 0.05098039, 1,
-0.3958848, 2.047995, -0.7740645, 0, 1, 0.05882353, 1,
-0.3920902, -0.02743744, -1.403683, 0, 1, 0.0627451, 1,
-0.3850051, 2.735994, -0.8345295, 0, 1, 0.07058824, 1,
-0.3814551, -0.2889955, -1.06047, 0, 1, 0.07450981, 1,
-0.3796662, 0.2150304, -2.367213, 0, 1, 0.08235294, 1,
-0.3755039, -1.337277, -1.838754, 0, 1, 0.08627451, 1,
-0.3752922, 0.7609659, -1.942208, 0, 1, 0.09411765, 1,
-0.3723976, 0.9426731, -1.077325, 0, 1, 0.1019608, 1,
-0.371369, -1.344015, -4.501882, 0, 1, 0.1058824, 1,
-0.3695503, 0.1763519, -1.205863, 0, 1, 0.1137255, 1,
-0.3677029, -0.7731332, -2.752335, 0, 1, 0.1176471, 1,
-0.3597026, -0.8081537, -4.861677, 0, 1, 0.1254902, 1,
-0.3543479, 0.3873625, 0.3868304, 0, 1, 0.1294118, 1,
-0.3537429, -0.3591086, -2.285907, 0, 1, 0.1372549, 1,
-0.3443766, 0.008859115, -2.950887, 0, 1, 0.1411765, 1,
-0.3429901, -1.092475, -3.687327, 0, 1, 0.1490196, 1,
-0.3403043, 0.4726402, -0.9787865, 0, 1, 0.1529412, 1,
-0.3369794, 0.9390497, 0.03965241, 0, 1, 0.1607843, 1,
-0.3365024, 0.6233311, -0.4543415, 0, 1, 0.1647059, 1,
-0.33635, -0.6271732, -3.34982, 0, 1, 0.172549, 1,
-0.3360664, -1.239786, -3.761783, 0, 1, 0.1764706, 1,
-0.3359416, -0.9150738, -2.440106, 0, 1, 0.1843137, 1,
-0.3341211, 1.323021, -1.455337, 0, 1, 0.1882353, 1,
-0.3305956, -0.1203087, -2.286167, 0, 1, 0.1960784, 1,
-0.3291795, 2.062115, -1.241611, 0, 1, 0.2039216, 1,
-0.3274356, 0.5935458, -1.307363, 0, 1, 0.2078431, 1,
-0.3245653, -0.7479186, -3.205573, 0, 1, 0.2156863, 1,
-0.3236233, -1.718913, -4.826681, 0, 1, 0.2196078, 1,
-0.3196635, -0.4529121, -5.320385, 0, 1, 0.227451, 1,
-0.3154218, -0.3966325, -2.956041, 0, 1, 0.2313726, 1,
-0.3121985, -0.2777143, -2.041319, 0, 1, 0.2392157, 1,
-0.3092154, 0.1970893, 0.4133101, 0, 1, 0.2431373, 1,
-0.3000601, 0.6535311, -0.4444367, 0, 1, 0.2509804, 1,
-0.2983876, -0.4922705, -3.103394, 0, 1, 0.254902, 1,
-0.2978806, -0.2118339, -1.852643, 0, 1, 0.2627451, 1,
-0.2938954, 0.3822511, -0.3023585, 0, 1, 0.2666667, 1,
-0.2911441, -1.361936, -2.844613, 0, 1, 0.2745098, 1,
-0.2822814, -0.008149763, -1.369255, 0, 1, 0.2784314, 1,
-0.2794005, 0.445707, -0.5198725, 0, 1, 0.2862745, 1,
-0.2792558, 0.4293154, 0.1690242, 0, 1, 0.2901961, 1,
-0.2769331, 0.9549103, -0.6790195, 0, 1, 0.2980392, 1,
-0.2762285, 1.466996, -0.1060499, 0, 1, 0.3058824, 1,
-0.276091, -1.094108, -2.583703, 0, 1, 0.3098039, 1,
-0.2743181, -0.9955274, -5.915871, 0, 1, 0.3176471, 1,
-0.2714253, 0.7817879, -1.000212, 0, 1, 0.3215686, 1,
-0.2714108, -0.5000248, -0.6899689, 0, 1, 0.3294118, 1,
-0.2691067, -0.8326384, -1.835737, 0, 1, 0.3333333, 1,
-0.2601109, 0.8334904, -1.056304, 0, 1, 0.3411765, 1,
-0.2596668, 1.006875, 0.169869, 0, 1, 0.345098, 1,
-0.2569794, 0.7425012, 0.3812441, 0, 1, 0.3529412, 1,
-0.2552647, 0.8658471, 0.4505292, 0, 1, 0.3568628, 1,
-0.249052, -0.1141313, -0.9495963, 0, 1, 0.3647059, 1,
-0.2479977, -1.699319, -1.564275, 0, 1, 0.3686275, 1,
-0.2452294, 2.050686, 0.7937787, 0, 1, 0.3764706, 1,
-0.2448767, -0.0691103, -1.414708, 0, 1, 0.3803922, 1,
-0.2448588, 2.50235, -1.548836, 0, 1, 0.3882353, 1,
-0.2436537, 0.813414, -0.1818178, 0, 1, 0.3921569, 1,
-0.2432722, -0.428797, -3.848831, 0, 1, 0.4, 1,
-0.2381112, -0.4030855, -3.363748, 0, 1, 0.4078431, 1,
-0.2373204, 1.158862, -0.4565127, 0, 1, 0.4117647, 1,
-0.2316334, -2.15766, -3.880065, 0, 1, 0.4196078, 1,
-0.2294706, 1.212247, -1.15217, 0, 1, 0.4235294, 1,
-0.2235004, 2.089965, -1.342421, 0, 1, 0.4313726, 1,
-0.2222524, -1.201091, -3.110385, 0, 1, 0.4352941, 1,
-0.2208869, -0.1582453, -1.593443, 0, 1, 0.4431373, 1,
-0.2207685, -0.2558107, -2.451318, 0, 1, 0.4470588, 1,
-0.2162857, 0.4013844, -1.9292, 0, 1, 0.454902, 1,
-0.2160441, 1.019385, -0.6717993, 0, 1, 0.4588235, 1,
-0.2145276, -0.4743404, -1.728519, 0, 1, 0.4666667, 1,
-0.2126013, 0.06525712, -1.001111, 0, 1, 0.4705882, 1,
-0.2094801, 2.538314, -1.332921, 0, 1, 0.4784314, 1,
-0.2063492, 1.169557, 0.3060235, 0, 1, 0.4823529, 1,
-0.2002544, 2.060618, 0.3020757, 0, 1, 0.4901961, 1,
-0.1942678, -0.1748521, -2.880242, 0, 1, 0.4941176, 1,
-0.1939545, -2.122257, -0.3761983, 0, 1, 0.5019608, 1,
-0.1848276, 1.710076, 0.4490668, 0, 1, 0.509804, 1,
-0.1845026, -0.1935237, -2.327159, 0, 1, 0.5137255, 1,
-0.1837818, -0.6162112, -3.46607, 0, 1, 0.5215687, 1,
-0.1836897, -0.2833298, -3.238879, 0, 1, 0.5254902, 1,
-0.175704, -0.1558293, -2.657649, 0, 1, 0.5333334, 1,
-0.1742766, -0.2951961, -3.164722, 0, 1, 0.5372549, 1,
-0.1710886, 0.2765556, -0.04363384, 0, 1, 0.5450981, 1,
-0.1687879, -1.056285, -2.377444, 0, 1, 0.5490196, 1,
-0.1633725, 0.5861031, 0.1235759, 0, 1, 0.5568628, 1,
-0.1631874, -0.1540036, -1.615766, 0, 1, 0.5607843, 1,
-0.1624214, -0.7108947, -3.224178, 0, 1, 0.5686275, 1,
-0.1522526, -0.04356488, -2.108019, 0, 1, 0.572549, 1,
-0.1474876, -0.2941845, -2.791475, 0, 1, 0.5803922, 1,
-0.1371623, 1.340103, 0.5732082, 0, 1, 0.5843138, 1,
-0.1307568, 0.2741012, 1.364169, 0, 1, 0.5921569, 1,
-0.1259905, 0.6502034, -0.4930745, 0, 1, 0.5960785, 1,
-0.119216, 0.8920735, -1.429937, 0, 1, 0.6039216, 1,
-0.1185416, -0.09075341, -3.02825, 0, 1, 0.6117647, 1,
-0.1175853, 0.2107853, -1.460831, 0, 1, 0.6156863, 1,
-0.1167778, -1.203811, -2.52726, 0, 1, 0.6235294, 1,
-0.1165441, -0.5544747, -3.775883, 0, 1, 0.627451, 1,
-0.1154368, 0.4622415, -0.4193248, 0, 1, 0.6352941, 1,
-0.1145822, -0.9798656, -3.942439, 0, 1, 0.6392157, 1,
-0.1120858, 1.3299, -0.6260319, 0, 1, 0.6470588, 1,
-0.1100144, -1.910218, -2.710904, 0, 1, 0.6509804, 1,
-0.1096414, -0.7521428, -2.689502, 0, 1, 0.6588235, 1,
-0.108955, 0.002236857, -1.011745, 0, 1, 0.6627451, 1,
-0.1069047, -0.6554235, -3.521725, 0, 1, 0.6705883, 1,
-0.1060642, 0.1660366, -1.054569, 0, 1, 0.6745098, 1,
-0.1045453, -0.1967673, -2.581596, 0, 1, 0.682353, 1,
-0.1004295, -0.318351, -3.736109, 0, 1, 0.6862745, 1,
-0.1004034, -0.4644059, -2.908203, 0, 1, 0.6941177, 1,
-0.1001746, -0.7023239, -5.065846, 0, 1, 0.7019608, 1,
-0.100104, 0.4247749, 0.7697304, 0, 1, 0.7058824, 1,
-0.09730522, 0.2188823, 0.4625389, 0, 1, 0.7137255, 1,
-0.09212585, 0.03713395, 0.4088735, 0, 1, 0.7176471, 1,
-0.0855166, 0.1206782, -1.669163, 0, 1, 0.7254902, 1,
-0.08539134, -2.299772, -2.291825, 0, 1, 0.7294118, 1,
-0.08256421, -0.806539, -2.297729, 0, 1, 0.7372549, 1,
-0.07979926, -0.001633106, -1.676333, 0, 1, 0.7411765, 1,
-0.07761915, 0.407683, -0.0367745, 0, 1, 0.7490196, 1,
-0.0755792, -0.1445966, -2.128303, 0, 1, 0.7529412, 1,
-0.07531281, -0.4455319, -1.81761, 0, 1, 0.7607843, 1,
-0.07404016, 0.2839233, -0.09747741, 0, 1, 0.7647059, 1,
-0.05952697, 1.138461, -0.5947136, 0, 1, 0.772549, 1,
-0.05727138, -1.077227, -2.5463, 0, 1, 0.7764706, 1,
-0.05472974, 1.166328, -1.844571, 0, 1, 0.7843137, 1,
-0.04946296, 0.01374617, -2.302762, 0, 1, 0.7882353, 1,
-0.04290692, 0.008541794, -3.18227, 0, 1, 0.7960784, 1,
-0.04269534, 1.350216, 0.07561796, 0, 1, 0.8039216, 1,
-0.04264739, -0.2292904, -3.973909, 0, 1, 0.8078431, 1,
-0.04144486, -1.028459, -3.251284, 0, 1, 0.8156863, 1,
-0.03828155, -0.3325963, -1.3397, 0, 1, 0.8196079, 1,
-0.03733744, 0.6508317, -0.0001750946, 0, 1, 0.827451, 1,
-0.03679174, -0.5063375, -2.654457, 0, 1, 0.8313726, 1,
-0.03178114, -1.72218, -5.535434, 0, 1, 0.8392157, 1,
-0.03093116, -1.18194, -3.185661, 0, 1, 0.8431373, 1,
-0.02983015, -0.4201461, -3.641614, 0, 1, 0.8509804, 1,
-0.02248655, -0.3182658, -1.358233, 0, 1, 0.854902, 1,
-0.0206059, 0.4949413, 1.726573, 0, 1, 0.8627451, 1,
-0.01621457, 0.3475724, -0.7228029, 0, 1, 0.8666667, 1,
-0.01309046, -0.1187778, -1.747522, 0, 1, 0.8745098, 1,
-0.01247893, 0.608418, -1.572483, 0, 1, 0.8784314, 1,
-0.01217712, -0.5902599, -3.19795, 0, 1, 0.8862745, 1,
-0.00759778, -0.02965854, -2.571813, 0, 1, 0.8901961, 1,
-0.002693501, -0.2201766, -3.69472, 0, 1, 0.8980392, 1,
0.0008547703, 0.1696469, 0.4835141, 0, 1, 0.9058824, 1,
0.001937847, 0.5426199, 1.040409, 0, 1, 0.9098039, 1,
0.002095147, 1.758177, 0.08085196, 0, 1, 0.9176471, 1,
0.00837723, 0.7504361, 1.010368, 0, 1, 0.9215686, 1,
0.0144434, -0.1723567, 2.776983, 0, 1, 0.9294118, 1,
0.0152897, 0.8450935, 1.017411, 0, 1, 0.9333333, 1,
0.02005176, -0.295807, 4.106555, 0, 1, 0.9411765, 1,
0.02032729, -0.2273733, 2.564819, 0, 1, 0.945098, 1,
0.02096698, -0.5896541, 1.558, 0, 1, 0.9529412, 1,
0.02176091, 0.5043351, 2.602458, 0, 1, 0.9568627, 1,
0.02398782, -0.07910583, 3.803149, 0, 1, 0.9647059, 1,
0.02508469, 2.233602, 1.806807, 0, 1, 0.9686275, 1,
0.02615629, 1.251463, 1.430782, 0, 1, 0.9764706, 1,
0.03166273, 0.3830028, 1.280132, 0, 1, 0.9803922, 1,
0.03269364, -1.971344, 2.778343, 0, 1, 0.9882353, 1,
0.03800375, 0.9256858, -0.20066, 0, 1, 0.9921569, 1,
0.03937886, 0.7682319, -0.6681674, 0, 1, 1, 1,
0.04039993, 0.1145124, 0.7568646, 0, 0.9921569, 1, 1,
0.0432378, -0.2148895, 3.18755, 0, 0.9882353, 1, 1,
0.04492521, -0.8208559, 4.229845, 0, 0.9803922, 1, 1,
0.04756944, 0.2443447, -0.5884567, 0, 0.9764706, 1, 1,
0.04915323, -1.950863, 3.535433, 0, 0.9686275, 1, 1,
0.05021056, -1.23668, 3.91425, 0, 0.9647059, 1, 1,
0.05867846, -0.06907909, 3.875896, 0, 0.9568627, 1, 1,
0.05975178, -1.514982, 3.850939, 0, 0.9529412, 1, 1,
0.06070434, -1.696475, 3.336467, 0, 0.945098, 1, 1,
0.06673571, 0.5144028, 1.612943, 0, 0.9411765, 1, 1,
0.06719453, 0.9482287, -1.376338, 0, 0.9333333, 1, 1,
0.07143286, 0.04532617, 0.1951431, 0, 0.9294118, 1, 1,
0.07244532, -0.03155585, 2.210085, 0, 0.9215686, 1, 1,
0.0768803, 1.094271, 1.580575, 0, 0.9176471, 1, 1,
0.0776637, 0.8774824, -1.580978, 0, 0.9098039, 1, 1,
0.07957794, -0.2840225, 1.501137, 0, 0.9058824, 1, 1,
0.08148646, 0.944991, 0.7690655, 0, 0.8980392, 1, 1,
0.08446591, -1.104313, 3.9352, 0, 0.8901961, 1, 1,
0.08530386, 0.4973893, -0.4549895, 0, 0.8862745, 1, 1,
0.08763725, 0.6181935, -1.829478, 0, 0.8784314, 1, 1,
0.09010121, -0.1226811, 2.175233, 0, 0.8745098, 1, 1,
0.09170581, 0.3585997, -0.06670556, 0, 0.8666667, 1, 1,
0.1012138, -1.121899, 4.684578, 0, 0.8627451, 1, 1,
0.1038764, 1.354857, -0.1820521, 0, 0.854902, 1, 1,
0.1116588, -0.4435997, 3.635158, 0, 0.8509804, 1, 1,
0.1133317, -0.430929, 3.856055, 0, 0.8431373, 1, 1,
0.1140056, 0.9775077, -0.9892288, 0, 0.8392157, 1, 1,
0.1257176, -0.1196353, 0.488802, 0, 0.8313726, 1, 1,
0.1274805, 1.036244, 0.8826426, 0, 0.827451, 1, 1,
0.1288368, -0.9524682, 2.762479, 0, 0.8196079, 1, 1,
0.13033, -0.4809822, 5.841932, 0, 0.8156863, 1, 1,
0.1329382, 0.07862711, 2.052211, 0, 0.8078431, 1, 1,
0.1339839, 0.4782912, -0.7059848, 0, 0.8039216, 1, 1,
0.1352517, -0.1340266, 3.367464, 0, 0.7960784, 1, 1,
0.1361332, -0.1261266, 2.076118, 0, 0.7882353, 1, 1,
0.136461, 1.308399, -0.439983, 0, 0.7843137, 1, 1,
0.1371484, 1.063599, -0.5988176, 0, 0.7764706, 1, 1,
0.1395717, -0.8743618, 3.963823, 0, 0.772549, 1, 1,
0.1397618, 1.270098, 1.679785, 0, 0.7647059, 1, 1,
0.1400849, -0.1940614, 2.060571, 0, 0.7607843, 1, 1,
0.1408076, 0.2756496, -0.8333339, 0, 0.7529412, 1, 1,
0.1430466, 0.9822246, -0.5756529, 0, 0.7490196, 1, 1,
0.1450206, -1.788134, 1.847157, 0, 0.7411765, 1, 1,
0.1469982, 0.8829121, -0.08177011, 0, 0.7372549, 1, 1,
0.1488627, 0.2368085, -0.5776332, 0, 0.7294118, 1, 1,
0.1495461, 0.4636023, 0.03000484, 0, 0.7254902, 1, 1,
0.1525912, -1.84196, 3.441265, 0, 0.7176471, 1, 1,
0.1546821, -0.7409962, 2.824143, 0, 0.7137255, 1, 1,
0.1552611, 1.538718, 0.8114127, 0, 0.7058824, 1, 1,
0.1651978, 0.1480886, 2.065374, 0, 0.6980392, 1, 1,
0.1654899, 0.6186236, 0.6407281, 0, 0.6941177, 1, 1,
0.1679132, 0.8672376, 0.6215931, 0, 0.6862745, 1, 1,
0.1702039, 0.309507, 1.63057, 0, 0.682353, 1, 1,
0.17073, -0.07318928, 2.276361, 0, 0.6745098, 1, 1,
0.1711844, 0.9629296, 2.169956, 0, 0.6705883, 1, 1,
0.1713207, -0.1885116, 4.365586, 0, 0.6627451, 1, 1,
0.174423, 1.591519, -1.09681, 0, 0.6588235, 1, 1,
0.1759672, 0.5063202, -0.1493404, 0, 0.6509804, 1, 1,
0.1762484, -0.988445, 3.462127, 0, 0.6470588, 1, 1,
0.179318, -0.5459203, 1.95546, 0, 0.6392157, 1, 1,
0.1826513, -0.1289429, 2.136988, 0, 0.6352941, 1, 1,
0.1850129, 1.312576, 0.8848306, 0, 0.627451, 1, 1,
0.1881133, -0.3918828, 3.218567, 0, 0.6235294, 1, 1,
0.1891774, 1.567107, 1.404033, 0, 0.6156863, 1, 1,
0.1900878, 1.503438, 0.4772696, 0, 0.6117647, 1, 1,
0.1967431, 1.236416, 1.349049, 0, 0.6039216, 1, 1,
0.1982251, -0.8306935, 3.219733, 0, 0.5960785, 1, 1,
0.2090175, 0.5096329, 0.8975039, 0, 0.5921569, 1, 1,
0.2110175, -0.9084728, 3.988346, 0, 0.5843138, 1, 1,
0.2119371, -0.4810778, 3.900217, 0, 0.5803922, 1, 1,
0.2134807, -0.8370469, 3.085589, 0, 0.572549, 1, 1,
0.2139438, -0.4729505, 2.361144, 0, 0.5686275, 1, 1,
0.2139705, 0.1801999, -1.19236, 0, 0.5607843, 1, 1,
0.2161063, -1.102573, 2.275321, 0, 0.5568628, 1, 1,
0.2164665, -2.064591, 4.751257, 0, 0.5490196, 1, 1,
0.2170632, -0.0958107, 2.052119, 0, 0.5450981, 1, 1,
0.2190489, -1.107993, 4.285327, 0, 0.5372549, 1, 1,
0.2201313, -0.2845231, 1.638816, 0, 0.5333334, 1, 1,
0.2205594, -1.229761, 1.798655, 0, 0.5254902, 1, 1,
0.2214001, -0.2506756, 2.692039, 0, 0.5215687, 1, 1,
0.2261255, -1.169512, 3.482676, 0, 0.5137255, 1, 1,
0.2275355, 1.039035, -2.129102, 0, 0.509804, 1, 1,
0.2287221, -0.884689, 2.792384, 0, 0.5019608, 1, 1,
0.2300299, -0.7780048, 1.741367, 0, 0.4941176, 1, 1,
0.2318609, 0.1989386, 0.3648356, 0, 0.4901961, 1, 1,
0.2378885, 0.1026148, 2.383986, 0, 0.4823529, 1, 1,
0.2467398, 0.3841936, 2.482327, 0, 0.4784314, 1, 1,
0.2494147, 0.4834891, 0.2734735, 0, 0.4705882, 1, 1,
0.2504515, 1.386227, -0.613678, 0, 0.4666667, 1, 1,
0.254109, -0.006214426, 2.611068, 0, 0.4588235, 1, 1,
0.2589351, 0.4626998, 0.5974628, 0, 0.454902, 1, 1,
0.2598646, -0.8842409, 3.075965, 0, 0.4470588, 1, 1,
0.2688792, -0.09194677, 1.119668, 0, 0.4431373, 1, 1,
0.2728259, -1.534953, 0.2545919, 0, 0.4352941, 1, 1,
0.2735035, -0.1086555, 2.895252, 0, 0.4313726, 1, 1,
0.2741805, -1.284043, 3.683018, 0, 0.4235294, 1, 1,
0.2745878, 0.6435986, -0.378242, 0, 0.4196078, 1, 1,
0.2764417, 1.992839, 1.21443, 0, 0.4117647, 1, 1,
0.2766223, -0.2904539, 1.289219, 0, 0.4078431, 1, 1,
0.2802258, -0.02661362, 1.535307, 0, 0.4, 1, 1,
0.2834777, -1.22584, 3.843655, 0, 0.3921569, 1, 1,
0.2847987, 2.281437, -1.433836, 0, 0.3882353, 1, 1,
0.2931298, 1.630674, 1.363357, 0, 0.3803922, 1, 1,
0.2956006, 0.4351696, -0.4439075, 0, 0.3764706, 1, 1,
0.3063464, 0.300445, 1.762644, 0, 0.3686275, 1, 1,
0.3073205, -1.109039, 1.809456, 0, 0.3647059, 1, 1,
0.30767, -0.3884493, 2.916214, 0, 0.3568628, 1, 1,
0.3084749, -1.730508, 2.96834, 0, 0.3529412, 1, 1,
0.3095445, -0.4145634, 3.634254, 0, 0.345098, 1, 1,
0.3133366, -0.4281035, 3.361838, 0, 0.3411765, 1, 1,
0.3196071, 0.7232888, -0.2136536, 0, 0.3333333, 1, 1,
0.3199857, 3.548727, 1.440507, 0, 0.3294118, 1, 1,
0.3263316, 1.850224, -0.291859, 0, 0.3215686, 1, 1,
0.3282633, 1.293171, 1.553316, 0, 0.3176471, 1, 1,
0.3284892, -0.5222759, 2.776928, 0, 0.3098039, 1, 1,
0.3305435, 1.250409, 1.143178, 0, 0.3058824, 1, 1,
0.3416161, -0.3265904, 2.236948, 0, 0.2980392, 1, 1,
0.3449192, 0.5547546, 2.058522, 0, 0.2901961, 1, 1,
0.3463275, 0.4252652, 1.095288, 0, 0.2862745, 1, 1,
0.3546194, -0.1198311, 1.508998, 0, 0.2784314, 1, 1,
0.3570847, 0.0972361, 0.4527047, 0, 0.2745098, 1, 1,
0.3574375, -0.1803285, 1.365119, 0, 0.2666667, 1, 1,
0.358228, -0.3383638, 2.511421, 0, 0.2627451, 1, 1,
0.36023, 0.4341952, 0.4911698, 0, 0.254902, 1, 1,
0.3624254, -1.549134, 1.337471, 0, 0.2509804, 1, 1,
0.3634529, 1.075827, 0.6310635, 0, 0.2431373, 1, 1,
0.3675292, 1.277301, 1.308663, 0, 0.2392157, 1, 1,
0.3733662, 0.9370728, 0.4751413, 0, 0.2313726, 1, 1,
0.3812259, -0.9784288, 4.47615, 0, 0.227451, 1, 1,
0.3822461, 1.593649, 0.2978925, 0, 0.2196078, 1, 1,
0.3826795, 1.444145, 0.5261062, 0, 0.2156863, 1, 1,
0.39147, 0.2674512, 2.470851, 0, 0.2078431, 1, 1,
0.3915595, 1.984846, 0.001936904, 0, 0.2039216, 1, 1,
0.3961672, 0.5146282, 0.1759682, 0, 0.1960784, 1, 1,
0.4055231, 0.4420856, 1.043374, 0, 0.1882353, 1, 1,
0.4061682, -1.229099, 2.138235, 0, 0.1843137, 1, 1,
0.4090124, 1.003215, -0.1222339, 0, 0.1764706, 1, 1,
0.4100116, -1.136573, 2.840032, 0, 0.172549, 1, 1,
0.4145811, 1.4546, -0.9772511, 0, 0.1647059, 1, 1,
0.4168561, -0.3502201, 1.729983, 0, 0.1607843, 1, 1,
0.4178639, -0.2310802, 2.53205, 0, 0.1529412, 1, 1,
0.4210029, -0.02358831, -0.7376044, 0, 0.1490196, 1, 1,
0.4210282, -1.257027, 2.836632, 0, 0.1411765, 1, 1,
0.4227004, 1.111393, 0.5670828, 0, 0.1372549, 1, 1,
0.4245202, 2.157569, 0.04759739, 0, 0.1294118, 1, 1,
0.4250908, 0.003965755, 2.110745, 0, 0.1254902, 1, 1,
0.4275734, 0.1700248, 0.4060404, 0, 0.1176471, 1, 1,
0.4314755, -0.0828632, 1.791759, 0, 0.1137255, 1, 1,
0.4347189, -0.6230844, 2.166048, 0, 0.1058824, 1, 1,
0.4353174, -0.6392046, 3.447168, 0, 0.09803922, 1, 1,
0.4353291, 0.4369053, 1.75456, 0, 0.09411765, 1, 1,
0.4372781, -1.758623, 5.148986, 0, 0.08627451, 1, 1,
0.4389307, 1.241275, 0.1520257, 0, 0.08235294, 1, 1,
0.4408436, -0.1093574, 2.552185, 0, 0.07450981, 1, 1,
0.4420059, -2.018507, 4.815824, 0, 0.07058824, 1, 1,
0.4436086, -0.6092106, 2.591909, 0, 0.0627451, 1, 1,
0.4448195, -0.869676, 3.280678, 0, 0.05882353, 1, 1,
0.4520392, -2.248253, 5.163902, 0, 0.05098039, 1, 1,
0.4553294, -1.286481, 3.353004, 0, 0.04705882, 1, 1,
0.4567393, -0.8120573, 3.094536, 0, 0.03921569, 1, 1,
0.4569148, -1.315224, 3.426604, 0, 0.03529412, 1, 1,
0.4622798, 0.5958111, 1.307765, 0, 0.02745098, 1, 1,
0.4635079, 0.5318518, 1.804333, 0, 0.02352941, 1, 1,
0.4637705, 0.363423, 2.138039, 0, 0.01568628, 1, 1,
0.4671405, 0.09061252, 1.047721, 0, 0.01176471, 1, 1,
0.4678766, 0.2441597, 0.4734311, 0, 0.003921569, 1, 1,
0.4685198, 0.9555476, 0.04602496, 0.003921569, 0, 1, 1,
0.4721038, 0.4398538, 1.642336, 0.007843138, 0, 1, 1,
0.4722048, 0.5143974, 0.854893, 0.01568628, 0, 1, 1,
0.4735087, 1.889676, 1.156353, 0.01960784, 0, 1, 1,
0.4738576, 0.7381482, 1.60732, 0.02745098, 0, 1, 1,
0.476239, 0.3984191, 1.786412, 0.03137255, 0, 1, 1,
0.479167, -0.4551835, 4.809419, 0.03921569, 0, 1, 1,
0.4810255, 0.009649653, 2.560725, 0.04313726, 0, 1, 1,
0.4852087, 0.5194048, 2.238044, 0.05098039, 0, 1, 1,
0.4888745, 0.1965073, 1.949378, 0.05490196, 0, 1, 1,
0.4891764, -0.8782673, 1.753466, 0.0627451, 0, 1, 1,
0.4896331, 0.8737774, -0.1151431, 0.06666667, 0, 1, 1,
0.494395, 0.283085, 0.5794863, 0.07450981, 0, 1, 1,
0.5045621, 0.2489105, 2.158202, 0.07843138, 0, 1, 1,
0.526004, 1.709826, 0.3238226, 0.08627451, 0, 1, 1,
0.5269083, 0.8489872, 0.7857029, 0.09019608, 0, 1, 1,
0.5281907, -0.1627085, 2.915953, 0.09803922, 0, 1, 1,
0.5300661, 0.5674829, 0.4011283, 0.1058824, 0, 1, 1,
0.5323106, 0.2005118, 2.01695, 0.1098039, 0, 1, 1,
0.5350165, -0.3862684, 2.749993, 0.1176471, 0, 1, 1,
0.5375713, 1.435627, -1.610989, 0.1215686, 0, 1, 1,
0.5379515, -1.517054, 2.879639, 0.1294118, 0, 1, 1,
0.5402142, 0.6133533, 2.317912, 0.1333333, 0, 1, 1,
0.5443321, 2.2658, 0.3613624, 0.1411765, 0, 1, 1,
0.5475808, -0.4388823, 3.50879, 0.145098, 0, 1, 1,
0.547909, 0.6758739, -0.8266328, 0.1529412, 0, 1, 1,
0.5485047, -0.6793233, 2.159604, 0.1568628, 0, 1, 1,
0.5508612, 0.3978626, 1.651356, 0.1647059, 0, 1, 1,
0.5560367, -0.2347571, 0.5301595, 0.1686275, 0, 1, 1,
0.5591076, -1.647836, 2.247886, 0.1764706, 0, 1, 1,
0.5629493, -1.218366, 4.18399, 0.1803922, 0, 1, 1,
0.5695779, -1.485722, 3.764613, 0.1882353, 0, 1, 1,
0.5735168, 0.06916083, 0.8127867, 0.1921569, 0, 1, 1,
0.5743163, -0.1731278, 2.856402, 0.2, 0, 1, 1,
0.575004, -1.931382, 3.382635, 0.2078431, 0, 1, 1,
0.5757064, 0.8648251, 1.019114, 0.2117647, 0, 1, 1,
0.575992, -1.459957, 1.516925, 0.2196078, 0, 1, 1,
0.5771912, -0.4061346, 2.596221, 0.2235294, 0, 1, 1,
0.5783585, 1.50047, 1.566538, 0.2313726, 0, 1, 1,
0.5790041, -0.3926412, 0.9544937, 0.2352941, 0, 1, 1,
0.5833923, -1.559178, 1.478993, 0.2431373, 0, 1, 1,
0.5901404, -0.9298701, 2.776666, 0.2470588, 0, 1, 1,
0.5902176, -0.3841804, 1.503781, 0.254902, 0, 1, 1,
0.590359, 0.4056205, 0.7051459, 0.2588235, 0, 1, 1,
0.5914757, -0.06677494, 0.9856836, 0.2666667, 0, 1, 1,
0.5924686, 0.8676693, 1.204243, 0.2705882, 0, 1, 1,
0.5930306, -0.4199203, 2.551504, 0.2784314, 0, 1, 1,
0.6013716, 0.04361295, 0.3300764, 0.282353, 0, 1, 1,
0.6053694, 2.865916, 0.5553589, 0.2901961, 0, 1, 1,
0.6064046, -0.3940252, 1.418143, 0.2941177, 0, 1, 1,
0.6066609, 1.15561, 0.9784853, 0.3019608, 0, 1, 1,
0.6090841, -1.233724, 2.832612, 0.3098039, 0, 1, 1,
0.6222218, -0.3653436, 1.804558, 0.3137255, 0, 1, 1,
0.6271968, 1.777184, 0.1665156, 0.3215686, 0, 1, 1,
0.6290584, -0.139379, 1.251879, 0.3254902, 0, 1, 1,
0.6295902, -0.3107536, 1.988176, 0.3333333, 0, 1, 1,
0.6308703, -0.5866054, 3.058417, 0.3372549, 0, 1, 1,
0.6325552, 1.393934, -0.3553181, 0.345098, 0, 1, 1,
0.6384192, -2.04478, 3.276231, 0.3490196, 0, 1, 1,
0.6394351, -0.455006, 2.332746, 0.3568628, 0, 1, 1,
0.640262, -0.4757982, 3.016826, 0.3607843, 0, 1, 1,
0.6473321, -1.159802, 2.164377, 0.3686275, 0, 1, 1,
0.6486633, 1.10339, 0.9280162, 0.372549, 0, 1, 1,
0.6514869, -0.2317942, 2.350963, 0.3803922, 0, 1, 1,
0.6548697, -0.7665758, 3.228839, 0.3843137, 0, 1, 1,
0.6559417, 0.08694042, 0.4621234, 0.3921569, 0, 1, 1,
0.6560907, 0.1355888, -0.04052743, 0.3960784, 0, 1, 1,
0.6587933, 0.6101002, 2.349264, 0.4039216, 0, 1, 1,
0.65902, 0.3725334, 2.436117, 0.4117647, 0, 1, 1,
0.660474, 1.94441, 0.4749306, 0.4156863, 0, 1, 1,
0.6615675, 0.3027606, -0.6731613, 0.4235294, 0, 1, 1,
0.6631011, 2.261544, 2.193918, 0.427451, 0, 1, 1,
0.6646976, 0.1691948, 0.1788803, 0.4352941, 0, 1, 1,
0.6661561, -0.2968088, 0.2645108, 0.4392157, 0, 1, 1,
0.6695657, -0.02982708, 2.828476, 0.4470588, 0, 1, 1,
0.6729948, 0.5948946, 0.2889672, 0.4509804, 0, 1, 1,
0.6789854, -1.037776, 2.750725, 0.4588235, 0, 1, 1,
0.6796769, 0.9232907, -0.2831145, 0.4627451, 0, 1, 1,
0.6801955, -0.06366165, 2.765706, 0.4705882, 0, 1, 1,
0.6821127, 0.5662934, 1.310661, 0.4745098, 0, 1, 1,
0.6854678, -1.217287, 2.536971, 0.4823529, 0, 1, 1,
0.6891689, 1.288281, 0.9741365, 0.4862745, 0, 1, 1,
0.6915361, -0.4511867, 0.4684426, 0.4941176, 0, 1, 1,
0.6923283, 0.8493635, 0.1137945, 0.5019608, 0, 1, 1,
0.6942244, -0.5412748, 2.173847, 0.5058824, 0, 1, 1,
0.6978259, -0.3057058, 2.728519, 0.5137255, 0, 1, 1,
0.698769, 0.65224, -0.09213866, 0.5176471, 0, 1, 1,
0.699203, 0.3671467, 2.19216, 0.5254902, 0, 1, 1,
0.701185, 0.9264955, 1.751066, 0.5294118, 0, 1, 1,
0.7058557, -0.7849137, 1.410788, 0.5372549, 0, 1, 1,
0.7080106, -1.998177, 1.241439, 0.5411765, 0, 1, 1,
0.7095159, 0.1981727, 0.1084429, 0.5490196, 0, 1, 1,
0.7114527, 0.2575287, 1.050097, 0.5529412, 0, 1, 1,
0.7162473, 2.992396, 0.2692868, 0.5607843, 0, 1, 1,
0.7254957, 0.5320879, -0.2643137, 0.5647059, 0, 1, 1,
0.737314, -0.04420813, 1.66384, 0.572549, 0, 1, 1,
0.7415102, 0.2689873, 0.3844138, 0.5764706, 0, 1, 1,
0.7432464, 0.08100773, 2.216478, 0.5843138, 0, 1, 1,
0.7508394, -1.906457, 2.30681, 0.5882353, 0, 1, 1,
0.7634683, -0.1831801, 2.972155, 0.5960785, 0, 1, 1,
0.7693412, 0.6016544, -0.4698655, 0.6039216, 0, 1, 1,
0.7704815, -0.575311, 3.274902, 0.6078432, 0, 1, 1,
0.7714969, -1.988437, 3.982226, 0.6156863, 0, 1, 1,
0.7745271, -0.06488194, 0.8833083, 0.6196079, 0, 1, 1,
0.7761805, 0.751013, -0.4991381, 0.627451, 0, 1, 1,
0.7766827, 2.567504, 1.253406, 0.6313726, 0, 1, 1,
0.7827162, 0.9927759, 1.945453, 0.6392157, 0, 1, 1,
0.7848261, 0.5519565, 0.4010546, 0.6431373, 0, 1, 1,
0.7868873, 1.138925, 0.8973967, 0.6509804, 0, 1, 1,
0.7997991, 0.9030559, 0.2104088, 0.654902, 0, 1, 1,
0.8051606, 1.279913, 1.134306, 0.6627451, 0, 1, 1,
0.82173, 1.808173, -0.250251, 0.6666667, 0, 1, 1,
0.8258567, 0.1239159, 1.807532, 0.6745098, 0, 1, 1,
0.82679, -0.1669967, 1.352253, 0.6784314, 0, 1, 1,
0.8288625, 0.5353583, 2.090427, 0.6862745, 0, 1, 1,
0.8303894, -0.176758, 3.216822, 0.6901961, 0, 1, 1,
0.8343475, -1.141531, 2.476747, 0.6980392, 0, 1, 1,
0.8349725, -0.7198278, 2.905331, 0.7058824, 0, 1, 1,
0.8378835, 1.23786, 0.5133054, 0.7098039, 0, 1, 1,
0.8396816, 0.785795, -1.027348, 0.7176471, 0, 1, 1,
0.8435919, 0.2224202, 1.35932, 0.7215686, 0, 1, 1,
0.8445374, -0.6904631, 0.5447233, 0.7294118, 0, 1, 1,
0.849935, 0.1985176, 2.290298, 0.7333333, 0, 1, 1,
0.8514203, -0.7518741, 1.732273, 0.7411765, 0, 1, 1,
0.8557186, -0.4131216, 2.086194, 0.7450981, 0, 1, 1,
0.8631759, -0.320976, 2.382123, 0.7529412, 0, 1, 1,
0.865158, 1.293649, 0.4602953, 0.7568628, 0, 1, 1,
0.86616, -0.9862141, 2.065413, 0.7647059, 0, 1, 1,
0.8663504, -0.1939265, 1.7189, 0.7686275, 0, 1, 1,
0.8693887, -1.024293, 2.36865, 0.7764706, 0, 1, 1,
0.8727715, -0.8392997, 1.778669, 0.7803922, 0, 1, 1,
0.8767754, 0.3029425, -0.4958342, 0.7882353, 0, 1, 1,
0.8767809, -1.252701, 1.908148, 0.7921569, 0, 1, 1,
0.8803633, -0.16175, 1.586641, 0.8, 0, 1, 1,
0.8845916, 1.825764, 0.7704583, 0.8078431, 0, 1, 1,
0.8977774, -2.718275, 4.597281, 0.8117647, 0, 1, 1,
0.8995128, 1.330495, 2.63733, 0.8196079, 0, 1, 1,
0.902207, 0.8961365, 0.4795159, 0.8235294, 0, 1, 1,
0.9032204, -1.290016, 3.428177, 0.8313726, 0, 1, 1,
0.9123528, 0.4906492, -0.3938292, 0.8352941, 0, 1, 1,
0.9150969, -0.8117746, 0.7221157, 0.8431373, 0, 1, 1,
0.9206994, 0.3245881, 1.706759, 0.8470588, 0, 1, 1,
0.9242676, -0.7184142, 1.12663, 0.854902, 0, 1, 1,
0.9292274, 0.5454865, 0.4937218, 0.8588235, 0, 1, 1,
0.9310473, 0.4169903, 0.6690058, 0.8666667, 0, 1, 1,
0.9424812, -0.9334047, 3.063429, 0.8705882, 0, 1, 1,
0.9530486, 0.03891395, 2.712027, 0.8784314, 0, 1, 1,
0.9563315, 1.659744, -0.5557681, 0.8823529, 0, 1, 1,
0.9581491, -0.5820808, 2.253279, 0.8901961, 0, 1, 1,
0.9585725, -0.07826736, 2.274254, 0.8941177, 0, 1, 1,
0.966564, -0.3437139, 1.112224, 0.9019608, 0, 1, 1,
0.9693415, 0.6177821, 1.023247, 0.9098039, 0, 1, 1,
0.9709958, -1.038107, 2.920991, 0.9137255, 0, 1, 1,
0.9736068, 0.5640123, 0.5594253, 0.9215686, 0, 1, 1,
0.9743052, -1.062752, 1.884249, 0.9254902, 0, 1, 1,
0.9772447, 0.7073446, 1.385076, 0.9333333, 0, 1, 1,
0.9813886, 0.4807438, 0.8158407, 0.9372549, 0, 1, 1,
0.9915233, 0.1963976, 2.009165, 0.945098, 0, 1, 1,
0.9931133, -1.351789, 1.985384, 0.9490196, 0, 1, 1,
0.9968344, 0.9012846, 1.218493, 0.9568627, 0, 1, 1,
0.9982622, 1.043576, 0.8540435, 0.9607843, 0, 1, 1,
0.998645, 0.1925704, 1.083573, 0.9686275, 0, 1, 1,
1.002391, 0.1470873, 3.006079, 0.972549, 0, 1, 1,
1.005446, 0.7803655, 0.5989051, 0.9803922, 0, 1, 1,
1.007148, -0.7266958, 2.077881, 0.9843137, 0, 1, 1,
1.01288, 0.564851, 1.805233, 0.9921569, 0, 1, 1,
1.016387, 1.514379, 1.557473, 0.9960784, 0, 1, 1,
1.021325, -0.8065153, 3.375584, 1, 0, 0.9960784, 1,
1.025282, 1.345188, 1.962885, 1, 0, 0.9882353, 1,
1.026724, -0.05078011, 2.58417, 1, 0, 0.9843137, 1,
1.027972, 0.3519269, 3.299986, 1, 0, 0.9764706, 1,
1.028545, 0.9768321, 0.42144, 1, 0, 0.972549, 1,
1.029624, 0.6812553, -0.8553492, 1, 0, 0.9647059, 1,
1.031375, -0.2188098, 1.419237, 1, 0, 0.9607843, 1,
1.032344, 0.07057374, 2.497673, 1, 0, 0.9529412, 1,
1.038315, 2.102021, -0.3200228, 1, 0, 0.9490196, 1,
1.041089, 0.6460006, 1.551371, 1, 0, 0.9411765, 1,
1.046181, -0.09419223, 0.4992913, 1, 0, 0.9372549, 1,
1.052358, 0.9205673, -1.151596, 1, 0, 0.9294118, 1,
1.058251, 0.8185416, 1.432843, 1, 0, 0.9254902, 1,
1.061589, -0.8336754, 3.078505, 1, 0, 0.9176471, 1,
1.06523, -0.3947368, 1.914283, 1, 0, 0.9137255, 1,
1.066915, 1.930186, 0.4027896, 1, 0, 0.9058824, 1,
1.073033, -0.4208775, 0.7327584, 1, 0, 0.9019608, 1,
1.079262, 0.6480091, 0.6867719, 1, 0, 0.8941177, 1,
1.08596, -0.6928366, 1.784807, 1, 0, 0.8862745, 1,
1.08751, -0.4711183, 2.38457, 1, 0, 0.8823529, 1,
1.090287, 0.5754096, 0.04067202, 1, 0, 0.8745098, 1,
1.101941, 1.589875, -0.5049751, 1, 0, 0.8705882, 1,
1.103153, 1.094812, 1.718965, 1, 0, 0.8627451, 1,
1.109463, 0.1447124, 1.110419, 1, 0, 0.8588235, 1,
1.110562, 1.037298, 0.3543685, 1, 0, 0.8509804, 1,
1.112618, -0.1342827, 0.88677, 1, 0, 0.8470588, 1,
1.113034, 0.2625923, 2.753997, 1, 0, 0.8392157, 1,
1.121338, 2.556497, 1.603853, 1, 0, 0.8352941, 1,
1.133801, 1.603516, 0.8559978, 1, 0, 0.827451, 1,
1.135211, -1.843218, 1.846077, 1, 0, 0.8235294, 1,
1.147704, -0.6999025, 0.9928387, 1, 0, 0.8156863, 1,
1.149839, 0.8528143, 1.34098, 1, 0, 0.8117647, 1,
1.153968, 2.52527, 1.018035, 1, 0, 0.8039216, 1,
1.15443, -0.134681, 1.975171, 1, 0, 0.7960784, 1,
1.162232, -1.863219, 4.021245, 1, 0, 0.7921569, 1,
1.16449, -0.06353861, 1.604187, 1, 0, 0.7843137, 1,
1.174213, -1.145888, 2.041169, 1, 0, 0.7803922, 1,
1.174603, 0.2670894, -0.1063337, 1, 0, 0.772549, 1,
1.182269, -1.483091, 4.241879, 1, 0, 0.7686275, 1,
1.184798, 0.2022429, 2.429558, 1, 0, 0.7607843, 1,
1.202959, -1.106114, 2.377975, 1, 0, 0.7568628, 1,
1.206817, 1.627969, -0.1163041, 1, 0, 0.7490196, 1,
1.211031, 0.03192615, 2.347281, 1, 0, 0.7450981, 1,
1.211354, 0.05854007, 1.728502, 1, 0, 0.7372549, 1,
1.214948, 0.6755719, 2.566932, 1, 0, 0.7333333, 1,
1.215766, 0.2771383, 2.022492, 1, 0, 0.7254902, 1,
1.219016, 1.091654, 0.5297083, 1, 0, 0.7215686, 1,
1.225287, -0.2845056, 0.8559659, 1, 0, 0.7137255, 1,
1.233316, -0.1708764, 1.515276, 1, 0, 0.7098039, 1,
1.234412, -0.6685653, 1.785485, 1, 0, 0.7019608, 1,
1.23831, -1.233924, 1.238745, 1, 0, 0.6941177, 1,
1.242807, -1.459026, 2.911875, 1, 0, 0.6901961, 1,
1.246339, 2.004685, 1.926373, 1, 0, 0.682353, 1,
1.261917, 1.031682, -0.1037083, 1, 0, 0.6784314, 1,
1.263107, 0.465206, -0.2138568, 1, 0, 0.6705883, 1,
1.26436, 0.3707494, 1.82627, 1, 0, 0.6666667, 1,
1.280584, -0.0447972, 1.897309, 1, 0, 0.6588235, 1,
1.295033, 2.327419, 0.1746399, 1, 0, 0.654902, 1,
1.295112, -0.9579188, 1.94079, 1, 0, 0.6470588, 1,
1.297939, 2.680057, -0.3575174, 1, 0, 0.6431373, 1,
1.304435, -1.411319, 2.966245, 1, 0, 0.6352941, 1,
1.317785, 0.3102871, 0.09219621, 1, 0, 0.6313726, 1,
1.318106, 1.14238, 1.846527, 1, 0, 0.6235294, 1,
1.320837, 0.6018371, 1.97537, 1, 0, 0.6196079, 1,
1.338018, 0.6754372, 2.430055, 1, 0, 0.6117647, 1,
1.338729, 1.091405, 0.1482718, 1, 0, 0.6078432, 1,
1.339717, 0.2973687, 2.148769, 1, 0, 0.6, 1,
1.350599, -1.175807, 2.321594, 1, 0, 0.5921569, 1,
1.352572, 1.82194, 0.3475626, 1, 0, 0.5882353, 1,
1.359617, 0.4130785, 2.850572, 1, 0, 0.5803922, 1,
1.36195, -0.05542197, 2.232744, 1, 0, 0.5764706, 1,
1.363095, -0.2393382, 2.856347, 1, 0, 0.5686275, 1,
1.368728, -1.885737, 2.51379, 1, 0, 0.5647059, 1,
1.371923, -0.2041034, 2.533244, 1, 0, 0.5568628, 1,
1.379137, 0.3676766, 0.3382327, 1, 0, 0.5529412, 1,
1.382939, -2.730927, 2.106854, 1, 0, 0.5450981, 1,
1.386397, -0.6683153, 1.651819, 1, 0, 0.5411765, 1,
1.392082, -0.1499854, 0.222322, 1, 0, 0.5333334, 1,
1.402105, -0.7785082, 3.157102, 1, 0, 0.5294118, 1,
1.403888, 1.927829, -0.634151, 1, 0, 0.5215687, 1,
1.404278, 0.8185013, 1.609049, 1, 0, 0.5176471, 1,
1.409635, -0.3293581, 2.521751, 1, 0, 0.509804, 1,
1.411597, 2.052271, -0.9228854, 1, 0, 0.5058824, 1,
1.412235, 1.309525, 0.6802014, 1, 0, 0.4980392, 1,
1.416468, 1.182521, 0.9379657, 1, 0, 0.4901961, 1,
1.417901, -1.079228, 2.207302, 1, 0, 0.4862745, 1,
1.435502, 0.5812296, 2.707453, 1, 0, 0.4784314, 1,
1.436079, 0.1391087, 3.435681, 1, 0, 0.4745098, 1,
1.455487, -0.2775419, -0.4920889, 1, 0, 0.4666667, 1,
1.457524, -0.5696014, 0.5364377, 1, 0, 0.4627451, 1,
1.458176, 0.8006696, 0.6315215, 1, 0, 0.454902, 1,
1.461044, 0.2037602, 1.836086, 1, 0, 0.4509804, 1,
1.462263, 2.481358, 2.292961, 1, 0, 0.4431373, 1,
1.463148, 0.8624247, 0.9547893, 1, 0, 0.4392157, 1,
1.47804, 0.2534119, 0.3943245, 1, 0, 0.4313726, 1,
1.485591, 1.335915, -0.01474475, 1, 0, 0.427451, 1,
1.495866, 0.8589172, -0.006031004, 1, 0, 0.4196078, 1,
1.502476, 0.564814, 2.190457, 1, 0, 0.4156863, 1,
1.507584, -0.6144188, 2.581927, 1, 0, 0.4078431, 1,
1.510568, -0.2129963, 1.003826, 1, 0, 0.4039216, 1,
1.516049, -0.5016208, 2.011969, 1, 0, 0.3960784, 1,
1.517351, 1.549072, 0.0313786, 1, 0, 0.3882353, 1,
1.521949, 0.3225887, 1.863691, 1, 0, 0.3843137, 1,
1.525347, 0.1808344, 0.7944604, 1, 0, 0.3764706, 1,
1.529114, -0.1217106, 2.039498, 1, 0, 0.372549, 1,
1.531112, -0.1534011, 1.5225, 1, 0, 0.3647059, 1,
1.535612, 0.4229998, 3.528613, 1, 0, 0.3607843, 1,
1.536182, 0.5382617, -0.3558573, 1, 0, 0.3529412, 1,
1.542114, 0.5563979, 2.081048, 1, 0, 0.3490196, 1,
1.546602, 0.4292196, 2.745539, 1, 0, 0.3411765, 1,
1.564292, 0.4671782, 2.339382, 1, 0, 0.3372549, 1,
1.574544, -0.28267, 2.650499, 1, 0, 0.3294118, 1,
1.578515, 0.2152511, 2.224601, 1, 0, 0.3254902, 1,
1.578668, 2.856182, 1.87288, 1, 0, 0.3176471, 1,
1.583929, 1.648523, 0.972667, 1, 0, 0.3137255, 1,
1.604153, -0.1153786, 0.5208721, 1, 0, 0.3058824, 1,
1.607046, -1.201775, 1.833024, 1, 0, 0.2980392, 1,
1.608984, -0.1042577, 2.043531, 1, 0, 0.2941177, 1,
1.611763, 0.6053092, 2.277947, 1, 0, 0.2862745, 1,
1.618829, -0.9298224, 2.278456, 1, 0, 0.282353, 1,
1.628173, 1.198084, 0.5780987, 1, 0, 0.2745098, 1,
1.640317, -0.4907571, 2.619699, 1, 0, 0.2705882, 1,
1.65361, 0.7921506, 1.248589, 1, 0, 0.2627451, 1,
1.655663, -0.440669, 1.764812, 1, 0, 0.2588235, 1,
1.6557, 0.2548105, 1.196953, 1, 0, 0.2509804, 1,
1.675199, 0.02727361, 1.679551, 1, 0, 0.2470588, 1,
1.676805, -0.514217, 1.068328, 1, 0, 0.2392157, 1,
1.678373, 0.5993787, 3.002584, 1, 0, 0.2352941, 1,
1.689669, 0.01253379, 2.068159, 1, 0, 0.227451, 1,
1.692874, -1.07399, 1.386813, 1, 0, 0.2235294, 1,
1.715588, -0.4989639, 3.389006, 1, 0, 0.2156863, 1,
1.716898, 1.23105, 1.510644, 1, 0, 0.2117647, 1,
1.742657, -0.09877941, 0.6133493, 1, 0, 0.2039216, 1,
1.748688, -0.6116368, 2.137758, 1, 0, 0.1960784, 1,
1.80337, 0.08243988, 1.275699, 1, 0, 0.1921569, 1,
1.808481, -0.6597728, 2.19469, 1, 0, 0.1843137, 1,
1.815387, 0.6351972, 3.888309, 1, 0, 0.1803922, 1,
1.826806, 1.169406, 2.26495, 1, 0, 0.172549, 1,
1.829518, 0.9562448, 2.15485, 1, 0, 0.1686275, 1,
1.837767, -0.2674318, 2.648023, 1, 0, 0.1607843, 1,
1.90646, 1.025443, -0.4320296, 1, 0, 0.1568628, 1,
1.909911, 0.2869971, 2.16362, 1, 0, 0.1490196, 1,
1.917303, -1.344962, 1.833901, 1, 0, 0.145098, 1,
1.944516, 0.8259703, 0.2656331, 1, 0, 0.1372549, 1,
1.950209, 0.4817098, 1.269759, 1, 0, 0.1333333, 1,
1.951593, -0.7029266, 2.533762, 1, 0, 0.1254902, 1,
1.95437, 0.3177759, -0.1633753, 1, 0, 0.1215686, 1,
1.954728, 0.5333339, 1.444027, 1, 0, 0.1137255, 1,
1.957518, 0.7853285, 1.757013, 1, 0, 0.1098039, 1,
2.074759, 0.4877069, 2.435879, 1, 0, 0.1019608, 1,
2.091797, -0.04408998, 2.53749, 1, 0, 0.09411765, 1,
2.100588, 0.003285225, 1.284896, 1, 0, 0.09019608, 1,
2.185837, 1.261207, 0.3096258, 1, 0, 0.08235294, 1,
2.201917, -0.5706072, 2.276713, 1, 0, 0.07843138, 1,
2.235405, -1.891907, 4.084527, 1, 0, 0.07058824, 1,
2.257035, 0.09006961, 2.648313, 1, 0, 0.06666667, 1,
2.282232, 1.142138, 0.8149405, 1, 0, 0.05882353, 1,
2.43723, 1.94391, 0.08923366, 1, 0, 0.05490196, 1,
2.515202, 0.7043805, 1.984962, 1, 0, 0.04705882, 1,
2.524172, -0.1705263, 1.388532, 1, 0, 0.04313726, 1,
2.560879, 0.7543738, 3.641977, 1, 0, 0.03529412, 1,
2.564519, -1.059443, 2.518476, 1, 0, 0.03137255, 1,
2.608268, 0.704322, 0.5104798, 1, 0, 0.02352941, 1,
2.742703, -0.6402866, 1.869967, 1, 0, 0.01960784, 1,
2.879578, 1.469878, 0.2416331, 1, 0, 0.01176471, 1,
2.980676, 1.638942, 0.267968, 1, 0, 0.007843138, 1
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
-0.1238103, -3.795329, -7.908818, 0, -0.5, 0.5, 0.5,
-0.1238103, -3.795329, -7.908818, 1, -0.5, 0.5, 0.5,
-0.1238103, -3.795329, -7.908818, 1, 1.5, 0.5, 0.5,
-0.1238103, -3.795329, -7.908818, 0, 1.5, 0.5, 0.5
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
-4.280718, 0.4088998, -7.908818, 0, -0.5, 0.5, 0.5,
-4.280718, 0.4088998, -7.908818, 1, -0.5, 0.5, 0.5,
-4.280718, 0.4088998, -7.908818, 1, 1.5, 0.5, 0.5,
-4.280718, 0.4088998, -7.908818, 0, 1.5, 0.5, 0.5
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
-4.280718, -3.795329, -0.03696942, 0, -0.5, 0.5, 0.5,
-4.280718, -3.795329, -0.03696942, 1, -0.5, 0.5, 0.5,
-4.280718, -3.795329, -0.03696942, 1, 1.5, 0.5, 0.5,
-4.280718, -3.795329, -0.03696942, 0, 1.5, 0.5, 0.5
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
-3, -2.825122, -6.092237,
2, -2.825122, -6.092237,
-3, -2.825122, -6.092237,
-3, -2.986823, -6.395001,
-2, -2.825122, -6.092237,
-2, -2.986823, -6.395001,
-1, -2.825122, -6.092237,
-1, -2.986823, -6.395001,
0, -2.825122, -6.092237,
0, -2.986823, -6.395001,
1, -2.825122, -6.092237,
1, -2.986823, -6.395001,
2, -2.825122, -6.092237,
2, -2.986823, -6.395001
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
-3, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
-3, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
-3, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
-3, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5,
-2, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
-2, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
-2, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
-2, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5,
-1, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
-1, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
-1, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
-1, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5,
0, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
0, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
0, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
0, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5,
1, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
1, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
1, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
1, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5,
2, -3.310225, -7.000528, 0, -0.5, 0.5, 0.5,
2, -3.310225, -7.000528, 1, -0.5, 0.5, 0.5,
2, -3.310225, -7.000528, 1, 1.5, 0.5, 0.5,
2, -3.310225, -7.000528, 0, 1.5, 0.5, 0.5
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
-3.321432, -2, -6.092237,
-3.321432, 3, -6.092237,
-3.321432, -2, -6.092237,
-3.481313, -2, -6.395001,
-3.321432, -1, -6.092237,
-3.481313, -1, -6.395001,
-3.321432, 0, -6.092237,
-3.481313, 0, -6.395001,
-3.321432, 1, -6.092237,
-3.481313, 1, -6.395001,
-3.321432, 2, -6.092237,
-3.481313, 2, -6.395001,
-3.321432, 3, -6.092237,
-3.481313, 3, -6.395001
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
-3.801075, -2, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, -2, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, -2, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, -2, -7.000528, 0, 1.5, 0.5, 0.5,
-3.801075, -1, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, -1, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, -1, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, -1, -7.000528, 0, 1.5, 0.5, 0.5,
-3.801075, 0, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, 0, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, 0, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, 0, -7.000528, 0, 1.5, 0.5, 0.5,
-3.801075, 1, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, 1, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, 1, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, 1, -7.000528, 0, 1.5, 0.5, 0.5,
-3.801075, 2, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, 2, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, 2, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, 2, -7.000528, 0, 1.5, 0.5, 0.5,
-3.801075, 3, -7.000528, 0, -0.5, 0.5, 0.5,
-3.801075, 3, -7.000528, 1, -0.5, 0.5, 0.5,
-3.801075, 3, -7.000528, 1, 1.5, 0.5, 0.5,
-3.801075, 3, -7.000528, 0, 1.5, 0.5, 0.5
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
-3.321432, -2.825122, -4,
-3.321432, -2.825122, 4,
-3.321432, -2.825122, -4,
-3.481313, -2.986823, -4,
-3.321432, -2.825122, -2,
-3.481313, -2.986823, -2,
-3.321432, -2.825122, 0,
-3.481313, -2.986823, 0,
-3.321432, -2.825122, 2,
-3.481313, -2.986823, 2,
-3.321432, -2.825122, 4,
-3.481313, -2.986823, 4
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
-3.801075, -3.310225, -4, 0, -0.5, 0.5, 0.5,
-3.801075, -3.310225, -4, 1, -0.5, 0.5, 0.5,
-3.801075, -3.310225, -4, 1, 1.5, 0.5, 0.5,
-3.801075, -3.310225, -4, 0, 1.5, 0.5, 0.5,
-3.801075, -3.310225, -2, 0, -0.5, 0.5, 0.5,
-3.801075, -3.310225, -2, 1, -0.5, 0.5, 0.5,
-3.801075, -3.310225, -2, 1, 1.5, 0.5, 0.5,
-3.801075, -3.310225, -2, 0, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 0, 0, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 0, 1, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 0, 1, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 0, 0, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 2, 0, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 2, 1, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 2, 1, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 2, 0, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 4, 0, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 4, 1, -0.5, 0.5, 0.5,
-3.801075, -3.310225, 4, 1, 1.5, 0.5, 0.5,
-3.801075, -3.310225, 4, 0, 1.5, 0.5, 0.5
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
-3.321432, -2.825122, -6.092237,
-3.321432, 3.642922, -6.092237,
-3.321432, -2.825122, 6.018299,
-3.321432, 3.642922, 6.018299,
-3.321432, -2.825122, -6.092237,
-3.321432, -2.825122, 6.018299,
-3.321432, 3.642922, -6.092237,
-3.321432, 3.642922, 6.018299,
-3.321432, -2.825122, -6.092237,
3.073811, -2.825122, -6.092237,
-3.321432, -2.825122, 6.018299,
3.073811, -2.825122, 6.018299,
-3.321432, 3.642922, -6.092237,
3.073811, 3.642922, -6.092237,
-3.321432, 3.642922, 6.018299,
3.073811, 3.642922, 6.018299,
3.073811, -2.825122, -6.092237,
3.073811, 3.642922, -6.092237,
3.073811, -2.825122, 6.018299,
3.073811, 3.642922, 6.018299,
3.073811, -2.825122, -6.092237,
3.073811, -2.825122, 6.018299,
3.073811, 3.642922, -6.092237,
3.073811, 3.642922, 6.018299
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
var radius = 8.087643;
var distance = 35.98284;
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
mvMatrix.translate( 0.1238103, -0.4088998, 0.03696942 );
mvMatrix.scale( 1.367347, 1.351957, 0.7220587 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98284);
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
Chlorpyrifos-Methyl<-read.table("Chlorpyrifos-Methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlorpyrifos-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpyrifos' not found
```

```r
y<-Chlorpyrifos-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpyrifos' not found
```

```r
z<-Chlorpyrifos-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpyrifos' not found
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
-3.228297, 0.3173604, -1.592195, 0, 0, 1, 1, 1,
-3.089786, 1.067547, -1.592904, 1, 0, 0, 1, 1,
-2.839047, 0.9828352, -1.432805, 1, 0, 0, 1, 1,
-2.707356, 1.06962, -0.7454985, 1, 0, 0, 1, 1,
-2.669174, 1.461496, -2.313901, 1, 0, 0, 1, 1,
-2.466027, 1.365983, 0.3526385, 1, 0, 0, 1, 1,
-2.459134, -0.8923116, -2.852853, 0, 0, 0, 1, 1,
-2.45696, -0.7014374, -1.74843, 0, 0, 0, 1, 1,
-2.40373, -1.355324, -1.850848, 0, 0, 0, 1, 1,
-2.4029, 1.14138, 0.1509162, 0, 0, 0, 1, 1,
-2.392196, 0.4925625, -2.193583, 0, 0, 0, 1, 1,
-2.373856, 0.02330265, -1.992181, 0, 0, 0, 1, 1,
-2.35856, -0.4720338, -1.064583, 0, 0, 0, 1, 1,
-2.348085, 0.6065356, -1.456524, 1, 1, 1, 1, 1,
-2.316492, 0.3202235, -1.990039, 1, 1, 1, 1, 1,
-2.306219, 1.122865, -0.9089175, 1, 1, 1, 1, 1,
-2.286639, -1.426338, -1.746031, 1, 1, 1, 1, 1,
-2.278496, 0.02478122, -2.692332, 1, 1, 1, 1, 1,
-2.124935, 0.1831972, -0.6400994, 1, 1, 1, 1, 1,
-2.098172, -1.785598, -1.949413, 1, 1, 1, 1, 1,
-2.075299, -1.562703, -1.630272, 1, 1, 1, 1, 1,
-2.069499, 0.04522744, -1.740666, 1, 1, 1, 1, 1,
-2.028163, -0.6306998, -0.4647065, 1, 1, 1, 1, 1,
-1.971023, -0.5189292, -4.124734, 1, 1, 1, 1, 1,
-1.963153, 0.5399747, -1.471844, 1, 1, 1, 1, 1,
-1.916962, 0.5519626, -2.404578, 1, 1, 1, 1, 1,
-1.916446, 0.7044417, -1.155255, 1, 1, 1, 1, 1,
-1.91149, 1.033062, -2.067563, 1, 1, 1, 1, 1,
-1.908303, -0.2545795, -1.029981, 0, 0, 1, 1, 1,
-1.895054, -0.05816988, -1.351309, 1, 0, 0, 1, 1,
-1.874694, -1.430972, -1.476599, 1, 0, 0, 1, 1,
-1.86017, -0.4850493, -1.575303, 1, 0, 0, 1, 1,
-1.852471, -0.108407, -0.975684, 1, 0, 0, 1, 1,
-1.850636, 0.4253922, -1.622543, 1, 0, 0, 1, 1,
-1.833013, 1.313493, -1.599614, 0, 0, 0, 1, 1,
-1.789914, 1.32607, -1.339481, 0, 0, 0, 1, 1,
-1.765117, 1.072069, -0.7241464, 0, 0, 0, 1, 1,
-1.752938, -0.522741, -1.598254, 0, 0, 0, 1, 1,
-1.749939, -0.01652711, -1.43338, 0, 0, 0, 1, 1,
-1.746901, 1.087252, -1.49549, 0, 0, 0, 1, 1,
-1.739199, -0.6090062, -2.124439, 0, 0, 0, 1, 1,
-1.720827, -0.4447396, -2.333451, 1, 1, 1, 1, 1,
-1.690946, -0.1917418, -1.0028, 1, 1, 1, 1, 1,
-1.680909, -1.669672, -1.51483, 1, 1, 1, 1, 1,
-1.671198, 0.9067821, -1.643904, 1, 1, 1, 1, 1,
-1.660144, -0.3804323, -4.184521, 1, 1, 1, 1, 1,
-1.646432, -0.6024988, -1.294828, 1, 1, 1, 1, 1,
-1.644136, 0.2652668, -1.401219, 1, 1, 1, 1, 1,
-1.635731, 0.6885694, -1.486625, 1, 1, 1, 1, 1,
-1.624887, 0.2146268, -0.4777936, 1, 1, 1, 1, 1,
-1.608128, 1.156896, -1.960363, 1, 1, 1, 1, 1,
-1.60176, -0.5721468, -2.748032, 1, 1, 1, 1, 1,
-1.601541, 0.8618991, -1.558739, 1, 1, 1, 1, 1,
-1.596802, -2.099968, -1.150051, 1, 1, 1, 1, 1,
-1.591061, -1.618773, -2.139992, 1, 1, 1, 1, 1,
-1.589718, 0.1552439, -1.077363, 1, 1, 1, 1, 1,
-1.584265, -0.9113817, -1.444109, 0, 0, 1, 1, 1,
-1.583519, 0.4769618, -1.624001, 1, 0, 0, 1, 1,
-1.581497, 0.7567222, -0.4115194, 1, 0, 0, 1, 1,
-1.571465, -1.079221, -1.155295, 1, 0, 0, 1, 1,
-1.559232, 0.728289, -0.5700742, 1, 0, 0, 1, 1,
-1.554869, 1.155015, -1.040534, 1, 0, 0, 1, 1,
-1.554422, 0.9348514, -1.11728, 0, 0, 0, 1, 1,
-1.551925, 0.3885112, -1.448238, 0, 0, 0, 1, 1,
-1.550545, 0.790854, -1.205459, 0, 0, 0, 1, 1,
-1.540002, -1.95736, -2.71022, 0, 0, 0, 1, 1,
-1.52601, -0.7253193, -0.3832432, 0, 0, 0, 1, 1,
-1.517777, 1.018214, -1.911853, 0, 0, 0, 1, 1,
-1.501277, 0.87271, -0.9359694, 0, 0, 0, 1, 1,
-1.498256, -1.105862, -3.836087, 1, 1, 1, 1, 1,
-1.480378, -0.1108435, -0.3777851, 1, 1, 1, 1, 1,
-1.474624, -1.053406, -1.71008, 1, 1, 1, 1, 1,
-1.470451, -0.743251, -1.547095, 1, 1, 1, 1, 1,
-1.457391, -1.850993, -3.49207, 1, 1, 1, 1, 1,
-1.44915, 0.7326376, -1.79367, 1, 1, 1, 1, 1,
-1.439278, 1.011468, -0.6786197, 1, 1, 1, 1, 1,
-1.435351, 1.503526, -1.077337, 1, 1, 1, 1, 1,
-1.434341, -0.5191344, -1.473621, 1, 1, 1, 1, 1,
-1.409396, 0.4958379, 0.6247723, 1, 1, 1, 1, 1,
-1.389822, 1.511296, -0.1487449, 1, 1, 1, 1, 1,
-1.389146, 1.448839, -1.103873, 1, 1, 1, 1, 1,
-1.37563, 0.1917375, -2.968694, 1, 1, 1, 1, 1,
-1.370995, 0.5469955, -1.303247, 1, 1, 1, 1, 1,
-1.359059, -1.072347, -1.114835, 1, 1, 1, 1, 1,
-1.354332, 1.555914, 0.428652, 0, 0, 1, 1, 1,
-1.343912, 1.045529, -0.6465829, 1, 0, 0, 1, 1,
-1.338208, 0.04968735, -1.3065, 1, 0, 0, 1, 1,
-1.328904, -1.672742, -3.101953, 1, 0, 0, 1, 1,
-1.325074, 0.9007757, -0.4091186, 1, 0, 0, 1, 1,
-1.32255, 0.1397029, -1.157997, 1, 0, 0, 1, 1,
-1.313077, -0.8940142, -3.132083, 0, 0, 0, 1, 1,
-1.309882, 0.4290207, -0.7056096, 0, 0, 0, 1, 1,
-1.309426, -0.4754326, -1.116976, 0, 0, 0, 1, 1,
-1.3085, -1.746038, -4.235128, 0, 0, 0, 1, 1,
-1.302569, -0.276652, -1.313061, 0, 0, 0, 1, 1,
-1.287736, -1.386598, -3.333732, 0, 0, 0, 1, 1,
-1.282736, 0.1834068, -1.071593, 0, 0, 0, 1, 1,
-1.282427, -0.963784, 0.8831751, 1, 1, 1, 1, 1,
-1.273406, 1.113989, -0.701063, 1, 1, 1, 1, 1,
-1.260818, -0.4835917, -1.673109, 1, 1, 1, 1, 1,
-1.258357, 1.275162, -0.9583699, 1, 1, 1, 1, 1,
-1.257219, -1.594831, -3.971091, 1, 1, 1, 1, 1,
-1.255938, 0.8217689, -1.38627, 1, 1, 1, 1, 1,
-1.253183, 0.2912517, -2.94779, 1, 1, 1, 1, 1,
-1.2517, -0.5477592, -0.9903237, 1, 1, 1, 1, 1,
-1.247683, -1.378983, -1.274952, 1, 1, 1, 1, 1,
-1.247345, 0.9916462, -0.9777567, 1, 1, 1, 1, 1,
-1.244565, -1.734681, -2.910449, 1, 1, 1, 1, 1,
-1.239627, 1.005584, -1.421344, 1, 1, 1, 1, 1,
-1.229118, -1.341768, -2.246666, 1, 1, 1, 1, 1,
-1.228614, 0.7134462, -2.279029, 1, 1, 1, 1, 1,
-1.219327, -0.225358, -1.272171, 1, 1, 1, 1, 1,
-1.213785, -0.7778485, -1.702387, 0, 0, 1, 1, 1,
-1.213112, 0.8298172, -1.338801, 1, 0, 0, 1, 1,
-1.211638, -1.539626, -2.638148, 1, 0, 0, 1, 1,
-1.207115, 0.4158897, 0.007070887, 1, 0, 0, 1, 1,
-1.203909, 1.629304, -0.2658603, 1, 0, 0, 1, 1,
-1.203709, -0.2903408, -2.557883, 1, 0, 0, 1, 1,
-1.201631, -1.164901, -0.6945368, 0, 0, 0, 1, 1,
-1.196496, 0.8529549, 0.5552985, 0, 0, 0, 1, 1,
-1.189679, 1.334688, -0.9916257, 0, 0, 0, 1, 1,
-1.185686, 0.6329681, -2.269602, 0, 0, 0, 1, 1,
-1.172864, -1.653075, -2.074013, 0, 0, 0, 1, 1,
-1.171115, -1.664578, -2.173233, 0, 0, 0, 1, 1,
-1.165473, -1.590271, -1.878768, 0, 0, 0, 1, 1,
-1.163472, -0.7160366, -4.38318, 1, 1, 1, 1, 1,
-1.16221, 0.5432225, -2.22852, 1, 1, 1, 1, 1,
-1.157761, -2.142297, -2.834048, 1, 1, 1, 1, 1,
-1.153534, 1.083306, -1.407615, 1, 1, 1, 1, 1,
-1.150509, 0.8773572, -0.7812877, 1, 1, 1, 1, 1,
-1.147216, -0.5689232, -2.38106, 1, 1, 1, 1, 1,
-1.139689, 0.3625951, -2.250864, 1, 1, 1, 1, 1,
-1.136203, -0.4473682, -2.382856, 1, 1, 1, 1, 1,
-1.134279, -0.7090791, -2.018437, 1, 1, 1, 1, 1,
-1.109088, 0.1170966, -1.896031, 1, 1, 1, 1, 1,
-1.10431, 1.107894, -0.5372801, 1, 1, 1, 1, 1,
-1.095985, 0.2739944, -2.086889, 1, 1, 1, 1, 1,
-1.086365, -1.509042, -3.253412, 1, 1, 1, 1, 1,
-1.076852, -0.7305598, -3.343551, 1, 1, 1, 1, 1,
-1.07103, 0.8551015, -1.439308, 1, 1, 1, 1, 1,
-1.069661, -0.423845, -1.816962, 0, 0, 1, 1, 1,
-1.063877, 0.5532259, 0.1652437, 1, 0, 0, 1, 1,
-1.063729, 0.3917433, -1.610425, 1, 0, 0, 1, 1,
-1.049092, 0.3648982, 0.8074499, 1, 0, 0, 1, 1,
-1.047488, 0.2119673, -0.9917345, 1, 0, 0, 1, 1,
-1.044379, 1.251107, 0.3094216, 1, 0, 0, 1, 1,
-1.039315, -1.105891, -1.06217, 0, 0, 0, 1, 1,
-1.035327, -0.8105674, -2.88321, 0, 0, 0, 1, 1,
-1.025965, 0.8107589, 0.1914984, 0, 0, 0, 1, 1,
-1.023167, -0.2746086, -0.9107331, 0, 0, 0, 1, 1,
-1.022512, 1.136615, -0.4206401, 0, 0, 0, 1, 1,
-1.013628, 0.6087475, -0.5901332, 0, 0, 0, 1, 1,
-1.004415, 1.254503, -1.550558, 0, 0, 0, 1, 1,
-1.004365, -0.1844735, -2.29247, 1, 1, 1, 1, 1,
-0.9991804, -0.02495806, -2.463744, 1, 1, 1, 1, 1,
-0.994247, 0.4738076, -0.350812, 1, 1, 1, 1, 1,
-0.992669, -1.205164, -0.542717, 1, 1, 1, 1, 1,
-0.9903086, 1.673306, 0.6184688, 1, 1, 1, 1, 1,
-0.9881147, 0.6083077, 0.2645299, 1, 1, 1, 1, 1,
-0.9834775, -0.8928301, -0.9544701, 1, 1, 1, 1, 1,
-0.9834192, 0.5673451, -1.645584, 1, 1, 1, 1, 1,
-0.9823656, 1.283785, 0.9784797, 1, 1, 1, 1, 1,
-0.9816669, 1.171712, -1.49807, 1, 1, 1, 1, 1,
-0.9810615, -2.134253, -1.908888, 1, 1, 1, 1, 1,
-0.9735594, 1.338161, -0.1026791, 1, 1, 1, 1, 1,
-0.9725227, -0.05611733, -0.539754, 1, 1, 1, 1, 1,
-0.9697276, 0.9801064, -1.483233, 1, 1, 1, 1, 1,
-0.9647195, 1.127464, -0.3684292, 1, 1, 1, 1, 1,
-0.9638474, 0.6489187, 0.2979535, 0, 0, 1, 1, 1,
-0.9620677, 1.014599, -1.340871, 1, 0, 0, 1, 1,
-0.9612318, -0.5760448, -1.206009, 1, 0, 0, 1, 1,
-0.9456103, -0.8253711, -0.3753445, 1, 0, 0, 1, 1,
-0.9418033, 0.1859508, -0.9966644, 1, 0, 0, 1, 1,
-0.9404339, -0.1362525, -0.7151015, 1, 0, 0, 1, 1,
-0.9367325, 1.031411, 0.7183359, 0, 0, 0, 1, 1,
-0.9322703, -1.985965, -3.101574, 0, 0, 0, 1, 1,
-0.9309832, 0.2228448, -0.1469703, 0, 0, 0, 1, 1,
-0.9302201, -0.2310036, 0.8565834, 0, 0, 0, 1, 1,
-0.9234494, -0.1089324, -2.665194, 0, 0, 0, 1, 1,
-0.9202885, -0.3938953, -2.370354, 0, 0, 0, 1, 1,
-0.9123239, 0.1934654, 0.037384, 0, 0, 0, 1, 1,
-0.9114065, -0.2140214, -1.993757, 1, 1, 1, 1, 1,
-0.9046968, 0.5264732, -0.6317509, 1, 1, 1, 1, 1,
-0.8901241, 1.681564, 0.06201812, 1, 1, 1, 1, 1,
-0.8881176, -0.07535498, -1.477252, 1, 1, 1, 1, 1,
-0.8878368, 1.149016, -0.3699403, 1, 1, 1, 1, 1,
-0.8876556, 1.472032, -1.028513, 1, 1, 1, 1, 1,
-0.884989, -0.1640285, -0.5371737, 1, 1, 1, 1, 1,
-0.8814062, 1.372482, -1.300161, 1, 1, 1, 1, 1,
-0.8809826, -0.09529503, -1.145594, 1, 1, 1, 1, 1,
-0.8761199, -0.3035261, -0.9274828, 1, 1, 1, 1, 1,
-0.8691472, 0.5610955, 0.1616597, 1, 1, 1, 1, 1,
-0.8669127, 0.07490151, -1.239786, 1, 1, 1, 1, 1,
-0.8591757, -0.5604834, -2.201659, 1, 1, 1, 1, 1,
-0.8561482, 0.09833396, -2.319594, 1, 1, 1, 1, 1,
-0.855846, 1.310167, -0.1316026, 1, 1, 1, 1, 1,
-0.846834, 1.567107, -0.729537, 0, 0, 1, 1, 1,
-0.8429085, -0.3914441, -1.642397, 1, 0, 0, 1, 1,
-0.8404533, -0.8070055, -0.7081499, 1, 0, 0, 1, 1,
-0.8350223, 0.1074882, -1.630435, 1, 0, 0, 1, 1,
-0.8338141, 1.399174, -0.3849185, 1, 0, 0, 1, 1,
-0.8301217, 0.1066883, -3.576169, 1, 0, 0, 1, 1,
-0.8222447, 1.600204, -1.793224, 0, 0, 0, 1, 1,
-0.8181792, -0.4746819, -3.218352, 0, 0, 0, 1, 1,
-0.8171731, 0.8167067, 0.2993487, 0, 0, 0, 1, 1,
-0.8169515, 0.8075103, -1.825745, 0, 0, 0, 1, 1,
-0.812152, -0.5933668, -3.039348, 0, 0, 0, 1, 1,
-0.8106968, -1.189216, -2.182659, 0, 0, 0, 1, 1,
-0.7983354, 0.845818, -0.2814066, 0, 0, 0, 1, 1,
-0.7901428, -0.6145554, -2.785945, 1, 1, 1, 1, 1,
-0.7833635, 0.3865959, -0.9790833, 1, 1, 1, 1, 1,
-0.7827885, -0.09553721, -2.814925, 1, 1, 1, 1, 1,
-0.7787827, -0.2190623, -2.433962, 1, 1, 1, 1, 1,
-0.775364, 0.5689295, -2.888648, 1, 1, 1, 1, 1,
-0.7733883, -2.479609, -3.117296, 1, 1, 1, 1, 1,
-0.7654221, -1.158693, -1.722296, 1, 1, 1, 1, 1,
-0.7632849, 0.07385825, -1.671653, 1, 1, 1, 1, 1,
-0.7596388, 1.133178, -2.202297, 1, 1, 1, 1, 1,
-0.759154, -0.1286514, -1.409871, 1, 1, 1, 1, 1,
-0.7564508, 0.7488199, -0.6468798, 1, 1, 1, 1, 1,
-0.7538629, 0.1518182, -0.7759807, 1, 1, 1, 1, 1,
-0.7525228, -1.922991, -2.927571, 1, 1, 1, 1, 1,
-0.7509919, 0.8169961, -1.253739, 1, 1, 1, 1, 1,
-0.739818, -2.563264, -1.787403, 1, 1, 1, 1, 1,
-0.7337005, 0.3137457, -1.952199, 0, 0, 1, 1, 1,
-0.7292621, -0.6892714, -0.4253838, 1, 0, 0, 1, 1,
-0.7288834, 0.1362379, -0.7381889, 1, 0, 0, 1, 1,
-0.7234932, 0.755116, -2.273097, 1, 0, 0, 1, 1,
-0.7228032, -1.168446, -2.976378, 1, 0, 0, 1, 1,
-0.7227158, -1.373065, -2.946961, 1, 0, 0, 1, 1,
-0.7117411, 0.9084968, -0.3173865, 0, 0, 0, 1, 1,
-0.7063866, -0.061783, -0.8435073, 0, 0, 0, 1, 1,
-0.6967505, -0.1517561, -1.594064, 0, 0, 0, 1, 1,
-0.6938382, -0.3817307, -0.6428764, 0, 0, 0, 1, 1,
-0.6927022, -0.4999637, -2.023767, 0, 0, 0, 1, 1,
-0.6925483, 0.367199, -1.464847, 0, 0, 0, 1, 1,
-0.6907855, -0.9862534, -2.589074, 0, 0, 0, 1, 1,
-0.6901909, -1.062424, -1.53529, 1, 1, 1, 1, 1,
-0.6884744, 0.2545722, 0.00900742, 1, 1, 1, 1, 1,
-0.6884585, 0.401055, -0.5332937, 1, 1, 1, 1, 1,
-0.6863799, 2.287677, -0.5894409, 1, 1, 1, 1, 1,
-0.6811836, 1.192556, 0.3437983, 1, 1, 1, 1, 1,
-0.6800846, -1.070705, -3.128939, 1, 1, 1, 1, 1,
-0.6766306, 0.3681234, -2.174436, 1, 1, 1, 1, 1,
-0.6750361, 0.6887333, -0.9619345, 1, 1, 1, 1, 1,
-0.6737723, 1.390282, -1.293238, 1, 1, 1, 1, 1,
-0.6735645, 1.917404, 0.5643728, 1, 1, 1, 1, 1,
-0.6710678, -0.7558491, -1.118229, 1, 1, 1, 1, 1,
-0.6654793, -0.8244514, -2.014135, 1, 1, 1, 1, 1,
-0.663261, 0.3224513, -0.1454871, 1, 1, 1, 1, 1,
-0.6595066, 1.010729, -2.12677, 1, 1, 1, 1, 1,
-0.6508329, -0.6562489, -2.281379, 1, 1, 1, 1, 1,
-0.6482875, 2.065785, 1.426183, 0, 0, 1, 1, 1,
-0.645741, 0.1495154, -1.559165, 1, 0, 0, 1, 1,
-0.6447678, -0.08281374, 0.179078, 1, 0, 0, 1, 1,
-0.643159, 0.522631, -1.656532, 1, 0, 0, 1, 1,
-0.6387967, -0.6567329, -3.888286, 1, 0, 0, 1, 1,
-0.6386437, -0.0968769, -2.587426, 1, 0, 0, 1, 1,
-0.6384093, 0.6806409, 0.4912966, 0, 0, 0, 1, 1,
-0.6379445, 0.1184089, -2.159825, 0, 0, 0, 1, 1,
-0.6372399, 1.426288, 0.5546278, 0, 0, 0, 1, 1,
-0.6262921, 0.003624785, -2.027331, 0, 0, 0, 1, 1,
-0.616069, -1.370348, -2.432539, 0, 0, 0, 1, 1,
-0.6160396, -0.7092412, -1.472002, 0, 0, 0, 1, 1,
-0.6137488, -0.1972661, -1.451226, 0, 0, 0, 1, 1,
-0.6124312, 0.7895938, 0.02068798, 1, 1, 1, 1, 1,
-0.6051059, 0.3469146, -0.0798869, 1, 1, 1, 1, 1,
-0.6050883, -0.4384113, -3.82889, 1, 1, 1, 1, 1,
-0.6037849, 1.582113, 0.1823458, 1, 1, 1, 1, 1,
-0.5998302, -0.8182451, -4.270764, 1, 1, 1, 1, 1,
-0.5973569, 0.5055642, 0.006719691, 1, 1, 1, 1, 1,
-0.5920184, 0.1347242, -2.935947, 1, 1, 1, 1, 1,
-0.5890858, 0.6166835, -0.3324792, 1, 1, 1, 1, 1,
-0.5802711, -0.6013271, -2.182414, 1, 1, 1, 1, 1,
-0.5782132, -0.5198306, -2.563829, 1, 1, 1, 1, 1,
-0.5771698, 0.777694, -0.5271412, 1, 1, 1, 1, 1,
-0.5760466, -0.0380027, -0.9259925, 1, 1, 1, 1, 1,
-0.5692136, 0.8171254, -1.916886, 1, 1, 1, 1, 1,
-0.5649468, 0.8581867, 0.9407593, 1, 1, 1, 1, 1,
-0.5629868, -1.019108, -2.226758, 1, 1, 1, 1, 1,
-0.5594441, 1.12913, 0.7854093, 0, 0, 1, 1, 1,
-0.5582702, 2.018705, -1.026656, 1, 0, 0, 1, 1,
-0.5551608, -0.4757366, -3.262021, 1, 0, 0, 1, 1,
-0.5548909, -1.983772, -2.46423, 1, 0, 0, 1, 1,
-0.5538425, -1.515022, -1.006381, 1, 0, 0, 1, 1,
-0.553841, 0.1566256, -0.8967512, 1, 0, 0, 1, 1,
-0.5461715, 0.2731372, -0.6573976, 0, 0, 0, 1, 1,
-0.5460227, 0.09880073, -1.755294, 0, 0, 0, 1, 1,
-0.5438291, -0.5210264, -2.53458, 0, 0, 0, 1, 1,
-0.5382091, 0.2824854, -3.665324, 0, 0, 0, 1, 1,
-0.5376115, -1.028017, -2.117099, 0, 0, 0, 1, 1,
-0.5375433, 0.2138688, -2.114137, 0, 0, 0, 1, 1,
-0.5351892, -0.5550038, -2.598394, 0, 0, 0, 1, 1,
-0.532387, -0.7067417, -2.673548, 1, 1, 1, 1, 1,
-0.5304403, 0.9527562, -1.778097, 1, 1, 1, 1, 1,
-0.5281403, 0.3251883, -2.608161, 1, 1, 1, 1, 1,
-0.5248023, 0.4084438, -1.473325, 1, 1, 1, 1, 1,
-0.523779, -0.899412, -4.169927, 1, 1, 1, 1, 1,
-0.5224158, 0.8934207, 0.5567227, 1, 1, 1, 1, 1,
-0.517483, 0.9175579, -0.117804, 1, 1, 1, 1, 1,
-0.5150297, 0.12727, -2.534034, 1, 1, 1, 1, 1,
-0.5093332, -1.097154, -3.142648, 1, 1, 1, 1, 1,
-0.505748, 0.6219768, 0.3555786, 1, 1, 1, 1, 1,
-0.5026824, -0.6666346, -2.778681, 1, 1, 1, 1, 1,
-0.5025067, 0.02594375, -2.886358, 1, 1, 1, 1, 1,
-0.5021234, -0.03638669, -2.389233, 1, 1, 1, 1, 1,
-0.5001085, 0.5371687, 0.6424686, 1, 1, 1, 1, 1,
-0.4991344, -0.5375036, -2.863415, 1, 1, 1, 1, 1,
-0.4941798, 0.2244601, 0.03955018, 0, 0, 1, 1, 1,
-0.4924174, -0.3597776, -0.2847271, 1, 0, 0, 1, 1,
-0.4903117, -1.395705, -3.699577, 1, 0, 0, 1, 1,
-0.489365, -1.538925, -2.358805, 1, 0, 0, 1, 1,
-0.4879231, -0.9798273, -2.518026, 1, 0, 0, 1, 1,
-0.4856119, -1.602844, -1.881446, 1, 0, 0, 1, 1,
-0.4854719, 0.5755039, 0.8806027, 0, 0, 0, 1, 1,
-0.4837278, -0.4431493, -2.535212, 0, 0, 0, 1, 1,
-0.4773109, 2.416821, 0.006289537, 0, 0, 0, 1, 1,
-0.4739399, 0.6739463, 1.51387, 0, 0, 0, 1, 1,
-0.472453, -0.06452935, -1.674196, 0, 0, 0, 1, 1,
-0.4703196, -0.6165539, -2.46212, 0, 0, 0, 1, 1,
-0.4699569, -0.5678263, -2.846842, 0, 0, 0, 1, 1,
-0.4591077, -0.2726798, -1.919818, 1, 1, 1, 1, 1,
-0.4565163, -0.5999374, -3.665004, 1, 1, 1, 1, 1,
-0.4548427, -1.233296, -2.265931, 1, 1, 1, 1, 1,
-0.4496439, 1.171061, 0.3656858, 1, 1, 1, 1, 1,
-0.4496094, -0.3694989, -2.473633, 1, 1, 1, 1, 1,
-0.4412886, -0.1257908, -0.303256, 1, 1, 1, 1, 1,
-0.4346399, 0.6719963, 0.875691, 1, 1, 1, 1, 1,
-0.4337011, 1.689772, -0.5347468, 1, 1, 1, 1, 1,
-0.4332165, 0.4571324, -1.515799, 1, 1, 1, 1, 1,
-0.4326955, 0.5250702, -2.034369, 1, 1, 1, 1, 1,
-0.4286533, -0.1312124, -3.443663, 1, 1, 1, 1, 1,
-0.4272952, 0.6259089, 1.361893, 1, 1, 1, 1, 1,
-0.4270176, 0.4612899, -1.187574, 1, 1, 1, 1, 1,
-0.4261117, 1.184646, -1.081766, 1, 1, 1, 1, 1,
-0.4241923, 0.695176, -0.2552116, 1, 1, 1, 1, 1,
-0.4237441, 0.1611555, -1.82399, 0, 0, 1, 1, 1,
-0.4194193, -0.1196345, -2.154982, 1, 0, 0, 1, 1,
-0.4105148, -1.054817, -2.60234, 1, 0, 0, 1, 1,
-0.4092795, -1.735029, -5.015149, 1, 0, 0, 1, 1,
-0.403219, 0.4717474, 1.288663, 1, 0, 0, 1, 1,
-0.4029802, -0.5035772, -3.148534, 1, 0, 0, 1, 1,
-0.3998705, -2.010478, -3.161491, 0, 0, 0, 1, 1,
-0.3958848, 2.047995, -0.7740645, 0, 0, 0, 1, 1,
-0.3920902, -0.02743744, -1.403683, 0, 0, 0, 1, 1,
-0.3850051, 2.735994, -0.8345295, 0, 0, 0, 1, 1,
-0.3814551, -0.2889955, -1.06047, 0, 0, 0, 1, 1,
-0.3796662, 0.2150304, -2.367213, 0, 0, 0, 1, 1,
-0.3755039, -1.337277, -1.838754, 0, 0, 0, 1, 1,
-0.3752922, 0.7609659, -1.942208, 1, 1, 1, 1, 1,
-0.3723976, 0.9426731, -1.077325, 1, 1, 1, 1, 1,
-0.371369, -1.344015, -4.501882, 1, 1, 1, 1, 1,
-0.3695503, 0.1763519, -1.205863, 1, 1, 1, 1, 1,
-0.3677029, -0.7731332, -2.752335, 1, 1, 1, 1, 1,
-0.3597026, -0.8081537, -4.861677, 1, 1, 1, 1, 1,
-0.3543479, 0.3873625, 0.3868304, 1, 1, 1, 1, 1,
-0.3537429, -0.3591086, -2.285907, 1, 1, 1, 1, 1,
-0.3443766, 0.008859115, -2.950887, 1, 1, 1, 1, 1,
-0.3429901, -1.092475, -3.687327, 1, 1, 1, 1, 1,
-0.3403043, 0.4726402, -0.9787865, 1, 1, 1, 1, 1,
-0.3369794, 0.9390497, 0.03965241, 1, 1, 1, 1, 1,
-0.3365024, 0.6233311, -0.4543415, 1, 1, 1, 1, 1,
-0.33635, -0.6271732, -3.34982, 1, 1, 1, 1, 1,
-0.3360664, -1.239786, -3.761783, 1, 1, 1, 1, 1,
-0.3359416, -0.9150738, -2.440106, 0, 0, 1, 1, 1,
-0.3341211, 1.323021, -1.455337, 1, 0, 0, 1, 1,
-0.3305956, -0.1203087, -2.286167, 1, 0, 0, 1, 1,
-0.3291795, 2.062115, -1.241611, 1, 0, 0, 1, 1,
-0.3274356, 0.5935458, -1.307363, 1, 0, 0, 1, 1,
-0.3245653, -0.7479186, -3.205573, 1, 0, 0, 1, 1,
-0.3236233, -1.718913, -4.826681, 0, 0, 0, 1, 1,
-0.3196635, -0.4529121, -5.320385, 0, 0, 0, 1, 1,
-0.3154218, -0.3966325, -2.956041, 0, 0, 0, 1, 1,
-0.3121985, -0.2777143, -2.041319, 0, 0, 0, 1, 1,
-0.3092154, 0.1970893, 0.4133101, 0, 0, 0, 1, 1,
-0.3000601, 0.6535311, -0.4444367, 0, 0, 0, 1, 1,
-0.2983876, -0.4922705, -3.103394, 0, 0, 0, 1, 1,
-0.2978806, -0.2118339, -1.852643, 1, 1, 1, 1, 1,
-0.2938954, 0.3822511, -0.3023585, 1, 1, 1, 1, 1,
-0.2911441, -1.361936, -2.844613, 1, 1, 1, 1, 1,
-0.2822814, -0.008149763, -1.369255, 1, 1, 1, 1, 1,
-0.2794005, 0.445707, -0.5198725, 1, 1, 1, 1, 1,
-0.2792558, 0.4293154, 0.1690242, 1, 1, 1, 1, 1,
-0.2769331, 0.9549103, -0.6790195, 1, 1, 1, 1, 1,
-0.2762285, 1.466996, -0.1060499, 1, 1, 1, 1, 1,
-0.276091, -1.094108, -2.583703, 1, 1, 1, 1, 1,
-0.2743181, -0.9955274, -5.915871, 1, 1, 1, 1, 1,
-0.2714253, 0.7817879, -1.000212, 1, 1, 1, 1, 1,
-0.2714108, -0.5000248, -0.6899689, 1, 1, 1, 1, 1,
-0.2691067, -0.8326384, -1.835737, 1, 1, 1, 1, 1,
-0.2601109, 0.8334904, -1.056304, 1, 1, 1, 1, 1,
-0.2596668, 1.006875, 0.169869, 1, 1, 1, 1, 1,
-0.2569794, 0.7425012, 0.3812441, 0, 0, 1, 1, 1,
-0.2552647, 0.8658471, 0.4505292, 1, 0, 0, 1, 1,
-0.249052, -0.1141313, -0.9495963, 1, 0, 0, 1, 1,
-0.2479977, -1.699319, -1.564275, 1, 0, 0, 1, 1,
-0.2452294, 2.050686, 0.7937787, 1, 0, 0, 1, 1,
-0.2448767, -0.0691103, -1.414708, 1, 0, 0, 1, 1,
-0.2448588, 2.50235, -1.548836, 0, 0, 0, 1, 1,
-0.2436537, 0.813414, -0.1818178, 0, 0, 0, 1, 1,
-0.2432722, -0.428797, -3.848831, 0, 0, 0, 1, 1,
-0.2381112, -0.4030855, -3.363748, 0, 0, 0, 1, 1,
-0.2373204, 1.158862, -0.4565127, 0, 0, 0, 1, 1,
-0.2316334, -2.15766, -3.880065, 0, 0, 0, 1, 1,
-0.2294706, 1.212247, -1.15217, 0, 0, 0, 1, 1,
-0.2235004, 2.089965, -1.342421, 1, 1, 1, 1, 1,
-0.2222524, -1.201091, -3.110385, 1, 1, 1, 1, 1,
-0.2208869, -0.1582453, -1.593443, 1, 1, 1, 1, 1,
-0.2207685, -0.2558107, -2.451318, 1, 1, 1, 1, 1,
-0.2162857, 0.4013844, -1.9292, 1, 1, 1, 1, 1,
-0.2160441, 1.019385, -0.6717993, 1, 1, 1, 1, 1,
-0.2145276, -0.4743404, -1.728519, 1, 1, 1, 1, 1,
-0.2126013, 0.06525712, -1.001111, 1, 1, 1, 1, 1,
-0.2094801, 2.538314, -1.332921, 1, 1, 1, 1, 1,
-0.2063492, 1.169557, 0.3060235, 1, 1, 1, 1, 1,
-0.2002544, 2.060618, 0.3020757, 1, 1, 1, 1, 1,
-0.1942678, -0.1748521, -2.880242, 1, 1, 1, 1, 1,
-0.1939545, -2.122257, -0.3761983, 1, 1, 1, 1, 1,
-0.1848276, 1.710076, 0.4490668, 1, 1, 1, 1, 1,
-0.1845026, -0.1935237, -2.327159, 1, 1, 1, 1, 1,
-0.1837818, -0.6162112, -3.46607, 0, 0, 1, 1, 1,
-0.1836897, -0.2833298, -3.238879, 1, 0, 0, 1, 1,
-0.175704, -0.1558293, -2.657649, 1, 0, 0, 1, 1,
-0.1742766, -0.2951961, -3.164722, 1, 0, 0, 1, 1,
-0.1710886, 0.2765556, -0.04363384, 1, 0, 0, 1, 1,
-0.1687879, -1.056285, -2.377444, 1, 0, 0, 1, 1,
-0.1633725, 0.5861031, 0.1235759, 0, 0, 0, 1, 1,
-0.1631874, -0.1540036, -1.615766, 0, 0, 0, 1, 1,
-0.1624214, -0.7108947, -3.224178, 0, 0, 0, 1, 1,
-0.1522526, -0.04356488, -2.108019, 0, 0, 0, 1, 1,
-0.1474876, -0.2941845, -2.791475, 0, 0, 0, 1, 1,
-0.1371623, 1.340103, 0.5732082, 0, 0, 0, 1, 1,
-0.1307568, 0.2741012, 1.364169, 0, 0, 0, 1, 1,
-0.1259905, 0.6502034, -0.4930745, 1, 1, 1, 1, 1,
-0.119216, 0.8920735, -1.429937, 1, 1, 1, 1, 1,
-0.1185416, -0.09075341, -3.02825, 1, 1, 1, 1, 1,
-0.1175853, 0.2107853, -1.460831, 1, 1, 1, 1, 1,
-0.1167778, -1.203811, -2.52726, 1, 1, 1, 1, 1,
-0.1165441, -0.5544747, -3.775883, 1, 1, 1, 1, 1,
-0.1154368, 0.4622415, -0.4193248, 1, 1, 1, 1, 1,
-0.1145822, -0.9798656, -3.942439, 1, 1, 1, 1, 1,
-0.1120858, 1.3299, -0.6260319, 1, 1, 1, 1, 1,
-0.1100144, -1.910218, -2.710904, 1, 1, 1, 1, 1,
-0.1096414, -0.7521428, -2.689502, 1, 1, 1, 1, 1,
-0.108955, 0.002236857, -1.011745, 1, 1, 1, 1, 1,
-0.1069047, -0.6554235, -3.521725, 1, 1, 1, 1, 1,
-0.1060642, 0.1660366, -1.054569, 1, 1, 1, 1, 1,
-0.1045453, -0.1967673, -2.581596, 1, 1, 1, 1, 1,
-0.1004295, -0.318351, -3.736109, 0, 0, 1, 1, 1,
-0.1004034, -0.4644059, -2.908203, 1, 0, 0, 1, 1,
-0.1001746, -0.7023239, -5.065846, 1, 0, 0, 1, 1,
-0.100104, 0.4247749, 0.7697304, 1, 0, 0, 1, 1,
-0.09730522, 0.2188823, 0.4625389, 1, 0, 0, 1, 1,
-0.09212585, 0.03713395, 0.4088735, 1, 0, 0, 1, 1,
-0.0855166, 0.1206782, -1.669163, 0, 0, 0, 1, 1,
-0.08539134, -2.299772, -2.291825, 0, 0, 0, 1, 1,
-0.08256421, -0.806539, -2.297729, 0, 0, 0, 1, 1,
-0.07979926, -0.001633106, -1.676333, 0, 0, 0, 1, 1,
-0.07761915, 0.407683, -0.0367745, 0, 0, 0, 1, 1,
-0.0755792, -0.1445966, -2.128303, 0, 0, 0, 1, 1,
-0.07531281, -0.4455319, -1.81761, 0, 0, 0, 1, 1,
-0.07404016, 0.2839233, -0.09747741, 1, 1, 1, 1, 1,
-0.05952697, 1.138461, -0.5947136, 1, 1, 1, 1, 1,
-0.05727138, -1.077227, -2.5463, 1, 1, 1, 1, 1,
-0.05472974, 1.166328, -1.844571, 1, 1, 1, 1, 1,
-0.04946296, 0.01374617, -2.302762, 1, 1, 1, 1, 1,
-0.04290692, 0.008541794, -3.18227, 1, 1, 1, 1, 1,
-0.04269534, 1.350216, 0.07561796, 1, 1, 1, 1, 1,
-0.04264739, -0.2292904, -3.973909, 1, 1, 1, 1, 1,
-0.04144486, -1.028459, -3.251284, 1, 1, 1, 1, 1,
-0.03828155, -0.3325963, -1.3397, 1, 1, 1, 1, 1,
-0.03733744, 0.6508317, -0.0001750946, 1, 1, 1, 1, 1,
-0.03679174, -0.5063375, -2.654457, 1, 1, 1, 1, 1,
-0.03178114, -1.72218, -5.535434, 1, 1, 1, 1, 1,
-0.03093116, -1.18194, -3.185661, 1, 1, 1, 1, 1,
-0.02983015, -0.4201461, -3.641614, 1, 1, 1, 1, 1,
-0.02248655, -0.3182658, -1.358233, 0, 0, 1, 1, 1,
-0.0206059, 0.4949413, 1.726573, 1, 0, 0, 1, 1,
-0.01621457, 0.3475724, -0.7228029, 1, 0, 0, 1, 1,
-0.01309046, -0.1187778, -1.747522, 1, 0, 0, 1, 1,
-0.01247893, 0.608418, -1.572483, 1, 0, 0, 1, 1,
-0.01217712, -0.5902599, -3.19795, 1, 0, 0, 1, 1,
-0.00759778, -0.02965854, -2.571813, 0, 0, 0, 1, 1,
-0.002693501, -0.2201766, -3.69472, 0, 0, 0, 1, 1,
0.0008547703, 0.1696469, 0.4835141, 0, 0, 0, 1, 1,
0.001937847, 0.5426199, 1.040409, 0, 0, 0, 1, 1,
0.002095147, 1.758177, 0.08085196, 0, 0, 0, 1, 1,
0.00837723, 0.7504361, 1.010368, 0, 0, 0, 1, 1,
0.0144434, -0.1723567, 2.776983, 0, 0, 0, 1, 1,
0.0152897, 0.8450935, 1.017411, 1, 1, 1, 1, 1,
0.02005176, -0.295807, 4.106555, 1, 1, 1, 1, 1,
0.02032729, -0.2273733, 2.564819, 1, 1, 1, 1, 1,
0.02096698, -0.5896541, 1.558, 1, 1, 1, 1, 1,
0.02176091, 0.5043351, 2.602458, 1, 1, 1, 1, 1,
0.02398782, -0.07910583, 3.803149, 1, 1, 1, 1, 1,
0.02508469, 2.233602, 1.806807, 1, 1, 1, 1, 1,
0.02615629, 1.251463, 1.430782, 1, 1, 1, 1, 1,
0.03166273, 0.3830028, 1.280132, 1, 1, 1, 1, 1,
0.03269364, -1.971344, 2.778343, 1, 1, 1, 1, 1,
0.03800375, 0.9256858, -0.20066, 1, 1, 1, 1, 1,
0.03937886, 0.7682319, -0.6681674, 1, 1, 1, 1, 1,
0.04039993, 0.1145124, 0.7568646, 1, 1, 1, 1, 1,
0.0432378, -0.2148895, 3.18755, 1, 1, 1, 1, 1,
0.04492521, -0.8208559, 4.229845, 1, 1, 1, 1, 1,
0.04756944, 0.2443447, -0.5884567, 0, 0, 1, 1, 1,
0.04915323, -1.950863, 3.535433, 1, 0, 0, 1, 1,
0.05021056, -1.23668, 3.91425, 1, 0, 0, 1, 1,
0.05867846, -0.06907909, 3.875896, 1, 0, 0, 1, 1,
0.05975178, -1.514982, 3.850939, 1, 0, 0, 1, 1,
0.06070434, -1.696475, 3.336467, 1, 0, 0, 1, 1,
0.06673571, 0.5144028, 1.612943, 0, 0, 0, 1, 1,
0.06719453, 0.9482287, -1.376338, 0, 0, 0, 1, 1,
0.07143286, 0.04532617, 0.1951431, 0, 0, 0, 1, 1,
0.07244532, -0.03155585, 2.210085, 0, 0, 0, 1, 1,
0.0768803, 1.094271, 1.580575, 0, 0, 0, 1, 1,
0.0776637, 0.8774824, -1.580978, 0, 0, 0, 1, 1,
0.07957794, -0.2840225, 1.501137, 0, 0, 0, 1, 1,
0.08148646, 0.944991, 0.7690655, 1, 1, 1, 1, 1,
0.08446591, -1.104313, 3.9352, 1, 1, 1, 1, 1,
0.08530386, 0.4973893, -0.4549895, 1, 1, 1, 1, 1,
0.08763725, 0.6181935, -1.829478, 1, 1, 1, 1, 1,
0.09010121, -0.1226811, 2.175233, 1, 1, 1, 1, 1,
0.09170581, 0.3585997, -0.06670556, 1, 1, 1, 1, 1,
0.1012138, -1.121899, 4.684578, 1, 1, 1, 1, 1,
0.1038764, 1.354857, -0.1820521, 1, 1, 1, 1, 1,
0.1116588, -0.4435997, 3.635158, 1, 1, 1, 1, 1,
0.1133317, -0.430929, 3.856055, 1, 1, 1, 1, 1,
0.1140056, 0.9775077, -0.9892288, 1, 1, 1, 1, 1,
0.1257176, -0.1196353, 0.488802, 1, 1, 1, 1, 1,
0.1274805, 1.036244, 0.8826426, 1, 1, 1, 1, 1,
0.1288368, -0.9524682, 2.762479, 1, 1, 1, 1, 1,
0.13033, -0.4809822, 5.841932, 1, 1, 1, 1, 1,
0.1329382, 0.07862711, 2.052211, 0, 0, 1, 1, 1,
0.1339839, 0.4782912, -0.7059848, 1, 0, 0, 1, 1,
0.1352517, -0.1340266, 3.367464, 1, 0, 0, 1, 1,
0.1361332, -0.1261266, 2.076118, 1, 0, 0, 1, 1,
0.136461, 1.308399, -0.439983, 1, 0, 0, 1, 1,
0.1371484, 1.063599, -0.5988176, 1, 0, 0, 1, 1,
0.1395717, -0.8743618, 3.963823, 0, 0, 0, 1, 1,
0.1397618, 1.270098, 1.679785, 0, 0, 0, 1, 1,
0.1400849, -0.1940614, 2.060571, 0, 0, 0, 1, 1,
0.1408076, 0.2756496, -0.8333339, 0, 0, 0, 1, 1,
0.1430466, 0.9822246, -0.5756529, 0, 0, 0, 1, 1,
0.1450206, -1.788134, 1.847157, 0, 0, 0, 1, 1,
0.1469982, 0.8829121, -0.08177011, 0, 0, 0, 1, 1,
0.1488627, 0.2368085, -0.5776332, 1, 1, 1, 1, 1,
0.1495461, 0.4636023, 0.03000484, 1, 1, 1, 1, 1,
0.1525912, -1.84196, 3.441265, 1, 1, 1, 1, 1,
0.1546821, -0.7409962, 2.824143, 1, 1, 1, 1, 1,
0.1552611, 1.538718, 0.8114127, 1, 1, 1, 1, 1,
0.1651978, 0.1480886, 2.065374, 1, 1, 1, 1, 1,
0.1654899, 0.6186236, 0.6407281, 1, 1, 1, 1, 1,
0.1679132, 0.8672376, 0.6215931, 1, 1, 1, 1, 1,
0.1702039, 0.309507, 1.63057, 1, 1, 1, 1, 1,
0.17073, -0.07318928, 2.276361, 1, 1, 1, 1, 1,
0.1711844, 0.9629296, 2.169956, 1, 1, 1, 1, 1,
0.1713207, -0.1885116, 4.365586, 1, 1, 1, 1, 1,
0.174423, 1.591519, -1.09681, 1, 1, 1, 1, 1,
0.1759672, 0.5063202, -0.1493404, 1, 1, 1, 1, 1,
0.1762484, -0.988445, 3.462127, 1, 1, 1, 1, 1,
0.179318, -0.5459203, 1.95546, 0, 0, 1, 1, 1,
0.1826513, -0.1289429, 2.136988, 1, 0, 0, 1, 1,
0.1850129, 1.312576, 0.8848306, 1, 0, 0, 1, 1,
0.1881133, -0.3918828, 3.218567, 1, 0, 0, 1, 1,
0.1891774, 1.567107, 1.404033, 1, 0, 0, 1, 1,
0.1900878, 1.503438, 0.4772696, 1, 0, 0, 1, 1,
0.1967431, 1.236416, 1.349049, 0, 0, 0, 1, 1,
0.1982251, -0.8306935, 3.219733, 0, 0, 0, 1, 1,
0.2090175, 0.5096329, 0.8975039, 0, 0, 0, 1, 1,
0.2110175, -0.9084728, 3.988346, 0, 0, 0, 1, 1,
0.2119371, -0.4810778, 3.900217, 0, 0, 0, 1, 1,
0.2134807, -0.8370469, 3.085589, 0, 0, 0, 1, 1,
0.2139438, -0.4729505, 2.361144, 0, 0, 0, 1, 1,
0.2139705, 0.1801999, -1.19236, 1, 1, 1, 1, 1,
0.2161063, -1.102573, 2.275321, 1, 1, 1, 1, 1,
0.2164665, -2.064591, 4.751257, 1, 1, 1, 1, 1,
0.2170632, -0.0958107, 2.052119, 1, 1, 1, 1, 1,
0.2190489, -1.107993, 4.285327, 1, 1, 1, 1, 1,
0.2201313, -0.2845231, 1.638816, 1, 1, 1, 1, 1,
0.2205594, -1.229761, 1.798655, 1, 1, 1, 1, 1,
0.2214001, -0.2506756, 2.692039, 1, 1, 1, 1, 1,
0.2261255, -1.169512, 3.482676, 1, 1, 1, 1, 1,
0.2275355, 1.039035, -2.129102, 1, 1, 1, 1, 1,
0.2287221, -0.884689, 2.792384, 1, 1, 1, 1, 1,
0.2300299, -0.7780048, 1.741367, 1, 1, 1, 1, 1,
0.2318609, 0.1989386, 0.3648356, 1, 1, 1, 1, 1,
0.2378885, 0.1026148, 2.383986, 1, 1, 1, 1, 1,
0.2467398, 0.3841936, 2.482327, 1, 1, 1, 1, 1,
0.2494147, 0.4834891, 0.2734735, 0, 0, 1, 1, 1,
0.2504515, 1.386227, -0.613678, 1, 0, 0, 1, 1,
0.254109, -0.006214426, 2.611068, 1, 0, 0, 1, 1,
0.2589351, 0.4626998, 0.5974628, 1, 0, 0, 1, 1,
0.2598646, -0.8842409, 3.075965, 1, 0, 0, 1, 1,
0.2688792, -0.09194677, 1.119668, 1, 0, 0, 1, 1,
0.2728259, -1.534953, 0.2545919, 0, 0, 0, 1, 1,
0.2735035, -0.1086555, 2.895252, 0, 0, 0, 1, 1,
0.2741805, -1.284043, 3.683018, 0, 0, 0, 1, 1,
0.2745878, 0.6435986, -0.378242, 0, 0, 0, 1, 1,
0.2764417, 1.992839, 1.21443, 0, 0, 0, 1, 1,
0.2766223, -0.2904539, 1.289219, 0, 0, 0, 1, 1,
0.2802258, -0.02661362, 1.535307, 0, 0, 0, 1, 1,
0.2834777, -1.22584, 3.843655, 1, 1, 1, 1, 1,
0.2847987, 2.281437, -1.433836, 1, 1, 1, 1, 1,
0.2931298, 1.630674, 1.363357, 1, 1, 1, 1, 1,
0.2956006, 0.4351696, -0.4439075, 1, 1, 1, 1, 1,
0.3063464, 0.300445, 1.762644, 1, 1, 1, 1, 1,
0.3073205, -1.109039, 1.809456, 1, 1, 1, 1, 1,
0.30767, -0.3884493, 2.916214, 1, 1, 1, 1, 1,
0.3084749, -1.730508, 2.96834, 1, 1, 1, 1, 1,
0.3095445, -0.4145634, 3.634254, 1, 1, 1, 1, 1,
0.3133366, -0.4281035, 3.361838, 1, 1, 1, 1, 1,
0.3196071, 0.7232888, -0.2136536, 1, 1, 1, 1, 1,
0.3199857, 3.548727, 1.440507, 1, 1, 1, 1, 1,
0.3263316, 1.850224, -0.291859, 1, 1, 1, 1, 1,
0.3282633, 1.293171, 1.553316, 1, 1, 1, 1, 1,
0.3284892, -0.5222759, 2.776928, 1, 1, 1, 1, 1,
0.3305435, 1.250409, 1.143178, 0, 0, 1, 1, 1,
0.3416161, -0.3265904, 2.236948, 1, 0, 0, 1, 1,
0.3449192, 0.5547546, 2.058522, 1, 0, 0, 1, 1,
0.3463275, 0.4252652, 1.095288, 1, 0, 0, 1, 1,
0.3546194, -0.1198311, 1.508998, 1, 0, 0, 1, 1,
0.3570847, 0.0972361, 0.4527047, 1, 0, 0, 1, 1,
0.3574375, -0.1803285, 1.365119, 0, 0, 0, 1, 1,
0.358228, -0.3383638, 2.511421, 0, 0, 0, 1, 1,
0.36023, 0.4341952, 0.4911698, 0, 0, 0, 1, 1,
0.3624254, -1.549134, 1.337471, 0, 0, 0, 1, 1,
0.3634529, 1.075827, 0.6310635, 0, 0, 0, 1, 1,
0.3675292, 1.277301, 1.308663, 0, 0, 0, 1, 1,
0.3733662, 0.9370728, 0.4751413, 0, 0, 0, 1, 1,
0.3812259, -0.9784288, 4.47615, 1, 1, 1, 1, 1,
0.3822461, 1.593649, 0.2978925, 1, 1, 1, 1, 1,
0.3826795, 1.444145, 0.5261062, 1, 1, 1, 1, 1,
0.39147, 0.2674512, 2.470851, 1, 1, 1, 1, 1,
0.3915595, 1.984846, 0.001936904, 1, 1, 1, 1, 1,
0.3961672, 0.5146282, 0.1759682, 1, 1, 1, 1, 1,
0.4055231, 0.4420856, 1.043374, 1, 1, 1, 1, 1,
0.4061682, -1.229099, 2.138235, 1, 1, 1, 1, 1,
0.4090124, 1.003215, -0.1222339, 1, 1, 1, 1, 1,
0.4100116, -1.136573, 2.840032, 1, 1, 1, 1, 1,
0.4145811, 1.4546, -0.9772511, 1, 1, 1, 1, 1,
0.4168561, -0.3502201, 1.729983, 1, 1, 1, 1, 1,
0.4178639, -0.2310802, 2.53205, 1, 1, 1, 1, 1,
0.4210029, -0.02358831, -0.7376044, 1, 1, 1, 1, 1,
0.4210282, -1.257027, 2.836632, 1, 1, 1, 1, 1,
0.4227004, 1.111393, 0.5670828, 0, 0, 1, 1, 1,
0.4245202, 2.157569, 0.04759739, 1, 0, 0, 1, 1,
0.4250908, 0.003965755, 2.110745, 1, 0, 0, 1, 1,
0.4275734, 0.1700248, 0.4060404, 1, 0, 0, 1, 1,
0.4314755, -0.0828632, 1.791759, 1, 0, 0, 1, 1,
0.4347189, -0.6230844, 2.166048, 1, 0, 0, 1, 1,
0.4353174, -0.6392046, 3.447168, 0, 0, 0, 1, 1,
0.4353291, 0.4369053, 1.75456, 0, 0, 0, 1, 1,
0.4372781, -1.758623, 5.148986, 0, 0, 0, 1, 1,
0.4389307, 1.241275, 0.1520257, 0, 0, 0, 1, 1,
0.4408436, -0.1093574, 2.552185, 0, 0, 0, 1, 1,
0.4420059, -2.018507, 4.815824, 0, 0, 0, 1, 1,
0.4436086, -0.6092106, 2.591909, 0, 0, 0, 1, 1,
0.4448195, -0.869676, 3.280678, 1, 1, 1, 1, 1,
0.4520392, -2.248253, 5.163902, 1, 1, 1, 1, 1,
0.4553294, -1.286481, 3.353004, 1, 1, 1, 1, 1,
0.4567393, -0.8120573, 3.094536, 1, 1, 1, 1, 1,
0.4569148, -1.315224, 3.426604, 1, 1, 1, 1, 1,
0.4622798, 0.5958111, 1.307765, 1, 1, 1, 1, 1,
0.4635079, 0.5318518, 1.804333, 1, 1, 1, 1, 1,
0.4637705, 0.363423, 2.138039, 1, 1, 1, 1, 1,
0.4671405, 0.09061252, 1.047721, 1, 1, 1, 1, 1,
0.4678766, 0.2441597, 0.4734311, 1, 1, 1, 1, 1,
0.4685198, 0.9555476, 0.04602496, 1, 1, 1, 1, 1,
0.4721038, 0.4398538, 1.642336, 1, 1, 1, 1, 1,
0.4722048, 0.5143974, 0.854893, 1, 1, 1, 1, 1,
0.4735087, 1.889676, 1.156353, 1, 1, 1, 1, 1,
0.4738576, 0.7381482, 1.60732, 1, 1, 1, 1, 1,
0.476239, 0.3984191, 1.786412, 0, 0, 1, 1, 1,
0.479167, -0.4551835, 4.809419, 1, 0, 0, 1, 1,
0.4810255, 0.009649653, 2.560725, 1, 0, 0, 1, 1,
0.4852087, 0.5194048, 2.238044, 1, 0, 0, 1, 1,
0.4888745, 0.1965073, 1.949378, 1, 0, 0, 1, 1,
0.4891764, -0.8782673, 1.753466, 1, 0, 0, 1, 1,
0.4896331, 0.8737774, -0.1151431, 0, 0, 0, 1, 1,
0.494395, 0.283085, 0.5794863, 0, 0, 0, 1, 1,
0.5045621, 0.2489105, 2.158202, 0, 0, 0, 1, 1,
0.526004, 1.709826, 0.3238226, 0, 0, 0, 1, 1,
0.5269083, 0.8489872, 0.7857029, 0, 0, 0, 1, 1,
0.5281907, -0.1627085, 2.915953, 0, 0, 0, 1, 1,
0.5300661, 0.5674829, 0.4011283, 0, 0, 0, 1, 1,
0.5323106, 0.2005118, 2.01695, 1, 1, 1, 1, 1,
0.5350165, -0.3862684, 2.749993, 1, 1, 1, 1, 1,
0.5375713, 1.435627, -1.610989, 1, 1, 1, 1, 1,
0.5379515, -1.517054, 2.879639, 1, 1, 1, 1, 1,
0.5402142, 0.6133533, 2.317912, 1, 1, 1, 1, 1,
0.5443321, 2.2658, 0.3613624, 1, 1, 1, 1, 1,
0.5475808, -0.4388823, 3.50879, 1, 1, 1, 1, 1,
0.547909, 0.6758739, -0.8266328, 1, 1, 1, 1, 1,
0.5485047, -0.6793233, 2.159604, 1, 1, 1, 1, 1,
0.5508612, 0.3978626, 1.651356, 1, 1, 1, 1, 1,
0.5560367, -0.2347571, 0.5301595, 1, 1, 1, 1, 1,
0.5591076, -1.647836, 2.247886, 1, 1, 1, 1, 1,
0.5629493, -1.218366, 4.18399, 1, 1, 1, 1, 1,
0.5695779, -1.485722, 3.764613, 1, 1, 1, 1, 1,
0.5735168, 0.06916083, 0.8127867, 1, 1, 1, 1, 1,
0.5743163, -0.1731278, 2.856402, 0, 0, 1, 1, 1,
0.575004, -1.931382, 3.382635, 1, 0, 0, 1, 1,
0.5757064, 0.8648251, 1.019114, 1, 0, 0, 1, 1,
0.575992, -1.459957, 1.516925, 1, 0, 0, 1, 1,
0.5771912, -0.4061346, 2.596221, 1, 0, 0, 1, 1,
0.5783585, 1.50047, 1.566538, 1, 0, 0, 1, 1,
0.5790041, -0.3926412, 0.9544937, 0, 0, 0, 1, 1,
0.5833923, -1.559178, 1.478993, 0, 0, 0, 1, 1,
0.5901404, -0.9298701, 2.776666, 0, 0, 0, 1, 1,
0.5902176, -0.3841804, 1.503781, 0, 0, 0, 1, 1,
0.590359, 0.4056205, 0.7051459, 0, 0, 0, 1, 1,
0.5914757, -0.06677494, 0.9856836, 0, 0, 0, 1, 1,
0.5924686, 0.8676693, 1.204243, 0, 0, 0, 1, 1,
0.5930306, -0.4199203, 2.551504, 1, 1, 1, 1, 1,
0.6013716, 0.04361295, 0.3300764, 1, 1, 1, 1, 1,
0.6053694, 2.865916, 0.5553589, 1, 1, 1, 1, 1,
0.6064046, -0.3940252, 1.418143, 1, 1, 1, 1, 1,
0.6066609, 1.15561, 0.9784853, 1, 1, 1, 1, 1,
0.6090841, -1.233724, 2.832612, 1, 1, 1, 1, 1,
0.6222218, -0.3653436, 1.804558, 1, 1, 1, 1, 1,
0.6271968, 1.777184, 0.1665156, 1, 1, 1, 1, 1,
0.6290584, -0.139379, 1.251879, 1, 1, 1, 1, 1,
0.6295902, -0.3107536, 1.988176, 1, 1, 1, 1, 1,
0.6308703, -0.5866054, 3.058417, 1, 1, 1, 1, 1,
0.6325552, 1.393934, -0.3553181, 1, 1, 1, 1, 1,
0.6384192, -2.04478, 3.276231, 1, 1, 1, 1, 1,
0.6394351, -0.455006, 2.332746, 1, 1, 1, 1, 1,
0.640262, -0.4757982, 3.016826, 1, 1, 1, 1, 1,
0.6473321, -1.159802, 2.164377, 0, 0, 1, 1, 1,
0.6486633, 1.10339, 0.9280162, 1, 0, 0, 1, 1,
0.6514869, -0.2317942, 2.350963, 1, 0, 0, 1, 1,
0.6548697, -0.7665758, 3.228839, 1, 0, 0, 1, 1,
0.6559417, 0.08694042, 0.4621234, 1, 0, 0, 1, 1,
0.6560907, 0.1355888, -0.04052743, 1, 0, 0, 1, 1,
0.6587933, 0.6101002, 2.349264, 0, 0, 0, 1, 1,
0.65902, 0.3725334, 2.436117, 0, 0, 0, 1, 1,
0.660474, 1.94441, 0.4749306, 0, 0, 0, 1, 1,
0.6615675, 0.3027606, -0.6731613, 0, 0, 0, 1, 1,
0.6631011, 2.261544, 2.193918, 0, 0, 0, 1, 1,
0.6646976, 0.1691948, 0.1788803, 0, 0, 0, 1, 1,
0.6661561, -0.2968088, 0.2645108, 0, 0, 0, 1, 1,
0.6695657, -0.02982708, 2.828476, 1, 1, 1, 1, 1,
0.6729948, 0.5948946, 0.2889672, 1, 1, 1, 1, 1,
0.6789854, -1.037776, 2.750725, 1, 1, 1, 1, 1,
0.6796769, 0.9232907, -0.2831145, 1, 1, 1, 1, 1,
0.6801955, -0.06366165, 2.765706, 1, 1, 1, 1, 1,
0.6821127, 0.5662934, 1.310661, 1, 1, 1, 1, 1,
0.6854678, -1.217287, 2.536971, 1, 1, 1, 1, 1,
0.6891689, 1.288281, 0.9741365, 1, 1, 1, 1, 1,
0.6915361, -0.4511867, 0.4684426, 1, 1, 1, 1, 1,
0.6923283, 0.8493635, 0.1137945, 1, 1, 1, 1, 1,
0.6942244, -0.5412748, 2.173847, 1, 1, 1, 1, 1,
0.6978259, -0.3057058, 2.728519, 1, 1, 1, 1, 1,
0.698769, 0.65224, -0.09213866, 1, 1, 1, 1, 1,
0.699203, 0.3671467, 2.19216, 1, 1, 1, 1, 1,
0.701185, 0.9264955, 1.751066, 1, 1, 1, 1, 1,
0.7058557, -0.7849137, 1.410788, 0, 0, 1, 1, 1,
0.7080106, -1.998177, 1.241439, 1, 0, 0, 1, 1,
0.7095159, 0.1981727, 0.1084429, 1, 0, 0, 1, 1,
0.7114527, 0.2575287, 1.050097, 1, 0, 0, 1, 1,
0.7162473, 2.992396, 0.2692868, 1, 0, 0, 1, 1,
0.7254957, 0.5320879, -0.2643137, 1, 0, 0, 1, 1,
0.737314, -0.04420813, 1.66384, 0, 0, 0, 1, 1,
0.7415102, 0.2689873, 0.3844138, 0, 0, 0, 1, 1,
0.7432464, 0.08100773, 2.216478, 0, 0, 0, 1, 1,
0.7508394, -1.906457, 2.30681, 0, 0, 0, 1, 1,
0.7634683, -0.1831801, 2.972155, 0, 0, 0, 1, 1,
0.7693412, 0.6016544, -0.4698655, 0, 0, 0, 1, 1,
0.7704815, -0.575311, 3.274902, 0, 0, 0, 1, 1,
0.7714969, -1.988437, 3.982226, 1, 1, 1, 1, 1,
0.7745271, -0.06488194, 0.8833083, 1, 1, 1, 1, 1,
0.7761805, 0.751013, -0.4991381, 1, 1, 1, 1, 1,
0.7766827, 2.567504, 1.253406, 1, 1, 1, 1, 1,
0.7827162, 0.9927759, 1.945453, 1, 1, 1, 1, 1,
0.7848261, 0.5519565, 0.4010546, 1, 1, 1, 1, 1,
0.7868873, 1.138925, 0.8973967, 1, 1, 1, 1, 1,
0.7997991, 0.9030559, 0.2104088, 1, 1, 1, 1, 1,
0.8051606, 1.279913, 1.134306, 1, 1, 1, 1, 1,
0.82173, 1.808173, -0.250251, 1, 1, 1, 1, 1,
0.8258567, 0.1239159, 1.807532, 1, 1, 1, 1, 1,
0.82679, -0.1669967, 1.352253, 1, 1, 1, 1, 1,
0.8288625, 0.5353583, 2.090427, 1, 1, 1, 1, 1,
0.8303894, -0.176758, 3.216822, 1, 1, 1, 1, 1,
0.8343475, -1.141531, 2.476747, 1, 1, 1, 1, 1,
0.8349725, -0.7198278, 2.905331, 0, 0, 1, 1, 1,
0.8378835, 1.23786, 0.5133054, 1, 0, 0, 1, 1,
0.8396816, 0.785795, -1.027348, 1, 0, 0, 1, 1,
0.8435919, 0.2224202, 1.35932, 1, 0, 0, 1, 1,
0.8445374, -0.6904631, 0.5447233, 1, 0, 0, 1, 1,
0.849935, 0.1985176, 2.290298, 1, 0, 0, 1, 1,
0.8514203, -0.7518741, 1.732273, 0, 0, 0, 1, 1,
0.8557186, -0.4131216, 2.086194, 0, 0, 0, 1, 1,
0.8631759, -0.320976, 2.382123, 0, 0, 0, 1, 1,
0.865158, 1.293649, 0.4602953, 0, 0, 0, 1, 1,
0.86616, -0.9862141, 2.065413, 0, 0, 0, 1, 1,
0.8663504, -0.1939265, 1.7189, 0, 0, 0, 1, 1,
0.8693887, -1.024293, 2.36865, 0, 0, 0, 1, 1,
0.8727715, -0.8392997, 1.778669, 1, 1, 1, 1, 1,
0.8767754, 0.3029425, -0.4958342, 1, 1, 1, 1, 1,
0.8767809, -1.252701, 1.908148, 1, 1, 1, 1, 1,
0.8803633, -0.16175, 1.586641, 1, 1, 1, 1, 1,
0.8845916, 1.825764, 0.7704583, 1, 1, 1, 1, 1,
0.8977774, -2.718275, 4.597281, 1, 1, 1, 1, 1,
0.8995128, 1.330495, 2.63733, 1, 1, 1, 1, 1,
0.902207, 0.8961365, 0.4795159, 1, 1, 1, 1, 1,
0.9032204, -1.290016, 3.428177, 1, 1, 1, 1, 1,
0.9123528, 0.4906492, -0.3938292, 1, 1, 1, 1, 1,
0.9150969, -0.8117746, 0.7221157, 1, 1, 1, 1, 1,
0.9206994, 0.3245881, 1.706759, 1, 1, 1, 1, 1,
0.9242676, -0.7184142, 1.12663, 1, 1, 1, 1, 1,
0.9292274, 0.5454865, 0.4937218, 1, 1, 1, 1, 1,
0.9310473, 0.4169903, 0.6690058, 1, 1, 1, 1, 1,
0.9424812, -0.9334047, 3.063429, 0, 0, 1, 1, 1,
0.9530486, 0.03891395, 2.712027, 1, 0, 0, 1, 1,
0.9563315, 1.659744, -0.5557681, 1, 0, 0, 1, 1,
0.9581491, -0.5820808, 2.253279, 1, 0, 0, 1, 1,
0.9585725, -0.07826736, 2.274254, 1, 0, 0, 1, 1,
0.966564, -0.3437139, 1.112224, 1, 0, 0, 1, 1,
0.9693415, 0.6177821, 1.023247, 0, 0, 0, 1, 1,
0.9709958, -1.038107, 2.920991, 0, 0, 0, 1, 1,
0.9736068, 0.5640123, 0.5594253, 0, 0, 0, 1, 1,
0.9743052, -1.062752, 1.884249, 0, 0, 0, 1, 1,
0.9772447, 0.7073446, 1.385076, 0, 0, 0, 1, 1,
0.9813886, 0.4807438, 0.8158407, 0, 0, 0, 1, 1,
0.9915233, 0.1963976, 2.009165, 0, 0, 0, 1, 1,
0.9931133, -1.351789, 1.985384, 1, 1, 1, 1, 1,
0.9968344, 0.9012846, 1.218493, 1, 1, 1, 1, 1,
0.9982622, 1.043576, 0.8540435, 1, 1, 1, 1, 1,
0.998645, 0.1925704, 1.083573, 1, 1, 1, 1, 1,
1.002391, 0.1470873, 3.006079, 1, 1, 1, 1, 1,
1.005446, 0.7803655, 0.5989051, 1, 1, 1, 1, 1,
1.007148, -0.7266958, 2.077881, 1, 1, 1, 1, 1,
1.01288, 0.564851, 1.805233, 1, 1, 1, 1, 1,
1.016387, 1.514379, 1.557473, 1, 1, 1, 1, 1,
1.021325, -0.8065153, 3.375584, 1, 1, 1, 1, 1,
1.025282, 1.345188, 1.962885, 1, 1, 1, 1, 1,
1.026724, -0.05078011, 2.58417, 1, 1, 1, 1, 1,
1.027972, 0.3519269, 3.299986, 1, 1, 1, 1, 1,
1.028545, 0.9768321, 0.42144, 1, 1, 1, 1, 1,
1.029624, 0.6812553, -0.8553492, 1, 1, 1, 1, 1,
1.031375, -0.2188098, 1.419237, 0, 0, 1, 1, 1,
1.032344, 0.07057374, 2.497673, 1, 0, 0, 1, 1,
1.038315, 2.102021, -0.3200228, 1, 0, 0, 1, 1,
1.041089, 0.6460006, 1.551371, 1, 0, 0, 1, 1,
1.046181, -0.09419223, 0.4992913, 1, 0, 0, 1, 1,
1.052358, 0.9205673, -1.151596, 1, 0, 0, 1, 1,
1.058251, 0.8185416, 1.432843, 0, 0, 0, 1, 1,
1.061589, -0.8336754, 3.078505, 0, 0, 0, 1, 1,
1.06523, -0.3947368, 1.914283, 0, 0, 0, 1, 1,
1.066915, 1.930186, 0.4027896, 0, 0, 0, 1, 1,
1.073033, -0.4208775, 0.7327584, 0, 0, 0, 1, 1,
1.079262, 0.6480091, 0.6867719, 0, 0, 0, 1, 1,
1.08596, -0.6928366, 1.784807, 0, 0, 0, 1, 1,
1.08751, -0.4711183, 2.38457, 1, 1, 1, 1, 1,
1.090287, 0.5754096, 0.04067202, 1, 1, 1, 1, 1,
1.101941, 1.589875, -0.5049751, 1, 1, 1, 1, 1,
1.103153, 1.094812, 1.718965, 1, 1, 1, 1, 1,
1.109463, 0.1447124, 1.110419, 1, 1, 1, 1, 1,
1.110562, 1.037298, 0.3543685, 1, 1, 1, 1, 1,
1.112618, -0.1342827, 0.88677, 1, 1, 1, 1, 1,
1.113034, 0.2625923, 2.753997, 1, 1, 1, 1, 1,
1.121338, 2.556497, 1.603853, 1, 1, 1, 1, 1,
1.133801, 1.603516, 0.8559978, 1, 1, 1, 1, 1,
1.135211, -1.843218, 1.846077, 1, 1, 1, 1, 1,
1.147704, -0.6999025, 0.9928387, 1, 1, 1, 1, 1,
1.149839, 0.8528143, 1.34098, 1, 1, 1, 1, 1,
1.153968, 2.52527, 1.018035, 1, 1, 1, 1, 1,
1.15443, -0.134681, 1.975171, 1, 1, 1, 1, 1,
1.162232, -1.863219, 4.021245, 0, 0, 1, 1, 1,
1.16449, -0.06353861, 1.604187, 1, 0, 0, 1, 1,
1.174213, -1.145888, 2.041169, 1, 0, 0, 1, 1,
1.174603, 0.2670894, -0.1063337, 1, 0, 0, 1, 1,
1.182269, -1.483091, 4.241879, 1, 0, 0, 1, 1,
1.184798, 0.2022429, 2.429558, 1, 0, 0, 1, 1,
1.202959, -1.106114, 2.377975, 0, 0, 0, 1, 1,
1.206817, 1.627969, -0.1163041, 0, 0, 0, 1, 1,
1.211031, 0.03192615, 2.347281, 0, 0, 0, 1, 1,
1.211354, 0.05854007, 1.728502, 0, 0, 0, 1, 1,
1.214948, 0.6755719, 2.566932, 0, 0, 0, 1, 1,
1.215766, 0.2771383, 2.022492, 0, 0, 0, 1, 1,
1.219016, 1.091654, 0.5297083, 0, 0, 0, 1, 1,
1.225287, -0.2845056, 0.8559659, 1, 1, 1, 1, 1,
1.233316, -0.1708764, 1.515276, 1, 1, 1, 1, 1,
1.234412, -0.6685653, 1.785485, 1, 1, 1, 1, 1,
1.23831, -1.233924, 1.238745, 1, 1, 1, 1, 1,
1.242807, -1.459026, 2.911875, 1, 1, 1, 1, 1,
1.246339, 2.004685, 1.926373, 1, 1, 1, 1, 1,
1.261917, 1.031682, -0.1037083, 1, 1, 1, 1, 1,
1.263107, 0.465206, -0.2138568, 1, 1, 1, 1, 1,
1.26436, 0.3707494, 1.82627, 1, 1, 1, 1, 1,
1.280584, -0.0447972, 1.897309, 1, 1, 1, 1, 1,
1.295033, 2.327419, 0.1746399, 1, 1, 1, 1, 1,
1.295112, -0.9579188, 1.94079, 1, 1, 1, 1, 1,
1.297939, 2.680057, -0.3575174, 1, 1, 1, 1, 1,
1.304435, -1.411319, 2.966245, 1, 1, 1, 1, 1,
1.317785, 0.3102871, 0.09219621, 1, 1, 1, 1, 1,
1.318106, 1.14238, 1.846527, 0, 0, 1, 1, 1,
1.320837, 0.6018371, 1.97537, 1, 0, 0, 1, 1,
1.338018, 0.6754372, 2.430055, 1, 0, 0, 1, 1,
1.338729, 1.091405, 0.1482718, 1, 0, 0, 1, 1,
1.339717, 0.2973687, 2.148769, 1, 0, 0, 1, 1,
1.350599, -1.175807, 2.321594, 1, 0, 0, 1, 1,
1.352572, 1.82194, 0.3475626, 0, 0, 0, 1, 1,
1.359617, 0.4130785, 2.850572, 0, 0, 0, 1, 1,
1.36195, -0.05542197, 2.232744, 0, 0, 0, 1, 1,
1.363095, -0.2393382, 2.856347, 0, 0, 0, 1, 1,
1.368728, -1.885737, 2.51379, 0, 0, 0, 1, 1,
1.371923, -0.2041034, 2.533244, 0, 0, 0, 1, 1,
1.379137, 0.3676766, 0.3382327, 0, 0, 0, 1, 1,
1.382939, -2.730927, 2.106854, 1, 1, 1, 1, 1,
1.386397, -0.6683153, 1.651819, 1, 1, 1, 1, 1,
1.392082, -0.1499854, 0.222322, 1, 1, 1, 1, 1,
1.402105, -0.7785082, 3.157102, 1, 1, 1, 1, 1,
1.403888, 1.927829, -0.634151, 1, 1, 1, 1, 1,
1.404278, 0.8185013, 1.609049, 1, 1, 1, 1, 1,
1.409635, -0.3293581, 2.521751, 1, 1, 1, 1, 1,
1.411597, 2.052271, -0.9228854, 1, 1, 1, 1, 1,
1.412235, 1.309525, 0.6802014, 1, 1, 1, 1, 1,
1.416468, 1.182521, 0.9379657, 1, 1, 1, 1, 1,
1.417901, -1.079228, 2.207302, 1, 1, 1, 1, 1,
1.435502, 0.5812296, 2.707453, 1, 1, 1, 1, 1,
1.436079, 0.1391087, 3.435681, 1, 1, 1, 1, 1,
1.455487, -0.2775419, -0.4920889, 1, 1, 1, 1, 1,
1.457524, -0.5696014, 0.5364377, 1, 1, 1, 1, 1,
1.458176, 0.8006696, 0.6315215, 0, 0, 1, 1, 1,
1.461044, 0.2037602, 1.836086, 1, 0, 0, 1, 1,
1.462263, 2.481358, 2.292961, 1, 0, 0, 1, 1,
1.463148, 0.8624247, 0.9547893, 1, 0, 0, 1, 1,
1.47804, 0.2534119, 0.3943245, 1, 0, 0, 1, 1,
1.485591, 1.335915, -0.01474475, 1, 0, 0, 1, 1,
1.495866, 0.8589172, -0.006031004, 0, 0, 0, 1, 1,
1.502476, 0.564814, 2.190457, 0, 0, 0, 1, 1,
1.507584, -0.6144188, 2.581927, 0, 0, 0, 1, 1,
1.510568, -0.2129963, 1.003826, 0, 0, 0, 1, 1,
1.516049, -0.5016208, 2.011969, 0, 0, 0, 1, 1,
1.517351, 1.549072, 0.0313786, 0, 0, 0, 1, 1,
1.521949, 0.3225887, 1.863691, 0, 0, 0, 1, 1,
1.525347, 0.1808344, 0.7944604, 1, 1, 1, 1, 1,
1.529114, -0.1217106, 2.039498, 1, 1, 1, 1, 1,
1.531112, -0.1534011, 1.5225, 1, 1, 1, 1, 1,
1.535612, 0.4229998, 3.528613, 1, 1, 1, 1, 1,
1.536182, 0.5382617, -0.3558573, 1, 1, 1, 1, 1,
1.542114, 0.5563979, 2.081048, 1, 1, 1, 1, 1,
1.546602, 0.4292196, 2.745539, 1, 1, 1, 1, 1,
1.564292, 0.4671782, 2.339382, 1, 1, 1, 1, 1,
1.574544, -0.28267, 2.650499, 1, 1, 1, 1, 1,
1.578515, 0.2152511, 2.224601, 1, 1, 1, 1, 1,
1.578668, 2.856182, 1.87288, 1, 1, 1, 1, 1,
1.583929, 1.648523, 0.972667, 1, 1, 1, 1, 1,
1.604153, -0.1153786, 0.5208721, 1, 1, 1, 1, 1,
1.607046, -1.201775, 1.833024, 1, 1, 1, 1, 1,
1.608984, -0.1042577, 2.043531, 1, 1, 1, 1, 1,
1.611763, 0.6053092, 2.277947, 0, 0, 1, 1, 1,
1.618829, -0.9298224, 2.278456, 1, 0, 0, 1, 1,
1.628173, 1.198084, 0.5780987, 1, 0, 0, 1, 1,
1.640317, -0.4907571, 2.619699, 1, 0, 0, 1, 1,
1.65361, 0.7921506, 1.248589, 1, 0, 0, 1, 1,
1.655663, -0.440669, 1.764812, 1, 0, 0, 1, 1,
1.6557, 0.2548105, 1.196953, 0, 0, 0, 1, 1,
1.675199, 0.02727361, 1.679551, 0, 0, 0, 1, 1,
1.676805, -0.514217, 1.068328, 0, 0, 0, 1, 1,
1.678373, 0.5993787, 3.002584, 0, 0, 0, 1, 1,
1.689669, 0.01253379, 2.068159, 0, 0, 0, 1, 1,
1.692874, -1.07399, 1.386813, 0, 0, 0, 1, 1,
1.715588, -0.4989639, 3.389006, 0, 0, 0, 1, 1,
1.716898, 1.23105, 1.510644, 1, 1, 1, 1, 1,
1.742657, -0.09877941, 0.6133493, 1, 1, 1, 1, 1,
1.748688, -0.6116368, 2.137758, 1, 1, 1, 1, 1,
1.80337, 0.08243988, 1.275699, 1, 1, 1, 1, 1,
1.808481, -0.6597728, 2.19469, 1, 1, 1, 1, 1,
1.815387, 0.6351972, 3.888309, 1, 1, 1, 1, 1,
1.826806, 1.169406, 2.26495, 1, 1, 1, 1, 1,
1.829518, 0.9562448, 2.15485, 1, 1, 1, 1, 1,
1.837767, -0.2674318, 2.648023, 1, 1, 1, 1, 1,
1.90646, 1.025443, -0.4320296, 1, 1, 1, 1, 1,
1.909911, 0.2869971, 2.16362, 1, 1, 1, 1, 1,
1.917303, -1.344962, 1.833901, 1, 1, 1, 1, 1,
1.944516, 0.8259703, 0.2656331, 1, 1, 1, 1, 1,
1.950209, 0.4817098, 1.269759, 1, 1, 1, 1, 1,
1.951593, -0.7029266, 2.533762, 1, 1, 1, 1, 1,
1.95437, 0.3177759, -0.1633753, 0, 0, 1, 1, 1,
1.954728, 0.5333339, 1.444027, 1, 0, 0, 1, 1,
1.957518, 0.7853285, 1.757013, 1, 0, 0, 1, 1,
2.074759, 0.4877069, 2.435879, 1, 0, 0, 1, 1,
2.091797, -0.04408998, 2.53749, 1, 0, 0, 1, 1,
2.100588, 0.003285225, 1.284896, 1, 0, 0, 1, 1,
2.185837, 1.261207, 0.3096258, 0, 0, 0, 1, 1,
2.201917, -0.5706072, 2.276713, 0, 0, 0, 1, 1,
2.235405, -1.891907, 4.084527, 0, 0, 0, 1, 1,
2.257035, 0.09006961, 2.648313, 0, 0, 0, 1, 1,
2.282232, 1.142138, 0.8149405, 0, 0, 0, 1, 1,
2.43723, 1.94391, 0.08923366, 0, 0, 0, 1, 1,
2.515202, 0.7043805, 1.984962, 0, 0, 0, 1, 1,
2.524172, -0.1705263, 1.388532, 1, 1, 1, 1, 1,
2.560879, 0.7543738, 3.641977, 1, 1, 1, 1, 1,
2.564519, -1.059443, 2.518476, 1, 1, 1, 1, 1,
2.608268, 0.704322, 0.5104798, 1, 1, 1, 1, 1,
2.742703, -0.6402866, 1.869967, 1, 1, 1, 1, 1,
2.879578, 1.469878, 0.2416331, 1, 1, 1, 1, 1,
2.980676, 1.638942, 0.267968, 1, 1, 1, 1, 1
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
var radius = 9.918576;
var distance = 34.83858;
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
mvMatrix.translate( 0.1238104, -0.4088999, 0.03696942 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83858);
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
