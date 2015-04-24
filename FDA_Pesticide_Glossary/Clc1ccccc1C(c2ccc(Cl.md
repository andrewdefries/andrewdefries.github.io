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
-3.452359, 0.646938, -1.286564, 1, 0, 0, 1,
-3.393692, 0.6622025, -0.1937589, 1, 0.007843138, 0, 1,
-3.300929, -2.242626, -0.9958644, 1, 0.01176471, 0, 1,
-3.009437, 0.1731104, -1.621905, 1, 0.01960784, 0, 1,
-2.917471, 1.928705, 0.3613048, 1, 0.02352941, 0, 1,
-2.623821, 1.463064, -1.646393, 1, 0.03137255, 0, 1,
-2.569212, -1.395356, -1.580653, 1, 0.03529412, 0, 1,
-2.557893, -0.4479654, -0.7760234, 1, 0.04313726, 0, 1,
-2.522611, 0.7667861, -0.5342717, 1, 0.04705882, 0, 1,
-2.517052, -1.777359, -0.5131326, 1, 0.05490196, 0, 1,
-2.513367, -0.3631183, -2.026548, 1, 0.05882353, 0, 1,
-2.464492, -1.226004, -1.422569, 1, 0.06666667, 0, 1,
-2.338698, -0.8322331, -3.069019, 1, 0.07058824, 0, 1,
-2.249787, -0.8033789, 0.1973839, 1, 0.07843138, 0, 1,
-2.155662, -0.1516113, -3.405521, 1, 0.08235294, 0, 1,
-2.140912, -0.7300514, -2.131337, 1, 0.09019608, 0, 1,
-2.137364, 0.3755168, -1.288049, 1, 0.09411765, 0, 1,
-2.118378, 1.207918, -1.577639, 1, 0.1019608, 0, 1,
-2.106708, 0.5144272, -1.781205, 1, 0.1098039, 0, 1,
-2.08999, -1.275626, -1.704943, 1, 0.1137255, 0, 1,
-2.084511, 0.1687331, -2.487332, 1, 0.1215686, 0, 1,
-2.028772, 0.4490432, -2.48717, 1, 0.1254902, 0, 1,
-2.019819, 0.2854308, -0.6296527, 1, 0.1333333, 0, 1,
-2.011452, 0.2785592, -0.3640043, 1, 0.1372549, 0, 1,
-2.000815, -0.6997495, -2.356708, 1, 0.145098, 0, 1,
-1.994433, -1.204364, -1.500839, 1, 0.1490196, 0, 1,
-1.954322, 0.2233382, -1.70365, 1, 0.1568628, 0, 1,
-1.942617, 0.3013575, -1.408512, 1, 0.1607843, 0, 1,
-1.901512, 1.036983, -1.111851, 1, 0.1686275, 0, 1,
-1.883434, 0.2222803, -2.177468, 1, 0.172549, 0, 1,
-1.881391, 1.024124, -0.791666, 1, 0.1803922, 0, 1,
-1.86584, -0.2767057, -2.005626, 1, 0.1843137, 0, 1,
-1.864739, 0.9185997, -2.635965, 1, 0.1921569, 0, 1,
-1.863871, 0.07816553, -2.000393, 1, 0.1960784, 0, 1,
-1.846753, -0.2597158, -4.4382, 1, 0.2039216, 0, 1,
-1.846737, 0.2838596, -0.3524474, 1, 0.2117647, 0, 1,
-1.845895, -0.09018639, -1.49919, 1, 0.2156863, 0, 1,
-1.82437, 1.068396, -1.556431, 1, 0.2235294, 0, 1,
-1.80102, 0.1288784, -1.948879, 1, 0.227451, 0, 1,
-1.787597, 0.2766946, -1.222184, 1, 0.2352941, 0, 1,
-1.771827, 1.825396, -1.002721, 1, 0.2392157, 0, 1,
-1.760771, 1.947266, 1.00669, 1, 0.2470588, 0, 1,
-1.757971, 0.4823331, -0.8773788, 1, 0.2509804, 0, 1,
-1.735367, 0.2259557, -1.426717, 1, 0.2588235, 0, 1,
-1.721605, -2.349705, -2.916031, 1, 0.2627451, 0, 1,
-1.673866, -1.179538, -2.602321, 1, 0.2705882, 0, 1,
-1.668107, 0.8354516, -1.953569, 1, 0.2745098, 0, 1,
-1.667311, 0.4248015, 0.331848, 1, 0.282353, 0, 1,
-1.660848, -0.04282229, -3.596311, 1, 0.2862745, 0, 1,
-1.657045, -0.1843555, -2.653327, 1, 0.2941177, 0, 1,
-1.656472, 1.162816, 0.2170019, 1, 0.3019608, 0, 1,
-1.653125, 1.636935, -0.4463346, 1, 0.3058824, 0, 1,
-1.648875, -0.01650683, -0.7656444, 1, 0.3137255, 0, 1,
-1.634289, -2.272721, -2.885322, 1, 0.3176471, 0, 1,
-1.630901, 0.7573699, 0.05876859, 1, 0.3254902, 0, 1,
-1.586839, 2.152724, -0.8415601, 1, 0.3294118, 0, 1,
-1.578196, -2.916444, -4.824229, 1, 0.3372549, 0, 1,
-1.574042, 0.8546467, -0.06482644, 1, 0.3411765, 0, 1,
-1.566206, 0.1183911, -1.075056, 1, 0.3490196, 0, 1,
-1.543373, 0.5908516, -0.6714668, 1, 0.3529412, 0, 1,
-1.53368, -0.2197367, -0.7334642, 1, 0.3607843, 0, 1,
-1.532367, 1.128242, -2.058932, 1, 0.3647059, 0, 1,
-1.531793, 0.8324926, -1.191229, 1, 0.372549, 0, 1,
-1.522074, 0.7945381, -1.254284, 1, 0.3764706, 0, 1,
-1.515621, 0.4159377, -2.775464, 1, 0.3843137, 0, 1,
-1.510605, -0.7784959, -1.39278, 1, 0.3882353, 0, 1,
-1.480212, 1.157503, 0.4388461, 1, 0.3960784, 0, 1,
-1.471534, -1.393381, -3.142661, 1, 0.4039216, 0, 1,
-1.470575, 0.6764498, -0.8473455, 1, 0.4078431, 0, 1,
-1.468683, -0.8335733, -2.80176, 1, 0.4156863, 0, 1,
-1.464482, -1.034236, -0.6858352, 1, 0.4196078, 0, 1,
-1.464391, -0.8197425, -2.173379, 1, 0.427451, 0, 1,
-1.461421, 1.737504, -2.055789, 1, 0.4313726, 0, 1,
-1.459255, 1.005833, -0.3282197, 1, 0.4392157, 0, 1,
-1.453993, 0.7572093, -1.055362, 1, 0.4431373, 0, 1,
-1.44077, 0.3711941, -2.030352, 1, 0.4509804, 0, 1,
-1.420174, 0.3119989, -2.371653, 1, 0.454902, 0, 1,
-1.400417, 0.4526166, -2.501502, 1, 0.4627451, 0, 1,
-1.397156, -2.406392, -1.790669, 1, 0.4666667, 0, 1,
-1.393872, -0.9009876, -2.61292, 1, 0.4745098, 0, 1,
-1.391963, -1.256299, -1.961382, 1, 0.4784314, 0, 1,
-1.388651, 1.083031, -1.659466, 1, 0.4862745, 0, 1,
-1.375853, 0.6245395, -0.9449397, 1, 0.4901961, 0, 1,
-1.369262, 0.461616, -0.6627186, 1, 0.4980392, 0, 1,
-1.363464, -0.08709661, 0.6457086, 1, 0.5058824, 0, 1,
-1.346328, -0.1668259, -2.227407, 1, 0.509804, 0, 1,
-1.342361, -2.375809, -3.167241, 1, 0.5176471, 0, 1,
-1.339172, 1.682003, -1.155417, 1, 0.5215687, 0, 1,
-1.33836, 1.954369, 1.139764, 1, 0.5294118, 0, 1,
-1.318504, 0.6869242, -1.138867, 1, 0.5333334, 0, 1,
-1.307827, 1.40519, -1.995674, 1, 0.5411765, 0, 1,
-1.28737, -0.477114, -1.704937, 1, 0.5450981, 0, 1,
-1.281969, 2.348473, 0.6239578, 1, 0.5529412, 0, 1,
-1.279993, 0.7490157, -1.135896, 1, 0.5568628, 0, 1,
-1.276253, -0.6793094, -1.694401, 1, 0.5647059, 0, 1,
-1.272856, 0.4650459, -1.553784, 1, 0.5686275, 0, 1,
-1.269678, 1.463421, -0.3674891, 1, 0.5764706, 0, 1,
-1.261224, -1.101832, -0.2151726, 1, 0.5803922, 0, 1,
-1.259631, -0.5442532, -1.720013, 1, 0.5882353, 0, 1,
-1.249863, 0.1964048, -1.144099, 1, 0.5921569, 0, 1,
-1.245669, 0.004632805, -1.621006, 1, 0.6, 0, 1,
-1.244845, 0.04174854, 0.228381, 1, 0.6078432, 0, 1,
-1.244571, 0.1844934, 0.1439015, 1, 0.6117647, 0, 1,
-1.240945, 0.3827158, -1.039045, 1, 0.6196079, 0, 1,
-1.239919, 0.4406342, -0.5490307, 1, 0.6235294, 0, 1,
-1.237148, 0.01601296, 0.519129, 1, 0.6313726, 0, 1,
-1.232173, -0.9932108, -2.464064, 1, 0.6352941, 0, 1,
-1.23185, 0.7480295, -1.964417, 1, 0.6431373, 0, 1,
-1.229295, 1.387019, -0.9057316, 1, 0.6470588, 0, 1,
-1.219311, -0.5106889, -1.649796, 1, 0.654902, 0, 1,
-1.211836, 0.01586335, -0.7962006, 1, 0.6588235, 0, 1,
-1.208036, -0.7590235, -3.303669, 1, 0.6666667, 0, 1,
-1.1991, -0.8266275, -3.311406, 1, 0.6705883, 0, 1,
-1.197465, 0.7266971, -1.435445, 1, 0.6784314, 0, 1,
-1.185403, 0.5624514, 0.3085363, 1, 0.682353, 0, 1,
-1.183782, -0.5055485, -2.642967, 1, 0.6901961, 0, 1,
-1.177094, 0.1400188, -1.063185, 1, 0.6941177, 0, 1,
-1.173195, -1.436469, -3.76726, 1, 0.7019608, 0, 1,
-1.157955, 0.8157032, -0.6352944, 1, 0.7098039, 0, 1,
-1.148985, 0.2578449, 1.027695, 1, 0.7137255, 0, 1,
-1.146961, 0.9200121, 0.7306967, 1, 0.7215686, 0, 1,
-1.140671, 0.5932166, -1.632134, 1, 0.7254902, 0, 1,
-1.136041, 0.3737201, -0.7775, 1, 0.7333333, 0, 1,
-1.132395, -0.3832165, -1.915266, 1, 0.7372549, 0, 1,
-1.127135, -0.3686581, -1.081925, 1, 0.7450981, 0, 1,
-1.124739, -1.440204, -1.685445, 1, 0.7490196, 0, 1,
-1.123008, -1.076903, -2.86107, 1, 0.7568628, 0, 1,
-1.106241, -0.1374066, -1.630351, 1, 0.7607843, 0, 1,
-1.095979, 0.03309844, -1.42114, 1, 0.7686275, 0, 1,
-1.092141, 1.529134, -1.876433, 1, 0.772549, 0, 1,
-1.091639, 0.03517842, -0.1560461, 1, 0.7803922, 0, 1,
-1.086263, -0.5863991, -1.718629, 1, 0.7843137, 0, 1,
-1.081531, -0.002583256, -2.670749, 1, 0.7921569, 0, 1,
-1.072265, -1.822798, -1.555997, 1, 0.7960784, 0, 1,
-1.07195, -1.099687, -2.497584, 1, 0.8039216, 0, 1,
-1.06423, -1.276858, -3.388231, 1, 0.8117647, 0, 1,
-1.051813, 0.8834399, -0.1367155, 1, 0.8156863, 0, 1,
-1.051251, 1.343413, -1.975214, 1, 0.8235294, 0, 1,
-1.049828, -0.6469201, -2.64647, 1, 0.827451, 0, 1,
-1.046384, -0.2982042, -3.467329, 1, 0.8352941, 0, 1,
-1.039914, -0.3510628, -2.466774, 1, 0.8392157, 0, 1,
-1.028912, 0.3628475, -0.5412605, 1, 0.8470588, 0, 1,
-1.028463, 0.8428109, -1.05004, 1, 0.8509804, 0, 1,
-1.023211, -0.2095603, -3.21083, 1, 0.8588235, 0, 1,
-1.020128, 0.3682126, -0.8076368, 1, 0.8627451, 0, 1,
-1.015328, 0.3367688, -2.764532, 1, 0.8705882, 0, 1,
-1.015188, -1.304031, -3.313556, 1, 0.8745098, 0, 1,
-1.014358, 1.486301, -3.437717, 1, 0.8823529, 0, 1,
-0.9987112, 1.504122, 0.4079968, 1, 0.8862745, 0, 1,
-0.998245, 0.6571093, 0.1305935, 1, 0.8941177, 0, 1,
-0.994517, -0.875729, -2.118038, 1, 0.8980392, 0, 1,
-0.9931654, -0.3358623, -0.5774594, 1, 0.9058824, 0, 1,
-0.9922031, 0.8416159, -0.3292287, 1, 0.9137255, 0, 1,
-0.9833671, 0.1281245, 0.1647802, 1, 0.9176471, 0, 1,
-0.9794663, -0.301746, -2.160699, 1, 0.9254902, 0, 1,
-0.9783979, 1.165342, -0.5115753, 1, 0.9294118, 0, 1,
-0.9767522, -0.2046743, -2.143262, 1, 0.9372549, 0, 1,
-0.976221, -1.015733, -1.874344, 1, 0.9411765, 0, 1,
-0.9754406, 1.019075, 0.1326652, 1, 0.9490196, 0, 1,
-0.9751246, 1.148737, 0.08566073, 1, 0.9529412, 0, 1,
-0.96584, -1.350628, -2.026293, 1, 0.9607843, 0, 1,
-0.9543863, 1.437312, -0.5904367, 1, 0.9647059, 0, 1,
-0.9535328, -0.7439339, -2.109341, 1, 0.972549, 0, 1,
-0.9462014, -0.09393192, -0.9870529, 1, 0.9764706, 0, 1,
-0.9443692, -1.02883, -2.784709, 1, 0.9843137, 0, 1,
-0.9380527, 0.3648956, -1.297272, 1, 0.9882353, 0, 1,
-0.931872, 0.9737159, 1.333541, 1, 0.9960784, 0, 1,
-0.9281586, 0.6483721, -0.4701281, 0.9960784, 1, 0, 1,
-0.9266248, 1.11546, -0.3619312, 0.9921569, 1, 0, 1,
-0.9261026, 1.321239, -0.2933758, 0.9843137, 1, 0, 1,
-0.9252146, -1.295426, -1.999391, 0.9803922, 1, 0, 1,
-0.9156126, -0.6794683, -1.605693, 0.972549, 1, 0, 1,
-0.9111128, 1.017915, -0.465582, 0.9686275, 1, 0, 1,
-0.9035496, 0.158429, -2.115004, 0.9607843, 1, 0, 1,
-0.900894, 0.3824673, -1.587685, 0.9568627, 1, 0, 1,
-0.9008868, 0.6069252, -1.439607, 0.9490196, 1, 0, 1,
-0.8979083, -1.15885, -2.768466, 0.945098, 1, 0, 1,
-0.8903006, 0.7487344, -1.905774, 0.9372549, 1, 0, 1,
-0.8894316, 0.2728203, -1.019428, 0.9333333, 1, 0, 1,
-0.8830507, -1.454694, -2.368397, 0.9254902, 1, 0, 1,
-0.8748734, -1.169346, -1.847209, 0.9215686, 1, 0, 1,
-0.8727118, -0.8883802, -1.436249, 0.9137255, 1, 0, 1,
-0.8706756, 1.821041, 0.3801987, 0.9098039, 1, 0, 1,
-0.8691754, 0.9455481, 0.8930833, 0.9019608, 1, 0, 1,
-0.8682377, -0.6590889, -1.639133, 0.8941177, 1, 0, 1,
-0.8665736, -0.2034243, -4.548598, 0.8901961, 1, 0, 1,
-0.8641741, 1.706585, -1.162523, 0.8823529, 1, 0, 1,
-0.8609876, -1.293507, -2.966229, 0.8784314, 1, 0, 1,
-0.8577375, -0.837872, -2.254708, 0.8705882, 1, 0, 1,
-0.8559816, 1.567932, -0.6010557, 0.8666667, 1, 0, 1,
-0.8544946, 0.1235091, -1.139765, 0.8588235, 1, 0, 1,
-0.8528428, -0.2179307, -0.2578238, 0.854902, 1, 0, 1,
-0.852424, -0.439007, -0.3670717, 0.8470588, 1, 0, 1,
-0.8515452, -1.40297, -2.124266, 0.8431373, 1, 0, 1,
-0.8507563, -1.842384, -2.476238, 0.8352941, 1, 0, 1,
-0.8372577, -1.687507, -3.51013, 0.8313726, 1, 0, 1,
-0.829276, -0.2027098, -2.72197, 0.8235294, 1, 0, 1,
-0.8213683, 2.675293, 1.575931, 0.8196079, 1, 0, 1,
-0.8182293, 0.4534644, -1.829871, 0.8117647, 1, 0, 1,
-0.8178104, 0.08937787, -1.977586, 0.8078431, 1, 0, 1,
-0.8133236, -0.975737, -3.297706, 0.8, 1, 0, 1,
-0.8130704, -0.3132197, -2.499857, 0.7921569, 1, 0, 1,
-0.8091051, 0.8275742, -2.345085, 0.7882353, 1, 0, 1,
-0.8077082, -0.3755559, -4.12813, 0.7803922, 1, 0, 1,
-0.8062319, -0.3599726, -2.081155, 0.7764706, 1, 0, 1,
-0.8050282, 0.09195633, -1.727089, 0.7686275, 1, 0, 1,
-0.7969599, 1.665682, -0.2908599, 0.7647059, 1, 0, 1,
-0.794041, 0.8654514, -0.9049393, 0.7568628, 1, 0, 1,
-0.7874537, -0.05224118, -1.961253, 0.7529412, 1, 0, 1,
-0.7824913, 0.08909176, 0.1880786, 0.7450981, 1, 0, 1,
-0.7707562, 0.03602418, -1.832689, 0.7411765, 1, 0, 1,
-0.7700837, -0.7543851, -1.59417, 0.7333333, 1, 0, 1,
-0.7637196, 0.02446219, -3.739678, 0.7294118, 1, 0, 1,
-0.7541547, 1.540959, 1.845751, 0.7215686, 1, 0, 1,
-0.7505102, 0.7753636, -0.08001817, 0.7176471, 1, 0, 1,
-0.7482771, -1.318515, -2.928917, 0.7098039, 1, 0, 1,
-0.7474944, -0.8848743, -3.135325, 0.7058824, 1, 0, 1,
-0.7325093, -1.932135, -2.50382, 0.6980392, 1, 0, 1,
-0.7300741, -1.01741, -3.693775, 0.6901961, 1, 0, 1,
-0.7296826, -1.30471, -3.293845, 0.6862745, 1, 0, 1,
-0.729531, -0.5754095, -1.831091, 0.6784314, 1, 0, 1,
-0.72712, 1.018064, -1.883639, 0.6745098, 1, 0, 1,
-0.7227432, -1.094298, -2.723991, 0.6666667, 1, 0, 1,
-0.7220849, 1.309718, -0.06601889, 0.6627451, 1, 0, 1,
-0.7188421, -0.2234173, -3.137846, 0.654902, 1, 0, 1,
-0.718111, 1.765734, -0.07909745, 0.6509804, 1, 0, 1,
-0.7180016, -1.352335, -1.296516, 0.6431373, 1, 0, 1,
-0.7172669, 0.7580067, 0.3993686, 0.6392157, 1, 0, 1,
-0.7155223, -0.2518531, -0.6810331, 0.6313726, 1, 0, 1,
-0.7100959, 1.180185, 0.6880068, 0.627451, 1, 0, 1,
-0.7093596, -0.4990155, -1.101225, 0.6196079, 1, 0, 1,
-0.7092469, -0.3380561, -1.899443, 0.6156863, 1, 0, 1,
-0.6999803, -0.3265857, -0.9359856, 0.6078432, 1, 0, 1,
-0.6959724, -1.806021, -1.71981, 0.6039216, 1, 0, 1,
-0.6929404, -1.669068, -2.66565, 0.5960785, 1, 0, 1,
-0.6889493, -1.151079, -1.5728, 0.5882353, 1, 0, 1,
-0.6887036, 0.4639728, -0.4128815, 0.5843138, 1, 0, 1,
-0.6866933, 0.7412179, -0.9502632, 0.5764706, 1, 0, 1,
-0.6830527, 1.269434, -1.058231, 0.572549, 1, 0, 1,
-0.6765903, 0.5734763, -0.6288081, 0.5647059, 1, 0, 1,
-0.675974, 0.160206, -2.132505, 0.5607843, 1, 0, 1,
-0.6747233, -0.5464433, -2.437173, 0.5529412, 1, 0, 1,
-0.6725492, 1.199165, -0.2825319, 0.5490196, 1, 0, 1,
-0.6705825, 1.680348, -1.370862, 0.5411765, 1, 0, 1,
-0.6666397, 0.2043539, -2.346723, 0.5372549, 1, 0, 1,
-0.6651208, 0.07187368, -2.759171, 0.5294118, 1, 0, 1,
-0.6648484, 0.1266475, -1.81862, 0.5254902, 1, 0, 1,
-0.6627736, -0.07362647, -3.341228, 0.5176471, 1, 0, 1,
-0.6609678, -1.094429, -2.072676, 0.5137255, 1, 0, 1,
-0.6587752, 0.1699804, 0.1112268, 0.5058824, 1, 0, 1,
-0.6508945, 1.390445, -0.9976932, 0.5019608, 1, 0, 1,
-0.6495007, 0.1278755, -1.208642, 0.4941176, 1, 0, 1,
-0.6451445, -0.8882361, -2.849475, 0.4862745, 1, 0, 1,
-0.6442228, -0.7271233, -2.140257, 0.4823529, 1, 0, 1,
-0.6430663, -0.1513384, -0.8108593, 0.4745098, 1, 0, 1,
-0.6390035, -0.6703146, -0.9606178, 0.4705882, 1, 0, 1,
-0.6377009, 0.03368211, -0.2232454, 0.4627451, 1, 0, 1,
-0.6356251, 0.7142477, -0.2164949, 0.4588235, 1, 0, 1,
-0.6353111, -1.401664, -1.816892, 0.4509804, 1, 0, 1,
-0.630465, -1.361975, -3.5071, 0.4470588, 1, 0, 1,
-0.6193945, -1.42144, -3.374166, 0.4392157, 1, 0, 1,
-0.6116244, 0.02586039, 0.4684696, 0.4352941, 1, 0, 1,
-0.6115302, 0.6292807, -1.099849, 0.427451, 1, 0, 1,
-0.6077599, 0.5653404, -0.07268119, 0.4235294, 1, 0, 1,
-0.6074482, -0.4071283, -3.462232, 0.4156863, 1, 0, 1,
-0.5939842, -0.09788189, -2.128839, 0.4117647, 1, 0, 1,
-0.5933407, 1.259561, -0.2946543, 0.4039216, 1, 0, 1,
-0.5911723, 1.030542, -0.6064626, 0.3960784, 1, 0, 1,
-0.5898556, 1.558846, -0.3742012, 0.3921569, 1, 0, 1,
-0.5889305, 2.061835, 0.7694251, 0.3843137, 1, 0, 1,
-0.5859441, -0.11095, -3.293294, 0.3803922, 1, 0, 1,
-0.5847298, -0.6676788, -1.425449, 0.372549, 1, 0, 1,
-0.5841898, -0.3471126, -3.380691, 0.3686275, 1, 0, 1,
-0.5755582, -2.258942, -2.902033, 0.3607843, 1, 0, 1,
-0.5722582, 0.789266, 0.1676298, 0.3568628, 1, 0, 1,
-0.5628676, -0.6197743, -1.894457, 0.3490196, 1, 0, 1,
-0.5622455, -0.8360105, -3.452857, 0.345098, 1, 0, 1,
-0.5584978, 0.949872, 2.165331, 0.3372549, 1, 0, 1,
-0.5551481, 0.404253, -1.604908, 0.3333333, 1, 0, 1,
-0.5545845, 1.577505, -0.6669899, 0.3254902, 1, 0, 1,
-0.5539963, 0.6027362, -0.4670244, 0.3215686, 1, 0, 1,
-0.5485504, -0.7905577, -4.686903, 0.3137255, 1, 0, 1,
-0.5481682, -1.532242, -3.54232, 0.3098039, 1, 0, 1,
-0.5422996, -1.740953, -3.562591, 0.3019608, 1, 0, 1,
-0.5324075, -0.3145955, -2.482129, 0.2941177, 1, 0, 1,
-0.5318389, 0.5702059, 0.09747877, 0.2901961, 1, 0, 1,
-0.5307099, 0.6501233, -0.7715316, 0.282353, 1, 0, 1,
-0.5280249, -1.020841, -3.344379, 0.2784314, 1, 0, 1,
-0.5180221, -2.179692, -3.238514, 0.2705882, 1, 0, 1,
-0.5081492, -0.7533933, -2.120925, 0.2666667, 1, 0, 1,
-0.5018462, 0.5939168, 0.03396143, 0.2588235, 1, 0, 1,
-0.5010087, -0.4124379, -1.877728, 0.254902, 1, 0, 1,
-0.5004331, -0.2412614, -2.14523, 0.2470588, 1, 0, 1,
-0.4992205, -2.02566, -1.468247, 0.2431373, 1, 0, 1,
-0.4959387, 0.5441101, -1.002735, 0.2352941, 1, 0, 1,
-0.4956765, 0.2952754, -1.231876, 0.2313726, 1, 0, 1,
-0.4947467, 0.2609153, -0.2444531, 0.2235294, 1, 0, 1,
-0.4946077, 1.204477, 0.3146106, 0.2196078, 1, 0, 1,
-0.4943794, -0.08313784, -0.3844955, 0.2117647, 1, 0, 1,
-0.4928824, 0.5490707, -2.343657, 0.2078431, 1, 0, 1,
-0.4911147, -0.2401168, -0.8501214, 0.2, 1, 0, 1,
-0.4872704, 0.1975094, -1.296585, 0.1921569, 1, 0, 1,
-0.486716, 0.04842461, -0.4728169, 0.1882353, 1, 0, 1,
-0.4853309, -1.266773, -3.69003, 0.1803922, 1, 0, 1,
-0.4833336, 0.2594626, -0.3954771, 0.1764706, 1, 0, 1,
-0.4812015, -0.9700596, -4.18892, 0.1686275, 1, 0, 1,
-0.4798949, -0.8323748, -3.985244, 0.1647059, 1, 0, 1,
-0.479435, -0.8275304, -4.182301, 0.1568628, 1, 0, 1,
-0.4785174, 1.418453, -0.1759287, 0.1529412, 1, 0, 1,
-0.4752299, -0.07652626, -3.821824, 0.145098, 1, 0, 1,
-0.4740197, -0.940209, -1.914864, 0.1411765, 1, 0, 1,
-0.4713853, -0.08998969, -1.313392, 0.1333333, 1, 0, 1,
-0.4694078, -0.7060497, -4.417912, 0.1294118, 1, 0, 1,
-0.4664089, -1.026148, -1.942913, 0.1215686, 1, 0, 1,
-0.4653547, -0.5955563, -3.710418, 0.1176471, 1, 0, 1,
-0.4625914, 0.6950278, 1.135639, 0.1098039, 1, 0, 1,
-0.4615249, 0.2590517, 0.6802583, 0.1058824, 1, 0, 1,
-0.4587365, -1.336509, -1.147301, 0.09803922, 1, 0, 1,
-0.4580813, -1.406999, -2.509347, 0.09019608, 1, 0, 1,
-0.4516053, -1.16241, -4.943895, 0.08627451, 1, 0, 1,
-0.442002, 1.19271, 0.8524681, 0.07843138, 1, 0, 1,
-0.4409325, -0.4393089, -2.016222, 0.07450981, 1, 0, 1,
-0.4402229, 1.570116, -2.402654, 0.06666667, 1, 0, 1,
-0.4352023, 0.2374077, -0.4689345, 0.0627451, 1, 0, 1,
-0.4324054, 1.120282, -1.563422, 0.05490196, 1, 0, 1,
-0.4275933, -0.4745237, -1.960925, 0.05098039, 1, 0, 1,
-0.4239202, -0.4677375, -3.308283, 0.04313726, 1, 0, 1,
-0.4221616, -0.2013189, -0.7470152, 0.03921569, 1, 0, 1,
-0.4199012, -0.3109677, -2.908262, 0.03137255, 1, 0, 1,
-0.415168, -0.3041975, -3.778624, 0.02745098, 1, 0, 1,
-0.4127556, -0.8294054, -2.73773, 0.01960784, 1, 0, 1,
-0.4122386, -1.116307, -4.497393, 0.01568628, 1, 0, 1,
-0.4105074, -0.6364495, -2.116452, 0.007843138, 1, 0, 1,
-0.4087172, 1.950074, -0.1092796, 0.003921569, 1, 0, 1,
-0.4026078, 1.161333, -0.03669408, 0, 1, 0.003921569, 1,
-0.3999934, 1.096619, -1.19505, 0, 1, 0.01176471, 1,
-0.3999535, 0.009920044, -2.272275, 0, 1, 0.01568628, 1,
-0.3995369, 0.3114992, 1.024489, 0, 1, 0.02352941, 1,
-0.399197, -0.4717729, -3.414465, 0, 1, 0.02745098, 1,
-0.3903752, -0.3183996, -1.054568, 0, 1, 0.03529412, 1,
-0.3899871, 0.3794302, 0.6136404, 0, 1, 0.03921569, 1,
-0.3852271, 0.4487045, -1.265854, 0, 1, 0.04705882, 1,
-0.3807387, -0.2835948, -2.408399, 0, 1, 0.05098039, 1,
-0.3804172, 0.7412886, 0.4104154, 0, 1, 0.05882353, 1,
-0.3775965, 2.078781, 0.4718749, 0, 1, 0.0627451, 1,
-0.372729, -1.433519, -2.613739, 0, 1, 0.07058824, 1,
-0.3719572, -0.1843689, -1.7192, 0, 1, 0.07450981, 1,
-0.3704216, -0.8464555, -0.8910087, 0, 1, 0.08235294, 1,
-0.367151, -0.448329, -0.884333, 0, 1, 0.08627451, 1,
-0.3661738, -1.531626, -2.947081, 0, 1, 0.09411765, 1,
-0.3616162, -0.4536945, -3.054725, 0, 1, 0.1019608, 1,
-0.3615071, -1.454743, -3.263344, 0, 1, 0.1058824, 1,
-0.3597477, 0.4674844, -1.540025, 0, 1, 0.1137255, 1,
-0.3528835, 0.9431931, 0.8547541, 0, 1, 0.1176471, 1,
-0.3527548, 0.5481952, -0.01261392, 0, 1, 0.1254902, 1,
-0.3520909, 0.09446241, -0.5166662, 0, 1, 0.1294118, 1,
-0.3429067, -1.060783, -1.588504, 0, 1, 0.1372549, 1,
-0.3406603, 2.188383, -0.2913437, 0, 1, 0.1411765, 1,
-0.337954, 0.5447376, 0.1232892, 0, 1, 0.1490196, 1,
-0.3355178, 0.225318, -0.7947443, 0, 1, 0.1529412, 1,
-0.3325644, 0.9952265, -0.829437, 0, 1, 0.1607843, 1,
-0.3280697, -0.2945149, -1.69676, 0, 1, 0.1647059, 1,
-0.3275905, 0.4899239, -0.9614989, 0, 1, 0.172549, 1,
-0.3210435, -2.183091, -3.65119, 0, 1, 0.1764706, 1,
-0.3150312, -2.160481, -3.602384, 0, 1, 0.1843137, 1,
-0.3146783, 0.2353101, 1.172538, 0, 1, 0.1882353, 1,
-0.3142949, 0.3017373, -1.059868, 0, 1, 0.1960784, 1,
-0.3131523, 1.179979, 0.469199, 0, 1, 0.2039216, 1,
-0.3112072, 0.4175054, -1.202805, 0, 1, 0.2078431, 1,
-0.3099981, 0.2549087, -0.8254079, 0, 1, 0.2156863, 1,
-0.3096909, -0.1127475, -0.898186, 0, 1, 0.2196078, 1,
-0.3055568, 0.9846771, -1.071338, 0, 1, 0.227451, 1,
-0.3045356, -0.4019554, -1.432665, 0, 1, 0.2313726, 1,
-0.30081, 1.449427, -0.9650909, 0, 1, 0.2392157, 1,
-0.2995645, -1.941145, -4.211387, 0, 1, 0.2431373, 1,
-0.2983445, -0.02479945, 1.169425, 0, 1, 0.2509804, 1,
-0.2971488, 0.3077458, -2.109523, 0, 1, 0.254902, 1,
-0.2963746, 0.5605719, -0.01249999, 0, 1, 0.2627451, 1,
-0.2934978, -0.313842, -3.261285, 0, 1, 0.2666667, 1,
-0.292004, -1.09096, -1.176543, 0, 1, 0.2745098, 1,
-0.2919406, 0.3467951, -0.07176868, 0, 1, 0.2784314, 1,
-0.2918358, 0.2438518, -0.4099895, 0, 1, 0.2862745, 1,
-0.280213, -1.255123, -3.648439, 0, 1, 0.2901961, 1,
-0.2799488, -1.39889, -0.7725064, 0, 1, 0.2980392, 1,
-0.2746057, 0.1119798, -2.225877, 0, 1, 0.3058824, 1,
-0.2739285, 0.5521591, -0.2759381, 0, 1, 0.3098039, 1,
-0.2733117, -0.2977746, -3.056388, 0, 1, 0.3176471, 1,
-0.2728721, -0.3395818, -2.807539, 0, 1, 0.3215686, 1,
-0.2725409, 2.096887, -0.4719802, 0, 1, 0.3294118, 1,
-0.2675033, -0.4924115, -3.092676, 0, 1, 0.3333333, 1,
-0.2611161, -0.3998102, -1.512617, 0, 1, 0.3411765, 1,
-0.2576309, -0.9774494, -2.910022, 0, 1, 0.345098, 1,
-0.2534346, 0.9491474, -0.9062044, 0, 1, 0.3529412, 1,
-0.2531739, -0.5594078, -3.443963, 0, 1, 0.3568628, 1,
-0.2522343, -0.1241139, -1.963922, 0, 1, 0.3647059, 1,
-0.2484224, 0.2804304, -1.079476, 0, 1, 0.3686275, 1,
-0.2447598, -0.2647025, -2.640025, 0, 1, 0.3764706, 1,
-0.242296, -2.230706, -4.450184, 0, 1, 0.3803922, 1,
-0.2422773, 0.938126, 0.4280211, 0, 1, 0.3882353, 1,
-0.2391424, -0.5354719, -2.791905, 0, 1, 0.3921569, 1,
-0.2379578, -0.1591623, -3.355928, 0, 1, 0.4, 1,
-0.2334158, 0.4858619, -0.2174076, 0, 1, 0.4078431, 1,
-0.2324416, 0.6080074, -0.2355923, 0, 1, 0.4117647, 1,
-0.2300347, -0.02301491, -0.2829567, 0, 1, 0.4196078, 1,
-0.2298306, -0.4274302, -2.093524, 0, 1, 0.4235294, 1,
-0.2228677, 0.7512519, 0.6777431, 0, 1, 0.4313726, 1,
-0.2187213, 0.3826507, -2.215624, 0, 1, 0.4352941, 1,
-0.2140638, 0.3280002, -0.5880766, 0, 1, 0.4431373, 1,
-0.2122167, -2.55683, -3.392933, 0, 1, 0.4470588, 1,
-0.2110751, -1.591362, -4.506195, 0, 1, 0.454902, 1,
-0.209115, -1.299851, -2.432175, 0, 1, 0.4588235, 1,
-0.2048281, 0.1986825, -0.4684874, 0, 1, 0.4666667, 1,
-0.2042817, -0.7664167, -4.31539, 0, 1, 0.4705882, 1,
-0.2025899, -0.4922649, -1.865689, 0, 1, 0.4784314, 1,
-0.2025218, 0.7505578, -1.220922, 0, 1, 0.4823529, 1,
-0.1929222, 0.6502472, -0.3905891, 0, 1, 0.4901961, 1,
-0.1873918, 0.7909895, 1.457482, 0, 1, 0.4941176, 1,
-0.1863573, -1.513916, -4.419424, 0, 1, 0.5019608, 1,
-0.1857898, 1.66768, 0.8238847, 0, 1, 0.509804, 1,
-0.1773246, 1.025079, -0.2179461, 0, 1, 0.5137255, 1,
-0.1754895, -1.858997, -2.281188, 0, 1, 0.5215687, 1,
-0.1748987, -0.5912253, -3.601415, 0, 1, 0.5254902, 1,
-0.1735776, -0.306644, -1.465655, 0, 1, 0.5333334, 1,
-0.1734263, 0.2293889, -1.507105, 0, 1, 0.5372549, 1,
-0.1707742, 0.7901219, -0.3632326, 0, 1, 0.5450981, 1,
-0.1660992, -0.2934468, -2.790962, 0, 1, 0.5490196, 1,
-0.1636572, -0.9871291, -2.914554, 0, 1, 0.5568628, 1,
-0.1600145, -0.9121687, -2.345425, 0, 1, 0.5607843, 1,
-0.1558542, -1.379342, -3.787755, 0, 1, 0.5686275, 1,
-0.1553787, 0.8089449, -0.4263345, 0, 1, 0.572549, 1,
-0.1548562, 1.247779, 0.8232324, 0, 1, 0.5803922, 1,
-0.1535005, -1.061796, -3.96856, 0, 1, 0.5843138, 1,
-0.1514678, 0.6694793, 0.7973617, 0, 1, 0.5921569, 1,
-0.1507715, 1.849817, -1.006526, 0, 1, 0.5960785, 1,
-0.1499854, 0.3515882, -1.725876, 0, 1, 0.6039216, 1,
-0.1481285, 0.7310046, 0.3951935, 0, 1, 0.6117647, 1,
-0.1478348, 1.746724, -0.5537501, 0, 1, 0.6156863, 1,
-0.1465478, 1.004043, -0.7439681, 0, 1, 0.6235294, 1,
-0.1455636, 0.08456795, -1.011307, 0, 1, 0.627451, 1,
-0.1445774, 0.04577351, -1.125586, 0, 1, 0.6352941, 1,
-0.1438763, -0.4071398, -3.010367, 0, 1, 0.6392157, 1,
-0.1421273, 1.058504, 0.04608271, 0, 1, 0.6470588, 1,
-0.1417969, -1.532478, -4.016268, 0, 1, 0.6509804, 1,
-0.1392877, -0.5353734, -2.75225, 0, 1, 0.6588235, 1,
-0.136593, 2.828103, 0.7803672, 0, 1, 0.6627451, 1,
-0.1311958, 0.552805, -0.009535548, 0, 1, 0.6705883, 1,
-0.1274431, 2.235162, -0.8550715, 0, 1, 0.6745098, 1,
-0.1260407, -1.241868, -3.993011, 0, 1, 0.682353, 1,
-0.1191167, 0.2430743, -1.846036, 0, 1, 0.6862745, 1,
-0.1146627, -1.090805, -3.077138, 0, 1, 0.6941177, 1,
-0.1109312, 1.161398, -0.5500554, 0, 1, 0.7019608, 1,
-0.1046173, -1.141628, -4.229038, 0, 1, 0.7058824, 1,
-0.1029439, -0.4176025, -4.534632, 0, 1, 0.7137255, 1,
-0.09794012, -1.024566, -0.6926727, 0, 1, 0.7176471, 1,
-0.09572294, 0.5264812, 0.06127719, 0, 1, 0.7254902, 1,
-0.09570327, -0.37015, -1.918635, 0, 1, 0.7294118, 1,
-0.09303627, 0.07547665, 0.682648, 0, 1, 0.7372549, 1,
-0.08866692, -0.4317982, -2.863294, 0, 1, 0.7411765, 1,
-0.08698004, -1.28399, -2.383994, 0, 1, 0.7490196, 1,
-0.08688209, -0.6981987, -3.233317, 0, 1, 0.7529412, 1,
-0.08416417, -0.3475341, -2.053961, 0, 1, 0.7607843, 1,
-0.07975823, -0.246393, -4.067853, 0, 1, 0.7647059, 1,
-0.07970239, 0.3570404, -0.05549067, 0, 1, 0.772549, 1,
-0.07699893, -0.05398215, -2.16429, 0, 1, 0.7764706, 1,
-0.076649, 0.02786695, -1.574059, 0, 1, 0.7843137, 1,
-0.06801259, -0.8860618, -1.644879, 0, 1, 0.7882353, 1,
-0.06757394, -0.4706318, -0.8800466, 0, 1, 0.7960784, 1,
-0.06613513, -1.236487, -2.892936, 0, 1, 0.8039216, 1,
-0.06604691, -0.06817106, -2.55221, 0, 1, 0.8078431, 1,
-0.06054969, -2.196023, -3.565661, 0, 1, 0.8156863, 1,
-0.06035415, -0.5182582, -1.841502, 0, 1, 0.8196079, 1,
-0.05973857, 0.6975082, 1.286883, 0, 1, 0.827451, 1,
-0.0579422, -0.6810682, -3.989331, 0, 1, 0.8313726, 1,
-0.05385696, -0.06815162, -3.903031, 0, 1, 0.8392157, 1,
-0.05159676, 0.3324105, -0.340938, 0, 1, 0.8431373, 1,
-0.05112644, 0.7210146, 0.0698991, 0, 1, 0.8509804, 1,
-0.04696523, -0.5829604, -3.762402, 0, 1, 0.854902, 1,
-0.04633294, 0.6909842, 2.003145, 0, 1, 0.8627451, 1,
-0.0432783, 0.1175428, -1.014786, 0, 1, 0.8666667, 1,
-0.04318541, -1.700574, -2.431265, 0, 1, 0.8745098, 1,
-0.04048837, 0.4070327, -3.070179, 0, 1, 0.8784314, 1,
-0.03948931, 0.3623636, -1.24272, 0, 1, 0.8862745, 1,
-0.03768083, 0.8266712, -1.855392, 0, 1, 0.8901961, 1,
-0.03408803, 0.4193372, -0.5219778, 0, 1, 0.8980392, 1,
-0.02858246, 1.232025, 1.056919, 0, 1, 0.9058824, 1,
-0.02672655, 1.17557, 0.3869099, 0, 1, 0.9098039, 1,
-0.0256148, 1.115874, -0.5698975, 0, 1, 0.9176471, 1,
-0.0241666, -0.6082529, -2.901222, 0, 1, 0.9215686, 1,
-0.01962619, -0.3120286, -3.161633, 0, 1, 0.9294118, 1,
-0.01920093, 0.8420664, 0.03479329, 0, 1, 0.9333333, 1,
-0.01529593, 0.2465357, 1.311597, 0, 1, 0.9411765, 1,
-0.01522165, -0.2772501, -3.021148, 0, 1, 0.945098, 1,
-0.01284368, 0.8607858, 2.127951, 0, 1, 0.9529412, 1,
-0.01274858, -0.788372, -4.187491, 0, 1, 0.9568627, 1,
-0.011705, 1.41242, -0.3098685, 0, 1, 0.9647059, 1,
-0.01163205, 0.1090029, 1.476134, 0, 1, 0.9686275, 1,
-0.01138696, -0.5909882, -4.156192, 0, 1, 0.9764706, 1,
-0.01051198, -1.00173, -3.879509, 0, 1, 0.9803922, 1,
-0.01025471, -0.4749104, -4.881536, 0, 1, 0.9882353, 1,
-0.009896827, -1.402013, -1.138362, 0, 1, 0.9921569, 1,
-0.009347891, 1.543833, -0.7642108, 0, 1, 1, 1,
-0.008662324, 0.1344454, -1.782944, 0, 0.9921569, 1, 1,
-0.008404908, -0.281267, -2.716052, 0, 0.9882353, 1, 1,
-0.007865903, 0.2415363, -0.4004332, 0, 0.9803922, 1, 1,
-0.005513661, -0.1941291, -1.979785, 0, 0.9764706, 1, 1,
-0.005178164, -2.387296, -3.32594, 0, 0.9686275, 1, 1,
-0.004588185, 0.3773198, 0.4504215, 0, 0.9647059, 1, 1,
-0.004129495, -0.9970533, -4.395257, 0, 0.9568627, 1, 1,
-0.003569231, -1.169886, -2.804444, 0, 0.9529412, 1, 1,
0.001724902, -0.9326431, 2.015826, 0, 0.945098, 1, 1,
0.002069412, 1.211332, -0.2722428, 0, 0.9411765, 1, 1,
0.009080259, -1.735291, 4.694505, 0, 0.9333333, 1, 1,
0.01101581, 0.3251179, 0.184726, 0, 0.9294118, 1, 1,
0.01109488, -1.330616, 5.289563, 0, 0.9215686, 1, 1,
0.01206191, 0.02843025, -0.1187143, 0, 0.9176471, 1, 1,
0.01378585, -1.152048, 4.218821, 0, 0.9098039, 1, 1,
0.01531394, 1.643992, -0.5558096, 0, 0.9058824, 1, 1,
0.01735601, 1.025001, -1.476345, 0, 0.8980392, 1, 1,
0.01757269, -0.05374065, 2.970102, 0, 0.8901961, 1, 1,
0.02418396, 0.05286754, 2.109787, 0, 0.8862745, 1, 1,
0.02537532, 0.2913306, 1.352419, 0, 0.8784314, 1, 1,
0.02630837, -0.08819813, 2.131975, 0, 0.8745098, 1, 1,
0.03311392, -0.9078905, 2.33706, 0, 0.8666667, 1, 1,
0.03396805, -0.3360384, 3.51216, 0, 0.8627451, 1, 1,
0.03438975, -0.1586779, 1.550461, 0, 0.854902, 1, 1,
0.0349071, -0.1484867, 2.618772, 0, 0.8509804, 1, 1,
0.03749457, 1.570655, -0.02491088, 0, 0.8431373, 1, 1,
0.03760461, 0.9122712, -0.08198595, 0, 0.8392157, 1, 1,
0.03969828, -0.7265778, 4.533649, 0, 0.8313726, 1, 1,
0.04371839, -0.4777809, 4.251606, 0, 0.827451, 1, 1,
0.043816, 0.16176, 0.4777555, 0, 0.8196079, 1, 1,
0.04410062, -0.1103371, 0.8918766, 0, 0.8156863, 1, 1,
0.04716612, -0.3168011, 3.128268, 0, 0.8078431, 1, 1,
0.04753751, -0.01537148, 0.5971004, 0, 0.8039216, 1, 1,
0.05252711, -0.974292, 4.703049, 0, 0.7960784, 1, 1,
0.05361706, 1.738289, 0.2128809, 0, 0.7882353, 1, 1,
0.05475669, -0.579901, 5.197103, 0, 0.7843137, 1, 1,
0.05540613, 1.88082, -1.220602, 0, 0.7764706, 1, 1,
0.05710863, -2.908392, 0.9372717, 0, 0.772549, 1, 1,
0.05711662, 1.121087, 0.1032275, 0, 0.7647059, 1, 1,
0.05841998, -0.2927966, 3.531996, 0, 0.7607843, 1, 1,
0.06135935, 0.03442662, 1.51252, 0, 0.7529412, 1, 1,
0.06444272, -0.01295792, 2.474951, 0, 0.7490196, 1, 1,
0.06456155, -0.1231963, 2.258494, 0, 0.7411765, 1, 1,
0.06467813, -0.141868, 2.48311, 0, 0.7372549, 1, 1,
0.06693424, -0.9899405, 2.465552, 0, 0.7294118, 1, 1,
0.0671965, 0.6889875, 0.6827604, 0, 0.7254902, 1, 1,
0.07282639, -0.6174843, 4.63737, 0, 0.7176471, 1, 1,
0.082131, -0.3303, 2.849793, 0, 0.7137255, 1, 1,
0.08483011, 0.1842782, -0.02965422, 0, 0.7058824, 1, 1,
0.09022748, -0.1507764, 1.242982, 0, 0.6980392, 1, 1,
0.09023678, 0.3940299, -0.620715, 0, 0.6941177, 1, 1,
0.0944588, -0.5127513, 3.94021, 0, 0.6862745, 1, 1,
0.1026787, -1.330006, 2.662717, 0, 0.682353, 1, 1,
0.1030197, 0.1989139, 0.5677729, 0, 0.6745098, 1, 1,
0.1096541, 0.5997479, -0.3488488, 0, 0.6705883, 1, 1,
0.1103015, 1.683735, 2.395003, 0, 0.6627451, 1, 1,
0.1115577, 0.751719, 0.1291851, 0, 0.6588235, 1, 1,
0.1131651, -0.2298297, 2.423455, 0, 0.6509804, 1, 1,
0.113478, 0.4194702, 1.153564, 0, 0.6470588, 1, 1,
0.118151, -0.8673039, 2.797591, 0, 0.6392157, 1, 1,
0.1189576, 0.4369167, 0.04866018, 0, 0.6352941, 1, 1,
0.120241, -2.389879, 1.348326, 0, 0.627451, 1, 1,
0.132835, -2.293992, 3.764212, 0, 0.6235294, 1, 1,
0.1420395, -1.150258, 4.097643, 0, 0.6156863, 1, 1,
0.1426027, 0.6603482, 0.1430293, 0, 0.6117647, 1, 1,
0.1443593, 0.9254142, 0.6534867, 0, 0.6039216, 1, 1,
0.1479117, -2.550408, 2.713277, 0, 0.5960785, 1, 1,
0.1507217, -0.6828125, 2.817251, 0, 0.5921569, 1, 1,
0.1535686, 0.7047369, 1.344121, 0, 0.5843138, 1, 1,
0.1553764, -0.5413098, 4.16427, 0, 0.5803922, 1, 1,
0.1564217, -0.5444665, 2.534481, 0, 0.572549, 1, 1,
0.1594685, -0.2300668, 0.5088374, 0, 0.5686275, 1, 1,
0.160236, -0.5702307, 3.377048, 0, 0.5607843, 1, 1,
0.1606207, -0.2777416, 2.707222, 0, 0.5568628, 1, 1,
0.1625167, -0.6168295, 3.810026, 0, 0.5490196, 1, 1,
0.163235, -2.060092, 3.25926, 0, 0.5450981, 1, 1,
0.1650285, -1.453351, 2.592294, 0, 0.5372549, 1, 1,
0.1726963, -0.02339169, 1.68055, 0, 0.5333334, 1, 1,
0.1732442, -0.2554684, 2.374725, 0, 0.5254902, 1, 1,
0.1741335, 1.001173, 0.07814288, 0, 0.5215687, 1, 1,
0.1753051, -1.889667, 3.135169, 0, 0.5137255, 1, 1,
0.1784809, 0.060481, 1.792299, 0, 0.509804, 1, 1,
0.1801872, -0.1177598, 3.488024, 0, 0.5019608, 1, 1,
0.1846746, 0.2039746, -0.2515058, 0, 0.4941176, 1, 1,
0.1876817, -2.154899, 2.828463, 0, 0.4901961, 1, 1,
0.1886718, 0.03488398, 2.417745, 0, 0.4823529, 1, 1,
0.1896785, 0.7759531, 0.4736423, 0, 0.4784314, 1, 1,
0.1907132, 1.081885, 0.4369003, 0, 0.4705882, 1, 1,
0.1915135, 1.291864, 0.1150877, 0, 0.4666667, 1, 1,
0.1918693, -0.2807539, 4.156847, 0, 0.4588235, 1, 1,
0.1984842, 0.7034407, -0.2505962, 0, 0.454902, 1, 1,
0.2031207, 0.6069466, 1.711221, 0, 0.4470588, 1, 1,
0.2034337, 0.1327075, 0.8887601, 0, 0.4431373, 1, 1,
0.2081897, -1.310966, 2.053226, 0, 0.4352941, 1, 1,
0.2098375, 0.7861666, 2.751445, 0, 0.4313726, 1, 1,
0.2117972, 0.3794501, 0.8501599, 0, 0.4235294, 1, 1,
0.2147561, 0.3295372, 3.232516, 0, 0.4196078, 1, 1,
0.2236844, 1.100598, -0.3889161, 0, 0.4117647, 1, 1,
0.2260477, 1.208485, 0.1104598, 0, 0.4078431, 1, 1,
0.2273531, -1.428463, 5.467121, 0, 0.4, 1, 1,
0.2305035, -1.65596, 5.021364, 0, 0.3921569, 1, 1,
0.2305317, 1.364707, -1.294553, 0, 0.3882353, 1, 1,
0.2311064, 1.106886, -1.059713, 0, 0.3803922, 1, 1,
0.2419332, 0.4427243, 1.974053, 0, 0.3764706, 1, 1,
0.2455868, 0.984927, -0.1045156, 0, 0.3686275, 1, 1,
0.2468635, 0.14164, 0.6120818, 0, 0.3647059, 1, 1,
0.2485319, -0.8077291, 3.318787, 0, 0.3568628, 1, 1,
0.2591935, 0.4349513, 1.018037, 0, 0.3529412, 1, 1,
0.263708, 0.5437988, 0.5829539, 0, 0.345098, 1, 1,
0.2677325, -1.434435, 2.826202, 0, 0.3411765, 1, 1,
0.2683251, 0.4549342, -0.6751958, 0, 0.3333333, 1, 1,
0.2699074, 0.7505811, 0.5269573, 0, 0.3294118, 1, 1,
0.27208, 0.05896351, 1.81862, 0, 0.3215686, 1, 1,
0.2721761, 0.02781355, 3.608837, 0, 0.3176471, 1, 1,
0.2764713, -1.648001, 3.119438, 0, 0.3098039, 1, 1,
0.2793669, 1.102305, -0.6138656, 0, 0.3058824, 1, 1,
0.2800828, -0.06582433, 1.522214, 0, 0.2980392, 1, 1,
0.2816356, 1.672833, 1.982713, 0, 0.2901961, 1, 1,
0.2824391, 0.4948882, -0.2054165, 0, 0.2862745, 1, 1,
0.2841697, 1.203796, 0.1435633, 0, 0.2784314, 1, 1,
0.2845174, 1.921265, 0.4929035, 0, 0.2745098, 1, 1,
0.2862709, 1.145101, 0.5320624, 0, 0.2666667, 1, 1,
0.2955673, -1.065467, 3.032326, 0, 0.2627451, 1, 1,
0.2965398, -0.3651254, 2.848485, 0, 0.254902, 1, 1,
0.2972558, 1.850244, -0.9948163, 0, 0.2509804, 1, 1,
0.2982491, 1.770206, 0.5268587, 0, 0.2431373, 1, 1,
0.3001439, 0.06964222, -0.9221336, 0, 0.2392157, 1, 1,
0.3032338, 0.6144641, 0.3698799, 0, 0.2313726, 1, 1,
0.3033594, 0.5696473, -0.09024651, 0, 0.227451, 1, 1,
0.3062788, 1.764692, 0.8096693, 0, 0.2196078, 1, 1,
0.3092975, 1.028199, 0.05274968, 0, 0.2156863, 1, 1,
0.3103608, 0.6444867, 0.7835715, 0, 0.2078431, 1, 1,
0.3106585, -1.985698, 2.618903, 0, 0.2039216, 1, 1,
0.3130335, -0.5779943, 1.265791, 0, 0.1960784, 1, 1,
0.3131172, -0.9040868, 2.935337, 0, 0.1882353, 1, 1,
0.3160808, 1.521525, 0.2553809, 0, 0.1843137, 1, 1,
0.3242859, -0.9966382, 1.801912, 0, 0.1764706, 1, 1,
0.3262314, -0.505319, 1.577296, 0, 0.172549, 1, 1,
0.345261, 1.225459, 1.564668, 0, 0.1647059, 1, 1,
0.3459776, -0.06273291, 0.5045889, 0, 0.1607843, 1, 1,
0.3460938, 0.200562, 0.5600966, 0, 0.1529412, 1, 1,
0.3488783, -0.9295473, 2.350115, 0, 0.1490196, 1, 1,
0.3511814, 1.109792, 0.2145621, 0, 0.1411765, 1, 1,
0.362035, -0.5008633, 2.716378, 0, 0.1372549, 1, 1,
0.3664369, 1.819364, -0.81357, 0, 0.1294118, 1, 1,
0.3689805, 1.169347, 1.077738, 0, 0.1254902, 1, 1,
0.3713936, 1.220956, -1.057029, 0, 0.1176471, 1, 1,
0.3754805, 0.8973023, 0.583387, 0, 0.1137255, 1, 1,
0.378102, 0.3103153, -0.4434312, 0, 0.1058824, 1, 1,
0.380639, -0.6163554, 2.297109, 0, 0.09803922, 1, 1,
0.3898609, -0.1681034, 2.468364, 0, 0.09411765, 1, 1,
0.3928555, 0.4007111, -0.4094718, 0, 0.08627451, 1, 1,
0.392954, 1.084181, -0.6548806, 0, 0.08235294, 1, 1,
0.395152, -0.7184132, 2.264484, 0, 0.07450981, 1, 1,
0.401657, 1.579083, 0.9048929, 0, 0.07058824, 1, 1,
0.4041548, -1.738063, 3.452648, 0, 0.0627451, 1, 1,
0.4067786, -1.64299, 2.730469, 0, 0.05882353, 1, 1,
0.4110835, -0.4109887, 2.625652, 0, 0.05098039, 1, 1,
0.4172623, -1.660096, 0.6043594, 0, 0.04705882, 1, 1,
0.4173847, 0.07372779, 1.517487, 0, 0.03921569, 1, 1,
0.4210685, 0.9190882, -0.1772482, 0, 0.03529412, 1, 1,
0.4217753, -0.2721993, 3.60566, 0, 0.02745098, 1, 1,
0.4223566, 0.7646938, 1.671636, 0, 0.02352941, 1, 1,
0.4266964, -0.5080181, 1.401746, 0, 0.01568628, 1, 1,
0.4269421, -0.8703061, 2.027741, 0, 0.01176471, 1, 1,
0.4274806, -0.1173346, 1.953628, 0, 0.003921569, 1, 1,
0.4292962, -0.6678515, 2.4135, 0.003921569, 0, 1, 1,
0.4340119, 1.75921, 0.6162962, 0.007843138, 0, 1, 1,
0.4359777, 0.1801308, 0.234743, 0.01568628, 0, 1, 1,
0.442103, 0.142759, 1.899862, 0.01960784, 0, 1, 1,
0.4438618, -0.1073095, 1.35658, 0.02745098, 0, 1, 1,
0.4454559, 0.05389913, 0.8888821, 0.03137255, 0, 1, 1,
0.4465948, 1.042006, 0.2350135, 0.03921569, 0, 1, 1,
0.4523398, 0.6409652, -0.49416, 0.04313726, 0, 1, 1,
0.4554581, -0.8048894, 2.26388, 0.05098039, 0, 1, 1,
0.4618466, 1.979839, 2.702094, 0.05490196, 0, 1, 1,
0.4636824, -0.582229, 4.360081, 0.0627451, 0, 1, 1,
0.4671972, 0.8280899, 0.671232, 0.06666667, 0, 1, 1,
0.4672285, 2.548086, -0.8867643, 0.07450981, 0, 1, 1,
0.4734167, -0.3888752, 1.226765, 0.07843138, 0, 1, 1,
0.4746765, -0.560701, 2.490567, 0.08627451, 0, 1, 1,
0.4768385, 1.172062, -0.6728538, 0.09019608, 0, 1, 1,
0.4773995, -1.394061, 3.355585, 0.09803922, 0, 1, 1,
0.4795407, 0.5899881, -1.019886, 0.1058824, 0, 1, 1,
0.4845281, 0.375882, -1.446936, 0.1098039, 0, 1, 1,
0.4964451, -1.799879, 3.204182, 0.1176471, 0, 1, 1,
0.4992972, -0.2269054, 3.355722, 0.1215686, 0, 1, 1,
0.4993372, 0.03313716, 1.484686, 0.1294118, 0, 1, 1,
0.5007783, 0.1650729, 1.952343, 0.1333333, 0, 1, 1,
0.5030454, -0.03219355, 2.07406, 0.1411765, 0, 1, 1,
0.5045068, 0.4952997, 1.57455, 0.145098, 0, 1, 1,
0.5070102, 0.8986607, 0.05846458, 0.1529412, 0, 1, 1,
0.5070791, 1.302843, 1.684616, 0.1568628, 0, 1, 1,
0.5106598, 1.440401, 2.129708, 0.1647059, 0, 1, 1,
0.5112052, -0.669237, 3.150959, 0.1686275, 0, 1, 1,
0.5132829, -0.1596526, 1.392706, 0.1764706, 0, 1, 1,
0.5169905, 1.458868, 0.8093444, 0.1803922, 0, 1, 1,
0.5240375, -1.219947, 3.139922, 0.1882353, 0, 1, 1,
0.5269315, -1.889828, 2.712205, 0.1921569, 0, 1, 1,
0.5281098, -0.2557238, 0.7059491, 0.2, 0, 1, 1,
0.5297757, 0.1585057, 0.7071046, 0.2078431, 0, 1, 1,
0.5336636, -0.5268313, 0.9156892, 0.2117647, 0, 1, 1,
0.5360807, 0.3921388, 0.9126863, 0.2196078, 0, 1, 1,
0.5393052, 1.570521, 0.5615986, 0.2235294, 0, 1, 1,
0.5399135, -0.8920671, 3.158437, 0.2313726, 0, 1, 1,
0.5399682, -0.5408226, 3.164413, 0.2352941, 0, 1, 1,
0.5421044, -0.6074712, 3.321478, 0.2431373, 0, 1, 1,
0.5432891, 0.144863, 3.265415, 0.2470588, 0, 1, 1,
0.5438323, -0.3448258, 2.252788, 0.254902, 0, 1, 1,
0.5445779, 0.4453062, 0.2116227, 0.2588235, 0, 1, 1,
0.5458518, 0.6136107, 1.697688, 0.2666667, 0, 1, 1,
0.5476544, 1.262891, 0.8545157, 0.2705882, 0, 1, 1,
0.5486807, 1.295454, -0.891318, 0.2784314, 0, 1, 1,
0.5504107, 0.2248419, 1.212255, 0.282353, 0, 1, 1,
0.5624997, 1.059093, -1.075856, 0.2901961, 0, 1, 1,
0.5638478, -0.3750142, 2.95633, 0.2941177, 0, 1, 1,
0.5646665, 0.6185238, 1.242897, 0.3019608, 0, 1, 1,
0.5664895, -0.8415045, 2.699435, 0.3098039, 0, 1, 1,
0.5737392, -0.1926613, 1.979053, 0.3137255, 0, 1, 1,
0.5757952, 0.8816583, 1.007951, 0.3215686, 0, 1, 1,
0.5770305, 1.062578, 0.8019952, 0.3254902, 0, 1, 1,
0.5801314, -0.618237, 3.245559, 0.3333333, 0, 1, 1,
0.5852498, 1.565374, 1.931475, 0.3372549, 0, 1, 1,
0.5857259, 0.2353191, 1.729562, 0.345098, 0, 1, 1,
0.587331, -0.5834654, 2.709646, 0.3490196, 0, 1, 1,
0.6005914, 0.6950799, 1.016937, 0.3568628, 0, 1, 1,
0.6007821, 0.4384207, 1.749039, 0.3607843, 0, 1, 1,
0.6024254, 0.1939287, 0.0348693, 0.3686275, 0, 1, 1,
0.6067811, -1.705982, 1.61377, 0.372549, 0, 1, 1,
0.6079565, -0.7724414, 1.611215, 0.3803922, 0, 1, 1,
0.6114055, 0.265971, 2.405945, 0.3843137, 0, 1, 1,
0.6134481, 0.05148925, 0.6718919, 0.3921569, 0, 1, 1,
0.6157098, -0.1897765, 1.627833, 0.3960784, 0, 1, 1,
0.6202416, 1.152756, -0.6457739, 0.4039216, 0, 1, 1,
0.6207392, 1.499446, 0.8769054, 0.4117647, 0, 1, 1,
0.6215554, -1.135007, 3.510699, 0.4156863, 0, 1, 1,
0.6227154, 0.4152982, 1.691378, 0.4235294, 0, 1, 1,
0.6302896, -0.3077488, 2.417924, 0.427451, 0, 1, 1,
0.6333888, 0.1459908, 1.632592, 0.4352941, 0, 1, 1,
0.6338628, -0.787038, 1.474201, 0.4392157, 0, 1, 1,
0.6345888, 0.8545632, 1.125363, 0.4470588, 0, 1, 1,
0.6468197, -0.2006352, -0.9275361, 0.4509804, 0, 1, 1,
0.6506571, -0.06294149, 2.59085, 0.4588235, 0, 1, 1,
0.6509416, 0.8631164, -0.9899935, 0.4627451, 0, 1, 1,
0.6568466, 0.06284034, 1.482438, 0.4705882, 0, 1, 1,
0.667172, 1.027755, 0.3833167, 0.4745098, 0, 1, 1,
0.6716905, 1.106324, -0.06214014, 0.4823529, 0, 1, 1,
0.6730605, 0.8969442, -1.304907, 0.4862745, 0, 1, 1,
0.6738501, -0.7966633, 1.623845, 0.4941176, 0, 1, 1,
0.6796306, 1.097471, 0.06055016, 0.5019608, 0, 1, 1,
0.6799957, 0.5383038, 0.1825591, 0.5058824, 0, 1, 1,
0.6806844, 0.4456163, 2.325369, 0.5137255, 0, 1, 1,
0.6853265, -1.971262, 2.784943, 0.5176471, 0, 1, 1,
0.6881752, -0.2269796, 1.865531, 0.5254902, 0, 1, 1,
0.6956829, -0.4560598, 4.129213, 0.5294118, 0, 1, 1,
0.6982149, -0.5909654, 3.704578, 0.5372549, 0, 1, 1,
0.6993277, 0.6298258, 0.5616739, 0.5411765, 0, 1, 1,
0.702742, -0.6403237, 3.032585, 0.5490196, 0, 1, 1,
0.7029142, -0.7873324, 3.059862, 0.5529412, 0, 1, 1,
0.7030954, -0.7639612, 1.464864, 0.5607843, 0, 1, 1,
0.7047166, -0.4408943, 1.726534, 0.5647059, 0, 1, 1,
0.7055666, 0.2287739, 2.384306, 0.572549, 0, 1, 1,
0.7095446, -2.260934, 3.160539, 0.5764706, 0, 1, 1,
0.7103476, 1.639992, -0.796921, 0.5843138, 0, 1, 1,
0.7118146, -0.985002, 3.969903, 0.5882353, 0, 1, 1,
0.7172509, -0.3172276, 2.687556, 0.5960785, 0, 1, 1,
0.7208415, 1.199097, 0.0331669, 0.6039216, 0, 1, 1,
0.739714, 1.38198, 2.604277, 0.6078432, 0, 1, 1,
0.7413982, -1.134826, 3.736581, 0.6156863, 0, 1, 1,
0.7458069, 0.04827227, 2.403413, 0.6196079, 0, 1, 1,
0.7460016, 1.925002, 1.609142, 0.627451, 0, 1, 1,
0.7481364, 0.7765713, 0.1951235, 0.6313726, 0, 1, 1,
0.7534025, 0.5160447, -0.3411319, 0.6392157, 0, 1, 1,
0.7596796, -0.03750156, 0.5815609, 0.6431373, 0, 1, 1,
0.7607911, -1.419771, 2.982158, 0.6509804, 0, 1, 1,
0.7614872, 1.071585, -1.38103, 0.654902, 0, 1, 1,
0.7727003, -0.4360036, 0.9949236, 0.6627451, 0, 1, 1,
0.7757763, -0.3870267, 1.948084, 0.6666667, 0, 1, 1,
0.7762145, 0.3287378, 1.200876, 0.6745098, 0, 1, 1,
0.7792562, -0.4047926, 3.315139, 0.6784314, 0, 1, 1,
0.7796861, 0.2209242, 0.4010146, 0.6862745, 0, 1, 1,
0.7864244, -0.1220314, 1.01224, 0.6901961, 0, 1, 1,
0.7988499, 0.8960724, -1.484827, 0.6980392, 0, 1, 1,
0.801244, 3.033182, 0.02812027, 0.7058824, 0, 1, 1,
0.8025381, 0.4443213, 1.330109, 0.7098039, 0, 1, 1,
0.8031189, 0.8522494, 2.408895, 0.7176471, 0, 1, 1,
0.8045748, -1.324096, 3.493932, 0.7215686, 0, 1, 1,
0.8119165, 1.1566, -0.1106782, 0.7294118, 0, 1, 1,
0.814297, 0.1251278, 1.415401, 0.7333333, 0, 1, 1,
0.8145709, -0.2029217, 2.511817, 0.7411765, 0, 1, 1,
0.8209622, 1.309489, 2.556464, 0.7450981, 0, 1, 1,
0.8215284, 1.043972, -0.3391955, 0.7529412, 0, 1, 1,
0.825321, -1.066769, 2.273709, 0.7568628, 0, 1, 1,
0.8282298, -0.3980545, 1.832931, 0.7647059, 0, 1, 1,
0.8297824, -0.3018186, 1.200327, 0.7686275, 0, 1, 1,
0.8366711, 1.758306, 1.402926, 0.7764706, 0, 1, 1,
0.838376, -0.7439238, 2.34501, 0.7803922, 0, 1, 1,
0.8468587, -1.960603, 4.903924, 0.7882353, 0, 1, 1,
0.8515909, -0.3001259, 1.820176, 0.7921569, 0, 1, 1,
0.851997, 0.1256116, 1.010795, 0.8, 0, 1, 1,
0.8543968, -0.8769349, 2.760276, 0.8078431, 0, 1, 1,
0.8548936, 0.5725179, 0.5791618, 0.8117647, 0, 1, 1,
0.8591261, -0.4555496, 2.791396, 0.8196079, 0, 1, 1,
0.8636397, -1.28666, 3.348936, 0.8235294, 0, 1, 1,
0.8717421, 0.3376831, 1.271201, 0.8313726, 0, 1, 1,
0.8771704, 0.2105845, 1.735898, 0.8352941, 0, 1, 1,
0.8814241, 0.04481954, 1.672853, 0.8431373, 0, 1, 1,
0.8818328, 0.743005, 1.205995, 0.8470588, 0, 1, 1,
0.8910435, 0.2107158, 0.8040302, 0.854902, 0, 1, 1,
0.8949259, 0.1246253, -0.7046404, 0.8588235, 0, 1, 1,
0.8955827, -1.547685, 1.579661, 0.8666667, 0, 1, 1,
0.8964639, -2.652593, 2.423352, 0.8705882, 0, 1, 1,
0.8989032, -0.05514014, -0.7206747, 0.8784314, 0, 1, 1,
0.8991299, -0.7332494, 3.915106, 0.8823529, 0, 1, 1,
0.9044651, -0.1902312, 1.849054, 0.8901961, 0, 1, 1,
0.9120653, -1.253567, 0.5214375, 0.8941177, 0, 1, 1,
0.9126101, 1.36019, -0.9768453, 0.9019608, 0, 1, 1,
0.9126778, -0.9931836, 2.591474, 0.9098039, 0, 1, 1,
0.9157313, 1.151047, 1.421505, 0.9137255, 0, 1, 1,
0.9161233, 1.116662, 1.75027, 0.9215686, 0, 1, 1,
0.9239259, 1.883832, -1.021097, 0.9254902, 0, 1, 1,
0.9257932, -1.334592, 2.688101, 0.9333333, 0, 1, 1,
0.9276778, 1.265053, 0.1056062, 0.9372549, 0, 1, 1,
0.9296781, 0.2818221, 1.097611, 0.945098, 0, 1, 1,
0.9338375, -0.7051433, 1.003447, 0.9490196, 0, 1, 1,
0.9339095, -0.9369605, 2.799036, 0.9568627, 0, 1, 1,
0.9345368, 1.646189, 1.94534, 0.9607843, 0, 1, 1,
0.9350657, 0.533151, 0.9057155, 0.9686275, 0, 1, 1,
0.9547808, 1.628003, 0.5091059, 0.972549, 0, 1, 1,
0.9565831, 0.5922786, -0.4658157, 0.9803922, 0, 1, 1,
0.9636477, 0.9211185, 1.322435, 0.9843137, 0, 1, 1,
0.9689599, 0.4293076, 1.468894, 0.9921569, 0, 1, 1,
0.9710713, 0.4443871, 1.344551, 0.9960784, 0, 1, 1,
0.9711593, -1.229698, 2.802018, 1, 0, 0.9960784, 1,
0.9724491, -1.595259, 1.560811, 1, 0, 0.9882353, 1,
0.9805025, 1.022427, 0.1992066, 1, 0, 0.9843137, 1,
0.9809968, 0.8352669, 0.8269862, 1, 0, 0.9764706, 1,
0.981356, 0.09589868, 0.3128719, 1, 0, 0.972549, 1,
0.9815487, 0.2461086, 0.6845917, 1, 0, 0.9647059, 1,
0.9874329, 0.3409866, 2.096214, 1, 0, 0.9607843, 1,
0.9899356, 1.045164, 0.4018315, 1, 0, 0.9529412, 1,
0.9936514, 0.4125641, 1.143134, 1, 0, 0.9490196, 1,
0.9950506, -0.6705709, 2.861842, 1, 0, 0.9411765, 1,
1.001682, 0.2502886, 0.8465815, 1, 0, 0.9372549, 1,
1.004722, -0.06570866, 2.825711, 1, 0, 0.9294118, 1,
1.007445, -1.269394, 4.148575, 1, 0, 0.9254902, 1,
1.013965, 0.2886226, 2.709356, 1, 0, 0.9176471, 1,
1.02013, 0.3286819, -0.2135759, 1, 0, 0.9137255, 1,
1.021425, 2.135597, 1.153649, 1, 0, 0.9058824, 1,
1.02657, -0.6832204, 2.220118, 1, 0, 0.9019608, 1,
1.027296, 0.1637814, 1.757691, 1, 0, 0.8941177, 1,
1.041653, 0.1178474, 2.080932, 1, 0, 0.8862745, 1,
1.045857, 1.514405, 0.7911625, 1, 0, 0.8823529, 1,
1.048158, -0.188254, 2.443735, 1, 0, 0.8745098, 1,
1.050269, 0.9574606, -0.04705085, 1, 0, 0.8705882, 1,
1.054374, 1.441502, 1.662864, 1, 0, 0.8627451, 1,
1.060488, -0.6001457, 0.8181828, 1, 0, 0.8588235, 1,
1.061006, 0.9129062, 0.8183229, 1, 0, 0.8509804, 1,
1.061829, -0.2483881, 3.159843, 1, 0, 0.8470588, 1,
1.067443, -0.1774945, 2.005136, 1, 0, 0.8392157, 1,
1.070683, 0.8467236, 1.108456, 1, 0, 0.8352941, 1,
1.074697, -0.7818584, 1.998855, 1, 0, 0.827451, 1,
1.078853, -0.1085925, 1.133768, 1, 0, 0.8235294, 1,
1.081914, -0.2672979, 1.768816, 1, 0, 0.8156863, 1,
1.092202, 0.6111224, 0.7938111, 1, 0, 0.8117647, 1,
1.094235, -0.82216, 0.3796632, 1, 0, 0.8039216, 1,
1.100212, 0.330377, 0.5366381, 1, 0, 0.7960784, 1,
1.103611, 1.186059, 3.06137, 1, 0, 0.7921569, 1,
1.104501, -0.1881225, -0.1869421, 1, 0, 0.7843137, 1,
1.104755, 0.09828299, 0.3879969, 1, 0, 0.7803922, 1,
1.126649, -0.3878585, 1.618338, 1, 0, 0.772549, 1,
1.128412, 1.606282, 2.141179, 1, 0, 0.7686275, 1,
1.129943, -0.7407036, 3.491513, 1, 0, 0.7607843, 1,
1.129946, -0.8625515, 0.9991, 1, 0, 0.7568628, 1,
1.13653, 0.8686262, 0.9585396, 1, 0, 0.7490196, 1,
1.141836, 0.1194703, 0.6845251, 1, 0, 0.7450981, 1,
1.144215, -0.8722194, 2.372883, 1, 0, 0.7372549, 1,
1.144328, -0.2388501, 0.3976897, 1, 0, 0.7333333, 1,
1.148642, 0.05106989, 1.543389, 1, 0, 0.7254902, 1,
1.158159, 0.1857962, 0.2454629, 1, 0, 0.7215686, 1,
1.171965, -0.6064917, 3.12397, 1, 0, 0.7137255, 1,
1.176433, -0.9715733, 1.290026, 1, 0, 0.7098039, 1,
1.188693, -0.262712, 0.7996775, 1, 0, 0.7019608, 1,
1.19221, 1.322904, 2.086701, 1, 0, 0.6941177, 1,
1.192228, 0.6369915, -0.7699044, 1, 0, 0.6901961, 1,
1.192907, 0.692219, 0.8515573, 1, 0, 0.682353, 1,
1.193465, -1.053219, 1.356795, 1, 0, 0.6784314, 1,
1.196034, 1.665303, -0.5516464, 1, 0, 0.6705883, 1,
1.204962, -1.113329, 1.509072, 1, 0, 0.6666667, 1,
1.209965, 1.42565, 0.5077767, 1, 0, 0.6588235, 1,
1.231834, 0.6288449, 1.572083, 1, 0, 0.654902, 1,
1.232219, -0.1414072, 2.552551, 1, 0, 0.6470588, 1,
1.23771, 0.02173568, 0.4655267, 1, 0, 0.6431373, 1,
1.251676, -0.5462155, 2.580282, 1, 0, 0.6352941, 1,
1.256834, -0.9751548, 3.295891, 1, 0, 0.6313726, 1,
1.271384, 0.02331475, 1.87768, 1, 0, 0.6235294, 1,
1.275593, -0.08964217, 2.252268, 1, 0, 0.6196079, 1,
1.281499, -0.3078913, 1.969662, 1, 0, 0.6117647, 1,
1.281591, 0.3058193, -0.2742918, 1, 0, 0.6078432, 1,
1.286576, -1.214277, 3.01189, 1, 0, 0.6, 1,
1.294863, -0.3235941, 2.316856, 1, 0, 0.5921569, 1,
1.302388, -0.2419714, 2.537451, 1, 0, 0.5882353, 1,
1.307731, 0.3029144, -0.4647051, 1, 0, 0.5803922, 1,
1.313497, -0.7879858, 1.102942, 1, 0, 0.5764706, 1,
1.324707, -2.003689, 1.620841, 1, 0, 0.5686275, 1,
1.325032, -0.8614016, 1.708434, 1, 0, 0.5647059, 1,
1.348853, -1.516746, 1.306427, 1, 0, 0.5568628, 1,
1.353735, -1.669604, 3.962182, 1, 0, 0.5529412, 1,
1.35817, 0.5191489, 1.013643, 1, 0, 0.5450981, 1,
1.367334, -0.5659733, 2.017824, 1, 0, 0.5411765, 1,
1.371577, 1.333277, 0.6366915, 1, 0, 0.5333334, 1,
1.383575, 0.5588547, 0.6713744, 1, 0, 0.5294118, 1,
1.38542, 0.9889843, 1.508958, 1, 0, 0.5215687, 1,
1.385442, 1.081903, 1.896565, 1, 0, 0.5176471, 1,
1.393535, 0.4077442, 1.728688, 1, 0, 0.509804, 1,
1.395658, -0.4609371, 1.843857, 1, 0, 0.5058824, 1,
1.39907, -0.4701327, 3.105726, 1, 0, 0.4980392, 1,
1.400016, 0.339205, 1.472729, 1, 0, 0.4901961, 1,
1.402988, -1.162442, 2.631652, 1, 0, 0.4862745, 1,
1.411331, -0.8371475, 1.862849, 1, 0, 0.4784314, 1,
1.415167, 1.111659, 1.223037, 1, 0, 0.4745098, 1,
1.416716, -0.6702141, 1.994076, 1, 0, 0.4666667, 1,
1.417606, -0.6424125, 2.992773, 1, 0, 0.4627451, 1,
1.432983, 2.204776, -0.1487295, 1, 0, 0.454902, 1,
1.435767, 0.2939256, 2.056893, 1, 0, 0.4509804, 1,
1.436414, -1.197415, 4.068068, 1, 0, 0.4431373, 1,
1.448432, 1.768227, 1.392026, 1, 0, 0.4392157, 1,
1.450776, -1.245901, 2.077245, 1, 0, 0.4313726, 1,
1.462488, 1.01482, 1.609713, 1, 0, 0.427451, 1,
1.481448, -1.358126, 4.311547, 1, 0, 0.4196078, 1,
1.482985, -0.4743809, 2.070998, 1, 0, 0.4156863, 1,
1.490527, 0.8370287, 1.545959, 1, 0, 0.4078431, 1,
1.492563, -0.5412885, 1.872076, 1, 0, 0.4039216, 1,
1.499248, 1.230942, 1.0006, 1, 0, 0.3960784, 1,
1.501268, -0.2437308, 3.750557, 1, 0, 0.3882353, 1,
1.506818, 0.551154, 1.029302, 1, 0, 0.3843137, 1,
1.507408, -0.2933793, 2.112964, 1, 0, 0.3764706, 1,
1.523925, 1.490902, 0.6783827, 1, 0, 0.372549, 1,
1.532246, 1.471809, 0.1846127, 1, 0, 0.3647059, 1,
1.532377, 0.4539219, 2.72714, 1, 0, 0.3607843, 1,
1.536902, 1.943817, -0.2582447, 1, 0, 0.3529412, 1,
1.548188, 0.984898, 2.214604, 1, 0, 0.3490196, 1,
1.556393, -0.8781746, 1.533502, 1, 0, 0.3411765, 1,
1.564645, 0.002648941, 0.5125758, 1, 0, 0.3372549, 1,
1.598738, -0.6997077, 2.171314, 1, 0, 0.3294118, 1,
1.610015, -0.09626217, 2.326617, 1, 0, 0.3254902, 1,
1.612255, 0.593426, 2.364846, 1, 0, 0.3176471, 1,
1.620534, -0.7110703, 3.348529, 1, 0, 0.3137255, 1,
1.623179, -0.1013555, 0.9363772, 1, 0, 0.3058824, 1,
1.633707, 0.4273803, 0.6182693, 1, 0, 0.2980392, 1,
1.643585, 1.969794, -0.6653261, 1, 0, 0.2941177, 1,
1.654234, 0.09462782, 2.412267, 1, 0, 0.2862745, 1,
1.661798, -0.5555021, 2.936862, 1, 0, 0.282353, 1,
1.665288, -0.2708378, 0.9756005, 1, 0, 0.2745098, 1,
1.676846, -0.9074519, 1.769312, 1, 0, 0.2705882, 1,
1.681827, 1.683009, 1.240206, 1, 0, 0.2627451, 1,
1.684122, 1.070884, 2.275298, 1, 0, 0.2588235, 1,
1.696463, -1.075028, 0.9152448, 1, 0, 0.2509804, 1,
1.711033, 1.579376, 1.998153, 1, 0, 0.2470588, 1,
1.715812, 0.2658151, 1.745419, 1, 0, 0.2392157, 1,
1.742999, 1.719572, 0.3240502, 1, 0, 0.2352941, 1,
1.74313, 0.3734212, 0.1907095, 1, 0, 0.227451, 1,
1.77464, 0.1951581, 1.684324, 1, 0, 0.2235294, 1,
1.797723, 0.05015833, 1.394585, 1, 0, 0.2156863, 1,
1.817327, -0.7145832, 1.222012, 1, 0, 0.2117647, 1,
1.829098, -1.290625, 2.687403, 1, 0, 0.2039216, 1,
1.839019, -1.810689, 3.834839, 1, 0, 0.1960784, 1,
1.848206, 0.5030064, 0.295265, 1, 0, 0.1921569, 1,
1.851682, -0.3973515, 1.073205, 1, 0, 0.1843137, 1,
1.862701, 0.6456185, 1.394928, 1, 0, 0.1803922, 1,
1.868176, -0.6724331, 0.3606088, 1, 0, 0.172549, 1,
1.879421, 0.2814658, -0.1810502, 1, 0, 0.1686275, 1,
1.892578, 1.406448, 0.9550584, 1, 0, 0.1607843, 1,
1.906922, 0.8281807, 1.454926, 1, 0, 0.1568628, 1,
1.907504, -1.104373, 2.178371, 1, 0, 0.1490196, 1,
1.947025, -0.5038326, 1.554152, 1, 0, 0.145098, 1,
1.974016, -0.3759673, 0.4466475, 1, 0, 0.1372549, 1,
1.979955, -0.1812842, 0.2868949, 1, 0, 0.1333333, 1,
2.018229, 0.4931067, 0.5677595, 1, 0, 0.1254902, 1,
2.028826, 0.311773, 1.219079, 1, 0, 0.1215686, 1,
2.029941, -0.6695781, 0.6873021, 1, 0, 0.1137255, 1,
2.036873, 2.121337, 0.8871751, 1, 0, 0.1098039, 1,
2.040263, 0.1019641, 3.282175, 1, 0, 0.1019608, 1,
2.05267, 1.056512, 0.0175734, 1, 0, 0.09411765, 1,
2.114581, 1.141622, 1.700415, 1, 0, 0.09019608, 1,
2.143392, -0.1824357, 0.6154408, 1, 0, 0.08235294, 1,
2.150643, -0.2098688, 1.423114, 1, 0, 0.07843138, 1,
2.154573, 0.5632883, 1.929503, 1, 0, 0.07058824, 1,
2.154801, -1.255009, 0.3466388, 1, 0, 0.06666667, 1,
2.246883, 0.1195004, 1.97077, 1, 0, 0.05882353, 1,
2.248332, 0.4208947, 0.7829257, 1, 0, 0.05490196, 1,
2.249621, -1.203816, 2.364847, 1, 0, 0.04705882, 1,
2.269928, 1.807763, -0.5552722, 1, 0, 0.04313726, 1,
2.272758, -1.291376, 2.852653, 1, 0, 0.03529412, 1,
2.447854, 0.5603802, 1.028965, 1, 0, 0.03137255, 1,
2.457286, -0.7776686, 0.7372069, 1, 0, 0.02352941, 1,
2.599896, -1.934827, 3.122487, 1, 0, 0.01960784, 1,
2.645485, 1.126038, 1.158182, 1, 0, 0.01176471, 1,
3.628062, -0.3795671, 1.50073, 1, 0, 0.007843138, 1
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
0.08785129, -3.924905, -6.708562, 0, -0.5, 0.5, 0.5,
0.08785129, -3.924905, -6.708562, 1, -0.5, 0.5, 0.5,
0.08785129, -3.924905, -6.708562, 1, 1.5, 0.5, 0.5,
0.08785129, -3.924905, -6.708562, 0, 1.5, 0.5, 0.5
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
-4.65249, 0.05836928, -6.708562, 0, -0.5, 0.5, 0.5,
-4.65249, 0.05836928, -6.708562, 1, -0.5, 0.5, 0.5,
-4.65249, 0.05836928, -6.708562, 1, 1.5, 0.5, 0.5,
-4.65249, 0.05836928, -6.708562, 0, 1.5, 0.5, 0.5
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
-4.65249, -3.924905, 0.2616131, 0, -0.5, 0.5, 0.5,
-4.65249, -3.924905, 0.2616131, 1, -0.5, 0.5, 0.5,
-4.65249, -3.924905, 0.2616131, 1, 1.5, 0.5, 0.5,
-4.65249, -3.924905, 0.2616131, 0, 1.5, 0.5, 0.5
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
-2, -3.005688, -5.10006,
2, -3.005688, -5.10006,
-2, -3.005688, -5.10006,
-2, -3.158891, -5.368144,
0, -3.005688, -5.10006,
0, -3.158891, -5.368144,
2, -3.005688, -5.10006,
2, -3.158891, -5.368144
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
-2, -3.465297, -5.904311, 0, -0.5, 0.5, 0.5,
-2, -3.465297, -5.904311, 1, -0.5, 0.5, 0.5,
-2, -3.465297, -5.904311, 1, 1.5, 0.5, 0.5,
-2, -3.465297, -5.904311, 0, 1.5, 0.5, 0.5,
0, -3.465297, -5.904311, 0, -0.5, 0.5, 0.5,
0, -3.465297, -5.904311, 1, -0.5, 0.5, 0.5,
0, -3.465297, -5.904311, 1, 1.5, 0.5, 0.5,
0, -3.465297, -5.904311, 0, 1.5, 0.5, 0.5,
2, -3.465297, -5.904311, 0, -0.5, 0.5, 0.5,
2, -3.465297, -5.904311, 1, -0.5, 0.5, 0.5,
2, -3.465297, -5.904311, 1, 1.5, 0.5, 0.5,
2, -3.465297, -5.904311, 0, 1.5, 0.5, 0.5
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
-3.558565, -2, -5.10006,
-3.558565, 3, -5.10006,
-3.558565, -2, -5.10006,
-3.740886, -2, -5.368144,
-3.558565, -1, -5.10006,
-3.740886, -1, -5.368144,
-3.558565, 0, -5.10006,
-3.740886, 0, -5.368144,
-3.558565, 1, -5.10006,
-3.740886, 1, -5.368144,
-3.558565, 2, -5.10006,
-3.740886, 2, -5.368144,
-3.558565, 3, -5.10006,
-3.740886, 3, -5.368144
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
-4.105528, -2, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, -2, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, -2, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, -2, -5.904311, 0, 1.5, 0.5, 0.5,
-4.105528, -1, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, -1, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, -1, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, -1, -5.904311, 0, 1.5, 0.5, 0.5,
-4.105528, 0, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, 0, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, 0, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, 0, -5.904311, 0, 1.5, 0.5, 0.5,
-4.105528, 1, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, 1, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, 1, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, 1, -5.904311, 0, 1.5, 0.5, 0.5,
-4.105528, 2, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, 2, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, 2, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, 2, -5.904311, 0, 1.5, 0.5, 0.5,
-4.105528, 3, -5.904311, 0, -0.5, 0.5, 0.5,
-4.105528, 3, -5.904311, 1, -0.5, 0.5, 0.5,
-4.105528, 3, -5.904311, 1, 1.5, 0.5, 0.5,
-4.105528, 3, -5.904311, 0, 1.5, 0.5, 0.5
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
-3.558565, -3.005688, -4,
-3.558565, -3.005688, 4,
-3.558565, -3.005688, -4,
-3.740886, -3.158891, -4,
-3.558565, -3.005688, -2,
-3.740886, -3.158891, -2,
-3.558565, -3.005688, 0,
-3.740886, -3.158891, 0,
-3.558565, -3.005688, 2,
-3.740886, -3.158891, 2,
-3.558565, -3.005688, 4,
-3.740886, -3.158891, 4
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
-4.105528, -3.465297, -4, 0, -0.5, 0.5, 0.5,
-4.105528, -3.465297, -4, 1, -0.5, 0.5, 0.5,
-4.105528, -3.465297, -4, 1, 1.5, 0.5, 0.5,
-4.105528, -3.465297, -4, 0, 1.5, 0.5, 0.5,
-4.105528, -3.465297, -2, 0, -0.5, 0.5, 0.5,
-4.105528, -3.465297, -2, 1, -0.5, 0.5, 0.5,
-4.105528, -3.465297, -2, 1, 1.5, 0.5, 0.5,
-4.105528, -3.465297, -2, 0, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 0, 0, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 0, 1, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 0, 1, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 0, 0, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 2, 0, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 2, 1, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 2, 1, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 2, 0, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 4, 0, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 4, 1, -0.5, 0.5, 0.5,
-4.105528, -3.465297, 4, 1, 1.5, 0.5, 0.5,
-4.105528, -3.465297, 4, 0, 1.5, 0.5, 0.5
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
-3.558565, -3.005688, -5.10006,
-3.558565, 3.122427, -5.10006,
-3.558565, -3.005688, 5.623286,
-3.558565, 3.122427, 5.623286,
-3.558565, -3.005688, -5.10006,
-3.558565, -3.005688, 5.623286,
-3.558565, 3.122427, -5.10006,
-3.558565, 3.122427, 5.623286,
-3.558565, -3.005688, -5.10006,
3.734268, -3.005688, -5.10006,
-3.558565, -3.005688, 5.623286,
3.734268, -3.005688, 5.623286,
-3.558565, 3.122427, -5.10006,
3.734268, 3.122427, -5.10006,
-3.558565, 3.122427, 5.623286,
3.734268, 3.122427, 5.623286,
3.734268, -3.005688, -5.10006,
3.734268, 3.122427, -5.10006,
3.734268, -3.005688, 5.623286,
3.734268, 3.122427, 5.623286,
3.734268, -3.005688, -5.10006,
3.734268, -3.005688, 5.623286,
3.734268, 3.122427, -5.10006,
3.734268, 3.122427, 5.623286
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
var radius = 7.659027;
var distance = 34.07587;
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
mvMatrix.translate( -0.08785129, -0.05836928, -0.2616131 );
mvMatrix.scale( 1.135511, 1.351328, 0.7722487 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07587);
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

