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
-3.033017, -0.492528, -2.452503, 1, 0, 0, 1,
-2.94859, 0.1912812, -3.147667, 1, 0.007843138, 0, 1,
-2.917251, -0.9395186, -1.688929, 1, 0.01176471, 0, 1,
-2.767736, 1.356642, -1.808633, 1, 0.01960784, 0, 1,
-2.618538, 0.656022, -1.196149, 1, 0.02352941, 0, 1,
-2.600999, -0.8807673, -1.178149, 1, 0.03137255, 0, 1,
-2.567813, -0.8583717, -2.139793, 1, 0.03529412, 0, 1,
-2.55767, -0.6306456, -2.314698, 1, 0.04313726, 0, 1,
-2.506424, -0.5005924, -1.776825, 1, 0.04705882, 0, 1,
-2.493289, -1.009971, -0.04523063, 1, 0.05490196, 0, 1,
-2.467703, 0.8975235, -1.87993, 1, 0.05882353, 0, 1,
-2.456971, -0.8179836, -0.9604876, 1, 0.06666667, 0, 1,
-2.413251, 1.459514, -0.0821422, 1, 0.07058824, 0, 1,
-2.371926, -1.777495, -3.246226, 1, 0.07843138, 0, 1,
-2.357508, -0.4370594, -3.335059, 1, 0.08235294, 0, 1,
-2.33644, 1.182522, -1.325774, 1, 0.09019608, 0, 1,
-2.300443, -0.1068246, -1.910069, 1, 0.09411765, 0, 1,
-2.286515, -0.7695559, -2.476609, 1, 0.1019608, 0, 1,
-2.281176, -0.3557808, -1.677207, 1, 0.1098039, 0, 1,
-2.265823, 1.826261, -1.416305, 1, 0.1137255, 0, 1,
-2.262849, -0.5956525, -1.317429, 1, 0.1215686, 0, 1,
-2.255327, 0.3428257, -1.860422, 1, 0.1254902, 0, 1,
-2.227293, -1.944142, -2.143094, 1, 0.1333333, 0, 1,
-2.211887, 1.00667, -0.4942729, 1, 0.1372549, 0, 1,
-2.185944, 0.2047851, -1.711027, 1, 0.145098, 0, 1,
-2.151246, 1.554759, -1.574125, 1, 0.1490196, 0, 1,
-2.148144, 0.2878627, -1.456358, 1, 0.1568628, 0, 1,
-2.133026, -0.6263986, -2.094405, 1, 0.1607843, 0, 1,
-2.114714, -3.19901, -2.323071, 1, 0.1686275, 0, 1,
-2.11235, -0.2621076, -2.451083, 1, 0.172549, 0, 1,
-2.111289, -0.2555571, -1.612764, 1, 0.1803922, 0, 1,
-2.102924, -0.68335, -1.147097, 1, 0.1843137, 0, 1,
-2.055504, 0.4804296, -1.915506, 1, 0.1921569, 0, 1,
-2.030482, -0.1716852, -0.4544195, 1, 0.1960784, 0, 1,
-2.003491, -0.6859985, -2.526165, 1, 0.2039216, 0, 1,
-2.000616, -1.333608, -2.47819, 1, 0.2117647, 0, 1,
-1.992563, 1.122283, -1.090996, 1, 0.2156863, 0, 1,
-1.982362, 0.03254664, -1.62505, 1, 0.2235294, 0, 1,
-1.963218, -1.475544, -4.107657, 1, 0.227451, 0, 1,
-1.956836, -0.901921, -1.454279, 1, 0.2352941, 0, 1,
-1.894158, 0.07889839, -1.409065, 1, 0.2392157, 0, 1,
-1.884303, 0.4883496, -0.9629049, 1, 0.2470588, 0, 1,
-1.875785, 0.6604502, -0.3818864, 1, 0.2509804, 0, 1,
-1.862094, -0.1814239, -4.38371, 1, 0.2588235, 0, 1,
-1.860628, -0.7049454, -2.796701, 1, 0.2627451, 0, 1,
-1.828422, -0.7131253, -1.811211, 1, 0.2705882, 0, 1,
-1.8258, -0.4760262, -1.017569, 1, 0.2745098, 0, 1,
-1.819907, -1.120082, -2.260721, 1, 0.282353, 0, 1,
-1.818753, -0.5112315, -4.272875, 1, 0.2862745, 0, 1,
-1.808996, -0.3842232, -3.111444, 1, 0.2941177, 0, 1,
-1.807189, 0.5043276, -0.86529, 1, 0.3019608, 0, 1,
-1.806072, 0.5707731, -0.7453619, 1, 0.3058824, 0, 1,
-1.795204, -0.5898374, -1.520697, 1, 0.3137255, 0, 1,
-1.794626, 0.1101733, -2.880993, 1, 0.3176471, 0, 1,
-1.791226, 0.4059443, -2.09394, 1, 0.3254902, 0, 1,
-1.78812, 0.1120928, -1.290197, 1, 0.3294118, 0, 1,
-1.785888, -0.9350634, -0.8060457, 1, 0.3372549, 0, 1,
-1.769246, -0.9328698, -3.562801, 1, 0.3411765, 0, 1,
-1.741395, -0.2203452, -1.233032, 1, 0.3490196, 0, 1,
-1.738529, 1.014212, -2.021375, 1, 0.3529412, 0, 1,
-1.734943, -0.2799617, -3.221678, 1, 0.3607843, 0, 1,
-1.729141, 0.4286595, -1.496481, 1, 0.3647059, 0, 1,
-1.726456, -0.5280784, -0.6409792, 1, 0.372549, 0, 1,
-1.687866, -1.570765, -1.619337, 1, 0.3764706, 0, 1,
-1.61739, 0.9419082, -0.8537352, 1, 0.3843137, 0, 1,
-1.615128, 0.1622655, -0.6852641, 1, 0.3882353, 0, 1,
-1.607326, -0.07110057, -0.6119825, 1, 0.3960784, 0, 1,
-1.597268, 0.81941, -1.773601, 1, 0.4039216, 0, 1,
-1.591371, -0.8787687, -2.273842, 1, 0.4078431, 0, 1,
-1.558484, -1.645439, -0.971289, 1, 0.4156863, 0, 1,
-1.547722, 0.410081, -3.114338, 1, 0.4196078, 0, 1,
-1.543148, -0.4708343, -0.899429, 1, 0.427451, 0, 1,
-1.536198, -0.6127858, -3.085426, 1, 0.4313726, 0, 1,
-1.515308, 0.2834642, -1.251565, 1, 0.4392157, 0, 1,
-1.504498, 0.05506813, -1.342455, 1, 0.4431373, 0, 1,
-1.498392, -0.5408072, -2.848803, 1, 0.4509804, 0, 1,
-1.496454, 0.9739795, -1.870239, 1, 0.454902, 0, 1,
-1.490196, 0.9830484, -1.401988, 1, 0.4627451, 0, 1,
-1.483173, -0.4069743, -1.886159, 1, 0.4666667, 0, 1,
-1.482837, -0.9558979, -0.8678565, 1, 0.4745098, 0, 1,
-1.461573, 0.2921646, -1.308235, 1, 0.4784314, 0, 1,
-1.459223, -0.1838068, -1.440089, 1, 0.4862745, 0, 1,
-1.446206, 0.1144041, -0.9697816, 1, 0.4901961, 0, 1,
-1.446053, 0.1278787, -0.3945024, 1, 0.4980392, 0, 1,
-1.443062, 0.8471202, -1.439258, 1, 0.5058824, 0, 1,
-1.431146, -1.005372, -2.048439, 1, 0.509804, 0, 1,
-1.424829, -0.4925343, -2.593136, 1, 0.5176471, 0, 1,
-1.418105, -0.7438777, -2.376873, 1, 0.5215687, 0, 1,
-1.41612, 0.8349072, 0.1431416, 1, 0.5294118, 0, 1,
-1.401058, 0.686694, -1.391135, 1, 0.5333334, 0, 1,
-1.399542, 1.454063, -0.9138023, 1, 0.5411765, 0, 1,
-1.392242, -0.1424218, -0.494305, 1, 0.5450981, 0, 1,
-1.385593, 1.03014, -1.042773, 1, 0.5529412, 0, 1,
-1.369662, 1.452371, -0.5766572, 1, 0.5568628, 0, 1,
-1.368316, 0.728446, -0.997194, 1, 0.5647059, 0, 1,
-1.361923, -1.273943, -1.429859, 1, 0.5686275, 0, 1,
-1.361561, -1.252322, -1.579161, 1, 0.5764706, 0, 1,
-1.349944, 1.601857, 0.6032149, 1, 0.5803922, 0, 1,
-1.340662, -2.095006, -2.001772, 1, 0.5882353, 0, 1,
-1.336461, 0.8865614, 0.1212754, 1, 0.5921569, 0, 1,
-1.334302, 0.4858695, -1.147937, 1, 0.6, 0, 1,
-1.329638, -0.3786623, -2.47084, 1, 0.6078432, 0, 1,
-1.326762, -1.896269, -1.798605, 1, 0.6117647, 0, 1,
-1.326218, -0.8517334, -1.365091, 1, 0.6196079, 0, 1,
-1.324626, 0.618305, -1.10732, 1, 0.6235294, 0, 1,
-1.321295, -0.1379995, -1.711924, 1, 0.6313726, 0, 1,
-1.317121, -0.8910659, -0.2065399, 1, 0.6352941, 0, 1,
-1.30795, -2.376181, -3.211267, 1, 0.6431373, 0, 1,
-1.304444, 0.08016684, -1.290774, 1, 0.6470588, 0, 1,
-1.303078, -2.487369, -2.958324, 1, 0.654902, 0, 1,
-1.287484, -0.4945249, -3.437479, 1, 0.6588235, 0, 1,
-1.272319, 1.652161, -0.5263405, 1, 0.6666667, 0, 1,
-1.272281, 0.2044678, -0.3984326, 1, 0.6705883, 0, 1,
-1.266952, -0.4712196, -1.458884, 1, 0.6784314, 0, 1,
-1.258977, 0.3543325, -1.028018, 1, 0.682353, 0, 1,
-1.248652, 0.5367906, -0.7981715, 1, 0.6901961, 0, 1,
-1.247692, -0.672631, -2.354141, 1, 0.6941177, 0, 1,
-1.246477, 0.387521, -2.778421, 1, 0.7019608, 0, 1,
-1.24358, -1.086728, -1.26158, 1, 0.7098039, 0, 1,
-1.240584, -1.145165, -3.611767, 1, 0.7137255, 0, 1,
-1.232569, 0.8566135, -0.7292572, 1, 0.7215686, 0, 1,
-1.229411, -0.7938145, -4.762693, 1, 0.7254902, 0, 1,
-1.221315, -0.4317116, -1.657287, 1, 0.7333333, 0, 1,
-1.220732, 0.1340561, -0.7082754, 1, 0.7372549, 0, 1,
-1.213089, 0.002813804, -1.158144, 1, 0.7450981, 0, 1,
-1.210349, 0.01878497, -3.138458, 1, 0.7490196, 0, 1,
-1.181597, -0.5430707, -2.829293, 1, 0.7568628, 0, 1,
-1.145341, -0.2925861, -0.8752578, 1, 0.7607843, 0, 1,
-1.13872, 0.8912064, -0.1250354, 1, 0.7686275, 0, 1,
-1.131927, -2.230416, -2.115442, 1, 0.772549, 0, 1,
-1.130675, -0.3642571, -2.160697, 1, 0.7803922, 0, 1,
-1.123505, -0.5004545, -3.103235, 1, 0.7843137, 0, 1,
-1.122436, 1.011159, -0.7107976, 1, 0.7921569, 0, 1,
-1.121543, -0.3278026, -2.405884, 1, 0.7960784, 0, 1,
-1.120718, -0.0978398, -2.554716, 1, 0.8039216, 0, 1,
-1.117912, 1.143417, -1.87256, 1, 0.8117647, 0, 1,
-1.11703, 1.83593, -0.7916902, 1, 0.8156863, 0, 1,
-1.116598, 0.3610751, -0.7027057, 1, 0.8235294, 0, 1,
-1.114129, 0.2900762, -1.306613, 1, 0.827451, 0, 1,
-1.113222, 0.7498195, -1.948266, 1, 0.8352941, 0, 1,
-1.106853, 0.2582011, -2.303633, 1, 0.8392157, 0, 1,
-1.1041, -0.06353936, -2.922576, 1, 0.8470588, 0, 1,
-1.102306, -0.8743578, -3.71052, 1, 0.8509804, 0, 1,
-1.093786, 0.9147266, -1.461476, 1, 0.8588235, 0, 1,
-1.093648, 0.1689896, -1.462069, 1, 0.8627451, 0, 1,
-1.086928, -0.6629293, -2.429657, 1, 0.8705882, 0, 1,
-1.083649, 1.517019, -1.589575, 1, 0.8745098, 0, 1,
-1.080109, 1.179644, -0.9793486, 1, 0.8823529, 0, 1,
-1.070762, -0.1438646, -1.615419, 1, 0.8862745, 0, 1,
-1.070075, -0.8073761, -2.373827, 1, 0.8941177, 0, 1,
-1.066764, -1.250884, -3.622693, 1, 0.8980392, 0, 1,
-1.066316, 0.5273781, -0.9566165, 1, 0.9058824, 0, 1,
-1.060674, -0.1394659, -3.153277, 1, 0.9137255, 0, 1,
-1.0424, 0.462874, -0.8546668, 1, 0.9176471, 0, 1,
-1.04136, -1.040268, -2.641199, 1, 0.9254902, 0, 1,
-1.034583, 0.1578227, -1.919903, 1, 0.9294118, 0, 1,
-1.032094, -0.4059566, -2.629796, 1, 0.9372549, 0, 1,
-1.029806, 0.2543561, -0.5631514, 1, 0.9411765, 0, 1,
-1.029594, -0.9032114, -2.570917, 1, 0.9490196, 0, 1,
-1.028944, -0.8132428, -0.3738351, 1, 0.9529412, 0, 1,
-1.021229, -1.157814, -2.318749, 1, 0.9607843, 0, 1,
-1.012365, -1.474394, -3.841868, 1, 0.9647059, 0, 1,
-1.010891, -1.80033, -3.676015, 1, 0.972549, 0, 1,
-1.007864, 2.130975, -0.9995072, 1, 0.9764706, 0, 1,
-1.000389, -0.4878528, -1.563155, 1, 0.9843137, 0, 1,
-1.000125, -0.8156312, -3.681073, 1, 0.9882353, 0, 1,
-0.9970718, -1.6339, -2.893147, 1, 0.9960784, 0, 1,
-0.9855293, 0.3705127, -2.23332, 0.9960784, 1, 0, 1,
-0.9836687, -0.4751743, -1.904392, 0.9921569, 1, 0, 1,
-0.9821122, -0.09034245, -3.532274, 0.9843137, 1, 0, 1,
-0.9697744, 0.1000584, -2.668841, 0.9803922, 1, 0, 1,
-0.9583207, -1.322802, -3.684994, 0.972549, 1, 0, 1,
-0.9486377, 1.760989, 0.9918321, 0.9686275, 1, 0, 1,
-0.9463044, -1.332855, -5.481777, 0.9607843, 1, 0, 1,
-0.9440981, 0.07841443, -2.452579, 0.9568627, 1, 0, 1,
-0.9433861, 0.8008626, 0.6884935, 0.9490196, 1, 0, 1,
-0.9406622, -0.5840092, -3.29132, 0.945098, 1, 0, 1,
-0.9374024, 0.2112649, -1.738226, 0.9372549, 1, 0, 1,
-0.9336566, -0.9107369, -1.865137, 0.9333333, 1, 0, 1,
-0.9304447, -0.1117968, -0.8640271, 0.9254902, 1, 0, 1,
-0.9281461, 0.3234442, -0.994138, 0.9215686, 1, 0, 1,
-0.9254567, -0.7023443, -1.54454, 0.9137255, 1, 0, 1,
-0.9250693, -0.2834194, -4.243101, 0.9098039, 1, 0, 1,
-0.9231212, -0.9149912, -4.859631, 0.9019608, 1, 0, 1,
-0.9223021, 0.2109004, -0.08074559, 0.8941177, 1, 0, 1,
-0.9201387, -0.5510336, -2.602782, 0.8901961, 1, 0, 1,
-0.9182864, -1.534825, -3.920951, 0.8823529, 1, 0, 1,
-0.918248, -0.6335923, -1.330436, 0.8784314, 1, 0, 1,
-0.9093033, -0.4568778, -0.2580452, 0.8705882, 1, 0, 1,
-0.9090647, -1.355503, -3.763225, 0.8666667, 1, 0, 1,
-0.9080481, 0.251787, -0.9215262, 0.8588235, 1, 0, 1,
-0.9074166, -1.372357, -4.818876, 0.854902, 1, 0, 1,
-0.905398, 0.4030065, -0.7489917, 0.8470588, 1, 0, 1,
-0.904309, 1.634031, -1.128248, 0.8431373, 1, 0, 1,
-0.9024748, 0.099689, -2.363509, 0.8352941, 1, 0, 1,
-0.8948614, 0.6695632, -0.002159446, 0.8313726, 1, 0, 1,
-0.880901, 1.900359, -1.027948, 0.8235294, 1, 0, 1,
-0.8800196, 1.728921, -1.186613, 0.8196079, 1, 0, 1,
-0.8785136, -1.151578, -3.550174, 0.8117647, 1, 0, 1,
-0.8731744, -0.4344964, 1.685383, 0.8078431, 1, 0, 1,
-0.8715962, 1.359946, -2.923632, 0.8, 1, 0, 1,
-0.8677073, 0.4102524, 0.856212, 0.7921569, 1, 0, 1,
-0.867127, 0.4774582, -0.3517181, 0.7882353, 1, 0, 1,
-0.8658066, -0.2062221, -1.773455, 0.7803922, 1, 0, 1,
-0.8615487, -0.1101916, -1.080973, 0.7764706, 1, 0, 1,
-0.8513284, 0.359324, -1.792161, 0.7686275, 1, 0, 1,
-0.8442619, 1.187057, -1.783377, 0.7647059, 1, 0, 1,
-0.8413668, -1.598408, -2.183049, 0.7568628, 1, 0, 1,
-0.834355, -1.014472, -2.452504, 0.7529412, 1, 0, 1,
-0.8337402, 0.3341486, -1.272334, 0.7450981, 1, 0, 1,
-0.8331035, 2.257986, 2.078433, 0.7411765, 1, 0, 1,
-0.8300664, -1.211381, -2.521876, 0.7333333, 1, 0, 1,
-0.8286703, 0.6742857, -2.536764, 0.7294118, 1, 0, 1,
-0.8231619, -0.6717142, -2.482925, 0.7215686, 1, 0, 1,
-0.8210741, -1.514258, -2.918862, 0.7176471, 1, 0, 1,
-0.8191569, 2.056293, -1.670309, 0.7098039, 1, 0, 1,
-0.8173867, -0.5405024, -2.509808, 0.7058824, 1, 0, 1,
-0.8170469, -0.7100191, -2.218305, 0.6980392, 1, 0, 1,
-0.8167342, -0.2540783, -1.284301, 0.6901961, 1, 0, 1,
-0.8147133, 0.3959089, -1.188318, 0.6862745, 1, 0, 1,
-0.8112972, 1.346118, 0.8599219, 0.6784314, 1, 0, 1,
-0.8102514, 0.5690749, -1.024182, 0.6745098, 1, 0, 1,
-0.805364, 1.090616, -1.679305, 0.6666667, 1, 0, 1,
-0.8011765, 1.099071, 0.0790126, 0.6627451, 1, 0, 1,
-0.7997677, -0.4477564, -1.81054, 0.654902, 1, 0, 1,
-0.7965515, -1.407977, -1.611103, 0.6509804, 1, 0, 1,
-0.7956153, -0.3444881, -3.376436, 0.6431373, 1, 0, 1,
-0.7928931, 0.5305556, -0.7864065, 0.6392157, 1, 0, 1,
-0.7927176, -0.3674421, -1.360589, 0.6313726, 1, 0, 1,
-0.7913225, 0.8890033, -0.5986779, 0.627451, 1, 0, 1,
-0.7821085, 1.818971, 1.239388, 0.6196079, 1, 0, 1,
-0.7733287, -0.3703232, -1.369276, 0.6156863, 1, 0, 1,
-0.7709748, -0.9820004, -5.099307, 0.6078432, 1, 0, 1,
-0.7691677, 0.5030409, -0.810387, 0.6039216, 1, 0, 1,
-0.7688944, 0.0983398, -0.9002312, 0.5960785, 1, 0, 1,
-0.7642098, -1.248723, -3.078334, 0.5882353, 1, 0, 1,
-0.7560134, -0.2115226, -2.104366, 0.5843138, 1, 0, 1,
-0.7489843, 0.02302918, -3.253673, 0.5764706, 1, 0, 1,
-0.7476281, -1.463633, -2.918503, 0.572549, 1, 0, 1,
-0.7450522, -0.2413754, -2.053709, 0.5647059, 1, 0, 1,
-0.7377011, -0.06101994, -0.7334048, 0.5607843, 1, 0, 1,
-0.7368889, 0.7167811, -0.1178298, 0.5529412, 1, 0, 1,
-0.7359421, -1.206346, -1.775853, 0.5490196, 1, 0, 1,
-0.7318226, -1.005908, -2.988845, 0.5411765, 1, 0, 1,
-0.7297449, 0.7798529, -2.647552, 0.5372549, 1, 0, 1,
-0.7290533, -0.125332, -0.8024205, 0.5294118, 1, 0, 1,
-0.7199532, -0.5805294, -1.542435, 0.5254902, 1, 0, 1,
-0.7134163, -0.5794262, -1.82082, 0.5176471, 1, 0, 1,
-0.7108429, 0.3256681, -0.3079355, 0.5137255, 1, 0, 1,
-0.7073696, -0.3536184, -0.5448129, 0.5058824, 1, 0, 1,
-0.702574, 0.7542581, -1.204155, 0.5019608, 1, 0, 1,
-0.700515, -0.1464321, -0.7530758, 0.4941176, 1, 0, 1,
-0.6997792, -1.335027, -6.46388, 0.4862745, 1, 0, 1,
-0.6937749, -1.204964, -3.119228, 0.4823529, 1, 0, 1,
-0.6929563, 2.651341, 0.7133394, 0.4745098, 1, 0, 1,
-0.6924816, -1.342903, -3.8299, 0.4705882, 1, 0, 1,
-0.6914338, -0.537854, -3.941947, 0.4627451, 1, 0, 1,
-0.6845234, 0.4332108, -1.363531, 0.4588235, 1, 0, 1,
-0.6805435, -0.4643003, -0.9860048, 0.4509804, 1, 0, 1,
-0.6744102, -0.5718005, -2.297745, 0.4470588, 1, 0, 1,
-0.6733382, 2.615412, -0.5801318, 0.4392157, 1, 0, 1,
-0.6694367, -0.7318522, -2.531829, 0.4352941, 1, 0, 1,
-0.6684057, -0.9278532, -4.638299, 0.427451, 1, 0, 1,
-0.6636966, 0.3204303, -1.157812, 0.4235294, 1, 0, 1,
-0.6594635, -2.646007, -3.862435, 0.4156863, 1, 0, 1,
-0.647734, 0.7361071, -1.040967, 0.4117647, 1, 0, 1,
-0.6461513, -1.486478, -2.498178, 0.4039216, 1, 0, 1,
-0.6440726, -0.6216548, -1.835803, 0.3960784, 1, 0, 1,
-0.6429151, -1.062601, -2.946274, 0.3921569, 1, 0, 1,
-0.6414515, 0.9092071, 0.6919392, 0.3843137, 1, 0, 1,
-0.6397028, -1.174188, -2.393989, 0.3803922, 1, 0, 1,
-0.6332312, -0.4821734, -3.035837, 0.372549, 1, 0, 1,
-0.6199799, -1.751815, -1.682576, 0.3686275, 1, 0, 1,
-0.6164295, 0.3161826, 0.07642274, 0.3607843, 1, 0, 1,
-0.6153691, 0.3587572, -1.863771, 0.3568628, 1, 0, 1,
-0.6149166, -1.580879, -4.049596, 0.3490196, 1, 0, 1,
-0.6089462, -1.82072, -1.495252, 0.345098, 1, 0, 1,
-0.6087863, -0.1884539, -2.067861, 0.3372549, 1, 0, 1,
-0.5995892, -0.6077769, -3.08731, 0.3333333, 1, 0, 1,
-0.5958499, -1.637601, -3.0308, 0.3254902, 1, 0, 1,
-0.5946507, -0.4866659, -1.040462, 0.3215686, 1, 0, 1,
-0.5902426, -0.3568384, -3.157538, 0.3137255, 1, 0, 1,
-0.5899358, 0.5311937, 0.08311786, 0.3098039, 1, 0, 1,
-0.5899202, 1.323426, -1.055989, 0.3019608, 1, 0, 1,
-0.5897761, 0.603286, -0.9995187, 0.2941177, 1, 0, 1,
-0.5883166, -0.9179105, -2.575348, 0.2901961, 1, 0, 1,
-0.5847081, -0.6597099, -3.856737, 0.282353, 1, 0, 1,
-0.5769407, 1.524934, -0.5358669, 0.2784314, 1, 0, 1,
-0.5769167, -1.623868, -3.10477, 0.2705882, 1, 0, 1,
-0.5757203, -1.672358, -0.6924493, 0.2666667, 1, 0, 1,
-0.5710706, -1.785549, -2.283517, 0.2588235, 1, 0, 1,
-0.5701811, -0.3484654, -2.630296, 0.254902, 1, 0, 1,
-0.5692352, -1.782163, -2.381636, 0.2470588, 1, 0, 1,
-0.568598, 1.146419, -2.734656, 0.2431373, 1, 0, 1,
-0.5685661, 1.342772, -0.7617266, 0.2352941, 1, 0, 1,
-0.5633087, -1.580743, -2.380726, 0.2313726, 1, 0, 1,
-0.5595933, 1.879115, -0.6663898, 0.2235294, 1, 0, 1,
-0.5570317, -1.589221, -2.781505, 0.2196078, 1, 0, 1,
-0.5564305, -1.81146, -3.878291, 0.2117647, 1, 0, 1,
-0.5558093, -0.5972015, -3.054265, 0.2078431, 1, 0, 1,
-0.5541938, -0.6623505, -1.334847, 0.2, 1, 0, 1,
-0.5537243, -0.5035547, -1.647403, 0.1921569, 1, 0, 1,
-0.551425, 0.5572498, 0.473737, 0.1882353, 1, 0, 1,
-0.5510391, 1.790762, -0.1367321, 0.1803922, 1, 0, 1,
-0.5506796, 0.1914875, -1.569439, 0.1764706, 1, 0, 1,
-0.545729, 1.806878, -2.714301, 0.1686275, 1, 0, 1,
-0.5448996, 1.573694, 0.4993279, 0.1647059, 1, 0, 1,
-0.5420683, 0.5644388, -1.336131, 0.1568628, 1, 0, 1,
-0.5316873, 0.6248439, -0.9891276, 0.1529412, 1, 0, 1,
-0.5313808, -0.1684887, -3.306533, 0.145098, 1, 0, 1,
-0.5291991, -0.3775547, -0.5517986, 0.1411765, 1, 0, 1,
-0.5265321, 0.6519407, 0.6953805, 0.1333333, 1, 0, 1,
-0.5255122, 2.496381, -0.6273395, 0.1294118, 1, 0, 1,
-0.5221127, 1.414528, -0.9199128, 0.1215686, 1, 0, 1,
-0.5217909, 1.169385, -0.2349519, 0.1176471, 1, 0, 1,
-0.5201676, -0.2262023, -1.11242, 0.1098039, 1, 0, 1,
-0.5195132, 0.4729078, -0.46725, 0.1058824, 1, 0, 1,
-0.5187814, -1.391339, -1.302447, 0.09803922, 1, 0, 1,
-0.5179002, 0.3602246, -1.680834, 0.09019608, 1, 0, 1,
-0.517012, -2.374591, -2.414612, 0.08627451, 1, 0, 1,
-0.5151356, 0.0700184, -0.4154178, 0.07843138, 1, 0, 1,
-0.5142825, 0.9251785, -0.1931425, 0.07450981, 1, 0, 1,
-0.5139338, -0.3017933, -1.557754, 0.06666667, 1, 0, 1,
-0.5102837, 0.4529321, -1.691635, 0.0627451, 1, 0, 1,
-0.5098788, -0.320207, -2.674957, 0.05490196, 1, 0, 1,
-0.5095186, 0.3560029, -2.09101, 0.05098039, 1, 0, 1,
-0.5094135, -0.222748, -2.498978, 0.04313726, 1, 0, 1,
-0.5059468, 0.2220068, -1.954252, 0.03921569, 1, 0, 1,
-0.5056486, -2.047343, 0.489789, 0.03137255, 1, 0, 1,
-0.5052279, -0.6753268, -2.302176, 0.02745098, 1, 0, 1,
-0.5023008, 3.376953, -2.036989, 0.01960784, 1, 0, 1,
-0.5017606, -0.9911521, -1.797806, 0.01568628, 1, 0, 1,
-0.5008016, 0.5297535, -2.780277, 0.007843138, 1, 0, 1,
-0.4969767, -0.5084289, -2.159874, 0.003921569, 1, 0, 1,
-0.4927574, 0.3390982, -1.196495, 0, 1, 0.003921569, 1,
-0.4863747, -1.265708, -4.819012, 0, 1, 0.01176471, 1,
-0.4857421, 0.9481692, 0.6862898, 0, 1, 0.01568628, 1,
-0.4793058, -0.125894, -2.304902, 0, 1, 0.02352941, 1,
-0.4768606, 0.8122451, -0.05329553, 0, 1, 0.02745098, 1,
-0.4722346, 1.916567, 0.1696874, 0, 1, 0.03529412, 1,
-0.4715122, -0.2791259, -1.653353, 0, 1, 0.03921569, 1,
-0.469866, -0.3225444, -1.612212, 0, 1, 0.04705882, 1,
-0.4697148, -1.160596, -0.7276912, 0, 1, 0.05098039, 1,
-0.4679752, -0.6442257, -3.068274, 0, 1, 0.05882353, 1,
-0.4656165, 0.02745246, -2.912241, 0, 1, 0.0627451, 1,
-0.463137, 1.104459, -0.6213, 0, 1, 0.07058824, 1,
-0.4622131, -0.556466, -2.498763, 0, 1, 0.07450981, 1,
-0.4568088, 0.5231563, -2.060557, 0, 1, 0.08235294, 1,
-0.4528462, -0.5795331, -2.668575, 0, 1, 0.08627451, 1,
-0.4415379, -1.219059, -3.534452, 0, 1, 0.09411765, 1,
-0.4276905, -0.08928005, -1.901832, 0, 1, 0.1019608, 1,
-0.426468, -0.2856696, -2.198494, 0, 1, 0.1058824, 1,
-0.4184803, -0.914367, -2.333333, 0, 1, 0.1137255, 1,
-0.4179817, -1.553131, -3.956179, 0, 1, 0.1176471, 1,
-0.417283, -1.162254, -1.32477, 0, 1, 0.1254902, 1,
-0.4171446, -1.853653, -2.736568, 0, 1, 0.1294118, 1,
-0.4160273, 1.695361, -0.3870905, 0, 1, 0.1372549, 1,
-0.4159113, 0.8656499, -1.901191, 0, 1, 0.1411765, 1,
-0.4149727, 0.1386985, -1.063706, 0, 1, 0.1490196, 1,
-0.414197, 0.745181, -0.6401156, 0, 1, 0.1529412, 1,
-0.4134155, -0.9603092, -2.166591, 0, 1, 0.1607843, 1,
-0.407433, -0.2008039, -1.909852, 0, 1, 0.1647059, 1,
-0.407221, 0.502789, -0.4251265, 0, 1, 0.172549, 1,
-0.4019451, -0.8155939, -3.542732, 0, 1, 0.1764706, 1,
-0.4011391, -0.3075832, -2.208032, 0, 1, 0.1843137, 1,
-0.3953168, -0.03428214, -0.9744937, 0, 1, 0.1882353, 1,
-0.3917057, 0.9133363, -0.3309188, 0, 1, 0.1960784, 1,
-0.3907151, 0.8525459, -1.592462, 0, 1, 0.2039216, 1,
-0.3887108, 1.499665, -1.394192, 0, 1, 0.2078431, 1,
-0.3884901, 1.181899, -0.6152914, 0, 1, 0.2156863, 1,
-0.387516, 0.4363734, -0.6321338, 0, 1, 0.2196078, 1,
-0.3869072, 0.7533963, 2.059325, 0, 1, 0.227451, 1,
-0.3830893, 0.09742494, -1.876579, 0, 1, 0.2313726, 1,
-0.3829149, 0.7060063, 0.5660363, 0, 1, 0.2392157, 1,
-0.3815165, 1.5074, 1.375229, 0, 1, 0.2431373, 1,
-0.3774849, 0.4905187, -0.04537621, 0, 1, 0.2509804, 1,
-0.3758019, -1.60669, -3.443892, 0, 1, 0.254902, 1,
-0.3749867, 1.184193, 1.221176, 0, 1, 0.2627451, 1,
-0.3728516, 1.747769, -0.04736935, 0, 1, 0.2666667, 1,
-0.3727891, 0.4897217, -0.1605515, 0, 1, 0.2745098, 1,
-0.3694217, 0.3720632, -1.643347, 0, 1, 0.2784314, 1,
-0.3680636, -0.6111842, -2.736435, 0, 1, 0.2862745, 1,
-0.3674712, -0.4651268, -2.172735, 0, 1, 0.2901961, 1,
-0.3654037, 0.1189908, -0.8185737, 0, 1, 0.2980392, 1,
-0.3611356, -1.69885, -3.254163, 0, 1, 0.3058824, 1,
-0.3560585, 0.1030039, -0.7046885, 0, 1, 0.3098039, 1,
-0.3552535, 0.02184454, -0.7619491, 0, 1, 0.3176471, 1,
-0.3503266, 0.9438782, -0.2801266, 0, 1, 0.3215686, 1,
-0.3502121, 0.9785616, 0.6689338, 0, 1, 0.3294118, 1,
-0.3500322, -0.3367575, -1.92976, 0, 1, 0.3333333, 1,
-0.3471206, -0.363317, -2.710912, 0, 1, 0.3411765, 1,
-0.3470013, -0.9685814, -1.869941, 0, 1, 0.345098, 1,
-0.3463041, 2.812992, -0.8263174, 0, 1, 0.3529412, 1,
-0.3424646, -0.2180915, -2.48212, 0, 1, 0.3568628, 1,
-0.3383606, -0.4152922, -0.5609686, 0, 1, 0.3647059, 1,
-0.3342473, -0.5939338, -2.426404, 0, 1, 0.3686275, 1,
-0.3278535, 1.227939, 0.5530681, 0, 1, 0.3764706, 1,
-0.327699, 1.519344, -0.3904597, 0, 1, 0.3803922, 1,
-0.3272314, -3.030192, -0.4041295, 0, 1, 0.3882353, 1,
-0.3219067, 0.710503, 1.25464, 0, 1, 0.3921569, 1,
-0.3212595, -0.3343587, -2.955473, 0, 1, 0.4, 1,
-0.3160953, 0.1706544, -1.496067, 0, 1, 0.4078431, 1,
-0.3157809, 2.51704, -1.631985, 0, 1, 0.4117647, 1,
-0.312704, 0.328997, 1.833039, 0, 1, 0.4196078, 1,
-0.310073, 2.713675, 1.540403, 0, 1, 0.4235294, 1,
-0.3089668, -0.8614721, -3.049367, 0, 1, 0.4313726, 1,
-0.3058339, 0.1443873, 0.291604, 0, 1, 0.4352941, 1,
-0.3056833, 1.002481, -0.9527379, 0, 1, 0.4431373, 1,
-0.3035916, 0.4749612, -1.38709, 0, 1, 0.4470588, 1,
-0.3014245, -1.271421, -4.861553, 0, 1, 0.454902, 1,
-0.3011781, 1.763962, -2.271657, 0, 1, 0.4588235, 1,
-0.3009526, 1.198789, -1.462737, 0, 1, 0.4666667, 1,
-0.299956, -2.026036, -3.103432, 0, 1, 0.4705882, 1,
-0.2931447, 0.1472378, -1.242623, 0, 1, 0.4784314, 1,
-0.2920805, -0.3561023, -3.670415, 0, 1, 0.4823529, 1,
-0.2903547, 0.3723316, -2.890336, 0, 1, 0.4901961, 1,
-0.2884798, -0.2342824, -1.731926, 0, 1, 0.4941176, 1,
-0.2883001, 0.3572954, 0.1178366, 0, 1, 0.5019608, 1,
-0.2849527, 0.2859404, -1.582479, 0, 1, 0.509804, 1,
-0.2848707, -0.2190214, -1.712911, 0, 1, 0.5137255, 1,
-0.2828274, 0.4332998, 0.7203972, 0, 1, 0.5215687, 1,
-0.2818088, 1.090554, 0.2478432, 0, 1, 0.5254902, 1,
-0.2808498, 0.3723009, -1.805599, 0, 1, 0.5333334, 1,
-0.2795007, 0.01269044, -3.423521, 0, 1, 0.5372549, 1,
-0.2789486, 1.03695, -1.818692, 0, 1, 0.5450981, 1,
-0.2778375, -0.6095186, -2.349151, 0, 1, 0.5490196, 1,
-0.2755305, 0.08060431, -3.338696, 0, 1, 0.5568628, 1,
-0.2751757, -0.8766425, -5.558634, 0, 1, 0.5607843, 1,
-0.2750258, -1.06003, -1.851717, 0, 1, 0.5686275, 1,
-0.2745252, -0.7650197, -3.258799, 0, 1, 0.572549, 1,
-0.2698007, -1.69924, -2.685567, 0, 1, 0.5803922, 1,
-0.2657726, -0.8305579, -3.8321, 0, 1, 0.5843138, 1,
-0.264084, -1.128705, -4.317863, 0, 1, 0.5921569, 1,
-0.262077, 1.127391, -0.4805876, 0, 1, 0.5960785, 1,
-0.2582395, 0.8895521, 0.7784703, 0, 1, 0.6039216, 1,
-0.2518568, -0.9985738, -2.127555, 0, 1, 0.6117647, 1,
-0.2510593, 1.406197, -1.284531, 0, 1, 0.6156863, 1,
-0.2463696, 0.4977652, -1.093015, 0, 1, 0.6235294, 1,
-0.2451472, 1.237149, 1.236019, 0, 1, 0.627451, 1,
-0.2451111, -1.725669, -4.13395, 0, 1, 0.6352941, 1,
-0.2448435, -1.407664, -2.867556, 0, 1, 0.6392157, 1,
-0.2440082, -2.354739, -3.484113, 0, 1, 0.6470588, 1,
-0.2434281, 0.7555937, 0.2511226, 0, 1, 0.6509804, 1,
-0.2431179, 1.180207, -0.836001, 0, 1, 0.6588235, 1,
-0.2393968, -0.2053997, -0.5008658, 0, 1, 0.6627451, 1,
-0.2359683, 0.005391399, -0.8242896, 0, 1, 0.6705883, 1,
-0.2353981, -0.1808992, -0.5582839, 0, 1, 0.6745098, 1,
-0.2347744, 0.2746244, 1.184026, 0, 1, 0.682353, 1,
-0.2346684, -1.085994, -0.8725606, 0, 1, 0.6862745, 1,
-0.2343262, -0.8904194, -4.011208, 0, 1, 0.6941177, 1,
-0.2291599, 1.336455, -0.1666695, 0, 1, 0.7019608, 1,
-0.2290655, 0.3760779, 0.7410262, 0, 1, 0.7058824, 1,
-0.2268347, -1.786267, -2.581039, 0, 1, 0.7137255, 1,
-0.2252405, -1.50125, -3.293783, 0, 1, 0.7176471, 1,
-0.2246263, 0.870259, -0.0454377, 0, 1, 0.7254902, 1,
-0.2245406, -0.4391061, -4.025951, 0, 1, 0.7294118, 1,
-0.2172177, -0.663942, -1.37299, 0, 1, 0.7372549, 1,
-0.207615, -1.198287, -1.403847, 0, 1, 0.7411765, 1,
-0.2064323, -0.03210108, -1.4686, 0, 1, 0.7490196, 1,
-0.1982767, 0.6967083, 0.4882548, 0, 1, 0.7529412, 1,
-0.1954288, 0.8403943, 0.009999396, 0, 1, 0.7607843, 1,
-0.1951819, -0.8971002, -2.796224, 0, 1, 0.7647059, 1,
-0.1949239, -0.1153724, -2.891953, 0, 1, 0.772549, 1,
-0.1918858, -0.9520856, -3.586852, 0, 1, 0.7764706, 1,
-0.1890326, -0.5395037, -1.74754, 0, 1, 0.7843137, 1,
-0.1886785, 0.03488791, -1.88143, 0, 1, 0.7882353, 1,
-0.1882609, 1.088976, 0.8310367, 0, 1, 0.7960784, 1,
-0.1855416, 2.199601, 1.480171, 0, 1, 0.8039216, 1,
-0.1837202, 2.11872, 0.6164046, 0, 1, 0.8078431, 1,
-0.1793744, -0.5146193, -4.617472, 0, 1, 0.8156863, 1,
-0.1737976, -0.4601153, -3.121386, 0, 1, 0.8196079, 1,
-0.1735688, -0.2641963, -4.522546, 0, 1, 0.827451, 1,
-0.1699979, 0.1564323, -0.8925529, 0, 1, 0.8313726, 1,
-0.1699305, 0.2536319, -1.096203, 0, 1, 0.8392157, 1,
-0.1615814, 0.1423107, -0.3052191, 0, 1, 0.8431373, 1,
-0.1575505, -0.1191908, -1.50318, 0, 1, 0.8509804, 1,
-0.1567037, 1.366644, 0.2911848, 0, 1, 0.854902, 1,
-0.1557655, -1.13745, -1.747039, 0, 1, 0.8627451, 1,
-0.1523495, -0.5534784, -2.811911, 0, 1, 0.8666667, 1,
-0.151873, 0.1772584, -1.994685, 0, 1, 0.8745098, 1,
-0.1457286, -0.04026945, -1.237508, 0, 1, 0.8784314, 1,
-0.1411094, -1.227851, -2.221084, 0, 1, 0.8862745, 1,
-0.140421, 0.4923068, -1.005999, 0, 1, 0.8901961, 1,
-0.1396319, -0.09447335, -2.509415, 0, 1, 0.8980392, 1,
-0.1367947, 2.377661, 0.05853855, 0, 1, 0.9058824, 1,
-0.1337586, -1.517628, -4.10602, 0, 1, 0.9098039, 1,
-0.1317081, -1.002935, -1.951777, 0, 1, 0.9176471, 1,
-0.1298208, 1.165178, -1.651963, 0, 1, 0.9215686, 1,
-0.1233943, 2.536955, 0.7607831, 0, 1, 0.9294118, 1,
-0.1225945, 2.070917, 0.7638879, 0, 1, 0.9333333, 1,
-0.1195922, -0.02880145, -1.102641, 0, 1, 0.9411765, 1,
-0.1152735, 0.5532963, 1.382562, 0, 1, 0.945098, 1,
-0.1133891, -0.7751536, -4.303237, 0, 1, 0.9529412, 1,
-0.1102611, -0.3127341, -3.461942, 0, 1, 0.9568627, 1,
-0.1081228, -1.746576, -2.686039, 0, 1, 0.9647059, 1,
-0.1073471, -1.434222, -5.997495, 0, 1, 0.9686275, 1,
-0.1063145, -0.5170779, -3.408775, 0, 1, 0.9764706, 1,
-0.1062503, -0.295544, -2.85166, 0, 1, 0.9803922, 1,
-0.1047593, 0.6404782, -0.4675481, 0, 1, 0.9882353, 1,
-0.1008304, -2.224329, -2.953875, 0, 1, 0.9921569, 1,
-0.1003268, 1.625471, -1.272381, 0, 1, 1, 1,
-0.09731873, -0.7525196, -1.189306, 0, 0.9921569, 1, 1,
-0.09711229, -1.511072, -3.560157, 0, 0.9882353, 1, 1,
-0.09621181, -0.9108019, -3.128082, 0, 0.9803922, 1, 1,
-0.09574074, -0.8928083, -1.988828, 0, 0.9764706, 1, 1,
-0.09289476, 0.266999, 0.3748629, 0, 0.9686275, 1, 1,
-0.0926574, -1.75842, -3.3424, 0, 0.9647059, 1, 1,
-0.08985421, -0.3897172, -2.105891, 0, 0.9568627, 1, 1,
-0.08572083, -0.2153348, -1.295398, 0, 0.9529412, 1, 1,
-0.08501892, 1.11107, 0.231535, 0, 0.945098, 1, 1,
-0.08255058, 1.008546, 1.030683, 0, 0.9411765, 1, 1,
-0.08164803, 0.1360236, 1.094704, 0, 0.9333333, 1, 1,
-0.06903938, -0.2596605, -3.569482, 0, 0.9294118, 1, 1,
-0.06850565, -0.03929069, -0.4681325, 0, 0.9215686, 1, 1,
-0.06678567, -0.9271852, -3.306641, 0, 0.9176471, 1, 1,
-0.06395839, -0.3110216, -1.942859, 0, 0.9098039, 1, 1,
-0.0612528, -0.3833589, -3.926744, 0, 0.9058824, 1, 1,
-0.05798442, 0.5095494, -0.814034, 0, 0.8980392, 1, 1,
-0.05655214, -0.7123349, -4.330421, 0, 0.8901961, 1, 1,
-0.05464485, -0.4565001, -4.161018, 0, 0.8862745, 1, 1,
-0.04963159, 0.6902413, -1.260243, 0, 0.8784314, 1, 1,
-0.04937618, 0.177539, 0.91613, 0, 0.8745098, 1, 1,
-0.04389713, -2.012044, -3.840606, 0, 0.8666667, 1, 1,
-0.04378078, -0.3381355, -3.072765, 0, 0.8627451, 1, 1,
-0.0361888, -1.435596, -1.701059, 0, 0.854902, 1, 1,
-0.03106108, 1.684807, 0.9926913, 0, 0.8509804, 1, 1,
-0.03033678, 0.116273, 1.138384, 0, 0.8431373, 1, 1,
-0.02797987, 0.3323241, -1.205937, 0, 0.8392157, 1, 1,
-0.02575731, 0.2628605, -0.5967911, 0, 0.8313726, 1, 1,
-0.02100976, -1.485193, -2.839302, 0, 0.827451, 1, 1,
-0.01775815, -0.9071304, -3.476201, 0, 0.8196079, 1, 1,
-0.01767844, -1.218853, -3.024851, 0, 0.8156863, 1, 1,
-0.0147233, -0.6755005, -2.619861, 0, 0.8078431, 1, 1,
-0.01191377, 0.4166198, -0.7585105, 0, 0.8039216, 1, 1,
-0.009709157, -0.3765568, -5.120972, 0, 0.7960784, 1, 1,
-0.002369196, -1.659831, -2.340791, 0, 0.7882353, 1, 1,
-0.002130901, -0.6173503, -3.100786, 0, 0.7843137, 1, 1,
-0.001463224, 0.03496664, -1.674498, 0, 0.7764706, 1, 1,
-0.001411667, 0.7374265, -0.7061166, 0, 0.772549, 1, 1,
0.0009863644, 1.19227, -0.05454154, 0, 0.7647059, 1, 1,
0.001941517, -1.490432, 4.585449, 0, 0.7607843, 1, 1,
0.008713502, 0.6734251, 0.4990318, 0, 0.7529412, 1, 1,
0.01101132, 0.6335033, -0.5117145, 0, 0.7490196, 1, 1,
0.01506119, 1.10795, -0.1334924, 0, 0.7411765, 1, 1,
0.01833448, 1.060874, -1.384712, 0, 0.7372549, 1, 1,
0.0217961, -1.64078, 3.067492, 0, 0.7294118, 1, 1,
0.02819879, 1.407453, -1.596721, 0, 0.7254902, 1, 1,
0.03196224, 0.2498646, -0.6516442, 0, 0.7176471, 1, 1,
0.03402705, 0.5003923, 0.2767876, 0, 0.7137255, 1, 1,
0.03530212, -0.4217977, 3.795242, 0, 0.7058824, 1, 1,
0.03607637, -0.005162404, -0.1021678, 0, 0.6980392, 1, 1,
0.04006391, 1.071897, -0.5769224, 0, 0.6941177, 1, 1,
0.04346099, -0.9871265, 3.534389, 0, 0.6862745, 1, 1,
0.04455967, -0.1216306, 4.649492, 0, 0.682353, 1, 1,
0.04492585, 0.6550539, 0.9558378, 0, 0.6745098, 1, 1,
0.04628874, 0.1995136, 0.1773158, 0, 0.6705883, 1, 1,
0.05851034, 0.378398, -0.853953, 0, 0.6627451, 1, 1,
0.05883416, -1.433166, 3.762913, 0, 0.6588235, 1, 1,
0.05975685, -0.06921196, 1.491317, 0, 0.6509804, 1, 1,
0.06841095, 0.5971889, 0.6132718, 0, 0.6470588, 1, 1,
0.07447244, 0.9293216, 0.9811003, 0, 0.6392157, 1, 1,
0.07856689, -0.5306543, 3.095849, 0, 0.6352941, 1, 1,
0.08094244, -0.6786135, 3.32445, 0, 0.627451, 1, 1,
0.08447995, 0.5995166, -2.374098, 0, 0.6235294, 1, 1,
0.08602061, -0.2837953, 3.653415, 0, 0.6156863, 1, 1,
0.08900804, 1.651536, 0.7419389, 0, 0.6117647, 1, 1,
0.09048523, 0.0372477, 2.311448, 0, 0.6039216, 1, 1,
0.09136064, 1.046952, -0.4867086, 0, 0.5960785, 1, 1,
0.09277367, 0.5522958, 0.7037878, 0, 0.5921569, 1, 1,
0.09600903, -0.7570992, 3.710475, 0, 0.5843138, 1, 1,
0.09664781, -0.5480074, 1.524536, 0, 0.5803922, 1, 1,
0.09741354, -1.285078, 3.327151, 0, 0.572549, 1, 1,
0.1077542, -0.6327978, 2.421457, 0, 0.5686275, 1, 1,
0.1082225, -0.7176239, 1.296666, 0, 0.5607843, 1, 1,
0.1145124, 2.006209, 1.046048, 0, 0.5568628, 1, 1,
0.12192, 1.516207, 0.07985389, 0, 0.5490196, 1, 1,
0.123717, 0.1396722, 0.4693337, 0, 0.5450981, 1, 1,
0.1237786, 0.7409968, 1.602242, 0, 0.5372549, 1, 1,
0.1279279, -0.2720005, 2.793187, 0, 0.5333334, 1, 1,
0.1294333, 0.531542, 0.6742864, 0, 0.5254902, 1, 1,
0.1309663, 0.2027729, 0.5897538, 0, 0.5215687, 1, 1,
0.133076, 1.326891, 0.7511111, 0, 0.5137255, 1, 1,
0.134888, 0.1347354, 1.1234, 0, 0.509804, 1, 1,
0.1352171, -0.366396, 4.17526, 0, 0.5019608, 1, 1,
0.1358576, 0.3974603, 0.4319505, 0, 0.4941176, 1, 1,
0.1412288, -1.199902, 3.143178, 0, 0.4901961, 1, 1,
0.14358, -0.6961437, 1.833568, 0, 0.4823529, 1, 1,
0.149951, 0.1366633, 0.8637709, 0, 0.4784314, 1, 1,
0.1530106, -1.27236, 3.054491, 0, 0.4705882, 1, 1,
0.1542839, -0.3926325, 5.190731, 0, 0.4666667, 1, 1,
0.1592316, -0.6947044, 3.669235, 0, 0.4588235, 1, 1,
0.1609411, 0.4862255, 0.559047, 0, 0.454902, 1, 1,
0.1630033, 0.5367551, 0.09561136, 0, 0.4470588, 1, 1,
0.1632264, 1.009289, 0.7660437, 0, 0.4431373, 1, 1,
0.163834, -0.08259969, 0.5331904, 0, 0.4352941, 1, 1,
0.1641926, 1.044515, 0.09850784, 0, 0.4313726, 1, 1,
0.17012, -1.573208, 4.276704, 0, 0.4235294, 1, 1,
0.1726364, -0.6069324, 3.504008, 0, 0.4196078, 1, 1,
0.1730112, -0.7498403, 0.988754, 0, 0.4117647, 1, 1,
0.1750451, -1.607909, 3.107065, 0, 0.4078431, 1, 1,
0.1751602, 0.4110879, 0.479205, 0, 0.4, 1, 1,
0.1833082, -0.8272126, 2.469745, 0, 0.3921569, 1, 1,
0.1846737, -0.06877671, 2.658639, 0, 0.3882353, 1, 1,
0.1865762, -1.310012, 4.117575, 0, 0.3803922, 1, 1,
0.1871322, -0.8870868, 1.945245, 0, 0.3764706, 1, 1,
0.1921187, -1.257366, 1.832084, 0, 0.3686275, 1, 1,
0.1943085, 0.1348496, 1.662941, 0, 0.3647059, 1, 1,
0.1961616, -0.7050844, 1.611306, 0, 0.3568628, 1, 1,
0.1977008, -0.8720603, 2.867922, 0, 0.3529412, 1, 1,
0.2055124, 0.06507865, 2.045611, 0, 0.345098, 1, 1,
0.2063392, -0.9630163, 3.400282, 0, 0.3411765, 1, 1,
0.2115315, 0.5903482, -0.3707157, 0, 0.3333333, 1, 1,
0.2128194, -0.4423041, 4.104018, 0, 0.3294118, 1, 1,
0.2152314, 0.2082154, 0.7363731, 0, 0.3215686, 1, 1,
0.2179257, 0.5459407, -0.04358658, 0, 0.3176471, 1, 1,
0.2200559, 0.6025687, -1.251991, 0, 0.3098039, 1, 1,
0.2212109, 0.2396572, -1.078582, 0, 0.3058824, 1, 1,
0.2222444, -0.2907315, 3.445463, 0, 0.2980392, 1, 1,
0.2356843, 0.948167, 0.7226042, 0, 0.2901961, 1, 1,
0.2400456, -1.293013, 5.390489, 0, 0.2862745, 1, 1,
0.2463151, 0.949337, 0.9015678, 0, 0.2784314, 1, 1,
0.2468548, -0.8513831, 3.039108, 0, 0.2745098, 1, 1,
0.2487613, 1.53175, 0.2312987, 0, 0.2666667, 1, 1,
0.2492438, 2.128417, 0.7350195, 0, 0.2627451, 1, 1,
0.2511607, 0.1450827, 0.8862731, 0, 0.254902, 1, 1,
0.2522649, 0.04201271, 3.132575, 0, 0.2509804, 1, 1,
0.2529271, -0.4427138, 2.441212, 0, 0.2431373, 1, 1,
0.2568885, -0.4811179, 3.399379, 0, 0.2392157, 1, 1,
0.2583831, -0.5904335, 3.432101, 0, 0.2313726, 1, 1,
0.2638696, -0.6960943, 2.581966, 0, 0.227451, 1, 1,
0.2686714, -2.618029, 3.832988, 0, 0.2196078, 1, 1,
0.2708569, -1.907619, 2.015911, 0, 0.2156863, 1, 1,
0.2735331, -1.886097, 2.661276, 0, 0.2078431, 1, 1,
0.275553, 0.4887305, 0.8000387, 0, 0.2039216, 1, 1,
0.2802183, 0.1582063, -0.7504992, 0, 0.1960784, 1, 1,
0.2852934, -0.1401497, 3.54028, 0, 0.1882353, 1, 1,
0.2876949, 2.067955, 1.018552, 0, 0.1843137, 1, 1,
0.2893753, -0.7000563, 1.71356, 0, 0.1764706, 1, 1,
0.2907056, -1.733594, 2.708054, 0, 0.172549, 1, 1,
0.303972, 0.001256078, 2.388764, 0, 0.1647059, 1, 1,
0.3055248, 0.9139783, -1.288683, 0, 0.1607843, 1, 1,
0.3173201, 0.3822706, 1.433253, 0, 0.1529412, 1, 1,
0.3215985, -1.188731, 3.295874, 0, 0.1490196, 1, 1,
0.3217075, 0.1581703, 2.044673, 0, 0.1411765, 1, 1,
0.3243657, -0.4111794, 2.453161, 0, 0.1372549, 1, 1,
0.3261409, -0.2053246, 3.395994, 0, 0.1294118, 1, 1,
0.3291448, 0.769513, -0.8366563, 0, 0.1254902, 1, 1,
0.3381035, -0.3835967, 2.853648, 0, 0.1176471, 1, 1,
0.3397348, 0.9123206, 0.3053188, 0, 0.1137255, 1, 1,
0.3451039, -1.262746, 2.66997, 0, 0.1058824, 1, 1,
0.3496227, 0.225159, 1.479373, 0, 0.09803922, 1, 1,
0.3533402, 2.008879, 0.685203, 0, 0.09411765, 1, 1,
0.3581946, -0.6954273, 2.635147, 0, 0.08627451, 1, 1,
0.3637128, -0.489752, 1.727757, 0, 0.08235294, 1, 1,
0.36672, -1.857254, 3.443347, 0, 0.07450981, 1, 1,
0.3676587, -1.354645, 3.378262, 0, 0.07058824, 1, 1,
0.372728, -0.2897348, 1.847816, 0, 0.0627451, 1, 1,
0.3734766, 1.58478, 0.7728521, 0, 0.05882353, 1, 1,
0.3739348, 0.1940856, 1.601983, 0, 0.05098039, 1, 1,
0.376761, 1.849425, -0.2875404, 0, 0.04705882, 1, 1,
0.3821897, -1.255651, 2.178705, 0, 0.03921569, 1, 1,
0.3855842, -0.9530126, 2.827924, 0, 0.03529412, 1, 1,
0.3856103, 0.03641964, 2.470362, 0, 0.02745098, 1, 1,
0.3882927, 0.1483321, 0.6738718, 0, 0.02352941, 1, 1,
0.388596, 1.410779, 1.034783, 0, 0.01568628, 1, 1,
0.3916361, -0.78592, 2.401302, 0, 0.01176471, 1, 1,
0.3936047, -0.2123126, 2.475297, 0, 0.003921569, 1, 1,
0.3978651, 1.474459, -1.015918, 0.003921569, 0, 1, 1,
0.3983255, 2.605867, -0.3918309, 0.007843138, 0, 1, 1,
0.4012184, 0.8827198, 1.515613, 0.01568628, 0, 1, 1,
0.4015961, 0.2463859, 0.2525231, 0.01960784, 0, 1, 1,
0.4053524, 0.1819544, 1.787391, 0.02745098, 0, 1, 1,
0.4152216, 1.24655, 0.2043483, 0.03137255, 0, 1, 1,
0.4197659, -0.6455383, 2.715091, 0.03921569, 0, 1, 1,
0.4217193, 0.2372709, 0.3220018, 0.04313726, 0, 1, 1,
0.4237431, 1.202593, 0.9293149, 0.05098039, 0, 1, 1,
0.426249, -0.5599278, 3.121339, 0.05490196, 0, 1, 1,
0.4380254, 0.5906986, 0.7667341, 0.0627451, 0, 1, 1,
0.4385104, 0.003950368, 1.92446, 0.06666667, 0, 1, 1,
0.4407482, -1.324753, 1.74417, 0.07450981, 0, 1, 1,
0.4458193, -0.5583215, 2.698203, 0.07843138, 0, 1, 1,
0.4517834, -0.2194043, 3.686888, 0.08627451, 0, 1, 1,
0.4531676, 0.1238849, 1.961187, 0.09019608, 0, 1, 1,
0.4557525, -0.008918181, 0.2133885, 0.09803922, 0, 1, 1,
0.458797, 0.2737426, 1.001935, 0.1058824, 0, 1, 1,
0.4597533, -1.053689, 2.098363, 0.1098039, 0, 1, 1,
0.4599805, -1.926833, 2.672331, 0.1176471, 0, 1, 1,
0.459981, -0.5085094, 3.098944, 0.1215686, 0, 1, 1,
0.4638297, -0.06269877, 2.143068, 0.1294118, 0, 1, 1,
0.4669501, -0.6931207, 2.201891, 0.1333333, 0, 1, 1,
0.468495, 1.439344, 1.558889, 0.1411765, 0, 1, 1,
0.4717023, 0.03262995, 1.066844, 0.145098, 0, 1, 1,
0.4859439, 1.204709, 0.2204279, 0.1529412, 0, 1, 1,
0.4941464, -0.9858605, 2.705511, 0.1568628, 0, 1, 1,
0.4972828, 0.1981911, 0.7604064, 0.1647059, 0, 1, 1,
0.4999117, -0.4782716, 3.506024, 0.1686275, 0, 1, 1,
0.5030167, -0.6534908, 2.623801, 0.1764706, 0, 1, 1,
0.5051276, -1.878662, 2.418148, 0.1803922, 0, 1, 1,
0.5079324, -0.66866, 1.362989, 0.1882353, 0, 1, 1,
0.5079694, 0.8976588, 1.281584, 0.1921569, 0, 1, 1,
0.5080267, 0.9896572, 1.868041, 0.2, 0, 1, 1,
0.5128564, -1.031821, 3.111153, 0.2078431, 0, 1, 1,
0.5133103, -0.2136885, 1.853648, 0.2117647, 0, 1, 1,
0.5146601, 1.26347, -0.5294138, 0.2196078, 0, 1, 1,
0.5212543, -0.2055939, 3.028672, 0.2235294, 0, 1, 1,
0.5234123, 1.20943, -0.2260247, 0.2313726, 0, 1, 1,
0.5259968, 1.744882, 0.1412906, 0.2352941, 0, 1, 1,
0.5286828, 2.183721, 0.3211887, 0.2431373, 0, 1, 1,
0.5310259, -2.400317, 3.715174, 0.2470588, 0, 1, 1,
0.5318098, -0.3810819, 2.496378, 0.254902, 0, 1, 1,
0.5349466, 0.05771382, 0.607262, 0.2588235, 0, 1, 1,
0.5380402, -0.783749, 3.316983, 0.2666667, 0, 1, 1,
0.538524, -0.1457386, 2.315267, 0.2705882, 0, 1, 1,
0.5397065, -0.3054291, 2.088866, 0.2784314, 0, 1, 1,
0.5400127, -0.07829338, 1.268708, 0.282353, 0, 1, 1,
0.5419599, 0.9411717, 0.1466904, 0.2901961, 0, 1, 1,
0.5452847, 1.294424, 0.8571362, 0.2941177, 0, 1, 1,
0.5460176, -0.9536365, 3.959459, 0.3019608, 0, 1, 1,
0.5496191, 1.204345, 0.8784223, 0.3098039, 0, 1, 1,
0.550499, -0.006174179, 1.277997, 0.3137255, 0, 1, 1,
0.5510138, -1.150651, 1.174302, 0.3215686, 0, 1, 1,
0.5516831, 0.8457046, 0.7969835, 0.3254902, 0, 1, 1,
0.5530173, -2.001809, -0.2191775, 0.3333333, 0, 1, 1,
0.5600473, 1.084528, -0.3661341, 0.3372549, 0, 1, 1,
0.5630457, 1.11668, 1.376705, 0.345098, 0, 1, 1,
0.563933, 1.194806, -0.3599944, 0.3490196, 0, 1, 1,
0.5641761, 1.182358, 1.189718, 0.3568628, 0, 1, 1,
0.5699394, 0.7116475, -0.00495183, 0.3607843, 0, 1, 1,
0.5701802, -0.4438677, 1.90752, 0.3686275, 0, 1, 1,
0.5727669, -0.7362297, 3.624355, 0.372549, 0, 1, 1,
0.5745901, -0.1730691, 2.647438, 0.3803922, 0, 1, 1,
0.5796429, 0.7488424, 1.224222, 0.3843137, 0, 1, 1,
0.5840413, -0.9303733, -0.1217819, 0.3921569, 0, 1, 1,
0.5849436, 0.4639273, 1.301811, 0.3960784, 0, 1, 1,
0.5857019, 0.2637081, 3.38621, 0.4039216, 0, 1, 1,
0.5977898, 0.9333212, 1.51752, 0.4117647, 0, 1, 1,
0.6092125, 0.09235019, 1.904194, 0.4156863, 0, 1, 1,
0.615124, -0.8922253, 2.74915, 0.4235294, 0, 1, 1,
0.6210771, -0.5761752, -0.1973132, 0.427451, 0, 1, 1,
0.6229962, -1.062158, 3.115717, 0.4352941, 0, 1, 1,
0.6269182, 0.706732, 1.26835, 0.4392157, 0, 1, 1,
0.6274328, -0.2468032, 3.124831, 0.4470588, 0, 1, 1,
0.6281282, -0.04056195, 1.106085, 0.4509804, 0, 1, 1,
0.6291052, -0.7452999, 3.4172, 0.4588235, 0, 1, 1,
0.6357133, -0.205024, 2.77289, 0.4627451, 0, 1, 1,
0.6362004, -0.9570935, 3.430463, 0.4705882, 0, 1, 1,
0.6383068, -0.5062351, 2.197028, 0.4745098, 0, 1, 1,
0.6404364, 0.9241046, -0.08112587, 0.4823529, 0, 1, 1,
0.6465932, 2.538599, 0.6927685, 0.4862745, 0, 1, 1,
0.6482227, 0.5504929, 2.659202, 0.4941176, 0, 1, 1,
0.653209, 0.8288358, 0.1170457, 0.5019608, 0, 1, 1,
0.6569855, 0.4239698, 3.180167, 0.5058824, 0, 1, 1,
0.658985, 0.3978191, 0.2602936, 0.5137255, 0, 1, 1,
0.6754048, 1.592806, -0.1903091, 0.5176471, 0, 1, 1,
0.6780838, 0.4119487, 1.378267, 0.5254902, 0, 1, 1,
0.6792294, 0.4537372, 1.048251, 0.5294118, 0, 1, 1,
0.6851506, -0.7285787, 2.080748, 0.5372549, 0, 1, 1,
0.6880068, -0.9980678, 3.32331, 0.5411765, 0, 1, 1,
0.6889012, -1.776688, 2.496759, 0.5490196, 0, 1, 1,
0.6963238, 0.9584942, -1.071007, 0.5529412, 0, 1, 1,
0.697212, 0.5263004, -0.7030397, 0.5607843, 0, 1, 1,
0.6992723, 1.210577, 0.2792444, 0.5647059, 0, 1, 1,
0.71144, -0.5617002, 2.233367, 0.572549, 0, 1, 1,
0.7166765, -0.2693802, 0.7047865, 0.5764706, 0, 1, 1,
0.719694, 1.094708, 1.167773, 0.5843138, 0, 1, 1,
0.7215115, 0.3622679, 0.7621983, 0.5882353, 0, 1, 1,
0.7233083, 0.4757825, 1.261277, 0.5960785, 0, 1, 1,
0.7242829, 1.031953, 0.2355232, 0.6039216, 0, 1, 1,
0.7296833, 0.5346655, 0.8591152, 0.6078432, 0, 1, 1,
0.7322063, 1.037131, -0.4562191, 0.6156863, 0, 1, 1,
0.7327394, 0.7053515, -1.061561, 0.6196079, 0, 1, 1,
0.7330601, -1.353638, 2.557788, 0.627451, 0, 1, 1,
0.7333372, -1.857175, 3.799572, 0.6313726, 0, 1, 1,
0.7409953, -1.175283, 3.107562, 0.6392157, 0, 1, 1,
0.7415705, 0.9096257, 0.04682672, 0.6431373, 0, 1, 1,
0.7441279, -0.2385792, 3.185174, 0.6509804, 0, 1, 1,
0.7454947, -0.5215849, 1.362775, 0.654902, 0, 1, 1,
0.7456414, 0.3313054, -0.6045557, 0.6627451, 0, 1, 1,
0.7464299, -1.801216, 3.222814, 0.6666667, 0, 1, 1,
0.7466095, 0.544411, 1.61242, 0.6745098, 0, 1, 1,
0.7493106, -0.9143443, 2.650998, 0.6784314, 0, 1, 1,
0.7498443, 0.5578972, 0.6402504, 0.6862745, 0, 1, 1,
0.7537606, -0.3791066, 2.445935, 0.6901961, 0, 1, 1,
0.7723194, -0.9420491, 2.989186, 0.6980392, 0, 1, 1,
0.7763061, 0.1715418, 1.660662, 0.7058824, 0, 1, 1,
0.7787369, 1.922448, 0.5248653, 0.7098039, 0, 1, 1,
0.7827021, 1.681792, 0.3780424, 0.7176471, 0, 1, 1,
0.7830889, 0.8003107, -0.1065341, 0.7215686, 0, 1, 1,
0.7856352, -1.120649, 3.981343, 0.7294118, 0, 1, 1,
0.7891065, -0.7742487, 2.862656, 0.7333333, 0, 1, 1,
0.7896484, -0.6753454, 2.14307, 0.7411765, 0, 1, 1,
0.7986826, -0.1567048, 2.753185, 0.7450981, 0, 1, 1,
0.8015856, -2.19626, 3.045494, 0.7529412, 0, 1, 1,
0.8105095, -1.697752, 3.437456, 0.7568628, 0, 1, 1,
0.8134341, 0.6463299, 0.3432149, 0.7647059, 0, 1, 1,
0.8171422, -0.1082244, 1.946793, 0.7686275, 0, 1, 1,
0.8210155, 2.261053, 0.3807366, 0.7764706, 0, 1, 1,
0.8217899, 0.2445021, 2.322659, 0.7803922, 0, 1, 1,
0.8236783, 1.017569, 0.3381246, 0.7882353, 0, 1, 1,
0.8279176, -0.3126471, 2.994221, 0.7921569, 0, 1, 1,
0.8283374, -1.0979, 2.857827, 0.8, 0, 1, 1,
0.8319633, 0.484027, 0.2665755, 0.8078431, 0, 1, 1,
0.8385147, -1.329435, 0.8341246, 0.8117647, 0, 1, 1,
0.8406898, 0.8083973, 0.6963173, 0.8196079, 0, 1, 1,
0.845476, 0.4082156, 1.149225, 0.8235294, 0, 1, 1,
0.8456331, 1.05909, 1.435307, 0.8313726, 0, 1, 1,
0.8473771, 0.3905402, 1.178628, 0.8352941, 0, 1, 1,
0.8581095, 0.392904, 0.8871999, 0.8431373, 0, 1, 1,
0.8626393, -2.044842, 3.217247, 0.8470588, 0, 1, 1,
0.8632782, 0.1872063, 1.051353, 0.854902, 0, 1, 1,
0.8725024, -1.478785, 3.293888, 0.8588235, 0, 1, 1,
0.8780382, -0.3919253, 1.258605, 0.8666667, 0, 1, 1,
0.8826541, 0.3935728, 0.151028, 0.8705882, 0, 1, 1,
0.8842691, -0.539004, 1.900681, 0.8784314, 0, 1, 1,
0.8844644, 0.09219829, 3.444404, 0.8823529, 0, 1, 1,
0.8874709, 1.136205, 1.53887, 0.8901961, 0, 1, 1,
0.8889565, 0.02333107, 1.854236, 0.8941177, 0, 1, 1,
0.8895367, 0.6197891, 0.7003146, 0.9019608, 0, 1, 1,
0.9048214, -0.04080471, 1.316969, 0.9098039, 0, 1, 1,
0.9079409, 0.2591799, 0.790597, 0.9137255, 0, 1, 1,
0.9105523, 0.5001513, 3.1493, 0.9215686, 0, 1, 1,
0.9124601, -1.097456, 2.813698, 0.9254902, 0, 1, 1,
0.9148607, -0.9925129, 1.56673, 0.9333333, 0, 1, 1,
0.9148667, 0.9748468, 1.980251, 0.9372549, 0, 1, 1,
0.9190633, -2.264217, 2.064898, 0.945098, 0, 1, 1,
0.9211797, -2.310768, 3.113853, 0.9490196, 0, 1, 1,
0.9235034, -0.08554234, 1.191367, 0.9568627, 0, 1, 1,
0.9237893, 0.4491782, 0.4755939, 0.9607843, 0, 1, 1,
0.930851, 0.2322109, 0.5619565, 0.9686275, 0, 1, 1,
0.9353788, 1.016744, 1.736084, 0.972549, 0, 1, 1,
0.9359866, 0.4408419, 1.547811, 0.9803922, 0, 1, 1,
0.9396748, 0.7419593, -0.007585481, 0.9843137, 0, 1, 1,
0.9422825, -0.6592829, 2.123098, 0.9921569, 0, 1, 1,
0.9508199, -0.3177928, 3.07761, 0.9960784, 0, 1, 1,
0.9532087, 1.066836, 3.091285, 1, 0, 0.9960784, 1,
0.9690257, 0.4412004, 0.8964068, 1, 0, 0.9882353, 1,
0.9721119, -0.8145075, 0.6537417, 1, 0, 0.9843137, 1,
0.9790218, -1.095037, 2.953015, 1, 0, 0.9764706, 1,
0.9817173, 0.0451266, 0.7780316, 1, 0, 0.972549, 1,
0.982264, -0.915583, 2.010164, 1, 0, 0.9647059, 1,
0.9876198, 0.3604145, 1.402598, 1, 0, 0.9607843, 1,
0.9910323, -0.338617, 3.926846, 1, 0, 0.9529412, 1,
0.9946632, -0.2213842, 3.037836, 1, 0, 0.9490196, 1,
0.9970139, 0.3608658, 0.3736061, 1, 0, 0.9411765, 1,
1.003381, -0.7749873, 1.726067, 1, 0, 0.9372549, 1,
1.004212, -1.369744, 2.159504, 1, 0, 0.9294118, 1,
1.006665, 0.7876341, 1.549326, 1, 0, 0.9254902, 1,
1.006949, -1.169582, 2.588974, 1, 0, 0.9176471, 1,
1.008221, -0.2993346, 2.188425, 1, 0, 0.9137255, 1,
1.014682, 0.7477857, 0.5712143, 1, 0, 0.9058824, 1,
1.020278, -0.8156295, 3.147557, 1, 0, 0.9019608, 1,
1.023596, 0.6607676, 1.472221, 1, 0, 0.8941177, 1,
1.029909, -0.507329, 2.20519, 1, 0, 0.8862745, 1,
1.031049, 0.7407941, 0.3315523, 1, 0, 0.8823529, 1,
1.03813, 0.5616289, 1.802898, 1, 0, 0.8745098, 1,
1.043149, -0.1528156, 1.404658, 1, 0, 0.8705882, 1,
1.04402, 2.794338, -0.2996695, 1, 0, 0.8627451, 1,
1.045496, 0.4035408, 1.780478, 1, 0, 0.8588235, 1,
1.052867, -0.3784144, 1.322853, 1, 0, 0.8509804, 1,
1.056989, 0.4903518, 0.7512597, 1, 0, 0.8470588, 1,
1.067019, -0.1674509, 2.958468, 1, 0, 0.8392157, 1,
1.076832, 0.4478214, 1.357895, 1, 0, 0.8352941, 1,
1.081347, 0.2225628, 2.248115, 1, 0, 0.827451, 1,
1.086062, -1.628556, 3.63567, 1, 0, 0.8235294, 1,
1.089004, 0.3732457, 1.164077, 1, 0, 0.8156863, 1,
1.090414, 0.9299691, -1.65446, 1, 0, 0.8117647, 1,
1.093063, -0.1352359, 2.800584, 1, 0, 0.8039216, 1,
1.09337, -1.578364, 1.57513, 1, 0, 0.7960784, 1,
1.116525, 0.2301159, 0.3684007, 1, 0, 0.7921569, 1,
1.11766, -1.061115, 1.45375, 1, 0, 0.7843137, 1,
1.127914, -1.772424, 0.9132224, 1, 0, 0.7803922, 1,
1.128533, -1.136994, 4.787992, 1, 0, 0.772549, 1,
1.13397, -0.3197304, 1.573567, 1, 0, 0.7686275, 1,
1.136362, 0.1917383, 1.50356, 1, 0, 0.7607843, 1,
1.137048, 0.43914, 1.099927, 1, 0, 0.7568628, 1,
1.137364, 0.1047652, 3.948934, 1, 0, 0.7490196, 1,
1.1375, 0.6112615, 1.622745, 1, 0, 0.7450981, 1,
1.138498, -1.53197, 3.38653, 1, 0, 0.7372549, 1,
1.143991, -0.2516645, 1.624532, 1, 0, 0.7333333, 1,
1.148975, -0.6103406, 3.459776, 1, 0, 0.7254902, 1,
1.15457, -1.332588, 2.267438, 1, 0, 0.7215686, 1,
1.164348, 1.098642, 0.2945979, 1, 0, 0.7137255, 1,
1.165719, -0.3810728, 2.299697, 1, 0, 0.7098039, 1,
1.166569, 0.768477, 0.3430235, 1, 0, 0.7019608, 1,
1.166782, 0.7149155, 0.5626068, 1, 0, 0.6941177, 1,
1.170011, 2.435958, 0.6567286, 1, 0, 0.6901961, 1,
1.171948, 0.01328318, 1.316961, 1, 0, 0.682353, 1,
1.174669, 0.4105655, -0.1815829, 1, 0, 0.6784314, 1,
1.181161, 0.02107877, 0.6456769, 1, 0, 0.6705883, 1,
1.182487, 1.239542, 0.2554308, 1, 0, 0.6666667, 1,
1.186151, -1.061306, 2.836623, 1, 0, 0.6588235, 1,
1.189973, 1.076058, 2.180506, 1, 0, 0.654902, 1,
1.19961, -0.2826374, 1.719423, 1, 0, 0.6470588, 1,
1.20203, 0.19498, 2.868991, 1, 0, 0.6431373, 1,
1.203863, -1.784531, 2.851861, 1, 0, 0.6352941, 1,
1.20975, -0.1052223, 2.283166, 1, 0, 0.6313726, 1,
1.210942, 1.40436, 1.617116, 1, 0, 0.6235294, 1,
1.22709, 0.22872, 0.8851191, 1, 0, 0.6196079, 1,
1.229304, 2.453038, 0.4039295, 1, 0, 0.6117647, 1,
1.234755, -1.265513, 3.26823, 1, 0, 0.6078432, 1,
1.24491, -1.224542, 2.784328, 1, 0, 0.6, 1,
1.265747, -1.612547, 2.994017, 1, 0, 0.5921569, 1,
1.267319, 1.063469, 1.439743, 1, 0, 0.5882353, 1,
1.282315, -0.5785891, 0.5449247, 1, 0, 0.5803922, 1,
1.283828, 1.011612, 0.7303011, 1, 0, 0.5764706, 1,
1.28431, -1.067514, 2.727354, 1, 0, 0.5686275, 1,
1.284991, 0.4219961, 1.187427, 1, 0, 0.5647059, 1,
1.289123, 1.172303, 1.301997, 1, 0, 0.5568628, 1,
1.299144, -0.3121716, 1.012232, 1, 0, 0.5529412, 1,
1.304082, 1.352537, 2.41479, 1, 0, 0.5450981, 1,
1.30464, -0.09964586, 1.72651, 1, 0, 0.5411765, 1,
1.306967, -1.416172, 2.50543, 1, 0, 0.5333334, 1,
1.307462, -0.7123317, 4.339718, 1, 0, 0.5294118, 1,
1.314864, 0.1036598, 2.58315, 1, 0, 0.5215687, 1,
1.326259, -0.4826151, 2.403636, 1, 0, 0.5176471, 1,
1.328798, -1.735261, 0.7394969, 1, 0, 0.509804, 1,
1.328886, -1.124453, 4.051081, 1, 0, 0.5058824, 1,
1.339375, 2.277085, 2.25507, 1, 0, 0.4980392, 1,
1.343431, -0.2792492, 2.09021, 1, 0, 0.4901961, 1,
1.345254, 0.5747283, 0.308492, 1, 0, 0.4862745, 1,
1.348653, 3.983321, 1.655437, 1, 0, 0.4784314, 1,
1.356122, 0.003456891, 0.8233631, 1, 0, 0.4745098, 1,
1.356144, 0.06212808, 0.2422348, 1, 0, 0.4666667, 1,
1.365412, 1.872129, -0.8907495, 1, 0, 0.4627451, 1,
1.377082, 0.09697467, 1.949823, 1, 0, 0.454902, 1,
1.389362, -1.352959, 4.102224, 1, 0, 0.4509804, 1,
1.403747, -0.9137081, 2.437968, 1, 0, 0.4431373, 1,
1.406251, 0.7494346, 0.3432907, 1, 0, 0.4392157, 1,
1.420037, 1.264405, -0.9393467, 1, 0, 0.4313726, 1,
1.420632, -0.08245753, 2.749422, 1, 0, 0.427451, 1,
1.427804, -0.6886463, 3.770291, 1, 0, 0.4196078, 1,
1.43973, 1.461227, 2.569884, 1, 0, 0.4156863, 1,
1.440114, 0.438473, 0.3563733, 1, 0, 0.4078431, 1,
1.444889, 1.287389, -0.8189226, 1, 0, 0.4039216, 1,
1.445216, 1.501348, 0.6364334, 1, 0, 0.3960784, 1,
1.460236, 1.975272, -0.05396515, 1, 0, 0.3882353, 1,
1.473439, -0.2235088, 1.151294, 1, 0, 0.3843137, 1,
1.473658, -0.09826794, 1.881604, 1, 0, 0.3764706, 1,
1.489842, 0.2011531, 0.8938354, 1, 0, 0.372549, 1,
1.49022, -0.03136396, 0.09479199, 1, 0, 0.3647059, 1,
1.495896, 0.4285865, -0.5080366, 1, 0, 0.3607843, 1,
1.502436, -0.5958766, 1.65496, 1, 0, 0.3529412, 1,
1.506065, -0.01278456, 0.04044162, 1, 0, 0.3490196, 1,
1.510946, -2.064386, 2.274525, 1, 0, 0.3411765, 1,
1.531651, -0.2668342, 1.220911, 1, 0, 0.3372549, 1,
1.533467, -1.711469, 4.011542, 1, 0, 0.3294118, 1,
1.544926, -0.6413285, -0.09213404, 1, 0, 0.3254902, 1,
1.558001, 2.15196, 2.384714, 1, 0, 0.3176471, 1,
1.5602, -1.028537, 1.044471, 1, 0, 0.3137255, 1,
1.560553, -0.5075012, 0.902981, 1, 0, 0.3058824, 1,
1.562669, 1.496557, 0.6132933, 1, 0, 0.2980392, 1,
1.567107, 0.09899361, 2.231764, 1, 0, 0.2941177, 1,
1.569007, 1.47526, 2.735282, 1, 0, 0.2862745, 1,
1.572695, -0.2317872, 0.3429523, 1, 0, 0.282353, 1,
1.58525, 0.5199818, -0.063228, 1, 0, 0.2745098, 1,
1.604723, 0.1347334, 1.422556, 1, 0, 0.2705882, 1,
1.6165, -1.509258, 2.67634, 1, 0, 0.2627451, 1,
1.61938, 0.09996942, 2.153712, 1, 0, 0.2588235, 1,
1.653466, 1.122131, 1.772681, 1, 0, 0.2509804, 1,
1.65863, -0.1065034, 3.158527, 1, 0, 0.2470588, 1,
1.665628, 0.6157735, 0.8016434, 1, 0, 0.2392157, 1,
1.682558, -0.227646, 2.724743, 1, 0, 0.2352941, 1,
1.685075, 1.943644, 3.295202, 1, 0, 0.227451, 1,
1.695961, 1.085579, -0.8866708, 1, 0, 0.2235294, 1,
1.731497, 1.330604, 1.780261, 1, 0, 0.2156863, 1,
1.734548, -0.2091217, 2.021827, 1, 0, 0.2117647, 1,
1.737006, 1.663347, 1.947454, 1, 0, 0.2039216, 1,
1.742072, 0.03902107, 0.9969295, 1, 0, 0.1960784, 1,
1.757218, -1.021463, 0.4259134, 1, 0, 0.1921569, 1,
1.759452, 0.5648637, 1.057092, 1, 0, 0.1843137, 1,
1.769708, -0.3434852, 2.524211, 1, 0, 0.1803922, 1,
1.772271, -0.9449742, 1.335983, 1, 0, 0.172549, 1,
1.787764, -0.06164882, 2.236048, 1, 0, 0.1686275, 1,
1.801837, 0.4815906, 0.5661566, 1, 0, 0.1607843, 1,
1.817427, 0.0342375, 1.799677, 1, 0, 0.1568628, 1,
1.827694, -0.1412976, 1.947383, 1, 0, 0.1490196, 1,
1.848653, -1.919791, 2.960105, 1, 0, 0.145098, 1,
1.852999, 1.542077, 0.1488712, 1, 0, 0.1372549, 1,
1.868451, -1.274094, 2.356189, 1, 0, 0.1333333, 1,
1.93888, 3.091249, -0.7959019, 1, 0, 0.1254902, 1,
1.98076, -0.3528983, 1.26791, 1, 0, 0.1215686, 1,
1.995858, -0.9482369, 1.611636, 1, 0, 0.1137255, 1,
2.012098, -1.507106, 1.46066, 1, 0, 0.1098039, 1,
2.035596, 0.2504704, 1.857002, 1, 0, 0.1019608, 1,
2.093883, 0.3392263, 0.9335397, 1, 0, 0.09411765, 1,
2.12501, 0.4135721, 0.6103723, 1, 0, 0.09019608, 1,
2.128875, 1.229734, -0.01278284, 1, 0, 0.08235294, 1,
2.193501, 0.1662871, -0.3187142, 1, 0, 0.07843138, 1,
2.198752, 0.2161266, 2.069335, 1, 0, 0.07058824, 1,
2.210366, -1.626117, 2.613989, 1, 0, 0.06666667, 1,
2.212881, -0.1793254, 1.770579, 1, 0, 0.05882353, 1,
2.233985, -1.669103, 1.314927, 1, 0, 0.05490196, 1,
2.292633, 0.6111569, 0.9978456, 1, 0, 0.04705882, 1,
2.308737, -2.376998, 1.481007, 1, 0, 0.04313726, 1,
2.351961, 0.2261154, 1.280545, 1, 0, 0.03529412, 1,
2.433927, 1.980218, 0.1291061, 1, 0, 0.03137255, 1,
2.566514, -0.02929588, 2.724666, 1, 0, 0.02352941, 1,
2.88936, 0.7551867, 0.5985302, 1, 0, 0.01960784, 1,
3.140813, -0.3888339, 0.5770946, 1, 0, 0.01176471, 1,
3.149826, 0.09396189, 4.826955, 1, 0, 0.007843138, 1
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
0.05840456, -4.416415, -8.473195, 0, -0.5, 0.5, 0.5,
0.05840456, -4.416415, -8.473195, 1, -0.5, 0.5, 0.5,
0.05840456, -4.416415, -8.473195, 1, 1.5, 0.5, 0.5,
0.05840456, -4.416415, -8.473195, 0, 1.5, 0.5, 0.5
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
-4.081008, 0.3921556, -8.473195, 0, -0.5, 0.5, 0.5,
-4.081008, 0.3921556, -8.473195, 1, -0.5, 0.5, 0.5,
-4.081008, 0.3921556, -8.473195, 1, 1.5, 0.5, 0.5,
-4.081008, 0.3921556, -8.473195, 0, 1.5, 0.5, 0.5
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
-4.081008, -4.416415, -0.5366952, 0, -0.5, 0.5, 0.5,
-4.081008, -4.416415, -0.5366952, 1, -0.5, 0.5, 0.5,
-4.081008, -4.416415, -0.5366952, 1, 1.5, 0.5, 0.5,
-4.081008, -4.416415, -0.5366952, 0, 1.5, 0.5, 0.5
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
-3, -3.306745, -6.641695,
3, -3.306745, -6.641695,
-3, -3.306745, -6.641695,
-3, -3.49169, -6.946945,
-2, -3.306745, -6.641695,
-2, -3.49169, -6.946945,
-1, -3.306745, -6.641695,
-1, -3.49169, -6.946945,
0, -3.306745, -6.641695,
0, -3.49169, -6.946945,
1, -3.306745, -6.641695,
1, -3.49169, -6.946945,
2, -3.306745, -6.641695,
2, -3.49169, -6.946945,
3, -3.306745, -6.641695,
3, -3.49169, -6.946945
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
-3, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
-3, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
-3, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
-3, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
-2, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
-2, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
-2, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
-2, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
-1, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
-1, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
-1, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
-1, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
0, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
0, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
0, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
0, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
1, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
1, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
1, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
1, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
2, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
2, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
2, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
2, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5,
3, -3.86158, -7.557445, 0, -0.5, 0.5, 0.5,
3, -3.86158, -7.557445, 1, -0.5, 0.5, 0.5,
3, -3.86158, -7.557445, 1, 1.5, 0.5, 0.5,
3, -3.86158, -7.557445, 0, 1.5, 0.5, 0.5
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
-3.125759, -2, -6.641695,
-3.125759, 2, -6.641695,
-3.125759, -2, -6.641695,
-3.284967, -2, -6.946945,
-3.125759, 0, -6.641695,
-3.284967, 0, -6.946945,
-3.125759, 2, -6.641695,
-3.284967, 2, -6.946945
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
-3.603384, -2, -7.557445, 0, -0.5, 0.5, 0.5,
-3.603384, -2, -7.557445, 1, -0.5, 0.5, 0.5,
-3.603384, -2, -7.557445, 1, 1.5, 0.5, 0.5,
-3.603384, -2, -7.557445, 0, 1.5, 0.5, 0.5,
-3.603384, 0, -7.557445, 0, -0.5, 0.5, 0.5,
-3.603384, 0, -7.557445, 1, -0.5, 0.5, 0.5,
-3.603384, 0, -7.557445, 1, 1.5, 0.5, 0.5,
-3.603384, 0, -7.557445, 0, 1.5, 0.5, 0.5,
-3.603384, 2, -7.557445, 0, -0.5, 0.5, 0.5,
-3.603384, 2, -7.557445, 1, -0.5, 0.5, 0.5,
-3.603384, 2, -7.557445, 1, 1.5, 0.5, 0.5,
-3.603384, 2, -7.557445, 0, 1.5, 0.5, 0.5
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
-3.125759, -3.306745, -6,
-3.125759, -3.306745, 4,
-3.125759, -3.306745, -6,
-3.284967, -3.49169, -6,
-3.125759, -3.306745, -4,
-3.284967, -3.49169, -4,
-3.125759, -3.306745, -2,
-3.284967, -3.49169, -2,
-3.125759, -3.306745, 0,
-3.284967, -3.49169, 0,
-3.125759, -3.306745, 2,
-3.284967, -3.49169, 2,
-3.125759, -3.306745, 4,
-3.284967, -3.49169, 4
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
-3.603384, -3.86158, -6, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -6, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -6, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, -6, 0, 1.5, 0.5, 0.5,
-3.603384, -3.86158, -4, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -4, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -4, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, -4, 0, 1.5, 0.5, 0.5,
-3.603384, -3.86158, -2, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -2, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, -2, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, -2, 0, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 0, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 0, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 0, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 0, 0, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 2, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 2, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 2, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 2, 0, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 4, 0, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 4, 1, -0.5, 0.5, 0.5,
-3.603384, -3.86158, 4, 1, 1.5, 0.5, 0.5,
-3.603384, -3.86158, 4, 0, 1.5, 0.5, 0.5
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
-3.125759, -3.306745, -6.641695,
-3.125759, 4.091056, -6.641695,
-3.125759, -3.306745, 5.568305,
-3.125759, 4.091056, 5.568305,
-3.125759, -3.306745, -6.641695,
-3.125759, -3.306745, 5.568305,
-3.125759, 4.091056, -6.641695,
-3.125759, 4.091056, 5.568305,
-3.125759, -3.306745, -6.641695,
3.242568, -3.306745, -6.641695,
-3.125759, -3.306745, 5.568305,
3.242568, -3.306745, 5.568305,
-3.125759, 4.091056, -6.641695,
3.242568, 4.091056, -6.641695,
-3.125759, 4.091056, 5.568305,
3.242568, 4.091056, 5.568305,
3.242568, -3.306745, -6.641695,
3.242568, 4.091056, -6.641695,
3.242568, -3.306745, 5.568305,
3.242568, 4.091056, 5.568305,
3.242568, -3.306745, -6.641695,
3.242568, -3.306745, 5.568305,
3.242568, 4.091056, -6.641695,
3.242568, 4.091056, 5.568305
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
var radius = 8.347317;
var distance = 37.13815;
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
mvMatrix.translate( -0.05840456, -0.3921556, 0.5366952 );
mvMatrix.scale( 1.417214, 1.219995, 0.7391714 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.13815);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Chlorpyrifos<-read.table("Chlorpyrifos.xyz", skip=1)
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
-3.033017, -0.492528, -2.452503, 0, 0, 1, 1, 1,
-2.94859, 0.1912812, -3.147667, 1, 0, 0, 1, 1,
-2.917251, -0.9395186, -1.688929, 1, 0, 0, 1, 1,
-2.767736, 1.356642, -1.808633, 1, 0, 0, 1, 1,
-2.618538, 0.656022, -1.196149, 1, 0, 0, 1, 1,
-2.600999, -0.8807673, -1.178149, 1, 0, 0, 1, 1,
-2.567813, -0.8583717, -2.139793, 0, 0, 0, 1, 1,
-2.55767, -0.6306456, -2.314698, 0, 0, 0, 1, 1,
-2.506424, -0.5005924, -1.776825, 0, 0, 0, 1, 1,
-2.493289, -1.009971, -0.04523063, 0, 0, 0, 1, 1,
-2.467703, 0.8975235, -1.87993, 0, 0, 0, 1, 1,
-2.456971, -0.8179836, -0.9604876, 0, 0, 0, 1, 1,
-2.413251, 1.459514, -0.0821422, 0, 0, 0, 1, 1,
-2.371926, -1.777495, -3.246226, 1, 1, 1, 1, 1,
-2.357508, -0.4370594, -3.335059, 1, 1, 1, 1, 1,
-2.33644, 1.182522, -1.325774, 1, 1, 1, 1, 1,
-2.300443, -0.1068246, -1.910069, 1, 1, 1, 1, 1,
-2.286515, -0.7695559, -2.476609, 1, 1, 1, 1, 1,
-2.281176, -0.3557808, -1.677207, 1, 1, 1, 1, 1,
-2.265823, 1.826261, -1.416305, 1, 1, 1, 1, 1,
-2.262849, -0.5956525, -1.317429, 1, 1, 1, 1, 1,
-2.255327, 0.3428257, -1.860422, 1, 1, 1, 1, 1,
-2.227293, -1.944142, -2.143094, 1, 1, 1, 1, 1,
-2.211887, 1.00667, -0.4942729, 1, 1, 1, 1, 1,
-2.185944, 0.2047851, -1.711027, 1, 1, 1, 1, 1,
-2.151246, 1.554759, -1.574125, 1, 1, 1, 1, 1,
-2.148144, 0.2878627, -1.456358, 1, 1, 1, 1, 1,
-2.133026, -0.6263986, -2.094405, 1, 1, 1, 1, 1,
-2.114714, -3.19901, -2.323071, 0, 0, 1, 1, 1,
-2.11235, -0.2621076, -2.451083, 1, 0, 0, 1, 1,
-2.111289, -0.2555571, -1.612764, 1, 0, 0, 1, 1,
-2.102924, -0.68335, -1.147097, 1, 0, 0, 1, 1,
-2.055504, 0.4804296, -1.915506, 1, 0, 0, 1, 1,
-2.030482, -0.1716852, -0.4544195, 1, 0, 0, 1, 1,
-2.003491, -0.6859985, -2.526165, 0, 0, 0, 1, 1,
-2.000616, -1.333608, -2.47819, 0, 0, 0, 1, 1,
-1.992563, 1.122283, -1.090996, 0, 0, 0, 1, 1,
-1.982362, 0.03254664, -1.62505, 0, 0, 0, 1, 1,
-1.963218, -1.475544, -4.107657, 0, 0, 0, 1, 1,
-1.956836, -0.901921, -1.454279, 0, 0, 0, 1, 1,
-1.894158, 0.07889839, -1.409065, 0, 0, 0, 1, 1,
-1.884303, 0.4883496, -0.9629049, 1, 1, 1, 1, 1,
-1.875785, 0.6604502, -0.3818864, 1, 1, 1, 1, 1,
-1.862094, -0.1814239, -4.38371, 1, 1, 1, 1, 1,
-1.860628, -0.7049454, -2.796701, 1, 1, 1, 1, 1,
-1.828422, -0.7131253, -1.811211, 1, 1, 1, 1, 1,
-1.8258, -0.4760262, -1.017569, 1, 1, 1, 1, 1,
-1.819907, -1.120082, -2.260721, 1, 1, 1, 1, 1,
-1.818753, -0.5112315, -4.272875, 1, 1, 1, 1, 1,
-1.808996, -0.3842232, -3.111444, 1, 1, 1, 1, 1,
-1.807189, 0.5043276, -0.86529, 1, 1, 1, 1, 1,
-1.806072, 0.5707731, -0.7453619, 1, 1, 1, 1, 1,
-1.795204, -0.5898374, -1.520697, 1, 1, 1, 1, 1,
-1.794626, 0.1101733, -2.880993, 1, 1, 1, 1, 1,
-1.791226, 0.4059443, -2.09394, 1, 1, 1, 1, 1,
-1.78812, 0.1120928, -1.290197, 1, 1, 1, 1, 1,
-1.785888, -0.9350634, -0.8060457, 0, 0, 1, 1, 1,
-1.769246, -0.9328698, -3.562801, 1, 0, 0, 1, 1,
-1.741395, -0.2203452, -1.233032, 1, 0, 0, 1, 1,
-1.738529, 1.014212, -2.021375, 1, 0, 0, 1, 1,
-1.734943, -0.2799617, -3.221678, 1, 0, 0, 1, 1,
-1.729141, 0.4286595, -1.496481, 1, 0, 0, 1, 1,
-1.726456, -0.5280784, -0.6409792, 0, 0, 0, 1, 1,
-1.687866, -1.570765, -1.619337, 0, 0, 0, 1, 1,
-1.61739, 0.9419082, -0.8537352, 0, 0, 0, 1, 1,
-1.615128, 0.1622655, -0.6852641, 0, 0, 0, 1, 1,
-1.607326, -0.07110057, -0.6119825, 0, 0, 0, 1, 1,
-1.597268, 0.81941, -1.773601, 0, 0, 0, 1, 1,
-1.591371, -0.8787687, -2.273842, 0, 0, 0, 1, 1,
-1.558484, -1.645439, -0.971289, 1, 1, 1, 1, 1,
-1.547722, 0.410081, -3.114338, 1, 1, 1, 1, 1,
-1.543148, -0.4708343, -0.899429, 1, 1, 1, 1, 1,
-1.536198, -0.6127858, -3.085426, 1, 1, 1, 1, 1,
-1.515308, 0.2834642, -1.251565, 1, 1, 1, 1, 1,
-1.504498, 0.05506813, -1.342455, 1, 1, 1, 1, 1,
-1.498392, -0.5408072, -2.848803, 1, 1, 1, 1, 1,
-1.496454, 0.9739795, -1.870239, 1, 1, 1, 1, 1,
-1.490196, 0.9830484, -1.401988, 1, 1, 1, 1, 1,
-1.483173, -0.4069743, -1.886159, 1, 1, 1, 1, 1,
-1.482837, -0.9558979, -0.8678565, 1, 1, 1, 1, 1,
-1.461573, 0.2921646, -1.308235, 1, 1, 1, 1, 1,
-1.459223, -0.1838068, -1.440089, 1, 1, 1, 1, 1,
-1.446206, 0.1144041, -0.9697816, 1, 1, 1, 1, 1,
-1.446053, 0.1278787, -0.3945024, 1, 1, 1, 1, 1,
-1.443062, 0.8471202, -1.439258, 0, 0, 1, 1, 1,
-1.431146, -1.005372, -2.048439, 1, 0, 0, 1, 1,
-1.424829, -0.4925343, -2.593136, 1, 0, 0, 1, 1,
-1.418105, -0.7438777, -2.376873, 1, 0, 0, 1, 1,
-1.41612, 0.8349072, 0.1431416, 1, 0, 0, 1, 1,
-1.401058, 0.686694, -1.391135, 1, 0, 0, 1, 1,
-1.399542, 1.454063, -0.9138023, 0, 0, 0, 1, 1,
-1.392242, -0.1424218, -0.494305, 0, 0, 0, 1, 1,
-1.385593, 1.03014, -1.042773, 0, 0, 0, 1, 1,
-1.369662, 1.452371, -0.5766572, 0, 0, 0, 1, 1,
-1.368316, 0.728446, -0.997194, 0, 0, 0, 1, 1,
-1.361923, -1.273943, -1.429859, 0, 0, 0, 1, 1,
-1.361561, -1.252322, -1.579161, 0, 0, 0, 1, 1,
-1.349944, 1.601857, 0.6032149, 1, 1, 1, 1, 1,
-1.340662, -2.095006, -2.001772, 1, 1, 1, 1, 1,
-1.336461, 0.8865614, 0.1212754, 1, 1, 1, 1, 1,
-1.334302, 0.4858695, -1.147937, 1, 1, 1, 1, 1,
-1.329638, -0.3786623, -2.47084, 1, 1, 1, 1, 1,
-1.326762, -1.896269, -1.798605, 1, 1, 1, 1, 1,
-1.326218, -0.8517334, -1.365091, 1, 1, 1, 1, 1,
-1.324626, 0.618305, -1.10732, 1, 1, 1, 1, 1,
-1.321295, -0.1379995, -1.711924, 1, 1, 1, 1, 1,
-1.317121, -0.8910659, -0.2065399, 1, 1, 1, 1, 1,
-1.30795, -2.376181, -3.211267, 1, 1, 1, 1, 1,
-1.304444, 0.08016684, -1.290774, 1, 1, 1, 1, 1,
-1.303078, -2.487369, -2.958324, 1, 1, 1, 1, 1,
-1.287484, -0.4945249, -3.437479, 1, 1, 1, 1, 1,
-1.272319, 1.652161, -0.5263405, 1, 1, 1, 1, 1,
-1.272281, 0.2044678, -0.3984326, 0, 0, 1, 1, 1,
-1.266952, -0.4712196, -1.458884, 1, 0, 0, 1, 1,
-1.258977, 0.3543325, -1.028018, 1, 0, 0, 1, 1,
-1.248652, 0.5367906, -0.7981715, 1, 0, 0, 1, 1,
-1.247692, -0.672631, -2.354141, 1, 0, 0, 1, 1,
-1.246477, 0.387521, -2.778421, 1, 0, 0, 1, 1,
-1.24358, -1.086728, -1.26158, 0, 0, 0, 1, 1,
-1.240584, -1.145165, -3.611767, 0, 0, 0, 1, 1,
-1.232569, 0.8566135, -0.7292572, 0, 0, 0, 1, 1,
-1.229411, -0.7938145, -4.762693, 0, 0, 0, 1, 1,
-1.221315, -0.4317116, -1.657287, 0, 0, 0, 1, 1,
-1.220732, 0.1340561, -0.7082754, 0, 0, 0, 1, 1,
-1.213089, 0.002813804, -1.158144, 0, 0, 0, 1, 1,
-1.210349, 0.01878497, -3.138458, 1, 1, 1, 1, 1,
-1.181597, -0.5430707, -2.829293, 1, 1, 1, 1, 1,
-1.145341, -0.2925861, -0.8752578, 1, 1, 1, 1, 1,
-1.13872, 0.8912064, -0.1250354, 1, 1, 1, 1, 1,
-1.131927, -2.230416, -2.115442, 1, 1, 1, 1, 1,
-1.130675, -0.3642571, -2.160697, 1, 1, 1, 1, 1,
-1.123505, -0.5004545, -3.103235, 1, 1, 1, 1, 1,
-1.122436, 1.011159, -0.7107976, 1, 1, 1, 1, 1,
-1.121543, -0.3278026, -2.405884, 1, 1, 1, 1, 1,
-1.120718, -0.0978398, -2.554716, 1, 1, 1, 1, 1,
-1.117912, 1.143417, -1.87256, 1, 1, 1, 1, 1,
-1.11703, 1.83593, -0.7916902, 1, 1, 1, 1, 1,
-1.116598, 0.3610751, -0.7027057, 1, 1, 1, 1, 1,
-1.114129, 0.2900762, -1.306613, 1, 1, 1, 1, 1,
-1.113222, 0.7498195, -1.948266, 1, 1, 1, 1, 1,
-1.106853, 0.2582011, -2.303633, 0, 0, 1, 1, 1,
-1.1041, -0.06353936, -2.922576, 1, 0, 0, 1, 1,
-1.102306, -0.8743578, -3.71052, 1, 0, 0, 1, 1,
-1.093786, 0.9147266, -1.461476, 1, 0, 0, 1, 1,
-1.093648, 0.1689896, -1.462069, 1, 0, 0, 1, 1,
-1.086928, -0.6629293, -2.429657, 1, 0, 0, 1, 1,
-1.083649, 1.517019, -1.589575, 0, 0, 0, 1, 1,
-1.080109, 1.179644, -0.9793486, 0, 0, 0, 1, 1,
-1.070762, -0.1438646, -1.615419, 0, 0, 0, 1, 1,
-1.070075, -0.8073761, -2.373827, 0, 0, 0, 1, 1,
-1.066764, -1.250884, -3.622693, 0, 0, 0, 1, 1,
-1.066316, 0.5273781, -0.9566165, 0, 0, 0, 1, 1,
-1.060674, -0.1394659, -3.153277, 0, 0, 0, 1, 1,
-1.0424, 0.462874, -0.8546668, 1, 1, 1, 1, 1,
-1.04136, -1.040268, -2.641199, 1, 1, 1, 1, 1,
-1.034583, 0.1578227, -1.919903, 1, 1, 1, 1, 1,
-1.032094, -0.4059566, -2.629796, 1, 1, 1, 1, 1,
-1.029806, 0.2543561, -0.5631514, 1, 1, 1, 1, 1,
-1.029594, -0.9032114, -2.570917, 1, 1, 1, 1, 1,
-1.028944, -0.8132428, -0.3738351, 1, 1, 1, 1, 1,
-1.021229, -1.157814, -2.318749, 1, 1, 1, 1, 1,
-1.012365, -1.474394, -3.841868, 1, 1, 1, 1, 1,
-1.010891, -1.80033, -3.676015, 1, 1, 1, 1, 1,
-1.007864, 2.130975, -0.9995072, 1, 1, 1, 1, 1,
-1.000389, -0.4878528, -1.563155, 1, 1, 1, 1, 1,
-1.000125, -0.8156312, -3.681073, 1, 1, 1, 1, 1,
-0.9970718, -1.6339, -2.893147, 1, 1, 1, 1, 1,
-0.9855293, 0.3705127, -2.23332, 1, 1, 1, 1, 1,
-0.9836687, -0.4751743, -1.904392, 0, 0, 1, 1, 1,
-0.9821122, -0.09034245, -3.532274, 1, 0, 0, 1, 1,
-0.9697744, 0.1000584, -2.668841, 1, 0, 0, 1, 1,
-0.9583207, -1.322802, -3.684994, 1, 0, 0, 1, 1,
-0.9486377, 1.760989, 0.9918321, 1, 0, 0, 1, 1,
-0.9463044, -1.332855, -5.481777, 1, 0, 0, 1, 1,
-0.9440981, 0.07841443, -2.452579, 0, 0, 0, 1, 1,
-0.9433861, 0.8008626, 0.6884935, 0, 0, 0, 1, 1,
-0.9406622, -0.5840092, -3.29132, 0, 0, 0, 1, 1,
-0.9374024, 0.2112649, -1.738226, 0, 0, 0, 1, 1,
-0.9336566, -0.9107369, -1.865137, 0, 0, 0, 1, 1,
-0.9304447, -0.1117968, -0.8640271, 0, 0, 0, 1, 1,
-0.9281461, 0.3234442, -0.994138, 0, 0, 0, 1, 1,
-0.9254567, -0.7023443, -1.54454, 1, 1, 1, 1, 1,
-0.9250693, -0.2834194, -4.243101, 1, 1, 1, 1, 1,
-0.9231212, -0.9149912, -4.859631, 1, 1, 1, 1, 1,
-0.9223021, 0.2109004, -0.08074559, 1, 1, 1, 1, 1,
-0.9201387, -0.5510336, -2.602782, 1, 1, 1, 1, 1,
-0.9182864, -1.534825, -3.920951, 1, 1, 1, 1, 1,
-0.918248, -0.6335923, -1.330436, 1, 1, 1, 1, 1,
-0.9093033, -0.4568778, -0.2580452, 1, 1, 1, 1, 1,
-0.9090647, -1.355503, -3.763225, 1, 1, 1, 1, 1,
-0.9080481, 0.251787, -0.9215262, 1, 1, 1, 1, 1,
-0.9074166, -1.372357, -4.818876, 1, 1, 1, 1, 1,
-0.905398, 0.4030065, -0.7489917, 1, 1, 1, 1, 1,
-0.904309, 1.634031, -1.128248, 1, 1, 1, 1, 1,
-0.9024748, 0.099689, -2.363509, 1, 1, 1, 1, 1,
-0.8948614, 0.6695632, -0.002159446, 1, 1, 1, 1, 1,
-0.880901, 1.900359, -1.027948, 0, 0, 1, 1, 1,
-0.8800196, 1.728921, -1.186613, 1, 0, 0, 1, 1,
-0.8785136, -1.151578, -3.550174, 1, 0, 0, 1, 1,
-0.8731744, -0.4344964, 1.685383, 1, 0, 0, 1, 1,
-0.8715962, 1.359946, -2.923632, 1, 0, 0, 1, 1,
-0.8677073, 0.4102524, 0.856212, 1, 0, 0, 1, 1,
-0.867127, 0.4774582, -0.3517181, 0, 0, 0, 1, 1,
-0.8658066, -0.2062221, -1.773455, 0, 0, 0, 1, 1,
-0.8615487, -0.1101916, -1.080973, 0, 0, 0, 1, 1,
-0.8513284, 0.359324, -1.792161, 0, 0, 0, 1, 1,
-0.8442619, 1.187057, -1.783377, 0, 0, 0, 1, 1,
-0.8413668, -1.598408, -2.183049, 0, 0, 0, 1, 1,
-0.834355, -1.014472, -2.452504, 0, 0, 0, 1, 1,
-0.8337402, 0.3341486, -1.272334, 1, 1, 1, 1, 1,
-0.8331035, 2.257986, 2.078433, 1, 1, 1, 1, 1,
-0.8300664, -1.211381, -2.521876, 1, 1, 1, 1, 1,
-0.8286703, 0.6742857, -2.536764, 1, 1, 1, 1, 1,
-0.8231619, -0.6717142, -2.482925, 1, 1, 1, 1, 1,
-0.8210741, -1.514258, -2.918862, 1, 1, 1, 1, 1,
-0.8191569, 2.056293, -1.670309, 1, 1, 1, 1, 1,
-0.8173867, -0.5405024, -2.509808, 1, 1, 1, 1, 1,
-0.8170469, -0.7100191, -2.218305, 1, 1, 1, 1, 1,
-0.8167342, -0.2540783, -1.284301, 1, 1, 1, 1, 1,
-0.8147133, 0.3959089, -1.188318, 1, 1, 1, 1, 1,
-0.8112972, 1.346118, 0.8599219, 1, 1, 1, 1, 1,
-0.8102514, 0.5690749, -1.024182, 1, 1, 1, 1, 1,
-0.805364, 1.090616, -1.679305, 1, 1, 1, 1, 1,
-0.8011765, 1.099071, 0.0790126, 1, 1, 1, 1, 1,
-0.7997677, -0.4477564, -1.81054, 0, 0, 1, 1, 1,
-0.7965515, -1.407977, -1.611103, 1, 0, 0, 1, 1,
-0.7956153, -0.3444881, -3.376436, 1, 0, 0, 1, 1,
-0.7928931, 0.5305556, -0.7864065, 1, 0, 0, 1, 1,
-0.7927176, -0.3674421, -1.360589, 1, 0, 0, 1, 1,
-0.7913225, 0.8890033, -0.5986779, 1, 0, 0, 1, 1,
-0.7821085, 1.818971, 1.239388, 0, 0, 0, 1, 1,
-0.7733287, -0.3703232, -1.369276, 0, 0, 0, 1, 1,
-0.7709748, -0.9820004, -5.099307, 0, 0, 0, 1, 1,
-0.7691677, 0.5030409, -0.810387, 0, 0, 0, 1, 1,
-0.7688944, 0.0983398, -0.9002312, 0, 0, 0, 1, 1,
-0.7642098, -1.248723, -3.078334, 0, 0, 0, 1, 1,
-0.7560134, -0.2115226, -2.104366, 0, 0, 0, 1, 1,
-0.7489843, 0.02302918, -3.253673, 1, 1, 1, 1, 1,
-0.7476281, -1.463633, -2.918503, 1, 1, 1, 1, 1,
-0.7450522, -0.2413754, -2.053709, 1, 1, 1, 1, 1,
-0.7377011, -0.06101994, -0.7334048, 1, 1, 1, 1, 1,
-0.7368889, 0.7167811, -0.1178298, 1, 1, 1, 1, 1,
-0.7359421, -1.206346, -1.775853, 1, 1, 1, 1, 1,
-0.7318226, -1.005908, -2.988845, 1, 1, 1, 1, 1,
-0.7297449, 0.7798529, -2.647552, 1, 1, 1, 1, 1,
-0.7290533, -0.125332, -0.8024205, 1, 1, 1, 1, 1,
-0.7199532, -0.5805294, -1.542435, 1, 1, 1, 1, 1,
-0.7134163, -0.5794262, -1.82082, 1, 1, 1, 1, 1,
-0.7108429, 0.3256681, -0.3079355, 1, 1, 1, 1, 1,
-0.7073696, -0.3536184, -0.5448129, 1, 1, 1, 1, 1,
-0.702574, 0.7542581, -1.204155, 1, 1, 1, 1, 1,
-0.700515, -0.1464321, -0.7530758, 1, 1, 1, 1, 1,
-0.6997792, -1.335027, -6.46388, 0, 0, 1, 1, 1,
-0.6937749, -1.204964, -3.119228, 1, 0, 0, 1, 1,
-0.6929563, 2.651341, 0.7133394, 1, 0, 0, 1, 1,
-0.6924816, -1.342903, -3.8299, 1, 0, 0, 1, 1,
-0.6914338, -0.537854, -3.941947, 1, 0, 0, 1, 1,
-0.6845234, 0.4332108, -1.363531, 1, 0, 0, 1, 1,
-0.6805435, -0.4643003, -0.9860048, 0, 0, 0, 1, 1,
-0.6744102, -0.5718005, -2.297745, 0, 0, 0, 1, 1,
-0.6733382, 2.615412, -0.5801318, 0, 0, 0, 1, 1,
-0.6694367, -0.7318522, -2.531829, 0, 0, 0, 1, 1,
-0.6684057, -0.9278532, -4.638299, 0, 0, 0, 1, 1,
-0.6636966, 0.3204303, -1.157812, 0, 0, 0, 1, 1,
-0.6594635, -2.646007, -3.862435, 0, 0, 0, 1, 1,
-0.647734, 0.7361071, -1.040967, 1, 1, 1, 1, 1,
-0.6461513, -1.486478, -2.498178, 1, 1, 1, 1, 1,
-0.6440726, -0.6216548, -1.835803, 1, 1, 1, 1, 1,
-0.6429151, -1.062601, -2.946274, 1, 1, 1, 1, 1,
-0.6414515, 0.9092071, 0.6919392, 1, 1, 1, 1, 1,
-0.6397028, -1.174188, -2.393989, 1, 1, 1, 1, 1,
-0.6332312, -0.4821734, -3.035837, 1, 1, 1, 1, 1,
-0.6199799, -1.751815, -1.682576, 1, 1, 1, 1, 1,
-0.6164295, 0.3161826, 0.07642274, 1, 1, 1, 1, 1,
-0.6153691, 0.3587572, -1.863771, 1, 1, 1, 1, 1,
-0.6149166, -1.580879, -4.049596, 1, 1, 1, 1, 1,
-0.6089462, -1.82072, -1.495252, 1, 1, 1, 1, 1,
-0.6087863, -0.1884539, -2.067861, 1, 1, 1, 1, 1,
-0.5995892, -0.6077769, -3.08731, 1, 1, 1, 1, 1,
-0.5958499, -1.637601, -3.0308, 1, 1, 1, 1, 1,
-0.5946507, -0.4866659, -1.040462, 0, 0, 1, 1, 1,
-0.5902426, -0.3568384, -3.157538, 1, 0, 0, 1, 1,
-0.5899358, 0.5311937, 0.08311786, 1, 0, 0, 1, 1,
-0.5899202, 1.323426, -1.055989, 1, 0, 0, 1, 1,
-0.5897761, 0.603286, -0.9995187, 1, 0, 0, 1, 1,
-0.5883166, -0.9179105, -2.575348, 1, 0, 0, 1, 1,
-0.5847081, -0.6597099, -3.856737, 0, 0, 0, 1, 1,
-0.5769407, 1.524934, -0.5358669, 0, 0, 0, 1, 1,
-0.5769167, -1.623868, -3.10477, 0, 0, 0, 1, 1,
-0.5757203, -1.672358, -0.6924493, 0, 0, 0, 1, 1,
-0.5710706, -1.785549, -2.283517, 0, 0, 0, 1, 1,
-0.5701811, -0.3484654, -2.630296, 0, 0, 0, 1, 1,
-0.5692352, -1.782163, -2.381636, 0, 0, 0, 1, 1,
-0.568598, 1.146419, -2.734656, 1, 1, 1, 1, 1,
-0.5685661, 1.342772, -0.7617266, 1, 1, 1, 1, 1,
-0.5633087, -1.580743, -2.380726, 1, 1, 1, 1, 1,
-0.5595933, 1.879115, -0.6663898, 1, 1, 1, 1, 1,
-0.5570317, -1.589221, -2.781505, 1, 1, 1, 1, 1,
-0.5564305, -1.81146, -3.878291, 1, 1, 1, 1, 1,
-0.5558093, -0.5972015, -3.054265, 1, 1, 1, 1, 1,
-0.5541938, -0.6623505, -1.334847, 1, 1, 1, 1, 1,
-0.5537243, -0.5035547, -1.647403, 1, 1, 1, 1, 1,
-0.551425, 0.5572498, 0.473737, 1, 1, 1, 1, 1,
-0.5510391, 1.790762, -0.1367321, 1, 1, 1, 1, 1,
-0.5506796, 0.1914875, -1.569439, 1, 1, 1, 1, 1,
-0.545729, 1.806878, -2.714301, 1, 1, 1, 1, 1,
-0.5448996, 1.573694, 0.4993279, 1, 1, 1, 1, 1,
-0.5420683, 0.5644388, -1.336131, 1, 1, 1, 1, 1,
-0.5316873, 0.6248439, -0.9891276, 0, 0, 1, 1, 1,
-0.5313808, -0.1684887, -3.306533, 1, 0, 0, 1, 1,
-0.5291991, -0.3775547, -0.5517986, 1, 0, 0, 1, 1,
-0.5265321, 0.6519407, 0.6953805, 1, 0, 0, 1, 1,
-0.5255122, 2.496381, -0.6273395, 1, 0, 0, 1, 1,
-0.5221127, 1.414528, -0.9199128, 1, 0, 0, 1, 1,
-0.5217909, 1.169385, -0.2349519, 0, 0, 0, 1, 1,
-0.5201676, -0.2262023, -1.11242, 0, 0, 0, 1, 1,
-0.5195132, 0.4729078, -0.46725, 0, 0, 0, 1, 1,
-0.5187814, -1.391339, -1.302447, 0, 0, 0, 1, 1,
-0.5179002, 0.3602246, -1.680834, 0, 0, 0, 1, 1,
-0.517012, -2.374591, -2.414612, 0, 0, 0, 1, 1,
-0.5151356, 0.0700184, -0.4154178, 0, 0, 0, 1, 1,
-0.5142825, 0.9251785, -0.1931425, 1, 1, 1, 1, 1,
-0.5139338, -0.3017933, -1.557754, 1, 1, 1, 1, 1,
-0.5102837, 0.4529321, -1.691635, 1, 1, 1, 1, 1,
-0.5098788, -0.320207, -2.674957, 1, 1, 1, 1, 1,
-0.5095186, 0.3560029, -2.09101, 1, 1, 1, 1, 1,
-0.5094135, -0.222748, -2.498978, 1, 1, 1, 1, 1,
-0.5059468, 0.2220068, -1.954252, 1, 1, 1, 1, 1,
-0.5056486, -2.047343, 0.489789, 1, 1, 1, 1, 1,
-0.5052279, -0.6753268, -2.302176, 1, 1, 1, 1, 1,
-0.5023008, 3.376953, -2.036989, 1, 1, 1, 1, 1,
-0.5017606, -0.9911521, -1.797806, 1, 1, 1, 1, 1,
-0.5008016, 0.5297535, -2.780277, 1, 1, 1, 1, 1,
-0.4969767, -0.5084289, -2.159874, 1, 1, 1, 1, 1,
-0.4927574, 0.3390982, -1.196495, 1, 1, 1, 1, 1,
-0.4863747, -1.265708, -4.819012, 1, 1, 1, 1, 1,
-0.4857421, 0.9481692, 0.6862898, 0, 0, 1, 1, 1,
-0.4793058, -0.125894, -2.304902, 1, 0, 0, 1, 1,
-0.4768606, 0.8122451, -0.05329553, 1, 0, 0, 1, 1,
-0.4722346, 1.916567, 0.1696874, 1, 0, 0, 1, 1,
-0.4715122, -0.2791259, -1.653353, 1, 0, 0, 1, 1,
-0.469866, -0.3225444, -1.612212, 1, 0, 0, 1, 1,
-0.4697148, -1.160596, -0.7276912, 0, 0, 0, 1, 1,
-0.4679752, -0.6442257, -3.068274, 0, 0, 0, 1, 1,
-0.4656165, 0.02745246, -2.912241, 0, 0, 0, 1, 1,
-0.463137, 1.104459, -0.6213, 0, 0, 0, 1, 1,
-0.4622131, -0.556466, -2.498763, 0, 0, 0, 1, 1,
-0.4568088, 0.5231563, -2.060557, 0, 0, 0, 1, 1,
-0.4528462, -0.5795331, -2.668575, 0, 0, 0, 1, 1,
-0.4415379, -1.219059, -3.534452, 1, 1, 1, 1, 1,
-0.4276905, -0.08928005, -1.901832, 1, 1, 1, 1, 1,
-0.426468, -0.2856696, -2.198494, 1, 1, 1, 1, 1,
-0.4184803, -0.914367, -2.333333, 1, 1, 1, 1, 1,
-0.4179817, -1.553131, -3.956179, 1, 1, 1, 1, 1,
-0.417283, -1.162254, -1.32477, 1, 1, 1, 1, 1,
-0.4171446, -1.853653, -2.736568, 1, 1, 1, 1, 1,
-0.4160273, 1.695361, -0.3870905, 1, 1, 1, 1, 1,
-0.4159113, 0.8656499, -1.901191, 1, 1, 1, 1, 1,
-0.4149727, 0.1386985, -1.063706, 1, 1, 1, 1, 1,
-0.414197, 0.745181, -0.6401156, 1, 1, 1, 1, 1,
-0.4134155, -0.9603092, -2.166591, 1, 1, 1, 1, 1,
-0.407433, -0.2008039, -1.909852, 1, 1, 1, 1, 1,
-0.407221, 0.502789, -0.4251265, 1, 1, 1, 1, 1,
-0.4019451, -0.8155939, -3.542732, 1, 1, 1, 1, 1,
-0.4011391, -0.3075832, -2.208032, 0, 0, 1, 1, 1,
-0.3953168, -0.03428214, -0.9744937, 1, 0, 0, 1, 1,
-0.3917057, 0.9133363, -0.3309188, 1, 0, 0, 1, 1,
-0.3907151, 0.8525459, -1.592462, 1, 0, 0, 1, 1,
-0.3887108, 1.499665, -1.394192, 1, 0, 0, 1, 1,
-0.3884901, 1.181899, -0.6152914, 1, 0, 0, 1, 1,
-0.387516, 0.4363734, -0.6321338, 0, 0, 0, 1, 1,
-0.3869072, 0.7533963, 2.059325, 0, 0, 0, 1, 1,
-0.3830893, 0.09742494, -1.876579, 0, 0, 0, 1, 1,
-0.3829149, 0.7060063, 0.5660363, 0, 0, 0, 1, 1,
-0.3815165, 1.5074, 1.375229, 0, 0, 0, 1, 1,
-0.3774849, 0.4905187, -0.04537621, 0, 0, 0, 1, 1,
-0.3758019, -1.60669, -3.443892, 0, 0, 0, 1, 1,
-0.3749867, 1.184193, 1.221176, 1, 1, 1, 1, 1,
-0.3728516, 1.747769, -0.04736935, 1, 1, 1, 1, 1,
-0.3727891, 0.4897217, -0.1605515, 1, 1, 1, 1, 1,
-0.3694217, 0.3720632, -1.643347, 1, 1, 1, 1, 1,
-0.3680636, -0.6111842, -2.736435, 1, 1, 1, 1, 1,
-0.3674712, -0.4651268, -2.172735, 1, 1, 1, 1, 1,
-0.3654037, 0.1189908, -0.8185737, 1, 1, 1, 1, 1,
-0.3611356, -1.69885, -3.254163, 1, 1, 1, 1, 1,
-0.3560585, 0.1030039, -0.7046885, 1, 1, 1, 1, 1,
-0.3552535, 0.02184454, -0.7619491, 1, 1, 1, 1, 1,
-0.3503266, 0.9438782, -0.2801266, 1, 1, 1, 1, 1,
-0.3502121, 0.9785616, 0.6689338, 1, 1, 1, 1, 1,
-0.3500322, -0.3367575, -1.92976, 1, 1, 1, 1, 1,
-0.3471206, -0.363317, -2.710912, 1, 1, 1, 1, 1,
-0.3470013, -0.9685814, -1.869941, 1, 1, 1, 1, 1,
-0.3463041, 2.812992, -0.8263174, 0, 0, 1, 1, 1,
-0.3424646, -0.2180915, -2.48212, 1, 0, 0, 1, 1,
-0.3383606, -0.4152922, -0.5609686, 1, 0, 0, 1, 1,
-0.3342473, -0.5939338, -2.426404, 1, 0, 0, 1, 1,
-0.3278535, 1.227939, 0.5530681, 1, 0, 0, 1, 1,
-0.327699, 1.519344, -0.3904597, 1, 0, 0, 1, 1,
-0.3272314, -3.030192, -0.4041295, 0, 0, 0, 1, 1,
-0.3219067, 0.710503, 1.25464, 0, 0, 0, 1, 1,
-0.3212595, -0.3343587, -2.955473, 0, 0, 0, 1, 1,
-0.3160953, 0.1706544, -1.496067, 0, 0, 0, 1, 1,
-0.3157809, 2.51704, -1.631985, 0, 0, 0, 1, 1,
-0.312704, 0.328997, 1.833039, 0, 0, 0, 1, 1,
-0.310073, 2.713675, 1.540403, 0, 0, 0, 1, 1,
-0.3089668, -0.8614721, -3.049367, 1, 1, 1, 1, 1,
-0.3058339, 0.1443873, 0.291604, 1, 1, 1, 1, 1,
-0.3056833, 1.002481, -0.9527379, 1, 1, 1, 1, 1,
-0.3035916, 0.4749612, -1.38709, 1, 1, 1, 1, 1,
-0.3014245, -1.271421, -4.861553, 1, 1, 1, 1, 1,
-0.3011781, 1.763962, -2.271657, 1, 1, 1, 1, 1,
-0.3009526, 1.198789, -1.462737, 1, 1, 1, 1, 1,
-0.299956, -2.026036, -3.103432, 1, 1, 1, 1, 1,
-0.2931447, 0.1472378, -1.242623, 1, 1, 1, 1, 1,
-0.2920805, -0.3561023, -3.670415, 1, 1, 1, 1, 1,
-0.2903547, 0.3723316, -2.890336, 1, 1, 1, 1, 1,
-0.2884798, -0.2342824, -1.731926, 1, 1, 1, 1, 1,
-0.2883001, 0.3572954, 0.1178366, 1, 1, 1, 1, 1,
-0.2849527, 0.2859404, -1.582479, 1, 1, 1, 1, 1,
-0.2848707, -0.2190214, -1.712911, 1, 1, 1, 1, 1,
-0.2828274, 0.4332998, 0.7203972, 0, 0, 1, 1, 1,
-0.2818088, 1.090554, 0.2478432, 1, 0, 0, 1, 1,
-0.2808498, 0.3723009, -1.805599, 1, 0, 0, 1, 1,
-0.2795007, 0.01269044, -3.423521, 1, 0, 0, 1, 1,
-0.2789486, 1.03695, -1.818692, 1, 0, 0, 1, 1,
-0.2778375, -0.6095186, -2.349151, 1, 0, 0, 1, 1,
-0.2755305, 0.08060431, -3.338696, 0, 0, 0, 1, 1,
-0.2751757, -0.8766425, -5.558634, 0, 0, 0, 1, 1,
-0.2750258, -1.06003, -1.851717, 0, 0, 0, 1, 1,
-0.2745252, -0.7650197, -3.258799, 0, 0, 0, 1, 1,
-0.2698007, -1.69924, -2.685567, 0, 0, 0, 1, 1,
-0.2657726, -0.8305579, -3.8321, 0, 0, 0, 1, 1,
-0.264084, -1.128705, -4.317863, 0, 0, 0, 1, 1,
-0.262077, 1.127391, -0.4805876, 1, 1, 1, 1, 1,
-0.2582395, 0.8895521, 0.7784703, 1, 1, 1, 1, 1,
-0.2518568, -0.9985738, -2.127555, 1, 1, 1, 1, 1,
-0.2510593, 1.406197, -1.284531, 1, 1, 1, 1, 1,
-0.2463696, 0.4977652, -1.093015, 1, 1, 1, 1, 1,
-0.2451472, 1.237149, 1.236019, 1, 1, 1, 1, 1,
-0.2451111, -1.725669, -4.13395, 1, 1, 1, 1, 1,
-0.2448435, -1.407664, -2.867556, 1, 1, 1, 1, 1,
-0.2440082, -2.354739, -3.484113, 1, 1, 1, 1, 1,
-0.2434281, 0.7555937, 0.2511226, 1, 1, 1, 1, 1,
-0.2431179, 1.180207, -0.836001, 1, 1, 1, 1, 1,
-0.2393968, -0.2053997, -0.5008658, 1, 1, 1, 1, 1,
-0.2359683, 0.005391399, -0.8242896, 1, 1, 1, 1, 1,
-0.2353981, -0.1808992, -0.5582839, 1, 1, 1, 1, 1,
-0.2347744, 0.2746244, 1.184026, 1, 1, 1, 1, 1,
-0.2346684, -1.085994, -0.8725606, 0, 0, 1, 1, 1,
-0.2343262, -0.8904194, -4.011208, 1, 0, 0, 1, 1,
-0.2291599, 1.336455, -0.1666695, 1, 0, 0, 1, 1,
-0.2290655, 0.3760779, 0.7410262, 1, 0, 0, 1, 1,
-0.2268347, -1.786267, -2.581039, 1, 0, 0, 1, 1,
-0.2252405, -1.50125, -3.293783, 1, 0, 0, 1, 1,
-0.2246263, 0.870259, -0.0454377, 0, 0, 0, 1, 1,
-0.2245406, -0.4391061, -4.025951, 0, 0, 0, 1, 1,
-0.2172177, -0.663942, -1.37299, 0, 0, 0, 1, 1,
-0.207615, -1.198287, -1.403847, 0, 0, 0, 1, 1,
-0.2064323, -0.03210108, -1.4686, 0, 0, 0, 1, 1,
-0.1982767, 0.6967083, 0.4882548, 0, 0, 0, 1, 1,
-0.1954288, 0.8403943, 0.009999396, 0, 0, 0, 1, 1,
-0.1951819, -0.8971002, -2.796224, 1, 1, 1, 1, 1,
-0.1949239, -0.1153724, -2.891953, 1, 1, 1, 1, 1,
-0.1918858, -0.9520856, -3.586852, 1, 1, 1, 1, 1,
-0.1890326, -0.5395037, -1.74754, 1, 1, 1, 1, 1,
-0.1886785, 0.03488791, -1.88143, 1, 1, 1, 1, 1,
-0.1882609, 1.088976, 0.8310367, 1, 1, 1, 1, 1,
-0.1855416, 2.199601, 1.480171, 1, 1, 1, 1, 1,
-0.1837202, 2.11872, 0.6164046, 1, 1, 1, 1, 1,
-0.1793744, -0.5146193, -4.617472, 1, 1, 1, 1, 1,
-0.1737976, -0.4601153, -3.121386, 1, 1, 1, 1, 1,
-0.1735688, -0.2641963, -4.522546, 1, 1, 1, 1, 1,
-0.1699979, 0.1564323, -0.8925529, 1, 1, 1, 1, 1,
-0.1699305, 0.2536319, -1.096203, 1, 1, 1, 1, 1,
-0.1615814, 0.1423107, -0.3052191, 1, 1, 1, 1, 1,
-0.1575505, -0.1191908, -1.50318, 1, 1, 1, 1, 1,
-0.1567037, 1.366644, 0.2911848, 0, 0, 1, 1, 1,
-0.1557655, -1.13745, -1.747039, 1, 0, 0, 1, 1,
-0.1523495, -0.5534784, -2.811911, 1, 0, 0, 1, 1,
-0.151873, 0.1772584, -1.994685, 1, 0, 0, 1, 1,
-0.1457286, -0.04026945, -1.237508, 1, 0, 0, 1, 1,
-0.1411094, -1.227851, -2.221084, 1, 0, 0, 1, 1,
-0.140421, 0.4923068, -1.005999, 0, 0, 0, 1, 1,
-0.1396319, -0.09447335, -2.509415, 0, 0, 0, 1, 1,
-0.1367947, 2.377661, 0.05853855, 0, 0, 0, 1, 1,
-0.1337586, -1.517628, -4.10602, 0, 0, 0, 1, 1,
-0.1317081, -1.002935, -1.951777, 0, 0, 0, 1, 1,
-0.1298208, 1.165178, -1.651963, 0, 0, 0, 1, 1,
-0.1233943, 2.536955, 0.7607831, 0, 0, 0, 1, 1,
-0.1225945, 2.070917, 0.7638879, 1, 1, 1, 1, 1,
-0.1195922, -0.02880145, -1.102641, 1, 1, 1, 1, 1,
-0.1152735, 0.5532963, 1.382562, 1, 1, 1, 1, 1,
-0.1133891, -0.7751536, -4.303237, 1, 1, 1, 1, 1,
-0.1102611, -0.3127341, -3.461942, 1, 1, 1, 1, 1,
-0.1081228, -1.746576, -2.686039, 1, 1, 1, 1, 1,
-0.1073471, -1.434222, -5.997495, 1, 1, 1, 1, 1,
-0.1063145, -0.5170779, -3.408775, 1, 1, 1, 1, 1,
-0.1062503, -0.295544, -2.85166, 1, 1, 1, 1, 1,
-0.1047593, 0.6404782, -0.4675481, 1, 1, 1, 1, 1,
-0.1008304, -2.224329, -2.953875, 1, 1, 1, 1, 1,
-0.1003268, 1.625471, -1.272381, 1, 1, 1, 1, 1,
-0.09731873, -0.7525196, -1.189306, 1, 1, 1, 1, 1,
-0.09711229, -1.511072, -3.560157, 1, 1, 1, 1, 1,
-0.09621181, -0.9108019, -3.128082, 1, 1, 1, 1, 1,
-0.09574074, -0.8928083, -1.988828, 0, 0, 1, 1, 1,
-0.09289476, 0.266999, 0.3748629, 1, 0, 0, 1, 1,
-0.0926574, -1.75842, -3.3424, 1, 0, 0, 1, 1,
-0.08985421, -0.3897172, -2.105891, 1, 0, 0, 1, 1,
-0.08572083, -0.2153348, -1.295398, 1, 0, 0, 1, 1,
-0.08501892, 1.11107, 0.231535, 1, 0, 0, 1, 1,
-0.08255058, 1.008546, 1.030683, 0, 0, 0, 1, 1,
-0.08164803, 0.1360236, 1.094704, 0, 0, 0, 1, 1,
-0.06903938, -0.2596605, -3.569482, 0, 0, 0, 1, 1,
-0.06850565, -0.03929069, -0.4681325, 0, 0, 0, 1, 1,
-0.06678567, -0.9271852, -3.306641, 0, 0, 0, 1, 1,
-0.06395839, -0.3110216, -1.942859, 0, 0, 0, 1, 1,
-0.0612528, -0.3833589, -3.926744, 0, 0, 0, 1, 1,
-0.05798442, 0.5095494, -0.814034, 1, 1, 1, 1, 1,
-0.05655214, -0.7123349, -4.330421, 1, 1, 1, 1, 1,
-0.05464485, -0.4565001, -4.161018, 1, 1, 1, 1, 1,
-0.04963159, 0.6902413, -1.260243, 1, 1, 1, 1, 1,
-0.04937618, 0.177539, 0.91613, 1, 1, 1, 1, 1,
-0.04389713, -2.012044, -3.840606, 1, 1, 1, 1, 1,
-0.04378078, -0.3381355, -3.072765, 1, 1, 1, 1, 1,
-0.0361888, -1.435596, -1.701059, 1, 1, 1, 1, 1,
-0.03106108, 1.684807, 0.9926913, 1, 1, 1, 1, 1,
-0.03033678, 0.116273, 1.138384, 1, 1, 1, 1, 1,
-0.02797987, 0.3323241, -1.205937, 1, 1, 1, 1, 1,
-0.02575731, 0.2628605, -0.5967911, 1, 1, 1, 1, 1,
-0.02100976, -1.485193, -2.839302, 1, 1, 1, 1, 1,
-0.01775815, -0.9071304, -3.476201, 1, 1, 1, 1, 1,
-0.01767844, -1.218853, -3.024851, 1, 1, 1, 1, 1,
-0.0147233, -0.6755005, -2.619861, 0, 0, 1, 1, 1,
-0.01191377, 0.4166198, -0.7585105, 1, 0, 0, 1, 1,
-0.009709157, -0.3765568, -5.120972, 1, 0, 0, 1, 1,
-0.002369196, -1.659831, -2.340791, 1, 0, 0, 1, 1,
-0.002130901, -0.6173503, -3.100786, 1, 0, 0, 1, 1,
-0.001463224, 0.03496664, -1.674498, 1, 0, 0, 1, 1,
-0.001411667, 0.7374265, -0.7061166, 0, 0, 0, 1, 1,
0.0009863644, 1.19227, -0.05454154, 0, 0, 0, 1, 1,
0.001941517, -1.490432, 4.585449, 0, 0, 0, 1, 1,
0.008713502, 0.6734251, 0.4990318, 0, 0, 0, 1, 1,
0.01101132, 0.6335033, -0.5117145, 0, 0, 0, 1, 1,
0.01506119, 1.10795, -0.1334924, 0, 0, 0, 1, 1,
0.01833448, 1.060874, -1.384712, 0, 0, 0, 1, 1,
0.0217961, -1.64078, 3.067492, 1, 1, 1, 1, 1,
0.02819879, 1.407453, -1.596721, 1, 1, 1, 1, 1,
0.03196224, 0.2498646, -0.6516442, 1, 1, 1, 1, 1,
0.03402705, 0.5003923, 0.2767876, 1, 1, 1, 1, 1,
0.03530212, -0.4217977, 3.795242, 1, 1, 1, 1, 1,
0.03607637, -0.005162404, -0.1021678, 1, 1, 1, 1, 1,
0.04006391, 1.071897, -0.5769224, 1, 1, 1, 1, 1,
0.04346099, -0.9871265, 3.534389, 1, 1, 1, 1, 1,
0.04455967, -0.1216306, 4.649492, 1, 1, 1, 1, 1,
0.04492585, 0.6550539, 0.9558378, 1, 1, 1, 1, 1,
0.04628874, 0.1995136, 0.1773158, 1, 1, 1, 1, 1,
0.05851034, 0.378398, -0.853953, 1, 1, 1, 1, 1,
0.05883416, -1.433166, 3.762913, 1, 1, 1, 1, 1,
0.05975685, -0.06921196, 1.491317, 1, 1, 1, 1, 1,
0.06841095, 0.5971889, 0.6132718, 1, 1, 1, 1, 1,
0.07447244, 0.9293216, 0.9811003, 0, 0, 1, 1, 1,
0.07856689, -0.5306543, 3.095849, 1, 0, 0, 1, 1,
0.08094244, -0.6786135, 3.32445, 1, 0, 0, 1, 1,
0.08447995, 0.5995166, -2.374098, 1, 0, 0, 1, 1,
0.08602061, -0.2837953, 3.653415, 1, 0, 0, 1, 1,
0.08900804, 1.651536, 0.7419389, 1, 0, 0, 1, 1,
0.09048523, 0.0372477, 2.311448, 0, 0, 0, 1, 1,
0.09136064, 1.046952, -0.4867086, 0, 0, 0, 1, 1,
0.09277367, 0.5522958, 0.7037878, 0, 0, 0, 1, 1,
0.09600903, -0.7570992, 3.710475, 0, 0, 0, 1, 1,
0.09664781, -0.5480074, 1.524536, 0, 0, 0, 1, 1,
0.09741354, -1.285078, 3.327151, 0, 0, 0, 1, 1,
0.1077542, -0.6327978, 2.421457, 0, 0, 0, 1, 1,
0.1082225, -0.7176239, 1.296666, 1, 1, 1, 1, 1,
0.1145124, 2.006209, 1.046048, 1, 1, 1, 1, 1,
0.12192, 1.516207, 0.07985389, 1, 1, 1, 1, 1,
0.123717, 0.1396722, 0.4693337, 1, 1, 1, 1, 1,
0.1237786, 0.7409968, 1.602242, 1, 1, 1, 1, 1,
0.1279279, -0.2720005, 2.793187, 1, 1, 1, 1, 1,
0.1294333, 0.531542, 0.6742864, 1, 1, 1, 1, 1,
0.1309663, 0.2027729, 0.5897538, 1, 1, 1, 1, 1,
0.133076, 1.326891, 0.7511111, 1, 1, 1, 1, 1,
0.134888, 0.1347354, 1.1234, 1, 1, 1, 1, 1,
0.1352171, -0.366396, 4.17526, 1, 1, 1, 1, 1,
0.1358576, 0.3974603, 0.4319505, 1, 1, 1, 1, 1,
0.1412288, -1.199902, 3.143178, 1, 1, 1, 1, 1,
0.14358, -0.6961437, 1.833568, 1, 1, 1, 1, 1,
0.149951, 0.1366633, 0.8637709, 1, 1, 1, 1, 1,
0.1530106, -1.27236, 3.054491, 0, 0, 1, 1, 1,
0.1542839, -0.3926325, 5.190731, 1, 0, 0, 1, 1,
0.1592316, -0.6947044, 3.669235, 1, 0, 0, 1, 1,
0.1609411, 0.4862255, 0.559047, 1, 0, 0, 1, 1,
0.1630033, 0.5367551, 0.09561136, 1, 0, 0, 1, 1,
0.1632264, 1.009289, 0.7660437, 1, 0, 0, 1, 1,
0.163834, -0.08259969, 0.5331904, 0, 0, 0, 1, 1,
0.1641926, 1.044515, 0.09850784, 0, 0, 0, 1, 1,
0.17012, -1.573208, 4.276704, 0, 0, 0, 1, 1,
0.1726364, -0.6069324, 3.504008, 0, 0, 0, 1, 1,
0.1730112, -0.7498403, 0.988754, 0, 0, 0, 1, 1,
0.1750451, -1.607909, 3.107065, 0, 0, 0, 1, 1,
0.1751602, 0.4110879, 0.479205, 0, 0, 0, 1, 1,
0.1833082, -0.8272126, 2.469745, 1, 1, 1, 1, 1,
0.1846737, -0.06877671, 2.658639, 1, 1, 1, 1, 1,
0.1865762, -1.310012, 4.117575, 1, 1, 1, 1, 1,
0.1871322, -0.8870868, 1.945245, 1, 1, 1, 1, 1,
0.1921187, -1.257366, 1.832084, 1, 1, 1, 1, 1,
0.1943085, 0.1348496, 1.662941, 1, 1, 1, 1, 1,
0.1961616, -0.7050844, 1.611306, 1, 1, 1, 1, 1,
0.1977008, -0.8720603, 2.867922, 1, 1, 1, 1, 1,
0.2055124, 0.06507865, 2.045611, 1, 1, 1, 1, 1,
0.2063392, -0.9630163, 3.400282, 1, 1, 1, 1, 1,
0.2115315, 0.5903482, -0.3707157, 1, 1, 1, 1, 1,
0.2128194, -0.4423041, 4.104018, 1, 1, 1, 1, 1,
0.2152314, 0.2082154, 0.7363731, 1, 1, 1, 1, 1,
0.2179257, 0.5459407, -0.04358658, 1, 1, 1, 1, 1,
0.2200559, 0.6025687, -1.251991, 1, 1, 1, 1, 1,
0.2212109, 0.2396572, -1.078582, 0, 0, 1, 1, 1,
0.2222444, -0.2907315, 3.445463, 1, 0, 0, 1, 1,
0.2356843, 0.948167, 0.7226042, 1, 0, 0, 1, 1,
0.2400456, -1.293013, 5.390489, 1, 0, 0, 1, 1,
0.2463151, 0.949337, 0.9015678, 1, 0, 0, 1, 1,
0.2468548, -0.8513831, 3.039108, 1, 0, 0, 1, 1,
0.2487613, 1.53175, 0.2312987, 0, 0, 0, 1, 1,
0.2492438, 2.128417, 0.7350195, 0, 0, 0, 1, 1,
0.2511607, 0.1450827, 0.8862731, 0, 0, 0, 1, 1,
0.2522649, 0.04201271, 3.132575, 0, 0, 0, 1, 1,
0.2529271, -0.4427138, 2.441212, 0, 0, 0, 1, 1,
0.2568885, -0.4811179, 3.399379, 0, 0, 0, 1, 1,
0.2583831, -0.5904335, 3.432101, 0, 0, 0, 1, 1,
0.2638696, -0.6960943, 2.581966, 1, 1, 1, 1, 1,
0.2686714, -2.618029, 3.832988, 1, 1, 1, 1, 1,
0.2708569, -1.907619, 2.015911, 1, 1, 1, 1, 1,
0.2735331, -1.886097, 2.661276, 1, 1, 1, 1, 1,
0.275553, 0.4887305, 0.8000387, 1, 1, 1, 1, 1,
0.2802183, 0.1582063, -0.7504992, 1, 1, 1, 1, 1,
0.2852934, -0.1401497, 3.54028, 1, 1, 1, 1, 1,
0.2876949, 2.067955, 1.018552, 1, 1, 1, 1, 1,
0.2893753, -0.7000563, 1.71356, 1, 1, 1, 1, 1,
0.2907056, -1.733594, 2.708054, 1, 1, 1, 1, 1,
0.303972, 0.001256078, 2.388764, 1, 1, 1, 1, 1,
0.3055248, 0.9139783, -1.288683, 1, 1, 1, 1, 1,
0.3173201, 0.3822706, 1.433253, 1, 1, 1, 1, 1,
0.3215985, -1.188731, 3.295874, 1, 1, 1, 1, 1,
0.3217075, 0.1581703, 2.044673, 1, 1, 1, 1, 1,
0.3243657, -0.4111794, 2.453161, 0, 0, 1, 1, 1,
0.3261409, -0.2053246, 3.395994, 1, 0, 0, 1, 1,
0.3291448, 0.769513, -0.8366563, 1, 0, 0, 1, 1,
0.3381035, -0.3835967, 2.853648, 1, 0, 0, 1, 1,
0.3397348, 0.9123206, 0.3053188, 1, 0, 0, 1, 1,
0.3451039, -1.262746, 2.66997, 1, 0, 0, 1, 1,
0.3496227, 0.225159, 1.479373, 0, 0, 0, 1, 1,
0.3533402, 2.008879, 0.685203, 0, 0, 0, 1, 1,
0.3581946, -0.6954273, 2.635147, 0, 0, 0, 1, 1,
0.3637128, -0.489752, 1.727757, 0, 0, 0, 1, 1,
0.36672, -1.857254, 3.443347, 0, 0, 0, 1, 1,
0.3676587, -1.354645, 3.378262, 0, 0, 0, 1, 1,
0.372728, -0.2897348, 1.847816, 0, 0, 0, 1, 1,
0.3734766, 1.58478, 0.7728521, 1, 1, 1, 1, 1,
0.3739348, 0.1940856, 1.601983, 1, 1, 1, 1, 1,
0.376761, 1.849425, -0.2875404, 1, 1, 1, 1, 1,
0.3821897, -1.255651, 2.178705, 1, 1, 1, 1, 1,
0.3855842, -0.9530126, 2.827924, 1, 1, 1, 1, 1,
0.3856103, 0.03641964, 2.470362, 1, 1, 1, 1, 1,
0.3882927, 0.1483321, 0.6738718, 1, 1, 1, 1, 1,
0.388596, 1.410779, 1.034783, 1, 1, 1, 1, 1,
0.3916361, -0.78592, 2.401302, 1, 1, 1, 1, 1,
0.3936047, -0.2123126, 2.475297, 1, 1, 1, 1, 1,
0.3978651, 1.474459, -1.015918, 1, 1, 1, 1, 1,
0.3983255, 2.605867, -0.3918309, 1, 1, 1, 1, 1,
0.4012184, 0.8827198, 1.515613, 1, 1, 1, 1, 1,
0.4015961, 0.2463859, 0.2525231, 1, 1, 1, 1, 1,
0.4053524, 0.1819544, 1.787391, 1, 1, 1, 1, 1,
0.4152216, 1.24655, 0.2043483, 0, 0, 1, 1, 1,
0.4197659, -0.6455383, 2.715091, 1, 0, 0, 1, 1,
0.4217193, 0.2372709, 0.3220018, 1, 0, 0, 1, 1,
0.4237431, 1.202593, 0.9293149, 1, 0, 0, 1, 1,
0.426249, -0.5599278, 3.121339, 1, 0, 0, 1, 1,
0.4380254, 0.5906986, 0.7667341, 1, 0, 0, 1, 1,
0.4385104, 0.003950368, 1.92446, 0, 0, 0, 1, 1,
0.4407482, -1.324753, 1.74417, 0, 0, 0, 1, 1,
0.4458193, -0.5583215, 2.698203, 0, 0, 0, 1, 1,
0.4517834, -0.2194043, 3.686888, 0, 0, 0, 1, 1,
0.4531676, 0.1238849, 1.961187, 0, 0, 0, 1, 1,
0.4557525, -0.008918181, 0.2133885, 0, 0, 0, 1, 1,
0.458797, 0.2737426, 1.001935, 0, 0, 0, 1, 1,
0.4597533, -1.053689, 2.098363, 1, 1, 1, 1, 1,
0.4599805, -1.926833, 2.672331, 1, 1, 1, 1, 1,
0.459981, -0.5085094, 3.098944, 1, 1, 1, 1, 1,
0.4638297, -0.06269877, 2.143068, 1, 1, 1, 1, 1,
0.4669501, -0.6931207, 2.201891, 1, 1, 1, 1, 1,
0.468495, 1.439344, 1.558889, 1, 1, 1, 1, 1,
0.4717023, 0.03262995, 1.066844, 1, 1, 1, 1, 1,
0.4859439, 1.204709, 0.2204279, 1, 1, 1, 1, 1,
0.4941464, -0.9858605, 2.705511, 1, 1, 1, 1, 1,
0.4972828, 0.1981911, 0.7604064, 1, 1, 1, 1, 1,
0.4999117, -0.4782716, 3.506024, 1, 1, 1, 1, 1,
0.5030167, -0.6534908, 2.623801, 1, 1, 1, 1, 1,
0.5051276, -1.878662, 2.418148, 1, 1, 1, 1, 1,
0.5079324, -0.66866, 1.362989, 1, 1, 1, 1, 1,
0.5079694, 0.8976588, 1.281584, 1, 1, 1, 1, 1,
0.5080267, 0.9896572, 1.868041, 0, 0, 1, 1, 1,
0.5128564, -1.031821, 3.111153, 1, 0, 0, 1, 1,
0.5133103, -0.2136885, 1.853648, 1, 0, 0, 1, 1,
0.5146601, 1.26347, -0.5294138, 1, 0, 0, 1, 1,
0.5212543, -0.2055939, 3.028672, 1, 0, 0, 1, 1,
0.5234123, 1.20943, -0.2260247, 1, 0, 0, 1, 1,
0.5259968, 1.744882, 0.1412906, 0, 0, 0, 1, 1,
0.5286828, 2.183721, 0.3211887, 0, 0, 0, 1, 1,
0.5310259, -2.400317, 3.715174, 0, 0, 0, 1, 1,
0.5318098, -0.3810819, 2.496378, 0, 0, 0, 1, 1,
0.5349466, 0.05771382, 0.607262, 0, 0, 0, 1, 1,
0.5380402, -0.783749, 3.316983, 0, 0, 0, 1, 1,
0.538524, -0.1457386, 2.315267, 0, 0, 0, 1, 1,
0.5397065, -0.3054291, 2.088866, 1, 1, 1, 1, 1,
0.5400127, -0.07829338, 1.268708, 1, 1, 1, 1, 1,
0.5419599, 0.9411717, 0.1466904, 1, 1, 1, 1, 1,
0.5452847, 1.294424, 0.8571362, 1, 1, 1, 1, 1,
0.5460176, -0.9536365, 3.959459, 1, 1, 1, 1, 1,
0.5496191, 1.204345, 0.8784223, 1, 1, 1, 1, 1,
0.550499, -0.006174179, 1.277997, 1, 1, 1, 1, 1,
0.5510138, -1.150651, 1.174302, 1, 1, 1, 1, 1,
0.5516831, 0.8457046, 0.7969835, 1, 1, 1, 1, 1,
0.5530173, -2.001809, -0.2191775, 1, 1, 1, 1, 1,
0.5600473, 1.084528, -0.3661341, 1, 1, 1, 1, 1,
0.5630457, 1.11668, 1.376705, 1, 1, 1, 1, 1,
0.563933, 1.194806, -0.3599944, 1, 1, 1, 1, 1,
0.5641761, 1.182358, 1.189718, 1, 1, 1, 1, 1,
0.5699394, 0.7116475, -0.00495183, 1, 1, 1, 1, 1,
0.5701802, -0.4438677, 1.90752, 0, 0, 1, 1, 1,
0.5727669, -0.7362297, 3.624355, 1, 0, 0, 1, 1,
0.5745901, -0.1730691, 2.647438, 1, 0, 0, 1, 1,
0.5796429, 0.7488424, 1.224222, 1, 0, 0, 1, 1,
0.5840413, -0.9303733, -0.1217819, 1, 0, 0, 1, 1,
0.5849436, 0.4639273, 1.301811, 1, 0, 0, 1, 1,
0.5857019, 0.2637081, 3.38621, 0, 0, 0, 1, 1,
0.5977898, 0.9333212, 1.51752, 0, 0, 0, 1, 1,
0.6092125, 0.09235019, 1.904194, 0, 0, 0, 1, 1,
0.615124, -0.8922253, 2.74915, 0, 0, 0, 1, 1,
0.6210771, -0.5761752, -0.1973132, 0, 0, 0, 1, 1,
0.6229962, -1.062158, 3.115717, 0, 0, 0, 1, 1,
0.6269182, 0.706732, 1.26835, 0, 0, 0, 1, 1,
0.6274328, -0.2468032, 3.124831, 1, 1, 1, 1, 1,
0.6281282, -0.04056195, 1.106085, 1, 1, 1, 1, 1,
0.6291052, -0.7452999, 3.4172, 1, 1, 1, 1, 1,
0.6357133, -0.205024, 2.77289, 1, 1, 1, 1, 1,
0.6362004, -0.9570935, 3.430463, 1, 1, 1, 1, 1,
0.6383068, -0.5062351, 2.197028, 1, 1, 1, 1, 1,
0.6404364, 0.9241046, -0.08112587, 1, 1, 1, 1, 1,
0.6465932, 2.538599, 0.6927685, 1, 1, 1, 1, 1,
0.6482227, 0.5504929, 2.659202, 1, 1, 1, 1, 1,
0.653209, 0.8288358, 0.1170457, 1, 1, 1, 1, 1,
0.6569855, 0.4239698, 3.180167, 1, 1, 1, 1, 1,
0.658985, 0.3978191, 0.2602936, 1, 1, 1, 1, 1,
0.6754048, 1.592806, -0.1903091, 1, 1, 1, 1, 1,
0.6780838, 0.4119487, 1.378267, 1, 1, 1, 1, 1,
0.6792294, 0.4537372, 1.048251, 1, 1, 1, 1, 1,
0.6851506, -0.7285787, 2.080748, 0, 0, 1, 1, 1,
0.6880068, -0.9980678, 3.32331, 1, 0, 0, 1, 1,
0.6889012, -1.776688, 2.496759, 1, 0, 0, 1, 1,
0.6963238, 0.9584942, -1.071007, 1, 0, 0, 1, 1,
0.697212, 0.5263004, -0.7030397, 1, 0, 0, 1, 1,
0.6992723, 1.210577, 0.2792444, 1, 0, 0, 1, 1,
0.71144, -0.5617002, 2.233367, 0, 0, 0, 1, 1,
0.7166765, -0.2693802, 0.7047865, 0, 0, 0, 1, 1,
0.719694, 1.094708, 1.167773, 0, 0, 0, 1, 1,
0.7215115, 0.3622679, 0.7621983, 0, 0, 0, 1, 1,
0.7233083, 0.4757825, 1.261277, 0, 0, 0, 1, 1,
0.7242829, 1.031953, 0.2355232, 0, 0, 0, 1, 1,
0.7296833, 0.5346655, 0.8591152, 0, 0, 0, 1, 1,
0.7322063, 1.037131, -0.4562191, 1, 1, 1, 1, 1,
0.7327394, 0.7053515, -1.061561, 1, 1, 1, 1, 1,
0.7330601, -1.353638, 2.557788, 1, 1, 1, 1, 1,
0.7333372, -1.857175, 3.799572, 1, 1, 1, 1, 1,
0.7409953, -1.175283, 3.107562, 1, 1, 1, 1, 1,
0.7415705, 0.9096257, 0.04682672, 1, 1, 1, 1, 1,
0.7441279, -0.2385792, 3.185174, 1, 1, 1, 1, 1,
0.7454947, -0.5215849, 1.362775, 1, 1, 1, 1, 1,
0.7456414, 0.3313054, -0.6045557, 1, 1, 1, 1, 1,
0.7464299, -1.801216, 3.222814, 1, 1, 1, 1, 1,
0.7466095, 0.544411, 1.61242, 1, 1, 1, 1, 1,
0.7493106, -0.9143443, 2.650998, 1, 1, 1, 1, 1,
0.7498443, 0.5578972, 0.6402504, 1, 1, 1, 1, 1,
0.7537606, -0.3791066, 2.445935, 1, 1, 1, 1, 1,
0.7723194, -0.9420491, 2.989186, 1, 1, 1, 1, 1,
0.7763061, 0.1715418, 1.660662, 0, 0, 1, 1, 1,
0.7787369, 1.922448, 0.5248653, 1, 0, 0, 1, 1,
0.7827021, 1.681792, 0.3780424, 1, 0, 0, 1, 1,
0.7830889, 0.8003107, -0.1065341, 1, 0, 0, 1, 1,
0.7856352, -1.120649, 3.981343, 1, 0, 0, 1, 1,
0.7891065, -0.7742487, 2.862656, 1, 0, 0, 1, 1,
0.7896484, -0.6753454, 2.14307, 0, 0, 0, 1, 1,
0.7986826, -0.1567048, 2.753185, 0, 0, 0, 1, 1,
0.8015856, -2.19626, 3.045494, 0, 0, 0, 1, 1,
0.8105095, -1.697752, 3.437456, 0, 0, 0, 1, 1,
0.8134341, 0.6463299, 0.3432149, 0, 0, 0, 1, 1,
0.8171422, -0.1082244, 1.946793, 0, 0, 0, 1, 1,
0.8210155, 2.261053, 0.3807366, 0, 0, 0, 1, 1,
0.8217899, 0.2445021, 2.322659, 1, 1, 1, 1, 1,
0.8236783, 1.017569, 0.3381246, 1, 1, 1, 1, 1,
0.8279176, -0.3126471, 2.994221, 1, 1, 1, 1, 1,
0.8283374, -1.0979, 2.857827, 1, 1, 1, 1, 1,
0.8319633, 0.484027, 0.2665755, 1, 1, 1, 1, 1,
0.8385147, -1.329435, 0.8341246, 1, 1, 1, 1, 1,
0.8406898, 0.8083973, 0.6963173, 1, 1, 1, 1, 1,
0.845476, 0.4082156, 1.149225, 1, 1, 1, 1, 1,
0.8456331, 1.05909, 1.435307, 1, 1, 1, 1, 1,
0.8473771, 0.3905402, 1.178628, 1, 1, 1, 1, 1,
0.8581095, 0.392904, 0.8871999, 1, 1, 1, 1, 1,
0.8626393, -2.044842, 3.217247, 1, 1, 1, 1, 1,
0.8632782, 0.1872063, 1.051353, 1, 1, 1, 1, 1,
0.8725024, -1.478785, 3.293888, 1, 1, 1, 1, 1,
0.8780382, -0.3919253, 1.258605, 1, 1, 1, 1, 1,
0.8826541, 0.3935728, 0.151028, 0, 0, 1, 1, 1,
0.8842691, -0.539004, 1.900681, 1, 0, 0, 1, 1,
0.8844644, 0.09219829, 3.444404, 1, 0, 0, 1, 1,
0.8874709, 1.136205, 1.53887, 1, 0, 0, 1, 1,
0.8889565, 0.02333107, 1.854236, 1, 0, 0, 1, 1,
0.8895367, 0.6197891, 0.7003146, 1, 0, 0, 1, 1,
0.9048214, -0.04080471, 1.316969, 0, 0, 0, 1, 1,
0.9079409, 0.2591799, 0.790597, 0, 0, 0, 1, 1,
0.9105523, 0.5001513, 3.1493, 0, 0, 0, 1, 1,
0.9124601, -1.097456, 2.813698, 0, 0, 0, 1, 1,
0.9148607, -0.9925129, 1.56673, 0, 0, 0, 1, 1,
0.9148667, 0.9748468, 1.980251, 0, 0, 0, 1, 1,
0.9190633, -2.264217, 2.064898, 0, 0, 0, 1, 1,
0.9211797, -2.310768, 3.113853, 1, 1, 1, 1, 1,
0.9235034, -0.08554234, 1.191367, 1, 1, 1, 1, 1,
0.9237893, 0.4491782, 0.4755939, 1, 1, 1, 1, 1,
0.930851, 0.2322109, 0.5619565, 1, 1, 1, 1, 1,
0.9353788, 1.016744, 1.736084, 1, 1, 1, 1, 1,
0.9359866, 0.4408419, 1.547811, 1, 1, 1, 1, 1,
0.9396748, 0.7419593, -0.007585481, 1, 1, 1, 1, 1,
0.9422825, -0.6592829, 2.123098, 1, 1, 1, 1, 1,
0.9508199, -0.3177928, 3.07761, 1, 1, 1, 1, 1,
0.9532087, 1.066836, 3.091285, 1, 1, 1, 1, 1,
0.9690257, 0.4412004, 0.8964068, 1, 1, 1, 1, 1,
0.9721119, -0.8145075, 0.6537417, 1, 1, 1, 1, 1,
0.9790218, -1.095037, 2.953015, 1, 1, 1, 1, 1,
0.9817173, 0.0451266, 0.7780316, 1, 1, 1, 1, 1,
0.982264, -0.915583, 2.010164, 1, 1, 1, 1, 1,
0.9876198, 0.3604145, 1.402598, 0, 0, 1, 1, 1,
0.9910323, -0.338617, 3.926846, 1, 0, 0, 1, 1,
0.9946632, -0.2213842, 3.037836, 1, 0, 0, 1, 1,
0.9970139, 0.3608658, 0.3736061, 1, 0, 0, 1, 1,
1.003381, -0.7749873, 1.726067, 1, 0, 0, 1, 1,
1.004212, -1.369744, 2.159504, 1, 0, 0, 1, 1,
1.006665, 0.7876341, 1.549326, 0, 0, 0, 1, 1,
1.006949, -1.169582, 2.588974, 0, 0, 0, 1, 1,
1.008221, -0.2993346, 2.188425, 0, 0, 0, 1, 1,
1.014682, 0.7477857, 0.5712143, 0, 0, 0, 1, 1,
1.020278, -0.8156295, 3.147557, 0, 0, 0, 1, 1,
1.023596, 0.6607676, 1.472221, 0, 0, 0, 1, 1,
1.029909, -0.507329, 2.20519, 0, 0, 0, 1, 1,
1.031049, 0.7407941, 0.3315523, 1, 1, 1, 1, 1,
1.03813, 0.5616289, 1.802898, 1, 1, 1, 1, 1,
1.043149, -0.1528156, 1.404658, 1, 1, 1, 1, 1,
1.04402, 2.794338, -0.2996695, 1, 1, 1, 1, 1,
1.045496, 0.4035408, 1.780478, 1, 1, 1, 1, 1,
1.052867, -0.3784144, 1.322853, 1, 1, 1, 1, 1,
1.056989, 0.4903518, 0.7512597, 1, 1, 1, 1, 1,
1.067019, -0.1674509, 2.958468, 1, 1, 1, 1, 1,
1.076832, 0.4478214, 1.357895, 1, 1, 1, 1, 1,
1.081347, 0.2225628, 2.248115, 1, 1, 1, 1, 1,
1.086062, -1.628556, 3.63567, 1, 1, 1, 1, 1,
1.089004, 0.3732457, 1.164077, 1, 1, 1, 1, 1,
1.090414, 0.9299691, -1.65446, 1, 1, 1, 1, 1,
1.093063, -0.1352359, 2.800584, 1, 1, 1, 1, 1,
1.09337, -1.578364, 1.57513, 1, 1, 1, 1, 1,
1.116525, 0.2301159, 0.3684007, 0, 0, 1, 1, 1,
1.11766, -1.061115, 1.45375, 1, 0, 0, 1, 1,
1.127914, -1.772424, 0.9132224, 1, 0, 0, 1, 1,
1.128533, -1.136994, 4.787992, 1, 0, 0, 1, 1,
1.13397, -0.3197304, 1.573567, 1, 0, 0, 1, 1,
1.136362, 0.1917383, 1.50356, 1, 0, 0, 1, 1,
1.137048, 0.43914, 1.099927, 0, 0, 0, 1, 1,
1.137364, 0.1047652, 3.948934, 0, 0, 0, 1, 1,
1.1375, 0.6112615, 1.622745, 0, 0, 0, 1, 1,
1.138498, -1.53197, 3.38653, 0, 0, 0, 1, 1,
1.143991, -0.2516645, 1.624532, 0, 0, 0, 1, 1,
1.148975, -0.6103406, 3.459776, 0, 0, 0, 1, 1,
1.15457, -1.332588, 2.267438, 0, 0, 0, 1, 1,
1.164348, 1.098642, 0.2945979, 1, 1, 1, 1, 1,
1.165719, -0.3810728, 2.299697, 1, 1, 1, 1, 1,
1.166569, 0.768477, 0.3430235, 1, 1, 1, 1, 1,
1.166782, 0.7149155, 0.5626068, 1, 1, 1, 1, 1,
1.170011, 2.435958, 0.6567286, 1, 1, 1, 1, 1,
1.171948, 0.01328318, 1.316961, 1, 1, 1, 1, 1,
1.174669, 0.4105655, -0.1815829, 1, 1, 1, 1, 1,
1.181161, 0.02107877, 0.6456769, 1, 1, 1, 1, 1,
1.182487, 1.239542, 0.2554308, 1, 1, 1, 1, 1,
1.186151, -1.061306, 2.836623, 1, 1, 1, 1, 1,
1.189973, 1.076058, 2.180506, 1, 1, 1, 1, 1,
1.19961, -0.2826374, 1.719423, 1, 1, 1, 1, 1,
1.20203, 0.19498, 2.868991, 1, 1, 1, 1, 1,
1.203863, -1.784531, 2.851861, 1, 1, 1, 1, 1,
1.20975, -0.1052223, 2.283166, 1, 1, 1, 1, 1,
1.210942, 1.40436, 1.617116, 0, 0, 1, 1, 1,
1.22709, 0.22872, 0.8851191, 1, 0, 0, 1, 1,
1.229304, 2.453038, 0.4039295, 1, 0, 0, 1, 1,
1.234755, -1.265513, 3.26823, 1, 0, 0, 1, 1,
1.24491, -1.224542, 2.784328, 1, 0, 0, 1, 1,
1.265747, -1.612547, 2.994017, 1, 0, 0, 1, 1,
1.267319, 1.063469, 1.439743, 0, 0, 0, 1, 1,
1.282315, -0.5785891, 0.5449247, 0, 0, 0, 1, 1,
1.283828, 1.011612, 0.7303011, 0, 0, 0, 1, 1,
1.28431, -1.067514, 2.727354, 0, 0, 0, 1, 1,
1.284991, 0.4219961, 1.187427, 0, 0, 0, 1, 1,
1.289123, 1.172303, 1.301997, 0, 0, 0, 1, 1,
1.299144, -0.3121716, 1.012232, 0, 0, 0, 1, 1,
1.304082, 1.352537, 2.41479, 1, 1, 1, 1, 1,
1.30464, -0.09964586, 1.72651, 1, 1, 1, 1, 1,
1.306967, -1.416172, 2.50543, 1, 1, 1, 1, 1,
1.307462, -0.7123317, 4.339718, 1, 1, 1, 1, 1,
1.314864, 0.1036598, 2.58315, 1, 1, 1, 1, 1,
1.326259, -0.4826151, 2.403636, 1, 1, 1, 1, 1,
1.328798, -1.735261, 0.7394969, 1, 1, 1, 1, 1,
1.328886, -1.124453, 4.051081, 1, 1, 1, 1, 1,
1.339375, 2.277085, 2.25507, 1, 1, 1, 1, 1,
1.343431, -0.2792492, 2.09021, 1, 1, 1, 1, 1,
1.345254, 0.5747283, 0.308492, 1, 1, 1, 1, 1,
1.348653, 3.983321, 1.655437, 1, 1, 1, 1, 1,
1.356122, 0.003456891, 0.8233631, 1, 1, 1, 1, 1,
1.356144, 0.06212808, 0.2422348, 1, 1, 1, 1, 1,
1.365412, 1.872129, -0.8907495, 1, 1, 1, 1, 1,
1.377082, 0.09697467, 1.949823, 0, 0, 1, 1, 1,
1.389362, -1.352959, 4.102224, 1, 0, 0, 1, 1,
1.403747, -0.9137081, 2.437968, 1, 0, 0, 1, 1,
1.406251, 0.7494346, 0.3432907, 1, 0, 0, 1, 1,
1.420037, 1.264405, -0.9393467, 1, 0, 0, 1, 1,
1.420632, -0.08245753, 2.749422, 1, 0, 0, 1, 1,
1.427804, -0.6886463, 3.770291, 0, 0, 0, 1, 1,
1.43973, 1.461227, 2.569884, 0, 0, 0, 1, 1,
1.440114, 0.438473, 0.3563733, 0, 0, 0, 1, 1,
1.444889, 1.287389, -0.8189226, 0, 0, 0, 1, 1,
1.445216, 1.501348, 0.6364334, 0, 0, 0, 1, 1,
1.460236, 1.975272, -0.05396515, 0, 0, 0, 1, 1,
1.473439, -0.2235088, 1.151294, 0, 0, 0, 1, 1,
1.473658, -0.09826794, 1.881604, 1, 1, 1, 1, 1,
1.489842, 0.2011531, 0.8938354, 1, 1, 1, 1, 1,
1.49022, -0.03136396, 0.09479199, 1, 1, 1, 1, 1,
1.495896, 0.4285865, -0.5080366, 1, 1, 1, 1, 1,
1.502436, -0.5958766, 1.65496, 1, 1, 1, 1, 1,
1.506065, -0.01278456, 0.04044162, 1, 1, 1, 1, 1,
1.510946, -2.064386, 2.274525, 1, 1, 1, 1, 1,
1.531651, -0.2668342, 1.220911, 1, 1, 1, 1, 1,
1.533467, -1.711469, 4.011542, 1, 1, 1, 1, 1,
1.544926, -0.6413285, -0.09213404, 1, 1, 1, 1, 1,
1.558001, 2.15196, 2.384714, 1, 1, 1, 1, 1,
1.5602, -1.028537, 1.044471, 1, 1, 1, 1, 1,
1.560553, -0.5075012, 0.902981, 1, 1, 1, 1, 1,
1.562669, 1.496557, 0.6132933, 1, 1, 1, 1, 1,
1.567107, 0.09899361, 2.231764, 1, 1, 1, 1, 1,
1.569007, 1.47526, 2.735282, 0, 0, 1, 1, 1,
1.572695, -0.2317872, 0.3429523, 1, 0, 0, 1, 1,
1.58525, 0.5199818, -0.063228, 1, 0, 0, 1, 1,
1.604723, 0.1347334, 1.422556, 1, 0, 0, 1, 1,
1.6165, -1.509258, 2.67634, 1, 0, 0, 1, 1,
1.61938, 0.09996942, 2.153712, 1, 0, 0, 1, 1,
1.653466, 1.122131, 1.772681, 0, 0, 0, 1, 1,
1.65863, -0.1065034, 3.158527, 0, 0, 0, 1, 1,
1.665628, 0.6157735, 0.8016434, 0, 0, 0, 1, 1,
1.682558, -0.227646, 2.724743, 0, 0, 0, 1, 1,
1.685075, 1.943644, 3.295202, 0, 0, 0, 1, 1,
1.695961, 1.085579, -0.8866708, 0, 0, 0, 1, 1,
1.731497, 1.330604, 1.780261, 0, 0, 0, 1, 1,
1.734548, -0.2091217, 2.021827, 1, 1, 1, 1, 1,
1.737006, 1.663347, 1.947454, 1, 1, 1, 1, 1,
1.742072, 0.03902107, 0.9969295, 1, 1, 1, 1, 1,
1.757218, -1.021463, 0.4259134, 1, 1, 1, 1, 1,
1.759452, 0.5648637, 1.057092, 1, 1, 1, 1, 1,
1.769708, -0.3434852, 2.524211, 1, 1, 1, 1, 1,
1.772271, -0.9449742, 1.335983, 1, 1, 1, 1, 1,
1.787764, -0.06164882, 2.236048, 1, 1, 1, 1, 1,
1.801837, 0.4815906, 0.5661566, 1, 1, 1, 1, 1,
1.817427, 0.0342375, 1.799677, 1, 1, 1, 1, 1,
1.827694, -0.1412976, 1.947383, 1, 1, 1, 1, 1,
1.848653, -1.919791, 2.960105, 1, 1, 1, 1, 1,
1.852999, 1.542077, 0.1488712, 1, 1, 1, 1, 1,
1.868451, -1.274094, 2.356189, 1, 1, 1, 1, 1,
1.93888, 3.091249, -0.7959019, 1, 1, 1, 1, 1,
1.98076, -0.3528983, 1.26791, 0, 0, 1, 1, 1,
1.995858, -0.9482369, 1.611636, 1, 0, 0, 1, 1,
2.012098, -1.507106, 1.46066, 1, 0, 0, 1, 1,
2.035596, 0.2504704, 1.857002, 1, 0, 0, 1, 1,
2.093883, 0.3392263, 0.9335397, 1, 0, 0, 1, 1,
2.12501, 0.4135721, 0.6103723, 1, 0, 0, 1, 1,
2.128875, 1.229734, -0.01278284, 0, 0, 0, 1, 1,
2.193501, 0.1662871, -0.3187142, 0, 0, 0, 1, 1,
2.198752, 0.2161266, 2.069335, 0, 0, 0, 1, 1,
2.210366, -1.626117, 2.613989, 0, 0, 0, 1, 1,
2.212881, -0.1793254, 1.770579, 0, 0, 0, 1, 1,
2.233985, -1.669103, 1.314927, 0, 0, 0, 1, 1,
2.292633, 0.6111569, 0.9978456, 0, 0, 0, 1, 1,
2.308737, -2.376998, 1.481007, 1, 1, 1, 1, 1,
2.351961, 0.2261154, 1.280545, 1, 1, 1, 1, 1,
2.433927, 1.980218, 0.1291061, 1, 1, 1, 1, 1,
2.566514, -0.02929588, 2.724666, 1, 1, 1, 1, 1,
2.88936, 0.7551867, 0.5985302, 1, 1, 1, 1, 1,
3.140813, -0.3888339, 0.5770946, 1, 1, 1, 1, 1,
3.149826, 0.09396189, 4.826955, 1, 1, 1, 1, 1
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
var radius = 10.18937;
var distance = 35.78974;
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
mvMatrix.translate( -0.05840468, -0.3921556, 0.5366952 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.78974);
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
