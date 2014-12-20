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
-3.091549, -0.2197602, -0.7549012, 1, 0, 0, 1,
-3.017041, 0.06336522, -1.958591, 1, 0.007843138, 0, 1,
-2.873015, -0.5507125, -2.893058, 1, 0.01176471, 0, 1,
-2.778569, 0.9122386, -1.298664, 1, 0.01960784, 0, 1,
-2.751929, 0.02588936, -2.784653, 1, 0.02352941, 0, 1,
-2.746332, -0.8850305, -2.805938, 1, 0.03137255, 0, 1,
-2.658819, 1.641552, -1.979748, 1, 0.03529412, 0, 1,
-2.593008, -0.670302, -2.95644, 1, 0.04313726, 0, 1,
-2.514494, 0.02021474, -1.285473, 1, 0.04705882, 0, 1,
-2.442384, 2.045843, -0.8364499, 1, 0.05490196, 0, 1,
-2.316747, -0.5087503, -1.390099, 1, 0.05882353, 0, 1,
-2.297336, -1.070407, -1.342892, 1, 0.06666667, 0, 1,
-2.27315, 0.1675802, -0.9595369, 1, 0.07058824, 0, 1,
-2.266763, -0.2826891, 0.4652458, 1, 0.07843138, 0, 1,
-2.171888, 2.323174, -1.259088, 1, 0.08235294, 0, 1,
-2.090308, 0.159723, -1.302866, 1, 0.09019608, 0, 1,
-2.071017, 0.1500527, -1.39777, 1, 0.09411765, 0, 1,
-2.057247, -1.235598, -1.408561, 1, 0.1019608, 0, 1,
-2.031955, 1.127033, 0.5174215, 1, 0.1098039, 0, 1,
-2.001125, 0.2585446, -1.72021, 1, 0.1137255, 0, 1,
-1.998095, -0.06931248, -0.5933533, 1, 0.1215686, 0, 1,
-1.943693, 0.2410329, -1.407221, 1, 0.1254902, 0, 1,
-1.917021, 0.99527, 0.5569743, 1, 0.1333333, 0, 1,
-1.874823, -0.6824925, -1.154101, 1, 0.1372549, 0, 1,
-1.815239, 0.03076369, -2.232802, 1, 0.145098, 0, 1,
-1.806993, -3.034149, -1.512666, 1, 0.1490196, 0, 1,
-1.799172, -0.1030628, -2.792881, 1, 0.1568628, 0, 1,
-1.790798, 0.9894956, -1.042414, 1, 0.1607843, 0, 1,
-1.77162, 0.6517617, -1.622148, 1, 0.1686275, 0, 1,
-1.755051, -0.8269527, -0.5060217, 1, 0.172549, 0, 1,
-1.74723, 0.919661, -0.4931882, 1, 0.1803922, 0, 1,
-1.732784, -0.4683281, -1.12349, 1, 0.1843137, 0, 1,
-1.719329, 0.09161301, -1.977592, 1, 0.1921569, 0, 1,
-1.713872, -0.8159509, -2.273065, 1, 0.1960784, 0, 1,
-1.71164, -1.795574, -3.217966, 1, 0.2039216, 0, 1,
-1.703349, -0.4898672, -1.957327, 1, 0.2117647, 0, 1,
-1.688693, -0.2367296, -0.9513921, 1, 0.2156863, 0, 1,
-1.672977, 1.18528, -0.9595045, 1, 0.2235294, 0, 1,
-1.665041, -1.025044, -2.165713, 1, 0.227451, 0, 1,
-1.662831, -0.3669359, -3.04855, 1, 0.2352941, 0, 1,
-1.631495, 1.001256, -0.3999637, 1, 0.2392157, 0, 1,
-1.618161, 0.4890772, -1.568437, 1, 0.2470588, 0, 1,
-1.612107, -0.5009735, -0.5111603, 1, 0.2509804, 0, 1,
-1.602708, 0.1075772, -2.350332, 1, 0.2588235, 0, 1,
-1.601495, -0.3104662, -1.717901, 1, 0.2627451, 0, 1,
-1.598819, -0.641376, -1.509788, 1, 0.2705882, 0, 1,
-1.59638, 0.03774516, -2.253802, 1, 0.2745098, 0, 1,
-1.591605, -0.04033685, -1.555929, 1, 0.282353, 0, 1,
-1.580369, 1.029795, -1.063928, 1, 0.2862745, 0, 1,
-1.572262, -1.337757, -2.063451, 1, 0.2941177, 0, 1,
-1.568911, 1.358935, -0.8795277, 1, 0.3019608, 0, 1,
-1.568235, -0.5378828, 0.2730443, 1, 0.3058824, 0, 1,
-1.56811, 1.149197, 0.3795373, 1, 0.3137255, 0, 1,
-1.547845, -1.384403, -3.245507, 1, 0.3176471, 0, 1,
-1.535189, -0.1737453, -2.120635, 1, 0.3254902, 0, 1,
-1.526697, -0.7041864, -3.116085, 1, 0.3294118, 0, 1,
-1.518201, 0.6183952, -0.8781215, 1, 0.3372549, 0, 1,
-1.516166, -0.9726843, -1.899915, 1, 0.3411765, 0, 1,
-1.511825, 0.6943787, -2.104596, 1, 0.3490196, 0, 1,
-1.507861, -1.444351, -3.387241, 1, 0.3529412, 0, 1,
-1.499401, -0.3225023, -2.147669, 1, 0.3607843, 0, 1,
-1.497225, 0.7651352, -1.722405, 1, 0.3647059, 0, 1,
-1.493307, 2.509004, -1.085478, 1, 0.372549, 0, 1,
-1.492865, -1.428445, -2.867968, 1, 0.3764706, 0, 1,
-1.490877, -0.7350995, -0.6611235, 1, 0.3843137, 0, 1,
-1.476592, 0.6763978, -1.511213, 1, 0.3882353, 0, 1,
-1.454865, 0.3662672, -2.395732, 1, 0.3960784, 0, 1,
-1.446058, -0.09793091, -2.088892, 1, 0.4039216, 0, 1,
-1.441136, -0.2464664, -2.307284, 1, 0.4078431, 0, 1,
-1.432453, 0.02638207, -1.54689, 1, 0.4156863, 0, 1,
-1.418145, 0.5623193, 0.3934116, 1, 0.4196078, 0, 1,
-1.416291, 0.5127064, -1.584145, 1, 0.427451, 0, 1,
-1.414291, -0.608698, -2.721929, 1, 0.4313726, 0, 1,
-1.402601, -0.2750888, -2.300544, 1, 0.4392157, 0, 1,
-1.36749, 1.072863, -1.989569, 1, 0.4431373, 0, 1,
-1.359728, -1.168117, -3.621633, 1, 0.4509804, 0, 1,
-1.352919, -0.6997464, -0.3970012, 1, 0.454902, 0, 1,
-1.352468, 0.7233307, -2.847182, 1, 0.4627451, 0, 1,
-1.331073, -0.3013563, -1.707707, 1, 0.4666667, 0, 1,
-1.327444, -0.3330611, -3.542146, 1, 0.4745098, 0, 1,
-1.327095, 0.5093449, -2.351052, 1, 0.4784314, 0, 1,
-1.324255, -0.4346546, -0.2789413, 1, 0.4862745, 0, 1,
-1.31561, -1.059698, -2.697095, 1, 0.4901961, 0, 1,
-1.312163, 0.3108885, -2.208698, 1, 0.4980392, 0, 1,
-1.301704, 0.06575586, -2.119765, 1, 0.5058824, 0, 1,
-1.296267, 1.429015, -1.78433, 1, 0.509804, 0, 1,
-1.291984, 0.8276867, -2.492385, 1, 0.5176471, 0, 1,
-1.289595, -1.073266, -2.572892, 1, 0.5215687, 0, 1,
-1.285662, -0.8886166, -1.967381, 1, 0.5294118, 0, 1,
-1.278299, 0.1136147, -1.586597, 1, 0.5333334, 0, 1,
-1.277792, 1.29424, -1.384858, 1, 0.5411765, 0, 1,
-1.271571, 0.8633735, -1.16807, 1, 0.5450981, 0, 1,
-1.270349, -0.3313817, -1.105213, 1, 0.5529412, 0, 1,
-1.268504, 2.126025, -1.473536, 1, 0.5568628, 0, 1,
-1.268345, -0.344698, -2.103696, 1, 0.5647059, 0, 1,
-1.261356, -0.846361, -0.8246595, 1, 0.5686275, 0, 1,
-1.259689, -0.4687222, -0.5063917, 1, 0.5764706, 0, 1,
-1.256147, 0.5100706, -1.357181, 1, 0.5803922, 0, 1,
-1.24323, 0.1951581, -1.151016, 1, 0.5882353, 0, 1,
-1.235872, 0.4070868, -0.6440523, 1, 0.5921569, 0, 1,
-1.227468, 0.01326188, -1.860665, 1, 0.6, 0, 1,
-1.226703, 0.430495, -0.9338562, 1, 0.6078432, 0, 1,
-1.222017, -0.9169757, -2.670995, 1, 0.6117647, 0, 1,
-1.210601, -0.109503, -1.933838, 1, 0.6196079, 0, 1,
-1.210488, -0.9374713, -1.669125, 1, 0.6235294, 0, 1,
-1.205514, 0.6420673, -1.148541, 1, 0.6313726, 0, 1,
-1.202844, -0.23761, -1.276177, 1, 0.6352941, 0, 1,
-1.19863, 0.2747002, -1.140763, 1, 0.6431373, 0, 1,
-1.198072, -0.0290131, -2.33241, 1, 0.6470588, 0, 1,
-1.195655, 0.003900849, -1.976828, 1, 0.654902, 0, 1,
-1.189952, -0.395833, -4.15987, 1, 0.6588235, 0, 1,
-1.18942, 0.1570443, -2.992637, 1, 0.6666667, 0, 1,
-1.187657, -0.7976123, -1.117065, 1, 0.6705883, 0, 1,
-1.182609, 0.1116457, -0.8019611, 1, 0.6784314, 0, 1,
-1.175904, -0.5338896, -2.10325, 1, 0.682353, 0, 1,
-1.17175, -2.325103, -4.52615, 1, 0.6901961, 0, 1,
-1.169513, -0.5894316, -2.435344, 1, 0.6941177, 0, 1,
-1.168814, 1.448187, -1.227073, 1, 0.7019608, 0, 1,
-1.165952, 0.315886, -2.293148, 1, 0.7098039, 0, 1,
-1.154859, -0.1058303, -0.8861732, 1, 0.7137255, 0, 1,
-1.147768, 0.1538407, -1.008442, 1, 0.7215686, 0, 1,
-1.139728, 0.1029714, -1.107609, 1, 0.7254902, 0, 1,
-1.137078, 0.4280979, -0.6595049, 1, 0.7333333, 0, 1,
-1.132001, 0.7805272, -0.8393937, 1, 0.7372549, 0, 1,
-1.127338, 1.767085, 0.1526818, 1, 0.7450981, 0, 1,
-1.121779, 0.7845664, -0.7324083, 1, 0.7490196, 0, 1,
-1.120091, -0.9596569, -1.977663, 1, 0.7568628, 0, 1,
-1.119814, 1.906244, 0.6794811, 1, 0.7607843, 0, 1,
-1.115338, -0.1906833, -1.072279, 1, 0.7686275, 0, 1,
-1.106539, 0.322687, -0.7406912, 1, 0.772549, 0, 1,
-1.104811, -0.679387, -4.376094, 1, 0.7803922, 0, 1,
-1.104273, 0.3381456, -0.9581637, 1, 0.7843137, 0, 1,
-1.098189, 0.8073, -0.1848588, 1, 0.7921569, 0, 1,
-1.097263, 0.8355829, -2.01491, 1, 0.7960784, 0, 1,
-1.096482, -1.106778, -1.804438, 1, 0.8039216, 0, 1,
-1.085518, 0.9042729, -1.454477, 1, 0.8117647, 0, 1,
-1.085289, 1.079689, -1.558623, 1, 0.8156863, 0, 1,
-1.083712, 0.5024194, -1.853252, 1, 0.8235294, 0, 1,
-1.079723, 0.3106755, -1.484124, 1, 0.827451, 0, 1,
-1.078164, 1.199548, -1.222607, 1, 0.8352941, 0, 1,
-1.06605, -0.2105524, -1.557213, 1, 0.8392157, 0, 1,
-1.064001, 1.746767, -0.03556223, 1, 0.8470588, 0, 1,
-1.06058, 0.9307711, -0.5769269, 1, 0.8509804, 0, 1,
-1.060009, 0.156004, -1.1, 1, 0.8588235, 0, 1,
-1.057557, 0.05725369, -2.372486, 1, 0.8627451, 0, 1,
-1.04378, -1.482446, -2.189133, 1, 0.8705882, 0, 1,
-1.036875, 0.9916325, 0.4186374, 1, 0.8745098, 0, 1,
-1.031999, 1.805597, 0.510037, 1, 0.8823529, 0, 1,
-1.026279, 0.8414977, -2.003657, 1, 0.8862745, 0, 1,
-1.019002, 1.73702, -1.397376, 1, 0.8941177, 0, 1,
-1.008389, 0.9961129, -1.099787, 1, 0.8980392, 0, 1,
-1.002152, -0.6924158, -2.204315, 1, 0.9058824, 0, 1,
-0.9953489, -1.449325, -2.766833, 1, 0.9137255, 0, 1,
-0.9944907, -1.326948, -2.594754, 1, 0.9176471, 0, 1,
-0.9944517, 0.9140924, -3.262546, 1, 0.9254902, 0, 1,
-0.9806129, -0.1321204, -2.023894, 1, 0.9294118, 0, 1,
-0.9794776, -0.1445075, -0.466341, 1, 0.9372549, 0, 1,
-0.9793428, -0.1897773, -2.589741, 1, 0.9411765, 0, 1,
-0.9638218, -0.1607431, -2.429244, 1, 0.9490196, 0, 1,
-0.9572212, 1.144702, 0.5831372, 1, 0.9529412, 0, 1,
-0.9510376, 1.252243, -0.2562808, 1, 0.9607843, 0, 1,
-0.9489819, -0.0713706, 0.1114401, 1, 0.9647059, 0, 1,
-0.9459434, 0.1166683, -0.8505476, 1, 0.972549, 0, 1,
-0.9450462, 0.5596361, -0.6846525, 1, 0.9764706, 0, 1,
-0.9353072, 0.2957134, -1.213233, 1, 0.9843137, 0, 1,
-0.9251388, 1.338795, -0.09750229, 1, 0.9882353, 0, 1,
-0.9249072, -0.4244334, -1.975798, 1, 0.9960784, 0, 1,
-0.9019406, -0.6535695, -2.330659, 0.9960784, 1, 0, 1,
-0.9010617, -1.281426, -1.71675, 0.9921569, 1, 0, 1,
-0.8963752, -1.296313, -0.3953542, 0.9843137, 1, 0, 1,
-0.8956158, -0.08739007, -1.846949, 0.9803922, 1, 0, 1,
-0.8867647, 2.532568, -0.0371538, 0.972549, 1, 0, 1,
-0.885169, -0.8595521, -1.898495, 0.9686275, 1, 0, 1,
-0.8840213, 1.238508, -1.10876, 0.9607843, 1, 0, 1,
-0.8803793, 0.7038707, -0.4000309, 0.9568627, 1, 0, 1,
-0.8784826, -0.2955584, -1.189659, 0.9490196, 1, 0, 1,
-0.8783924, -0.6751848, -2.374253, 0.945098, 1, 0, 1,
-0.8776721, -1.30567, -3.686471, 0.9372549, 1, 0, 1,
-0.8770464, 0.2193205, -1.597612, 0.9333333, 1, 0, 1,
-0.875118, -2.246818, -2.565983, 0.9254902, 1, 0, 1,
-0.8749824, 0.1980625, -0.2359069, 0.9215686, 1, 0, 1,
-0.8704086, 0.4202777, -0.7528247, 0.9137255, 1, 0, 1,
-0.8646831, -0.7053977, -0.09601142, 0.9098039, 1, 0, 1,
-0.8572192, 0.02428997, -1.794837, 0.9019608, 1, 0, 1,
-0.854697, -0.8174143, -3.160238, 0.8941177, 1, 0, 1,
-0.8495483, 0.9277715, -1.447175, 0.8901961, 1, 0, 1,
-0.8484084, 0.628456, 1.710703, 0.8823529, 1, 0, 1,
-0.8440095, 0.6885446, -0.6022467, 0.8784314, 1, 0, 1,
-0.8421064, 0.05958056, -1.172941, 0.8705882, 1, 0, 1,
-0.8406914, 0.9381719, 0.4909978, 0.8666667, 1, 0, 1,
-0.8395063, -1.554876, -4.409996, 0.8588235, 1, 0, 1,
-0.8383408, 0.2494358, -1.585552, 0.854902, 1, 0, 1,
-0.8309583, 0.5269527, 0.3259413, 0.8470588, 1, 0, 1,
-0.828516, 0.01352417, -1.889388, 0.8431373, 1, 0, 1,
-0.8245357, -0.8567657, -3.877697, 0.8352941, 1, 0, 1,
-0.8219355, 0.03050867, 0.6699506, 0.8313726, 1, 0, 1,
-0.8209503, -0.9142846, -1.030082, 0.8235294, 1, 0, 1,
-0.8175944, 2.29887, -2.10765, 0.8196079, 1, 0, 1,
-0.8154885, -0.2373466, -2.286772, 0.8117647, 1, 0, 1,
-0.8122203, -0.08187262, -1.776317, 0.8078431, 1, 0, 1,
-0.8110838, -0.143343, -3.412888, 0.8, 1, 0, 1,
-0.8031983, -0.3514234, -1.260231, 0.7921569, 1, 0, 1,
-0.8023528, -0.06685805, -1.767902, 0.7882353, 1, 0, 1,
-0.7996617, -0.4324127, -0.08110128, 0.7803922, 1, 0, 1,
-0.7982267, 0.02311073, -1.808978, 0.7764706, 1, 0, 1,
-0.7981979, -1.419487, -3.555594, 0.7686275, 1, 0, 1,
-0.7931091, 0.307552, -2.951151, 0.7647059, 1, 0, 1,
-0.7898666, -1.405341, -2.411377, 0.7568628, 1, 0, 1,
-0.7874354, 0.3224434, -1.811779, 0.7529412, 1, 0, 1,
-0.7838959, 2.052203, -0.2153031, 0.7450981, 1, 0, 1,
-0.7833338, 0.8355501, -2.503643, 0.7411765, 1, 0, 1,
-0.7804178, 1.03728, 0.07081932, 0.7333333, 1, 0, 1,
-0.7788888, 0.6843181, -1.709544, 0.7294118, 1, 0, 1,
-0.7750804, -1.444418, -3.29097, 0.7215686, 1, 0, 1,
-0.7712201, -1.248732, -3.907231, 0.7176471, 1, 0, 1,
-0.7692701, 0.1316769, -1.807745, 0.7098039, 1, 0, 1,
-0.754603, -0.3430602, -4.68029, 0.7058824, 1, 0, 1,
-0.752701, 1.14116, -0.5372619, 0.6980392, 1, 0, 1,
-0.7490951, -0.758527, -3.301993, 0.6901961, 1, 0, 1,
-0.7452989, -0.1734679, -2.723099, 0.6862745, 1, 0, 1,
-0.7406492, -0.7785168, -3.378892, 0.6784314, 1, 0, 1,
-0.7400373, 0.454842, -2.296554, 0.6745098, 1, 0, 1,
-0.7396908, -0.4333942, -3.874328, 0.6666667, 1, 0, 1,
-0.7351918, -0.5781427, -3.471755, 0.6627451, 1, 0, 1,
-0.7313768, -1.047979, -2.647038, 0.654902, 1, 0, 1,
-0.7307766, -0.2993955, -2.346906, 0.6509804, 1, 0, 1,
-0.7272571, -0.7244432, -3.773528, 0.6431373, 1, 0, 1,
-0.7242805, -0.7449326, -4.015503, 0.6392157, 1, 0, 1,
-0.7221525, 0.007265654, -0.299542, 0.6313726, 1, 0, 1,
-0.7190238, 0.4833555, -0.2507025, 0.627451, 1, 0, 1,
-0.7177, -0.2255892, 0.004552719, 0.6196079, 1, 0, 1,
-0.7140259, 0.2648356, -2.051731, 0.6156863, 1, 0, 1,
-0.7121236, -0.6511886, -2.703518, 0.6078432, 1, 0, 1,
-0.7103334, 1.396507, -0.8780802, 0.6039216, 1, 0, 1,
-0.7098163, 0.2902762, -1.438753, 0.5960785, 1, 0, 1,
-0.7041156, -1.256449, -2.275854, 0.5882353, 1, 0, 1,
-0.7016021, 0.009408216, -1.522907, 0.5843138, 1, 0, 1,
-0.6974502, 0.9360595, -0.9198931, 0.5764706, 1, 0, 1,
-0.6937862, 1.69963, -0.6063961, 0.572549, 1, 0, 1,
-0.6835171, 1.218218, 0.7854826, 0.5647059, 1, 0, 1,
-0.6689542, -0.2840662, -2.64091, 0.5607843, 1, 0, 1,
-0.6644015, -0.9612212, -2.320469, 0.5529412, 1, 0, 1,
-0.663928, 1.372775, -0.6317525, 0.5490196, 1, 0, 1,
-0.6593091, 1.837977, -0.1011497, 0.5411765, 1, 0, 1,
-0.6583166, 0.506486, -1.323267, 0.5372549, 1, 0, 1,
-0.654671, -0.1129593, -3.656178, 0.5294118, 1, 0, 1,
-0.6537932, -0.4085477, -1.36041, 0.5254902, 1, 0, 1,
-0.6537553, 0.9910837, 1.399277, 0.5176471, 1, 0, 1,
-0.6528143, 0.0753699, -2.137368, 0.5137255, 1, 0, 1,
-0.6483159, -1.686065, -3.356346, 0.5058824, 1, 0, 1,
-0.6437785, 0.9095196, -0.1603466, 0.5019608, 1, 0, 1,
-0.6427001, 0.4610415, 0.5828852, 0.4941176, 1, 0, 1,
-0.6420199, 1.534424, -0.03403671, 0.4862745, 1, 0, 1,
-0.638941, -0.6781883, -1.029237, 0.4823529, 1, 0, 1,
-0.6374819, 0.2535048, -1.720402, 0.4745098, 1, 0, 1,
-0.6363844, -0.6710239, -1.144285, 0.4705882, 1, 0, 1,
-0.6313253, -0.9334508, -3.117555, 0.4627451, 1, 0, 1,
-0.6311107, -1.342155, -1.049114, 0.4588235, 1, 0, 1,
-0.6292608, -0.4100633, 0.6867937, 0.4509804, 1, 0, 1,
-0.6292159, -2.104587, -2.522855, 0.4470588, 1, 0, 1,
-0.6264797, -0.7296897, -3.590588, 0.4392157, 1, 0, 1,
-0.6244888, -1.007766, -3.778397, 0.4352941, 1, 0, 1,
-0.6238433, 0.7846842, -0.3005969, 0.427451, 1, 0, 1,
-0.6232265, 0.3777411, -0.2385491, 0.4235294, 1, 0, 1,
-0.6203803, 1.619678, -0.511966, 0.4156863, 1, 0, 1,
-0.6146026, -1.415608, -2.887421, 0.4117647, 1, 0, 1,
-0.6113036, -1.735736, -3.624148, 0.4039216, 1, 0, 1,
-0.6072165, 0.3984758, 0.6400805, 0.3960784, 1, 0, 1,
-0.5886062, 1.853142, -2.150803, 0.3921569, 1, 0, 1,
-0.5855635, -1.469152, -2.182187, 0.3843137, 1, 0, 1,
-0.5772569, -0.8557932, -1.901695, 0.3803922, 1, 0, 1,
-0.5769318, 0.2178076, -1.913021, 0.372549, 1, 0, 1,
-0.5734258, -0.6983556, -3.373296, 0.3686275, 1, 0, 1,
-0.5712324, 0.03703761, -1.107134, 0.3607843, 1, 0, 1,
-0.5705941, -0.02490418, -1.8807, 0.3568628, 1, 0, 1,
-0.5697818, -1.180099, -1.722294, 0.3490196, 1, 0, 1,
-0.5635452, -0.2775272, -3.705983, 0.345098, 1, 0, 1,
-0.560526, 0.1844697, -2.965456, 0.3372549, 1, 0, 1,
-0.5579541, -0.6156924, -2.187157, 0.3333333, 1, 0, 1,
-0.5515778, 0.8511766, -0.2578876, 0.3254902, 1, 0, 1,
-0.5397635, 1.567043, -2.430865, 0.3215686, 1, 0, 1,
-0.539314, -0.03463664, -2.683248, 0.3137255, 1, 0, 1,
-0.5360333, -0.430386, -1.678075, 0.3098039, 1, 0, 1,
-0.5348376, 0.666226, 0.08410522, 0.3019608, 1, 0, 1,
-0.53287, 1.451774, -0.3423624, 0.2941177, 1, 0, 1,
-0.5297629, -0.7172635, -0.2073074, 0.2901961, 1, 0, 1,
-0.5236522, -1.353607, -2.515817, 0.282353, 1, 0, 1,
-0.5208623, 0.1359739, -0.7193141, 0.2784314, 1, 0, 1,
-0.5198383, -0.878386, -3.544282, 0.2705882, 1, 0, 1,
-0.5180828, 0.2944803, -1.114779, 0.2666667, 1, 0, 1,
-0.5100564, 0.3255233, -0.8329561, 0.2588235, 1, 0, 1,
-0.5070901, -0.3065307, -3.360013, 0.254902, 1, 0, 1,
-0.5057551, -0.2832367, -2.402063, 0.2470588, 1, 0, 1,
-0.4996027, -0.5258626, -1.970037, 0.2431373, 1, 0, 1,
-0.4919576, -2.76614, -1.224701, 0.2352941, 1, 0, 1,
-0.4883881, -0.5577311, -3.718173, 0.2313726, 1, 0, 1,
-0.4881937, -2.042052, -4.207153, 0.2235294, 1, 0, 1,
-0.48745, 0.8218896, -0.2065738, 0.2196078, 1, 0, 1,
-0.4824083, 2.386555, 0.5858093, 0.2117647, 1, 0, 1,
-0.4794349, -0.6119043, -2.928491, 0.2078431, 1, 0, 1,
-0.478679, -0.9392745, -1.890541, 0.2, 1, 0, 1,
-0.4754753, 1.265986, -1.877281, 0.1921569, 1, 0, 1,
-0.4753261, -2.454067, -1.669478, 0.1882353, 1, 0, 1,
-0.4716238, -1.017552, -3.659105, 0.1803922, 1, 0, 1,
-0.4702481, -0.009214824, -1.187413, 0.1764706, 1, 0, 1,
-0.469716, -0.3713354, -2.27297, 0.1686275, 1, 0, 1,
-0.4680755, 0.110407, -2.471121, 0.1647059, 1, 0, 1,
-0.4680558, 1.108826, 1.526765, 0.1568628, 1, 0, 1,
-0.4661784, 1.202154, 0.8418017, 0.1529412, 1, 0, 1,
-0.4656532, -1.570506, -2.051894, 0.145098, 1, 0, 1,
-0.4617014, 0.332745, -1.826624, 0.1411765, 1, 0, 1,
-0.4585329, 0.3068906, -0.7469475, 0.1333333, 1, 0, 1,
-0.456226, 0.4427941, -0.910549, 0.1294118, 1, 0, 1,
-0.4519604, -0.7704115, -4.050092, 0.1215686, 1, 0, 1,
-0.4511566, -1.858685, -2.710114, 0.1176471, 1, 0, 1,
-0.4476159, -0.3796237, -2.491651, 0.1098039, 1, 0, 1,
-0.4462856, -0.3652811, -1.968, 0.1058824, 1, 0, 1,
-0.4380977, 0.3355787, -2.122982, 0.09803922, 1, 0, 1,
-0.436082, -1.166917, -4.013865, 0.09019608, 1, 0, 1,
-0.4353004, 0.3597814, -0.6789125, 0.08627451, 1, 0, 1,
-0.4344158, 0.61044, 0.1846219, 0.07843138, 1, 0, 1,
-0.4326274, -0.8014354, -1.404882, 0.07450981, 1, 0, 1,
-0.4305474, 0.677175, -0.3292205, 0.06666667, 1, 0, 1,
-0.4298381, 0.481279, 0.6550568, 0.0627451, 1, 0, 1,
-0.4295094, 0.8567604, 1.534997, 0.05490196, 1, 0, 1,
-0.4274989, 0.6928492, 0.8868136, 0.05098039, 1, 0, 1,
-0.4178654, 0.2413387, 1.072609, 0.04313726, 1, 0, 1,
-0.4152503, 0.3538308, -1.289225, 0.03921569, 1, 0, 1,
-0.4141158, -0.9837903, -2.027005, 0.03137255, 1, 0, 1,
-0.4141097, -0.04381101, -1.525643, 0.02745098, 1, 0, 1,
-0.4102832, 0.04967323, -0.8941814, 0.01960784, 1, 0, 1,
-0.410125, 0.3301986, -0.9779622, 0.01568628, 1, 0, 1,
-0.4078021, -0.7330946, -2.391173, 0.007843138, 1, 0, 1,
-0.4015808, -0.5147452, -4.094769, 0.003921569, 1, 0, 1,
-0.4002087, 0.289934, 0.3365789, 0, 1, 0.003921569, 1,
-0.395703, 1.050748, 0.1036758, 0, 1, 0.01176471, 1,
-0.3949494, 1.521509, 0.7590601, 0, 1, 0.01568628, 1,
-0.393262, 0.5768129, -2.257947, 0, 1, 0.02352941, 1,
-0.3901623, 1.149207, -1.625048, 0, 1, 0.02745098, 1,
-0.3887378, -0.04752585, -2.128888, 0, 1, 0.03529412, 1,
-0.386281, -1.446, -2.790082, 0, 1, 0.03921569, 1,
-0.3862036, 0.7885579, -1.497592, 0, 1, 0.04705882, 1,
-0.3828569, -0.9790365, -0.7801309, 0, 1, 0.05098039, 1,
-0.382382, 0.8988773, -0.9571832, 0, 1, 0.05882353, 1,
-0.3798864, 1.151032, 0.1658106, 0, 1, 0.0627451, 1,
-0.3783317, -0.06081647, -1.307918, 0, 1, 0.07058824, 1,
-0.3751211, 0.8660375, 0.3252007, 0, 1, 0.07450981, 1,
-0.3677343, -1.202674, -2.445067, 0, 1, 0.08235294, 1,
-0.3647785, 0.1892855, -1.151555, 0, 1, 0.08627451, 1,
-0.3611381, -1.070704, -4.494229, 0, 1, 0.09411765, 1,
-0.3600052, -0.1923457, -0.7783531, 0, 1, 0.1019608, 1,
-0.3596858, 0.6785794, -1.368635, 0, 1, 0.1058824, 1,
-0.3586487, 0.01559731, -1.047567, 0, 1, 0.1137255, 1,
-0.3563405, -0.4502811, -3.575145, 0, 1, 0.1176471, 1,
-0.3554694, -0.791165, -3.724559, 0, 1, 0.1254902, 1,
-0.3515055, -0.6739908, -3.831721, 0, 1, 0.1294118, 1,
-0.3514773, 0.7361193, -0.04176704, 0, 1, 0.1372549, 1,
-0.3495034, 0.623912, -0.7220429, 0, 1, 0.1411765, 1,
-0.3468738, -0.08393344, -1.377559, 0, 1, 0.1490196, 1,
-0.3460175, -0.6358915, -4.455816, 0, 1, 0.1529412, 1,
-0.3420027, 1.062821, -0.4560856, 0, 1, 0.1607843, 1,
-0.3386338, -0.870436, -2.219716, 0, 1, 0.1647059, 1,
-0.3352628, -0.009549665, -0.8359886, 0, 1, 0.172549, 1,
-0.3304151, -2.102508, -3.898593, 0, 1, 0.1764706, 1,
-0.3263933, -0.03085057, -0.3948693, 0, 1, 0.1843137, 1,
-0.3251386, -0.2234802, -2.365994, 0, 1, 0.1882353, 1,
-0.3244147, -1.363204, -1.588133, 0, 1, 0.1960784, 1,
-0.3243321, 1.692474, 1.427075, 0, 1, 0.2039216, 1,
-0.3195175, -1.626767, -2.902905, 0, 1, 0.2078431, 1,
-0.3189698, 0.6851332, -0.2425359, 0, 1, 0.2156863, 1,
-0.3188847, 1.613323, 0.2865233, 0, 1, 0.2196078, 1,
-0.3172789, -1.986586, -1.286979, 0, 1, 0.227451, 1,
-0.3155533, -2.899016, -0.883998, 0, 1, 0.2313726, 1,
-0.3132178, 0.1073998, -0.6283267, 0, 1, 0.2392157, 1,
-0.3124501, -0.3091609, -1.446127, 0, 1, 0.2431373, 1,
-0.3121068, -0.8902903, -2.819824, 0, 1, 0.2509804, 1,
-0.3120962, 0.6872256, 0.3082914, 0, 1, 0.254902, 1,
-0.3024013, 0.8584396, -1.317044, 0, 1, 0.2627451, 1,
-0.3011933, -0.3880947, -1.858993, 0, 1, 0.2666667, 1,
-0.3009342, 0.9943299, -0.2049023, 0, 1, 0.2745098, 1,
-0.3009167, -1.390287, -4.750959, 0, 1, 0.2784314, 1,
-0.300202, 0.5658571, -0.4530344, 0, 1, 0.2862745, 1,
-0.2977687, 0.5644782, 0.2599753, 0, 1, 0.2901961, 1,
-0.2966205, 0.4103231, 0.02480891, 0, 1, 0.2980392, 1,
-0.2960416, 0.2565607, -2.315134, 0, 1, 0.3058824, 1,
-0.2935061, 0.7403957, 0.7916239, 0, 1, 0.3098039, 1,
-0.2906027, -0.1867818, 0.3661869, 0, 1, 0.3176471, 1,
-0.2877473, -0.9447969, -3.385194, 0, 1, 0.3215686, 1,
-0.2864353, -0.2744456, -1.239529, 0, 1, 0.3294118, 1,
-0.2818792, -0.7435943, -3.529008, 0, 1, 0.3333333, 1,
-0.2798673, 2.400587, 1.517636, 0, 1, 0.3411765, 1,
-0.2798411, 0.9190311, 0.05771589, 0, 1, 0.345098, 1,
-0.268685, -0.8191091, -2.916846, 0, 1, 0.3529412, 1,
-0.2674904, 0.02391956, -2.456955, 0, 1, 0.3568628, 1,
-0.2587548, 0.1157024, -0.5274985, 0, 1, 0.3647059, 1,
-0.2582974, 2.466158, 0.4432048, 0, 1, 0.3686275, 1,
-0.2581, -1.035275, -4.291182, 0, 1, 0.3764706, 1,
-0.2536845, -0.3632156, -3.052593, 0, 1, 0.3803922, 1,
-0.2458454, 0.5422494, 0.1048391, 0, 1, 0.3882353, 1,
-0.244949, 0.4676746, 0.4302276, 0, 1, 0.3921569, 1,
-0.2441562, -1.265522, -2.060786, 0, 1, 0.4, 1,
-0.2431842, 1.684122, 0.1086878, 0, 1, 0.4078431, 1,
-0.2405732, 0.8248498, -0.3297672, 0, 1, 0.4117647, 1,
-0.2399282, -1.529437, -0.7244453, 0, 1, 0.4196078, 1,
-0.2393435, 0.08460194, -0.5422045, 0, 1, 0.4235294, 1,
-0.2379827, -0.08454885, -2.489042, 0, 1, 0.4313726, 1,
-0.2314913, -1.631157, -2.965222, 0, 1, 0.4352941, 1,
-0.231112, 1.12821, 0.6502784, 0, 1, 0.4431373, 1,
-0.2308571, -1.783875, -3.576856, 0, 1, 0.4470588, 1,
-0.2260597, -1.133055, -2.117077, 0, 1, 0.454902, 1,
-0.2249167, 0.09547035, -0.08559709, 0, 1, 0.4588235, 1,
-0.2241214, -0.663555, -2.80228, 0, 1, 0.4666667, 1,
-0.2204277, 0.08968831, 0.03935474, 0, 1, 0.4705882, 1,
-0.2141639, 1.069513, 0.4598447, 0, 1, 0.4784314, 1,
-0.2126634, -1.307123, -3.241943, 0, 1, 0.4823529, 1,
-0.210629, 0.5671355, 0.9836058, 0, 1, 0.4901961, 1,
-0.2087647, 0.6230447, 0.6218379, 0, 1, 0.4941176, 1,
-0.2086422, 0.5094221, -0.34976, 0, 1, 0.5019608, 1,
-0.2030024, -0.7215652, -4.246481, 0, 1, 0.509804, 1,
-0.1943414, -0.1018727, -2.474711, 0, 1, 0.5137255, 1,
-0.1939598, -1.459876, -4.129083, 0, 1, 0.5215687, 1,
-0.1921638, 2.028872, -1.723304, 0, 1, 0.5254902, 1,
-0.1918302, -1.438382, -2.724362, 0, 1, 0.5333334, 1,
-0.1865161, -1.036514, -2.831896, 0, 1, 0.5372549, 1,
-0.1849508, 0.8598774, -0.5509561, 0, 1, 0.5450981, 1,
-0.1828355, 0.6177311, -2.466805, 0, 1, 0.5490196, 1,
-0.178261, -2.464136, -3.20319, 0, 1, 0.5568628, 1,
-0.1780253, -1.290884, -1.94338, 0, 1, 0.5607843, 1,
-0.1769876, -0.6245484, -2.53966, 0, 1, 0.5686275, 1,
-0.1768646, -0.7243735, -2.154322, 0, 1, 0.572549, 1,
-0.1717023, 0.4841364, -1.535617, 0, 1, 0.5803922, 1,
-0.1712471, 0.4867206, 1.561608, 0, 1, 0.5843138, 1,
-0.1697821, -0.1629893, -2.980223, 0, 1, 0.5921569, 1,
-0.1657721, -1.692083, -2.388976, 0, 1, 0.5960785, 1,
-0.1639686, -0.8653315, -3.075547, 0, 1, 0.6039216, 1,
-0.1635096, 1.491098, -0.2748932, 0, 1, 0.6117647, 1,
-0.1629642, 0.7806948, -0.2444851, 0, 1, 0.6156863, 1,
-0.1626729, 0.6972616, 0.6171374, 0, 1, 0.6235294, 1,
-0.1622725, 1.555649, -0.01637451, 0, 1, 0.627451, 1,
-0.1609075, -0.28186, -4.370701, 0, 1, 0.6352941, 1,
-0.158588, -0.901652, -4.285343, 0, 1, 0.6392157, 1,
-0.1531206, -0.5475956, -2.655216, 0, 1, 0.6470588, 1,
-0.1530935, 0.483427, -0.6247311, 0, 1, 0.6509804, 1,
-0.1513749, 0.3532015, 0.2075034, 0, 1, 0.6588235, 1,
-0.1476303, -0.6175659, -4.174588, 0, 1, 0.6627451, 1,
-0.1474297, -0.4958495, -2.589971, 0, 1, 0.6705883, 1,
-0.1461975, 0.3561904, -0.2066234, 0, 1, 0.6745098, 1,
-0.1459391, -1.223426, -1.475934, 0, 1, 0.682353, 1,
-0.1431729, -0.5204312, -2.893682, 0, 1, 0.6862745, 1,
-0.1414414, 1.211599, -1.194226, 0, 1, 0.6941177, 1,
-0.1391302, 0.1761632, -1.627471, 0, 1, 0.7019608, 1,
-0.1359297, 0.4785905, -0.2557458, 0, 1, 0.7058824, 1,
-0.1324461, -0.2983833, -3.208914, 0, 1, 0.7137255, 1,
-0.1277522, -0.1011763, -4.010658, 0, 1, 0.7176471, 1,
-0.1259195, 0.5816363, 0.9845865, 0, 1, 0.7254902, 1,
-0.1208766, 1.025677, -0.3040809, 0, 1, 0.7294118, 1,
-0.1204937, -0.3752429, -2.684937, 0, 1, 0.7372549, 1,
-0.1196485, -1.567593, -4.429312, 0, 1, 0.7411765, 1,
-0.1169708, 0.4051476, -0.2542419, 0, 1, 0.7490196, 1,
-0.1158845, 0.4304706, -0.5530213, 0, 1, 0.7529412, 1,
-0.1156408, -0.5008942, -3.909512, 0, 1, 0.7607843, 1,
-0.1143827, -1.198578, -3.563672, 0, 1, 0.7647059, 1,
-0.1124168, 0.2563183, 0.478375, 0, 1, 0.772549, 1,
-0.111604, 1.251968, -0.1541808, 0, 1, 0.7764706, 1,
-0.1101924, -0.9666705, -2.854648, 0, 1, 0.7843137, 1,
-0.1031218, -0.8646393, -4.443947, 0, 1, 0.7882353, 1,
-0.1009773, -0.7258738, -3.337577, 0, 1, 0.7960784, 1,
-0.1007303, -0.09749551, -3.875724, 0, 1, 0.8039216, 1,
-0.09702584, 0.03982473, -2.639554, 0, 1, 0.8078431, 1,
-0.09392906, -1.293091, -3.008084, 0, 1, 0.8156863, 1,
-0.09369029, -1.217814, -3.934854, 0, 1, 0.8196079, 1,
-0.09155831, 1.799025, 0.3040394, 0, 1, 0.827451, 1,
-0.08979511, -2.503337, -5.007639, 0, 1, 0.8313726, 1,
-0.08876892, 0.5257716, 0.3081474, 0, 1, 0.8392157, 1,
-0.08744489, 0.7826058, -2.203657, 0, 1, 0.8431373, 1,
-0.0857915, -1.444039, -2.074375, 0, 1, 0.8509804, 1,
-0.08507787, -0.1599952, -3.157366, 0, 1, 0.854902, 1,
-0.08137053, -0.1214203, -2.169872, 0, 1, 0.8627451, 1,
-0.07932095, 0.4667225, -0.7158064, 0, 1, 0.8666667, 1,
-0.0762194, 0.2946042, -0.9448782, 0, 1, 0.8745098, 1,
-0.07595307, 1.060192, 1.350176, 0, 1, 0.8784314, 1,
-0.07488809, -1.48189, -4.353594, 0, 1, 0.8862745, 1,
-0.07453962, -0.6335356, -3.274806, 0, 1, 0.8901961, 1,
-0.0744547, -1.175026, -3.942014, 0, 1, 0.8980392, 1,
-0.06847797, -1.279152, -3.85576, 0, 1, 0.9058824, 1,
-0.06546658, 0.5272429, -1.908534, 0, 1, 0.9098039, 1,
-0.06459192, -0.1198567, -2.737746, 0, 1, 0.9176471, 1,
-0.06449251, 0.003956291, -1.200742, 0, 1, 0.9215686, 1,
-0.06160266, -1.339998, -4.60854, 0, 1, 0.9294118, 1,
-0.06122879, -1.857498, -2.936369, 0, 1, 0.9333333, 1,
-0.06020501, -0.1013312, -2.034276, 0, 1, 0.9411765, 1,
-0.0581758, -1.272543, -3.280412, 0, 1, 0.945098, 1,
-0.05713523, 0.3526749, 0.4607513, 0, 1, 0.9529412, 1,
-0.05455905, -0.9495152, -4.979469, 0, 1, 0.9568627, 1,
-0.05180159, 0.6005288, 0.320704, 0, 1, 0.9647059, 1,
-0.04780073, 0.0632686, -1.920612, 0, 1, 0.9686275, 1,
-0.04450971, -0.05209342, -2.330563, 0, 1, 0.9764706, 1,
-0.04370976, -0.963713, -2.85021, 0, 1, 0.9803922, 1,
-0.03920052, -1.070724, -1.763045, 0, 1, 0.9882353, 1,
-0.03779642, -0.3819316, -1.824817, 0, 1, 0.9921569, 1,
-0.03694595, 0.08416022, -2.356099, 0, 1, 1, 1,
-0.03663271, 1.009907, -0.2087078, 0, 0.9921569, 1, 1,
-0.03440565, 0.3080133, 0.6575403, 0, 0.9882353, 1, 1,
-0.03260709, 0.3539773, 1.607091, 0, 0.9803922, 1, 1,
-0.03024595, 1.559014, -0.6205177, 0, 0.9764706, 1, 1,
-0.02848865, -0.6979618, -3.679515, 0, 0.9686275, 1, 1,
-0.02529225, 1.74035, -0.2686545, 0, 0.9647059, 1, 1,
-0.02289322, 1.191217, -0.2616568, 0, 0.9568627, 1, 1,
-0.01485917, -0.5109439, -3.321953, 0, 0.9529412, 1, 1,
-0.01190957, 2.270848, 0.3531188, 0, 0.945098, 1, 1,
-0.01186298, 1.282914, 0.5061718, 0, 0.9411765, 1, 1,
-0.01132354, 0.9294787, -0.6132935, 0, 0.9333333, 1, 1,
-0.004420913, -0.7984575, -3.419935, 0, 0.9294118, 1, 1,
-0.003856891, 0.1098635, -0.7093606, 0, 0.9215686, 1, 1,
0.004708581, 0.1723237, -0.4446482, 0, 0.9176471, 1, 1,
0.008196341, 1.678797, -1.878257, 0, 0.9098039, 1, 1,
0.01104947, 1.046866, -0.7403407, 0, 0.9058824, 1, 1,
0.01524991, -1.983525, 5.16268, 0, 0.8980392, 1, 1,
0.02364082, -0.2432952, 4.036617, 0, 0.8901961, 1, 1,
0.02452679, -0.3296368, 3.591554, 0, 0.8862745, 1, 1,
0.02525062, 1.548839, -1.148776, 0, 0.8784314, 1, 1,
0.02643264, -1.429883, 3.583471, 0, 0.8745098, 1, 1,
0.02957869, 0.8315158, 0.764007, 0, 0.8666667, 1, 1,
0.03085841, 0.09354383, 1.687203, 0, 0.8627451, 1, 1,
0.03313053, 0.3501079, -0.8319538, 0, 0.854902, 1, 1,
0.03357787, 0.3036343, 0.8268067, 0, 0.8509804, 1, 1,
0.04297339, 0.3977626, 1.173047, 0, 0.8431373, 1, 1,
0.04884949, -0.5828598, 3.751581, 0, 0.8392157, 1, 1,
0.05029174, -1.474393, 3.670742, 0, 0.8313726, 1, 1,
0.05453822, 1.306756, 1.351461, 0, 0.827451, 1, 1,
0.05520444, -0.2190594, 2.557163, 0, 0.8196079, 1, 1,
0.05561329, 1.082105, -0.635217, 0, 0.8156863, 1, 1,
0.05641917, 2.517477, 0.3198594, 0, 0.8078431, 1, 1,
0.05673007, 0.3847357, 1.238449, 0, 0.8039216, 1, 1,
0.06357754, -1.864492, 4.063214, 0, 0.7960784, 1, 1,
0.06498178, -0.2478163, 1.004989, 0, 0.7882353, 1, 1,
0.0692278, 1.336494, 2.155489, 0, 0.7843137, 1, 1,
0.07673285, -1.721816, 2.259129, 0, 0.7764706, 1, 1,
0.07992801, -0.2745264, 3.626547, 0, 0.772549, 1, 1,
0.0809012, -0.2592009, 3.412345, 0, 0.7647059, 1, 1,
0.08181392, 0.4302673, 1.487567, 0, 0.7607843, 1, 1,
0.08424224, 0.2865625, -0.4311204, 0, 0.7529412, 1, 1,
0.08683696, 0.5859694, 1.270264, 0, 0.7490196, 1, 1,
0.09665968, -0.497095, 1.365994, 0, 0.7411765, 1, 1,
0.1000853, 1.304038, -0.2854828, 0, 0.7372549, 1, 1,
0.1001582, -0.8939706, 1.739479, 0, 0.7294118, 1, 1,
0.1023614, -0.4599945, 3.679053, 0, 0.7254902, 1, 1,
0.103596, 0.1487058, -0.09990704, 0, 0.7176471, 1, 1,
0.1042706, 0.7134371, 1.80837, 0, 0.7137255, 1, 1,
0.107323, 0.4729511, -1.20792, 0, 0.7058824, 1, 1,
0.1085576, 0.3912476, -0.6884775, 0, 0.6980392, 1, 1,
0.1098251, 0.6474489, -2.215669, 0, 0.6941177, 1, 1,
0.1140088, -0.450969, 4.810117, 0, 0.6862745, 1, 1,
0.1163978, 0.01153152, -0.5804891, 0, 0.682353, 1, 1,
0.1177085, 0.415981, 1.226348, 0, 0.6745098, 1, 1,
0.1191094, 0.1476484, -0.06523799, 0, 0.6705883, 1, 1,
0.119718, 0.6221041, 0.4071071, 0, 0.6627451, 1, 1,
0.1216077, 0.09586403, -0.7252596, 0, 0.6588235, 1, 1,
0.1235577, -1.60097, 3.759674, 0, 0.6509804, 1, 1,
0.1296061, 0.04373891, 1.413254, 0, 0.6470588, 1, 1,
0.1298166, -1.518288, 2.080497, 0, 0.6392157, 1, 1,
0.1318073, -0.5473231, 3.498701, 0, 0.6352941, 1, 1,
0.1329107, -0.1979453, 2.34651, 0, 0.627451, 1, 1,
0.1365988, -0.1747695, 2.803949, 0, 0.6235294, 1, 1,
0.1379474, -0.4943613, 1.994145, 0, 0.6156863, 1, 1,
0.1396768, 0.9155599, 0.1831792, 0, 0.6117647, 1, 1,
0.1485943, 0.1590005, 0.7757316, 0, 0.6039216, 1, 1,
0.1489547, 0.594259, -0.8172405, 0, 0.5960785, 1, 1,
0.1546313, 1.536076, 0.8102757, 0, 0.5921569, 1, 1,
0.1551691, 0.9059377, 0.3620788, 0, 0.5843138, 1, 1,
0.1569216, 0.8178972, 1.459904, 0, 0.5803922, 1, 1,
0.1577205, -1.42078, 3.243552, 0, 0.572549, 1, 1,
0.1591278, -0.2257891, 2.252863, 0, 0.5686275, 1, 1,
0.1594042, -0.7542375, 3.440019, 0, 0.5607843, 1, 1,
0.1647277, 2.80644, 0.1180752, 0, 0.5568628, 1, 1,
0.1663456, 0.2323765, 2.023375, 0, 0.5490196, 1, 1,
0.17282, 1.02172, -0.6930518, 0, 0.5450981, 1, 1,
0.1737922, -1.823109, 4.843709, 0, 0.5372549, 1, 1,
0.177213, 0.9970061, 1.410301, 0, 0.5333334, 1, 1,
0.1824996, 0.02188516, -0.4108763, 0, 0.5254902, 1, 1,
0.1845149, -0.8509553, 4.15861, 0, 0.5215687, 1, 1,
0.1848283, 0.5449125, -1.345241, 0, 0.5137255, 1, 1,
0.1875912, -1.129593, 2.482439, 0, 0.509804, 1, 1,
0.1898488, -1.994303, 1.834401, 0, 0.5019608, 1, 1,
0.1913128, -0.4228835, 2.064137, 0, 0.4941176, 1, 1,
0.1965439, -1.092234, 1.258387, 0, 0.4901961, 1, 1,
0.1975249, -0.1435133, 2.608836, 0, 0.4823529, 1, 1,
0.2014641, 0.097169, 1.679366, 0, 0.4784314, 1, 1,
0.2025542, 0.2540939, 0.4697982, 0, 0.4705882, 1, 1,
0.204164, 0.1020906, 0.6847588, 0, 0.4666667, 1, 1,
0.207723, 0.970056, 0.8864002, 0, 0.4588235, 1, 1,
0.2096918, 0.05695977, 2.193443, 0, 0.454902, 1, 1,
0.2204447, -0.9499039, 2.399853, 0, 0.4470588, 1, 1,
0.2256317, -0.5144117, 0.5619261, 0, 0.4431373, 1, 1,
0.2258352, 1.318766, 0.11181, 0, 0.4352941, 1, 1,
0.2288896, 0.9814861, 0.6060524, 0, 0.4313726, 1, 1,
0.2304255, 1.322038, -0.415295, 0, 0.4235294, 1, 1,
0.2320957, -0.7011063, 2.649244, 0, 0.4196078, 1, 1,
0.2343397, 0.5544685, -0.01110383, 0, 0.4117647, 1, 1,
0.2349082, 1.06028, 0.9017612, 0, 0.4078431, 1, 1,
0.2350844, 1.785452, 0.5226023, 0, 0.4, 1, 1,
0.2385959, -0.627614, 3.270798, 0, 0.3921569, 1, 1,
0.2401131, -1.480826, 2.267823, 0, 0.3882353, 1, 1,
0.2425058, 1.233714, 0.7336871, 0, 0.3803922, 1, 1,
0.2453773, -0.8233324, 1.123046, 0, 0.3764706, 1, 1,
0.2487808, 0.4394805, 0.2707978, 0, 0.3686275, 1, 1,
0.2498194, -0.5300055, 3.014178, 0, 0.3647059, 1, 1,
0.2525768, 0.1304709, -0.2047797, 0, 0.3568628, 1, 1,
0.2539837, -0.1813227, 1.486181, 0, 0.3529412, 1, 1,
0.2554454, -0.1563395, 1.467347, 0, 0.345098, 1, 1,
0.256401, 1.305313, -1.09731, 0, 0.3411765, 1, 1,
0.2572497, -0.6062774, 2.769936, 0, 0.3333333, 1, 1,
0.2575363, -1.371428, 3.261204, 0, 0.3294118, 1, 1,
0.2579118, -0.381676, 4.272308, 0, 0.3215686, 1, 1,
0.2695512, -2.164502, 3.904756, 0, 0.3176471, 1, 1,
0.2697375, -0.02094303, 1.81103, 0, 0.3098039, 1, 1,
0.2705701, -0.1946602, 0.758326, 0, 0.3058824, 1, 1,
0.2709431, -1.162286, 3.176999, 0, 0.2980392, 1, 1,
0.2720605, -1.624844, 2.392813, 0, 0.2901961, 1, 1,
0.2733566, -0.2948189, 3.013393, 0, 0.2862745, 1, 1,
0.2740636, -0.2299906, 2.702783, 0, 0.2784314, 1, 1,
0.2748175, -0.6740373, 3.199569, 0, 0.2745098, 1, 1,
0.2863639, -0.3414214, 4.030105, 0, 0.2666667, 1, 1,
0.2883447, -0.1627045, 2.093476, 0, 0.2627451, 1, 1,
0.3009136, 0.1622756, 2.203314, 0, 0.254902, 1, 1,
0.3027036, 0.0553898, 0.8742371, 0, 0.2509804, 1, 1,
0.3092494, 0.009123152, -0.03052347, 0, 0.2431373, 1, 1,
0.3103204, -0.1975816, 3.193896, 0, 0.2392157, 1, 1,
0.3108057, -1.207414, 3.423999, 0, 0.2313726, 1, 1,
0.3176771, 0.09450232, 0.2129152, 0, 0.227451, 1, 1,
0.3224111, 0.162629, 0.3569774, 0, 0.2196078, 1, 1,
0.3234905, -0.4778048, 3.925, 0, 0.2156863, 1, 1,
0.3255719, 1.17855, 0.6284894, 0, 0.2078431, 1, 1,
0.3272755, 0.01342094, 2.540873, 0, 0.2039216, 1, 1,
0.3306789, 0.9583147, 1.062614, 0, 0.1960784, 1, 1,
0.3327307, 0.2624671, 0.6530537, 0, 0.1882353, 1, 1,
0.3379431, 1.462887, -1.946571, 0, 0.1843137, 1, 1,
0.3408095, -1.122705, 4.494482, 0, 0.1764706, 1, 1,
0.3437181, -1.40997, 2.379903, 0, 0.172549, 1, 1,
0.3472807, -1.577455, 2.139881, 0, 0.1647059, 1, 1,
0.3480006, 1.054814, 0.3058442, 0, 0.1607843, 1, 1,
0.3518617, -0.1382135, 1.488242, 0, 0.1529412, 1, 1,
0.3573429, 0.3952012, 0.9886923, 0, 0.1490196, 1, 1,
0.3582521, -0.09843027, 0.6712095, 0, 0.1411765, 1, 1,
0.3620631, -0.8746039, 3.376987, 0, 0.1372549, 1, 1,
0.3628359, 1.036277, 1.062955, 0, 0.1294118, 1, 1,
0.3632723, 1.168189, -0.8142623, 0, 0.1254902, 1, 1,
0.3705283, 1.679357, -1.014617, 0, 0.1176471, 1, 1,
0.3712023, -0.01469044, 0.3876362, 0, 0.1137255, 1, 1,
0.3780105, 1.639501, -0.1935837, 0, 0.1058824, 1, 1,
0.3843975, -0.691571, 3.301581, 0, 0.09803922, 1, 1,
0.3854032, 0.9557053, 1.048658, 0, 0.09411765, 1, 1,
0.386275, 0.2942079, 1.473997, 0, 0.08627451, 1, 1,
0.3897921, -1.190288, 1.925031, 0, 0.08235294, 1, 1,
0.3923035, -0.6011986, 3.709255, 0, 0.07450981, 1, 1,
0.3962884, -1.040513, 2.148497, 0, 0.07058824, 1, 1,
0.4033644, -0.7946579, 1.552546, 0, 0.0627451, 1, 1,
0.4049768, 1.300753, 0.8222568, 0, 0.05882353, 1, 1,
0.4050958, -0.3724813, 2.477128, 0, 0.05098039, 1, 1,
0.4057758, 0.2775655, -0.07656397, 0, 0.04705882, 1, 1,
0.4070797, -0.8054726, 2.082001, 0, 0.03921569, 1, 1,
0.4077312, -1.855301, 1.220984, 0, 0.03529412, 1, 1,
0.4101571, 0.9928114, 0.7323638, 0, 0.02745098, 1, 1,
0.4193124, -1.740335, 3.400976, 0, 0.02352941, 1, 1,
0.4214571, 0.6405963, 1.337535, 0, 0.01568628, 1, 1,
0.4219058, -0.1888514, 3.044778, 0, 0.01176471, 1, 1,
0.4230805, -1.972705, 3.200145, 0, 0.003921569, 1, 1,
0.4235791, 0.2171808, 1.07867, 0.003921569, 0, 1, 1,
0.4250319, -1.168076, 3.269358, 0.007843138, 0, 1, 1,
0.4253926, 0.9521117, 1.087578, 0.01568628, 0, 1, 1,
0.4281449, -1.688129, 2.071458, 0.01960784, 0, 1, 1,
0.4303843, 0.1870913, 0.7208262, 0.02745098, 0, 1, 1,
0.4323625, -0.7471154, 3.070731, 0.03137255, 0, 1, 1,
0.4323804, -0.2751201, 2.540861, 0.03921569, 0, 1, 1,
0.4338883, -0.6563545, 2.350709, 0.04313726, 0, 1, 1,
0.4341513, -0.7982947, 1.990759, 0.05098039, 0, 1, 1,
0.4362626, 0.5599008, 0.8471583, 0.05490196, 0, 1, 1,
0.4374462, 1.583394, -0.09640997, 0.0627451, 0, 1, 1,
0.4393651, 1.102031, -1.206782, 0.06666667, 0, 1, 1,
0.4406424, -0.3025974, 2.691306, 0.07450981, 0, 1, 1,
0.4409513, -0.7261019, 3.515103, 0.07843138, 0, 1, 1,
0.443695, 0.9415028, -0.3871045, 0.08627451, 0, 1, 1,
0.4460362, 0.871967, -1.022291, 0.09019608, 0, 1, 1,
0.446327, -1.266857, 0.5859093, 0.09803922, 0, 1, 1,
0.4474288, -0.8687472, 1.385543, 0.1058824, 0, 1, 1,
0.451585, -1.542274, 1.291995, 0.1098039, 0, 1, 1,
0.4518095, -0.8572945, 3.243677, 0.1176471, 0, 1, 1,
0.4550289, -0.9584417, 2.530377, 0.1215686, 0, 1, 1,
0.4555981, 0.07057886, 1.295939, 0.1294118, 0, 1, 1,
0.4569302, -0.8531537, 3.709021, 0.1333333, 0, 1, 1,
0.4574134, -0.2554106, 2.954186, 0.1411765, 0, 1, 1,
0.4610428, 0.5837831, 1.351255, 0.145098, 0, 1, 1,
0.4636978, 0.3808875, 1.763965, 0.1529412, 0, 1, 1,
0.4678784, 2.456509, 0.3677507, 0.1568628, 0, 1, 1,
0.4802412, 0.730448, 0.6249538, 0.1647059, 0, 1, 1,
0.4825733, -0.4266808, 1.046929, 0.1686275, 0, 1, 1,
0.4846853, -0.8277146, 1.50288, 0.1764706, 0, 1, 1,
0.4877757, 0.7715678, 0.06982801, 0.1803922, 0, 1, 1,
0.489054, -0.3212766, 2.182456, 0.1882353, 0, 1, 1,
0.490061, -0.6649513, 1.415917, 0.1921569, 0, 1, 1,
0.4915479, 0.8935424, 1.596222, 0.2, 0, 1, 1,
0.4947625, -1.395016, 1.598629, 0.2078431, 0, 1, 1,
0.4949994, 0.2826607, 0.2738209, 0.2117647, 0, 1, 1,
0.4984262, 0.7692791, 1.028593, 0.2196078, 0, 1, 1,
0.5032758, -1.290673, 2.494199, 0.2235294, 0, 1, 1,
0.5042151, -1.3214, 1.939013, 0.2313726, 0, 1, 1,
0.504746, -0.2490656, 2.012597, 0.2352941, 0, 1, 1,
0.508047, 0.3766306, -0.1068883, 0.2431373, 0, 1, 1,
0.5086871, -0.1985514, 0.9873309, 0.2470588, 0, 1, 1,
0.5089175, -0.4088162, 2.982657, 0.254902, 0, 1, 1,
0.5110344, 2.494505, 0.1064068, 0.2588235, 0, 1, 1,
0.5142605, -0.8374725, 2.556705, 0.2666667, 0, 1, 1,
0.5143555, -0.591468, 2.797818, 0.2705882, 0, 1, 1,
0.514969, 0.757886, 0.9859014, 0.2784314, 0, 1, 1,
0.5164011, -1.682123, 3.488809, 0.282353, 0, 1, 1,
0.5229256, -1.84009, 2.482951, 0.2901961, 0, 1, 1,
0.5301263, -1.569099, 0.6935328, 0.2941177, 0, 1, 1,
0.5310046, -1.273182, 3.588398, 0.3019608, 0, 1, 1,
0.5361127, -0.4634356, 3.809464, 0.3098039, 0, 1, 1,
0.5368789, -0.1627326, 2.491237, 0.3137255, 0, 1, 1,
0.5429752, 2.781215, -0.4175438, 0.3215686, 0, 1, 1,
0.5471002, 0.2174528, 1.042295, 0.3254902, 0, 1, 1,
0.5488005, 0.9670901, 2.806424, 0.3333333, 0, 1, 1,
0.5519048, 0.1830665, 2.254092, 0.3372549, 0, 1, 1,
0.5523466, 0.557961, 1.421453, 0.345098, 0, 1, 1,
0.5535638, -1.617376, 3.63102, 0.3490196, 0, 1, 1,
0.5603391, 0.5552536, -0.3445134, 0.3568628, 0, 1, 1,
0.5630216, 0.147908, 0.68317, 0.3607843, 0, 1, 1,
0.568315, -0.0794065, 1.01408, 0.3686275, 0, 1, 1,
0.5705818, 0.0900462, 0.6945559, 0.372549, 0, 1, 1,
0.5714923, -0.726428, 2.034975, 0.3803922, 0, 1, 1,
0.5774645, -1.754169, 3.504735, 0.3843137, 0, 1, 1,
0.5795625, 0.4842168, -0.9093053, 0.3921569, 0, 1, 1,
0.5798943, 1.433066, -0.52991, 0.3960784, 0, 1, 1,
0.5809408, -0.1552945, 1.609116, 0.4039216, 0, 1, 1,
0.5830904, -1.133343, 3.387647, 0.4117647, 0, 1, 1,
0.5836861, -2.724998, 3.469352, 0.4156863, 0, 1, 1,
0.5898878, -1.864316, 3.05454, 0.4235294, 0, 1, 1,
0.5905756, 0.3023857, 1.162424, 0.427451, 0, 1, 1,
0.5906436, 0.9481273, -0.7002184, 0.4352941, 0, 1, 1,
0.5918104, 0.9085788, -1.121161, 0.4392157, 0, 1, 1,
0.5931957, -0.1150686, 1.63351, 0.4470588, 0, 1, 1,
0.5955053, -0.1624149, 2.480922, 0.4509804, 0, 1, 1,
0.5969676, 0.2122904, 1.356954, 0.4588235, 0, 1, 1,
0.5980139, 0.04444322, 0.7559756, 0.4627451, 0, 1, 1,
0.5984129, -0.05715968, 2.855158, 0.4705882, 0, 1, 1,
0.6018317, 0.4399609, 0.7569339, 0.4745098, 0, 1, 1,
0.6042085, -1.06216, 1.753914, 0.4823529, 0, 1, 1,
0.6057825, 0.6466541, 0.6857512, 0.4862745, 0, 1, 1,
0.6080534, 2.319761, 0.4980845, 0.4941176, 0, 1, 1,
0.6080819, -0.1926002, 1.552514, 0.5019608, 0, 1, 1,
0.6097657, 0.801556, 1.78018, 0.5058824, 0, 1, 1,
0.6177067, -0.8424925, 2.779455, 0.5137255, 0, 1, 1,
0.6226093, -1.281973, 2.695248, 0.5176471, 0, 1, 1,
0.6230379, 0.7757279, 1.199222, 0.5254902, 0, 1, 1,
0.6275336, -1.029251, 2.312304, 0.5294118, 0, 1, 1,
0.6371759, 0.4654596, 1.375608, 0.5372549, 0, 1, 1,
0.6383269, 1.88051, 0.7638392, 0.5411765, 0, 1, 1,
0.6408399, -0.3610005, 1.922122, 0.5490196, 0, 1, 1,
0.6429473, -2.150878, 0.9680182, 0.5529412, 0, 1, 1,
0.6464468, 0.06742062, 0.6201354, 0.5607843, 0, 1, 1,
0.657903, 2.474992, 0.4834223, 0.5647059, 0, 1, 1,
0.6651971, 0.319198, 1.285628, 0.572549, 0, 1, 1,
0.6685072, -2.021006, 5.238076, 0.5764706, 0, 1, 1,
0.6712571, -0.5447677, 2.560277, 0.5843138, 0, 1, 1,
0.673994, 1.17942, -0.4440168, 0.5882353, 0, 1, 1,
0.6769078, 0.5317544, 1.145741, 0.5960785, 0, 1, 1,
0.6804693, -1.29325, 2.968015, 0.6039216, 0, 1, 1,
0.6838807, 1.139902, -1.163687, 0.6078432, 0, 1, 1,
0.6871923, 0.5167202, 0.9444739, 0.6156863, 0, 1, 1,
0.6938835, -0.6508492, 3.363254, 0.6196079, 0, 1, 1,
0.7069085, -0.834873, 1.332292, 0.627451, 0, 1, 1,
0.7072668, 0.8897594, 0.4883409, 0.6313726, 0, 1, 1,
0.7080242, -0.4513534, 1.993905, 0.6392157, 0, 1, 1,
0.7097287, -0.001226202, 1.150719, 0.6431373, 0, 1, 1,
0.7123788, -0.3347751, 2.644338, 0.6509804, 0, 1, 1,
0.7297741, 0.1339823, 0.4563796, 0.654902, 0, 1, 1,
0.7446734, -0.1257248, 0.5018339, 0.6627451, 0, 1, 1,
0.7466059, 0.8814195, -0.6896637, 0.6666667, 0, 1, 1,
0.7485338, -0.7460357, 1.963694, 0.6745098, 0, 1, 1,
0.7526426, 0.2515772, 1.991239, 0.6784314, 0, 1, 1,
0.7536756, 1.34376, 0.8035583, 0.6862745, 0, 1, 1,
0.7584379, 1.226151, 1.858999, 0.6901961, 0, 1, 1,
0.7591125, -0.3512132, 2.246123, 0.6980392, 0, 1, 1,
0.7640593, 0.131336, 1.311758, 0.7058824, 0, 1, 1,
0.7704449, 0.2742801, 0.1033758, 0.7098039, 0, 1, 1,
0.7811642, 0.1371373, 0.8522676, 0.7176471, 0, 1, 1,
0.7813612, -1.021878, 3.207813, 0.7215686, 0, 1, 1,
0.7903433, 0.2417942, 1.816683, 0.7294118, 0, 1, 1,
0.7919345, 0.4765077, 1.223774, 0.7333333, 0, 1, 1,
0.7936367, 0.1585897, -0.07018383, 0.7411765, 0, 1, 1,
0.8018259, 0.2416745, 1.853575, 0.7450981, 0, 1, 1,
0.8041391, 1.142494, 1.0118, 0.7529412, 0, 1, 1,
0.8093609, -0.8243644, 2.352916, 0.7568628, 0, 1, 1,
0.8113567, -0.1128135, 1.573394, 0.7647059, 0, 1, 1,
0.8135415, 0.5852197, 3.298335, 0.7686275, 0, 1, 1,
0.8146542, -0.0797016, 2.909406, 0.7764706, 0, 1, 1,
0.8148905, -0.1710849, 1.88851, 0.7803922, 0, 1, 1,
0.8249978, -0.4107387, 2.762496, 0.7882353, 0, 1, 1,
0.825607, -0.7389371, 1.971989, 0.7921569, 0, 1, 1,
0.8287737, 0.08929369, 2.838164, 0.8, 0, 1, 1,
0.829174, -0.3803424, 2.339391, 0.8078431, 0, 1, 1,
0.8310186, -1.267917, 2.96328, 0.8117647, 0, 1, 1,
0.8326921, 0.6318042, 0.30877, 0.8196079, 0, 1, 1,
0.8355302, -0.2278664, 1.275185, 0.8235294, 0, 1, 1,
0.8360547, -0.161468, 4.692904, 0.8313726, 0, 1, 1,
0.8397621, 1.250045, -0.9028648, 0.8352941, 0, 1, 1,
0.8406477, -1.59971, 2.826855, 0.8431373, 0, 1, 1,
0.8445981, 1.414356, 2.897866, 0.8470588, 0, 1, 1,
0.8472335, -0.1798075, 1.787229, 0.854902, 0, 1, 1,
0.8481432, -0.9819509, 3.662887, 0.8588235, 0, 1, 1,
0.8580162, 0.4618641, 0.5553759, 0.8666667, 0, 1, 1,
0.8598703, -0.4043888, -0.09063615, 0.8705882, 0, 1, 1,
0.8603849, 0.5041817, 2.143871, 0.8784314, 0, 1, 1,
0.8632648, -0.1805426, 3.308412, 0.8823529, 0, 1, 1,
0.8667167, 0.6823395, 1.413512, 0.8901961, 0, 1, 1,
0.8730068, -0.2318932, 0.959232, 0.8941177, 0, 1, 1,
0.8862829, -0.8536402, -0.8169111, 0.9019608, 0, 1, 1,
0.8875545, 1.747905, -0.3589377, 0.9098039, 0, 1, 1,
0.8892462, 1.153123, -0.3374978, 0.9137255, 0, 1, 1,
0.891519, -0.5555735, 2.323009, 0.9215686, 0, 1, 1,
0.8959296, 0.2147004, 0.3077011, 0.9254902, 0, 1, 1,
0.8989914, 1.158514, 1.576753, 0.9333333, 0, 1, 1,
0.9051772, 0.700996, 0.7062606, 0.9372549, 0, 1, 1,
0.9076772, 1.448249, -0.5280637, 0.945098, 0, 1, 1,
0.9306206, 1.078754, 1.685615, 0.9490196, 0, 1, 1,
0.9351642, 0.400269, 1.193318, 0.9568627, 0, 1, 1,
0.9355143, 0.5279769, 1.86053, 0.9607843, 0, 1, 1,
0.9375896, -1.258021, 1.410662, 0.9686275, 0, 1, 1,
0.9381469, -0.5557684, 0.9073008, 0.972549, 0, 1, 1,
0.9383481, 0.3486018, 1.845448, 0.9803922, 0, 1, 1,
0.9392515, 0.5262639, -0.5110397, 0.9843137, 0, 1, 1,
0.9410275, 0.00799466, 3.437796, 0.9921569, 0, 1, 1,
0.9476767, 0.6940978, 0.3752036, 0.9960784, 0, 1, 1,
0.9579053, 0.848394, 0.3728347, 1, 0, 0.9960784, 1,
0.9581582, -0.5363805, 3.252963, 1, 0, 0.9882353, 1,
0.9594688, -2.130436, 4.869728, 1, 0, 0.9843137, 1,
0.9648597, -1.845717, 3.824503, 1, 0, 0.9764706, 1,
0.973801, 0.5478432, -0.2038976, 1, 0, 0.972549, 1,
0.9793231, 2.954839, -0.05722442, 1, 0, 0.9647059, 1,
0.9807891, 0.7701972, 1.441456, 1, 0, 0.9607843, 1,
0.9827661, 0.5531922, 0.5154538, 1, 0, 0.9529412, 1,
0.9872374, 0.7784664, 1.683378, 1, 0, 0.9490196, 1,
1.00296, 0.6147442, 1.895435, 1, 0, 0.9411765, 1,
1.003077, 1.638261, -0.1770493, 1, 0, 0.9372549, 1,
1.009315, -2.005263, 1.031286, 1, 0, 0.9294118, 1,
1.014595, -1.123376, 3.763946, 1, 0, 0.9254902, 1,
1.021557, 0.9238045, 0.2999787, 1, 0, 0.9176471, 1,
1.024284, 2.398101, 2.850693, 1, 0, 0.9137255, 1,
1.025111, 0.106362, 1.896905, 1, 0, 0.9058824, 1,
1.038267, 2.028689, 0.3160291, 1, 0, 0.9019608, 1,
1.041185, -0.1062733, 3.647295, 1, 0, 0.8941177, 1,
1.04364, -1.178623, 3.631653, 1, 0, 0.8862745, 1,
1.051373, -0.6120151, 0.8554023, 1, 0, 0.8823529, 1,
1.06308, 1.106012, 1.247288, 1, 0, 0.8745098, 1,
1.06686, 0.8218281, 2.696951, 1, 0, 0.8705882, 1,
1.072427, 0.5193783, 0.4249392, 1, 0, 0.8627451, 1,
1.078757, 0.3226663, 0.2879103, 1, 0, 0.8588235, 1,
1.080795, 1.067452, 0.7221227, 1, 0, 0.8509804, 1,
1.082618, 0.5654886, -0.03747854, 1, 0, 0.8470588, 1,
1.08263, 1.058433, 0.9138477, 1, 0, 0.8392157, 1,
1.08547, 1.56454, 1.384087, 1, 0, 0.8352941, 1,
1.089863, 0.8232409, 1.10517, 1, 0, 0.827451, 1,
1.091825, 0.9020962, 2.633053, 1, 0, 0.8235294, 1,
1.093409, 0.4842151, 0.7590877, 1, 0, 0.8156863, 1,
1.100296, -0.02655323, 2.992944, 1, 0, 0.8117647, 1,
1.105651, 0.2557679, 1.035022, 1, 0, 0.8039216, 1,
1.109584, -0.1543728, -0.01078562, 1, 0, 0.7960784, 1,
1.126937, -2.258206, 3.156083, 1, 0, 0.7921569, 1,
1.128647, 1.196337, 1.928368, 1, 0, 0.7843137, 1,
1.129325, 0.1020907, 1.301133, 1, 0, 0.7803922, 1,
1.132057, -0.8244746, 2.058039, 1, 0, 0.772549, 1,
1.134771, -0.4931709, 1.887708, 1, 0, 0.7686275, 1,
1.136282, -0.4390979, 2.388335, 1, 0, 0.7607843, 1,
1.144546, -0.8282206, 1.097731, 1, 0, 0.7568628, 1,
1.16044, 0.2266672, 3.513215, 1, 0, 0.7490196, 1,
1.175462, 0.8502212, 0.3555457, 1, 0, 0.7450981, 1,
1.175667, 1.0875, 2.709285, 1, 0, 0.7372549, 1,
1.175674, 0.4967298, 0.7587425, 1, 0, 0.7333333, 1,
1.178228, -0.1644719, 1.450494, 1, 0, 0.7254902, 1,
1.181003, 1.257393, 2.286158, 1, 0, 0.7215686, 1,
1.190404, 1.894691, -0.1243677, 1, 0, 0.7137255, 1,
1.191345, -2.103821, 2.966032, 1, 0, 0.7098039, 1,
1.192977, 1.343198, 1.964036, 1, 0, 0.7019608, 1,
1.199711, -0.6236181, 1.768104, 1, 0, 0.6941177, 1,
1.200469, 0.09634218, 0.7210851, 1, 0, 0.6901961, 1,
1.204827, 0.5427164, -0.3762304, 1, 0, 0.682353, 1,
1.209726, -1.18768, 2.453767, 1, 0, 0.6784314, 1,
1.215169, 0.9145719, 0.650785, 1, 0, 0.6705883, 1,
1.215811, -1.806624, 2.532982, 1, 0, 0.6666667, 1,
1.227409, 1.981243, 2.419175, 1, 0, 0.6588235, 1,
1.234559, 0.860697, 1.280061, 1, 0, 0.654902, 1,
1.236672, 2.00476, -0.4363244, 1, 0, 0.6470588, 1,
1.248145, 1.472898, 2.020508, 1, 0, 0.6431373, 1,
1.249135, -1.092384, 2.594501, 1, 0, 0.6352941, 1,
1.256692, 0.429195, 2.321239, 1, 0, 0.6313726, 1,
1.258636, 0.4307138, 2.888142, 1, 0, 0.6235294, 1,
1.273952, 0.3336073, -1.159352, 1, 0, 0.6196079, 1,
1.274384, 0.4860653, 1.108972, 1, 0, 0.6117647, 1,
1.298153, -2.50114, 1.343966, 1, 0, 0.6078432, 1,
1.315488, -0.2979787, 2.094148, 1, 0, 0.6, 1,
1.320917, -0.9368649, 0.3230201, 1, 0, 0.5921569, 1,
1.321507, -0.1515718, 0.283897, 1, 0, 0.5882353, 1,
1.324677, -0.8874444, 1.634649, 1, 0, 0.5803922, 1,
1.326415, -0.368412, -0.09052612, 1, 0, 0.5764706, 1,
1.326995, 1.412087, 1.181921, 1, 0, 0.5686275, 1,
1.32963, -1.104467, 1.491167, 1, 0, 0.5647059, 1,
1.347254, -0.007914573, 0.4012935, 1, 0, 0.5568628, 1,
1.352794, -0.2972329, 2.134434, 1, 0, 0.5529412, 1,
1.365113, 0.4856689, 1.368699, 1, 0, 0.5450981, 1,
1.37074, -0.1082152, 1.529985, 1, 0, 0.5411765, 1,
1.373, 1.321675, 0.2020939, 1, 0, 0.5333334, 1,
1.373095, 0.1570142, 0.4741614, 1, 0, 0.5294118, 1,
1.378181, 1.057842, 1.051898, 1, 0, 0.5215687, 1,
1.392784, 0.08456797, 1.262595, 1, 0, 0.5176471, 1,
1.398343, -1.750844, 1.329274, 1, 0, 0.509804, 1,
1.402582, 1.494004, 1.80007, 1, 0, 0.5058824, 1,
1.422783, -1.965564, 2.70453, 1, 0, 0.4980392, 1,
1.428746, -0.7970225, 3.257615, 1, 0, 0.4901961, 1,
1.430688, 1.496115, 1.22571, 1, 0, 0.4862745, 1,
1.435536, 0.6211583, 1.785314, 1, 0, 0.4784314, 1,
1.43617, 0.6571074, 0.4560641, 1, 0, 0.4745098, 1,
1.437777, 0.3058279, 0.752737, 1, 0, 0.4666667, 1,
1.442882, 1.20026, 1.279147, 1, 0, 0.4627451, 1,
1.456612, -0.9198864, 2.380212, 1, 0, 0.454902, 1,
1.46271, -0.8909602, 0.5337878, 1, 0, 0.4509804, 1,
1.468973, -0.2666789, 2.054188, 1, 0, 0.4431373, 1,
1.476453, -0.6531152, 1.638647, 1, 0, 0.4392157, 1,
1.477492, -0.3675789, 4.04109, 1, 0, 0.4313726, 1,
1.483302, 0.2900352, 1.423559, 1, 0, 0.427451, 1,
1.485173, 1.499619, 0.358723, 1, 0, 0.4196078, 1,
1.488497, -0.4376654, 2.088226, 1, 0, 0.4156863, 1,
1.494701, -0.1616668, 1.776871, 1, 0, 0.4078431, 1,
1.494877, 1.253905, -0.1356289, 1, 0, 0.4039216, 1,
1.495258, -0.6277102, 0.7817543, 1, 0, 0.3960784, 1,
1.504373, 0.4505508, 2.425052, 1, 0, 0.3882353, 1,
1.520776, 0.2536254, 2.170249, 1, 0, 0.3843137, 1,
1.529541, -0.8623255, 2.657171, 1, 0, 0.3764706, 1,
1.530427, 1.372929, 0.6545489, 1, 0, 0.372549, 1,
1.534014, -0.4684512, 1.494648, 1, 0, 0.3647059, 1,
1.546154, 0.1685435, 0.9368555, 1, 0, 0.3607843, 1,
1.558221, 0.6827158, 1.234113, 1, 0, 0.3529412, 1,
1.560232, -0.4743559, 2.079877, 1, 0, 0.3490196, 1,
1.564146, 1.350384, 0.9485064, 1, 0, 0.3411765, 1,
1.573388, -1.005649, 0.2088129, 1, 0, 0.3372549, 1,
1.590698, 0.6195645, 1.966394, 1, 0, 0.3294118, 1,
1.591381, 1.813307, -1.103794, 1, 0, 0.3254902, 1,
1.59171, -1.43177, 2.539542, 1, 0, 0.3176471, 1,
1.613306, 0.9063398, 0.07852354, 1, 0, 0.3137255, 1,
1.614321, -0.8670103, 0.02220115, 1, 0, 0.3058824, 1,
1.623456, 0.7553263, 0.8545628, 1, 0, 0.2980392, 1,
1.660055, 0.4148428, 2.926397, 1, 0, 0.2941177, 1,
1.672441, -0.5578951, 1.429842, 1, 0, 0.2862745, 1,
1.705391, -0.2362362, 3.068018, 1, 0, 0.282353, 1,
1.727507, 0.7378523, 2.787273, 1, 0, 0.2745098, 1,
1.820907, 0.5303854, 0.2728866, 1, 0, 0.2705882, 1,
1.833681, 0.8642533, -0.4957702, 1, 0, 0.2627451, 1,
1.83582, 0.6453944, 2.081852, 1, 0, 0.2588235, 1,
1.836423, -0.771227, 1.474305, 1, 0, 0.2509804, 1,
1.8562, 1.161774, 0.8269669, 1, 0, 0.2470588, 1,
1.856646, -0.1067505, 0.1749943, 1, 0, 0.2392157, 1,
1.861701, 0.9730241, 2.593549, 1, 0, 0.2352941, 1,
1.865971, 0.8991708, 2.762717, 1, 0, 0.227451, 1,
1.871657, 0.2094323, 3.344405, 1, 0, 0.2235294, 1,
1.893586, 0.095766, 1.656289, 1, 0, 0.2156863, 1,
1.910155, -0.1623458, 1.107828, 1, 0, 0.2117647, 1,
1.917036, -0.03892781, 2.526775, 1, 0, 0.2039216, 1,
1.918599, -0.1199061, 2.039611, 1, 0, 0.1960784, 1,
1.92382, 0.001937806, 3.271446, 1, 0, 0.1921569, 1,
1.925921, 0.09132026, 2.174803, 1, 0, 0.1843137, 1,
1.933056, 0.1871509, 2.122242, 1, 0, 0.1803922, 1,
1.955149, -2.692801, 3.423779, 1, 0, 0.172549, 1,
1.96609, 0.314748, 2.319007, 1, 0, 0.1686275, 1,
1.966483, -0.4316208, 1.326463, 1, 0, 0.1607843, 1,
1.968711, 0.7135798, 1.62117, 1, 0, 0.1568628, 1,
1.983812, 0.7928962, -0.4862309, 1, 0, 0.1490196, 1,
2.001378, -0.07889342, 3.685284, 1, 0, 0.145098, 1,
2.03114, -0.4879159, 2.357148, 1, 0, 0.1372549, 1,
2.056254, -1.706182, 0.7564557, 1, 0, 0.1333333, 1,
2.062431, 1.033927, 2.418614, 1, 0, 0.1254902, 1,
2.112424, -2.03665, 1.928277, 1, 0, 0.1215686, 1,
2.185371, 0.7251915, 2.208454, 1, 0, 0.1137255, 1,
2.230675, 0.8819991, 1.994063, 1, 0, 0.1098039, 1,
2.234262, -1.819268, 2.857755, 1, 0, 0.1019608, 1,
2.253548, -0.8939459, 2.26228, 1, 0, 0.09411765, 1,
2.314705, 1.068592, 0.8919299, 1, 0, 0.09019608, 1,
2.363299, 0.1960048, 1.690978, 1, 0, 0.08235294, 1,
2.366308, 0.3152412, 1.957838, 1, 0, 0.07843138, 1,
2.419561, 0.1934039, 1.558355, 1, 0, 0.07058824, 1,
2.42129, 0.4760154, 2.009755, 1, 0, 0.06666667, 1,
2.436416, -2.182421, 2.742978, 1, 0, 0.05882353, 1,
2.502072, 0.238073, 2.456637, 1, 0, 0.05490196, 1,
2.523761, -0.2607393, 2.337494, 1, 0, 0.04705882, 1,
2.637882, 0.9861479, 1.49329, 1, 0, 0.04313726, 1,
2.738122, 0.8321579, 1.368093, 1, 0, 0.03529412, 1,
2.849082, 0.5991908, 1.923051, 1, 0, 0.03137255, 1,
2.963771, -0.1362184, -0.7632705, 1, 0, 0.02352941, 1,
3.113409, -0.7456341, 2.630109, 1, 0, 0.01960784, 1,
3.227403, 2.300054, 1.804217, 1, 0, 0.01176471, 1,
3.451171, 0.1648013, 0.5725918, 1, 0, 0.007843138, 1
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
0.179811, -4.049283, -6.744287, 0, -0.5, 0.5, 0.5,
0.179811, -4.049283, -6.744287, 1, -0.5, 0.5, 0.5,
0.179811, -4.049283, -6.744287, 1, 1.5, 0.5, 0.5,
0.179811, -4.049283, -6.744287, 0, 1.5, 0.5, 0.5
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
-4.20054, -0.03965509, -6.744287, 0, -0.5, 0.5, 0.5,
-4.20054, -0.03965509, -6.744287, 1, -0.5, 0.5, 0.5,
-4.20054, -0.03965509, -6.744287, 1, 1.5, 0.5, 0.5,
-4.20054, -0.03965509, -6.744287, 0, 1.5, 0.5, 0.5
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
-4.20054, -4.049283, 0.1152184, 0, -0.5, 0.5, 0.5,
-4.20054, -4.049283, 0.1152184, 1, -0.5, 0.5, 0.5,
-4.20054, -4.049283, 0.1152184, 1, 1.5, 0.5, 0.5,
-4.20054, -4.049283, 0.1152184, 0, 1.5, 0.5, 0.5
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
-3, -3.123984, -5.161325,
3, -3.123984, -5.161325,
-3, -3.123984, -5.161325,
-3, -3.278201, -5.425152,
-2, -3.123984, -5.161325,
-2, -3.278201, -5.425152,
-1, -3.123984, -5.161325,
-1, -3.278201, -5.425152,
0, -3.123984, -5.161325,
0, -3.278201, -5.425152,
1, -3.123984, -5.161325,
1, -3.278201, -5.425152,
2, -3.123984, -5.161325,
2, -3.278201, -5.425152,
3, -3.123984, -5.161325,
3, -3.278201, -5.425152
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
-3, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
-3, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
-3, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
-3, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
-2, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
-2, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
-2, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
-2, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
-1, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
-1, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
-1, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
-1, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
0, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
0, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
0, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
0, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
1, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
1, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
1, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
1, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
2, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
2, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
2, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
2, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5,
3, -3.586634, -5.952806, 0, -0.5, 0.5, 0.5,
3, -3.586634, -5.952806, 1, -0.5, 0.5, 0.5,
3, -3.586634, -5.952806, 1, 1.5, 0.5, 0.5,
3, -3.586634, -5.952806, 0, 1.5, 0.5, 0.5
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
-3.189689, -3, -5.161325,
-3.189689, 2, -5.161325,
-3.189689, -3, -5.161325,
-3.358165, -3, -5.425152,
-3.189689, -2, -5.161325,
-3.358165, -2, -5.425152,
-3.189689, -1, -5.161325,
-3.358165, -1, -5.425152,
-3.189689, 0, -5.161325,
-3.358165, 0, -5.425152,
-3.189689, 1, -5.161325,
-3.358165, 1, -5.425152,
-3.189689, 2, -5.161325,
-3.358165, 2, -5.425152
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
-3.695115, -3, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, -3, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, -3, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, -3, -5.952806, 0, 1.5, 0.5, 0.5,
-3.695115, -2, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, -2, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, -2, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, -2, -5.952806, 0, 1.5, 0.5, 0.5,
-3.695115, -1, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, -1, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, -1, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, -1, -5.952806, 0, 1.5, 0.5, 0.5,
-3.695115, 0, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, 0, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, 0, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, 0, -5.952806, 0, 1.5, 0.5, 0.5,
-3.695115, 1, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, 1, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, 1, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, 1, -5.952806, 0, 1.5, 0.5, 0.5,
-3.695115, 2, -5.952806, 0, -0.5, 0.5, 0.5,
-3.695115, 2, -5.952806, 1, -0.5, 0.5, 0.5,
-3.695115, 2, -5.952806, 1, 1.5, 0.5, 0.5,
-3.695115, 2, -5.952806, 0, 1.5, 0.5, 0.5
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
-3.189689, -3.123984, -4,
-3.189689, -3.123984, 4,
-3.189689, -3.123984, -4,
-3.358165, -3.278201, -4,
-3.189689, -3.123984, -2,
-3.358165, -3.278201, -2,
-3.189689, -3.123984, 0,
-3.358165, -3.278201, 0,
-3.189689, -3.123984, 2,
-3.358165, -3.278201, 2,
-3.189689, -3.123984, 4,
-3.358165, -3.278201, 4
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
-3.695115, -3.586634, -4, 0, -0.5, 0.5, 0.5,
-3.695115, -3.586634, -4, 1, -0.5, 0.5, 0.5,
-3.695115, -3.586634, -4, 1, 1.5, 0.5, 0.5,
-3.695115, -3.586634, -4, 0, 1.5, 0.5, 0.5,
-3.695115, -3.586634, -2, 0, -0.5, 0.5, 0.5,
-3.695115, -3.586634, -2, 1, -0.5, 0.5, 0.5,
-3.695115, -3.586634, -2, 1, 1.5, 0.5, 0.5,
-3.695115, -3.586634, -2, 0, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 0, 0, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 0, 1, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 0, 1, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 0, 0, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 2, 0, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 2, 1, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 2, 1, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 2, 0, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 4, 0, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 4, 1, -0.5, 0.5, 0.5,
-3.695115, -3.586634, 4, 1, 1.5, 0.5, 0.5,
-3.695115, -3.586634, 4, 0, 1.5, 0.5, 0.5
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
-3.189689, -3.123984, -5.161325,
-3.189689, 3.044674, -5.161325,
-3.189689, -3.123984, 5.391761,
-3.189689, 3.044674, 5.391761,
-3.189689, -3.123984, -5.161325,
-3.189689, -3.123984, 5.391761,
-3.189689, 3.044674, -5.161325,
-3.189689, 3.044674, 5.391761,
-3.189689, -3.123984, -5.161325,
3.549311, -3.123984, -5.161325,
-3.189689, -3.123984, 5.391761,
3.549311, -3.123984, 5.391761,
-3.189689, 3.044674, -5.161325,
3.549311, 3.044674, -5.161325,
-3.189689, 3.044674, 5.391761,
3.549311, 3.044674, 5.391761,
3.549311, -3.123984, -5.161325,
3.549311, 3.044674, -5.161325,
3.549311, -3.123984, 5.391761,
3.549311, 3.044674, 5.391761,
3.549311, -3.123984, -5.161325,
3.549311, -3.123984, 5.391761,
3.549311, 3.044674, -5.161325,
3.549311, 3.044674, 5.391761
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
var radius = 7.453461;
var distance = 33.16129;
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
mvMatrix.translate( -0.179811, 0.03965509, -0.1152184 );
mvMatrix.scale( 1.195849, 1.306415, 0.7636465 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16129);
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


