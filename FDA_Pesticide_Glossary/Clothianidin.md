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
-3.32403, 0.9411864, -2.633699, 1, 0, 0, 1,
-2.955265, 0.6253944, -0.4797003, 1, 0.007843138, 0, 1,
-2.876066, 1.480291, -0.1888326, 1, 0.01176471, 0, 1,
-2.697157, -1.922302, -2.949919, 1, 0.01960784, 0, 1,
-2.5574, -1.94051, -1.258537, 1, 0.02352941, 0, 1,
-2.55213, 1.180873, 0.01764895, 1, 0.03137255, 0, 1,
-2.496441, 0.1867467, -2.236356, 1, 0.03529412, 0, 1,
-2.435749, 0.461917, 0.3984967, 1, 0.04313726, 0, 1,
-2.361612, 0.2183929, 0.1203689, 1, 0.04705882, 0, 1,
-2.32289, -1.646231, -0.7502818, 1, 0.05490196, 0, 1,
-2.293972, -0.02643598, -0.6197203, 1, 0.05882353, 0, 1,
-2.224704, 1.056097, -0.8862396, 1, 0.06666667, 0, 1,
-2.202672, 1.951717, 0.1133511, 1, 0.07058824, 0, 1,
-2.108881, -0.2524672, 0.9939413, 1, 0.07843138, 0, 1,
-2.09862, -1.128194, -1.125081, 1, 0.08235294, 0, 1,
-2.071591, -1.607157, -1.109181, 1, 0.09019608, 0, 1,
-2.056046, 1.052864, 0.3684513, 1, 0.09411765, 0, 1,
-2.020606, 0.6711029, -1.632315, 1, 0.1019608, 0, 1,
-1.939251, -0.357163, -2.44489, 1, 0.1098039, 0, 1,
-1.904799, -0.07307965, -2.867955, 1, 0.1137255, 0, 1,
-1.867598, -0.06291384, -0.292505, 1, 0.1215686, 0, 1,
-1.858646, 1.815542, -1.039637, 1, 0.1254902, 0, 1,
-1.856075, 0.3589377, -1.04178, 1, 0.1333333, 0, 1,
-1.85117, -0.5048656, -1.815435, 1, 0.1372549, 0, 1,
-1.848435, 0.7286133, 0.828469, 1, 0.145098, 0, 1,
-1.824481, 0.178998, -0.8556893, 1, 0.1490196, 0, 1,
-1.823359, 0.7105847, 0.4505485, 1, 0.1568628, 0, 1,
-1.803089, -2.011298, -1.566186, 1, 0.1607843, 0, 1,
-1.796536, 0.1049997, -1.477309, 1, 0.1686275, 0, 1,
-1.783109, 0.04908744, -2.221566, 1, 0.172549, 0, 1,
-1.771412, -0.4429417, -0.9354256, 1, 0.1803922, 0, 1,
-1.754821, 1.5237, 0.1792766, 1, 0.1843137, 0, 1,
-1.743712, 0.1529661, -1.42117, 1, 0.1921569, 0, 1,
-1.739588, -1.166153, -2.546207, 1, 0.1960784, 0, 1,
-1.732399, -0.5258064, -1.773187, 1, 0.2039216, 0, 1,
-1.714364, 1.379863, -2.077421, 1, 0.2117647, 0, 1,
-1.706074, -0.3097038, -0.8492606, 1, 0.2156863, 0, 1,
-1.705369, 1.461366, 0.9051613, 1, 0.2235294, 0, 1,
-1.696761, 0.1141398, -2.037992, 1, 0.227451, 0, 1,
-1.684222, 0.4148408, -1.266605, 1, 0.2352941, 0, 1,
-1.678932, -0.2635666, 0.3910984, 1, 0.2392157, 0, 1,
-1.673157, -1.034802, -2.624284, 1, 0.2470588, 0, 1,
-1.651047, 0.2480631, -0.2560188, 1, 0.2509804, 0, 1,
-1.64654, 1.493303, 0.02913365, 1, 0.2588235, 0, 1,
-1.645816, 0.04637498, -0.6304961, 1, 0.2627451, 0, 1,
-1.633253, 1.023405, -1.092074, 1, 0.2705882, 0, 1,
-1.631266, 0.1164632, -0.07179545, 1, 0.2745098, 0, 1,
-1.627362, -1.423042, -2.061961, 1, 0.282353, 0, 1,
-1.59664, 0.7657433, -2.063672, 1, 0.2862745, 0, 1,
-1.580225, 0.1003707, -0.6989712, 1, 0.2941177, 0, 1,
-1.576065, -1.763587, -1.79725, 1, 0.3019608, 0, 1,
-1.565293, -0.4323834, -3.005031, 1, 0.3058824, 0, 1,
-1.554128, -1.52055, -2.290031, 1, 0.3137255, 0, 1,
-1.538609, 0.1667184, -3.289549, 1, 0.3176471, 0, 1,
-1.523852, 1.581707, -0.8124479, 1, 0.3254902, 0, 1,
-1.52356, 1.46782, -0.990761, 1, 0.3294118, 0, 1,
-1.523484, 1.100735, -1.595945, 1, 0.3372549, 0, 1,
-1.521644, -0.9920377, -1.770669, 1, 0.3411765, 0, 1,
-1.518786, -0.1269792, -2.945395, 1, 0.3490196, 0, 1,
-1.502515, 1.099057, 0.4960505, 1, 0.3529412, 0, 1,
-1.485166, 0.3059772, 2.171528, 1, 0.3607843, 0, 1,
-1.48508, -0.2949246, -0.600901, 1, 0.3647059, 0, 1,
-1.480071, -1.462597, -3.103598, 1, 0.372549, 0, 1,
-1.476655, 0.648147, -3.192785, 1, 0.3764706, 0, 1,
-1.471099, 0.005982667, -1.648443, 1, 0.3843137, 0, 1,
-1.468311, 1.01421, -1.365566, 1, 0.3882353, 0, 1,
-1.467947, 0.05184049, -2.079578, 1, 0.3960784, 0, 1,
-1.464348, -1.734453, -2.674018, 1, 0.4039216, 0, 1,
-1.455121, -0.4981489, -0.3321245, 1, 0.4078431, 0, 1,
-1.451245, 0.4551668, -2.525653, 1, 0.4156863, 0, 1,
-1.451041, -0.3771717, -2.073578, 1, 0.4196078, 0, 1,
-1.447239, -0.808982, -1.952944, 1, 0.427451, 0, 1,
-1.446501, -0.1819759, -0.528888, 1, 0.4313726, 0, 1,
-1.441579, -0.3589525, -2.077637, 1, 0.4392157, 0, 1,
-1.439331, -0.3151319, -3.219223, 1, 0.4431373, 0, 1,
-1.434376, 1.075942, -0.5963273, 1, 0.4509804, 0, 1,
-1.426473, -1.197708, -1.91806, 1, 0.454902, 0, 1,
-1.415442, -1.330261, -1.070459, 1, 0.4627451, 0, 1,
-1.411632, -1.027454, -3.050233, 1, 0.4666667, 0, 1,
-1.410903, 0.2022141, -2.117474, 1, 0.4745098, 0, 1,
-1.396735, 0.5954964, -1.264336, 1, 0.4784314, 0, 1,
-1.38903, -1.527612, -2.515775, 1, 0.4862745, 0, 1,
-1.371817, -0.3507809, -1.740996, 1, 0.4901961, 0, 1,
-1.368354, -0.5149049, -3.42913, 1, 0.4980392, 0, 1,
-1.363764, -1.237297, -1.180239, 1, 0.5058824, 0, 1,
-1.351246, 0.6848888, -2.517232, 1, 0.509804, 0, 1,
-1.348653, -0.02804281, -0.3273423, 1, 0.5176471, 0, 1,
-1.334532, -1.740883, -2.300798, 1, 0.5215687, 0, 1,
-1.324056, 0.5456396, -0.499959, 1, 0.5294118, 0, 1,
-1.319293, -1.523655, -4.595587, 1, 0.5333334, 0, 1,
-1.31736, 0.6492302, -1.246274, 1, 0.5411765, 0, 1,
-1.316998, 1.474059, 0.2494971, 1, 0.5450981, 0, 1,
-1.315282, 0.1199783, -1.987534, 1, 0.5529412, 0, 1,
-1.31074, -0.9113258, -1.879841, 1, 0.5568628, 0, 1,
-1.30822, 0.1435734, -1.576229, 1, 0.5647059, 0, 1,
-1.302818, 0.6171108, -1.752408, 1, 0.5686275, 0, 1,
-1.300727, 1.205829, -2.068459, 1, 0.5764706, 0, 1,
-1.296451, -0.1686494, -0.1341463, 1, 0.5803922, 0, 1,
-1.293136, 0.6109626, -1.085004, 1, 0.5882353, 0, 1,
-1.290611, -0.1265752, -2.45484, 1, 0.5921569, 0, 1,
-1.288888, 0.3486243, -1.323985, 1, 0.6, 0, 1,
-1.287018, 1.574141, -1.851522, 1, 0.6078432, 0, 1,
-1.278971, -0.305878, -2.187516, 1, 0.6117647, 0, 1,
-1.270587, 0.7230817, -0.6657769, 1, 0.6196079, 0, 1,
-1.262414, -0.6909105, -2.744569, 1, 0.6235294, 0, 1,
-1.261395, 0.7585584, -1.230325, 1, 0.6313726, 0, 1,
-1.258125, 2.292947, -1.231981, 1, 0.6352941, 0, 1,
-1.254686, -0.4459855, -1.415602, 1, 0.6431373, 0, 1,
-1.24814, 1.140014, -0.9647558, 1, 0.6470588, 0, 1,
-1.240585, -0.5524429, -2.312771, 1, 0.654902, 0, 1,
-1.238278, -0.74419, -1.75685, 1, 0.6588235, 0, 1,
-1.23764, -0.08554351, -1.669189, 1, 0.6666667, 0, 1,
-1.237623, -0.7925065, -2.752947, 1, 0.6705883, 0, 1,
-1.229016, -0.1130606, -2.277343, 1, 0.6784314, 0, 1,
-1.227663, 0.9662302, -0.8433577, 1, 0.682353, 0, 1,
-1.219848, -0.09434378, -3.258295, 1, 0.6901961, 0, 1,
-1.21788, -0.2500149, -2.946686, 1, 0.6941177, 0, 1,
-1.215136, -1.019686, -0.6722108, 1, 0.7019608, 0, 1,
-1.200877, 0.3748924, -0.931304, 1, 0.7098039, 0, 1,
-1.200132, -0.1530568, -0.3722314, 1, 0.7137255, 0, 1,
-1.19346, 1.50304, -1.414009, 1, 0.7215686, 0, 1,
-1.191846, 0.3387885, -2.407011, 1, 0.7254902, 0, 1,
-1.189555, 0.1650243, -1.555624, 1, 0.7333333, 0, 1,
-1.169731, -0.4356714, -2.278524, 1, 0.7372549, 0, 1,
-1.162939, 0.5588722, -0.7563671, 1, 0.7450981, 0, 1,
-1.152767, 0.03947293, -3.678647, 1, 0.7490196, 0, 1,
-1.148122, -0.6395274, -1.325799, 1, 0.7568628, 0, 1,
-1.144551, -0.8481028, -1.272143, 1, 0.7607843, 0, 1,
-1.142356, 1.075164, -1.983797, 1, 0.7686275, 0, 1,
-1.140354, 0.1527984, -2.310446, 1, 0.772549, 0, 1,
-1.136572, 0.5147914, -0.2508335, 1, 0.7803922, 0, 1,
-1.132712, -2.640953, -0.7267309, 1, 0.7843137, 0, 1,
-1.128423, 0.3889976, -2.99912, 1, 0.7921569, 0, 1,
-1.120169, 0.2811838, -1.488093, 1, 0.7960784, 0, 1,
-1.118213, -1.516954, -1.453735, 1, 0.8039216, 0, 1,
-1.11789, 1.948917, -1.058313, 1, 0.8117647, 0, 1,
-1.104467, 0.2153237, -3.05179, 1, 0.8156863, 0, 1,
-1.094338, -0.4468241, -2.809751, 1, 0.8235294, 0, 1,
-1.089552, -0.5688224, -2.71505, 1, 0.827451, 0, 1,
-1.081493, -0.2241541, -0.5500281, 1, 0.8352941, 0, 1,
-1.073569, -0.4755686, -2.006653, 1, 0.8392157, 0, 1,
-1.069528, 0.5688999, -1.969424, 1, 0.8470588, 0, 1,
-1.06808, 0.2766744, -0.5509847, 1, 0.8509804, 0, 1,
-1.065951, 0.1318024, -1.265689, 1, 0.8588235, 0, 1,
-1.061603, 0.9749409, -1.676891, 1, 0.8627451, 0, 1,
-1.061125, 0.628146, -1.787548, 1, 0.8705882, 0, 1,
-1.053465, 0.2916334, -1.466418, 1, 0.8745098, 0, 1,
-1.048038, -0.6166194, -2.434665, 1, 0.8823529, 0, 1,
-1.042537, -1.140635, -2.724421, 1, 0.8862745, 0, 1,
-1.040272, 1.105628, 1.257852, 1, 0.8941177, 0, 1,
-1.038982, -0.5883961, -2.963495, 1, 0.8980392, 0, 1,
-1.035397, 0.5041297, -2.248636, 1, 0.9058824, 0, 1,
-1.022871, 0.1722521, -2.93419, 1, 0.9137255, 0, 1,
-1.021371, -0.97047, -3.377451, 1, 0.9176471, 0, 1,
-1.020136, 1.149637, -0.6664653, 1, 0.9254902, 0, 1,
-1.019536, 0.3539053, -0.6331496, 1, 0.9294118, 0, 1,
-1.017791, 0.9355074, -0.08769694, 1, 0.9372549, 0, 1,
-1.01547, -0.5252222, -1.93744, 1, 0.9411765, 0, 1,
-0.9957036, 0.7942181, -0.5647917, 1, 0.9490196, 0, 1,
-0.9943743, -0.2445507, -3.694746, 1, 0.9529412, 0, 1,
-0.9907911, -1.079064, -2.519832, 1, 0.9607843, 0, 1,
-0.9835299, -0.4184196, -1.818352, 1, 0.9647059, 0, 1,
-0.9833323, 1.477769, -1.520716, 1, 0.972549, 0, 1,
-0.9799592, 0.09454387, -2.066608, 1, 0.9764706, 0, 1,
-0.9695346, -0.1245918, -0.7029988, 1, 0.9843137, 0, 1,
-0.9655964, -0.2911302, -3.026457, 1, 0.9882353, 0, 1,
-0.9582326, 0.6294832, -1.158112, 1, 0.9960784, 0, 1,
-0.9507792, 0.7179316, -0.2319484, 0.9960784, 1, 0, 1,
-0.9431742, 0.7231032, -0.1755246, 0.9921569, 1, 0, 1,
-0.9387293, -2.114462, -1.709032, 0.9843137, 1, 0, 1,
-0.936475, 0.7066541, -0.1853918, 0.9803922, 1, 0, 1,
-0.9288045, -0.113177, -1.13917, 0.972549, 1, 0, 1,
-0.9262492, -1.181792, -3.302791, 0.9686275, 1, 0, 1,
-0.9260734, -0.6304228, -1.178344, 0.9607843, 1, 0, 1,
-0.9237694, -2.096938, -3.665554, 0.9568627, 1, 0, 1,
-0.9187437, 2.357784, -0.789228, 0.9490196, 1, 0, 1,
-0.9159858, 0.04088212, -0.05977161, 0.945098, 1, 0, 1,
-0.9115816, 1.17204, 0.1187981, 0.9372549, 1, 0, 1,
-0.9008088, -1.363669, -1.551907, 0.9333333, 1, 0, 1,
-0.899648, -0.03147585, -0.641664, 0.9254902, 1, 0, 1,
-0.8993191, -0.4021489, -0.7135348, 0.9215686, 1, 0, 1,
-0.8899441, 0.7920973, -1.770429, 0.9137255, 1, 0, 1,
-0.8822265, 0.4461406, 0.3228931, 0.9098039, 1, 0, 1,
-0.8804729, -0.2755539, -2.587553, 0.9019608, 1, 0, 1,
-0.8802758, 1.449584, -0.5135201, 0.8941177, 1, 0, 1,
-0.8786956, -1.700588, -1.704364, 0.8901961, 1, 0, 1,
-0.8780118, -0.1726881, -1.270532, 0.8823529, 1, 0, 1,
-0.8720678, 0.3308039, -1.404674, 0.8784314, 1, 0, 1,
-0.8601696, -0.110451, -3.408345, 0.8705882, 1, 0, 1,
-0.8564457, 0.3787467, -0.5341648, 0.8666667, 1, 0, 1,
-0.8558848, 0.9496996, 0.1301076, 0.8588235, 1, 0, 1,
-0.8505756, -0.4546828, -0.1749051, 0.854902, 1, 0, 1,
-0.8500626, 0.1915448, -0.7641618, 0.8470588, 1, 0, 1,
-0.848542, 1.377228, -1.229863, 0.8431373, 1, 0, 1,
-0.8434902, 1.678885, -1.042095, 0.8352941, 1, 0, 1,
-0.8402143, -1.078339, -3.3118, 0.8313726, 1, 0, 1,
-0.8378186, -0.4913232, -3.234606, 0.8235294, 1, 0, 1,
-0.8368651, -1.055996, -1.49688, 0.8196079, 1, 0, 1,
-0.8359461, 0.4760101, -1.471554, 0.8117647, 1, 0, 1,
-0.8338503, -1.303241, -1.871854, 0.8078431, 1, 0, 1,
-0.8289708, -0.05760496, -2.156767, 0.8, 1, 0, 1,
-0.824897, -0.7350305, -0.4230883, 0.7921569, 1, 0, 1,
-0.823595, 0.9168582, 0.07614027, 0.7882353, 1, 0, 1,
-0.8181681, 1.119796, -1.98788, 0.7803922, 1, 0, 1,
-0.8153378, 0.4030701, -1.850901, 0.7764706, 1, 0, 1,
-0.8129758, 1.673018, -0.4247496, 0.7686275, 1, 0, 1,
-0.8109446, -0.09082224, -1.651143, 0.7647059, 1, 0, 1,
-0.8055825, -1.001879, -2.116802, 0.7568628, 1, 0, 1,
-0.8052078, 0.3549723, 0.1426194, 0.7529412, 1, 0, 1,
-0.8008263, 1.938501, -0.6228294, 0.7450981, 1, 0, 1,
-0.8007749, -2.156616, -3.129338, 0.7411765, 1, 0, 1,
-0.8001873, -1.252599, -3.413791, 0.7333333, 1, 0, 1,
-0.7947119, 1.214473, -2.285838, 0.7294118, 1, 0, 1,
-0.7896963, 1.465863, -0.7209523, 0.7215686, 1, 0, 1,
-0.7860579, -0.383338, -2.642037, 0.7176471, 1, 0, 1,
-0.7858447, -0.7159044, -1.672813, 0.7098039, 1, 0, 1,
-0.7853639, 0.8845613, 1.143877, 0.7058824, 1, 0, 1,
-0.7774724, 0.2675769, -1.40828, 0.6980392, 1, 0, 1,
-0.7518023, -0.02970735, -1.331491, 0.6901961, 1, 0, 1,
-0.7516071, -0.2552466, -0.5414605, 0.6862745, 1, 0, 1,
-0.7460116, 0.1973664, -0.5289978, 0.6784314, 1, 0, 1,
-0.7453305, 0.6004617, -0.3847524, 0.6745098, 1, 0, 1,
-0.745172, -0.430716, -2.922094, 0.6666667, 1, 0, 1,
-0.7444329, -0.4338723, -3.550121, 0.6627451, 1, 0, 1,
-0.7366596, -0.977882, -3.374339, 0.654902, 1, 0, 1,
-0.7289035, -0.1116032, 0.2820141, 0.6509804, 1, 0, 1,
-0.7212133, 1.052459, -1.552823, 0.6431373, 1, 0, 1,
-0.7198077, 0.2011875, -2.789305, 0.6392157, 1, 0, 1,
-0.7187504, 2.297479, -2.460211, 0.6313726, 1, 0, 1,
-0.7052232, -1.930181, -4.307101, 0.627451, 1, 0, 1,
-0.7022676, -1.657273, -3.010996, 0.6196079, 1, 0, 1,
-0.6974498, -0.09368964, -3.577186, 0.6156863, 1, 0, 1,
-0.6912834, -0.7157184, -1.890302, 0.6078432, 1, 0, 1,
-0.6901628, 1.5016, 0.5327241, 0.6039216, 1, 0, 1,
-0.68574, 0.5180878, 0.01973741, 0.5960785, 1, 0, 1,
-0.6750732, 0.5160454, -1.68917, 0.5882353, 1, 0, 1,
-0.672343, -0.4227329, -2.56076, 0.5843138, 1, 0, 1,
-0.6716682, 0.5341986, 0.3501613, 0.5764706, 1, 0, 1,
-0.6698908, -1.152193, -1.472142, 0.572549, 1, 0, 1,
-0.6689802, 0.3601181, 0.5217057, 0.5647059, 1, 0, 1,
-0.6618809, 0.6640649, -1.350509, 0.5607843, 1, 0, 1,
-0.6617466, 0.2837254, -0.748867, 0.5529412, 1, 0, 1,
-0.6548126, 1.827666, -1.077798, 0.5490196, 1, 0, 1,
-0.6524663, 0.46684, -0.241063, 0.5411765, 1, 0, 1,
-0.6501831, 0.5066988, -1.62913, 0.5372549, 1, 0, 1,
-0.6477115, 0.06472895, -0.9807992, 0.5294118, 1, 0, 1,
-0.6441948, -0.5716015, -2.99172, 0.5254902, 1, 0, 1,
-0.6432403, 0.3305964, -2.319253, 0.5176471, 1, 0, 1,
-0.6426867, 0.9616879, 0.0104142, 0.5137255, 1, 0, 1,
-0.6403836, -1.665626, -4.034717, 0.5058824, 1, 0, 1,
-0.6372342, 0.3617364, -1.585887, 0.5019608, 1, 0, 1,
-0.6321353, 0.1014485, -1.391549, 0.4941176, 1, 0, 1,
-0.6299449, -0.1281235, -1.134345, 0.4862745, 1, 0, 1,
-0.6296494, -0.3335635, -2.309288, 0.4823529, 1, 0, 1,
-0.6241887, 0.5573241, -0.6652272, 0.4745098, 1, 0, 1,
-0.6203845, 1.692075, -0.8423235, 0.4705882, 1, 0, 1,
-0.6168374, -1.202624, -1.621362, 0.4627451, 1, 0, 1,
-0.6163726, -0.7684442, -1.174675, 0.4588235, 1, 0, 1,
-0.6126164, 0.8197267, -1.227447, 0.4509804, 1, 0, 1,
-0.6113044, 0.04451126, -2.544121, 0.4470588, 1, 0, 1,
-0.6097893, 0.3035348, -2.573925, 0.4392157, 1, 0, 1,
-0.6079932, 1.314685, 0.6249893, 0.4352941, 1, 0, 1,
-0.6073509, 0.5455815, 1.085726, 0.427451, 1, 0, 1,
-0.6069584, -0.3625013, -2.209799, 0.4235294, 1, 0, 1,
-0.6056955, 0.893783, 1.510731, 0.4156863, 1, 0, 1,
-0.6045794, -0.5223929, -2.921868, 0.4117647, 1, 0, 1,
-0.6028688, 0.1125645, -1.129237, 0.4039216, 1, 0, 1,
-0.602099, -0.1596502, -3.900099, 0.3960784, 1, 0, 1,
-0.5966241, 2.1429, 0.3360283, 0.3921569, 1, 0, 1,
-0.5915605, -1.282661, -2.937828, 0.3843137, 1, 0, 1,
-0.5910766, -0.5242711, -1.852391, 0.3803922, 1, 0, 1,
-0.5903613, 0.2069347, -2.140918, 0.372549, 1, 0, 1,
-0.5885332, -0.3279952, -0.7564048, 0.3686275, 1, 0, 1,
-0.5857068, 0.5806679, -0.4603197, 0.3607843, 1, 0, 1,
-0.5808, 2.3426, -1.566956, 0.3568628, 1, 0, 1,
-0.5691979, -0.09827776, -2.14317, 0.3490196, 1, 0, 1,
-0.5676081, 1.65034, -0.6449773, 0.345098, 1, 0, 1,
-0.5526988, 1.641977, -0.6752253, 0.3372549, 1, 0, 1,
-0.5505858, -0.07513022, -2.474121, 0.3333333, 1, 0, 1,
-0.5495701, 1.064818, 0.0496301, 0.3254902, 1, 0, 1,
-0.548108, 0.1072554, -1.424465, 0.3215686, 1, 0, 1,
-0.5460653, 1.946479, -0.3659467, 0.3137255, 1, 0, 1,
-0.5377319, -0.1665011, -2.204154, 0.3098039, 1, 0, 1,
-0.5376543, -1.498807, -3.229463, 0.3019608, 1, 0, 1,
-0.5359746, 1.283468, -1.494865, 0.2941177, 1, 0, 1,
-0.5309084, 0.475898, -0.1504078, 0.2901961, 1, 0, 1,
-0.5196214, -0.4023792, -1.524348, 0.282353, 1, 0, 1,
-0.5193091, 0.5907646, 0.177007, 0.2784314, 1, 0, 1,
-0.5117005, 0.02328978, -2.101102, 0.2705882, 1, 0, 1,
-0.5104204, 0.7142561, -1.946119, 0.2666667, 1, 0, 1,
-0.504025, -1.467426, -3.275368, 0.2588235, 1, 0, 1,
-0.4992886, -0.5543624, -2.502173, 0.254902, 1, 0, 1,
-0.4956087, 0.4691486, -2.012727, 0.2470588, 1, 0, 1,
-0.492373, 1.408594, 0.3889809, 0.2431373, 1, 0, 1,
-0.4868889, -1.416947, -1.443959, 0.2352941, 1, 0, 1,
-0.4808822, -0.7868709, -2.828533, 0.2313726, 1, 0, 1,
-0.4770562, -0.4281098, -2.699497, 0.2235294, 1, 0, 1,
-0.4669148, -0.02175923, -3.953022, 0.2196078, 1, 0, 1,
-0.4648222, -1.308185, -3.021658, 0.2117647, 1, 0, 1,
-0.4634837, -1.421525, -1.987799, 0.2078431, 1, 0, 1,
-0.4629991, -0.4765572, -2.776877, 0.2, 1, 0, 1,
-0.4603634, 0.8055871, -0.7779719, 0.1921569, 1, 0, 1,
-0.4588059, 0.6400516, -2.559465, 0.1882353, 1, 0, 1,
-0.4575448, -1.25263, -2.0006, 0.1803922, 1, 0, 1,
-0.4530261, 1.789347, -0.7822419, 0.1764706, 1, 0, 1,
-0.4521161, 1.101364, 1.87312, 0.1686275, 1, 0, 1,
-0.4453416, -0.7065222, -2.544886, 0.1647059, 1, 0, 1,
-0.4451741, -0.8652595, -2.118425, 0.1568628, 1, 0, 1,
-0.4422412, -0.2077784, -1.403573, 0.1529412, 1, 0, 1,
-0.4357421, -1.422873, -2.465177, 0.145098, 1, 0, 1,
-0.4346366, 0.6903865, -0.924078, 0.1411765, 1, 0, 1,
-0.4314513, -0.4372275, -2.880886, 0.1333333, 1, 0, 1,
-0.4301904, -0.3813277, -4.260279, 0.1294118, 1, 0, 1,
-0.4299577, 1.992337, 0.8854595, 0.1215686, 1, 0, 1,
-0.4270557, -0.5630116, -1.07362, 0.1176471, 1, 0, 1,
-0.4267962, 0.08922955, -1.229074, 0.1098039, 1, 0, 1,
-0.4264446, -0.6354264, -2.319009, 0.1058824, 1, 0, 1,
-0.4231659, -0.3722532, -3.633767, 0.09803922, 1, 0, 1,
-0.4206773, -1.682692, -3.599569, 0.09019608, 1, 0, 1,
-0.4170778, 0.6789878, -0.6806749, 0.08627451, 1, 0, 1,
-0.4141133, -0.01621667, -1.761939, 0.07843138, 1, 0, 1,
-0.4138163, 0.2114894, -0.2536606, 0.07450981, 1, 0, 1,
-0.4131659, 0.1758301, -1.287288, 0.06666667, 1, 0, 1,
-0.4119596, -0.8276059, -2.82419, 0.0627451, 1, 0, 1,
-0.4098135, -1.268433, -0.6411077, 0.05490196, 1, 0, 1,
-0.4060065, 0.9365015, -0.4898456, 0.05098039, 1, 0, 1,
-0.403677, 0.6910055, -2.009714, 0.04313726, 1, 0, 1,
-0.400523, 0.682656, -2.526175, 0.03921569, 1, 0, 1,
-0.3995569, -0.01439203, -1.896101, 0.03137255, 1, 0, 1,
-0.3990827, -2.467957, -3.048201, 0.02745098, 1, 0, 1,
-0.3984234, -0.3462383, -2.476933, 0.01960784, 1, 0, 1,
-0.3979402, -1.509571, -1.824718, 0.01568628, 1, 0, 1,
-0.3928728, -0.7208586, -2.40968, 0.007843138, 1, 0, 1,
-0.3912027, -0.1005433, -3.139309, 0.003921569, 1, 0, 1,
-0.3810768, -0.1255755, -3.233265, 0, 1, 0.003921569, 1,
-0.3772964, 1.104626, -1.318567, 0, 1, 0.01176471, 1,
-0.3766034, -2.243082, -2.343126, 0, 1, 0.01568628, 1,
-0.3748908, 0.06608936, -1.911227, 0, 1, 0.02352941, 1,
-0.3739397, 1.414712, 2.985895, 0, 1, 0.02745098, 1,
-0.3733831, -0.3211943, -2.704427, 0, 1, 0.03529412, 1,
-0.361668, 1.543311, 0.4500577, 0, 1, 0.03921569, 1,
-0.3600277, -1.208731, -0.5406951, 0, 1, 0.04705882, 1,
-0.3557713, 0.3204493, -1.513085, 0, 1, 0.05098039, 1,
-0.3547227, 0.891464, 1.15685, 0, 1, 0.05882353, 1,
-0.3510001, 2.695557, -1.212349, 0, 1, 0.0627451, 1,
-0.3447532, -0.5212057, -2.761914, 0, 1, 0.07058824, 1,
-0.3418023, 0.292043, -3.920062, 0, 1, 0.07450981, 1,
-0.3416365, 1.458528, -0.7664752, 0, 1, 0.08235294, 1,
-0.3408122, -0.6644139, -2.884267, 0, 1, 0.08627451, 1,
-0.3395762, -0.678602, -1.209457, 0, 1, 0.09411765, 1,
-0.332389, 1.981338, -1.566984, 0, 1, 0.1019608, 1,
-0.3239291, -0.9651183, -3.377967, 0, 1, 0.1058824, 1,
-0.3231118, -0.8739913, -0.1803463, 0, 1, 0.1137255, 1,
-0.3156588, -0.7837222, -2.750661, 0, 1, 0.1176471, 1,
-0.3075072, -0.3640565, -2.765719, 0, 1, 0.1254902, 1,
-0.3068134, 0.6278296, -0.2920865, 0, 1, 0.1294118, 1,
-0.3044195, -0.7490445, -3.160405, 0, 1, 0.1372549, 1,
-0.3032746, 0.1251457, 0.2859864, 0, 1, 0.1411765, 1,
-0.3026887, -1.947555, -3.798407, 0, 1, 0.1490196, 1,
-0.301853, 0.2670536, -1.501601, 0, 1, 0.1529412, 1,
-0.2983907, -0.09135368, -4.011279, 0, 1, 0.1607843, 1,
-0.2975638, 0.6777155, -2.075761, 0, 1, 0.1647059, 1,
-0.2943223, -0.594011, -2.402287, 0, 1, 0.172549, 1,
-0.2917965, -0.270649, -3.882155, 0, 1, 0.1764706, 1,
-0.2897673, -0.4941915, -2.920382, 0, 1, 0.1843137, 1,
-0.2890314, 0.6832144, 0.2998084, 0, 1, 0.1882353, 1,
-0.2845593, 0.4731423, 0.1532865, 0, 1, 0.1960784, 1,
-0.2827224, -0.1463175, -0.4089476, 0, 1, 0.2039216, 1,
-0.2762316, -0.1933233, -2.325178, 0, 1, 0.2078431, 1,
-0.2752722, -0.3458437, -1.63568, 0, 1, 0.2156863, 1,
-0.2738126, -0.07997929, -1.309409, 0, 1, 0.2196078, 1,
-0.2661445, -0.1242137, -2.558874, 0, 1, 0.227451, 1,
-0.2657315, 0.8605635, 0.2715729, 0, 1, 0.2313726, 1,
-0.2648366, 0.7492142, -2.933941, 0, 1, 0.2392157, 1,
-0.2639702, -0.5364973, -3.778134, 0, 1, 0.2431373, 1,
-0.2636106, 1.237449, -0.1688397, 0, 1, 0.2509804, 1,
-0.2631606, 0.5193396, -0.7698674, 0, 1, 0.254902, 1,
-0.2578174, 0.06679998, -2.099822, 0, 1, 0.2627451, 1,
-0.2553337, -0.0465075, -1.818308, 0, 1, 0.2666667, 1,
-0.2544746, 1.515401, -0.3552528, 0, 1, 0.2745098, 1,
-0.2534044, -0.3636912, -3.830726, 0, 1, 0.2784314, 1,
-0.2503279, -0.8702255, -3.815309, 0, 1, 0.2862745, 1,
-0.2475163, -1.764032, -4.01904, 0, 1, 0.2901961, 1,
-0.246897, 0.4916608, 0.130934, 0, 1, 0.2980392, 1,
-0.2463476, 0.2867438, -1.19513, 0, 1, 0.3058824, 1,
-0.2459768, 0.6906289, -1.305674, 0, 1, 0.3098039, 1,
-0.2400789, -0.1361128, -2.029221, 0, 1, 0.3176471, 1,
-0.2399597, -2.203396, -4.051382, 0, 1, 0.3215686, 1,
-0.2391878, -1.458009, -3.445066, 0, 1, 0.3294118, 1,
-0.2324621, -1.529272, -4.309593, 0, 1, 0.3333333, 1,
-0.2320893, 0.3149164, -1.194748, 0, 1, 0.3411765, 1,
-0.2309479, 0.03714273, -2.447231, 0, 1, 0.345098, 1,
-0.2303852, -0.1536179, -4.374372, 0, 1, 0.3529412, 1,
-0.2258419, -0.4010859, -2.633715, 0, 1, 0.3568628, 1,
-0.224323, 0.4457007, -0.4207859, 0, 1, 0.3647059, 1,
-0.2241301, -0.6631714, -2.709343, 0, 1, 0.3686275, 1,
-0.2227017, 0.7919608, -1.8375, 0, 1, 0.3764706, 1,
-0.2200969, 0.02556545, -1.389651, 0, 1, 0.3803922, 1,
-0.2152594, 0.6572866, -0.6571992, 0, 1, 0.3882353, 1,
-0.213952, -0.8128537, -3.642143, 0, 1, 0.3921569, 1,
-0.2131873, -0.556363, -0.6881096, 0, 1, 0.4, 1,
-0.2130344, -0.2229893, -2.356385, 0, 1, 0.4078431, 1,
-0.2129534, 0.1819922, -2.174778, 0, 1, 0.4117647, 1,
-0.2116317, 0.93309, 0.7066042, 0, 1, 0.4196078, 1,
-0.2093643, -2.224135, -2.821405, 0, 1, 0.4235294, 1,
-0.2092807, 0.8246371, 0.5559999, 0, 1, 0.4313726, 1,
-0.2018269, -0.02863429, -1.049882, 0, 1, 0.4352941, 1,
-0.1926598, -0.7767072, -3.963792, 0, 1, 0.4431373, 1,
-0.1916011, 0.1783413, -1.773589, 0, 1, 0.4470588, 1,
-0.1898297, 0.3063146, -0.7275608, 0, 1, 0.454902, 1,
-0.1876619, 1.478711, -0.5161517, 0, 1, 0.4588235, 1,
-0.1819707, 2.320883, -0.4895536, 0, 1, 0.4666667, 1,
-0.1781797, -0.7175559, -3.492908, 0, 1, 0.4705882, 1,
-0.1771648, 0.09991302, -2.034996, 0, 1, 0.4784314, 1,
-0.1770678, -0.6835369, -3.017227, 0, 1, 0.4823529, 1,
-0.1758755, -0.2211287, -2.624845, 0, 1, 0.4901961, 1,
-0.1742478, 1.284871, -0.6677127, 0, 1, 0.4941176, 1,
-0.1724721, 0.7175175, 1.138947, 0, 1, 0.5019608, 1,
-0.1717474, 0.614497, 1.743483, 0, 1, 0.509804, 1,
-0.1713318, 2.274725, -1.72429, 0, 1, 0.5137255, 1,
-0.1709099, 0.02667478, -2.16891, 0, 1, 0.5215687, 1,
-0.1707412, 1.73892, 0.6360881, 0, 1, 0.5254902, 1,
-0.1683494, -0.07299925, -2.930256, 0, 1, 0.5333334, 1,
-0.1586847, -0.6237975, -2.75518, 0, 1, 0.5372549, 1,
-0.157951, 1.433207, 0.2943003, 0, 1, 0.5450981, 1,
-0.155266, 0.6502261, 0.8701203, 0, 1, 0.5490196, 1,
-0.1527321, -0.2683204, -4.757872, 0, 1, 0.5568628, 1,
-0.148842, 0.7669148, 0.6253005, 0, 1, 0.5607843, 1,
-0.1436712, 0.6753017, -1.497601, 0, 1, 0.5686275, 1,
-0.1431511, -0.6121332, -1.952438, 0, 1, 0.572549, 1,
-0.1408729, 0.6910171, -0.4962499, 0, 1, 0.5803922, 1,
-0.1405545, 0.457024, -0.4309998, 0, 1, 0.5843138, 1,
-0.1372409, 1.684475, 0.3683021, 0, 1, 0.5921569, 1,
-0.1348098, 0.3610196, -1.539909, 0, 1, 0.5960785, 1,
-0.1325979, 0.5096743, 0.2490881, 0, 1, 0.6039216, 1,
-0.1276551, -0.009343543, -1.773517, 0, 1, 0.6117647, 1,
-0.1237156, 0.5775669, 1.468234, 0, 1, 0.6156863, 1,
-0.1233518, -0.4455634, -4.247488, 0, 1, 0.6235294, 1,
-0.1221174, 0.101311, 0.165047, 0, 1, 0.627451, 1,
-0.1166218, -0.5363623, -2.635109, 0, 1, 0.6352941, 1,
-0.1162983, -0.06140197, -0.208174, 0, 1, 0.6392157, 1,
-0.1090745, -0.6299909, -4.437136, 0, 1, 0.6470588, 1,
-0.1065159, -0.1183022, -4.164265, 0, 1, 0.6509804, 1,
-0.1043256, 1.751576, -1.409468, 0, 1, 0.6588235, 1,
-0.1041291, -1.185654, -3.513679, 0, 1, 0.6627451, 1,
-0.1006263, 1.647101, -0.7365277, 0, 1, 0.6705883, 1,
-0.09960572, 0.08872622, -0.2847874, 0, 1, 0.6745098, 1,
-0.09880825, -0.4825929, -2.847978, 0, 1, 0.682353, 1,
-0.09848449, 1.743431, -1.241157, 0, 1, 0.6862745, 1,
-0.09238511, -0.9532417, -3.442438, 0, 1, 0.6941177, 1,
-0.08843625, 0.5849621, 0.820793, 0, 1, 0.7019608, 1,
-0.08730166, -0.02287048, -3.387182, 0, 1, 0.7058824, 1,
-0.08511608, -0.07811467, -1.911164, 0, 1, 0.7137255, 1,
-0.08266224, 0.6000395, 1.73224, 0, 1, 0.7176471, 1,
-0.08157232, -0.9795647, -1.93717, 0, 1, 0.7254902, 1,
-0.07361852, -1.700135, -2.867409, 0, 1, 0.7294118, 1,
-0.07361767, 2.405503, 0.05054035, 0, 1, 0.7372549, 1,
-0.07247509, -0.6419426, -1.40031, 0, 1, 0.7411765, 1,
-0.06805226, -2.299094, -3.803206, 0, 1, 0.7490196, 1,
-0.0626952, -0.5027549, -2.561515, 0, 1, 0.7529412, 1,
-0.06248813, 1.039359, -0.718448, 0, 1, 0.7607843, 1,
-0.05998233, -2.120816, -3.35113, 0, 1, 0.7647059, 1,
-0.05871457, -0.7339361, -2.351655, 0, 1, 0.772549, 1,
-0.05567045, -0.009382231, -1.914444, 0, 1, 0.7764706, 1,
-0.05562481, -0.04634763, -1.382933, 0, 1, 0.7843137, 1,
-0.05169423, -0.324977, -2.092265, 0, 1, 0.7882353, 1,
-0.04570259, 0.2905865, -1.012149, 0, 1, 0.7960784, 1,
-0.0450851, 0.4829318, -0.817904, 0, 1, 0.8039216, 1,
-0.04391434, 0.06125776, -0.8841351, 0, 1, 0.8078431, 1,
-0.04378109, -0.7401654, -3.944749, 0, 1, 0.8156863, 1,
-0.04118757, 2.010966, 0.1559893, 0, 1, 0.8196079, 1,
-0.040365, -0.7918246, -2.318559, 0, 1, 0.827451, 1,
-0.03967468, 1.208521, -0.583209, 0, 1, 0.8313726, 1,
-0.03670711, -0.4949997, -1.742406, 0, 1, 0.8392157, 1,
-0.03630922, 0.3846893, -1.071283, 0, 1, 0.8431373, 1,
-0.03566697, -1.787272, -3.415327, 0, 1, 0.8509804, 1,
-0.03561913, 0.7937331, -1.730397, 0, 1, 0.854902, 1,
-0.03412317, 1.983418, 1.358417, 0, 1, 0.8627451, 1,
-0.03002995, 0.1585788, 1.175544, 0, 1, 0.8666667, 1,
-0.02403904, 0.5957981, 0.6021315, 0, 1, 0.8745098, 1,
-0.02158276, -1.453755, -3.724193, 0, 1, 0.8784314, 1,
-0.01732647, -0.04969344, -2.211202, 0, 1, 0.8862745, 1,
-0.0158163, -0.2159392, -4.98102, 0, 1, 0.8901961, 1,
-0.01453769, 0.1653938, -1.380947, 0, 1, 0.8980392, 1,
-0.01324933, -1.692083, -4.006862, 0, 1, 0.9058824, 1,
-0.01183099, 0.06569753, -0.1318891, 0, 1, 0.9098039, 1,
-0.009907472, -0.689393, -1.5441, 0, 1, 0.9176471, 1,
-0.00990322, -0.4141847, -3.271469, 0, 1, 0.9215686, 1,
-0.008311078, -1.18474, -2.922199, 0, 1, 0.9294118, 1,
-0.005103342, 0.2300911, 1.464848, 0, 1, 0.9333333, 1,
0.001050912, -1.149292, 2.780512, 0, 1, 0.9411765, 1,
0.001959353, -0.0003513114, 1.817136, 0, 1, 0.945098, 1,
0.003297573, -2.081055, 2.377456, 0, 1, 0.9529412, 1,
0.004321935, -1.010857, 2.598899, 0, 1, 0.9568627, 1,
0.006922632, -0.1443426, 3.383579, 0, 1, 0.9647059, 1,
0.007182253, 0.3294713, -0.3281625, 0, 1, 0.9686275, 1,
0.01028114, 0.8812733, -1.393931, 0, 1, 0.9764706, 1,
0.01423567, 1.261062, -0.9402062, 0, 1, 0.9803922, 1,
0.01541833, -1.424838, 3.40894, 0, 1, 0.9882353, 1,
0.01803184, -0.3417066, 1.702232, 0, 1, 0.9921569, 1,
0.01904473, -2.322126, 3.190941, 0, 1, 1, 1,
0.02060895, 1.119588, -0.5535341, 0, 0.9921569, 1, 1,
0.02672849, 1.167554, 0.02076861, 0, 0.9882353, 1, 1,
0.02850083, 0.04000745, 0.7923535, 0, 0.9803922, 1, 1,
0.03144998, 1.258705, -1.143009, 0, 0.9764706, 1, 1,
0.04747687, -1.101204, 2.429664, 0, 0.9686275, 1, 1,
0.04981806, 0.2441532, -0.9294196, 0, 0.9647059, 1, 1,
0.05285425, -0.4862176, 2.875878, 0, 0.9568627, 1, 1,
0.058654, 0.2979056, 0.9778346, 0, 0.9529412, 1, 1,
0.06133778, -0.403346, 3.07323, 0, 0.945098, 1, 1,
0.061497, -0.5161147, 2.593646, 0, 0.9411765, 1, 1,
0.06226264, 0.06662815, -1.002455, 0, 0.9333333, 1, 1,
0.06452001, -0.3198107, 2.736435, 0, 0.9294118, 1, 1,
0.06591579, 0.8077213, -0.7764464, 0, 0.9215686, 1, 1,
0.06696042, 0.0339282, 1.225973, 0, 0.9176471, 1, 1,
0.06743822, 1.865803, -1.282533, 0, 0.9098039, 1, 1,
0.06758977, -0.4688794, 3.164248, 0, 0.9058824, 1, 1,
0.06833811, 1.663333, 0.9995369, 0, 0.8980392, 1, 1,
0.07033845, -0.00264768, 1.081359, 0, 0.8901961, 1, 1,
0.07612728, -0.6853909, 4.094755, 0, 0.8862745, 1, 1,
0.07660879, -0.1895281, 1.02402, 0, 0.8784314, 1, 1,
0.07781771, -0.7799439, 4.763972, 0, 0.8745098, 1, 1,
0.07784849, -0.07337675, 2.558453, 0, 0.8666667, 1, 1,
0.07849266, -1.065657, 4.086922, 0, 0.8627451, 1, 1,
0.08186713, 0.8493099, 0.3097721, 0, 0.854902, 1, 1,
0.08208367, 1.008755, 1.070732, 0, 0.8509804, 1, 1,
0.08312356, 1.160877, -0.781748, 0, 0.8431373, 1, 1,
0.08376123, -0.1632684, 1.535052, 0, 0.8392157, 1, 1,
0.08675539, -0.8191641, 2.788587, 0, 0.8313726, 1, 1,
0.08692488, -0.1000464, 5.039455, 0, 0.827451, 1, 1,
0.08910459, -0.9510993, 2.842527, 0, 0.8196079, 1, 1,
0.09185969, -1.193197, 4.247053, 0, 0.8156863, 1, 1,
0.09778285, -2.014907, 1.991329, 0, 0.8078431, 1, 1,
0.1037095, -0.5279018, 2.773345, 0, 0.8039216, 1, 1,
0.1040371, 0.7861371, 0.2883695, 0, 0.7960784, 1, 1,
0.1043654, 0.2545874, -0.7740172, 0, 0.7882353, 1, 1,
0.1074587, 0.7388824, -0.4657146, 0, 0.7843137, 1, 1,
0.1091485, -0.0120691, 1.18101, 0, 0.7764706, 1, 1,
0.1093035, 0.356691, 0.05431078, 0, 0.772549, 1, 1,
0.1190424, 0.6223155, -1.055498, 0, 0.7647059, 1, 1,
0.1191249, -1.835661, 1.878509, 0, 0.7607843, 1, 1,
0.1250842, 0.0002001908, 5.432112, 0, 0.7529412, 1, 1,
0.1261458, 1.66965, -1.774309, 0, 0.7490196, 1, 1,
0.1322146, 1.213755, 0.06819706, 0, 0.7411765, 1, 1,
0.1362548, 0.1484794, 1.799415, 0, 0.7372549, 1, 1,
0.1376493, 2.485516, -0.1595177, 0, 0.7294118, 1, 1,
0.1380987, 1.379156, -1.307608, 0, 0.7254902, 1, 1,
0.1455229, 0.01582168, 0.8299467, 0, 0.7176471, 1, 1,
0.1470275, 0.345031, 0.1542371, 0, 0.7137255, 1, 1,
0.1482306, 0.01351935, -0.4277635, 0, 0.7058824, 1, 1,
0.1484195, -1.775668, 3.056315, 0, 0.6980392, 1, 1,
0.1535449, -0.7329954, 4.356385, 0, 0.6941177, 1, 1,
0.1542951, 1.803722, 1.779302, 0, 0.6862745, 1, 1,
0.1560868, -1.567435, 3.240159, 0, 0.682353, 1, 1,
0.1561354, -1.30629, 1.717139, 0, 0.6745098, 1, 1,
0.1562771, -1.607524, 2.268846, 0, 0.6705883, 1, 1,
0.1602238, 1.376435, 0.9144167, 0, 0.6627451, 1, 1,
0.1617971, -1.608549, 3.721866, 0, 0.6588235, 1, 1,
0.1639933, 1.324219, 0.2265096, 0, 0.6509804, 1, 1,
0.1690982, 0.8558803, -1.598448, 0, 0.6470588, 1, 1,
0.1712435, 0.2649506, 0.259913, 0, 0.6392157, 1, 1,
0.1782628, -0.5549971, 3.489369, 0, 0.6352941, 1, 1,
0.1840717, -0.2228762, 0.5321069, 0, 0.627451, 1, 1,
0.1854252, -1.451514, 3.536924, 0, 0.6235294, 1, 1,
0.1855914, 1.589598, -0.1047981, 0, 0.6156863, 1, 1,
0.1901251, -0.4523533, 4.291237, 0, 0.6117647, 1, 1,
0.1968367, 0.2369602, 0.1812921, 0, 0.6039216, 1, 1,
0.1990053, 0.1290515, -1.290296, 0, 0.5960785, 1, 1,
0.1996071, -0.5620286, 2.58821, 0, 0.5921569, 1, 1,
0.2042411, -0.2831082, 2.47766, 0, 0.5843138, 1, 1,
0.2045396, -1.438689, 2.74437, 0, 0.5803922, 1, 1,
0.205216, -1.857101, 2.535823, 0, 0.572549, 1, 1,
0.2066196, -0.4225872, 3.43195, 0, 0.5686275, 1, 1,
0.2121783, -1.752288, 2.927005, 0, 0.5607843, 1, 1,
0.2128662, 0.2624798, -0.1266682, 0, 0.5568628, 1, 1,
0.216331, -0.4163625, 2.401378, 0, 0.5490196, 1, 1,
0.2211533, -1.185432, 3.730285, 0, 0.5450981, 1, 1,
0.2258259, 2.282499, 1.31984, 0, 0.5372549, 1, 1,
0.2264785, -0.8580742, 3.618684, 0, 0.5333334, 1, 1,
0.2292619, -0.3614125, 2.006428, 0, 0.5254902, 1, 1,
0.2311066, -0.4293835, 2.278037, 0, 0.5215687, 1, 1,
0.2342278, 0.5703597, 1.099772, 0, 0.5137255, 1, 1,
0.2355587, 1.072617, 1.00011, 0, 0.509804, 1, 1,
0.2365318, 0.5012205, 1.729219, 0, 0.5019608, 1, 1,
0.2372797, -0.1807022, 0.8405575, 0, 0.4941176, 1, 1,
0.2398985, -0.1949886, 2.997659, 0, 0.4901961, 1, 1,
0.2434702, -1.364772, 4.818939, 0, 0.4823529, 1, 1,
0.2435832, 0.3187778, 1.459915, 0, 0.4784314, 1, 1,
0.2460387, 0.9070763, 0.5912703, 0, 0.4705882, 1, 1,
0.2464392, -1.113419, 2.359258, 0, 0.4666667, 1, 1,
0.2475452, 0.3220915, 0.2198693, 0, 0.4588235, 1, 1,
0.2549897, -0.114182, 1.687285, 0, 0.454902, 1, 1,
0.2570063, 0.3500225, 1.2937, 0, 0.4470588, 1, 1,
0.2571412, -0.7568467, 4.394331, 0, 0.4431373, 1, 1,
0.2621742, -0.5622213, 2.331273, 0, 0.4352941, 1, 1,
0.2624138, 0.3421539, 1.506372, 0, 0.4313726, 1, 1,
0.2643897, 0.8840948, 1.74673, 0, 0.4235294, 1, 1,
0.2650817, 0.5092848, 0.3975018, 0, 0.4196078, 1, 1,
0.2659925, -1.036825, 2.305883, 0, 0.4117647, 1, 1,
0.2771534, -2.028098, 2.660208, 0, 0.4078431, 1, 1,
0.2780526, 0.6678602, -0.2900968, 0, 0.4, 1, 1,
0.2782456, 0.2552979, 1.859641, 0, 0.3921569, 1, 1,
0.2787753, -2.675506, 4.501338, 0, 0.3882353, 1, 1,
0.2829912, -0.3548072, 1.223939, 0, 0.3803922, 1, 1,
0.2835457, -0.1628928, -0.1775211, 0, 0.3764706, 1, 1,
0.291905, -0.6193902, 3.80553, 0, 0.3686275, 1, 1,
0.2946706, -0.6066285, 5.483684, 0, 0.3647059, 1, 1,
0.2962876, -1.574675, 2.904814, 0, 0.3568628, 1, 1,
0.299214, 0.191011, 0.9321856, 0, 0.3529412, 1, 1,
0.3042467, 0.3964467, -1.477967, 0, 0.345098, 1, 1,
0.3047401, -0.3294201, 2.976286, 0, 0.3411765, 1, 1,
0.3066196, -0.3796863, 3.087214, 0, 0.3333333, 1, 1,
0.3067508, 0.9470463, -0.8218352, 0, 0.3294118, 1, 1,
0.3071631, -0.3192807, 2.64225, 0, 0.3215686, 1, 1,
0.3083723, -0.4636253, 1.805891, 0, 0.3176471, 1, 1,
0.3137639, -0.08576416, 2.001209, 0, 0.3098039, 1, 1,
0.314574, 0.1852441, 0.05929957, 0, 0.3058824, 1, 1,
0.3153174, -1.158546, 1.707908, 0, 0.2980392, 1, 1,
0.3162789, -1.0639, 0.6331891, 0, 0.2901961, 1, 1,
0.3188977, -0.8404976, 3.444483, 0, 0.2862745, 1, 1,
0.3220744, -0.2920901, 1.444944, 0, 0.2784314, 1, 1,
0.3264011, -1.033127, 0.7572911, 0, 0.2745098, 1, 1,
0.3270038, -0.50212, 2.517069, 0, 0.2666667, 1, 1,
0.3291176, -0.7548304, 4.635537, 0, 0.2627451, 1, 1,
0.3339712, 0.6022521, -0.3233315, 0, 0.254902, 1, 1,
0.3379916, -0.6595621, 4.466959, 0, 0.2509804, 1, 1,
0.3398399, 0.5917202, 1.073528, 0, 0.2431373, 1, 1,
0.3409858, -1.454871, 2.109661, 0, 0.2392157, 1, 1,
0.3435836, -1.967689, 4.205922, 0, 0.2313726, 1, 1,
0.3462293, -0.5775657, 1.617516, 0, 0.227451, 1, 1,
0.3498316, 0.02243372, 2.220964, 0, 0.2196078, 1, 1,
0.3542911, 1.146688, 3.45421, 0, 0.2156863, 1, 1,
0.3566791, -1.207041, 2.620943, 0, 0.2078431, 1, 1,
0.3590797, 2.306221, -0.8818017, 0, 0.2039216, 1, 1,
0.3592036, -1.164329, 1.987238, 0, 0.1960784, 1, 1,
0.3658585, 0.03803845, 2.234795, 0, 0.1882353, 1, 1,
0.3731396, 0.7076805, 0.07301892, 0, 0.1843137, 1, 1,
0.3806773, 0.5548722, 1.15971, 0, 0.1764706, 1, 1,
0.3810753, 0.1363516, 0.2873197, 0, 0.172549, 1, 1,
0.3833536, -0.2219099, 3.497355, 0, 0.1647059, 1, 1,
0.390553, -0.3869086, 2.2149, 0, 0.1607843, 1, 1,
0.3949145, -0.1060004, 1.296401, 0, 0.1529412, 1, 1,
0.3963562, 0.1695567, 2.775891, 0, 0.1490196, 1, 1,
0.3984679, 0.818889, -0.4828206, 0, 0.1411765, 1, 1,
0.4027928, 0.2556567, 2.391071, 0, 0.1372549, 1, 1,
0.4045401, -0.4380735, 1.737492, 0, 0.1294118, 1, 1,
0.4084426, -0.1725063, 1.771901, 0, 0.1254902, 1, 1,
0.4149525, 0.4576785, 0.283408, 0, 0.1176471, 1, 1,
0.4198707, 0.2700935, 0.7694385, 0, 0.1137255, 1, 1,
0.4202929, 0.6340517, 0.431848, 0, 0.1058824, 1, 1,
0.4212235, -0.452342, 2.347655, 0, 0.09803922, 1, 1,
0.4245824, 2.234298, -1.33217, 0, 0.09411765, 1, 1,
0.4274603, -1.558032, 1.53521, 0, 0.08627451, 1, 1,
0.4293707, -0.5096338, 0.7855766, 0, 0.08235294, 1, 1,
0.4351634, -0.1550933, 1.078991, 0, 0.07450981, 1, 1,
0.4442129, 1.573626, -0.8576937, 0, 0.07058824, 1, 1,
0.4458731, -0.9062505, 2.946934, 0, 0.0627451, 1, 1,
0.4481766, 0.4952722, 0.07484823, 0, 0.05882353, 1, 1,
0.4516689, 1.861107, -0.9104072, 0, 0.05098039, 1, 1,
0.4523168, -1.070363, 1.871868, 0, 0.04705882, 1, 1,
0.4549814, 0.2262927, 0.5861661, 0, 0.03921569, 1, 1,
0.4648281, -0.1909208, 2.119694, 0, 0.03529412, 1, 1,
0.4649471, -1.875821, 2.632601, 0, 0.02745098, 1, 1,
0.4665786, -1.454983, 1.734412, 0, 0.02352941, 1, 1,
0.4674477, 1.133577, 0.07469659, 0, 0.01568628, 1, 1,
0.470603, 0.2074818, 1.054324, 0, 0.01176471, 1, 1,
0.4706683, -0.8854962, 3.745479, 0, 0.003921569, 1, 1,
0.4733238, 0.9076589, -0.9520697, 0.003921569, 0, 1, 1,
0.4739637, 1.240649, 1.912813, 0.007843138, 0, 1, 1,
0.4745207, 0.4002845, 0.7550718, 0.01568628, 0, 1, 1,
0.4747589, -0.9264387, 2.551719, 0.01960784, 0, 1, 1,
0.4765023, -1.042009, 2.944715, 0.02745098, 0, 1, 1,
0.4792029, -0.7568834, 3.23706, 0.03137255, 0, 1, 1,
0.4793627, -1.102819, 3.643101, 0.03921569, 0, 1, 1,
0.482873, 2.153178, 0.4843201, 0.04313726, 0, 1, 1,
0.4836345, -0.5660185, 1.911883, 0.05098039, 0, 1, 1,
0.4839609, 1.156291, 0.1754311, 0.05490196, 0, 1, 1,
0.4906695, 0.935676, 2.019201, 0.0627451, 0, 1, 1,
0.4932451, 0.7977496, 1.587224, 0.06666667, 0, 1, 1,
0.4991546, 0.9618695, 0.04376512, 0.07450981, 0, 1, 1,
0.5021996, -0.510974, 1.734041, 0.07843138, 0, 1, 1,
0.5142692, -0.1370626, 2.177695, 0.08627451, 0, 1, 1,
0.5155702, -0.9993938, 3.29547, 0.09019608, 0, 1, 1,
0.5160915, -0.3427747, 1.971879, 0.09803922, 0, 1, 1,
0.5181196, -0.5914428, 0.8513137, 0.1058824, 0, 1, 1,
0.5182324, 0.5411054, 0.3242904, 0.1098039, 0, 1, 1,
0.5191233, 0.8844153, 0.1218773, 0.1176471, 0, 1, 1,
0.5195727, 0.3414881, 0.264374, 0.1215686, 0, 1, 1,
0.5197911, 0.4303084, -1.209421, 0.1294118, 0, 1, 1,
0.5219297, 0.09577467, 4.097252, 0.1333333, 0, 1, 1,
0.5294037, 0.6939854, 1.205267, 0.1411765, 0, 1, 1,
0.5302081, 0.2331953, 0.9106033, 0.145098, 0, 1, 1,
0.5307166, -1.987012, 5.128173, 0.1529412, 0, 1, 1,
0.5396827, 0.4641384, 1.47056, 0.1568628, 0, 1, 1,
0.5461735, 0.2982913, 2.928657, 0.1647059, 0, 1, 1,
0.5481179, 0.1055529, 1.406, 0.1686275, 0, 1, 1,
0.5496467, 0.3690332, 2.383902, 0.1764706, 0, 1, 1,
0.5524326, 1.442268, 0.06163998, 0.1803922, 0, 1, 1,
0.5525079, 0.4546625, 0.4355367, 0.1882353, 0, 1, 1,
0.5614144, 0.7615852, 1.057392, 0.1921569, 0, 1, 1,
0.5666072, 0.3249134, 0.8250912, 0.2, 0, 1, 1,
0.5669117, 1.286928, 0.023168, 0.2078431, 0, 1, 1,
0.5749764, -0.5016385, 1.197143, 0.2117647, 0, 1, 1,
0.5749981, -0.1636951, 0.9535861, 0.2196078, 0, 1, 1,
0.5859982, -0.4921561, 2.168025, 0.2235294, 0, 1, 1,
0.5876998, -1.172697, 2.647621, 0.2313726, 0, 1, 1,
0.5877355, 0.8106288, 0.5840634, 0.2352941, 0, 1, 1,
0.5912647, 0.1146782, 2.37593, 0.2431373, 0, 1, 1,
0.5938534, 0.4457131, 0.07982283, 0.2470588, 0, 1, 1,
0.5945788, -0.8168332, 2.590536, 0.254902, 0, 1, 1,
0.5955299, -1.560878, 3.791011, 0.2588235, 0, 1, 1,
0.5968858, 1.288151, 1.190296, 0.2666667, 0, 1, 1,
0.5977781, 0.8917415, 0.6928858, 0.2705882, 0, 1, 1,
0.5977797, 1.619702, 0.0508117, 0.2784314, 0, 1, 1,
0.5988703, 0.658151, 0.3864584, 0.282353, 0, 1, 1,
0.5992973, 0.1786982, 1.924576, 0.2901961, 0, 1, 1,
0.5997083, 0.1553768, 2.103567, 0.2941177, 0, 1, 1,
0.6024714, -1.235917, 3.030706, 0.3019608, 0, 1, 1,
0.6057298, -0.289634, 1.845577, 0.3098039, 0, 1, 1,
0.6096504, -0.2615368, 3.055997, 0.3137255, 0, 1, 1,
0.6113606, -0.2530791, 1.567199, 0.3215686, 0, 1, 1,
0.6178868, -0.2253905, 2.692221, 0.3254902, 0, 1, 1,
0.6188664, -0.3415805, 1.078267, 0.3333333, 0, 1, 1,
0.6198671, -1.258019, 3.163981, 0.3372549, 0, 1, 1,
0.6218129, -1.571733, 3.533795, 0.345098, 0, 1, 1,
0.6239721, -0.8299016, 2.432277, 0.3490196, 0, 1, 1,
0.6310252, 0.8207161, 2.831274, 0.3568628, 0, 1, 1,
0.6312392, 0.1784944, 1.388941, 0.3607843, 0, 1, 1,
0.6312701, -2.41589, 3.534893, 0.3686275, 0, 1, 1,
0.6320925, 0.6416314, 1.384063, 0.372549, 0, 1, 1,
0.6323023, 0.2158392, 1.475383, 0.3803922, 0, 1, 1,
0.6348766, -1.116609, 2.84505, 0.3843137, 0, 1, 1,
0.6400114, 0.1419693, -0.2603312, 0.3921569, 0, 1, 1,
0.6469494, -0.1342824, 2.104178, 0.3960784, 0, 1, 1,
0.6473799, 0.9135507, 1.396968, 0.4039216, 0, 1, 1,
0.6502637, 1.428482, 0.4956802, 0.4117647, 0, 1, 1,
0.656477, 0.07708445, 1.517252, 0.4156863, 0, 1, 1,
0.6601696, 0.8172622, 1.45036, 0.4235294, 0, 1, 1,
0.6695161, -1.048408, 2.593853, 0.427451, 0, 1, 1,
0.6715674, 1.02956, 0.4155542, 0.4352941, 0, 1, 1,
0.6735082, -0.09478837, 1.284044, 0.4392157, 0, 1, 1,
0.6763905, -1.404299, 2.94606, 0.4470588, 0, 1, 1,
0.6811633, -1.559578, 3.601902, 0.4509804, 0, 1, 1,
0.6827521, -1.45255, 2.152578, 0.4588235, 0, 1, 1,
0.6830886, -0.6532456, 2.137259, 0.4627451, 0, 1, 1,
0.6845732, 0.3843219, 0.415929, 0.4705882, 0, 1, 1,
0.6850916, 1.455151, 0.3360158, 0.4745098, 0, 1, 1,
0.6876941, 0.7586029, 1.040628, 0.4823529, 0, 1, 1,
0.6969252, 1.199108, -0.728897, 0.4862745, 0, 1, 1,
0.6991659, -0.06186779, 1.329155, 0.4941176, 0, 1, 1,
0.700514, 1.025044, 0.7536459, 0.5019608, 0, 1, 1,
0.7075819, 1.184491, 1.935225, 0.5058824, 0, 1, 1,
0.7082091, -0.4473393, 3.226841, 0.5137255, 0, 1, 1,
0.7100709, -1.109407, 2.459396, 0.5176471, 0, 1, 1,
0.7177638, -0.4897005, 1.223854, 0.5254902, 0, 1, 1,
0.7188661, -0.1688034, 0.6398327, 0.5294118, 0, 1, 1,
0.7236457, 0.6350209, 0.7321644, 0.5372549, 0, 1, 1,
0.725304, 0.4409404, 2.420261, 0.5411765, 0, 1, 1,
0.7259589, -0.8230355, 1.492789, 0.5490196, 0, 1, 1,
0.7269007, 1.955004, 1.496875, 0.5529412, 0, 1, 1,
0.7339724, 1.454968, 0.4907608, 0.5607843, 0, 1, 1,
0.7353439, 0.4473261, 1.148084, 0.5647059, 0, 1, 1,
0.7364511, -0.6461111, 2.525076, 0.572549, 0, 1, 1,
0.7376527, -0.947781, 2.96871, 0.5764706, 0, 1, 1,
0.7428411, -0.002726806, 1.591248, 0.5843138, 0, 1, 1,
0.7522403, 1.419834, 0.1321959, 0.5882353, 0, 1, 1,
0.7522528, -0.8555192, 2.302151, 0.5960785, 0, 1, 1,
0.7558198, 0.2282284, 2.263712, 0.6039216, 0, 1, 1,
0.7560555, -0.07684969, 3.097945, 0.6078432, 0, 1, 1,
0.7561575, 0.797061, 0.9719693, 0.6156863, 0, 1, 1,
0.7562614, 0.06066873, 1.369969, 0.6196079, 0, 1, 1,
0.7580298, -1.21901, 1.511108, 0.627451, 0, 1, 1,
0.7615483, 1.11763, 0.9066259, 0.6313726, 0, 1, 1,
0.7618436, 0.3783501, -1.192123, 0.6392157, 0, 1, 1,
0.7689285, -1.207317, 2.163013, 0.6431373, 0, 1, 1,
0.7707151, 0.4436742, 0.5043924, 0.6509804, 0, 1, 1,
0.7733722, -0.4697824, 2.831784, 0.654902, 0, 1, 1,
0.7804909, -0.7623874, 2.877252, 0.6627451, 0, 1, 1,
0.7832413, -0.2205396, 1.645426, 0.6666667, 0, 1, 1,
0.7878482, -0.1276191, 1.226542, 0.6745098, 0, 1, 1,
0.7880525, 0.05804536, 2.224641, 0.6784314, 0, 1, 1,
0.7906097, -0.21801, 3.13269, 0.6862745, 0, 1, 1,
0.7912431, -0.104718, 1.329439, 0.6901961, 0, 1, 1,
0.7959914, 0.3815657, 1.845238, 0.6980392, 0, 1, 1,
0.7960983, 0.8016097, 2.614832, 0.7058824, 0, 1, 1,
0.7969992, 0.1948754, 3.188379, 0.7098039, 0, 1, 1,
0.7985877, -0.2787973, 2.589602, 0.7176471, 0, 1, 1,
0.7998462, 0.4064876, 0.6455477, 0.7215686, 0, 1, 1,
0.803577, 0.2566065, 0.483911, 0.7294118, 0, 1, 1,
0.8037271, -0.6663025, 3.415608, 0.7333333, 0, 1, 1,
0.806618, 0.6080365, -0.2433884, 0.7411765, 0, 1, 1,
0.8131865, -0.7701587, 3.150197, 0.7450981, 0, 1, 1,
0.8191507, 0.03877099, 0.5741887, 0.7529412, 0, 1, 1,
0.8191719, -0.5021365, 1.737569, 0.7568628, 0, 1, 1,
0.8197442, -1.212225, 1.525001, 0.7647059, 0, 1, 1,
0.8238438, 0.8473196, -1.011509, 0.7686275, 0, 1, 1,
0.8428805, 0.5675559, 0.9221262, 0.7764706, 0, 1, 1,
0.8456604, 2.168941, 1.454549, 0.7803922, 0, 1, 1,
0.8544042, -0.215818, 1.793304, 0.7882353, 0, 1, 1,
0.8552219, 1.585959, -0.6801713, 0.7921569, 0, 1, 1,
0.8597926, 0.8189388, 2.297673, 0.8, 0, 1, 1,
0.8603947, -0.1729016, 2.404995, 0.8078431, 0, 1, 1,
0.8618894, 1.067221, 0.4458009, 0.8117647, 0, 1, 1,
0.8705761, -1.63463, 3.025312, 0.8196079, 0, 1, 1,
0.8720149, 1.363365, 0.6559026, 0.8235294, 0, 1, 1,
0.8724021, -2.402024, 3.097083, 0.8313726, 0, 1, 1,
0.8749363, -0.976808, 2.522758, 0.8352941, 0, 1, 1,
0.8751165, -1.967268, 0.1753587, 0.8431373, 0, 1, 1,
0.8756781, 1.166869, -1.442833, 0.8470588, 0, 1, 1,
0.8783137, 0.2436154, 0.4868017, 0.854902, 0, 1, 1,
0.8812731, -2.367208, -1.040506, 0.8588235, 0, 1, 1,
0.8900823, 0.5098503, -0.01371204, 0.8666667, 0, 1, 1,
0.8984467, 0.07978164, 3.366381, 0.8705882, 0, 1, 1,
0.9014722, -0.7184094, 1.641127, 0.8784314, 0, 1, 1,
0.9029332, 0.5408052, 0.04614506, 0.8823529, 0, 1, 1,
0.9141747, -0.8119542, 0.4027292, 0.8901961, 0, 1, 1,
0.9199471, 0.3459976, 2.974008, 0.8941177, 0, 1, 1,
0.9270408, 0.2324964, 0.3073708, 0.9019608, 0, 1, 1,
0.9308103, -0.5779776, 1.338554, 0.9098039, 0, 1, 1,
0.9322393, -0.4583883, 3.59247, 0.9137255, 0, 1, 1,
0.9335834, 1.582979, 0.6649083, 0.9215686, 0, 1, 1,
0.9438465, -0.6398711, 4.311088, 0.9254902, 0, 1, 1,
0.9441586, -0.1295694, 1.579067, 0.9333333, 0, 1, 1,
0.9479784, -0.04343407, 2.382337, 0.9372549, 0, 1, 1,
0.956377, -0.001727646, 1.142931, 0.945098, 0, 1, 1,
0.9677035, 2.385147, 0.4174632, 0.9490196, 0, 1, 1,
0.9684065, 3.016853, -0.1536727, 0.9568627, 0, 1, 1,
0.9689969, 0.1816369, 1.565381, 0.9607843, 0, 1, 1,
0.9766046, -0.25846, 1.518479, 0.9686275, 0, 1, 1,
0.9774318, -0.09894131, 1.508173, 0.972549, 0, 1, 1,
0.9865687, -0.7540737, 2.945013, 0.9803922, 0, 1, 1,
0.9872733, -2.101547, 2.164485, 0.9843137, 0, 1, 1,
0.9873647, -1.394706, 0.6686346, 0.9921569, 0, 1, 1,
0.9892246, -1.781395, 3.910622, 0.9960784, 0, 1, 1,
0.9943326, 1.438636, 0.6622738, 1, 0, 0.9960784, 1,
1.008779, 0.8305793, -0.4981085, 1, 0, 0.9882353, 1,
1.010478, -0.763567, 1.23401, 1, 0, 0.9843137, 1,
1.011359, 0.02938948, 1.489578, 1, 0, 0.9764706, 1,
1.011812, -0.1925192, 1.17412, 1, 0, 0.972549, 1,
1.012149, -1.259626, 1.910023, 1, 0, 0.9647059, 1,
1.019215, 1.965886, -0.2025823, 1, 0, 0.9607843, 1,
1.020586, -0.6940163, 1.569075, 1, 0, 0.9529412, 1,
1.022081, 1.129302, -0.09032811, 1, 0, 0.9490196, 1,
1.023594, -1.461265, 3.02175, 1, 0, 0.9411765, 1,
1.026201, 0.2077431, -0.1296292, 1, 0, 0.9372549, 1,
1.027556, -0.3706775, 2.037764, 1, 0, 0.9294118, 1,
1.040466, 0.02944163, 1.868467, 1, 0, 0.9254902, 1,
1.044039, 0.5577148, 3.811262, 1, 0, 0.9176471, 1,
1.049998, -0.6494402, 2.352481, 1, 0, 0.9137255, 1,
1.053389, 0.6660058, 0.9537954, 1, 0, 0.9058824, 1,
1.069221, -0.6893448, 2.775316, 1, 0, 0.9019608, 1,
1.07217, -0.7866433, 0.727592, 1, 0, 0.8941177, 1,
1.072257, 1.261295, 0.5624368, 1, 0, 0.8862745, 1,
1.079494, -0.2010483, 1.739401, 1, 0, 0.8823529, 1,
1.086675, 1.091808, -0.3303815, 1, 0, 0.8745098, 1,
1.094881, -0.3821099, 3.407996, 1, 0, 0.8705882, 1,
1.103497, -0.13459, 0.2584744, 1, 0, 0.8627451, 1,
1.10516, -0.1783933, 1.18463, 1, 0, 0.8588235, 1,
1.113905, 0.3553122, 3.223294, 1, 0, 0.8509804, 1,
1.119743, 0.4567124, 1.207875, 1, 0, 0.8470588, 1,
1.121957, 2.683609, 1.088637, 1, 0, 0.8392157, 1,
1.122776, -1.523387, 2.067516, 1, 0, 0.8352941, 1,
1.124387, -1.755422, 2.651373, 1, 0, 0.827451, 1,
1.124667, -1.744322, 1.595877, 1, 0, 0.8235294, 1,
1.125763, 0.6707856, 2.222603, 1, 0, 0.8156863, 1,
1.129326, -0.08782011, 1.842564, 1, 0, 0.8117647, 1,
1.129609, -0.1533817, -0.4627901, 1, 0, 0.8039216, 1,
1.143928, 0.5611555, -1.037976, 1, 0, 0.7960784, 1,
1.151433, -2.250761, 3.384611, 1, 0, 0.7921569, 1,
1.157222, 0.2440557, 1.609716, 1, 0, 0.7843137, 1,
1.170016, 0.4581787, 1.134522, 1, 0, 0.7803922, 1,
1.170677, 0.2497349, 1.594312, 1, 0, 0.772549, 1,
1.171908, -0.8577166, 2.022626, 1, 0, 0.7686275, 1,
1.173113, 0.2740632, 0.5077249, 1, 0, 0.7607843, 1,
1.191836, 1.21881, 1.270391, 1, 0, 0.7568628, 1,
1.192081, 0.1938225, 2.748517, 1, 0, 0.7490196, 1,
1.19599, -0.735235, 3.047617, 1, 0, 0.7450981, 1,
1.223055, -0.08820605, 0.7724697, 1, 0, 0.7372549, 1,
1.234744, 0.5837101, -1.594568, 1, 0, 0.7333333, 1,
1.236834, -0.1858237, 1.762796, 1, 0, 0.7254902, 1,
1.246209, 0.719382, 1.630379, 1, 0, 0.7215686, 1,
1.248896, 0.4710068, 0.4361387, 1, 0, 0.7137255, 1,
1.255338, 0.7952269, -0.1307471, 1, 0, 0.7098039, 1,
1.261133, -0.05930186, 1.976573, 1, 0, 0.7019608, 1,
1.263109, 1.063535, 0.01650564, 1, 0, 0.6941177, 1,
1.271289, 1.09434, 0.853535, 1, 0, 0.6901961, 1,
1.271885, -1.133217, 2.714866, 1, 0, 0.682353, 1,
1.281235, -0.6315967, 1.690708, 1, 0, 0.6784314, 1,
1.28229, 0.3395181, 1.222404, 1, 0, 0.6705883, 1,
1.286408, 0.4869055, -0.3507198, 1, 0, 0.6666667, 1,
1.297741, 0.4117337, 1.781526, 1, 0, 0.6588235, 1,
1.300352, 1.389361, 0.5055458, 1, 0, 0.654902, 1,
1.302113, 0.03350674, 0.171664, 1, 0, 0.6470588, 1,
1.311132, 1.731637, 1.098725, 1, 0, 0.6431373, 1,
1.312912, -0.04211083, 0.7691928, 1, 0, 0.6352941, 1,
1.329718, -0.8506312, 3.325659, 1, 0, 0.6313726, 1,
1.332189, 0.06893538, 1.026348, 1, 0, 0.6235294, 1,
1.345717, 2.142246, 0.9177201, 1, 0, 0.6196079, 1,
1.358277, -1.472305, 1.521412, 1, 0, 0.6117647, 1,
1.359601, -2.638244, 2.506752, 1, 0, 0.6078432, 1,
1.368566, 0.6682729, 0.2676414, 1, 0, 0.6, 1,
1.369581, 0.4784094, 0.6317111, 1, 0, 0.5921569, 1,
1.375477, -0.1683863, 0.6335925, 1, 0, 0.5882353, 1,
1.385318, 2.128973, 2.084087, 1, 0, 0.5803922, 1,
1.385944, 0.9107983, 0.1935292, 1, 0, 0.5764706, 1,
1.406776, 0.9652587, 2.924268, 1, 0, 0.5686275, 1,
1.407953, -0.9028826, 1.956772, 1, 0, 0.5647059, 1,
1.421153, -0.7872198, 2.97133, 1, 0, 0.5568628, 1,
1.422223, -0.1059873, -1.14557, 1, 0, 0.5529412, 1,
1.424083, -2.169275, 3.016203, 1, 0, 0.5450981, 1,
1.428491, 0.5639307, 1.828306, 1, 0, 0.5411765, 1,
1.433731, -0.5412003, 1.501295, 1, 0, 0.5333334, 1,
1.44022, -0.3419289, 0.3084541, 1, 0, 0.5294118, 1,
1.442465, -1.557862, 1.973108, 1, 0, 0.5215687, 1,
1.449861, 1.940876, 0.1787725, 1, 0, 0.5176471, 1,
1.456953, -1.153536, 3.294633, 1, 0, 0.509804, 1,
1.459568, 0.7183737, -0.7639298, 1, 0, 0.5058824, 1,
1.460271, 0.2769459, 3.110564, 1, 0, 0.4980392, 1,
1.468875, 0.4014492, 0.08488471, 1, 0, 0.4901961, 1,
1.479973, -0.07377391, -0.531976, 1, 0, 0.4862745, 1,
1.486275, 0.3814234, 0.6125965, 1, 0, 0.4784314, 1,
1.486491, -0.07336367, 0.3145839, 1, 0, 0.4745098, 1,
1.491926, -1.531803, 2.481142, 1, 0, 0.4666667, 1,
1.494464, 0.2019187, 1.292877, 1, 0, 0.4627451, 1,
1.521057, -0.2921238, 1.56477, 1, 0, 0.454902, 1,
1.524199, -0.3996978, 1.705468, 1, 0, 0.4509804, 1,
1.534428, -0.1097124, 2.332671, 1, 0, 0.4431373, 1,
1.535328, -0.1110312, 1.26265, 1, 0, 0.4392157, 1,
1.535451, 1.243188, 1.003469, 1, 0, 0.4313726, 1,
1.542469, -1.101957, 2.899791, 1, 0, 0.427451, 1,
1.555943, 0.2400028, 2.888493, 1, 0, 0.4196078, 1,
1.556139, 0.3981184, 1.254385, 1, 0, 0.4156863, 1,
1.569489, 0.1590365, 1.893697, 1, 0, 0.4078431, 1,
1.577577, 0.8254591, 2.432888, 1, 0, 0.4039216, 1,
1.588982, -1.171896, 1.548804, 1, 0, 0.3960784, 1,
1.589349, 0.6445456, -1.199747, 1, 0, 0.3882353, 1,
1.59066, -0.2699933, 1.019961, 1, 0, 0.3843137, 1,
1.590969, -1.409009, 1.733848, 1, 0, 0.3764706, 1,
1.592751, 0.194254, 1.464004, 1, 0, 0.372549, 1,
1.627664, -0.803669, 1.106288, 1, 0, 0.3647059, 1,
1.628003, -0.08324789, 0.8087437, 1, 0, 0.3607843, 1,
1.632482, 1.689886, 0.05582019, 1, 0, 0.3529412, 1,
1.634706, 0.8968513, 1.867515, 1, 0, 0.3490196, 1,
1.637625, 1.200393, 0.7451614, 1, 0, 0.3411765, 1,
1.637986, 1.1425, 1.118071, 1, 0, 0.3372549, 1,
1.642484, 0.7086844, 1.323947, 1, 0, 0.3294118, 1,
1.65043, 0.7751051, 1.016733, 1, 0, 0.3254902, 1,
1.659739, -0.3329248, 1.715189, 1, 0, 0.3176471, 1,
1.662464, 1.93275, -0.2729559, 1, 0, 0.3137255, 1,
1.667637, -0.05352106, 1.71852, 1, 0, 0.3058824, 1,
1.68138, 0.8575611, 1.661585, 1, 0, 0.2980392, 1,
1.70056, 0.02545245, 1.558144, 1, 0, 0.2941177, 1,
1.728695, -0.2990681, 0.5622113, 1, 0, 0.2862745, 1,
1.732349, -0.608531, 2.097681, 1, 0, 0.282353, 1,
1.7324, 1.28944, 0.3794948, 1, 0, 0.2745098, 1,
1.735047, 0.2181469, 2.20028, 1, 0, 0.2705882, 1,
1.747666, 0.347741, 0.4120697, 1, 0, 0.2627451, 1,
1.751667, -0.9301338, 2.00217, 1, 0, 0.2588235, 1,
1.774081, 0.3635338, 0.827912, 1, 0, 0.2509804, 1,
1.795518, 0.1557203, 0.5015126, 1, 0, 0.2470588, 1,
1.803357, 1.678619, 0.147659, 1, 0, 0.2392157, 1,
1.805087, -1.770513, 4.189423, 1, 0, 0.2352941, 1,
1.821066, 0.9616169, 1.558759, 1, 0, 0.227451, 1,
1.841888, -0.5143924, 0.705744, 1, 0, 0.2235294, 1,
1.848695, -0.7134194, 2.810953, 1, 0, 0.2156863, 1,
1.853854, -1.436876, 1.9477, 1, 0, 0.2117647, 1,
1.869584, -1.697024, 2.430655, 1, 0, 0.2039216, 1,
1.878901, -0.5930473, -0.3893923, 1, 0, 0.1960784, 1,
1.890228, 0.4057948, 0.08128884, 1, 0, 0.1921569, 1,
1.891716, 0.01102403, 2.771832, 1, 0, 0.1843137, 1,
1.897869, -1.810587, 0.7402989, 1, 0, 0.1803922, 1,
1.904233, 2.036182, -0.6386812, 1, 0, 0.172549, 1,
1.915584, 1.139532, 2.296117, 1, 0, 0.1686275, 1,
1.924316, 1.565415, 1.298842, 1, 0, 0.1607843, 1,
1.925697, -1.884065, 1.548969, 1, 0, 0.1568628, 1,
1.929725, -0.8629687, -0.02021715, 1, 0, 0.1490196, 1,
1.939225, 0.4498541, 2.071789, 1, 0, 0.145098, 1,
1.986411, -0.6130877, 2.052117, 1, 0, 0.1372549, 1,
1.999775, -0.3796608, 1.106953, 1, 0, 0.1333333, 1,
2.001196, -0.3456739, 1.082914, 1, 0, 0.1254902, 1,
2.01088, 0.8292469, 2.867588, 1, 0, 0.1215686, 1,
2.013467, 2.183505, 0.2342748, 1, 0, 0.1137255, 1,
2.019115, 0.1185407, 0.7990794, 1, 0, 0.1098039, 1,
2.080335, 0.2372155, 2.516018, 1, 0, 0.1019608, 1,
2.088606, -0.05309958, 1.678473, 1, 0, 0.09411765, 1,
2.112132, 0.7828453, 1.800752, 1, 0, 0.09019608, 1,
2.12252, 1.019596, -0.4027942, 1, 0, 0.08235294, 1,
2.143405, 0.5767146, 0.6324967, 1, 0, 0.07843138, 1,
2.432428, -0.04324514, 2.728588, 1, 0, 0.07058824, 1,
2.455181, 0.3787765, 1.584384, 1, 0, 0.06666667, 1,
2.513938, 0.8493374, 2.772796, 1, 0, 0.05882353, 1,
2.619459, 0.3199153, 2.755816, 1, 0, 0.05490196, 1,
2.646168, 1.33235, 1.820067, 1, 0, 0.04705882, 1,
2.651129, -0.50174, 1.47565, 1, 0, 0.04313726, 1,
2.776177, -0.5649241, 0.8050792, 1, 0, 0.03529412, 1,
2.923472, 0.1366598, 0.9857321, 1, 0, 0.03137255, 1,
2.988956, -0.2452897, 0.9674904, 1, 0, 0.02352941, 1,
3.123754, -0.7914901, -0.4602568, 1, 0, 0.01960784, 1,
3.607989, -0.2911837, 2.711608, 1, 0, 0.01176471, 1,
3.656, 0.3613741, 0.03480585, 1, 0, 0.007843138, 1
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
0.1659847, -3.640361, -6.754788, 0, -0.5, 0.5, 0.5,
0.1659847, -3.640361, -6.754788, 1, -0.5, 0.5, 0.5,
0.1659847, -3.640361, -6.754788, 1, 1.5, 0.5, 0.5,
0.1659847, -3.640361, -6.754788, 0, 1.5, 0.5, 0.5
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
-4.507145, 0.1706731, -6.754788, 0, -0.5, 0.5, 0.5,
-4.507145, 0.1706731, -6.754788, 1, -0.5, 0.5, 0.5,
-4.507145, 0.1706731, -6.754788, 1, 1.5, 0.5, 0.5,
-4.507145, 0.1706731, -6.754788, 0, 1.5, 0.5, 0.5
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
-4.507145, -3.640361, 0.2513318, 0, -0.5, 0.5, 0.5,
-4.507145, -3.640361, 0.2513318, 1, -0.5, 0.5, 0.5,
-4.507145, -3.640361, 0.2513318, 1, 1.5, 0.5, 0.5,
-4.507145, -3.640361, 0.2513318, 0, 1.5, 0.5, 0.5
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
-3, -2.760892, -5.137991,
3, -2.760892, -5.137991,
-3, -2.760892, -5.137991,
-3, -2.90747, -5.407457,
-2, -2.760892, -5.137991,
-2, -2.90747, -5.407457,
-1, -2.760892, -5.137991,
-1, -2.90747, -5.407457,
0, -2.760892, -5.137991,
0, -2.90747, -5.407457,
1, -2.760892, -5.137991,
1, -2.90747, -5.407457,
2, -2.760892, -5.137991,
2, -2.90747, -5.407457,
3, -2.760892, -5.137991,
3, -2.90747, -5.407457
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
-3, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
-3, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
-3, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
-3, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
-2, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
-2, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
-2, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
-2, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
-1, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
-1, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
-1, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
-1, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
0, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
0, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
0, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
0, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
1, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
1, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
1, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
1, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
2, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
2, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
2, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
2, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5,
3, -3.200626, -5.94639, 0, -0.5, 0.5, 0.5,
3, -3.200626, -5.94639, 1, -0.5, 0.5, 0.5,
3, -3.200626, -5.94639, 1, 1.5, 0.5, 0.5,
3, -3.200626, -5.94639, 0, 1.5, 0.5, 0.5
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
-3.428731, -2, -5.137991,
-3.428731, 3, -5.137991,
-3.428731, -2, -5.137991,
-3.608466, -2, -5.407457,
-3.428731, -1, -5.137991,
-3.608466, -1, -5.407457,
-3.428731, 0, -5.137991,
-3.608466, 0, -5.407457,
-3.428731, 1, -5.137991,
-3.608466, 1, -5.407457,
-3.428731, 2, -5.137991,
-3.608466, 2, -5.407457,
-3.428731, 3, -5.137991,
-3.608466, 3, -5.407457
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
-3.967938, -2, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, -2, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, -2, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, -2, -5.94639, 0, 1.5, 0.5, 0.5,
-3.967938, -1, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, -1, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, -1, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, -1, -5.94639, 0, 1.5, 0.5, 0.5,
-3.967938, 0, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, 0, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, 0, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, 0, -5.94639, 0, 1.5, 0.5, 0.5,
-3.967938, 1, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, 1, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, 1, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, 1, -5.94639, 0, 1.5, 0.5, 0.5,
-3.967938, 2, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, 2, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, 2, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, 2, -5.94639, 0, 1.5, 0.5, 0.5,
-3.967938, 3, -5.94639, 0, -0.5, 0.5, 0.5,
-3.967938, 3, -5.94639, 1, -0.5, 0.5, 0.5,
-3.967938, 3, -5.94639, 1, 1.5, 0.5, 0.5,
-3.967938, 3, -5.94639, 0, 1.5, 0.5, 0.5
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
-3.428731, -2.760892, -4,
-3.428731, -2.760892, 4,
-3.428731, -2.760892, -4,
-3.608466, -2.90747, -4,
-3.428731, -2.760892, -2,
-3.608466, -2.90747, -2,
-3.428731, -2.760892, 0,
-3.608466, -2.90747, 0,
-3.428731, -2.760892, 2,
-3.608466, -2.90747, 2,
-3.428731, -2.760892, 4,
-3.608466, -2.90747, 4
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
-3.967938, -3.200626, -4, 0, -0.5, 0.5, 0.5,
-3.967938, -3.200626, -4, 1, -0.5, 0.5, 0.5,
-3.967938, -3.200626, -4, 1, 1.5, 0.5, 0.5,
-3.967938, -3.200626, -4, 0, 1.5, 0.5, 0.5,
-3.967938, -3.200626, -2, 0, -0.5, 0.5, 0.5,
-3.967938, -3.200626, -2, 1, -0.5, 0.5, 0.5,
-3.967938, -3.200626, -2, 1, 1.5, 0.5, 0.5,
-3.967938, -3.200626, -2, 0, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 0, 0, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 0, 1, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 0, 1, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 0, 0, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 2, 0, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 2, 1, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 2, 1, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 2, 0, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 4, 0, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 4, 1, -0.5, 0.5, 0.5,
-3.967938, -3.200626, 4, 1, 1.5, 0.5, 0.5,
-3.967938, -3.200626, 4, 0, 1.5, 0.5, 0.5
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
-3.428731, -2.760892, -5.137991,
-3.428731, 3.102238, -5.137991,
-3.428731, -2.760892, 5.640655,
-3.428731, 3.102238, 5.640655,
-3.428731, -2.760892, -5.137991,
-3.428731, -2.760892, 5.640655,
-3.428731, 3.102238, -5.137991,
-3.428731, 3.102238, 5.640655,
-3.428731, -2.760892, -5.137991,
3.7607, -2.760892, -5.137991,
-3.428731, -2.760892, 5.640655,
3.7607, -2.760892, 5.640655,
-3.428731, 3.102238, -5.137991,
3.7607, 3.102238, -5.137991,
-3.428731, 3.102238, 5.640655,
3.7607, 3.102238, 5.640655,
3.7607, -2.760892, -5.137991,
3.7607, 3.102238, -5.137991,
3.7607, -2.760892, 5.640655,
3.7607, 3.102238, 5.640655,
3.7607, -2.760892, -5.137991,
3.7607, -2.760892, 5.640655,
3.7607, 3.102238, -5.137991,
3.7607, 3.102238, 5.640655
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
var radius = 7.593861;
var distance = 33.78595;
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
mvMatrix.translate( -0.1659847, -0.1706731, -0.2513318 );
mvMatrix.scale( 1.142042, 1.400384, 0.7617498 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78595);
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
## Error in read.table("Clothianidin.xyz"): no lines available in input
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
-3.32403, 0.9411864, -2.633699, 0, 0, 1, 1, 1,
-2.955265, 0.6253944, -0.4797003, 1, 0, 0, 1, 1,
-2.876066, 1.480291, -0.1888326, 1, 0, 0, 1, 1,
-2.697157, -1.922302, -2.949919, 1, 0, 0, 1, 1,
-2.5574, -1.94051, -1.258537, 1, 0, 0, 1, 1,
-2.55213, 1.180873, 0.01764895, 1, 0, 0, 1, 1,
-2.496441, 0.1867467, -2.236356, 0, 0, 0, 1, 1,
-2.435749, 0.461917, 0.3984967, 0, 0, 0, 1, 1,
-2.361612, 0.2183929, 0.1203689, 0, 0, 0, 1, 1,
-2.32289, -1.646231, -0.7502818, 0, 0, 0, 1, 1,
-2.293972, -0.02643598, -0.6197203, 0, 0, 0, 1, 1,
-2.224704, 1.056097, -0.8862396, 0, 0, 0, 1, 1,
-2.202672, 1.951717, 0.1133511, 0, 0, 0, 1, 1,
-2.108881, -0.2524672, 0.9939413, 1, 1, 1, 1, 1,
-2.09862, -1.128194, -1.125081, 1, 1, 1, 1, 1,
-2.071591, -1.607157, -1.109181, 1, 1, 1, 1, 1,
-2.056046, 1.052864, 0.3684513, 1, 1, 1, 1, 1,
-2.020606, 0.6711029, -1.632315, 1, 1, 1, 1, 1,
-1.939251, -0.357163, -2.44489, 1, 1, 1, 1, 1,
-1.904799, -0.07307965, -2.867955, 1, 1, 1, 1, 1,
-1.867598, -0.06291384, -0.292505, 1, 1, 1, 1, 1,
-1.858646, 1.815542, -1.039637, 1, 1, 1, 1, 1,
-1.856075, 0.3589377, -1.04178, 1, 1, 1, 1, 1,
-1.85117, -0.5048656, -1.815435, 1, 1, 1, 1, 1,
-1.848435, 0.7286133, 0.828469, 1, 1, 1, 1, 1,
-1.824481, 0.178998, -0.8556893, 1, 1, 1, 1, 1,
-1.823359, 0.7105847, 0.4505485, 1, 1, 1, 1, 1,
-1.803089, -2.011298, -1.566186, 1, 1, 1, 1, 1,
-1.796536, 0.1049997, -1.477309, 0, 0, 1, 1, 1,
-1.783109, 0.04908744, -2.221566, 1, 0, 0, 1, 1,
-1.771412, -0.4429417, -0.9354256, 1, 0, 0, 1, 1,
-1.754821, 1.5237, 0.1792766, 1, 0, 0, 1, 1,
-1.743712, 0.1529661, -1.42117, 1, 0, 0, 1, 1,
-1.739588, -1.166153, -2.546207, 1, 0, 0, 1, 1,
-1.732399, -0.5258064, -1.773187, 0, 0, 0, 1, 1,
-1.714364, 1.379863, -2.077421, 0, 0, 0, 1, 1,
-1.706074, -0.3097038, -0.8492606, 0, 0, 0, 1, 1,
-1.705369, 1.461366, 0.9051613, 0, 0, 0, 1, 1,
-1.696761, 0.1141398, -2.037992, 0, 0, 0, 1, 1,
-1.684222, 0.4148408, -1.266605, 0, 0, 0, 1, 1,
-1.678932, -0.2635666, 0.3910984, 0, 0, 0, 1, 1,
-1.673157, -1.034802, -2.624284, 1, 1, 1, 1, 1,
-1.651047, 0.2480631, -0.2560188, 1, 1, 1, 1, 1,
-1.64654, 1.493303, 0.02913365, 1, 1, 1, 1, 1,
-1.645816, 0.04637498, -0.6304961, 1, 1, 1, 1, 1,
-1.633253, 1.023405, -1.092074, 1, 1, 1, 1, 1,
-1.631266, 0.1164632, -0.07179545, 1, 1, 1, 1, 1,
-1.627362, -1.423042, -2.061961, 1, 1, 1, 1, 1,
-1.59664, 0.7657433, -2.063672, 1, 1, 1, 1, 1,
-1.580225, 0.1003707, -0.6989712, 1, 1, 1, 1, 1,
-1.576065, -1.763587, -1.79725, 1, 1, 1, 1, 1,
-1.565293, -0.4323834, -3.005031, 1, 1, 1, 1, 1,
-1.554128, -1.52055, -2.290031, 1, 1, 1, 1, 1,
-1.538609, 0.1667184, -3.289549, 1, 1, 1, 1, 1,
-1.523852, 1.581707, -0.8124479, 1, 1, 1, 1, 1,
-1.52356, 1.46782, -0.990761, 1, 1, 1, 1, 1,
-1.523484, 1.100735, -1.595945, 0, 0, 1, 1, 1,
-1.521644, -0.9920377, -1.770669, 1, 0, 0, 1, 1,
-1.518786, -0.1269792, -2.945395, 1, 0, 0, 1, 1,
-1.502515, 1.099057, 0.4960505, 1, 0, 0, 1, 1,
-1.485166, 0.3059772, 2.171528, 1, 0, 0, 1, 1,
-1.48508, -0.2949246, -0.600901, 1, 0, 0, 1, 1,
-1.480071, -1.462597, -3.103598, 0, 0, 0, 1, 1,
-1.476655, 0.648147, -3.192785, 0, 0, 0, 1, 1,
-1.471099, 0.005982667, -1.648443, 0, 0, 0, 1, 1,
-1.468311, 1.01421, -1.365566, 0, 0, 0, 1, 1,
-1.467947, 0.05184049, -2.079578, 0, 0, 0, 1, 1,
-1.464348, -1.734453, -2.674018, 0, 0, 0, 1, 1,
-1.455121, -0.4981489, -0.3321245, 0, 0, 0, 1, 1,
-1.451245, 0.4551668, -2.525653, 1, 1, 1, 1, 1,
-1.451041, -0.3771717, -2.073578, 1, 1, 1, 1, 1,
-1.447239, -0.808982, -1.952944, 1, 1, 1, 1, 1,
-1.446501, -0.1819759, -0.528888, 1, 1, 1, 1, 1,
-1.441579, -0.3589525, -2.077637, 1, 1, 1, 1, 1,
-1.439331, -0.3151319, -3.219223, 1, 1, 1, 1, 1,
-1.434376, 1.075942, -0.5963273, 1, 1, 1, 1, 1,
-1.426473, -1.197708, -1.91806, 1, 1, 1, 1, 1,
-1.415442, -1.330261, -1.070459, 1, 1, 1, 1, 1,
-1.411632, -1.027454, -3.050233, 1, 1, 1, 1, 1,
-1.410903, 0.2022141, -2.117474, 1, 1, 1, 1, 1,
-1.396735, 0.5954964, -1.264336, 1, 1, 1, 1, 1,
-1.38903, -1.527612, -2.515775, 1, 1, 1, 1, 1,
-1.371817, -0.3507809, -1.740996, 1, 1, 1, 1, 1,
-1.368354, -0.5149049, -3.42913, 1, 1, 1, 1, 1,
-1.363764, -1.237297, -1.180239, 0, 0, 1, 1, 1,
-1.351246, 0.6848888, -2.517232, 1, 0, 0, 1, 1,
-1.348653, -0.02804281, -0.3273423, 1, 0, 0, 1, 1,
-1.334532, -1.740883, -2.300798, 1, 0, 0, 1, 1,
-1.324056, 0.5456396, -0.499959, 1, 0, 0, 1, 1,
-1.319293, -1.523655, -4.595587, 1, 0, 0, 1, 1,
-1.31736, 0.6492302, -1.246274, 0, 0, 0, 1, 1,
-1.316998, 1.474059, 0.2494971, 0, 0, 0, 1, 1,
-1.315282, 0.1199783, -1.987534, 0, 0, 0, 1, 1,
-1.31074, -0.9113258, -1.879841, 0, 0, 0, 1, 1,
-1.30822, 0.1435734, -1.576229, 0, 0, 0, 1, 1,
-1.302818, 0.6171108, -1.752408, 0, 0, 0, 1, 1,
-1.300727, 1.205829, -2.068459, 0, 0, 0, 1, 1,
-1.296451, -0.1686494, -0.1341463, 1, 1, 1, 1, 1,
-1.293136, 0.6109626, -1.085004, 1, 1, 1, 1, 1,
-1.290611, -0.1265752, -2.45484, 1, 1, 1, 1, 1,
-1.288888, 0.3486243, -1.323985, 1, 1, 1, 1, 1,
-1.287018, 1.574141, -1.851522, 1, 1, 1, 1, 1,
-1.278971, -0.305878, -2.187516, 1, 1, 1, 1, 1,
-1.270587, 0.7230817, -0.6657769, 1, 1, 1, 1, 1,
-1.262414, -0.6909105, -2.744569, 1, 1, 1, 1, 1,
-1.261395, 0.7585584, -1.230325, 1, 1, 1, 1, 1,
-1.258125, 2.292947, -1.231981, 1, 1, 1, 1, 1,
-1.254686, -0.4459855, -1.415602, 1, 1, 1, 1, 1,
-1.24814, 1.140014, -0.9647558, 1, 1, 1, 1, 1,
-1.240585, -0.5524429, -2.312771, 1, 1, 1, 1, 1,
-1.238278, -0.74419, -1.75685, 1, 1, 1, 1, 1,
-1.23764, -0.08554351, -1.669189, 1, 1, 1, 1, 1,
-1.237623, -0.7925065, -2.752947, 0, 0, 1, 1, 1,
-1.229016, -0.1130606, -2.277343, 1, 0, 0, 1, 1,
-1.227663, 0.9662302, -0.8433577, 1, 0, 0, 1, 1,
-1.219848, -0.09434378, -3.258295, 1, 0, 0, 1, 1,
-1.21788, -0.2500149, -2.946686, 1, 0, 0, 1, 1,
-1.215136, -1.019686, -0.6722108, 1, 0, 0, 1, 1,
-1.200877, 0.3748924, -0.931304, 0, 0, 0, 1, 1,
-1.200132, -0.1530568, -0.3722314, 0, 0, 0, 1, 1,
-1.19346, 1.50304, -1.414009, 0, 0, 0, 1, 1,
-1.191846, 0.3387885, -2.407011, 0, 0, 0, 1, 1,
-1.189555, 0.1650243, -1.555624, 0, 0, 0, 1, 1,
-1.169731, -0.4356714, -2.278524, 0, 0, 0, 1, 1,
-1.162939, 0.5588722, -0.7563671, 0, 0, 0, 1, 1,
-1.152767, 0.03947293, -3.678647, 1, 1, 1, 1, 1,
-1.148122, -0.6395274, -1.325799, 1, 1, 1, 1, 1,
-1.144551, -0.8481028, -1.272143, 1, 1, 1, 1, 1,
-1.142356, 1.075164, -1.983797, 1, 1, 1, 1, 1,
-1.140354, 0.1527984, -2.310446, 1, 1, 1, 1, 1,
-1.136572, 0.5147914, -0.2508335, 1, 1, 1, 1, 1,
-1.132712, -2.640953, -0.7267309, 1, 1, 1, 1, 1,
-1.128423, 0.3889976, -2.99912, 1, 1, 1, 1, 1,
-1.120169, 0.2811838, -1.488093, 1, 1, 1, 1, 1,
-1.118213, -1.516954, -1.453735, 1, 1, 1, 1, 1,
-1.11789, 1.948917, -1.058313, 1, 1, 1, 1, 1,
-1.104467, 0.2153237, -3.05179, 1, 1, 1, 1, 1,
-1.094338, -0.4468241, -2.809751, 1, 1, 1, 1, 1,
-1.089552, -0.5688224, -2.71505, 1, 1, 1, 1, 1,
-1.081493, -0.2241541, -0.5500281, 1, 1, 1, 1, 1,
-1.073569, -0.4755686, -2.006653, 0, 0, 1, 1, 1,
-1.069528, 0.5688999, -1.969424, 1, 0, 0, 1, 1,
-1.06808, 0.2766744, -0.5509847, 1, 0, 0, 1, 1,
-1.065951, 0.1318024, -1.265689, 1, 0, 0, 1, 1,
-1.061603, 0.9749409, -1.676891, 1, 0, 0, 1, 1,
-1.061125, 0.628146, -1.787548, 1, 0, 0, 1, 1,
-1.053465, 0.2916334, -1.466418, 0, 0, 0, 1, 1,
-1.048038, -0.6166194, -2.434665, 0, 0, 0, 1, 1,
-1.042537, -1.140635, -2.724421, 0, 0, 0, 1, 1,
-1.040272, 1.105628, 1.257852, 0, 0, 0, 1, 1,
-1.038982, -0.5883961, -2.963495, 0, 0, 0, 1, 1,
-1.035397, 0.5041297, -2.248636, 0, 0, 0, 1, 1,
-1.022871, 0.1722521, -2.93419, 0, 0, 0, 1, 1,
-1.021371, -0.97047, -3.377451, 1, 1, 1, 1, 1,
-1.020136, 1.149637, -0.6664653, 1, 1, 1, 1, 1,
-1.019536, 0.3539053, -0.6331496, 1, 1, 1, 1, 1,
-1.017791, 0.9355074, -0.08769694, 1, 1, 1, 1, 1,
-1.01547, -0.5252222, -1.93744, 1, 1, 1, 1, 1,
-0.9957036, 0.7942181, -0.5647917, 1, 1, 1, 1, 1,
-0.9943743, -0.2445507, -3.694746, 1, 1, 1, 1, 1,
-0.9907911, -1.079064, -2.519832, 1, 1, 1, 1, 1,
-0.9835299, -0.4184196, -1.818352, 1, 1, 1, 1, 1,
-0.9833323, 1.477769, -1.520716, 1, 1, 1, 1, 1,
-0.9799592, 0.09454387, -2.066608, 1, 1, 1, 1, 1,
-0.9695346, -0.1245918, -0.7029988, 1, 1, 1, 1, 1,
-0.9655964, -0.2911302, -3.026457, 1, 1, 1, 1, 1,
-0.9582326, 0.6294832, -1.158112, 1, 1, 1, 1, 1,
-0.9507792, 0.7179316, -0.2319484, 1, 1, 1, 1, 1,
-0.9431742, 0.7231032, -0.1755246, 0, 0, 1, 1, 1,
-0.9387293, -2.114462, -1.709032, 1, 0, 0, 1, 1,
-0.936475, 0.7066541, -0.1853918, 1, 0, 0, 1, 1,
-0.9288045, -0.113177, -1.13917, 1, 0, 0, 1, 1,
-0.9262492, -1.181792, -3.302791, 1, 0, 0, 1, 1,
-0.9260734, -0.6304228, -1.178344, 1, 0, 0, 1, 1,
-0.9237694, -2.096938, -3.665554, 0, 0, 0, 1, 1,
-0.9187437, 2.357784, -0.789228, 0, 0, 0, 1, 1,
-0.9159858, 0.04088212, -0.05977161, 0, 0, 0, 1, 1,
-0.9115816, 1.17204, 0.1187981, 0, 0, 0, 1, 1,
-0.9008088, -1.363669, -1.551907, 0, 0, 0, 1, 1,
-0.899648, -0.03147585, -0.641664, 0, 0, 0, 1, 1,
-0.8993191, -0.4021489, -0.7135348, 0, 0, 0, 1, 1,
-0.8899441, 0.7920973, -1.770429, 1, 1, 1, 1, 1,
-0.8822265, 0.4461406, 0.3228931, 1, 1, 1, 1, 1,
-0.8804729, -0.2755539, -2.587553, 1, 1, 1, 1, 1,
-0.8802758, 1.449584, -0.5135201, 1, 1, 1, 1, 1,
-0.8786956, -1.700588, -1.704364, 1, 1, 1, 1, 1,
-0.8780118, -0.1726881, -1.270532, 1, 1, 1, 1, 1,
-0.8720678, 0.3308039, -1.404674, 1, 1, 1, 1, 1,
-0.8601696, -0.110451, -3.408345, 1, 1, 1, 1, 1,
-0.8564457, 0.3787467, -0.5341648, 1, 1, 1, 1, 1,
-0.8558848, 0.9496996, 0.1301076, 1, 1, 1, 1, 1,
-0.8505756, -0.4546828, -0.1749051, 1, 1, 1, 1, 1,
-0.8500626, 0.1915448, -0.7641618, 1, 1, 1, 1, 1,
-0.848542, 1.377228, -1.229863, 1, 1, 1, 1, 1,
-0.8434902, 1.678885, -1.042095, 1, 1, 1, 1, 1,
-0.8402143, -1.078339, -3.3118, 1, 1, 1, 1, 1,
-0.8378186, -0.4913232, -3.234606, 0, 0, 1, 1, 1,
-0.8368651, -1.055996, -1.49688, 1, 0, 0, 1, 1,
-0.8359461, 0.4760101, -1.471554, 1, 0, 0, 1, 1,
-0.8338503, -1.303241, -1.871854, 1, 0, 0, 1, 1,
-0.8289708, -0.05760496, -2.156767, 1, 0, 0, 1, 1,
-0.824897, -0.7350305, -0.4230883, 1, 0, 0, 1, 1,
-0.823595, 0.9168582, 0.07614027, 0, 0, 0, 1, 1,
-0.8181681, 1.119796, -1.98788, 0, 0, 0, 1, 1,
-0.8153378, 0.4030701, -1.850901, 0, 0, 0, 1, 1,
-0.8129758, 1.673018, -0.4247496, 0, 0, 0, 1, 1,
-0.8109446, -0.09082224, -1.651143, 0, 0, 0, 1, 1,
-0.8055825, -1.001879, -2.116802, 0, 0, 0, 1, 1,
-0.8052078, 0.3549723, 0.1426194, 0, 0, 0, 1, 1,
-0.8008263, 1.938501, -0.6228294, 1, 1, 1, 1, 1,
-0.8007749, -2.156616, -3.129338, 1, 1, 1, 1, 1,
-0.8001873, -1.252599, -3.413791, 1, 1, 1, 1, 1,
-0.7947119, 1.214473, -2.285838, 1, 1, 1, 1, 1,
-0.7896963, 1.465863, -0.7209523, 1, 1, 1, 1, 1,
-0.7860579, -0.383338, -2.642037, 1, 1, 1, 1, 1,
-0.7858447, -0.7159044, -1.672813, 1, 1, 1, 1, 1,
-0.7853639, 0.8845613, 1.143877, 1, 1, 1, 1, 1,
-0.7774724, 0.2675769, -1.40828, 1, 1, 1, 1, 1,
-0.7518023, -0.02970735, -1.331491, 1, 1, 1, 1, 1,
-0.7516071, -0.2552466, -0.5414605, 1, 1, 1, 1, 1,
-0.7460116, 0.1973664, -0.5289978, 1, 1, 1, 1, 1,
-0.7453305, 0.6004617, -0.3847524, 1, 1, 1, 1, 1,
-0.745172, -0.430716, -2.922094, 1, 1, 1, 1, 1,
-0.7444329, -0.4338723, -3.550121, 1, 1, 1, 1, 1,
-0.7366596, -0.977882, -3.374339, 0, 0, 1, 1, 1,
-0.7289035, -0.1116032, 0.2820141, 1, 0, 0, 1, 1,
-0.7212133, 1.052459, -1.552823, 1, 0, 0, 1, 1,
-0.7198077, 0.2011875, -2.789305, 1, 0, 0, 1, 1,
-0.7187504, 2.297479, -2.460211, 1, 0, 0, 1, 1,
-0.7052232, -1.930181, -4.307101, 1, 0, 0, 1, 1,
-0.7022676, -1.657273, -3.010996, 0, 0, 0, 1, 1,
-0.6974498, -0.09368964, -3.577186, 0, 0, 0, 1, 1,
-0.6912834, -0.7157184, -1.890302, 0, 0, 0, 1, 1,
-0.6901628, 1.5016, 0.5327241, 0, 0, 0, 1, 1,
-0.68574, 0.5180878, 0.01973741, 0, 0, 0, 1, 1,
-0.6750732, 0.5160454, -1.68917, 0, 0, 0, 1, 1,
-0.672343, -0.4227329, -2.56076, 0, 0, 0, 1, 1,
-0.6716682, 0.5341986, 0.3501613, 1, 1, 1, 1, 1,
-0.6698908, -1.152193, -1.472142, 1, 1, 1, 1, 1,
-0.6689802, 0.3601181, 0.5217057, 1, 1, 1, 1, 1,
-0.6618809, 0.6640649, -1.350509, 1, 1, 1, 1, 1,
-0.6617466, 0.2837254, -0.748867, 1, 1, 1, 1, 1,
-0.6548126, 1.827666, -1.077798, 1, 1, 1, 1, 1,
-0.6524663, 0.46684, -0.241063, 1, 1, 1, 1, 1,
-0.6501831, 0.5066988, -1.62913, 1, 1, 1, 1, 1,
-0.6477115, 0.06472895, -0.9807992, 1, 1, 1, 1, 1,
-0.6441948, -0.5716015, -2.99172, 1, 1, 1, 1, 1,
-0.6432403, 0.3305964, -2.319253, 1, 1, 1, 1, 1,
-0.6426867, 0.9616879, 0.0104142, 1, 1, 1, 1, 1,
-0.6403836, -1.665626, -4.034717, 1, 1, 1, 1, 1,
-0.6372342, 0.3617364, -1.585887, 1, 1, 1, 1, 1,
-0.6321353, 0.1014485, -1.391549, 1, 1, 1, 1, 1,
-0.6299449, -0.1281235, -1.134345, 0, 0, 1, 1, 1,
-0.6296494, -0.3335635, -2.309288, 1, 0, 0, 1, 1,
-0.6241887, 0.5573241, -0.6652272, 1, 0, 0, 1, 1,
-0.6203845, 1.692075, -0.8423235, 1, 0, 0, 1, 1,
-0.6168374, -1.202624, -1.621362, 1, 0, 0, 1, 1,
-0.6163726, -0.7684442, -1.174675, 1, 0, 0, 1, 1,
-0.6126164, 0.8197267, -1.227447, 0, 0, 0, 1, 1,
-0.6113044, 0.04451126, -2.544121, 0, 0, 0, 1, 1,
-0.6097893, 0.3035348, -2.573925, 0, 0, 0, 1, 1,
-0.6079932, 1.314685, 0.6249893, 0, 0, 0, 1, 1,
-0.6073509, 0.5455815, 1.085726, 0, 0, 0, 1, 1,
-0.6069584, -0.3625013, -2.209799, 0, 0, 0, 1, 1,
-0.6056955, 0.893783, 1.510731, 0, 0, 0, 1, 1,
-0.6045794, -0.5223929, -2.921868, 1, 1, 1, 1, 1,
-0.6028688, 0.1125645, -1.129237, 1, 1, 1, 1, 1,
-0.602099, -0.1596502, -3.900099, 1, 1, 1, 1, 1,
-0.5966241, 2.1429, 0.3360283, 1, 1, 1, 1, 1,
-0.5915605, -1.282661, -2.937828, 1, 1, 1, 1, 1,
-0.5910766, -0.5242711, -1.852391, 1, 1, 1, 1, 1,
-0.5903613, 0.2069347, -2.140918, 1, 1, 1, 1, 1,
-0.5885332, -0.3279952, -0.7564048, 1, 1, 1, 1, 1,
-0.5857068, 0.5806679, -0.4603197, 1, 1, 1, 1, 1,
-0.5808, 2.3426, -1.566956, 1, 1, 1, 1, 1,
-0.5691979, -0.09827776, -2.14317, 1, 1, 1, 1, 1,
-0.5676081, 1.65034, -0.6449773, 1, 1, 1, 1, 1,
-0.5526988, 1.641977, -0.6752253, 1, 1, 1, 1, 1,
-0.5505858, -0.07513022, -2.474121, 1, 1, 1, 1, 1,
-0.5495701, 1.064818, 0.0496301, 1, 1, 1, 1, 1,
-0.548108, 0.1072554, -1.424465, 0, 0, 1, 1, 1,
-0.5460653, 1.946479, -0.3659467, 1, 0, 0, 1, 1,
-0.5377319, -0.1665011, -2.204154, 1, 0, 0, 1, 1,
-0.5376543, -1.498807, -3.229463, 1, 0, 0, 1, 1,
-0.5359746, 1.283468, -1.494865, 1, 0, 0, 1, 1,
-0.5309084, 0.475898, -0.1504078, 1, 0, 0, 1, 1,
-0.5196214, -0.4023792, -1.524348, 0, 0, 0, 1, 1,
-0.5193091, 0.5907646, 0.177007, 0, 0, 0, 1, 1,
-0.5117005, 0.02328978, -2.101102, 0, 0, 0, 1, 1,
-0.5104204, 0.7142561, -1.946119, 0, 0, 0, 1, 1,
-0.504025, -1.467426, -3.275368, 0, 0, 0, 1, 1,
-0.4992886, -0.5543624, -2.502173, 0, 0, 0, 1, 1,
-0.4956087, 0.4691486, -2.012727, 0, 0, 0, 1, 1,
-0.492373, 1.408594, 0.3889809, 1, 1, 1, 1, 1,
-0.4868889, -1.416947, -1.443959, 1, 1, 1, 1, 1,
-0.4808822, -0.7868709, -2.828533, 1, 1, 1, 1, 1,
-0.4770562, -0.4281098, -2.699497, 1, 1, 1, 1, 1,
-0.4669148, -0.02175923, -3.953022, 1, 1, 1, 1, 1,
-0.4648222, -1.308185, -3.021658, 1, 1, 1, 1, 1,
-0.4634837, -1.421525, -1.987799, 1, 1, 1, 1, 1,
-0.4629991, -0.4765572, -2.776877, 1, 1, 1, 1, 1,
-0.4603634, 0.8055871, -0.7779719, 1, 1, 1, 1, 1,
-0.4588059, 0.6400516, -2.559465, 1, 1, 1, 1, 1,
-0.4575448, -1.25263, -2.0006, 1, 1, 1, 1, 1,
-0.4530261, 1.789347, -0.7822419, 1, 1, 1, 1, 1,
-0.4521161, 1.101364, 1.87312, 1, 1, 1, 1, 1,
-0.4453416, -0.7065222, -2.544886, 1, 1, 1, 1, 1,
-0.4451741, -0.8652595, -2.118425, 1, 1, 1, 1, 1,
-0.4422412, -0.2077784, -1.403573, 0, 0, 1, 1, 1,
-0.4357421, -1.422873, -2.465177, 1, 0, 0, 1, 1,
-0.4346366, 0.6903865, -0.924078, 1, 0, 0, 1, 1,
-0.4314513, -0.4372275, -2.880886, 1, 0, 0, 1, 1,
-0.4301904, -0.3813277, -4.260279, 1, 0, 0, 1, 1,
-0.4299577, 1.992337, 0.8854595, 1, 0, 0, 1, 1,
-0.4270557, -0.5630116, -1.07362, 0, 0, 0, 1, 1,
-0.4267962, 0.08922955, -1.229074, 0, 0, 0, 1, 1,
-0.4264446, -0.6354264, -2.319009, 0, 0, 0, 1, 1,
-0.4231659, -0.3722532, -3.633767, 0, 0, 0, 1, 1,
-0.4206773, -1.682692, -3.599569, 0, 0, 0, 1, 1,
-0.4170778, 0.6789878, -0.6806749, 0, 0, 0, 1, 1,
-0.4141133, -0.01621667, -1.761939, 0, 0, 0, 1, 1,
-0.4138163, 0.2114894, -0.2536606, 1, 1, 1, 1, 1,
-0.4131659, 0.1758301, -1.287288, 1, 1, 1, 1, 1,
-0.4119596, -0.8276059, -2.82419, 1, 1, 1, 1, 1,
-0.4098135, -1.268433, -0.6411077, 1, 1, 1, 1, 1,
-0.4060065, 0.9365015, -0.4898456, 1, 1, 1, 1, 1,
-0.403677, 0.6910055, -2.009714, 1, 1, 1, 1, 1,
-0.400523, 0.682656, -2.526175, 1, 1, 1, 1, 1,
-0.3995569, -0.01439203, -1.896101, 1, 1, 1, 1, 1,
-0.3990827, -2.467957, -3.048201, 1, 1, 1, 1, 1,
-0.3984234, -0.3462383, -2.476933, 1, 1, 1, 1, 1,
-0.3979402, -1.509571, -1.824718, 1, 1, 1, 1, 1,
-0.3928728, -0.7208586, -2.40968, 1, 1, 1, 1, 1,
-0.3912027, -0.1005433, -3.139309, 1, 1, 1, 1, 1,
-0.3810768, -0.1255755, -3.233265, 1, 1, 1, 1, 1,
-0.3772964, 1.104626, -1.318567, 1, 1, 1, 1, 1,
-0.3766034, -2.243082, -2.343126, 0, 0, 1, 1, 1,
-0.3748908, 0.06608936, -1.911227, 1, 0, 0, 1, 1,
-0.3739397, 1.414712, 2.985895, 1, 0, 0, 1, 1,
-0.3733831, -0.3211943, -2.704427, 1, 0, 0, 1, 1,
-0.361668, 1.543311, 0.4500577, 1, 0, 0, 1, 1,
-0.3600277, -1.208731, -0.5406951, 1, 0, 0, 1, 1,
-0.3557713, 0.3204493, -1.513085, 0, 0, 0, 1, 1,
-0.3547227, 0.891464, 1.15685, 0, 0, 0, 1, 1,
-0.3510001, 2.695557, -1.212349, 0, 0, 0, 1, 1,
-0.3447532, -0.5212057, -2.761914, 0, 0, 0, 1, 1,
-0.3418023, 0.292043, -3.920062, 0, 0, 0, 1, 1,
-0.3416365, 1.458528, -0.7664752, 0, 0, 0, 1, 1,
-0.3408122, -0.6644139, -2.884267, 0, 0, 0, 1, 1,
-0.3395762, -0.678602, -1.209457, 1, 1, 1, 1, 1,
-0.332389, 1.981338, -1.566984, 1, 1, 1, 1, 1,
-0.3239291, -0.9651183, -3.377967, 1, 1, 1, 1, 1,
-0.3231118, -0.8739913, -0.1803463, 1, 1, 1, 1, 1,
-0.3156588, -0.7837222, -2.750661, 1, 1, 1, 1, 1,
-0.3075072, -0.3640565, -2.765719, 1, 1, 1, 1, 1,
-0.3068134, 0.6278296, -0.2920865, 1, 1, 1, 1, 1,
-0.3044195, -0.7490445, -3.160405, 1, 1, 1, 1, 1,
-0.3032746, 0.1251457, 0.2859864, 1, 1, 1, 1, 1,
-0.3026887, -1.947555, -3.798407, 1, 1, 1, 1, 1,
-0.301853, 0.2670536, -1.501601, 1, 1, 1, 1, 1,
-0.2983907, -0.09135368, -4.011279, 1, 1, 1, 1, 1,
-0.2975638, 0.6777155, -2.075761, 1, 1, 1, 1, 1,
-0.2943223, -0.594011, -2.402287, 1, 1, 1, 1, 1,
-0.2917965, -0.270649, -3.882155, 1, 1, 1, 1, 1,
-0.2897673, -0.4941915, -2.920382, 0, 0, 1, 1, 1,
-0.2890314, 0.6832144, 0.2998084, 1, 0, 0, 1, 1,
-0.2845593, 0.4731423, 0.1532865, 1, 0, 0, 1, 1,
-0.2827224, -0.1463175, -0.4089476, 1, 0, 0, 1, 1,
-0.2762316, -0.1933233, -2.325178, 1, 0, 0, 1, 1,
-0.2752722, -0.3458437, -1.63568, 1, 0, 0, 1, 1,
-0.2738126, -0.07997929, -1.309409, 0, 0, 0, 1, 1,
-0.2661445, -0.1242137, -2.558874, 0, 0, 0, 1, 1,
-0.2657315, 0.8605635, 0.2715729, 0, 0, 0, 1, 1,
-0.2648366, 0.7492142, -2.933941, 0, 0, 0, 1, 1,
-0.2639702, -0.5364973, -3.778134, 0, 0, 0, 1, 1,
-0.2636106, 1.237449, -0.1688397, 0, 0, 0, 1, 1,
-0.2631606, 0.5193396, -0.7698674, 0, 0, 0, 1, 1,
-0.2578174, 0.06679998, -2.099822, 1, 1, 1, 1, 1,
-0.2553337, -0.0465075, -1.818308, 1, 1, 1, 1, 1,
-0.2544746, 1.515401, -0.3552528, 1, 1, 1, 1, 1,
-0.2534044, -0.3636912, -3.830726, 1, 1, 1, 1, 1,
-0.2503279, -0.8702255, -3.815309, 1, 1, 1, 1, 1,
-0.2475163, -1.764032, -4.01904, 1, 1, 1, 1, 1,
-0.246897, 0.4916608, 0.130934, 1, 1, 1, 1, 1,
-0.2463476, 0.2867438, -1.19513, 1, 1, 1, 1, 1,
-0.2459768, 0.6906289, -1.305674, 1, 1, 1, 1, 1,
-0.2400789, -0.1361128, -2.029221, 1, 1, 1, 1, 1,
-0.2399597, -2.203396, -4.051382, 1, 1, 1, 1, 1,
-0.2391878, -1.458009, -3.445066, 1, 1, 1, 1, 1,
-0.2324621, -1.529272, -4.309593, 1, 1, 1, 1, 1,
-0.2320893, 0.3149164, -1.194748, 1, 1, 1, 1, 1,
-0.2309479, 0.03714273, -2.447231, 1, 1, 1, 1, 1,
-0.2303852, -0.1536179, -4.374372, 0, 0, 1, 1, 1,
-0.2258419, -0.4010859, -2.633715, 1, 0, 0, 1, 1,
-0.224323, 0.4457007, -0.4207859, 1, 0, 0, 1, 1,
-0.2241301, -0.6631714, -2.709343, 1, 0, 0, 1, 1,
-0.2227017, 0.7919608, -1.8375, 1, 0, 0, 1, 1,
-0.2200969, 0.02556545, -1.389651, 1, 0, 0, 1, 1,
-0.2152594, 0.6572866, -0.6571992, 0, 0, 0, 1, 1,
-0.213952, -0.8128537, -3.642143, 0, 0, 0, 1, 1,
-0.2131873, -0.556363, -0.6881096, 0, 0, 0, 1, 1,
-0.2130344, -0.2229893, -2.356385, 0, 0, 0, 1, 1,
-0.2129534, 0.1819922, -2.174778, 0, 0, 0, 1, 1,
-0.2116317, 0.93309, 0.7066042, 0, 0, 0, 1, 1,
-0.2093643, -2.224135, -2.821405, 0, 0, 0, 1, 1,
-0.2092807, 0.8246371, 0.5559999, 1, 1, 1, 1, 1,
-0.2018269, -0.02863429, -1.049882, 1, 1, 1, 1, 1,
-0.1926598, -0.7767072, -3.963792, 1, 1, 1, 1, 1,
-0.1916011, 0.1783413, -1.773589, 1, 1, 1, 1, 1,
-0.1898297, 0.3063146, -0.7275608, 1, 1, 1, 1, 1,
-0.1876619, 1.478711, -0.5161517, 1, 1, 1, 1, 1,
-0.1819707, 2.320883, -0.4895536, 1, 1, 1, 1, 1,
-0.1781797, -0.7175559, -3.492908, 1, 1, 1, 1, 1,
-0.1771648, 0.09991302, -2.034996, 1, 1, 1, 1, 1,
-0.1770678, -0.6835369, -3.017227, 1, 1, 1, 1, 1,
-0.1758755, -0.2211287, -2.624845, 1, 1, 1, 1, 1,
-0.1742478, 1.284871, -0.6677127, 1, 1, 1, 1, 1,
-0.1724721, 0.7175175, 1.138947, 1, 1, 1, 1, 1,
-0.1717474, 0.614497, 1.743483, 1, 1, 1, 1, 1,
-0.1713318, 2.274725, -1.72429, 1, 1, 1, 1, 1,
-0.1709099, 0.02667478, -2.16891, 0, 0, 1, 1, 1,
-0.1707412, 1.73892, 0.6360881, 1, 0, 0, 1, 1,
-0.1683494, -0.07299925, -2.930256, 1, 0, 0, 1, 1,
-0.1586847, -0.6237975, -2.75518, 1, 0, 0, 1, 1,
-0.157951, 1.433207, 0.2943003, 1, 0, 0, 1, 1,
-0.155266, 0.6502261, 0.8701203, 1, 0, 0, 1, 1,
-0.1527321, -0.2683204, -4.757872, 0, 0, 0, 1, 1,
-0.148842, 0.7669148, 0.6253005, 0, 0, 0, 1, 1,
-0.1436712, 0.6753017, -1.497601, 0, 0, 0, 1, 1,
-0.1431511, -0.6121332, -1.952438, 0, 0, 0, 1, 1,
-0.1408729, 0.6910171, -0.4962499, 0, 0, 0, 1, 1,
-0.1405545, 0.457024, -0.4309998, 0, 0, 0, 1, 1,
-0.1372409, 1.684475, 0.3683021, 0, 0, 0, 1, 1,
-0.1348098, 0.3610196, -1.539909, 1, 1, 1, 1, 1,
-0.1325979, 0.5096743, 0.2490881, 1, 1, 1, 1, 1,
-0.1276551, -0.009343543, -1.773517, 1, 1, 1, 1, 1,
-0.1237156, 0.5775669, 1.468234, 1, 1, 1, 1, 1,
-0.1233518, -0.4455634, -4.247488, 1, 1, 1, 1, 1,
-0.1221174, 0.101311, 0.165047, 1, 1, 1, 1, 1,
-0.1166218, -0.5363623, -2.635109, 1, 1, 1, 1, 1,
-0.1162983, -0.06140197, -0.208174, 1, 1, 1, 1, 1,
-0.1090745, -0.6299909, -4.437136, 1, 1, 1, 1, 1,
-0.1065159, -0.1183022, -4.164265, 1, 1, 1, 1, 1,
-0.1043256, 1.751576, -1.409468, 1, 1, 1, 1, 1,
-0.1041291, -1.185654, -3.513679, 1, 1, 1, 1, 1,
-0.1006263, 1.647101, -0.7365277, 1, 1, 1, 1, 1,
-0.09960572, 0.08872622, -0.2847874, 1, 1, 1, 1, 1,
-0.09880825, -0.4825929, -2.847978, 1, 1, 1, 1, 1,
-0.09848449, 1.743431, -1.241157, 0, 0, 1, 1, 1,
-0.09238511, -0.9532417, -3.442438, 1, 0, 0, 1, 1,
-0.08843625, 0.5849621, 0.820793, 1, 0, 0, 1, 1,
-0.08730166, -0.02287048, -3.387182, 1, 0, 0, 1, 1,
-0.08511608, -0.07811467, -1.911164, 1, 0, 0, 1, 1,
-0.08266224, 0.6000395, 1.73224, 1, 0, 0, 1, 1,
-0.08157232, -0.9795647, -1.93717, 0, 0, 0, 1, 1,
-0.07361852, -1.700135, -2.867409, 0, 0, 0, 1, 1,
-0.07361767, 2.405503, 0.05054035, 0, 0, 0, 1, 1,
-0.07247509, -0.6419426, -1.40031, 0, 0, 0, 1, 1,
-0.06805226, -2.299094, -3.803206, 0, 0, 0, 1, 1,
-0.0626952, -0.5027549, -2.561515, 0, 0, 0, 1, 1,
-0.06248813, 1.039359, -0.718448, 0, 0, 0, 1, 1,
-0.05998233, -2.120816, -3.35113, 1, 1, 1, 1, 1,
-0.05871457, -0.7339361, -2.351655, 1, 1, 1, 1, 1,
-0.05567045, -0.009382231, -1.914444, 1, 1, 1, 1, 1,
-0.05562481, -0.04634763, -1.382933, 1, 1, 1, 1, 1,
-0.05169423, -0.324977, -2.092265, 1, 1, 1, 1, 1,
-0.04570259, 0.2905865, -1.012149, 1, 1, 1, 1, 1,
-0.0450851, 0.4829318, -0.817904, 1, 1, 1, 1, 1,
-0.04391434, 0.06125776, -0.8841351, 1, 1, 1, 1, 1,
-0.04378109, -0.7401654, -3.944749, 1, 1, 1, 1, 1,
-0.04118757, 2.010966, 0.1559893, 1, 1, 1, 1, 1,
-0.040365, -0.7918246, -2.318559, 1, 1, 1, 1, 1,
-0.03967468, 1.208521, -0.583209, 1, 1, 1, 1, 1,
-0.03670711, -0.4949997, -1.742406, 1, 1, 1, 1, 1,
-0.03630922, 0.3846893, -1.071283, 1, 1, 1, 1, 1,
-0.03566697, -1.787272, -3.415327, 1, 1, 1, 1, 1,
-0.03561913, 0.7937331, -1.730397, 0, 0, 1, 1, 1,
-0.03412317, 1.983418, 1.358417, 1, 0, 0, 1, 1,
-0.03002995, 0.1585788, 1.175544, 1, 0, 0, 1, 1,
-0.02403904, 0.5957981, 0.6021315, 1, 0, 0, 1, 1,
-0.02158276, -1.453755, -3.724193, 1, 0, 0, 1, 1,
-0.01732647, -0.04969344, -2.211202, 1, 0, 0, 1, 1,
-0.0158163, -0.2159392, -4.98102, 0, 0, 0, 1, 1,
-0.01453769, 0.1653938, -1.380947, 0, 0, 0, 1, 1,
-0.01324933, -1.692083, -4.006862, 0, 0, 0, 1, 1,
-0.01183099, 0.06569753, -0.1318891, 0, 0, 0, 1, 1,
-0.009907472, -0.689393, -1.5441, 0, 0, 0, 1, 1,
-0.00990322, -0.4141847, -3.271469, 0, 0, 0, 1, 1,
-0.008311078, -1.18474, -2.922199, 0, 0, 0, 1, 1,
-0.005103342, 0.2300911, 1.464848, 1, 1, 1, 1, 1,
0.001050912, -1.149292, 2.780512, 1, 1, 1, 1, 1,
0.001959353, -0.0003513114, 1.817136, 1, 1, 1, 1, 1,
0.003297573, -2.081055, 2.377456, 1, 1, 1, 1, 1,
0.004321935, -1.010857, 2.598899, 1, 1, 1, 1, 1,
0.006922632, -0.1443426, 3.383579, 1, 1, 1, 1, 1,
0.007182253, 0.3294713, -0.3281625, 1, 1, 1, 1, 1,
0.01028114, 0.8812733, -1.393931, 1, 1, 1, 1, 1,
0.01423567, 1.261062, -0.9402062, 1, 1, 1, 1, 1,
0.01541833, -1.424838, 3.40894, 1, 1, 1, 1, 1,
0.01803184, -0.3417066, 1.702232, 1, 1, 1, 1, 1,
0.01904473, -2.322126, 3.190941, 1, 1, 1, 1, 1,
0.02060895, 1.119588, -0.5535341, 1, 1, 1, 1, 1,
0.02672849, 1.167554, 0.02076861, 1, 1, 1, 1, 1,
0.02850083, 0.04000745, 0.7923535, 1, 1, 1, 1, 1,
0.03144998, 1.258705, -1.143009, 0, 0, 1, 1, 1,
0.04747687, -1.101204, 2.429664, 1, 0, 0, 1, 1,
0.04981806, 0.2441532, -0.9294196, 1, 0, 0, 1, 1,
0.05285425, -0.4862176, 2.875878, 1, 0, 0, 1, 1,
0.058654, 0.2979056, 0.9778346, 1, 0, 0, 1, 1,
0.06133778, -0.403346, 3.07323, 1, 0, 0, 1, 1,
0.061497, -0.5161147, 2.593646, 0, 0, 0, 1, 1,
0.06226264, 0.06662815, -1.002455, 0, 0, 0, 1, 1,
0.06452001, -0.3198107, 2.736435, 0, 0, 0, 1, 1,
0.06591579, 0.8077213, -0.7764464, 0, 0, 0, 1, 1,
0.06696042, 0.0339282, 1.225973, 0, 0, 0, 1, 1,
0.06743822, 1.865803, -1.282533, 0, 0, 0, 1, 1,
0.06758977, -0.4688794, 3.164248, 0, 0, 0, 1, 1,
0.06833811, 1.663333, 0.9995369, 1, 1, 1, 1, 1,
0.07033845, -0.00264768, 1.081359, 1, 1, 1, 1, 1,
0.07612728, -0.6853909, 4.094755, 1, 1, 1, 1, 1,
0.07660879, -0.1895281, 1.02402, 1, 1, 1, 1, 1,
0.07781771, -0.7799439, 4.763972, 1, 1, 1, 1, 1,
0.07784849, -0.07337675, 2.558453, 1, 1, 1, 1, 1,
0.07849266, -1.065657, 4.086922, 1, 1, 1, 1, 1,
0.08186713, 0.8493099, 0.3097721, 1, 1, 1, 1, 1,
0.08208367, 1.008755, 1.070732, 1, 1, 1, 1, 1,
0.08312356, 1.160877, -0.781748, 1, 1, 1, 1, 1,
0.08376123, -0.1632684, 1.535052, 1, 1, 1, 1, 1,
0.08675539, -0.8191641, 2.788587, 1, 1, 1, 1, 1,
0.08692488, -0.1000464, 5.039455, 1, 1, 1, 1, 1,
0.08910459, -0.9510993, 2.842527, 1, 1, 1, 1, 1,
0.09185969, -1.193197, 4.247053, 1, 1, 1, 1, 1,
0.09778285, -2.014907, 1.991329, 0, 0, 1, 1, 1,
0.1037095, -0.5279018, 2.773345, 1, 0, 0, 1, 1,
0.1040371, 0.7861371, 0.2883695, 1, 0, 0, 1, 1,
0.1043654, 0.2545874, -0.7740172, 1, 0, 0, 1, 1,
0.1074587, 0.7388824, -0.4657146, 1, 0, 0, 1, 1,
0.1091485, -0.0120691, 1.18101, 1, 0, 0, 1, 1,
0.1093035, 0.356691, 0.05431078, 0, 0, 0, 1, 1,
0.1190424, 0.6223155, -1.055498, 0, 0, 0, 1, 1,
0.1191249, -1.835661, 1.878509, 0, 0, 0, 1, 1,
0.1250842, 0.0002001908, 5.432112, 0, 0, 0, 1, 1,
0.1261458, 1.66965, -1.774309, 0, 0, 0, 1, 1,
0.1322146, 1.213755, 0.06819706, 0, 0, 0, 1, 1,
0.1362548, 0.1484794, 1.799415, 0, 0, 0, 1, 1,
0.1376493, 2.485516, -0.1595177, 1, 1, 1, 1, 1,
0.1380987, 1.379156, -1.307608, 1, 1, 1, 1, 1,
0.1455229, 0.01582168, 0.8299467, 1, 1, 1, 1, 1,
0.1470275, 0.345031, 0.1542371, 1, 1, 1, 1, 1,
0.1482306, 0.01351935, -0.4277635, 1, 1, 1, 1, 1,
0.1484195, -1.775668, 3.056315, 1, 1, 1, 1, 1,
0.1535449, -0.7329954, 4.356385, 1, 1, 1, 1, 1,
0.1542951, 1.803722, 1.779302, 1, 1, 1, 1, 1,
0.1560868, -1.567435, 3.240159, 1, 1, 1, 1, 1,
0.1561354, -1.30629, 1.717139, 1, 1, 1, 1, 1,
0.1562771, -1.607524, 2.268846, 1, 1, 1, 1, 1,
0.1602238, 1.376435, 0.9144167, 1, 1, 1, 1, 1,
0.1617971, -1.608549, 3.721866, 1, 1, 1, 1, 1,
0.1639933, 1.324219, 0.2265096, 1, 1, 1, 1, 1,
0.1690982, 0.8558803, -1.598448, 1, 1, 1, 1, 1,
0.1712435, 0.2649506, 0.259913, 0, 0, 1, 1, 1,
0.1782628, -0.5549971, 3.489369, 1, 0, 0, 1, 1,
0.1840717, -0.2228762, 0.5321069, 1, 0, 0, 1, 1,
0.1854252, -1.451514, 3.536924, 1, 0, 0, 1, 1,
0.1855914, 1.589598, -0.1047981, 1, 0, 0, 1, 1,
0.1901251, -0.4523533, 4.291237, 1, 0, 0, 1, 1,
0.1968367, 0.2369602, 0.1812921, 0, 0, 0, 1, 1,
0.1990053, 0.1290515, -1.290296, 0, 0, 0, 1, 1,
0.1996071, -0.5620286, 2.58821, 0, 0, 0, 1, 1,
0.2042411, -0.2831082, 2.47766, 0, 0, 0, 1, 1,
0.2045396, -1.438689, 2.74437, 0, 0, 0, 1, 1,
0.205216, -1.857101, 2.535823, 0, 0, 0, 1, 1,
0.2066196, -0.4225872, 3.43195, 0, 0, 0, 1, 1,
0.2121783, -1.752288, 2.927005, 1, 1, 1, 1, 1,
0.2128662, 0.2624798, -0.1266682, 1, 1, 1, 1, 1,
0.216331, -0.4163625, 2.401378, 1, 1, 1, 1, 1,
0.2211533, -1.185432, 3.730285, 1, 1, 1, 1, 1,
0.2258259, 2.282499, 1.31984, 1, 1, 1, 1, 1,
0.2264785, -0.8580742, 3.618684, 1, 1, 1, 1, 1,
0.2292619, -0.3614125, 2.006428, 1, 1, 1, 1, 1,
0.2311066, -0.4293835, 2.278037, 1, 1, 1, 1, 1,
0.2342278, 0.5703597, 1.099772, 1, 1, 1, 1, 1,
0.2355587, 1.072617, 1.00011, 1, 1, 1, 1, 1,
0.2365318, 0.5012205, 1.729219, 1, 1, 1, 1, 1,
0.2372797, -0.1807022, 0.8405575, 1, 1, 1, 1, 1,
0.2398985, -0.1949886, 2.997659, 1, 1, 1, 1, 1,
0.2434702, -1.364772, 4.818939, 1, 1, 1, 1, 1,
0.2435832, 0.3187778, 1.459915, 1, 1, 1, 1, 1,
0.2460387, 0.9070763, 0.5912703, 0, 0, 1, 1, 1,
0.2464392, -1.113419, 2.359258, 1, 0, 0, 1, 1,
0.2475452, 0.3220915, 0.2198693, 1, 0, 0, 1, 1,
0.2549897, -0.114182, 1.687285, 1, 0, 0, 1, 1,
0.2570063, 0.3500225, 1.2937, 1, 0, 0, 1, 1,
0.2571412, -0.7568467, 4.394331, 1, 0, 0, 1, 1,
0.2621742, -0.5622213, 2.331273, 0, 0, 0, 1, 1,
0.2624138, 0.3421539, 1.506372, 0, 0, 0, 1, 1,
0.2643897, 0.8840948, 1.74673, 0, 0, 0, 1, 1,
0.2650817, 0.5092848, 0.3975018, 0, 0, 0, 1, 1,
0.2659925, -1.036825, 2.305883, 0, 0, 0, 1, 1,
0.2771534, -2.028098, 2.660208, 0, 0, 0, 1, 1,
0.2780526, 0.6678602, -0.2900968, 0, 0, 0, 1, 1,
0.2782456, 0.2552979, 1.859641, 1, 1, 1, 1, 1,
0.2787753, -2.675506, 4.501338, 1, 1, 1, 1, 1,
0.2829912, -0.3548072, 1.223939, 1, 1, 1, 1, 1,
0.2835457, -0.1628928, -0.1775211, 1, 1, 1, 1, 1,
0.291905, -0.6193902, 3.80553, 1, 1, 1, 1, 1,
0.2946706, -0.6066285, 5.483684, 1, 1, 1, 1, 1,
0.2962876, -1.574675, 2.904814, 1, 1, 1, 1, 1,
0.299214, 0.191011, 0.9321856, 1, 1, 1, 1, 1,
0.3042467, 0.3964467, -1.477967, 1, 1, 1, 1, 1,
0.3047401, -0.3294201, 2.976286, 1, 1, 1, 1, 1,
0.3066196, -0.3796863, 3.087214, 1, 1, 1, 1, 1,
0.3067508, 0.9470463, -0.8218352, 1, 1, 1, 1, 1,
0.3071631, -0.3192807, 2.64225, 1, 1, 1, 1, 1,
0.3083723, -0.4636253, 1.805891, 1, 1, 1, 1, 1,
0.3137639, -0.08576416, 2.001209, 1, 1, 1, 1, 1,
0.314574, 0.1852441, 0.05929957, 0, 0, 1, 1, 1,
0.3153174, -1.158546, 1.707908, 1, 0, 0, 1, 1,
0.3162789, -1.0639, 0.6331891, 1, 0, 0, 1, 1,
0.3188977, -0.8404976, 3.444483, 1, 0, 0, 1, 1,
0.3220744, -0.2920901, 1.444944, 1, 0, 0, 1, 1,
0.3264011, -1.033127, 0.7572911, 1, 0, 0, 1, 1,
0.3270038, -0.50212, 2.517069, 0, 0, 0, 1, 1,
0.3291176, -0.7548304, 4.635537, 0, 0, 0, 1, 1,
0.3339712, 0.6022521, -0.3233315, 0, 0, 0, 1, 1,
0.3379916, -0.6595621, 4.466959, 0, 0, 0, 1, 1,
0.3398399, 0.5917202, 1.073528, 0, 0, 0, 1, 1,
0.3409858, -1.454871, 2.109661, 0, 0, 0, 1, 1,
0.3435836, -1.967689, 4.205922, 0, 0, 0, 1, 1,
0.3462293, -0.5775657, 1.617516, 1, 1, 1, 1, 1,
0.3498316, 0.02243372, 2.220964, 1, 1, 1, 1, 1,
0.3542911, 1.146688, 3.45421, 1, 1, 1, 1, 1,
0.3566791, -1.207041, 2.620943, 1, 1, 1, 1, 1,
0.3590797, 2.306221, -0.8818017, 1, 1, 1, 1, 1,
0.3592036, -1.164329, 1.987238, 1, 1, 1, 1, 1,
0.3658585, 0.03803845, 2.234795, 1, 1, 1, 1, 1,
0.3731396, 0.7076805, 0.07301892, 1, 1, 1, 1, 1,
0.3806773, 0.5548722, 1.15971, 1, 1, 1, 1, 1,
0.3810753, 0.1363516, 0.2873197, 1, 1, 1, 1, 1,
0.3833536, -0.2219099, 3.497355, 1, 1, 1, 1, 1,
0.390553, -0.3869086, 2.2149, 1, 1, 1, 1, 1,
0.3949145, -0.1060004, 1.296401, 1, 1, 1, 1, 1,
0.3963562, 0.1695567, 2.775891, 1, 1, 1, 1, 1,
0.3984679, 0.818889, -0.4828206, 1, 1, 1, 1, 1,
0.4027928, 0.2556567, 2.391071, 0, 0, 1, 1, 1,
0.4045401, -0.4380735, 1.737492, 1, 0, 0, 1, 1,
0.4084426, -0.1725063, 1.771901, 1, 0, 0, 1, 1,
0.4149525, 0.4576785, 0.283408, 1, 0, 0, 1, 1,
0.4198707, 0.2700935, 0.7694385, 1, 0, 0, 1, 1,
0.4202929, 0.6340517, 0.431848, 1, 0, 0, 1, 1,
0.4212235, -0.452342, 2.347655, 0, 0, 0, 1, 1,
0.4245824, 2.234298, -1.33217, 0, 0, 0, 1, 1,
0.4274603, -1.558032, 1.53521, 0, 0, 0, 1, 1,
0.4293707, -0.5096338, 0.7855766, 0, 0, 0, 1, 1,
0.4351634, -0.1550933, 1.078991, 0, 0, 0, 1, 1,
0.4442129, 1.573626, -0.8576937, 0, 0, 0, 1, 1,
0.4458731, -0.9062505, 2.946934, 0, 0, 0, 1, 1,
0.4481766, 0.4952722, 0.07484823, 1, 1, 1, 1, 1,
0.4516689, 1.861107, -0.9104072, 1, 1, 1, 1, 1,
0.4523168, -1.070363, 1.871868, 1, 1, 1, 1, 1,
0.4549814, 0.2262927, 0.5861661, 1, 1, 1, 1, 1,
0.4648281, -0.1909208, 2.119694, 1, 1, 1, 1, 1,
0.4649471, -1.875821, 2.632601, 1, 1, 1, 1, 1,
0.4665786, -1.454983, 1.734412, 1, 1, 1, 1, 1,
0.4674477, 1.133577, 0.07469659, 1, 1, 1, 1, 1,
0.470603, 0.2074818, 1.054324, 1, 1, 1, 1, 1,
0.4706683, -0.8854962, 3.745479, 1, 1, 1, 1, 1,
0.4733238, 0.9076589, -0.9520697, 1, 1, 1, 1, 1,
0.4739637, 1.240649, 1.912813, 1, 1, 1, 1, 1,
0.4745207, 0.4002845, 0.7550718, 1, 1, 1, 1, 1,
0.4747589, -0.9264387, 2.551719, 1, 1, 1, 1, 1,
0.4765023, -1.042009, 2.944715, 1, 1, 1, 1, 1,
0.4792029, -0.7568834, 3.23706, 0, 0, 1, 1, 1,
0.4793627, -1.102819, 3.643101, 1, 0, 0, 1, 1,
0.482873, 2.153178, 0.4843201, 1, 0, 0, 1, 1,
0.4836345, -0.5660185, 1.911883, 1, 0, 0, 1, 1,
0.4839609, 1.156291, 0.1754311, 1, 0, 0, 1, 1,
0.4906695, 0.935676, 2.019201, 1, 0, 0, 1, 1,
0.4932451, 0.7977496, 1.587224, 0, 0, 0, 1, 1,
0.4991546, 0.9618695, 0.04376512, 0, 0, 0, 1, 1,
0.5021996, -0.510974, 1.734041, 0, 0, 0, 1, 1,
0.5142692, -0.1370626, 2.177695, 0, 0, 0, 1, 1,
0.5155702, -0.9993938, 3.29547, 0, 0, 0, 1, 1,
0.5160915, -0.3427747, 1.971879, 0, 0, 0, 1, 1,
0.5181196, -0.5914428, 0.8513137, 0, 0, 0, 1, 1,
0.5182324, 0.5411054, 0.3242904, 1, 1, 1, 1, 1,
0.5191233, 0.8844153, 0.1218773, 1, 1, 1, 1, 1,
0.5195727, 0.3414881, 0.264374, 1, 1, 1, 1, 1,
0.5197911, 0.4303084, -1.209421, 1, 1, 1, 1, 1,
0.5219297, 0.09577467, 4.097252, 1, 1, 1, 1, 1,
0.5294037, 0.6939854, 1.205267, 1, 1, 1, 1, 1,
0.5302081, 0.2331953, 0.9106033, 1, 1, 1, 1, 1,
0.5307166, -1.987012, 5.128173, 1, 1, 1, 1, 1,
0.5396827, 0.4641384, 1.47056, 1, 1, 1, 1, 1,
0.5461735, 0.2982913, 2.928657, 1, 1, 1, 1, 1,
0.5481179, 0.1055529, 1.406, 1, 1, 1, 1, 1,
0.5496467, 0.3690332, 2.383902, 1, 1, 1, 1, 1,
0.5524326, 1.442268, 0.06163998, 1, 1, 1, 1, 1,
0.5525079, 0.4546625, 0.4355367, 1, 1, 1, 1, 1,
0.5614144, 0.7615852, 1.057392, 1, 1, 1, 1, 1,
0.5666072, 0.3249134, 0.8250912, 0, 0, 1, 1, 1,
0.5669117, 1.286928, 0.023168, 1, 0, 0, 1, 1,
0.5749764, -0.5016385, 1.197143, 1, 0, 0, 1, 1,
0.5749981, -0.1636951, 0.9535861, 1, 0, 0, 1, 1,
0.5859982, -0.4921561, 2.168025, 1, 0, 0, 1, 1,
0.5876998, -1.172697, 2.647621, 1, 0, 0, 1, 1,
0.5877355, 0.8106288, 0.5840634, 0, 0, 0, 1, 1,
0.5912647, 0.1146782, 2.37593, 0, 0, 0, 1, 1,
0.5938534, 0.4457131, 0.07982283, 0, 0, 0, 1, 1,
0.5945788, -0.8168332, 2.590536, 0, 0, 0, 1, 1,
0.5955299, -1.560878, 3.791011, 0, 0, 0, 1, 1,
0.5968858, 1.288151, 1.190296, 0, 0, 0, 1, 1,
0.5977781, 0.8917415, 0.6928858, 0, 0, 0, 1, 1,
0.5977797, 1.619702, 0.0508117, 1, 1, 1, 1, 1,
0.5988703, 0.658151, 0.3864584, 1, 1, 1, 1, 1,
0.5992973, 0.1786982, 1.924576, 1, 1, 1, 1, 1,
0.5997083, 0.1553768, 2.103567, 1, 1, 1, 1, 1,
0.6024714, -1.235917, 3.030706, 1, 1, 1, 1, 1,
0.6057298, -0.289634, 1.845577, 1, 1, 1, 1, 1,
0.6096504, -0.2615368, 3.055997, 1, 1, 1, 1, 1,
0.6113606, -0.2530791, 1.567199, 1, 1, 1, 1, 1,
0.6178868, -0.2253905, 2.692221, 1, 1, 1, 1, 1,
0.6188664, -0.3415805, 1.078267, 1, 1, 1, 1, 1,
0.6198671, -1.258019, 3.163981, 1, 1, 1, 1, 1,
0.6218129, -1.571733, 3.533795, 1, 1, 1, 1, 1,
0.6239721, -0.8299016, 2.432277, 1, 1, 1, 1, 1,
0.6310252, 0.8207161, 2.831274, 1, 1, 1, 1, 1,
0.6312392, 0.1784944, 1.388941, 1, 1, 1, 1, 1,
0.6312701, -2.41589, 3.534893, 0, 0, 1, 1, 1,
0.6320925, 0.6416314, 1.384063, 1, 0, 0, 1, 1,
0.6323023, 0.2158392, 1.475383, 1, 0, 0, 1, 1,
0.6348766, -1.116609, 2.84505, 1, 0, 0, 1, 1,
0.6400114, 0.1419693, -0.2603312, 1, 0, 0, 1, 1,
0.6469494, -0.1342824, 2.104178, 1, 0, 0, 1, 1,
0.6473799, 0.9135507, 1.396968, 0, 0, 0, 1, 1,
0.6502637, 1.428482, 0.4956802, 0, 0, 0, 1, 1,
0.656477, 0.07708445, 1.517252, 0, 0, 0, 1, 1,
0.6601696, 0.8172622, 1.45036, 0, 0, 0, 1, 1,
0.6695161, -1.048408, 2.593853, 0, 0, 0, 1, 1,
0.6715674, 1.02956, 0.4155542, 0, 0, 0, 1, 1,
0.6735082, -0.09478837, 1.284044, 0, 0, 0, 1, 1,
0.6763905, -1.404299, 2.94606, 1, 1, 1, 1, 1,
0.6811633, -1.559578, 3.601902, 1, 1, 1, 1, 1,
0.6827521, -1.45255, 2.152578, 1, 1, 1, 1, 1,
0.6830886, -0.6532456, 2.137259, 1, 1, 1, 1, 1,
0.6845732, 0.3843219, 0.415929, 1, 1, 1, 1, 1,
0.6850916, 1.455151, 0.3360158, 1, 1, 1, 1, 1,
0.6876941, 0.7586029, 1.040628, 1, 1, 1, 1, 1,
0.6969252, 1.199108, -0.728897, 1, 1, 1, 1, 1,
0.6991659, -0.06186779, 1.329155, 1, 1, 1, 1, 1,
0.700514, 1.025044, 0.7536459, 1, 1, 1, 1, 1,
0.7075819, 1.184491, 1.935225, 1, 1, 1, 1, 1,
0.7082091, -0.4473393, 3.226841, 1, 1, 1, 1, 1,
0.7100709, -1.109407, 2.459396, 1, 1, 1, 1, 1,
0.7177638, -0.4897005, 1.223854, 1, 1, 1, 1, 1,
0.7188661, -0.1688034, 0.6398327, 1, 1, 1, 1, 1,
0.7236457, 0.6350209, 0.7321644, 0, 0, 1, 1, 1,
0.725304, 0.4409404, 2.420261, 1, 0, 0, 1, 1,
0.7259589, -0.8230355, 1.492789, 1, 0, 0, 1, 1,
0.7269007, 1.955004, 1.496875, 1, 0, 0, 1, 1,
0.7339724, 1.454968, 0.4907608, 1, 0, 0, 1, 1,
0.7353439, 0.4473261, 1.148084, 1, 0, 0, 1, 1,
0.7364511, -0.6461111, 2.525076, 0, 0, 0, 1, 1,
0.7376527, -0.947781, 2.96871, 0, 0, 0, 1, 1,
0.7428411, -0.002726806, 1.591248, 0, 0, 0, 1, 1,
0.7522403, 1.419834, 0.1321959, 0, 0, 0, 1, 1,
0.7522528, -0.8555192, 2.302151, 0, 0, 0, 1, 1,
0.7558198, 0.2282284, 2.263712, 0, 0, 0, 1, 1,
0.7560555, -0.07684969, 3.097945, 0, 0, 0, 1, 1,
0.7561575, 0.797061, 0.9719693, 1, 1, 1, 1, 1,
0.7562614, 0.06066873, 1.369969, 1, 1, 1, 1, 1,
0.7580298, -1.21901, 1.511108, 1, 1, 1, 1, 1,
0.7615483, 1.11763, 0.9066259, 1, 1, 1, 1, 1,
0.7618436, 0.3783501, -1.192123, 1, 1, 1, 1, 1,
0.7689285, -1.207317, 2.163013, 1, 1, 1, 1, 1,
0.7707151, 0.4436742, 0.5043924, 1, 1, 1, 1, 1,
0.7733722, -0.4697824, 2.831784, 1, 1, 1, 1, 1,
0.7804909, -0.7623874, 2.877252, 1, 1, 1, 1, 1,
0.7832413, -0.2205396, 1.645426, 1, 1, 1, 1, 1,
0.7878482, -0.1276191, 1.226542, 1, 1, 1, 1, 1,
0.7880525, 0.05804536, 2.224641, 1, 1, 1, 1, 1,
0.7906097, -0.21801, 3.13269, 1, 1, 1, 1, 1,
0.7912431, -0.104718, 1.329439, 1, 1, 1, 1, 1,
0.7959914, 0.3815657, 1.845238, 1, 1, 1, 1, 1,
0.7960983, 0.8016097, 2.614832, 0, 0, 1, 1, 1,
0.7969992, 0.1948754, 3.188379, 1, 0, 0, 1, 1,
0.7985877, -0.2787973, 2.589602, 1, 0, 0, 1, 1,
0.7998462, 0.4064876, 0.6455477, 1, 0, 0, 1, 1,
0.803577, 0.2566065, 0.483911, 1, 0, 0, 1, 1,
0.8037271, -0.6663025, 3.415608, 1, 0, 0, 1, 1,
0.806618, 0.6080365, -0.2433884, 0, 0, 0, 1, 1,
0.8131865, -0.7701587, 3.150197, 0, 0, 0, 1, 1,
0.8191507, 0.03877099, 0.5741887, 0, 0, 0, 1, 1,
0.8191719, -0.5021365, 1.737569, 0, 0, 0, 1, 1,
0.8197442, -1.212225, 1.525001, 0, 0, 0, 1, 1,
0.8238438, 0.8473196, -1.011509, 0, 0, 0, 1, 1,
0.8428805, 0.5675559, 0.9221262, 0, 0, 0, 1, 1,
0.8456604, 2.168941, 1.454549, 1, 1, 1, 1, 1,
0.8544042, -0.215818, 1.793304, 1, 1, 1, 1, 1,
0.8552219, 1.585959, -0.6801713, 1, 1, 1, 1, 1,
0.8597926, 0.8189388, 2.297673, 1, 1, 1, 1, 1,
0.8603947, -0.1729016, 2.404995, 1, 1, 1, 1, 1,
0.8618894, 1.067221, 0.4458009, 1, 1, 1, 1, 1,
0.8705761, -1.63463, 3.025312, 1, 1, 1, 1, 1,
0.8720149, 1.363365, 0.6559026, 1, 1, 1, 1, 1,
0.8724021, -2.402024, 3.097083, 1, 1, 1, 1, 1,
0.8749363, -0.976808, 2.522758, 1, 1, 1, 1, 1,
0.8751165, -1.967268, 0.1753587, 1, 1, 1, 1, 1,
0.8756781, 1.166869, -1.442833, 1, 1, 1, 1, 1,
0.8783137, 0.2436154, 0.4868017, 1, 1, 1, 1, 1,
0.8812731, -2.367208, -1.040506, 1, 1, 1, 1, 1,
0.8900823, 0.5098503, -0.01371204, 1, 1, 1, 1, 1,
0.8984467, 0.07978164, 3.366381, 0, 0, 1, 1, 1,
0.9014722, -0.7184094, 1.641127, 1, 0, 0, 1, 1,
0.9029332, 0.5408052, 0.04614506, 1, 0, 0, 1, 1,
0.9141747, -0.8119542, 0.4027292, 1, 0, 0, 1, 1,
0.9199471, 0.3459976, 2.974008, 1, 0, 0, 1, 1,
0.9270408, 0.2324964, 0.3073708, 1, 0, 0, 1, 1,
0.9308103, -0.5779776, 1.338554, 0, 0, 0, 1, 1,
0.9322393, -0.4583883, 3.59247, 0, 0, 0, 1, 1,
0.9335834, 1.582979, 0.6649083, 0, 0, 0, 1, 1,
0.9438465, -0.6398711, 4.311088, 0, 0, 0, 1, 1,
0.9441586, -0.1295694, 1.579067, 0, 0, 0, 1, 1,
0.9479784, -0.04343407, 2.382337, 0, 0, 0, 1, 1,
0.956377, -0.001727646, 1.142931, 0, 0, 0, 1, 1,
0.9677035, 2.385147, 0.4174632, 1, 1, 1, 1, 1,
0.9684065, 3.016853, -0.1536727, 1, 1, 1, 1, 1,
0.9689969, 0.1816369, 1.565381, 1, 1, 1, 1, 1,
0.9766046, -0.25846, 1.518479, 1, 1, 1, 1, 1,
0.9774318, -0.09894131, 1.508173, 1, 1, 1, 1, 1,
0.9865687, -0.7540737, 2.945013, 1, 1, 1, 1, 1,
0.9872733, -2.101547, 2.164485, 1, 1, 1, 1, 1,
0.9873647, -1.394706, 0.6686346, 1, 1, 1, 1, 1,
0.9892246, -1.781395, 3.910622, 1, 1, 1, 1, 1,
0.9943326, 1.438636, 0.6622738, 1, 1, 1, 1, 1,
1.008779, 0.8305793, -0.4981085, 1, 1, 1, 1, 1,
1.010478, -0.763567, 1.23401, 1, 1, 1, 1, 1,
1.011359, 0.02938948, 1.489578, 1, 1, 1, 1, 1,
1.011812, -0.1925192, 1.17412, 1, 1, 1, 1, 1,
1.012149, -1.259626, 1.910023, 1, 1, 1, 1, 1,
1.019215, 1.965886, -0.2025823, 0, 0, 1, 1, 1,
1.020586, -0.6940163, 1.569075, 1, 0, 0, 1, 1,
1.022081, 1.129302, -0.09032811, 1, 0, 0, 1, 1,
1.023594, -1.461265, 3.02175, 1, 0, 0, 1, 1,
1.026201, 0.2077431, -0.1296292, 1, 0, 0, 1, 1,
1.027556, -0.3706775, 2.037764, 1, 0, 0, 1, 1,
1.040466, 0.02944163, 1.868467, 0, 0, 0, 1, 1,
1.044039, 0.5577148, 3.811262, 0, 0, 0, 1, 1,
1.049998, -0.6494402, 2.352481, 0, 0, 0, 1, 1,
1.053389, 0.6660058, 0.9537954, 0, 0, 0, 1, 1,
1.069221, -0.6893448, 2.775316, 0, 0, 0, 1, 1,
1.07217, -0.7866433, 0.727592, 0, 0, 0, 1, 1,
1.072257, 1.261295, 0.5624368, 0, 0, 0, 1, 1,
1.079494, -0.2010483, 1.739401, 1, 1, 1, 1, 1,
1.086675, 1.091808, -0.3303815, 1, 1, 1, 1, 1,
1.094881, -0.3821099, 3.407996, 1, 1, 1, 1, 1,
1.103497, -0.13459, 0.2584744, 1, 1, 1, 1, 1,
1.10516, -0.1783933, 1.18463, 1, 1, 1, 1, 1,
1.113905, 0.3553122, 3.223294, 1, 1, 1, 1, 1,
1.119743, 0.4567124, 1.207875, 1, 1, 1, 1, 1,
1.121957, 2.683609, 1.088637, 1, 1, 1, 1, 1,
1.122776, -1.523387, 2.067516, 1, 1, 1, 1, 1,
1.124387, -1.755422, 2.651373, 1, 1, 1, 1, 1,
1.124667, -1.744322, 1.595877, 1, 1, 1, 1, 1,
1.125763, 0.6707856, 2.222603, 1, 1, 1, 1, 1,
1.129326, -0.08782011, 1.842564, 1, 1, 1, 1, 1,
1.129609, -0.1533817, -0.4627901, 1, 1, 1, 1, 1,
1.143928, 0.5611555, -1.037976, 1, 1, 1, 1, 1,
1.151433, -2.250761, 3.384611, 0, 0, 1, 1, 1,
1.157222, 0.2440557, 1.609716, 1, 0, 0, 1, 1,
1.170016, 0.4581787, 1.134522, 1, 0, 0, 1, 1,
1.170677, 0.2497349, 1.594312, 1, 0, 0, 1, 1,
1.171908, -0.8577166, 2.022626, 1, 0, 0, 1, 1,
1.173113, 0.2740632, 0.5077249, 1, 0, 0, 1, 1,
1.191836, 1.21881, 1.270391, 0, 0, 0, 1, 1,
1.192081, 0.1938225, 2.748517, 0, 0, 0, 1, 1,
1.19599, -0.735235, 3.047617, 0, 0, 0, 1, 1,
1.223055, -0.08820605, 0.7724697, 0, 0, 0, 1, 1,
1.234744, 0.5837101, -1.594568, 0, 0, 0, 1, 1,
1.236834, -0.1858237, 1.762796, 0, 0, 0, 1, 1,
1.246209, 0.719382, 1.630379, 0, 0, 0, 1, 1,
1.248896, 0.4710068, 0.4361387, 1, 1, 1, 1, 1,
1.255338, 0.7952269, -0.1307471, 1, 1, 1, 1, 1,
1.261133, -0.05930186, 1.976573, 1, 1, 1, 1, 1,
1.263109, 1.063535, 0.01650564, 1, 1, 1, 1, 1,
1.271289, 1.09434, 0.853535, 1, 1, 1, 1, 1,
1.271885, -1.133217, 2.714866, 1, 1, 1, 1, 1,
1.281235, -0.6315967, 1.690708, 1, 1, 1, 1, 1,
1.28229, 0.3395181, 1.222404, 1, 1, 1, 1, 1,
1.286408, 0.4869055, -0.3507198, 1, 1, 1, 1, 1,
1.297741, 0.4117337, 1.781526, 1, 1, 1, 1, 1,
1.300352, 1.389361, 0.5055458, 1, 1, 1, 1, 1,
1.302113, 0.03350674, 0.171664, 1, 1, 1, 1, 1,
1.311132, 1.731637, 1.098725, 1, 1, 1, 1, 1,
1.312912, -0.04211083, 0.7691928, 1, 1, 1, 1, 1,
1.329718, -0.8506312, 3.325659, 1, 1, 1, 1, 1,
1.332189, 0.06893538, 1.026348, 0, 0, 1, 1, 1,
1.345717, 2.142246, 0.9177201, 1, 0, 0, 1, 1,
1.358277, -1.472305, 1.521412, 1, 0, 0, 1, 1,
1.359601, -2.638244, 2.506752, 1, 0, 0, 1, 1,
1.368566, 0.6682729, 0.2676414, 1, 0, 0, 1, 1,
1.369581, 0.4784094, 0.6317111, 1, 0, 0, 1, 1,
1.375477, -0.1683863, 0.6335925, 0, 0, 0, 1, 1,
1.385318, 2.128973, 2.084087, 0, 0, 0, 1, 1,
1.385944, 0.9107983, 0.1935292, 0, 0, 0, 1, 1,
1.406776, 0.9652587, 2.924268, 0, 0, 0, 1, 1,
1.407953, -0.9028826, 1.956772, 0, 0, 0, 1, 1,
1.421153, -0.7872198, 2.97133, 0, 0, 0, 1, 1,
1.422223, -0.1059873, -1.14557, 0, 0, 0, 1, 1,
1.424083, -2.169275, 3.016203, 1, 1, 1, 1, 1,
1.428491, 0.5639307, 1.828306, 1, 1, 1, 1, 1,
1.433731, -0.5412003, 1.501295, 1, 1, 1, 1, 1,
1.44022, -0.3419289, 0.3084541, 1, 1, 1, 1, 1,
1.442465, -1.557862, 1.973108, 1, 1, 1, 1, 1,
1.449861, 1.940876, 0.1787725, 1, 1, 1, 1, 1,
1.456953, -1.153536, 3.294633, 1, 1, 1, 1, 1,
1.459568, 0.7183737, -0.7639298, 1, 1, 1, 1, 1,
1.460271, 0.2769459, 3.110564, 1, 1, 1, 1, 1,
1.468875, 0.4014492, 0.08488471, 1, 1, 1, 1, 1,
1.479973, -0.07377391, -0.531976, 1, 1, 1, 1, 1,
1.486275, 0.3814234, 0.6125965, 1, 1, 1, 1, 1,
1.486491, -0.07336367, 0.3145839, 1, 1, 1, 1, 1,
1.491926, -1.531803, 2.481142, 1, 1, 1, 1, 1,
1.494464, 0.2019187, 1.292877, 1, 1, 1, 1, 1,
1.521057, -0.2921238, 1.56477, 0, 0, 1, 1, 1,
1.524199, -0.3996978, 1.705468, 1, 0, 0, 1, 1,
1.534428, -0.1097124, 2.332671, 1, 0, 0, 1, 1,
1.535328, -0.1110312, 1.26265, 1, 0, 0, 1, 1,
1.535451, 1.243188, 1.003469, 1, 0, 0, 1, 1,
1.542469, -1.101957, 2.899791, 1, 0, 0, 1, 1,
1.555943, 0.2400028, 2.888493, 0, 0, 0, 1, 1,
1.556139, 0.3981184, 1.254385, 0, 0, 0, 1, 1,
1.569489, 0.1590365, 1.893697, 0, 0, 0, 1, 1,
1.577577, 0.8254591, 2.432888, 0, 0, 0, 1, 1,
1.588982, -1.171896, 1.548804, 0, 0, 0, 1, 1,
1.589349, 0.6445456, -1.199747, 0, 0, 0, 1, 1,
1.59066, -0.2699933, 1.019961, 0, 0, 0, 1, 1,
1.590969, -1.409009, 1.733848, 1, 1, 1, 1, 1,
1.592751, 0.194254, 1.464004, 1, 1, 1, 1, 1,
1.627664, -0.803669, 1.106288, 1, 1, 1, 1, 1,
1.628003, -0.08324789, 0.8087437, 1, 1, 1, 1, 1,
1.632482, 1.689886, 0.05582019, 1, 1, 1, 1, 1,
1.634706, 0.8968513, 1.867515, 1, 1, 1, 1, 1,
1.637625, 1.200393, 0.7451614, 1, 1, 1, 1, 1,
1.637986, 1.1425, 1.118071, 1, 1, 1, 1, 1,
1.642484, 0.7086844, 1.323947, 1, 1, 1, 1, 1,
1.65043, 0.7751051, 1.016733, 1, 1, 1, 1, 1,
1.659739, -0.3329248, 1.715189, 1, 1, 1, 1, 1,
1.662464, 1.93275, -0.2729559, 1, 1, 1, 1, 1,
1.667637, -0.05352106, 1.71852, 1, 1, 1, 1, 1,
1.68138, 0.8575611, 1.661585, 1, 1, 1, 1, 1,
1.70056, 0.02545245, 1.558144, 1, 1, 1, 1, 1,
1.728695, -0.2990681, 0.5622113, 0, 0, 1, 1, 1,
1.732349, -0.608531, 2.097681, 1, 0, 0, 1, 1,
1.7324, 1.28944, 0.3794948, 1, 0, 0, 1, 1,
1.735047, 0.2181469, 2.20028, 1, 0, 0, 1, 1,
1.747666, 0.347741, 0.4120697, 1, 0, 0, 1, 1,
1.751667, -0.9301338, 2.00217, 1, 0, 0, 1, 1,
1.774081, 0.3635338, 0.827912, 0, 0, 0, 1, 1,
1.795518, 0.1557203, 0.5015126, 0, 0, 0, 1, 1,
1.803357, 1.678619, 0.147659, 0, 0, 0, 1, 1,
1.805087, -1.770513, 4.189423, 0, 0, 0, 1, 1,
1.821066, 0.9616169, 1.558759, 0, 0, 0, 1, 1,
1.841888, -0.5143924, 0.705744, 0, 0, 0, 1, 1,
1.848695, -0.7134194, 2.810953, 0, 0, 0, 1, 1,
1.853854, -1.436876, 1.9477, 1, 1, 1, 1, 1,
1.869584, -1.697024, 2.430655, 1, 1, 1, 1, 1,
1.878901, -0.5930473, -0.3893923, 1, 1, 1, 1, 1,
1.890228, 0.4057948, 0.08128884, 1, 1, 1, 1, 1,
1.891716, 0.01102403, 2.771832, 1, 1, 1, 1, 1,
1.897869, -1.810587, 0.7402989, 1, 1, 1, 1, 1,
1.904233, 2.036182, -0.6386812, 1, 1, 1, 1, 1,
1.915584, 1.139532, 2.296117, 1, 1, 1, 1, 1,
1.924316, 1.565415, 1.298842, 1, 1, 1, 1, 1,
1.925697, -1.884065, 1.548969, 1, 1, 1, 1, 1,
1.929725, -0.8629687, -0.02021715, 1, 1, 1, 1, 1,
1.939225, 0.4498541, 2.071789, 1, 1, 1, 1, 1,
1.986411, -0.6130877, 2.052117, 1, 1, 1, 1, 1,
1.999775, -0.3796608, 1.106953, 1, 1, 1, 1, 1,
2.001196, -0.3456739, 1.082914, 1, 1, 1, 1, 1,
2.01088, 0.8292469, 2.867588, 0, 0, 1, 1, 1,
2.013467, 2.183505, 0.2342748, 1, 0, 0, 1, 1,
2.019115, 0.1185407, 0.7990794, 1, 0, 0, 1, 1,
2.080335, 0.2372155, 2.516018, 1, 0, 0, 1, 1,
2.088606, -0.05309958, 1.678473, 1, 0, 0, 1, 1,
2.112132, 0.7828453, 1.800752, 1, 0, 0, 1, 1,
2.12252, 1.019596, -0.4027942, 0, 0, 0, 1, 1,
2.143405, 0.5767146, 0.6324967, 0, 0, 0, 1, 1,
2.432428, -0.04324514, 2.728588, 0, 0, 0, 1, 1,
2.455181, 0.3787765, 1.584384, 0, 0, 0, 1, 1,
2.513938, 0.8493374, 2.772796, 0, 0, 0, 1, 1,
2.619459, 0.3199153, 2.755816, 0, 0, 0, 1, 1,
2.646168, 1.33235, 1.820067, 0, 0, 0, 1, 1,
2.651129, -0.50174, 1.47565, 1, 1, 1, 1, 1,
2.776177, -0.5649241, 0.8050792, 1, 1, 1, 1, 1,
2.923472, 0.1366598, 0.9857321, 1, 1, 1, 1, 1,
2.988956, -0.2452897, 0.9674904, 1, 1, 1, 1, 1,
3.123754, -0.7914901, -0.4602568, 1, 1, 1, 1, 1,
3.607989, -0.2911837, 2.711608, 1, 1, 1, 1, 1,
3.656, 0.3613741, 0.03480585, 1, 1, 1, 1, 1
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
var radius = 9.449477;
var distance = 33.19088;
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
mvMatrix.translate( -0.1659849, -0.170673, -0.2513318 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19088);
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
