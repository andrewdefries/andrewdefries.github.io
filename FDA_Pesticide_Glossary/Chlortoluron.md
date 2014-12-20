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
-3.646294, -0.6178126, 0.571956, 1, 0, 0, 1,
-3.187145, -2.034882, -2.212532, 1, 0.007843138, 0, 1,
-2.969409, 1.094426, -0.2855999, 1, 0.01176471, 0, 1,
-2.845846, 0.7879387, -1.186182, 1, 0.01960784, 0, 1,
-2.682385, -0.9458625, -2.739679, 1, 0.02352941, 0, 1,
-2.674298, -0.8420472, -2.297202, 1, 0.03137255, 0, 1,
-2.623958, -1.184058, -0.07957351, 1, 0.03529412, 0, 1,
-2.622246, -0.6054544, -0.3673805, 1, 0.04313726, 0, 1,
-2.573484, 1.165456, -1.156256, 1, 0.04705882, 0, 1,
-2.442831, 0.8487034, -1.648939, 1, 0.05490196, 0, 1,
-2.427298, -0.1625774, -0.4777765, 1, 0.05882353, 0, 1,
-2.351836, -0.1894152, -2.072375, 1, 0.06666667, 0, 1,
-2.343781, 2.375149, -0.956193, 1, 0.07058824, 0, 1,
-2.332119, 0.8454149, -1.864315, 1, 0.07843138, 0, 1,
-2.315877, 1.417958, -0.09447363, 1, 0.08235294, 0, 1,
-2.286551, 0.5921872, -2.173415, 1, 0.09019608, 0, 1,
-2.253718, -0.9572133, -0.9419788, 1, 0.09411765, 0, 1,
-2.242734, -1.205566, -0.8088881, 1, 0.1019608, 0, 1,
-2.234737, -1.005012, -2.23784, 1, 0.1098039, 0, 1,
-2.218578, 0.3048914, -0.4334562, 1, 0.1137255, 0, 1,
-2.209766, 1.188069, -1.817948, 1, 0.1215686, 0, 1,
-2.184077, -0.8395497, -2.297042, 1, 0.1254902, 0, 1,
-2.172049, -1.34042, -3.274739, 1, 0.1333333, 0, 1,
-2.155167, 0.4546218, -0.3534424, 1, 0.1372549, 0, 1,
-2.110002, 0.3898031, -0.4560881, 1, 0.145098, 0, 1,
-2.100552, 0.9763677, -1.759348, 1, 0.1490196, 0, 1,
-2.087229, -0.2697253, -1.172706, 1, 0.1568628, 0, 1,
-2.044137, -0.9150419, -0.9604722, 1, 0.1607843, 0, 1,
-2.007015, -1.72057, -2.393519, 1, 0.1686275, 0, 1,
-1.968159, -0.7314681, -2.827669, 1, 0.172549, 0, 1,
-1.956605, -0.09864285, -3.608833, 1, 0.1803922, 0, 1,
-1.935323, 0.7359531, 0.1822141, 1, 0.1843137, 0, 1,
-1.853436, 1.86934, -0.5731843, 1, 0.1921569, 0, 1,
-1.851857, 0.2940637, -1.600575, 1, 0.1960784, 0, 1,
-1.84057, -1.192751, -3.263582, 1, 0.2039216, 0, 1,
-1.789311, 0.6825958, -2.016357, 1, 0.2117647, 0, 1,
-1.779934, 1.513434, -0.1098911, 1, 0.2156863, 0, 1,
-1.775905, 0.5494924, 0.8260809, 1, 0.2235294, 0, 1,
-1.771697, 0.08982372, -1.423289, 1, 0.227451, 0, 1,
-1.770496, 1.567162, -2.104381, 1, 0.2352941, 0, 1,
-1.766452, -1.150882, -4.428609, 1, 0.2392157, 0, 1,
-1.761526, -0.7163675, -2.423078, 1, 0.2470588, 0, 1,
-1.752726, -0.6354834, -2.162751, 1, 0.2509804, 0, 1,
-1.749009, 0.9723572, -0.9481996, 1, 0.2588235, 0, 1,
-1.742523, -1.818494, -2.62142, 1, 0.2627451, 0, 1,
-1.731, 0.8627336, -1.261182, 1, 0.2705882, 0, 1,
-1.707699, 0.5151157, -2.522429, 1, 0.2745098, 0, 1,
-1.698693, -0.5122802, -2.593289, 1, 0.282353, 0, 1,
-1.692838, 0.2039451, -2.030257, 1, 0.2862745, 0, 1,
-1.690642, 1.989512, -1.95775, 1, 0.2941177, 0, 1,
-1.671416, -1.12726, -1.475721, 1, 0.3019608, 0, 1,
-1.670169, -1.270804, -0.7564664, 1, 0.3058824, 0, 1,
-1.650355, 3.090721, -0.980097, 1, 0.3137255, 0, 1,
-1.621, -0.1663826, -0.8126391, 1, 0.3176471, 0, 1,
-1.619103, 0.1216256, -1.486376, 1, 0.3254902, 0, 1,
-1.617985, -1.638029, -2.516372, 1, 0.3294118, 0, 1,
-1.593063, 0.06826568, -0.8691285, 1, 0.3372549, 0, 1,
-1.59162, 0.04022503, -1.83846, 1, 0.3411765, 0, 1,
-1.58153, 1.430059, -0.2216413, 1, 0.3490196, 0, 1,
-1.570905, -0.8384163, -2.936266, 1, 0.3529412, 0, 1,
-1.561203, -2.458044, -3.249384, 1, 0.3607843, 0, 1,
-1.551964, 1.682319, -1.384582, 1, 0.3647059, 0, 1,
-1.536189, 0.05997731, -0.9442272, 1, 0.372549, 0, 1,
-1.534753, -0.143742, -0.6250576, 1, 0.3764706, 0, 1,
-1.522588, 0.6317858, 0.1767331, 1, 0.3843137, 0, 1,
-1.520279, -0.7273889, -1.735591, 1, 0.3882353, 0, 1,
-1.519314, -0.2645795, -0.4634755, 1, 0.3960784, 0, 1,
-1.518171, 0.6049966, -5.029537, 1, 0.4039216, 0, 1,
-1.512124, 1.125959, -2.220203, 1, 0.4078431, 0, 1,
-1.511349, -0.9376125, -0.9767702, 1, 0.4156863, 0, 1,
-1.497663, -0.5178068, -1.384259, 1, 0.4196078, 0, 1,
-1.495059, 1.125036, -1.294036, 1, 0.427451, 0, 1,
-1.482049, -0.4624939, -2.149213, 1, 0.4313726, 0, 1,
-1.480163, -0.3572708, -2.44997, 1, 0.4392157, 0, 1,
-1.474372, 0.005050812, -1.326202, 1, 0.4431373, 0, 1,
-1.470461, -0.5585791, -3.565241, 1, 0.4509804, 0, 1,
-1.461102, -0.7535704, -2.98837, 1, 0.454902, 0, 1,
-1.453501, 0.154671, -2.264836, 1, 0.4627451, 0, 1,
-1.438427, 0.2796343, -1.309431, 1, 0.4666667, 0, 1,
-1.434345, 0.1902903, -0.7656513, 1, 0.4745098, 0, 1,
-1.432165, -0.165563, -1.277702, 1, 0.4784314, 0, 1,
-1.423184, -0.02770613, -1.221527, 1, 0.4862745, 0, 1,
-1.42111, 0.1659368, -2.694201, 1, 0.4901961, 0, 1,
-1.410877, 1.839928, -0.6950305, 1, 0.4980392, 0, 1,
-1.403051, 3.39713, 1.596538, 1, 0.5058824, 0, 1,
-1.386624, 1.276886, -1.164029, 1, 0.509804, 0, 1,
-1.384365, -1.446902, -3.281892, 1, 0.5176471, 0, 1,
-1.378535, 1.905938, -0.6185209, 1, 0.5215687, 0, 1,
-1.375333, 0.3702672, 0.7326691, 1, 0.5294118, 0, 1,
-1.375048, 0.3487678, -0.6653763, 1, 0.5333334, 0, 1,
-1.37347, -0.1350499, -1.615607, 1, 0.5411765, 0, 1,
-1.371275, 0.9374773, -2.158782, 1, 0.5450981, 0, 1,
-1.368465, 1.089722, -1.002419, 1, 0.5529412, 0, 1,
-1.36618, 0.935204, 0.1236081, 1, 0.5568628, 0, 1,
-1.36217, -1.873615, -2.487831, 1, 0.5647059, 0, 1,
-1.361816, -1.892376, -3.522133, 1, 0.5686275, 0, 1,
-1.358291, -1.776973, -1.291535, 1, 0.5764706, 0, 1,
-1.356152, 2.448781, -0.5793607, 1, 0.5803922, 0, 1,
-1.354262, -0.124139, -2.017759, 1, 0.5882353, 0, 1,
-1.353929, -1.284783, -1.678118, 1, 0.5921569, 0, 1,
-1.343169, -0.7260344, -1.808476, 1, 0.6, 0, 1,
-1.322525, -0.9745326, -2.049961, 1, 0.6078432, 0, 1,
-1.315503, 1.482676, -0.3919468, 1, 0.6117647, 0, 1,
-1.315068, -0.7405689, -1.171172, 1, 0.6196079, 0, 1,
-1.311339, 0.901278, 0.9044753, 1, 0.6235294, 0, 1,
-1.303941, 2.85372, -1.269962, 1, 0.6313726, 0, 1,
-1.298941, -0.9146265, -2.051524, 1, 0.6352941, 0, 1,
-1.297049, 0.7098632, -0.290112, 1, 0.6431373, 0, 1,
-1.29474, 2.357536, -0.170201, 1, 0.6470588, 0, 1,
-1.278535, -0.2143599, -1.665406, 1, 0.654902, 0, 1,
-1.275388, -1.779324, -5.239283, 1, 0.6588235, 0, 1,
-1.271508, 2.525154, -0.8485044, 1, 0.6666667, 0, 1,
-1.270187, -1.23596, -3.364919, 1, 0.6705883, 0, 1,
-1.263678, 0.6105457, -1.787029, 1, 0.6784314, 0, 1,
-1.260109, 1.602684, -1.025998, 1, 0.682353, 0, 1,
-1.254981, -0.4572825, -0.8434254, 1, 0.6901961, 0, 1,
-1.250943, 0.1953786, -0.8669324, 1, 0.6941177, 0, 1,
-1.244943, 0.6734925, 0.004020193, 1, 0.7019608, 0, 1,
-1.239438, -1.609137, -1.548244, 1, 0.7098039, 0, 1,
-1.237967, 0.3577759, -2.08504, 1, 0.7137255, 0, 1,
-1.232521, 0.5170923, -1.729671, 1, 0.7215686, 0, 1,
-1.231646, 0.2927388, -1.503858, 1, 0.7254902, 0, 1,
-1.206018, -0.4733363, -1.062563, 1, 0.7333333, 0, 1,
-1.205948, 1.380705, -0.1945427, 1, 0.7372549, 0, 1,
-1.198464, 0.03468175, -1.27648, 1, 0.7450981, 0, 1,
-1.196847, 0.7059051, -0.8706096, 1, 0.7490196, 0, 1,
-1.193134, 0.1465524, -2.173771, 1, 0.7568628, 0, 1,
-1.191763, -1.413313, -3.21758, 1, 0.7607843, 0, 1,
-1.190505, -0.4198774, -2.260285, 1, 0.7686275, 0, 1,
-1.1899, -0.4801453, -2.270549, 1, 0.772549, 0, 1,
-1.183344, 0.4956719, -1.723194, 1, 0.7803922, 0, 1,
-1.18265, -1.80524, -3.064641, 1, 0.7843137, 0, 1,
-1.161383, -1.2261, -4.031186, 1, 0.7921569, 0, 1,
-1.157819, 1.527177, -1.113721, 1, 0.7960784, 0, 1,
-1.156771, 0.5262502, -0.4708183, 1, 0.8039216, 0, 1,
-1.155002, -2.193248, -3.029649, 1, 0.8117647, 0, 1,
-1.148253, -1.937055, -1.952556, 1, 0.8156863, 0, 1,
-1.135583, -0.1301479, -0.7582631, 1, 0.8235294, 0, 1,
-1.130878, -0.817857, -2.246306, 1, 0.827451, 0, 1,
-1.122079, -2.554553, -1.778857, 1, 0.8352941, 0, 1,
-1.121575, -0.7726982, -2.074992, 1, 0.8392157, 0, 1,
-1.118634, 0.1545314, -0.04903849, 1, 0.8470588, 0, 1,
-1.116388, 0.4619325, -2.054084, 1, 0.8509804, 0, 1,
-1.111176, -0.4526444, -2.039556, 1, 0.8588235, 0, 1,
-1.106338, -0.4183487, -1.590485, 1, 0.8627451, 0, 1,
-1.103764, -1.105404, -4.649574, 1, 0.8705882, 0, 1,
-1.101699, -0.9036971, -3.976052, 1, 0.8745098, 0, 1,
-1.100755, -2.448727, -2.71886, 1, 0.8823529, 0, 1,
-1.098997, 1.33803, -2.909113, 1, 0.8862745, 0, 1,
-1.09419, 2.091988, 0.3670759, 1, 0.8941177, 0, 1,
-1.091684, 3.006963, -0.1006635, 1, 0.8980392, 0, 1,
-1.088694, 1.592492, -1.193469, 1, 0.9058824, 0, 1,
-1.086502, -1.130083, -2.12957, 1, 0.9137255, 0, 1,
-1.086293, 0.001568271, -1.679137, 1, 0.9176471, 0, 1,
-1.076181, 0.5292342, -2.184716, 1, 0.9254902, 0, 1,
-1.068449, 1.072459, -1.096931, 1, 0.9294118, 0, 1,
-1.066628, 0.5159346, -0.6999131, 1, 0.9372549, 0, 1,
-1.061559, -1.084521, -1.738058, 1, 0.9411765, 0, 1,
-1.059706, -1.278263, -3.446612, 1, 0.9490196, 0, 1,
-1.053686, 0.3038313, -2.704848, 1, 0.9529412, 0, 1,
-1.049573, -3.016986, -2.663146, 1, 0.9607843, 0, 1,
-1.04881, -0.01318187, -1.149218, 1, 0.9647059, 0, 1,
-1.042617, -0.2827424, -1.339632, 1, 0.972549, 0, 1,
-1.038057, -0.5443389, -1.792423, 1, 0.9764706, 0, 1,
-1.037974, 0.3415137, 0.2487188, 1, 0.9843137, 0, 1,
-1.03627, 0.6409696, 0.06645534, 1, 0.9882353, 0, 1,
-1.032662, -1.113095, -2.300303, 1, 0.9960784, 0, 1,
-1.025052, 1.295873, -1.947785, 0.9960784, 1, 0, 1,
-1.022918, 0.863721, -2.160797, 0.9921569, 1, 0, 1,
-1.021804, -0.00290119, -1.982138, 0.9843137, 1, 0, 1,
-1.014753, -0.978025, -3.361513, 0.9803922, 1, 0, 1,
-1.011971, -0.4305093, -1.329786, 0.972549, 1, 0, 1,
-1.010815, 0.5094774, -0.7468187, 0.9686275, 1, 0, 1,
-1.008337, -0.9510619, -4.250117, 0.9607843, 1, 0, 1,
-1.008026, 0.2018955, -1.183859, 0.9568627, 1, 0, 1,
-1.006422, -0.3821668, -2.835388, 0.9490196, 1, 0, 1,
-1.005946, 0.05319399, -2.063885, 0.945098, 1, 0, 1,
-1.003166, -0.6022124, -2.16793, 0.9372549, 1, 0, 1,
-0.9998558, -0.888585, -4.057229, 0.9333333, 1, 0, 1,
-0.976767, -2.308986, -2.89624, 0.9254902, 1, 0, 1,
-0.9674894, 0.4704466, -1.313226, 0.9215686, 1, 0, 1,
-0.9594236, -0.06909128, -0.5675147, 0.9137255, 1, 0, 1,
-0.9486281, 0.5642249, -1.765055, 0.9098039, 1, 0, 1,
-0.944978, 0.3706008, -1.011845, 0.9019608, 1, 0, 1,
-0.9438408, 0.7437369, -1.83425, 0.8941177, 1, 0, 1,
-0.9423979, -0.02850293, -0.6052046, 0.8901961, 1, 0, 1,
-0.9421954, -0.7738273, -3.571445, 0.8823529, 1, 0, 1,
-0.9386469, 0.3633249, -0.385015, 0.8784314, 1, 0, 1,
-0.9368774, 0.9125449, -2.32305, 0.8705882, 1, 0, 1,
-0.9337382, 0.5891562, -2.010759, 0.8666667, 1, 0, 1,
-0.931366, -1.237215, -2.109489, 0.8588235, 1, 0, 1,
-0.9290122, -0.5658563, -3.710363, 0.854902, 1, 0, 1,
-0.9252376, -0.3982702, -2.774259, 0.8470588, 1, 0, 1,
-0.9250703, -1.566562, -2.415878, 0.8431373, 1, 0, 1,
-0.9220752, 0.01891091, -1.034901, 0.8352941, 1, 0, 1,
-0.9188793, -0.1373311, -1.386744, 0.8313726, 1, 0, 1,
-0.9170269, 0.7537909, -1.846421, 0.8235294, 1, 0, 1,
-0.9094785, 0.6198128, -0.0527293, 0.8196079, 1, 0, 1,
-0.8998004, 1.4653, -0.03423771, 0.8117647, 1, 0, 1,
-0.8977417, 0.4352461, -2.678331, 0.8078431, 1, 0, 1,
-0.8826207, 0.03489845, -2.441953, 0.8, 1, 0, 1,
-0.8823034, 0.8421731, 1.617971, 0.7921569, 1, 0, 1,
-0.8742982, 0.1480323, -3.218519, 0.7882353, 1, 0, 1,
-0.8735785, 1.85043, 1.890061, 0.7803922, 1, 0, 1,
-0.8726479, 0.1599316, -2.494773, 0.7764706, 1, 0, 1,
-0.8637434, 2.339006, -0.01835553, 0.7686275, 1, 0, 1,
-0.8632192, -0.2420472, -2.466632, 0.7647059, 1, 0, 1,
-0.8625231, 0.8180955, -1.193877, 0.7568628, 1, 0, 1,
-0.8612835, 0.5423924, -0.8230816, 0.7529412, 1, 0, 1,
-0.8596448, 1.345186, 0.1807113, 0.7450981, 1, 0, 1,
-0.8571712, 1.021073, -1.531169, 0.7411765, 1, 0, 1,
-0.8520084, -0.6584303, -2.003082, 0.7333333, 1, 0, 1,
-0.8509471, -0.6697043, -0.8355433, 0.7294118, 1, 0, 1,
-0.8479249, 0.02069249, -1.530444, 0.7215686, 1, 0, 1,
-0.8382123, -0.2456491, -1.111131, 0.7176471, 1, 0, 1,
-0.8335542, -0.2210651, -0.7449788, 0.7098039, 1, 0, 1,
-0.8288254, 0.4052863, 1.655608, 0.7058824, 1, 0, 1,
-0.8249367, -0.4546334, -1.053924, 0.6980392, 1, 0, 1,
-0.8233725, -0.9981278, -3.491067, 0.6901961, 1, 0, 1,
-0.8200034, -1.968925, -2.36734, 0.6862745, 1, 0, 1,
-0.8166862, -0.739303, -1.355359, 0.6784314, 1, 0, 1,
-0.8127888, 1.648955, 0.7395553, 0.6745098, 1, 0, 1,
-0.8117935, -0.6868643, -2.480196, 0.6666667, 1, 0, 1,
-0.8099586, 0.666624, -1.472552, 0.6627451, 1, 0, 1,
-0.806704, 0.2696931, -0.7959706, 0.654902, 1, 0, 1,
-0.7991898, 0.6172168, -0.8884394, 0.6509804, 1, 0, 1,
-0.7910694, 1.736071, -0.6220024, 0.6431373, 1, 0, 1,
-0.7870709, -0.8551095, -3.406515, 0.6392157, 1, 0, 1,
-0.7792609, -1.777015, -2.517992, 0.6313726, 1, 0, 1,
-0.7785493, 0.9132529, 0.3643661, 0.627451, 1, 0, 1,
-0.7780904, -0.2359204, -0.8200961, 0.6196079, 1, 0, 1,
-0.7764686, 0.5774773, -1.556528, 0.6156863, 1, 0, 1,
-0.7696518, 0.3212504, -3.584072, 0.6078432, 1, 0, 1,
-0.7652835, -0.4199265, 0.9360071, 0.6039216, 1, 0, 1,
-0.7646956, -1.480764, -2.961655, 0.5960785, 1, 0, 1,
-0.761474, 0.4236782, -0.492889, 0.5882353, 1, 0, 1,
-0.761172, 0.7105865, -0.9916843, 0.5843138, 1, 0, 1,
-0.7597037, -0.8613954, -2.321903, 0.5764706, 1, 0, 1,
-0.7525656, 0.6436118, -2.179766, 0.572549, 1, 0, 1,
-0.7521842, 0.1527853, -1.236741, 0.5647059, 1, 0, 1,
-0.7520047, -0.3852807, -2.367205, 0.5607843, 1, 0, 1,
-0.7497883, -1.522057, -1.701767, 0.5529412, 1, 0, 1,
-0.7482702, 0.4988993, -2.423112, 0.5490196, 1, 0, 1,
-0.744832, 0.03826673, -2.782509, 0.5411765, 1, 0, 1,
-0.743572, -1.124719, -3.546003, 0.5372549, 1, 0, 1,
-0.7383209, -0.473557, -1.344051, 0.5294118, 1, 0, 1,
-0.7297447, -0.4904403, -4.744571, 0.5254902, 1, 0, 1,
-0.7243489, -0.5749818, -4.228619, 0.5176471, 1, 0, 1,
-0.7123441, 0.5897407, -0.6339453, 0.5137255, 1, 0, 1,
-0.7118189, 2.027166, -0.6620062, 0.5058824, 1, 0, 1,
-0.7086291, -0.4182608, -1.918618, 0.5019608, 1, 0, 1,
-0.7059584, 0.6619512, -1.328288, 0.4941176, 1, 0, 1,
-0.7056124, -0.4944351, -3.059713, 0.4862745, 1, 0, 1,
-0.7029419, -3.595397, -4.233345, 0.4823529, 1, 0, 1,
-0.7017851, 0.3390067, -0.1208217, 0.4745098, 1, 0, 1,
-0.6997216, 0.3352745, -1.02301, 0.4705882, 1, 0, 1,
-0.6902497, -1.64524, -2.364044, 0.4627451, 1, 0, 1,
-0.690222, -1.469617, -3.023397, 0.4588235, 1, 0, 1,
-0.6863789, 0.7010278, -1.364696, 0.4509804, 1, 0, 1,
-0.6837547, 1.332233, 0.7705948, 0.4470588, 1, 0, 1,
-0.6755973, 1.732185, -1.601153, 0.4392157, 1, 0, 1,
-0.6576291, 0.4009306, -0.8171705, 0.4352941, 1, 0, 1,
-0.6547501, -0.30788, -2.469278, 0.427451, 1, 0, 1,
-0.6511281, -0.4845434, -2.865566, 0.4235294, 1, 0, 1,
-0.6507739, -0.002829872, -1.252638, 0.4156863, 1, 0, 1,
-0.6506796, -0.1157919, -2.875758, 0.4117647, 1, 0, 1,
-0.6506709, -0.4519676, -3.140196, 0.4039216, 1, 0, 1,
-0.649626, 0.4441476, 0.3279383, 0.3960784, 1, 0, 1,
-0.6489289, -0.6595982, -2.693898, 0.3921569, 1, 0, 1,
-0.6430877, -0.2076941, -3.64638, 0.3843137, 1, 0, 1,
-0.6402999, 0.1654057, 0.5952756, 0.3803922, 1, 0, 1,
-0.6391798, 0.4026989, -2.333543, 0.372549, 1, 0, 1,
-0.6375892, -0.1040894, -3.474853, 0.3686275, 1, 0, 1,
-0.6375347, -0.4287743, -3.580704, 0.3607843, 1, 0, 1,
-0.6354984, 0.3815378, -2.256253, 0.3568628, 1, 0, 1,
-0.6340805, -0.2549428, -0.4423347, 0.3490196, 1, 0, 1,
-0.6323414, -0.8201708, -1.349339, 0.345098, 1, 0, 1,
-0.6307144, -0.6745895, -4.173682, 0.3372549, 1, 0, 1,
-0.630568, 1.248458, -0.02849172, 0.3333333, 1, 0, 1,
-0.6297262, 0.06590306, -1.865367, 0.3254902, 1, 0, 1,
-0.6240181, -0.3213292, -2.511949, 0.3215686, 1, 0, 1,
-0.6210701, -2.023477, -4.916516, 0.3137255, 1, 0, 1,
-0.6133905, -0.4017263, -3.647549, 0.3098039, 1, 0, 1,
-0.6074251, -2.192057, -3.478261, 0.3019608, 1, 0, 1,
-0.6059184, -1.85682, -3.071268, 0.2941177, 1, 0, 1,
-0.6054651, 0.2743248, -3.096266, 0.2901961, 1, 0, 1,
-0.6009135, -1.054941, -1.546765, 0.282353, 1, 0, 1,
-0.5972611, -1.131045, -1.830944, 0.2784314, 1, 0, 1,
-0.5968923, 0.2995208, -0.8795586, 0.2705882, 1, 0, 1,
-0.5951035, -0.7543938, -2.165685, 0.2666667, 1, 0, 1,
-0.590076, 0.558282, -2.902668, 0.2588235, 1, 0, 1,
-0.5888612, 0.4598668, -1.7711, 0.254902, 1, 0, 1,
-0.5872204, 0.303587, 1.637807, 0.2470588, 1, 0, 1,
-0.5849592, -0.1742187, -0.6998999, 0.2431373, 1, 0, 1,
-0.5735265, -0.5140479, -0.7467099, 0.2352941, 1, 0, 1,
-0.5560705, 0.2585392, -1.992173, 0.2313726, 1, 0, 1,
-0.5533327, -0.4531116, -2.459426, 0.2235294, 1, 0, 1,
-0.5515606, -0.172453, -1.692368, 0.2196078, 1, 0, 1,
-0.5512027, -2.222249, -4.658071, 0.2117647, 1, 0, 1,
-0.5486962, 1.94166, -0.3964791, 0.2078431, 1, 0, 1,
-0.5481429, -0.9995923, -2.277712, 0.2, 1, 0, 1,
-0.5429329, -0.5051896, -2.585664, 0.1921569, 1, 0, 1,
-0.5417748, -0.1254261, -2.034004, 0.1882353, 1, 0, 1,
-0.5413734, -0.3579264, -1.293725, 0.1803922, 1, 0, 1,
-0.5410063, 0.6351417, -1.691693, 0.1764706, 1, 0, 1,
-0.5409626, 1.525996, -2.41345, 0.1686275, 1, 0, 1,
-0.5382606, -1.120177, -2.177251, 0.1647059, 1, 0, 1,
-0.5374628, 0.09224889, -1.017865, 0.1568628, 1, 0, 1,
-0.5348587, 1.688419, -0.2658405, 0.1529412, 1, 0, 1,
-0.5302164, -0.5348631, -2.334739, 0.145098, 1, 0, 1,
-0.5273454, -0.2666171, -2.228194, 0.1411765, 1, 0, 1,
-0.52615, 1.18334, -1.034206, 0.1333333, 1, 0, 1,
-0.5254043, -0.5577506, -3.072088, 0.1294118, 1, 0, 1,
-0.5225003, -0.8809909, -2.048064, 0.1215686, 1, 0, 1,
-0.5153379, 0.07963341, -0.9653549, 0.1176471, 1, 0, 1,
-0.5133407, 0.4276595, -2.871066, 0.1098039, 1, 0, 1,
-0.5117359, 0.09270216, -0.07143978, 0.1058824, 1, 0, 1,
-0.5096328, 0.5472785, -1.074785, 0.09803922, 1, 0, 1,
-0.5065532, -0.5250477, -1.577917, 0.09019608, 1, 0, 1,
-0.5026345, 0.3603841, -1.693967, 0.08627451, 1, 0, 1,
-0.5017193, 0.4205072, -1.848006, 0.07843138, 1, 0, 1,
-0.5008245, -0.5398884, -0.8430324, 0.07450981, 1, 0, 1,
-0.4949417, 1.463488, -1.120062, 0.06666667, 1, 0, 1,
-0.4918536, -0.8349668, -2.471643, 0.0627451, 1, 0, 1,
-0.4916335, -1.775695, -4.147261, 0.05490196, 1, 0, 1,
-0.4906552, 1.646968, 0.4317355, 0.05098039, 1, 0, 1,
-0.488667, -2.423316, -1.551791, 0.04313726, 1, 0, 1,
-0.4861618, 0.7093219, -1.225971, 0.03921569, 1, 0, 1,
-0.4823831, -0.5602328, -1.666438, 0.03137255, 1, 0, 1,
-0.4808232, -1.305804, -2.895532, 0.02745098, 1, 0, 1,
-0.4798306, 0.2814235, -1.400187, 0.01960784, 1, 0, 1,
-0.4784884, -1.32123, -3.715641, 0.01568628, 1, 0, 1,
-0.4729905, 0.8256559, -0.09214826, 0.007843138, 1, 0, 1,
-0.4705915, 0.6429965, -0.7344592, 0.003921569, 1, 0, 1,
-0.4681902, -1.009103, -3.491127, 0, 1, 0.003921569, 1,
-0.4666709, -1.162076, -2.23525, 0, 1, 0.01176471, 1,
-0.4644285, -0.3582858, -1.589471, 0, 1, 0.01568628, 1,
-0.4626108, 0.2053065, 0.9223318, 0, 1, 0.02352941, 1,
-0.4622315, -0.4263679, -2.001749, 0, 1, 0.02745098, 1,
-0.4597908, -2.260728, -2.884508, 0, 1, 0.03529412, 1,
-0.4597407, 0.9947405, -1.206829, 0, 1, 0.03921569, 1,
-0.4578341, -0.3114698, -0.6808081, 0, 1, 0.04705882, 1,
-0.4571923, 1.191224, -0.1874333, 0, 1, 0.05098039, 1,
-0.4498349, 0.8657271, -0.9170856, 0, 1, 0.05882353, 1,
-0.4477745, 0.7663893, -0.4953104, 0, 1, 0.0627451, 1,
-0.4384559, -1.195854, -4.156131, 0, 1, 0.07058824, 1,
-0.4341161, -1.479051, -4.805804, 0, 1, 0.07450981, 1,
-0.4314893, -2.111879, -2.159999, 0, 1, 0.08235294, 1,
-0.4195742, 0.9553763, -1.532726, 0, 1, 0.08627451, 1,
-0.4153418, 0.7868227, -0.02803145, 0, 1, 0.09411765, 1,
-0.4142726, 0.9610681, -1.355066, 0, 1, 0.1019608, 1,
-0.4081576, -0.3791666, -1.20018, 0, 1, 0.1058824, 1,
-0.4077922, -2.093649, -4.544166, 0, 1, 0.1137255, 1,
-0.4042169, 0.1574049, -1.629723, 0, 1, 0.1176471, 1,
-0.3990073, 0.6439795, -1.057325, 0, 1, 0.1254902, 1,
-0.3970037, -0.8449595, -0.5590912, 0, 1, 0.1294118, 1,
-0.3956414, 0.2816406, -0.8970385, 0, 1, 0.1372549, 1,
-0.3945776, -0.09928496, -1.477731, 0, 1, 0.1411765, 1,
-0.3942443, -0.8823533, -2.581614, 0, 1, 0.1490196, 1,
-0.3858415, -1.57303, -1.34962, 0, 1, 0.1529412, 1,
-0.3824567, 0.1671251, -1.922142, 0, 1, 0.1607843, 1,
-0.3804314, -1.285611, -2.978814, 0, 1, 0.1647059, 1,
-0.3792003, -0.3262551, -1.779644, 0, 1, 0.172549, 1,
-0.3785584, 0.5917357, 0.3123955, 0, 1, 0.1764706, 1,
-0.3762132, -0.3583038, -2.787032, 0, 1, 0.1843137, 1,
-0.3723734, -0.1189605, -2.163487, 0, 1, 0.1882353, 1,
-0.3700865, 0.5306093, -0.610818, 0, 1, 0.1960784, 1,
-0.3699922, 1.0169, -0.08480294, 0, 1, 0.2039216, 1,
-0.369726, 0.9146944, -0.1774149, 0, 1, 0.2078431, 1,
-0.3684724, -2.30047, -2.734551, 0, 1, 0.2156863, 1,
-0.3661819, -0.1383692, -1.244417, 0, 1, 0.2196078, 1,
-0.3645412, 1.289513, -0.1411801, 0, 1, 0.227451, 1,
-0.3560643, 0.1977977, -2.676055, 0, 1, 0.2313726, 1,
-0.3543705, 1.160139, 0.2854422, 0, 1, 0.2392157, 1,
-0.3533603, 0.06103922, -0.2427289, 0, 1, 0.2431373, 1,
-0.3450396, 0.6653349, -2.374609, 0, 1, 0.2509804, 1,
-0.3449342, 0.5352203, 0.2840476, 0, 1, 0.254902, 1,
-0.3429066, 1.169817, -0.1838538, 0, 1, 0.2627451, 1,
-0.3390326, -1.506352, -3.916793, 0, 1, 0.2666667, 1,
-0.3378835, -0.173134, -2.898893, 0, 1, 0.2745098, 1,
-0.3360135, 0.2998356, 0.21969, 0, 1, 0.2784314, 1,
-0.33241, -0.7408978, -2.027619, 0, 1, 0.2862745, 1,
-0.3280253, 0.219269, -1.051777, 0, 1, 0.2901961, 1,
-0.3223441, 1.330417, 0.09729338, 0, 1, 0.2980392, 1,
-0.3213282, -0.9181569, -3.124888, 0, 1, 0.3058824, 1,
-0.3205995, -0.1663526, -2.335353, 0, 1, 0.3098039, 1,
-0.3181755, 0.3182653, -0.7307824, 0, 1, 0.3176471, 1,
-0.3172382, 0.7253404, 0.1442854, 0, 1, 0.3215686, 1,
-0.314838, 1.338697, -0.61527, 0, 1, 0.3294118, 1,
-0.3115248, 0.3453218, -1.429635, 0, 1, 0.3333333, 1,
-0.3112224, 0.1358291, -1.395207, 0, 1, 0.3411765, 1,
-0.3097082, -0.3319173, -2.104539, 0, 1, 0.345098, 1,
-0.2999141, 0.2933123, -0.9951147, 0, 1, 0.3529412, 1,
-0.2992833, 0.5594584, -1.551842, 0, 1, 0.3568628, 1,
-0.2990548, 1.95345, -0.5727715, 0, 1, 0.3647059, 1,
-0.2945199, -1.029556, -0.717256, 0, 1, 0.3686275, 1,
-0.2928673, -1.765913, -3.555634, 0, 1, 0.3764706, 1,
-0.2918095, 0.6594571, -4.123289, 0, 1, 0.3803922, 1,
-0.2906031, 0.03742392, -3.081738, 0, 1, 0.3882353, 1,
-0.288623, -1.143079, -3.421497, 0, 1, 0.3921569, 1,
-0.2752339, -1.293816, -2.688294, 0, 1, 0.4, 1,
-0.270906, -0.1846405, -3.068129, 0, 1, 0.4078431, 1,
-0.2664537, 0.7839907, -1.092867, 0, 1, 0.4117647, 1,
-0.2651494, 1.33057, 0.8747587, 0, 1, 0.4196078, 1,
-0.2630187, 0.09873555, -1.720748, 0, 1, 0.4235294, 1,
-0.262513, -1.583017, -0.9894801, 0, 1, 0.4313726, 1,
-0.2579926, -0.2159139, -3.333512, 0, 1, 0.4352941, 1,
-0.2561884, -0.8477823, -3.639392, 0, 1, 0.4431373, 1,
-0.2557395, 0.2840935, -1.784578, 0, 1, 0.4470588, 1,
-0.2499765, 0.4606166, -0.442016, 0, 1, 0.454902, 1,
-0.2498422, 2.520317, -0.6884781, 0, 1, 0.4588235, 1,
-0.2487582, -0.05891164, -2.116926, 0, 1, 0.4666667, 1,
-0.2477537, -1.242323, -1.716675, 0, 1, 0.4705882, 1,
-0.2444063, -0.7711698, -3.717268, 0, 1, 0.4784314, 1,
-0.2437575, -1.129186, -0.5794771, 0, 1, 0.4823529, 1,
-0.2386643, 0.7487761, -0.9060319, 0, 1, 0.4901961, 1,
-0.2386089, -1.853211, -3.260946, 0, 1, 0.4941176, 1,
-0.2375549, 0.2197113, -0.6618838, 0, 1, 0.5019608, 1,
-0.2301928, -0.3805014, -2.244571, 0, 1, 0.509804, 1,
-0.2283511, 0.9566576, -1.007762, 0, 1, 0.5137255, 1,
-0.2255138, 0.1063924, -0.02425219, 0, 1, 0.5215687, 1,
-0.2246892, 0.6293722, -0.02875508, 0, 1, 0.5254902, 1,
-0.2205841, -2.098378, -3.602656, 0, 1, 0.5333334, 1,
-0.218371, 0.2863328, -0.2994601, 0, 1, 0.5372549, 1,
-0.2138237, 0.4058923, 0.4395212, 0, 1, 0.5450981, 1,
-0.2117826, -0.7885247, -4.538652, 0, 1, 0.5490196, 1,
-0.2117439, 0.6096516, -0.3342474, 0, 1, 0.5568628, 1,
-0.2117175, -0.5506029, -3.558019, 0, 1, 0.5607843, 1,
-0.2081112, -0.1926287, -3.420504, 0, 1, 0.5686275, 1,
-0.2067018, 2.59078, 0.6575816, 0, 1, 0.572549, 1,
-0.1983115, -0.5896325, -2.98929, 0, 1, 0.5803922, 1,
-0.1978782, 0.1040316, -0.6762077, 0, 1, 0.5843138, 1,
-0.1978361, -0.8109871, -3.218294, 0, 1, 0.5921569, 1,
-0.1975847, 0.7417775, -0.593311, 0, 1, 0.5960785, 1,
-0.1912166, -0.0594193, -4.811584, 0, 1, 0.6039216, 1,
-0.1879917, 0.139806, -0.7283199, 0, 1, 0.6117647, 1,
-0.1874402, 0.1435047, -1.386183, 0, 1, 0.6156863, 1,
-0.1846619, 1.324113, 0.4642591, 0, 1, 0.6235294, 1,
-0.1806106, 0.638195, 1.497327, 0, 1, 0.627451, 1,
-0.1786793, -0.04545944, -2.649542, 0, 1, 0.6352941, 1,
-0.1687964, 1.904134, -0.6236067, 0, 1, 0.6392157, 1,
-0.1593217, -1.749724, -3.617073, 0, 1, 0.6470588, 1,
-0.1577924, 0.4839192, -1.269316, 0, 1, 0.6509804, 1,
-0.1563813, -0.3002765, -3.501956, 0, 1, 0.6588235, 1,
-0.1559004, -1.244354, -2.637494, 0, 1, 0.6627451, 1,
-0.1520819, -0.5426058, -1.195214, 0, 1, 0.6705883, 1,
-0.1504028, -0.5415841, -2.168689, 0, 1, 0.6745098, 1,
-0.1394303, 0.3729542, 2.379729, 0, 1, 0.682353, 1,
-0.1378447, -0.8819895, -3.378079, 0, 1, 0.6862745, 1,
-0.1373303, 0.1855256, -1.42645, 0, 1, 0.6941177, 1,
-0.1370479, -1.640287, -2.543853, 0, 1, 0.7019608, 1,
-0.1348976, -0.08546317, -1.23103, 0, 1, 0.7058824, 1,
-0.134422, 0.6752489, 0.2517675, 0, 1, 0.7137255, 1,
-0.1315325, 0.1613148, 1.688214, 0, 1, 0.7176471, 1,
-0.1289069, 0.4365946, 1.421906, 0, 1, 0.7254902, 1,
-0.1255453, 0.7282715, 1.014369, 0, 1, 0.7294118, 1,
-0.1232179, -2.344054, -2.524713, 0, 1, 0.7372549, 1,
-0.1195078, 1.120246, 1.373532, 0, 1, 0.7411765, 1,
-0.1169836, 0.8859714, 0.5336947, 0, 1, 0.7490196, 1,
-0.1169665, -0.2697364, -3.050915, 0, 1, 0.7529412, 1,
-0.1151132, -0.4397692, -4.79141, 0, 1, 0.7607843, 1,
-0.1124162, -1.883531, -4.260519, 0, 1, 0.7647059, 1,
-0.1119229, 0.4045027, -0.5153426, 0, 1, 0.772549, 1,
-0.1079993, 0.4990523, 0.6055974, 0, 1, 0.7764706, 1,
-0.1054607, -1.403785, -3.70826, 0, 1, 0.7843137, 1,
-0.1007995, -0.3948195, -3.156905, 0, 1, 0.7882353, 1,
-0.09970198, -0.3292048, -3.983787, 0, 1, 0.7960784, 1,
-0.09616485, -1.025257, -4.224422, 0, 1, 0.8039216, 1,
-0.08909285, 1.657018, -1.005056, 0, 1, 0.8078431, 1,
-0.08908695, -0.5354431, -3.771778, 0, 1, 0.8156863, 1,
-0.08684093, 1.053061, 0.1846967, 0, 1, 0.8196079, 1,
-0.08563602, -0.2229141, -3.025919, 0, 1, 0.827451, 1,
-0.082559, 0.4899236, -0.03026917, 0, 1, 0.8313726, 1,
-0.06534128, 0.7286783, -0.003055668, 0, 1, 0.8392157, 1,
-0.06338882, -1.56451, -2.872231, 0, 1, 0.8431373, 1,
-0.06295599, 0.1999113, -2.036832, 0, 1, 0.8509804, 1,
-0.0624651, -0.1216872, -2.17106, 0, 1, 0.854902, 1,
-0.06241559, 0.00361747, -2.575058, 0, 1, 0.8627451, 1,
-0.0621276, -1.434599, -2.329653, 0, 1, 0.8666667, 1,
-0.06139182, 0.781163, 0.5746788, 0, 1, 0.8745098, 1,
-0.05857214, 1.354413, 1.123442, 0, 1, 0.8784314, 1,
-0.05528008, 2.465994, -0.3222467, 0, 1, 0.8862745, 1,
-0.05499096, -2.490494, -2.752077, 0, 1, 0.8901961, 1,
-0.05153996, 0.5897223, 0.9319019, 0, 1, 0.8980392, 1,
-0.04918604, -1.204163, -2.026232, 0, 1, 0.9058824, 1,
-0.04906793, 0.1374988, -1.556472, 0, 1, 0.9098039, 1,
-0.04773611, 0.07892729, -2.704371, 0, 1, 0.9176471, 1,
-0.04473988, -1.056363, -2.94742, 0, 1, 0.9215686, 1,
-0.04349498, -0.09691758, -2.513968, 0, 1, 0.9294118, 1,
-0.04044662, 0.8670617, -0.3400853, 0, 1, 0.9333333, 1,
-0.03872803, -0.0005983013, -1.028018, 0, 1, 0.9411765, 1,
-0.03716166, -0.4555001, -4.057693, 0, 1, 0.945098, 1,
-0.03672664, -0.4023438, -3.390089, 0, 1, 0.9529412, 1,
-0.03584676, 0.1094254, -1.811966, 0, 1, 0.9568627, 1,
-0.03237267, -0.9243837, -4.822971, 0, 1, 0.9647059, 1,
-0.02849316, -0.9845042, -4.000504, 0, 1, 0.9686275, 1,
-0.02848152, -0.05657351, -3.224425, 0, 1, 0.9764706, 1,
-0.02761561, 0.4932641, -0.2695346, 0, 1, 0.9803922, 1,
-0.0262604, -0.690753, -3.578234, 0, 1, 0.9882353, 1,
-0.02460692, -1.113193, -3.773935, 0, 1, 0.9921569, 1,
-0.02307064, -0.9896113, -3.087521, 0, 1, 1, 1,
-0.0143885, -0.4283213, -2.181222, 0, 0.9921569, 1, 1,
-0.01199698, -0.3795457, -3.471974, 0, 0.9882353, 1, 1,
-0.00714944, -0.9995897, -3.163333, 0, 0.9803922, 1, 1,
-0.001882554, 0.7328844, 0.0771765, 0, 0.9764706, 1, 1,
-0.0004722981, 3.318505, -0.7389823, 0, 0.9686275, 1, 1,
0.01006269, 0.3673729, -0.514208, 0, 0.9647059, 1, 1,
0.01532783, -0.3859138, 3.223199, 0, 0.9568627, 1, 1,
0.01585555, 1.163337, 0.3198207, 0, 0.9529412, 1, 1,
0.01605267, -1.470015, 2.946043, 0, 0.945098, 1, 1,
0.0188837, 0.2598436, -0.4221553, 0, 0.9411765, 1, 1,
0.02348826, 0.4305097, 1.192757, 0, 0.9333333, 1, 1,
0.030903, -0.4433064, 2.458197, 0, 0.9294118, 1, 1,
0.03107388, -2.067457, 1.826599, 0, 0.9215686, 1, 1,
0.03266359, 0.8589249, -0.2633905, 0, 0.9176471, 1, 1,
0.03849704, -1.218663, 6.19909, 0, 0.9098039, 1, 1,
0.04155323, -1.31873, 2.019933, 0, 0.9058824, 1, 1,
0.04274588, 0.7149453, 1.971507, 0, 0.8980392, 1, 1,
0.0515161, 0.329671, -1.21901, 0, 0.8901961, 1, 1,
0.05422853, 1.164245, -1.17355, 0, 0.8862745, 1, 1,
0.05834198, 0.2359745, -0.9696046, 0, 0.8784314, 1, 1,
0.06063518, 0.1970006, -1.140613, 0, 0.8745098, 1, 1,
0.06112638, -1.241666, 3.008335, 0, 0.8666667, 1, 1,
0.06177048, -0.711894, 6.100545, 0, 0.8627451, 1, 1,
0.06350122, -0.02256949, 3.054881, 0, 0.854902, 1, 1,
0.06352033, -1.327431, 3.971747, 0, 0.8509804, 1, 1,
0.0695943, -0.7599279, 3.866112, 0, 0.8431373, 1, 1,
0.07506809, 0.9402952, 0.21368, 0, 0.8392157, 1, 1,
0.07829446, 0.6363782, 0.6500835, 0, 0.8313726, 1, 1,
0.08125336, 2.173985, -0.746774, 0, 0.827451, 1, 1,
0.08354895, 1.091697, -1.310509, 0, 0.8196079, 1, 1,
0.08653463, -0.6478184, 1.640826, 0, 0.8156863, 1, 1,
0.0873831, -1.005494, 3.137281, 0, 0.8078431, 1, 1,
0.1055943, -0.6865607, 2.145833, 0, 0.8039216, 1, 1,
0.1099313, 0.197715, 1.457888, 0, 0.7960784, 1, 1,
0.1106398, 0.09449771, 2.96777, 0, 0.7882353, 1, 1,
0.1118106, 0.3429939, -0.2131537, 0, 0.7843137, 1, 1,
0.1122727, 0.7555832, 2.457448, 0, 0.7764706, 1, 1,
0.1151254, -0.1996326, 2.18611, 0, 0.772549, 1, 1,
0.1154265, 0.252309, -1.981524, 0, 0.7647059, 1, 1,
0.1161488, 0.9339571, -0.2819653, 0, 0.7607843, 1, 1,
0.1163652, 1.039403, -0.8394488, 0, 0.7529412, 1, 1,
0.1256585, -0.01466125, 1.666696, 0, 0.7490196, 1, 1,
0.1262501, 0.7980264, -0.0624776, 0, 0.7411765, 1, 1,
0.1308524, 0.3899693, 2.025408, 0, 0.7372549, 1, 1,
0.1336112, -0.5604366, 3.796869, 0, 0.7294118, 1, 1,
0.1355426, 0.7997879, 1.03729, 0, 0.7254902, 1, 1,
0.1362008, -0.2884483, 1.054371, 0, 0.7176471, 1, 1,
0.1416811, 0.6139953, 0.8221664, 0, 0.7137255, 1, 1,
0.1461748, 0.8487856, 0.2859437, 0, 0.7058824, 1, 1,
0.1491326, 0.3773716, 0.8601538, 0, 0.6980392, 1, 1,
0.1504636, -0.2881429, 3.223454, 0, 0.6941177, 1, 1,
0.1527464, 0.5810112, 0.4079895, 0, 0.6862745, 1, 1,
0.1575218, 0.6741121, 1.085314, 0, 0.682353, 1, 1,
0.1591671, -0.2964792, 2.306723, 0, 0.6745098, 1, 1,
0.1605038, -0.4489056, 1.536782, 0, 0.6705883, 1, 1,
0.1622211, -0.001743222, 1.5367, 0, 0.6627451, 1, 1,
0.1625237, -1.14806, 2.981525, 0, 0.6588235, 1, 1,
0.165666, 0.3498169, 1.473381, 0, 0.6509804, 1, 1,
0.1677237, 1.115553, 0.5252065, 0, 0.6470588, 1, 1,
0.1691316, 0.6358873, -0.03321074, 0, 0.6392157, 1, 1,
0.1746557, 0.419613, 0.6829446, 0, 0.6352941, 1, 1,
0.1758404, 0.5871484, -2.266622, 0, 0.627451, 1, 1,
0.1762117, 0.9238293, 1.113689, 0, 0.6235294, 1, 1,
0.1776324, -1.058586, 3.596967, 0, 0.6156863, 1, 1,
0.1806692, 0.9991857, -0.04374478, 0, 0.6117647, 1, 1,
0.1811827, 0.004422792, 0.8419734, 0, 0.6039216, 1, 1,
0.187433, -1.544026, 2.65681, 0, 0.5960785, 1, 1,
0.1890074, 0.2811528, -0.05279128, 0, 0.5921569, 1, 1,
0.1895909, 0.3853885, 0.6699344, 0, 0.5843138, 1, 1,
0.190237, -1.5037, 3.189679, 0, 0.5803922, 1, 1,
0.1940479, -2.009722, 3.306232, 0, 0.572549, 1, 1,
0.1941249, 0.7782995, -0.5423558, 0, 0.5686275, 1, 1,
0.194382, -0.7483153, 3.528728, 0, 0.5607843, 1, 1,
0.1959244, 0.4551556, -0.477024, 0, 0.5568628, 1, 1,
0.1971174, 0.07287145, 1.242388, 0, 0.5490196, 1, 1,
0.1984968, 0.450548, 2.181971, 0, 0.5450981, 1, 1,
0.1996254, -0.9839934, 2.135431, 0, 0.5372549, 1, 1,
0.2038093, 0.4767617, 1.140615, 0, 0.5333334, 1, 1,
0.2113094, 0.1813222, 0.5491623, 0, 0.5254902, 1, 1,
0.2116971, 1.070232, -1.590539, 0, 0.5215687, 1, 1,
0.2141143, 0.0566435, 0.1514009, 0, 0.5137255, 1, 1,
0.2171882, 1.056707, 0.6922438, 0, 0.509804, 1, 1,
0.2216292, -1.097546, 3.07668, 0, 0.5019608, 1, 1,
0.2231606, 0.8568619, -0.582517, 0, 0.4941176, 1, 1,
0.2241382, -1.040127, 3.964681, 0, 0.4901961, 1, 1,
0.2256987, -0.3682409, 3.753963, 0, 0.4823529, 1, 1,
0.227355, -2.008079, 2.187727, 0, 0.4784314, 1, 1,
0.2277307, 0.3223206, 2.338807, 0, 0.4705882, 1, 1,
0.2297641, 0.6961735, 0.4856062, 0, 0.4666667, 1, 1,
0.2301011, 0.1103739, -0.1813114, 0, 0.4588235, 1, 1,
0.2324612, -0.2581341, 4.411571, 0, 0.454902, 1, 1,
0.2336139, 1.300208, 1.031387, 0, 0.4470588, 1, 1,
0.2372975, -0.7441938, 4.723176, 0, 0.4431373, 1, 1,
0.2430025, -0.7694691, 1.647375, 0, 0.4352941, 1, 1,
0.2498799, -0.923399, 3.538161, 0, 0.4313726, 1, 1,
0.2508425, 0.6934893, -0.2902575, 0, 0.4235294, 1, 1,
0.2515258, 0.5160069, 1.13655, 0, 0.4196078, 1, 1,
0.2519238, -0.8615777, 1.174293, 0, 0.4117647, 1, 1,
0.2520565, -1.44088, 1.704873, 0, 0.4078431, 1, 1,
0.2526291, -0.189041, 2.19011, 0, 0.4, 1, 1,
0.2566001, -0.6861464, 3.165107, 0, 0.3921569, 1, 1,
0.2575482, 1.5082, 0.2546792, 0, 0.3882353, 1, 1,
0.2585456, 0.4742011, 0.6985527, 0, 0.3803922, 1, 1,
0.2641924, 1.129944, -0.0596809, 0, 0.3764706, 1, 1,
0.2642828, 0.6363603, 0.4506818, 0, 0.3686275, 1, 1,
0.2692494, 0.09657719, 0.3369789, 0, 0.3647059, 1, 1,
0.2711927, -0.2002582, 1.769412, 0, 0.3568628, 1, 1,
0.2776696, 0.4767433, 0.9878303, 0, 0.3529412, 1, 1,
0.2782905, 0.4736274, 1.34661, 0, 0.345098, 1, 1,
0.2797715, -0.3371975, 2.843697, 0, 0.3411765, 1, 1,
0.2838848, -1.745943, 2.499881, 0, 0.3333333, 1, 1,
0.2872251, -0.4586541, 3.181197, 0, 0.3294118, 1, 1,
0.2877997, -1.110087, 2.502045, 0, 0.3215686, 1, 1,
0.2909867, 1.721152, -2.1073, 0, 0.3176471, 1, 1,
0.2923676, 1.312524, 0.3149676, 0, 0.3098039, 1, 1,
0.292867, 1.083932, 0.2140732, 0, 0.3058824, 1, 1,
0.2935721, 0.6421909, 2.611152, 0, 0.2980392, 1, 1,
0.2953953, 1.876817, 0.06088049, 0, 0.2901961, 1, 1,
0.2984103, -1.695598, 2.057552, 0, 0.2862745, 1, 1,
0.3034787, -0.6711549, 3.927615, 0, 0.2784314, 1, 1,
0.3095931, 0.504181, 2.304694, 0, 0.2745098, 1, 1,
0.3117648, -0.2667175, 1.753943, 0, 0.2666667, 1, 1,
0.3126625, -1.402731, 3.703961, 0, 0.2627451, 1, 1,
0.313568, 1.591624, 0.3650185, 0, 0.254902, 1, 1,
0.3162166, -0.1980986, 1.512437, 0, 0.2509804, 1, 1,
0.3181229, 0.8014037, -0.6915642, 0, 0.2431373, 1, 1,
0.3190885, -2.00084, 3.803122, 0, 0.2392157, 1, 1,
0.3210278, 2.50536, 0.7196749, 0, 0.2313726, 1, 1,
0.3264469, 1.592786, -0.8287898, 0, 0.227451, 1, 1,
0.3306955, 0.7177472, 2.914431, 0, 0.2196078, 1, 1,
0.3314874, -0.2307564, 3.06646, 0, 0.2156863, 1, 1,
0.3319234, 0.4631929, 1.419956, 0, 0.2078431, 1, 1,
0.3404452, -0.9334156, 3.42869, 0, 0.2039216, 1, 1,
0.3404572, -2.067016, 1.869695, 0, 0.1960784, 1, 1,
0.3434429, 0.9042093, 1.505389, 0, 0.1882353, 1, 1,
0.347836, 1.077867, -0.2460898, 0, 0.1843137, 1, 1,
0.3499184, 0.529925, 0.6768077, 0, 0.1764706, 1, 1,
0.3505159, -1.073798, 0.6604121, 0, 0.172549, 1, 1,
0.3509613, -0.4957456, 1.705907, 0, 0.1647059, 1, 1,
0.3519875, -1.415979, 1.62736, 0, 0.1607843, 1, 1,
0.352022, -0.9932828, 3.782372, 0, 0.1529412, 1, 1,
0.3541858, 0.6138611, 1.072837, 0, 0.1490196, 1, 1,
0.3554654, 1.974801, -1.633566, 0, 0.1411765, 1, 1,
0.365677, 1.127827, 0.5496466, 0, 0.1372549, 1, 1,
0.3657234, 1.644852, 1.331592, 0, 0.1294118, 1, 1,
0.3667305, -0.6803899, 2.291922, 0, 0.1254902, 1, 1,
0.3677925, -1.438357, 3.669046, 0, 0.1176471, 1, 1,
0.367878, -0.4833259, 3.283471, 0, 0.1137255, 1, 1,
0.3700857, -0.637983, 2.1342, 0, 0.1058824, 1, 1,
0.3703369, 0.188105, 3.270602, 0, 0.09803922, 1, 1,
0.3715001, 0.474574, 0.550054, 0, 0.09411765, 1, 1,
0.372367, -1.461771, 2.664472, 0, 0.08627451, 1, 1,
0.3732256, -0.01582147, 0.8530673, 0, 0.08235294, 1, 1,
0.3814468, 0.3673055, 0.5471662, 0, 0.07450981, 1, 1,
0.3848011, 0.008291967, 2.580639, 0, 0.07058824, 1, 1,
0.3848157, 2.108356, 1.097261, 0, 0.0627451, 1, 1,
0.386772, -0.4507679, 2.224962, 0, 0.05882353, 1, 1,
0.3874007, -1.042949, 3.345488, 0, 0.05098039, 1, 1,
0.3890407, -0.4336253, 1.406233, 0, 0.04705882, 1, 1,
0.3898757, -0.1578194, 2.627131, 0, 0.03921569, 1, 1,
0.3925504, -0.1441793, 2.647408, 0, 0.03529412, 1, 1,
0.3945053, -1.583132, 2.885348, 0, 0.02745098, 1, 1,
0.3949957, -0.744294, 2.945582, 0, 0.02352941, 1, 1,
0.3987602, -1.106215, 5.288752, 0, 0.01568628, 1, 1,
0.4004106, 0.6957142, 0.0337722, 0, 0.01176471, 1, 1,
0.4012606, 0.1139797, 0.7238662, 0, 0.003921569, 1, 1,
0.411476, 0.6996863, 0.9380603, 0.003921569, 0, 1, 1,
0.4132995, 0.3718438, -0.05391773, 0.007843138, 0, 1, 1,
0.4151079, 0.1432193, 1.512681, 0.01568628, 0, 1, 1,
0.4158626, 0.4115027, -0.05563665, 0.01960784, 0, 1, 1,
0.4162371, -1.366575, 2.820707, 0.02745098, 0, 1, 1,
0.416279, -1.476185, 2.887877, 0.03137255, 0, 1, 1,
0.4202834, 1.034027, -1.073716, 0.03921569, 0, 1, 1,
0.4244504, 0.6992034, -0.8365805, 0.04313726, 0, 1, 1,
0.4253881, 1.559384, 1.198986, 0.05098039, 0, 1, 1,
0.427267, 0.9093249, -1.391868, 0.05490196, 0, 1, 1,
0.4279861, 0.446602, 0.5172287, 0.0627451, 0, 1, 1,
0.430016, 0.2046168, 2.638084, 0.06666667, 0, 1, 1,
0.4316196, -1.78665, 2.712226, 0.07450981, 0, 1, 1,
0.4335839, 0.09793839, 1.41948, 0.07843138, 0, 1, 1,
0.4347176, -0.8275452, 1.94503, 0.08627451, 0, 1, 1,
0.4350331, 1.171073, -0.6588569, 0.09019608, 0, 1, 1,
0.4399772, -0.5332457, 3.731814, 0.09803922, 0, 1, 1,
0.4414783, 0.4812331, 0.9511941, 0.1058824, 0, 1, 1,
0.4417422, 0.5089629, -0.1246644, 0.1098039, 0, 1, 1,
0.44228, -0.3011853, 2.372524, 0.1176471, 0, 1, 1,
0.4472742, 1.843849, -0.2754428, 0.1215686, 0, 1, 1,
0.4530583, 0.9829267, -0.3907989, 0.1294118, 0, 1, 1,
0.4534938, 0.425083, 1.348282, 0.1333333, 0, 1, 1,
0.4599115, -0.3806308, -0.1000785, 0.1411765, 0, 1, 1,
0.4613483, 1.271051, 0.7484462, 0.145098, 0, 1, 1,
0.4663903, -0.4201338, 2.405994, 0.1529412, 0, 1, 1,
0.4689791, 0.1572656, 2.151188, 0.1568628, 0, 1, 1,
0.4694204, 0.4925247, 1.504867, 0.1647059, 0, 1, 1,
0.472992, -0.6033414, 3.383388, 0.1686275, 0, 1, 1,
0.474296, -1.088016, 3.468958, 0.1764706, 0, 1, 1,
0.4847434, 0.9229157, 1.72194, 0.1803922, 0, 1, 1,
0.4861347, -0.07211715, 1.41302, 0.1882353, 0, 1, 1,
0.4880154, 0.04465787, 2.473501, 0.1921569, 0, 1, 1,
0.4965625, 0.3726733, -0.02234446, 0.2, 0, 1, 1,
0.4994839, -1.267315, 3.267574, 0.2078431, 0, 1, 1,
0.4995954, 1.267675, -0.8738888, 0.2117647, 0, 1, 1,
0.5015921, 1.18479, 0.2677266, 0.2196078, 0, 1, 1,
0.5046026, -0.4122422, 2.166329, 0.2235294, 0, 1, 1,
0.5078773, -1.080877, 1.059424, 0.2313726, 0, 1, 1,
0.5155568, -1.266082, 2.230285, 0.2352941, 0, 1, 1,
0.5179337, 0.26693, -1.781728, 0.2431373, 0, 1, 1,
0.5181759, -2.116483, 2.62239, 0.2470588, 0, 1, 1,
0.5223418, -0.5200517, 2.815123, 0.254902, 0, 1, 1,
0.5231314, -0.2455853, 2.946557, 0.2588235, 0, 1, 1,
0.5280933, 0.3497373, 0.8530844, 0.2666667, 0, 1, 1,
0.530332, -0.7032217, 1.182327, 0.2705882, 0, 1, 1,
0.5328349, -0.2148214, 2.093675, 0.2784314, 0, 1, 1,
0.5328615, 1.044022, 1.540313, 0.282353, 0, 1, 1,
0.5380187, 0.07101492, 1.846992, 0.2901961, 0, 1, 1,
0.5383601, 1.805236, -1.232948, 0.2941177, 0, 1, 1,
0.5392413, -0.4179304, 2.711684, 0.3019608, 0, 1, 1,
0.545527, -0.8477227, -0.0740314, 0.3098039, 0, 1, 1,
0.5465505, 0.8751971, 0.4352729, 0.3137255, 0, 1, 1,
0.5491162, -1.038275, 0.6372911, 0.3215686, 0, 1, 1,
0.5500284, 1.069168, -0.193968, 0.3254902, 0, 1, 1,
0.5599302, -0.06531812, -0.02235883, 0.3333333, 0, 1, 1,
0.5638533, 1.507571, -0.412112, 0.3372549, 0, 1, 1,
0.5650886, 0.8274308, -0.1195138, 0.345098, 0, 1, 1,
0.5701383, 0.02112917, 1.070715, 0.3490196, 0, 1, 1,
0.5729737, 0.7904925, 1.120719, 0.3568628, 0, 1, 1,
0.5768579, -1.214075, 3.348262, 0.3607843, 0, 1, 1,
0.5772194, -0.7193157, 2.708978, 0.3686275, 0, 1, 1,
0.5804495, -0.2521981, 1.411618, 0.372549, 0, 1, 1,
0.5857194, -0.6411943, 2.177172, 0.3803922, 0, 1, 1,
0.5880772, 0.5446438, 0.8113662, 0.3843137, 0, 1, 1,
0.5891247, -0.4735148, 1.184508, 0.3921569, 0, 1, 1,
0.5896468, 1.221919, -0.5243434, 0.3960784, 0, 1, 1,
0.6006617, 0.1187952, 2.888211, 0.4039216, 0, 1, 1,
0.6022706, 0.3067296, 2.406528, 0.4117647, 0, 1, 1,
0.6105854, 0.9430875, -0.2544909, 0.4156863, 0, 1, 1,
0.6132843, -2.146147, 2.393932, 0.4235294, 0, 1, 1,
0.6137675, -0.2715119, 1.235335, 0.427451, 0, 1, 1,
0.6156671, -0.9709911, 1.51775, 0.4352941, 0, 1, 1,
0.6178077, 0.7329172, 1.319175, 0.4392157, 0, 1, 1,
0.6265205, -0.1769924, 0.6963366, 0.4470588, 0, 1, 1,
0.6271375, 0.1024512, 1.838174, 0.4509804, 0, 1, 1,
0.6282433, 0.8759729, -0.01419539, 0.4588235, 0, 1, 1,
0.6293023, 1.459984, 0.592324, 0.4627451, 0, 1, 1,
0.6301026, -0.9995255, 1.248703, 0.4705882, 0, 1, 1,
0.637556, -1.490891, 0.1801322, 0.4745098, 0, 1, 1,
0.638001, 0.4405275, -0.6807159, 0.4823529, 0, 1, 1,
0.6498253, 0.2205739, 1.983997, 0.4862745, 0, 1, 1,
0.6500386, -0.173606, 2.175928, 0.4941176, 0, 1, 1,
0.6537594, -1.273591, 3.552698, 0.5019608, 0, 1, 1,
0.6546465, 1.547006, 1.768671, 0.5058824, 0, 1, 1,
0.6578044, -0.8675237, 3.258823, 0.5137255, 0, 1, 1,
0.6602585, -2.002339, 3.876998, 0.5176471, 0, 1, 1,
0.6617242, 1.468011, 0.885222, 0.5254902, 0, 1, 1,
0.665983, -0.1124468, 2.61671, 0.5294118, 0, 1, 1,
0.6667936, -0.1892655, 2.077266, 0.5372549, 0, 1, 1,
0.6669011, 0.2160361, -0.47995, 0.5411765, 0, 1, 1,
0.6672503, -0.4308132, 1.681503, 0.5490196, 0, 1, 1,
0.6690292, -0.4269188, 2.356156, 0.5529412, 0, 1, 1,
0.6727465, -1.000053, 2.909218, 0.5607843, 0, 1, 1,
0.6756133, -0.3663077, 2.911812, 0.5647059, 0, 1, 1,
0.6772097, -0.5688899, 1.621357, 0.572549, 0, 1, 1,
0.6777304, -0.8195624, 2.001568, 0.5764706, 0, 1, 1,
0.6781736, 0.1687233, 2.761847, 0.5843138, 0, 1, 1,
0.678602, 0.04374811, 2.188464, 0.5882353, 0, 1, 1,
0.6793108, 0.469041, 0.1847633, 0.5960785, 0, 1, 1,
0.6818172, 0.01028228, 4.2315, 0.6039216, 0, 1, 1,
0.6873699, -1.5166, 2.152179, 0.6078432, 0, 1, 1,
0.6961779, -0.3450343, -0.3319421, 0.6156863, 0, 1, 1,
0.6965254, -1.380883, 3.122771, 0.6196079, 0, 1, 1,
0.6966199, 1.108539, 1.021836, 0.627451, 0, 1, 1,
0.6972825, 0.3034057, -1.041842, 0.6313726, 0, 1, 1,
0.7026737, 0.2919262, 2.10587, 0.6392157, 0, 1, 1,
0.7031522, 0.2522482, 2.632142, 0.6431373, 0, 1, 1,
0.7044595, 1.311577, 0.2111976, 0.6509804, 0, 1, 1,
0.7058566, -0.3340102, 1.987933, 0.654902, 0, 1, 1,
0.7077211, -0.4696585, 1.938171, 0.6627451, 0, 1, 1,
0.7146524, -0.6089587, 2.262503, 0.6666667, 0, 1, 1,
0.7149026, 0.3204171, -0.9947589, 0.6745098, 0, 1, 1,
0.7150214, 0.04717103, 0.7812224, 0.6784314, 0, 1, 1,
0.7169753, -0.3133751, 0.597011, 0.6862745, 0, 1, 1,
0.7221365, 1.034521, -1.549794, 0.6901961, 0, 1, 1,
0.7235488, -0.0455005, -0.7644868, 0.6980392, 0, 1, 1,
0.725694, 0.8494819, 1.072868, 0.7058824, 0, 1, 1,
0.7352269, 1.872532, 0.09009802, 0.7098039, 0, 1, 1,
0.7424616, -0.005595273, 1.027684, 0.7176471, 0, 1, 1,
0.7425776, -0.85331, 3.710447, 0.7215686, 0, 1, 1,
0.7441352, 1.012023, 1.551035, 0.7294118, 0, 1, 1,
0.7462015, -0.3744346, 1.112286, 0.7333333, 0, 1, 1,
0.7531992, -0.9919843, -0.6651075, 0.7411765, 0, 1, 1,
0.7563925, 0.903171, 1.04703, 0.7450981, 0, 1, 1,
0.7637165, 0.04164112, 1.315047, 0.7529412, 0, 1, 1,
0.7648201, 0.5351992, -0.01704882, 0.7568628, 0, 1, 1,
0.7660736, 0.6808558, 1.229705, 0.7647059, 0, 1, 1,
0.7691328, -1.489133, 1.806854, 0.7686275, 0, 1, 1,
0.784476, -1.148292, 1.343277, 0.7764706, 0, 1, 1,
0.7875164, -2.773808, 2.731762, 0.7803922, 0, 1, 1,
0.7918053, 0.2855444, 0.2838852, 0.7882353, 0, 1, 1,
0.7945918, -0.6551208, 1.472151, 0.7921569, 0, 1, 1,
0.8012841, 1.091818, -0.1290538, 0.8, 0, 1, 1,
0.8035389, 1.769595, 0.9503071, 0.8078431, 0, 1, 1,
0.8052888, 1.066546, 0.7829629, 0.8117647, 0, 1, 1,
0.8082185, -0.3215693, 2.054811, 0.8196079, 0, 1, 1,
0.8117548, -1.565548, 2.78417, 0.8235294, 0, 1, 1,
0.8171334, -1.441169, 1.583538, 0.8313726, 0, 1, 1,
0.8183864, 0.8841063, 1.479245, 0.8352941, 0, 1, 1,
0.8279262, -0.9487122, 2.840274, 0.8431373, 0, 1, 1,
0.8342091, -0.3791352, 2.062598, 0.8470588, 0, 1, 1,
0.8400595, -0.7363214, 1.267429, 0.854902, 0, 1, 1,
0.843063, 0.981882, 1.521517, 0.8588235, 0, 1, 1,
0.8451344, -1.033278, 1.797233, 0.8666667, 0, 1, 1,
0.8454924, -1.404634, 2.261469, 0.8705882, 0, 1, 1,
0.8469177, -0.7405789, 3.719286, 0.8784314, 0, 1, 1,
0.8476003, 0.02929614, 1.521906, 0.8823529, 0, 1, 1,
0.8529606, 0.7884725, 0.5683371, 0.8901961, 0, 1, 1,
0.8542114, 0.69009, 1.124448, 0.8941177, 0, 1, 1,
0.8566098, -0.4314532, 1.935148, 0.9019608, 0, 1, 1,
0.8572096, 0.4455515, 0.2289481, 0.9098039, 0, 1, 1,
0.8592795, -0.5360649, 2.570316, 0.9137255, 0, 1, 1,
0.8680388, 0.6278569, 0.06848167, 0.9215686, 0, 1, 1,
0.8752567, 0.8560894, 0.4330862, 0.9254902, 0, 1, 1,
0.8785893, 1.298388, 1.126333, 0.9333333, 0, 1, 1,
0.8808033, 0.220954, -0.1646067, 0.9372549, 0, 1, 1,
0.8844835, -0.3809789, 1.024588, 0.945098, 0, 1, 1,
0.8905138, 0.4101425, 1.88967, 0.9490196, 0, 1, 1,
0.893867, -0.4862447, 2.390471, 0.9568627, 0, 1, 1,
0.9091524, -2.38042, 2.755817, 0.9607843, 0, 1, 1,
0.9217529, 1.533968, -0.3196942, 0.9686275, 0, 1, 1,
0.9247508, -0.3006151, 0.611552, 0.972549, 0, 1, 1,
0.926264, 2.9192, -1.673211, 0.9803922, 0, 1, 1,
0.9296829, -0.3320372, 1.302017, 0.9843137, 0, 1, 1,
0.9357992, -0.1754369, 0.5139902, 0.9921569, 0, 1, 1,
0.9360237, -0.03596098, 0.5946404, 0.9960784, 0, 1, 1,
0.9405795, -0.3600266, 2.741425, 1, 0, 0.9960784, 1,
0.94139, 1.701151, 0.535031, 1, 0, 0.9882353, 1,
0.9415625, 0.2273318, 1.215797, 1, 0, 0.9843137, 1,
0.949331, 0.5178875, 2.409876, 1, 0, 0.9764706, 1,
0.9516532, 0.3928546, -0.1784817, 1, 0, 0.972549, 1,
0.9547437, -0.7521726, 1.340091, 1, 0, 0.9647059, 1,
0.9561525, 0.7605966, -0.642296, 1, 0, 0.9607843, 1,
0.9660285, 1.040304, 0.7578061, 1, 0, 0.9529412, 1,
0.9695622, 1.628306, 0.6434959, 1, 0, 0.9490196, 1,
0.9853022, 0.6626089, 0.6134502, 1, 0, 0.9411765, 1,
1.006997, -0.9214556, 1.309457, 1, 0, 0.9372549, 1,
1.007693, -0.3894727, 1.07316, 1, 0, 0.9294118, 1,
1.008736, 1.601869, -0.4404001, 1, 0, 0.9254902, 1,
1.021158, 0.07020822, 0.525801, 1, 0, 0.9176471, 1,
1.022844, -0.9274347, 3.160995, 1, 0, 0.9137255, 1,
1.026999, 1.115203, 0.7519852, 1, 0, 0.9058824, 1,
1.030451, -0.7635241, 3.618626, 1, 0, 0.9019608, 1,
1.038659, 0.2342406, -0.7196359, 1, 0, 0.8941177, 1,
1.038765, 1.124652, -0.2627043, 1, 0, 0.8862745, 1,
1.039003, -0.662537, 1.274329, 1, 0, 0.8823529, 1,
1.041406, -0.6820725, 2.703092, 1, 0, 0.8745098, 1,
1.045771, 1.843732, 0.6574052, 1, 0, 0.8705882, 1,
1.047625, 0.9172083, 1.718651, 1, 0, 0.8627451, 1,
1.051343, -1.058585, 1.859045, 1, 0, 0.8588235, 1,
1.052468, 0.6451665, 1.95219, 1, 0, 0.8509804, 1,
1.054588, -1.319236, 4.15066, 1, 0, 0.8470588, 1,
1.069894, 0.4458508, 2.057872, 1, 0, 0.8392157, 1,
1.070106, -0.2300408, 2.677618, 1, 0, 0.8352941, 1,
1.071887, -0.4082903, 1.363559, 1, 0, 0.827451, 1,
1.073376, 2.661737, 1.31554, 1, 0, 0.8235294, 1,
1.07389, 0.4963818, 0.3344056, 1, 0, 0.8156863, 1,
1.077126, 1.384861, 0.4748909, 1, 0, 0.8117647, 1,
1.08726, 0.2585299, 2.554416, 1, 0, 0.8039216, 1,
1.093419, 1.589831, -1.066413, 1, 0, 0.7960784, 1,
1.093755, 0.574196, -0.2577721, 1, 0, 0.7921569, 1,
1.098056, 0.04937457, 3.452039, 1, 0, 0.7843137, 1,
1.100694, 0.1734589, 0.6733255, 1, 0, 0.7803922, 1,
1.101821, 1.686947, 1.808753, 1, 0, 0.772549, 1,
1.104536, -1.167949, 2.327662, 1, 0, 0.7686275, 1,
1.105144, -0.3649281, 0.448852, 1, 0, 0.7607843, 1,
1.115274, 0.7216126, 1.627901, 1, 0, 0.7568628, 1,
1.118316, -0.181841, 3.597582, 1, 0, 0.7490196, 1,
1.120648, 0.3588681, 1.837693, 1, 0, 0.7450981, 1,
1.122248, -0.883237, 2.328581, 1, 0, 0.7372549, 1,
1.123739, 1.999494, 1.273468, 1, 0, 0.7333333, 1,
1.126777, 0.5931569, 0.6823336, 1, 0, 0.7254902, 1,
1.130599, 0.5968294, 1.876001, 1, 0, 0.7215686, 1,
1.135363, 0.9336557, 0.6864839, 1, 0, 0.7137255, 1,
1.136257, 1.272844, 0.3460405, 1, 0, 0.7098039, 1,
1.136297, -0.7978516, 2.795439, 1, 0, 0.7019608, 1,
1.13748, -0.8165419, 3.574174, 1, 0, 0.6941177, 1,
1.142637, -0.6774166, 1.065069, 1, 0, 0.6901961, 1,
1.147763, -0.4591802, -0.9770129, 1, 0, 0.682353, 1,
1.160133, 0.5401893, 2.146462, 1, 0, 0.6784314, 1,
1.163553, -1.003917, 3.865522, 1, 0, 0.6705883, 1,
1.179714, -1.649989, 1.776519, 1, 0, 0.6666667, 1,
1.181149, -0.168223, 2.59165, 1, 0, 0.6588235, 1,
1.184448, -0.330818, 0.6941589, 1, 0, 0.654902, 1,
1.184649, 0.7009562, 2.683688, 1, 0, 0.6470588, 1,
1.19188, 0.3053254, 1.648272, 1, 0, 0.6431373, 1,
1.193263, -0.7698203, 1.720931, 1, 0, 0.6352941, 1,
1.195291, -0.9531858, 2.064511, 1, 0, 0.6313726, 1,
1.195357, -0.4920783, 3.018035, 1, 0, 0.6235294, 1,
1.199733, -1.247516, 1.924769, 1, 0, 0.6196079, 1,
1.224474, 0.5015002, 1.118275, 1, 0, 0.6117647, 1,
1.224666, 0.7241537, 0.8959174, 1, 0, 0.6078432, 1,
1.231121, -0.3639129, 2.431347, 1, 0, 0.6, 1,
1.235773, -1.313597, 2.100401, 1, 0, 0.5921569, 1,
1.2477, -0.725216, 0.6505165, 1, 0, 0.5882353, 1,
1.24784, -0.3092272, 1.358254, 1, 0, 0.5803922, 1,
1.254673, 0.263865, 1.89581, 1, 0, 0.5764706, 1,
1.257464, -1.290526, 3.456288, 1, 0, 0.5686275, 1,
1.262843, 0.6097664, 0.3700937, 1, 0, 0.5647059, 1,
1.263727, -0.6007658, 1.131212, 1, 0, 0.5568628, 1,
1.276507, 0.2727273, 0.7247993, 1, 0, 0.5529412, 1,
1.27811, -0.9826732, 4.698914, 1, 0, 0.5450981, 1,
1.29218, 0.003051143, 0.9522682, 1, 0, 0.5411765, 1,
1.311724, 1.869147, -0.9234, 1, 0, 0.5333334, 1,
1.312225, -1.256943, 1.840562, 1, 0, 0.5294118, 1,
1.317623, -1.739509, 2.497219, 1, 0, 0.5215687, 1,
1.330623, 0.5987593, 3.274313, 1, 0, 0.5176471, 1,
1.345089, -0.1033224, 2.653996, 1, 0, 0.509804, 1,
1.356933, 0.6874821, 1.157205, 1, 0, 0.5058824, 1,
1.359407, -1.471286, 3.069953, 1, 0, 0.4980392, 1,
1.362271, -0.8512352, 3.796344, 1, 0, 0.4901961, 1,
1.383794, 1.321718, 0.7332045, 1, 0, 0.4862745, 1,
1.385837, -0.07860736, 2.238394, 1, 0, 0.4784314, 1,
1.389207, -0.3115076, 3.279998, 1, 0, 0.4745098, 1,
1.392752, -0.6103879, 1.835262, 1, 0, 0.4666667, 1,
1.395545, 0.878833, 1.538135, 1, 0, 0.4627451, 1,
1.398594, -0.0528457, 1.721565, 1, 0, 0.454902, 1,
1.399211, -0.0002567899, 1.38508, 1, 0, 0.4509804, 1,
1.402132, 0.6437802, 0.9631577, 1, 0, 0.4431373, 1,
1.404688, 0.8965589, 1.417031, 1, 0, 0.4392157, 1,
1.40684, -0.3139728, -1.765177, 1, 0, 0.4313726, 1,
1.407223, 0.4065696, 3.061939, 1, 0, 0.427451, 1,
1.410851, 0.4380527, 0.7102771, 1, 0, 0.4196078, 1,
1.414152, -0.1424751, 0.7457164, 1, 0, 0.4156863, 1,
1.417871, 0.3078438, 1.626576, 1, 0, 0.4078431, 1,
1.419225, 0.05560631, 0.9934521, 1, 0, 0.4039216, 1,
1.42574, -2.469832, 1.227577, 1, 0, 0.3960784, 1,
1.430441, 0.7294889, 0.9681905, 1, 0, 0.3882353, 1,
1.430907, 1.613818, 0.5888558, 1, 0, 0.3843137, 1,
1.439556, -0.258286, 2.378529, 1, 0, 0.3764706, 1,
1.4524, 1.010034, 1.12743, 1, 0, 0.372549, 1,
1.460396, 0.001178858, 1.323625, 1, 0, 0.3647059, 1,
1.469775, -1.901701, 3.332747, 1, 0, 0.3607843, 1,
1.492241, 0.5094116, 1.961954, 1, 0, 0.3529412, 1,
1.493842, 1.799362, -1.531551, 1, 0, 0.3490196, 1,
1.504896, -0.3898838, 3.089282, 1, 0, 0.3411765, 1,
1.518642, 0.4640956, 0.3467073, 1, 0, 0.3372549, 1,
1.534646, -1.018449, 1.966376, 1, 0, 0.3294118, 1,
1.572056, -0.2383, 1.383788, 1, 0, 0.3254902, 1,
1.573817, 0.9668605, -0.4587667, 1, 0, 0.3176471, 1,
1.574926, 0.2611243, 1.810424, 1, 0, 0.3137255, 1,
1.577672, -0.2940839, 2.462786, 1, 0, 0.3058824, 1,
1.581358, -0.08950459, 1.776737, 1, 0, 0.2980392, 1,
1.61103, 0.4438598, 3.236686, 1, 0, 0.2941177, 1,
1.613931, -0.1813228, 1.915414, 1, 0, 0.2862745, 1,
1.614262, 0.932642, -0.716342, 1, 0, 0.282353, 1,
1.626018, -1.071883, 2.579732, 1, 0, 0.2745098, 1,
1.634907, 1.860597, 0.6270286, 1, 0, 0.2705882, 1,
1.647303, -2.621357, 2.77718, 1, 0, 0.2627451, 1,
1.679158, 0.2248722, 1.923015, 1, 0, 0.2588235, 1,
1.697273, -1.439119, 1.688881, 1, 0, 0.2509804, 1,
1.706285, -0.4991073, 2.108714, 1, 0, 0.2470588, 1,
1.750133, -0.7468531, 2.121355, 1, 0, 0.2392157, 1,
1.753852, 0.1123339, 1.192599, 1, 0, 0.2352941, 1,
1.765402, 0.5326913, 2.7688, 1, 0, 0.227451, 1,
1.766047, 1.177327, 1.586687, 1, 0, 0.2235294, 1,
1.787308, -1.057998, 2.170864, 1, 0, 0.2156863, 1,
1.798779, -1.912491, 1.477607, 1, 0, 0.2117647, 1,
1.820679, 1.229987, 0.7558701, 1, 0, 0.2039216, 1,
1.824398, 0.2272072, 1.039253, 1, 0, 0.1960784, 1,
1.838877, 0.5231942, 2.451559, 1, 0, 0.1921569, 1,
1.846473, -0.153028, 3.113629, 1, 0, 0.1843137, 1,
1.859146, -0.6742159, 3.045631, 1, 0, 0.1803922, 1,
1.872713, 0.1107494, 2.447837, 1, 0, 0.172549, 1,
1.895272, -1.545337, 3.658998, 1, 0, 0.1686275, 1,
1.898486, -0.5635394, 2.331564, 1, 0, 0.1607843, 1,
1.898591, -0.4678485, 1.618985, 1, 0, 0.1568628, 1,
1.94527, 0.6247142, 2.208671, 1, 0, 0.1490196, 1,
1.945881, 1.135229, 2.345686, 1, 0, 0.145098, 1,
1.969474, -0.1617948, 2.283884, 1, 0, 0.1372549, 1,
1.970948, 1.659204, 1.454639, 1, 0, 0.1333333, 1,
1.99367, 0.2665106, 1.583007, 1, 0, 0.1254902, 1,
2.008899, 0.5645978, 2.553281, 1, 0, 0.1215686, 1,
2.050575, 0.4060286, 2.123285, 1, 0, 0.1137255, 1,
2.053998, -0.2975739, 3.021408, 1, 0, 0.1098039, 1,
2.071716, -0.5219747, 1.665244, 1, 0, 0.1019608, 1,
2.135493, 1.451236, 1.826429, 1, 0, 0.09411765, 1,
2.14523, 1.765539, 1.196998, 1, 0, 0.09019608, 1,
2.150503, -0.2152133, 1.228251, 1, 0, 0.08235294, 1,
2.15299, 1.26803, -0.1621538, 1, 0, 0.07843138, 1,
2.195908, 1.230545, 1.694117, 1, 0, 0.07058824, 1,
2.286291, 1.764323, 0.9723033, 1, 0, 0.06666667, 1,
2.302317, 0.4409306, 1.541882, 1, 0, 0.05882353, 1,
2.34275, -0.5210975, 1.968718, 1, 0, 0.05490196, 1,
2.344169, -0.6913611, 1.841852, 1, 0, 0.04705882, 1,
2.344866, -1.178725, 2.658831, 1, 0, 0.04313726, 1,
2.38733, 0.7356591, 2.380745, 1, 0, 0.03529412, 1,
2.531757, -0.5054944, 1.784173, 1, 0, 0.03137255, 1,
2.559869, -0.6072029, 0.8392441, 1, 0, 0.02352941, 1,
2.777276, 0.9381817, 1.457746, 1, 0, 0.01960784, 1,
3.113289, -0.709921, 3.535091, 1, 0, 0.01176471, 1,
3.481358, 0.2072239, -0.8040781, 1, 0, 0.007843138, 1
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
-0.08246803, -4.78063, -7.178087, 0, -0.5, 0.5, 0.5,
-0.08246803, -4.78063, -7.178087, 1, -0.5, 0.5, 0.5,
-0.08246803, -4.78063, -7.178087, 1, 1.5, 0.5, 0.5,
-0.08246803, -4.78063, -7.178087, 0, 1.5, 0.5, 0.5
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
-4.854431, -0.09913349, -7.178087, 0, -0.5, 0.5, 0.5,
-4.854431, -0.09913349, -7.178087, 1, -0.5, 0.5, 0.5,
-4.854431, -0.09913349, -7.178087, 1, 1.5, 0.5, 0.5,
-4.854431, -0.09913349, -7.178087, 0, 1.5, 0.5, 0.5
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
-4.854431, -4.78063, 0.4799037, 0, -0.5, 0.5, 0.5,
-4.854431, -4.78063, 0.4799037, 1, -0.5, 0.5, 0.5,
-4.854431, -4.78063, 0.4799037, 1, 1.5, 0.5, 0.5,
-4.854431, -4.78063, 0.4799037, 0, 1.5, 0.5, 0.5
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
-2, -3.700284, -5.410858,
2, -3.700284, -5.410858,
-2, -3.700284, -5.410858,
-2, -3.880342, -5.705396,
0, -3.700284, -5.410858,
0, -3.880342, -5.705396,
2, -3.700284, -5.410858,
2, -3.880342, -5.705396
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
-2, -4.240457, -6.294473, 0, -0.5, 0.5, 0.5,
-2, -4.240457, -6.294473, 1, -0.5, 0.5, 0.5,
-2, -4.240457, -6.294473, 1, 1.5, 0.5, 0.5,
-2, -4.240457, -6.294473, 0, 1.5, 0.5, 0.5,
0, -4.240457, -6.294473, 0, -0.5, 0.5, 0.5,
0, -4.240457, -6.294473, 1, -0.5, 0.5, 0.5,
0, -4.240457, -6.294473, 1, 1.5, 0.5, 0.5,
0, -4.240457, -6.294473, 0, 1.5, 0.5, 0.5,
2, -4.240457, -6.294473, 0, -0.5, 0.5, 0.5,
2, -4.240457, -6.294473, 1, -0.5, 0.5, 0.5,
2, -4.240457, -6.294473, 1, 1.5, 0.5, 0.5,
2, -4.240457, -6.294473, 0, 1.5, 0.5, 0.5
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
-3.753209, -3, -5.410858,
-3.753209, 3, -5.410858,
-3.753209, -3, -5.410858,
-3.936746, -3, -5.705396,
-3.753209, -2, -5.410858,
-3.936746, -2, -5.705396,
-3.753209, -1, -5.410858,
-3.936746, -1, -5.705396,
-3.753209, 0, -5.410858,
-3.936746, 0, -5.705396,
-3.753209, 1, -5.410858,
-3.936746, 1, -5.705396,
-3.753209, 2, -5.410858,
-3.936746, 2, -5.705396,
-3.753209, 3, -5.410858,
-3.936746, 3, -5.705396
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
-4.30382, -3, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, -3, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, -3, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, -3, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, -2, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, -2, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, -2, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, -2, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, -1, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, -1, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, -1, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, -1, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, 0, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, 0, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, 0, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, 0, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, 1, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, 1, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, 1, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, 1, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, 2, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, 2, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, 2, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, 2, -6.294473, 0, 1.5, 0.5, 0.5,
-4.30382, 3, -6.294473, 0, -0.5, 0.5, 0.5,
-4.30382, 3, -6.294473, 1, -0.5, 0.5, 0.5,
-4.30382, 3, -6.294473, 1, 1.5, 0.5, 0.5,
-4.30382, 3, -6.294473, 0, 1.5, 0.5, 0.5
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
-3.753209, -3.700284, -4,
-3.753209, -3.700284, 6,
-3.753209, -3.700284, -4,
-3.936746, -3.880342, -4,
-3.753209, -3.700284, -2,
-3.936746, -3.880342, -2,
-3.753209, -3.700284, 0,
-3.936746, -3.880342, 0,
-3.753209, -3.700284, 2,
-3.936746, -3.880342, 2,
-3.753209, -3.700284, 4,
-3.936746, -3.880342, 4,
-3.753209, -3.700284, 6,
-3.936746, -3.880342, 6
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
-4.30382, -4.240457, -4, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, -4, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, -4, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, -4, 0, 1.5, 0.5, 0.5,
-4.30382, -4.240457, -2, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, -2, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, -2, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, -2, 0, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 0, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 0, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 0, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 0, 0, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 2, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 2, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 2, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 2, 0, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 4, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 4, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 4, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 4, 0, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 6, 0, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 6, 1, -0.5, 0.5, 0.5,
-4.30382, -4.240457, 6, 1, 1.5, 0.5, 0.5,
-4.30382, -4.240457, 6, 0, 1.5, 0.5, 0.5
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
-3.753209, -3.700284, -5.410858,
-3.753209, 3.502017, -5.410858,
-3.753209, -3.700284, 6.370666,
-3.753209, 3.502017, 6.370666,
-3.753209, -3.700284, -5.410858,
-3.753209, -3.700284, 6.370666,
-3.753209, 3.502017, -5.410858,
-3.753209, 3.502017, 6.370666,
-3.753209, -3.700284, -5.410858,
3.588273, -3.700284, -5.410858,
-3.753209, -3.700284, 6.370666,
3.588273, -3.700284, 6.370666,
-3.753209, 3.502017, -5.410858,
3.588273, 3.502017, -5.410858,
-3.753209, 3.502017, 6.370666,
3.588273, 3.502017, 6.370666,
3.588273, -3.700284, -5.410858,
3.588273, 3.502017, -5.410858,
3.588273, -3.700284, 6.370666,
3.588273, 3.502017, 6.370666,
3.588273, -3.700284, -5.410858,
3.588273, -3.700284, 6.370666,
3.588273, 3.502017, -5.410858,
3.588273, 3.502017, 6.370666
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
var radius = 8.350862;
var distance = 37.15393;
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
mvMatrix.translate( 0.08246803, 0.09913349, -0.4799037 );
mvMatrix.scale( 1.229877, 1.253643, 0.7663793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.15393);
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
Chlortoluron<-read.table("Chlortoluron.xyz")
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
-3.646294, -0.6178126, 0.571956, 0, 0, 1, 1, 1,
-3.187145, -2.034882, -2.212532, 1, 0, 0, 1, 1,
-2.969409, 1.094426, -0.2855999, 1, 0, 0, 1, 1,
-2.845846, 0.7879387, -1.186182, 1, 0, 0, 1, 1,
-2.682385, -0.9458625, -2.739679, 1, 0, 0, 1, 1,
-2.674298, -0.8420472, -2.297202, 1, 0, 0, 1, 1,
-2.623958, -1.184058, -0.07957351, 0, 0, 0, 1, 1,
-2.622246, -0.6054544, -0.3673805, 0, 0, 0, 1, 1,
-2.573484, 1.165456, -1.156256, 0, 0, 0, 1, 1,
-2.442831, 0.8487034, -1.648939, 0, 0, 0, 1, 1,
-2.427298, -0.1625774, -0.4777765, 0, 0, 0, 1, 1,
-2.351836, -0.1894152, -2.072375, 0, 0, 0, 1, 1,
-2.343781, 2.375149, -0.956193, 0, 0, 0, 1, 1,
-2.332119, 0.8454149, -1.864315, 1, 1, 1, 1, 1,
-2.315877, 1.417958, -0.09447363, 1, 1, 1, 1, 1,
-2.286551, 0.5921872, -2.173415, 1, 1, 1, 1, 1,
-2.253718, -0.9572133, -0.9419788, 1, 1, 1, 1, 1,
-2.242734, -1.205566, -0.8088881, 1, 1, 1, 1, 1,
-2.234737, -1.005012, -2.23784, 1, 1, 1, 1, 1,
-2.218578, 0.3048914, -0.4334562, 1, 1, 1, 1, 1,
-2.209766, 1.188069, -1.817948, 1, 1, 1, 1, 1,
-2.184077, -0.8395497, -2.297042, 1, 1, 1, 1, 1,
-2.172049, -1.34042, -3.274739, 1, 1, 1, 1, 1,
-2.155167, 0.4546218, -0.3534424, 1, 1, 1, 1, 1,
-2.110002, 0.3898031, -0.4560881, 1, 1, 1, 1, 1,
-2.100552, 0.9763677, -1.759348, 1, 1, 1, 1, 1,
-2.087229, -0.2697253, -1.172706, 1, 1, 1, 1, 1,
-2.044137, -0.9150419, -0.9604722, 1, 1, 1, 1, 1,
-2.007015, -1.72057, -2.393519, 0, 0, 1, 1, 1,
-1.968159, -0.7314681, -2.827669, 1, 0, 0, 1, 1,
-1.956605, -0.09864285, -3.608833, 1, 0, 0, 1, 1,
-1.935323, 0.7359531, 0.1822141, 1, 0, 0, 1, 1,
-1.853436, 1.86934, -0.5731843, 1, 0, 0, 1, 1,
-1.851857, 0.2940637, -1.600575, 1, 0, 0, 1, 1,
-1.84057, -1.192751, -3.263582, 0, 0, 0, 1, 1,
-1.789311, 0.6825958, -2.016357, 0, 0, 0, 1, 1,
-1.779934, 1.513434, -0.1098911, 0, 0, 0, 1, 1,
-1.775905, 0.5494924, 0.8260809, 0, 0, 0, 1, 1,
-1.771697, 0.08982372, -1.423289, 0, 0, 0, 1, 1,
-1.770496, 1.567162, -2.104381, 0, 0, 0, 1, 1,
-1.766452, -1.150882, -4.428609, 0, 0, 0, 1, 1,
-1.761526, -0.7163675, -2.423078, 1, 1, 1, 1, 1,
-1.752726, -0.6354834, -2.162751, 1, 1, 1, 1, 1,
-1.749009, 0.9723572, -0.9481996, 1, 1, 1, 1, 1,
-1.742523, -1.818494, -2.62142, 1, 1, 1, 1, 1,
-1.731, 0.8627336, -1.261182, 1, 1, 1, 1, 1,
-1.707699, 0.5151157, -2.522429, 1, 1, 1, 1, 1,
-1.698693, -0.5122802, -2.593289, 1, 1, 1, 1, 1,
-1.692838, 0.2039451, -2.030257, 1, 1, 1, 1, 1,
-1.690642, 1.989512, -1.95775, 1, 1, 1, 1, 1,
-1.671416, -1.12726, -1.475721, 1, 1, 1, 1, 1,
-1.670169, -1.270804, -0.7564664, 1, 1, 1, 1, 1,
-1.650355, 3.090721, -0.980097, 1, 1, 1, 1, 1,
-1.621, -0.1663826, -0.8126391, 1, 1, 1, 1, 1,
-1.619103, 0.1216256, -1.486376, 1, 1, 1, 1, 1,
-1.617985, -1.638029, -2.516372, 1, 1, 1, 1, 1,
-1.593063, 0.06826568, -0.8691285, 0, 0, 1, 1, 1,
-1.59162, 0.04022503, -1.83846, 1, 0, 0, 1, 1,
-1.58153, 1.430059, -0.2216413, 1, 0, 0, 1, 1,
-1.570905, -0.8384163, -2.936266, 1, 0, 0, 1, 1,
-1.561203, -2.458044, -3.249384, 1, 0, 0, 1, 1,
-1.551964, 1.682319, -1.384582, 1, 0, 0, 1, 1,
-1.536189, 0.05997731, -0.9442272, 0, 0, 0, 1, 1,
-1.534753, -0.143742, -0.6250576, 0, 0, 0, 1, 1,
-1.522588, 0.6317858, 0.1767331, 0, 0, 0, 1, 1,
-1.520279, -0.7273889, -1.735591, 0, 0, 0, 1, 1,
-1.519314, -0.2645795, -0.4634755, 0, 0, 0, 1, 1,
-1.518171, 0.6049966, -5.029537, 0, 0, 0, 1, 1,
-1.512124, 1.125959, -2.220203, 0, 0, 0, 1, 1,
-1.511349, -0.9376125, -0.9767702, 1, 1, 1, 1, 1,
-1.497663, -0.5178068, -1.384259, 1, 1, 1, 1, 1,
-1.495059, 1.125036, -1.294036, 1, 1, 1, 1, 1,
-1.482049, -0.4624939, -2.149213, 1, 1, 1, 1, 1,
-1.480163, -0.3572708, -2.44997, 1, 1, 1, 1, 1,
-1.474372, 0.005050812, -1.326202, 1, 1, 1, 1, 1,
-1.470461, -0.5585791, -3.565241, 1, 1, 1, 1, 1,
-1.461102, -0.7535704, -2.98837, 1, 1, 1, 1, 1,
-1.453501, 0.154671, -2.264836, 1, 1, 1, 1, 1,
-1.438427, 0.2796343, -1.309431, 1, 1, 1, 1, 1,
-1.434345, 0.1902903, -0.7656513, 1, 1, 1, 1, 1,
-1.432165, -0.165563, -1.277702, 1, 1, 1, 1, 1,
-1.423184, -0.02770613, -1.221527, 1, 1, 1, 1, 1,
-1.42111, 0.1659368, -2.694201, 1, 1, 1, 1, 1,
-1.410877, 1.839928, -0.6950305, 1, 1, 1, 1, 1,
-1.403051, 3.39713, 1.596538, 0, 0, 1, 1, 1,
-1.386624, 1.276886, -1.164029, 1, 0, 0, 1, 1,
-1.384365, -1.446902, -3.281892, 1, 0, 0, 1, 1,
-1.378535, 1.905938, -0.6185209, 1, 0, 0, 1, 1,
-1.375333, 0.3702672, 0.7326691, 1, 0, 0, 1, 1,
-1.375048, 0.3487678, -0.6653763, 1, 0, 0, 1, 1,
-1.37347, -0.1350499, -1.615607, 0, 0, 0, 1, 1,
-1.371275, 0.9374773, -2.158782, 0, 0, 0, 1, 1,
-1.368465, 1.089722, -1.002419, 0, 0, 0, 1, 1,
-1.36618, 0.935204, 0.1236081, 0, 0, 0, 1, 1,
-1.36217, -1.873615, -2.487831, 0, 0, 0, 1, 1,
-1.361816, -1.892376, -3.522133, 0, 0, 0, 1, 1,
-1.358291, -1.776973, -1.291535, 0, 0, 0, 1, 1,
-1.356152, 2.448781, -0.5793607, 1, 1, 1, 1, 1,
-1.354262, -0.124139, -2.017759, 1, 1, 1, 1, 1,
-1.353929, -1.284783, -1.678118, 1, 1, 1, 1, 1,
-1.343169, -0.7260344, -1.808476, 1, 1, 1, 1, 1,
-1.322525, -0.9745326, -2.049961, 1, 1, 1, 1, 1,
-1.315503, 1.482676, -0.3919468, 1, 1, 1, 1, 1,
-1.315068, -0.7405689, -1.171172, 1, 1, 1, 1, 1,
-1.311339, 0.901278, 0.9044753, 1, 1, 1, 1, 1,
-1.303941, 2.85372, -1.269962, 1, 1, 1, 1, 1,
-1.298941, -0.9146265, -2.051524, 1, 1, 1, 1, 1,
-1.297049, 0.7098632, -0.290112, 1, 1, 1, 1, 1,
-1.29474, 2.357536, -0.170201, 1, 1, 1, 1, 1,
-1.278535, -0.2143599, -1.665406, 1, 1, 1, 1, 1,
-1.275388, -1.779324, -5.239283, 1, 1, 1, 1, 1,
-1.271508, 2.525154, -0.8485044, 1, 1, 1, 1, 1,
-1.270187, -1.23596, -3.364919, 0, 0, 1, 1, 1,
-1.263678, 0.6105457, -1.787029, 1, 0, 0, 1, 1,
-1.260109, 1.602684, -1.025998, 1, 0, 0, 1, 1,
-1.254981, -0.4572825, -0.8434254, 1, 0, 0, 1, 1,
-1.250943, 0.1953786, -0.8669324, 1, 0, 0, 1, 1,
-1.244943, 0.6734925, 0.004020193, 1, 0, 0, 1, 1,
-1.239438, -1.609137, -1.548244, 0, 0, 0, 1, 1,
-1.237967, 0.3577759, -2.08504, 0, 0, 0, 1, 1,
-1.232521, 0.5170923, -1.729671, 0, 0, 0, 1, 1,
-1.231646, 0.2927388, -1.503858, 0, 0, 0, 1, 1,
-1.206018, -0.4733363, -1.062563, 0, 0, 0, 1, 1,
-1.205948, 1.380705, -0.1945427, 0, 0, 0, 1, 1,
-1.198464, 0.03468175, -1.27648, 0, 0, 0, 1, 1,
-1.196847, 0.7059051, -0.8706096, 1, 1, 1, 1, 1,
-1.193134, 0.1465524, -2.173771, 1, 1, 1, 1, 1,
-1.191763, -1.413313, -3.21758, 1, 1, 1, 1, 1,
-1.190505, -0.4198774, -2.260285, 1, 1, 1, 1, 1,
-1.1899, -0.4801453, -2.270549, 1, 1, 1, 1, 1,
-1.183344, 0.4956719, -1.723194, 1, 1, 1, 1, 1,
-1.18265, -1.80524, -3.064641, 1, 1, 1, 1, 1,
-1.161383, -1.2261, -4.031186, 1, 1, 1, 1, 1,
-1.157819, 1.527177, -1.113721, 1, 1, 1, 1, 1,
-1.156771, 0.5262502, -0.4708183, 1, 1, 1, 1, 1,
-1.155002, -2.193248, -3.029649, 1, 1, 1, 1, 1,
-1.148253, -1.937055, -1.952556, 1, 1, 1, 1, 1,
-1.135583, -0.1301479, -0.7582631, 1, 1, 1, 1, 1,
-1.130878, -0.817857, -2.246306, 1, 1, 1, 1, 1,
-1.122079, -2.554553, -1.778857, 1, 1, 1, 1, 1,
-1.121575, -0.7726982, -2.074992, 0, 0, 1, 1, 1,
-1.118634, 0.1545314, -0.04903849, 1, 0, 0, 1, 1,
-1.116388, 0.4619325, -2.054084, 1, 0, 0, 1, 1,
-1.111176, -0.4526444, -2.039556, 1, 0, 0, 1, 1,
-1.106338, -0.4183487, -1.590485, 1, 0, 0, 1, 1,
-1.103764, -1.105404, -4.649574, 1, 0, 0, 1, 1,
-1.101699, -0.9036971, -3.976052, 0, 0, 0, 1, 1,
-1.100755, -2.448727, -2.71886, 0, 0, 0, 1, 1,
-1.098997, 1.33803, -2.909113, 0, 0, 0, 1, 1,
-1.09419, 2.091988, 0.3670759, 0, 0, 0, 1, 1,
-1.091684, 3.006963, -0.1006635, 0, 0, 0, 1, 1,
-1.088694, 1.592492, -1.193469, 0, 0, 0, 1, 1,
-1.086502, -1.130083, -2.12957, 0, 0, 0, 1, 1,
-1.086293, 0.001568271, -1.679137, 1, 1, 1, 1, 1,
-1.076181, 0.5292342, -2.184716, 1, 1, 1, 1, 1,
-1.068449, 1.072459, -1.096931, 1, 1, 1, 1, 1,
-1.066628, 0.5159346, -0.6999131, 1, 1, 1, 1, 1,
-1.061559, -1.084521, -1.738058, 1, 1, 1, 1, 1,
-1.059706, -1.278263, -3.446612, 1, 1, 1, 1, 1,
-1.053686, 0.3038313, -2.704848, 1, 1, 1, 1, 1,
-1.049573, -3.016986, -2.663146, 1, 1, 1, 1, 1,
-1.04881, -0.01318187, -1.149218, 1, 1, 1, 1, 1,
-1.042617, -0.2827424, -1.339632, 1, 1, 1, 1, 1,
-1.038057, -0.5443389, -1.792423, 1, 1, 1, 1, 1,
-1.037974, 0.3415137, 0.2487188, 1, 1, 1, 1, 1,
-1.03627, 0.6409696, 0.06645534, 1, 1, 1, 1, 1,
-1.032662, -1.113095, -2.300303, 1, 1, 1, 1, 1,
-1.025052, 1.295873, -1.947785, 1, 1, 1, 1, 1,
-1.022918, 0.863721, -2.160797, 0, 0, 1, 1, 1,
-1.021804, -0.00290119, -1.982138, 1, 0, 0, 1, 1,
-1.014753, -0.978025, -3.361513, 1, 0, 0, 1, 1,
-1.011971, -0.4305093, -1.329786, 1, 0, 0, 1, 1,
-1.010815, 0.5094774, -0.7468187, 1, 0, 0, 1, 1,
-1.008337, -0.9510619, -4.250117, 1, 0, 0, 1, 1,
-1.008026, 0.2018955, -1.183859, 0, 0, 0, 1, 1,
-1.006422, -0.3821668, -2.835388, 0, 0, 0, 1, 1,
-1.005946, 0.05319399, -2.063885, 0, 0, 0, 1, 1,
-1.003166, -0.6022124, -2.16793, 0, 0, 0, 1, 1,
-0.9998558, -0.888585, -4.057229, 0, 0, 0, 1, 1,
-0.976767, -2.308986, -2.89624, 0, 0, 0, 1, 1,
-0.9674894, 0.4704466, -1.313226, 0, 0, 0, 1, 1,
-0.9594236, -0.06909128, -0.5675147, 1, 1, 1, 1, 1,
-0.9486281, 0.5642249, -1.765055, 1, 1, 1, 1, 1,
-0.944978, 0.3706008, -1.011845, 1, 1, 1, 1, 1,
-0.9438408, 0.7437369, -1.83425, 1, 1, 1, 1, 1,
-0.9423979, -0.02850293, -0.6052046, 1, 1, 1, 1, 1,
-0.9421954, -0.7738273, -3.571445, 1, 1, 1, 1, 1,
-0.9386469, 0.3633249, -0.385015, 1, 1, 1, 1, 1,
-0.9368774, 0.9125449, -2.32305, 1, 1, 1, 1, 1,
-0.9337382, 0.5891562, -2.010759, 1, 1, 1, 1, 1,
-0.931366, -1.237215, -2.109489, 1, 1, 1, 1, 1,
-0.9290122, -0.5658563, -3.710363, 1, 1, 1, 1, 1,
-0.9252376, -0.3982702, -2.774259, 1, 1, 1, 1, 1,
-0.9250703, -1.566562, -2.415878, 1, 1, 1, 1, 1,
-0.9220752, 0.01891091, -1.034901, 1, 1, 1, 1, 1,
-0.9188793, -0.1373311, -1.386744, 1, 1, 1, 1, 1,
-0.9170269, 0.7537909, -1.846421, 0, 0, 1, 1, 1,
-0.9094785, 0.6198128, -0.0527293, 1, 0, 0, 1, 1,
-0.8998004, 1.4653, -0.03423771, 1, 0, 0, 1, 1,
-0.8977417, 0.4352461, -2.678331, 1, 0, 0, 1, 1,
-0.8826207, 0.03489845, -2.441953, 1, 0, 0, 1, 1,
-0.8823034, 0.8421731, 1.617971, 1, 0, 0, 1, 1,
-0.8742982, 0.1480323, -3.218519, 0, 0, 0, 1, 1,
-0.8735785, 1.85043, 1.890061, 0, 0, 0, 1, 1,
-0.8726479, 0.1599316, -2.494773, 0, 0, 0, 1, 1,
-0.8637434, 2.339006, -0.01835553, 0, 0, 0, 1, 1,
-0.8632192, -0.2420472, -2.466632, 0, 0, 0, 1, 1,
-0.8625231, 0.8180955, -1.193877, 0, 0, 0, 1, 1,
-0.8612835, 0.5423924, -0.8230816, 0, 0, 0, 1, 1,
-0.8596448, 1.345186, 0.1807113, 1, 1, 1, 1, 1,
-0.8571712, 1.021073, -1.531169, 1, 1, 1, 1, 1,
-0.8520084, -0.6584303, -2.003082, 1, 1, 1, 1, 1,
-0.8509471, -0.6697043, -0.8355433, 1, 1, 1, 1, 1,
-0.8479249, 0.02069249, -1.530444, 1, 1, 1, 1, 1,
-0.8382123, -0.2456491, -1.111131, 1, 1, 1, 1, 1,
-0.8335542, -0.2210651, -0.7449788, 1, 1, 1, 1, 1,
-0.8288254, 0.4052863, 1.655608, 1, 1, 1, 1, 1,
-0.8249367, -0.4546334, -1.053924, 1, 1, 1, 1, 1,
-0.8233725, -0.9981278, -3.491067, 1, 1, 1, 1, 1,
-0.8200034, -1.968925, -2.36734, 1, 1, 1, 1, 1,
-0.8166862, -0.739303, -1.355359, 1, 1, 1, 1, 1,
-0.8127888, 1.648955, 0.7395553, 1, 1, 1, 1, 1,
-0.8117935, -0.6868643, -2.480196, 1, 1, 1, 1, 1,
-0.8099586, 0.666624, -1.472552, 1, 1, 1, 1, 1,
-0.806704, 0.2696931, -0.7959706, 0, 0, 1, 1, 1,
-0.7991898, 0.6172168, -0.8884394, 1, 0, 0, 1, 1,
-0.7910694, 1.736071, -0.6220024, 1, 0, 0, 1, 1,
-0.7870709, -0.8551095, -3.406515, 1, 0, 0, 1, 1,
-0.7792609, -1.777015, -2.517992, 1, 0, 0, 1, 1,
-0.7785493, 0.9132529, 0.3643661, 1, 0, 0, 1, 1,
-0.7780904, -0.2359204, -0.8200961, 0, 0, 0, 1, 1,
-0.7764686, 0.5774773, -1.556528, 0, 0, 0, 1, 1,
-0.7696518, 0.3212504, -3.584072, 0, 0, 0, 1, 1,
-0.7652835, -0.4199265, 0.9360071, 0, 0, 0, 1, 1,
-0.7646956, -1.480764, -2.961655, 0, 0, 0, 1, 1,
-0.761474, 0.4236782, -0.492889, 0, 0, 0, 1, 1,
-0.761172, 0.7105865, -0.9916843, 0, 0, 0, 1, 1,
-0.7597037, -0.8613954, -2.321903, 1, 1, 1, 1, 1,
-0.7525656, 0.6436118, -2.179766, 1, 1, 1, 1, 1,
-0.7521842, 0.1527853, -1.236741, 1, 1, 1, 1, 1,
-0.7520047, -0.3852807, -2.367205, 1, 1, 1, 1, 1,
-0.7497883, -1.522057, -1.701767, 1, 1, 1, 1, 1,
-0.7482702, 0.4988993, -2.423112, 1, 1, 1, 1, 1,
-0.744832, 0.03826673, -2.782509, 1, 1, 1, 1, 1,
-0.743572, -1.124719, -3.546003, 1, 1, 1, 1, 1,
-0.7383209, -0.473557, -1.344051, 1, 1, 1, 1, 1,
-0.7297447, -0.4904403, -4.744571, 1, 1, 1, 1, 1,
-0.7243489, -0.5749818, -4.228619, 1, 1, 1, 1, 1,
-0.7123441, 0.5897407, -0.6339453, 1, 1, 1, 1, 1,
-0.7118189, 2.027166, -0.6620062, 1, 1, 1, 1, 1,
-0.7086291, -0.4182608, -1.918618, 1, 1, 1, 1, 1,
-0.7059584, 0.6619512, -1.328288, 1, 1, 1, 1, 1,
-0.7056124, -0.4944351, -3.059713, 0, 0, 1, 1, 1,
-0.7029419, -3.595397, -4.233345, 1, 0, 0, 1, 1,
-0.7017851, 0.3390067, -0.1208217, 1, 0, 0, 1, 1,
-0.6997216, 0.3352745, -1.02301, 1, 0, 0, 1, 1,
-0.6902497, -1.64524, -2.364044, 1, 0, 0, 1, 1,
-0.690222, -1.469617, -3.023397, 1, 0, 0, 1, 1,
-0.6863789, 0.7010278, -1.364696, 0, 0, 0, 1, 1,
-0.6837547, 1.332233, 0.7705948, 0, 0, 0, 1, 1,
-0.6755973, 1.732185, -1.601153, 0, 0, 0, 1, 1,
-0.6576291, 0.4009306, -0.8171705, 0, 0, 0, 1, 1,
-0.6547501, -0.30788, -2.469278, 0, 0, 0, 1, 1,
-0.6511281, -0.4845434, -2.865566, 0, 0, 0, 1, 1,
-0.6507739, -0.002829872, -1.252638, 0, 0, 0, 1, 1,
-0.6506796, -0.1157919, -2.875758, 1, 1, 1, 1, 1,
-0.6506709, -0.4519676, -3.140196, 1, 1, 1, 1, 1,
-0.649626, 0.4441476, 0.3279383, 1, 1, 1, 1, 1,
-0.6489289, -0.6595982, -2.693898, 1, 1, 1, 1, 1,
-0.6430877, -0.2076941, -3.64638, 1, 1, 1, 1, 1,
-0.6402999, 0.1654057, 0.5952756, 1, 1, 1, 1, 1,
-0.6391798, 0.4026989, -2.333543, 1, 1, 1, 1, 1,
-0.6375892, -0.1040894, -3.474853, 1, 1, 1, 1, 1,
-0.6375347, -0.4287743, -3.580704, 1, 1, 1, 1, 1,
-0.6354984, 0.3815378, -2.256253, 1, 1, 1, 1, 1,
-0.6340805, -0.2549428, -0.4423347, 1, 1, 1, 1, 1,
-0.6323414, -0.8201708, -1.349339, 1, 1, 1, 1, 1,
-0.6307144, -0.6745895, -4.173682, 1, 1, 1, 1, 1,
-0.630568, 1.248458, -0.02849172, 1, 1, 1, 1, 1,
-0.6297262, 0.06590306, -1.865367, 1, 1, 1, 1, 1,
-0.6240181, -0.3213292, -2.511949, 0, 0, 1, 1, 1,
-0.6210701, -2.023477, -4.916516, 1, 0, 0, 1, 1,
-0.6133905, -0.4017263, -3.647549, 1, 0, 0, 1, 1,
-0.6074251, -2.192057, -3.478261, 1, 0, 0, 1, 1,
-0.6059184, -1.85682, -3.071268, 1, 0, 0, 1, 1,
-0.6054651, 0.2743248, -3.096266, 1, 0, 0, 1, 1,
-0.6009135, -1.054941, -1.546765, 0, 0, 0, 1, 1,
-0.5972611, -1.131045, -1.830944, 0, 0, 0, 1, 1,
-0.5968923, 0.2995208, -0.8795586, 0, 0, 0, 1, 1,
-0.5951035, -0.7543938, -2.165685, 0, 0, 0, 1, 1,
-0.590076, 0.558282, -2.902668, 0, 0, 0, 1, 1,
-0.5888612, 0.4598668, -1.7711, 0, 0, 0, 1, 1,
-0.5872204, 0.303587, 1.637807, 0, 0, 0, 1, 1,
-0.5849592, -0.1742187, -0.6998999, 1, 1, 1, 1, 1,
-0.5735265, -0.5140479, -0.7467099, 1, 1, 1, 1, 1,
-0.5560705, 0.2585392, -1.992173, 1, 1, 1, 1, 1,
-0.5533327, -0.4531116, -2.459426, 1, 1, 1, 1, 1,
-0.5515606, -0.172453, -1.692368, 1, 1, 1, 1, 1,
-0.5512027, -2.222249, -4.658071, 1, 1, 1, 1, 1,
-0.5486962, 1.94166, -0.3964791, 1, 1, 1, 1, 1,
-0.5481429, -0.9995923, -2.277712, 1, 1, 1, 1, 1,
-0.5429329, -0.5051896, -2.585664, 1, 1, 1, 1, 1,
-0.5417748, -0.1254261, -2.034004, 1, 1, 1, 1, 1,
-0.5413734, -0.3579264, -1.293725, 1, 1, 1, 1, 1,
-0.5410063, 0.6351417, -1.691693, 1, 1, 1, 1, 1,
-0.5409626, 1.525996, -2.41345, 1, 1, 1, 1, 1,
-0.5382606, -1.120177, -2.177251, 1, 1, 1, 1, 1,
-0.5374628, 0.09224889, -1.017865, 1, 1, 1, 1, 1,
-0.5348587, 1.688419, -0.2658405, 0, 0, 1, 1, 1,
-0.5302164, -0.5348631, -2.334739, 1, 0, 0, 1, 1,
-0.5273454, -0.2666171, -2.228194, 1, 0, 0, 1, 1,
-0.52615, 1.18334, -1.034206, 1, 0, 0, 1, 1,
-0.5254043, -0.5577506, -3.072088, 1, 0, 0, 1, 1,
-0.5225003, -0.8809909, -2.048064, 1, 0, 0, 1, 1,
-0.5153379, 0.07963341, -0.9653549, 0, 0, 0, 1, 1,
-0.5133407, 0.4276595, -2.871066, 0, 0, 0, 1, 1,
-0.5117359, 0.09270216, -0.07143978, 0, 0, 0, 1, 1,
-0.5096328, 0.5472785, -1.074785, 0, 0, 0, 1, 1,
-0.5065532, -0.5250477, -1.577917, 0, 0, 0, 1, 1,
-0.5026345, 0.3603841, -1.693967, 0, 0, 0, 1, 1,
-0.5017193, 0.4205072, -1.848006, 0, 0, 0, 1, 1,
-0.5008245, -0.5398884, -0.8430324, 1, 1, 1, 1, 1,
-0.4949417, 1.463488, -1.120062, 1, 1, 1, 1, 1,
-0.4918536, -0.8349668, -2.471643, 1, 1, 1, 1, 1,
-0.4916335, -1.775695, -4.147261, 1, 1, 1, 1, 1,
-0.4906552, 1.646968, 0.4317355, 1, 1, 1, 1, 1,
-0.488667, -2.423316, -1.551791, 1, 1, 1, 1, 1,
-0.4861618, 0.7093219, -1.225971, 1, 1, 1, 1, 1,
-0.4823831, -0.5602328, -1.666438, 1, 1, 1, 1, 1,
-0.4808232, -1.305804, -2.895532, 1, 1, 1, 1, 1,
-0.4798306, 0.2814235, -1.400187, 1, 1, 1, 1, 1,
-0.4784884, -1.32123, -3.715641, 1, 1, 1, 1, 1,
-0.4729905, 0.8256559, -0.09214826, 1, 1, 1, 1, 1,
-0.4705915, 0.6429965, -0.7344592, 1, 1, 1, 1, 1,
-0.4681902, -1.009103, -3.491127, 1, 1, 1, 1, 1,
-0.4666709, -1.162076, -2.23525, 1, 1, 1, 1, 1,
-0.4644285, -0.3582858, -1.589471, 0, 0, 1, 1, 1,
-0.4626108, 0.2053065, 0.9223318, 1, 0, 0, 1, 1,
-0.4622315, -0.4263679, -2.001749, 1, 0, 0, 1, 1,
-0.4597908, -2.260728, -2.884508, 1, 0, 0, 1, 1,
-0.4597407, 0.9947405, -1.206829, 1, 0, 0, 1, 1,
-0.4578341, -0.3114698, -0.6808081, 1, 0, 0, 1, 1,
-0.4571923, 1.191224, -0.1874333, 0, 0, 0, 1, 1,
-0.4498349, 0.8657271, -0.9170856, 0, 0, 0, 1, 1,
-0.4477745, 0.7663893, -0.4953104, 0, 0, 0, 1, 1,
-0.4384559, -1.195854, -4.156131, 0, 0, 0, 1, 1,
-0.4341161, -1.479051, -4.805804, 0, 0, 0, 1, 1,
-0.4314893, -2.111879, -2.159999, 0, 0, 0, 1, 1,
-0.4195742, 0.9553763, -1.532726, 0, 0, 0, 1, 1,
-0.4153418, 0.7868227, -0.02803145, 1, 1, 1, 1, 1,
-0.4142726, 0.9610681, -1.355066, 1, 1, 1, 1, 1,
-0.4081576, -0.3791666, -1.20018, 1, 1, 1, 1, 1,
-0.4077922, -2.093649, -4.544166, 1, 1, 1, 1, 1,
-0.4042169, 0.1574049, -1.629723, 1, 1, 1, 1, 1,
-0.3990073, 0.6439795, -1.057325, 1, 1, 1, 1, 1,
-0.3970037, -0.8449595, -0.5590912, 1, 1, 1, 1, 1,
-0.3956414, 0.2816406, -0.8970385, 1, 1, 1, 1, 1,
-0.3945776, -0.09928496, -1.477731, 1, 1, 1, 1, 1,
-0.3942443, -0.8823533, -2.581614, 1, 1, 1, 1, 1,
-0.3858415, -1.57303, -1.34962, 1, 1, 1, 1, 1,
-0.3824567, 0.1671251, -1.922142, 1, 1, 1, 1, 1,
-0.3804314, -1.285611, -2.978814, 1, 1, 1, 1, 1,
-0.3792003, -0.3262551, -1.779644, 1, 1, 1, 1, 1,
-0.3785584, 0.5917357, 0.3123955, 1, 1, 1, 1, 1,
-0.3762132, -0.3583038, -2.787032, 0, 0, 1, 1, 1,
-0.3723734, -0.1189605, -2.163487, 1, 0, 0, 1, 1,
-0.3700865, 0.5306093, -0.610818, 1, 0, 0, 1, 1,
-0.3699922, 1.0169, -0.08480294, 1, 0, 0, 1, 1,
-0.369726, 0.9146944, -0.1774149, 1, 0, 0, 1, 1,
-0.3684724, -2.30047, -2.734551, 1, 0, 0, 1, 1,
-0.3661819, -0.1383692, -1.244417, 0, 0, 0, 1, 1,
-0.3645412, 1.289513, -0.1411801, 0, 0, 0, 1, 1,
-0.3560643, 0.1977977, -2.676055, 0, 0, 0, 1, 1,
-0.3543705, 1.160139, 0.2854422, 0, 0, 0, 1, 1,
-0.3533603, 0.06103922, -0.2427289, 0, 0, 0, 1, 1,
-0.3450396, 0.6653349, -2.374609, 0, 0, 0, 1, 1,
-0.3449342, 0.5352203, 0.2840476, 0, 0, 0, 1, 1,
-0.3429066, 1.169817, -0.1838538, 1, 1, 1, 1, 1,
-0.3390326, -1.506352, -3.916793, 1, 1, 1, 1, 1,
-0.3378835, -0.173134, -2.898893, 1, 1, 1, 1, 1,
-0.3360135, 0.2998356, 0.21969, 1, 1, 1, 1, 1,
-0.33241, -0.7408978, -2.027619, 1, 1, 1, 1, 1,
-0.3280253, 0.219269, -1.051777, 1, 1, 1, 1, 1,
-0.3223441, 1.330417, 0.09729338, 1, 1, 1, 1, 1,
-0.3213282, -0.9181569, -3.124888, 1, 1, 1, 1, 1,
-0.3205995, -0.1663526, -2.335353, 1, 1, 1, 1, 1,
-0.3181755, 0.3182653, -0.7307824, 1, 1, 1, 1, 1,
-0.3172382, 0.7253404, 0.1442854, 1, 1, 1, 1, 1,
-0.314838, 1.338697, -0.61527, 1, 1, 1, 1, 1,
-0.3115248, 0.3453218, -1.429635, 1, 1, 1, 1, 1,
-0.3112224, 0.1358291, -1.395207, 1, 1, 1, 1, 1,
-0.3097082, -0.3319173, -2.104539, 1, 1, 1, 1, 1,
-0.2999141, 0.2933123, -0.9951147, 0, 0, 1, 1, 1,
-0.2992833, 0.5594584, -1.551842, 1, 0, 0, 1, 1,
-0.2990548, 1.95345, -0.5727715, 1, 0, 0, 1, 1,
-0.2945199, -1.029556, -0.717256, 1, 0, 0, 1, 1,
-0.2928673, -1.765913, -3.555634, 1, 0, 0, 1, 1,
-0.2918095, 0.6594571, -4.123289, 1, 0, 0, 1, 1,
-0.2906031, 0.03742392, -3.081738, 0, 0, 0, 1, 1,
-0.288623, -1.143079, -3.421497, 0, 0, 0, 1, 1,
-0.2752339, -1.293816, -2.688294, 0, 0, 0, 1, 1,
-0.270906, -0.1846405, -3.068129, 0, 0, 0, 1, 1,
-0.2664537, 0.7839907, -1.092867, 0, 0, 0, 1, 1,
-0.2651494, 1.33057, 0.8747587, 0, 0, 0, 1, 1,
-0.2630187, 0.09873555, -1.720748, 0, 0, 0, 1, 1,
-0.262513, -1.583017, -0.9894801, 1, 1, 1, 1, 1,
-0.2579926, -0.2159139, -3.333512, 1, 1, 1, 1, 1,
-0.2561884, -0.8477823, -3.639392, 1, 1, 1, 1, 1,
-0.2557395, 0.2840935, -1.784578, 1, 1, 1, 1, 1,
-0.2499765, 0.4606166, -0.442016, 1, 1, 1, 1, 1,
-0.2498422, 2.520317, -0.6884781, 1, 1, 1, 1, 1,
-0.2487582, -0.05891164, -2.116926, 1, 1, 1, 1, 1,
-0.2477537, -1.242323, -1.716675, 1, 1, 1, 1, 1,
-0.2444063, -0.7711698, -3.717268, 1, 1, 1, 1, 1,
-0.2437575, -1.129186, -0.5794771, 1, 1, 1, 1, 1,
-0.2386643, 0.7487761, -0.9060319, 1, 1, 1, 1, 1,
-0.2386089, -1.853211, -3.260946, 1, 1, 1, 1, 1,
-0.2375549, 0.2197113, -0.6618838, 1, 1, 1, 1, 1,
-0.2301928, -0.3805014, -2.244571, 1, 1, 1, 1, 1,
-0.2283511, 0.9566576, -1.007762, 1, 1, 1, 1, 1,
-0.2255138, 0.1063924, -0.02425219, 0, 0, 1, 1, 1,
-0.2246892, 0.6293722, -0.02875508, 1, 0, 0, 1, 1,
-0.2205841, -2.098378, -3.602656, 1, 0, 0, 1, 1,
-0.218371, 0.2863328, -0.2994601, 1, 0, 0, 1, 1,
-0.2138237, 0.4058923, 0.4395212, 1, 0, 0, 1, 1,
-0.2117826, -0.7885247, -4.538652, 1, 0, 0, 1, 1,
-0.2117439, 0.6096516, -0.3342474, 0, 0, 0, 1, 1,
-0.2117175, -0.5506029, -3.558019, 0, 0, 0, 1, 1,
-0.2081112, -0.1926287, -3.420504, 0, 0, 0, 1, 1,
-0.2067018, 2.59078, 0.6575816, 0, 0, 0, 1, 1,
-0.1983115, -0.5896325, -2.98929, 0, 0, 0, 1, 1,
-0.1978782, 0.1040316, -0.6762077, 0, 0, 0, 1, 1,
-0.1978361, -0.8109871, -3.218294, 0, 0, 0, 1, 1,
-0.1975847, 0.7417775, -0.593311, 1, 1, 1, 1, 1,
-0.1912166, -0.0594193, -4.811584, 1, 1, 1, 1, 1,
-0.1879917, 0.139806, -0.7283199, 1, 1, 1, 1, 1,
-0.1874402, 0.1435047, -1.386183, 1, 1, 1, 1, 1,
-0.1846619, 1.324113, 0.4642591, 1, 1, 1, 1, 1,
-0.1806106, 0.638195, 1.497327, 1, 1, 1, 1, 1,
-0.1786793, -0.04545944, -2.649542, 1, 1, 1, 1, 1,
-0.1687964, 1.904134, -0.6236067, 1, 1, 1, 1, 1,
-0.1593217, -1.749724, -3.617073, 1, 1, 1, 1, 1,
-0.1577924, 0.4839192, -1.269316, 1, 1, 1, 1, 1,
-0.1563813, -0.3002765, -3.501956, 1, 1, 1, 1, 1,
-0.1559004, -1.244354, -2.637494, 1, 1, 1, 1, 1,
-0.1520819, -0.5426058, -1.195214, 1, 1, 1, 1, 1,
-0.1504028, -0.5415841, -2.168689, 1, 1, 1, 1, 1,
-0.1394303, 0.3729542, 2.379729, 1, 1, 1, 1, 1,
-0.1378447, -0.8819895, -3.378079, 0, 0, 1, 1, 1,
-0.1373303, 0.1855256, -1.42645, 1, 0, 0, 1, 1,
-0.1370479, -1.640287, -2.543853, 1, 0, 0, 1, 1,
-0.1348976, -0.08546317, -1.23103, 1, 0, 0, 1, 1,
-0.134422, 0.6752489, 0.2517675, 1, 0, 0, 1, 1,
-0.1315325, 0.1613148, 1.688214, 1, 0, 0, 1, 1,
-0.1289069, 0.4365946, 1.421906, 0, 0, 0, 1, 1,
-0.1255453, 0.7282715, 1.014369, 0, 0, 0, 1, 1,
-0.1232179, -2.344054, -2.524713, 0, 0, 0, 1, 1,
-0.1195078, 1.120246, 1.373532, 0, 0, 0, 1, 1,
-0.1169836, 0.8859714, 0.5336947, 0, 0, 0, 1, 1,
-0.1169665, -0.2697364, -3.050915, 0, 0, 0, 1, 1,
-0.1151132, -0.4397692, -4.79141, 0, 0, 0, 1, 1,
-0.1124162, -1.883531, -4.260519, 1, 1, 1, 1, 1,
-0.1119229, 0.4045027, -0.5153426, 1, 1, 1, 1, 1,
-0.1079993, 0.4990523, 0.6055974, 1, 1, 1, 1, 1,
-0.1054607, -1.403785, -3.70826, 1, 1, 1, 1, 1,
-0.1007995, -0.3948195, -3.156905, 1, 1, 1, 1, 1,
-0.09970198, -0.3292048, -3.983787, 1, 1, 1, 1, 1,
-0.09616485, -1.025257, -4.224422, 1, 1, 1, 1, 1,
-0.08909285, 1.657018, -1.005056, 1, 1, 1, 1, 1,
-0.08908695, -0.5354431, -3.771778, 1, 1, 1, 1, 1,
-0.08684093, 1.053061, 0.1846967, 1, 1, 1, 1, 1,
-0.08563602, -0.2229141, -3.025919, 1, 1, 1, 1, 1,
-0.082559, 0.4899236, -0.03026917, 1, 1, 1, 1, 1,
-0.06534128, 0.7286783, -0.003055668, 1, 1, 1, 1, 1,
-0.06338882, -1.56451, -2.872231, 1, 1, 1, 1, 1,
-0.06295599, 0.1999113, -2.036832, 1, 1, 1, 1, 1,
-0.0624651, -0.1216872, -2.17106, 0, 0, 1, 1, 1,
-0.06241559, 0.00361747, -2.575058, 1, 0, 0, 1, 1,
-0.0621276, -1.434599, -2.329653, 1, 0, 0, 1, 1,
-0.06139182, 0.781163, 0.5746788, 1, 0, 0, 1, 1,
-0.05857214, 1.354413, 1.123442, 1, 0, 0, 1, 1,
-0.05528008, 2.465994, -0.3222467, 1, 0, 0, 1, 1,
-0.05499096, -2.490494, -2.752077, 0, 0, 0, 1, 1,
-0.05153996, 0.5897223, 0.9319019, 0, 0, 0, 1, 1,
-0.04918604, -1.204163, -2.026232, 0, 0, 0, 1, 1,
-0.04906793, 0.1374988, -1.556472, 0, 0, 0, 1, 1,
-0.04773611, 0.07892729, -2.704371, 0, 0, 0, 1, 1,
-0.04473988, -1.056363, -2.94742, 0, 0, 0, 1, 1,
-0.04349498, -0.09691758, -2.513968, 0, 0, 0, 1, 1,
-0.04044662, 0.8670617, -0.3400853, 1, 1, 1, 1, 1,
-0.03872803, -0.0005983013, -1.028018, 1, 1, 1, 1, 1,
-0.03716166, -0.4555001, -4.057693, 1, 1, 1, 1, 1,
-0.03672664, -0.4023438, -3.390089, 1, 1, 1, 1, 1,
-0.03584676, 0.1094254, -1.811966, 1, 1, 1, 1, 1,
-0.03237267, -0.9243837, -4.822971, 1, 1, 1, 1, 1,
-0.02849316, -0.9845042, -4.000504, 1, 1, 1, 1, 1,
-0.02848152, -0.05657351, -3.224425, 1, 1, 1, 1, 1,
-0.02761561, 0.4932641, -0.2695346, 1, 1, 1, 1, 1,
-0.0262604, -0.690753, -3.578234, 1, 1, 1, 1, 1,
-0.02460692, -1.113193, -3.773935, 1, 1, 1, 1, 1,
-0.02307064, -0.9896113, -3.087521, 1, 1, 1, 1, 1,
-0.0143885, -0.4283213, -2.181222, 1, 1, 1, 1, 1,
-0.01199698, -0.3795457, -3.471974, 1, 1, 1, 1, 1,
-0.00714944, -0.9995897, -3.163333, 1, 1, 1, 1, 1,
-0.001882554, 0.7328844, 0.0771765, 0, 0, 1, 1, 1,
-0.0004722981, 3.318505, -0.7389823, 1, 0, 0, 1, 1,
0.01006269, 0.3673729, -0.514208, 1, 0, 0, 1, 1,
0.01532783, -0.3859138, 3.223199, 1, 0, 0, 1, 1,
0.01585555, 1.163337, 0.3198207, 1, 0, 0, 1, 1,
0.01605267, -1.470015, 2.946043, 1, 0, 0, 1, 1,
0.0188837, 0.2598436, -0.4221553, 0, 0, 0, 1, 1,
0.02348826, 0.4305097, 1.192757, 0, 0, 0, 1, 1,
0.030903, -0.4433064, 2.458197, 0, 0, 0, 1, 1,
0.03107388, -2.067457, 1.826599, 0, 0, 0, 1, 1,
0.03266359, 0.8589249, -0.2633905, 0, 0, 0, 1, 1,
0.03849704, -1.218663, 6.19909, 0, 0, 0, 1, 1,
0.04155323, -1.31873, 2.019933, 0, 0, 0, 1, 1,
0.04274588, 0.7149453, 1.971507, 1, 1, 1, 1, 1,
0.0515161, 0.329671, -1.21901, 1, 1, 1, 1, 1,
0.05422853, 1.164245, -1.17355, 1, 1, 1, 1, 1,
0.05834198, 0.2359745, -0.9696046, 1, 1, 1, 1, 1,
0.06063518, 0.1970006, -1.140613, 1, 1, 1, 1, 1,
0.06112638, -1.241666, 3.008335, 1, 1, 1, 1, 1,
0.06177048, -0.711894, 6.100545, 1, 1, 1, 1, 1,
0.06350122, -0.02256949, 3.054881, 1, 1, 1, 1, 1,
0.06352033, -1.327431, 3.971747, 1, 1, 1, 1, 1,
0.0695943, -0.7599279, 3.866112, 1, 1, 1, 1, 1,
0.07506809, 0.9402952, 0.21368, 1, 1, 1, 1, 1,
0.07829446, 0.6363782, 0.6500835, 1, 1, 1, 1, 1,
0.08125336, 2.173985, -0.746774, 1, 1, 1, 1, 1,
0.08354895, 1.091697, -1.310509, 1, 1, 1, 1, 1,
0.08653463, -0.6478184, 1.640826, 1, 1, 1, 1, 1,
0.0873831, -1.005494, 3.137281, 0, 0, 1, 1, 1,
0.1055943, -0.6865607, 2.145833, 1, 0, 0, 1, 1,
0.1099313, 0.197715, 1.457888, 1, 0, 0, 1, 1,
0.1106398, 0.09449771, 2.96777, 1, 0, 0, 1, 1,
0.1118106, 0.3429939, -0.2131537, 1, 0, 0, 1, 1,
0.1122727, 0.7555832, 2.457448, 1, 0, 0, 1, 1,
0.1151254, -0.1996326, 2.18611, 0, 0, 0, 1, 1,
0.1154265, 0.252309, -1.981524, 0, 0, 0, 1, 1,
0.1161488, 0.9339571, -0.2819653, 0, 0, 0, 1, 1,
0.1163652, 1.039403, -0.8394488, 0, 0, 0, 1, 1,
0.1256585, -0.01466125, 1.666696, 0, 0, 0, 1, 1,
0.1262501, 0.7980264, -0.0624776, 0, 0, 0, 1, 1,
0.1308524, 0.3899693, 2.025408, 0, 0, 0, 1, 1,
0.1336112, -0.5604366, 3.796869, 1, 1, 1, 1, 1,
0.1355426, 0.7997879, 1.03729, 1, 1, 1, 1, 1,
0.1362008, -0.2884483, 1.054371, 1, 1, 1, 1, 1,
0.1416811, 0.6139953, 0.8221664, 1, 1, 1, 1, 1,
0.1461748, 0.8487856, 0.2859437, 1, 1, 1, 1, 1,
0.1491326, 0.3773716, 0.8601538, 1, 1, 1, 1, 1,
0.1504636, -0.2881429, 3.223454, 1, 1, 1, 1, 1,
0.1527464, 0.5810112, 0.4079895, 1, 1, 1, 1, 1,
0.1575218, 0.6741121, 1.085314, 1, 1, 1, 1, 1,
0.1591671, -0.2964792, 2.306723, 1, 1, 1, 1, 1,
0.1605038, -0.4489056, 1.536782, 1, 1, 1, 1, 1,
0.1622211, -0.001743222, 1.5367, 1, 1, 1, 1, 1,
0.1625237, -1.14806, 2.981525, 1, 1, 1, 1, 1,
0.165666, 0.3498169, 1.473381, 1, 1, 1, 1, 1,
0.1677237, 1.115553, 0.5252065, 1, 1, 1, 1, 1,
0.1691316, 0.6358873, -0.03321074, 0, 0, 1, 1, 1,
0.1746557, 0.419613, 0.6829446, 1, 0, 0, 1, 1,
0.1758404, 0.5871484, -2.266622, 1, 0, 0, 1, 1,
0.1762117, 0.9238293, 1.113689, 1, 0, 0, 1, 1,
0.1776324, -1.058586, 3.596967, 1, 0, 0, 1, 1,
0.1806692, 0.9991857, -0.04374478, 1, 0, 0, 1, 1,
0.1811827, 0.004422792, 0.8419734, 0, 0, 0, 1, 1,
0.187433, -1.544026, 2.65681, 0, 0, 0, 1, 1,
0.1890074, 0.2811528, -0.05279128, 0, 0, 0, 1, 1,
0.1895909, 0.3853885, 0.6699344, 0, 0, 0, 1, 1,
0.190237, -1.5037, 3.189679, 0, 0, 0, 1, 1,
0.1940479, -2.009722, 3.306232, 0, 0, 0, 1, 1,
0.1941249, 0.7782995, -0.5423558, 0, 0, 0, 1, 1,
0.194382, -0.7483153, 3.528728, 1, 1, 1, 1, 1,
0.1959244, 0.4551556, -0.477024, 1, 1, 1, 1, 1,
0.1971174, 0.07287145, 1.242388, 1, 1, 1, 1, 1,
0.1984968, 0.450548, 2.181971, 1, 1, 1, 1, 1,
0.1996254, -0.9839934, 2.135431, 1, 1, 1, 1, 1,
0.2038093, 0.4767617, 1.140615, 1, 1, 1, 1, 1,
0.2113094, 0.1813222, 0.5491623, 1, 1, 1, 1, 1,
0.2116971, 1.070232, -1.590539, 1, 1, 1, 1, 1,
0.2141143, 0.0566435, 0.1514009, 1, 1, 1, 1, 1,
0.2171882, 1.056707, 0.6922438, 1, 1, 1, 1, 1,
0.2216292, -1.097546, 3.07668, 1, 1, 1, 1, 1,
0.2231606, 0.8568619, -0.582517, 1, 1, 1, 1, 1,
0.2241382, -1.040127, 3.964681, 1, 1, 1, 1, 1,
0.2256987, -0.3682409, 3.753963, 1, 1, 1, 1, 1,
0.227355, -2.008079, 2.187727, 1, 1, 1, 1, 1,
0.2277307, 0.3223206, 2.338807, 0, 0, 1, 1, 1,
0.2297641, 0.6961735, 0.4856062, 1, 0, 0, 1, 1,
0.2301011, 0.1103739, -0.1813114, 1, 0, 0, 1, 1,
0.2324612, -0.2581341, 4.411571, 1, 0, 0, 1, 1,
0.2336139, 1.300208, 1.031387, 1, 0, 0, 1, 1,
0.2372975, -0.7441938, 4.723176, 1, 0, 0, 1, 1,
0.2430025, -0.7694691, 1.647375, 0, 0, 0, 1, 1,
0.2498799, -0.923399, 3.538161, 0, 0, 0, 1, 1,
0.2508425, 0.6934893, -0.2902575, 0, 0, 0, 1, 1,
0.2515258, 0.5160069, 1.13655, 0, 0, 0, 1, 1,
0.2519238, -0.8615777, 1.174293, 0, 0, 0, 1, 1,
0.2520565, -1.44088, 1.704873, 0, 0, 0, 1, 1,
0.2526291, -0.189041, 2.19011, 0, 0, 0, 1, 1,
0.2566001, -0.6861464, 3.165107, 1, 1, 1, 1, 1,
0.2575482, 1.5082, 0.2546792, 1, 1, 1, 1, 1,
0.2585456, 0.4742011, 0.6985527, 1, 1, 1, 1, 1,
0.2641924, 1.129944, -0.0596809, 1, 1, 1, 1, 1,
0.2642828, 0.6363603, 0.4506818, 1, 1, 1, 1, 1,
0.2692494, 0.09657719, 0.3369789, 1, 1, 1, 1, 1,
0.2711927, -0.2002582, 1.769412, 1, 1, 1, 1, 1,
0.2776696, 0.4767433, 0.9878303, 1, 1, 1, 1, 1,
0.2782905, 0.4736274, 1.34661, 1, 1, 1, 1, 1,
0.2797715, -0.3371975, 2.843697, 1, 1, 1, 1, 1,
0.2838848, -1.745943, 2.499881, 1, 1, 1, 1, 1,
0.2872251, -0.4586541, 3.181197, 1, 1, 1, 1, 1,
0.2877997, -1.110087, 2.502045, 1, 1, 1, 1, 1,
0.2909867, 1.721152, -2.1073, 1, 1, 1, 1, 1,
0.2923676, 1.312524, 0.3149676, 1, 1, 1, 1, 1,
0.292867, 1.083932, 0.2140732, 0, 0, 1, 1, 1,
0.2935721, 0.6421909, 2.611152, 1, 0, 0, 1, 1,
0.2953953, 1.876817, 0.06088049, 1, 0, 0, 1, 1,
0.2984103, -1.695598, 2.057552, 1, 0, 0, 1, 1,
0.3034787, -0.6711549, 3.927615, 1, 0, 0, 1, 1,
0.3095931, 0.504181, 2.304694, 1, 0, 0, 1, 1,
0.3117648, -0.2667175, 1.753943, 0, 0, 0, 1, 1,
0.3126625, -1.402731, 3.703961, 0, 0, 0, 1, 1,
0.313568, 1.591624, 0.3650185, 0, 0, 0, 1, 1,
0.3162166, -0.1980986, 1.512437, 0, 0, 0, 1, 1,
0.3181229, 0.8014037, -0.6915642, 0, 0, 0, 1, 1,
0.3190885, -2.00084, 3.803122, 0, 0, 0, 1, 1,
0.3210278, 2.50536, 0.7196749, 0, 0, 0, 1, 1,
0.3264469, 1.592786, -0.8287898, 1, 1, 1, 1, 1,
0.3306955, 0.7177472, 2.914431, 1, 1, 1, 1, 1,
0.3314874, -0.2307564, 3.06646, 1, 1, 1, 1, 1,
0.3319234, 0.4631929, 1.419956, 1, 1, 1, 1, 1,
0.3404452, -0.9334156, 3.42869, 1, 1, 1, 1, 1,
0.3404572, -2.067016, 1.869695, 1, 1, 1, 1, 1,
0.3434429, 0.9042093, 1.505389, 1, 1, 1, 1, 1,
0.347836, 1.077867, -0.2460898, 1, 1, 1, 1, 1,
0.3499184, 0.529925, 0.6768077, 1, 1, 1, 1, 1,
0.3505159, -1.073798, 0.6604121, 1, 1, 1, 1, 1,
0.3509613, -0.4957456, 1.705907, 1, 1, 1, 1, 1,
0.3519875, -1.415979, 1.62736, 1, 1, 1, 1, 1,
0.352022, -0.9932828, 3.782372, 1, 1, 1, 1, 1,
0.3541858, 0.6138611, 1.072837, 1, 1, 1, 1, 1,
0.3554654, 1.974801, -1.633566, 1, 1, 1, 1, 1,
0.365677, 1.127827, 0.5496466, 0, 0, 1, 1, 1,
0.3657234, 1.644852, 1.331592, 1, 0, 0, 1, 1,
0.3667305, -0.6803899, 2.291922, 1, 0, 0, 1, 1,
0.3677925, -1.438357, 3.669046, 1, 0, 0, 1, 1,
0.367878, -0.4833259, 3.283471, 1, 0, 0, 1, 1,
0.3700857, -0.637983, 2.1342, 1, 0, 0, 1, 1,
0.3703369, 0.188105, 3.270602, 0, 0, 0, 1, 1,
0.3715001, 0.474574, 0.550054, 0, 0, 0, 1, 1,
0.372367, -1.461771, 2.664472, 0, 0, 0, 1, 1,
0.3732256, -0.01582147, 0.8530673, 0, 0, 0, 1, 1,
0.3814468, 0.3673055, 0.5471662, 0, 0, 0, 1, 1,
0.3848011, 0.008291967, 2.580639, 0, 0, 0, 1, 1,
0.3848157, 2.108356, 1.097261, 0, 0, 0, 1, 1,
0.386772, -0.4507679, 2.224962, 1, 1, 1, 1, 1,
0.3874007, -1.042949, 3.345488, 1, 1, 1, 1, 1,
0.3890407, -0.4336253, 1.406233, 1, 1, 1, 1, 1,
0.3898757, -0.1578194, 2.627131, 1, 1, 1, 1, 1,
0.3925504, -0.1441793, 2.647408, 1, 1, 1, 1, 1,
0.3945053, -1.583132, 2.885348, 1, 1, 1, 1, 1,
0.3949957, -0.744294, 2.945582, 1, 1, 1, 1, 1,
0.3987602, -1.106215, 5.288752, 1, 1, 1, 1, 1,
0.4004106, 0.6957142, 0.0337722, 1, 1, 1, 1, 1,
0.4012606, 0.1139797, 0.7238662, 1, 1, 1, 1, 1,
0.411476, 0.6996863, 0.9380603, 1, 1, 1, 1, 1,
0.4132995, 0.3718438, -0.05391773, 1, 1, 1, 1, 1,
0.4151079, 0.1432193, 1.512681, 1, 1, 1, 1, 1,
0.4158626, 0.4115027, -0.05563665, 1, 1, 1, 1, 1,
0.4162371, -1.366575, 2.820707, 1, 1, 1, 1, 1,
0.416279, -1.476185, 2.887877, 0, 0, 1, 1, 1,
0.4202834, 1.034027, -1.073716, 1, 0, 0, 1, 1,
0.4244504, 0.6992034, -0.8365805, 1, 0, 0, 1, 1,
0.4253881, 1.559384, 1.198986, 1, 0, 0, 1, 1,
0.427267, 0.9093249, -1.391868, 1, 0, 0, 1, 1,
0.4279861, 0.446602, 0.5172287, 1, 0, 0, 1, 1,
0.430016, 0.2046168, 2.638084, 0, 0, 0, 1, 1,
0.4316196, -1.78665, 2.712226, 0, 0, 0, 1, 1,
0.4335839, 0.09793839, 1.41948, 0, 0, 0, 1, 1,
0.4347176, -0.8275452, 1.94503, 0, 0, 0, 1, 1,
0.4350331, 1.171073, -0.6588569, 0, 0, 0, 1, 1,
0.4399772, -0.5332457, 3.731814, 0, 0, 0, 1, 1,
0.4414783, 0.4812331, 0.9511941, 0, 0, 0, 1, 1,
0.4417422, 0.5089629, -0.1246644, 1, 1, 1, 1, 1,
0.44228, -0.3011853, 2.372524, 1, 1, 1, 1, 1,
0.4472742, 1.843849, -0.2754428, 1, 1, 1, 1, 1,
0.4530583, 0.9829267, -0.3907989, 1, 1, 1, 1, 1,
0.4534938, 0.425083, 1.348282, 1, 1, 1, 1, 1,
0.4599115, -0.3806308, -0.1000785, 1, 1, 1, 1, 1,
0.4613483, 1.271051, 0.7484462, 1, 1, 1, 1, 1,
0.4663903, -0.4201338, 2.405994, 1, 1, 1, 1, 1,
0.4689791, 0.1572656, 2.151188, 1, 1, 1, 1, 1,
0.4694204, 0.4925247, 1.504867, 1, 1, 1, 1, 1,
0.472992, -0.6033414, 3.383388, 1, 1, 1, 1, 1,
0.474296, -1.088016, 3.468958, 1, 1, 1, 1, 1,
0.4847434, 0.9229157, 1.72194, 1, 1, 1, 1, 1,
0.4861347, -0.07211715, 1.41302, 1, 1, 1, 1, 1,
0.4880154, 0.04465787, 2.473501, 1, 1, 1, 1, 1,
0.4965625, 0.3726733, -0.02234446, 0, 0, 1, 1, 1,
0.4994839, -1.267315, 3.267574, 1, 0, 0, 1, 1,
0.4995954, 1.267675, -0.8738888, 1, 0, 0, 1, 1,
0.5015921, 1.18479, 0.2677266, 1, 0, 0, 1, 1,
0.5046026, -0.4122422, 2.166329, 1, 0, 0, 1, 1,
0.5078773, -1.080877, 1.059424, 1, 0, 0, 1, 1,
0.5155568, -1.266082, 2.230285, 0, 0, 0, 1, 1,
0.5179337, 0.26693, -1.781728, 0, 0, 0, 1, 1,
0.5181759, -2.116483, 2.62239, 0, 0, 0, 1, 1,
0.5223418, -0.5200517, 2.815123, 0, 0, 0, 1, 1,
0.5231314, -0.2455853, 2.946557, 0, 0, 0, 1, 1,
0.5280933, 0.3497373, 0.8530844, 0, 0, 0, 1, 1,
0.530332, -0.7032217, 1.182327, 0, 0, 0, 1, 1,
0.5328349, -0.2148214, 2.093675, 1, 1, 1, 1, 1,
0.5328615, 1.044022, 1.540313, 1, 1, 1, 1, 1,
0.5380187, 0.07101492, 1.846992, 1, 1, 1, 1, 1,
0.5383601, 1.805236, -1.232948, 1, 1, 1, 1, 1,
0.5392413, -0.4179304, 2.711684, 1, 1, 1, 1, 1,
0.545527, -0.8477227, -0.0740314, 1, 1, 1, 1, 1,
0.5465505, 0.8751971, 0.4352729, 1, 1, 1, 1, 1,
0.5491162, -1.038275, 0.6372911, 1, 1, 1, 1, 1,
0.5500284, 1.069168, -0.193968, 1, 1, 1, 1, 1,
0.5599302, -0.06531812, -0.02235883, 1, 1, 1, 1, 1,
0.5638533, 1.507571, -0.412112, 1, 1, 1, 1, 1,
0.5650886, 0.8274308, -0.1195138, 1, 1, 1, 1, 1,
0.5701383, 0.02112917, 1.070715, 1, 1, 1, 1, 1,
0.5729737, 0.7904925, 1.120719, 1, 1, 1, 1, 1,
0.5768579, -1.214075, 3.348262, 1, 1, 1, 1, 1,
0.5772194, -0.7193157, 2.708978, 0, 0, 1, 1, 1,
0.5804495, -0.2521981, 1.411618, 1, 0, 0, 1, 1,
0.5857194, -0.6411943, 2.177172, 1, 0, 0, 1, 1,
0.5880772, 0.5446438, 0.8113662, 1, 0, 0, 1, 1,
0.5891247, -0.4735148, 1.184508, 1, 0, 0, 1, 1,
0.5896468, 1.221919, -0.5243434, 1, 0, 0, 1, 1,
0.6006617, 0.1187952, 2.888211, 0, 0, 0, 1, 1,
0.6022706, 0.3067296, 2.406528, 0, 0, 0, 1, 1,
0.6105854, 0.9430875, -0.2544909, 0, 0, 0, 1, 1,
0.6132843, -2.146147, 2.393932, 0, 0, 0, 1, 1,
0.6137675, -0.2715119, 1.235335, 0, 0, 0, 1, 1,
0.6156671, -0.9709911, 1.51775, 0, 0, 0, 1, 1,
0.6178077, 0.7329172, 1.319175, 0, 0, 0, 1, 1,
0.6265205, -0.1769924, 0.6963366, 1, 1, 1, 1, 1,
0.6271375, 0.1024512, 1.838174, 1, 1, 1, 1, 1,
0.6282433, 0.8759729, -0.01419539, 1, 1, 1, 1, 1,
0.6293023, 1.459984, 0.592324, 1, 1, 1, 1, 1,
0.6301026, -0.9995255, 1.248703, 1, 1, 1, 1, 1,
0.637556, -1.490891, 0.1801322, 1, 1, 1, 1, 1,
0.638001, 0.4405275, -0.6807159, 1, 1, 1, 1, 1,
0.6498253, 0.2205739, 1.983997, 1, 1, 1, 1, 1,
0.6500386, -0.173606, 2.175928, 1, 1, 1, 1, 1,
0.6537594, -1.273591, 3.552698, 1, 1, 1, 1, 1,
0.6546465, 1.547006, 1.768671, 1, 1, 1, 1, 1,
0.6578044, -0.8675237, 3.258823, 1, 1, 1, 1, 1,
0.6602585, -2.002339, 3.876998, 1, 1, 1, 1, 1,
0.6617242, 1.468011, 0.885222, 1, 1, 1, 1, 1,
0.665983, -0.1124468, 2.61671, 1, 1, 1, 1, 1,
0.6667936, -0.1892655, 2.077266, 0, 0, 1, 1, 1,
0.6669011, 0.2160361, -0.47995, 1, 0, 0, 1, 1,
0.6672503, -0.4308132, 1.681503, 1, 0, 0, 1, 1,
0.6690292, -0.4269188, 2.356156, 1, 0, 0, 1, 1,
0.6727465, -1.000053, 2.909218, 1, 0, 0, 1, 1,
0.6756133, -0.3663077, 2.911812, 1, 0, 0, 1, 1,
0.6772097, -0.5688899, 1.621357, 0, 0, 0, 1, 1,
0.6777304, -0.8195624, 2.001568, 0, 0, 0, 1, 1,
0.6781736, 0.1687233, 2.761847, 0, 0, 0, 1, 1,
0.678602, 0.04374811, 2.188464, 0, 0, 0, 1, 1,
0.6793108, 0.469041, 0.1847633, 0, 0, 0, 1, 1,
0.6818172, 0.01028228, 4.2315, 0, 0, 0, 1, 1,
0.6873699, -1.5166, 2.152179, 0, 0, 0, 1, 1,
0.6961779, -0.3450343, -0.3319421, 1, 1, 1, 1, 1,
0.6965254, -1.380883, 3.122771, 1, 1, 1, 1, 1,
0.6966199, 1.108539, 1.021836, 1, 1, 1, 1, 1,
0.6972825, 0.3034057, -1.041842, 1, 1, 1, 1, 1,
0.7026737, 0.2919262, 2.10587, 1, 1, 1, 1, 1,
0.7031522, 0.2522482, 2.632142, 1, 1, 1, 1, 1,
0.7044595, 1.311577, 0.2111976, 1, 1, 1, 1, 1,
0.7058566, -0.3340102, 1.987933, 1, 1, 1, 1, 1,
0.7077211, -0.4696585, 1.938171, 1, 1, 1, 1, 1,
0.7146524, -0.6089587, 2.262503, 1, 1, 1, 1, 1,
0.7149026, 0.3204171, -0.9947589, 1, 1, 1, 1, 1,
0.7150214, 0.04717103, 0.7812224, 1, 1, 1, 1, 1,
0.7169753, -0.3133751, 0.597011, 1, 1, 1, 1, 1,
0.7221365, 1.034521, -1.549794, 1, 1, 1, 1, 1,
0.7235488, -0.0455005, -0.7644868, 1, 1, 1, 1, 1,
0.725694, 0.8494819, 1.072868, 0, 0, 1, 1, 1,
0.7352269, 1.872532, 0.09009802, 1, 0, 0, 1, 1,
0.7424616, -0.005595273, 1.027684, 1, 0, 0, 1, 1,
0.7425776, -0.85331, 3.710447, 1, 0, 0, 1, 1,
0.7441352, 1.012023, 1.551035, 1, 0, 0, 1, 1,
0.7462015, -0.3744346, 1.112286, 1, 0, 0, 1, 1,
0.7531992, -0.9919843, -0.6651075, 0, 0, 0, 1, 1,
0.7563925, 0.903171, 1.04703, 0, 0, 0, 1, 1,
0.7637165, 0.04164112, 1.315047, 0, 0, 0, 1, 1,
0.7648201, 0.5351992, -0.01704882, 0, 0, 0, 1, 1,
0.7660736, 0.6808558, 1.229705, 0, 0, 0, 1, 1,
0.7691328, -1.489133, 1.806854, 0, 0, 0, 1, 1,
0.784476, -1.148292, 1.343277, 0, 0, 0, 1, 1,
0.7875164, -2.773808, 2.731762, 1, 1, 1, 1, 1,
0.7918053, 0.2855444, 0.2838852, 1, 1, 1, 1, 1,
0.7945918, -0.6551208, 1.472151, 1, 1, 1, 1, 1,
0.8012841, 1.091818, -0.1290538, 1, 1, 1, 1, 1,
0.8035389, 1.769595, 0.9503071, 1, 1, 1, 1, 1,
0.8052888, 1.066546, 0.7829629, 1, 1, 1, 1, 1,
0.8082185, -0.3215693, 2.054811, 1, 1, 1, 1, 1,
0.8117548, -1.565548, 2.78417, 1, 1, 1, 1, 1,
0.8171334, -1.441169, 1.583538, 1, 1, 1, 1, 1,
0.8183864, 0.8841063, 1.479245, 1, 1, 1, 1, 1,
0.8279262, -0.9487122, 2.840274, 1, 1, 1, 1, 1,
0.8342091, -0.3791352, 2.062598, 1, 1, 1, 1, 1,
0.8400595, -0.7363214, 1.267429, 1, 1, 1, 1, 1,
0.843063, 0.981882, 1.521517, 1, 1, 1, 1, 1,
0.8451344, -1.033278, 1.797233, 1, 1, 1, 1, 1,
0.8454924, -1.404634, 2.261469, 0, 0, 1, 1, 1,
0.8469177, -0.7405789, 3.719286, 1, 0, 0, 1, 1,
0.8476003, 0.02929614, 1.521906, 1, 0, 0, 1, 1,
0.8529606, 0.7884725, 0.5683371, 1, 0, 0, 1, 1,
0.8542114, 0.69009, 1.124448, 1, 0, 0, 1, 1,
0.8566098, -0.4314532, 1.935148, 1, 0, 0, 1, 1,
0.8572096, 0.4455515, 0.2289481, 0, 0, 0, 1, 1,
0.8592795, -0.5360649, 2.570316, 0, 0, 0, 1, 1,
0.8680388, 0.6278569, 0.06848167, 0, 0, 0, 1, 1,
0.8752567, 0.8560894, 0.4330862, 0, 0, 0, 1, 1,
0.8785893, 1.298388, 1.126333, 0, 0, 0, 1, 1,
0.8808033, 0.220954, -0.1646067, 0, 0, 0, 1, 1,
0.8844835, -0.3809789, 1.024588, 0, 0, 0, 1, 1,
0.8905138, 0.4101425, 1.88967, 1, 1, 1, 1, 1,
0.893867, -0.4862447, 2.390471, 1, 1, 1, 1, 1,
0.9091524, -2.38042, 2.755817, 1, 1, 1, 1, 1,
0.9217529, 1.533968, -0.3196942, 1, 1, 1, 1, 1,
0.9247508, -0.3006151, 0.611552, 1, 1, 1, 1, 1,
0.926264, 2.9192, -1.673211, 1, 1, 1, 1, 1,
0.9296829, -0.3320372, 1.302017, 1, 1, 1, 1, 1,
0.9357992, -0.1754369, 0.5139902, 1, 1, 1, 1, 1,
0.9360237, -0.03596098, 0.5946404, 1, 1, 1, 1, 1,
0.9405795, -0.3600266, 2.741425, 1, 1, 1, 1, 1,
0.94139, 1.701151, 0.535031, 1, 1, 1, 1, 1,
0.9415625, 0.2273318, 1.215797, 1, 1, 1, 1, 1,
0.949331, 0.5178875, 2.409876, 1, 1, 1, 1, 1,
0.9516532, 0.3928546, -0.1784817, 1, 1, 1, 1, 1,
0.9547437, -0.7521726, 1.340091, 1, 1, 1, 1, 1,
0.9561525, 0.7605966, -0.642296, 0, 0, 1, 1, 1,
0.9660285, 1.040304, 0.7578061, 1, 0, 0, 1, 1,
0.9695622, 1.628306, 0.6434959, 1, 0, 0, 1, 1,
0.9853022, 0.6626089, 0.6134502, 1, 0, 0, 1, 1,
1.006997, -0.9214556, 1.309457, 1, 0, 0, 1, 1,
1.007693, -0.3894727, 1.07316, 1, 0, 0, 1, 1,
1.008736, 1.601869, -0.4404001, 0, 0, 0, 1, 1,
1.021158, 0.07020822, 0.525801, 0, 0, 0, 1, 1,
1.022844, -0.9274347, 3.160995, 0, 0, 0, 1, 1,
1.026999, 1.115203, 0.7519852, 0, 0, 0, 1, 1,
1.030451, -0.7635241, 3.618626, 0, 0, 0, 1, 1,
1.038659, 0.2342406, -0.7196359, 0, 0, 0, 1, 1,
1.038765, 1.124652, -0.2627043, 0, 0, 0, 1, 1,
1.039003, -0.662537, 1.274329, 1, 1, 1, 1, 1,
1.041406, -0.6820725, 2.703092, 1, 1, 1, 1, 1,
1.045771, 1.843732, 0.6574052, 1, 1, 1, 1, 1,
1.047625, 0.9172083, 1.718651, 1, 1, 1, 1, 1,
1.051343, -1.058585, 1.859045, 1, 1, 1, 1, 1,
1.052468, 0.6451665, 1.95219, 1, 1, 1, 1, 1,
1.054588, -1.319236, 4.15066, 1, 1, 1, 1, 1,
1.069894, 0.4458508, 2.057872, 1, 1, 1, 1, 1,
1.070106, -0.2300408, 2.677618, 1, 1, 1, 1, 1,
1.071887, -0.4082903, 1.363559, 1, 1, 1, 1, 1,
1.073376, 2.661737, 1.31554, 1, 1, 1, 1, 1,
1.07389, 0.4963818, 0.3344056, 1, 1, 1, 1, 1,
1.077126, 1.384861, 0.4748909, 1, 1, 1, 1, 1,
1.08726, 0.2585299, 2.554416, 1, 1, 1, 1, 1,
1.093419, 1.589831, -1.066413, 1, 1, 1, 1, 1,
1.093755, 0.574196, -0.2577721, 0, 0, 1, 1, 1,
1.098056, 0.04937457, 3.452039, 1, 0, 0, 1, 1,
1.100694, 0.1734589, 0.6733255, 1, 0, 0, 1, 1,
1.101821, 1.686947, 1.808753, 1, 0, 0, 1, 1,
1.104536, -1.167949, 2.327662, 1, 0, 0, 1, 1,
1.105144, -0.3649281, 0.448852, 1, 0, 0, 1, 1,
1.115274, 0.7216126, 1.627901, 0, 0, 0, 1, 1,
1.118316, -0.181841, 3.597582, 0, 0, 0, 1, 1,
1.120648, 0.3588681, 1.837693, 0, 0, 0, 1, 1,
1.122248, -0.883237, 2.328581, 0, 0, 0, 1, 1,
1.123739, 1.999494, 1.273468, 0, 0, 0, 1, 1,
1.126777, 0.5931569, 0.6823336, 0, 0, 0, 1, 1,
1.130599, 0.5968294, 1.876001, 0, 0, 0, 1, 1,
1.135363, 0.9336557, 0.6864839, 1, 1, 1, 1, 1,
1.136257, 1.272844, 0.3460405, 1, 1, 1, 1, 1,
1.136297, -0.7978516, 2.795439, 1, 1, 1, 1, 1,
1.13748, -0.8165419, 3.574174, 1, 1, 1, 1, 1,
1.142637, -0.6774166, 1.065069, 1, 1, 1, 1, 1,
1.147763, -0.4591802, -0.9770129, 1, 1, 1, 1, 1,
1.160133, 0.5401893, 2.146462, 1, 1, 1, 1, 1,
1.163553, -1.003917, 3.865522, 1, 1, 1, 1, 1,
1.179714, -1.649989, 1.776519, 1, 1, 1, 1, 1,
1.181149, -0.168223, 2.59165, 1, 1, 1, 1, 1,
1.184448, -0.330818, 0.6941589, 1, 1, 1, 1, 1,
1.184649, 0.7009562, 2.683688, 1, 1, 1, 1, 1,
1.19188, 0.3053254, 1.648272, 1, 1, 1, 1, 1,
1.193263, -0.7698203, 1.720931, 1, 1, 1, 1, 1,
1.195291, -0.9531858, 2.064511, 1, 1, 1, 1, 1,
1.195357, -0.4920783, 3.018035, 0, 0, 1, 1, 1,
1.199733, -1.247516, 1.924769, 1, 0, 0, 1, 1,
1.224474, 0.5015002, 1.118275, 1, 0, 0, 1, 1,
1.224666, 0.7241537, 0.8959174, 1, 0, 0, 1, 1,
1.231121, -0.3639129, 2.431347, 1, 0, 0, 1, 1,
1.235773, -1.313597, 2.100401, 1, 0, 0, 1, 1,
1.2477, -0.725216, 0.6505165, 0, 0, 0, 1, 1,
1.24784, -0.3092272, 1.358254, 0, 0, 0, 1, 1,
1.254673, 0.263865, 1.89581, 0, 0, 0, 1, 1,
1.257464, -1.290526, 3.456288, 0, 0, 0, 1, 1,
1.262843, 0.6097664, 0.3700937, 0, 0, 0, 1, 1,
1.263727, -0.6007658, 1.131212, 0, 0, 0, 1, 1,
1.276507, 0.2727273, 0.7247993, 0, 0, 0, 1, 1,
1.27811, -0.9826732, 4.698914, 1, 1, 1, 1, 1,
1.29218, 0.003051143, 0.9522682, 1, 1, 1, 1, 1,
1.311724, 1.869147, -0.9234, 1, 1, 1, 1, 1,
1.312225, -1.256943, 1.840562, 1, 1, 1, 1, 1,
1.317623, -1.739509, 2.497219, 1, 1, 1, 1, 1,
1.330623, 0.5987593, 3.274313, 1, 1, 1, 1, 1,
1.345089, -0.1033224, 2.653996, 1, 1, 1, 1, 1,
1.356933, 0.6874821, 1.157205, 1, 1, 1, 1, 1,
1.359407, -1.471286, 3.069953, 1, 1, 1, 1, 1,
1.362271, -0.8512352, 3.796344, 1, 1, 1, 1, 1,
1.383794, 1.321718, 0.7332045, 1, 1, 1, 1, 1,
1.385837, -0.07860736, 2.238394, 1, 1, 1, 1, 1,
1.389207, -0.3115076, 3.279998, 1, 1, 1, 1, 1,
1.392752, -0.6103879, 1.835262, 1, 1, 1, 1, 1,
1.395545, 0.878833, 1.538135, 1, 1, 1, 1, 1,
1.398594, -0.0528457, 1.721565, 0, 0, 1, 1, 1,
1.399211, -0.0002567899, 1.38508, 1, 0, 0, 1, 1,
1.402132, 0.6437802, 0.9631577, 1, 0, 0, 1, 1,
1.404688, 0.8965589, 1.417031, 1, 0, 0, 1, 1,
1.40684, -0.3139728, -1.765177, 1, 0, 0, 1, 1,
1.407223, 0.4065696, 3.061939, 1, 0, 0, 1, 1,
1.410851, 0.4380527, 0.7102771, 0, 0, 0, 1, 1,
1.414152, -0.1424751, 0.7457164, 0, 0, 0, 1, 1,
1.417871, 0.3078438, 1.626576, 0, 0, 0, 1, 1,
1.419225, 0.05560631, 0.9934521, 0, 0, 0, 1, 1,
1.42574, -2.469832, 1.227577, 0, 0, 0, 1, 1,
1.430441, 0.7294889, 0.9681905, 0, 0, 0, 1, 1,
1.430907, 1.613818, 0.5888558, 0, 0, 0, 1, 1,
1.439556, -0.258286, 2.378529, 1, 1, 1, 1, 1,
1.4524, 1.010034, 1.12743, 1, 1, 1, 1, 1,
1.460396, 0.001178858, 1.323625, 1, 1, 1, 1, 1,
1.469775, -1.901701, 3.332747, 1, 1, 1, 1, 1,
1.492241, 0.5094116, 1.961954, 1, 1, 1, 1, 1,
1.493842, 1.799362, -1.531551, 1, 1, 1, 1, 1,
1.504896, -0.3898838, 3.089282, 1, 1, 1, 1, 1,
1.518642, 0.4640956, 0.3467073, 1, 1, 1, 1, 1,
1.534646, -1.018449, 1.966376, 1, 1, 1, 1, 1,
1.572056, -0.2383, 1.383788, 1, 1, 1, 1, 1,
1.573817, 0.9668605, -0.4587667, 1, 1, 1, 1, 1,
1.574926, 0.2611243, 1.810424, 1, 1, 1, 1, 1,
1.577672, -0.2940839, 2.462786, 1, 1, 1, 1, 1,
1.581358, -0.08950459, 1.776737, 1, 1, 1, 1, 1,
1.61103, 0.4438598, 3.236686, 1, 1, 1, 1, 1,
1.613931, -0.1813228, 1.915414, 0, 0, 1, 1, 1,
1.614262, 0.932642, -0.716342, 1, 0, 0, 1, 1,
1.626018, -1.071883, 2.579732, 1, 0, 0, 1, 1,
1.634907, 1.860597, 0.6270286, 1, 0, 0, 1, 1,
1.647303, -2.621357, 2.77718, 1, 0, 0, 1, 1,
1.679158, 0.2248722, 1.923015, 1, 0, 0, 1, 1,
1.697273, -1.439119, 1.688881, 0, 0, 0, 1, 1,
1.706285, -0.4991073, 2.108714, 0, 0, 0, 1, 1,
1.750133, -0.7468531, 2.121355, 0, 0, 0, 1, 1,
1.753852, 0.1123339, 1.192599, 0, 0, 0, 1, 1,
1.765402, 0.5326913, 2.7688, 0, 0, 0, 1, 1,
1.766047, 1.177327, 1.586687, 0, 0, 0, 1, 1,
1.787308, -1.057998, 2.170864, 0, 0, 0, 1, 1,
1.798779, -1.912491, 1.477607, 1, 1, 1, 1, 1,
1.820679, 1.229987, 0.7558701, 1, 1, 1, 1, 1,
1.824398, 0.2272072, 1.039253, 1, 1, 1, 1, 1,
1.838877, 0.5231942, 2.451559, 1, 1, 1, 1, 1,
1.846473, -0.153028, 3.113629, 1, 1, 1, 1, 1,
1.859146, -0.6742159, 3.045631, 1, 1, 1, 1, 1,
1.872713, 0.1107494, 2.447837, 1, 1, 1, 1, 1,
1.895272, -1.545337, 3.658998, 1, 1, 1, 1, 1,
1.898486, -0.5635394, 2.331564, 1, 1, 1, 1, 1,
1.898591, -0.4678485, 1.618985, 1, 1, 1, 1, 1,
1.94527, 0.6247142, 2.208671, 1, 1, 1, 1, 1,
1.945881, 1.135229, 2.345686, 1, 1, 1, 1, 1,
1.969474, -0.1617948, 2.283884, 1, 1, 1, 1, 1,
1.970948, 1.659204, 1.454639, 1, 1, 1, 1, 1,
1.99367, 0.2665106, 1.583007, 1, 1, 1, 1, 1,
2.008899, 0.5645978, 2.553281, 0, 0, 1, 1, 1,
2.050575, 0.4060286, 2.123285, 1, 0, 0, 1, 1,
2.053998, -0.2975739, 3.021408, 1, 0, 0, 1, 1,
2.071716, -0.5219747, 1.665244, 1, 0, 0, 1, 1,
2.135493, 1.451236, 1.826429, 1, 0, 0, 1, 1,
2.14523, 1.765539, 1.196998, 1, 0, 0, 1, 1,
2.150503, -0.2152133, 1.228251, 0, 0, 0, 1, 1,
2.15299, 1.26803, -0.1621538, 0, 0, 0, 1, 1,
2.195908, 1.230545, 1.694117, 0, 0, 0, 1, 1,
2.286291, 1.764323, 0.9723033, 0, 0, 0, 1, 1,
2.302317, 0.4409306, 1.541882, 0, 0, 0, 1, 1,
2.34275, -0.5210975, 1.968718, 0, 0, 0, 1, 1,
2.344169, -0.6913611, 1.841852, 0, 0, 0, 1, 1,
2.344866, -1.178725, 2.658831, 1, 1, 1, 1, 1,
2.38733, 0.7356591, 2.380745, 1, 1, 1, 1, 1,
2.531757, -0.5054944, 1.784173, 1, 1, 1, 1, 1,
2.559869, -0.6072029, 0.8392441, 1, 1, 1, 1, 1,
2.777276, 0.9381817, 1.457746, 1, 1, 1, 1, 1,
3.113289, -0.709921, 3.535091, 1, 1, 1, 1, 1,
3.481358, 0.2072239, -0.8040781, 1, 1, 1, 1, 1
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
var radius = 10.21238;
var distance = 35.87056;
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
mvMatrix.translate( 0.08246803, 0.09913349, -0.4799037 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.87056);
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
