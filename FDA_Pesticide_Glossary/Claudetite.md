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
-3.321363, 0.6123891, -1.466482, 1, 0, 0, 1,
-3.307456, -0.1951607, -0.5455505, 1, 0.007843138, 0, 1,
-2.977428, 1.863059, -2.137925, 1, 0.01176471, 0, 1,
-2.833369, -0.4307283, -1.617223, 1, 0.01960784, 0, 1,
-2.788587, -1.414964, -2.485953, 1, 0.02352941, 0, 1,
-2.778854, 1.101436, -1.015727, 1, 0.03137255, 0, 1,
-2.759367, 0.8672306, -2.228945, 1, 0.03529412, 0, 1,
-2.645184, -0.06321853, -2.101954, 1, 0.04313726, 0, 1,
-2.599753, -0.0689189, -1.411256, 1, 0.04705882, 0, 1,
-2.533169, 0.3288634, -1.461655, 1, 0.05490196, 0, 1,
-2.420927, -0.2190669, -2.02933, 1, 0.05882353, 0, 1,
-2.371434, -1.40747, -2.756523, 1, 0.06666667, 0, 1,
-2.359286, 0.08424179, -1.546839, 1, 0.07058824, 0, 1,
-2.32026, 1.85355, -1.456225, 1, 0.07843138, 0, 1,
-2.30449, -0.002890381, -1.023075, 1, 0.08235294, 0, 1,
-2.280685, 0.7668804, -2.010184, 1, 0.09019608, 0, 1,
-2.252757, 0.01089988, 0.1944535, 1, 0.09411765, 0, 1,
-2.175157, -0.01739202, -0.6362172, 1, 0.1019608, 0, 1,
-2.147619, -0.6258137, 0.4620689, 1, 0.1098039, 0, 1,
-2.129298, -0.5136702, -1.015939, 1, 0.1137255, 0, 1,
-2.103383, 1.295077, -1.182008, 1, 0.1215686, 0, 1,
-2.098881, -0.2197265, -1.645457, 1, 0.1254902, 0, 1,
-2.098224, -1.200462, -0.7953053, 1, 0.1333333, 0, 1,
-2.079722, 1.490464, -3.085802, 1, 0.1372549, 0, 1,
-2.051227, -0.317552, -2.652638, 1, 0.145098, 0, 1,
-2.046616, 1.897134, -0.9779626, 1, 0.1490196, 0, 1,
-2.04474, 0.5084209, -2.049694, 1, 0.1568628, 0, 1,
-2.018322, -0.1175444, -1.753188, 1, 0.1607843, 0, 1,
-2.007694, 1.261178, -0.6702955, 1, 0.1686275, 0, 1,
-1.998374, 0.01796364, -1.370228, 1, 0.172549, 0, 1,
-1.971321, -0.5160062, -3.216784, 1, 0.1803922, 0, 1,
-1.94565, -0.07321686, -0.5620114, 1, 0.1843137, 0, 1,
-1.935141, -0.9706743, -1.666519, 1, 0.1921569, 0, 1,
-1.932679, -0.02791653, -1.593099, 1, 0.1960784, 0, 1,
-1.912511, 0.7328399, -1.759751, 1, 0.2039216, 0, 1,
-1.893237, -0.01593732, -1.925046, 1, 0.2117647, 0, 1,
-1.892448, -0.2072993, 0.1071878, 1, 0.2156863, 0, 1,
-1.872608, 0.5595612, -2.036323, 1, 0.2235294, 0, 1,
-1.870188, -0.5414687, -4.155087, 1, 0.227451, 0, 1,
-1.863054, -1.958387, -2.492386, 1, 0.2352941, 0, 1,
-1.86082, 0.9932044, 1.033179, 1, 0.2392157, 0, 1,
-1.859354, -0.9812542, -0.5245988, 1, 0.2470588, 0, 1,
-1.851573, 1.321468, -0.2297287, 1, 0.2509804, 0, 1,
-1.84262, 0.5864531, 0.06709789, 1, 0.2588235, 0, 1,
-1.83289, -0.8872074, -0.4985574, 1, 0.2627451, 0, 1,
-1.811482, 1.158639, -0.9152421, 1, 0.2705882, 0, 1,
-1.810222, -0.36377, -2.274491, 1, 0.2745098, 0, 1,
-1.807218, -0.1407052, -3.255849, 1, 0.282353, 0, 1,
-1.806295, 0.4898346, -1.269355, 1, 0.2862745, 0, 1,
-1.805007, -0.07635669, -1.091134, 1, 0.2941177, 0, 1,
-1.801989, 0.4031938, -0.8036382, 1, 0.3019608, 0, 1,
-1.799593, -0.1406959, -1.898118, 1, 0.3058824, 0, 1,
-1.77948, 0.04855793, -2.48198, 1, 0.3137255, 0, 1,
-1.778483, -0.6821259, -0.5269422, 1, 0.3176471, 0, 1,
-1.75266, 1.07494, -1.132338, 1, 0.3254902, 0, 1,
-1.748834, 1.722999, -2.123271, 1, 0.3294118, 0, 1,
-1.726741, 0.7912814, -1.941107, 1, 0.3372549, 0, 1,
-1.70153, -0.2536586, -1.844654, 1, 0.3411765, 0, 1,
-1.695092, 0.3193662, -1.752233, 1, 0.3490196, 0, 1,
-1.681339, -1.692017, -2.39039, 1, 0.3529412, 0, 1,
-1.677115, 0.1108126, -2.993941, 1, 0.3607843, 0, 1,
-1.658091, 0.1014093, 0.2416046, 1, 0.3647059, 0, 1,
-1.650557, 0.1613553, -0.7622393, 1, 0.372549, 0, 1,
-1.639218, -0.8999716, -1.009527, 1, 0.3764706, 0, 1,
-1.618489, 0.7626691, -1.186897, 1, 0.3843137, 0, 1,
-1.617982, 0.1662197, -2.165921, 1, 0.3882353, 0, 1,
-1.616023, -0.9050855, -1.043344, 1, 0.3960784, 0, 1,
-1.611744, -0.02553084, -0.4097419, 1, 0.4039216, 0, 1,
-1.608353, -0.2500918, -2.300172, 1, 0.4078431, 0, 1,
-1.602311, -0.122069, -1.598163, 1, 0.4156863, 0, 1,
-1.601082, 1.507095, -1.88264, 1, 0.4196078, 0, 1,
-1.589932, 1.349684, 1.158698, 1, 0.427451, 0, 1,
-1.586605, 0.4074025, -1.396179, 1, 0.4313726, 0, 1,
-1.577373, -1.371717, -1.756335, 1, 0.4392157, 0, 1,
-1.563084, 0.6378061, 0.1309533, 1, 0.4431373, 0, 1,
-1.560859, 0.8580856, -2.46429, 1, 0.4509804, 0, 1,
-1.560768, 1.722445, -0.7503117, 1, 0.454902, 0, 1,
-1.555611, -0.1560912, -1.128944, 1, 0.4627451, 0, 1,
-1.548898, 0.2598769, -1.271265, 1, 0.4666667, 0, 1,
-1.548508, -0.8445383, -3.10513, 1, 0.4745098, 0, 1,
-1.547379, -0.2566047, -1.929395, 1, 0.4784314, 0, 1,
-1.546968, 0.4840056, -1.859556, 1, 0.4862745, 0, 1,
-1.530837, -0.2881932, -0.05359191, 1, 0.4901961, 0, 1,
-1.517001, 0.09414384, -2.808751, 1, 0.4980392, 0, 1,
-1.513739, -0.2237677, -1.263038, 1, 0.5058824, 0, 1,
-1.499958, 0.6964269, -0.2093682, 1, 0.509804, 0, 1,
-1.497246, -0.2029632, -1.718604, 1, 0.5176471, 0, 1,
-1.496686, -0.1319038, -2.834847, 1, 0.5215687, 0, 1,
-1.49339, 0.2414502, -0.3894117, 1, 0.5294118, 0, 1,
-1.479115, -0.6293436, -0.4205327, 1, 0.5333334, 0, 1,
-1.4714, 0.241261, -0.3081995, 1, 0.5411765, 0, 1,
-1.469948, -0.1663449, -1.992841, 1, 0.5450981, 0, 1,
-1.463281, 1.020958, -0.1898505, 1, 0.5529412, 0, 1,
-1.458319, -0.2199188, -0.5032553, 1, 0.5568628, 0, 1,
-1.447292, 0.04177377, -1.585727, 1, 0.5647059, 0, 1,
-1.43654, -0.8201885, -0.7912126, 1, 0.5686275, 0, 1,
-1.435919, 0.183797, -3.264015, 1, 0.5764706, 0, 1,
-1.42864, 0.4953762, -0.7959664, 1, 0.5803922, 0, 1,
-1.426001, 0.1762466, -1.073606, 1, 0.5882353, 0, 1,
-1.423429, -0.4877078, -2.431278, 1, 0.5921569, 0, 1,
-1.421346, -0.02680288, -1.810154, 1, 0.6, 0, 1,
-1.418038, 0.9259824, 0.3558809, 1, 0.6078432, 0, 1,
-1.417778, -0.3121628, -1.78243, 1, 0.6117647, 0, 1,
-1.415321, 0.4369209, -0.7053607, 1, 0.6196079, 0, 1,
-1.398802, -1.643364, -2.491437, 1, 0.6235294, 0, 1,
-1.388873, -0.1394806, -1.432817, 1, 0.6313726, 0, 1,
-1.384879, 0.2247502, 0.215089, 1, 0.6352941, 0, 1,
-1.380248, -1.2341, -1.500525, 1, 0.6431373, 0, 1,
-1.380207, 2.895186, 0.09373749, 1, 0.6470588, 0, 1,
-1.367855, -0.6888289, -2.004923, 1, 0.654902, 0, 1,
-1.365558, -0.7031559, -0.6843635, 1, 0.6588235, 0, 1,
-1.364789, -0.5826026, -0.9160005, 1, 0.6666667, 0, 1,
-1.351741, 0.1255155, -0.190363, 1, 0.6705883, 0, 1,
-1.331389, 0.9694971, -3.982247, 1, 0.6784314, 0, 1,
-1.324266, 1.500497, 0.7514908, 1, 0.682353, 0, 1,
-1.323945, -0.9686518, -3.98701, 1, 0.6901961, 0, 1,
-1.322048, -0.2853639, -1.935035, 1, 0.6941177, 0, 1,
-1.320471, -0.6818085, -0.9198102, 1, 0.7019608, 0, 1,
-1.310079, 0.4780355, -2.773477, 1, 0.7098039, 0, 1,
-1.304021, -0.1589618, -2.398927, 1, 0.7137255, 0, 1,
-1.301244, 0.9611651, -0.5968757, 1, 0.7215686, 0, 1,
-1.282393, 1.946726, 1.276465, 1, 0.7254902, 0, 1,
-1.282098, -0.2690159, -1.53098, 1, 0.7333333, 0, 1,
-1.281811, -0.5470002, -1.993285, 1, 0.7372549, 0, 1,
-1.279832, 0.2424927, -0.8458598, 1, 0.7450981, 0, 1,
-1.272771, -0.8438659, -2.784259, 1, 0.7490196, 0, 1,
-1.271727, 0.9370762, -0.7687737, 1, 0.7568628, 0, 1,
-1.268714, 0.3130184, -1.224661, 1, 0.7607843, 0, 1,
-1.263151, 0.8419066, -1.819557, 1, 0.7686275, 0, 1,
-1.262455, 0.3527122, -2.258505, 1, 0.772549, 0, 1,
-1.260503, 0.2072862, -1.407807, 1, 0.7803922, 0, 1,
-1.259118, 1.130278, -0.7842217, 1, 0.7843137, 0, 1,
-1.249827, 0.5760434, -1.480258, 1, 0.7921569, 0, 1,
-1.248276, 1.801521, -0.09542286, 1, 0.7960784, 0, 1,
-1.23242, 0.3882756, -1.545747, 1, 0.8039216, 0, 1,
-1.222935, 0.115823, -1.251516, 1, 0.8117647, 0, 1,
-1.212459, -1.032003, -3.076738, 1, 0.8156863, 0, 1,
-1.211876, 0.3291849, -1.152471, 1, 0.8235294, 0, 1,
-1.210003, -1.23703, -0.003009577, 1, 0.827451, 0, 1,
-1.202356, 0.474042, -0.6644056, 1, 0.8352941, 0, 1,
-1.19822, 0.2190899, 0.4428132, 1, 0.8392157, 0, 1,
-1.196935, 0.5616041, -0.179979, 1, 0.8470588, 0, 1,
-1.187517, 0.7886381, -1.165582, 1, 0.8509804, 0, 1,
-1.179795, -0.3736496, -2.023028, 1, 0.8588235, 0, 1,
-1.175395, 0.3566082, -1.514539, 1, 0.8627451, 0, 1,
-1.164727, -0.01323889, -0.6483846, 1, 0.8705882, 0, 1,
-1.160673, -0.9221205, -3.218558, 1, 0.8745098, 0, 1,
-1.15642, 1.540123, -2.984769, 1, 0.8823529, 0, 1,
-1.153276, 0.3058888, -1.234907, 1, 0.8862745, 0, 1,
-1.15283, 1.445898, -1.910237, 1, 0.8941177, 0, 1,
-1.144326, 0.4950399, -0.6765184, 1, 0.8980392, 0, 1,
-1.143598, 0.006383524, -1.403415, 1, 0.9058824, 0, 1,
-1.143116, -0.3575879, -1.866312, 1, 0.9137255, 0, 1,
-1.141613, -0.4630065, -3.296226, 1, 0.9176471, 0, 1,
-1.130439, 0.6784207, -0.6780723, 1, 0.9254902, 0, 1,
-1.124056, 0.3045768, -1.323554, 1, 0.9294118, 0, 1,
-1.122706, -0.3469368, -3.2632, 1, 0.9372549, 0, 1,
-1.121413, -0.7764416, -0.8599675, 1, 0.9411765, 0, 1,
-1.121379, -0.8621686, -0.3380809, 1, 0.9490196, 0, 1,
-1.119667, -0.6114128, -2.837818, 1, 0.9529412, 0, 1,
-1.11752, 1.437383, 0.6107554, 1, 0.9607843, 0, 1,
-1.113044, 0.1866368, -1.189218, 1, 0.9647059, 0, 1,
-1.110592, -0.1279707, -1.506176, 1, 0.972549, 0, 1,
-1.086507, 0.1217323, -0.04862543, 1, 0.9764706, 0, 1,
-1.084898, -0.1798441, -1.540317, 1, 0.9843137, 0, 1,
-1.081281, 0.9510313, -1.604712, 1, 0.9882353, 0, 1,
-1.077571, 0.8842115, -1.893077, 1, 0.9960784, 0, 1,
-1.074906, -2.215947, -4.553017, 0.9960784, 1, 0, 1,
-1.068562, -1.646397, -2.412218, 0.9921569, 1, 0, 1,
-1.065924, 1.552121, -0.9466403, 0.9843137, 1, 0, 1,
-1.065884, 0.6187211, -1.778451, 0.9803922, 1, 0, 1,
-1.052588, -0.03006939, -1.967978, 0.972549, 1, 0, 1,
-1.0509, -1.578725, -2.779827, 0.9686275, 1, 0, 1,
-1.049965, 0.3145882, 0.4275141, 0.9607843, 1, 0, 1,
-1.049493, -0.7591006, -0.7925386, 0.9568627, 1, 0, 1,
-1.044922, 0.3683301, -2.010105, 0.9490196, 1, 0, 1,
-1.038347, 0.04014983, -0.900323, 0.945098, 1, 0, 1,
-1.031083, -0.1379365, -2.139899, 0.9372549, 1, 0, 1,
-1.030409, -0.1810627, -3.050111, 0.9333333, 1, 0, 1,
-1.025261, 0.4771436, -0.1933307, 0.9254902, 1, 0, 1,
-1.023173, 2.423103, -0.2587793, 0.9215686, 1, 0, 1,
-1.015805, -0.4286101, -2.389308, 0.9137255, 1, 0, 1,
-1.015767, 0.7666801, -2.004687, 0.9098039, 1, 0, 1,
-1.003489, -0.4539532, -3.91376, 0.9019608, 1, 0, 1,
-0.9990334, -0.01791025, -1.754383, 0.8941177, 1, 0, 1,
-0.9919315, 0.4012315, -0.4982634, 0.8901961, 1, 0, 1,
-0.9919224, -0.5178999, -1.219549, 0.8823529, 1, 0, 1,
-0.982071, -0.01875126, 0.6344963, 0.8784314, 1, 0, 1,
-0.9736274, 0.08206014, -1.220052, 0.8705882, 1, 0, 1,
-0.9683838, 1.00072, 0.1057893, 0.8666667, 1, 0, 1,
-0.9676384, 0.9835279, -0.1194406, 0.8588235, 1, 0, 1,
-0.9620001, -0.8862805, -2.324739, 0.854902, 1, 0, 1,
-0.9545037, 0.726858, -0.09198323, 0.8470588, 1, 0, 1,
-0.9526416, -0.2098852, -3.100738, 0.8431373, 1, 0, 1,
-0.9405434, -1.160603, -3.318581, 0.8352941, 1, 0, 1,
-0.938233, -2.200886, -0.8552021, 0.8313726, 1, 0, 1,
-0.9377713, -0.7065456, -0.2085951, 0.8235294, 1, 0, 1,
-0.9313219, -0.3711808, -1.958198, 0.8196079, 1, 0, 1,
-0.9278638, 0.6795279, -1.036303, 0.8117647, 1, 0, 1,
-0.9266733, -0.3388858, -1.560449, 0.8078431, 1, 0, 1,
-0.9241571, -0.2153071, -0.4505227, 0.8, 1, 0, 1,
-0.9232553, -0.4110217, -3.635814, 0.7921569, 1, 0, 1,
-0.913255, -0.5703949, -1.635425, 0.7882353, 1, 0, 1,
-0.9130229, 0.9049991, -0.9155158, 0.7803922, 1, 0, 1,
-0.900785, 1.084159, -0.3517745, 0.7764706, 1, 0, 1,
-0.8994967, -0.4355417, -1.523636, 0.7686275, 1, 0, 1,
-0.8992485, -0.7704328, -1.40723, 0.7647059, 1, 0, 1,
-0.8979055, -0.5814112, -2.534441, 0.7568628, 1, 0, 1,
-0.8873649, 0.4636185, 0.0878155, 0.7529412, 1, 0, 1,
-0.8871831, 1.708942, -0.9701056, 0.7450981, 1, 0, 1,
-0.8819192, 0.4445603, -1.494527, 0.7411765, 1, 0, 1,
-0.8803629, -1.280499, -2.427232, 0.7333333, 1, 0, 1,
-0.8780777, -1.394383, -1.689105, 0.7294118, 1, 0, 1,
-0.8776937, -1.789587, -1.863286, 0.7215686, 1, 0, 1,
-0.8740703, 0.9468725, -0.3823784, 0.7176471, 1, 0, 1,
-0.8737615, 1.155006, -0.1833475, 0.7098039, 1, 0, 1,
-0.8722045, -0.4636914, -2.094213, 0.7058824, 1, 0, 1,
-0.8664868, 0.5270329, -0.941546, 0.6980392, 1, 0, 1,
-0.8581308, -1.266474, -3.143762, 0.6901961, 1, 0, 1,
-0.8575626, -2.003853, -2.456226, 0.6862745, 1, 0, 1,
-0.8536368, -0.7022116, -2.59637, 0.6784314, 1, 0, 1,
-0.849555, -0.1461028, -2.619912, 0.6745098, 1, 0, 1,
-0.8449626, -1.087198, -1.700732, 0.6666667, 1, 0, 1,
-0.8293577, -0.6017715, -3.209805, 0.6627451, 1, 0, 1,
-0.8280001, 0.9457725, 0.08363621, 0.654902, 1, 0, 1,
-0.8267497, -0.8971001, -2.253558, 0.6509804, 1, 0, 1,
-0.8244084, -0.9739466, -3.764866, 0.6431373, 1, 0, 1,
-0.820141, 0.422939, -3.008874, 0.6392157, 1, 0, 1,
-0.818283, -1.664568, -3.457865, 0.6313726, 1, 0, 1,
-0.8159841, -0.07481056, -1.975045, 0.627451, 1, 0, 1,
-0.8143684, -0.136325, -1.068163, 0.6196079, 1, 0, 1,
-0.8073888, 0.3287954, 0.4015195, 0.6156863, 1, 0, 1,
-0.8060547, -1.244806, -1.553205, 0.6078432, 1, 0, 1,
-0.8030524, 1.272224, -1.195491, 0.6039216, 1, 0, 1,
-0.800299, -0.3634643, -2.280225, 0.5960785, 1, 0, 1,
-0.7954669, 0.6614894, -0.8907266, 0.5882353, 1, 0, 1,
-0.7942557, 0.8511358, -0.9784123, 0.5843138, 1, 0, 1,
-0.7866498, 0.1433966, -1.589042, 0.5764706, 1, 0, 1,
-0.785066, 0.4924881, -0.2575061, 0.572549, 1, 0, 1,
-0.7801059, -0.9353023, -2.619578, 0.5647059, 1, 0, 1,
-0.7799557, -0.004095543, -3.223485, 0.5607843, 1, 0, 1,
-0.7787085, 1.665455, 0.9830958, 0.5529412, 1, 0, 1,
-0.7784993, -0.6982862, -2.020942, 0.5490196, 1, 0, 1,
-0.7780543, 0.9967142, -1.250822, 0.5411765, 1, 0, 1,
-0.7769189, -2.486084, -3.186847, 0.5372549, 1, 0, 1,
-0.7719898, -0.4495682, 0.3694707, 0.5294118, 1, 0, 1,
-0.7634769, 0.894217, -1.470538, 0.5254902, 1, 0, 1,
-0.7630723, 0.03221551, -1.510705, 0.5176471, 1, 0, 1,
-0.7567629, -0.6635853, -3.120269, 0.5137255, 1, 0, 1,
-0.7565076, -0.7256629, -3.930363, 0.5058824, 1, 0, 1,
-0.7517942, 1.749849, 1.395128, 0.5019608, 1, 0, 1,
-0.7482249, 0.7613825, -0.2048463, 0.4941176, 1, 0, 1,
-0.7474321, -1.431638, -0.7281321, 0.4862745, 1, 0, 1,
-0.7452592, 0.009884349, -1.671925, 0.4823529, 1, 0, 1,
-0.7332938, -0.3253386, -1.064861, 0.4745098, 1, 0, 1,
-0.728806, -0.3036678, -1.827741, 0.4705882, 1, 0, 1,
-0.7285556, 0.2232067, -0.949284, 0.4627451, 1, 0, 1,
-0.7262433, 0.947573, -1.39345, 0.4588235, 1, 0, 1,
-0.7244749, -0.03969672, -2.099078, 0.4509804, 1, 0, 1,
-0.7206051, -1.304372, -4.329619, 0.4470588, 1, 0, 1,
-0.7174071, -0.9359057, -2.698304, 0.4392157, 1, 0, 1,
-0.7155415, -0.1494981, -1.7351, 0.4352941, 1, 0, 1,
-0.7115923, -0.1018049, 0.7959707, 0.427451, 1, 0, 1,
-0.7085842, -0.8774195, -1.963131, 0.4235294, 1, 0, 1,
-0.7083852, 2.936206, -1.522338, 0.4156863, 1, 0, 1,
-0.7069176, -0.0399773, -0.9911248, 0.4117647, 1, 0, 1,
-0.7032785, -1.645145, -1.820655, 0.4039216, 1, 0, 1,
-0.6943734, 1.006565, 0.04563598, 0.3960784, 1, 0, 1,
-0.6927367, -0.6687171, -1.742894, 0.3921569, 1, 0, 1,
-0.6907847, 0.09044252, -1.564681, 0.3843137, 1, 0, 1,
-0.6742129, -1.232609, -2.386167, 0.3803922, 1, 0, 1,
-0.6735548, 1.492383, -0.7504248, 0.372549, 1, 0, 1,
-0.6704277, 0.4612868, -3.78618, 0.3686275, 1, 0, 1,
-0.6695149, -1.390101, -2.124782, 0.3607843, 1, 0, 1,
-0.6663575, 0.2503493, 0.1062423, 0.3568628, 1, 0, 1,
-0.6656785, 1.296103, -0.4392556, 0.3490196, 1, 0, 1,
-0.6654817, 0.6020296, -1.552369, 0.345098, 1, 0, 1,
-0.6624902, -0.6857921, -4.188107, 0.3372549, 1, 0, 1,
-0.659337, 0.5141127, 0.6624339, 0.3333333, 1, 0, 1,
-0.6586847, -2.069373, -3.405814, 0.3254902, 1, 0, 1,
-0.6568756, 0.03795327, -0.3245439, 0.3215686, 1, 0, 1,
-0.6568712, 0.09309628, -0.8262089, 0.3137255, 1, 0, 1,
-0.6476256, -0.2357931, -0.07191303, 0.3098039, 1, 0, 1,
-0.6474971, -0.9162655, -3.60027, 0.3019608, 1, 0, 1,
-0.642003, 0.7550607, -1.650463, 0.2941177, 1, 0, 1,
-0.6417888, -0.6630708, -3.394462, 0.2901961, 1, 0, 1,
-0.6383032, -0.8439678, -2.35634, 0.282353, 1, 0, 1,
-0.6380916, 0.7874136, -2.05351, 0.2784314, 1, 0, 1,
-0.6374413, 0.7967334, -1.141298, 0.2705882, 1, 0, 1,
-0.6366516, 0.3049169, -0.3523458, 0.2666667, 1, 0, 1,
-0.6331216, -1.735265, -3.949172, 0.2588235, 1, 0, 1,
-0.632695, 0.3954761, -0.407916, 0.254902, 1, 0, 1,
-0.6291677, -0.611288, -1.544939, 0.2470588, 1, 0, 1,
-0.6281641, 1.138374, -1.027636, 0.2431373, 1, 0, 1,
-0.6264828, 0.5958479, 0.03365175, 0.2352941, 1, 0, 1,
-0.6244943, -0.8315327, -1.748234, 0.2313726, 1, 0, 1,
-0.6234035, 0.3154208, -1.203648, 0.2235294, 1, 0, 1,
-0.6140205, -0.03396903, -0.8119282, 0.2196078, 1, 0, 1,
-0.6137672, 0.79055, -1.108555, 0.2117647, 1, 0, 1,
-0.6137502, -0.6267241, -2.556841, 0.2078431, 1, 0, 1,
-0.6116824, -0.311639, -4.177453, 0.2, 1, 0, 1,
-0.5998847, 0.6095158, -0.6278935, 0.1921569, 1, 0, 1,
-0.5977365, -0.2719719, -2.743051, 0.1882353, 1, 0, 1,
-0.5966541, 0.1259015, -1.13138, 0.1803922, 1, 0, 1,
-0.5884637, 0.9928598, -1.841286, 0.1764706, 1, 0, 1,
-0.5880274, 0.8280616, -0.02383977, 0.1686275, 1, 0, 1,
-0.5879652, -0.0998093, -0.8828191, 0.1647059, 1, 0, 1,
-0.578729, 0.02562417, -1.688123, 0.1568628, 1, 0, 1,
-0.5785949, -0.5050035, -2.408993, 0.1529412, 1, 0, 1,
-0.5781241, 0.8854573, 0.1058316, 0.145098, 1, 0, 1,
-0.5778663, 2.160826, 0.6235574, 0.1411765, 1, 0, 1,
-0.5752069, 0.6298059, -0.4830387, 0.1333333, 1, 0, 1,
-0.5738623, 0.4316941, -1.160554, 0.1294118, 1, 0, 1,
-0.5713142, -0.3764717, -2.25927, 0.1215686, 1, 0, 1,
-0.5708178, -0.981205, -2.347783, 0.1176471, 1, 0, 1,
-0.5648984, -1.342338, -2.053533, 0.1098039, 1, 0, 1,
-0.5639923, 0.5403812, -1.357095, 0.1058824, 1, 0, 1,
-0.5638095, 0.8436147, -2.449422, 0.09803922, 1, 0, 1,
-0.5569164, 1.635908, 0.2625884, 0.09019608, 1, 0, 1,
-0.5531623, -0.4311491, -2.126595, 0.08627451, 1, 0, 1,
-0.5494199, 0.2377762, -1.02196, 0.07843138, 1, 0, 1,
-0.5448045, -0.2742193, -0.7125151, 0.07450981, 1, 0, 1,
-0.5441321, 0.3270984, -0.2777344, 0.06666667, 1, 0, 1,
-0.5435429, 1.854504, -0.305151, 0.0627451, 1, 0, 1,
-0.5421551, 0.7047604, -0.2555853, 0.05490196, 1, 0, 1,
-0.5416126, -1.934753, -2.791664, 0.05098039, 1, 0, 1,
-0.5325249, -0.004455414, -1.200981, 0.04313726, 1, 0, 1,
-0.5315289, 0.01620231, -0.3764255, 0.03921569, 1, 0, 1,
-0.5302147, -0.8445553, -0.3036547, 0.03137255, 1, 0, 1,
-0.5287361, 0.2411583, -2.234847, 0.02745098, 1, 0, 1,
-0.5248346, 0.2707965, -1.193488, 0.01960784, 1, 0, 1,
-0.5247972, 1.029378, 0.1031008, 0.01568628, 1, 0, 1,
-0.5247531, 0.03864771, -1.861575, 0.007843138, 1, 0, 1,
-0.5198809, -0.2531598, -2.199598, 0.003921569, 1, 0, 1,
-0.5148657, -0.7910393, -2.288005, 0, 1, 0.003921569, 1,
-0.5143287, -0.5868465, -2.1501, 0, 1, 0.01176471, 1,
-0.4993748, 0.5596984, -1.017726, 0, 1, 0.01568628, 1,
-0.499002, 0.005359162, -2.701979, 0, 1, 0.02352941, 1,
-0.4777795, 0.3829649, 0.2422847, 0, 1, 0.02745098, 1,
-0.4776309, -0.70897, -2.679387, 0, 1, 0.03529412, 1,
-0.4762535, 0.5172241, -1.653837, 0, 1, 0.03921569, 1,
-0.4742553, 0.7939788, 0.5264249, 0, 1, 0.04705882, 1,
-0.4667583, -1.034983, -2.218799, 0, 1, 0.05098039, 1,
-0.4571727, -0.1061801, -2.865954, 0, 1, 0.05882353, 1,
-0.4487056, -0.8664359, -3.83549, 0, 1, 0.0627451, 1,
-0.447963, 0.6951379, -1.664774, 0, 1, 0.07058824, 1,
-0.4465704, 1.19321, -1.251269, 0, 1, 0.07450981, 1,
-0.4463077, 1.368703, 1.41768, 0, 1, 0.08235294, 1,
-0.440854, 0.7457926, -0.9296995, 0, 1, 0.08627451, 1,
-0.4406735, -2.032803, -3.150481, 0, 1, 0.09411765, 1,
-0.4266922, -0.4451574, -2.830389, 0, 1, 0.1019608, 1,
-0.4221615, -0.684933, -2.10993, 0, 1, 0.1058824, 1,
-0.4218877, 0.7308667, -0.1798092, 0, 1, 0.1137255, 1,
-0.4200772, -0.5146569, -0.5850632, 0, 1, 0.1176471, 1,
-0.4199271, -2.919894, -3.163473, 0, 1, 0.1254902, 1,
-0.4195571, -0.4235967, -1.736025, 0, 1, 0.1294118, 1,
-0.4181359, -0.6123725, -3.591336, 0, 1, 0.1372549, 1,
-0.4169877, 0.1629789, -1.485472, 0, 1, 0.1411765, 1,
-0.4163778, -0.8486968, -1.483739, 0, 1, 0.1490196, 1,
-0.4091505, 0.136552, -1.47638, 0, 1, 0.1529412, 1,
-0.4079179, -0.005705615, -2.332691, 0, 1, 0.1607843, 1,
-0.3978359, -0.5461104, -0.9573671, 0, 1, 0.1647059, 1,
-0.3963097, 0.4607958, -2.923231, 0, 1, 0.172549, 1,
-0.3948053, 0.4543116, -0.6763007, 0, 1, 0.1764706, 1,
-0.3945839, -0.4868561, -2.085436, 0, 1, 0.1843137, 1,
-0.3928354, -0.9139222, -3.14241, 0, 1, 0.1882353, 1,
-0.3924291, -2.082784, -2.761837, 0, 1, 0.1960784, 1,
-0.3922302, 0.3912891, -0.6136102, 0, 1, 0.2039216, 1,
-0.3908517, -0.235819, -1.782192, 0, 1, 0.2078431, 1,
-0.3906158, -0.3856718, -2.95633, 0, 1, 0.2156863, 1,
-0.3880739, 0.06584305, -2.112145, 0, 1, 0.2196078, 1,
-0.3835655, -0.7258991, -1.708626, 0, 1, 0.227451, 1,
-0.3826424, -0.4278678, -2.399966, 0, 1, 0.2313726, 1,
-0.3805139, 0.2553717, -0.5683581, 0, 1, 0.2392157, 1,
-0.3785185, -0.7992424, -2.222469, 0, 1, 0.2431373, 1,
-0.3728585, 0.5310875, -0.8843117, 0, 1, 0.2509804, 1,
-0.3673772, 0.1528314, -0.8139459, 0, 1, 0.254902, 1,
-0.365339, 0.1277464, -1.56167, 0, 1, 0.2627451, 1,
-0.356045, 0.121335, -1.026247, 0, 1, 0.2666667, 1,
-0.3550523, -0.8208073, -3.794055, 0, 1, 0.2745098, 1,
-0.3538222, -1.13653, -2.114691, 0, 1, 0.2784314, 1,
-0.3535327, 1.155001, -0.2679068, 0, 1, 0.2862745, 1,
-0.3460153, -0.5715762, -4.122468, 0, 1, 0.2901961, 1,
-0.3417373, -0.6787974, -2.97208, 0, 1, 0.2980392, 1,
-0.3416415, -0.8835378, -3.339523, 0, 1, 0.3058824, 1,
-0.3395014, 0.2880531, -2.495479, 0, 1, 0.3098039, 1,
-0.3376938, -0.5439966, -4.579459, 0, 1, 0.3176471, 1,
-0.3282014, 0.1243391, -0.5161771, 0, 1, 0.3215686, 1,
-0.3258484, -0.46203, -3.010522, 0, 1, 0.3294118, 1,
-0.3256451, 2.006784, -0.1539045, 0, 1, 0.3333333, 1,
-0.323815, 0.05269257, -0.2343709, 0, 1, 0.3411765, 1,
-0.3186911, 0.5271446, -3.150819, 0, 1, 0.345098, 1,
-0.3160433, -0.4853919, -2.234624, 0, 1, 0.3529412, 1,
-0.3104413, -0.6444702, -4.442197, 0, 1, 0.3568628, 1,
-0.3084008, -1.026437, -2.251383, 0, 1, 0.3647059, 1,
-0.2971129, 1.034765, -0.8526298, 0, 1, 0.3686275, 1,
-0.2968705, -0.07445988, -1.699662, 0, 1, 0.3764706, 1,
-0.2952345, 0.355198, -0.7451999, 0, 1, 0.3803922, 1,
-0.2924021, -0.05244242, -2.252608, 0, 1, 0.3882353, 1,
-0.2908453, 1.624084, -1.712938, 0, 1, 0.3921569, 1,
-0.2901856, -0.2590748, -3.651381, 0, 1, 0.4, 1,
-0.2881811, -0.1245829, -3.737843, 0, 1, 0.4078431, 1,
-0.2843488, -1.087282, -3.947101, 0, 1, 0.4117647, 1,
-0.2792279, -0.9558882, -3.523607, 0, 1, 0.4196078, 1,
-0.2790186, -0.04943442, -0.5904832, 0, 1, 0.4235294, 1,
-0.2736991, -0.269626, -0.9610243, 0, 1, 0.4313726, 1,
-0.2733237, -0.2405927, -0.5118285, 0, 1, 0.4352941, 1,
-0.266274, -0.4629894, -3.940355, 0, 1, 0.4431373, 1,
-0.2653472, 0.4410018, -2.25267, 0, 1, 0.4470588, 1,
-0.2632891, 1.142534, 1.085954, 0, 1, 0.454902, 1,
-0.2565821, 1.039492, 0.6937687, 0, 1, 0.4588235, 1,
-0.2553773, 1.964575, -0.6149552, 0, 1, 0.4666667, 1,
-0.2546448, -1.031655, -0.3168293, 0, 1, 0.4705882, 1,
-0.2492156, -0.5321924, -4.160712, 0, 1, 0.4784314, 1,
-0.2491577, 1.274863, 0.1843666, 0, 1, 0.4823529, 1,
-0.2484036, -0.4066142, -2.82987, 0, 1, 0.4901961, 1,
-0.2443194, 0.120884, 0.3821398, 0, 1, 0.4941176, 1,
-0.2442456, 0.0160814, -1.975614, 0, 1, 0.5019608, 1,
-0.2424403, -0.6403288, -2.539003, 0, 1, 0.509804, 1,
-0.2415373, -0.9894474, -3.26324, 0, 1, 0.5137255, 1,
-0.2397697, -0.9934716, -2.088511, 0, 1, 0.5215687, 1,
-0.2381693, -0.4336255, -2.627444, 0, 1, 0.5254902, 1,
-0.2331404, 0.01748542, -1.963016, 0, 1, 0.5333334, 1,
-0.2273141, 1.183132, 1.275339, 0, 1, 0.5372549, 1,
-0.2270267, 0.7256529, -1.121885, 0, 1, 0.5450981, 1,
-0.2259028, -1.057778, -2.522698, 0, 1, 0.5490196, 1,
-0.2225105, 0.900033, -1.53376, 0, 1, 0.5568628, 1,
-0.2223801, 0.9111084, 0.4493579, 0, 1, 0.5607843, 1,
-0.221011, -0.2415753, 0.1089537, 0, 1, 0.5686275, 1,
-0.2172542, 1.01826, 0.3067895, 0, 1, 0.572549, 1,
-0.2161937, -0.09783437, -1.735893, 0, 1, 0.5803922, 1,
-0.2064504, -0.05495936, -3.166425, 0, 1, 0.5843138, 1,
-0.1993959, -1.090765, -3.521896, 0, 1, 0.5921569, 1,
-0.196505, -1.421411, -4.458222, 0, 1, 0.5960785, 1,
-0.1964799, 1.641062, -0.3433224, 0, 1, 0.6039216, 1,
-0.1943604, 0.2720995, -1.046361, 0, 1, 0.6117647, 1,
-0.1877663, 0.53905, -0.1722526, 0, 1, 0.6156863, 1,
-0.1877154, -0.1559396, -2.616242, 0, 1, 0.6235294, 1,
-0.1799498, -0.5961998, -2.155584, 0, 1, 0.627451, 1,
-0.1791812, 0.3080552, -1.070173, 0, 1, 0.6352941, 1,
-0.1790767, 0.1925476, 0.4146742, 0, 1, 0.6392157, 1,
-0.1782572, 1.637315, -2.030883, 0, 1, 0.6470588, 1,
-0.1759712, -0.198793, -2.505981, 0, 1, 0.6509804, 1,
-0.1754256, 0.6974285, 0.1699503, 0, 1, 0.6588235, 1,
-0.1749821, 0.8418112, 0.6862663, 0, 1, 0.6627451, 1,
-0.1730517, 1.187323, 0.7113606, 0, 1, 0.6705883, 1,
-0.1689187, -0.06399147, -1.50594, 0, 1, 0.6745098, 1,
-0.1676823, 0.4571083, -0.258385, 0, 1, 0.682353, 1,
-0.1675175, -0.6553218, -3.138217, 0, 1, 0.6862745, 1,
-0.1639019, 0.8414037, 0.5307066, 0, 1, 0.6941177, 1,
-0.1636659, 0.8412978, 0.4471049, 0, 1, 0.7019608, 1,
-0.1632151, -0.4538023, -4.216418, 0, 1, 0.7058824, 1,
-0.1609344, -1.373354, -3.339955, 0, 1, 0.7137255, 1,
-0.1601924, 0.2328464, -2.610847, 0, 1, 0.7176471, 1,
-0.1579732, 0.02087865, -2.413112, 0, 1, 0.7254902, 1,
-0.1570784, 0.6478869, -0.2982933, 0, 1, 0.7294118, 1,
-0.1558292, 0.8173346, 0.9011723, 0, 1, 0.7372549, 1,
-0.1538181, -1.636506, -2.569938, 0, 1, 0.7411765, 1,
-0.1538024, 0.2458174, -0.1504088, 0, 1, 0.7490196, 1,
-0.1535351, 0.2319357, -1.644425, 0, 1, 0.7529412, 1,
-0.1502901, 0.3478073, -0.6082832, 0, 1, 0.7607843, 1,
-0.1471479, 0.890173, 0.4647053, 0, 1, 0.7647059, 1,
-0.1464602, 0.2697065, 1.529639, 0, 1, 0.772549, 1,
-0.1447023, -0.4421659, -3.251386, 0, 1, 0.7764706, 1,
-0.1417645, -1.341171, -4.721241, 0, 1, 0.7843137, 1,
-0.1391875, -0.9712969, -3.470299, 0, 1, 0.7882353, 1,
-0.1356661, 1.012871, 1.060579, 0, 1, 0.7960784, 1,
-0.1347293, -0.1142342, -1.269386, 0, 1, 0.8039216, 1,
-0.1342795, -0.71109, -3.896387, 0, 1, 0.8078431, 1,
-0.1329681, -0.3826086, -2.809552, 0, 1, 0.8156863, 1,
-0.1318291, 0.1077114, 0.02204592, 0, 1, 0.8196079, 1,
-0.1310481, 0.7435085, -0.8534495, 0, 1, 0.827451, 1,
-0.1307278, -0.2540313, -3.068094, 0, 1, 0.8313726, 1,
-0.1289094, 1.007383, 1.423883, 0, 1, 0.8392157, 1,
-0.1232317, -1.92349, -2.908657, 0, 1, 0.8431373, 1,
-0.1225244, 0.03122197, -2.450052, 0, 1, 0.8509804, 1,
-0.117897, 0.04135613, -1.329151, 0, 1, 0.854902, 1,
-0.1151768, 0.1238807, -0.2924567, 0, 1, 0.8627451, 1,
-0.1115127, 1.542366, -0.6392318, 0, 1, 0.8666667, 1,
-0.1081282, -1.361323, -2.575743, 0, 1, 0.8745098, 1,
-0.1061215, 0.9529818, 1.133679, 0, 1, 0.8784314, 1,
-0.1022874, 1.480097, -1.833411, 0, 1, 0.8862745, 1,
-0.1021196, 1.505128, -0.4733225, 0, 1, 0.8901961, 1,
-0.09575764, -0.5298478, -2.746233, 0, 1, 0.8980392, 1,
-0.0867602, 2.123872, 0.1438134, 0, 1, 0.9058824, 1,
-0.08224458, -0.8745909, -2.46371, 0, 1, 0.9098039, 1,
-0.0791662, 1.089596, 0.8322267, 0, 1, 0.9176471, 1,
-0.07835315, 0.5945634, -0.822086, 0, 1, 0.9215686, 1,
-0.07606496, 1.034505, -0.04661411, 0, 1, 0.9294118, 1,
-0.075289, 1.827622, -0.4281081, 0, 1, 0.9333333, 1,
-0.07354102, -0.2304908, -2.433744, 0, 1, 0.9411765, 1,
-0.07321467, 1.046674, 0.3877503, 0, 1, 0.945098, 1,
-0.06886871, -0.1597891, -3.589477, 0, 1, 0.9529412, 1,
-0.06556658, 0.4701667, -2.079425, 0, 1, 0.9568627, 1,
-0.06469984, -0.5535486, -2.292725, 0, 1, 0.9647059, 1,
-0.06099453, 0.1910156, -0.2121084, 0, 1, 0.9686275, 1,
-0.05933635, -2.505677, -4.915643, 0, 1, 0.9764706, 1,
-0.05788255, -0.3982407, -3.867899, 0, 1, 0.9803922, 1,
-0.05711919, 0.06943306, -1.319943, 0, 1, 0.9882353, 1,
-0.05587235, -2.789943, -2.163373, 0, 1, 0.9921569, 1,
-0.0553413, -0.7343454, -2.428082, 0, 1, 1, 1,
-0.05411288, 0.305119, 0.09868341, 0, 0.9921569, 1, 1,
-0.04769538, 1.343799, -1.115156, 0, 0.9882353, 1, 1,
-0.04332524, -0.2954084, -3.781537, 0, 0.9803922, 1, 1,
-0.04004327, -0.1534079, -4.256582, 0, 0.9764706, 1, 1,
-0.03932334, -0.4903522, -3.653916, 0, 0.9686275, 1, 1,
-0.03883222, -1.663886, -1.967754, 0, 0.9647059, 1, 1,
-0.03712559, -1.226027, -2.030332, 0, 0.9568627, 1, 1,
-0.02486794, -1.516531, -2.596375, 0, 0.9529412, 1, 1,
-0.02302374, -0.3389362, -2.806009, 0, 0.945098, 1, 1,
-0.01941493, 0.3290485, -0.8089123, 0, 0.9411765, 1, 1,
-0.009605302, 1.060455, 0.1878382, 0, 0.9333333, 1, 1,
-0.008391199, -0.04019913, -3.598472, 0, 0.9294118, 1, 1,
-0.00502987, -0.8649958, -3.108732, 0, 0.9215686, 1, 1,
-0.004951178, -0.1108691, -3.002235, 0, 0.9176471, 1, 1,
-0.003936504, -0.3930981, -2.003669, 0, 0.9098039, 1, 1,
-0.001918758, 0.9385928, -2.52369, 0, 0.9058824, 1, 1,
0.0002409302, 0.4359067, 1.247522, 0, 0.8980392, 1, 1,
0.002894291, -0.1078658, 2.810081, 0, 0.8901961, 1, 1,
0.0062951, -0.6821007, 3.657219, 0, 0.8862745, 1, 1,
0.01010694, -0.6606085, 3.619662, 0, 0.8784314, 1, 1,
0.01501722, -1.469341, 2.089048, 0, 0.8745098, 1, 1,
0.02023905, 0.3090655, 1.214538, 0, 0.8666667, 1, 1,
0.02232861, -0.6413031, 5.522748, 0, 0.8627451, 1, 1,
0.02474916, -0.3913901, 3.803387, 0, 0.854902, 1, 1,
0.02714731, -0.07166246, 2.574453, 0, 0.8509804, 1, 1,
0.02861932, 2.29805, 0.4312393, 0, 0.8431373, 1, 1,
0.03298932, 2.18115, -0.7672916, 0, 0.8392157, 1, 1,
0.03589438, 0.620932, -1.446839, 0, 0.8313726, 1, 1,
0.04083164, 0.2075356, 0.5660362, 0, 0.827451, 1, 1,
0.04522029, -0.0951528, 2.643194, 0, 0.8196079, 1, 1,
0.04587359, 0.5722029, -0.1077064, 0, 0.8156863, 1, 1,
0.0459216, 1.157004, -0.787873, 0, 0.8078431, 1, 1,
0.04668723, 0.9550945, 1.38192, 0, 0.8039216, 1, 1,
0.04956821, -0.4478209, 3.729475, 0, 0.7960784, 1, 1,
0.0520979, -0.7298945, 3.573143, 0, 0.7882353, 1, 1,
0.0543715, 1.648571, -0.2480272, 0, 0.7843137, 1, 1,
0.05559914, -0.7130992, 3.582866, 0, 0.7764706, 1, 1,
0.05658257, -0.825298, 3.597741, 0, 0.772549, 1, 1,
0.0587596, 1.103953, 0.255011, 0, 0.7647059, 1, 1,
0.05981466, -0.2166056, 2.612383, 0, 0.7607843, 1, 1,
0.05997705, 0.8855311, -1.520298, 0, 0.7529412, 1, 1,
0.06132992, -1.251733, 4.621211, 0, 0.7490196, 1, 1,
0.06141517, -0.783431, 3.353634, 0, 0.7411765, 1, 1,
0.06397489, -3.771199, 2.996617, 0, 0.7372549, 1, 1,
0.06640401, 1.648137, -0.8054301, 0, 0.7294118, 1, 1,
0.07310711, 1.024299, -1.317516, 0, 0.7254902, 1, 1,
0.07410123, -0.8432131, 3.530379, 0, 0.7176471, 1, 1,
0.07526281, 0.23783, 0.165216, 0, 0.7137255, 1, 1,
0.07800406, -0.8178378, 3.367336, 0, 0.7058824, 1, 1,
0.07977814, 0.1150178, -0.7464101, 0, 0.6980392, 1, 1,
0.08005806, 1.036544, 0.8801642, 0, 0.6941177, 1, 1,
0.08128277, -0.1392871, 4.467875, 0, 0.6862745, 1, 1,
0.08324918, -0.9984285, 1.596002, 0, 0.682353, 1, 1,
0.08629284, -1.024959, 1.700661, 0, 0.6745098, 1, 1,
0.08649454, -0.09022217, 3.788578, 0, 0.6705883, 1, 1,
0.08713179, -0.6054153, 5.427191, 0, 0.6627451, 1, 1,
0.08738283, 1.936077, -0.5818168, 0, 0.6588235, 1, 1,
0.09190174, -1.340045, 3.148125, 0, 0.6509804, 1, 1,
0.09374663, -0.694685, 1.682219, 0, 0.6470588, 1, 1,
0.09937964, 0.5809761, 1.293636, 0, 0.6392157, 1, 1,
0.1008775, 0.04792344, 2.410303, 0, 0.6352941, 1, 1,
0.106484, 1.109547, -0.6641645, 0, 0.627451, 1, 1,
0.1074404, 0.5002338, 0.3381504, 0, 0.6235294, 1, 1,
0.1119761, 1.368498, 0.559161, 0, 0.6156863, 1, 1,
0.1251326, 0.6145209, -1.496626, 0, 0.6117647, 1, 1,
0.1261157, 1.073959, 0.6722033, 0, 0.6039216, 1, 1,
0.1263072, 1.528625, -0.5526314, 0, 0.5960785, 1, 1,
0.1299291, -2.242821, 2.238047, 0, 0.5921569, 1, 1,
0.1306675, 0.5726337, -0.8699141, 0, 0.5843138, 1, 1,
0.132489, -0.2173073, 2.635373, 0, 0.5803922, 1, 1,
0.1376007, -1.175109, 3.180986, 0, 0.572549, 1, 1,
0.1398446, -1.601962, 3.767673, 0, 0.5686275, 1, 1,
0.1453269, 1.171777, 0.5886483, 0, 0.5607843, 1, 1,
0.145495, 0.5847642, 0.1650611, 0, 0.5568628, 1, 1,
0.1456433, -1.218633, 3.630776, 0, 0.5490196, 1, 1,
0.1475563, 0.9621651, 0.06432444, 0, 0.5450981, 1, 1,
0.1488738, -0.387675, 1.793014, 0, 0.5372549, 1, 1,
0.1499613, -0.6208373, 2.710666, 0, 0.5333334, 1, 1,
0.1515187, -1.163447, 2.921718, 0, 0.5254902, 1, 1,
0.1574671, 0.5298181, -0.7356423, 0, 0.5215687, 1, 1,
0.1577117, -1.290251, 2.810408, 0, 0.5137255, 1, 1,
0.1597741, 0.7331586, 0.8689268, 0, 0.509804, 1, 1,
0.168553, -1.491095, 3.578334, 0, 0.5019608, 1, 1,
0.1714996, 0.037451, 2.340656, 0, 0.4941176, 1, 1,
0.1743719, -0.5266497, 3.096756, 0, 0.4901961, 1, 1,
0.1750715, -1.397884, 4.194639, 0, 0.4823529, 1, 1,
0.176907, 0.1225682, -1.000291, 0, 0.4784314, 1, 1,
0.1788626, 0.8797346, 2.548367, 0, 0.4705882, 1, 1,
0.1804022, 0.9149777, 0.4737593, 0, 0.4666667, 1, 1,
0.182127, 0.004646161, 2.022281, 0, 0.4588235, 1, 1,
0.1844526, -0.1835055, 2.128202, 0, 0.454902, 1, 1,
0.1874855, -0.05109892, 1.563797, 0, 0.4470588, 1, 1,
0.1875506, 1.162594, 0.5706688, 0, 0.4431373, 1, 1,
0.1906715, -0.1835515, 2.79891, 0, 0.4352941, 1, 1,
0.1918691, 1.654477, -1.456274, 0, 0.4313726, 1, 1,
0.1919829, 0.2100821, 0.908289, 0, 0.4235294, 1, 1,
0.1935897, -1.51929, 2.62412, 0, 0.4196078, 1, 1,
0.1992701, 0.0886007, 2.41191, 0, 0.4117647, 1, 1,
0.2037797, -0.6976427, 1.991154, 0, 0.4078431, 1, 1,
0.2065752, -0.1152983, 2.175507, 0, 0.4, 1, 1,
0.207118, -0.3172081, 2.86336, 0, 0.3921569, 1, 1,
0.2134006, -0.9588627, 1.937031, 0, 0.3882353, 1, 1,
0.2145564, 0.6444239, -0.1488389, 0, 0.3803922, 1, 1,
0.2206746, -1.85594, 2.801837, 0, 0.3764706, 1, 1,
0.2234104, 0.553721, 1.796524, 0, 0.3686275, 1, 1,
0.2241589, 0.4672893, -0.09931237, 0, 0.3647059, 1, 1,
0.2242765, -0.625963, 4.071997, 0, 0.3568628, 1, 1,
0.2270195, 1.201553, 1.638335, 0, 0.3529412, 1, 1,
0.2273184, 0.788774, 1.963733, 0, 0.345098, 1, 1,
0.2287749, 1.679522, 0.6617989, 0, 0.3411765, 1, 1,
0.2291692, 0.4966557, 0.8559311, 0, 0.3333333, 1, 1,
0.2295487, -1.362659, 3.39122, 0, 0.3294118, 1, 1,
0.2298679, 0.7127367, -0.8365833, 0, 0.3215686, 1, 1,
0.2316619, 0.1490919, 0.08502901, 0, 0.3176471, 1, 1,
0.232145, 1.800182, -0.1653365, 0, 0.3098039, 1, 1,
0.2338214, -1.988058, 3.147735, 0, 0.3058824, 1, 1,
0.2338319, -3.058993, 2.742349, 0, 0.2980392, 1, 1,
0.2351066, -1.033872, 1.669452, 0, 0.2901961, 1, 1,
0.2354562, 0.2998304, 1.657025, 0, 0.2862745, 1, 1,
0.2369959, -1.234752, 3.669711, 0, 0.2784314, 1, 1,
0.2388401, 0.1996233, -1.131478, 0, 0.2745098, 1, 1,
0.240365, -0.2637159, 3.528635, 0, 0.2666667, 1, 1,
0.2433224, -0.007800998, 2.251341, 0, 0.2627451, 1, 1,
0.2465393, 1.00992, 0.3952789, 0, 0.254902, 1, 1,
0.2491383, -0.7525372, 3.583214, 0, 0.2509804, 1, 1,
0.249324, -0.09524697, 3.047855, 0, 0.2431373, 1, 1,
0.2540132, 2.495022, -0.6889796, 0, 0.2392157, 1, 1,
0.2546548, -0.1762228, 2.668821, 0, 0.2313726, 1, 1,
0.2566157, -0.9996837, 1.970177, 0, 0.227451, 1, 1,
0.2601607, 0.1038482, 1.856119, 0, 0.2196078, 1, 1,
0.2609707, -0.3965673, 1.563171, 0, 0.2156863, 1, 1,
0.2698284, 1.737949, -0.8175216, 0, 0.2078431, 1, 1,
0.2710885, 0.402585, 1.261834, 0, 0.2039216, 1, 1,
0.2715789, 0.8572986, -1.055019, 0, 0.1960784, 1, 1,
0.2749065, 0.9962545, 2.432584, 0, 0.1882353, 1, 1,
0.2777303, 1.80262, -2.122882, 0, 0.1843137, 1, 1,
0.2800204, -0.120968, 1.238477, 0, 0.1764706, 1, 1,
0.2818936, -1.43504, 0.9307971, 0, 0.172549, 1, 1,
0.2826299, -0.6271492, 3.368987, 0, 0.1647059, 1, 1,
0.2853199, 0.2602775, 0.2503439, 0, 0.1607843, 1, 1,
0.286705, -0.7449164, 3.980247, 0, 0.1529412, 1, 1,
0.3012133, 1.631669, 1.072716, 0, 0.1490196, 1, 1,
0.3096546, 0.1306148, 1.58521, 0, 0.1411765, 1, 1,
0.3170241, -0.5629546, 2.476626, 0, 0.1372549, 1, 1,
0.3185506, 0.04183462, 0.5293204, 0, 0.1294118, 1, 1,
0.3206137, -1.919773, 3.967411, 0, 0.1254902, 1, 1,
0.3209043, 2.101935, -1.603193, 0, 0.1176471, 1, 1,
0.3292288, 0.5635412, 0.9423994, 0, 0.1137255, 1, 1,
0.3311384, 1.198231, -0.1753326, 0, 0.1058824, 1, 1,
0.3321106, -0.2138316, 2.769455, 0, 0.09803922, 1, 1,
0.3352199, -0.2471661, 2.177857, 0, 0.09411765, 1, 1,
0.3383852, 1.015246, 1.93246, 0, 0.08627451, 1, 1,
0.344688, -0.7135962, 1.653908, 0, 0.08235294, 1, 1,
0.3490959, -0.4038034, 1.347086, 0, 0.07450981, 1, 1,
0.3499984, 0.3053323, -0.4610937, 0, 0.07058824, 1, 1,
0.3607579, -0.2459962, 2.983256, 0, 0.0627451, 1, 1,
0.3643623, -0.01349837, 2.138676, 0, 0.05882353, 1, 1,
0.3695796, -0.1739613, 1.931375, 0, 0.05098039, 1, 1,
0.3715571, 0.2988145, -0.1783321, 0, 0.04705882, 1, 1,
0.3756557, 1.024255, 0.26169, 0, 0.03921569, 1, 1,
0.376532, 0.1343414, 1.375621, 0, 0.03529412, 1, 1,
0.3799849, -0.125129, 1.145566, 0, 0.02745098, 1, 1,
0.383666, 1.4385, 0.6814842, 0, 0.02352941, 1, 1,
0.3844401, 0.2549797, 1.659557, 0, 0.01568628, 1, 1,
0.3906477, -2.015566, 2.485582, 0, 0.01176471, 1, 1,
0.3991283, -1.148273, 1.93945, 0, 0.003921569, 1, 1,
0.403418, -0.3712849, 1.887627, 0.003921569, 0, 1, 1,
0.4038539, -0.6982532, 3.026564, 0.007843138, 0, 1, 1,
0.4074782, -0.6270416, 2.914365, 0.01568628, 0, 1, 1,
0.4081472, -0.0458436, 0.9608999, 0.01960784, 0, 1, 1,
0.408404, 0.1654765, 1.990633, 0.02745098, 0, 1, 1,
0.4096829, 0.835872, 0.3523065, 0.03137255, 0, 1, 1,
0.410308, -1.114245, 3.500038, 0.03921569, 0, 1, 1,
0.4112509, 0.9123326, -0.002655801, 0.04313726, 0, 1, 1,
0.4121331, -0.3231672, 3.045809, 0.05098039, 0, 1, 1,
0.4141486, 0.5479976, 0.1572263, 0.05490196, 0, 1, 1,
0.4174322, 0.1941849, 0.3539386, 0.0627451, 0, 1, 1,
0.41878, 1.283927, 0.5912507, 0.06666667, 0, 1, 1,
0.4188491, -0.5475538, 2.398072, 0.07450981, 0, 1, 1,
0.4239572, -0.2379722, 2.370902, 0.07843138, 0, 1, 1,
0.4275032, -1.727525, 2.94171, 0.08627451, 0, 1, 1,
0.4301477, 0.7331623, 1.218937, 0.09019608, 0, 1, 1,
0.4316067, -1.077566, 2.929033, 0.09803922, 0, 1, 1,
0.4339274, 0.5787078, 0.8782235, 0.1058824, 0, 1, 1,
0.4367594, 2.581716, 1.025895, 0.1098039, 0, 1, 1,
0.4552965, 0.09665459, 1.339254, 0.1176471, 0, 1, 1,
0.4579067, -0.09737419, 4.350799, 0.1215686, 0, 1, 1,
0.4602206, -1.269043, 3.213362, 0.1294118, 0, 1, 1,
0.466628, 1.005316, -0.509815, 0.1333333, 0, 1, 1,
0.4683516, -1.842042, 3.332691, 0.1411765, 0, 1, 1,
0.4711318, -0.3075965, 1.149517, 0.145098, 0, 1, 1,
0.4779254, 0.9080883, 0.8898289, 0.1529412, 0, 1, 1,
0.4796726, -1.769737, 0.7006057, 0.1568628, 0, 1, 1,
0.489078, -1.781968, 1.525838, 0.1647059, 0, 1, 1,
0.4892585, 0.1325302, 1.098542, 0.1686275, 0, 1, 1,
0.4896585, 1.114455, 0.3336511, 0.1764706, 0, 1, 1,
0.491185, -0.2413563, 1.290599, 0.1803922, 0, 1, 1,
0.4962735, -2.014822, 2.602827, 0.1882353, 0, 1, 1,
0.4990719, -0.8439851, 3.242262, 0.1921569, 0, 1, 1,
0.5027171, -0.01598946, 0.03356705, 0.2, 0, 1, 1,
0.5031097, 1.328081, 0.6649275, 0.2078431, 0, 1, 1,
0.507543, -0.3712055, 3.54522, 0.2117647, 0, 1, 1,
0.5127404, 0.1312812, 0.9429201, 0.2196078, 0, 1, 1,
0.5148155, 0.05375879, 1.630998, 0.2235294, 0, 1, 1,
0.5221141, 0.6566763, 0.4353854, 0.2313726, 0, 1, 1,
0.5258176, -1.771518, 1.851251, 0.2352941, 0, 1, 1,
0.5286247, -0.9601266, 3.889729, 0.2431373, 0, 1, 1,
0.5318529, 1.061514, 2.684105, 0.2470588, 0, 1, 1,
0.5396488, -0.6565389, 2.927411, 0.254902, 0, 1, 1,
0.5401313, 2.209175, 0.002793207, 0.2588235, 0, 1, 1,
0.5427367, -2.486227, 5.23604, 0.2666667, 0, 1, 1,
0.5472534, -1.825963, 3.681794, 0.2705882, 0, 1, 1,
0.5521768, -0.1895825, 2.09554, 0.2784314, 0, 1, 1,
0.5571849, -0.7064609, 1.444127, 0.282353, 0, 1, 1,
0.5585722, 1.101599, 1.383133, 0.2901961, 0, 1, 1,
0.5599257, 1.220029, 1.362829, 0.2941177, 0, 1, 1,
0.5665576, 0.01560117, 1.518524, 0.3019608, 0, 1, 1,
0.5719941, -0.6148087, 2.881034, 0.3098039, 0, 1, 1,
0.5722647, -0.9616899, 1.84965, 0.3137255, 0, 1, 1,
0.5735738, 0.007655756, 0.7967725, 0.3215686, 0, 1, 1,
0.5776455, -1.788215, 1.874964, 0.3254902, 0, 1, 1,
0.5794204, -0.03239596, 0.3971355, 0.3333333, 0, 1, 1,
0.5807572, -0.03943621, 0.3028094, 0.3372549, 0, 1, 1,
0.5840208, -1.947531, 0.9568389, 0.345098, 0, 1, 1,
0.5842448, 0.03937439, 1.586385, 0.3490196, 0, 1, 1,
0.5893128, 2.095815, 1.925804, 0.3568628, 0, 1, 1,
0.5903664, 0.5832115, -0.01960254, 0.3607843, 0, 1, 1,
0.5948322, 0.4058112, 1.234913, 0.3686275, 0, 1, 1,
0.596171, -0.9720236, 1.071121, 0.372549, 0, 1, 1,
0.5966675, -0.3984396, 1.551492, 0.3803922, 0, 1, 1,
0.5996011, 0.009556379, 2.795628, 0.3843137, 0, 1, 1,
0.5998284, 0.3952672, 1.136926, 0.3921569, 0, 1, 1,
0.6060786, -0.9244094, 2.219459, 0.3960784, 0, 1, 1,
0.6088552, -0.6458861, 3.278978, 0.4039216, 0, 1, 1,
0.6118494, 0.3372805, 2.407939, 0.4117647, 0, 1, 1,
0.6176093, 1.223869, 0.2344695, 0.4156863, 0, 1, 1,
0.6233074, 0.248817, -0.9480064, 0.4235294, 0, 1, 1,
0.629128, 0.9827638, 2.054078, 0.427451, 0, 1, 1,
0.6328538, -0.1346427, 1.373274, 0.4352941, 0, 1, 1,
0.6446027, -0.8223501, 3.540942, 0.4392157, 0, 1, 1,
0.6453676, 0.2322723, 2.083893, 0.4470588, 0, 1, 1,
0.647802, -2.889156, 4.23129, 0.4509804, 0, 1, 1,
0.647908, 1.098518, 0.5770525, 0.4588235, 0, 1, 1,
0.6566263, 0.07624336, 1.183449, 0.4627451, 0, 1, 1,
0.6576713, -1.706379, 1.123983, 0.4705882, 0, 1, 1,
0.6593347, -0.6218811, 2.425891, 0.4745098, 0, 1, 1,
0.6605593, -0.3056627, 1.937116, 0.4823529, 0, 1, 1,
0.6621485, -0.4613891, 1.473581, 0.4862745, 0, 1, 1,
0.665492, -0.8281206, 1.251132, 0.4941176, 0, 1, 1,
0.6686919, 0.09098116, 0.4956014, 0.5019608, 0, 1, 1,
0.670596, 0.1694556, 0.6304242, 0.5058824, 0, 1, 1,
0.6753395, 1.284884, 1.066108, 0.5137255, 0, 1, 1,
0.676971, 0.6922169, 3.589351, 0.5176471, 0, 1, 1,
0.6905799, 1.965599, 0.9682676, 0.5254902, 0, 1, 1,
0.6918199, 0.6043624, 1.909153, 0.5294118, 0, 1, 1,
0.6944306, 1.156755, -0.1954194, 0.5372549, 0, 1, 1,
0.699351, 0.4755269, 0.291339, 0.5411765, 0, 1, 1,
0.7044939, 0.04907278, 2.163003, 0.5490196, 0, 1, 1,
0.7072179, -2.235018, 1.685855, 0.5529412, 0, 1, 1,
0.7099116, -1.302507, 3.349078, 0.5607843, 0, 1, 1,
0.7176849, -0.2524036, 1.82163, 0.5647059, 0, 1, 1,
0.7185948, 0.9164287, 3.302424, 0.572549, 0, 1, 1,
0.7219063, 0.9509249, 2.085251, 0.5764706, 0, 1, 1,
0.7224147, -0.6709699, 2.674907, 0.5843138, 0, 1, 1,
0.7248622, -0.680843, 3.032073, 0.5882353, 0, 1, 1,
0.7265638, -0.5448317, 0.4841631, 0.5960785, 0, 1, 1,
0.728431, 0.2496761, -1.06021, 0.6039216, 0, 1, 1,
0.7294213, -0.3642768, 2.879263, 0.6078432, 0, 1, 1,
0.7299463, 1.48123, 1.468262, 0.6156863, 0, 1, 1,
0.745113, -2.459727, 2.333224, 0.6196079, 0, 1, 1,
0.7497888, 0.2213683, 1.917987, 0.627451, 0, 1, 1,
0.7525795, -1.65956, 3.082827, 0.6313726, 0, 1, 1,
0.7532845, -0.9176264, 2.500795, 0.6392157, 0, 1, 1,
0.7601501, -0.8979865, 1.653798, 0.6431373, 0, 1, 1,
0.7608376, -0.4897349, 1.685364, 0.6509804, 0, 1, 1,
0.7620687, 1.458704, 1.728782, 0.654902, 0, 1, 1,
0.7638112, -0.710389, 1.613181, 0.6627451, 0, 1, 1,
0.7639003, -1.10812, 1.69701, 0.6666667, 0, 1, 1,
0.7720063, 1.581905, 1.686121, 0.6745098, 0, 1, 1,
0.7839018, -1.754943, 2.220701, 0.6784314, 0, 1, 1,
0.7881815, 0.4204186, 1.624507, 0.6862745, 0, 1, 1,
0.7913046, -0.3142734, 2.756737, 0.6901961, 0, 1, 1,
0.7968597, 0.7281932, -0.2639337, 0.6980392, 0, 1, 1,
0.7991455, 0.2112726, 2.12045, 0.7058824, 0, 1, 1,
0.8020508, 2.012196, 0.8278814, 0.7098039, 0, 1, 1,
0.8034225, -0.9225127, 2.312477, 0.7176471, 0, 1, 1,
0.8074863, -2.262841, 0.9009681, 0.7215686, 0, 1, 1,
0.8136897, 2.020038, 0.5015357, 0.7294118, 0, 1, 1,
0.8144362, 2.143534, 0.8190119, 0.7333333, 0, 1, 1,
0.8191206, -0.451714, 4.244528, 0.7411765, 0, 1, 1,
0.8205775, -0.9040013, 2.488673, 0.7450981, 0, 1, 1,
0.8214259, 1.089884, 0.6370703, 0.7529412, 0, 1, 1,
0.8236838, 0.2039484, 2.337938, 0.7568628, 0, 1, 1,
0.8246602, 0.5475049, -0.4114611, 0.7647059, 0, 1, 1,
0.8270931, 0.3729811, 1.21037, 0.7686275, 0, 1, 1,
0.8293579, -0.09469434, 1.795005, 0.7764706, 0, 1, 1,
0.8309221, -0.3338303, 1.387855, 0.7803922, 0, 1, 1,
0.8437545, -0.1415585, 3.113259, 0.7882353, 0, 1, 1,
0.845219, 0.6227376, -0.2487907, 0.7921569, 0, 1, 1,
0.8561373, -0.9487182, 3.188835, 0.8, 0, 1, 1,
0.8561739, -0.3665318, 1.750801, 0.8078431, 0, 1, 1,
0.8568649, -1.170548, 3.67528, 0.8117647, 0, 1, 1,
0.8605943, 0.131219, 1.906661, 0.8196079, 0, 1, 1,
0.8623828, -0.7673895, 3.380975, 0.8235294, 0, 1, 1,
0.8650038, 1.239826, 0.9245358, 0.8313726, 0, 1, 1,
0.8717787, -0.1138894, 2.223122, 0.8352941, 0, 1, 1,
0.8735502, -0.7882708, 1.363004, 0.8431373, 0, 1, 1,
0.8738076, -0.04774103, 1.720115, 0.8470588, 0, 1, 1,
0.8742225, 0.6090944, -0.2253014, 0.854902, 0, 1, 1,
0.8846844, 0.1251809, -0.2108628, 0.8588235, 0, 1, 1,
0.8853791, 0.5375652, 0.2245975, 0.8666667, 0, 1, 1,
0.8870688, -1.231049, 3.667636, 0.8705882, 0, 1, 1,
0.8918015, 0.2012237, 2.932333, 0.8784314, 0, 1, 1,
0.8990768, -0.9810663, 1.634688, 0.8823529, 0, 1, 1,
0.9072757, 0.2975567, -0.005495933, 0.8901961, 0, 1, 1,
0.9093639, -0.17167, 2.18935, 0.8941177, 0, 1, 1,
0.9172029, -0.3779764, 3.060271, 0.9019608, 0, 1, 1,
0.9173039, 0.5496498, 2.716983, 0.9098039, 0, 1, 1,
0.9202985, 0.3436321, 1.137167, 0.9137255, 0, 1, 1,
0.9240133, -0.5505849, 3.888477, 0.9215686, 0, 1, 1,
0.9250928, -0.4557351, 2.651125, 0.9254902, 0, 1, 1,
0.9270356, -0.5669533, 1.754406, 0.9333333, 0, 1, 1,
0.9358956, 0.03994285, 2.310745, 0.9372549, 0, 1, 1,
0.9369881, 1.23965, 1.356397, 0.945098, 0, 1, 1,
0.937597, -0.8747156, 3.131548, 0.9490196, 0, 1, 1,
0.938396, 1.640063, 0.7219434, 0.9568627, 0, 1, 1,
0.9419839, -1.254508, 2.573818, 0.9607843, 0, 1, 1,
0.9445832, -2.278396, 2.921511, 0.9686275, 0, 1, 1,
0.9450816, -0.02060257, 1.889612, 0.972549, 0, 1, 1,
0.9491458, 0.6625791, -1.293328, 0.9803922, 0, 1, 1,
0.9500691, -0.3324827, 1.310427, 0.9843137, 0, 1, 1,
0.9577479, -2.02628, 1.592386, 0.9921569, 0, 1, 1,
0.9608499, 0.7673525, 0.8356062, 0.9960784, 0, 1, 1,
0.9622337, 0.1186075, 2.571525, 1, 0, 0.9960784, 1,
0.9646078, 0.69868, 2.691057, 1, 0, 0.9882353, 1,
0.9694381, 0.9933155, 1.29125, 1, 0, 0.9843137, 1,
0.9709113, 0.04734489, 2.428535, 1, 0, 0.9764706, 1,
0.9743664, 0.6423408, 0.496242, 1, 0, 0.972549, 1,
0.9743908, 0.6166289, 3.327723, 1, 0, 0.9647059, 1,
0.9744416, -1.54276, 0.9518706, 1, 0, 0.9607843, 1,
0.9770892, -0.08514173, 1.080068, 1, 0, 0.9529412, 1,
0.9782795, -1.550769, 3.37419, 1, 0, 0.9490196, 1,
0.9794061, 0.2247237, 1.109833, 1, 0, 0.9411765, 1,
0.9868585, -1.924779, 1.824359, 1, 0, 0.9372549, 1,
0.9883583, 0.2527784, 1.199324, 1, 0, 0.9294118, 1,
0.9886134, 0.5258765, 2.508882, 1, 0, 0.9254902, 1,
0.9899148, -0.1356162, 0.3703587, 1, 0, 0.9176471, 1,
0.9917626, 0.03039083, 1.772252, 1, 0, 0.9137255, 1,
0.9966939, 0.2575325, 1.160434, 1, 0, 0.9058824, 1,
1.003473, -0.5414904, 1.87093, 1, 0, 0.9019608, 1,
1.004253, -0.7850778, 0.8320222, 1, 0, 0.8941177, 1,
1.005718, 0.521921, -0.6822374, 1, 0, 0.8862745, 1,
1.009835, -0.569934, 2.17694, 1, 0, 0.8823529, 1,
1.010033, -0.5781571, 1.723588, 1, 0, 0.8745098, 1,
1.010229, 1.10148, 0.08107585, 1, 0, 0.8705882, 1,
1.023423, 1.062133, 2.403704, 1, 0, 0.8627451, 1,
1.023457, 1.117053, 1.791335, 1, 0, 0.8588235, 1,
1.027341, -1.135675, 2.963209, 1, 0, 0.8509804, 1,
1.03328, 0.4019896, 3.011588, 1, 0, 0.8470588, 1,
1.033702, -1.116475, 1.998123, 1, 0, 0.8392157, 1,
1.059049, 0.7926849, 2.042942, 1, 0, 0.8352941, 1,
1.075096, -0.0550355, 0.239536, 1, 0, 0.827451, 1,
1.084251, 1.610093, -0.5311326, 1, 0, 0.8235294, 1,
1.099241, -0.4560857, 2.172793, 1, 0, 0.8156863, 1,
1.101851, -1.026162, 3.158096, 1, 0, 0.8117647, 1,
1.102253, 1.132835, -0.1278777, 1, 0, 0.8039216, 1,
1.107637, -0.04718232, 1.261578, 1, 0, 0.7960784, 1,
1.108872, 0.192944, 2.096387, 1, 0, 0.7921569, 1,
1.116098, -1.319042, 3.179909, 1, 0, 0.7843137, 1,
1.128635, -0.866442, 2.262364, 1, 0, 0.7803922, 1,
1.136681, -0.3793722, 3.794091, 1, 0, 0.772549, 1,
1.139113, 0.2182842, 2.375051, 1, 0, 0.7686275, 1,
1.149084, -0.1539565, 2.528545, 1, 0, 0.7607843, 1,
1.152449, 1.975311, 0.9213114, 1, 0, 0.7568628, 1,
1.161908, -0.6601992, 2.191735, 1, 0, 0.7490196, 1,
1.165058, 1.010983, 0.484665, 1, 0, 0.7450981, 1,
1.172279, 3.812672, -1.406383, 1, 0, 0.7372549, 1,
1.175705, 0.04362081, -0.8347502, 1, 0, 0.7333333, 1,
1.179404, 0.485405, 0.8820498, 1, 0, 0.7254902, 1,
1.182916, -1.164987, 1.989684, 1, 0, 0.7215686, 1,
1.189508, -1.876729, 2.743198, 1, 0, 0.7137255, 1,
1.191792, 1.23862, 0.7409304, 1, 0, 0.7098039, 1,
1.205868, -0.5033311, 0.5877458, 1, 0, 0.7019608, 1,
1.21071, 1.99028, -1.686134, 1, 0, 0.6941177, 1,
1.212749, 1.612809, 1.644161, 1, 0, 0.6901961, 1,
1.215333, -1.181645, 3.497819, 1, 0, 0.682353, 1,
1.2207, 0.0474691, 2.06774, 1, 0, 0.6784314, 1,
1.224968, -1.116654, 1.762355, 1, 0, 0.6705883, 1,
1.225312, -1.083261, 2.688584, 1, 0, 0.6666667, 1,
1.227954, 0.4669093, 0.764433, 1, 0, 0.6588235, 1,
1.228326, -1.22148, 2.882495, 1, 0, 0.654902, 1,
1.230845, 2.566645, -0.2728916, 1, 0, 0.6470588, 1,
1.24278, -0.7968734, 0.2469527, 1, 0, 0.6431373, 1,
1.244069, 0.3450864, 1.605714, 1, 0, 0.6352941, 1,
1.24983, 0.15534, 1.34519, 1, 0, 0.6313726, 1,
1.253415, 1.096786, 0.7810697, 1, 0, 0.6235294, 1,
1.266514, -0.1299117, 1.107025, 1, 0, 0.6196079, 1,
1.272998, -1.429913, 1.578526, 1, 0, 0.6117647, 1,
1.28209, -0.9987587, 1.423002, 1, 0, 0.6078432, 1,
1.290807, 0.2035158, 0.2104672, 1, 0, 0.6, 1,
1.295984, 0.586353, 1.544117, 1, 0, 0.5921569, 1,
1.300945, -0.7226024, 3.301214, 1, 0, 0.5882353, 1,
1.304636, -0.7137938, 1.370352, 1, 0, 0.5803922, 1,
1.307433, 0.6279764, 2.915564, 1, 0, 0.5764706, 1,
1.307536, -0.09129364, 2.91567, 1, 0, 0.5686275, 1,
1.309982, -0.6284444, 2.074236, 1, 0, 0.5647059, 1,
1.313565, 1.394572, 0.1655715, 1, 0, 0.5568628, 1,
1.315462, 0.3301652, 0.7838075, 1, 0, 0.5529412, 1,
1.319529, -0.3177184, 1.405075, 1, 0, 0.5450981, 1,
1.319613, -0.3061843, 3.156997, 1, 0, 0.5411765, 1,
1.322113, -0.5021455, 3.575838, 1, 0, 0.5333334, 1,
1.329247, 0.6586806, 0.1562416, 1, 0, 0.5294118, 1,
1.335526, 0.1827432, 3.293109, 1, 0, 0.5215687, 1,
1.340438, -0.8097562, 2.232033, 1, 0, 0.5176471, 1,
1.357738, 0.4508947, 0.8392833, 1, 0, 0.509804, 1,
1.358052, 1.221661, 0.05515492, 1, 0, 0.5058824, 1,
1.362725, -1.006559, 0.5025899, 1, 0, 0.4980392, 1,
1.369587, 0.6763775, -0.270482, 1, 0, 0.4901961, 1,
1.374539, 0.4597914, 2.735917, 1, 0, 0.4862745, 1,
1.383574, -0.9913974, 1.674309, 1, 0, 0.4784314, 1,
1.392032, -0.4581038, 1.466399, 1, 0, 0.4745098, 1,
1.403945, -1.214645, 1.749957, 1, 0, 0.4666667, 1,
1.404793, -1.067098, 1.825865, 1, 0, 0.4627451, 1,
1.41213, 0.8615569, 2.632084, 1, 0, 0.454902, 1,
1.418193, -1.31998, 2.620994, 1, 0, 0.4509804, 1,
1.423044, -2.277203, 3.466211, 1, 0, 0.4431373, 1,
1.430584, -0.4679116, 0.833098, 1, 0, 0.4392157, 1,
1.432404, 0.9010665, 0.2076158, 1, 0, 0.4313726, 1,
1.439688, 0.7462267, 1.25949, 1, 0, 0.427451, 1,
1.441518, -0.7896711, 2.217259, 1, 0, 0.4196078, 1,
1.44588, 0.04374363, 2.718431, 1, 0, 0.4156863, 1,
1.449892, 0.4914955, 1.119015, 1, 0, 0.4078431, 1,
1.450871, 0.4502817, 1.348056, 1, 0, 0.4039216, 1,
1.452382, 1.034107, -0.5124656, 1, 0, 0.3960784, 1,
1.468026, 0.6192138, 0.5537627, 1, 0, 0.3882353, 1,
1.469849, 1.694827, -0.2563657, 1, 0, 0.3843137, 1,
1.477193, -0.2504694, 0.7808446, 1, 0, 0.3764706, 1,
1.477564, -0.3616871, 1.371501, 1, 0, 0.372549, 1,
1.503633, 0.7809473, 1.024275, 1, 0, 0.3647059, 1,
1.507406, 0.8221178, 0.4969811, 1, 0, 0.3607843, 1,
1.511315, -0.1235784, 1.015341, 1, 0, 0.3529412, 1,
1.534311, 0.4846027, 1.421183, 1, 0, 0.3490196, 1,
1.54473, -0.9449479, 1.509628, 1, 0, 0.3411765, 1,
1.549249, 0.4870626, -0.09401686, 1, 0, 0.3372549, 1,
1.551729, -1.043145, 2.358849, 1, 0, 0.3294118, 1,
1.558315, -1.950842, 1.373914, 1, 0, 0.3254902, 1,
1.567516, -1.447039, 2.47587, 1, 0, 0.3176471, 1,
1.575234, 0.6151195, 2.169602, 1, 0, 0.3137255, 1,
1.591063, 1.507961, -0.1664403, 1, 0, 0.3058824, 1,
1.592223, 1.090247, 2.40462, 1, 0, 0.2980392, 1,
1.603195, 0.784144, -1.490472, 1, 0, 0.2941177, 1,
1.605029, -1.251998, 2.933902, 1, 0, 0.2862745, 1,
1.613406, 0.9236688, 0.9438347, 1, 0, 0.282353, 1,
1.614563, -1.416346, 4.02714, 1, 0, 0.2745098, 1,
1.615453, 2.023456, -1.333574, 1, 0, 0.2705882, 1,
1.61661, -1.709939, 4.142387, 1, 0, 0.2627451, 1,
1.651385, 0.6864317, 1.310223, 1, 0, 0.2588235, 1,
1.666006, -0.3714427, 1.590111, 1, 0, 0.2509804, 1,
1.669269, -1.097313, 3.374602, 1, 0, 0.2470588, 1,
1.698956, -0.4150551, 2.144629, 1, 0, 0.2392157, 1,
1.721824, -0.9514642, 2.439872, 1, 0, 0.2352941, 1,
1.77994, -0.5486792, 0.8263464, 1, 0, 0.227451, 1,
1.800473, -1.437319, 1.927683, 1, 0, 0.2235294, 1,
1.843204, 0.9496655, 2.992214, 1, 0, 0.2156863, 1,
1.863036, -0.665372, 2.965117, 1, 0, 0.2117647, 1,
1.863267, 0.1269481, 2.28648, 1, 0, 0.2039216, 1,
1.865854, -1.259815, 2.121775, 1, 0, 0.1960784, 1,
1.874472, 0.6260413, 3.977926, 1, 0, 0.1921569, 1,
1.911636, 0.205117, 1.775056, 1, 0, 0.1843137, 1,
1.926571, -0.01268773, 0.4209317, 1, 0, 0.1803922, 1,
1.928293, -1.237955, 2.189969, 1, 0, 0.172549, 1,
1.939032, 1.541488, 2.476073, 1, 0, 0.1686275, 1,
1.942915, -1.056753, 1.614529, 1, 0, 0.1607843, 1,
1.951059, -0.4923474, 2.767581, 1, 0, 0.1568628, 1,
1.992665, -1.516098, 1.774334, 1, 0, 0.1490196, 1,
2.022176, 0.8878546, 0.2060379, 1, 0, 0.145098, 1,
2.034196, 0.6535124, 1.342254, 1, 0, 0.1372549, 1,
2.037951, -0.7680065, 0.7904529, 1, 0, 0.1333333, 1,
2.046986, 0.347628, 0.2809379, 1, 0, 0.1254902, 1,
2.059152, -2.869317, 2.377229, 1, 0, 0.1215686, 1,
2.073218, 1.254403, 0.8901758, 1, 0, 0.1137255, 1,
2.091859, -0.6178375, 3.398013, 1, 0, 0.1098039, 1,
2.108207, 1.273423, 3.209246, 1, 0, 0.1019608, 1,
2.138762, 0.5939296, -0.5198055, 1, 0, 0.09411765, 1,
2.217675, 0.4897244, 1.702249, 1, 0, 0.09019608, 1,
2.236905, 0.9064194, 1.676237, 1, 0, 0.08235294, 1,
2.258331, -0.8466741, 0.5230947, 1, 0, 0.07843138, 1,
2.346997, 0.2620881, 4.057462, 1, 0, 0.07058824, 1,
2.347649, -1.467269, 2.393722, 1, 0, 0.06666667, 1,
2.414364, -0.09715213, 2.360721, 1, 0, 0.05882353, 1,
2.418945, 0.2499602, 1.28531, 1, 0, 0.05490196, 1,
2.485005, 0.3633074, 0.757749, 1, 0, 0.04705882, 1,
2.516793, 0.1838426, 1.814327, 1, 0, 0.04313726, 1,
2.549226, -0.4416176, 1.708506, 1, 0, 0.03529412, 1,
2.651991, -1.329369, 2.688589, 1, 0, 0.03137255, 1,
2.673934, 0.2102403, 0.6304121, 1, 0, 0.02352941, 1,
2.769759, 0.7034578, -0.8204262, 1, 0, 0.01960784, 1,
2.821528, -0.5077784, 1.454809, 1, 0, 0.01176471, 1,
2.867923, -1.127864, 1.703939, 1, 0, 0.007843138, 1
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
-0.2267201, -5.056664, -6.68495, 0, -0.5, 0.5, 0.5,
-0.2267201, -5.056664, -6.68495, 1, -0.5, 0.5, 0.5,
-0.2267201, -5.056664, -6.68495, 1, 1.5, 0.5, 0.5,
-0.2267201, -5.056664, -6.68495, 0, 1.5, 0.5, 0.5
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
-4.370448, 0.02073693, -6.68495, 0, -0.5, 0.5, 0.5,
-4.370448, 0.02073693, -6.68495, 1, -0.5, 0.5, 0.5,
-4.370448, 0.02073693, -6.68495, 1, 1.5, 0.5, 0.5,
-4.370448, 0.02073693, -6.68495, 0, 1.5, 0.5, 0.5
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
-4.370448, -5.056664, 0.3035526, 0, -0.5, 0.5, 0.5,
-4.370448, -5.056664, 0.3035526, 1, -0.5, 0.5, 0.5,
-4.370448, -5.056664, 0.3035526, 1, 1.5, 0.5, 0.5,
-4.370448, -5.056664, 0.3035526, 0, 1.5, 0.5, 0.5
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
-3, -3.884957, -5.072218,
2, -3.884957, -5.072218,
-3, -3.884957, -5.072218,
-3, -4.080241, -5.341007,
-2, -3.884957, -5.072218,
-2, -4.080241, -5.341007,
-1, -3.884957, -5.072218,
-1, -4.080241, -5.341007,
0, -3.884957, -5.072218,
0, -4.080241, -5.341007,
1, -3.884957, -5.072218,
1, -4.080241, -5.341007,
2, -3.884957, -5.072218,
2, -4.080241, -5.341007
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
-3, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
-3, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
-3, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
-3, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5,
-2, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
-2, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
-2, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
-2, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5,
-1, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
-1, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
-1, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
-1, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5,
0, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
0, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
0, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
0, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5,
1, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
1, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
1, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
1, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5,
2, -4.47081, -5.878584, 0, -0.5, 0.5, 0.5,
2, -4.47081, -5.878584, 1, -0.5, 0.5, 0.5,
2, -4.47081, -5.878584, 1, 1.5, 0.5, 0.5,
2, -4.47081, -5.878584, 0, 1.5, 0.5, 0.5
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
-3.414203, -2, -5.072218,
-3.414203, 2, -5.072218,
-3.414203, -2, -5.072218,
-3.573577, -2, -5.341007,
-3.414203, 0, -5.072218,
-3.573577, 0, -5.341007,
-3.414203, 2, -5.072218,
-3.573577, 2, -5.341007
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
-3.892325, -2, -5.878584, 0, -0.5, 0.5, 0.5,
-3.892325, -2, -5.878584, 1, -0.5, 0.5, 0.5,
-3.892325, -2, -5.878584, 1, 1.5, 0.5, 0.5,
-3.892325, -2, -5.878584, 0, 1.5, 0.5, 0.5,
-3.892325, 0, -5.878584, 0, -0.5, 0.5, 0.5,
-3.892325, 0, -5.878584, 1, -0.5, 0.5, 0.5,
-3.892325, 0, -5.878584, 1, 1.5, 0.5, 0.5,
-3.892325, 0, -5.878584, 0, 1.5, 0.5, 0.5,
-3.892325, 2, -5.878584, 0, -0.5, 0.5, 0.5,
-3.892325, 2, -5.878584, 1, -0.5, 0.5, 0.5,
-3.892325, 2, -5.878584, 1, 1.5, 0.5, 0.5,
-3.892325, 2, -5.878584, 0, 1.5, 0.5, 0.5
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
-3.414203, -3.884957, -4,
-3.414203, -3.884957, 4,
-3.414203, -3.884957, -4,
-3.573577, -4.080241, -4,
-3.414203, -3.884957, -2,
-3.573577, -4.080241, -2,
-3.414203, -3.884957, 0,
-3.573577, -4.080241, 0,
-3.414203, -3.884957, 2,
-3.573577, -4.080241, 2,
-3.414203, -3.884957, 4,
-3.573577, -4.080241, 4
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
-3.892325, -4.47081, -4, 0, -0.5, 0.5, 0.5,
-3.892325, -4.47081, -4, 1, -0.5, 0.5, 0.5,
-3.892325, -4.47081, -4, 1, 1.5, 0.5, 0.5,
-3.892325, -4.47081, -4, 0, 1.5, 0.5, 0.5,
-3.892325, -4.47081, -2, 0, -0.5, 0.5, 0.5,
-3.892325, -4.47081, -2, 1, -0.5, 0.5, 0.5,
-3.892325, -4.47081, -2, 1, 1.5, 0.5, 0.5,
-3.892325, -4.47081, -2, 0, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 0, 0, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 0, 1, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 0, 1, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 0, 0, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 2, 0, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 2, 1, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 2, 1, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 2, 0, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 4, 0, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 4, 1, -0.5, 0.5, 0.5,
-3.892325, -4.47081, 4, 1, 1.5, 0.5, 0.5,
-3.892325, -4.47081, 4, 0, 1.5, 0.5, 0.5
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
-3.414203, -3.884957, -5.072218,
-3.414203, 3.92643, -5.072218,
-3.414203, -3.884957, 5.679324,
-3.414203, 3.92643, 5.679324,
-3.414203, -3.884957, -5.072218,
-3.414203, -3.884957, 5.679324,
-3.414203, 3.92643, -5.072218,
-3.414203, 3.92643, 5.679324,
-3.414203, -3.884957, -5.072218,
2.960763, -3.884957, -5.072218,
-3.414203, -3.884957, 5.679324,
2.960763, -3.884957, 5.679324,
-3.414203, 3.92643, -5.072218,
2.960763, 3.92643, -5.072218,
-3.414203, 3.92643, 5.679324,
2.960763, 3.92643, 5.679324,
2.960763, -3.884957, -5.072218,
2.960763, 3.92643, -5.072218,
2.960763, -3.884957, 5.679324,
2.960763, 3.92643, 5.679324,
2.960763, -3.884957, -5.072218,
2.960763, -3.884957, 5.679324,
2.960763, 3.92643, -5.072218,
2.960763, 3.92643, 5.679324
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
var radius = 7.87062;
var distance = 35.01728;
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
mvMatrix.translate( 0.2267201, -0.02073693, -0.3035526 );
mvMatrix.scale( 1.334889, 1.089418, 0.7915022 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.01728);
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
Claudetite<-read.table("Claudetite.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.321363, 0.6123891, -1.466482, 0, 0, 1, 1, 1,
-3.307456, -0.1951607, -0.5455505, 1, 0, 0, 1, 1,
-2.977428, 1.863059, -2.137925, 1, 0, 0, 1, 1,
-2.833369, -0.4307283, -1.617223, 1, 0, 0, 1, 1,
-2.788587, -1.414964, -2.485953, 1, 0, 0, 1, 1,
-2.778854, 1.101436, -1.015727, 1, 0, 0, 1, 1,
-2.759367, 0.8672306, -2.228945, 0, 0, 0, 1, 1,
-2.645184, -0.06321853, -2.101954, 0, 0, 0, 1, 1,
-2.599753, -0.0689189, -1.411256, 0, 0, 0, 1, 1,
-2.533169, 0.3288634, -1.461655, 0, 0, 0, 1, 1,
-2.420927, -0.2190669, -2.02933, 0, 0, 0, 1, 1,
-2.371434, -1.40747, -2.756523, 0, 0, 0, 1, 1,
-2.359286, 0.08424179, -1.546839, 0, 0, 0, 1, 1,
-2.32026, 1.85355, -1.456225, 1, 1, 1, 1, 1,
-2.30449, -0.002890381, -1.023075, 1, 1, 1, 1, 1,
-2.280685, 0.7668804, -2.010184, 1, 1, 1, 1, 1,
-2.252757, 0.01089988, 0.1944535, 1, 1, 1, 1, 1,
-2.175157, -0.01739202, -0.6362172, 1, 1, 1, 1, 1,
-2.147619, -0.6258137, 0.4620689, 1, 1, 1, 1, 1,
-2.129298, -0.5136702, -1.015939, 1, 1, 1, 1, 1,
-2.103383, 1.295077, -1.182008, 1, 1, 1, 1, 1,
-2.098881, -0.2197265, -1.645457, 1, 1, 1, 1, 1,
-2.098224, -1.200462, -0.7953053, 1, 1, 1, 1, 1,
-2.079722, 1.490464, -3.085802, 1, 1, 1, 1, 1,
-2.051227, -0.317552, -2.652638, 1, 1, 1, 1, 1,
-2.046616, 1.897134, -0.9779626, 1, 1, 1, 1, 1,
-2.04474, 0.5084209, -2.049694, 1, 1, 1, 1, 1,
-2.018322, -0.1175444, -1.753188, 1, 1, 1, 1, 1,
-2.007694, 1.261178, -0.6702955, 0, 0, 1, 1, 1,
-1.998374, 0.01796364, -1.370228, 1, 0, 0, 1, 1,
-1.971321, -0.5160062, -3.216784, 1, 0, 0, 1, 1,
-1.94565, -0.07321686, -0.5620114, 1, 0, 0, 1, 1,
-1.935141, -0.9706743, -1.666519, 1, 0, 0, 1, 1,
-1.932679, -0.02791653, -1.593099, 1, 0, 0, 1, 1,
-1.912511, 0.7328399, -1.759751, 0, 0, 0, 1, 1,
-1.893237, -0.01593732, -1.925046, 0, 0, 0, 1, 1,
-1.892448, -0.2072993, 0.1071878, 0, 0, 0, 1, 1,
-1.872608, 0.5595612, -2.036323, 0, 0, 0, 1, 1,
-1.870188, -0.5414687, -4.155087, 0, 0, 0, 1, 1,
-1.863054, -1.958387, -2.492386, 0, 0, 0, 1, 1,
-1.86082, 0.9932044, 1.033179, 0, 0, 0, 1, 1,
-1.859354, -0.9812542, -0.5245988, 1, 1, 1, 1, 1,
-1.851573, 1.321468, -0.2297287, 1, 1, 1, 1, 1,
-1.84262, 0.5864531, 0.06709789, 1, 1, 1, 1, 1,
-1.83289, -0.8872074, -0.4985574, 1, 1, 1, 1, 1,
-1.811482, 1.158639, -0.9152421, 1, 1, 1, 1, 1,
-1.810222, -0.36377, -2.274491, 1, 1, 1, 1, 1,
-1.807218, -0.1407052, -3.255849, 1, 1, 1, 1, 1,
-1.806295, 0.4898346, -1.269355, 1, 1, 1, 1, 1,
-1.805007, -0.07635669, -1.091134, 1, 1, 1, 1, 1,
-1.801989, 0.4031938, -0.8036382, 1, 1, 1, 1, 1,
-1.799593, -0.1406959, -1.898118, 1, 1, 1, 1, 1,
-1.77948, 0.04855793, -2.48198, 1, 1, 1, 1, 1,
-1.778483, -0.6821259, -0.5269422, 1, 1, 1, 1, 1,
-1.75266, 1.07494, -1.132338, 1, 1, 1, 1, 1,
-1.748834, 1.722999, -2.123271, 1, 1, 1, 1, 1,
-1.726741, 0.7912814, -1.941107, 0, 0, 1, 1, 1,
-1.70153, -0.2536586, -1.844654, 1, 0, 0, 1, 1,
-1.695092, 0.3193662, -1.752233, 1, 0, 0, 1, 1,
-1.681339, -1.692017, -2.39039, 1, 0, 0, 1, 1,
-1.677115, 0.1108126, -2.993941, 1, 0, 0, 1, 1,
-1.658091, 0.1014093, 0.2416046, 1, 0, 0, 1, 1,
-1.650557, 0.1613553, -0.7622393, 0, 0, 0, 1, 1,
-1.639218, -0.8999716, -1.009527, 0, 0, 0, 1, 1,
-1.618489, 0.7626691, -1.186897, 0, 0, 0, 1, 1,
-1.617982, 0.1662197, -2.165921, 0, 0, 0, 1, 1,
-1.616023, -0.9050855, -1.043344, 0, 0, 0, 1, 1,
-1.611744, -0.02553084, -0.4097419, 0, 0, 0, 1, 1,
-1.608353, -0.2500918, -2.300172, 0, 0, 0, 1, 1,
-1.602311, -0.122069, -1.598163, 1, 1, 1, 1, 1,
-1.601082, 1.507095, -1.88264, 1, 1, 1, 1, 1,
-1.589932, 1.349684, 1.158698, 1, 1, 1, 1, 1,
-1.586605, 0.4074025, -1.396179, 1, 1, 1, 1, 1,
-1.577373, -1.371717, -1.756335, 1, 1, 1, 1, 1,
-1.563084, 0.6378061, 0.1309533, 1, 1, 1, 1, 1,
-1.560859, 0.8580856, -2.46429, 1, 1, 1, 1, 1,
-1.560768, 1.722445, -0.7503117, 1, 1, 1, 1, 1,
-1.555611, -0.1560912, -1.128944, 1, 1, 1, 1, 1,
-1.548898, 0.2598769, -1.271265, 1, 1, 1, 1, 1,
-1.548508, -0.8445383, -3.10513, 1, 1, 1, 1, 1,
-1.547379, -0.2566047, -1.929395, 1, 1, 1, 1, 1,
-1.546968, 0.4840056, -1.859556, 1, 1, 1, 1, 1,
-1.530837, -0.2881932, -0.05359191, 1, 1, 1, 1, 1,
-1.517001, 0.09414384, -2.808751, 1, 1, 1, 1, 1,
-1.513739, -0.2237677, -1.263038, 0, 0, 1, 1, 1,
-1.499958, 0.6964269, -0.2093682, 1, 0, 0, 1, 1,
-1.497246, -0.2029632, -1.718604, 1, 0, 0, 1, 1,
-1.496686, -0.1319038, -2.834847, 1, 0, 0, 1, 1,
-1.49339, 0.2414502, -0.3894117, 1, 0, 0, 1, 1,
-1.479115, -0.6293436, -0.4205327, 1, 0, 0, 1, 1,
-1.4714, 0.241261, -0.3081995, 0, 0, 0, 1, 1,
-1.469948, -0.1663449, -1.992841, 0, 0, 0, 1, 1,
-1.463281, 1.020958, -0.1898505, 0, 0, 0, 1, 1,
-1.458319, -0.2199188, -0.5032553, 0, 0, 0, 1, 1,
-1.447292, 0.04177377, -1.585727, 0, 0, 0, 1, 1,
-1.43654, -0.8201885, -0.7912126, 0, 0, 0, 1, 1,
-1.435919, 0.183797, -3.264015, 0, 0, 0, 1, 1,
-1.42864, 0.4953762, -0.7959664, 1, 1, 1, 1, 1,
-1.426001, 0.1762466, -1.073606, 1, 1, 1, 1, 1,
-1.423429, -0.4877078, -2.431278, 1, 1, 1, 1, 1,
-1.421346, -0.02680288, -1.810154, 1, 1, 1, 1, 1,
-1.418038, 0.9259824, 0.3558809, 1, 1, 1, 1, 1,
-1.417778, -0.3121628, -1.78243, 1, 1, 1, 1, 1,
-1.415321, 0.4369209, -0.7053607, 1, 1, 1, 1, 1,
-1.398802, -1.643364, -2.491437, 1, 1, 1, 1, 1,
-1.388873, -0.1394806, -1.432817, 1, 1, 1, 1, 1,
-1.384879, 0.2247502, 0.215089, 1, 1, 1, 1, 1,
-1.380248, -1.2341, -1.500525, 1, 1, 1, 1, 1,
-1.380207, 2.895186, 0.09373749, 1, 1, 1, 1, 1,
-1.367855, -0.6888289, -2.004923, 1, 1, 1, 1, 1,
-1.365558, -0.7031559, -0.6843635, 1, 1, 1, 1, 1,
-1.364789, -0.5826026, -0.9160005, 1, 1, 1, 1, 1,
-1.351741, 0.1255155, -0.190363, 0, 0, 1, 1, 1,
-1.331389, 0.9694971, -3.982247, 1, 0, 0, 1, 1,
-1.324266, 1.500497, 0.7514908, 1, 0, 0, 1, 1,
-1.323945, -0.9686518, -3.98701, 1, 0, 0, 1, 1,
-1.322048, -0.2853639, -1.935035, 1, 0, 0, 1, 1,
-1.320471, -0.6818085, -0.9198102, 1, 0, 0, 1, 1,
-1.310079, 0.4780355, -2.773477, 0, 0, 0, 1, 1,
-1.304021, -0.1589618, -2.398927, 0, 0, 0, 1, 1,
-1.301244, 0.9611651, -0.5968757, 0, 0, 0, 1, 1,
-1.282393, 1.946726, 1.276465, 0, 0, 0, 1, 1,
-1.282098, -0.2690159, -1.53098, 0, 0, 0, 1, 1,
-1.281811, -0.5470002, -1.993285, 0, 0, 0, 1, 1,
-1.279832, 0.2424927, -0.8458598, 0, 0, 0, 1, 1,
-1.272771, -0.8438659, -2.784259, 1, 1, 1, 1, 1,
-1.271727, 0.9370762, -0.7687737, 1, 1, 1, 1, 1,
-1.268714, 0.3130184, -1.224661, 1, 1, 1, 1, 1,
-1.263151, 0.8419066, -1.819557, 1, 1, 1, 1, 1,
-1.262455, 0.3527122, -2.258505, 1, 1, 1, 1, 1,
-1.260503, 0.2072862, -1.407807, 1, 1, 1, 1, 1,
-1.259118, 1.130278, -0.7842217, 1, 1, 1, 1, 1,
-1.249827, 0.5760434, -1.480258, 1, 1, 1, 1, 1,
-1.248276, 1.801521, -0.09542286, 1, 1, 1, 1, 1,
-1.23242, 0.3882756, -1.545747, 1, 1, 1, 1, 1,
-1.222935, 0.115823, -1.251516, 1, 1, 1, 1, 1,
-1.212459, -1.032003, -3.076738, 1, 1, 1, 1, 1,
-1.211876, 0.3291849, -1.152471, 1, 1, 1, 1, 1,
-1.210003, -1.23703, -0.003009577, 1, 1, 1, 1, 1,
-1.202356, 0.474042, -0.6644056, 1, 1, 1, 1, 1,
-1.19822, 0.2190899, 0.4428132, 0, 0, 1, 1, 1,
-1.196935, 0.5616041, -0.179979, 1, 0, 0, 1, 1,
-1.187517, 0.7886381, -1.165582, 1, 0, 0, 1, 1,
-1.179795, -0.3736496, -2.023028, 1, 0, 0, 1, 1,
-1.175395, 0.3566082, -1.514539, 1, 0, 0, 1, 1,
-1.164727, -0.01323889, -0.6483846, 1, 0, 0, 1, 1,
-1.160673, -0.9221205, -3.218558, 0, 0, 0, 1, 1,
-1.15642, 1.540123, -2.984769, 0, 0, 0, 1, 1,
-1.153276, 0.3058888, -1.234907, 0, 0, 0, 1, 1,
-1.15283, 1.445898, -1.910237, 0, 0, 0, 1, 1,
-1.144326, 0.4950399, -0.6765184, 0, 0, 0, 1, 1,
-1.143598, 0.006383524, -1.403415, 0, 0, 0, 1, 1,
-1.143116, -0.3575879, -1.866312, 0, 0, 0, 1, 1,
-1.141613, -0.4630065, -3.296226, 1, 1, 1, 1, 1,
-1.130439, 0.6784207, -0.6780723, 1, 1, 1, 1, 1,
-1.124056, 0.3045768, -1.323554, 1, 1, 1, 1, 1,
-1.122706, -0.3469368, -3.2632, 1, 1, 1, 1, 1,
-1.121413, -0.7764416, -0.8599675, 1, 1, 1, 1, 1,
-1.121379, -0.8621686, -0.3380809, 1, 1, 1, 1, 1,
-1.119667, -0.6114128, -2.837818, 1, 1, 1, 1, 1,
-1.11752, 1.437383, 0.6107554, 1, 1, 1, 1, 1,
-1.113044, 0.1866368, -1.189218, 1, 1, 1, 1, 1,
-1.110592, -0.1279707, -1.506176, 1, 1, 1, 1, 1,
-1.086507, 0.1217323, -0.04862543, 1, 1, 1, 1, 1,
-1.084898, -0.1798441, -1.540317, 1, 1, 1, 1, 1,
-1.081281, 0.9510313, -1.604712, 1, 1, 1, 1, 1,
-1.077571, 0.8842115, -1.893077, 1, 1, 1, 1, 1,
-1.074906, -2.215947, -4.553017, 1, 1, 1, 1, 1,
-1.068562, -1.646397, -2.412218, 0, 0, 1, 1, 1,
-1.065924, 1.552121, -0.9466403, 1, 0, 0, 1, 1,
-1.065884, 0.6187211, -1.778451, 1, 0, 0, 1, 1,
-1.052588, -0.03006939, -1.967978, 1, 0, 0, 1, 1,
-1.0509, -1.578725, -2.779827, 1, 0, 0, 1, 1,
-1.049965, 0.3145882, 0.4275141, 1, 0, 0, 1, 1,
-1.049493, -0.7591006, -0.7925386, 0, 0, 0, 1, 1,
-1.044922, 0.3683301, -2.010105, 0, 0, 0, 1, 1,
-1.038347, 0.04014983, -0.900323, 0, 0, 0, 1, 1,
-1.031083, -0.1379365, -2.139899, 0, 0, 0, 1, 1,
-1.030409, -0.1810627, -3.050111, 0, 0, 0, 1, 1,
-1.025261, 0.4771436, -0.1933307, 0, 0, 0, 1, 1,
-1.023173, 2.423103, -0.2587793, 0, 0, 0, 1, 1,
-1.015805, -0.4286101, -2.389308, 1, 1, 1, 1, 1,
-1.015767, 0.7666801, -2.004687, 1, 1, 1, 1, 1,
-1.003489, -0.4539532, -3.91376, 1, 1, 1, 1, 1,
-0.9990334, -0.01791025, -1.754383, 1, 1, 1, 1, 1,
-0.9919315, 0.4012315, -0.4982634, 1, 1, 1, 1, 1,
-0.9919224, -0.5178999, -1.219549, 1, 1, 1, 1, 1,
-0.982071, -0.01875126, 0.6344963, 1, 1, 1, 1, 1,
-0.9736274, 0.08206014, -1.220052, 1, 1, 1, 1, 1,
-0.9683838, 1.00072, 0.1057893, 1, 1, 1, 1, 1,
-0.9676384, 0.9835279, -0.1194406, 1, 1, 1, 1, 1,
-0.9620001, -0.8862805, -2.324739, 1, 1, 1, 1, 1,
-0.9545037, 0.726858, -0.09198323, 1, 1, 1, 1, 1,
-0.9526416, -0.2098852, -3.100738, 1, 1, 1, 1, 1,
-0.9405434, -1.160603, -3.318581, 1, 1, 1, 1, 1,
-0.938233, -2.200886, -0.8552021, 1, 1, 1, 1, 1,
-0.9377713, -0.7065456, -0.2085951, 0, 0, 1, 1, 1,
-0.9313219, -0.3711808, -1.958198, 1, 0, 0, 1, 1,
-0.9278638, 0.6795279, -1.036303, 1, 0, 0, 1, 1,
-0.9266733, -0.3388858, -1.560449, 1, 0, 0, 1, 1,
-0.9241571, -0.2153071, -0.4505227, 1, 0, 0, 1, 1,
-0.9232553, -0.4110217, -3.635814, 1, 0, 0, 1, 1,
-0.913255, -0.5703949, -1.635425, 0, 0, 0, 1, 1,
-0.9130229, 0.9049991, -0.9155158, 0, 0, 0, 1, 1,
-0.900785, 1.084159, -0.3517745, 0, 0, 0, 1, 1,
-0.8994967, -0.4355417, -1.523636, 0, 0, 0, 1, 1,
-0.8992485, -0.7704328, -1.40723, 0, 0, 0, 1, 1,
-0.8979055, -0.5814112, -2.534441, 0, 0, 0, 1, 1,
-0.8873649, 0.4636185, 0.0878155, 0, 0, 0, 1, 1,
-0.8871831, 1.708942, -0.9701056, 1, 1, 1, 1, 1,
-0.8819192, 0.4445603, -1.494527, 1, 1, 1, 1, 1,
-0.8803629, -1.280499, -2.427232, 1, 1, 1, 1, 1,
-0.8780777, -1.394383, -1.689105, 1, 1, 1, 1, 1,
-0.8776937, -1.789587, -1.863286, 1, 1, 1, 1, 1,
-0.8740703, 0.9468725, -0.3823784, 1, 1, 1, 1, 1,
-0.8737615, 1.155006, -0.1833475, 1, 1, 1, 1, 1,
-0.8722045, -0.4636914, -2.094213, 1, 1, 1, 1, 1,
-0.8664868, 0.5270329, -0.941546, 1, 1, 1, 1, 1,
-0.8581308, -1.266474, -3.143762, 1, 1, 1, 1, 1,
-0.8575626, -2.003853, -2.456226, 1, 1, 1, 1, 1,
-0.8536368, -0.7022116, -2.59637, 1, 1, 1, 1, 1,
-0.849555, -0.1461028, -2.619912, 1, 1, 1, 1, 1,
-0.8449626, -1.087198, -1.700732, 1, 1, 1, 1, 1,
-0.8293577, -0.6017715, -3.209805, 1, 1, 1, 1, 1,
-0.8280001, 0.9457725, 0.08363621, 0, 0, 1, 1, 1,
-0.8267497, -0.8971001, -2.253558, 1, 0, 0, 1, 1,
-0.8244084, -0.9739466, -3.764866, 1, 0, 0, 1, 1,
-0.820141, 0.422939, -3.008874, 1, 0, 0, 1, 1,
-0.818283, -1.664568, -3.457865, 1, 0, 0, 1, 1,
-0.8159841, -0.07481056, -1.975045, 1, 0, 0, 1, 1,
-0.8143684, -0.136325, -1.068163, 0, 0, 0, 1, 1,
-0.8073888, 0.3287954, 0.4015195, 0, 0, 0, 1, 1,
-0.8060547, -1.244806, -1.553205, 0, 0, 0, 1, 1,
-0.8030524, 1.272224, -1.195491, 0, 0, 0, 1, 1,
-0.800299, -0.3634643, -2.280225, 0, 0, 0, 1, 1,
-0.7954669, 0.6614894, -0.8907266, 0, 0, 0, 1, 1,
-0.7942557, 0.8511358, -0.9784123, 0, 0, 0, 1, 1,
-0.7866498, 0.1433966, -1.589042, 1, 1, 1, 1, 1,
-0.785066, 0.4924881, -0.2575061, 1, 1, 1, 1, 1,
-0.7801059, -0.9353023, -2.619578, 1, 1, 1, 1, 1,
-0.7799557, -0.004095543, -3.223485, 1, 1, 1, 1, 1,
-0.7787085, 1.665455, 0.9830958, 1, 1, 1, 1, 1,
-0.7784993, -0.6982862, -2.020942, 1, 1, 1, 1, 1,
-0.7780543, 0.9967142, -1.250822, 1, 1, 1, 1, 1,
-0.7769189, -2.486084, -3.186847, 1, 1, 1, 1, 1,
-0.7719898, -0.4495682, 0.3694707, 1, 1, 1, 1, 1,
-0.7634769, 0.894217, -1.470538, 1, 1, 1, 1, 1,
-0.7630723, 0.03221551, -1.510705, 1, 1, 1, 1, 1,
-0.7567629, -0.6635853, -3.120269, 1, 1, 1, 1, 1,
-0.7565076, -0.7256629, -3.930363, 1, 1, 1, 1, 1,
-0.7517942, 1.749849, 1.395128, 1, 1, 1, 1, 1,
-0.7482249, 0.7613825, -0.2048463, 1, 1, 1, 1, 1,
-0.7474321, -1.431638, -0.7281321, 0, 0, 1, 1, 1,
-0.7452592, 0.009884349, -1.671925, 1, 0, 0, 1, 1,
-0.7332938, -0.3253386, -1.064861, 1, 0, 0, 1, 1,
-0.728806, -0.3036678, -1.827741, 1, 0, 0, 1, 1,
-0.7285556, 0.2232067, -0.949284, 1, 0, 0, 1, 1,
-0.7262433, 0.947573, -1.39345, 1, 0, 0, 1, 1,
-0.7244749, -0.03969672, -2.099078, 0, 0, 0, 1, 1,
-0.7206051, -1.304372, -4.329619, 0, 0, 0, 1, 1,
-0.7174071, -0.9359057, -2.698304, 0, 0, 0, 1, 1,
-0.7155415, -0.1494981, -1.7351, 0, 0, 0, 1, 1,
-0.7115923, -0.1018049, 0.7959707, 0, 0, 0, 1, 1,
-0.7085842, -0.8774195, -1.963131, 0, 0, 0, 1, 1,
-0.7083852, 2.936206, -1.522338, 0, 0, 0, 1, 1,
-0.7069176, -0.0399773, -0.9911248, 1, 1, 1, 1, 1,
-0.7032785, -1.645145, -1.820655, 1, 1, 1, 1, 1,
-0.6943734, 1.006565, 0.04563598, 1, 1, 1, 1, 1,
-0.6927367, -0.6687171, -1.742894, 1, 1, 1, 1, 1,
-0.6907847, 0.09044252, -1.564681, 1, 1, 1, 1, 1,
-0.6742129, -1.232609, -2.386167, 1, 1, 1, 1, 1,
-0.6735548, 1.492383, -0.7504248, 1, 1, 1, 1, 1,
-0.6704277, 0.4612868, -3.78618, 1, 1, 1, 1, 1,
-0.6695149, -1.390101, -2.124782, 1, 1, 1, 1, 1,
-0.6663575, 0.2503493, 0.1062423, 1, 1, 1, 1, 1,
-0.6656785, 1.296103, -0.4392556, 1, 1, 1, 1, 1,
-0.6654817, 0.6020296, -1.552369, 1, 1, 1, 1, 1,
-0.6624902, -0.6857921, -4.188107, 1, 1, 1, 1, 1,
-0.659337, 0.5141127, 0.6624339, 1, 1, 1, 1, 1,
-0.6586847, -2.069373, -3.405814, 1, 1, 1, 1, 1,
-0.6568756, 0.03795327, -0.3245439, 0, 0, 1, 1, 1,
-0.6568712, 0.09309628, -0.8262089, 1, 0, 0, 1, 1,
-0.6476256, -0.2357931, -0.07191303, 1, 0, 0, 1, 1,
-0.6474971, -0.9162655, -3.60027, 1, 0, 0, 1, 1,
-0.642003, 0.7550607, -1.650463, 1, 0, 0, 1, 1,
-0.6417888, -0.6630708, -3.394462, 1, 0, 0, 1, 1,
-0.6383032, -0.8439678, -2.35634, 0, 0, 0, 1, 1,
-0.6380916, 0.7874136, -2.05351, 0, 0, 0, 1, 1,
-0.6374413, 0.7967334, -1.141298, 0, 0, 0, 1, 1,
-0.6366516, 0.3049169, -0.3523458, 0, 0, 0, 1, 1,
-0.6331216, -1.735265, -3.949172, 0, 0, 0, 1, 1,
-0.632695, 0.3954761, -0.407916, 0, 0, 0, 1, 1,
-0.6291677, -0.611288, -1.544939, 0, 0, 0, 1, 1,
-0.6281641, 1.138374, -1.027636, 1, 1, 1, 1, 1,
-0.6264828, 0.5958479, 0.03365175, 1, 1, 1, 1, 1,
-0.6244943, -0.8315327, -1.748234, 1, 1, 1, 1, 1,
-0.6234035, 0.3154208, -1.203648, 1, 1, 1, 1, 1,
-0.6140205, -0.03396903, -0.8119282, 1, 1, 1, 1, 1,
-0.6137672, 0.79055, -1.108555, 1, 1, 1, 1, 1,
-0.6137502, -0.6267241, -2.556841, 1, 1, 1, 1, 1,
-0.6116824, -0.311639, -4.177453, 1, 1, 1, 1, 1,
-0.5998847, 0.6095158, -0.6278935, 1, 1, 1, 1, 1,
-0.5977365, -0.2719719, -2.743051, 1, 1, 1, 1, 1,
-0.5966541, 0.1259015, -1.13138, 1, 1, 1, 1, 1,
-0.5884637, 0.9928598, -1.841286, 1, 1, 1, 1, 1,
-0.5880274, 0.8280616, -0.02383977, 1, 1, 1, 1, 1,
-0.5879652, -0.0998093, -0.8828191, 1, 1, 1, 1, 1,
-0.578729, 0.02562417, -1.688123, 1, 1, 1, 1, 1,
-0.5785949, -0.5050035, -2.408993, 0, 0, 1, 1, 1,
-0.5781241, 0.8854573, 0.1058316, 1, 0, 0, 1, 1,
-0.5778663, 2.160826, 0.6235574, 1, 0, 0, 1, 1,
-0.5752069, 0.6298059, -0.4830387, 1, 0, 0, 1, 1,
-0.5738623, 0.4316941, -1.160554, 1, 0, 0, 1, 1,
-0.5713142, -0.3764717, -2.25927, 1, 0, 0, 1, 1,
-0.5708178, -0.981205, -2.347783, 0, 0, 0, 1, 1,
-0.5648984, -1.342338, -2.053533, 0, 0, 0, 1, 1,
-0.5639923, 0.5403812, -1.357095, 0, 0, 0, 1, 1,
-0.5638095, 0.8436147, -2.449422, 0, 0, 0, 1, 1,
-0.5569164, 1.635908, 0.2625884, 0, 0, 0, 1, 1,
-0.5531623, -0.4311491, -2.126595, 0, 0, 0, 1, 1,
-0.5494199, 0.2377762, -1.02196, 0, 0, 0, 1, 1,
-0.5448045, -0.2742193, -0.7125151, 1, 1, 1, 1, 1,
-0.5441321, 0.3270984, -0.2777344, 1, 1, 1, 1, 1,
-0.5435429, 1.854504, -0.305151, 1, 1, 1, 1, 1,
-0.5421551, 0.7047604, -0.2555853, 1, 1, 1, 1, 1,
-0.5416126, -1.934753, -2.791664, 1, 1, 1, 1, 1,
-0.5325249, -0.004455414, -1.200981, 1, 1, 1, 1, 1,
-0.5315289, 0.01620231, -0.3764255, 1, 1, 1, 1, 1,
-0.5302147, -0.8445553, -0.3036547, 1, 1, 1, 1, 1,
-0.5287361, 0.2411583, -2.234847, 1, 1, 1, 1, 1,
-0.5248346, 0.2707965, -1.193488, 1, 1, 1, 1, 1,
-0.5247972, 1.029378, 0.1031008, 1, 1, 1, 1, 1,
-0.5247531, 0.03864771, -1.861575, 1, 1, 1, 1, 1,
-0.5198809, -0.2531598, -2.199598, 1, 1, 1, 1, 1,
-0.5148657, -0.7910393, -2.288005, 1, 1, 1, 1, 1,
-0.5143287, -0.5868465, -2.1501, 1, 1, 1, 1, 1,
-0.4993748, 0.5596984, -1.017726, 0, 0, 1, 1, 1,
-0.499002, 0.005359162, -2.701979, 1, 0, 0, 1, 1,
-0.4777795, 0.3829649, 0.2422847, 1, 0, 0, 1, 1,
-0.4776309, -0.70897, -2.679387, 1, 0, 0, 1, 1,
-0.4762535, 0.5172241, -1.653837, 1, 0, 0, 1, 1,
-0.4742553, 0.7939788, 0.5264249, 1, 0, 0, 1, 1,
-0.4667583, -1.034983, -2.218799, 0, 0, 0, 1, 1,
-0.4571727, -0.1061801, -2.865954, 0, 0, 0, 1, 1,
-0.4487056, -0.8664359, -3.83549, 0, 0, 0, 1, 1,
-0.447963, 0.6951379, -1.664774, 0, 0, 0, 1, 1,
-0.4465704, 1.19321, -1.251269, 0, 0, 0, 1, 1,
-0.4463077, 1.368703, 1.41768, 0, 0, 0, 1, 1,
-0.440854, 0.7457926, -0.9296995, 0, 0, 0, 1, 1,
-0.4406735, -2.032803, -3.150481, 1, 1, 1, 1, 1,
-0.4266922, -0.4451574, -2.830389, 1, 1, 1, 1, 1,
-0.4221615, -0.684933, -2.10993, 1, 1, 1, 1, 1,
-0.4218877, 0.7308667, -0.1798092, 1, 1, 1, 1, 1,
-0.4200772, -0.5146569, -0.5850632, 1, 1, 1, 1, 1,
-0.4199271, -2.919894, -3.163473, 1, 1, 1, 1, 1,
-0.4195571, -0.4235967, -1.736025, 1, 1, 1, 1, 1,
-0.4181359, -0.6123725, -3.591336, 1, 1, 1, 1, 1,
-0.4169877, 0.1629789, -1.485472, 1, 1, 1, 1, 1,
-0.4163778, -0.8486968, -1.483739, 1, 1, 1, 1, 1,
-0.4091505, 0.136552, -1.47638, 1, 1, 1, 1, 1,
-0.4079179, -0.005705615, -2.332691, 1, 1, 1, 1, 1,
-0.3978359, -0.5461104, -0.9573671, 1, 1, 1, 1, 1,
-0.3963097, 0.4607958, -2.923231, 1, 1, 1, 1, 1,
-0.3948053, 0.4543116, -0.6763007, 1, 1, 1, 1, 1,
-0.3945839, -0.4868561, -2.085436, 0, 0, 1, 1, 1,
-0.3928354, -0.9139222, -3.14241, 1, 0, 0, 1, 1,
-0.3924291, -2.082784, -2.761837, 1, 0, 0, 1, 1,
-0.3922302, 0.3912891, -0.6136102, 1, 0, 0, 1, 1,
-0.3908517, -0.235819, -1.782192, 1, 0, 0, 1, 1,
-0.3906158, -0.3856718, -2.95633, 1, 0, 0, 1, 1,
-0.3880739, 0.06584305, -2.112145, 0, 0, 0, 1, 1,
-0.3835655, -0.7258991, -1.708626, 0, 0, 0, 1, 1,
-0.3826424, -0.4278678, -2.399966, 0, 0, 0, 1, 1,
-0.3805139, 0.2553717, -0.5683581, 0, 0, 0, 1, 1,
-0.3785185, -0.7992424, -2.222469, 0, 0, 0, 1, 1,
-0.3728585, 0.5310875, -0.8843117, 0, 0, 0, 1, 1,
-0.3673772, 0.1528314, -0.8139459, 0, 0, 0, 1, 1,
-0.365339, 0.1277464, -1.56167, 1, 1, 1, 1, 1,
-0.356045, 0.121335, -1.026247, 1, 1, 1, 1, 1,
-0.3550523, -0.8208073, -3.794055, 1, 1, 1, 1, 1,
-0.3538222, -1.13653, -2.114691, 1, 1, 1, 1, 1,
-0.3535327, 1.155001, -0.2679068, 1, 1, 1, 1, 1,
-0.3460153, -0.5715762, -4.122468, 1, 1, 1, 1, 1,
-0.3417373, -0.6787974, -2.97208, 1, 1, 1, 1, 1,
-0.3416415, -0.8835378, -3.339523, 1, 1, 1, 1, 1,
-0.3395014, 0.2880531, -2.495479, 1, 1, 1, 1, 1,
-0.3376938, -0.5439966, -4.579459, 1, 1, 1, 1, 1,
-0.3282014, 0.1243391, -0.5161771, 1, 1, 1, 1, 1,
-0.3258484, -0.46203, -3.010522, 1, 1, 1, 1, 1,
-0.3256451, 2.006784, -0.1539045, 1, 1, 1, 1, 1,
-0.323815, 0.05269257, -0.2343709, 1, 1, 1, 1, 1,
-0.3186911, 0.5271446, -3.150819, 1, 1, 1, 1, 1,
-0.3160433, -0.4853919, -2.234624, 0, 0, 1, 1, 1,
-0.3104413, -0.6444702, -4.442197, 1, 0, 0, 1, 1,
-0.3084008, -1.026437, -2.251383, 1, 0, 0, 1, 1,
-0.2971129, 1.034765, -0.8526298, 1, 0, 0, 1, 1,
-0.2968705, -0.07445988, -1.699662, 1, 0, 0, 1, 1,
-0.2952345, 0.355198, -0.7451999, 1, 0, 0, 1, 1,
-0.2924021, -0.05244242, -2.252608, 0, 0, 0, 1, 1,
-0.2908453, 1.624084, -1.712938, 0, 0, 0, 1, 1,
-0.2901856, -0.2590748, -3.651381, 0, 0, 0, 1, 1,
-0.2881811, -0.1245829, -3.737843, 0, 0, 0, 1, 1,
-0.2843488, -1.087282, -3.947101, 0, 0, 0, 1, 1,
-0.2792279, -0.9558882, -3.523607, 0, 0, 0, 1, 1,
-0.2790186, -0.04943442, -0.5904832, 0, 0, 0, 1, 1,
-0.2736991, -0.269626, -0.9610243, 1, 1, 1, 1, 1,
-0.2733237, -0.2405927, -0.5118285, 1, 1, 1, 1, 1,
-0.266274, -0.4629894, -3.940355, 1, 1, 1, 1, 1,
-0.2653472, 0.4410018, -2.25267, 1, 1, 1, 1, 1,
-0.2632891, 1.142534, 1.085954, 1, 1, 1, 1, 1,
-0.2565821, 1.039492, 0.6937687, 1, 1, 1, 1, 1,
-0.2553773, 1.964575, -0.6149552, 1, 1, 1, 1, 1,
-0.2546448, -1.031655, -0.3168293, 1, 1, 1, 1, 1,
-0.2492156, -0.5321924, -4.160712, 1, 1, 1, 1, 1,
-0.2491577, 1.274863, 0.1843666, 1, 1, 1, 1, 1,
-0.2484036, -0.4066142, -2.82987, 1, 1, 1, 1, 1,
-0.2443194, 0.120884, 0.3821398, 1, 1, 1, 1, 1,
-0.2442456, 0.0160814, -1.975614, 1, 1, 1, 1, 1,
-0.2424403, -0.6403288, -2.539003, 1, 1, 1, 1, 1,
-0.2415373, -0.9894474, -3.26324, 1, 1, 1, 1, 1,
-0.2397697, -0.9934716, -2.088511, 0, 0, 1, 1, 1,
-0.2381693, -0.4336255, -2.627444, 1, 0, 0, 1, 1,
-0.2331404, 0.01748542, -1.963016, 1, 0, 0, 1, 1,
-0.2273141, 1.183132, 1.275339, 1, 0, 0, 1, 1,
-0.2270267, 0.7256529, -1.121885, 1, 0, 0, 1, 1,
-0.2259028, -1.057778, -2.522698, 1, 0, 0, 1, 1,
-0.2225105, 0.900033, -1.53376, 0, 0, 0, 1, 1,
-0.2223801, 0.9111084, 0.4493579, 0, 0, 0, 1, 1,
-0.221011, -0.2415753, 0.1089537, 0, 0, 0, 1, 1,
-0.2172542, 1.01826, 0.3067895, 0, 0, 0, 1, 1,
-0.2161937, -0.09783437, -1.735893, 0, 0, 0, 1, 1,
-0.2064504, -0.05495936, -3.166425, 0, 0, 0, 1, 1,
-0.1993959, -1.090765, -3.521896, 0, 0, 0, 1, 1,
-0.196505, -1.421411, -4.458222, 1, 1, 1, 1, 1,
-0.1964799, 1.641062, -0.3433224, 1, 1, 1, 1, 1,
-0.1943604, 0.2720995, -1.046361, 1, 1, 1, 1, 1,
-0.1877663, 0.53905, -0.1722526, 1, 1, 1, 1, 1,
-0.1877154, -0.1559396, -2.616242, 1, 1, 1, 1, 1,
-0.1799498, -0.5961998, -2.155584, 1, 1, 1, 1, 1,
-0.1791812, 0.3080552, -1.070173, 1, 1, 1, 1, 1,
-0.1790767, 0.1925476, 0.4146742, 1, 1, 1, 1, 1,
-0.1782572, 1.637315, -2.030883, 1, 1, 1, 1, 1,
-0.1759712, -0.198793, -2.505981, 1, 1, 1, 1, 1,
-0.1754256, 0.6974285, 0.1699503, 1, 1, 1, 1, 1,
-0.1749821, 0.8418112, 0.6862663, 1, 1, 1, 1, 1,
-0.1730517, 1.187323, 0.7113606, 1, 1, 1, 1, 1,
-0.1689187, -0.06399147, -1.50594, 1, 1, 1, 1, 1,
-0.1676823, 0.4571083, -0.258385, 1, 1, 1, 1, 1,
-0.1675175, -0.6553218, -3.138217, 0, 0, 1, 1, 1,
-0.1639019, 0.8414037, 0.5307066, 1, 0, 0, 1, 1,
-0.1636659, 0.8412978, 0.4471049, 1, 0, 0, 1, 1,
-0.1632151, -0.4538023, -4.216418, 1, 0, 0, 1, 1,
-0.1609344, -1.373354, -3.339955, 1, 0, 0, 1, 1,
-0.1601924, 0.2328464, -2.610847, 1, 0, 0, 1, 1,
-0.1579732, 0.02087865, -2.413112, 0, 0, 0, 1, 1,
-0.1570784, 0.6478869, -0.2982933, 0, 0, 0, 1, 1,
-0.1558292, 0.8173346, 0.9011723, 0, 0, 0, 1, 1,
-0.1538181, -1.636506, -2.569938, 0, 0, 0, 1, 1,
-0.1538024, 0.2458174, -0.1504088, 0, 0, 0, 1, 1,
-0.1535351, 0.2319357, -1.644425, 0, 0, 0, 1, 1,
-0.1502901, 0.3478073, -0.6082832, 0, 0, 0, 1, 1,
-0.1471479, 0.890173, 0.4647053, 1, 1, 1, 1, 1,
-0.1464602, 0.2697065, 1.529639, 1, 1, 1, 1, 1,
-0.1447023, -0.4421659, -3.251386, 1, 1, 1, 1, 1,
-0.1417645, -1.341171, -4.721241, 1, 1, 1, 1, 1,
-0.1391875, -0.9712969, -3.470299, 1, 1, 1, 1, 1,
-0.1356661, 1.012871, 1.060579, 1, 1, 1, 1, 1,
-0.1347293, -0.1142342, -1.269386, 1, 1, 1, 1, 1,
-0.1342795, -0.71109, -3.896387, 1, 1, 1, 1, 1,
-0.1329681, -0.3826086, -2.809552, 1, 1, 1, 1, 1,
-0.1318291, 0.1077114, 0.02204592, 1, 1, 1, 1, 1,
-0.1310481, 0.7435085, -0.8534495, 1, 1, 1, 1, 1,
-0.1307278, -0.2540313, -3.068094, 1, 1, 1, 1, 1,
-0.1289094, 1.007383, 1.423883, 1, 1, 1, 1, 1,
-0.1232317, -1.92349, -2.908657, 1, 1, 1, 1, 1,
-0.1225244, 0.03122197, -2.450052, 1, 1, 1, 1, 1,
-0.117897, 0.04135613, -1.329151, 0, 0, 1, 1, 1,
-0.1151768, 0.1238807, -0.2924567, 1, 0, 0, 1, 1,
-0.1115127, 1.542366, -0.6392318, 1, 0, 0, 1, 1,
-0.1081282, -1.361323, -2.575743, 1, 0, 0, 1, 1,
-0.1061215, 0.9529818, 1.133679, 1, 0, 0, 1, 1,
-0.1022874, 1.480097, -1.833411, 1, 0, 0, 1, 1,
-0.1021196, 1.505128, -0.4733225, 0, 0, 0, 1, 1,
-0.09575764, -0.5298478, -2.746233, 0, 0, 0, 1, 1,
-0.0867602, 2.123872, 0.1438134, 0, 0, 0, 1, 1,
-0.08224458, -0.8745909, -2.46371, 0, 0, 0, 1, 1,
-0.0791662, 1.089596, 0.8322267, 0, 0, 0, 1, 1,
-0.07835315, 0.5945634, -0.822086, 0, 0, 0, 1, 1,
-0.07606496, 1.034505, -0.04661411, 0, 0, 0, 1, 1,
-0.075289, 1.827622, -0.4281081, 1, 1, 1, 1, 1,
-0.07354102, -0.2304908, -2.433744, 1, 1, 1, 1, 1,
-0.07321467, 1.046674, 0.3877503, 1, 1, 1, 1, 1,
-0.06886871, -0.1597891, -3.589477, 1, 1, 1, 1, 1,
-0.06556658, 0.4701667, -2.079425, 1, 1, 1, 1, 1,
-0.06469984, -0.5535486, -2.292725, 1, 1, 1, 1, 1,
-0.06099453, 0.1910156, -0.2121084, 1, 1, 1, 1, 1,
-0.05933635, -2.505677, -4.915643, 1, 1, 1, 1, 1,
-0.05788255, -0.3982407, -3.867899, 1, 1, 1, 1, 1,
-0.05711919, 0.06943306, -1.319943, 1, 1, 1, 1, 1,
-0.05587235, -2.789943, -2.163373, 1, 1, 1, 1, 1,
-0.0553413, -0.7343454, -2.428082, 1, 1, 1, 1, 1,
-0.05411288, 0.305119, 0.09868341, 1, 1, 1, 1, 1,
-0.04769538, 1.343799, -1.115156, 1, 1, 1, 1, 1,
-0.04332524, -0.2954084, -3.781537, 1, 1, 1, 1, 1,
-0.04004327, -0.1534079, -4.256582, 0, 0, 1, 1, 1,
-0.03932334, -0.4903522, -3.653916, 1, 0, 0, 1, 1,
-0.03883222, -1.663886, -1.967754, 1, 0, 0, 1, 1,
-0.03712559, -1.226027, -2.030332, 1, 0, 0, 1, 1,
-0.02486794, -1.516531, -2.596375, 1, 0, 0, 1, 1,
-0.02302374, -0.3389362, -2.806009, 1, 0, 0, 1, 1,
-0.01941493, 0.3290485, -0.8089123, 0, 0, 0, 1, 1,
-0.009605302, 1.060455, 0.1878382, 0, 0, 0, 1, 1,
-0.008391199, -0.04019913, -3.598472, 0, 0, 0, 1, 1,
-0.00502987, -0.8649958, -3.108732, 0, 0, 0, 1, 1,
-0.004951178, -0.1108691, -3.002235, 0, 0, 0, 1, 1,
-0.003936504, -0.3930981, -2.003669, 0, 0, 0, 1, 1,
-0.001918758, 0.9385928, -2.52369, 0, 0, 0, 1, 1,
0.0002409302, 0.4359067, 1.247522, 1, 1, 1, 1, 1,
0.002894291, -0.1078658, 2.810081, 1, 1, 1, 1, 1,
0.0062951, -0.6821007, 3.657219, 1, 1, 1, 1, 1,
0.01010694, -0.6606085, 3.619662, 1, 1, 1, 1, 1,
0.01501722, -1.469341, 2.089048, 1, 1, 1, 1, 1,
0.02023905, 0.3090655, 1.214538, 1, 1, 1, 1, 1,
0.02232861, -0.6413031, 5.522748, 1, 1, 1, 1, 1,
0.02474916, -0.3913901, 3.803387, 1, 1, 1, 1, 1,
0.02714731, -0.07166246, 2.574453, 1, 1, 1, 1, 1,
0.02861932, 2.29805, 0.4312393, 1, 1, 1, 1, 1,
0.03298932, 2.18115, -0.7672916, 1, 1, 1, 1, 1,
0.03589438, 0.620932, -1.446839, 1, 1, 1, 1, 1,
0.04083164, 0.2075356, 0.5660362, 1, 1, 1, 1, 1,
0.04522029, -0.0951528, 2.643194, 1, 1, 1, 1, 1,
0.04587359, 0.5722029, -0.1077064, 1, 1, 1, 1, 1,
0.0459216, 1.157004, -0.787873, 0, 0, 1, 1, 1,
0.04668723, 0.9550945, 1.38192, 1, 0, 0, 1, 1,
0.04956821, -0.4478209, 3.729475, 1, 0, 0, 1, 1,
0.0520979, -0.7298945, 3.573143, 1, 0, 0, 1, 1,
0.0543715, 1.648571, -0.2480272, 1, 0, 0, 1, 1,
0.05559914, -0.7130992, 3.582866, 1, 0, 0, 1, 1,
0.05658257, -0.825298, 3.597741, 0, 0, 0, 1, 1,
0.0587596, 1.103953, 0.255011, 0, 0, 0, 1, 1,
0.05981466, -0.2166056, 2.612383, 0, 0, 0, 1, 1,
0.05997705, 0.8855311, -1.520298, 0, 0, 0, 1, 1,
0.06132992, -1.251733, 4.621211, 0, 0, 0, 1, 1,
0.06141517, -0.783431, 3.353634, 0, 0, 0, 1, 1,
0.06397489, -3.771199, 2.996617, 0, 0, 0, 1, 1,
0.06640401, 1.648137, -0.8054301, 1, 1, 1, 1, 1,
0.07310711, 1.024299, -1.317516, 1, 1, 1, 1, 1,
0.07410123, -0.8432131, 3.530379, 1, 1, 1, 1, 1,
0.07526281, 0.23783, 0.165216, 1, 1, 1, 1, 1,
0.07800406, -0.8178378, 3.367336, 1, 1, 1, 1, 1,
0.07977814, 0.1150178, -0.7464101, 1, 1, 1, 1, 1,
0.08005806, 1.036544, 0.8801642, 1, 1, 1, 1, 1,
0.08128277, -0.1392871, 4.467875, 1, 1, 1, 1, 1,
0.08324918, -0.9984285, 1.596002, 1, 1, 1, 1, 1,
0.08629284, -1.024959, 1.700661, 1, 1, 1, 1, 1,
0.08649454, -0.09022217, 3.788578, 1, 1, 1, 1, 1,
0.08713179, -0.6054153, 5.427191, 1, 1, 1, 1, 1,
0.08738283, 1.936077, -0.5818168, 1, 1, 1, 1, 1,
0.09190174, -1.340045, 3.148125, 1, 1, 1, 1, 1,
0.09374663, -0.694685, 1.682219, 1, 1, 1, 1, 1,
0.09937964, 0.5809761, 1.293636, 0, 0, 1, 1, 1,
0.1008775, 0.04792344, 2.410303, 1, 0, 0, 1, 1,
0.106484, 1.109547, -0.6641645, 1, 0, 0, 1, 1,
0.1074404, 0.5002338, 0.3381504, 1, 0, 0, 1, 1,
0.1119761, 1.368498, 0.559161, 1, 0, 0, 1, 1,
0.1251326, 0.6145209, -1.496626, 1, 0, 0, 1, 1,
0.1261157, 1.073959, 0.6722033, 0, 0, 0, 1, 1,
0.1263072, 1.528625, -0.5526314, 0, 0, 0, 1, 1,
0.1299291, -2.242821, 2.238047, 0, 0, 0, 1, 1,
0.1306675, 0.5726337, -0.8699141, 0, 0, 0, 1, 1,
0.132489, -0.2173073, 2.635373, 0, 0, 0, 1, 1,
0.1376007, -1.175109, 3.180986, 0, 0, 0, 1, 1,
0.1398446, -1.601962, 3.767673, 0, 0, 0, 1, 1,
0.1453269, 1.171777, 0.5886483, 1, 1, 1, 1, 1,
0.145495, 0.5847642, 0.1650611, 1, 1, 1, 1, 1,
0.1456433, -1.218633, 3.630776, 1, 1, 1, 1, 1,
0.1475563, 0.9621651, 0.06432444, 1, 1, 1, 1, 1,
0.1488738, -0.387675, 1.793014, 1, 1, 1, 1, 1,
0.1499613, -0.6208373, 2.710666, 1, 1, 1, 1, 1,
0.1515187, -1.163447, 2.921718, 1, 1, 1, 1, 1,
0.1574671, 0.5298181, -0.7356423, 1, 1, 1, 1, 1,
0.1577117, -1.290251, 2.810408, 1, 1, 1, 1, 1,
0.1597741, 0.7331586, 0.8689268, 1, 1, 1, 1, 1,
0.168553, -1.491095, 3.578334, 1, 1, 1, 1, 1,
0.1714996, 0.037451, 2.340656, 1, 1, 1, 1, 1,
0.1743719, -0.5266497, 3.096756, 1, 1, 1, 1, 1,
0.1750715, -1.397884, 4.194639, 1, 1, 1, 1, 1,
0.176907, 0.1225682, -1.000291, 1, 1, 1, 1, 1,
0.1788626, 0.8797346, 2.548367, 0, 0, 1, 1, 1,
0.1804022, 0.9149777, 0.4737593, 1, 0, 0, 1, 1,
0.182127, 0.004646161, 2.022281, 1, 0, 0, 1, 1,
0.1844526, -0.1835055, 2.128202, 1, 0, 0, 1, 1,
0.1874855, -0.05109892, 1.563797, 1, 0, 0, 1, 1,
0.1875506, 1.162594, 0.5706688, 1, 0, 0, 1, 1,
0.1906715, -0.1835515, 2.79891, 0, 0, 0, 1, 1,
0.1918691, 1.654477, -1.456274, 0, 0, 0, 1, 1,
0.1919829, 0.2100821, 0.908289, 0, 0, 0, 1, 1,
0.1935897, -1.51929, 2.62412, 0, 0, 0, 1, 1,
0.1992701, 0.0886007, 2.41191, 0, 0, 0, 1, 1,
0.2037797, -0.6976427, 1.991154, 0, 0, 0, 1, 1,
0.2065752, -0.1152983, 2.175507, 0, 0, 0, 1, 1,
0.207118, -0.3172081, 2.86336, 1, 1, 1, 1, 1,
0.2134006, -0.9588627, 1.937031, 1, 1, 1, 1, 1,
0.2145564, 0.6444239, -0.1488389, 1, 1, 1, 1, 1,
0.2206746, -1.85594, 2.801837, 1, 1, 1, 1, 1,
0.2234104, 0.553721, 1.796524, 1, 1, 1, 1, 1,
0.2241589, 0.4672893, -0.09931237, 1, 1, 1, 1, 1,
0.2242765, -0.625963, 4.071997, 1, 1, 1, 1, 1,
0.2270195, 1.201553, 1.638335, 1, 1, 1, 1, 1,
0.2273184, 0.788774, 1.963733, 1, 1, 1, 1, 1,
0.2287749, 1.679522, 0.6617989, 1, 1, 1, 1, 1,
0.2291692, 0.4966557, 0.8559311, 1, 1, 1, 1, 1,
0.2295487, -1.362659, 3.39122, 1, 1, 1, 1, 1,
0.2298679, 0.7127367, -0.8365833, 1, 1, 1, 1, 1,
0.2316619, 0.1490919, 0.08502901, 1, 1, 1, 1, 1,
0.232145, 1.800182, -0.1653365, 1, 1, 1, 1, 1,
0.2338214, -1.988058, 3.147735, 0, 0, 1, 1, 1,
0.2338319, -3.058993, 2.742349, 1, 0, 0, 1, 1,
0.2351066, -1.033872, 1.669452, 1, 0, 0, 1, 1,
0.2354562, 0.2998304, 1.657025, 1, 0, 0, 1, 1,
0.2369959, -1.234752, 3.669711, 1, 0, 0, 1, 1,
0.2388401, 0.1996233, -1.131478, 1, 0, 0, 1, 1,
0.240365, -0.2637159, 3.528635, 0, 0, 0, 1, 1,
0.2433224, -0.007800998, 2.251341, 0, 0, 0, 1, 1,
0.2465393, 1.00992, 0.3952789, 0, 0, 0, 1, 1,
0.2491383, -0.7525372, 3.583214, 0, 0, 0, 1, 1,
0.249324, -0.09524697, 3.047855, 0, 0, 0, 1, 1,
0.2540132, 2.495022, -0.6889796, 0, 0, 0, 1, 1,
0.2546548, -0.1762228, 2.668821, 0, 0, 0, 1, 1,
0.2566157, -0.9996837, 1.970177, 1, 1, 1, 1, 1,
0.2601607, 0.1038482, 1.856119, 1, 1, 1, 1, 1,
0.2609707, -0.3965673, 1.563171, 1, 1, 1, 1, 1,
0.2698284, 1.737949, -0.8175216, 1, 1, 1, 1, 1,
0.2710885, 0.402585, 1.261834, 1, 1, 1, 1, 1,
0.2715789, 0.8572986, -1.055019, 1, 1, 1, 1, 1,
0.2749065, 0.9962545, 2.432584, 1, 1, 1, 1, 1,
0.2777303, 1.80262, -2.122882, 1, 1, 1, 1, 1,
0.2800204, -0.120968, 1.238477, 1, 1, 1, 1, 1,
0.2818936, -1.43504, 0.9307971, 1, 1, 1, 1, 1,
0.2826299, -0.6271492, 3.368987, 1, 1, 1, 1, 1,
0.2853199, 0.2602775, 0.2503439, 1, 1, 1, 1, 1,
0.286705, -0.7449164, 3.980247, 1, 1, 1, 1, 1,
0.3012133, 1.631669, 1.072716, 1, 1, 1, 1, 1,
0.3096546, 0.1306148, 1.58521, 1, 1, 1, 1, 1,
0.3170241, -0.5629546, 2.476626, 0, 0, 1, 1, 1,
0.3185506, 0.04183462, 0.5293204, 1, 0, 0, 1, 1,
0.3206137, -1.919773, 3.967411, 1, 0, 0, 1, 1,
0.3209043, 2.101935, -1.603193, 1, 0, 0, 1, 1,
0.3292288, 0.5635412, 0.9423994, 1, 0, 0, 1, 1,
0.3311384, 1.198231, -0.1753326, 1, 0, 0, 1, 1,
0.3321106, -0.2138316, 2.769455, 0, 0, 0, 1, 1,
0.3352199, -0.2471661, 2.177857, 0, 0, 0, 1, 1,
0.3383852, 1.015246, 1.93246, 0, 0, 0, 1, 1,
0.344688, -0.7135962, 1.653908, 0, 0, 0, 1, 1,
0.3490959, -0.4038034, 1.347086, 0, 0, 0, 1, 1,
0.3499984, 0.3053323, -0.4610937, 0, 0, 0, 1, 1,
0.3607579, -0.2459962, 2.983256, 0, 0, 0, 1, 1,
0.3643623, -0.01349837, 2.138676, 1, 1, 1, 1, 1,
0.3695796, -0.1739613, 1.931375, 1, 1, 1, 1, 1,
0.3715571, 0.2988145, -0.1783321, 1, 1, 1, 1, 1,
0.3756557, 1.024255, 0.26169, 1, 1, 1, 1, 1,
0.376532, 0.1343414, 1.375621, 1, 1, 1, 1, 1,
0.3799849, -0.125129, 1.145566, 1, 1, 1, 1, 1,
0.383666, 1.4385, 0.6814842, 1, 1, 1, 1, 1,
0.3844401, 0.2549797, 1.659557, 1, 1, 1, 1, 1,
0.3906477, -2.015566, 2.485582, 1, 1, 1, 1, 1,
0.3991283, -1.148273, 1.93945, 1, 1, 1, 1, 1,
0.403418, -0.3712849, 1.887627, 1, 1, 1, 1, 1,
0.4038539, -0.6982532, 3.026564, 1, 1, 1, 1, 1,
0.4074782, -0.6270416, 2.914365, 1, 1, 1, 1, 1,
0.4081472, -0.0458436, 0.9608999, 1, 1, 1, 1, 1,
0.408404, 0.1654765, 1.990633, 1, 1, 1, 1, 1,
0.4096829, 0.835872, 0.3523065, 0, 0, 1, 1, 1,
0.410308, -1.114245, 3.500038, 1, 0, 0, 1, 1,
0.4112509, 0.9123326, -0.002655801, 1, 0, 0, 1, 1,
0.4121331, -0.3231672, 3.045809, 1, 0, 0, 1, 1,
0.4141486, 0.5479976, 0.1572263, 1, 0, 0, 1, 1,
0.4174322, 0.1941849, 0.3539386, 1, 0, 0, 1, 1,
0.41878, 1.283927, 0.5912507, 0, 0, 0, 1, 1,
0.4188491, -0.5475538, 2.398072, 0, 0, 0, 1, 1,
0.4239572, -0.2379722, 2.370902, 0, 0, 0, 1, 1,
0.4275032, -1.727525, 2.94171, 0, 0, 0, 1, 1,
0.4301477, 0.7331623, 1.218937, 0, 0, 0, 1, 1,
0.4316067, -1.077566, 2.929033, 0, 0, 0, 1, 1,
0.4339274, 0.5787078, 0.8782235, 0, 0, 0, 1, 1,
0.4367594, 2.581716, 1.025895, 1, 1, 1, 1, 1,
0.4552965, 0.09665459, 1.339254, 1, 1, 1, 1, 1,
0.4579067, -0.09737419, 4.350799, 1, 1, 1, 1, 1,
0.4602206, -1.269043, 3.213362, 1, 1, 1, 1, 1,
0.466628, 1.005316, -0.509815, 1, 1, 1, 1, 1,
0.4683516, -1.842042, 3.332691, 1, 1, 1, 1, 1,
0.4711318, -0.3075965, 1.149517, 1, 1, 1, 1, 1,
0.4779254, 0.9080883, 0.8898289, 1, 1, 1, 1, 1,
0.4796726, -1.769737, 0.7006057, 1, 1, 1, 1, 1,
0.489078, -1.781968, 1.525838, 1, 1, 1, 1, 1,
0.4892585, 0.1325302, 1.098542, 1, 1, 1, 1, 1,
0.4896585, 1.114455, 0.3336511, 1, 1, 1, 1, 1,
0.491185, -0.2413563, 1.290599, 1, 1, 1, 1, 1,
0.4962735, -2.014822, 2.602827, 1, 1, 1, 1, 1,
0.4990719, -0.8439851, 3.242262, 1, 1, 1, 1, 1,
0.5027171, -0.01598946, 0.03356705, 0, 0, 1, 1, 1,
0.5031097, 1.328081, 0.6649275, 1, 0, 0, 1, 1,
0.507543, -0.3712055, 3.54522, 1, 0, 0, 1, 1,
0.5127404, 0.1312812, 0.9429201, 1, 0, 0, 1, 1,
0.5148155, 0.05375879, 1.630998, 1, 0, 0, 1, 1,
0.5221141, 0.6566763, 0.4353854, 1, 0, 0, 1, 1,
0.5258176, -1.771518, 1.851251, 0, 0, 0, 1, 1,
0.5286247, -0.9601266, 3.889729, 0, 0, 0, 1, 1,
0.5318529, 1.061514, 2.684105, 0, 0, 0, 1, 1,
0.5396488, -0.6565389, 2.927411, 0, 0, 0, 1, 1,
0.5401313, 2.209175, 0.002793207, 0, 0, 0, 1, 1,
0.5427367, -2.486227, 5.23604, 0, 0, 0, 1, 1,
0.5472534, -1.825963, 3.681794, 0, 0, 0, 1, 1,
0.5521768, -0.1895825, 2.09554, 1, 1, 1, 1, 1,
0.5571849, -0.7064609, 1.444127, 1, 1, 1, 1, 1,
0.5585722, 1.101599, 1.383133, 1, 1, 1, 1, 1,
0.5599257, 1.220029, 1.362829, 1, 1, 1, 1, 1,
0.5665576, 0.01560117, 1.518524, 1, 1, 1, 1, 1,
0.5719941, -0.6148087, 2.881034, 1, 1, 1, 1, 1,
0.5722647, -0.9616899, 1.84965, 1, 1, 1, 1, 1,
0.5735738, 0.007655756, 0.7967725, 1, 1, 1, 1, 1,
0.5776455, -1.788215, 1.874964, 1, 1, 1, 1, 1,
0.5794204, -0.03239596, 0.3971355, 1, 1, 1, 1, 1,
0.5807572, -0.03943621, 0.3028094, 1, 1, 1, 1, 1,
0.5840208, -1.947531, 0.9568389, 1, 1, 1, 1, 1,
0.5842448, 0.03937439, 1.586385, 1, 1, 1, 1, 1,
0.5893128, 2.095815, 1.925804, 1, 1, 1, 1, 1,
0.5903664, 0.5832115, -0.01960254, 1, 1, 1, 1, 1,
0.5948322, 0.4058112, 1.234913, 0, 0, 1, 1, 1,
0.596171, -0.9720236, 1.071121, 1, 0, 0, 1, 1,
0.5966675, -0.3984396, 1.551492, 1, 0, 0, 1, 1,
0.5996011, 0.009556379, 2.795628, 1, 0, 0, 1, 1,
0.5998284, 0.3952672, 1.136926, 1, 0, 0, 1, 1,
0.6060786, -0.9244094, 2.219459, 1, 0, 0, 1, 1,
0.6088552, -0.6458861, 3.278978, 0, 0, 0, 1, 1,
0.6118494, 0.3372805, 2.407939, 0, 0, 0, 1, 1,
0.6176093, 1.223869, 0.2344695, 0, 0, 0, 1, 1,
0.6233074, 0.248817, -0.9480064, 0, 0, 0, 1, 1,
0.629128, 0.9827638, 2.054078, 0, 0, 0, 1, 1,
0.6328538, -0.1346427, 1.373274, 0, 0, 0, 1, 1,
0.6446027, -0.8223501, 3.540942, 0, 0, 0, 1, 1,
0.6453676, 0.2322723, 2.083893, 1, 1, 1, 1, 1,
0.647802, -2.889156, 4.23129, 1, 1, 1, 1, 1,
0.647908, 1.098518, 0.5770525, 1, 1, 1, 1, 1,
0.6566263, 0.07624336, 1.183449, 1, 1, 1, 1, 1,
0.6576713, -1.706379, 1.123983, 1, 1, 1, 1, 1,
0.6593347, -0.6218811, 2.425891, 1, 1, 1, 1, 1,
0.6605593, -0.3056627, 1.937116, 1, 1, 1, 1, 1,
0.6621485, -0.4613891, 1.473581, 1, 1, 1, 1, 1,
0.665492, -0.8281206, 1.251132, 1, 1, 1, 1, 1,
0.6686919, 0.09098116, 0.4956014, 1, 1, 1, 1, 1,
0.670596, 0.1694556, 0.6304242, 1, 1, 1, 1, 1,
0.6753395, 1.284884, 1.066108, 1, 1, 1, 1, 1,
0.676971, 0.6922169, 3.589351, 1, 1, 1, 1, 1,
0.6905799, 1.965599, 0.9682676, 1, 1, 1, 1, 1,
0.6918199, 0.6043624, 1.909153, 1, 1, 1, 1, 1,
0.6944306, 1.156755, -0.1954194, 0, 0, 1, 1, 1,
0.699351, 0.4755269, 0.291339, 1, 0, 0, 1, 1,
0.7044939, 0.04907278, 2.163003, 1, 0, 0, 1, 1,
0.7072179, -2.235018, 1.685855, 1, 0, 0, 1, 1,
0.7099116, -1.302507, 3.349078, 1, 0, 0, 1, 1,
0.7176849, -0.2524036, 1.82163, 1, 0, 0, 1, 1,
0.7185948, 0.9164287, 3.302424, 0, 0, 0, 1, 1,
0.7219063, 0.9509249, 2.085251, 0, 0, 0, 1, 1,
0.7224147, -0.6709699, 2.674907, 0, 0, 0, 1, 1,
0.7248622, -0.680843, 3.032073, 0, 0, 0, 1, 1,
0.7265638, -0.5448317, 0.4841631, 0, 0, 0, 1, 1,
0.728431, 0.2496761, -1.06021, 0, 0, 0, 1, 1,
0.7294213, -0.3642768, 2.879263, 0, 0, 0, 1, 1,
0.7299463, 1.48123, 1.468262, 1, 1, 1, 1, 1,
0.745113, -2.459727, 2.333224, 1, 1, 1, 1, 1,
0.7497888, 0.2213683, 1.917987, 1, 1, 1, 1, 1,
0.7525795, -1.65956, 3.082827, 1, 1, 1, 1, 1,
0.7532845, -0.9176264, 2.500795, 1, 1, 1, 1, 1,
0.7601501, -0.8979865, 1.653798, 1, 1, 1, 1, 1,
0.7608376, -0.4897349, 1.685364, 1, 1, 1, 1, 1,
0.7620687, 1.458704, 1.728782, 1, 1, 1, 1, 1,
0.7638112, -0.710389, 1.613181, 1, 1, 1, 1, 1,
0.7639003, -1.10812, 1.69701, 1, 1, 1, 1, 1,
0.7720063, 1.581905, 1.686121, 1, 1, 1, 1, 1,
0.7839018, -1.754943, 2.220701, 1, 1, 1, 1, 1,
0.7881815, 0.4204186, 1.624507, 1, 1, 1, 1, 1,
0.7913046, -0.3142734, 2.756737, 1, 1, 1, 1, 1,
0.7968597, 0.7281932, -0.2639337, 1, 1, 1, 1, 1,
0.7991455, 0.2112726, 2.12045, 0, 0, 1, 1, 1,
0.8020508, 2.012196, 0.8278814, 1, 0, 0, 1, 1,
0.8034225, -0.9225127, 2.312477, 1, 0, 0, 1, 1,
0.8074863, -2.262841, 0.9009681, 1, 0, 0, 1, 1,
0.8136897, 2.020038, 0.5015357, 1, 0, 0, 1, 1,
0.8144362, 2.143534, 0.8190119, 1, 0, 0, 1, 1,
0.8191206, -0.451714, 4.244528, 0, 0, 0, 1, 1,
0.8205775, -0.9040013, 2.488673, 0, 0, 0, 1, 1,
0.8214259, 1.089884, 0.6370703, 0, 0, 0, 1, 1,
0.8236838, 0.2039484, 2.337938, 0, 0, 0, 1, 1,
0.8246602, 0.5475049, -0.4114611, 0, 0, 0, 1, 1,
0.8270931, 0.3729811, 1.21037, 0, 0, 0, 1, 1,
0.8293579, -0.09469434, 1.795005, 0, 0, 0, 1, 1,
0.8309221, -0.3338303, 1.387855, 1, 1, 1, 1, 1,
0.8437545, -0.1415585, 3.113259, 1, 1, 1, 1, 1,
0.845219, 0.6227376, -0.2487907, 1, 1, 1, 1, 1,
0.8561373, -0.9487182, 3.188835, 1, 1, 1, 1, 1,
0.8561739, -0.3665318, 1.750801, 1, 1, 1, 1, 1,
0.8568649, -1.170548, 3.67528, 1, 1, 1, 1, 1,
0.8605943, 0.131219, 1.906661, 1, 1, 1, 1, 1,
0.8623828, -0.7673895, 3.380975, 1, 1, 1, 1, 1,
0.8650038, 1.239826, 0.9245358, 1, 1, 1, 1, 1,
0.8717787, -0.1138894, 2.223122, 1, 1, 1, 1, 1,
0.8735502, -0.7882708, 1.363004, 1, 1, 1, 1, 1,
0.8738076, -0.04774103, 1.720115, 1, 1, 1, 1, 1,
0.8742225, 0.6090944, -0.2253014, 1, 1, 1, 1, 1,
0.8846844, 0.1251809, -0.2108628, 1, 1, 1, 1, 1,
0.8853791, 0.5375652, 0.2245975, 1, 1, 1, 1, 1,
0.8870688, -1.231049, 3.667636, 0, 0, 1, 1, 1,
0.8918015, 0.2012237, 2.932333, 1, 0, 0, 1, 1,
0.8990768, -0.9810663, 1.634688, 1, 0, 0, 1, 1,
0.9072757, 0.2975567, -0.005495933, 1, 0, 0, 1, 1,
0.9093639, -0.17167, 2.18935, 1, 0, 0, 1, 1,
0.9172029, -0.3779764, 3.060271, 1, 0, 0, 1, 1,
0.9173039, 0.5496498, 2.716983, 0, 0, 0, 1, 1,
0.9202985, 0.3436321, 1.137167, 0, 0, 0, 1, 1,
0.9240133, -0.5505849, 3.888477, 0, 0, 0, 1, 1,
0.9250928, -0.4557351, 2.651125, 0, 0, 0, 1, 1,
0.9270356, -0.5669533, 1.754406, 0, 0, 0, 1, 1,
0.9358956, 0.03994285, 2.310745, 0, 0, 0, 1, 1,
0.9369881, 1.23965, 1.356397, 0, 0, 0, 1, 1,
0.937597, -0.8747156, 3.131548, 1, 1, 1, 1, 1,
0.938396, 1.640063, 0.7219434, 1, 1, 1, 1, 1,
0.9419839, -1.254508, 2.573818, 1, 1, 1, 1, 1,
0.9445832, -2.278396, 2.921511, 1, 1, 1, 1, 1,
0.9450816, -0.02060257, 1.889612, 1, 1, 1, 1, 1,
0.9491458, 0.6625791, -1.293328, 1, 1, 1, 1, 1,
0.9500691, -0.3324827, 1.310427, 1, 1, 1, 1, 1,
0.9577479, -2.02628, 1.592386, 1, 1, 1, 1, 1,
0.9608499, 0.7673525, 0.8356062, 1, 1, 1, 1, 1,
0.9622337, 0.1186075, 2.571525, 1, 1, 1, 1, 1,
0.9646078, 0.69868, 2.691057, 1, 1, 1, 1, 1,
0.9694381, 0.9933155, 1.29125, 1, 1, 1, 1, 1,
0.9709113, 0.04734489, 2.428535, 1, 1, 1, 1, 1,
0.9743664, 0.6423408, 0.496242, 1, 1, 1, 1, 1,
0.9743908, 0.6166289, 3.327723, 1, 1, 1, 1, 1,
0.9744416, -1.54276, 0.9518706, 0, 0, 1, 1, 1,
0.9770892, -0.08514173, 1.080068, 1, 0, 0, 1, 1,
0.9782795, -1.550769, 3.37419, 1, 0, 0, 1, 1,
0.9794061, 0.2247237, 1.109833, 1, 0, 0, 1, 1,
0.9868585, -1.924779, 1.824359, 1, 0, 0, 1, 1,
0.9883583, 0.2527784, 1.199324, 1, 0, 0, 1, 1,
0.9886134, 0.5258765, 2.508882, 0, 0, 0, 1, 1,
0.9899148, -0.1356162, 0.3703587, 0, 0, 0, 1, 1,
0.9917626, 0.03039083, 1.772252, 0, 0, 0, 1, 1,
0.9966939, 0.2575325, 1.160434, 0, 0, 0, 1, 1,
1.003473, -0.5414904, 1.87093, 0, 0, 0, 1, 1,
1.004253, -0.7850778, 0.8320222, 0, 0, 0, 1, 1,
1.005718, 0.521921, -0.6822374, 0, 0, 0, 1, 1,
1.009835, -0.569934, 2.17694, 1, 1, 1, 1, 1,
1.010033, -0.5781571, 1.723588, 1, 1, 1, 1, 1,
1.010229, 1.10148, 0.08107585, 1, 1, 1, 1, 1,
1.023423, 1.062133, 2.403704, 1, 1, 1, 1, 1,
1.023457, 1.117053, 1.791335, 1, 1, 1, 1, 1,
1.027341, -1.135675, 2.963209, 1, 1, 1, 1, 1,
1.03328, 0.4019896, 3.011588, 1, 1, 1, 1, 1,
1.033702, -1.116475, 1.998123, 1, 1, 1, 1, 1,
1.059049, 0.7926849, 2.042942, 1, 1, 1, 1, 1,
1.075096, -0.0550355, 0.239536, 1, 1, 1, 1, 1,
1.084251, 1.610093, -0.5311326, 1, 1, 1, 1, 1,
1.099241, -0.4560857, 2.172793, 1, 1, 1, 1, 1,
1.101851, -1.026162, 3.158096, 1, 1, 1, 1, 1,
1.102253, 1.132835, -0.1278777, 1, 1, 1, 1, 1,
1.107637, -0.04718232, 1.261578, 1, 1, 1, 1, 1,
1.108872, 0.192944, 2.096387, 0, 0, 1, 1, 1,
1.116098, -1.319042, 3.179909, 1, 0, 0, 1, 1,
1.128635, -0.866442, 2.262364, 1, 0, 0, 1, 1,
1.136681, -0.3793722, 3.794091, 1, 0, 0, 1, 1,
1.139113, 0.2182842, 2.375051, 1, 0, 0, 1, 1,
1.149084, -0.1539565, 2.528545, 1, 0, 0, 1, 1,
1.152449, 1.975311, 0.9213114, 0, 0, 0, 1, 1,
1.161908, -0.6601992, 2.191735, 0, 0, 0, 1, 1,
1.165058, 1.010983, 0.484665, 0, 0, 0, 1, 1,
1.172279, 3.812672, -1.406383, 0, 0, 0, 1, 1,
1.175705, 0.04362081, -0.8347502, 0, 0, 0, 1, 1,
1.179404, 0.485405, 0.8820498, 0, 0, 0, 1, 1,
1.182916, -1.164987, 1.989684, 0, 0, 0, 1, 1,
1.189508, -1.876729, 2.743198, 1, 1, 1, 1, 1,
1.191792, 1.23862, 0.7409304, 1, 1, 1, 1, 1,
1.205868, -0.5033311, 0.5877458, 1, 1, 1, 1, 1,
1.21071, 1.99028, -1.686134, 1, 1, 1, 1, 1,
1.212749, 1.612809, 1.644161, 1, 1, 1, 1, 1,
1.215333, -1.181645, 3.497819, 1, 1, 1, 1, 1,
1.2207, 0.0474691, 2.06774, 1, 1, 1, 1, 1,
1.224968, -1.116654, 1.762355, 1, 1, 1, 1, 1,
1.225312, -1.083261, 2.688584, 1, 1, 1, 1, 1,
1.227954, 0.4669093, 0.764433, 1, 1, 1, 1, 1,
1.228326, -1.22148, 2.882495, 1, 1, 1, 1, 1,
1.230845, 2.566645, -0.2728916, 1, 1, 1, 1, 1,
1.24278, -0.7968734, 0.2469527, 1, 1, 1, 1, 1,
1.244069, 0.3450864, 1.605714, 1, 1, 1, 1, 1,
1.24983, 0.15534, 1.34519, 1, 1, 1, 1, 1,
1.253415, 1.096786, 0.7810697, 0, 0, 1, 1, 1,
1.266514, -0.1299117, 1.107025, 1, 0, 0, 1, 1,
1.272998, -1.429913, 1.578526, 1, 0, 0, 1, 1,
1.28209, -0.9987587, 1.423002, 1, 0, 0, 1, 1,
1.290807, 0.2035158, 0.2104672, 1, 0, 0, 1, 1,
1.295984, 0.586353, 1.544117, 1, 0, 0, 1, 1,
1.300945, -0.7226024, 3.301214, 0, 0, 0, 1, 1,
1.304636, -0.7137938, 1.370352, 0, 0, 0, 1, 1,
1.307433, 0.6279764, 2.915564, 0, 0, 0, 1, 1,
1.307536, -0.09129364, 2.91567, 0, 0, 0, 1, 1,
1.309982, -0.6284444, 2.074236, 0, 0, 0, 1, 1,
1.313565, 1.394572, 0.1655715, 0, 0, 0, 1, 1,
1.315462, 0.3301652, 0.7838075, 0, 0, 0, 1, 1,
1.319529, -0.3177184, 1.405075, 1, 1, 1, 1, 1,
1.319613, -0.3061843, 3.156997, 1, 1, 1, 1, 1,
1.322113, -0.5021455, 3.575838, 1, 1, 1, 1, 1,
1.329247, 0.6586806, 0.1562416, 1, 1, 1, 1, 1,
1.335526, 0.1827432, 3.293109, 1, 1, 1, 1, 1,
1.340438, -0.8097562, 2.232033, 1, 1, 1, 1, 1,
1.357738, 0.4508947, 0.8392833, 1, 1, 1, 1, 1,
1.358052, 1.221661, 0.05515492, 1, 1, 1, 1, 1,
1.362725, -1.006559, 0.5025899, 1, 1, 1, 1, 1,
1.369587, 0.6763775, -0.270482, 1, 1, 1, 1, 1,
1.374539, 0.4597914, 2.735917, 1, 1, 1, 1, 1,
1.383574, -0.9913974, 1.674309, 1, 1, 1, 1, 1,
1.392032, -0.4581038, 1.466399, 1, 1, 1, 1, 1,
1.403945, -1.214645, 1.749957, 1, 1, 1, 1, 1,
1.404793, -1.067098, 1.825865, 1, 1, 1, 1, 1,
1.41213, 0.8615569, 2.632084, 0, 0, 1, 1, 1,
1.418193, -1.31998, 2.620994, 1, 0, 0, 1, 1,
1.423044, -2.277203, 3.466211, 1, 0, 0, 1, 1,
1.430584, -0.4679116, 0.833098, 1, 0, 0, 1, 1,
1.432404, 0.9010665, 0.2076158, 1, 0, 0, 1, 1,
1.439688, 0.7462267, 1.25949, 1, 0, 0, 1, 1,
1.441518, -0.7896711, 2.217259, 0, 0, 0, 1, 1,
1.44588, 0.04374363, 2.718431, 0, 0, 0, 1, 1,
1.449892, 0.4914955, 1.119015, 0, 0, 0, 1, 1,
1.450871, 0.4502817, 1.348056, 0, 0, 0, 1, 1,
1.452382, 1.034107, -0.5124656, 0, 0, 0, 1, 1,
1.468026, 0.6192138, 0.5537627, 0, 0, 0, 1, 1,
1.469849, 1.694827, -0.2563657, 0, 0, 0, 1, 1,
1.477193, -0.2504694, 0.7808446, 1, 1, 1, 1, 1,
1.477564, -0.3616871, 1.371501, 1, 1, 1, 1, 1,
1.503633, 0.7809473, 1.024275, 1, 1, 1, 1, 1,
1.507406, 0.8221178, 0.4969811, 1, 1, 1, 1, 1,
1.511315, -0.1235784, 1.015341, 1, 1, 1, 1, 1,
1.534311, 0.4846027, 1.421183, 1, 1, 1, 1, 1,
1.54473, -0.9449479, 1.509628, 1, 1, 1, 1, 1,
1.549249, 0.4870626, -0.09401686, 1, 1, 1, 1, 1,
1.551729, -1.043145, 2.358849, 1, 1, 1, 1, 1,
1.558315, -1.950842, 1.373914, 1, 1, 1, 1, 1,
1.567516, -1.447039, 2.47587, 1, 1, 1, 1, 1,
1.575234, 0.6151195, 2.169602, 1, 1, 1, 1, 1,
1.591063, 1.507961, -0.1664403, 1, 1, 1, 1, 1,
1.592223, 1.090247, 2.40462, 1, 1, 1, 1, 1,
1.603195, 0.784144, -1.490472, 1, 1, 1, 1, 1,
1.605029, -1.251998, 2.933902, 0, 0, 1, 1, 1,
1.613406, 0.9236688, 0.9438347, 1, 0, 0, 1, 1,
1.614563, -1.416346, 4.02714, 1, 0, 0, 1, 1,
1.615453, 2.023456, -1.333574, 1, 0, 0, 1, 1,
1.61661, -1.709939, 4.142387, 1, 0, 0, 1, 1,
1.651385, 0.6864317, 1.310223, 1, 0, 0, 1, 1,
1.666006, -0.3714427, 1.590111, 0, 0, 0, 1, 1,
1.669269, -1.097313, 3.374602, 0, 0, 0, 1, 1,
1.698956, -0.4150551, 2.144629, 0, 0, 0, 1, 1,
1.721824, -0.9514642, 2.439872, 0, 0, 0, 1, 1,
1.77994, -0.5486792, 0.8263464, 0, 0, 0, 1, 1,
1.800473, -1.437319, 1.927683, 0, 0, 0, 1, 1,
1.843204, 0.9496655, 2.992214, 0, 0, 0, 1, 1,
1.863036, -0.665372, 2.965117, 1, 1, 1, 1, 1,
1.863267, 0.1269481, 2.28648, 1, 1, 1, 1, 1,
1.865854, -1.259815, 2.121775, 1, 1, 1, 1, 1,
1.874472, 0.6260413, 3.977926, 1, 1, 1, 1, 1,
1.911636, 0.205117, 1.775056, 1, 1, 1, 1, 1,
1.926571, -0.01268773, 0.4209317, 1, 1, 1, 1, 1,
1.928293, -1.237955, 2.189969, 1, 1, 1, 1, 1,
1.939032, 1.541488, 2.476073, 1, 1, 1, 1, 1,
1.942915, -1.056753, 1.614529, 1, 1, 1, 1, 1,
1.951059, -0.4923474, 2.767581, 1, 1, 1, 1, 1,
1.992665, -1.516098, 1.774334, 1, 1, 1, 1, 1,
2.022176, 0.8878546, 0.2060379, 1, 1, 1, 1, 1,
2.034196, 0.6535124, 1.342254, 1, 1, 1, 1, 1,
2.037951, -0.7680065, 0.7904529, 1, 1, 1, 1, 1,
2.046986, 0.347628, 0.2809379, 1, 1, 1, 1, 1,
2.059152, -2.869317, 2.377229, 0, 0, 1, 1, 1,
2.073218, 1.254403, 0.8901758, 1, 0, 0, 1, 1,
2.091859, -0.6178375, 3.398013, 1, 0, 0, 1, 1,
2.108207, 1.273423, 3.209246, 1, 0, 0, 1, 1,
2.138762, 0.5939296, -0.5198055, 1, 0, 0, 1, 1,
2.217675, 0.4897244, 1.702249, 1, 0, 0, 1, 1,
2.236905, 0.9064194, 1.676237, 0, 0, 0, 1, 1,
2.258331, -0.8466741, 0.5230947, 0, 0, 0, 1, 1,
2.346997, 0.2620881, 4.057462, 0, 0, 0, 1, 1,
2.347649, -1.467269, 2.393722, 0, 0, 0, 1, 1,
2.414364, -0.09715213, 2.360721, 0, 0, 0, 1, 1,
2.418945, 0.2499602, 1.28531, 0, 0, 0, 1, 1,
2.485005, 0.3633074, 0.757749, 0, 0, 0, 1, 1,
2.516793, 0.1838426, 1.814327, 1, 1, 1, 1, 1,
2.549226, -0.4416176, 1.708506, 1, 1, 1, 1, 1,
2.651991, -1.329369, 2.688589, 1, 1, 1, 1, 1,
2.673934, 0.2102403, 0.6304121, 1, 1, 1, 1, 1,
2.769759, 0.7034578, -0.8204262, 1, 1, 1, 1, 1,
2.821528, -0.5077784, 1.454809, 1, 1, 1, 1, 1,
2.867923, -1.127864, 1.703939, 1, 1, 1, 1, 1
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
var radius = 9.740259;
var distance = 34.21225;
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
mvMatrix.translate( 0.2267201, -0.02073717, -0.3035526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21225);
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
