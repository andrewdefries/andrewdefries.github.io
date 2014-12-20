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
-3.953763, -0.1856352, -0.2344765, 1, 0, 0, 1,
-3.606929, -1.03848, -0.4130708, 1, 0.007843138, 0, 1,
-2.787324, 0.1604891, -1.584443, 1, 0.01176471, 0, 1,
-2.613005, -0.5163464, -2.466189, 1, 0.01960784, 0, 1,
-2.612921, -0.9544895, -0.5036043, 1, 0.02352941, 0, 1,
-2.568235, -0.3145347, -0.5458168, 1, 0.03137255, 0, 1,
-2.417807, 0.4531915, -1.548589, 1, 0.03529412, 0, 1,
-2.406797, -0.5042555, -2.396271, 1, 0.04313726, 0, 1,
-2.360056, 0.1996111, -0.9464895, 1, 0.04705882, 0, 1,
-2.351087, -0.2722446, -3.143807, 1, 0.05490196, 0, 1,
-2.341227, -0.1686814, -3.423481, 1, 0.05882353, 0, 1,
-2.309083, 1.921169, -2.731112, 1, 0.06666667, 0, 1,
-2.28584, 0.7382897, -1.479132, 1, 0.07058824, 0, 1,
-2.099454, 0.4743883, -1.783896, 1, 0.07843138, 0, 1,
-2.084872, -1.208382, -1.89592, 1, 0.08235294, 0, 1,
-2.064292, 0.5569224, -0.6665568, 1, 0.09019608, 0, 1,
-2.04127, -0.2386131, -1.519317, 1, 0.09411765, 0, 1,
-2.037976, -0.1746584, -1.047183, 1, 0.1019608, 0, 1,
-2.036108, 0.09428519, -1.149276, 1, 0.1098039, 0, 1,
-2.020066, -0.9949971, -1.990311, 1, 0.1137255, 0, 1,
-1.992522, -2.515235, -3.94894, 1, 0.1215686, 0, 1,
-1.990733, -0.8791108, -1.775387, 1, 0.1254902, 0, 1,
-1.985112, 1.55479, -1.637062, 1, 0.1333333, 0, 1,
-1.870123, 0.9472657, -0.07670528, 1, 0.1372549, 0, 1,
-1.857643, 0.3526986, -0.4337879, 1, 0.145098, 0, 1,
-1.852119, -0.06576782, -2.074904, 1, 0.1490196, 0, 1,
-1.836838, -0.3625829, -0.5423344, 1, 0.1568628, 0, 1,
-1.802021, -1.591373, -2.080545, 1, 0.1607843, 0, 1,
-1.785532, 1.065919, -1.961081, 1, 0.1686275, 0, 1,
-1.78314, -0.6704683, -0.5435225, 1, 0.172549, 0, 1,
-1.767748, -0.08214797, -4.334239, 1, 0.1803922, 0, 1,
-1.767657, -1.273062, -3.092739, 1, 0.1843137, 0, 1,
-1.748621, -0.3880669, -1.75704, 1, 0.1921569, 0, 1,
-1.74311, -1.28078, -2.552331, 1, 0.1960784, 0, 1,
-1.739621, 1.452723, -1.188037, 1, 0.2039216, 0, 1,
-1.735786, -0.6185612, -0.9228284, 1, 0.2117647, 0, 1,
-1.729379, 0.1090027, -2.42878, 1, 0.2156863, 0, 1,
-1.723689, 0.3212065, -1.984186, 1, 0.2235294, 0, 1,
-1.683525, -1.917531, -3.006627, 1, 0.227451, 0, 1,
-1.663021, 0.288248, -1.553454, 1, 0.2352941, 0, 1,
-1.65567, 0.269926, -1.90634, 1, 0.2392157, 0, 1,
-1.653933, 1.005505, -2.777669, 1, 0.2470588, 0, 1,
-1.651049, 1.53724, -2.282637, 1, 0.2509804, 0, 1,
-1.645236, -1.105317, -1.87542, 1, 0.2588235, 0, 1,
-1.642859, -0.2501066, -1.434955, 1, 0.2627451, 0, 1,
-1.640564, -0.07660321, -1.791588, 1, 0.2705882, 0, 1,
-1.630211, -0.8365573, -2.796235, 1, 0.2745098, 0, 1,
-1.628966, -0.02174045, -1.878755, 1, 0.282353, 0, 1,
-1.614874, -1.546649, -2.458682, 1, 0.2862745, 0, 1,
-1.614873, -1.319521, -3.657286, 1, 0.2941177, 0, 1,
-1.609784, -1.830878, -0.1858431, 1, 0.3019608, 0, 1,
-1.607986, -1.286327, -3.067905, 1, 0.3058824, 0, 1,
-1.60184, 0.08732428, -0.4338141, 1, 0.3137255, 0, 1,
-1.599341, -0.1849974, -0.9242175, 1, 0.3176471, 0, 1,
-1.59869, 0.08981752, 0.01508476, 1, 0.3254902, 0, 1,
-1.596354, 1.343371, -1.127987, 1, 0.3294118, 0, 1,
-1.593715, 0.5473904, -1.216361, 1, 0.3372549, 0, 1,
-1.592043, 0.6897128, -2.528836, 1, 0.3411765, 0, 1,
-1.573646, 1.771868, 0.07166026, 1, 0.3490196, 0, 1,
-1.569866, 1.136495, -1.151027, 1, 0.3529412, 0, 1,
-1.546907, 0.09490436, -3.702048, 1, 0.3607843, 0, 1,
-1.54583, 0.6132659, -3.106487, 1, 0.3647059, 0, 1,
-1.539133, -0.3142951, -0.5825282, 1, 0.372549, 0, 1,
-1.513147, 0.02475305, -1.426922, 1, 0.3764706, 0, 1,
-1.511039, -0.3060058, -2.598022, 1, 0.3843137, 0, 1,
-1.508775, 0.8378227, -1.456152, 1, 0.3882353, 0, 1,
-1.508584, 2.214904, -0.9643381, 1, 0.3960784, 0, 1,
-1.499925, -0.1363482, -0.0824168, 1, 0.4039216, 0, 1,
-1.458761, 0.9661227, -1.364924, 1, 0.4078431, 0, 1,
-1.454653, 0.5375212, -1.648171, 1, 0.4156863, 0, 1,
-1.449552, 1.640986, -2.106077, 1, 0.4196078, 0, 1,
-1.440515, 0.8160201, -0.449016, 1, 0.427451, 0, 1,
-1.432768, 2.388284, -0.5135779, 1, 0.4313726, 0, 1,
-1.429683, 1.430123, -0.963435, 1, 0.4392157, 0, 1,
-1.42868, -0.9395486, -1.889157, 1, 0.4431373, 0, 1,
-1.42686, 0.8305033, -1.384817, 1, 0.4509804, 0, 1,
-1.418496, 1.524901, 0.2907261, 1, 0.454902, 0, 1,
-1.408621, -1.272521, -1.842815, 1, 0.4627451, 0, 1,
-1.407382, -0.07566989, -2.136085, 1, 0.4666667, 0, 1,
-1.404599, 0.7095518, -1.362562, 1, 0.4745098, 0, 1,
-1.400611, 0.2229456, -0.9969481, 1, 0.4784314, 0, 1,
-1.388489, 0.237336, -0.8346704, 1, 0.4862745, 0, 1,
-1.386796, -0.1530656, -0.4131744, 1, 0.4901961, 0, 1,
-1.368306, 0.7798991, -1.767737, 1, 0.4980392, 0, 1,
-1.363197, 0.01083657, -1.166563, 1, 0.5058824, 0, 1,
-1.361024, -0.5698749, -1.923074, 1, 0.509804, 0, 1,
-1.354833, 0.409621, -2.028684, 1, 0.5176471, 0, 1,
-1.350248, -1.901793, -1.783865, 1, 0.5215687, 0, 1,
-1.340694, 0.02219798, -0.6651354, 1, 0.5294118, 0, 1,
-1.336344, -1.846823, -1.996249, 1, 0.5333334, 0, 1,
-1.326895, -0.1739642, -0.3260953, 1, 0.5411765, 0, 1,
-1.296549, -0.2830873, -2.628916, 1, 0.5450981, 0, 1,
-1.286055, 0.05476642, -0.05272936, 1, 0.5529412, 0, 1,
-1.277392, -1.99498, -4.656467, 1, 0.5568628, 0, 1,
-1.274854, -1.208354, -3.765894, 1, 0.5647059, 0, 1,
-1.271911, -0.08813058, -2.004579, 1, 0.5686275, 0, 1,
-1.269114, -0.08799531, -2.744044, 1, 0.5764706, 0, 1,
-1.258366, 1.422336, -1.967408, 1, 0.5803922, 0, 1,
-1.257227, 0.2098185, -1.188086, 1, 0.5882353, 0, 1,
-1.250996, -2.21976, -1.268469, 1, 0.5921569, 0, 1,
-1.240658, 1.227939, -0.7611563, 1, 0.6, 0, 1,
-1.237937, -0.1854281, -2.18102, 1, 0.6078432, 0, 1,
-1.236681, 0.5461065, -0.6497969, 1, 0.6117647, 0, 1,
-1.223996, -0.6860392, -2.479982, 1, 0.6196079, 0, 1,
-1.209944, 0.2063827, -2.764482, 1, 0.6235294, 0, 1,
-1.20902, 0.550477, 1.470073, 1, 0.6313726, 0, 1,
-1.202688, -0.3640586, -4.041689, 1, 0.6352941, 0, 1,
-1.185913, -0.05546362, -1.162899, 1, 0.6431373, 0, 1,
-1.169265, -0.5904012, -1.358517, 1, 0.6470588, 0, 1,
-1.166485, 0.293864, -1.236045, 1, 0.654902, 0, 1,
-1.160747, -0.2426186, -0.01833144, 1, 0.6588235, 0, 1,
-1.153798, -0.7973468, -3.136175, 1, 0.6666667, 0, 1,
-1.144694, -0.9294862, -2.550109, 1, 0.6705883, 0, 1,
-1.141851, -0.03592423, -2.667012, 1, 0.6784314, 0, 1,
-1.14122, -0.6224263, -3.160173, 1, 0.682353, 0, 1,
-1.14083, -0.3256263, -0.1719495, 1, 0.6901961, 0, 1,
-1.135609, 1.376551, 0.1882987, 1, 0.6941177, 0, 1,
-1.132548, -1.70352, -3.595332, 1, 0.7019608, 0, 1,
-1.127863, -0.4507158, -1.531248, 1, 0.7098039, 0, 1,
-1.123814, -0.3564311, -1.333829, 1, 0.7137255, 0, 1,
-1.122815, -0.6589742, -4.135905, 1, 0.7215686, 0, 1,
-1.122339, 1.03066, 1.598263, 1, 0.7254902, 0, 1,
-1.119364, -1.739801, -3.212851, 1, 0.7333333, 0, 1,
-1.114905, -0.7708592, -1.087793, 1, 0.7372549, 0, 1,
-1.112621, -1.483736, -2.834504, 1, 0.7450981, 0, 1,
-1.111624, 0.8956985, -1.333528, 1, 0.7490196, 0, 1,
-1.105003, -0.3509399, -0.5595523, 1, 0.7568628, 0, 1,
-1.102416, 1.055941, -0.8434328, 1, 0.7607843, 0, 1,
-1.098587, -0.2309904, -3.981638, 1, 0.7686275, 0, 1,
-1.097473, -1.967049, -1.282402, 1, 0.772549, 0, 1,
-1.097457, -2.014807, -2.172743, 1, 0.7803922, 0, 1,
-1.091172, 1.384897, -0.1125976, 1, 0.7843137, 0, 1,
-1.089627, 0.2257663, -0.74742, 1, 0.7921569, 0, 1,
-1.088556, -0.2225145, -2.077741, 1, 0.7960784, 0, 1,
-1.087676, 0.6544967, -0.8702445, 1, 0.8039216, 0, 1,
-1.085652, 0.7714184, -1.02881, 1, 0.8117647, 0, 1,
-1.075287, 0.5867189, -0.6646986, 1, 0.8156863, 0, 1,
-1.075259, 2.208285, 0.5677021, 1, 0.8235294, 0, 1,
-1.073262, 0.7837825, -2.108235, 1, 0.827451, 0, 1,
-1.06603, -1.096438, -1.467594, 1, 0.8352941, 0, 1,
-1.06551, 1.038817, -1.487347, 1, 0.8392157, 0, 1,
-1.059854, 0.8999763, -0.6675861, 1, 0.8470588, 0, 1,
-1.056559, -1.184899, -4.476834, 1, 0.8509804, 0, 1,
-1.054498, -1.053769, -0.3032523, 1, 0.8588235, 0, 1,
-1.053643, 1.946195, -1.169335, 1, 0.8627451, 0, 1,
-1.042413, 0.7891735, -0.757677, 1, 0.8705882, 0, 1,
-1.041375, 0.4434653, -0.6546592, 1, 0.8745098, 0, 1,
-1.040228, 0.3038523, -1.203602, 1, 0.8823529, 0, 1,
-1.040144, -0.8705267, -2.037934, 1, 0.8862745, 0, 1,
-1.023293, 1.215919, -2.806465, 1, 0.8941177, 0, 1,
-1.022889, 2.119261, -2.235563, 1, 0.8980392, 0, 1,
-0.9985268, 0.06508061, -3.10832, 1, 0.9058824, 0, 1,
-0.9951875, -0.7534901, -2.613238, 1, 0.9137255, 0, 1,
-0.9939897, -0.2741283, -2.836764, 1, 0.9176471, 0, 1,
-0.9921371, -1.520187, -0.9567074, 1, 0.9254902, 0, 1,
-0.9876077, 0.4214621, -0.8557245, 1, 0.9294118, 0, 1,
-0.981969, 2.488929, -1.081905, 1, 0.9372549, 0, 1,
-0.976988, -1.487726, -0.6797187, 1, 0.9411765, 0, 1,
-0.9752249, -0.7589522, -1.001954, 1, 0.9490196, 0, 1,
-0.9749215, 0.7517108, -1.619481, 1, 0.9529412, 0, 1,
-0.9729232, 1.668335, 0.6197473, 1, 0.9607843, 0, 1,
-0.9674167, -0.6160349, -3.774382, 1, 0.9647059, 0, 1,
-0.9662638, -0.8714482, -2.479408, 1, 0.972549, 0, 1,
-0.9582485, -0.7755036, -1.872072, 1, 0.9764706, 0, 1,
-0.9501362, 0.8958953, -0.2691479, 1, 0.9843137, 0, 1,
-0.9486675, -0.3450467, -1.536298, 1, 0.9882353, 0, 1,
-0.9486402, -1.649642, -3.172707, 1, 0.9960784, 0, 1,
-0.9478582, -1.690801, -3.123617, 0.9960784, 1, 0, 1,
-0.9463926, -0.9443692, -2.485626, 0.9921569, 1, 0, 1,
-0.9370512, 1.607625, 1.723534, 0.9843137, 1, 0, 1,
-0.9335172, 2.208043, -1.592468, 0.9803922, 1, 0, 1,
-0.9266095, -0.1111182, -2.162342, 0.972549, 1, 0, 1,
-0.9231642, 1.628098, -0.08068389, 0.9686275, 1, 0, 1,
-0.9223284, 1.243883, -1.046116, 0.9607843, 1, 0, 1,
-0.9220057, 0.2024959, -2.323238, 0.9568627, 1, 0, 1,
-0.9202274, 0.3628277, -3.030753, 0.9490196, 1, 0, 1,
-0.9201903, -0.2141859, 0.8193287, 0.945098, 1, 0, 1,
-0.9165873, 0.2504188, -2.735536, 0.9372549, 1, 0, 1,
-0.916236, 1.024009, 0.1386288, 0.9333333, 1, 0, 1,
-0.9151207, 0.3650784, -1.692377, 0.9254902, 1, 0, 1,
-0.9052885, 0.6750101, -0.03888493, 0.9215686, 1, 0, 1,
-0.9004266, 0.4151143, -1.077628, 0.9137255, 1, 0, 1,
-0.8961291, 1.039659, -0.5920779, 0.9098039, 1, 0, 1,
-0.8921472, 0.2714275, 0.3595606, 0.9019608, 1, 0, 1,
-0.8911924, -1.532811, -0.8077055, 0.8941177, 1, 0, 1,
-0.8886266, 0.4081888, -1.245275, 0.8901961, 1, 0, 1,
-0.885316, 0.6435959, -2.791879, 0.8823529, 1, 0, 1,
-0.8850152, -1.027161, -0.5341425, 0.8784314, 1, 0, 1,
-0.8809626, 1.179044, 1.079705, 0.8705882, 1, 0, 1,
-0.8779595, -2.09159, -3.362361, 0.8666667, 1, 0, 1,
-0.876448, 0.8055233, 1.119756, 0.8588235, 1, 0, 1,
-0.8758821, 1.165871, -1.356776, 0.854902, 1, 0, 1,
-0.8714918, -0.9829713, -4.448083, 0.8470588, 1, 0, 1,
-0.8672888, 0.4817759, -0.7294884, 0.8431373, 1, 0, 1,
-0.8627056, 0.009159403, -2.99517, 0.8352941, 1, 0, 1,
-0.8626959, -0.2030945, -2.615951, 0.8313726, 1, 0, 1,
-0.8617002, -0.5988716, -1.97778, 0.8235294, 1, 0, 1,
-0.8598089, 0.5955288, -2.395498, 0.8196079, 1, 0, 1,
-0.8579288, 0.7987357, 0.5183531, 0.8117647, 1, 0, 1,
-0.8566435, 0.3286296, -2.069153, 0.8078431, 1, 0, 1,
-0.8550456, 0.5532192, -1.514212, 0.8, 1, 0, 1,
-0.8512626, 0.3757969, 0.1366377, 0.7921569, 1, 0, 1,
-0.8499496, -1.08964, -4.066497, 0.7882353, 1, 0, 1,
-0.8382643, 1.230511, -1.974461, 0.7803922, 1, 0, 1,
-0.8329141, -1.41637, -4.026642, 0.7764706, 1, 0, 1,
-0.8286548, 0.761246, -1.005026, 0.7686275, 1, 0, 1,
-0.8262811, -0.3731775, -2.051514, 0.7647059, 1, 0, 1,
-0.8245803, 0.3577036, -1.31672, 0.7568628, 1, 0, 1,
-0.8180698, -1.850957, -2.867492, 0.7529412, 1, 0, 1,
-0.816897, 1.955499, -1.951015, 0.7450981, 1, 0, 1,
-0.8158314, 1.423509, 0.466105, 0.7411765, 1, 0, 1,
-0.8150113, -0.7862888, -1.970625, 0.7333333, 1, 0, 1,
-0.8135306, 0.07618125, -0.2744399, 0.7294118, 1, 0, 1,
-0.8080992, -1.440496, -1.18387, 0.7215686, 1, 0, 1,
-0.8075376, 1.504515, 0.01529271, 0.7176471, 1, 0, 1,
-0.8062101, -1.288724, -2.975278, 0.7098039, 1, 0, 1,
-0.8051127, -1.512206, -1.946976, 0.7058824, 1, 0, 1,
-0.8043123, 0.7633656, -0.7832925, 0.6980392, 1, 0, 1,
-0.8021494, 0.880275, 0.441184, 0.6901961, 1, 0, 1,
-0.800082, -1.029961, -2.455936, 0.6862745, 1, 0, 1,
-0.7913588, 0.8044293, -1.21268, 0.6784314, 1, 0, 1,
-0.7911532, -1.371519, -0.295178, 0.6745098, 1, 0, 1,
-0.7889824, -0.4151333, -1.910505, 0.6666667, 1, 0, 1,
-0.7873379, -1.241184, -2.571703, 0.6627451, 1, 0, 1,
-0.7791495, -1.415302, -2.098581, 0.654902, 1, 0, 1,
-0.7753353, -0.7075762, -2.881031, 0.6509804, 1, 0, 1,
-0.7731163, 0.3885837, -2.01567, 0.6431373, 1, 0, 1,
-0.7728151, -0.2950695, -1.975865, 0.6392157, 1, 0, 1,
-0.7713152, -1.429678, -1.11138, 0.6313726, 1, 0, 1,
-0.7690089, -0.09070674, -2.118453, 0.627451, 1, 0, 1,
-0.7662631, 0.6600351, -1.618619, 0.6196079, 1, 0, 1,
-0.7651955, 0.1273829, -1.063539, 0.6156863, 1, 0, 1,
-0.7648225, 1.016495, -0.001209752, 0.6078432, 1, 0, 1,
-0.7624239, -0.6606195, -2.60117, 0.6039216, 1, 0, 1,
-0.7598426, -0.06595484, -3.650521, 0.5960785, 1, 0, 1,
-0.7576018, -0.3913372, -1.545687, 0.5882353, 1, 0, 1,
-0.7546105, -0.4767142, -1.534465, 0.5843138, 1, 0, 1,
-0.7504563, 0.1608751, -0.4215392, 0.5764706, 1, 0, 1,
-0.7474034, -0.6102223, -0.5735478, 0.572549, 1, 0, 1,
-0.745734, 0.01999014, -2.950743, 0.5647059, 1, 0, 1,
-0.7443482, -0.3018109, -1.490106, 0.5607843, 1, 0, 1,
-0.7423836, 0.6256332, -1.249145, 0.5529412, 1, 0, 1,
-0.7409622, -0.5813919, -2.50262, 0.5490196, 1, 0, 1,
-0.7358612, -0.09460712, -1.784694, 0.5411765, 1, 0, 1,
-0.7349012, -0.8739001, -1.417502, 0.5372549, 1, 0, 1,
-0.7268957, -1.800137, 0.4135295, 0.5294118, 1, 0, 1,
-0.7213497, 1.044997, -0.8300507, 0.5254902, 1, 0, 1,
-0.7147747, 2.081441, -0.7823664, 0.5176471, 1, 0, 1,
-0.714466, -0.5458717, -2.471774, 0.5137255, 1, 0, 1,
-0.7085528, -0.4151352, -3.660559, 0.5058824, 1, 0, 1,
-0.7080305, 1.187078, 1.015934, 0.5019608, 1, 0, 1,
-0.7077218, -0.7210312, -3.151525, 0.4941176, 1, 0, 1,
-0.7023741, -0.3984376, -3.509031, 0.4862745, 1, 0, 1,
-0.6980101, 0.6209272, -0.3711279, 0.4823529, 1, 0, 1,
-0.6976743, 1.21837, -1.203832, 0.4745098, 1, 0, 1,
-0.6973045, -0.1283136, -0.2385928, 0.4705882, 1, 0, 1,
-0.6942477, 0.06942444, -0.3042192, 0.4627451, 1, 0, 1,
-0.6872869, -0.3173627, -2.223838, 0.4588235, 1, 0, 1,
-0.6827372, 0.8167785, -0.6258526, 0.4509804, 1, 0, 1,
-0.6827215, -0.1345662, -1.421324, 0.4470588, 1, 0, 1,
-0.6713763, -1.045559, -2.469756, 0.4392157, 1, 0, 1,
-0.6710976, -0.4600099, -2.08342, 0.4352941, 1, 0, 1,
-0.6707476, -0.6497692, -2.711701, 0.427451, 1, 0, 1,
-0.6705877, 0.9730738, -0.849511, 0.4235294, 1, 0, 1,
-0.6697905, -0.6243562, -1.932211, 0.4156863, 1, 0, 1,
-0.6678643, -1.21612, -3.785247, 0.4117647, 1, 0, 1,
-0.6667998, 0.9068047, -1.069395, 0.4039216, 1, 0, 1,
-0.6653073, 0.1798423, -0.2448581, 0.3960784, 1, 0, 1,
-0.6626657, 0.7366233, 0.07586472, 0.3921569, 1, 0, 1,
-0.6614144, 0.404512, -1.885651, 0.3843137, 1, 0, 1,
-0.6557816, 2.409419, 0.6545243, 0.3803922, 1, 0, 1,
-0.6554613, 0.9498159, -0.6134125, 0.372549, 1, 0, 1,
-0.653758, -0.708473, -2.698256, 0.3686275, 1, 0, 1,
-0.6511883, 0.6700701, -2.199885, 0.3607843, 1, 0, 1,
-0.64942, -0.6653977, -2.19124, 0.3568628, 1, 0, 1,
-0.6485839, -0.3721815, -1.789833, 0.3490196, 1, 0, 1,
-0.6418903, 2.02111, -0.9106373, 0.345098, 1, 0, 1,
-0.6389046, -1.360813, -2.103487, 0.3372549, 1, 0, 1,
-0.637975, -1.338145, -2.580616, 0.3333333, 1, 0, 1,
-0.635226, 0.9791617, -0.4275373, 0.3254902, 1, 0, 1,
-0.6344829, 1.617209, -0.7338513, 0.3215686, 1, 0, 1,
-0.634445, 0.516858, -2.08357, 0.3137255, 1, 0, 1,
-0.6334373, 2.42078, -0.4128913, 0.3098039, 1, 0, 1,
-0.6328877, -2.337075, -2.824447, 0.3019608, 1, 0, 1,
-0.630724, -0.06746545, -0.1151714, 0.2941177, 1, 0, 1,
-0.6279368, -0.2755823, -1.981314, 0.2901961, 1, 0, 1,
-0.6250158, -0.5851412, -3.277033, 0.282353, 1, 0, 1,
-0.6171677, -0.4938019, -1.711386, 0.2784314, 1, 0, 1,
-0.6132244, 0.9860281, -1.335049, 0.2705882, 1, 0, 1,
-0.6097999, 0.5729085, -1.626573, 0.2666667, 1, 0, 1,
-0.6078783, -0.7360284, -3.054118, 0.2588235, 1, 0, 1,
-0.6076756, 1.874062, -1.802739, 0.254902, 1, 0, 1,
-0.6066003, 1.316343, 0.5856819, 0.2470588, 1, 0, 1,
-0.6025337, -1.827663, -1.756822, 0.2431373, 1, 0, 1,
-0.6022186, -1.136421, -4.063749, 0.2352941, 1, 0, 1,
-0.5999572, -1.35634, -2.098593, 0.2313726, 1, 0, 1,
-0.5980205, -0.4778886, -0.8543428, 0.2235294, 1, 0, 1,
-0.5941764, 0.7967758, 0.1448239, 0.2196078, 1, 0, 1,
-0.5940917, 1.214551, -0.2076646, 0.2117647, 1, 0, 1,
-0.5933551, -1.185962, -2.396613, 0.2078431, 1, 0, 1,
-0.5843067, 0.4363069, -1.326005, 0.2, 1, 0, 1,
-0.5815235, -0.7071876, -1.913434, 0.1921569, 1, 0, 1,
-0.5796709, -1.324093, -5.655867, 0.1882353, 1, 0, 1,
-0.5785546, 0.1035546, -2.682179, 0.1803922, 1, 0, 1,
-0.5756497, -3.082812, -3.450094, 0.1764706, 1, 0, 1,
-0.5730121, 0.9004947, 0.5462155, 0.1686275, 1, 0, 1,
-0.5719805, -0.8609913, -3.997458, 0.1647059, 1, 0, 1,
-0.5716871, -1.96151, -1.920164, 0.1568628, 1, 0, 1,
-0.5704835, -0.3322785, -0.4017039, 0.1529412, 1, 0, 1,
-0.5645085, 0.7410446, -1.99462, 0.145098, 1, 0, 1,
-0.5633109, -1.054504, -3.413089, 0.1411765, 1, 0, 1,
-0.5595472, 0.5670099, 1.227883, 0.1333333, 1, 0, 1,
-0.5547764, 0.9923469, -0.3464544, 0.1294118, 1, 0, 1,
-0.5546713, 1.788275, 0.3973163, 0.1215686, 1, 0, 1,
-0.5537857, -1.658035, -2.359551, 0.1176471, 1, 0, 1,
-0.552713, -0.05241376, -1.13217, 0.1098039, 1, 0, 1,
-0.5505075, 1.64695, -1.257853, 0.1058824, 1, 0, 1,
-0.5494614, -0.6668406, -1.615716, 0.09803922, 1, 0, 1,
-0.549444, 0.07955281, -2.087173, 0.09019608, 1, 0, 1,
-0.5481471, 1.120505, 0.5629428, 0.08627451, 1, 0, 1,
-0.5479994, -0.5223782, -2.951513, 0.07843138, 1, 0, 1,
-0.5460247, 0.330227, 0.02858556, 0.07450981, 1, 0, 1,
-0.5439574, 0.1969287, -0.5854992, 0.06666667, 1, 0, 1,
-0.5420495, -1.472055, -2.456344, 0.0627451, 1, 0, 1,
-0.5411596, 0.694867, -0.2905764, 0.05490196, 1, 0, 1,
-0.5278329, 0.6073584, -0.7717434, 0.05098039, 1, 0, 1,
-0.5229749, -1.072267, -2.464111, 0.04313726, 1, 0, 1,
-0.5210792, -0.1802986, -1.85683, 0.03921569, 1, 0, 1,
-0.5165792, -0.250374, -1.725435, 0.03137255, 1, 0, 1,
-0.5157397, -0.8646796, -2.781351, 0.02745098, 1, 0, 1,
-0.5099886, -0.5108855, -2.63982, 0.01960784, 1, 0, 1,
-0.5022236, 0.01274513, -3.148286, 0.01568628, 1, 0, 1,
-0.4966093, 0.4575581, -0.9127704, 0.007843138, 1, 0, 1,
-0.4947104, 0.7846453, -1.342047, 0.003921569, 1, 0, 1,
-0.4928643, -2.212003, -1.809934, 0, 1, 0.003921569, 1,
-0.4912035, 1.683066, 0.1319456, 0, 1, 0.01176471, 1,
-0.4887799, 0.599126, -1.046921, 0, 1, 0.01568628, 1,
-0.4801937, 1.345669, -0.1943994, 0, 1, 0.02352941, 1,
-0.4729043, 1.43615, 1.357514, 0, 1, 0.02745098, 1,
-0.4728059, -0.4599459, -2.414691, 0, 1, 0.03529412, 1,
-0.4684003, -0.3059341, -1.761191, 0, 1, 0.03921569, 1,
-0.4657265, -0.2096311, -0.6026133, 0, 1, 0.04705882, 1,
-0.4651623, 0.9357593, 1.343064, 0, 1, 0.05098039, 1,
-0.4645226, 0.372365, -0.4461005, 0, 1, 0.05882353, 1,
-0.4606462, -0.01444422, -0.4143325, 0, 1, 0.0627451, 1,
-0.4598609, 0.06575415, -1.208822, 0, 1, 0.07058824, 1,
-0.4594771, 0.5272557, -2.095698, 0, 1, 0.07450981, 1,
-0.4580931, -1.643759, -2.535003, 0, 1, 0.08235294, 1,
-0.4555464, 0.2778487, -0.9587188, 0, 1, 0.08627451, 1,
-0.4535951, -0.4245125, -2.703876, 0, 1, 0.09411765, 1,
-0.4516225, -1.502466, 0.06424466, 0, 1, 0.1019608, 1,
-0.4502604, -1.312126, -3.104781, 0, 1, 0.1058824, 1,
-0.4501654, -0.03431593, -0.4350331, 0, 1, 0.1137255, 1,
-0.4487535, -0.9134204, -4.545924, 0, 1, 0.1176471, 1,
-0.4483267, -1.936646, -2.702905, 0, 1, 0.1254902, 1,
-0.4450466, 0.06990553, 0.120108, 0, 1, 0.1294118, 1,
-0.441952, 0.1350602, -1.136231, 0, 1, 0.1372549, 1,
-0.4404873, -1.043038, -3.008489, 0, 1, 0.1411765, 1,
-0.4398369, -1.197821, -4.020991, 0, 1, 0.1490196, 1,
-0.4336045, -1.031537, -1.769715, 0, 1, 0.1529412, 1,
-0.428555, 1.214455, -1.187083, 0, 1, 0.1607843, 1,
-0.4280405, 0.05793459, 0.1821129, 0, 1, 0.1647059, 1,
-0.4279034, 0.8858618, 0.1556745, 0, 1, 0.172549, 1,
-0.4230298, -0.3188772, -1.322642, 0, 1, 0.1764706, 1,
-0.4197169, 0.2784393, -0.2356547, 0, 1, 0.1843137, 1,
-0.4153372, 1.264744, -0.4355523, 0, 1, 0.1882353, 1,
-0.4130046, -1.033449, -3.32086, 0, 1, 0.1960784, 1,
-0.4123494, 1.073354, -1.322397, 0, 1, 0.2039216, 1,
-0.4082112, 0.04791635, -1.06245, 0, 1, 0.2078431, 1,
-0.4066566, -0.742344, -3.844523, 0, 1, 0.2156863, 1,
-0.3959768, 0.4553367, -2.552854, 0, 1, 0.2196078, 1,
-0.393764, 0.6866563, -0.3632531, 0, 1, 0.227451, 1,
-0.3914441, -0.6693372, -2.180708, 0, 1, 0.2313726, 1,
-0.3811409, 0.1152487, -2.059746, 0, 1, 0.2392157, 1,
-0.3802681, -1.507608, -2.682853, 0, 1, 0.2431373, 1,
-0.3777914, -0.1920049, -2.169847, 0, 1, 0.2509804, 1,
-0.3721894, 1.360818, 0.8805143, 0, 1, 0.254902, 1,
-0.3719662, -0.6361002, -1.893917, 0, 1, 0.2627451, 1,
-0.3664246, -0.2633559, -3.075539, 0, 1, 0.2666667, 1,
-0.3653446, -1.229887, -3.340371, 0, 1, 0.2745098, 1,
-0.3640986, -0.6850057, -3.861691, 0, 1, 0.2784314, 1,
-0.3577577, -0.6749176, -3.168122, 0, 1, 0.2862745, 1,
-0.3506139, 0.1053356, -1.347088, 0, 1, 0.2901961, 1,
-0.3505816, -0.1206556, -1.134056, 0, 1, 0.2980392, 1,
-0.3481157, 1.034591, -2.490089, 0, 1, 0.3058824, 1,
-0.3467894, 0.3494644, 2.042172, 0, 1, 0.3098039, 1,
-0.341578, 0.0973447, -0.6924936, 0, 1, 0.3176471, 1,
-0.3358408, -1.737066, -2.21518, 0, 1, 0.3215686, 1,
-0.3336842, -0.3875914, -2.313467, 0, 1, 0.3294118, 1,
-0.3322105, 0.9937487, -1.042477, 0, 1, 0.3333333, 1,
-0.3320971, 0.6345278, -1.582706, 0, 1, 0.3411765, 1,
-0.3283391, 0.4364832, -2.189553, 0, 1, 0.345098, 1,
-0.3261063, 1.061547, 1.176616, 0, 1, 0.3529412, 1,
-0.3192346, -0.9463081, -3.055618, 0, 1, 0.3568628, 1,
-0.3188977, -1.329554, -2.642009, 0, 1, 0.3647059, 1,
-0.318436, -0.7076495, -2.318621, 0, 1, 0.3686275, 1,
-0.3111006, -0.3439452, -3.228903, 0, 1, 0.3764706, 1,
-0.307654, 0.5162604, -0.655553, 0, 1, 0.3803922, 1,
-0.3002209, -1.479708, -5.167838, 0, 1, 0.3882353, 1,
-0.2991312, -0.5922728, -4.065773, 0, 1, 0.3921569, 1,
-0.2979958, -0.03193972, -0.1886062, 0, 1, 0.4, 1,
-0.2975058, -0.07892642, -2.57292, 0, 1, 0.4078431, 1,
-0.2966183, 0.7938693, 0.7303763, 0, 1, 0.4117647, 1,
-0.2788661, -0.3122135, -3.868736, 0, 1, 0.4196078, 1,
-0.2775829, -0.6609238, -2.55143, 0, 1, 0.4235294, 1,
-0.2726949, 0.7441018, -0.5065946, 0, 1, 0.4313726, 1,
-0.2725646, -1.169282, -2.161783, 0, 1, 0.4352941, 1,
-0.2693832, -0.03648635, -4.510082, 0, 1, 0.4431373, 1,
-0.2613954, -0.07493406, -3.226175, 0, 1, 0.4470588, 1,
-0.2610623, 0.9178276, 0.26786, 0, 1, 0.454902, 1,
-0.2600512, -0.3483334, -3.430251, 0, 1, 0.4588235, 1,
-0.2561655, 0.1086795, -2.757699, 0, 1, 0.4666667, 1,
-0.249369, -0.3085927, -1.768346, 0, 1, 0.4705882, 1,
-0.2481387, 0.944721, -0.07822652, 0, 1, 0.4784314, 1,
-0.2395219, 0.5024175, 0.2841436, 0, 1, 0.4823529, 1,
-0.2367372, 1.328144, -0.2915673, 0, 1, 0.4901961, 1,
-0.2317754, -1.068819, -3.357291, 0, 1, 0.4941176, 1,
-0.2308106, -0.4276876, -2.204683, 0, 1, 0.5019608, 1,
-0.2279653, 0.1213335, -2.405205, 0, 1, 0.509804, 1,
-0.2249141, -1.797041, -1.297789, 0, 1, 0.5137255, 1,
-0.2245257, -0.763773, -3.06963, 0, 1, 0.5215687, 1,
-0.2230882, -0.4667547, -4.183855, 0, 1, 0.5254902, 1,
-0.217094, 1.717752, -1.035148, 0, 1, 0.5333334, 1,
-0.2152644, 0.1862179, -2.999471, 0, 1, 0.5372549, 1,
-0.2149227, -1.098528, -3.986825, 0, 1, 0.5450981, 1,
-0.2133947, -1.095573, -2.129701, 0, 1, 0.5490196, 1,
-0.2099886, 0.8833632, -0.750017, 0, 1, 0.5568628, 1,
-0.1924699, -2.443102, -3.223992, 0, 1, 0.5607843, 1,
-0.1904457, 0.5375922, -1.513737, 0, 1, 0.5686275, 1,
-0.1872471, -0.3370101, -2.929922, 0, 1, 0.572549, 1,
-0.1857006, 1.128994, -0.3353653, 0, 1, 0.5803922, 1,
-0.181893, -1.065572, -2.218571, 0, 1, 0.5843138, 1,
-0.1809494, -1.123701, -2.874088, 0, 1, 0.5921569, 1,
-0.1798534, -0.1996822, -1.109085, 0, 1, 0.5960785, 1,
-0.1788194, -0.6086803, -2.35266, 0, 1, 0.6039216, 1,
-0.1786146, 0.1176688, -0.6881422, 0, 1, 0.6117647, 1,
-0.174264, -0.3365325, -2.749883, 0, 1, 0.6156863, 1,
-0.1735333, 1.069277, 0.4860534, 0, 1, 0.6235294, 1,
-0.1717142, -1.768932, -2.850261, 0, 1, 0.627451, 1,
-0.1689902, -0.6003893, -2.334425, 0, 1, 0.6352941, 1,
-0.168229, 1.390638, 1.245226, 0, 1, 0.6392157, 1,
-0.1660179, 0.6518666, 1.347346, 0, 1, 0.6470588, 1,
-0.1615084, 0.4297741, 0.9547976, 0, 1, 0.6509804, 1,
-0.1598634, -1.587121, -2.491907, 0, 1, 0.6588235, 1,
-0.156452, -1.154777, -3.030235, 0, 1, 0.6627451, 1,
-0.1468642, 0.2570169, -0.3353787, 0, 1, 0.6705883, 1,
-0.140555, -0.1138305, -2.653885, 0, 1, 0.6745098, 1,
-0.1404215, -0.3765678, -2.698426, 0, 1, 0.682353, 1,
-0.138196, 0.08338426, -0.2493213, 0, 1, 0.6862745, 1,
-0.1376474, -0.9050373, -3.178546, 0, 1, 0.6941177, 1,
-0.1335102, -1.140114, -3.418704, 0, 1, 0.7019608, 1,
-0.1297218, 1.785344, -0.1774376, 0, 1, 0.7058824, 1,
-0.1215214, 0.7054896, 1.579271, 0, 1, 0.7137255, 1,
-0.1199526, 0.8044348, -0.2724179, 0, 1, 0.7176471, 1,
-0.1182521, 0.5240742, 0.5972151, 0, 1, 0.7254902, 1,
-0.1125511, 0.7418616, -0.02324053, 0, 1, 0.7294118, 1,
-0.1086362, -1.128431, -1.885467, 0, 1, 0.7372549, 1,
-0.1065843, -0.8706656, -2.690718, 0, 1, 0.7411765, 1,
-0.1014585, -0.9247115, -1.831517, 0, 1, 0.7490196, 1,
-0.09900995, 0.002940958, -1.689798, 0, 1, 0.7529412, 1,
-0.09218337, 1.730154, -0.1139743, 0, 1, 0.7607843, 1,
-0.08541679, -1.399877, -2.45975, 0, 1, 0.7647059, 1,
-0.080005, -0.6951548, -2.733767, 0, 1, 0.772549, 1,
-0.07931948, -0.3416602, -2.625619, 0, 1, 0.7764706, 1,
-0.07807735, -0.9849614, -2.5492, 0, 1, 0.7843137, 1,
-0.07688172, -0.5551235, -0.9369246, 0, 1, 0.7882353, 1,
-0.07657405, 1.856526, -0.1269397, 0, 1, 0.7960784, 1,
-0.07412986, -0.09843825, -1.95372, 0, 1, 0.8039216, 1,
-0.07033947, -0.7343453, -2.761362, 0, 1, 0.8078431, 1,
-0.06973459, 2.121332, -0.3462679, 0, 1, 0.8156863, 1,
-0.06212146, -0.2185198, -1.613053, 0, 1, 0.8196079, 1,
-0.06210649, 0.3691028, -0.2853887, 0, 1, 0.827451, 1,
-0.05902292, -1.096022, -2.388039, 0, 1, 0.8313726, 1,
-0.05361819, 0.1476879, 0.6892631, 0, 1, 0.8392157, 1,
-0.05250649, -1.210895, -2.770757, 0, 1, 0.8431373, 1,
-0.05207765, -0.4692659, -1.956617, 0, 1, 0.8509804, 1,
-0.05126936, 1.153513, -0.3043671, 0, 1, 0.854902, 1,
-0.04811503, 0.2161678, -0.5248321, 0, 1, 0.8627451, 1,
-0.03815737, -0.158009, -2.518347, 0, 1, 0.8666667, 1,
-0.03577401, -1.288976, -4.128946, 0, 1, 0.8745098, 1,
-0.03408045, 0.3318309, -1.170217, 0, 1, 0.8784314, 1,
-0.03168435, 0.6655208, 2.096499, 0, 1, 0.8862745, 1,
-0.03111102, -0.6143505, -3.793991, 0, 1, 0.8901961, 1,
-0.03082717, 2.564451, -0.8957092, 0, 1, 0.8980392, 1,
-0.02973172, 1.373731, -0.8102386, 0, 1, 0.9058824, 1,
-0.02850358, -0.7005765, -2.750588, 0, 1, 0.9098039, 1,
-0.0283999, -1.890521, -2.45371, 0, 1, 0.9176471, 1,
-0.02114285, 0.6391143, 0.7803043, 0, 1, 0.9215686, 1,
-0.02068113, 0.5280449, -0.2228814, 0, 1, 0.9294118, 1,
-0.01670529, 1.160795, -0.4782209, 0, 1, 0.9333333, 1,
-0.01306536, 0.5404173, -0.8158834, 0, 1, 0.9411765, 1,
-0.001651948, 1.394848, 0.2144292, 0, 1, 0.945098, 1,
0.0002048179, -0.2825599, 3.947627, 0, 1, 0.9529412, 1,
0.0003222055, 0.7948598, 0.4977525, 0, 1, 0.9568627, 1,
0.001396152, -0.9520071, 3.607077, 0, 1, 0.9647059, 1,
0.003627622, 0.1893559, -0.8052691, 0, 1, 0.9686275, 1,
0.004640368, -0.1853663, 4.331094, 0, 1, 0.9764706, 1,
0.008022556, -1.054618, 5.061026, 0, 1, 0.9803922, 1,
0.01087232, -1.199257, 0.9075678, 0, 1, 0.9882353, 1,
0.01527548, 0.8073385, 0.2221389, 0, 1, 0.9921569, 1,
0.01763926, -0.5355053, 1.8045, 0, 1, 1, 1,
0.01788928, -1.011724, 2.949992, 0, 0.9921569, 1, 1,
0.01910817, -0.7213014, 4.452793, 0, 0.9882353, 1, 1,
0.02011081, 0.2934447, -1.372004, 0, 0.9803922, 1, 1,
0.02066106, 0.6721845, 0.298692, 0, 0.9764706, 1, 1,
0.02500434, -0.1879416, 2.511631, 0, 0.9686275, 1, 1,
0.02690158, 1.170818, -0.1427895, 0, 0.9647059, 1, 1,
0.02907978, 0.2983131, -0.3131222, 0, 0.9568627, 1, 1,
0.02945958, 0.5630594, -1.768356, 0, 0.9529412, 1, 1,
0.0300977, 0.6528651, -0.2101913, 0, 0.945098, 1, 1,
0.03191781, 0.03026394, 1.472965, 0, 0.9411765, 1, 1,
0.033113, 1.619282, -0.7291467, 0, 0.9333333, 1, 1,
0.04199815, 1.617506, -1.049524, 0, 0.9294118, 1, 1,
0.04380943, 0.07002764, 3.110323, 0, 0.9215686, 1, 1,
0.0468553, 0.546086, -1.095217, 0, 0.9176471, 1, 1,
0.04703911, 1.267043, 0.8141584, 0, 0.9098039, 1, 1,
0.04974457, 0.1486869, 0.3577473, 0, 0.9058824, 1, 1,
0.05225732, -1.858746, 3.591854, 0, 0.8980392, 1, 1,
0.05905567, 0.4655156, 1.783486, 0, 0.8901961, 1, 1,
0.06019907, -0.01833739, 2.500153, 0, 0.8862745, 1, 1,
0.06119388, 2.195665, 0.107362, 0, 0.8784314, 1, 1,
0.06183252, -1.625592, 3.189469, 0, 0.8745098, 1, 1,
0.06578863, 0.5681443, -0.03764104, 0, 0.8666667, 1, 1,
0.07412396, 0.259378, 1.349303, 0, 0.8627451, 1, 1,
0.08008564, 2.188845, -1.254756, 0, 0.854902, 1, 1,
0.08302371, 0.9960887, -0.3985019, 0, 0.8509804, 1, 1,
0.08501109, -1.576115, 2.267112, 0, 0.8431373, 1, 1,
0.08904216, -0.208982, 1.771564, 0, 0.8392157, 1, 1,
0.09082724, -1.212162, 2.443304, 0, 0.8313726, 1, 1,
0.09219017, -0.7257748, 2.744411, 0, 0.827451, 1, 1,
0.09341823, -1.022657, 2.653044, 0, 0.8196079, 1, 1,
0.1017604, 2.324489, -1.280441, 0, 0.8156863, 1, 1,
0.1075779, -0.5457937, 4.124611, 0, 0.8078431, 1, 1,
0.1080213, -0.07724839, 2.888328, 0, 0.8039216, 1, 1,
0.1154421, 0.1998107, 0.9283198, 0, 0.7960784, 1, 1,
0.1163774, 0.1382062, 2.240183, 0, 0.7882353, 1, 1,
0.1168463, -0.990311, 1.155503, 0, 0.7843137, 1, 1,
0.1188588, 0.006903958, 2.051433, 0, 0.7764706, 1, 1,
0.12082, 0.7952819, -1.957522, 0, 0.772549, 1, 1,
0.120852, 0.3992447, 1.219634, 0, 0.7647059, 1, 1,
0.1210231, -0.04600953, 0.8432881, 0, 0.7607843, 1, 1,
0.1221014, 0.2266409, 0.4565545, 0, 0.7529412, 1, 1,
0.1244482, 0.437871, -0.8286493, 0, 0.7490196, 1, 1,
0.1248887, -0.2978899, 1.800044, 0, 0.7411765, 1, 1,
0.1251772, 0.3548847, -0.1234991, 0, 0.7372549, 1, 1,
0.1282804, -0.6344249, 2.756115, 0, 0.7294118, 1, 1,
0.1287533, 0.6449745, 0.283987, 0, 0.7254902, 1, 1,
0.1305441, 0.9711094, 0.8790804, 0, 0.7176471, 1, 1,
0.1365985, -0.4183044, 2.111393, 0, 0.7137255, 1, 1,
0.1385173, 0.100622, -0.07270899, 0, 0.7058824, 1, 1,
0.1395944, -0.5866364, 2.803299, 0, 0.6980392, 1, 1,
0.1411619, 0.8139746, 0.8852154, 0, 0.6941177, 1, 1,
0.1424861, -0.03419574, 2.264108, 0, 0.6862745, 1, 1,
0.1430067, 0.009180036, 3.072263, 0, 0.682353, 1, 1,
0.1456841, 0.1081577, -0.2309143, 0, 0.6745098, 1, 1,
0.1474313, -0.7341323, 3.420006, 0, 0.6705883, 1, 1,
0.1486811, -0.7581986, 2.644321, 0, 0.6627451, 1, 1,
0.1493507, -1.587665, 2.742323, 0, 0.6588235, 1, 1,
0.1502088, -0.8494408, 2.345028, 0, 0.6509804, 1, 1,
0.1505647, 0.6409733, -0.1100441, 0, 0.6470588, 1, 1,
0.1533004, 0.306219, -1.322321, 0, 0.6392157, 1, 1,
0.1538346, 1.447886, 0.001476079, 0, 0.6352941, 1, 1,
0.1588502, -0.5136049, 2.283108, 0, 0.627451, 1, 1,
0.1633291, 0.9192059, 1.355924, 0, 0.6235294, 1, 1,
0.1646046, -0.1794624, 3.136818, 0, 0.6156863, 1, 1,
0.1656479, 0.1646125, -0.3159545, 0, 0.6117647, 1, 1,
0.1675904, -0.4809073, 2.943501, 0, 0.6039216, 1, 1,
0.1762484, 2.088242, -0.6094786, 0, 0.5960785, 1, 1,
0.1792551, 0.9528948, -0.002726301, 0, 0.5921569, 1, 1,
0.1808975, 0.03896183, 0.5855584, 0, 0.5843138, 1, 1,
0.181899, 1.218783, 1.592719, 0, 0.5803922, 1, 1,
0.1823163, 1.108509, 1.830389, 0, 0.572549, 1, 1,
0.1895331, 0.9171735, 1.137936, 0, 0.5686275, 1, 1,
0.1917707, 1.596646, 0.4763013, 0, 0.5607843, 1, 1,
0.1935103, -0.9626521, 2.490846, 0, 0.5568628, 1, 1,
0.1983138, 1.252548, -0.2376793, 0, 0.5490196, 1, 1,
0.206807, -1.31001, 2.218729, 0, 0.5450981, 1, 1,
0.2102858, 1.604246, 0.7470856, 0, 0.5372549, 1, 1,
0.2154948, -0.5307769, 3.764352, 0, 0.5333334, 1, 1,
0.2159643, -1.497206, 3.564815, 0, 0.5254902, 1, 1,
0.2162238, 0.04792162, 1.153876, 0, 0.5215687, 1, 1,
0.2200926, -2.112468, 3.969757, 0, 0.5137255, 1, 1,
0.2210734, 0.5794907, -1.419205, 0, 0.509804, 1, 1,
0.2213869, 0.7552355, 0.1639246, 0, 0.5019608, 1, 1,
0.2217691, -1.20096, 2.416348, 0, 0.4941176, 1, 1,
0.2238293, -0.3911547, 3.485633, 0, 0.4901961, 1, 1,
0.2250195, -0.7203078, 1.750273, 0, 0.4823529, 1, 1,
0.2304227, 2.013529, 0.07503172, 0, 0.4784314, 1, 1,
0.2323298, 0.6044006, 1.901457, 0, 0.4705882, 1, 1,
0.2330743, 0.2042422, 0.7003648, 0, 0.4666667, 1, 1,
0.2357737, -1.146553, 2.923963, 0, 0.4588235, 1, 1,
0.2373657, -0.5160843, 1.680777, 0, 0.454902, 1, 1,
0.2420713, -0.6340497, 0.7719158, 0, 0.4470588, 1, 1,
0.2427513, 0.484902, 1.996074, 0, 0.4431373, 1, 1,
0.2451236, 0.9490092, 0.2194409, 0, 0.4352941, 1, 1,
0.2497936, 1.368559, 0.227099, 0, 0.4313726, 1, 1,
0.2530058, 1.471313, -1.453385, 0, 0.4235294, 1, 1,
0.2531731, 0.4806592, 0.9054424, 0, 0.4196078, 1, 1,
0.259624, -0.8915354, 3.361923, 0, 0.4117647, 1, 1,
0.2609064, 0.5972478, 0.1864868, 0, 0.4078431, 1, 1,
0.2640022, -1.241958, 4.736436, 0, 0.4, 1, 1,
0.26445, 0.5292005, -0.03038212, 0, 0.3921569, 1, 1,
0.2688137, 1.658744, 0.7630891, 0, 0.3882353, 1, 1,
0.2705816, -0.2786252, 2.147836, 0, 0.3803922, 1, 1,
0.2792079, -0.3328834, 2.609214, 0, 0.3764706, 1, 1,
0.2815656, 1.038232, 0.9246061, 0, 0.3686275, 1, 1,
0.283251, 0.1680916, 1.055479, 0, 0.3647059, 1, 1,
0.2844166, -0.1515484, 1.149843, 0, 0.3568628, 1, 1,
0.2851463, -0.5904656, 3.160386, 0, 0.3529412, 1, 1,
0.2877888, 0.09204789, 2.41145, 0, 0.345098, 1, 1,
0.2905397, 0.6852595, 1.173083, 0, 0.3411765, 1, 1,
0.2916428, 1.731461, 0.4442367, 0, 0.3333333, 1, 1,
0.29394, 0.5556594, -0.7357267, 0, 0.3294118, 1, 1,
0.2956429, -0.1289922, -0.3279538, 0, 0.3215686, 1, 1,
0.2995462, -0.337145, 3.234654, 0, 0.3176471, 1, 1,
0.3104056, -1.133407, 2.67807, 0, 0.3098039, 1, 1,
0.3128065, -0.3007894, 4.315743, 0, 0.3058824, 1, 1,
0.3145472, -0.1849457, 3.539077, 0, 0.2980392, 1, 1,
0.3149072, -1.769143, 3.270691, 0, 0.2901961, 1, 1,
0.3165747, 0.4692298, -0.2649185, 0, 0.2862745, 1, 1,
0.3206125, 2.109103, -0.4855868, 0, 0.2784314, 1, 1,
0.3210693, -0.8925061, 3.344291, 0, 0.2745098, 1, 1,
0.3316086, -0.4719933, 2.761333, 0, 0.2666667, 1, 1,
0.3405493, -0.7439608, 2.330652, 0, 0.2627451, 1, 1,
0.3421367, -0.2763737, 3.049743, 0, 0.254902, 1, 1,
0.3440327, -0.07947029, 1.785317, 0, 0.2509804, 1, 1,
0.3454372, 0.6381772, -0.8667101, 0, 0.2431373, 1, 1,
0.3477465, -0.618952, 3.777127, 0, 0.2392157, 1, 1,
0.3491615, 0.06400397, 0.9336141, 0, 0.2313726, 1, 1,
0.3516432, -1.451561, 1.426296, 0, 0.227451, 1, 1,
0.3540705, -0.3100784, 4.14973, 0, 0.2196078, 1, 1,
0.3552389, 0.3112437, 1.08345, 0, 0.2156863, 1, 1,
0.3621799, 0.2586907, 3.220391, 0, 0.2078431, 1, 1,
0.3642262, -1.053532, 3.551253, 0, 0.2039216, 1, 1,
0.3643371, 0.3120448, -0.4938068, 0, 0.1960784, 1, 1,
0.3677289, -0.691987, 3.215389, 0, 0.1882353, 1, 1,
0.3693651, 1.251586, -0.3894146, 0, 0.1843137, 1, 1,
0.371028, 0.001053618, 0.6903715, 0, 0.1764706, 1, 1,
0.3718552, -0.9936561, 1.682753, 0, 0.172549, 1, 1,
0.3763284, 1.889452, 2.208805, 0, 0.1647059, 1, 1,
0.3764299, -0.07656848, 2.040291, 0, 0.1607843, 1, 1,
0.3830009, -0.04395047, 0.5559293, 0, 0.1529412, 1, 1,
0.3863252, 0.240652, 1.873439, 0, 0.1490196, 1, 1,
0.3867413, 0.9775275, -0.3109031, 0, 0.1411765, 1, 1,
0.3900777, -1.254691, 4.052676, 0, 0.1372549, 1, 1,
0.3904814, 0.7007843, 1.173749, 0, 0.1294118, 1, 1,
0.3921013, -0.3366178, 0.9569414, 0, 0.1254902, 1, 1,
0.3998097, 0.8311467, 1.132409, 0, 0.1176471, 1, 1,
0.4032013, 0.7883008, 1.205892, 0, 0.1137255, 1, 1,
0.406736, 1.355424, 1.377843, 0, 0.1058824, 1, 1,
0.4123021, 0.07600146, 2.075202, 0, 0.09803922, 1, 1,
0.4193399, 0.2427498, 0.1542281, 0, 0.09411765, 1, 1,
0.4196077, 1.260417, 0.7396435, 0, 0.08627451, 1, 1,
0.4244683, 0.153675, 2.315676, 0, 0.08235294, 1, 1,
0.4256113, 0.1965334, 1.35466, 0, 0.07450981, 1, 1,
0.4270885, 2.495419, -0.7208599, 0, 0.07058824, 1, 1,
0.4275247, 0.0833205, 2.442006, 0, 0.0627451, 1, 1,
0.4300513, 0.3492289, 0.644979, 0, 0.05882353, 1, 1,
0.4307571, 0.6738134, 0.1173007, 0, 0.05098039, 1, 1,
0.4319618, 1.797469, 0.2479308, 0, 0.04705882, 1, 1,
0.4324356, -0.6386313, 4.069842, 0, 0.03921569, 1, 1,
0.43367, 0.9159547, 1.245118, 0, 0.03529412, 1, 1,
0.4358961, 0.7683874, -0.3396763, 0, 0.02745098, 1, 1,
0.4395601, 0.8641555, 0.3063743, 0, 0.02352941, 1, 1,
0.4418013, 0.4577762, -0.5788529, 0, 0.01568628, 1, 1,
0.4448064, -0.8922679, 2.388615, 0, 0.01176471, 1, 1,
0.4480096, 1.49237, -1.440258, 0, 0.003921569, 1, 1,
0.4547199, -0.9442765, 3.340709, 0.003921569, 0, 1, 1,
0.4563233, 0.9173016, 0.5274249, 0.007843138, 0, 1, 1,
0.4673288, -0.4683281, 2.101269, 0.01568628, 0, 1, 1,
0.4675594, 1.502265, 0.4578741, 0.01960784, 0, 1, 1,
0.469256, 0.7596949, -0.5119988, 0.02745098, 0, 1, 1,
0.4734726, 1.480521, -0.3596421, 0.03137255, 0, 1, 1,
0.4782268, 0.2620207, -0.9157175, 0.03921569, 0, 1, 1,
0.4792635, -0.05616377, 2.219974, 0.04313726, 0, 1, 1,
0.4797347, 0.1591743, -1.198471, 0.05098039, 0, 1, 1,
0.4833794, -0.2558702, 2.013682, 0.05490196, 0, 1, 1,
0.4873749, 1.092265, 1.139648, 0.0627451, 0, 1, 1,
0.4887185, -0.8348012, 3.818637, 0.06666667, 0, 1, 1,
0.4942333, -0.8688117, 2.091008, 0.07450981, 0, 1, 1,
0.4942491, -2.042216, 3.991152, 0.07843138, 0, 1, 1,
0.4981116, -0.6043613, 2.966992, 0.08627451, 0, 1, 1,
0.498536, 0.07320977, 0.1472504, 0.09019608, 0, 1, 1,
0.498826, -1.131064, 1.289544, 0.09803922, 0, 1, 1,
0.5052615, -0.1526803, 2.041795, 0.1058824, 0, 1, 1,
0.5078105, -0.3980476, 0.939961, 0.1098039, 0, 1, 1,
0.5132113, -1.712631, 1.647017, 0.1176471, 0, 1, 1,
0.5158879, -0.3152682, 4.140896, 0.1215686, 0, 1, 1,
0.5164918, -0.004971503, 2.932788, 0.1294118, 0, 1, 1,
0.517511, 1.271424, 0.977991, 0.1333333, 0, 1, 1,
0.5219303, 0.4839972, 2.612353, 0.1411765, 0, 1, 1,
0.5220532, 0.541379, 1.269483, 0.145098, 0, 1, 1,
0.5224176, -0.9201753, 2.888168, 0.1529412, 0, 1, 1,
0.5290353, -1.549568, 3.398915, 0.1568628, 0, 1, 1,
0.5332003, 1.141798, 0.7898476, 0.1647059, 0, 1, 1,
0.5389593, -0.1829385, 2.656644, 0.1686275, 0, 1, 1,
0.5428759, 0.04541186, 1.465375, 0.1764706, 0, 1, 1,
0.5435846, -0.2019096, 1.129042, 0.1803922, 0, 1, 1,
0.5436559, 0.9140072, 1.363624, 0.1882353, 0, 1, 1,
0.547388, -0.4112687, 3.115855, 0.1921569, 0, 1, 1,
0.5490471, 0.6206089, 1.467186, 0.2, 0, 1, 1,
0.5491568, -0.5562627, 3.531435, 0.2078431, 0, 1, 1,
0.5503877, 0.4365456, 0.006575424, 0.2117647, 0, 1, 1,
0.5512067, 0.154352, 3.044882, 0.2196078, 0, 1, 1,
0.5531688, 1.121574, -0.2521553, 0.2235294, 0, 1, 1,
0.554421, 1.966625, 0.7900559, 0.2313726, 0, 1, 1,
0.5600033, -0.705506, 2.46947, 0.2352941, 0, 1, 1,
0.5611238, -1.44719, 1.567906, 0.2431373, 0, 1, 1,
0.5638673, 0.8836458, -0.4231768, 0.2470588, 0, 1, 1,
0.5650459, -1.494146, 1.344911, 0.254902, 0, 1, 1,
0.5672798, -0.5440531, 1.704285, 0.2588235, 0, 1, 1,
0.5680506, 1.531887, -1.210329, 0.2666667, 0, 1, 1,
0.5703526, -0.09462837, 2.691549, 0.2705882, 0, 1, 1,
0.5827818, 0.6462285, 0.8198271, 0.2784314, 0, 1, 1,
0.582949, 0.2002242, 1.844682, 0.282353, 0, 1, 1,
0.584324, 1.497996, 0.5112213, 0.2901961, 0, 1, 1,
0.5846455, 0.3448422, 2.69632, 0.2941177, 0, 1, 1,
0.585645, -1.127327, 1.521512, 0.3019608, 0, 1, 1,
0.5865604, -0.3785138, 2.278288, 0.3098039, 0, 1, 1,
0.5903593, 0.241194, 2.841098, 0.3137255, 0, 1, 1,
0.5910514, -2.735725, 2.92733, 0.3215686, 0, 1, 1,
0.5973741, -0.5879613, 1.956643, 0.3254902, 0, 1, 1,
0.6052648, -0.951901, 4.806362, 0.3333333, 0, 1, 1,
0.6089057, -1.262559, 3.046015, 0.3372549, 0, 1, 1,
0.6122608, 0.7057648, 0.665022, 0.345098, 0, 1, 1,
0.6263561, -2.194726, 3.098669, 0.3490196, 0, 1, 1,
0.6299782, 0.714, 1.141773, 0.3568628, 0, 1, 1,
0.6334044, 0.5591911, 1.689752, 0.3607843, 0, 1, 1,
0.6334845, 1.25895, 0.08308078, 0.3686275, 0, 1, 1,
0.6352726, 0.06330421, 1.511076, 0.372549, 0, 1, 1,
0.6394356, 0.8719485, -0.7798784, 0.3803922, 0, 1, 1,
0.6436995, -0.9753326, 0.220954, 0.3843137, 0, 1, 1,
0.6439314, -2.133169, 1.680456, 0.3921569, 0, 1, 1,
0.6461504, -0.737978, 3.599458, 0.3960784, 0, 1, 1,
0.6498725, 0.006194323, 1.132668, 0.4039216, 0, 1, 1,
0.6501521, 1.278531, -1.127527, 0.4117647, 0, 1, 1,
0.6524879, -0.4481758, 3.232232, 0.4156863, 0, 1, 1,
0.6537522, 0.09491895, 0.3777413, 0.4235294, 0, 1, 1,
0.6539448, 1.223312, -0.1227774, 0.427451, 0, 1, 1,
0.658966, -0.5693345, 4.229677, 0.4352941, 0, 1, 1,
0.6616391, -2.199856, 3.52565, 0.4392157, 0, 1, 1,
0.6673918, 0.7853155, -0.8418019, 0.4470588, 0, 1, 1,
0.6698213, -0.8429726, 0.6336951, 0.4509804, 0, 1, 1,
0.6753268, 0.8990457, 1.119898, 0.4588235, 0, 1, 1,
0.6805662, -0.4543355, 1.967211, 0.4627451, 0, 1, 1,
0.6836403, -0.5398758, 1.009211, 0.4705882, 0, 1, 1,
0.6840572, 0.5030187, 1.256108, 0.4745098, 0, 1, 1,
0.6846588, -1.795702, 4.746619, 0.4823529, 0, 1, 1,
0.6854771, 1.451456, 3.272502, 0.4862745, 0, 1, 1,
0.6866189, 0.4758173, 0.7795893, 0.4941176, 0, 1, 1,
0.6894929, 0.4059239, -0.1233767, 0.5019608, 0, 1, 1,
0.6901541, -0.8156847, 2.219054, 0.5058824, 0, 1, 1,
0.6929232, -1.810262, 2.417806, 0.5137255, 0, 1, 1,
0.6939513, 0.4205628, 0.9585336, 0.5176471, 0, 1, 1,
0.7049305, 0.7000353, 0.07676569, 0.5254902, 0, 1, 1,
0.7064023, 0.9766799, 1.867409, 0.5294118, 0, 1, 1,
0.7078109, 1.235497, -1.287189, 0.5372549, 0, 1, 1,
0.7100442, -0.506893, 2.521563, 0.5411765, 0, 1, 1,
0.7129591, 1.082463, 0.4486359, 0.5490196, 0, 1, 1,
0.7130258, 1.542391, 0.2400474, 0.5529412, 0, 1, 1,
0.7148498, -2.755683, 1.262037, 0.5607843, 0, 1, 1,
0.7154232, 1.049172, 0.1882724, 0.5647059, 0, 1, 1,
0.7184942, 1.158898, 0.6695493, 0.572549, 0, 1, 1,
0.7207026, -0.8864143, 2.294196, 0.5764706, 0, 1, 1,
0.7274926, 1.523823, 2.260459, 0.5843138, 0, 1, 1,
0.7276834, 0.4965411, 1.168881, 0.5882353, 0, 1, 1,
0.731379, 0.1813141, 0.8407215, 0.5960785, 0, 1, 1,
0.7350399, 1.27625, 1.102252, 0.6039216, 0, 1, 1,
0.7368997, -0.5936878, 0.1840073, 0.6078432, 0, 1, 1,
0.7428288, 0.9929526, 1.384089, 0.6156863, 0, 1, 1,
0.7451191, 0.5060634, 2.021788, 0.6196079, 0, 1, 1,
0.7511653, 1.468989, -0.2175385, 0.627451, 0, 1, 1,
0.756963, 2.473787, 1.007659, 0.6313726, 0, 1, 1,
0.7570734, 1.145722, 0.04156608, 0.6392157, 0, 1, 1,
0.757517, 0.3926491, 0.8214965, 0.6431373, 0, 1, 1,
0.7583024, 1.414415, -0.6307862, 0.6509804, 0, 1, 1,
0.7611037, -0.2322772, 1.886196, 0.654902, 0, 1, 1,
0.7614264, -1.77897, 4.068503, 0.6627451, 0, 1, 1,
0.7660639, 0.7778001, 1.457388, 0.6666667, 0, 1, 1,
0.7662338, -0.9434286, 2.627073, 0.6745098, 0, 1, 1,
0.7664735, -0.2333886, 2.203592, 0.6784314, 0, 1, 1,
0.7693284, -1.066611, 2.654776, 0.6862745, 0, 1, 1,
0.771817, -0.181483, 2.565112, 0.6901961, 0, 1, 1,
0.7724125, -0.8878352, 0.8885743, 0.6980392, 0, 1, 1,
0.7724915, -1.493366, 3.121018, 0.7058824, 0, 1, 1,
0.7757404, -0.6702091, 2.674895, 0.7098039, 0, 1, 1,
0.7826504, -0.2412603, 0.4475495, 0.7176471, 0, 1, 1,
0.7884747, -0.8158885, 2.255397, 0.7215686, 0, 1, 1,
0.7887757, 0.3567427, 1.276992, 0.7294118, 0, 1, 1,
0.7908452, 0.9124564, -0.2937444, 0.7333333, 0, 1, 1,
0.793287, -2.030233, 2.695459, 0.7411765, 0, 1, 1,
0.7941688, 0.4458321, -1.137811, 0.7450981, 0, 1, 1,
0.8026866, 0.4544748, 0.1461157, 0.7529412, 0, 1, 1,
0.809019, -0.3167413, 0.9243506, 0.7568628, 0, 1, 1,
0.8092797, 1.709153, -0.02278085, 0.7647059, 0, 1, 1,
0.8267485, -2.024037, 1.320847, 0.7686275, 0, 1, 1,
0.8294675, 0.9607511, 1.560169, 0.7764706, 0, 1, 1,
0.8299417, 0.04721413, 3.384045, 0.7803922, 0, 1, 1,
0.8330779, 0.354336, 1.38126, 0.7882353, 0, 1, 1,
0.8330801, 0.3339448, 2.519337, 0.7921569, 0, 1, 1,
0.833513, 1.079564, 1.219603, 0.8, 0, 1, 1,
0.8401596, 0.1747707, 2.794033, 0.8078431, 0, 1, 1,
0.8424628, 0.5002435, 1.256198, 0.8117647, 0, 1, 1,
0.8486843, 0.3735573, 1.293735, 0.8196079, 0, 1, 1,
0.850403, -0.3986959, 3.522326, 0.8235294, 0, 1, 1,
0.8549629, -1.563559, 3.973187, 0.8313726, 0, 1, 1,
0.8571769, -0.2166938, 3.673796, 0.8352941, 0, 1, 1,
0.8582771, -0.7168408, 3.382822, 0.8431373, 0, 1, 1,
0.8605982, -1.947557, 3.578819, 0.8470588, 0, 1, 1,
0.8610575, 0.2247937, 1.135906, 0.854902, 0, 1, 1,
0.8616452, -0.1583049, 1.854357, 0.8588235, 0, 1, 1,
0.8657807, 0.3438288, -0.6905053, 0.8666667, 0, 1, 1,
0.8730634, 0.05352543, 0.8569248, 0.8705882, 0, 1, 1,
0.8836406, 1.769505, 0.9951729, 0.8784314, 0, 1, 1,
0.8852241, 0.04968468, 0.2101524, 0.8823529, 0, 1, 1,
0.8883848, 0.8471765, 1.362484, 0.8901961, 0, 1, 1,
0.8894652, 1.08355, -0.1438156, 0.8941177, 0, 1, 1,
0.9068256, -0.2946217, 3.237686, 0.9019608, 0, 1, 1,
0.9146843, -0.2822067, 1.87217, 0.9098039, 0, 1, 1,
0.9158552, -0.3600985, 3.120403, 0.9137255, 0, 1, 1,
0.9165542, 0.6485639, 1.073094, 0.9215686, 0, 1, 1,
0.9209532, 0.7570645, 0.2680904, 0.9254902, 0, 1, 1,
0.9232947, 0.7332948, -0.8260448, 0.9333333, 0, 1, 1,
0.9308048, 1.1328, 0.8938353, 0.9372549, 0, 1, 1,
0.9360713, -0.0445322, 2.316881, 0.945098, 0, 1, 1,
0.9435237, -1.152456, 2.447083, 0.9490196, 0, 1, 1,
0.944292, -0.6795107, 2.919028, 0.9568627, 0, 1, 1,
0.9528498, 0.7764493, 0.8221301, 0.9607843, 0, 1, 1,
0.9571418, 0.3318898, 1.770805, 0.9686275, 0, 1, 1,
0.9608944, -0.9677843, 1.72466, 0.972549, 0, 1, 1,
0.9727051, -0.3221281, 0.5609354, 0.9803922, 0, 1, 1,
0.9882519, 0.6810476, 1.684703, 0.9843137, 0, 1, 1,
0.9932123, 0.8107751, 0.6436563, 0.9921569, 0, 1, 1,
1.000989, -0.5255187, 2.810309, 0.9960784, 0, 1, 1,
1.019278, -1.192215, 3.197689, 1, 0, 0.9960784, 1,
1.021618, 1.214389, 0.4344084, 1, 0, 0.9882353, 1,
1.024358, 0.4670269, 1.460506, 1, 0, 0.9843137, 1,
1.02768, -0.3393726, 2.167683, 1, 0, 0.9764706, 1,
1.031192, 0.9158291, 1.98929, 1, 0, 0.972549, 1,
1.042204, -0.829128, 2.574802, 1, 0, 0.9647059, 1,
1.042511, -0.9289646, 1.622517, 1, 0, 0.9607843, 1,
1.043364, -0.1636281, 0.7096704, 1, 0, 0.9529412, 1,
1.048482, 0.5486194, 0.1334669, 1, 0, 0.9490196, 1,
1.049432, 0.7038226, -1.188426, 1, 0, 0.9411765, 1,
1.052143, 1.403091, -0.3895066, 1, 0, 0.9372549, 1,
1.058787, 0.02854635, -0.9976732, 1, 0, 0.9294118, 1,
1.061539, 0.3790888, 2.082237, 1, 0, 0.9254902, 1,
1.070249, 1.51124, 1.003516, 1, 0, 0.9176471, 1,
1.070426, 1.375275, -0.451361, 1, 0, 0.9137255, 1,
1.080016, -0.8106622, -0.236802, 1, 0, 0.9058824, 1,
1.087384, 1.067026, 1.308235, 1, 0, 0.9019608, 1,
1.090435, -0.7558534, 1.701631, 1, 0, 0.8941177, 1,
1.093788, 0.5880754, 1.751595, 1, 0, 0.8862745, 1,
1.095997, 0.3707893, -0.3509399, 1, 0, 0.8823529, 1,
1.098554, 0.9576064, 0.2881047, 1, 0, 0.8745098, 1,
1.102278, 0.6283965, 1.483442, 1, 0, 0.8705882, 1,
1.102332, -0.1407451, 0.5831369, 1, 0, 0.8627451, 1,
1.105036, -0.8851286, 2.249464, 1, 0, 0.8588235, 1,
1.105981, -0.8311757, 2.155233, 1, 0, 0.8509804, 1,
1.108176, 0.009284543, -0.3899181, 1, 0, 0.8470588, 1,
1.112866, -2.030282, 2.452603, 1, 0, 0.8392157, 1,
1.113929, 0.8280188, 1.114476, 1, 0, 0.8352941, 1,
1.12162, 0.7245327, 0.3148163, 1, 0, 0.827451, 1,
1.122688, 0.4049625, 2.694849, 1, 0, 0.8235294, 1,
1.124148, -2.602782, 3.655077, 1, 0, 0.8156863, 1,
1.133186, 0.4939097, 2.221652, 1, 0, 0.8117647, 1,
1.140803, -0.2714829, 3.135188, 1, 0, 0.8039216, 1,
1.153231, -1.164377, 3.135076, 1, 0, 0.7960784, 1,
1.157326, 0.03040727, 1.799837, 1, 0, 0.7921569, 1,
1.16322, 0.2383144, 2.473284, 1, 0, 0.7843137, 1,
1.164387, -1.74006, 3.479268, 1, 0, 0.7803922, 1,
1.164409, -0.756781, 2.147874, 1, 0, 0.772549, 1,
1.165895, 0.7885631, 0.9264602, 1, 0, 0.7686275, 1,
1.167047, 0.1901035, 1.005257, 1, 0, 0.7607843, 1,
1.167357, 2.011449, 0.4042963, 1, 0, 0.7568628, 1,
1.172365, 0.1489883, 0.9314948, 1, 0, 0.7490196, 1,
1.176857, -0.7527891, 0.3028025, 1, 0, 0.7450981, 1,
1.186592, -0.9014148, 0.5813284, 1, 0, 0.7372549, 1,
1.1881, -0.9663613, 4.110027, 1, 0, 0.7333333, 1,
1.199779, 1.041133, 0.8746301, 1, 0, 0.7254902, 1,
1.202831, 1.309642, 1.34876, 1, 0, 0.7215686, 1,
1.205524, 0.3244865, 1.296587, 1, 0, 0.7137255, 1,
1.205624, 0.02464739, 0.02976101, 1, 0, 0.7098039, 1,
1.206242, 0.1045503, 0.7579568, 1, 0, 0.7019608, 1,
1.206489, -0.6342561, 1.531438, 1, 0, 0.6941177, 1,
1.217122, -1.733963, 2.579892, 1, 0, 0.6901961, 1,
1.21929, 0.5251057, 2.09635, 1, 0, 0.682353, 1,
1.232325, 1.223794, 2.250373, 1, 0, 0.6784314, 1,
1.236396, -1.206438, 1.293982, 1, 0, 0.6705883, 1,
1.239366, -0.8691016, 2.238275, 1, 0, 0.6666667, 1,
1.242128, -1.841778, 3.746465, 1, 0, 0.6588235, 1,
1.242737, -0.6352416, 1.93572, 1, 0, 0.654902, 1,
1.254051, 0.3130954, 1.941206, 1, 0, 0.6470588, 1,
1.259638, -1.406991, 4.421171, 1, 0, 0.6431373, 1,
1.259927, 0.1437572, 1.852546, 1, 0, 0.6352941, 1,
1.261806, -0.05122931, 3.514746, 1, 0, 0.6313726, 1,
1.263133, -0.7250006, 1.690717, 1, 0, 0.6235294, 1,
1.271144, 1.125851, 1.957667, 1, 0, 0.6196079, 1,
1.282319, 0.2242199, 3.232232, 1, 0, 0.6117647, 1,
1.286395, -1.463675, 2.717162, 1, 0, 0.6078432, 1,
1.289809, 0.7279395, 0.6852607, 1, 0, 0.6, 1,
1.293481, 0.3300475, 1.725387, 1, 0, 0.5921569, 1,
1.294359, 0.26541, 3.51249, 1, 0, 0.5882353, 1,
1.29472, 0.6372682, 1.773188, 1, 0, 0.5803922, 1,
1.301877, -1.872224, 1.98145, 1, 0, 0.5764706, 1,
1.317422, 0.07603336, 2.002021, 1, 0, 0.5686275, 1,
1.317807, -0.1872523, 1.323416, 1, 0, 0.5647059, 1,
1.324558, -0.1133314, 0.8827506, 1, 0, 0.5568628, 1,
1.34936, 1.301439, -0.3896742, 1, 0, 0.5529412, 1,
1.364674, 0.9717673, -0.7784154, 1, 0, 0.5450981, 1,
1.368279, -0.225919, 1.422122, 1, 0, 0.5411765, 1,
1.369269, -0.5256942, 2.65377, 1, 0, 0.5333334, 1,
1.371404, -1.14924, 1.856715, 1, 0, 0.5294118, 1,
1.378401, 0.2564237, 0.8778934, 1, 0, 0.5215687, 1,
1.380735, 1.692496, 0.3469783, 1, 0, 0.5176471, 1,
1.392097, -1.455751, 0.8344483, 1, 0, 0.509804, 1,
1.392322, 0.6883075, 1.019139, 1, 0, 0.5058824, 1,
1.393696, 1.478495, 1.604549, 1, 0, 0.4980392, 1,
1.40108, 0.6612531, 1.362027, 1, 0, 0.4901961, 1,
1.419249, 1.170872, 0.09709705, 1, 0, 0.4862745, 1,
1.426539, -1.255181, 3.776759, 1, 0, 0.4784314, 1,
1.444751, 0.9706046, 1.766279, 1, 0, 0.4745098, 1,
1.446969, -1.716378, 3.613771, 1, 0, 0.4666667, 1,
1.448666, -1.305374, 2.528417, 1, 0, 0.4627451, 1,
1.451485, 0.3659195, 2.51453, 1, 0, 0.454902, 1,
1.452588, -1.00088, 2.306142, 1, 0, 0.4509804, 1,
1.455309, -0.4949257, 1.834639, 1, 0, 0.4431373, 1,
1.462257, -0.4019109, 1.208631, 1, 0, 0.4392157, 1,
1.464342, -1.21974, 2.887414, 1, 0, 0.4313726, 1,
1.488389, -1.478329, 2.164474, 1, 0, 0.427451, 1,
1.491997, -1.000643, 3.369055, 1, 0, 0.4196078, 1,
1.512803, 0.3131979, 2.505749, 1, 0, 0.4156863, 1,
1.514535, 1.16483, 2.025756, 1, 0, 0.4078431, 1,
1.514976, -0.1764512, -0.07623944, 1, 0, 0.4039216, 1,
1.517127, -0.5383657, 2.196508, 1, 0, 0.3960784, 1,
1.519897, 0.04005979, 0.4483933, 1, 0, 0.3882353, 1,
1.525187, 0.8278669, 1.68537, 1, 0, 0.3843137, 1,
1.543178, 0.1881882, 1.34167, 1, 0, 0.3764706, 1,
1.546958, 0.477275, 1.490122, 1, 0, 0.372549, 1,
1.548797, -1.455499, 3.991834, 1, 0, 0.3647059, 1,
1.564003, -0.1803448, 0.7822391, 1, 0, 0.3607843, 1,
1.565174, 0.8288726, 1.155379, 1, 0, 0.3529412, 1,
1.571638, -1.903012, 3.140563, 1, 0, 0.3490196, 1,
1.588738, -0.403541, 2.670432, 1, 0, 0.3411765, 1,
1.611475, 0.007497045, 0.7594243, 1, 0, 0.3372549, 1,
1.637382, 0.8438327, 1.273944, 1, 0, 0.3294118, 1,
1.639734, -0.1415369, 3.257807, 1, 0, 0.3254902, 1,
1.64435, 0.1925127, 3.417619, 1, 0, 0.3176471, 1,
1.659088, 0.8251535, -0.3665409, 1, 0, 0.3137255, 1,
1.670049, -1.160529, 4.585831, 1, 0, 0.3058824, 1,
1.680283, -0.9232938, 1.495411, 1, 0, 0.2980392, 1,
1.688002, -2.595795, 1.43901, 1, 0, 0.2941177, 1,
1.693149, 1.983224, -0.9626983, 1, 0, 0.2862745, 1,
1.702066, 0.7359573, 1.162913, 1, 0, 0.282353, 1,
1.708999, -0.1321497, 2.514509, 1, 0, 0.2745098, 1,
1.710213, -0.605222, 1.483648, 1, 0, 0.2705882, 1,
1.712819, -1.594778, 2.703944, 1, 0, 0.2627451, 1,
1.718199, 0.5696924, 1.442134, 1, 0, 0.2588235, 1,
1.73861, -0.5992221, 3.303131, 1, 0, 0.2509804, 1,
1.74739, 1.368181, 0.1235965, 1, 0, 0.2470588, 1,
1.776359, 0.4188888, 1.45549, 1, 0, 0.2392157, 1,
1.789393, -1.463652, 2.577327, 1, 0, 0.2352941, 1,
1.790338, 0.6662487, 2.029646, 1, 0, 0.227451, 1,
1.795368, 0.04312931, 1.575851, 1, 0, 0.2235294, 1,
1.796817, 1.252223, 2.62119, 1, 0, 0.2156863, 1,
1.813753, -0.2391947, 0.8965886, 1, 0, 0.2117647, 1,
1.829753, -0.1140842, -0.5187191, 1, 0, 0.2039216, 1,
1.849468, 1.711771, -0.4762196, 1, 0, 0.1960784, 1,
1.865371, 0.3273464, 0.9821269, 1, 0, 0.1921569, 1,
1.870128, 0.3798835, 1.642827, 1, 0, 0.1843137, 1,
1.888366, -0.2806374, 2.482274, 1, 0, 0.1803922, 1,
1.948179, -0.2621575, 2.665187, 1, 0, 0.172549, 1,
1.951589, -0.9857531, 0.2209427, 1, 0, 0.1686275, 1,
1.953249, -0.7123477, 1.778404, 1, 0, 0.1607843, 1,
1.997513, -0.4725164, 1.888237, 1, 0, 0.1568628, 1,
2.005557, -0.7307577, 1.605491, 1, 0, 0.1490196, 1,
2.017075, -1.349098, 2.523667, 1, 0, 0.145098, 1,
2.032057, 1.006461, 0.1056875, 1, 0, 0.1372549, 1,
2.03828, 0.01061599, 0.5586694, 1, 0, 0.1333333, 1,
2.044434, -0.6591528, 2.477854, 1, 0, 0.1254902, 1,
2.056955, 2.360265, 1.940791, 1, 0, 0.1215686, 1,
2.079751, -0.09681629, 2.8402, 1, 0, 0.1137255, 1,
2.08531, -0.02424221, 0.3900832, 1, 0, 0.1098039, 1,
2.118445, -1.530431, 1.71479, 1, 0, 0.1019608, 1,
2.133403, 0.8707863, 1.818471, 1, 0, 0.09411765, 1,
2.140247, -0.69728, 1.163046, 1, 0, 0.09019608, 1,
2.19654, 0.5239914, 1.203505, 1, 0, 0.08235294, 1,
2.247792, 0.03494588, 0.6915337, 1, 0, 0.07843138, 1,
2.266278, 0.8903322, 1.542021, 1, 0, 0.07058824, 1,
2.332044, 0.5921908, 1.550398, 1, 0, 0.06666667, 1,
2.350688, -0.4231576, 1.690948, 1, 0, 0.05882353, 1,
2.398298, -0.285674, 0.3879533, 1, 0, 0.05490196, 1,
2.407459, 0.2849312, 1.523529, 1, 0, 0.04705882, 1,
2.43874, -0.09979175, 3.717057, 1, 0, 0.04313726, 1,
2.532015, -0.9078844, 2.330781, 1, 0, 0.03529412, 1,
2.678942, -1.076211, 2.809461, 1, 0, 0.03137255, 1,
2.789735, -1.08005, 1.22309, 1, 0, 0.02352941, 1,
2.803005, 0.2458411, -0.4315917, 1, 0, 0.01960784, 1,
2.842347, 1.577302, -0.2249943, 1, 0, 0.01176471, 1,
3.424287, -1.535509, 1.576846, 1, 0, 0.007843138, 1
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
-0.264738, -4.040023, -7.472381, 0, -0.5, 0.5, 0.5,
-0.264738, -4.040023, -7.472381, 1, -0.5, 0.5, 0.5,
-0.264738, -4.040023, -7.472381, 1, 1.5, 0.5, 0.5,
-0.264738, -4.040023, -7.472381, 0, 1.5, 0.5, 0.5
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
-5.204342, -0.2591801, -7.472381, 0, -0.5, 0.5, 0.5,
-5.204342, -0.2591801, -7.472381, 1, -0.5, 0.5, 0.5,
-5.204342, -0.2591801, -7.472381, 1, 1.5, 0.5, 0.5,
-5.204342, -0.2591801, -7.472381, 0, 1.5, 0.5, 0.5
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
-5.204342, -4.040023, -0.2974205, 0, -0.5, 0.5, 0.5,
-5.204342, -4.040023, -0.2974205, 1, -0.5, 0.5, 0.5,
-5.204342, -4.040023, -0.2974205, 1, 1.5, 0.5, 0.5,
-5.204342, -4.040023, -0.2974205, 0, 1.5, 0.5, 0.5
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
-2, -3.167521, -5.81662,
2, -3.167521, -5.81662,
-2, -3.167521, -5.81662,
-2, -3.312937, -6.09258,
0, -3.167521, -5.81662,
0, -3.312937, -6.09258,
2, -3.167521, -5.81662,
2, -3.312937, -6.09258
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
-2, -3.603772, -6.644501, 0, -0.5, 0.5, 0.5,
-2, -3.603772, -6.644501, 1, -0.5, 0.5, 0.5,
-2, -3.603772, -6.644501, 1, 1.5, 0.5, 0.5,
-2, -3.603772, -6.644501, 0, 1.5, 0.5, 0.5,
0, -3.603772, -6.644501, 0, -0.5, 0.5, 0.5,
0, -3.603772, -6.644501, 1, -0.5, 0.5, 0.5,
0, -3.603772, -6.644501, 1, 1.5, 0.5, 0.5,
0, -3.603772, -6.644501, 0, 1.5, 0.5, 0.5,
2, -3.603772, -6.644501, 0, -0.5, 0.5, 0.5,
2, -3.603772, -6.644501, 1, -0.5, 0.5, 0.5,
2, -3.603772, -6.644501, 1, 1.5, 0.5, 0.5,
2, -3.603772, -6.644501, 0, 1.5, 0.5, 0.5
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
-4.064434, -3, -5.81662,
-4.064434, 2, -5.81662,
-4.064434, -3, -5.81662,
-4.254418, -3, -6.09258,
-4.064434, -2, -5.81662,
-4.254418, -2, -6.09258,
-4.064434, -1, -5.81662,
-4.254418, -1, -6.09258,
-4.064434, 0, -5.81662,
-4.254418, 0, -6.09258,
-4.064434, 1, -5.81662,
-4.254418, 1, -6.09258,
-4.064434, 2, -5.81662,
-4.254418, 2, -6.09258
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
-4.634388, -3, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, -3, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, -3, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, -3, -6.644501, 0, 1.5, 0.5, 0.5,
-4.634388, -2, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, -2, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, -2, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, -2, -6.644501, 0, 1.5, 0.5, 0.5,
-4.634388, -1, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, -1, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, -1, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, -1, -6.644501, 0, 1.5, 0.5, 0.5,
-4.634388, 0, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, 0, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, 0, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, 0, -6.644501, 0, 1.5, 0.5, 0.5,
-4.634388, 1, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, 1, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, 1, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, 1, -6.644501, 0, 1.5, 0.5, 0.5,
-4.634388, 2, -6.644501, 0, -0.5, 0.5, 0.5,
-4.634388, 2, -6.644501, 1, -0.5, 0.5, 0.5,
-4.634388, 2, -6.644501, 1, 1.5, 0.5, 0.5,
-4.634388, 2, -6.644501, 0, 1.5, 0.5, 0.5
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
-4.064434, -3.167521, -4,
-4.064434, -3.167521, 4,
-4.064434, -3.167521, -4,
-4.254418, -3.312937, -4,
-4.064434, -3.167521, -2,
-4.254418, -3.312937, -2,
-4.064434, -3.167521, 0,
-4.254418, -3.312937, 0,
-4.064434, -3.167521, 2,
-4.254418, -3.312937, 2,
-4.064434, -3.167521, 4,
-4.254418, -3.312937, 4
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
-4.634388, -3.603772, -4, 0, -0.5, 0.5, 0.5,
-4.634388, -3.603772, -4, 1, -0.5, 0.5, 0.5,
-4.634388, -3.603772, -4, 1, 1.5, 0.5, 0.5,
-4.634388, -3.603772, -4, 0, 1.5, 0.5, 0.5,
-4.634388, -3.603772, -2, 0, -0.5, 0.5, 0.5,
-4.634388, -3.603772, -2, 1, -0.5, 0.5, 0.5,
-4.634388, -3.603772, -2, 1, 1.5, 0.5, 0.5,
-4.634388, -3.603772, -2, 0, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 0, 0, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 0, 1, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 0, 1, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 0, 0, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 2, 0, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 2, 1, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 2, 1, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 2, 0, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 4, 0, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 4, 1, -0.5, 0.5, 0.5,
-4.634388, -3.603772, 4, 1, 1.5, 0.5, 0.5,
-4.634388, -3.603772, 4, 0, 1.5, 0.5, 0.5
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
-4.064434, -3.167521, -5.81662,
-4.064434, 2.64916, -5.81662,
-4.064434, -3.167521, 5.221779,
-4.064434, 2.64916, 5.221779,
-4.064434, -3.167521, -5.81662,
-4.064434, -3.167521, 5.221779,
-4.064434, 2.64916, -5.81662,
-4.064434, 2.64916, 5.221779,
-4.064434, -3.167521, -5.81662,
3.534958, -3.167521, -5.81662,
-4.064434, -3.167521, 5.221779,
3.534958, -3.167521, 5.221779,
-4.064434, 2.64916, -5.81662,
3.534958, 2.64916, -5.81662,
-4.064434, 2.64916, 5.221779,
3.534958, 2.64916, 5.221779,
3.534958, -3.167521, -5.81662,
3.534958, 2.64916, -5.81662,
3.534958, -3.167521, 5.221779,
3.534958, 2.64916, 5.221779,
3.534958, -3.167521, -5.81662,
3.534958, -3.167521, 5.221779,
3.534958, 2.64916, -5.81662,
3.534958, 2.64916, 5.221779
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
var radius = 7.801067;
var distance = 34.70783;
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
mvMatrix.translate( 0.264738, 0.2591801, 0.2974205 );
mvMatrix.scale( 1.109913, 1.450082, 0.7641204 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70783);
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
Chlorpyrifos<-read.table("Chlorpyrifos.xyz")
```

```
## Error in read.table("Chlorpyrifos.xyz"): no lines available in input
```

```r
x<-Chlorpyrifos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpyrifos' not found
```

```r
y<-Chlorpyrifos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlorpyrifos' not found
```

```r
z<-Chlorpyrifos$V4
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
-3.953763, -0.1856352, -0.2344765, 0, 0, 1, 1, 1,
-3.606929, -1.03848, -0.4130708, 1, 0, 0, 1, 1,
-2.787324, 0.1604891, -1.584443, 1, 0, 0, 1, 1,
-2.613005, -0.5163464, -2.466189, 1, 0, 0, 1, 1,
-2.612921, -0.9544895, -0.5036043, 1, 0, 0, 1, 1,
-2.568235, -0.3145347, -0.5458168, 1, 0, 0, 1, 1,
-2.417807, 0.4531915, -1.548589, 0, 0, 0, 1, 1,
-2.406797, -0.5042555, -2.396271, 0, 0, 0, 1, 1,
-2.360056, 0.1996111, -0.9464895, 0, 0, 0, 1, 1,
-2.351087, -0.2722446, -3.143807, 0, 0, 0, 1, 1,
-2.341227, -0.1686814, -3.423481, 0, 0, 0, 1, 1,
-2.309083, 1.921169, -2.731112, 0, 0, 0, 1, 1,
-2.28584, 0.7382897, -1.479132, 0, 0, 0, 1, 1,
-2.099454, 0.4743883, -1.783896, 1, 1, 1, 1, 1,
-2.084872, -1.208382, -1.89592, 1, 1, 1, 1, 1,
-2.064292, 0.5569224, -0.6665568, 1, 1, 1, 1, 1,
-2.04127, -0.2386131, -1.519317, 1, 1, 1, 1, 1,
-2.037976, -0.1746584, -1.047183, 1, 1, 1, 1, 1,
-2.036108, 0.09428519, -1.149276, 1, 1, 1, 1, 1,
-2.020066, -0.9949971, -1.990311, 1, 1, 1, 1, 1,
-1.992522, -2.515235, -3.94894, 1, 1, 1, 1, 1,
-1.990733, -0.8791108, -1.775387, 1, 1, 1, 1, 1,
-1.985112, 1.55479, -1.637062, 1, 1, 1, 1, 1,
-1.870123, 0.9472657, -0.07670528, 1, 1, 1, 1, 1,
-1.857643, 0.3526986, -0.4337879, 1, 1, 1, 1, 1,
-1.852119, -0.06576782, -2.074904, 1, 1, 1, 1, 1,
-1.836838, -0.3625829, -0.5423344, 1, 1, 1, 1, 1,
-1.802021, -1.591373, -2.080545, 1, 1, 1, 1, 1,
-1.785532, 1.065919, -1.961081, 0, 0, 1, 1, 1,
-1.78314, -0.6704683, -0.5435225, 1, 0, 0, 1, 1,
-1.767748, -0.08214797, -4.334239, 1, 0, 0, 1, 1,
-1.767657, -1.273062, -3.092739, 1, 0, 0, 1, 1,
-1.748621, -0.3880669, -1.75704, 1, 0, 0, 1, 1,
-1.74311, -1.28078, -2.552331, 1, 0, 0, 1, 1,
-1.739621, 1.452723, -1.188037, 0, 0, 0, 1, 1,
-1.735786, -0.6185612, -0.9228284, 0, 0, 0, 1, 1,
-1.729379, 0.1090027, -2.42878, 0, 0, 0, 1, 1,
-1.723689, 0.3212065, -1.984186, 0, 0, 0, 1, 1,
-1.683525, -1.917531, -3.006627, 0, 0, 0, 1, 1,
-1.663021, 0.288248, -1.553454, 0, 0, 0, 1, 1,
-1.65567, 0.269926, -1.90634, 0, 0, 0, 1, 1,
-1.653933, 1.005505, -2.777669, 1, 1, 1, 1, 1,
-1.651049, 1.53724, -2.282637, 1, 1, 1, 1, 1,
-1.645236, -1.105317, -1.87542, 1, 1, 1, 1, 1,
-1.642859, -0.2501066, -1.434955, 1, 1, 1, 1, 1,
-1.640564, -0.07660321, -1.791588, 1, 1, 1, 1, 1,
-1.630211, -0.8365573, -2.796235, 1, 1, 1, 1, 1,
-1.628966, -0.02174045, -1.878755, 1, 1, 1, 1, 1,
-1.614874, -1.546649, -2.458682, 1, 1, 1, 1, 1,
-1.614873, -1.319521, -3.657286, 1, 1, 1, 1, 1,
-1.609784, -1.830878, -0.1858431, 1, 1, 1, 1, 1,
-1.607986, -1.286327, -3.067905, 1, 1, 1, 1, 1,
-1.60184, 0.08732428, -0.4338141, 1, 1, 1, 1, 1,
-1.599341, -0.1849974, -0.9242175, 1, 1, 1, 1, 1,
-1.59869, 0.08981752, 0.01508476, 1, 1, 1, 1, 1,
-1.596354, 1.343371, -1.127987, 1, 1, 1, 1, 1,
-1.593715, 0.5473904, -1.216361, 0, 0, 1, 1, 1,
-1.592043, 0.6897128, -2.528836, 1, 0, 0, 1, 1,
-1.573646, 1.771868, 0.07166026, 1, 0, 0, 1, 1,
-1.569866, 1.136495, -1.151027, 1, 0, 0, 1, 1,
-1.546907, 0.09490436, -3.702048, 1, 0, 0, 1, 1,
-1.54583, 0.6132659, -3.106487, 1, 0, 0, 1, 1,
-1.539133, -0.3142951, -0.5825282, 0, 0, 0, 1, 1,
-1.513147, 0.02475305, -1.426922, 0, 0, 0, 1, 1,
-1.511039, -0.3060058, -2.598022, 0, 0, 0, 1, 1,
-1.508775, 0.8378227, -1.456152, 0, 0, 0, 1, 1,
-1.508584, 2.214904, -0.9643381, 0, 0, 0, 1, 1,
-1.499925, -0.1363482, -0.0824168, 0, 0, 0, 1, 1,
-1.458761, 0.9661227, -1.364924, 0, 0, 0, 1, 1,
-1.454653, 0.5375212, -1.648171, 1, 1, 1, 1, 1,
-1.449552, 1.640986, -2.106077, 1, 1, 1, 1, 1,
-1.440515, 0.8160201, -0.449016, 1, 1, 1, 1, 1,
-1.432768, 2.388284, -0.5135779, 1, 1, 1, 1, 1,
-1.429683, 1.430123, -0.963435, 1, 1, 1, 1, 1,
-1.42868, -0.9395486, -1.889157, 1, 1, 1, 1, 1,
-1.42686, 0.8305033, -1.384817, 1, 1, 1, 1, 1,
-1.418496, 1.524901, 0.2907261, 1, 1, 1, 1, 1,
-1.408621, -1.272521, -1.842815, 1, 1, 1, 1, 1,
-1.407382, -0.07566989, -2.136085, 1, 1, 1, 1, 1,
-1.404599, 0.7095518, -1.362562, 1, 1, 1, 1, 1,
-1.400611, 0.2229456, -0.9969481, 1, 1, 1, 1, 1,
-1.388489, 0.237336, -0.8346704, 1, 1, 1, 1, 1,
-1.386796, -0.1530656, -0.4131744, 1, 1, 1, 1, 1,
-1.368306, 0.7798991, -1.767737, 1, 1, 1, 1, 1,
-1.363197, 0.01083657, -1.166563, 0, 0, 1, 1, 1,
-1.361024, -0.5698749, -1.923074, 1, 0, 0, 1, 1,
-1.354833, 0.409621, -2.028684, 1, 0, 0, 1, 1,
-1.350248, -1.901793, -1.783865, 1, 0, 0, 1, 1,
-1.340694, 0.02219798, -0.6651354, 1, 0, 0, 1, 1,
-1.336344, -1.846823, -1.996249, 1, 0, 0, 1, 1,
-1.326895, -0.1739642, -0.3260953, 0, 0, 0, 1, 1,
-1.296549, -0.2830873, -2.628916, 0, 0, 0, 1, 1,
-1.286055, 0.05476642, -0.05272936, 0, 0, 0, 1, 1,
-1.277392, -1.99498, -4.656467, 0, 0, 0, 1, 1,
-1.274854, -1.208354, -3.765894, 0, 0, 0, 1, 1,
-1.271911, -0.08813058, -2.004579, 0, 0, 0, 1, 1,
-1.269114, -0.08799531, -2.744044, 0, 0, 0, 1, 1,
-1.258366, 1.422336, -1.967408, 1, 1, 1, 1, 1,
-1.257227, 0.2098185, -1.188086, 1, 1, 1, 1, 1,
-1.250996, -2.21976, -1.268469, 1, 1, 1, 1, 1,
-1.240658, 1.227939, -0.7611563, 1, 1, 1, 1, 1,
-1.237937, -0.1854281, -2.18102, 1, 1, 1, 1, 1,
-1.236681, 0.5461065, -0.6497969, 1, 1, 1, 1, 1,
-1.223996, -0.6860392, -2.479982, 1, 1, 1, 1, 1,
-1.209944, 0.2063827, -2.764482, 1, 1, 1, 1, 1,
-1.20902, 0.550477, 1.470073, 1, 1, 1, 1, 1,
-1.202688, -0.3640586, -4.041689, 1, 1, 1, 1, 1,
-1.185913, -0.05546362, -1.162899, 1, 1, 1, 1, 1,
-1.169265, -0.5904012, -1.358517, 1, 1, 1, 1, 1,
-1.166485, 0.293864, -1.236045, 1, 1, 1, 1, 1,
-1.160747, -0.2426186, -0.01833144, 1, 1, 1, 1, 1,
-1.153798, -0.7973468, -3.136175, 1, 1, 1, 1, 1,
-1.144694, -0.9294862, -2.550109, 0, 0, 1, 1, 1,
-1.141851, -0.03592423, -2.667012, 1, 0, 0, 1, 1,
-1.14122, -0.6224263, -3.160173, 1, 0, 0, 1, 1,
-1.14083, -0.3256263, -0.1719495, 1, 0, 0, 1, 1,
-1.135609, 1.376551, 0.1882987, 1, 0, 0, 1, 1,
-1.132548, -1.70352, -3.595332, 1, 0, 0, 1, 1,
-1.127863, -0.4507158, -1.531248, 0, 0, 0, 1, 1,
-1.123814, -0.3564311, -1.333829, 0, 0, 0, 1, 1,
-1.122815, -0.6589742, -4.135905, 0, 0, 0, 1, 1,
-1.122339, 1.03066, 1.598263, 0, 0, 0, 1, 1,
-1.119364, -1.739801, -3.212851, 0, 0, 0, 1, 1,
-1.114905, -0.7708592, -1.087793, 0, 0, 0, 1, 1,
-1.112621, -1.483736, -2.834504, 0, 0, 0, 1, 1,
-1.111624, 0.8956985, -1.333528, 1, 1, 1, 1, 1,
-1.105003, -0.3509399, -0.5595523, 1, 1, 1, 1, 1,
-1.102416, 1.055941, -0.8434328, 1, 1, 1, 1, 1,
-1.098587, -0.2309904, -3.981638, 1, 1, 1, 1, 1,
-1.097473, -1.967049, -1.282402, 1, 1, 1, 1, 1,
-1.097457, -2.014807, -2.172743, 1, 1, 1, 1, 1,
-1.091172, 1.384897, -0.1125976, 1, 1, 1, 1, 1,
-1.089627, 0.2257663, -0.74742, 1, 1, 1, 1, 1,
-1.088556, -0.2225145, -2.077741, 1, 1, 1, 1, 1,
-1.087676, 0.6544967, -0.8702445, 1, 1, 1, 1, 1,
-1.085652, 0.7714184, -1.02881, 1, 1, 1, 1, 1,
-1.075287, 0.5867189, -0.6646986, 1, 1, 1, 1, 1,
-1.075259, 2.208285, 0.5677021, 1, 1, 1, 1, 1,
-1.073262, 0.7837825, -2.108235, 1, 1, 1, 1, 1,
-1.06603, -1.096438, -1.467594, 1, 1, 1, 1, 1,
-1.06551, 1.038817, -1.487347, 0, 0, 1, 1, 1,
-1.059854, 0.8999763, -0.6675861, 1, 0, 0, 1, 1,
-1.056559, -1.184899, -4.476834, 1, 0, 0, 1, 1,
-1.054498, -1.053769, -0.3032523, 1, 0, 0, 1, 1,
-1.053643, 1.946195, -1.169335, 1, 0, 0, 1, 1,
-1.042413, 0.7891735, -0.757677, 1, 0, 0, 1, 1,
-1.041375, 0.4434653, -0.6546592, 0, 0, 0, 1, 1,
-1.040228, 0.3038523, -1.203602, 0, 0, 0, 1, 1,
-1.040144, -0.8705267, -2.037934, 0, 0, 0, 1, 1,
-1.023293, 1.215919, -2.806465, 0, 0, 0, 1, 1,
-1.022889, 2.119261, -2.235563, 0, 0, 0, 1, 1,
-0.9985268, 0.06508061, -3.10832, 0, 0, 0, 1, 1,
-0.9951875, -0.7534901, -2.613238, 0, 0, 0, 1, 1,
-0.9939897, -0.2741283, -2.836764, 1, 1, 1, 1, 1,
-0.9921371, -1.520187, -0.9567074, 1, 1, 1, 1, 1,
-0.9876077, 0.4214621, -0.8557245, 1, 1, 1, 1, 1,
-0.981969, 2.488929, -1.081905, 1, 1, 1, 1, 1,
-0.976988, -1.487726, -0.6797187, 1, 1, 1, 1, 1,
-0.9752249, -0.7589522, -1.001954, 1, 1, 1, 1, 1,
-0.9749215, 0.7517108, -1.619481, 1, 1, 1, 1, 1,
-0.9729232, 1.668335, 0.6197473, 1, 1, 1, 1, 1,
-0.9674167, -0.6160349, -3.774382, 1, 1, 1, 1, 1,
-0.9662638, -0.8714482, -2.479408, 1, 1, 1, 1, 1,
-0.9582485, -0.7755036, -1.872072, 1, 1, 1, 1, 1,
-0.9501362, 0.8958953, -0.2691479, 1, 1, 1, 1, 1,
-0.9486675, -0.3450467, -1.536298, 1, 1, 1, 1, 1,
-0.9486402, -1.649642, -3.172707, 1, 1, 1, 1, 1,
-0.9478582, -1.690801, -3.123617, 1, 1, 1, 1, 1,
-0.9463926, -0.9443692, -2.485626, 0, 0, 1, 1, 1,
-0.9370512, 1.607625, 1.723534, 1, 0, 0, 1, 1,
-0.9335172, 2.208043, -1.592468, 1, 0, 0, 1, 1,
-0.9266095, -0.1111182, -2.162342, 1, 0, 0, 1, 1,
-0.9231642, 1.628098, -0.08068389, 1, 0, 0, 1, 1,
-0.9223284, 1.243883, -1.046116, 1, 0, 0, 1, 1,
-0.9220057, 0.2024959, -2.323238, 0, 0, 0, 1, 1,
-0.9202274, 0.3628277, -3.030753, 0, 0, 0, 1, 1,
-0.9201903, -0.2141859, 0.8193287, 0, 0, 0, 1, 1,
-0.9165873, 0.2504188, -2.735536, 0, 0, 0, 1, 1,
-0.916236, 1.024009, 0.1386288, 0, 0, 0, 1, 1,
-0.9151207, 0.3650784, -1.692377, 0, 0, 0, 1, 1,
-0.9052885, 0.6750101, -0.03888493, 0, 0, 0, 1, 1,
-0.9004266, 0.4151143, -1.077628, 1, 1, 1, 1, 1,
-0.8961291, 1.039659, -0.5920779, 1, 1, 1, 1, 1,
-0.8921472, 0.2714275, 0.3595606, 1, 1, 1, 1, 1,
-0.8911924, -1.532811, -0.8077055, 1, 1, 1, 1, 1,
-0.8886266, 0.4081888, -1.245275, 1, 1, 1, 1, 1,
-0.885316, 0.6435959, -2.791879, 1, 1, 1, 1, 1,
-0.8850152, -1.027161, -0.5341425, 1, 1, 1, 1, 1,
-0.8809626, 1.179044, 1.079705, 1, 1, 1, 1, 1,
-0.8779595, -2.09159, -3.362361, 1, 1, 1, 1, 1,
-0.876448, 0.8055233, 1.119756, 1, 1, 1, 1, 1,
-0.8758821, 1.165871, -1.356776, 1, 1, 1, 1, 1,
-0.8714918, -0.9829713, -4.448083, 1, 1, 1, 1, 1,
-0.8672888, 0.4817759, -0.7294884, 1, 1, 1, 1, 1,
-0.8627056, 0.009159403, -2.99517, 1, 1, 1, 1, 1,
-0.8626959, -0.2030945, -2.615951, 1, 1, 1, 1, 1,
-0.8617002, -0.5988716, -1.97778, 0, 0, 1, 1, 1,
-0.8598089, 0.5955288, -2.395498, 1, 0, 0, 1, 1,
-0.8579288, 0.7987357, 0.5183531, 1, 0, 0, 1, 1,
-0.8566435, 0.3286296, -2.069153, 1, 0, 0, 1, 1,
-0.8550456, 0.5532192, -1.514212, 1, 0, 0, 1, 1,
-0.8512626, 0.3757969, 0.1366377, 1, 0, 0, 1, 1,
-0.8499496, -1.08964, -4.066497, 0, 0, 0, 1, 1,
-0.8382643, 1.230511, -1.974461, 0, 0, 0, 1, 1,
-0.8329141, -1.41637, -4.026642, 0, 0, 0, 1, 1,
-0.8286548, 0.761246, -1.005026, 0, 0, 0, 1, 1,
-0.8262811, -0.3731775, -2.051514, 0, 0, 0, 1, 1,
-0.8245803, 0.3577036, -1.31672, 0, 0, 0, 1, 1,
-0.8180698, -1.850957, -2.867492, 0, 0, 0, 1, 1,
-0.816897, 1.955499, -1.951015, 1, 1, 1, 1, 1,
-0.8158314, 1.423509, 0.466105, 1, 1, 1, 1, 1,
-0.8150113, -0.7862888, -1.970625, 1, 1, 1, 1, 1,
-0.8135306, 0.07618125, -0.2744399, 1, 1, 1, 1, 1,
-0.8080992, -1.440496, -1.18387, 1, 1, 1, 1, 1,
-0.8075376, 1.504515, 0.01529271, 1, 1, 1, 1, 1,
-0.8062101, -1.288724, -2.975278, 1, 1, 1, 1, 1,
-0.8051127, -1.512206, -1.946976, 1, 1, 1, 1, 1,
-0.8043123, 0.7633656, -0.7832925, 1, 1, 1, 1, 1,
-0.8021494, 0.880275, 0.441184, 1, 1, 1, 1, 1,
-0.800082, -1.029961, -2.455936, 1, 1, 1, 1, 1,
-0.7913588, 0.8044293, -1.21268, 1, 1, 1, 1, 1,
-0.7911532, -1.371519, -0.295178, 1, 1, 1, 1, 1,
-0.7889824, -0.4151333, -1.910505, 1, 1, 1, 1, 1,
-0.7873379, -1.241184, -2.571703, 1, 1, 1, 1, 1,
-0.7791495, -1.415302, -2.098581, 0, 0, 1, 1, 1,
-0.7753353, -0.7075762, -2.881031, 1, 0, 0, 1, 1,
-0.7731163, 0.3885837, -2.01567, 1, 0, 0, 1, 1,
-0.7728151, -0.2950695, -1.975865, 1, 0, 0, 1, 1,
-0.7713152, -1.429678, -1.11138, 1, 0, 0, 1, 1,
-0.7690089, -0.09070674, -2.118453, 1, 0, 0, 1, 1,
-0.7662631, 0.6600351, -1.618619, 0, 0, 0, 1, 1,
-0.7651955, 0.1273829, -1.063539, 0, 0, 0, 1, 1,
-0.7648225, 1.016495, -0.001209752, 0, 0, 0, 1, 1,
-0.7624239, -0.6606195, -2.60117, 0, 0, 0, 1, 1,
-0.7598426, -0.06595484, -3.650521, 0, 0, 0, 1, 1,
-0.7576018, -0.3913372, -1.545687, 0, 0, 0, 1, 1,
-0.7546105, -0.4767142, -1.534465, 0, 0, 0, 1, 1,
-0.7504563, 0.1608751, -0.4215392, 1, 1, 1, 1, 1,
-0.7474034, -0.6102223, -0.5735478, 1, 1, 1, 1, 1,
-0.745734, 0.01999014, -2.950743, 1, 1, 1, 1, 1,
-0.7443482, -0.3018109, -1.490106, 1, 1, 1, 1, 1,
-0.7423836, 0.6256332, -1.249145, 1, 1, 1, 1, 1,
-0.7409622, -0.5813919, -2.50262, 1, 1, 1, 1, 1,
-0.7358612, -0.09460712, -1.784694, 1, 1, 1, 1, 1,
-0.7349012, -0.8739001, -1.417502, 1, 1, 1, 1, 1,
-0.7268957, -1.800137, 0.4135295, 1, 1, 1, 1, 1,
-0.7213497, 1.044997, -0.8300507, 1, 1, 1, 1, 1,
-0.7147747, 2.081441, -0.7823664, 1, 1, 1, 1, 1,
-0.714466, -0.5458717, -2.471774, 1, 1, 1, 1, 1,
-0.7085528, -0.4151352, -3.660559, 1, 1, 1, 1, 1,
-0.7080305, 1.187078, 1.015934, 1, 1, 1, 1, 1,
-0.7077218, -0.7210312, -3.151525, 1, 1, 1, 1, 1,
-0.7023741, -0.3984376, -3.509031, 0, 0, 1, 1, 1,
-0.6980101, 0.6209272, -0.3711279, 1, 0, 0, 1, 1,
-0.6976743, 1.21837, -1.203832, 1, 0, 0, 1, 1,
-0.6973045, -0.1283136, -0.2385928, 1, 0, 0, 1, 1,
-0.6942477, 0.06942444, -0.3042192, 1, 0, 0, 1, 1,
-0.6872869, -0.3173627, -2.223838, 1, 0, 0, 1, 1,
-0.6827372, 0.8167785, -0.6258526, 0, 0, 0, 1, 1,
-0.6827215, -0.1345662, -1.421324, 0, 0, 0, 1, 1,
-0.6713763, -1.045559, -2.469756, 0, 0, 0, 1, 1,
-0.6710976, -0.4600099, -2.08342, 0, 0, 0, 1, 1,
-0.6707476, -0.6497692, -2.711701, 0, 0, 0, 1, 1,
-0.6705877, 0.9730738, -0.849511, 0, 0, 0, 1, 1,
-0.6697905, -0.6243562, -1.932211, 0, 0, 0, 1, 1,
-0.6678643, -1.21612, -3.785247, 1, 1, 1, 1, 1,
-0.6667998, 0.9068047, -1.069395, 1, 1, 1, 1, 1,
-0.6653073, 0.1798423, -0.2448581, 1, 1, 1, 1, 1,
-0.6626657, 0.7366233, 0.07586472, 1, 1, 1, 1, 1,
-0.6614144, 0.404512, -1.885651, 1, 1, 1, 1, 1,
-0.6557816, 2.409419, 0.6545243, 1, 1, 1, 1, 1,
-0.6554613, 0.9498159, -0.6134125, 1, 1, 1, 1, 1,
-0.653758, -0.708473, -2.698256, 1, 1, 1, 1, 1,
-0.6511883, 0.6700701, -2.199885, 1, 1, 1, 1, 1,
-0.64942, -0.6653977, -2.19124, 1, 1, 1, 1, 1,
-0.6485839, -0.3721815, -1.789833, 1, 1, 1, 1, 1,
-0.6418903, 2.02111, -0.9106373, 1, 1, 1, 1, 1,
-0.6389046, -1.360813, -2.103487, 1, 1, 1, 1, 1,
-0.637975, -1.338145, -2.580616, 1, 1, 1, 1, 1,
-0.635226, 0.9791617, -0.4275373, 1, 1, 1, 1, 1,
-0.6344829, 1.617209, -0.7338513, 0, 0, 1, 1, 1,
-0.634445, 0.516858, -2.08357, 1, 0, 0, 1, 1,
-0.6334373, 2.42078, -0.4128913, 1, 0, 0, 1, 1,
-0.6328877, -2.337075, -2.824447, 1, 0, 0, 1, 1,
-0.630724, -0.06746545, -0.1151714, 1, 0, 0, 1, 1,
-0.6279368, -0.2755823, -1.981314, 1, 0, 0, 1, 1,
-0.6250158, -0.5851412, -3.277033, 0, 0, 0, 1, 1,
-0.6171677, -0.4938019, -1.711386, 0, 0, 0, 1, 1,
-0.6132244, 0.9860281, -1.335049, 0, 0, 0, 1, 1,
-0.6097999, 0.5729085, -1.626573, 0, 0, 0, 1, 1,
-0.6078783, -0.7360284, -3.054118, 0, 0, 0, 1, 1,
-0.6076756, 1.874062, -1.802739, 0, 0, 0, 1, 1,
-0.6066003, 1.316343, 0.5856819, 0, 0, 0, 1, 1,
-0.6025337, -1.827663, -1.756822, 1, 1, 1, 1, 1,
-0.6022186, -1.136421, -4.063749, 1, 1, 1, 1, 1,
-0.5999572, -1.35634, -2.098593, 1, 1, 1, 1, 1,
-0.5980205, -0.4778886, -0.8543428, 1, 1, 1, 1, 1,
-0.5941764, 0.7967758, 0.1448239, 1, 1, 1, 1, 1,
-0.5940917, 1.214551, -0.2076646, 1, 1, 1, 1, 1,
-0.5933551, -1.185962, -2.396613, 1, 1, 1, 1, 1,
-0.5843067, 0.4363069, -1.326005, 1, 1, 1, 1, 1,
-0.5815235, -0.7071876, -1.913434, 1, 1, 1, 1, 1,
-0.5796709, -1.324093, -5.655867, 1, 1, 1, 1, 1,
-0.5785546, 0.1035546, -2.682179, 1, 1, 1, 1, 1,
-0.5756497, -3.082812, -3.450094, 1, 1, 1, 1, 1,
-0.5730121, 0.9004947, 0.5462155, 1, 1, 1, 1, 1,
-0.5719805, -0.8609913, -3.997458, 1, 1, 1, 1, 1,
-0.5716871, -1.96151, -1.920164, 1, 1, 1, 1, 1,
-0.5704835, -0.3322785, -0.4017039, 0, 0, 1, 1, 1,
-0.5645085, 0.7410446, -1.99462, 1, 0, 0, 1, 1,
-0.5633109, -1.054504, -3.413089, 1, 0, 0, 1, 1,
-0.5595472, 0.5670099, 1.227883, 1, 0, 0, 1, 1,
-0.5547764, 0.9923469, -0.3464544, 1, 0, 0, 1, 1,
-0.5546713, 1.788275, 0.3973163, 1, 0, 0, 1, 1,
-0.5537857, -1.658035, -2.359551, 0, 0, 0, 1, 1,
-0.552713, -0.05241376, -1.13217, 0, 0, 0, 1, 1,
-0.5505075, 1.64695, -1.257853, 0, 0, 0, 1, 1,
-0.5494614, -0.6668406, -1.615716, 0, 0, 0, 1, 1,
-0.549444, 0.07955281, -2.087173, 0, 0, 0, 1, 1,
-0.5481471, 1.120505, 0.5629428, 0, 0, 0, 1, 1,
-0.5479994, -0.5223782, -2.951513, 0, 0, 0, 1, 1,
-0.5460247, 0.330227, 0.02858556, 1, 1, 1, 1, 1,
-0.5439574, 0.1969287, -0.5854992, 1, 1, 1, 1, 1,
-0.5420495, -1.472055, -2.456344, 1, 1, 1, 1, 1,
-0.5411596, 0.694867, -0.2905764, 1, 1, 1, 1, 1,
-0.5278329, 0.6073584, -0.7717434, 1, 1, 1, 1, 1,
-0.5229749, -1.072267, -2.464111, 1, 1, 1, 1, 1,
-0.5210792, -0.1802986, -1.85683, 1, 1, 1, 1, 1,
-0.5165792, -0.250374, -1.725435, 1, 1, 1, 1, 1,
-0.5157397, -0.8646796, -2.781351, 1, 1, 1, 1, 1,
-0.5099886, -0.5108855, -2.63982, 1, 1, 1, 1, 1,
-0.5022236, 0.01274513, -3.148286, 1, 1, 1, 1, 1,
-0.4966093, 0.4575581, -0.9127704, 1, 1, 1, 1, 1,
-0.4947104, 0.7846453, -1.342047, 1, 1, 1, 1, 1,
-0.4928643, -2.212003, -1.809934, 1, 1, 1, 1, 1,
-0.4912035, 1.683066, 0.1319456, 1, 1, 1, 1, 1,
-0.4887799, 0.599126, -1.046921, 0, 0, 1, 1, 1,
-0.4801937, 1.345669, -0.1943994, 1, 0, 0, 1, 1,
-0.4729043, 1.43615, 1.357514, 1, 0, 0, 1, 1,
-0.4728059, -0.4599459, -2.414691, 1, 0, 0, 1, 1,
-0.4684003, -0.3059341, -1.761191, 1, 0, 0, 1, 1,
-0.4657265, -0.2096311, -0.6026133, 1, 0, 0, 1, 1,
-0.4651623, 0.9357593, 1.343064, 0, 0, 0, 1, 1,
-0.4645226, 0.372365, -0.4461005, 0, 0, 0, 1, 1,
-0.4606462, -0.01444422, -0.4143325, 0, 0, 0, 1, 1,
-0.4598609, 0.06575415, -1.208822, 0, 0, 0, 1, 1,
-0.4594771, 0.5272557, -2.095698, 0, 0, 0, 1, 1,
-0.4580931, -1.643759, -2.535003, 0, 0, 0, 1, 1,
-0.4555464, 0.2778487, -0.9587188, 0, 0, 0, 1, 1,
-0.4535951, -0.4245125, -2.703876, 1, 1, 1, 1, 1,
-0.4516225, -1.502466, 0.06424466, 1, 1, 1, 1, 1,
-0.4502604, -1.312126, -3.104781, 1, 1, 1, 1, 1,
-0.4501654, -0.03431593, -0.4350331, 1, 1, 1, 1, 1,
-0.4487535, -0.9134204, -4.545924, 1, 1, 1, 1, 1,
-0.4483267, -1.936646, -2.702905, 1, 1, 1, 1, 1,
-0.4450466, 0.06990553, 0.120108, 1, 1, 1, 1, 1,
-0.441952, 0.1350602, -1.136231, 1, 1, 1, 1, 1,
-0.4404873, -1.043038, -3.008489, 1, 1, 1, 1, 1,
-0.4398369, -1.197821, -4.020991, 1, 1, 1, 1, 1,
-0.4336045, -1.031537, -1.769715, 1, 1, 1, 1, 1,
-0.428555, 1.214455, -1.187083, 1, 1, 1, 1, 1,
-0.4280405, 0.05793459, 0.1821129, 1, 1, 1, 1, 1,
-0.4279034, 0.8858618, 0.1556745, 1, 1, 1, 1, 1,
-0.4230298, -0.3188772, -1.322642, 1, 1, 1, 1, 1,
-0.4197169, 0.2784393, -0.2356547, 0, 0, 1, 1, 1,
-0.4153372, 1.264744, -0.4355523, 1, 0, 0, 1, 1,
-0.4130046, -1.033449, -3.32086, 1, 0, 0, 1, 1,
-0.4123494, 1.073354, -1.322397, 1, 0, 0, 1, 1,
-0.4082112, 0.04791635, -1.06245, 1, 0, 0, 1, 1,
-0.4066566, -0.742344, -3.844523, 1, 0, 0, 1, 1,
-0.3959768, 0.4553367, -2.552854, 0, 0, 0, 1, 1,
-0.393764, 0.6866563, -0.3632531, 0, 0, 0, 1, 1,
-0.3914441, -0.6693372, -2.180708, 0, 0, 0, 1, 1,
-0.3811409, 0.1152487, -2.059746, 0, 0, 0, 1, 1,
-0.3802681, -1.507608, -2.682853, 0, 0, 0, 1, 1,
-0.3777914, -0.1920049, -2.169847, 0, 0, 0, 1, 1,
-0.3721894, 1.360818, 0.8805143, 0, 0, 0, 1, 1,
-0.3719662, -0.6361002, -1.893917, 1, 1, 1, 1, 1,
-0.3664246, -0.2633559, -3.075539, 1, 1, 1, 1, 1,
-0.3653446, -1.229887, -3.340371, 1, 1, 1, 1, 1,
-0.3640986, -0.6850057, -3.861691, 1, 1, 1, 1, 1,
-0.3577577, -0.6749176, -3.168122, 1, 1, 1, 1, 1,
-0.3506139, 0.1053356, -1.347088, 1, 1, 1, 1, 1,
-0.3505816, -0.1206556, -1.134056, 1, 1, 1, 1, 1,
-0.3481157, 1.034591, -2.490089, 1, 1, 1, 1, 1,
-0.3467894, 0.3494644, 2.042172, 1, 1, 1, 1, 1,
-0.341578, 0.0973447, -0.6924936, 1, 1, 1, 1, 1,
-0.3358408, -1.737066, -2.21518, 1, 1, 1, 1, 1,
-0.3336842, -0.3875914, -2.313467, 1, 1, 1, 1, 1,
-0.3322105, 0.9937487, -1.042477, 1, 1, 1, 1, 1,
-0.3320971, 0.6345278, -1.582706, 1, 1, 1, 1, 1,
-0.3283391, 0.4364832, -2.189553, 1, 1, 1, 1, 1,
-0.3261063, 1.061547, 1.176616, 0, 0, 1, 1, 1,
-0.3192346, -0.9463081, -3.055618, 1, 0, 0, 1, 1,
-0.3188977, -1.329554, -2.642009, 1, 0, 0, 1, 1,
-0.318436, -0.7076495, -2.318621, 1, 0, 0, 1, 1,
-0.3111006, -0.3439452, -3.228903, 1, 0, 0, 1, 1,
-0.307654, 0.5162604, -0.655553, 1, 0, 0, 1, 1,
-0.3002209, -1.479708, -5.167838, 0, 0, 0, 1, 1,
-0.2991312, -0.5922728, -4.065773, 0, 0, 0, 1, 1,
-0.2979958, -0.03193972, -0.1886062, 0, 0, 0, 1, 1,
-0.2975058, -0.07892642, -2.57292, 0, 0, 0, 1, 1,
-0.2966183, 0.7938693, 0.7303763, 0, 0, 0, 1, 1,
-0.2788661, -0.3122135, -3.868736, 0, 0, 0, 1, 1,
-0.2775829, -0.6609238, -2.55143, 0, 0, 0, 1, 1,
-0.2726949, 0.7441018, -0.5065946, 1, 1, 1, 1, 1,
-0.2725646, -1.169282, -2.161783, 1, 1, 1, 1, 1,
-0.2693832, -0.03648635, -4.510082, 1, 1, 1, 1, 1,
-0.2613954, -0.07493406, -3.226175, 1, 1, 1, 1, 1,
-0.2610623, 0.9178276, 0.26786, 1, 1, 1, 1, 1,
-0.2600512, -0.3483334, -3.430251, 1, 1, 1, 1, 1,
-0.2561655, 0.1086795, -2.757699, 1, 1, 1, 1, 1,
-0.249369, -0.3085927, -1.768346, 1, 1, 1, 1, 1,
-0.2481387, 0.944721, -0.07822652, 1, 1, 1, 1, 1,
-0.2395219, 0.5024175, 0.2841436, 1, 1, 1, 1, 1,
-0.2367372, 1.328144, -0.2915673, 1, 1, 1, 1, 1,
-0.2317754, -1.068819, -3.357291, 1, 1, 1, 1, 1,
-0.2308106, -0.4276876, -2.204683, 1, 1, 1, 1, 1,
-0.2279653, 0.1213335, -2.405205, 1, 1, 1, 1, 1,
-0.2249141, -1.797041, -1.297789, 1, 1, 1, 1, 1,
-0.2245257, -0.763773, -3.06963, 0, 0, 1, 1, 1,
-0.2230882, -0.4667547, -4.183855, 1, 0, 0, 1, 1,
-0.217094, 1.717752, -1.035148, 1, 0, 0, 1, 1,
-0.2152644, 0.1862179, -2.999471, 1, 0, 0, 1, 1,
-0.2149227, -1.098528, -3.986825, 1, 0, 0, 1, 1,
-0.2133947, -1.095573, -2.129701, 1, 0, 0, 1, 1,
-0.2099886, 0.8833632, -0.750017, 0, 0, 0, 1, 1,
-0.1924699, -2.443102, -3.223992, 0, 0, 0, 1, 1,
-0.1904457, 0.5375922, -1.513737, 0, 0, 0, 1, 1,
-0.1872471, -0.3370101, -2.929922, 0, 0, 0, 1, 1,
-0.1857006, 1.128994, -0.3353653, 0, 0, 0, 1, 1,
-0.181893, -1.065572, -2.218571, 0, 0, 0, 1, 1,
-0.1809494, -1.123701, -2.874088, 0, 0, 0, 1, 1,
-0.1798534, -0.1996822, -1.109085, 1, 1, 1, 1, 1,
-0.1788194, -0.6086803, -2.35266, 1, 1, 1, 1, 1,
-0.1786146, 0.1176688, -0.6881422, 1, 1, 1, 1, 1,
-0.174264, -0.3365325, -2.749883, 1, 1, 1, 1, 1,
-0.1735333, 1.069277, 0.4860534, 1, 1, 1, 1, 1,
-0.1717142, -1.768932, -2.850261, 1, 1, 1, 1, 1,
-0.1689902, -0.6003893, -2.334425, 1, 1, 1, 1, 1,
-0.168229, 1.390638, 1.245226, 1, 1, 1, 1, 1,
-0.1660179, 0.6518666, 1.347346, 1, 1, 1, 1, 1,
-0.1615084, 0.4297741, 0.9547976, 1, 1, 1, 1, 1,
-0.1598634, -1.587121, -2.491907, 1, 1, 1, 1, 1,
-0.156452, -1.154777, -3.030235, 1, 1, 1, 1, 1,
-0.1468642, 0.2570169, -0.3353787, 1, 1, 1, 1, 1,
-0.140555, -0.1138305, -2.653885, 1, 1, 1, 1, 1,
-0.1404215, -0.3765678, -2.698426, 1, 1, 1, 1, 1,
-0.138196, 0.08338426, -0.2493213, 0, 0, 1, 1, 1,
-0.1376474, -0.9050373, -3.178546, 1, 0, 0, 1, 1,
-0.1335102, -1.140114, -3.418704, 1, 0, 0, 1, 1,
-0.1297218, 1.785344, -0.1774376, 1, 0, 0, 1, 1,
-0.1215214, 0.7054896, 1.579271, 1, 0, 0, 1, 1,
-0.1199526, 0.8044348, -0.2724179, 1, 0, 0, 1, 1,
-0.1182521, 0.5240742, 0.5972151, 0, 0, 0, 1, 1,
-0.1125511, 0.7418616, -0.02324053, 0, 0, 0, 1, 1,
-0.1086362, -1.128431, -1.885467, 0, 0, 0, 1, 1,
-0.1065843, -0.8706656, -2.690718, 0, 0, 0, 1, 1,
-0.1014585, -0.9247115, -1.831517, 0, 0, 0, 1, 1,
-0.09900995, 0.002940958, -1.689798, 0, 0, 0, 1, 1,
-0.09218337, 1.730154, -0.1139743, 0, 0, 0, 1, 1,
-0.08541679, -1.399877, -2.45975, 1, 1, 1, 1, 1,
-0.080005, -0.6951548, -2.733767, 1, 1, 1, 1, 1,
-0.07931948, -0.3416602, -2.625619, 1, 1, 1, 1, 1,
-0.07807735, -0.9849614, -2.5492, 1, 1, 1, 1, 1,
-0.07688172, -0.5551235, -0.9369246, 1, 1, 1, 1, 1,
-0.07657405, 1.856526, -0.1269397, 1, 1, 1, 1, 1,
-0.07412986, -0.09843825, -1.95372, 1, 1, 1, 1, 1,
-0.07033947, -0.7343453, -2.761362, 1, 1, 1, 1, 1,
-0.06973459, 2.121332, -0.3462679, 1, 1, 1, 1, 1,
-0.06212146, -0.2185198, -1.613053, 1, 1, 1, 1, 1,
-0.06210649, 0.3691028, -0.2853887, 1, 1, 1, 1, 1,
-0.05902292, -1.096022, -2.388039, 1, 1, 1, 1, 1,
-0.05361819, 0.1476879, 0.6892631, 1, 1, 1, 1, 1,
-0.05250649, -1.210895, -2.770757, 1, 1, 1, 1, 1,
-0.05207765, -0.4692659, -1.956617, 1, 1, 1, 1, 1,
-0.05126936, 1.153513, -0.3043671, 0, 0, 1, 1, 1,
-0.04811503, 0.2161678, -0.5248321, 1, 0, 0, 1, 1,
-0.03815737, -0.158009, -2.518347, 1, 0, 0, 1, 1,
-0.03577401, -1.288976, -4.128946, 1, 0, 0, 1, 1,
-0.03408045, 0.3318309, -1.170217, 1, 0, 0, 1, 1,
-0.03168435, 0.6655208, 2.096499, 1, 0, 0, 1, 1,
-0.03111102, -0.6143505, -3.793991, 0, 0, 0, 1, 1,
-0.03082717, 2.564451, -0.8957092, 0, 0, 0, 1, 1,
-0.02973172, 1.373731, -0.8102386, 0, 0, 0, 1, 1,
-0.02850358, -0.7005765, -2.750588, 0, 0, 0, 1, 1,
-0.0283999, -1.890521, -2.45371, 0, 0, 0, 1, 1,
-0.02114285, 0.6391143, 0.7803043, 0, 0, 0, 1, 1,
-0.02068113, 0.5280449, -0.2228814, 0, 0, 0, 1, 1,
-0.01670529, 1.160795, -0.4782209, 1, 1, 1, 1, 1,
-0.01306536, 0.5404173, -0.8158834, 1, 1, 1, 1, 1,
-0.001651948, 1.394848, 0.2144292, 1, 1, 1, 1, 1,
0.0002048179, -0.2825599, 3.947627, 1, 1, 1, 1, 1,
0.0003222055, 0.7948598, 0.4977525, 1, 1, 1, 1, 1,
0.001396152, -0.9520071, 3.607077, 1, 1, 1, 1, 1,
0.003627622, 0.1893559, -0.8052691, 1, 1, 1, 1, 1,
0.004640368, -0.1853663, 4.331094, 1, 1, 1, 1, 1,
0.008022556, -1.054618, 5.061026, 1, 1, 1, 1, 1,
0.01087232, -1.199257, 0.9075678, 1, 1, 1, 1, 1,
0.01527548, 0.8073385, 0.2221389, 1, 1, 1, 1, 1,
0.01763926, -0.5355053, 1.8045, 1, 1, 1, 1, 1,
0.01788928, -1.011724, 2.949992, 1, 1, 1, 1, 1,
0.01910817, -0.7213014, 4.452793, 1, 1, 1, 1, 1,
0.02011081, 0.2934447, -1.372004, 1, 1, 1, 1, 1,
0.02066106, 0.6721845, 0.298692, 0, 0, 1, 1, 1,
0.02500434, -0.1879416, 2.511631, 1, 0, 0, 1, 1,
0.02690158, 1.170818, -0.1427895, 1, 0, 0, 1, 1,
0.02907978, 0.2983131, -0.3131222, 1, 0, 0, 1, 1,
0.02945958, 0.5630594, -1.768356, 1, 0, 0, 1, 1,
0.0300977, 0.6528651, -0.2101913, 1, 0, 0, 1, 1,
0.03191781, 0.03026394, 1.472965, 0, 0, 0, 1, 1,
0.033113, 1.619282, -0.7291467, 0, 0, 0, 1, 1,
0.04199815, 1.617506, -1.049524, 0, 0, 0, 1, 1,
0.04380943, 0.07002764, 3.110323, 0, 0, 0, 1, 1,
0.0468553, 0.546086, -1.095217, 0, 0, 0, 1, 1,
0.04703911, 1.267043, 0.8141584, 0, 0, 0, 1, 1,
0.04974457, 0.1486869, 0.3577473, 0, 0, 0, 1, 1,
0.05225732, -1.858746, 3.591854, 1, 1, 1, 1, 1,
0.05905567, 0.4655156, 1.783486, 1, 1, 1, 1, 1,
0.06019907, -0.01833739, 2.500153, 1, 1, 1, 1, 1,
0.06119388, 2.195665, 0.107362, 1, 1, 1, 1, 1,
0.06183252, -1.625592, 3.189469, 1, 1, 1, 1, 1,
0.06578863, 0.5681443, -0.03764104, 1, 1, 1, 1, 1,
0.07412396, 0.259378, 1.349303, 1, 1, 1, 1, 1,
0.08008564, 2.188845, -1.254756, 1, 1, 1, 1, 1,
0.08302371, 0.9960887, -0.3985019, 1, 1, 1, 1, 1,
0.08501109, -1.576115, 2.267112, 1, 1, 1, 1, 1,
0.08904216, -0.208982, 1.771564, 1, 1, 1, 1, 1,
0.09082724, -1.212162, 2.443304, 1, 1, 1, 1, 1,
0.09219017, -0.7257748, 2.744411, 1, 1, 1, 1, 1,
0.09341823, -1.022657, 2.653044, 1, 1, 1, 1, 1,
0.1017604, 2.324489, -1.280441, 1, 1, 1, 1, 1,
0.1075779, -0.5457937, 4.124611, 0, 0, 1, 1, 1,
0.1080213, -0.07724839, 2.888328, 1, 0, 0, 1, 1,
0.1154421, 0.1998107, 0.9283198, 1, 0, 0, 1, 1,
0.1163774, 0.1382062, 2.240183, 1, 0, 0, 1, 1,
0.1168463, -0.990311, 1.155503, 1, 0, 0, 1, 1,
0.1188588, 0.006903958, 2.051433, 1, 0, 0, 1, 1,
0.12082, 0.7952819, -1.957522, 0, 0, 0, 1, 1,
0.120852, 0.3992447, 1.219634, 0, 0, 0, 1, 1,
0.1210231, -0.04600953, 0.8432881, 0, 0, 0, 1, 1,
0.1221014, 0.2266409, 0.4565545, 0, 0, 0, 1, 1,
0.1244482, 0.437871, -0.8286493, 0, 0, 0, 1, 1,
0.1248887, -0.2978899, 1.800044, 0, 0, 0, 1, 1,
0.1251772, 0.3548847, -0.1234991, 0, 0, 0, 1, 1,
0.1282804, -0.6344249, 2.756115, 1, 1, 1, 1, 1,
0.1287533, 0.6449745, 0.283987, 1, 1, 1, 1, 1,
0.1305441, 0.9711094, 0.8790804, 1, 1, 1, 1, 1,
0.1365985, -0.4183044, 2.111393, 1, 1, 1, 1, 1,
0.1385173, 0.100622, -0.07270899, 1, 1, 1, 1, 1,
0.1395944, -0.5866364, 2.803299, 1, 1, 1, 1, 1,
0.1411619, 0.8139746, 0.8852154, 1, 1, 1, 1, 1,
0.1424861, -0.03419574, 2.264108, 1, 1, 1, 1, 1,
0.1430067, 0.009180036, 3.072263, 1, 1, 1, 1, 1,
0.1456841, 0.1081577, -0.2309143, 1, 1, 1, 1, 1,
0.1474313, -0.7341323, 3.420006, 1, 1, 1, 1, 1,
0.1486811, -0.7581986, 2.644321, 1, 1, 1, 1, 1,
0.1493507, -1.587665, 2.742323, 1, 1, 1, 1, 1,
0.1502088, -0.8494408, 2.345028, 1, 1, 1, 1, 1,
0.1505647, 0.6409733, -0.1100441, 1, 1, 1, 1, 1,
0.1533004, 0.306219, -1.322321, 0, 0, 1, 1, 1,
0.1538346, 1.447886, 0.001476079, 1, 0, 0, 1, 1,
0.1588502, -0.5136049, 2.283108, 1, 0, 0, 1, 1,
0.1633291, 0.9192059, 1.355924, 1, 0, 0, 1, 1,
0.1646046, -0.1794624, 3.136818, 1, 0, 0, 1, 1,
0.1656479, 0.1646125, -0.3159545, 1, 0, 0, 1, 1,
0.1675904, -0.4809073, 2.943501, 0, 0, 0, 1, 1,
0.1762484, 2.088242, -0.6094786, 0, 0, 0, 1, 1,
0.1792551, 0.9528948, -0.002726301, 0, 0, 0, 1, 1,
0.1808975, 0.03896183, 0.5855584, 0, 0, 0, 1, 1,
0.181899, 1.218783, 1.592719, 0, 0, 0, 1, 1,
0.1823163, 1.108509, 1.830389, 0, 0, 0, 1, 1,
0.1895331, 0.9171735, 1.137936, 0, 0, 0, 1, 1,
0.1917707, 1.596646, 0.4763013, 1, 1, 1, 1, 1,
0.1935103, -0.9626521, 2.490846, 1, 1, 1, 1, 1,
0.1983138, 1.252548, -0.2376793, 1, 1, 1, 1, 1,
0.206807, -1.31001, 2.218729, 1, 1, 1, 1, 1,
0.2102858, 1.604246, 0.7470856, 1, 1, 1, 1, 1,
0.2154948, -0.5307769, 3.764352, 1, 1, 1, 1, 1,
0.2159643, -1.497206, 3.564815, 1, 1, 1, 1, 1,
0.2162238, 0.04792162, 1.153876, 1, 1, 1, 1, 1,
0.2200926, -2.112468, 3.969757, 1, 1, 1, 1, 1,
0.2210734, 0.5794907, -1.419205, 1, 1, 1, 1, 1,
0.2213869, 0.7552355, 0.1639246, 1, 1, 1, 1, 1,
0.2217691, -1.20096, 2.416348, 1, 1, 1, 1, 1,
0.2238293, -0.3911547, 3.485633, 1, 1, 1, 1, 1,
0.2250195, -0.7203078, 1.750273, 1, 1, 1, 1, 1,
0.2304227, 2.013529, 0.07503172, 1, 1, 1, 1, 1,
0.2323298, 0.6044006, 1.901457, 0, 0, 1, 1, 1,
0.2330743, 0.2042422, 0.7003648, 1, 0, 0, 1, 1,
0.2357737, -1.146553, 2.923963, 1, 0, 0, 1, 1,
0.2373657, -0.5160843, 1.680777, 1, 0, 0, 1, 1,
0.2420713, -0.6340497, 0.7719158, 1, 0, 0, 1, 1,
0.2427513, 0.484902, 1.996074, 1, 0, 0, 1, 1,
0.2451236, 0.9490092, 0.2194409, 0, 0, 0, 1, 1,
0.2497936, 1.368559, 0.227099, 0, 0, 0, 1, 1,
0.2530058, 1.471313, -1.453385, 0, 0, 0, 1, 1,
0.2531731, 0.4806592, 0.9054424, 0, 0, 0, 1, 1,
0.259624, -0.8915354, 3.361923, 0, 0, 0, 1, 1,
0.2609064, 0.5972478, 0.1864868, 0, 0, 0, 1, 1,
0.2640022, -1.241958, 4.736436, 0, 0, 0, 1, 1,
0.26445, 0.5292005, -0.03038212, 1, 1, 1, 1, 1,
0.2688137, 1.658744, 0.7630891, 1, 1, 1, 1, 1,
0.2705816, -0.2786252, 2.147836, 1, 1, 1, 1, 1,
0.2792079, -0.3328834, 2.609214, 1, 1, 1, 1, 1,
0.2815656, 1.038232, 0.9246061, 1, 1, 1, 1, 1,
0.283251, 0.1680916, 1.055479, 1, 1, 1, 1, 1,
0.2844166, -0.1515484, 1.149843, 1, 1, 1, 1, 1,
0.2851463, -0.5904656, 3.160386, 1, 1, 1, 1, 1,
0.2877888, 0.09204789, 2.41145, 1, 1, 1, 1, 1,
0.2905397, 0.6852595, 1.173083, 1, 1, 1, 1, 1,
0.2916428, 1.731461, 0.4442367, 1, 1, 1, 1, 1,
0.29394, 0.5556594, -0.7357267, 1, 1, 1, 1, 1,
0.2956429, -0.1289922, -0.3279538, 1, 1, 1, 1, 1,
0.2995462, -0.337145, 3.234654, 1, 1, 1, 1, 1,
0.3104056, -1.133407, 2.67807, 1, 1, 1, 1, 1,
0.3128065, -0.3007894, 4.315743, 0, 0, 1, 1, 1,
0.3145472, -0.1849457, 3.539077, 1, 0, 0, 1, 1,
0.3149072, -1.769143, 3.270691, 1, 0, 0, 1, 1,
0.3165747, 0.4692298, -0.2649185, 1, 0, 0, 1, 1,
0.3206125, 2.109103, -0.4855868, 1, 0, 0, 1, 1,
0.3210693, -0.8925061, 3.344291, 1, 0, 0, 1, 1,
0.3316086, -0.4719933, 2.761333, 0, 0, 0, 1, 1,
0.3405493, -0.7439608, 2.330652, 0, 0, 0, 1, 1,
0.3421367, -0.2763737, 3.049743, 0, 0, 0, 1, 1,
0.3440327, -0.07947029, 1.785317, 0, 0, 0, 1, 1,
0.3454372, 0.6381772, -0.8667101, 0, 0, 0, 1, 1,
0.3477465, -0.618952, 3.777127, 0, 0, 0, 1, 1,
0.3491615, 0.06400397, 0.9336141, 0, 0, 0, 1, 1,
0.3516432, -1.451561, 1.426296, 1, 1, 1, 1, 1,
0.3540705, -0.3100784, 4.14973, 1, 1, 1, 1, 1,
0.3552389, 0.3112437, 1.08345, 1, 1, 1, 1, 1,
0.3621799, 0.2586907, 3.220391, 1, 1, 1, 1, 1,
0.3642262, -1.053532, 3.551253, 1, 1, 1, 1, 1,
0.3643371, 0.3120448, -0.4938068, 1, 1, 1, 1, 1,
0.3677289, -0.691987, 3.215389, 1, 1, 1, 1, 1,
0.3693651, 1.251586, -0.3894146, 1, 1, 1, 1, 1,
0.371028, 0.001053618, 0.6903715, 1, 1, 1, 1, 1,
0.3718552, -0.9936561, 1.682753, 1, 1, 1, 1, 1,
0.3763284, 1.889452, 2.208805, 1, 1, 1, 1, 1,
0.3764299, -0.07656848, 2.040291, 1, 1, 1, 1, 1,
0.3830009, -0.04395047, 0.5559293, 1, 1, 1, 1, 1,
0.3863252, 0.240652, 1.873439, 1, 1, 1, 1, 1,
0.3867413, 0.9775275, -0.3109031, 1, 1, 1, 1, 1,
0.3900777, -1.254691, 4.052676, 0, 0, 1, 1, 1,
0.3904814, 0.7007843, 1.173749, 1, 0, 0, 1, 1,
0.3921013, -0.3366178, 0.9569414, 1, 0, 0, 1, 1,
0.3998097, 0.8311467, 1.132409, 1, 0, 0, 1, 1,
0.4032013, 0.7883008, 1.205892, 1, 0, 0, 1, 1,
0.406736, 1.355424, 1.377843, 1, 0, 0, 1, 1,
0.4123021, 0.07600146, 2.075202, 0, 0, 0, 1, 1,
0.4193399, 0.2427498, 0.1542281, 0, 0, 0, 1, 1,
0.4196077, 1.260417, 0.7396435, 0, 0, 0, 1, 1,
0.4244683, 0.153675, 2.315676, 0, 0, 0, 1, 1,
0.4256113, 0.1965334, 1.35466, 0, 0, 0, 1, 1,
0.4270885, 2.495419, -0.7208599, 0, 0, 0, 1, 1,
0.4275247, 0.0833205, 2.442006, 0, 0, 0, 1, 1,
0.4300513, 0.3492289, 0.644979, 1, 1, 1, 1, 1,
0.4307571, 0.6738134, 0.1173007, 1, 1, 1, 1, 1,
0.4319618, 1.797469, 0.2479308, 1, 1, 1, 1, 1,
0.4324356, -0.6386313, 4.069842, 1, 1, 1, 1, 1,
0.43367, 0.9159547, 1.245118, 1, 1, 1, 1, 1,
0.4358961, 0.7683874, -0.3396763, 1, 1, 1, 1, 1,
0.4395601, 0.8641555, 0.3063743, 1, 1, 1, 1, 1,
0.4418013, 0.4577762, -0.5788529, 1, 1, 1, 1, 1,
0.4448064, -0.8922679, 2.388615, 1, 1, 1, 1, 1,
0.4480096, 1.49237, -1.440258, 1, 1, 1, 1, 1,
0.4547199, -0.9442765, 3.340709, 1, 1, 1, 1, 1,
0.4563233, 0.9173016, 0.5274249, 1, 1, 1, 1, 1,
0.4673288, -0.4683281, 2.101269, 1, 1, 1, 1, 1,
0.4675594, 1.502265, 0.4578741, 1, 1, 1, 1, 1,
0.469256, 0.7596949, -0.5119988, 1, 1, 1, 1, 1,
0.4734726, 1.480521, -0.3596421, 0, 0, 1, 1, 1,
0.4782268, 0.2620207, -0.9157175, 1, 0, 0, 1, 1,
0.4792635, -0.05616377, 2.219974, 1, 0, 0, 1, 1,
0.4797347, 0.1591743, -1.198471, 1, 0, 0, 1, 1,
0.4833794, -0.2558702, 2.013682, 1, 0, 0, 1, 1,
0.4873749, 1.092265, 1.139648, 1, 0, 0, 1, 1,
0.4887185, -0.8348012, 3.818637, 0, 0, 0, 1, 1,
0.4942333, -0.8688117, 2.091008, 0, 0, 0, 1, 1,
0.4942491, -2.042216, 3.991152, 0, 0, 0, 1, 1,
0.4981116, -0.6043613, 2.966992, 0, 0, 0, 1, 1,
0.498536, 0.07320977, 0.1472504, 0, 0, 0, 1, 1,
0.498826, -1.131064, 1.289544, 0, 0, 0, 1, 1,
0.5052615, -0.1526803, 2.041795, 0, 0, 0, 1, 1,
0.5078105, -0.3980476, 0.939961, 1, 1, 1, 1, 1,
0.5132113, -1.712631, 1.647017, 1, 1, 1, 1, 1,
0.5158879, -0.3152682, 4.140896, 1, 1, 1, 1, 1,
0.5164918, -0.004971503, 2.932788, 1, 1, 1, 1, 1,
0.517511, 1.271424, 0.977991, 1, 1, 1, 1, 1,
0.5219303, 0.4839972, 2.612353, 1, 1, 1, 1, 1,
0.5220532, 0.541379, 1.269483, 1, 1, 1, 1, 1,
0.5224176, -0.9201753, 2.888168, 1, 1, 1, 1, 1,
0.5290353, -1.549568, 3.398915, 1, 1, 1, 1, 1,
0.5332003, 1.141798, 0.7898476, 1, 1, 1, 1, 1,
0.5389593, -0.1829385, 2.656644, 1, 1, 1, 1, 1,
0.5428759, 0.04541186, 1.465375, 1, 1, 1, 1, 1,
0.5435846, -0.2019096, 1.129042, 1, 1, 1, 1, 1,
0.5436559, 0.9140072, 1.363624, 1, 1, 1, 1, 1,
0.547388, -0.4112687, 3.115855, 1, 1, 1, 1, 1,
0.5490471, 0.6206089, 1.467186, 0, 0, 1, 1, 1,
0.5491568, -0.5562627, 3.531435, 1, 0, 0, 1, 1,
0.5503877, 0.4365456, 0.006575424, 1, 0, 0, 1, 1,
0.5512067, 0.154352, 3.044882, 1, 0, 0, 1, 1,
0.5531688, 1.121574, -0.2521553, 1, 0, 0, 1, 1,
0.554421, 1.966625, 0.7900559, 1, 0, 0, 1, 1,
0.5600033, -0.705506, 2.46947, 0, 0, 0, 1, 1,
0.5611238, -1.44719, 1.567906, 0, 0, 0, 1, 1,
0.5638673, 0.8836458, -0.4231768, 0, 0, 0, 1, 1,
0.5650459, -1.494146, 1.344911, 0, 0, 0, 1, 1,
0.5672798, -0.5440531, 1.704285, 0, 0, 0, 1, 1,
0.5680506, 1.531887, -1.210329, 0, 0, 0, 1, 1,
0.5703526, -0.09462837, 2.691549, 0, 0, 0, 1, 1,
0.5827818, 0.6462285, 0.8198271, 1, 1, 1, 1, 1,
0.582949, 0.2002242, 1.844682, 1, 1, 1, 1, 1,
0.584324, 1.497996, 0.5112213, 1, 1, 1, 1, 1,
0.5846455, 0.3448422, 2.69632, 1, 1, 1, 1, 1,
0.585645, -1.127327, 1.521512, 1, 1, 1, 1, 1,
0.5865604, -0.3785138, 2.278288, 1, 1, 1, 1, 1,
0.5903593, 0.241194, 2.841098, 1, 1, 1, 1, 1,
0.5910514, -2.735725, 2.92733, 1, 1, 1, 1, 1,
0.5973741, -0.5879613, 1.956643, 1, 1, 1, 1, 1,
0.6052648, -0.951901, 4.806362, 1, 1, 1, 1, 1,
0.6089057, -1.262559, 3.046015, 1, 1, 1, 1, 1,
0.6122608, 0.7057648, 0.665022, 1, 1, 1, 1, 1,
0.6263561, -2.194726, 3.098669, 1, 1, 1, 1, 1,
0.6299782, 0.714, 1.141773, 1, 1, 1, 1, 1,
0.6334044, 0.5591911, 1.689752, 1, 1, 1, 1, 1,
0.6334845, 1.25895, 0.08308078, 0, 0, 1, 1, 1,
0.6352726, 0.06330421, 1.511076, 1, 0, 0, 1, 1,
0.6394356, 0.8719485, -0.7798784, 1, 0, 0, 1, 1,
0.6436995, -0.9753326, 0.220954, 1, 0, 0, 1, 1,
0.6439314, -2.133169, 1.680456, 1, 0, 0, 1, 1,
0.6461504, -0.737978, 3.599458, 1, 0, 0, 1, 1,
0.6498725, 0.006194323, 1.132668, 0, 0, 0, 1, 1,
0.6501521, 1.278531, -1.127527, 0, 0, 0, 1, 1,
0.6524879, -0.4481758, 3.232232, 0, 0, 0, 1, 1,
0.6537522, 0.09491895, 0.3777413, 0, 0, 0, 1, 1,
0.6539448, 1.223312, -0.1227774, 0, 0, 0, 1, 1,
0.658966, -0.5693345, 4.229677, 0, 0, 0, 1, 1,
0.6616391, -2.199856, 3.52565, 0, 0, 0, 1, 1,
0.6673918, 0.7853155, -0.8418019, 1, 1, 1, 1, 1,
0.6698213, -0.8429726, 0.6336951, 1, 1, 1, 1, 1,
0.6753268, 0.8990457, 1.119898, 1, 1, 1, 1, 1,
0.6805662, -0.4543355, 1.967211, 1, 1, 1, 1, 1,
0.6836403, -0.5398758, 1.009211, 1, 1, 1, 1, 1,
0.6840572, 0.5030187, 1.256108, 1, 1, 1, 1, 1,
0.6846588, -1.795702, 4.746619, 1, 1, 1, 1, 1,
0.6854771, 1.451456, 3.272502, 1, 1, 1, 1, 1,
0.6866189, 0.4758173, 0.7795893, 1, 1, 1, 1, 1,
0.6894929, 0.4059239, -0.1233767, 1, 1, 1, 1, 1,
0.6901541, -0.8156847, 2.219054, 1, 1, 1, 1, 1,
0.6929232, -1.810262, 2.417806, 1, 1, 1, 1, 1,
0.6939513, 0.4205628, 0.9585336, 1, 1, 1, 1, 1,
0.7049305, 0.7000353, 0.07676569, 1, 1, 1, 1, 1,
0.7064023, 0.9766799, 1.867409, 1, 1, 1, 1, 1,
0.7078109, 1.235497, -1.287189, 0, 0, 1, 1, 1,
0.7100442, -0.506893, 2.521563, 1, 0, 0, 1, 1,
0.7129591, 1.082463, 0.4486359, 1, 0, 0, 1, 1,
0.7130258, 1.542391, 0.2400474, 1, 0, 0, 1, 1,
0.7148498, -2.755683, 1.262037, 1, 0, 0, 1, 1,
0.7154232, 1.049172, 0.1882724, 1, 0, 0, 1, 1,
0.7184942, 1.158898, 0.6695493, 0, 0, 0, 1, 1,
0.7207026, -0.8864143, 2.294196, 0, 0, 0, 1, 1,
0.7274926, 1.523823, 2.260459, 0, 0, 0, 1, 1,
0.7276834, 0.4965411, 1.168881, 0, 0, 0, 1, 1,
0.731379, 0.1813141, 0.8407215, 0, 0, 0, 1, 1,
0.7350399, 1.27625, 1.102252, 0, 0, 0, 1, 1,
0.7368997, -0.5936878, 0.1840073, 0, 0, 0, 1, 1,
0.7428288, 0.9929526, 1.384089, 1, 1, 1, 1, 1,
0.7451191, 0.5060634, 2.021788, 1, 1, 1, 1, 1,
0.7511653, 1.468989, -0.2175385, 1, 1, 1, 1, 1,
0.756963, 2.473787, 1.007659, 1, 1, 1, 1, 1,
0.7570734, 1.145722, 0.04156608, 1, 1, 1, 1, 1,
0.757517, 0.3926491, 0.8214965, 1, 1, 1, 1, 1,
0.7583024, 1.414415, -0.6307862, 1, 1, 1, 1, 1,
0.7611037, -0.2322772, 1.886196, 1, 1, 1, 1, 1,
0.7614264, -1.77897, 4.068503, 1, 1, 1, 1, 1,
0.7660639, 0.7778001, 1.457388, 1, 1, 1, 1, 1,
0.7662338, -0.9434286, 2.627073, 1, 1, 1, 1, 1,
0.7664735, -0.2333886, 2.203592, 1, 1, 1, 1, 1,
0.7693284, -1.066611, 2.654776, 1, 1, 1, 1, 1,
0.771817, -0.181483, 2.565112, 1, 1, 1, 1, 1,
0.7724125, -0.8878352, 0.8885743, 1, 1, 1, 1, 1,
0.7724915, -1.493366, 3.121018, 0, 0, 1, 1, 1,
0.7757404, -0.6702091, 2.674895, 1, 0, 0, 1, 1,
0.7826504, -0.2412603, 0.4475495, 1, 0, 0, 1, 1,
0.7884747, -0.8158885, 2.255397, 1, 0, 0, 1, 1,
0.7887757, 0.3567427, 1.276992, 1, 0, 0, 1, 1,
0.7908452, 0.9124564, -0.2937444, 1, 0, 0, 1, 1,
0.793287, -2.030233, 2.695459, 0, 0, 0, 1, 1,
0.7941688, 0.4458321, -1.137811, 0, 0, 0, 1, 1,
0.8026866, 0.4544748, 0.1461157, 0, 0, 0, 1, 1,
0.809019, -0.3167413, 0.9243506, 0, 0, 0, 1, 1,
0.8092797, 1.709153, -0.02278085, 0, 0, 0, 1, 1,
0.8267485, -2.024037, 1.320847, 0, 0, 0, 1, 1,
0.8294675, 0.9607511, 1.560169, 0, 0, 0, 1, 1,
0.8299417, 0.04721413, 3.384045, 1, 1, 1, 1, 1,
0.8330779, 0.354336, 1.38126, 1, 1, 1, 1, 1,
0.8330801, 0.3339448, 2.519337, 1, 1, 1, 1, 1,
0.833513, 1.079564, 1.219603, 1, 1, 1, 1, 1,
0.8401596, 0.1747707, 2.794033, 1, 1, 1, 1, 1,
0.8424628, 0.5002435, 1.256198, 1, 1, 1, 1, 1,
0.8486843, 0.3735573, 1.293735, 1, 1, 1, 1, 1,
0.850403, -0.3986959, 3.522326, 1, 1, 1, 1, 1,
0.8549629, -1.563559, 3.973187, 1, 1, 1, 1, 1,
0.8571769, -0.2166938, 3.673796, 1, 1, 1, 1, 1,
0.8582771, -0.7168408, 3.382822, 1, 1, 1, 1, 1,
0.8605982, -1.947557, 3.578819, 1, 1, 1, 1, 1,
0.8610575, 0.2247937, 1.135906, 1, 1, 1, 1, 1,
0.8616452, -0.1583049, 1.854357, 1, 1, 1, 1, 1,
0.8657807, 0.3438288, -0.6905053, 1, 1, 1, 1, 1,
0.8730634, 0.05352543, 0.8569248, 0, 0, 1, 1, 1,
0.8836406, 1.769505, 0.9951729, 1, 0, 0, 1, 1,
0.8852241, 0.04968468, 0.2101524, 1, 0, 0, 1, 1,
0.8883848, 0.8471765, 1.362484, 1, 0, 0, 1, 1,
0.8894652, 1.08355, -0.1438156, 1, 0, 0, 1, 1,
0.9068256, -0.2946217, 3.237686, 1, 0, 0, 1, 1,
0.9146843, -0.2822067, 1.87217, 0, 0, 0, 1, 1,
0.9158552, -0.3600985, 3.120403, 0, 0, 0, 1, 1,
0.9165542, 0.6485639, 1.073094, 0, 0, 0, 1, 1,
0.9209532, 0.7570645, 0.2680904, 0, 0, 0, 1, 1,
0.9232947, 0.7332948, -0.8260448, 0, 0, 0, 1, 1,
0.9308048, 1.1328, 0.8938353, 0, 0, 0, 1, 1,
0.9360713, -0.0445322, 2.316881, 0, 0, 0, 1, 1,
0.9435237, -1.152456, 2.447083, 1, 1, 1, 1, 1,
0.944292, -0.6795107, 2.919028, 1, 1, 1, 1, 1,
0.9528498, 0.7764493, 0.8221301, 1, 1, 1, 1, 1,
0.9571418, 0.3318898, 1.770805, 1, 1, 1, 1, 1,
0.9608944, -0.9677843, 1.72466, 1, 1, 1, 1, 1,
0.9727051, -0.3221281, 0.5609354, 1, 1, 1, 1, 1,
0.9882519, 0.6810476, 1.684703, 1, 1, 1, 1, 1,
0.9932123, 0.8107751, 0.6436563, 1, 1, 1, 1, 1,
1.000989, -0.5255187, 2.810309, 1, 1, 1, 1, 1,
1.019278, -1.192215, 3.197689, 1, 1, 1, 1, 1,
1.021618, 1.214389, 0.4344084, 1, 1, 1, 1, 1,
1.024358, 0.4670269, 1.460506, 1, 1, 1, 1, 1,
1.02768, -0.3393726, 2.167683, 1, 1, 1, 1, 1,
1.031192, 0.9158291, 1.98929, 1, 1, 1, 1, 1,
1.042204, -0.829128, 2.574802, 1, 1, 1, 1, 1,
1.042511, -0.9289646, 1.622517, 0, 0, 1, 1, 1,
1.043364, -0.1636281, 0.7096704, 1, 0, 0, 1, 1,
1.048482, 0.5486194, 0.1334669, 1, 0, 0, 1, 1,
1.049432, 0.7038226, -1.188426, 1, 0, 0, 1, 1,
1.052143, 1.403091, -0.3895066, 1, 0, 0, 1, 1,
1.058787, 0.02854635, -0.9976732, 1, 0, 0, 1, 1,
1.061539, 0.3790888, 2.082237, 0, 0, 0, 1, 1,
1.070249, 1.51124, 1.003516, 0, 0, 0, 1, 1,
1.070426, 1.375275, -0.451361, 0, 0, 0, 1, 1,
1.080016, -0.8106622, -0.236802, 0, 0, 0, 1, 1,
1.087384, 1.067026, 1.308235, 0, 0, 0, 1, 1,
1.090435, -0.7558534, 1.701631, 0, 0, 0, 1, 1,
1.093788, 0.5880754, 1.751595, 0, 0, 0, 1, 1,
1.095997, 0.3707893, -0.3509399, 1, 1, 1, 1, 1,
1.098554, 0.9576064, 0.2881047, 1, 1, 1, 1, 1,
1.102278, 0.6283965, 1.483442, 1, 1, 1, 1, 1,
1.102332, -0.1407451, 0.5831369, 1, 1, 1, 1, 1,
1.105036, -0.8851286, 2.249464, 1, 1, 1, 1, 1,
1.105981, -0.8311757, 2.155233, 1, 1, 1, 1, 1,
1.108176, 0.009284543, -0.3899181, 1, 1, 1, 1, 1,
1.112866, -2.030282, 2.452603, 1, 1, 1, 1, 1,
1.113929, 0.8280188, 1.114476, 1, 1, 1, 1, 1,
1.12162, 0.7245327, 0.3148163, 1, 1, 1, 1, 1,
1.122688, 0.4049625, 2.694849, 1, 1, 1, 1, 1,
1.124148, -2.602782, 3.655077, 1, 1, 1, 1, 1,
1.133186, 0.4939097, 2.221652, 1, 1, 1, 1, 1,
1.140803, -0.2714829, 3.135188, 1, 1, 1, 1, 1,
1.153231, -1.164377, 3.135076, 1, 1, 1, 1, 1,
1.157326, 0.03040727, 1.799837, 0, 0, 1, 1, 1,
1.16322, 0.2383144, 2.473284, 1, 0, 0, 1, 1,
1.164387, -1.74006, 3.479268, 1, 0, 0, 1, 1,
1.164409, -0.756781, 2.147874, 1, 0, 0, 1, 1,
1.165895, 0.7885631, 0.9264602, 1, 0, 0, 1, 1,
1.167047, 0.1901035, 1.005257, 1, 0, 0, 1, 1,
1.167357, 2.011449, 0.4042963, 0, 0, 0, 1, 1,
1.172365, 0.1489883, 0.9314948, 0, 0, 0, 1, 1,
1.176857, -0.7527891, 0.3028025, 0, 0, 0, 1, 1,
1.186592, -0.9014148, 0.5813284, 0, 0, 0, 1, 1,
1.1881, -0.9663613, 4.110027, 0, 0, 0, 1, 1,
1.199779, 1.041133, 0.8746301, 0, 0, 0, 1, 1,
1.202831, 1.309642, 1.34876, 0, 0, 0, 1, 1,
1.205524, 0.3244865, 1.296587, 1, 1, 1, 1, 1,
1.205624, 0.02464739, 0.02976101, 1, 1, 1, 1, 1,
1.206242, 0.1045503, 0.7579568, 1, 1, 1, 1, 1,
1.206489, -0.6342561, 1.531438, 1, 1, 1, 1, 1,
1.217122, -1.733963, 2.579892, 1, 1, 1, 1, 1,
1.21929, 0.5251057, 2.09635, 1, 1, 1, 1, 1,
1.232325, 1.223794, 2.250373, 1, 1, 1, 1, 1,
1.236396, -1.206438, 1.293982, 1, 1, 1, 1, 1,
1.239366, -0.8691016, 2.238275, 1, 1, 1, 1, 1,
1.242128, -1.841778, 3.746465, 1, 1, 1, 1, 1,
1.242737, -0.6352416, 1.93572, 1, 1, 1, 1, 1,
1.254051, 0.3130954, 1.941206, 1, 1, 1, 1, 1,
1.259638, -1.406991, 4.421171, 1, 1, 1, 1, 1,
1.259927, 0.1437572, 1.852546, 1, 1, 1, 1, 1,
1.261806, -0.05122931, 3.514746, 1, 1, 1, 1, 1,
1.263133, -0.7250006, 1.690717, 0, 0, 1, 1, 1,
1.271144, 1.125851, 1.957667, 1, 0, 0, 1, 1,
1.282319, 0.2242199, 3.232232, 1, 0, 0, 1, 1,
1.286395, -1.463675, 2.717162, 1, 0, 0, 1, 1,
1.289809, 0.7279395, 0.6852607, 1, 0, 0, 1, 1,
1.293481, 0.3300475, 1.725387, 1, 0, 0, 1, 1,
1.294359, 0.26541, 3.51249, 0, 0, 0, 1, 1,
1.29472, 0.6372682, 1.773188, 0, 0, 0, 1, 1,
1.301877, -1.872224, 1.98145, 0, 0, 0, 1, 1,
1.317422, 0.07603336, 2.002021, 0, 0, 0, 1, 1,
1.317807, -0.1872523, 1.323416, 0, 0, 0, 1, 1,
1.324558, -0.1133314, 0.8827506, 0, 0, 0, 1, 1,
1.34936, 1.301439, -0.3896742, 0, 0, 0, 1, 1,
1.364674, 0.9717673, -0.7784154, 1, 1, 1, 1, 1,
1.368279, -0.225919, 1.422122, 1, 1, 1, 1, 1,
1.369269, -0.5256942, 2.65377, 1, 1, 1, 1, 1,
1.371404, -1.14924, 1.856715, 1, 1, 1, 1, 1,
1.378401, 0.2564237, 0.8778934, 1, 1, 1, 1, 1,
1.380735, 1.692496, 0.3469783, 1, 1, 1, 1, 1,
1.392097, -1.455751, 0.8344483, 1, 1, 1, 1, 1,
1.392322, 0.6883075, 1.019139, 1, 1, 1, 1, 1,
1.393696, 1.478495, 1.604549, 1, 1, 1, 1, 1,
1.40108, 0.6612531, 1.362027, 1, 1, 1, 1, 1,
1.419249, 1.170872, 0.09709705, 1, 1, 1, 1, 1,
1.426539, -1.255181, 3.776759, 1, 1, 1, 1, 1,
1.444751, 0.9706046, 1.766279, 1, 1, 1, 1, 1,
1.446969, -1.716378, 3.613771, 1, 1, 1, 1, 1,
1.448666, -1.305374, 2.528417, 1, 1, 1, 1, 1,
1.451485, 0.3659195, 2.51453, 0, 0, 1, 1, 1,
1.452588, -1.00088, 2.306142, 1, 0, 0, 1, 1,
1.455309, -0.4949257, 1.834639, 1, 0, 0, 1, 1,
1.462257, -0.4019109, 1.208631, 1, 0, 0, 1, 1,
1.464342, -1.21974, 2.887414, 1, 0, 0, 1, 1,
1.488389, -1.478329, 2.164474, 1, 0, 0, 1, 1,
1.491997, -1.000643, 3.369055, 0, 0, 0, 1, 1,
1.512803, 0.3131979, 2.505749, 0, 0, 0, 1, 1,
1.514535, 1.16483, 2.025756, 0, 0, 0, 1, 1,
1.514976, -0.1764512, -0.07623944, 0, 0, 0, 1, 1,
1.517127, -0.5383657, 2.196508, 0, 0, 0, 1, 1,
1.519897, 0.04005979, 0.4483933, 0, 0, 0, 1, 1,
1.525187, 0.8278669, 1.68537, 0, 0, 0, 1, 1,
1.543178, 0.1881882, 1.34167, 1, 1, 1, 1, 1,
1.546958, 0.477275, 1.490122, 1, 1, 1, 1, 1,
1.548797, -1.455499, 3.991834, 1, 1, 1, 1, 1,
1.564003, -0.1803448, 0.7822391, 1, 1, 1, 1, 1,
1.565174, 0.8288726, 1.155379, 1, 1, 1, 1, 1,
1.571638, -1.903012, 3.140563, 1, 1, 1, 1, 1,
1.588738, -0.403541, 2.670432, 1, 1, 1, 1, 1,
1.611475, 0.007497045, 0.7594243, 1, 1, 1, 1, 1,
1.637382, 0.8438327, 1.273944, 1, 1, 1, 1, 1,
1.639734, -0.1415369, 3.257807, 1, 1, 1, 1, 1,
1.64435, 0.1925127, 3.417619, 1, 1, 1, 1, 1,
1.659088, 0.8251535, -0.3665409, 1, 1, 1, 1, 1,
1.670049, -1.160529, 4.585831, 1, 1, 1, 1, 1,
1.680283, -0.9232938, 1.495411, 1, 1, 1, 1, 1,
1.688002, -2.595795, 1.43901, 1, 1, 1, 1, 1,
1.693149, 1.983224, -0.9626983, 0, 0, 1, 1, 1,
1.702066, 0.7359573, 1.162913, 1, 0, 0, 1, 1,
1.708999, -0.1321497, 2.514509, 1, 0, 0, 1, 1,
1.710213, -0.605222, 1.483648, 1, 0, 0, 1, 1,
1.712819, -1.594778, 2.703944, 1, 0, 0, 1, 1,
1.718199, 0.5696924, 1.442134, 1, 0, 0, 1, 1,
1.73861, -0.5992221, 3.303131, 0, 0, 0, 1, 1,
1.74739, 1.368181, 0.1235965, 0, 0, 0, 1, 1,
1.776359, 0.4188888, 1.45549, 0, 0, 0, 1, 1,
1.789393, -1.463652, 2.577327, 0, 0, 0, 1, 1,
1.790338, 0.6662487, 2.029646, 0, 0, 0, 1, 1,
1.795368, 0.04312931, 1.575851, 0, 0, 0, 1, 1,
1.796817, 1.252223, 2.62119, 0, 0, 0, 1, 1,
1.813753, -0.2391947, 0.8965886, 1, 1, 1, 1, 1,
1.829753, -0.1140842, -0.5187191, 1, 1, 1, 1, 1,
1.849468, 1.711771, -0.4762196, 1, 1, 1, 1, 1,
1.865371, 0.3273464, 0.9821269, 1, 1, 1, 1, 1,
1.870128, 0.3798835, 1.642827, 1, 1, 1, 1, 1,
1.888366, -0.2806374, 2.482274, 1, 1, 1, 1, 1,
1.948179, -0.2621575, 2.665187, 1, 1, 1, 1, 1,
1.951589, -0.9857531, 0.2209427, 1, 1, 1, 1, 1,
1.953249, -0.7123477, 1.778404, 1, 1, 1, 1, 1,
1.997513, -0.4725164, 1.888237, 1, 1, 1, 1, 1,
2.005557, -0.7307577, 1.605491, 1, 1, 1, 1, 1,
2.017075, -1.349098, 2.523667, 1, 1, 1, 1, 1,
2.032057, 1.006461, 0.1056875, 1, 1, 1, 1, 1,
2.03828, 0.01061599, 0.5586694, 1, 1, 1, 1, 1,
2.044434, -0.6591528, 2.477854, 1, 1, 1, 1, 1,
2.056955, 2.360265, 1.940791, 0, 0, 1, 1, 1,
2.079751, -0.09681629, 2.8402, 1, 0, 0, 1, 1,
2.08531, -0.02424221, 0.3900832, 1, 0, 0, 1, 1,
2.118445, -1.530431, 1.71479, 1, 0, 0, 1, 1,
2.133403, 0.8707863, 1.818471, 1, 0, 0, 1, 1,
2.140247, -0.69728, 1.163046, 1, 0, 0, 1, 1,
2.19654, 0.5239914, 1.203505, 0, 0, 0, 1, 1,
2.247792, 0.03494588, 0.6915337, 0, 0, 0, 1, 1,
2.266278, 0.8903322, 1.542021, 0, 0, 0, 1, 1,
2.332044, 0.5921908, 1.550398, 0, 0, 0, 1, 1,
2.350688, -0.4231576, 1.690948, 0, 0, 0, 1, 1,
2.398298, -0.285674, 0.3879533, 0, 0, 0, 1, 1,
2.407459, 0.2849312, 1.523529, 0, 0, 0, 1, 1,
2.43874, -0.09979175, 3.717057, 1, 1, 1, 1, 1,
2.532015, -0.9078844, 2.330781, 1, 1, 1, 1, 1,
2.678942, -1.076211, 2.809461, 1, 1, 1, 1, 1,
2.789735, -1.08005, 1.22309, 1, 1, 1, 1, 1,
2.803005, 0.2458411, -0.4315917, 1, 1, 1, 1, 1,
2.842347, 1.577302, -0.2249943, 1, 1, 1, 1, 1,
3.424287, -1.535509, 1.576846, 1, 1, 1, 1, 1
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
var radius = 9.654777;
var distance = 33.91199;
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
mvMatrix.translate( 0.2647381, 0.2591799, 0.2974205 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91199);
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
