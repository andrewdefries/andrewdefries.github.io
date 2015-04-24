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
-2.838817, 2.005322, -0.9068543, 1, 0, 0, 1,
-2.820428, -0.2540234, -2.889955, 1, 0.007843138, 0, 1,
-2.464001, 0.5692635, -0.7822813, 1, 0.01176471, 0, 1,
-2.408711, -0.602832, 0.3269815, 1, 0.01960784, 0, 1,
-2.403888, -0.1850805, -0.9931413, 1, 0.02352941, 0, 1,
-2.319417, 1.949171, 0.6159976, 1, 0.03137255, 0, 1,
-2.305169, -1.166242, -0.3333619, 1, 0.03529412, 0, 1,
-2.303556, 2.323615, -0.7148736, 1, 0.04313726, 0, 1,
-2.294377, 1.216293, 1.10926, 1, 0.04705882, 0, 1,
-2.221142, 0.9936618, -0.699579, 1, 0.05490196, 0, 1,
-2.209091, 0.7056004, -1.207071, 1, 0.05882353, 0, 1,
-2.206699, -2.107551, -3.210444, 1, 0.06666667, 0, 1,
-2.175437, -0.7915342, -1.697038, 1, 0.07058824, 0, 1,
-2.154387, 2.213155, -0.7716755, 1, 0.07843138, 0, 1,
-2.151325, 0.8773324, -0.8979222, 1, 0.08235294, 0, 1,
-2.149456, 0.9169662, -2.511128, 1, 0.09019608, 0, 1,
-2.144842, 1.219756, -0.9350466, 1, 0.09411765, 0, 1,
-2.142589, 1.000097, -2.582254, 1, 0.1019608, 0, 1,
-2.125007, 0.5169335, -1.175283, 1, 0.1098039, 0, 1,
-2.113168, -0.5717857, -2.15768, 1, 0.1137255, 0, 1,
-2.10415, 1.546796, -1.284974, 1, 0.1215686, 0, 1,
-2.041257, 1.807209, 0.7045991, 1, 0.1254902, 0, 1,
-2.031739, 0.5662845, -0.2728203, 1, 0.1333333, 0, 1,
-2.028495, -1.179038, -2.860513, 1, 0.1372549, 0, 1,
-2.009978, -0.2937048, -1.121081, 1, 0.145098, 0, 1,
-2.001858, 0.4545505, 0.7246631, 1, 0.1490196, 0, 1,
-1.997898, -1.638264, -2.749983, 1, 0.1568628, 0, 1,
-1.962607, -0.4137054, -1.725996, 1, 0.1607843, 0, 1,
-1.958274, -0.4639591, -2.468001, 1, 0.1686275, 0, 1,
-1.938829, 0.5487072, -0.8814438, 1, 0.172549, 0, 1,
-1.929407, 1.683831, -1.075466, 1, 0.1803922, 0, 1,
-1.91924, -1.347272, -0.9759409, 1, 0.1843137, 0, 1,
-1.915912, -0.2505143, -2.081888, 1, 0.1921569, 0, 1,
-1.901442, 0.4872921, -2.529405, 1, 0.1960784, 0, 1,
-1.900198, -1.092207, -1.075211, 1, 0.2039216, 0, 1,
-1.845437, 1.903358, -1.983286, 1, 0.2117647, 0, 1,
-1.843999, 0.4717834, -0.8490744, 1, 0.2156863, 0, 1,
-1.841319, 0.5627628, -1.750026, 1, 0.2235294, 0, 1,
-1.838075, 1.009477, -3.362868, 1, 0.227451, 0, 1,
-1.831447, -0.960735, -0.5155473, 1, 0.2352941, 0, 1,
-1.825722, -0.5433208, -1.396856, 1, 0.2392157, 0, 1,
-1.813947, -0.3150827, -0.9379069, 1, 0.2470588, 0, 1,
-1.810172, 0.05956968, -2.317643, 1, 0.2509804, 0, 1,
-1.775209, -2.500771, -1.326632, 1, 0.2588235, 0, 1,
-1.765727, -1.567813, -0.376822, 1, 0.2627451, 0, 1,
-1.759768, 0.8712206, -0.7128027, 1, 0.2705882, 0, 1,
-1.750735, -0.2022985, -1.394546, 1, 0.2745098, 0, 1,
-1.740962, -0.5815758, -2.517099, 1, 0.282353, 0, 1,
-1.710067, 0.779239, -0.5702471, 1, 0.2862745, 0, 1,
-1.709322, -0.696766, -1.84524, 1, 0.2941177, 0, 1,
-1.708465, -2.224508, -1.813253, 1, 0.3019608, 0, 1,
-1.694468, -0.1911997, -1.398207, 1, 0.3058824, 0, 1,
-1.687162, -2.333057, -3.203214, 1, 0.3137255, 0, 1,
-1.681139, 0.8878005, -1.901804, 1, 0.3176471, 0, 1,
-1.674053, 2.419256, -2.143294, 1, 0.3254902, 0, 1,
-1.668113, 1.436534, -0.8397154, 1, 0.3294118, 0, 1,
-1.658185, -0.4980475, -1.935361, 1, 0.3372549, 0, 1,
-1.656099, 0.8115863, -0.2404079, 1, 0.3411765, 0, 1,
-1.643352, 0.2830491, -1.287173, 1, 0.3490196, 0, 1,
-1.641828, -1.637778, -1.788043, 1, 0.3529412, 0, 1,
-1.631784, -1.624672, -4.478954, 1, 0.3607843, 0, 1,
-1.617008, -0.4145932, -1.60107, 1, 0.3647059, 0, 1,
-1.616037, 0.4826772, -1.454001, 1, 0.372549, 0, 1,
-1.614302, 0.5729884, -0.8879506, 1, 0.3764706, 0, 1,
-1.599415, 0.8702151, -1.023509, 1, 0.3843137, 0, 1,
-1.595302, -1.595663, -3.313498, 1, 0.3882353, 0, 1,
-1.588914, -1.162556, -2.335988, 1, 0.3960784, 0, 1,
-1.573956, -0.1148932, -2.051846, 1, 0.4039216, 0, 1,
-1.570198, -0.06173272, -1.616555, 1, 0.4078431, 0, 1,
-1.560429, -1.268507, -1.13243, 1, 0.4156863, 0, 1,
-1.558413, -1.303549, -2.631924, 1, 0.4196078, 0, 1,
-1.542478, 1.627341, -0.05357122, 1, 0.427451, 0, 1,
-1.535769, 0.7792738, -1.614044, 1, 0.4313726, 0, 1,
-1.523467, -0.452886, -3.157691, 1, 0.4392157, 0, 1,
-1.521865, 0.640004, -1.892046, 1, 0.4431373, 0, 1,
-1.509501, 1.572146, -0.2410322, 1, 0.4509804, 0, 1,
-1.506077, 0.6913274, -1.30419, 1, 0.454902, 0, 1,
-1.500959, -0.1715697, -1.855521, 1, 0.4627451, 0, 1,
-1.49737, -0.3142241, -1.23338, 1, 0.4666667, 0, 1,
-1.493731, 0.2187852, -0.3794731, 1, 0.4745098, 0, 1,
-1.478349, -0.697657, -1.666741, 1, 0.4784314, 0, 1,
-1.474666, 0.8867629, -0.9639105, 1, 0.4862745, 0, 1,
-1.455947, 1.412283, -1.281069, 1, 0.4901961, 0, 1,
-1.454873, -0.700749, -0.912725, 1, 0.4980392, 0, 1,
-1.447162, 0.3591727, -0.2238896, 1, 0.5058824, 0, 1,
-1.445029, -0.07266708, -1.285843, 1, 0.509804, 0, 1,
-1.444097, 0.8196142, -0.9794213, 1, 0.5176471, 0, 1,
-1.438526, -0.8777128, -1.662223, 1, 0.5215687, 0, 1,
-1.421869, -0.9002624, -3.041811, 1, 0.5294118, 0, 1,
-1.412684, 0.8307213, -1.184032, 1, 0.5333334, 0, 1,
-1.411428, -1.004702, -1.165915, 1, 0.5411765, 0, 1,
-1.395184, 1.991299, -1.040346, 1, 0.5450981, 0, 1,
-1.392231, -0.7691642, -2.089442, 1, 0.5529412, 0, 1,
-1.390751, 0.9913967, -1.176187, 1, 0.5568628, 0, 1,
-1.389671, 0.4644181, -1.405294, 1, 0.5647059, 0, 1,
-1.378741, 1.459291, -0.4065125, 1, 0.5686275, 0, 1,
-1.371446, 0.6330327, -1.81033, 1, 0.5764706, 0, 1,
-1.364392, 0.3790028, -2.483753, 1, 0.5803922, 0, 1,
-1.361453, -0.9182658, -2.018152, 1, 0.5882353, 0, 1,
-1.353358, 1.096081, -3.389341, 1, 0.5921569, 0, 1,
-1.352654, -1.025184, -0.1255482, 1, 0.6, 0, 1,
-1.346288, 1.629245, 0.1539517, 1, 0.6078432, 0, 1,
-1.342818, 0.8550043, -0.4933162, 1, 0.6117647, 0, 1,
-1.342647, 0.6009288, -0.1690295, 1, 0.6196079, 0, 1,
-1.340109, 2.520189, -1.505691, 1, 0.6235294, 0, 1,
-1.336189, -0.1894858, -0.5414551, 1, 0.6313726, 0, 1,
-1.335324, 0.4834128, -1.98651, 1, 0.6352941, 0, 1,
-1.334555, 0.566148, -0.8261954, 1, 0.6431373, 0, 1,
-1.326374, 0.2932816, -0.8051156, 1, 0.6470588, 0, 1,
-1.319583, 1.262753, -2.697626, 1, 0.654902, 0, 1,
-1.30922, -0.5030001, -3.347146, 1, 0.6588235, 0, 1,
-1.3024, -0.9150206, -3.347237, 1, 0.6666667, 0, 1,
-1.296496, -0.1393149, -2.328413, 1, 0.6705883, 0, 1,
-1.294057, -0.5538721, -0.04384372, 1, 0.6784314, 0, 1,
-1.293828, 0.8665627, -1.184476, 1, 0.682353, 0, 1,
-1.286736, 1.471348, -2.703254, 1, 0.6901961, 0, 1,
-1.283009, 1.061308, -1.856065, 1, 0.6941177, 0, 1,
-1.280338, 0.1644083, -2.819629, 1, 0.7019608, 0, 1,
-1.265751, -0.37456, -2.88037, 1, 0.7098039, 0, 1,
-1.262915, -1.188447, -1.659728, 1, 0.7137255, 0, 1,
-1.244411, -1.550097, -1.733353, 1, 0.7215686, 0, 1,
-1.240592, -0.009431793, -0.8905568, 1, 0.7254902, 0, 1,
-1.23989, 0.4953527, -1.866451, 1, 0.7333333, 0, 1,
-1.236763, 0.03971071, -0.6504796, 1, 0.7372549, 0, 1,
-1.219069, 0.1396794, -2.198038, 1, 0.7450981, 0, 1,
-1.21733, 1.171196, -2.068816, 1, 0.7490196, 0, 1,
-1.215968, -1.666056, -2.750786, 1, 0.7568628, 0, 1,
-1.209742, -0.0813745, -1.691667, 1, 0.7607843, 0, 1,
-1.197624, -0.1448281, -1.068756, 1, 0.7686275, 0, 1,
-1.188354, -1.693836, -1.675635, 1, 0.772549, 0, 1,
-1.187518, 0.07806392, -2.820426, 1, 0.7803922, 0, 1,
-1.185692, 0.7896224, -0.8509375, 1, 0.7843137, 0, 1,
-1.18192, 1.717062, -0.8038591, 1, 0.7921569, 0, 1,
-1.17655, -1.625694, -1.969243, 1, 0.7960784, 0, 1,
-1.160535, -0.3990364, -2.731492, 1, 0.8039216, 0, 1,
-1.154262, -0.8488072, -1.925876, 1, 0.8117647, 0, 1,
-1.144054, 1.58277, -1.015408, 1, 0.8156863, 0, 1,
-1.140257, -1.488221, -1.477315, 1, 0.8235294, 0, 1,
-1.131747, -0.8860111, -3.174384, 1, 0.827451, 0, 1,
-1.131676, -0.9231508, -0.6088654, 1, 0.8352941, 0, 1,
-1.127119, 0.5078042, -0.6175352, 1, 0.8392157, 0, 1,
-1.117732, 0.2089502, -1.976234, 1, 0.8470588, 0, 1,
-1.113005, 0.3562719, -1.395781, 1, 0.8509804, 0, 1,
-1.111172, 2.192264, -0.01630189, 1, 0.8588235, 0, 1,
-1.108718, 0.1433393, -1.347807, 1, 0.8627451, 0, 1,
-1.106646, -0.4033175, -1.344671, 1, 0.8705882, 0, 1,
-1.104332, -0.4873822, -1.688864, 1, 0.8745098, 0, 1,
-1.104287, -0.05119556, -1.561312, 1, 0.8823529, 0, 1,
-1.097885, 0.4156537, -1.449988, 1, 0.8862745, 0, 1,
-1.096938, 0.7112038, -2.354084, 1, 0.8941177, 0, 1,
-1.086398, 0.917729, -0.7186368, 1, 0.8980392, 0, 1,
-1.072364, -0.9246958, -2.818141, 1, 0.9058824, 0, 1,
-1.066823, -1.231394, -2.342885, 1, 0.9137255, 0, 1,
-1.054277, -0.2493679, -1.451577, 1, 0.9176471, 0, 1,
-1.049409, -1.510788, -3.265222, 1, 0.9254902, 0, 1,
-1.04321, 0.06736742, -1.892883, 1, 0.9294118, 0, 1,
-1.041914, 0.5706928, -0.4131661, 1, 0.9372549, 0, 1,
-1.04108, 1.257203, -0.5110112, 1, 0.9411765, 0, 1,
-1.037313, 1.570052, 0.5101438, 1, 0.9490196, 0, 1,
-1.034902, -0.700098, -1.441959, 1, 0.9529412, 0, 1,
-1.03083, 0.2935676, -0.9082566, 1, 0.9607843, 0, 1,
-1.025032, -0.6414788, -1.598161, 1, 0.9647059, 0, 1,
-1.022255, -0.2566866, -1.24424, 1, 0.972549, 0, 1,
-1.010187, 1.197222, 0.09445982, 1, 0.9764706, 0, 1,
-1.005974, 0.6028316, -2.534595, 1, 0.9843137, 0, 1,
-1.001919, -0.5954923, -2.096506, 1, 0.9882353, 0, 1,
-1.000236, 1.699529, 0.8936584, 1, 0.9960784, 0, 1,
-0.9937884, -0.2858036, -1.513218, 0.9960784, 1, 0, 1,
-0.985877, -0.3246071, -2.402879, 0.9921569, 1, 0, 1,
-0.9850088, 0.252424, -1.546563, 0.9843137, 1, 0, 1,
-0.9823759, 0.001020528, -0.6144179, 0.9803922, 1, 0, 1,
-0.9781631, 0.4330217, -2.563804, 0.972549, 1, 0, 1,
-0.9766319, -0.8463779, -2.22463, 0.9686275, 1, 0, 1,
-0.9673567, -1.886674, -3.26608, 0.9607843, 1, 0, 1,
-0.9594465, 1.072438, -0.07036164, 0.9568627, 1, 0, 1,
-0.9398355, 0.6795666, -0.8554022, 0.9490196, 1, 0, 1,
-0.9336143, -0.4422441, -2.657215, 0.945098, 1, 0, 1,
-0.9267058, 0.6174213, 0.1663728, 0.9372549, 1, 0, 1,
-0.9164063, 0.418485, -0.9561006, 0.9333333, 1, 0, 1,
-0.911454, 1.066009, -0.6716309, 0.9254902, 1, 0, 1,
-0.9102517, -0.4480745, -2.911688, 0.9215686, 1, 0, 1,
-0.9052995, -0.182665, -1.36879, 0.9137255, 1, 0, 1,
-0.9042721, -0.3927391, -3.358013, 0.9098039, 1, 0, 1,
-0.8918651, 0.5956201, -1.967065, 0.9019608, 1, 0, 1,
-0.8917506, 0.9320652, -0.8731577, 0.8941177, 1, 0, 1,
-0.88866, -0.4979011, -2.039576, 0.8901961, 1, 0, 1,
-0.8840508, 0.8044736, 0.7257044, 0.8823529, 1, 0, 1,
-0.8488618, -1.145907, -2.416975, 0.8784314, 1, 0, 1,
-0.8464105, -0.1122022, -1.671209, 0.8705882, 1, 0, 1,
-0.8422485, -0.9589134, -2.483373, 0.8666667, 1, 0, 1,
-0.8399912, 0.2056009, -0.2039927, 0.8588235, 1, 0, 1,
-0.8393077, -0.3805954, -1.373619, 0.854902, 1, 0, 1,
-0.8247591, -0.19266, -1.293355, 0.8470588, 1, 0, 1,
-0.8194551, 2.290243, 0.3364411, 0.8431373, 1, 0, 1,
-0.8189496, 0.9185916, 1.361684, 0.8352941, 1, 0, 1,
-0.8155737, 0.3724638, 0.1709784, 0.8313726, 1, 0, 1,
-0.8094925, 1.095213, -1.226566, 0.8235294, 1, 0, 1,
-0.8070338, 0.13817, 0.128645, 0.8196079, 1, 0, 1,
-0.8017937, 0.1949624, -0.3168927, 0.8117647, 1, 0, 1,
-0.801545, 0.3156125, -3.225157, 0.8078431, 1, 0, 1,
-0.7997391, 0.5548623, -2.088078, 0.8, 1, 0, 1,
-0.7960005, -1.060434, -2.167766, 0.7921569, 1, 0, 1,
-0.7928835, 0.01805222, -2.890706, 0.7882353, 1, 0, 1,
-0.7877496, -0.01592236, -1.152001, 0.7803922, 1, 0, 1,
-0.7872465, 0.9231828, -1.570999, 0.7764706, 1, 0, 1,
-0.7859083, 0.3515747, -0.2590749, 0.7686275, 1, 0, 1,
-0.7794933, -1.812865, -4.510534, 0.7647059, 1, 0, 1,
-0.777036, 1.054664, -0.7648183, 0.7568628, 1, 0, 1,
-0.7753755, 0.6359786, -0.1623609, 0.7529412, 1, 0, 1,
-0.7748218, -0.3046599, -3.182267, 0.7450981, 1, 0, 1,
-0.7737083, -1.744175, -3.350368, 0.7411765, 1, 0, 1,
-0.7726417, -0.01244156, -1.283599, 0.7333333, 1, 0, 1,
-0.7719725, 0.5691388, 0.3143732, 0.7294118, 1, 0, 1,
-0.771121, 0.4740279, -0.2261631, 0.7215686, 1, 0, 1,
-0.7709398, 0.955195, -0.7507889, 0.7176471, 1, 0, 1,
-0.7699931, -0.2630754, -2.344357, 0.7098039, 1, 0, 1,
-0.7671056, 0.3930695, -1.527991, 0.7058824, 1, 0, 1,
-0.7657256, -0.7537427, -2.491948, 0.6980392, 1, 0, 1,
-0.7651145, 0.08786767, -0.8945502, 0.6901961, 1, 0, 1,
-0.7639285, -0.6962377, -1.804286, 0.6862745, 1, 0, 1,
-0.7634014, 0.5833277, 0.7041965, 0.6784314, 1, 0, 1,
-0.7623993, 1.643605, 0.3697668, 0.6745098, 1, 0, 1,
-0.7622848, -0.4523335, -2.302634, 0.6666667, 1, 0, 1,
-0.7614799, -0.1976089, -0.10704, 0.6627451, 1, 0, 1,
-0.7575864, 0.2332452, -2.066419, 0.654902, 1, 0, 1,
-0.756126, 1.028679, 1.23864, 0.6509804, 1, 0, 1,
-0.7549083, -1.300618, -4.723795, 0.6431373, 1, 0, 1,
-0.7544608, -0.0986276, -2.391888, 0.6392157, 1, 0, 1,
-0.7512271, 0.5685124, -1.546427, 0.6313726, 1, 0, 1,
-0.7434576, -0.9128868, -3.614158, 0.627451, 1, 0, 1,
-0.7420138, 0.7841998, 0.3769732, 0.6196079, 1, 0, 1,
-0.7379036, 0.7335322, -0.2748533, 0.6156863, 1, 0, 1,
-0.7377815, 1.354235, -0.7996265, 0.6078432, 1, 0, 1,
-0.7344888, -0.2012747, -0.00477066, 0.6039216, 1, 0, 1,
-0.7314703, 1.497182, -1.486236, 0.5960785, 1, 0, 1,
-0.7313948, -1.536081, -2.067928, 0.5882353, 1, 0, 1,
-0.7277262, 1.440739, -2.519884, 0.5843138, 1, 0, 1,
-0.7268502, -0.3939053, -3.794408, 0.5764706, 1, 0, 1,
-0.7167323, -1.772187, -3.077474, 0.572549, 1, 0, 1,
-0.7147399, -0.8087713, -3.654331, 0.5647059, 1, 0, 1,
-0.713456, -0.08837721, -1.416951, 0.5607843, 1, 0, 1,
-0.7112896, -0.2592909, -2.837695, 0.5529412, 1, 0, 1,
-0.7109417, -0.7337229, -2.232366, 0.5490196, 1, 0, 1,
-0.7041703, 0.978768, 1.200836, 0.5411765, 1, 0, 1,
-0.6957061, 0.1114497, -1.657328, 0.5372549, 1, 0, 1,
-0.6929083, -0.2174559, 0.1324779, 0.5294118, 1, 0, 1,
-0.6905162, 1.023944, -1.189276, 0.5254902, 1, 0, 1,
-0.6900123, -0.7594402, -2.886228, 0.5176471, 1, 0, 1,
-0.6889443, 2.018578, -1.264164, 0.5137255, 1, 0, 1,
-0.6886201, 0.8609604, -2.413133, 0.5058824, 1, 0, 1,
-0.6857781, -0.2298623, -2.541645, 0.5019608, 1, 0, 1,
-0.6857762, 0.5537078, -2.438658, 0.4941176, 1, 0, 1,
-0.6857638, 0.7917555, -1.928155, 0.4862745, 1, 0, 1,
-0.684675, -0.06563511, -0.3652298, 0.4823529, 1, 0, 1,
-0.6822237, 0.7528468, -0.9520308, 0.4745098, 1, 0, 1,
-0.6804046, 1.712307, 0.5325646, 0.4705882, 1, 0, 1,
-0.6760777, 0.4125855, -0.3688194, 0.4627451, 1, 0, 1,
-0.6728763, 1.130347, -0.4333359, 0.4588235, 1, 0, 1,
-0.6695533, -0.1605109, -1.617227, 0.4509804, 1, 0, 1,
-0.6640356, 2.266034, -0.4074256, 0.4470588, 1, 0, 1,
-0.6634285, 0.2359294, -1.202252, 0.4392157, 1, 0, 1,
-0.6626331, 0.8830047, 0.6763547, 0.4352941, 1, 0, 1,
-0.6572733, 1.937088, 0.04916885, 0.427451, 1, 0, 1,
-0.6565236, -1.556774, -2.661979, 0.4235294, 1, 0, 1,
-0.654651, -0.4189173, -1.623034, 0.4156863, 1, 0, 1,
-0.6491602, -0.6188379, -1.447478, 0.4117647, 1, 0, 1,
-0.6489068, 2.413054, -1.792441, 0.4039216, 1, 0, 1,
-0.6488086, -0.5350823, -1.192848, 0.3960784, 1, 0, 1,
-0.6352218, 0.880217, -1.264506, 0.3921569, 1, 0, 1,
-0.6292799, -0.5133819, -2.100562, 0.3843137, 1, 0, 1,
-0.6283621, 1.953174, -0.1636655, 0.3803922, 1, 0, 1,
-0.6257221, -0.3425188, -0.6770144, 0.372549, 1, 0, 1,
-0.6245016, 1.098612, 0.5025763, 0.3686275, 1, 0, 1,
-0.6176512, 1.389905, -1.972481, 0.3607843, 1, 0, 1,
-0.6075776, 0.2595318, -1.334958, 0.3568628, 1, 0, 1,
-0.5935685, -1.138101, -2.084437, 0.3490196, 1, 0, 1,
-0.5902507, -1.532209, -4.550626, 0.345098, 1, 0, 1,
-0.5902094, -1.21969, -1.219507, 0.3372549, 1, 0, 1,
-0.5879369, 1.407214, 1.236519, 0.3333333, 1, 0, 1,
-0.5874735, 1.356774, -1.537688, 0.3254902, 1, 0, 1,
-0.5829677, -1.001727, -2.889625, 0.3215686, 1, 0, 1,
-0.5820004, -0.8536337, -3.171784, 0.3137255, 1, 0, 1,
-0.5815843, 0.06791104, -2.563796, 0.3098039, 1, 0, 1,
-0.5812695, 0.6371033, 0.09273531, 0.3019608, 1, 0, 1,
-0.5758581, 0.2952617, -1.808545, 0.2941177, 1, 0, 1,
-0.573498, 0.4536034, -1.618666, 0.2901961, 1, 0, 1,
-0.5734653, 0.7460811, -1.154271, 0.282353, 1, 0, 1,
-0.5653816, -0.7240844, -0.8786944, 0.2784314, 1, 0, 1,
-0.5638098, -1.342978, -4.04104, 0.2705882, 1, 0, 1,
-0.5629645, 0.5342032, -1.815208, 0.2666667, 1, 0, 1,
-0.5604427, -0.2657157, -0.1892896, 0.2588235, 1, 0, 1,
-0.5576605, 0.3944411, -1.55916, 0.254902, 1, 0, 1,
-0.5573708, -0.1024872, -4.679531, 0.2470588, 1, 0, 1,
-0.5550248, 0.1363238, 0.7580937, 0.2431373, 1, 0, 1,
-0.5549578, -1.82378, -1.22821, 0.2352941, 1, 0, 1,
-0.5543202, 0.5093062, 0.5530792, 0.2313726, 1, 0, 1,
-0.550078, 0.5526459, -0.2738079, 0.2235294, 1, 0, 1,
-0.5481424, 2.562969, 0.2433078, 0.2196078, 1, 0, 1,
-0.5478505, -0.02378313, -0.3489398, 0.2117647, 1, 0, 1,
-0.543935, -0.1595436, -1.938599, 0.2078431, 1, 0, 1,
-0.5410907, -0.7386888, -1.532572, 0.2, 1, 0, 1,
-0.5405954, 0.07699826, -1.543275, 0.1921569, 1, 0, 1,
-0.5400522, 0.2224828, -0.7126483, 0.1882353, 1, 0, 1,
-0.5390366, 0.18119, -2.328786, 0.1803922, 1, 0, 1,
-0.5327727, -1.028513, -3.033412, 0.1764706, 1, 0, 1,
-0.5287567, 1.126652, 0.3873597, 0.1686275, 1, 0, 1,
-0.5238094, 0.08078418, -1.281634, 0.1647059, 1, 0, 1,
-0.5210642, 2.525732, 0.5838634, 0.1568628, 1, 0, 1,
-0.5199109, -1.089125, -1.742134, 0.1529412, 1, 0, 1,
-0.5189912, 0.5099505, -1.521743, 0.145098, 1, 0, 1,
-0.5147177, 0.6433551, 0.4969283, 0.1411765, 1, 0, 1,
-0.5109149, -1.228164, -1.972604, 0.1333333, 1, 0, 1,
-0.5092487, -0.7867087, -1.472963, 0.1294118, 1, 0, 1,
-0.5091329, -0.5041049, -2.187478, 0.1215686, 1, 0, 1,
-0.5042049, -0.3546986, -3.119894, 0.1176471, 1, 0, 1,
-0.5026235, 0.280097, -1.640795, 0.1098039, 1, 0, 1,
-0.4989468, -0.610657, -2.141986, 0.1058824, 1, 0, 1,
-0.4968023, 0.2023449, -1.073079, 0.09803922, 1, 0, 1,
-0.4949655, -1.144642, -0.9441959, 0.09019608, 1, 0, 1,
-0.49043, 0.3762614, -0.207234, 0.08627451, 1, 0, 1,
-0.4874124, -0.5062745, -2.504758, 0.07843138, 1, 0, 1,
-0.4828898, -0.9726898, -1.584568, 0.07450981, 1, 0, 1,
-0.4828237, 1.492847, 0.0594752, 0.06666667, 1, 0, 1,
-0.482289, -0.3356337, -2.475387, 0.0627451, 1, 0, 1,
-0.4813538, -1.321315, -3.776977, 0.05490196, 1, 0, 1,
-0.4812966, -0.4979204, -2.527579, 0.05098039, 1, 0, 1,
-0.4810386, 1.763904, -1.578959, 0.04313726, 1, 0, 1,
-0.480025, 0.1535144, 0.04507094, 0.03921569, 1, 0, 1,
-0.4788424, 0.06709436, 1.415855, 0.03137255, 1, 0, 1,
-0.4777812, 0.3388987, -1.720629, 0.02745098, 1, 0, 1,
-0.476181, -1.166417, -1.936441, 0.01960784, 1, 0, 1,
-0.4704415, -0.3678882, -2.846514, 0.01568628, 1, 0, 1,
-0.4694014, -0.2007193, -1.265532, 0.007843138, 1, 0, 1,
-0.4686675, 1.372447, 1.249733, 0.003921569, 1, 0, 1,
-0.466516, 1.4475, -0.7700179, 0, 1, 0.003921569, 1,
-0.4659133, -0.2500413, -2.083317, 0, 1, 0.01176471, 1,
-0.4586667, 0.1493817, -0.9036159, 0, 1, 0.01568628, 1,
-0.4567116, -0.6131242, -2.095102, 0, 1, 0.02352941, 1,
-0.4551751, 0.3017327, -1.800325, 0, 1, 0.02745098, 1,
-0.453588, -0.6983472, -3.207557, 0, 1, 0.03529412, 1,
-0.4529079, -0.167163, -2.644691, 0, 1, 0.03921569, 1,
-0.4527839, 0.1094826, 0.5002087, 0, 1, 0.04705882, 1,
-0.452739, -0.2465108, -0.7349996, 0, 1, 0.05098039, 1,
-0.450842, -0.4801563, -1.660777, 0, 1, 0.05882353, 1,
-0.4502405, 0.02672951, -0.5604517, 0, 1, 0.0627451, 1,
-0.4497926, 0.8346761, 0.2300326, 0, 1, 0.07058824, 1,
-0.448413, 0.8328701, 0.2736219, 0, 1, 0.07450981, 1,
-0.441489, -1.629678, -3.36994, 0, 1, 0.08235294, 1,
-0.4381478, -0.4640545, -0.2410973, 0, 1, 0.08627451, 1,
-0.4318272, 1.44971, 1.718685, 0, 1, 0.09411765, 1,
-0.4291786, 1.083528, 0.2451955, 0, 1, 0.1019608, 1,
-0.4282813, 0.6109387, 0.882, 0, 1, 0.1058824, 1,
-0.4274657, 0.1613524, -1.936151, 0, 1, 0.1137255, 1,
-0.4271834, -0.3857768, -3.950552, 0, 1, 0.1176471, 1,
-0.4255832, -0.3132251, -2.432667, 0, 1, 0.1254902, 1,
-0.4217697, 1.597681, -0.2448998, 0, 1, 0.1294118, 1,
-0.4212624, -1.398513, -2.245828, 0, 1, 0.1372549, 1,
-0.4207866, -1.541039, -2.573815, 0, 1, 0.1411765, 1,
-0.4164082, -0.2421221, -2.892672, 0, 1, 0.1490196, 1,
-0.4151372, 0.4765073, -0.2163408, 0, 1, 0.1529412, 1,
-0.4140416, 1.657694, 1.725044, 0, 1, 0.1607843, 1,
-0.4128013, 0.7419273, 0.7570793, 0, 1, 0.1647059, 1,
-0.4114823, -0.3187718, -1.879975, 0, 1, 0.172549, 1,
-0.4107052, -1.034782, 0.07076388, 0, 1, 0.1764706, 1,
-0.4053419, 1.429812, 0.7817868, 0, 1, 0.1843137, 1,
-0.4044114, 1.92441, -0.2751247, 0, 1, 0.1882353, 1,
-0.4031138, -0.2485107, -2.667717, 0, 1, 0.1960784, 1,
-0.3996555, -0.2469942, -2.877431, 0, 1, 0.2039216, 1,
-0.3970176, -0.3980821, -1.749473, 0, 1, 0.2078431, 1,
-0.3935081, -0.1877425, -1.71327, 0, 1, 0.2156863, 1,
-0.3925172, 0.395774, -1.54361, 0, 1, 0.2196078, 1,
-0.3895302, -2.979751, -5.0797, 0, 1, 0.227451, 1,
-0.3878703, 0.1606768, 0.3331536, 0, 1, 0.2313726, 1,
-0.3856968, -1.015979, -2.789067, 0, 1, 0.2392157, 1,
-0.3836562, -1.775344, -3.161507, 0, 1, 0.2431373, 1,
-0.3829216, -0.6114658, -0.7429624, 0, 1, 0.2509804, 1,
-0.3825139, -0.3941526, -3.172448, 0, 1, 0.254902, 1,
-0.382203, -1.351555, -0.7349989, 0, 1, 0.2627451, 1,
-0.3808461, -0.9974384, -2.127068, 0, 1, 0.2666667, 1,
-0.3732732, 0.6504027, -0.5990096, 0, 1, 0.2745098, 1,
-0.3715827, 2.076136, -0.503839, 0, 1, 0.2784314, 1,
-0.3695616, 0.9186385, -1.561594, 0, 1, 0.2862745, 1,
-0.3674069, 0.5543997, -0.2592818, 0, 1, 0.2901961, 1,
-0.3659368, 0.2224247, -1.645251, 0, 1, 0.2980392, 1,
-0.3636135, 0.3215697, -0.2797251, 0, 1, 0.3058824, 1,
-0.3632206, -0.2923506, -3.015965, 0, 1, 0.3098039, 1,
-0.3619356, -1.070484, -0.9365671, 0, 1, 0.3176471, 1,
-0.361798, -1.459146, -3.738157, 0, 1, 0.3215686, 1,
-0.3588074, -0.7684509, -3.609815, 0, 1, 0.3294118, 1,
-0.3585117, 0.9932608, -0.2836755, 0, 1, 0.3333333, 1,
-0.3582687, -0.01833387, -0.8121002, 0, 1, 0.3411765, 1,
-0.3554929, 0.4553953, -0.2613544, 0, 1, 0.345098, 1,
-0.3525468, 0.7886892, -0.6482742, 0, 1, 0.3529412, 1,
-0.3433473, 1.231206, 2.985586, 0, 1, 0.3568628, 1,
-0.3406434, -0.9927229, -2.913032, 0, 1, 0.3647059, 1,
-0.3393209, 1.151099, -0.3279233, 0, 1, 0.3686275, 1,
-0.3380727, 0.6376752, -1.436493, 0, 1, 0.3764706, 1,
-0.3346784, 0.1258119, -2.695343, 0, 1, 0.3803922, 1,
-0.3318301, 2.016048, -1.44451, 0, 1, 0.3882353, 1,
-0.3313941, 0.4073161, -1.528309, 0, 1, 0.3921569, 1,
-0.3290141, 0.4672363, 0.2829368, 0, 1, 0.4, 1,
-0.3273776, -1.035552, -1.048261, 0, 1, 0.4078431, 1,
-0.3246938, 0.7765212, 0.2121868, 0, 1, 0.4117647, 1,
-0.3215185, -0.3276386, -1.910402, 0, 1, 0.4196078, 1,
-0.3208824, 1.027457, -0.6254581, 0, 1, 0.4235294, 1,
-0.317607, 1.862059, -0.1172243, 0, 1, 0.4313726, 1,
-0.3154218, 1.194633, -0.003706782, 0, 1, 0.4352941, 1,
-0.3045363, -1.869328, -2.202968, 0, 1, 0.4431373, 1,
-0.3029088, 0.6531345, -0.788106, 0, 1, 0.4470588, 1,
-0.297504, 0.03863166, -0.9752967, 0, 1, 0.454902, 1,
-0.2957233, -1.183494, -3.087531, 0, 1, 0.4588235, 1,
-0.2956637, 1.573156, 0.03163817, 0, 1, 0.4666667, 1,
-0.2944366, 1.036277, 0.2633641, 0, 1, 0.4705882, 1,
-0.2920103, 1.700683, 0.7340459, 0, 1, 0.4784314, 1,
-0.2912199, 1.053859, 0.2511247, 0, 1, 0.4823529, 1,
-0.2882581, 0.6843508, -1.196825, 0, 1, 0.4901961, 1,
-0.2879936, 1.867785, -2.338517, 0, 1, 0.4941176, 1,
-0.2818624, 0.6015378, -1.238535, 0, 1, 0.5019608, 1,
-0.2787943, -1.393309, -4.948985, 0, 1, 0.509804, 1,
-0.2787225, -0.220161, -2.44499, 0, 1, 0.5137255, 1,
-0.2759692, -0.01084543, -0.0184036, 0, 1, 0.5215687, 1,
-0.275027, -1.397612, -4.283125, 0, 1, 0.5254902, 1,
-0.2701512, -1.226873, -2.52458, 0, 1, 0.5333334, 1,
-0.2700401, -0.005993965, -2.582395, 0, 1, 0.5372549, 1,
-0.2649669, 0.4881375, -0.5111555, 0, 1, 0.5450981, 1,
-0.2595517, -1.418634, -3.309244, 0, 1, 0.5490196, 1,
-0.2518013, -1.444427, -2.151681, 0, 1, 0.5568628, 1,
-0.2517265, -0.784348, -1.699662, 0, 1, 0.5607843, 1,
-0.2488473, 0.09830303, -2.42204, 0, 1, 0.5686275, 1,
-0.2483166, -1.604746, -2.700087, 0, 1, 0.572549, 1,
-0.2461741, -0.8547583, -3.272395, 0, 1, 0.5803922, 1,
-0.2461383, -0.1281855, -2.230317, 0, 1, 0.5843138, 1,
-0.2430348, 0.3947985, -1.617102, 0, 1, 0.5921569, 1,
-0.2420074, 1.67846, -0.6824348, 0, 1, 0.5960785, 1,
-0.2377374, 1.198107, -0.5201121, 0, 1, 0.6039216, 1,
-0.2375598, -2.411754, -2.00144, 0, 1, 0.6117647, 1,
-0.2328909, 0.5191363, -0.5786427, 0, 1, 0.6156863, 1,
-0.2305861, -0.939433, -2.837322, 0, 1, 0.6235294, 1,
-0.2276237, 0.4439714, 0.8489038, 0, 1, 0.627451, 1,
-0.2264587, 0.5194551, 0.5351712, 0, 1, 0.6352941, 1,
-0.2247331, 1.549644, 2.634531, 0, 1, 0.6392157, 1,
-0.2229769, -0.1542583, -3.746652, 0, 1, 0.6470588, 1,
-0.2201096, 0.3408593, -1.789804, 0, 1, 0.6509804, 1,
-0.2179753, 0.4174157, -1.855879, 0, 1, 0.6588235, 1,
-0.2174606, 0.2098308, -0.7417138, 0, 1, 0.6627451, 1,
-0.2138979, 0.3287937, 0.2934636, 0, 1, 0.6705883, 1,
-0.2100784, 1.307086, -1.344117, 0, 1, 0.6745098, 1,
-0.207774, -0.914001, -3.072264, 0, 1, 0.682353, 1,
-0.2073324, 1.692944, 1.4978, 0, 1, 0.6862745, 1,
-0.1972486, 1.799817, 0.6319526, 0, 1, 0.6941177, 1,
-0.1968609, -2.019348, -3.83884, 0, 1, 0.7019608, 1,
-0.1917542, -0.4943016, -4.220072, 0, 1, 0.7058824, 1,
-0.1886179, 2.245811, -1.046417, 0, 1, 0.7137255, 1,
-0.1872377, 0.9570395, -0.1278641, 0, 1, 0.7176471, 1,
-0.1847621, -0.9608907, -3.547869, 0, 1, 0.7254902, 1,
-0.1710721, -0.2985643, -1.600909, 0, 1, 0.7294118, 1,
-0.1696328, 0.7978785, -1.119768, 0, 1, 0.7372549, 1,
-0.1678029, -1.444666, -4.470296, 0, 1, 0.7411765, 1,
-0.1656552, 0.04960194, -1.363015, 0, 1, 0.7490196, 1,
-0.1648277, 0.3636824, -0.3100376, 0, 1, 0.7529412, 1,
-0.1637195, 0.5834999, 0.4785994, 0, 1, 0.7607843, 1,
-0.1637107, 0.6297288, 1.338106, 0, 1, 0.7647059, 1,
-0.1623787, -0.2146158, -3.070243, 0, 1, 0.772549, 1,
-0.1547244, 0.8041325, 1.735692, 0, 1, 0.7764706, 1,
-0.1522948, 1.561159, -1.260721, 0, 1, 0.7843137, 1,
-0.1485211, 0.5585151, -0.1086561, 0, 1, 0.7882353, 1,
-0.1482848, 0.5341251, -0.06093801, 0, 1, 0.7960784, 1,
-0.1419, -0.9266741, -1.731133, 0, 1, 0.8039216, 1,
-0.1412999, -1.041383, -3.915334, 0, 1, 0.8078431, 1,
-0.1360205, 0.8456057, -1.415765, 0, 1, 0.8156863, 1,
-0.1328753, 0.6208083, 1.771298, 0, 1, 0.8196079, 1,
-0.1222123, 1.915143, 1.107198, 0, 1, 0.827451, 1,
-0.1178985, 1.037557, -0.9653046, 0, 1, 0.8313726, 1,
-0.1174126, 1.816782, -1.278972, 0, 1, 0.8392157, 1,
-0.1135701, -0.1931575, -1.570058, 0, 1, 0.8431373, 1,
-0.1131829, -0.8694309, -4.032141, 0, 1, 0.8509804, 1,
-0.1113783, -1.918744, -1.993715, 0, 1, 0.854902, 1,
-0.1102148, -0.2594154, -3.91114, 0, 1, 0.8627451, 1,
-0.1097384, -1.387069, -2.981065, 0, 1, 0.8666667, 1,
-0.1043987, -2.722329, -0.2733845, 0, 1, 0.8745098, 1,
-0.1037491, -0.7672827, -3.440413, 0, 1, 0.8784314, 1,
-0.1001881, -0.5355015, -4.61491, 0, 1, 0.8862745, 1,
-0.09896623, 0.3764759, 0.736271, 0, 1, 0.8901961, 1,
-0.09680402, -3.154301, -3.455497, 0, 1, 0.8980392, 1,
-0.09430359, 0.5148699, 0.1321166, 0, 1, 0.9058824, 1,
-0.09109364, -0.1538089, -2.573344, 0, 1, 0.9098039, 1,
-0.08966211, -0.9314626, -3.410067, 0, 1, 0.9176471, 1,
-0.08667475, -0.5547715, -3.944379, 0, 1, 0.9215686, 1,
-0.08313904, -0.4413303, -3.418285, 0, 1, 0.9294118, 1,
-0.08218593, -1.698634, -4.163372, 0, 1, 0.9333333, 1,
-0.08083717, -1.194523, -2.895377, 0, 1, 0.9411765, 1,
-0.07883412, -0.3703946, -3.308343, 0, 1, 0.945098, 1,
-0.06916936, 0.4986727, 0.3574511, 0, 1, 0.9529412, 1,
-0.06875374, 0.175189, -0.6730539, 0, 1, 0.9568627, 1,
-0.06801179, 0.1068309, -2.014237, 0, 1, 0.9647059, 1,
-0.06580237, 1.261968, -0.6829841, 0, 1, 0.9686275, 1,
-0.06347551, 0.5469425, 2.311366, 0, 1, 0.9764706, 1,
-0.06078298, -0.6158357, -3.19099, 0, 1, 0.9803922, 1,
-0.06048659, -2.351055, -4.592883, 0, 1, 0.9882353, 1,
-0.05416216, 1.43157, -0.7709638, 0, 1, 0.9921569, 1,
-0.05300704, 0.4062097, -0.409287, 0, 1, 1, 1,
-0.0516174, 1.862067, 1.533597, 0, 0.9921569, 1, 1,
-0.05125623, 0.8070936, -0.08984726, 0, 0.9882353, 1, 1,
-0.05071265, -1.321439, -1.318342, 0, 0.9803922, 1, 1,
-0.04900084, 0.5477838, -0.1053115, 0, 0.9764706, 1, 1,
-0.04837038, 0.4781837, 1.53645, 0, 0.9686275, 1, 1,
-0.04747112, -0.9522271, -3.42958, 0, 0.9647059, 1, 1,
-0.04684746, -0.2836062, -2.874296, 0, 0.9568627, 1, 1,
-0.04458193, -0.4785439, -3.965807, 0, 0.9529412, 1, 1,
-0.04391905, 1.201412, -0.891334, 0, 0.945098, 1, 1,
-0.04285913, 0.09940875, -2.628603, 0, 0.9411765, 1, 1,
-0.04066179, -0.7277504, -2.83022, 0, 0.9333333, 1, 1,
-0.03859313, 0.2227564, -0.13639, 0, 0.9294118, 1, 1,
-0.02598637, 0.5334354, -1.026391, 0, 0.9215686, 1, 1,
-0.01784961, -1.603332, -1.989673, 0, 0.9176471, 1, 1,
-0.01574063, -1.611822, -3.456539, 0, 0.9098039, 1, 1,
-0.01080203, 1.121182, -0.6047882, 0, 0.9058824, 1, 1,
-0.002872363, 1.086773, 0.3535359, 0, 0.8980392, 1, 1,
-0.002549369, 0.2096834, 0.9013536, 0, 0.8901961, 1, 1,
-0.0005195895, 1.099612, 0.07152484, 0, 0.8862745, 1, 1,
0.01731561, 0.3151996, -0.3497126, 0, 0.8784314, 1, 1,
0.02504626, -0.4027603, 3.337544, 0, 0.8745098, 1, 1,
0.02605453, -1.480643, 3.227907, 0, 0.8666667, 1, 1,
0.02751384, -0.4152636, 2.034418, 0, 0.8627451, 1, 1,
0.02794875, -0.2436674, 2.498881, 0, 0.854902, 1, 1,
0.03464609, -0.8367947, 3.699611, 0, 0.8509804, 1, 1,
0.03501433, 0.8604491, -1.22902, 0, 0.8431373, 1, 1,
0.03961144, 0.4397231, 0.5285232, 0, 0.8392157, 1, 1,
0.0429083, -0.3118328, 4.369923, 0, 0.8313726, 1, 1,
0.04346761, -0.7112759, 1.587107, 0, 0.827451, 1, 1,
0.04363837, -0.1053698, 3.976811, 0, 0.8196079, 1, 1,
0.04624481, 0.6147002, -1.160323, 0, 0.8156863, 1, 1,
0.05104188, -0.4868838, 3.478134, 0, 0.8078431, 1, 1,
0.0538049, -1.151101, 2.198311, 0, 0.8039216, 1, 1,
0.05995351, -0.1648764, 4.051211, 0, 0.7960784, 1, 1,
0.06516027, -0.4345617, 3.686503, 0, 0.7882353, 1, 1,
0.0657631, 0.7096806, -0.6799656, 0, 0.7843137, 1, 1,
0.07075682, 0.3381512, 2.41889, 0, 0.7764706, 1, 1,
0.07532085, 0.2825739, 1.807449, 0, 0.772549, 1, 1,
0.0754964, 0.1664422, -1.335019, 0, 0.7647059, 1, 1,
0.0755247, 0.5652463, -0.7401153, 0, 0.7607843, 1, 1,
0.07747994, -0.260671, 3.014782, 0, 0.7529412, 1, 1,
0.07841665, 1.573417, -0.6708441, 0, 0.7490196, 1, 1,
0.07866374, 0.2355333, -0.8182047, 0, 0.7411765, 1, 1,
0.08087601, -0.1947855, 3.575167, 0, 0.7372549, 1, 1,
0.08438899, -0.6553726, 3.533948, 0, 0.7294118, 1, 1,
0.08499321, -2.009601, 4.406036, 0, 0.7254902, 1, 1,
0.08544213, 0.7758269, -2.197508, 0, 0.7176471, 1, 1,
0.08606979, 0.1333825, 0.3301407, 0, 0.7137255, 1, 1,
0.08928143, 1.779178, 0.9692886, 0, 0.7058824, 1, 1,
0.0907563, -0.4315559, 4.438013, 0, 0.6980392, 1, 1,
0.09225708, 0.005958363, 0.4283309, 0, 0.6941177, 1, 1,
0.09237268, -0.3693465, 1.789361, 0, 0.6862745, 1, 1,
0.09297271, -0.1697853, 0.9597623, 0, 0.682353, 1, 1,
0.09886001, -0.3811731, 2.973743, 0, 0.6745098, 1, 1,
0.1016542, 0.05106347, -0.3422161, 0, 0.6705883, 1, 1,
0.1028303, -0.2068991, 2.510024, 0, 0.6627451, 1, 1,
0.1041041, -0.3533993, 5.706238, 0, 0.6588235, 1, 1,
0.1050308, -0.2319459, 2.848004, 0, 0.6509804, 1, 1,
0.1053861, -0.0236849, 4.325922, 0, 0.6470588, 1, 1,
0.1067513, 0.02884543, 2.117217, 0, 0.6392157, 1, 1,
0.1089752, 0.5496005, -0.7577741, 0, 0.6352941, 1, 1,
0.1098837, 1.642738, 0.5987446, 0, 0.627451, 1, 1,
0.1111113, -0.9358786, 1.261813, 0, 0.6235294, 1, 1,
0.1136745, -0.5301562, 2.907067, 0, 0.6156863, 1, 1,
0.1185058, 0.04497352, 2.635426, 0, 0.6117647, 1, 1,
0.1192716, -1.621671, 2.447644, 0, 0.6039216, 1, 1,
0.1214511, 0.1336939, 0.2374379, 0, 0.5960785, 1, 1,
0.1218393, -0.728336, 2.728493, 0, 0.5921569, 1, 1,
0.1296533, -1.23255, 2.327138, 0, 0.5843138, 1, 1,
0.1394654, -1.250294, 4.503309, 0, 0.5803922, 1, 1,
0.1409069, -0.1175071, 1.641, 0, 0.572549, 1, 1,
0.1410814, -0.2514413, 1.649706, 0, 0.5686275, 1, 1,
0.1421989, 0.1546009, 0.694926, 0, 0.5607843, 1, 1,
0.1434995, 0.4859937, 1.727112, 0, 0.5568628, 1, 1,
0.1446033, 0.2259005, 0.302275, 0, 0.5490196, 1, 1,
0.1451766, 0.1025938, 1.358981, 0, 0.5450981, 1, 1,
0.1506737, -0.4679543, 1.816303, 0, 0.5372549, 1, 1,
0.1534603, 0.5485569, -0.4727677, 0, 0.5333334, 1, 1,
0.1550816, 2.132748, 0.08854106, 0, 0.5254902, 1, 1,
0.1579776, 0.3456793, 0.6128809, 0, 0.5215687, 1, 1,
0.1608128, -0.5375833, 1.496515, 0, 0.5137255, 1, 1,
0.1665296, 0.3436203, 0.2544891, 0, 0.509804, 1, 1,
0.1667964, 0.8450464, 0.2871574, 0, 0.5019608, 1, 1,
0.1701329, -0.8240352, 3.354989, 0, 0.4941176, 1, 1,
0.1725887, 0.9339364, -1.227355, 0, 0.4901961, 1, 1,
0.1772573, 1.787141, -0.1597422, 0, 0.4823529, 1, 1,
0.177932, -0.7402631, 1.929921, 0, 0.4784314, 1, 1,
0.1796644, -0.2587986, 1.154161, 0, 0.4705882, 1, 1,
0.1809622, -0.8455454, 3.004292, 0, 0.4666667, 1, 1,
0.18171, -0.1469689, 3.422396, 0, 0.4588235, 1, 1,
0.1825079, 1.129595, -0.4341241, 0, 0.454902, 1, 1,
0.1826537, 1.15631, 0.5570273, 0, 0.4470588, 1, 1,
0.1831546, 0.3020962, 1.429823, 0, 0.4431373, 1, 1,
0.1835655, -0.2779921, 0.9595066, 0, 0.4352941, 1, 1,
0.1837389, 0.9862355, 1.864461, 0, 0.4313726, 1, 1,
0.1838578, 0.9909449, 1.190386, 0, 0.4235294, 1, 1,
0.1897478, -0.7255912, 3.900141, 0, 0.4196078, 1, 1,
0.190795, 0.1622034, 1.57295, 0, 0.4117647, 1, 1,
0.192249, -2.660549, 3.31831, 0, 0.4078431, 1, 1,
0.1929353, -2.138875, 3.175799, 0, 0.4, 1, 1,
0.1969703, -1.32262, 3.950922, 0, 0.3921569, 1, 1,
0.1979613, -0.5243939, 1.781313, 0, 0.3882353, 1, 1,
0.198119, -1.800285, 3.670122, 0, 0.3803922, 1, 1,
0.1984921, 0.04287413, 1.878948, 0, 0.3764706, 1, 1,
0.2022673, -1.405078, 2.94466, 0, 0.3686275, 1, 1,
0.205469, -0.869445, 2.349018, 0, 0.3647059, 1, 1,
0.2125174, 1.064967, -1.257701, 0, 0.3568628, 1, 1,
0.2137945, -1.002012, 3.505409, 0, 0.3529412, 1, 1,
0.21482, -1.137395, 3.025551, 0, 0.345098, 1, 1,
0.2154145, -0.6493398, 2.67842, 0, 0.3411765, 1, 1,
0.2165471, -1.255007, 3.906717, 0, 0.3333333, 1, 1,
0.2215613, -0.1686387, 3.962113, 0, 0.3294118, 1, 1,
0.2253823, 0.6256547, -0.4720174, 0, 0.3215686, 1, 1,
0.2317668, 1.058627, 1.345296, 0, 0.3176471, 1, 1,
0.2327446, 0.223346, 0.4858233, 0, 0.3098039, 1, 1,
0.236374, -1.079329, 2.518115, 0, 0.3058824, 1, 1,
0.2365756, -0.665302, 3.304316, 0, 0.2980392, 1, 1,
0.2380713, -1.13966, 2.989576, 0, 0.2901961, 1, 1,
0.2443583, 0.1503411, 2.391374, 0, 0.2862745, 1, 1,
0.2455844, -2.555268, 2.978605, 0, 0.2784314, 1, 1,
0.249011, 0.6720126, 0.7425304, 0, 0.2745098, 1, 1,
0.2491222, -0.102471, 2.829926, 0, 0.2666667, 1, 1,
0.2495136, -0.5646404, 1.598807, 0, 0.2627451, 1, 1,
0.2512662, 0.9295536, -0.4707116, 0, 0.254902, 1, 1,
0.2517649, -0.1649903, 2.298614, 0, 0.2509804, 1, 1,
0.2547709, -0.02469661, 2.100398, 0, 0.2431373, 1, 1,
0.2548628, -1.335073, 2.890599, 0, 0.2392157, 1, 1,
0.2560425, -0.5936309, 1.643549, 0, 0.2313726, 1, 1,
0.2673231, -1.460707, 3.559196, 0, 0.227451, 1, 1,
0.2702413, 0.445071, 1.038397, 0, 0.2196078, 1, 1,
0.2732976, -0.5240327, 2.693734, 0, 0.2156863, 1, 1,
0.2740391, -0.09854523, 2.872018, 0, 0.2078431, 1, 1,
0.2747719, -0.2821488, 0.4634798, 0, 0.2039216, 1, 1,
0.2774672, 0.2288954, 1.487729, 0, 0.1960784, 1, 1,
0.2785025, 0.2823147, -0.700497, 0, 0.1882353, 1, 1,
0.2803083, -0.9019223, 1.229944, 0, 0.1843137, 1, 1,
0.2823328, 0.5512938, -0.3255362, 0, 0.1764706, 1, 1,
0.282535, 1.13901, 1.404085, 0, 0.172549, 1, 1,
0.2859173, -0.03872185, 1.449173, 0, 0.1647059, 1, 1,
0.2930856, 0.4089116, 2.072915, 0, 0.1607843, 1, 1,
0.2961984, 0.07931656, 1.272795, 0, 0.1529412, 1, 1,
0.2963083, -1.867807, 4.48545, 0, 0.1490196, 1, 1,
0.2973853, -0.6116302, 4.040152, 0, 0.1411765, 1, 1,
0.3031968, 0.7620432, 0.884729, 0, 0.1372549, 1, 1,
0.3086604, -0.2052542, 0.5651993, 0, 0.1294118, 1, 1,
0.3099552, -0.2289756, 2.428175, 0, 0.1254902, 1, 1,
0.3133515, 1.824868, 1.345516, 0, 0.1176471, 1, 1,
0.3160058, -0.4683647, 2.755673, 0, 0.1137255, 1, 1,
0.3224534, 0.8433908, 0.8253456, 0, 0.1058824, 1, 1,
0.3230038, -1.198897, 2.685565, 0, 0.09803922, 1, 1,
0.3236022, 1.310027, 0.3110956, 0, 0.09411765, 1, 1,
0.3271082, 2.864691, 0.4971513, 0, 0.08627451, 1, 1,
0.3292471, 1.375872, -0.3894373, 0, 0.08235294, 1, 1,
0.3323517, 0.005139602, 2.198159, 0, 0.07450981, 1, 1,
0.333828, -0.2361054, 1.273262, 0, 0.07058824, 1, 1,
0.3340949, -0.9739968, 3.410766, 0, 0.0627451, 1, 1,
0.3375286, 0.6628589, 1.581205, 0, 0.05882353, 1, 1,
0.3395697, -0.0902759, 1.634912, 0, 0.05098039, 1, 1,
0.3416305, 2.179679, 1.313404, 0, 0.04705882, 1, 1,
0.343748, 0.5194784, -0.4307119, 0, 0.03921569, 1, 1,
0.3449675, 0.2679373, 1.02417, 0, 0.03529412, 1, 1,
0.358016, -0.9288291, 2.145177, 0, 0.02745098, 1, 1,
0.3657763, 0.4281151, 0.7447736, 0, 0.02352941, 1, 1,
0.3661848, 2.239418, -0.1862104, 0, 0.01568628, 1, 1,
0.3666172, 0.8465993, 0.2143486, 0, 0.01176471, 1, 1,
0.3681983, -1.122255, 2.702038, 0, 0.003921569, 1, 1,
0.3732562, 1.553799, -0.1079736, 0.003921569, 0, 1, 1,
0.3743935, 0.6243168, -0.1851085, 0.007843138, 0, 1, 1,
0.3760815, 0.5426405, 1.163046, 0.01568628, 0, 1, 1,
0.384937, -1.117831, 3.604185, 0.01960784, 0, 1, 1,
0.3902804, 1.096894, -0.3434256, 0.02745098, 0, 1, 1,
0.3932641, -2.203223, 2.921973, 0.03137255, 0, 1, 1,
0.3951947, 0.09901223, -0.0476869, 0.03921569, 0, 1, 1,
0.3991609, -0.4772385, 1.859704, 0.04313726, 0, 1, 1,
0.4097174, 2.137864, 0.616955, 0.05098039, 0, 1, 1,
0.4112279, 0.5194045, 2.381309, 0.05490196, 0, 1, 1,
0.4123187, -0.3610548, 1.974197, 0.0627451, 0, 1, 1,
0.4139742, -0.7381803, 3.467434, 0.06666667, 0, 1, 1,
0.4191402, 0.3476612, 0.5182667, 0.07450981, 0, 1, 1,
0.4224849, 0.4514868, -0.5077575, 0.07843138, 0, 1, 1,
0.4237706, 2.489586, -0.819289, 0.08627451, 0, 1, 1,
0.4245944, -2.055691, 3.455872, 0.09019608, 0, 1, 1,
0.4261475, -0.006637853, 0.3677749, 0.09803922, 0, 1, 1,
0.4287694, -1.364824, 3.366751, 0.1058824, 0, 1, 1,
0.4365754, 1.468624, 1.762822, 0.1098039, 0, 1, 1,
0.4378678, 1.652732, 0.6166457, 0.1176471, 0, 1, 1,
0.4394896, -2.467736, 2.174485, 0.1215686, 0, 1, 1,
0.4409549, -0.794952, -0.08809645, 0.1294118, 0, 1, 1,
0.4429803, -0.7558194, 2.917868, 0.1333333, 0, 1, 1,
0.4470081, -1.235014, 3.888638, 0.1411765, 0, 1, 1,
0.4487245, -0.2121219, 3.002092, 0.145098, 0, 1, 1,
0.4527748, -0.1144402, 1.427062, 0.1529412, 0, 1, 1,
0.4545782, 0.2790793, 1.235192, 0.1568628, 0, 1, 1,
0.4613868, -0.09201972, 1.15436, 0.1647059, 0, 1, 1,
0.4644388, 0.1030538, 0.8025049, 0.1686275, 0, 1, 1,
0.4670624, 1.034035, 1.870579, 0.1764706, 0, 1, 1,
0.4673275, -0.5861341, 2.321194, 0.1803922, 0, 1, 1,
0.4764651, 0.6216153, 0.4666296, 0.1882353, 0, 1, 1,
0.4799201, -0.9933407, 2.410564, 0.1921569, 0, 1, 1,
0.4799308, -0.8016573, 0.9745898, 0.2, 0, 1, 1,
0.4825322, -0.2634002, 0.5481268, 0.2078431, 0, 1, 1,
0.4831351, 0.1219453, 1.2632, 0.2117647, 0, 1, 1,
0.4840118, 0.3897521, 1.814351, 0.2196078, 0, 1, 1,
0.4876381, -0.6884511, 2.945149, 0.2235294, 0, 1, 1,
0.4896654, 0.960002, 0.5146385, 0.2313726, 0, 1, 1,
0.4903494, 1.661372, 0.6636356, 0.2352941, 0, 1, 1,
0.4933505, -0.399387, 1.123233, 0.2431373, 0, 1, 1,
0.4943414, -0.0424218, 0.8186256, 0.2470588, 0, 1, 1,
0.494603, -1.326591, 3.659642, 0.254902, 0, 1, 1,
0.5036529, 0.7186737, 1.035076, 0.2588235, 0, 1, 1,
0.5062032, -0.6499079, 3.519692, 0.2666667, 0, 1, 1,
0.5077106, 0.2267989, 1.131285, 0.2705882, 0, 1, 1,
0.5088469, -0.3922972, 4.598989, 0.2784314, 0, 1, 1,
0.5103076, -0.9128129, 3.747792, 0.282353, 0, 1, 1,
0.5177377, -0.008964219, 0.8915825, 0.2901961, 0, 1, 1,
0.5195196, 0.4436175, 1.093583, 0.2941177, 0, 1, 1,
0.523841, -0.7175536, 5.522184, 0.3019608, 0, 1, 1,
0.5253317, 2.246205, 1.876166, 0.3098039, 0, 1, 1,
0.5340601, -0.6641039, 0.483706, 0.3137255, 0, 1, 1,
0.5349081, -0.5010383, 0.3202322, 0.3215686, 0, 1, 1,
0.5391666, -0.6782752, 1.201461, 0.3254902, 0, 1, 1,
0.5406036, -0.3156809, 2.273891, 0.3333333, 0, 1, 1,
0.5422439, 0.6722631, -0.08997938, 0.3372549, 0, 1, 1,
0.5458948, 0.9093447, 1.156923, 0.345098, 0, 1, 1,
0.5477228, -1.347376, 2.821625, 0.3490196, 0, 1, 1,
0.5484596, 0.02207846, 1.004071, 0.3568628, 0, 1, 1,
0.5532501, -0.5103047, 1.150099, 0.3607843, 0, 1, 1,
0.5553641, 2.415253, 0.2532814, 0.3686275, 0, 1, 1,
0.5691952, -0.2531227, 0.3369412, 0.372549, 0, 1, 1,
0.5708203, -0.1616375, 0.7626782, 0.3803922, 0, 1, 1,
0.5729252, 1.779359, 1.726573, 0.3843137, 0, 1, 1,
0.5735825, 0.5635265, 1.970818, 0.3921569, 0, 1, 1,
0.5757899, 0.2127876, 1.625739, 0.3960784, 0, 1, 1,
0.5760661, 1.48595, -0.6490818, 0.4039216, 0, 1, 1,
0.590086, 2.720683, 0.4423694, 0.4117647, 0, 1, 1,
0.5918992, 0.2283546, 2.985329, 0.4156863, 0, 1, 1,
0.5966217, 1.646001, 0.4031402, 0.4235294, 0, 1, 1,
0.5969078, -0.7981907, 3.086977, 0.427451, 0, 1, 1,
0.5981203, -0.23446, 3.902864, 0.4352941, 0, 1, 1,
0.5982879, -0.1986149, 2.058148, 0.4392157, 0, 1, 1,
0.6006398, 1.73735, 1.033522, 0.4470588, 0, 1, 1,
0.6050699, 0.4484892, -0.2815934, 0.4509804, 0, 1, 1,
0.6075802, 0.9294909, -1.039748, 0.4588235, 0, 1, 1,
0.6108438, 0.8426155, -0.3743011, 0.4627451, 0, 1, 1,
0.6137472, 0.7276512, 1.143342, 0.4705882, 0, 1, 1,
0.6162846, -0.3708769, 0.8857116, 0.4745098, 0, 1, 1,
0.6181453, -1.806973, 0.7859082, 0.4823529, 0, 1, 1,
0.618288, -0.4069288, 2.107108, 0.4862745, 0, 1, 1,
0.6220076, -1.499195, 3.407542, 0.4941176, 0, 1, 1,
0.6221147, 0.9328514, 0.08833797, 0.5019608, 0, 1, 1,
0.6342794, -0.7773923, 3.514618, 0.5058824, 0, 1, 1,
0.6374959, -2.093611, 2.571316, 0.5137255, 0, 1, 1,
0.6375126, -1.683613, 0.8993298, 0.5176471, 0, 1, 1,
0.6389029, 1.271823, 1.003159, 0.5254902, 0, 1, 1,
0.6440772, -0.8605315, 2.658835, 0.5294118, 0, 1, 1,
0.6457152, -0.5745943, 1.926872, 0.5372549, 0, 1, 1,
0.6536075, 0.944957, 1.10342, 0.5411765, 0, 1, 1,
0.654519, -0.5549005, 2.7322, 0.5490196, 0, 1, 1,
0.6576866, 0.4268282, 1.255992, 0.5529412, 0, 1, 1,
0.6672394, -1.436906, 1.91265, 0.5607843, 0, 1, 1,
0.6688064, -0.363799, 1.207268, 0.5647059, 0, 1, 1,
0.6768539, -0.6333027, 2.39146, 0.572549, 0, 1, 1,
0.6844593, -0.2669942, 1.417063, 0.5764706, 0, 1, 1,
0.6847115, 1.447193, -0.1434457, 0.5843138, 0, 1, 1,
0.689385, 0.2344893, 0.6797985, 0.5882353, 0, 1, 1,
0.6904132, 0.1145672, -0.0421817, 0.5960785, 0, 1, 1,
0.6907812, -1.105638, 2.194716, 0.6039216, 0, 1, 1,
0.6947719, 0.4718025, 2.732295, 0.6078432, 0, 1, 1,
0.6953367, -0.6323243, 1.920063, 0.6156863, 0, 1, 1,
0.6954244, 0.4785255, 0.7845063, 0.6196079, 0, 1, 1,
0.7047977, -1.260599, 1.578153, 0.627451, 0, 1, 1,
0.7060903, 1.519495, -0.3261369, 0.6313726, 0, 1, 1,
0.7061598, 0.5302112, 0.2681737, 0.6392157, 0, 1, 1,
0.7070789, 0.09265801, 0.02896611, 0.6431373, 0, 1, 1,
0.7092754, 0.7589292, 0.6861297, 0.6509804, 0, 1, 1,
0.7100376, 1.123632, -0.6003014, 0.654902, 0, 1, 1,
0.7144523, -0.08048999, 0.1436255, 0.6627451, 0, 1, 1,
0.7147415, -1.148787, 2.881859, 0.6666667, 0, 1, 1,
0.7159677, 0.7368047, 1.773694, 0.6745098, 0, 1, 1,
0.7169148, 1.901264, -1.601818, 0.6784314, 0, 1, 1,
0.7220614, -1.586445, 4.099758, 0.6862745, 0, 1, 1,
0.7287982, 0.9898834, 2.67801, 0.6901961, 0, 1, 1,
0.7296315, -0.4453388, 1.769133, 0.6980392, 0, 1, 1,
0.7332064, 0.5555084, 2.243361, 0.7058824, 0, 1, 1,
0.7369806, 0.2929443, 0.2454483, 0.7098039, 0, 1, 1,
0.7434741, 0.8730755, 1.153602, 0.7176471, 0, 1, 1,
0.7467022, 0.9512983, 0.7675334, 0.7215686, 0, 1, 1,
0.7486699, -1.687385, 1.850857, 0.7294118, 0, 1, 1,
0.7490966, 1.684241, -1.095676, 0.7333333, 0, 1, 1,
0.7501364, 1.442755, -1.234749, 0.7411765, 0, 1, 1,
0.7503256, -1.176107, 1.185845, 0.7450981, 0, 1, 1,
0.7621695, 0.8120221, 1.27581, 0.7529412, 0, 1, 1,
0.7667637, -0.2290976, 1.420999, 0.7568628, 0, 1, 1,
0.7671482, 0.4250565, -0.7169966, 0.7647059, 0, 1, 1,
0.7737703, 0.06483355, 0.5294895, 0.7686275, 0, 1, 1,
0.7751163, -0.2404457, 0.8998438, 0.7764706, 0, 1, 1,
0.7774984, 0.9011155, 1.751154, 0.7803922, 0, 1, 1,
0.7786486, -0.3837922, 0.3876247, 0.7882353, 0, 1, 1,
0.7855906, -0.7452945, 3.914038, 0.7921569, 0, 1, 1,
0.7896547, -0.6908909, 1.35825, 0.8, 0, 1, 1,
0.799311, -1.181607, 2.770235, 0.8078431, 0, 1, 1,
0.8074309, -1.952462, 1.792139, 0.8117647, 0, 1, 1,
0.8183656, 1.849361, 1.152149, 0.8196079, 0, 1, 1,
0.8206339, -0.4160399, 2.018068, 0.8235294, 0, 1, 1,
0.8292833, 1.552548, 0.3976435, 0.8313726, 0, 1, 1,
0.8323374, -0.5550137, 2.952022, 0.8352941, 0, 1, 1,
0.8360376, 1.511139, 0.945766, 0.8431373, 0, 1, 1,
0.83724, 2.426451, 0.4280578, 0.8470588, 0, 1, 1,
0.8415329, -0.0976647, 0.8103566, 0.854902, 0, 1, 1,
0.8416103, -1.687162, 1.890759, 0.8588235, 0, 1, 1,
0.8431152, 0.7681875, 2.092668, 0.8666667, 0, 1, 1,
0.8434805, -1.054502, 2.8907, 0.8705882, 0, 1, 1,
0.8435746, 0.4247601, 1.41633, 0.8784314, 0, 1, 1,
0.8481432, 0.1425107, 3.253884, 0.8823529, 0, 1, 1,
0.851104, -0.8041748, 3.538476, 0.8901961, 0, 1, 1,
0.8526326, 0.8382076, 3.537792, 0.8941177, 0, 1, 1,
0.8595498, 0.2496253, 2.274162, 0.9019608, 0, 1, 1,
0.8613758, 0.1709905, 3.858538, 0.9098039, 0, 1, 1,
0.8623224, -1.709916, 3.667443, 0.9137255, 0, 1, 1,
0.8697107, -0.1366588, 1.460248, 0.9215686, 0, 1, 1,
0.8703961, -0.6131736, 3.248476, 0.9254902, 0, 1, 1,
0.8761106, -0.3419919, 0.4575388, 0.9333333, 0, 1, 1,
0.8824174, -0.4662236, 1.561841, 0.9372549, 0, 1, 1,
0.8846231, -1.512775, 2.673693, 0.945098, 0, 1, 1,
0.8849692, 0.2959508, -0.936555, 0.9490196, 0, 1, 1,
0.8871514, -0.6095032, 1.86883, 0.9568627, 0, 1, 1,
0.8896107, -1.661904, 1.482117, 0.9607843, 0, 1, 1,
0.8969144, 0.9953796, 2.090035, 0.9686275, 0, 1, 1,
0.8972324, 0.4022672, 2.029999, 0.972549, 0, 1, 1,
0.8974696, 0.5991421, 3.022552, 0.9803922, 0, 1, 1,
0.903242, -1.04743, 2.075046, 0.9843137, 0, 1, 1,
0.9045401, 0.1138762, 1.429105, 0.9921569, 0, 1, 1,
0.9078851, 0.5033479, 1.437045, 0.9960784, 0, 1, 1,
0.9151418, -0.8879834, 2.122487, 1, 0, 0.9960784, 1,
0.9154544, 0.4740561, 0.3543371, 1, 0, 0.9882353, 1,
0.9173534, -1.228239, 2.312046, 1, 0, 0.9843137, 1,
0.9201714, -0.8858542, 3.192019, 1, 0, 0.9764706, 1,
0.9228709, 1.093784, 0.0528654, 1, 0, 0.972549, 1,
0.9280752, -0.2295489, 2.228271, 1, 0, 0.9647059, 1,
0.9287264, -0.6705037, 1.898856, 1, 0, 0.9607843, 1,
0.9288515, 1.568985, -0.5212618, 1, 0, 0.9529412, 1,
0.9319656, -0.7230956, 1.660899, 1, 0, 0.9490196, 1,
0.9338661, 0.3362275, 1.762945, 1, 0, 0.9411765, 1,
0.9370366, -0.1948238, 0.9049443, 1, 0, 0.9372549, 1,
0.9385247, -0.9735175, 1.454762, 1, 0, 0.9294118, 1,
0.948118, 1.701933, 1.07548, 1, 0, 0.9254902, 1,
0.9496815, -0.7002132, 1.565468, 1, 0, 0.9176471, 1,
0.9534845, 0.2857669, 0.5612794, 1, 0, 0.9137255, 1,
0.9544869, -1.730296, 3.166804, 1, 0, 0.9058824, 1,
0.9657156, 0.9545016, 0.1360059, 1, 0, 0.9019608, 1,
0.9659684, -0.2608115, 1.816081, 1, 0, 0.8941177, 1,
0.9767983, -0.7099649, 2.435083, 1, 0, 0.8862745, 1,
0.9784663, 1.687271, 0.3953636, 1, 0, 0.8823529, 1,
0.9815698, 0.7686622, 1.213257, 1, 0, 0.8745098, 1,
0.9853982, -0.5570866, 0.2668511, 1, 0, 0.8705882, 1,
0.9863296, -0.1038548, 1.348916, 1, 0, 0.8627451, 1,
0.998333, 0.6431912, -0.01282229, 1, 0, 0.8588235, 1,
1.000728, 1.202268, 1.399879, 1, 0, 0.8509804, 1,
1.001108, -1.273322, 1.722541, 1, 0, 0.8470588, 1,
1.009021, 1.126095, 1.061347, 1, 0, 0.8392157, 1,
1.009971, -0.4734136, 1.124196, 1, 0, 0.8352941, 1,
1.014147, 0.02304825, 0.7812591, 1, 0, 0.827451, 1,
1.016202, 0.1919881, 0.4760736, 1, 0, 0.8235294, 1,
1.017936, 0.845944, 1.709596, 1, 0, 0.8156863, 1,
1.025602, -0.9020892, 2.538968, 1, 0, 0.8117647, 1,
1.027215, -0.4384536, 3.007981, 1, 0, 0.8039216, 1,
1.029928, 0.09490674, 1.511419, 1, 0, 0.7960784, 1,
1.031363, 0.260212, 0.8446841, 1, 0, 0.7921569, 1,
1.032294, -0.03241875, 1.497479, 1, 0, 0.7843137, 1,
1.032898, -0.3988958, 3.755283, 1, 0, 0.7803922, 1,
1.034818, -0.01672345, 0.2624499, 1, 0, 0.772549, 1,
1.039451, -0.7888538, 0.6982921, 1, 0, 0.7686275, 1,
1.040128, -0.2490223, 1.249072, 1, 0, 0.7607843, 1,
1.044491, 0.1583846, 2.733494, 1, 0, 0.7568628, 1,
1.049973, -1.428588, 2.491746, 1, 0, 0.7490196, 1,
1.066794, -0.3619435, 1.983159, 1, 0, 0.7450981, 1,
1.073893, -0.2193235, 0.9366612, 1, 0, 0.7372549, 1,
1.097269, 0.2411752, 2.353046, 1, 0, 0.7333333, 1,
1.104012, 1.330609, 1.197041, 1, 0, 0.7254902, 1,
1.109334, -1.738217, 2.91039, 1, 0, 0.7215686, 1,
1.117674, 0.3571041, 1.218011, 1, 0, 0.7137255, 1,
1.118454, -2.926531, 1.649346, 1, 0, 0.7098039, 1,
1.120242, 0.5859585, 1.359255, 1, 0, 0.7019608, 1,
1.120431, -0.9312326, 3.607364, 1, 0, 0.6941177, 1,
1.120884, 0.9348115, 0.5048892, 1, 0, 0.6901961, 1,
1.126737, 0.602859, 2.226336, 1, 0, 0.682353, 1,
1.133153, 0.1298722, -0.05512984, 1, 0, 0.6784314, 1,
1.136919, -0.987632, 1.052742, 1, 0, 0.6705883, 1,
1.137989, -0.001731496, 0.7814962, 1, 0, 0.6666667, 1,
1.141069, -0.7772221, 2.955181, 1, 0, 0.6588235, 1,
1.141567, 0.3687444, 1.874448, 1, 0, 0.654902, 1,
1.145606, 0.1107958, 2.405903, 1, 0, 0.6470588, 1,
1.147475, -2.782737, 2.490769, 1, 0, 0.6431373, 1,
1.162629, -0.1178199, 2.504551, 1, 0, 0.6352941, 1,
1.172292, -0.7964036, 1.405421, 1, 0, 0.6313726, 1,
1.174895, 1.053307, 0.2886123, 1, 0, 0.6235294, 1,
1.193437, 0.4697204, -0.08791335, 1, 0, 0.6196079, 1,
1.196268, -0.6929237, 2.147568, 1, 0, 0.6117647, 1,
1.205188, -0.4286244, 2.133508, 1, 0, 0.6078432, 1,
1.212582, 0.5842656, 1.09831, 1, 0, 0.6, 1,
1.2194, 0.3954146, -0.163662, 1, 0, 0.5921569, 1,
1.222745, 0.1229287, 0.3913705, 1, 0, 0.5882353, 1,
1.232324, -0.5927187, 1.873003, 1, 0, 0.5803922, 1,
1.232883, -0.01719695, 0.8355235, 1, 0, 0.5764706, 1,
1.239966, -1.348238, 3.697319, 1, 0, 0.5686275, 1,
1.24232, -1.963133, 2.800298, 1, 0, 0.5647059, 1,
1.244082, -0.3117016, 2.567997, 1, 0, 0.5568628, 1,
1.266054, -0.6074537, 2.910125, 1, 0, 0.5529412, 1,
1.282353, 0.6057627, 1.063235, 1, 0, 0.5450981, 1,
1.285904, -0.4240638, 2.091527, 1, 0, 0.5411765, 1,
1.299184, 0.5589927, 2.920685, 1, 0, 0.5333334, 1,
1.29978, -1.138928, 2.619401, 1, 0, 0.5294118, 1,
1.314714, -0.5092511, 0.5882488, 1, 0, 0.5215687, 1,
1.317769, 0.2783717, 0.7517816, 1, 0, 0.5176471, 1,
1.321592, 1.420021, -0.1340907, 1, 0, 0.509804, 1,
1.334088, -0.8091572, 1.019497, 1, 0, 0.5058824, 1,
1.339026, -1.03142, 4.092821, 1, 0, 0.4980392, 1,
1.344567, 0.3561961, 0.482007, 1, 0, 0.4901961, 1,
1.354025, 1.780197, 2.362827, 1, 0, 0.4862745, 1,
1.357232, -1.279569, 2.033598, 1, 0, 0.4784314, 1,
1.361275, 0.7487575, -0.1814657, 1, 0, 0.4745098, 1,
1.379996, 0.3143692, 1.328249, 1, 0, 0.4666667, 1,
1.380791, -1.854425, 2.460539, 1, 0, 0.4627451, 1,
1.381796, -0.2124545, 1.03227, 1, 0, 0.454902, 1,
1.391441, 1.439969, 0.7282194, 1, 0, 0.4509804, 1,
1.39323, -0.5972037, 1.69491, 1, 0, 0.4431373, 1,
1.39432, 2.214497, 0.9859161, 1, 0, 0.4392157, 1,
1.398628, 0.5873815, 1.043005, 1, 0, 0.4313726, 1,
1.404391, 2.405024, -0.3754191, 1, 0, 0.427451, 1,
1.412007, 1.56673, -0.2848328, 1, 0, 0.4196078, 1,
1.417192, 1.041786, 1.140993, 1, 0, 0.4156863, 1,
1.417253, 1.873466, 0.3101957, 1, 0, 0.4078431, 1,
1.427993, -2.119112, 1.938936, 1, 0, 0.4039216, 1,
1.429414, -0.2819307, 2.676474, 1, 0, 0.3960784, 1,
1.431651, -0.08042371, 0.9719715, 1, 0, 0.3882353, 1,
1.449061, 0.3907856, 2.423581, 1, 0, 0.3843137, 1,
1.471527, 1.13799, 1.383068, 1, 0, 0.3764706, 1,
1.482547, 0.5693521, 1.362444, 1, 0, 0.372549, 1,
1.504124, 1.231241, 1.152601, 1, 0, 0.3647059, 1,
1.523959, 0.3615395, 1.762602, 1, 0, 0.3607843, 1,
1.538944, 0.5055394, 0.8982085, 1, 0, 0.3529412, 1,
1.592508, 0.242737, 0.6067619, 1, 0, 0.3490196, 1,
1.597611, -0.6904361, 1.603785, 1, 0, 0.3411765, 1,
1.604787, -0.5978023, 1.302327, 1, 0, 0.3372549, 1,
1.61303, 0.24005, 3.030591, 1, 0, 0.3294118, 1,
1.616504, -0.957499, 1.802467, 1, 0, 0.3254902, 1,
1.61851, -1.157221, 3.565054, 1, 0, 0.3176471, 1,
1.622521, -1.020179, 1.617033, 1, 0, 0.3137255, 1,
1.62327, 0.4953547, -0.6826534, 1, 0, 0.3058824, 1,
1.649127, 0.02357796, 0.7510408, 1, 0, 0.2980392, 1,
1.655748, 1.420969, 0.7026471, 1, 0, 0.2941177, 1,
1.656529, 0.5797664, 0.5343004, 1, 0, 0.2862745, 1,
1.66045, 0.5711666, 1.5244, 1, 0, 0.282353, 1,
1.693991, -0.3074042, 1.695902, 1, 0, 0.2745098, 1,
1.715162, 1.210669, 2.068788, 1, 0, 0.2705882, 1,
1.718074, 0.294798, 0.0922238, 1, 0, 0.2627451, 1,
1.733033, 0.9163043, 1.065916, 1, 0, 0.2588235, 1,
1.734711, 1.650171, -0.07091974, 1, 0, 0.2509804, 1,
1.735571, 0.2801754, 2.516907, 1, 0, 0.2470588, 1,
1.755643, -0.757713, 0.984275, 1, 0, 0.2392157, 1,
1.780625, 0.1268204, 1.809149, 1, 0, 0.2352941, 1,
1.792064, 1.377874, 1.140508, 1, 0, 0.227451, 1,
1.798099, 0.7699208, 0.5523494, 1, 0, 0.2235294, 1,
1.830891, 0.5923966, 1.032203, 1, 0, 0.2156863, 1,
1.839367, -0.6289067, 2.685453, 1, 0, 0.2117647, 1,
1.848649, -0.4120297, 0.1655531, 1, 0, 0.2039216, 1,
1.851343, 0.1762565, 1.613683, 1, 0, 0.1960784, 1,
1.854035, -0.7485118, 1.61052, 1, 0, 0.1921569, 1,
1.864791, 0.1521302, 0.7582833, 1, 0, 0.1843137, 1,
1.893542, 0.3457468, 1.760365, 1, 0, 0.1803922, 1,
1.894221, -0.2839891, 2.919969, 1, 0, 0.172549, 1,
1.897561, -0.2038362, 2.877615, 1, 0, 0.1686275, 1,
1.932237, -1.309685, 2.99351, 1, 0, 0.1607843, 1,
1.998618, -1.11437, 2.212906, 1, 0, 0.1568628, 1,
2.022118, 0.01605262, 3.316922, 1, 0, 0.1490196, 1,
2.038056, 1.09702, 0.2495811, 1, 0, 0.145098, 1,
2.046739, -0.1026332, 1.706603, 1, 0, 0.1372549, 1,
2.055869, 0.1907039, 1.381802, 1, 0, 0.1333333, 1,
2.07882, -1.293025, 2.888178, 1, 0, 0.1254902, 1,
2.091303, -0.2605492, 1.821667, 1, 0, 0.1215686, 1,
2.099254, -0.2271758, 1.049586, 1, 0, 0.1137255, 1,
2.100358, -0.6171613, 2.488618, 1, 0, 0.1098039, 1,
2.103318, -0.8297348, 2.046057, 1, 0, 0.1019608, 1,
2.12311, 0.1975719, 3.59087, 1, 0, 0.09411765, 1,
2.128727, 1.167788, 2.19618, 1, 0, 0.09019608, 1,
2.13536, -1.385051, 3.518951, 1, 0, 0.08235294, 1,
2.161062, 0.2265826, 3.643263, 1, 0, 0.07843138, 1,
2.179473, -0.1909115, 1.346731, 1, 0, 0.07058824, 1,
2.259088, 0.4174758, 1.223508, 1, 0, 0.06666667, 1,
2.281713, -0.2449812, 1.656135, 1, 0, 0.05882353, 1,
2.454211, 1.011042, 3.357068, 1, 0, 0.05490196, 1,
2.458325, 1.155778, 1.982779, 1, 0, 0.04705882, 1,
2.489326, -0.3065195, 1.744509, 1, 0, 0.04313726, 1,
2.590282, 0.6750236, 0.7263883, 1, 0, 0.03529412, 1,
2.74053, -1.890597, 3.694426, 1, 0, 0.03137255, 1,
2.745215, -0.7808018, 0.8638061, 1, 0, 0.02352941, 1,
2.83482, -0.1356909, 2.241999, 1, 0, 0.01960784, 1,
2.886032, 0.7112532, 2.493117, 1, 0, 0.01176471, 1,
3.073341, -0.1741454, 0.9359001, 1, 0, 0.007843138, 1
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
0.117262, -4.17452, -6.907917, 0, -0.5, 0.5, 0.5,
0.117262, -4.17452, -6.907917, 1, -0.5, 0.5, 0.5,
0.117262, -4.17452, -6.907917, 1, 1.5, 0.5, 0.5,
0.117262, -4.17452, -6.907917, 0, 1.5, 0.5, 0.5
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
-3.840928, -0.1448051, -6.907917, 0, -0.5, 0.5, 0.5,
-3.840928, -0.1448051, -6.907917, 1, -0.5, 0.5, 0.5,
-3.840928, -0.1448051, -6.907917, 1, 1.5, 0.5, 0.5,
-3.840928, -0.1448051, -6.907917, 0, 1.5, 0.5, 0.5
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
-3.840928, -4.17452, 0.3132691, 0, -0.5, 0.5, 0.5,
-3.840928, -4.17452, 0.3132691, 1, -0.5, 0.5, 0.5,
-3.840928, -4.17452, 0.3132691, 1, 1.5, 0.5, 0.5,
-3.840928, -4.17452, 0.3132691, 0, 1.5, 0.5, 0.5
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
-2, -3.244586, -5.241489,
3, -3.244586, -5.241489,
-2, -3.244586, -5.241489,
-2, -3.399575, -5.519227,
-1, -3.244586, -5.241489,
-1, -3.399575, -5.519227,
0, -3.244586, -5.241489,
0, -3.399575, -5.519227,
1, -3.244586, -5.241489,
1, -3.399575, -5.519227,
2, -3.244586, -5.241489,
2, -3.399575, -5.519227,
3, -3.244586, -5.241489,
3, -3.399575, -5.519227
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
-2, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
-2, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
-2, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
-2, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5,
-1, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
-1, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
-1, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
-1, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5,
0, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
0, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
0, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
0, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5,
1, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
1, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
1, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
1, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5,
2, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
2, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
2, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
2, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5,
3, -3.709553, -6.074703, 0, -0.5, 0.5, 0.5,
3, -3.709553, -6.074703, 1, -0.5, 0.5, 0.5,
3, -3.709553, -6.074703, 1, 1.5, 0.5, 0.5,
3, -3.709553, -6.074703, 0, 1.5, 0.5, 0.5
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
-2.9275, -3, -5.241489,
-2.9275, 2, -5.241489,
-2.9275, -3, -5.241489,
-3.079738, -3, -5.519227,
-2.9275, -2, -5.241489,
-3.079738, -2, -5.519227,
-2.9275, -1, -5.241489,
-3.079738, -1, -5.519227,
-2.9275, 0, -5.241489,
-3.079738, 0, -5.519227,
-2.9275, 1, -5.241489,
-3.079738, 1, -5.519227,
-2.9275, 2, -5.241489,
-3.079738, 2, -5.519227
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
-3.384214, -3, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, -3, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, -3, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, -3, -6.074703, 0, 1.5, 0.5, 0.5,
-3.384214, -2, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, -2, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, -2, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, -2, -6.074703, 0, 1.5, 0.5, 0.5,
-3.384214, -1, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, -1, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, -1, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, -1, -6.074703, 0, 1.5, 0.5, 0.5,
-3.384214, 0, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, 0, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, 0, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, 0, -6.074703, 0, 1.5, 0.5, 0.5,
-3.384214, 1, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, 1, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, 1, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, 1, -6.074703, 0, 1.5, 0.5, 0.5,
-3.384214, 2, -6.074703, 0, -0.5, 0.5, 0.5,
-3.384214, 2, -6.074703, 1, -0.5, 0.5, 0.5,
-3.384214, 2, -6.074703, 1, 1.5, 0.5, 0.5,
-3.384214, 2, -6.074703, 0, 1.5, 0.5, 0.5
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
-2.9275, -3.244586, -4,
-2.9275, -3.244586, 4,
-2.9275, -3.244586, -4,
-3.079738, -3.399575, -4,
-2.9275, -3.244586, -2,
-3.079738, -3.399575, -2,
-2.9275, -3.244586, 0,
-3.079738, -3.399575, 0,
-2.9275, -3.244586, 2,
-3.079738, -3.399575, 2,
-2.9275, -3.244586, 4,
-3.079738, -3.399575, 4
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
-3.384214, -3.709553, -4, 0, -0.5, 0.5, 0.5,
-3.384214, -3.709553, -4, 1, -0.5, 0.5, 0.5,
-3.384214, -3.709553, -4, 1, 1.5, 0.5, 0.5,
-3.384214, -3.709553, -4, 0, 1.5, 0.5, 0.5,
-3.384214, -3.709553, -2, 0, -0.5, 0.5, 0.5,
-3.384214, -3.709553, -2, 1, -0.5, 0.5, 0.5,
-3.384214, -3.709553, -2, 1, 1.5, 0.5, 0.5,
-3.384214, -3.709553, -2, 0, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 0, 0, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 0, 1, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 0, 1, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 0, 0, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 2, 0, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 2, 1, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 2, 1, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 2, 0, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 4, 0, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 4, 1, -0.5, 0.5, 0.5,
-3.384214, -3.709553, 4, 1, 1.5, 0.5, 0.5,
-3.384214, -3.709553, 4, 0, 1.5, 0.5, 0.5
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
-2.9275, -3.244586, -5.241489,
-2.9275, 2.954976, -5.241489,
-2.9275, -3.244586, 5.868027,
-2.9275, 2.954976, 5.868027,
-2.9275, -3.244586, -5.241489,
-2.9275, -3.244586, 5.868027,
-2.9275, 2.954976, -5.241489,
-2.9275, 2.954976, 5.868027,
-2.9275, -3.244586, -5.241489,
3.162024, -3.244586, -5.241489,
-2.9275, -3.244586, 5.868027,
3.162024, -3.244586, 5.868027,
-2.9275, 2.954976, -5.241489,
3.162024, 2.954976, -5.241489,
-2.9275, 2.954976, 5.868027,
3.162024, 2.954976, 5.868027,
3.162024, -3.244586, -5.241489,
3.162024, 2.954976, -5.241489,
3.162024, -3.244586, 5.868027,
3.162024, 2.954976, 5.868027,
3.162024, -3.244586, -5.241489,
3.162024, -3.244586, 5.868027,
3.162024, 2.954976, -5.241489,
3.162024, 2.954976, 5.868027
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
var radius = 7.531554;
var distance = 33.50873;
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
mvMatrix.translate( -0.117262, 0.1448051, -0.3132691 );
mvMatrix.scale( 1.337258, 1.313522, 0.7329989 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50873);
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
Chlortoluron<-read.table("Chlortoluron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Chlortoluron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Chlortoluron' not found
```

```r
y<-Chlortoluron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Chlortoluron' not found
```

```r
z<-Chlortoluron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Chlortoluron' not found
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
-2.838817, 2.005322, -0.9068543, 0, 0, 1, 1, 1,
-2.820428, -0.2540234, -2.889955, 1, 0, 0, 1, 1,
-2.464001, 0.5692635, -0.7822813, 1, 0, 0, 1, 1,
-2.408711, -0.602832, 0.3269815, 1, 0, 0, 1, 1,
-2.403888, -0.1850805, -0.9931413, 1, 0, 0, 1, 1,
-2.319417, 1.949171, 0.6159976, 1, 0, 0, 1, 1,
-2.305169, -1.166242, -0.3333619, 0, 0, 0, 1, 1,
-2.303556, 2.323615, -0.7148736, 0, 0, 0, 1, 1,
-2.294377, 1.216293, 1.10926, 0, 0, 0, 1, 1,
-2.221142, 0.9936618, -0.699579, 0, 0, 0, 1, 1,
-2.209091, 0.7056004, -1.207071, 0, 0, 0, 1, 1,
-2.206699, -2.107551, -3.210444, 0, 0, 0, 1, 1,
-2.175437, -0.7915342, -1.697038, 0, 0, 0, 1, 1,
-2.154387, 2.213155, -0.7716755, 1, 1, 1, 1, 1,
-2.151325, 0.8773324, -0.8979222, 1, 1, 1, 1, 1,
-2.149456, 0.9169662, -2.511128, 1, 1, 1, 1, 1,
-2.144842, 1.219756, -0.9350466, 1, 1, 1, 1, 1,
-2.142589, 1.000097, -2.582254, 1, 1, 1, 1, 1,
-2.125007, 0.5169335, -1.175283, 1, 1, 1, 1, 1,
-2.113168, -0.5717857, -2.15768, 1, 1, 1, 1, 1,
-2.10415, 1.546796, -1.284974, 1, 1, 1, 1, 1,
-2.041257, 1.807209, 0.7045991, 1, 1, 1, 1, 1,
-2.031739, 0.5662845, -0.2728203, 1, 1, 1, 1, 1,
-2.028495, -1.179038, -2.860513, 1, 1, 1, 1, 1,
-2.009978, -0.2937048, -1.121081, 1, 1, 1, 1, 1,
-2.001858, 0.4545505, 0.7246631, 1, 1, 1, 1, 1,
-1.997898, -1.638264, -2.749983, 1, 1, 1, 1, 1,
-1.962607, -0.4137054, -1.725996, 1, 1, 1, 1, 1,
-1.958274, -0.4639591, -2.468001, 0, 0, 1, 1, 1,
-1.938829, 0.5487072, -0.8814438, 1, 0, 0, 1, 1,
-1.929407, 1.683831, -1.075466, 1, 0, 0, 1, 1,
-1.91924, -1.347272, -0.9759409, 1, 0, 0, 1, 1,
-1.915912, -0.2505143, -2.081888, 1, 0, 0, 1, 1,
-1.901442, 0.4872921, -2.529405, 1, 0, 0, 1, 1,
-1.900198, -1.092207, -1.075211, 0, 0, 0, 1, 1,
-1.845437, 1.903358, -1.983286, 0, 0, 0, 1, 1,
-1.843999, 0.4717834, -0.8490744, 0, 0, 0, 1, 1,
-1.841319, 0.5627628, -1.750026, 0, 0, 0, 1, 1,
-1.838075, 1.009477, -3.362868, 0, 0, 0, 1, 1,
-1.831447, -0.960735, -0.5155473, 0, 0, 0, 1, 1,
-1.825722, -0.5433208, -1.396856, 0, 0, 0, 1, 1,
-1.813947, -0.3150827, -0.9379069, 1, 1, 1, 1, 1,
-1.810172, 0.05956968, -2.317643, 1, 1, 1, 1, 1,
-1.775209, -2.500771, -1.326632, 1, 1, 1, 1, 1,
-1.765727, -1.567813, -0.376822, 1, 1, 1, 1, 1,
-1.759768, 0.8712206, -0.7128027, 1, 1, 1, 1, 1,
-1.750735, -0.2022985, -1.394546, 1, 1, 1, 1, 1,
-1.740962, -0.5815758, -2.517099, 1, 1, 1, 1, 1,
-1.710067, 0.779239, -0.5702471, 1, 1, 1, 1, 1,
-1.709322, -0.696766, -1.84524, 1, 1, 1, 1, 1,
-1.708465, -2.224508, -1.813253, 1, 1, 1, 1, 1,
-1.694468, -0.1911997, -1.398207, 1, 1, 1, 1, 1,
-1.687162, -2.333057, -3.203214, 1, 1, 1, 1, 1,
-1.681139, 0.8878005, -1.901804, 1, 1, 1, 1, 1,
-1.674053, 2.419256, -2.143294, 1, 1, 1, 1, 1,
-1.668113, 1.436534, -0.8397154, 1, 1, 1, 1, 1,
-1.658185, -0.4980475, -1.935361, 0, 0, 1, 1, 1,
-1.656099, 0.8115863, -0.2404079, 1, 0, 0, 1, 1,
-1.643352, 0.2830491, -1.287173, 1, 0, 0, 1, 1,
-1.641828, -1.637778, -1.788043, 1, 0, 0, 1, 1,
-1.631784, -1.624672, -4.478954, 1, 0, 0, 1, 1,
-1.617008, -0.4145932, -1.60107, 1, 0, 0, 1, 1,
-1.616037, 0.4826772, -1.454001, 0, 0, 0, 1, 1,
-1.614302, 0.5729884, -0.8879506, 0, 0, 0, 1, 1,
-1.599415, 0.8702151, -1.023509, 0, 0, 0, 1, 1,
-1.595302, -1.595663, -3.313498, 0, 0, 0, 1, 1,
-1.588914, -1.162556, -2.335988, 0, 0, 0, 1, 1,
-1.573956, -0.1148932, -2.051846, 0, 0, 0, 1, 1,
-1.570198, -0.06173272, -1.616555, 0, 0, 0, 1, 1,
-1.560429, -1.268507, -1.13243, 1, 1, 1, 1, 1,
-1.558413, -1.303549, -2.631924, 1, 1, 1, 1, 1,
-1.542478, 1.627341, -0.05357122, 1, 1, 1, 1, 1,
-1.535769, 0.7792738, -1.614044, 1, 1, 1, 1, 1,
-1.523467, -0.452886, -3.157691, 1, 1, 1, 1, 1,
-1.521865, 0.640004, -1.892046, 1, 1, 1, 1, 1,
-1.509501, 1.572146, -0.2410322, 1, 1, 1, 1, 1,
-1.506077, 0.6913274, -1.30419, 1, 1, 1, 1, 1,
-1.500959, -0.1715697, -1.855521, 1, 1, 1, 1, 1,
-1.49737, -0.3142241, -1.23338, 1, 1, 1, 1, 1,
-1.493731, 0.2187852, -0.3794731, 1, 1, 1, 1, 1,
-1.478349, -0.697657, -1.666741, 1, 1, 1, 1, 1,
-1.474666, 0.8867629, -0.9639105, 1, 1, 1, 1, 1,
-1.455947, 1.412283, -1.281069, 1, 1, 1, 1, 1,
-1.454873, -0.700749, -0.912725, 1, 1, 1, 1, 1,
-1.447162, 0.3591727, -0.2238896, 0, 0, 1, 1, 1,
-1.445029, -0.07266708, -1.285843, 1, 0, 0, 1, 1,
-1.444097, 0.8196142, -0.9794213, 1, 0, 0, 1, 1,
-1.438526, -0.8777128, -1.662223, 1, 0, 0, 1, 1,
-1.421869, -0.9002624, -3.041811, 1, 0, 0, 1, 1,
-1.412684, 0.8307213, -1.184032, 1, 0, 0, 1, 1,
-1.411428, -1.004702, -1.165915, 0, 0, 0, 1, 1,
-1.395184, 1.991299, -1.040346, 0, 0, 0, 1, 1,
-1.392231, -0.7691642, -2.089442, 0, 0, 0, 1, 1,
-1.390751, 0.9913967, -1.176187, 0, 0, 0, 1, 1,
-1.389671, 0.4644181, -1.405294, 0, 0, 0, 1, 1,
-1.378741, 1.459291, -0.4065125, 0, 0, 0, 1, 1,
-1.371446, 0.6330327, -1.81033, 0, 0, 0, 1, 1,
-1.364392, 0.3790028, -2.483753, 1, 1, 1, 1, 1,
-1.361453, -0.9182658, -2.018152, 1, 1, 1, 1, 1,
-1.353358, 1.096081, -3.389341, 1, 1, 1, 1, 1,
-1.352654, -1.025184, -0.1255482, 1, 1, 1, 1, 1,
-1.346288, 1.629245, 0.1539517, 1, 1, 1, 1, 1,
-1.342818, 0.8550043, -0.4933162, 1, 1, 1, 1, 1,
-1.342647, 0.6009288, -0.1690295, 1, 1, 1, 1, 1,
-1.340109, 2.520189, -1.505691, 1, 1, 1, 1, 1,
-1.336189, -0.1894858, -0.5414551, 1, 1, 1, 1, 1,
-1.335324, 0.4834128, -1.98651, 1, 1, 1, 1, 1,
-1.334555, 0.566148, -0.8261954, 1, 1, 1, 1, 1,
-1.326374, 0.2932816, -0.8051156, 1, 1, 1, 1, 1,
-1.319583, 1.262753, -2.697626, 1, 1, 1, 1, 1,
-1.30922, -0.5030001, -3.347146, 1, 1, 1, 1, 1,
-1.3024, -0.9150206, -3.347237, 1, 1, 1, 1, 1,
-1.296496, -0.1393149, -2.328413, 0, 0, 1, 1, 1,
-1.294057, -0.5538721, -0.04384372, 1, 0, 0, 1, 1,
-1.293828, 0.8665627, -1.184476, 1, 0, 0, 1, 1,
-1.286736, 1.471348, -2.703254, 1, 0, 0, 1, 1,
-1.283009, 1.061308, -1.856065, 1, 0, 0, 1, 1,
-1.280338, 0.1644083, -2.819629, 1, 0, 0, 1, 1,
-1.265751, -0.37456, -2.88037, 0, 0, 0, 1, 1,
-1.262915, -1.188447, -1.659728, 0, 0, 0, 1, 1,
-1.244411, -1.550097, -1.733353, 0, 0, 0, 1, 1,
-1.240592, -0.009431793, -0.8905568, 0, 0, 0, 1, 1,
-1.23989, 0.4953527, -1.866451, 0, 0, 0, 1, 1,
-1.236763, 0.03971071, -0.6504796, 0, 0, 0, 1, 1,
-1.219069, 0.1396794, -2.198038, 0, 0, 0, 1, 1,
-1.21733, 1.171196, -2.068816, 1, 1, 1, 1, 1,
-1.215968, -1.666056, -2.750786, 1, 1, 1, 1, 1,
-1.209742, -0.0813745, -1.691667, 1, 1, 1, 1, 1,
-1.197624, -0.1448281, -1.068756, 1, 1, 1, 1, 1,
-1.188354, -1.693836, -1.675635, 1, 1, 1, 1, 1,
-1.187518, 0.07806392, -2.820426, 1, 1, 1, 1, 1,
-1.185692, 0.7896224, -0.8509375, 1, 1, 1, 1, 1,
-1.18192, 1.717062, -0.8038591, 1, 1, 1, 1, 1,
-1.17655, -1.625694, -1.969243, 1, 1, 1, 1, 1,
-1.160535, -0.3990364, -2.731492, 1, 1, 1, 1, 1,
-1.154262, -0.8488072, -1.925876, 1, 1, 1, 1, 1,
-1.144054, 1.58277, -1.015408, 1, 1, 1, 1, 1,
-1.140257, -1.488221, -1.477315, 1, 1, 1, 1, 1,
-1.131747, -0.8860111, -3.174384, 1, 1, 1, 1, 1,
-1.131676, -0.9231508, -0.6088654, 1, 1, 1, 1, 1,
-1.127119, 0.5078042, -0.6175352, 0, 0, 1, 1, 1,
-1.117732, 0.2089502, -1.976234, 1, 0, 0, 1, 1,
-1.113005, 0.3562719, -1.395781, 1, 0, 0, 1, 1,
-1.111172, 2.192264, -0.01630189, 1, 0, 0, 1, 1,
-1.108718, 0.1433393, -1.347807, 1, 0, 0, 1, 1,
-1.106646, -0.4033175, -1.344671, 1, 0, 0, 1, 1,
-1.104332, -0.4873822, -1.688864, 0, 0, 0, 1, 1,
-1.104287, -0.05119556, -1.561312, 0, 0, 0, 1, 1,
-1.097885, 0.4156537, -1.449988, 0, 0, 0, 1, 1,
-1.096938, 0.7112038, -2.354084, 0, 0, 0, 1, 1,
-1.086398, 0.917729, -0.7186368, 0, 0, 0, 1, 1,
-1.072364, -0.9246958, -2.818141, 0, 0, 0, 1, 1,
-1.066823, -1.231394, -2.342885, 0, 0, 0, 1, 1,
-1.054277, -0.2493679, -1.451577, 1, 1, 1, 1, 1,
-1.049409, -1.510788, -3.265222, 1, 1, 1, 1, 1,
-1.04321, 0.06736742, -1.892883, 1, 1, 1, 1, 1,
-1.041914, 0.5706928, -0.4131661, 1, 1, 1, 1, 1,
-1.04108, 1.257203, -0.5110112, 1, 1, 1, 1, 1,
-1.037313, 1.570052, 0.5101438, 1, 1, 1, 1, 1,
-1.034902, -0.700098, -1.441959, 1, 1, 1, 1, 1,
-1.03083, 0.2935676, -0.9082566, 1, 1, 1, 1, 1,
-1.025032, -0.6414788, -1.598161, 1, 1, 1, 1, 1,
-1.022255, -0.2566866, -1.24424, 1, 1, 1, 1, 1,
-1.010187, 1.197222, 0.09445982, 1, 1, 1, 1, 1,
-1.005974, 0.6028316, -2.534595, 1, 1, 1, 1, 1,
-1.001919, -0.5954923, -2.096506, 1, 1, 1, 1, 1,
-1.000236, 1.699529, 0.8936584, 1, 1, 1, 1, 1,
-0.9937884, -0.2858036, -1.513218, 1, 1, 1, 1, 1,
-0.985877, -0.3246071, -2.402879, 0, 0, 1, 1, 1,
-0.9850088, 0.252424, -1.546563, 1, 0, 0, 1, 1,
-0.9823759, 0.001020528, -0.6144179, 1, 0, 0, 1, 1,
-0.9781631, 0.4330217, -2.563804, 1, 0, 0, 1, 1,
-0.9766319, -0.8463779, -2.22463, 1, 0, 0, 1, 1,
-0.9673567, -1.886674, -3.26608, 1, 0, 0, 1, 1,
-0.9594465, 1.072438, -0.07036164, 0, 0, 0, 1, 1,
-0.9398355, 0.6795666, -0.8554022, 0, 0, 0, 1, 1,
-0.9336143, -0.4422441, -2.657215, 0, 0, 0, 1, 1,
-0.9267058, 0.6174213, 0.1663728, 0, 0, 0, 1, 1,
-0.9164063, 0.418485, -0.9561006, 0, 0, 0, 1, 1,
-0.911454, 1.066009, -0.6716309, 0, 0, 0, 1, 1,
-0.9102517, -0.4480745, -2.911688, 0, 0, 0, 1, 1,
-0.9052995, -0.182665, -1.36879, 1, 1, 1, 1, 1,
-0.9042721, -0.3927391, -3.358013, 1, 1, 1, 1, 1,
-0.8918651, 0.5956201, -1.967065, 1, 1, 1, 1, 1,
-0.8917506, 0.9320652, -0.8731577, 1, 1, 1, 1, 1,
-0.88866, -0.4979011, -2.039576, 1, 1, 1, 1, 1,
-0.8840508, 0.8044736, 0.7257044, 1, 1, 1, 1, 1,
-0.8488618, -1.145907, -2.416975, 1, 1, 1, 1, 1,
-0.8464105, -0.1122022, -1.671209, 1, 1, 1, 1, 1,
-0.8422485, -0.9589134, -2.483373, 1, 1, 1, 1, 1,
-0.8399912, 0.2056009, -0.2039927, 1, 1, 1, 1, 1,
-0.8393077, -0.3805954, -1.373619, 1, 1, 1, 1, 1,
-0.8247591, -0.19266, -1.293355, 1, 1, 1, 1, 1,
-0.8194551, 2.290243, 0.3364411, 1, 1, 1, 1, 1,
-0.8189496, 0.9185916, 1.361684, 1, 1, 1, 1, 1,
-0.8155737, 0.3724638, 0.1709784, 1, 1, 1, 1, 1,
-0.8094925, 1.095213, -1.226566, 0, 0, 1, 1, 1,
-0.8070338, 0.13817, 0.128645, 1, 0, 0, 1, 1,
-0.8017937, 0.1949624, -0.3168927, 1, 0, 0, 1, 1,
-0.801545, 0.3156125, -3.225157, 1, 0, 0, 1, 1,
-0.7997391, 0.5548623, -2.088078, 1, 0, 0, 1, 1,
-0.7960005, -1.060434, -2.167766, 1, 0, 0, 1, 1,
-0.7928835, 0.01805222, -2.890706, 0, 0, 0, 1, 1,
-0.7877496, -0.01592236, -1.152001, 0, 0, 0, 1, 1,
-0.7872465, 0.9231828, -1.570999, 0, 0, 0, 1, 1,
-0.7859083, 0.3515747, -0.2590749, 0, 0, 0, 1, 1,
-0.7794933, -1.812865, -4.510534, 0, 0, 0, 1, 1,
-0.777036, 1.054664, -0.7648183, 0, 0, 0, 1, 1,
-0.7753755, 0.6359786, -0.1623609, 0, 0, 0, 1, 1,
-0.7748218, -0.3046599, -3.182267, 1, 1, 1, 1, 1,
-0.7737083, -1.744175, -3.350368, 1, 1, 1, 1, 1,
-0.7726417, -0.01244156, -1.283599, 1, 1, 1, 1, 1,
-0.7719725, 0.5691388, 0.3143732, 1, 1, 1, 1, 1,
-0.771121, 0.4740279, -0.2261631, 1, 1, 1, 1, 1,
-0.7709398, 0.955195, -0.7507889, 1, 1, 1, 1, 1,
-0.7699931, -0.2630754, -2.344357, 1, 1, 1, 1, 1,
-0.7671056, 0.3930695, -1.527991, 1, 1, 1, 1, 1,
-0.7657256, -0.7537427, -2.491948, 1, 1, 1, 1, 1,
-0.7651145, 0.08786767, -0.8945502, 1, 1, 1, 1, 1,
-0.7639285, -0.6962377, -1.804286, 1, 1, 1, 1, 1,
-0.7634014, 0.5833277, 0.7041965, 1, 1, 1, 1, 1,
-0.7623993, 1.643605, 0.3697668, 1, 1, 1, 1, 1,
-0.7622848, -0.4523335, -2.302634, 1, 1, 1, 1, 1,
-0.7614799, -0.1976089, -0.10704, 1, 1, 1, 1, 1,
-0.7575864, 0.2332452, -2.066419, 0, 0, 1, 1, 1,
-0.756126, 1.028679, 1.23864, 1, 0, 0, 1, 1,
-0.7549083, -1.300618, -4.723795, 1, 0, 0, 1, 1,
-0.7544608, -0.0986276, -2.391888, 1, 0, 0, 1, 1,
-0.7512271, 0.5685124, -1.546427, 1, 0, 0, 1, 1,
-0.7434576, -0.9128868, -3.614158, 1, 0, 0, 1, 1,
-0.7420138, 0.7841998, 0.3769732, 0, 0, 0, 1, 1,
-0.7379036, 0.7335322, -0.2748533, 0, 0, 0, 1, 1,
-0.7377815, 1.354235, -0.7996265, 0, 0, 0, 1, 1,
-0.7344888, -0.2012747, -0.00477066, 0, 0, 0, 1, 1,
-0.7314703, 1.497182, -1.486236, 0, 0, 0, 1, 1,
-0.7313948, -1.536081, -2.067928, 0, 0, 0, 1, 1,
-0.7277262, 1.440739, -2.519884, 0, 0, 0, 1, 1,
-0.7268502, -0.3939053, -3.794408, 1, 1, 1, 1, 1,
-0.7167323, -1.772187, -3.077474, 1, 1, 1, 1, 1,
-0.7147399, -0.8087713, -3.654331, 1, 1, 1, 1, 1,
-0.713456, -0.08837721, -1.416951, 1, 1, 1, 1, 1,
-0.7112896, -0.2592909, -2.837695, 1, 1, 1, 1, 1,
-0.7109417, -0.7337229, -2.232366, 1, 1, 1, 1, 1,
-0.7041703, 0.978768, 1.200836, 1, 1, 1, 1, 1,
-0.6957061, 0.1114497, -1.657328, 1, 1, 1, 1, 1,
-0.6929083, -0.2174559, 0.1324779, 1, 1, 1, 1, 1,
-0.6905162, 1.023944, -1.189276, 1, 1, 1, 1, 1,
-0.6900123, -0.7594402, -2.886228, 1, 1, 1, 1, 1,
-0.6889443, 2.018578, -1.264164, 1, 1, 1, 1, 1,
-0.6886201, 0.8609604, -2.413133, 1, 1, 1, 1, 1,
-0.6857781, -0.2298623, -2.541645, 1, 1, 1, 1, 1,
-0.6857762, 0.5537078, -2.438658, 1, 1, 1, 1, 1,
-0.6857638, 0.7917555, -1.928155, 0, 0, 1, 1, 1,
-0.684675, -0.06563511, -0.3652298, 1, 0, 0, 1, 1,
-0.6822237, 0.7528468, -0.9520308, 1, 0, 0, 1, 1,
-0.6804046, 1.712307, 0.5325646, 1, 0, 0, 1, 1,
-0.6760777, 0.4125855, -0.3688194, 1, 0, 0, 1, 1,
-0.6728763, 1.130347, -0.4333359, 1, 0, 0, 1, 1,
-0.6695533, -0.1605109, -1.617227, 0, 0, 0, 1, 1,
-0.6640356, 2.266034, -0.4074256, 0, 0, 0, 1, 1,
-0.6634285, 0.2359294, -1.202252, 0, 0, 0, 1, 1,
-0.6626331, 0.8830047, 0.6763547, 0, 0, 0, 1, 1,
-0.6572733, 1.937088, 0.04916885, 0, 0, 0, 1, 1,
-0.6565236, -1.556774, -2.661979, 0, 0, 0, 1, 1,
-0.654651, -0.4189173, -1.623034, 0, 0, 0, 1, 1,
-0.6491602, -0.6188379, -1.447478, 1, 1, 1, 1, 1,
-0.6489068, 2.413054, -1.792441, 1, 1, 1, 1, 1,
-0.6488086, -0.5350823, -1.192848, 1, 1, 1, 1, 1,
-0.6352218, 0.880217, -1.264506, 1, 1, 1, 1, 1,
-0.6292799, -0.5133819, -2.100562, 1, 1, 1, 1, 1,
-0.6283621, 1.953174, -0.1636655, 1, 1, 1, 1, 1,
-0.6257221, -0.3425188, -0.6770144, 1, 1, 1, 1, 1,
-0.6245016, 1.098612, 0.5025763, 1, 1, 1, 1, 1,
-0.6176512, 1.389905, -1.972481, 1, 1, 1, 1, 1,
-0.6075776, 0.2595318, -1.334958, 1, 1, 1, 1, 1,
-0.5935685, -1.138101, -2.084437, 1, 1, 1, 1, 1,
-0.5902507, -1.532209, -4.550626, 1, 1, 1, 1, 1,
-0.5902094, -1.21969, -1.219507, 1, 1, 1, 1, 1,
-0.5879369, 1.407214, 1.236519, 1, 1, 1, 1, 1,
-0.5874735, 1.356774, -1.537688, 1, 1, 1, 1, 1,
-0.5829677, -1.001727, -2.889625, 0, 0, 1, 1, 1,
-0.5820004, -0.8536337, -3.171784, 1, 0, 0, 1, 1,
-0.5815843, 0.06791104, -2.563796, 1, 0, 0, 1, 1,
-0.5812695, 0.6371033, 0.09273531, 1, 0, 0, 1, 1,
-0.5758581, 0.2952617, -1.808545, 1, 0, 0, 1, 1,
-0.573498, 0.4536034, -1.618666, 1, 0, 0, 1, 1,
-0.5734653, 0.7460811, -1.154271, 0, 0, 0, 1, 1,
-0.5653816, -0.7240844, -0.8786944, 0, 0, 0, 1, 1,
-0.5638098, -1.342978, -4.04104, 0, 0, 0, 1, 1,
-0.5629645, 0.5342032, -1.815208, 0, 0, 0, 1, 1,
-0.5604427, -0.2657157, -0.1892896, 0, 0, 0, 1, 1,
-0.5576605, 0.3944411, -1.55916, 0, 0, 0, 1, 1,
-0.5573708, -0.1024872, -4.679531, 0, 0, 0, 1, 1,
-0.5550248, 0.1363238, 0.7580937, 1, 1, 1, 1, 1,
-0.5549578, -1.82378, -1.22821, 1, 1, 1, 1, 1,
-0.5543202, 0.5093062, 0.5530792, 1, 1, 1, 1, 1,
-0.550078, 0.5526459, -0.2738079, 1, 1, 1, 1, 1,
-0.5481424, 2.562969, 0.2433078, 1, 1, 1, 1, 1,
-0.5478505, -0.02378313, -0.3489398, 1, 1, 1, 1, 1,
-0.543935, -0.1595436, -1.938599, 1, 1, 1, 1, 1,
-0.5410907, -0.7386888, -1.532572, 1, 1, 1, 1, 1,
-0.5405954, 0.07699826, -1.543275, 1, 1, 1, 1, 1,
-0.5400522, 0.2224828, -0.7126483, 1, 1, 1, 1, 1,
-0.5390366, 0.18119, -2.328786, 1, 1, 1, 1, 1,
-0.5327727, -1.028513, -3.033412, 1, 1, 1, 1, 1,
-0.5287567, 1.126652, 0.3873597, 1, 1, 1, 1, 1,
-0.5238094, 0.08078418, -1.281634, 1, 1, 1, 1, 1,
-0.5210642, 2.525732, 0.5838634, 1, 1, 1, 1, 1,
-0.5199109, -1.089125, -1.742134, 0, 0, 1, 1, 1,
-0.5189912, 0.5099505, -1.521743, 1, 0, 0, 1, 1,
-0.5147177, 0.6433551, 0.4969283, 1, 0, 0, 1, 1,
-0.5109149, -1.228164, -1.972604, 1, 0, 0, 1, 1,
-0.5092487, -0.7867087, -1.472963, 1, 0, 0, 1, 1,
-0.5091329, -0.5041049, -2.187478, 1, 0, 0, 1, 1,
-0.5042049, -0.3546986, -3.119894, 0, 0, 0, 1, 1,
-0.5026235, 0.280097, -1.640795, 0, 0, 0, 1, 1,
-0.4989468, -0.610657, -2.141986, 0, 0, 0, 1, 1,
-0.4968023, 0.2023449, -1.073079, 0, 0, 0, 1, 1,
-0.4949655, -1.144642, -0.9441959, 0, 0, 0, 1, 1,
-0.49043, 0.3762614, -0.207234, 0, 0, 0, 1, 1,
-0.4874124, -0.5062745, -2.504758, 0, 0, 0, 1, 1,
-0.4828898, -0.9726898, -1.584568, 1, 1, 1, 1, 1,
-0.4828237, 1.492847, 0.0594752, 1, 1, 1, 1, 1,
-0.482289, -0.3356337, -2.475387, 1, 1, 1, 1, 1,
-0.4813538, -1.321315, -3.776977, 1, 1, 1, 1, 1,
-0.4812966, -0.4979204, -2.527579, 1, 1, 1, 1, 1,
-0.4810386, 1.763904, -1.578959, 1, 1, 1, 1, 1,
-0.480025, 0.1535144, 0.04507094, 1, 1, 1, 1, 1,
-0.4788424, 0.06709436, 1.415855, 1, 1, 1, 1, 1,
-0.4777812, 0.3388987, -1.720629, 1, 1, 1, 1, 1,
-0.476181, -1.166417, -1.936441, 1, 1, 1, 1, 1,
-0.4704415, -0.3678882, -2.846514, 1, 1, 1, 1, 1,
-0.4694014, -0.2007193, -1.265532, 1, 1, 1, 1, 1,
-0.4686675, 1.372447, 1.249733, 1, 1, 1, 1, 1,
-0.466516, 1.4475, -0.7700179, 1, 1, 1, 1, 1,
-0.4659133, -0.2500413, -2.083317, 1, 1, 1, 1, 1,
-0.4586667, 0.1493817, -0.9036159, 0, 0, 1, 1, 1,
-0.4567116, -0.6131242, -2.095102, 1, 0, 0, 1, 1,
-0.4551751, 0.3017327, -1.800325, 1, 0, 0, 1, 1,
-0.453588, -0.6983472, -3.207557, 1, 0, 0, 1, 1,
-0.4529079, -0.167163, -2.644691, 1, 0, 0, 1, 1,
-0.4527839, 0.1094826, 0.5002087, 1, 0, 0, 1, 1,
-0.452739, -0.2465108, -0.7349996, 0, 0, 0, 1, 1,
-0.450842, -0.4801563, -1.660777, 0, 0, 0, 1, 1,
-0.4502405, 0.02672951, -0.5604517, 0, 0, 0, 1, 1,
-0.4497926, 0.8346761, 0.2300326, 0, 0, 0, 1, 1,
-0.448413, 0.8328701, 0.2736219, 0, 0, 0, 1, 1,
-0.441489, -1.629678, -3.36994, 0, 0, 0, 1, 1,
-0.4381478, -0.4640545, -0.2410973, 0, 0, 0, 1, 1,
-0.4318272, 1.44971, 1.718685, 1, 1, 1, 1, 1,
-0.4291786, 1.083528, 0.2451955, 1, 1, 1, 1, 1,
-0.4282813, 0.6109387, 0.882, 1, 1, 1, 1, 1,
-0.4274657, 0.1613524, -1.936151, 1, 1, 1, 1, 1,
-0.4271834, -0.3857768, -3.950552, 1, 1, 1, 1, 1,
-0.4255832, -0.3132251, -2.432667, 1, 1, 1, 1, 1,
-0.4217697, 1.597681, -0.2448998, 1, 1, 1, 1, 1,
-0.4212624, -1.398513, -2.245828, 1, 1, 1, 1, 1,
-0.4207866, -1.541039, -2.573815, 1, 1, 1, 1, 1,
-0.4164082, -0.2421221, -2.892672, 1, 1, 1, 1, 1,
-0.4151372, 0.4765073, -0.2163408, 1, 1, 1, 1, 1,
-0.4140416, 1.657694, 1.725044, 1, 1, 1, 1, 1,
-0.4128013, 0.7419273, 0.7570793, 1, 1, 1, 1, 1,
-0.4114823, -0.3187718, -1.879975, 1, 1, 1, 1, 1,
-0.4107052, -1.034782, 0.07076388, 1, 1, 1, 1, 1,
-0.4053419, 1.429812, 0.7817868, 0, 0, 1, 1, 1,
-0.4044114, 1.92441, -0.2751247, 1, 0, 0, 1, 1,
-0.4031138, -0.2485107, -2.667717, 1, 0, 0, 1, 1,
-0.3996555, -0.2469942, -2.877431, 1, 0, 0, 1, 1,
-0.3970176, -0.3980821, -1.749473, 1, 0, 0, 1, 1,
-0.3935081, -0.1877425, -1.71327, 1, 0, 0, 1, 1,
-0.3925172, 0.395774, -1.54361, 0, 0, 0, 1, 1,
-0.3895302, -2.979751, -5.0797, 0, 0, 0, 1, 1,
-0.3878703, 0.1606768, 0.3331536, 0, 0, 0, 1, 1,
-0.3856968, -1.015979, -2.789067, 0, 0, 0, 1, 1,
-0.3836562, -1.775344, -3.161507, 0, 0, 0, 1, 1,
-0.3829216, -0.6114658, -0.7429624, 0, 0, 0, 1, 1,
-0.3825139, -0.3941526, -3.172448, 0, 0, 0, 1, 1,
-0.382203, -1.351555, -0.7349989, 1, 1, 1, 1, 1,
-0.3808461, -0.9974384, -2.127068, 1, 1, 1, 1, 1,
-0.3732732, 0.6504027, -0.5990096, 1, 1, 1, 1, 1,
-0.3715827, 2.076136, -0.503839, 1, 1, 1, 1, 1,
-0.3695616, 0.9186385, -1.561594, 1, 1, 1, 1, 1,
-0.3674069, 0.5543997, -0.2592818, 1, 1, 1, 1, 1,
-0.3659368, 0.2224247, -1.645251, 1, 1, 1, 1, 1,
-0.3636135, 0.3215697, -0.2797251, 1, 1, 1, 1, 1,
-0.3632206, -0.2923506, -3.015965, 1, 1, 1, 1, 1,
-0.3619356, -1.070484, -0.9365671, 1, 1, 1, 1, 1,
-0.361798, -1.459146, -3.738157, 1, 1, 1, 1, 1,
-0.3588074, -0.7684509, -3.609815, 1, 1, 1, 1, 1,
-0.3585117, 0.9932608, -0.2836755, 1, 1, 1, 1, 1,
-0.3582687, -0.01833387, -0.8121002, 1, 1, 1, 1, 1,
-0.3554929, 0.4553953, -0.2613544, 1, 1, 1, 1, 1,
-0.3525468, 0.7886892, -0.6482742, 0, 0, 1, 1, 1,
-0.3433473, 1.231206, 2.985586, 1, 0, 0, 1, 1,
-0.3406434, -0.9927229, -2.913032, 1, 0, 0, 1, 1,
-0.3393209, 1.151099, -0.3279233, 1, 0, 0, 1, 1,
-0.3380727, 0.6376752, -1.436493, 1, 0, 0, 1, 1,
-0.3346784, 0.1258119, -2.695343, 1, 0, 0, 1, 1,
-0.3318301, 2.016048, -1.44451, 0, 0, 0, 1, 1,
-0.3313941, 0.4073161, -1.528309, 0, 0, 0, 1, 1,
-0.3290141, 0.4672363, 0.2829368, 0, 0, 0, 1, 1,
-0.3273776, -1.035552, -1.048261, 0, 0, 0, 1, 1,
-0.3246938, 0.7765212, 0.2121868, 0, 0, 0, 1, 1,
-0.3215185, -0.3276386, -1.910402, 0, 0, 0, 1, 1,
-0.3208824, 1.027457, -0.6254581, 0, 0, 0, 1, 1,
-0.317607, 1.862059, -0.1172243, 1, 1, 1, 1, 1,
-0.3154218, 1.194633, -0.003706782, 1, 1, 1, 1, 1,
-0.3045363, -1.869328, -2.202968, 1, 1, 1, 1, 1,
-0.3029088, 0.6531345, -0.788106, 1, 1, 1, 1, 1,
-0.297504, 0.03863166, -0.9752967, 1, 1, 1, 1, 1,
-0.2957233, -1.183494, -3.087531, 1, 1, 1, 1, 1,
-0.2956637, 1.573156, 0.03163817, 1, 1, 1, 1, 1,
-0.2944366, 1.036277, 0.2633641, 1, 1, 1, 1, 1,
-0.2920103, 1.700683, 0.7340459, 1, 1, 1, 1, 1,
-0.2912199, 1.053859, 0.2511247, 1, 1, 1, 1, 1,
-0.2882581, 0.6843508, -1.196825, 1, 1, 1, 1, 1,
-0.2879936, 1.867785, -2.338517, 1, 1, 1, 1, 1,
-0.2818624, 0.6015378, -1.238535, 1, 1, 1, 1, 1,
-0.2787943, -1.393309, -4.948985, 1, 1, 1, 1, 1,
-0.2787225, -0.220161, -2.44499, 1, 1, 1, 1, 1,
-0.2759692, -0.01084543, -0.0184036, 0, 0, 1, 1, 1,
-0.275027, -1.397612, -4.283125, 1, 0, 0, 1, 1,
-0.2701512, -1.226873, -2.52458, 1, 0, 0, 1, 1,
-0.2700401, -0.005993965, -2.582395, 1, 0, 0, 1, 1,
-0.2649669, 0.4881375, -0.5111555, 1, 0, 0, 1, 1,
-0.2595517, -1.418634, -3.309244, 1, 0, 0, 1, 1,
-0.2518013, -1.444427, -2.151681, 0, 0, 0, 1, 1,
-0.2517265, -0.784348, -1.699662, 0, 0, 0, 1, 1,
-0.2488473, 0.09830303, -2.42204, 0, 0, 0, 1, 1,
-0.2483166, -1.604746, -2.700087, 0, 0, 0, 1, 1,
-0.2461741, -0.8547583, -3.272395, 0, 0, 0, 1, 1,
-0.2461383, -0.1281855, -2.230317, 0, 0, 0, 1, 1,
-0.2430348, 0.3947985, -1.617102, 0, 0, 0, 1, 1,
-0.2420074, 1.67846, -0.6824348, 1, 1, 1, 1, 1,
-0.2377374, 1.198107, -0.5201121, 1, 1, 1, 1, 1,
-0.2375598, -2.411754, -2.00144, 1, 1, 1, 1, 1,
-0.2328909, 0.5191363, -0.5786427, 1, 1, 1, 1, 1,
-0.2305861, -0.939433, -2.837322, 1, 1, 1, 1, 1,
-0.2276237, 0.4439714, 0.8489038, 1, 1, 1, 1, 1,
-0.2264587, 0.5194551, 0.5351712, 1, 1, 1, 1, 1,
-0.2247331, 1.549644, 2.634531, 1, 1, 1, 1, 1,
-0.2229769, -0.1542583, -3.746652, 1, 1, 1, 1, 1,
-0.2201096, 0.3408593, -1.789804, 1, 1, 1, 1, 1,
-0.2179753, 0.4174157, -1.855879, 1, 1, 1, 1, 1,
-0.2174606, 0.2098308, -0.7417138, 1, 1, 1, 1, 1,
-0.2138979, 0.3287937, 0.2934636, 1, 1, 1, 1, 1,
-0.2100784, 1.307086, -1.344117, 1, 1, 1, 1, 1,
-0.207774, -0.914001, -3.072264, 1, 1, 1, 1, 1,
-0.2073324, 1.692944, 1.4978, 0, 0, 1, 1, 1,
-0.1972486, 1.799817, 0.6319526, 1, 0, 0, 1, 1,
-0.1968609, -2.019348, -3.83884, 1, 0, 0, 1, 1,
-0.1917542, -0.4943016, -4.220072, 1, 0, 0, 1, 1,
-0.1886179, 2.245811, -1.046417, 1, 0, 0, 1, 1,
-0.1872377, 0.9570395, -0.1278641, 1, 0, 0, 1, 1,
-0.1847621, -0.9608907, -3.547869, 0, 0, 0, 1, 1,
-0.1710721, -0.2985643, -1.600909, 0, 0, 0, 1, 1,
-0.1696328, 0.7978785, -1.119768, 0, 0, 0, 1, 1,
-0.1678029, -1.444666, -4.470296, 0, 0, 0, 1, 1,
-0.1656552, 0.04960194, -1.363015, 0, 0, 0, 1, 1,
-0.1648277, 0.3636824, -0.3100376, 0, 0, 0, 1, 1,
-0.1637195, 0.5834999, 0.4785994, 0, 0, 0, 1, 1,
-0.1637107, 0.6297288, 1.338106, 1, 1, 1, 1, 1,
-0.1623787, -0.2146158, -3.070243, 1, 1, 1, 1, 1,
-0.1547244, 0.8041325, 1.735692, 1, 1, 1, 1, 1,
-0.1522948, 1.561159, -1.260721, 1, 1, 1, 1, 1,
-0.1485211, 0.5585151, -0.1086561, 1, 1, 1, 1, 1,
-0.1482848, 0.5341251, -0.06093801, 1, 1, 1, 1, 1,
-0.1419, -0.9266741, -1.731133, 1, 1, 1, 1, 1,
-0.1412999, -1.041383, -3.915334, 1, 1, 1, 1, 1,
-0.1360205, 0.8456057, -1.415765, 1, 1, 1, 1, 1,
-0.1328753, 0.6208083, 1.771298, 1, 1, 1, 1, 1,
-0.1222123, 1.915143, 1.107198, 1, 1, 1, 1, 1,
-0.1178985, 1.037557, -0.9653046, 1, 1, 1, 1, 1,
-0.1174126, 1.816782, -1.278972, 1, 1, 1, 1, 1,
-0.1135701, -0.1931575, -1.570058, 1, 1, 1, 1, 1,
-0.1131829, -0.8694309, -4.032141, 1, 1, 1, 1, 1,
-0.1113783, -1.918744, -1.993715, 0, 0, 1, 1, 1,
-0.1102148, -0.2594154, -3.91114, 1, 0, 0, 1, 1,
-0.1097384, -1.387069, -2.981065, 1, 0, 0, 1, 1,
-0.1043987, -2.722329, -0.2733845, 1, 0, 0, 1, 1,
-0.1037491, -0.7672827, -3.440413, 1, 0, 0, 1, 1,
-0.1001881, -0.5355015, -4.61491, 1, 0, 0, 1, 1,
-0.09896623, 0.3764759, 0.736271, 0, 0, 0, 1, 1,
-0.09680402, -3.154301, -3.455497, 0, 0, 0, 1, 1,
-0.09430359, 0.5148699, 0.1321166, 0, 0, 0, 1, 1,
-0.09109364, -0.1538089, -2.573344, 0, 0, 0, 1, 1,
-0.08966211, -0.9314626, -3.410067, 0, 0, 0, 1, 1,
-0.08667475, -0.5547715, -3.944379, 0, 0, 0, 1, 1,
-0.08313904, -0.4413303, -3.418285, 0, 0, 0, 1, 1,
-0.08218593, -1.698634, -4.163372, 1, 1, 1, 1, 1,
-0.08083717, -1.194523, -2.895377, 1, 1, 1, 1, 1,
-0.07883412, -0.3703946, -3.308343, 1, 1, 1, 1, 1,
-0.06916936, 0.4986727, 0.3574511, 1, 1, 1, 1, 1,
-0.06875374, 0.175189, -0.6730539, 1, 1, 1, 1, 1,
-0.06801179, 0.1068309, -2.014237, 1, 1, 1, 1, 1,
-0.06580237, 1.261968, -0.6829841, 1, 1, 1, 1, 1,
-0.06347551, 0.5469425, 2.311366, 1, 1, 1, 1, 1,
-0.06078298, -0.6158357, -3.19099, 1, 1, 1, 1, 1,
-0.06048659, -2.351055, -4.592883, 1, 1, 1, 1, 1,
-0.05416216, 1.43157, -0.7709638, 1, 1, 1, 1, 1,
-0.05300704, 0.4062097, -0.409287, 1, 1, 1, 1, 1,
-0.0516174, 1.862067, 1.533597, 1, 1, 1, 1, 1,
-0.05125623, 0.8070936, -0.08984726, 1, 1, 1, 1, 1,
-0.05071265, -1.321439, -1.318342, 1, 1, 1, 1, 1,
-0.04900084, 0.5477838, -0.1053115, 0, 0, 1, 1, 1,
-0.04837038, 0.4781837, 1.53645, 1, 0, 0, 1, 1,
-0.04747112, -0.9522271, -3.42958, 1, 0, 0, 1, 1,
-0.04684746, -0.2836062, -2.874296, 1, 0, 0, 1, 1,
-0.04458193, -0.4785439, -3.965807, 1, 0, 0, 1, 1,
-0.04391905, 1.201412, -0.891334, 1, 0, 0, 1, 1,
-0.04285913, 0.09940875, -2.628603, 0, 0, 0, 1, 1,
-0.04066179, -0.7277504, -2.83022, 0, 0, 0, 1, 1,
-0.03859313, 0.2227564, -0.13639, 0, 0, 0, 1, 1,
-0.02598637, 0.5334354, -1.026391, 0, 0, 0, 1, 1,
-0.01784961, -1.603332, -1.989673, 0, 0, 0, 1, 1,
-0.01574063, -1.611822, -3.456539, 0, 0, 0, 1, 1,
-0.01080203, 1.121182, -0.6047882, 0, 0, 0, 1, 1,
-0.002872363, 1.086773, 0.3535359, 1, 1, 1, 1, 1,
-0.002549369, 0.2096834, 0.9013536, 1, 1, 1, 1, 1,
-0.0005195895, 1.099612, 0.07152484, 1, 1, 1, 1, 1,
0.01731561, 0.3151996, -0.3497126, 1, 1, 1, 1, 1,
0.02504626, -0.4027603, 3.337544, 1, 1, 1, 1, 1,
0.02605453, -1.480643, 3.227907, 1, 1, 1, 1, 1,
0.02751384, -0.4152636, 2.034418, 1, 1, 1, 1, 1,
0.02794875, -0.2436674, 2.498881, 1, 1, 1, 1, 1,
0.03464609, -0.8367947, 3.699611, 1, 1, 1, 1, 1,
0.03501433, 0.8604491, -1.22902, 1, 1, 1, 1, 1,
0.03961144, 0.4397231, 0.5285232, 1, 1, 1, 1, 1,
0.0429083, -0.3118328, 4.369923, 1, 1, 1, 1, 1,
0.04346761, -0.7112759, 1.587107, 1, 1, 1, 1, 1,
0.04363837, -0.1053698, 3.976811, 1, 1, 1, 1, 1,
0.04624481, 0.6147002, -1.160323, 1, 1, 1, 1, 1,
0.05104188, -0.4868838, 3.478134, 0, 0, 1, 1, 1,
0.0538049, -1.151101, 2.198311, 1, 0, 0, 1, 1,
0.05995351, -0.1648764, 4.051211, 1, 0, 0, 1, 1,
0.06516027, -0.4345617, 3.686503, 1, 0, 0, 1, 1,
0.0657631, 0.7096806, -0.6799656, 1, 0, 0, 1, 1,
0.07075682, 0.3381512, 2.41889, 1, 0, 0, 1, 1,
0.07532085, 0.2825739, 1.807449, 0, 0, 0, 1, 1,
0.0754964, 0.1664422, -1.335019, 0, 0, 0, 1, 1,
0.0755247, 0.5652463, -0.7401153, 0, 0, 0, 1, 1,
0.07747994, -0.260671, 3.014782, 0, 0, 0, 1, 1,
0.07841665, 1.573417, -0.6708441, 0, 0, 0, 1, 1,
0.07866374, 0.2355333, -0.8182047, 0, 0, 0, 1, 1,
0.08087601, -0.1947855, 3.575167, 0, 0, 0, 1, 1,
0.08438899, -0.6553726, 3.533948, 1, 1, 1, 1, 1,
0.08499321, -2.009601, 4.406036, 1, 1, 1, 1, 1,
0.08544213, 0.7758269, -2.197508, 1, 1, 1, 1, 1,
0.08606979, 0.1333825, 0.3301407, 1, 1, 1, 1, 1,
0.08928143, 1.779178, 0.9692886, 1, 1, 1, 1, 1,
0.0907563, -0.4315559, 4.438013, 1, 1, 1, 1, 1,
0.09225708, 0.005958363, 0.4283309, 1, 1, 1, 1, 1,
0.09237268, -0.3693465, 1.789361, 1, 1, 1, 1, 1,
0.09297271, -0.1697853, 0.9597623, 1, 1, 1, 1, 1,
0.09886001, -0.3811731, 2.973743, 1, 1, 1, 1, 1,
0.1016542, 0.05106347, -0.3422161, 1, 1, 1, 1, 1,
0.1028303, -0.2068991, 2.510024, 1, 1, 1, 1, 1,
0.1041041, -0.3533993, 5.706238, 1, 1, 1, 1, 1,
0.1050308, -0.2319459, 2.848004, 1, 1, 1, 1, 1,
0.1053861, -0.0236849, 4.325922, 1, 1, 1, 1, 1,
0.1067513, 0.02884543, 2.117217, 0, 0, 1, 1, 1,
0.1089752, 0.5496005, -0.7577741, 1, 0, 0, 1, 1,
0.1098837, 1.642738, 0.5987446, 1, 0, 0, 1, 1,
0.1111113, -0.9358786, 1.261813, 1, 0, 0, 1, 1,
0.1136745, -0.5301562, 2.907067, 1, 0, 0, 1, 1,
0.1185058, 0.04497352, 2.635426, 1, 0, 0, 1, 1,
0.1192716, -1.621671, 2.447644, 0, 0, 0, 1, 1,
0.1214511, 0.1336939, 0.2374379, 0, 0, 0, 1, 1,
0.1218393, -0.728336, 2.728493, 0, 0, 0, 1, 1,
0.1296533, -1.23255, 2.327138, 0, 0, 0, 1, 1,
0.1394654, -1.250294, 4.503309, 0, 0, 0, 1, 1,
0.1409069, -0.1175071, 1.641, 0, 0, 0, 1, 1,
0.1410814, -0.2514413, 1.649706, 0, 0, 0, 1, 1,
0.1421989, 0.1546009, 0.694926, 1, 1, 1, 1, 1,
0.1434995, 0.4859937, 1.727112, 1, 1, 1, 1, 1,
0.1446033, 0.2259005, 0.302275, 1, 1, 1, 1, 1,
0.1451766, 0.1025938, 1.358981, 1, 1, 1, 1, 1,
0.1506737, -0.4679543, 1.816303, 1, 1, 1, 1, 1,
0.1534603, 0.5485569, -0.4727677, 1, 1, 1, 1, 1,
0.1550816, 2.132748, 0.08854106, 1, 1, 1, 1, 1,
0.1579776, 0.3456793, 0.6128809, 1, 1, 1, 1, 1,
0.1608128, -0.5375833, 1.496515, 1, 1, 1, 1, 1,
0.1665296, 0.3436203, 0.2544891, 1, 1, 1, 1, 1,
0.1667964, 0.8450464, 0.2871574, 1, 1, 1, 1, 1,
0.1701329, -0.8240352, 3.354989, 1, 1, 1, 1, 1,
0.1725887, 0.9339364, -1.227355, 1, 1, 1, 1, 1,
0.1772573, 1.787141, -0.1597422, 1, 1, 1, 1, 1,
0.177932, -0.7402631, 1.929921, 1, 1, 1, 1, 1,
0.1796644, -0.2587986, 1.154161, 0, 0, 1, 1, 1,
0.1809622, -0.8455454, 3.004292, 1, 0, 0, 1, 1,
0.18171, -0.1469689, 3.422396, 1, 0, 0, 1, 1,
0.1825079, 1.129595, -0.4341241, 1, 0, 0, 1, 1,
0.1826537, 1.15631, 0.5570273, 1, 0, 0, 1, 1,
0.1831546, 0.3020962, 1.429823, 1, 0, 0, 1, 1,
0.1835655, -0.2779921, 0.9595066, 0, 0, 0, 1, 1,
0.1837389, 0.9862355, 1.864461, 0, 0, 0, 1, 1,
0.1838578, 0.9909449, 1.190386, 0, 0, 0, 1, 1,
0.1897478, -0.7255912, 3.900141, 0, 0, 0, 1, 1,
0.190795, 0.1622034, 1.57295, 0, 0, 0, 1, 1,
0.192249, -2.660549, 3.31831, 0, 0, 0, 1, 1,
0.1929353, -2.138875, 3.175799, 0, 0, 0, 1, 1,
0.1969703, -1.32262, 3.950922, 1, 1, 1, 1, 1,
0.1979613, -0.5243939, 1.781313, 1, 1, 1, 1, 1,
0.198119, -1.800285, 3.670122, 1, 1, 1, 1, 1,
0.1984921, 0.04287413, 1.878948, 1, 1, 1, 1, 1,
0.2022673, -1.405078, 2.94466, 1, 1, 1, 1, 1,
0.205469, -0.869445, 2.349018, 1, 1, 1, 1, 1,
0.2125174, 1.064967, -1.257701, 1, 1, 1, 1, 1,
0.2137945, -1.002012, 3.505409, 1, 1, 1, 1, 1,
0.21482, -1.137395, 3.025551, 1, 1, 1, 1, 1,
0.2154145, -0.6493398, 2.67842, 1, 1, 1, 1, 1,
0.2165471, -1.255007, 3.906717, 1, 1, 1, 1, 1,
0.2215613, -0.1686387, 3.962113, 1, 1, 1, 1, 1,
0.2253823, 0.6256547, -0.4720174, 1, 1, 1, 1, 1,
0.2317668, 1.058627, 1.345296, 1, 1, 1, 1, 1,
0.2327446, 0.223346, 0.4858233, 1, 1, 1, 1, 1,
0.236374, -1.079329, 2.518115, 0, 0, 1, 1, 1,
0.2365756, -0.665302, 3.304316, 1, 0, 0, 1, 1,
0.2380713, -1.13966, 2.989576, 1, 0, 0, 1, 1,
0.2443583, 0.1503411, 2.391374, 1, 0, 0, 1, 1,
0.2455844, -2.555268, 2.978605, 1, 0, 0, 1, 1,
0.249011, 0.6720126, 0.7425304, 1, 0, 0, 1, 1,
0.2491222, -0.102471, 2.829926, 0, 0, 0, 1, 1,
0.2495136, -0.5646404, 1.598807, 0, 0, 0, 1, 1,
0.2512662, 0.9295536, -0.4707116, 0, 0, 0, 1, 1,
0.2517649, -0.1649903, 2.298614, 0, 0, 0, 1, 1,
0.2547709, -0.02469661, 2.100398, 0, 0, 0, 1, 1,
0.2548628, -1.335073, 2.890599, 0, 0, 0, 1, 1,
0.2560425, -0.5936309, 1.643549, 0, 0, 0, 1, 1,
0.2673231, -1.460707, 3.559196, 1, 1, 1, 1, 1,
0.2702413, 0.445071, 1.038397, 1, 1, 1, 1, 1,
0.2732976, -0.5240327, 2.693734, 1, 1, 1, 1, 1,
0.2740391, -0.09854523, 2.872018, 1, 1, 1, 1, 1,
0.2747719, -0.2821488, 0.4634798, 1, 1, 1, 1, 1,
0.2774672, 0.2288954, 1.487729, 1, 1, 1, 1, 1,
0.2785025, 0.2823147, -0.700497, 1, 1, 1, 1, 1,
0.2803083, -0.9019223, 1.229944, 1, 1, 1, 1, 1,
0.2823328, 0.5512938, -0.3255362, 1, 1, 1, 1, 1,
0.282535, 1.13901, 1.404085, 1, 1, 1, 1, 1,
0.2859173, -0.03872185, 1.449173, 1, 1, 1, 1, 1,
0.2930856, 0.4089116, 2.072915, 1, 1, 1, 1, 1,
0.2961984, 0.07931656, 1.272795, 1, 1, 1, 1, 1,
0.2963083, -1.867807, 4.48545, 1, 1, 1, 1, 1,
0.2973853, -0.6116302, 4.040152, 1, 1, 1, 1, 1,
0.3031968, 0.7620432, 0.884729, 0, 0, 1, 1, 1,
0.3086604, -0.2052542, 0.5651993, 1, 0, 0, 1, 1,
0.3099552, -0.2289756, 2.428175, 1, 0, 0, 1, 1,
0.3133515, 1.824868, 1.345516, 1, 0, 0, 1, 1,
0.3160058, -0.4683647, 2.755673, 1, 0, 0, 1, 1,
0.3224534, 0.8433908, 0.8253456, 1, 0, 0, 1, 1,
0.3230038, -1.198897, 2.685565, 0, 0, 0, 1, 1,
0.3236022, 1.310027, 0.3110956, 0, 0, 0, 1, 1,
0.3271082, 2.864691, 0.4971513, 0, 0, 0, 1, 1,
0.3292471, 1.375872, -0.3894373, 0, 0, 0, 1, 1,
0.3323517, 0.005139602, 2.198159, 0, 0, 0, 1, 1,
0.333828, -0.2361054, 1.273262, 0, 0, 0, 1, 1,
0.3340949, -0.9739968, 3.410766, 0, 0, 0, 1, 1,
0.3375286, 0.6628589, 1.581205, 1, 1, 1, 1, 1,
0.3395697, -0.0902759, 1.634912, 1, 1, 1, 1, 1,
0.3416305, 2.179679, 1.313404, 1, 1, 1, 1, 1,
0.343748, 0.5194784, -0.4307119, 1, 1, 1, 1, 1,
0.3449675, 0.2679373, 1.02417, 1, 1, 1, 1, 1,
0.358016, -0.9288291, 2.145177, 1, 1, 1, 1, 1,
0.3657763, 0.4281151, 0.7447736, 1, 1, 1, 1, 1,
0.3661848, 2.239418, -0.1862104, 1, 1, 1, 1, 1,
0.3666172, 0.8465993, 0.2143486, 1, 1, 1, 1, 1,
0.3681983, -1.122255, 2.702038, 1, 1, 1, 1, 1,
0.3732562, 1.553799, -0.1079736, 1, 1, 1, 1, 1,
0.3743935, 0.6243168, -0.1851085, 1, 1, 1, 1, 1,
0.3760815, 0.5426405, 1.163046, 1, 1, 1, 1, 1,
0.384937, -1.117831, 3.604185, 1, 1, 1, 1, 1,
0.3902804, 1.096894, -0.3434256, 1, 1, 1, 1, 1,
0.3932641, -2.203223, 2.921973, 0, 0, 1, 1, 1,
0.3951947, 0.09901223, -0.0476869, 1, 0, 0, 1, 1,
0.3991609, -0.4772385, 1.859704, 1, 0, 0, 1, 1,
0.4097174, 2.137864, 0.616955, 1, 0, 0, 1, 1,
0.4112279, 0.5194045, 2.381309, 1, 0, 0, 1, 1,
0.4123187, -0.3610548, 1.974197, 1, 0, 0, 1, 1,
0.4139742, -0.7381803, 3.467434, 0, 0, 0, 1, 1,
0.4191402, 0.3476612, 0.5182667, 0, 0, 0, 1, 1,
0.4224849, 0.4514868, -0.5077575, 0, 0, 0, 1, 1,
0.4237706, 2.489586, -0.819289, 0, 0, 0, 1, 1,
0.4245944, -2.055691, 3.455872, 0, 0, 0, 1, 1,
0.4261475, -0.006637853, 0.3677749, 0, 0, 0, 1, 1,
0.4287694, -1.364824, 3.366751, 0, 0, 0, 1, 1,
0.4365754, 1.468624, 1.762822, 1, 1, 1, 1, 1,
0.4378678, 1.652732, 0.6166457, 1, 1, 1, 1, 1,
0.4394896, -2.467736, 2.174485, 1, 1, 1, 1, 1,
0.4409549, -0.794952, -0.08809645, 1, 1, 1, 1, 1,
0.4429803, -0.7558194, 2.917868, 1, 1, 1, 1, 1,
0.4470081, -1.235014, 3.888638, 1, 1, 1, 1, 1,
0.4487245, -0.2121219, 3.002092, 1, 1, 1, 1, 1,
0.4527748, -0.1144402, 1.427062, 1, 1, 1, 1, 1,
0.4545782, 0.2790793, 1.235192, 1, 1, 1, 1, 1,
0.4613868, -0.09201972, 1.15436, 1, 1, 1, 1, 1,
0.4644388, 0.1030538, 0.8025049, 1, 1, 1, 1, 1,
0.4670624, 1.034035, 1.870579, 1, 1, 1, 1, 1,
0.4673275, -0.5861341, 2.321194, 1, 1, 1, 1, 1,
0.4764651, 0.6216153, 0.4666296, 1, 1, 1, 1, 1,
0.4799201, -0.9933407, 2.410564, 1, 1, 1, 1, 1,
0.4799308, -0.8016573, 0.9745898, 0, 0, 1, 1, 1,
0.4825322, -0.2634002, 0.5481268, 1, 0, 0, 1, 1,
0.4831351, 0.1219453, 1.2632, 1, 0, 0, 1, 1,
0.4840118, 0.3897521, 1.814351, 1, 0, 0, 1, 1,
0.4876381, -0.6884511, 2.945149, 1, 0, 0, 1, 1,
0.4896654, 0.960002, 0.5146385, 1, 0, 0, 1, 1,
0.4903494, 1.661372, 0.6636356, 0, 0, 0, 1, 1,
0.4933505, -0.399387, 1.123233, 0, 0, 0, 1, 1,
0.4943414, -0.0424218, 0.8186256, 0, 0, 0, 1, 1,
0.494603, -1.326591, 3.659642, 0, 0, 0, 1, 1,
0.5036529, 0.7186737, 1.035076, 0, 0, 0, 1, 1,
0.5062032, -0.6499079, 3.519692, 0, 0, 0, 1, 1,
0.5077106, 0.2267989, 1.131285, 0, 0, 0, 1, 1,
0.5088469, -0.3922972, 4.598989, 1, 1, 1, 1, 1,
0.5103076, -0.9128129, 3.747792, 1, 1, 1, 1, 1,
0.5177377, -0.008964219, 0.8915825, 1, 1, 1, 1, 1,
0.5195196, 0.4436175, 1.093583, 1, 1, 1, 1, 1,
0.523841, -0.7175536, 5.522184, 1, 1, 1, 1, 1,
0.5253317, 2.246205, 1.876166, 1, 1, 1, 1, 1,
0.5340601, -0.6641039, 0.483706, 1, 1, 1, 1, 1,
0.5349081, -0.5010383, 0.3202322, 1, 1, 1, 1, 1,
0.5391666, -0.6782752, 1.201461, 1, 1, 1, 1, 1,
0.5406036, -0.3156809, 2.273891, 1, 1, 1, 1, 1,
0.5422439, 0.6722631, -0.08997938, 1, 1, 1, 1, 1,
0.5458948, 0.9093447, 1.156923, 1, 1, 1, 1, 1,
0.5477228, -1.347376, 2.821625, 1, 1, 1, 1, 1,
0.5484596, 0.02207846, 1.004071, 1, 1, 1, 1, 1,
0.5532501, -0.5103047, 1.150099, 1, 1, 1, 1, 1,
0.5553641, 2.415253, 0.2532814, 0, 0, 1, 1, 1,
0.5691952, -0.2531227, 0.3369412, 1, 0, 0, 1, 1,
0.5708203, -0.1616375, 0.7626782, 1, 0, 0, 1, 1,
0.5729252, 1.779359, 1.726573, 1, 0, 0, 1, 1,
0.5735825, 0.5635265, 1.970818, 1, 0, 0, 1, 1,
0.5757899, 0.2127876, 1.625739, 1, 0, 0, 1, 1,
0.5760661, 1.48595, -0.6490818, 0, 0, 0, 1, 1,
0.590086, 2.720683, 0.4423694, 0, 0, 0, 1, 1,
0.5918992, 0.2283546, 2.985329, 0, 0, 0, 1, 1,
0.5966217, 1.646001, 0.4031402, 0, 0, 0, 1, 1,
0.5969078, -0.7981907, 3.086977, 0, 0, 0, 1, 1,
0.5981203, -0.23446, 3.902864, 0, 0, 0, 1, 1,
0.5982879, -0.1986149, 2.058148, 0, 0, 0, 1, 1,
0.6006398, 1.73735, 1.033522, 1, 1, 1, 1, 1,
0.6050699, 0.4484892, -0.2815934, 1, 1, 1, 1, 1,
0.6075802, 0.9294909, -1.039748, 1, 1, 1, 1, 1,
0.6108438, 0.8426155, -0.3743011, 1, 1, 1, 1, 1,
0.6137472, 0.7276512, 1.143342, 1, 1, 1, 1, 1,
0.6162846, -0.3708769, 0.8857116, 1, 1, 1, 1, 1,
0.6181453, -1.806973, 0.7859082, 1, 1, 1, 1, 1,
0.618288, -0.4069288, 2.107108, 1, 1, 1, 1, 1,
0.6220076, -1.499195, 3.407542, 1, 1, 1, 1, 1,
0.6221147, 0.9328514, 0.08833797, 1, 1, 1, 1, 1,
0.6342794, -0.7773923, 3.514618, 1, 1, 1, 1, 1,
0.6374959, -2.093611, 2.571316, 1, 1, 1, 1, 1,
0.6375126, -1.683613, 0.8993298, 1, 1, 1, 1, 1,
0.6389029, 1.271823, 1.003159, 1, 1, 1, 1, 1,
0.6440772, -0.8605315, 2.658835, 1, 1, 1, 1, 1,
0.6457152, -0.5745943, 1.926872, 0, 0, 1, 1, 1,
0.6536075, 0.944957, 1.10342, 1, 0, 0, 1, 1,
0.654519, -0.5549005, 2.7322, 1, 0, 0, 1, 1,
0.6576866, 0.4268282, 1.255992, 1, 0, 0, 1, 1,
0.6672394, -1.436906, 1.91265, 1, 0, 0, 1, 1,
0.6688064, -0.363799, 1.207268, 1, 0, 0, 1, 1,
0.6768539, -0.6333027, 2.39146, 0, 0, 0, 1, 1,
0.6844593, -0.2669942, 1.417063, 0, 0, 0, 1, 1,
0.6847115, 1.447193, -0.1434457, 0, 0, 0, 1, 1,
0.689385, 0.2344893, 0.6797985, 0, 0, 0, 1, 1,
0.6904132, 0.1145672, -0.0421817, 0, 0, 0, 1, 1,
0.6907812, -1.105638, 2.194716, 0, 0, 0, 1, 1,
0.6947719, 0.4718025, 2.732295, 0, 0, 0, 1, 1,
0.6953367, -0.6323243, 1.920063, 1, 1, 1, 1, 1,
0.6954244, 0.4785255, 0.7845063, 1, 1, 1, 1, 1,
0.7047977, -1.260599, 1.578153, 1, 1, 1, 1, 1,
0.7060903, 1.519495, -0.3261369, 1, 1, 1, 1, 1,
0.7061598, 0.5302112, 0.2681737, 1, 1, 1, 1, 1,
0.7070789, 0.09265801, 0.02896611, 1, 1, 1, 1, 1,
0.7092754, 0.7589292, 0.6861297, 1, 1, 1, 1, 1,
0.7100376, 1.123632, -0.6003014, 1, 1, 1, 1, 1,
0.7144523, -0.08048999, 0.1436255, 1, 1, 1, 1, 1,
0.7147415, -1.148787, 2.881859, 1, 1, 1, 1, 1,
0.7159677, 0.7368047, 1.773694, 1, 1, 1, 1, 1,
0.7169148, 1.901264, -1.601818, 1, 1, 1, 1, 1,
0.7220614, -1.586445, 4.099758, 1, 1, 1, 1, 1,
0.7287982, 0.9898834, 2.67801, 1, 1, 1, 1, 1,
0.7296315, -0.4453388, 1.769133, 1, 1, 1, 1, 1,
0.7332064, 0.5555084, 2.243361, 0, 0, 1, 1, 1,
0.7369806, 0.2929443, 0.2454483, 1, 0, 0, 1, 1,
0.7434741, 0.8730755, 1.153602, 1, 0, 0, 1, 1,
0.7467022, 0.9512983, 0.7675334, 1, 0, 0, 1, 1,
0.7486699, -1.687385, 1.850857, 1, 0, 0, 1, 1,
0.7490966, 1.684241, -1.095676, 1, 0, 0, 1, 1,
0.7501364, 1.442755, -1.234749, 0, 0, 0, 1, 1,
0.7503256, -1.176107, 1.185845, 0, 0, 0, 1, 1,
0.7621695, 0.8120221, 1.27581, 0, 0, 0, 1, 1,
0.7667637, -0.2290976, 1.420999, 0, 0, 0, 1, 1,
0.7671482, 0.4250565, -0.7169966, 0, 0, 0, 1, 1,
0.7737703, 0.06483355, 0.5294895, 0, 0, 0, 1, 1,
0.7751163, -0.2404457, 0.8998438, 0, 0, 0, 1, 1,
0.7774984, 0.9011155, 1.751154, 1, 1, 1, 1, 1,
0.7786486, -0.3837922, 0.3876247, 1, 1, 1, 1, 1,
0.7855906, -0.7452945, 3.914038, 1, 1, 1, 1, 1,
0.7896547, -0.6908909, 1.35825, 1, 1, 1, 1, 1,
0.799311, -1.181607, 2.770235, 1, 1, 1, 1, 1,
0.8074309, -1.952462, 1.792139, 1, 1, 1, 1, 1,
0.8183656, 1.849361, 1.152149, 1, 1, 1, 1, 1,
0.8206339, -0.4160399, 2.018068, 1, 1, 1, 1, 1,
0.8292833, 1.552548, 0.3976435, 1, 1, 1, 1, 1,
0.8323374, -0.5550137, 2.952022, 1, 1, 1, 1, 1,
0.8360376, 1.511139, 0.945766, 1, 1, 1, 1, 1,
0.83724, 2.426451, 0.4280578, 1, 1, 1, 1, 1,
0.8415329, -0.0976647, 0.8103566, 1, 1, 1, 1, 1,
0.8416103, -1.687162, 1.890759, 1, 1, 1, 1, 1,
0.8431152, 0.7681875, 2.092668, 1, 1, 1, 1, 1,
0.8434805, -1.054502, 2.8907, 0, 0, 1, 1, 1,
0.8435746, 0.4247601, 1.41633, 1, 0, 0, 1, 1,
0.8481432, 0.1425107, 3.253884, 1, 0, 0, 1, 1,
0.851104, -0.8041748, 3.538476, 1, 0, 0, 1, 1,
0.8526326, 0.8382076, 3.537792, 1, 0, 0, 1, 1,
0.8595498, 0.2496253, 2.274162, 1, 0, 0, 1, 1,
0.8613758, 0.1709905, 3.858538, 0, 0, 0, 1, 1,
0.8623224, -1.709916, 3.667443, 0, 0, 0, 1, 1,
0.8697107, -0.1366588, 1.460248, 0, 0, 0, 1, 1,
0.8703961, -0.6131736, 3.248476, 0, 0, 0, 1, 1,
0.8761106, -0.3419919, 0.4575388, 0, 0, 0, 1, 1,
0.8824174, -0.4662236, 1.561841, 0, 0, 0, 1, 1,
0.8846231, -1.512775, 2.673693, 0, 0, 0, 1, 1,
0.8849692, 0.2959508, -0.936555, 1, 1, 1, 1, 1,
0.8871514, -0.6095032, 1.86883, 1, 1, 1, 1, 1,
0.8896107, -1.661904, 1.482117, 1, 1, 1, 1, 1,
0.8969144, 0.9953796, 2.090035, 1, 1, 1, 1, 1,
0.8972324, 0.4022672, 2.029999, 1, 1, 1, 1, 1,
0.8974696, 0.5991421, 3.022552, 1, 1, 1, 1, 1,
0.903242, -1.04743, 2.075046, 1, 1, 1, 1, 1,
0.9045401, 0.1138762, 1.429105, 1, 1, 1, 1, 1,
0.9078851, 0.5033479, 1.437045, 1, 1, 1, 1, 1,
0.9151418, -0.8879834, 2.122487, 1, 1, 1, 1, 1,
0.9154544, 0.4740561, 0.3543371, 1, 1, 1, 1, 1,
0.9173534, -1.228239, 2.312046, 1, 1, 1, 1, 1,
0.9201714, -0.8858542, 3.192019, 1, 1, 1, 1, 1,
0.9228709, 1.093784, 0.0528654, 1, 1, 1, 1, 1,
0.9280752, -0.2295489, 2.228271, 1, 1, 1, 1, 1,
0.9287264, -0.6705037, 1.898856, 0, 0, 1, 1, 1,
0.9288515, 1.568985, -0.5212618, 1, 0, 0, 1, 1,
0.9319656, -0.7230956, 1.660899, 1, 0, 0, 1, 1,
0.9338661, 0.3362275, 1.762945, 1, 0, 0, 1, 1,
0.9370366, -0.1948238, 0.9049443, 1, 0, 0, 1, 1,
0.9385247, -0.9735175, 1.454762, 1, 0, 0, 1, 1,
0.948118, 1.701933, 1.07548, 0, 0, 0, 1, 1,
0.9496815, -0.7002132, 1.565468, 0, 0, 0, 1, 1,
0.9534845, 0.2857669, 0.5612794, 0, 0, 0, 1, 1,
0.9544869, -1.730296, 3.166804, 0, 0, 0, 1, 1,
0.9657156, 0.9545016, 0.1360059, 0, 0, 0, 1, 1,
0.9659684, -0.2608115, 1.816081, 0, 0, 0, 1, 1,
0.9767983, -0.7099649, 2.435083, 0, 0, 0, 1, 1,
0.9784663, 1.687271, 0.3953636, 1, 1, 1, 1, 1,
0.9815698, 0.7686622, 1.213257, 1, 1, 1, 1, 1,
0.9853982, -0.5570866, 0.2668511, 1, 1, 1, 1, 1,
0.9863296, -0.1038548, 1.348916, 1, 1, 1, 1, 1,
0.998333, 0.6431912, -0.01282229, 1, 1, 1, 1, 1,
1.000728, 1.202268, 1.399879, 1, 1, 1, 1, 1,
1.001108, -1.273322, 1.722541, 1, 1, 1, 1, 1,
1.009021, 1.126095, 1.061347, 1, 1, 1, 1, 1,
1.009971, -0.4734136, 1.124196, 1, 1, 1, 1, 1,
1.014147, 0.02304825, 0.7812591, 1, 1, 1, 1, 1,
1.016202, 0.1919881, 0.4760736, 1, 1, 1, 1, 1,
1.017936, 0.845944, 1.709596, 1, 1, 1, 1, 1,
1.025602, -0.9020892, 2.538968, 1, 1, 1, 1, 1,
1.027215, -0.4384536, 3.007981, 1, 1, 1, 1, 1,
1.029928, 0.09490674, 1.511419, 1, 1, 1, 1, 1,
1.031363, 0.260212, 0.8446841, 0, 0, 1, 1, 1,
1.032294, -0.03241875, 1.497479, 1, 0, 0, 1, 1,
1.032898, -0.3988958, 3.755283, 1, 0, 0, 1, 1,
1.034818, -0.01672345, 0.2624499, 1, 0, 0, 1, 1,
1.039451, -0.7888538, 0.6982921, 1, 0, 0, 1, 1,
1.040128, -0.2490223, 1.249072, 1, 0, 0, 1, 1,
1.044491, 0.1583846, 2.733494, 0, 0, 0, 1, 1,
1.049973, -1.428588, 2.491746, 0, 0, 0, 1, 1,
1.066794, -0.3619435, 1.983159, 0, 0, 0, 1, 1,
1.073893, -0.2193235, 0.9366612, 0, 0, 0, 1, 1,
1.097269, 0.2411752, 2.353046, 0, 0, 0, 1, 1,
1.104012, 1.330609, 1.197041, 0, 0, 0, 1, 1,
1.109334, -1.738217, 2.91039, 0, 0, 0, 1, 1,
1.117674, 0.3571041, 1.218011, 1, 1, 1, 1, 1,
1.118454, -2.926531, 1.649346, 1, 1, 1, 1, 1,
1.120242, 0.5859585, 1.359255, 1, 1, 1, 1, 1,
1.120431, -0.9312326, 3.607364, 1, 1, 1, 1, 1,
1.120884, 0.9348115, 0.5048892, 1, 1, 1, 1, 1,
1.126737, 0.602859, 2.226336, 1, 1, 1, 1, 1,
1.133153, 0.1298722, -0.05512984, 1, 1, 1, 1, 1,
1.136919, -0.987632, 1.052742, 1, 1, 1, 1, 1,
1.137989, -0.001731496, 0.7814962, 1, 1, 1, 1, 1,
1.141069, -0.7772221, 2.955181, 1, 1, 1, 1, 1,
1.141567, 0.3687444, 1.874448, 1, 1, 1, 1, 1,
1.145606, 0.1107958, 2.405903, 1, 1, 1, 1, 1,
1.147475, -2.782737, 2.490769, 1, 1, 1, 1, 1,
1.162629, -0.1178199, 2.504551, 1, 1, 1, 1, 1,
1.172292, -0.7964036, 1.405421, 1, 1, 1, 1, 1,
1.174895, 1.053307, 0.2886123, 0, 0, 1, 1, 1,
1.193437, 0.4697204, -0.08791335, 1, 0, 0, 1, 1,
1.196268, -0.6929237, 2.147568, 1, 0, 0, 1, 1,
1.205188, -0.4286244, 2.133508, 1, 0, 0, 1, 1,
1.212582, 0.5842656, 1.09831, 1, 0, 0, 1, 1,
1.2194, 0.3954146, -0.163662, 1, 0, 0, 1, 1,
1.222745, 0.1229287, 0.3913705, 0, 0, 0, 1, 1,
1.232324, -0.5927187, 1.873003, 0, 0, 0, 1, 1,
1.232883, -0.01719695, 0.8355235, 0, 0, 0, 1, 1,
1.239966, -1.348238, 3.697319, 0, 0, 0, 1, 1,
1.24232, -1.963133, 2.800298, 0, 0, 0, 1, 1,
1.244082, -0.3117016, 2.567997, 0, 0, 0, 1, 1,
1.266054, -0.6074537, 2.910125, 0, 0, 0, 1, 1,
1.282353, 0.6057627, 1.063235, 1, 1, 1, 1, 1,
1.285904, -0.4240638, 2.091527, 1, 1, 1, 1, 1,
1.299184, 0.5589927, 2.920685, 1, 1, 1, 1, 1,
1.29978, -1.138928, 2.619401, 1, 1, 1, 1, 1,
1.314714, -0.5092511, 0.5882488, 1, 1, 1, 1, 1,
1.317769, 0.2783717, 0.7517816, 1, 1, 1, 1, 1,
1.321592, 1.420021, -0.1340907, 1, 1, 1, 1, 1,
1.334088, -0.8091572, 1.019497, 1, 1, 1, 1, 1,
1.339026, -1.03142, 4.092821, 1, 1, 1, 1, 1,
1.344567, 0.3561961, 0.482007, 1, 1, 1, 1, 1,
1.354025, 1.780197, 2.362827, 1, 1, 1, 1, 1,
1.357232, -1.279569, 2.033598, 1, 1, 1, 1, 1,
1.361275, 0.7487575, -0.1814657, 1, 1, 1, 1, 1,
1.379996, 0.3143692, 1.328249, 1, 1, 1, 1, 1,
1.380791, -1.854425, 2.460539, 1, 1, 1, 1, 1,
1.381796, -0.2124545, 1.03227, 0, 0, 1, 1, 1,
1.391441, 1.439969, 0.7282194, 1, 0, 0, 1, 1,
1.39323, -0.5972037, 1.69491, 1, 0, 0, 1, 1,
1.39432, 2.214497, 0.9859161, 1, 0, 0, 1, 1,
1.398628, 0.5873815, 1.043005, 1, 0, 0, 1, 1,
1.404391, 2.405024, -0.3754191, 1, 0, 0, 1, 1,
1.412007, 1.56673, -0.2848328, 0, 0, 0, 1, 1,
1.417192, 1.041786, 1.140993, 0, 0, 0, 1, 1,
1.417253, 1.873466, 0.3101957, 0, 0, 0, 1, 1,
1.427993, -2.119112, 1.938936, 0, 0, 0, 1, 1,
1.429414, -0.2819307, 2.676474, 0, 0, 0, 1, 1,
1.431651, -0.08042371, 0.9719715, 0, 0, 0, 1, 1,
1.449061, 0.3907856, 2.423581, 0, 0, 0, 1, 1,
1.471527, 1.13799, 1.383068, 1, 1, 1, 1, 1,
1.482547, 0.5693521, 1.362444, 1, 1, 1, 1, 1,
1.504124, 1.231241, 1.152601, 1, 1, 1, 1, 1,
1.523959, 0.3615395, 1.762602, 1, 1, 1, 1, 1,
1.538944, 0.5055394, 0.8982085, 1, 1, 1, 1, 1,
1.592508, 0.242737, 0.6067619, 1, 1, 1, 1, 1,
1.597611, -0.6904361, 1.603785, 1, 1, 1, 1, 1,
1.604787, -0.5978023, 1.302327, 1, 1, 1, 1, 1,
1.61303, 0.24005, 3.030591, 1, 1, 1, 1, 1,
1.616504, -0.957499, 1.802467, 1, 1, 1, 1, 1,
1.61851, -1.157221, 3.565054, 1, 1, 1, 1, 1,
1.622521, -1.020179, 1.617033, 1, 1, 1, 1, 1,
1.62327, 0.4953547, -0.6826534, 1, 1, 1, 1, 1,
1.649127, 0.02357796, 0.7510408, 1, 1, 1, 1, 1,
1.655748, 1.420969, 0.7026471, 1, 1, 1, 1, 1,
1.656529, 0.5797664, 0.5343004, 0, 0, 1, 1, 1,
1.66045, 0.5711666, 1.5244, 1, 0, 0, 1, 1,
1.693991, -0.3074042, 1.695902, 1, 0, 0, 1, 1,
1.715162, 1.210669, 2.068788, 1, 0, 0, 1, 1,
1.718074, 0.294798, 0.0922238, 1, 0, 0, 1, 1,
1.733033, 0.9163043, 1.065916, 1, 0, 0, 1, 1,
1.734711, 1.650171, -0.07091974, 0, 0, 0, 1, 1,
1.735571, 0.2801754, 2.516907, 0, 0, 0, 1, 1,
1.755643, -0.757713, 0.984275, 0, 0, 0, 1, 1,
1.780625, 0.1268204, 1.809149, 0, 0, 0, 1, 1,
1.792064, 1.377874, 1.140508, 0, 0, 0, 1, 1,
1.798099, 0.7699208, 0.5523494, 0, 0, 0, 1, 1,
1.830891, 0.5923966, 1.032203, 0, 0, 0, 1, 1,
1.839367, -0.6289067, 2.685453, 1, 1, 1, 1, 1,
1.848649, -0.4120297, 0.1655531, 1, 1, 1, 1, 1,
1.851343, 0.1762565, 1.613683, 1, 1, 1, 1, 1,
1.854035, -0.7485118, 1.61052, 1, 1, 1, 1, 1,
1.864791, 0.1521302, 0.7582833, 1, 1, 1, 1, 1,
1.893542, 0.3457468, 1.760365, 1, 1, 1, 1, 1,
1.894221, -0.2839891, 2.919969, 1, 1, 1, 1, 1,
1.897561, -0.2038362, 2.877615, 1, 1, 1, 1, 1,
1.932237, -1.309685, 2.99351, 1, 1, 1, 1, 1,
1.998618, -1.11437, 2.212906, 1, 1, 1, 1, 1,
2.022118, 0.01605262, 3.316922, 1, 1, 1, 1, 1,
2.038056, 1.09702, 0.2495811, 1, 1, 1, 1, 1,
2.046739, -0.1026332, 1.706603, 1, 1, 1, 1, 1,
2.055869, 0.1907039, 1.381802, 1, 1, 1, 1, 1,
2.07882, -1.293025, 2.888178, 1, 1, 1, 1, 1,
2.091303, -0.2605492, 1.821667, 0, 0, 1, 1, 1,
2.099254, -0.2271758, 1.049586, 1, 0, 0, 1, 1,
2.100358, -0.6171613, 2.488618, 1, 0, 0, 1, 1,
2.103318, -0.8297348, 2.046057, 1, 0, 0, 1, 1,
2.12311, 0.1975719, 3.59087, 1, 0, 0, 1, 1,
2.128727, 1.167788, 2.19618, 1, 0, 0, 1, 1,
2.13536, -1.385051, 3.518951, 0, 0, 0, 1, 1,
2.161062, 0.2265826, 3.643263, 0, 0, 0, 1, 1,
2.179473, -0.1909115, 1.346731, 0, 0, 0, 1, 1,
2.259088, 0.4174758, 1.223508, 0, 0, 0, 1, 1,
2.281713, -0.2449812, 1.656135, 0, 0, 0, 1, 1,
2.454211, 1.011042, 3.357068, 0, 0, 0, 1, 1,
2.458325, 1.155778, 1.982779, 0, 0, 0, 1, 1,
2.489326, -0.3065195, 1.744509, 1, 1, 1, 1, 1,
2.590282, 0.6750236, 0.7263883, 1, 1, 1, 1, 1,
2.74053, -1.890597, 3.694426, 1, 1, 1, 1, 1,
2.745215, -0.7808018, 0.8638061, 1, 1, 1, 1, 1,
2.83482, -0.1356909, 2.241999, 1, 1, 1, 1, 1,
2.886032, 0.7112532, 2.493117, 1, 1, 1, 1, 1,
3.073341, -0.1741454, 0.9359001, 1, 1, 1, 1, 1
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
var radius = 9.372405;
var distance = 32.92018;
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
mvMatrix.translate( -0.1172621, 0.1448051, -0.3132691 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92018);
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