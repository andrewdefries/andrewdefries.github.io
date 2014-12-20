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
-4.023913, -1.169198, -0.7110863, 1, 0, 0, 1,
-2.682649, 0.2791685, -2.639355, 1, 0.007843138, 0, 1,
-2.581735, -0.2580223, -1.755504, 1, 0.01176471, 0, 1,
-2.403575, -1.410847, -1.938766, 1, 0.01960784, 0, 1,
-2.337636, 0.9448742, -3.09796, 1, 0.02352941, 0, 1,
-2.289607, -0.4602048, -2.21891, 1, 0.03137255, 0, 1,
-2.251348, 0.1718341, -1.588695, 1, 0.03529412, 0, 1,
-2.227736, 0.7087102, -0.4332001, 1, 0.04313726, 0, 1,
-2.11749, 0.9474145, -0.1992459, 1, 0.04705882, 0, 1,
-2.063409, 0.7289232, -1.608828, 1, 0.05490196, 0, 1,
-2.054059, 0.8141761, -0.9005797, 1, 0.05882353, 0, 1,
-2.049071, 0.8862792, -0.6181387, 1, 0.06666667, 0, 1,
-2.037575, 0.8850689, -0.8913329, 1, 0.07058824, 0, 1,
-2.01391, 1.241894, -0.05437578, 1, 0.07843138, 0, 1,
-2.011886, -1.063175, -1.038093, 1, 0.08235294, 0, 1,
-2.009935, 1.530666, 0.5509266, 1, 0.09019608, 0, 1,
-2.00516, 0.3432061, 0.3434893, 1, 0.09411765, 0, 1,
-2.004665, 0.518203, -0.08645655, 1, 0.1019608, 0, 1,
-2.003815, 0.4484561, -1.281745, 1, 0.1098039, 0, 1,
-1.995332, -1.149311, -3.611091, 1, 0.1137255, 0, 1,
-1.967341, 1.340393, -1.313642, 1, 0.1215686, 0, 1,
-1.959265, -0.8515417, -2.827555, 1, 0.1254902, 0, 1,
-1.940652, -0.7254484, -2.880794, 1, 0.1333333, 0, 1,
-1.927657, -0.7170161, -0.908856, 1, 0.1372549, 0, 1,
-1.913195, -0.3691214, -2.035756, 1, 0.145098, 0, 1,
-1.908773, 0.2351764, -1.04516, 1, 0.1490196, 0, 1,
-1.894426, -0.3558885, -1.035012, 1, 0.1568628, 0, 1,
-1.883578, -1.492473, -0.8613043, 1, 0.1607843, 0, 1,
-1.8784, -0.3072032, -1.41683, 1, 0.1686275, 0, 1,
-1.877829, 1.227285, -1.579859, 1, 0.172549, 0, 1,
-1.863381, -0.4726811, -3.928891, 1, 0.1803922, 0, 1,
-1.851264, 0.549271, -0.4137795, 1, 0.1843137, 0, 1,
-1.845157, -0.08347898, -2.683623, 1, 0.1921569, 0, 1,
-1.839599, 0.333317, -1.740573, 1, 0.1960784, 0, 1,
-1.834535, 0.7968299, -1.521326, 1, 0.2039216, 0, 1,
-1.822106, -1.090472, -2.310455, 1, 0.2117647, 0, 1,
-1.810966, 0.3565704, -0.7866666, 1, 0.2156863, 0, 1,
-1.768989, 1.599143, -1.498432, 1, 0.2235294, 0, 1,
-1.766343, 0.5014509, -1.775055, 1, 0.227451, 0, 1,
-1.731537, 0.8722538, -0.5404453, 1, 0.2352941, 0, 1,
-1.710104, -2.471346, -2.965687, 1, 0.2392157, 0, 1,
-1.695157, 2.286831, -0.8425843, 1, 0.2470588, 0, 1,
-1.667672, 1.027767, -0.3844806, 1, 0.2509804, 0, 1,
-1.659251, -0.7653327, -3.520635, 1, 0.2588235, 0, 1,
-1.655373, -1.747019, -1.912031, 1, 0.2627451, 0, 1,
-1.652204, 0.1828964, -0.195385, 1, 0.2705882, 0, 1,
-1.650233, 1.730375, -0.4458384, 1, 0.2745098, 0, 1,
-1.649979, 0.7173184, -2.396779, 1, 0.282353, 0, 1,
-1.644345, 0.9542807, -1.812491, 1, 0.2862745, 0, 1,
-1.633683, 0.1922835, -1.569783, 1, 0.2941177, 0, 1,
-1.627619, -0.2637478, -0.1048813, 1, 0.3019608, 0, 1,
-1.622533, -0.4897934, -2.326908, 1, 0.3058824, 0, 1,
-1.614038, 2.452042, 0.7064489, 1, 0.3137255, 0, 1,
-1.607327, -0.776984, -2.856848, 1, 0.3176471, 0, 1,
-1.602289, 0.09047364, -0.9493228, 1, 0.3254902, 0, 1,
-1.600221, -0.3463418, -1.872066, 1, 0.3294118, 0, 1,
-1.599791, -0.6843333, -1.413048, 1, 0.3372549, 0, 1,
-1.594604, 0.5079126, -0.1044107, 1, 0.3411765, 0, 1,
-1.592252, 1.133599, -1.048639, 1, 0.3490196, 0, 1,
-1.586566, 0.4526225, -2.806656, 1, 0.3529412, 0, 1,
-1.583477, -0.7993433, -0.9039416, 1, 0.3607843, 0, 1,
-1.57773, 0.9472533, -1.650783, 1, 0.3647059, 0, 1,
-1.56559, -0.8782246, -1.589875, 1, 0.372549, 0, 1,
-1.56398, 1.158638, 0.8313377, 1, 0.3764706, 0, 1,
-1.560597, 0.2429663, -0.2318628, 1, 0.3843137, 0, 1,
-1.555013, 0.3944889, -1.307627, 1, 0.3882353, 0, 1,
-1.534099, 1.10916, 0.3441411, 1, 0.3960784, 0, 1,
-1.513397, 0.1138017, -2.311131, 1, 0.4039216, 0, 1,
-1.507182, 0.6088743, 0.5425876, 1, 0.4078431, 0, 1,
-1.504481, -1.195234, -0.4899386, 1, 0.4156863, 0, 1,
-1.504275, 0.8133171, -1.730688, 1, 0.4196078, 0, 1,
-1.498317, 1.89252, -1.102048, 1, 0.427451, 0, 1,
-1.492136, -0.5238149, -3.470529, 1, 0.4313726, 0, 1,
-1.491215, 0.7138245, -1.492149, 1, 0.4392157, 0, 1,
-1.46602, 2.176869, -0.9644699, 1, 0.4431373, 0, 1,
-1.459955, -0.7721608, -3.451623, 1, 0.4509804, 0, 1,
-1.459617, -1.722515, -2.509675, 1, 0.454902, 0, 1,
-1.4588, 0.7713272, -0.2037372, 1, 0.4627451, 0, 1,
-1.45494, -0.0001076224, -2.606459, 1, 0.4666667, 0, 1,
-1.454929, 1.741534, -0.3533154, 1, 0.4745098, 0, 1,
-1.448199, 0.05783472, -1.864114, 1, 0.4784314, 0, 1,
-1.438166, 0.5483339, -0.9902279, 1, 0.4862745, 0, 1,
-1.432733, -0.5940962, 0.08918425, 1, 0.4901961, 0, 1,
-1.431348, -0.75792, -2.62229, 1, 0.4980392, 0, 1,
-1.428866, -1.13539, -3.709677, 1, 0.5058824, 0, 1,
-1.416674, -0.7828646, -2.115058, 1, 0.509804, 0, 1,
-1.416345, -0.02579085, -1.445204, 1, 0.5176471, 0, 1,
-1.408213, 1.267416, -0.3724259, 1, 0.5215687, 0, 1,
-1.394437, -0.4464378, -2.101697, 1, 0.5294118, 0, 1,
-1.392812, -0.4719753, -0.9684204, 1, 0.5333334, 0, 1,
-1.391186, -0.6505873, -1.942227, 1, 0.5411765, 0, 1,
-1.385814, -0.7751182, -2.608126, 1, 0.5450981, 0, 1,
-1.377153, 0.8072845, 0.1536616, 1, 0.5529412, 0, 1,
-1.372294, -0.9527757, -2.076619, 1, 0.5568628, 0, 1,
-1.371135, 1.514221, -0.9173585, 1, 0.5647059, 0, 1,
-1.369115, 0.5366138, -3.011297, 1, 0.5686275, 0, 1,
-1.362713, 0.9811944, -1.551129, 1, 0.5764706, 0, 1,
-1.35193, 0.5610988, -1.748826, 1, 0.5803922, 0, 1,
-1.347367, -0.06323013, -0.9593698, 1, 0.5882353, 0, 1,
-1.347075, 1.304325, 0.8295275, 1, 0.5921569, 0, 1,
-1.341989, 1.176883, -1.500239, 1, 0.6, 0, 1,
-1.331254, 0.7476118, 0.3501465, 1, 0.6078432, 0, 1,
-1.328352, 0.1264205, -0.9004842, 1, 0.6117647, 0, 1,
-1.316991, 0.1796633, -1.544534, 1, 0.6196079, 0, 1,
-1.311882, -1.98632, -1.775124, 1, 0.6235294, 0, 1,
-1.310871, 0.8711929, -1.224638, 1, 0.6313726, 0, 1,
-1.310487, 1.294858, -2.066249, 1, 0.6352941, 0, 1,
-1.302256, 0.8480963, -0.2777978, 1, 0.6431373, 0, 1,
-1.295368, -0.5488214, -2.598042, 1, 0.6470588, 0, 1,
-1.293487, -0.2570132, -2.870507, 1, 0.654902, 0, 1,
-1.279892, -0.3531028, -0.3443967, 1, 0.6588235, 0, 1,
-1.278152, 0.8783177, -1.059119, 1, 0.6666667, 0, 1,
-1.27796, 0.3213835, -0.8771971, 1, 0.6705883, 0, 1,
-1.274123, -3.093288, -3.86344, 1, 0.6784314, 0, 1,
-1.273453, -0.994221, -2.029384, 1, 0.682353, 0, 1,
-1.248356, 0.4301201, -1.027662, 1, 0.6901961, 0, 1,
-1.243483, 0.5820143, -1.912421, 1, 0.6941177, 0, 1,
-1.241069, -1.377189, -2.25604, 1, 0.7019608, 0, 1,
-1.239321, -0.1503318, -2.168939, 1, 0.7098039, 0, 1,
-1.238708, -1.162939, -2.18602, 1, 0.7137255, 0, 1,
-1.237752, -1.811621, -2.406819, 1, 0.7215686, 0, 1,
-1.235941, 1.049645, -0.1140208, 1, 0.7254902, 0, 1,
-1.235532, 0.9390553, -1.06682, 1, 0.7333333, 0, 1,
-1.231038, 0.0545818, -1.794186, 1, 0.7372549, 0, 1,
-1.222309, -1.344718, -4.11776, 1, 0.7450981, 0, 1,
-1.221716, -0.9019502, -3.766177, 1, 0.7490196, 0, 1,
-1.209765, -0.5223683, -1.67619, 1, 0.7568628, 0, 1,
-1.209283, -1.901476, -1.987788, 1, 0.7607843, 0, 1,
-1.204969, 0.4100648, -1.308199, 1, 0.7686275, 0, 1,
-1.198258, 1.535876, -1.129726, 1, 0.772549, 0, 1,
-1.193759, -0.8602998, -1.093105, 1, 0.7803922, 0, 1,
-1.188023, 1.123767, 0.6876044, 1, 0.7843137, 0, 1,
-1.185721, -1.364829, -3.001157, 1, 0.7921569, 0, 1,
-1.176537, 0.04017504, -2.198773, 1, 0.7960784, 0, 1,
-1.176347, -2.302584, -2.677853, 1, 0.8039216, 0, 1,
-1.16933, -1.783667, -1.416049, 1, 0.8117647, 0, 1,
-1.161868, 0.1854439, -1.66494, 1, 0.8156863, 0, 1,
-1.148253, -0.6641985, -3.07939, 1, 0.8235294, 0, 1,
-1.147851, -0.3193482, -2.181557, 1, 0.827451, 0, 1,
-1.144506, 0.8050121, -2.175051, 1, 0.8352941, 0, 1,
-1.142484, 0.4277754, -0.231802, 1, 0.8392157, 0, 1,
-1.141868, 0.876366, -1.022593, 1, 0.8470588, 0, 1,
-1.140696, -0.4427803, -1.647983, 1, 0.8509804, 0, 1,
-1.127996, 1.32608, -1.537951, 1, 0.8588235, 0, 1,
-1.127448, 0.07508346, -0.4885246, 1, 0.8627451, 0, 1,
-1.126545, -0.09416436, -2.10787, 1, 0.8705882, 0, 1,
-1.125942, -0.4980047, -1.410163, 1, 0.8745098, 0, 1,
-1.124963, -0.9462261, -2.620814, 1, 0.8823529, 0, 1,
-1.120086, -0.1303972, -2.216367, 1, 0.8862745, 0, 1,
-1.117751, -0.06990761, 0.5560228, 1, 0.8941177, 0, 1,
-1.115746, 0.1625844, -1.491762, 1, 0.8980392, 0, 1,
-1.109568, 0.8221106, -0.5328697, 1, 0.9058824, 0, 1,
-1.107932, 1.245044, 0.1147894, 1, 0.9137255, 0, 1,
-1.105167, 2.369793, -2.258982, 1, 0.9176471, 0, 1,
-1.103675, -0.02320314, 0.7346033, 1, 0.9254902, 0, 1,
-1.096687, -0.1652408, -1.499476, 1, 0.9294118, 0, 1,
-1.095972, 0.01570823, -3.212364, 1, 0.9372549, 0, 1,
-1.072711, 0.8208016, 0.02802305, 1, 0.9411765, 0, 1,
-1.070359, -0.7017547, -4.208638, 1, 0.9490196, 0, 1,
-1.059975, 0.6089554, -0.9455571, 1, 0.9529412, 0, 1,
-1.052648, 0.02100364, 0.09552586, 1, 0.9607843, 0, 1,
-1.047279, 1.227139, -0.5611082, 1, 0.9647059, 0, 1,
-1.040999, 0.6292129, -3.233232, 1, 0.972549, 0, 1,
-1.018819, -0.6142021, -0.2630953, 1, 0.9764706, 0, 1,
-1.017832, 2.051852, -1.385071, 1, 0.9843137, 0, 1,
-1.015935, 0.1201633, -0.962208, 1, 0.9882353, 0, 1,
-1.014206, -1.742421, -4.152766, 1, 0.9960784, 0, 1,
-1.012545, 0.3971874, -2.338878, 0.9960784, 1, 0, 1,
-1.01125, -0.2422165, -2.848403, 0.9921569, 1, 0, 1,
-1.01103, -1.513535, -2.431131, 0.9843137, 1, 0, 1,
-1.009682, 1.529907, 0.4498921, 0.9803922, 1, 0, 1,
-1.007178, -0.3122653, -1.398861, 0.972549, 1, 0, 1,
-1.005209, 0.9537375, -1.342634, 0.9686275, 1, 0, 1,
-0.9937309, -0.6541267, -0.8960727, 0.9607843, 1, 0, 1,
-0.9928668, -0.4475935, -1.456898, 0.9568627, 1, 0, 1,
-0.9909168, -1.028321, -2.766425, 0.9490196, 1, 0, 1,
-0.9830434, -1.146251, -1.967821, 0.945098, 1, 0, 1,
-0.9798319, -0.3323985, -1.778933, 0.9372549, 1, 0, 1,
-0.9739259, -2.547183, -2.510213, 0.9333333, 1, 0, 1,
-0.9695224, -0.1850704, -0.08341663, 0.9254902, 1, 0, 1,
-0.9689581, -1.119348, -3.074595, 0.9215686, 1, 0, 1,
-0.9679992, -0.3747359, -1.098928, 0.9137255, 1, 0, 1,
-0.9656383, -0.1727176, -3.705297, 0.9098039, 1, 0, 1,
-0.964826, 0.662288, -2.170162, 0.9019608, 1, 0, 1,
-0.9603077, -0.844908, -1.993228, 0.8941177, 1, 0, 1,
-0.9596174, -0.05585747, -0.6360767, 0.8901961, 1, 0, 1,
-0.9586736, 0.1848726, -1.329399, 0.8823529, 1, 0, 1,
-0.958046, -0.7330611, -1.656888, 0.8784314, 1, 0, 1,
-0.9454216, -2.262362, -2.717832, 0.8705882, 1, 0, 1,
-0.9401063, 1.402487, -1.477236, 0.8666667, 1, 0, 1,
-0.9359065, 0.9913367, -0.8038335, 0.8588235, 1, 0, 1,
-0.93551, -0.8215834, -5.069869, 0.854902, 1, 0, 1,
-0.9354763, -1.155964, -4.448903, 0.8470588, 1, 0, 1,
-0.9284091, -0.478999, -1.503507, 0.8431373, 1, 0, 1,
-0.9251903, 1.445467, -0.7455616, 0.8352941, 1, 0, 1,
-0.9115527, -0.4789649, -0.05921811, 0.8313726, 1, 0, 1,
-0.9050987, 0.8589959, 1.004397, 0.8235294, 1, 0, 1,
-0.9031602, -0.8356584, -2.864215, 0.8196079, 1, 0, 1,
-0.9002901, -0.4703311, -3.730098, 0.8117647, 1, 0, 1,
-0.8979692, -0.564629, -1.590389, 0.8078431, 1, 0, 1,
-0.8933915, 0.5449538, -2.10393, 0.8, 1, 0, 1,
-0.8929807, 1.674178, 0.6180033, 0.7921569, 1, 0, 1,
-0.8923496, 0.4314824, -0.2018513, 0.7882353, 1, 0, 1,
-0.8900189, -2.580958, -3.237104, 0.7803922, 1, 0, 1,
-0.8871869, -1.740728, -3.995555, 0.7764706, 1, 0, 1,
-0.8795706, -0.6534305, -1.539812, 0.7686275, 1, 0, 1,
-0.8759093, -0.9001852, -2.595747, 0.7647059, 1, 0, 1,
-0.8759085, 0.2247675, -1.146952, 0.7568628, 1, 0, 1,
-0.8666446, 1.31252, -0.2231465, 0.7529412, 1, 0, 1,
-0.8664167, -1.550131, -4.551923, 0.7450981, 1, 0, 1,
-0.8645104, 0.01539424, -1.005037, 0.7411765, 1, 0, 1,
-0.8612596, -0.1620667, -0.8947861, 0.7333333, 1, 0, 1,
-0.8555612, 0.6179433, -1.35005, 0.7294118, 1, 0, 1,
-0.8539926, 0.38833, -1.037426, 0.7215686, 1, 0, 1,
-0.8459756, -1.774726, -3.626184, 0.7176471, 1, 0, 1,
-0.8450573, -1.311185, -2.78348, 0.7098039, 1, 0, 1,
-0.8277553, -1.068186, -1.937304, 0.7058824, 1, 0, 1,
-0.8263014, 0.9536998, 0.9140913, 0.6980392, 1, 0, 1,
-0.825256, 0.4594457, 0.7598732, 0.6901961, 1, 0, 1,
-0.818905, 1.859859, -1.272409, 0.6862745, 1, 0, 1,
-0.8161173, -1.239522, -1.473372, 0.6784314, 1, 0, 1,
-0.8137966, 0.1854288, -2.891071, 0.6745098, 1, 0, 1,
-0.8119759, 1.652765, 2.220082, 0.6666667, 1, 0, 1,
-0.81116, 2.361287, -0.2749364, 0.6627451, 1, 0, 1,
-0.8086624, 1.774441, -1.743279, 0.654902, 1, 0, 1,
-0.808153, -0.4541632, -2.370387, 0.6509804, 1, 0, 1,
-0.8047208, -0.7632354, -2.793508, 0.6431373, 1, 0, 1,
-0.8037912, -0.01588608, -0.4119974, 0.6392157, 1, 0, 1,
-0.8024774, 1.378032, 0.7081182, 0.6313726, 1, 0, 1,
-0.8006476, -0.3297264, -3.000014, 0.627451, 1, 0, 1,
-0.7943615, 1.305017, -1.667273, 0.6196079, 1, 0, 1,
-0.7898452, -0.3353485, -0.8452803, 0.6156863, 1, 0, 1,
-0.7885004, -1.111007, -1.499037, 0.6078432, 1, 0, 1,
-0.7860231, -1.154942, -3.263874, 0.6039216, 1, 0, 1,
-0.7857307, -1.328264, -2.572424, 0.5960785, 1, 0, 1,
-0.784861, 0.5866074, -0.9749014, 0.5882353, 1, 0, 1,
-0.7804312, 1.263174, 0.2619662, 0.5843138, 1, 0, 1,
-0.7752672, -1.323303, -2.171332, 0.5764706, 1, 0, 1,
-0.7747051, -0.709495, -1.107505, 0.572549, 1, 0, 1,
-0.7730359, -0.5151579, -3.006893, 0.5647059, 1, 0, 1,
-0.7694901, -1.087989, -0.8292626, 0.5607843, 1, 0, 1,
-0.7659194, -0.04906398, -2.741363, 0.5529412, 1, 0, 1,
-0.7653747, -0.3607163, -2.631411, 0.5490196, 1, 0, 1,
-0.7645629, 0.472196, -0.07780096, 0.5411765, 1, 0, 1,
-0.7621247, -0.06561289, -3.360054, 0.5372549, 1, 0, 1,
-0.7612793, -0.07919282, -1.46333, 0.5294118, 1, 0, 1,
-0.7597714, 1.876859, -0.4310024, 0.5254902, 1, 0, 1,
-0.7569777, 1.336821, -1.020911, 0.5176471, 1, 0, 1,
-0.7568691, -0.5897815, -1.629625, 0.5137255, 1, 0, 1,
-0.7567272, 0.7834941, 1.23582, 0.5058824, 1, 0, 1,
-0.7562065, -1.560427, -3.162122, 0.5019608, 1, 0, 1,
-0.7541118, 0.9217939, -1.580862, 0.4941176, 1, 0, 1,
-0.7468988, 0.6831005, -0.0170091, 0.4862745, 1, 0, 1,
-0.7392447, 0.355916, -2.536239, 0.4823529, 1, 0, 1,
-0.7328842, -0.2687441, -3.13414, 0.4745098, 1, 0, 1,
-0.7325929, 0.9555807, -1.086677, 0.4705882, 1, 0, 1,
-0.7309993, -0.2346907, -1.453164, 0.4627451, 1, 0, 1,
-0.7195388, -0.9195689, -1.656563, 0.4588235, 1, 0, 1,
-0.7115175, 0.4804142, -0.3144117, 0.4509804, 1, 0, 1,
-0.7111822, 1.77296, 0.862802, 0.4470588, 1, 0, 1,
-0.7060313, -0.290794, -1.924883, 0.4392157, 1, 0, 1,
-0.6980473, 0.7782388, -1.29164, 0.4352941, 1, 0, 1,
-0.6980458, 1.315471, -0.7013909, 0.427451, 1, 0, 1,
-0.6977574, 0.4922, 0.4700665, 0.4235294, 1, 0, 1,
-0.6973392, 0.4334119, -1.953459, 0.4156863, 1, 0, 1,
-0.6943295, -0.2195087, -2.156797, 0.4117647, 1, 0, 1,
-0.689625, 0.9269048, -1.665138, 0.4039216, 1, 0, 1,
-0.6884984, 0.6154989, -1.713448, 0.3960784, 1, 0, 1,
-0.6870605, -0.1147755, -2.382189, 0.3921569, 1, 0, 1,
-0.6861569, -1.241998, -1.884767, 0.3843137, 1, 0, 1,
-0.6796818, -0.1557836, -0.8042729, 0.3803922, 1, 0, 1,
-0.6756148, 1.64251, 1.190355, 0.372549, 1, 0, 1,
-0.6738327, 0.5622802, -2.975817, 0.3686275, 1, 0, 1,
-0.6711658, 0.05739566, -0.5135887, 0.3607843, 1, 0, 1,
-0.6646343, -0.1297374, -2.533516, 0.3568628, 1, 0, 1,
-0.6620385, -0.2388453, -3.068233, 0.3490196, 1, 0, 1,
-0.6607616, -1.767522, -2.167174, 0.345098, 1, 0, 1,
-0.6595662, -1.285018, -2.252703, 0.3372549, 1, 0, 1,
-0.6554894, 0.4935624, -0.4480362, 0.3333333, 1, 0, 1,
-0.6539564, -0.2565291, 0.0511391, 0.3254902, 1, 0, 1,
-0.6539214, -1.218164, -1.306975, 0.3215686, 1, 0, 1,
-0.6531488, 0.7593684, -0.02367887, 0.3137255, 1, 0, 1,
-0.6509657, 0.008517437, -1.528254, 0.3098039, 1, 0, 1,
-0.6433293, 0.3103562, -1.997849, 0.3019608, 1, 0, 1,
-0.6347544, -1.148325, -1.892056, 0.2941177, 1, 0, 1,
-0.6337687, 2.162775, -0.1601806, 0.2901961, 1, 0, 1,
-0.6318759, -1.242434, -3.952636, 0.282353, 1, 0, 1,
-0.6318743, 0.9233608, 0.1489221, 0.2784314, 1, 0, 1,
-0.6307973, 0.2494463, -0.8393296, 0.2705882, 1, 0, 1,
-0.6238075, 0.06303044, -1.174186, 0.2666667, 1, 0, 1,
-0.6164616, -1.267459, -2.498894, 0.2588235, 1, 0, 1,
-0.6066523, 1.162152, -0.259325, 0.254902, 1, 0, 1,
-0.6031255, -0.9994989, -2.362685, 0.2470588, 1, 0, 1,
-0.6026723, -0.905534, -0.9576144, 0.2431373, 1, 0, 1,
-0.5948814, 0.6589952, -3.17625, 0.2352941, 1, 0, 1,
-0.5935269, 0.6723353, -0.5707447, 0.2313726, 1, 0, 1,
-0.589913, -0.07221726, -1.647029, 0.2235294, 1, 0, 1,
-0.5897651, -0.9305565, -4.226739, 0.2196078, 1, 0, 1,
-0.5867025, -1.262442, -1.927484, 0.2117647, 1, 0, 1,
-0.5855335, 0.7085447, -0.5653334, 0.2078431, 1, 0, 1,
-0.5831468, -0.147116, -0.3480317, 0.2, 1, 0, 1,
-0.5815756, -2.206587, -3.198732, 0.1921569, 1, 0, 1,
-0.5792522, 0.774753, -0.7936968, 0.1882353, 1, 0, 1,
-0.5742549, -0.265223, -3.673676, 0.1803922, 1, 0, 1,
-0.5733366, 0.3420894, -0.6539394, 0.1764706, 1, 0, 1,
-0.5715094, -0.5119448, -2.097786, 0.1686275, 1, 0, 1,
-0.5659471, -0.4872663, -1.570951, 0.1647059, 1, 0, 1,
-0.5640146, -0.3016527, -4.175268, 0.1568628, 1, 0, 1,
-0.5613303, -0.619769, -3.779694, 0.1529412, 1, 0, 1,
-0.5564716, -1.415478, -3.340256, 0.145098, 1, 0, 1,
-0.5528806, 0.4011567, -0.01865336, 0.1411765, 1, 0, 1,
-0.5490671, -0.7568659, -2.907934, 0.1333333, 1, 0, 1,
-0.542796, -2.053689, -2.471427, 0.1294118, 1, 0, 1,
-0.5357125, 0.5844427, -0.2972174, 0.1215686, 1, 0, 1,
-0.5338364, -1.152854, -0.9626101, 0.1176471, 1, 0, 1,
-0.5315734, -1.879335, -0.9854944, 0.1098039, 1, 0, 1,
-0.5284386, -0.9343436, -0.8992152, 0.1058824, 1, 0, 1,
-0.5280181, 0.1310236, -0.5662856, 0.09803922, 1, 0, 1,
-0.5265552, 0.8752208, -2.576989, 0.09019608, 1, 0, 1,
-0.5261211, -1.769989, -2.613782, 0.08627451, 1, 0, 1,
-0.5231727, 0.2774652, -0.5115783, 0.07843138, 1, 0, 1,
-0.5201601, -0.4305658, -2.24047, 0.07450981, 1, 0, 1,
-0.5195689, 0.2937502, -0.08671824, 0.06666667, 1, 0, 1,
-0.519119, 0.7087868, 1.094632, 0.0627451, 1, 0, 1,
-0.5174519, -0.6057035, -2.82489, 0.05490196, 1, 0, 1,
-0.5158529, -0.4098102, -3.642225, 0.05098039, 1, 0, 1,
-0.5152796, 0.1270313, -2.585418, 0.04313726, 1, 0, 1,
-0.5127195, 1.130615, 0.0761356, 0.03921569, 1, 0, 1,
-0.5108827, 0.2228861, -2.898569, 0.03137255, 1, 0, 1,
-0.5093238, 0.7657927, -1.646383, 0.02745098, 1, 0, 1,
-0.5077087, 0.3076221, 0.2330243, 0.01960784, 1, 0, 1,
-0.4950947, -0.650592, -1.289466, 0.01568628, 1, 0, 1,
-0.4893717, 0.1191915, -1.704833, 0.007843138, 1, 0, 1,
-0.487382, 2.483465, -1.496734, 0.003921569, 1, 0, 1,
-0.4730636, 0.1012776, -2.084268, 0, 1, 0.003921569, 1,
-0.4622041, -1.740309, -3.319346, 0, 1, 0.01176471, 1,
-0.4596221, 1.19621, -0.7478991, 0, 1, 0.01568628, 1,
-0.4531517, -1.621207, -2.08209, 0, 1, 0.02352941, 1,
-0.45262, -1.14349, -2.640492, 0, 1, 0.02745098, 1,
-0.4513968, 1.930532, 0.3371269, 0, 1, 0.03529412, 1,
-0.4492471, 0.9051224, -2.256258, 0, 1, 0.03921569, 1,
-0.4442054, 0.1576879, -1.621253, 0, 1, 0.04705882, 1,
-0.4401205, -1.068621, -1.918862, 0, 1, 0.05098039, 1,
-0.4386172, -0.2582654, -2.582473, 0, 1, 0.05882353, 1,
-0.4367343, -0.04703179, -1.534716, 0, 1, 0.0627451, 1,
-0.4358839, 0.6890729, -1.955765, 0, 1, 0.07058824, 1,
-0.4285823, 0.09111344, 1.168296, 0, 1, 0.07450981, 1,
-0.4268779, -0.4072481, -2.688786, 0, 1, 0.08235294, 1,
-0.4189312, 2.229859, 0.2408807, 0, 1, 0.08627451, 1,
-0.4172611, 0.2661079, 0.5708178, 0, 1, 0.09411765, 1,
-0.412789, -0.887589, -1.24788, 0, 1, 0.1019608, 1,
-0.4114251, 0.2214775, -2.879241, 0, 1, 0.1058824, 1,
-0.410985, 1.594646, -0.2893086, 0, 1, 0.1137255, 1,
-0.410558, 0.9386801, 1.812135, 0, 1, 0.1176471, 1,
-0.4063807, -0.9432921, -2.610205, 0, 1, 0.1254902, 1,
-0.405454, -0.5688615, -0.990352, 0, 1, 0.1294118, 1,
-0.4018923, -0.5715806, -2.833764, 0, 1, 0.1372549, 1,
-0.3961523, 1.45882, -1.553882, 0, 1, 0.1411765, 1,
-0.3939769, -0.7139168, -2.30617, 0, 1, 0.1490196, 1,
-0.3903123, 0.2682288, 0.2251255, 0, 1, 0.1529412, 1,
-0.3900812, -1.259427, -2.52585, 0, 1, 0.1607843, 1,
-0.3888808, -0.1145191, -2.892785, 0, 1, 0.1647059, 1,
-0.3792723, 0.1139549, -1.007795, 0, 1, 0.172549, 1,
-0.3783061, 0.2927474, 0.1441141, 0, 1, 0.1764706, 1,
-0.3742338, 1.111044, 1.56688, 0, 1, 0.1843137, 1,
-0.373306, 1.39069, -0.8823569, 0, 1, 0.1882353, 1,
-0.3652488, 0.9936543, -0.2826495, 0, 1, 0.1960784, 1,
-0.365241, -1.095325, -0.9617614, 0, 1, 0.2039216, 1,
-0.3640852, -0.412389, -1.807763, 0, 1, 0.2078431, 1,
-0.3574824, 0.8923509, -2.27805, 0, 1, 0.2156863, 1,
-0.352283, 0.7489474, -1.090145, 0, 1, 0.2196078, 1,
-0.3509275, -0.5673711, -3.605727, 0, 1, 0.227451, 1,
-0.3502399, 0.4009486, -1.619338, 0, 1, 0.2313726, 1,
-0.3491074, 1.773479, 0.7315481, 0, 1, 0.2392157, 1,
-0.3437444, 0.03350563, -2.026329, 0, 1, 0.2431373, 1,
-0.3422116, -0.6694353, -1.261556, 0, 1, 0.2509804, 1,
-0.3336998, 0.2674799, 0.1868404, 0, 1, 0.254902, 1,
-0.3306755, 0.8990971, -1.613535, 0, 1, 0.2627451, 1,
-0.3269247, -0.5846224, -2.874831, 0, 1, 0.2666667, 1,
-0.3201528, -0.9810147, -1.747612, 0, 1, 0.2745098, 1,
-0.3194076, -0.2563811, -1.931518, 0, 1, 0.2784314, 1,
-0.3174221, 0.7560254, -0.04628447, 0, 1, 0.2862745, 1,
-0.3169677, 0.9645852, -1.150378, 0, 1, 0.2901961, 1,
-0.3163481, 1.47205, 0.3168898, 0, 1, 0.2980392, 1,
-0.3161605, -1.020229, -3.176335, 0, 1, 0.3058824, 1,
-0.3160117, -1.754251, -3.064082, 0, 1, 0.3098039, 1,
-0.3135547, 0.256714, -0.2862202, 0, 1, 0.3176471, 1,
-0.3111778, -1.06408, -2.436872, 0, 1, 0.3215686, 1,
-0.3109136, -0.3026125, -1.51257, 0, 1, 0.3294118, 1,
-0.3089144, 0.7120108, -2.140806, 0, 1, 0.3333333, 1,
-0.3082947, -0.09009183, -2.176685, 0, 1, 0.3411765, 1,
-0.3041601, 0.1234107, -1.014917, 0, 1, 0.345098, 1,
-0.3036983, 0.8936676, -0.9633551, 0, 1, 0.3529412, 1,
-0.3019608, -0.3415835, -1.785526, 0, 1, 0.3568628, 1,
-0.2989461, -0.8124325, -2.144801, 0, 1, 0.3647059, 1,
-0.2979486, 1.929947, 0.2752268, 0, 1, 0.3686275, 1,
-0.2956282, -0.05085619, -1.717032, 0, 1, 0.3764706, 1,
-0.2937098, 0.9535472, 0.6157236, 0, 1, 0.3803922, 1,
-0.2926186, -0.1267645, -2.21297, 0, 1, 0.3882353, 1,
-0.2893113, -0.779272, -2.036834, 0, 1, 0.3921569, 1,
-0.2876834, -0.9654967, -3.949977, 0, 1, 0.4, 1,
-0.2869906, 0.806689, 1.595868, 0, 1, 0.4078431, 1,
-0.2868226, 0.06658844, -1.116871, 0, 1, 0.4117647, 1,
-0.2845645, -0.2852769, -1.957356, 0, 1, 0.4196078, 1,
-0.284142, -0.5748945, -2.787738, 0, 1, 0.4235294, 1,
-0.2841261, 0.210243, -0.6626053, 0, 1, 0.4313726, 1,
-0.2825933, 1.334422, -0.2525899, 0, 1, 0.4352941, 1,
-0.2795084, 1.327258, 0.4119311, 0, 1, 0.4431373, 1,
-0.2786058, -1.188104, -3.0999, 0, 1, 0.4470588, 1,
-0.2731054, -1.499401, -2.191509, 0, 1, 0.454902, 1,
-0.2707857, -0.5553101, -1.389549, 0, 1, 0.4588235, 1,
-0.2693826, -0.2983579, -2.65062, 0, 1, 0.4666667, 1,
-0.268914, 0.7816631, 0.241346, 0, 1, 0.4705882, 1,
-0.2652843, -0.8461545, -2.287903, 0, 1, 0.4784314, 1,
-0.2624996, -1.087201, -2.303838, 0, 1, 0.4823529, 1,
-0.2602524, 0.6517962, -0.8549018, 0, 1, 0.4901961, 1,
-0.2574996, -0.6274037, -2.826149, 0, 1, 0.4941176, 1,
-0.2574925, -0.7687144, -1.512879, 0, 1, 0.5019608, 1,
-0.2566656, 0.3325043, -2.724818, 0, 1, 0.509804, 1,
-0.249959, -0.8222551, -4.443619, 0, 1, 0.5137255, 1,
-0.2461225, -1.107614, -2.269871, 0, 1, 0.5215687, 1,
-0.2417303, 2.273367, -0.4330052, 0, 1, 0.5254902, 1,
-0.2412297, -0.8556648, -2.112483, 0, 1, 0.5333334, 1,
-0.2350782, -0.5524773, -1.516567, 0, 1, 0.5372549, 1,
-0.2349085, 0.3986869, 0.269053, 0, 1, 0.5450981, 1,
-0.2348499, -0.1106861, -2.830423, 0, 1, 0.5490196, 1,
-0.2311289, 2.076462, 0.1087085, 0, 1, 0.5568628, 1,
-0.2261444, 1.271252, -0.4069084, 0, 1, 0.5607843, 1,
-0.2255457, 0.2067187, -0.3523818, 0, 1, 0.5686275, 1,
-0.2243025, -0.5777068, -3.002216, 0, 1, 0.572549, 1,
-0.2241122, 0.2848324, -2.067026, 0, 1, 0.5803922, 1,
-0.2236526, 0.790198, -0.9796264, 0, 1, 0.5843138, 1,
-0.2208159, 0.6815251, 1.013564, 0, 1, 0.5921569, 1,
-0.2181394, -1.17615, -2.694721, 0, 1, 0.5960785, 1,
-0.2172008, -0.3484028, -3.92348, 0, 1, 0.6039216, 1,
-0.204099, 1.349592, -0.2117953, 0, 1, 0.6117647, 1,
-0.2033484, 1.058227, -1.280474, 0, 1, 0.6156863, 1,
-0.2027163, -0.6118781, -0.09100366, 0, 1, 0.6235294, 1,
-0.2016221, 0.2449045, -0.4300905, 0, 1, 0.627451, 1,
-0.2012685, 0.6810141, -1.448198, 0, 1, 0.6352941, 1,
-0.1989687, 2.035034, 1.212971, 0, 1, 0.6392157, 1,
-0.194828, 0.708695, -0.05930635, 0, 1, 0.6470588, 1,
-0.1943501, 0.4895203, -0.1102095, 0, 1, 0.6509804, 1,
-0.1930598, -0.1132785, -1.748608, 0, 1, 0.6588235, 1,
-0.1902595, 1.091301, 0.4844923, 0, 1, 0.6627451, 1,
-0.1869688, 0.1177149, -1.393788, 0, 1, 0.6705883, 1,
-0.1851719, -0.1284329, -1.745048, 0, 1, 0.6745098, 1,
-0.1811668, -1.7235, -3.365748, 0, 1, 0.682353, 1,
-0.1809232, 0.7547634, -1.374081, 0, 1, 0.6862745, 1,
-0.1784022, -0.7800559, -1.394031, 0, 1, 0.6941177, 1,
-0.1728887, -0.4117129, -3.533345, 0, 1, 0.7019608, 1,
-0.1709365, 0.3752424, -0.06817263, 0, 1, 0.7058824, 1,
-0.1689372, -0.9304104, -4.591275, 0, 1, 0.7137255, 1,
-0.1640749, 0.4293131, -0.6013361, 0, 1, 0.7176471, 1,
-0.1634948, -1.043867, -2.235889, 0, 1, 0.7254902, 1,
-0.1610591, -0.9842332, -3.519974, 0, 1, 0.7294118, 1,
-0.1606988, -0.8412799, -2.493709, 0, 1, 0.7372549, 1,
-0.1596447, 2.338598, 0.02108537, 0, 1, 0.7411765, 1,
-0.1525306, 1.322622, -0.9776405, 0, 1, 0.7490196, 1,
-0.1521384, 0.9089687, 0.6347454, 0, 1, 0.7529412, 1,
-0.14151, 0.6225548, 0.5737548, 0, 1, 0.7607843, 1,
-0.1395894, 2.199623, -0.2249576, 0, 1, 0.7647059, 1,
-0.137965, 0.3806008, -0.9243289, 0, 1, 0.772549, 1,
-0.137739, 1.5223, -0.2391302, 0, 1, 0.7764706, 1,
-0.1351006, -0.7334136, -2.790431, 0, 1, 0.7843137, 1,
-0.1334874, 0.07362691, -1.817355, 0, 1, 0.7882353, 1,
-0.1332712, -1.740387, -3.623353, 0, 1, 0.7960784, 1,
-0.1316842, -0.430223, -2.09786, 0, 1, 0.8039216, 1,
-0.1228174, 0.5831191, -1.811243, 0, 1, 0.8078431, 1,
-0.1153343, 1.061749, -0.8961138, 0, 1, 0.8156863, 1,
-0.1133972, 1.097716, 0.2864368, 0, 1, 0.8196079, 1,
-0.1095682, -2.054035, -2.936738, 0, 1, 0.827451, 1,
-0.1075544, -1.701388, -3.349314, 0, 1, 0.8313726, 1,
-0.1034675, -0.3625987, -1.915309, 0, 1, 0.8392157, 1,
-0.09710354, -0.7010263, -0.7910629, 0, 1, 0.8431373, 1,
-0.09125069, 0.2083779, 0.1293432, 0, 1, 0.8509804, 1,
-0.0890169, -0.7784211, -6.089339, 0, 1, 0.854902, 1,
-0.0863485, -0.6523036, -2.052416, 0, 1, 0.8627451, 1,
-0.08581807, 0.4976201, -1.033529, 0, 1, 0.8666667, 1,
-0.08280251, 0.5528086, -0.5663033, 0, 1, 0.8745098, 1,
-0.08123109, 0.4636022, 0.462988, 0, 1, 0.8784314, 1,
-0.08083078, -0.1424169, -3.0875, 0, 1, 0.8862745, 1,
-0.08049949, -0.2872027, -1.005605, 0, 1, 0.8901961, 1,
-0.08023106, 0.7995023, -2.831403, 0, 1, 0.8980392, 1,
-0.07967834, -2.140276, -5.356236, 0, 1, 0.9058824, 1,
-0.07887382, -0.8090518, -2.385789, 0, 1, 0.9098039, 1,
-0.07879732, 0.5159733, -2.506843, 0, 1, 0.9176471, 1,
-0.06656367, -1.055, -4.459993, 0, 1, 0.9215686, 1,
-0.06402102, -0.3501447, -2.889221, 0, 1, 0.9294118, 1,
-0.06219041, 0.5700759, 0.3801671, 0, 1, 0.9333333, 1,
-0.06076382, 0.517287, -2.125678, 0, 1, 0.9411765, 1,
-0.05583163, -0.474328, -1.975372, 0, 1, 0.945098, 1,
-0.0549124, 0.3048405, -1.522111, 0, 1, 0.9529412, 1,
-0.05382381, 0.08099809, -0.7297767, 0, 1, 0.9568627, 1,
-0.05224219, 1.141435, 0.9709687, 0, 1, 0.9647059, 1,
-0.05131621, 1.582357, -0.9291473, 0, 1, 0.9686275, 1,
-0.05002895, 0.3783039, 1.236197, 0, 1, 0.9764706, 1,
-0.04373307, -0.3109154, -2.267934, 0, 1, 0.9803922, 1,
-0.04073819, 1.881427, 0.7146999, 0, 1, 0.9882353, 1,
-0.03585595, -0.7404395, -2.150406, 0, 1, 0.9921569, 1,
-0.03344005, 1.987288, -0.042238, 0, 1, 1, 1,
-0.03072066, 0.9018546, -0.5383384, 0, 0.9921569, 1, 1,
-0.0283646, 0.1156633, 1.085873, 0, 0.9882353, 1, 1,
-0.02670844, -1.036687, -4.23019, 0, 0.9803922, 1, 1,
-0.02663966, 1.222285, -0.38761, 0, 0.9764706, 1, 1,
-0.02654925, 1.201286, 1.088353, 0, 0.9686275, 1, 1,
-0.01897293, -0.3944206, -0.6085561, 0, 0.9647059, 1, 1,
-0.01481324, -1.066247, -2.923215, 0, 0.9568627, 1, 1,
-0.01431667, 0.998509, 1.330129, 0, 0.9529412, 1, 1,
-0.0140668, -0.7248898, -3.582975, 0, 0.945098, 1, 1,
-0.01392694, 1.207879, 1.261936, 0, 0.9411765, 1, 1,
-0.009267502, 1.752358, -1.038922, 0, 0.9333333, 1, 1,
-0.008905162, 1.032083, -1.28261, 0, 0.9294118, 1, 1,
-0.008246471, 0.3096431, -1.508981, 0, 0.9215686, 1, 1,
-0.002659109, 1.118235, 1.354136, 0, 0.9176471, 1, 1,
-0.001319299, -0.9417036, -2.733503, 0, 0.9098039, 1, 1,
0.002000574, 1.588993, -1.041454, 0, 0.9058824, 1, 1,
0.00383497, 0.2522506, -0.2148225, 0, 0.8980392, 1, 1,
0.00557351, -0.03189383, 1.367753, 0, 0.8901961, 1, 1,
0.00966204, -1.299172, 3.73099, 0, 0.8862745, 1, 1,
0.01010641, 0.3812689, -1.347328, 0, 0.8784314, 1, 1,
0.01503426, -0.7450462, 3.231864, 0, 0.8745098, 1, 1,
0.01596265, 0.8572374, 0.4744966, 0, 0.8666667, 1, 1,
0.01750464, -1.767631, 2.667256, 0, 0.8627451, 1, 1,
0.01908402, -0.6506854, 3.520035, 0, 0.854902, 1, 1,
0.02135709, 1.527432, -0.1171731, 0, 0.8509804, 1, 1,
0.02200545, -1.746643, 3.463321, 0, 0.8431373, 1, 1,
0.02297121, 0.316562, -0.5136808, 0, 0.8392157, 1, 1,
0.02629461, -0.4113079, 3.321203, 0, 0.8313726, 1, 1,
0.02796427, 0.2877752, 0.8277866, 0, 0.827451, 1, 1,
0.03447893, 0.5745224, 0.3095375, 0, 0.8196079, 1, 1,
0.03673234, 0.9836674, -0.28365, 0, 0.8156863, 1, 1,
0.04070999, -0.9838119, 3.610118, 0, 0.8078431, 1, 1,
0.04154919, 0.1669393, -1.100899, 0, 0.8039216, 1, 1,
0.04247379, -1.207662, 3.100031, 0, 0.7960784, 1, 1,
0.04267135, -0.01883147, 1.806754, 0, 0.7882353, 1, 1,
0.04325509, 0.6995329, 0.5545757, 0, 0.7843137, 1, 1,
0.04707335, 1.008192, 0.06411763, 0, 0.7764706, 1, 1,
0.05404072, -0.7292999, 2.590082, 0, 0.772549, 1, 1,
0.05523656, -0.2149398, 4.084247, 0, 0.7647059, 1, 1,
0.05706785, -0.2061805, 3.199682, 0, 0.7607843, 1, 1,
0.05760277, -0.1534679, 0.3592924, 0, 0.7529412, 1, 1,
0.05831872, -0.8018479, 4.353559, 0, 0.7490196, 1, 1,
0.06619034, 0.06650677, 0.2694759, 0, 0.7411765, 1, 1,
0.06707465, 0.1529899, 0.7117642, 0, 0.7372549, 1, 1,
0.06847616, -0.2644345, 3.028311, 0, 0.7294118, 1, 1,
0.07271075, 0.3497737, -0.19115, 0, 0.7254902, 1, 1,
0.07737839, -0.02850754, 1.215213, 0, 0.7176471, 1, 1,
0.08071229, -0.01920779, 1.356107, 0, 0.7137255, 1, 1,
0.08601227, -0.3748692, 3.262193, 0, 0.7058824, 1, 1,
0.08883886, 1.616992, -0.9323429, 0, 0.6980392, 1, 1,
0.0891633, -0.3078733, 2.914509, 0, 0.6941177, 1, 1,
0.09147477, -0.3916551, 1.593948, 0, 0.6862745, 1, 1,
0.09210375, -0.4581287, 3.506636, 0, 0.682353, 1, 1,
0.1003588, -0.3391777, 3.846009, 0, 0.6745098, 1, 1,
0.103952, 0.942786, -0.6635665, 0, 0.6705883, 1, 1,
0.1055624, 0.1467069, 0.3482535, 0, 0.6627451, 1, 1,
0.1059517, 0.5318671, 2.562788, 0, 0.6588235, 1, 1,
0.1145458, 1.608825, 0.5083527, 0, 0.6509804, 1, 1,
0.1283501, 0.8387132, 1.233357, 0, 0.6470588, 1, 1,
0.1287132, 0.02627928, 0.9234192, 0, 0.6392157, 1, 1,
0.1336244, 0.2386653, 0.231988, 0, 0.6352941, 1, 1,
0.1417236, -1.038265, 3.58956, 0, 0.627451, 1, 1,
0.1501573, 0.09334718, 0.01057714, 0, 0.6235294, 1, 1,
0.1517038, -0.116327, 4.138, 0, 0.6156863, 1, 1,
0.1518575, -1.560721, 2.28672, 0, 0.6117647, 1, 1,
0.1532827, -1.788809, 3.963793, 0, 0.6039216, 1, 1,
0.1556226, 0.3938203, 1.29639, 0, 0.5960785, 1, 1,
0.1669363, 0.8655469, 0.7748889, 0, 0.5921569, 1, 1,
0.1680783, -0.9082073, 1.710017, 0, 0.5843138, 1, 1,
0.1685519, -1.392287, 3.190267, 0, 0.5803922, 1, 1,
0.1728376, 0.08596215, 2.889991, 0, 0.572549, 1, 1,
0.1746835, 0.2543374, 0.3379788, 0, 0.5686275, 1, 1,
0.1773653, -0.01416642, 1.218912, 0, 0.5607843, 1, 1,
0.1791352, -0.337838, 2.683446, 0, 0.5568628, 1, 1,
0.1795168, -0.2027308, 2.556544, 0, 0.5490196, 1, 1,
0.1809365, 1.527192, -0.7836807, 0, 0.5450981, 1, 1,
0.1831778, 1.620048, -1.002542, 0, 0.5372549, 1, 1,
0.1865825, 0.7455449, 0.6343209, 0, 0.5333334, 1, 1,
0.1882297, -0.03625441, 1.79616, 0, 0.5254902, 1, 1,
0.1888564, 2.334785, -0.4517348, 0, 0.5215687, 1, 1,
0.1906096, 0.6777254, 0.03728769, 0, 0.5137255, 1, 1,
0.1909638, 1.571759, 1.16317, 0, 0.509804, 1, 1,
0.1913792, 1.674976, -0.1411591, 0, 0.5019608, 1, 1,
0.2019767, 0.9882738, 0.8304951, 0, 0.4941176, 1, 1,
0.2020524, 0.109228, 1.454824, 0, 0.4901961, 1, 1,
0.2078636, -1.883441, 3.453446, 0, 0.4823529, 1, 1,
0.2091732, -1.668048, 3.839245, 0, 0.4784314, 1, 1,
0.2113812, -1.642573, 3.277266, 0, 0.4705882, 1, 1,
0.2135354, -0.1958362, 3.458701, 0, 0.4666667, 1, 1,
0.2146414, -1.065041, 3.846309, 0, 0.4588235, 1, 1,
0.2162667, -1.595266, 2.984272, 0, 0.454902, 1, 1,
0.2184913, -1.89069, 3.127782, 0, 0.4470588, 1, 1,
0.2228046, 0.05051392, 1.044146, 0, 0.4431373, 1, 1,
0.2236087, 1.407734, -0.6911947, 0, 0.4352941, 1, 1,
0.2270584, -1.439588, 3.578519, 0, 0.4313726, 1, 1,
0.2332474, -0.6252037, 1.92869, 0, 0.4235294, 1, 1,
0.2347545, 0.4477029, 0.7750109, 0, 0.4196078, 1, 1,
0.2358318, -0.9111052, 0.6740594, 0, 0.4117647, 1, 1,
0.2358572, -0.8481112, 2.731823, 0, 0.4078431, 1, 1,
0.2368708, 0.5027479, 0.02309637, 0, 0.4, 1, 1,
0.2386573, -0.194649, 1.1189, 0, 0.3921569, 1, 1,
0.2388897, 2.035262, 0.2660857, 0, 0.3882353, 1, 1,
0.2420252, 0.5819951, 1.979739, 0, 0.3803922, 1, 1,
0.2432501, -0.1346806, 1.617699, 0, 0.3764706, 1, 1,
0.2446613, -0.3461409, 1.223991, 0, 0.3686275, 1, 1,
0.2536051, 2.123691, -1.075223, 0, 0.3647059, 1, 1,
0.2562842, -0.7247975, 4.143873, 0, 0.3568628, 1, 1,
0.2577122, 0.3601099, 0.3825836, 0, 0.3529412, 1, 1,
0.2590866, 0.01753298, 0.6763193, 0, 0.345098, 1, 1,
0.2599809, 0.1360258, 1.87425, 0, 0.3411765, 1, 1,
0.2633869, 0.8071226, 0.4475446, 0, 0.3333333, 1, 1,
0.2657821, 2.381049, 1.252423, 0, 0.3294118, 1, 1,
0.2659948, 1.955886, -0.2039777, 0, 0.3215686, 1, 1,
0.2680036, -0.7853025, 1.810161, 0, 0.3176471, 1, 1,
0.2681412, 0.3552114, -0.5676984, 0, 0.3098039, 1, 1,
0.2741179, 0.3555471, -0.6672704, 0, 0.3058824, 1, 1,
0.2744288, -0.9925839, 3.061643, 0, 0.2980392, 1, 1,
0.2761593, -0.6505773, 3.716205, 0, 0.2901961, 1, 1,
0.276932, 0.9862983, 0.6491249, 0, 0.2862745, 1, 1,
0.2800369, -2.135035, 2.748241, 0, 0.2784314, 1, 1,
0.2801879, 0.4017792, 1.035327, 0, 0.2745098, 1, 1,
0.2810773, 0.05561043, 0.352151, 0, 0.2666667, 1, 1,
0.2841291, -0.794939, 2.709588, 0, 0.2627451, 1, 1,
0.2849226, -0.3480523, 1.789744, 0, 0.254902, 1, 1,
0.2877334, -0.458597, 1.534665, 0, 0.2509804, 1, 1,
0.2881913, 1.603141, 0.6142991, 0, 0.2431373, 1, 1,
0.2911154, -2.816907, 3.45474, 0, 0.2392157, 1, 1,
0.2914614, -0.8236536, 3.123718, 0, 0.2313726, 1, 1,
0.2997307, 0.1024082, 1.251606, 0, 0.227451, 1, 1,
0.3008516, 0.877519, -0.2359218, 0, 0.2196078, 1, 1,
0.3041289, 0.3854393, 1.33421, 0, 0.2156863, 1, 1,
0.3048243, 0.3441253, 0.1739171, 0, 0.2078431, 1, 1,
0.3051442, -0.08524717, 2.814883, 0, 0.2039216, 1, 1,
0.3065199, 1.48558, -0.4152308, 0, 0.1960784, 1, 1,
0.3108369, -0.3125289, 1.352629, 0, 0.1882353, 1, 1,
0.3121207, -0.8080975, 1.038787, 0, 0.1843137, 1, 1,
0.3129746, 2.283731, -2.444048, 0, 0.1764706, 1, 1,
0.3142204, -0.4976085, 2.612046, 0, 0.172549, 1, 1,
0.3202786, 0.3764475, 1.619953, 0, 0.1647059, 1, 1,
0.3221317, 0.3678699, 0.8761168, 0, 0.1607843, 1, 1,
0.3222932, 0.1544914, 0.1913761, 0, 0.1529412, 1, 1,
0.3243704, -0.1676821, 0.9281912, 0, 0.1490196, 1, 1,
0.3246956, 0.2909695, -1.453412, 0, 0.1411765, 1, 1,
0.3260123, -1.149078, 3.048989, 0, 0.1372549, 1, 1,
0.3269587, 1.494031, 0.2154516, 0, 0.1294118, 1, 1,
0.3432365, 0.3490243, 1.522733, 0, 0.1254902, 1, 1,
0.3435198, -0.4191642, 3.032647, 0, 0.1176471, 1, 1,
0.345962, -0.1377406, 2.432834, 0, 0.1137255, 1, 1,
0.3475805, -0.3012079, 0.8327378, 0, 0.1058824, 1, 1,
0.3511392, 1.194286, 0.03072121, 0, 0.09803922, 1, 1,
0.3517507, 0.8500806, 0.6269829, 0, 0.09411765, 1, 1,
0.3562798, -1.06157, 1.611498, 0, 0.08627451, 1, 1,
0.3564743, 0.09496106, 1.442183, 0, 0.08235294, 1, 1,
0.3597795, -1.414528, 3.401784, 0, 0.07450981, 1, 1,
0.3621278, -0.09507754, 2.570448, 0, 0.07058824, 1, 1,
0.3681235, 1.324315, -1.316992, 0, 0.0627451, 1, 1,
0.3691243, 0.9316668, -0.688607, 0, 0.05882353, 1, 1,
0.3692686, 1.232625, 0.8992486, 0, 0.05098039, 1, 1,
0.3697592, 0.1086101, 2.739058, 0, 0.04705882, 1, 1,
0.3722744, 0.612645, 1.460972, 0, 0.03921569, 1, 1,
0.3755186, 1.789143, 1.032262, 0, 0.03529412, 1, 1,
0.3777222, -1.185063, 3.985743, 0, 0.02745098, 1, 1,
0.3786194, -2.211997, 2.996791, 0, 0.02352941, 1, 1,
0.3788344, 0.3281227, 1.53009, 0, 0.01568628, 1, 1,
0.3876916, 0.997045, 0.9073386, 0, 0.01176471, 1, 1,
0.3885171, -0.914565, 3.357952, 0, 0.003921569, 1, 1,
0.3975542, 0.722787, 0.741771, 0.003921569, 0, 1, 1,
0.4019652, -0.8262962, 1.869295, 0.007843138, 0, 1, 1,
0.405893, 0.6996831, 0.1017766, 0.01568628, 0, 1, 1,
0.4065094, -0.1967157, 1.593966, 0.01960784, 0, 1, 1,
0.4078393, -0.4603227, 1.673102, 0.02745098, 0, 1, 1,
0.4085808, -0.1567214, 1.66322, 0.03137255, 0, 1, 1,
0.4095913, -0.5760816, 0.93917, 0.03921569, 0, 1, 1,
0.4106283, 0.4569321, 0.6297286, 0.04313726, 0, 1, 1,
0.4206443, -1.634223, 5.223495, 0.05098039, 0, 1, 1,
0.4211006, 0.1625958, 1.483587, 0.05490196, 0, 1, 1,
0.4276755, 0.1981315, 0.5927538, 0.0627451, 0, 1, 1,
0.4283915, -0.5232128, 1.946029, 0.06666667, 0, 1, 1,
0.43209, -1.137018, 3.585541, 0.07450981, 0, 1, 1,
0.4342981, 1.696429, -0.02853535, 0.07843138, 0, 1, 1,
0.4407324, 1.802145, 1.558371, 0.08627451, 0, 1, 1,
0.4421251, -0.719336, 2.477675, 0.09019608, 0, 1, 1,
0.4424758, -0.281309, 0.9885781, 0.09803922, 0, 1, 1,
0.4425404, -1.511202, 3.218559, 0.1058824, 0, 1, 1,
0.4438977, -0.3726565, 2.503195, 0.1098039, 0, 1, 1,
0.4464267, 0.3707078, -0.6610295, 0.1176471, 0, 1, 1,
0.4476763, -1.079152, 3.709178, 0.1215686, 0, 1, 1,
0.4497417, -1.763044, 2.825248, 0.1294118, 0, 1, 1,
0.4546767, -0.2626731, 2.394556, 0.1333333, 0, 1, 1,
0.4621439, -0.7583838, 2.930336, 0.1411765, 0, 1, 1,
0.4637083, 0.6269837, -0.003058565, 0.145098, 0, 1, 1,
0.4638032, 0.8793197, -0.345405, 0.1529412, 0, 1, 1,
0.4678924, 0.1140546, 0.7105691, 0.1568628, 0, 1, 1,
0.4728165, 1.049723, 1.774247, 0.1647059, 0, 1, 1,
0.473462, -1.707577, 3.000338, 0.1686275, 0, 1, 1,
0.4742446, -0.916792, 3.682047, 0.1764706, 0, 1, 1,
0.4762188, -0.4882457, 3.517989, 0.1803922, 0, 1, 1,
0.4768635, 1.91998, -0.5946865, 0.1882353, 0, 1, 1,
0.4782778, -0.334782, 1.645417, 0.1921569, 0, 1, 1,
0.480669, 0.1350998, 2.889024, 0.2, 0, 1, 1,
0.4827775, 0.7066752, 0.3717441, 0.2078431, 0, 1, 1,
0.4843741, 2.823792, -1.964995, 0.2117647, 0, 1, 1,
0.4850979, -1.261424, 3.530245, 0.2196078, 0, 1, 1,
0.4920052, 0.2719949, 3.517463, 0.2235294, 0, 1, 1,
0.4942628, -0.07738099, 2.055329, 0.2313726, 0, 1, 1,
0.505605, -0.3827067, 3.017933, 0.2352941, 0, 1, 1,
0.5134692, -0.2253697, 2.153014, 0.2431373, 0, 1, 1,
0.5149119, 1.436381, 1.303886, 0.2470588, 0, 1, 1,
0.5172077, -0.2861297, 1.627705, 0.254902, 0, 1, 1,
0.5192473, 0.9522681, -0.3248473, 0.2588235, 0, 1, 1,
0.5202758, -0.02215004, 1.200821, 0.2666667, 0, 1, 1,
0.5205086, -1.871219, 2.598183, 0.2705882, 0, 1, 1,
0.5311275, 1.445477, -1.563584, 0.2784314, 0, 1, 1,
0.5315393, -0.4685968, 2.458478, 0.282353, 0, 1, 1,
0.5361289, 0.4930842, 0.475308, 0.2901961, 0, 1, 1,
0.5434631, -1.167286, 2.728423, 0.2941177, 0, 1, 1,
0.5488343, -1.09911, 2.394447, 0.3019608, 0, 1, 1,
0.5489084, -0.5266506, 1.501855, 0.3098039, 0, 1, 1,
0.5520566, -0.4590895, 1.983615, 0.3137255, 0, 1, 1,
0.5522758, -0.9338032, 2.415169, 0.3215686, 0, 1, 1,
0.5536921, 0.713591, 1.438912, 0.3254902, 0, 1, 1,
0.557307, 0.3501154, 0.576506, 0.3333333, 0, 1, 1,
0.5595139, -0.9223906, 2.764608, 0.3372549, 0, 1, 1,
0.560729, -1.223304, 1.960962, 0.345098, 0, 1, 1,
0.5647068, -0.3536666, 2.139503, 0.3490196, 0, 1, 1,
0.5673822, -1.035503, 2.153391, 0.3568628, 0, 1, 1,
0.5759789, -0.7772749, 2.696815, 0.3607843, 0, 1, 1,
0.5774083, 1.461461, -0.3025272, 0.3686275, 0, 1, 1,
0.5825686, 0.1237351, 2.876043, 0.372549, 0, 1, 1,
0.5838947, 1.068313, 0.6433147, 0.3803922, 0, 1, 1,
0.5853825, 0.8982819, 0.7759261, 0.3843137, 0, 1, 1,
0.5883824, -0.6783164, 2.394277, 0.3921569, 0, 1, 1,
0.5892369, 0.9335386, 0.3427471, 0.3960784, 0, 1, 1,
0.5900091, -1.220181, 2.819774, 0.4039216, 0, 1, 1,
0.5900986, 0.09608214, 0.956067, 0.4117647, 0, 1, 1,
0.5908049, 1.603039, 1.498875, 0.4156863, 0, 1, 1,
0.5948418, 0.6218346, 0.3357401, 0.4235294, 0, 1, 1,
0.596765, 0.6641533, 3.200251, 0.427451, 0, 1, 1,
0.604244, 0.9408459, 0.5564258, 0.4352941, 0, 1, 1,
0.6100417, -0.479723, 2.060282, 0.4392157, 0, 1, 1,
0.6122988, -0.2610674, 2.648093, 0.4470588, 0, 1, 1,
0.6154714, -1.254988, 3.501307, 0.4509804, 0, 1, 1,
0.615707, -0.8651638, 2.258475, 0.4588235, 0, 1, 1,
0.6166362, -0.3199404, 0.297013, 0.4627451, 0, 1, 1,
0.6322496, -2.854785, 3.274957, 0.4705882, 0, 1, 1,
0.636051, -0.6781688, 3.00186, 0.4745098, 0, 1, 1,
0.6362768, 0.06904397, 0.9338866, 0.4823529, 0, 1, 1,
0.6399767, -0.3799722, 4.18082, 0.4862745, 0, 1, 1,
0.6443965, -1.424832, 2.89955, 0.4941176, 0, 1, 1,
0.6572965, -1.02337, 0.883884, 0.5019608, 0, 1, 1,
0.6624368, 0.7311464, 1.121578, 0.5058824, 0, 1, 1,
0.6655675, -2.040766, 2.019807, 0.5137255, 0, 1, 1,
0.666024, -0.009532504, 2.061322, 0.5176471, 0, 1, 1,
0.6669953, 0.8435376, 0.1016989, 0.5254902, 0, 1, 1,
0.6678278, 0.08533331, 0.7576986, 0.5294118, 0, 1, 1,
0.6748151, 1.190078, 3.20189, 0.5372549, 0, 1, 1,
0.6806155, -1.003367, 3.799096, 0.5411765, 0, 1, 1,
0.6854993, -1.726791, 1.068758, 0.5490196, 0, 1, 1,
0.6880759, 0.395487, 0.6904433, 0.5529412, 0, 1, 1,
0.6900476, 0.7914229, 0.2681133, 0.5607843, 0, 1, 1,
0.6987817, 0.5920388, -0.3499686, 0.5647059, 0, 1, 1,
0.7032502, 0.0504299, 0.9648271, 0.572549, 0, 1, 1,
0.7041547, -0.1817402, 1.113713, 0.5764706, 0, 1, 1,
0.7066361, -1.571443, 2.727492, 0.5843138, 0, 1, 1,
0.7070181, -0.1673282, 2.226428, 0.5882353, 0, 1, 1,
0.707446, -1.03767, 2.435257, 0.5960785, 0, 1, 1,
0.7115309, -1.875374, 3.603776, 0.6039216, 0, 1, 1,
0.7124329, -0.3137165, 2.002612, 0.6078432, 0, 1, 1,
0.7134317, 0.03292388, 1.023741, 0.6156863, 0, 1, 1,
0.713549, 2.286701, 0.3391083, 0.6196079, 0, 1, 1,
0.7166588, 1.009258, -1.656279, 0.627451, 0, 1, 1,
0.7218155, 0.01312361, 0.9240674, 0.6313726, 0, 1, 1,
0.7232038, 0.2939513, -0.24129, 0.6392157, 0, 1, 1,
0.7256292, 0.2174621, 1.930907, 0.6431373, 0, 1, 1,
0.7259469, -0.4474748, 2.481524, 0.6509804, 0, 1, 1,
0.7292207, 0.06318112, 2.223493, 0.654902, 0, 1, 1,
0.735077, 1.619938, 0.7826724, 0.6627451, 0, 1, 1,
0.7414437, 0.001986575, 1.183599, 0.6666667, 0, 1, 1,
0.7447095, 0.5440595, 2.071624, 0.6745098, 0, 1, 1,
0.7488167, -1.842818, 1.818362, 0.6784314, 0, 1, 1,
0.7525808, -0.6661199, 3.275721, 0.6862745, 0, 1, 1,
0.753974, -0.6600958, 1.200188, 0.6901961, 0, 1, 1,
0.754065, -1.014568, 1.890167, 0.6980392, 0, 1, 1,
0.7571379, -0.5363733, 1.202691, 0.7058824, 0, 1, 1,
0.7581112, 1.256911, -2.278936, 0.7098039, 0, 1, 1,
0.7674519, -1.78156, 1.703565, 0.7176471, 0, 1, 1,
0.7717616, 0.5687125, -0.3066286, 0.7215686, 0, 1, 1,
0.7720462, -2.076714, 3.23221, 0.7294118, 0, 1, 1,
0.7726338, 0.3091604, 2.031138, 0.7333333, 0, 1, 1,
0.7776729, 0.8930812, 1.102295, 0.7411765, 0, 1, 1,
0.7836171, -0.1550427, 3.988157, 0.7450981, 0, 1, 1,
0.7896556, 0.6599347, 0.5238025, 0.7529412, 0, 1, 1,
0.7924946, -1.483274, 1.993922, 0.7568628, 0, 1, 1,
0.7987648, 0.1344369, 1.495967, 0.7647059, 0, 1, 1,
0.7990316, -0.3463654, 2.67601, 0.7686275, 0, 1, 1,
0.8007817, -0.9581293, 3.67419, 0.7764706, 0, 1, 1,
0.8044479, -0.3400353, 0.5233165, 0.7803922, 0, 1, 1,
0.8066513, -0.8264309, 2.893397, 0.7882353, 0, 1, 1,
0.8072748, 1.44224, 1.440484, 0.7921569, 0, 1, 1,
0.8272477, -0.2588146, 0.8275453, 0.8, 0, 1, 1,
0.8273474, -0.8379149, 0.665394, 0.8078431, 0, 1, 1,
0.8315961, -0.2391192, 1.955403, 0.8117647, 0, 1, 1,
0.8352375, -0.5535591, 1.39988, 0.8196079, 0, 1, 1,
0.8373336, -0.05077937, 0.5113608, 0.8235294, 0, 1, 1,
0.8397137, -0.8292695, 2.30915, 0.8313726, 0, 1, 1,
0.8420767, 0.1321486, 1.989715, 0.8352941, 0, 1, 1,
0.8465147, -2.08642, 1.679664, 0.8431373, 0, 1, 1,
0.8481659, -0.6535836, 2.73667, 0.8470588, 0, 1, 1,
0.8508821, -1.307237, 3.02537, 0.854902, 0, 1, 1,
0.8591115, -0.7438422, 1.231151, 0.8588235, 0, 1, 1,
0.8603664, -0.03451518, 1.250503, 0.8666667, 0, 1, 1,
0.8606592, -1.39085, 1.627113, 0.8705882, 0, 1, 1,
0.865748, -1.282297, 2.141163, 0.8784314, 0, 1, 1,
0.8764311, 0.2131788, 0.4518349, 0.8823529, 0, 1, 1,
0.8792271, -0.2430998, 1.582216, 0.8901961, 0, 1, 1,
0.8800334, 1.041284, 2.111433, 0.8941177, 0, 1, 1,
0.8857343, 0.2813944, 0.0086357, 0.9019608, 0, 1, 1,
0.8918689, -0.5718053, 2.443407, 0.9098039, 0, 1, 1,
0.8924265, 0.8111523, 0.2167857, 0.9137255, 0, 1, 1,
0.8929001, 0.9873872, 2.057544, 0.9215686, 0, 1, 1,
0.8933908, 0.3424012, 2.055126, 0.9254902, 0, 1, 1,
0.8964691, 0.5775247, 1.230459, 0.9333333, 0, 1, 1,
0.8985413, -0.693689, 2.196277, 0.9372549, 0, 1, 1,
0.9027837, -0.7512053, 0.993209, 0.945098, 0, 1, 1,
0.9062217, -0.4386519, 1.128732, 0.9490196, 0, 1, 1,
0.9084319, -0.423679, 1.983651, 0.9568627, 0, 1, 1,
0.9199134, -0.6937892, 0.5275052, 0.9607843, 0, 1, 1,
0.9223543, -0.3214386, 1.896386, 0.9686275, 0, 1, 1,
0.9295163, -0.4463065, 1.843666, 0.972549, 0, 1, 1,
0.9322576, -1.697144, 2.91688, 0.9803922, 0, 1, 1,
0.9440643, 0.6143305, 1.102628, 0.9843137, 0, 1, 1,
0.9497797, 0.238113, 2.605962, 0.9921569, 0, 1, 1,
0.9510896, -0.1668966, 1.140784, 0.9960784, 0, 1, 1,
0.9512063, -1.073468, 1.962799, 1, 0, 0.9960784, 1,
0.9593562, 0.913289, 0.05016996, 1, 0, 0.9882353, 1,
0.9632813, 0.0244044, 0.4508356, 1, 0, 0.9843137, 1,
0.9657152, -0.1458413, 2.543752, 1, 0, 0.9764706, 1,
0.9678546, 0.5788233, -1.16418, 1, 0, 0.972549, 1,
0.9686823, 0.5724441, 1.492443, 1, 0, 0.9647059, 1,
0.9765634, 0.7337164, 1.390005, 1, 0, 0.9607843, 1,
0.9825472, 1.312314, 0.3367785, 1, 0, 0.9529412, 1,
0.9865117, -1.271987, 1.713355, 1, 0, 0.9490196, 1,
0.9884173, -0.1295166, 0.2331276, 1, 0, 0.9411765, 1,
0.9890618, -0.2060509, 1.579923, 1, 0, 0.9372549, 1,
0.9914245, 0.124852, 0.5443168, 1, 0, 0.9294118, 1,
0.9971694, -0.8836103, 3.45248, 1, 0, 0.9254902, 1,
1.001132, -1.775372, 2.9814, 1, 0, 0.9176471, 1,
1.002489, -0.9157602, 2.892745, 1, 0, 0.9137255, 1,
1.0031, -1.489213, 5.555234, 1, 0, 0.9058824, 1,
1.007678, 0.3094237, 0.9881502, 1, 0, 0.9019608, 1,
1.012741, 2.366515, 0.493692, 1, 0, 0.8941177, 1,
1.013339, 0.5608922, 2.024639, 1, 0, 0.8862745, 1,
1.019064, -1.736379, 4.471767, 1, 0, 0.8823529, 1,
1.032736, -0.8504635, 3.060307, 1, 0, 0.8745098, 1,
1.033388, -0.03851721, 4.448187, 1, 0, 0.8705882, 1,
1.033583, 0.2749909, 0.8789105, 1, 0, 0.8627451, 1,
1.043746, 0.3039006, 1.619386, 1, 0, 0.8588235, 1,
1.053685, 0.7784258, 1.76751, 1, 0, 0.8509804, 1,
1.055314, -0.2113054, 1.985642, 1, 0, 0.8470588, 1,
1.055572, -1.79855, 2.530321, 1, 0, 0.8392157, 1,
1.057361, -0.3052204, 1.479798, 1, 0, 0.8352941, 1,
1.06494, -0.316306, 0.08748338, 1, 0, 0.827451, 1,
1.06588, -0.9872801, 1.616034, 1, 0, 0.8235294, 1,
1.076934, 0.6319045, 3.020242, 1, 0, 0.8156863, 1,
1.078009, 0.7359555, 0.6408581, 1, 0, 0.8117647, 1,
1.081881, -1.608568, 1.076496, 1, 0, 0.8039216, 1,
1.082608, -0.8230211, 2.843504, 1, 0, 0.7960784, 1,
1.090242, 0.471322, 2.406169, 1, 0, 0.7921569, 1,
1.099391, 0.09250486, -0.1124914, 1, 0, 0.7843137, 1,
1.102977, -0.5004255, 0.8195803, 1, 0, 0.7803922, 1,
1.111487, -0.9315515, 1.965876, 1, 0, 0.772549, 1,
1.131716, 0.5802547, 1.808425, 1, 0, 0.7686275, 1,
1.151409, 1.162857, -0.5603588, 1, 0, 0.7607843, 1,
1.160152, 1.341577, 0.6844473, 1, 0, 0.7568628, 1,
1.170352, -0.6719722, 2.125329, 1, 0, 0.7490196, 1,
1.170847, -0.4840091, 1.941212, 1, 0, 0.7450981, 1,
1.173703, 0.252634, 2.391978, 1, 0, 0.7372549, 1,
1.173984, 1.11784, 1.253938, 1, 0, 0.7333333, 1,
1.181741, -0.5346144, 3.28359, 1, 0, 0.7254902, 1,
1.18488, 0.7856194, 0.6150662, 1, 0, 0.7215686, 1,
1.189746, 0.6509699, 0.8081664, 1, 0, 0.7137255, 1,
1.194672, -1.213515, 0.8866071, 1, 0, 0.7098039, 1,
1.205855, -0.5553086, 2.484964, 1, 0, 0.7019608, 1,
1.21761, -1.601388, 1.570376, 1, 0, 0.6941177, 1,
1.219845, 2.209395, 1.533232, 1, 0, 0.6901961, 1,
1.225134, -0.5316615, 2.034866, 1, 0, 0.682353, 1,
1.226293, -0.8486359, 1.624324, 1, 0, 0.6784314, 1,
1.229605, 0.8826573, 2.15844, 1, 0, 0.6705883, 1,
1.234506, -1.774421, 2.651214, 1, 0, 0.6666667, 1,
1.237037, 1.512916, 0.7765945, 1, 0, 0.6588235, 1,
1.241518, 0.7578993, 2.037403, 1, 0, 0.654902, 1,
1.242801, -0.5987126, 1.798832, 1, 0, 0.6470588, 1,
1.256303, -0.6794374, 2.227784, 1, 0, 0.6431373, 1,
1.261327, 0.2134272, 1.358512, 1, 0, 0.6352941, 1,
1.269489, 0.1582367, 0.4937377, 1, 0, 0.6313726, 1,
1.287347, 1.3037, 1.797296, 1, 0, 0.6235294, 1,
1.289556, 0.4150004, 0.1290721, 1, 0, 0.6196079, 1,
1.289739, -0.5803895, 1.870542, 1, 0, 0.6117647, 1,
1.29275, 0.4352531, 0.8405495, 1, 0, 0.6078432, 1,
1.297778, -0.7695793, 1.867436, 1, 0, 0.6, 1,
1.307963, -0.5571504, 4.905048, 1, 0, 0.5921569, 1,
1.311669, 0.07055338, 0.5818766, 1, 0, 0.5882353, 1,
1.313856, -0.8743143, 2.364862, 1, 0, 0.5803922, 1,
1.318713, -0.1633186, 1.781152, 1, 0, 0.5764706, 1,
1.320377, 1.258754, 0.1708259, 1, 0, 0.5686275, 1,
1.320829, 0.3742541, 1.602553, 1, 0, 0.5647059, 1,
1.321046, -0.08131927, 3.814209, 1, 0, 0.5568628, 1,
1.327074, 1.889097, 0.2775229, 1, 0, 0.5529412, 1,
1.341488, -2.59094, 2.265056, 1, 0, 0.5450981, 1,
1.345024, 0.3525617, 1.712242, 1, 0, 0.5411765, 1,
1.347552, -0.486437, 3.072015, 1, 0, 0.5333334, 1,
1.348819, -1.1143, 1.281166, 1, 0, 0.5294118, 1,
1.349761, -1.329645, 2.834623, 1, 0, 0.5215687, 1,
1.355929, 0.228298, 0.9375197, 1, 0, 0.5176471, 1,
1.35683, -0.2871733, 1.92754, 1, 0, 0.509804, 1,
1.361535, 0.5391253, 2.001903, 1, 0, 0.5058824, 1,
1.366424, -1.782466, 3.060124, 1, 0, 0.4980392, 1,
1.36893, -0.3099001, 1.291366, 1, 0, 0.4901961, 1,
1.370339, -0.6562393, 2.347279, 1, 0, 0.4862745, 1,
1.370667, 0.1956865, 2.238359, 1, 0, 0.4784314, 1,
1.382256, -1.548711, 2.662035, 1, 0, 0.4745098, 1,
1.39311, -0.5169616, 1.613825, 1, 0, 0.4666667, 1,
1.393681, 1.294188, 0.9817392, 1, 0, 0.4627451, 1,
1.394447, -1.450911, 1.293656, 1, 0, 0.454902, 1,
1.39957, -1.217365, 2.518183, 1, 0, 0.4509804, 1,
1.401513, 1.427196, 1.004221, 1, 0, 0.4431373, 1,
1.405676, 0.8701307, 0.5067644, 1, 0, 0.4392157, 1,
1.408874, -0.6132998, 1.994962, 1, 0, 0.4313726, 1,
1.411213, 0.4348864, -0.9120076, 1, 0, 0.427451, 1,
1.415065, 0.4475105, 2.204315, 1, 0, 0.4196078, 1,
1.416303, 1.000703, 0.05586859, 1, 0, 0.4156863, 1,
1.42468, 0.1761504, 2.894608, 1, 0, 0.4078431, 1,
1.437352, 0.5318233, -0.2666502, 1, 0, 0.4039216, 1,
1.447676, -1.276021, 3.41982, 1, 0, 0.3960784, 1,
1.463022, -2.118558, 3.017643, 1, 0, 0.3882353, 1,
1.466781, 1.906433, 1.486087, 1, 0, 0.3843137, 1,
1.47801, -1.073897, 2.802563, 1, 0, 0.3764706, 1,
1.487778, 1.774757, 0.6426379, 1, 0, 0.372549, 1,
1.488906, 0.951203, 0.3936096, 1, 0, 0.3647059, 1,
1.496142, 1.795627, 2.252965, 1, 0, 0.3607843, 1,
1.500837, -0.9333192, 0.3654334, 1, 0, 0.3529412, 1,
1.505209, 0.1574496, 1.411518, 1, 0, 0.3490196, 1,
1.508146, 0.09398345, 0.9867027, 1, 0, 0.3411765, 1,
1.509735, -1.623533, 1.242092, 1, 0, 0.3372549, 1,
1.511768, -0.1410924, 1.958022, 1, 0, 0.3294118, 1,
1.538797, -1.168412, 2.976671, 1, 0, 0.3254902, 1,
1.545222, -0.403348, 3.128162, 1, 0, 0.3176471, 1,
1.551015, 1.056971, 0.3820745, 1, 0, 0.3137255, 1,
1.55281, 1.085901, 1.85242, 1, 0, 0.3058824, 1,
1.556278, -1.109951, 2.411725, 1, 0, 0.2980392, 1,
1.562935, -0.1636439, 3.304468, 1, 0, 0.2941177, 1,
1.568552, 1.560113, 0.2960352, 1, 0, 0.2862745, 1,
1.571665, 0.8907306, 1.421521, 1, 0, 0.282353, 1,
1.581447, -0.6122487, 2.365009, 1, 0, 0.2745098, 1,
1.588741, -0.2955134, 1.571316, 1, 0, 0.2705882, 1,
1.600921, 0.3466617, 1.406681, 1, 0, 0.2627451, 1,
1.602527, 0.6156741, 0.5778171, 1, 0, 0.2588235, 1,
1.619889, 2.050454, 0.06620003, 1, 0, 0.2509804, 1,
1.676625, 0.5511479, 2.08933, 1, 0, 0.2470588, 1,
1.691872, 0.108689, 1.545707, 1, 0, 0.2392157, 1,
1.702941, -0.7594953, 2.086769, 1, 0, 0.2352941, 1,
1.715824, 0.3017772, 1.948689, 1, 0, 0.227451, 1,
1.718527, -0.1497744, 1.651648, 1, 0, 0.2235294, 1,
1.767201, -0.5286331, 0.5489769, 1, 0, 0.2156863, 1,
1.78418, -0.238167, 2.967161, 1, 0, 0.2117647, 1,
1.787061, 1.966881, 1.716914, 1, 0, 0.2039216, 1,
1.787605, -1.335449, 1.687544, 1, 0, 0.1960784, 1,
1.809116, 1.222753, 0.007761279, 1, 0, 0.1921569, 1,
1.821295, -0.6182941, 0.8683913, 1, 0, 0.1843137, 1,
1.827604, 0.02450174, 1.50181, 1, 0, 0.1803922, 1,
1.828324, 2.404454, 0.5483132, 1, 0, 0.172549, 1,
1.836856, -0.4297012, 0.9889404, 1, 0, 0.1686275, 1,
1.844465, 0.333747, 2.880803, 1, 0, 0.1607843, 1,
1.85642, -1.175186, 3.849909, 1, 0, 0.1568628, 1,
1.900462, -1.181119, 1.385838, 1, 0, 0.1490196, 1,
1.904027, -0.7982968, 0.7588756, 1, 0, 0.145098, 1,
1.933957, 0.4655103, 1.376458, 1, 0, 0.1372549, 1,
1.951074, 2.205478, -1.376632, 1, 0, 0.1333333, 1,
1.955771, -0.2188794, 1.832447, 1, 0, 0.1254902, 1,
1.970711, 1.374901, -0.1005413, 1, 0, 0.1215686, 1,
1.976347, 0.6808565, 0.6884406, 1, 0, 0.1137255, 1,
1.978932, 1.506601, -0.4687178, 1, 0, 0.1098039, 1,
1.98834, 0.2323532, 2.05473, 1, 0, 0.1019608, 1,
2.002231, -0.8384721, 2.090844, 1, 0, 0.09411765, 1,
2.004679, -0.8853453, 1.837581, 1, 0, 0.09019608, 1,
2.082829, 0.5928946, 0.3544958, 1, 0, 0.08235294, 1,
2.105738, 0.289398, 0.570291, 1, 0, 0.07843138, 1,
2.116248, -0.03543979, 1.786086, 1, 0, 0.07058824, 1,
2.135121, 0.8595188, 0.3327543, 1, 0, 0.06666667, 1,
2.149559, 1.138251, 1.196444, 1, 0, 0.05882353, 1,
2.204531, -0.2083743, -0.5394708, 1, 0, 0.05490196, 1,
2.211213, -0.7945569, 1.43009, 1, 0, 0.04705882, 1,
2.370922, 0.2079938, 0.8144591, 1, 0, 0.04313726, 1,
2.373746, -1.642073, 3.218047, 1, 0, 0.03529412, 1,
2.385803, 0.5977866, 2.902133, 1, 0, 0.03137255, 1,
2.529869, -0.5255489, 0.6885512, 1, 0, 0.02352941, 1,
2.552651, 0.9065432, 1.801183, 1, 0, 0.01960784, 1,
2.708452, 0.2731092, 1.592478, 1, 0, 0.01176471, 1,
2.991146, 0.3661641, 1.04025, 1, 0, 0.007843138, 1
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
-0.5163835, -4.096232, -8.063094, 0, -0.5, 0.5, 0.5,
-0.5163835, -4.096232, -8.063094, 1, -0.5, 0.5, 0.5,
-0.5163835, -4.096232, -8.063094, 1, 1.5, 0.5, 0.5,
-0.5163835, -4.096232, -8.063094, 0, 1.5, 0.5, 0.5
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
-5.212965, -0.1347481, -8.063094, 0, -0.5, 0.5, 0.5,
-5.212965, -0.1347481, -8.063094, 1, -0.5, 0.5, 0.5,
-5.212965, -0.1347481, -8.063094, 1, 1.5, 0.5, 0.5,
-5.212965, -0.1347481, -8.063094, 0, 1.5, 0.5, 0.5
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
-5.212965, -4.096232, -0.2670524, 0, -0.5, 0.5, 0.5,
-5.212965, -4.096232, -0.2670524, 1, -0.5, 0.5, 0.5,
-5.212965, -4.096232, -0.2670524, 1, 1.5, 0.5, 0.5,
-5.212965, -4.096232, -0.2670524, 0, 1.5, 0.5, 0.5
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
-4, -3.182044, -6.264008,
2, -3.182044, -6.264008,
-4, -3.182044, -6.264008,
-4, -3.334409, -6.563856,
-2, -3.182044, -6.264008,
-2, -3.334409, -6.563856,
0, -3.182044, -6.264008,
0, -3.334409, -6.563856,
2, -3.182044, -6.264008,
2, -3.334409, -6.563856
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
"-4",
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
-4, -3.639138, -7.163551, 0, -0.5, 0.5, 0.5,
-4, -3.639138, -7.163551, 1, -0.5, 0.5, 0.5,
-4, -3.639138, -7.163551, 1, 1.5, 0.5, 0.5,
-4, -3.639138, -7.163551, 0, 1.5, 0.5, 0.5,
-2, -3.639138, -7.163551, 0, -0.5, 0.5, 0.5,
-2, -3.639138, -7.163551, 1, -0.5, 0.5, 0.5,
-2, -3.639138, -7.163551, 1, 1.5, 0.5, 0.5,
-2, -3.639138, -7.163551, 0, 1.5, 0.5, 0.5,
0, -3.639138, -7.163551, 0, -0.5, 0.5, 0.5,
0, -3.639138, -7.163551, 1, -0.5, 0.5, 0.5,
0, -3.639138, -7.163551, 1, 1.5, 0.5, 0.5,
0, -3.639138, -7.163551, 0, 1.5, 0.5, 0.5,
2, -3.639138, -7.163551, 0, -0.5, 0.5, 0.5,
2, -3.639138, -7.163551, 1, -0.5, 0.5, 0.5,
2, -3.639138, -7.163551, 1, 1.5, 0.5, 0.5,
2, -3.639138, -7.163551, 0, 1.5, 0.5, 0.5
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
-4.129139, -3, -6.264008,
-4.129139, 2, -6.264008,
-4.129139, -3, -6.264008,
-4.309777, -3, -6.563856,
-4.129139, -2, -6.264008,
-4.309777, -2, -6.563856,
-4.129139, -1, -6.264008,
-4.309777, -1, -6.563856,
-4.129139, 0, -6.264008,
-4.309777, 0, -6.563856,
-4.129139, 1, -6.264008,
-4.309777, 1, -6.563856,
-4.129139, 2, -6.264008,
-4.309777, 2, -6.563856
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
-4.671052, -3, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, -3, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, -3, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, -3, -7.163551, 0, 1.5, 0.5, 0.5,
-4.671052, -2, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, -2, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, -2, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, -2, -7.163551, 0, 1.5, 0.5, 0.5,
-4.671052, -1, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, -1, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, -1, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, -1, -7.163551, 0, 1.5, 0.5, 0.5,
-4.671052, 0, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, 0, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, 0, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, 0, -7.163551, 0, 1.5, 0.5, 0.5,
-4.671052, 1, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, 1, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, 1, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, 1, -7.163551, 0, 1.5, 0.5, 0.5,
-4.671052, 2, -7.163551, 0, -0.5, 0.5, 0.5,
-4.671052, 2, -7.163551, 1, -0.5, 0.5, 0.5,
-4.671052, 2, -7.163551, 1, 1.5, 0.5, 0.5,
-4.671052, 2, -7.163551, 0, 1.5, 0.5, 0.5
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
-4.129139, -3.182044, -6,
-4.129139, -3.182044, 4,
-4.129139, -3.182044, -6,
-4.309777, -3.334409, -6,
-4.129139, -3.182044, -4,
-4.309777, -3.334409, -4,
-4.129139, -3.182044, -2,
-4.309777, -3.334409, -2,
-4.129139, -3.182044, 0,
-4.309777, -3.334409, 0,
-4.129139, -3.182044, 2,
-4.309777, -3.334409, 2,
-4.129139, -3.182044, 4,
-4.309777, -3.334409, 4
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
-4.671052, -3.639138, -6, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -6, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -6, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, -6, 0, 1.5, 0.5, 0.5,
-4.671052, -3.639138, -4, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -4, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -4, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, -4, 0, 1.5, 0.5, 0.5,
-4.671052, -3.639138, -2, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -2, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, -2, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, -2, 0, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 0, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 0, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 0, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 0, 0, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 2, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 2, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 2, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 2, 0, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 4, 0, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 4, 1, -0.5, 0.5, 0.5,
-4.671052, -3.639138, 4, 1, 1.5, 0.5, 0.5,
-4.671052, -3.639138, 4, 0, 1.5, 0.5, 0.5
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
-4.129139, -3.182044, -6.264008,
-4.129139, 2.912548, -6.264008,
-4.129139, -3.182044, 5.729903,
-4.129139, 2.912548, 5.729903,
-4.129139, -3.182044, -6.264008,
-4.129139, -3.182044, 5.729903,
-4.129139, 2.912548, -6.264008,
-4.129139, 2.912548, 5.729903,
-4.129139, -3.182044, -6.264008,
3.096372, -3.182044, -6.264008,
-4.129139, -3.182044, 5.729903,
3.096372, -3.182044, 5.729903,
-4.129139, 2.912548, -6.264008,
3.096372, 2.912548, -6.264008,
-4.129139, 2.912548, 5.729903,
3.096372, 2.912548, 5.729903,
3.096372, -3.182044, -6.264008,
3.096372, 2.912548, -6.264008,
3.096372, -3.182044, 5.729903,
3.096372, 2.912548, 5.729903,
3.096372, -3.182044, -6.264008,
3.096372, -3.182044, 5.729903,
3.096372, 2.912548, -6.264008,
3.096372, 2.912548, 5.729903
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
var radius = 8.154461;
var distance = 36.28012;
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
mvMatrix.translate( 0.5163835, 0.1347481, 0.2670524 );
mvMatrix.scale( 1.220227, 1.446654, 0.7351033 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.28012);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Cinerin_I<-read.table("Cinerin_I.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cinerin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cinerin_I' not found
```

```r
y<-Cinerin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cinerin_I' not found
```

```r
z<-Cinerin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cinerin_I' not found
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
-4.023913, -1.169198, -0.7110863, 0, 0, 1, 1, 1,
-2.682649, 0.2791685, -2.639355, 1, 0, 0, 1, 1,
-2.581735, -0.2580223, -1.755504, 1, 0, 0, 1, 1,
-2.403575, -1.410847, -1.938766, 1, 0, 0, 1, 1,
-2.337636, 0.9448742, -3.09796, 1, 0, 0, 1, 1,
-2.289607, -0.4602048, -2.21891, 1, 0, 0, 1, 1,
-2.251348, 0.1718341, -1.588695, 0, 0, 0, 1, 1,
-2.227736, 0.7087102, -0.4332001, 0, 0, 0, 1, 1,
-2.11749, 0.9474145, -0.1992459, 0, 0, 0, 1, 1,
-2.063409, 0.7289232, -1.608828, 0, 0, 0, 1, 1,
-2.054059, 0.8141761, -0.9005797, 0, 0, 0, 1, 1,
-2.049071, 0.8862792, -0.6181387, 0, 0, 0, 1, 1,
-2.037575, 0.8850689, -0.8913329, 0, 0, 0, 1, 1,
-2.01391, 1.241894, -0.05437578, 1, 1, 1, 1, 1,
-2.011886, -1.063175, -1.038093, 1, 1, 1, 1, 1,
-2.009935, 1.530666, 0.5509266, 1, 1, 1, 1, 1,
-2.00516, 0.3432061, 0.3434893, 1, 1, 1, 1, 1,
-2.004665, 0.518203, -0.08645655, 1, 1, 1, 1, 1,
-2.003815, 0.4484561, -1.281745, 1, 1, 1, 1, 1,
-1.995332, -1.149311, -3.611091, 1, 1, 1, 1, 1,
-1.967341, 1.340393, -1.313642, 1, 1, 1, 1, 1,
-1.959265, -0.8515417, -2.827555, 1, 1, 1, 1, 1,
-1.940652, -0.7254484, -2.880794, 1, 1, 1, 1, 1,
-1.927657, -0.7170161, -0.908856, 1, 1, 1, 1, 1,
-1.913195, -0.3691214, -2.035756, 1, 1, 1, 1, 1,
-1.908773, 0.2351764, -1.04516, 1, 1, 1, 1, 1,
-1.894426, -0.3558885, -1.035012, 1, 1, 1, 1, 1,
-1.883578, -1.492473, -0.8613043, 1, 1, 1, 1, 1,
-1.8784, -0.3072032, -1.41683, 0, 0, 1, 1, 1,
-1.877829, 1.227285, -1.579859, 1, 0, 0, 1, 1,
-1.863381, -0.4726811, -3.928891, 1, 0, 0, 1, 1,
-1.851264, 0.549271, -0.4137795, 1, 0, 0, 1, 1,
-1.845157, -0.08347898, -2.683623, 1, 0, 0, 1, 1,
-1.839599, 0.333317, -1.740573, 1, 0, 0, 1, 1,
-1.834535, 0.7968299, -1.521326, 0, 0, 0, 1, 1,
-1.822106, -1.090472, -2.310455, 0, 0, 0, 1, 1,
-1.810966, 0.3565704, -0.7866666, 0, 0, 0, 1, 1,
-1.768989, 1.599143, -1.498432, 0, 0, 0, 1, 1,
-1.766343, 0.5014509, -1.775055, 0, 0, 0, 1, 1,
-1.731537, 0.8722538, -0.5404453, 0, 0, 0, 1, 1,
-1.710104, -2.471346, -2.965687, 0, 0, 0, 1, 1,
-1.695157, 2.286831, -0.8425843, 1, 1, 1, 1, 1,
-1.667672, 1.027767, -0.3844806, 1, 1, 1, 1, 1,
-1.659251, -0.7653327, -3.520635, 1, 1, 1, 1, 1,
-1.655373, -1.747019, -1.912031, 1, 1, 1, 1, 1,
-1.652204, 0.1828964, -0.195385, 1, 1, 1, 1, 1,
-1.650233, 1.730375, -0.4458384, 1, 1, 1, 1, 1,
-1.649979, 0.7173184, -2.396779, 1, 1, 1, 1, 1,
-1.644345, 0.9542807, -1.812491, 1, 1, 1, 1, 1,
-1.633683, 0.1922835, -1.569783, 1, 1, 1, 1, 1,
-1.627619, -0.2637478, -0.1048813, 1, 1, 1, 1, 1,
-1.622533, -0.4897934, -2.326908, 1, 1, 1, 1, 1,
-1.614038, 2.452042, 0.7064489, 1, 1, 1, 1, 1,
-1.607327, -0.776984, -2.856848, 1, 1, 1, 1, 1,
-1.602289, 0.09047364, -0.9493228, 1, 1, 1, 1, 1,
-1.600221, -0.3463418, -1.872066, 1, 1, 1, 1, 1,
-1.599791, -0.6843333, -1.413048, 0, 0, 1, 1, 1,
-1.594604, 0.5079126, -0.1044107, 1, 0, 0, 1, 1,
-1.592252, 1.133599, -1.048639, 1, 0, 0, 1, 1,
-1.586566, 0.4526225, -2.806656, 1, 0, 0, 1, 1,
-1.583477, -0.7993433, -0.9039416, 1, 0, 0, 1, 1,
-1.57773, 0.9472533, -1.650783, 1, 0, 0, 1, 1,
-1.56559, -0.8782246, -1.589875, 0, 0, 0, 1, 1,
-1.56398, 1.158638, 0.8313377, 0, 0, 0, 1, 1,
-1.560597, 0.2429663, -0.2318628, 0, 0, 0, 1, 1,
-1.555013, 0.3944889, -1.307627, 0, 0, 0, 1, 1,
-1.534099, 1.10916, 0.3441411, 0, 0, 0, 1, 1,
-1.513397, 0.1138017, -2.311131, 0, 0, 0, 1, 1,
-1.507182, 0.6088743, 0.5425876, 0, 0, 0, 1, 1,
-1.504481, -1.195234, -0.4899386, 1, 1, 1, 1, 1,
-1.504275, 0.8133171, -1.730688, 1, 1, 1, 1, 1,
-1.498317, 1.89252, -1.102048, 1, 1, 1, 1, 1,
-1.492136, -0.5238149, -3.470529, 1, 1, 1, 1, 1,
-1.491215, 0.7138245, -1.492149, 1, 1, 1, 1, 1,
-1.46602, 2.176869, -0.9644699, 1, 1, 1, 1, 1,
-1.459955, -0.7721608, -3.451623, 1, 1, 1, 1, 1,
-1.459617, -1.722515, -2.509675, 1, 1, 1, 1, 1,
-1.4588, 0.7713272, -0.2037372, 1, 1, 1, 1, 1,
-1.45494, -0.0001076224, -2.606459, 1, 1, 1, 1, 1,
-1.454929, 1.741534, -0.3533154, 1, 1, 1, 1, 1,
-1.448199, 0.05783472, -1.864114, 1, 1, 1, 1, 1,
-1.438166, 0.5483339, -0.9902279, 1, 1, 1, 1, 1,
-1.432733, -0.5940962, 0.08918425, 1, 1, 1, 1, 1,
-1.431348, -0.75792, -2.62229, 1, 1, 1, 1, 1,
-1.428866, -1.13539, -3.709677, 0, 0, 1, 1, 1,
-1.416674, -0.7828646, -2.115058, 1, 0, 0, 1, 1,
-1.416345, -0.02579085, -1.445204, 1, 0, 0, 1, 1,
-1.408213, 1.267416, -0.3724259, 1, 0, 0, 1, 1,
-1.394437, -0.4464378, -2.101697, 1, 0, 0, 1, 1,
-1.392812, -0.4719753, -0.9684204, 1, 0, 0, 1, 1,
-1.391186, -0.6505873, -1.942227, 0, 0, 0, 1, 1,
-1.385814, -0.7751182, -2.608126, 0, 0, 0, 1, 1,
-1.377153, 0.8072845, 0.1536616, 0, 0, 0, 1, 1,
-1.372294, -0.9527757, -2.076619, 0, 0, 0, 1, 1,
-1.371135, 1.514221, -0.9173585, 0, 0, 0, 1, 1,
-1.369115, 0.5366138, -3.011297, 0, 0, 0, 1, 1,
-1.362713, 0.9811944, -1.551129, 0, 0, 0, 1, 1,
-1.35193, 0.5610988, -1.748826, 1, 1, 1, 1, 1,
-1.347367, -0.06323013, -0.9593698, 1, 1, 1, 1, 1,
-1.347075, 1.304325, 0.8295275, 1, 1, 1, 1, 1,
-1.341989, 1.176883, -1.500239, 1, 1, 1, 1, 1,
-1.331254, 0.7476118, 0.3501465, 1, 1, 1, 1, 1,
-1.328352, 0.1264205, -0.9004842, 1, 1, 1, 1, 1,
-1.316991, 0.1796633, -1.544534, 1, 1, 1, 1, 1,
-1.311882, -1.98632, -1.775124, 1, 1, 1, 1, 1,
-1.310871, 0.8711929, -1.224638, 1, 1, 1, 1, 1,
-1.310487, 1.294858, -2.066249, 1, 1, 1, 1, 1,
-1.302256, 0.8480963, -0.2777978, 1, 1, 1, 1, 1,
-1.295368, -0.5488214, -2.598042, 1, 1, 1, 1, 1,
-1.293487, -0.2570132, -2.870507, 1, 1, 1, 1, 1,
-1.279892, -0.3531028, -0.3443967, 1, 1, 1, 1, 1,
-1.278152, 0.8783177, -1.059119, 1, 1, 1, 1, 1,
-1.27796, 0.3213835, -0.8771971, 0, 0, 1, 1, 1,
-1.274123, -3.093288, -3.86344, 1, 0, 0, 1, 1,
-1.273453, -0.994221, -2.029384, 1, 0, 0, 1, 1,
-1.248356, 0.4301201, -1.027662, 1, 0, 0, 1, 1,
-1.243483, 0.5820143, -1.912421, 1, 0, 0, 1, 1,
-1.241069, -1.377189, -2.25604, 1, 0, 0, 1, 1,
-1.239321, -0.1503318, -2.168939, 0, 0, 0, 1, 1,
-1.238708, -1.162939, -2.18602, 0, 0, 0, 1, 1,
-1.237752, -1.811621, -2.406819, 0, 0, 0, 1, 1,
-1.235941, 1.049645, -0.1140208, 0, 0, 0, 1, 1,
-1.235532, 0.9390553, -1.06682, 0, 0, 0, 1, 1,
-1.231038, 0.0545818, -1.794186, 0, 0, 0, 1, 1,
-1.222309, -1.344718, -4.11776, 0, 0, 0, 1, 1,
-1.221716, -0.9019502, -3.766177, 1, 1, 1, 1, 1,
-1.209765, -0.5223683, -1.67619, 1, 1, 1, 1, 1,
-1.209283, -1.901476, -1.987788, 1, 1, 1, 1, 1,
-1.204969, 0.4100648, -1.308199, 1, 1, 1, 1, 1,
-1.198258, 1.535876, -1.129726, 1, 1, 1, 1, 1,
-1.193759, -0.8602998, -1.093105, 1, 1, 1, 1, 1,
-1.188023, 1.123767, 0.6876044, 1, 1, 1, 1, 1,
-1.185721, -1.364829, -3.001157, 1, 1, 1, 1, 1,
-1.176537, 0.04017504, -2.198773, 1, 1, 1, 1, 1,
-1.176347, -2.302584, -2.677853, 1, 1, 1, 1, 1,
-1.16933, -1.783667, -1.416049, 1, 1, 1, 1, 1,
-1.161868, 0.1854439, -1.66494, 1, 1, 1, 1, 1,
-1.148253, -0.6641985, -3.07939, 1, 1, 1, 1, 1,
-1.147851, -0.3193482, -2.181557, 1, 1, 1, 1, 1,
-1.144506, 0.8050121, -2.175051, 1, 1, 1, 1, 1,
-1.142484, 0.4277754, -0.231802, 0, 0, 1, 1, 1,
-1.141868, 0.876366, -1.022593, 1, 0, 0, 1, 1,
-1.140696, -0.4427803, -1.647983, 1, 0, 0, 1, 1,
-1.127996, 1.32608, -1.537951, 1, 0, 0, 1, 1,
-1.127448, 0.07508346, -0.4885246, 1, 0, 0, 1, 1,
-1.126545, -0.09416436, -2.10787, 1, 0, 0, 1, 1,
-1.125942, -0.4980047, -1.410163, 0, 0, 0, 1, 1,
-1.124963, -0.9462261, -2.620814, 0, 0, 0, 1, 1,
-1.120086, -0.1303972, -2.216367, 0, 0, 0, 1, 1,
-1.117751, -0.06990761, 0.5560228, 0, 0, 0, 1, 1,
-1.115746, 0.1625844, -1.491762, 0, 0, 0, 1, 1,
-1.109568, 0.8221106, -0.5328697, 0, 0, 0, 1, 1,
-1.107932, 1.245044, 0.1147894, 0, 0, 0, 1, 1,
-1.105167, 2.369793, -2.258982, 1, 1, 1, 1, 1,
-1.103675, -0.02320314, 0.7346033, 1, 1, 1, 1, 1,
-1.096687, -0.1652408, -1.499476, 1, 1, 1, 1, 1,
-1.095972, 0.01570823, -3.212364, 1, 1, 1, 1, 1,
-1.072711, 0.8208016, 0.02802305, 1, 1, 1, 1, 1,
-1.070359, -0.7017547, -4.208638, 1, 1, 1, 1, 1,
-1.059975, 0.6089554, -0.9455571, 1, 1, 1, 1, 1,
-1.052648, 0.02100364, 0.09552586, 1, 1, 1, 1, 1,
-1.047279, 1.227139, -0.5611082, 1, 1, 1, 1, 1,
-1.040999, 0.6292129, -3.233232, 1, 1, 1, 1, 1,
-1.018819, -0.6142021, -0.2630953, 1, 1, 1, 1, 1,
-1.017832, 2.051852, -1.385071, 1, 1, 1, 1, 1,
-1.015935, 0.1201633, -0.962208, 1, 1, 1, 1, 1,
-1.014206, -1.742421, -4.152766, 1, 1, 1, 1, 1,
-1.012545, 0.3971874, -2.338878, 1, 1, 1, 1, 1,
-1.01125, -0.2422165, -2.848403, 0, 0, 1, 1, 1,
-1.01103, -1.513535, -2.431131, 1, 0, 0, 1, 1,
-1.009682, 1.529907, 0.4498921, 1, 0, 0, 1, 1,
-1.007178, -0.3122653, -1.398861, 1, 0, 0, 1, 1,
-1.005209, 0.9537375, -1.342634, 1, 0, 0, 1, 1,
-0.9937309, -0.6541267, -0.8960727, 1, 0, 0, 1, 1,
-0.9928668, -0.4475935, -1.456898, 0, 0, 0, 1, 1,
-0.9909168, -1.028321, -2.766425, 0, 0, 0, 1, 1,
-0.9830434, -1.146251, -1.967821, 0, 0, 0, 1, 1,
-0.9798319, -0.3323985, -1.778933, 0, 0, 0, 1, 1,
-0.9739259, -2.547183, -2.510213, 0, 0, 0, 1, 1,
-0.9695224, -0.1850704, -0.08341663, 0, 0, 0, 1, 1,
-0.9689581, -1.119348, -3.074595, 0, 0, 0, 1, 1,
-0.9679992, -0.3747359, -1.098928, 1, 1, 1, 1, 1,
-0.9656383, -0.1727176, -3.705297, 1, 1, 1, 1, 1,
-0.964826, 0.662288, -2.170162, 1, 1, 1, 1, 1,
-0.9603077, -0.844908, -1.993228, 1, 1, 1, 1, 1,
-0.9596174, -0.05585747, -0.6360767, 1, 1, 1, 1, 1,
-0.9586736, 0.1848726, -1.329399, 1, 1, 1, 1, 1,
-0.958046, -0.7330611, -1.656888, 1, 1, 1, 1, 1,
-0.9454216, -2.262362, -2.717832, 1, 1, 1, 1, 1,
-0.9401063, 1.402487, -1.477236, 1, 1, 1, 1, 1,
-0.9359065, 0.9913367, -0.8038335, 1, 1, 1, 1, 1,
-0.93551, -0.8215834, -5.069869, 1, 1, 1, 1, 1,
-0.9354763, -1.155964, -4.448903, 1, 1, 1, 1, 1,
-0.9284091, -0.478999, -1.503507, 1, 1, 1, 1, 1,
-0.9251903, 1.445467, -0.7455616, 1, 1, 1, 1, 1,
-0.9115527, -0.4789649, -0.05921811, 1, 1, 1, 1, 1,
-0.9050987, 0.8589959, 1.004397, 0, 0, 1, 1, 1,
-0.9031602, -0.8356584, -2.864215, 1, 0, 0, 1, 1,
-0.9002901, -0.4703311, -3.730098, 1, 0, 0, 1, 1,
-0.8979692, -0.564629, -1.590389, 1, 0, 0, 1, 1,
-0.8933915, 0.5449538, -2.10393, 1, 0, 0, 1, 1,
-0.8929807, 1.674178, 0.6180033, 1, 0, 0, 1, 1,
-0.8923496, 0.4314824, -0.2018513, 0, 0, 0, 1, 1,
-0.8900189, -2.580958, -3.237104, 0, 0, 0, 1, 1,
-0.8871869, -1.740728, -3.995555, 0, 0, 0, 1, 1,
-0.8795706, -0.6534305, -1.539812, 0, 0, 0, 1, 1,
-0.8759093, -0.9001852, -2.595747, 0, 0, 0, 1, 1,
-0.8759085, 0.2247675, -1.146952, 0, 0, 0, 1, 1,
-0.8666446, 1.31252, -0.2231465, 0, 0, 0, 1, 1,
-0.8664167, -1.550131, -4.551923, 1, 1, 1, 1, 1,
-0.8645104, 0.01539424, -1.005037, 1, 1, 1, 1, 1,
-0.8612596, -0.1620667, -0.8947861, 1, 1, 1, 1, 1,
-0.8555612, 0.6179433, -1.35005, 1, 1, 1, 1, 1,
-0.8539926, 0.38833, -1.037426, 1, 1, 1, 1, 1,
-0.8459756, -1.774726, -3.626184, 1, 1, 1, 1, 1,
-0.8450573, -1.311185, -2.78348, 1, 1, 1, 1, 1,
-0.8277553, -1.068186, -1.937304, 1, 1, 1, 1, 1,
-0.8263014, 0.9536998, 0.9140913, 1, 1, 1, 1, 1,
-0.825256, 0.4594457, 0.7598732, 1, 1, 1, 1, 1,
-0.818905, 1.859859, -1.272409, 1, 1, 1, 1, 1,
-0.8161173, -1.239522, -1.473372, 1, 1, 1, 1, 1,
-0.8137966, 0.1854288, -2.891071, 1, 1, 1, 1, 1,
-0.8119759, 1.652765, 2.220082, 1, 1, 1, 1, 1,
-0.81116, 2.361287, -0.2749364, 1, 1, 1, 1, 1,
-0.8086624, 1.774441, -1.743279, 0, 0, 1, 1, 1,
-0.808153, -0.4541632, -2.370387, 1, 0, 0, 1, 1,
-0.8047208, -0.7632354, -2.793508, 1, 0, 0, 1, 1,
-0.8037912, -0.01588608, -0.4119974, 1, 0, 0, 1, 1,
-0.8024774, 1.378032, 0.7081182, 1, 0, 0, 1, 1,
-0.8006476, -0.3297264, -3.000014, 1, 0, 0, 1, 1,
-0.7943615, 1.305017, -1.667273, 0, 0, 0, 1, 1,
-0.7898452, -0.3353485, -0.8452803, 0, 0, 0, 1, 1,
-0.7885004, -1.111007, -1.499037, 0, 0, 0, 1, 1,
-0.7860231, -1.154942, -3.263874, 0, 0, 0, 1, 1,
-0.7857307, -1.328264, -2.572424, 0, 0, 0, 1, 1,
-0.784861, 0.5866074, -0.9749014, 0, 0, 0, 1, 1,
-0.7804312, 1.263174, 0.2619662, 0, 0, 0, 1, 1,
-0.7752672, -1.323303, -2.171332, 1, 1, 1, 1, 1,
-0.7747051, -0.709495, -1.107505, 1, 1, 1, 1, 1,
-0.7730359, -0.5151579, -3.006893, 1, 1, 1, 1, 1,
-0.7694901, -1.087989, -0.8292626, 1, 1, 1, 1, 1,
-0.7659194, -0.04906398, -2.741363, 1, 1, 1, 1, 1,
-0.7653747, -0.3607163, -2.631411, 1, 1, 1, 1, 1,
-0.7645629, 0.472196, -0.07780096, 1, 1, 1, 1, 1,
-0.7621247, -0.06561289, -3.360054, 1, 1, 1, 1, 1,
-0.7612793, -0.07919282, -1.46333, 1, 1, 1, 1, 1,
-0.7597714, 1.876859, -0.4310024, 1, 1, 1, 1, 1,
-0.7569777, 1.336821, -1.020911, 1, 1, 1, 1, 1,
-0.7568691, -0.5897815, -1.629625, 1, 1, 1, 1, 1,
-0.7567272, 0.7834941, 1.23582, 1, 1, 1, 1, 1,
-0.7562065, -1.560427, -3.162122, 1, 1, 1, 1, 1,
-0.7541118, 0.9217939, -1.580862, 1, 1, 1, 1, 1,
-0.7468988, 0.6831005, -0.0170091, 0, 0, 1, 1, 1,
-0.7392447, 0.355916, -2.536239, 1, 0, 0, 1, 1,
-0.7328842, -0.2687441, -3.13414, 1, 0, 0, 1, 1,
-0.7325929, 0.9555807, -1.086677, 1, 0, 0, 1, 1,
-0.7309993, -0.2346907, -1.453164, 1, 0, 0, 1, 1,
-0.7195388, -0.9195689, -1.656563, 1, 0, 0, 1, 1,
-0.7115175, 0.4804142, -0.3144117, 0, 0, 0, 1, 1,
-0.7111822, 1.77296, 0.862802, 0, 0, 0, 1, 1,
-0.7060313, -0.290794, -1.924883, 0, 0, 0, 1, 1,
-0.6980473, 0.7782388, -1.29164, 0, 0, 0, 1, 1,
-0.6980458, 1.315471, -0.7013909, 0, 0, 0, 1, 1,
-0.6977574, 0.4922, 0.4700665, 0, 0, 0, 1, 1,
-0.6973392, 0.4334119, -1.953459, 0, 0, 0, 1, 1,
-0.6943295, -0.2195087, -2.156797, 1, 1, 1, 1, 1,
-0.689625, 0.9269048, -1.665138, 1, 1, 1, 1, 1,
-0.6884984, 0.6154989, -1.713448, 1, 1, 1, 1, 1,
-0.6870605, -0.1147755, -2.382189, 1, 1, 1, 1, 1,
-0.6861569, -1.241998, -1.884767, 1, 1, 1, 1, 1,
-0.6796818, -0.1557836, -0.8042729, 1, 1, 1, 1, 1,
-0.6756148, 1.64251, 1.190355, 1, 1, 1, 1, 1,
-0.6738327, 0.5622802, -2.975817, 1, 1, 1, 1, 1,
-0.6711658, 0.05739566, -0.5135887, 1, 1, 1, 1, 1,
-0.6646343, -0.1297374, -2.533516, 1, 1, 1, 1, 1,
-0.6620385, -0.2388453, -3.068233, 1, 1, 1, 1, 1,
-0.6607616, -1.767522, -2.167174, 1, 1, 1, 1, 1,
-0.6595662, -1.285018, -2.252703, 1, 1, 1, 1, 1,
-0.6554894, 0.4935624, -0.4480362, 1, 1, 1, 1, 1,
-0.6539564, -0.2565291, 0.0511391, 1, 1, 1, 1, 1,
-0.6539214, -1.218164, -1.306975, 0, 0, 1, 1, 1,
-0.6531488, 0.7593684, -0.02367887, 1, 0, 0, 1, 1,
-0.6509657, 0.008517437, -1.528254, 1, 0, 0, 1, 1,
-0.6433293, 0.3103562, -1.997849, 1, 0, 0, 1, 1,
-0.6347544, -1.148325, -1.892056, 1, 0, 0, 1, 1,
-0.6337687, 2.162775, -0.1601806, 1, 0, 0, 1, 1,
-0.6318759, -1.242434, -3.952636, 0, 0, 0, 1, 1,
-0.6318743, 0.9233608, 0.1489221, 0, 0, 0, 1, 1,
-0.6307973, 0.2494463, -0.8393296, 0, 0, 0, 1, 1,
-0.6238075, 0.06303044, -1.174186, 0, 0, 0, 1, 1,
-0.6164616, -1.267459, -2.498894, 0, 0, 0, 1, 1,
-0.6066523, 1.162152, -0.259325, 0, 0, 0, 1, 1,
-0.6031255, -0.9994989, -2.362685, 0, 0, 0, 1, 1,
-0.6026723, -0.905534, -0.9576144, 1, 1, 1, 1, 1,
-0.5948814, 0.6589952, -3.17625, 1, 1, 1, 1, 1,
-0.5935269, 0.6723353, -0.5707447, 1, 1, 1, 1, 1,
-0.589913, -0.07221726, -1.647029, 1, 1, 1, 1, 1,
-0.5897651, -0.9305565, -4.226739, 1, 1, 1, 1, 1,
-0.5867025, -1.262442, -1.927484, 1, 1, 1, 1, 1,
-0.5855335, 0.7085447, -0.5653334, 1, 1, 1, 1, 1,
-0.5831468, -0.147116, -0.3480317, 1, 1, 1, 1, 1,
-0.5815756, -2.206587, -3.198732, 1, 1, 1, 1, 1,
-0.5792522, 0.774753, -0.7936968, 1, 1, 1, 1, 1,
-0.5742549, -0.265223, -3.673676, 1, 1, 1, 1, 1,
-0.5733366, 0.3420894, -0.6539394, 1, 1, 1, 1, 1,
-0.5715094, -0.5119448, -2.097786, 1, 1, 1, 1, 1,
-0.5659471, -0.4872663, -1.570951, 1, 1, 1, 1, 1,
-0.5640146, -0.3016527, -4.175268, 1, 1, 1, 1, 1,
-0.5613303, -0.619769, -3.779694, 0, 0, 1, 1, 1,
-0.5564716, -1.415478, -3.340256, 1, 0, 0, 1, 1,
-0.5528806, 0.4011567, -0.01865336, 1, 0, 0, 1, 1,
-0.5490671, -0.7568659, -2.907934, 1, 0, 0, 1, 1,
-0.542796, -2.053689, -2.471427, 1, 0, 0, 1, 1,
-0.5357125, 0.5844427, -0.2972174, 1, 0, 0, 1, 1,
-0.5338364, -1.152854, -0.9626101, 0, 0, 0, 1, 1,
-0.5315734, -1.879335, -0.9854944, 0, 0, 0, 1, 1,
-0.5284386, -0.9343436, -0.8992152, 0, 0, 0, 1, 1,
-0.5280181, 0.1310236, -0.5662856, 0, 0, 0, 1, 1,
-0.5265552, 0.8752208, -2.576989, 0, 0, 0, 1, 1,
-0.5261211, -1.769989, -2.613782, 0, 0, 0, 1, 1,
-0.5231727, 0.2774652, -0.5115783, 0, 0, 0, 1, 1,
-0.5201601, -0.4305658, -2.24047, 1, 1, 1, 1, 1,
-0.5195689, 0.2937502, -0.08671824, 1, 1, 1, 1, 1,
-0.519119, 0.7087868, 1.094632, 1, 1, 1, 1, 1,
-0.5174519, -0.6057035, -2.82489, 1, 1, 1, 1, 1,
-0.5158529, -0.4098102, -3.642225, 1, 1, 1, 1, 1,
-0.5152796, 0.1270313, -2.585418, 1, 1, 1, 1, 1,
-0.5127195, 1.130615, 0.0761356, 1, 1, 1, 1, 1,
-0.5108827, 0.2228861, -2.898569, 1, 1, 1, 1, 1,
-0.5093238, 0.7657927, -1.646383, 1, 1, 1, 1, 1,
-0.5077087, 0.3076221, 0.2330243, 1, 1, 1, 1, 1,
-0.4950947, -0.650592, -1.289466, 1, 1, 1, 1, 1,
-0.4893717, 0.1191915, -1.704833, 1, 1, 1, 1, 1,
-0.487382, 2.483465, -1.496734, 1, 1, 1, 1, 1,
-0.4730636, 0.1012776, -2.084268, 1, 1, 1, 1, 1,
-0.4622041, -1.740309, -3.319346, 1, 1, 1, 1, 1,
-0.4596221, 1.19621, -0.7478991, 0, 0, 1, 1, 1,
-0.4531517, -1.621207, -2.08209, 1, 0, 0, 1, 1,
-0.45262, -1.14349, -2.640492, 1, 0, 0, 1, 1,
-0.4513968, 1.930532, 0.3371269, 1, 0, 0, 1, 1,
-0.4492471, 0.9051224, -2.256258, 1, 0, 0, 1, 1,
-0.4442054, 0.1576879, -1.621253, 1, 0, 0, 1, 1,
-0.4401205, -1.068621, -1.918862, 0, 0, 0, 1, 1,
-0.4386172, -0.2582654, -2.582473, 0, 0, 0, 1, 1,
-0.4367343, -0.04703179, -1.534716, 0, 0, 0, 1, 1,
-0.4358839, 0.6890729, -1.955765, 0, 0, 0, 1, 1,
-0.4285823, 0.09111344, 1.168296, 0, 0, 0, 1, 1,
-0.4268779, -0.4072481, -2.688786, 0, 0, 0, 1, 1,
-0.4189312, 2.229859, 0.2408807, 0, 0, 0, 1, 1,
-0.4172611, 0.2661079, 0.5708178, 1, 1, 1, 1, 1,
-0.412789, -0.887589, -1.24788, 1, 1, 1, 1, 1,
-0.4114251, 0.2214775, -2.879241, 1, 1, 1, 1, 1,
-0.410985, 1.594646, -0.2893086, 1, 1, 1, 1, 1,
-0.410558, 0.9386801, 1.812135, 1, 1, 1, 1, 1,
-0.4063807, -0.9432921, -2.610205, 1, 1, 1, 1, 1,
-0.405454, -0.5688615, -0.990352, 1, 1, 1, 1, 1,
-0.4018923, -0.5715806, -2.833764, 1, 1, 1, 1, 1,
-0.3961523, 1.45882, -1.553882, 1, 1, 1, 1, 1,
-0.3939769, -0.7139168, -2.30617, 1, 1, 1, 1, 1,
-0.3903123, 0.2682288, 0.2251255, 1, 1, 1, 1, 1,
-0.3900812, -1.259427, -2.52585, 1, 1, 1, 1, 1,
-0.3888808, -0.1145191, -2.892785, 1, 1, 1, 1, 1,
-0.3792723, 0.1139549, -1.007795, 1, 1, 1, 1, 1,
-0.3783061, 0.2927474, 0.1441141, 1, 1, 1, 1, 1,
-0.3742338, 1.111044, 1.56688, 0, 0, 1, 1, 1,
-0.373306, 1.39069, -0.8823569, 1, 0, 0, 1, 1,
-0.3652488, 0.9936543, -0.2826495, 1, 0, 0, 1, 1,
-0.365241, -1.095325, -0.9617614, 1, 0, 0, 1, 1,
-0.3640852, -0.412389, -1.807763, 1, 0, 0, 1, 1,
-0.3574824, 0.8923509, -2.27805, 1, 0, 0, 1, 1,
-0.352283, 0.7489474, -1.090145, 0, 0, 0, 1, 1,
-0.3509275, -0.5673711, -3.605727, 0, 0, 0, 1, 1,
-0.3502399, 0.4009486, -1.619338, 0, 0, 0, 1, 1,
-0.3491074, 1.773479, 0.7315481, 0, 0, 0, 1, 1,
-0.3437444, 0.03350563, -2.026329, 0, 0, 0, 1, 1,
-0.3422116, -0.6694353, -1.261556, 0, 0, 0, 1, 1,
-0.3336998, 0.2674799, 0.1868404, 0, 0, 0, 1, 1,
-0.3306755, 0.8990971, -1.613535, 1, 1, 1, 1, 1,
-0.3269247, -0.5846224, -2.874831, 1, 1, 1, 1, 1,
-0.3201528, -0.9810147, -1.747612, 1, 1, 1, 1, 1,
-0.3194076, -0.2563811, -1.931518, 1, 1, 1, 1, 1,
-0.3174221, 0.7560254, -0.04628447, 1, 1, 1, 1, 1,
-0.3169677, 0.9645852, -1.150378, 1, 1, 1, 1, 1,
-0.3163481, 1.47205, 0.3168898, 1, 1, 1, 1, 1,
-0.3161605, -1.020229, -3.176335, 1, 1, 1, 1, 1,
-0.3160117, -1.754251, -3.064082, 1, 1, 1, 1, 1,
-0.3135547, 0.256714, -0.2862202, 1, 1, 1, 1, 1,
-0.3111778, -1.06408, -2.436872, 1, 1, 1, 1, 1,
-0.3109136, -0.3026125, -1.51257, 1, 1, 1, 1, 1,
-0.3089144, 0.7120108, -2.140806, 1, 1, 1, 1, 1,
-0.3082947, -0.09009183, -2.176685, 1, 1, 1, 1, 1,
-0.3041601, 0.1234107, -1.014917, 1, 1, 1, 1, 1,
-0.3036983, 0.8936676, -0.9633551, 0, 0, 1, 1, 1,
-0.3019608, -0.3415835, -1.785526, 1, 0, 0, 1, 1,
-0.2989461, -0.8124325, -2.144801, 1, 0, 0, 1, 1,
-0.2979486, 1.929947, 0.2752268, 1, 0, 0, 1, 1,
-0.2956282, -0.05085619, -1.717032, 1, 0, 0, 1, 1,
-0.2937098, 0.9535472, 0.6157236, 1, 0, 0, 1, 1,
-0.2926186, -0.1267645, -2.21297, 0, 0, 0, 1, 1,
-0.2893113, -0.779272, -2.036834, 0, 0, 0, 1, 1,
-0.2876834, -0.9654967, -3.949977, 0, 0, 0, 1, 1,
-0.2869906, 0.806689, 1.595868, 0, 0, 0, 1, 1,
-0.2868226, 0.06658844, -1.116871, 0, 0, 0, 1, 1,
-0.2845645, -0.2852769, -1.957356, 0, 0, 0, 1, 1,
-0.284142, -0.5748945, -2.787738, 0, 0, 0, 1, 1,
-0.2841261, 0.210243, -0.6626053, 1, 1, 1, 1, 1,
-0.2825933, 1.334422, -0.2525899, 1, 1, 1, 1, 1,
-0.2795084, 1.327258, 0.4119311, 1, 1, 1, 1, 1,
-0.2786058, -1.188104, -3.0999, 1, 1, 1, 1, 1,
-0.2731054, -1.499401, -2.191509, 1, 1, 1, 1, 1,
-0.2707857, -0.5553101, -1.389549, 1, 1, 1, 1, 1,
-0.2693826, -0.2983579, -2.65062, 1, 1, 1, 1, 1,
-0.268914, 0.7816631, 0.241346, 1, 1, 1, 1, 1,
-0.2652843, -0.8461545, -2.287903, 1, 1, 1, 1, 1,
-0.2624996, -1.087201, -2.303838, 1, 1, 1, 1, 1,
-0.2602524, 0.6517962, -0.8549018, 1, 1, 1, 1, 1,
-0.2574996, -0.6274037, -2.826149, 1, 1, 1, 1, 1,
-0.2574925, -0.7687144, -1.512879, 1, 1, 1, 1, 1,
-0.2566656, 0.3325043, -2.724818, 1, 1, 1, 1, 1,
-0.249959, -0.8222551, -4.443619, 1, 1, 1, 1, 1,
-0.2461225, -1.107614, -2.269871, 0, 0, 1, 1, 1,
-0.2417303, 2.273367, -0.4330052, 1, 0, 0, 1, 1,
-0.2412297, -0.8556648, -2.112483, 1, 0, 0, 1, 1,
-0.2350782, -0.5524773, -1.516567, 1, 0, 0, 1, 1,
-0.2349085, 0.3986869, 0.269053, 1, 0, 0, 1, 1,
-0.2348499, -0.1106861, -2.830423, 1, 0, 0, 1, 1,
-0.2311289, 2.076462, 0.1087085, 0, 0, 0, 1, 1,
-0.2261444, 1.271252, -0.4069084, 0, 0, 0, 1, 1,
-0.2255457, 0.2067187, -0.3523818, 0, 0, 0, 1, 1,
-0.2243025, -0.5777068, -3.002216, 0, 0, 0, 1, 1,
-0.2241122, 0.2848324, -2.067026, 0, 0, 0, 1, 1,
-0.2236526, 0.790198, -0.9796264, 0, 0, 0, 1, 1,
-0.2208159, 0.6815251, 1.013564, 0, 0, 0, 1, 1,
-0.2181394, -1.17615, -2.694721, 1, 1, 1, 1, 1,
-0.2172008, -0.3484028, -3.92348, 1, 1, 1, 1, 1,
-0.204099, 1.349592, -0.2117953, 1, 1, 1, 1, 1,
-0.2033484, 1.058227, -1.280474, 1, 1, 1, 1, 1,
-0.2027163, -0.6118781, -0.09100366, 1, 1, 1, 1, 1,
-0.2016221, 0.2449045, -0.4300905, 1, 1, 1, 1, 1,
-0.2012685, 0.6810141, -1.448198, 1, 1, 1, 1, 1,
-0.1989687, 2.035034, 1.212971, 1, 1, 1, 1, 1,
-0.194828, 0.708695, -0.05930635, 1, 1, 1, 1, 1,
-0.1943501, 0.4895203, -0.1102095, 1, 1, 1, 1, 1,
-0.1930598, -0.1132785, -1.748608, 1, 1, 1, 1, 1,
-0.1902595, 1.091301, 0.4844923, 1, 1, 1, 1, 1,
-0.1869688, 0.1177149, -1.393788, 1, 1, 1, 1, 1,
-0.1851719, -0.1284329, -1.745048, 1, 1, 1, 1, 1,
-0.1811668, -1.7235, -3.365748, 1, 1, 1, 1, 1,
-0.1809232, 0.7547634, -1.374081, 0, 0, 1, 1, 1,
-0.1784022, -0.7800559, -1.394031, 1, 0, 0, 1, 1,
-0.1728887, -0.4117129, -3.533345, 1, 0, 0, 1, 1,
-0.1709365, 0.3752424, -0.06817263, 1, 0, 0, 1, 1,
-0.1689372, -0.9304104, -4.591275, 1, 0, 0, 1, 1,
-0.1640749, 0.4293131, -0.6013361, 1, 0, 0, 1, 1,
-0.1634948, -1.043867, -2.235889, 0, 0, 0, 1, 1,
-0.1610591, -0.9842332, -3.519974, 0, 0, 0, 1, 1,
-0.1606988, -0.8412799, -2.493709, 0, 0, 0, 1, 1,
-0.1596447, 2.338598, 0.02108537, 0, 0, 0, 1, 1,
-0.1525306, 1.322622, -0.9776405, 0, 0, 0, 1, 1,
-0.1521384, 0.9089687, 0.6347454, 0, 0, 0, 1, 1,
-0.14151, 0.6225548, 0.5737548, 0, 0, 0, 1, 1,
-0.1395894, 2.199623, -0.2249576, 1, 1, 1, 1, 1,
-0.137965, 0.3806008, -0.9243289, 1, 1, 1, 1, 1,
-0.137739, 1.5223, -0.2391302, 1, 1, 1, 1, 1,
-0.1351006, -0.7334136, -2.790431, 1, 1, 1, 1, 1,
-0.1334874, 0.07362691, -1.817355, 1, 1, 1, 1, 1,
-0.1332712, -1.740387, -3.623353, 1, 1, 1, 1, 1,
-0.1316842, -0.430223, -2.09786, 1, 1, 1, 1, 1,
-0.1228174, 0.5831191, -1.811243, 1, 1, 1, 1, 1,
-0.1153343, 1.061749, -0.8961138, 1, 1, 1, 1, 1,
-0.1133972, 1.097716, 0.2864368, 1, 1, 1, 1, 1,
-0.1095682, -2.054035, -2.936738, 1, 1, 1, 1, 1,
-0.1075544, -1.701388, -3.349314, 1, 1, 1, 1, 1,
-0.1034675, -0.3625987, -1.915309, 1, 1, 1, 1, 1,
-0.09710354, -0.7010263, -0.7910629, 1, 1, 1, 1, 1,
-0.09125069, 0.2083779, 0.1293432, 1, 1, 1, 1, 1,
-0.0890169, -0.7784211, -6.089339, 0, 0, 1, 1, 1,
-0.0863485, -0.6523036, -2.052416, 1, 0, 0, 1, 1,
-0.08581807, 0.4976201, -1.033529, 1, 0, 0, 1, 1,
-0.08280251, 0.5528086, -0.5663033, 1, 0, 0, 1, 1,
-0.08123109, 0.4636022, 0.462988, 1, 0, 0, 1, 1,
-0.08083078, -0.1424169, -3.0875, 1, 0, 0, 1, 1,
-0.08049949, -0.2872027, -1.005605, 0, 0, 0, 1, 1,
-0.08023106, 0.7995023, -2.831403, 0, 0, 0, 1, 1,
-0.07967834, -2.140276, -5.356236, 0, 0, 0, 1, 1,
-0.07887382, -0.8090518, -2.385789, 0, 0, 0, 1, 1,
-0.07879732, 0.5159733, -2.506843, 0, 0, 0, 1, 1,
-0.06656367, -1.055, -4.459993, 0, 0, 0, 1, 1,
-0.06402102, -0.3501447, -2.889221, 0, 0, 0, 1, 1,
-0.06219041, 0.5700759, 0.3801671, 1, 1, 1, 1, 1,
-0.06076382, 0.517287, -2.125678, 1, 1, 1, 1, 1,
-0.05583163, -0.474328, -1.975372, 1, 1, 1, 1, 1,
-0.0549124, 0.3048405, -1.522111, 1, 1, 1, 1, 1,
-0.05382381, 0.08099809, -0.7297767, 1, 1, 1, 1, 1,
-0.05224219, 1.141435, 0.9709687, 1, 1, 1, 1, 1,
-0.05131621, 1.582357, -0.9291473, 1, 1, 1, 1, 1,
-0.05002895, 0.3783039, 1.236197, 1, 1, 1, 1, 1,
-0.04373307, -0.3109154, -2.267934, 1, 1, 1, 1, 1,
-0.04073819, 1.881427, 0.7146999, 1, 1, 1, 1, 1,
-0.03585595, -0.7404395, -2.150406, 1, 1, 1, 1, 1,
-0.03344005, 1.987288, -0.042238, 1, 1, 1, 1, 1,
-0.03072066, 0.9018546, -0.5383384, 1, 1, 1, 1, 1,
-0.0283646, 0.1156633, 1.085873, 1, 1, 1, 1, 1,
-0.02670844, -1.036687, -4.23019, 1, 1, 1, 1, 1,
-0.02663966, 1.222285, -0.38761, 0, 0, 1, 1, 1,
-0.02654925, 1.201286, 1.088353, 1, 0, 0, 1, 1,
-0.01897293, -0.3944206, -0.6085561, 1, 0, 0, 1, 1,
-0.01481324, -1.066247, -2.923215, 1, 0, 0, 1, 1,
-0.01431667, 0.998509, 1.330129, 1, 0, 0, 1, 1,
-0.0140668, -0.7248898, -3.582975, 1, 0, 0, 1, 1,
-0.01392694, 1.207879, 1.261936, 0, 0, 0, 1, 1,
-0.009267502, 1.752358, -1.038922, 0, 0, 0, 1, 1,
-0.008905162, 1.032083, -1.28261, 0, 0, 0, 1, 1,
-0.008246471, 0.3096431, -1.508981, 0, 0, 0, 1, 1,
-0.002659109, 1.118235, 1.354136, 0, 0, 0, 1, 1,
-0.001319299, -0.9417036, -2.733503, 0, 0, 0, 1, 1,
0.002000574, 1.588993, -1.041454, 0, 0, 0, 1, 1,
0.00383497, 0.2522506, -0.2148225, 1, 1, 1, 1, 1,
0.00557351, -0.03189383, 1.367753, 1, 1, 1, 1, 1,
0.00966204, -1.299172, 3.73099, 1, 1, 1, 1, 1,
0.01010641, 0.3812689, -1.347328, 1, 1, 1, 1, 1,
0.01503426, -0.7450462, 3.231864, 1, 1, 1, 1, 1,
0.01596265, 0.8572374, 0.4744966, 1, 1, 1, 1, 1,
0.01750464, -1.767631, 2.667256, 1, 1, 1, 1, 1,
0.01908402, -0.6506854, 3.520035, 1, 1, 1, 1, 1,
0.02135709, 1.527432, -0.1171731, 1, 1, 1, 1, 1,
0.02200545, -1.746643, 3.463321, 1, 1, 1, 1, 1,
0.02297121, 0.316562, -0.5136808, 1, 1, 1, 1, 1,
0.02629461, -0.4113079, 3.321203, 1, 1, 1, 1, 1,
0.02796427, 0.2877752, 0.8277866, 1, 1, 1, 1, 1,
0.03447893, 0.5745224, 0.3095375, 1, 1, 1, 1, 1,
0.03673234, 0.9836674, -0.28365, 1, 1, 1, 1, 1,
0.04070999, -0.9838119, 3.610118, 0, 0, 1, 1, 1,
0.04154919, 0.1669393, -1.100899, 1, 0, 0, 1, 1,
0.04247379, -1.207662, 3.100031, 1, 0, 0, 1, 1,
0.04267135, -0.01883147, 1.806754, 1, 0, 0, 1, 1,
0.04325509, 0.6995329, 0.5545757, 1, 0, 0, 1, 1,
0.04707335, 1.008192, 0.06411763, 1, 0, 0, 1, 1,
0.05404072, -0.7292999, 2.590082, 0, 0, 0, 1, 1,
0.05523656, -0.2149398, 4.084247, 0, 0, 0, 1, 1,
0.05706785, -0.2061805, 3.199682, 0, 0, 0, 1, 1,
0.05760277, -0.1534679, 0.3592924, 0, 0, 0, 1, 1,
0.05831872, -0.8018479, 4.353559, 0, 0, 0, 1, 1,
0.06619034, 0.06650677, 0.2694759, 0, 0, 0, 1, 1,
0.06707465, 0.1529899, 0.7117642, 0, 0, 0, 1, 1,
0.06847616, -0.2644345, 3.028311, 1, 1, 1, 1, 1,
0.07271075, 0.3497737, -0.19115, 1, 1, 1, 1, 1,
0.07737839, -0.02850754, 1.215213, 1, 1, 1, 1, 1,
0.08071229, -0.01920779, 1.356107, 1, 1, 1, 1, 1,
0.08601227, -0.3748692, 3.262193, 1, 1, 1, 1, 1,
0.08883886, 1.616992, -0.9323429, 1, 1, 1, 1, 1,
0.0891633, -0.3078733, 2.914509, 1, 1, 1, 1, 1,
0.09147477, -0.3916551, 1.593948, 1, 1, 1, 1, 1,
0.09210375, -0.4581287, 3.506636, 1, 1, 1, 1, 1,
0.1003588, -0.3391777, 3.846009, 1, 1, 1, 1, 1,
0.103952, 0.942786, -0.6635665, 1, 1, 1, 1, 1,
0.1055624, 0.1467069, 0.3482535, 1, 1, 1, 1, 1,
0.1059517, 0.5318671, 2.562788, 1, 1, 1, 1, 1,
0.1145458, 1.608825, 0.5083527, 1, 1, 1, 1, 1,
0.1283501, 0.8387132, 1.233357, 1, 1, 1, 1, 1,
0.1287132, 0.02627928, 0.9234192, 0, 0, 1, 1, 1,
0.1336244, 0.2386653, 0.231988, 1, 0, 0, 1, 1,
0.1417236, -1.038265, 3.58956, 1, 0, 0, 1, 1,
0.1501573, 0.09334718, 0.01057714, 1, 0, 0, 1, 1,
0.1517038, -0.116327, 4.138, 1, 0, 0, 1, 1,
0.1518575, -1.560721, 2.28672, 1, 0, 0, 1, 1,
0.1532827, -1.788809, 3.963793, 0, 0, 0, 1, 1,
0.1556226, 0.3938203, 1.29639, 0, 0, 0, 1, 1,
0.1669363, 0.8655469, 0.7748889, 0, 0, 0, 1, 1,
0.1680783, -0.9082073, 1.710017, 0, 0, 0, 1, 1,
0.1685519, -1.392287, 3.190267, 0, 0, 0, 1, 1,
0.1728376, 0.08596215, 2.889991, 0, 0, 0, 1, 1,
0.1746835, 0.2543374, 0.3379788, 0, 0, 0, 1, 1,
0.1773653, -0.01416642, 1.218912, 1, 1, 1, 1, 1,
0.1791352, -0.337838, 2.683446, 1, 1, 1, 1, 1,
0.1795168, -0.2027308, 2.556544, 1, 1, 1, 1, 1,
0.1809365, 1.527192, -0.7836807, 1, 1, 1, 1, 1,
0.1831778, 1.620048, -1.002542, 1, 1, 1, 1, 1,
0.1865825, 0.7455449, 0.6343209, 1, 1, 1, 1, 1,
0.1882297, -0.03625441, 1.79616, 1, 1, 1, 1, 1,
0.1888564, 2.334785, -0.4517348, 1, 1, 1, 1, 1,
0.1906096, 0.6777254, 0.03728769, 1, 1, 1, 1, 1,
0.1909638, 1.571759, 1.16317, 1, 1, 1, 1, 1,
0.1913792, 1.674976, -0.1411591, 1, 1, 1, 1, 1,
0.2019767, 0.9882738, 0.8304951, 1, 1, 1, 1, 1,
0.2020524, 0.109228, 1.454824, 1, 1, 1, 1, 1,
0.2078636, -1.883441, 3.453446, 1, 1, 1, 1, 1,
0.2091732, -1.668048, 3.839245, 1, 1, 1, 1, 1,
0.2113812, -1.642573, 3.277266, 0, 0, 1, 1, 1,
0.2135354, -0.1958362, 3.458701, 1, 0, 0, 1, 1,
0.2146414, -1.065041, 3.846309, 1, 0, 0, 1, 1,
0.2162667, -1.595266, 2.984272, 1, 0, 0, 1, 1,
0.2184913, -1.89069, 3.127782, 1, 0, 0, 1, 1,
0.2228046, 0.05051392, 1.044146, 1, 0, 0, 1, 1,
0.2236087, 1.407734, -0.6911947, 0, 0, 0, 1, 1,
0.2270584, -1.439588, 3.578519, 0, 0, 0, 1, 1,
0.2332474, -0.6252037, 1.92869, 0, 0, 0, 1, 1,
0.2347545, 0.4477029, 0.7750109, 0, 0, 0, 1, 1,
0.2358318, -0.9111052, 0.6740594, 0, 0, 0, 1, 1,
0.2358572, -0.8481112, 2.731823, 0, 0, 0, 1, 1,
0.2368708, 0.5027479, 0.02309637, 0, 0, 0, 1, 1,
0.2386573, -0.194649, 1.1189, 1, 1, 1, 1, 1,
0.2388897, 2.035262, 0.2660857, 1, 1, 1, 1, 1,
0.2420252, 0.5819951, 1.979739, 1, 1, 1, 1, 1,
0.2432501, -0.1346806, 1.617699, 1, 1, 1, 1, 1,
0.2446613, -0.3461409, 1.223991, 1, 1, 1, 1, 1,
0.2536051, 2.123691, -1.075223, 1, 1, 1, 1, 1,
0.2562842, -0.7247975, 4.143873, 1, 1, 1, 1, 1,
0.2577122, 0.3601099, 0.3825836, 1, 1, 1, 1, 1,
0.2590866, 0.01753298, 0.6763193, 1, 1, 1, 1, 1,
0.2599809, 0.1360258, 1.87425, 1, 1, 1, 1, 1,
0.2633869, 0.8071226, 0.4475446, 1, 1, 1, 1, 1,
0.2657821, 2.381049, 1.252423, 1, 1, 1, 1, 1,
0.2659948, 1.955886, -0.2039777, 1, 1, 1, 1, 1,
0.2680036, -0.7853025, 1.810161, 1, 1, 1, 1, 1,
0.2681412, 0.3552114, -0.5676984, 1, 1, 1, 1, 1,
0.2741179, 0.3555471, -0.6672704, 0, 0, 1, 1, 1,
0.2744288, -0.9925839, 3.061643, 1, 0, 0, 1, 1,
0.2761593, -0.6505773, 3.716205, 1, 0, 0, 1, 1,
0.276932, 0.9862983, 0.6491249, 1, 0, 0, 1, 1,
0.2800369, -2.135035, 2.748241, 1, 0, 0, 1, 1,
0.2801879, 0.4017792, 1.035327, 1, 0, 0, 1, 1,
0.2810773, 0.05561043, 0.352151, 0, 0, 0, 1, 1,
0.2841291, -0.794939, 2.709588, 0, 0, 0, 1, 1,
0.2849226, -0.3480523, 1.789744, 0, 0, 0, 1, 1,
0.2877334, -0.458597, 1.534665, 0, 0, 0, 1, 1,
0.2881913, 1.603141, 0.6142991, 0, 0, 0, 1, 1,
0.2911154, -2.816907, 3.45474, 0, 0, 0, 1, 1,
0.2914614, -0.8236536, 3.123718, 0, 0, 0, 1, 1,
0.2997307, 0.1024082, 1.251606, 1, 1, 1, 1, 1,
0.3008516, 0.877519, -0.2359218, 1, 1, 1, 1, 1,
0.3041289, 0.3854393, 1.33421, 1, 1, 1, 1, 1,
0.3048243, 0.3441253, 0.1739171, 1, 1, 1, 1, 1,
0.3051442, -0.08524717, 2.814883, 1, 1, 1, 1, 1,
0.3065199, 1.48558, -0.4152308, 1, 1, 1, 1, 1,
0.3108369, -0.3125289, 1.352629, 1, 1, 1, 1, 1,
0.3121207, -0.8080975, 1.038787, 1, 1, 1, 1, 1,
0.3129746, 2.283731, -2.444048, 1, 1, 1, 1, 1,
0.3142204, -0.4976085, 2.612046, 1, 1, 1, 1, 1,
0.3202786, 0.3764475, 1.619953, 1, 1, 1, 1, 1,
0.3221317, 0.3678699, 0.8761168, 1, 1, 1, 1, 1,
0.3222932, 0.1544914, 0.1913761, 1, 1, 1, 1, 1,
0.3243704, -0.1676821, 0.9281912, 1, 1, 1, 1, 1,
0.3246956, 0.2909695, -1.453412, 1, 1, 1, 1, 1,
0.3260123, -1.149078, 3.048989, 0, 0, 1, 1, 1,
0.3269587, 1.494031, 0.2154516, 1, 0, 0, 1, 1,
0.3432365, 0.3490243, 1.522733, 1, 0, 0, 1, 1,
0.3435198, -0.4191642, 3.032647, 1, 0, 0, 1, 1,
0.345962, -0.1377406, 2.432834, 1, 0, 0, 1, 1,
0.3475805, -0.3012079, 0.8327378, 1, 0, 0, 1, 1,
0.3511392, 1.194286, 0.03072121, 0, 0, 0, 1, 1,
0.3517507, 0.8500806, 0.6269829, 0, 0, 0, 1, 1,
0.3562798, -1.06157, 1.611498, 0, 0, 0, 1, 1,
0.3564743, 0.09496106, 1.442183, 0, 0, 0, 1, 1,
0.3597795, -1.414528, 3.401784, 0, 0, 0, 1, 1,
0.3621278, -0.09507754, 2.570448, 0, 0, 0, 1, 1,
0.3681235, 1.324315, -1.316992, 0, 0, 0, 1, 1,
0.3691243, 0.9316668, -0.688607, 1, 1, 1, 1, 1,
0.3692686, 1.232625, 0.8992486, 1, 1, 1, 1, 1,
0.3697592, 0.1086101, 2.739058, 1, 1, 1, 1, 1,
0.3722744, 0.612645, 1.460972, 1, 1, 1, 1, 1,
0.3755186, 1.789143, 1.032262, 1, 1, 1, 1, 1,
0.3777222, -1.185063, 3.985743, 1, 1, 1, 1, 1,
0.3786194, -2.211997, 2.996791, 1, 1, 1, 1, 1,
0.3788344, 0.3281227, 1.53009, 1, 1, 1, 1, 1,
0.3876916, 0.997045, 0.9073386, 1, 1, 1, 1, 1,
0.3885171, -0.914565, 3.357952, 1, 1, 1, 1, 1,
0.3975542, 0.722787, 0.741771, 1, 1, 1, 1, 1,
0.4019652, -0.8262962, 1.869295, 1, 1, 1, 1, 1,
0.405893, 0.6996831, 0.1017766, 1, 1, 1, 1, 1,
0.4065094, -0.1967157, 1.593966, 1, 1, 1, 1, 1,
0.4078393, -0.4603227, 1.673102, 1, 1, 1, 1, 1,
0.4085808, -0.1567214, 1.66322, 0, 0, 1, 1, 1,
0.4095913, -0.5760816, 0.93917, 1, 0, 0, 1, 1,
0.4106283, 0.4569321, 0.6297286, 1, 0, 0, 1, 1,
0.4206443, -1.634223, 5.223495, 1, 0, 0, 1, 1,
0.4211006, 0.1625958, 1.483587, 1, 0, 0, 1, 1,
0.4276755, 0.1981315, 0.5927538, 1, 0, 0, 1, 1,
0.4283915, -0.5232128, 1.946029, 0, 0, 0, 1, 1,
0.43209, -1.137018, 3.585541, 0, 0, 0, 1, 1,
0.4342981, 1.696429, -0.02853535, 0, 0, 0, 1, 1,
0.4407324, 1.802145, 1.558371, 0, 0, 0, 1, 1,
0.4421251, -0.719336, 2.477675, 0, 0, 0, 1, 1,
0.4424758, -0.281309, 0.9885781, 0, 0, 0, 1, 1,
0.4425404, -1.511202, 3.218559, 0, 0, 0, 1, 1,
0.4438977, -0.3726565, 2.503195, 1, 1, 1, 1, 1,
0.4464267, 0.3707078, -0.6610295, 1, 1, 1, 1, 1,
0.4476763, -1.079152, 3.709178, 1, 1, 1, 1, 1,
0.4497417, -1.763044, 2.825248, 1, 1, 1, 1, 1,
0.4546767, -0.2626731, 2.394556, 1, 1, 1, 1, 1,
0.4621439, -0.7583838, 2.930336, 1, 1, 1, 1, 1,
0.4637083, 0.6269837, -0.003058565, 1, 1, 1, 1, 1,
0.4638032, 0.8793197, -0.345405, 1, 1, 1, 1, 1,
0.4678924, 0.1140546, 0.7105691, 1, 1, 1, 1, 1,
0.4728165, 1.049723, 1.774247, 1, 1, 1, 1, 1,
0.473462, -1.707577, 3.000338, 1, 1, 1, 1, 1,
0.4742446, -0.916792, 3.682047, 1, 1, 1, 1, 1,
0.4762188, -0.4882457, 3.517989, 1, 1, 1, 1, 1,
0.4768635, 1.91998, -0.5946865, 1, 1, 1, 1, 1,
0.4782778, -0.334782, 1.645417, 1, 1, 1, 1, 1,
0.480669, 0.1350998, 2.889024, 0, 0, 1, 1, 1,
0.4827775, 0.7066752, 0.3717441, 1, 0, 0, 1, 1,
0.4843741, 2.823792, -1.964995, 1, 0, 0, 1, 1,
0.4850979, -1.261424, 3.530245, 1, 0, 0, 1, 1,
0.4920052, 0.2719949, 3.517463, 1, 0, 0, 1, 1,
0.4942628, -0.07738099, 2.055329, 1, 0, 0, 1, 1,
0.505605, -0.3827067, 3.017933, 0, 0, 0, 1, 1,
0.5134692, -0.2253697, 2.153014, 0, 0, 0, 1, 1,
0.5149119, 1.436381, 1.303886, 0, 0, 0, 1, 1,
0.5172077, -0.2861297, 1.627705, 0, 0, 0, 1, 1,
0.5192473, 0.9522681, -0.3248473, 0, 0, 0, 1, 1,
0.5202758, -0.02215004, 1.200821, 0, 0, 0, 1, 1,
0.5205086, -1.871219, 2.598183, 0, 0, 0, 1, 1,
0.5311275, 1.445477, -1.563584, 1, 1, 1, 1, 1,
0.5315393, -0.4685968, 2.458478, 1, 1, 1, 1, 1,
0.5361289, 0.4930842, 0.475308, 1, 1, 1, 1, 1,
0.5434631, -1.167286, 2.728423, 1, 1, 1, 1, 1,
0.5488343, -1.09911, 2.394447, 1, 1, 1, 1, 1,
0.5489084, -0.5266506, 1.501855, 1, 1, 1, 1, 1,
0.5520566, -0.4590895, 1.983615, 1, 1, 1, 1, 1,
0.5522758, -0.9338032, 2.415169, 1, 1, 1, 1, 1,
0.5536921, 0.713591, 1.438912, 1, 1, 1, 1, 1,
0.557307, 0.3501154, 0.576506, 1, 1, 1, 1, 1,
0.5595139, -0.9223906, 2.764608, 1, 1, 1, 1, 1,
0.560729, -1.223304, 1.960962, 1, 1, 1, 1, 1,
0.5647068, -0.3536666, 2.139503, 1, 1, 1, 1, 1,
0.5673822, -1.035503, 2.153391, 1, 1, 1, 1, 1,
0.5759789, -0.7772749, 2.696815, 1, 1, 1, 1, 1,
0.5774083, 1.461461, -0.3025272, 0, 0, 1, 1, 1,
0.5825686, 0.1237351, 2.876043, 1, 0, 0, 1, 1,
0.5838947, 1.068313, 0.6433147, 1, 0, 0, 1, 1,
0.5853825, 0.8982819, 0.7759261, 1, 0, 0, 1, 1,
0.5883824, -0.6783164, 2.394277, 1, 0, 0, 1, 1,
0.5892369, 0.9335386, 0.3427471, 1, 0, 0, 1, 1,
0.5900091, -1.220181, 2.819774, 0, 0, 0, 1, 1,
0.5900986, 0.09608214, 0.956067, 0, 0, 0, 1, 1,
0.5908049, 1.603039, 1.498875, 0, 0, 0, 1, 1,
0.5948418, 0.6218346, 0.3357401, 0, 0, 0, 1, 1,
0.596765, 0.6641533, 3.200251, 0, 0, 0, 1, 1,
0.604244, 0.9408459, 0.5564258, 0, 0, 0, 1, 1,
0.6100417, -0.479723, 2.060282, 0, 0, 0, 1, 1,
0.6122988, -0.2610674, 2.648093, 1, 1, 1, 1, 1,
0.6154714, -1.254988, 3.501307, 1, 1, 1, 1, 1,
0.615707, -0.8651638, 2.258475, 1, 1, 1, 1, 1,
0.6166362, -0.3199404, 0.297013, 1, 1, 1, 1, 1,
0.6322496, -2.854785, 3.274957, 1, 1, 1, 1, 1,
0.636051, -0.6781688, 3.00186, 1, 1, 1, 1, 1,
0.6362768, 0.06904397, 0.9338866, 1, 1, 1, 1, 1,
0.6399767, -0.3799722, 4.18082, 1, 1, 1, 1, 1,
0.6443965, -1.424832, 2.89955, 1, 1, 1, 1, 1,
0.6572965, -1.02337, 0.883884, 1, 1, 1, 1, 1,
0.6624368, 0.7311464, 1.121578, 1, 1, 1, 1, 1,
0.6655675, -2.040766, 2.019807, 1, 1, 1, 1, 1,
0.666024, -0.009532504, 2.061322, 1, 1, 1, 1, 1,
0.6669953, 0.8435376, 0.1016989, 1, 1, 1, 1, 1,
0.6678278, 0.08533331, 0.7576986, 1, 1, 1, 1, 1,
0.6748151, 1.190078, 3.20189, 0, 0, 1, 1, 1,
0.6806155, -1.003367, 3.799096, 1, 0, 0, 1, 1,
0.6854993, -1.726791, 1.068758, 1, 0, 0, 1, 1,
0.6880759, 0.395487, 0.6904433, 1, 0, 0, 1, 1,
0.6900476, 0.7914229, 0.2681133, 1, 0, 0, 1, 1,
0.6987817, 0.5920388, -0.3499686, 1, 0, 0, 1, 1,
0.7032502, 0.0504299, 0.9648271, 0, 0, 0, 1, 1,
0.7041547, -0.1817402, 1.113713, 0, 0, 0, 1, 1,
0.7066361, -1.571443, 2.727492, 0, 0, 0, 1, 1,
0.7070181, -0.1673282, 2.226428, 0, 0, 0, 1, 1,
0.707446, -1.03767, 2.435257, 0, 0, 0, 1, 1,
0.7115309, -1.875374, 3.603776, 0, 0, 0, 1, 1,
0.7124329, -0.3137165, 2.002612, 0, 0, 0, 1, 1,
0.7134317, 0.03292388, 1.023741, 1, 1, 1, 1, 1,
0.713549, 2.286701, 0.3391083, 1, 1, 1, 1, 1,
0.7166588, 1.009258, -1.656279, 1, 1, 1, 1, 1,
0.7218155, 0.01312361, 0.9240674, 1, 1, 1, 1, 1,
0.7232038, 0.2939513, -0.24129, 1, 1, 1, 1, 1,
0.7256292, 0.2174621, 1.930907, 1, 1, 1, 1, 1,
0.7259469, -0.4474748, 2.481524, 1, 1, 1, 1, 1,
0.7292207, 0.06318112, 2.223493, 1, 1, 1, 1, 1,
0.735077, 1.619938, 0.7826724, 1, 1, 1, 1, 1,
0.7414437, 0.001986575, 1.183599, 1, 1, 1, 1, 1,
0.7447095, 0.5440595, 2.071624, 1, 1, 1, 1, 1,
0.7488167, -1.842818, 1.818362, 1, 1, 1, 1, 1,
0.7525808, -0.6661199, 3.275721, 1, 1, 1, 1, 1,
0.753974, -0.6600958, 1.200188, 1, 1, 1, 1, 1,
0.754065, -1.014568, 1.890167, 1, 1, 1, 1, 1,
0.7571379, -0.5363733, 1.202691, 0, 0, 1, 1, 1,
0.7581112, 1.256911, -2.278936, 1, 0, 0, 1, 1,
0.7674519, -1.78156, 1.703565, 1, 0, 0, 1, 1,
0.7717616, 0.5687125, -0.3066286, 1, 0, 0, 1, 1,
0.7720462, -2.076714, 3.23221, 1, 0, 0, 1, 1,
0.7726338, 0.3091604, 2.031138, 1, 0, 0, 1, 1,
0.7776729, 0.8930812, 1.102295, 0, 0, 0, 1, 1,
0.7836171, -0.1550427, 3.988157, 0, 0, 0, 1, 1,
0.7896556, 0.6599347, 0.5238025, 0, 0, 0, 1, 1,
0.7924946, -1.483274, 1.993922, 0, 0, 0, 1, 1,
0.7987648, 0.1344369, 1.495967, 0, 0, 0, 1, 1,
0.7990316, -0.3463654, 2.67601, 0, 0, 0, 1, 1,
0.8007817, -0.9581293, 3.67419, 0, 0, 0, 1, 1,
0.8044479, -0.3400353, 0.5233165, 1, 1, 1, 1, 1,
0.8066513, -0.8264309, 2.893397, 1, 1, 1, 1, 1,
0.8072748, 1.44224, 1.440484, 1, 1, 1, 1, 1,
0.8272477, -0.2588146, 0.8275453, 1, 1, 1, 1, 1,
0.8273474, -0.8379149, 0.665394, 1, 1, 1, 1, 1,
0.8315961, -0.2391192, 1.955403, 1, 1, 1, 1, 1,
0.8352375, -0.5535591, 1.39988, 1, 1, 1, 1, 1,
0.8373336, -0.05077937, 0.5113608, 1, 1, 1, 1, 1,
0.8397137, -0.8292695, 2.30915, 1, 1, 1, 1, 1,
0.8420767, 0.1321486, 1.989715, 1, 1, 1, 1, 1,
0.8465147, -2.08642, 1.679664, 1, 1, 1, 1, 1,
0.8481659, -0.6535836, 2.73667, 1, 1, 1, 1, 1,
0.8508821, -1.307237, 3.02537, 1, 1, 1, 1, 1,
0.8591115, -0.7438422, 1.231151, 1, 1, 1, 1, 1,
0.8603664, -0.03451518, 1.250503, 1, 1, 1, 1, 1,
0.8606592, -1.39085, 1.627113, 0, 0, 1, 1, 1,
0.865748, -1.282297, 2.141163, 1, 0, 0, 1, 1,
0.8764311, 0.2131788, 0.4518349, 1, 0, 0, 1, 1,
0.8792271, -0.2430998, 1.582216, 1, 0, 0, 1, 1,
0.8800334, 1.041284, 2.111433, 1, 0, 0, 1, 1,
0.8857343, 0.2813944, 0.0086357, 1, 0, 0, 1, 1,
0.8918689, -0.5718053, 2.443407, 0, 0, 0, 1, 1,
0.8924265, 0.8111523, 0.2167857, 0, 0, 0, 1, 1,
0.8929001, 0.9873872, 2.057544, 0, 0, 0, 1, 1,
0.8933908, 0.3424012, 2.055126, 0, 0, 0, 1, 1,
0.8964691, 0.5775247, 1.230459, 0, 0, 0, 1, 1,
0.8985413, -0.693689, 2.196277, 0, 0, 0, 1, 1,
0.9027837, -0.7512053, 0.993209, 0, 0, 0, 1, 1,
0.9062217, -0.4386519, 1.128732, 1, 1, 1, 1, 1,
0.9084319, -0.423679, 1.983651, 1, 1, 1, 1, 1,
0.9199134, -0.6937892, 0.5275052, 1, 1, 1, 1, 1,
0.9223543, -0.3214386, 1.896386, 1, 1, 1, 1, 1,
0.9295163, -0.4463065, 1.843666, 1, 1, 1, 1, 1,
0.9322576, -1.697144, 2.91688, 1, 1, 1, 1, 1,
0.9440643, 0.6143305, 1.102628, 1, 1, 1, 1, 1,
0.9497797, 0.238113, 2.605962, 1, 1, 1, 1, 1,
0.9510896, -0.1668966, 1.140784, 1, 1, 1, 1, 1,
0.9512063, -1.073468, 1.962799, 1, 1, 1, 1, 1,
0.9593562, 0.913289, 0.05016996, 1, 1, 1, 1, 1,
0.9632813, 0.0244044, 0.4508356, 1, 1, 1, 1, 1,
0.9657152, -0.1458413, 2.543752, 1, 1, 1, 1, 1,
0.9678546, 0.5788233, -1.16418, 1, 1, 1, 1, 1,
0.9686823, 0.5724441, 1.492443, 1, 1, 1, 1, 1,
0.9765634, 0.7337164, 1.390005, 0, 0, 1, 1, 1,
0.9825472, 1.312314, 0.3367785, 1, 0, 0, 1, 1,
0.9865117, -1.271987, 1.713355, 1, 0, 0, 1, 1,
0.9884173, -0.1295166, 0.2331276, 1, 0, 0, 1, 1,
0.9890618, -0.2060509, 1.579923, 1, 0, 0, 1, 1,
0.9914245, 0.124852, 0.5443168, 1, 0, 0, 1, 1,
0.9971694, -0.8836103, 3.45248, 0, 0, 0, 1, 1,
1.001132, -1.775372, 2.9814, 0, 0, 0, 1, 1,
1.002489, -0.9157602, 2.892745, 0, 0, 0, 1, 1,
1.0031, -1.489213, 5.555234, 0, 0, 0, 1, 1,
1.007678, 0.3094237, 0.9881502, 0, 0, 0, 1, 1,
1.012741, 2.366515, 0.493692, 0, 0, 0, 1, 1,
1.013339, 0.5608922, 2.024639, 0, 0, 0, 1, 1,
1.019064, -1.736379, 4.471767, 1, 1, 1, 1, 1,
1.032736, -0.8504635, 3.060307, 1, 1, 1, 1, 1,
1.033388, -0.03851721, 4.448187, 1, 1, 1, 1, 1,
1.033583, 0.2749909, 0.8789105, 1, 1, 1, 1, 1,
1.043746, 0.3039006, 1.619386, 1, 1, 1, 1, 1,
1.053685, 0.7784258, 1.76751, 1, 1, 1, 1, 1,
1.055314, -0.2113054, 1.985642, 1, 1, 1, 1, 1,
1.055572, -1.79855, 2.530321, 1, 1, 1, 1, 1,
1.057361, -0.3052204, 1.479798, 1, 1, 1, 1, 1,
1.06494, -0.316306, 0.08748338, 1, 1, 1, 1, 1,
1.06588, -0.9872801, 1.616034, 1, 1, 1, 1, 1,
1.076934, 0.6319045, 3.020242, 1, 1, 1, 1, 1,
1.078009, 0.7359555, 0.6408581, 1, 1, 1, 1, 1,
1.081881, -1.608568, 1.076496, 1, 1, 1, 1, 1,
1.082608, -0.8230211, 2.843504, 1, 1, 1, 1, 1,
1.090242, 0.471322, 2.406169, 0, 0, 1, 1, 1,
1.099391, 0.09250486, -0.1124914, 1, 0, 0, 1, 1,
1.102977, -0.5004255, 0.8195803, 1, 0, 0, 1, 1,
1.111487, -0.9315515, 1.965876, 1, 0, 0, 1, 1,
1.131716, 0.5802547, 1.808425, 1, 0, 0, 1, 1,
1.151409, 1.162857, -0.5603588, 1, 0, 0, 1, 1,
1.160152, 1.341577, 0.6844473, 0, 0, 0, 1, 1,
1.170352, -0.6719722, 2.125329, 0, 0, 0, 1, 1,
1.170847, -0.4840091, 1.941212, 0, 0, 0, 1, 1,
1.173703, 0.252634, 2.391978, 0, 0, 0, 1, 1,
1.173984, 1.11784, 1.253938, 0, 0, 0, 1, 1,
1.181741, -0.5346144, 3.28359, 0, 0, 0, 1, 1,
1.18488, 0.7856194, 0.6150662, 0, 0, 0, 1, 1,
1.189746, 0.6509699, 0.8081664, 1, 1, 1, 1, 1,
1.194672, -1.213515, 0.8866071, 1, 1, 1, 1, 1,
1.205855, -0.5553086, 2.484964, 1, 1, 1, 1, 1,
1.21761, -1.601388, 1.570376, 1, 1, 1, 1, 1,
1.219845, 2.209395, 1.533232, 1, 1, 1, 1, 1,
1.225134, -0.5316615, 2.034866, 1, 1, 1, 1, 1,
1.226293, -0.8486359, 1.624324, 1, 1, 1, 1, 1,
1.229605, 0.8826573, 2.15844, 1, 1, 1, 1, 1,
1.234506, -1.774421, 2.651214, 1, 1, 1, 1, 1,
1.237037, 1.512916, 0.7765945, 1, 1, 1, 1, 1,
1.241518, 0.7578993, 2.037403, 1, 1, 1, 1, 1,
1.242801, -0.5987126, 1.798832, 1, 1, 1, 1, 1,
1.256303, -0.6794374, 2.227784, 1, 1, 1, 1, 1,
1.261327, 0.2134272, 1.358512, 1, 1, 1, 1, 1,
1.269489, 0.1582367, 0.4937377, 1, 1, 1, 1, 1,
1.287347, 1.3037, 1.797296, 0, 0, 1, 1, 1,
1.289556, 0.4150004, 0.1290721, 1, 0, 0, 1, 1,
1.289739, -0.5803895, 1.870542, 1, 0, 0, 1, 1,
1.29275, 0.4352531, 0.8405495, 1, 0, 0, 1, 1,
1.297778, -0.7695793, 1.867436, 1, 0, 0, 1, 1,
1.307963, -0.5571504, 4.905048, 1, 0, 0, 1, 1,
1.311669, 0.07055338, 0.5818766, 0, 0, 0, 1, 1,
1.313856, -0.8743143, 2.364862, 0, 0, 0, 1, 1,
1.318713, -0.1633186, 1.781152, 0, 0, 0, 1, 1,
1.320377, 1.258754, 0.1708259, 0, 0, 0, 1, 1,
1.320829, 0.3742541, 1.602553, 0, 0, 0, 1, 1,
1.321046, -0.08131927, 3.814209, 0, 0, 0, 1, 1,
1.327074, 1.889097, 0.2775229, 0, 0, 0, 1, 1,
1.341488, -2.59094, 2.265056, 1, 1, 1, 1, 1,
1.345024, 0.3525617, 1.712242, 1, 1, 1, 1, 1,
1.347552, -0.486437, 3.072015, 1, 1, 1, 1, 1,
1.348819, -1.1143, 1.281166, 1, 1, 1, 1, 1,
1.349761, -1.329645, 2.834623, 1, 1, 1, 1, 1,
1.355929, 0.228298, 0.9375197, 1, 1, 1, 1, 1,
1.35683, -0.2871733, 1.92754, 1, 1, 1, 1, 1,
1.361535, 0.5391253, 2.001903, 1, 1, 1, 1, 1,
1.366424, -1.782466, 3.060124, 1, 1, 1, 1, 1,
1.36893, -0.3099001, 1.291366, 1, 1, 1, 1, 1,
1.370339, -0.6562393, 2.347279, 1, 1, 1, 1, 1,
1.370667, 0.1956865, 2.238359, 1, 1, 1, 1, 1,
1.382256, -1.548711, 2.662035, 1, 1, 1, 1, 1,
1.39311, -0.5169616, 1.613825, 1, 1, 1, 1, 1,
1.393681, 1.294188, 0.9817392, 1, 1, 1, 1, 1,
1.394447, -1.450911, 1.293656, 0, 0, 1, 1, 1,
1.39957, -1.217365, 2.518183, 1, 0, 0, 1, 1,
1.401513, 1.427196, 1.004221, 1, 0, 0, 1, 1,
1.405676, 0.8701307, 0.5067644, 1, 0, 0, 1, 1,
1.408874, -0.6132998, 1.994962, 1, 0, 0, 1, 1,
1.411213, 0.4348864, -0.9120076, 1, 0, 0, 1, 1,
1.415065, 0.4475105, 2.204315, 0, 0, 0, 1, 1,
1.416303, 1.000703, 0.05586859, 0, 0, 0, 1, 1,
1.42468, 0.1761504, 2.894608, 0, 0, 0, 1, 1,
1.437352, 0.5318233, -0.2666502, 0, 0, 0, 1, 1,
1.447676, -1.276021, 3.41982, 0, 0, 0, 1, 1,
1.463022, -2.118558, 3.017643, 0, 0, 0, 1, 1,
1.466781, 1.906433, 1.486087, 0, 0, 0, 1, 1,
1.47801, -1.073897, 2.802563, 1, 1, 1, 1, 1,
1.487778, 1.774757, 0.6426379, 1, 1, 1, 1, 1,
1.488906, 0.951203, 0.3936096, 1, 1, 1, 1, 1,
1.496142, 1.795627, 2.252965, 1, 1, 1, 1, 1,
1.500837, -0.9333192, 0.3654334, 1, 1, 1, 1, 1,
1.505209, 0.1574496, 1.411518, 1, 1, 1, 1, 1,
1.508146, 0.09398345, 0.9867027, 1, 1, 1, 1, 1,
1.509735, -1.623533, 1.242092, 1, 1, 1, 1, 1,
1.511768, -0.1410924, 1.958022, 1, 1, 1, 1, 1,
1.538797, -1.168412, 2.976671, 1, 1, 1, 1, 1,
1.545222, -0.403348, 3.128162, 1, 1, 1, 1, 1,
1.551015, 1.056971, 0.3820745, 1, 1, 1, 1, 1,
1.55281, 1.085901, 1.85242, 1, 1, 1, 1, 1,
1.556278, -1.109951, 2.411725, 1, 1, 1, 1, 1,
1.562935, -0.1636439, 3.304468, 1, 1, 1, 1, 1,
1.568552, 1.560113, 0.2960352, 0, 0, 1, 1, 1,
1.571665, 0.8907306, 1.421521, 1, 0, 0, 1, 1,
1.581447, -0.6122487, 2.365009, 1, 0, 0, 1, 1,
1.588741, -0.2955134, 1.571316, 1, 0, 0, 1, 1,
1.600921, 0.3466617, 1.406681, 1, 0, 0, 1, 1,
1.602527, 0.6156741, 0.5778171, 1, 0, 0, 1, 1,
1.619889, 2.050454, 0.06620003, 0, 0, 0, 1, 1,
1.676625, 0.5511479, 2.08933, 0, 0, 0, 1, 1,
1.691872, 0.108689, 1.545707, 0, 0, 0, 1, 1,
1.702941, -0.7594953, 2.086769, 0, 0, 0, 1, 1,
1.715824, 0.3017772, 1.948689, 0, 0, 0, 1, 1,
1.718527, -0.1497744, 1.651648, 0, 0, 0, 1, 1,
1.767201, -0.5286331, 0.5489769, 0, 0, 0, 1, 1,
1.78418, -0.238167, 2.967161, 1, 1, 1, 1, 1,
1.787061, 1.966881, 1.716914, 1, 1, 1, 1, 1,
1.787605, -1.335449, 1.687544, 1, 1, 1, 1, 1,
1.809116, 1.222753, 0.007761279, 1, 1, 1, 1, 1,
1.821295, -0.6182941, 0.8683913, 1, 1, 1, 1, 1,
1.827604, 0.02450174, 1.50181, 1, 1, 1, 1, 1,
1.828324, 2.404454, 0.5483132, 1, 1, 1, 1, 1,
1.836856, -0.4297012, 0.9889404, 1, 1, 1, 1, 1,
1.844465, 0.333747, 2.880803, 1, 1, 1, 1, 1,
1.85642, -1.175186, 3.849909, 1, 1, 1, 1, 1,
1.900462, -1.181119, 1.385838, 1, 1, 1, 1, 1,
1.904027, -0.7982968, 0.7588756, 1, 1, 1, 1, 1,
1.933957, 0.4655103, 1.376458, 1, 1, 1, 1, 1,
1.951074, 2.205478, -1.376632, 1, 1, 1, 1, 1,
1.955771, -0.2188794, 1.832447, 1, 1, 1, 1, 1,
1.970711, 1.374901, -0.1005413, 0, 0, 1, 1, 1,
1.976347, 0.6808565, 0.6884406, 1, 0, 0, 1, 1,
1.978932, 1.506601, -0.4687178, 1, 0, 0, 1, 1,
1.98834, 0.2323532, 2.05473, 1, 0, 0, 1, 1,
2.002231, -0.8384721, 2.090844, 1, 0, 0, 1, 1,
2.004679, -0.8853453, 1.837581, 1, 0, 0, 1, 1,
2.082829, 0.5928946, 0.3544958, 0, 0, 0, 1, 1,
2.105738, 0.289398, 0.570291, 0, 0, 0, 1, 1,
2.116248, -0.03543979, 1.786086, 0, 0, 0, 1, 1,
2.135121, 0.8595188, 0.3327543, 0, 0, 0, 1, 1,
2.149559, 1.138251, 1.196444, 0, 0, 0, 1, 1,
2.204531, -0.2083743, -0.5394708, 0, 0, 0, 1, 1,
2.211213, -0.7945569, 1.43009, 0, 0, 0, 1, 1,
2.370922, 0.2079938, 0.8144591, 1, 1, 1, 1, 1,
2.373746, -1.642073, 3.218047, 1, 1, 1, 1, 1,
2.385803, 0.5977866, 2.902133, 1, 1, 1, 1, 1,
2.529869, -0.5255489, 0.6885512, 1, 1, 1, 1, 1,
2.552651, 0.9065432, 1.801183, 1, 1, 1, 1, 1,
2.708452, 0.2731092, 1.592478, 1, 1, 1, 1, 1,
2.991146, 0.3661641, 1.04025, 1, 1, 1, 1, 1
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
var radius = 9.993151;
var distance = 35.10052;
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
mvMatrix.translate( 0.5163835, 0.134748, 0.2670524 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.10052);
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
