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
-3.077507, -0.8991829, -1.492483, 1, 0, 0, 1,
-3.073057, 0.5677292, -1.579762, 1, 0.007843138, 0, 1,
-2.823115, 0.4665845, -1.184301, 1, 0.01176471, 0, 1,
-2.759286, -0.2579108, -1.54581, 1, 0.01960784, 0, 1,
-2.62974, -0.25061, -1.561255, 1, 0.02352941, 0, 1,
-2.579928, -2.926672, -1.784974, 1, 0.03137255, 0, 1,
-2.556365, 0.690291, -1.101699, 1, 0.03529412, 0, 1,
-2.509431, -1.23588, -1.976135, 1, 0.04313726, 0, 1,
-2.431147, 0.6670198, -2.644819, 1, 0.04705882, 0, 1,
-2.413378, 1.002406, -2.355003, 1, 0.05490196, 0, 1,
-2.404699, 0.193985, -2.483836, 1, 0.05882353, 0, 1,
-2.400913, -0.03566834, -1.185123, 1, 0.06666667, 0, 1,
-2.371507, -0.7661583, -2.987218, 1, 0.07058824, 0, 1,
-2.304267, 0.5042328, -1.656098, 1, 0.07843138, 0, 1,
-2.181319, -0.2845201, -1.039569, 1, 0.08235294, 0, 1,
-2.177285, -1.133355, -0.7518679, 1, 0.09019608, 0, 1,
-2.171612, 0.114869, -1.307857, 1, 0.09411765, 0, 1,
-2.163383, -0.1650248, -1.003109, 1, 0.1019608, 0, 1,
-2.155392, 0.2213865, -3.041188, 1, 0.1098039, 0, 1,
-2.154748, -0.5119206, 0.004209772, 1, 0.1137255, 0, 1,
-2.093174, -1.955982, -2.768909, 1, 0.1215686, 0, 1,
-2.061924, 1.334772, -2.034133, 1, 0.1254902, 0, 1,
-2.059241, -0.9540564, -2.15584, 1, 0.1333333, 0, 1,
-2.04519, 0.8936069, 0.1388198, 1, 0.1372549, 0, 1,
-2.041175, 1.013867, -1.328155, 1, 0.145098, 0, 1,
-1.987954, 1.468652, -2.101489, 1, 0.1490196, 0, 1,
-1.967348, 0.8005328, -1.040623, 1, 0.1568628, 0, 1,
-1.945516, -1.099727, -2.98933, 1, 0.1607843, 0, 1,
-1.944782, 1.082516, -3.381081, 1, 0.1686275, 0, 1,
-1.929876, -1.244609, -1.890224, 1, 0.172549, 0, 1,
-1.891498, 0.6888908, -3.268388, 1, 0.1803922, 0, 1,
-1.888578, -0.2511959, -2.800132, 1, 0.1843137, 0, 1,
-1.857465, 0.1156531, -0.1862842, 1, 0.1921569, 0, 1,
-1.851283, 0.7733447, -1.86974, 1, 0.1960784, 0, 1,
-1.820613, -0.430226, -2.367584, 1, 0.2039216, 0, 1,
-1.811249, -0.4559538, -0.836476, 1, 0.2117647, 0, 1,
-1.803905, 0.04191826, -1.738571, 1, 0.2156863, 0, 1,
-1.773098, 1.014054, -2.037591, 1, 0.2235294, 0, 1,
-1.770465, -1.84976, -2.199723, 1, 0.227451, 0, 1,
-1.766796, 0.5478362, -1.837143, 1, 0.2352941, 0, 1,
-1.766725, 0.9429126, -1.455575, 1, 0.2392157, 0, 1,
-1.757772, 1.665573, 0.9690127, 1, 0.2470588, 0, 1,
-1.756509, 1.282995, -0.4825932, 1, 0.2509804, 0, 1,
-1.745243, -0.2863044, 0.1570174, 1, 0.2588235, 0, 1,
-1.726162, 1.342483, -1.903443, 1, 0.2627451, 0, 1,
-1.723002, -1.944505, -2.278255, 1, 0.2705882, 0, 1,
-1.713587, 0.1832658, -1.202184, 1, 0.2745098, 0, 1,
-1.707127, -1.239718, -1.721343, 1, 0.282353, 0, 1,
-1.686662, 0.3658136, -1.517126, 1, 0.2862745, 0, 1,
-1.671151, -2.227135, -2.629894, 1, 0.2941177, 0, 1,
-1.664209, 0.8097054, -1.72338, 1, 0.3019608, 0, 1,
-1.65579, -0.5465311, -2.678611, 1, 0.3058824, 0, 1,
-1.654645, 0.5625641, -0.9908174, 1, 0.3137255, 0, 1,
-1.647346, 0.2994165, -0.4375466, 1, 0.3176471, 0, 1,
-1.645273, 1.659099, -1.611796, 1, 0.3254902, 0, 1,
-1.64247, -0.3470069, -2.87492, 1, 0.3294118, 0, 1,
-1.642322, -1.204726, -3.284585, 1, 0.3372549, 0, 1,
-1.628506, -0.8046452, -3.916942, 1, 0.3411765, 0, 1,
-1.612862, 0.7304767, -3.388551, 1, 0.3490196, 0, 1,
-1.598869, 0.1021083, -0.2392106, 1, 0.3529412, 0, 1,
-1.598832, -1.059183, -1.714919, 1, 0.3607843, 0, 1,
-1.596277, 2.740367, 0.1281195, 1, 0.3647059, 0, 1,
-1.593714, -0.1148008, -2.208284, 1, 0.372549, 0, 1,
-1.576977, 0.8093879, -0.9751903, 1, 0.3764706, 0, 1,
-1.561649, -0.2755041, -1.450532, 1, 0.3843137, 0, 1,
-1.552459, -2.987038, -4.229387, 1, 0.3882353, 0, 1,
-1.546501, -0.8948784, -4.156837, 1, 0.3960784, 0, 1,
-1.545009, 1.777534, -0.6020637, 1, 0.4039216, 0, 1,
-1.518971, -0.4599507, -2.103524, 1, 0.4078431, 0, 1,
-1.504035, -0.6321139, -1.430183, 1, 0.4156863, 0, 1,
-1.487517, 0.09241907, -1.794122, 1, 0.4196078, 0, 1,
-1.480559, 0.742401, 0.2129737, 1, 0.427451, 0, 1,
-1.478629, 1.489417, -0.8526074, 1, 0.4313726, 0, 1,
-1.475447, 1.10424, 0.4630448, 1, 0.4392157, 0, 1,
-1.467162, 1.663049, -1.818628, 1, 0.4431373, 0, 1,
-1.46209, 1.024133, 1.829902, 1, 0.4509804, 0, 1,
-1.451584, 1.050558, 0.2429914, 1, 0.454902, 0, 1,
-1.449747, 0.04647911, -1.543527, 1, 0.4627451, 0, 1,
-1.448773, -0.06822248, -1.266169, 1, 0.4666667, 0, 1,
-1.436286, -0.9048843, -2.418921, 1, 0.4745098, 0, 1,
-1.432592, -0.6467769, -3.146927, 1, 0.4784314, 0, 1,
-1.428153, -1.028348, -3.12904, 1, 0.4862745, 0, 1,
-1.409955, 0.7049085, -0.2611664, 1, 0.4901961, 0, 1,
-1.406094, -0.8311389, -1.121884, 1, 0.4980392, 0, 1,
-1.397547, 0.8392953, 0.8978994, 1, 0.5058824, 0, 1,
-1.386602, 1.546134, -2.042847, 1, 0.509804, 0, 1,
-1.382285, 0.9450568, 0.222877, 1, 0.5176471, 0, 1,
-1.379851, -0.9999159, -1.221297, 1, 0.5215687, 0, 1,
-1.375699, 0.09361566, -2.497706, 1, 0.5294118, 0, 1,
-1.373394, 0.6605656, -1.236432, 1, 0.5333334, 0, 1,
-1.362277, -0.8405671, -1.950453, 1, 0.5411765, 0, 1,
-1.346338, -0.9213824, -0.77294, 1, 0.5450981, 0, 1,
-1.345351, 2.047515, 0.1862813, 1, 0.5529412, 0, 1,
-1.343256, 1.553386, -2.183875, 1, 0.5568628, 0, 1,
-1.341341, -1.424892, -3.662415, 1, 0.5647059, 0, 1,
-1.341132, 1.177903, -0.2540545, 1, 0.5686275, 0, 1,
-1.33593, 0.5481218, -0.1889489, 1, 0.5764706, 0, 1,
-1.329506, -0.1566961, -1.257684, 1, 0.5803922, 0, 1,
-1.329067, 0.2829251, -0.7977098, 1, 0.5882353, 0, 1,
-1.326332, -1.042553, -3.866185, 1, 0.5921569, 0, 1,
-1.321949, -0.9212493, -2.39373, 1, 0.6, 0, 1,
-1.321398, -0.4456514, -2.865469, 1, 0.6078432, 0, 1,
-1.320452, -0.1248865, -2.889961, 1, 0.6117647, 0, 1,
-1.319429, -0.800522, -1.520129, 1, 0.6196079, 0, 1,
-1.31635, 0.9037479, 0.109746, 1, 0.6235294, 0, 1,
-1.311612, -0.032215, -0.0253193, 1, 0.6313726, 0, 1,
-1.309542, 0.1079153, -0.724221, 1, 0.6352941, 0, 1,
-1.297167, 0.007319262, -1.464245, 1, 0.6431373, 0, 1,
-1.295302, -0.3952839, -1.311607, 1, 0.6470588, 0, 1,
-1.286465, -1.540255, -2.535253, 1, 0.654902, 0, 1,
-1.279171, 0.7897586, -0.2876059, 1, 0.6588235, 0, 1,
-1.273055, -1.059609, -2.517499, 1, 0.6666667, 0, 1,
-1.251892, -0.6418064, -1.863857, 1, 0.6705883, 0, 1,
-1.250698, 0.2301659, -1.727285, 1, 0.6784314, 0, 1,
-1.246611, 0.01857377, 0.6643525, 1, 0.682353, 0, 1,
-1.238775, 1.051443, -0.2821923, 1, 0.6901961, 0, 1,
-1.236164, 1.328186, 1.316065, 1, 0.6941177, 0, 1,
-1.233093, 1.64234, 0.4691344, 1, 0.7019608, 0, 1,
-1.230022, -0.2403594, -0.0752151, 1, 0.7098039, 0, 1,
-1.216655, 0.2950919, -0.5307575, 1, 0.7137255, 0, 1,
-1.215229, 0.6688799, -1.849111, 1, 0.7215686, 0, 1,
-1.213836, 0.21132, -1.765687, 1, 0.7254902, 0, 1,
-1.207301, -1.029355, -2.934004, 1, 0.7333333, 0, 1,
-1.199997, 0.02340617, -1.591526, 1, 0.7372549, 0, 1,
-1.198993, -0.6497156, -2.759271, 1, 0.7450981, 0, 1,
-1.196043, -0.4955128, -1.415207, 1, 0.7490196, 0, 1,
-1.194773, -0.354553, -1.955403, 1, 0.7568628, 0, 1,
-1.19455, 2.083148, 0.6051614, 1, 0.7607843, 0, 1,
-1.175895, 0.5260696, -2.308286, 1, 0.7686275, 0, 1,
-1.170363, 0.6628007, -0.3477641, 1, 0.772549, 0, 1,
-1.163147, 1.158797, -0.3535908, 1, 0.7803922, 0, 1,
-1.155357, 0.8739319, -2.58804, 1, 0.7843137, 0, 1,
-1.154627, -1.149339, -2.391024, 1, 0.7921569, 0, 1,
-1.142018, -2.282925, -2.765213, 1, 0.7960784, 0, 1,
-1.141222, -0.2296557, -1.598313, 1, 0.8039216, 0, 1,
-1.139559, 1.588753, -0.4896612, 1, 0.8117647, 0, 1,
-1.134552, -0.2426459, -1.092614, 1, 0.8156863, 0, 1,
-1.129165, -0.147395, -2.424802, 1, 0.8235294, 0, 1,
-1.118888, 0.9470751, -0.1358032, 1, 0.827451, 0, 1,
-1.106922, 0.589641, -1.149228, 1, 0.8352941, 0, 1,
-1.103767, 0.3677171, -2.004328, 1, 0.8392157, 0, 1,
-1.101542, -1.514724, -2.039781, 1, 0.8470588, 0, 1,
-1.10123, -0.6257917, -2.320357, 1, 0.8509804, 0, 1,
-1.094244, -0.9794461, -3.949407, 1, 0.8588235, 0, 1,
-1.08745, -1.407844, -2.893197, 1, 0.8627451, 0, 1,
-1.087358, 0.00987603, -2.487275, 1, 0.8705882, 0, 1,
-1.087071, -0.6725127, -2.57549, 1, 0.8745098, 0, 1,
-1.086567, 1.176331, 0.6220941, 1, 0.8823529, 0, 1,
-1.083308, -1.554581, -2.243361, 1, 0.8862745, 0, 1,
-1.080972, 0.2290241, -2.713442, 1, 0.8941177, 0, 1,
-1.078575, -0.2518557, -3.818195, 1, 0.8980392, 0, 1,
-1.075464, -1.219163, -0.8784165, 1, 0.9058824, 0, 1,
-1.074769, 0.4495001, 0.1244923, 1, 0.9137255, 0, 1,
-1.074707, -0.5120609, -4.442048, 1, 0.9176471, 0, 1,
-1.069876, -0.4653769, -1.794305, 1, 0.9254902, 0, 1,
-1.062211, -0.02151424, -1.49492, 1, 0.9294118, 0, 1,
-1.054393, 0.1325872, -2.085991, 1, 0.9372549, 0, 1,
-1.053612, -1.308935, -2.161222, 1, 0.9411765, 0, 1,
-1.047177, 0.354239, -0.838684, 1, 0.9490196, 0, 1,
-1.040711, 1.239504, 0.3987152, 1, 0.9529412, 0, 1,
-1.039053, 1.19277, -1.343628, 1, 0.9607843, 0, 1,
-1.037475, -0.9477665, -3.642182, 1, 0.9647059, 0, 1,
-1.031944, 0.0429933, -2.028189, 1, 0.972549, 0, 1,
-1.03005, 0.1266111, -1.851301, 1, 0.9764706, 0, 1,
-1.024718, 1.209659, -0.9465228, 1, 0.9843137, 0, 1,
-1.022289, -0.4468917, -1.151896, 1, 0.9882353, 0, 1,
-0.9968739, 0.9445122, -2.563447, 1, 0.9960784, 0, 1,
-0.9967721, -1.803566, -2.47314, 0.9960784, 1, 0, 1,
-0.9967652, -0.3212387, -3.047215, 0.9921569, 1, 0, 1,
-0.9961729, 0.9468725, -0.4246497, 0.9843137, 1, 0, 1,
-0.993497, 1.340239, -1.159528, 0.9803922, 1, 0, 1,
-0.9915006, -0.5701271, -1.374472, 0.972549, 1, 0, 1,
-0.9851463, 0.7326425, -0.3765758, 0.9686275, 1, 0, 1,
-0.9845405, 1.653005, -0.4616486, 0.9607843, 1, 0, 1,
-0.9810876, -0.3311634, -0.9834989, 0.9568627, 1, 0, 1,
-0.9803039, 1.029, -1.939659, 0.9490196, 1, 0, 1,
-0.9759572, 0.3328406, -0.9394349, 0.945098, 1, 0, 1,
-0.9729548, -0.538843, -2.268845, 0.9372549, 1, 0, 1,
-0.9726667, 0.1002106, 0.710107, 0.9333333, 1, 0, 1,
-0.9720192, -0.562287, -1.094705, 0.9254902, 1, 0, 1,
-0.9714956, 1.030991, 0.2278045, 0.9215686, 1, 0, 1,
-0.9565817, 0.804493, -1.554425, 0.9137255, 1, 0, 1,
-0.9464773, -1.560799, -2.555935, 0.9098039, 1, 0, 1,
-0.9440631, 1.521011, -1.175213, 0.9019608, 1, 0, 1,
-0.9427668, 1.128363, -0.8855175, 0.8941177, 1, 0, 1,
-0.9406965, -1.165648, -3.425144, 0.8901961, 1, 0, 1,
-0.9388363, 0.1709773, -1.937513, 0.8823529, 1, 0, 1,
-0.9376394, 0.1580491, -1.18102, 0.8784314, 1, 0, 1,
-0.9360276, 0.07420003, -2.356282, 0.8705882, 1, 0, 1,
-0.9225366, 0.4758443, 0.2080964, 0.8666667, 1, 0, 1,
-0.9218711, -1.110921, -1.003018, 0.8588235, 1, 0, 1,
-0.9215167, -0.4454556, -1.500119, 0.854902, 1, 0, 1,
-0.9205351, -0.5256975, -1.806832, 0.8470588, 1, 0, 1,
-0.9164409, 0.3982622, -0.160506, 0.8431373, 1, 0, 1,
-0.9158477, 2.024608, -0.9577018, 0.8352941, 1, 0, 1,
-0.9131719, 0.003970167, 0.3957076, 0.8313726, 1, 0, 1,
-0.9109282, 0.3608631, -0.7473069, 0.8235294, 1, 0, 1,
-0.9080534, 0.4034352, -0.3949651, 0.8196079, 1, 0, 1,
-0.9031953, -1.36024, -1.64882, 0.8117647, 1, 0, 1,
-0.9018642, -1.693414, -0.5475278, 0.8078431, 1, 0, 1,
-0.8999031, -0.04803886, -1.034817, 0.8, 1, 0, 1,
-0.8887176, -0.8635432, -1.912236, 0.7921569, 1, 0, 1,
-0.884208, -0.6640628, -3.759316, 0.7882353, 1, 0, 1,
-0.8831758, 0.4065726, -2.43181, 0.7803922, 1, 0, 1,
-0.8803095, 1.923804, -1.780236, 0.7764706, 1, 0, 1,
-0.8799726, 0.4007022, -2.133002, 0.7686275, 1, 0, 1,
-0.876857, -0.3234762, -2.70679, 0.7647059, 1, 0, 1,
-0.8767813, 0.2966617, -0.4003079, 0.7568628, 1, 0, 1,
-0.876087, -1.51404, -2.276239, 0.7529412, 1, 0, 1,
-0.8731967, 0.2624666, -1.072028, 0.7450981, 1, 0, 1,
-0.8642367, -0.1817589, -1.766832, 0.7411765, 1, 0, 1,
-0.8638834, 0.02776991, -0.2227613, 0.7333333, 1, 0, 1,
-0.850112, 1.384308, -0.7986158, 0.7294118, 1, 0, 1,
-0.8464717, -1.522472, -1.668689, 0.7215686, 1, 0, 1,
-0.8447858, -0.6128784, -1.754621, 0.7176471, 1, 0, 1,
-0.8330534, 0.03905929, -0.4154217, 0.7098039, 1, 0, 1,
-0.8298621, -0.002041811, -1.986467, 0.7058824, 1, 0, 1,
-0.8255802, 0.8769022, -2.566211, 0.6980392, 1, 0, 1,
-0.8248075, 0.1329399, -0.09763465, 0.6901961, 1, 0, 1,
-0.8215063, 0.1777927, -0.8387417, 0.6862745, 1, 0, 1,
-0.8177599, 0.3049964, -0.7140938, 0.6784314, 1, 0, 1,
-0.8175041, 0.8636032, 0.4107345, 0.6745098, 1, 0, 1,
-0.8171738, -0.5259973, -4.002183, 0.6666667, 1, 0, 1,
-0.8121468, 0.6603328, 0.3158475, 0.6627451, 1, 0, 1,
-0.8079264, -0.2833909, -0.5357891, 0.654902, 1, 0, 1,
-0.8014307, -0.6047309, -1.712414, 0.6509804, 1, 0, 1,
-0.7934934, 0.4710471, -1.212254, 0.6431373, 1, 0, 1,
-0.7887231, -0.3010473, -1.560406, 0.6392157, 1, 0, 1,
-0.7862284, 0.3363294, -0.46799, 0.6313726, 1, 0, 1,
-0.7851683, -1.511528, -2.736574, 0.627451, 1, 0, 1,
-0.7825317, 1.223232, -0.4156262, 0.6196079, 1, 0, 1,
-0.7809073, -0.1408109, -3.468442, 0.6156863, 1, 0, 1,
-0.7807688, 0.2619843, -0.4651276, 0.6078432, 1, 0, 1,
-0.7797179, 0.5798168, -2.480757, 0.6039216, 1, 0, 1,
-0.7777596, 0.2509638, -1.453753, 0.5960785, 1, 0, 1,
-0.7728342, 0.2601606, -0.246177, 0.5882353, 1, 0, 1,
-0.7706414, -0.5494836, -3.331205, 0.5843138, 1, 0, 1,
-0.769213, -0.3331095, -1.902906, 0.5764706, 1, 0, 1,
-0.7573732, -0.4518771, -0.7374423, 0.572549, 1, 0, 1,
-0.7568656, -0.7153518, -1.907667, 0.5647059, 1, 0, 1,
-0.7426893, -1.364053, -1.816332, 0.5607843, 1, 0, 1,
-0.7335552, 0.4359554, -3.069039, 0.5529412, 1, 0, 1,
-0.7314522, -0.5835145, -2.92061, 0.5490196, 1, 0, 1,
-0.7307798, -0.7045217, -1.380304, 0.5411765, 1, 0, 1,
-0.7246349, -0.1539225, -1.196532, 0.5372549, 1, 0, 1,
-0.7181716, 0.2237602, -1.376156, 0.5294118, 1, 0, 1,
-0.7168534, -0.8115159, -2.467847, 0.5254902, 1, 0, 1,
-0.7142833, -0.3482251, -2.714082, 0.5176471, 1, 0, 1,
-0.7131919, -0.3536786, -0.7622312, 0.5137255, 1, 0, 1,
-0.7102494, 0.9922546, -0.2613927, 0.5058824, 1, 0, 1,
-0.7076164, -1.300196, -1.314673, 0.5019608, 1, 0, 1,
-0.7021602, -1.327517, -1.893267, 0.4941176, 1, 0, 1,
-0.6937308, 0.1768698, -1.200587, 0.4862745, 1, 0, 1,
-0.6905677, 0.5389942, -0.7454369, 0.4823529, 1, 0, 1,
-0.6904985, -1.230445, -1.178704, 0.4745098, 1, 0, 1,
-0.6864768, -0.27045, -0.3253696, 0.4705882, 1, 0, 1,
-0.6860694, 0.07691811, -1.121457, 0.4627451, 1, 0, 1,
-0.6860532, 0.4005317, 0.1472601, 0.4588235, 1, 0, 1,
-0.6835546, -0.01280142, -2.242944, 0.4509804, 1, 0, 1,
-0.6831668, 1.205598, 0.2298728, 0.4470588, 1, 0, 1,
-0.6809211, 0.3464674, -1.96761, 0.4392157, 1, 0, 1,
-0.6713012, -0.006450329, -1.531146, 0.4352941, 1, 0, 1,
-0.6641519, 1.032645, -2.554374, 0.427451, 1, 0, 1,
-0.6632805, 0.5335727, 0.6213432, 0.4235294, 1, 0, 1,
-0.6607538, 0.500991, -1.47582, 0.4156863, 1, 0, 1,
-0.6549161, 0.6578549, -0.0183732, 0.4117647, 1, 0, 1,
-0.6545862, -1.102808, -2.968481, 0.4039216, 1, 0, 1,
-0.6544543, 1.059329, 1.451999, 0.3960784, 1, 0, 1,
-0.6529719, -1.094041, -3.16442, 0.3921569, 1, 0, 1,
-0.6473224, -0.8003058, -1.846026, 0.3843137, 1, 0, 1,
-0.642929, -0.8477781, -1.860312, 0.3803922, 1, 0, 1,
-0.6408252, -0.4639472, -2.903361, 0.372549, 1, 0, 1,
-0.6407245, -0.009389057, -0.7482815, 0.3686275, 1, 0, 1,
-0.6398556, -0.542062, -2.247407, 0.3607843, 1, 0, 1,
-0.6382659, 0.896203, -0.8737131, 0.3568628, 1, 0, 1,
-0.6320968, 0.8889452, -0.5202543, 0.3490196, 1, 0, 1,
-0.6256199, 0.7687932, -0.2391824, 0.345098, 1, 0, 1,
-0.623998, -0.1137777, -1.057334, 0.3372549, 1, 0, 1,
-0.6238955, -0.3215747, -1.769086, 0.3333333, 1, 0, 1,
-0.6233252, 1.204752, 0.282218, 0.3254902, 1, 0, 1,
-0.6229505, 0.592575, -2.240434, 0.3215686, 1, 0, 1,
-0.6221192, -0.3414157, -3.057132, 0.3137255, 1, 0, 1,
-0.6210201, -0.9231021, -4.756872, 0.3098039, 1, 0, 1,
-0.6193808, -1.417656, -3.006313, 0.3019608, 1, 0, 1,
-0.6190067, -0.4014011, -1.467328, 0.2941177, 1, 0, 1,
-0.6188558, -0.3631294, -1.60763, 0.2901961, 1, 0, 1,
-0.6180198, 1.463593, -0.7245135, 0.282353, 1, 0, 1,
-0.6176485, -0.6315611, -2.932001, 0.2784314, 1, 0, 1,
-0.6142828, -0.6066725, -2.814363, 0.2705882, 1, 0, 1,
-0.6140922, -0.4097535, 0.5267764, 0.2666667, 1, 0, 1,
-0.6126425, 1.091803, -1.059754, 0.2588235, 1, 0, 1,
-0.6094179, -1.193901, -3.604524, 0.254902, 1, 0, 1,
-0.6089284, -0.9122725, -1.726532, 0.2470588, 1, 0, 1,
-0.605673, -0.3862437, -2.822969, 0.2431373, 1, 0, 1,
-0.5913311, 0.6847453, -2.595942, 0.2352941, 1, 0, 1,
-0.5904728, 2.147878, 1.258175, 0.2313726, 1, 0, 1,
-0.5848656, 0.5479042, -1.509885, 0.2235294, 1, 0, 1,
-0.5752395, 1.67413, -0.8634152, 0.2196078, 1, 0, 1,
-0.5695215, -1.256024, -0.9568332, 0.2117647, 1, 0, 1,
-0.5590539, -0.5116766, -2.281748, 0.2078431, 1, 0, 1,
-0.5564958, 0.02150832, -2.098593, 0.2, 1, 0, 1,
-0.5550253, -1.654241, -2.576202, 0.1921569, 1, 0, 1,
-0.554642, -1.008431, -4.975351, 0.1882353, 1, 0, 1,
-0.549987, -0.1986071, -2.359131, 0.1803922, 1, 0, 1,
-0.5477389, -0.7461274, -3.811479, 0.1764706, 1, 0, 1,
-0.5459348, -0.6882718, -1.522122, 0.1686275, 1, 0, 1,
-0.5358794, -1.322425, -3.592539, 0.1647059, 1, 0, 1,
-0.5339713, 0.07222117, -2.281417, 0.1568628, 1, 0, 1,
-0.5330781, -0.01937444, -1.544099, 0.1529412, 1, 0, 1,
-0.5308207, 0.4266948, -2.778524, 0.145098, 1, 0, 1,
-0.5258175, -1.010941, -3.683303, 0.1411765, 1, 0, 1,
-0.5251644, 0.5158967, 0.8267215, 0.1333333, 1, 0, 1,
-0.5174666, 0.1548399, -3.136322, 0.1294118, 1, 0, 1,
-0.5151619, 0.7810717, -0.05272456, 0.1215686, 1, 0, 1,
-0.5113258, -0.8708824, -0.8903251, 0.1176471, 1, 0, 1,
-0.5074679, 0.6578906, -1.360692, 0.1098039, 1, 0, 1,
-0.507172, 0.9351157, -0.5623615, 0.1058824, 1, 0, 1,
-0.5065694, 0.5516578, -0.8553643, 0.09803922, 1, 0, 1,
-0.5059257, -0.6115056, -2.867924, 0.09019608, 1, 0, 1,
-0.5019755, -1.379498, -2.150835, 0.08627451, 1, 0, 1,
-0.4990744, -0.4265293, -3.095221, 0.07843138, 1, 0, 1,
-0.4981425, 1.863284, 1.269668, 0.07450981, 1, 0, 1,
-0.4950526, -0.0541678, -1.071611, 0.06666667, 1, 0, 1,
-0.492596, -0.3106627, -2.058684, 0.0627451, 1, 0, 1,
-0.4900789, -2.765054, -3.094416, 0.05490196, 1, 0, 1,
-0.4883574, -1.552838, -2.707187, 0.05098039, 1, 0, 1,
-0.4851342, 0.04761123, -2.556145, 0.04313726, 1, 0, 1,
-0.4835184, 0.3226289, -1.062666, 0.03921569, 1, 0, 1,
-0.4813825, 0.3059287, -0.6191002, 0.03137255, 1, 0, 1,
-0.4791506, -0.7622901, -2.282681, 0.02745098, 1, 0, 1,
-0.4699588, -0.1205103, -0.543225, 0.01960784, 1, 0, 1,
-0.4676029, -1.787326, -0.9802377, 0.01568628, 1, 0, 1,
-0.465006, -0.7932438, -3.065556, 0.007843138, 1, 0, 1,
-0.4612522, -0.6304141, -2.796252, 0.003921569, 1, 0, 1,
-0.458531, 0.8924775, -2.190394, 0, 1, 0.003921569, 1,
-0.4584727, 0.8653014, -0.5277328, 0, 1, 0.01176471, 1,
-0.4568138, 0.6471925, -0.2715089, 0, 1, 0.01568628, 1,
-0.452149, -3.142764, -4.93703, 0, 1, 0.02352941, 1,
-0.4480965, -1.222291, -2.785517, 0, 1, 0.02745098, 1,
-0.4462011, 0.1933118, -1.564649, 0, 1, 0.03529412, 1,
-0.4454594, -0.6670638, -3.721051, 0, 1, 0.03921569, 1,
-0.4424147, -0.001578965, -2.744192, 0, 1, 0.04705882, 1,
-0.4374754, 0.4061722, -1.903542, 0, 1, 0.05098039, 1,
-0.4298882, 1.012926, 0.1771623, 0, 1, 0.05882353, 1,
-0.4219569, 1.150208, -1.615124, 0, 1, 0.0627451, 1,
-0.4192156, 1.909655, -0.2481994, 0, 1, 0.07058824, 1,
-0.4179825, -0.9666806, -1.349395, 0, 1, 0.07450981, 1,
-0.4170347, -2.085388, -3.00399, 0, 1, 0.08235294, 1,
-0.4166795, -0.7211754, -3.648269, 0, 1, 0.08627451, 1,
-0.4151854, 1.552288, 2.593961, 0, 1, 0.09411765, 1,
-0.4119719, 0.3286853, -0.008078747, 0, 1, 0.1019608, 1,
-0.4083662, 0.9152113, 0.9941506, 0, 1, 0.1058824, 1,
-0.4074024, -1.036913, -3.280267, 0, 1, 0.1137255, 1,
-0.4039516, -0.6872508, -2.406858, 0, 1, 0.1176471, 1,
-0.3998689, 0.4872961, -0.2267078, 0, 1, 0.1254902, 1,
-0.3931115, -0.4572888, 0.4954779, 0, 1, 0.1294118, 1,
-0.3925141, -0.8542475, -4.93206, 0, 1, 0.1372549, 1,
-0.3913543, 0.7941436, -0.3372854, 0, 1, 0.1411765, 1,
-0.391016, 0.05397071, -2.542244, 0, 1, 0.1490196, 1,
-0.3891532, 0.1446773, -1.552362, 0, 1, 0.1529412, 1,
-0.3854691, -0.2980777, -1.764906, 0, 1, 0.1607843, 1,
-0.3796166, 0.1320131, -2.096273, 0, 1, 0.1647059, 1,
-0.3771818, -1.863992, -2.517021, 0, 1, 0.172549, 1,
-0.377052, -2.459314, -3.602185, 0, 1, 0.1764706, 1,
-0.3742625, -0.5625907, -3.799597, 0, 1, 0.1843137, 1,
-0.3702203, -1.925669, -3.051881, 0, 1, 0.1882353, 1,
-0.3693923, -0.1123786, -1.717799, 0, 1, 0.1960784, 1,
-0.3689542, -1.471148, -3.689808, 0, 1, 0.2039216, 1,
-0.3664816, -1.303463, -0.5609015, 0, 1, 0.2078431, 1,
-0.359591, 1.028187, 1.112114, 0, 1, 0.2156863, 1,
-0.3575986, -0.3482735, -2.808714, 0, 1, 0.2196078, 1,
-0.3555484, 1.135053, -1.587497, 0, 1, 0.227451, 1,
-0.3550062, -0.2748738, -4.287941, 0, 1, 0.2313726, 1,
-0.3533426, -1.365195, -4.059618, 0, 1, 0.2392157, 1,
-0.351786, 1.112718, 0.5233484, 0, 1, 0.2431373, 1,
-0.3514439, -0.8272692, -1.903796, 0, 1, 0.2509804, 1,
-0.3465691, -0.1477772, -1.434965, 0, 1, 0.254902, 1,
-0.3461762, 1.278715, -0.09866179, 0, 1, 0.2627451, 1,
-0.3459027, 0.8040944, 1.32088, 0, 1, 0.2666667, 1,
-0.341361, 0.08381313, -2.092013, 0, 1, 0.2745098, 1,
-0.3385468, 0.9582133, 0.7990754, 0, 1, 0.2784314, 1,
-0.3337622, 0.6858603, -1.255986, 0, 1, 0.2862745, 1,
-0.3282619, 1.029421, -0.8566121, 0, 1, 0.2901961, 1,
-0.321733, 0.9389092, 0.3194323, 0, 1, 0.2980392, 1,
-0.3200464, 0.3789945, -0.8296548, 0, 1, 0.3058824, 1,
-0.315669, -0.4797207, -2.148896, 0, 1, 0.3098039, 1,
-0.3052327, -1.058923, -3.237435, 0, 1, 0.3176471, 1,
-0.3021809, -0.7693967, -1.198529, 0, 1, 0.3215686, 1,
-0.3006023, -0.08350259, -2.974338, 0, 1, 0.3294118, 1,
-0.2967685, -1.966258, -4.366735, 0, 1, 0.3333333, 1,
-0.2953214, -0.6760606, -2.753402, 0, 1, 0.3411765, 1,
-0.2879808, 1.408097, -0.6665375, 0, 1, 0.345098, 1,
-0.2875361, -1.307311, -2.306063, 0, 1, 0.3529412, 1,
-0.2854387, 0.8357393, 0.8034227, 0, 1, 0.3568628, 1,
-0.2850046, 0.4265461, 0.8988821, 0, 1, 0.3647059, 1,
-0.2841265, -0.2452304, -2.70951, 0, 1, 0.3686275, 1,
-0.281731, 0.6571591, -1.245992, 0, 1, 0.3764706, 1,
-0.2801079, 0.9075078, -0.3356967, 0, 1, 0.3803922, 1,
-0.2705382, -3.404184, -2.464421, 0, 1, 0.3882353, 1,
-0.2693256, 1.123899, -0.9990278, 0, 1, 0.3921569, 1,
-0.2671997, 0.7135158, -1.756447, 0, 1, 0.4, 1,
-0.2643495, 1.03303, -0.4104536, 0, 1, 0.4078431, 1,
-0.2609399, -0.6094909, -2.209906, 0, 1, 0.4117647, 1,
-0.256738, 1.210881, 0.9437509, 0, 1, 0.4196078, 1,
-0.2549381, 0.9687586, 1.07173, 0, 1, 0.4235294, 1,
-0.2533732, -0.3192677, -2.105703, 0, 1, 0.4313726, 1,
-0.2509227, -0.4871081, -1.573629, 0, 1, 0.4352941, 1,
-0.2504728, -0.714245, -1.615691, 0, 1, 0.4431373, 1,
-0.2473043, -0.5082098, -1.702676, 0, 1, 0.4470588, 1,
-0.2442554, 0.9560182, -0.03795822, 0, 1, 0.454902, 1,
-0.2418963, -0.5024783, -2.774236, 0, 1, 0.4588235, 1,
-0.2296653, 1.215765, -0.2139446, 0, 1, 0.4666667, 1,
-0.2271235, -0.5004506, -3.351306, 0, 1, 0.4705882, 1,
-0.2262214, 0.5636202, 0.3190588, 0, 1, 0.4784314, 1,
-0.2241337, -0.1231718, -2.999281, 0, 1, 0.4823529, 1,
-0.2221851, 0.3785558, -0.4977902, 0, 1, 0.4901961, 1,
-0.2197543, 0.1324149, -2.472054, 0, 1, 0.4941176, 1,
-0.2160126, -0.8304149, -3.213442, 0, 1, 0.5019608, 1,
-0.2143956, 0.954879, -1.117482, 0, 1, 0.509804, 1,
-0.2142209, -0.02770851, -1.535226, 0, 1, 0.5137255, 1,
-0.2115354, 0.7442178, 1.771481, 0, 1, 0.5215687, 1,
-0.2074715, -0.7913406, -3.640914, 0, 1, 0.5254902, 1,
-0.2037301, 0.2592389, -0.2743532, 0, 1, 0.5333334, 1,
-0.2000671, 1.46306, -0.8946152, 0, 1, 0.5372549, 1,
-0.1987765, -0.5050631, -0.6335316, 0, 1, 0.5450981, 1,
-0.1986953, -1.361416, -3.807509, 0, 1, 0.5490196, 1,
-0.1969481, 1.167144, -1.013357, 0, 1, 0.5568628, 1,
-0.1934763, -0.9197514, -2.361298, 0, 1, 0.5607843, 1,
-0.1925891, -0.1039428, -2.397095, 0, 1, 0.5686275, 1,
-0.1920713, 0.72435, 0.3073379, 0, 1, 0.572549, 1,
-0.1895722, -0.2099308, -0.7198468, 0, 1, 0.5803922, 1,
-0.1856562, 0.6463242, -1.250676, 0, 1, 0.5843138, 1,
-0.1837439, -1.811795, -4.31873, 0, 1, 0.5921569, 1,
-0.183708, 0.4238262, -0.731055, 0, 1, 0.5960785, 1,
-0.1823273, -0.7920732, -2.564589, 0, 1, 0.6039216, 1,
-0.1763161, 1.346225, -0.1564499, 0, 1, 0.6117647, 1,
-0.1732953, 0.5918695, 1.008738, 0, 1, 0.6156863, 1,
-0.1721645, -0.2369747, -3.663031, 0, 1, 0.6235294, 1,
-0.17052, -0.2739804, -1.395985, 0, 1, 0.627451, 1,
-0.169617, 1.028968, -0.4112739, 0, 1, 0.6352941, 1,
-0.1658443, -0.2679244, -2.694327, 0, 1, 0.6392157, 1,
-0.1637389, -1.89572, -2.90296, 0, 1, 0.6470588, 1,
-0.1629833, 0.3209697, 0.5354839, 0, 1, 0.6509804, 1,
-0.1609687, 0.6080142, -0.3593554, 0, 1, 0.6588235, 1,
-0.1562997, 1.088899, 0.01024229, 0, 1, 0.6627451, 1,
-0.1547421, 0.4724809, 0.2556535, 0, 1, 0.6705883, 1,
-0.1547261, -0.597444, -5.701084, 0, 1, 0.6745098, 1,
-0.1538088, 2.086002, -0.7070621, 0, 1, 0.682353, 1,
-0.1529951, -0.4226329, -0.07836861, 0, 1, 0.6862745, 1,
-0.1519931, -1.036931, -2.912371, 0, 1, 0.6941177, 1,
-0.1463487, 0.5382453, -0.3827698, 0, 1, 0.7019608, 1,
-0.1367574, -0.3144221, -3.272482, 0, 1, 0.7058824, 1,
-0.1282954, 1.878025, -1.934052, 0, 1, 0.7137255, 1,
-0.1282183, 0.9399632, 0.1741367, 0, 1, 0.7176471, 1,
-0.1269228, -0.1051254, -2.944868, 0, 1, 0.7254902, 1,
-0.126293, 0.4978982, -0.4747224, 0, 1, 0.7294118, 1,
-0.1258599, -0.9372702, -4.473369, 0, 1, 0.7372549, 1,
-0.1249639, -0.6881073, -3.863376, 0, 1, 0.7411765, 1,
-0.1245202, -1.912315, -3.685006, 0, 1, 0.7490196, 1,
-0.1196949, -0.08950901, -1.770491, 0, 1, 0.7529412, 1,
-0.1146672, 0.354184, -0.7818756, 0, 1, 0.7607843, 1,
-0.1142408, 1.188171, -1.112193, 0, 1, 0.7647059, 1,
-0.1129663, -1.22716, -1.999169, 0, 1, 0.772549, 1,
-0.1112866, 0.5029687, 0.1399675, 0, 1, 0.7764706, 1,
-0.1108098, 1.062164, 1.594837, 0, 1, 0.7843137, 1,
-0.1055797, -0.002150112, -1.191163, 0, 1, 0.7882353, 1,
-0.1049557, 0.1251915, -0.7103351, 0, 1, 0.7960784, 1,
-0.1026079, -1.072243, -2.817262, 0, 1, 0.8039216, 1,
-0.09946018, 1.563262, 1.703892, 0, 1, 0.8078431, 1,
-0.09606377, -0.1701647, -2.842552, 0, 1, 0.8156863, 1,
-0.09511039, 0.8694054, -0.9094781, 0, 1, 0.8196079, 1,
-0.09330802, 0.1934763, 0.007246051, 0, 1, 0.827451, 1,
-0.09273754, 1.160537, -0.9187446, 0, 1, 0.8313726, 1,
-0.0926028, -0.822978, -0.9994875, 0, 1, 0.8392157, 1,
-0.08995051, -0.2884619, -3.157058, 0, 1, 0.8431373, 1,
-0.08909827, -0.2772031, -3.396778, 0, 1, 0.8509804, 1,
-0.08023614, -0.7168478, -0.9772794, 0, 1, 0.854902, 1,
-0.07683533, -1.693961, -2.107562, 0, 1, 0.8627451, 1,
-0.07212612, -1.028554, -3.619551, 0, 1, 0.8666667, 1,
-0.06726611, -0.262301, -1.411078, 0, 1, 0.8745098, 1,
-0.06135283, 0.7238798, -1.61518, 0, 1, 0.8784314, 1,
-0.05723977, 0.1800943, -0.01912077, 0, 1, 0.8862745, 1,
-0.0556169, 1.214964, 0.2784327, 0, 1, 0.8901961, 1,
-0.05311056, 0.07352658, -0.9496887, 0, 1, 0.8980392, 1,
-0.05267508, 0.08943301, -0.5530333, 0, 1, 0.9058824, 1,
-0.05118055, -0.2198139, -3.875463, 0, 1, 0.9098039, 1,
-0.04959792, -1.860893, -1.916859, 0, 1, 0.9176471, 1,
-0.04941224, 0.1689342, -0.1716706, 0, 1, 0.9215686, 1,
-0.04661147, -0.3764218, -1.799454, 0, 1, 0.9294118, 1,
-0.04473614, 0.6849901, -0.4893351, 0, 1, 0.9333333, 1,
-0.04404533, 0.3544165, 1.034367, 0, 1, 0.9411765, 1,
-0.04051543, -1.337814, -2.126721, 0, 1, 0.945098, 1,
-0.03907773, -0.4743953, -1.577148, 0, 1, 0.9529412, 1,
-0.03741551, -0.5933509, -4.416026, 0, 1, 0.9568627, 1,
-0.0371753, 1.023898, 1.178743, 0, 1, 0.9647059, 1,
-0.03320025, 0.8733771, -2.094111, 0, 1, 0.9686275, 1,
-0.03130344, 0.07669895, -0.8834412, 0, 1, 0.9764706, 1,
-0.02796959, -0.5027732, -3.618846, 0, 1, 0.9803922, 1,
-0.02559223, -1.823719, -2.364341, 0, 1, 0.9882353, 1,
-0.02227742, 1.560726, -0.3430125, 0, 1, 0.9921569, 1,
-0.01836977, -0.5662357, -3.179673, 0, 1, 1, 1,
-0.01805351, -2.098469, -3.760853, 0, 0.9921569, 1, 1,
-0.003013015, 1.341227, -0.5728024, 0, 0.9882353, 1, 1,
-0.002817224, 0.8933808, 0.7686194, 0, 0.9803922, 1, 1,
-0.001792945, 0.6103396, -2.257638, 0, 0.9764706, 1, 1,
0.007070485, 0.3978795, 0.7871973, 0, 0.9686275, 1, 1,
0.009779765, -0.1426154, 2.964525, 0, 0.9647059, 1, 1,
0.01105617, 0.7126334, -2.305338, 0, 0.9568627, 1, 1,
0.01583116, -1.236795, 2.842901, 0, 0.9529412, 1, 1,
0.01599752, 1.970057, -1.175333, 0, 0.945098, 1, 1,
0.0200143, 0.138573, -0.8616348, 0, 0.9411765, 1, 1,
0.02745908, -0.7539126, 3.092194, 0, 0.9333333, 1, 1,
0.03022207, -0.6268284, 2.975829, 0, 0.9294118, 1, 1,
0.0311658, -1.564927, 3.021799, 0, 0.9215686, 1, 1,
0.03564254, 0.8814805, 0.3254707, 0, 0.9176471, 1, 1,
0.03887487, -1.524267, 2.021137, 0, 0.9098039, 1, 1,
0.04077693, 2.655751, -0.08857282, 0, 0.9058824, 1, 1,
0.04791415, 1.401221, -0.1838173, 0, 0.8980392, 1, 1,
0.05078661, -0.227887, 2.159304, 0, 0.8901961, 1, 1,
0.05247515, 1.658024, -0.4787813, 0, 0.8862745, 1, 1,
0.05290509, -2.245208, 2.04857, 0, 0.8784314, 1, 1,
0.05397596, -1.748142, 5.752755, 0, 0.8745098, 1, 1,
0.05878325, -0.5702833, 2.583951, 0, 0.8666667, 1, 1,
0.06252543, 1.248364, -0.06461794, 0, 0.8627451, 1, 1,
0.0659245, -1.268523, 4.066051, 0, 0.854902, 1, 1,
0.0662837, 1.326488, -0.3647701, 0, 0.8509804, 1, 1,
0.06729304, -1.715886, 2.858641, 0, 0.8431373, 1, 1,
0.07016916, -0.8302839, 3.931949, 0, 0.8392157, 1, 1,
0.07139532, -0.8135011, 3.382744, 0, 0.8313726, 1, 1,
0.07341089, 0.4094068, 1.015248, 0, 0.827451, 1, 1,
0.07370242, 0.1351656, -1.585944, 0, 0.8196079, 1, 1,
0.07383177, -0.6326195, 3.389374, 0, 0.8156863, 1, 1,
0.07394375, -0.4484689, 4.325894, 0, 0.8078431, 1, 1,
0.07646168, -1.488362, 2.846074, 0, 0.8039216, 1, 1,
0.0769047, 0.03684241, 2.221582, 0, 0.7960784, 1, 1,
0.07909332, 0.5936664, -0.2834841, 0, 0.7882353, 1, 1,
0.0795183, -1.271196, 2.794608, 0, 0.7843137, 1, 1,
0.08341612, 0.06748549, 1.957352, 0, 0.7764706, 1, 1,
0.08497225, 1.450199, -1.273389, 0, 0.772549, 1, 1,
0.08528062, -0.8389018, 2.048326, 0, 0.7647059, 1, 1,
0.08595542, -0.1158766, 3.239366, 0, 0.7607843, 1, 1,
0.08659434, 0.605311, -0.2637284, 0, 0.7529412, 1, 1,
0.08779843, -1.463795, 4.264898, 0, 0.7490196, 1, 1,
0.09386503, -0.1802857, 2.870855, 0, 0.7411765, 1, 1,
0.09427101, -0.8351292, 3.749141, 0, 0.7372549, 1, 1,
0.09454691, 1.062508, -0.1245664, 0, 0.7294118, 1, 1,
0.09804729, -0.6445808, 1.86902, 0, 0.7254902, 1, 1,
0.09839904, 1.156952, -0.3821681, 0, 0.7176471, 1, 1,
0.09999492, -0.46437, 1.627628, 0, 0.7137255, 1, 1,
0.101882, 0.8677883, 0.7819552, 0, 0.7058824, 1, 1,
0.1021423, 0.3844008, -0.573157, 0, 0.6980392, 1, 1,
0.1052167, 0.7633207, 1.500092, 0, 0.6941177, 1, 1,
0.1065342, -0.1256487, 0.8056617, 0, 0.6862745, 1, 1,
0.1096873, 0.9508218, 0.5357521, 0, 0.682353, 1, 1,
0.113147, -1.142529, 1.388045, 0, 0.6745098, 1, 1,
0.1204977, 0.8335031, -1.350716, 0, 0.6705883, 1, 1,
0.1207048, -1.200449, 2.65955, 0, 0.6627451, 1, 1,
0.1272737, -2.985935, 3.874956, 0, 0.6588235, 1, 1,
0.1289186, -0.4032431, 0.146727, 0, 0.6509804, 1, 1,
0.1357215, -0.1136267, 1.828398, 0, 0.6470588, 1, 1,
0.1362989, -0.5036859, 4.137388, 0, 0.6392157, 1, 1,
0.140311, 1.36536, -0.05149835, 0, 0.6352941, 1, 1,
0.1430497, -0.2951581, 3.21224, 0, 0.627451, 1, 1,
0.1465089, -0.6045595, 3.374243, 0, 0.6235294, 1, 1,
0.1481143, -0.4832726, 1.783486, 0, 0.6156863, 1, 1,
0.1514225, -0.9192778, 4.646485, 0, 0.6117647, 1, 1,
0.1524431, -1.400023, 3.05929, 0, 0.6039216, 1, 1,
0.1567113, 1.574937, -1.263229, 0, 0.5960785, 1, 1,
0.1572787, -0.7289012, 1.992288, 0, 0.5921569, 1, 1,
0.1579156, -1.197121, 3.16348, 0, 0.5843138, 1, 1,
0.1615202, -0.5652121, 4.549427, 0, 0.5803922, 1, 1,
0.1660125, 0.5899332, 0.4382793, 0, 0.572549, 1, 1,
0.1729712, 0.3271954, 0.9070511, 0, 0.5686275, 1, 1,
0.1763314, 0.03450749, 2.077032, 0, 0.5607843, 1, 1,
0.1778375, 0.1819888, 2.741088, 0, 0.5568628, 1, 1,
0.1786856, 0.1877246, 2.754056, 0, 0.5490196, 1, 1,
0.1791895, -0.01229227, 0.7648348, 0, 0.5450981, 1, 1,
0.18137, 1.101875, 0.7829335, 0, 0.5372549, 1, 1,
0.1818315, 0.6654717, -0.4678046, 0, 0.5333334, 1, 1,
0.1861291, 0.650333, 0.7365994, 0, 0.5254902, 1, 1,
0.190192, 0.7920248, 0.3596953, 0, 0.5215687, 1, 1,
0.1935135, -0.229231, 1.758436, 0, 0.5137255, 1, 1,
0.198294, -1.324875, 2.377187, 0, 0.509804, 1, 1,
0.1995039, -0.3639381, 2.14728, 0, 0.5019608, 1, 1,
0.2133262, 0.1522238, 0.9598755, 0, 0.4941176, 1, 1,
0.2141252, 1.006693, -0.810488, 0, 0.4901961, 1, 1,
0.2141376, 0.4099018, 0.264661, 0, 0.4823529, 1, 1,
0.2221892, 0.1300721, 1.696992, 0, 0.4784314, 1, 1,
0.2272458, 0.1098084, 1.416727, 0, 0.4705882, 1, 1,
0.2274873, 1.835466, -0.3823151, 0, 0.4666667, 1, 1,
0.2313481, 1.346192, 1.149925, 0, 0.4588235, 1, 1,
0.2368512, 1.969352, -0.2282777, 0, 0.454902, 1, 1,
0.2373256, -1.960413, 3.821631, 0, 0.4470588, 1, 1,
0.2377155, -0.1379418, 1.986095, 0, 0.4431373, 1, 1,
0.238196, -0.08454118, 1.22392, 0, 0.4352941, 1, 1,
0.2410109, 0.8955579, -0.1295143, 0, 0.4313726, 1, 1,
0.2432808, 1.003563, 0.1851516, 0, 0.4235294, 1, 1,
0.2443468, -0.5336251, 2.424879, 0, 0.4196078, 1, 1,
0.2447429, -2.092706, 3.594908, 0, 0.4117647, 1, 1,
0.2498509, -1.304603, 1.839668, 0, 0.4078431, 1, 1,
0.2506551, -0.3767667, 3.455925, 0, 0.4, 1, 1,
0.2522289, 0.2913407, 1.615768, 0, 0.3921569, 1, 1,
0.256194, -3.174963, 3.406762, 0, 0.3882353, 1, 1,
0.2586335, 0.686001, 0.4352794, 0, 0.3803922, 1, 1,
0.2628574, 0.6643357, 2.386803, 0, 0.3764706, 1, 1,
0.2630106, 0.2840597, 0.6421081, 0, 0.3686275, 1, 1,
0.2648313, -0.5395352, 1.494186, 0, 0.3647059, 1, 1,
0.2651332, -0.1257363, 3.009122, 0, 0.3568628, 1, 1,
0.2735028, 2.327854, 0.03625983, 0, 0.3529412, 1, 1,
0.2749833, 0.6911353, 0.2416819, 0, 0.345098, 1, 1,
0.2809129, -1.153972, 2.249941, 0, 0.3411765, 1, 1,
0.2829599, 0.6002352, 0.1491112, 0, 0.3333333, 1, 1,
0.289291, -1.119323, 2.278774, 0, 0.3294118, 1, 1,
0.2946116, -0.9885828, 1.586794, 0, 0.3215686, 1, 1,
0.2999748, -0.7827653, 1.297995, 0, 0.3176471, 1, 1,
0.3014746, -1.109267, 2.703227, 0, 0.3098039, 1, 1,
0.3014984, 0.2507249, 0.763342, 0, 0.3058824, 1, 1,
0.3033336, -0.7290574, 5.193305, 0, 0.2980392, 1, 1,
0.3043212, -0.6034498, 2.44199, 0, 0.2901961, 1, 1,
0.3044768, -1.502115, 2.037826, 0, 0.2862745, 1, 1,
0.3045329, 0.5401286, 1.07421, 0, 0.2784314, 1, 1,
0.3075087, -1.08289, 2.802611, 0, 0.2745098, 1, 1,
0.3118136, 0.9857979, -0.5111611, 0, 0.2666667, 1, 1,
0.3135829, 0.9972591, -0.3556576, 0, 0.2627451, 1, 1,
0.3148925, -0.5912721, 3.568798, 0, 0.254902, 1, 1,
0.3177779, -1.968116, 2.43628, 0, 0.2509804, 1, 1,
0.3209896, 0.8220094, -1.085375, 0, 0.2431373, 1, 1,
0.3234098, -0.3032686, 2.503316, 0, 0.2392157, 1, 1,
0.3243468, 0.1218274, -0.2813106, 0, 0.2313726, 1, 1,
0.3270995, -0.3498538, 4.395938, 0, 0.227451, 1, 1,
0.3306351, 1.477883, -1.083169, 0, 0.2196078, 1, 1,
0.3325399, 0.7578509, -0.4358481, 0, 0.2156863, 1, 1,
0.3333602, 1.370996, -0.07036287, 0, 0.2078431, 1, 1,
0.3355375, 0.5282722, 0.7513497, 0, 0.2039216, 1, 1,
0.337747, 0.3565452, 0.6160758, 0, 0.1960784, 1, 1,
0.3426944, 1.382323, -0.4417376, 0, 0.1882353, 1, 1,
0.3456447, 1.378295, 0.3961461, 0, 0.1843137, 1, 1,
0.3479366, -0.2710405, 3.139887, 0, 0.1764706, 1, 1,
0.3480788, -1.160969, 3.058465, 0, 0.172549, 1, 1,
0.3507423, -0.55771, 3.463852, 0, 0.1647059, 1, 1,
0.3527524, 0.4442057, 1.564324, 0, 0.1607843, 1, 1,
0.3540976, 1.060191, -1.149708, 0, 0.1529412, 1, 1,
0.3552655, -1.648776, 4.162029, 0, 0.1490196, 1, 1,
0.3574976, -1.479791, 4.03772, 0, 0.1411765, 1, 1,
0.3582861, 0.6485984, -0.6846672, 0, 0.1372549, 1, 1,
0.3619827, 0.257592, 1.253026, 0, 0.1294118, 1, 1,
0.3639927, -0.9506024, 2.452925, 0, 0.1254902, 1, 1,
0.3643802, 0.509914, 1.041778, 0, 0.1176471, 1, 1,
0.3656358, 2.132558, -0.9115247, 0, 0.1137255, 1, 1,
0.3687458, 0.1818071, 2.852504, 0, 0.1058824, 1, 1,
0.3735123, 0.7602798, 1.912445, 0, 0.09803922, 1, 1,
0.3753477, 0.9933139, 0.557084, 0, 0.09411765, 1, 1,
0.3763759, -0.3967988, 3.001228, 0, 0.08627451, 1, 1,
0.379005, 0.5306101, 2.695532, 0, 0.08235294, 1, 1,
0.3815417, 2.602092, 0.2010815, 0, 0.07450981, 1, 1,
0.3842026, -0.5482719, 1.987028, 0, 0.07058824, 1, 1,
0.384676, -0.8535049, 3.944722, 0, 0.0627451, 1, 1,
0.384999, -1.233335, 3.517097, 0, 0.05882353, 1, 1,
0.3864351, 1.674545, 0.1227921, 0, 0.05098039, 1, 1,
0.3905651, 0.8563508, 1.447287, 0, 0.04705882, 1, 1,
0.3920415, 1.64524, 1.18543, 0, 0.03921569, 1, 1,
0.392834, 0.1878477, 1.914718, 0, 0.03529412, 1, 1,
0.3954138, -0.1308457, 2.178885, 0, 0.02745098, 1, 1,
0.3967077, -0.2443388, 1.840106, 0, 0.02352941, 1, 1,
0.3986305, -0.05298204, 1.786531, 0, 0.01568628, 1, 1,
0.3990602, -0.205859, 2.696943, 0, 0.01176471, 1, 1,
0.4011702, -0.1175055, 1.85697, 0, 0.003921569, 1, 1,
0.4012801, -1.081567, 2.827203, 0.003921569, 0, 1, 1,
0.4042743, 0.6977679, -0.4326198, 0.007843138, 0, 1, 1,
0.4044628, 0.9463795, -0.9481845, 0.01568628, 0, 1, 1,
0.4054858, 0.9005956, 1.724105, 0.01960784, 0, 1, 1,
0.4091441, 1.043031, 0.7327476, 0.02745098, 0, 1, 1,
0.4117874, 0.01416213, 1.1598, 0.03137255, 0, 1, 1,
0.4126427, 0.3528813, -0.7134643, 0.03921569, 0, 1, 1,
0.4130036, 1.499837, 0.256881, 0.04313726, 0, 1, 1,
0.4134265, -1.365071, 3.405062, 0.05098039, 0, 1, 1,
0.4162479, -0.5402839, 1.686418, 0.05490196, 0, 1, 1,
0.4218006, -1.594846, 1.596852, 0.0627451, 0, 1, 1,
0.4228783, -0.3104098, 3.525308, 0.06666667, 0, 1, 1,
0.4258894, -0.05237927, 0.7872021, 0.07450981, 0, 1, 1,
0.4263463, 1.104532, -1.658642, 0.07843138, 0, 1, 1,
0.428792, 0.2026598, 2.679562, 0.08627451, 0, 1, 1,
0.429026, -0.2271276, 1.981782, 0.09019608, 0, 1, 1,
0.4301408, -0.638328, 1.743536, 0.09803922, 0, 1, 1,
0.4336427, -0.3973783, 1.039503, 0.1058824, 0, 1, 1,
0.4340841, -0.3978317, -0.1601726, 0.1098039, 0, 1, 1,
0.4389288, -0.2678361, 1.72459, 0.1176471, 0, 1, 1,
0.4393486, 0.30336, 0.6094382, 0.1215686, 0, 1, 1,
0.4423118, 0.09826387, 0.5317996, 0.1294118, 0, 1, 1,
0.4530374, -0.9339026, 1.172125, 0.1333333, 0, 1, 1,
0.4564963, 0.709725, 2.268795, 0.1411765, 0, 1, 1,
0.458295, -0.06137254, 1.164142, 0.145098, 0, 1, 1,
0.4603168, 0.2999969, 2.268293, 0.1529412, 0, 1, 1,
0.471083, 0.09324824, 1.60849, 0.1568628, 0, 1, 1,
0.4796519, -0.2721159, 2.053907, 0.1647059, 0, 1, 1,
0.4803582, 0.4357995, -0.01887405, 0.1686275, 0, 1, 1,
0.4820129, 0.7108988, 1.622941, 0.1764706, 0, 1, 1,
0.486081, 0.8299718, -0.3573808, 0.1803922, 0, 1, 1,
0.4882473, -1.126424, 2.193172, 0.1882353, 0, 1, 1,
0.4905646, -0.3802125, 3.402002, 0.1921569, 0, 1, 1,
0.4916589, 0.08068331, 0.8286753, 0.2, 0, 1, 1,
0.4937603, -0.6494606, 1.097778, 0.2078431, 0, 1, 1,
0.4944133, -0.6118903, 1.606281, 0.2117647, 0, 1, 1,
0.4981546, 0.2384197, 1.755903, 0.2196078, 0, 1, 1,
0.5054443, 1.267933, -0.932464, 0.2235294, 0, 1, 1,
0.5059296, -0.03903423, 0.8925122, 0.2313726, 0, 1, 1,
0.5303645, 0.1412503, 0.8234702, 0.2352941, 0, 1, 1,
0.5305625, 0.009236454, 1.184799, 0.2431373, 0, 1, 1,
0.5307665, 0.2693226, 0.8953218, 0.2470588, 0, 1, 1,
0.5359451, 1.547349, 0.01680432, 0.254902, 0, 1, 1,
0.5363681, 1.277854, 1.686826, 0.2588235, 0, 1, 1,
0.5374099, -1.3344, 2.156419, 0.2666667, 0, 1, 1,
0.5403728, 0.6861662, 0.6538377, 0.2705882, 0, 1, 1,
0.5405768, -1.202133, 3.425908, 0.2784314, 0, 1, 1,
0.5479218, 1.280883, 3.593688, 0.282353, 0, 1, 1,
0.5486668, -0.3327986, 2.739206, 0.2901961, 0, 1, 1,
0.5547754, -2.013538, 4.663265, 0.2941177, 0, 1, 1,
0.5564364, -1.439068, 1.356157, 0.3019608, 0, 1, 1,
0.5653033, -0.4659639, 2.306381, 0.3098039, 0, 1, 1,
0.5657316, -0.4077883, 3.616663, 0.3137255, 0, 1, 1,
0.5702553, -0.6340827, 2.56528, 0.3215686, 0, 1, 1,
0.5718192, 1.746158, 0.5055752, 0.3254902, 0, 1, 1,
0.5778918, 2.606358, 0.762666, 0.3333333, 0, 1, 1,
0.580951, -1.018076, 3.340788, 0.3372549, 0, 1, 1,
0.5830227, 0.8665904, 1.486923, 0.345098, 0, 1, 1,
0.5861552, -0.7697046, 2.948693, 0.3490196, 0, 1, 1,
0.5876606, 0.2362326, 1.617069, 0.3568628, 0, 1, 1,
0.5892703, 1.359497, 0.7624883, 0.3607843, 0, 1, 1,
0.5972405, -1.400322, 2.473652, 0.3686275, 0, 1, 1,
0.5988189, -0.3005111, 1.969668, 0.372549, 0, 1, 1,
0.6011497, 2.247766, 0.7655097, 0.3803922, 0, 1, 1,
0.6035491, -0.270151, 2.05185, 0.3843137, 0, 1, 1,
0.6062639, 0.538473, 1.043462, 0.3921569, 0, 1, 1,
0.6177882, 0.5972019, -0.4572039, 0.3960784, 0, 1, 1,
0.617814, -0.2024437, 1.654684, 0.4039216, 0, 1, 1,
0.6181098, 0.4025421, -0.6605344, 0.4117647, 0, 1, 1,
0.6204759, 0.3591529, 0.4449392, 0.4156863, 0, 1, 1,
0.6431913, -2.45497, 3.173988, 0.4235294, 0, 1, 1,
0.6440018, -1.450911, 3.667501, 0.427451, 0, 1, 1,
0.6569434, -0.9298576, 1.184772, 0.4352941, 0, 1, 1,
0.6624641, 0.7977924, 0.1738646, 0.4392157, 0, 1, 1,
0.6653594, 0.7850704, -1.131421, 0.4470588, 0, 1, 1,
0.6664424, 0.9696995, -0.660435, 0.4509804, 0, 1, 1,
0.6748423, 0.2843162, 0.4418461, 0.4588235, 0, 1, 1,
0.6793305, -0.5029655, 1.360185, 0.4627451, 0, 1, 1,
0.6817458, -0.8983861, 2.894172, 0.4705882, 0, 1, 1,
0.6843181, 1.567961, 0.09156387, 0.4745098, 0, 1, 1,
0.6859763, 1.606145, 0.6195118, 0.4823529, 0, 1, 1,
0.6862841, -0.7948866, 4.245223, 0.4862745, 0, 1, 1,
0.6864079, -0.5658734, 2.904083, 0.4941176, 0, 1, 1,
0.6884438, 0.8071367, 1.652147, 0.5019608, 0, 1, 1,
0.6888611, 2.132219, 2.208634, 0.5058824, 0, 1, 1,
0.6892469, -1.401988, 2.074242, 0.5137255, 0, 1, 1,
0.6900725, 0.920902, 0.4442959, 0.5176471, 0, 1, 1,
0.6936413, 0.310581, 1.6236, 0.5254902, 0, 1, 1,
0.6940035, 0.9488889, -0.04336457, 0.5294118, 0, 1, 1,
0.6951525, -1.34791, 2.473035, 0.5372549, 0, 1, 1,
0.7001932, 0.2658086, 1.183719, 0.5411765, 0, 1, 1,
0.7060325, -0.1287661, 0.4243316, 0.5490196, 0, 1, 1,
0.7063109, -0.2148318, 0.7938843, 0.5529412, 0, 1, 1,
0.7118236, -1.048447, 2.534427, 0.5607843, 0, 1, 1,
0.7158764, -0.4059638, 1.161358, 0.5647059, 0, 1, 1,
0.720468, -1.125363, 1.842091, 0.572549, 0, 1, 1,
0.72058, 1.106623, 0.9456348, 0.5764706, 0, 1, 1,
0.7213662, -0.9612445, 3.576591, 0.5843138, 0, 1, 1,
0.7231866, -0.4795391, 2.63442, 0.5882353, 0, 1, 1,
0.7278253, 1.129507, 0.8446399, 0.5960785, 0, 1, 1,
0.7300885, -0.9195861, 2.970497, 0.6039216, 0, 1, 1,
0.7326878, -0.135933, 2.920727, 0.6078432, 0, 1, 1,
0.7359677, 0.2271218, 1.818656, 0.6156863, 0, 1, 1,
0.7369177, 1.157972, 0.9348372, 0.6196079, 0, 1, 1,
0.7404667, 0.9203272, 1.611704, 0.627451, 0, 1, 1,
0.7409819, -1.255963, 3.656639, 0.6313726, 0, 1, 1,
0.7430035, -1.287488, 2.733169, 0.6392157, 0, 1, 1,
0.744821, 0.8539003, 1.070184, 0.6431373, 0, 1, 1,
0.7482735, 1.01329, 0.1497111, 0.6509804, 0, 1, 1,
0.7484314, 0.1503199, 2.061277, 0.654902, 0, 1, 1,
0.7500063, 0.8325374, 0.3025982, 0.6627451, 0, 1, 1,
0.7508493, 1.523195, -1.513141, 0.6666667, 0, 1, 1,
0.7547792, -2.135524, 3.314593, 0.6745098, 0, 1, 1,
0.755483, -0.08423868, 1.39693, 0.6784314, 0, 1, 1,
0.7602404, -0.3507051, 1.659428, 0.6862745, 0, 1, 1,
0.7656587, 1.668804, 0.01252865, 0.6901961, 0, 1, 1,
0.7705688, 1.0485, -0.3184753, 0.6980392, 0, 1, 1,
0.7731025, 0.8011674, 1.676174, 0.7058824, 0, 1, 1,
0.7770135, 1.083661, 1.280685, 0.7098039, 0, 1, 1,
0.7777225, -1.491716, 2.466301, 0.7176471, 0, 1, 1,
0.7781156, -0.2137686, 2.09644, 0.7215686, 0, 1, 1,
0.7833917, 0.6053126, 1.211514, 0.7294118, 0, 1, 1,
0.7847443, 2.038564, 0.3064924, 0.7333333, 0, 1, 1,
0.7862456, 1.17663, -1.355472, 0.7411765, 0, 1, 1,
0.7902138, -0.2207276, 0.7474406, 0.7450981, 0, 1, 1,
0.7957295, 0.6797945, 2.998268, 0.7529412, 0, 1, 1,
0.8083419, 2.705567, 1.85872, 0.7568628, 0, 1, 1,
0.8103563, 0.7197354, 0.9642225, 0.7647059, 0, 1, 1,
0.8168841, 0.136689, 1.093208, 0.7686275, 0, 1, 1,
0.8176271, 0.687968, 1.726113, 0.7764706, 0, 1, 1,
0.8195345, 0.9412048, 0.1673286, 0.7803922, 0, 1, 1,
0.8197399, 0.3210914, 1.091247, 0.7882353, 0, 1, 1,
0.8244188, 1.534534, 1.36384, 0.7921569, 0, 1, 1,
0.8307027, 0.2911275, 1.09609, 0.8, 0, 1, 1,
0.8343794, 0.2615015, 0.5268192, 0.8078431, 0, 1, 1,
0.8354993, -0.7778563, 1.643891, 0.8117647, 0, 1, 1,
0.8397698, 0.320424, -0.6360773, 0.8196079, 0, 1, 1,
0.8420629, 0.9982931, 3.079743, 0.8235294, 0, 1, 1,
0.8435974, -0.6735318, -0.3700475, 0.8313726, 0, 1, 1,
0.8441761, 1.50246, 1.546799, 0.8352941, 0, 1, 1,
0.8449126, -2.891959, 2.529564, 0.8431373, 0, 1, 1,
0.8481574, 0.5034508, 0.5968515, 0.8470588, 0, 1, 1,
0.8550386, -0.4618753, 2.10029, 0.854902, 0, 1, 1,
0.8561571, 1.860688, 1.74975, 0.8588235, 0, 1, 1,
0.859402, -0.2483942, 2.141803, 0.8666667, 0, 1, 1,
0.8601686, 0.3007889, -0.6127146, 0.8705882, 0, 1, 1,
0.8617878, -0.0710269, 1.401158, 0.8784314, 0, 1, 1,
0.8622723, -0.6179752, 2.209291, 0.8823529, 0, 1, 1,
0.8740047, 0.3346643, -0.2343143, 0.8901961, 0, 1, 1,
0.8817011, -1.388296, 4.763391, 0.8941177, 0, 1, 1,
0.8848787, 0.2952632, 1.421732, 0.9019608, 0, 1, 1,
0.8857343, 0.8455108, -0.7802805, 0.9098039, 0, 1, 1,
0.8942158, 2.086973, 1.077584, 0.9137255, 0, 1, 1,
0.8958991, 0.799595, 0.7205046, 0.9215686, 0, 1, 1,
0.9002389, 0.5651572, 0.788117, 0.9254902, 0, 1, 1,
0.9006357, -1.814062, 4.274987, 0.9333333, 0, 1, 1,
0.9008681, -1.061383, 4.359256, 0.9372549, 0, 1, 1,
0.9018788, 0.3428301, 1.958605, 0.945098, 0, 1, 1,
0.9080591, 0.1411992, 1.378205, 0.9490196, 0, 1, 1,
0.9106156, -0.4939908, 1.464225, 0.9568627, 0, 1, 1,
0.9122329, -0.7443587, 0.8815179, 0.9607843, 0, 1, 1,
0.9124014, -0.3862726, 0.1302905, 0.9686275, 0, 1, 1,
0.9134213, -1.488361, 2.707438, 0.972549, 0, 1, 1,
0.9139486, -0.2571948, 1.990851, 0.9803922, 0, 1, 1,
0.9148836, -2.591211, 2.599203, 0.9843137, 0, 1, 1,
0.9251852, 1.673575, 1.066461, 0.9921569, 0, 1, 1,
0.9269038, 1.1064, 0.2318344, 0.9960784, 0, 1, 1,
0.9290171, -0.1564034, 1.497118, 1, 0, 0.9960784, 1,
0.9315449, 0.4237224, 1.114574, 1, 0, 0.9882353, 1,
0.9340823, 0.7036124, 1.699109, 1, 0, 0.9843137, 1,
0.9380302, 0.1230507, 0.4629559, 1, 0, 0.9764706, 1,
0.9425578, -1.001021, 2.651184, 1, 0, 0.972549, 1,
0.9428734, -0.4116013, 2.797507, 1, 0, 0.9647059, 1,
0.9452861, -1.119173, 1.941205, 1, 0, 0.9607843, 1,
0.9480467, 0.2467144, 1.413688, 1, 0, 0.9529412, 1,
0.9484618, 0.9084693, -0.4238311, 1, 0, 0.9490196, 1,
0.9502171, 1.107751, 1.191532, 1, 0, 0.9411765, 1,
0.9555032, -0.5757166, 1.632783, 1, 0, 0.9372549, 1,
0.958608, 0.130743, 0.7643929, 1, 0, 0.9294118, 1,
0.966702, -1.161148, 3.4384, 1, 0, 0.9254902, 1,
0.9683363, -0.3751676, 0.5041185, 1, 0, 0.9176471, 1,
0.9703852, -0.5545949, 2.15527, 1, 0, 0.9137255, 1,
0.9730975, 1.044721, 0.7896015, 1, 0, 0.9058824, 1,
0.9818385, -1.112702, 1.236938, 1, 0, 0.9019608, 1,
0.982177, -1.520843, 3.00455, 1, 0, 0.8941177, 1,
0.9821843, 0.5336661, 1.075162, 1, 0, 0.8862745, 1,
0.9860373, 0.3204035, 0.7779334, 1, 0, 0.8823529, 1,
0.9934822, -2.072825, 1.076193, 1, 0, 0.8745098, 1,
0.9939041, 0.822158, 1.21628, 1, 0, 0.8705882, 1,
0.9975541, 0.5772548, 2.166377, 1, 0, 0.8627451, 1,
1.003948, 1.635554, 0.5778784, 1, 0, 0.8588235, 1,
1.004078, -2.269017, 0.9064124, 1, 0, 0.8509804, 1,
1.005424, -1.4756, 1.81416, 1, 0, 0.8470588, 1,
1.006153, -0.8178784, 1.497355, 1, 0, 0.8392157, 1,
1.010151, 1.332335, -0.6756505, 1, 0, 0.8352941, 1,
1.012609, 1.400289, 1.530506, 1, 0, 0.827451, 1,
1.024095, -0.7490262, 1.969272, 1, 0, 0.8235294, 1,
1.034268, -1.664381, 1.412459, 1, 0, 0.8156863, 1,
1.040461, 0.5171394, -0.5881517, 1, 0, 0.8117647, 1,
1.042181, 0.9519061, -0.1685343, 1, 0, 0.8039216, 1,
1.044641, -0.2708433, 2.601116, 1, 0, 0.7960784, 1,
1.048427, 0.2460278, 1.832682, 1, 0, 0.7921569, 1,
1.048598, -0.4023062, 1.98571, 1, 0, 0.7843137, 1,
1.054821, -1.002619, 3.040499, 1, 0, 0.7803922, 1,
1.056967, -0.3063202, 1.80808, 1, 0, 0.772549, 1,
1.060137, -0.7433332, 1.434716, 1, 0, 0.7686275, 1,
1.065438, 0.9028183, 0.1848041, 1, 0, 0.7607843, 1,
1.066267, -0.639351, 0.320403, 1, 0, 0.7568628, 1,
1.066767, 0.4995477, 1.878737, 1, 0, 0.7490196, 1,
1.072522, 1.648806, 1.510739, 1, 0, 0.7450981, 1,
1.076176, 2.115667, -0.09168389, 1, 0, 0.7372549, 1,
1.077852, 0.6290069, 0.8426858, 1, 0, 0.7333333, 1,
1.086337, 0.8364756, 2.008376, 1, 0, 0.7254902, 1,
1.088268, 1.193509, 1.652457, 1, 0, 0.7215686, 1,
1.090208, 0.3573823, 2.294401, 1, 0, 0.7137255, 1,
1.100345, -1.082726, 1.600345, 1, 0, 0.7098039, 1,
1.11452, 2.033048, 0.2467756, 1, 0, 0.7019608, 1,
1.114789, 0.6342862, 0.5338803, 1, 0, 0.6941177, 1,
1.115524, -0.6908442, 2.174675, 1, 0, 0.6901961, 1,
1.119887, 0.7647487, -0.7939268, 1, 0, 0.682353, 1,
1.133469, 0.2864816, 0.9380253, 1, 0, 0.6784314, 1,
1.142775, 1.038402, 3.556875, 1, 0, 0.6705883, 1,
1.150757, -1.060505, 1.069636, 1, 0, 0.6666667, 1,
1.151251, 0.01740717, -0.5420729, 1, 0, 0.6588235, 1,
1.154153, -0.315295, 1.675647, 1, 0, 0.654902, 1,
1.157117, -0.7901124, 3.171072, 1, 0, 0.6470588, 1,
1.16873, -1.814739, 2.264865, 1, 0, 0.6431373, 1,
1.176801, -0.5323099, 3.227202, 1, 0, 0.6352941, 1,
1.179555, -0.3338591, 1.10799, 1, 0, 0.6313726, 1,
1.180287, -1.110964, 1.241405, 1, 0, 0.6235294, 1,
1.182618, 0.5239091, 2.236311, 1, 0, 0.6196079, 1,
1.195745, 1.038648, -0.06879548, 1, 0, 0.6117647, 1,
1.200003, 1.127329, -0.8968208, 1, 0, 0.6078432, 1,
1.201814, 1.558138, -0.2225463, 1, 0, 0.6, 1,
1.213059, -0.3688305, 2.545886, 1, 0, 0.5921569, 1,
1.226869, 0.08950646, -0.124287, 1, 0, 0.5882353, 1,
1.227737, -0.6663767, 0.9450454, 1, 0, 0.5803922, 1,
1.234113, 1.24989, 2.017005, 1, 0, 0.5764706, 1,
1.236151, -0.09197725, 0.4182229, 1, 0, 0.5686275, 1,
1.237832, 0.2525152, 1.371501, 1, 0, 0.5647059, 1,
1.238761, 0.491311, 1.222121, 1, 0, 0.5568628, 1,
1.244889, 0.2337396, 1.523983, 1, 0, 0.5529412, 1,
1.266303, 0.06748678, -0.4979685, 1, 0, 0.5450981, 1,
1.267266, 1.180809, 0.5564467, 1, 0, 0.5411765, 1,
1.272101, 0.7739362, 0.04808525, 1, 0, 0.5333334, 1,
1.273574, 0.6593388, 1.020331, 1, 0, 0.5294118, 1,
1.292052, 1.067546, -0.266102, 1, 0, 0.5215687, 1,
1.292694, -1.003446, 2.275053, 1, 0, 0.5176471, 1,
1.306555, 1.008751, 0.02304271, 1, 0, 0.509804, 1,
1.31229, 1.044299, 0.1150537, 1, 0, 0.5058824, 1,
1.322581, 0.5413037, 1.115678, 1, 0, 0.4980392, 1,
1.342642, -0.8207387, 2.579244, 1, 0, 0.4901961, 1,
1.345681, -1.447554, 2.550556, 1, 0, 0.4862745, 1,
1.363604, -0.9224924, 1.99732, 1, 0, 0.4784314, 1,
1.367629, -1.461035, 3.344345, 1, 0, 0.4745098, 1,
1.373219, 0.8990741, 0.1040531, 1, 0, 0.4666667, 1,
1.376378, -0.2875628, 1.947369, 1, 0, 0.4627451, 1,
1.382263, -1.199458, 1.731857, 1, 0, 0.454902, 1,
1.406735, -0.1093276, 2.798694, 1, 0, 0.4509804, 1,
1.415224, -1.261754, 1.5556, 1, 0, 0.4431373, 1,
1.426758, 1.777473, 1.524711, 1, 0, 0.4392157, 1,
1.433976, 0.7581525, 1.659601, 1, 0, 0.4313726, 1,
1.446966, -1.473825, 3.638801, 1, 0, 0.427451, 1,
1.44927, -1.356063, 2.492539, 1, 0, 0.4196078, 1,
1.452907, 1.190852, 0.966874, 1, 0, 0.4156863, 1,
1.453927, 0.7890739, 2.405031, 1, 0, 0.4078431, 1,
1.453959, 1.773447, 0.9593418, 1, 0, 0.4039216, 1,
1.45499, 0.5862063, 3.629596, 1, 0, 0.3960784, 1,
1.455021, -0.4402266, 2.765262, 1, 0, 0.3882353, 1,
1.460126, -0.3798791, 2.716159, 1, 0, 0.3843137, 1,
1.479499, -1.276571, 2.468393, 1, 0, 0.3764706, 1,
1.525138, 0.2032199, 1.932032, 1, 0, 0.372549, 1,
1.525421, -0.1582862, 2.25088, 1, 0, 0.3647059, 1,
1.543546, 1.319178, 1.115425, 1, 0, 0.3607843, 1,
1.545755, 0.03012119, 1.814817, 1, 0, 0.3529412, 1,
1.558078, 1.796229, 1.969324, 1, 0, 0.3490196, 1,
1.564631, 2.090927, -0.3009059, 1, 0, 0.3411765, 1,
1.573577, 0.000122654, 3.355903, 1, 0, 0.3372549, 1,
1.581827, 2.391615, -0.2559937, 1, 0, 0.3294118, 1,
1.614769, -3.762734, 2.213284, 1, 0, 0.3254902, 1,
1.618971, 0.4778444, 2.607588, 1, 0, 0.3176471, 1,
1.619213, 1.358919, 1.500579, 1, 0, 0.3137255, 1,
1.628022, -0.4694248, 0.5307032, 1, 0, 0.3058824, 1,
1.628138, 0.8606781, 0.8956676, 1, 0, 0.2980392, 1,
1.628777, -0.7589634, 1.15992, 1, 0, 0.2941177, 1,
1.639226, 0.3360538, 2.296051, 1, 0, 0.2862745, 1,
1.653041, 0.1466404, 0.3982097, 1, 0, 0.282353, 1,
1.660786, 1.135484, 0.6338488, 1, 0, 0.2745098, 1,
1.662542, -0.4632589, 0.4671112, 1, 0, 0.2705882, 1,
1.708027, -0.7622371, 3.479165, 1, 0, 0.2627451, 1,
1.711468, 0.5566059, 2.640927, 1, 0, 0.2588235, 1,
1.746761, 0.7222071, 1.987679, 1, 0, 0.2509804, 1,
1.750689, 0.1127311, 3.794898, 1, 0, 0.2470588, 1,
1.793657, 0.7255964, 2.361069, 1, 0, 0.2392157, 1,
1.801854, -1.089813, 2.322111, 1, 0, 0.2352941, 1,
1.802635, 0.01341235, 0.377604, 1, 0, 0.227451, 1,
1.809161, 0.8708115, 0.8968987, 1, 0, 0.2235294, 1,
1.810171, 1.478607, -0.1086639, 1, 0, 0.2156863, 1,
1.814611, -0.2397668, 3.665123, 1, 0, 0.2117647, 1,
1.828369, 1.152806, -0.6596712, 1, 0, 0.2039216, 1,
1.895094, 1.58027, 1.911104, 1, 0, 0.1960784, 1,
1.898552, 0.2246868, 1.204605, 1, 0, 0.1921569, 1,
1.944168, 1.781973, 0.6048274, 1, 0, 0.1843137, 1,
1.953803, 1.553535, -0.5663044, 1, 0, 0.1803922, 1,
1.962875, -1.111603, -0.5309697, 1, 0, 0.172549, 1,
1.979425, 0.686461, 0.911646, 1, 0, 0.1686275, 1,
1.997744, 0.1291564, 0.715633, 1, 0, 0.1607843, 1,
2.008117, -0.104088, 0.9466612, 1, 0, 0.1568628, 1,
2.008765, -0.5168175, 2.265235, 1, 0, 0.1490196, 1,
2.018391, 1.540035, 0.6839799, 1, 0, 0.145098, 1,
2.068829, -0.3306368, 0.5908746, 1, 0, 0.1372549, 1,
2.077192, 0.4317097, 2.382812, 1, 0, 0.1333333, 1,
2.08755, 0.1571555, 2.326631, 1, 0, 0.1254902, 1,
2.097667, 0.498638, 1.211193, 1, 0, 0.1215686, 1,
2.103632, 0.3736276, 0.6265275, 1, 0, 0.1137255, 1,
2.141555, 0.2636306, 1.747274, 1, 0, 0.1098039, 1,
2.15373, 1.368192, 0.9497698, 1, 0, 0.1019608, 1,
2.16179, 0.2929292, 0.5206611, 1, 0, 0.09411765, 1,
2.168489, 0.1372538, 1.882647, 1, 0, 0.09019608, 1,
2.241628, 0.9043087, 3.466878, 1, 0, 0.08235294, 1,
2.24595, 0.7913867, 1.952965, 1, 0, 0.07843138, 1,
2.246525, -2.162111, 4.262847, 1, 0, 0.07058824, 1,
2.279148, 0.07163442, 2.354275, 1, 0, 0.06666667, 1,
2.279736, 0.9108436, 0.9727576, 1, 0, 0.05882353, 1,
2.312641, -1.34138, 3.410097, 1, 0, 0.05490196, 1,
2.34092, -0.5789123, 3.393417, 1, 0, 0.04705882, 1,
2.37039, 0.7797725, 1.407232, 1, 0, 0.04313726, 1,
2.542134, 2.240219, 1.399028, 1, 0, 0.03529412, 1,
2.633395, 0.0314721, 2.017879, 1, 0, 0.03137255, 1,
2.711175, 0.3806514, 1.626844, 1, 0, 0.02352941, 1,
2.899227, -0.06617874, 0.3263094, 1, 0, 0.01960784, 1,
2.918208, -0.6850184, 1.199304, 1, 0, 0.01176471, 1,
3.313242, 0.8233128, 0.5076988, 1, 0, 0.007843138, 1
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
0.1178674, -4.86501, -7.64251, 0, -0.5, 0.5, 0.5,
0.1178674, -4.86501, -7.64251, 1, -0.5, 0.5, 0.5,
0.1178674, -4.86501, -7.64251, 1, 1.5, 0.5, 0.5,
0.1178674, -4.86501, -7.64251, 0, 1.5, 0.5, 0.5
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
-4.160739, -0.5111835, -7.64251, 0, -0.5, 0.5, 0.5,
-4.160739, -0.5111835, -7.64251, 1, -0.5, 0.5, 0.5,
-4.160739, -0.5111835, -7.64251, 1, 1.5, 0.5, 0.5,
-4.160739, -0.5111835, -7.64251, 0, 1.5, 0.5, 0.5
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
-4.160739, -4.86501, 0.02583551, 0, -0.5, 0.5, 0.5,
-4.160739, -4.86501, 0.02583551, 1, -0.5, 0.5, 0.5,
-4.160739, -4.86501, 0.02583551, 1, 1.5, 0.5, 0.5,
-4.160739, -4.86501, 0.02583551, 0, 1.5, 0.5, 0.5
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
-3, -3.860281, -5.872892,
3, -3.860281, -5.872892,
-3, -3.860281, -5.872892,
-3, -4.027736, -6.167828,
-2, -3.860281, -5.872892,
-2, -4.027736, -6.167828,
-1, -3.860281, -5.872892,
-1, -4.027736, -6.167828,
0, -3.860281, -5.872892,
0, -4.027736, -6.167828,
1, -3.860281, -5.872892,
1, -4.027736, -6.167828,
2, -3.860281, -5.872892,
2, -4.027736, -6.167828,
3, -3.860281, -5.872892,
3, -4.027736, -6.167828
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
-3, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
-3, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
-3, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
-3, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
-2, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
-2, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
-2, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
-2, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
-1, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
-1, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
-1, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
-1, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
0, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
0, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
0, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
0, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
1, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
1, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
1, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
1, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
2, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
2, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
2, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
2, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5,
3, -4.362646, -6.757701, 0, -0.5, 0.5, 0.5,
3, -4.362646, -6.757701, 1, -0.5, 0.5, 0.5,
3, -4.362646, -6.757701, 1, 1.5, 0.5, 0.5,
3, -4.362646, -6.757701, 0, 1.5, 0.5, 0.5
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
-3.173368, -3, -5.872892,
-3.173368, 2, -5.872892,
-3.173368, -3, -5.872892,
-3.33793, -3, -6.167828,
-3.173368, -2, -5.872892,
-3.33793, -2, -6.167828,
-3.173368, -1, -5.872892,
-3.33793, -1, -6.167828,
-3.173368, 0, -5.872892,
-3.33793, 0, -6.167828,
-3.173368, 1, -5.872892,
-3.33793, 1, -6.167828,
-3.173368, 2, -5.872892,
-3.33793, 2, -6.167828
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
"2"
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
-3.667054, -3, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, -3, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, -3, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, -3, -6.757701, 0, 1.5, 0.5, 0.5,
-3.667054, -2, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, -2, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, -2, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, -2, -6.757701, 0, 1.5, 0.5, 0.5,
-3.667054, -1, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, -1, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, -1, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, -1, -6.757701, 0, 1.5, 0.5, 0.5,
-3.667054, 0, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, 0, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, 0, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, 0, -6.757701, 0, 1.5, 0.5, 0.5,
-3.667054, 1, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, 1, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, 1, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, 1, -6.757701, 0, 1.5, 0.5, 0.5,
-3.667054, 2, -6.757701, 0, -0.5, 0.5, 0.5,
-3.667054, 2, -6.757701, 1, -0.5, 0.5, 0.5,
-3.667054, 2, -6.757701, 1, 1.5, 0.5, 0.5,
-3.667054, 2, -6.757701, 0, 1.5, 0.5, 0.5
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
-3.173368, -3.860281, -4,
-3.173368, -3.860281, 4,
-3.173368, -3.860281, -4,
-3.33793, -4.027736, -4,
-3.173368, -3.860281, -2,
-3.33793, -4.027736, -2,
-3.173368, -3.860281, 0,
-3.33793, -4.027736, 0,
-3.173368, -3.860281, 2,
-3.33793, -4.027736, 2,
-3.173368, -3.860281, 4,
-3.33793, -4.027736, 4
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
-3.667054, -4.362646, -4, 0, -0.5, 0.5, 0.5,
-3.667054, -4.362646, -4, 1, -0.5, 0.5, 0.5,
-3.667054, -4.362646, -4, 1, 1.5, 0.5, 0.5,
-3.667054, -4.362646, -4, 0, 1.5, 0.5, 0.5,
-3.667054, -4.362646, -2, 0, -0.5, 0.5, 0.5,
-3.667054, -4.362646, -2, 1, -0.5, 0.5, 0.5,
-3.667054, -4.362646, -2, 1, 1.5, 0.5, 0.5,
-3.667054, -4.362646, -2, 0, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 0, 0, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 0, 1, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 0, 1, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 0, 0, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 2, 0, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 2, 1, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 2, 1, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 2, 0, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 4, 0, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 4, 1, -0.5, 0.5, 0.5,
-3.667054, -4.362646, 4, 1, 1.5, 0.5, 0.5,
-3.667054, -4.362646, 4, 0, 1.5, 0.5, 0.5
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
-3.173368, -3.860281, -5.872892,
-3.173368, 2.837914, -5.872892,
-3.173368, -3.860281, 5.924563,
-3.173368, 2.837914, 5.924563,
-3.173368, -3.860281, -5.872892,
-3.173368, -3.860281, 5.924563,
-3.173368, 2.837914, -5.872892,
-3.173368, 2.837914, 5.924563,
-3.173368, -3.860281, -5.872892,
3.409103, -3.860281, -5.872892,
-3.173368, -3.860281, 5.924563,
3.409103, -3.860281, 5.924563,
-3.173368, 2.837914, -5.872892,
3.409103, 2.837914, -5.872892,
-3.173368, 2.837914, 5.924563,
3.409103, 2.837914, 5.924563,
3.409103, -3.860281, -5.872892,
3.409103, 2.837914, -5.872892,
3.409103, -3.860281, 5.924563,
3.409103, 2.837914, 5.924563,
3.409103, -3.860281, -5.872892,
3.409103, -3.860281, 5.924563,
3.409103, 2.837914, -5.872892,
3.409103, 2.837914, 5.924563
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
var radius = 8.051866;
var distance = 35.82366;
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
mvMatrix.translate( -0.1178674, 0.5111835, -0.02583551 );
mvMatrix.scale( 1.322578, 1.299729, 0.7379418 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.82366);
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
Chlorpyrifos-Methyl<-read.table("Chlorpyrifos-Methyl.xyz")
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
-3.077507, -0.8991829, -1.492483, 0, 0, 1, 1, 1,
-3.073057, 0.5677292, -1.579762, 1, 0, 0, 1, 1,
-2.823115, 0.4665845, -1.184301, 1, 0, 0, 1, 1,
-2.759286, -0.2579108, -1.54581, 1, 0, 0, 1, 1,
-2.62974, -0.25061, -1.561255, 1, 0, 0, 1, 1,
-2.579928, -2.926672, -1.784974, 1, 0, 0, 1, 1,
-2.556365, 0.690291, -1.101699, 0, 0, 0, 1, 1,
-2.509431, -1.23588, -1.976135, 0, 0, 0, 1, 1,
-2.431147, 0.6670198, -2.644819, 0, 0, 0, 1, 1,
-2.413378, 1.002406, -2.355003, 0, 0, 0, 1, 1,
-2.404699, 0.193985, -2.483836, 0, 0, 0, 1, 1,
-2.400913, -0.03566834, -1.185123, 0, 0, 0, 1, 1,
-2.371507, -0.7661583, -2.987218, 0, 0, 0, 1, 1,
-2.304267, 0.5042328, -1.656098, 1, 1, 1, 1, 1,
-2.181319, -0.2845201, -1.039569, 1, 1, 1, 1, 1,
-2.177285, -1.133355, -0.7518679, 1, 1, 1, 1, 1,
-2.171612, 0.114869, -1.307857, 1, 1, 1, 1, 1,
-2.163383, -0.1650248, -1.003109, 1, 1, 1, 1, 1,
-2.155392, 0.2213865, -3.041188, 1, 1, 1, 1, 1,
-2.154748, -0.5119206, 0.004209772, 1, 1, 1, 1, 1,
-2.093174, -1.955982, -2.768909, 1, 1, 1, 1, 1,
-2.061924, 1.334772, -2.034133, 1, 1, 1, 1, 1,
-2.059241, -0.9540564, -2.15584, 1, 1, 1, 1, 1,
-2.04519, 0.8936069, 0.1388198, 1, 1, 1, 1, 1,
-2.041175, 1.013867, -1.328155, 1, 1, 1, 1, 1,
-1.987954, 1.468652, -2.101489, 1, 1, 1, 1, 1,
-1.967348, 0.8005328, -1.040623, 1, 1, 1, 1, 1,
-1.945516, -1.099727, -2.98933, 1, 1, 1, 1, 1,
-1.944782, 1.082516, -3.381081, 0, 0, 1, 1, 1,
-1.929876, -1.244609, -1.890224, 1, 0, 0, 1, 1,
-1.891498, 0.6888908, -3.268388, 1, 0, 0, 1, 1,
-1.888578, -0.2511959, -2.800132, 1, 0, 0, 1, 1,
-1.857465, 0.1156531, -0.1862842, 1, 0, 0, 1, 1,
-1.851283, 0.7733447, -1.86974, 1, 0, 0, 1, 1,
-1.820613, -0.430226, -2.367584, 0, 0, 0, 1, 1,
-1.811249, -0.4559538, -0.836476, 0, 0, 0, 1, 1,
-1.803905, 0.04191826, -1.738571, 0, 0, 0, 1, 1,
-1.773098, 1.014054, -2.037591, 0, 0, 0, 1, 1,
-1.770465, -1.84976, -2.199723, 0, 0, 0, 1, 1,
-1.766796, 0.5478362, -1.837143, 0, 0, 0, 1, 1,
-1.766725, 0.9429126, -1.455575, 0, 0, 0, 1, 1,
-1.757772, 1.665573, 0.9690127, 1, 1, 1, 1, 1,
-1.756509, 1.282995, -0.4825932, 1, 1, 1, 1, 1,
-1.745243, -0.2863044, 0.1570174, 1, 1, 1, 1, 1,
-1.726162, 1.342483, -1.903443, 1, 1, 1, 1, 1,
-1.723002, -1.944505, -2.278255, 1, 1, 1, 1, 1,
-1.713587, 0.1832658, -1.202184, 1, 1, 1, 1, 1,
-1.707127, -1.239718, -1.721343, 1, 1, 1, 1, 1,
-1.686662, 0.3658136, -1.517126, 1, 1, 1, 1, 1,
-1.671151, -2.227135, -2.629894, 1, 1, 1, 1, 1,
-1.664209, 0.8097054, -1.72338, 1, 1, 1, 1, 1,
-1.65579, -0.5465311, -2.678611, 1, 1, 1, 1, 1,
-1.654645, 0.5625641, -0.9908174, 1, 1, 1, 1, 1,
-1.647346, 0.2994165, -0.4375466, 1, 1, 1, 1, 1,
-1.645273, 1.659099, -1.611796, 1, 1, 1, 1, 1,
-1.64247, -0.3470069, -2.87492, 1, 1, 1, 1, 1,
-1.642322, -1.204726, -3.284585, 0, 0, 1, 1, 1,
-1.628506, -0.8046452, -3.916942, 1, 0, 0, 1, 1,
-1.612862, 0.7304767, -3.388551, 1, 0, 0, 1, 1,
-1.598869, 0.1021083, -0.2392106, 1, 0, 0, 1, 1,
-1.598832, -1.059183, -1.714919, 1, 0, 0, 1, 1,
-1.596277, 2.740367, 0.1281195, 1, 0, 0, 1, 1,
-1.593714, -0.1148008, -2.208284, 0, 0, 0, 1, 1,
-1.576977, 0.8093879, -0.9751903, 0, 0, 0, 1, 1,
-1.561649, -0.2755041, -1.450532, 0, 0, 0, 1, 1,
-1.552459, -2.987038, -4.229387, 0, 0, 0, 1, 1,
-1.546501, -0.8948784, -4.156837, 0, 0, 0, 1, 1,
-1.545009, 1.777534, -0.6020637, 0, 0, 0, 1, 1,
-1.518971, -0.4599507, -2.103524, 0, 0, 0, 1, 1,
-1.504035, -0.6321139, -1.430183, 1, 1, 1, 1, 1,
-1.487517, 0.09241907, -1.794122, 1, 1, 1, 1, 1,
-1.480559, 0.742401, 0.2129737, 1, 1, 1, 1, 1,
-1.478629, 1.489417, -0.8526074, 1, 1, 1, 1, 1,
-1.475447, 1.10424, 0.4630448, 1, 1, 1, 1, 1,
-1.467162, 1.663049, -1.818628, 1, 1, 1, 1, 1,
-1.46209, 1.024133, 1.829902, 1, 1, 1, 1, 1,
-1.451584, 1.050558, 0.2429914, 1, 1, 1, 1, 1,
-1.449747, 0.04647911, -1.543527, 1, 1, 1, 1, 1,
-1.448773, -0.06822248, -1.266169, 1, 1, 1, 1, 1,
-1.436286, -0.9048843, -2.418921, 1, 1, 1, 1, 1,
-1.432592, -0.6467769, -3.146927, 1, 1, 1, 1, 1,
-1.428153, -1.028348, -3.12904, 1, 1, 1, 1, 1,
-1.409955, 0.7049085, -0.2611664, 1, 1, 1, 1, 1,
-1.406094, -0.8311389, -1.121884, 1, 1, 1, 1, 1,
-1.397547, 0.8392953, 0.8978994, 0, 0, 1, 1, 1,
-1.386602, 1.546134, -2.042847, 1, 0, 0, 1, 1,
-1.382285, 0.9450568, 0.222877, 1, 0, 0, 1, 1,
-1.379851, -0.9999159, -1.221297, 1, 0, 0, 1, 1,
-1.375699, 0.09361566, -2.497706, 1, 0, 0, 1, 1,
-1.373394, 0.6605656, -1.236432, 1, 0, 0, 1, 1,
-1.362277, -0.8405671, -1.950453, 0, 0, 0, 1, 1,
-1.346338, -0.9213824, -0.77294, 0, 0, 0, 1, 1,
-1.345351, 2.047515, 0.1862813, 0, 0, 0, 1, 1,
-1.343256, 1.553386, -2.183875, 0, 0, 0, 1, 1,
-1.341341, -1.424892, -3.662415, 0, 0, 0, 1, 1,
-1.341132, 1.177903, -0.2540545, 0, 0, 0, 1, 1,
-1.33593, 0.5481218, -0.1889489, 0, 0, 0, 1, 1,
-1.329506, -0.1566961, -1.257684, 1, 1, 1, 1, 1,
-1.329067, 0.2829251, -0.7977098, 1, 1, 1, 1, 1,
-1.326332, -1.042553, -3.866185, 1, 1, 1, 1, 1,
-1.321949, -0.9212493, -2.39373, 1, 1, 1, 1, 1,
-1.321398, -0.4456514, -2.865469, 1, 1, 1, 1, 1,
-1.320452, -0.1248865, -2.889961, 1, 1, 1, 1, 1,
-1.319429, -0.800522, -1.520129, 1, 1, 1, 1, 1,
-1.31635, 0.9037479, 0.109746, 1, 1, 1, 1, 1,
-1.311612, -0.032215, -0.0253193, 1, 1, 1, 1, 1,
-1.309542, 0.1079153, -0.724221, 1, 1, 1, 1, 1,
-1.297167, 0.007319262, -1.464245, 1, 1, 1, 1, 1,
-1.295302, -0.3952839, -1.311607, 1, 1, 1, 1, 1,
-1.286465, -1.540255, -2.535253, 1, 1, 1, 1, 1,
-1.279171, 0.7897586, -0.2876059, 1, 1, 1, 1, 1,
-1.273055, -1.059609, -2.517499, 1, 1, 1, 1, 1,
-1.251892, -0.6418064, -1.863857, 0, 0, 1, 1, 1,
-1.250698, 0.2301659, -1.727285, 1, 0, 0, 1, 1,
-1.246611, 0.01857377, 0.6643525, 1, 0, 0, 1, 1,
-1.238775, 1.051443, -0.2821923, 1, 0, 0, 1, 1,
-1.236164, 1.328186, 1.316065, 1, 0, 0, 1, 1,
-1.233093, 1.64234, 0.4691344, 1, 0, 0, 1, 1,
-1.230022, -0.2403594, -0.0752151, 0, 0, 0, 1, 1,
-1.216655, 0.2950919, -0.5307575, 0, 0, 0, 1, 1,
-1.215229, 0.6688799, -1.849111, 0, 0, 0, 1, 1,
-1.213836, 0.21132, -1.765687, 0, 0, 0, 1, 1,
-1.207301, -1.029355, -2.934004, 0, 0, 0, 1, 1,
-1.199997, 0.02340617, -1.591526, 0, 0, 0, 1, 1,
-1.198993, -0.6497156, -2.759271, 0, 0, 0, 1, 1,
-1.196043, -0.4955128, -1.415207, 1, 1, 1, 1, 1,
-1.194773, -0.354553, -1.955403, 1, 1, 1, 1, 1,
-1.19455, 2.083148, 0.6051614, 1, 1, 1, 1, 1,
-1.175895, 0.5260696, -2.308286, 1, 1, 1, 1, 1,
-1.170363, 0.6628007, -0.3477641, 1, 1, 1, 1, 1,
-1.163147, 1.158797, -0.3535908, 1, 1, 1, 1, 1,
-1.155357, 0.8739319, -2.58804, 1, 1, 1, 1, 1,
-1.154627, -1.149339, -2.391024, 1, 1, 1, 1, 1,
-1.142018, -2.282925, -2.765213, 1, 1, 1, 1, 1,
-1.141222, -0.2296557, -1.598313, 1, 1, 1, 1, 1,
-1.139559, 1.588753, -0.4896612, 1, 1, 1, 1, 1,
-1.134552, -0.2426459, -1.092614, 1, 1, 1, 1, 1,
-1.129165, -0.147395, -2.424802, 1, 1, 1, 1, 1,
-1.118888, 0.9470751, -0.1358032, 1, 1, 1, 1, 1,
-1.106922, 0.589641, -1.149228, 1, 1, 1, 1, 1,
-1.103767, 0.3677171, -2.004328, 0, 0, 1, 1, 1,
-1.101542, -1.514724, -2.039781, 1, 0, 0, 1, 1,
-1.10123, -0.6257917, -2.320357, 1, 0, 0, 1, 1,
-1.094244, -0.9794461, -3.949407, 1, 0, 0, 1, 1,
-1.08745, -1.407844, -2.893197, 1, 0, 0, 1, 1,
-1.087358, 0.00987603, -2.487275, 1, 0, 0, 1, 1,
-1.087071, -0.6725127, -2.57549, 0, 0, 0, 1, 1,
-1.086567, 1.176331, 0.6220941, 0, 0, 0, 1, 1,
-1.083308, -1.554581, -2.243361, 0, 0, 0, 1, 1,
-1.080972, 0.2290241, -2.713442, 0, 0, 0, 1, 1,
-1.078575, -0.2518557, -3.818195, 0, 0, 0, 1, 1,
-1.075464, -1.219163, -0.8784165, 0, 0, 0, 1, 1,
-1.074769, 0.4495001, 0.1244923, 0, 0, 0, 1, 1,
-1.074707, -0.5120609, -4.442048, 1, 1, 1, 1, 1,
-1.069876, -0.4653769, -1.794305, 1, 1, 1, 1, 1,
-1.062211, -0.02151424, -1.49492, 1, 1, 1, 1, 1,
-1.054393, 0.1325872, -2.085991, 1, 1, 1, 1, 1,
-1.053612, -1.308935, -2.161222, 1, 1, 1, 1, 1,
-1.047177, 0.354239, -0.838684, 1, 1, 1, 1, 1,
-1.040711, 1.239504, 0.3987152, 1, 1, 1, 1, 1,
-1.039053, 1.19277, -1.343628, 1, 1, 1, 1, 1,
-1.037475, -0.9477665, -3.642182, 1, 1, 1, 1, 1,
-1.031944, 0.0429933, -2.028189, 1, 1, 1, 1, 1,
-1.03005, 0.1266111, -1.851301, 1, 1, 1, 1, 1,
-1.024718, 1.209659, -0.9465228, 1, 1, 1, 1, 1,
-1.022289, -0.4468917, -1.151896, 1, 1, 1, 1, 1,
-0.9968739, 0.9445122, -2.563447, 1, 1, 1, 1, 1,
-0.9967721, -1.803566, -2.47314, 1, 1, 1, 1, 1,
-0.9967652, -0.3212387, -3.047215, 0, 0, 1, 1, 1,
-0.9961729, 0.9468725, -0.4246497, 1, 0, 0, 1, 1,
-0.993497, 1.340239, -1.159528, 1, 0, 0, 1, 1,
-0.9915006, -0.5701271, -1.374472, 1, 0, 0, 1, 1,
-0.9851463, 0.7326425, -0.3765758, 1, 0, 0, 1, 1,
-0.9845405, 1.653005, -0.4616486, 1, 0, 0, 1, 1,
-0.9810876, -0.3311634, -0.9834989, 0, 0, 0, 1, 1,
-0.9803039, 1.029, -1.939659, 0, 0, 0, 1, 1,
-0.9759572, 0.3328406, -0.9394349, 0, 0, 0, 1, 1,
-0.9729548, -0.538843, -2.268845, 0, 0, 0, 1, 1,
-0.9726667, 0.1002106, 0.710107, 0, 0, 0, 1, 1,
-0.9720192, -0.562287, -1.094705, 0, 0, 0, 1, 1,
-0.9714956, 1.030991, 0.2278045, 0, 0, 0, 1, 1,
-0.9565817, 0.804493, -1.554425, 1, 1, 1, 1, 1,
-0.9464773, -1.560799, -2.555935, 1, 1, 1, 1, 1,
-0.9440631, 1.521011, -1.175213, 1, 1, 1, 1, 1,
-0.9427668, 1.128363, -0.8855175, 1, 1, 1, 1, 1,
-0.9406965, -1.165648, -3.425144, 1, 1, 1, 1, 1,
-0.9388363, 0.1709773, -1.937513, 1, 1, 1, 1, 1,
-0.9376394, 0.1580491, -1.18102, 1, 1, 1, 1, 1,
-0.9360276, 0.07420003, -2.356282, 1, 1, 1, 1, 1,
-0.9225366, 0.4758443, 0.2080964, 1, 1, 1, 1, 1,
-0.9218711, -1.110921, -1.003018, 1, 1, 1, 1, 1,
-0.9215167, -0.4454556, -1.500119, 1, 1, 1, 1, 1,
-0.9205351, -0.5256975, -1.806832, 1, 1, 1, 1, 1,
-0.9164409, 0.3982622, -0.160506, 1, 1, 1, 1, 1,
-0.9158477, 2.024608, -0.9577018, 1, 1, 1, 1, 1,
-0.9131719, 0.003970167, 0.3957076, 1, 1, 1, 1, 1,
-0.9109282, 0.3608631, -0.7473069, 0, 0, 1, 1, 1,
-0.9080534, 0.4034352, -0.3949651, 1, 0, 0, 1, 1,
-0.9031953, -1.36024, -1.64882, 1, 0, 0, 1, 1,
-0.9018642, -1.693414, -0.5475278, 1, 0, 0, 1, 1,
-0.8999031, -0.04803886, -1.034817, 1, 0, 0, 1, 1,
-0.8887176, -0.8635432, -1.912236, 1, 0, 0, 1, 1,
-0.884208, -0.6640628, -3.759316, 0, 0, 0, 1, 1,
-0.8831758, 0.4065726, -2.43181, 0, 0, 0, 1, 1,
-0.8803095, 1.923804, -1.780236, 0, 0, 0, 1, 1,
-0.8799726, 0.4007022, -2.133002, 0, 0, 0, 1, 1,
-0.876857, -0.3234762, -2.70679, 0, 0, 0, 1, 1,
-0.8767813, 0.2966617, -0.4003079, 0, 0, 0, 1, 1,
-0.876087, -1.51404, -2.276239, 0, 0, 0, 1, 1,
-0.8731967, 0.2624666, -1.072028, 1, 1, 1, 1, 1,
-0.8642367, -0.1817589, -1.766832, 1, 1, 1, 1, 1,
-0.8638834, 0.02776991, -0.2227613, 1, 1, 1, 1, 1,
-0.850112, 1.384308, -0.7986158, 1, 1, 1, 1, 1,
-0.8464717, -1.522472, -1.668689, 1, 1, 1, 1, 1,
-0.8447858, -0.6128784, -1.754621, 1, 1, 1, 1, 1,
-0.8330534, 0.03905929, -0.4154217, 1, 1, 1, 1, 1,
-0.8298621, -0.002041811, -1.986467, 1, 1, 1, 1, 1,
-0.8255802, 0.8769022, -2.566211, 1, 1, 1, 1, 1,
-0.8248075, 0.1329399, -0.09763465, 1, 1, 1, 1, 1,
-0.8215063, 0.1777927, -0.8387417, 1, 1, 1, 1, 1,
-0.8177599, 0.3049964, -0.7140938, 1, 1, 1, 1, 1,
-0.8175041, 0.8636032, 0.4107345, 1, 1, 1, 1, 1,
-0.8171738, -0.5259973, -4.002183, 1, 1, 1, 1, 1,
-0.8121468, 0.6603328, 0.3158475, 1, 1, 1, 1, 1,
-0.8079264, -0.2833909, -0.5357891, 0, 0, 1, 1, 1,
-0.8014307, -0.6047309, -1.712414, 1, 0, 0, 1, 1,
-0.7934934, 0.4710471, -1.212254, 1, 0, 0, 1, 1,
-0.7887231, -0.3010473, -1.560406, 1, 0, 0, 1, 1,
-0.7862284, 0.3363294, -0.46799, 1, 0, 0, 1, 1,
-0.7851683, -1.511528, -2.736574, 1, 0, 0, 1, 1,
-0.7825317, 1.223232, -0.4156262, 0, 0, 0, 1, 1,
-0.7809073, -0.1408109, -3.468442, 0, 0, 0, 1, 1,
-0.7807688, 0.2619843, -0.4651276, 0, 0, 0, 1, 1,
-0.7797179, 0.5798168, -2.480757, 0, 0, 0, 1, 1,
-0.7777596, 0.2509638, -1.453753, 0, 0, 0, 1, 1,
-0.7728342, 0.2601606, -0.246177, 0, 0, 0, 1, 1,
-0.7706414, -0.5494836, -3.331205, 0, 0, 0, 1, 1,
-0.769213, -0.3331095, -1.902906, 1, 1, 1, 1, 1,
-0.7573732, -0.4518771, -0.7374423, 1, 1, 1, 1, 1,
-0.7568656, -0.7153518, -1.907667, 1, 1, 1, 1, 1,
-0.7426893, -1.364053, -1.816332, 1, 1, 1, 1, 1,
-0.7335552, 0.4359554, -3.069039, 1, 1, 1, 1, 1,
-0.7314522, -0.5835145, -2.92061, 1, 1, 1, 1, 1,
-0.7307798, -0.7045217, -1.380304, 1, 1, 1, 1, 1,
-0.7246349, -0.1539225, -1.196532, 1, 1, 1, 1, 1,
-0.7181716, 0.2237602, -1.376156, 1, 1, 1, 1, 1,
-0.7168534, -0.8115159, -2.467847, 1, 1, 1, 1, 1,
-0.7142833, -0.3482251, -2.714082, 1, 1, 1, 1, 1,
-0.7131919, -0.3536786, -0.7622312, 1, 1, 1, 1, 1,
-0.7102494, 0.9922546, -0.2613927, 1, 1, 1, 1, 1,
-0.7076164, -1.300196, -1.314673, 1, 1, 1, 1, 1,
-0.7021602, -1.327517, -1.893267, 1, 1, 1, 1, 1,
-0.6937308, 0.1768698, -1.200587, 0, 0, 1, 1, 1,
-0.6905677, 0.5389942, -0.7454369, 1, 0, 0, 1, 1,
-0.6904985, -1.230445, -1.178704, 1, 0, 0, 1, 1,
-0.6864768, -0.27045, -0.3253696, 1, 0, 0, 1, 1,
-0.6860694, 0.07691811, -1.121457, 1, 0, 0, 1, 1,
-0.6860532, 0.4005317, 0.1472601, 1, 0, 0, 1, 1,
-0.6835546, -0.01280142, -2.242944, 0, 0, 0, 1, 1,
-0.6831668, 1.205598, 0.2298728, 0, 0, 0, 1, 1,
-0.6809211, 0.3464674, -1.96761, 0, 0, 0, 1, 1,
-0.6713012, -0.006450329, -1.531146, 0, 0, 0, 1, 1,
-0.6641519, 1.032645, -2.554374, 0, 0, 0, 1, 1,
-0.6632805, 0.5335727, 0.6213432, 0, 0, 0, 1, 1,
-0.6607538, 0.500991, -1.47582, 0, 0, 0, 1, 1,
-0.6549161, 0.6578549, -0.0183732, 1, 1, 1, 1, 1,
-0.6545862, -1.102808, -2.968481, 1, 1, 1, 1, 1,
-0.6544543, 1.059329, 1.451999, 1, 1, 1, 1, 1,
-0.6529719, -1.094041, -3.16442, 1, 1, 1, 1, 1,
-0.6473224, -0.8003058, -1.846026, 1, 1, 1, 1, 1,
-0.642929, -0.8477781, -1.860312, 1, 1, 1, 1, 1,
-0.6408252, -0.4639472, -2.903361, 1, 1, 1, 1, 1,
-0.6407245, -0.009389057, -0.7482815, 1, 1, 1, 1, 1,
-0.6398556, -0.542062, -2.247407, 1, 1, 1, 1, 1,
-0.6382659, 0.896203, -0.8737131, 1, 1, 1, 1, 1,
-0.6320968, 0.8889452, -0.5202543, 1, 1, 1, 1, 1,
-0.6256199, 0.7687932, -0.2391824, 1, 1, 1, 1, 1,
-0.623998, -0.1137777, -1.057334, 1, 1, 1, 1, 1,
-0.6238955, -0.3215747, -1.769086, 1, 1, 1, 1, 1,
-0.6233252, 1.204752, 0.282218, 1, 1, 1, 1, 1,
-0.6229505, 0.592575, -2.240434, 0, 0, 1, 1, 1,
-0.6221192, -0.3414157, -3.057132, 1, 0, 0, 1, 1,
-0.6210201, -0.9231021, -4.756872, 1, 0, 0, 1, 1,
-0.6193808, -1.417656, -3.006313, 1, 0, 0, 1, 1,
-0.6190067, -0.4014011, -1.467328, 1, 0, 0, 1, 1,
-0.6188558, -0.3631294, -1.60763, 1, 0, 0, 1, 1,
-0.6180198, 1.463593, -0.7245135, 0, 0, 0, 1, 1,
-0.6176485, -0.6315611, -2.932001, 0, 0, 0, 1, 1,
-0.6142828, -0.6066725, -2.814363, 0, 0, 0, 1, 1,
-0.6140922, -0.4097535, 0.5267764, 0, 0, 0, 1, 1,
-0.6126425, 1.091803, -1.059754, 0, 0, 0, 1, 1,
-0.6094179, -1.193901, -3.604524, 0, 0, 0, 1, 1,
-0.6089284, -0.9122725, -1.726532, 0, 0, 0, 1, 1,
-0.605673, -0.3862437, -2.822969, 1, 1, 1, 1, 1,
-0.5913311, 0.6847453, -2.595942, 1, 1, 1, 1, 1,
-0.5904728, 2.147878, 1.258175, 1, 1, 1, 1, 1,
-0.5848656, 0.5479042, -1.509885, 1, 1, 1, 1, 1,
-0.5752395, 1.67413, -0.8634152, 1, 1, 1, 1, 1,
-0.5695215, -1.256024, -0.9568332, 1, 1, 1, 1, 1,
-0.5590539, -0.5116766, -2.281748, 1, 1, 1, 1, 1,
-0.5564958, 0.02150832, -2.098593, 1, 1, 1, 1, 1,
-0.5550253, -1.654241, -2.576202, 1, 1, 1, 1, 1,
-0.554642, -1.008431, -4.975351, 1, 1, 1, 1, 1,
-0.549987, -0.1986071, -2.359131, 1, 1, 1, 1, 1,
-0.5477389, -0.7461274, -3.811479, 1, 1, 1, 1, 1,
-0.5459348, -0.6882718, -1.522122, 1, 1, 1, 1, 1,
-0.5358794, -1.322425, -3.592539, 1, 1, 1, 1, 1,
-0.5339713, 0.07222117, -2.281417, 1, 1, 1, 1, 1,
-0.5330781, -0.01937444, -1.544099, 0, 0, 1, 1, 1,
-0.5308207, 0.4266948, -2.778524, 1, 0, 0, 1, 1,
-0.5258175, -1.010941, -3.683303, 1, 0, 0, 1, 1,
-0.5251644, 0.5158967, 0.8267215, 1, 0, 0, 1, 1,
-0.5174666, 0.1548399, -3.136322, 1, 0, 0, 1, 1,
-0.5151619, 0.7810717, -0.05272456, 1, 0, 0, 1, 1,
-0.5113258, -0.8708824, -0.8903251, 0, 0, 0, 1, 1,
-0.5074679, 0.6578906, -1.360692, 0, 0, 0, 1, 1,
-0.507172, 0.9351157, -0.5623615, 0, 0, 0, 1, 1,
-0.5065694, 0.5516578, -0.8553643, 0, 0, 0, 1, 1,
-0.5059257, -0.6115056, -2.867924, 0, 0, 0, 1, 1,
-0.5019755, -1.379498, -2.150835, 0, 0, 0, 1, 1,
-0.4990744, -0.4265293, -3.095221, 0, 0, 0, 1, 1,
-0.4981425, 1.863284, 1.269668, 1, 1, 1, 1, 1,
-0.4950526, -0.0541678, -1.071611, 1, 1, 1, 1, 1,
-0.492596, -0.3106627, -2.058684, 1, 1, 1, 1, 1,
-0.4900789, -2.765054, -3.094416, 1, 1, 1, 1, 1,
-0.4883574, -1.552838, -2.707187, 1, 1, 1, 1, 1,
-0.4851342, 0.04761123, -2.556145, 1, 1, 1, 1, 1,
-0.4835184, 0.3226289, -1.062666, 1, 1, 1, 1, 1,
-0.4813825, 0.3059287, -0.6191002, 1, 1, 1, 1, 1,
-0.4791506, -0.7622901, -2.282681, 1, 1, 1, 1, 1,
-0.4699588, -0.1205103, -0.543225, 1, 1, 1, 1, 1,
-0.4676029, -1.787326, -0.9802377, 1, 1, 1, 1, 1,
-0.465006, -0.7932438, -3.065556, 1, 1, 1, 1, 1,
-0.4612522, -0.6304141, -2.796252, 1, 1, 1, 1, 1,
-0.458531, 0.8924775, -2.190394, 1, 1, 1, 1, 1,
-0.4584727, 0.8653014, -0.5277328, 1, 1, 1, 1, 1,
-0.4568138, 0.6471925, -0.2715089, 0, 0, 1, 1, 1,
-0.452149, -3.142764, -4.93703, 1, 0, 0, 1, 1,
-0.4480965, -1.222291, -2.785517, 1, 0, 0, 1, 1,
-0.4462011, 0.1933118, -1.564649, 1, 0, 0, 1, 1,
-0.4454594, -0.6670638, -3.721051, 1, 0, 0, 1, 1,
-0.4424147, -0.001578965, -2.744192, 1, 0, 0, 1, 1,
-0.4374754, 0.4061722, -1.903542, 0, 0, 0, 1, 1,
-0.4298882, 1.012926, 0.1771623, 0, 0, 0, 1, 1,
-0.4219569, 1.150208, -1.615124, 0, 0, 0, 1, 1,
-0.4192156, 1.909655, -0.2481994, 0, 0, 0, 1, 1,
-0.4179825, -0.9666806, -1.349395, 0, 0, 0, 1, 1,
-0.4170347, -2.085388, -3.00399, 0, 0, 0, 1, 1,
-0.4166795, -0.7211754, -3.648269, 0, 0, 0, 1, 1,
-0.4151854, 1.552288, 2.593961, 1, 1, 1, 1, 1,
-0.4119719, 0.3286853, -0.008078747, 1, 1, 1, 1, 1,
-0.4083662, 0.9152113, 0.9941506, 1, 1, 1, 1, 1,
-0.4074024, -1.036913, -3.280267, 1, 1, 1, 1, 1,
-0.4039516, -0.6872508, -2.406858, 1, 1, 1, 1, 1,
-0.3998689, 0.4872961, -0.2267078, 1, 1, 1, 1, 1,
-0.3931115, -0.4572888, 0.4954779, 1, 1, 1, 1, 1,
-0.3925141, -0.8542475, -4.93206, 1, 1, 1, 1, 1,
-0.3913543, 0.7941436, -0.3372854, 1, 1, 1, 1, 1,
-0.391016, 0.05397071, -2.542244, 1, 1, 1, 1, 1,
-0.3891532, 0.1446773, -1.552362, 1, 1, 1, 1, 1,
-0.3854691, -0.2980777, -1.764906, 1, 1, 1, 1, 1,
-0.3796166, 0.1320131, -2.096273, 1, 1, 1, 1, 1,
-0.3771818, -1.863992, -2.517021, 1, 1, 1, 1, 1,
-0.377052, -2.459314, -3.602185, 1, 1, 1, 1, 1,
-0.3742625, -0.5625907, -3.799597, 0, 0, 1, 1, 1,
-0.3702203, -1.925669, -3.051881, 1, 0, 0, 1, 1,
-0.3693923, -0.1123786, -1.717799, 1, 0, 0, 1, 1,
-0.3689542, -1.471148, -3.689808, 1, 0, 0, 1, 1,
-0.3664816, -1.303463, -0.5609015, 1, 0, 0, 1, 1,
-0.359591, 1.028187, 1.112114, 1, 0, 0, 1, 1,
-0.3575986, -0.3482735, -2.808714, 0, 0, 0, 1, 1,
-0.3555484, 1.135053, -1.587497, 0, 0, 0, 1, 1,
-0.3550062, -0.2748738, -4.287941, 0, 0, 0, 1, 1,
-0.3533426, -1.365195, -4.059618, 0, 0, 0, 1, 1,
-0.351786, 1.112718, 0.5233484, 0, 0, 0, 1, 1,
-0.3514439, -0.8272692, -1.903796, 0, 0, 0, 1, 1,
-0.3465691, -0.1477772, -1.434965, 0, 0, 0, 1, 1,
-0.3461762, 1.278715, -0.09866179, 1, 1, 1, 1, 1,
-0.3459027, 0.8040944, 1.32088, 1, 1, 1, 1, 1,
-0.341361, 0.08381313, -2.092013, 1, 1, 1, 1, 1,
-0.3385468, 0.9582133, 0.7990754, 1, 1, 1, 1, 1,
-0.3337622, 0.6858603, -1.255986, 1, 1, 1, 1, 1,
-0.3282619, 1.029421, -0.8566121, 1, 1, 1, 1, 1,
-0.321733, 0.9389092, 0.3194323, 1, 1, 1, 1, 1,
-0.3200464, 0.3789945, -0.8296548, 1, 1, 1, 1, 1,
-0.315669, -0.4797207, -2.148896, 1, 1, 1, 1, 1,
-0.3052327, -1.058923, -3.237435, 1, 1, 1, 1, 1,
-0.3021809, -0.7693967, -1.198529, 1, 1, 1, 1, 1,
-0.3006023, -0.08350259, -2.974338, 1, 1, 1, 1, 1,
-0.2967685, -1.966258, -4.366735, 1, 1, 1, 1, 1,
-0.2953214, -0.6760606, -2.753402, 1, 1, 1, 1, 1,
-0.2879808, 1.408097, -0.6665375, 1, 1, 1, 1, 1,
-0.2875361, -1.307311, -2.306063, 0, 0, 1, 1, 1,
-0.2854387, 0.8357393, 0.8034227, 1, 0, 0, 1, 1,
-0.2850046, 0.4265461, 0.8988821, 1, 0, 0, 1, 1,
-0.2841265, -0.2452304, -2.70951, 1, 0, 0, 1, 1,
-0.281731, 0.6571591, -1.245992, 1, 0, 0, 1, 1,
-0.2801079, 0.9075078, -0.3356967, 1, 0, 0, 1, 1,
-0.2705382, -3.404184, -2.464421, 0, 0, 0, 1, 1,
-0.2693256, 1.123899, -0.9990278, 0, 0, 0, 1, 1,
-0.2671997, 0.7135158, -1.756447, 0, 0, 0, 1, 1,
-0.2643495, 1.03303, -0.4104536, 0, 0, 0, 1, 1,
-0.2609399, -0.6094909, -2.209906, 0, 0, 0, 1, 1,
-0.256738, 1.210881, 0.9437509, 0, 0, 0, 1, 1,
-0.2549381, 0.9687586, 1.07173, 0, 0, 0, 1, 1,
-0.2533732, -0.3192677, -2.105703, 1, 1, 1, 1, 1,
-0.2509227, -0.4871081, -1.573629, 1, 1, 1, 1, 1,
-0.2504728, -0.714245, -1.615691, 1, 1, 1, 1, 1,
-0.2473043, -0.5082098, -1.702676, 1, 1, 1, 1, 1,
-0.2442554, 0.9560182, -0.03795822, 1, 1, 1, 1, 1,
-0.2418963, -0.5024783, -2.774236, 1, 1, 1, 1, 1,
-0.2296653, 1.215765, -0.2139446, 1, 1, 1, 1, 1,
-0.2271235, -0.5004506, -3.351306, 1, 1, 1, 1, 1,
-0.2262214, 0.5636202, 0.3190588, 1, 1, 1, 1, 1,
-0.2241337, -0.1231718, -2.999281, 1, 1, 1, 1, 1,
-0.2221851, 0.3785558, -0.4977902, 1, 1, 1, 1, 1,
-0.2197543, 0.1324149, -2.472054, 1, 1, 1, 1, 1,
-0.2160126, -0.8304149, -3.213442, 1, 1, 1, 1, 1,
-0.2143956, 0.954879, -1.117482, 1, 1, 1, 1, 1,
-0.2142209, -0.02770851, -1.535226, 1, 1, 1, 1, 1,
-0.2115354, 0.7442178, 1.771481, 0, 0, 1, 1, 1,
-0.2074715, -0.7913406, -3.640914, 1, 0, 0, 1, 1,
-0.2037301, 0.2592389, -0.2743532, 1, 0, 0, 1, 1,
-0.2000671, 1.46306, -0.8946152, 1, 0, 0, 1, 1,
-0.1987765, -0.5050631, -0.6335316, 1, 0, 0, 1, 1,
-0.1986953, -1.361416, -3.807509, 1, 0, 0, 1, 1,
-0.1969481, 1.167144, -1.013357, 0, 0, 0, 1, 1,
-0.1934763, -0.9197514, -2.361298, 0, 0, 0, 1, 1,
-0.1925891, -0.1039428, -2.397095, 0, 0, 0, 1, 1,
-0.1920713, 0.72435, 0.3073379, 0, 0, 0, 1, 1,
-0.1895722, -0.2099308, -0.7198468, 0, 0, 0, 1, 1,
-0.1856562, 0.6463242, -1.250676, 0, 0, 0, 1, 1,
-0.1837439, -1.811795, -4.31873, 0, 0, 0, 1, 1,
-0.183708, 0.4238262, -0.731055, 1, 1, 1, 1, 1,
-0.1823273, -0.7920732, -2.564589, 1, 1, 1, 1, 1,
-0.1763161, 1.346225, -0.1564499, 1, 1, 1, 1, 1,
-0.1732953, 0.5918695, 1.008738, 1, 1, 1, 1, 1,
-0.1721645, -0.2369747, -3.663031, 1, 1, 1, 1, 1,
-0.17052, -0.2739804, -1.395985, 1, 1, 1, 1, 1,
-0.169617, 1.028968, -0.4112739, 1, 1, 1, 1, 1,
-0.1658443, -0.2679244, -2.694327, 1, 1, 1, 1, 1,
-0.1637389, -1.89572, -2.90296, 1, 1, 1, 1, 1,
-0.1629833, 0.3209697, 0.5354839, 1, 1, 1, 1, 1,
-0.1609687, 0.6080142, -0.3593554, 1, 1, 1, 1, 1,
-0.1562997, 1.088899, 0.01024229, 1, 1, 1, 1, 1,
-0.1547421, 0.4724809, 0.2556535, 1, 1, 1, 1, 1,
-0.1547261, -0.597444, -5.701084, 1, 1, 1, 1, 1,
-0.1538088, 2.086002, -0.7070621, 1, 1, 1, 1, 1,
-0.1529951, -0.4226329, -0.07836861, 0, 0, 1, 1, 1,
-0.1519931, -1.036931, -2.912371, 1, 0, 0, 1, 1,
-0.1463487, 0.5382453, -0.3827698, 1, 0, 0, 1, 1,
-0.1367574, -0.3144221, -3.272482, 1, 0, 0, 1, 1,
-0.1282954, 1.878025, -1.934052, 1, 0, 0, 1, 1,
-0.1282183, 0.9399632, 0.1741367, 1, 0, 0, 1, 1,
-0.1269228, -0.1051254, -2.944868, 0, 0, 0, 1, 1,
-0.126293, 0.4978982, -0.4747224, 0, 0, 0, 1, 1,
-0.1258599, -0.9372702, -4.473369, 0, 0, 0, 1, 1,
-0.1249639, -0.6881073, -3.863376, 0, 0, 0, 1, 1,
-0.1245202, -1.912315, -3.685006, 0, 0, 0, 1, 1,
-0.1196949, -0.08950901, -1.770491, 0, 0, 0, 1, 1,
-0.1146672, 0.354184, -0.7818756, 0, 0, 0, 1, 1,
-0.1142408, 1.188171, -1.112193, 1, 1, 1, 1, 1,
-0.1129663, -1.22716, -1.999169, 1, 1, 1, 1, 1,
-0.1112866, 0.5029687, 0.1399675, 1, 1, 1, 1, 1,
-0.1108098, 1.062164, 1.594837, 1, 1, 1, 1, 1,
-0.1055797, -0.002150112, -1.191163, 1, 1, 1, 1, 1,
-0.1049557, 0.1251915, -0.7103351, 1, 1, 1, 1, 1,
-0.1026079, -1.072243, -2.817262, 1, 1, 1, 1, 1,
-0.09946018, 1.563262, 1.703892, 1, 1, 1, 1, 1,
-0.09606377, -0.1701647, -2.842552, 1, 1, 1, 1, 1,
-0.09511039, 0.8694054, -0.9094781, 1, 1, 1, 1, 1,
-0.09330802, 0.1934763, 0.007246051, 1, 1, 1, 1, 1,
-0.09273754, 1.160537, -0.9187446, 1, 1, 1, 1, 1,
-0.0926028, -0.822978, -0.9994875, 1, 1, 1, 1, 1,
-0.08995051, -0.2884619, -3.157058, 1, 1, 1, 1, 1,
-0.08909827, -0.2772031, -3.396778, 1, 1, 1, 1, 1,
-0.08023614, -0.7168478, -0.9772794, 0, 0, 1, 1, 1,
-0.07683533, -1.693961, -2.107562, 1, 0, 0, 1, 1,
-0.07212612, -1.028554, -3.619551, 1, 0, 0, 1, 1,
-0.06726611, -0.262301, -1.411078, 1, 0, 0, 1, 1,
-0.06135283, 0.7238798, -1.61518, 1, 0, 0, 1, 1,
-0.05723977, 0.1800943, -0.01912077, 1, 0, 0, 1, 1,
-0.0556169, 1.214964, 0.2784327, 0, 0, 0, 1, 1,
-0.05311056, 0.07352658, -0.9496887, 0, 0, 0, 1, 1,
-0.05267508, 0.08943301, -0.5530333, 0, 0, 0, 1, 1,
-0.05118055, -0.2198139, -3.875463, 0, 0, 0, 1, 1,
-0.04959792, -1.860893, -1.916859, 0, 0, 0, 1, 1,
-0.04941224, 0.1689342, -0.1716706, 0, 0, 0, 1, 1,
-0.04661147, -0.3764218, -1.799454, 0, 0, 0, 1, 1,
-0.04473614, 0.6849901, -0.4893351, 1, 1, 1, 1, 1,
-0.04404533, 0.3544165, 1.034367, 1, 1, 1, 1, 1,
-0.04051543, -1.337814, -2.126721, 1, 1, 1, 1, 1,
-0.03907773, -0.4743953, -1.577148, 1, 1, 1, 1, 1,
-0.03741551, -0.5933509, -4.416026, 1, 1, 1, 1, 1,
-0.0371753, 1.023898, 1.178743, 1, 1, 1, 1, 1,
-0.03320025, 0.8733771, -2.094111, 1, 1, 1, 1, 1,
-0.03130344, 0.07669895, -0.8834412, 1, 1, 1, 1, 1,
-0.02796959, -0.5027732, -3.618846, 1, 1, 1, 1, 1,
-0.02559223, -1.823719, -2.364341, 1, 1, 1, 1, 1,
-0.02227742, 1.560726, -0.3430125, 1, 1, 1, 1, 1,
-0.01836977, -0.5662357, -3.179673, 1, 1, 1, 1, 1,
-0.01805351, -2.098469, -3.760853, 1, 1, 1, 1, 1,
-0.003013015, 1.341227, -0.5728024, 1, 1, 1, 1, 1,
-0.002817224, 0.8933808, 0.7686194, 1, 1, 1, 1, 1,
-0.001792945, 0.6103396, -2.257638, 0, 0, 1, 1, 1,
0.007070485, 0.3978795, 0.7871973, 1, 0, 0, 1, 1,
0.009779765, -0.1426154, 2.964525, 1, 0, 0, 1, 1,
0.01105617, 0.7126334, -2.305338, 1, 0, 0, 1, 1,
0.01583116, -1.236795, 2.842901, 1, 0, 0, 1, 1,
0.01599752, 1.970057, -1.175333, 1, 0, 0, 1, 1,
0.0200143, 0.138573, -0.8616348, 0, 0, 0, 1, 1,
0.02745908, -0.7539126, 3.092194, 0, 0, 0, 1, 1,
0.03022207, -0.6268284, 2.975829, 0, 0, 0, 1, 1,
0.0311658, -1.564927, 3.021799, 0, 0, 0, 1, 1,
0.03564254, 0.8814805, 0.3254707, 0, 0, 0, 1, 1,
0.03887487, -1.524267, 2.021137, 0, 0, 0, 1, 1,
0.04077693, 2.655751, -0.08857282, 0, 0, 0, 1, 1,
0.04791415, 1.401221, -0.1838173, 1, 1, 1, 1, 1,
0.05078661, -0.227887, 2.159304, 1, 1, 1, 1, 1,
0.05247515, 1.658024, -0.4787813, 1, 1, 1, 1, 1,
0.05290509, -2.245208, 2.04857, 1, 1, 1, 1, 1,
0.05397596, -1.748142, 5.752755, 1, 1, 1, 1, 1,
0.05878325, -0.5702833, 2.583951, 1, 1, 1, 1, 1,
0.06252543, 1.248364, -0.06461794, 1, 1, 1, 1, 1,
0.0659245, -1.268523, 4.066051, 1, 1, 1, 1, 1,
0.0662837, 1.326488, -0.3647701, 1, 1, 1, 1, 1,
0.06729304, -1.715886, 2.858641, 1, 1, 1, 1, 1,
0.07016916, -0.8302839, 3.931949, 1, 1, 1, 1, 1,
0.07139532, -0.8135011, 3.382744, 1, 1, 1, 1, 1,
0.07341089, 0.4094068, 1.015248, 1, 1, 1, 1, 1,
0.07370242, 0.1351656, -1.585944, 1, 1, 1, 1, 1,
0.07383177, -0.6326195, 3.389374, 1, 1, 1, 1, 1,
0.07394375, -0.4484689, 4.325894, 0, 0, 1, 1, 1,
0.07646168, -1.488362, 2.846074, 1, 0, 0, 1, 1,
0.0769047, 0.03684241, 2.221582, 1, 0, 0, 1, 1,
0.07909332, 0.5936664, -0.2834841, 1, 0, 0, 1, 1,
0.0795183, -1.271196, 2.794608, 1, 0, 0, 1, 1,
0.08341612, 0.06748549, 1.957352, 1, 0, 0, 1, 1,
0.08497225, 1.450199, -1.273389, 0, 0, 0, 1, 1,
0.08528062, -0.8389018, 2.048326, 0, 0, 0, 1, 1,
0.08595542, -0.1158766, 3.239366, 0, 0, 0, 1, 1,
0.08659434, 0.605311, -0.2637284, 0, 0, 0, 1, 1,
0.08779843, -1.463795, 4.264898, 0, 0, 0, 1, 1,
0.09386503, -0.1802857, 2.870855, 0, 0, 0, 1, 1,
0.09427101, -0.8351292, 3.749141, 0, 0, 0, 1, 1,
0.09454691, 1.062508, -0.1245664, 1, 1, 1, 1, 1,
0.09804729, -0.6445808, 1.86902, 1, 1, 1, 1, 1,
0.09839904, 1.156952, -0.3821681, 1, 1, 1, 1, 1,
0.09999492, -0.46437, 1.627628, 1, 1, 1, 1, 1,
0.101882, 0.8677883, 0.7819552, 1, 1, 1, 1, 1,
0.1021423, 0.3844008, -0.573157, 1, 1, 1, 1, 1,
0.1052167, 0.7633207, 1.500092, 1, 1, 1, 1, 1,
0.1065342, -0.1256487, 0.8056617, 1, 1, 1, 1, 1,
0.1096873, 0.9508218, 0.5357521, 1, 1, 1, 1, 1,
0.113147, -1.142529, 1.388045, 1, 1, 1, 1, 1,
0.1204977, 0.8335031, -1.350716, 1, 1, 1, 1, 1,
0.1207048, -1.200449, 2.65955, 1, 1, 1, 1, 1,
0.1272737, -2.985935, 3.874956, 1, 1, 1, 1, 1,
0.1289186, -0.4032431, 0.146727, 1, 1, 1, 1, 1,
0.1357215, -0.1136267, 1.828398, 1, 1, 1, 1, 1,
0.1362989, -0.5036859, 4.137388, 0, 0, 1, 1, 1,
0.140311, 1.36536, -0.05149835, 1, 0, 0, 1, 1,
0.1430497, -0.2951581, 3.21224, 1, 0, 0, 1, 1,
0.1465089, -0.6045595, 3.374243, 1, 0, 0, 1, 1,
0.1481143, -0.4832726, 1.783486, 1, 0, 0, 1, 1,
0.1514225, -0.9192778, 4.646485, 1, 0, 0, 1, 1,
0.1524431, -1.400023, 3.05929, 0, 0, 0, 1, 1,
0.1567113, 1.574937, -1.263229, 0, 0, 0, 1, 1,
0.1572787, -0.7289012, 1.992288, 0, 0, 0, 1, 1,
0.1579156, -1.197121, 3.16348, 0, 0, 0, 1, 1,
0.1615202, -0.5652121, 4.549427, 0, 0, 0, 1, 1,
0.1660125, 0.5899332, 0.4382793, 0, 0, 0, 1, 1,
0.1729712, 0.3271954, 0.9070511, 0, 0, 0, 1, 1,
0.1763314, 0.03450749, 2.077032, 1, 1, 1, 1, 1,
0.1778375, 0.1819888, 2.741088, 1, 1, 1, 1, 1,
0.1786856, 0.1877246, 2.754056, 1, 1, 1, 1, 1,
0.1791895, -0.01229227, 0.7648348, 1, 1, 1, 1, 1,
0.18137, 1.101875, 0.7829335, 1, 1, 1, 1, 1,
0.1818315, 0.6654717, -0.4678046, 1, 1, 1, 1, 1,
0.1861291, 0.650333, 0.7365994, 1, 1, 1, 1, 1,
0.190192, 0.7920248, 0.3596953, 1, 1, 1, 1, 1,
0.1935135, -0.229231, 1.758436, 1, 1, 1, 1, 1,
0.198294, -1.324875, 2.377187, 1, 1, 1, 1, 1,
0.1995039, -0.3639381, 2.14728, 1, 1, 1, 1, 1,
0.2133262, 0.1522238, 0.9598755, 1, 1, 1, 1, 1,
0.2141252, 1.006693, -0.810488, 1, 1, 1, 1, 1,
0.2141376, 0.4099018, 0.264661, 1, 1, 1, 1, 1,
0.2221892, 0.1300721, 1.696992, 1, 1, 1, 1, 1,
0.2272458, 0.1098084, 1.416727, 0, 0, 1, 1, 1,
0.2274873, 1.835466, -0.3823151, 1, 0, 0, 1, 1,
0.2313481, 1.346192, 1.149925, 1, 0, 0, 1, 1,
0.2368512, 1.969352, -0.2282777, 1, 0, 0, 1, 1,
0.2373256, -1.960413, 3.821631, 1, 0, 0, 1, 1,
0.2377155, -0.1379418, 1.986095, 1, 0, 0, 1, 1,
0.238196, -0.08454118, 1.22392, 0, 0, 0, 1, 1,
0.2410109, 0.8955579, -0.1295143, 0, 0, 0, 1, 1,
0.2432808, 1.003563, 0.1851516, 0, 0, 0, 1, 1,
0.2443468, -0.5336251, 2.424879, 0, 0, 0, 1, 1,
0.2447429, -2.092706, 3.594908, 0, 0, 0, 1, 1,
0.2498509, -1.304603, 1.839668, 0, 0, 0, 1, 1,
0.2506551, -0.3767667, 3.455925, 0, 0, 0, 1, 1,
0.2522289, 0.2913407, 1.615768, 1, 1, 1, 1, 1,
0.256194, -3.174963, 3.406762, 1, 1, 1, 1, 1,
0.2586335, 0.686001, 0.4352794, 1, 1, 1, 1, 1,
0.2628574, 0.6643357, 2.386803, 1, 1, 1, 1, 1,
0.2630106, 0.2840597, 0.6421081, 1, 1, 1, 1, 1,
0.2648313, -0.5395352, 1.494186, 1, 1, 1, 1, 1,
0.2651332, -0.1257363, 3.009122, 1, 1, 1, 1, 1,
0.2735028, 2.327854, 0.03625983, 1, 1, 1, 1, 1,
0.2749833, 0.6911353, 0.2416819, 1, 1, 1, 1, 1,
0.2809129, -1.153972, 2.249941, 1, 1, 1, 1, 1,
0.2829599, 0.6002352, 0.1491112, 1, 1, 1, 1, 1,
0.289291, -1.119323, 2.278774, 1, 1, 1, 1, 1,
0.2946116, -0.9885828, 1.586794, 1, 1, 1, 1, 1,
0.2999748, -0.7827653, 1.297995, 1, 1, 1, 1, 1,
0.3014746, -1.109267, 2.703227, 1, 1, 1, 1, 1,
0.3014984, 0.2507249, 0.763342, 0, 0, 1, 1, 1,
0.3033336, -0.7290574, 5.193305, 1, 0, 0, 1, 1,
0.3043212, -0.6034498, 2.44199, 1, 0, 0, 1, 1,
0.3044768, -1.502115, 2.037826, 1, 0, 0, 1, 1,
0.3045329, 0.5401286, 1.07421, 1, 0, 0, 1, 1,
0.3075087, -1.08289, 2.802611, 1, 0, 0, 1, 1,
0.3118136, 0.9857979, -0.5111611, 0, 0, 0, 1, 1,
0.3135829, 0.9972591, -0.3556576, 0, 0, 0, 1, 1,
0.3148925, -0.5912721, 3.568798, 0, 0, 0, 1, 1,
0.3177779, -1.968116, 2.43628, 0, 0, 0, 1, 1,
0.3209896, 0.8220094, -1.085375, 0, 0, 0, 1, 1,
0.3234098, -0.3032686, 2.503316, 0, 0, 0, 1, 1,
0.3243468, 0.1218274, -0.2813106, 0, 0, 0, 1, 1,
0.3270995, -0.3498538, 4.395938, 1, 1, 1, 1, 1,
0.3306351, 1.477883, -1.083169, 1, 1, 1, 1, 1,
0.3325399, 0.7578509, -0.4358481, 1, 1, 1, 1, 1,
0.3333602, 1.370996, -0.07036287, 1, 1, 1, 1, 1,
0.3355375, 0.5282722, 0.7513497, 1, 1, 1, 1, 1,
0.337747, 0.3565452, 0.6160758, 1, 1, 1, 1, 1,
0.3426944, 1.382323, -0.4417376, 1, 1, 1, 1, 1,
0.3456447, 1.378295, 0.3961461, 1, 1, 1, 1, 1,
0.3479366, -0.2710405, 3.139887, 1, 1, 1, 1, 1,
0.3480788, -1.160969, 3.058465, 1, 1, 1, 1, 1,
0.3507423, -0.55771, 3.463852, 1, 1, 1, 1, 1,
0.3527524, 0.4442057, 1.564324, 1, 1, 1, 1, 1,
0.3540976, 1.060191, -1.149708, 1, 1, 1, 1, 1,
0.3552655, -1.648776, 4.162029, 1, 1, 1, 1, 1,
0.3574976, -1.479791, 4.03772, 1, 1, 1, 1, 1,
0.3582861, 0.6485984, -0.6846672, 0, 0, 1, 1, 1,
0.3619827, 0.257592, 1.253026, 1, 0, 0, 1, 1,
0.3639927, -0.9506024, 2.452925, 1, 0, 0, 1, 1,
0.3643802, 0.509914, 1.041778, 1, 0, 0, 1, 1,
0.3656358, 2.132558, -0.9115247, 1, 0, 0, 1, 1,
0.3687458, 0.1818071, 2.852504, 1, 0, 0, 1, 1,
0.3735123, 0.7602798, 1.912445, 0, 0, 0, 1, 1,
0.3753477, 0.9933139, 0.557084, 0, 0, 0, 1, 1,
0.3763759, -0.3967988, 3.001228, 0, 0, 0, 1, 1,
0.379005, 0.5306101, 2.695532, 0, 0, 0, 1, 1,
0.3815417, 2.602092, 0.2010815, 0, 0, 0, 1, 1,
0.3842026, -0.5482719, 1.987028, 0, 0, 0, 1, 1,
0.384676, -0.8535049, 3.944722, 0, 0, 0, 1, 1,
0.384999, -1.233335, 3.517097, 1, 1, 1, 1, 1,
0.3864351, 1.674545, 0.1227921, 1, 1, 1, 1, 1,
0.3905651, 0.8563508, 1.447287, 1, 1, 1, 1, 1,
0.3920415, 1.64524, 1.18543, 1, 1, 1, 1, 1,
0.392834, 0.1878477, 1.914718, 1, 1, 1, 1, 1,
0.3954138, -0.1308457, 2.178885, 1, 1, 1, 1, 1,
0.3967077, -0.2443388, 1.840106, 1, 1, 1, 1, 1,
0.3986305, -0.05298204, 1.786531, 1, 1, 1, 1, 1,
0.3990602, -0.205859, 2.696943, 1, 1, 1, 1, 1,
0.4011702, -0.1175055, 1.85697, 1, 1, 1, 1, 1,
0.4012801, -1.081567, 2.827203, 1, 1, 1, 1, 1,
0.4042743, 0.6977679, -0.4326198, 1, 1, 1, 1, 1,
0.4044628, 0.9463795, -0.9481845, 1, 1, 1, 1, 1,
0.4054858, 0.9005956, 1.724105, 1, 1, 1, 1, 1,
0.4091441, 1.043031, 0.7327476, 1, 1, 1, 1, 1,
0.4117874, 0.01416213, 1.1598, 0, 0, 1, 1, 1,
0.4126427, 0.3528813, -0.7134643, 1, 0, 0, 1, 1,
0.4130036, 1.499837, 0.256881, 1, 0, 0, 1, 1,
0.4134265, -1.365071, 3.405062, 1, 0, 0, 1, 1,
0.4162479, -0.5402839, 1.686418, 1, 0, 0, 1, 1,
0.4218006, -1.594846, 1.596852, 1, 0, 0, 1, 1,
0.4228783, -0.3104098, 3.525308, 0, 0, 0, 1, 1,
0.4258894, -0.05237927, 0.7872021, 0, 0, 0, 1, 1,
0.4263463, 1.104532, -1.658642, 0, 0, 0, 1, 1,
0.428792, 0.2026598, 2.679562, 0, 0, 0, 1, 1,
0.429026, -0.2271276, 1.981782, 0, 0, 0, 1, 1,
0.4301408, -0.638328, 1.743536, 0, 0, 0, 1, 1,
0.4336427, -0.3973783, 1.039503, 0, 0, 0, 1, 1,
0.4340841, -0.3978317, -0.1601726, 1, 1, 1, 1, 1,
0.4389288, -0.2678361, 1.72459, 1, 1, 1, 1, 1,
0.4393486, 0.30336, 0.6094382, 1, 1, 1, 1, 1,
0.4423118, 0.09826387, 0.5317996, 1, 1, 1, 1, 1,
0.4530374, -0.9339026, 1.172125, 1, 1, 1, 1, 1,
0.4564963, 0.709725, 2.268795, 1, 1, 1, 1, 1,
0.458295, -0.06137254, 1.164142, 1, 1, 1, 1, 1,
0.4603168, 0.2999969, 2.268293, 1, 1, 1, 1, 1,
0.471083, 0.09324824, 1.60849, 1, 1, 1, 1, 1,
0.4796519, -0.2721159, 2.053907, 1, 1, 1, 1, 1,
0.4803582, 0.4357995, -0.01887405, 1, 1, 1, 1, 1,
0.4820129, 0.7108988, 1.622941, 1, 1, 1, 1, 1,
0.486081, 0.8299718, -0.3573808, 1, 1, 1, 1, 1,
0.4882473, -1.126424, 2.193172, 1, 1, 1, 1, 1,
0.4905646, -0.3802125, 3.402002, 1, 1, 1, 1, 1,
0.4916589, 0.08068331, 0.8286753, 0, 0, 1, 1, 1,
0.4937603, -0.6494606, 1.097778, 1, 0, 0, 1, 1,
0.4944133, -0.6118903, 1.606281, 1, 0, 0, 1, 1,
0.4981546, 0.2384197, 1.755903, 1, 0, 0, 1, 1,
0.5054443, 1.267933, -0.932464, 1, 0, 0, 1, 1,
0.5059296, -0.03903423, 0.8925122, 1, 0, 0, 1, 1,
0.5303645, 0.1412503, 0.8234702, 0, 0, 0, 1, 1,
0.5305625, 0.009236454, 1.184799, 0, 0, 0, 1, 1,
0.5307665, 0.2693226, 0.8953218, 0, 0, 0, 1, 1,
0.5359451, 1.547349, 0.01680432, 0, 0, 0, 1, 1,
0.5363681, 1.277854, 1.686826, 0, 0, 0, 1, 1,
0.5374099, -1.3344, 2.156419, 0, 0, 0, 1, 1,
0.5403728, 0.6861662, 0.6538377, 0, 0, 0, 1, 1,
0.5405768, -1.202133, 3.425908, 1, 1, 1, 1, 1,
0.5479218, 1.280883, 3.593688, 1, 1, 1, 1, 1,
0.5486668, -0.3327986, 2.739206, 1, 1, 1, 1, 1,
0.5547754, -2.013538, 4.663265, 1, 1, 1, 1, 1,
0.5564364, -1.439068, 1.356157, 1, 1, 1, 1, 1,
0.5653033, -0.4659639, 2.306381, 1, 1, 1, 1, 1,
0.5657316, -0.4077883, 3.616663, 1, 1, 1, 1, 1,
0.5702553, -0.6340827, 2.56528, 1, 1, 1, 1, 1,
0.5718192, 1.746158, 0.5055752, 1, 1, 1, 1, 1,
0.5778918, 2.606358, 0.762666, 1, 1, 1, 1, 1,
0.580951, -1.018076, 3.340788, 1, 1, 1, 1, 1,
0.5830227, 0.8665904, 1.486923, 1, 1, 1, 1, 1,
0.5861552, -0.7697046, 2.948693, 1, 1, 1, 1, 1,
0.5876606, 0.2362326, 1.617069, 1, 1, 1, 1, 1,
0.5892703, 1.359497, 0.7624883, 1, 1, 1, 1, 1,
0.5972405, -1.400322, 2.473652, 0, 0, 1, 1, 1,
0.5988189, -0.3005111, 1.969668, 1, 0, 0, 1, 1,
0.6011497, 2.247766, 0.7655097, 1, 0, 0, 1, 1,
0.6035491, -0.270151, 2.05185, 1, 0, 0, 1, 1,
0.6062639, 0.538473, 1.043462, 1, 0, 0, 1, 1,
0.6177882, 0.5972019, -0.4572039, 1, 0, 0, 1, 1,
0.617814, -0.2024437, 1.654684, 0, 0, 0, 1, 1,
0.6181098, 0.4025421, -0.6605344, 0, 0, 0, 1, 1,
0.6204759, 0.3591529, 0.4449392, 0, 0, 0, 1, 1,
0.6431913, -2.45497, 3.173988, 0, 0, 0, 1, 1,
0.6440018, -1.450911, 3.667501, 0, 0, 0, 1, 1,
0.6569434, -0.9298576, 1.184772, 0, 0, 0, 1, 1,
0.6624641, 0.7977924, 0.1738646, 0, 0, 0, 1, 1,
0.6653594, 0.7850704, -1.131421, 1, 1, 1, 1, 1,
0.6664424, 0.9696995, -0.660435, 1, 1, 1, 1, 1,
0.6748423, 0.2843162, 0.4418461, 1, 1, 1, 1, 1,
0.6793305, -0.5029655, 1.360185, 1, 1, 1, 1, 1,
0.6817458, -0.8983861, 2.894172, 1, 1, 1, 1, 1,
0.6843181, 1.567961, 0.09156387, 1, 1, 1, 1, 1,
0.6859763, 1.606145, 0.6195118, 1, 1, 1, 1, 1,
0.6862841, -0.7948866, 4.245223, 1, 1, 1, 1, 1,
0.6864079, -0.5658734, 2.904083, 1, 1, 1, 1, 1,
0.6884438, 0.8071367, 1.652147, 1, 1, 1, 1, 1,
0.6888611, 2.132219, 2.208634, 1, 1, 1, 1, 1,
0.6892469, -1.401988, 2.074242, 1, 1, 1, 1, 1,
0.6900725, 0.920902, 0.4442959, 1, 1, 1, 1, 1,
0.6936413, 0.310581, 1.6236, 1, 1, 1, 1, 1,
0.6940035, 0.9488889, -0.04336457, 1, 1, 1, 1, 1,
0.6951525, -1.34791, 2.473035, 0, 0, 1, 1, 1,
0.7001932, 0.2658086, 1.183719, 1, 0, 0, 1, 1,
0.7060325, -0.1287661, 0.4243316, 1, 0, 0, 1, 1,
0.7063109, -0.2148318, 0.7938843, 1, 0, 0, 1, 1,
0.7118236, -1.048447, 2.534427, 1, 0, 0, 1, 1,
0.7158764, -0.4059638, 1.161358, 1, 0, 0, 1, 1,
0.720468, -1.125363, 1.842091, 0, 0, 0, 1, 1,
0.72058, 1.106623, 0.9456348, 0, 0, 0, 1, 1,
0.7213662, -0.9612445, 3.576591, 0, 0, 0, 1, 1,
0.7231866, -0.4795391, 2.63442, 0, 0, 0, 1, 1,
0.7278253, 1.129507, 0.8446399, 0, 0, 0, 1, 1,
0.7300885, -0.9195861, 2.970497, 0, 0, 0, 1, 1,
0.7326878, -0.135933, 2.920727, 0, 0, 0, 1, 1,
0.7359677, 0.2271218, 1.818656, 1, 1, 1, 1, 1,
0.7369177, 1.157972, 0.9348372, 1, 1, 1, 1, 1,
0.7404667, 0.9203272, 1.611704, 1, 1, 1, 1, 1,
0.7409819, -1.255963, 3.656639, 1, 1, 1, 1, 1,
0.7430035, -1.287488, 2.733169, 1, 1, 1, 1, 1,
0.744821, 0.8539003, 1.070184, 1, 1, 1, 1, 1,
0.7482735, 1.01329, 0.1497111, 1, 1, 1, 1, 1,
0.7484314, 0.1503199, 2.061277, 1, 1, 1, 1, 1,
0.7500063, 0.8325374, 0.3025982, 1, 1, 1, 1, 1,
0.7508493, 1.523195, -1.513141, 1, 1, 1, 1, 1,
0.7547792, -2.135524, 3.314593, 1, 1, 1, 1, 1,
0.755483, -0.08423868, 1.39693, 1, 1, 1, 1, 1,
0.7602404, -0.3507051, 1.659428, 1, 1, 1, 1, 1,
0.7656587, 1.668804, 0.01252865, 1, 1, 1, 1, 1,
0.7705688, 1.0485, -0.3184753, 1, 1, 1, 1, 1,
0.7731025, 0.8011674, 1.676174, 0, 0, 1, 1, 1,
0.7770135, 1.083661, 1.280685, 1, 0, 0, 1, 1,
0.7777225, -1.491716, 2.466301, 1, 0, 0, 1, 1,
0.7781156, -0.2137686, 2.09644, 1, 0, 0, 1, 1,
0.7833917, 0.6053126, 1.211514, 1, 0, 0, 1, 1,
0.7847443, 2.038564, 0.3064924, 1, 0, 0, 1, 1,
0.7862456, 1.17663, -1.355472, 0, 0, 0, 1, 1,
0.7902138, -0.2207276, 0.7474406, 0, 0, 0, 1, 1,
0.7957295, 0.6797945, 2.998268, 0, 0, 0, 1, 1,
0.8083419, 2.705567, 1.85872, 0, 0, 0, 1, 1,
0.8103563, 0.7197354, 0.9642225, 0, 0, 0, 1, 1,
0.8168841, 0.136689, 1.093208, 0, 0, 0, 1, 1,
0.8176271, 0.687968, 1.726113, 0, 0, 0, 1, 1,
0.8195345, 0.9412048, 0.1673286, 1, 1, 1, 1, 1,
0.8197399, 0.3210914, 1.091247, 1, 1, 1, 1, 1,
0.8244188, 1.534534, 1.36384, 1, 1, 1, 1, 1,
0.8307027, 0.2911275, 1.09609, 1, 1, 1, 1, 1,
0.8343794, 0.2615015, 0.5268192, 1, 1, 1, 1, 1,
0.8354993, -0.7778563, 1.643891, 1, 1, 1, 1, 1,
0.8397698, 0.320424, -0.6360773, 1, 1, 1, 1, 1,
0.8420629, 0.9982931, 3.079743, 1, 1, 1, 1, 1,
0.8435974, -0.6735318, -0.3700475, 1, 1, 1, 1, 1,
0.8441761, 1.50246, 1.546799, 1, 1, 1, 1, 1,
0.8449126, -2.891959, 2.529564, 1, 1, 1, 1, 1,
0.8481574, 0.5034508, 0.5968515, 1, 1, 1, 1, 1,
0.8550386, -0.4618753, 2.10029, 1, 1, 1, 1, 1,
0.8561571, 1.860688, 1.74975, 1, 1, 1, 1, 1,
0.859402, -0.2483942, 2.141803, 1, 1, 1, 1, 1,
0.8601686, 0.3007889, -0.6127146, 0, 0, 1, 1, 1,
0.8617878, -0.0710269, 1.401158, 1, 0, 0, 1, 1,
0.8622723, -0.6179752, 2.209291, 1, 0, 0, 1, 1,
0.8740047, 0.3346643, -0.2343143, 1, 0, 0, 1, 1,
0.8817011, -1.388296, 4.763391, 1, 0, 0, 1, 1,
0.8848787, 0.2952632, 1.421732, 1, 0, 0, 1, 1,
0.8857343, 0.8455108, -0.7802805, 0, 0, 0, 1, 1,
0.8942158, 2.086973, 1.077584, 0, 0, 0, 1, 1,
0.8958991, 0.799595, 0.7205046, 0, 0, 0, 1, 1,
0.9002389, 0.5651572, 0.788117, 0, 0, 0, 1, 1,
0.9006357, -1.814062, 4.274987, 0, 0, 0, 1, 1,
0.9008681, -1.061383, 4.359256, 0, 0, 0, 1, 1,
0.9018788, 0.3428301, 1.958605, 0, 0, 0, 1, 1,
0.9080591, 0.1411992, 1.378205, 1, 1, 1, 1, 1,
0.9106156, -0.4939908, 1.464225, 1, 1, 1, 1, 1,
0.9122329, -0.7443587, 0.8815179, 1, 1, 1, 1, 1,
0.9124014, -0.3862726, 0.1302905, 1, 1, 1, 1, 1,
0.9134213, -1.488361, 2.707438, 1, 1, 1, 1, 1,
0.9139486, -0.2571948, 1.990851, 1, 1, 1, 1, 1,
0.9148836, -2.591211, 2.599203, 1, 1, 1, 1, 1,
0.9251852, 1.673575, 1.066461, 1, 1, 1, 1, 1,
0.9269038, 1.1064, 0.2318344, 1, 1, 1, 1, 1,
0.9290171, -0.1564034, 1.497118, 1, 1, 1, 1, 1,
0.9315449, 0.4237224, 1.114574, 1, 1, 1, 1, 1,
0.9340823, 0.7036124, 1.699109, 1, 1, 1, 1, 1,
0.9380302, 0.1230507, 0.4629559, 1, 1, 1, 1, 1,
0.9425578, -1.001021, 2.651184, 1, 1, 1, 1, 1,
0.9428734, -0.4116013, 2.797507, 1, 1, 1, 1, 1,
0.9452861, -1.119173, 1.941205, 0, 0, 1, 1, 1,
0.9480467, 0.2467144, 1.413688, 1, 0, 0, 1, 1,
0.9484618, 0.9084693, -0.4238311, 1, 0, 0, 1, 1,
0.9502171, 1.107751, 1.191532, 1, 0, 0, 1, 1,
0.9555032, -0.5757166, 1.632783, 1, 0, 0, 1, 1,
0.958608, 0.130743, 0.7643929, 1, 0, 0, 1, 1,
0.966702, -1.161148, 3.4384, 0, 0, 0, 1, 1,
0.9683363, -0.3751676, 0.5041185, 0, 0, 0, 1, 1,
0.9703852, -0.5545949, 2.15527, 0, 0, 0, 1, 1,
0.9730975, 1.044721, 0.7896015, 0, 0, 0, 1, 1,
0.9818385, -1.112702, 1.236938, 0, 0, 0, 1, 1,
0.982177, -1.520843, 3.00455, 0, 0, 0, 1, 1,
0.9821843, 0.5336661, 1.075162, 0, 0, 0, 1, 1,
0.9860373, 0.3204035, 0.7779334, 1, 1, 1, 1, 1,
0.9934822, -2.072825, 1.076193, 1, 1, 1, 1, 1,
0.9939041, 0.822158, 1.21628, 1, 1, 1, 1, 1,
0.9975541, 0.5772548, 2.166377, 1, 1, 1, 1, 1,
1.003948, 1.635554, 0.5778784, 1, 1, 1, 1, 1,
1.004078, -2.269017, 0.9064124, 1, 1, 1, 1, 1,
1.005424, -1.4756, 1.81416, 1, 1, 1, 1, 1,
1.006153, -0.8178784, 1.497355, 1, 1, 1, 1, 1,
1.010151, 1.332335, -0.6756505, 1, 1, 1, 1, 1,
1.012609, 1.400289, 1.530506, 1, 1, 1, 1, 1,
1.024095, -0.7490262, 1.969272, 1, 1, 1, 1, 1,
1.034268, -1.664381, 1.412459, 1, 1, 1, 1, 1,
1.040461, 0.5171394, -0.5881517, 1, 1, 1, 1, 1,
1.042181, 0.9519061, -0.1685343, 1, 1, 1, 1, 1,
1.044641, -0.2708433, 2.601116, 1, 1, 1, 1, 1,
1.048427, 0.2460278, 1.832682, 0, 0, 1, 1, 1,
1.048598, -0.4023062, 1.98571, 1, 0, 0, 1, 1,
1.054821, -1.002619, 3.040499, 1, 0, 0, 1, 1,
1.056967, -0.3063202, 1.80808, 1, 0, 0, 1, 1,
1.060137, -0.7433332, 1.434716, 1, 0, 0, 1, 1,
1.065438, 0.9028183, 0.1848041, 1, 0, 0, 1, 1,
1.066267, -0.639351, 0.320403, 0, 0, 0, 1, 1,
1.066767, 0.4995477, 1.878737, 0, 0, 0, 1, 1,
1.072522, 1.648806, 1.510739, 0, 0, 0, 1, 1,
1.076176, 2.115667, -0.09168389, 0, 0, 0, 1, 1,
1.077852, 0.6290069, 0.8426858, 0, 0, 0, 1, 1,
1.086337, 0.8364756, 2.008376, 0, 0, 0, 1, 1,
1.088268, 1.193509, 1.652457, 0, 0, 0, 1, 1,
1.090208, 0.3573823, 2.294401, 1, 1, 1, 1, 1,
1.100345, -1.082726, 1.600345, 1, 1, 1, 1, 1,
1.11452, 2.033048, 0.2467756, 1, 1, 1, 1, 1,
1.114789, 0.6342862, 0.5338803, 1, 1, 1, 1, 1,
1.115524, -0.6908442, 2.174675, 1, 1, 1, 1, 1,
1.119887, 0.7647487, -0.7939268, 1, 1, 1, 1, 1,
1.133469, 0.2864816, 0.9380253, 1, 1, 1, 1, 1,
1.142775, 1.038402, 3.556875, 1, 1, 1, 1, 1,
1.150757, -1.060505, 1.069636, 1, 1, 1, 1, 1,
1.151251, 0.01740717, -0.5420729, 1, 1, 1, 1, 1,
1.154153, -0.315295, 1.675647, 1, 1, 1, 1, 1,
1.157117, -0.7901124, 3.171072, 1, 1, 1, 1, 1,
1.16873, -1.814739, 2.264865, 1, 1, 1, 1, 1,
1.176801, -0.5323099, 3.227202, 1, 1, 1, 1, 1,
1.179555, -0.3338591, 1.10799, 1, 1, 1, 1, 1,
1.180287, -1.110964, 1.241405, 0, 0, 1, 1, 1,
1.182618, 0.5239091, 2.236311, 1, 0, 0, 1, 1,
1.195745, 1.038648, -0.06879548, 1, 0, 0, 1, 1,
1.200003, 1.127329, -0.8968208, 1, 0, 0, 1, 1,
1.201814, 1.558138, -0.2225463, 1, 0, 0, 1, 1,
1.213059, -0.3688305, 2.545886, 1, 0, 0, 1, 1,
1.226869, 0.08950646, -0.124287, 0, 0, 0, 1, 1,
1.227737, -0.6663767, 0.9450454, 0, 0, 0, 1, 1,
1.234113, 1.24989, 2.017005, 0, 0, 0, 1, 1,
1.236151, -0.09197725, 0.4182229, 0, 0, 0, 1, 1,
1.237832, 0.2525152, 1.371501, 0, 0, 0, 1, 1,
1.238761, 0.491311, 1.222121, 0, 0, 0, 1, 1,
1.244889, 0.2337396, 1.523983, 0, 0, 0, 1, 1,
1.266303, 0.06748678, -0.4979685, 1, 1, 1, 1, 1,
1.267266, 1.180809, 0.5564467, 1, 1, 1, 1, 1,
1.272101, 0.7739362, 0.04808525, 1, 1, 1, 1, 1,
1.273574, 0.6593388, 1.020331, 1, 1, 1, 1, 1,
1.292052, 1.067546, -0.266102, 1, 1, 1, 1, 1,
1.292694, -1.003446, 2.275053, 1, 1, 1, 1, 1,
1.306555, 1.008751, 0.02304271, 1, 1, 1, 1, 1,
1.31229, 1.044299, 0.1150537, 1, 1, 1, 1, 1,
1.322581, 0.5413037, 1.115678, 1, 1, 1, 1, 1,
1.342642, -0.8207387, 2.579244, 1, 1, 1, 1, 1,
1.345681, -1.447554, 2.550556, 1, 1, 1, 1, 1,
1.363604, -0.9224924, 1.99732, 1, 1, 1, 1, 1,
1.367629, -1.461035, 3.344345, 1, 1, 1, 1, 1,
1.373219, 0.8990741, 0.1040531, 1, 1, 1, 1, 1,
1.376378, -0.2875628, 1.947369, 1, 1, 1, 1, 1,
1.382263, -1.199458, 1.731857, 0, 0, 1, 1, 1,
1.406735, -0.1093276, 2.798694, 1, 0, 0, 1, 1,
1.415224, -1.261754, 1.5556, 1, 0, 0, 1, 1,
1.426758, 1.777473, 1.524711, 1, 0, 0, 1, 1,
1.433976, 0.7581525, 1.659601, 1, 0, 0, 1, 1,
1.446966, -1.473825, 3.638801, 1, 0, 0, 1, 1,
1.44927, -1.356063, 2.492539, 0, 0, 0, 1, 1,
1.452907, 1.190852, 0.966874, 0, 0, 0, 1, 1,
1.453927, 0.7890739, 2.405031, 0, 0, 0, 1, 1,
1.453959, 1.773447, 0.9593418, 0, 0, 0, 1, 1,
1.45499, 0.5862063, 3.629596, 0, 0, 0, 1, 1,
1.455021, -0.4402266, 2.765262, 0, 0, 0, 1, 1,
1.460126, -0.3798791, 2.716159, 0, 0, 0, 1, 1,
1.479499, -1.276571, 2.468393, 1, 1, 1, 1, 1,
1.525138, 0.2032199, 1.932032, 1, 1, 1, 1, 1,
1.525421, -0.1582862, 2.25088, 1, 1, 1, 1, 1,
1.543546, 1.319178, 1.115425, 1, 1, 1, 1, 1,
1.545755, 0.03012119, 1.814817, 1, 1, 1, 1, 1,
1.558078, 1.796229, 1.969324, 1, 1, 1, 1, 1,
1.564631, 2.090927, -0.3009059, 1, 1, 1, 1, 1,
1.573577, 0.000122654, 3.355903, 1, 1, 1, 1, 1,
1.581827, 2.391615, -0.2559937, 1, 1, 1, 1, 1,
1.614769, -3.762734, 2.213284, 1, 1, 1, 1, 1,
1.618971, 0.4778444, 2.607588, 1, 1, 1, 1, 1,
1.619213, 1.358919, 1.500579, 1, 1, 1, 1, 1,
1.628022, -0.4694248, 0.5307032, 1, 1, 1, 1, 1,
1.628138, 0.8606781, 0.8956676, 1, 1, 1, 1, 1,
1.628777, -0.7589634, 1.15992, 1, 1, 1, 1, 1,
1.639226, 0.3360538, 2.296051, 0, 0, 1, 1, 1,
1.653041, 0.1466404, 0.3982097, 1, 0, 0, 1, 1,
1.660786, 1.135484, 0.6338488, 1, 0, 0, 1, 1,
1.662542, -0.4632589, 0.4671112, 1, 0, 0, 1, 1,
1.708027, -0.7622371, 3.479165, 1, 0, 0, 1, 1,
1.711468, 0.5566059, 2.640927, 1, 0, 0, 1, 1,
1.746761, 0.7222071, 1.987679, 0, 0, 0, 1, 1,
1.750689, 0.1127311, 3.794898, 0, 0, 0, 1, 1,
1.793657, 0.7255964, 2.361069, 0, 0, 0, 1, 1,
1.801854, -1.089813, 2.322111, 0, 0, 0, 1, 1,
1.802635, 0.01341235, 0.377604, 0, 0, 0, 1, 1,
1.809161, 0.8708115, 0.8968987, 0, 0, 0, 1, 1,
1.810171, 1.478607, -0.1086639, 0, 0, 0, 1, 1,
1.814611, -0.2397668, 3.665123, 1, 1, 1, 1, 1,
1.828369, 1.152806, -0.6596712, 1, 1, 1, 1, 1,
1.895094, 1.58027, 1.911104, 1, 1, 1, 1, 1,
1.898552, 0.2246868, 1.204605, 1, 1, 1, 1, 1,
1.944168, 1.781973, 0.6048274, 1, 1, 1, 1, 1,
1.953803, 1.553535, -0.5663044, 1, 1, 1, 1, 1,
1.962875, -1.111603, -0.5309697, 1, 1, 1, 1, 1,
1.979425, 0.686461, 0.911646, 1, 1, 1, 1, 1,
1.997744, 0.1291564, 0.715633, 1, 1, 1, 1, 1,
2.008117, -0.104088, 0.9466612, 1, 1, 1, 1, 1,
2.008765, -0.5168175, 2.265235, 1, 1, 1, 1, 1,
2.018391, 1.540035, 0.6839799, 1, 1, 1, 1, 1,
2.068829, -0.3306368, 0.5908746, 1, 1, 1, 1, 1,
2.077192, 0.4317097, 2.382812, 1, 1, 1, 1, 1,
2.08755, 0.1571555, 2.326631, 1, 1, 1, 1, 1,
2.097667, 0.498638, 1.211193, 0, 0, 1, 1, 1,
2.103632, 0.3736276, 0.6265275, 1, 0, 0, 1, 1,
2.141555, 0.2636306, 1.747274, 1, 0, 0, 1, 1,
2.15373, 1.368192, 0.9497698, 1, 0, 0, 1, 1,
2.16179, 0.2929292, 0.5206611, 1, 0, 0, 1, 1,
2.168489, 0.1372538, 1.882647, 1, 0, 0, 1, 1,
2.241628, 0.9043087, 3.466878, 0, 0, 0, 1, 1,
2.24595, 0.7913867, 1.952965, 0, 0, 0, 1, 1,
2.246525, -2.162111, 4.262847, 0, 0, 0, 1, 1,
2.279148, 0.07163442, 2.354275, 0, 0, 0, 1, 1,
2.279736, 0.9108436, 0.9727576, 0, 0, 0, 1, 1,
2.312641, -1.34138, 3.410097, 0, 0, 0, 1, 1,
2.34092, -0.5789123, 3.393417, 0, 0, 0, 1, 1,
2.37039, 0.7797725, 1.407232, 1, 1, 1, 1, 1,
2.542134, 2.240219, 1.399028, 1, 1, 1, 1, 1,
2.633395, 0.0314721, 2.017879, 1, 1, 1, 1, 1,
2.711175, 0.3806514, 1.626844, 1, 1, 1, 1, 1,
2.899227, -0.06617874, 0.3263094, 1, 1, 1, 1, 1,
2.918208, -0.6850184, 1.199304, 1, 1, 1, 1, 1,
3.313242, 0.8233128, 0.5076988, 1, 1, 1, 1, 1
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
var radius = 9.895617;
var distance = 34.75793;
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
mvMatrix.translate( -0.1178675, 0.5111835, -0.02583551 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.75793);
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
