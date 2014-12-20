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
-3.202446, 0.02082081, -1.145401, 1, 0, 0, 1,
-3.031927, 0.3857212, -3.185728, 1, 0.007843138, 0, 1,
-2.858631, 0.2174627, -0.5383682, 1, 0.01176471, 0, 1,
-2.820431, 0.288692, 0.5481714, 1, 0.01960784, 0, 1,
-2.80764, -0.08214365, -1.359995, 1, 0.02352941, 0, 1,
-2.755616, -0.3064585, -1.604351, 1, 0.03137255, 0, 1,
-2.586798, -0.3488075, -2.95284, 1, 0.03529412, 0, 1,
-2.497979, 1.183439, -0.2853999, 1, 0.04313726, 0, 1,
-2.447598, -0.02148788, -1.242396, 1, 0.04705882, 0, 1,
-2.401808, 0.2543932, 0.3847431, 1, 0.05490196, 0, 1,
-2.391244, 0.7259228, -2.833513, 1, 0.05882353, 0, 1,
-2.363173, 2.349284, -1.042174, 1, 0.06666667, 0, 1,
-2.335246, -1.174299, -0.8270559, 1, 0.07058824, 0, 1,
-2.324567, 0.7523644, 0.7535311, 1, 0.07843138, 0, 1,
-2.224708, 1.612061, -0.5292687, 1, 0.08235294, 0, 1,
-2.17743, -1.372604, -2.836513, 1, 0.09019608, 0, 1,
-2.164606, -1.333959, -0.3530053, 1, 0.09411765, 0, 1,
-2.138898, 1.005672, -1.390577, 1, 0.1019608, 0, 1,
-2.125865, 0.1882862, -2.529357, 1, 0.1098039, 0, 1,
-2.120886, -1.592092, -2.219254, 1, 0.1137255, 0, 1,
-2.120727, 0.6124015, -3.982728, 1, 0.1215686, 0, 1,
-2.107315, 0.1469363, -3.450808, 1, 0.1254902, 0, 1,
-2.066676, 0.07936098, -2.366732, 1, 0.1333333, 0, 1,
-1.989379, -0.5376228, -2.378223, 1, 0.1372549, 0, 1,
-1.942867, -1.013139, -2.489724, 1, 0.145098, 0, 1,
-1.934993, 0.6945755, 0.4511116, 1, 0.1490196, 0, 1,
-1.929646, 1.408844, -1.028711, 1, 0.1568628, 0, 1,
-1.926056, 0.5135013, -3.035973, 1, 0.1607843, 0, 1,
-1.883187, -0.655513, -3.037903, 1, 0.1686275, 0, 1,
-1.876306, -0.3572849, -1.824213, 1, 0.172549, 0, 1,
-1.87291, -0.822861, -3.429206, 1, 0.1803922, 0, 1,
-1.867474, 0.7895495, -1.075346, 1, 0.1843137, 0, 1,
-1.847208, 0.8770111, -3.083863, 1, 0.1921569, 0, 1,
-1.822085, -1.680515, -2.789161, 1, 0.1960784, 0, 1,
-1.804078, 1.072906, -0.06600446, 1, 0.2039216, 0, 1,
-1.800455, -0.1211888, -2.092867, 1, 0.2117647, 0, 1,
-1.787698, 0.9903228, -1.689236, 1, 0.2156863, 0, 1,
-1.7835, -1.733751, 0.1548882, 1, 0.2235294, 0, 1,
-1.772103, -0.3476892, -2.459724, 1, 0.227451, 0, 1,
-1.756469, -1.680301, -2.842749, 1, 0.2352941, 0, 1,
-1.743531, 0.3890926, -0.9711318, 1, 0.2392157, 0, 1,
-1.741567, -2.006458, -3.921161, 1, 0.2470588, 0, 1,
-1.732111, 0.4052429, 0.5573127, 1, 0.2509804, 0, 1,
-1.723219, -0.02306444, -0.8025696, 1, 0.2588235, 0, 1,
-1.717359, 0.1651725, -3.165412, 1, 0.2627451, 0, 1,
-1.704195, 0.02308, -1.069087, 1, 0.2705882, 0, 1,
-1.691801, 2.143577, 0.07130771, 1, 0.2745098, 0, 1,
-1.69013, -0.08899218, -2.839716, 1, 0.282353, 0, 1,
-1.688358, 1.259057, -0.5642372, 1, 0.2862745, 0, 1,
-1.663292, 1.171533, 0.7239705, 1, 0.2941177, 0, 1,
-1.650253, -0.4532, -2.107122, 1, 0.3019608, 0, 1,
-1.643751, -0.02671729, -2.202709, 1, 0.3058824, 0, 1,
-1.642628, -0.2277581, -1.566723, 1, 0.3137255, 0, 1,
-1.633768, 0.1004229, -1.470267, 1, 0.3176471, 0, 1,
-1.628058, -0.1324384, -1.623252, 1, 0.3254902, 0, 1,
-1.606729, 1.312131, -1.436331, 1, 0.3294118, 0, 1,
-1.605049, 0.2426673, -1.595931, 1, 0.3372549, 0, 1,
-1.592516, 0.01859874, -2.591424, 1, 0.3411765, 0, 1,
-1.590262, -0.9706231, -1.271351, 1, 0.3490196, 0, 1,
-1.586581, 1.261559, -0.9098061, 1, 0.3529412, 0, 1,
-1.563275, 0.4230689, -1.203585, 1, 0.3607843, 0, 1,
-1.557562, 0.4364322, -1.426874, 1, 0.3647059, 0, 1,
-1.541829, -0.5439683, -1.111204, 1, 0.372549, 0, 1,
-1.540735, 0.7996496, -1.950192, 1, 0.3764706, 0, 1,
-1.540252, 1.203124, -1.775559, 1, 0.3843137, 0, 1,
-1.538405, 1.444978, -2.083373, 1, 0.3882353, 0, 1,
-1.532614, -0.4718811, -1.519222, 1, 0.3960784, 0, 1,
-1.522376, 0.09476934, -1.286544, 1, 0.4039216, 0, 1,
-1.513716, -0.8086386, -1.069992, 1, 0.4078431, 0, 1,
-1.511491, 1.115389, -0.0287469, 1, 0.4156863, 0, 1,
-1.502557, -0.5358927, -1.181973, 1, 0.4196078, 0, 1,
-1.498594, -0.2157348, -1.762562, 1, 0.427451, 0, 1,
-1.487751, 0.4169978, -1.0518, 1, 0.4313726, 0, 1,
-1.484412, 1.032778, -1.22061, 1, 0.4392157, 0, 1,
-1.477271, 0.4515642, -1.832417, 1, 0.4431373, 0, 1,
-1.476339, -0.863667, -2.414456, 1, 0.4509804, 0, 1,
-1.469508, -0.4467944, -1.519592, 1, 0.454902, 0, 1,
-1.467068, 0.2342989, -1.337725, 1, 0.4627451, 0, 1,
-1.461169, 0.1134763, -2.758418, 1, 0.4666667, 0, 1,
-1.43825, -0.353541, -2.323054, 1, 0.4745098, 0, 1,
-1.434128, 2.021077, -2.159233, 1, 0.4784314, 0, 1,
-1.433703, 1.434992, 0.8760586, 1, 0.4862745, 0, 1,
-1.433563, 0.7569249, 0.2447475, 1, 0.4901961, 0, 1,
-1.41251, -0.678626, 0.1590311, 1, 0.4980392, 0, 1,
-1.411375, -0.7039677, -2.432944, 1, 0.5058824, 0, 1,
-1.408703, 0.6570406, -0.5559801, 1, 0.509804, 0, 1,
-1.408109, -0.7023214, -1.49536, 1, 0.5176471, 0, 1,
-1.401356, 1.223071, -1.112195, 1, 0.5215687, 0, 1,
-1.400279, -1.614115, -2.73261, 1, 0.5294118, 0, 1,
-1.398475, 1.446186, -0.234883, 1, 0.5333334, 0, 1,
-1.39785, -0.4405878, -1.500891, 1, 0.5411765, 0, 1,
-1.39122, 0.7874446, -1.441575, 1, 0.5450981, 0, 1,
-1.384867, -0.2160942, -1.927083, 1, 0.5529412, 0, 1,
-1.382956, -0.5050032, -1.925522, 1, 0.5568628, 0, 1,
-1.3791, -0.1191161, -1.879746, 1, 0.5647059, 0, 1,
-1.376238, 0.8820031, -1.570739, 1, 0.5686275, 0, 1,
-1.372796, -0.5289131, -1.826346, 1, 0.5764706, 0, 1,
-1.372386, -0.5678113, -1.732166, 1, 0.5803922, 0, 1,
-1.365814, 1.218485, -1.832194, 1, 0.5882353, 0, 1,
-1.358032, -0.4765235, -0.6885737, 1, 0.5921569, 0, 1,
-1.351231, -0.1521558, -1.397249, 1, 0.6, 0, 1,
-1.344773, -0.3446109, -1.973648, 1, 0.6078432, 0, 1,
-1.336149, 0.7492128, -2.661345, 1, 0.6117647, 0, 1,
-1.330048, -1.380612, -2.462274, 1, 0.6196079, 0, 1,
-1.329214, -0.1485004, -2.692605, 1, 0.6235294, 0, 1,
-1.321965, -2.024111, -2.479629, 1, 0.6313726, 0, 1,
-1.317469, 1.071658, 0.310393, 1, 0.6352941, 0, 1,
-1.292079, -0.2179475, -0.8612819, 1, 0.6431373, 0, 1,
-1.288731, -0.4095691, -2.75864, 1, 0.6470588, 0, 1,
-1.287943, -1.118479, -3.715979, 1, 0.654902, 0, 1,
-1.287848, -0.9180423, -3.086967, 1, 0.6588235, 0, 1,
-1.279627, 0.1079864, -1.541665, 1, 0.6666667, 0, 1,
-1.275466, -2.430754, -2.988443, 1, 0.6705883, 0, 1,
-1.270359, -0.703306, -2.155774, 1, 0.6784314, 0, 1,
-1.263004, 0.1389984, 0.01434665, 1, 0.682353, 0, 1,
-1.259908, -0.7727419, -3.61041, 1, 0.6901961, 0, 1,
-1.258247, 0.7043082, -2.480789, 1, 0.6941177, 0, 1,
-1.25173, 0.009883376, 0.6255221, 1, 0.7019608, 0, 1,
-1.235911, -0.5502955, -1.383775, 1, 0.7098039, 0, 1,
-1.235843, 1.112265, -0.6557115, 1, 0.7137255, 0, 1,
-1.229689, -0.3529493, -0.8645649, 1, 0.7215686, 0, 1,
-1.228407, -1.441112, -2.063569, 1, 0.7254902, 0, 1,
-1.220984, 1.844183, -1.800745, 1, 0.7333333, 0, 1,
-1.219681, 0.1909428, -2.162111, 1, 0.7372549, 0, 1,
-1.217154, 0.6856546, -2.305557, 1, 0.7450981, 0, 1,
-1.216234, 0.637288, -0.1312855, 1, 0.7490196, 0, 1,
-1.212596, 0.009830185, -2.934526, 1, 0.7568628, 0, 1,
-1.196796, -0.3111187, -1.788455, 1, 0.7607843, 0, 1,
-1.196254, 1.357604, -1.908992, 1, 0.7686275, 0, 1,
-1.189452, 0.9820213, 0.04155479, 1, 0.772549, 0, 1,
-1.185822, 0.4509419, -0.8105175, 1, 0.7803922, 0, 1,
-1.18279, 1.317788, -2.812868, 1, 0.7843137, 0, 1,
-1.182349, -0.01454609, -1.259761, 1, 0.7921569, 0, 1,
-1.178186, 0.05049136, -2.516176, 1, 0.7960784, 0, 1,
-1.170604, 0.002125498, -2.310762, 1, 0.8039216, 0, 1,
-1.160641, -1.459432, -2.981729, 1, 0.8117647, 0, 1,
-1.147813, -0.4261677, -1.402748, 1, 0.8156863, 0, 1,
-1.146933, -0.2715443, -2.266556, 1, 0.8235294, 0, 1,
-1.142284, -1.200574, -2.408912, 1, 0.827451, 0, 1,
-1.126993, 1.905325, 0.8729367, 1, 0.8352941, 0, 1,
-1.126756, -0.1429147, -0.741638, 1, 0.8392157, 0, 1,
-1.117686, 0.7637453, 0.2974593, 1, 0.8470588, 0, 1,
-1.117458, 0.239453, -2.566723, 1, 0.8509804, 0, 1,
-1.117297, -2.168828, -3.514388, 1, 0.8588235, 0, 1,
-1.106728, -0.2203764, -0.9065179, 1, 0.8627451, 0, 1,
-1.09882, -1.329814, -1.901139, 1, 0.8705882, 0, 1,
-1.096615, 0.630828, -0.6801853, 1, 0.8745098, 0, 1,
-1.095016, 0.09406069, -2.469495, 1, 0.8823529, 0, 1,
-1.09478, 0.3066347, -2.385948, 1, 0.8862745, 0, 1,
-1.084765, -0.3904269, -2.820718, 1, 0.8941177, 0, 1,
-1.084062, -0.5028112, -0.662313, 1, 0.8980392, 0, 1,
-1.078496, -0.784288, -2.6697, 1, 0.9058824, 0, 1,
-1.078339, -0.4536489, -3.760484, 1, 0.9137255, 0, 1,
-1.071447, 0.4782383, -2.004361, 1, 0.9176471, 0, 1,
-1.067989, -0.1990093, -1.539827, 1, 0.9254902, 0, 1,
-1.065758, -0.5082583, -3.460541, 1, 0.9294118, 0, 1,
-1.060358, 0.03723726, -0.7426829, 1, 0.9372549, 0, 1,
-1.036932, -0.1559951, -0.8968475, 1, 0.9411765, 0, 1,
-1.033178, -1.204086, -1.865854, 1, 0.9490196, 0, 1,
-1.030465, -0.2204441, 0.579636, 1, 0.9529412, 0, 1,
-1.021787, -0.2826789, 0.05935466, 1, 0.9607843, 0, 1,
-1.021538, 0.9091142, 0.6067429, 1, 0.9647059, 0, 1,
-1.021084, -0.8112983, -2.100302, 1, 0.972549, 0, 1,
-1.020277, 1.478532, 0.1530374, 1, 0.9764706, 0, 1,
-1.018135, 0.06081483, 0.3073771, 1, 0.9843137, 0, 1,
-1.012434, -0.5786063, -1.882828, 1, 0.9882353, 0, 1,
-1.009659, -0.8229142, -2.615782, 1, 0.9960784, 0, 1,
-1.001514, 0.5805231, -0.6047192, 0.9960784, 1, 0, 1,
-0.9929579, 0.4782209, -0.7052426, 0.9921569, 1, 0, 1,
-0.9914087, 0.4134239, -2.326431, 0.9843137, 1, 0, 1,
-0.9894877, 0.3743398, -1.019401, 0.9803922, 1, 0, 1,
-0.9877112, -0.6312351, -1.87499, 0.972549, 1, 0, 1,
-0.9861825, -0.164288, -0.9107064, 0.9686275, 1, 0, 1,
-0.9817365, 0.04032765, -1.088785, 0.9607843, 1, 0, 1,
-0.9755334, -0.1927623, -1.264642, 0.9568627, 1, 0, 1,
-0.9727604, 0.9162666, -2.488172, 0.9490196, 1, 0, 1,
-0.9665054, -0.4726363, -1.759276, 0.945098, 1, 0, 1,
-0.9636738, -0.7985763, -3.391055, 0.9372549, 1, 0, 1,
-0.9574541, -1.290946, -2.587784, 0.9333333, 1, 0, 1,
-0.9558822, -0.1676164, -0.818518, 0.9254902, 1, 0, 1,
-0.9543123, -0.5883973, -1.894025, 0.9215686, 1, 0, 1,
-0.9531555, 0.6482615, -0.4446361, 0.9137255, 1, 0, 1,
-0.9504421, -1.404819, -1.398624, 0.9098039, 1, 0, 1,
-0.9394708, 0.4654395, -1.732736, 0.9019608, 1, 0, 1,
-0.9349217, -0.4227965, -1.938506, 0.8941177, 1, 0, 1,
-0.9313219, 0.2750332, -0.4066676, 0.8901961, 1, 0, 1,
-0.9303879, -1.703554, -1.599145, 0.8823529, 1, 0, 1,
-0.9267791, -0.8912249, -2.479002, 0.8784314, 1, 0, 1,
-0.9208807, 0.4223571, -0.9203519, 0.8705882, 1, 0, 1,
-0.9132804, -1.59418, -2.875903, 0.8666667, 1, 0, 1,
-0.9124498, 1.759919, -0.8117216, 0.8588235, 1, 0, 1,
-0.904098, 0.4259319, -0.5484252, 0.854902, 1, 0, 1,
-0.9033199, -0.8536473, -2.095111, 0.8470588, 1, 0, 1,
-0.9026946, 0.1587582, -3.824145, 0.8431373, 1, 0, 1,
-0.9024017, 0.5907646, -0.6317276, 0.8352941, 1, 0, 1,
-0.9004251, 0.3514206, -2.931269, 0.8313726, 1, 0, 1,
-0.8942667, 1.105406, -0.3979484, 0.8235294, 1, 0, 1,
-0.8921762, 0.01289613, -0.2000849, 0.8196079, 1, 0, 1,
-0.8871045, 2.513296, -0.8308812, 0.8117647, 1, 0, 1,
-0.8845901, 0.9165559, 0.6645605, 0.8078431, 1, 0, 1,
-0.8845822, 0.5624921, -1.071982, 0.8, 1, 0, 1,
-0.8829831, 1.203149, -1.226167, 0.7921569, 1, 0, 1,
-0.8690864, 2.384686, -0.03236636, 0.7882353, 1, 0, 1,
-0.8688568, -0.2097447, -1.192262, 0.7803922, 1, 0, 1,
-0.8685734, -0.1233396, -1.365481, 0.7764706, 1, 0, 1,
-0.8569068, -2.117171, -1.607106, 0.7686275, 1, 0, 1,
-0.8527533, 1.633991, -0.7112195, 0.7647059, 1, 0, 1,
-0.8508919, 0.6718873, -1.328545, 0.7568628, 1, 0, 1,
-0.846086, 1.017851, 0.4304835, 0.7529412, 1, 0, 1,
-0.8458905, -1.992, -3.68564, 0.7450981, 1, 0, 1,
-0.8405005, -0.7329946, -3.569579, 0.7411765, 1, 0, 1,
-0.8392838, -1.490864, -2.057802, 0.7333333, 1, 0, 1,
-0.8392302, 0.3869916, -1.882259, 0.7294118, 1, 0, 1,
-0.8369313, 1.198431, 0.07606366, 0.7215686, 1, 0, 1,
-0.831781, 0.5368329, -1.164906, 0.7176471, 1, 0, 1,
-0.8267793, -0.3220537, 0.0186816, 0.7098039, 1, 0, 1,
-0.8246829, 0.5060312, -2.024062, 0.7058824, 1, 0, 1,
-0.823624, 0.1347194, -0.4120304, 0.6980392, 1, 0, 1,
-0.8216913, -1.476672, -1.706201, 0.6901961, 1, 0, 1,
-0.8195652, 1.027059, -1.510745, 0.6862745, 1, 0, 1,
-0.8136814, -0.5510474, -1.786777, 0.6784314, 1, 0, 1,
-0.8116904, -1.431945, -2.958616, 0.6745098, 1, 0, 1,
-0.8052814, 1.548497, -1.010185, 0.6666667, 1, 0, 1,
-0.8049332, 0.8363877, -0.1236321, 0.6627451, 1, 0, 1,
-0.8020774, 0.3869436, -1.59011, 0.654902, 1, 0, 1,
-0.7999941, -1.771603, -2.846208, 0.6509804, 1, 0, 1,
-0.7989897, 0.8504093, -1.637527, 0.6431373, 1, 0, 1,
-0.7956175, 0.2223445, -0.9104388, 0.6392157, 1, 0, 1,
-0.7846131, 0.4735656, -0.2058111, 0.6313726, 1, 0, 1,
-0.7844698, 0.1860715, -2.28055, 0.627451, 1, 0, 1,
-0.7781032, -1.034587, -3.032204, 0.6196079, 1, 0, 1,
-0.7681863, -0.2881988, -2.045226, 0.6156863, 1, 0, 1,
-0.7660688, 2.010266, -0.09048338, 0.6078432, 1, 0, 1,
-0.7648424, 0.07405411, -2.275827, 0.6039216, 1, 0, 1,
-0.7646148, -0.3099969, -3.923801, 0.5960785, 1, 0, 1,
-0.7635224, -2.032401, -3.122181, 0.5882353, 1, 0, 1,
-0.7608329, -0.9040986, -1.431383, 0.5843138, 1, 0, 1,
-0.7595577, 0.03473225, -2.909836, 0.5764706, 1, 0, 1,
-0.7450041, -1.316472, -2.350392, 0.572549, 1, 0, 1,
-0.7449744, 0.08259416, -0.7236104, 0.5647059, 1, 0, 1,
-0.7362496, -1.209443, -0.09717396, 0.5607843, 1, 0, 1,
-0.7342876, -1.120956, -2.009373, 0.5529412, 1, 0, 1,
-0.727619, 1.207235, 0.3268715, 0.5490196, 1, 0, 1,
-0.7266952, -0.7297911, -2.130517, 0.5411765, 1, 0, 1,
-0.7259884, 0.1155133, -1.228433, 0.5372549, 1, 0, 1,
-0.725889, 0.1358277, -0.4100142, 0.5294118, 1, 0, 1,
-0.7213168, 1.415948, -0.5677191, 0.5254902, 1, 0, 1,
-0.7203791, 1.364262, -1.327106, 0.5176471, 1, 0, 1,
-0.7177904, 0.03509639, -1.386084, 0.5137255, 1, 0, 1,
-0.7143889, 0.5555057, -1.422231, 0.5058824, 1, 0, 1,
-0.7125878, -0.6428249, -2.676286, 0.5019608, 1, 0, 1,
-0.7088394, -0.1525075, -1.88646, 0.4941176, 1, 0, 1,
-0.7087834, 0.8690726, 1.012941, 0.4862745, 1, 0, 1,
-0.7022368, -0.9726721, -1.516456, 0.4823529, 1, 0, 1,
-0.6976039, -1.797033, -3.032409, 0.4745098, 1, 0, 1,
-0.694639, -0.7173726, -1.357748, 0.4705882, 1, 0, 1,
-0.6945589, 0.9694926, -0.5823559, 0.4627451, 1, 0, 1,
-0.6829578, 1.091944, -0.8285765, 0.4588235, 1, 0, 1,
-0.6767958, -0.4154124, -1.498461, 0.4509804, 1, 0, 1,
-0.6740736, -0.4804707, -2.128915, 0.4470588, 1, 0, 1,
-0.6728194, 0.5569574, -0.7947147, 0.4392157, 1, 0, 1,
-0.6689609, 0.5351053, -1.90251, 0.4352941, 1, 0, 1,
-0.6680107, 0.2122328, -1.803442, 0.427451, 1, 0, 1,
-0.6603401, -0.5909245, -2.122975, 0.4235294, 1, 0, 1,
-0.6565612, 0.26281, -0.9074069, 0.4156863, 1, 0, 1,
-0.649484, 0.2156892, -2.051116, 0.4117647, 1, 0, 1,
-0.6487288, 1.537056, -1.566222, 0.4039216, 1, 0, 1,
-0.6470989, -0.9208972, -2.367425, 0.3960784, 1, 0, 1,
-0.6408187, -0.07931214, 0.7882607, 0.3921569, 1, 0, 1,
-0.6394981, -1.5224, -3.542995, 0.3843137, 1, 0, 1,
-0.638133, 0.9461762, -0.9619548, 0.3803922, 1, 0, 1,
-0.6321967, -0.2772081, -3.420985, 0.372549, 1, 0, 1,
-0.6316263, -2.503877, -0.6310769, 0.3686275, 1, 0, 1,
-0.6287926, -4.086413, -2.320532, 0.3607843, 1, 0, 1,
-0.6276808, -0.9704337, -0.9969187, 0.3568628, 1, 0, 1,
-0.6249829, -0.3305908, -1.05772, 0.3490196, 1, 0, 1,
-0.6215197, 0.9535855, -0.7294075, 0.345098, 1, 0, 1,
-0.6194398, 0.4169977, 0.04766284, 0.3372549, 1, 0, 1,
-0.6130158, -1.056937, -2.511846, 0.3333333, 1, 0, 1,
-0.6073583, 0.5401711, 0.5833287, 0.3254902, 1, 0, 1,
-0.6072278, 1.725631, -1.764632, 0.3215686, 1, 0, 1,
-0.603894, -1.097562, -4.085907, 0.3137255, 1, 0, 1,
-0.6011585, -1.259782, -3.263593, 0.3098039, 1, 0, 1,
-0.5902413, 0.05923386, -2.459645, 0.3019608, 1, 0, 1,
-0.5889585, -0.7190673, -1.85919, 0.2941177, 1, 0, 1,
-0.5882337, 1.063305, -0.192927, 0.2901961, 1, 0, 1,
-0.587534, 0.1437747, -0.600693, 0.282353, 1, 0, 1,
-0.5856205, -0.2551421, -3.604336, 0.2784314, 1, 0, 1,
-0.5843183, -1.122174, -2.327217, 0.2705882, 1, 0, 1,
-0.5821844, -0.3010263, -2.56187, 0.2666667, 1, 0, 1,
-0.581553, 1.493716, -1.378093, 0.2588235, 1, 0, 1,
-0.5791875, 1.518632, 1.81102, 0.254902, 1, 0, 1,
-0.5776671, -0.3202831, -3.180452, 0.2470588, 1, 0, 1,
-0.5771898, -0.3009631, -1.458414, 0.2431373, 1, 0, 1,
-0.5771298, -1.070015, -4.482073, 0.2352941, 1, 0, 1,
-0.5746279, 0.2880115, -0.4747091, 0.2313726, 1, 0, 1,
-0.5745144, -2.138843, -3.541255, 0.2235294, 1, 0, 1,
-0.5718924, -0.03214944, -0.7170952, 0.2196078, 1, 0, 1,
-0.5716551, 0.08454387, -1.753099, 0.2117647, 1, 0, 1,
-0.5716511, 0.8865685, -1.875483, 0.2078431, 1, 0, 1,
-0.5710691, -1.061724, -2.265159, 0.2, 1, 0, 1,
-0.5695553, -1.077419, -3.27985, 0.1921569, 1, 0, 1,
-0.5691651, 1.429505, -0.3650608, 0.1882353, 1, 0, 1,
-0.5683723, -2.518342, -2.466874, 0.1803922, 1, 0, 1,
-0.5657621, -1.24137, -3.553154, 0.1764706, 1, 0, 1,
-0.5649498, -0.3614787, -3.074198, 0.1686275, 1, 0, 1,
-0.5644227, -0.4869184, -0.1288009, 0.1647059, 1, 0, 1,
-0.55921, -0.1815408, -0.3442881, 0.1568628, 1, 0, 1,
-0.5590128, -0.114064, -1.255614, 0.1529412, 1, 0, 1,
-0.5552378, 0.8683743, -1.648619, 0.145098, 1, 0, 1,
-0.5536829, -0.4034154, -2.31666, 0.1411765, 1, 0, 1,
-0.5453941, 1.438766, -1.461926, 0.1333333, 1, 0, 1,
-0.5394648, 0.5059738, -1.00317, 0.1294118, 1, 0, 1,
-0.5376039, -1.760575, -2.185436, 0.1215686, 1, 0, 1,
-0.5293812, -1.865353, -2.794546, 0.1176471, 1, 0, 1,
-0.5276591, 0.5138045, -1.018503, 0.1098039, 1, 0, 1,
-0.5224299, 0.6505401, -1.046045, 0.1058824, 1, 0, 1,
-0.5215564, 0.5579284, -0.5028908, 0.09803922, 1, 0, 1,
-0.5164468, 0.9028054, -2.00108, 0.09019608, 1, 0, 1,
-0.5099018, 1.268237, -0.03538909, 0.08627451, 1, 0, 1,
-0.5087767, -0.01759963, -0.8649667, 0.07843138, 1, 0, 1,
-0.5063578, -0.385009, -2.732577, 0.07450981, 1, 0, 1,
-0.5017324, 1.498738, -0.07572912, 0.06666667, 1, 0, 1,
-0.4972903, -0.06060242, -0.5582324, 0.0627451, 1, 0, 1,
-0.4931782, -0.07570232, -1.947889, 0.05490196, 1, 0, 1,
-0.4923217, 0.3265996, -0.4132533, 0.05098039, 1, 0, 1,
-0.490851, -0.081549, -2.936682, 0.04313726, 1, 0, 1,
-0.488771, 0.1051173, -1.737608, 0.03921569, 1, 0, 1,
-0.4884965, -1.375525, -2.363642, 0.03137255, 1, 0, 1,
-0.4878687, 0.8271614, -0.2264496, 0.02745098, 1, 0, 1,
-0.4873285, 0.04764115, -1.674785, 0.01960784, 1, 0, 1,
-0.4873125, -3.287252, -0.9364422, 0.01568628, 1, 0, 1,
-0.4872462, -0.6926961, -1.69053, 0.007843138, 1, 0, 1,
-0.4866863, 1.825527, -0.5190031, 0.003921569, 1, 0, 1,
-0.4860965, 0.7723295, -0.4949966, 0, 1, 0.003921569, 1,
-0.4854801, -1.73002, -2.828355, 0, 1, 0.01176471, 1,
-0.4849615, 0.2837036, -1.154726, 0, 1, 0.01568628, 1,
-0.4833925, -0.6991591, -2.276794, 0, 1, 0.02352941, 1,
-0.4746148, -0.08296958, -2.249101, 0, 1, 0.02745098, 1,
-0.4723843, 1.530885, -0.329349, 0, 1, 0.03529412, 1,
-0.470512, 0.1523337, -0.5768876, 0, 1, 0.03921569, 1,
-0.4699046, 0.413446, -1.029223, 0, 1, 0.04705882, 1,
-0.4656114, -0.01387454, -2.844398, 0, 1, 0.05098039, 1,
-0.4615473, 0.8585145, 0.7616512, 0, 1, 0.05882353, 1,
-0.4555697, 1.215814, -1.146699, 0, 1, 0.0627451, 1,
-0.45224, -0.7269083, -3.397967, 0, 1, 0.07058824, 1,
-0.4467621, 0.2509411, -1.830959, 0, 1, 0.07450981, 1,
-0.4465475, -0.9766969, -3.525855, 0, 1, 0.08235294, 1,
-0.4464448, -0.5937943, -2.264025, 0, 1, 0.08627451, 1,
-0.4453942, 1.647777, 0.181772, 0, 1, 0.09411765, 1,
-0.444173, 0.9777076, 1.120126, 0, 1, 0.1019608, 1,
-0.4440711, -1.587971, -2.230814, 0, 1, 0.1058824, 1,
-0.4416494, -1.176701, -1.479763, 0, 1, 0.1137255, 1,
-0.4335158, 1.029947, -0.3761946, 0, 1, 0.1176471, 1,
-0.4264622, 0.386709, -0.4621636, 0, 1, 0.1254902, 1,
-0.4262177, -0.5033755, -2.2142, 0, 1, 0.1294118, 1,
-0.4255315, -1.253307, -1.155859, 0, 1, 0.1372549, 1,
-0.42527, 1.174877, -1.256061, 0, 1, 0.1411765, 1,
-0.4251691, -1.48756, -3.323439, 0, 1, 0.1490196, 1,
-0.4251546, 1.652175, -0.2078717, 0, 1, 0.1529412, 1,
-0.4245884, 0.5650015, 0.08644895, 0, 1, 0.1607843, 1,
-0.4227196, 1.143038, -0.3053634, 0, 1, 0.1647059, 1,
-0.4211858, 0.2335757, -0.3594754, 0, 1, 0.172549, 1,
-0.4204829, -1.017175, -3.973379, 0, 1, 0.1764706, 1,
-0.4178485, 1.319463, -1.237098, 0, 1, 0.1843137, 1,
-0.4135118, 0.6959193, 0.9072973, 0, 1, 0.1882353, 1,
-0.4131532, 0.9986705, -0.3912169, 0, 1, 0.1960784, 1,
-0.4122761, 1.236681, -1.647715, 0, 1, 0.2039216, 1,
-0.4006924, 0.601307, 0.05237297, 0, 1, 0.2078431, 1,
-0.3991021, -0.3678384, -0.6209286, 0, 1, 0.2156863, 1,
-0.3980916, -0.4235353, -0.6803111, 0, 1, 0.2196078, 1,
-0.3980565, 0.3830834, 0.6255633, 0, 1, 0.227451, 1,
-0.3968934, 0.719523, -0.4830512, 0, 1, 0.2313726, 1,
-0.3962008, -0.3003276, -1.261913, 0, 1, 0.2392157, 1,
-0.395738, 0.2916951, 0.2586122, 0, 1, 0.2431373, 1,
-0.3950821, -0.907631, -2.042871, 0, 1, 0.2509804, 1,
-0.3932938, 0.3324592, -2.73549, 0, 1, 0.254902, 1,
-0.3928303, -1.705464, -3.555936, 0, 1, 0.2627451, 1,
-0.3924125, -0.7339121, -2.387867, 0, 1, 0.2666667, 1,
-0.3905521, 0.8589772, 0.04918252, 0, 1, 0.2745098, 1,
-0.3865263, -0.3218435, -1.676908, 0, 1, 0.2784314, 1,
-0.3831312, 0.3089858, 0.03994292, 0, 1, 0.2862745, 1,
-0.3830991, -0.4404755, -3.184527, 0, 1, 0.2901961, 1,
-0.3807251, 0.2414881, -2.105554, 0, 1, 0.2980392, 1,
-0.379937, -0.4445915, -1.564015, 0, 1, 0.3058824, 1,
-0.379625, -0.5893028, -2.728218, 0, 1, 0.3098039, 1,
-0.3763887, -0.06641184, -1.665619, 0, 1, 0.3176471, 1,
-0.3758781, -0.3651563, -2.614319, 0, 1, 0.3215686, 1,
-0.3732531, 1.63122, -1.548559, 0, 1, 0.3294118, 1,
-0.3722949, -0.9393967, -2.721404, 0, 1, 0.3333333, 1,
-0.3696453, -0.7465257, -4.751602, 0, 1, 0.3411765, 1,
-0.3672563, -0.1646453, -1.511247, 0, 1, 0.345098, 1,
-0.3666358, -0.04757182, -2.369224, 0, 1, 0.3529412, 1,
-0.3634958, 0.1598994, -4.005022, 0, 1, 0.3568628, 1,
-0.3631255, 0.419384, -1.185516, 0, 1, 0.3647059, 1,
-0.3559806, -0.2881592, -3.437126, 0, 1, 0.3686275, 1,
-0.3516672, 0.2859957, -0.5262336, 0, 1, 0.3764706, 1,
-0.3502925, 1.206286, -0.7700643, 0, 1, 0.3803922, 1,
-0.3484401, -0.9284716, -2.125935, 0, 1, 0.3882353, 1,
-0.3444028, 0.7059872, -0.7521366, 0, 1, 0.3921569, 1,
-0.333799, -0.46416, -4.048319, 0, 1, 0.4, 1,
-0.3297506, 0.1064014, 0.2501433, 0, 1, 0.4078431, 1,
-0.3269167, 0.7848204, 0.2756407, 0, 1, 0.4117647, 1,
-0.324153, -0.1469066, -0.1387867, 0, 1, 0.4196078, 1,
-0.3225486, 0.1413829, -0.02575913, 0, 1, 0.4235294, 1,
-0.3187487, -0.7870066, -2.299168, 0, 1, 0.4313726, 1,
-0.3185458, -0.4281657, -3.562761, 0, 1, 0.4352941, 1,
-0.3165923, 0.69359, -2.042427, 0, 1, 0.4431373, 1,
-0.3157191, 0.7624359, 0.06348989, 0, 1, 0.4470588, 1,
-0.3125488, -0.5648326, -1.981262, 0, 1, 0.454902, 1,
-0.3110534, 1.098035, -1.521144, 0, 1, 0.4588235, 1,
-0.3106129, -0.3796577, -1.618891, 0, 1, 0.4666667, 1,
-0.3074721, 0.4345678, -0.5702412, 0, 1, 0.4705882, 1,
-0.3019432, -0.8581762, -2.3482, 0, 1, 0.4784314, 1,
-0.3009961, 0.05295664, -2.314452, 0, 1, 0.4823529, 1,
-0.2993571, 3.41953, -1.309729, 0, 1, 0.4901961, 1,
-0.2967002, -0.4745537, -2.369081, 0, 1, 0.4941176, 1,
-0.2930087, 0.248392, -0.5441309, 0, 1, 0.5019608, 1,
-0.2925841, 1.535336, 0.4353957, 0, 1, 0.509804, 1,
-0.2884388, -1.629018, -3.638719, 0, 1, 0.5137255, 1,
-0.2872911, 0.1748589, -1.761605, 0, 1, 0.5215687, 1,
-0.284685, 0.2589807, -1.531281, 0, 1, 0.5254902, 1,
-0.283653, 0.8328477, 1.993836, 0, 1, 0.5333334, 1,
-0.2833929, -0.3038571, -1.957063, 0, 1, 0.5372549, 1,
-0.282338, -0.5240242, -3.110993, 0, 1, 0.5450981, 1,
-0.2808898, -0.9813473, -1.208583, 0, 1, 0.5490196, 1,
-0.2802676, 2.740658, 1.673863, 0, 1, 0.5568628, 1,
-0.2786089, -0.0309461, -3.920705, 0, 1, 0.5607843, 1,
-0.2780604, -0.4003355, -3.310575, 0, 1, 0.5686275, 1,
-0.2775961, -0.06050847, -2.736585, 0, 1, 0.572549, 1,
-0.2692162, -0.09770566, -3.845155, 0, 1, 0.5803922, 1,
-0.2691008, 1.132876, 0.7737392, 0, 1, 0.5843138, 1,
-0.2662941, -0.5946196, -4.054415, 0, 1, 0.5921569, 1,
-0.2538061, -0.03779006, -0.4732902, 0, 1, 0.5960785, 1,
-0.2521826, -1.296565, -3.052904, 0, 1, 0.6039216, 1,
-0.2520631, 1.017318, -1.28916, 0, 1, 0.6117647, 1,
-0.2499186, 0.4153967, 0.2007238, 0, 1, 0.6156863, 1,
-0.248316, -0.2020878, -1.446393, 0, 1, 0.6235294, 1,
-0.2481232, -0.6689879, -1.957536, 0, 1, 0.627451, 1,
-0.2471212, 0.3285381, -0.5327342, 0, 1, 0.6352941, 1,
-0.2463324, -0.7237002, -2.005385, 0, 1, 0.6392157, 1,
-0.2442322, -1.43995, -2.465326, 0, 1, 0.6470588, 1,
-0.2367288, -0.03690613, -2.263266, 0, 1, 0.6509804, 1,
-0.2345389, 0.1077885, 0.5294419, 0, 1, 0.6588235, 1,
-0.2314694, 0.8819149, 0.3566853, 0, 1, 0.6627451, 1,
-0.2302164, -0.7247345, -1.743793, 0, 1, 0.6705883, 1,
-0.2277176, -0.04359904, -2.464153, 0, 1, 0.6745098, 1,
-0.2247799, -0.3826374, -1.628389, 0, 1, 0.682353, 1,
-0.2235785, -0.7330198, -2.698193, 0, 1, 0.6862745, 1,
-0.218652, 1.026867, 0.8071945, 0, 1, 0.6941177, 1,
-0.2157048, 0.5179832, 0.2170833, 0, 1, 0.7019608, 1,
-0.2134898, 0.09385175, -2.261957, 0, 1, 0.7058824, 1,
-0.2132123, -0.4425852, -4.606494, 0, 1, 0.7137255, 1,
-0.2091573, 0.973205, -0.6735548, 0, 1, 0.7176471, 1,
-0.2079434, -0.6999608, -4.427953, 0, 1, 0.7254902, 1,
-0.2038426, 0.4380569, -0.3818513, 0, 1, 0.7294118, 1,
-0.2000091, 0.8232094, 0.3179691, 0, 1, 0.7372549, 1,
-0.199641, 0.09049366, -2.613615, 0, 1, 0.7411765, 1,
-0.1947234, 0.788718, -0.8601107, 0, 1, 0.7490196, 1,
-0.1937289, -1.915708, -1.496538, 0, 1, 0.7529412, 1,
-0.1926822, 1.72693, 1.067124, 0, 1, 0.7607843, 1,
-0.191674, -0.2637272, -1.252915, 0, 1, 0.7647059, 1,
-0.1885911, 0.05858061, -1.594027, 0, 1, 0.772549, 1,
-0.1878916, 1.002076, 0.7775163, 0, 1, 0.7764706, 1,
-0.1864588, 0.159701, -0.6276657, 0, 1, 0.7843137, 1,
-0.1863385, 1.220581, 0.1070752, 0, 1, 0.7882353, 1,
-0.1849475, -0.9328802, -4.05001, 0, 1, 0.7960784, 1,
-0.1839657, 1.482154, 0.8299469, 0, 1, 0.8039216, 1,
-0.1791608, 0.006748717, -0.4341559, 0, 1, 0.8078431, 1,
-0.1722288, 1.202267, -1.590982, 0, 1, 0.8156863, 1,
-0.1712465, 0.6038789, -0.3925277, 0, 1, 0.8196079, 1,
-0.1676277, 1.847342, -0.4564232, 0, 1, 0.827451, 1,
-0.1666287, 0.4605496, -1.139909, 0, 1, 0.8313726, 1,
-0.1643071, -0.1664057, 0.100375, 0, 1, 0.8392157, 1,
-0.1627407, -2.439684, -2.028091, 0, 1, 0.8431373, 1,
-0.160718, -0.3613261, -0.85504, 0, 1, 0.8509804, 1,
-0.1603314, -0.1580048, -4.0948, 0, 1, 0.854902, 1,
-0.1602746, -0.2117964, -4.094683, 0, 1, 0.8627451, 1,
-0.1558261, -1.310498, -3.322407, 0, 1, 0.8666667, 1,
-0.1542479, 0.440863, 1.642118, 0, 1, 0.8745098, 1,
-0.1436668, 0.8994101, -1.36341, 0, 1, 0.8784314, 1,
-0.1425365, 2.894148, -0.1395884, 0, 1, 0.8862745, 1,
-0.1415825, 0.9811823, 0.6315678, 0, 1, 0.8901961, 1,
-0.1410663, -0.6392787, -2.356102, 0, 1, 0.8980392, 1,
-0.1406402, 0.2008428, -0.8584358, 0, 1, 0.9058824, 1,
-0.1405814, 2.098204, 0.4843002, 0, 1, 0.9098039, 1,
-0.1404991, -0.3110667, -1.537862, 0, 1, 0.9176471, 1,
-0.1385627, 1.435722, -0.9551197, 0, 1, 0.9215686, 1,
-0.1347652, -0.4199141, -2.187826, 0, 1, 0.9294118, 1,
-0.1344149, 0.212741, -2.155024, 0, 1, 0.9333333, 1,
-0.133039, 0.7746219, -1.295833, 0, 1, 0.9411765, 1,
-0.1317172, 0.4588063, 0.1019123, 0, 1, 0.945098, 1,
-0.128525, 0.09171224, -1.022232, 0, 1, 0.9529412, 1,
-0.1251185, 1.454124, -0.6112196, 0, 1, 0.9568627, 1,
-0.1250653, 0.09868666, -1.11669, 0, 1, 0.9647059, 1,
-0.1227851, -0.2023897, -2.930647, 0, 1, 0.9686275, 1,
-0.1199997, 0.06718326, -1.793326, 0, 1, 0.9764706, 1,
-0.1151057, 1.205569, 1.722314, 0, 1, 0.9803922, 1,
-0.1139359, -1.141901, -4.145122, 0, 1, 0.9882353, 1,
-0.105944, -0.08246093, -3.087671, 0, 1, 0.9921569, 1,
-0.1038935, 0.1514373, -0.9777377, 0, 1, 1, 1,
-0.1023487, 0.4992084, -0.1963159, 0, 0.9921569, 1, 1,
-0.1000193, -0.366735, -3.714034, 0, 0.9882353, 1, 1,
-0.09737735, -0.0375169, -1.071265, 0, 0.9803922, 1, 1,
-0.09413002, 1.248373, 0.6823915, 0, 0.9764706, 1, 1,
-0.09345978, -0.3678765, -2.268056, 0, 0.9686275, 1, 1,
-0.08780481, -0.5087342, -1.952966, 0, 0.9647059, 1, 1,
-0.08762009, -0.8200097, -2.02169, 0, 0.9568627, 1, 1,
-0.08230628, -0.3439314, -3.739271, 0, 0.9529412, 1, 1,
-0.08074427, -1.253999, -2.473601, 0, 0.945098, 1, 1,
-0.08028027, -0.8185735, -3.797714, 0, 0.9411765, 1, 1,
-0.07729695, -1.060195, -4.612266, 0, 0.9333333, 1, 1,
-0.0765736, -1.387357, -3.641701, 0, 0.9294118, 1, 1,
-0.06169333, 1.847547, -0.2834054, 0, 0.9215686, 1, 1,
-0.06135649, 1.606997, -1.429554, 0, 0.9176471, 1, 1,
-0.06072975, -0.2199411, -4.467598, 0, 0.9098039, 1, 1,
-0.06006353, 0.9812953, 0.2196669, 0, 0.9058824, 1, 1,
-0.05450362, 0.2382396, 0.6447373, 0, 0.8980392, 1, 1,
-0.05408284, -0.4665281, -3.908791, 0, 0.8901961, 1, 1,
-0.05205834, 0.06811637, -0.4563454, 0, 0.8862745, 1, 1,
-0.04980898, 0.6160421, -0.6176319, 0, 0.8784314, 1, 1,
-0.04866231, -0.4237135, -4.188256, 0, 0.8745098, 1, 1,
-0.03237643, -0.02713773, -1.624984, 0, 0.8666667, 1, 1,
-0.03107732, -0.4214107, -2.757562, 0, 0.8627451, 1, 1,
-0.02816982, 0.04805873, -2.047737, 0, 0.854902, 1, 1,
-0.02768522, -1.794942, -4.060472, 0, 0.8509804, 1, 1,
-0.02585182, 1.01889, -0.2814863, 0, 0.8431373, 1, 1,
-0.02013994, 0.1013185, 0.3031455, 0, 0.8392157, 1, 1,
-0.01681538, 0.3874449, 0.8798143, 0, 0.8313726, 1, 1,
-0.01547952, 0.4155449, -0.1837162, 0, 0.827451, 1, 1,
-0.01522873, 0.03737149, -0.1602465, 0, 0.8196079, 1, 1,
-0.01477607, -1.183551, -3.939556, 0, 0.8156863, 1, 1,
-0.01377727, 0.0818492, -0.5916341, 0, 0.8078431, 1, 1,
-0.01332468, -0.03031432, -2.568812, 0, 0.8039216, 1, 1,
-0.01071587, -0.1337318, -1.754443, 0, 0.7960784, 1, 1,
-0.009187002, 0.3349212, 0.7442664, 0, 0.7882353, 1, 1,
-0.008831713, 0.5998626, 0.3006696, 0, 0.7843137, 1, 1,
0.001381196, 1.021005, 0.7148476, 0, 0.7764706, 1, 1,
0.01559096, 0.07019127, -0.7445411, 0, 0.772549, 1, 1,
0.01824028, -0.08950746, 4.296297, 0, 0.7647059, 1, 1,
0.03195611, 0.1315998, 1.065275, 0, 0.7607843, 1, 1,
0.03659531, 1.700959, -1.475889, 0, 0.7529412, 1, 1,
0.03979478, -1.606036, 2.41521, 0, 0.7490196, 1, 1,
0.04715313, -1.205176, 2.945272, 0, 0.7411765, 1, 1,
0.05181951, -0.5144038, 3.092551, 0, 0.7372549, 1, 1,
0.05325117, -0.08214524, 2.815637, 0, 0.7294118, 1, 1,
0.05421444, -0.00343196, 0.3425924, 0, 0.7254902, 1, 1,
0.05653061, -2.080626, 2.733676, 0, 0.7176471, 1, 1,
0.05726983, -0.4396893, 3.939005, 0, 0.7137255, 1, 1,
0.05806385, 0.001404958, 1.210585, 0, 0.7058824, 1, 1,
0.0647063, 1.448419, -0.1717342, 0, 0.6980392, 1, 1,
0.07013887, 0.5719121, -2.575813, 0, 0.6941177, 1, 1,
0.071629, 0.5341668, 1.83478, 0, 0.6862745, 1, 1,
0.07237879, -1.491568, 4.251565, 0, 0.682353, 1, 1,
0.07415442, 1.133265, -0.1827307, 0, 0.6745098, 1, 1,
0.07576519, 0.4180073, 1.009639, 0, 0.6705883, 1, 1,
0.08008109, -0.6259698, 3.638842, 0, 0.6627451, 1, 1,
0.08062753, 0.2338751, 0.3580874, 0, 0.6588235, 1, 1,
0.08287267, -0.07362635, 1.138124, 0, 0.6509804, 1, 1,
0.08433936, 1.601881, -0.8042347, 0, 0.6470588, 1, 1,
0.0867263, 0.9665821, 0.2248735, 0, 0.6392157, 1, 1,
0.08842529, -0.2593019, 1.095998, 0, 0.6352941, 1, 1,
0.08919932, -1.045967, 2.153723, 0, 0.627451, 1, 1,
0.09195731, 0.8121125, 0.2258989, 0, 0.6235294, 1, 1,
0.09483908, 0.8130291, -0.1672762, 0, 0.6156863, 1, 1,
0.09654766, 1.112966, 0.08242959, 0, 0.6117647, 1, 1,
0.09699802, 0.2839539, 2.251962, 0, 0.6039216, 1, 1,
0.1023703, -0.1953411, 3.196152, 0, 0.5960785, 1, 1,
0.1028972, 2.023259, 0.9799439, 0, 0.5921569, 1, 1,
0.110647, -2.217277, 2.799683, 0, 0.5843138, 1, 1,
0.1152467, 0.587106, 0.8856341, 0, 0.5803922, 1, 1,
0.115559, 1.121417, -0.768249, 0, 0.572549, 1, 1,
0.1226093, 1.062259, 0.3012494, 0, 0.5686275, 1, 1,
0.1244616, -0.5663542, 1.485648, 0, 0.5607843, 1, 1,
0.1245976, -0.5506601, 2.84752, 0, 0.5568628, 1, 1,
0.1264938, 0.7305578, 0.668048, 0, 0.5490196, 1, 1,
0.126526, 0.4164004, 1.048751, 0, 0.5450981, 1, 1,
0.1330156, 0.3609355, -0.5204957, 0, 0.5372549, 1, 1,
0.1356007, 1.997697, 0.7724664, 0, 0.5333334, 1, 1,
0.1364043, -0.627604, 2.463709, 0, 0.5254902, 1, 1,
0.1376924, -0.3732944, 2.580288, 0, 0.5215687, 1, 1,
0.1441432, 1.774674, -0.08730089, 0, 0.5137255, 1, 1,
0.1451817, 1.324148, 0.503313, 0, 0.509804, 1, 1,
0.1459, 1.812932, -1.1538, 0, 0.5019608, 1, 1,
0.1463644, 1.786107, -2.012699, 0, 0.4941176, 1, 1,
0.147119, -0.2226995, 4.268673, 0, 0.4901961, 1, 1,
0.1522847, 0.3754465, 0.5644574, 0, 0.4823529, 1, 1,
0.1610617, -0.9687586, 2.967366, 0, 0.4784314, 1, 1,
0.1638362, 1.999782, -0.7321582, 0, 0.4705882, 1, 1,
0.1642712, -1.154704, 4.080979, 0, 0.4666667, 1, 1,
0.1650757, 0.400044, -0.2906417, 0, 0.4588235, 1, 1,
0.1651809, 0.3910998, -0.939366, 0, 0.454902, 1, 1,
0.1707981, 0.8587986, 1.447007, 0, 0.4470588, 1, 1,
0.1708939, -1.037386, 4.365, 0, 0.4431373, 1, 1,
0.1709828, 0.5463153, -1.454164, 0, 0.4352941, 1, 1,
0.1714974, 1.574373, -0.1135148, 0, 0.4313726, 1, 1,
0.1744546, 0.9280074, 1.743197, 0, 0.4235294, 1, 1,
0.1761659, -0.4318786, 3.15555, 0, 0.4196078, 1, 1,
0.1778521, -0.4450682, 2.756602, 0, 0.4117647, 1, 1,
0.178764, -0.9563882, 3.871243, 0, 0.4078431, 1, 1,
0.1791079, -0.04596833, 0.844069, 0, 0.4, 1, 1,
0.1800146, -0.0106243, 1.740809, 0, 0.3921569, 1, 1,
0.1908128, 1.253881, -1.652451, 0, 0.3882353, 1, 1,
0.1914123, 1.148331, 1.382838, 0, 0.3803922, 1, 1,
0.1979402, -0.8315688, 3.769413, 0, 0.3764706, 1, 1,
0.2011082, -0.0372499, 1.796979, 0, 0.3686275, 1, 1,
0.2018978, 1.786502, 2.194038, 0, 0.3647059, 1, 1,
0.2077868, 0.5603548, 1.397298, 0, 0.3568628, 1, 1,
0.2079577, -2.196093, 1.581334, 0, 0.3529412, 1, 1,
0.2150238, 0.1913787, 1.250467, 0, 0.345098, 1, 1,
0.2166613, -0.3549409, 2.190666, 0, 0.3411765, 1, 1,
0.2172847, -0.9435853, 2.916312, 0, 0.3333333, 1, 1,
0.222476, -1.250233, 3.692003, 0, 0.3294118, 1, 1,
0.2229574, -0.1770293, 3.080009, 0, 0.3215686, 1, 1,
0.2279948, -0.08906543, 1.799119, 0, 0.3176471, 1, 1,
0.2296104, 1.470796, -0.8672287, 0, 0.3098039, 1, 1,
0.2342398, -0.2309674, 1.129277, 0, 0.3058824, 1, 1,
0.234291, -0.8911214, 2.326034, 0, 0.2980392, 1, 1,
0.2376727, -1.09831, 2.26247, 0, 0.2901961, 1, 1,
0.2421542, -1.611188, 4.53091, 0, 0.2862745, 1, 1,
0.2426843, -0.9826689, 2.410711, 0, 0.2784314, 1, 1,
0.2447941, -1.73519, 2.089687, 0, 0.2745098, 1, 1,
0.2471168, 0.4544293, 2.382974, 0, 0.2666667, 1, 1,
0.2479834, 2.388669, 2.118886, 0, 0.2627451, 1, 1,
0.2497651, 0.4891191, -0.6548415, 0, 0.254902, 1, 1,
0.2523762, -0.576534, 2.220963, 0, 0.2509804, 1, 1,
0.2558592, 1.616174, -1.359784, 0, 0.2431373, 1, 1,
0.259642, -1.032233, 4.061207, 0, 0.2392157, 1, 1,
0.2604678, 0.1595667, 1.531185, 0, 0.2313726, 1, 1,
0.2675738, 1.122733, 0.06724574, 0, 0.227451, 1, 1,
0.2692478, -0.4508526, 2.879417, 0, 0.2196078, 1, 1,
0.2701921, -0.3064558, 2.495362, 0, 0.2156863, 1, 1,
0.2794483, -0.6579788, 4.9883, 0, 0.2078431, 1, 1,
0.2839154, 0.06584787, 1.398974, 0, 0.2039216, 1, 1,
0.2862298, 0.8053984, 0.9290236, 0, 0.1960784, 1, 1,
0.2902206, 0.2859434, 1.305514, 0, 0.1882353, 1, 1,
0.2926099, -1.320001, 1.333845, 0, 0.1843137, 1, 1,
0.2972747, 0.3567183, 0.3014933, 0, 0.1764706, 1, 1,
0.3043854, -1.380025, 3.271071, 0, 0.172549, 1, 1,
0.3047604, -2.053402, 2.943052, 0, 0.1647059, 1, 1,
0.3103369, -0.6840969, 2.396878, 0, 0.1607843, 1, 1,
0.3138486, -0.2098709, 2.460289, 0, 0.1529412, 1, 1,
0.3141126, -0.5417844, 4.540284, 0, 0.1490196, 1, 1,
0.3181134, 1.255242, 1.046227, 0, 0.1411765, 1, 1,
0.3189086, 0.9492496, 0.7037874, 0, 0.1372549, 1, 1,
0.3231044, 0.8723738, 0.1989778, 0, 0.1294118, 1, 1,
0.3325079, -0.4566516, 0.9356979, 0, 0.1254902, 1, 1,
0.3374518, 0.5217134, 0.9802068, 0, 0.1176471, 1, 1,
0.3475554, 0.392955, 0.4365375, 0, 0.1137255, 1, 1,
0.353112, 0.7327474, 1.733701, 0, 0.1058824, 1, 1,
0.3562379, 1.960882, -0.2251491, 0, 0.09803922, 1, 1,
0.359931, -1.67603, 3.29934, 0, 0.09411765, 1, 1,
0.3635955, -1.106742, 2.85607, 0, 0.08627451, 1, 1,
0.3659423, -1.67553, 2.914075, 0, 0.08235294, 1, 1,
0.3671006, 0.1934852, 1.495279, 0, 0.07450981, 1, 1,
0.3691356, -0.5037991, 4.058202, 0, 0.07058824, 1, 1,
0.3699767, 0.02945145, 2.90202, 0, 0.0627451, 1, 1,
0.3706266, -1.130596, 2.391966, 0, 0.05882353, 1, 1,
0.3756663, -1.721487, 2.259312, 0, 0.05098039, 1, 1,
0.3783686, -0.6108095, 2.091329, 0, 0.04705882, 1, 1,
0.3790183, -0.8976073, 2.98509, 0, 0.03921569, 1, 1,
0.3796304, -1.446307, 3.548404, 0, 0.03529412, 1, 1,
0.3815513, -0.7373854, 0.9202542, 0, 0.02745098, 1, 1,
0.3841943, 0.8924181, 0.3298832, 0, 0.02352941, 1, 1,
0.3868691, -0.9069107, 3.899364, 0, 0.01568628, 1, 1,
0.3874794, 0.618439, -0.3074083, 0, 0.01176471, 1, 1,
0.395254, -1.144611, 1.695054, 0, 0.003921569, 1, 1,
0.4018415, -0.6389418, 1.051244, 0.003921569, 0, 1, 1,
0.4028011, -0.8542194, 1.458795, 0.007843138, 0, 1, 1,
0.4054319, -0.883902, 3.81308, 0.01568628, 0, 1, 1,
0.4057042, -0.5690172, 2.799055, 0.01960784, 0, 1, 1,
0.4058182, -1.593093, 1.366742, 0.02745098, 0, 1, 1,
0.4063708, -0.08998223, 0.8654122, 0.03137255, 0, 1, 1,
0.4079665, -0.4332103, 3.692513, 0.03921569, 0, 1, 1,
0.414034, 0.02152716, 0.22352, 0.04313726, 0, 1, 1,
0.4159726, 0.607412, 1.007722, 0.05098039, 0, 1, 1,
0.4177465, 0.4385908, 2.097305, 0.05490196, 0, 1, 1,
0.419716, -0.8692439, 2.264155, 0.0627451, 0, 1, 1,
0.4198613, 1.669656, 1.004874, 0.06666667, 0, 1, 1,
0.4228202, 1.086646, 1.426596, 0.07450981, 0, 1, 1,
0.4285801, -0.6145092, 5.268832, 0.07843138, 0, 1, 1,
0.4286717, 0.7468658, 0.5049485, 0.08627451, 0, 1, 1,
0.4351078, -1.518935, 2.626388, 0.09019608, 0, 1, 1,
0.4359447, -1.206251, 1.845313, 0.09803922, 0, 1, 1,
0.4403058, 0.6891827, -0.5734924, 0.1058824, 0, 1, 1,
0.4409438, -1.753555, 3.906332, 0.1098039, 0, 1, 1,
0.4421795, 0.4712703, 2.930132, 0.1176471, 0, 1, 1,
0.4443657, -1.347243, 3.031437, 0.1215686, 0, 1, 1,
0.4458427, -0.09903566, 0.1219853, 0.1294118, 0, 1, 1,
0.4474242, 2.167605, -1.400664, 0.1333333, 0, 1, 1,
0.4484506, -1.047108, 4.030158, 0.1411765, 0, 1, 1,
0.4493612, -1.450529, 2.568705, 0.145098, 0, 1, 1,
0.4505393, 0.1236586, 0.2949556, 0.1529412, 0, 1, 1,
0.4552992, -0.4453385, 2.149972, 0.1568628, 0, 1, 1,
0.4618248, -1.244174, 1.443887, 0.1647059, 0, 1, 1,
0.465665, -0.3226275, 0.9538522, 0.1686275, 0, 1, 1,
0.4661086, 0.7189428, 1.138947, 0.1764706, 0, 1, 1,
0.4811216, -0.3714727, 1.643463, 0.1803922, 0, 1, 1,
0.4817847, 0.09309313, 0.6330214, 0.1882353, 0, 1, 1,
0.4827733, 0.8295563, 1.761264, 0.1921569, 0, 1, 1,
0.4907988, -0.1974951, 0.09658287, 0.2, 0, 1, 1,
0.4964008, 0.02013197, 0.9766783, 0.2078431, 0, 1, 1,
0.499619, -0.2549481, 1.620618, 0.2117647, 0, 1, 1,
0.5021225, 1.780107, -0.8088001, 0.2196078, 0, 1, 1,
0.508918, -0.7120863, 2.212863, 0.2235294, 0, 1, 1,
0.5203561, 0.07279021, 0.595256, 0.2313726, 0, 1, 1,
0.5218984, -1.55011, 3.462501, 0.2352941, 0, 1, 1,
0.5246841, 1.410432, -0.6865641, 0.2431373, 0, 1, 1,
0.5389758, 0.1960365, -0.4332173, 0.2470588, 0, 1, 1,
0.5398342, -1.518342, 1.208309, 0.254902, 0, 1, 1,
0.5409461, 2.358713, 0.39748, 0.2588235, 0, 1, 1,
0.5423225, 0.45233, 0.7273489, 0.2666667, 0, 1, 1,
0.5503803, 0.4167458, 0.8337669, 0.2705882, 0, 1, 1,
0.5551734, -0.8902483, 4.946898, 0.2784314, 0, 1, 1,
0.5565545, 0.01812493, 1.873332, 0.282353, 0, 1, 1,
0.5569504, 1.121659, -0.3609643, 0.2901961, 0, 1, 1,
0.5593591, 0.7783318, -1.063505, 0.2941177, 0, 1, 1,
0.566165, -0.5777617, 2.622209, 0.3019608, 0, 1, 1,
0.5690651, 0.7801495, 0.1176993, 0.3098039, 0, 1, 1,
0.5742078, -0.2150494, 2.303931, 0.3137255, 0, 1, 1,
0.5742935, -0.5711698, 2.221321, 0.3215686, 0, 1, 1,
0.5751477, -0.1409863, 2.508836, 0.3254902, 0, 1, 1,
0.5774156, 1.443421, 0.5958193, 0.3333333, 0, 1, 1,
0.5809559, -0.5619456, 1.390529, 0.3372549, 0, 1, 1,
0.5815991, 0.5601458, 1.776096, 0.345098, 0, 1, 1,
0.5862389, -0.04507666, 2.205998, 0.3490196, 0, 1, 1,
0.5890696, -1.18133, 4.402724, 0.3568628, 0, 1, 1,
0.5934037, 0.48841, 1.819304, 0.3607843, 0, 1, 1,
0.594682, -0.6223718, 2.599409, 0.3686275, 0, 1, 1,
0.5995498, 1.397269, 1.143753, 0.372549, 0, 1, 1,
0.6006813, -1.837798, 3.258518, 0.3803922, 0, 1, 1,
0.6007686, -0.1690657, 0.792354, 0.3843137, 0, 1, 1,
0.602407, 1.05274, -1.974754, 0.3921569, 0, 1, 1,
0.6036999, -0.6446834, 1.576957, 0.3960784, 0, 1, 1,
0.6059917, 0.08442151, 0.9191488, 0.4039216, 0, 1, 1,
0.6082917, 1.206314, -0.5320839, 0.4117647, 0, 1, 1,
0.6087367, 0.9693889, -0.6819957, 0.4156863, 0, 1, 1,
0.6270858, -0.3427899, 2.590147, 0.4235294, 0, 1, 1,
0.6279413, -2.277573, 3.501131, 0.427451, 0, 1, 1,
0.6292991, 0.2835375, 2.32457, 0.4352941, 0, 1, 1,
0.6316114, -0.9086498, 1.527816, 0.4392157, 0, 1, 1,
0.6330243, -0.2392437, 0.6622123, 0.4470588, 0, 1, 1,
0.6337454, -0.1371425, 0.3275066, 0.4509804, 0, 1, 1,
0.6348974, 1.504274, 0.7933803, 0.4588235, 0, 1, 1,
0.6420788, -0.4584453, 2.860444, 0.4627451, 0, 1, 1,
0.6435539, -0.4537975, -0.5384826, 0.4705882, 0, 1, 1,
0.6492606, 1.802344, 0.5198588, 0.4745098, 0, 1, 1,
0.6630757, -0.7351876, 1.840504, 0.4823529, 0, 1, 1,
0.6663136, -0.2645919, 0.2347182, 0.4862745, 0, 1, 1,
0.6700936, 1.240801, -0.5494618, 0.4941176, 0, 1, 1,
0.6724972, -0.2885744, 4.492589, 0.5019608, 0, 1, 1,
0.6741571, -0.4443916, 1.602914, 0.5058824, 0, 1, 1,
0.6763574, 0.3559297, 2.373534, 0.5137255, 0, 1, 1,
0.676947, 0.1531731, -0.3852011, 0.5176471, 0, 1, 1,
0.6801986, 1.379735, 1.702417, 0.5254902, 0, 1, 1,
0.6848299, 0.04468063, 0.7693835, 0.5294118, 0, 1, 1,
0.6853343, 0.1259601, 3.22106, 0.5372549, 0, 1, 1,
0.6857415, 0.8587564, 1.488644, 0.5411765, 0, 1, 1,
0.6896657, 0.07344037, 1.740112, 0.5490196, 0, 1, 1,
0.689914, 0.7600113, 1.46153, 0.5529412, 0, 1, 1,
0.6941959, 3.093888, -1.020257, 0.5607843, 0, 1, 1,
0.7032903, 0.1534099, 0.2994501, 0.5647059, 0, 1, 1,
0.707548, -1.516795, 4.658809, 0.572549, 0, 1, 1,
0.7106686, 0.8548566, 0.6362308, 0.5764706, 0, 1, 1,
0.7181396, -0.7596423, 1.418412, 0.5843138, 0, 1, 1,
0.7201577, -0.2724337, 1.523874, 0.5882353, 0, 1, 1,
0.7213078, -0.6354687, 3.10363, 0.5960785, 0, 1, 1,
0.7236592, 0.8351592, 1.304161, 0.6039216, 0, 1, 1,
0.7337607, -0.2132993, 0.09612965, 0.6078432, 0, 1, 1,
0.7345482, 1.102113, 1.704451, 0.6156863, 0, 1, 1,
0.7371773, -0.2382866, 3.919194, 0.6196079, 0, 1, 1,
0.7439639, 0.9153071, 1.442831, 0.627451, 0, 1, 1,
0.7445523, -0.2283456, 2.60243, 0.6313726, 0, 1, 1,
0.7466487, -1.186278, 1.765616, 0.6392157, 0, 1, 1,
0.7493107, 2.903914, 1.165316, 0.6431373, 0, 1, 1,
0.7501583, 1.295635, -0.7410805, 0.6509804, 0, 1, 1,
0.7517169, -0.06324186, 1.169577, 0.654902, 0, 1, 1,
0.7523344, -1.005351, 2.262886, 0.6627451, 0, 1, 1,
0.7568458, -0.5420848, 3.232744, 0.6666667, 0, 1, 1,
0.7633218, -0.1215711, 1.466581, 0.6745098, 0, 1, 1,
0.7707294, -0.05367306, 1.425658, 0.6784314, 0, 1, 1,
0.7724048, 0.666344, -0.427076, 0.6862745, 0, 1, 1,
0.7765689, 1.76704, 2.376208, 0.6901961, 0, 1, 1,
0.7814589, 0.7017068, 0.8233121, 0.6980392, 0, 1, 1,
0.7824504, -0.3732972, 2.295501, 0.7058824, 0, 1, 1,
0.7848666, 0.06572393, 1.391378, 0.7098039, 0, 1, 1,
0.7849597, 0.2422859, 0.8734199, 0.7176471, 0, 1, 1,
0.7878884, -2.516038, 1.533805, 0.7215686, 0, 1, 1,
0.788027, 1.520542, 0.9602041, 0.7294118, 0, 1, 1,
0.7996758, 0.5112414, 0.2389524, 0.7333333, 0, 1, 1,
0.7999167, 1.265113, -0.08613757, 0.7411765, 0, 1, 1,
0.8001842, -0.03412099, 1.53594, 0.7450981, 0, 1, 1,
0.8030366, 1.332968, -0.5799906, 0.7529412, 0, 1, 1,
0.8067405, -1.59654, 2.108101, 0.7568628, 0, 1, 1,
0.8109538, -0.2958746, 2.855055, 0.7647059, 0, 1, 1,
0.817045, -0.371368, 2.170465, 0.7686275, 0, 1, 1,
0.818526, -1.006286, 3.052372, 0.7764706, 0, 1, 1,
0.8186257, 1.433348, 0.3470155, 0.7803922, 0, 1, 1,
0.819546, 0.4315777, 1.251291, 0.7882353, 0, 1, 1,
0.8198464, 0.8388174, 1.481805, 0.7921569, 0, 1, 1,
0.8217646, -0.3569261, 1.668434, 0.8, 0, 1, 1,
0.8269289, -1.610377, 1.317997, 0.8078431, 0, 1, 1,
0.8281532, -0.9550212, 1.673875, 0.8117647, 0, 1, 1,
0.8412433, 0.5267109, 1.58795, 0.8196079, 0, 1, 1,
0.8415603, -0.8159419, 1.50361, 0.8235294, 0, 1, 1,
0.842857, 0.4862331, 2.016298, 0.8313726, 0, 1, 1,
0.8495001, -2.854242, 3.104542, 0.8352941, 0, 1, 1,
0.8556476, -1.437927, 1.346776, 0.8431373, 0, 1, 1,
0.8565511, 0.3762023, 0.7666305, 0.8470588, 0, 1, 1,
0.8601398, 0.4564201, 2.157066, 0.854902, 0, 1, 1,
0.8671693, -1.052325, 1.982934, 0.8588235, 0, 1, 1,
0.8784034, -0.03278848, 2.521674, 0.8666667, 0, 1, 1,
0.8802006, -0.8848252, 5.154822, 0.8705882, 0, 1, 1,
0.8813393, 0.7488005, -0.1943249, 0.8784314, 0, 1, 1,
0.8848338, -1.422381, 4.283175, 0.8823529, 0, 1, 1,
0.8852054, 0.5101814, 1.689537, 0.8901961, 0, 1, 1,
0.8915424, 0.00458101, 0.8729635, 0.8941177, 0, 1, 1,
0.9000812, 0.7916931, 0.4992219, 0.9019608, 0, 1, 1,
0.9009935, -0.590389, 2.643476, 0.9098039, 0, 1, 1,
0.9029579, -1.213871, 2.02367, 0.9137255, 0, 1, 1,
0.9041965, 0.2413027, 0.7033939, 0.9215686, 0, 1, 1,
0.9063456, 1.511187, -0.03797492, 0.9254902, 0, 1, 1,
0.9100591, -0.8753572, 3.16708, 0.9333333, 0, 1, 1,
0.911958, 0.1645152, 0.9406518, 0.9372549, 0, 1, 1,
0.918061, -1.023402, 0.9042721, 0.945098, 0, 1, 1,
0.921409, 0.5530435, -0.006655116, 0.9490196, 0, 1, 1,
0.925203, -0.2505675, 0.2335449, 0.9568627, 0, 1, 1,
0.9311906, 0.1496072, 0.3159504, 0.9607843, 0, 1, 1,
0.9324368, 0.5025857, 2.044858, 0.9686275, 0, 1, 1,
0.9389711, 0.3810492, 2.698503, 0.972549, 0, 1, 1,
0.951837, -0.1761158, 2.882268, 0.9803922, 0, 1, 1,
0.9528507, 0.02607533, 0.9518724, 0.9843137, 0, 1, 1,
0.9572781, -0.47459, 3.488247, 0.9921569, 0, 1, 1,
0.9597749, 1.269823, 2.180057, 0.9960784, 0, 1, 1,
0.9710832, -1.395914, 1.667635, 1, 0, 0.9960784, 1,
0.9714499, -0.9826128, 2.262412, 1, 0, 0.9882353, 1,
0.9778665, -1.084761, 1.254425, 1, 0, 0.9843137, 1,
0.9782431, 0.1243106, 1.628311, 1, 0, 0.9764706, 1,
0.9851897, -1.829239, 1.724627, 1, 0, 0.972549, 1,
0.9924021, -0.4383423, 0.8082017, 1, 0, 0.9647059, 1,
0.9948851, 1.277445, 1.358772, 1, 0, 0.9607843, 1,
0.9954102, -0.4503364, 1.397601, 1, 0, 0.9529412, 1,
1.003591, 0.8856691, 1.429863, 1, 0, 0.9490196, 1,
1.028458, -0.2323507, 1.354496, 1, 0, 0.9411765, 1,
1.030682, 2.435182, 0.6069707, 1, 0, 0.9372549, 1,
1.032757, 0.1172191, 0.6851522, 1, 0, 0.9294118, 1,
1.035361, -1.235619, 0.7634235, 1, 0, 0.9254902, 1,
1.04049, -0.2694248, 2.418745, 1, 0, 0.9176471, 1,
1.041548, -1.055401, 1.949404, 1, 0, 0.9137255, 1,
1.042657, -0.1272896, 0.3423401, 1, 0, 0.9058824, 1,
1.055481, -0.3577036, 1.026826, 1, 0, 0.9019608, 1,
1.057484, 1.366305, 1.140729, 1, 0, 0.8941177, 1,
1.058192, 0.7215905, 1.869054, 1, 0, 0.8862745, 1,
1.060694, -0.4860669, 3.202681, 1, 0, 0.8823529, 1,
1.060844, 0.834406, 1.719202, 1, 0, 0.8745098, 1,
1.064162, 0.9297597, 0.6692137, 1, 0, 0.8705882, 1,
1.067596, -1.566364, 1.940921, 1, 0, 0.8627451, 1,
1.074685, 1.165223, 0.7156147, 1, 0, 0.8588235, 1,
1.075477, 0.8437625, 0.5504341, 1, 0, 0.8509804, 1,
1.078513, 1.528494, 0.731843, 1, 0, 0.8470588, 1,
1.082762, 0.2676346, 1.677727, 1, 0, 0.8392157, 1,
1.088712, 0.4723549, 1.38536, 1, 0, 0.8352941, 1,
1.090013, 0.5865287, 0.9200976, 1, 0, 0.827451, 1,
1.09668, 1.276057, 1.832705, 1, 0, 0.8235294, 1,
1.097795, 0.1902718, 2.042107, 1, 0, 0.8156863, 1,
1.102357, -1.021977, 3.484366, 1, 0, 0.8117647, 1,
1.105443, -0.3645576, 1.246611, 1, 0, 0.8039216, 1,
1.106546, -2.029742, 1.858094, 1, 0, 0.7960784, 1,
1.108302, 0.1012462, 1.480245, 1, 0, 0.7921569, 1,
1.113135, 0.0839655, 1.043748, 1, 0, 0.7843137, 1,
1.127712, -0.8263055, 2.059407, 1, 0, 0.7803922, 1,
1.133699, -2.235367, 4.1179, 1, 0, 0.772549, 1,
1.140417, 0.2688851, 0.2624311, 1, 0, 0.7686275, 1,
1.151669, 0.9609596, 1.182275, 1, 0, 0.7607843, 1,
1.155145, -0.5566692, 1.133926, 1, 0, 0.7568628, 1,
1.158421, 1.827454, 1.661111, 1, 0, 0.7490196, 1,
1.161874, -0.930954, 2.780346, 1, 0, 0.7450981, 1,
1.168056, 2.150777, 0.4784038, 1, 0, 0.7372549, 1,
1.171771, -0.6594034, 2.468205, 1, 0, 0.7333333, 1,
1.171829, 1.438334, -0.3866366, 1, 0, 0.7254902, 1,
1.17781, 1.067221, 1.458189, 1, 0, 0.7215686, 1,
1.181036, 1.225049, -0.620097, 1, 0, 0.7137255, 1,
1.18267, -1.131946, 4.314573, 1, 0, 0.7098039, 1,
1.182826, -0.5713375, 0.4326263, 1, 0, 0.7019608, 1,
1.184049, -0.3362901, 0.9704753, 1, 0, 0.6941177, 1,
1.186047, 1.429374, 1.435766, 1, 0, 0.6901961, 1,
1.189702, 1.23288, -1.229715, 1, 0, 0.682353, 1,
1.192631, 0.5455095, 0.8296145, 1, 0, 0.6784314, 1,
1.202157, 0.936828, 1.717464, 1, 0, 0.6705883, 1,
1.207876, -0.9811515, 2.794809, 1, 0, 0.6666667, 1,
1.21074, 0.7906145, 1.77076, 1, 0, 0.6588235, 1,
1.212663, 1.692793, 1.482229, 1, 0, 0.654902, 1,
1.216392, -0.0752852, -0.150427, 1, 0, 0.6470588, 1,
1.219135, -0.09888449, 3.861093, 1, 0, 0.6431373, 1,
1.219286, -0.1592714, 3.307174, 1, 0, 0.6352941, 1,
1.221456, -0.106551, 1.233119, 1, 0, 0.6313726, 1,
1.221619, 1.044014, 1.478084, 1, 0, 0.6235294, 1,
1.227896, 0.4625598, 2.177269, 1, 0, 0.6196079, 1,
1.228928, 0.3801416, -0.02815617, 1, 0, 0.6117647, 1,
1.244668, -1.339664, 0.1019532, 1, 0, 0.6078432, 1,
1.249146, 0.005321479, 0.6766624, 1, 0, 0.6, 1,
1.258219, 0.3129309, 1.618725, 1, 0, 0.5921569, 1,
1.262552, -1.157691, 1.641215, 1, 0, 0.5882353, 1,
1.265636, 0.5213888, 1.703334, 1, 0, 0.5803922, 1,
1.270016, -0.9526963, 1.922362, 1, 0, 0.5764706, 1,
1.279123, -0.2884265, 1.410857, 1, 0, 0.5686275, 1,
1.291306, 0.3938158, 1.077722, 1, 0, 0.5647059, 1,
1.300651, -0.09273123, 1.382746, 1, 0, 0.5568628, 1,
1.308753, 0.7113794, 0.3524838, 1, 0, 0.5529412, 1,
1.320469, -1.603314, 2.018843, 1, 0, 0.5450981, 1,
1.326291, -0.5521406, 1.496282, 1, 0, 0.5411765, 1,
1.342309, -1.053091, 2.924913, 1, 0, 0.5333334, 1,
1.354086, 0.3856589, -0.1097222, 1, 0, 0.5294118, 1,
1.388209, 1.090665, 2.141926, 1, 0, 0.5215687, 1,
1.395263, 0.2414423, 1.566112, 1, 0, 0.5176471, 1,
1.39721, -1.708207, 1.064346, 1, 0, 0.509804, 1,
1.41035, -0.00771121, 1.390372, 1, 0, 0.5058824, 1,
1.422926, -0.860352, 4.479249, 1, 0, 0.4980392, 1,
1.445085, -0.4341149, 1.209133, 1, 0, 0.4901961, 1,
1.458202, -0.4314467, 1.890297, 1, 0, 0.4862745, 1,
1.464707, -2.049428, 2.853049, 1, 0, 0.4784314, 1,
1.465491, 0.0853025, 3.107607, 1, 0, 0.4745098, 1,
1.477136, -0.7856299, 2.837189, 1, 0, 0.4666667, 1,
1.503377, -2.715852, 2.071809, 1, 0, 0.4627451, 1,
1.509216, -0.4771738, 1.125998, 1, 0, 0.454902, 1,
1.509656, 0.2743028, -0.5658998, 1, 0, 0.4509804, 1,
1.521388, 1.38008, 1.52922, 1, 0, 0.4431373, 1,
1.522304, 1.070832, 0.2288474, 1, 0, 0.4392157, 1,
1.539499, 0.6760477, -0.1677767, 1, 0, 0.4313726, 1,
1.565808, 1.234557, 0.3360927, 1, 0, 0.427451, 1,
1.566414, 1.635328, -0.2676302, 1, 0, 0.4196078, 1,
1.5778, -1.161625, 0.6317319, 1, 0, 0.4156863, 1,
1.600759, -2.73118, 2.256428, 1, 0, 0.4078431, 1,
1.610344, 0.1565627, 0.872096, 1, 0, 0.4039216, 1,
1.612611, -0.5291392, 2.319986, 1, 0, 0.3960784, 1,
1.615891, -0.5162346, 4.365305, 1, 0, 0.3882353, 1,
1.618652, 0.9867461, 1.381421, 1, 0, 0.3843137, 1,
1.621216, -1.084179, 1.656862, 1, 0, 0.3764706, 1,
1.623576, -0.9866521, 1.950195, 1, 0, 0.372549, 1,
1.623874, 1.159541, 1.456761, 1, 0, 0.3647059, 1,
1.624628, -0.5580534, 1.316177, 1, 0, 0.3607843, 1,
1.626428, -0.1657584, 2.180269, 1, 0, 0.3529412, 1,
1.630709, 2.273891, -1.877167, 1, 0, 0.3490196, 1,
1.648038, -0.414988, 0.5133762, 1, 0, 0.3411765, 1,
1.657404, 0.380064, 1.947172, 1, 0, 0.3372549, 1,
1.663359, -0.7568428, 2.477852, 1, 0, 0.3294118, 1,
1.6927, -1.088801, 2.494913, 1, 0, 0.3254902, 1,
1.694479, 0.04617719, 1.36552, 1, 0, 0.3176471, 1,
1.697298, 0.3699757, 2.415362, 1, 0, 0.3137255, 1,
1.697505, 1.001796, 0.9988817, 1, 0, 0.3058824, 1,
1.70446, 0.4665582, 2.94177, 1, 0, 0.2980392, 1,
1.731985, -3.130293, 4.619512, 1, 0, 0.2941177, 1,
1.736659, 0.8414209, 3.705606, 1, 0, 0.2862745, 1,
1.740139, 1.392451, 0.8190714, 1, 0, 0.282353, 1,
1.760315, 1.220433, 0.3786966, 1, 0, 0.2745098, 1,
1.805689, -0.1884624, 2.899334, 1, 0, 0.2705882, 1,
1.817795, -0.2194828, -0.1381829, 1, 0, 0.2627451, 1,
1.827922, -0.01405532, 0.5278954, 1, 0, 0.2588235, 1,
1.844638, 2.20267, 0.9837124, 1, 0, 0.2509804, 1,
1.857875, 0.3750618, 2.559086, 1, 0, 0.2470588, 1,
1.866404, -0.9727836, 1.464272, 1, 0, 0.2392157, 1,
1.874001, -0.2204175, 3.045777, 1, 0, 0.2352941, 1,
1.883729, -0.5323598, 4.549652, 1, 0, 0.227451, 1,
1.894973, 0.2007673, 1.354719, 1, 0, 0.2235294, 1,
1.902248, 0.3958021, -0.2582808, 1, 0, 0.2156863, 1,
1.913781, 1.049883, 0.5238695, 1, 0, 0.2117647, 1,
1.920156, 0.8454583, 1.699196, 1, 0, 0.2039216, 1,
1.933598, 0.2700434, 1.28051, 1, 0, 0.1960784, 1,
1.980034, 1.25334, 1.117482, 1, 0, 0.1921569, 1,
1.999552, -0.1635973, 0.7129714, 1, 0, 0.1843137, 1,
2.005112, 1.027486, 0.540817, 1, 0, 0.1803922, 1,
2.026118, 0.7732913, 0.2413751, 1, 0, 0.172549, 1,
2.033931, -1.610006, 3.455997, 1, 0, 0.1686275, 1,
2.035725, 0.0463434, 0.3204413, 1, 0, 0.1607843, 1,
2.048458, 0.929261, 0.6634768, 1, 0, 0.1568628, 1,
2.072978, 0.4299383, 0.8962334, 1, 0, 0.1490196, 1,
2.07989, -0.08643068, 0.1067949, 1, 0, 0.145098, 1,
2.086625, 0.5344202, 2.113184, 1, 0, 0.1372549, 1,
2.132538, -2.028542, 2.691591, 1, 0, 0.1333333, 1,
2.150279, 0.1709474, 2.322331, 1, 0, 0.1254902, 1,
2.174242, -1.213647, 1.612006, 1, 0, 0.1215686, 1,
2.191591, 0.7064911, -0.1602825, 1, 0, 0.1137255, 1,
2.192999, 1.527002, 0.2380345, 1, 0, 0.1098039, 1,
2.201973, -2.11189, 2.024543, 1, 0, 0.1019608, 1,
2.219379, -1.007401, 1.036145, 1, 0, 0.09411765, 1,
2.229295, 0.8784376, 1.913534, 1, 0, 0.09019608, 1,
2.238315, -0.6629728, 2.89195, 1, 0, 0.08235294, 1,
2.2563, 0.2424935, 2.331278, 1, 0, 0.07843138, 1,
2.265704, 1.213043, 0.5899711, 1, 0, 0.07058824, 1,
2.266959, 0.7913182, 1.967296, 1, 0, 0.06666667, 1,
2.358168, 0.8002867, -0.2203717, 1, 0, 0.05882353, 1,
2.395072, 1.634898, 0.2225596, 1, 0, 0.05490196, 1,
2.395698, 0.2519698, 1.767127, 1, 0, 0.04705882, 1,
2.412868, 0.9693689, 0.7179937, 1, 0, 0.04313726, 1,
2.480799, -0.08147091, 3.785678, 1, 0, 0.03529412, 1,
2.618567, 0.1159015, -0.4345015, 1, 0, 0.03137255, 1,
2.630469, -1.497781, 1.964022, 1, 0, 0.02352941, 1,
2.644559, 0.05794837, 1.140483, 1, 0, 0.01960784, 1,
2.654878, -1.398414, 2.339485, 1, 0, 0.01176471, 1,
2.815988, 0.8041937, 0.6194154, 1, 0, 0.007843138, 1
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
-0.1932292, -5.35867, -6.450065, 0, -0.5, 0.5, 0.5,
-0.1932292, -5.35867, -6.450065, 1, -0.5, 0.5, 0.5,
-0.1932292, -5.35867, -6.450065, 1, 1.5, 0.5, 0.5,
-0.1932292, -5.35867, -6.450065, 0, 1.5, 0.5, 0.5
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
-4.22257, -0.3334413, -6.450065, 0, -0.5, 0.5, 0.5,
-4.22257, -0.3334413, -6.450065, 1, -0.5, 0.5, 0.5,
-4.22257, -0.3334413, -6.450065, 1, 1.5, 0.5, 0.5,
-4.22257, -0.3334413, -6.450065, 0, 1.5, 0.5, 0.5
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
-4.22257, -5.35867, 0.258615, 0, -0.5, 0.5, 0.5,
-4.22257, -5.35867, 0.258615, 1, -0.5, 0.5, 0.5,
-4.22257, -5.35867, 0.258615, 1, 1.5, 0.5, 0.5,
-4.22257, -5.35867, 0.258615, 0, 1.5, 0.5, 0.5
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
-3, -4.199002, -4.901908,
2, -4.199002, -4.901908,
-3, -4.199002, -4.901908,
-3, -4.39228, -5.159935,
-2, -4.199002, -4.901908,
-2, -4.39228, -5.159935,
-1, -4.199002, -4.901908,
-1, -4.39228, -5.159935,
0, -4.199002, -4.901908,
0, -4.39228, -5.159935,
1, -4.199002, -4.901908,
1, -4.39228, -5.159935,
2, -4.199002, -4.901908,
2, -4.39228, -5.159935
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
-3, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
-3, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
-3, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
-3, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5,
-2, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
-2, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
-2, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
-2, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5,
-1, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
-1, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
-1, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
-1, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5,
0, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
0, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
0, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
0, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5,
1, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
1, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
1, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
1, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5,
2, -4.778836, -5.675987, 0, -0.5, 0.5, 0.5,
2, -4.778836, -5.675987, 1, -0.5, 0.5, 0.5,
2, -4.778836, -5.675987, 1, 1.5, 0.5, 0.5,
2, -4.778836, -5.675987, 0, 1.5, 0.5, 0.5
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
-3.292722, -4, -4.901908,
-3.292722, 2, -4.901908,
-3.292722, -4, -4.901908,
-3.447697, -4, -5.159935,
-3.292722, -2, -4.901908,
-3.447697, -2, -5.159935,
-3.292722, 0, -4.901908,
-3.447697, 0, -5.159935,
-3.292722, 2, -4.901908,
-3.447697, 2, -5.159935
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
"-4",
"-2",
"0",
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
-3.757647, -4, -5.675987, 0, -0.5, 0.5, 0.5,
-3.757647, -4, -5.675987, 1, -0.5, 0.5, 0.5,
-3.757647, -4, -5.675987, 1, 1.5, 0.5, 0.5,
-3.757647, -4, -5.675987, 0, 1.5, 0.5, 0.5,
-3.757647, -2, -5.675987, 0, -0.5, 0.5, 0.5,
-3.757647, -2, -5.675987, 1, -0.5, 0.5, 0.5,
-3.757647, -2, -5.675987, 1, 1.5, 0.5, 0.5,
-3.757647, -2, -5.675987, 0, 1.5, 0.5, 0.5,
-3.757647, 0, -5.675987, 0, -0.5, 0.5, 0.5,
-3.757647, 0, -5.675987, 1, -0.5, 0.5, 0.5,
-3.757647, 0, -5.675987, 1, 1.5, 0.5, 0.5,
-3.757647, 0, -5.675987, 0, 1.5, 0.5, 0.5,
-3.757647, 2, -5.675987, 0, -0.5, 0.5, 0.5,
-3.757647, 2, -5.675987, 1, -0.5, 0.5, 0.5,
-3.757647, 2, -5.675987, 1, 1.5, 0.5, 0.5,
-3.757647, 2, -5.675987, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.292722, -4.199002, -4,
-3.292722, -4.199002, 4,
-3.292722, -4.199002, -4,
-3.447697, -4.39228, -4,
-3.292722, -4.199002, -2,
-3.447697, -4.39228, -2,
-3.292722, -4.199002, 0,
-3.447697, -4.39228, 0,
-3.292722, -4.199002, 2,
-3.447697, -4.39228, 2,
-3.292722, -4.199002, 4,
-3.447697, -4.39228, 4
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
-3.757647, -4.778836, -4, 0, -0.5, 0.5, 0.5,
-3.757647, -4.778836, -4, 1, -0.5, 0.5, 0.5,
-3.757647, -4.778836, -4, 1, 1.5, 0.5, 0.5,
-3.757647, -4.778836, -4, 0, 1.5, 0.5, 0.5,
-3.757647, -4.778836, -2, 0, -0.5, 0.5, 0.5,
-3.757647, -4.778836, -2, 1, -0.5, 0.5, 0.5,
-3.757647, -4.778836, -2, 1, 1.5, 0.5, 0.5,
-3.757647, -4.778836, -2, 0, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 0, 0, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 0, 1, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 0, 1, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 0, 0, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 2, 0, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 2, 1, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 2, 1, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 2, 0, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 4, 0, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 4, 1, -0.5, 0.5, 0.5,
-3.757647, -4.778836, 4, 1, 1.5, 0.5, 0.5,
-3.757647, -4.778836, 4, 0, 1.5, 0.5, 0.5
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
-3.292722, -4.199002, -4.901908,
-3.292722, 3.53212, -4.901908,
-3.292722, -4.199002, 5.419138,
-3.292722, 3.53212, 5.419138,
-3.292722, -4.199002, -4.901908,
-3.292722, -4.199002, 5.419138,
-3.292722, 3.53212, -4.901908,
-3.292722, 3.53212, 5.419138,
-3.292722, -4.199002, -4.901908,
2.906264, -4.199002, -4.901908,
-3.292722, -4.199002, 5.419138,
2.906264, -4.199002, 5.419138,
-3.292722, 3.53212, -4.901908,
2.906264, 3.53212, -4.901908,
-3.292722, 3.53212, 5.419138,
2.906264, 3.53212, 5.419138,
2.906264, -4.199002, -4.901908,
2.906264, 3.53212, -4.901908,
2.906264, -4.199002, 5.419138,
2.906264, 3.53212, 5.419138,
2.906264, -4.199002, -4.901908,
2.906264, -4.199002, 5.419138,
2.906264, 3.53212, -4.901908,
2.906264, 3.53212, 5.419138
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
var radius = 7.640246;
var distance = 33.99232;
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
mvMatrix.translate( 0.1932292, 0.3334413, -0.258615 );
mvMatrix.scale( 1.332602, 1.06851, 0.8003824 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.99232);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.202446, 0.02082081, -1.145401, 0, 0, 1, 1, 1,
-3.031927, 0.3857212, -3.185728, 1, 0, 0, 1, 1,
-2.858631, 0.2174627, -0.5383682, 1, 0, 0, 1, 1,
-2.820431, 0.288692, 0.5481714, 1, 0, 0, 1, 1,
-2.80764, -0.08214365, -1.359995, 1, 0, 0, 1, 1,
-2.755616, -0.3064585, -1.604351, 1, 0, 0, 1, 1,
-2.586798, -0.3488075, -2.95284, 0, 0, 0, 1, 1,
-2.497979, 1.183439, -0.2853999, 0, 0, 0, 1, 1,
-2.447598, -0.02148788, -1.242396, 0, 0, 0, 1, 1,
-2.401808, 0.2543932, 0.3847431, 0, 0, 0, 1, 1,
-2.391244, 0.7259228, -2.833513, 0, 0, 0, 1, 1,
-2.363173, 2.349284, -1.042174, 0, 0, 0, 1, 1,
-2.335246, -1.174299, -0.8270559, 0, 0, 0, 1, 1,
-2.324567, 0.7523644, 0.7535311, 1, 1, 1, 1, 1,
-2.224708, 1.612061, -0.5292687, 1, 1, 1, 1, 1,
-2.17743, -1.372604, -2.836513, 1, 1, 1, 1, 1,
-2.164606, -1.333959, -0.3530053, 1, 1, 1, 1, 1,
-2.138898, 1.005672, -1.390577, 1, 1, 1, 1, 1,
-2.125865, 0.1882862, -2.529357, 1, 1, 1, 1, 1,
-2.120886, -1.592092, -2.219254, 1, 1, 1, 1, 1,
-2.120727, 0.6124015, -3.982728, 1, 1, 1, 1, 1,
-2.107315, 0.1469363, -3.450808, 1, 1, 1, 1, 1,
-2.066676, 0.07936098, -2.366732, 1, 1, 1, 1, 1,
-1.989379, -0.5376228, -2.378223, 1, 1, 1, 1, 1,
-1.942867, -1.013139, -2.489724, 1, 1, 1, 1, 1,
-1.934993, 0.6945755, 0.4511116, 1, 1, 1, 1, 1,
-1.929646, 1.408844, -1.028711, 1, 1, 1, 1, 1,
-1.926056, 0.5135013, -3.035973, 1, 1, 1, 1, 1,
-1.883187, -0.655513, -3.037903, 0, 0, 1, 1, 1,
-1.876306, -0.3572849, -1.824213, 1, 0, 0, 1, 1,
-1.87291, -0.822861, -3.429206, 1, 0, 0, 1, 1,
-1.867474, 0.7895495, -1.075346, 1, 0, 0, 1, 1,
-1.847208, 0.8770111, -3.083863, 1, 0, 0, 1, 1,
-1.822085, -1.680515, -2.789161, 1, 0, 0, 1, 1,
-1.804078, 1.072906, -0.06600446, 0, 0, 0, 1, 1,
-1.800455, -0.1211888, -2.092867, 0, 0, 0, 1, 1,
-1.787698, 0.9903228, -1.689236, 0, 0, 0, 1, 1,
-1.7835, -1.733751, 0.1548882, 0, 0, 0, 1, 1,
-1.772103, -0.3476892, -2.459724, 0, 0, 0, 1, 1,
-1.756469, -1.680301, -2.842749, 0, 0, 0, 1, 1,
-1.743531, 0.3890926, -0.9711318, 0, 0, 0, 1, 1,
-1.741567, -2.006458, -3.921161, 1, 1, 1, 1, 1,
-1.732111, 0.4052429, 0.5573127, 1, 1, 1, 1, 1,
-1.723219, -0.02306444, -0.8025696, 1, 1, 1, 1, 1,
-1.717359, 0.1651725, -3.165412, 1, 1, 1, 1, 1,
-1.704195, 0.02308, -1.069087, 1, 1, 1, 1, 1,
-1.691801, 2.143577, 0.07130771, 1, 1, 1, 1, 1,
-1.69013, -0.08899218, -2.839716, 1, 1, 1, 1, 1,
-1.688358, 1.259057, -0.5642372, 1, 1, 1, 1, 1,
-1.663292, 1.171533, 0.7239705, 1, 1, 1, 1, 1,
-1.650253, -0.4532, -2.107122, 1, 1, 1, 1, 1,
-1.643751, -0.02671729, -2.202709, 1, 1, 1, 1, 1,
-1.642628, -0.2277581, -1.566723, 1, 1, 1, 1, 1,
-1.633768, 0.1004229, -1.470267, 1, 1, 1, 1, 1,
-1.628058, -0.1324384, -1.623252, 1, 1, 1, 1, 1,
-1.606729, 1.312131, -1.436331, 1, 1, 1, 1, 1,
-1.605049, 0.2426673, -1.595931, 0, 0, 1, 1, 1,
-1.592516, 0.01859874, -2.591424, 1, 0, 0, 1, 1,
-1.590262, -0.9706231, -1.271351, 1, 0, 0, 1, 1,
-1.586581, 1.261559, -0.9098061, 1, 0, 0, 1, 1,
-1.563275, 0.4230689, -1.203585, 1, 0, 0, 1, 1,
-1.557562, 0.4364322, -1.426874, 1, 0, 0, 1, 1,
-1.541829, -0.5439683, -1.111204, 0, 0, 0, 1, 1,
-1.540735, 0.7996496, -1.950192, 0, 0, 0, 1, 1,
-1.540252, 1.203124, -1.775559, 0, 0, 0, 1, 1,
-1.538405, 1.444978, -2.083373, 0, 0, 0, 1, 1,
-1.532614, -0.4718811, -1.519222, 0, 0, 0, 1, 1,
-1.522376, 0.09476934, -1.286544, 0, 0, 0, 1, 1,
-1.513716, -0.8086386, -1.069992, 0, 0, 0, 1, 1,
-1.511491, 1.115389, -0.0287469, 1, 1, 1, 1, 1,
-1.502557, -0.5358927, -1.181973, 1, 1, 1, 1, 1,
-1.498594, -0.2157348, -1.762562, 1, 1, 1, 1, 1,
-1.487751, 0.4169978, -1.0518, 1, 1, 1, 1, 1,
-1.484412, 1.032778, -1.22061, 1, 1, 1, 1, 1,
-1.477271, 0.4515642, -1.832417, 1, 1, 1, 1, 1,
-1.476339, -0.863667, -2.414456, 1, 1, 1, 1, 1,
-1.469508, -0.4467944, -1.519592, 1, 1, 1, 1, 1,
-1.467068, 0.2342989, -1.337725, 1, 1, 1, 1, 1,
-1.461169, 0.1134763, -2.758418, 1, 1, 1, 1, 1,
-1.43825, -0.353541, -2.323054, 1, 1, 1, 1, 1,
-1.434128, 2.021077, -2.159233, 1, 1, 1, 1, 1,
-1.433703, 1.434992, 0.8760586, 1, 1, 1, 1, 1,
-1.433563, 0.7569249, 0.2447475, 1, 1, 1, 1, 1,
-1.41251, -0.678626, 0.1590311, 1, 1, 1, 1, 1,
-1.411375, -0.7039677, -2.432944, 0, 0, 1, 1, 1,
-1.408703, 0.6570406, -0.5559801, 1, 0, 0, 1, 1,
-1.408109, -0.7023214, -1.49536, 1, 0, 0, 1, 1,
-1.401356, 1.223071, -1.112195, 1, 0, 0, 1, 1,
-1.400279, -1.614115, -2.73261, 1, 0, 0, 1, 1,
-1.398475, 1.446186, -0.234883, 1, 0, 0, 1, 1,
-1.39785, -0.4405878, -1.500891, 0, 0, 0, 1, 1,
-1.39122, 0.7874446, -1.441575, 0, 0, 0, 1, 1,
-1.384867, -0.2160942, -1.927083, 0, 0, 0, 1, 1,
-1.382956, -0.5050032, -1.925522, 0, 0, 0, 1, 1,
-1.3791, -0.1191161, -1.879746, 0, 0, 0, 1, 1,
-1.376238, 0.8820031, -1.570739, 0, 0, 0, 1, 1,
-1.372796, -0.5289131, -1.826346, 0, 0, 0, 1, 1,
-1.372386, -0.5678113, -1.732166, 1, 1, 1, 1, 1,
-1.365814, 1.218485, -1.832194, 1, 1, 1, 1, 1,
-1.358032, -0.4765235, -0.6885737, 1, 1, 1, 1, 1,
-1.351231, -0.1521558, -1.397249, 1, 1, 1, 1, 1,
-1.344773, -0.3446109, -1.973648, 1, 1, 1, 1, 1,
-1.336149, 0.7492128, -2.661345, 1, 1, 1, 1, 1,
-1.330048, -1.380612, -2.462274, 1, 1, 1, 1, 1,
-1.329214, -0.1485004, -2.692605, 1, 1, 1, 1, 1,
-1.321965, -2.024111, -2.479629, 1, 1, 1, 1, 1,
-1.317469, 1.071658, 0.310393, 1, 1, 1, 1, 1,
-1.292079, -0.2179475, -0.8612819, 1, 1, 1, 1, 1,
-1.288731, -0.4095691, -2.75864, 1, 1, 1, 1, 1,
-1.287943, -1.118479, -3.715979, 1, 1, 1, 1, 1,
-1.287848, -0.9180423, -3.086967, 1, 1, 1, 1, 1,
-1.279627, 0.1079864, -1.541665, 1, 1, 1, 1, 1,
-1.275466, -2.430754, -2.988443, 0, 0, 1, 1, 1,
-1.270359, -0.703306, -2.155774, 1, 0, 0, 1, 1,
-1.263004, 0.1389984, 0.01434665, 1, 0, 0, 1, 1,
-1.259908, -0.7727419, -3.61041, 1, 0, 0, 1, 1,
-1.258247, 0.7043082, -2.480789, 1, 0, 0, 1, 1,
-1.25173, 0.009883376, 0.6255221, 1, 0, 0, 1, 1,
-1.235911, -0.5502955, -1.383775, 0, 0, 0, 1, 1,
-1.235843, 1.112265, -0.6557115, 0, 0, 0, 1, 1,
-1.229689, -0.3529493, -0.8645649, 0, 0, 0, 1, 1,
-1.228407, -1.441112, -2.063569, 0, 0, 0, 1, 1,
-1.220984, 1.844183, -1.800745, 0, 0, 0, 1, 1,
-1.219681, 0.1909428, -2.162111, 0, 0, 0, 1, 1,
-1.217154, 0.6856546, -2.305557, 0, 0, 0, 1, 1,
-1.216234, 0.637288, -0.1312855, 1, 1, 1, 1, 1,
-1.212596, 0.009830185, -2.934526, 1, 1, 1, 1, 1,
-1.196796, -0.3111187, -1.788455, 1, 1, 1, 1, 1,
-1.196254, 1.357604, -1.908992, 1, 1, 1, 1, 1,
-1.189452, 0.9820213, 0.04155479, 1, 1, 1, 1, 1,
-1.185822, 0.4509419, -0.8105175, 1, 1, 1, 1, 1,
-1.18279, 1.317788, -2.812868, 1, 1, 1, 1, 1,
-1.182349, -0.01454609, -1.259761, 1, 1, 1, 1, 1,
-1.178186, 0.05049136, -2.516176, 1, 1, 1, 1, 1,
-1.170604, 0.002125498, -2.310762, 1, 1, 1, 1, 1,
-1.160641, -1.459432, -2.981729, 1, 1, 1, 1, 1,
-1.147813, -0.4261677, -1.402748, 1, 1, 1, 1, 1,
-1.146933, -0.2715443, -2.266556, 1, 1, 1, 1, 1,
-1.142284, -1.200574, -2.408912, 1, 1, 1, 1, 1,
-1.126993, 1.905325, 0.8729367, 1, 1, 1, 1, 1,
-1.126756, -0.1429147, -0.741638, 0, 0, 1, 1, 1,
-1.117686, 0.7637453, 0.2974593, 1, 0, 0, 1, 1,
-1.117458, 0.239453, -2.566723, 1, 0, 0, 1, 1,
-1.117297, -2.168828, -3.514388, 1, 0, 0, 1, 1,
-1.106728, -0.2203764, -0.9065179, 1, 0, 0, 1, 1,
-1.09882, -1.329814, -1.901139, 1, 0, 0, 1, 1,
-1.096615, 0.630828, -0.6801853, 0, 0, 0, 1, 1,
-1.095016, 0.09406069, -2.469495, 0, 0, 0, 1, 1,
-1.09478, 0.3066347, -2.385948, 0, 0, 0, 1, 1,
-1.084765, -0.3904269, -2.820718, 0, 0, 0, 1, 1,
-1.084062, -0.5028112, -0.662313, 0, 0, 0, 1, 1,
-1.078496, -0.784288, -2.6697, 0, 0, 0, 1, 1,
-1.078339, -0.4536489, -3.760484, 0, 0, 0, 1, 1,
-1.071447, 0.4782383, -2.004361, 1, 1, 1, 1, 1,
-1.067989, -0.1990093, -1.539827, 1, 1, 1, 1, 1,
-1.065758, -0.5082583, -3.460541, 1, 1, 1, 1, 1,
-1.060358, 0.03723726, -0.7426829, 1, 1, 1, 1, 1,
-1.036932, -0.1559951, -0.8968475, 1, 1, 1, 1, 1,
-1.033178, -1.204086, -1.865854, 1, 1, 1, 1, 1,
-1.030465, -0.2204441, 0.579636, 1, 1, 1, 1, 1,
-1.021787, -0.2826789, 0.05935466, 1, 1, 1, 1, 1,
-1.021538, 0.9091142, 0.6067429, 1, 1, 1, 1, 1,
-1.021084, -0.8112983, -2.100302, 1, 1, 1, 1, 1,
-1.020277, 1.478532, 0.1530374, 1, 1, 1, 1, 1,
-1.018135, 0.06081483, 0.3073771, 1, 1, 1, 1, 1,
-1.012434, -0.5786063, -1.882828, 1, 1, 1, 1, 1,
-1.009659, -0.8229142, -2.615782, 1, 1, 1, 1, 1,
-1.001514, 0.5805231, -0.6047192, 1, 1, 1, 1, 1,
-0.9929579, 0.4782209, -0.7052426, 0, 0, 1, 1, 1,
-0.9914087, 0.4134239, -2.326431, 1, 0, 0, 1, 1,
-0.9894877, 0.3743398, -1.019401, 1, 0, 0, 1, 1,
-0.9877112, -0.6312351, -1.87499, 1, 0, 0, 1, 1,
-0.9861825, -0.164288, -0.9107064, 1, 0, 0, 1, 1,
-0.9817365, 0.04032765, -1.088785, 1, 0, 0, 1, 1,
-0.9755334, -0.1927623, -1.264642, 0, 0, 0, 1, 1,
-0.9727604, 0.9162666, -2.488172, 0, 0, 0, 1, 1,
-0.9665054, -0.4726363, -1.759276, 0, 0, 0, 1, 1,
-0.9636738, -0.7985763, -3.391055, 0, 0, 0, 1, 1,
-0.9574541, -1.290946, -2.587784, 0, 0, 0, 1, 1,
-0.9558822, -0.1676164, -0.818518, 0, 0, 0, 1, 1,
-0.9543123, -0.5883973, -1.894025, 0, 0, 0, 1, 1,
-0.9531555, 0.6482615, -0.4446361, 1, 1, 1, 1, 1,
-0.9504421, -1.404819, -1.398624, 1, 1, 1, 1, 1,
-0.9394708, 0.4654395, -1.732736, 1, 1, 1, 1, 1,
-0.9349217, -0.4227965, -1.938506, 1, 1, 1, 1, 1,
-0.9313219, 0.2750332, -0.4066676, 1, 1, 1, 1, 1,
-0.9303879, -1.703554, -1.599145, 1, 1, 1, 1, 1,
-0.9267791, -0.8912249, -2.479002, 1, 1, 1, 1, 1,
-0.9208807, 0.4223571, -0.9203519, 1, 1, 1, 1, 1,
-0.9132804, -1.59418, -2.875903, 1, 1, 1, 1, 1,
-0.9124498, 1.759919, -0.8117216, 1, 1, 1, 1, 1,
-0.904098, 0.4259319, -0.5484252, 1, 1, 1, 1, 1,
-0.9033199, -0.8536473, -2.095111, 1, 1, 1, 1, 1,
-0.9026946, 0.1587582, -3.824145, 1, 1, 1, 1, 1,
-0.9024017, 0.5907646, -0.6317276, 1, 1, 1, 1, 1,
-0.9004251, 0.3514206, -2.931269, 1, 1, 1, 1, 1,
-0.8942667, 1.105406, -0.3979484, 0, 0, 1, 1, 1,
-0.8921762, 0.01289613, -0.2000849, 1, 0, 0, 1, 1,
-0.8871045, 2.513296, -0.8308812, 1, 0, 0, 1, 1,
-0.8845901, 0.9165559, 0.6645605, 1, 0, 0, 1, 1,
-0.8845822, 0.5624921, -1.071982, 1, 0, 0, 1, 1,
-0.8829831, 1.203149, -1.226167, 1, 0, 0, 1, 1,
-0.8690864, 2.384686, -0.03236636, 0, 0, 0, 1, 1,
-0.8688568, -0.2097447, -1.192262, 0, 0, 0, 1, 1,
-0.8685734, -0.1233396, -1.365481, 0, 0, 0, 1, 1,
-0.8569068, -2.117171, -1.607106, 0, 0, 0, 1, 1,
-0.8527533, 1.633991, -0.7112195, 0, 0, 0, 1, 1,
-0.8508919, 0.6718873, -1.328545, 0, 0, 0, 1, 1,
-0.846086, 1.017851, 0.4304835, 0, 0, 0, 1, 1,
-0.8458905, -1.992, -3.68564, 1, 1, 1, 1, 1,
-0.8405005, -0.7329946, -3.569579, 1, 1, 1, 1, 1,
-0.8392838, -1.490864, -2.057802, 1, 1, 1, 1, 1,
-0.8392302, 0.3869916, -1.882259, 1, 1, 1, 1, 1,
-0.8369313, 1.198431, 0.07606366, 1, 1, 1, 1, 1,
-0.831781, 0.5368329, -1.164906, 1, 1, 1, 1, 1,
-0.8267793, -0.3220537, 0.0186816, 1, 1, 1, 1, 1,
-0.8246829, 0.5060312, -2.024062, 1, 1, 1, 1, 1,
-0.823624, 0.1347194, -0.4120304, 1, 1, 1, 1, 1,
-0.8216913, -1.476672, -1.706201, 1, 1, 1, 1, 1,
-0.8195652, 1.027059, -1.510745, 1, 1, 1, 1, 1,
-0.8136814, -0.5510474, -1.786777, 1, 1, 1, 1, 1,
-0.8116904, -1.431945, -2.958616, 1, 1, 1, 1, 1,
-0.8052814, 1.548497, -1.010185, 1, 1, 1, 1, 1,
-0.8049332, 0.8363877, -0.1236321, 1, 1, 1, 1, 1,
-0.8020774, 0.3869436, -1.59011, 0, 0, 1, 1, 1,
-0.7999941, -1.771603, -2.846208, 1, 0, 0, 1, 1,
-0.7989897, 0.8504093, -1.637527, 1, 0, 0, 1, 1,
-0.7956175, 0.2223445, -0.9104388, 1, 0, 0, 1, 1,
-0.7846131, 0.4735656, -0.2058111, 1, 0, 0, 1, 1,
-0.7844698, 0.1860715, -2.28055, 1, 0, 0, 1, 1,
-0.7781032, -1.034587, -3.032204, 0, 0, 0, 1, 1,
-0.7681863, -0.2881988, -2.045226, 0, 0, 0, 1, 1,
-0.7660688, 2.010266, -0.09048338, 0, 0, 0, 1, 1,
-0.7648424, 0.07405411, -2.275827, 0, 0, 0, 1, 1,
-0.7646148, -0.3099969, -3.923801, 0, 0, 0, 1, 1,
-0.7635224, -2.032401, -3.122181, 0, 0, 0, 1, 1,
-0.7608329, -0.9040986, -1.431383, 0, 0, 0, 1, 1,
-0.7595577, 0.03473225, -2.909836, 1, 1, 1, 1, 1,
-0.7450041, -1.316472, -2.350392, 1, 1, 1, 1, 1,
-0.7449744, 0.08259416, -0.7236104, 1, 1, 1, 1, 1,
-0.7362496, -1.209443, -0.09717396, 1, 1, 1, 1, 1,
-0.7342876, -1.120956, -2.009373, 1, 1, 1, 1, 1,
-0.727619, 1.207235, 0.3268715, 1, 1, 1, 1, 1,
-0.7266952, -0.7297911, -2.130517, 1, 1, 1, 1, 1,
-0.7259884, 0.1155133, -1.228433, 1, 1, 1, 1, 1,
-0.725889, 0.1358277, -0.4100142, 1, 1, 1, 1, 1,
-0.7213168, 1.415948, -0.5677191, 1, 1, 1, 1, 1,
-0.7203791, 1.364262, -1.327106, 1, 1, 1, 1, 1,
-0.7177904, 0.03509639, -1.386084, 1, 1, 1, 1, 1,
-0.7143889, 0.5555057, -1.422231, 1, 1, 1, 1, 1,
-0.7125878, -0.6428249, -2.676286, 1, 1, 1, 1, 1,
-0.7088394, -0.1525075, -1.88646, 1, 1, 1, 1, 1,
-0.7087834, 0.8690726, 1.012941, 0, 0, 1, 1, 1,
-0.7022368, -0.9726721, -1.516456, 1, 0, 0, 1, 1,
-0.6976039, -1.797033, -3.032409, 1, 0, 0, 1, 1,
-0.694639, -0.7173726, -1.357748, 1, 0, 0, 1, 1,
-0.6945589, 0.9694926, -0.5823559, 1, 0, 0, 1, 1,
-0.6829578, 1.091944, -0.8285765, 1, 0, 0, 1, 1,
-0.6767958, -0.4154124, -1.498461, 0, 0, 0, 1, 1,
-0.6740736, -0.4804707, -2.128915, 0, 0, 0, 1, 1,
-0.6728194, 0.5569574, -0.7947147, 0, 0, 0, 1, 1,
-0.6689609, 0.5351053, -1.90251, 0, 0, 0, 1, 1,
-0.6680107, 0.2122328, -1.803442, 0, 0, 0, 1, 1,
-0.6603401, -0.5909245, -2.122975, 0, 0, 0, 1, 1,
-0.6565612, 0.26281, -0.9074069, 0, 0, 0, 1, 1,
-0.649484, 0.2156892, -2.051116, 1, 1, 1, 1, 1,
-0.6487288, 1.537056, -1.566222, 1, 1, 1, 1, 1,
-0.6470989, -0.9208972, -2.367425, 1, 1, 1, 1, 1,
-0.6408187, -0.07931214, 0.7882607, 1, 1, 1, 1, 1,
-0.6394981, -1.5224, -3.542995, 1, 1, 1, 1, 1,
-0.638133, 0.9461762, -0.9619548, 1, 1, 1, 1, 1,
-0.6321967, -0.2772081, -3.420985, 1, 1, 1, 1, 1,
-0.6316263, -2.503877, -0.6310769, 1, 1, 1, 1, 1,
-0.6287926, -4.086413, -2.320532, 1, 1, 1, 1, 1,
-0.6276808, -0.9704337, -0.9969187, 1, 1, 1, 1, 1,
-0.6249829, -0.3305908, -1.05772, 1, 1, 1, 1, 1,
-0.6215197, 0.9535855, -0.7294075, 1, 1, 1, 1, 1,
-0.6194398, 0.4169977, 0.04766284, 1, 1, 1, 1, 1,
-0.6130158, -1.056937, -2.511846, 1, 1, 1, 1, 1,
-0.6073583, 0.5401711, 0.5833287, 1, 1, 1, 1, 1,
-0.6072278, 1.725631, -1.764632, 0, 0, 1, 1, 1,
-0.603894, -1.097562, -4.085907, 1, 0, 0, 1, 1,
-0.6011585, -1.259782, -3.263593, 1, 0, 0, 1, 1,
-0.5902413, 0.05923386, -2.459645, 1, 0, 0, 1, 1,
-0.5889585, -0.7190673, -1.85919, 1, 0, 0, 1, 1,
-0.5882337, 1.063305, -0.192927, 1, 0, 0, 1, 1,
-0.587534, 0.1437747, -0.600693, 0, 0, 0, 1, 1,
-0.5856205, -0.2551421, -3.604336, 0, 0, 0, 1, 1,
-0.5843183, -1.122174, -2.327217, 0, 0, 0, 1, 1,
-0.5821844, -0.3010263, -2.56187, 0, 0, 0, 1, 1,
-0.581553, 1.493716, -1.378093, 0, 0, 0, 1, 1,
-0.5791875, 1.518632, 1.81102, 0, 0, 0, 1, 1,
-0.5776671, -0.3202831, -3.180452, 0, 0, 0, 1, 1,
-0.5771898, -0.3009631, -1.458414, 1, 1, 1, 1, 1,
-0.5771298, -1.070015, -4.482073, 1, 1, 1, 1, 1,
-0.5746279, 0.2880115, -0.4747091, 1, 1, 1, 1, 1,
-0.5745144, -2.138843, -3.541255, 1, 1, 1, 1, 1,
-0.5718924, -0.03214944, -0.7170952, 1, 1, 1, 1, 1,
-0.5716551, 0.08454387, -1.753099, 1, 1, 1, 1, 1,
-0.5716511, 0.8865685, -1.875483, 1, 1, 1, 1, 1,
-0.5710691, -1.061724, -2.265159, 1, 1, 1, 1, 1,
-0.5695553, -1.077419, -3.27985, 1, 1, 1, 1, 1,
-0.5691651, 1.429505, -0.3650608, 1, 1, 1, 1, 1,
-0.5683723, -2.518342, -2.466874, 1, 1, 1, 1, 1,
-0.5657621, -1.24137, -3.553154, 1, 1, 1, 1, 1,
-0.5649498, -0.3614787, -3.074198, 1, 1, 1, 1, 1,
-0.5644227, -0.4869184, -0.1288009, 1, 1, 1, 1, 1,
-0.55921, -0.1815408, -0.3442881, 1, 1, 1, 1, 1,
-0.5590128, -0.114064, -1.255614, 0, 0, 1, 1, 1,
-0.5552378, 0.8683743, -1.648619, 1, 0, 0, 1, 1,
-0.5536829, -0.4034154, -2.31666, 1, 0, 0, 1, 1,
-0.5453941, 1.438766, -1.461926, 1, 0, 0, 1, 1,
-0.5394648, 0.5059738, -1.00317, 1, 0, 0, 1, 1,
-0.5376039, -1.760575, -2.185436, 1, 0, 0, 1, 1,
-0.5293812, -1.865353, -2.794546, 0, 0, 0, 1, 1,
-0.5276591, 0.5138045, -1.018503, 0, 0, 0, 1, 1,
-0.5224299, 0.6505401, -1.046045, 0, 0, 0, 1, 1,
-0.5215564, 0.5579284, -0.5028908, 0, 0, 0, 1, 1,
-0.5164468, 0.9028054, -2.00108, 0, 0, 0, 1, 1,
-0.5099018, 1.268237, -0.03538909, 0, 0, 0, 1, 1,
-0.5087767, -0.01759963, -0.8649667, 0, 0, 0, 1, 1,
-0.5063578, -0.385009, -2.732577, 1, 1, 1, 1, 1,
-0.5017324, 1.498738, -0.07572912, 1, 1, 1, 1, 1,
-0.4972903, -0.06060242, -0.5582324, 1, 1, 1, 1, 1,
-0.4931782, -0.07570232, -1.947889, 1, 1, 1, 1, 1,
-0.4923217, 0.3265996, -0.4132533, 1, 1, 1, 1, 1,
-0.490851, -0.081549, -2.936682, 1, 1, 1, 1, 1,
-0.488771, 0.1051173, -1.737608, 1, 1, 1, 1, 1,
-0.4884965, -1.375525, -2.363642, 1, 1, 1, 1, 1,
-0.4878687, 0.8271614, -0.2264496, 1, 1, 1, 1, 1,
-0.4873285, 0.04764115, -1.674785, 1, 1, 1, 1, 1,
-0.4873125, -3.287252, -0.9364422, 1, 1, 1, 1, 1,
-0.4872462, -0.6926961, -1.69053, 1, 1, 1, 1, 1,
-0.4866863, 1.825527, -0.5190031, 1, 1, 1, 1, 1,
-0.4860965, 0.7723295, -0.4949966, 1, 1, 1, 1, 1,
-0.4854801, -1.73002, -2.828355, 1, 1, 1, 1, 1,
-0.4849615, 0.2837036, -1.154726, 0, 0, 1, 1, 1,
-0.4833925, -0.6991591, -2.276794, 1, 0, 0, 1, 1,
-0.4746148, -0.08296958, -2.249101, 1, 0, 0, 1, 1,
-0.4723843, 1.530885, -0.329349, 1, 0, 0, 1, 1,
-0.470512, 0.1523337, -0.5768876, 1, 0, 0, 1, 1,
-0.4699046, 0.413446, -1.029223, 1, 0, 0, 1, 1,
-0.4656114, -0.01387454, -2.844398, 0, 0, 0, 1, 1,
-0.4615473, 0.8585145, 0.7616512, 0, 0, 0, 1, 1,
-0.4555697, 1.215814, -1.146699, 0, 0, 0, 1, 1,
-0.45224, -0.7269083, -3.397967, 0, 0, 0, 1, 1,
-0.4467621, 0.2509411, -1.830959, 0, 0, 0, 1, 1,
-0.4465475, -0.9766969, -3.525855, 0, 0, 0, 1, 1,
-0.4464448, -0.5937943, -2.264025, 0, 0, 0, 1, 1,
-0.4453942, 1.647777, 0.181772, 1, 1, 1, 1, 1,
-0.444173, 0.9777076, 1.120126, 1, 1, 1, 1, 1,
-0.4440711, -1.587971, -2.230814, 1, 1, 1, 1, 1,
-0.4416494, -1.176701, -1.479763, 1, 1, 1, 1, 1,
-0.4335158, 1.029947, -0.3761946, 1, 1, 1, 1, 1,
-0.4264622, 0.386709, -0.4621636, 1, 1, 1, 1, 1,
-0.4262177, -0.5033755, -2.2142, 1, 1, 1, 1, 1,
-0.4255315, -1.253307, -1.155859, 1, 1, 1, 1, 1,
-0.42527, 1.174877, -1.256061, 1, 1, 1, 1, 1,
-0.4251691, -1.48756, -3.323439, 1, 1, 1, 1, 1,
-0.4251546, 1.652175, -0.2078717, 1, 1, 1, 1, 1,
-0.4245884, 0.5650015, 0.08644895, 1, 1, 1, 1, 1,
-0.4227196, 1.143038, -0.3053634, 1, 1, 1, 1, 1,
-0.4211858, 0.2335757, -0.3594754, 1, 1, 1, 1, 1,
-0.4204829, -1.017175, -3.973379, 1, 1, 1, 1, 1,
-0.4178485, 1.319463, -1.237098, 0, 0, 1, 1, 1,
-0.4135118, 0.6959193, 0.9072973, 1, 0, 0, 1, 1,
-0.4131532, 0.9986705, -0.3912169, 1, 0, 0, 1, 1,
-0.4122761, 1.236681, -1.647715, 1, 0, 0, 1, 1,
-0.4006924, 0.601307, 0.05237297, 1, 0, 0, 1, 1,
-0.3991021, -0.3678384, -0.6209286, 1, 0, 0, 1, 1,
-0.3980916, -0.4235353, -0.6803111, 0, 0, 0, 1, 1,
-0.3980565, 0.3830834, 0.6255633, 0, 0, 0, 1, 1,
-0.3968934, 0.719523, -0.4830512, 0, 0, 0, 1, 1,
-0.3962008, -0.3003276, -1.261913, 0, 0, 0, 1, 1,
-0.395738, 0.2916951, 0.2586122, 0, 0, 0, 1, 1,
-0.3950821, -0.907631, -2.042871, 0, 0, 0, 1, 1,
-0.3932938, 0.3324592, -2.73549, 0, 0, 0, 1, 1,
-0.3928303, -1.705464, -3.555936, 1, 1, 1, 1, 1,
-0.3924125, -0.7339121, -2.387867, 1, 1, 1, 1, 1,
-0.3905521, 0.8589772, 0.04918252, 1, 1, 1, 1, 1,
-0.3865263, -0.3218435, -1.676908, 1, 1, 1, 1, 1,
-0.3831312, 0.3089858, 0.03994292, 1, 1, 1, 1, 1,
-0.3830991, -0.4404755, -3.184527, 1, 1, 1, 1, 1,
-0.3807251, 0.2414881, -2.105554, 1, 1, 1, 1, 1,
-0.379937, -0.4445915, -1.564015, 1, 1, 1, 1, 1,
-0.379625, -0.5893028, -2.728218, 1, 1, 1, 1, 1,
-0.3763887, -0.06641184, -1.665619, 1, 1, 1, 1, 1,
-0.3758781, -0.3651563, -2.614319, 1, 1, 1, 1, 1,
-0.3732531, 1.63122, -1.548559, 1, 1, 1, 1, 1,
-0.3722949, -0.9393967, -2.721404, 1, 1, 1, 1, 1,
-0.3696453, -0.7465257, -4.751602, 1, 1, 1, 1, 1,
-0.3672563, -0.1646453, -1.511247, 1, 1, 1, 1, 1,
-0.3666358, -0.04757182, -2.369224, 0, 0, 1, 1, 1,
-0.3634958, 0.1598994, -4.005022, 1, 0, 0, 1, 1,
-0.3631255, 0.419384, -1.185516, 1, 0, 0, 1, 1,
-0.3559806, -0.2881592, -3.437126, 1, 0, 0, 1, 1,
-0.3516672, 0.2859957, -0.5262336, 1, 0, 0, 1, 1,
-0.3502925, 1.206286, -0.7700643, 1, 0, 0, 1, 1,
-0.3484401, -0.9284716, -2.125935, 0, 0, 0, 1, 1,
-0.3444028, 0.7059872, -0.7521366, 0, 0, 0, 1, 1,
-0.333799, -0.46416, -4.048319, 0, 0, 0, 1, 1,
-0.3297506, 0.1064014, 0.2501433, 0, 0, 0, 1, 1,
-0.3269167, 0.7848204, 0.2756407, 0, 0, 0, 1, 1,
-0.324153, -0.1469066, -0.1387867, 0, 0, 0, 1, 1,
-0.3225486, 0.1413829, -0.02575913, 0, 0, 0, 1, 1,
-0.3187487, -0.7870066, -2.299168, 1, 1, 1, 1, 1,
-0.3185458, -0.4281657, -3.562761, 1, 1, 1, 1, 1,
-0.3165923, 0.69359, -2.042427, 1, 1, 1, 1, 1,
-0.3157191, 0.7624359, 0.06348989, 1, 1, 1, 1, 1,
-0.3125488, -0.5648326, -1.981262, 1, 1, 1, 1, 1,
-0.3110534, 1.098035, -1.521144, 1, 1, 1, 1, 1,
-0.3106129, -0.3796577, -1.618891, 1, 1, 1, 1, 1,
-0.3074721, 0.4345678, -0.5702412, 1, 1, 1, 1, 1,
-0.3019432, -0.8581762, -2.3482, 1, 1, 1, 1, 1,
-0.3009961, 0.05295664, -2.314452, 1, 1, 1, 1, 1,
-0.2993571, 3.41953, -1.309729, 1, 1, 1, 1, 1,
-0.2967002, -0.4745537, -2.369081, 1, 1, 1, 1, 1,
-0.2930087, 0.248392, -0.5441309, 1, 1, 1, 1, 1,
-0.2925841, 1.535336, 0.4353957, 1, 1, 1, 1, 1,
-0.2884388, -1.629018, -3.638719, 1, 1, 1, 1, 1,
-0.2872911, 0.1748589, -1.761605, 0, 0, 1, 1, 1,
-0.284685, 0.2589807, -1.531281, 1, 0, 0, 1, 1,
-0.283653, 0.8328477, 1.993836, 1, 0, 0, 1, 1,
-0.2833929, -0.3038571, -1.957063, 1, 0, 0, 1, 1,
-0.282338, -0.5240242, -3.110993, 1, 0, 0, 1, 1,
-0.2808898, -0.9813473, -1.208583, 1, 0, 0, 1, 1,
-0.2802676, 2.740658, 1.673863, 0, 0, 0, 1, 1,
-0.2786089, -0.0309461, -3.920705, 0, 0, 0, 1, 1,
-0.2780604, -0.4003355, -3.310575, 0, 0, 0, 1, 1,
-0.2775961, -0.06050847, -2.736585, 0, 0, 0, 1, 1,
-0.2692162, -0.09770566, -3.845155, 0, 0, 0, 1, 1,
-0.2691008, 1.132876, 0.7737392, 0, 0, 0, 1, 1,
-0.2662941, -0.5946196, -4.054415, 0, 0, 0, 1, 1,
-0.2538061, -0.03779006, -0.4732902, 1, 1, 1, 1, 1,
-0.2521826, -1.296565, -3.052904, 1, 1, 1, 1, 1,
-0.2520631, 1.017318, -1.28916, 1, 1, 1, 1, 1,
-0.2499186, 0.4153967, 0.2007238, 1, 1, 1, 1, 1,
-0.248316, -0.2020878, -1.446393, 1, 1, 1, 1, 1,
-0.2481232, -0.6689879, -1.957536, 1, 1, 1, 1, 1,
-0.2471212, 0.3285381, -0.5327342, 1, 1, 1, 1, 1,
-0.2463324, -0.7237002, -2.005385, 1, 1, 1, 1, 1,
-0.2442322, -1.43995, -2.465326, 1, 1, 1, 1, 1,
-0.2367288, -0.03690613, -2.263266, 1, 1, 1, 1, 1,
-0.2345389, 0.1077885, 0.5294419, 1, 1, 1, 1, 1,
-0.2314694, 0.8819149, 0.3566853, 1, 1, 1, 1, 1,
-0.2302164, -0.7247345, -1.743793, 1, 1, 1, 1, 1,
-0.2277176, -0.04359904, -2.464153, 1, 1, 1, 1, 1,
-0.2247799, -0.3826374, -1.628389, 1, 1, 1, 1, 1,
-0.2235785, -0.7330198, -2.698193, 0, 0, 1, 1, 1,
-0.218652, 1.026867, 0.8071945, 1, 0, 0, 1, 1,
-0.2157048, 0.5179832, 0.2170833, 1, 0, 0, 1, 1,
-0.2134898, 0.09385175, -2.261957, 1, 0, 0, 1, 1,
-0.2132123, -0.4425852, -4.606494, 1, 0, 0, 1, 1,
-0.2091573, 0.973205, -0.6735548, 1, 0, 0, 1, 1,
-0.2079434, -0.6999608, -4.427953, 0, 0, 0, 1, 1,
-0.2038426, 0.4380569, -0.3818513, 0, 0, 0, 1, 1,
-0.2000091, 0.8232094, 0.3179691, 0, 0, 0, 1, 1,
-0.199641, 0.09049366, -2.613615, 0, 0, 0, 1, 1,
-0.1947234, 0.788718, -0.8601107, 0, 0, 0, 1, 1,
-0.1937289, -1.915708, -1.496538, 0, 0, 0, 1, 1,
-0.1926822, 1.72693, 1.067124, 0, 0, 0, 1, 1,
-0.191674, -0.2637272, -1.252915, 1, 1, 1, 1, 1,
-0.1885911, 0.05858061, -1.594027, 1, 1, 1, 1, 1,
-0.1878916, 1.002076, 0.7775163, 1, 1, 1, 1, 1,
-0.1864588, 0.159701, -0.6276657, 1, 1, 1, 1, 1,
-0.1863385, 1.220581, 0.1070752, 1, 1, 1, 1, 1,
-0.1849475, -0.9328802, -4.05001, 1, 1, 1, 1, 1,
-0.1839657, 1.482154, 0.8299469, 1, 1, 1, 1, 1,
-0.1791608, 0.006748717, -0.4341559, 1, 1, 1, 1, 1,
-0.1722288, 1.202267, -1.590982, 1, 1, 1, 1, 1,
-0.1712465, 0.6038789, -0.3925277, 1, 1, 1, 1, 1,
-0.1676277, 1.847342, -0.4564232, 1, 1, 1, 1, 1,
-0.1666287, 0.4605496, -1.139909, 1, 1, 1, 1, 1,
-0.1643071, -0.1664057, 0.100375, 1, 1, 1, 1, 1,
-0.1627407, -2.439684, -2.028091, 1, 1, 1, 1, 1,
-0.160718, -0.3613261, -0.85504, 1, 1, 1, 1, 1,
-0.1603314, -0.1580048, -4.0948, 0, 0, 1, 1, 1,
-0.1602746, -0.2117964, -4.094683, 1, 0, 0, 1, 1,
-0.1558261, -1.310498, -3.322407, 1, 0, 0, 1, 1,
-0.1542479, 0.440863, 1.642118, 1, 0, 0, 1, 1,
-0.1436668, 0.8994101, -1.36341, 1, 0, 0, 1, 1,
-0.1425365, 2.894148, -0.1395884, 1, 0, 0, 1, 1,
-0.1415825, 0.9811823, 0.6315678, 0, 0, 0, 1, 1,
-0.1410663, -0.6392787, -2.356102, 0, 0, 0, 1, 1,
-0.1406402, 0.2008428, -0.8584358, 0, 0, 0, 1, 1,
-0.1405814, 2.098204, 0.4843002, 0, 0, 0, 1, 1,
-0.1404991, -0.3110667, -1.537862, 0, 0, 0, 1, 1,
-0.1385627, 1.435722, -0.9551197, 0, 0, 0, 1, 1,
-0.1347652, -0.4199141, -2.187826, 0, 0, 0, 1, 1,
-0.1344149, 0.212741, -2.155024, 1, 1, 1, 1, 1,
-0.133039, 0.7746219, -1.295833, 1, 1, 1, 1, 1,
-0.1317172, 0.4588063, 0.1019123, 1, 1, 1, 1, 1,
-0.128525, 0.09171224, -1.022232, 1, 1, 1, 1, 1,
-0.1251185, 1.454124, -0.6112196, 1, 1, 1, 1, 1,
-0.1250653, 0.09868666, -1.11669, 1, 1, 1, 1, 1,
-0.1227851, -0.2023897, -2.930647, 1, 1, 1, 1, 1,
-0.1199997, 0.06718326, -1.793326, 1, 1, 1, 1, 1,
-0.1151057, 1.205569, 1.722314, 1, 1, 1, 1, 1,
-0.1139359, -1.141901, -4.145122, 1, 1, 1, 1, 1,
-0.105944, -0.08246093, -3.087671, 1, 1, 1, 1, 1,
-0.1038935, 0.1514373, -0.9777377, 1, 1, 1, 1, 1,
-0.1023487, 0.4992084, -0.1963159, 1, 1, 1, 1, 1,
-0.1000193, -0.366735, -3.714034, 1, 1, 1, 1, 1,
-0.09737735, -0.0375169, -1.071265, 1, 1, 1, 1, 1,
-0.09413002, 1.248373, 0.6823915, 0, 0, 1, 1, 1,
-0.09345978, -0.3678765, -2.268056, 1, 0, 0, 1, 1,
-0.08780481, -0.5087342, -1.952966, 1, 0, 0, 1, 1,
-0.08762009, -0.8200097, -2.02169, 1, 0, 0, 1, 1,
-0.08230628, -0.3439314, -3.739271, 1, 0, 0, 1, 1,
-0.08074427, -1.253999, -2.473601, 1, 0, 0, 1, 1,
-0.08028027, -0.8185735, -3.797714, 0, 0, 0, 1, 1,
-0.07729695, -1.060195, -4.612266, 0, 0, 0, 1, 1,
-0.0765736, -1.387357, -3.641701, 0, 0, 0, 1, 1,
-0.06169333, 1.847547, -0.2834054, 0, 0, 0, 1, 1,
-0.06135649, 1.606997, -1.429554, 0, 0, 0, 1, 1,
-0.06072975, -0.2199411, -4.467598, 0, 0, 0, 1, 1,
-0.06006353, 0.9812953, 0.2196669, 0, 0, 0, 1, 1,
-0.05450362, 0.2382396, 0.6447373, 1, 1, 1, 1, 1,
-0.05408284, -0.4665281, -3.908791, 1, 1, 1, 1, 1,
-0.05205834, 0.06811637, -0.4563454, 1, 1, 1, 1, 1,
-0.04980898, 0.6160421, -0.6176319, 1, 1, 1, 1, 1,
-0.04866231, -0.4237135, -4.188256, 1, 1, 1, 1, 1,
-0.03237643, -0.02713773, -1.624984, 1, 1, 1, 1, 1,
-0.03107732, -0.4214107, -2.757562, 1, 1, 1, 1, 1,
-0.02816982, 0.04805873, -2.047737, 1, 1, 1, 1, 1,
-0.02768522, -1.794942, -4.060472, 1, 1, 1, 1, 1,
-0.02585182, 1.01889, -0.2814863, 1, 1, 1, 1, 1,
-0.02013994, 0.1013185, 0.3031455, 1, 1, 1, 1, 1,
-0.01681538, 0.3874449, 0.8798143, 1, 1, 1, 1, 1,
-0.01547952, 0.4155449, -0.1837162, 1, 1, 1, 1, 1,
-0.01522873, 0.03737149, -0.1602465, 1, 1, 1, 1, 1,
-0.01477607, -1.183551, -3.939556, 1, 1, 1, 1, 1,
-0.01377727, 0.0818492, -0.5916341, 0, 0, 1, 1, 1,
-0.01332468, -0.03031432, -2.568812, 1, 0, 0, 1, 1,
-0.01071587, -0.1337318, -1.754443, 1, 0, 0, 1, 1,
-0.009187002, 0.3349212, 0.7442664, 1, 0, 0, 1, 1,
-0.008831713, 0.5998626, 0.3006696, 1, 0, 0, 1, 1,
0.001381196, 1.021005, 0.7148476, 1, 0, 0, 1, 1,
0.01559096, 0.07019127, -0.7445411, 0, 0, 0, 1, 1,
0.01824028, -0.08950746, 4.296297, 0, 0, 0, 1, 1,
0.03195611, 0.1315998, 1.065275, 0, 0, 0, 1, 1,
0.03659531, 1.700959, -1.475889, 0, 0, 0, 1, 1,
0.03979478, -1.606036, 2.41521, 0, 0, 0, 1, 1,
0.04715313, -1.205176, 2.945272, 0, 0, 0, 1, 1,
0.05181951, -0.5144038, 3.092551, 0, 0, 0, 1, 1,
0.05325117, -0.08214524, 2.815637, 1, 1, 1, 1, 1,
0.05421444, -0.00343196, 0.3425924, 1, 1, 1, 1, 1,
0.05653061, -2.080626, 2.733676, 1, 1, 1, 1, 1,
0.05726983, -0.4396893, 3.939005, 1, 1, 1, 1, 1,
0.05806385, 0.001404958, 1.210585, 1, 1, 1, 1, 1,
0.0647063, 1.448419, -0.1717342, 1, 1, 1, 1, 1,
0.07013887, 0.5719121, -2.575813, 1, 1, 1, 1, 1,
0.071629, 0.5341668, 1.83478, 1, 1, 1, 1, 1,
0.07237879, -1.491568, 4.251565, 1, 1, 1, 1, 1,
0.07415442, 1.133265, -0.1827307, 1, 1, 1, 1, 1,
0.07576519, 0.4180073, 1.009639, 1, 1, 1, 1, 1,
0.08008109, -0.6259698, 3.638842, 1, 1, 1, 1, 1,
0.08062753, 0.2338751, 0.3580874, 1, 1, 1, 1, 1,
0.08287267, -0.07362635, 1.138124, 1, 1, 1, 1, 1,
0.08433936, 1.601881, -0.8042347, 1, 1, 1, 1, 1,
0.0867263, 0.9665821, 0.2248735, 0, 0, 1, 1, 1,
0.08842529, -0.2593019, 1.095998, 1, 0, 0, 1, 1,
0.08919932, -1.045967, 2.153723, 1, 0, 0, 1, 1,
0.09195731, 0.8121125, 0.2258989, 1, 0, 0, 1, 1,
0.09483908, 0.8130291, -0.1672762, 1, 0, 0, 1, 1,
0.09654766, 1.112966, 0.08242959, 1, 0, 0, 1, 1,
0.09699802, 0.2839539, 2.251962, 0, 0, 0, 1, 1,
0.1023703, -0.1953411, 3.196152, 0, 0, 0, 1, 1,
0.1028972, 2.023259, 0.9799439, 0, 0, 0, 1, 1,
0.110647, -2.217277, 2.799683, 0, 0, 0, 1, 1,
0.1152467, 0.587106, 0.8856341, 0, 0, 0, 1, 1,
0.115559, 1.121417, -0.768249, 0, 0, 0, 1, 1,
0.1226093, 1.062259, 0.3012494, 0, 0, 0, 1, 1,
0.1244616, -0.5663542, 1.485648, 1, 1, 1, 1, 1,
0.1245976, -0.5506601, 2.84752, 1, 1, 1, 1, 1,
0.1264938, 0.7305578, 0.668048, 1, 1, 1, 1, 1,
0.126526, 0.4164004, 1.048751, 1, 1, 1, 1, 1,
0.1330156, 0.3609355, -0.5204957, 1, 1, 1, 1, 1,
0.1356007, 1.997697, 0.7724664, 1, 1, 1, 1, 1,
0.1364043, -0.627604, 2.463709, 1, 1, 1, 1, 1,
0.1376924, -0.3732944, 2.580288, 1, 1, 1, 1, 1,
0.1441432, 1.774674, -0.08730089, 1, 1, 1, 1, 1,
0.1451817, 1.324148, 0.503313, 1, 1, 1, 1, 1,
0.1459, 1.812932, -1.1538, 1, 1, 1, 1, 1,
0.1463644, 1.786107, -2.012699, 1, 1, 1, 1, 1,
0.147119, -0.2226995, 4.268673, 1, 1, 1, 1, 1,
0.1522847, 0.3754465, 0.5644574, 1, 1, 1, 1, 1,
0.1610617, -0.9687586, 2.967366, 1, 1, 1, 1, 1,
0.1638362, 1.999782, -0.7321582, 0, 0, 1, 1, 1,
0.1642712, -1.154704, 4.080979, 1, 0, 0, 1, 1,
0.1650757, 0.400044, -0.2906417, 1, 0, 0, 1, 1,
0.1651809, 0.3910998, -0.939366, 1, 0, 0, 1, 1,
0.1707981, 0.8587986, 1.447007, 1, 0, 0, 1, 1,
0.1708939, -1.037386, 4.365, 1, 0, 0, 1, 1,
0.1709828, 0.5463153, -1.454164, 0, 0, 0, 1, 1,
0.1714974, 1.574373, -0.1135148, 0, 0, 0, 1, 1,
0.1744546, 0.9280074, 1.743197, 0, 0, 0, 1, 1,
0.1761659, -0.4318786, 3.15555, 0, 0, 0, 1, 1,
0.1778521, -0.4450682, 2.756602, 0, 0, 0, 1, 1,
0.178764, -0.9563882, 3.871243, 0, 0, 0, 1, 1,
0.1791079, -0.04596833, 0.844069, 0, 0, 0, 1, 1,
0.1800146, -0.0106243, 1.740809, 1, 1, 1, 1, 1,
0.1908128, 1.253881, -1.652451, 1, 1, 1, 1, 1,
0.1914123, 1.148331, 1.382838, 1, 1, 1, 1, 1,
0.1979402, -0.8315688, 3.769413, 1, 1, 1, 1, 1,
0.2011082, -0.0372499, 1.796979, 1, 1, 1, 1, 1,
0.2018978, 1.786502, 2.194038, 1, 1, 1, 1, 1,
0.2077868, 0.5603548, 1.397298, 1, 1, 1, 1, 1,
0.2079577, -2.196093, 1.581334, 1, 1, 1, 1, 1,
0.2150238, 0.1913787, 1.250467, 1, 1, 1, 1, 1,
0.2166613, -0.3549409, 2.190666, 1, 1, 1, 1, 1,
0.2172847, -0.9435853, 2.916312, 1, 1, 1, 1, 1,
0.222476, -1.250233, 3.692003, 1, 1, 1, 1, 1,
0.2229574, -0.1770293, 3.080009, 1, 1, 1, 1, 1,
0.2279948, -0.08906543, 1.799119, 1, 1, 1, 1, 1,
0.2296104, 1.470796, -0.8672287, 1, 1, 1, 1, 1,
0.2342398, -0.2309674, 1.129277, 0, 0, 1, 1, 1,
0.234291, -0.8911214, 2.326034, 1, 0, 0, 1, 1,
0.2376727, -1.09831, 2.26247, 1, 0, 0, 1, 1,
0.2421542, -1.611188, 4.53091, 1, 0, 0, 1, 1,
0.2426843, -0.9826689, 2.410711, 1, 0, 0, 1, 1,
0.2447941, -1.73519, 2.089687, 1, 0, 0, 1, 1,
0.2471168, 0.4544293, 2.382974, 0, 0, 0, 1, 1,
0.2479834, 2.388669, 2.118886, 0, 0, 0, 1, 1,
0.2497651, 0.4891191, -0.6548415, 0, 0, 0, 1, 1,
0.2523762, -0.576534, 2.220963, 0, 0, 0, 1, 1,
0.2558592, 1.616174, -1.359784, 0, 0, 0, 1, 1,
0.259642, -1.032233, 4.061207, 0, 0, 0, 1, 1,
0.2604678, 0.1595667, 1.531185, 0, 0, 0, 1, 1,
0.2675738, 1.122733, 0.06724574, 1, 1, 1, 1, 1,
0.2692478, -0.4508526, 2.879417, 1, 1, 1, 1, 1,
0.2701921, -0.3064558, 2.495362, 1, 1, 1, 1, 1,
0.2794483, -0.6579788, 4.9883, 1, 1, 1, 1, 1,
0.2839154, 0.06584787, 1.398974, 1, 1, 1, 1, 1,
0.2862298, 0.8053984, 0.9290236, 1, 1, 1, 1, 1,
0.2902206, 0.2859434, 1.305514, 1, 1, 1, 1, 1,
0.2926099, -1.320001, 1.333845, 1, 1, 1, 1, 1,
0.2972747, 0.3567183, 0.3014933, 1, 1, 1, 1, 1,
0.3043854, -1.380025, 3.271071, 1, 1, 1, 1, 1,
0.3047604, -2.053402, 2.943052, 1, 1, 1, 1, 1,
0.3103369, -0.6840969, 2.396878, 1, 1, 1, 1, 1,
0.3138486, -0.2098709, 2.460289, 1, 1, 1, 1, 1,
0.3141126, -0.5417844, 4.540284, 1, 1, 1, 1, 1,
0.3181134, 1.255242, 1.046227, 1, 1, 1, 1, 1,
0.3189086, 0.9492496, 0.7037874, 0, 0, 1, 1, 1,
0.3231044, 0.8723738, 0.1989778, 1, 0, 0, 1, 1,
0.3325079, -0.4566516, 0.9356979, 1, 0, 0, 1, 1,
0.3374518, 0.5217134, 0.9802068, 1, 0, 0, 1, 1,
0.3475554, 0.392955, 0.4365375, 1, 0, 0, 1, 1,
0.353112, 0.7327474, 1.733701, 1, 0, 0, 1, 1,
0.3562379, 1.960882, -0.2251491, 0, 0, 0, 1, 1,
0.359931, -1.67603, 3.29934, 0, 0, 0, 1, 1,
0.3635955, -1.106742, 2.85607, 0, 0, 0, 1, 1,
0.3659423, -1.67553, 2.914075, 0, 0, 0, 1, 1,
0.3671006, 0.1934852, 1.495279, 0, 0, 0, 1, 1,
0.3691356, -0.5037991, 4.058202, 0, 0, 0, 1, 1,
0.3699767, 0.02945145, 2.90202, 0, 0, 0, 1, 1,
0.3706266, -1.130596, 2.391966, 1, 1, 1, 1, 1,
0.3756663, -1.721487, 2.259312, 1, 1, 1, 1, 1,
0.3783686, -0.6108095, 2.091329, 1, 1, 1, 1, 1,
0.3790183, -0.8976073, 2.98509, 1, 1, 1, 1, 1,
0.3796304, -1.446307, 3.548404, 1, 1, 1, 1, 1,
0.3815513, -0.7373854, 0.9202542, 1, 1, 1, 1, 1,
0.3841943, 0.8924181, 0.3298832, 1, 1, 1, 1, 1,
0.3868691, -0.9069107, 3.899364, 1, 1, 1, 1, 1,
0.3874794, 0.618439, -0.3074083, 1, 1, 1, 1, 1,
0.395254, -1.144611, 1.695054, 1, 1, 1, 1, 1,
0.4018415, -0.6389418, 1.051244, 1, 1, 1, 1, 1,
0.4028011, -0.8542194, 1.458795, 1, 1, 1, 1, 1,
0.4054319, -0.883902, 3.81308, 1, 1, 1, 1, 1,
0.4057042, -0.5690172, 2.799055, 1, 1, 1, 1, 1,
0.4058182, -1.593093, 1.366742, 1, 1, 1, 1, 1,
0.4063708, -0.08998223, 0.8654122, 0, 0, 1, 1, 1,
0.4079665, -0.4332103, 3.692513, 1, 0, 0, 1, 1,
0.414034, 0.02152716, 0.22352, 1, 0, 0, 1, 1,
0.4159726, 0.607412, 1.007722, 1, 0, 0, 1, 1,
0.4177465, 0.4385908, 2.097305, 1, 0, 0, 1, 1,
0.419716, -0.8692439, 2.264155, 1, 0, 0, 1, 1,
0.4198613, 1.669656, 1.004874, 0, 0, 0, 1, 1,
0.4228202, 1.086646, 1.426596, 0, 0, 0, 1, 1,
0.4285801, -0.6145092, 5.268832, 0, 0, 0, 1, 1,
0.4286717, 0.7468658, 0.5049485, 0, 0, 0, 1, 1,
0.4351078, -1.518935, 2.626388, 0, 0, 0, 1, 1,
0.4359447, -1.206251, 1.845313, 0, 0, 0, 1, 1,
0.4403058, 0.6891827, -0.5734924, 0, 0, 0, 1, 1,
0.4409438, -1.753555, 3.906332, 1, 1, 1, 1, 1,
0.4421795, 0.4712703, 2.930132, 1, 1, 1, 1, 1,
0.4443657, -1.347243, 3.031437, 1, 1, 1, 1, 1,
0.4458427, -0.09903566, 0.1219853, 1, 1, 1, 1, 1,
0.4474242, 2.167605, -1.400664, 1, 1, 1, 1, 1,
0.4484506, -1.047108, 4.030158, 1, 1, 1, 1, 1,
0.4493612, -1.450529, 2.568705, 1, 1, 1, 1, 1,
0.4505393, 0.1236586, 0.2949556, 1, 1, 1, 1, 1,
0.4552992, -0.4453385, 2.149972, 1, 1, 1, 1, 1,
0.4618248, -1.244174, 1.443887, 1, 1, 1, 1, 1,
0.465665, -0.3226275, 0.9538522, 1, 1, 1, 1, 1,
0.4661086, 0.7189428, 1.138947, 1, 1, 1, 1, 1,
0.4811216, -0.3714727, 1.643463, 1, 1, 1, 1, 1,
0.4817847, 0.09309313, 0.6330214, 1, 1, 1, 1, 1,
0.4827733, 0.8295563, 1.761264, 1, 1, 1, 1, 1,
0.4907988, -0.1974951, 0.09658287, 0, 0, 1, 1, 1,
0.4964008, 0.02013197, 0.9766783, 1, 0, 0, 1, 1,
0.499619, -0.2549481, 1.620618, 1, 0, 0, 1, 1,
0.5021225, 1.780107, -0.8088001, 1, 0, 0, 1, 1,
0.508918, -0.7120863, 2.212863, 1, 0, 0, 1, 1,
0.5203561, 0.07279021, 0.595256, 1, 0, 0, 1, 1,
0.5218984, -1.55011, 3.462501, 0, 0, 0, 1, 1,
0.5246841, 1.410432, -0.6865641, 0, 0, 0, 1, 1,
0.5389758, 0.1960365, -0.4332173, 0, 0, 0, 1, 1,
0.5398342, -1.518342, 1.208309, 0, 0, 0, 1, 1,
0.5409461, 2.358713, 0.39748, 0, 0, 0, 1, 1,
0.5423225, 0.45233, 0.7273489, 0, 0, 0, 1, 1,
0.5503803, 0.4167458, 0.8337669, 0, 0, 0, 1, 1,
0.5551734, -0.8902483, 4.946898, 1, 1, 1, 1, 1,
0.5565545, 0.01812493, 1.873332, 1, 1, 1, 1, 1,
0.5569504, 1.121659, -0.3609643, 1, 1, 1, 1, 1,
0.5593591, 0.7783318, -1.063505, 1, 1, 1, 1, 1,
0.566165, -0.5777617, 2.622209, 1, 1, 1, 1, 1,
0.5690651, 0.7801495, 0.1176993, 1, 1, 1, 1, 1,
0.5742078, -0.2150494, 2.303931, 1, 1, 1, 1, 1,
0.5742935, -0.5711698, 2.221321, 1, 1, 1, 1, 1,
0.5751477, -0.1409863, 2.508836, 1, 1, 1, 1, 1,
0.5774156, 1.443421, 0.5958193, 1, 1, 1, 1, 1,
0.5809559, -0.5619456, 1.390529, 1, 1, 1, 1, 1,
0.5815991, 0.5601458, 1.776096, 1, 1, 1, 1, 1,
0.5862389, -0.04507666, 2.205998, 1, 1, 1, 1, 1,
0.5890696, -1.18133, 4.402724, 1, 1, 1, 1, 1,
0.5934037, 0.48841, 1.819304, 1, 1, 1, 1, 1,
0.594682, -0.6223718, 2.599409, 0, 0, 1, 1, 1,
0.5995498, 1.397269, 1.143753, 1, 0, 0, 1, 1,
0.6006813, -1.837798, 3.258518, 1, 0, 0, 1, 1,
0.6007686, -0.1690657, 0.792354, 1, 0, 0, 1, 1,
0.602407, 1.05274, -1.974754, 1, 0, 0, 1, 1,
0.6036999, -0.6446834, 1.576957, 1, 0, 0, 1, 1,
0.6059917, 0.08442151, 0.9191488, 0, 0, 0, 1, 1,
0.6082917, 1.206314, -0.5320839, 0, 0, 0, 1, 1,
0.6087367, 0.9693889, -0.6819957, 0, 0, 0, 1, 1,
0.6270858, -0.3427899, 2.590147, 0, 0, 0, 1, 1,
0.6279413, -2.277573, 3.501131, 0, 0, 0, 1, 1,
0.6292991, 0.2835375, 2.32457, 0, 0, 0, 1, 1,
0.6316114, -0.9086498, 1.527816, 0, 0, 0, 1, 1,
0.6330243, -0.2392437, 0.6622123, 1, 1, 1, 1, 1,
0.6337454, -0.1371425, 0.3275066, 1, 1, 1, 1, 1,
0.6348974, 1.504274, 0.7933803, 1, 1, 1, 1, 1,
0.6420788, -0.4584453, 2.860444, 1, 1, 1, 1, 1,
0.6435539, -0.4537975, -0.5384826, 1, 1, 1, 1, 1,
0.6492606, 1.802344, 0.5198588, 1, 1, 1, 1, 1,
0.6630757, -0.7351876, 1.840504, 1, 1, 1, 1, 1,
0.6663136, -0.2645919, 0.2347182, 1, 1, 1, 1, 1,
0.6700936, 1.240801, -0.5494618, 1, 1, 1, 1, 1,
0.6724972, -0.2885744, 4.492589, 1, 1, 1, 1, 1,
0.6741571, -0.4443916, 1.602914, 1, 1, 1, 1, 1,
0.6763574, 0.3559297, 2.373534, 1, 1, 1, 1, 1,
0.676947, 0.1531731, -0.3852011, 1, 1, 1, 1, 1,
0.6801986, 1.379735, 1.702417, 1, 1, 1, 1, 1,
0.6848299, 0.04468063, 0.7693835, 1, 1, 1, 1, 1,
0.6853343, 0.1259601, 3.22106, 0, 0, 1, 1, 1,
0.6857415, 0.8587564, 1.488644, 1, 0, 0, 1, 1,
0.6896657, 0.07344037, 1.740112, 1, 0, 0, 1, 1,
0.689914, 0.7600113, 1.46153, 1, 0, 0, 1, 1,
0.6941959, 3.093888, -1.020257, 1, 0, 0, 1, 1,
0.7032903, 0.1534099, 0.2994501, 1, 0, 0, 1, 1,
0.707548, -1.516795, 4.658809, 0, 0, 0, 1, 1,
0.7106686, 0.8548566, 0.6362308, 0, 0, 0, 1, 1,
0.7181396, -0.7596423, 1.418412, 0, 0, 0, 1, 1,
0.7201577, -0.2724337, 1.523874, 0, 0, 0, 1, 1,
0.7213078, -0.6354687, 3.10363, 0, 0, 0, 1, 1,
0.7236592, 0.8351592, 1.304161, 0, 0, 0, 1, 1,
0.7337607, -0.2132993, 0.09612965, 0, 0, 0, 1, 1,
0.7345482, 1.102113, 1.704451, 1, 1, 1, 1, 1,
0.7371773, -0.2382866, 3.919194, 1, 1, 1, 1, 1,
0.7439639, 0.9153071, 1.442831, 1, 1, 1, 1, 1,
0.7445523, -0.2283456, 2.60243, 1, 1, 1, 1, 1,
0.7466487, -1.186278, 1.765616, 1, 1, 1, 1, 1,
0.7493107, 2.903914, 1.165316, 1, 1, 1, 1, 1,
0.7501583, 1.295635, -0.7410805, 1, 1, 1, 1, 1,
0.7517169, -0.06324186, 1.169577, 1, 1, 1, 1, 1,
0.7523344, -1.005351, 2.262886, 1, 1, 1, 1, 1,
0.7568458, -0.5420848, 3.232744, 1, 1, 1, 1, 1,
0.7633218, -0.1215711, 1.466581, 1, 1, 1, 1, 1,
0.7707294, -0.05367306, 1.425658, 1, 1, 1, 1, 1,
0.7724048, 0.666344, -0.427076, 1, 1, 1, 1, 1,
0.7765689, 1.76704, 2.376208, 1, 1, 1, 1, 1,
0.7814589, 0.7017068, 0.8233121, 1, 1, 1, 1, 1,
0.7824504, -0.3732972, 2.295501, 0, 0, 1, 1, 1,
0.7848666, 0.06572393, 1.391378, 1, 0, 0, 1, 1,
0.7849597, 0.2422859, 0.8734199, 1, 0, 0, 1, 1,
0.7878884, -2.516038, 1.533805, 1, 0, 0, 1, 1,
0.788027, 1.520542, 0.9602041, 1, 0, 0, 1, 1,
0.7996758, 0.5112414, 0.2389524, 1, 0, 0, 1, 1,
0.7999167, 1.265113, -0.08613757, 0, 0, 0, 1, 1,
0.8001842, -0.03412099, 1.53594, 0, 0, 0, 1, 1,
0.8030366, 1.332968, -0.5799906, 0, 0, 0, 1, 1,
0.8067405, -1.59654, 2.108101, 0, 0, 0, 1, 1,
0.8109538, -0.2958746, 2.855055, 0, 0, 0, 1, 1,
0.817045, -0.371368, 2.170465, 0, 0, 0, 1, 1,
0.818526, -1.006286, 3.052372, 0, 0, 0, 1, 1,
0.8186257, 1.433348, 0.3470155, 1, 1, 1, 1, 1,
0.819546, 0.4315777, 1.251291, 1, 1, 1, 1, 1,
0.8198464, 0.8388174, 1.481805, 1, 1, 1, 1, 1,
0.8217646, -0.3569261, 1.668434, 1, 1, 1, 1, 1,
0.8269289, -1.610377, 1.317997, 1, 1, 1, 1, 1,
0.8281532, -0.9550212, 1.673875, 1, 1, 1, 1, 1,
0.8412433, 0.5267109, 1.58795, 1, 1, 1, 1, 1,
0.8415603, -0.8159419, 1.50361, 1, 1, 1, 1, 1,
0.842857, 0.4862331, 2.016298, 1, 1, 1, 1, 1,
0.8495001, -2.854242, 3.104542, 1, 1, 1, 1, 1,
0.8556476, -1.437927, 1.346776, 1, 1, 1, 1, 1,
0.8565511, 0.3762023, 0.7666305, 1, 1, 1, 1, 1,
0.8601398, 0.4564201, 2.157066, 1, 1, 1, 1, 1,
0.8671693, -1.052325, 1.982934, 1, 1, 1, 1, 1,
0.8784034, -0.03278848, 2.521674, 1, 1, 1, 1, 1,
0.8802006, -0.8848252, 5.154822, 0, 0, 1, 1, 1,
0.8813393, 0.7488005, -0.1943249, 1, 0, 0, 1, 1,
0.8848338, -1.422381, 4.283175, 1, 0, 0, 1, 1,
0.8852054, 0.5101814, 1.689537, 1, 0, 0, 1, 1,
0.8915424, 0.00458101, 0.8729635, 1, 0, 0, 1, 1,
0.9000812, 0.7916931, 0.4992219, 1, 0, 0, 1, 1,
0.9009935, -0.590389, 2.643476, 0, 0, 0, 1, 1,
0.9029579, -1.213871, 2.02367, 0, 0, 0, 1, 1,
0.9041965, 0.2413027, 0.7033939, 0, 0, 0, 1, 1,
0.9063456, 1.511187, -0.03797492, 0, 0, 0, 1, 1,
0.9100591, -0.8753572, 3.16708, 0, 0, 0, 1, 1,
0.911958, 0.1645152, 0.9406518, 0, 0, 0, 1, 1,
0.918061, -1.023402, 0.9042721, 0, 0, 0, 1, 1,
0.921409, 0.5530435, -0.006655116, 1, 1, 1, 1, 1,
0.925203, -0.2505675, 0.2335449, 1, 1, 1, 1, 1,
0.9311906, 0.1496072, 0.3159504, 1, 1, 1, 1, 1,
0.9324368, 0.5025857, 2.044858, 1, 1, 1, 1, 1,
0.9389711, 0.3810492, 2.698503, 1, 1, 1, 1, 1,
0.951837, -0.1761158, 2.882268, 1, 1, 1, 1, 1,
0.9528507, 0.02607533, 0.9518724, 1, 1, 1, 1, 1,
0.9572781, -0.47459, 3.488247, 1, 1, 1, 1, 1,
0.9597749, 1.269823, 2.180057, 1, 1, 1, 1, 1,
0.9710832, -1.395914, 1.667635, 1, 1, 1, 1, 1,
0.9714499, -0.9826128, 2.262412, 1, 1, 1, 1, 1,
0.9778665, -1.084761, 1.254425, 1, 1, 1, 1, 1,
0.9782431, 0.1243106, 1.628311, 1, 1, 1, 1, 1,
0.9851897, -1.829239, 1.724627, 1, 1, 1, 1, 1,
0.9924021, -0.4383423, 0.8082017, 1, 1, 1, 1, 1,
0.9948851, 1.277445, 1.358772, 0, 0, 1, 1, 1,
0.9954102, -0.4503364, 1.397601, 1, 0, 0, 1, 1,
1.003591, 0.8856691, 1.429863, 1, 0, 0, 1, 1,
1.028458, -0.2323507, 1.354496, 1, 0, 0, 1, 1,
1.030682, 2.435182, 0.6069707, 1, 0, 0, 1, 1,
1.032757, 0.1172191, 0.6851522, 1, 0, 0, 1, 1,
1.035361, -1.235619, 0.7634235, 0, 0, 0, 1, 1,
1.04049, -0.2694248, 2.418745, 0, 0, 0, 1, 1,
1.041548, -1.055401, 1.949404, 0, 0, 0, 1, 1,
1.042657, -0.1272896, 0.3423401, 0, 0, 0, 1, 1,
1.055481, -0.3577036, 1.026826, 0, 0, 0, 1, 1,
1.057484, 1.366305, 1.140729, 0, 0, 0, 1, 1,
1.058192, 0.7215905, 1.869054, 0, 0, 0, 1, 1,
1.060694, -0.4860669, 3.202681, 1, 1, 1, 1, 1,
1.060844, 0.834406, 1.719202, 1, 1, 1, 1, 1,
1.064162, 0.9297597, 0.6692137, 1, 1, 1, 1, 1,
1.067596, -1.566364, 1.940921, 1, 1, 1, 1, 1,
1.074685, 1.165223, 0.7156147, 1, 1, 1, 1, 1,
1.075477, 0.8437625, 0.5504341, 1, 1, 1, 1, 1,
1.078513, 1.528494, 0.731843, 1, 1, 1, 1, 1,
1.082762, 0.2676346, 1.677727, 1, 1, 1, 1, 1,
1.088712, 0.4723549, 1.38536, 1, 1, 1, 1, 1,
1.090013, 0.5865287, 0.9200976, 1, 1, 1, 1, 1,
1.09668, 1.276057, 1.832705, 1, 1, 1, 1, 1,
1.097795, 0.1902718, 2.042107, 1, 1, 1, 1, 1,
1.102357, -1.021977, 3.484366, 1, 1, 1, 1, 1,
1.105443, -0.3645576, 1.246611, 1, 1, 1, 1, 1,
1.106546, -2.029742, 1.858094, 1, 1, 1, 1, 1,
1.108302, 0.1012462, 1.480245, 0, 0, 1, 1, 1,
1.113135, 0.0839655, 1.043748, 1, 0, 0, 1, 1,
1.127712, -0.8263055, 2.059407, 1, 0, 0, 1, 1,
1.133699, -2.235367, 4.1179, 1, 0, 0, 1, 1,
1.140417, 0.2688851, 0.2624311, 1, 0, 0, 1, 1,
1.151669, 0.9609596, 1.182275, 1, 0, 0, 1, 1,
1.155145, -0.5566692, 1.133926, 0, 0, 0, 1, 1,
1.158421, 1.827454, 1.661111, 0, 0, 0, 1, 1,
1.161874, -0.930954, 2.780346, 0, 0, 0, 1, 1,
1.168056, 2.150777, 0.4784038, 0, 0, 0, 1, 1,
1.171771, -0.6594034, 2.468205, 0, 0, 0, 1, 1,
1.171829, 1.438334, -0.3866366, 0, 0, 0, 1, 1,
1.17781, 1.067221, 1.458189, 0, 0, 0, 1, 1,
1.181036, 1.225049, -0.620097, 1, 1, 1, 1, 1,
1.18267, -1.131946, 4.314573, 1, 1, 1, 1, 1,
1.182826, -0.5713375, 0.4326263, 1, 1, 1, 1, 1,
1.184049, -0.3362901, 0.9704753, 1, 1, 1, 1, 1,
1.186047, 1.429374, 1.435766, 1, 1, 1, 1, 1,
1.189702, 1.23288, -1.229715, 1, 1, 1, 1, 1,
1.192631, 0.5455095, 0.8296145, 1, 1, 1, 1, 1,
1.202157, 0.936828, 1.717464, 1, 1, 1, 1, 1,
1.207876, -0.9811515, 2.794809, 1, 1, 1, 1, 1,
1.21074, 0.7906145, 1.77076, 1, 1, 1, 1, 1,
1.212663, 1.692793, 1.482229, 1, 1, 1, 1, 1,
1.216392, -0.0752852, -0.150427, 1, 1, 1, 1, 1,
1.219135, -0.09888449, 3.861093, 1, 1, 1, 1, 1,
1.219286, -0.1592714, 3.307174, 1, 1, 1, 1, 1,
1.221456, -0.106551, 1.233119, 1, 1, 1, 1, 1,
1.221619, 1.044014, 1.478084, 0, 0, 1, 1, 1,
1.227896, 0.4625598, 2.177269, 1, 0, 0, 1, 1,
1.228928, 0.3801416, -0.02815617, 1, 0, 0, 1, 1,
1.244668, -1.339664, 0.1019532, 1, 0, 0, 1, 1,
1.249146, 0.005321479, 0.6766624, 1, 0, 0, 1, 1,
1.258219, 0.3129309, 1.618725, 1, 0, 0, 1, 1,
1.262552, -1.157691, 1.641215, 0, 0, 0, 1, 1,
1.265636, 0.5213888, 1.703334, 0, 0, 0, 1, 1,
1.270016, -0.9526963, 1.922362, 0, 0, 0, 1, 1,
1.279123, -0.2884265, 1.410857, 0, 0, 0, 1, 1,
1.291306, 0.3938158, 1.077722, 0, 0, 0, 1, 1,
1.300651, -0.09273123, 1.382746, 0, 0, 0, 1, 1,
1.308753, 0.7113794, 0.3524838, 0, 0, 0, 1, 1,
1.320469, -1.603314, 2.018843, 1, 1, 1, 1, 1,
1.326291, -0.5521406, 1.496282, 1, 1, 1, 1, 1,
1.342309, -1.053091, 2.924913, 1, 1, 1, 1, 1,
1.354086, 0.3856589, -0.1097222, 1, 1, 1, 1, 1,
1.388209, 1.090665, 2.141926, 1, 1, 1, 1, 1,
1.395263, 0.2414423, 1.566112, 1, 1, 1, 1, 1,
1.39721, -1.708207, 1.064346, 1, 1, 1, 1, 1,
1.41035, -0.00771121, 1.390372, 1, 1, 1, 1, 1,
1.422926, -0.860352, 4.479249, 1, 1, 1, 1, 1,
1.445085, -0.4341149, 1.209133, 1, 1, 1, 1, 1,
1.458202, -0.4314467, 1.890297, 1, 1, 1, 1, 1,
1.464707, -2.049428, 2.853049, 1, 1, 1, 1, 1,
1.465491, 0.0853025, 3.107607, 1, 1, 1, 1, 1,
1.477136, -0.7856299, 2.837189, 1, 1, 1, 1, 1,
1.503377, -2.715852, 2.071809, 1, 1, 1, 1, 1,
1.509216, -0.4771738, 1.125998, 0, 0, 1, 1, 1,
1.509656, 0.2743028, -0.5658998, 1, 0, 0, 1, 1,
1.521388, 1.38008, 1.52922, 1, 0, 0, 1, 1,
1.522304, 1.070832, 0.2288474, 1, 0, 0, 1, 1,
1.539499, 0.6760477, -0.1677767, 1, 0, 0, 1, 1,
1.565808, 1.234557, 0.3360927, 1, 0, 0, 1, 1,
1.566414, 1.635328, -0.2676302, 0, 0, 0, 1, 1,
1.5778, -1.161625, 0.6317319, 0, 0, 0, 1, 1,
1.600759, -2.73118, 2.256428, 0, 0, 0, 1, 1,
1.610344, 0.1565627, 0.872096, 0, 0, 0, 1, 1,
1.612611, -0.5291392, 2.319986, 0, 0, 0, 1, 1,
1.615891, -0.5162346, 4.365305, 0, 0, 0, 1, 1,
1.618652, 0.9867461, 1.381421, 0, 0, 0, 1, 1,
1.621216, -1.084179, 1.656862, 1, 1, 1, 1, 1,
1.623576, -0.9866521, 1.950195, 1, 1, 1, 1, 1,
1.623874, 1.159541, 1.456761, 1, 1, 1, 1, 1,
1.624628, -0.5580534, 1.316177, 1, 1, 1, 1, 1,
1.626428, -0.1657584, 2.180269, 1, 1, 1, 1, 1,
1.630709, 2.273891, -1.877167, 1, 1, 1, 1, 1,
1.648038, -0.414988, 0.5133762, 1, 1, 1, 1, 1,
1.657404, 0.380064, 1.947172, 1, 1, 1, 1, 1,
1.663359, -0.7568428, 2.477852, 1, 1, 1, 1, 1,
1.6927, -1.088801, 2.494913, 1, 1, 1, 1, 1,
1.694479, 0.04617719, 1.36552, 1, 1, 1, 1, 1,
1.697298, 0.3699757, 2.415362, 1, 1, 1, 1, 1,
1.697505, 1.001796, 0.9988817, 1, 1, 1, 1, 1,
1.70446, 0.4665582, 2.94177, 1, 1, 1, 1, 1,
1.731985, -3.130293, 4.619512, 1, 1, 1, 1, 1,
1.736659, 0.8414209, 3.705606, 0, 0, 1, 1, 1,
1.740139, 1.392451, 0.8190714, 1, 0, 0, 1, 1,
1.760315, 1.220433, 0.3786966, 1, 0, 0, 1, 1,
1.805689, -0.1884624, 2.899334, 1, 0, 0, 1, 1,
1.817795, -0.2194828, -0.1381829, 1, 0, 0, 1, 1,
1.827922, -0.01405532, 0.5278954, 1, 0, 0, 1, 1,
1.844638, 2.20267, 0.9837124, 0, 0, 0, 1, 1,
1.857875, 0.3750618, 2.559086, 0, 0, 0, 1, 1,
1.866404, -0.9727836, 1.464272, 0, 0, 0, 1, 1,
1.874001, -0.2204175, 3.045777, 0, 0, 0, 1, 1,
1.883729, -0.5323598, 4.549652, 0, 0, 0, 1, 1,
1.894973, 0.2007673, 1.354719, 0, 0, 0, 1, 1,
1.902248, 0.3958021, -0.2582808, 0, 0, 0, 1, 1,
1.913781, 1.049883, 0.5238695, 1, 1, 1, 1, 1,
1.920156, 0.8454583, 1.699196, 1, 1, 1, 1, 1,
1.933598, 0.2700434, 1.28051, 1, 1, 1, 1, 1,
1.980034, 1.25334, 1.117482, 1, 1, 1, 1, 1,
1.999552, -0.1635973, 0.7129714, 1, 1, 1, 1, 1,
2.005112, 1.027486, 0.540817, 1, 1, 1, 1, 1,
2.026118, 0.7732913, 0.2413751, 1, 1, 1, 1, 1,
2.033931, -1.610006, 3.455997, 1, 1, 1, 1, 1,
2.035725, 0.0463434, 0.3204413, 1, 1, 1, 1, 1,
2.048458, 0.929261, 0.6634768, 1, 1, 1, 1, 1,
2.072978, 0.4299383, 0.8962334, 1, 1, 1, 1, 1,
2.07989, -0.08643068, 0.1067949, 1, 1, 1, 1, 1,
2.086625, 0.5344202, 2.113184, 1, 1, 1, 1, 1,
2.132538, -2.028542, 2.691591, 1, 1, 1, 1, 1,
2.150279, 0.1709474, 2.322331, 1, 1, 1, 1, 1,
2.174242, -1.213647, 1.612006, 0, 0, 1, 1, 1,
2.191591, 0.7064911, -0.1602825, 1, 0, 0, 1, 1,
2.192999, 1.527002, 0.2380345, 1, 0, 0, 1, 1,
2.201973, -2.11189, 2.024543, 1, 0, 0, 1, 1,
2.219379, -1.007401, 1.036145, 1, 0, 0, 1, 1,
2.229295, 0.8784376, 1.913534, 1, 0, 0, 1, 1,
2.238315, -0.6629728, 2.89195, 0, 0, 0, 1, 1,
2.2563, 0.2424935, 2.331278, 0, 0, 0, 1, 1,
2.265704, 1.213043, 0.5899711, 0, 0, 0, 1, 1,
2.266959, 0.7913182, 1.967296, 0, 0, 0, 1, 1,
2.358168, 0.8002867, -0.2203717, 0, 0, 0, 1, 1,
2.395072, 1.634898, 0.2225596, 0, 0, 0, 1, 1,
2.395698, 0.2519698, 1.767127, 0, 0, 0, 1, 1,
2.412868, 0.9693689, 0.7179937, 1, 1, 1, 1, 1,
2.480799, -0.08147091, 3.785678, 1, 1, 1, 1, 1,
2.618567, 0.1159015, -0.4345015, 1, 1, 1, 1, 1,
2.630469, -1.497781, 1.964022, 1, 1, 1, 1, 1,
2.644559, 0.05794837, 1.140483, 1, 1, 1, 1, 1,
2.654878, -1.398414, 2.339485, 1, 1, 1, 1, 1,
2.815988, 0.8041937, 0.6194154, 1, 1, 1, 1, 1
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
var radius = 9.512759;
var distance = 33.41316;
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
mvMatrix.translate( 0.1932292, 0.3334413, -0.258615 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41316);
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
