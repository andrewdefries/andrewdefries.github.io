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
-3.418978, 0.8468041, -2.488411, 1, 0, 0, 1,
-3.170322, 0.9248053, -0.1565214, 1, 0.007843138, 0, 1,
-3.015388, -0.2453061, -2.47302, 1, 0.01176471, 0, 1,
-2.998845, -0.8154883, -0.5468616, 1, 0.01960784, 0, 1,
-2.812598, 0.9834346, -1.023304, 1, 0.02352941, 0, 1,
-2.635596, 0.4366311, -0.8417485, 1, 0.03137255, 0, 1,
-2.440575, -0.5000485, -0.4653041, 1, 0.03529412, 0, 1,
-2.435588, 0.1718933, -0.7880621, 1, 0.04313726, 0, 1,
-2.375623, 0.7468067, -1.268276, 1, 0.04705882, 0, 1,
-2.360085, -1.366, -2.633854, 1, 0.05490196, 0, 1,
-2.34769, 0.8525371, -1.193813, 1, 0.05882353, 0, 1,
-2.279305, -0.5473047, -0.8381589, 1, 0.06666667, 0, 1,
-2.263248, 1.98809, -1.194038, 1, 0.07058824, 0, 1,
-2.193254, -0.05529087, -1.563458, 1, 0.07843138, 0, 1,
-2.126535, -1.338631, -1.767648, 1, 0.08235294, 0, 1,
-2.113295, -1.281649, -1.339329, 1, 0.09019608, 0, 1,
-2.072445, -1.842597, -3.481203, 1, 0.09411765, 0, 1,
-2.064042, -0.2233375, -2.102577, 1, 0.1019608, 0, 1,
-2.041808, -0.5001712, -0.9938566, 1, 0.1098039, 0, 1,
-2.027306, -1.285933, -4.100646, 1, 0.1137255, 0, 1,
-2.004923, 0.6794595, -4.087583, 1, 0.1215686, 0, 1,
-1.979771, -0.03542001, -2.001011, 1, 0.1254902, 0, 1,
-1.977292, -0.09061607, 0.1544404, 1, 0.1333333, 0, 1,
-1.925951, -0.4465058, -0.9488436, 1, 0.1372549, 0, 1,
-1.920765, -1.011927, -0.7920374, 1, 0.145098, 0, 1,
-1.913832, -0.3132563, 0.5650613, 1, 0.1490196, 0, 1,
-1.898294, 1.915435, 0.09465084, 1, 0.1568628, 0, 1,
-1.873439, 1.149992, -1.506427, 1, 0.1607843, 0, 1,
-1.870462, -0.4937744, -3.846575, 1, 0.1686275, 0, 1,
-1.852564, 0.8656569, -2.598771, 1, 0.172549, 0, 1,
-1.827429, 0.02442465, -0.9941053, 1, 0.1803922, 0, 1,
-1.822443, -0.2225707, 0.2824292, 1, 0.1843137, 0, 1,
-1.822335, -1.55497, -0.3376035, 1, 0.1921569, 0, 1,
-1.812206, -0.4889826, -2.56412, 1, 0.1960784, 0, 1,
-1.791636, -0.7217181, -1.060439, 1, 0.2039216, 0, 1,
-1.776652, 0.1884957, -3.543711, 1, 0.2117647, 0, 1,
-1.770908, 1.029195, -0.6826322, 1, 0.2156863, 0, 1,
-1.769753, 1.69099, -1.631832, 1, 0.2235294, 0, 1,
-1.756886, -0.4190568, -3.374284, 1, 0.227451, 0, 1,
-1.735176, -1.564864, -1.007598, 1, 0.2352941, 0, 1,
-1.73009, -0.371885, 0.2633543, 1, 0.2392157, 0, 1,
-1.729246, -1.171209, -1.193831, 1, 0.2470588, 0, 1,
-1.708616, -0.158192, -1.21237, 1, 0.2509804, 0, 1,
-1.699043, -1.003468, -2.0759, 1, 0.2588235, 0, 1,
-1.696959, 0.3468222, -1.430299, 1, 0.2627451, 0, 1,
-1.691659, 0.5178698, -1.50739, 1, 0.2705882, 0, 1,
-1.687919, -1.606456, -2.475931, 1, 0.2745098, 0, 1,
-1.657598, 1.800305, -0.6580583, 1, 0.282353, 0, 1,
-1.654763, -0.9466735, -2.943784, 1, 0.2862745, 0, 1,
-1.64928, 0.8333645, -1.2344, 1, 0.2941177, 0, 1,
-1.645461, 1.104229, -1.482102, 1, 0.3019608, 0, 1,
-1.639793, 1.280004, -0.4296589, 1, 0.3058824, 0, 1,
-1.636515, -1.765636, -5.233719, 1, 0.3137255, 0, 1,
-1.63469, -0.7495351, -1.322186, 1, 0.3176471, 0, 1,
-1.624987, 0.4156204, -1.914072, 1, 0.3254902, 0, 1,
-1.598085, 0.08105499, -2.174686, 1, 0.3294118, 0, 1,
-1.591547, 0.8712147, -1.645325, 1, 0.3372549, 0, 1,
-1.583631, -1.549589, -3.751044, 1, 0.3411765, 0, 1,
-1.57389, 0.06862892, -3.468343, 1, 0.3490196, 0, 1,
-1.551237, -0.6204928, -3.738886, 1, 0.3529412, 0, 1,
-1.547006, -0.3441115, -2.238261, 1, 0.3607843, 0, 1,
-1.54462, -1.15895, -0.8126339, 1, 0.3647059, 0, 1,
-1.534017, 1.36017, -0.1806346, 1, 0.372549, 0, 1,
-1.522137, -0.7316714, -2.394701, 1, 0.3764706, 0, 1,
-1.519684, -1.5078, -1.998393, 1, 0.3843137, 0, 1,
-1.51763, 0.08567014, -2.603746, 1, 0.3882353, 0, 1,
-1.517503, 0.5611534, -1.520816, 1, 0.3960784, 0, 1,
-1.507379, 0.5772436, -2.31389, 1, 0.4039216, 0, 1,
-1.498055, -0.5526489, -0.4435792, 1, 0.4078431, 0, 1,
-1.48596, -1.433625, -2.530097, 1, 0.4156863, 0, 1,
-1.479078, -0.233988, -0.7493171, 1, 0.4196078, 0, 1,
-1.469145, 0.2880683, -1.783185, 1, 0.427451, 0, 1,
-1.468817, 0.2487893, -1.65304, 1, 0.4313726, 0, 1,
-1.465818, -0.7095942, -3.264409, 1, 0.4392157, 0, 1,
-1.465655, -0.8954803, -2.336847, 1, 0.4431373, 0, 1,
-1.463457, -1.099279, -1.690111, 1, 0.4509804, 0, 1,
-1.455919, -0.6621249, -0.8465583, 1, 0.454902, 0, 1,
-1.454784, 1.208645, -1.228344, 1, 0.4627451, 0, 1,
-1.450571, 0.3704338, -3.458955, 1, 0.4666667, 0, 1,
-1.44859, 0.7599414, 0.2777783, 1, 0.4745098, 0, 1,
-1.438446, -0.583839, -1.90698, 1, 0.4784314, 0, 1,
-1.437652, 0.5537778, 0.7210653, 1, 0.4862745, 0, 1,
-1.431919, 0.7701878, -1.070417, 1, 0.4901961, 0, 1,
-1.41617, 0.4335549, -2.071905, 1, 0.4980392, 0, 1,
-1.399319, 1.124315, -1.623357, 1, 0.5058824, 0, 1,
-1.384768, -0.1610275, -2.255545, 1, 0.509804, 0, 1,
-1.382571, 1.495014, -0.1229617, 1, 0.5176471, 0, 1,
-1.350141, -0.8177589, -2.032091, 1, 0.5215687, 0, 1,
-1.337491, -0.5091136, -2.532127, 1, 0.5294118, 0, 1,
-1.330355, -0.2522291, -1.425011, 1, 0.5333334, 0, 1,
-1.327114, -0.5690449, -1.599747, 1, 0.5411765, 0, 1,
-1.324048, -0.5652589, -1.418497, 1, 0.5450981, 0, 1,
-1.323893, -0.570476, -1.454034, 1, 0.5529412, 0, 1,
-1.317591, -0.9074827, -1.403828, 1, 0.5568628, 0, 1,
-1.31547, 0.4744914, -1.187218, 1, 0.5647059, 0, 1,
-1.306916, 1.919673, -0.2287158, 1, 0.5686275, 0, 1,
-1.295854, 0.0396556, -1.14597, 1, 0.5764706, 0, 1,
-1.291018, -0.8195192, -2.336679, 1, 0.5803922, 0, 1,
-1.285339, -0.02269389, -2.097751, 1, 0.5882353, 0, 1,
-1.275156, 0.3252691, -2.866737, 1, 0.5921569, 0, 1,
-1.270455, 0.8437868, -0.1361788, 1, 0.6, 0, 1,
-1.266318, 0.4597724, -1.793563, 1, 0.6078432, 0, 1,
-1.259734, 0.3115896, -1.807325, 1, 0.6117647, 0, 1,
-1.257017, 1.836682, 0.8456394, 1, 0.6196079, 0, 1,
-1.255925, -0.843237, -0.4695384, 1, 0.6235294, 0, 1,
-1.255337, 0.3093093, -1.363427, 1, 0.6313726, 0, 1,
-1.249313, 0.2938448, -2.464729, 1, 0.6352941, 0, 1,
-1.246859, 0.1720446, -1.439336, 1, 0.6431373, 0, 1,
-1.23992, 0.6183476, -0.5728464, 1, 0.6470588, 0, 1,
-1.232382, 0.9121407, -1.10165, 1, 0.654902, 0, 1,
-1.228418, 0.5962818, -1.913821, 1, 0.6588235, 0, 1,
-1.221704, 0.1197918, -1.190608, 1, 0.6666667, 0, 1,
-1.22088, 0.5947033, -2.584802, 1, 0.6705883, 0, 1,
-1.219631, -0.2326808, -0.3595498, 1, 0.6784314, 0, 1,
-1.217916, -2.010829, -0.7600771, 1, 0.682353, 0, 1,
-1.216562, 1.653464, 0.0511825, 1, 0.6901961, 0, 1,
-1.215701, 0.6358694, -0.7621564, 1, 0.6941177, 0, 1,
-1.213718, -0.4863194, -1.848182, 1, 0.7019608, 0, 1,
-1.212545, 0.2359497, -0.6357927, 1, 0.7098039, 0, 1,
-1.2109, 0.6138555, -0.4276572, 1, 0.7137255, 0, 1,
-1.209733, -1.366542, -1.240117, 1, 0.7215686, 0, 1,
-1.208361, 1.72701, -0.05111483, 1, 0.7254902, 0, 1,
-1.207848, 0.9638094, -2.513044, 1, 0.7333333, 0, 1,
-1.186457, 1.313054, -0.9300877, 1, 0.7372549, 0, 1,
-1.184026, 0.8970639, -0.7416851, 1, 0.7450981, 0, 1,
-1.174186, -0.4628748, -1.597314, 1, 0.7490196, 0, 1,
-1.173284, 0.3586297, -1.358874, 1, 0.7568628, 0, 1,
-1.167335, -1.834429, -1.645467, 1, 0.7607843, 0, 1,
-1.166669, -0.1077937, -1.536002, 1, 0.7686275, 0, 1,
-1.161665, -0.4859416, -3.480957, 1, 0.772549, 0, 1,
-1.158716, -0.2707317, -1.59768, 1, 0.7803922, 0, 1,
-1.150054, -2.601533, -3.532974, 1, 0.7843137, 0, 1,
-1.148641, -0.0314243, -4.143299, 1, 0.7921569, 0, 1,
-1.148088, -0.8786697, -3.073921, 1, 0.7960784, 0, 1,
-1.132487, -1.370603, -2.347193, 1, 0.8039216, 0, 1,
-1.125892, 0.118449, -2.511303, 1, 0.8117647, 0, 1,
-1.120188, 0.5600911, -1.076993, 1, 0.8156863, 0, 1,
-1.117708, 1.849806, -0.8901572, 1, 0.8235294, 0, 1,
-1.117263, 0.1742009, -0.9644242, 1, 0.827451, 0, 1,
-1.102815, 0.5996092, -0.6392575, 1, 0.8352941, 0, 1,
-1.095192, -0.9421206, -2.311064, 1, 0.8392157, 0, 1,
-1.086182, 0.920175, -1.001905, 1, 0.8470588, 0, 1,
-1.082127, 0.8290352, -1.029015, 1, 0.8509804, 0, 1,
-1.079332, -0.7445003, -1.539787, 1, 0.8588235, 0, 1,
-1.078624, -0.1983962, -2.343304, 1, 0.8627451, 0, 1,
-1.073429, 0.3323912, -1.447448, 1, 0.8705882, 0, 1,
-1.071501, 0.7207717, -1.456677, 1, 0.8745098, 0, 1,
-1.069777, 0.1531244, -2.508459, 1, 0.8823529, 0, 1,
-1.0695, -0.8257364, -1.500905, 1, 0.8862745, 0, 1,
-1.066881, -2.636843, -2.128685, 1, 0.8941177, 0, 1,
-1.061646, -1.251732, -3.885839, 1, 0.8980392, 0, 1,
-1.060264, 0.2775292, -1.887605, 1, 0.9058824, 0, 1,
-1.053918, 1.620525, 1.384061, 1, 0.9137255, 0, 1,
-1.052212, 0.6348947, -0.1949508, 1, 0.9176471, 0, 1,
-1.051488, 0.6846114, -0.5736673, 1, 0.9254902, 0, 1,
-1.04612, -0.7749006, -1.570964, 1, 0.9294118, 0, 1,
-1.045678, 0.2543174, -1.636611, 1, 0.9372549, 0, 1,
-1.040888, 1.404337, 0.3828245, 1, 0.9411765, 0, 1,
-1.036938, -1.289015, -4.354256, 1, 0.9490196, 0, 1,
-1.036484, -0.3773479, -1.976075, 1, 0.9529412, 0, 1,
-1.036474, 1.308455, -0.1468063, 1, 0.9607843, 0, 1,
-1.034313, 0.4484066, -1.510221, 1, 0.9647059, 0, 1,
-1.029059, 1.295873, -1.186375, 1, 0.972549, 0, 1,
-1.021263, -0.9027442, -2.589454, 1, 0.9764706, 0, 1,
-1.014255, -0.4678224, -0.5378261, 1, 0.9843137, 0, 1,
-1.013723, -0.9421348, -2.636157, 1, 0.9882353, 0, 1,
-1.011243, 0.2876983, -1.913378, 1, 0.9960784, 0, 1,
-1.008749, -0.6163608, -2.593453, 0.9960784, 1, 0, 1,
-1.00557, 0.01884141, -0.7779199, 0.9921569, 1, 0, 1,
-0.9994799, -0.696103, -1.15173, 0.9843137, 1, 0, 1,
-0.9989532, -0.3834776, 0.2728502, 0.9803922, 1, 0, 1,
-0.9857059, -0.3348502, -1.220386, 0.972549, 1, 0, 1,
-0.9713102, 0.3369419, -0.07717028, 0.9686275, 1, 0, 1,
-0.9690973, 1.988135, -2.515334, 0.9607843, 1, 0, 1,
-0.9648639, -0.4834433, -3.905914, 0.9568627, 1, 0, 1,
-0.9645151, -0.2175584, -1.144853, 0.9490196, 1, 0, 1,
-0.9631287, -0.5171832, -2.134038, 0.945098, 1, 0, 1,
-0.9554155, 0.9960995, -1.34812, 0.9372549, 1, 0, 1,
-0.9479232, -1.122036, -3.540801, 0.9333333, 1, 0, 1,
-0.9415699, 0.3949868, -0.0891629, 0.9254902, 1, 0, 1,
-0.9411896, 0.5785633, -1.270095, 0.9215686, 1, 0, 1,
-0.9405189, 1.154795, 0.1690956, 0.9137255, 1, 0, 1,
-0.9336023, 0.6934454, 0.05779137, 0.9098039, 1, 0, 1,
-0.9317924, -1.670282, -2.814487, 0.9019608, 1, 0, 1,
-0.9307232, -0.6209955, -1.5364, 0.8941177, 1, 0, 1,
-0.9299831, 0.007047241, -3.544358, 0.8901961, 1, 0, 1,
-0.9244506, 0.2794134, 1.49773, 0.8823529, 1, 0, 1,
-0.919758, -0.6761451, -0.8252919, 0.8784314, 1, 0, 1,
-0.9170819, 0.8001639, -0.3493314, 0.8705882, 1, 0, 1,
-0.9143965, -1.223646, -1.566299, 0.8666667, 1, 0, 1,
-0.913317, -0.3136528, -1.723179, 0.8588235, 1, 0, 1,
-0.9118809, -0.4450488, -1.022374, 0.854902, 1, 0, 1,
-0.9110652, -0.9628252, -1.16273, 0.8470588, 1, 0, 1,
-0.9005082, 0.932559, -1.666383, 0.8431373, 1, 0, 1,
-0.8999018, 0.7993548, 0.3450669, 0.8352941, 1, 0, 1,
-0.8858158, -0.7599587, -2.228163, 0.8313726, 1, 0, 1,
-0.8797078, 0.2526325, -1.764588, 0.8235294, 1, 0, 1,
-0.8794991, -0.147009, -0.6750396, 0.8196079, 1, 0, 1,
-0.8776665, 0.8437476, 0.6564832, 0.8117647, 1, 0, 1,
-0.8766527, -0.5447767, -3.84714, 0.8078431, 1, 0, 1,
-0.8723246, 0.9310669, -1.093703, 0.8, 1, 0, 1,
-0.8659436, 1.004085, 0.07280558, 0.7921569, 1, 0, 1,
-0.8635892, 0.1499164, -3.495171, 0.7882353, 1, 0, 1,
-0.8625617, 0.02526304, -2.89922, 0.7803922, 1, 0, 1,
-0.8539108, 0.2583493, -0.7486302, 0.7764706, 1, 0, 1,
-0.8492977, -1.401145, -3.847488, 0.7686275, 1, 0, 1,
-0.8454598, -0.2742102, -1.302227, 0.7647059, 1, 0, 1,
-0.844144, 1.509715, 0.468652, 0.7568628, 1, 0, 1,
-0.8423689, -0.7049215, -1.845882, 0.7529412, 1, 0, 1,
-0.8314302, -0.6236689, -3.358497, 0.7450981, 1, 0, 1,
-0.829689, -1.785393, -1.678792, 0.7411765, 1, 0, 1,
-0.8242694, 0.5249802, -1.006669, 0.7333333, 1, 0, 1,
-0.8185542, 1.636085, -1.335494, 0.7294118, 1, 0, 1,
-0.8177454, -0.02322263, -1.943673, 0.7215686, 1, 0, 1,
-0.8175793, 1.263097, 0.5000592, 0.7176471, 1, 0, 1,
-0.8077406, 0.7819319, -1.099658, 0.7098039, 1, 0, 1,
-0.8060146, 1.86491, 0.1114254, 0.7058824, 1, 0, 1,
-0.8040751, 1.141194, -0.6321439, 0.6980392, 1, 0, 1,
-0.800918, 2.247043, 0.01278815, 0.6901961, 1, 0, 1,
-0.7980449, 1.381901, -0.1261124, 0.6862745, 1, 0, 1,
-0.7979219, -0.3090415, -2.879714, 0.6784314, 1, 0, 1,
-0.7965892, -1.254744, -3.291325, 0.6745098, 1, 0, 1,
-0.7962674, 0.7148624, 0.5173658, 0.6666667, 1, 0, 1,
-0.7927014, -0.3334721, -0.1667052, 0.6627451, 1, 0, 1,
-0.7920148, 0.1129876, -1.321148, 0.654902, 1, 0, 1,
-0.7885131, -0.3758519, -1.759556, 0.6509804, 1, 0, 1,
-0.7878734, -0.3881325, -1.97595, 0.6431373, 1, 0, 1,
-0.7845488, -0.4851618, -1.838464, 0.6392157, 1, 0, 1,
-0.7800861, -0.5997356, -1.174532, 0.6313726, 1, 0, 1,
-0.7774053, -0.8972315, -1.908085, 0.627451, 1, 0, 1,
-0.7706519, 0.2721948, -2.369748, 0.6196079, 1, 0, 1,
-0.7702911, 0.1103443, -1.983491, 0.6156863, 1, 0, 1,
-0.7690519, -1.000824, -2.586916, 0.6078432, 1, 0, 1,
-0.7689645, -0.5415093, -2.67867, 0.6039216, 1, 0, 1,
-0.7688304, -0.3564878, -1.620864, 0.5960785, 1, 0, 1,
-0.7678825, 0.6117415, -0.5841836, 0.5882353, 1, 0, 1,
-0.7646319, -0.1070389, -2.567115, 0.5843138, 1, 0, 1,
-0.7569415, 0.8086037, -1.08229, 0.5764706, 1, 0, 1,
-0.7553081, -0.01900952, -1.725769, 0.572549, 1, 0, 1,
-0.7485073, -0.6031874, -2.317661, 0.5647059, 1, 0, 1,
-0.7480258, 0.3818408, -0.9918616, 0.5607843, 1, 0, 1,
-0.7477216, -0.4827724, -1.297886, 0.5529412, 1, 0, 1,
-0.7470769, 0.6639225, -0.4356967, 0.5490196, 1, 0, 1,
-0.7414869, -0.8078086, -2.05932, 0.5411765, 1, 0, 1,
-0.7352585, -0.366929, -2.642897, 0.5372549, 1, 0, 1,
-0.7333546, -1.236168, -2.884353, 0.5294118, 1, 0, 1,
-0.7248539, 0.3947905, -0.2234269, 0.5254902, 1, 0, 1,
-0.7158577, 0.8895037, 1.282069, 0.5176471, 1, 0, 1,
-0.7129425, -0.9592153, -2.29927, 0.5137255, 1, 0, 1,
-0.7122703, -1.367097, -2.06238, 0.5058824, 1, 0, 1,
-0.7113903, 0.1040377, -0.4803617, 0.5019608, 1, 0, 1,
-0.7060933, -0.5605959, -4.862023, 0.4941176, 1, 0, 1,
-0.7047142, 1.466122, -1.021647, 0.4862745, 1, 0, 1,
-0.7015575, -1.625676, -1.805473, 0.4823529, 1, 0, 1,
-0.6918168, 0.1682957, -0.0329938, 0.4745098, 1, 0, 1,
-0.6882852, -0.3231207, -3.692803, 0.4705882, 1, 0, 1,
-0.6845351, -0.9904276, -1.400065, 0.4627451, 1, 0, 1,
-0.6833653, 0.6288651, -0.9472364, 0.4588235, 1, 0, 1,
-0.6784504, -1.224212, -1.628986, 0.4509804, 1, 0, 1,
-0.6739256, -0.1502423, -1.78791, 0.4470588, 1, 0, 1,
-0.6696715, -1.039062, -1.014332, 0.4392157, 1, 0, 1,
-0.6614885, 0.9070761, -0.02718815, 0.4352941, 1, 0, 1,
-0.6602554, -0.5129538, -2.880662, 0.427451, 1, 0, 1,
-0.6593115, -0.01832903, -0.03165144, 0.4235294, 1, 0, 1,
-0.6495176, 0.1395519, -1.446872, 0.4156863, 1, 0, 1,
-0.6456204, -0.2813141, -1.577945, 0.4117647, 1, 0, 1,
-0.6454575, -0.09208619, -0.8117055, 0.4039216, 1, 0, 1,
-0.6413084, -1.544443, -3.466965, 0.3960784, 1, 0, 1,
-0.6353343, 1.355217, -0.434757, 0.3921569, 1, 0, 1,
-0.6341394, -1.471542, -3.469754, 0.3843137, 1, 0, 1,
-0.6336914, 0.0794414, -3.445342, 0.3803922, 1, 0, 1,
-0.6325107, 0.5579963, -0.594165, 0.372549, 1, 0, 1,
-0.6308201, -1.234228, -3.848296, 0.3686275, 1, 0, 1,
-0.621044, 1.166795, 0.2237803, 0.3607843, 1, 0, 1,
-0.6201982, 0.6232072, -3.278508, 0.3568628, 1, 0, 1,
-0.619732, 0.5521961, -0.155819, 0.3490196, 1, 0, 1,
-0.6183346, 0.4428425, -1.446235, 0.345098, 1, 0, 1,
-0.6163815, 0.2034672, -1.765121, 0.3372549, 1, 0, 1,
-0.6160927, -0.3255774, -4.235566, 0.3333333, 1, 0, 1,
-0.6160057, 0.02806867, -2.431247, 0.3254902, 1, 0, 1,
-0.6157581, 2.473001, 1.026346, 0.3215686, 1, 0, 1,
-0.6109793, 0.3194326, -1.707902, 0.3137255, 1, 0, 1,
-0.6075671, 0.3149272, -0.3501458, 0.3098039, 1, 0, 1,
-0.6042177, -0.5187166, -2.801255, 0.3019608, 1, 0, 1,
-0.5996763, 0.5748398, 0.474827, 0.2941177, 1, 0, 1,
-0.5982126, 1.797461, 1.690954, 0.2901961, 1, 0, 1,
-0.5963357, 0.4157419, 0.8665596, 0.282353, 1, 0, 1,
-0.589515, 1.71662, -1.235777, 0.2784314, 1, 0, 1,
-0.5881342, -0.6600727, -3.377723, 0.2705882, 1, 0, 1,
-0.5880419, -1.079641, -3.319487, 0.2666667, 1, 0, 1,
-0.5800373, 0.1842396, -0.5273452, 0.2588235, 1, 0, 1,
-0.572601, -1.162, -2.179101, 0.254902, 1, 0, 1,
-0.5709154, 2.340043, -1.064335, 0.2470588, 1, 0, 1,
-0.5705589, -0.005911979, -1.94346, 0.2431373, 1, 0, 1,
-0.5691131, -1.22748, -3.593437, 0.2352941, 1, 0, 1,
-0.5672223, -0.1504472, -2.458226, 0.2313726, 1, 0, 1,
-0.560531, 0.4714109, -0.2762584, 0.2235294, 1, 0, 1,
-0.5570668, -0.8742216, -3.741567, 0.2196078, 1, 0, 1,
-0.5564717, -0.430406, -1.598142, 0.2117647, 1, 0, 1,
-0.5546069, 0.1157813, -2.23771, 0.2078431, 1, 0, 1,
-0.5541869, 0.03394896, -2.654789, 0.2, 1, 0, 1,
-0.5535471, -1.612169, -3.825719, 0.1921569, 1, 0, 1,
-0.5508013, 0.3787896, -1.253101, 0.1882353, 1, 0, 1,
-0.5496144, -1.554129, -2.57298, 0.1803922, 1, 0, 1,
-0.5495321, -0.7815235, -1.029012, 0.1764706, 1, 0, 1,
-0.5490094, 0.06474789, -1.930462, 0.1686275, 1, 0, 1,
-0.5469838, 0.0128158, -0.8805982, 0.1647059, 1, 0, 1,
-0.5444637, 0.2871512, -1.020263, 0.1568628, 1, 0, 1,
-0.5404153, -0.349847, 0.2092686, 0.1529412, 1, 0, 1,
-0.5386038, 1.06887, 0.2459643, 0.145098, 1, 0, 1,
-0.5337015, -0.4352665, -2.490464, 0.1411765, 1, 0, 1,
-0.5321848, 0.1701519, -0.1996477, 0.1333333, 1, 0, 1,
-0.5313839, 0.3514392, -1.38305, 0.1294118, 1, 0, 1,
-0.530612, 0.3523055, -2.298259, 0.1215686, 1, 0, 1,
-0.5298432, 0.1548109, 0.2128423, 0.1176471, 1, 0, 1,
-0.5222991, -1.744775, -3.39466, 0.1098039, 1, 0, 1,
-0.5222354, -0.7405064, -2.99527, 0.1058824, 1, 0, 1,
-0.5158502, -0.8669778, -4.441724, 0.09803922, 1, 0, 1,
-0.5143552, 0.1606595, -2.576395, 0.09019608, 1, 0, 1,
-0.5140715, 0.7511851, -0.2604304, 0.08627451, 1, 0, 1,
-0.5140209, -1.268463, -3.230752, 0.07843138, 1, 0, 1,
-0.5117493, -1.108907, -3.658903, 0.07450981, 1, 0, 1,
-0.5064725, -0.302773, -2.875734, 0.06666667, 1, 0, 1,
-0.5031933, -0.9494252, -2.911458, 0.0627451, 1, 0, 1,
-0.4942207, -0.3600253, -2.710972, 0.05490196, 1, 0, 1,
-0.4926827, -1.545938, -3.414573, 0.05098039, 1, 0, 1,
-0.4897476, -0.152166, -0.07855963, 0.04313726, 1, 0, 1,
-0.4880224, -0.9409576, -3.620048, 0.03921569, 1, 0, 1,
-0.4863809, -1.067405, -3.195637, 0.03137255, 1, 0, 1,
-0.4853572, 0.7184867, -1.165629, 0.02745098, 1, 0, 1,
-0.4826909, 0.1227722, -2.147499, 0.01960784, 1, 0, 1,
-0.4821087, 0.3115907, -2.268541, 0.01568628, 1, 0, 1,
-0.4813667, 1.805963, -0.7798182, 0.007843138, 1, 0, 1,
-0.4813262, 1.138469, 1.222175, 0.003921569, 1, 0, 1,
-0.4765387, -0.4877861, -1.393783, 0, 1, 0.003921569, 1,
-0.4746499, -1.030771, -2.746156, 0, 1, 0.01176471, 1,
-0.4742335, 1.631651, -0.2583736, 0, 1, 0.01568628, 1,
-0.4721024, -1.114262, -2.480607, 0, 1, 0.02352941, 1,
-0.4711557, -0.09791256, -1.439622, 0, 1, 0.02745098, 1,
-0.4687129, -0.03950449, -3.240349, 0, 1, 0.03529412, 1,
-0.4611897, -0.8501157, -2.914898, 0, 1, 0.03921569, 1,
-0.4607182, 0.5647117, -1.923516, 0, 1, 0.04705882, 1,
-0.4570158, 0.4355989, 0.1477789, 0, 1, 0.05098039, 1,
-0.4567127, 0.4575822, 0.3699193, 0, 1, 0.05882353, 1,
-0.4556256, 1.060904, 1.554547, 0, 1, 0.0627451, 1,
-0.4539948, -0.4996334, -3.296474, 0, 1, 0.07058824, 1,
-0.4536119, 1.80872, 0.595223, 0, 1, 0.07450981, 1,
-0.4507354, -1.057258, -2.186851, 0, 1, 0.08235294, 1,
-0.4463564, 0.7635782, 0.5922712, 0, 1, 0.08627451, 1,
-0.4453948, -0.7385005, -1.078472, 0, 1, 0.09411765, 1,
-0.443426, -0.1420561, -3.160675, 0, 1, 0.1019608, 1,
-0.4392533, 0.8283092, -1.511685, 0, 1, 0.1058824, 1,
-0.436362, -0.2040074, -1.834634, 0, 1, 0.1137255, 1,
-0.4343927, 0.06738203, -1.143858, 0, 1, 0.1176471, 1,
-0.4329101, 0.5201107, 0.3503719, 0, 1, 0.1254902, 1,
-0.4285347, -0.6069643, -3.015284, 0, 1, 0.1294118, 1,
-0.4258697, -0.05910864, -0.5877494, 0, 1, 0.1372549, 1,
-0.4253064, 0.4309562, -2.291252, 0, 1, 0.1411765, 1,
-0.423694, -0.1612906, -2.949979, 0, 1, 0.1490196, 1,
-0.421996, 0.5739947, -0.5141535, 0, 1, 0.1529412, 1,
-0.4207304, -1.07098, -1.390787, 0, 1, 0.1607843, 1,
-0.4195222, 0.1736254, -1.654413, 0, 1, 0.1647059, 1,
-0.4194555, -0.4193015, -1.96324, 0, 1, 0.172549, 1,
-0.4191602, 0.4301609, -2.062033, 0, 1, 0.1764706, 1,
-0.4187224, 1.070502, 0.1660218, 0, 1, 0.1843137, 1,
-0.4160932, 1.063206, 0.2831946, 0, 1, 0.1882353, 1,
-0.4106437, 1.158199, -0.350116, 0, 1, 0.1960784, 1,
-0.4059106, -0.1145893, -2.00077, 0, 1, 0.2039216, 1,
-0.3991429, -0.3036084, -0.88907, 0, 1, 0.2078431, 1,
-0.3937756, 0.8100903, -0.132185, 0, 1, 0.2156863, 1,
-0.3932148, 0.1151808, -0.1357297, 0, 1, 0.2196078, 1,
-0.3910067, -1.120926, -3.008893, 0, 1, 0.227451, 1,
-0.3854505, -0.198481, -2.500238, 0, 1, 0.2313726, 1,
-0.3765413, 0.6084147, -0.6152638, 0, 1, 0.2392157, 1,
-0.3702798, -1.204741, -1.955299, 0, 1, 0.2431373, 1,
-0.3637061, 1.729696, -0.5684386, 0, 1, 0.2509804, 1,
-0.357682, -0.1919952, -1.000725, 0, 1, 0.254902, 1,
-0.3551054, 1.535295, 0.9619322, 0, 1, 0.2627451, 1,
-0.3550715, -0.4828109, -2.221068, 0, 1, 0.2666667, 1,
-0.3495821, -1.206339, -1.742705, 0, 1, 0.2745098, 1,
-0.349224, 0.4410778, 2.364677, 0, 1, 0.2784314, 1,
-0.3467143, 1.144231, 1.013223, 0, 1, 0.2862745, 1,
-0.3466169, -0.3264107, -2.557479, 0, 1, 0.2901961, 1,
-0.3438396, -1.946256, -2.761667, 0, 1, 0.2980392, 1,
-0.3411154, -1.747282, -4.123476, 0, 1, 0.3058824, 1,
-0.3408742, -0.5646558, -2.970972, 0, 1, 0.3098039, 1,
-0.3367698, 0.06216987, -2.099294, 0, 1, 0.3176471, 1,
-0.33474, 0.4802593, -0.08041394, 0, 1, 0.3215686, 1,
-0.330461, -0.7443178, -3.39448, 0, 1, 0.3294118, 1,
-0.3288595, -1.123601, -5.125254, 0, 1, 0.3333333, 1,
-0.3285594, -1.82823, -3.139453, 0, 1, 0.3411765, 1,
-0.3243711, 0.2708884, -0.9522613, 0, 1, 0.345098, 1,
-0.3219016, 0.5564121, -0.4072991, 0, 1, 0.3529412, 1,
-0.3202648, -1.688892, -3.663141, 0, 1, 0.3568628, 1,
-0.3163229, 0.4981856, -2.082054, 0, 1, 0.3647059, 1,
-0.314211, 1.998304, 1.412873, 0, 1, 0.3686275, 1,
-0.3089369, -0.4389246, -2.512582, 0, 1, 0.3764706, 1,
-0.308693, -0.04966985, -2.429581, 0, 1, 0.3803922, 1,
-0.3061146, -0.8956118, -2.120366, 0, 1, 0.3882353, 1,
-0.3040861, 1.266535, -1.840429, 0, 1, 0.3921569, 1,
-0.3018894, 0.1303945, -0.7368935, 0, 1, 0.4, 1,
-0.2948864, 1.134851, -0.1963763, 0, 1, 0.4078431, 1,
-0.2943264, 0.535189, -0.1701789, 0, 1, 0.4117647, 1,
-0.293875, 0.2494844, 0.2636739, 0, 1, 0.4196078, 1,
-0.2908994, 1.37649, 0.6527081, 0, 1, 0.4235294, 1,
-0.2883638, -0.3863095, -2.804151, 0, 1, 0.4313726, 1,
-0.2878856, -0.8188469, -3.273902, 0, 1, 0.4352941, 1,
-0.2804451, -0.5422342, -2.835047, 0, 1, 0.4431373, 1,
-0.2792607, 0.7522585, 0.467912, 0, 1, 0.4470588, 1,
-0.2790457, 2.069507, 0.2306223, 0, 1, 0.454902, 1,
-0.2759313, 0.5617781, 0.02919368, 0, 1, 0.4588235, 1,
-0.2751464, 1.601827, 1.706314, 0, 1, 0.4666667, 1,
-0.2721459, 1.165029, -0.3899106, 0, 1, 0.4705882, 1,
-0.2673213, 1.680696, -0.7620461, 0, 1, 0.4784314, 1,
-0.2656076, -1.744661, -3.576413, 0, 1, 0.4823529, 1,
-0.2647534, 0.5140609, 0.3003029, 0, 1, 0.4901961, 1,
-0.2609265, -1.235691, -0.8687971, 0, 1, 0.4941176, 1,
-0.2603509, -0.2366745, -1.003809, 0, 1, 0.5019608, 1,
-0.2583753, 0.1788458, 0.921348, 0, 1, 0.509804, 1,
-0.25102, 0.5216119, 0.1193944, 0, 1, 0.5137255, 1,
-0.2509575, -1.993547, -2.148317, 0, 1, 0.5215687, 1,
-0.2491156, -0.8055511, -3.790994, 0, 1, 0.5254902, 1,
-0.2433604, -0.5850244, -2.51815, 0, 1, 0.5333334, 1,
-0.2407493, -0.5953884, -2.961472, 0, 1, 0.5372549, 1,
-0.2403342, 0.1356145, 0.2550972, 0, 1, 0.5450981, 1,
-0.2389743, 0.9540971, 1.087056, 0, 1, 0.5490196, 1,
-0.238596, -0.6380955, -3.358232, 0, 1, 0.5568628, 1,
-0.2368004, -1.414253, -5.088131, 0, 1, 0.5607843, 1,
-0.2365375, 0.371703, -0.1550017, 0, 1, 0.5686275, 1,
-0.2364425, -0.1836031, -0.8683888, 0, 1, 0.572549, 1,
-0.2357419, 0.3391252, -1.813978, 0, 1, 0.5803922, 1,
-0.2338166, 2.242523, 0.294977, 0, 1, 0.5843138, 1,
-0.2289016, -0.8830046, -2.635478, 0, 1, 0.5921569, 1,
-0.2287998, 0.02486781, -2.439381, 0, 1, 0.5960785, 1,
-0.2225626, 1.30612, -0.003642335, 0, 1, 0.6039216, 1,
-0.2221334, 0.140406, -1.806496, 0, 1, 0.6117647, 1,
-0.2217494, 1.686518, -0.5917801, 0, 1, 0.6156863, 1,
-0.2216349, 0.6024317, -1.631431, 0, 1, 0.6235294, 1,
-0.2210594, 0.3198279, -0.6287436, 0, 1, 0.627451, 1,
-0.2175548, -0.753682, -1.866557, 0, 1, 0.6352941, 1,
-0.2168797, -0.7805033, -2.281886, 0, 1, 0.6392157, 1,
-0.2134208, 1.561857, 3.086127, 0, 1, 0.6470588, 1,
-0.2124914, 0.1553308, -2.52134, 0, 1, 0.6509804, 1,
-0.2092614, 1.186297, -0.8304059, 0, 1, 0.6588235, 1,
-0.20919, -1.293627, -3.102464, 0, 1, 0.6627451, 1,
-0.2086715, -0.1341037, -4.142013, 0, 1, 0.6705883, 1,
-0.2065341, -0.5351151, -5.032158, 0, 1, 0.6745098, 1,
-0.2032926, -0.2585095, -3.571965, 0, 1, 0.682353, 1,
-0.2032255, -0.8822181, -2.975505, 0, 1, 0.6862745, 1,
-0.2020884, -0.5089079, -2.626933, 0, 1, 0.6941177, 1,
-0.2007981, 0.2158063, -0.6683062, 0, 1, 0.7019608, 1,
-0.2003053, -1.1011, -3.213288, 0, 1, 0.7058824, 1,
-0.1993008, 0.7694476, 0.4217981, 0, 1, 0.7137255, 1,
-0.1980084, -1.069004, -3.343825, 0, 1, 0.7176471, 1,
-0.1970031, -0.6026819, -2.649026, 0, 1, 0.7254902, 1,
-0.1969765, -0.1256826, -2.102201, 0, 1, 0.7294118, 1,
-0.1965664, -0.7244663, -3.020667, 0, 1, 0.7372549, 1,
-0.1862896, -0.486915, -2.679813, 0, 1, 0.7411765, 1,
-0.1857107, 0.903771, 0.5951266, 0, 1, 0.7490196, 1,
-0.183501, -0.5279186, -1.515239, 0, 1, 0.7529412, 1,
-0.181947, 0.5434814, -0.1305275, 0, 1, 0.7607843, 1,
-0.1779687, 0.1110219, -1.193731, 0, 1, 0.7647059, 1,
-0.1749914, 0.4977388, -1.51292, 0, 1, 0.772549, 1,
-0.1728541, 0.6346455, -0.546329, 0, 1, 0.7764706, 1,
-0.1718781, 0.3335504, -0.2756258, 0, 1, 0.7843137, 1,
-0.1713956, 0.343338, -0.449318, 0, 1, 0.7882353, 1,
-0.1704011, 2.117001, -1.116864, 0, 1, 0.7960784, 1,
-0.1700479, -3.02361, -3.290999, 0, 1, 0.8039216, 1,
-0.1697762, 0.08618975, 0.1684834, 0, 1, 0.8078431, 1,
-0.1693888, -0.1471488, -3.226658, 0, 1, 0.8156863, 1,
-0.1645576, 0.4802801, 1.060506, 0, 1, 0.8196079, 1,
-0.16131, -0.9621061, -1.888902, 0, 1, 0.827451, 1,
-0.1563854, 2.406404, 1.58074, 0, 1, 0.8313726, 1,
-0.1511795, -1.707011, -4.843266, 0, 1, 0.8392157, 1,
-0.1492976, 0.6489453, -2.224456, 0, 1, 0.8431373, 1,
-0.1460111, -0.597159, -4.016948, 0, 1, 0.8509804, 1,
-0.1444531, 0.1889017, -1.71588, 0, 1, 0.854902, 1,
-0.1418712, -0.5966731, -3.486353, 0, 1, 0.8627451, 1,
-0.1352204, 2.917609, -0.03256868, 0, 1, 0.8666667, 1,
-0.1351708, 0.5059842, 0.4293188, 0, 1, 0.8745098, 1,
-0.132661, 0.6123988, 0.2671299, 0, 1, 0.8784314, 1,
-0.1292477, -1.141666, -3.548965, 0, 1, 0.8862745, 1,
-0.1286343, 0.2196787, -1.531742, 0, 1, 0.8901961, 1,
-0.1276631, 0.51994, -0.3789337, 0, 1, 0.8980392, 1,
-0.1259984, -0.8370652, -1.326392, 0, 1, 0.9058824, 1,
-0.1169421, -0.6804546, -0.989172, 0, 1, 0.9098039, 1,
-0.1150951, -0.6887369, -2.475948, 0, 1, 0.9176471, 1,
-0.1104815, 0.04053048, -0.6539996, 0, 1, 0.9215686, 1,
-0.106395, -1.308164, -4.988504, 0, 1, 0.9294118, 1,
-0.104514, 0.2911151, -0.8481423, 0, 1, 0.9333333, 1,
-0.1018306, 0.6123724, 2.083745, 0, 1, 0.9411765, 1,
-0.1008374, 0.3751021, -1.28604, 0, 1, 0.945098, 1,
-0.0999909, -0.4167915, -4.049155, 0, 1, 0.9529412, 1,
-0.09656054, -0.5443717, -3.488435, 0, 1, 0.9568627, 1,
-0.09642787, 0.7418944, 0.2643104, 0, 1, 0.9647059, 1,
-0.09020477, 1.505944, 0.1108317, 0, 1, 0.9686275, 1,
-0.0897489, 0.2655542, -0.8060357, 0, 1, 0.9764706, 1,
-0.08654729, -1.013933, -2.366935, 0, 1, 0.9803922, 1,
-0.07527644, -0.2940735, -4.859081, 0, 1, 0.9882353, 1,
-0.07376678, 0.1764403, -0.5501745, 0, 1, 0.9921569, 1,
-0.07281425, 0.4078459, 0.9311895, 0, 1, 1, 1,
-0.06656861, -0.4300355, -3.668852, 0, 0.9921569, 1, 1,
-0.06021941, 1.167039, 0.3692068, 0, 0.9882353, 1, 1,
-0.06020581, -0.2396243, -2.384823, 0, 0.9803922, 1, 1,
-0.05916407, 3.299732, -2.029166, 0, 0.9764706, 1, 1,
-0.05212942, 0.7092535, 0.03211254, 0, 0.9686275, 1, 1,
-0.05010803, 1.330286, 1.241435, 0, 0.9647059, 1, 1,
-0.04943052, 1.663336, 1.261424, 0, 0.9568627, 1, 1,
-0.0491689, -0.2748496, -3.380287, 0, 0.9529412, 1, 1,
-0.04711794, 0.7175478, -1.015389, 0, 0.945098, 1, 1,
-0.04520851, 0.9854254, 0.2158659, 0, 0.9411765, 1, 1,
-0.04478984, 0.1806764, -1.42832, 0, 0.9333333, 1, 1,
-0.04421453, -0.1913787, -3.566549, 0, 0.9294118, 1, 1,
-0.04048361, -0.8954658, -3.386471, 0, 0.9215686, 1, 1,
-0.03931841, 1.224606, -0.08867869, 0, 0.9176471, 1, 1,
-0.03505551, -0.5558318, -1.118961, 0, 0.9098039, 1, 1,
-0.03259622, 0.4834279, -2.016826, 0, 0.9058824, 1, 1,
-0.02662083, 0.3874618, 1.680539, 0, 0.8980392, 1, 1,
-0.02595916, 1.400618, -0.3684082, 0, 0.8901961, 1, 1,
-0.02383569, 0.7457278, -0.09445117, 0, 0.8862745, 1, 1,
-0.02253822, -0.6470685, -2.943601, 0, 0.8784314, 1, 1,
-0.0203731, -0.6882091, -2.45532, 0, 0.8745098, 1, 1,
-0.01611013, -0.9080663, -4.401141, 0, 0.8666667, 1, 1,
-0.01593921, -0.5706039, -2.562087, 0, 0.8627451, 1, 1,
-0.01385228, 0.5821587, -0.08273686, 0, 0.854902, 1, 1,
-0.01172253, -0.6390817, -4.671232, 0, 0.8509804, 1, 1,
-0.01156146, 1.384242, -0.3482964, 0, 0.8431373, 1, 1,
-0.008612293, 1.409809, 0.3199771, 0, 0.8392157, 1, 1,
-0.006420479, 0.9137674, 0.05938023, 0, 0.8313726, 1, 1,
-0.004972399, -0.8272353, -3.892117, 0, 0.827451, 1, 1,
-0.00492412, 1.756324, 1.875446, 0, 0.8196079, 1, 1,
-0.00371414, -0.2011413, -2.219069, 0, 0.8156863, 1, 1,
-0.002681844, 0.8346415, -0.6490308, 0, 0.8078431, 1, 1,
-0.002028992, -1.141505, -2.127245, 0, 0.8039216, 1, 1,
0.0007995016, -1.040089, 3.498653, 0, 0.7960784, 1, 1,
0.001147889, 0.08361187, 0.3664798, 0, 0.7882353, 1, 1,
0.001683379, -1.257554, 2.337139, 0, 0.7843137, 1, 1,
0.004375696, 0.2403142, 0.5225016, 0, 0.7764706, 1, 1,
0.006687496, 0.1385118, -0.04743984, 0, 0.772549, 1, 1,
0.008928284, 1.333115, -1.769774, 0, 0.7647059, 1, 1,
0.01026447, -0.2075612, 1.03214, 0, 0.7607843, 1, 1,
0.01171203, 1.220611, -0.5895281, 0, 0.7529412, 1, 1,
0.01769039, 1.284664, -0.2566156, 0, 0.7490196, 1, 1,
0.01939179, 1.277949, -1.655077, 0, 0.7411765, 1, 1,
0.02329955, -1.53002, 4.030707, 0, 0.7372549, 1, 1,
0.02336474, -0.005110742, 0.3395942, 0, 0.7294118, 1, 1,
0.02790289, -0.671607, 0.8742326, 0, 0.7254902, 1, 1,
0.0296125, -1.381209, 2.357759, 0, 0.7176471, 1, 1,
0.03650858, -1.425352, 3.157707, 0, 0.7137255, 1, 1,
0.04064799, -0.7328094, 3.632664, 0, 0.7058824, 1, 1,
0.0439494, 0.3671247, 1.159678, 0, 0.6980392, 1, 1,
0.04831017, -0.9773368, 3.531156, 0, 0.6941177, 1, 1,
0.04939906, -0.1160619, 3.793611, 0, 0.6862745, 1, 1,
0.05201985, 0.5316825, 1.056412, 0, 0.682353, 1, 1,
0.0537097, 1.599427, -0.1075221, 0, 0.6745098, 1, 1,
0.05634755, -0.2973847, 4.316413, 0, 0.6705883, 1, 1,
0.05730012, 1.413198, -0.3859096, 0, 0.6627451, 1, 1,
0.06073362, 0.6380253, -0.1551287, 0, 0.6588235, 1, 1,
0.06155504, 0.9364862, -0.9228789, 0, 0.6509804, 1, 1,
0.06387831, -1.157705, 2.824137, 0, 0.6470588, 1, 1,
0.0642457, -1.21346, 1.829662, 0, 0.6392157, 1, 1,
0.07077736, 0.06682, 1.164675, 0, 0.6352941, 1, 1,
0.07586774, -0.6323258, 4.446846, 0, 0.627451, 1, 1,
0.0760305, 0.05318113, -1.122681, 0, 0.6235294, 1, 1,
0.08055857, -0.5719331, 4.117427, 0, 0.6156863, 1, 1,
0.08151639, 0.6636967, 1.178175, 0, 0.6117647, 1, 1,
0.08428362, -0.3973181, 1.208595, 0, 0.6039216, 1, 1,
0.08545509, 2.057773, -0.2762396, 0, 0.5960785, 1, 1,
0.08682694, 0.2141494, 0.6437941, 0, 0.5921569, 1, 1,
0.08702773, -1.177681, 3.481993, 0, 0.5843138, 1, 1,
0.08718836, 0.7972696, 0.3472682, 0, 0.5803922, 1, 1,
0.08740559, 1.295903, 0.7050643, 0, 0.572549, 1, 1,
0.09332988, -0.1013585, 2.763317, 0, 0.5686275, 1, 1,
0.09434873, 1.378026, 1.836739, 0, 0.5607843, 1, 1,
0.09714735, -1.696614, 3.145713, 0, 0.5568628, 1, 1,
0.09725206, 0.9301953, 0.9042645, 0, 0.5490196, 1, 1,
0.09960689, 0.7323898, 1.307161, 0, 0.5450981, 1, 1,
0.1027398, 0.9142625, 0.5256158, 0, 0.5372549, 1, 1,
0.1063011, 0.09160472, 0.88539, 0, 0.5333334, 1, 1,
0.1063618, -0.9406207, 2.910631, 0, 0.5254902, 1, 1,
0.1126228, -1.288122, 3.595976, 0, 0.5215687, 1, 1,
0.1138576, -0.8831671, 2.766243, 0, 0.5137255, 1, 1,
0.1177255, 3.02458, -1.385827, 0, 0.509804, 1, 1,
0.1184496, -0.3909671, 4.045161, 0, 0.5019608, 1, 1,
0.1219692, -0.3618553, 4.361185, 0, 0.4941176, 1, 1,
0.1231139, -0.9695552, 4.401868, 0, 0.4901961, 1, 1,
0.1274824, 0.7690151, -0.357254, 0, 0.4823529, 1, 1,
0.1312926, 1.868533, -0.8967532, 0, 0.4784314, 1, 1,
0.133389, -1.773176, 2.517451, 0, 0.4705882, 1, 1,
0.1374714, 3.056634, 0.06107724, 0, 0.4666667, 1, 1,
0.1381734, -0.6634965, 2.403836, 0, 0.4588235, 1, 1,
0.1399888, -0.4255217, 3.189847, 0, 0.454902, 1, 1,
0.1410818, 0.1385805, 0.825377, 0, 0.4470588, 1, 1,
0.1531704, 0.3347398, 0.438484, 0, 0.4431373, 1, 1,
0.1545871, 0.4107794, -1.151546, 0, 0.4352941, 1, 1,
0.1570437, -1.193, 1.093958, 0, 0.4313726, 1, 1,
0.1571497, -1.2536, 3.150592, 0, 0.4235294, 1, 1,
0.1583968, -1.475758, 3.949985, 0, 0.4196078, 1, 1,
0.1595493, 0.6904791, 0.7623643, 0, 0.4117647, 1, 1,
0.1650922, -1.19504, 2.569114, 0, 0.4078431, 1, 1,
0.1693008, -0.6241653, 2.466067, 0, 0.4, 1, 1,
0.1769379, 0.7989324, -1.888016, 0, 0.3921569, 1, 1,
0.1809811, -0.5616553, 4.631782, 0, 0.3882353, 1, 1,
0.1814399, 0.2742786, 0.05745875, 0, 0.3803922, 1, 1,
0.1850672, -0.3300927, 2.212054, 0, 0.3764706, 1, 1,
0.1937291, 0.4170697, -2.119116, 0, 0.3686275, 1, 1,
0.1946174, 0.2229108, 0.946891, 0, 0.3647059, 1, 1,
0.1966065, -1.449266, 3.361645, 0, 0.3568628, 1, 1,
0.2044084, -0.5886675, 2.99905, 0, 0.3529412, 1, 1,
0.205799, -0.637164, 1.57367, 0, 0.345098, 1, 1,
0.2076366, -1.667744, 3.635403, 0, 0.3411765, 1, 1,
0.2076926, 0.686123, 1.39127, 0, 0.3333333, 1, 1,
0.2187056, 0.8267153, 1.675228, 0, 0.3294118, 1, 1,
0.2238128, -1.360701, 3.66158, 0, 0.3215686, 1, 1,
0.2246271, -0.85625, 1.684682, 0, 0.3176471, 1, 1,
0.2380984, -1.287151, 0.8162349, 0, 0.3098039, 1, 1,
0.2398957, -0.361938, 1.63275, 0, 0.3058824, 1, 1,
0.2415807, -0.4333862, 2.94281, 0, 0.2980392, 1, 1,
0.2480089, -1.303193, 3.679383, 0, 0.2901961, 1, 1,
0.2486659, -0.8606863, 3.817601, 0, 0.2862745, 1, 1,
0.2504056, 2.130358, -0.03760489, 0, 0.2784314, 1, 1,
0.2574032, 0.4142556, -0.6653024, 0, 0.2745098, 1, 1,
0.2576792, 0.3176948, 1.154486, 0, 0.2666667, 1, 1,
0.2601718, -1.166006, 2.264076, 0, 0.2627451, 1, 1,
0.2624498, 1.321998, 1.611719, 0, 0.254902, 1, 1,
0.2650874, 1.283828, -0.3725154, 0, 0.2509804, 1, 1,
0.2710464, 1.199301, -2.143745, 0, 0.2431373, 1, 1,
0.2724694, 0.5655218, 0.4219898, 0, 0.2392157, 1, 1,
0.2740859, 0.1347463, 1.138167, 0, 0.2313726, 1, 1,
0.2766492, -1.781427, 2.50433, 0, 0.227451, 1, 1,
0.2800795, 0.2045956, 1.045995, 0, 0.2196078, 1, 1,
0.281198, -0.1514554, 1.942699, 0, 0.2156863, 1, 1,
0.2819673, -0.04642714, 3.352363, 0, 0.2078431, 1, 1,
0.2830344, -0.7820377, 1.321695, 0, 0.2039216, 1, 1,
0.2873214, 0.4513294, 0.2189806, 0, 0.1960784, 1, 1,
0.2905737, 1.026968, 1.557468, 0, 0.1882353, 1, 1,
0.2919863, -1.477214, 3.257321, 0, 0.1843137, 1, 1,
0.2927085, 0.2329691, -0.1241863, 0, 0.1764706, 1, 1,
0.2936947, 0.6481764, 0.2215436, 0, 0.172549, 1, 1,
0.2965153, 1.619077, -1.086072, 0, 0.1647059, 1, 1,
0.2980159, 0.1199746, 0.007363242, 0, 0.1607843, 1, 1,
0.2986028, -0.7634488, 1.311107, 0, 0.1529412, 1, 1,
0.2997055, 0.04074397, 1.632434, 0, 0.1490196, 1, 1,
0.3061769, 0.4571367, 3.308902, 0, 0.1411765, 1, 1,
0.306183, -0.892976, 2.492048, 0, 0.1372549, 1, 1,
0.3136238, 0.5825461, 0.4787292, 0, 0.1294118, 1, 1,
0.3177208, 1.089601, 1.350233, 0, 0.1254902, 1, 1,
0.3196814, -0.6923628, 3.021148, 0, 0.1176471, 1, 1,
0.3242212, 1.092771, -0.1979282, 0, 0.1137255, 1, 1,
0.3294605, -0.0641971, 3.005279, 0, 0.1058824, 1, 1,
0.3307706, 1.630711, 0.3450989, 0, 0.09803922, 1, 1,
0.3339879, 0.7259124, 0.2083364, 0, 0.09411765, 1, 1,
0.3345196, 2.273757, 0.01277028, 0, 0.08627451, 1, 1,
0.3354703, -1.245277, 3.087176, 0, 0.08235294, 1, 1,
0.3360562, 0.1882513, 0.07723346, 0, 0.07450981, 1, 1,
0.3375362, 1.71466, 0.4228142, 0, 0.07058824, 1, 1,
0.3443012, 0.4571109, 2.399749, 0, 0.0627451, 1, 1,
0.3445694, 0.6360615, 1.311785, 0, 0.05882353, 1, 1,
0.3450615, -0.3900453, 2.027722, 0, 0.05098039, 1, 1,
0.3515132, -2.072582, 1.388937, 0, 0.04705882, 1, 1,
0.3535425, 0.9620321, 0.4874034, 0, 0.03921569, 1, 1,
0.3540437, 0.577438, 1.404734, 0, 0.03529412, 1, 1,
0.3562148, -2.404127, 1.786119, 0, 0.02745098, 1, 1,
0.3567947, 0.4504647, 1.815689, 0, 0.02352941, 1, 1,
0.357383, 1.904367, -0.2054115, 0, 0.01568628, 1, 1,
0.3605276, -1.237927, 3.741372, 0, 0.01176471, 1, 1,
0.3625338, -0.5175219, 1.73319, 0, 0.003921569, 1, 1,
0.3643245, 1.473196, 2.182557, 0.003921569, 0, 1, 1,
0.370576, -2.164934, 3.161286, 0.007843138, 0, 1, 1,
0.3725083, -0.2402402, 0.8284743, 0.01568628, 0, 1, 1,
0.3765869, -0.1127552, 2.639699, 0.01960784, 0, 1, 1,
0.3768845, -0.3934363, 2.605521, 0.02745098, 0, 1, 1,
0.3856292, -0.8807629, 3.569429, 0.03137255, 0, 1, 1,
0.3941666, -1.552069, 2.191259, 0.03921569, 0, 1, 1,
0.3945587, 0.09949782, 1.958047, 0.04313726, 0, 1, 1,
0.3951141, -0.9537817, 3.463931, 0.05098039, 0, 1, 1,
0.3968083, 0.3502539, 1.728005, 0.05490196, 0, 1, 1,
0.3969163, -0.212239, 1.524818, 0.0627451, 0, 1, 1,
0.3984288, -0.8688735, 2.18003, 0.06666667, 0, 1, 1,
0.4005849, 0.5896941, -0.6384447, 0.07450981, 0, 1, 1,
0.4065308, -1.632564, 4.815048, 0.07843138, 0, 1, 1,
0.4140136, 0.2743986, -0.2621533, 0.08627451, 0, 1, 1,
0.4145069, 1.245132, 1.977379, 0.09019608, 0, 1, 1,
0.4151439, -0.3470459, 2.026827, 0.09803922, 0, 1, 1,
0.4154097, 0.2720696, -0.4734702, 0.1058824, 0, 1, 1,
0.416438, -0.4847892, 2.564627, 0.1098039, 0, 1, 1,
0.4200993, -1.321121, 2.295136, 0.1176471, 0, 1, 1,
0.42342, -1.928758, 4.048138, 0.1215686, 0, 1, 1,
0.4271458, 0.2434217, 2.58586, 0.1294118, 0, 1, 1,
0.4308933, 0.1355721, 2.843295, 0.1333333, 0, 1, 1,
0.4333437, 0.3767957, 1.634221, 0.1411765, 0, 1, 1,
0.4361005, -0.1338947, 1.173089, 0.145098, 0, 1, 1,
0.4406061, -1.533872, 5.114542, 0.1529412, 0, 1, 1,
0.4424286, -1.191224, 3.758811, 0.1568628, 0, 1, 1,
0.4439698, -2.563109, 2.574973, 0.1647059, 0, 1, 1,
0.4440288, 0.8837053, 0.4629501, 0.1686275, 0, 1, 1,
0.4454667, 0.7402101, -0.3011758, 0.1764706, 0, 1, 1,
0.4498354, -1.129788, 3.860187, 0.1803922, 0, 1, 1,
0.4536566, -1.394475, 1.889328, 0.1882353, 0, 1, 1,
0.4592867, -1.902552, 2.714702, 0.1921569, 0, 1, 1,
0.4604192, -0.1442288, 2.487659, 0.2, 0, 1, 1,
0.462282, 0.01365109, 0.5581918, 0.2078431, 0, 1, 1,
0.4637902, -0.9576748, 1.632501, 0.2117647, 0, 1, 1,
0.4641253, -1.124023, 3.169742, 0.2196078, 0, 1, 1,
0.4654295, -1.087566, 3.828751, 0.2235294, 0, 1, 1,
0.4675175, 0.8049632, 0.4660052, 0.2313726, 0, 1, 1,
0.4708569, 0.6236939, 1.049156, 0.2352941, 0, 1, 1,
0.4710386, 0.7389641, -1.106432, 0.2431373, 0, 1, 1,
0.4725467, 0.4998538, -0.4244201, 0.2470588, 0, 1, 1,
0.4748654, -0.6563358, 2.353173, 0.254902, 0, 1, 1,
0.4771678, -1.245648, 1.79321, 0.2588235, 0, 1, 1,
0.4775121, 1.194217, 1.38015, 0.2666667, 0, 1, 1,
0.4780317, 0.2646104, -0.196956, 0.2705882, 0, 1, 1,
0.484078, 0.682337, 1.03422, 0.2784314, 0, 1, 1,
0.48452, 0.7687858, 0.7065371, 0.282353, 0, 1, 1,
0.4881106, -1.840954, 2.933497, 0.2901961, 0, 1, 1,
0.4914609, 0.6673506, 0.4797965, 0.2941177, 0, 1, 1,
0.4974266, 1.931122, 0.2075425, 0.3019608, 0, 1, 1,
0.5050402, 0.3352346, -0.1571935, 0.3098039, 0, 1, 1,
0.505205, 1.140818, -0.1774487, 0.3137255, 0, 1, 1,
0.5078605, -0.7373725, 2.033208, 0.3215686, 0, 1, 1,
0.5089, 0.1838647, 0.9185297, 0.3254902, 0, 1, 1,
0.5090939, -0.9015417, 0.9111536, 0.3333333, 0, 1, 1,
0.5110672, -0.1794014, 3.078444, 0.3372549, 0, 1, 1,
0.5127386, 0.6426127, 1.610235, 0.345098, 0, 1, 1,
0.5138441, -1.475972, 3.079996, 0.3490196, 0, 1, 1,
0.5176075, -0.6660443, 2.9691, 0.3568628, 0, 1, 1,
0.5184794, 0.08539657, 2.173544, 0.3607843, 0, 1, 1,
0.5197552, 0.6300142, 0.4195974, 0.3686275, 0, 1, 1,
0.5208524, 1.067661, -1.163622, 0.372549, 0, 1, 1,
0.5218353, 0.02006445, 1.478219, 0.3803922, 0, 1, 1,
0.5289317, -0.9681845, 4.228544, 0.3843137, 0, 1, 1,
0.5319501, -0.0410049, 0.898773, 0.3921569, 0, 1, 1,
0.5348372, -0.1912362, 1.467255, 0.3960784, 0, 1, 1,
0.5378714, -0.2648731, 3.40764, 0.4039216, 0, 1, 1,
0.5410678, 0.08581831, 1.627833, 0.4117647, 0, 1, 1,
0.5478809, 1.109966, 0.8049008, 0.4156863, 0, 1, 1,
0.5623794, 0.8000481, -0.3380486, 0.4235294, 0, 1, 1,
0.5664279, 0.04087956, 0.8444983, 0.427451, 0, 1, 1,
0.5668317, -1.353995, 2.281374, 0.4352941, 0, 1, 1,
0.5693693, -0.7048114, 3.390621, 0.4392157, 0, 1, 1,
0.5725996, 0.2094519, 0.9069149, 0.4470588, 0, 1, 1,
0.5726233, 1.397464, 0.8785549, 0.4509804, 0, 1, 1,
0.5730635, 0.2332257, 1.656965, 0.4588235, 0, 1, 1,
0.5775321, 0.04167461, 1.854216, 0.4627451, 0, 1, 1,
0.5782414, 0.3472164, 3.08106, 0.4705882, 0, 1, 1,
0.5822151, -0.7164832, 2.189837, 0.4745098, 0, 1, 1,
0.5824924, 0.9744415, 1.520596, 0.4823529, 0, 1, 1,
0.5825444, -0.2846866, 2.615646, 0.4862745, 0, 1, 1,
0.5841464, -0.3097427, 0.782437, 0.4941176, 0, 1, 1,
0.5870237, -1.243429, 2.289631, 0.5019608, 0, 1, 1,
0.5929123, -0.5833259, 4.438565, 0.5058824, 0, 1, 1,
0.5934086, -0.3291835, 2.524545, 0.5137255, 0, 1, 1,
0.59451, -0.02931874, 1.851206, 0.5176471, 0, 1, 1,
0.6030816, 0.2872586, -0.2512753, 0.5254902, 0, 1, 1,
0.6040015, -0.723069, 2.334381, 0.5294118, 0, 1, 1,
0.6049131, 0.04690347, 1.872039, 0.5372549, 0, 1, 1,
0.6079795, -0.1296832, 2.00136, 0.5411765, 0, 1, 1,
0.6084199, -0.09875248, 1.848289, 0.5490196, 0, 1, 1,
0.6112406, 0.3016002, 2.4234, 0.5529412, 0, 1, 1,
0.612062, 0.3108588, 0.439855, 0.5607843, 0, 1, 1,
0.6147405, -0.207598, 3.097139, 0.5647059, 0, 1, 1,
0.6302111, 0.8951238, 0.3981321, 0.572549, 0, 1, 1,
0.6305897, -1.043337, 2.523485, 0.5764706, 0, 1, 1,
0.6370123, -0.09452838, 1.563185, 0.5843138, 0, 1, 1,
0.6391894, -1.153018, 3.093602, 0.5882353, 0, 1, 1,
0.6438405, -0.8059798, 2.373531, 0.5960785, 0, 1, 1,
0.6480301, 0.9293526, 0.07081403, 0.6039216, 0, 1, 1,
0.6535476, 0.7239388, 0.573889, 0.6078432, 0, 1, 1,
0.6600109, -0.02982325, 1.136714, 0.6156863, 0, 1, 1,
0.6637221, 0.72451, 1.082667, 0.6196079, 0, 1, 1,
0.6663886, 0.910171, 0.8990456, 0.627451, 0, 1, 1,
0.6713899, 0.8508022, 0.4213779, 0.6313726, 0, 1, 1,
0.6728935, -1.178847, 3.816935, 0.6392157, 0, 1, 1,
0.6772273, -0.5676948, 2.059482, 0.6431373, 0, 1, 1,
0.6817368, -0.4719172, 1.202446, 0.6509804, 0, 1, 1,
0.6956363, 0.9673077, 0.8793169, 0.654902, 0, 1, 1,
0.696525, 0.09010919, 1.406644, 0.6627451, 0, 1, 1,
0.7008457, 0.5930282, 0.3801477, 0.6666667, 0, 1, 1,
0.70458, 0.6917533, 2.18865, 0.6745098, 0, 1, 1,
0.7152326, -0.7751768, 2.020164, 0.6784314, 0, 1, 1,
0.7200214, 0.09610651, 1.333919, 0.6862745, 0, 1, 1,
0.7262012, 1.127964, 1.000175, 0.6901961, 0, 1, 1,
0.7301518, 1.421556, 0.7890033, 0.6980392, 0, 1, 1,
0.7305815, 1.891919, -0.3615921, 0.7058824, 0, 1, 1,
0.733669, 0.1638106, 2.538072, 0.7098039, 0, 1, 1,
0.7348104, -0.08358179, 1.669646, 0.7176471, 0, 1, 1,
0.7361841, 0.506178, 1.249411, 0.7215686, 0, 1, 1,
0.7401507, -1.588404, 1.769916, 0.7294118, 0, 1, 1,
0.7467087, -0.5011205, 1.502506, 0.7333333, 0, 1, 1,
0.7508528, 0.2519492, 2.10373, 0.7411765, 0, 1, 1,
0.7561247, 0.5264434, 0.2744909, 0.7450981, 0, 1, 1,
0.758509, 1.193667, -0.4689167, 0.7529412, 0, 1, 1,
0.7685834, -0.8706102, 0.7768752, 0.7568628, 0, 1, 1,
0.7703683, 0.01665448, 0.8954915, 0.7647059, 0, 1, 1,
0.7729411, 1.230399, 0.3755335, 0.7686275, 0, 1, 1,
0.7749674, 0.6507547, 2.570036, 0.7764706, 0, 1, 1,
0.7828528, 2.120693, 0.8336775, 0.7803922, 0, 1, 1,
0.7842947, 0.9712508, 0.2040257, 0.7882353, 0, 1, 1,
0.7914531, 0.3654423, 0.8509896, 0.7921569, 0, 1, 1,
0.7917188, 1.786742, -0.06981611, 0.8, 0, 1, 1,
0.8135988, -0.9218029, 2.339775, 0.8078431, 0, 1, 1,
0.8172601, 0.8745306, 0.8500617, 0.8117647, 0, 1, 1,
0.826152, 0.2212582, 1.47622, 0.8196079, 0, 1, 1,
0.8265259, -0.581856, 2.11436, 0.8235294, 0, 1, 1,
0.8270398, 2.937196, -0.6260884, 0.8313726, 0, 1, 1,
0.8298629, 0.4738552, 0.4643502, 0.8352941, 0, 1, 1,
0.8303539, -0.3860505, 3.246909, 0.8431373, 0, 1, 1,
0.83287, 0.7428187, 1.518878, 0.8470588, 0, 1, 1,
0.8365285, 0.04716573, 1.02399, 0.854902, 0, 1, 1,
0.8369644, -0.7165159, 4.021085, 0.8588235, 0, 1, 1,
0.8380559, 0.1815098, 1.600481, 0.8666667, 0, 1, 1,
0.8426599, 0.06115891, 1.126863, 0.8705882, 0, 1, 1,
0.8455734, 1.312546, 0.752974, 0.8784314, 0, 1, 1,
0.8473418, -1.337566, 3.321413, 0.8823529, 0, 1, 1,
0.8572819, -1.015423, 1.900051, 0.8901961, 0, 1, 1,
0.8595397, 0.4857987, 0.8779842, 0.8941177, 0, 1, 1,
0.8596866, -0.08200476, 1.405416, 0.9019608, 0, 1, 1,
0.8639641, 0.2246488, -0.2794517, 0.9098039, 0, 1, 1,
0.8739178, -0.7198109, 2.400491, 0.9137255, 0, 1, 1,
0.8803057, -0.512126, 1.987165, 0.9215686, 0, 1, 1,
0.8826917, -0.1667555, 1.981345, 0.9254902, 0, 1, 1,
0.8842223, 0.4809076, -0.8068807, 0.9333333, 0, 1, 1,
0.8844504, 0.2700803, 1.064459, 0.9372549, 0, 1, 1,
0.887181, -0.3372455, 2.073459, 0.945098, 0, 1, 1,
0.8933916, 0.7857515, -0.5153106, 0.9490196, 0, 1, 1,
0.9076807, 1.798489, -0.3994583, 0.9568627, 0, 1, 1,
0.9157853, 0.8060923, 1.794, 0.9607843, 0, 1, 1,
0.917923, -0.6597777, 3.232556, 0.9686275, 0, 1, 1,
0.9213655, -2.219905, 3.500186, 0.972549, 0, 1, 1,
0.9220135, -0.7780136, 2.919558, 0.9803922, 0, 1, 1,
0.9256726, -0.6919634, 2.243316, 0.9843137, 0, 1, 1,
0.9381834, 0.9758388, 1.097514, 0.9921569, 0, 1, 1,
0.9391429, 2.917979, -0.5936897, 0.9960784, 0, 1, 1,
0.9471906, 0.185887, 3.654746, 1, 0, 0.9960784, 1,
0.9511098, 1.014865, -0.3944436, 1, 0, 0.9882353, 1,
0.9631149, 0.4886726, 0.6636711, 1, 0, 0.9843137, 1,
0.9704264, 0.7740551, 2.038421, 1, 0, 0.9764706, 1,
0.9742979, 0.6070108, 1.877962, 1, 0, 0.972549, 1,
0.9869037, -0.2436711, 2.205234, 1, 0, 0.9647059, 1,
0.9932942, 0.02664659, 0.2927414, 1, 0, 0.9607843, 1,
0.9986347, -0.8800205, 4.317193, 1, 0, 0.9529412, 1,
1.002815, 0.1620047, 2.204578, 1, 0, 0.9490196, 1,
1.005669, 0.3542982, 0.9599394, 1, 0, 0.9411765, 1,
1.008448, -1.568904, 2.920452, 1, 0, 0.9372549, 1,
1.009557, 0.2755088, 3.239318, 1, 0, 0.9294118, 1,
1.017804, 0.6104159, 1.652355, 1, 0, 0.9254902, 1,
1.018759, 0.2257133, 1.583911, 1, 0, 0.9176471, 1,
1.030942, -0.851658, 2.925071, 1, 0, 0.9137255, 1,
1.032765, 0.8119608, 0.1492205, 1, 0, 0.9058824, 1,
1.032883, 0.08717079, 1.95805, 1, 0, 0.9019608, 1,
1.033482, 1.158979, 1.368433, 1, 0, 0.8941177, 1,
1.033728, 1.234614, -0.6867442, 1, 0, 0.8862745, 1,
1.040028, -0.7698984, -0.2367246, 1, 0, 0.8823529, 1,
1.045426, 0.7226501, 1.026534, 1, 0, 0.8745098, 1,
1.046351, -0.2219928, 2.431436, 1, 0, 0.8705882, 1,
1.04809, 0.7092535, 1.038763, 1, 0, 0.8627451, 1,
1.055296, 0.2286381, 0.5233822, 1, 0, 0.8588235, 1,
1.063468, -0.0852604, 0.9727696, 1, 0, 0.8509804, 1,
1.067624, 0.2809249, 1.908009, 1, 0, 0.8470588, 1,
1.070386, 0.4546639, 1.296361, 1, 0, 0.8392157, 1,
1.072901, 0.1416061, 0.3882592, 1, 0, 0.8352941, 1,
1.078264, 1.174013, 1.683235, 1, 0, 0.827451, 1,
1.080351, -0.09422213, 1.382885, 1, 0, 0.8235294, 1,
1.08057, -1.342036, 1.948673, 1, 0, 0.8156863, 1,
1.081627, 0.5770513, 1.497651, 1, 0, 0.8117647, 1,
1.082498, -0.9582189, 2.802468, 1, 0, 0.8039216, 1,
1.086743, -0.659965, 2.345839, 1, 0, 0.7960784, 1,
1.089746, -1.361959, 2.803446, 1, 0, 0.7921569, 1,
1.095039, 1.932381, 2.769346, 1, 0, 0.7843137, 1,
1.101328, -0.3566319, 2.532207, 1, 0, 0.7803922, 1,
1.101863, 0.07784589, 0.1718294, 1, 0, 0.772549, 1,
1.102057, 0.9275, 1.800204, 1, 0, 0.7686275, 1,
1.103001, -0.1916574, 1.423923, 1, 0, 0.7607843, 1,
1.107514, 0.2130776, 2.083273, 1, 0, 0.7568628, 1,
1.110889, 1.755372, 0.646612, 1, 0, 0.7490196, 1,
1.115064, 0.2302652, 0.896927, 1, 0, 0.7450981, 1,
1.130191, 1.562521, -1.563169, 1, 0, 0.7372549, 1,
1.138187, -0.6867803, 4.148228, 1, 0, 0.7333333, 1,
1.140772, 0.09513006, 1.444279, 1, 0, 0.7254902, 1,
1.143399, -0.3266551, 2.886744, 1, 0, 0.7215686, 1,
1.146485, 2.196349, 1.444828, 1, 0, 0.7137255, 1,
1.15213, 0.6650676, 0.9013896, 1, 0, 0.7098039, 1,
1.153588, -0.3634544, 0.1584165, 1, 0, 0.7019608, 1,
1.161935, -0.7299273, 3.699835, 1, 0, 0.6941177, 1,
1.164158, -2.09972, 3.835727, 1, 0, 0.6901961, 1,
1.169003, -0.1315419, 3.529152, 1, 0, 0.682353, 1,
1.170895, -0.2652177, 0.5757207, 1, 0, 0.6784314, 1,
1.173143, -1.829723, 2.897235, 1, 0, 0.6705883, 1,
1.188567, 2.114249, 1.190553, 1, 0, 0.6666667, 1,
1.190593, -0.07478594, 2.719079, 1, 0, 0.6588235, 1,
1.192826, 0.4414333, 1.28883, 1, 0, 0.654902, 1,
1.194968, 0.562063, 0.6908778, 1, 0, 0.6470588, 1,
1.199185, -0.3625697, 1.166067, 1, 0, 0.6431373, 1,
1.203406, -0.7191285, 3.293396, 1, 0, 0.6352941, 1,
1.207235, -2.28216, 3.013478, 1, 0, 0.6313726, 1,
1.207494, -0.6665457, 2.636212, 1, 0, 0.6235294, 1,
1.214496, -1.578595, 2.710737, 1, 0, 0.6196079, 1,
1.215727, -0.4942027, 1.942256, 1, 0, 0.6117647, 1,
1.218271, 0.8249428, 2.291836, 1, 0, 0.6078432, 1,
1.225139, -1.476547, 1.797988, 1, 0, 0.6, 1,
1.22743, -0.3725932, 1.017167, 1, 0, 0.5921569, 1,
1.235685, 0.3389055, 0.5564373, 1, 0, 0.5882353, 1,
1.237165, -1.216239, 2.646713, 1, 0, 0.5803922, 1,
1.24204, -0.1243221, -0.01509989, 1, 0, 0.5764706, 1,
1.244076, 0.4567572, 1.089835, 1, 0, 0.5686275, 1,
1.253242, -1.13688, 2.881114, 1, 0, 0.5647059, 1,
1.271342, 0.3923124, -0.4703182, 1, 0, 0.5568628, 1,
1.279909, 0.5536346, 3.594655, 1, 0, 0.5529412, 1,
1.288991, 1.022167, 0.5519189, 1, 0, 0.5450981, 1,
1.29427, 0.4221416, 2.52622, 1, 0, 0.5411765, 1,
1.295386, 0.1483731, 0.3467622, 1, 0, 0.5333334, 1,
1.299474, -0.8701549, 3.813392, 1, 0, 0.5294118, 1,
1.305406, -0.2095838, 1.661781, 1, 0, 0.5215687, 1,
1.305879, -1.110492, 4.507297, 1, 0, 0.5176471, 1,
1.314123, -0.825875, 2.755014, 1, 0, 0.509804, 1,
1.314127, -1.563982, 3.170211, 1, 0, 0.5058824, 1,
1.316286, -0.5851883, 2.41554, 1, 0, 0.4980392, 1,
1.328208, -0.9881516, 2.718414, 1, 0, 0.4901961, 1,
1.341107, -0.7614416, 2.290953, 1, 0, 0.4862745, 1,
1.345108, 0.5465024, 0.4760544, 1, 0, 0.4784314, 1,
1.34729, -0.4738384, 0.179912, 1, 0, 0.4745098, 1,
1.354061, 0.9104152, 1.557508, 1, 0, 0.4666667, 1,
1.360461, -0.2676383, 2.276592, 1, 0, 0.4627451, 1,
1.362592, 1.971458, 2.014318, 1, 0, 0.454902, 1,
1.370919, 0.5587232, -0.6432443, 1, 0, 0.4509804, 1,
1.385735, 1.197446, 1.480905, 1, 0, 0.4431373, 1,
1.386828, -0.5252792, 2.992455, 1, 0, 0.4392157, 1,
1.390395, -0.3686143, 1.248657, 1, 0, 0.4313726, 1,
1.40057, -0.3176114, -0.08148268, 1, 0, 0.427451, 1,
1.411131, 1.077484, 0.1457096, 1, 0, 0.4196078, 1,
1.414446, -1.888454, 3.022753, 1, 0, 0.4156863, 1,
1.415366, 0.2090117, 0.8706381, 1, 0, 0.4078431, 1,
1.416937, 1.10513, 1.489808, 1, 0, 0.4039216, 1,
1.425974, -2.163827, 1.811055, 1, 0, 0.3960784, 1,
1.428938, -0.1581803, 1.643159, 1, 0, 0.3882353, 1,
1.440361, 1.505792, 0.2582699, 1, 0, 0.3843137, 1,
1.44309, -1.213234, 1.321621, 1, 0, 0.3764706, 1,
1.449699, 2.073698, -0.0827933, 1, 0, 0.372549, 1,
1.461647, -0.9813196, 2.322002, 1, 0, 0.3647059, 1,
1.464176, -0.7560865, 1.33944, 1, 0, 0.3607843, 1,
1.469552, -2.081919, 1.110875, 1, 0, 0.3529412, 1,
1.475908, 0.4279178, 0.2862332, 1, 0, 0.3490196, 1,
1.477856, -0.4784468, 1.604874, 1, 0, 0.3411765, 1,
1.486359, -0.3918808, 2.67307, 1, 0, 0.3372549, 1,
1.500662, 1.799532, 0.8788843, 1, 0, 0.3294118, 1,
1.521525, 0.129296, 0.8033372, 1, 0, 0.3254902, 1,
1.532759, 1.509154, -0.4595836, 1, 0, 0.3176471, 1,
1.536241, 0.7773411, 2.778712, 1, 0, 0.3137255, 1,
1.542714, -0.9375409, 3.064177, 1, 0, 0.3058824, 1,
1.553164, -0.04693014, 3.709999, 1, 0, 0.2980392, 1,
1.578006, 1.393825, 0.4611038, 1, 0, 0.2941177, 1,
1.581272, -0.2395702, 1.678226, 1, 0, 0.2862745, 1,
1.605893, 0.1630694, 1.164869, 1, 0, 0.282353, 1,
1.611288, -0.2418992, -0.05769432, 1, 0, 0.2745098, 1,
1.615081, 0.06976289, 2.926816, 1, 0, 0.2705882, 1,
1.630413, 1.201307, 0.9827652, 1, 0, 0.2627451, 1,
1.648152, -0.6350212, 1.938889, 1, 0, 0.2588235, 1,
1.657378, 0.2077685, 1.960149, 1, 0, 0.2509804, 1,
1.668446, 0.632439, 1.461588, 1, 0, 0.2470588, 1,
1.671209, 0.5614573, 0.7320802, 1, 0, 0.2392157, 1,
1.693868, 0.8716021, 0.5275503, 1, 0, 0.2352941, 1,
1.69497, 1.217559, 0.2911283, 1, 0, 0.227451, 1,
1.7049, -0.247634, 1.390399, 1, 0, 0.2235294, 1,
1.722308, -1.14755, 1.297341, 1, 0, 0.2156863, 1,
1.729181, 0.7324162, 0.1107999, 1, 0, 0.2117647, 1,
1.729313, -0.03933332, 0.04450861, 1, 0, 0.2039216, 1,
1.743422, -0.5360379, 2.204379, 1, 0, 0.1960784, 1,
1.748254, -1.313826, 0.3139221, 1, 0, 0.1921569, 1,
1.757387, 0.5047439, 0.4929582, 1, 0, 0.1843137, 1,
1.778219, -0.3986438, 1.378748, 1, 0, 0.1803922, 1,
1.788485, -0.8490327, 3.336498, 1, 0, 0.172549, 1,
1.791498, -0.07307131, 1.723568, 1, 0, 0.1686275, 1,
1.794376, -1.369057, 2.18233, 1, 0, 0.1607843, 1,
1.795275, -1.903139, 1.460661, 1, 0, 0.1568628, 1,
1.803956, -0.9189153, 2.886126, 1, 0, 0.1490196, 1,
1.810623, -1.171593, 1.830637, 1, 0, 0.145098, 1,
1.816901, 0.8050177, 3.110831, 1, 0, 0.1372549, 1,
1.862694, -0.1897784, 2.228637, 1, 0, 0.1333333, 1,
1.903218, -1.193093, 2.316823, 1, 0, 0.1254902, 1,
1.905292, 0.6345885, 1.126694, 1, 0, 0.1215686, 1,
1.934442, 1.527958, 0.3279372, 1, 0, 0.1137255, 1,
1.99772, -0.01067758, 1.064895, 1, 0, 0.1098039, 1,
2.023053, -0.0533714, 1.540993, 1, 0, 0.1019608, 1,
2.123995, 0.3554291, 1.75811, 1, 0, 0.09411765, 1,
2.243345, -0.01754491, 1.206548, 1, 0, 0.09019608, 1,
2.315278, 0.6655607, 1.150629, 1, 0, 0.08235294, 1,
2.325214, -0.926747, 1.931296, 1, 0, 0.07843138, 1,
2.366885, -0.442192, 2.252766, 1, 0, 0.07058824, 1,
2.374408, -0.5716279, 0.9647591, 1, 0, 0.06666667, 1,
2.404414, 0.3763846, 2.51869, 1, 0, 0.05882353, 1,
2.451441, -1.251122, 3.873996, 1, 0, 0.05490196, 1,
2.550979, -0.8706576, 3.599223, 1, 0, 0.04705882, 1,
2.593012, -0.6253663, 2.249636, 1, 0, 0.04313726, 1,
2.715317, -0.6137777, 1.991312, 1, 0, 0.03529412, 1,
2.71784, 2.411267, -0.1882761, 1, 0, 0.03137255, 1,
2.814612, -1.186336, 2.0602, 1, 0, 0.02352941, 1,
2.872579, 0.1782539, 3.116189, 1, 0, 0.01960784, 1,
2.879794, 0.219732, 1.073995, 1, 0, 0.01176471, 1,
3.188276, 0.4715959, 0.2189852, 1, 0, 0.007843138, 1
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
-0.1153507, -4.095417, -6.98775, 0, -0.5, 0.5, 0.5,
-0.1153507, -4.095417, -6.98775, 1, -0.5, 0.5, 0.5,
-0.1153507, -4.095417, -6.98775, 1, 1.5, 0.5, 0.5,
-0.1153507, -4.095417, -6.98775, 0, 1.5, 0.5, 0.5
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
-4.538908, 0.1380609, -6.98775, 0, -0.5, 0.5, 0.5,
-4.538908, 0.1380609, -6.98775, 1, -0.5, 0.5, 0.5,
-4.538908, 0.1380609, -6.98775, 1, 1.5, 0.5, 0.5,
-4.538908, 0.1380609, -6.98775, 0, 1.5, 0.5, 0.5
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
-4.538908, -4.095417, -0.05958891, 0, -0.5, 0.5, 0.5,
-4.538908, -4.095417, -0.05958891, 1, -0.5, 0.5, 0.5,
-4.538908, -4.095417, -0.05958891, 1, 1.5, 0.5, 0.5,
-4.538908, -4.095417, -0.05958891, 0, 1.5, 0.5, 0.5
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
-3, -3.11846, -5.388943,
3, -3.11846, -5.388943,
-3, -3.11846, -5.388943,
-3, -3.281286, -5.655411,
-2, -3.11846, -5.388943,
-2, -3.281286, -5.655411,
-1, -3.11846, -5.388943,
-1, -3.281286, -5.655411,
0, -3.11846, -5.388943,
0, -3.281286, -5.655411,
1, -3.11846, -5.388943,
1, -3.281286, -5.655411,
2, -3.11846, -5.388943,
2, -3.281286, -5.655411,
3, -3.11846, -5.388943,
3, -3.281286, -5.655411
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
-3, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
-3, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
-3, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
-3, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
-2, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
-2, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
-2, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
-2, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
-1, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
-1, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
-1, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
-1, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
0, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
0, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
0, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
0, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
1, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
1, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
1, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
1, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
2, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
2, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
2, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
2, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5,
3, -3.606939, -6.188346, 0, -0.5, 0.5, 0.5,
3, -3.606939, -6.188346, 1, -0.5, 0.5, 0.5,
3, -3.606939, -6.188346, 1, 1.5, 0.5, 0.5,
3, -3.606939, -6.188346, 0, 1.5, 0.5, 0.5
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
-3.518086, -3, -5.388943,
-3.518086, 3, -5.388943,
-3.518086, -3, -5.388943,
-3.688223, -3, -5.655411,
-3.518086, -2, -5.388943,
-3.688223, -2, -5.655411,
-3.518086, -1, -5.388943,
-3.688223, -1, -5.655411,
-3.518086, 0, -5.388943,
-3.688223, 0, -5.655411,
-3.518086, 1, -5.388943,
-3.688223, 1, -5.655411,
-3.518086, 2, -5.388943,
-3.688223, 2, -5.655411,
-3.518086, 3, -5.388943,
-3.688223, 3, -5.655411
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
-4.028497, -3, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, -3, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, -3, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, -3, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, -2, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, -2, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, -2, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, -2, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, -1, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, -1, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, -1, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, -1, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, 0, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, 0, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, 0, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, 0, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, 1, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, 1, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, 1, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, 1, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, 2, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, 2, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, 2, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, 2, -6.188346, 0, 1.5, 0.5, 0.5,
-4.028497, 3, -6.188346, 0, -0.5, 0.5, 0.5,
-4.028497, 3, -6.188346, 1, -0.5, 0.5, 0.5,
-4.028497, 3, -6.188346, 1, 1.5, 0.5, 0.5,
-4.028497, 3, -6.188346, 0, 1.5, 0.5, 0.5
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
-3.518086, -3.11846, -4,
-3.518086, -3.11846, 4,
-3.518086, -3.11846, -4,
-3.688223, -3.281286, -4,
-3.518086, -3.11846, -2,
-3.688223, -3.281286, -2,
-3.518086, -3.11846, 0,
-3.688223, -3.281286, 0,
-3.518086, -3.11846, 2,
-3.688223, -3.281286, 2,
-3.518086, -3.11846, 4,
-3.688223, -3.281286, 4
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
-4.028497, -3.606939, -4, 0, -0.5, 0.5, 0.5,
-4.028497, -3.606939, -4, 1, -0.5, 0.5, 0.5,
-4.028497, -3.606939, -4, 1, 1.5, 0.5, 0.5,
-4.028497, -3.606939, -4, 0, 1.5, 0.5, 0.5,
-4.028497, -3.606939, -2, 0, -0.5, 0.5, 0.5,
-4.028497, -3.606939, -2, 1, -0.5, 0.5, 0.5,
-4.028497, -3.606939, -2, 1, 1.5, 0.5, 0.5,
-4.028497, -3.606939, -2, 0, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 0, 0, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 0, 1, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 0, 1, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 0, 0, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 2, 0, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 2, 1, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 2, 1, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 2, 0, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 4, 0, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 4, 1, -0.5, 0.5, 0.5,
-4.028497, -3.606939, 4, 1, 1.5, 0.5, 0.5,
-4.028497, -3.606939, 4, 0, 1.5, 0.5, 0.5
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
-3.518086, -3.11846, -5.388943,
-3.518086, 3.394582, -5.388943,
-3.518086, -3.11846, 5.269765,
-3.518086, 3.394582, 5.269765,
-3.518086, -3.11846, -5.388943,
-3.518086, -3.11846, 5.269765,
-3.518086, 3.394582, -5.388943,
-3.518086, 3.394582, 5.269765,
-3.518086, -3.11846, -5.388943,
3.287385, -3.11846, -5.388943,
-3.518086, -3.11846, 5.269765,
3.287385, -3.11846, 5.269765,
-3.518086, 3.394582, -5.388943,
3.287385, 3.394582, -5.388943,
-3.518086, 3.394582, 5.269765,
3.287385, 3.394582, 5.269765,
3.287385, -3.11846, -5.388943,
3.287385, 3.394582, -5.388943,
3.287385, -3.11846, 5.269765,
3.287385, 3.394582, 5.269765,
3.287385, -3.11846, -5.388943,
3.287385, -3.11846, 5.269765,
3.287385, 3.394582, -5.388943,
3.287385, 3.394582, 5.269765
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
var radius = 7.595717;
var distance = 33.7942;
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
mvMatrix.translate( 0.1153507, -0.1380609, 0.05958891 );
mvMatrix.scale( 1.20677, 1.260952, 0.7705096 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7942);
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
Clothianidin<-read.table("Clothianidin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Clothianidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Clothianidin' not found
```

```r
y<-Clothianidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Clothianidin' not found
```

```r
z<-Clothianidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Clothianidin' not found
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
-3.418978, 0.8468041, -2.488411, 0, 0, 1, 1, 1,
-3.170322, 0.9248053, -0.1565214, 1, 0, 0, 1, 1,
-3.015388, -0.2453061, -2.47302, 1, 0, 0, 1, 1,
-2.998845, -0.8154883, -0.5468616, 1, 0, 0, 1, 1,
-2.812598, 0.9834346, -1.023304, 1, 0, 0, 1, 1,
-2.635596, 0.4366311, -0.8417485, 1, 0, 0, 1, 1,
-2.440575, -0.5000485, -0.4653041, 0, 0, 0, 1, 1,
-2.435588, 0.1718933, -0.7880621, 0, 0, 0, 1, 1,
-2.375623, 0.7468067, -1.268276, 0, 0, 0, 1, 1,
-2.360085, -1.366, -2.633854, 0, 0, 0, 1, 1,
-2.34769, 0.8525371, -1.193813, 0, 0, 0, 1, 1,
-2.279305, -0.5473047, -0.8381589, 0, 0, 0, 1, 1,
-2.263248, 1.98809, -1.194038, 0, 0, 0, 1, 1,
-2.193254, -0.05529087, -1.563458, 1, 1, 1, 1, 1,
-2.126535, -1.338631, -1.767648, 1, 1, 1, 1, 1,
-2.113295, -1.281649, -1.339329, 1, 1, 1, 1, 1,
-2.072445, -1.842597, -3.481203, 1, 1, 1, 1, 1,
-2.064042, -0.2233375, -2.102577, 1, 1, 1, 1, 1,
-2.041808, -0.5001712, -0.9938566, 1, 1, 1, 1, 1,
-2.027306, -1.285933, -4.100646, 1, 1, 1, 1, 1,
-2.004923, 0.6794595, -4.087583, 1, 1, 1, 1, 1,
-1.979771, -0.03542001, -2.001011, 1, 1, 1, 1, 1,
-1.977292, -0.09061607, 0.1544404, 1, 1, 1, 1, 1,
-1.925951, -0.4465058, -0.9488436, 1, 1, 1, 1, 1,
-1.920765, -1.011927, -0.7920374, 1, 1, 1, 1, 1,
-1.913832, -0.3132563, 0.5650613, 1, 1, 1, 1, 1,
-1.898294, 1.915435, 0.09465084, 1, 1, 1, 1, 1,
-1.873439, 1.149992, -1.506427, 1, 1, 1, 1, 1,
-1.870462, -0.4937744, -3.846575, 0, 0, 1, 1, 1,
-1.852564, 0.8656569, -2.598771, 1, 0, 0, 1, 1,
-1.827429, 0.02442465, -0.9941053, 1, 0, 0, 1, 1,
-1.822443, -0.2225707, 0.2824292, 1, 0, 0, 1, 1,
-1.822335, -1.55497, -0.3376035, 1, 0, 0, 1, 1,
-1.812206, -0.4889826, -2.56412, 1, 0, 0, 1, 1,
-1.791636, -0.7217181, -1.060439, 0, 0, 0, 1, 1,
-1.776652, 0.1884957, -3.543711, 0, 0, 0, 1, 1,
-1.770908, 1.029195, -0.6826322, 0, 0, 0, 1, 1,
-1.769753, 1.69099, -1.631832, 0, 0, 0, 1, 1,
-1.756886, -0.4190568, -3.374284, 0, 0, 0, 1, 1,
-1.735176, -1.564864, -1.007598, 0, 0, 0, 1, 1,
-1.73009, -0.371885, 0.2633543, 0, 0, 0, 1, 1,
-1.729246, -1.171209, -1.193831, 1, 1, 1, 1, 1,
-1.708616, -0.158192, -1.21237, 1, 1, 1, 1, 1,
-1.699043, -1.003468, -2.0759, 1, 1, 1, 1, 1,
-1.696959, 0.3468222, -1.430299, 1, 1, 1, 1, 1,
-1.691659, 0.5178698, -1.50739, 1, 1, 1, 1, 1,
-1.687919, -1.606456, -2.475931, 1, 1, 1, 1, 1,
-1.657598, 1.800305, -0.6580583, 1, 1, 1, 1, 1,
-1.654763, -0.9466735, -2.943784, 1, 1, 1, 1, 1,
-1.64928, 0.8333645, -1.2344, 1, 1, 1, 1, 1,
-1.645461, 1.104229, -1.482102, 1, 1, 1, 1, 1,
-1.639793, 1.280004, -0.4296589, 1, 1, 1, 1, 1,
-1.636515, -1.765636, -5.233719, 1, 1, 1, 1, 1,
-1.63469, -0.7495351, -1.322186, 1, 1, 1, 1, 1,
-1.624987, 0.4156204, -1.914072, 1, 1, 1, 1, 1,
-1.598085, 0.08105499, -2.174686, 1, 1, 1, 1, 1,
-1.591547, 0.8712147, -1.645325, 0, 0, 1, 1, 1,
-1.583631, -1.549589, -3.751044, 1, 0, 0, 1, 1,
-1.57389, 0.06862892, -3.468343, 1, 0, 0, 1, 1,
-1.551237, -0.6204928, -3.738886, 1, 0, 0, 1, 1,
-1.547006, -0.3441115, -2.238261, 1, 0, 0, 1, 1,
-1.54462, -1.15895, -0.8126339, 1, 0, 0, 1, 1,
-1.534017, 1.36017, -0.1806346, 0, 0, 0, 1, 1,
-1.522137, -0.7316714, -2.394701, 0, 0, 0, 1, 1,
-1.519684, -1.5078, -1.998393, 0, 0, 0, 1, 1,
-1.51763, 0.08567014, -2.603746, 0, 0, 0, 1, 1,
-1.517503, 0.5611534, -1.520816, 0, 0, 0, 1, 1,
-1.507379, 0.5772436, -2.31389, 0, 0, 0, 1, 1,
-1.498055, -0.5526489, -0.4435792, 0, 0, 0, 1, 1,
-1.48596, -1.433625, -2.530097, 1, 1, 1, 1, 1,
-1.479078, -0.233988, -0.7493171, 1, 1, 1, 1, 1,
-1.469145, 0.2880683, -1.783185, 1, 1, 1, 1, 1,
-1.468817, 0.2487893, -1.65304, 1, 1, 1, 1, 1,
-1.465818, -0.7095942, -3.264409, 1, 1, 1, 1, 1,
-1.465655, -0.8954803, -2.336847, 1, 1, 1, 1, 1,
-1.463457, -1.099279, -1.690111, 1, 1, 1, 1, 1,
-1.455919, -0.6621249, -0.8465583, 1, 1, 1, 1, 1,
-1.454784, 1.208645, -1.228344, 1, 1, 1, 1, 1,
-1.450571, 0.3704338, -3.458955, 1, 1, 1, 1, 1,
-1.44859, 0.7599414, 0.2777783, 1, 1, 1, 1, 1,
-1.438446, -0.583839, -1.90698, 1, 1, 1, 1, 1,
-1.437652, 0.5537778, 0.7210653, 1, 1, 1, 1, 1,
-1.431919, 0.7701878, -1.070417, 1, 1, 1, 1, 1,
-1.41617, 0.4335549, -2.071905, 1, 1, 1, 1, 1,
-1.399319, 1.124315, -1.623357, 0, 0, 1, 1, 1,
-1.384768, -0.1610275, -2.255545, 1, 0, 0, 1, 1,
-1.382571, 1.495014, -0.1229617, 1, 0, 0, 1, 1,
-1.350141, -0.8177589, -2.032091, 1, 0, 0, 1, 1,
-1.337491, -0.5091136, -2.532127, 1, 0, 0, 1, 1,
-1.330355, -0.2522291, -1.425011, 1, 0, 0, 1, 1,
-1.327114, -0.5690449, -1.599747, 0, 0, 0, 1, 1,
-1.324048, -0.5652589, -1.418497, 0, 0, 0, 1, 1,
-1.323893, -0.570476, -1.454034, 0, 0, 0, 1, 1,
-1.317591, -0.9074827, -1.403828, 0, 0, 0, 1, 1,
-1.31547, 0.4744914, -1.187218, 0, 0, 0, 1, 1,
-1.306916, 1.919673, -0.2287158, 0, 0, 0, 1, 1,
-1.295854, 0.0396556, -1.14597, 0, 0, 0, 1, 1,
-1.291018, -0.8195192, -2.336679, 1, 1, 1, 1, 1,
-1.285339, -0.02269389, -2.097751, 1, 1, 1, 1, 1,
-1.275156, 0.3252691, -2.866737, 1, 1, 1, 1, 1,
-1.270455, 0.8437868, -0.1361788, 1, 1, 1, 1, 1,
-1.266318, 0.4597724, -1.793563, 1, 1, 1, 1, 1,
-1.259734, 0.3115896, -1.807325, 1, 1, 1, 1, 1,
-1.257017, 1.836682, 0.8456394, 1, 1, 1, 1, 1,
-1.255925, -0.843237, -0.4695384, 1, 1, 1, 1, 1,
-1.255337, 0.3093093, -1.363427, 1, 1, 1, 1, 1,
-1.249313, 0.2938448, -2.464729, 1, 1, 1, 1, 1,
-1.246859, 0.1720446, -1.439336, 1, 1, 1, 1, 1,
-1.23992, 0.6183476, -0.5728464, 1, 1, 1, 1, 1,
-1.232382, 0.9121407, -1.10165, 1, 1, 1, 1, 1,
-1.228418, 0.5962818, -1.913821, 1, 1, 1, 1, 1,
-1.221704, 0.1197918, -1.190608, 1, 1, 1, 1, 1,
-1.22088, 0.5947033, -2.584802, 0, 0, 1, 1, 1,
-1.219631, -0.2326808, -0.3595498, 1, 0, 0, 1, 1,
-1.217916, -2.010829, -0.7600771, 1, 0, 0, 1, 1,
-1.216562, 1.653464, 0.0511825, 1, 0, 0, 1, 1,
-1.215701, 0.6358694, -0.7621564, 1, 0, 0, 1, 1,
-1.213718, -0.4863194, -1.848182, 1, 0, 0, 1, 1,
-1.212545, 0.2359497, -0.6357927, 0, 0, 0, 1, 1,
-1.2109, 0.6138555, -0.4276572, 0, 0, 0, 1, 1,
-1.209733, -1.366542, -1.240117, 0, 0, 0, 1, 1,
-1.208361, 1.72701, -0.05111483, 0, 0, 0, 1, 1,
-1.207848, 0.9638094, -2.513044, 0, 0, 0, 1, 1,
-1.186457, 1.313054, -0.9300877, 0, 0, 0, 1, 1,
-1.184026, 0.8970639, -0.7416851, 0, 0, 0, 1, 1,
-1.174186, -0.4628748, -1.597314, 1, 1, 1, 1, 1,
-1.173284, 0.3586297, -1.358874, 1, 1, 1, 1, 1,
-1.167335, -1.834429, -1.645467, 1, 1, 1, 1, 1,
-1.166669, -0.1077937, -1.536002, 1, 1, 1, 1, 1,
-1.161665, -0.4859416, -3.480957, 1, 1, 1, 1, 1,
-1.158716, -0.2707317, -1.59768, 1, 1, 1, 1, 1,
-1.150054, -2.601533, -3.532974, 1, 1, 1, 1, 1,
-1.148641, -0.0314243, -4.143299, 1, 1, 1, 1, 1,
-1.148088, -0.8786697, -3.073921, 1, 1, 1, 1, 1,
-1.132487, -1.370603, -2.347193, 1, 1, 1, 1, 1,
-1.125892, 0.118449, -2.511303, 1, 1, 1, 1, 1,
-1.120188, 0.5600911, -1.076993, 1, 1, 1, 1, 1,
-1.117708, 1.849806, -0.8901572, 1, 1, 1, 1, 1,
-1.117263, 0.1742009, -0.9644242, 1, 1, 1, 1, 1,
-1.102815, 0.5996092, -0.6392575, 1, 1, 1, 1, 1,
-1.095192, -0.9421206, -2.311064, 0, 0, 1, 1, 1,
-1.086182, 0.920175, -1.001905, 1, 0, 0, 1, 1,
-1.082127, 0.8290352, -1.029015, 1, 0, 0, 1, 1,
-1.079332, -0.7445003, -1.539787, 1, 0, 0, 1, 1,
-1.078624, -0.1983962, -2.343304, 1, 0, 0, 1, 1,
-1.073429, 0.3323912, -1.447448, 1, 0, 0, 1, 1,
-1.071501, 0.7207717, -1.456677, 0, 0, 0, 1, 1,
-1.069777, 0.1531244, -2.508459, 0, 0, 0, 1, 1,
-1.0695, -0.8257364, -1.500905, 0, 0, 0, 1, 1,
-1.066881, -2.636843, -2.128685, 0, 0, 0, 1, 1,
-1.061646, -1.251732, -3.885839, 0, 0, 0, 1, 1,
-1.060264, 0.2775292, -1.887605, 0, 0, 0, 1, 1,
-1.053918, 1.620525, 1.384061, 0, 0, 0, 1, 1,
-1.052212, 0.6348947, -0.1949508, 1, 1, 1, 1, 1,
-1.051488, 0.6846114, -0.5736673, 1, 1, 1, 1, 1,
-1.04612, -0.7749006, -1.570964, 1, 1, 1, 1, 1,
-1.045678, 0.2543174, -1.636611, 1, 1, 1, 1, 1,
-1.040888, 1.404337, 0.3828245, 1, 1, 1, 1, 1,
-1.036938, -1.289015, -4.354256, 1, 1, 1, 1, 1,
-1.036484, -0.3773479, -1.976075, 1, 1, 1, 1, 1,
-1.036474, 1.308455, -0.1468063, 1, 1, 1, 1, 1,
-1.034313, 0.4484066, -1.510221, 1, 1, 1, 1, 1,
-1.029059, 1.295873, -1.186375, 1, 1, 1, 1, 1,
-1.021263, -0.9027442, -2.589454, 1, 1, 1, 1, 1,
-1.014255, -0.4678224, -0.5378261, 1, 1, 1, 1, 1,
-1.013723, -0.9421348, -2.636157, 1, 1, 1, 1, 1,
-1.011243, 0.2876983, -1.913378, 1, 1, 1, 1, 1,
-1.008749, -0.6163608, -2.593453, 1, 1, 1, 1, 1,
-1.00557, 0.01884141, -0.7779199, 0, 0, 1, 1, 1,
-0.9994799, -0.696103, -1.15173, 1, 0, 0, 1, 1,
-0.9989532, -0.3834776, 0.2728502, 1, 0, 0, 1, 1,
-0.9857059, -0.3348502, -1.220386, 1, 0, 0, 1, 1,
-0.9713102, 0.3369419, -0.07717028, 1, 0, 0, 1, 1,
-0.9690973, 1.988135, -2.515334, 1, 0, 0, 1, 1,
-0.9648639, -0.4834433, -3.905914, 0, 0, 0, 1, 1,
-0.9645151, -0.2175584, -1.144853, 0, 0, 0, 1, 1,
-0.9631287, -0.5171832, -2.134038, 0, 0, 0, 1, 1,
-0.9554155, 0.9960995, -1.34812, 0, 0, 0, 1, 1,
-0.9479232, -1.122036, -3.540801, 0, 0, 0, 1, 1,
-0.9415699, 0.3949868, -0.0891629, 0, 0, 0, 1, 1,
-0.9411896, 0.5785633, -1.270095, 0, 0, 0, 1, 1,
-0.9405189, 1.154795, 0.1690956, 1, 1, 1, 1, 1,
-0.9336023, 0.6934454, 0.05779137, 1, 1, 1, 1, 1,
-0.9317924, -1.670282, -2.814487, 1, 1, 1, 1, 1,
-0.9307232, -0.6209955, -1.5364, 1, 1, 1, 1, 1,
-0.9299831, 0.007047241, -3.544358, 1, 1, 1, 1, 1,
-0.9244506, 0.2794134, 1.49773, 1, 1, 1, 1, 1,
-0.919758, -0.6761451, -0.8252919, 1, 1, 1, 1, 1,
-0.9170819, 0.8001639, -0.3493314, 1, 1, 1, 1, 1,
-0.9143965, -1.223646, -1.566299, 1, 1, 1, 1, 1,
-0.913317, -0.3136528, -1.723179, 1, 1, 1, 1, 1,
-0.9118809, -0.4450488, -1.022374, 1, 1, 1, 1, 1,
-0.9110652, -0.9628252, -1.16273, 1, 1, 1, 1, 1,
-0.9005082, 0.932559, -1.666383, 1, 1, 1, 1, 1,
-0.8999018, 0.7993548, 0.3450669, 1, 1, 1, 1, 1,
-0.8858158, -0.7599587, -2.228163, 1, 1, 1, 1, 1,
-0.8797078, 0.2526325, -1.764588, 0, 0, 1, 1, 1,
-0.8794991, -0.147009, -0.6750396, 1, 0, 0, 1, 1,
-0.8776665, 0.8437476, 0.6564832, 1, 0, 0, 1, 1,
-0.8766527, -0.5447767, -3.84714, 1, 0, 0, 1, 1,
-0.8723246, 0.9310669, -1.093703, 1, 0, 0, 1, 1,
-0.8659436, 1.004085, 0.07280558, 1, 0, 0, 1, 1,
-0.8635892, 0.1499164, -3.495171, 0, 0, 0, 1, 1,
-0.8625617, 0.02526304, -2.89922, 0, 0, 0, 1, 1,
-0.8539108, 0.2583493, -0.7486302, 0, 0, 0, 1, 1,
-0.8492977, -1.401145, -3.847488, 0, 0, 0, 1, 1,
-0.8454598, -0.2742102, -1.302227, 0, 0, 0, 1, 1,
-0.844144, 1.509715, 0.468652, 0, 0, 0, 1, 1,
-0.8423689, -0.7049215, -1.845882, 0, 0, 0, 1, 1,
-0.8314302, -0.6236689, -3.358497, 1, 1, 1, 1, 1,
-0.829689, -1.785393, -1.678792, 1, 1, 1, 1, 1,
-0.8242694, 0.5249802, -1.006669, 1, 1, 1, 1, 1,
-0.8185542, 1.636085, -1.335494, 1, 1, 1, 1, 1,
-0.8177454, -0.02322263, -1.943673, 1, 1, 1, 1, 1,
-0.8175793, 1.263097, 0.5000592, 1, 1, 1, 1, 1,
-0.8077406, 0.7819319, -1.099658, 1, 1, 1, 1, 1,
-0.8060146, 1.86491, 0.1114254, 1, 1, 1, 1, 1,
-0.8040751, 1.141194, -0.6321439, 1, 1, 1, 1, 1,
-0.800918, 2.247043, 0.01278815, 1, 1, 1, 1, 1,
-0.7980449, 1.381901, -0.1261124, 1, 1, 1, 1, 1,
-0.7979219, -0.3090415, -2.879714, 1, 1, 1, 1, 1,
-0.7965892, -1.254744, -3.291325, 1, 1, 1, 1, 1,
-0.7962674, 0.7148624, 0.5173658, 1, 1, 1, 1, 1,
-0.7927014, -0.3334721, -0.1667052, 1, 1, 1, 1, 1,
-0.7920148, 0.1129876, -1.321148, 0, 0, 1, 1, 1,
-0.7885131, -0.3758519, -1.759556, 1, 0, 0, 1, 1,
-0.7878734, -0.3881325, -1.97595, 1, 0, 0, 1, 1,
-0.7845488, -0.4851618, -1.838464, 1, 0, 0, 1, 1,
-0.7800861, -0.5997356, -1.174532, 1, 0, 0, 1, 1,
-0.7774053, -0.8972315, -1.908085, 1, 0, 0, 1, 1,
-0.7706519, 0.2721948, -2.369748, 0, 0, 0, 1, 1,
-0.7702911, 0.1103443, -1.983491, 0, 0, 0, 1, 1,
-0.7690519, -1.000824, -2.586916, 0, 0, 0, 1, 1,
-0.7689645, -0.5415093, -2.67867, 0, 0, 0, 1, 1,
-0.7688304, -0.3564878, -1.620864, 0, 0, 0, 1, 1,
-0.7678825, 0.6117415, -0.5841836, 0, 0, 0, 1, 1,
-0.7646319, -0.1070389, -2.567115, 0, 0, 0, 1, 1,
-0.7569415, 0.8086037, -1.08229, 1, 1, 1, 1, 1,
-0.7553081, -0.01900952, -1.725769, 1, 1, 1, 1, 1,
-0.7485073, -0.6031874, -2.317661, 1, 1, 1, 1, 1,
-0.7480258, 0.3818408, -0.9918616, 1, 1, 1, 1, 1,
-0.7477216, -0.4827724, -1.297886, 1, 1, 1, 1, 1,
-0.7470769, 0.6639225, -0.4356967, 1, 1, 1, 1, 1,
-0.7414869, -0.8078086, -2.05932, 1, 1, 1, 1, 1,
-0.7352585, -0.366929, -2.642897, 1, 1, 1, 1, 1,
-0.7333546, -1.236168, -2.884353, 1, 1, 1, 1, 1,
-0.7248539, 0.3947905, -0.2234269, 1, 1, 1, 1, 1,
-0.7158577, 0.8895037, 1.282069, 1, 1, 1, 1, 1,
-0.7129425, -0.9592153, -2.29927, 1, 1, 1, 1, 1,
-0.7122703, -1.367097, -2.06238, 1, 1, 1, 1, 1,
-0.7113903, 0.1040377, -0.4803617, 1, 1, 1, 1, 1,
-0.7060933, -0.5605959, -4.862023, 1, 1, 1, 1, 1,
-0.7047142, 1.466122, -1.021647, 0, 0, 1, 1, 1,
-0.7015575, -1.625676, -1.805473, 1, 0, 0, 1, 1,
-0.6918168, 0.1682957, -0.0329938, 1, 0, 0, 1, 1,
-0.6882852, -0.3231207, -3.692803, 1, 0, 0, 1, 1,
-0.6845351, -0.9904276, -1.400065, 1, 0, 0, 1, 1,
-0.6833653, 0.6288651, -0.9472364, 1, 0, 0, 1, 1,
-0.6784504, -1.224212, -1.628986, 0, 0, 0, 1, 1,
-0.6739256, -0.1502423, -1.78791, 0, 0, 0, 1, 1,
-0.6696715, -1.039062, -1.014332, 0, 0, 0, 1, 1,
-0.6614885, 0.9070761, -0.02718815, 0, 0, 0, 1, 1,
-0.6602554, -0.5129538, -2.880662, 0, 0, 0, 1, 1,
-0.6593115, -0.01832903, -0.03165144, 0, 0, 0, 1, 1,
-0.6495176, 0.1395519, -1.446872, 0, 0, 0, 1, 1,
-0.6456204, -0.2813141, -1.577945, 1, 1, 1, 1, 1,
-0.6454575, -0.09208619, -0.8117055, 1, 1, 1, 1, 1,
-0.6413084, -1.544443, -3.466965, 1, 1, 1, 1, 1,
-0.6353343, 1.355217, -0.434757, 1, 1, 1, 1, 1,
-0.6341394, -1.471542, -3.469754, 1, 1, 1, 1, 1,
-0.6336914, 0.0794414, -3.445342, 1, 1, 1, 1, 1,
-0.6325107, 0.5579963, -0.594165, 1, 1, 1, 1, 1,
-0.6308201, -1.234228, -3.848296, 1, 1, 1, 1, 1,
-0.621044, 1.166795, 0.2237803, 1, 1, 1, 1, 1,
-0.6201982, 0.6232072, -3.278508, 1, 1, 1, 1, 1,
-0.619732, 0.5521961, -0.155819, 1, 1, 1, 1, 1,
-0.6183346, 0.4428425, -1.446235, 1, 1, 1, 1, 1,
-0.6163815, 0.2034672, -1.765121, 1, 1, 1, 1, 1,
-0.6160927, -0.3255774, -4.235566, 1, 1, 1, 1, 1,
-0.6160057, 0.02806867, -2.431247, 1, 1, 1, 1, 1,
-0.6157581, 2.473001, 1.026346, 0, 0, 1, 1, 1,
-0.6109793, 0.3194326, -1.707902, 1, 0, 0, 1, 1,
-0.6075671, 0.3149272, -0.3501458, 1, 0, 0, 1, 1,
-0.6042177, -0.5187166, -2.801255, 1, 0, 0, 1, 1,
-0.5996763, 0.5748398, 0.474827, 1, 0, 0, 1, 1,
-0.5982126, 1.797461, 1.690954, 1, 0, 0, 1, 1,
-0.5963357, 0.4157419, 0.8665596, 0, 0, 0, 1, 1,
-0.589515, 1.71662, -1.235777, 0, 0, 0, 1, 1,
-0.5881342, -0.6600727, -3.377723, 0, 0, 0, 1, 1,
-0.5880419, -1.079641, -3.319487, 0, 0, 0, 1, 1,
-0.5800373, 0.1842396, -0.5273452, 0, 0, 0, 1, 1,
-0.572601, -1.162, -2.179101, 0, 0, 0, 1, 1,
-0.5709154, 2.340043, -1.064335, 0, 0, 0, 1, 1,
-0.5705589, -0.005911979, -1.94346, 1, 1, 1, 1, 1,
-0.5691131, -1.22748, -3.593437, 1, 1, 1, 1, 1,
-0.5672223, -0.1504472, -2.458226, 1, 1, 1, 1, 1,
-0.560531, 0.4714109, -0.2762584, 1, 1, 1, 1, 1,
-0.5570668, -0.8742216, -3.741567, 1, 1, 1, 1, 1,
-0.5564717, -0.430406, -1.598142, 1, 1, 1, 1, 1,
-0.5546069, 0.1157813, -2.23771, 1, 1, 1, 1, 1,
-0.5541869, 0.03394896, -2.654789, 1, 1, 1, 1, 1,
-0.5535471, -1.612169, -3.825719, 1, 1, 1, 1, 1,
-0.5508013, 0.3787896, -1.253101, 1, 1, 1, 1, 1,
-0.5496144, -1.554129, -2.57298, 1, 1, 1, 1, 1,
-0.5495321, -0.7815235, -1.029012, 1, 1, 1, 1, 1,
-0.5490094, 0.06474789, -1.930462, 1, 1, 1, 1, 1,
-0.5469838, 0.0128158, -0.8805982, 1, 1, 1, 1, 1,
-0.5444637, 0.2871512, -1.020263, 1, 1, 1, 1, 1,
-0.5404153, -0.349847, 0.2092686, 0, 0, 1, 1, 1,
-0.5386038, 1.06887, 0.2459643, 1, 0, 0, 1, 1,
-0.5337015, -0.4352665, -2.490464, 1, 0, 0, 1, 1,
-0.5321848, 0.1701519, -0.1996477, 1, 0, 0, 1, 1,
-0.5313839, 0.3514392, -1.38305, 1, 0, 0, 1, 1,
-0.530612, 0.3523055, -2.298259, 1, 0, 0, 1, 1,
-0.5298432, 0.1548109, 0.2128423, 0, 0, 0, 1, 1,
-0.5222991, -1.744775, -3.39466, 0, 0, 0, 1, 1,
-0.5222354, -0.7405064, -2.99527, 0, 0, 0, 1, 1,
-0.5158502, -0.8669778, -4.441724, 0, 0, 0, 1, 1,
-0.5143552, 0.1606595, -2.576395, 0, 0, 0, 1, 1,
-0.5140715, 0.7511851, -0.2604304, 0, 0, 0, 1, 1,
-0.5140209, -1.268463, -3.230752, 0, 0, 0, 1, 1,
-0.5117493, -1.108907, -3.658903, 1, 1, 1, 1, 1,
-0.5064725, -0.302773, -2.875734, 1, 1, 1, 1, 1,
-0.5031933, -0.9494252, -2.911458, 1, 1, 1, 1, 1,
-0.4942207, -0.3600253, -2.710972, 1, 1, 1, 1, 1,
-0.4926827, -1.545938, -3.414573, 1, 1, 1, 1, 1,
-0.4897476, -0.152166, -0.07855963, 1, 1, 1, 1, 1,
-0.4880224, -0.9409576, -3.620048, 1, 1, 1, 1, 1,
-0.4863809, -1.067405, -3.195637, 1, 1, 1, 1, 1,
-0.4853572, 0.7184867, -1.165629, 1, 1, 1, 1, 1,
-0.4826909, 0.1227722, -2.147499, 1, 1, 1, 1, 1,
-0.4821087, 0.3115907, -2.268541, 1, 1, 1, 1, 1,
-0.4813667, 1.805963, -0.7798182, 1, 1, 1, 1, 1,
-0.4813262, 1.138469, 1.222175, 1, 1, 1, 1, 1,
-0.4765387, -0.4877861, -1.393783, 1, 1, 1, 1, 1,
-0.4746499, -1.030771, -2.746156, 1, 1, 1, 1, 1,
-0.4742335, 1.631651, -0.2583736, 0, 0, 1, 1, 1,
-0.4721024, -1.114262, -2.480607, 1, 0, 0, 1, 1,
-0.4711557, -0.09791256, -1.439622, 1, 0, 0, 1, 1,
-0.4687129, -0.03950449, -3.240349, 1, 0, 0, 1, 1,
-0.4611897, -0.8501157, -2.914898, 1, 0, 0, 1, 1,
-0.4607182, 0.5647117, -1.923516, 1, 0, 0, 1, 1,
-0.4570158, 0.4355989, 0.1477789, 0, 0, 0, 1, 1,
-0.4567127, 0.4575822, 0.3699193, 0, 0, 0, 1, 1,
-0.4556256, 1.060904, 1.554547, 0, 0, 0, 1, 1,
-0.4539948, -0.4996334, -3.296474, 0, 0, 0, 1, 1,
-0.4536119, 1.80872, 0.595223, 0, 0, 0, 1, 1,
-0.4507354, -1.057258, -2.186851, 0, 0, 0, 1, 1,
-0.4463564, 0.7635782, 0.5922712, 0, 0, 0, 1, 1,
-0.4453948, -0.7385005, -1.078472, 1, 1, 1, 1, 1,
-0.443426, -0.1420561, -3.160675, 1, 1, 1, 1, 1,
-0.4392533, 0.8283092, -1.511685, 1, 1, 1, 1, 1,
-0.436362, -0.2040074, -1.834634, 1, 1, 1, 1, 1,
-0.4343927, 0.06738203, -1.143858, 1, 1, 1, 1, 1,
-0.4329101, 0.5201107, 0.3503719, 1, 1, 1, 1, 1,
-0.4285347, -0.6069643, -3.015284, 1, 1, 1, 1, 1,
-0.4258697, -0.05910864, -0.5877494, 1, 1, 1, 1, 1,
-0.4253064, 0.4309562, -2.291252, 1, 1, 1, 1, 1,
-0.423694, -0.1612906, -2.949979, 1, 1, 1, 1, 1,
-0.421996, 0.5739947, -0.5141535, 1, 1, 1, 1, 1,
-0.4207304, -1.07098, -1.390787, 1, 1, 1, 1, 1,
-0.4195222, 0.1736254, -1.654413, 1, 1, 1, 1, 1,
-0.4194555, -0.4193015, -1.96324, 1, 1, 1, 1, 1,
-0.4191602, 0.4301609, -2.062033, 1, 1, 1, 1, 1,
-0.4187224, 1.070502, 0.1660218, 0, 0, 1, 1, 1,
-0.4160932, 1.063206, 0.2831946, 1, 0, 0, 1, 1,
-0.4106437, 1.158199, -0.350116, 1, 0, 0, 1, 1,
-0.4059106, -0.1145893, -2.00077, 1, 0, 0, 1, 1,
-0.3991429, -0.3036084, -0.88907, 1, 0, 0, 1, 1,
-0.3937756, 0.8100903, -0.132185, 1, 0, 0, 1, 1,
-0.3932148, 0.1151808, -0.1357297, 0, 0, 0, 1, 1,
-0.3910067, -1.120926, -3.008893, 0, 0, 0, 1, 1,
-0.3854505, -0.198481, -2.500238, 0, 0, 0, 1, 1,
-0.3765413, 0.6084147, -0.6152638, 0, 0, 0, 1, 1,
-0.3702798, -1.204741, -1.955299, 0, 0, 0, 1, 1,
-0.3637061, 1.729696, -0.5684386, 0, 0, 0, 1, 1,
-0.357682, -0.1919952, -1.000725, 0, 0, 0, 1, 1,
-0.3551054, 1.535295, 0.9619322, 1, 1, 1, 1, 1,
-0.3550715, -0.4828109, -2.221068, 1, 1, 1, 1, 1,
-0.3495821, -1.206339, -1.742705, 1, 1, 1, 1, 1,
-0.349224, 0.4410778, 2.364677, 1, 1, 1, 1, 1,
-0.3467143, 1.144231, 1.013223, 1, 1, 1, 1, 1,
-0.3466169, -0.3264107, -2.557479, 1, 1, 1, 1, 1,
-0.3438396, -1.946256, -2.761667, 1, 1, 1, 1, 1,
-0.3411154, -1.747282, -4.123476, 1, 1, 1, 1, 1,
-0.3408742, -0.5646558, -2.970972, 1, 1, 1, 1, 1,
-0.3367698, 0.06216987, -2.099294, 1, 1, 1, 1, 1,
-0.33474, 0.4802593, -0.08041394, 1, 1, 1, 1, 1,
-0.330461, -0.7443178, -3.39448, 1, 1, 1, 1, 1,
-0.3288595, -1.123601, -5.125254, 1, 1, 1, 1, 1,
-0.3285594, -1.82823, -3.139453, 1, 1, 1, 1, 1,
-0.3243711, 0.2708884, -0.9522613, 1, 1, 1, 1, 1,
-0.3219016, 0.5564121, -0.4072991, 0, 0, 1, 1, 1,
-0.3202648, -1.688892, -3.663141, 1, 0, 0, 1, 1,
-0.3163229, 0.4981856, -2.082054, 1, 0, 0, 1, 1,
-0.314211, 1.998304, 1.412873, 1, 0, 0, 1, 1,
-0.3089369, -0.4389246, -2.512582, 1, 0, 0, 1, 1,
-0.308693, -0.04966985, -2.429581, 1, 0, 0, 1, 1,
-0.3061146, -0.8956118, -2.120366, 0, 0, 0, 1, 1,
-0.3040861, 1.266535, -1.840429, 0, 0, 0, 1, 1,
-0.3018894, 0.1303945, -0.7368935, 0, 0, 0, 1, 1,
-0.2948864, 1.134851, -0.1963763, 0, 0, 0, 1, 1,
-0.2943264, 0.535189, -0.1701789, 0, 0, 0, 1, 1,
-0.293875, 0.2494844, 0.2636739, 0, 0, 0, 1, 1,
-0.2908994, 1.37649, 0.6527081, 0, 0, 0, 1, 1,
-0.2883638, -0.3863095, -2.804151, 1, 1, 1, 1, 1,
-0.2878856, -0.8188469, -3.273902, 1, 1, 1, 1, 1,
-0.2804451, -0.5422342, -2.835047, 1, 1, 1, 1, 1,
-0.2792607, 0.7522585, 0.467912, 1, 1, 1, 1, 1,
-0.2790457, 2.069507, 0.2306223, 1, 1, 1, 1, 1,
-0.2759313, 0.5617781, 0.02919368, 1, 1, 1, 1, 1,
-0.2751464, 1.601827, 1.706314, 1, 1, 1, 1, 1,
-0.2721459, 1.165029, -0.3899106, 1, 1, 1, 1, 1,
-0.2673213, 1.680696, -0.7620461, 1, 1, 1, 1, 1,
-0.2656076, -1.744661, -3.576413, 1, 1, 1, 1, 1,
-0.2647534, 0.5140609, 0.3003029, 1, 1, 1, 1, 1,
-0.2609265, -1.235691, -0.8687971, 1, 1, 1, 1, 1,
-0.2603509, -0.2366745, -1.003809, 1, 1, 1, 1, 1,
-0.2583753, 0.1788458, 0.921348, 1, 1, 1, 1, 1,
-0.25102, 0.5216119, 0.1193944, 1, 1, 1, 1, 1,
-0.2509575, -1.993547, -2.148317, 0, 0, 1, 1, 1,
-0.2491156, -0.8055511, -3.790994, 1, 0, 0, 1, 1,
-0.2433604, -0.5850244, -2.51815, 1, 0, 0, 1, 1,
-0.2407493, -0.5953884, -2.961472, 1, 0, 0, 1, 1,
-0.2403342, 0.1356145, 0.2550972, 1, 0, 0, 1, 1,
-0.2389743, 0.9540971, 1.087056, 1, 0, 0, 1, 1,
-0.238596, -0.6380955, -3.358232, 0, 0, 0, 1, 1,
-0.2368004, -1.414253, -5.088131, 0, 0, 0, 1, 1,
-0.2365375, 0.371703, -0.1550017, 0, 0, 0, 1, 1,
-0.2364425, -0.1836031, -0.8683888, 0, 0, 0, 1, 1,
-0.2357419, 0.3391252, -1.813978, 0, 0, 0, 1, 1,
-0.2338166, 2.242523, 0.294977, 0, 0, 0, 1, 1,
-0.2289016, -0.8830046, -2.635478, 0, 0, 0, 1, 1,
-0.2287998, 0.02486781, -2.439381, 1, 1, 1, 1, 1,
-0.2225626, 1.30612, -0.003642335, 1, 1, 1, 1, 1,
-0.2221334, 0.140406, -1.806496, 1, 1, 1, 1, 1,
-0.2217494, 1.686518, -0.5917801, 1, 1, 1, 1, 1,
-0.2216349, 0.6024317, -1.631431, 1, 1, 1, 1, 1,
-0.2210594, 0.3198279, -0.6287436, 1, 1, 1, 1, 1,
-0.2175548, -0.753682, -1.866557, 1, 1, 1, 1, 1,
-0.2168797, -0.7805033, -2.281886, 1, 1, 1, 1, 1,
-0.2134208, 1.561857, 3.086127, 1, 1, 1, 1, 1,
-0.2124914, 0.1553308, -2.52134, 1, 1, 1, 1, 1,
-0.2092614, 1.186297, -0.8304059, 1, 1, 1, 1, 1,
-0.20919, -1.293627, -3.102464, 1, 1, 1, 1, 1,
-0.2086715, -0.1341037, -4.142013, 1, 1, 1, 1, 1,
-0.2065341, -0.5351151, -5.032158, 1, 1, 1, 1, 1,
-0.2032926, -0.2585095, -3.571965, 1, 1, 1, 1, 1,
-0.2032255, -0.8822181, -2.975505, 0, 0, 1, 1, 1,
-0.2020884, -0.5089079, -2.626933, 1, 0, 0, 1, 1,
-0.2007981, 0.2158063, -0.6683062, 1, 0, 0, 1, 1,
-0.2003053, -1.1011, -3.213288, 1, 0, 0, 1, 1,
-0.1993008, 0.7694476, 0.4217981, 1, 0, 0, 1, 1,
-0.1980084, -1.069004, -3.343825, 1, 0, 0, 1, 1,
-0.1970031, -0.6026819, -2.649026, 0, 0, 0, 1, 1,
-0.1969765, -0.1256826, -2.102201, 0, 0, 0, 1, 1,
-0.1965664, -0.7244663, -3.020667, 0, 0, 0, 1, 1,
-0.1862896, -0.486915, -2.679813, 0, 0, 0, 1, 1,
-0.1857107, 0.903771, 0.5951266, 0, 0, 0, 1, 1,
-0.183501, -0.5279186, -1.515239, 0, 0, 0, 1, 1,
-0.181947, 0.5434814, -0.1305275, 0, 0, 0, 1, 1,
-0.1779687, 0.1110219, -1.193731, 1, 1, 1, 1, 1,
-0.1749914, 0.4977388, -1.51292, 1, 1, 1, 1, 1,
-0.1728541, 0.6346455, -0.546329, 1, 1, 1, 1, 1,
-0.1718781, 0.3335504, -0.2756258, 1, 1, 1, 1, 1,
-0.1713956, 0.343338, -0.449318, 1, 1, 1, 1, 1,
-0.1704011, 2.117001, -1.116864, 1, 1, 1, 1, 1,
-0.1700479, -3.02361, -3.290999, 1, 1, 1, 1, 1,
-0.1697762, 0.08618975, 0.1684834, 1, 1, 1, 1, 1,
-0.1693888, -0.1471488, -3.226658, 1, 1, 1, 1, 1,
-0.1645576, 0.4802801, 1.060506, 1, 1, 1, 1, 1,
-0.16131, -0.9621061, -1.888902, 1, 1, 1, 1, 1,
-0.1563854, 2.406404, 1.58074, 1, 1, 1, 1, 1,
-0.1511795, -1.707011, -4.843266, 1, 1, 1, 1, 1,
-0.1492976, 0.6489453, -2.224456, 1, 1, 1, 1, 1,
-0.1460111, -0.597159, -4.016948, 1, 1, 1, 1, 1,
-0.1444531, 0.1889017, -1.71588, 0, 0, 1, 1, 1,
-0.1418712, -0.5966731, -3.486353, 1, 0, 0, 1, 1,
-0.1352204, 2.917609, -0.03256868, 1, 0, 0, 1, 1,
-0.1351708, 0.5059842, 0.4293188, 1, 0, 0, 1, 1,
-0.132661, 0.6123988, 0.2671299, 1, 0, 0, 1, 1,
-0.1292477, -1.141666, -3.548965, 1, 0, 0, 1, 1,
-0.1286343, 0.2196787, -1.531742, 0, 0, 0, 1, 1,
-0.1276631, 0.51994, -0.3789337, 0, 0, 0, 1, 1,
-0.1259984, -0.8370652, -1.326392, 0, 0, 0, 1, 1,
-0.1169421, -0.6804546, -0.989172, 0, 0, 0, 1, 1,
-0.1150951, -0.6887369, -2.475948, 0, 0, 0, 1, 1,
-0.1104815, 0.04053048, -0.6539996, 0, 0, 0, 1, 1,
-0.106395, -1.308164, -4.988504, 0, 0, 0, 1, 1,
-0.104514, 0.2911151, -0.8481423, 1, 1, 1, 1, 1,
-0.1018306, 0.6123724, 2.083745, 1, 1, 1, 1, 1,
-0.1008374, 0.3751021, -1.28604, 1, 1, 1, 1, 1,
-0.0999909, -0.4167915, -4.049155, 1, 1, 1, 1, 1,
-0.09656054, -0.5443717, -3.488435, 1, 1, 1, 1, 1,
-0.09642787, 0.7418944, 0.2643104, 1, 1, 1, 1, 1,
-0.09020477, 1.505944, 0.1108317, 1, 1, 1, 1, 1,
-0.0897489, 0.2655542, -0.8060357, 1, 1, 1, 1, 1,
-0.08654729, -1.013933, -2.366935, 1, 1, 1, 1, 1,
-0.07527644, -0.2940735, -4.859081, 1, 1, 1, 1, 1,
-0.07376678, 0.1764403, -0.5501745, 1, 1, 1, 1, 1,
-0.07281425, 0.4078459, 0.9311895, 1, 1, 1, 1, 1,
-0.06656861, -0.4300355, -3.668852, 1, 1, 1, 1, 1,
-0.06021941, 1.167039, 0.3692068, 1, 1, 1, 1, 1,
-0.06020581, -0.2396243, -2.384823, 1, 1, 1, 1, 1,
-0.05916407, 3.299732, -2.029166, 0, 0, 1, 1, 1,
-0.05212942, 0.7092535, 0.03211254, 1, 0, 0, 1, 1,
-0.05010803, 1.330286, 1.241435, 1, 0, 0, 1, 1,
-0.04943052, 1.663336, 1.261424, 1, 0, 0, 1, 1,
-0.0491689, -0.2748496, -3.380287, 1, 0, 0, 1, 1,
-0.04711794, 0.7175478, -1.015389, 1, 0, 0, 1, 1,
-0.04520851, 0.9854254, 0.2158659, 0, 0, 0, 1, 1,
-0.04478984, 0.1806764, -1.42832, 0, 0, 0, 1, 1,
-0.04421453, -0.1913787, -3.566549, 0, 0, 0, 1, 1,
-0.04048361, -0.8954658, -3.386471, 0, 0, 0, 1, 1,
-0.03931841, 1.224606, -0.08867869, 0, 0, 0, 1, 1,
-0.03505551, -0.5558318, -1.118961, 0, 0, 0, 1, 1,
-0.03259622, 0.4834279, -2.016826, 0, 0, 0, 1, 1,
-0.02662083, 0.3874618, 1.680539, 1, 1, 1, 1, 1,
-0.02595916, 1.400618, -0.3684082, 1, 1, 1, 1, 1,
-0.02383569, 0.7457278, -0.09445117, 1, 1, 1, 1, 1,
-0.02253822, -0.6470685, -2.943601, 1, 1, 1, 1, 1,
-0.0203731, -0.6882091, -2.45532, 1, 1, 1, 1, 1,
-0.01611013, -0.9080663, -4.401141, 1, 1, 1, 1, 1,
-0.01593921, -0.5706039, -2.562087, 1, 1, 1, 1, 1,
-0.01385228, 0.5821587, -0.08273686, 1, 1, 1, 1, 1,
-0.01172253, -0.6390817, -4.671232, 1, 1, 1, 1, 1,
-0.01156146, 1.384242, -0.3482964, 1, 1, 1, 1, 1,
-0.008612293, 1.409809, 0.3199771, 1, 1, 1, 1, 1,
-0.006420479, 0.9137674, 0.05938023, 1, 1, 1, 1, 1,
-0.004972399, -0.8272353, -3.892117, 1, 1, 1, 1, 1,
-0.00492412, 1.756324, 1.875446, 1, 1, 1, 1, 1,
-0.00371414, -0.2011413, -2.219069, 1, 1, 1, 1, 1,
-0.002681844, 0.8346415, -0.6490308, 0, 0, 1, 1, 1,
-0.002028992, -1.141505, -2.127245, 1, 0, 0, 1, 1,
0.0007995016, -1.040089, 3.498653, 1, 0, 0, 1, 1,
0.001147889, 0.08361187, 0.3664798, 1, 0, 0, 1, 1,
0.001683379, -1.257554, 2.337139, 1, 0, 0, 1, 1,
0.004375696, 0.2403142, 0.5225016, 1, 0, 0, 1, 1,
0.006687496, 0.1385118, -0.04743984, 0, 0, 0, 1, 1,
0.008928284, 1.333115, -1.769774, 0, 0, 0, 1, 1,
0.01026447, -0.2075612, 1.03214, 0, 0, 0, 1, 1,
0.01171203, 1.220611, -0.5895281, 0, 0, 0, 1, 1,
0.01769039, 1.284664, -0.2566156, 0, 0, 0, 1, 1,
0.01939179, 1.277949, -1.655077, 0, 0, 0, 1, 1,
0.02329955, -1.53002, 4.030707, 0, 0, 0, 1, 1,
0.02336474, -0.005110742, 0.3395942, 1, 1, 1, 1, 1,
0.02790289, -0.671607, 0.8742326, 1, 1, 1, 1, 1,
0.0296125, -1.381209, 2.357759, 1, 1, 1, 1, 1,
0.03650858, -1.425352, 3.157707, 1, 1, 1, 1, 1,
0.04064799, -0.7328094, 3.632664, 1, 1, 1, 1, 1,
0.0439494, 0.3671247, 1.159678, 1, 1, 1, 1, 1,
0.04831017, -0.9773368, 3.531156, 1, 1, 1, 1, 1,
0.04939906, -0.1160619, 3.793611, 1, 1, 1, 1, 1,
0.05201985, 0.5316825, 1.056412, 1, 1, 1, 1, 1,
0.0537097, 1.599427, -0.1075221, 1, 1, 1, 1, 1,
0.05634755, -0.2973847, 4.316413, 1, 1, 1, 1, 1,
0.05730012, 1.413198, -0.3859096, 1, 1, 1, 1, 1,
0.06073362, 0.6380253, -0.1551287, 1, 1, 1, 1, 1,
0.06155504, 0.9364862, -0.9228789, 1, 1, 1, 1, 1,
0.06387831, -1.157705, 2.824137, 1, 1, 1, 1, 1,
0.0642457, -1.21346, 1.829662, 0, 0, 1, 1, 1,
0.07077736, 0.06682, 1.164675, 1, 0, 0, 1, 1,
0.07586774, -0.6323258, 4.446846, 1, 0, 0, 1, 1,
0.0760305, 0.05318113, -1.122681, 1, 0, 0, 1, 1,
0.08055857, -0.5719331, 4.117427, 1, 0, 0, 1, 1,
0.08151639, 0.6636967, 1.178175, 1, 0, 0, 1, 1,
0.08428362, -0.3973181, 1.208595, 0, 0, 0, 1, 1,
0.08545509, 2.057773, -0.2762396, 0, 0, 0, 1, 1,
0.08682694, 0.2141494, 0.6437941, 0, 0, 0, 1, 1,
0.08702773, -1.177681, 3.481993, 0, 0, 0, 1, 1,
0.08718836, 0.7972696, 0.3472682, 0, 0, 0, 1, 1,
0.08740559, 1.295903, 0.7050643, 0, 0, 0, 1, 1,
0.09332988, -0.1013585, 2.763317, 0, 0, 0, 1, 1,
0.09434873, 1.378026, 1.836739, 1, 1, 1, 1, 1,
0.09714735, -1.696614, 3.145713, 1, 1, 1, 1, 1,
0.09725206, 0.9301953, 0.9042645, 1, 1, 1, 1, 1,
0.09960689, 0.7323898, 1.307161, 1, 1, 1, 1, 1,
0.1027398, 0.9142625, 0.5256158, 1, 1, 1, 1, 1,
0.1063011, 0.09160472, 0.88539, 1, 1, 1, 1, 1,
0.1063618, -0.9406207, 2.910631, 1, 1, 1, 1, 1,
0.1126228, -1.288122, 3.595976, 1, 1, 1, 1, 1,
0.1138576, -0.8831671, 2.766243, 1, 1, 1, 1, 1,
0.1177255, 3.02458, -1.385827, 1, 1, 1, 1, 1,
0.1184496, -0.3909671, 4.045161, 1, 1, 1, 1, 1,
0.1219692, -0.3618553, 4.361185, 1, 1, 1, 1, 1,
0.1231139, -0.9695552, 4.401868, 1, 1, 1, 1, 1,
0.1274824, 0.7690151, -0.357254, 1, 1, 1, 1, 1,
0.1312926, 1.868533, -0.8967532, 1, 1, 1, 1, 1,
0.133389, -1.773176, 2.517451, 0, 0, 1, 1, 1,
0.1374714, 3.056634, 0.06107724, 1, 0, 0, 1, 1,
0.1381734, -0.6634965, 2.403836, 1, 0, 0, 1, 1,
0.1399888, -0.4255217, 3.189847, 1, 0, 0, 1, 1,
0.1410818, 0.1385805, 0.825377, 1, 0, 0, 1, 1,
0.1531704, 0.3347398, 0.438484, 1, 0, 0, 1, 1,
0.1545871, 0.4107794, -1.151546, 0, 0, 0, 1, 1,
0.1570437, -1.193, 1.093958, 0, 0, 0, 1, 1,
0.1571497, -1.2536, 3.150592, 0, 0, 0, 1, 1,
0.1583968, -1.475758, 3.949985, 0, 0, 0, 1, 1,
0.1595493, 0.6904791, 0.7623643, 0, 0, 0, 1, 1,
0.1650922, -1.19504, 2.569114, 0, 0, 0, 1, 1,
0.1693008, -0.6241653, 2.466067, 0, 0, 0, 1, 1,
0.1769379, 0.7989324, -1.888016, 1, 1, 1, 1, 1,
0.1809811, -0.5616553, 4.631782, 1, 1, 1, 1, 1,
0.1814399, 0.2742786, 0.05745875, 1, 1, 1, 1, 1,
0.1850672, -0.3300927, 2.212054, 1, 1, 1, 1, 1,
0.1937291, 0.4170697, -2.119116, 1, 1, 1, 1, 1,
0.1946174, 0.2229108, 0.946891, 1, 1, 1, 1, 1,
0.1966065, -1.449266, 3.361645, 1, 1, 1, 1, 1,
0.2044084, -0.5886675, 2.99905, 1, 1, 1, 1, 1,
0.205799, -0.637164, 1.57367, 1, 1, 1, 1, 1,
0.2076366, -1.667744, 3.635403, 1, 1, 1, 1, 1,
0.2076926, 0.686123, 1.39127, 1, 1, 1, 1, 1,
0.2187056, 0.8267153, 1.675228, 1, 1, 1, 1, 1,
0.2238128, -1.360701, 3.66158, 1, 1, 1, 1, 1,
0.2246271, -0.85625, 1.684682, 1, 1, 1, 1, 1,
0.2380984, -1.287151, 0.8162349, 1, 1, 1, 1, 1,
0.2398957, -0.361938, 1.63275, 0, 0, 1, 1, 1,
0.2415807, -0.4333862, 2.94281, 1, 0, 0, 1, 1,
0.2480089, -1.303193, 3.679383, 1, 0, 0, 1, 1,
0.2486659, -0.8606863, 3.817601, 1, 0, 0, 1, 1,
0.2504056, 2.130358, -0.03760489, 1, 0, 0, 1, 1,
0.2574032, 0.4142556, -0.6653024, 1, 0, 0, 1, 1,
0.2576792, 0.3176948, 1.154486, 0, 0, 0, 1, 1,
0.2601718, -1.166006, 2.264076, 0, 0, 0, 1, 1,
0.2624498, 1.321998, 1.611719, 0, 0, 0, 1, 1,
0.2650874, 1.283828, -0.3725154, 0, 0, 0, 1, 1,
0.2710464, 1.199301, -2.143745, 0, 0, 0, 1, 1,
0.2724694, 0.5655218, 0.4219898, 0, 0, 0, 1, 1,
0.2740859, 0.1347463, 1.138167, 0, 0, 0, 1, 1,
0.2766492, -1.781427, 2.50433, 1, 1, 1, 1, 1,
0.2800795, 0.2045956, 1.045995, 1, 1, 1, 1, 1,
0.281198, -0.1514554, 1.942699, 1, 1, 1, 1, 1,
0.2819673, -0.04642714, 3.352363, 1, 1, 1, 1, 1,
0.2830344, -0.7820377, 1.321695, 1, 1, 1, 1, 1,
0.2873214, 0.4513294, 0.2189806, 1, 1, 1, 1, 1,
0.2905737, 1.026968, 1.557468, 1, 1, 1, 1, 1,
0.2919863, -1.477214, 3.257321, 1, 1, 1, 1, 1,
0.2927085, 0.2329691, -0.1241863, 1, 1, 1, 1, 1,
0.2936947, 0.6481764, 0.2215436, 1, 1, 1, 1, 1,
0.2965153, 1.619077, -1.086072, 1, 1, 1, 1, 1,
0.2980159, 0.1199746, 0.007363242, 1, 1, 1, 1, 1,
0.2986028, -0.7634488, 1.311107, 1, 1, 1, 1, 1,
0.2997055, 0.04074397, 1.632434, 1, 1, 1, 1, 1,
0.3061769, 0.4571367, 3.308902, 1, 1, 1, 1, 1,
0.306183, -0.892976, 2.492048, 0, 0, 1, 1, 1,
0.3136238, 0.5825461, 0.4787292, 1, 0, 0, 1, 1,
0.3177208, 1.089601, 1.350233, 1, 0, 0, 1, 1,
0.3196814, -0.6923628, 3.021148, 1, 0, 0, 1, 1,
0.3242212, 1.092771, -0.1979282, 1, 0, 0, 1, 1,
0.3294605, -0.0641971, 3.005279, 1, 0, 0, 1, 1,
0.3307706, 1.630711, 0.3450989, 0, 0, 0, 1, 1,
0.3339879, 0.7259124, 0.2083364, 0, 0, 0, 1, 1,
0.3345196, 2.273757, 0.01277028, 0, 0, 0, 1, 1,
0.3354703, -1.245277, 3.087176, 0, 0, 0, 1, 1,
0.3360562, 0.1882513, 0.07723346, 0, 0, 0, 1, 1,
0.3375362, 1.71466, 0.4228142, 0, 0, 0, 1, 1,
0.3443012, 0.4571109, 2.399749, 0, 0, 0, 1, 1,
0.3445694, 0.6360615, 1.311785, 1, 1, 1, 1, 1,
0.3450615, -0.3900453, 2.027722, 1, 1, 1, 1, 1,
0.3515132, -2.072582, 1.388937, 1, 1, 1, 1, 1,
0.3535425, 0.9620321, 0.4874034, 1, 1, 1, 1, 1,
0.3540437, 0.577438, 1.404734, 1, 1, 1, 1, 1,
0.3562148, -2.404127, 1.786119, 1, 1, 1, 1, 1,
0.3567947, 0.4504647, 1.815689, 1, 1, 1, 1, 1,
0.357383, 1.904367, -0.2054115, 1, 1, 1, 1, 1,
0.3605276, -1.237927, 3.741372, 1, 1, 1, 1, 1,
0.3625338, -0.5175219, 1.73319, 1, 1, 1, 1, 1,
0.3643245, 1.473196, 2.182557, 1, 1, 1, 1, 1,
0.370576, -2.164934, 3.161286, 1, 1, 1, 1, 1,
0.3725083, -0.2402402, 0.8284743, 1, 1, 1, 1, 1,
0.3765869, -0.1127552, 2.639699, 1, 1, 1, 1, 1,
0.3768845, -0.3934363, 2.605521, 1, 1, 1, 1, 1,
0.3856292, -0.8807629, 3.569429, 0, 0, 1, 1, 1,
0.3941666, -1.552069, 2.191259, 1, 0, 0, 1, 1,
0.3945587, 0.09949782, 1.958047, 1, 0, 0, 1, 1,
0.3951141, -0.9537817, 3.463931, 1, 0, 0, 1, 1,
0.3968083, 0.3502539, 1.728005, 1, 0, 0, 1, 1,
0.3969163, -0.212239, 1.524818, 1, 0, 0, 1, 1,
0.3984288, -0.8688735, 2.18003, 0, 0, 0, 1, 1,
0.4005849, 0.5896941, -0.6384447, 0, 0, 0, 1, 1,
0.4065308, -1.632564, 4.815048, 0, 0, 0, 1, 1,
0.4140136, 0.2743986, -0.2621533, 0, 0, 0, 1, 1,
0.4145069, 1.245132, 1.977379, 0, 0, 0, 1, 1,
0.4151439, -0.3470459, 2.026827, 0, 0, 0, 1, 1,
0.4154097, 0.2720696, -0.4734702, 0, 0, 0, 1, 1,
0.416438, -0.4847892, 2.564627, 1, 1, 1, 1, 1,
0.4200993, -1.321121, 2.295136, 1, 1, 1, 1, 1,
0.42342, -1.928758, 4.048138, 1, 1, 1, 1, 1,
0.4271458, 0.2434217, 2.58586, 1, 1, 1, 1, 1,
0.4308933, 0.1355721, 2.843295, 1, 1, 1, 1, 1,
0.4333437, 0.3767957, 1.634221, 1, 1, 1, 1, 1,
0.4361005, -0.1338947, 1.173089, 1, 1, 1, 1, 1,
0.4406061, -1.533872, 5.114542, 1, 1, 1, 1, 1,
0.4424286, -1.191224, 3.758811, 1, 1, 1, 1, 1,
0.4439698, -2.563109, 2.574973, 1, 1, 1, 1, 1,
0.4440288, 0.8837053, 0.4629501, 1, 1, 1, 1, 1,
0.4454667, 0.7402101, -0.3011758, 1, 1, 1, 1, 1,
0.4498354, -1.129788, 3.860187, 1, 1, 1, 1, 1,
0.4536566, -1.394475, 1.889328, 1, 1, 1, 1, 1,
0.4592867, -1.902552, 2.714702, 1, 1, 1, 1, 1,
0.4604192, -0.1442288, 2.487659, 0, 0, 1, 1, 1,
0.462282, 0.01365109, 0.5581918, 1, 0, 0, 1, 1,
0.4637902, -0.9576748, 1.632501, 1, 0, 0, 1, 1,
0.4641253, -1.124023, 3.169742, 1, 0, 0, 1, 1,
0.4654295, -1.087566, 3.828751, 1, 0, 0, 1, 1,
0.4675175, 0.8049632, 0.4660052, 1, 0, 0, 1, 1,
0.4708569, 0.6236939, 1.049156, 0, 0, 0, 1, 1,
0.4710386, 0.7389641, -1.106432, 0, 0, 0, 1, 1,
0.4725467, 0.4998538, -0.4244201, 0, 0, 0, 1, 1,
0.4748654, -0.6563358, 2.353173, 0, 0, 0, 1, 1,
0.4771678, -1.245648, 1.79321, 0, 0, 0, 1, 1,
0.4775121, 1.194217, 1.38015, 0, 0, 0, 1, 1,
0.4780317, 0.2646104, -0.196956, 0, 0, 0, 1, 1,
0.484078, 0.682337, 1.03422, 1, 1, 1, 1, 1,
0.48452, 0.7687858, 0.7065371, 1, 1, 1, 1, 1,
0.4881106, -1.840954, 2.933497, 1, 1, 1, 1, 1,
0.4914609, 0.6673506, 0.4797965, 1, 1, 1, 1, 1,
0.4974266, 1.931122, 0.2075425, 1, 1, 1, 1, 1,
0.5050402, 0.3352346, -0.1571935, 1, 1, 1, 1, 1,
0.505205, 1.140818, -0.1774487, 1, 1, 1, 1, 1,
0.5078605, -0.7373725, 2.033208, 1, 1, 1, 1, 1,
0.5089, 0.1838647, 0.9185297, 1, 1, 1, 1, 1,
0.5090939, -0.9015417, 0.9111536, 1, 1, 1, 1, 1,
0.5110672, -0.1794014, 3.078444, 1, 1, 1, 1, 1,
0.5127386, 0.6426127, 1.610235, 1, 1, 1, 1, 1,
0.5138441, -1.475972, 3.079996, 1, 1, 1, 1, 1,
0.5176075, -0.6660443, 2.9691, 1, 1, 1, 1, 1,
0.5184794, 0.08539657, 2.173544, 1, 1, 1, 1, 1,
0.5197552, 0.6300142, 0.4195974, 0, 0, 1, 1, 1,
0.5208524, 1.067661, -1.163622, 1, 0, 0, 1, 1,
0.5218353, 0.02006445, 1.478219, 1, 0, 0, 1, 1,
0.5289317, -0.9681845, 4.228544, 1, 0, 0, 1, 1,
0.5319501, -0.0410049, 0.898773, 1, 0, 0, 1, 1,
0.5348372, -0.1912362, 1.467255, 1, 0, 0, 1, 1,
0.5378714, -0.2648731, 3.40764, 0, 0, 0, 1, 1,
0.5410678, 0.08581831, 1.627833, 0, 0, 0, 1, 1,
0.5478809, 1.109966, 0.8049008, 0, 0, 0, 1, 1,
0.5623794, 0.8000481, -0.3380486, 0, 0, 0, 1, 1,
0.5664279, 0.04087956, 0.8444983, 0, 0, 0, 1, 1,
0.5668317, -1.353995, 2.281374, 0, 0, 0, 1, 1,
0.5693693, -0.7048114, 3.390621, 0, 0, 0, 1, 1,
0.5725996, 0.2094519, 0.9069149, 1, 1, 1, 1, 1,
0.5726233, 1.397464, 0.8785549, 1, 1, 1, 1, 1,
0.5730635, 0.2332257, 1.656965, 1, 1, 1, 1, 1,
0.5775321, 0.04167461, 1.854216, 1, 1, 1, 1, 1,
0.5782414, 0.3472164, 3.08106, 1, 1, 1, 1, 1,
0.5822151, -0.7164832, 2.189837, 1, 1, 1, 1, 1,
0.5824924, 0.9744415, 1.520596, 1, 1, 1, 1, 1,
0.5825444, -0.2846866, 2.615646, 1, 1, 1, 1, 1,
0.5841464, -0.3097427, 0.782437, 1, 1, 1, 1, 1,
0.5870237, -1.243429, 2.289631, 1, 1, 1, 1, 1,
0.5929123, -0.5833259, 4.438565, 1, 1, 1, 1, 1,
0.5934086, -0.3291835, 2.524545, 1, 1, 1, 1, 1,
0.59451, -0.02931874, 1.851206, 1, 1, 1, 1, 1,
0.6030816, 0.2872586, -0.2512753, 1, 1, 1, 1, 1,
0.6040015, -0.723069, 2.334381, 1, 1, 1, 1, 1,
0.6049131, 0.04690347, 1.872039, 0, 0, 1, 1, 1,
0.6079795, -0.1296832, 2.00136, 1, 0, 0, 1, 1,
0.6084199, -0.09875248, 1.848289, 1, 0, 0, 1, 1,
0.6112406, 0.3016002, 2.4234, 1, 0, 0, 1, 1,
0.612062, 0.3108588, 0.439855, 1, 0, 0, 1, 1,
0.6147405, -0.207598, 3.097139, 1, 0, 0, 1, 1,
0.6302111, 0.8951238, 0.3981321, 0, 0, 0, 1, 1,
0.6305897, -1.043337, 2.523485, 0, 0, 0, 1, 1,
0.6370123, -0.09452838, 1.563185, 0, 0, 0, 1, 1,
0.6391894, -1.153018, 3.093602, 0, 0, 0, 1, 1,
0.6438405, -0.8059798, 2.373531, 0, 0, 0, 1, 1,
0.6480301, 0.9293526, 0.07081403, 0, 0, 0, 1, 1,
0.6535476, 0.7239388, 0.573889, 0, 0, 0, 1, 1,
0.6600109, -0.02982325, 1.136714, 1, 1, 1, 1, 1,
0.6637221, 0.72451, 1.082667, 1, 1, 1, 1, 1,
0.6663886, 0.910171, 0.8990456, 1, 1, 1, 1, 1,
0.6713899, 0.8508022, 0.4213779, 1, 1, 1, 1, 1,
0.6728935, -1.178847, 3.816935, 1, 1, 1, 1, 1,
0.6772273, -0.5676948, 2.059482, 1, 1, 1, 1, 1,
0.6817368, -0.4719172, 1.202446, 1, 1, 1, 1, 1,
0.6956363, 0.9673077, 0.8793169, 1, 1, 1, 1, 1,
0.696525, 0.09010919, 1.406644, 1, 1, 1, 1, 1,
0.7008457, 0.5930282, 0.3801477, 1, 1, 1, 1, 1,
0.70458, 0.6917533, 2.18865, 1, 1, 1, 1, 1,
0.7152326, -0.7751768, 2.020164, 1, 1, 1, 1, 1,
0.7200214, 0.09610651, 1.333919, 1, 1, 1, 1, 1,
0.7262012, 1.127964, 1.000175, 1, 1, 1, 1, 1,
0.7301518, 1.421556, 0.7890033, 1, 1, 1, 1, 1,
0.7305815, 1.891919, -0.3615921, 0, 0, 1, 1, 1,
0.733669, 0.1638106, 2.538072, 1, 0, 0, 1, 1,
0.7348104, -0.08358179, 1.669646, 1, 0, 0, 1, 1,
0.7361841, 0.506178, 1.249411, 1, 0, 0, 1, 1,
0.7401507, -1.588404, 1.769916, 1, 0, 0, 1, 1,
0.7467087, -0.5011205, 1.502506, 1, 0, 0, 1, 1,
0.7508528, 0.2519492, 2.10373, 0, 0, 0, 1, 1,
0.7561247, 0.5264434, 0.2744909, 0, 0, 0, 1, 1,
0.758509, 1.193667, -0.4689167, 0, 0, 0, 1, 1,
0.7685834, -0.8706102, 0.7768752, 0, 0, 0, 1, 1,
0.7703683, 0.01665448, 0.8954915, 0, 0, 0, 1, 1,
0.7729411, 1.230399, 0.3755335, 0, 0, 0, 1, 1,
0.7749674, 0.6507547, 2.570036, 0, 0, 0, 1, 1,
0.7828528, 2.120693, 0.8336775, 1, 1, 1, 1, 1,
0.7842947, 0.9712508, 0.2040257, 1, 1, 1, 1, 1,
0.7914531, 0.3654423, 0.8509896, 1, 1, 1, 1, 1,
0.7917188, 1.786742, -0.06981611, 1, 1, 1, 1, 1,
0.8135988, -0.9218029, 2.339775, 1, 1, 1, 1, 1,
0.8172601, 0.8745306, 0.8500617, 1, 1, 1, 1, 1,
0.826152, 0.2212582, 1.47622, 1, 1, 1, 1, 1,
0.8265259, -0.581856, 2.11436, 1, 1, 1, 1, 1,
0.8270398, 2.937196, -0.6260884, 1, 1, 1, 1, 1,
0.8298629, 0.4738552, 0.4643502, 1, 1, 1, 1, 1,
0.8303539, -0.3860505, 3.246909, 1, 1, 1, 1, 1,
0.83287, 0.7428187, 1.518878, 1, 1, 1, 1, 1,
0.8365285, 0.04716573, 1.02399, 1, 1, 1, 1, 1,
0.8369644, -0.7165159, 4.021085, 1, 1, 1, 1, 1,
0.8380559, 0.1815098, 1.600481, 1, 1, 1, 1, 1,
0.8426599, 0.06115891, 1.126863, 0, 0, 1, 1, 1,
0.8455734, 1.312546, 0.752974, 1, 0, 0, 1, 1,
0.8473418, -1.337566, 3.321413, 1, 0, 0, 1, 1,
0.8572819, -1.015423, 1.900051, 1, 0, 0, 1, 1,
0.8595397, 0.4857987, 0.8779842, 1, 0, 0, 1, 1,
0.8596866, -0.08200476, 1.405416, 1, 0, 0, 1, 1,
0.8639641, 0.2246488, -0.2794517, 0, 0, 0, 1, 1,
0.8739178, -0.7198109, 2.400491, 0, 0, 0, 1, 1,
0.8803057, -0.512126, 1.987165, 0, 0, 0, 1, 1,
0.8826917, -0.1667555, 1.981345, 0, 0, 0, 1, 1,
0.8842223, 0.4809076, -0.8068807, 0, 0, 0, 1, 1,
0.8844504, 0.2700803, 1.064459, 0, 0, 0, 1, 1,
0.887181, -0.3372455, 2.073459, 0, 0, 0, 1, 1,
0.8933916, 0.7857515, -0.5153106, 1, 1, 1, 1, 1,
0.9076807, 1.798489, -0.3994583, 1, 1, 1, 1, 1,
0.9157853, 0.8060923, 1.794, 1, 1, 1, 1, 1,
0.917923, -0.6597777, 3.232556, 1, 1, 1, 1, 1,
0.9213655, -2.219905, 3.500186, 1, 1, 1, 1, 1,
0.9220135, -0.7780136, 2.919558, 1, 1, 1, 1, 1,
0.9256726, -0.6919634, 2.243316, 1, 1, 1, 1, 1,
0.9381834, 0.9758388, 1.097514, 1, 1, 1, 1, 1,
0.9391429, 2.917979, -0.5936897, 1, 1, 1, 1, 1,
0.9471906, 0.185887, 3.654746, 1, 1, 1, 1, 1,
0.9511098, 1.014865, -0.3944436, 1, 1, 1, 1, 1,
0.9631149, 0.4886726, 0.6636711, 1, 1, 1, 1, 1,
0.9704264, 0.7740551, 2.038421, 1, 1, 1, 1, 1,
0.9742979, 0.6070108, 1.877962, 1, 1, 1, 1, 1,
0.9869037, -0.2436711, 2.205234, 1, 1, 1, 1, 1,
0.9932942, 0.02664659, 0.2927414, 0, 0, 1, 1, 1,
0.9986347, -0.8800205, 4.317193, 1, 0, 0, 1, 1,
1.002815, 0.1620047, 2.204578, 1, 0, 0, 1, 1,
1.005669, 0.3542982, 0.9599394, 1, 0, 0, 1, 1,
1.008448, -1.568904, 2.920452, 1, 0, 0, 1, 1,
1.009557, 0.2755088, 3.239318, 1, 0, 0, 1, 1,
1.017804, 0.6104159, 1.652355, 0, 0, 0, 1, 1,
1.018759, 0.2257133, 1.583911, 0, 0, 0, 1, 1,
1.030942, -0.851658, 2.925071, 0, 0, 0, 1, 1,
1.032765, 0.8119608, 0.1492205, 0, 0, 0, 1, 1,
1.032883, 0.08717079, 1.95805, 0, 0, 0, 1, 1,
1.033482, 1.158979, 1.368433, 0, 0, 0, 1, 1,
1.033728, 1.234614, -0.6867442, 0, 0, 0, 1, 1,
1.040028, -0.7698984, -0.2367246, 1, 1, 1, 1, 1,
1.045426, 0.7226501, 1.026534, 1, 1, 1, 1, 1,
1.046351, -0.2219928, 2.431436, 1, 1, 1, 1, 1,
1.04809, 0.7092535, 1.038763, 1, 1, 1, 1, 1,
1.055296, 0.2286381, 0.5233822, 1, 1, 1, 1, 1,
1.063468, -0.0852604, 0.9727696, 1, 1, 1, 1, 1,
1.067624, 0.2809249, 1.908009, 1, 1, 1, 1, 1,
1.070386, 0.4546639, 1.296361, 1, 1, 1, 1, 1,
1.072901, 0.1416061, 0.3882592, 1, 1, 1, 1, 1,
1.078264, 1.174013, 1.683235, 1, 1, 1, 1, 1,
1.080351, -0.09422213, 1.382885, 1, 1, 1, 1, 1,
1.08057, -1.342036, 1.948673, 1, 1, 1, 1, 1,
1.081627, 0.5770513, 1.497651, 1, 1, 1, 1, 1,
1.082498, -0.9582189, 2.802468, 1, 1, 1, 1, 1,
1.086743, -0.659965, 2.345839, 1, 1, 1, 1, 1,
1.089746, -1.361959, 2.803446, 0, 0, 1, 1, 1,
1.095039, 1.932381, 2.769346, 1, 0, 0, 1, 1,
1.101328, -0.3566319, 2.532207, 1, 0, 0, 1, 1,
1.101863, 0.07784589, 0.1718294, 1, 0, 0, 1, 1,
1.102057, 0.9275, 1.800204, 1, 0, 0, 1, 1,
1.103001, -0.1916574, 1.423923, 1, 0, 0, 1, 1,
1.107514, 0.2130776, 2.083273, 0, 0, 0, 1, 1,
1.110889, 1.755372, 0.646612, 0, 0, 0, 1, 1,
1.115064, 0.2302652, 0.896927, 0, 0, 0, 1, 1,
1.130191, 1.562521, -1.563169, 0, 0, 0, 1, 1,
1.138187, -0.6867803, 4.148228, 0, 0, 0, 1, 1,
1.140772, 0.09513006, 1.444279, 0, 0, 0, 1, 1,
1.143399, -0.3266551, 2.886744, 0, 0, 0, 1, 1,
1.146485, 2.196349, 1.444828, 1, 1, 1, 1, 1,
1.15213, 0.6650676, 0.9013896, 1, 1, 1, 1, 1,
1.153588, -0.3634544, 0.1584165, 1, 1, 1, 1, 1,
1.161935, -0.7299273, 3.699835, 1, 1, 1, 1, 1,
1.164158, -2.09972, 3.835727, 1, 1, 1, 1, 1,
1.169003, -0.1315419, 3.529152, 1, 1, 1, 1, 1,
1.170895, -0.2652177, 0.5757207, 1, 1, 1, 1, 1,
1.173143, -1.829723, 2.897235, 1, 1, 1, 1, 1,
1.188567, 2.114249, 1.190553, 1, 1, 1, 1, 1,
1.190593, -0.07478594, 2.719079, 1, 1, 1, 1, 1,
1.192826, 0.4414333, 1.28883, 1, 1, 1, 1, 1,
1.194968, 0.562063, 0.6908778, 1, 1, 1, 1, 1,
1.199185, -0.3625697, 1.166067, 1, 1, 1, 1, 1,
1.203406, -0.7191285, 3.293396, 1, 1, 1, 1, 1,
1.207235, -2.28216, 3.013478, 1, 1, 1, 1, 1,
1.207494, -0.6665457, 2.636212, 0, 0, 1, 1, 1,
1.214496, -1.578595, 2.710737, 1, 0, 0, 1, 1,
1.215727, -0.4942027, 1.942256, 1, 0, 0, 1, 1,
1.218271, 0.8249428, 2.291836, 1, 0, 0, 1, 1,
1.225139, -1.476547, 1.797988, 1, 0, 0, 1, 1,
1.22743, -0.3725932, 1.017167, 1, 0, 0, 1, 1,
1.235685, 0.3389055, 0.5564373, 0, 0, 0, 1, 1,
1.237165, -1.216239, 2.646713, 0, 0, 0, 1, 1,
1.24204, -0.1243221, -0.01509989, 0, 0, 0, 1, 1,
1.244076, 0.4567572, 1.089835, 0, 0, 0, 1, 1,
1.253242, -1.13688, 2.881114, 0, 0, 0, 1, 1,
1.271342, 0.3923124, -0.4703182, 0, 0, 0, 1, 1,
1.279909, 0.5536346, 3.594655, 0, 0, 0, 1, 1,
1.288991, 1.022167, 0.5519189, 1, 1, 1, 1, 1,
1.29427, 0.4221416, 2.52622, 1, 1, 1, 1, 1,
1.295386, 0.1483731, 0.3467622, 1, 1, 1, 1, 1,
1.299474, -0.8701549, 3.813392, 1, 1, 1, 1, 1,
1.305406, -0.2095838, 1.661781, 1, 1, 1, 1, 1,
1.305879, -1.110492, 4.507297, 1, 1, 1, 1, 1,
1.314123, -0.825875, 2.755014, 1, 1, 1, 1, 1,
1.314127, -1.563982, 3.170211, 1, 1, 1, 1, 1,
1.316286, -0.5851883, 2.41554, 1, 1, 1, 1, 1,
1.328208, -0.9881516, 2.718414, 1, 1, 1, 1, 1,
1.341107, -0.7614416, 2.290953, 1, 1, 1, 1, 1,
1.345108, 0.5465024, 0.4760544, 1, 1, 1, 1, 1,
1.34729, -0.4738384, 0.179912, 1, 1, 1, 1, 1,
1.354061, 0.9104152, 1.557508, 1, 1, 1, 1, 1,
1.360461, -0.2676383, 2.276592, 1, 1, 1, 1, 1,
1.362592, 1.971458, 2.014318, 0, 0, 1, 1, 1,
1.370919, 0.5587232, -0.6432443, 1, 0, 0, 1, 1,
1.385735, 1.197446, 1.480905, 1, 0, 0, 1, 1,
1.386828, -0.5252792, 2.992455, 1, 0, 0, 1, 1,
1.390395, -0.3686143, 1.248657, 1, 0, 0, 1, 1,
1.40057, -0.3176114, -0.08148268, 1, 0, 0, 1, 1,
1.411131, 1.077484, 0.1457096, 0, 0, 0, 1, 1,
1.414446, -1.888454, 3.022753, 0, 0, 0, 1, 1,
1.415366, 0.2090117, 0.8706381, 0, 0, 0, 1, 1,
1.416937, 1.10513, 1.489808, 0, 0, 0, 1, 1,
1.425974, -2.163827, 1.811055, 0, 0, 0, 1, 1,
1.428938, -0.1581803, 1.643159, 0, 0, 0, 1, 1,
1.440361, 1.505792, 0.2582699, 0, 0, 0, 1, 1,
1.44309, -1.213234, 1.321621, 1, 1, 1, 1, 1,
1.449699, 2.073698, -0.0827933, 1, 1, 1, 1, 1,
1.461647, -0.9813196, 2.322002, 1, 1, 1, 1, 1,
1.464176, -0.7560865, 1.33944, 1, 1, 1, 1, 1,
1.469552, -2.081919, 1.110875, 1, 1, 1, 1, 1,
1.475908, 0.4279178, 0.2862332, 1, 1, 1, 1, 1,
1.477856, -0.4784468, 1.604874, 1, 1, 1, 1, 1,
1.486359, -0.3918808, 2.67307, 1, 1, 1, 1, 1,
1.500662, 1.799532, 0.8788843, 1, 1, 1, 1, 1,
1.521525, 0.129296, 0.8033372, 1, 1, 1, 1, 1,
1.532759, 1.509154, -0.4595836, 1, 1, 1, 1, 1,
1.536241, 0.7773411, 2.778712, 1, 1, 1, 1, 1,
1.542714, -0.9375409, 3.064177, 1, 1, 1, 1, 1,
1.553164, -0.04693014, 3.709999, 1, 1, 1, 1, 1,
1.578006, 1.393825, 0.4611038, 1, 1, 1, 1, 1,
1.581272, -0.2395702, 1.678226, 0, 0, 1, 1, 1,
1.605893, 0.1630694, 1.164869, 1, 0, 0, 1, 1,
1.611288, -0.2418992, -0.05769432, 1, 0, 0, 1, 1,
1.615081, 0.06976289, 2.926816, 1, 0, 0, 1, 1,
1.630413, 1.201307, 0.9827652, 1, 0, 0, 1, 1,
1.648152, -0.6350212, 1.938889, 1, 0, 0, 1, 1,
1.657378, 0.2077685, 1.960149, 0, 0, 0, 1, 1,
1.668446, 0.632439, 1.461588, 0, 0, 0, 1, 1,
1.671209, 0.5614573, 0.7320802, 0, 0, 0, 1, 1,
1.693868, 0.8716021, 0.5275503, 0, 0, 0, 1, 1,
1.69497, 1.217559, 0.2911283, 0, 0, 0, 1, 1,
1.7049, -0.247634, 1.390399, 0, 0, 0, 1, 1,
1.722308, -1.14755, 1.297341, 0, 0, 0, 1, 1,
1.729181, 0.7324162, 0.1107999, 1, 1, 1, 1, 1,
1.729313, -0.03933332, 0.04450861, 1, 1, 1, 1, 1,
1.743422, -0.5360379, 2.204379, 1, 1, 1, 1, 1,
1.748254, -1.313826, 0.3139221, 1, 1, 1, 1, 1,
1.757387, 0.5047439, 0.4929582, 1, 1, 1, 1, 1,
1.778219, -0.3986438, 1.378748, 1, 1, 1, 1, 1,
1.788485, -0.8490327, 3.336498, 1, 1, 1, 1, 1,
1.791498, -0.07307131, 1.723568, 1, 1, 1, 1, 1,
1.794376, -1.369057, 2.18233, 1, 1, 1, 1, 1,
1.795275, -1.903139, 1.460661, 1, 1, 1, 1, 1,
1.803956, -0.9189153, 2.886126, 1, 1, 1, 1, 1,
1.810623, -1.171593, 1.830637, 1, 1, 1, 1, 1,
1.816901, 0.8050177, 3.110831, 1, 1, 1, 1, 1,
1.862694, -0.1897784, 2.228637, 1, 1, 1, 1, 1,
1.903218, -1.193093, 2.316823, 1, 1, 1, 1, 1,
1.905292, 0.6345885, 1.126694, 0, 0, 1, 1, 1,
1.934442, 1.527958, 0.3279372, 1, 0, 0, 1, 1,
1.99772, -0.01067758, 1.064895, 1, 0, 0, 1, 1,
2.023053, -0.0533714, 1.540993, 1, 0, 0, 1, 1,
2.123995, 0.3554291, 1.75811, 1, 0, 0, 1, 1,
2.243345, -0.01754491, 1.206548, 1, 0, 0, 1, 1,
2.315278, 0.6655607, 1.150629, 0, 0, 0, 1, 1,
2.325214, -0.926747, 1.931296, 0, 0, 0, 1, 1,
2.366885, -0.442192, 2.252766, 0, 0, 0, 1, 1,
2.374408, -0.5716279, 0.9647591, 0, 0, 0, 1, 1,
2.404414, 0.3763846, 2.51869, 0, 0, 0, 1, 1,
2.451441, -1.251122, 3.873996, 0, 0, 0, 1, 1,
2.550979, -0.8706576, 3.599223, 0, 0, 0, 1, 1,
2.593012, -0.6253663, 2.249636, 1, 1, 1, 1, 1,
2.715317, -0.6137777, 1.991312, 1, 1, 1, 1, 1,
2.71784, 2.411267, -0.1882761, 1, 1, 1, 1, 1,
2.814612, -1.186336, 2.0602, 1, 1, 1, 1, 1,
2.872579, 0.1782539, 3.116189, 1, 1, 1, 1, 1,
2.879794, 0.219732, 1.073995, 1, 1, 1, 1, 1,
3.188276, 0.4715959, 0.2189852, 1, 1, 1, 1, 1
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
var radius = 9.460038;
var distance = 33.22798;
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
mvMatrix.translate( 0.1153507, -0.138061, 0.05958891 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22798);
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
