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
-3.587199, -1.612204, -1.509047, 1, 0, 0, 1,
-2.852532, 0.3232136, -0.07919114, 1, 0.007843138, 0, 1,
-2.795433, 0.1429668, -1.276068, 1, 0.01176471, 0, 1,
-2.786221, -1.391356, -3.306241, 1, 0.01960784, 0, 1,
-2.761287, 0.5549842, -1.850334, 1, 0.02352941, 0, 1,
-2.699569, -0.2578997, -2.044478, 1, 0.03137255, 0, 1,
-2.662298, -0.7829067, -2.45301, 1, 0.03529412, 0, 1,
-2.621984, -0.6078505, -3.305592, 1, 0.04313726, 0, 1,
-2.4345, -0.4830576, -0.9808139, 1, 0.04705882, 0, 1,
-2.434121, -1.02466, -3.313864, 1, 0.05490196, 0, 1,
-2.370051, -0.4970306, -3.398111, 1, 0.05882353, 0, 1,
-2.297123, -1.031676, -1.524573, 1, 0.06666667, 0, 1,
-2.283097, 0.3702493, -2.51251, 1, 0.07058824, 0, 1,
-2.229632, 0.1117661, -0.5116445, 1, 0.07843138, 0, 1,
-2.22702, -0.3739188, -1.034605, 1, 0.08235294, 0, 1,
-2.155555, -1.033688, -1.919236, 1, 0.09019608, 0, 1,
-2.132611, -0.7780667, -1.99808, 1, 0.09411765, 0, 1,
-2.057848, -2.052008, -2.165921, 1, 0.1019608, 0, 1,
-2.05143, 0.2694996, -3.072477, 1, 0.1098039, 0, 1,
-2.048954, 0.2666698, -1.02811, 1, 0.1137255, 0, 1,
-2.045566, -0.8870944, -4.187359, 1, 0.1215686, 0, 1,
-2.041383, 0.6631387, -1.698045, 1, 0.1254902, 0, 1,
-2.032201, 0.1309142, 0.5292719, 1, 0.1333333, 0, 1,
-2.004494, -1.125268, -2.233578, 1, 0.1372549, 0, 1,
-1.985632, 0.8378652, -3.388518, 1, 0.145098, 0, 1,
-1.950237, 1.58557, -1.051009, 1, 0.1490196, 0, 1,
-1.94721, -1.047718, -3.611558, 1, 0.1568628, 0, 1,
-1.945054, 0.3638142, -2.649671, 1, 0.1607843, 0, 1,
-1.941734, -0.9368272, -2.298365, 1, 0.1686275, 0, 1,
-1.891665, 1.18845, -0.03344852, 1, 0.172549, 0, 1,
-1.883375, 0.174248, -1.951018, 1, 0.1803922, 0, 1,
-1.878449, -1.62622, -0.8267866, 1, 0.1843137, 0, 1,
-1.845768, 0.9059551, -1.757777, 1, 0.1921569, 0, 1,
-1.810991, -1.65671, -1.375584, 1, 0.1960784, 0, 1,
-1.787794, -0.5743553, -3.461308, 1, 0.2039216, 0, 1,
-1.779401, -0.1025973, -2.582613, 1, 0.2117647, 0, 1,
-1.777539, 0.07064671, -4.006368, 1, 0.2156863, 0, 1,
-1.773032, 0.5678239, 1.916733, 1, 0.2235294, 0, 1,
-1.769921, 1.74935, 0.8655865, 1, 0.227451, 0, 1,
-1.768449, -1.860728, -2.06205, 1, 0.2352941, 0, 1,
-1.746078, -1.367066, -4.729813, 1, 0.2392157, 0, 1,
-1.738787, -0.7705808, -1.916714, 1, 0.2470588, 0, 1,
-1.738266, 0.1661577, -1.556445, 1, 0.2509804, 0, 1,
-1.733314, 0.2984759, -3.30602, 1, 0.2588235, 0, 1,
-1.719012, -0.8163484, -2.39732, 1, 0.2627451, 0, 1,
-1.704609, -0.3039857, -3.755486, 1, 0.2705882, 0, 1,
-1.702124, -2.289998, -3.818392, 1, 0.2745098, 0, 1,
-1.700887, 0.6437429, -1.798061, 1, 0.282353, 0, 1,
-1.672017, -1.931414, -2.980375, 1, 0.2862745, 0, 1,
-1.669595, -0.217511, -1.548189, 1, 0.2941177, 0, 1,
-1.668929, 0.746051, -0.01586979, 1, 0.3019608, 0, 1,
-1.661694, -2.491109, -2.332932, 1, 0.3058824, 0, 1,
-1.656495, 1.217728, -1.901722, 1, 0.3137255, 0, 1,
-1.648559, 0.5354082, -0.8641571, 1, 0.3176471, 0, 1,
-1.647001, -1.161942, -3.816229, 1, 0.3254902, 0, 1,
-1.644399, 1.591261, -1.30968, 1, 0.3294118, 0, 1,
-1.639479, 0.3620382, -1.246226, 1, 0.3372549, 0, 1,
-1.633958, -1.298372, -1.32311, 1, 0.3411765, 0, 1,
-1.631314, -0.3253399, 0.09008399, 1, 0.3490196, 0, 1,
-1.625418, -0.312341, -1.679942, 1, 0.3529412, 0, 1,
-1.613026, 0.03214561, -0.7578946, 1, 0.3607843, 0, 1,
-1.60372, 0.174038, -0.9528174, 1, 0.3647059, 0, 1,
-1.599059, 0.6501094, -1.04524, 1, 0.372549, 0, 1,
-1.598214, -0.6387753, -1.87739, 1, 0.3764706, 0, 1,
-1.593979, -0.370187, -0.9348421, 1, 0.3843137, 0, 1,
-1.590493, -1.296289, -1.949628, 1, 0.3882353, 0, 1,
-1.580957, 2.162583, -0.6601494, 1, 0.3960784, 0, 1,
-1.578183, -0.1924543, -2.144521, 1, 0.4039216, 0, 1,
-1.57807, 0.5091662, -1.180317, 1, 0.4078431, 0, 1,
-1.563323, 0.2874409, 0.3558817, 1, 0.4156863, 0, 1,
-1.552826, -0.6541134, -2.4416, 1, 0.4196078, 0, 1,
-1.53487, -1.721404, -3.959069, 1, 0.427451, 0, 1,
-1.524445, 1.460514, -2.0106, 1, 0.4313726, 0, 1,
-1.521072, -1.085721, -1.764673, 1, 0.4392157, 0, 1,
-1.519709, 0.3289191, -2.527571, 1, 0.4431373, 0, 1,
-1.505761, 0.6004625, -1.892794, 1, 0.4509804, 0, 1,
-1.503647, 0.183455, -0.1509702, 1, 0.454902, 0, 1,
-1.501824, -0.2860849, -1.384496, 1, 0.4627451, 0, 1,
-1.501221, 0.8604865, -1.682431, 1, 0.4666667, 0, 1,
-1.481169, 0.3428361, -0.6968178, 1, 0.4745098, 0, 1,
-1.465048, -1.474902, -2.231932, 1, 0.4784314, 0, 1,
-1.463113, 2.048511, -0.2388814, 1, 0.4862745, 0, 1,
-1.458152, -1.198467, -1.411513, 1, 0.4901961, 0, 1,
-1.455912, -0.5733361, -2.11532, 1, 0.4980392, 0, 1,
-1.453059, 0.7158921, 0.9724824, 1, 0.5058824, 0, 1,
-1.451828, -1.040346, -2.3961, 1, 0.509804, 0, 1,
-1.445986, -0.2929851, -2.207264, 1, 0.5176471, 0, 1,
-1.440678, 0.8507403, -0.1624948, 1, 0.5215687, 0, 1,
-1.440379, -1.193647, -1.620477, 1, 0.5294118, 0, 1,
-1.43692, -0.6053773, -0.5810007, 1, 0.5333334, 0, 1,
-1.425195, 0.09153021, -2.21719, 1, 0.5411765, 0, 1,
-1.424627, 1.456626, -0.245118, 1, 0.5450981, 0, 1,
-1.420199, 1.387755, -0.2071653, 1, 0.5529412, 0, 1,
-1.41515, 0.1469007, 0.3046008, 1, 0.5568628, 0, 1,
-1.41072, 0.2894951, -1.461761, 1, 0.5647059, 0, 1,
-1.377297, -1.886365, -2.461471, 1, 0.5686275, 0, 1,
-1.375916, 1.215968, -0.5271805, 1, 0.5764706, 0, 1,
-1.360335, -0.2398406, -1.371522, 1, 0.5803922, 0, 1,
-1.358882, -0.3117378, -0.04706734, 1, 0.5882353, 0, 1,
-1.348863, 0.1459358, -2.193775, 1, 0.5921569, 0, 1,
-1.34742, -1.196073, -2.729172, 1, 0.6, 0, 1,
-1.341451, 0.1782153, -1.984421, 1, 0.6078432, 0, 1,
-1.338393, -0.6020468, -1.97663, 1, 0.6117647, 0, 1,
-1.335589, 0.2199334, -2.203899, 1, 0.6196079, 0, 1,
-1.331632, 1.092145, -2.084682, 1, 0.6235294, 0, 1,
-1.315123, -2.025468, -2.739232, 1, 0.6313726, 0, 1,
-1.315032, 1.134093, -1.611981, 1, 0.6352941, 0, 1,
-1.304467, 0.007921496, -0.9855345, 1, 0.6431373, 0, 1,
-1.285911, -0.8890845, -1.865562, 1, 0.6470588, 0, 1,
-1.285432, 0.6341318, -1.189186, 1, 0.654902, 0, 1,
-1.273933, 0.1743657, 1.010871, 1, 0.6588235, 0, 1,
-1.273484, -0.3906189, -2.698536, 1, 0.6666667, 0, 1,
-1.268137, 1.085341, -0.6908138, 1, 0.6705883, 0, 1,
-1.262431, -0.4691804, -2.574265, 1, 0.6784314, 0, 1,
-1.260298, -1.192284, -3.526948, 1, 0.682353, 0, 1,
-1.256971, -1.640858, -2.862999, 1, 0.6901961, 0, 1,
-1.248801, -1.75046, -2.003834, 1, 0.6941177, 0, 1,
-1.247005, -1.766776, -2.153, 1, 0.7019608, 0, 1,
-1.219067, -0.1811814, -2.234859, 1, 0.7098039, 0, 1,
-1.215564, 0.5247285, -0.7536186, 1, 0.7137255, 0, 1,
-1.214605, -0.110497, -2.162437, 1, 0.7215686, 0, 1,
-1.200158, 0.3528475, -0.5461004, 1, 0.7254902, 0, 1,
-1.198209, 0.9006007, 0.05730054, 1, 0.7333333, 0, 1,
-1.193091, -0.2165098, -2.021819, 1, 0.7372549, 0, 1,
-1.1912, -2.709342, -3.513006, 1, 0.7450981, 0, 1,
-1.190387, -0.0798573, -1.976257, 1, 0.7490196, 0, 1,
-1.184901, 2.249115, -0.6254782, 1, 0.7568628, 0, 1,
-1.181053, -1.561923, -4.4082, 1, 0.7607843, 0, 1,
-1.169518, -0.1741971, -2.445034, 1, 0.7686275, 0, 1,
-1.15823, -0.7784167, -3.944793, 1, 0.772549, 0, 1,
-1.157987, -1.796539, -2.805856, 1, 0.7803922, 0, 1,
-1.155992, 0.1496201, -2.08033, 1, 0.7843137, 0, 1,
-1.153317, 1.757932, 0.3760304, 1, 0.7921569, 0, 1,
-1.147714, -0.1703626, -2.512481, 1, 0.7960784, 0, 1,
-1.146166, 0.5258253, -1.214004, 1, 0.8039216, 0, 1,
-1.140657, -1.294016, -1.019922, 1, 0.8117647, 0, 1,
-1.137521, -0.7465459, -1.717083, 1, 0.8156863, 0, 1,
-1.132904, -0.1243143, -1.394723, 1, 0.8235294, 0, 1,
-1.128274, 0.4335214, -1.829921, 1, 0.827451, 0, 1,
-1.122027, 0.01838993, -1.549519, 1, 0.8352941, 0, 1,
-1.122005, 1.240767, -1.471314, 1, 0.8392157, 0, 1,
-1.118079, 1.019222, -2.500757, 1, 0.8470588, 0, 1,
-1.112347, 1.121065, -0.3469699, 1, 0.8509804, 0, 1,
-1.110046, 1.06627, 0.196914, 1, 0.8588235, 0, 1,
-1.107545, -0.7875378, -4.608136, 1, 0.8627451, 0, 1,
-1.106621, -1.419834, -2.431757, 1, 0.8705882, 0, 1,
-1.100687, -0.8095121, -2.26574, 1, 0.8745098, 0, 1,
-1.100499, 1.333277, -1.79515, 1, 0.8823529, 0, 1,
-1.09323, 0.4811148, -0.2400973, 1, 0.8862745, 0, 1,
-1.08836, 0.8868599, -1.5336, 1, 0.8941177, 0, 1,
-1.086533, -0.5947471, -2.102093, 1, 0.8980392, 0, 1,
-1.085025, -1.030903, -2.925671, 1, 0.9058824, 0, 1,
-1.081498, -1.233779, -1.961294, 1, 0.9137255, 0, 1,
-1.077384, 0.3088463, -1.629239, 1, 0.9176471, 0, 1,
-1.074026, -0.5665178, -1.528873, 1, 0.9254902, 0, 1,
-1.069138, 0.538431, -0.2724706, 1, 0.9294118, 0, 1,
-1.066411, 1.070381, -0.1790698, 1, 0.9372549, 0, 1,
-1.064349, 0.9380266, -0.7856148, 1, 0.9411765, 0, 1,
-1.060766, 1.6247, -0.144951, 1, 0.9490196, 0, 1,
-1.059316, 0.05789462, -0.02103299, 1, 0.9529412, 0, 1,
-1.058437, -1.11505, -1.482901, 1, 0.9607843, 0, 1,
-1.055061, 1.632276, -0.8309114, 1, 0.9647059, 0, 1,
-1.049937, -0.3737782, -1.781223, 1, 0.972549, 0, 1,
-1.046698, -0.09843537, -2.567312, 1, 0.9764706, 0, 1,
-1.03937, 0.3246696, -0.5316387, 1, 0.9843137, 0, 1,
-1.033636, -2.477788, -2.405851, 1, 0.9882353, 0, 1,
-1.028955, 0.745487, -0.9493632, 1, 0.9960784, 0, 1,
-1.028932, 0.4961235, -1.915457, 0.9960784, 1, 0, 1,
-1.028183, -1.11657, -3.296837, 0.9921569, 1, 0, 1,
-1.026125, -0.3588827, -2.761802, 0.9843137, 1, 0, 1,
-1.022375, -0.08897816, -0.4242519, 0.9803922, 1, 0, 1,
-1.021512, -0.9575382, -3.636825, 0.972549, 1, 0, 1,
-1.012988, -1.056369, -2.208297, 0.9686275, 1, 0, 1,
-0.9982834, -0.2839314, -1.978407, 0.9607843, 1, 0, 1,
-0.9967425, 0.3056095, -1.115109, 0.9568627, 1, 0, 1,
-0.9849005, 1.862488, 0.4950338, 0.9490196, 1, 0, 1,
-0.9680236, 1.39517, 0.005701425, 0.945098, 1, 0, 1,
-0.9603487, -0.4075455, -1.921605, 0.9372549, 1, 0, 1,
-0.9594441, 1.938019, -0.3189299, 0.9333333, 1, 0, 1,
-0.9548111, 0.3022495, -0.6262537, 0.9254902, 1, 0, 1,
-0.9529774, -0.8063165, -0.8084545, 0.9215686, 1, 0, 1,
-0.9523134, 0.1103204, -0.1963573, 0.9137255, 1, 0, 1,
-0.9477019, 0.4513052, -3.004552, 0.9098039, 1, 0, 1,
-0.9434962, -1.411243, -2.964798, 0.9019608, 1, 0, 1,
-0.9403528, 2.236923, -0.6153913, 0.8941177, 1, 0, 1,
-0.9388291, -0.3069819, -2.150371, 0.8901961, 1, 0, 1,
-0.9380445, -0.6940034, -2.70063, 0.8823529, 1, 0, 1,
-0.9377568, 0.7714556, -0.1973455, 0.8784314, 1, 0, 1,
-0.930028, 0.1445731, 1.289673, 0.8705882, 1, 0, 1,
-0.922513, -0.3843091, -3.175874, 0.8666667, 1, 0, 1,
-0.9205068, 0.3171211, -2.498412, 0.8588235, 1, 0, 1,
-0.917558, -0.7481045, -2.021824, 0.854902, 1, 0, 1,
-0.9171173, -1.091788, -2.34615, 0.8470588, 1, 0, 1,
-0.9127314, 0.9899406, -1.60404, 0.8431373, 1, 0, 1,
-0.9097973, 0.8401729, -1.123498, 0.8352941, 1, 0, 1,
-0.9066351, -1.186958, -2.587132, 0.8313726, 1, 0, 1,
-0.9047256, -1.485472, -0.4788508, 0.8235294, 1, 0, 1,
-0.9019871, -0.4969409, -1.744398, 0.8196079, 1, 0, 1,
-0.896019, 0.4803813, -1.797239, 0.8117647, 1, 0, 1,
-0.8956535, -0.1145605, -2.341731, 0.8078431, 1, 0, 1,
-0.8895218, 1.456406, -0.4955305, 0.8, 1, 0, 1,
-0.8852369, 0.6548781, -1.154775, 0.7921569, 1, 0, 1,
-0.8847136, 1.532773, -0.9085865, 0.7882353, 1, 0, 1,
-0.8799636, -2.061666, -0.9931077, 0.7803922, 1, 0, 1,
-0.8759738, 2.256237, -0.9938356, 0.7764706, 1, 0, 1,
-0.870204, 0.06348994, -2.40128, 0.7686275, 1, 0, 1,
-0.869513, -1.36795, -1.860686, 0.7647059, 1, 0, 1,
-0.865466, -1.442399, -1.927288, 0.7568628, 1, 0, 1,
-0.8573346, -0.1396052, -0.910163, 0.7529412, 1, 0, 1,
-0.8533713, -0.816921, -1.564246, 0.7450981, 1, 0, 1,
-0.8461354, 1.179255, -0.8097193, 0.7411765, 1, 0, 1,
-0.8445984, -1.617483, -2.506679, 0.7333333, 1, 0, 1,
-0.8373326, 1.208981, -0.6149972, 0.7294118, 1, 0, 1,
-0.8372176, -0.9641363, -0.8633881, 0.7215686, 1, 0, 1,
-0.8353475, 0.4225187, -1.523079, 0.7176471, 1, 0, 1,
-0.8290985, 0.4616393, -0.3564425, 0.7098039, 1, 0, 1,
-0.8236232, 0.1479359, -0.9221203, 0.7058824, 1, 0, 1,
-0.8227568, -0.5390124, -2.689705, 0.6980392, 1, 0, 1,
-0.8160126, -0.6557908, -1.801605, 0.6901961, 1, 0, 1,
-0.8094245, 0.3536243, -0.9441338, 0.6862745, 1, 0, 1,
-0.8081079, -0.892632, -2.488741, 0.6784314, 1, 0, 1,
-0.8039826, 1.123656, 0.6100051, 0.6745098, 1, 0, 1,
-0.7971835, -1.585201, -2.631062, 0.6666667, 1, 0, 1,
-0.7913361, 0.4930879, -0.5894786, 0.6627451, 1, 0, 1,
-0.7840721, 2.551961, -1.187971, 0.654902, 1, 0, 1,
-0.7741895, 0.3474169, 0.1843782, 0.6509804, 1, 0, 1,
-0.7711504, -0.04301482, -2.256601, 0.6431373, 1, 0, 1,
-0.7695181, 0.1453326, -2.228283, 0.6392157, 1, 0, 1,
-0.7675797, -0.3909154, -1.652265, 0.6313726, 1, 0, 1,
-0.7660487, 0.5990881, -1.915675, 0.627451, 1, 0, 1,
-0.765958, 1.297491, 0.7300673, 0.6196079, 1, 0, 1,
-0.765547, -1.016928, -2.228476, 0.6156863, 1, 0, 1,
-0.7607443, 0.01869476, -1.607501, 0.6078432, 1, 0, 1,
-0.7549173, 0.4047329, -0.702747, 0.6039216, 1, 0, 1,
-0.7519282, 0.518476, 0.1064501, 0.5960785, 1, 0, 1,
-0.7445773, 0.8552476, 0.9493303, 0.5882353, 1, 0, 1,
-0.7274661, 0.8385796, -1.303043, 0.5843138, 1, 0, 1,
-0.7227094, 0.1761888, -1.346518, 0.5764706, 1, 0, 1,
-0.7221277, 0.8323954, -2.89692, 0.572549, 1, 0, 1,
-0.7164373, -0.4327987, -2.137684, 0.5647059, 1, 0, 1,
-0.7067896, -0.3761702, -1.538992, 0.5607843, 1, 0, 1,
-0.7065477, 0.5262603, -1.991359, 0.5529412, 1, 0, 1,
-0.7045058, 1.581855, 0.1404312, 0.5490196, 1, 0, 1,
-0.7016833, 1.113086, -0.8866825, 0.5411765, 1, 0, 1,
-0.6991479, 1.677759, 0.792122, 0.5372549, 1, 0, 1,
-0.6987224, 0.9445667, -1.556981, 0.5294118, 1, 0, 1,
-0.6950839, 0.401481, -0.4299238, 0.5254902, 1, 0, 1,
-0.6941277, -0.8214616, -5.446085, 0.5176471, 1, 0, 1,
-0.6891542, -1.441479, -1.412404, 0.5137255, 1, 0, 1,
-0.6827087, -1.505683, -3.431148, 0.5058824, 1, 0, 1,
-0.6808079, 1.425239, -0.4254193, 0.5019608, 1, 0, 1,
-0.6767833, 0.5453091, -0.04609962, 0.4941176, 1, 0, 1,
-0.675166, 0.3861113, -0.7495172, 0.4862745, 1, 0, 1,
-0.6746228, -1.055051, -1.786974, 0.4823529, 1, 0, 1,
-0.6740386, -0.8226813, -4.639476, 0.4745098, 1, 0, 1,
-0.669709, 0.1050341, -1.716966, 0.4705882, 1, 0, 1,
-0.6657137, -1.42185, -2.16987, 0.4627451, 1, 0, 1,
-0.665593, 0.1050543, -1.337301, 0.4588235, 1, 0, 1,
-0.6575836, 0.4821717, 0.1222275, 0.4509804, 1, 0, 1,
-0.6564979, -0.5376441, -2.516225, 0.4470588, 1, 0, 1,
-0.6522819, -0.2018908, -2.646488, 0.4392157, 1, 0, 1,
-0.6498079, -0.4365877, -1.884709, 0.4352941, 1, 0, 1,
-0.6457983, -0.1528245, -2.954829, 0.427451, 1, 0, 1,
-0.6375044, 0.3328204, -0.5452354, 0.4235294, 1, 0, 1,
-0.6268049, 1.191892, -2.196463, 0.4156863, 1, 0, 1,
-0.6262659, -1.28767, -3.10813, 0.4117647, 1, 0, 1,
-0.6137868, 0.5507669, -2.195411, 0.4039216, 1, 0, 1,
-0.6117739, -0.1687191, -0.0006948069, 0.3960784, 1, 0, 1,
-0.6094235, 0.2577401, -0.9341733, 0.3921569, 1, 0, 1,
-0.6035966, -2.032371, -1.800026, 0.3843137, 1, 0, 1,
-0.6033491, -0.6234829, -1.30672, 0.3803922, 1, 0, 1,
-0.6029739, -0.9534924, -0.6208569, 0.372549, 1, 0, 1,
-0.6012364, -1.300972, -2.961366, 0.3686275, 1, 0, 1,
-0.6004836, 0.9317812, 0.06414056, 0.3607843, 1, 0, 1,
-0.5980918, 0.04469607, -1.371742, 0.3568628, 1, 0, 1,
-0.5947878, 1.510756, -0.4161676, 0.3490196, 1, 0, 1,
-0.5941473, -0.670172, -5.114283, 0.345098, 1, 0, 1,
-0.5940157, -0.3277397, -2.419526, 0.3372549, 1, 0, 1,
-0.5864545, 0.1180583, -1.49397, 0.3333333, 1, 0, 1,
-0.574025, 0.05548027, 0.2045305, 0.3254902, 1, 0, 1,
-0.5733244, 1.349802, -0.6122159, 0.3215686, 1, 0, 1,
-0.5690929, -0.4903302, -3.331624, 0.3137255, 1, 0, 1,
-0.5682275, -1.227733, -3.157338, 0.3098039, 1, 0, 1,
-0.5633305, 0.2103384, -1.520881, 0.3019608, 1, 0, 1,
-0.5509635, -0.221576, -2.715906, 0.2941177, 1, 0, 1,
-0.5461302, 0.1657179, -1.495452, 0.2901961, 1, 0, 1,
-0.5449187, -1.638066, -3.245529, 0.282353, 1, 0, 1,
-0.5415257, -1.249795, -1.4368, 0.2784314, 1, 0, 1,
-0.5406581, 2.817956, 0.120703, 0.2705882, 1, 0, 1,
-0.539449, -0.9292891, -2.933054, 0.2666667, 1, 0, 1,
-0.5348438, -0.6808824, -3.77279, 0.2588235, 1, 0, 1,
-0.5303915, 0.331653, -1.139693, 0.254902, 1, 0, 1,
-0.5252811, -0.2063826, -1.849357, 0.2470588, 1, 0, 1,
-0.5183196, -1.834744, -3.333284, 0.2431373, 1, 0, 1,
-0.5182514, -0.3099644, -1.197179, 0.2352941, 1, 0, 1,
-0.5160682, 0.3059801, -1.024411, 0.2313726, 1, 0, 1,
-0.5139796, 0.3801888, -0.5499962, 0.2235294, 1, 0, 1,
-0.5123315, 0.784818, 0.9750083, 0.2196078, 1, 0, 1,
-0.5118884, 1.024966, -0.6808078, 0.2117647, 1, 0, 1,
-0.510334, -1.931441, -4.479859, 0.2078431, 1, 0, 1,
-0.5081122, 1.459628, -2.96331, 0.2, 1, 0, 1,
-0.5076939, -1.231592, -2.174251, 0.1921569, 1, 0, 1,
-0.5067648, -0.5209667, -1.633644, 0.1882353, 1, 0, 1,
-0.5009832, -1.873682, -1.180987, 0.1803922, 1, 0, 1,
-0.4982269, -1.169656, -1.639489, 0.1764706, 1, 0, 1,
-0.4948967, -0.9104577, -3.478655, 0.1686275, 1, 0, 1,
-0.4851687, 0.6142252, -0.558281, 0.1647059, 1, 0, 1,
-0.4851161, -0.03712088, -1.098562, 0.1568628, 1, 0, 1,
-0.4819775, -1.307755, -3.246076, 0.1529412, 1, 0, 1,
-0.4796213, -0.3446521, -1.626437, 0.145098, 1, 0, 1,
-0.4794541, 0.9306448, -0.2149259, 0.1411765, 1, 0, 1,
-0.4790674, 0.3665751, -0.6094455, 0.1333333, 1, 0, 1,
-0.4777356, 0.5392673, -1.029888, 0.1294118, 1, 0, 1,
-0.4726764, 0.5012175, -2.328656, 0.1215686, 1, 0, 1,
-0.4691812, -0.635682, -1.784009, 0.1176471, 1, 0, 1,
-0.4674744, 1.040192, -1.725884, 0.1098039, 1, 0, 1,
-0.467103, 0.5661239, -0.8932732, 0.1058824, 1, 0, 1,
-0.4582782, 1.461172, -0.5519374, 0.09803922, 1, 0, 1,
-0.4575231, 0.5599879, -0.7591265, 0.09019608, 1, 0, 1,
-0.4535963, -0.183049, -2.515029, 0.08627451, 1, 0, 1,
-0.4507678, -0.2128588, 0.05320221, 0.07843138, 1, 0, 1,
-0.4500593, -1.324181, -3.246964, 0.07450981, 1, 0, 1,
-0.4432603, -1.44985, -1.859578, 0.06666667, 1, 0, 1,
-0.4386645, -0.5358152, -1.786407, 0.0627451, 1, 0, 1,
-0.4361075, 0.4397547, -0.1218111, 0.05490196, 1, 0, 1,
-0.4345142, -2.382723, -3.378814, 0.05098039, 1, 0, 1,
-0.4342195, 0.1892221, -1.034166, 0.04313726, 1, 0, 1,
-0.4300721, -0.5912419, -2.115542, 0.03921569, 1, 0, 1,
-0.429495, -0.3149494, -1.581251, 0.03137255, 1, 0, 1,
-0.4236494, 0.3800638, -0.1595841, 0.02745098, 1, 0, 1,
-0.4225047, 0.08534204, -0.8458527, 0.01960784, 1, 0, 1,
-0.4185618, 1.625816, -0.04676702, 0.01568628, 1, 0, 1,
-0.4183197, 0.6042285, -0.415588, 0.007843138, 1, 0, 1,
-0.4155757, 0.2808545, -1.525109, 0.003921569, 1, 0, 1,
-0.4136138, -1.12618, -4.686073, 0, 1, 0.003921569, 1,
-0.4095335, 0.3801012, -0.5642483, 0, 1, 0.01176471, 1,
-0.4086221, -0.1376269, -2.829436, 0, 1, 0.01568628, 1,
-0.3993298, -2.007431, -3.85962, 0, 1, 0.02352941, 1,
-0.3983175, -0.07881186, -3.184161, 0, 1, 0.02745098, 1,
-0.3960431, -0.7183857, -2.407862, 0, 1, 0.03529412, 1,
-0.3943447, -0.9011052, -4.31744, 0, 1, 0.03921569, 1,
-0.3914776, 0.6301851, 0.5249318, 0, 1, 0.04705882, 1,
-0.3912841, -1.489909, -2.697033, 0, 1, 0.05098039, 1,
-0.3904564, 0.2966809, -0.4200514, 0, 1, 0.05882353, 1,
-0.3843998, 0.2501899, -0.9265569, 0, 1, 0.0627451, 1,
-0.3802409, -0.8372475, -3.009705, 0, 1, 0.07058824, 1,
-0.3786257, 0.07544057, -0.2178764, 0, 1, 0.07450981, 1,
-0.3784388, 1.185771, 1.341789, 0, 1, 0.08235294, 1,
-0.3659406, -1.039136, -3.214506, 0, 1, 0.08627451, 1,
-0.3624315, 1.835241, 0.1150086, 0, 1, 0.09411765, 1,
-0.3616656, 0.4761581, -1.814102, 0, 1, 0.1019608, 1,
-0.3573024, -0.326212, -4.757624, 0, 1, 0.1058824, 1,
-0.3556249, 1.21925, -0.4958884, 0, 1, 0.1137255, 1,
-0.3527501, 0.07201029, -2.448395, 0, 1, 0.1176471, 1,
-0.345508, -0.8737218, -2.445695, 0, 1, 0.1254902, 1,
-0.343888, -0.5398381, -2.565442, 0, 1, 0.1294118, 1,
-0.3425026, -0.4720388, -1.128715, 0, 1, 0.1372549, 1,
-0.340704, -0.4102884, -1.704844, 0, 1, 0.1411765, 1,
-0.3396059, -0.09970745, -2.380939, 0, 1, 0.1490196, 1,
-0.3365903, -1.368199, -4.195211, 0, 1, 0.1529412, 1,
-0.3309462, -0.1725512, -0.146084, 0, 1, 0.1607843, 1,
-0.3302793, 0.6637514, -2.005824, 0, 1, 0.1647059, 1,
-0.3269336, -1.460905, -3.578067, 0, 1, 0.172549, 1,
-0.3231848, 0.8880225, 1.007462, 0, 1, 0.1764706, 1,
-0.3168136, 0.2375337, -2.596707, 0, 1, 0.1843137, 1,
-0.3163397, -1.555437, -3.802818, 0, 1, 0.1882353, 1,
-0.3037532, 0.5610595, 1.017735, 0, 1, 0.1960784, 1,
-0.3018365, 0.8341293, -2.275759, 0, 1, 0.2039216, 1,
-0.2988823, -0.7998685, -1.874668, 0, 1, 0.2078431, 1,
-0.2978106, -0.5766528, -3.484152, 0, 1, 0.2156863, 1,
-0.2943634, -1.851562, -2.73982, 0, 1, 0.2196078, 1,
-0.2943584, 1.424868, -0.525723, 0, 1, 0.227451, 1,
-0.2936913, 0.587597, -2.475902, 0, 1, 0.2313726, 1,
-0.2909921, 0.6651084, 1.047384, 0, 1, 0.2392157, 1,
-0.2900859, 1.252522, 0.1519686, 0, 1, 0.2431373, 1,
-0.2880562, 0.7679902, -2.955213, 0, 1, 0.2509804, 1,
-0.2848251, -2.053134, -4.581258, 0, 1, 0.254902, 1,
-0.2808059, -0.1787163, -2.065607, 0, 1, 0.2627451, 1,
-0.2774889, -1.437252, -3.082005, 0, 1, 0.2666667, 1,
-0.2751637, -2.29224, -2.39805, 0, 1, 0.2745098, 1,
-0.2688943, -0.6143388, -2.015931, 0, 1, 0.2784314, 1,
-0.2670406, -0.08169301, -1.947886, 0, 1, 0.2862745, 1,
-0.2599954, -0.7541271, -2.557781, 0, 1, 0.2901961, 1,
-0.2549967, 1.411861, 0.2461828, 0, 1, 0.2980392, 1,
-0.2516599, 0.7411934, -1.662908, 0, 1, 0.3058824, 1,
-0.250769, 0.6354859, -0.334574, 0, 1, 0.3098039, 1,
-0.2465497, -0.6604708, -2.590803, 0, 1, 0.3176471, 1,
-0.244432, -1.441205, -2.811675, 0, 1, 0.3215686, 1,
-0.2426139, -1.257548, -4.442137, 0, 1, 0.3294118, 1,
-0.2410242, -1.659747, -2.344072, 0, 1, 0.3333333, 1,
-0.2398109, -0.3572221, -1.724249, 0, 1, 0.3411765, 1,
-0.2372478, 1.387355, -0.2638609, 0, 1, 0.345098, 1,
-0.2360623, -0.4159775, -2.891212, 0, 1, 0.3529412, 1,
-0.2287771, 1.738637, -1.091886, 0, 1, 0.3568628, 1,
-0.2258403, 0.02179104, -0.7601611, 0, 1, 0.3647059, 1,
-0.2242194, 1.410211, -0.5058222, 0, 1, 0.3686275, 1,
-0.2225297, 0.7455436, -0.3578144, 0, 1, 0.3764706, 1,
-0.2190655, -0.2292159, -2.481003, 0, 1, 0.3803922, 1,
-0.2169337, -0.3328971, -2.335466, 0, 1, 0.3882353, 1,
-0.216416, 0.9774258, -0.3402686, 0, 1, 0.3921569, 1,
-0.2116297, 2.065798, 1.068931, 0, 1, 0.4, 1,
-0.2101, -1.713315, -2.038064, 0, 1, 0.4078431, 1,
-0.2076925, 0.9296011, 0.577392, 0, 1, 0.4117647, 1,
-0.2072351, 1.739321, 0.3897129, 0, 1, 0.4196078, 1,
-0.2055597, -1.348257, -3.169297, 0, 1, 0.4235294, 1,
-0.2055413, -0.1270154, -1.294652, 0, 1, 0.4313726, 1,
-0.2049819, 1.575864, 1.932824, 0, 1, 0.4352941, 1,
-0.2043801, -1.09701, -2.884477, 0, 1, 0.4431373, 1,
-0.2023701, 1.250503, -0.4321297, 0, 1, 0.4470588, 1,
-0.195041, -1.615814, -3.390608, 0, 1, 0.454902, 1,
-0.1909325, 0.03771645, -1.85809, 0, 1, 0.4588235, 1,
-0.1882602, -0.4232542, -2.772687, 0, 1, 0.4666667, 1,
-0.1873239, -0.4458312, -3.799126, 0, 1, 0.4705882, 1,
-0.1869204, -1.668378, -2.313038, 0, 1, 0.4784314, 1,
-0.1865452, 0.295604, -1.930689, 0, 1, 0.4823529, 1,
-0.1816325, 0.4920356, -0.040018, 0, 1, 0.4901961, 1,
-0.1768208, -0.2072817, -1.527065, 0, 1, 0.4941176, 1,
-0.176523, 0.3130053, 0.3524908, 0, 1, 0.5019608, 1,
-0.1758551, 0.1589992, -1.608828, 0, 1, 0.509804, 1,
-0.1623791, 0.5634421, -0.8562153, 0, 1, 0.5137255, 1,
-0.1603286, 0.4915278, -0.8858687, 0, 1, 0.5215687, 1,
-0.15645, -1.691515, -2.098979, 0, 1, 0.5254902, 1,
-0.1520434, -0.7630555, -4.067211, 0, 1, 0.5333334, 1,
-0.1517472, 0.1079608, -0.3682981, 0, 1, 0.5372549, 1,
-0.1503786, -0.2222787, -2.284096, 0, 1, 0.5450981, 1,
-0.1493732, -1.699946, -3.340851, 0, 1, 0.5490196, 1,
-0.1463052, 0.1427101, -1.349377, 0, 1, 0.5568628, 1,
-0.1396442, -1.342173, -1.440254, 0, 1, 0.5607843, 1,
-0.1318983, 0.5055237, -1.469737, 0, 1, 0.5686275, 1,
-0.1285959, -0.5012854, -3.429186, 0, 1, 0.572549, 1,
-0.126432, 0.945787, -1.242254, 0, 1, 0.5803922, 1,
-0.1251978, 1.095441, -0.8099215, 0, 1, 0.5843138, 1,
-0.1250447, -1.904324, -3.216374, 0, 1, 0.5921569, 1,
-0.1243139, -0.9227386, -2.263388, 0, 1, 0.5960785, 1,
-0.1241404, 0.1945309, -0.4541283, 0, 1, 0.6039216, 1,
-0.1235952, 0.04409725, -1.242865, 0, 1, 0.6117647, 1,
-0.1226176, 1.127217, -0.8592687, 0, 1, 0.6156863, 1,
-0.1175352, 0.03870105, -0.9635279, 0, 1, 0.6235294, 1,
-0.1162225, -0.4982767, -3.875046, 0, 1, 0.627451, 1,
-0.1148322, 1.27531, -0.7239241, 0, 1, 0.6352941, 1,
-0.1120034, -2.02999, -3.285668, 0, 1, 0.6392157, 1,
-0.1112553, -0.353879, -2.191229, 0, 1, 0.6470588, 1,
-0.107899, 0.2957571, 0.7431471, 0, 1, 0.6509804, 1,
-0.105003, -0.1891529, -2.685384, 0, 1, 0.6588235, 1,
-0.1048976, -0.09343327, -3.529733, 0, 1, 0.6627451, 1,
-0.1048931, -0.6975406, -4.009459, 0, 1, 0.6705883, 1,
-0.1036368, -1.30728, -2.573936, 0, 1, 0.6745098, 1,
-0.09652704, 1.816035, 0.07547501, 0, 1, 0.682353, 1,
-0.09585644, 2.217089, -0.4989562, 0, 1, 0.6862745, 1,
-0.09400798, 0.6353172, -2.128144, 0, 1, 0.6941177, 1,
-0.09396159, -0.7594111, -3.191542, 0, 1, 0.7019608, 1,
-0.09226812, -1.006089, -1.365561, 0, 1, 0.7058824, 1,
-0.09119748, 2.38428, 0.2509908, 0, 1, 0.7137255, 1,
-0.09018165, -0.4314333, -5.034387, 0, 1, 0.7176471, 1,
-0.08817074, 0.02144774, -2.644282, 0, 1, 0.7254902, 1,
-0.08683299, 1.187365, -1.341819, 0, 1, 0.7294118, 1,
-0.08647701, -0.7387324, -2.267489, 0, 1, 0.7372549, 1,
-0.08546294, 0.1042434, -0.2634183, 0, 1, 0.7411765, 1,
-0.08521957, -0.797671, -1.942127, 0, 1, 0.7490196, 1,
-0.08020148, -1.08608, -4.707993, 0, 1, 0.7529412, 1,
-0.07875216, 0.08487373, -2.606783, 0, 1, 0.7607843, 1,
-0.07840986, -1.504158, -4.728942, 0, 1, 0.7647059, 1,
-0.07697617, -0.7055761, -2.318876, 0, 1, 0.772549, 1,
-0.07632998, 0.2832339, 0.1778475, 0, 1, 0.7764706, 1,
-0.07548719, 1.500884, 1.139205, 0, 1, 0.7843137, 1,
-0.07132817, 1.889484, -0.04994392, 0, 1, 0.7882353, 1,
-0.0698221, 0.5584801, 0.4559966, 0, 1, 0.7960784, 1,
-0.06927086, -1.561166, -3.622277, 0, 1, 0.8039216, 1,
-0.06383092, -0.1086666, -4.107388, 0, 1, 0.8078431, 1,
-0.0634589, 1.352705, -0.193665, 0, 1, 0.8156863, 1,
-0.06313951, 0.2416669, -0.8255336, 0, 1, 0.8196079, 1,
-0.06054214, 0.2249954, 1.057555, 0, 1, 0.827451, 1,
-0.05981463, 1.38848, 0.1454279, 0, 1, 0.8313726, 1,
-0.05886764, 0.988649, 0.8640677, 0, 1, 0.8392157, 1,
-0.0576097, 0.7327518, -0.1983098, 0, 1, 0.8431373, 1,
-0.04647768, -1.192121, -2.094633, 0, 1, 0.8509804, 1,
-0.0458772, 1.721584, -0.1567533, 0, 1, 0.854902, 1,
-0.04486274, -0.5482979, -4.185253, 0, 1, 0.8627451, 1,
-0.04272987, -0.973791, -3.358635, 0, 1, 0.8666667, 1,
-0.04181425, 1.831455, -0.02214026, 0, 1, 0.8745098, 1,
-0.03639629, -0.7919085, -3.545962, 0, 1, 0.8784314, 1,
-0.03485021, -0.5506296, -2.610832, 0, 1, 0.8862745, 1,
-0.03202172, 0.6207281, 0.3572176, 0, 1, 0.8901961, 1,
-0.03162964, -0.2016551, -2.269929, 0, 1, 0.8980392, 1,
-0.02688761, -0.3790756, -3.512827, 0, 1, 0.9058824, 1,
-0.02455927, 1.254316, -1.814681, 0, 1, 0.9098039, 1,
-0.01804169, 0.5716221, -0.9553719, 0, 1, 0.9176471, 1,
-0.01569446, -0.340382, -0.849223, 0, 1, 0.9215686, 1,
-0.01240364, -2.086136, -3.796966, 0, 1, 0.9294118, 1,
-0.009398828, 0.3018925, 0.8547839, 0, 1, 0.9333333, 1,
-0.009106606, 0.04228958, -1.368863, 0, 1, 0.9411765, 1,
0.002485303, 1.178564, -0.2332059, 0, 1, 0.945098, 1,
0.002911679, 0.7082121, -0.4821526, 0, 1, 0.9529412, 1,
0.003320549, 1.979944, -1.223039, 0, 1, 0.9568627, 1,
0.009788332, -0.003672047, 2.297818, 0, 1, 0.9647059, 1,
0.01268522, 1.295948, 0.6719018, 0, 1, 0.9686275, 1,
0.01402185, -0.05365579, 1.838967, 0, 1, 0.9764706, 1,
0.0151168, -0.3619891, 3.747455, 0, 1, 0.9803922, 1,
0.01663055, -0.06392258, 2.11085, 0, 1, 0.9882353, 1,
0.01976607, -1.494447, 4.881516, 0, 1, 0.9921569, 1,
0.01986174, -1.209804, 3.528514, 0, 1, 1, 1,
0.02098017, -0.4924051, 2.965188, 0, 0.9921569, 1, 1,
0.02394686, -2.598498, 3.91821, 0, 0.9882353, 1, 1,
0.03223611, 0.6561418, -0.3575694, 0, 0.9803922, 1, 1,
0.03733558, 0.5691289, -0.2848967, 0, 0.9764706, 1, 1,
0.03795697, -1.100802, 1.59558, 0, 0.9686275, 1, 1,
0.0382187, 0.1407465, -0.1167563, 0, 0.9647059, 1, 1,
0.03981492, 0.9803109, 0.9244273, 0, 0.9568627, 1, 1,
0.04208368, -0.480724, 2.15517, 0, 0.9529412, 1, 1,
0.04509692, -0.2450914, 1.706853, 0, 0.945098, 1, 1,
0.04685446, 0.2835658, -1.175995, 0, 0.9411765, 1, 1,
0.05268013, -0.3517359, 1.885954, 0, 0.9333333, 1, 1,
0.05344436, 0.1197407, 1.418326, 0, 0.9294118, 1, 1,
0.05367595, 1.10505, -0.4042099, 0, 0.9215686, 1, 1,
0.0559756, 1.015365, -0.623867, 0, 0.9176471, 1, 1,
0.05897116, 0.04308384, 0.1750415, 0, 0.9098039, 1, 1,
0.05975139, 0.5175918, 0.9734907, 0, 0.9058824, 1, 1,
0.05984871, -0.1960901, 2.689592, 0, 0.8980392, 1, 1,
0.0613371, -0.8068478, 5.396865, 0, 0.8901961, 1, 1,
0.07121417, 0.4713627, -0.6156546, 0, 0.8862745, 1, 1,
0.07157163, -1.004483, 4.129122, 0, 0.8784314, 1, 1,
0.07282673, 0.9981471, -1.130301, 0, 0.8745098, 1, 1,
0.07338733, -1.273048, 2.810651, 0, 0.8666667, 1, 1,
0.07347218, -1.390044, 3.889061, 0, 0.8627451, 1, 1,
0.07490125, 0.1394302, 0.8254212, 0, 0.854902, 1, 1,
0.07775483, -2.797149, 1.615964, 0, 0.8509804, 1, 1,
0.0779277, 0.4581248, -0.02928214, 0, 0.8431373, 1, 1,
0.08314557, 0.3198716, -1.262747, 0, 0.8392157, 1, 1,
0.08878476, 0.3928637, -1.294048, 0, 0.8313726, 1, 1,
0.09575185, -0.3517101, 0.7052978, 0, 0.827451, 1, 1,
0.09748146, -1.724965, 2.634924, 0, 0.8196079, 1, 1,
0.1023956, 1.109167, -0.1248811, 0, 0.8156863, 1, 1,
0.1026692, 0.5936437, 1.271774, 0, 0.8078431, 1, 1,
0.1039648, -0.06609232, 2.007996, 0, 0.8039216, 1, 1,
0.1041713, -0.4415236, 4.606113, 0, 0.7960784, 1, 1,
0.1117788, -0.8162758, 1.514043, 0, 0.7882353, 1, 1,
0.1119329, -0.278059, 1.950662, 0, 0.7843137, 1, 1,
0.1129101, -0.005832827, 1.58727, 0, 0.7764706, 1, 1,
0.1132981, 0.9944701, -1.110945, 0, 0.772549, 1, 1,
0.1227202, -0.2433454, 0.5687192, 0, 0.7647059, 1, 1,
0.1237422, 0.2767785, -0.2445081, 0, 0.7607843, 1, 1,
0.1238286, 2.233384, 1.987907, 0, 0.7529412, 1, 1,
0.1241979, 1.56804, 1.82179, 0, 0.7490196, 1, 1,
0.1252749, -0.5853853, 2.588086, 0, 0.7411765, 1, 1,
0.1258511, 0.9839298, -0.1587154, 0, 0.7372549, 1, 1,
0.1292677, 0.6995968, -0.1849172, 0, 0.7294118, 1, 1,
0.1323492, -0.2269665, 2.048501, 0, 0.7254902, 1, 1,
0.1329131, 1.856201, 1.261188, 0, 0.7176471, 1, 1,
0.1337066, 0.3569112, -0.7178929, 0, 0.7137255, 1, 1,
0.1374135, -0.2279523, 0.782639, 0, 0.7058824, 1, 1,
0.1403788, -0.2409619, 1.611978, 0, 0.6980392, 1, 1,
0.1417726, 0.8464258, 0.7239367, 0, 0.6941177, 1, 1,
0.1422111, -1.464315, 3.2323, 0, 0.6862745, 1, 1,
0.1536182, -0.3625102, 4.192188, 0, 0.682353, 1, 1,
0.1633795, 0.3215213, 0.3296901, 0, 0.6745098, 1, 1,
0.1640316, -0.09403584, 4.29287, 0, 0.6705883, 1, 1,
0.1655764, 0.4442512, -0.4935502, 0, 0.6627451, 1, 1,
0.1659492, -2.21424, 2.771491, 0, 0.6588235, 1, 1,
0.1679979, -0.7016637, 3.885517, 0, 0.6509804, 1, 1,
0.1773982, 1.465231, -0.4486586, 0, 0.6470588, 1, 1,
0.1781451, 1.606375, 0.8150092, 0, 0.6392157, 1, 1,
0.1786562, -0.982556, 3.609997, 0, 0.6352941, 1, 1,
0.1827877, -1.293633, 2.283277, 0, 0.627451, 1, 1,
0.1870675, -0.257438, 2.908091, 0, 0.6235294, 1, 1,
0.1989118, 0.352167, 2.756822, 0, 0.6156863, 1, 1,
0.2009618, 0.9576003, 0.2080829, 0, 0.6117647, 1, 1,
0.2024837, 0.02024332, 1.711052, 0, 0.6039216, 1, 1,
0.203245, -1.730126, 1.012069, 0, 0.5960785, 1, 1,
0.2051103, -1.533406, 2.141019, 0, 0.5921569, 1, 1,
0.2080045, 1.518751, -0.1511487, 0, 0.5843138, 1, 1,
0.2111967, 1.50175, 0.9236104, 0, 0.5803922, 1, 1,
0.2114781, -0.4970429, 1.997871, 0, 0.572549, 1, 1,
0.2132798, 0.1262328, 1.086408, 0, 0.5686275, 1, 1,
0.2174919, 0.4068926, -0.3664101, 0, 0.5607843, 1, 1,
0.2191076, -0.4334081, 2.92781, 0, 0.5568628, 1, 1,
0.2257867, -0.4589694, 4.42008, 0, 0.5490196, 1, 1,
0.229909, -1.161092, 4.440623, 0, 0.5450981, 1, 1,
0.2301639, -0.2344262, 2.176543, 0, 0.5372549, 1, 1,
0.2450341, 0.05075321, 1.528895, 0, 0.5333334, 1, 1,
0.2459209, -1.466244, 4.276667, 0, 0.5254902, 1, 1,
0.2479525, -0.1696027, 1.180857, 0, 0.5215687, 1, 1,
0.2483052, 0.3017395, 0.40975, 0, 0.5137255, 1, 1,
0.2494134, -0.3345838, 1.424678, 0, 0.509804, 1, 1,
0.2498981, 0.03387088, 0.3336634, 0, 0.5019608, 1, 1,
0.2501605, -1.228904, 5.229753, 0, 0.4941176, 1, 1,
0.2503295, 2.742197, -0.1135615, 0, 0.4901961, 1, 1,
0.2542392, -0.6690415, 1.663602, 0, 0.4823529, 1, 1,
0.2550052, -0.9353188, 4.228194, 0, 0.4784314, 1, 1,
0.262956, 0.5317059, 1.119549, 0, 0.4705882, 1, 1,
0.2640183, 0.02196489, 1.104379, 0, 0.4666667, 1, 1,
0.2650797, 1.333344, -0.4399575, 0, 0.4588235, 1, 1,
0.2716225, 1.0942, -0.8141201, 0, 0.454902, 1, 1,
0.2738611, 1.077118, -0.5267398, 0, 0.4470588, 1, 1,
0.273862, -1.91381, 1.843098, 0, 0.4431373, 1, 1,
0.2761991, -0.1017733, 1.543427, 0, 0.4352941, 1, 1,
0.2778241, 0.2678122, 0.9419802, 0, 0.4313726, 1, 1,
0.2784085, 1.070109, -0.7055327, 0, 0.4235294, 1, 1,
0.280879, -1.398536, 2.691378, 0, 0.4196078, 1, 1,
0.2823888, -1.096159, 3.736537, 0, 0.4117647, 1, 1,
0.2848546, -0.07460599, 1.721683, 0, 0.4078431, 1, 1,
0.2916052, -0.1443763, 1.321123, 0, 0.4, 1, 1,
0.2925208, 0.7707346, -0.7569324, 0, 0.3921569, 1, 1,
0.2939149, -0.5622192, 2.906119, 0, 0.3882353, 1, 1,
0.2951909, -0.6591378, 2.022285, 0, 0.3803922, 1, 1,
0.2994249, -1.64104, 2.663964, 0, 0.3764706, 1, 1,
0.3071688, -0.757627, 2.361297, 0, 0.3686275, 1, 1,
0.3073193, 0.6715845, 0.4619355, 0, 0.3647059, 1, 1,
0.3144431, -1.911463, 2.855008, 0, 0.3568628, 1, 1,
0.3204986, -0.3773703, 1.51552, 0, 0.3529412, 1, 1,
0.3206402, -0.1403231, 1.521194, 0, 0.345098, 1, 1,
0.3245477, -0.5976199, 3.5983, 0, 0.3411765, 1, 1,
0.3327042, 0.8009241, 0.3374108, 0, 0.3333333, 1, 1,
0.3337354, 1.387161, -1.976282, 0, 0.3294118, 1, 1,
0.3360991, 1.610914, 0.472075, 0, 0.3215686, 1, 1,
0.3383633, -1.520733, 2.725242, 0, 0.3176471, 1, 1,
0.3403863, -0.6246627, 3.364951, 0, 0.3098039, 1, 1,
0.3418817, -0.9604802, 1.474068, 0, 0.3058824, 1, 1,
0.346863, -0.0515533, 2.44555, 0, 0.2980392, 1, 1,
0.3482366, -0.1579158, 2.667665, 0, 0.2901961, 1, 1,
0.3492188, -2.189588, 3.187865, 0, 0.2862745, 1, 1,
0.3502684, 0.3096235, 1.068547, 0, 0.2784314, 1, 1,
0.350642, 0.7880552, 1.452013, 0, 0.2745098, 1, 1,
0.3554875, 0.1966902, 3.02015, 0, 0.2666667, 1, 1,
0.3639637, -1.137997, 2.09832, 0, 0.2627451, 1, 1,
0.3659617, 0.8633163, -0.3854136, 0, 0.254902, 1, 1,
0.3667454, -0.607905, 2.302349, 0, 0.2509804, 1, 1,
0.3709028, 0.6186944, 0.06105085, 0, 0.2431373, 1, 1,
0.3724982, 0.1073495, -0.6582566, 0, 0.2392157, 1, 1,
0.3744655, 0.470957, -0.3300868, 0, 0.2313726, 1, 1,
0.3758576, -3.079313, 4.205903, 0, 0.227451, 1, 1,
0.381041, -0.4525686, 1.189514, 0, 0.2196078, 1, 1,
0.3842131, 0.06805796, 2.950703, 0, 0.2156863, 1, 1,
0.384859, 0.5196981, 0.6054952, 0, 0.2078431, 1, 1,
0.3861993, 0.1673926, 1.533958, 0, 0.2039216, 1, 1,
0.3884832, 0.8711019, 1.88777, 0, 0.1960784, 1, 1,
0.3900791, 0.4831409, -0.2376097, 0, 0.1882353, 1, 1,
0.390585, 0.1187602, 0.8663532, 0, 0.1843137, 1, 1,
0.3933819, 0.8123359, 0.8940166, 0, 0.1764706, 1, 1,
0.3940804, -1.462713, 4.217579, 0, 0.172549, 1, 1,
0.3966165, -0.6149466, 2.101386, 0, 0.1647059, 1, 1,
0.3986818, 0.8318825, 2.407762, 0, 0.1607843, 1, 1,
0.4104974, -0.7084979, 3.874449, 0, 0.1529412, 1, 1,
0.4132797, -2.540772, 4.027515, 0, 0.1490196, 1, 1,
0.4186976, -0.02267904, 2.464283, 0, 0.1411765, 1, 1,
0.4196711, -2.077628, 2.569193, 0, 0.1372549, 1, 1,
0.4210864, 0.9881812, -1.078377, 0, 0.1294118, 1, 1,
0.4239351, -0.1426619, 3.364259, 0, 0.1254902, 1, 1,
0.4258426, 0.03987184, 2.829854, 0, 0.1176471, 1, 1,
0.4292463, 1.111971, 2.360288, 0, 0.1137255, 1, 1,
0.4339586, 0.3080552, -0.1191643, 0, 0.1058824, 1, 1,
0.4365815, 0.3646531, 0.4310249, 0, 0.09803922, 1, 1,
0.4401045, 1.54585, -1.775386, 0, 0.09411765, 1, 1,
0.4436379, -0.1224665, 0.6239117, 0, 0.08627451, 1, 1,
0.4534208, 0.2869919, -0.09149238, 0, 0.08235294, 1, 1,
0.4538314, -0.9541955, 4.153694, 0, 0.07450981, 1, 1,
0.45928, -1.913216, 2.352103, 0, 0.07058824, 1, 1,
0.4611409, -0.3091892, 3.266072, 0, 0.0627451, 1, 1,
0.4617101, -0.4168335, 4.401813, 0, 0.05882353, 1, 1,
0.4620449, -0.526541, 4.85359, 0, 0.05098039, 1, 1,
0.4634363, -1.934079, 3.049186, 0, 0.04705882, 1, 1,
0.467854, 0.7783691, 0.6738382, 0, 0.03921569, 1, 1,
0.4681822, -0.1097893, 2.056287, 0, 0.03529412, 1, 1,
0.468677, 0.6452152, -0.1476108, 0, 0.02745098, 1, 1,
0.4710488, -0.004811034, 0.8509859, 0, 0.02352941, 1, 1,
0.4754643, -1.206967, 3.148125, 0, 0.01568628, 1, 1,
0.4754852, -0.3148541, 0.2551168, 0, 0.01176471, 1, 1,
0.4762346, -0.7918985, 2.504196, 0, 0.003921569, 1, 1,
0.4796317, -0.9698262, 4.596373, 0.003921569, 0, 1, 1,
0.4859732, -1.378819, 3.359805, 0.007843138, 0, 1, 1,
0.489858, -0.4262942, 2.004989, 0.01568628, 0, 1, 1,
0.4929293, 0.2395539, 1.381593, 0.01960784, 0, 1, 1,
0.4956091, -1.545779, 2.154474, 0.02745098, 0, 1, 1,
0.4961152, 1.281248, 1.702587, 0.03137255, 0, 1, 1,
0.4971015, 0.1557855, 2.532317, 0.03921569, 0, 1, 1,
0.5006281, -0.8996341, 3.507819, 0.04313726, 0, 1, 1,
0.5054858, -0.6752881, 2.097184, 0.05098039, 0, 1, 1,
0.5059275, 0.6776529, 0.3651758, 0.05490196, 0, 1, 1,
0.5094441, -0.8692726, 3.376088, 0.0627451, 0, 1, 1,
0.512493, 1.014367, 0.7052189, 0.06666667, 0, 1, 1,
0.5230534, -0.6363987, 3.04013, 0.07450981, 0, 1, 1,
0.5255237, 0.6450664, -0.08111648, 0.07843138, 0, 1, 1,
0.5263034, 0.1291316, 1.433831, 0.08627451, 0, 1, 1,
0.5305256, -0.1220439, 0.972594, 0.09019608, 0, 1, 1,
0.5330704, 0.261517, 1.246406, 0.09803922, 0, 1, 1,
0.535444, -0.8998363, 3.669998, 0.1058824, 0, 1, 1,
0.5388258, 1.336287, -0.5442542, 0.1098039, 0, 1, 1,
0.5400246, -0.7453979, 3.080778, 0.1176471, 0, 1, 1,
0.5408111, 1.772703, -0.8329654, 0.1215686, 0, 1, 1,
0.5423296, 2.503028, 2.070425, 0.1294118, 0, 1, 1,
0.5429184, 2.253988, 1.154773, 0.1333333, 0, 1, 1,
0.5457184, -0.6179589, 2.559776, 0.1411765, 0, 1, 1,
0.5494094, 1.172728, 1.424942, 0.145098, 0, 1, 1,
0.5507773, 1.439897, 0.244323, 0.1529412, 0, 1, 1,
0.5533586, 2.097734, 1.578735, 0.1568628, 0, 1, 1,
0.5575019, -1.599456, 2.048848, 0.1647059, 0, 1, 1,
0.5599691, 2.112008, 2.53273, 0.1686275, 0, 1, 1,
0.5627642, -0.1021636, 1.557425, 0.1764706, 0, 1, 1,
0.5644849, -1.604906, 2.715897, 0.1803922, 0, 1, 1,
0.572017, 0.1131933, 0.8975897, 0.1882353, 0, 1, 1,
0.57254, 0.5259675, 1.525211, 0.1921569, 0, 1, 1,
0.5760166, 0.5742021, 1.47143, 0.2, 0, 1, 1,
0.5764577, -0.8356884, 2.741463, 0.2078431, 0, 1, 1,
0.5812394, 0.4080172, 0.08744336, 0.2117647, 0, 1, 1,
0.5816694, -0.3817928, 1.87862, 0.2196078, 0, 1, 1,
0.5868353, -1.702651, 4.27081, 0.2235294, 0, 1, 1,
0.588056, 0.9951438, -0.9430709, 0.2313726, 0, 1, 1,
0.5890276, 0.2762591, -0.5980367, 0.2352941, 0, 1, 1,
0.5903649, 0.1047604, 0.793649, 0.2431373, 0, 1, 1,
0.5910618, 0.5835174, 0.6920499, 0.2470588, 0, 1, 1,
0.6024282, 1.040275, 0.6347989, 0.254902, 0, 1, 1,
0.6047122, 0.7175252, -0.08502696, 0.2588235, 0, 1, 1,
0.6088958, -0.9709179, -0.2530482, 0.2666667, 0, 1, 1,
0.6127411, -0.2409478, 0.6103271, 0.2705882, 0, 1, 1,
0.6145787, -0.9582652, 2.627723, 0.2784314, 0, 1, 1,
0.6182364, -1.528794, 2.639518, 0.282353, 0, 1, 1,
0.6198142, -0.7790963, 2.686784, 0.2901961, 0, 1, 1,
0.6234947, 0.5778895, 2.075548, 0.2941177, 0, 1, 1,
0.6239217, 0.5560365, 2.382716, 0.3019608, 0, 1, 1,
0.6245799, -1.544872, 4.380796, 0.3098039, 0, 1, 1,
0.6247478, -1.629684, 4.472329, 0.3137255, 0, 1, 1,
0.6286815, -0.8948581, 2.436626, 0.3215686, 0, 1, 1,
0.6316493, 1.100047, 0.8834056, 0.3254902, 0, 1, 1,
0.6379846, -0.477535, 3.0284, 0.3333333, 0, 1, 1,
0.6402876, -0.4080623, 2.577628, 0.3372549, 0, 1, 1,
0.6416385, 0.7736295, 2.181278, 0.345098, 0, 1, 1,
0.6437013, 1.240372, -0.1199621, 0.3490196, 0, 1, 1,
0.6461166, 0.02007879, 2.422603, 0.3568628, 0, 1, 1,
0.6472925, 0.03585058, 2.844213, 0.3607843, 0, 1, 1,
0.6519191, 1.19101, 2.025105, 0.3686275, 0, 1, 1,
0.6530119, 0.4040682, 1.299799, 0.372549, 0, 1, 1,
0.6539367, -0.1823207, 1.38561, 0.3803922, 0, 1, 1,
0.6570864, 0.8086914, 0.03326472, 0.3843137, 0, 1, 1,
0.657876, 0.9124862, 2.544827, 0.3921569, 0, 1, 1,
0.6589546, 0.2661357, 1.268452, 0.3960784, 0, 1, 1,
0.6593215, -1.625076, 0.5518686, 0.4039216, 0, 1, 1,
0.6728563, -2.143031, 2.58976, 0.4117647, 0, 1, 1,
0.6728757, -0.8416663, 1.849365, 0.4156863, 0, 1, 1,
0.6865738, 0.9821029, 0.7272035, 0.4235294, 0, 1, 1,
0.6932414, 1.742656, -0.1985383, 0.427451, 0, 1, 1,
0.6971957, 0.8541824, 1.374093, 0.4352941, 0, 1, 1,
0.6996312, -0.8069275, 1.406289, 0.4392157, 0, 1, 1,
0.7102519, -1.169016, 2.581517, 0.4470588, 0, 1, 1,
0.7145455, 0.2266209, 0.4774505, 0.4509804, 0, 1, 1,
0.7183198, 1.951571, 0.8799313, 0.4588235, 0, 1, 1,
0.7205688, 0.1031437, 1.82703, 0.4627451, 0, 1, 1,
0.7205825, 0.5192313, 2.49281, 0.4705882, 0, 1, 1,
0.7224457, -0.6038502, 4.055609, 0.4745098, 0, 1, 1,
0.7245399, 1.434686, 0.328266, 0.4823529, 0, 1, 1,
0.7253415, 1.091529, -0.1897266, 0.4862745, 0, 1, 1,
0.7344548, -1.945672, 1.631991, 0.4941176, 0, 1, 1,
0.7415329, -1.761962, 3.618601, 0.5019608, 0, 1, 1,
0.7426701, 0.1191767, 1.662442, 0.5058824, 0, 1, 1,
0.7427148, -1.364534, 3.102732, 0.5137255, 0, 1, 1,
0.7467167, 0.3332461, -0.122788, 0.5176471, 0, 1, 1,
0.7481186, -1.496484, 2.672569, 0.5254902, 0, 1, 1,
0.7523289, -0.6097192, 1.851192, 0.5294118, 0, 1, 1,
0.7558368, -0.3018317, 0.4031352, 0.5372549, 0, 1, 1,
0.7624371, -0.6654822, 3.447927, 0.5411765, 0, 1, 1,
0.7686153, 0.9738268, 0.1581272, 0.5490196, 0, 1, 1,
0.7730599, 0.004641527, 1.324336, 0.5529412, 0, 1, 1,
0.7752666, 1.757245, 0.1350902, 0.5607843, 0, 1, 1,
0.779243, 1.122304, 0.9733028, 0.5647059, 0, 1, 1,
0.7808272, 0.844099, 1.363238, 0.572549, 0, 1, 1,
0.7812042, -0.4111361, 3.946846, 0.5764706, 0, 1, 1,
0.7865396, -1.766375, 3.074562, 0.5843138, 0, 1, 1,
0.7870793, 0.03457962, 3.478175, 0.5882353, 0, 1, 1,
0.7891265, 0.9926909, 0.6832319, 0.5960785, 0, 1, 1,
0.7939739, 0.7391105, 0.7764835, 0.6039216, 0, 1, 1,
0.7968857, -0.03196188, 2.752465, 0.6078432, 0, 1, 1,
0.8019326, -0.9309785, 2.198267, 0.6156863, 0, 1, 1,
0.8093771, -1.101372, 1.583776, 0.6196079, 0, 1, 1,
0.8100719, -0.8173692, 2.492131, 0.627451, 0, 1, 1,
0.8165428, -1.335234, 2.552692, 0.6313726, 0, 1, 1,
0.8228365, -1.219218, 2.302868, 0.6392157, 0, 1, 1,
0.8253806, 0.4028496, 0.7585776, 0.6431373, 0, 1, 1,
0.8263235, -1.759887, 1.50568, 0.6509804, 0, 1, 1,
0.8265556, 0.1438875, 2.052358, 0.654902, 0, 1, 1,
0.8313065, 1.032455, 0.6315092, 0.6627451, 0, 1, 1,
0.8322183, -1.196714, 2.192796, 0.6666667, 0, 1, 1,
0.8333884, 1.052242, 0.598865, 0.6745098, 0, 1, 1,
0.8424951, -0.3991115, 2.912089, 0.6784314, 0, 1, 1,
0.8460402, 0.7575786, 0.2738694, 0.6862745, 0, 1, 1,
0.8480267, 0.1613818, 1.408041, 0.6901961, 0, 1, 1,
0.855816, -1.509928, 2.783968, 0.6980392, 0, 1, 1,
0.8588216, 0.6017042, 1.22648, 0.7058824, 0, 1, 1,
0.8661946, -0.8883518, 1.544589, 0.7098039, 0, 1, 1,
0.8685474, 1.096083, -0.2297351, 0.7176471, 0, 1, 1,
0.8725994, 1.526677, 1.496049, 0.7215686, 0, 1, 1,
0.8771976, -0.9513122, 2.567219, 0.7294118, 0, 1, 1,
0.8862227, -0.4428862, 2.248189, 0.7333333, 0, 1, 1,
0.8880953, 0.6231236, -0.8126041, 0.7411765, 0, 1, 1,
0.8886654, -1.653003, 1.042233, 0.7450981, 0, 1, 1,
0.8912197, -1.414716, 2.112051, 0.7529412, 0, 1, 1,
0.8919563, -0.1331932, 2.063893, 0.7568628, 0, 1, 1,
0.8922834, 0.3585029, 2.276563, 0.7647059, 0, 1, 1,
0.8985435, 0.3466257, 1.778737, 0.7686275, 0, 1, 1,
0.8997927, -0.9604567, 2.792819, 0.7764706, 0, 1, 1,
0.9082155, 1.443381, -0.3251769, 0.7803922, 0, 1, 1,
0.9118184, 0.03485537, 2.375535, 0.7882353, 0, 1, 1,
0.9156972, -0.4249637, 0.3124394, 0.7921569, 0, 1, 1,
0.9169647, 1.679183, -0.3976311, 0.8, 0, 1, 1,
0.9206082, -0.5041091, 3.709877, 0.8078431, 0, 1, 1,
0.9210826, -0.864088, 2.611511, 0.8117647, 0, 1, 1,
0.9213184, 1.767606, 2.144105, 0.8196079, 0, 1, 1,
0.9235977, -0.4482977, -0.5035952, 0.8235294, 0, 1, 1,
0.9293554, -0.6266356, 0.198084, 0.8313726, 0, 1, 1,
0.9304522, 0.5296316, 1.495688, 0.8352941, 0, 1, 1,
0.9324772, -0.1569959, 1.540634, 0.8431373, 0, 1, 1,
0.9329516, -0.4104412, 1.254594, 0.8470588, 0, 1, 1,
0.9356306, 0.8461726, 1.111245, 0.854902, 0, 1, 1,
0.9397158, 0.387637, 2.178774, 0.8588235, 0, 1, 1,
0.9478349, -1.288305, 2.156106, 0.8666667, 0, 1, 1,
0.9537053, 0.3487815, -0.04719691, 0.8705882, 0, 1, 1,
0.9548591, -0.579011, 1.24042, 0.8784314, 0, 1, 1,
0.9598404, -0.7620249, 0.2292461, 0.8823529, 0, 1, 1,
0.9618437, 1.475509, 1.097421, 0.8901961, 0, 1, 1,
0.9654868, -0.574781, 2.798378, 0.8941177, 0, 1, 1,
0.9692288, -0.7592887, 3.197149, 0.9019608, 0, 1, 1,
0.971291, -0.04706924, 0.7197295, 0.9098039, 0, 1, 1,
0.9737785, -0.8218379, 2.558376, 0.9137255, 0, 1, 1,
0.9758837, -0.2204118, -0.1425268, 0.9215686, 0, 1, 1,
0.9795196, -1.153597, 1.280613, 0.9254902, 0, 1, 1,
0.9811659, 0.6463487, 3.426214, 0.9333333, 0, 1, 1,
0.9826599, 1.064531, 2.675488, 0.9372549, 0, 1, 1,
0.9900463, 0.9453009, 0.4185273, 0.945098, 0, 1, 1,
0.9910519, 0.06638064, 1.977438, 0.9490196, 0, 1, 1,
0.9935888, -0.1684594, -0.03193781, 0.9568627, 0, 1, 1,
1.004148, 0.2933518, 1.234829, 0.9607843, 0, 1, 1,
1.014718, 0.7629947, 2.714618, 0.9686275, 0, 1, 1,
1.023314, 0.3026879, 0.9341526, 0.972549, 0, 1, 1,
1.023953, -0.03480596, 0.1200467, 0.9803922, 0, 1, 1,
1.02472, -0.217681, 3.407572, 0.9843137, 0, 1, 1,
1.024784, 0.6052303, 1.492041, 0.9921569, 0, 1, 1,
1.027303, 0.3425219, 1.025017, 0.9960784, 0, 1, 1,
1.029129, -1.069943, 1.892388, 1, 0, 0.9960784, 1,
1.033841, -1.496932, 2.631212, 1, 0, 0.9882353, 1,
1.034595, -0.2860041, 2.551769, 1, 0, 0.9843137, 1,
1.035954, -0.4157295, 1.713347, 1, 0, 0.9764706, 1,
1.046466, 2.133951, -1.407287, 1, 0, 0.972549, 1,
1.049717, 0.3330294, 1.448232, 1, 0, 0.9647059, 1,
1.050011, -1.268182, 1.601998, 1, 0, 0.9607843, 1,
1.052678, 0.1147903, 2.143827, 1, 0, 0.9529412, 1,
1.055522, -0.5538656, 3.053563, 1, 0, 0.9490196, 1,
1.058217, 0.2258785, -0.1183838, 1, 0, 0.9411765, 1,
1.061188, 0.2518154, 0.5166208, 1, 0, 0.9372549, 1,
1.062083, 0.8736693, 2.438634, 1, 0, 0.9294118, 1,
1.063527, -2.213459, 2.55515, 1, 0, 0.9254902, 1,
1.065219, 0.476564, 1.46085, 1, 0, 0.9176471, 1,
1.068446, -2.673887, 2.929136, 1, 0, 0.9137255, 1,
1.075082, -0.863022, 1.952465, 1, 0, 0.9058824, 1,
1.080726, -0.06028211, 2.361134, 1, 0, 0.9019608, 1,
1.081649, -0.06050105, 1.021139, 1, 0, 0.8941177, 1,
1.085697, -0.7288436, 3.547181, 1, 0, 0.8862745, 1,
1.087367, -0.2814691, 1.598587, 1, 0, 0.8823529, 1,
1.096473, 0.02394745, 2.057947, 1, 0, 0.8745098, 1,
1.096752, -0.1267963, 0.5307183, 1, 0, 0.8705882, 1,
1.109151, -0.9771255, 2.846527, 1, 0, 0.8627451, 1,
1.114796, -0.4656773, 2.781377, 1, 0, 0.8588235, 1,
1.115526, 0.6000596, 0.4728398, 1, 0, 0.8509804, 1,
1.116406, -1.337386, 1.63295, 1, 0, 0.8470588, 1,
1.117016, -1.072459, 3.859718, 1, 0, 0.8392157, 1,
1.117039, -0.1071314, 1.169291, 1, 0, 0.8352941, 1,
1.117237, 0.123932, 0.3556212, 1, 0, 0.827451, 1,
1.125737, 0.7809407, 1.63928, 1, 0, 0.8235294, 1,
1.127969, -0.3812408, 1.358912, 1, 0, 0.8156863, 1,
1.14646, -1.149786, 1.564749, 1, 0, 0.8117647, 1,
1.14686, 0.1119156, -0.7205414, 1, 0, 0.8039216, 1,
1.14701, -0.4496228, 1.537507, 1, 0, 0.7960784, 1,
1.15004, 0.5132653, 2.133413, 1, 0, 0.7921569, 1,
1.153777, -0.1671564, 2.844499, 1, 0, 0.7843137, 1,
1.154732, 0.8989376, 0.8198214, 1, 0, 0.7803922, 1,
1.165909, 1.19145, -0.1686511, 1, 0, 0.772549, 1,
1.166019, -0.4396899, 1.445614, 1, 0, 0.7686275, 1,
1.177965, -0.3998546, 2.187077, 1, 0, 0.7607843, 1,
1.178928, -0.2212215, 1.167389, 1, 0, 0.7568628, 1,
1.186319, -0.4856274, 1.559445, 1, 0, 0.7490196, 1,
1.192407, 0.831072, 0.2896347, 1, 0, 0.7450981, 1,
1.193859, 0.6202585, 1.868284, 1, 0, 0.7372549, 1,
1.202882, 0.7694815, 0.3870379, 1, 0, 0.7333333, 1,
1.22907, 1.267848, 1.579326, 1, 0, 0.7254902, 1,
1.232277, 0.5531943, 1.483648, 1, 0, 0.7215686, 1,
1.239973, 0.5799495, 1.74038, 1, 0, 0.7137255, 1,
1.243438, 1.059854, 2.075585, 1, 0, 0.7098039, 1,
1.244026, 0.1129318, 2.652283, 1, 0, 0.7019608, 1,
1.248126, 0.7862166, 0.4116226, 1, 0, 0.6941177, 1,
1.257879, -0.4629598, 3.274193, 1, 0, 0.6901961, 1,
1.26014, 0.2588493, 2.590664, 1, 0, 0.682353, 1,
1.262451, -0.3473208, 0.8402628, 1, 0, 0.6784314, 1,
1.26487, 0.7072945, 0.9714131, 1, 0, 0.6705883, 1,
1.265859, 0.5656003, -0.2882364, 1, 0, 0.6666667, 1,
1.270224, -0.2260122, 0.560604, 1, 0, 0.6588235, 1,
1.270758, 2.244217, 1.608825, 1, 0, 0.654902, 1,
1.271383, -0.3249183, 2.496962, 1, 0, 0.6470588, 1,
1.271538, -0.5999104, 3.634434, 1, 0, 0.6431373, 1,
1.28207, 1.248393, 2.527041, 1, 0, 0.6352941, 1,
1.291109, -0.8591914, 2.828801, 1, 0, 0.6313726, 1,
1.292578, 0.4132992, 1.72103, 1, 0, 0.6235294, 1,
1.3039, 0.07618757, 1.836653, 1, 0, 0.6196079, 1,
1.321447, -1.264653, 2.404096, 1, 0, 0.6117647, 1,
1.322253, 0.2189085, 1.010131, 1, 0, 0.6078432, 1,
1.325531, -0.8530709, 4.011073, 1, 0, 0.6, 1,
1.335977, -0.4658688, 2.698348, 1, 0, 0.5921569, 1,
1.339809, 0.709609, 1.028059, 1, 0, 0.5882353, 1,
1.34269, 1.028628, -0.3658528, 1, 0, 0.5803922, 1,
1.347099, 0.4349315, 1.251801, 1, 0, 0.5764706, 1,
1.347498, -0.7972501, 2.736114, 1, 0, 0.5686275, 1,
1.354361, -0.7558106, 3.292011, 1, 0, 0.5647059, 1,
1.359349, 0.5525587, -0.1308227, 1, 0, 0.5568628, 1,
1.36098, 1.445119, 1.303749, 1, 0, 0.5529412, 1,
1.384794, 1.16667, 1.196842, 1, 0, 0.5450981, 1,
1.388548, 1.641083, 1.606247, 1, 0, 0.5411765, 1,
1.40095, 0.8508344, -0.02455112, 1, 0, 0.5333334, 1,
1.407528, -0.6967399, 2.790895, 1, 0, 0.5294118, 1,
1.416658, 1.241887, -0.1188298, 1, 0, 0.5215687, 1,
1.448806, 0.5031584, 1.13296, 1, 0, 0.5176471, 1,
1.449893, -0.199726, 0.505335, 1, 0, 0.509804, 1,
1.4586, -1.058481, 2.20052, 1, 0, 0.5058824, 1,
1.462063, 0.2330026, 0.7817605, 1, 0, 0.4980392, 1,
1.462256, 0.5886226, 0.8223983, 1, 0, 0.4901961, 1,
1.475852, 0.7950028, 2.305346, 1, 0, 0.4862745, 1,
1.479112, -0.7223714, 2.123447, 1, 0, 0.4784314, 1,
1.482491, 1.570807, -0.9391681, 1, 0, 0.4745098, 1,
1.48539, -0.2613341, 2.356241, 1, 0, 0.4666667, 1,
1.498928, -0.6527451, 1.216934, 1, 0, 0.4627451, 1,
1.507792, -0.6972981, 1.184154, 1, 0, 0.454902, 1,
1.508348, -0.6098095, 1.214818, 1, 0, 0.4509804, 1,
1.527079, -0.2895947, 2.109563, 1, 0, 0.4431373, 1,
1.529489, 0.8887541, 0.638642, 1, 0, 0.4392157, 1,
1.529501, 1.566131, -1.022569, 1, 0, 0.4313726, 1,
1.530796, 1.116847, 0.5726653, 1, 0, 0.427451, 1,
1.53802, 1.911106, 2.30149, 1, 0, 0.4196078, 1,
1.557973, 0.4758631, 1.85601, 1, 0, 0.4156863, 1,
1.572784, -0.7680702, 3.400775, 1, 0, 0.4078431, 1,
1.5799, -1.752028, 2.400301, 1, 0, 0.4039216, 1,
1.602668, 0.6780162, 1.809135, 1, 0, 0.3960784, 1,
1.606014, 1.491366, 1.563256, 1, 0, 0.3882353, 1,
1.610266, -0.3857686, 0.5655642, 1, 0, 0.3843137, 1,
1.612377, -0.2232254, 2.133447, 1, 0, 0.3764706, 1,
1.623664, 0.1531214, 1.311019, 1, 0, 0.372549, 1,
1.625784, -0.9931356, 1.526545, 1, 0, 0.3647059, 1,
1.626362, 0.1423405, 0.2167374, 1, 0, 0.3607843, 1,
1.644897, 1.068834, 1.686695, 1, 0, 0.3529412, 1,
1.655469, 1.379109, 0.7527415, 1, 0, 0.3490196, 1,
1.659834, -0.2601201, 1.267133, 1, 0, 0.3411765, 1,
1.660367, 0.6990983, 2.747691, 1, 0, 0.3372549, 1,
1.680494, 0.9622179, 1.784205, 1, 0, 0.3294118, 1,
1.704646, -1.174755, 2.558656, 1, 0, 0.3254902, 1,
1.721975, -0.7563009, 1.005969, 1, 0, 0.3176471, 1,
1.724697, -0.3456687, 4.327092, 1, 0, 0.3137255, 1,
1.767469, 0.0626459, 1.552072, 1, 0, 0.3058824, 1,
1.773545, -0.1908002, 1.375992, 1, 0, 0.2980392, 1,
1.775406, -0.1792423, 1.901564, 1, 0, 0.2941177, 1,
1.783555, 0.6754748, 0.1174586, 1, 0, 0.2862745, 1,
1.794565, -0.2695633, 1.456149, 1, 0, 0.282353, 1,
1.811384, 0.323789, 0.5161498, 1, 0, 0.2745098, 1,
1.814477, -0.8024202, 2.035062, 1, 0, 0.2705882, 1,
1.819629, 1.166283, 2.861132, 1, 0, 0.2627451, 1,
1.826063, 0.9809855, 0.03497795, 1, 0, 0.2588235, 1,
1.826427, -0.06536341, 2.531948, 1, 0, 0.2509804, 1,
1.826965, -0.140967, 1.750013, 1, 0, 0.2470588, 1,
1.828452, 0.1924795, 0.05405305, 1, 0, 0.2392157, 1,
1.934585, -1.537318, 2.400969, 1, 0, 0.2352941, 1,
1.935831, 1.433907, 1.536255, 1, 0, 0.227451, 1,
1.94334, 0.5199048, 0.1398897, 1, 0, 0.2235294, 1,
1.950551, -0.4374621, 1.151439, 1, 0, 0.2156863, 1,
1.953772, -1.835061, 3.151007, 1, 0, 0.2117647, 1,
2.009741, 0.8548194, -0.6613248, 1, 0, 0.2039216, 1,
2.020766, 1.069789, -0.6770284, 1, 0, 0.1960784, 1,
2.023096, 0.6652731, 1.6005, 1, 0, 0.1921569, 1,
2.042568, -0.9027901, 2.68309, 1, 0, 0.1843137, 1,
2.043673, -0.7888893, 1.229959, 1, 0, 0.1803922, 1,
2.051439, 0.2173487, 0.870701, 1, 0, 0.172549, 1,
2.052544, -0.5524301, 2.65187, 1, 0, 0.1686275, 1,
2.053393, -2.195717, 3.137546, 1, 0, 0.1607843, 1,
2.07001, 0.5014735, 0.7652674, 1, 0, 0.1568628, 1,
2.078354, -0.1172437, -0.5654571, 1, 0, 0.1490196, 1,
2.132513, 1.013007, 0.2921948, 1, 0, 0.145098, 1,
2.135878, 0.4102305, 3.249941, 1, 0, 0.1372549, 1,
2.17558, -0.1129789, 0.332827, 1, 0, 0.1333333, 1,
2.21694, -0.4926263, 3.946872, 1, 0, 0.1254902, 1,
2.220626, -0.1076232, 2.997507, 1, 0, 0.1215686, 1,
2.244306, -0.6420035, 3.017039, 1, 0, 0.1137255, 1,
2.253393, -0.1825543, 4.469705, 1, 0, 0.1098039, 1,
2.293743, 2.211323, 2.162092, 1, 0, 0.1019608, 1,
2.307205, 1.460978, 0.9512511, 1, 0, 0.09411765, 1,
2.31296, -1.530291, 1.384754, 1, 0, 0.09019608, 1,
2.341219, -1.366841, 0.716597, 1, 0, 0.08235294, 1,
2.410997, -0.7185827, 1.604177, 1, 0, 0.07843138, 1,
2.418143, 0.6630424, 0.2747709, 1, 0, 0.07058824, 1,
2.661893, -1.158985, 0.5397441, 1, 0, 0.06666667, 1,
2.664338, -0.08800915, 0.8749255, 1, 0, 0.05882353, 1,
2.783047, -0.04162697, 2.724958, 1, 0, 0.05490196, 1,
2.785337, 1.653058, 2.122257, 1, 0, 0.04705882, 1,
2.789444, 2.083807, 2.681151, 1, 0, 0.04313726, 1,
3.067906, 0.84797, 1.644595, 1, 0, 0.03529412, 1,
3.099204, -0.7819914, 2.642427, 1, 0, 0.03137255, 1,
3.118735, 1.494844, 1.437366, 1, 0, 0.02352941, 1,
3.247102, 0.3366728, 1.381377, 1, 0, 0.01960784, 1,
3.334065, 0.1768143, 1.554341, 1, 0, 0.01176471, 1,
3.438556, 0.200158, 2.0146, 1, 0, 0.007843138, 1
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
-0.07432163, -4.0789, -7.283966, 0, -0.5, 0.5, 0.5,
-0.07432163, -4.0789, -7.283966, 1, -0.5, 0.5, 0.5,
-0.07432163, -4.0789, -7.283966, 1, 1.5, 0.5, 0.5,
-0.07432163, -4.0789, -7.283966, 0, 1.5, 0.5, 0.5
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
-4.778064, -0.1306783, -7.283966, 0, -0.5, 0.5, 0.5,
-4.778064, -0.1306783, -7.283966, 1, -0.5, 0.5, 0.5,
-4.778064, -0.1306783, -7.283966, 1, 1.5, 0.5, 0.5,
-4.778064, -0.1306783, -7.283966, 0, 1.5, 0.5, 0.5
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
-4.778064, -4.0789, -0.02461028, 0, -0.5, 0.5, 0.5,
-4.778064, -4.0789, -0.02461028, 1, -0.5, 0.5, 0.5,
-4.778064, -4.0789, -0.02461028, 1, 1.5, 0.5, 0.5,
-4.778064, -4.0789, -0.02461028, 0, 1.5, 0.5, 0.5
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
-2, -3.167772, -5.60873,
2, -3.167772, -5.60873,
-2, -3.167772, -5.60873,
-2, -3.319627, -5.887936,
0, -3.167772, -5.60873,
0, -3.319627, -5.887936,
2, -3.167772, -5.60873,
2, -3.319627, -5.887936
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
-2, -3.623336, -6.446348, 0, -0.5, 0.5, 0.5,
-2, -3.623336, -6.446348, 1, -0.5, 0.5, 0.5,
-2, -3.623336, -6.446348, 1, 1.5, 0.5, 0.5,
-2, -3.623336, -6.446348, 0, 1.5, 0.5, 0.5,
0, -3.623336, -6.446348, 0, -0.5, 0.5, 0.5,
0, -3.623336, -6.446348, 1, -0.5, 0.5, 0.5,
0, -3.623336, -6.446348, 1, 1.5, 0.5, 0.5,
0, -3.623336, -6.446348, 0, 1.5, 0.5, 0.5,
2, -3.623336, -6.446348, 0, -0.5, 0.5, 0.5,
2, -3.623336, -6.446348, 1, -0.5, 0.5, 0.5,
2, -3.623336, -6.446348, 1, 1.5, 0.5, 0.5,
2, -3.623336, -6.446348, 0, 1.5, 0.5, 0.5
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
-3.692585, -3, -5.60873,
-3.692585, 2, -5.60873,
-3.692585, -3, -5.60873,
-3.873498, -3, -5.887936,
-3.692585, -2, -5.60873,
-3.873498, -2, -5.887936,
-3.692585, -1, -5.60873,
-3.873498, -1, -5.887936,
-3.692585, 0, -5.60873,
-3.873498, 0, -5.887936,
-3.692585, 1, -5.60873,
-3.873498, 1, -5.887936,
-3.692585, 2, -5.60873,
-3.873498, 2, -5.887936
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
-4.235325, -3, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, -3, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, -3, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, -3, -6.446348, 0, 1.5, 0.5, 0.5,
-4.235325, -2, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, -2, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, -2, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, -2, -6.446348, 0, 1.5, 0.5, 0.5,
-4.235325, -1, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, -1, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, -1, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, -1, -6.446348, 0, 1.5, 0.5, 0.5,
-4.235325, 0, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, 0, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, 0, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, 0, -6.446348, 0, 1.5, 0.5, 0.5,
-4.235325, 1, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, 1, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, 1, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, 1, -6.446348, 0, 1.5, 0.5, 0.5,
-4.235325, 2, -6.446348, 0, -0.5, 0.5, 0.5,
-4.235325, 2, -6.446348, 1, -0.5, 0.5, 0.5,
-4.235325, 2, -6.446348, 1, 1.5, 0.5, 0.5,
-4.235325, 2, -6.446348, 0, 1.5, 0.5, 0.5
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
-3.692585, -3.167772, -4,
-3.692585, -3.167772, 4,
-3.692585, -3.167772, -4,
-3.873498, -3.319627, -4,
-3.692585, -3.167772, -2,
-3.873498, -3.319627, -2,
-3.692585, -3.167772, 0,
-3.873498, -3.319627, 0,
-3.692585, -3.167772, 2,
-3.873498, -3.319627, 2,
-3.692585, -3.167772, 4,
-3.873498, -3.319627, 4
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
-4.235325, -3.623336, -4, 0, -0.5, 0.5, 0.5,
-4.235325, -3.623336, -4, 1, -0.5, 0.5, 0.5,
-4.235325, -3.623336, -4, 1, 1.5, 0.5, 0.5,
-4.235325, -3.623336, -4, 0, 1.5, 0.5, 0.5,
-4.235325, -3.623336, -2, 0, -0.5, 0.5, 0.5,
-4.235325, -3.623336, -2, 1, -0.5, 0.5, 0.5,
-4.235325, -3.623336, -2, 1, 1.5, 0.5, 0.5,
-4.235325, -3.623336, -2, 0, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 0, 0, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 0, 1, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 0, 1, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 0, 0, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 2, 0, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 2, 1, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 2, 1, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 2, 0, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 4, 0, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 4, 1, -0.5, 0.5, 0.5,
-4.235325, -3.623336, 4, 1, 1.5, 0.5, 0.5,
-4.235325, -3.623336, 4, 0, 1.5, 0.5, 0.5
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
-3.692585, -3.167772, -5.60873,
-3.692585, 2.906415, -5.60873,
-3.692585, -3.167772, 5.559509,
-3.692585, 2.906415, 5.559509,
-3.692585, -3.167772, -5.60873,
-3.692585, -3.167772, 5.559509,
-3.692585, 2.906415, -5.60873,
-3.692585, 2.906415, 5.559509,
-3.692585, -3.167772, -5.60873,
3.543942, -3.167772, -5.60873,
-3.692585, -3.167772, 5.559509,
3.543942, -3.167772, 5.559509,
-3.692585, 2.906415, -5.60873,
3.543942, 2.906415, -5.60873,
-3.692585, 2.906415, 5.559509,
3.543942, 2.906415, 5.559509,
3.543942, -3.167772, -5.60873,
3.543942, 2.906415, -5.60873,
3.543942, -3.167772, 5.559509,
3.543942, 2.906415, 5.559509,
3.543942, -3.167772, -5.60873,
3.543942, -3.167772, 5.559509,
3.543942, 2.906415, -5.60873,
3.543942, 2.906415, 5.559509
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
var radius = 7.811328;
var distance = 34.75348;
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
mvMatrix.translate( 0.07432163, 0.1306783, 0.02461028 );
mvMatrix.scale( 1.167101, 1.390435, 0.7562304 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.75348);
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
Claudetite<-read.table("Claudetite.xyz", skip=1)
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
-3.587199, -1.612204, -1.509047, 0, 0, 1, 1, 1,
-2.852532, 0.3232136, -0.07919114, 1, 0, 0, 1, 1,
-2.795433, 0.1429668, -1.276068, 1, 0, 0, 1, 1,
-2.786221, -1.391356, -3.306241, 1, 0, 0, 1, 1,
-2.761287, 0.5549842, -1.850334, 1, 0, 0, 1, 1,
-2.699569, -0.2578997, -2.044478, 1, 0, 0, 1, 1,
-2.662298, -0.7829067, -2.45301, 0, 0, 0, 1, 1,
-2.621984, -0.6078505, -3.305592, 0, 0, 0, 1, 1,
-2.4345, -0.4830576, -0.9808139, 0, 0, 0, 1, 1,
-2.434121, -1.02466, -3.313864, 0, 0, 0, 1, 1,
-2.370051, -0.4970306, -3.398111, 0, 0, 0, 1, 1,
-2.297123, -1.031676, -1.524573, 0, 0, 0, 1, 1,
-2.283097, 0.3702493, -2.51251, 0, 0, 0, 1, 1,
-2.229632, 0.1117661, -0.5116445, 1, 1, 1, 1, 1,
-2.22702, -0.3739188, -1.034605, 1, 1, 1, 1, 1,
-2.155555, -1.033688, -1.919236, 1, 1, 1, 1, 1,
-2.132611, -0.7780667, -1.99808, 1, 1, 1, 1, 1,
-2.057848, -2.052008, -2.165921, 1, 1, 1, 1, 1,
-2.05143, 0.2694996, -3.072477, 1, 1, 1, 1, 1,
-2.048954, 0.2666698, -1.02811, 1, 1, 1, 1, 1,
-2.045566, -0.8870944, -4.187359, 1, 1, 1, 1, 1,
-2.041383, 0.6631387, -1.698045, 1, 1, 1, 1, 1,
-2.032201, 0.1309142, 0.5292719, 1, 1, 1, 1, 1,
-2.004494, -1.125268, -2.233578, 1, 1, 1, 1, 1,
-1.985632, 0.8378652, -3.388518, 1, 1, 1, 1, 1,
-1.950237, 1.58557, -1.051009, 1, 1, 1, 1, 1,
-1.94721, -1.047718, -3.611558, 1, 1, 1, 1, 1,
-1.945054, 0.3638142, -2.649671, 1, 1, 1, 1, 1,
-1.941734, -0.9368272, -2.298365, 0, 0, 1, 1, 1,
-1.891665, 1.18845, -0.03344852, 1, 0, 0, 1, 1,
-1.883375, 0.174248, -1.951018, 1, 0, 0, 1, 1,
-1.878449, -1.62622, -0.8267866, 1, 0, 0, 1, 1,
-1.845768, 0.9059551, -1.757777, 1, 0, 0, 1, 1,
-1.810991, -1.65671, -1.375584, 1, 0, 0, 1, 1,
-1.787794, -0.5743553, -3.461308, 0, 0, 0, 1, 1,
-1.779401, -0.1025973, -2.582613, 0, 0, 0, 1, 1,
-1.777539, 0.07064671, -4.006368, 0, 0, 0, 1, 1,
-1.773032, 0.5678239, 1.916733, 0, 0, 0, 1, 1,
-1.769921, 1.74935, 0.8655865, 0, 0, 0, 1, 1,
-1.768449, -1.860728, -2.06205, 0, 0, 0, 1, 1,
-1.746078, -1.367066, -4.729813, 0, 0, 0, 1, 1,
-1.738787, -0.7705808, -1.916714, 1, 1, 1, 1, 1,
-1.738266, 0.1661577, -1.556445, 1, 1, 1, 1, 1,
-1.733314, 0.2984759, -3.30602, 1, 1, 1, 1, 1,
-1.719012, -0.8163484, -2.39732, 1, 1, 1, 1, 1,
-1.704609, -0.3039857, -3.755486, 1, 1, 1, 1, 1,
-1.702124, -2.289998, -3.818392, 1, 1, 1, 1, 1,
-1.700887, 0.6437429, -1.798061, 1, 1, 1, 1, 1,
-1.672017, -1.931414, -2.980375, 1, 1, 1, 1, 1,
-1.669595, -0.217511, -1.548189, 1, 1, 1, 1, 1,
-1.668929, 0.746051, -0.01586979, 1, 1, 1, 1, 1,
-1.661694, -2.491109, -2.332932, 1, 1, 1, 1, 1,
-1.656495, 1.217728, -1.901722, 1, 1, 1, 1, 1,
-1.648559, 0.5354082, -0.8641571, 1, 1, 1, 1, 1,
-1.647001, -1.161942, -3.816229, 1, 1, 1, 1, 1,
-1.644399, 1.591261, -1.30968, 1, 1, 1, 1, 1,
-1.639479, 0.3620382, -1.246226, 0, 0, 1, 1, 1,
-1.633958, -1.298372, -1.32311, 1, 0, 0, 1, 1,
-1.631314, -0.3253399, 0.09008399, 1, 0, 0, 1, 1,
-1.625418, -0.312341, -1.679942, 1, 0, 0, 1, 1,
-1.613026, 0.03214561, -0.7578946, 1, 0, 0, 1, 1,
-1.60372, 0.174038, -0.9528174, 1, 0, 0, 1, 1,
-1.599059, 0.6501094, -1.04524, 0, 0, 0, 1, 1,
-1.598214, -0.6387753, -1.87739, 0, 0, 0, 1, 1,
-1.593979, -0.370187, -0.9348421, 0, 0, 0, 1, 1,
-1.590493, -1.296289, -1.949628, 0, 0, 0, 1, 1,
-1.580957, 2.162583, -0.6601494, 0, 0, 0, 1, 1,
-1.578183, -0.1924543, -2.144521, 0, 0, 0, 1, 1,
-1.57807, 0.5091662, -1.180317, 0, 0, 0, 1, 1,
-1.563323, 0.2874409, 0.3558817, 1, 1, 1, 1, 1,
-1.552826, -0.6541134, -2.4416, 1, 1, 1, 1, 1,
-1.53487, -1.721404, -3.959069, 1, 1, 1, 1, 1,
-1.524445, 1.460514, -2.0106, 1, 1, 1, 1, 1,
-1.521072, -1.085721, -1.764673, 1, 1, 1, 1, 1,
-1.519709, 0.3289191, -2.527571, 1, 1, 1, 1, 1,
-1.505761, 0.6004625, -1.892794, 1, 1, 1, 1, 1,
-1.503647, 0.183455, -0.1509702, 1, 1, 1, 1, 1,
-1.501824, -0.2860849, -1.384496, 1, 1, 1, 1, 1,
-1.501221, 0.8604865, -1.682431, 1, 1, 1, 1, 1,
-1.481169, 0.3428361, -0.6968178, 1, 1, 1, 1, 1,
-1.465048, -1.474902, -2.231932, 1, 1, 1, 1, 1,
-1.463113, 2.048511, -0.2388814, 1, 1, 1, 1, 1,
-1.458152, -1.198467, -1.411513, 1, 1, 1, 1, 1,
-1.455912, -0.5733361, -2.11532, 1, 1, 1, 1, 1,
-1.453059, 0.7158921, 0.9724824, 0, 0, 1, 1, 1,
-1.451828, -1.040346, -2.3961, 1, 0, 0, 1, 1,
-1.445986, -0.2929851, -2.207264, 1, 0, 0, 1, 1,
-1.440678, 0.8507403, -0.1624948, 1, 0, 0, 1, 1,
-1.440379, -1.193647, -1.620477, 1, 0, 0, 1, 1,
-1.43692, -0.6053773, -0.5810007, 1, 0, 0, 1, 1,
-1.425195, 0.09153021, -2.21719, 0, 0, 0, 1, 1,
-1.424627, 1.456626, -0.245118, 0, 0, 0, 1, 1,
-1.420199, 1.387755, -0.2071653, 0, 0, 0, 1, 1,
-1.41515, 0.1469007, 0.3046008, 0, 0, 0, 1, 1,
-1.41072, 0.2894951, -1.461761, 0, 0, 0, 1, 1,
-1.377297, -1.886365, -2.461471, 0, 0, 0, 1, 1,
-1.375916, 1.215968, -0.5271805, 0, 0, 0, 1, 1,
-1.360335, -0.2398406, -1.371522, 1, 1, 1, 1, 1,
-1.358882, -0.3117378, -0.04706734, 1, 1, 1, 1, 1,
-1.348863, 0.1459358, -2.193775, 1, 1, 1, 1, 1,
-1.34742, -1.196073, -2.729172, 1, 1, 1, 1, 1,
-1.341451, 0.1782153, -1.984421, 1, 1, 1, 1, 1,
-1.338393, -0.6020468, -1.97663, 1, 1, 1, 1, 1,
-1.335589, 0.2199334, -2.203899, 1, 1, 1, 1, 1,
-1.331632, 1.092145, -2.084682, 1, 1, 1, 1, 1,
-1.315123, -2.025468, -2.739232, 1, 1, 1, 1, 1,
-1.315032, 1.134093, -1.611981, 1, 1, 1, 1, 1,
-1.304467, 0.007921496, -0.9855345, 1, 1, 1, 1, 1,
-1.285911, -0.8890845, -1.865562, 1, 1, 1, 1, 1,
-1.285432, 0.6341318, -1.189186, 1, 1, 1, 1, 1,
-1.273933, 0.1743657, 1.010871, 1, 1, 1, 1, 1,
-1.273484, -0.3906189, -2.698536, 1, 1, 1, 1, 1,
-1.268137, 1.085341, -0.6908138, 0, 0, 1, 1, 1,
-1.262431, -0.4691804, -2.574265, 1, 0, 0, 1, 1,
-1.260298, -1.192284, -3.526948, 1, 0, 0, 1, 1,
-1.256971, -1.640858, -2.862999, 1, 0, 0, 1, 1,
-1.248801, -1.75046, -2.003834, 1, 0, 0, 1, 1,
-1.247005, -1.766776, -2.153, 1, 0, 0, 1, 1,
-1.219067, -0.1811814, -2.234859, 0, 0, 0, 1, 1,
-1.215564, 0.5247285, -0.7536186, 0, 0, 0, 1, 1,
-1.214605, -0.110497, -2.162437, 0, 0, 0, 1, 1,
-1.200158, 0.3528475, -0.5461004, 0, 0, 0, 1, 1,
-1.198209, 0.9006007, 0.05730054, 0, 0, 0, 1, 1,
-1.193091, -0.2165098, -2.021819, 0, 0, 0, 1, 1,
-1.1912, -2.709342, -3.513006, 0, 0, 0, 1, 1,
-1.190387, -0.0798573, -1.976257, 1, 1, 1, 1, 1,
-1.184901, 2.249115, -0.6254782, 1, 1, 1, 1, 1,
-1.181053, -1.561923, -4.4082, 1, 1, 1, 1, 1,
-1.169518, -0.1741971, -2.445034, 1, 1, 1, 1, 1,
-1.15823, -0.7784167, -3.944793, 1, 1, 1, 1, 1,
-1.157987, -1.796539, -2.805856, 1, 1, 1, 1, 1,
-1.155992, 0.1496201, -2.08033, 1, 1, 1, 1, 1,
-1.153317, 1.757932, 0.3760304, 1, 1, 1, 1, 1,
-1.147714, -0.1703626, -2.512481, 1, 1, 1, 1, 1,
-1.146166, 0.5258253, -1.214004, 1, 1, 1, 1, 1,
-1.140657, -1.294016, -1.019922, 1, 1, 1, 1, 1,
-1.137521, -0.7465459, -1.717083, 1, 1, 1, 1, 1,
-1.132904, -0.1243143, -1.394723, 1, 1, 1, 1, 1,
-1.128274, 0.4335214, -1.829921, 1, 1, 1, 1, 1,
-1.122027, 0.01838993, -1.549519, 1, 1, 1, 1, 1,
-1.122005, 1.240767, -1.471314, 0, 0, 1, 1, 1,
-1.118079, 1.019222, -2.500757, 1, 0, 0, 1, 1,
-1.112347, 1.121065, -0.3469699, 1, 0, 0, 1, 1,
-1.110046, 1.06627, 0.196914, 1, 0, 0, 1, 1,
-1.107545, -0.7875378, -4.608136, 1, 0, 0, 1, 1,
-1.106621, -1.419834, -2.431757, 1, 0, 0, 1, 1,
-1.100687, -0.8095121, -2.26574, 0, 0, 0, 1, 1,
-1.100499, 1.333277, -1.79515, 0, 0, 0, 1, 1,
-1.09323, 0.4811148, -0.2400973, 0, 0, 0, 1, 1,
-1.08836, 0.8868599, -1.5336, 0, 0, 0, 1, 1,
-1.086533, -0.5947471, -2.102093, 0, 0, 0, 1, 1,
-1.085025, -1.030903, -2.925671, 0, 0, 0, 1, 1,
-1.081498, -1.233779, -1.961294, 0, 0, 0, 1, 1,
-1.077384, 0.3088463, -1.629239, 1, 1, 1, 1, 1,
-1.074026, -0.5665178, -1.528873, 1, 1, 1, 1, 1,
-1.069138, 0.538431, -0.2724706, 1, 1, 1, 1, 1,
-1.066411, 1.070381, -0.1790698, 1, 1, 1, 1, 1,
-1.064349, 0.9380266, -0.7856148, 1, 1, 1, 1, 1,
-1.060766, 1.6247, -0.144951, 1, 1, 1, 1, 1,
-1.059316, 0.05789462, -0.02103299, 1, 1, 1, 1, 1,
-1.058437, -1.11505, -1.482901, 1, 1, 1, 1, 1,
-1.055061, 1.632276, -0.8309114, 1, 1, 1, 1, 1,
-1.049937, -0.3737782, -1.781223, 1, 1, 1, 1, 1,
-1.046698, -0.09843537, -2.567312, 1, 1, 1, 1, 1,
-1.03937, 0.3246696, -0.5316387, 1, 1, 1, 1, 1,
-1.033636, -2.477788, -2.405851, 1, 1, 1, 1, 1,
-1.028955, 0.745487, -0.9493632, 1, 1, 1, 1, 1,
-1.028932, 0.4961235, -1.915457, 1, 1, 1, 1, 1,
-1.028183, -1.11657, -3.296837, 0, 0, 1, 1, 1,
-1.026125, -0.3588827, -2.761802, 1, 0, 0, 1, 1,
-1.022375, -0.08897816, -0.4242519, 1, 0, 0, 1, 1,
-1.021512, -0.9575382, -3.636825, 1, 0, 0, 1, 1,
-1.012988, -1.056369, -2.208297, 1, 0, 0, 1, 1,
-0.9982834, -0.2839314, -1.978407, 1, 0, 0, 1, 1,
-0.9967425, 0.3056095, -1.115109, 0, 0, 0, 1, 1,
-0.9849005, 1.862488, 0.4950338, 0, 0, 0, 1, 1,
-0.9680236, 1.39517, 0.005701425, 0, 0, 0, 1, 1,
-0.9603487, -0.4075455, -1.921605, 0, 0, 0, 1, 1,
-0.9594441, 1.938019, -0.3189299, 0, 0, 0, 1, 1,
-0.9548111, 0.3022495, -0.6262537, 0, 0, 0, 1, 1,
-0.9529774, -0.8063165, -0.8084545, 0, 0, 0, 1, 1,
-0.9523134, 0.1103204, -0.1963573, 1, 1, 1, 1, 1,
-0.9477019, 0.4513052, -3.004552, 1, 1, 1, 1, 1,
-0.9434962, -1.411243, -2.964798, 1, 1, 1, 1, 1,
-0.9403528, 2.236923, -0.6153913, 1, 1, 1, 1, 1,
-0.9388291, -0.3069819, -2.150371, 1, 1, 1, 1, 1,
-0.9380445, -0.6940034, -2.70063, 1, 1, 1, 1, 1,
-0.9377568, 0.7714556, -0.1973455, 1, 1, 1, 1, 1,
-0.930028, 0.1445731, 1.289673, 1, 1, 1, 1, 1,
-0.922513, -0.3843091, -3.175874, 1, 1, 1, 1, 1,
-0.9205068, 0.3171211, -2.498412, 1, 1, 1, 1, 1,
-0.917558, -0.7481045, -2.021824, 1, 1, 1, 1, 1,
-0.9171173, -1.091788, -2.34615, 1, 1, 1, 1, 1,
-0.9127314, 0.9899406, -1.60404, 1, 1, 1, 1, 1,
-0.9097973, 0.8401729, -1.123498, 1, 1, 1, 1, 1,
-0.9066351, -1.186958, -2.587132, 1, 1, 1, 1, 1,
-0.9047256, -1.485472, -0.4788508, 0, 0, 1, 1, 1,
-0.9019871, -0.4969409, -1.744398, 1, 0, 0, 1, 1,
-0.896019, 0.4803813, -1.797239, 1, 0, 0, 1, 1,
-0.8956535, -0.1145605, -2.341731, 1, 0, 0, 1, 1,
-0.8895218, 1.456406, -0.4955305, 1, 0, 0, 1, 1,
-0.8852369, 0.6548781, -1.154775, 1, 0, 0, 1, 1,
-0.8847136, 1.532773, -0.9085865, 0, 0, 0, 1, 1,
-0.8799636, -2.061666, -0.9931077, 0, 0, 0, 1, 1,
-0.8759738, 2.256237, -0.9938356, 0, 0, 0, 1, 1,
-0.870204, 0.06348994, -2.40128, 0, 0, 0, 1, 1,
-0.869513, -1.36795, -1.860686, 0, 0, 0, 1, 1,
-0.865466, -1.442399, -1.927288, 0, 0, 0, 1, 1,
-0.8573346, -0.1396052, -0.910163, 0, 0, 0, 1, 1,
-0.8533713, -0.816921, -1.564246, 1, 1, 1, 1, 1,
-0.8461354, 1.179255, -0.8097193, 1, 1, 1, 1, 1,
-0.8445984, -1.617483, -2.506679, 1, 1, 1, 1, 1,
-0.8373326, 1.208981, -0.6149972, 1, 1, 1, 1, 1,
-0.8372176, -0.9641363, -0.8633881, 1, 1, 1, 1, 1,
-0.8353475, 0.4225187, -1.523079, 1, 1, 1, 1, 1,
-0.8290985, 0.4616393, -0.3564425, 1, 1, 1, 1, 1,
-0.8236232, 0.1479359, -0.9221203, 1, 1, 1, 1, 1,
-0.8227568, -0.5390124, -2.689705, 1, 1, 1, 1, 1,
-0.8160126, -0.6557908, -1.801605, 1, 1, 1, 1, 1,
-0.8094245, 0.3536243, -0.9441338, 1, 1, 1, 1, 1,
-0.8081079, -0.892632, -2.488741, 1, 1, 1, 1, 1,
-0.8039826, 1.123656, 0.6100051, 1, 1, 1, 1, 1,
-0.7971835, -1.585201, -2.631062, 1, 1, 1, 1, 1,
-0.7913361, 0.4930879, -0.5894786, 1, 1, 1, 1, 1,
-0.7840721, 2.551961, -1.187971, 0, 0, 1, 1, 1,
-0.7741895, 0.3474169, 0.1843782, 1, 0, 0, 1, 1,
-0.7711504, -0.04301482, -2.256601, 1, 0, 0, 1, 1,
-0.7695181, 0.1453326, -2.228283, 1, 0, 0, 1, 1,
-0.7675797, -0.3909154, -1.652265, 1, 0, 0, 1, 1,
-0.7660487, 0.5990881, -1.915675, 1, 0, 0, 1, 1,
-0.765958, 1.297491, 0.7300673, 0, 0, 0, 1, 1,
-0.765547, -1.016928, -2.228476, 0, 0, 0, 1, 1,
-0.7607443, 0.01869476, -1.607501, 0, 0, 0, 1, 1,
-0.7549173, 0.4047329, -0.702747, 0, 0, 0, 1, 1,
-0.7519282, 0.518476, 0.1064501, 0, 0, 0, 1, 1,
-0.7445773, 0.8552476, 0.9493303, 0, 0, 0, 1, 1,
-0.7274661, 0.8385796, -1.303043, 0, 0, 0, 1, 1,
-0.7227094, 0.1761888, -1.346518, 1, 1, 1, 1, 1,
-0.7221277, 0.8323954, -2.89692, 1, 1, 1, 1, 1,
-0.7164373, -0.4327987, -2.137684, 1, 1, 1, 1, 1,
-0.7067896, -0.3761702, -1.538992, 1, 1, 1, 1, 1,
-0.7065477, 0.5262603, -1.991359, 1, 1, 1, 1, 1,
-0.7045058, 1.581855, 0.1404312, 1, 1, 1, 1, 1,
-0.7016833, 1.113086, -0.8866825, 1, 1, 1, 1, 1,
-0.6991479, 1.677759, 0.792122, 1, 1, 1, 1, 1,
-0.6987224, 0.9445667, -1.556981, 1, 1, 1, 1, 1,
-0.6950839, 0.401481, -0.4299238, 1, 1, 1, 1, 1,
-0.6941277, -0.8214616, -5.446085, 1, 1, 1, 1, 1,
-0.6891542, -1.441479, -1.412404, 1, 1, 1, 1, 1,
-0.6827087, -1.505683, -3.431148, 1, 1, 1, 1, 1,
-0.6808079, 1.425239, -0.4254193, 1, 1, 1, 1, 1,
-0.6767833, 0.5453091, -0.04609962, 1, 1, 1, 1, 1,
-0.675166, 0.3861113, -0.7495172, 0, 0, 1, 1, 1,
-0.6746228, -1.055051, -1.786974, 1, 0, 0, 1, 1,
-0.6740386, -0.8226813, -4.639476, 1, 0, 0, 1, 1,
-0.669709, 0.1050341, -1.716966, 1, 0, 0, 1, 1,
-0.6657137, -1.42185, -2.16987, 1, 0, 0, 1, 1,
-0.665593, 0.1050543, -1.337301, 1, 0, 0, 1, 1,
-0.6575836, 0.4821717, 0.1222275, 0, 0, 0, 1, 1,
-0.6564979, -0.5376441, -2.516225, 0, 0, 0, 1, 1,
-0.6522819, -0.2018908, -2.646488, 0, 0, 0, 1, 1,
-0.6498079, -0.4365877, -1.884709, 0, 0, 0, 1, 1,
-0.6457983, -0.1528245, -2.954829, 0, 0, 0, 1, 1,
-0.6375044, 0.3328204, -0.5452354, 0, 0, 0, 1, 1,
-0.6268049, 1.191892, -2.196463, 0, 0, 0, 1, 1,
-0.6262659, -1.28767, -3.10813, 1, 1, 1, 1, 1,
-0.6137868, 0.5507669, -2.195411, 1, 1, 1, 1, 1,
-0.6117739, -0.1687191, -0.0006948069, 1, 1, 1, 1, 1,
-0.6094235, 0.2577401, -0.9341733, 1, 1, 1, 1, 1,
-0.6035966, -2.032371, -1.800026, 1, 1, 1, 1, 1,
-0.6033491, -0.6234829, -1.30672, 1, 1, 1, 1, 1,
-0.6029739, -0.9534924, -0.6208569, 1, 1, 1, 1, 1,
-0.6012364, -1.300972, -2.961366, 1, 1, 1, 1, 1,
-0.6004836, 0.9317812, 0.06414056, 1, 1, 1, 1, 1,
-0.5980918, 0.04469607, -1.371742, 1, 1, 1, 1, 1,
-0.5947878, 1.510756, -0.4161676, 1, 1, 1, 1, 1,
-0.5941473, -0.670172, -5.114283, 1, 1, 1, 1, 1,
-0.5940157, -0.3277397, -2.419526, 1, 1, 1, 1, 1,
-0.5864545, 0.1180583, -1.49397, 1, 1, 1, 1, 1,
-0.574025, 0.05548027, 0.2045305, 1, 1, 1, 1, 1,
-0.5733244, 1.349802, -0.6122159, 0, 0, 1, 1, 1,
-0.5690929, -0.4903302, -3.331624, 1, 0, 0, 1, 1,
-0.5682275, -1.227733, -3.157338, 1, 0, 0, 1, 1,
-0.5633305, 0.2103384, -1.520881, 1, 0, 0, 1, 1,
-0.5509635, -0.221576, -2.715906, 1, 0, 0, 1, 1,
-0.5461302, 0.1657179, -1.495452, 1, 0, 0, 1, 1,
-0.5449187, -1.638066, -3.245529, 0, 0, 0, 1, 1,
-0.5415257, -1.249795, -1.4368, 0, 0, 0, 1, 1,
-0.5406581, 2.817956, 0.120703, 0, 0, 0, 1, 1,
-0.539449, -0.9292891, -2.933054, 0, 0, 0, 1, 1,
-0.5348438, -0.6808824, -3.77279, 0, 0, 0, 1, 1,
-0.5303915, 0.331653, -1.139693, 0, 0, 0, 1, 1,
-0.5252811, -0.2063826, -1.849357, 0, 0, 0, 1, 1,
-0.5183196, -1.834744, -3.333284, 1, 1, 1, 1, 1,
-0.5182514, -0.3099644, -1.197179, 1, 1, 1, 1, 1,
-0.5160682, 0.3059801, -1.024411, 1, 1, 1, 1, 1,
-0.5139796, 0.3801888, -0.5499962, 1, 1, 1, 1, 1,
-0.5123315, 0.784818, 0.9750083, 1, 1, 1, 1, 1,
-0.5118884, 1.024966, -0.6808078, 1, 1, 1, 1, 1,
-0.510334, -1.931441, -4.479859, 1, 1, 1, 1, 1,
-0.5081122, 1.459628, -2.96331, 1, 1, 1, 1, 1,
-0.5076939, -1.231592, -2.174251, 1, 1, 1, 1, 1,
-0.5067648, -0.5209667, -1.633644, 1, 1, 1, 1, 1,
-0.5009832, -1.873682, -1.180987, 1, 1, 1, 1, 1,
-0.4982269, -1.169656, -1.639489, 1, 1, 1, 1, 1,
-0.4948967, -0.9104577, -3.478655, 1, 1, 1, 1, 1,
-0.4851687, 0.6142252, -0.558281, 1, 1, 1, 1, 1,
-0.4851161, -0.03712088, -1.098562, 1, 1, 1, 1, 1,
-0.4819775, -1.307755, -3.246076, 0, 0, 1, 1, 1,
-0.4796213, -0.3446521, -1.626437, 1, 0, 0, 1, 1,
-0.4794541, 0.9306448, -0.2149259, 1, 0, 0, 1, 1,
-0.4790674, 0.3665751, -0.6094455, 1, 0, 0, 1, 1,
-0.4777356, 0.5392673, -1.029888, 1, 0, 0, 1, 1,
-0.4726764, 0.5012175, -2.328656, 1, 0, 0, 1, 1,
-0.4691812, -0.635682, -1.784009, 0, 0, 0, 1, 1,
-0.4674744, 1.040192, -1.725884, 0, 0, 0, 1, 1,
-0.467103, 0.5661239, -0.8932732, 0, 0, 0, 1, 1,
-0.4582782, 1.461172, -0.5519374, 0, 0, 0, 1, 1,
-0.4575231, 0.5599879, -0.7591265, 0, 0, 0, 1, 1,
-0.4535963, -0.183049, -2.515029, 0, 0, 0, 1, 1,
-0.4507678, -0.2128588, 0.05320221, 0, 0, 0, 1, 1,
-0.4500593, -1.324181, -3.246964, 1, 1, 1, 1, 1,
-0.4432603, -1.44985, -1.859578, 1, 1, 1, 1, 1,
-0.4386645, -0.5358152, -1.786407, 1, 1, 1, 1, 1,
-0.4361075, 0.4397547, -0.1218111, 1, 1, 1, 1, 1,
-0.4345142, -2.382723, -3.378814, 1, 1, 1, 1, 1,
-0.4342195, 0.1892221, -1.034166, 1, 1, 1, 1, 1,
-0.4300721, -0.5912419, -2.115542, 1, 1, 1, 1, 1,
-0.429495, -0.3149494, -1.581251, 1, 1, 1, 1, 1,
-0.4236494, 0.3800638, -0.1595841, 1, 1, 1, 1, 1,
-0.4225047, 0.08534204, -0.8458527, 1, 1, 1, 1, 1,
-0.4185618, 1.625816, -0.04676702, 1, 1, 1, 1, 1,
-0.4183197, 0.6042285, -0.415588, 1, 1, 1, 1, 1,
-0.4155757, 0.2808545, -1.525109, 1, 1, 1, 1, 1,
-0.4136138, -1.12618, -4.686073, 1, 1, 1, 1, 1,
-0.4095335, 0.3801012, -0.5642483, 1, 1, 1, 1, 1,
-0.4086221, -0.1376269, -2.829436, 0, 0, 1, 1, 1,
-0.3993298, -2.007431, -3.85962, 1, 0, 0, 1, 1,
-0.3983175, -0.07881186, -3.184161, 1, 0, 0, 1, 1,
-0.3960431, -0.7183857, -2.407862, 1, 0, 0, 1, 1,
-0.3943447, -0.9011052, -4.31744, 1, 0, 0, 1, 1,
-0.3914776, 0.6301851, 0.5249318, 1, 0, 0, 1, 1,
-0.3912841, -1.489909, -2.697033, 0, 0, 0, 1, 1,
-0.3904564, 0.2966809, -0.4200514, 0, 0, 0, 1, 1,
-0.3843998, 0.2501899, -0.9265569, 0, 0, 0, 1, 1,
-0.3802409, -0.8372475, -3.009705, 0, 0, 0, 1, 1,
-0.3786257, 0.07544057, -0.2178764, 0, 0, 0, 1, 1,
-0.3784388, 1.185771, 1.341789, 0, 0, 0, 1, 1,
-0.3659406, -1.039136, -3.214506, 0, 0, 0, 1, 1,
-0.3624315, 1.835241, 0.1150086, 1, 1, 1, 1, 1,
-0.3616656, 0.4761581, -1.814102, 1, 1, 1, 1, 1,
-0.3573024, -0.326212, -4.757624, 1, 1, 1, 1, 1,
-0.3556249, 1.21925, -0.4958884, 1, 1, 1, 1, 1,
-0.3527501, 0.07201029, -2.448395, 1, 1, 1, 1, 1,
-0.345508, -0.8737218, -2.445695, 1, 1, 1, 1, 1,
-0.343888, -0.5398381, -2.565442, 1, 1, 1, 1, 1,
-0.3425026, -0.4720388, -1.128715, 1, 1, 1, 1, 1,
-0.340704, -0.4102884, -1.704844, 1, 1, 1, 1, 1,
-0.3396059, -0.09970745, -2.380939, 1, 1, 1, 1, 1,
-0.3365903, -1.368199, -4.195211, 1, 1, 1, 1, 1,
-0.3309462, -0.1725512, -0.146084, 1, 1, 1, 1, 1,
-0.3302793, 0.6637514, -2.005824, 1, 1, 1, 1, 1,
-0.3269336, -1.460905, -3.578067, 1, 1, 1, 1, 1,
-0.3231848, 0.8880225, 1.007462, 1, 1, 1, 1, 1,
-0.3168136, 0.2375337, -2.596707, 0, 0, 1, 1, 1,
-0.3163397, -1.555437, -3.802818, 1, 0, 0, 1, 1,
-0.3037532, 0.5610595, 1.017735, 1, 0, 0, 1, 1,
-0.3018365, 0.8341293, -2.275759, 1, 0, 0, 1, 1,
-0.2988823, -0.7998685, -1.874668, 1, 0, 0, 1, 1,
-0.2978106, -0.5766528, -3.484152, 1, 0, 0, 1, 1,
-0.2943634, -1.851562, -2.73982, 0, 0, 0, 1, 1,
-0.2943584, 1.424868, -0.525723, 0, 0, 0, 1, 1,
-0.2936913, 0.587597, -2.475902, 0, 0, 0, 1, 1,
-0.2909921, 0.6651084, 1.047384, 0, 0, 0, 1, 1,
-0.2900859, 1.252522, 0.1519686, 0, 0, 0, 1, 1,
-0.2880562, 0.7679902, -2.955213, 0, 0, 0, 1, 1,
-0.2848251, -2.053134, -4.581258, 0, 0, 0, 1, 1,
-0.2808059, -0.1787163, -2.065607, 1, 1, 1, 1, 1,
-0.2774889, -1.437252, -3.082005, 1, 1, 1, 1, 1,
-0.2751637, -2.29224, -2.39805, 1, 1, 1, 1, 1,
-0.2688943, -0.6143388, -2.015931, 1, 1, 1, 1, 1,
-0.2670406, -0.08169301, -1.947886, 1, 1, 1, 1, 1,
-0.2599954, -0.7541271, -2.557781, 1, 1, 1, 1, 1,
-0.2549967, 1.411861, 0.2461828, 1, 1, 1, 1, 1,
-0.2516599, 0.7411934, -1.662908, 1, 1, 1, 1, 1,
-0.250769, 0.6354859, -0.334574, 1, 1, 1, 1, 1,
-0.2465497, -0.6604708, -2.590803, 1, 1, 1, 1, 1,
-0.244432, -1.441205, -2.811675, 1, 1, 1, 1, 1,
-0.2426139, -1.257548, -4.442137, 1, 1, 1, 1, 1,
-0.2410242, -1.659747, -2.344072, 1, 1, 1, 1, 1,
-0.2398109, -0.3572221, -1.724249, 1, 1, 1, 1, 1,
-0.2372478, 1.387355, -0.2638609, 1, 1, 1, 1, 1,
-0.2360623, -0.4159775, -2.891212, 0, 0, 1, 1, 1,
-0.2287771, 1.738637, -1.091886, 1, 0, 0, 1, 1,
-0.2258403, 0.02179104, -0.7601611, 1, 0, 0, 1, 1,
-0.2242194, 1.410211, -0.5058222, 1, 0, 0, 1, 1,
-0.2225297, 0.7455436, -0.3578144, 1, 0, 0, 1, 1,
-0.2190655, -0.2292159, -2.481003, 1, 0, 0, 1, 1,
-0.2169337, -0.3328971, -2.335466, 0, 0, 0, 1, 1,
-0.216416, 0.9774258, -0.3402686, 0, 0, 0, 1, 1,
-0.2116297, 2.065798, 1.068931, 0, 0, 0, 1, 1,
-0.2101, -1.713315, -2.038064, 0, 0, 0, 1, 1,
-0.2076925, 0.9296011, 0.577392, 0, 0, 0, 1, 1,
-0.2072351, 1.739321, 0.3897129, 0, 0, 0, 1, 1,
-0.2055597, -1.348257, -3.169297, 0, 0, 0, 1, 1,
-0.2055413, -0.1270154, -1.294652, 1, 1, 1, 1, 1,
-0.2049819, 1.575864, 1.932824, 1, 1, 1, 1, 1,
-0.2043801, -1.09701, -2.884477, 1, 1, 1, 1, 1,
-0.2023701, 1.250503, -0.4321297, 1, 1, 1, 1, 1,
-0.195041, -1.615814, -3.390608, 1, 1, 1, 1, 1,
-0.1909325, 0.03771645, -1.85809, 1, 1, 1, 1, 1,
-0.1882602, -0.4232542, -2.772687, 1, 1, 1, 1, 1,
-0.1873239, -0.4458312, -3.799126, 1, 1, 1, 1, 1,
-0.1869204, -1.668378, -2.313038, 1, 1, 1, 1, 1,
-0.1865452, 0.295604, -1.930689, 1, 1, 1, 1, 1,
-0.1816325, 0.4920356, -0.040018, 1, 1, 1, 1, 1,
-0.1768208, -0.2072817, -1.527065, 1, 1, 1, 1, 1,
-0.176523, 0.3130053, 0.3524908, 1, 1, 1, 1, 1,
-0.1758551, 0.1589992, -1.608828, 1, 1, 1, 1, 1,
-0.1623791, 0.5634421, -0.8562153, 1, 1, 1, 1, 1,
-0.1603286, 0.4915278, -0.8858687, 0, 0, 1, 1, 1,
-0.15645, -1.691515, -2.098979, 1, 0, 0, 1, 1,
-0.1520434, -0.7630555, -4.067211, 1, 0, 0, 1, 1,
-0.1517472, 0.1079608, -0.3682981, 1, 0, 0, 1, 1,
-0.1503786, -0.2222787, -2.284096, 1, 0, 0, 1, 1,
-0.1493732, -1.699946, -3.340851, 1, 0, 0, 1, 1,
-0.1463052, 0.1427101, -1.349377, 0, 0, 0, 1, 1,
-0.1396442, -1.342173, -1.440254, 0, 0, 0, 1, 1,
-0.1318983, 0.5055237, -1.469737, 0, 0, 0, 1, 1,
-0.1285959, -0.5012854, -3.429186, 0, 0, 0, 1, 1,
-0.126432, 0.945787, -1.242254, 0, 0, 0, 1, 1,
-0.1251978, 1.095441, -0.8099215, 0, 0, 0, 1, 1,
-0.1250447, -1.904324, -3.216374, 0, 0, 0, 1, 1,
-0.1243139, -0.9227386, -2.263388, 1, 1, 1, 1, 1,
-0.1241404, 0.1945309, -0.4541283, 1, 1, 1, 1, 1,
-0.1235952, 0.04409725, -1.242865, 1, 1, 1, 1, 1,
-0.1226176, 1.127217, -0.8592687, 1, 1, 1, 1, 1,
-0.1175352, 0.03870105, -0.9635279, 1, 1, 1, 1, 1,
-0.1162225, -0.4982767, -3.875046, 1, 1, 1, 1, 1,
-0.1148322, 1.27531, -0.7239241, 1, 1, 1, 1, 1,
-0.1120034, -2.02999, -3.285668, 1, 1, 1, 1, 1,
-0.1112553, -0.353879, -2.191229, 1, 1, 1, 1, 1,
-0.107899, 0.2957571, 0.7431471, 1, 1, 1, 1, 1,
-0.105003, -0.1891529, -2.685384, 1, 1, 1, 1, 1,
-0.1048976, -0.09343327, -3.529733, 1, 1, 1, 1, 1,
-0.1048931, -0.6975406, -4.009459, 1, 1, 1, 1, 1,
-0.1036368, -1.30728, -2.573936, 1, 1, 1, 1, 1,
-0.09652704, 1.816035, 0.07547501, 1, 1, 1, 1, 1,
-0.09585644, 2.217089, -0.4989562, 0, 0, 1, 1, 1,
-0.09400798, 0.6353172, -2.128144, 1, 0, 0, 1, 1,
-0.09396159, -0.7594111, -3.191542, 1, 0, 0, 1, 1,
-0.09226812, -1.006089, -1.365561, 1, 0, 0, 1, 1,
-0.09119748, 2.38428, 0.2509908, 1, 0, 0, 1, 1,
-0.09018165, -0.4314333, -5.034387, 1, 0, 0, 1, 1,
-0.08817074, 0.02144774, -2.644282, 0, 0, 0, 1, 1,
-0.08683299, 1.187365, -1.341819, 0, 0, 0, 1, 1,
-0.08647701, -0.7387324, -2.267489, 0, 0, 0, 1, 1,
-0.08546294, 0.1042434, -0.2634183, 0, 0, 0, 1, 1,
-0.08521957, -0.797671, -1.942127, 0, 0, 0, 1, 1,
-0.08020148, -1.08608, -4.707993, 0, 0, 0, 1, 1,
-0.07875216, 0.08487373, -2.606783, 0, 0, 0, 1, 1,
-0.07840986, -1.504158, -4.728942, 1, 1, 1, 1, 1,
-0.07697617, -0.7055761, -2.318876, 1, 1, 1, 1, 1,
-0.07632998, 0.2832339, 0.1778475, 1, 1, 1, 1, 1,
-0.07548719, 1.500884, 1.139205, 1, 1, 1, 1, 1,
-0.07132817, 1.889484, -0.04994392, 1, 1, 1, 1, 1,
-0.0698221, 0.5584801, 0.4559966, 1, 1, 1, 1, 1,
-0.06927086, -1.561166, -3.622277, 1, 1, 1, 1, 1,
-0.06383092, -0.1086666, -4.107388, 1, 1, 1, 1, 1,
-0.0634589, 1.352705, -0.193665, 1, 1, 1, 1, 1,
-0.06313951, 0.2416669, -0.8255336, 1, 1, 1, 1, 1,
-0.06054214, 0.2249954, 1.057555, 1, 1, 1, 1, 1,
-0.05981463, 1.38848, 0.1454279, 1, 1, 1, 1, 1,
-0.05886764, 0.988649, 0.8640677, 1, 1, 1, 1, 1,
-0.0576097, 0.7327518, -0.1983098, 1, 1, 1, 1, 1,
-0.04647768, -1.192121, -2.094633, 1, 1, 1, 1, 1,
-0.0458772, 1.721584, -0.1567533, 0, 0, 1, 1, 1,
-0.04486274, -0.5482979, -4.185253, 1, 0, 0, 1, 1,
-0.04272987, -0.973791, -3.358635, 1, 0, 0, 1, 1,
-0.04181425, 1.831455, -0.02214026, 1, 0, 0, 1, 1,
-0.03639629, -0.7919085, -3.545962, 1, 0, 0, 1, 1,
-0.03485021, -0.5506296, -2.610832, 1, 0, 0, 1, 1,
-0.03202172, 0.6207281, 0.3572176, 0, 0, 0, 1, 1,
-0.03162964, -0.2016551, -2.269929, 0, 0, 0, 1, 1,
-0.02688761, -0.3790756, -3.512827, 0, 0, 0, 1, 1,
-0.02455927, 1.254316, -1.814681, 0, 0, 0, 1, 1,
-0.01804169, 0.5716221, -0.9553719, 0, 0, 0, 1, 1,
-0.01569446, -0.340382, -0.849223, 0, 0, 0, 1, 1,
-0.01240364, -2.086136, -3.796966, 0, 0, 0, 1, 1,
-0.009398828, 0.3018925, 0.8547839, 1, 1, 1, 1, 1,
-0.009106606, 0.04228958, -1.368863, 1, 1, 1, 1, 1,
0.002485303, 1.178564, -0.2332059, 1, 1, 1, 1, 1,
0.002911679, 0.7082121, -0.4821526, 1, 1, 1, 1, 1,
0.003320549, 1.979944, -1.223039, 1, 1, 1, 1, 1,
0.009788332, -0.003672047, 2.297818, 1, 1, 1, 1, 1,
0.01268522, 1.295948, 0.6719018, 1, 1, 1, 1, 1,
0.01402185, -0.05365579, 1.838967, 1, 1, 1, 1, 1,
0.0151168, -0.3619891, 3.747455, 1, 1, 1, 1, 1,
0.01663055, -0.06392258, 2.11085, 1, 1, 1, 1, 1,
0.01976607, -1.494447, 4.881516, 1, 1, 1, 1, 1,
0.01986174, -1.209804, 3.528514, 1, 1, 1, 1, 1,
0.02098017, -0.4924051, 2.965188, 1, 1, 1, 1, 1,
0.02394686, -2.598498, 3.91821, 1, 1, 1, 1, 1,
0.03223611, 0.6561418, -0.3575694, 1, 1, 1, 1, 1,
0.03733558, 0.5691289, -0.2848967, 0, 0, 1, 1, 1,
0.03795697, -1.100802, 1.59558, 1, 0, 0, 1, 1,
0.0382187, 0.1407465, -0.1167563, 1, 0, 0, 1, 1,
0.03981492, 0.9803109, 0.9244273, 1, 0, 0, 1, 1,
0.04208368, -0.480724, 2.15517, 1, 0, 0, 1, 1,
0.04509692, -0.2450914, 1.706853, 1, 0, 0, 1, 1,
0.04685446, 0.2835658, -1.175995, 0, 0, 0, 1, 1,
0.05268013, -0.3517359, 1.885954, 0, 0, 0, 1, 1,
0.05344436, 0.1197407, 1.418326, 0, 0, 0, 1, 1,
0.05367595, 1.10505, -0.4042099, 0, 0, 0, 1, 1,
0.0559756, 1.015365, -0.623867, 0, 0, 0, 1, 1,
0.05897116, 0.04308384, 0.1750415, 0, 0, 0, 1, 1,
0.05975139, 0.5175918, 0.9734907, 0, 0, 0, 1, 1,
0.05984871, -0.1960901, 2.689592, 1, 1, 1, 1, 1,
0.0613371, -0.8068478, 5.396865, 1, 1, 1, 1, 1,
0.07121417, 0.4713627, -0.6156546, 1, 1, 1, 1, 1,
0.07157163, -1.004483, 4.129122, 1, 1, 1, 1, 1,
0.07282673, 0.9981471, -1.130301, 1, 1, 1, 1, 1,
0.07338733, -1.273048, 2.810651, 1, 1, 1, 1, 1,
0.07347218, -1.390044, 3.889061, 1, 1, 1, 1, 1,
0.07490125, 0.1394302, 0.8254212, 1, 1, 1, 1, 1,
0.07775483, -2.797149, 1.615964, 1, 1, 1, 1, 1,
0.0779277, 0.4581248, -0.02928214, 1, 1, 1, 1, 1,
0.08314557, 0.3198716, -1.262747, 1, 1, 1, 1, 1,
0.08878476, 0.3928637, -1.294048, 1, 1, 1, 1, 1,
0.09575185, -0.3517101, 0.7052978, 1, 1, 1, 1, 1,
0.09748146, -1.724965, 2.634924, 1, 1, 1, 1, 1,
0.1023956, 1.109167, -0.1248811, 1, 1, 1, 1, 1,
0.1026692, 0.5936437, 1.271774, 0, 0, 1, 1, 1,
0.1039648, -0.06609232, 2.007996, 1, 0, 0, 1, 1,
0.1041713, -0.4415236, 4.606113, 1, 0, 0, 1, 1,
0.1117788, -0.8162758, 1.514043, 1, 0, 0, 1, 1,
0.1119329, -0.278059, 1.950662, 1, 0, 0, 1, 1,
0.1129101, -0.005832827, 1.58727, 1, 0, 0, 1, 1,
0.1132981, 0.9944701, -1.110945, 0, 0, 0, 1, 1,
0.1227202, -0.2433454, 0.5687192, 0, 0, 0, 1, 1,
0.1237422, 0.2767785, -0.2445081, 0, 0, 0, 1, 1,
0.1238286, 2.233384, 1.987907, 0, 0, 0, 1, 1,
0.1241979, 1.56804, 1.82179, 0, 0, 0, 1, 1,
0.1252749, -0.5853853, 2.588086, 0, 0, 0, 1, 1,
0.1258511, 0.9839298, -0.1587154, 0, 0, 0, 1, 1,
0.1292677, 0.6995968, -0.1849172, 1, 1, 1, 1, 1,
0.1323492, -0.2269665, 2.048501, 1, 1, 1, 1, 1,
0.1329131, 1.856201, 1.261188, 1, 1, 1, 1, 1,
0.1337066, 0.3569112, -0.7178929, 1, 1, 1, 1, 1,
0.1374135, -0.2279523, 0.782639, 1, 1, 1, 1, 1,
0.1403788, -0.2409619, 1.611978, 1, 1, 1, 1, 1,
0.1417726, 0.8464258, 0.7239367, 1, 1, 1, 1, 1,
0.1422111, -1.464315, 3.2323, 1, 1, 1, 1, 1,
0.1536182, -0.3625102, 4.192188, 1, 1, 1, 1, 1,
0.1633795, 0.3215213, 0.3296901, 1, 1, 1, 1, 1,
0.1640316, -0.09403584, 4.29287, 1, 1, 1, 1, 1,
0.1655764, 0.4442512, -0.4935502, 1, 1, 1, 1, 1,
0.1659492, -2.21424, 2.771491, 1, 1, 1, 1, 1,
0.1679979, -0.7016637, 3.885517, 1, 1, 1, 1, 1,
0.1773982, 1.465231, -0.4486586, 1, 1, 1, 1, 1,
0.1781451, 1.606375, 0.8150092, 0, 0, 1, 1, 1,
0.1786562, -0.982556, 3.609997, 1, 0, 0, 1, 1,
0.1827877, -1.293633, 2.283277, 1, 0, 0, 1, 1,
0.1870675, -0.257438, 2.908091, 1, 0, 0, 1, 1,
0.1989118, 0.352167, 2.756822, 1, 0, 0, 1, 1,
0.2009618, 0.9576003, 0.2080829, 1, 0, 0, 1, 1,
0.2024837, 0.02024332, 1.711052, 0, 0, 0, 1, 1,
0.203245, -1.730126, 1.012069, 0, 0, 0, 1, 1,
0.2051103, -1.533406, 2.141019, 0, 0, 0, 1, 1,
0.2080045, 1.518751, -0.1511487, 0, 0, 0, 1, 1,
0.2111967, 1.50175, 0.9236104, 0, 0, 0, 1, 1,
0.2114781, -0.4970429, 1.997871, 0, 0, 0, 1, 1,
0.2132798, 0.1262328, 1.086408, 0, 0, 0, 1, 1,
0.2174919, 0.4068926, -0.3664101, 1, 1, 1, 1, 1,
0.2191076, -0.4334081, 2.92781, 1, 1, 1, 1, 1,
0.2257867, -0.4589694, 4.42008, 1, 1, 1, 1, 1,
0.229909, -1.161092, 4.440623, 1, 1, 1, 1, 1,
0.2301639, -0.2344262, 2.176543, 1, 1, 1, 1, 1,
0.2450341, 0.05075321, 1.528895, 1, 1, 1, 1, 1,
0.2459209, -1.466244, 4.276667, 1, 1, 1, 1, 1,
0.2479525, -0.1696027, 1.180857, 1, 1, 1, 1, 1,
0.2483052, 0.3017395, 0.40975, 1, 1, 1, 1, 1,
0.2494134, -0.3345838, 1.424678, 1, 1, 1, 1, 1,
0.2498981, 0.03387088, 0.3336634, 1, 1, 1, 1, 1,
0.2501605, -1.228904, 5.229753, 1, 1, 1, 1, 1,
0.2503295, 2.742197, -0.1135615, 1, 1, 1, 1, 1,
0.2542392, -0.6690415, 1.663602, 1, 1, 1, 1, 1,
0.2550052, -0.9353188, 4.228194, 1, 1, 1, 1, 1,
0.262956, 0.5317059, 1.119549, 0, 0, 1, 1, 1,
0.2640183, 0.02196489, 1.104379, 1, 0, 0, 1, 1,
0.2650797, 1.333344, -0.4399575, 1, 0, 0, 1, 1,
0.2716225, 1.0942, -0.8141201, 1, 0, 0, 1, 1,
0.2738611, 1.077118, -0.5267398, 1, 0, 0, 1, 1,
0.273862, -1.91381, 1.843098, 1, 0, 0, 1, 1,
0.2761991, -0.1017733, 1.543427, 0, 0, 0, 1, 1,
0.2778241, 0.2678122, 0.9419802, 0, 0, 0, 1, 1,
0.2784085, 1.070109, -0.7055327, 0, 0, 0, 1, 1,
0.280879, -1.398536, 2.691378, 0, 0, 0, 1, 1,
0.2823888, -1.096159, 3.736537, 0, 0, 0, 1, 1,
0.2848546, -0.07460599, 1.721683, 0, 0, 0, 1, 1,
0.2916052, -0.1443763, 1.321123, 0, 0, 0, 1, 1,
0.2925208, 0.7707346, -0.7569324, 1, 1, 1, 1, 1,
0.2939149, -0.5622192, 2.906119, 1, 1, 1, 1, 1,
0.2951909, -0.6591378, 2.022285, 1, 1, 1, 1, 1,
0.2994249, -1.64104, 2.663964, 1, 1, 1, 1, 1,
0.3071688, -0.757627, 2.361297, 1, 1, 1, 1, 1,
0.3073193, 0.6715845, 0.4619355, 1, 1, 1, 1, 1,
0.3144431, -1.911463, 2.855008, 1, 1, 1, 1, 1,
0.3204986, -0.3773703, 1.51552, 1, 1, 1, 1, 1,
0.3206402, -0.1403231, 1.521194, 1, 1, 1, 1, 1,
0.3245477, -0.5976199, 3.5983, 1, 1, 1, 1, 1,
0.3327042, 0.8009241, 0.3374108, 1, 1, 1, 1, 1,
0.3337354, 1.387161, -1.976282, 1, 1, 1, 1, 1,
0.3360991, 1.610914, 0.472075, 1, 1, 1, 1, 1,
0.3383633, -1.520733, 2.725242, 1, 1, 1, 1, 1,
0.3403863, -0.6246627, 3.364951, 1, 1, 1, 1, 1,
0.3418817, -0.9604802, 1.474068, 0, 0, 1, 1, 1,
0.346863, -0.0515533, 2.44555, 1, 0, 0, 1, 1,
0.3482366, -0.1579158, 2.667665, 1, 0, 0, 1, 1,
0.3492188, -2.189588, 3.187865, 1, 0, 0, 1, 1,
0.3502684, 0.3096235, 1.068547, 1, 0, 0, 1, 1,
0.350642, 0.7880552, 1.452013, 1, 0, 0, 1, 1,
0.3554875, 0.1966902, 3.02015, 0, 0, 0, 1, 1,
0.3639637, -1.137997, 2.09832, 0, 0, 0, 1, 1,
0.3659617, 0.8633163, -0.3854136, 0, 0, 0, 1, 1,
0.3667454, -0.607905, 2.302349, 0, 0, 0, 1, 1,
0.3709028, 0.6186944, 0.06105085, 0, 0, 0, 1, 1,
0.3724982, 0.1073495, -0.6582566, 0, 0, 0, 1, 1,
0.3744655, 0.470957, -0.3300868, 0, 0, 0, 1, 1,
0.3758576, -3.079313, 4.205903, 1, 1, 1, 1, 1,
0.381041, -0.4525686, 1.189514, 1, 1, 1, 1, 1,
0.3842131, 0.06805796, 2.950703, 1, 1, 1, 1, 1,
0.384859, 0.5196981, 0.6054952, 1, 1, 1, 1, 1,
0.3861993, 0.1673926, 1.533958, 1, 1, 1, 1, 1,
0.3884832, 0.8711019, 1.88777, 1, 1, 1, 1, 1,
0.3900791, 0.4831409, -0.2376097, 1, 1, 1, 1, 1,
0.390585, 0.1187602, 0.8663532, 1, 1, 1, 1, 1,
0.3933819, 0.8123359, 0.8940166, 1, 1, 1, 1, 1,
0.3940804, -1.462713, 4.217579, 1, 1, 1, 1, 1,
0.3966165, -0.6149466, 2.101386, 1, 1, 1, 1, 1,
0.3986818, 0.8318825, 2.407762, 1, 1, 1, 1, 1,
0.4104974, -0.7084979, 3.874449, 1, 1, 1, 1, 1,
0.4132797, -2.540772, 4.027515, 1, 1, 1, 1, 1,
0.4186976, -0.02267904, 2.464283, 1, 1, 1, 1, 1,
0.4196711, -2.077628, 2.569193, 0, 0, 1, 1, 1,
0.4210864, 0.9881812, -1.078377, 1, 0, 0, 1, 1,
0.4239351, -0.1426619, 3.364259, 1, 0, 0, 1, 1,
0.4258426, 0.03987184, 2.829854, 1, 0, 0, 1, 1,
0.4292463, 1.111971, 2.360288, 1, 0, 0, 1, 1,
0.4339586, 0.3080552, -0.1191643, 1, 0, 0, 1, 1,
0.4365815, 0.3646531, 0.4310249, 0, 0, 0, 1, 1,
0.4401045, 1.54585, -1.775386, 0, 0, 0, 1, 1,
0.4436379, -0.1224665, 0.6239117, 0, 0, 0, 1, 1,
0.4534208, 0.2869919, -0.09149238, 0, 0, 0, 1, 1,
0.4538314, -0.9541955, 4.153694, 0, 0, 0, 1, 1,
0.45928, -1.913216, 2.352103, 0, 0, 0, 1, 1,
0.4611409, -0.3091892, 3.266072, 0, 0, 0, 1, 1,
0.4617101, -0.4168335, 4.401813, 1, 1, 1, 1, 1,
0.4620449, -0.526541, 4.85359, 1, 1, 1, 1, 1,
0.4634363, -1.934079, 3.049186, 1, 1, 1, 1, 1,
0.467854, 0.7783691, 0.6738382, 1, 1, 1, 1, 1,
0.4681822, -0.1097893, 2.056287, 1, 1, 1, 1, 1,
0.468677, 0.6452152, -0.1476108, 1, 1, 1, 1, 1,
0.4710488, -0.004811034, 0.8509859, 1, 1, 1, 1, 1,
0.4754643, -1.206967, 3.148125, 1, 1, 1, 1, 1,
0.4754852, -0.3148541, 0.2551168, 1, 1, 1, 1, 1,
0.4762346, -0.7918985, 2.504196, 1, 1, 1, 1, 1,
0.4796317, -0.9698262, 4.596373, 1, 1, 1, 1, 1,
0.4859732, -1.378819, 3.359805, 1, 1, 1, 1, 1,
0.489858, -0.4262942, 2.004989, 1, 1, 1, 1, 1,
0.4929293, 0.2395539, 1.381593, 1, 1, 1, 1, 1,
0.4956091, -1.545779, 2.154474, 1, 1, 1, 1, 1,
0.4961152, 1.281248, 1.702587, 0, 0, 1, 1, 1,
0.4971015, 0.1557855, 2.532317, 1, 0, 0, 1, 1,
0.5006281, -0.8996341, 3.507819, 1, 0, 0, 1, 1,
0.5054858, -0.6752881, 2.097184, 1, 0, 0, 1, 1,
0.5059275, 0.6776529, 0.3651758, 1, 0, 0, 1, 1,
0.5094441, -0.8692726, 3.376088, 1, 0, 0, 1, 1,
0.512493, 1.014367, 0.7052189, 0, 0, 0, 1, 1,
0.5230534, -0.6363987, 3.04013, 0, 0, 0, 1, 1,
0.5255237, 0.6450664, -0.08111648, 0, 0, 0, 1, 1,
0.5263034, 0.1291316, 1.433831, 0, 0, 0, 1, 1,
0.5305256, -0.1220439, 0.972594, 0, 0, 0, 1, 1,
0.5330704, 0.261517, 1.246406, 0, 0, 0, 1, 1,
0.535444, -0.8998363, 3.669998, 0, 0, 0, 1, 1,
0.5388258, 1.336287, -0.5442542, 1, 1, 1, 1, 1,
0.5400246, -0.7453979, 3.080778, 1, 1, 1, 1, 1,
0.5408111, 1.772703, -0.8329654, 1, 1, 1, 1, 1,
0.5423296, 2.503028, 2.070425, 1, 1, 1, 1, 1,
0.5429184, 2.253988, 1.154773, 1, 1, 1, 1, 1,
0.5457184, -0.6179589, 2.559776, 1, 1, 1, 1, 1,
0.5494094, 1.172728, 1.424942, 1, 1, 1, 1, 1,
0.5507773, 1.439897, 0.244323, 1, 1, 1, 1, 1,
0.5533586, 2.097734, 1.578735, 1, 1, 1, 1, 1,
0.5575019, -1.599456, 2.048848, 1, 1, 1, 1, 1,
0.5599691, 2.112008, 2.53273, 1, 1, 1, 1, 1,
0.5627642, -0.1021636, 1.557425, 1, 1, 1, 1, 1,
0.5644849, -1.604906, 2.715897, 1, 1, 1, 1, 1,
0.572017, 0.1131933, 0.8975897, 1, 1, 1, 1, 1,
0.57254, 0.5259675, 1.525211, 1, 1, 1, 1, 1,
0.5760166, 0.5742021, 1.47143, 0, 0, 1, 1, 1,
0.5764577, -0.8356884, 2.741463, 1, 0, 0, 1, 1,
0.5812394, 0.4080172, 0.08744336, 1, 0, 0, 1, 1,
0.5816694, -0.3817928, 1.87862, 1, 0, 0, 1, 1,
0.5868353, -1.702651, 4.27081, 1, 0, 0, 1, 1,
0.588056, 0.9951438, -0.9430709, 1, 0, 0, 1, 1,
0.5890276, 0.2762591, -0.5980367, 0, 0, 0, 1, 1,
0.5903649, 0.1047604, 0.793649, 0, 0, 0, 1, 1,
0.5910618, 0.5835174, 0.6920499, 0, 0, 0, 1, 1,
0.6024282, 1.040275, 0.6347989, 0, 0, 0, 1, 1,
0.6047122, 0.7175252, -0.08502696, 0, 0, 0, 1, 1,
0.6088958, -0.9709179, -0.2530482, 0, 0, 0, 1, 1,
0.6127411, -0.2409478, 0.6103271, 0, 0, 0, 1, 1,
0.6145787, -0.9582652, 2.627723, 1, 1, 1, 1, 1,
0.6182364, -1.528794, 2.639518, 1, 1, 1, 1, 1,
0.6198142, -0.7790963, 2.686784, 1, 1, 1, 1, 1,
0.6234947, 0.5778895, 2.075548, 1, 1, 1, 1, 1,
0.6239217, 0.5560365, 2.382716, 1, 1, 1, 1, 1,
0.6245799, -1.544872, 4.380796, 1, 1, 1, 1, 1,
0.6247478, -1.629684, 4.472329, 1, 1, 1, 1, 1,
0.6286815, -0.8948581, 2.436626, 1, 1, 1, 1, 1,
0.6316493, 1.100047, 0.8834056, 1, 1, 1, 1, 1,
0.6379846, -0.477535, 3.0284, 1, 1, 1, 1, 1,
0.6402876, -0.4080623, 2.577628, 1, 1, 1, 1, 1,
0.6416385, 0.7736295, 2.181278, 1, 1, 1, 1, 1,
0.6437013, 1.240372, -0.1199621, 1, 1, 1, 1, 1,
0.6461166, 0.02007879, 2.422603, 1, 1, 1, 1, 1,
0.6472925, 0.03585058, 2.844213, 1, 1, 1, 1, 1,
0.6519191, 1.19101, 2.025105, 0, 0, 1, 1, 1,
0.6530119, 0.4040682, 1.299799, 1, 0, 0, 1, 1,
0.6539367, -0.1823207, 1.38561, 1, 0, 0, 1, 1,
0.6570864, 0.8086914, 0.03326472, 1, 0, 0, 1, 1,
0.657876, 0.9124862, 2.544827, 1, 0, 0, 1, 1,
0.6589546, 0.2661357, 1.268452, 1, 0, 0, 1, 1,
0.6593215, -1.625076, 0.5518686, 0, 0, 0, 1, 1,
0.6728563, -2.143031, 2.58976, 0, 0, 0, 1, 1,
0.6728757, -0.8416663, 1.849365, 0, 0, 0, 1, 1,
0.6865738, 0.9821029, 0.7272035, 0, 0, 0, 1, 1,
0.6932414, 1.742656, -0.1985383, 0, 0, 0, 1, 1,
0.6971957, 0.8541824, 1.374093, 0, 0, 0, 1, 1,
0.6996312, -0.8069275, 1.406289, 0, 0, 0, 1, 1,
0.7102519, -1.169016, 2.581517, 1, 1, 1, 1, 1,
0.7145455, 0.2266209, 0.4774505, 1, 1, 1, 1, 1,
0.7183198, 1.951571, 0.8799313, 1, 1, 1, 1, 1,
0.7205688, 0.1031437, 1.82703, 1, 1, 1, 1, 1,
0.7205825, 0.5192313, 2.49281, 1, 1, 1, 1, 1,
0.7224457, -0.6038502, 4.055609, 1, 1, 1, 1, 1,
0.7245399, 1.434686, 0.328266, 1, 1, 1, 1, 1,
0.7253415, 1.091529, -0.1897266, 1, 1, 1, 1, 1,
0.7344548, -1.945672, 1.631991, 1, 1, 1, 1, 1,
0.7415329, -1.761962, 3.618601, 1, 1, 1, 1, 1,
0.7426701, 0.1191767, 1.662442, 1, 1, 1, 1, 1,
0.7427148, -1.364534, 3.102732, 1, 1, 1, 1, 1,
0.7467167, 0.3332461, -0.122788, 1, 1, 1, 1, 1,
0.7481186, -1.496484, 2.672569, 1, 1, 1, 1, 1,
0.7523289, -0.6097192, 1.851192, 1, 1, 1, 1, 1,
0.7558368, -0.3018317, 0.4031352, 0, 0, 1, 1, 1,
0.7624371, -0.6654822, 3.447927, 1, 0, 0, 1, 1,
0.7686153, 0.9738268, 0.1581272, 1, 0, 0, 1, 1,
0.7730599, 0.004641527, 1.324336, 1, 0, 0, 1, 1,
0.7752666, 1.757245, 0.1350902, 1, 0, 0, 1, 1,
0.779243, 1.122304, 0.9733028, 1, 0, 0, 1, 1,
0.7808272, 0.844099, 1.363238, 0, 0, 0, 1, 1,
0.7812042, -0.4111361, 3.946846, 0, 0, 0, 1, 1,
0.7865396, -1.766375, 3.074562, 0, 0, 0, 1, 1,
0.7870793, 0.03457962, 3.478175, 0, 0, 0, 1, 1,
0.7891265, 0.9926909, 0.6832319, 0, 0, 0, 1, 1,
0.7939739, 0.7391105, 0.7764835, 0, 0, 0, 1, 1,
0.7968857, -0.03196188, 2.752465, 0, 0, 0, 1, 1,
0.8019326, -0.9309785, 2.198267, 1, 1, 1, 1, 1,
0.8093771, -1.101372, 1.583776, 1, 1, 1, 1, 1,
0.8100719, -0.8173692, 2.492131, 1, 1, 1, 1, 1,
0.8165428, -1.335234, 2.552692, 1, 1, 1, 1, 1,
0.8228365, -1.219218, 2.302868, 1, 1, 1, 1, 1,
0.8253806, 0.4028496, 0.7585776, 1, 1, 1, 1, 1,
0.8263235, -1.759887, 1.50568, 1, 1, 1, 1, 1,
0.8265556, 0.1438875, 2.052358, 1, 1, 1, 1, 1,
0.8313065, 1.032455, 0.6315092, 1, 1, 1, 1, 1,
0.8322183, -1.196714, 2.192796, 1, 1, 1, 1, 1,
0.8333884, 1.052242, 0.598865, 1, 1, 1, 1, 1,
0.8424951, -0.3991115, 2.912089, 1, 1, 1, 1, 1,
0.8460402, 0.7575786, 0.2738694, 1, 1, 1, 1, 1,
0.8480267, 0.1613818, 1.408041, 1, 1, 1, 1, 1,
0.855816, -1.509928, 2.783968, 1, 1, 1, 1, 1,
0.8588216, 0.6017042, 1.22648, 0, 0, 1, 1, 1,
0.8661946, -0.8883518, 1.544589, 1, 0, 0, 1, 1,
0.8685474, 1.096083, -0.2297351, 1, 0, 0, 1, 1,
0.8725994, 1.526677, 1.496049, 1, 0, 0, 1, 1,
0.8771976, -0.9513122, 2.567219, 1, 0, 0, 1, 1,
0.8862227, -0.4428862, 2.248189, 1, 0, 0, 1, 1,
0.8880953, 0.6231236, -0.8126041, 0, 0, 0, 1, 1,
0.8886654, -1.653003, 1.042233, 0, 0, 0, 1, 1,
0.8912197, -1.414716, 2.112051, 0, 0, 0, 1, 1,
0.8919563, -0.1331932, 2.063893, 0, 0, 0, 1, 1,
0.8922834, 0.3585029, 2.276563, 0, 0, 0, 1, 1,
0.8985435, 0.3466257, 1.778737, 0, 0, 0, 1, 1,
0.8997927, -0.9604567, 2.792819, 0, 0, 0, 1, 1,
0.9082155, 1.443381, -0.3251769, 1, 1, 1, 1, 1,
0.9118184, 0.03485537, 2.375535, 1, 1, 1, 1, 1,
0.9156972, -0.4249637, 0.3124394, 1, 1, 1, 1, 1,
0.9169647, 1.679183, -0.3976311, 1, 1, 1, 1, 1,
0.9206082, -0.5041091, 3.709877, 1, 1, 1, 1, 1,
0.9210826, -0.864088, 2.611511, 1, 1, 1, 1, 1,
0.9213184, 1.767606, 2.144105, 1, 1, 1, 1, 1,
0.9235977, -0.4482977, -0.5035952, 1, 1, 1, 1, 1,
0.9293554, -0.6266356, 0.198084, 1, 1, 1, 1, 1,
0.9304522, 0.5296316, 1.495688, 1, 1, 1, 1, 1,
0.9324772, -0.1569959, 1.540634, 1, 1, 1, 1, 1,
0.9329516, -0.4104412, 1.254594, 1, 1, 1, 1, 1,
0.9356306, 0.8461726, 1.111245, 1, 1, 1, 1, 1,
0.9397158, 0.387637, 2.178774, 1, 1, 1, 1, 1,
0.9478349, -1.288305, 2.156106, 1, 1, 1, 1, 1,
0.9537053, 0.3487815, -0.04719691, 0, 0, 1, 1, 1,
0.9548591, -0.579011, 1.24042, 1, 0, 0, 1, 1,
0.9598404, -0.7620249, 0.2292461, 1, 0, 0, 1, 1,
0.9618437, 1.475509, 1.097421, 1, 0, 0, 1, 1,
0.9654868, -0.574781, 2.798378, 1, 0, 0, 1, 1,
0.9692288, -0.7592887, 3.197149, 1, 0, 0, 1, 1,
0.971291, -0.04706924, 0.7197295, 0, 0, 0, 1, 1,
0.9737785, -0.8218379, 2.558376, 0, 0, 0, 1, 1,
0.9758837, -0.2204118, -0.1425268, 0, 0, 0, 1, 1,
0.9795196, -1.153597, 1.280613, 0, 0, 0, 1, 1,
0.9811659, 0.6463487, 3.426214, 0, 0, 0, 1, 1,
0.9826599, 1.064531, 2.675488, 0, 0, 0, 1, 1,
0.9900463, 0.9453009, 0.4185273, 0, 0, 0, 1, 1,
0.9910519, 0.06638064, 1.977438, 1, 1, 1, 1, 1,
0.9935888, -0.1684594, -0.03193781, 1, 1, 1, 1, 1,
1.004148, 0.2933518, 1.234829, 1, 1, 1, 1, 1,
1.014718, 0.7629947, 2.714618, 1, 1, 1, 1, 1,
1.023314, 0.3026879, 0.9341526, 1, 1, 1, 1, 1,
1.023953, -0.03480596, 0.1200467, 1, 1, 1, 1, 1,
1.02472, -0.217681, 3.407572, 1, 1, 1, 1, 1,
1.024784, 0.6052303, 1.492041, 1, 1, 1, 1, 1,
1.027303, 0.3425219, 1.025017, 1, 1, 1, 1, 1,
1.029129, -1.069943, 1.892388, 1, 1, 1, 1, 1,
1.033841, -1.496932, 2.631212, 1, 1, 1, 1, 1,
1.034595, -0.2860041, 2.551769, 1, 1, 1, 1, 1,
1.035954, -0.4157295, 1.713347, 1, 1, 1, 1, 1,
1.046466, 2.133951, -1.407287, 1, 1, 1, 1, 1,
1.049717, 0.3330294, 1.448232, 1, 1, 1, 1, 1,
1.050011, -1.268182, 1.601998, 0, 0, 1, 1, 1,
1.052678, 0.1147903, 2.143827, 1, 0, 0, 1, 1,
1.055522, -0.5538656, 3.053563, 1, 0, 0, 1, 1,
1.058217, 0.2258785, -0.1183838, 1, 0, 0, 1, 1,
1.061188, 0.2518154, 0.5166208, 1, 0, 0, 1, 1,
1.062083, 0.8736693, 2.438634, 1, 0, 0, 1, 1,
1.063527, -2.213459, 2.55515, 0, 0, 0, 1, 1,
1.065219, 0.476564, 1.46085, 0, 0, 0, 1, 1,
1.068446, -2.673887, 2.929136, 0, 0, 0, 1, 1,
1.075082, -0.863022, 1.952465, 0, 0, 0, 1, 1,
1.080726, -0.06028211, 2.361134, 0, 0, 0, 1, 1,
1.081649, -0.06050105, 1.021139, 0, 0, 0, 1, 1,
1.085697, -0.7288436, 3.547181, 0, 0, 0, 1, 1,
1.087367, -0.2814691, 1.598587, 1, 1, 1, 1, 1,
1.096473, 0.02394745, 2.057947, 1, 1, 1, 1, 1,
1.096752, -0.1267963, 0.5307183, 1, 1, 1, 1, 1,
1.109151, -0.9771255, 2.846527, 1, 1, 1, 1, 1,
1.114796, -0.4656773, 2.781377, 1, 1, 1, 1, 1,
1.115526, 0.6000596, 0.4728398, 1, 1, 1, 1, 1,
1.116406, -1.337386, 1.63295, 1, 1, 1, 1, 1,
1.117016, -1.072459, 3.859718, 1, 1, 1, 1, 1,
1.117039, -0.1071314, 1.169291, 1, 1, 1, 1, 1,
1.117237, 0.123932, 0.3556212, 1, 1, 1, 1, 1,
1.125737, 0.7809407, 1.63928, 1, 1, 1, 1, 1,
1.127969, -0.3812408, 1.358912, 1, 1, 1, 1, 1,
1.14646, -1.149786, 1.564749, 1, 1, 1, 1, 1,
1.14686, 0.1119156, -0.7205414, 1, 1, 1, 1, 1,
1.14701, -0.4496228, 1.537507, 1, 1, 1, 1, 1,
1.15004, 0.5132653, 2.133413, 0, 0, 1, 1, 1,
1.153777, -0.1671564, 2.844499, 1, 0, 0, 1, 1,
1.154732, 0.8989376, 0.8198214, 1, 0, 0, 1, 1,
1.165909, 1.19145, -0.1686511, 1, 0, 0, 1, 1,
1.166019, -0.4396899, 1.445614, 1, 0, 0, 1, 1,
1.177965, -0.3998546, 2.187077, 1, 0, 0, 1, 1,
1.178928, -0.2212215, 1.167389, 0, 0, 0, 1, 1,
1.186319, -0.4856274, 1.559445, 0, 0, 0, 1, 1,
1.192407, 0.831072, 0.2896347, 0, 0, 0, 1, 1,
1.193859, 0.6202585, 1.868284, 0, 0, 0, 1, 1,
1.202882, 0.7694815, 0.3870379, 0, 0, 0, 1, 1,
1.22907, 1.267848, 1.579326, 0, 0, 0, 1, 1,
1.232277, 0.5531943, 1.483648, 0, 0, 0, 1, 1,
1.239973, 0.5799495, 1.74038, 1, 1, 1, 1, 1,
1.243438, 1.059854, 2.075585, 1, 1, 1, 1, 1,
1.244026, 0.1129318, 2.652283, 1, 1, 1, 1, 1,
1.248126, 0.7862166, 0.4116226, 1, 1, 1, 1, 1,
1.257879, -0.4629598, 3.274193, 1, 1, 1, 1, 1,
1.26014, 0.2588493, 2.590664, 1, 1, 1, 1, 1,
1.262451, -0.3473208, 0.8402628, 1, 1, 1, 1, 1,
1.26487, 0.7072945, 0.9714131, 1, 1, 1, 1, 1,
1.265859, 0.5656003, -0.2882364, 1, 1, 1, 1, 1,
1.270224, -0.2260122, 0.560604, 1, 1, 1, 1, 1,
1.270758, 2.244217, 1.608825, 1, 1, 1, 1, 1,
1.271383, -0.3249183, 2.496962, 1, 1, 1, 1, 1,
1.271538, -0.5999104, 3.634434, 1, 1, 1, 1, 1,
1.28207, 1.248393, 2.527041, 1, 1, 1, 1, 1,
1.291109, -0.8591914, 2.828801, 1, 1, 1, 1, 1,
1.292578, 0.4132992, 1.72103, 0, 0, 1, 1, 1,
1.3039, 0.07618757, 1.836653, 1, 0, 0, 1, 1,
1.321447, -1.264653, 2.404096, 1, 0, 0, 1, 1,
1.322253, 0.2189085, 1.010131, 1, 0, 0, 1, 1,
1.325531, -0.8530709, 4.011073, 1, 0, 0, 1, 1,
1.335977, -0.4658688, 2.698348, 1, 0, 0, 1, 1,
1.339809, 0.709609, 1.028059, 0, 0, 0, 1, 1,
1.34269, 1.028628, -0.3658528, 0, 0, 0, 1, 1,
1.347099, 0.4349315, 1.251801, 0, 0, 0, 1, 1,
1.347498, -0.7972501, 2.736114, 0, 0, 0, 1, 1,
1.354361, -0.7558106, 3.292011, 0, 0, 0, 1, 1,
1.359349, 0.5525587, -0.1308227, 0, 0, 0, 1, 1,
1.36098, 1.445119, 1.303749, 0, 0, 0, 1, 1,
1.384794, 1.16667, 1.196842, 1, 1, 1, 1, 1,
1.388548, 1.641083, 1.606247, 1, 1, 1, 1, 1,
1.40095, 0.8508344, -0.02455112, 1, 1, 1, 1, 1,
1.407528, -0.6967399, 2.790895, 1, 1, 1, 1, 1,
1.416658, 1.241887, -0.1188298, 1, 1, 1, 1, 1,
1.448806, 0.5031584, 1.13296, 1, 1, 1, 1, 1,
1.449893, -0.199726, 0.505335, 1, 1, 1, 1, 1,
1.4586, -1.058481, 2.20052, 1, 1, 1, 1, 1,
1.462063, 0.2330026, 0.7817605, 1, 1, 1, 1, 1,
1.462256, 0.5886226, 0.8223983, 1, 1, 1, 1, 1,
1.475852, 0.7950028, 2.305346, 1, 1, 1, 1, 1,
1.479112, -0.7223714, 2.123447, 1, 1, 1, 1, 1,
1.482491, 1.570807, -0.9391681, 1, 1, 1, 1, 1,
1.48539, -0.2613341, 2.356241, 1, 1, 1, 1, 1,
1.498928, -0.6527451, 1.216934, 1, 1, 1, 1, 1,
1.507792, -0.6972981, 1.184154, 0, 0, 1, 1, 1,
1.508348, -0.6098095, 1.214818, 1, 0, 0, 1, 1,
1.527079, -0.2895947, 2.109563, 1, 0, 0, 1, 1,
1.529489, 0.8887541, 0.638642, 1, 0, 0, 1, 1,
1.529501, 1.566131, -1.022569, 1, 0, 0, 1, 1,
1.530796, 1.116847, 0.5726653, 1, 0, 0, 1, 1,
1.53802, 1.911106, 2.30149, 0, 0, 0, 1, 1,
1.557973, 0.4758631, 1.85601, 0, 0, 0, 1, 1,
1.572784, -0.7680702, 3.400775, 0, 0, 0, 1, 1,
1.5799, -1.752028, 2.400301, 0, 0, 0, 1, 1,
1.602668, 0.6780162, 1.809135, 0, 0, 0, 1, 1,
1.606014, 1.491366, 1.563256, 0, 0, 0, 1, 1,
1.610266, -0.3857686, 0.5655642, 0, 0, 0, 1, 1,
1.612377, -0.2232254, 2.133447, 1, 1, 1, 1, 1,
1.623664, 0.1531214, 1.311019, 1, 1, 1, 1, 1,
1.625784, -0.9931356, 1.526545, 1, 1, 1, 1, 1,
1.626362, 0.1423405, 0.2167374, 1, 1, 1, 1, 1,
1.644897, 1.068834, 1.686695, 1, 1, 1, 1, 1,
1.655469, 1.379109, 0.7527415, 1, 1, 1, 1, 1,
1.659834, -0.2601201, 1.267133, 1, 1, 1, 1, 1,
1.660367, 0.6990983, 2.747691, 1, 1, 1, 1, 1,
1.680494, 0.9622179, 1.784205, 1, 1, 1, 1, 1,
1.704646, -1.174755, 2.558656, 1, 1, 1, 1, 1,
1.721975, -0.7563009, 1.005969, 1, 1, 1, 1, 1,
1.724697, -0.3456687, 4.327092, 1, 1, 1, 1, 1,
1.767469, 0.0626459, 1.552072, 1, 1, 1, 1, 1,
1.773545, -0.1908002, 1.375992, 1, 1, 1, 1, 1,
1.775406, -0.1792423, 1.901564, 1, 1, 1, 1, 1,
1.783555, 0.6754748, 0.1174586, 0, 0, 1, 1, 1,
1.794565, -0.2695633, 1.456149, 1, 0, 0, 1, 1,
1.811384, 0.323789, 0.5161498, 1, 0, 0, 1, 1,
1.814477, -0.8024202, 2.035062, 1, 0, 0, 1, 1,
1.819629, 1.166283, 2.861132, 1, 0, 0, 1, 1,
1.826063, 0.9809855, 0.03497795, 1, 0, 0, 1, 1,
1.826427, -0.06536341, 2.531948, 0, 0, 0, 1, 1,
1.826965, -0.140967, 1.750013, 0, 0, 0, 1, 1,
1.828452, 0.1924795, 0.05405305, 0, 0, 0, 1, 1,
1.934585, -1.537318, 2.400969, 0, 0, 0, 1, 1,
1.935831, 1.433907, 1.536255, 0, 0, 0, 1, 1,
1.94334, 0.5199048, 0.1398897, 0, 0, 0, 1, 1,
1.950551, -0.4374621, 1.151439, 0, 0, 0, 1, 1,
1.953772, -1.835061, 3.151007, 1, 1, 1, 1, 1,
2.009741, 0.8548194, -0.6613248, 1, 1, 1, 1, 1,
2.020766, 1.069789, -0.6770284, 1, 1, 1, 1, 1,
2.023096, 0.6652731, 1.6005, 1, 1, 1, 1, 1,
2.042568, -0.9027901, 2.68309, 1, 1, 1, 1, 1,
2.043673, -0.7888893, 1.229959, 1, 1, 1, 1, 1,
2.051439, 0.2173487, 0.870701, 1, 1, 1, 1, 1,
2.052544, -0.5524301, 2.65187, 1, 1, 1, 1, 1,
2.053393, -2.195717, 3.137546, 1, 1, 1, 1, 1,
2.07001, 0.5014735, 0.7652674, 1, 1, 1, 1, 1,
2.078354, -0.1172437, -0.5654571, 1, 1, 1, 1, 1,
2.132513, 1.013007, 0.2921948, 1, 1, 1, 1, 1,
2.135878, 0.4102305, 3.249941, 1, 1, 1, 1, 1,
2.17558, -0.1129789, 0.332827, 1, 1, 1, 1, 1,
2.21694, -0.4926263, 3.946872, 1, 1, 1, 1, 1,
2.220626, -0.1076232, 2.997507, 0, 0, 1, 1, 1,
2.244306, -0.6420035, 3.017039, 1, 0, 0, 1, 1,
2.253393, -0.1825543, 4.469705, 1, 0, 0, 1, 1,
2.293743, 2.211323, 2.162092, 1, 0, 0, 1, 1,
2.307205, 1.460978, 0.9512511, 1, 0, 0, 1, 1,
2.31296, -1.530291, 1.384754, 1, 0, 0, 1, 1,
2.341219, -1.366841, 0.716597, 0, 0, 0, 1, 1,
2.410997, -0.7185827, 1.604177, 0, 0, 0, 1, 1,
2.418143, 0.6630424, 0.2747709, 0, 0, 0, 1, 1,
2.661893, -1.158985, 0.5397441, 0, 0, 0, 1, 1,
2.664338, -0.08800915, 0.8749255, 0, 0, 0, 1, 1,
2.783047, -0.04162697, 2.724958, 0, 0, 0, 1, 1,
2.785337, 1.653058, 2.122257, 0, 0, 0, 1, 1,
2.789444, 2.083807, 2.681151, 1, 1, 1, 1, 1,
3.067906, 0.84797, 1.644595, 1, 1, 1, 1, 1,
3.099204, -0.7819914, 2.642427, 1, 1, 1, 1, 1,
3.118735, 1.494844, 1.437366, 1, 1, 1, 1, 1,
3.247102, 0.3366728, 1.381377, 1, 1, 1, 1, 1,
3.334065, 0.1768143, 1.554341, 1, 1, 1, 1, 1,
3.438556, 0.200158, 2.0146, 1, 1, 1, 1, 1
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
var radius = 9.664558;
var distance = 33.94635;
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
mvMatrix.translate( 0.07432175, 0.1306784, 0.02461028 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94635);
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
