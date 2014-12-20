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
-3.252279, -1.331987, -2.328684, 1, 0, 0, 1,
-2.779282, -0.1747264, -1.234632, 1, 0.007843138, 0, 1,
-2.57615, -0.04260624, -0.186738, 1, 0.01176471, 0, 1,
-2.513436, 1.101329, -0.7948833, 1, 0.01960784, 0, 1,
-2.508248, -2.296415, -2.187325, 1, 0.02352941, 0, 1,
-2.484813, 0.4489444, -1.379517, 1, 0.03137255, 0, 1,
-2.429185, -0.5833085, -2.795124, 1, 0.03529412, 0, 1,
-2.427016, 0.1179469, -1.569142, 1, 0.04313726, 0, 1,
-2.393517, -0.1712125, -2.146745, 1, 0.04705882, 0, 1,
-2.390012, -0.3021615, -0.9357845, 1, 0.05490196, 0, 1,
-2.364712, -0.2114965, -2.272907, 1, 0.05882353, 0, 1,
-2.336095, 0.09929856, -2.26993, 1, 0.06666667, 0, 1,
-2.264591, -0.1544673, -1.151348, 1, 0.07058824, 0, 1,
-2.139895, 0.8983395, -0.5767528, 1, 0.07843138, 0, 1,
-2.119623, -0.01508053, -0.6739042, 1, 0.08235294, 0, 1,
-2.113565, 0.2704063, 0.1080617, 1, 0.09019608, 0, 1,
-2.112955, 1.059566, -2.131268, 1, 0.09411765, 0, 1,
-2.093308, 0.7850655, -2.130608, 1, 0.1019608, 0, 1,
-2.092132, 0.9728975, -1.689809, 1, 0.1098039, 0, 1,
-2.070332, 0.5442985, -1.587605, 1, 0.1137255, 0, 1,
-2.043961, -0.6769672, -3.106744, 1, 0.1215686, 0, 1,
-2.041084, 0.3725592, -1.187789, 1, 0.1254902, 0, 1,
-2.025568, -1.481874, -3.078114, 1, 0.1333333, 0, 1,
-1.977653, 0.3821941, -0.5985502, 1, 0.1372549, 0, 1,
-1.962512, -1.247702, -2.437166, 1, 0.145098, 0, 1,
-1.943293, -2.656013, -6.007867, 1, 0.1490196, 0, 1,
-1.924412, 0.4435348, -0.6901327, 1, 0.1568628, 0, 1,
-1.909, -0.6588737, -2.15069, 1, 0.1607843, 0, 1,
-1.906482, 0.9288331, -1.54563, 1, 0.1686275, 0, 1,
-1.896725, -1.969733, -1.516459, 1, 0.172549, 0, 1,
-1.891731, -1.095859, -1.331987, 1, 0.1803922, 0, 1,
-1.868874, -0.6114932, -1.907203, 1, 0.1843137, 0, 1,
-1.865232, 0.6033074, -1.566003, 1, 0.1921569, 0, 1,
-1.86261, -1.310054, -0.8780521, 1, 0.1960784, 0, 1,
-1.846833, -0.2662083, -2.332145, 1, 0.2039216, 0, 1,
-1.819037, -1.844836, -0.928942, 1, 0.2117647, 0, 1,
-1.806856, -1.493578, -2.702699, 1, 0.2156863, 0, 1,
-1.797754, 1.822191, -0.4684848, 1, 0.2235294, 0, 1,
-1.78256, -0.1352052, -2.898208, 1, 0.227451, 0, 1,
-1.77891, 0.1089509, 0.37773, 1, 0.2352941, 0, 1,
-1.760159, 1.284503, -1.957281, 1, 0.2392157, 0, 1,
-1.759082, -0.2822277, -0.5013691, 1, 0.2470588, 0, 1,
-1.718205, -0.8850394, -0.7828833, 1, 0.2509804, 0, 1,
-1.70718, 0.4967609, -1.176214, 1, 0.2588235, 0, 1,
-1.694292, 0.3846948, -1.218787, 1, 0.2627451, 0, 1,
-1.69197, 0.1505441, -1.606994, 1, 0.2705882, 0, 1,
-1.682747, -0.3811999, -1.386958, 1, 0.2745098, 0, 1,
-1.678153, -0.140383, -2.451222, 1, 0.282353, 0, 1,
-1.671574, -0.5231939, -2.13972, 1, 0.2862745, 0, 1,
-1.670704, 0.4519737, -0.8632191, 1, 0.2941177, 0, 1,
-1.667882, -1.292997, -2.38217, 1, 0.3019608, 0, 1,
-1.661318, 0.1423421, -0.3291154, 1, 0.3058824, 0, 1,
-1.656956, -0.06640064, -3.099834, 1, 0.3137255, 0, 1,
-1.655479, 0.143507, -1.219519, 1, 0.3176471, 0, 1,
-1.642927, 0.7011604, -1.335876, 1, 0.3254902, 0, 1,
-1.639176, -1.143459, -1.781725, 1, 0.3294118, 0, 1,
-1.630854, 1.800083, -2.417386, 1, 0.3372549, 0, 1,
-1.629711, 0.5569222, -1.498287, 1, 0.3411765, 0, 1,
-1.618593, 2.810236, 0.2086402, 1, 0.3490196, 0, 1,
-1.616043, 1.952748, 0.6826689, 1, 0.3529412, 0, 1,
-1.611146, -0.9827591, -2.025165, 1, 0.3607843, 0, 1,
-1.60795, -0.7514459, -3.110324, 1, 0.3647059, 0, 1,
-1.598888, 0.09255748, -1.807284, 1, 0.372549, 0, 1,
-1.58722, -1.224064, -2.219798, 1, 0.3764706, 0, 1,
-1.582603, 0.4448282, -0.01828572, 1, 0.3843137, 0, 1,
-1.581401, 1.364733, -0.6730815, 1, 0.3882353, 0, 1,
-1.578886, 0.5505118, -0.7452105, 1, 0.3960784, 0, 1,
-1.573135, -0.04249541, -1.420692, 1, 0.4039216, 0, 1,
-1.565457, -1.057005, -2.33836, 1, 0.4078431, 0, 1,
-1.558503, 1.650645, -1.136257, 1, 0.4156863, 0, 1,
-1.547065, 0.982729, -0.7170708, 1, 0.4196078, 0, 1,
-1.546787, -0.04522702, -0.9096612, 1, 0.427451, 0, 1,
-1.545298, -0.698014, -3.141048, 1, 0.4313726, 0, 1,
-1.521866, -0.1456657, 0.7744484, 1, 0.4392157, 0, 1,
-1.515804, 0.5718766, -0.9347439, 1, 0.4431373, 0, 1,
-1.500203, -0.5600032, -1.69639, 1, 0.4509804, 0, 1,
-1.493737, -0.3012622, -1.782978, 1, 0.454902, 0, 1,
-1.473741, -0.1542454, -1.567795, 1, 0.4627451, 0, 1,
-1.464788, 0.329507, 0.7741727, 1, 0.4666667, 0, 1,
-1.459469, 0.8431887, -1.537326, 1, 0.4745098, 0, 1,
-1.45585, 0.8345093, 0.5621284, 1, 0.4784314, 0, 1,
-1.45366, 0.3584904, 0.07966559, 1, 0.4862745, 0, 1,
-1.435593, 1.461414, -0.0363665, 1, 0.4901961, 0, 1,
-1.434665, -0.3152818, -0.2574369, 1, 0.4980392, 0, 1,
-1.43176, 1.089869, -0.06037651, 1, 0.5058824, 0, 1,
-1.428837, 0.3116352, -1.839671, 1, 0.509804, 0, 1,
-1.404997, 1.693273, -1.455744, 1, 0.5176471, 0, 1,
-1.398912, -0.08692735, -2.803244, 1, 0.5215687, 0, 1,
-1.392517, -2.037527, -1.607903, 1, 0.5294118, 0, 1,
-1.386501, -1.238692, -2.424316, 1, 0.5333334, 0, 1,
-1.384316, 0.6764946, -0.2859128, 1, 0.5411765, 0, 1,
-1.368897, -0.413972, -0.1483156, 1, 0.5450981, 0, 1,
-1.36216, 0.3304595, -2.329584, 1, 0.5529412, 0, 1,
-1.35816, 0.3825782, -2.691185, 1, 0.5568628, 0, 1,
-1.343191, -0.09038831, -2.729808, 1, 0.5647059, 0, 1,
-1.337083, -1.967968, -1.128388, 1, 0.5686275, 0, 1,
-1.328278, 0.5490898, -0.5720105, 1, 0.5764706, 0, 1,
-1.322767, -0.2392282, -2.842092, 1, 0.5803922, 0, 1,
-1.315813, -0.7633731, -2.039256, 1, 0.5882353, 0, 1,
-1.315192, -0.1024614, -0.9324259, 1, 0.5921569, 0, 1,
-1.308974, 0.5443366, -0.5652485, 1, 0.6, 0, 1,
-1.303703, -0.5988125, -3.849829, 1, 0.6078432, 0, 1,
-1.30296, -1.396457, 1.217977, 1, 0.6117647, 0, 1,
-1.287211, -0.2887585, -1.987407, 1, 0.6196079, 0, 1,
-1.28346, -0.2274823, -1.254871, 1, 0.6235294, 0, 1,
-1.272683, 0.6667054, -0.8450606, 1, 0.6313726, 0, 1,
-1.25953, 0.3508789, -2.537831, 1, 0.6352941, 0, 1,
-1.255808, -1.608021, -1.534787, 1, 0.6431373, 0, 1,
-1.252392, -0.03569425, -0.3106025, 1, 0.6470588, 0, 1,
-1.251166, 2.033139, -1.579915, 1, 0.654902, 0, 1,
-1.246783, -0.1475258, -2.395066, 1, 0.6588235, 0, 1,
-1.245162, -0.05357719, -3.136095, 1, 0.6666667, 0, 1,
-1.243964, -0.7631629, -1.984655, 1, 0.6705883, 0, 1,
-1.238965, 1.573045, 0.3727908, 1, 0.6784314, 0, 1,
-1.223206, 0.3578745, -0.2029678, 1, 0.682353, 0, 1,
-1.214583, -2.519217, -2.817314, 1, 0.6901961, 0, 1,
-1.214156, 0.9845227, -0.1937922, 1, 0.6941177, 0, 1,
-1.210714, -1.858349, -1.864132, 1, 0.7019608, 0, 1,
-1.208927, 0.645322, -0.7853826, 1, 0.7098039, 0, 1,
-1.205971, 0.3976271, -3.205783, 1, 0.7137255, 0, 1,
-1.196325, 0.6013756, -0.008913475, 1, 0.7215686, 0, 1,
-1.195481, 0.2416022, -0.2427527, 1, 0.7254902, 0, 1,
-1.190346, 0.3256056, -1.470037, 1, 0.7333333, 0, 1,
-1.174635, -3.175119, -2.040903, 1, 0.7372549, 0, 1,
-1.167307, 1.702787, -0.7067246, 1, 0.7450981, 0, 1,
-1.163158, -0.2202494, -1.045862, 1, 0.7490196, 0, 1,
-1.16212, -1.162453, -1.735631, 1, 0.7568628, 0, 1,
-1.158473, 0.03872919, -0.8038013, 1, 0.7607843, 0, 1,
-1.157714, 0.9562067, 0.5295715, 1, 0.7686275, 0, 1,
-1.153997, 1.47602, 0.007308084, 1, 0.772549, 0, 1,
-1.148619, 0.2744791, -0.02488833, 1, 0.7803922, 0, 1,
-1.140818, -0.8148044, -2.346587, 1, 0.7843137, 0, 1,
-1.138943, -0.7524897, -1.822032, 1, 0.7921569, 0, 1,
-1.138695, 0.2388202, -2.884007, 1, 0.7960784, 0, 1,
-1.134858, 1.651804, 0.5414631, 1, 0.8039216, 0, 1,
-1.132335, 0.03472131, -2.292904, 1, 0.8117647, 0, 1,
-1.129032, 0.7675343, 0.4601196, 1, 0.8156863, 0, 1,
-1.123783, -1.172494, -0.4876368, 1, 0.8235294, 0, 1,
-1.123667, -0.9347449, -4.682487, 1, 0.827451, 0, 1,
-1.118087, -1.429905, -0.8559778, 1, 0.8352941, 0, 1,
-1.11743, 0.5795572, -0.5504816, 1, 0.8392157, 0, 1,
-1.114066, 1.106125, -0.5908332, 1, 0.8470588, 0, 1,
-1.101537, -0.7808716, -2.984191, 1, 0.8509804, 0, 1,
-1.094702, 1.499707, -0.9227611, 1, 0.8588235, 0, 1,
-1.08486, 0.5361592, 0.4745624, 1, 0.8627451, 0, 1,
-1.076251, -0.5233371, -2.297066, 1, 0.8705882, 0, 1,
-1.069633, 1.208497, 0.792537, 1, 0.8745098, 0, 1,
-1.068651, -0.5525573, -3.891167, 1, 0.8823529, 0, 1,
-1.057307, -0.3358676, -1.104509, 1, 0.8862745, 0, 1,
-1.052876, 0.7484936, -1.578884, 1, 0.8941177, 0, 1,
-1.052395, 0.682887, -1.054213, 1, 0.8980392, 0, 1,
-1.049358, -0.238171, -3.465456, 1, 0.9058824, 0, 1,
-1.046619, 0.01433209, -1.875117, 1, 0.9137255, 0, 1,
-1.037748, -1.131246, -1.933758, 1, 0.9176471, 0, 1,
-1.03219, 1.750673, -0.9226906, 1, 0.9254902, 0, 1,
-1.030361, -0.1859622, -1.272166, 1, 0.9294118, 0, 1,
-1.027238, 1.455267, 0.0829801, 1, 0.9372549, 0, 1,
-1.019812, 0.2258756, -0.3588856, 1, 0.9411765, 0, 1,
-1.012894, -2.031465, -4.641523, 1, 0.9490196, 0, 1,
-1.009531, -1.692975, -2.279052, 1, 0.9529412, 0, 1,
-1.00884, -1.173064, -2.940648, 1, 0.9607843, 0, 1,
-1.006629, -1.283845, -2.42675, 1, 0.9647059, 0, 1,
-1.000947, 1.438484, 0.8327511, 1, 0.972549, 0, 1,
-0.9998973, 0.6176131, -1.914114, 1, 0.9764706, 0, 1,
-0.993095, -0.6909504, -1.10318, 1, 0.9843137, 0, 1,
-0.9902858, -1.16202, -3.489125, 1, 0.9882353, 0, 1,
-0.9874793, 1.010334, -0.1290682, 1, 0.9960784, 0, 1,
-0.9813987, 1.955354, 1.38259, 0.9960784, 1, 0, 1,
-0.9802203, 0.7256261, -1.750911, 0.9921569, 1, 0, 1,
-0.9768776, -0.203385, -2.360096, 0.9843137, 1, 0, 1,
-0.9720917, 1.004879, 0.175336, 0.9803922, 1, 0, 1,
-0.9671977, 0.4092288, -2.87749, 0.972549, 1, 0, 1,
-0.9648568, -0.1605637, -0.2413527, 0.9686275, 1, 0, 1,
-0.9631926, -0.8849598, -2.013718, 0.9607843, 1, 0, 1,
-0.9611852, -0.0430965, -0.106914, 0.9568627, 1, 0, 1,
-0.9549725, 1.994595, -0.6124015, 0.9490196, 1, 0, 1,
-0.9475644, 1.237084, -1.685358, 0.945098, 1, 0, 1,
-0.9437311, -1.357355, -1.35143, 0.9372549, 1, 0, 1,
-0.9403858, -0.3290413, -2.995142, 0.9333333, 1, 0, 1,
-0.9342306, -1.19396, -3.267666, 0.9254902, 1, 0, 1,
-0.9320816, -0.690129, -2.615898, 0.9215686, 1, 0, 1,
-0.9304241, -0.3130496, -2.670663, 0.9137255, 1, 0, 1,
-0.927295, 1.071544, -1.845482, 0.9098039, 1, 0, 1,
-0.9246671, 1.29626, 0.2219769, 0.9019608, 1, 0, 1,
-0.9209855, 0.9447501, -1.986487, 0.8941177, 1, 0, 1,
-0.9142697, 1.000463, -0.2042569, 0.8901961, 1, 0, 1,
-0.9120636, 0.4098182, -0.7200468, 0.8823529, 1, 0, 1,
-0.9053872, -0.8899567, -1.476053, 0.8784314, 1, 0, 1,
-0.9038711, -1.071695, -2.101382, 0.8705882, 1, 0, 1,
-0.899699, 0.2124093, -2.809026, 0.8666667, 1, 0, 1,
-0.8980365, 1.665301, -0.7887899, 0.8588235, 1, 0, 1,
-0.8902356, 0.9907548, 0.9233537, 0.854902, 1, 0, 1,
-0.8901967, -0.006464062, -0.9499574, 0.8470588, 1, 0, 1,
-0.8856076, -0.5836, -2.474775, 0.8431373, 1, 0, 1,
-0.8845233, 0.642492, -0.8391313, 0.8352941, 1, 0, 1,
-0.8842439, -1.323099, -1.360039, 0.8313726, 1, 0, 1,
-0.8841023, -0.03998516, -0.8980935, 0.8235294, 1, 0, 1,
-0.8802946, -1.071701, -2.669582, 0.8196079, 1, 0, 1,
-0.8763305, 0.7770553, -0.3389717, 0.8117647, 1, 0, 1,
-0.8699651, 1.008966, -2.180772, 0.8078431, 1, 0, 1,
-0.8692111, 2.438027, -2.023307, 0.8, 1, 0, 1,
-0.8641152, -2.030413, -1.589985, 0.7921569, 1, 0, 1,
-0.8619576, 0.1097017, -1.866877, 0.7882353, 1, 0, 1,
-0.8592517, -0.4115347, -0.1390307, 0.7803922, 1, 0, 1,
-0.8590664, -1.391062, -1.474477, 0.7764706, 1, 0, 1,
-0.848851, -0.9779364, -2.217786, 0.7686275, 1, 0, 1,
-0.8481272, -0.006334994, -1.915685, 0.7647059, 1, 0, 1,
-0.8479328, -0.1004099, -2.661401, 0.7568628, 1, 0, 1,
-0.842489, -0.2380017, -1.799964, 0.7529412, 1, 0, 1,
-0.8356788, 1.959659, -0.8727736, 0.7450981, 1, 0, 1,
-0.8290098, -1.879079, -4.170463, 0.7411765, 1, 0, 1,
-0.8274148, 0.128162, -1.429523, 0.7333333, 1, 0, 1,
-0.8254268, -1.271625, -2.314311, 0.7294118, 1, 0, 1,
-0.8168689, 1.406421, 0.6190909, 0.7215686, 1, 0, 1,
-0.8155409, -1.314603, -2.246341, 0.7176471, 1, 0, 1,
-0.8153011, -1.008061, -3.479522, 0.7098039, 1, 0, 1,
-0.8132582, 0.9582728, -1.77643, 0.7058824, 1, 0, 1,
-0.7942004, 0.3109245, -1.299151, 0.6980392, 1, 0, 1,
-0.7905977, -0.8714728, -1.110405, 0.6901961, 1, 0, 1,
-0.7898297, 1.092912, -0.4945243, 0.6862745, 1, 0, 1,
-0.7887719, 1.049621, 0.5726444, 0.6784314, 1, 0, 1,
-0.7782952, -1.195266, -1.794741, 0.6745098, 1, 0, 1,
-0.7719494, -0.3454494, -0.4359615, 0.6666667, 1, 0, 1,
-0.7699713, -0.670675, -2.380806, 0.6627451, 1, 0, 1,
-0.7667758, 0.4149794, -1.690718, 0.654902, 1, 0, 1,
-0.7638372, -0.2739769, -0.6965619, 0.6509804, 1, 0, 1,
-0.7588522, 1.675035, -1.072284, 0.6431373, 1, 0, 1,
-0.7560254, 0.2934738, -1.110889, 0.6392157, 1, 0, 1,
-0.7516099, 1.480604, -1.381571, 0.6313726, 1, 0, 1,
-0.7388759, -0.8762086, -1.343633, 0.627451, 1, 0, 1,
-0.7388417, 0.5467641, -0.280381, 0.6196079, 1, 0, 1,
-0.7388145, -0.1103969, -1.902755, 0.6156863, 1, 0, 1,
-0.735826, 1.687566, -0.9639407, 0.6078432, 1, 0, 1,
-0.7230664, -0.4788463, -0.3972746, 0.6039216, 1, 0, 1,
-0.7218774, -0.1269546, -1.821278, 0.5960785, 1, 0, 1,
-0.7157814, -1.409738, -2.847696, 0.5882353, 1, 0, 1,
-0.7110111, -0.4218944, -2.281219, 0.5843138, 1, 0, 1,
-0.7108519, -0.5826123, -2.208997, 0.5764706, 1, 0, 1,
-0.7101458, 0.5478175, -1.476764, 0.572549, 1, 0, 1,
-0.7057979, 0.07087435, -0.9891354, 0.5647059, 1, 0, 1,
-0.7055595, -0.4635254, -1.118354, 0.5607843, 1, 0, 1,
-0.7047972, 0.6249313, -1.169182, 0.5529412, 1, 0, 1,
-0.7035401, 1.015624, -0.1090275, 0.5490196, 1, 0, 1,
-0.7007157, -0.921024, -2.540778, 0.5411765, 1, 0, 1,
-0.6985593, 0.2631359, -1.23028, 0.5372549, 1, 0, 1,
-0.6967174, 0.2314702, -0.7480781, 0.5294118, 1, 0, 1,
-0.6912699, 2.123329, 0.7682037, 0.5254902, 1, 0, 1,
-0.6911234, -0.8217013, -1.283667, 0.5176471, 1, 0, 1,
-0.6911114, -0.1256912, -2.879636, 0.5137255, 1, 0, 1,
-0.6910766, 1.824538, 0.7237349, 0.5058824, 1, 0, 1,
-0.6876273, 1.369282, 0.5441415, 0.5019608, 1, 0, 1,
-0.6876066, 0.4984787, -1.682859, 0.4941176, 1, 0, 1,
-0.6855981, -0.7006715, -3.272156, 0.4862745, 1, 0, 1,
-0.6846467, -0.5287654, -0.9122145, 0.4823529, 1, 0, 1,
-0.6843031, -0.651514, -2.532569, 0.4745098, 1, 0, 1,
-0.6841194, -1.517917, -0.8907838, 0.4705882, 1, 0, 1,
-0.683301, -0.8793677, -2.538594, 0.4627451, 1, 0, 1,
-0.6817641, 0.9011112, -1.000142, 0.4588235, 1, 0, 1,
-0.6813555, 2.166379, 0.14567, 0.4509804, 1, 0, 1,
-0.680139, 0.6477458, 0.5768907, 0.4470588, 1, 0, 1,
-0.6796172, 0.577717, -1.213161, 0.4392157, 1, 0, 1,
-0.6769946, -1.927527, -3.437615, 0.4352941, 1, 0, 1,
-0.6725224, -0.2070104, -2.108835, 0.427451, 1, 0, 1,
-0.6724449, 0.3948792, -0.8363399, 0.4235294, 1, 0, 1,
-0.6601621, 2.241489, 0.9023286, 0.4156863, 1, 0, 1,
-0.6587048, 0.545685, -0.949163, 0.4117647, 1, 0, 1,
-0.6557388, -0.9608933, -2.966778, 0.4039216, 1, 0, 1,
-0.647597, 0.3069195, -1.905, 0.3960784, 1, 0, 1,
-0.6403046, 0.1681457, -2.42322, 0.3921569, 1, 0, 1,
-0.637554, -1.146015, -3.841796, 0.3843137, 1, 0, 1,
-0.6353592, 0.3576502, -0.2967779, 0.3803922, 1, 0, 1,
-0.6349876, -0.6384953, -1.836396, 0.372549, 1, 0, 1,
-0.6339504, -0.4689435, -2.973488, 0.3686275, 1, 0, 1,
-0.6324778, 0.1249716, -1.856023, 0.3607843, 1, 0, 1,
-0.6317592, -1.410887, -2.968052, 0.3568628, 1, 0, 1,
-0.6306708, 1.24016, 0.1869874, 0.3490196, 1, 0, 1,
-0.6275281, 1.237399, -0.03101631, 0.345098, 1, 0, 1,
-0.6213517, 0.5882898, -1.846854, 0.3372549, 1, 0, 1,
-0.6161338, 1.55606, -0.5280584, 0.3333333, 1, 0, 1,
-0.6116123, 0.467982, -1.495328, 0.3254902, 1, 0, 1,
-0.6111467, 0.3211386, -0.947689, 0.3215686, 1, 0, 1,
-0.6100701, -0.1476546, -3.150199, 0.3137255, 1, 0, 1,
-0.609705, -0.4928466, -1.402037, 0.3098039, 1, 0, 1,
-0.608974, 0.1605629, 0.5178457, 0.3019608, 1, 0, 1,
-0.6048073, -1.544484, -4.87828, 0.2941177, 1, 0, 1,
-0.5963991, -0.420136, -2.931407, 0.2901961, 1, 0, 1,
-0.5923194, -0.4459825, -3.166595, 0.282353, 1, 0, 1,
-0.5873114, 0.7134723, -0.3342274, 0.2784314, 1, 0, 1,
-0.5871392, 0.203314, -2.878523, 0.2705882, 1, 0, 1,
-0.5826637, -0.7549563, -2.931911, 0.2666667, 1, 0, 1,
-0.5821047, 0.07504, -2.503016, 0.2588235, 1, 0, 1,
-0.5793786, 1.981809, 1.114206, 0.254902, 1, 0, 1,
-0.573616, 0.4550628, -0.817731, 0.2470588, 1, 0, 1,
-0.5693302, 0.8002648, -1.425193, 0.2431373, 1, 0, 1,
-0.5686451, -0.05828818, -1.5736, 0.2352941, 1, 0, 1,
-0.5641414, 0.8714144, -1.077263, 0.2313726, 1, 0, 1,
-0.5613402, -0.2510135, -2.500453, 0.2235294, 1, 0, 1,
-0.5605223, 0.3779038, -1.296984, 0.2196078, 1, 0, 1,
-0.5598324, 0.4041733, -1.702368, 0.2117647, 1, 0, 1,
-0.5596711, -0.4833878, -3.155334, 0.2078431, 1, 0, 1,
-0.5507078, -0.2142401, -1.755345, 0.2, 1, 0, 1,
-0.545395, -1.497405, -2.280507, 0.1921569, 1, 0, 1,
-0.5435162, 0.7561005, -1.211604, 0.1882353, 1, 0, 1,
-0.5395483, 0.05263862, -0.8409861, 0.1803922, 1, 0, 1,
-0.536182, 1.337585, -0.9834041, 0.1764706, 1, 0, 1,
-0.5334299, -0.9712112, -2.882708, 0.1686275, 1, 0, 1,
-0.5321945, 0.6480311, 0.5630308, 0.1647059, 1, 0, 1,
-0.5288612, -0.6443065, -1.681411, 0.1568628, 1, 0, 1,
-0.5276464, 0.9862567, -2.117396, 0.1529412, 1, 0, 1,
-0.5258197, -0.4241079, -2.036243, 0.145098, 1, 0, 1,
-0.5250742, 0.6830921, 0.8465851, 0.1411765, 1, 0, 1,
-0.523849, 0.04913557, -0.8747742, 0.1333333, 1, 0, 1,
-0.5215759, -0.1834665, -2.594846, 0.1294118, 1, 0, 1,
-0.5204536, -0.4488508, -3.190918, 0.1215686, 1, 0, 1,
-0.5175436, 0.9394383, 0.2002103, 0.1176471, 1, 0, 1,
-0.5107173, 0.8839126, -0.9873464, 0.1098039, 1, 0, 1,
-0.5103394, -1.161721, -3.77308, 0.1058824, 1, 0, 1,
-0.5083862, -1.585094, -4.309719, 0.09803922, 1, 0, 1,
-0.5009429, 0.4270833, -1.382541, 0.09019608, 1, 0, 1,
-0.4996931, -1.146196, -3.088509, 0.08627451, 1, 0, 1,
-0.4955177, 0.1493625, -0.6706841, 0.07843138, 1, 0, 1,
-0.4919509, -1.447859, -2.055402, 0.07450981, 1, 0, 1,
-0.4863974, 0.4730953, -0.9694911, 0.06666667, 1, 0, 1,
-0.4814414, 0.3294253, -0.08485839, 0.0627451, 1, 0, 1,
-0.480255, 1.132833, 0.7938548, 0.05490196, 1, 0, 1,
-0.4790167, -0.8591456, -3.329619, 0.05098039, 1, 0, 1,
-0.4784026, 0.3121313, -1.63275, 0.04313726, 1, 0, 1,
-0.4682641, 0.5127277, 0.3586698, 0.03921569, 1, 0, 1,
-0.4675553, 2.000175, 1.30494, 0.03137255, 1, 0, 1,
-0.4674544, -0.0124558, -2.131463, 0.02745098, 1, 0, 1,
-0.4546711, 0.05255507, -2.305411, 0.01960784, 1, 0, 1,
-0.4524541, -1.075131, -3.615886, 0.01568628, 1, 0, 1,
-0.4523453, 0.08026715, -2.855042, 0.007843138, 1, 0, 1,
-0.4516329, -0.3299678, -2.088702, 0.003921569, 1, 0, 1,
-0.447172, -1.704734, -3.810472, 0, 1, 0.003921569, 1,
-0.4469674, 0.4015981, 0.3866206, 0, 1, 0.01176471, 1,
-0.445862, 0.442894, -2.38653, 0, 1, 0.01568628, 1,
-0.444604, 0.009433916, 0.1640367, 0, 1, 0.02352941, 1,
-0.4413148, -2.025007, -3.361874, 0, 1, 0.02745098, 1,
-0.4376617, 0.2262777, 0.6970882, 0, 1, 0.03529412, 1,
-0.4373352, 0.01181185, -2.959914, 0, 1, 0.03921569, 1,
-0.4336503, 0.4387032, -0.8277339, 0, 1, 0.04705882, 1,
-0.4263119, 0.6202689, -1.78084, 0, 1, 0.05098039, 1,
-0.4261284, -0.1375617, -2.757709, 0, 1, 0.05882353, 1,
-0.4254943, -2.902543, -3.069143, 0, 1, 0.0627451, 1,
-0.4191424, 0.3439179, 0.103895, 0, 1, 0.07058824, 1,
-0.4039087, -0.3948484, -4.500928, 0, 1, 0.07450981, 1,
-0.3971371, -1.260418, -3.432931, 0, 1, 0.08235294, 1,
-0.3970297, -1.46434, -1.807414, 0, 1, 0.08627451, 1,
-0.393989, 0.5378339, -1.551699, 0, 1, 0.09411765, 1,
-0.3882572, 0.5753506, -1.687053, 0, 1, 0.1019608, 1,
-0.3846929, 0.7293452, 0.3078273, 0, 1, 0.1058824, 1,
-0.3717459, 1.690716, -0.02065392, 0, 1, 0.1137255, 1,
-0.3680994, 0.5552096, -1.342639, 0, 1, 0.1176471, 1,
-0.3572353, 1.989089, 1.296007, 0, 1, 0.1254902, 1,
-0.3504851, -1.444527, -3.809985, 0, 1, 0.1294118, 1,
-0.349623, -0.2131173, -0.6205877, 0, 1, 0.1372549, 1,
-0.3466157, 0.3382822, -1.726806, 0, 1, 0.1411765, 1,
-0.3464395, -1.654148, -2.299098, 0, 1, 0.1490196, 1,
-0.3412478, 1.444047, -0.8313065, 0, 1, 0.1529412, 1,
-0.3392414, 1.597385, 1.724549, 0, 1, 0.1607843, 1,
-0.3383356, -0.685541, -2.53347, 0, 1, 0.1647059, 1,
-0.335564, -0.8867022, -2.511734, 0, 1, 0.172549, 1,
-0.3293616, 1.02858, -0.3758755, 0, 1, 0.1764706, 1,
-0.3273166, 0.4910218, 0.09012352, 0, 1, 0.1843137, 1,
-0.3261052, -0.4536614, -1.288662, 0, 1, 0.1882353, 1,
-0.3223882, 1.445928, 0.207045, 0, 1, 0.1960784, 1,
-0.320203, 0.1816083, -2.521358, 0, 1, 0.2039216, 1,
-0.3173565, 1.092257, 1.235304, 0, 1, 0.2078431, 1,
-0.3152945, -2.428206, -3.788888, 0, 1, 0.2156863, 1,
-0.3119264, -0.855625, -3.354722, 0, 1, 0.2196078, 1,
-0.3102622, 0.2260207, -1.048278, 0, 1, 0.227451, 1,
-0.3097575, -0.4585509, -1.790606, 0, 1, 0.2313726, 1,
-0.3066784, 0.7191051, 0.5916224, 0, 1, 0.2392157, 1,
-0.3062133, 1.825008, 0.6020132, 0, 1, 0.2431373, 1,
-0.3028206, 0.8726798, -1.273536, 0, 1, 0.2509804, 1,
-0.2978052, 0.2454109, 1.126535, 0, 1, 0.254902, 1,
-0.2898513, -0.1262502, -2.178225, 0, 1, 0.2627451, 1,
-0.2895606, 1.01649, 0.2812209, 0, 1, 0.2666667, 1,
-0.2883678, -0.4432162, -2.3394, 0, 1, 0.2745098, 1,
-0.283757, 0.1123754, -3.575287, 0, 1, 0.2784314, 1,
-0.2833198, -2.74319, -3.412593, 0, 1, 0.2862745, 1,
-0.2810494, -0.6952859, -3.056056, 0, 1, 0.2901961, 1,
-0.2805638, -0.665704, -0.6679147, 0, 1, 0.2980392, 1,
-0.2798575, -0.2174581, -1.641911, 0, 1, 0.3058824, 1,
-0.279243, -0.08526856, -0.4063979, 0, 1, 0.3098039, 1,
-0.2767234, 0.9639573, -0.3147491, 0, 1, 0.3176471, 1,
-0.2761751, 2.888515, 1.072532, 0, 1, 0.3215686, 1,
-0.2742393, 1.351417, -0.6733166, 0, 1, 0.3294118, 1,
-0.2736634, 0.4120321, 1.040763, 0, 1, 0.3333333, 1,
-0.2715825, -1.096708, -2.651371, 0, 1, 0.3411765, 1,
-0.2653186, -1.275943, -3.891889, 0, 1, 0.345098, 1,
-0.2652052, 1.059388, 0.4801386, 0, 1, 0.3529412, 1,
-0.2584813, -0.6382086, -3.528415, 0, 1, 0.3568628, 1,
-0.2578989, -1.051028, -3.674181, 0, 1, 0.3647059, 1,
-0.2560436, 0.2694539, -0.1908291, 0, 1, 0.3686275, 1,
-0.2517245, -1.183132, -4.30198, 0, 1, 0.3764706, 1,
-0.2474964, -1.039306, -2.992054, 0, 1, 0.3803922, 1,
-0.2450872, -1.497887, -1.985882, 0, 1, 0.3882353, 1,
-0.240834, -1.203181, -2.896569, 0, 1, 0.3921569, 1,
-0.2390243, 0.02712055, -1.511103, 0, 1, 0.4, 1,
-0.2388007, 0.4089383, -0.768241, 0, 1, 0.4078431, 1,
-0.238303, -0.1286093, -2.669481, 0, 1, 0.4117647, 1,
-0.237684, 0.2030693, -3.196694, 0, 1, 0.4196078, 1,
-0.2372674, -0.5189508, -2.87811, 0, 1, 0.4235294, 1,
-0.2360055, 1.649204, -1.642916, 0, 1, 0.4313726, 1,
-0.2318982, -0.9363925, -2.858394, 0, 1, 0.4352941, 1,
-0.230767, -0.4912545, -2.308751, 0, 1, 0.4431373, 1,
-0.2220135, -0.5964422, -3.419832, 0, 1, 0.4470588, 1,
-0.221036, 0.543791, -1.266916, 0, 1, 0.454902, 1,
-0.2203124, -0.5172581, -3.726448, 0, 1, 0.4588235, 1,
-0.2186765, -1.166288, -2.260825, 0, 1, 0.4666667, 1,
-0.2172117, -0.2620581, -3.06204, 0, 1, 0.4705882, 1,
-0.2166663, 0.7718501, 0.4614, 0, 1, 0.4784314, 1,
-0.2162714, 1.778113, -0.5280168, 0, 1, 0.4823529, 1,
-0.2138835, -0.1100744, -1.183816, 0, 1, 0.4901961, 1,
-0.2137993, -1.680924, -2.085121, 0, 1, 0.4941176, 1,
-0.2127748, 1.044673, 0.9292185, 0, 1, 0.5019608, 1,
-0.2076401, -0.4364843, -3.978007, 0, 1, 0.509804, 1,
-0.2024065, 0.4086315, -0.05162121, 0, 1, 0.5137255, 1,
-0.2013626, 1.054424, 0.8132116, 0, 1, 0.5215687, 1,
-0.1944227, -1.01751, -0.5324903, 0, 1, 0.5254902, 1,
-0.1919395, 0.1569492, -0.3076163, 0, 1, 0.5333334, 1,
-0.1908165, 1.098947, 0.3353214, 0, 1, 0.5372549, 1,
-0.1893551, 2.326365, -1.053142, 0, 1, 0.5450981, 1,
-0.1891836, 2.112526, -1.638304, 0, 1, 0.5490196, 1,
-0.1883077, 2.060912, -0.8029734, 0, 1, 0.5568628, 1,
-0.1821006, -0.4939858, -4.583081, 0, 1, 0.5607843, 1,
-0.1768327, 1.496433, 1.435889, 0, 1, 0.5686275, 1,
-0.1730425, 0.3434716, -0.08551507, 0, 1, 0.572549, 1,
-0.1726203, -0.3578859, -3.034322, 0, 1, 0.5803922, 1,
-0.1721264, -0.635529, -2.089039, 0, 1, 0.5843138, 1,
-0.1691466, -0.4825666, -2.227717, 0, 1, 0.5921569, 1,
-0.1661791, -0.7952598, -2.833985, 0, 1, 0.5960785, 1,
-0.1658578, 0.424234, -0.3324156, 0, 1, 0.6039216, 1,
-0.1604202, -0.3776215, -1.983044, 0, 1, 0.6117647, 1,
-0.1598195, -1.43862, -3.387946, 0, 1, 0.6156863, 1,
-0.1579345, 0.2528435, -0.4899392, 0, 1, 0.6235294, 1,
-0.1541747, -1.180824, -3.740579, 0, 1, 0.627451, 1,
-0.1531802, 0.7122391, 0.06145994, 0, 1, 0.6352941, 1,
-0.1484692, -0.719702, -2.365698, 0, 1, 0.6392157, 1,
-0.1455844, 0.06969741, -1.865913, 0, 1, 0.6470588, 1,
-0.1453222, -0.2841719, -1.645266, 0, 1, 0.6509804, 1,
-0.1435991, 1.230159, 1.231511, 0, 1, 0.6588235, 1,
-0.1429256, -0.2833533, -3.300656, 0, 1, 0.6627451, 1,
-0.1427648, -0.693932, -2.229682, 0, 1, 0.6705883, 1,
-0.1376474, 0.8702145, -2.355302, 0, 1, 0.6745098, 1,
-0.1357577, -0.05253571, -2.454992, 0, 1, 0.682353, 1,
-0.1357009, 0.9300541, -1.199787, 0, 1, 0.6862745, 1,
-0.1346151, 0.4475444, 0.03388603, 0, 1, 0.6941177, 1,
-0.1337165, -1.091106, -2.402709, 0, 1, 0.7019608, 1,
-0.1314472, 1.199313, 0.7574895, 0, 1, 0.7058824, 1,
-0.1314407, -1.929541, -2.652913, 0, 1, 0.7137255, 1,
-0.1311227, 1.481155, -0.2685982, 0, 1, 0.7176471, 1,
-0.1305579, -0.4663642, -0.720394, 0, 1, 0.7254902, 1,
-0.124476, -1.252325, -2.829311, 0, 1, 0.7294118, 1,
-0.121956, -0.5061417, -4.594197, 0, 1, 0.7372549, 1,
-0.1201527, 0.6601602, 0.9393494, 0, 1, 0.7411765, 1,
-0.1196408, 0.7516722, 1.153944, 0, 1, 0.7490196, 1,
-0.1174987, -0.4685921, -2.415661, 0, 1, 0.7529412, 1,
-0.1167673, 0.2380792, 0.6708028, 0, 1, 0.7607843, 1,
-0.115174, 0.2288456, -0.2221441, 0, 1, 0.7647059, 1,
-0.1118639, -1.017802, -2.165485, 0, 1, 0.772549, 1,
-0.08987737, 0.3794698, -0.3535305, 0, 1, 0.7764706, 1,
-0.07498224, -1.292093, -3.124123, 0, 1, 0.7843137, 1,
-0.07338867, -0.6314825, -2.171884, 0, 1, 0.7882353, 1,
-0.06102587, -0.5239533, -3.706053, 0, 1, 0.7960784, 1,
-0.05979613, -0.5769771, -4.474838, 0, 1, 0.8039216, 1,
-0.05668798, -1.353603, -3.915084, 0, 1, 0.8078431, 1,
-0.05381698, 1.430766, 0.0009545371, 0, 1, 0.8156863, 1,
-0.05105613, -0.4923289, -3.437628, 0, 1, 0.8196079, 1,
-0.04823254, 0.5452049, 0.1980552, 0, 1, 0.827451, 1,
-0.04383562, -0.05431411, -2.950423, 0, 1, 0.8313726, 1,
-0.0412174, -1.198065, -2.850334, 0, 1, 0.8392157, 1,
-0.03880636, -0.7330881, -5.102832, 0, 1, 0.8431373, 1,
-0.03791182, 0.3985045, -0.9320746, 0, 1, 0.8509804, 1,
-0.03580906, -1.650873, -3.562446, 0, 1, 0.854902, 1,
-0.03574722, -0.9104982, -1.747283, 0, 1, 0.8627451, 1,
-0.03159156, 0.4973387, 0.1295271, 0, 1, 0.8666667, 1,
-0.02978477, 0.3764814, -1.77494, 0, 1, 0.8745098, 1,
-0.02927613, -0.1010135, -2.838646, 0, 1, 0.8784314, 1,
-0.02656461, 1.508371, -0.8403987, 0, 1, 0.8862745, 1,
-0.02078821, 0.8781453, 0.9601758, 0, 1, 0.8901961, 1,
-0.0190004, 1.260619, 0.4029858, 0, 1, 0.8980392, 1,
-0.01891186, 1.357935, 0.2440283, 0, 1, 0.9058824, 1,
-0.01821778, -0.01609375, -3.05748, 0, 1, 0.9098039, 1,
-0.01594725, -0.8254271, -2.079345, 0, 1, 0.9176471, 1,
-0.01525207, -1.346572, -2.354414, 0, 1, 0.9215686, 1,
-0.01469741, -0.1533608, -3.130594, 0, 1, 0.9294118, 1,
-0.0128, -0.01508899, -3.66958, 0, 1, 0.9333333, 1,
-0.012355, 0.4411697, -1.545594, 0, 1, 0.9411765, 1,
0.003135517, 0.6140595, 2.863265, 0, 1, 0.945098, 1,
0.003319258, 1.209275, 0.5845785, 0, 1, 0.9529412, 1,
0.006961275, -0.4332149, 1.833192, 0, 1, 0.9568627, 1,
0.00721622, -0.4825316, 3.124509, 0, 1, 0.9647059, 1,
0.007702241, -2.618523, 2.906171, 0, 1, 0.9686275, 1,
0.008647783, 0.03217289, -0.1170562, 0, 1, 0.9764706, 1,
0.01019525, 1.164137, 1.252247, 0, 1, 0.9803922, 1,
0.01144251, 0.9565045, -0.6147373, 0, 1, 0.9882353, 1,
0.01593011, 0.4728967, -0.2151036, 0, 1, 0.9921569, 1,
0.01715278, 0.2221787, 0.5898712, 0, 1, 1, 1,
0.01749506, -0.5740308, 4.524992, 0, 0.9921569, 1, 1,
0.02296575, -1.287767, 3.134073, 0, 0.9882353, 1, 1,
0.0244368, 0.9149809, -0.3083549, 0, 0.9803922, 1, 1,
0.03615616, -0.4732794, 3.947755, 0, 0.9764706, 1, 1,
0.04682307, 0.1955519, -0.2827612, 0, 0.9686275, 1, 1,
0.04789572, 0.8474033, -0.007802469, 0, 0.9647059, 1, 1,
0.05003924, -0.6390963, 3.471318, 0, 0.9568627, 1, 1,
0.05051079, 0.02618277, 1.018026, 0, 0.9529412, 1, 1,
0.05200139, 0.6813698, -0.7203652, 0, 0.945098, 1, 1,
0.05305421, 0.5378324, -0.2439807, 0, 0.9411765, 1, 1,
0.0535524, 1.805521, -2.724676, 0, 0.9333333, 1, 1,
0.05899539, 0.09214947, 0.57133, 0, 0.9294118, 1, 1,
0.06338578, -0.0243169, 2.981139, 0, 0.9215686, 1, 1,
0.06420758, -0.431249, 2.867117, 0, 0.9176471, 1, 1,
0.06636663, -1.490513, 4.169245, 0, 0.9098039, 1, 1,
0.07282501, -0.2786568, 1.924963, 0, 0.9058824, 1, 1,
0.08544559, -0.6131207, 3.906658, 0, 0.8980392, 1, 1,
0.08908046, 1.303055, 0.1703184, 0, 0.8901961, 1, 1,
0.1017527, -0.9189586, 3.579238, 0, 0.8862745, 1, 1,
0.1023611, 0.7600369, 1.568337, 0, 0.8784314, 1, 1,
0.1040601, -1.169985, 2.293974, 0, 0.8745098, 1, 1,
0.1052909, 1.038566, 1.024377, 0, 0.8666667, 1, 1,
0.1067425, 0.1250992, 1.064465, 0, 0.8627451, 1, 1,
0.1110292, 0.4556434, 1.125897, 0, 0.854902, 1, 1,
0.1149955, -0.04542296, 1.216545, 0, 0.8509804, 1, 1,
0.1152785, -0.03033444, 1.538048, 0, 0.8431373, 1, 1,
0.1162738, 0.9828845, 0.1587857, 0, 0.8392157, 1, 1,
0.1178418, -0.535046, 1.830504, 0, 0.8313726, 1, 1,
0.1183498, -0.4084505, 3.38949, 0, 0.827451, 1, 1,
0.1229291, 0.7952239, -0.8301612, 0, 0.8196079, 1, 1,
0.1236166, 0.7635272, 0.2178892, 0, 0.8156863, 1, 1,
0.1258038, 0.174234, 1.163054, 0, 0.8078431, 1, 1,
0.1261103, -1.260958, 2.568418, 0, 0.8039216, 1, 1,
0.1351145, 1.248227, -0.1006077, 0, 0.7960784, 1, 1,
0.1362625, 1.871523, 0.1922408, 0, 0.7882353, 1, 1,
0.1370148, 1.043061, -1.481132, 0, 0.7843137, 1, 1,
0.1393416, 0.2635567, 0.1038856, 0, 0.7764706, 1, 1,
0.1396683, 0.2741936, -0.6197659, 0, 0.772549, 1, 1,
0.1430794, -0.6565711, 2.108996, 0, 0.7647059, 1, 1,
0.1437712, 0.2095588, 3.204617, 0, 0.7607843, 1, 1,
0.1457835, -0.6840128, 1.953153, 0, 0.7529412, 1, 1,
0.1496535, -0.7921758, 3.553761, 0, 0.7490196, 1, 1,
0.1639905, 0.8943236, 0.5379249, 0, 0.7411765, 1, 1,
0.1674278, 0.03460124, 1.923873, 0, 0.7372549, 1, 1,
0.1689704, 0.02020347, 0.6904309, 0, 0.7294118, 1, 1,
0.1697063, -0.9247119, 4.780047, 0, 0.7254902, 1, 1,
0.1721516, 0.8335193, 1.228159, 0, 0.7176471, 1, 1,
0.173158, 0.7504568, 0.03055953, 0, 0.7137255, 1, 1,
0.1753039, -1.128026, 3.668981, 0, 0.7058824, 1, 1,
0.1758126, -1.46774, 3.210875, 0, 0.6980392, 1, 1,
0.1760959, -0.2481185, 1.921752, 0, 0.6941177, 1, 1,
0.1794899, 0.1629924, 1.156173, 0, 0.6862745, 1, 1,
0.1802171, -0.1596073, 1.158023, 0, 0.682353, 1, 1,
0.1825488, -1.721212, 2.578195, 0, 0.6745098, 1, 1,
0.1829991, 0.8281696, 0.5079428, 0, 0.6705883, 1, 1,
0.1836808, -1.390781, 2.352407, 0, 0.6627451, 1, 1,
0.1844173, 0.4841561, 1.027351, 0, 0.6588235, 1, 1,
0.1847062, -0.6535607, 2.705557, 0, 0.6509804, 1, 1,
0.1860901, -1.416526, 2.63348, 0, 0.6470588, 1, 1,
0.1958423, 0.9311584, 1.47894, 0, 0.6392157, 1, 1,
0.2012195, 0.5661719, 1.377291, 0, 0.6352941, 1, 1,
0.2039407, 0.4627441, 2.170357, 0, 0.627451, 1, 1,
0.2168451, -0.1482424, 3.273951, 0, 0.6235294, 1, 1,
0.2175757, 0.8188125, -1.84008, 0, 0.6156863, 1, 1,
0.2185188, -0.2416111, 1.255798, 0, 0.6117647, 1, 1,
0.21946, 0.2263263, -0.1373651, 0, 0.6039216, 1, 1,
0.2217274, -0.751776, 3.26922, 0, 0.5960785, 1, 1,
0.2249613, 1.678489, 0.7052794, 0, 0.5921569, 1, 1,
0.2340008, 1.054052, -1.46027, 0, 0.5843138, 1, 1,
0.2345447, 0.7606043, 0.5016115, 0, 0.5803922, 1, 1,
0.2439405, -0.508709, 3.263779, 0, 0.572549, 1, 1,
0.2444014, 0.7466813, 0.5736393, 0, 0.5686275, 1, 1,
0.2452204, -1.161426, 3.006617, 0, 0.5607843, 1, 1,
0.2473255, -0.543959, 3.621558, 0, 0.5568628, 1, 1,
0.2486042, 0.9495446, 1.821752, 0, 0.5490196, 1, 1,
0.251087, 0.6223305, 0.3454785, 0, 0.5450981, 1, 1,
0.252007, -1.516379, 2.288234, 0, 0.5372549, 1, 1,
0.2583, 0.4008257, 0.4550288, 0, 0.5333334, 1, 1,
0.2593309, -0.861984, 3.491875, 0, 0.5254902, 1, 1,
0.2614508, 0.1676631, 0.7192081, 0, 0.5215687, 1, 1,
0.2625254, 0.8899373, 0.7466805, 0, 0.5137255, 1, 1,
0.2655839, -0.3320491, 3.143605, 0, 0.509804, 1, 1,
0.2676669, -1.077627, 2.181546, 0, 0.5019608, 1, 1,
0.2687702, -1.162478, 1.96192, 0, 0.4941176, 1, 1,
0.2705959, -0.03771894, 1.150065, 0, 0.4901961, 1, 1,
0.2725681, -0.1687778, 1.476978, 0, 0.4823529, 1, 1,
0.276175, -0.06275392, 2.013145, 0, 0.4784314, 1, 1,
0.2791511, -0.02067889, 2.421832, 0, 0.4705882, 1, 1,
0.2821396, 0.08770642, 0.6000288, 0, 0.4666667, 1, 1,
0.2863959, -0.9471037, 3.981871, 0, 0.4588235, 1, 1,
0.2895825, -0.1838443, 2.163992, 0, 0.454902, 1, 1,
0.2897027, -0.403488, 2.806345, 0, 0.4470588, 1, 1,
0.2910739, 0.808441, -0.1118696, 0, 0.4431373, 1, 1,
0.2913275, -0.08274648, 1.50621, 0, 0.4352941, 1, 1,
0.298543, 0.432206, -0.1085677, 0, 0.4313726, 1, 1,
0.308616, 0.9948819, 2.527935, 0, 0.4235294, 1, 1,
0.3111443, 0.6029484, 1.541752, 0, 0.4196078, 1, 1,
0.3146891, -0.7251906, 1.675207, 0, 0.4117647, 1, 1,
0.3150031, 1.092741, -1.326548, 0, 0.4078431, 1, 1,
0.3172587, -0.6833491, 2.707023, 0, 0.4, 1, 1,
0.3203661, -0.9807419, 3.682875, 0, 0.3921569, 1, 1,
0.3269131, -0.8356413, 3.467734, 0, 0.3882353, 1, 1,
0.3287387, 0.4110107, 0.8273073, 0, 0.3803922, 1, 1,
0.3342992, -1.42118, 3.958497, 0, 0.3764706, 1, 1,
0.3361349, -0.02610223, 2.855003, 0, 0.3686275, 1, 1,
0.3404611, 0.812222, -0.2718057, 0, 0.3647059, 1, 1,
0.3434609, 0.5075463, 1.474561, 0, 0.3568628, 1, 1,
0.3443939, -0.3573486, 2.726217, 0, 0.3529412, 1, 1,
0.3453545, 2.040972, -0.6998121, 0, 0.345098, 1, 1,
0.3465062, 0.03963538, 1.040288, 0, 0.3411765, 1, 1,
0.347255, 0.1566147, 1.876004, 0, 0.3333333, 1, 1,
0.3569674, 1.310552, 0.05028146, 0, 0.3294118, 1, 1,
0.3576668, 0.06796478, 2.946178, 0, 0.3215686, 1, 1,
0.3593134, 1.054846, 0.9487784, 0, 0.3176471, 1, 1,
0.3629975, 1.084449, -1.580652, 0, 0.3098039, 1, 1,
0.363497, -0.282956, 2.221254, 0, 0.3058824, 1, 1,
0.3658246, 1.539443, 0.4290251, 0, 0.2980392, 1, 1,
0.368014, -1.495268, 2.283323, 0, 0.2901961, 1, 1,
0.3693959, -0.2118752, 2.386768, 0, 0.2862745, 1, 1,
0.3709458, 1.500652, -0.05049738, 0, 0.2784314, 1, 1,
0.3732451, 1.105839, -0.6089228, 0, 0.2745098, 1, 1,
0.3767459, -0.3273646, 2.803285, 0, 0.2666667, 1, 1,
0.3834423, -0.5743412, 2.244532, 0, 0.2627451, 1, 1,
0.3851704, -0.7602242, 2.732248, 0, 0.254902, 1, 1,
0.3901717, 0.6757874, 0.5645335, 0, 0.2509804, 1, 1,
0.3909894, -2.240357, 3.162591, 0, 0.2431373, 1, 1,
0.3958557, -0.8247944, 3.677576, 0, 0.2392157, 1, 1,
0.3961743, -1.167361, 2.304287, 0, 0.2313726, 1, 1,
0.3963647, -0.1725846, 3.387141, 0, 0.227451, 1, 1,
0.3977551, -1.154945, 1.848072, 0, 0.2196078, 1, 1,
0.4026016, 1.307627, -1.878671, 0, 0.2156863, 1, 1,
0.4041694, 0.792285, 0.7254192, 0, 0.2078431, 1, 1,
0.4068154, 1.876274, 0.3897702, 0, 0.2039216, 1, 1,
0.409338, -0.3752961, 1.53538, 0, 0.1960784, 1, 1,
0.411469, 0.9639003, -0.4328491, 0, 0.1882353, 1, 1,
0.4116451, -0.9438998, 2.318311, 0, 0.1843137, 1, 1,
0.4123713, 0.185959, 1.513555, 0, 0.1764706, 1, 1,
0.4126753, 2.902404, 0.1486986, 0, 0.172549, 1, 1,
0.4168431, -0.6244602, 3.262748, 0, 0.1647059, 1, 1,
0.4208176, 0.3576438, 1.289429, 0, 0.1607843, 1, 1,
0.4289808, -1.45561, 3.314356, 0, 0.1529412, 1, 1,
0.436442, -0.5999669, 1.098323, 0, 0.1490196, 1, 1,
0.4402834, -1.852374, 3.817775, 0, 0.1411765, 1, 1,
0.4407143, 0.756594, -0.1216361, 0, 0.1372549, 1, 1,
0.4409526, 0.4098478, 0.8675125, 0, 0.1294118, 1, 1,
0.4430645, 1.363849, 1.415408, 0, 0.1254902, 1, 1,
0.4435782, 0.5303209, 1.828824, 0, 0.1176471, 1, 1,
0.4477126, -1.658, 4.28028, 0, 0.1137255, 1, 1,
0.4529226, 0.4823834, 0.8124904, 0, 0.1058824, 1, 1,
0.4536988, -0.7778457, 2.425776, 0, 0.09803922, 1, 1,
0.4578211, 0.1038406, 0.6457805, 0, 0.09411765, 1, 1,
0.4606266, -0.1052618, 1.194124, 0, 0.08627451, 1, 1,
0.4610206, -0.5821658, 2.790797, 0, 0.08235294, 1, 1,
0.4632839, -0.3211539, 3.597929, 0, 0.07450981, 1, 1,
0.4636947, -0.6125637, 1.890274, 0, 0.07058824, 1, 1,
0.4717686, -0.5056209, 0.1552017, 0, 0.0627451, 1, 1,
0.4761012, 1.25868, 0.08143172, 0, 0.05882353, 1, 1,
0.4782869, -0.6521012, 2.152199, 0, 0.05098039, 1, 1,
0.4784715, -1.242001, 3.439965, 0, 0.04705882, 1, 1,
0.4786541, -1.393642, 3.918942, 0, 0.03921569, 1, 1,
0.4832429, -0.2247497, 1.665803, 0, 0.03529412, 1, 1,
0.4844458, 1.162914, 0.9618645, 0, 0.02745098, 1, 1,
0.4848921, -1.272902, 1.824352, 0, 0.02352941, 1, 1,
0.4861584, 0.05310311, 1.941949, 0, 0.01568628, 1, 1,
0.4874128, 0.1274005, 1.612947, 0, 0.01176471, 1, 1,
0.4877312, 0.3902703, 1.633785, 0, 0.003921569, 1, 1,
0.4914276, 1.230661, 1.673146, 0.003921569, 0, 1, 1,
0.4923345, -0.1439179, 1.667943, 0.007843138, 0, 1, 1,
0.4982705, -0.4016304, 1.689297, 0.01568628, 0, 1, 1,
0.5011027, 0.3089702, 2.613111, 0.01960784, 0, 1, 1,
0.5026431, -1.248096, 3.098129, 0.02745098, 0, 1, 1,
0.5054993, 0.1697834, 2.833966, 0.03137255, 0, 1, 1,
0.509647, 1.126184, 0.6754463, 0.03921569, 0, 1, 1,
0.5109199, 0.4914062, 3.654113, 0.04313726, 0, 1, 1,
0.5138407, -0.5603905, 3.363878, 0.05098039, 0, 1, 1,
0.5157999, 0.3658871, 1.350113, 0.05490196, 0, 1, 1,
0.5174831, 1.11661, 1.227057, 0.0627451, 0, 1, 1,
0.5185381, -0.6217462, 2.816818, 0.06666667, 0, 1, 1,
0.5204167, 0.02743394, 1.290646, 0.07450981, 0, 1, 1,
0.5256379, 1.061614, -0.7597638, 0.07843138, 0, 1, 1,
0.5268295, -0.8626023, 2.333814, 0.08627451, 0, 1, 1,
0.5280448, 0.3950391, -1.164556, 0.09019608, 0, 1, 1,
0.535588, -0.2149204, 2.666843, 0.09803922, 0, 1, 1,
0.5396064, 0.1669066, 2.034935, 0.1058824, 0, 1, 1,
0.5412927, -2.154449, 1.166896, 0.1098039, 0, 1, 1,
0.5509782, -0.5880972, 1.509198, 0.1176471, 0, 1, 1,
0.5520027, 0.3099792, 1.412705, 0.1215686, 0, 1, 1,
0.553503, 0.5704551, -1.864957, 0.1294118, 0, 1, 1,
0.5560634, -0.6959388, 1.693148, 0.1333333, 0, 1, 1,
0.5606126, 0.6983644, 2.802813, 0.1411765, 0, 1, 1,
0.5619089, 0.3957824, 1.728086, 0.145098, 0, 1, 1,
0.5639799, -0.3686556, 0.4395789, 0.1529412, 0, 1, 1,
0.5698386, 0.1535097, 0.8744391, 0.1568628, 0, 1, 1,
0.5702887, -0.2419108, 2.282583, 0.1647059, 0, 1, 1,
0.5711488, -0.5079018, 2.367649, 0.1686275, 0, 1, 1,
0.5743333, -1.193637, 3.694025, 0.1764706, 0, 1, 1,
0.5778288, 0.04576421, 1.873917, 0.1803922, 0, 1, 1,
0.5783198, -0.7520407, 1.602758, 0.1882353, 0, 1, 1,
0.5783449, -0.460671, 2.688455, 0.1921569, 0, 1, 1,
0.580689, 0.6692391, 3.671304, 0.2, 0, 1, 1,
0.5848408, 0.7901241, 2.104844, 0.2078431, 0, 1, 1,
0.5879562, -0.9248961, 1.986132, 0.2117647, 0, 1, 1,
0.6007851, 0.8485802, -0.2296442, 0.2196078, 0, 1, 1,
0.6029499, 1.837501, 0.7780758, 0.2235294, 0, 1, 1,
0.6048551, -0.05729111, 2.660362, 0.2313726, 0, 1, 1,
0.6058569, -1.404724, 2.618301, 0.2352941, 0, 1, 1,
0.6063851, -1.1374, 3.331396, 0.2431373, 0, 1, 1,
0.6069057, 0.6671365, -0.100274, 0.2470588, 0, 1, 1,
0.6100162, -1.046838, 1.327798, 0.254902, 0, 1, 1,
0.6102605, 0.4030167, -0.3138783, 0.2588235, 0, 1, 1,
0.6109294, 2.225989, 0.5621699, 0.2666667, 0, 1, 1,
0.613063, 1.768993, 1.94948, 0.2705882, 0, 1, 1,
0.6184502, 0.2320759, 0.1326987, 0.2784314, 0, 1, 1,
0.6191439, -0.9304077, 2.23592, 0.282353, 0, 1, 1,
0.6192294, 0.4317137, 1.679509, 0.2901961, 0, 1, 1,
0.6204022, 0.05234852, -0.1220559, 0.2941177, 0, 1, 1,
0.623059, 0.7188047, 0.6505026, 0.3019608, 0, 1, 1,
0.6252251, -1.368579, 2.825092, 0.3098039, 0, 1, 1,
0.6308877, 1.227206, -0.03422179, 0.3137255, 0, 1, 1,
0.6320052, 0.7125944, 1.204862, 0.3215686, 0, 1, 1,
0.6350673, 0.3320619, 0.5375909, 0.3254902, 0, 1, 1,
0.6376323, 1.879347, 1.061693, 0.3333333, 0, 1, 1,
0.641673, 0.9031113, 1.514102, 0.3372549, 0, 1, 1,
0.6446348, -0.7905255, 3.084545, 0.345098, 0, 1, 1,
0.6458082, -0.9451176, 3.71717, 0.3490196, 0, 1, 1,
0.6493879, -0.9062285, 2.55779, 0.3568628, 0, 1, 1,
0.653522, -0.3896943, 3.873853, 0.3607843, 0, 1, 1,
0.6547472, 0.09478857, 2.305036, 0.3686275, 0, 1, 1,
0.6556398, -0.7832853, 1.398048, 0.372549, 0, 1, 1,
0.6593433, 1.615841, -1.85244, 0.3803922, 0, 1, 1,
0.6659448, 1.075839, 1.607958, 0.3843137, 0, 1, 1,
0.6673659, -0.1849686, 1.209706, 0.3921569, 0, 1, 1,
0.6696966, 0.9930831, 0.6419718, 0.3960784, 0, 1, 1,
0.672674, -0.4469497, 4.835723, 0.4039216, 0, 1, 1,
0.6741703, -0.4108844, 3.352268, 0.4117647, 0, 1, 1,
0.6745217, 1.161465, 1.119902, 0.4156863, 0, 1, 1,
0.6798415, -0.2386418, 1.90296, 0.4235294, 0, 1, 1,
0.6812279, 0.6124527, 1.819823, 0.427451, 0, 1, 1,
0.6816218, 1.069252, 0.8004529, 0.4352941, 0, 1, 1,
0.6819584, 1.198481, 1.203797, 0.4392157, 0, 1, 1,
0.6837711, 1.035331, 1.310677, 0.4470588, 0, 1, 1,
0.6969196, -0.4783155, 2.432009, 0.4509804, 0, 1, 1,
0.6980525, -0.5546411, 3.004168, 0.4588235, 0, 1, 1,
0.6996523, 0.3122377, 0.5078388, 0.4627451, 0, 1, 1,
0.6998886, -0.861648, 0.9824169, 0.4705882, 0, 1, 1,
0.7067285, -0.5507944, 3.324716, 0.4745098, 0, 1, 1,
0.7122657, 0.1400643, 3.545799, 0.4823529, 0, 1, 1,
0.713554, -1.158847, 2.150559, 0.4862745, 0, 1, 1,
0.7149553, 0.02752473, -0.2037798, 0.4941176, 0, 1, 1,
0.7155657, -0.4945882, 1.774209, 0.5019608, 0, 1, 1,
0.7167341, -0.459464, 3.232077, 0.5058824, 0, 1, 1,
0.7190002, 0.7999622, -1.374033, 0.5137255, 0, 1, 1,
0.7192133, -0.04732599, 1.709756, 0.5176471, 0, 1, 1,
0.72214, -0.01513819, 0.6466847, 0.5254902, 0, 1, 1,
0.7223368, -0.1583018, 0.7486628, 0.5294118, 0, 1, 1,
0.7224891, -0.7808273, 1.837932, 0.5372549, 0, 1, 1,
0.723737, -0.6511347, 3.069667, 0.5411765, 0, 1, 1,
0.7247318, -1.444465, 2.897502, 0.5490196, 0, 1, 1,
0.7291243, -0.09101638, 0.3551317, 0.5529412, 0, 1, 1,
0.7298582, 0.1659863, -0.4542922, 0.5607843, 0, 1, 1,
0.7316371, -1.131008, 1.592658, 0.5647059, 0, 1, 1,
0.7341327, -0.3849516, 3.683784, 0.572549, 0, 1, 1,
0.7372304, 0.105679, 1.665669, 0.5764706, 0, 1, 1,
0.7390371, 0.6618929, 1.730251, 0.5843138, 0, 1, 1,
0.7392525, 0.4352553, 1.959772, 0.5882353, 0, 1, 1,
0.74506, 1.768319, 1.433617, 0.5960785, 0, 1, 1,
0.752352, -1.017848, 4.067585, 0.6039216, 0, 1, 1,
0.7549612, -0.02993254, 1.427124, 0.6078432, 0, 1, 1,
0.7553481, -0.9210083, 2.630435, 0.6156863, 0, 1, 1,
0.7555678, 0.9634214, 0.9536362, 0.6196079, 0, 1, 1,
0.75563, -1.108456, 3.195265, 0.627451, 0, 1, 1,
0.7568144, 1.504456, -0.2159196, 0.6313726, 0, 1, 1,
0.7576417, -1.396953, 2.350996, 0.6392157, 0, 1, 1,
0.7605888, -0.165647, 0.9598253, 0.6431373, 0, 1, 1,
0.7606144, -0.854106, 2.115615, 0.6509804, 0, 1, 1,
0.7684811, -0.7230362, 2.22037, 0.654902, 0, 1, 1,
0.778077, -0.7541983, 2.415921, 0.6627451, 0, 1, 1,
0.781292, -0.02647287, 2.017482, 0.6666667, 0, 1, 1,
0.7840214, 0.4230191, 2.002534, 0.6745098, 0, 1, 1,
0.7854567, -1.802208, 3.634969, 0.6784314, 0, 1, 1,
0.786827, 1.095658, 0.6094388, 0.6862745, 0, 1, 1,
0.7881961, 1.233721, 0.6574753, 0.6901961, 0, 1, 1,
0.7897841, -0.008894764, 1.248336, 0.6980392, 0, 1, 1,
0.795197, 1.147363, 1.522749, 0.7058824, 0, 1, 1,
0.7979829, -1.707786, 1.335902, 0.7098039, 0, 1, 1,
0.7982136, 1.627446, -0.4943107, 0.7176471, 0, 1, 1,
0.7988696, -1.155701, 1.98377, 0.7215686, 0, 1, 1,
0.800207, -0.3423022, 1.502472, 0.7294118, 0, 1, 1,
0.800351, -0.06946438, 1.098167, 0.7333333, 0, 1, 1,
0.800455, -0.7714596, 3.3646, 0.7411765, 0, 1, 1,
0.8004815, -0.6754792, 2.265305, 0.7450981, 0, 1, 1,
0.8006192, -0.03761413, 0.9256631, 0.7529412, 0, 1, 1,
0.8057913, -0.09423956, 2.702827, 0.7568628, 0, 1, 1,
0.806501, 1.739208, 0.6137106, 0.7647059, 0, 1, 1,
0.8070543, -1.880652, 2.229715, 0.7686275, 0, 1, 1,
0.8143526, 1.225119, 1.111291, 0.7764706, 0, 1, 1,
0.8151773, -1.613124, 2.544662, 0.7803922, 0, 1, 1,
0.8221208, 0.9237438, -0.09820423, 0.7882353, 0, 1, 1,
0.823244, -1.413339, 1.725898, 0.7921569, 0, 1, 1,
0.8256151, -0.09463632, 0.3615259, 0.8, 0, 1, 1,
0.8282894, -0.3242551, 2.726436, 0.8078431, 0, 1, 1,
0.833133, 0.1213757, 1.811558, 0.8117647, 0, 1, 1,
0.8373408, 0.04588294, 2.223855, 0.8196079, 0, 1, 1,
0.8387636, 0.2001054, 3.163949, 0.8235294, 0, 1, 1,
0.8402562, -0.2315473, 2.839081, 0.8313726, 0, 1, 1,
0.843281, -0.06000235, 2.086899, 0.8352941, 0, 1, 1,
0.844779, 0.354016, 1.724854, 0.8431373, 0, 1, 1,
0.8535789, 1.010423, -0.7139533, 0.8470588, 0, 1, 1,
0.8538966, 0.1466151, 1.250326, 0.854902, 0, 1, 1,
0.8598247, 0.5144298, 0.06730533, 0.8588235, 0, 1, 1,
0.862816, 1.964626, -1.047897, 0.8666667, 0, 1, 1,
0.8681488, -0.2702256, 0.7865104, 0.8705882, 0, 1, 1,
0.8706712, 0.6992647, 1.411448, 0.8784314, 0, 1, 1,
0.8728558, -0.02001267, 0.4395631, 0.8823529, 0, 1, 1,
0.8744791, 0.4722159, 0.8569021, 0.8901961, 0, 1, 1,
0.8754307, 0.5435541, 0.7927687, 0.8941177, 0, 1, 1,
0.876209, -0.614711, 0.67788, 0.9019608, 0, 1, 1,
0.8767008, -1.206861, 2.581352, 0.9098039, 0, 1, 1,
0.8774803, 0.2599342, 1.529788, 0.9137255, 0, 1, 1,
0.8869476, -1.443365, 4.141797, 0.9215686, 0, 1, 1,
0.8880267, -0.00622396, 0.4492674, 0.9254902, 0, 1, 1,
0.8902864, -0.09826646, 3.96774, 0.9333333, 0, 1, 1,
0.8925244, -0.1447067, 3.117188, 0.9372549, 0, 1, 1,
0.8952045, 1.452733, 0.5921792, 0.945098, 0, 1, 1,
0.9030756, -0.2902971, 0.616074, 0.9490196, 0, 1, 1,
0.9067117, 0.3877059, 0.61962, 0.9568627, 0, 1, 1,
0.9104462, 0.4742325, 0.3333611, 0.9607843, 0, 1, 1,
0.9117252, 0.5080311, 1.785221, 0.9686275, 0, 1, 1,
0.9162465, -0.1670021, 2.008777, 0.972549, 0, 1, 1,
0.9319792, 0.6088825, 3.022424, 0.9803922, 0, 1, 1,
0.9356489, -0.9059658, 2.297318, 0.9843137, 0, 1, 1,
0.9374178, 1.738906, 2.650946, 0.9921569, 0, 1, 1,
0.9434701, -0.07176124, 0.8366978, 0.9960784, 0, 1, 1,
0.944675, -1.041184, 1.193092, 1, 0, 0.9960784, 1,
0.9457825, -0.03772002, 3.384773, 1, 0, 0.9882353, 1,
0.9586464, 0.3713009, 2.025212, 1, 0, 0.9843137, 1,
0.9628586, -0.6360958, 3.633003, 1, 0, 0.9764706, 1,
0.9663579, -0.9690127, 1.325715, 1, 0, 0.972549, 1,
0.9663757, -0.05889574, 3.834442, 1, 0, 0.9647059, 1,
0.9729556, 1.149283, 0.267705, 1, 0, 0.9607843, 1,
0.9793921, -0.8497694, 2.340884, 1, 0, 0.9529412, 1,
0.9843268, -1.466465, 3.496068, 1, 0, 0.9490196, 1,
0.9857088, -0.1356008, 0.8621703, 1, 0, 0.9411765, 1,
0.9904194, -0.313082, 1.918051, 1, 0, 0.9372549, 1,
0.9943979, -0.7472962, 2.641975, 1, 0, 0.9294118, 1,
0.9959576, 0.3765517, -0.4711215, 1, 0, 0.9254902, 1,
0.9999378, -0.1983971, 1.657954, 1, 0, 0.9176471, 1,
1.003089, 0.9121904, -0.01248879, 1, 0, 0.9137255, 1,
1.006272, -1.192727, 1.632809, 1, 0, 0.9058824, 1,
1.020921, -0.9331564, 2.277585, 1, 0, 0.9019608, 1,
1.021177, -0.4927966, 2.633, 1, 0, 0.8941177, 1,
1.023616, 1.061702, 0.4540597, 1, 0, 0.8862745, 1,
1.032305, 0.4435083, 1.458471, 1, 0, 0.8823529, 1,
1.034378, 0.01326324, 0.9903224, 1, 0, 0.8745098, 1,
1.037146, 1.61398, -0.1634506, 1, 0, 0.8705882, 1,
1.039442, 0.01269327, 1.322185, 1, 0, 0.8627451, 1,
1.056113, -0.6617203, 3.587883, 1, 0, 0.8588235, 1,
1.06069, 0.3104877, 1.648355, 1, 0, 0.8509804, 1,
1.061988, -1.09919, 4.885511, 1, 0, 0.8470588, 1,
1.062097, 0.1699547, 1.548247, 1, 0, 0.8392157, 1,
1.067196, 0.5568212, 0.7266859, 1, 0, 0.8352941, 1,
1.071645, -0.2640258, 1.500623, 1, 0, 0.827451, 1,
1.078919, -1.08173, 2.349428, 1, 0, 0.8235294, 1,
1.081847, 0.904655, 0.596275, 1, 0, 0.8156863, 1,
1.083221, -0.9484434, 3.920659, 1, 0, 0.8117647, 1,
1.083654, 2.559252, 0.6653376, 1, 0, 0.8039216, 1,
1.08536, -2.870125, 3.060304, 1, 0, 0.7960784, 1,
1.092008, -0.2040256, 0.8854809, 1, 0, 0.7921569, 1,
1.096283, 0.1250004, 1.848188, 1, 0, 0.7843137, 1,
1.097699, 0.653531, -0.0228249, 1, 0, 0.7803922, 1,
1.100166, 0.3121603, 1.740219, 1, 0, 0.772549, 1,
1.118412, -0.3084123, 0.5690394, 1, 0, 0.7686275, 1,
1.12944, 2.613141, -0.6113006, 1, 0, 0.7607843, 1,
1.136434, 1.717452, 1.449387, 1, 0, 0.7568628, 1,
1.14051, 1.274733, -1.166194, 1, 0, 0.7490196, 1,
1.147427, -2.68137, 3.391168, 1, 0, 0.7450981, 1,
1.153275, -0.338494, 2.371632, 1, 0, 0.7372549, 1,
1.162729, 0.5017378, 1.813219, 1, 0, 0.7333333, 1,
1.163615, -0.3572096, 3.71826, 1, 0, 0.7254902, 1,
1.164932, 0.5732582, 0.6606846, 1, 0, 0.7215686, 1,
1.165221, -0.0651267, 1.371685, 1, 0, 0.7137255, 1,
1.174101, -0.1744792, 2.069291, 1, 0, 0.7098039, 1,
1.180843, 0.6456265, 0.03492716, 1, 0, 0.7019608, 1,
1.186171, -3.138372, 2.39376, 1, 0, 0.6941177, 1,
1.187289, 0.2759602, 1.523257, 1, 0, 0.6901961, 1,
1.187493, 0.2022747, 0.4696363, 1, 0, 0.682353, 1,
1.196793, 1.091631, 1.394194, 1, 0, 0.6784314, 1,
1.201322, 0.3289198, 1.273827, 1, 0, 0.6705883, 1,
1.20283, -0.4343417, 1.729405, 1, 0, 0.6666667, 1,
1.207458, 0.7701225, 2.022012, 1, 0, 0.6588235, 1,
1.211826, 0.7979078, 1.983845, 1, 0, 0.654902, 1,
1.216066, -0.8697812, 2.001656, 1, 0, 0.6470588, 1,
1.220189, 0.3106571, 0.9491957, 1, 0, 0.6431373, 1,
1.231742, -0.4447565, 1.85272, 1, 0, 0.6352941, 1,
1.233984, -2.845671, 3.923077, 1, 0, 0.6313726, 1,
1.235034, 0.6059351, 1.67916, 1, 0, 0.6235294, 1,
1.235996, -0.1255864, 1.443322, 1, 0, 0.6196079, 1,
1.239248, 1.298611, 0.08314396, 1, 0, 0.6117647, 1,
1.25219, -0.6944742, 3.249246, 1, 0, 0.6078432, 1,
1.259197, 2.38203, 2.16539, 1, 0, 0.6, 1,
1.266126, 2.433037, -0.2587733, 1, 0, 0.5921569, 1,
1.279923, 1.26463, 0.5815158, 1, 0, 0.5882353, 1,
1.289351, -1.151959, 2.792648, 1, 0, 0.5803922, 1,
1.289967, -0.01514937, 1.883293, 1, 0, 0.5764706, 1,
1.297234, -0.703966, 2.645205, 1, 0, 0.5686275, 1,
1.30691, -0.3524809, 2.54223, 1, 0, 0.5647059, 1,
1.315149, 0.8373914, 0.3866791, 1, 0, 0.5568628, 1,
1.331685, -1.058161, 2.127626, 1, 0, 0.5529412, 1,
1.341864, -1.382069, 3.795816, 1, 0, 0.5450981, 1,
1.342919, -0.2063386, 1.806226, 1, 0, 0.5411765, 1,
1.343215, -0.20556, 0.805117, 1, 0, 0.5333334, 1,
1.347753, 0.189688, 2.851129, 1, 0, 0.5294118, 1,
1.36008, 1.475019, -0.3461132, 1, 0, 0.5215687, 1,
1.366282, -2.545018, 1.431452, 1, 0, 0.5176471, 1,
1.371271, 0.9096439, 1.677713, 1, 0, 0.509804, 1,
1.383448, -0.4728386, 1.290526, 1, 0, 0.5058824, 1,
1.394283, -1.127656, 3.214027, 1, 0, 0.4980392, 1,
1.403199, -0.2599019, 0.7060528, 1, 0, 0.4901961, 1,
1.411782, -0.4488864, 1.738461, 1, 0, 0.4862745, 1,
1.416084, -0.2817609, 2.461223, 1, 0, 0.4784314, 1,
1.417642, 0.2130909, 1.53211, 1, 0, 0.4745098, 1,
1.418816, 0.8485984, 0.6925123, 1, 0, 0.4666667, 1,
1.419656, 1.691862, -0.4831686, 1, 0, 0.4627451, 1,
1.419929, 0.2073385, 1.829322, 1, 0, 0.454902, 1,
1.431918, 0.7219448, 1.573296, 1, 0, 0.4509804, 1,
1.440369, -0.8470116, 0.7422593, 1, 0, 0.4431373, 1,
1.449911, 0.3273054, 2.423533, 1, 0, 0.4392157, 1,
1.450466, 1.770015, 0.5970711, 1, 0, 0.4313726, 1,
1.453999, 1.007539, 1.744609, 1, 0, 0.427451, 1,
1.462486, -1.136594, 1.302845, 1, 0, 0.4196078, 1,
1.466709, 1.571434, -0.0759415, 1, 0, 0.4156863, 1,
1.471058, -0.3113951, 2.19561, 1, 0, 0.4078431, 1,
1.472696, -0.9194914, 4.128233, 1, 0, 0.4039216, 1,
1.473818, -0.6914258, 2.344352, 1, 0, 0.3960784, 1,
1.47416, -0.1049819, 0.4147221, 1, 0, 0.3882353, 1,
1.491804, -1.123572, 3.784556, 1, 0, 0.3843137, 1,
1.492396, -0.5082163, 2.482363, 1, 0, 0.3764706, 1,
1.500326, -0.1979356, 1.958601, 1, 0, 0.372549, 1,
1.506915, 0.5874281, 2.105581, 1, 0, 0.3647059, 1,
1.511887, -0.6429831, 1.257647, 1, 0, 0.3607843, 1,
1.512754, 1.679928, 0.1947613, 1, 0, 0.3529412, 1,
1.519555, 2.455688, -1.161685, 1, 0, 0.3490196, 1,
1.524629, 1.522798, 0.5174401, 1, 0, 0.3411765, 1,
1.526226, -0.3515383, 1.166016, 1, 0, 0.3372549, 1,
1.532493, -0.5010331, 1.459811, 1, 0, 0.3294118, 1,
1.535074, 0.8915253, -0.4965099, 1, 0, 0.3254902, 1,
1.544196, -0.848869, 0.7269666, 1, 0, 0.3176471, 1,
1.552113, -0.8924353, 1.31153, 1, 0, 0.3137255, 1,
1.553648, 0.4172643, -0.3403969, 1, 0, 0.3058824, 1,
1.55738, 1.04048, 1.415879, 1, 0, 0.2980392, 1,
1.599306, 1.589063, 1.514578, 1, 0, 0.2941177, 1,
1.623367, 0.3072311, 2.604122, 1, 0, 0.2862745, 1,
1.65965, -0.05901176, 2.95517, 1, 0, 0.282353, 1,
1.68964, 1.4, 2.222482, 1, 0, 0.2745098, 1,
1.694227, 0.6277645, 1.629573, 1, 0, 0.2705882, 1,
1.712391, 0.408116, 1.322109, 1, 0, 0.2627451, 1,
1.722933, -0.4190044, 3.253178, 1, 0, 0.2588235, 1,
1.757239, 1.983552, 0.3173606, 1, 0, 0.2509804, 1,
1.762373, 0.3650175, 0.7930145, 1, 0, 0.2470588, 1,
1.772415, -0.3261128, 3.039739, 1, 0, 0.2392157, 1,
1.806507, -1.173845, 2.50389, 1, 0, 0.2352941, 1,
1.815493, -0.5602911, 0.9512783, 1, 0, 0.227451, 1,
1.831052, -2.525614, 2.883336, 1, 0, 0.2235294, 1,
1.834296, 0.2873144, 0.6410114, 1, 0, 0.2156863, 1,
1.842219, 1.922199, 1.46894, 1, 0, 0.2117647, 1,
1.849674, 1.377787, 2.741578, 1, 0, 0.2039216, 1,
1.869091, 0.9954764, 1.187651, 1, 0, 0.1960784, 1,
1.875284, -1.48403, 2.665649, 1, 0, 0.1921569, 1,
1.901183, 0.3517895, 0.2200326, 1, 0, 0.1843137, 1,
1.924072, 1.069458, 0.8945018, 1, 0, 0.1803922, 1,
1.927043, 0.7094805, 1.606888, 1, 0, 0.172549, 1,
1.935276, 1.613978, -0.6326575, 1, 0, 0.1686275, 1,
1.944709, -1.327682, 2.346994, 1, 0, 0.1607843, 1,
1.948578, -1.738523, 2.244364, 1, 0, 0.1568628, 1,
1.968141, 0.4015427, -1.089063, 1, 0, 0.1490196, 1,
1.981517, 0.0511247, 1.211448, 1, 0, 0.145098, 1,
1.985148, 1.148258, 1.803002, 1, 0, 0.1372549, 1,
1.988121, -0.1585996, 2.48411, 1, 0, 0.1333333, 1,
2.000901, -0.8739604, 2.447377, 1, 0, 0.1254902, 1,
2.008058, 0.3156053, 2.358464, 1, 0, 0.1215686, 1,
2.033932, 0.1325441, 1.392652, 1, 0, 0.1137255, 1,
2.040073, -0.3386419, 1.006472, 1, 0, 0.1098039, 1,
2.11987, -1.644806, 2.154375, 1, 0, 0.1019608, 1,
2.128254, -1.078195, 3.507388, 1, 0, 0.09411765, 1,
2.163097, 0.3819115, 2.508469, 1, 0, 0.09019608, 1,
2.185303, -0.5010447, 2.610395, 1, 0, 0.08235294, 1,
2.242499, 0.4977362, 2.77421, 1, 0, 0.07843138, 1,
2.242825, 0.8540975, -0.2898137, 1, 0, 0.07058824, 1,
2.291558, -1.723279, 0.9461047, 1, 0, 0.06666667, 1,
2.297601, 0.6416126, 1.571445, 1, 0, 0.05882353, 1,
2.324341, -0.9373304, 2.291935, 1, 0, 0.05490196, 1,
2.357061, 0.8149363, 2.903811, 1, 0, 0.04705882, 1,
2.374369, -0.3470043, 3.202078, 1, 0, 0.04313726, 1,
2.386803, 0.7109817, 2.020519, 1, 0, 0.03529412, 1,
2.551831, 0.2543588, 2.35171, 1, 0, 0.03137255, 1,
2.619343, 1.163108, 1.456391, 1, 0, 0.02352941, 1,
2.695063, -0.4151611, 2.686579, 1, 0, 0.01960784, 1,
3.418525, -0.7041509, 1.293855, 1, 0, 0.01176471, 1,
3.494315, -0.5658163, 2.252478, 1, 0, 0.007843138, 1
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
0.1210181, -4.205259, -7.854295, 0, -0.5, 0.5, 0.5,
0.1210181, -4.205259, -7.854295, 1, -0.5, 0.5, 0.5,
0.1210181, -4.205259, -7.854295, 1, 1.5, 0.5, 0.5,
0.1210181, -4.205259, -7.854295, 0, 1.5, 0.5, 0.5
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
-4.395827, -0.1363574, -7.854295, 0, -0.5, 0.5, 0.5,
-4.395827, -0.1363574, -7.854295, 1, -0.5, 0.5, 0.5,
-4.395827, -0.1363574, -7.854295, 1, 1.5, 0.5, 0.5,
-4.395827, -0.1363574, -7.854295, 0, 1.5, 0.5, 0.5
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
-4.395827, -4.205259, -0.5611782, 0, -0.5, 0.5, 0.5,
-4.395827, -4.205259, -0.5611782, 1, -0.5, 0.5, 0.5,
-4.395827, -4.205259, -0.5611782, 1, 1.5, 0.5, 0.5,
-4.395827, -4.205259, -0.5611782, 0, 1.5, 0.5, 0.5
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
-3, -3.266282, -6.171268,
3, -3.266282, -6.171268,
-3, -3.266282, -6.171268,
-3, -3.422778, -6.451773,
-2, -3.266282, -6.171268,
-2, -3.422778, -6.451773,
-1, -3.266282, -6.171268,
-1, -3.422778, -6.451773,
0, -3.266282, -6.171268,
0, -3.422778, -6.451773,
1, -3.266282, -6.171268,
1, -3.422778, -6.451773,
2, -3.266282, -6.171268,
2, -3.422778, -6.451773,
3, -3.266282, -6.171268,
3, -3.422778, -6.451773
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
-3, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
-3, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
-3, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
-3, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
-2, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
-2, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
-2, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
-2, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
-1, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
-1, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
-1, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
-1, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
0, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
0, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
0, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
0, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
1, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
1, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
1, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
1, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
2, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
2, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
2, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
2, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5,
3, -3.73577, -7.012782, 0, -0.5, 0.5, 0.5,
3, -3.73577, -7.012782, 1, -0.5, 0.5, 0.5,
3, -3.73577, -7.012782, 1, 1.5, 0.5, 0.5,
3, -3.73577, -7.012782, 0, 1.5, 0.5, 0.5
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
-3.353478, -3, -6.171268,
-3.353478, 2, -6.171268,
-3.353478, -3, -6.171268,
-3.527203, -3, -6.451773,
-3.353478, -2, -6.171268,
-3.527203, -2, -6.451773,
-3.353478, -1, -6.171268,
-3.527203, -1, -6.451773,
-3.353478, 0, -6.171268,
-3.527203, 0, -6.451773,
-3.353478, 1, -6.171268,
-3.527203, 1, -6.451773,
-3.353478, 2, -6.171268,
-3.527203, 2, -6.451773
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
-3.874652, -3, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, -3, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, -3, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, -3, -7.012782, 0, 1.5, 0.5, 0.5,
-3.874652, -2, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, -2, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, -2, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, -2, -7.012782, 0, 1.5, 0.5, 0.5,
-3.874652, -1, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, -1, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, -1, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, -1, -7.012782, 0, 1.5, 0.5, 0.5,
-3.874652, 0, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, 0, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, 0, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, 0, -7.012782, 0, 1.5, 0.5, 0.5,
-3.874652, 1, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, 1, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, 1, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, 1, -7.012782, 0, 1.5, 0.5, 0.5,
-3.874652, 2, -7.012782, 0, -0.5, 0.5, 0.5,
-3.874652, 2, -7.012782, 1, -0.5, 0.5, 0.5,
-3.874652, 2, -7.012782, 1, 1.5, 0.5, 0.5,
-3.874652, 2, -7.012782, 0, 1.5, 0.5, 0.5
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
-3.353478, -3.266282, -6,
-3.353478, -3.266282, 4,
-3.353478, -3.266282, -6,
-3.527203, -3.422778, -6,
-3.353478, -3.266282, -4,
-3.527203, -3.422778, -4,
-3.353478, -3.266282, -2,
-3.527203, -3.422778, -2,
-3.353478, -3.266282, 0,
-3.527203, -3.422778, 0,
-3.353478, -3.266282, 2,
-3.527203, -3.422778, 2,
-3.353478, -3.266282, 4,
-3.527203, -3.422778, 4
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
-3.874652, -3.73577, -6, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -6, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -6, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, -6, 0, 1.5, 0.5, 0.5,
-3.874652, -3.73577, -4, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -4, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -4, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, -4, 0, 1.5, 0.5, 0.5,
-3.874652, -3.73577, -2, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -2, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, -2, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, -2, 0, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 0, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 0, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 0, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 0, 0, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 2, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 2, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 2, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 2, 0, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 4, 0, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 4, 1, -0.5, 0.5, 0.5,
-3.874652, -3.73577, 4, 1, 1.5, 0.5, 0.5,
-3.874652, -3.73577, 4, 0, 1.5, 0.5, 0.5
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
-3.353478, -3.266282, -6.171268,
-3.353478, 2.993567, -6.171268,
-3.353478, -3.266282, 5.048912,
-3.353478, 2.993567, 5.048912,
-3.353478, -3.266282, -6.171268,
-3.353478, -3.266282, 5.048912,
-3.353478, 2.993567, -6.171268,
-3.353478, 2.993567, 5.048912,
-3.353478, -3.266282, -6.171268,
3.595514, -3.266282, -6.171268,
-3.353478, -3.266282, 5.048912,
3.595514, -3.266282, 5.048912,
-3.353478, 2.993567, -6.171268,
3.595514, 2.993567, -6.171268,
-3.353478, 2.993567, 5.048912,
3.595514, 2.993567, 5.048912,
3.595514, -3.266282, -6.171268,
3.595514, 2.993567, -6.171268,
3.595514, -3.266282, 5.048912,
3.595514, 2.993567, 5.048912,
3.595514, -3.266282, -6.171268,
3.595514, -3.266282, 5.048912,
3.595514, 2.993567, -6.171268,
3.595514, 2.993567, 5.048912
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
var radius = 7.799894;
var distance = 34.70261;
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
mvMatrix.translate( -0.1210181, 0.1363574, 0.5611782 );
mvMatrix.scale( 1.213615, 1.347221, 0.7516277 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70261);
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
Claudetite<-read.table("Claudetite.xyz")
```

```
## Error in read.table("Claudetite.xyz"): no lines available in input
```

```r
x<-Claudetite$V2
```

```
## Error in eval(expr, envir, enclos): object 'Claudetite' not found
```

```r
y<-Claudetite$V3
```

```
## Error in eval(expr, envir, enclos): object 'Claudetite' not found
```

```r
z<-Claudetite$V4
```

```
## Error in eval(expr, envir, enclos): object 'Claudetite' not found
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
-3.252279, -1.331987, -2.328684, 0, 0, 1, 1, 1,
-2.779282, -0.1747264, -1.234632, 1, 0, 0, 1, 1,
-2.57615, -0.04260624, -0.186738, 1, 0, 0, 1, 1,
-2.513436, 1.101329, -0.7948833, 1, 0, 0, 1, 1,
-2.508248, -2.296415, -2.187325, 1, 0, 0, 1, 1,
-2.484813, 0.4489444, -1.379517, 1, 0, 0, 1, 1,
-2.429185, -0.5833085, -2.795124, 0, 0, 0, 1, 1,
-2.427016, 0.1179469, -1.569142, 0, 0, 0, 1, 1,
-2.393517, -0.1712125, -2.146745, 0, 0, 0, 1, 1,
-2.390012, -0.3021615, -0.9357845, 0, 0, 0, 1, 1,
-2.364712, -0.2114965, -2.272907, 0, 0, 0, 1, 1,
-2.336095, 0.09929856, -2.26993, 0, 0, 0, 1, 1,
-2.264591, -0.1544673, -1.151348, 0, 0, 0, 1, 1,
-2.139895, 0.8983395, -0.5767528, 1, 1, 1, 1, 1,
-2.119623, -0.01508053, -0.6739042, 1, 1, 1, 1, 1,
-2.113565, 0.2704063, 0.1080617, 1, 1, 1, 1, 1,
-2.112955, 1.059566, -2.131268, 1, 1, 1, 1, 1,
-2.093308, 0.7850655, -2.130608, 1, 1, 1, 1, 1,
-2.092132, 0.9728975, -1.689809, 1, 1, 1, 1, 1,
-2.070332, 0.5442985, -1.587605, 1, 1, 1, 1, 1,
-2.043961, -0.6769672, -3.106744, 1, 1, 1, 1, 1,
-2.041084, 0.3725592, -1.187789, 1, 1, 1, 1, 1,
-2.025568, -1.481874, -3.078114, 1, 1, 1, 1, 1,
-1.977653, 0.3821941, -0.5985502, 1, 1, 1, 1, 1,
-1.962512, -1.247702, -2.437166, 1, 1, 1, 1, 1,
-1.943293, -2.656013, -6.007867, 1, 1, 1, 1, 1,
-1.924412, 0.4435348, -0.6901327, 1, 1, 1, 1, 1,
-1.909, -0.6588737, -2.15069, 1, 1, 1, 1, 1,
-1.906482, 0.9288331, -1.54563, 0, 0, 1, 1, 1,
-1.896725, -1.969733, -1.516459, 1, 0, 0, 1, 1,
-1.891731, -1.095859, -1.331987, 1, 0, 0, 1, 1,
-1.868874, -0.6114932, -1.907203, 1, 0, 0, 1, 1,
-1.865232, 0.6033074, -1.566003, 1, 0, 0, 1, 1,
-1.86261, -1.310054, -0.8780521, 1, 0, 0, 1, 1,
-1.846833, -0.2662083, -2.332145, 0, 0, 0, 1, 1,
-1.819037, -1.844836, -0.928942, 0, 0, 0, 1, 1,
-1.806856, -1.493578, -2.702699, 0, 0, 0, 1, 1,
-1.797754, 1.822191, -0.4684848, 0, 0, 0, 1, 1,
-1.78256, -0.1352052, -2.898208, 0, 0, 0, 1, 1,
-1.77891, 0.1089509, 0.37773, 0, 0, 0, 1, 1,
-1.760159, 1.284503, -1.957281, 0, 0, 0, 1, 1,
-1.759082, -0.2822277, -0.5013691, 1, 1, 1, 1, 1,
-1.718205, -0.8850394, -0.7828833, 1, 1, 1, 1, 1,
-1.70718, 0.4967609, -1.176214, 1, 1, 1, 1, 1,
-1.694292, 0.3846948, -1.218787, 1, 1, 1, 1, 1,
-1.69197, 0.1505441, -1.606994, 1, 1, 1, 1, 1,
-1.682747, -0.3811999, -1.386958, 1, 1, 1, 1, 1,
-1.678153, -0.140383, -2.451222, 1, 1, 1, 1, 1,
-1.671574, -0.5231939, -2.13972, 1, 1, 1, 1, 1,
-1.670704, 0.4519737, -0.8632191, 1, 1, 1, 1, 1,
-1.667882, -1.292997, -2.38217, 1, 1, 1, 1, 1,
-1.661318, 0.1423421, -0.3291154, 1, 1, 1, 1, 1,
-1.656956, -0.06640064, -3.099834, 1, 1, 1, 1, 1,
-1.655479, 0.143507, -1.219519, 1, 1, 1, 1, 1,
-1.642927, 0.7011604, -1.335876, 1, 1, 1, 1, 1,
-1.639176, -1.143459, -1.781725, 1, 1, 1, 1, 1,
-1.630854, 1.800083, -2.417386, 0, 0, 1, 1, 1,
-1.629711, 0.5569222, -1.498287, 1, 0, 0, 1, 1,
-1.618593, 2.810236, 0.2086402, 1, 0, 0, 1, 1,
-1.616043, 1.952748, 0.6826689, 1, 0, 0, 1, 1,
-1.611146, -0.9827591, -2.025165, 1, 0, 0, 1, 1,
-1.60795, -0.7514459, -3.110324, 1, 0, 0, 1, 1,
-1.598888, 0.09255748, -1.807284, 0, 0, 0, 1, 1,
-1.58722, -1.224064, -2.219798, 0, 0, 0, 1, 1,
-1.582603, 0.4448282, -0.01828572, 0, 0, 0, 1, 1,
-1.581401, 1.364733, -0.6730815, 0, 0, 0, 1, 1,
-1.578886, 0.5505118, -0.7452105, 0, 0, 0, 1, 1,
-1.573135, -0.04249541, -1.420692, 0, 0, 0, 1, 1,
-1.565457, -1.057005, -2.33836, 0, 0, 0, 1, 1,
-1.558503, 1.650645, -1.136257, 1, 1, 1, 1, 1,
-1.547065, 0.982729, -0.7170708, 1, 1, 1, 1, 1,
-1.546787, -0.04522702, -0.9096612, 1, 1, 1, 1, 1,
-1.545298, -0.698014, -3.141048, 1, 1, 1, 1, 1,
-1.521866, -0.1456657, 0.7744484, 1, 1, 1, 1, 1,
-1.515804, 0.5718766, -0.9347439, 1, 1, 1, 1, 1,
-1.500203, -0.5600032, -1.69639, 1, 1, 1, 1, 1,
-1.493737, -0.3012622, -1.782978, 1, 1, 1, 1, 1,
-1.473741, -0.1542454, -1.567795, 1, 1, 1, 1, 1,
-1.464788, 0.329507, 0.7741727, 1, 1, 1, 1, 1,
-1.459469, 0.8431887, -1.537326, 1, 1, 1, 1, 1,
-1.45585, 0.8345093, 0.5621284, 1, 1, 1, 1, 1,
-1.45366, 0.3584904, 0.07966559, 1, 1, 1, 1, 1,
-1.435593, 1.461414, -0.0363665, 1, 1, 1, 1, 1,
-1.434665, -0.3152818, -0.2574369, 1, 1, 1, 1, 1,
-1.43176, 1.089869, -0.06037651, 0, 0, 1, 1, 1,
-1.428837, 0.3116352, -1.839671, 1, 0, 0, 1, 1,
-1.404997, 1.693273, -1.455744, 1, 0, 0, 1, 1,
-1.398912, -0.08692735, -2.803244, 1, 0, 0, 1, 1,
-1.392517, -2.037527, -1.607903, 1, 0, 0, 1, 1,
-1.386501, -1.238692, -2.424316, 1, 0, 0, 1, 1,
-1.384316, 0.6764946, -0.2859128, 0, 0, 0, 1, 1,
-1.368897, -0.413972, -0.1483156, 0, 0, 0, 1, 1,
-1.36216, 0.3304595, -2.329584, 0, 0, 0, 1, 1,
-1.35816, 0.3825782, -2.691185, 0, 0, 0, 1, 1,
-1.343191, -0.09038831, -2.729808, 0, 0, 0, 1, 1,
-1.337083, -1.967968, -1.128388, 0, 0, 0, 1, 1,
-1.328278, 0.5490898, -0.5720105, 0, 0, 0, 1, 1,
-1.322767, -0.2392282, -2.842092, 1, 1, 1, 1, 1,
-1.315813, -0.7633731, -2.039256, 1, 1, 1, 1, 1,
-1.315192, -0.1024614, -0.9324259, 1, 1, 1, 1, 1,
-1.308974, 0.5443366, -0.5652485, 1, 1, 1, 1, 1,
-1.303703, -0.5988125, -3.849829, 1, 1, 1, 1, 1,
-1.30296, -1.396457, 1.217977, 1, 1, 1, 1, 1,
-1.287211, -0.2887585, -1.987407, 1, 1, 1, 1, 1,
-1.28346, -0.2274823, -1.254871, 1, 1, 1, 1, 1,
-1.272683, 0.6667054, -0.8450606, 1, 1, 1, 1, 1,
-1.25953, 0.3508789, -2.537831, 1, 1, 1, 1, 1,
-1.255808, -1.608021, -1.534787, 1, 1, 1, 1, 1,
-1.252392, -0.03569425, -0.3106025, 1, 1, 1, 1, 1,
-1.251166, 2.033139, -1.579915, 1, 1, 1, 1, 1,
-1.246783, -0.1475258, -2.395066, 1, 1, 1, 1, 1,
-1.245162, -0.05357719, -3.136095, 1, 1, 1, 1, 1,
-1.243964, -0.7631629, -1.984655, 0, 0, 1, 1, 1,
-1.238965, 1.573045, 0.3727908, 1, 0, 0, 1, 1,
-1.223206, 0.3578745, -0.2029678, 1, 0, 0, 1, 1,
-1.214583, -2.519217, -2.817314, 1, 0, 0, 1, 1,
-1.214156, 0.9845227, -0.1937922, 1, 0, 0, 1, 1,
-1.210714, -1.858349, -1.864132, 1, 0, 0, 1, 1,
-1.208927, 0.645322, -0.7853826, 0, 0, 0, 1, 1,
-1.205971, 0.3976271, -3.205783, 0, 0, 0, 1, 1,
-1.196325, 0.6013756, -0.008913475, 0, 0, 0, 1, 1,
-1.195481, 0.2416022, -0.2427527, 0, 0, 0, 1, 1,
-1.190346, 0.3256056, -1.470037, 0, 0, 0, 1, 1,
-1.174635, -3.175119, -2.040903, 0, 0, 0, 1, 1,
-1.167307, 1.702787, -0.7067246, 0, 0, 0, 1, 1,
-1.163158, -0.2202494, -1.045862, 1, 1, 1, 1, 1,
-1.16212, -1.162453, -1.735631, 1, 1, 1, 1, 1,
-1.158473, 0.03872919, -0.8038013, 1, 1, 1, 1, 1,
-1.157714, 0.9562067, 0.5295715, 1, 1, 1, 1, 1,
-1.153997, 1.47602, 0.007308084, 1, 1, 1, 1, 1,
-1.148619, 0.2744791, -0.02488833, 1, 1, 1, 1, 1,
-1.140818, -0.8148044, -2.346587, 1, 1, 1, 1, 1,
-1.138943, -0.7524897, -1.822032, 1, 1, 1, 1, 1,
-1.138695, 0.2388202, -2.884007, 1, 1, 1, 1, 1,
-1.134858, 1.651804, 0.5414631, 1, 1, 1, 1, 1,
-1.132335, 0.03472131, -2.292904, 1, 1, 1, 1, 1,
-1.129032, 0.7675343, 0.4601196, 1, 1, 1, 1, 1,
-1.123783, -1.172494, -0.4876368, 1, 1, 1, 1, 1,
-1.123667, -0.9347449, -4.682487, 1, 1, 1, 1, 1,
-1.118087, -1.429905, -0.8559778, 1, 1, 1, 1, 1,
-1.11743, 0.5795572, -0.5504816, 0, 0, 1, 1, 1,
-1.114066, 1.106125, -0.5908332, 1, 0, 0, 1, 1,
-1.101537, -0.7808716, -2.984191, 1, 0, 0, 1, 1,
-1.094702, 1.499707, -0.9227611, 1, 0, 0, 1, 1,
-1.08486, 0.5361592, 0.4745624, 1, 0, 0, 1, 1,
-1.076251, -0.5233371, -2.297066, 1, 0, 0, 1, 1,
-1.069633, 1.208497, 0.792537, 0, 0, 0, 1, 1,
-1.068651, -0.5525573, -3.891167, 0, 0, 0, 1, 1,
-1.057307, -0.3358676, -1.104509, 0, 0, 0, 1, 1,
-1.052876, 0.7484936, -1.578884, 0, 0, 0, 1, 1,
-1.052395, 0.682887, -1.054213, 0, 0, 0, 1, 1,
-1.049358, -0.238171, -3.465456, 0, 0, 0, 1, 1,
-1.046619, 0.01433209, -1.875117, 0, 0, 0, 1, 1,
-1.037748, -1.131246, -1.933758, 1, 1, 1, 1, 1,
-1.03219, 1.750673, -0.9226906, 1, 1, 1, 1, 1,
-1.030361, -0.1859622, -1.272166, 1, 1, 1, 1, 1,
-1.027238, 1.455267, 0.0829801, 1, 1, 1, 1, 1,
-1.019812, 0.2258756, -0.3588856, 1, 1, 1, 1, 1,
-1.012894, -2.031465, -4.641523, 1, 1, 1, 1, 1,
-1.009531, -1.692975, -2.279052, 1, 1, 1, 1, 1,
-1.00884, -1.173064, -2.940648, 1, 1, 1, 1, 1,
-1.006629, -1.283845, -2.42675, 1, 1, 1, 1, 1,
-1.000947, 1.438484, 0.8327511, 1, 1, 1, 1, 1,
-0.9998973, 0.6176131, -1.914114, 1, 1, 1, 1, 1,
-0.993095, -0.6909504, -1.10318, 1, 1, 1, 1, 1,
-0.9902858, -1.16202, -3.489125, 1, 1, 1, 1, 1,
-0.9874793, 1.010334, -0.1290682, 1, 1, 1, 1, 1,
-0.9813987, 1.955354, 1.38259, 1, 1, 1, 1, 1,
-0.9802203, 0.7256261, -1.750911, 0, 0, 1, 1, 1,
-0.9768776, -0.203385, -2.360096, 1, 0, 0, 1, 1,
-0.9720917, 1.004879, 0.175336, 1, 0, 0, 1, 1,
-0.9671977, 0.4092288, -2.87749, 1, 0, 0, 1, 1,
-0.9648568, -0.1605637, -0.2413527, 1, 0, 0, 1, 1,
-0.9631926, -0.8849598, -2.013718, 1, 0, 0, 1, 1,
-0.9611852, -0.0430965, -0.106914, 0, 0, 0, 1, 1,
-0.9549725, 1.994595, -0.6124015, 0, 0, 0, 1, 1,
-0.9475644, 1.237084, -1.685358, 0, 0, 0, 1, 1,
-0.9437311, -1.357355, -1.35143, 0, 0, 0, 1, 1,
-0.9403858, -0.3290413, -2.995142, 0, 0, 0, 1, 1,
-0.9342306, -1.19396, -3.267666, 0, 0, 0, 1, 1,
-0.9320816, -0.690129, -2.615898, 0, 0, 0, 1, 1,
-0.9304241, -0.3130496, -2.670663, 1, 1, 1, 1, 1,
-0.927295, 1.071544, -1.845482, 1, 1, 1, 1, 1,
-0.9246671, 1.29626, 0.2219769, 1, 1, 1, 1, 1,
-0.9209855, 0.9447501, -1.986487, 1, 1, 1, 1, 1,
-0.9142697, 1.000463, -0.2042569, 1, 1, 1, 1, 1,
-0.9120636, 0.4098182, -0.7200468, 1, 1, 1, 1, 1,
-0.9053872, -0.8899567, -1.476053, 1, 1, 1, 1, 1,
-0.9038711, -1.071695, -2.101382, 1, 1, 1, 1, 1,
-0.899699, 0.2124093, -2.809026, 1, 1, 1, 1, 1,
-0.8980365, 1.665301, -0.7887899, 1, 1, 1, 1, 1,
-0.8902356, 0.9907548, 0.9233537, 1, 1, 1, 1, 1,
-0.8901967, -0.006464062, -0.9499574, 1, 1, 1, 1, 1,
-0.8856076, -0.5836, -2.474775, 1, 1, 1, 1, 1,
-0.8845233, 0.642492, -0.8391313, 1, 1, 1, 1, 1,
-0.8842439, -1.323099, -1.360039, 1, 1, 1, 1, 1,
-0.8841023, -0.03998516, -0.8980935, 0, 0, 1, 1, 1,
-0.8802946, -1.071701, -2.669582, 1, 0, 0, 1, 1,
-0.8763305, 0.7770553, -0.3389717, 1, 0, 0, 1, 1,
-0.8699651, 1.008966, -2.180772, 1, 0, 0, 1, 1,
-0.8692111, 2.438027, -2.023307, 1, 0, 0, 1, 1,
-0.8641152, -2.030413, -1.589985, 1, 0, 0, 1, 1,
-0.8619576, 0.1097017, -1.866877, 0, 0, 0, 1, 1,
-0.8592517, -0.4115347, -0.1390307, 0, 0, 0, 1, 1,
-0.8590664, -1.391062, -1.474477, 0, 0, 0, 1, 1,
-0.848851, -0.9779364, -2.217786, 0, 0, 0, 1, 1,
-0.8481272, -0.006334994, -1.915685, 0, 0, 0, 1, 1,
-0.8479328, -0.1004099, -2.661401, 0, 0, 0, 1, 1,
-0.842489, -0.2380017, -1.799964, 0, 0, 0, 1, 1,
-0.8356788, 1.959659, -0.8727736, 1, 1, 1, 1, 1,
-0.8290098, -1.879079, -4.170463, 1, 1, 1, 1, 1,
-0.8274148, 0.128162, -1.429523, 1, 1, 1, 1, 1,
-0.8254268, -1.271625, -2.314311, 1, 1, 1, 1, 1,
-0.8168689, 1.406421, 0.6190909, 1, 1, 1, 1, 1,
-0.8155409, -1.314603, -2.246341, 1, 1, 1, 1, 1,
-0.8153011, -1.008061, -3.479522, 1, 1, 1, 1, 1,
-0.8132582, 0.9582728, -1.77643, 1, 1, 1, 1, 1,
-0.7942004, 0.3109245, -1.299151, 1, 1, 1, 1, 1,
-0.7905977, -0.8714728, -1.110405, 1, 1, 1, 1, 1,
-0.7898297, 1.092912, -0.4945243, 1, 1, 1, 1, 1,
-0.7887719, 1.049621, 0.5726444, 1, 1, 1, 1, 1,
-0.7782952, -1.195266, -1.794741, 1, 1, 1, 1, 1,
-0.7719494, -0.3454494, -0.4359615, 1, 1, 1, 1, 1,
-0.7699713, -0.670675, -2.380806, 1, 1, 1, 1, 1,
-0.7667758, 0.4149794, -1.690718, 0, 0, 1, 1, 1,
-0.7638372, -0.2739769, -0.6965619, 1, 0, 0, 1, 1,
-0.7588522, 1.675035, -1.072284, 1, 0, 0, 1, 1,
-0.7560254, 0.2934738, -1.110889, 1, 0, 0, 1, 1,
-0.7516099, 1.480604, -1.381571, 1, 0, 0, 1, 1,
-0.7388759, -0.8762086, -1.343633, 1, 0, 0, 1, 1,
-0.7388417, 0.5467641, -0.280381, 0, 0, 0, 1, 1,
-0.7388145, -0.1103969, -1.902755, 0, 0, 0, 1, 1,
-0.735826, 1.687566, -0.9639407, 0, 0, 0, 1, 1,
-0.7230664, -0.4788463, -0.3972746, 0, 0, 0, 1, 1,
-0.7218774, -0.1269546, -1.821278, 0, 0, 0, 1, 1,
-0.7157814, -1.409738, -2.847696, 0, 0, 0, 1, 1,
-0.7110111, -0.4218944, -2.281219, 0, 0, 0, 1, 1,
-0.7108519, -0.5826123, -2.208997, 1, 1, 1, 1, 1,
-0.7101458, 0.5478175, -1.476764, 1, 1, 1, 1, 1,
-0.7057979, 0.07087435, -0.9891354, 1, 1, 1, 1, 1,
-0.7055595, -0.4635254, -1.118354, 1, 1, 1, 1, 1,
-0.7047972, 0.6249313, -1.169182, 1, 1, 1, 1, 1,
-0.7035401, 1.015624, -0.1090275, 1, 1, 1, 1, 1,
-0.7007157, -0.921024, -2.540778, 1, 1, 1, 1, 1,
-0.6985593, 0.2631359, -1.23028, 1, 1, 1, 1, 1,
-0.6967174, 0.2314702, -0.7480781, 1, 1, 1, 1, 1,
-0.6912699, 2.123329, 0.7682037, 1, 1, 1, 1, 1,
-0.6911234, -0.8217013, -1.283667, 1, 1, 1, 1, 1,
-0.6911114, -0.1256912, -2.879636, 1, 1, 1, 1, 1,
-0.6910766, 1.824538, 0.7237349, 1, 1, 1, 1, 1,
-0.6876273, 1.369282, 0.5441415, 1, 1, 1, 1, 1,
-0.6876066, 0.4984787, -1.682859, 1, 1, 1, 1, 1,
-0.6855981, -0.7006715, -3.272156, 0, 0, 1, 1, 1,
-0.6846467, -0.5287654, -0.9122145, 1, 0, 0, 1, 1,
-0.6843031, -0.651514, -2.532569, 1, 0, 0, 1, 1,
-0.6841194, -1.517917, -0.8907838, 1, 0, 0, 1, 1,
-0.683301, -0.8793677, -2.538594, 1, 0, 0, 1, 1,
-0.6817641, 0.9011112, -1.000142, 1, 0, 0, 1, 1,
-0.6813555, 2.166379, 0.14567, 0, 0, 0, 1, 1,
-0.680139, 0.6477458, 0.5768907, 0, 0, 0, 1, 1,
-0.6796172, 0.577717, -1.213161, 0, 0, 0, 1, 1,
-0.6769946, -1.927527, -3.437615, 0, 0, 0, 1, 1,
-0.6725224, -0.2070104, -2.108835, 0, 0, 0, 1, 1,
-0.6724449, 0.3948792, -0.8363399, 0, 0, 0, 1, 1,
-0.6601621, 2.241489, 0.9023286, 0, 0, 0, 1, 1,
-0.6587048, 0.545685, -0.949163, 1, 1, 1, 1, 1,
-0.6557388, -0.9608933, -2.966778, 1, 1, 1, 1, 1,
-0.647597, 0.3069195, -1.905, 1, 1, 1, 1, 1,
-0.6403046, 0.1681457, -2.42322, 1, 1, 1, 1, 1,
-0.637554, -1.146015, -3.841796, 1, 1, 1, 1, 1,
-0.6353592, 0.3576502, -0.2967779, 1, 1, 1, 1, 1,
-0.6349876, -0.6384953, -1.836396, 1, 1, 1, 1, 1,
-0.6339504, -0.4689435, -2.973488, 1, 1, 1, 1, 1,
-0.6324778, 0.1249716, -1.856023, 1, 1, 1, 1, 1,
-0.6317592, -1.410887, -2.968052, 1, 1, 1, 1, 1,
-0.6306708, 1.24016, 0.1869874, 1, 1, 1, 1, 1,
-0.6275281, 1.237399, -0.03101631, 1, 1, 1, 1, 1,
-0.6213517, 0.5882898, -1.846854, 1, 1, 1, 1, 1,
-0.6161338, 1.55606, -0.5280584, 1, 1, 1, 1, 1,
-0.6116123, 0.467982, -1.495328, 1, 1, 1, 1, 1,
-0.6111467, 0.3211386, -0.947689, 0, 0, 1, 1, 1,
-0.6100701, -0.1476546, -3.150199, 1, 0, 0, 1, 1,
-0.609705, -0.4928466, -1.402037, 1, 0, 0, 1, 1,
-0.608974, 0.1605629, 0.5178457, 1, 0, 0, 1, 1,
-0.6048073, -1.544484, -4.87828, 1, 0, 0, 1, 1,
-0.5963991, -0.420136, -2.931407, 1, 0, 0, 1, 1,
-0.5923194, -0.4459825, -3.166595, 0, 0, 0, 1, 1,
-0.5873114, 0.7134723, -0.3342274, 0, 0, 0, 1, 1,
-0.5871392, 0.203314, -2.878523, 0, 0, 0, 1, 1,
-0.5826637, -0.7549563, -2.931911, 0, 0, 0, 1, 1,
-0.5821047, 0.07504, -2.503016, 0, 0, 0, 1, 1,
-0.5793786, 1.981809, 1.114206, 0, 0, 0, 1, 1,
-0.573616, 0.4550628, -0.817731, 0, 0, 0, 1, 1,
-0.5693302, 0.8002648, -1.425193, 1, 1, 1, 1, 1,
-0.5686451, -0.05828818, -1.5736, 1, 1, 1, 1, 1,
-0.5641414, 0.8714144, -1.077263, 1, 1, 1, 1, 1,
-0.5613402, -0.2510135, -2.500453, 1, 1, 1, 1, 1,
-0.5605223, 0.3779038, -1.296984, 1, 1, 1, 1, 1,
-0.5598324, 0.4041733, -1.702368, 1, 1, 1, 1, 1,
-0.5596711, -0.4833878, -3.155334, 1, 1, 1, 1, 1,
-0.5507078, -0.2142401, -1.755345, 1, 1, 1, 1, 1,
-0.545395, -1.497405, -2.280507, 1, 1, 1, 1, 1,
-0.5435162, 0.7561005, -1.211604, 1, 1, 1, 1, 1,
-0.5395483, 0.05263862, -0.8409861, 1, 1, 1, 1, 1,
-0.536182, 1.337585, -0.9834041, 1, 1, 1, 1, 1,
-0.5334299, -0.9712112, -2.882708, 1, 1, 1, 1, 1,
-0.5321945, 0.6480311, 0.5630308, 1, 1, 1, 1, 1,
-0.5288612, -0.6443065, -1.681411, 1, 1, 1, 1, 1,
-0.5276464, 0.9862567, -2.117396, 0, 0, 1, 1, 1,
-0.5258197, -0.4241079, -2.036243, 1, 0, 0, 1, 1,
-0.5250742, 0.6830921, 0.8465851, 1, 0, 0, 1, 1,
-0.523849, 0.04913557, -0.8747742, 1, 0, 0, 1, 1,
-0.5215759, -0.1834665, -2.594846, 1, 0, 0, 1, 1,
-0.5204536, -0.4488508, -3.190918, 1, 0, 0, 1, 1,
-0.5175436, 0.9394383, 0.2002103, 0, 0, 0, 1, 1,
-0.5107173, 0.8839126, -0.9873464, 0, 0, 0, 1, 1,
-0.5103394, -1.161721, -3.77308, 0, 0, 0, 1, 1,
-0.5083862, -1.585094, -4.309719, 0, 0, 0, 1, 1,
-0.5009429, 0.4270833, -1.382541, 0, 0, 0, 1, 1,
-0.4996931, -1.146196, -3.088509, 0, 0, 0, 1, 1,
-0.4955177, 0.1493625, -0.6706841, 0, 0, 0, 1, 1,
-0.4919509, -1.447859, -2.055402, 1, 1, 1, 1, 1,
-0.4863974, 0.4730953, -0.9694911, 1, 1, 1, 1, 1,
-0.4814414, 0.3294253, -0.08485839, 1, 1, 1, 1, 1,
-0.480255, 1.132833, 0.7938548, 1, 1, 1, 1, 1,
-0.4790167, -0.8591456, -3.329619, 1, 1, 1, 1, 1,
-0.4784026, 0.3121313, -1.63275, 1, 1, 1, 1, 1,
-0.4682641, 0.5127277, 0.3586698, 1, 1, 1, 1, 1,
-0.4675553, 2.000175, 1.30494, 1, 1, 1, 1, 1,
-0.4674544, -0.0124558, -2.131463, 1, 1, 1, 1, 1,
-0.4546711, 0.05255507, -2.305411, 1, 1, 1, 1, 1,
-0.4524541, -1.075131, -3.615886, 1, 1, 1, 1, 1,
-0.4523453, 0.08026715, -2.855042, 1, 1, 1, 1, 1,
-0.4516329, -0.3299678, -2.088702, 1, 1, 1, 1, 1,
-0.447172, -1.704734, -3.810472, 1, 1, 1, 1, 1,
-0.4469674, 0.4015981, 0.3866206, 1, 1, 1, 1, 1,
-0.445862, 0.442894, -2.38653, 0, 0, 1, 1, 1,
-0.444604, 0.009433916, 0.1640367, 1, 0, 0, 1, 1,
-0.4413148, -2.025007, -3.361874, 1, 0, 0, 1, 1,
-0.4376617, 0.2262777, 0.6970882, 1, 0, 0, 1, 1,
-0.4373352, 0.01181185, -2.959914, 1, 0, 0, 1, 1,
-0.4336503, 0.4387032, -0.8277339, 1, 0, 0, 1, 1,
-0.4263119, 0.6202689, -1.78084, 0, 0, 0, 1, 1,
-0.4261284, -0.1375617, -2.757709, 0, 0, 0, 1, 1,
-0.4254943, -2.902543, -3.069143, 0, 0, 0, 1, 1,
-0.4191424, 0.3439179, 0.103895, 0, 0, 0, 1, 1,
-0.4039087, -0.3948484, -4.500928, 0, 0, 0, 1, 1,
-0.3971371, -1.260418, -3.432931, 0, 0, 0, 1, 1,
-0.3970297, -1.46434, -1.807414, 0, 0, 0, 1, 1,
-0.393989, 0.5378339, -1.551699, 1, 1, 1, 1, 1,
-0.3882572, 0.5753506, -1.687053, 1, 1, 1, 1, 1,
-0.3846929, 0.7293452, 0.3078273, 1, 1, 1, 1, 1,
-0.3717459, 1.690716, -0.02065392, 1, 1, 1, 1, 1,
-0.3680994, 0.5552096, -1.342639, 1, 1, 1, 1, 1,
-0.3572353, 1.989089, 1.296007, 1, 1, 1, 1, 1,
-0.3504851, -1.444527, -3.809985, 1, 1, 1, 1, 1,
-0.349623, -0.2131173, -0.6205877, 1, 1, 1, 1, 1,
-0.3466157, 0.3382822, -1.726806, 1, 1, 1, 1, 1,
-0.3464395, -1.654148, -2.299098, 1, 1, 1, 1, 1,
-0.3412478, 1.444047, -0.8313065, 1, 1, 1, 1, 1,
-0.3392414, 1.597385, 1.724549, 1, 1, 1, 1, 1,
-0.3383356, -0.685541, -2.53347, 1, 1, 1, 1, 1,
-0.335564, -0.8867022, -2.511734, 1, 1, 1, 1, 1,
-0.3293616, 1.02858, -0.3758755, 1, 1, 1, 1, 1,
-0.3273166, 0.4910218, 0.09012352, 0, 0, 1, 1, 1,
-0.3261052, -0.4536614, -1.288662, 1, 0, 0, 1, 1,
-0.3223882, 1.445928, 0.207045, 1, 0, 0, 1, 1,
-0.320203, 0.1816083, -2.521358, 1, 0, 0, 1, 1,
-0.3173565, 1.092257, 1.235304, 1, 0, 0, 1, 1,
-0.3152945, -2.428206, -3.788888, 1, 0, 0, 1, 1,
-0.3119264, -0.855625, -3.354722, 0, 0, 0, 1, 1,
-0.3102622, 0.2260207, -1.048278, 0, 0, 0, 1, 1,
-0.3097575, -0.4585509, -1.790606, 0, 0, 0, 1, 1,
-0.3066784, 0.7191051, 0.5916224, 0, 0, 0, 1, 1,
-0.3062133, 1.825008, 0.6020132, 0, 0, 0, 1, 1,
-0.3028206, 0.8726798, -1.273536, 0, 0, 0, 1, 1,
-0.2978052, 0.2454109, 1.126535, 0, 0, 0, 1, 1,
-0.2898513, -0.1262502, -2.178225, 1, 1, 1, 1, 1,
-0.2895606, 1.01649, 0.2812209, 1, 1, 1, 1, 1,
-0.2883678, -0.4432162, -2.3394, 1, 1, 1, 1, 1,
-0.283757, 0.1123754, -3.575287, 1, 1, 1, 1, 1,
-0.2833198, -2.74319, -3.412593, 1, 1, 1, 1, 1,
-0.2810494, -0.6952859, -3.056056, 1, 1, 1, 1, 1,
-0.2805638, -0.665704, -0.6679147, 1, 1, 1, 1, 1,
-0.2798575, -0.2174581, -1.641911, 1, 1, 1, 1, 1,
-0.279243, -0.08526856, -0.4063979, 1, 1, 1, 1, 1,
-0.2767234, 0.9639573, -0.3147491, 1, 1, 1, 1, 1,
-0.2761751, 2.888515, 1.072532, 1, 1, 1, 1, 1,
-0.2742393, 1.351417, -0.6733166, 1, 1, 1, 1, 1,
-0.2736634, 0.4120321, 1.040763, 1, 1, 1, 1, 1,
-0.2715825, -1.096708, -2.651371, 1, 1, 1, 1, 1,
-0.2653186, -1.275943, -3.891889, 1, 1, 1, 1, 1,
-0.2652052, 1.059388, 0.4801386, 0, 0, 1, 1, 1,
-0.2584813, -0.6382086, -3.528415, 1, 0, 0, 1, 1,
-0.2578989, -1.051028, -3.674181, 1, 0, 0, 1, 1,
-0.2560436, 0.2694539, -0.1908291, 1, 0, 0, 1, 1,
-0.2517245, -1.183132, -4.30198, 1, 0, 0, 1, 1,
-0.2474964, -1.039306, -2.992054, 1, 0, 0, 1, 1,
-0.2450872, -1.497887, -1.985882, 0, 0, 0, 1, 1,
-0.240834, -1.203181, -2.896569, 0, 0, 0, 1, 1,
-0.2390243, 0.02712055, -1.511103, 0, 0, 0, 1, 1,
-0.2388007, 0.4089383, -0.768241, 0, 0, 0, 1, 1,
-0.238303, -0.1286093, -2.669481, 0, 0, 0, 1, 1,
-0.237684, 0.2030693, -3.196694, 0, 0, 0, 1, 1,
-0.2372674, -0.5189508, -2.87811, 0, 0, 0, 1, 1,
-0.2360055, 1.649204, -1.642916, 1, 1, 1, 1, 1,
-0.2318982, -0.9363925, -2.858394, 1, 1, 1, 1, 1,
-0.230767, -0.4912545, -2.308751, 1, 1, 1, 1, 1,
-0.2220135, -0.5964422, -3.419832, 1, 1, 1, 1, 1,
-0.221036, 0.543791, -1.266916, 1, 1, 1, 1, 1,
-0.2203124, -0.5172581, -3.726448, 1, 1, 1, 1, 1,
-0.2186765, -1.166288, -2.260825, 1, 1, 1, 1, 1,
-0.2172117, -0.2620581, -3.06204, 1, 1, 1, 1, 1,
-0.2166663, 0.7718501, 0.4614, 1, 1, 1, 1, 1,
-0.2162714, 1.778113, -0.5280168, 1, 1, 1, 1, 1,
-0.2138835, -0.1100744, -1.183816, 1, 1, 1, 1, 1,
-0.2137993, -1.680924, -2.085121, 1, 1, 1, 1, 1,
-0.2127748, 1.044673, 0.9292185, 1, 1, 1, 1, 1,
-0.2076401, -0.4364843, -3.978007, 1, 1, 1, 1, 1,
-0.2024065, 0.4086315, -0.05162121, 1, 1, 1, 1, 1,
-0.2013626, 1.054424, 0.8132116, 0, 0, 1, 1, 1,
-0.1944227, -1.01751, -0.5324903, 1, 0, 0, 1, 1,
-0.1919395, 0.1569492, -0.3076163, 1, 0, 0, 1, 1,
-0.1908165, 1.098947, 0.3353214, 1, 0, 0, 1, 1,
-0.1893551, 2.326365, -1.053142, 1, 0, 0, 1, 1,
-0.1891836, 2.112526, -1.638304, 1, 0, 0, 1, 1,
-0.1883077, 2.060912, -0.8029734, 0, 0, 0, 1, 1,
-0.1821006, -0.4939858, -4.583081, 0, 0, 0, 1, 1,
-0.1768327, 1.496433, 1.435889, 0, 0, 0, 1, 1,
-0.1730425, 0.3434716, -0.08551507, 0, 0, 0, 1, 1,
-0.1726203, -0.3578859, -3.034322, 0, 0, 0, 1, 1,
-0.1721264, -0.635529, -2.089039, 0, 0, 0, 1, 1,
-0.1691466, -0.4825666, -2.227717, 0, 0, 0, 1, 1,
-0.1661791, -0.7952598, -2.833985, 1, 1, 1, 1, 1,
-0.1658578, 0.424234, -0.3324156, 1, 1, 1, 1, 1,
-0.1604202, -0.3776215, -1.983044, 1, 1, 1, 1, 1,
-0.1598195, -1.43862, -3.387946, 1, 1, 1, 1, 1,
-0.1579345, 0.2528435, -0.4899392, 1, 1, 1, 1, 1,
-0.1541747, -1.180824, -3.740579, 1, 1, 1, 1, 1,
-0.1531802, 0.7122391, 0.06145994, 1, 1, 1, 1, 1,
-0.1484692, -0.719702, -2.365698, 1, 1, 1, 1, 1,
-0.1455844, 0.06969741, -1.865913, 1, 1, 1, 1, 1,
-0.1453222, -0.2841719, -1.645266, 1, 1, 1, 1, 1,
-0.1435991, 1.230159, 1.231511, 1, 1, 1, 1, 1,
-0.1429256, -0.2833533, -3.300656, 1, 1, 1, 1, 1,
-0.1427648, -0.693932, -2.229682, 1, 1, 1, 1, 1,
-0.1376474, 0.8702145, -2.355302, 1, 1, 1, 1, 1,
-0.1357577, -0.05253571, -2.454992, 1, 1, 1, 1, 1,
-0.1357009, 0.9300541, -1.199787, 0, 0, 1, 1, 1,
-0.1346151, 0.4475444, 0.03388603, 1, 0, 0, 1, 1,
-0.1337165, -1.091106, -2.402709, 1, 0, 0, 1, 1,
-0.1314472, 1.199313, 0.7574895, 1, 0, 0, 1, 1,
-0.1314407, -1.929541, -2.652913, 1, 0, 0, 1, 1,
-0.1311227, 1.481155, -0.2685982, 1, 0, 0, 1, 1,
-0.1305579, -0.4663642, -0.720394, 0, 0, 0, 1, 1,
-0.124476, -1.252325, -2.829311, 0, 0, 0, 1, 1,
-0.121956, -0.5061417, -4.594197, 0, 0, 0, 1, 1,
-0.1201527, 0.6601602, 0.9393494, 0, 0, 0, 1, 1,
-0.1196408, 0.7516722, 1.153944, 0, 0, 0, 1, 1,
-0.1174987, -0.4685921, -2.415661, 0, 0, 0, 1, 1,
-0.1167673, 0.2380792, 0.6708028, 0, 0, 0, 1, 1,
-0.115174, 0.2288456, -0.2221441, 1, 1, 1, 1, 1,
-0.1118639, -1.017802, -2.165485, 1, 1, 1, 1, 1,
-0.08987737, 0.3794698, -0.3535305, 1, 1, 1, 1, 1,
-0.07498224, -1.292093, -3.124123, 1, 1, 1, 1, 1,
-0.07338867, -0.6314825, -2.171884, 1, 1, 1, 1, 1,
-0.06102587, -0.5239533, -3.706053, 1, 1, 1, 1, 1,
-0.05979613, -0.5769771, -4.474838, 1, 1, 1, 1, 1,
-0.05668798, -1.353603, -3.915084, 1, 1, 1, 1, 1,
-0.05381698, 1.430766, 0.0009545371, 1, 1, 1, 1, 1,
-0.05105613, -0.4923289, -3.437628, 1, 1, 1, 1, 1,
-0.04823254, 0.5452049, 0.1980552, 1, 1, 1, 1, 1,
-0.04383562, -0.05431411, -2.950423, 1, 1, 1, 1, 1,
-0.0412174, -1.198065, -2.850334, 1, 1, 1, 1, 1,
-0.03880636, -0.7330881, -5.102832, 1, 1, 1, 1, 1,
-0.03791182, 0.3985045, -0.9320746, 1, 1, 1, 1, 1,
-0.03580906, -1.650873, -3.562446, 0, 0, 1, 1, 1,
-0.03574722, -0.9104982, -1.747283, 1, 0, 0, 1, 1,
-0.03159156, 0.4973387, 0.1295271, 1, 0, 0, 1, 1,
-0.02978477, 0.3764814, -1.77494, 1, 0, 0, 1, 1,
-0.02927613, -0.1010135, -2.838646, 1, 0, 0, 1, 1,
-0.02656461, 1.508371, -0.8403987, 1, 0, 0, 1, 1,
-0.02078821, 0.8781453, 0.9601758, 0, 0, 0, 1, 1,
-0.0190004, 1.260619, 0.4029858, 0, 0, 0, 1, 1,
-0.01891186, 1.357935, 0.2440283, 0, 0, 0, 1, 1,
-0.01821778, -0.01609375, -3.05748, 0, 0, 0, 1, 1,
-0.01594725, -0.8254271, -2.079345, 0, 0, 0, 1, 1,
-0.01525207, -1.346572, -2.354414, 0, 0, 0, 1, 1,
-0.01469741, -0.1533608, -3.130594, 0, 0, 0, 1, 1,
-0.0128, -0.01508899, -3.66958, 1, 1, 1, 1, 1,
-0.012355, 0.4411697, -1.545594, 1, 1, 1, 1, 1,
0.003135517, 0.6140595, 2.863265, 1, 1, 1, 1, 1,
0.003319258, 1.209275, 0.5845785, 1, 1, 1, 1, 1,
0.006961275, -0.4332149, 1.833192, 1, 1, 1, 1, 1,
0.00721622, -0.4825316, 3.124509, 1, 1, 1, 1, 1,
0.007702241, -2.618523, 2.906171, 1, 1, 1, 1, 1,
0.008647783, 0.03217289, -0.1170562, 1, 1, 1, 1, 1,
0.01019525, 1.164137, 1.252247, 1, 1, 1, 1, 1,
0.01144251, 0.9565045, -0.6147373, 1, 1, 1, 1, 1,
0.01593011, 0.4728967, -0.2151036, 1, 1, 1, 1, 1,
0.01715278, 0.2221787, 0.5898712, 1, 1, 1, 1, 1,
0.01749506, -0.5740308, 4.524992, 1, 1, 1, 1, 1,
0.02296575, -1.287767, 3.134073, 1, 1, 1, 1, 1,
0.0244368, 0.9149809, -0.3083549, 1, 1, 1, 1, 1,
0.03615616, -0.4732794, 3.947755, 0, 0, 1, 1, 1,
0.04682307, 0.1955519, -0.2827612, 1, 0, 0, 1, 1,
0.04789572, 0.8474033, -0.007802469, 1, 0, 0, 1, 1,
0.05003924, -0.6390963, 3.471318, 1, 0, 0, 1, 1,
0.05051079, 0.02618277, 1.018026, 1, 0, 0, 1, 1,
0.05200139, 0.6813698, -0.7203652, 1, 0, 0, 1, 1,
0.05305421, 0.5378324, -0.2439807, 0, 0, 0, 1, 1,
0.0535524, 1.805521, -2.724676, 0, 0, 0, 1, 1,
0.05899539, 0.09214947, 0.57133, 0, 0, 0, 1, 1,
0.06338578, -0.0243169, 2.981139, 0, 0, 0, 1, 1,
0.06420758, -0.431249, 2.867117, 0, 0, 0, 1, 1,
0.06636663, -1.490513, 4.169245, 0, 0, 0, 1, 1,
0.07282501, -0.2786568, 1.924963, 0, 0, 0, 1, 1,
0.08544559, -0.6131207, 3.906658, 1, 1, 1, 1, 1,
0.08908046, 1.303055, 0.1703184, 1, 1, 1, 1, 1,
0.1017527, -0.9189586, 3.579238, 1, 1, 1, 1, 1,
0.1023611, 0.7600369, 1.568337, 1, 1, 1, 1, 1,
0.1040601, -1.169985, 2.293974, 1, 1, 1, 1, 1,
0.1052909, 1.038566, 1.024377, 1, 1, 1, 1, 1,
0.1067425, 0.1250992, 1.064465, 1, 1, 1, 1, 1,
0.1110292, 0.4556434, 1.125897, 1, 1, 1, 1, 1,
0.1149955, -0.04542296, 1.216545, 1, 1, 1, 1, 1,
0.1152785, -0.03033444, 1.538048, 1, 1, 1, 1, 1,
0.1162738, 0.9828845, 0.1587857, 1, 1, 1, 1, 1,
0.1178418, -0.535046, 1.830504, 1, 1, 1, 1, 1,
0.1183498, -0.4084505, 3.38949, 1, 1, 1, 1, 1,
0.1229291, 0.7952239, -0.8301612, 1, 1, 1, 1, 1,
0.1236166, 0.7635272, 0.2178892, 1, 1, 1, 1, 1,
0.1258038, 0.174234, 1.163054, 0, 0, 1, 1, 1,
0.1261103, -1.260958, 2.568418, 1, 0, 0, 1, 1,
0.1351145, 1.248227, -0.1006077, 1, 0, 0, 1, 1,
0.1362625, 1.871523, 0.1922408, 1, 0, 0, 1, 1,
0.1370148, 1.043061, -1.481132, 1, 0, 0, 1, 1,
0.1393416, 0.2635567, 0.1038856, 1, 0, 0, 1, 1,
0.1396683, 0.2741936, -0.6197659, 0, 0, 0, 1, 1,
0.1430794, -0.6565711, 2.108996, 0, 0, 0, 1, 1,
0.1437712, 0.2095588, 3.204617, 0, 0, 0, 1, 1,
0.1457835, -0.6840128, 1.953153, 0, 0, 0, 1, 1,
0.1496535, -0.7921758, 3.553761, 0, 0, 0, 1, 1,
0.1639905, 0.8943236, 0.5379249, 0, 0, 0, 1, 1,
0.1674278, 0.03460124, 1.923873, 0, 0, 0, 1, 1,
0.1689704, 0.02020347, 0.6904309, 1, 1, 1, 1, 1,
0.1697063, -0.9247119, 4.780047, 1, 1, 1, 1, 1,
0.1721516, 0.8335193, 1.228159, 1, 1, 1, 1, 1,
0.173158, 0.7504568, 0.03055953, 1, 1, 1, 1, 1,
0.1753039, -1.128026, 3.668981, 1, 1, 1, 1, 1,
0.1758126, -1.46774, 3.210875, 1, 1, 1, 1, 1,
0.1760959, -0.2481185, 1.921752, 1, 1, 1, 1, 1,
0.1794899, 0.1629924, 1.156173, 1, 1, 1, 1, 1,
0.1802171, -0.1596073, 1.158023, 1, 1, 1, 1, 1,
0.1825488, -1.721212, 2.578195, 1, 1, 1, 1, 1,
0.1829991, 0.8281696, 0.5079428, 1, 1, 1, 1, 1,
0.1836808, -1.390781, 2.352407, 1, 1, 1, 1, 1,
0.1844173, 0.4841561, 1.027351, 1, 1, 1, 1, 1,
0.1847062, -0.6535607, 2.705557, 1, 1, 1, 1, 1,
0.1860901, -1.416526, 2.63348, 1, 1, 1, 1, 1,
0.1958423, 0.9311584, 1.47894, 0, 0, 1, 1, 1,
0.2012195, 0.5661719, 1.377291, 1, 0, 0, 1, 1,
0.2039407, 0.4627441, 2.170357, 1, 0, 0, 1, 1,
0.2168451, -0.1482424, 3.273951, 1, 0, 0, 1, 1,
0.2175757, 0.8188125, -1.84008, 1, 0, 0, 1, 1,
0.2185188, -0.2416111, 1.255798, 1, 0, 0, 1, 1,
0.21946, 0.2263263, -0.1373651, 0, 0, 0, 1, 1,
0.2217274, -0.751776, 3.26922, 0, 0, 0, 1, 1,
0.2249613, 1.678489, 0.7052794, 0, 0, 0, 1, 1,
0.2340008, 1.054052, -1.46027, 0, 0, 0, 1, 1,
0.2345447, 0.7606043, 0.5016115, 0, 0, 0, 1, 1,
0.2439405, -0.508709, 3.263779, 0, 0, 0, 1, 1,
0.2444014, 0.7466813, 0.5736393, 0, 0, 0, 1, 1,
0.2452204, -1.161426, 3.006617, 1, 1, 1, 1, 1,
0.2473255, -0.543959, 3.621558, 1, 1, 1, 1, 1,
0.2486042, 0.9495446, 1.821752, 1, 1, 1, 1, 1,
0.251087, 0.6223305, 0.3454785, 1, 1, 1, 1, 1,
0.252007, -1.516379, 2.288234, 1, 1, 1, 1, 1,
0.2583, 0.4008257, 0.4550288, 1, 1, 1, 1, 1,
0.2593309, -0.861984, 3.491875, 1, 1, 1, 1, 1,
0.2614508, 0.1676631, 0.7192081, 1, 1, 1, 1, 1,
0.2625254, 0.8899373, 0.7466805, 1, 1, 1, 1, 1,
0.2655839, -0.3320491, 3.143605, 1, 1, 1, 1, 1,
0.2676669, -1.077627, 2.181546, 1, 1, 1, 1, 1,
0.2687702, -1.162478, 1.96192, 1, 1, 1, 1, 1,
0.2705959, -0.03771894, 1.150065, 1, 1, 1, 1, 1,
0.2725681, -0.1687778, 1.476978, 1, 1, 1, 1, 1,
0.276175, -0.06275392, 2.013145, 1, 1, 1, 1, 1,
0.2791511, -0.02067889, 2.421832, 0, 0, 1, 1, 1,
0.2821396, 0.08770642, 0.6000288, 1, 0, 0, 1, 1,
0.2863959, -0.9471037, 3.981871, 1, 0, 0, 1, 1,
0.2895825, -0.1838443, 2.163992, 1, 0, 0, 1, 1,
0.2897027, -0.403488, 2.806345, 1, 0, 0, 1, 1,
0.2910739, 0.808441, -0.1118696, 1, 0, 0, 1, 1,
0.2913275, -0.08274648, 1.50621, 0, 0, 0, 1, 1,
0.298543, 0.432206, -0.1085677, 0, 0, 0, 1, 1,
0.308616, 0.9948819, 2.527935, 0, 0, 0, 1, 1,
0.3111443, 0.6029484, 1.541752, 0, 0, 0, 1, 1,
0.3146891, -0.7251906, 1.675207, 0, 0, 0, 1, 1,
0.3150031, 1.092741, -1.326548, 0, 0, 0, 1, 1,
0.3172587, -0.6833491, 2.707023, 0, 0, 0, 1, 1,
0.3203661, -0.9807419, 3.682875, 1, 1, 1, 1, 1,
0.3269131, -0.8356413, 3.467734, 1, 1, 1, 1, 1,
0.3287387, 0.4110107, 0.8273073, 1, 1, 1, 1, 1,
0.3342992, -1.42118, 3.958497, 1, 1, 1, 1, 1,
0.3361349, -0.02610223, 2.855003, 1, 1, 1, 1, 1,
0.3404611, 0.812222, -0.2718057, 1, 1, 1, 1, 1,
0.3434609, 0.5075463, 1.474561, 1, 1, 1, 1, 1,
0.3443939, -0.3573486, 2.726217, 1, 1, 1, 1, 1,
0.3453545, 2.040972, -0.6998121, 1, 1, 1, 1, 1,
0.3465062, 0.03963538, 1.040288, 1, 1, 1, 1, 1,
0.347255, 0.1566147, 1.876004, 1, 1, 1, 1, 1,
0.3569674, 1.310552, 0.05028146, 1, 1, 1, 1, 1,
0.3576668, 0.06796478, 2.946178, 1, 1, 1, 1, 1,
0.3593134, 1.054846, 0.9487784, 1, 1, 1, 1, 1,
0.3629975, 1.084449, -1.580652, 1, 1, 1, 1, 1,
0.363497, -0.282956, 2.221254, 0, 0, 1, 1, 1,
0.3658246, 1.539443, 0.4290251, 1, 0, 0, 1, 1,
0.368014, -1.495268, 2.283323, 1, 0, 0, 1, 1,
0.3693959, -0.2118752, 2.386768, 1, 0, 0, 1, 1,
0.3709458, 1.500652, -0.05049738, 1, 0, 0, 1, 1,
0.3732451, 1.105839, -0.6089228, 1, 0, 0, 1, 1,
0.3767459, -0.3273646, 2.803285, 0, 0, 0, 1, 1,
0.3834423, -0.5743412, 2.244532, 0, 0, 0, 1, 1,
0.3851704, -0.7602242, 2.732248, 0, 0, 0, 1, 1,
0.3901717, 0.6757874, 0.5645335, 0, 0, 0, 1, 1,
0.3909894, -2.240357, 3.162591, 0, 0, 0, 1, 1,
0.3958557, -0.8247944, 3.677576, 0, 0, 0, 1, 1,
0.3961743, -1.167361, 2.304287, 0, 0, 0, 1, 1,
0.3963647, -0.1725846, 3.387141, 1, 1, 1, 1, 1,
0.3977551, -1.154945, 1.848072, 1, 1, 1, 1, 1,
0.4026016, 1.307627, -1.878671, 1, 1, 1, 1, 1,
0.4041694, 0.792285, 0.7254192, 1, 1, 1, 1, 1,
0.4068154, 1.876274, 0.3897702, 1, 1, 1, 1, 1,
0.409338, -0.3752961, 1.53538, 1, 1, 1, 1, 1,
0.411469, 0.9639003, -0.4328491, 1, 1, 1, 1, 1,
0.4116451, -0.9438998, 2.318311, 1, 1, 1, 1, 1,
0.4123713, 0.185959, 1.513555, 1, 1, 1, 1, 1,
0.4126753, 2.902404, 0.1486986, 1, 1, 1, 1, 1,
0.4168431, -0.6244602, 3.262748, 1, 1, 1, 1, 1,
0.4208176, 0.3576438, 1.289429, 1, 1, 1, 1, 1,
0.4289808, -1.45561, 3.314356, 1, 1, 1, 1, 1,
0.436442, -0.5999669, 1.098323, 1, 1, 1, 1, 1,
0.4402834, -1.852374, 3.817775, 1, 1, 1, 1, 1,
0.4407143, 0.756594, -0.1216361, 0, 0, 1, 1, 1,
0.4409526, 0.4098478, 0.8675125, 1, 0, 0, 1, 1,
0.4430645, 1.363849, 1.415408, 1, 0, 0, 1, 1,
0.4435782, 0.5303209, 1.828824, 1, 0, 0, 1, 1,
0.4477126, -1.658, 4.28028, 1, 0, 0, 1, 1,
0.4529226, 0.4823834, 0.8124904, 1, 0, 0, 1, 1,
0.4536988, -0.7778457, 2.425776, 0, 0, 0, 1, 1,
0.4578211, 0.1038406, 0.6457805, 0, 0, 0, 1, 1,
0.4606266, -0.1052618, 1.194124, 0, 0, 0, 1, 1,
0.4610206, -0.5821658, 2.790797, 0, 0, 0, 1, 1,
0.4632839, -0.3211539, 3.597929, 0, 0, 0, 1, 1,
0.4636947, -0.6125637, 1.890274, 0, 0, 0, 1, 1,
0.4717686, -0.5056209, 0.1552017, 0, 0, 0, 1, 1,
0.4761012, 1.25868, 0.08143172, 1, 1, 1, 1, 1,
0.4782869, -0.6521012, 2.152199, 1, 1, 1, 1, 1,
0.4784715, -1.242001, 3.439965, 1, 1, 1, 1, 1,
0.4786541, -1.393642, 3.918942, 1, 1, 1, 1, 1,
0.4832429, -0.2247497, 1.665803, 1, 1, 1, 1, 1,
0.4844458, 1.162914, 0.9618645, 1, 1, 1, 1, 1,
0.4848921, -1.272902, 1.824352, 1, 1, 1, 1, 1,
0.4861584, 0.05310311, 1.941949, 1, 1, 1, 1, 1,
0.4874128, 0.1274005, 1.612947, 1, 1, 1, 1, 1,
0.4877312, 0.3902703, 1.633785, 1, 1, 1, 1, 1,
0.4914276, 1.230661, 1.673146, 1, 1, 1, 1, 1,
0.4923345, -0.1439179, 1.667943, 1, 1, 1, 1, 1,
0.4982705, -0.4016304, 1.689297, 1, 1, 1, 1, 1,
0.5011027, 0.3089702, 2.613111, 1, 1, 1, 1, 1,
0.5026431, -1.248096, 3.098129, 1, 1, 1, 1, 1,
0.5054993, 0.1697834, 2.833966, 0, 0, 1, 1, 1,
0.509647, 1.126184, 0.6754463, 1, 0, 0, 1, 1,
0.5109199, 0.4914062, 3.654113, 1, 0, 0, 1, 1,
0.5138407, -0.5603905, 3.363878, 1, 0, 0, 1, 1,
0.5157999, 0.3658871, 1.350113, 1, 0, 0, 1, 1,
0.5174831, 1.11661, 1.227057, 1, 0, 0, 1, 1,
0.5185381, -0.6217462, 2.816818, 0, 0, 0, 1, 1,
0.5204167, 0.02743394, 1.290646, 0, 0, 0, 1, 1,
0.5256379, 1.061614, -0.7597638, 0, 0, 0, 1, 1,
0.5268295, -0.8626023, 2.333814, 0, 0, 0, 1, 1,
0.5280448, 0.3950391, -1.164556, 0, 0, 0, 1, 1,
0.535588, -0.2149204, 2.666843, 0, 0, 0, 1, 1,
0.5396064, 0.1669066, 2.034935, 0, 0, 0, 1, 1,
0.5412927, -2.154449, 1.166896, 1, 1, 1, 1, 1,
0.5509782, -0.5880972, 1.509198, 1, 1, 1, 1, 1,
0.5520027, 0.3099792, 1.412705, 1, 1, 1, 1, 1,
0.553503, 0.5704551, -1.864957, 1, 1, 1, 1, 1,
0.5560634, -0.6959388, 1.693148, 1, 1, 1, 1, 1,
0.5606126, 0.6983644, 2.802813, 1, 1, 1, 1, 1,
0.5619089, 0.3957824, 1.728086, 1, 1, 1, 1, 1,
0.5639799, -0.3686556, 0.4395789, 1, 1, 1, 1, 1,
0.5698386, 0.1535097, 0.8744391, 1, 1, 1, 1, 1,
0.5702887, -0.2419108, 2.282583, 1, 1, 1, 1, 1,
0.5711488, -0.5079018, 2.367649, 1, 1, 1, 1, 1,
0.5743333, -1.193637, 3.694025, 1, 1, 1, 1, 1,
0.5778288, 0.04576421, 1.873917, 1, 1, 1, 1, 1,
0.5783198, -0.7520407, 1.602758, 1, 1, 1, 1, 1,
0.5783449, -0.460671, 2.688455, 1, 1, 1, 1, 1,
0.580689, 0.6692391, 3.671304, 0, 0, 1, 1, 1,
0.5848408, 0.7901241, 2.104844, 1, 0, 0, 1, 1,
0.5879562, -0.9248961, 1.986132, 1, 0, 0, 1, 1,
0.6007851, 0.8485802, -0.2296442, 1, 0, 0, 1, 1,
0.6029499, 1.837501, 0.7780758, 1, 0, 0, 1, 1,
0.6048551, -0.05729111, 2.660362, 1, 0, 0, 1, 1,
0.6058569, -1.404724, 2.618301, 0, 0, 0, 1, 1,
0.6063851, -1.1374, 3.331396, 0, 0, 0, 1, 1,
0.6069057, 0.6671365, -0.100274, 0, 0, 0, 1, 1,
0.6100162, -1.046838, 1.327798, 0, 0, 0, 1, 1,
0.6102605, 0.4030167, -0.3138783, 0, 0, 0, 1, 1,
0.6109294, 2.225989, 0.5621699, 0, 0, 0, 1, 1,
0.613063, 1.768993, 1.94948, 0, 0, 0, 1, 1,
0.6184502, 0.2320759, 0.1326987, 1, 1, 1, 1, 1,
0.6191439, -0.9304077, 2.23592, 1, 1, 1, 1, 1,
0.6192294, 0.4317137, 1.679509, 1, 1, 1, 1, 1,
0.6204022, 0.05234852, -0.1220559, 1, 1, 1, 1, 1,
0.623059, 0.7188047, 0.6505026, 1, 1, 1, 1, 1,
0.6252251, -1.368579, 2.825092, 1, 1, 1, 1, 1,
0.6308877, 1.227206, -0.03422179, 1, 1, 1, 1, 1,
0.6320052, 0.7125944, 1.204862, 1, 1, 1, 1, 1,
0.6350673, 0.3320619, 0.5375909, 1, 1, 1, 1, 1,
0.6376323, 1.879347, 1.061693, 1, 1, 1, 1, 1,
0.641673, 0.9031113, 1.514102, 1, 1, 1, 1, 1,
0.6446348, -0.7905255, 3.084545, 1, 1, 1, 1, 1,
0.6458082, -0.9451176, 3.71717, 1, 1, 1, 1, 1,
0.6493879, -0.9062285, 2.55779, 1, 1, 1, 1, 1,
0.653522, -0.3896943, 3.873853, 1, 1, 1, 1, 1,
0.6547472, 0.09478857, 2.305036, 0, 0, 1, 1, 1,
0.6556398, -0.7832853, 1.398048, 1, 0, 0, 1, 1,
0.6593433, 1.615841, -1.85244, 1, 0, 0, 1, 1,
0.6659448, 1.075839, 1.607958, 1, 0, 0, 1, 1,
0.6673659, -0.1849686, 1.209706, 1, 0, 0, 1, 1,
0.6696966, 0.9930831, 0.6419718, 1, 0, 0, 1, 1,
0.672674, -0.4469497, 4.835723, 0, 0, 0, 1, 1,
0.6741703, -0.4108844, 3.352268, 0, 0, 0, 1, 1,
0.6745217, 1.161465, 1.119902, 0, 0, 0, 1, 1,
0.6798415, -0.2386418, 1.90296, 0, 0, 0, 1, 1,
0.6812279, 0.6124527, 1.819823, 0, 0, 0, 1, 1,
0.6816218, 1.069252, 0.8004529, 0, 0, 0, 1, 1,
0.6819584, 1.198481, 1.203797, 0, 0, 0, 1, 1,
0.6837711, 1.035331, 1.310677, 1, 1, 1, 1, 1,
0.6969196, -0.4783155, 2.432009, 1, 1, 1, 1, 1,
0.6980525, -0.5546411, 3.004168, 1, 1, 1, 1, 1,
0.6996523, 0.3122377, 0.5078388, 1, 1, 1, 1, 1,
0.6998886, -0.861648, 0.9824169, 1, 1, 1, 1, 1,
0.7067285, -0.5507944, 3.324716, 1, 1, 1, 1, 1,
0.7122657, 0.1400643, 3.545799, 1, 1, 1, 1, 1,
0.713554, -1.158847, 2.150559, 1, 1, 1, 1, 1,
0.7149553, 0.02752473, -0.2037798, 1, 1, 1, 1, 1,
0.7155657, -0.4945882, 1.774209, 1, 1, 1, 1, 1,
0.7167341, -0.459464, 3.232077, 1, 1, 1, 1, 1,
0.7190002, 0.7999622, -1.374033, 1, 1, 1, 1, 1,
0.7192133, -0.04732599, 1.709756, 1, 1, 1, 1, 1,
0.72214, -0.01513819, 0.6466847, 1, 1, 1, 1, 1,
0.7223368, -0.1583018, 0.7486628, 1, 1, 1, 1, 1,
0.7224891, -0.7808273, 1.837932, 0, 0, 1, 1, 1,
0.723737, -0.6511347, 3.069667, 1, 0, 0, 1, 1,
0.7247318, -1.444465, 2.897502, 1, 0, 0, 1, 1,
0.7291243, -0.09101638, 0.3551317, 1, 0, 0, 1, 1,
0.7298582, 0.1659863, -0.4542922, 1, 0, 0, 1, 1,
0.7316371, -1.131008, 1.592658, 1, 0, 0, 1, 1,
0.7341327, -0.3849516, 3.683784, 0, 0, 0, 1, 1,
0.7372304, 0.105679, 1.665669, 0, 0, 0, 1, 1,
0.7390371, 0.6618929, 1.730251, 0, 0, 0, 1, 1,
0.7392525, 0.4352553, 1.959772, 0, 0, 0, 1, 1,
0.74506, 1.768319, 1.433617, 0, 0, 0, 1, 1,
0.752352, -1.017848, 4.067585, 0, 0, 0, 1, 1,
0.7549612, -0.02993254, 1.427124, 0, 0, 0, 1, 1,
0.7553481, -0.9210083, 2.630435, 1, 1, 1, 1, 1,
0.7555678, 0.9634214, 0.9536362, 1, 1, 1, 1, 1,
0.75563, -1.108456, 3.195265, 1, 1, 1, 1, 1,
0.7568144, 1.504456, -0.2159196, 1, 1, 1, 1, 1,
0.7576417, -1.396953, 2.350996, 1, 1, 1, 1, 1,
0.7605888, -0.165647, 0.9598253, 1, 1, 1, 1, 1,
0.7606144, -0.854106, 2.115615, 1, 1, 1, 1, 1,
0.7684811, -0.7230362, 2.22037, 1, 1, 1, 1, 1,
0.778077, -0.7541983, 2.415921, 1, 1, 1, 1, 1,
0.781292, -0.02647287, 2.017482, 1, 1, 1, 1, 1,
0.7840214, 0.4230191, 2.002534, 1, 1, 1, 1, 1,
0.7854567, -1.802208, 3.634969, 1, 1, 1, 1, 1,
0.786827, 1.095658, 0.6094388, 1, 1, 1, 1, 1,
0.7881961, 1.233721, 0.6574753, 1, 1, 1, 1, 1,
0.7897841, -0.008894764, 1.248336, 1, 1, 1, 1, 1,
0.795197, 1.147363, 1.522749, 0, 0, 1, 1, 1,
0.7979829, -1.707786, 1.335902, 1, 0, 0, 1, 1,
0.7982136, 1.627446, -0.4943107, 1, 0, 0, 1, 1,
0.7988696, -1.155701, 1.98377, 1, 0, 0, 1, 1,
0.800207, -0.3423022, 1.502472, 1, 0, 0, 1, 1,
0.800351, -0.06946438, 1.098167, 1, 0, 0, 1, 1,
0.800455, -0.7714596, 3.3646, 0, 0, 0, 1, 1,
0.8004815, -0.6754792, 2.265305, 0, 0, 0, 1, 1,
0.8006192, -0.03761413, 0.9256631, 0, 0, 0, 1, 1,
0.8057913, -0.09423956, 2.702827, 0, 0, 0, 1, 1,
0.806501, 1.739208, 0.6137106, 0, 0, 0, 1, 1,
0.8070543, -1.880652, 2.229715, 0, 0, 0, 1, 1,
0.8143526, 1.225119, 1.111291, 0, 0, 0, 1, 1,
0.8151773, -1.613124, 2.544662, 1, 1, 1, 1, 1,
0.8221208, 0.9237438, -0.09820423, 1, 1, 1, 1, 1,
0.823244, -1.413339, 1.725898, 1, 1, 1, 1, 1,
0.8256151, -0.09463632, 0.3615259, 1, 1, 1, 1, 1,
0.8282894, -0.3242551, 2.726436, 1, 1, 1, 1, 1,
0.833133, 0.1213757, 1.811558, 1, 1, 1, 1, 1,
0.8373408, 0.04588294, 2.223855, 1, 1, 1, 1, 1,
0.8387636, 0.2001054, 3.163949, 1, 1, 1, 1, 1,
0.8402562, -0.2315473, 2.839081, 1, 1, 1, 1, 1,
0.843281, -0.06000235, 2.086899, 1, 1, 1, 1, 1,
0.844779, 0.354016, 1.724854, 1, 1, 1, 1, 1,
0.8535789, 1.010423, -0.7139533, 1, 1, 1, 1, 1,
0.8538966, 0.1466151, 1.250326, 1, 1, 1, 1, 1,
0.8598247, 0.5144298, 0.06730533, 1, 1, 1, 1, 1,
0.862816, 1.964626, -1.047897, 1, 1, 1, 1, 1,
0.8681488, -0.2702256, 0.7865104, 0, 0, 1, 1, 1,
0.8706712, 0.6992647, 1.411448, 1, 0, 0, 1, 1,
0.8728558, -0.02001267, 0.4395631, 1, 0, 0, 1, 1,
0.8744791, 0.4722159, 0.8569021, 1, 0, 0, 1, 1,
0.8754307, 0.5435541, 0.7927687, 1, 0, 0, 1, 1,
0.876209, -0.614711, 0.67788, 1, 0, 0, 1, 1,
0.8767008, -1.206861, 2.581352, 0, 0, 0, 1, 1,
0.8774803, 0.2599342, 1.529788, 0, 0, 0, 1, 1,
0.8869476, -1.443365, 4.141797, 0, 0, 0, 1, 1,
0.8880267, -0.00622396, 0.4492674, 0, 0, 0, 1, 1,
0.8902864, -0.09826646, 3.96774, 0, 0, 0, 1, 1,
0.8925244, -0.1447067, 3.117188, 0, 0, 0, 1, 1,
0.8952045, 1.452733, 0.5921792, 0, 0, 0, 1, 1,
0.9030756, -0.2902971, 0.616074, 1, 1, 1, 1, 1,
0.9067117, 0.3877059, 0.61962, 1, 1, 1, 1, 1,
0.9104462, 0.4742325, 0.3333611, 1, 1, 1, 1, 1,
0.9117252, 0.5080311, 1.785221, 1, 1, 1, 1, 1,
0.9162465, -0.1670021, 2.008777, 1, 1, 1, 1, 1,
0.9319792, 0.6088825, 3.022424, 1, 1, 1, 1, 1,
0.9356489, -0.9059658, 2.297318, 1, 1, 1, 1, 1,
0.9374178, 1.738906, 2.650946, 1, 1, 1, 1, 1,
0.9434701, -0.07176124, 0.8366978, 1, 1, 1, 1, 1,
0.944675, -1.041184, 1.193092, 1, 1, 1, 1, 1,
0.9457825, -0.03772002, 3.384773, 1, 1, 1, 1, 1,
0.9586464, 0.3713009, 2.025212, 1, 1, 1, 1, 1,
0.9628586, -0.6360958, 3.633003, 1, 1, 1, 1, 1,
0.9663579, -0.9690127, 1.325715, 1, 1, 1, 1, 1,
0.9663757, -0.05889574, 3.834442, 1, 1, 1, 1, 1,
0.9729556, 1.149283, 0.267705, 0, 0, 1, 1, 1,
0.9793921, -0.8497694, 2.340884, 1, 0, 0, 1, 1,
0.9843268, -1.466465, 3.496068, 1, 0, 0, 1, 1,
0.9857088, -0.1356008, 0.8621703, 1, 0, 0, 1, 1,
0.9904194, -0.313082, 1.918051, 1, 0, 0, 1, 1,
0.9943979, -0.7472962, 2.641975, 1, 0, 0, 1, 1,
0.9959576, 0.3765517, -0.4711215, 0, 0, 0, 1, 1,
0.9999378, -0.1983971, 1.657954, 0, 0, 0, 1, 1,
1.003089, 0.9121904, -0.01248879, 0, 0, 0, 1, 1,
1.006272, -1.192727, 1.632809, 0, 0, 0, 1, 1,
1.020921, -0.9331564, 2.277585, 0, 0, 0, 1, 1,
1.021177, -0.4927966, 2.633, 0, 0, 0, 1, 1,
1.023616, 1.061702, 0.4540597, 0, 0, 0, 1, 1,
1.032305, 0.4435083, 1.458471, 1, 1, 1, 1, 1,
1.034378, 0.01326324, 0.9903224, 1, 1, 1, 1, 1,
1.037146, 1.61398, -0.1634506, 1, 1, 1, 1, 1,
1.039442, 0.01269327, 1.322185, 1, 1, 1, 1, 1,
1.056113, -0.6617203, 3.587883, 1, 1, 1, 1, 1,
1.06069, 0.3104877, 1.648355, 1, 1, 1, 1, 1,
1.061988, -1.09919, 4.885511, 1, 1, 1, 1, 1,
1.062097, 0.1699547, 1.548247, 1, 1, 1, 1, 1,
1.067196, 0.5568212, 0.7266859, 1, 1, 1, 1, 1,
1.071645, -0.2640258, 1.500623, 1, 1, 1, 1, 1,
1.078919, -1.08173, 2.349428, 1, 1, 1, 1, 1,
1.081847, 0.904655, 0.596275, 1, 1, 1, 1, 1,
1.083221, -0.9484434, 3.920659, 1, 1, 1, 1, 1,
1.083654, 2.559252, 0.6653376, 1, 1, 1, 1, 1,
1.08536, -2.870125, 3.060304, 1, 1, 1, 1, 1,
1.092008, -0.2040256, 0.8854809, 0, 0, 1, 1, 1,
1.096283, 0.1250004, 1.848188, 1, 0, 0, 1, 1,
1.097699, 0.653531, -0.0228249, 1, 0, 0, 1, 1,
1.100166, 0.3121603, 1.740219, 1, 0, 0, 1, 1,
1.118412, -0.3084123, 0.5690394, 1, 0, 0, 1, 1,
1.12944, 2.613141, -0.6113006, 1, 0, 0, 1, 1,
1.136434, 1.717452, 1.449387, 0, 0, 0, 1, 1,
1.14051, 1.274733, -1.166194, 0, 0, 0, 1, 1,
1.147427, -2.68137, 3.391168, 0, 0, 0, 1, 1,
1.153275, -0.338494, 2.371632, 0, 0, 0, 1, 1,
1.162729, 0.5017378, 1.813219, 0, 0, 0, 1, 1,
1.163615, -0.3572096, 3.71826, 0, 0, 0, 1, 1,
1.164932, 0.5732582, 0.6606846, 0, 0, 0, 1, 1,
1.165221, -0.0651267, 1.371685, 1, 1, 1, 1, 1,
1.174101, -0.1744792, 2.069291, 1, 1, 1, 1, 1,
1.180843, 0.6456265, 0.03492716, 1, 1, 1, 1, 1,
1.186171, -3.138372, 2.39376, 1, 1, 1, 1, 1,
1.187289, 0.2759602, 1.523257, 1, 1, 1, 1, 1,
1.187493, 0.2022747, 0.4696363, 1, 1, 1, 1, 1,
1.196793, 1.091631, 1.394194, 1, 1, 1, 1, 1,
1.201322, 0.3289198, 1.273827, 1, 1, 1, 1, 1,
1.20283, -0.4343417, 1.729405, 1, 1, 1, 1, 1,
1.207458, 0.7701225, 2.022012, 1, 1, 1, 1, 1,
1.211826, 0.7979078, 1.983845, 1, 1, 1, 1, 1,
1.216066, -0.8697812, 2.001656, 1, 1, 1, 1, 1,
1.220189, 0.3106571, 0.9491957, 1, 1, 1, 1, 1,
1.231742, -0.4447565, 1.85272, 1, 1, 1, 1, 1,
1.233984, -2.845671, 3.923077, 1, 1, 1, 1, 1,
1.235034, 0.6059351, 1.67916, 0, 0, 1, 1, 1,
1.235996, -0.1255864, 1.443322, 1, 0, 0, 1, 1,
1.239248, 1.298611, 0.08314396, 1, 0, 0, 1, 1,
1.25219, -0.6944742, 3.249246, 1, 0, 0, 1, 1,
1.259197, 2.38203, 2.16539, 1, 0, 0, 1, 1,
1.266126, 2.433037, -0.2587733, 1, 0, 0, 1, 1,
1.279923, 1.26463, 0.5815158, 0, 0, 0, 1, 1,
1.289351, -1.151959, 2.792648, 0, 0, 0, 1, 1,
1.289967, -0.01514937, 1.883293, 0, 0, 0, 1, 1,
1.297234, -0.703966, 2.645205, 0, 0, 0, 1, 1,
1.30691, -0.3524809, 2.54223, 0, 0, 0, 1, 1,
1.315149, 0.8373914, 0.3866791, 0, 0, 0, 1, 1,
1.331685, -1.058161, 2.127626, 0, 0, 0, 1, 1,
1.341864, -1.382069, 3.795816, 1, 1, 1, 1, 1,
1.342919, -0.2063386, 1.806226, 1, 1, 1, 1, 1,
1.343215, -0.20556, 0.805117, 1, 1, 1, 1, 1,
1.347753, 0.189688, 2.851129, 1, 1, 1, 1, 1,
1.36008, 1.475019, -0.3461132, 1, 1, 1, 1, 1,
1.366282, -2.545018, 1.431452, 1, 1, 1, 1, 1,
1.371271, 0.9096439, 1.677713, 1, 1, 1, 1, 1,
1.383448, -0.4728386, 1.290526, 1, 1, 1, 1, 1,
1.394283, -1.127656, 3.214027, 1, 1, 1, 1, 1,
1.403199, -0.2599019, 0.7060528, 1, 1, 1, 1, 1,
1.411782, -0.4488864, 1.738461, 1, 1, 1, 1, 1,
1.416084, -0.2817609, 2.461223, 1, 1, 1, 1, 1,
1.417642, 0.2130909, 1.53211, 1, 1, 1, 1, 1,
1.418816, 0.8485984, 0.6925123, 1, 1, 1, 1, 1,
1.419656, 1.691862, -0.4831686, 1, 1, 1, 1, 1,
1.419929, 0.2073385, 1.829322, 0, 0, 1, 1, 1,
1.431918, 0.7219448, 1.573296, 1, 0, 0, 1, 1,
1.440369, -0.8470116, 0.7422593, 1, 0, 0, 1, 1,
1.449911, 0.3273054, 2.423533, 1, 0, 0, 1, 1,
1.450466, 1.770015, 0.5970711, 1, 0, 0, 1, 1,
1.453999, 1.007539, 1.744609, 1, 0, 0, 1, 1,
1.462486, -1.136594, 1.302845, 0, 0, 0, 1, 1,
1.466709, 1.571434, -0.0759415, 0, 0, 0, 1, 1,
1.471058, -0.3113951, 2.19561, 0, 0, 0, 1, 1,
1.472696, -0.9194914, 4.128233, 0, 0, 0, 1, 1,
1.473818, -0.6914258, 2.344352, 0, 0, 0, 1, 1,
1.47416, -0.1049819, 0.4147221, 0, 0, 0, 1, 1,
1.491804, -1.123572, 3.784556, 0, 0, 0, 1, 1,
1.492396, -0.5082163, 2.482363, 1, 1, 1, 1, 1,
1.500326, -0.1979356, 1.958601, 1, 1, 1, 1, 1,
1.506915, 0.5874281, 2.105581, 1, 1, 1, 1, 1,
1.511887, -0.6429831, 1.257647, 1, 1, 1, 1, 1,
1.512754, 1.679928, 0.1947613, 1, 1, 1, 1, 1,
1.519555, 2.455688, -1.161685, 1, 1, 1, 1, 1,
1.524629, 1.522798, 0.5174401, 1, 1, 1, 1, 1,
1.526226, -0.3515383, 1.166016, 1, 1, 1, 1, 1,
1.532493, -0.5010331, 1.459811, 1, 1, 1, 1, 1,
1.535074, 0.8915253, -0.4965099, 1, 1, 1, 1, 1,
1.544196, -0.848869, 0.7269666, 1, 1, 1, 1, 1,
1.552113, -0.8924353, 1.31153, 1, 1, 1, 1, 1,
1.553648, 0.4172643, -0.3403969, 1, 1, 1, 1, 1,
1.55738, 1.04048, 1.415879, 1, 1, 1, 1, 1,
1.599306, 1.589063, 1.514578, 1, 1, 1, 1, 1,
1.623367, 0.3072311, 2.604122, 0, 0, 1, 1, 1,
1.65965, -0.05901176, 2.95517, 1, 0, 0, 1, 1,
1.68964, 1.4, 2.222482, 1, 0, 0, 1, 1,
1.694227, 0.6277645, 1.629573, 1, 0, 0, 1, 1,
1.712391, 0.408116, 1.322109, 1, 0, 0, 1, 1,
1.722933, -0.4190044, 3.253178, 1, 0, 0, 1, 1,
1.757239, 1.983552, 0.3173606, 0, 0, 0, 1, 1,
1.762373, 0.3650175, 0.7930145, 0, 0, 0, 1, 1,
1.772415, -0.3261128, 3.039739, 0, 0, 0, 1, 1,
1.806507, -1.173845, 2.50389, 0, 0, 0, 1, 1,
1.815493, -0.5602911, 0.9512783, 0, 0, 0, 1, 1,
1.831052, -2.525614, 2.883336, 0, 0, 0, 1, 1,
1.834296, 0.2873144, 0.6410114, 0, 0, 0, 1, 1,
1.842219, 1.922199, 1.46894, 1, 1, 1, 1, 1,
1.849674, 1.377787, 2.741578, 1, 1, 1, 1, 1,
1.869091, 0.9954764, 1.187651, 1, 1, 1, 1, 1,
1.875284, -1.48403, 2.665649, 1, 1, 1, 1, 1,
1.901183, 0.3517895, 0.2200326, 1, 1, 1, 1, 1,
1.924072, 1.069458, 0.8945018, 1, 1, 1, 1, 1,
1.927043, 0.7094805, 1.606888, 1, 1, 1, 1, 1,
1.935276, 1.613978, -0.6326575, 1, 1, 1, 1, 1,
1.944709, -1.327682, 2.346994, 1, 1, 1, 1, 1,
1.948578, -1.738523, 2.244364, 1, 1, 1, 1, 1,
1.968141, 0.4015427, -1.089063, 1, 1, 1, 1, 1,
1.981517, 0.0511247, 1.211448, 1, 1, 1, 1, 1,
1.985148, 1.148258, 1.803002, 1, 1, 1, 1, 1,
1.988121, -0.1585996, 2.48411, 1, 1, 1, 1, 1,
2.000901, -0.8739604, 2.447377, 1, 1, 1, 1, 1,
2.008058, 0.3156053, 2.358464, 0, 0, 1, 1, 1,
2.033932, 0.1325441, 1.392652, 1, 0, 0, 1, 1,
2.040073, -0.3386419, 1.006472, 1, 0, 0, 1, 1,
2.11987, -1.644806, 2.154375, 1, 0, 0, 1, 1,
2.128254, -1.078195, 3.507388, 1, 0, 0, 1, 1,
2.163097, 0.3819115, 2.508469, 1, 0, 0, 1, 1,
2.185303, -0.5010447, 2.610395, 0, 0, 0, 1, 1,
2.242499, 0.4977362, 2.77421, 0, 0, 0, 1, 1,
2.242825, 0.8540975, -0.2898137, 0, 0, 0, 1, 1,
2.291558, -1.723279, 0.9461047, 0, 0, 0, 1, 1,
2.297601, 0.6416126, 1.571445, 0, 0, 0, 1, 1,
2.324341, -0.9373304, 2.291935, 0, 0, 0, 1, 1,
2.357061, 0.8149363, 2.903811, 0, 0, 0, 1, 1,
2.374369, -0.3470043, 3.202078, 1, 1, 1, 1, 1,
2.386803, 0.7109817, 2.020519, 1, 1, 1, 1, 1,
2.551831, 0.2543588, 2.35171, 1, 1, 1, 1, 1,
2.619343, 1.163108, 1.456391, 1, 1, 1, 1, 1,
2.695063, -0.4151611, 2.686579, 1, 1, 1, 1, 1,
3.418525, -0.7041509, 1.293855, 1, 1, 1, 1, 1,
3.494315, -0.5658163, 2.252478, 1, 1, 1, 1, 1
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
var radius = 9.652281;
var distance = 33.90322;
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
mvMatrix.translate( -0.1210179, 0.1363574, 0.5611782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90322);
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
