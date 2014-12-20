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
-3.85962, -0.3903165, -1.279219, 1, 0, 0, 1,
-3.116755, -0.05309209, -0.2919097, 1, 0.007843138, 0, 1,
-3.049597, -1.032259, -2.541684, 1, 0.01176471, 0, 1,
-2.63344, 0.4080239, -1.04583, 1, 0.01960784, 0, 1,
-2.612884, -1.589446, -1.886779, 1, 0.02352941, 0, 1,
-2.587113, -0.4063547, -1.274967, 1, 0.03137255, 0, 1,
-2.563339, -0.9471779, -0.7273099, 1, 0.03529412, 0, 1,
-2.542207, -0.434824, 0.01013581, 1, 0.04313726, 0, 1,
-2.387578, -0.1231041, -1.814465, 1, 0.04705882, 0, 1,
-2.287419, 2.840966, -1.869549, 1, 0.05490196, 0, 1,
-2.276825, 0.827847, -2.442957, 1, 0.05882353, 0, 1,
-2.25333, 0.2233451, -2.972655, 1, 0.06666667, 0, 1,
-2.20555, -0.4419506, -2.446394, 1, 0.07058824, 0, 1,
-2.204685, -0.9222389, -2.031636, 1, 0.07843138, 0, 1,
-2.186288, 1.221414, -1.564171, 1, 0.08235294, 0, 1,
-2.182549, 0.2571753, -2.000617, 1, 0.09019608, 0, 1,
-2.152584, 2.383335, -1.296841, 1, 0.09411765, 0, 1,
-2.143157, -1.225721, -1.914453, 1, 0.1019608, 0, 1,
-2.082773, 1.974651, -1.570334, 1, 0.1098039, 0, 1,
-2.074516, -1.383916, -1.249754, 1, 0.1137255, 0, 1,
-2.068923, -1.644367, -2.331541, 1, 0.1215686, 0, 1,
-2.022946, 0.7878557, -2.458141, 1, 0.1254902, 0, 1,
-2.017083, -0.6147742, -1.035894, 1, 0.1333333, 0, 1,
-1.98666, 0.7026191, -0.5795136, 1, 0.1372549, 0, 1,
-1.985451, -0.9236459, -2.634435, 1, 0.145098, 0, 1,
-1.916931, 1.41996, -0.6744718, 1, 0.1490196, 0, 1,
-1.893711, -0.6960717, -1.483932, 1, 0.1568628, 0, 1,
-1.843535, -0.07224207, -1.115145, 1, 0.1607843, 0, 1,
-1.841103, 0.2627608, -1.77889, 1, 0.1686275, 0, 1,
-1.834883, 1.567041, -0.4948888, 1, 0.172549, 0, 1,
-1.806411, -0.4547385, -3.287784, 1, 0.1803922, 0, 1,
-1.79915, -1.042521, -3.328838, 1, 0.1843137, 0, 1,
-1.790387, 0.174215, -1.981558, 1, 0.1921569, 0, 1,
-1.785611, -0.4288145, -2.262461, 1, 0.1960784, 0, 1,
-1.778803, -0.2102064, -1.979783, 1, 0.2039216, 0, 1,
-1.768336, -0.9851174, -1.395586, 1, 0.2117647, 0, 1,
-1.767022, -0.921331, -2.777666, 1, 0.2156863, 0, 1,
-1.7514, -0.8842818, -1.970381, 1, 0.2235294, 0, 1,
-1.745169, 0.3094157, -1.365353, 1, 0.227451, 0, 1,
-1.744749, 1.175969, 0.07815354, 1, 0.2352941, 0, 1,
-1.694216, 1.383188, -1.267742, 1, 0.2392157, 0, 1,
-1.680628, 0.1856767, -1.660563, 1, 0.2470588, 0, 1,
-1.677938, 0.7071618, -1.49554, 1, 0.2509804, 0, 1,
-1.675065, -0.9145588, -3.207552, 1, 0.2588235, 0, 1,
-1.671876, -0.8591286, -1.572551, 1, 0.2627451, 0, 1,
-1.653964, 0.4142905, -0.04028269, 1, 0.2705882, 0, 1,
-1.651867, -2.504281, -3.040251, 1, 0.2745098, 0, 1,
-1.59321, 0.2003523, -1.612493, 1, 0.282353, 0, 1,
-1.587425, -0.1013791, -1.711042, 1, 0.2862745, 0, 1,
-1.584264, 0.4227732, -1.226699, 1, 0.2941177, 0, 1,
-1.578937, -0.4316151, -2.485929, 1, 0.3019608, 0, 1,
-1.567422, -0.3007692, -0.6866297, 1, 0.3058824, 0, 1,
-1.549263, 0.5190515, -0.2215508, 1, 0.3137255, 0, 1,
-1.526159, -0.3207157, -1.180679, 1, 0.3176471, 0, 1,
-1.520924, 0.7604365, 0.3859473, 1, 0.3254902, 0, 1,
-1.519372, 0.9955155, -1.734262, 1, 0.3294118, 0, 1,
-1.515168, 0.9453941, -2.014943, 1, 0.3372549, 0, 1,
-1.512683, 0.8519142, -1.364208, 1, 0.3411765, 0, 1,
-1.50188, 0.004479166, -2.101828, 1, 0.3490196, 0, 1,
-1.495353, 0.6145825, 0.582792, 1, 0.3529412, 0, 1,
-1.479971, -0.9457603, -1.297284, 1, 0.3607843, 0, 1,
-1.447569, 0.7561466, -1.30153, 1, 0.3647059, 0, 1,
-1.432986, 1.057178, -1.719099, 1, 0.372549, 0, 1,
-1.43096, -1.17216, -1.490248, 1, 0.3764706, 0, 1,
-1.421202, -0.2198919, -1.891422, 1, 0.3843137, 0, 1,
-1.416067, -3.215154, -3.760333, 1, 0.3882353, 0, 1,
-1.411933, 1.815721, -3.218337, 1, 0.3960784, 0, 1,
-1.401381, -0.1287828, -1.662712, 1, 0.4039216, 0, 1,
-1.380823, 0.9439986, -1.563802, 1, 0.4078431, 0, 1,
-1.356553, 0.5443907, 0.3964684, 1, 0.4156863, 0, 1,
-1.355093, 0.2976011, -2.056643, 1, 0.4196078, 0, 1,
-1.352084, -0.5234203, 0.1610279, 1, 0.427451, 0, 1,
-1.345303, -0.5467557, -2.570262, 1, 0.4313726, 0, 1,
-1.328317, -0.3015851, -3.411002, 1, 0.4392157, 0, 1,
-1.327768, 0.7074944, -1.368415, 1, 0.4431373, 0, 1,
-1.323495, 1.026716, -1.906119, 1, 0.4509804, 0, 1,
-1.316422, -1.049025, -3.652964, 1, 0.454902, 0, 1,
-1.310226, 0.9133204, -0.7199491, 1, 0.4627451, 0, 1,
-1.30721, -0.05090369, -2.36085, 1, 0.4666667, 0, 1,
-1.300843, -0.1399157, -2.430174, 1, 0.4745098, 0, 1,
-1.296471, -1.068609, -4.271378, 1, 0.4784314, 0, 1,
-1.294022, 0.1564094, -1.234796, 1, 0.4862745, 0, 1,
-1.286015, 0.6977883, -1.230227, 1, 0.4901961, 0, 1,
-1.275068, 1.081672, 0.1348434, 1, 0.4980392, 0, 1,
-1.260354, -0.1866355, -2.003174, 1, 0.5058824, 0, 1,
-1.259222, 0.09449223, -2.445112, 1, 0.509804, 0, 1,
-1.257468, -0.4910407, -2.264592, 1, 0.5176471, 0, 1,
-1.254326, -1.205743, -3.631134, 1, 0.5215687, 0, 1,
-1.254081, -1.503198, -3.426932, 1, 0.5294118, 0, 1,
-1.248084, 0.121865, -1.23807, 1, 0.5333334, 0, 1,
-1.239759, -0.4544042, -2.660097, 1, 0.5411765, 0, 1,
-1.238238, -0.5781102, -3.318036, 1, 0.5450981, 0, 1,
-1.232476, -0.8827249, -2.342486, 1, 0.5529412, 0, 1,
-1.231323, -0.7871596, -3.438952, 1, 0.5568628, 0, 1,
-1.226993, 0.1077366, -2.410855, 1, 0.5647059, 0, 1,
-1.217461, 0.4489792, -0.6850706, 1, 0.5686275, 0, 1,
-1.214811, -0.6747859, -1.739395, 1, 0.5764706, 0, 1,
-1.210072, 1.330186, -1.513812, 1, 0.5803922, 0, 1,
-1.204753, -0.6175872, -3.203639, 1, 0.5882353, 0, 1,
-1.18492, 0.5445285, -0.9394922, 1, 0.5921569, 0, 1,
-1.184662, 0.09550813, -1.513348, 1, 0.6, 0, 1,
-1.182665, 0.9104905, -0.4987938, 1, 0.6078432, 0, 1,
-1.181609, -0.5066078, -0.8515162, 1, 0.6117647, 0, 1,
-1.178446, 1.04537, 0.5098047, 1, 0.6196079, 0, 1,
-1.16887, -0.1271282, -1.434622, 1, 0.6235294, 0, 1,
-1.167528, -0.5871261, -1.390741, 1, 0.6313726, 0, 1,
-1.166228, -0.1318776, -1.319552, 1, 0.6352941, 0, 1,
-1.165536, 1.699612, -0.3160235, 1, 0.6431373, 0, 1,
-1.143222, -1.012254, -1.715503, 1, 0.6470588, 0, 1,
-1.142934, -0.7553943, -1.277753, 1, 0.654902, 0, 1,
-1.14254, 1.821277, 1.174194, 1, 0.6588235, 0, 1,
-1.142245, -1.052955, -0.9464837, 1, 0.6666667, 0, 1,
-1.128347, 1.332873, -2.897378, 1, 0.6705883, 0, 1,
-1.125778, -0.6130794, -1.062691, 1, 0.6784314, 0, 1,
-1.122719, -1.083864, -2.539731, 1, 0.682353, 0, 1,
-1.120517, 1.070437, -1.237327, 1, 0.6901961, 0, 1,
-1.112764, -0.2552384, -2.541225, 1, 0.6941177, 0, 1,
-1.109514, 1.100294, -1.244008, 1, 0.7019608, 0, 1,
-1.100893, 1.740496, 0.541959, 1, 0.7098039, 0, 1,
-1.094923, -0.01344732, -1.680302, 1, 0.7137255, 0, 1,
-1.091238, -2.04934, -2.903943, 1, 0.7215686, 0, 1,
-1.078334, -0.635379, -2.68474, 1, 0.7254902, 0, 1,
-1.069052, 0.2333747, -1.951776, 1, 0.7333333, 0, 1,
-1.068987, 0.5803641, -1.686493, 1, 0.7372549, 0, 1,
-1.064523, 0.5651404, -0.5555572, 1, 0.7450981, 0, 1,
-1.062885, 1.035257, -1.40904, 1, 0.7490196, 0, 1,
-1.062769, 1.95067, -3.281179, 1, 0.7568628, 0, 1,
-1.061509, -0.4134318, -3.146502, 1, 0.7607843, 0, 1,
-1.056808, -0.7548491, -1.622688, 1, 0.7686275, 0, 1,
-1.04613, 1.360157, -0.4173728, 1, 0.772549, 0, 1,
-1.045468, 0.3639254, -1.644627, 1, 0.7803922, 0, 1,
-1.041133, -0.4069083, -1.958548, 1, 0.7843137, 0, 1,
-1.033924, -1.496634, -4.48409, 1, 0.7921569, 0, 1,
-1.033683, 0.2570993, -1.81625, 1, 0.7960784, 0, 1,
-1.033296, 1.361442, -1.404634, 1, 0.8039216, 0, 1,
-1.032924, 1.045624, -0.2295044, 1, 0.8117647, 0, 1,
-1.02635, 1.154401, -0.7856315, 1, 0.8156863, 0, 1,
-1.022226, -1.324445, -1.279024, 1, 0.8235294, 0, 1,
-1.021983, -0.4047769, -1.731899, 1, 0.827451, 0, 1,
-1.021504, -0.1855691, -0.3207767, 1, 0.8352941, 0, 1,
-1.019047, 2.031014, -1.336127, 1, 0.8392157, 0, 1,
-1.014734, 0.7938029, -0.8660083, 1, 0.8470588, 0, 1,
-1.010304, -0.5252893, -2.74918, 1, 0.8509804, 0, 1,
-1.005853, -0.005189719, -2.233232, 1, 0.8588235, 0, 1,
-1.004833, -2.108331, -2.855309, 1, 0.8627451, 0, 1,
-1.00081, 1.496157, 0.6030349, 1, 0.8705882, 0, 1,
-0.997372, 1.256319, -1.056111, 1, 0.8745098, 0, 1,
-0.9949008, -0.6759242, -0.7938068, 1, 0.8823529, 0, 1,
-0.993947, 0.3376018, -0.7983097, 1, 0.8862745, 0, 1,
-0.9737044, 1.260696, -1.741389, 1, 0.8941177, 0, 1,
-0.9725369, -1.536991, -2.899962, 1, 0.8980392, 0, 1,
-0.9678077, -0.1987067, -2.60102, 1, 0.9058824, 0, 1,
-0.9669568, -0.1327792, -3.615314, 1, 0.9137255, 0, 1,
-0.9655362, -0.7262151, -2.357863, 1, 0.9176471, 0, 1,
-0.9638433, 1.644628, -1.279697, 1, 0.9254902, 0, 1,
-0.9626285, 0.226487, -1.363518, 1, 0.9294118, 0, 1,
-0.9610187, 1.713758, -0.744936, 1, 0.9372549, 0, 1,
-0.9605141, 0.3398041, -1.824506, 1, 0.9411765, 0, 1,
-0.9544339, 0.3313065, -1.89684, 1, 0.9490196, 0, 1,
-0.9536768, 0.8099676, -0.6264895, 1, 0.9529412, 0, 1,
-0.9512085, -1.795613, -1.354911, 1, 0.9607843, 0, 1,
-0.9496104, 0.140047, 0.788515, 1, 0.9647059, 0, 1,
-0.9468299, -1.516611, -3.174982, 1, 0.972549, 0, 1,
-0.9408899, -0.8044471, -3.820621, 1, 0.9764706, 0, 1,
-0.9400059, -0.8677049, -2.729599, 1, 0.9843137, 0, 1,
-0.9369496, 0.2217281, -1.490644, 1, 0.9882353, 0, 1,
-0.9362664, 0.8736594, -0.9385524, 1, 0.9960784, 0, 1,
-0.935397, 0.7622814, 0.1321126, 0.9960784, 1, 0, 1,
-0.9346115, -1.745632, -2.307351, 0.9921569, 1, 0, 1,
-0.9322228, 0.6230816, 0.03862074, 0.9843137, 1, 0, 1,
-0.9265851, -0.1736997, -2.943775, 0.9803922, 1, 0, 1,
-0.9189094, -1.250649, -2.543691, 0.972549, 1, 0, 1,
-0.9156556, 0.4453449, -0.1248176, 0.9686275, 1, 0, 1,
-0.9085128, -0.7946096, -0.8606913, 0.9607843, 1, 0, 1,
-0.9075457, -0.4396661, -2.278881, 0.9568627, 1, 0, 1,
-0.9072534, 0.2220559, -0.0009852584, 0.9490196, 1, 0, 1,
-0.9057451, 0.05074577, -1.855831, 0.945098, 1, 0, 1,
-0.9044232, 0.80331, -0.867277, 0.9372549, 1, 0, 1,
-0.9037336, -0.4148312, -3.300979, 0.9333333, 1, 0, 1,
-0.9006621, 1.982095, -1.625645, 0.9254902, 1, 0, 1,
-0.8861094, 0.763527, -1.955471, 0.9215686, 1, 0, 1,
-0.8771388, 0.6421506, -4.066772, 0.9137255, 1, 0, 1,
-0.8739507, 0.9075161, -1.502499, 0.9098039, 1, 0, 1,
-0.8671802, 0.7326301, -0.5602039, 0.9019608, 1, 0, 1,
-0.8600224, 0.3143534, -0.5584968, 0.8941177, 1, 0, 1,
-0.8548141, -0.930073, -3.121493, 0.8901961, 1, 0, 1,
-0.8522263, 0.202952, -2.51972, 0.8823529, 1, 0, 1,
-0.848863, 1.141343, 0.6766814, 0.8784314, 1, 0, 1,
-0.8457002, 1.136982, 0.601234, 0.8705882, 1, 0, 1,
-0.8450964, 1.766951, 0.1556427, 0.8666667, 1, 0, 1,
-0.838954, 0.1884384, -1.358867, 0.8588235, 1, 0, 1,
-0.8348336, 1.163835, -0.1818376, 0.854902, 1, 0, 1,
-0.8342554, -0.120717, -3.048233, 0.8470588, 1, 0, 1,
-0.8329574, 0.7259978, -0.5417454, 0.8431373, 1, 0, 1,
-0.8322497, 1.40076, -0.8100368, 0.8352941, 1, 0, 1,
-0.8308954, 0.8909892, -2.180501, 0.8313726, 1, 0, 1,
-0.8294624, 1.688809, -0.193985, 0.8235294, 1, 0, 1,
-0.8248563, 0.4058267, -1.939669, 0.8196079, 1, 0, 1,
-0.8147632, 1.392487, -0.6484899, 0.8117647, 1, 0, 1,
-0.8135572, -0.09733626, -2.238577, 0.8078431, 1, 0, 1,
-0.8097072, -0.1504927, -2.377659, 0.8, 1, 0, 1,
-0.806972, 0.6049289, -0.1637165, 0.7921569, 1, 0, 1,
-0.8031505, 0.8974139, -0.321862, 0.7882353, 1, 0, 1,
-0.8022671, -0.1439766, -0.478684, 0.7803922, 1, 0, 1,
-0.7978399, -1.129355, -5.164726, 0.7764706, 1, 0, 1,
-0.791258, -0.2056461, -1.254469, 0.7686275, 1, 0, 1,
-0.786972, 1.264994, 0.9404628, 0.7647059, 1, 0, 1,
-0.7829058, -0.01196939, -2.10037, 0.7568628, 1, 0, 1,
-0.7810258, -1.373569, -3.334135, 0.7529412, 1, 0, 1,
-0.7756065, 0.8402066, -1.420252, 0.7450981, 1, 0, 1,
-0.7751431, -0.2369981, -0.4556057, 0.7411765, 1, 0, 1,
-0.7679965, 0.3422984, -0.307935, 0.7333333, 1, 0, 1,
-0.7611853, 0.27667, -0.4726125, 0.7294118, 1, 0, 1,
-0.7609407, 0.3732942, -0.7895346, 0.7215686, 1, 0, 1,
-0.7590446, -1.495502, -2.872478, 0.7176471, 1, 0, 1,
-0.7476875, -0.5391025, -4.233686, 0.7098039, 1, 0, 1,
-0.7464229, -0.1962649, -2.840893, 0.7058824, 1, 0, 1,
-0.7459293, 0.7765709, -0.9034095, 0.6980392, 1, 0, 1,
-0.7447132, -1.726918, -2.774128, 0.6901961, 1, 0, 1,
-0.7425695, -0.8190914, -2.153701, 0.6862745, 1, 0, 1,
-0.7420989, -1.052291, -3.354906, 0.6784314, 1, 0, 1,
-0.741335, 1.967743, 0.1675711, 0.6745098, 1, 0, 1,
-0.7377757, 0.2060096, -1.909325, 0.6666667, 1, 0, 1,
-0.7375289, -0.4394171, -1.700844, 0.6627451, 1, 0, 1,
-0.7370103, -0.9228111, -4.018285, 0.654902, 1, 0, 1,
-0.7348467, -1.493057, -1.244829, 0.6509804, 1, 0, 1,
-0.7314548, 0.2347317, -1.981287, 0.6431373, 1, 0, 1,
-0.7285618, 0.7577949, -1.767114, 0.6392157, 1, 0, 1,
-0.7255841, -0.6455028, -2.715681, 0.6313726, 1, 0, 1,
-0.7245041, -0.03373783, -1.002304, 0.627451, 1, 0, 1,
-0.72394, 1.386253, 0.904631, 0.6196079, 1, 0, 1,
-0.7209842, 0.05218064, -3.066614, 0.6156863, 1, 0, 1,
-0.7157828, 1.504578, -0.7766261, 0.6078432, 1, 0, 1,
-0.7149755, 0.8747516, -1.754794, 0.6039216, 1, 0, 1,
-0.7059702, 0.9267931, -1.442311, 0.5960785, 1, 0, 1,
-0.7006875, 0.5295781, -0.6633164, 0.5882353, 1, 0, 1,
-0.6997769, -1.052321, -2.286307, 0.5843138, 1, 0, 1,
-0.6971166, 0.716067, 0.5076676, 0.5764706, 1, 0, 1,
-0.6967751, -0.7855586, -4.051794, 0.572549, 1, 0, 1,
-0.6941229, -0.6546396, -1.979911, 0.5647059, 1, 0, 1,
-0.6874963, 0.5196591, -1.662523, 0.5607843, 1, 0, 1,
-0.685971, 1.562624, -0.06374263, 0.5529412, 1, 0, 1,
-0.6859326, -0.6300377, -2.071781, 0.5490196, 1, 0, 1,
-0.6854158, -0.3120324, -1.86667, 0.5411765, 1, 0, 1,
-0.6833, -1.627886, -3.009246, 0.5372549, 1, 0, 1,
-0.6827477, -0.9148541, -2.670468, 0.5294118, 1, 0, 1,
-0.6821906, -0.1398768, -0.5270065, 0.5254902, 1, 0, 1,
-0.6790236, -0.01883826, -2.166127, 0.5176471, 1, 0, 1,
-0.6789363, 0.4024599, -1.485479, 0.5137255, 1, 0, 1,
-0.6780797, -0.7332766, -2.986452, 0.5058824, 1, 0, 1,
-0.6730768, 0.09293408, -2.036828, 0.5019608, 1, 0, 1,
-0.6729419, 1.989317, -0.8042564, 0.4941176, 1, 0, 1,
-0.6653747, -1.310186, -3.335841, 0.4862745, 1, 0, 1,
-0.6602099, 0.4298126, -0.7653456, 0.4823529, 1, 0, 1,
-0.6575006, -0.1760754, -2.33016, 0.4745098, 1, 0, 1,
-0.6563685, 0.08894107, -2.03634, 0.4705882, 1, 0, 1,
-0.6562474, -0.1545899, -2.619805, 0.4627451, 1, 0, 1,
-0.6551784, -1.273492, -1.108274, 0.4588235, 1, 0, 1,
-0.6537738, -2.251092, -4.406613, 0.4509804, 1, 0, 1,
-0.6505407, -0.8055958, -2.670465, 0.4470588, 1, 0, 1,
-0.646324, -1.523465, -5.448527, 0.4392157, 1, 0, 1,
-0.6461531, -1.396775, -1.701956, 0.4352941, 1, 0, 1,
-0.6456522, 1.345854, -0.2641838, 0.427451, 1, 0, 1,
-0.6451765, 2.202821, -1.220933, 0.4235294, 1, 0, 1,
-0.6447067, 0.1808148, -0.7888877, 0.4156863, 1, 0, 1,
-0.6438748, -0.451918, -3.46129, 0.4117647, 1, 0, 1,
-0.6419314, -1.075468, -2.946193, 0.4039216, 1, 0, 1,
-0.6394796, 1.176575, -1.128529, 0.3960784, 1, 0, 1,
-0.638874, 0.3318795, 1.203142, 0.3921569, 1, 0, 1,
-0.6381161, -1.284592, -2.709837, 0.3843137, 1, 0, 1,
-0.6312451, -1.580633, -1.517277, 0.3803922, 1, 0, 1,
-0.630958, 1.192804, -0.5679544, 0.372549, 1, 0, 1,
-0.6278493, -0.121742, -0.2896489, 0.3686275, 1, 0, 1,
-0.6268756, 0.9435286, -0.6982532, 0.3607843, 1, 0, 1,
-0.625205, 0.1766731, -0.1742182, 0.3568628, 1, 0, 1,
-0.6244485, -1.22532, -2.647671, 0.3490196, 1, 0, 1,
-0.6182938, 0.8425338, 0.5583887, 0.345098, 1, 0, 1,
-0.6045573, -1.789013, -4.636458, 0.3372549, 1, 0, 1,
-0.6043424, -0.7096792, -3.736547, 0.3333333, 1, 0, 1,
-0.6030883, -0.1196422, -2.137672, 0.3254902, 1, 0, 1,
-0.5944791, 0.1378857, 0.4257329, 0.3215686, 1, 0, 1,
-0.5922357, 0.8882793, -0.7138177, 0.3137255, 1, 0, 1,
-0.5908675, 0.057398, -1.90105, 0.3098039, 1, 0, 1,
-0.5847444, 0.04266168, -1.951909, 0.3019608, 1, 0, 1,
-0.5798435, 0.3511387, -1.938181, 0.2941177, 1, 0, 1,
-0.5793562, -1.364745, -3.762238, 0.2901961, 1, 0, 1,
-0.5788088, -1.240524, -3.969458, 0.282353, 1, 0, 1,
-0.5760162, 1.547598, -1.373487, 0.2784314, 1, 0, 1,
-0.5720131, -0.3001687, -2.373084, 0.2705882, 1, 0, 1,
-0.5717531, 0.01273833, -1.57163, 0.2666667, 1, 0, 1,
-0.5689959, -0.3427138, -1.506812, 0.2588235, 1, 0, 1,
-0.5647272, 0.6219357, -0.4388369, 0.254902, 1, 0, 1,
-0.5628905, -1.094284, -3.247939, 0.2470588, 1, 0, 1,
-0.5599288, -1.191602, -2.595821, 0.2431373, 1, 0, 1,
-0.5578285, -1.026287, -2.793419, 0.2352941, 1, 0, 1,
-0.5576965, 1.325458, -0.7720445, 0.2313726, 1, 0, 1,
-0.5490317, -0.3854531, -2.244423, 0.2235294, 1, 0, 1,
-0.5484244, 0.5709655, -0.947778, 0.2196078, 1, 0, 1,
-0.541757, 1.185489, 0.4168732, 0.2117647, 1, 0, 1,
-0.5398833, -2.390336, -3.103344, 0.2078431, 1, 0, 1,
-0.538574, -0.3543709, -2.750822, 0.2, 1, 0, 1,
-0.5382407, -2.10502, -2.025905, 0.1921569, 1, 0, 1,
-0.5366814, 0.6828303, -1.874362, 0.1882353, 1, 0, 1,
-0.5366637, -0.2787152, -1.137422, 0.1803922, 1, 0, 1,
-0.5279101, 1.103204, -0.8048016, 0.1764706, 1, 0, 1,
-0.5255843, 0.5810732, -1.15775, 0.1686275, 1, 0, 1,
-0.5243033, -0.9043763, -4.070045, 0.1647059, 1, 0, 1,
-0.5201733, -0.9438959, -1.666347, 0.1568628, 1, 0, 1,
-0.51684, -0.3297738, -2.62049, 0.1529412, 1, 0, 1,
-0.5157418, -0.9011343, -3.552788, 0.145098, 1, 0, 1,
-0.5143471, -0.4519987, -2.139554, 0.1411765, 1, 0, 1,
-0.5088003, 0.07001217, -2.905902, 0.1333333, 1, 0, 1,
-0.5085942, -1.086123, -1.638573, 0.1294118, 1, 0, 1,
-0.5065741, 0.4226928, -0.9435324, 0.1215686, 1, 0, 1,
-0.5044468, 2.468284, 0.1291477, 0.1176471, 1, 0, 1,
-0.5020022, 0.6337828, -0.7165506, 0.1098039, 1, 0, 1,
-0.5015178, 0.5120249, -0.3586085, 0.1058824, 1, 0, 1,
-0.5009462, -0.122759, -1.726391, 0.09803922, 1, 0, 1,
-0.5005361, 0.8940064, 1.263327, 0.09019608, 1, 0, 1,
-0.4979729, 1.203367, 0.4159983, 0.08627451, 1, 0, 1,
-0.49795, -0.2675848, -2.981986, 0.07843138, 1, 0, 1,
-0.4942504, 1.62451, 0.338326, 0.07450981, 1, 0, 1,
-0.4863105, -0.6852128, -3.811862, 0.06666667, 1, 0, 1,
-0.4855011, -1.786446, -3.636474, 0.0627451, 1, 0, 1,
-0.4802936, 0.2084098, -1.731433, 0.05490196, 1, 0, 1,
-0.4787076, 1.215507, 0.4577407, 0.05098039, 1, 0, 1,
-0.4740794, 1.652608, 0.5636439, 0.04313726, 1, 0, 1,
-0.470844, 1.589516, -0.9816641, 0.03921569, 1, 0, 1,
-0.4683465, 0.2326248, -1.782519, 0.03137255, 1, 0, 1,
-0.4591221, -1.271945, -0.5895302, 0.02745098, 1, 0, 1,
-0.4507648, 1.071921, 0.4603214, 0.01960784, 1, 0, 1,
-0.4485811, -1.801426, -3.397563, 0.01568628, 1, 0, 1,
-0.4434584, -2.78392, -1.645872, 0.007843138, 1, 0, 1,
-0.4403151, 1.974923, 1.723029, 0.003921569, 1, 0, 1,
-0.4396445, -0.9074914, -1.11323, 0, 1, 0.003921569, 1,
-0.4373524, 0.07427078, -0.6287141, 0, 1, 0.01176471, 1,
-0.4354456, 0.9465016, 0.02749025, 0, 1, 0.01568628, 1,
-0.4335695, 0.5238907, 0.02226269, 0, 1, 0.02352941, 1,
-0.432039, -0.8614761, -3.519373, 0, 1, 0.02745098, 1,
-0.4311847, -0.4661898, -1.582772, 0, 1, 0.03529412, 1,
-0.4291171, -1.456073, -4.468524, 0, 1, 0.03921569, 1,
-0.4275933, 0.7118312, -0.3994216, 0, 1, 0.04705882, 1,
-0.4266662, -0.2684031, -1.135048, 0, 1, 0.05098039, 1,
-0.4223862, 0.371428, -0.6011948, 0, 1, 0.05882353, 1,
-0.4215101, 0.7188203, 0.753562, 0, 1, 0.0627451, 1,
-0.4213848, 0.9249748, 0.1349847, 0, 1, 0.07058824, 1,
-0.420793, -1.305157, -2.458391, 0, 1, 0.07450981, 1,
-0.4202156, 0.1057945, -1.508558, 0, 1, 0.08235294, 1,
-0.4201397, -0.6492287, -3.184967, 0, 1, 0.08627451, 1,
-0.417097, -0.8091376, -3.556174, 0, 1, 0.09411765, 1,
-0.4149866, 1.988234, 0.8079311, 0, 1, 0.1019608, 1,
-0.4093078, -0.3153465, -1.825742, 0, 1, 0.1058824, 1,
-0.4073739, 1.32325, -1.036339, 0, 1, 0.1137255, 1,
-0.4056032, -0.09311724, -1.021363, 0, 1, 0.1176471, 1,
-0.4044349, 0.240452, -1.046916, 0, 1, 0.1254902, 1,
-0.3977079, -0.9573498, -3.468557, 0, 1, 0.1294118, 1,
-0.3959441, 1.487807, -1.86094, 0, 1, 0.1372549, 1,
-0.3956409, -0.8796005, -2.65445, 0, 1, 0.1411765, 1,
-0.3940633, -1.527067, -3.424527, 0, 1, 0.1490196, 1,
-0.393783, 0.2648621, -0.4397911, 0, 1, 0.1529412, 1,
-0.3935618, -0.3833837, -2.552842, 0, 1, 0.1607843, 1,
-0.3906871, 0.8663464, 0.9166881, 0, 1, 0.1647059, 1,
-0.390239, -0.4495717, -3.555034, 0, 1, 0.172549, 1,
-0.3901811, -1.547242, -4.159262, 0, 1, 0.1764706, 1,
-0.3827086, 0.5696038, 0.1068029, 0, 1, 0.1843137, 1,
-0.3764539, 0.4752921, -1.081839, 0, 1, 0.1882353, 1,
-0.3750023, 1.404093, -1.407657, 0, 1, 0.1960784, 1,
-0.3749551, -0.4617774, -2.507355, 0, 1, 0.2039216, 1,
-0.3715863, 1.603449, -1.712471, 0, 1, 0.2078431, 1,
-0.3679495, -0.004541141, -1.902804, 0, 1, 0.2156863, 1,
-0.3667862, -1.799796, -1.922087, 0, 1, 0.2196078, 1,
-0.366335, -0.3508478, -1.950779, 0, 1, 0.227451, 1,
-0.3617525, -0.8637877, -3.48842, 0, 1, 0.2313726, 1,
-0.3608175, -1.869256, -2.464875, 0, 1, 0.2392157, 1,
-0.3547741, -1.074829, -3.067514, 0, 1, 0.2431373, 1,
-0.3545469, 0.06505083, -0.9097462, 0, 1, 0.2509804, 1,
-0.3469995, 1.936097, -0.8850989, 0, 1, 0.254902, 1,
-0.3385293, -0.6805688, -2.933011, 0, 1, 0.2627451, 1,
-0.337313, 0.7111084, 1.160756, 0, 1, 0.2666667, 1,
-0.3335385, -0.8204653, -2.423561, 0, 1, 0.2745098, 1,
-0.3297893, 1.648745, 1.457409, 0, 1, 0.2784314, 1,
-0.3294097, 0.9999936, -1.714505, 0, 1, 0.2862745, 1,
-0.3285044, 1.923985, 0.3252612, 0, 1, 0.2901961, 1,
-0.3269984, -0.5090808, -3.541861, 0, 1, 0.2980392, 1,
-0.326817, -0.1031712, -2.935944, 0, 1, 0.3058824, 1,
-0.3261294, -1.035764, -2.193678, 0, 1, 0.3098039, 1,
-0.325788, -1.672647, -3.269228, 0, 1, 0.3176471, 1,
-0.3242025, 0.1157607, -0.5146034, 0, 1, 0.3215686, 1,
-0.3235644, -0.07488775, -1.910742, 0, 1, 0.3294118, 1,
-0.3199684, 0.1157375, 0.2951878, 0, 1, 0.3333333, 1,
-0.3191187, 0.4976299, -0.2675914, 0, 1, 0.3411765, 1,
-0.3166761, 1.008611, -0.9840474, 0, 1, 0.345098, 1,
-0.3107154, -0.6935984, -2.162971, 0, 1, 0.3529412, 1,
-0.306369, -0.6559512, -1.204398, 0, 1, 0.3568628, 1,
-0.3062209, -1.659681, -1.905515, 0, 1, 0.3647059, 1,
-0.3035152, -0.9652738, -3.125518, 0, 1, 0.3686275, 1,
-0.3002008, -1.231877, -2.890679, 0, 1, 0.3764706, 1,
-0.2985606, -0.4047482, -2.183643, 0, 1, 0.3803922, 1,
-0.2976652, -0.06706757, -2.182, 0, 1, 0.3882353, 1,
-0.2951937, -0.03669562, -2.187432, 0, 1, 0.3921569, 1,
-0.2948433, -0.4972868, -1.985972, 0, 1, 0.4, 1,
-0.2935941, -0.3273818, -2.882204, 0, 1, 0.4078431, 1,
-0.2926281, 1.137949, 0.7118417, 0, 1, 0.4117647, 1,
-0.2919428, -1.295516, -4.445768, 0, 1, 0.4196078, 1,
-0.2916258, 0.272588, -0.7300013, 0, 1, 0.4235294, 1,
-0.2905714, 1.449702, -0.6746908, 0, 1, 0.4313726, 1,
-0.2886792, -1.028372, -2.429063, 0, 1, 0.4352941, 1,
-0.287233, -0.4686912, -1.415365, 0, 1, 0.4431373, 1,
-0.2796823, -1.835071, -3.794024, 0, 1, 0.4470588, 1,
-0.2769459, -0.7481478, -2.936095, 0, 1, 0.454902, 1,
-0.2749856, 1.053048, -0.8730163, 0, 1, 0.4588235, 1,
-0.2721367, 0.4612695, 0.3050212, 0, 1, 0.4666667, 1,
-0.2697553, -1.130835, -1.047046, 0, 1, 0.4705882, 1,
-0.2692695, -0.09415539, -2.917025, 0, 1, 0.4784314, 1,
-0.2564232, 0.883701, -0.4336398, 0, 1, 0.4823529, 1,
-0.2553728, 1.729008, 0.5790121, 0, 1, 0.4901961, 1,
-0.2535222, -0.08809707, -2.239043, 0, 1, 0.4941176, 1,
-0.2495107, -1.299382, -3.573521, 0, 1, 0.5019608, 1,
-0.2471159, -0.1274694, -2.496505, 0, 1, 0.509804, 1,
-0.244275, 0.4230522, 0.5177382, 0, 1, 0.5137255, 1,
-0.2370722, 1.777393, -1.442363, 0, 1, 0.5215687, 1,
-0.2354626, 0.1719229, 1.418553, 0, 1, 0.5254902, 1,
-0.2353731, 0.5479194, 0.7894858, 0, 1, 0.5333334, 1,
-0.2273074, -1.713285, -3.685494, 0, 1, 0.5372549, 1,
-0.2254612, 0.1339569, -1.735843, 0, 1, 0.5450981, 1,
-0.2242053, -0.3767807, -4.315045, 0, 1, 0.5490196, 1,
-0.2228311, 1.209422, 1.002735, 0, 1, 0.5568628, 1,
-0.2214387, -1.093857, -2.619639, 0, 1, 0.5607843, 1,
-0.2197792, 1.261701, -0.3449659, 0, 1, 0.5686275, 1,
-0.2188955, 0.4856822, 1.111185, 0, 1, 0.572549, 1,
-0.2159464, 1.283539, -0.4174384, 0, 1, 0.5803922, 1,
-0.2086181, -0.1486868, -1.194627, 0, 1, 0.5843138, 1,
-0.2084461, -0.9243643, -2.211161, 0, 1, 0.5921569, 1,
-0.2072812, -0.3413407, -2.616069, 0, 1, 0.5960785, 1,
-0.2029854, 0.2891468, -1.261893, 0, 1, 0.6039216, 1,
-0.1951796, 1.306545, 0.5939745, 0, 1, 0.6117647, 1,
-0.1931777, -0.710878, -3.591207, 0, 1, 0.6156863, 1,
-0.1781238, -0.1384342, -0.8804318, 0, 1, 0.6235294, 1,
-0.1716093, -0.1994461, -2.682082, 0, 1, 0.627451, 1,
-0.1556749, 1.101728, 0.8680331, 0, 1, 0.6352941, 1,
-0.1531195, 1.241739, -0.1920528, 0, 1, 0.6392157, 1,
-0.1530168, -2.397719, -4.988016, 0, 1, 0.6470588, 1,
-0.1516034, -1.580477, -3.045762, 0, 1, 0.6509804, 1,
-0.1432356, 0.7981061, -0.8786927, 0, 1, 0.6588235, 1,
-0.141422, -1.536148, -3.018874, 0, 1, 0.6627451, 1,
-0.1376022, -0.2024919, -4.367069, 0, 1, 0.6705883, 1,
-0.1368007, 0.646329, -0.4204981, 0, 1, 0.6745098, 1,
-0.1362574, 0.7741029, -0.6986262, 0, 1, 0.682353, 1,
-0.1288967, -0.8749194, -3.857108, 0, 1, 0.6862745, 1,
-0.1276907, -0.6564359, -2.837013, 0, 1, 0.6941177, 1,
-0.1207374, 0.7544022, 0.392366, 0, 1, 0.7019608, 1,
-0.1204085, 0.2136151, -0.5953317, 0, 1, 0.7058824, 1,
-0.1177854, 1.411191, -0.6926047, 0, 1, 0.7137255, 1,
-0.1174228, 0.9640416, 1.719946, 0, 1, 0.7176471, 1,
-0.1173495, 0.4758544, -0.7543183, 0, 1, 0.7254902, 1,
-0.1132499, -0.6364253, -2.825646, 0, 1, 0.7294118, 1,
-0.109969, 1.236781, 1.574295, 0, 1, 0.7372549, 1,
-0.1043905, 0.4842933, -1.397326, 0, 1, 0.7411765, 1,
-0.09943713, -1.076247, -1.792361, 0, 1, 0.7490196, 1,
-0.09885698, 0.5057645, -2.029664, 0, 1, 0.7529412, 1,
-0.09606359, 0.5938011, 0.3156763, 0, 1, 0.7607843, 1,
-0.09604125, 0.633794, 1.092075, 0, 1, 0.7647059, 1,
-0.0950842, -1.339373, -2.654928, 0, 1, 0.772549, 1,
-0.08672736, 0.6701745, 1.902335, 0, 1, 0.7764706, 1,
-0.079427, 0.5810384, 0.9196731, 0, 1, 0.7843137, 1,
-0.07793391, 0.1283463, -2.222653, 0, 1, 0.7882353, 1,
-0.07134777, 0.08177235, -0.3350503, 0, 1, 0.7960784, 1,
-0.06454653, -0.7102326, -3.384975, 0, 1, 0.8039216, 1,
-0.06412449, -0.5892073, -3.555743, 0, 1, 0.8078431, 1,
-0.06151307, -0.01822601, -2.576367, 0, 1, 0.8156863, 1,
-0.06082232, -0.6942269, -2.967477, 0, 1, 0.8196079, 1,
-0.05569906, -0.2236819, -3.594332, 0, 1, 0.827451, 1,
-0.05310084, -0.9692833, -1.805201, 0, 1, 0.8313726, 1,
-0.05265541, 0.4550702, 1.185837, 0, 1, 0.8392157, 1,
-0.04519047, 0.8455459, -0.05559033, 0, 1, 0.8431373, 1,
-0.04383224, -0.05101387, -0.8131255, 0, 1, 0.8509804, 1,
-0.04380647, 0.3097638, 1.001873, 0, 1, 0.854902, 1,
-0.04362206, 1.271106, -0.2931711, 0, 1, 0.8627451, 1,
-0.04156371, -0.5685139, -3.264922, 0, 1, 0.8666667, 1,
-0.03504047, 1.059996, 0.4040733, 0, 1, 0.8745098, 1,
-0.03420714, 1.520336, 0.8473998, 0, 1, 0.8784314, 1,
-0.03115834, 0.04667865, -0.405634, 0, 1, 0.8862745, 1,
-0.02549986, -1.599678, -2.572003, 0, 1, 0.8901961, 1,
-0.02503276, -1.447072, -3.702096, 0, 1, 0.8980392, 1,
-0.02154719, -1.554311, -4.366734, 0, 1, 0.9058824, 1,
-0.01871697, 0.1430231, -0.1163815, 0, 1, 0.9098039, 1,
-0.01617659, 0.4205723, -0.5838566, 0, 1, 0.9176471, 1,
-0.01236769, -0.6684946, -2.116786, 0, 1, 0.9215686, 1,
-0.009633266, -0.3683922, -4.605634, 0, 1, 0.9294118, 1,
-0.009485249, -1.426386, -3.63203, 0, 1, 0.9333333, 1,
-0.008534431, -0.6466275, -2.434011, 0, 1, 0.9411765, 1,
-0.008021077, -0.4716617, -3.539699, 0, 1, 0.945098, 1,
-0.007927631, -0.2575019, -1.658732, 0, 1, 0.9529412, 1,
-0.007640639, -0.8751251, -3.773315, 0, 1, 0.9568627, 1,
-0.007167294, 1.088899, -0.4070113, 0, 1, 0.9647059, 1,
-0.005464505, -0.8245862, -2.275215, 0, 1, 0.9686275, 1,
0.001715244, 0.1819639, 0.5991902, 0, 1, 0.9764706, 1,
0.002561946, -1.207264, 0.3128422, 0, 1, 0.9803922, 1,
0.00698649, 0.5105051, 0.7393486, 0, 1, 0.9882353, 1,
0.008147295, 1.55092, -0.6054308, 0, 1, 0.9921569, 1,
0.01005366, -0.7542435, 3.289523, 0, 1, 1, 1,
0.01136115, -0.9512938, 0.1050014, 0, 0.9921569, 1, 1,
0.01835309, 2.10309, -1.629408, 0, 0.9882353, 1, 1,
0.01836533, -0.4768198, 2.83335, 0, 0.9803922, 1, 1,
0.02116285, -0.4023368, 1.718606, 0, 0.9764706, 1, 1,
0.02275516, 1.114941, -1.626546, 0, 0.9686275, 1, 1,
0.02444217, -0.9442297, 3.221279, 0, 0.9647059, 1, 1,
0.02560813, 0.5275416, 0.3373104, 0, 0.9568627, 1, 1,
0.02767653, -0.05820397, 1.794612, 0, 0.9529412, 1, 1,
0.02928506, 0.5074403, 1.21557, 0, 0.945098, 1, 1,
0.032897, -0.01657707, 0.5370929, 0, 0.9411765, 1, 1,
0.03565799, 0.8956553, -0.1596178, 0, 0.9333333, 1, 1,
0.03651572, -0.8503999, 2.729291, 0, 0.9294118, 1, 1,
0.03670212, -0.04521893, 4.008553, 0, 0.9215686, 1, 1,
0.037473, 0.3434104, 0.05774599, 0, 0.9176471, 1, 1,
0.03766773, -0.7951259, 4.050294, 0, 0.9098039, 1, 1,
0.04285438, -0.7404556, 3.792306, 0, 0.9058824, 1, 1,
0.0477289, 1.946262, -0.06391299, 0, 0.8980392, 1, 1,
0.05390964, -0.8930868, -0.03974596, 0, 0.8901961, 1, 1,
0.05397275, 1.496827, 0.6494582, 0, 0.8862745, 1, 1,
0.05560228, 0.8594249, -0.8962471, 0, 0.8784314, 1, 1,
0.05746622, -0.4766256, 2.800301, 0, 0.8745098, 1, 1,
0.05750354, 0.09268572, 0.7849585, 0, 0.8666667, 1, 1,
0.05903192, 1.838525, 0.8294655, 0, 0.8627451, 1, 1,
0.07393596, -2.170528, 1.801681, 0, 0.854902, 1, 1,
0.0768312, 0.8332577, -1.4665, 0, 0.8509804, 1, 1,
0.07906318, -1.814741, 3.357136, 0, 0.8431373, 1, 1,
0.08547578, 0.07739542, 0.3329839, 0, 0.8392157, 1, 1,
0.08614456, 0.03618024, 2.577881, 0, 0.8313726, 1, 1,
0.09143457, 1.752484, 0.2488496, 0, 0.827451, 1, 1,
0.09548205, 0.4933204, 1.082155, 0, 0.8196079, 1, 1,
0.09852342, 1.035975, 0.6887485, 0, 0.8156863, 1, 1,
0.1006858, -1.325325, 4.144819, 0, 0.8078431, 1, 1,
0.1093559, 1.363509, 0.9104268, 0, 0.8039216, 1, 1,
0.1122829, 0.9610917, -0.3591164, 0, 0.7960784, 1, 1,
0.1131365, -0.3791741, 2.930456, 0, 0.7882353, 1, 1,
0.1157786, 1.515143, 0.6537229, 0, 0.7843137, 1, 1,
0.1181211, 1.275715, 0.6528809, 0, 0.7764706, 1, 1,
0.1188193, 1.975369, 1.120382, 0, 0.772549, 1, 1,
0.1232115, -0.2207003, 2.776528, 0, 0.7647059, 1, 1,
0.1280553, 0.8250285, -0.1263099, 0, 0.7607843, 1, 1,
0.1301894, 0.2751876, -0.8647696, 0, 0.7529412, 1, 1,
0.1310432, 0.6610257, 0.8257188, 0, 0.7490196, 1, 1,
0.1318362, 0.7181287, -1.121257, 0, 0.7411765, 1, 1,
0.132642, 1.053412, 0.4764099, 0, 0.7372549, 1, 1,
0.1333903, -0.475679, 1.861014, 0, 0.7294118, 1, 1,
0.133604, -0.6254058, 3.149385, 0, 0.7254902, 1, 1,
0.1339903, -1.511694, 2.917664, 0, 0.7176471, 1, 1,
0.1340723, 1.345385, 0.6734234, 0, 0.7137255, 1, 1,
0.1373183, 0.5829394, 1.033006, 0, 0.7058824, 1, 1,
0.1387516, 1.30078, -1.106456, 0, 0.6980392, 1, 1,
0.1490926, 0.882036, -0.8522536, 0, 0.6941177, 1, 1,
0.1516486, -0.7727435, 4.442617, 0, 0.6862745, 1, 1,
0.1548185, -0.4484798, 3.298272, 0, 0.682353, 1, 1,
0.1553115, 0.3371253, 1.192435, 0, 0.6745098, 1, 1,
0.1562169, 0.4830328, -0.4555468, 0, 0.6705883, 1, 1,
0.1576091, -0.480589, 4.312599, 0, 0.6627451, 1, 1,
0.1576104, 0.3983907, 1.542194, 0, 0.6588235, 1, 1,
0.1596491, 0.09669042, -0.7427963, 0, 0.6509804, 1, 1,
0.1608053, 0.2485782, 0.6192456, 0, 0.6470588, 1, 1,
0.1647283, 0.272689, 1.076427, 0, 0.6392157, 1, 1,
0.1659124, 1.214647, 1.177137, 0, 0.6352941, 1, 1,
0.1666634, -0.6317085, 2.011369, 0, 0.627451, 1, 1,
0.1677672, 0.5856209, 0.6943702, 0, 0.6235294, 1, 1,
0.1682955, -0.3015375, 1.063907, 0, 0.6156863, 1, 1,
0.1734233, -1.052042, 2.734449, 0, 0.6117647, 1, 1,
0.1747608, -0.3507811, 3.726708, 0, 0.6039216, 1, 1,
0.1757028, -1.211921, 4.742207, 0, 0.5960785, 1, 1,
0.1765585, -1.179164, 2.394786, 0, 0.5921569, 1, 1,
0.1780977, -0.2425848, 3.100238, 0, 0.5843138, 1, 1,
0.1782428, -0.009664457, 1.103555, 0, 0.5803922, 1, 1,
0.1795768, -1.632188, 3.30383, 0, 0.572549, 1, 1,
0.1797175, -0.3039121, 4.308049, 0, 0.5686275, 1, 1,
0.180442, 2.014587, 0.5141606, 0, 0.5607843, 1, 1,
0.1827246, 0.9143813, -0.01421017, 0, 0.5568628, 1, 1,
0.1849659, 0.9536775, 1.093376, 0, 0.5490196, 1, 1,
0.1898607, 1.104301, 0.2345916, 0, 0.5450981, 1, 1,
0.1913782, 2.72134, 1.351068, 0, 0.5372549, 1, 1,
0.1944223, -1.387947, 1.842279, 0, 0.5333334, 1, 1,
0.201336, -0.1525374, 2.707099, 0, 0.5254902, 1, 1,
0.2027689, -0.8275763, 2.265955, 0, 0.5215687, 1, 1,
0.2032557, 0.4537029, 1.866529, 0, 0.5137255, 1, 1,
0.210653, 0.5385364, 1.193373, 0, 0.509804, 1, 1,
0.2122991, 0.5992261, 0.8679013, 0, 0.5019608, 1, 1,
0.21593, -0.1536065, 1.36453, 0, 0.4941176, 1, 1,
0.2165114, -0.09282485, 0.9668127, 0, 0.4901961, 1, 1,
0.2220698, -0.9723383, 1.989099, 0, 0.4823529, 1, 1,
0.2315049, 0.4880932, 0.09277927, 0, 0.4784314, 1, 1,
0.2325592, -0.2229035, 2.762151, 0, 0.4705882, 1, 1,
0.2330915, 0.6663668, -0.1149285, 0, 0.4666667, 1, 1,
0.2379036, 0.9210454, 1.17821, 0, 0.4588235, 1, 1,
0.2379609, -0.1288841, 2.380746, 0, 0.454902, 1, 1,
0.2406187, 1.116489, -0.5196082, 0, 0.4470588, 1, 1,
0.2429277, -1.368329, 2.897122, 0, 0.4431373, 1, 1,
0.2474494, -0.6074799, 2.147215, 0, 0.4352941, 1, 1,
0.2503963, 0.4635888, -1.519603, 0, 0.4313726, 1, 1,
0.2509579, 0.9001411, 1.776959, 0, 0.4235294, 1, 1,
0.2516519, -0.1207659, 3.33872, 0, 0.4196078, 1, 1,
0.2518655, 0.1905951, 1.379053, 0, 0.4117647, 1, 1,
0.2530806, -0.7049164, 4.19259, 0, 0.4078431, 1, 1,
0.2653565, -2.521322, 3.654912, 0, 0.4, 1, 1,
0.2656533, 0.3690943, 2.811692, 0, 0.3921569, 1, 1,
0.2739516, 0.8858563, 1.065278, 0, 0.3882353, 1, 1,
0.2751264, 0.1559363, 0.9222395, 0, 0.3803922, 1, 1,
0.2851942, -0.4756728, 2.576421, 0, 0.3764706, 1, 1,
0.2893461, -0.5230154, 2.202806, 0, 0.3686275, 1, 1,
0.2901222, 0.3266345, 0.4292705, 0, 0.3647059, 1, 1,
0.2933209, -0.847719, 1.094954, 0, 0.3568628, 1, 1,
0.2987449, 0.5827819, 1.380915, 0, 0.3529412, 1, 1,
0.3033141, 1.179384, 0.9487715, 0, 0.345098, 1, 1,
0.3064046, -0.1380695, 2.600714, 0, 0.3411765, 1, 1,
0.3064452, -1.704524, 2.03141, 0, 0.3333333, 1, 1,
0.3071214, -0.9515561, 4.294963, 0, 0.3294118, 1, 1,
0.3084714, -1.340699, 2.559668, 0, 0.3215686, 1, 1,
0.310745, -1.437723, 3.73229, 0, 0.3176471, 1, 1,
0.3164032, -1.638507, 2.743296, 0, 0.3098039, 1, 1,
0.3165067, -0.2814345, 1.173273, 0, 0.3058824, 1, 1,
0.3190194, -0.04823092, 1.874782, 0, 0.2980392, 1, 1,
0.3192444, 0.1819133, 1.641172, 0, 0.2901961, 1, 1,
0.3196957, 1.334043, -1.771961, 0, 0.2862745, 1, 1,
0.324418, -0.351028, 2.525319, 0, 0.2784314, 1, 1,
0.324486, 0.8757793, 0.2081065, 0, 0.2745098, 1, 1,
0.3291554, -0.8238945, 2.488726, 0, 0.2666667, 1, 1,
0.3295092, -0.3429064, 1.479158, 0, 0.2627451, 1, 1,
0.3321898, 0.247623, 0.6577058, 0, 0.254902, 1, 1,
0.3366848, 0.8852152, 1.242653, 0, 0.2509804, 1, 1,
0.3388226, 0.01143382, 1.886281, 0, 0.2431373, 1, 1,
0.351634, 1.035882, -0.1306813, 0, 0.2392157, 1, 1,
0.3569703, 0.1932462, 0.6018643, 0, 0.2313726, 1, 1,
0.3598656, 1.093967, 0.588545, 0, 0.227451, 1, 1,
0.3610919, 0.6738742, 2.539408, 0, 0.2196078, 1, 1,
0.3622923, -0.3244574, 2.134271, 0, 0.2156863, 1, 1,
0.3636807, -0.2353063, 1.940832, 0, 0.2078431, 1, 1,
0.3680429, -1.119668, 4.968522, 0, 0.2039216, 1, 1,
0.3729503, -0.4132955, 1.958021, 0, 0.1960784, 1, 1,
0.3790081, 0.9326363, 2.780417, 0, 0.1882353, 1, 1,
0.3790305, -1.371918, 3.789446, 0, 0.1843137, 1, 1,
0.3798413, 1.084613, -0.9665878, 0, 0.1764706, 1, 1,
0.3800189, 0.7461607, 0.07039545, 0, 0.172549, 1, 1,
0.3833759, -1.886772, 1.779704, 0, 0.1647059, 1, 1,
0.3876464, 0.227621, 0.6839613, 0, 0.1607843, 1, 1,
0.3912277, 0.6915981, 1.772337, 0, 0.1529412, 1, 1,
0.3969775, -0.3292831, 4.30979, 0, 0.1490196, 1, 1,
0.3971638, -0.8126109, 2.6105, 0, 0.1411765, 1, 1,
0.4002108, -0.2056932, 2.580107, 0, 0.1372549, 1, 1,
0.4038606, 0.8301458, 2.390803, 0, 0.1294118, 1, 1,
0.4074736, -2.347375, 1.607732, 0, 0.1254902, 1, 1,
0.4138488, -0.4218135, 3.171842, 0, 0.1176471, 1, 1,
0.4165953, 0.1762574, 1.647456, 0, 0.1137255, 1, 1,
0.4207028, 0.7128876, -0.931183, 0, 0.1058824, 1, 1,
0.4233298, 0.5626622, 1.66724, 0, 0.09803922, 1, 1,
0.4237827, 0.8823196, 0.1701707, 0, 0.09411765, 1, 1,
0.4278213, 0.1936367, 0.1924192, 0, 0.08627451, 1, 1,
0.4299684, -0.1282921, 0.8665416, 0, 0.08235294, 1, 1,
0.4310603, -0.01641323, 3.495372, 0, 0.07450981, 1, 1,
0.4328703, -2.145796, 2.674059, 0, 0.07058824, 1, 1,
0.4334505, -1.223308, 2.997465, 0, 0.0627451, 1, 1,
0.4407784, 0.6394823, -0.9238415, 0, 0.05882353, 1, 1,
0.4411254, -0.4985166, 4.364382, 0, 0.05098039, 1, 1,
0.4459876, -0.7544398, 3.557285, 0, 0.04705882, 1, 1,
0.4479452, 0.2353095, 1.91811, 0, 0.03921569, 1, 1,
0.4492472, 0.4377688, 0.1471251, 0, 0.03529412, 1, 1,
0.4512012, 0.8141483, 0.2576489, 0, 0.02745098, 1, 1,
0.4520756, -0.9693789, 2.653939, 0, 0.02352941, 1, 1,
0.4523838, 0.907564, -0.4885229, 0, 0.01568628, 1, 1,
0.4530152, 0.8413208, 1.339839, 0, 0.01176471, 1, 1,
0.4531513, 1.64121, 0.3593092, 0, 0.003921569, 1, 1,
0.454833, 1.67251, 1.238065, 0.003921569, 0, 1, 1,
0.4554475, -0.3671489, 2.278036, 0.007843138, 0, 1, 1,
0.4570119, -0.1988281, 2.187099, 0.01568628, 0, 1, 1,
0.4583666, 0.6106112, 0.8683223, 0.01960784, 0, 1, 1,
0.4656418, 0.749136, 1.046148, 0.02745098, 0, 1, 1,
0.4663901, -0.01449159, 1.383707, 0.03137255, 0, 1, 1,
0.4669861, 0.7233152, 2.026308, 0.03921569, 0, 1, 1,
0.4688148, -0.2072701, 2.412088, 0.04313726, 0, 1, 1,
0.4710212, -1.483638, 4.302492, 0.05098039, 0, 1, 1,
0.4718615, -0.7397729, 3.737928, 0.05490196, 0, 1, 1,
0.4727369, 0.8853945, -0.236688, 0.0627451, 0, 1, 1,
0.4777698, 0.5648342, 1.460375, 0.06666667, 0, 1, 1,
0.4828562, 0.8261083, 1.446856, 0.07450981, 0, 1, 1,
0.4870286, -0.6014807, 1.177013, 0.07843138, 0, 1, 1,
0.4926261, 0.6466975, 1.248678, 0.08627451, 0, 1, 1,
0.4931379, -0.4316866, 2.631526, 0.09019608, 0, 1, 1,
0.4936541, 0.9411996, -0.0548289, 0.09803922, 0, 1, 1,
0.493941, 1.296284, 1.525925, 0.1058824, 0, 1, 1,
0.4940208, -0.7494919, 2.745737, 0.1098039, 0, 1, 1,
0.4966006, -1.57114, 4.502612, 0.1176471, 0, 1, 1,
0.4986227, 0.9531072, 1.057691, 0.1215686, 0, 1, 1,
0.5011747, 2.143706, -0.9101421, 0.1294118, 0, 1, 1,
0.5027508, -0.8078698, 1.058624, 0.1333333, 0, 1, 1,
0.5056223, -0.02622364, 0.7068663, 0.1411765, 0, 1, 1,
0.5107307, -0.1169454, 1.990805, 0.145098, 0, 1, 1,
0.511613, 0.08736012, 1.468522, 0.1529412, 0, 1, 1,
0.513384, 0.3278398, 1.795323, 0.1568628, 0, 1, 1,
0.518575, 1.198862, 0.5805677, 0.1647059, 0, 1, 1,
0.5241778, -1.298483, 2.746873, 0.1686275, 0, 1, 1,
0.5267715, -0.6008715, 2.87116, 0.1764706, 0, 1, 1,
0.5268095, -0.417213, 3.361608, 0.1803922, 0, 1, 1,
0.5280423, 0.08789555, 0.4955935, 0.1882353, 0, 1, 1,
0.5306106, 0.283659, 0.9124847, 0.1921569, 0, 1, 1,
0.5316401, 0.8189138, -0.8542075, 0.2, 0, 1, 1,
0.5354098, 0.2019998, 0.2011122, 0.2078431, 0, 1, 1,
0.5361596, -1.289957, 4.456841, 0.2117647, 0, 1, 1,
0.5376009, -0.5269059, 0.9987529, 0.2196078, 0, 1, 1,
0.5382507, -0.03677457, 0.4076292, 0.2235294, 0, 1, 1,
0.5385857, 1.218452, 1.044023, 0.2313726, 0, 1, 1,
0.5389618, -0.4418547, 2.144502, 0.2352941, 0, 1, 1,
0.5421352, -0.02961069, 1.047146, 0.2431373, 0, 1, 1,
0.5435805, 0.04827011, 0.2996752, 0.2470588, 0, 1, 1,
0.5439688, -0.06206205, 2.092654, 0.254902, 0, 1, 1,
0.5472679, -0.1685567, -0.4113314, 0.2588235, 0, 1, 1,
0.555663, -0.7734204, 1.836742, 0.2666667, 0, 1, 1,
0.5603821, -0.3325527, 0.3083076, 0.2705882, 0, 1, 1,
0.5607387, -0.3970172, 2.609685, 0.2784314, 0, 1, 1,
0.5618785, -0.5895131, 2.361586, 0.282353, 0, 1, 1,
0.5640185, -1.176022, 4.793009, 0.2901961, 0, 1, 1,
0.5659316, 0.09712624, 1.913854, 0.2941177, 0, 1, 1,
0.5669911, -0.9549156, 1.870042, 0.3019608, 0, 1, 1,
0.5682595, -0.09741828, 2.448662, 0.3098039, 0, 1, 1,
0.5704216, 0.9978409, 0.2455035, 0.3137255, 0, 1, 1,
0.5707749, 1.443647, -0.9415649, 0.3215686, 0, 1, 1,
0.5735227, -1.940671, 2.860017, 0.3254902, 0, 1, 1,
0.5736797, 0.7368581, 1.843886, 0.3333333, 0, 1, 1,
0.5757458, 0.2133296, 2.587935, 0.3372549, 0, 1, 1,
0.5759351, -2.482849, 2.342534, 0.345098, 0, 1, 1,
0.5797959, -0.8291609, 3.786655, 0.3490196, 0, 1, 1,
0.5842154, -0.8213536, 3.250607, 0.3568628, 0, 1, 1,
0.5881957, -1.104249, 1.620526, 0.3607843, 0, 1, 1,
0.5886413, -0.7862445, 3.182822, 0.3686275, 0, 1, 1,
0.5886616, 0.5398384, 0.5222229, 0.372549, 0, 1, 1,
0.5924591, 0.4652658, 2.249412, 0.3803922, 0, 1, 1,
0.5955685, -1.325416, 1.742837, 0.3843137, 0, 1, 1,
0.5999561, 0.3175439, 1.121169, 0.3921569, 0, 1, 1,
0.6013054, -0.2573746, 0.596705, 0.3960784, 0, 1, 1,
0.6018892, -0.002581261, 1.237294, 0.4039216, 0, 1, 1,
0.6025732, -0.4364761, 0.7882813, 0.4117647, 0, 1, 1,
0.6058782, 0.8759186, 0.3241121, 0.4156863, 0, 1, 1,
0.619121, 0.1185867, 0.5854471, 0.4235294, 0, 1, 1,
0.6191947, 0.03656533, 1.801123, 0.427451, 0, 1, 1,
0.6218322, -1.149404, 2.546157, 0.4352941, 0, 1, 1,
0.6245738, -1.321078, 2.365833, 0.4392157, 0, 1, 1,
0.6293716, -0.4199, 0.5093137, 0.4470588, 0, 1, 1,
0.6300337, -0.2965732, 1.838097, 0.4509804, 0, 1, 1,
0.6319835, -0.02407031, 1.803739, 0.4588235, 0, 1, 1,
0.6347793, -0.246299, 1.819244, 0.4627451, 0, 1, 1,
0.6368656, -0.1148705, 1.49184, 0.4705882, 0, 1, 1,
0.6399244, -1.199518, 0.9971542, 0.4745098, 0, 1, 1,
0.6416622, -0.7595539, 2.487716, 0.4823529, 0, 1, 1,
0.6452178, 0.3965623, 0.6803533, 0.4862745, 0, 1, 1,
0.6467304, -1.04992, 0.6215243, 0.4941176, 0, 1, 1,
0.649708, 0.4608681, -0.9585097, 0.5019608, 0, 1, 1,
0.6511595, 1.413496, 0.5380344, 0.5058824, 0, 1, 1,
0.6516861, 0.4755753, 2.631717, 0.5137255, 0, 1, 1,
0.6555418, 0.8706819, 2.106116, 0.5176471, 0, 1, 1,
0.6590274, 0.2146933, 1.500535, 0.5254902, 0, 1, 1,
0.6613651, 0.110467, -0.6919962, 0.5294118, 0, 1, 1,
0.6629087, -0.9611216, 4.547673, 0.5372549, 0, 1, 1,
0.6654665, -0.8171884, 2.341022, 0.5411765, 0, 1, 1,
0.6709273, -0.5182577, 1.997336, 0.5490196, 0, 1, 1,
0.6714176, 0.1473065, -0.4068481, 0.5529412, 0, 1, 1,
0.6735103, 1.833522, 1.384972, 0.5607843, 0, 1, 1,
0.6890616, -0.06642991, 2.489091, 0.5647059, 0, 1, 1,
0.6917267, 1.51399, -0.7514496, 0.572549, 0, 1, 1,
0.6947802, -0.09775514, 2.778351, 0.5764706, 0, 1, 1,
0.6968732, -0.5184612, 3.338779, 0.5843138, 0, 1, 1,
0.6994529, -1.0535, 4.109871, 0.5882353, 0, 1, 1,
0.7013375, 0.4177049, -0.1032209, 0.5960785, 0, 1, 1,
0.7024606, -0.4111538, 2.418394, 0.6039216, 0, 1, 1,
0.7040278, 0.3960181, -0.8275409, 0.6078432, 0, 1, 1,
0.7063704, 0.5901032, 1.79151, 0.6156863, 0, 1, 1,
0.7066066, -0.8689261, 1.209979, 0.6196079, 0, 1, 1,
0.7161803, 1.426093, 0.2204855, 0.627451, 0, 1, 1,
0.7208876, 1.212305, -0.531611, 0.6313726, 0, 1, 1,
0.7214996, 2.160431, -0.3239111, 0.6392157, 0, 1, 1,
0.7219837, 1.334736, 0.7284185, 0.6431373, 0, 1, 1,
0.7271543, 0.9592832, 0.7418143, 0.6509804, 0, 1, 1,
0.7282676, 0.4424985, 1.586682, 0.654902, 0, 1, 1,
0.7340913, -1.363388, 3.084969, 0.6627451, 0, 1, 1,
0.7352754, -0.5345556, 0.4453071, 0.6666667, 0, 1, 1,
0.7370692, 0.2362096, 2.109028, 0.6745098, 0, 1, 1,
0.7374075, 0.8853371, 2.52637, 0.6784314, 0, 1, 1,
0.7398083, -0.7483727, 2.125703, 0.6862745, 0, 1, 1,
0.7486959, 0.7183996, 1.376707, 0.6901961, 0, 1, 1,
0.7489707, 0.07308424, -0.2255931, 0.6980392, 0, 1, 1,
0.7500813, 0.2259135, 1.255573, 0.7058824, 0, 1, 1,
0.7612783, 0.2814711, 1.96532, 0.7098039, 0, 1, 1,
0.7636715, -0.6838065, 3.426764, 0.7176471, 0, 1, 1,
0.765043, 2.190485, 1.918259, 0.7215686, 0, 1, 1,
0.7675294, -0.04776935, 2.133134, 0.7294118, 0, 1, 1,
0.7691348, -0.2902928, 0.03905603, 0.7333333, 0, 1, 1,
0.7703976, -0.8158979, 3.610409, 0.7411765, 0, 1, 1,
0.7752865, -1.015165, 1.737599, 0.7450981, 0, 1, 1,
0.7777605, 1.290579, 1.184113, 0.7529412, 0, 1, 1,
0.7798162, -0.04820281, 0.6732473, 0.7568628, 0, 1, 1,
0.780174, -0.9261133, 3.838537, 0.7647059, 0, 1, 1,
0.7863105, 0.3386411, 0.1725398, 0.7686275, 0, 1, 1,
0.7866243, 0.01891537, 0.4490353, 0.7764706, 0, 1, 1,
0.7882784, -0.5273398, 3.262899, 0.7803922, 0, 1, 1,
0.7969471, 0.9614614, 1.688131, 0.7882353, 0, 1, 1,
0.8088595, -2.36875, 3.293679, 0.7921569, 0, 1, 1,
0.809578, -0.4908255, 3.105352, 0.8, 0, 1, 1,
0.81149, 0.4144252, -1.544909, 0.8078431, 0, 1, 1,
0.8162461, -0.5095934, 2.705811, 0.8117647, 0, 1, 1,
0.8211739, -0.8255464, 1.272716, 0.8196079, 0, 1, 1,
0.8227355, 0.4031613, 0.9431725, 0.8235294, 0, 1, 1,
0.824471, 1.106116, 1.251826, 0.8313726, 0, 1, 1,
0.831985, 0.6653366, 2.433518, 0.8352941, 0, 1, 1,
0.8333926, -0.9367105, 1.088849, 0.8431373, 0, 1, 1,
0.8376696, 0.8370998, 1.528643, 0.8470588, 0, 1, 1,
0.8403565, -0.1561473, 2.074122, 0.854902, 0, 1, 1,
0.8413498, 0.2674711, 1.304945, 0.8588235, 0, 1, 1,
0.8424906, 0.2143284, 0.3947855, 0.8666667, 0, 1, 1,
0.8473205, 0.524841, 0.08643025, 0.8705882, 0, 1, 1,
0.8483058, 1.774554, 2.301518, 0.8784314, 0, 1, 1,
0.8502313, 1.051787, 1.26526, 0.8823529, 0, 1, 1,
0.8537329, -0.437001, 2.023949, 0.8901961, 0, 1, 1,
0.8624103, -0.04801954, 1.943767, 0.8941177, 0, 1, 1,
0.8630384, 0.6265218, 2.194358, 0.9019608, 0, 1, 1,
0.8752429, -0.1354588, 0.2742526, 0.9098039, 0, 1, 1,
0.886708, 0.382945, 0.9888989, 0.9137255, 0, 1, 1,
0.8881032, 1.226757, 0.3920574, 0.9215686, 0, 1, 1,
0.8929844, 0.7474689, 0.8985608, 0.9254902, 0, 1, 1,
0.9033231, -0.09952698, 1.179384, 0.9333333, 0, 1, 1,
0.9074574, 0.2679336, 1.398834, 0.9372549, 0, 1, 1,
0.9098098, -0.5816783, 2.923722, 0.945098, 0, 1, 1,
0.9181697, -0.3648618, 2.440602, 0.9490196, 0, 1, 1,
0.918465, -0.5510615, 2.302402, 0.9568627, 0, 1, 1,
0.920157, 0.1334936, 2.345467, 0.9607843, 0, 1, 1,
0.9400042, 0.2038422, 2.358497, 0.9686275, 0, 1, 1,
0.9404692, 0.466709, -0.6389506, 0.972549, 0, 1, 1,
0.9406614, -2.55407, 1.872607, 0.9803922, 0, 1, 1,
0.9658521, -0.2452604, 2.028864, 0.9843137, 0, 1, 1,
0.9668546, -1.861016, 1.265077, 0.9921569, 0, 1, 1,
0.9721861, 0.2437918, 2.939769, 0.9960784, 0, 1, 1,
0.9827996, 0.3673557, 0.8328173, 1, 0, 0.9960784, 1,
0.9948493, 0.0803415, 1.938637, 1, 0, 0.9882353, 1,
0.9965181, -0.8399048, 2.977358, 1, 0, 0.9843137, 1,
0.9983131, -0.2996571, 3.35955, 1, 0, 0.9764706, 1,
1.006763, 0.3650167, -0.03409001, 1, 0, 0.972549, 1,
1.014636, -1.519707, 1.688648, 1, 0, 0.9647059, 1,
1.025242, -0.5533497, 0.7221919, 1, 0, 0.9607843, 1,
1.025641, -0.1974325, 1.241413, 1, 0, 0.9529412, 1,
1.028957, -0.2245048, 2.624574, 1, 0, 0.9490196, 1,
1.029466, -1.608828, 2.12426, 1, 0, 0.9411765, 1,
1.03236, 1.291757, 0.03089468, 1, 0, 0.9372549, 1,
1.040776, 0.7615284, 1.256912, 1, 0, 0.9294118, 1,
1.046932, -0.9159284, 2.760003, 1, 0, 0.9254902, 1,
1.047225, -0.5161011, 2.351595, 1, 0, 0.9176471, 1,
1.047288, 0.6483105, 1.210358, 1, 0, 0.9137255, 1,
1.047725, -0.3768797, 1.349834, 1, 0, 0.9058824, 1,
1.05001, 0.9084504, 0.3059341, 1, 0, 0.9019608, 1,
1.052798, 2.171691, -0.4159111, 1, 0, 0.8941177, 1,
1.056582, -1.314007, 2.12389, 1, 0, 0.8862745, 1,
1.059493, 0.6054891, 2.284619, 1, 0, 0.8823529, 1,
1.062213, 1.696433, -0.9593126, 1, 0, 0.8745098, 1,
1.062691, 0.6406806, 2.052983, 1, 0, 0.8705882, 1,
1.066482, -0.4506598, -0.473427, 1, 0, 0.8627451, 1,
1.071874, 0.1459139, 1.080463, 1, 0, 0.8588235, 1,
1.074454, -0.06523959, 0.844705, 1, 0, 0.8509804, 1,
1.08829, 0.3438594, 2.539625, 1, 0, 0.8470588, 1,
1.090017, -1.99331, 1.291513, 1, 0, 0.8392157, 1,
1.091614, 0.5707328, 1.761091, 1, 0, 0.8352941, 1,
1.095138, 0.8644982, 1.492188, 1, 0, 0.827451, 1,
1.108227, -0.6940318, 0.114244, 1, 0, 0.8235294, 1,
1.112294, -0.03456785, 2.536036, 1, 0, 0.8156863, 1,
1.120744, -1.180433, 3.349386, 1, 0, 0.8117647, 1,
1.122387, 0.5949399, 2.778081, 1, 0, 0.8039216, 1,
1.128351, 0.4300771, 2.317338, 1, 0, 0.7960784, 1,
1.133489, 0.02078765, 4.077456, 1, 0, 0.7921569, 1,
1.141889, 1.260987, -0.4153409, 1, 0, 0.7843137, 1,
1.157342, 0.6629927, 3.189678, 1, 0, 0.7803922, 1,
1.160609, 0.9133701, -1.141243, 1, 0, 0.772549, 1,
1.165518, -1.590961, 2.940033, 1, 0, 0.7686275, 1,
1.175943, 0.03704811, 1.964035, 1, 0, 0.7607843, 1,
1.181242, 0.9368534, 3.159297, 1, 0, 0.7568628, 1,
1.182948, 0.009804619, 2.88938, 1, 0, 0.7490196, 1,
1.1855, 0.3016075, 0.7127719, 1, 0, 0.7450981, 1,
1.187389, -0.8845683, 2.121922, 1, 0, 0.7372549, 1,
1.189922, -0.6189603, 0.4693807, 1, 0, 0.7333333, 1,
1.192497, -0.3571822, 2.144695, 1, 0, 0.7254902, 1,
1.193176, 2.151234, -0.1393207, 1, 0, 0.7215686, 1,
1.19442, -1.903372, 3.13573, 1, 0, 0.7137255, 1,
1.195598, -0.2607571, 2.806118, 1, 0, 0.7098039, 1,
1.197717, -0.2876721, 1.559452, 1, 0, 0.7019608, 1,
1.198694, 0.1298021, 0.709852, 1, 0, 0.6941177, 1,
1.203997, 0.7576736, 0.1991552, 1, 0, 0.6901961, 1,
1.206383, -0.5045672, 2.101227, 1, 0, 0.682353, 1,
1.213421, 1.328987, 0.3992043, 1, 0, 0.6784314, 1,
1.21558, -0.2797027, 2.21874, 1, 0, 0.6705883, 1,
1.222035, 0.3090998, 1.521486, 1, 0, 0.6666667, 1,
1.228725, -0.3398099, 1.929183, 1, 0, 0.6588235, 1,
1.232083, 0.5187462, 0.4876878, 1, 0, 0.654902, 1,
1.234402, -0.8786688, 1.78887, 1, 0, 0.6470588, 1,
1.239137, -0.4006922, 0.1650642, 1, 0, 0.6431373, 1,
1.254279, 0.7501296, 1.787901, 1, 0, 0.6352941, 1,
1.263622, -1.41155, 1.087634, 1, 0, 0.6313726, 1,
1.265852, 0.6239815, 1.314873, 1, 0, 0.6235294, 1,
1.267305, 0.121414, 3.775348, 1, 0, 0.6196079, 1,
1.273355, -1.153896, 0.2627072, 1, 0, 0.6117647, 1,
1.276043, 0.07454552, 0.825386, 1, 0, 0.6078432, 1,
1.27937, -0.3708165, 2.271372, 1, 0, 0.6, 1,
1.27967, -1.089067, 2.834606, 1, 0, 0.5921569, 1,
1.287472, 0.7434884, 0.6657264, 1, 0, 0.5882353, 1,
1.313664, -1.095777, 3.05535, 1, 0, 0.5803922, 1,
1.316047, 1.003273, 0.2728795, 1, 0, 0.5764706, 1,
1.324062, 0.5778658, 0.1390295, 1, 0, 0.5686275, 1,
1.341049, -0.4438974, 2.575096, 1, 0, 0.5647059, 1,
1.343086, 0.501448, 0.7638677, 1, 0, 0.5568628, 1,
1.344246, 0.1224744, 1.102109, 1, 0, 0.5529412, 1,
1.352963, -0.7115211, 2.474556, 1, 0, 0.5450981, 1,
1.352985, 0.676815, 0.6409093, 1, 0, 0.5411765, 1,
1.366002, -1.449507, 2.8177, 1, 0, 0.5333334, 1,
1.368982, -0.7674947, 3.348984, 1, 0, 0.5294118, 1,
1.369352, -1.800528, 3.329524, 1, 0, 0.5215687, 1,
1.377786, 0.05099761, 1.464072, 1, 0, 0.5176471, 1,
1.386969, -1.114502, 2.870466, 1, 0, 0.509804, 1,
1.391831, -0.6544446, 1.855043, 1, 0, 0.5058824, 1,
1.405576, -1.305601, 2.272383, 1, 0, 0.4980392, 1,
1.411917, 0.9746096, 0.9641579, 1, 0, 0.4901961, 1,
1.420211, 0.8204753, 2.040872, 1, 0, 0.4862745, 1,
1.425528, -0.7302597, 1.655508, 1, 0, 0.4784314, 1,
1.428572, 0.3905204, 0.7194113, 1, 0, 0.4745098, 1,
1.455729, -0.8229698, 2.259732, 1, 0, 0.4666667, 1,
1.458667, 0.7015118, 0.494738, 1, 0, 0.4627451, 1,
1.465757, -0.5148662, 2.191819, 1, 0, 0.454902, 1,
1.468131, -0.4812485, 3.017135, 1, 0, 0.4509804, 1,
1.470515, -0.3125007, 1.336531, 1, 0, 0.4431373, 1,
1.492856, 0.2242336, 1.418742, 1, 0, 0.4392157, 1,
1.493119, -0.2697884, 0.9637936, 1, 0, 0.4313726, 1,
1.495422, -0.2054562, 0.6523172, 1, 0, 0.427451, 1,
1.500063, -1.06927, 2.309981, 1, 0, 0.4196078, 1,
1.523824, -0.4828778, 2.301871, 1, 0, 0.4156863, 1,
1.524488, -0.4886036, 0.861078, 1, 0, 0.4078431, 1,
1.526171, 0.919273, 0.6659952, 1, 0, 0.4039216, 1,
1.53647, -1.303866, 1.395378, 1, 0, 0.3960784, 1,
1.538239, 1.066693, 1.868966, 1, 0, 0.3882353, 1,
1.540564, 1.251006, 0.4569528, 1, 0, 0.3843137, 1,
1.542363, -1.046208, 2.819981, 1, 0, 0.3764706, 1,
1.545787, -0.5133011, 2.366313, 1, 0, 0.372549, 1,
1.563374, 0.690505, 2.013647, 1, 0, 0.3647059, 1,
1.564576, -0.006865254, 2.657129, 1, 0, 0.3607843, 1,
1.576967, 0.07415312, 0.7497257, 1, 0, 0.3529412, 1,
1.577449, 1.243733, 0.807124, 1, 0, 0.3490196, 1,
1.578149, 1.550845, 2.028357, 1, 0, 0.3411765, 1,
1.581394, 0.04867543, 1.833299, 1, 0, 0.3372549, 1,
1.593039, -1.450356, 4.173161, 1, 0, 0.3294118, 1,
1.595625, -0.8688532, 1.47523, 1, 0, 0.3254902, 1,
1.604565, 0.176412, -0.0507834, 1, 0, 0.3176471, 1,
1.632416, -0.9628322, 4.481655, 1, 0, 0.3137255, 1,
1.638303, -1.140903, 3.532383, 1, 0, 0.3058824, 1,
1.65195, -0.9174566, 2.734604, 1, 0, 0.2980392, 1,
1.658191, -0.9285007, 1.909017, 1, 0, 0.2941177, 1,
1.683124, -0.940565, 1.358517, 1, 0, 0.2862745, 1,
1.691784, -1.520908, 2.737385, 1, 0, 0.282353, 1,
1.703649, -0.2999034, 1.562884, 1, 0, 0.2745098, 1,
1.707169, 0.9415935, 1.127752, 1, 0, 0.2705882, 1,
1.711041, 1.819137, 1.401474, 1, 0, 0.2627451, 1,
1.742899, 1.651327, 0.4447592, 1, 0, 0.2588235, 1,
1.771569, 1.31608, 1.077701, 1, 0, 0.2509804, 1,
1.771918, 0.7756786, 1.408032, 1, 0, 0.2470588, 1,
1.784858, 0.2564801, 1.424023, 1, 0, 0.2392157, 1,
1.786384, 3.42181, -0.01216077, 1, 0, 0.2352941, 1,
1.829464, 1.866502, 1.021653, 1, 0, 0.227451, 1,
1.836703, -0.7889229, 1.380023, 1, 0, 0.2235294, 1,
1.841304, -1.344265, 2.050531, 1, 0, 0.2156863, 1,
1.885475, 0.8200131, 0.6922196, 1, 0, 0.2117647, 1,
1.893788, -1.43984, 3.292374, 1, 0, 0.2039216, 1,
1.896952, -0.07590386, 3.200546, 1, 0, 0.1960784, 1,
1.902744, -1.096285, 1.873465, 1, 0, 0.1921569, 1,
1.908366, 0.8566605, 1.428222, 1, 0, 0.1843137, 1,
1.920169, 0.4051537, 1.759377, 1, 0, 0.1803922, 1,
1.941126, -0.233349, 2.124883, 1, 0, 0.172549, 1,
1.948413, 0.1326941, 2.122861, 1, 0, 0.1686275, 1,
1.960514, -0.0624055, 0.7938476, 1, 0, 0.1607843, 1,
1.970836, 1.292835, 0.5668365, 1, 0, 0.1568628, 1,
1.980445, 0.4855217, 0.7889132, 1, 0, 0.1490196, 1,
1.984538, -0.5238596, 2.1011, 1, 0, 0.145098, 1,
1.99795, 0.4242563, 3.27583, 1, 0, 0.1372549, 1,
2.028045, 0.9973087, 0.5776451, 1, 0, 0.1333333, 1,
2.029663, -0.8284316, 2.201653, 1, 0, 0.1254902, 1,
2.080608, 0.3559924, 1.414339, 1, 0, 0.1215686, 1,
2.082205, -1.798187, 2.278868, 1, 0, 0.1137255, 1,
2.148456, -1.408918, 3.030639, 1, 0, 0.1098039, 1,
2.172071, 0.5256093, 2.084106, 1, 0, 0.1019608, 1,
2.178986, -0.8485234, 1.969165, 1, 0, 0.09411765, 1,
2.190901, -0.480014, 2.327931, 1, 0, 0.09019608, 1,
2.299869, -1.004194, 3.296747, 1, 0, 0.08235294, 1,
2.332906, 0.3841706, 2.01656, 1, 0, 0.07843138, 1,
2.405817, 0.2528034, 0.7610118, 1, 0, 0.07058824, 1,
2.446107, -0.7468797, 3.309557, 1, 0, 0.06666667, 1,
2.452667, 1.614524, 1.55556, 1, 0, 0.05882353, 1,
2.490803, -1.801035, 2.663275, 1, 0, 0.05490196, 1,
2.56278, 0.8222781, 1.121817, 1, 0, 0.04705882, 1,
2.5937, -0.8133042, 0.9249539, 1, 0, 0.04313726, 1,
2.66596, 2.190042, 3.20165, 1, 0, 0.03529412, 1,
2.836282, -0.9600547, 1.677389, 1, 0, 0.03137255, 1,
3.145253, -1.625575, 2.313108, 1, 0, 0.02352941, 1,
3.175802, 0.438533, 1.597051, 1, 0, 0.01960784, 1,
3.413114, 0.6044164, 2.013766, 1, 0, 0.01176471, 1,
3.74782, 0.6357927, 1.593279, 1, 0, 0.007843138, 1
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
-0.05590034, -4.340119, -7.214217, 0, -0.5, 0.5, 0.5,
-0.05590034, -4.340119, -7.214217, 1, -0.5, 0.5, 0.5,
-0.05590034, -4.340119, -7.214217, 1, 1.5, 0.5, 0.5,
-0.05590034, -4.340119, -7.214217, 0, 1.5, 0.5, 0.5
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
-5.149081, 0.1033281, -7.214217, 0, -0.5, 0.5, 0.5,
-5.149081, 0.1033281, -7.214217, 1, -0.5, 0.5, 0.5,
-5.149081, 0.1033281, -7.214217, 1, 1.5, 0.5, 0.5,
-5.149081, 0.1033281, -7.214217, 0, 1.5, 0.5, 0.5
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
-5.149081, -4.340119, -0.2400026, 0, -0.5, 0.5, 0.5,
-5.149081, -4.340119, -0.2400026, 1, -0.5, 0.5, 0.5,
-5.149081, -4.340119, -0.2400026, 1, 1.5, 0.5, 0.5,
-5.149081, -4.340119, -0.2400026, 0, 1.5, 0.5, 0.5
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
-2, -3.314708, -5.604783,
2, -3.314708, -5.604783,
-2, -3.314708, -5.604783,
-2, -3.48561, -5.873022,
0, -3.314708, -5.604783,
0, -3.48561, -5.873022,
2, -3.314708, -5.604783,
2, -3.48561, -5.873022
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
-2, -3.827414, -6.4095, 0, -0.5, 0.5, 0.5,
-2, -3.827414, -6.4095, 1, -0.5, 0.5, 0.5,
-2, -3.827414, -6.4095, 1, 1.5, 0.5, 0.5,
-2, -3.827414, -6.4095, 0, 1.5, 0.5, 0.5,
0, -3.827414, -6.4095, 0, -0.5, 0.5, 0.5,
0, -3.827414, -6.4095, 1, -0.5, 0.5, 0.5,
0, -3.827414, -6.4095, 1, 1.5, 0.5, 0.5,
0, -3.827414, -6.4095, 0, 1.5, 0.5, 0.5,
2, -3.827414, -6.4095, 0, -0.5, 0.5, 0.5,
2, -3.827414, -6.4095, 1, -0.5, 0.5, 0.5,
2, -3.827414, -6.4095, 1, 1.5, 0.5, 0.5,
2, -3.827414, -6.4095, 0, 1.5, 0.5, 0.5
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
-3.973732, -3, -5.604783,
-3.973732, 3, -5.604783,
-3.973732, -3, -5.604783,
-4.169623, -3, -5.873022,
-3.973732, -2, -5.604783,
-4.169623, -2, -5.873022,
-3.973732, -1, -5.604783,
-4.169623, -1, -5.873022,
-3.973732, 0, -5.604783,
-4.169623, 0, -5.873022,
-3.973732, 1, -5.604783,
-4.169623, 1, -5.873022,
-3.973732, 2, -5.604783,
-4.169623, 2, -5.873022,
-3.973732, 3, -5.604783,
-4.169623, 3, -5.873022
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
-4.561407, -3, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, -3, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, -3, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, -3, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, -2, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, -2, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, -2, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, -2, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, -1, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, -1, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, -1, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, -1, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, 0, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, 0, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, 0, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, 0, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, 1, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, 1, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, 1, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, 1, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, 2, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, 2, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, 2, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, 2, -6.4095, 0, 1.5, 0.5, 0.5,
-4.561407, 3, -6.4095, 0, -0.5, 0.5, 0.5,
-4.561407, 3, -6.4095, 1, -0.5, 0.5, 0.5,
-4.561407, 3, -6.4095, 1, 1.5, 0.5, 0.5,
-4.561407, 3, -6.4095, 0, 1.5, 0.5, 0.5
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
-3.973732, -3.314708, -4,
-3.973732, -3.314708, 4,
-3.973732, -3.314708, -4,
-4.169623, -3.48561, -4,
-3.973732, -3.314708, -2,
-4.169623, -3.48561, -2,
-3.973732, -3.314708, 0,
-4.169623, -3.48561, 0,
-3.973732, -3.314708, 2,
-4.169623, -3.48561, 2,
-3.973732, -3.314708, 4,
-4.169623, -3.48561, 4
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
-4.561407, -3.827414, -4, 0, -0.5, 0.5, 0.5,
-4.561407, -3.827414, -4, 1, -0.5, 0.5, 0.5,
-4.561407, -3.827414, -4, 1, 1.5, 0.5, 0.5,
-4.561407, -3.827414, -4, 0, 1.5, 0.5, 0.5,
-4.561407, -3.827414, -2, 0, -0.5, 0.5, 0.5,
-4.561407, -3.827414, -2, 1, -0.5, 0.5, 0.5,
-4.561407, -3.827414, -2, 1, 1.5, 0.5, 0.5,
-4.561407, -3.827414, -2, 0, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 0, 0, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 0, 1, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 0, 1, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 0, 0, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 2, 0, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 2, 1, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 2, 1, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 2, 0, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 4, 0, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 4, 1, -0.5, 0.5, 0.5,
-4.561407, -3.827414, 4, 1, 1.5, 0.5, 0.5,
-4.561407, -3.827414, 4, 0, 1.5, 0.5, 0.5
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
-3.973732, -3.314708, -5.604783,
-3.973732, 3.521365, -5.604783,
-3.973732, -3.314708, 5.124777,
-3.973732, 3.521365, 5.124777,
-3.973732, -3.314708, -5.604783,
-3.973732, -3.314708, 5.124777,
-3.973732, 3.521365, -5.604783,
-3.973732, 3.521365, 5.124777,
-3.973732, -3.314708, -5.604783,
3.861931, -3.314708, -5.604783,
-3.973732, -3.314708, 5.124777,
3.861931, -3.314708, 5.124777,
-3.973732, 3.521365, -5.604783,
3.861931, 3.521365, -5.604783,
-3.973732, 3.521365, 5.124777,
3.861931, 3.521365, 5.124777,
3.861931, -3.314708, -5.604783,
3.861931, 3.521365, -5.604783,
3.861931, -3.314708, 5.124777,
3.861931, 3.521365, 5.124777,
3.861931, -3.314708, -5.604783,
3.861931, -3.314708, 5.124777,
3.861931, 3.521365, -5.604783,
3.861931, 3.521365, 5.124777
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
var radius = 7.978552;
var distance = 35.49748;
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
mvMatrix.translate( 0.05590034, -0.1033281, 0.2400026 );
mvMatrix.scale( 1.100936, 1.261918, 0.8040001 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.49748);
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
Chlorpyrifos-Methyl<-read.table("Chlorpyrifos-Methyl.xyz")
```

```
## Error in read.table("Chlorpyrifos-Methyl.xyz"): no lines available in input
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
-3.85962, -0.3903165, -1.279219, 0, 0, 1, 1, 1,
-3.116755, -0.05309209, -0.2919097, 1, 0, 0, 1, 1,
-3.049597, -1.032259, -2.541684, 1, 0, 0, 1, 1,
-2.63344, 0.4080239, -1.04583, 1, 0, 0, 1, 1,
-2.612884, -1.589446, -1.886779, 1, 0, 0, 1, 1,
-2.587113, -0.4063547, -1.274967, 1, 0, 0, 1, 1,
-2.563339, -0.9471779, -0.7273099, 0, 0, 0, 1, 1,
-2.542207, -0.434824, 0.01013581, 0, 0, 0, 1, 1,
-2.387578, -0.1231041, -1.814465, 0, 0, 0, 1, 1,
-2.287419, 2.840966, -1.869549, 0, 0, 0, 1, 1,
-2.276825, 0.827847, -2.442957, 0, 0, 0, 1, 1,
-2.25333, 0.2233451, -2.972655, 0, 0, 0, 1, 1,
-2.20555, -0.4419506, -2.446394, 0, 0, 0, 1, 1,
-2.204685, -0.9222389, -2.031636, 1, 1, 1, 1, 1,
-2.186288, 1.221414, -1.564171, 1, 1, 1, 1, 1,
-2.182549, 0.2571753, -2.000617, 1, 1, 1, 1, 1,
-2.152584, 2.383335, -1.296841, 1, 1, 1, 1, 1,
-2.143157, -1.225721, -1.914453, 1, 1, 1, 1, 1,
-2.082773, 1.974651, -1.570334, 1, 1, 1, 1, 1,
-2.074516, -1.383916, -1.249754, 1, 1, 1, 1, 1,
-2.068923, -1.644367, -2.331541, 1, 1, 1, 1, 1,
-2.022946, 0.7878557, -2.458141, 1, 1, 1, 1, 1,
-2.017083, -0.6147742, -1.035894, 1, 1, 1, 1, 1,
-1.98666, 0.7026191, -0.5795136, 1, 1, 1, 1, 1,
-1.985451, -0.9236459, -2.634435, 1, 1, 1, 1, 1,
-1.916931, 1.41996, -0.6744718, 1, 1, 1, 1, 1,
-1.893711, -0.6960717, -1.483932, 1, 1, 1, 1, 1,
-1.843535, -0.07224207, -1.115145, 1, 1, 1, 1, 1,
-1.841103, 0.2627608, -1.77889, 0, 0, 1, 1, 1,
-1.834883, 1.567041, -0.4948888, 1, 0, 0, 1, 1,
-1.806411, -0.4547385, -3.287784, 1, 0, 0, 1, 1,
-1.79915, -1.042521, -3.328838, 1, 0, 0, 1, 1,
-1.790387, 0.174215, -1.981558, 1, 0, 0, 1, 1,
-1.785611, -0.4288145, -2.262461, 1, 0, 0, 1, 1,
-1.778803, -0.2102064, -1.979783, 0, 0, 0, 1, 1,
-1.768336, -0.9851174, -1.395586, 0, 0, 0, 1, 1,
-1.767022, -0.921331, -2.777666, 0, 0, 0, 1, 1,
-1.7514, -0.8842818, -1.970381, 0, 0, 0, 1, 1,
-1.745169, 0.3094157, -1.365353, 0, 0, 0, 1, 1,
-1.744749, 1.175969, 0.07815354, 0, 0, 0, 1, 1,
-1.694216, 1.383188, -1.267742, 0, 0, 0, 1, 1,
-1.680628, 0.1856767, -1.660563, 1, 1, 1, 1, 1,
-1.677938, 0.7071618, -1.49554, 1, 1, 1, 1, 1,
-1.675065, -0.9145588, -3.207552, 1, 1, 1, 1, 1,
-1.671876, -0.8591286, -1.572551, 1, 1, 1, 1, 1,
-1.653964, 0.4142905, -0.04028269, 1, 1, 1, 1, 1,
-1.651867, -2.504281, -3.040251, 1, 1, 1, 1, 1,
-1.59321, 0.2003523, -1.612493, 1, 1, 1, 1, 1,
-1.587425, -0.1013791, -1.711042, 1, 1, 1, 1, 1,
-1.584264, 0.4227732, -1.226699, 1, 1, 1, 1, 1,
-1.578937, -0.4316151, -2.485929, 1, 1, 1, 1, 1,
-1.567422, -0.3007692, -0.6866297, 1, 1, 1, 1, 1,
-1.549263, 0.5190515, -0.2215508, 1, 1, 1, 1, 1,
-1.526159, -0.3207157, -1.180679, 1, 1, 1, 1, 1,
-1.520924, 0.7604365, 0.3859473, 1, 1, 1, 1, 1,
-1.519372, 0.9955155, -1.734262, 1, 1, 1, 1, 1,
-1.515168, 0.9453941, -2.014943, 0, 0, 1, 1, 1,
-1.512683, 0.8519142, -1.364208, 1, 0, 0, 1, 1,
-1.50188, 0.004479166, -2.101828, 1, 0, 0, 1, 1,
-1.495353, 0.6145825, 0.582792, 1, 0, 0, 1, 1,
-1.479971, -0.9457603, -1.297284, 1, 0, 0, 1, 1,
-1.447569, 0.7561466, -1.30153, 1, 0, 0, 1, 1,
-1.432986, 1.057178, -1.719099, 0, 0, 0, 1, 1,
-1.43096, -1.17216, -1.490248, 0, 0, 0, 1, 1,
-1.421202, -0.2198919, -1.891422, 0, 0, 0, 1, 1,
-1.416067, -3.215154, -3.760333, 0, 0, 0, 1, 1,
-1.411933, 1.815721, -3.218337, 0, 0, 0, 1, 1,
-1.401381, -0.1287828, -1.662712, 0, 0, 0, 1, 1,
-1.380823, 0.9439986, -1.563802, 0, 0, 0, 1, 1,
-1.356553, 0.5443907, 0.3964684, 1, 1, 1, 1, 1,
-1.355093, 0.2976011, -2.056643, 1, 1, 1, 1, 1,
-1.352084, -0.5234203, 0.1610279, 1, 1, 1, 1, 1,
-1.345303, -0.5467557, -2.570262, 1, 1, 1, 1, 1,
-1.328317, -0.3015851, -3.411002, 1, 1, 1, 1, 1,
-1.327768, 0.7074944, -1.368415, 1, 1, 1, 1, 1,
-1.323495, 1.026716, -1.906119, 1, 1, 1, 1, 1,
-1.316422, -1.049025, -3.652964, 1, 1, 1, 1, 1,
-1.310226, 0.9133204, -0.7199491, 1, 1, 1, 1, 1,
-1.30721, -0.05090369, -2.36085, 1, 1, 1, 1, 1,
-1.300843, -0.1399157, -2.430174, 1, 1, 1, 1, 1,
-1.296471, -1.068609, -4.271378, 1, 1, 1, 1, 1,
-1.294022, 0.1564094, -1.234796, 1, 1, 1, 1, 1,
-1.286015, 0.6977883, -1.230227, 1, 1, 1, 1, 1,
-1.275068, 1.081672, 0.1348434, 1, 1, 1, 1, 1,
-1.260354, -0.1866355, -2.003174, 0, 0, 1, 1, 1,
-1.259222, 0.09449223, -2.445112, 1, 0, 0, 1, 1,
-1.257468, -0.4910407, -2.264592, 1, 0, 0, 1, 1,
-1.254326, -1.205743, -3.631134, 1, 0, 0, 1, 1,
-1.254081, -1.503198, -3.426932, 1, 0, 0, 1, 1,
-1.248084, 0.121865, -1.23807, 1, 0, 0, 1, 1,
-1.239759, -0.4544042, -2.660097, 0, 0, 0, 1, 1,
-1.238238, -0.5781102, -3.318036, 0, 0, 0, 1, 1,
-1.232476, -0.8827249, -2.342486, 0, 0, 0, 1, 1,
-1.231323, -0.7871596, -3.438952, 0, 0, 0, 1, 1,
-1.226993, 0.1077366, -2.410855, 0, 0, 0, 1, 1,
-1.217461, 0.4489792, -0.6850706, 0, 0, 0, 1, 1,
-1.214811, -0.6747859, -1.739395, 0, 0, 0, 1, 1,
-1.210072, 1.330186, -1.513812, 1, 1, 1, 1, 1,
-1.204753, -0.6175872, -3.203639, 1, 1, 1, 1, 1,
-1.18492, 0.5445285, -0.9394922, 1, 1, 1, 1, 1,
-1.184662, 0.09550813, -1.513348, 1, 1, 1, 1, 1,
-1.182665, 0.9104905, -0.4987938, 1, 1, 1, 1, 1,
-1.181609, -0.5066078, -0.8515162, 1, 1, 1, 1, 1,
-1.178446, 1.04537, 0.5098047, 1, 1, 1, 1, 1,
-1.16887, -0.1271282, -1.434622, 1, 1, 1, 1, 1,
-1.167528, -0.5871261, -1.390741, 1, 1, 1, 1, 1,
-1.166228, -0.1318776, -1.319552, 1, 1, 1, 1, 1,
-1.165536, 1.699612, -0.3160235, 1, 1, 1, 1, 1,
-1.143222, -1.012254, -1.715503, 1, 1, 1, 1, 1,
-1.142934, -0.7553943, -1.277753, 1, 1, 1, 1, 1,
-1.14254, 1.821277, 1.174194, 1, 1, 1, 1, 1,
-1.142245, -1.052955, -0.9464837, 1, 1, 1, 1, 1,
-1.128347, 1.332873, -2.897378, 0, 0, 1, 1, 1,
-1.125778, -0.6130794, -1.062691, 1, 0, 0, 1, 1,
-1.122719, -1.083864, -2.539731, 1, 0, 0, 1, 1,
-1.120517, 1.070437, -1.237327, 1, 0, 0, 1, 1,
-1.112764, -0.2552384, -2.541225, 1, 0, 0, 1, 1,
-1.109514, 1.100294, -1.244008, 1, 0, 0, 1, 1,
-1.100893, 1.740496, 0.541959, 0, 0, 0, 1, 1,
-1.094923, -0.01344732, -1.680302, 0, 0, 0, 1, 1,
-1.091238, -2.04934, -2.903943, 0, 0, 0, 1, 1,
-1.078334, -0.635379, -2.68474, 0, 0, 0, 1, 1,
-1.069052, 0.2333747, -1.951776, 0, 0, 0, 1, 1,
-1.068987, 0.5803641, -1.686493, 0, 0, 0, 1, 1,
-1.064523, 0.5651404, -0.5555572, 0, 0, 0, 1, 1,
-1.062885, 1.035257, -1.40904, 1, 1, 1, 1, 1,
-1.062769, 1.95067, -3.281179, 1, 1, 1, 1, 1,
-1.061509, -0.4134318, -3.146502, 1, 1, 1, 1, 1,
-1.056808, -0.7548491, -1.622688, 1, 1, 1, 1, 1,
-1.04613, 1.360157, -0.4173728, 1, 1, 1, 1, 1,
-1.045468, 0.3639254, -1.644627, 1, 1, 1, 1, 1,
-1.041133, -0.4069083, -1.958548, 1, 1, 1, 1, 1,
-1.033924, -1.496634, -4.48409, 1, 1, 1, 1, 1,
-1.033683, 0.2570993, -1.81625, 1, 1, 1, 1, 1,
-1.033296, 1.361442, -1.404634, 1, 1, 1, 1, 1,
-1.032924, 1.045624, -0.2295044, 1, 1, 1, 1, 1,
-1.02635, 1.154401, -0.7856315, 1, 1, 1, 1, 1,
-1.022226, -1.324445, -1.279024, 1, 1, 1, 1, 1,
-1.021983, -0.4047769, -1.731899, 1, 1, 1, 1, 1,
-1.021504, -0.1855691, -0.3207767, 1, 1, 1, 1, 1,
-1.019047, 2.031014, -1.336127, 0, 0, 1, 1, 1,
-1.014734, 0.7938029, -0.8660083, 1, 0, 0, 1, 1,
-1.010304, -0.5252893, -2.74918, 1, 0, 0, 1, 1,
-1.005853, -0.005189719, -2.233232, 1, 0, 0, 1, 1,
-1.004833, -2.108331, -2.855309, 1, 0, 0, 1, 1,
-1.00081, 1.496157, 0.6030349, 1, 0, 0, 1, 1,
-0.997372, 1.256319, -1.056111, 0, 0, 0, 1, 1,
-0.9949008, -0.6759242, -0.7938068, 0, 0, 0, 1, 1,
-0.993947, 0.3376018, -0.7983097, 0, 0, 0, 1, 1,
-0.9737044, 1.260696, -1.741389, 0, 0, 0, 1, 1,
-0.9725369, -1.536991, -2.899962, 0, 0, 0, 1, 1,
-0.9678077, -0.1987067, -2.60102, 0, 0, 0, 1, 1,
-0.9669568, -0.1327792, -3.615314, 0, 0, 0, 1, 1,
-0.9655362, -0.7262151, -2.357863, 1, 1, 1, 1, 1,
-0.9638433, 1.644628, -1.279697, 1, 1, 1, 1, 1,
-0.9626285, 0.226487, -1.363518, 1, 1, 1, 1, 1,
-0.9610187, 1.713758, -0.744936, 1, 1, 1, 1, 1,
-0.9605141, 0.3398041, -1.824506, 1, 1, 1, 1, 1,
-0.9544339, 0.3313065, -1.89684, 1, 1, 1, 1, 1,
-0.9536768, 0.8099676, -0.6264895, 1, 1, 1, 1, 1,
-0.9512085, -1.795613, -1.354911, 1, 1, 1, 1, 1,
-0.9496104, 0.140047, 0.788515, 1, 1, 1, 1, 1,
-0.9468299, -1.516611, -3.174982, 1, 1, 1, 1, 1,
-0.9408899, -0.8044471, -3.820621, 1, 1, 1, 1, 1,
-0.9400059, -0.8677049, -2.729599, 1, 1, 1, 1, 1,
-0.9369496, 0.2217281, -1.490644, 1, 1, 1, 1, 1,
-0.9362664, 0.8736594, -0.9385524, 1, 1, 1, 1, 1,
-0.935397, 0.7622814, 0.1321126, 1, 1, 1, 1, 1,
-0.9346115, -1.745632, -2.307351, 0, 0, 1, 1, 1,
-0.9322228, 0.6230816, 0.03862074, 1, 0, 0, 1, 1,
-0.9265851, -0.1736997, -2.943775, 1, 0, 0, 1, 1,
-0.9189094, -1.250649, -2.543691, 1, 0, 0, 1, 1,
-0.9156556, 0.4453449, -0.1248176, 1, 0, 0, 1, 1,
-0.9085128, -0.7946096, -0.8606913, 1, 0, 0, 1, 1,
-0.9075457, -0.4396661, -2.278881, 0, 0, 0, 1, 1,
-0.9072534, 0.2220559, -0.0009852584, 0, 0, 0, 1, 1,
-0.9057451, 0.05074577, -1.855831, 0, 0, 0, 1, 1,
-0.9044232, 0.80331, -0.867277, 0, 0, 0, 1, 1,
-0.9037336, -0.4148312, -3.300979, 0, 0, 0, 1, 1,
-0.9006621, 1.982095, -1.625645, 0, 0, 0, 1, 1,
-0.8861094, 0.763527, -1.955471, 0, 0, 0, 1, 1,
-0.8771388, 0.6421506, -4.066772, 1, 1, 1, 1, 1,
-0.8739507, 0.9075161, -1.502499, 1, 1, 1, 1, 1,
-0.8671802, 0.7326301, -0.5602039, 1, 1, 1, 1, 1,
-0.8600224, 0.3143534, -0.5584968, 1, 1, 1, 1, 1,
-0.8548141, -0.930073, -3.121493, 1, 1, 1, 1, 1,
-0.8522263, 0.202952, -2.51972, 1, 1, 1, 1, 1,
-0.848863, 1.141343, 0.6766814, 1, 1, 1, 1, 1,
-0.8457002, 1.136982, 0.601234, 1, 1, 1, 1, 1,
-0.8450964, 1.766951, 0.1556427, 1, 1, 1, 1, 1,
-0.838954, 0.1884384, -1.358867, 1, 1, 1, 1, 1,
-0.8348336, 1.163835, -0.1818376, 1, 1, 1, 1, 1,
-0.8342554, -0.120717, -3.048233, 1, 1, 1, 1, 1,
-0.8329574, 0.7259978, -0.5417454, 1, 1, 1, 1, 1,
-0.8322497, 1.40076, -0.8100368, 1, 1, 1, 1, 1,
-0.8308954, 0.8909892, -2.180501, 1, 1, 1, 1, 1,
-0.8294624, 1.688809, -0.193985, 0, 0, 1, 1, 1,
-0.8248563, 0.4058267, -1.939669, 1, 0, 0, 1, 1,
-0.8147632, 1.392487, -0.6484899, 1, 0, 0, 1, 1,
-0.8135572, -0.09733626, -2.238577, 1, 0, 0, 1, 1,
-0.8097072, -0.1504927, -2.377659, 1, 0, 0, 1, 1,
-0.806972, 0.6049289, -0.1637165, 1, 0, 0, 1, 1,
-0.8031505, 0.8974139, -0.321862, 0, 0, 0, 1, 1,
-0.8022671, -0.1439766, -0.478684, 0, 0, 0, 1, 1,
-0.7978399, -1.129355, -5.164726, 0, 0, 0, 1, 1,
-0.791258, -0.2056461, -1.254469, 0, 0, 0, 1, 1,
-0.786972, 1.264994, 0.9404628, 0, 0, 0, 1, 1,
-0.7829058, -0.01196939, -2.10037, 0, 0, 0, 1, 1,
-0.7810258, -1.373569, -3.334135, 0, 0, 0, 1, 1,
-0.7756065, 0.8402066, -1.420252, 1, 1, 1, 1, 1,
-0.7751431, -0.2369981, -0.4556057, 1, 1, 1, 1, 1,
-0.7679965, 0.3422984, -0.307935, 1, 1, 1, 1, 1,
-0.7611853, 0.27667, -0.4726125, 1, 1, 1, 1, 1,
-0.7609407, 0.3732942, -0.7895346, 1, 1, 1, 1, 1,
-0.7590446, -1.495502, -2.872478, 1, 1, 1, 1, 1,
-0.7476875, -0.5391025, -4.233686, 1, 1, 1, 1, 1,
-0.7464229, -0.1962649, -2.840893, 1, 1, 1, 1, 1,
-0.7459293, 0.7765709, -0.9034095, 1, 1, 1, 1, 1,
-0.7447132, -1.726918, -2.774128, 1, 1, 1, 1, 1,
-0.7425695, -0.8190914, -2.153701, 1, 1, 1, 1, 1,
-0.7420989, -1.052291, -3.354906, 1, 1, 1, 1, 1,
-0.741335, 1.967743, 0.1675711, 1, 1, 1, 1, 1,
-0.7377757, 0.2060096, -1.909325, 1, 1, 1, 1, 1,
-0.7375289, -0.4394171, -1.700844, 1, 1, 1, 1, 1,
-0.7370103, -0.9228111, -4.018285, 0, 0, 1, 1, 1,
-0.7348467, -1.493057, -1.244829, 1, 0, 0, 1, 1,
-0.7314548, 0.2347317, -1.981287, 1, 0, 0, 1, 1,
-0.7285618, 0.7577949, -1.767114, 1, 0, 0, 1, 1,
-0.7255841, -0.6455028, -2.715681, 1, 0, 0, 1, 1,
-0.7245041, -0.03373783, -1.002304, 1, 0, 0, 1, 1,
-0.72394, 1.386253, 0.904631, 0, 0, 0, 1, 1,
-0.7209842, 0.05218064, -3.066614, 0, 0, 0, 1, 1,
-0.7157828, 1.504578, -0.7766261, 0, 0, 0, 1, 1,
-0.7149755, 0.8747516, -1.754794, 0, 0, 0, 1, 1,
-0.7059702, 0.9267931, -1.442311, 0, 0, 0, 1, 1,
-0.7006875, 0.5295781, -0.6633164, 0, 0, 0, 1, 1,
-0.6997769, -1.052321, -2.286307, 0, 0, 0, 1, 1,
-0.6971166, 0.716067, 0.5076676, 1, 1, 1, 1, 1,
-0.6967751, -0.7855586, -4.051794, 1, 1, 1, 1, 1,
-0.6941229, -0.6546396, -1.979911, 1, 1, 1, 1, 1,
-0.6874963, 0.5196591, -1.662523, 1, 1, 1, 1, 1,
-0.685971, 1.562624, -0.06374263, 1, 1, 1, 1, 1,
-0.6859326, -0.6300377, -2.071781, 1, 1, 1, 1, 1,
-0.6854158, -0.3120324, -1.86667, 1, 1, 1, 1, 1,
-0.6833, -1.627886, -3.009246, 1, 1, 1, 1, 1,
-0.6827477, -0.9148541, -2.670468, 1, 1, 1, 1, 1,
-0.6821906, -0.1398768, -0.5270065, 1, 1, 1, 1, 1,
-0.6790236, -0.01883826, -2.166127, 1, 1, 1, 1, 1,
-0.6789363, 0.4024599, -1.485479, 1, 1, 1, 1, 1,
-0.6780797, -0.7332766, -2.986452, 1, 1, 1, 1, 1,
-0.6730768, 0.09293408, -2.036828, 1, 1, 1, 1, 1,
-0.6729419, 1.989317, -0.8042564, 1, 1, 1, 1, 1,
-0.6653747, -1.310186, -3.335841, 0, 0, 1, 1, 1,
-0.6602099, 0.4298126, -0.7653456, 1, 0, 0, 1, 1,
-0.6575006, -0.1760754, -2.33016, 1, 0, 0, 1, 1,
-0.6563685, 0.08894107, -2.03634, 1, 0, 0, 1, 1,
-0.6562474, -0.1545899, -2.619805, 1, 0, 0, 1, 1,
-0.6551784, -1.273492, -1.108274, 1, 0, 0, 1, 1,
-0.6537738, -2.251092, -4.406613, 0, 0, 0, 1, 1,
-0.6505407, -0.8055958, -2.670465, 0, 0, 0, 1, 1,
-0.646324, -1.523465, -5.448527, 0, 0, 0, 1, 1,
-0.6461531, -1.396775, -1.701956, 0, 0, 0, 1, 1,
-0.6456522, 1.345854, -0.2641838, 0, 0, 0, 1, 1,
-0.6451765, 2.202821, -1.220933, 0, 0, 0, 1, 1,
-0.6447067, 0.1808148, -0.7888877, 0, 0, 0, 1, 1,
-0.6438748, -0.451918, -3.46129, 1, 1, 1, 1, 1,
-0.6419314, -1.075468, -2.946193, 1, 1, 1, 1, 1,
-0.6394796, 1.176575, -1.128529, 1, 1, 1, 1, 1,
-0.638874, 0.3318795, 1.203142, 1, 1, 1, 1, 1,
-0.6381161, -1.284592, -2.709837, 1, 1, 1, 1, 1,
-0.6312451, -1.580633, -1.517277, 1, 1, 1, 1, 1,
-0.630958, 1.192804, -0.5679544, 1, 1, 1, 1, 1,
-0.6278493, -0.121742, -0.2896489, 1, 1, 1, 1, 1,
-0.6268756, 0.9435286, -0.6982532, 1, 1, 1, 1, 1,
-0.625205, 0.1766731, -0.1742182, 1, 1, 1, 1, 1,
-0.6244485, -1.22532, -2.647671, 1, 1, 1, 1, 1,
-0.6182938, 0.8425338, 0.5583887, 1, 1, 1, 1, 1,
-0.6045573, -1.789013, -4.636458, 1, 1, 1, 1, 1,
-0.6043424, -0.7096792, -3.736547, 1, 1, 1, 1, 1,
-0.6030883, -0.1196422, -2.137672, 1, 1, 1, 1, 1,
-0.5944791, 0.1378857, 0.4257329, 0, 0, 1, 1, 1,
-0.5922357, 0.8882793, -0.7138177, 1, 0, 0, 1, 1,
-0.5908675, 0.057398, -1.90105, 1, 0, 0, 1, 1,
-0.5847444, 0.04266168, -1.951909, 1, 0, 0, 1, 1,
-0.5798435, 0.3511387, -1.938181, 1, 0, 0, 1, 1,
-0.5793562, -1.364745, -3.762238, 1, 0, 0, 1, 1,
-0.5788088, -1.240524, -3.969458, 0, 0, 0, 1, 1,
-0.5760162, 1.547598, -1.373487, 0, 0, 0, 1, 1,
-0.5720131, -0.3001687, -2.373084, 0, 0, 0, 1, 1,
-0.5717531, 0.01273833, -1.57163, 0, 0, 0, 1, 1,
-0.5689959, -0.3427138, -1.506812, 0, 0, 0, 1, 1,
-0.5647272, 0.6219357, -0.4388369, 0, 0, 0, 1, 1,
-0.5628905, -1.094284, -3.247939, 0, 0, 0, 1, 1,
-0.5599288, -1.191602, -2.595821, 1, 1, 1, 1, 1,
-0.5578285, -1.026287, -2.793419, 1, 1, 1, 1, 1,
-0.5576965, 1.325458, -0.7720445, 1, 1, 1, 1, 1,
-0.5490317, -0.3854531, -2.244423, 1, 1, 1, 1, 1,
-0.5484244, 0.5709655, -0.947778, 1, 1, 1, 1, 1,
-0.541757, 1.185489, 0.4168732, 1, 1, 1, 1, 1,
-0.5398833, -2.390336, -3.103344, 1, 1, 1, 1, 1,
-0.538574, -0.3543709, -2.750822, 1, 1, 1, 1, 1,
-0.5382407, -2.10502, -2.025905, 1, 1, 1, 1, 1,
-0.5366814, 0.6828303, -1.874362, 1, 1, 1, 1, 1,
-0.5366637, -0.2787152, -1.137422, 1, 1, 1, 1, 1,
-0.5279101, 1.103204, -0.8048016, 1, 1, 1, 1, 1,
-0.5255843, 0.5810732, -1.15775, 1, 1, 1, 1, 1,
-0.5243033, -0.9043763, -4.070045, 1, 1, 1, 1, 1,
-0.5201733, -0.9438959, -1.666347, 1, 1, 1, 1, 1,
-0.51684, -0.3297738, -2.62049, 0, 0, 1, 1, 1,
-0.5157418, -0.9011343, -3.552788, 1, 0, 0, 1, 1,
-0.5143471, -0.4519987, -2.139554, 1, 0, 0, 1, 1,
-0.5088003, 0.07001217, -2.905902, 1, 0, 0, 1, 1,
-0.5085942, -1.086123, -1.638573, 1, 0, 0, 1, 1,
-0.5065741, 0.4226928, -0.9435324, 1, 0, 0, 1, 1,
-0.5044468, 2.468284, 0.1291477, 0, 0, 0, 1, 1,
-0.5020022, 0.6337828, -0.7165506, 0, 0, 0, 1, 1,
-0.5015178, 0.5120249, -0.3586085, 0, 0, 0, 1, 1,
-0.5009462, -0.122759, -1.726391, 0, 0, 0, 1, 1,
-0.5005361, 0.8940064, 1.263327, 0, 0, 0, 1, 1,
-0.4979729, 1.203367, 0.4159983, 0, 0, 0, 1, 1,
-0.49795, -0.2675848, -2.981986, 0, 0, 0, 1, 1,
-0.4942504, 1.62451, 0.338326, 1, 1, 1, 1, 1,
-0.4863105, -0.6852128, -3.811862, 1, 1, 1, 1, 1,
-0.4855011, -1.786446, -3.636474, 1, 1, 1, 1, 1,
-0.4802936, 0.2084098, -1.731433, 1, 1, 1, 1, 1,
-0.4787076, 1.215507, 0.4577407, 1, 1, 1, 1, 1,
-0.4740794, 1.652608, 0.5636439, 1, 1, 1, 1, 1,
-0.470844, 1.589516, -0.9816641, 1, 1, 1, 1, 1,
-0.4683465, 0.2326248, -1.782519, 1, 1, 1, 1, 1,
-0.4591221, -1.271945, -0.5895302, 1, 1, 1, 1, 1,
-0.4507648, 1.071921, 0.4603214, 1, 1, 1, 1, 1,
-0.4485811, -1.801426, -3.397563, 1, 1, 1, 1, 1,
-0.4434584, -2.78392, -1.645872, 1, 1, 1, 1, 1,
-0.4403151, 1.974923, 1.723029, 1, 1, 1, 1, 1,
-0.4396445, -0.9074914, -1.11323, 1, 1, 1, 1, 1,
-0.4373524, 0.07427078, -0.6287141, 1, 1, 1, 1, 1,
-0.4354456, 0.9465016, 0.02749025, 0, 0, 1, 1, 1,
-0.4335695, 0.5238907, 0.02226269, 1, 0, 0, 1, 1,
-0.432039, -0.8614761, -3.519373, 1, 0, 0, 1, 1,
-0.4311847, -0.4661898, -1.582772, 1, 0, 0, 1, 1,
-0.4291171, -1.456073, -4.468524, 1, 0, 0, 1, 1,
-0.4275933, 0.7118312, -0.3994216, 1, 0, 0, 1, 1,
-0.4266662, -0.2684031, -1.135048, 0, 0, 0, 1, 1,
-0.4223862, 0.371428, -0.6011948, 0, 0, 0, 1, 1,
-0.4215101, 0.7188203, 0.753562, 0, 0, 0, 1, 1,
-0.4213848, 0.9249748, 0.1349847, 0, 0, 0, 1, 1,
-0.420793, -1.305157, -2.458391, 0, 0, 0, 1, 1,
-0.4202156, 0.1057945, -1.508558, 0, 0, 0, 1, 1,
-0.4201397, -0.6492287, -3.184967, 0, 0, 0, 1, 1,
-0.417097, -0.8091376, -3.556174, 1, 1, 1, 1, 1,
-0.4149866, 1.988234, 0.8079311, 1, 1, 1, 1, 1,
-0.4093078, -0.3153465, -1.825742, 1, 1, 1, 1, 1,
-0.4073739, 1.32325, -1.036339, 1, 1, 1, 1, 1,
-0.4056032, -0.09311724, -1.021363, 1, 1, 1, 1, 1,
-0.4044349, 0.240452, -1.046916, 1, 1, 1, 1, 1,
-0.3977079, -0.9573498, -3.468557, 1, 1, 1, 1, 1,
-0.3959441, 1.487807, -1.86094, 1, 1, 1, 1, 1,
-0.3956409, -0.8796005, -2.65445, 1, 1, 1, 1, 1,
-0.3940633, -1.527067, -3.424527, 1, 1, 1, 1, 1,
-0.393783, 0.2648621, -0.4397911, 1, 1, 1, 1, 1,
-0.3935618, -0.3833837, -2.552842, 1, 1, 1, 1, 1,
-0.3906871, 0.8663464, 0.9166881, 1, 1, 1, 1, 1,
-0.390239, -0.4495717, -3.555034, 1, 1, 1, 1, 1,
-0.3901811, -1.547242, -4.159262, 1, 1, 1, 1, 1,
-0.3827086, 0.5696038, 0.1068029, 0, 0, 1, 1, 1,
-0.3764539, 0.4752921, -1.081839, 1, 0, 0, 1, 1,
-0.3750023, 1.404093, -1.407657, 1, 0, 0, 1, 1,
-0.3749551, -0.4617774, -2.507355, 1, 0, 0, 1, 1,
-0.3715863, 1.603449, -1.712471, 1, 0, 0, 1, 1,
-0.3679495, -0.004541141, -1.902804, 1, 0, 0, 1, 1,
-0.3667862, -1.799796, -1.922087, 0, 0, 0, 1, 1,
-0.366335, -0.3508478, -1.950779, 0, 0, 0, 1, 1,
-0.3617525, -0.8637877, -3.48842, 0, 0, 0, 1, 1,
-0.3608175, -1.869256, -2.464875, 0, 0, 0, 1, 1,
-0.3547741, -1.074829, -3.067514, 0, 0, 0, 1, 1,
-0.3545469, 0.06505083, -0.9097462, 0, 0, 0, 1, 1,
-0.3469995, 1.936097, -0.8850989, 0, 0, 0, 1, 1,
-0.3385293, -0.6805688, -2.933011, 1, 1, 1, 1, 1,
-0.337313, 0.7111084, 1.160756, 1, 1, 1, 1, 1,
-0.3335385, -0.8204653, -2.423561, 1, 1, 1, 1, 1,
-0.3297893, 1.648745, 1.457409, 1, 1, 1, 1, 1,
-0.3294097, 0.9999936, -1.714505, 1, 1, 1, 1, 1,
-0.3285044, 1.923985, 0.3252612, 1, 1, 1, 1, 1,
-0.3269984, -0.5090808, -3.541861, 1, 1, 1, 1, 1,
-0.326817, -0.1031712, -2.935944, 1, 1, 1, 1, 1,
-0.3261294, -1.035764, -2.193678, 1, 1, 1, 1, 1,
-0.325788, -1.672647, -3.269228, 1, 1, 1, 1, 1,
-0.3242025, 0.1157607, -0.5146034, 1, 1, 1, 1, 1,
-0.3235644, -0.07488775, -1.910742, 1, 1, 1, 1, 1,
-0.3199684, 0.1157375, 0.2951878, 1, 1, 1, 1, 1,
-0.3191187, 0.4976299, -0.2675914, 1, 1, 1, 1, 1,
-0.3166761, 1.008611, -0.9840474, 1, 1, 1, 1, 1,
-0.3107154, -0.6935984, -2.162971, 0, 0, 1, 1, 1,
-0.306369, -0.6559512, -1.204398, 1, 0, 0, 1, 1,
-0.3062209, -1.659681, -1.905515, 1, 0, 0, 1, 1,
-0.3035152, -0.9652738, -3.125518, 1, 0, 0, 1, 1,
-0.3002008, -1.231877, -2.890679, 1, 0, 0, 1, 1,
-0.2985606, -0.4047482, -2.183643, 1, 0, 0, 1, 1,
-0.2976652, -0.06706757, -2.182, 0, 0, 0, 1, 1,
-0.2951937, -0.03669562, -2.187432, 0, 0, 0, 1, 1,
-0.2948433, -0.4972868, -1.985972, 0, 0, 0, 1, 1,
-0.2935941, -0.3273818, -2.882204, 0, 0, 0, 1, 1,
-0.2926281, 1.137949, 0.7118417, 0, 0, 0, 1, 1,
-0.2919428, -1.295516, -4.445768, 0, 0, 0, 1, 1,
-0.2916258, 0.272588, -0.7300013, 0, 0, 0, 1, 1,
-0.2905714, 1.449702, -0.6746908, 1, 1, 1, 1, 1,
-0.2886792, -1.028372, -2.429063, 1, 1, 1, 1, 1,
-0.287233, -0.4686912, -1.415365, 1, 1, 1, 1, 1,
-0.2796823, -1.835071, -3.794024, 1, 1, 1, 1, 1,
-0.2769459, -0.7481478, -2.936095, 1, 1, 1, 1, 1,
-0.2749856, 1.053048, -0.8730163, 1, 1, 1, 1, 1,
-0.2721367, 0.4612695, 0.3050212, 1, 1, 1, 1, 1,
-0.2697553, -1.130835, -1.047046, 1, 1, 1, 1, 1,
-0.2692695, -0.09415539, -2.917025, 1, 1, 1, 1, 1,
-0.2564232, 0.883701, -0.4336398, 1, 1, 1, 1, 1,
-0.2553728, 1.729008, 0.5790121, 1, 1, 1, 1, 1,
-0.2535222, -0.08809707, -2.239043, 1, 1, 1, 1, 1,
-0.2495107, -1.299382, -3.573521, 1, 1, 1, 1, 1,
-0.2471159, -0.1274694, -2.496505, 1, 1, 1, 1, 1,
-0.244275, 0.4230522, 0.5177382, 1, 1, 1, 1, 1,
-0.2370722, 1.777393, -1.442363, 0, 0, 1, 1, 1,
-0.2354626, 0.1719229, 1.418553, 1, 0, 0, 1, 1,
-0.2353731, 0.5479194, 0.7894858, 1, 0, 0, 1, 1,
-0.2273074, -1.713285, -3.685494, 1, 0, 0, 1, 1,
-0.2254612, 0.1339569, -1.735843, 1, 0, 0, 1, 1,
-0.2242053, -0.3767807, -4.315045, 1, 0, 0, 1, 1,
-0.2228311, 1.209422, 1.002735, 0, 0, 0, 1, 1,
-0.2214387, -1.093857, -2.619639, 0, 0, 0, 1, 1,
-0.2197792, 1.261701, -0.3449659, 0, 0, 0, 1, 1,
-0.2188955, 0.4856822, 1.111185, 0, 0, 0, 1, 1,
-0.2159464, 1.283539, -0.4174384, 0, 0, 0, 1, 1,
-0.2086181, -0.1486868, -1.194627, 0, 0, 0, 1, 1,
-0.2084461, -0.9243643, -2.211161, 0, 0, 0, 1, 1,
-0.2072812, -0.3413407, -2.616069, 1, 1, 1, 1, 1,
-0.2029854, 0.2891468, -1.261893, 1, 1, 1, 1, 1,
-0.1951796, 1.306545, 0.5939745, 1, 1, 1, 1, 1,
-0.1931777, -0.710878, -3.591207, 1, 1, 1, 1, 1,
-0.1781238, -0.1384342, -0.8804318, 1, 1, 1, 1, 1,
-0.1716093, -0.1994461, -2.682082, 1, 1, 1, 1, 1,
-0.1556749, 1.101728, 0.8680331, 1, 1, 1, 1, 1,
-0.1531195, 1.241739, -0.1920528, 1, 1, 1, 1, 1,
-0.1530168, -2.397719, -4.988016, 1, 1, 1, 1, 1,
-0.1516034, -1.580477, -3.045762, 1, 1, 1, 1, 1,
-0.1432356, 0.7981061, -0.8786927, 1, 1, 1, 1, 1,
-0.141422, -1.536148, -3.018874, 1, 1, 1, 1, 1,
-0.1376022, -0.2024919, -4.367069, 1, 1, 1, 1, 1,
-0.1368007, 0.646329, -0.4204981, 1, 1, 1, 1, 1,
-0.1362574, 0.7741029, -0.6986262, 1, 1, 1, 1, 1,
-0.1288967, -0.8749194, -3.857108, 0, 0, 1, 1, 1,
-0.1276907, -0.6564359, -2.837013, 1, 0, 0, 1, 1,
-0.1207374, 0.7544022, 0.392366, 1, 0, 0, 1, 1,
-0.1204085, 0.2136151, -0.5953317, 1, 0, 0, 1, 1,
-0.1177854, 1.411191, -0.6926047, 1, 0, 0, 1, 1,
-0.1174228, 0.9640416, 1.719946, 1, 0, 0, 1, 1,
-0.1173495, 0.4758544, -0.7543183, 0, 0, 0, 1, 1,
-0.1132499, -0.6364253, -2.825646, 0, 0, 0, 1, 1,
-0.109969, 1.236781, 1.574295, 0, 0, 0, 1, 1,
-0.1043905, 0.4842933, -1.397326, 0, 0, 0, 1, 1,
-0.09943713, -1.076247, -1.792361, 0, 0, 0, 1, 1,
-0.09885698, 0.5057645, -2.029664, 0, 0, 0, 1, 1,
-0.09606359, 0.5938011, 0.3156763, 0, 0, 0, 1, 1,
-0.09604125, 0.633794, 1.092075, 1, 1, 1, 1, 1,
-0.0950842, -1.339373, -2.654928, 1, 1, 1, 1, 1,
-0.08672736, 0.6701745, 1.902335, 1, 1, 1, 1, 1,
-0.079427, 0.5810384, 0.9196731, 1, 1, 1, 1, 1,
-0.07793391, 0.1283463, -2.222653, 1, 1, 1, 1, 1,
-0.07134777, 0.08177235, -0.3350503, 1, 1, 1, 1, 1,
-0.06454653, -0.7102326, -3.384975, 1, 1, 1, 1, 1,
-0.06412449, -0.5892073, -3.555743, 1, 1, 1, 1, 1,
-0.06151307, -0.01822601, -2.576367, 1, 1, 1, 1, 1,
-0.06082232, -0.6942269, -2.967477, 1, 1, 1, 1, 1,
-0.05569906, -0.2236819, -3.594332, 1, 1, 1, 1, 1,
-0.05310084, -0.9692833, -1.805201, 1, 1, 1, 1, 1,
-0.05265541, 0.4550702, 1.185837, 1, 1, 1, 1, 1,
-0.04519047, 0.8455459, -0.05559033, 1, 1, 1, 1, 1,
-0.04383224, -0.05101387, -0.8131255, 1, 1, 1, 1, 1,
-0.04380647, 0.3097638, 1.001873, 0, 0, 1, 1, 1,
-0.04362206, 1.271106, -0.2931711, 1, 0, 0, 1, 1,
-0.04156371, -0.5685139, -3.264922, 1, 0, 0, 1, 1,
-0.03504047, 1.059996, 0.4040733, 1, 0, 0, 1, 1,
-0.03420714, 1.520336, 0.8473998, 1, 0, 0, 1, 1,
-0.03115834, 0.04667865, -0.405634, 1, 0, 0, 1, 1,
-0.02549986, -1.599678, -2.572003, 0, 0, 0, 1, 1,
-0.02503276, -1.447072, -3.702096, 0, 0, 0, 1, 1,
-0.02154719, -1.554311, -4.366734, 0, 0, 0, 1, 1,
-0.01871697, 0.1430231, -0.1163815, 0, 0, 0, 1, 1,
-0.01617659, 0.4205723, -0.5838566, 0, 0, 0, 1, 1,
-0.01236769, -0.6684946, -2.116786, 0, 0, 0, 1, 1,
-0.009633266, -0.3683922, -4.605634, 0, 0, 0, 1, 1,
-0.009485249, -1.426386, -3.63203, 1, 1, 1, 1, 1,
-0.008534431, -0.6466275, -2.434011, 1, 1, 1, 1, 1,
-0.008021077, -0.4716617, -3.539699, 1, 1, 1, 1, 1,
-0.007927631, -0.2575019, -1.658732, 1, 1, 1, 1, 1,
-0.007640639, -0.8751251, -3.773315, 1, 1, 1, 1, 1,
-0.007167294, 1.088899, -0.4070113, 1, 1, 1, 1, 1,
-0.005464505, -0.8245862, -2.275215, 1, 1, 1, 1, 1,
0.001715244, 0.1819639, 0.5991902, 1, 1, 1, 1, 1,
0.002561946, -1.207264, 0.3128422, 1, 1, 1, 1, 1,
0.00698649, 0.5105051, 0.7393486, 1, 1, 1, 1, 1,
0.008147295, 1.55092, -0.6054308, 1, 1, 1, 1, 1,
0.01005366, -0.7542435, 3.289523, 1, 1, 1, 1, 1,
0.01136115, -0.9512938, 0.1050014, 1, 1, 1, 1, 1,
0.01835309, 2.10309, -1.629408, 1, 1, 1, 1, 1,
0.01836533, -0.4768198, 2.83335, 1, 1, 1, 1, 1,
0.02116285, -0.4023368, 1.718606, 0, 0, 1, 1, 1,
0.02275516, 1.114941, -1.626546, 1, 0, 0, 1, 1,
0.02444217, -0.9442297, 3.221279, 1, 0, 0, 1, 1,
0.02560813, 0.5275416, 0.3373104, 1, 0, 0, 1, 1,
0.02767653, -0.05820397, 1.794612, 1, 0, 0, 1, 1,
0.02928506, 0.5074403, 1.21557, 1, 0, 0, 1, 1,
0.032897, -0.01657707, 0.5370929, 0, 0, 0, 1, 1,
0.03565799, 0.8956553, -0.1596178, 0, 0, 0, 1, 1,
0.03651572, -0.8503999, 2.729291, 0, 0, 0, 1, 1,
0.03670212, -0.04521893, 4.008553, 0, 0, 0, 1, 1,
0.037473, 0.3434104, 0.05774599, 0, 0, 0, 1, 1,
0.03766773, -0.7951259, 4.050294, 0, 0, 0, 1, 1,
0.04285438, -0.7404556, 3.792306, 0, 0, 0, 1, 1,
0.0477289, 1.946262, -0.06391299, 1, 1, 1, 1, 1,
0.05390964, -0.8930868, -0.03974596, 1, 1, 1, 1, 1,
0.05397275, 1.496827, 0.6494582, 1, 1, 1, 1, 1,
0.05560228, 0.8594249, -0.8962471, 1, 1, 1, 1, 1,
0.05746622, -0.4766256, 2.800301, 1, 1, 1, 1, 1,
0.05750354, 0.09268572, 0.7849585, 1, 1, 1, 1, 1,
0.05903192, 1.838525, 0.8294655, 1, 1, 1, 1, 1,
0.07393596, -2.170528, 1.801681, 1, 1, 1, 1, 1,
0.0768312, 0.8332577, -1.4665, 1, 1, 1, 1, 1,
0.07906318, -1.814741, 3.357136, 1, 1, 1, 1, 1,
0.08547578, 0.07739542, 0.3329839, 1, 1, 1, 1, 1,
0.08614456, 0.03618024, 2.577881, 1, 1, 1, 1, 1,
0.09143457, 1.752484, 0.2488496, 1, 1, 1, 1, 1,
0.09548205, 0.4933204, 1.082155, 1, 1, 1, 1, 1,
0.09852342, 1.035975, 0.6887485, 1, 1, 1, 1, 1,
0.1006858, -1.325325, 4.144819, 0, 0, 1, 1, 1,
0.1093559, 1.363509, 0.9104268, 1, 0, 0, 1, 1,
0.1122829, 0.9610917, -0.3591164, 1, 0, 0, 1, 1,
0.1131365, -0.3791741, 2.930456, 1, 0, 0, 1, 1,
0.1157786, 1.515143, 0.6537229, 1, 0, 0, 1, 1,
0.1181211, 1.275715, 0.6528809, 1, 0, 0, 1, 1,
0.1188193, 1.975369, 1.120382, 0, 0, 0, 1, 1,
0.1232115, -0.2207003, 2.776528, 0, 0, 0, 1, 1,
0.1280553, 0.8250285, -0.1263099, 0, 0, 0, 1, 1,
0.1301894, 0.2751876, -0.8647696, 0, 0, 0, 1, 1,
0.1310432, 0.6610257, 0.8257188, 0, 0, 0, 1, 1,
0.1318362, 0.7181287, -1.121257, 0, 0, 0, 1, 1,
0.132642, 1.053412, 0.4764099, 0, 0, 0, 1, 1,
0.1333903, -0.475679, 1.861014, 1, 1, 1, 1, 1,
0.133604, -0.6254058, 3.149385, 1, 1, 1, 1, 1,
0.1339903, -1.511694, 2.917664, 1, 1, 1, 1, 1,
0.1340723, 1.345385, 0.6734234, 1, 1, 1, 1, 1,
0.1373183, 0.5829394, 1.033006, 1, 1, 1, 1, 1,
0.1387516, 1.30078, -1.106456, 1, 1, 1, 1, 1,
0.1490926, 0.882036, -0.8522536, 1, 1, 1, 1, 1,
0.1516486, -0.7727435, 4.442617, 1, 1, 1, 1, 1,
0.1548185, -0.4484798, 3.298272, 1, 1, 1, 1, 1,
0.1553115, 0.3371253, 1.192435, 1, 1, 1, 1, 1,
0.1562169, 0.4830328, -0.4555468, 1, 1, 1, 1, 1,
0.1576091, -0.480589, 4.312599, 1, 1, 1, 1, 1,
0.1576104, 0.3983907, 1.542194, 1, 1, 1, 1, 1,
0.1596491, 0.09669042, -0.7427963, 1, 1, 1, 1, 1,
0.1608053, 0.2485782, 0.6192456, 1, 1, 1, 1, 1,
0.1647283, 0.272689, 1.076427, 0, 0, 1, 1, 1,
0.1659124, 1.214647, 1.177137, 1, 0, 0, 1, 1,
0.1666634, -0.6317085, 2.011369, 1, 0, 0, 1, 1,
0.1677672, 0.5856209, 0.6943702, 1, 0, 0, 1, 1,
0.1682955, -0.3015375, 1.063907, 1, 0, 0, 1, 1,
0.1734233, -1.052042, 2.734449, 1, 0, 0, 1, 1,
0.1747608, -0.3507811, 3.726708, 0, 0, 0, 1, 1,
0.1757028, -1.211921, 4.742207, 0, 0, 0, 1, 1,
0.1765585, -1.179164, 2.394786, 0, 0, 0, 1, 1,
0.1780977, -0.2425848, 3.100238, 0, 0, 0, 1, 1,
0.1782428, -0.009664457, 1.103555, 0, 0, 0, 1, 1,
0.1795768, -1.632188, 3.30383, 0, 0, 0, 1, 1,
0.1797175, -0.3039121, 4.308049, 0, 0, 0, 1, 1,
0.180442, 2.014587, 0.5141606, 1, 1, 1, 1, 1,
0.1827246, 0.9143813, -0.01421017, 1, 1, 1, 1, 1,
0.1849659, 0.9536775, 1.093376, 1, 1, 1, 1, 1,
0.1898607, 1.104301, 0.2345916, 1, 1, 1, 1, 1,
0.1913782, 2.72134, 1.351068, 1, 1, 1, 1, 1,
0.1944223, -1.387947, 1.842279, 1, 1, 1, 1, 1,
0.201336, -0.1525374, 2.707099, 1, 1, 1, 1, 1,
0.2027689, -0.8275763, 2.265955, 1, 1, 1, 1, 1,
0.2032557, 0.4537029, 1.866529, 1, 1, 1, 1, 1,
0.210653, 0.5385364, 1.193373, 1, 1, 1, 1, 1,
0.2122991, 0.5992261, 0.8679013, 1, 1, 1, 1, 1,
0.21593, -0.1536065, 1.36453, 1, 1, 1, 1, 1,
0.2165114, -0.09282485, 0.9668127, 1, 1, 1, 1, 1,
0.2220698, -0.9723383, 1.989099, 1, 1, 1, 1, 1,
0.2315049, 0.4880932, 0.09277927, 1, 1, 1, 1, 1,
0.2325592, -0.2229035, 2.762151, 0, 0, 1, 1, 1,
0.2330915, 0.6663668, -0.1149285, 1, 0, 0, 1, 1,
0.2379036, 0.9210454, 1.17821, 1, 0, 0, 1, 1,
0.2379609, -0.1288841, 2.380746, 1, 0, 0, 1, 1,
0.2406187, 1.116489, -0.5196082, 1, 0, 0, 1, 1,
0.2429277, -1.368329, 2.897122, 1, 0, 0, 1, 1,
0.2474494, -0.6074799, 2.147215, 0, 0, 0, 1, 1,
0.2503963, 0.4635888, -1.519603, 0, 0, 0, 1, 1,
0.2509579, 0.9001411, 1.776959, 0, 0, 0, 1, 1,
0.2516519, -0.1207659, 3.33872, 0, 0, 0, 1, 1,
0.2518655, 0.1905951, 1.379053, 0, 0, 0, 1, 1,
0.2530806, -0.7049164, 4.19259, 0, 0, 0, 1, 1,
0.2653565, -2.521322, 3.654912, 0, 0, 0, 1, 1,
0.2656533, 0.3690943, 2.811692, 1, 1, 1, 1, 1,
0.2739516, 0.8858563, 1.065278, 1, 1, 1, 1, 1,
0.2751264, 0.1559363, 0.9222395, 1, 1, 1, 1, 1,
0.2851942, -0.4756728, 2.576421, 1, 1, 1, 1, 1,
0.2893461, -0.5230154, 2.202806, 1, 1, 1, 1, 1,
0.2901222, 0.3266345, 0.4292705, 1, 1, 1, 1, 1,
0.2933209, -0.847719, 1.094954, 1, 1, 1, 1, 1,
0.2987449, 0.5827819, 1.380915, 1, 1, 1, 1, 1,
0.3033141, 1.179384, 0.9487715, 1, 1, 1, 1, 1,
0.3064046, -0.1380695, 2.600714, 1, 1, 1, 1, 1,
0.3064452, -1.704524, 2.03141, 1, 1, 1, 1, 1,
0.3071214, -0.9515561, 4.294963, 1, 1, 1, 1, 1,
0.3084714, -1.340699, 2.559668, 1, 1, 1, 1, 1,
0.310745, -1.437723, 3.73229, 1, 1, 1, 1, 1,
0.3164032, -1.638507, 2.743296, 1, 1, 1, 1, 1,
0.3165067, -0.2814345, 1.173273, 0, 0, 1, 1, 1,
0.3190194, -0.04823092, 1.874782, 1, 0, 0, 1, 1,
0.3192444, 0.1819133, 1.641172, 1, 0, 0, 1, 1,
0.3196957, 1.334043, -1.771961, 1, 0, 0, 1, 1,
0.324418, -0.351028, 2.525319, 1, 0, 0, 1, 1,
0.324486, 0.8757793, 0.2081065, 1, 0, 0, 1, 1,
0.3291554, -0.8238945, 2.488726, 0, 0, 0, 1, 1,
0.3295092, -0.3429064, 1.479158, 0, 0, 0, 1, 1,
0.3321898, 0.247623, 0.6577058, 0, 0, 0, 1, 1,
0.3366848, 0.8852152, 1.242653, 0, 0, 0, 1, 1,
0.3388226, 0.01143382, 1.886281, 0, 0, 0, 1, 1,
0.351634, 1.035882, -0.1306813, 0, 0, 0, 1, 1,
0.3569703, 0.1932462, 0.6018643, 0, 0, 0, 1, 1,
0.3598656, 1.093967, 0.588545, 1, 1, 1, 1, 1,
0.3610919, 0.6738742, 2.539408, 1, 1, 1, 1, 1,
0.3622923, -0.3244574, 2.134271, 1, 1, 1, 1, 1,
0.3636807, -0.2353063, 1.940832, 1, 1, 1, 1, 1,
0.3680429, -1.119668, 4.968522, 1, 1, 1, 1, 1,
0.3729503, -0.4132955, 1.958021, 1, 1, 1, 1, 1,
0.3790081, 0.9326363, 2.780417, 1, 1, 1, 1, 1,
0.3790305, -1.371918, 3.789446, 1, 1, 1, 1, 1,
0.3798413, 1.084613, -0.9665878, 1, 1, 1, 1, 1,
0.3800189, 0.7461607, 0.07039545, 1, 1, 1, 1, 1,
0.3833759, -1.886772, 1.779704, 1, 1, 1, 1, 1,
0.3876464, 0.227621, 0.6839613, 1, 1, 1, 1, 1,
0.3912277, 0.6915981, 1.772337, 1, 1, 1, 1, 1,
0.3969775, -0.3292831, 4.30979, 1, 1, 1, 1, 1,
0.3971638, -0.8126109, 2.6105, 1, 1, 1, 1, 1,
0.4002108, -0.2056932, 2.580107, 0, 0, 1, 1, 1,
0.4038606, 0.8301458, 2.390803, 1, 0, 0, 1, 1,
0.4074736, -2.347375, 1.607732, 1, 0, 0, 1, 1,
0.4138488, -0.4218135, 3.171842, 1, 0, 0, 1, 1,
0.4165953, 0.1762574, 1.647456, 1, 0, 0, 1, 1,
0.4207028, 0.7128876, -0.931183, 1, 0, 0, 1, 1,
0.4233298, 0.5626622, 1.66724, 0, 0, 0, 1, 1,
0.4237827, 0.8823196, 0.1701707, 0, 0, 0, 1, 1,
0.4278213, 0.1936367, 0.1924192, 0, 0, 0, 1, 1,
0.4299684, -0.1282921, 0.8665416, 0, 0, 0, 1, 1,
0.4310603, -0.01641323, 3.495372, 0, 0, 0, 1, 1,
0.4328703, -2.145796, 2.674059, 0, 0, 0, 1, 1,
0.4334505, -1.223308, 2.997465, 0, 0, 0, 1, 1,
0.4407784, 0.6394823, -0.9238415, 1, 1, 1, 1, 1,
0.4411254, -0.4985166, 4.364382, 1, 1, 1, 1, 1,
0.4459876, -0.7544398, 3.557285, 1, 1, 1, 1, 1,
0.4479452, 0.2353095, 1.91811, 1, 1, 1, 1, 1,
0.4492472, 0.4377688, 0.1471251, 1, 1, 1, 1, 1,
0.4512012, 0.8141483, 0.2576489, 1, 1, 1, 1, 1,
0.4520756, -0.9693789, 2.653939, 1, 1, 1, 1, 1,
0.4523838, 0.907564, -0.4885229, 1, 1, 1, 1, 1,
0.4530152, 0.8413208, 1.339839, 1, 1, 1, 1, 1,
0.4531513, 1.64121, 0.3593092, 1, 1, 1, 1, 1,
0.454833, 1.67251, 1.238065, 1, 1, 1, 1, 1,
0.4554475, -0.3671489, 2.278036, 1, 1, 1, 1, 1,
0.4570119, -0.1988281, 2.187099, 1, 1, 1, 1, 1,
0.4583666, 0.6106112, 0.8683223, 1, 1, 1, 1, 1,
0.4656418, 0.749136, 1.046148, 1, 1, 1, 1, 1,
0.4663901, -0.01449159, 1.383707, 0, 0, 1, 1, 1,
0.4669861, 0.7233152, 2.026308, 1, 0, 0, 1, 1,
0.4688148, -0.2072701, 2.412088, 1, 0, 0, 1, 1,
0.4710212, -1.483638, 4.302492, 1, 0, 0, 1, 1,
0.4718615, -0.7397729, 3.737928, 1, 0, 0, 1, 1,
0.4727369, 0.8853945, -0.236688, 1, 0, 0, 1, 1,
0.4777698, 0.5648342, 1.460375, 0, 0, 0, 1, 1,
0.4828562, 0.8261083, 1.446856, 0, 0, 0, 1, 1,
0.4870286, -0.6014807, 1.177013, 0, 0, 0, 1, 1,
0.4926261, 0.6466975, 1.248678, 0, 0, 0, 1, 1,
0.4931379, -0.4316866, 2.631526, 0, 0, 0, 1, 1,
0.4936541, 0.9411996, -0.0548289, 0, 0, 0, 1, 1,
0.493941, 1.296284, 1.525925, 0, 0, 0, 1, 1,
0.4940208, -0.7494919, 2.745737, 1, 1, 1, 1, 1,
0.4966006, -1.57114, 4.502612, 1, 1, 1, 1, 1,
0.4986227, 0.9531072, 1.057691, 1, 1, 1, 1, 1,
0.5011747, 2.143706, -0.9101421, 1, 1, 1, 1, 1,
0.5027508, -0.8078698, 1.058624, 1, 1, 1, 1, 1,
0.5056223, -0.02622364, 0.7068663, 1, 1, 1, 1, 1,
0.5107307, -0.1169454, 1.990805, 1, 1, 1, 1, 1,
0.511613, 0.08736012, 1.468522, 1, 1, 1, 1, 1,
0.513384, 0.3278398, 1.795323, 1, 1, 1, 1, 1,
0.518575, 1.198862, 0.5805677, 1, 1, 1, 1, 1,
0.5241778, -1.298483, 2.746873, 1, 1, 1, 1, 1,
0.5267715, -0.6008715, 2.87116, 1, 1, 1, 1, 1,
0.5268095, -0.417213, 3.361608, 1, 1, 1, 1, 1,
0.5280423, 0.08789555, 0.4955935, 1, 1, 1, 1, 1,
0.5306106, 0.283659, 0.9124847, 1, 1, 1, 1, 1,
0.5316401, 0.8189138, -0.8542075, 0, 0, 1, 1, 1,
0.5354098, 0.2019998, 0.2011122, 1, 0, 0, 1, 1,
0.5361596, -1.289957, 4.456841, 1, 0, 0, 1, 1,
0.5376009, -0.5269059, 0.9987529, 1, 0, 0, 1, 1,
0.5382507, -0.03677457, 0.4076292, 1, 0, 0, 1, 1,
0.5385857, 1.218452, 1.044023, 1, 0, 0, 1, 1,
0.5389618, -0.4418547, 2.144502, 0, 0, 0, 1, 1,
0.5421352, -0.02961069, 1.047146, 0, 0, 0, 1, 1,
0.5435805, 0.04827011, 0.2996752, 0, 0, 0, 1, 1,
0.5439688, -0.06206205, 2.092654, 0, 0, 0, 1, 1,
0.5472679, -0.1685567, -0.4113314, 0, 0, 0, 1, 1,
0.555663, -0.7734204, 1.836742, 0, 0, 0, 1, 1,
0.5603821, -0.3325527, 0.3083076, 0, 0, 0, 1, 1,
0.5607387, -0.3970172, 2.609685, 1, 1, 1, 1, 1,
0.5618785, -0.5895131, 2.361586, 1, 1, 1, 1, 1,
0.5640185, -1.176022, 4.793009, 1, 1, 1, 1, 1,
0.5659316, 0.09712624, 1.913854, 1, 1, 1, 1, 1,
0.5669911, -0.9549156, 1.870042, 1, 1, 1, 1, 1,
0.5682595, -0.09741828, 2.448662, 1, 1, 1, 1, 1,
0.5704216, 0.9978409, 0.2455035, 1, 1, 1, 1, 1,
0.5707749, 1.443647, -0.9415649, 1, 1, 1, 1, 1,
0.5735227, -1.940671, 2.860017, 1, 1, 1, 1, 1,
0.5736797, 0.7368581, 1.843886, 1, 1, 1, 1, 1,
0.5757458, 0.2133296, 2.587935, 1, 1, 1, 1, 1,
0.5759351, -2.482849, 2.342534, 1, 1, 1, 1, 1,
0.5797959, -0.8291609, 3.786655, 1, 1, 1, 1, 1,
0.5842154, -0.8213536, 3.250607, 1, 1, 1, 1, 1,
0.5881957, -1.104249, 1.620526, 1, 1, 1, 1, 1,
0.5886413, -0.7862445, 3.182822, 0, 0, 1, 1, 1,
0.5886616, 0.5398384, 0.5222229, 1, 0, 0, 1, 1,
0.5924591, 0.4652658, 2.249412, 1, 0, 0, 1, 1,
0.5955685, -1.325416, 1.742837, 1, 0, 0, 1, 1,
0.5999561, 0.3175439, 1.121169, 1, 0, 0, 1, 1,
0.6013054, -0.2573746, 0.596705, 1, 0, 0, 1, 1,
0.6018892, -0.002581261, 1.237294, 0, 0, 0, 1, 1,
0.6025732, -0.4364761, 0.7882813, 0, 0, 0, 1, 1,
0.6058782, 0.8759186, 0.3241121, 0, 0, 0, 1, 1,
0.619121, 0.1185867, 0.5854471, 0, 0, 0, 1, 1,
0.6191947, 0.03656533, 1.801123, 0, 0, 0, 1, 1,
0.6218322, -1.149404, 2.546157, 0, 0, 0, 1, 1,
0.6245738, -1.321078, 2.365833, 0, 0, 0, 1, 1,
0.6293716, -0.4199, 0.5093137, 1, 1, 1, 1, 1,
0.6300337, -0.2965732, 1.838097, 1, 1, 1, 1, 1,
0.6319835, -0.02407031, 1.803739, 1, 1, 1, 1, 1,
0.6347793, -0.246299, 1.819244, 1, 1, 1, 1, 1,
0.6368656, -0.1148705, 1.49184, 1, 1, 1, 1, 1,
0.6399244, -1.199518, 0.9971542, 1, 1, 1, 1, 1,
0.6416622, -0.7595539, 2.487716, 1, 1, 1, 1, 1,
0.6452178, 0.3965623, 0.6803533, 1, 1, 1, 1, 1,
0.6467304, -1.04992, 0.6215243, 1, 1, 1, 1, 1,
0.649708, 0.4608681, -0.9585097, 1, 1, 1, 1, 1,
0.6511595, 1.413496, 0.5380344, 1, 1, 1, 1, 1,
0.6516861, 0.4755753, 2.631717, 1, 1, 1, 1, 1,
0.6555418, 0.8706819, 2.106116, 1, 1, 1, 1, 1,
0.6590274, 0.2146933, 1.500535, 1, 1, 1, 1, 1,
0.6613651, 0.110467, -0.6919962, 1, 1, 1, 1, 1,
0.6629087, -0.9611216, 4.547673, 0, 0, 1, 1, 1,
0.6654665, -0.8171884, 2.341022, 1, 0, 0, 1, 1,
0.6709273, -0.5182577, 1.997336, 1, 0, 0, 1, 1,
0.6714176, 0.1473065, -0.4068481, 1, 0, 0, 1, 1,
0.6735103, 1.833522, 1.384972, 1, 0, 0, 1, 1,
0.6890616, -0.06642991, 2.489091, 1, 0, 0, 1, 1,
0.6917267, 1.51399, -0.7514496, 0, 0, 0, 1, 1,
0.6947802, -0.09775514, 2.778351, 0, 0, 0, 1, 1,
0.6968732, -0.5184612, 3.338779, 0, 0, 0, 1, 1,
0.6994529, -1.0535, 4.109871, 0, 0, 0, 1, 1,
0.7013375, 0.4177049, -0.1032209, 0, 0, 0, 1, 1,
0.7024606, -0.4111538, 2.418394, 0, 0, 0, 1, 1,
0.7040278, 0.3960181, -0.8275409, 0, 0, 0, 1, 1,
0.7063704, 0.5901032, 1.79151, 1, 1, 1, 1, 1,
0.7066066, -0.8689261, 1.209979, 1, 1, 1, 1, 1,
0.7161803, 1.426093, 0.2204855, 1, 1, 1, 1, 1,
0.7208876, 1.212305, -0.531611, 1, 1, 1, 1, 1,
0.7214996, 2.160431, -0.3239111, 1, 1, 1, 1, 1,
0.7219837, 1.334736, 0.7284185, 1, 1, 1, 1, 1,
0.7271543, 0.9592832, 0.7418143, 1, 1, 1, 1, 1,
0.7282676, 0.4424985, 1.586682, 1, 1, 1, 1, 1,
0.7340913, -1.363388, 3.084969, 1, 1, 1, 1, 1,
0.7352754, -0.5345556, 0.4453071, 1, 1, 1, 1, 1,
0.7370692, 0.2362096, 2.109028, 1, 1, 1, 1, 1,
0.7374075, 0.8853371, 2.52637, 1, 1, 1, 1, 1,
0.7398083, -0.7483727, 2.125703, 1, 1, 1, 1, 1,
0.7486959, 0.7183996, 1.376707, 1, 1, 1, 1, 1,
0.7489707, 0.07308424, -0.2255931, 1, 1, 1, 1, 1,
0.7500813, 0.2259135, 1.255573, 0, 0, 1, 1, 1,
0.7612783, 0.2814711, 1.96532, 1, 0, 0, 1, 1,
0.7636715, -0.6838065, 3.426764, 1, 0, 0, 1, 1,
0.765043, 2.190485, 1.918259, 1, 0, 0, 1, 1,
0.7675294, -0.04776935, 2.133134, 1, 0, 0, 1, 1,
0.7691348, -0.2902928, 0.03905603, 1, 0, 0, 1, 1,
0.7703976, -0.8158979, 3.610409, 0, 0, 0, 1, 1,
0.7752865, -1.015165, 1.737599, 0, 0, 0, 1, 1,
0.7777605, 1.290579, 1.184113, 0, 0, 0, 1, 1,
0.7798162, -0.04820281, 0.6732473, 0, 0, 0, 1, 1,
0.780174, -0.9261133, 3.838537, 0, 0, 0, 1, 1,
0.7863105, 0.3386411, 0.1725398, 0, 0, 0, 1, 1,
0.7866243, 0.01891537, 0.4490353, 0, 0, 0, 1, 1,
0.7882784, -0.5273398, 3.262899, 1, 1, 1, 1, 1,
0.7969471, 0.9614614, 1.688131, 1, 1, 1, 1, 1,
0.8088595, -2.36875, 3.293679, 1, 1, 1, 1, 1,
0.809578, -0.4908255, 3.105352, 1, 1, 1, 1, 1,
0.81149, 0.4144252, -1.544909, 1, 1, 1, 1, 1,
0.8162461, -0.5095934, 2.705811, 1, 1, 1, 1, 1,
0.8211739, -0.8255464, 1.272716, 1, 1, 1, 1, 1,
0.8227355, 0.4031613, 0.9431725, 1, 1, 1, 1, 1,
0.824471, 1.106116, 1.251826, 1, 1, 1, 1, 1,
0.831985, 0.6653366, 2.433518, 1, 1, 1, 1, 1,
0.8333926, -0.9367105, 1.088849, 1, 1, 1, 1, 1,
0.8376696, 0.8370998, 1.528643, 1, 1, 1, 1, 1,
0.8403565, -0.1561473, 2.074122, 1, 1, 1, 1, 1,
0.8413498, 0.2674711, 1.304945, 1, 1, 1, 1, 1,
0.8424906, 0.2143284, 0.3947855, 1, 1, 1, 1, 1,
0.8473205, 0.524841, 0.08643025, 0, 0, 1, 1, 1,
0.8483058, 1.774554, 2.301518, 1, 0, 0, 1, 1,
0.8502313, 1.051787, 1.26526, 1, 0, 0, 1, 1,
0.8537329, -0.437001, 2.023949, 1, 0, 0, 1, 1,
0.8624103, -0.04801954, 1.943767, 1, 0, 0, 1, 1,
0.8630384, 0.6265218, 2.194358, 1, 0, 0, 1, 1,
0.8752429, -0.1354588, 0.2742526, 0, 0, 0, 1, 1,
0.886708, 0.382945, 0.9888989, 0, 0, 0, 1, 1,
0.8881032, 1.226757, 0.3920574, 0, 0, 0, 1, 1,
0.8929844, 0.7474689, 0.8985608, 0, 0, 0, 1, 1,
0.9033231, -0.09952698, 1.179384, 0, 0, 0, 1, 1,
0.9074574, 0.2679336, 1.398834, 0, 0, 0, 1, 1,
0.9098098, -0.5816783, 2.923722, 0, 0, 0, 1, 1,
0.9181697, -0.3648618, 2.440602, 1, 1, 1, 1, 1,
0.918465, -0.5510615, 2.302402, 1, 1, 1, 1, 1,
0.920157, 0.1334936, 2.345467, 1, 1, 1, 1, 1,
0.9400042, 0.2038422, 2.358497, 1, 1, 1, 1, 1,
0.9404692, 0.466709, -0.6389506, 1, 1, 1, 1, 1,
0.9406614, -2.55407, 1.872607, 1, 1, 1, 1, 1,
0.9658521, -0.2452604, 2.028864, 1, 1, 1, 1, 1,
0.9668546, -1.861016, 1.265077, 1, 1, 1, 1, 1,
0.9721861, 0.2437918, 2.939769, 1, 1, 1, 1, 1,
0.9827996, 0.3673557, 0.8328173, 1, 1, 1, 1, 1,
0.9948493, 0.0803415, 1.938637, 1, 1, 1, 1, 1,
0.9965181, -0.8399048, 2.977358, 1, 1, 1, 1, 1,
0.9983131, -0.2996571, 3.35955, 1, 1, 1, 1, 1,
1.006763, 0.3650167, -0.03409001, 1, 1, 1, 1, 1,
1.014636, -1.519707, 1.688648, 1, 1, 1, 1, 1,
1.025242, -0.5533497, 0.7221919, 0, 0, 1, 1, 1,
1.025641, -0.1974325, 1.241413, 1, 0, 0, 1, 1,
1.028957, -0.2245048, 2.624574, 1, 0, 0, 1, 1,
1.029466, -1.608828, 2.12426, 1, 0, 0, 1, 1,
1.03236, 1.291757, 0.03089468, 1, 0, 0, 1, 1,
1.040776, 0.7615284, 1.256912, 1, 0, 0, 1, 1,
1.046932, -0.9159284, 2.760003, 0, 0, 0, 1, 1,
1.047225, -0.5161011, 2.351595, 0, 0, 0, 1, 1,
1.047288, 0.6483105, 1.210358, 0, 0, 0, 1, 1,
1.047725, -0.3768797, 1.349834, 0, 0, 0, 1, 1,
1.05001, 0.9084504, 0.3059341, 0, 0, 0, 1, 1,
1.052798, 2.171691, -0.4159111, 0, 0, 0, 1, 1,
1.056582, -1.314007, 2.12389, 0, 0, 0, 1, 1,
1.059493, 0.6054891, 2.284619, 1, 1, 1, 1, 1,
1.062213, 1.696433, -0.9593126, 1, 1, 1, 1, 1,
1.062691, 0.6406806, 2.052983, 1, 1, 1, 1, 1,
1.066482, -0.4506598, -0.473427, 1, 1, 1, 1, 1,
1.071874, 0.1459139, 1.080463, 1, 1, 1, 1, 1,
1.074454, -0.06523959, 0.844705, 1, 1, 1, 1, 1,
1.08829, 0.3438594, 2.539625, 1, 1, 1, 1, 1,
1.090017, -1.99331, 1.291513, 1, 1, 1, 1, 1,
1.091614, 0.5707328, 1.761091, 1, 1, 1, 1, 1,
1.095138, 0.8644982, 1.492188, 1, 1, 1, 1, 1,
1.108227, -0.6940318, 0.114244, 1, 1, 1, 1, 1,
1.112294, -0.03456785, 2.536036, 1, 1, 1, 1, 1,
1.120744, -1.180433, 3.349386, 1, 1, 1, 1, 1,
1.122387, 0.5949399, 2.778081, 1, 1, 1, 1, 1,
1.128351, 0.4300771, 2.317338, 1, 1, 1, 1, 1,
1.133489, 0.02078765, 4.077456, 0, 0, 1, 1, 1,
1.141889, 1.260987, -0.4153409, 1, 0, 0, 1, 1,
1.157342, 0.6629927, 3.189678, 1, 0, 0, 1, 1,
1.160609, 0.9133701, -1.141243, 1, 0, 0, 1, 1,
1.165518, -1.590961, 2.940033, 1, 0, 0, 1, 1,
1.175943, 0.03704811, 1.964035, 1, 0, 0, 1, 1,
1.181242, 0.9368534, 3.159297, 0, 0, 0, 1, 1,
1.182948, 0.009804619, 2.88938, 0, 0, 0, 1, 1,
1.1855, 0.3016075, 0.7127719, 0, 0, 0, 1, 1,
1.187389, -0.8845683, 2.121922, 0, 0, 0, 1, 1,
1.189922, -0.6189603, 0.4693807, 0, 0, 0, 1, 1,
1.192497, -0.3571822, 2.144695, 0, 0, 0, 1, 1,
1.193176, 2.151234, -0.1393207, 0, 0, 0, 1, 1,
1.19442, -1.903372, 3.13573, 1, 1, 1, 1, 1,
1.195598, -0.2607571, 2.806118, 1, 1, 1, 1, 1,
1.197717, -0.2876721, 1.559452, 1, 1, 1, 1, 1,
1.198694, 0.1298021, 0.709852, 1, 1, 1, 1, 1,
1.203997, 0.7576736, 0.1991552, 1, 1, 1, 1, 1,
1.206383, -0.5045672, 2.101227, 1, 1, 1, 1, 1,
1.213421, 1.328987, 0.3992043, 1, 1, 1, 1, 1,
1.21558, -0.2797027, 2.21874, 1, 1, 1, 1, 1,
1.222035, 0.3090998, 1.521486, 1, 1, 1, 1, 1,
1.228725, -0.3398099, 1.929183, 1, 1, 1, 1, 1,
1.232083, 0.5187462, 0.4876878, 1, 1, 1, 1, 1,
1.234402, -0.8786688, 1.78887, 1, 1, 1, 1, 1,
1.239137, -0.4006922, 0.1650642, 1, 1, 1, 1, 1,
1.254279, 0.7501296, 1.787901, 1, 1, 1, 1, 1,
1.263622, -1.41155, 1.087634, 1, 1, 1, 1, 1,
1.265852, 0.6239815, 1.314873, 0, 0, 1, 1, 1,
1.267305, 0.121414, 3.775348, 1, 0, 0, 1, 1,
1.273355, -1.153896, 0.2627072, 1, 0, 0, 1, 1,
1.276043, 0.07454552, 0.825386, 1, 0, 0, 1, 1,
1.27937, -0.3708165, 2.271372, 1, 0, 0, 1, 1,
1.27967, -1.089067, 2.834606, 1, 0, 0, 1, 1,
1.287472, 0.7434884, 0.6657264, 0, 0, 0, 1, 1,
1.313664, -1.095777, 3.05535, 0, 0, 0, 1, 1,
1.316047, 1.003273, 0.2728795, 0, 0, 0, 1, 1,
1.324062, 0.5778658, 0.1390295, 0, 0, 0, 1, 1,
1.341049, -0.4438974, 2.575096, 0, 0, 0, 1, 1,
1.343086, 0.501448, 0.7638677, 0, 0, 0, 1, 1,
1.344246, 0.1224744, 1.102109, 0, 0, 0, 1, 1,
1.352963, -0.7115211, 2.474556, 1, 1, 1, 1, 1,
1.352985, 0.676815, 0.6409093, 1, 1, 1, 1, 1,
1.366002, -1.449507, 2.8177, 1, 1, 1, 1, 1,
1.368982, -0.7674947, 3.348984, 1, 1, 1, 1, 1,
1.369352, -1.800528, 3.329524, 1, 1, 1, 1, 1,
1.377786, 0.05099761, 1.464072, 1, 1, 1, 1, 1,
1.386969, -1.114502, 2.870466, 1, 1, 1, 1, 1,
1.391831, -0.6544446, 1.855043, 1, 1, 1, 1, 1,
1.405576, -1.305601, 2.272383, 1, 1, 1, 1, 1,
1.411917, 0.9746096, 0.9641579, 1, 1, 1, 1, 1,
1.420211, 0.8204753, 2.040872, 1, 1, 1, 1, 1,
1.425528, -0.7302597, 1.655508, 1, 1, 1, 1, 1,
1.428572, 0.3905204, 0.7194113, 1, 1, 1, 1, 1,
1.455729, -0.8229698, 2.259732, 1, 1, 1, 1, 1,
1.458667, 0.7015118, 0.494738, 1, 1, 1, 1, 1,
1.465757, -0.5148662, 2.191819, 0, 0, 1, 1, 1,
1.468131, -0.4812485, 3.017135, 1, 0, 0, 1, 1,
1.470515, -0.3125007, 1.336531, 1, 0, 0, 1, 1,
1.492856, 0.2242336, 1.418742, 1, 0, 0, 1, 1,
1.493119, -0.2697884, 0.9637936, 1, 0, 0, 1, 1,
1.495422, -0.2054562, 0.6523172, 1, 0, 0, 1, 1,
1.500063, -1.06927, 2.309981, 0, 0, 0, 1, 1,
1.523824, -0.4828778, 2.301871, 0, 0, 0, 1, 1,
1.524488, -0.4886036, 0.861078, 0, 0, 0, 1, 1,
1.526171, 0.919273, 0.6659952, 0, 0, 0, 1, 1,
1.53647, -1.303866, 1.395378, 0, 0, 0, 1, 1,
1.538239, 1.066693, 1.868966, 0, 0, 0, 1, 1,
1.540564, 1.251006, 0.4569528, 0, 0, 0, 1, 1,
1.542363, -1.046208, 2.819981, 1, 1, 1, 1, 1,
1.545787, -0.5133011, 2.366313, 1, 1, 1, 1, 1,
1.563374, 0.690505, 2.013647, 1, 1, 1, 1, 1,
1.564576, -0.006865254, 2.657129, 1, 1, 1, 1, 1,
1.576967, 0.07415312, 0.7497257, 1, 1, 1, 1, 1,
1.577449, 1.243733, 0.807124, 1, 1, 1, 1, 1,
1.578149, 1.550845, 2.028357, 1, 1, 1, 1, 1,
1.581394, 0.04867543, 1.833299, 1, 1, 1, 1, 1,
1.593039, -1.450356, 4.173161, 1, 1, 1, 1, 1,
1.595625, -0.8688532, 1.47523, 1, 1, 1, 1, 1,
1.604565, 0.176412, -0.0507834, 1, 1, 1, 1, 1,
1.632416, -0.9628322, 4.481655, 1, 1, 1, 1, 1,
1.638303, -1.140903, 3.532383, 1, 1, 1, 1, 1,
1.65195, -0.9174566, 2.734604, 1, 1, 1, 1, 1,
1.658191, -0.9285007, 1.909017, 1, 1, 1, 1, 1,
1.683124, -0.940565, 1.358517, 0, 0, 1, 1, 1,
1.691784, -1.520908, 2.737385, 1, 0, 0, 1, 1,
1.703649, -0.2999034, 1.562884, 1, 0, 0, 1, 1,
1.707169, 0.9415935, 1.127752, 1, 0, 0, 1, 1,
1.711041, 1.819137, 1.401474, 1, 0, 0, 1, 1,
1.742899, 1.651327, 0.4447592, 1, 0, 0, 1, 1,
1.771569, 1.31608, 1.077701, 0, 0, 0, 1, 1,
1.771918, 0.7756786, 1.408032, 0, 0, 0, 1, 1,
1.784858, 0.2564801, 1.424023, 0, 0, 0, 1, 1,
1.786384, 3.42181, -0.01216077, 0, 0, 0, 1, 1,
1.829464, 1.866502, 1.021653, 0, 0, 0, 1, 1,
1.836703, -0.7889229, 1.380023, 0, 0, 0, 1, 1,
1.841304, -1.344265, 2.050531, 0, 0, 0, 1, 1,
1.885475, 0.8200131, 0.6922196, 1, 1, 1, 1, 1,
1.893788, -1.43984, 3.292374, 1, 1, 1, 1, 1,
1.896952, -0.07590386, 3.200546, 1, 1, 1, 1, 1,
1.902744, -1.096285, 1.873465, 1, 1, 1, 1, 1,
1.908366, 0.8566605, 1.428222, 1, 1, 1, 1, 1,
1.920169, 0.4051537, 1.759377, 1, 1, 1, 1, 1,
1.941126, -0.233349, 2.124883, 1, 1, 1, 1, 1,
1.948413, 0.1326941, 2.122861, 1, 1, 1, 1, 1,
1.960514, -0.0624055, 0.7938476, 1, 1, 1, 1, 1,
1.970836, 1.292835, 0.5668365, 1, 1, 1, 1, 1,
1.980445, 0.4855217, 0.7889132, 1, 1, 1, 1, 1,
1.984538, -0.5238596, 2.1011, 1, 1, 1, 1, 1,
1.99795, 0.4242563, 3.27583, 1, 1, 1, 1, 1,
2.028045, 0.9973087, 0.5776451, 1, 1, 1, 1, 1,
2.029663, -0.8284316, 2.201653, 1, 1, 1, 1, 1,
2.080608, 0.3559924, 1.414339, 0, 0, 1, 1, 1,
2.082205, -1.798187, 2.278868, 1, 0, 0, 1, 1,
2.148456, -1.408918, 3.030639, 1, 0, 0, 1, 1,
2.172071, 0.5256093, 2.084106, 1, 0, 0, 1, 1,
2.178986, -0.8485234, 1.969165, 1, 0, 0, 1, 1,
2.190901, -0.480014, 2.327931, 1, 0, 0, 1, 1,
2.299869, -1.004194, 3.296747, 0, 0, 0, 1, 1,
2.332906, 0.3841706, 2.01656, 0, 0, 0, 1, 1,
2.405817, 0.2528034, 0.7610118, 0, 0, 0, 1, 1,
2.446107, -0.7468797, 3.309557, 0, 0, 0, 1, 1,
2.452667, 1.614524, 1.55556, 0, 0, 0, 1, 1,
2.490803, -1.801035, 2.663275, 0, 0, 0, 1, 1,
2.56278, 0.8222781, 1.121817, 0, 0, 0, 1, 1,
2.5937, -0.8133042, 0.9249539, 1, 1, 1, 1, 1,
2.66596, 2.190042, 3.20165, 1, 1, 1, 1, 1,
2.836282, -0.9600547, 1.677389, 1, 1, 1, 1, 1,
3.145253, -1.625575, 2.313108, 1, 1, 1, 1, 1,
3.175802, 0.438533, 1.597051, 1, 1, 1, 1, 1,
3.413114, 0.6044164, 2.013766, 1, 1, 1, 1, 1,
3.74782, 0.6357927, 1.593279, 1, 1, 1, 1, 1
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
var radius = 9.855336;
var distance = 34.61645;
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
mvMatrix.translate( 0.0559001, -0.1033282, 0.2400026 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61645);
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
