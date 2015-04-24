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
-2.952928, 2.123354, -0.6813123, 1, 0, 0, 1,
-2.85351, 0.08382478, -1.123186, 1, 0.007843138, 0, 1,
-2.828376, 1.289321, -2.256589, 1, 0.01176471, 0, 1,
-2.756137, 0.360077, -1.034608, 1, 0.01960784, 0, 1,
-2.753127, -0.6908017, -2.474545, 1, 0.02352941, 0, 1,
-2.673783, -0.7519477, -2.467071, 1, 0.03137255, 0, 1,
-2.602443, -0.1579172, -1.376574, 1, 0.03529412, 0, 1,
-2.540652, 0.3108043, -1.110627, 1, 0.04313726, 0, 1,
-2.524771, 1.038237, -1.877733, 1, 0.04705882, 0, 1,
-2.467885, 1.042532, -0.3994235, 1, 0.05490196, 0, 1,
-2.374808, -0.5730596, -1.574506, 1, 0.05882353, 0, 1,
-2.351657, 0.647774, -1.41424, 1, 0.06666667, 0, 1,
-2.350134, 0.8400726, -1.177302, 1, 0.07058824, 0, 1,
-2.346623, 1.359521, -3.107204, 1, 0.07843138, 0, 1,
-2.330932, -1.585073, -3.492247, 1, 0.08235294, 0, 1,
-2.28763, -4.246256, -3.102367, 1, 0.09019608, 0, 1,
-2.251078, 0.8437157, -1.419157, 1, 0.09411765, 0, 1,
-2.185953, 0.5561084, -1.310021, 1, 0.1019608, 0, 1,
-2.185342, 1.162051, -2.347361, 1, 0.1098039, 0, 1,
-2.182857, 0.9040766, 0.943172, 1, 0.1137255, 0, 1,
-2.155434, 1.288092, -1.553149, 1, 0.1215686, 0, 1,
-2.11314, -0.3614096, -1.875833, 1, 0.1254902, 0, 1,
-2.093524, -1.098845, -0.6551898, 1, 0.1333333, 0, 1,
-2.089803, 0.7048241, -1.844931, 1, 0.1372549, 0, 1,
-2.064253, 0.1122667, -1.212916, 1, 0.145098, 0, 1,
-2.051035, 0.02998479, -1.074055, 1, 0.1490196, 0, 1,
-2.040728, 0.4063785, -2.041142, 1, 0.1568628, 0, 1,
-2.03859, -1.634913, -2.000308, 1, 0.1607843, 0, 1,
-2.026872, -0.9444903, -0.4447642, 1, 0.1686275, 0, 1,
-1.99544, -0.852107, -1.472457, 1, 0.172549, 0, 1,
-1.989894, 1.42441, 0.8412502, 1, 0.1803922, 0, 1,
-1.97032, 0.1341799, -1.345431, 1, 0.1843137, 0, 1,
-1.955899, -0.9489731, -0.6107396, 1, 0.1921569, 0, 1,
-1.939186, -0.2962271, -0.8946752, 1, 0.1960784, 0, 1,
-1.934807, -0.3041827, -1.704711, 1, 0.2039216, 0, 1,
-1.934145, 0.6222504, -2.152018, 1, 0.2117647, 0, 1,
-1.916923, 0.01213103, -0.2794387, 1, 0.2156863, 0, 1,
-1.905585, -1.343308, -4.304467, 1, 0.2235294, 0, 1,
-1.905293, 0.9887596, -0.1778932, 1, 0.227451, 0, 1,
-1.879516, 0.4474301, -1.386534, 1, 0.2352941, 0, 1,
-1.853101, 0.3844845, -0.8880094, 1, 0.2392157, 0, 1,
-1.850785, 0.5355583, -1.520708, 1, 0.2470588, 0, 1,
-1.840726, -0.81429, -1.859259, 1, 0.2509804, 0, 1,
-1.830753, 0.5482404, 0.002721427, 1, 0.2588235, 0, 1,
-1.816562, 0.3564035, 0.7963684, 1, 0.2627451, 0, 1,
-1.807133, -0.4920538, -1.387194, 1, 0.2705882, 0, 1,
-1.796829, -0.7387688, -1.840776, 1, 0.2745098, 0, 1,
-1.776717, -0.3421491, -2.667847, 1, 0.282353, 0, 1,
-1.766949, -0.7255381, -1.455387, 1, 0.2862745, 0, 1,
-1.752262, -0.6057319, -3.224614, 1, 0.2941177, 0, 1,
-1.752204, -1.024334, -2.706729, 1, 0.3019608, 0, 1,
-1.720878, 0.7307888, -1.693741, 1, 0.3058824, 0, 1,
-1.707045, -1.176432, -0.6732251, 1, 0.3137255, 0, 1,
-1.703547, 0.656352, -2.308147, 1, 0.3176471, 0, 1,
-1.69255, -0.9696931, -3.466075, 1, 0.3254902, 0, 1,
-1.686726, -0.6235744, -0.6464367, 1, 0.3294118, 0, 1,
-1.677516, 0.3559589, -1.697789, 1, 0.3372549, 0, 1,
-1.666584, -0.354629, -1.277805, 1, 0.3411765, 0, 1,
-1.640524, -0.9290439, -1.206034, 1, 0.3490196, 0, 1,
-1.639834, -2.371255, -2.170988, 1, 0.3529412, 0, 1,
-1.627208, -0.2879746, -2.755705, 1, 0.3607843, 0, 1,
-1.624721, -0.8157345, 0.4548897, 1, 0.3647059, 0, 1,
-1.616163, 0.294462, -2.691214, 1, 0.372549, 0, 1,
-1.606518, 1.708587, -1.062381, 1, 0.3764706, 0, 1,
-1.604157, 0.8911774, -2.59923, 1, 0.3843137, 0, 1,
-1.59523, -0.3853922, -0.2596261, 1, 0.3882353, 0, 1,
-1.58546, -0.5993955, -2.741564, 1, 0.3960784, 0, 1,
-1.584561, -0.7023316, -1.400126, 1, 0.4039216, 0, 1,
-1.578092, 0.4776911, 0.3520131, 1, 0.4078431, 0, 1,
-1.558376, 0.5488475, 0.01777475, 1, 0.4156863, 0, 1,
-1.557714, -0.4818442, -1.841274, 1, 0.4196078, 0, 1,
-1.556322, -0.4948118, -3.137037, 1, 0.427451, 0, 1,
-1.536551, -0.0501694, -2.130606, 1, 0.4313726, 0, 1,
-1.530923, -1.032577, -2.925082, 1, 0.4392157, 0, 1,
-1.525896, -0.1754398, -1.415673, 1, 0.4431373, 0, 1,
-1.521894, 0.3506727, -1.832487, 1, 0.4509804, 0, 1,
-1.459664, 0.842033, -0.9071543, 1, 0.454902, 0, 1,
-1.458849, -1.607652, -2.80658, 1, 0.4627451, 0, 1,
-1.45593, 0.4136563, -2.115842, 1, 0.4666667, 0, 1,
-1.452533, 1.105655, -0.04895157, 1, 0.4745098, 0, 1,
-1.446111, -0.948509, -0.8243709, 1, 0.4784314, 0, 1,
-1.435843, 2.095008, -0.1748713, 1, 0.4862745, 0, 1,
-1.430596, 1.635476, -1.39019, 1, 0.4901961, 0, 1,
-1.425725, 0.4645557, 1.064402, 1, 0.4980392, 0, 1,
-1.425723, 0.399644, -2.527574, 1, 0.5058824, 0, 1,
-1.422539, -0.7219529, -0.9283373, 1, 0.509804, 0, 1,
-1.4152, -1.427283, -2.567241, 1, 0.5176471, 0, 1,
-1.400854, 0.845903, 0.019576, 1, 0.5215687, 0, 1,
-1.397525, -0.7778146, -1.623441, 1, 0.5294118, 0, 1,
-1.393877, -0.09070187, -0.6344016, 1, 0.5333334, 0, 1,
-1.391668, 1.627517, 0.2404585, 1, 0.5411765, 0, 1,
-1.381274, -0.6346425, -1.907469, 1, 0.5450981, 0, 1,
-1.376676, -1.693825, -1.943404, 1, 0.5529412, 0, 1,
-1.369016, 1.578009, -1.076459, 1, 0.5568628, 0, 1,
-1.361139, 0.4563869, -0.3929215, 1, 0.5647059, 0, 1,
-1.342752, 0.2525581, -2.529632, 1, 0.5686275, 0, 1,
-1.332556, -0.2173224, -1.721029, 1, 0.5764706, 0, 1,
-1.329193, 0.555207, -1.4147, 1, 0.5803922, 0, 1,
-1.323402, 0.6979499, -1.008583, 1, 0.5882353, 0, 1,
-1.320092, -0.1245654, -1.649015, 1, 0.5921569, 0, 1,
-1.311386, 1.518439, -2.224389, 1, 0.6, 0, 1,
-1.307576, -0.04640184, -1.558895, 1, 0.6078432, 0, 1,
-1.305931, -0.875114, -1.417789, 1, 0.6117647, 0, 1,
-1.301371, -0.9952798, -2.337811, 1, 0.6196079, 0, 1,
-1.287006, 0.2518145, -0.6015075, 1, 0.6235294, 0, 1,
-1.285746, 0.2057845, -1.556988, 1, 0.6313726, 0, 1,
-1.281817, -0.4855797, -1.350937, 1, 0.6352941, 0, 1,
-1.277389, 1.121379, -1.204554, 1, 0.6431373, 0, 1,
-1.274927, 1.168509, -1.198849, 1, 0.6470588, 0, 1,
-1.257463, -0.04683162, -0.9235084, 1, 0.654902, 0, 1,
-1.236423, -1.378852, -3.565748, 1, 0.6588235, 0, 1,
-1.234096, 0.8155791, -2.040194, 1, 0.6666667, 0, 1,
-1.228317, -0.2924582, -1.598157, 1, 0.6705883, 0, 1,
-1.219956, -0.6740557, -2.243257, 1, 0.6784314, 0, 1,
-1.219845, -0.7580809, -1.517812, 1, 0.682353, 0, 1,
-1.213916, -0.620787, -1.55812, 1, 0.6901961, 0, 1,
-1.207868, -1.614132, -4.240958, 1, 0.6941177, 0, 1,
-1.204299, -0.640732, -2.731424, 1, 0.7019608, 0, 1,
-1.191279, -2.018006, -4.420977, 1, 0.7098039, 0, 1,
-1.191227, -0.5471196, -1.019993, 1, 0.7137255, 0, 1,
-1.190303, 1.9158, -2.976811, 1, 0.7215686, 0, 1,
-1.178709, -0.6797423, -2.621146, 1, 0.7254902, 0, 1,
-1.177119, -1.399909, -2.810864, 1, 0.7333333, 0, 1,
-1.175808, -1.709673, -3.113688, 1, 0.7372549, 0, 1,
-1.167272, -1.099105, -1.740035, 1, 0.7450981, 0, 1,
-1.160836, 0.6155455, -1.022398, 1, 0.7490196, 0, 1,
-1.158198, -0.5642682, -2.029242, 1, 0.7568628, 0, 1,
-1.157035, 0.3444585, -1.4312, 1, 0.7607843, 0, 1,
-1.148179, 0.8166611, 0.3294179, 1, 0.7686275, 0, 1,
-1.144439, -0.2813588, -2.612049, 1, 0.772549, 0, 1,
-1.139114, 0.47907, -1.353128, 1, 0.7803922, 0, 1,
-1.120319, -0.04184293, -1.671848, 1, 0.7843137, 0, 1,
-1.111555, -0.6018802, -0.9181296, 1, 0.7921569, 0, 1,
-1.110027, -1.171744, -2.587113, 1, 0.7960784, 0, 1,
-1.102952, -0.3590733, -2.707261, 1, 0.8039216, 0, 1,
-1.083914, 0.9168972, -0.4288127, 1, 0.8117647, 0, 1,
-1.078923, 0.8923159, -0.5809062, 1, 0.8156863, 0, 1,
-1.077059, -1.161391, -1.97643, 1, 0.8235294, 0, 1,
-1.076606, 0.7599611, -0.794465, 1, 0.827451, 0, 1,
-1.075678, -1.208243, -3.162521, 1, 0.8352941, 0, 1,
-1.071857, -0.2474843, -3.638748, 1, 0.8392157, 0, 1,
-1.066225, -0.9855725, -1.94683, 1, 0.8470588, 0, 1,
-1.064688, 0.5337602, -2.429493, 1, 0.8509804, 0, 1,
-1.055369, 0.5320361, -0.6951752, 1, 0.8588235, 0, 1,
-1.050343, 0.2562184, -2.306021, 1, 0.8627451, 0, 1,
-1.045019, 0.3423193, -1.553051, 1, 0.8705882, 0, 1,
-1.044995, -1.567981, -1.428398, 1, 0.8745098, 0, 1,
-1.044494, 0.1716327, -1.044247, 1, 0.8823529, 0, 1,
-1.037167, 0.3494624, -0.7166972, 1, 0.8862745, 0, 1,
-1.036956, 1.318794, 0.3137842, 1, 0.8941177, 0, 1,
-1.032735, 1.439278, -1.683482, 1, 0.8980392, 0, 1,
-1.029095, 0.1478322, -1.087663, 1, 0.9058824, 0, 1,
-1.023231, -0.6989794, -3.396469, 1, 0.9137255, 0, 1,
-1.020989, -0.4800453, -1.876252, 1, 0.9176471, 0, 1,
-1.020695, 0.6914214, -0.473928, 1, 0.9254902, 0, 1,
-1.017164, 1.248762, -0.3314035, 1, 0.9294118, 0, 1,
-1.015162, 0.3711028, -1.105057, 1, 0.9372549, 0, 1,
-1.011548, -0.9428061, -3.120739, 1, 0.9411765, 0, 1,
-1.010579, -2.428995, -3.790957, 1, 0.9490196, 0, 1,
-1.010506, 0.2272664, -2.316848, 1, 0.9529412, 0, 1,
-1.005568, 0.6941746, -2.881907, 1, 0.9607843, 0, 1,
-1.004294, -0.4683009, -2.381046, 1, 0.9647059, 0, 1,
-0.9880511, 1.046971, -2.419956, 1, 0.972549, 0, 1,
-0.9875198, 0.7776221, -0.1331637, 1, 0.9764706, 0, 1,
-0.9830091, 0.4737244, -3.628766, 1, 0.9843137, 0, 1,
-0.9801198, -0.3808047, -0.6495333, 1, 0.9882353, 0, 1,
-0.9721268, 0.3623253, -3.577719, 1, 0.9960784, 0, 1,
-0.9697153, -0.05382611, 0.2038559, 0.9960784, 1, 0, 1,
-0.9678622, -0.7362884, -0.2595099, 0.9921569, 1, 0, 1,
-0.9669167, 0.1951786, -1.069462, 0.9843137, 1, 0, 1,
-0.9650452, 0.2155964, -2.618092, 0.9803922, 1, 0, 1,
-0.9643291, 0.5686946, -1.78865, 0.972549, 1, 0, 1,
-0.9622111, -0.4989508, -1.10553, 0.9686275, 1, 0, 1,
-0.9490185, 1.134617, -1.640252, 0.9607843, 1, 0, 1,
-0.9484046, -0.04337506, -3.327231, 0.9568627, 1, 0, 1,
-0.9454954, -1.281585, -3.432461, 0.9490196, 1, 0, 1,
-0.9387751, 1.179501, -1.076876, 0.945098, 1, 0, 1,
-0.9366852, 0.427415, -2.150689, 0.9372549, 1, 0, 1,
-0.9334924, -0.1959331, 0.3889035, 0.9333333, 1, 0, 1,
-0.9328092, -0.8623013, -0.05987571, 0.9254902, 1, 0, 1,
-0.9321471, -0.3549774, -1.009317, 0.9215686, 1, 0, 1,
-0.931233, -0.8312019, -3.978073, 0.9137255, 1, 0, 1,
-0.929426, 0.3622777, -2.669486, 0.9098039, 1, 0, 1,
-0.9251208, 0.07830304, -1.495371, 0.9019608, 1, 0, 1,
-0.9243631, 1.902486, -1.542281, 0.8941177, 1, 0, 1,
-0.9219093, 0.8187699, -0.3632535, 0.8901961, 1, 0, 1,
-0.91712, 1.616296, 0.251602, 0.8823529, 1, 0, 1,
-0.9142272, 0.3237993, -1.892585, 0.8784314, 1, 0, 1,
-0.9126239, 0.4868161, -2.881991, 0.8705882, 1, 0, 1,
-0.9048101, 1.347264, -0.7521269, 0.8666667, 1, 0, 1,
-0.9042954, -0.2405791, -1.587499, 0.8588235, 1, 0, 1,
-0.8952326, -1.027608, -3.625719, 0.854902, 1, 0, 1,
-0.8923552, 0.1788168, -1.146858, 0.8470588, 1, 0, 1,
-0.8788078, 2.273225, -1.83948, 0.8431373, 1, 0, 1,
-0.8753322, 0.7921335, -0.4032156, 0.8352941, 1, 0, 1,
-0.8745568, -0.05352438, -1.82322, 0.8313726, 1, 0, 1,
-0.8708109, 1.081522, -0.8904312, 0.8235294, 1, 0, 1,
-0.8593521, -2.18197, -4.062263, 0.8196079, 1, 0, 1,
-0.8567065, -0.5075704, -0.08132745, 0.8117647, 1, 0, 1,
-0.8544618, -1.6764, -3.610215, 0.8078431, 1, 0, 1,
-0.8484725, -0.9504736, -3.332674, 0.8, 1, 0, 1,
-0.8434008, -0.9804973, -2.95802, 0.7921569, 1, 0, 1,
-0.8424086, -1.591926, -1.059847, 0.7882353, 1, 0, 1,
-0.8417495, -0.09649512, -0.1442584, 0.7803922, 1, 0, 1,
-0.8330668, 0.8858243, -0.09570087, 0.7764706, 1, 0, 1,
-0.8317939, -0.9165993, -1.307562, 0.7686275, 1, 0, 1,
-0.8304605, -0.004915106, -2.763808, 0.7647059, 1, 0, 1,
-0.8263904, -0.2683451, -0.3753581, 0.7568628, 1, 0, 1,
-0.8262596, -0.4598626, -3.315268, 0.7529412, 1, 0, 1,
-0.8235026, -0.1411487, -2.624048, 0.7450981, 1, 0, 1,
-0.8176775, 0.934591, -0.2992158, 0.7411765, 1, 0, 1,
-0.8161648, -1.377573, -2.312249, 0.7333333, 1, 0, 1,
-0.8107623, 1.801793, -2.009846, 0.7294118, 1, 0, 1,
-0.8042596, 1.190625, -1.043152, 0.7215686, 1, 0, 1,
-0.7983821, 0.3369009, -1.852073, 0.7176471, 1, 0, 1,
-0.7940632, 1.268365, 1.150024, 0.7098039, 1, 0, 1,
-0.7903776, 0.01561423, 0.1781432, 0.7058824, 1, 0, 1,
-0.7813943, -0.7547113, -0.1134171, 0.6980392, 1, 0, 1,
-0.7811197, -0.4617636, -0.6957752, 0.6901961, 1, 0, 1,
-0.7787576, 0.9930468, -0.7046772, 0.6862745, 1, 0, 1,
-0.7787225, 1.346063, -0.6561992, 0.6784314, 1, 0, 1,
-0.7712246, -0.4959532, -1.45429, 0.6745098, 1, 0, 1,
-0.7645277, -0.5167895, -0.5848614, 0.6666667, 1, 0, 1,
-0.7621199, -0.8336924, -2.742115, 0.6627451, 1, 0, 1,
-0.7522634, -1.43702, -2.101691, 0.654902, 1, 0, 1,
-0.751698, 1.447498, 1.085114, 0.6509804, 1, 0, 1,
-0.7491125, 1.610671, -2.527508, 0.6431373, 1, 0, 1,
-0.7456251, 1.039078, 0.7743865, 0.6392157, 1, 0, 1,
-0.7425444, -0.7381276, -2.671396, 0.6313726, 1, 0, 1,
-0.7414057, -0.3275225, -2.82463, 0.627451, 1, 0, 1,
-0.7398116, 0.8207053, -0.3604329, 0.6196079, 1, 0, 1,
-0.7362933, 0.01519684, -1.694757, 0.6156863, 1, 0, 1,
-0.7329979, -0.448238, -1.17412, 0.6078432, 1, 0, 1,
-0.7300328, -2.231631, -4.158904, 0.6039216, 1, 0, 1,
-0.7207271, -0.9768319, -3.018741, 0.5960785, 1, 0, 1,
-0.7164573, 2.084633, -0.4495651, 0.5882353, 1, 0, 1,
-0.709287, -1.428162, -3.325276, 0.5843138, 1, 0, 1,
-0.7042446, -0.574354, -3.539994, 0.5764706, 1, 0, 1,
-0.7036656, 0.4832532, 1.5198, 0.572549, 1, 0, 1,
-0.7032889, -1.493622, -1.979594, 0.5647059, 1, 0, 1,
-0.7024061, 1.714283, 1.780309, 0.5607843, 1, 0, 1,
-0.7021322, 1.384406, 0.2939737, 0.5529412, 1, 0, 1,
-0.6976466, -2.059379, -3.693789, 0.5490196, 1, 0, 1,
-0.6935582, 0.3711027, -2.201377, 0.5411765, 1, 0, 1,
-0.6933627, 0.942921, -0.9779335, 0.5372549, 1, 0, 1,
-0.6927754, -0.01592899, -2.178041, 0.5294118, 1, 0, 1,
-0.6872974, -1.396769, -2.995564, 0.5254902, 1, 0, 1,
-0.6866976, 2.380445, -0.143059, 0.5176471, 1, 0, 1,
-0.6849713, 0.02295149, -1.560817, 0.5137255, 1, 0, 1,
-0.6846131, 0.5178289, 0.9966254, 0.5058824, 1, 0, 1,
-0.6825998, -2.20852, -3.509965, 0.5019608, 1, 0, 1,
-0.6795183, -0.8277805, -2.080105, 0.4941176, 1, 0, 1,
-0.6788825, -1.713502, -2.534149, 0.4862745, 1, 0, 1,
-0.6773084, -2.150521, -3.901249, 0.4823529, 1, 0, 1,
-0.6745064, -0.7355585, -2.846354, 0.4745098, 1, 0, 1,
-0.6726751, -1.774972, -2.87418, 0.4705882, 1, 0, 1,
-0.6720384, -0.007940901, -2.079874, 0.4627451, 1, 0, 1,
-0.6688004, 1.99349, -0.7490231, 0.4588235, 1, 0, 1,
-0.665965, 0.1969522, -1.247643, 0.4509804, 1, 0, 1,
-0.6649496, -0.5791391, -0.425752, 0.4470588, 1, 0, 1,
-0.661253, 2.160735, -0.8956379, 0.4392157, 1, 0, 1,
-0.6599209, -0.08545154, -1.10974, 0.4352941, 1, 0, 1,
-0.6585609, 2.526666, -0.7538221, 0.427451, 1, 0, 1,
-0.6542629, -0.2274329, -0.4749779, 0.4235294, 1, 0, 1,
-0.6519309, -0.0078658, -1.805158, 0.4156863, 1, 0, 1,
-0.6501592, -0.194296, -1.12454, 0.4117647, 1, 0, 1,
-0.6492135, -0.155473, -2.785349, 0.4039216, 1, 0, 1,
-0.6443071, 0.4823812, -1.595871, 0.3960784, 1, 0, 1,
-0.6349527, 0.9919362, -0.7013437, 0.3921569, 1, 0, 1,
-0.6312875, -1.408156, -2.554266, 0.3843137, 1, 0, 1,
-0.6306223, -0.2465569, -2.210245, 0.3803922, 1, 0, 1,
-0.6265742, -0.1322401, -2.945017, 0.372549, 1, 0, 1,
-0.6203476, 2.060307, 0.7907521, 0.3686275, 1, 0, 1,
-0.6166516, -1.462539, -3.419762, 0.3607843, 1, 0, 1,
-0.6068091, 1.461915, -0.7322171, 0.3568628, 1, 0, 1,
-0.6058143, -0.3091443, -2.66276, 0.3490196, 1, 0, 1,
-0.6057315, -1.6222, -3.215684, 0.345098, 1, 0, 1,
-0.6048511, 0.5139958, -0.5928829, 0.3372549, 1, 0, 1,
-0.6037457, 0.05750154, -0.4237913, 0.3333333, 1, 0, 1,
-0.602958, 1.95686, -0.1241444, 0.3254902, 1, 0, 1,
-0.5983627, -1.54395, -1.416712, 0.3215686, 1, 0, 1,
-0.5980949, 1.364873, -1.563239, 0.3137255, 1, 0, 1,
-0.5953519, 1.344739, -0.1579324, 0.3098039, 1, 0, 1,
-0.5934125, 0.7925662, -0.1483227, 0.3019608, 1, 0, 1,
-0.5920898, -0.5322685, -2.752125, 0.2941177, 1, 0, 1,
-0.5797714, 0.5448599, -2.408122, 0.2901961, 1, 0, 1,
-0.5774122, 0.9775118, -2.548094, 0.282353, 1, 0, 1,
-0.5761705, -0.5893762, -1.669692, 0.2784314, 1, 0, 1,
-0.5761118, -0.5536838, -2.470171, 0.2705882, 1, 0, 1,
-0.5734809, -1.358776, -1.191103, 0.2666667, 1, 0, 1,
-0.5717698, -0.2429914, -3.177946, 0.2588235, 1, 0, 1,
-0.570515, 0.2601333, -2.111488, 0.254902, 1, 0, 1,
-0.5692046, 0.6379568, -2.149648, 0.2470588, 1, 0, 1,
-0.5633571, -1.274072, -3.10843, 0.2431373, 1, 0, 1,
-0.5593516, 0.2038601, -1.368152, 0.2352941, 1, 0, 1,
-0.5582059, 0.661231, -2.786175, 0.2313726, 1, 0, 1,
-0.5577098, -0.1238223, -3.008862, 0.2235294, 1, 0, 1,
-0.5574982, -1.041858, -2.757902, 0.2196078, 1, 0, 1,
-0.5494552, -0.1680562, -2.755584, 0.2117647, 1, 0, 1,
-0.5399872, 0.546231, -1.221454, 0.2078431, 1, 0, 1,
-0.5396028, 0.5061997, 0.8678629, 0.2, 1, 0, 1,
-0.5393974, -1.340378, -4.550792, 0.1921569, 1, 0, 1,
-0.5381748, -0.7936308, -2.892732, 0.1882353, 1, 0, 1,
-0.5352755, -1.006425, -0.7622572, 0.1803922, 1, 0, 1,
-0.5325283, 0.002610764, -2.1096, 0.1764706, 1, 0, 1,
-0.5311109, 1.030217, -1.375821, 0.1686275, 1, 0, 1,
-0.5262218, 0.1840474, -0.6523675, 0.1647059, 1, 0, 1,
-0.5255932, 0.3284307, 0.1477928, 0.1568628, 1, 0, 1,
-0.5156159, 0.08748565, -2.90108, 0.1529412, 1, 0, 1,
-0.5135092, -0.1872453, -2.848782, 0.145098, 1, 0, 1,
-0.5108588, -0.9022499, -3.563827, 0.1411765, 1, 0, 1,
-0.5079675, 1.299976, 0.3507897, 0.1333333, 1, 0, 1,
-0.5055277, -1.260004, -3.451904, 0.1294118, 1, 0, 1,
-0.4939452, -0.03970823, -1.88666, 0.1215686, 1, 0, 1,
-0.4897126, -2.723317, -3.972531, 0.1176471, 1, 0, 1,
-0.4833195, 0.61678, -1.20455, 0.1098039, 1, 0, 1,
-0.4823771, 0.5884637, -0.6481056, 0.1058824, 1, 0, 1,
-0.4820307, -0.7004944, -0.2917652, 0.09803922, 1, 0, 1,
-0.4790698, -0.3918239, -2.411009, 0.09019608, 1, 0, 1,
-0.4772147, 1.329286, -0.2019681, 0.08627451, 1, 0, 1,
-0.4758105, -0.1469002, -2.028235, 0.07843138, 1, 0, 1,
-0.4753668, -0.8284709, -3.519493, 0.07450981, 1, 0, 1,
-0.4717507, 1.391574, -0.2174411, 0.06666667, 1, 0, 1,
-0.4703216, -0.3326989, -2.182467, 0.0627451, 1, 0, 1,
-0.4697501, 1.030026, 0.1286442, 0.05490196, 1, 0, 1,
-0.4683224, 1.861353, 0.2078995, 0.05098039, 1, 0, 1,
-0.467597, 0.5003785, 0.6286783, 0.04313726, 1, 0, 1,
-0.464304, 1.019693, -1.060201, 0.03921569, 1, 0, 1,
-0.4578796, 0.1599887, -0.8430053, 0.03137255, 1, 0, 1,
-0.4578194, -0.5817011, -3.686629, 0.02745098, 1, 0, 1,
-0.4564005, -0.482065, -2.899002, 0.01960784, 1, 0, 1,
-0.455344, -1.411098, -1.306013, 0.01568628, 1, 0, 1,
-0.4544253, 0.329017, 0.01413522, 0.007843138, 1, 0, 1,
-0.4525859, 0.9603499, 1.192836, 0.003921569, 1, 0, 1,
-0.4523446, -1.595253, -2.919168, 0, 1, 0.003921569, 1,
-0.4509027, -0.2162889, -1.670263, 0, 1, 0.01176471, 1,
-0.4490181, 1.335198, -1.196661, 0, 1, 0.01568628, 1,
-0.4432268, -0.1352067, -1.690642, 0, 1, 0.02352941, 1,
-0.4387527, -1.203091, -2.56577, 0, 1, 0.02745098, 1,
-0.437415, 1.32023, 0.5234577, 0, 1, 0.03529412, 1,
-0.4325786, -0.5914567, -3.418494, 0, 1, 0.03921569, 1,
-0.4306677, 0.6900892, -1.134545, 0, 1, 0.04705882, 1,
-0.4297257, 0.1853425, -0.6196859, 0, 1, 0.05098039, 1,
-0.428623, 0.4824652, -1.712064, 0, 1, 0.05882353, 1,
-0.4278717, 0.2015144, -0.509898, 0, 1, 0.0627451, 1,
-0.4255961, -0.4371672, -1.537768, 0, 1, 0.07058824, 1,
-0.415436, 0.4559121, -0.4941196, 0, 1, 0.07450981, 1,
-0.4106593, 1.951779, -0.2252078, 0, 1, 0.08235294, 1,
-0.4081287, -0.5964202, -2.311549, 0, 1, 0.08627451, 1,
-0.4017738, 0.4337853, -0.1973648, 0, 1, 0.09411765, 1,
-0.3890356, 0.07049889, -0.4033313, 0, 1, 0.1019608, 1,
-0.3883341, 0.1648864, -2.285277, 0, 1, 0.1058824, 1,
-0.388027, -0.5754653, -3.888254, 0, 1, 0.1137255, 1,
-0.3877217, 0.7494096, -0.6071574, 0, 1, 0.1176471, 1,
-0.3843571, 0.4440478, -0.4191429, 0, 1, 0.1254902, 1,
-0.3838013, 0.7649456, 0.3888818, 0, 1, 0.1294118, 1,
-0.3747425, 0.5340751, -0.2640086, 0, 1, 0.1372549, 1,
-0.3677062, 0.3908662, -1.05093, 0, 1, 0.1411765, 1,
-0.3585802, -1.092666, -1.410955, 0, 1, 0.1490196, 1,
-0.3578252, 0.08802447, -1.06347, 0, 1, 0.1529412, 1,
-0.3537964, -0.6439338, -3.700538, 0, 1, 0.1607843, 1,
-0.3500592, -0.3643402, -2.887578, 0, 1, 0.1647059, 1,
-0.349459, 0.2916162, -0.1613233, 0, 1, 0.172549, 1,
-0.3452139, -0.7659634, -3.746159, 0, 1, 0.1764706, 1,
-0.3448898, -1.141735, -3.831184, 0, 1, 0.1843137, 1,
-0.3426211, 0.5344197, -0.4582825, 0, 1, 0.1882353, 1,
-0.3415459, 1.061438, 0.2109155, 0, 1, 0.1960784, 1,
-0.3383153, -0.4888429, -2.369192, 0, 1, 0.2039216, 1,
-0.3346204, 1.055623, -0.6118457, 0, 1, 0.2078431, 1,
-0.3311986, -1.169667, -4.129215, 0, 1, 0.2156863, 1,
-0.3268034, 2.691868, -2.065115, 0, 1, 0.2196078, 1,
-0.3254934, 0.5583935, -0.148025, 0, 1, 0.227451, 1,
-0.3221756, -1.191496, -3.95602, 0, 1, 0.2313726, 1,
-0.3219227, -0.2559156, -0.713578, 0, 1, 0.2392157, 1,
-0.3158286, 0.1956132, -3.237241, 0, 1, 0.2431373, 1,
-0.3127804, -1.055987, -2.92433, 0, 1, 0.2509804, 1,
-0.3119836, -0.7414174, -3.191255, 0, 1, 0.254902, 1,
-0.3116855, -0.943101, -3.405882, 0, 1, 0.2627451, 1,
-0.3063651, -0.08571284, -2.229453, 0, 1, 0.2666667, 1,
-0.3053516, -0.3995368, -1.838325, 0, 1, 0.2745098, 1,
-0.3052788, 0.1037255, -1.199718, 0, 1, 0.2784314, 1,
-0.3042789, -0.2921809, -1.334843, 0, 1, 0.2862745, 1,
-0.3003391, 0.1139095, -0.4030677, 0, 1, 0.2901961, 1,
-0.2987286, -0.2020597, -1.491, 0, 1, 0.2980392, 1,
-0.2982715, 0.541626, 0.4308481, 0, 1, 0.3058824, 1,
-0.2885151, -0.6570398, -4.652585, 0, 1, 0.3098039, 1,
-0.2875656, 0.3318264, -1.042925, 0, 1, 0.3176471, 1,
-0.2820252, 0.3619592, 0.4649656, 0, 1, 0.3215686, 1,
-0.2753306, -1.084744, -1.59435, 0, 1, 0.3294118, 1,
-0.2751711, -1.351956, -3.42409, 0, 1, 0.3333333, 1,
-0.2677221, 0.9843727, 0.1017659, 0, 1, 0.3411765, 1,
-0.2664925, -0.4542885, -0.6785119, 0, 1, 0.345098, 1,
-0.2645489, -0.5235812, -1.526354, 0, 1, 0.3529412, 1,
-0.2613732, -0.1405201, -0.1884632, 0, 1, 0.3568628, 1,
-0.2569219, -0.6363925, -1.053926, 0, 1, 0.3647059, 1,
-0.2553761, 1.815246, -0.4820448, 0, 1, 0.3686275, 1,
-0.255018, 1.033185, -1.618613, 0, 1, 0.3764706, 1,
-0.2405072, -0.8861483, -3.161929, 0, 1, 0.3803922, 1,
-0.2382668, 1.012526, -2.490701, 0, 1, 0.3882353, 1,
-0.2348235, 1.681105, -3.310088, 0, 1, 0.3921569, 1,
-0.2338705, 0.9977474, 0.8055291, 0, 1, 0.4, 1,
-0.2332423, -1.520075, -4.153921, 0, 1, 0.4078431, 1,
-0.2315732, -0.4101024, -3.159659, 0, 1, 0.4117647, 1,
-0.231093, 1.511901, 1.053761, 0, 1, 0.4196078, 1,
-0.2303706, 0.3131634, -0.2443187, 0, 1, 0.4235294, 1,
-0.2301066, -0.08620402, -2.723076, 0, 1, 0.4313726, 1,
-0.2290587, -1.106497, -2.003928, 0, 1, 0.4352941, 1,
-0.2284592, 1.720918, 0.7345793, 0, 1, 0.4431373, 1,
-0.2235933, -0.1735593, -1.995182, 0, 1, 0.4470588, 1,
-0.2230402, 0.5048418, 0.1261302, 0, 1, 0.454902, 1,
-0.2185352, 1.095837, -0.3927861, 0, 1, 0.4588235, 1,
-0.2148428, -1.110447, -1.873755, 0, 1, 0.4666667, 1,
-0.2129487, -0.733882, -0.9529654, 0, 1, 0.4705882, 1,
-0.2128586, 0.4842272, -0.6795569, 0, 1, 0.4784314, 1,
-0.2127112, 1.22141, 0.8406383, 0, 1, 0.4823529, 1,
-0.2014506, 1.400952, -0.8533115, 0, 1, 0.4901961, 1,
-0.1943813, -0.04246972, -1.543108, 0, 1, 0.4941176, 1,
-0.1933101, -1.159567, -2.492962, 0, 1, 0.5019608, 1,
-0.19234, 0.5600937, 1.058313, 0, 1, 0.509804, 1,
-0.1909787, 0.8331497, 0.611657, 0, 1, 0.5137255, 1,
-0.1898987, -1.77513, -2.031003, 0, 1, 0.5215687, 1,
-0.1897974, 1.838775, -1.256817, 0, 1, 0.5254902, 1,
-0.1856258, 0.4232579, 0.2283705, 0, 1, 0.5333334, 1,
-0.1842284, 0.6843738, -0.3205708, 0, 1, 0.5372549, 1,
-0.1828313, 0.017033, 1.145463, 0, 1, 0.5450981, 1,
-0.1827577, 1.312878, 2.039078, 0, 1, 0.5490196, 1,
-0.1819915, -1.14531, -3.292896, 0, 1, 0.5568628, 1,
-0.1780923, -2.03376, -2.495281, 0, 1, 0.5607843, 1,
-0.1747644, -0.7013341, -3.431012, 0, 1, 0.5686275, 1,
-0.1730445, -1.135418, -4.04298, 0, 1, 0.572549, 1,
-0.1722696, 0.3368773, 0.3924051, 0, 1, 0.5803922, 1,
-0.1686735, -0.7189887, -3.140966, 0, 1, 0.5843138, 1,
-0.1674504, 1.378319, 0.06801244, 0, 1, 0.5921569, 1,
-0.1599228, -0.5986698, -4.240325, 0, 1, 0.5960785, 1,
-0.1585394, 0.4153103, -0.7499807, 0, 1, 0.6039216, 1,
-0.149347, -0.07241651, -1.69955, 0, 1, 0.6117647, 1,
-0.1472998, -0.4425903, -4.246164, 0, 1, 0.6156863, 1,
-0.141005, 0.3838348, 0.3824549, 0, 1, 0.6235294, 1,
-0.1401273, -0.4202133, -3.518177, 0, 1, 0.627451, 1,
-0.138685, -1.212978, -4.300588, 0, 1, 0.6352941, 1,
-0.1378859, 0.07084081, -1.278276, 0, 1, 0.6392157, 1,
-0.1308707, -0.6393068, -3.173586, 0, 1, 0.6470588, 1,
-0.1261451, -1.306037, -2.355903, 0, 1, 0.6509804, 1,
-0.11341, -0.9811452, -1.016762, 0, 1, 0.6588235, 1,
-0.1036212, 0.08348995, -1.979665, 0, 1, 0.6627451, 1,
-0.1027089, 1.039315, -1.411729, 0, 1, 0.6705883, 1,
-0.09677576, 1.52793, 1.741953, 0, 1, 0.6745098, 1,
-0.09594374, 0.9062534, 1.013885, 0, 1, 0.682353, 1,
-0.09484549, 0.1098241, -1.665917, 0, 1, 0.6862745, 1,
-0.09078185, 0.05381704, -1.58602, 0, 1, 0.6941177, 1,
-0.08750706, -1.698182, -3.494646, 0, 1, 0.7019608, 1,
-0.08646785, 0.8684848, 0.8943027, 0, 1, 0.7058824, 1,
-0.08556396, 0.07630505, -1.811243, 0, 1, 0.7137255, 1,
-0.08421656, 0.07716549, -2.442019, 0, 1, 0.7176471, 1,
-0.08261213, 0.6525005, -0.0123386, 0, 1, 0.7254902, 1,
-0.08238696, 0.07050133, 0.7634858, 0, 1, 0.7294118, 1,
-0.08170991, -0.8032967, -3.220726, 0, 1, 0.7372549, 1,
-0.07727831, -0.4183453, -3.482584, 0, 1, 0.7411765, 1,
-0.07233011, 0.7927628, -0.5639092, 0, 1, 0.7490196, 1,
-0.07005642, 0.5531306, 0.05357653, 0, 1, 0.7529412, 1,
-0.06924957, -1.309104, -2.959026, 0, 1, 0.7607843, 1,
-0.06752733, -0.3248473, -2.603741, 0, 1, 0.7647059, 1,
-0.06748098, 1.895457, 2.239433, 0, 1, 0.772549, 1,
-0.06635765, 1.020904, 1.131452, 0, 1, 0.7764706, 1,
-0.06354095, 0.6619227, 0.6948121, 0, 1, 0.7843137, 1,
-0.06317668, 0.09485365, -0.5262481, 0, 1, 0.7882353, 1,
-0.06141944, 0.3454552, -0.9667466, 0, 1, 0.7960784, 1,
-0.06115104, -0.6343923, -2.588272, 0, 1, 0.8039216, 1,
-0.05917382, 0.9411827, 0.9406186, 0, 1, 0.8078431, 1,
-0.05855641, -1.324047, -2.730773, 0, 1, 0.8156863, 1,
-0.0581045, -2.392137, -3.433354, 0, 1, 0.8196079, 1,
-0.05775354, -0.0351884, -1.722242, 0, 1, 0.827451, 1,
-0.05539898, 1.825153, -0.2522582, 0, 1, 0.8313726, 1,
-0.05002069, 0.07872744, -0.9424482, 0, 1, 0.8392157, 1,
-0.04570465, 0.5568058, -0.3718851, 0, 1, 0.8431373, 1,
-0.04551731, -1.747068, -3.13983, 0, 1, 0.8509804, 1,
-0.0436409, -3.404273, -3.525199, 0, 1, 0.854902, 1,
-0.03883687, -0.04119695, -4.144665, 0, 1, 0.8627451, 1,
-0.03669763, -0.3437625, -3.62113, 0, 1, 0.8666667, 1,
-0.03603124, 0.5384022, 0.6260692, 0, 1, 0.8745098, 1,
-0.03522028, -1.789226, -2.973067, 0, 1, 0.8784314, 1,
-0.03319675, 0.21196, 0.6027147, 0, 1, 0.8862745, 1,
-0.03159369, -0.6244216, -3.515559, 0, 1, 0.8901961, 1,
-0.030914, -1.662266, -3.74336, 0, 1, 0.8980392, 1,
-0.02959493, 0.116133, -0.5655012, 0, 1, 0.9058824, 1,
-0.0253021, 1.398905, -1.313142, 0, 1, 0.9098039, 1,
-0.01898393, -0.447359, -3.0164, 0, 1, 0.9176471, 1,
-0.01598707, 0.003714524, -1.3679, 0, 1, 0.9215686, 1,
-0.008998401, -0.5173103, -4.609793, 0, 1, 0.9294118, 1,
-0.001344396, -0.7929124, -4.440744, 0, 1, 0.9333333, 1,
-0.0008475088, -0.1121107, -4.099778, 0, 1, 0.9411765, 1,
-0.0006018642, -0.1957126, -2.005192, 0, 1, 0.945098, 1,
-0.0005438954, -0.8119027, -2.144284, 0, 1, 0.9529412, 1,
-0.0002466084, 0.1601093, -1.164767, 0, 1, 0.9568627, 1,
0.0003243349, -0.5266906, 4.871376, 0, 1, 0.9647059, 1,
0.001258372, -0.2727176, 3.030073, 0, 1, 0.9686275, 1,
0.003706409, -0.1542847, 1.588465, 0, 1, 0.9764706, 1,
0.009434231, -0.7746856, 2.694122, 0, 1, 0.9803922, 1,
0.01083104, 0.0795658, -0.3902517, 0, 1, 0.9882353, 1,
0.01307672, 0.4883322, -2.197695, 0, 1, 0.9921569, 1,
0.01357541, 2.046248, 0.593703, 0, 1, 1, 1,
0.01411403, 0.7251466, 0.5602638, 0, 0.9921569, 1, 1,
0.01422649, -2.348877, 1.736344, 0, 0.9882353, 1, 1,
0.01547406, 1.359534, -1.003728, 0, 0.9803922, 1, 1,
0.02297005, -0.301414, 3.424896, 0, 0.9764706, 1, 1,
0.02421512, 0.1364488, 1.365125, 0, 0.9686275, 1, 1,
0.02609224, -0.3518341, 2.956012, 0, 0.9647059, 1, 1,
0.02690738, 0.4417131, 1.031995, 0, 0.9568627, 1, 1,
0.03149611, 0.7448227, -0.8250738, 0, 0.9529412, 1, 1,
0.03247027, 0.2263746, 1.433456, 0, 0.945098, 1, 1,
0.03293272, -0.149953, 0.2218734, 0, 0.9411765, 1, 1,
0.0339358, -0.2130813, 4.56777, 0, 0.9333333, 1, 1,
0.03528585, -0.06830521, 1.899141, 0, 0.9294118, 1, 1,
0.03630144, -0.03424806, 2.039857, 0, 0.9215686, 1, 1,
0.0477364, 2.194655, -0.08854375, 0, 0.9176471, 1, 1,
0.04829277, -0.7535051, 1.333759, 0, 0.9098039, 1, 1,
0.05171181, 1.476068, -0.7592272, 0, 0.9058824, 1, 1,
0.05626306, 0.1818686, 1.08268, 0, 0.8980392, 1, 1,
0.05696761, 0.2602426, 0.6777401, 0, 0.8901961, 1, 1,
0.05747756, 0.9467615, 2.671743, 0, 0.8862745, 1, 1,
0.06067951, 0.1653329, -2.196016, 0, 0.8784314, 1, 1,
0.06386639, -1.381447, 3.552507, 0, 0.8745098, 1, 1,
0.06745984, -0.522734, 2.739469, 0, 0.8666667, 1, 1,
0.06878955, 0.3184101, -0.4467582, 0, 0.8627451, 1, 1,
0.07395604, 1.254513, -1.469291, 0, 0.854902, 1, 1,
0.07484521, 0.002062939, 1.393531, 0, 0.8509804, 1, 1,
0.07514432, -1.483089, 4.371788, 0, 0.8431373, 1, 1,
0.07989834, -0.4344047, 1.605036, 0, 0.8392157, 1, 1,
0.08344937, -0.5910898, 2.881202, 0, 0.8313726, 1, 1,
0.0895226, -0.4272681, 4.265812, 0, 0.827451, 1, 1,
0.09136098, -1.460954, 2.176368, 0, 0.8196079, 1, 1,
0.09209389, -0.7564862, 2.257215, 0, 0.8156863, 1, 1,
0.09780291, -2.001367, 4.067659, 0, 0.8078431, 1, 1,
0.09864882, -1.593089, 3.381521, 0, 0.8039216, 1, 1,
0.09876676, 0.6024651, 1.404477, 0, 0.7960784, 1, 1,
0.1006691, -0.05421171, 4.117178, 0, 0.7882353, 1, 1,
0.1018768, -0.0555122, 0.5951639, 0, 0.7843137, 1, 1,
0.1036961, 0.1905907, 1.807842, 0, 0.7764706, 1, 1,
0.1047427, -0.4981155, 2.738176, 0, 0.772549, 1, 1,
0.1089613, -1.246443, 3.343492, 0, 0.7647059, 1, 1,
0.1096514, -0.9505029, 4.415838, 0, 0.7607843, 1, 1,
0.1097964, -0.3993786, 2.322862, 0, 0.7529412, 1, 1,
0.1101427, -0.1971191, 4.489943, 0, 0.7490196, 1, 1,
0.112128, 0.749576, 0.8913524, 0, 0.7411765, 1, 1,
0.1210716, 0.8313968, 0.7179756, 0, 0.7372549, 1, 1,
0.1225206, -0.3993528, 1.300726, 0, 0.7294118, 1, 1,
0.1240288, 0.3215032, 1.258629, 0, 0.7254902, 1, 1,
0.1302962, 1.594207, -2.251851, 0, 0.7176471, 1, 1,
0.132833, 0.6391038, -0.485159, 0, 0.7137255, 1, 1,
0.1328529, -0.6672577, 2.980516, 0, 0.7058824, 1, 1,
0.1374976, -0.4612521, 3.839837, 0, 0.6980392, 1, 1,
0.1389352, 0.8057466, 1.117444, 0, 0.6941177, 1, 1,
0.1446012, 0.4180258, -0.2648594, 0, 0.6862745, 1, 1,
0.1447098, 1.20443, -0.1480707, 0, 0.682353, 1, 1,
0.1488124, -0.1194611, 3.567388, 0, 0.6745098, 1, 1,
0.1490641, -0.885842, 2.191335, 0, 0.6705883, 1, 1,
0.150558, -0.4248742, 2.492212, 0, 0.6627451, 1, 1,
0.1552533, 0.7694921, 0.5936781, 0, 0.6588235, 1, 1,
0.1595612, 0.0788428, -0.3575779, 0, 0.6509804, 1, 1,
0.159609, -1.651758, 1.968234, 0, 0.6470588, 1, 1,
0.1615605, 0.9042977, -0.515308, 0, 0.6392157, 1, 1,
0.1686423, 0.2755809, 0.9748058, 0, 0.6352941, 1, 1,
0.1695564, -0.3700711, 1.211558, 0, 0.627451, 1, 1,
0.177742, 0.7525537, 0.2127839, 0, 0.6235294, 1, 1,
0.1830292, 0.7666491, 0.7613928, 0, 0.6156863, 1, 1,
0.1853585, -0.4878969, 2.44341, 0, 0.6117647, 1, 1,
0.1856086, -1.613143, 2.307759, 0, 0.6039216, 1, 1,
0.1859377, 0.6916327, -0.5659782, 0, 0.5960785, 1, 1,
0.1861561, -0.2311565, 3.221558, 0, 0.5921569, 1, 1,
0.1884329, 0.3724909, 0.1343443, 0, 0.5843138, 1, 1,
0.1900469, 2.265245, -0.7768376, 0, 0.5803922, 1, 1,
0.1908844, -1.955804, 3.476239, 0, 0.572549, 1, 1,
0.1934102, -0.2716613, 2.103724, 0, 0.5686275, 1, 1,
0.1967247, 2.538226, -0.4160959, 0, 0.5607843, 1, 1,
0.1995133, 0.2365898, 0.3379084, 0, 0.5568628, 1, 1,
0.2007975, 0.496451, 1.199979, 0, 0.5490196, 1, 1,
0.2068471, 0.7250557, 0.3600127, 0, 0.5450981, 1, 1,
0.2078373, -1.501591, 3.245384, 0, 0.5372549, 1, 1,
0.208331, 0.3404902, 1.939775, 0, 0.5333334, 1, 1,
0.2096719, 0.2551718, 0.1946097, 0, 0.5254902, 1, 1,
0.2105669, -0.9403496, 4.036457, 0, 0.5215687, 1, 1,
0.2112027, -0.4202781, 1.84797, 0, 0.5137255, 1, 1,
0.2171431, -1.355931, 2.030946, 0, 0.509804, 1, 1,
0.2182302, 1.466602, -0.08709743, 0, 0.5019608, 1, 1,
0.2184699, 0.9177203, -0.1653619, 0, 0.4941176, 1, 1,
0.2186551, 0.2444156, 1.15306, 0, 0.4901961, 1, 1,
0.2213698, -0.6977407, 1.402899, 0, 0.4823529, 1, 1,
0.2228152, -0.6653294, 1.892384, 0, 0.4784314, 1, 1,
0.2250972, -0.1646979, 3.002896, 0, 0.4705882, 1, 1,
0.2270035, -0.5633886, 3.771209, 0, 0.4666667, 1, 1,
0.2283047, -0.2588852, 3.408553, 0, 0.4588235, 1, 1,
0.231744, -1.283417, 4.25552, 0, 0.454902, 1, 1,
0.2322674, 0.5931582, 0.4933604, 0, 0.4470588, 1, 1,
0.2325179, 0.2041527, 1.237698, 0, 0.4431373, 1, 1,
0.2362298, -1.529053, 3.326892, 0, 0.4352941, 1, 1,
0.2378885, 0.6210539, 1.628253, 0, 0.4313726, 1, 1,
0.2388409, -1.368219, 3.808946, 0, 0.4235294, 1, 1,
0.2403157, -0.8326143, 3.47922, 0, 0.4196078, 1, 1,
0.2418262, 0.5748569, 1.202725, 0, 0.4117647, 1, 1,
0.2438015, 0.1380561, 1.295683, 0, 0.4078431, 1, 1,
0.2511872, 1.64187, -0.2323041, 0, 0.4, 1, 1,
0.2529999, 1.458188, -0.03131219, 0, 0.3921569, 1, 1,
0.2551418, -1.209967, 1.619903, 0, 0.3882353, 1, 1,
0.260728, 1.298043, 0.6931368, 0, 0.3803922, 1, 1,
0.2621724, 0.9431748, 1.300626, 0, 0.3764706, 1, 1,
0.2640767, 0.4562076, -0.7832844, 0, 0.3686275, 1, 1,
0.2674962, -1.811804, 3.329866, 0, 0.3647059, 1, 1,
0.268782, -1.309925, 4.709163, 0, 0.3568628, 1, 1,
0.2716673, 0.5240597, -0.08689599, 0, 0.3529412, 1, 1,
0.274002, 1.185732, 0.4061841, 0, 0.345098, 1, 1,
0.2740586, 0.4370873, -0.7086089, 0, 0.3411765, 1, 1,
0.2741937, -0.6170948, 3.371579, 0, 0.3333333, 1, 1,
0.2794366, 1.435557, -1.427088, 0, 0.3294118, 1, 1,
0.280877, 0.4434527, -0.2135281, 0, 0.3215686, 1, 1,
0.2867356, -0.117763, 1.62628, 0, 0.3176471, 1, 1,
0.2943266, -1.707191, 4.329521, 0, 0.3098039, 1, 1,
0.2983211, -0.2718921, 2.258059, 0, 0.3058824, 1, 1,
0.3068341, 0.342639, -1.753449, 0, 0.2980392, 1, 1,
0.3084093, -1.049816, 5.691998, 0, 0.2901961, 1, 1,
0.3099367, 0.2431648, 1.242677, 0, 0.2862745, 1, 1,
0.3105324, -0.8077525, 2.93602, 0, 0.2784314, 1, 1,
0.3112284, 0.1817594, 2.050571, 0, 0.2745098, 1, 1,
0.3126512, 0.2273808, -0.4355303, 0, 0.2666667, 1, 1,
0.3142417, 1.015852, 1.097157, 0, 0.2627451, 1, 1,
0.3169594, 1.710738, 1.262269, 0, 0.254902, 1, 1,
0.319762, -0.1189561, 1.96192, 0, 0.2509804, 1, 1,
0.3222841, 0.6395625, 1.996695, 0, 0.2431373, 1, 1,
0.3273713, 0.07763801, 1.192907, 0, 0.2392157, 1, 1,
0.3314346, 1.013702, -0.6225447, 0, 0.2313726, 1, 1,
0.333454, -0.2832423, 0.5340559, 0, 0.227451, 1, 1,
0.3351129, 0.2628437, 1.407788, 0, 0.2196078, 1, 1,
0.3376784, -2.812222, 1.689754, 0, 0.2156863, 1, 1,
0.3377811, -1.193247, 2.533372, 0, 0.2078431, 1, 1,
0.3421987, 0.6491569, 0.3062612, 0, 0.2039216, 1, 1,
0.3429376, -0.3763371, 2.579607, 0, 0.1960784, 1, 1,
0.3455848, -2.043023, 3.981084, 0, 0.1882353, 1, 1,
0.3457095, 0.8282521, -0.3425033, 0, 0.1843137, 1, 1,
0.3472505, 0.9256003, 2.262596, 0, 0.1764706, 1, 1,
0.3481071, -1.353328, 1.20224, 0, 0.172549, 1, 1,
0.3505154, 2.591854, -0.1662124, 0, 0.1647059, 1, 1,
0.3512823, 0.8539584, 0.8263539, 0, 0.1607843, 1, 1,
0.3536757, -0.06502815, 2.924749, 0, 0.1529412, 1, 1,
0.3622749, 0.2309245, -0.8053793, 0, 0.1490196, 1, 1,
0.3638344, 1.284851, 0.6122443, 0, 0.1411765, 1, 1,
0.369205, -0.8551449, 3.486496, 0, 0.1372549, 1, 1,
0.3697473, 0.0003422978, 2.052945, 0, 0.1294118, 1, 1,
0.3699314, -0.4986746, 2.921512, 0, 0.1254902, 1, 1,
0.3743398, -1.316484, 2.655621, 0, 0.1176471, 1, 1,
0.3794967, 0.4901769, 0.07167099, 0, 0.1137255, 1, 1,
0.3808479, 0.605395, 1.260552, 0, 0.1058824, 1, 1,
0.3832988, -0.2482263, 1.758826, 0, 0.09803922, 1, 1,
0.3855623, -1.959026, 5.298148, 0, 0.09411765, 1, 1,
0.3858046, 0.5163423, -0.01955538, 0, 0.08627451, 1, 1,
0.387097, 1.30589, 2.045574, 0, 0.08235294, 1, 1,
0.3881038, 0.3481062, 1.379584, 0, 0.07450981, 1, 1,
0.3891193, 0.08334257, 3.677861, 0, 0.07058824, 1, 1,
0.3894074, 0.592605, 0.1694974, 0, 0.0627451, 1, 1,
0.3903244, 1.003653, -1.625015, 0, 0.05882353, 1, 1,
0.399043, 0.928199, -0.4724736, 0, 0.05098039, 1, 1,
0.3994888, 2.127505, 1.531421, 0, 0.04705882, 1, 1,
0.4026652, -0.8841001, 1.923386, 0, 0.03921569, 1, 1,
0.413951, 1.0906, 0.9165351, 0, 0.03529412, 1, 1,
0.4146174, 0.1244433, 1.94633, 0, 0.02745098, 1, 1,
0.4187829, 1.083574, 0.1852172, 0, 0.02352941, 1, 1,
0.4209878, -0.8397471, 3.187617, 0, 0.01568628, 1, 1,
0.4210207, 1.240752, -0.541864, 0, 0.01176471, 1, 1,
0.4255082, -1.053766, 2.251565, 0, 0.003921569, 1, 1,
0.4259059, 0.1938414, 0.9918977, 0.003921569, 0, 1, 1,
0.4267173, 0.7060987, 2.467558, 0.007843138, 0, 1, 1,
0.4295762, -1.015355, 2.925723, 0.01568628, 0, 1, 1,
0.4324839, -1.093241, 4.891241, 0.01960784, 0, 1, 1,
0.4379486, 0.3971896, -0.7090427, 0.02745098, 0, 1, 1,
0.4399827, -0.1390209, 2.009231, 0.03137255, 0, 1, 1,
0.4455667, -0.7030863, 2.916497, 0.03921569, 0, 1, 1,
0.4548393, 0.3019163, 0.5154663, 0.04313726, 0, 1, 1,
0.4578963, 1.461218, 1.945733, 0.05098039, 0, 1, 1,
0.4600516, -0.1307765, 0.6825577, 0.05490196, 0, 1, 1,
0.4645452, -0.3516675, 4.673161, 0.0627451, 0, 1, 1,
0.4654667, -0.3486758, 1.895511, 0.06666667, 0, 1, 1,
0.4688706, 0.6624232, -1.898315, 0.07450981, 0, 1, 1,
0.4689645, 1.770781, 0.736015, 0.07843138, 0, 1, 1,
0.4691673, 0.5217752, 0.1256105, 0.08627451, 0, 1, 1,
0.4734765, 1.54536, -0.06418329, 0.09019608, 0, 1, 1,
0.4736567, 0.4181592, -1.564854, 0.09803922, 0, 1, 1,
0.4753455, 0.3486978, 0.4513234, 0.1058824, 0, 1, 1,
0.475492, 1.061851, 0.5097261, 0.1098039, 0, 1, 1,
0.4758001, 0.6436074, 2.092088, 0.1176471, 0, 1, 1,
0.4774431, -0.1292559, 2.19401, 0.1215686, 0, 1, 1,
0.4791648, 0.9195687, 0.8218943, 0.1294118, 0, 1, 1,
0.4818044, -0.5562633, 1.915499, 0.1333333, 0, 1, 1,
0.4822123, -0.5154427, 1.583272, 0.1411765, 0, 1, 1,
0.4939938, -0.6356884, 2.160776, 0.145098, 0, 1, 1,
0.4971412, -1.458831, 2.622914, 0.1529412, 0, 1, 1,
0.5008524, 0.4507188, 2.467713, 0.1568628, 0, 1, 1,
0.5032554, -0.6810375, 1.22032, 0.1647059, 0, 1, 1,
0.5059581, -0.5358303, 0.6629936, 0.1686275, 0, 1, 1,
0.5064449, -0.2568762, 3.044503, 0.1764706, 0, 1, 1,
0.5072092, 1.22904, 2.201788, 0.1803922, 0, 1, 1,
0.5092687, -0.5111714, 2.383046, 0.1882353, 0, 1, 1,
0.5101808, -0.07393225, 1.195505, 0.1921569, 0, 1, 1,
0.5112166, -0.5597628, 1.832094, 0.2, 0, 1, 1,
0.512096, -0.59532, 1.045293, 0.2078431, 0, 1, 1,
0.5148188, -0.02942912, 1.632339, 0.2117647, 0, 1, 1,
0.5155181, -1.36921, 3.521069, 0.2196078, 0, 1, 1,
0.5176379, 0.5042298, 1.142169, 0.2235294, 0, 1, 1,
0.5192501, 0.1081103, 1.593053, 0.2313726, 0, 1, 1,
0.5238409, -0.1482051, 0.631117, 0.2352941, 0, 1, 1,
0.5289685, -0.3052426, 2.07258, 0.2431373, 0, 1, 1,
0.5310362, 0.1697155, 1.091818, 0.2470588, 0, 1, 1,
0.5343274, 1.403598, -0.2185984, 0.254902, 0, 1, 1,
0.5444765, -1.723017, 2.427718, 0.2588235, 0, 1, 1,
0.5460677, -0.09440131, 1.940991, 0.2666667, 0, 1, 1,
0.5537649, -0.0002189948, 3.777751, 0.2705882, 0, 1, 1,
0.5571657, 0.396482, 1.07842, 0.2784314, 0, 1, 1,
0.5622777, -0.5070461, 3.684028, 0.282353, 0, 1, 1,
0.5664081, 0.2343667, -0.08985118, 0.2901961, 0, 1, 1,
0.5673301, -0.9052987, 2.622481, 0.2941177, 0, 1, 1,
0.5748493, -0.001662749, 1.150924, 0.3019608, 0, 1, 1,
0.5752036, -0.06234849, 1.893281, 0.3098039, 0, 1, 1,
0.5759203, 0.1360836, -0.09208937, 0.3137255, 0, 1, 1,
0.5870137, 2.769656, 1.212276, 0.3215686, 0, 1, 1,
0.5873195, 0.8867753, -0.04251219, 0.3254902, 0, 1, 1,
0.5874372, 0.7220005, 0.8773152, 0.3333333, 0, 1, 1,
0.5915863, 0.7515488, 0.1837356, 0.3372549, 0, 1, 1,
0.5920542, 0.1310847, 0.5777055, 0.345098, 0, 1, 1,
0.5924095, -0.06953406, 1.013713, 0.3490196, 0, 1, 1,
0.5940552, 0.618686, 1.682323, 0.3568628, 0, 1, 1,
0.594593, 1.164597, -0.3080558, 0.3607843, 0, 1, 1,
0.59561, -0.2074753, 2.302846, 0.3686275, 0, 1, 1,
0.5962419, -1.230427, 1.776814, 0.372549, 0, 1, 1,
0.5968134, 0.0357568, 0.04492895, 0.3803922, 0, 1, 1,
0.5993767, 0.4520134, 1.807633, 0.3843137, 0, 1, 1,
0.6016185, -0.05544025, 1.84988, 0.3921569, 0, 1, 1,
0.6044553, -0.4036582, -0.5434368, 0.3960784, 0, 1, 1,
0.6141019, 0.8843568, 0.9831614, 0.4039216, 0, 1, 1,
0.6142852, -0.3864654, 1.300524, 0.4117647, 0, 1, 1,
0.614806, 1.494859, -0.4968846, 0.4156863, 0, 1, 1,
0.6191046, 0.7551473, 0.9954877, 0.4235294, 0, 1, 1,
0.6221283, 0.121532, 2.686705, 0.427451, 0, 1, 1,
0.6312653, -0.270346, 2.422822, 0.4352941, 0, 1, 1,
0.6316803, 0.9425997, 1.110694, 0.4392157, 0, 1, 1,
0.6317932, 0.9769138, -0.6724864, 0.4470588, 0, 1, 1,
0.6455651, 0.0917076, 1.793661, 0.4509804, 0, 1, 1,
0.6483868, 1.258163, 2.199687, 0.4588235, 0, 1, 1,
0.6492912, -0.3290193, 2.808722, 0.4627451, 0, 1, 1,
0.6498133, -0.4628957, 2.578014, 0.4705882, 0, 1, 1,
0.6517731, -1.097571, 3.449601, 0.4745098, 0, 1, 1,
0.6520771, -2.226871, 2.650116, 0.4823529, 0, 1, 1,
0.6546632, 0.6357136, 1.180026, 0.4862745, 0, 1, 1,
0.6592911, -0.2420622, 2.474088, 0.4941176, 0, 1, 1,
0.6595049, 1.684055, -0.7844077, 0.5019608, 0, 1, 1,
0.6621256, -0.6496359, 2.450302, 0.5058824, 0, 1, 1,
0.6678879, 0.9603292, 0.03305187, 0.5137255, 0, 1, 1,
0.6694312, -0.2764429, 2.476824, 0.5176471, 0, 1, 1,
0.6701307, 2.115589, 0.7648776, 0.5254902, 0, 1, 1,
0.672758, 0.1499914, 1.340218, 0.5294118, 0, 1, 1,
0.67289, 0.8456367, 2.368396, 0.5372549, 0, 1, 1,
0.6743765, 0.9324669, -0.2447811, 0.5411765, 0, 1, 1,
0.6753619, 1.156748, 0.7678292, 0.5490196, 0, 1, 1,
0.6768937, -0.5723071, 0.3896576, 0.5529412, 0, 1, 1,
0.677205, -0.3670278, 0.4540539, 0.5607843, 0, 1, 1,
0.6775162, 0.743743, 1.48736, 0.5647059, 0, 1, 1,
0.6781384, 0.05268624, 0.8966329, 0.572549, 0, 1, 1,
0.6812497, 0.855396, 2.49949, 0.5764706, 0, 1, 1,
0.6826647, 0.5003305, -0.1509086, 0.5843138, 0, 1, 1,
0.6899682, 0.5462107, 0.7466525, 0.5882353, 0, 1, 1,
0.6906517, -0.05700302, 2.023398, 0.5960785, 0, 1, 1,
0.6925136, 0.1466149, 0.04613263, 0.6039216, 0, 1, 1,
0.6976468, -0.7182133, 0.8478686, 0.6078432, 0, 1, 1,
0.6990599, 0.6619782, 1.852882, 0.6156863, 0, 1, 1,
0.6995212, -0.02657454, -0.417583, 0.6196079, 0, 1, 1,
0.7017508, -1.612298, 2.376202, 0.627451, 0, 1, 1,
0.7054684, -1.363071, 2.834158, 0.6313726, 0, 1, 1,
0.7067542, 0.9854658, 0.5799661, 0.6392157, 0, 1, 1,
0.7082919, -0.5158218, 2.219776, 0.6431373, 0, 1, 1,
0.7087134, -1.981364, 1.766342, 0.6509804, 0, 1, 1,
0.7100797, -0.7742584, 1.41448, 0.654902, 0, 1, 1,
0.7116654, 1.211957, 1.834258, 0.6627451, 0, 1, 1,
0.7162724, 0.9385034, 1.198704, 0.6666667, 0, 1, 1,
0.7174038, -0.3900421, 2.285952, 0.6745098, 0, 1, 1,
0.7185937, 0.7178488, 0.8288924, 0.6784314, 0, 1, 1,
0.7196901, 0.507764, 1.237131, 0.6862745, 0, 1, 1,
0.72513, 1.058552, -0.9021359, 0.6901961, 0, 1, 1,
0.7262637, 1.70354, -0.4245022, 0.6980392, 0, 1, 1,
0.7262864, -0.2501889, 3.471322, 0.7058824, 0, 1, 1,
0.7269018, 0.7018151, 1.940516, 0.7098039, 0, 1, 1,
0.7319124, 1.407792, -0.02889551, 0.7176471, 0, 1, 1,
0.7345514, 0.1708487, 2.372347, 0.7215686, 0, 1, 1,
0.7433424, -0.3765291, 0.920841, 0.7294118, 0, 1, 1,
0.7452571, 0.4419449, -0.04450688, 0.7333333, 0, 1, 1,
0.7514557, 0.0438019, 1.924821, 0.7411765, 0, 1, 1,
0.7522966, 0.01558977, 2.945392, 0.7450981, 0, 1, 1,
0.7559019, -1.05053, 1.909259, 0.7529412, 0, 1, 1,
0.7607261, -0.4479252, 1.696673, 0.7568628, 0, 1, 1,
0.762816, -1.065532, 2.620049, 0.7647059, 0, 1, 1,
0.7635396, 0.9225286, -0.02125322, 0.7686275, 0, 1, 1,
0.7647132, -0.6197731, 1.56147, 0.7764706, 0, 1, 1,
0.7652298, -0.6908237, 2.123196, 0.7803922, 0, 1, 1,
0.7738966, -1.720252, 2.159315, 0.7882353, 0, 1, 1,
0.7762865, 0.5579823, 0.5461214, 0.7921569, 0, 1, 1,
0.7783757, 0.7054521, 2.540856, 0.8, 0, 1, 1,
0.7793527, 1.316377, 2.460849, 0.8078431, 0, 1, 1,
0.7820796, 1.697334, 1.120564, 0.8117647, 0, 1, 1,
0.7824431, 0.36179, 2.385163, 0.8196079, 0, 1, 1,
0.7824824, 0.7496656, -1.814311, 0.8235294, 0, 1, 1,
0.7825304, 0.2885378, 0.5906562, 0.8313726, 0, 1, 1,
0.7836662, 0.2628361, -0.4418859, 0.8352941, 0, 1, 1,
0.7905294, -0.1038842, 1.574444, 0.8431373, 0, 1, 1,
0.7911692, 0.2337101, 1.83046, 0.8470588, 0, 1, 1,
0.7991091, -0.3715197, 2.462067, 0.854902, 0, 1, 1,
0.8040146, -0.5754968, 1.395916, 0.8588235, 0, 1, 1,
0.8090882, -0.4798737, 1.349632, 0.8666667, 0, 1, 1,
0.8096343, 0.5528075, 1.221949, 0.8705882, 0, 1, 1,
0.8131576, -1.080745, 0.8956683, 0.8784314, 0, 1, 1,
0.8223485, -1.597893, 1.963752, 0.8823529, 0, 1, 1,
0.8326477, -0.05971187, 0.09325263, 0.8901961, 0, 1, 1,
0.8343887, 1.398458, 1.788842, 0.8941177, 0, 1, 1,
0.8345487, -0.285887, 1.760033, 0.9019608, 0, 1, 1,
0.8377464, -0.8331631, 0.8606822, 0.9098039, 0, 1, 1,
0.8411136, -0.6313919, 2.730719, 0.9137255, 0, 1, 1,
0.844219, -0.8150731, 4.694374, 0.9215686, 0, 1, 1,
0.8449047, 1.063428, 1.335368, 0.9254902, 0, 1, 1,
0.8510756, -0.881278, 4.078685, 0.9333333, 0, 1, 1,
0.8564553, 0.2579637, 2.22421, 0.9372549, 0, 1, 1,
0.8589169, 2.514834, -2.314281, 0.945098, 0, 1, 1,
0.8649791, -1.238132, 1.91755, 0.9490196, 0, 1, 1,
0.867819, 0.3681427, 0.948612, 0.9568627, 0, 1, 1,
0.8716761, -1.171855, 2.338981, 0.9607843, 0, 1, 1,
0.8818508, 2.046715, 0.9176606, 0.9686275, 0, 1, 1,
0.8834317, -0.5972284, 1.910289, 0.972549, 0, 1, 1,
0.8843808, -0.1079837, 1.144878, 0.9803922, 0, 1, 1,
0.8849237, 0.2326419, 0.775312, 0.9843137, 0, 1, 1,
0.8870813, -0.9210111, 4.302777, 0.9921569, 0, 1, 1,
0.8935688, 0.9185017, 0.03254914, 0.9960784, 0, 1, 1,
0.8973981, -0.2046322, 2.45659, 1, 0, 0.9960784, 1,
0.8997703, 1.699827, 0.4324028, 1, 0, 0.9882353, 1,
0.900003, -1.048664, 3.643631, 1, 0, 0.9843137, 1,
0.9005588, -0.102879, 1.670511, 1, 0, 0.9764706, 1,
0.9021125, -2.405295, 2.129304, 1, 0, 0.972549, 1,
0.902204, -2.428808, 3.655523, 1, 0, 0.9647059, 1,
0.9200966, -0.4175318, 4.045475, 1, 0, 0.9607843, 1,
0.9261377, -0.1725924, 0.2185187, 1, 0, 0.9529412, 1,
0.9293612, -1.984617, 2.139634, 1, 0, 0.9490196, 1,
0.9299636, 0.1505603, 0.3682013, 1, 0, 0.9411765, 1,
0.9337453, 0.5189791, -0.01760217, 1, 0, 0.9372549, 1,
0.9360824, -0.0755548, 1.490978, 1, 0, 0.9294118, 1,
0.9367406, -0.465627, 2.097306, 1, 0, 0.9254902, 1,
0.9376057, 1.072293, 0.05461041, 1, 0, 0.9176471, 1,
0.9462051, -1.056988, 2.750748, 1, 0, 0.9137255, 1,
0.9537967, -0.2389887, 2.127218, 1, 0, 0.9058824, 1,
0.9545609, 0.5804668, 1.611876, 1, 0, 0.9019608, 1,
0.9567646, 1.667062, 1.942896, 1, 0, 0.8941177, 1,
0.9606935, 1.276036, -0.8976203, 1, 0, 0.8862745, 1,
0.967764, 0.407609, 2.147945, 1, 0, 0.8823529, 1,
0.9710237, 2.139059, 1.042588, 1, 0, 0.8745098, 1,
0.9779512, -1.027585, 4.098059, 1, 0, 0.8705882, 1,
0.9962763, 0.4805854, -0.4299763, 1, 0, 0.8627451, 1,
0.9966074, -1.211836, 1.259682, 1, 0, 0.8588235, 1,
0.9979871, -1.257818, 1.961611, 1, 0, 0.8509804, 1,
1.002824, 0.4037434, 1.861557, 1, 0, 0.8470588, 1,
1.015814, 0.6206189, 1.006422, 1, 0, 0.8392157, 1,
1.016589, -0.7335612, 2.381843, 1, 0, 0.8352941, 1,
1.021818, 0.1812395, 1.847134, 1, 0, 0.827451, 1,
1.031335, -0.2714045, 2.230013, 1, 0, 0.8235294, 1,
1.032671, 1.049178, 0.9106659, 1, 0, 0.8156863, 1,
1.052518, -1.194846, 2.011627, 1, 0, 0.8117647, 1,
1.056638, -2.28064, 2.233903, 1, 0, 0.8039216, 1,
1.058887, -0.1958205, 2.274049, 1, 0, 0.7960784, 1,
1.060671, -1.216225, 2.111306, 1, 0, 0.7921569, 1,
1.064768, -0.7011532, 1.500204, 1, 0, 0.7843137, 1,
1.071154, -0.1376218, 2.772004, 1, 0, 0.7803922, 1,
1.071159, 0.1170884, 2.728674, 1, 0, 0.772549, 1,
1.073136, 0.2465321, 3.867755, 1, 0, 0.7686275, 1,
1.076103, 0.5154371, 1.479537, 1, 0, 0.7607843, 1,
1.080324, -1.065479, 0.9949948, 1, 0, 0.7568628, 1,
1.080717, 1.512845, 1.891321, 1, 0, 0.7490196, 1,
1.083963, 0.4645999, 0.8834096, 1, 0, 0.7450981, 1,
1.08677, 0.8695653, 0.538, 1, 0, 0.7372549, 1,
1.087154, -0.8370687, 3.016812, 1, 0, 0.7333333, 1,
1.093881, -1.121702, 1.207097, 1, 0, 0.7254902, 1,
1.10796, -1.218135, 1.794095, 1, 0, 0.7215686, 1,
1.116334, 0.7970557, 0.7674764, 1, 0, 0.7137255, 1,
1.11773, 0.3977692, 1.223689, 1, 0, 0.7098039, 1,
1.11944, 0.1461104, 0.4284378, 1, 0, 0.7019608, 1,
1.135051, 0.1003694, 2.213189, 1, 0, 0.6941177, 1,
1.137211, 0.1056092, 2.761529, 1, 0, 0.6901961, 1,
1.160206, -0.6608433, 2.388612, 1, 0, 0.682353, 1,
1.165931, 0.2209512, 1.377516, 1, 0, 0.6784314, 1,
1.184968, -2.143288, 1.819798, 1, 0, 0.6705883, 1,
1.186319, -0.1139651, 3.592153, 1, 0, 0.6666667, 1,
1.195697, 2.171541, 1.693368, 1, 0, 0.6588235, 1,
1.197177, -1.154436, 2.962338, 1, 0, 0.654902, 1,
1.199782, 0.1375089, 0.8984237, 1, 0, 0.6470588, 1,
1.209489, -0.3919969, 1.241874, 1, 0, 0.6431373, 1,
1.213785, 0.8699176, -0.07540934, 1, 0, 0.6352941, 1,
1.219965, -1.659768, 2.106144, 1, 0, 0.6313726, 1,
1.221312, 0.08432049, 2.649695, 1, 0, 0.6235294, 1,
1.223044, -0.8199582, 2.652045, 1, 0, 0.6196079, 1,
1.224552, -0.4416057, 1.950412, 1, 0, 0.6117647, 1,
1.237959, 2.075541, 0.5920075, 1, 0, 0.6078432, 1,
1.243101, 0.5545434, -0.2118827, 1, 0, 0.6, 1,
1.243156, -0.2940635, 1.758668, 1, 0, 0.5921569, 1,
1.244611, 1.073284, 0.4450826, 1, 0, 0.5882353, 1,
1.245076, 1.276253, -0.1539216, 1, 0, 0.5803922, 1,
1.267777, 0.1648029, 2.413239, 1, 0, 0.5764706, 1,
1.292412, -0.5473756, 2.209386, 1, 0, 0.5686275, 1,
1.299508, -0.6718106, 3.119411, 1, 0, 0.5647059, 1,
1.307012, -0.04888889, 2.001778, 1, 0, 0.5568628, 1,
1.309067, 1.450411, 2.59191, 1, 0, 0.5529412, 1,
1.312237, -0.9994064, 0.260602, 1, 0, 0.5450981, 1,
1.316393, 0.7539048, 0.3094022, 1, 0, 0.5411765, 1,
1.324553, 0.6034531, 0.8337577, 1, 0, 0.5333334, 1,
1.33537, -2.510406, 2.340722, 1, 0, 0.5294118, 1,
1.348976, -0.2229994, 2.05604, 1, 0, 0.5215687, 1,
1.349459, -1.66376, 2.471873, 1, 0, 0.5176471, 1,
1.37532, -0.5411205, 0.600589, 1, 0, 0.509804, 1,
1.378477, 0.1308753, 1.582921, 1, 0, 0.5058824, 1,
1.379537, -0.507462, 1.347074, 1, 0, 0.4980392, 1,
1.383251, -0.4233895, 2.424445, 1, 0, 0.4901961, 1,
1.396693, -0.9499274, 1.081462, 1, 0, 0.4862745, 1,
1.398263, -1.798519, 3.702426, 1, 0, 0.4784314, 1,
1.398329, 0.06319889, 1.444642, 1, 0, 0.4745098, 1,
1.437907, 0.9526334, 1.173768, 1, 0, 0.4666667, 1,
1.441638, 0.1655744, 3.026946, 1, 0, 0.4627451, 1,
1.449131, 0.4416236, 0.8610389, 1, 0, 0.454902, 1,
1.450563, 0.803896, 0.5126986, 1, 0, 0.4509804, 1,
1.456636, 0.2740742, 1.530892, 1, 0, 0.4431373, 1,
1.475753, 0.6907368, 1.501065, 1, 0, 0.4392157, 1,
1.477005, 2.625692, 0.09318268, 1, 0, 0.4313726, 1,
1.479437, -0.5156553, 1.497682, 1, 0, 0.427451, 1,
1.486733, -0.662591, 2.759784, 1, 0, 0.4196078, 1,
1.492071, -1.447131, 2.500901, 1, 0, 0.4156863, 1,
1.494159, 0.872487, 1.348385, 1, 0, 0.4078431, 1,
1.495826, 0.4767382, 0.690734, 1, 0, 0.4039216, 1,
1.50337, 0.2069674, 0.817961, 1, 0, 0.3960784, 1,
1.518242, 2.103625, -1.269776, 1, 0, 0.3882353, 1,
1.532447, -0.2278901, 1.197166, 1, 0, 0.3843137, 1,
1.55169, -0.650073, 1.666161, 1, 0, 0.3764706, 1,
1.552448, -0.7156363, 1.395377, 1, 0, 0.372549, 1,
1.554427, -0.5319681, 1.721864, 1, 0, 0.3647059, 1,
1.567912, -0.8031597, 2.675438, 1, 0, 0.3607843, 1,
1.572805, -0.661906, 2.455111, 1, 0, 0.3529412, 1,
1.576967, 1.648697, 1.408056, 1, 0, 0.3490196, 1,
1.583472, -1.292639, 1.76148, 1, 0, 0.3411765, 1,
1.606021, -0.074715, 1.691241, 1, 0, 0.3372549, 1,
1.606764, 0.4461436, 2.651169, 1, 0, 0.3294118, 1,
1.621143, -0.08700586, 0.6480712, 1, 0, 0.3254902, 1,
1.623289, 0.3161299, 2.030956, 1, 0, 0.3176471, 1,
1.623908, -0.3210786, 1.95663, 1, 0, 0.3137255, 1,
1.640433, -1.871304, 3.559296, 1, 0, 0.3058824, 1,
1.642035, -0.07066373, 0.6025187, 1, 0, 0.2980392, 1,
1.642061, 1.150344, -0.02938608, 1, 0, 0.2941177, 1,
1.642115, -0.06924777, 1.605157, 1, 0, 0.2862745, 1,
1.642123, -1.445444, 0.048751, 1, 0, 0.282353, 1,
1.672039, 1.693673, 1.544367, 1, 0, 0.2745098, 1,
1.67356, 0.6015944, 1.103958, 1, 0, 0.2705882, 1,
1.677311, -0.1498215, 0.7829586, 1, 0, 0.2627451, 1,
1.720307, -0.4593651, -0.02222848, 1, 0, 0.2588235, 1,
1.724803, -0.1898983, 1.014442, 1, 0, 0.2509804, 1,
1.73037, 0.235529, 0.9780394, 1, 0, 0.2470588, 1,
1.754453, -0.98619, 1.307815, 1, 0, 0.2392157, 1,
1.782558, -1.663878, 2.891404, 1, 0, 0.2352941, 1,
1.805714, -0.6100991, -0.06293349, 1, 0, 0.227451, 1,
1.822779, 1.160166, -0.7512031, 1, 0, 0.2235294, 1,
1.843585, 0.01993553, 2.733763, 1, 0, 0.2156863, 1,
1.844277, -0.2374447, 2.062057, 1, 0, 0.2117647, 1,
1.865686, -0.984291, 2.865279, 1, 0, 0.2039216, 1,
1.873528, -0.7500789, 2.795204, 1, 0, 0.1960784, 1,
1.894462, -0.6774961, 0.6893046, 1, 0, 0.1921569, 1,
1.913937, -0.1827981, 2.366861, 1, 0, 0.1843137, 1,
1.913983, -0.8287153, 2.914486, 1, 0, 0.1803922, 1,
1.938033, 0.5779314, 2.201567, 1, 0, 0.172549, 1,
1.944762, 0.5862166, 2.135588, 1, 0, 0.1686275, 1,
1.949979, -0.8550436, 0.4928151, 1, 0, 0.1607843, 1,
1.951916, -1.618385, 1.475325, 1, 0, 0.1568628, 1,
1.957035, 1.933052, -0.5622236, 1, 0, 0.1490196, 1,
1.97714, -0.467599, 2.366758, 1, 0, 0.145098, 1,
1.985771, 0.1235863, 2.16744, 1, 0, 0.1372549, 1,
1.9952, -1.284894, 2.165095, 1, 0, 0.1333333, 1,
2.00532, -0.6549191, 1.163519, 1, 0, 0.1254902, 1,
2.007406, 0.3380533, 2.424662, 1, 0, 0.1215686, 1,
2.033975, 2.036822, 1.750022, 1, 0, 0.1137255, 1,
2.05238, -0.4468031, 2.210035, 1, 0, 0.1098039, 1,
2.09454, 0.1147541, 2.417051, 1, 0, 0.1019608, 1,
2.096222, 0.6740311, -0.06866337, 1, 0, 0.09411765, 1,
2.15354, 0.5012028, 1.438912, 1, 0, 0.09019608, 1,
2.184183, -1.591575, 1.289562, 1, 0, 0.08235294, 1,
2.189853, -0.7212358, -0.5061181, 1, 0, 0.07843138, 1,
2.192698, 0.1939166, 0.9066882, 1, 0, 0.07058824, 1,
2.248924, -0.7280495, 1.911308, 1, 0, 0.06666667, 1,
2.341925, -0.5175177, 1.612797, 1, 0, 0.05882353, 1,
2.359094, -0.5439544, 2.075858, 1, 0, 0.05490196, 1,
2.383489, -1.57134, 4.444608, 1, 0, 0.04705882, 1,
2.435844, -0.04332352, 0.9713061, 1, 0, 0.04313726, 1,
2.467747, -1.359032, 1.303399, 1, 0, 0.03529412, 1,
2.509732, -0.5362568, 2.313804, 1, 0, 0.03137255, 1,
2.519962, -0.5372976, 1.343304, 1, 0, 0.02352941, 1,
2.588917, -0.4644205, 3.200405, 1, 0, 0.01960784, 1,
2.848799, 0.1948614, 2.932911, 1, 0, 0.01176471, 1,
4.020007, 0.2243136, 1.380305, 1, 0, 0.007843138, 1
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
0.5335397, -5.435453, -6.405992, 0, -0.5, 0.5, 0.5,
0.5335397, -5.435453, -6.405992, 1, -0.5, 0.5, 0.5,
0.5335397, -5.435453, -6.405992, 1, 1.5, 0.5, 0.5,
0.5335397, -5.435453, -6.405992, 0, 1.5, 0.5, 0.5
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
-4.13484, -0.7383002, -6.405992, 0, -0.5, 0.5, 0.5,
-4.13484, -0.7383002, -6.405992, 1, -0.5, 0.5, 0.5,
-4.13484, -0.7383002, -6.405992, 1, 1.5, 0.5, 0.5,
-4.13484, -0.7383002, -6.405992, 0, 1.5, 0.5, 0.5
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
-4.13484, -5.435453, 0.519707, 0, -0.5, 0.5, 0.5,
-4.13484, -5.435453, 0.519707, 1, -0.5, 0.5, 0.5,
-4.13484, -5.435453, 0.519707, 1, 1.5, 0.5, 0.5,
-4.13484, -5.435453, 0.519707, 0, 1.5, 0.5, 0.5
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
-2, -4.351495, -4.807753,
4, -4.351495, -4.807753,
-2, -4.351495, -4.807753,
-2, -4.532155, -5.074126,
-1, -4.351495, -4.807753,
-1, -4.532155, -5.074126,
0, -4.351495, -4.807753,
0, -4.532155, -5.074126,
1, -4.351495, -4.807753,
1, -4.532155, -5.074126,
2, -4.351495, -4.807753,
2, -4.532155, -5.074126,
3, -4.351495, -4.807753,
3, -4.532155, -5.074126,
4, -4.351495, -4.807753,
4, -4.532155, -5.074126
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
"3",
"4"
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
-2, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
-2, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
-2, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
-2, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
-1, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
-1, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
-1, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
-1, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
0, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
0, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
0, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
0, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
1, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
1, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
1, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
1, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
2, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
2, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
2, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
2, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
3, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
3, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
3, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
3, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5,
4, -4.893474, -5.606873, 0, -0.5, 0.5, 0.5,
4, -4.893474, -5.606873, 1, -0.5, 0.5, 0.5,
4, -4.893474, -5.606873, 1, 1.5, 0.5, 0.5,
4, -4.893474, -5.606873, 0, 1.5, 0.5, 0.5
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
-3.057522, -4, -4.807753,
-3.057522, 2, -4.807753,
-3.057522, -4, -4.807753,
-3.237075, -4, -5.074126,
-3.057522, -2, -4.807753,
-3.237075, -2, -5.074126,
-3.057522, 0, -4.807753,
-3.237075, 0, -5.074126,
-3.057522, 2, -4.807753,
-3.237075, 2, -5.074126
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
"-4",
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
-3.596181, -4, -5.606873, 0, -0.5, 0.5, 0.5,
-3.596181, -4, -5.606873, 1, -0.5, 0.5, 0.5,
-3.596181, -4, -5.606873, 1, 1.5, 0.5, 0.5,
-3.596181, -4, -5.606873, 0, 1.5, 0.5, 0.5,
-3.596181, -2, -5.606873, 0, -0.5, 0.5, 0.5,
-3.596181, -2, -5.606873, 1, -0.5, 0.5, 0.5,
-3.596181, -2, -5.606873, 1, 1.5, 0.5, 0.5,
-3.596181, -2, -5.606873, 0, 1.5, 0.5, 0.5,
-3.596181, 0, -5.606873, 0, -0.5, 0.5, 0.5,
-3.596181, 0, -5.606873, 1, -0.5, 0.5, 0.5,
-3.596181, 0, -5.606873, 1, 1.5, 0.5, 0.5,
-3.596181, 0, -5.606873, 0, 1.5, 0.5, 0.5,
-3.596181, 2, -5.606873, 0, -0.5, 0.5, 0.5,
-3.596181, 2, -5.606873, 1, -0.5, 0.5, 0.5,
-3.596181, 2, -5.606873, 1, 1.5, 0.5, 0.5,
-3.596181, 2, -5.606873, 0, 1.5, 0.5, 0.5
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
-3.057522, -4.351495, -4,
-3.057522, -4.351495, 4,
-3.057522, -4.351495, -4,
-3.237075, -4.532155, -4,
-3.057522, -4.351495, -2,
-3.237075, -4.532155, -2,
-3.057522, -4.351495, 0,
-3.237075, -4.532155, 0,
-3.057522, -4.351495, 2,
-3.237075, -4.532155, 2,
-3.057522, -4.351495, 4,
-3.237075, -4.532155, 4
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
-3.596181, -4.893474, -4, 0, -0.5, 0.5, 0.5,
-3.596181, -4.893474, -4, 1, -0.5, 0.5, 0.5,
-3.596181, -4.893474, -4, 1, 1.5, 0.5, 0.5,
-3.596181, -4.893474, -4, 0, 1.5, 0.5, 0.5,
-3.596181, -4.893474, -2, 0, -0.5, 0.5, 0.5,
-3.596181, -4.893474, -2, 1, -0.5, 0.5, 0.5,
-3.596181, -4.893474, -2, 1, 1.5, 0.5, 0.5,
-3.596181, -4.893474, -2, 0, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 0, 0, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 0, 1, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 0, 1, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 0, 0, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 2, 0, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 2, 1, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 2, 1, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 2, 0, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 4, 0, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 4, 1, -0.5, 0.5, 0.5,
-3.596181, -4.893474, 4, 1, 1.5, 0.5, 0.5,
-3.596181, -4.893474, 4, 0, 1.5, 0.5, 0.5
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
-3.057522, -4.351495, -4.807753,
-3.057522, 2.874895, -4.807753,
-3.057522, -4.351495, 5.847167,
-3.057522, 2.874895, 5.847167,
-3.057522, -4.351495, -4.807753,
-3.057522, -4.351495, 5.847167,
-3.057522, 2.874895, -4.807753,
-3.057522, 2.874895, 5.847167,
-3.057522, -4.351495, -4.807753,
4.124601, -4.351495, -4.807753,
-3.057522, -4.351495, 5.847167,
4.124601, -4.351495, 5.847167,
-3.057522, 2.874895, -4.807753,
4.124601, 2.874895, -4.807753,
-3.057522, 2.874895, 5.847167,
4.124601, 2.874895, 5.847167,
4.124601, -4.351495, -4.807753,
4.124601, 2.874895, -4.807753,
4.124601, -4.351495, 5.847167,
4.124601, 2.874895, 5.847167,
4.124601, -4.351495, -4.807753,
4.124601, -4.351495, 5.847167,
4.124601, 2.874895, -4.807753,
4.124601, 2.874895, 5.847167
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
var radius = 7.872021;
var distance = 35.02351;
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
mvMatrix.translate( -0.5335397, 0.7383002, -0.519707 );
mvMatrix.scale( 1.185079, 1.17782, 0.7988218 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.02351);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Clothianidin<-read.table("Clothianidin.xyz", skip=1)
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
-2.952928, 2.123354, -0.6813123, 0, 0, 1, 1, 1,
-2.85351, 0.08382478, -1.123186, 1, 0, 0, 1, 1,
-2.828376, 1.289321, -2.256589, 1, 0, 0, 1, 1,
-2.756137, 0.360077, -1.034608, 1, 0, 0, 1, 1,
-2.753127, -0.6908017, -2.474545, 1, 0, 0, 1, 1,
-2.673783, -0.7519477, -2.467071, 1, 0, 0, 1, 1,
-2.602443, -0.1579172, -1.376574, 0, 0, 0, 1, 1,
-2.540652, 0.3108043, -1.110627, 0, 0, 0, 1, 1,
-2.524771, 1.038237, -1.877733, 0, 0, 0, 1, 1,
-2.467885, 1.042532, -0.3994235, 0, 0, 0, 1, 1,
-2.374808, -0.5730596, -1.574506, 0, 0, 0, 1, 1,
-2.351657, 0.647774, -1.41424, 0, 0, 0, 1, 1,
-2.350134, 0.8400726, -1.177302, 0, 0, 0, 1, 1,
-2.346623, 1.359521, -3.107204, 1, 1, 1, 1, 1,
-2.330932, -1.585073, -3.492247, 1, 1, 1, 1, 1,
-2.28763, -4.246256, -3.102367, 1, 1, 1, 1, 1,
-2.251078, 0.8437157, -1.419157, 1, 1, 1, 1, 1,
-2.185953, 0.5561084, -1.310021, 1, 1, 1, 1, 1,
-2.185342, 1.162051, -2.347361, 1, 1, 1, 1, 1,
-2.182857, 0.9040766, 0.943172, 1, 1, 1, 1, 1,
-2.155434, 1.288092, -1.553149, 1, 1, 1, 1, 1,
-2.11314, -0.3614096, -1.875833, 1, 1, 1, 1, 1,
-2.093524, -1.098845, -0.6551898, 1, 1, 1, 1, 1,
-2.089803, 0.7048241, -1.844931, 1, 1, 1, 1, 1,
-2.064253, 0.1122667, -1.212916, 1, 1, 1, 1, 1,
-2.051035, 0.02998479, -1.074055, 1, 1, 1, 1, 1,
-2.040728, 0.4063785, -2.041142, 1, 1, 1, 1, 1,
-2.03859, -1.634913, -2.000308, 1, 1, 1, 1, 1,
-2.026872, -0.9444903, -0.4447642, 0, 0, 1, 1, 1,
-1.99544, -0.852107, -1.472457, 1, 0, 0, 1, 1,
-1.989894, 1.42441, 0.8412502, 1, 0, 0, 1, 1,
-1.97032, 0.1341799, -1.345431, 1, 0, 0, 1, 1,
-1.955899, -0.9489731, -0.6107396, 1, 0, 0, 1, 1,
-1.939186, -0.2962271, -0.8946752, 1, 0, 0, 1, 1,
-1.934807, -0.3041827, -1.704711, 0, 0, 0, 1, 1,
-1.934145, 0.6222504, -2.152018, 0, 0, 0, 1, 1,
-1.916923, 0.01213103, -0.2794387, 0, 0, 0, 1, 1,
-1.905585, -1.343308, -4.304467, 0, 0, 0, 1, 1,
-1.905293, 0.9887596, -0.1778932, 0, 0, 0, 1, 1,
-1.879516, 0.4474301, -1.386534, 0, 0, 0, 1, 1,
-1.853101, 0.3844845, -0.8880094, 0, 0, 0, 1, 1,
-1.850785, 0.5355583, -1.520708, 1, 1, 1, 1, 1,
-1.840726, -0.81429, -1.859259, 1, 1, 1, 1, 1,
-1.830753, 0.5482404, 0.002721427, 1, 1, 1, 1, 1,
-1.816562, 0.3564035, 0.7963684, 1, 1, 1, 1, 1,
-1.807133, -0.4920538, -1.387194, 1, 1, 1, 1, 1,
-1.796829, -0.7387688, -1.840776, 1, 1, 1, 1, 1,
-1.776717, -0.3421491, -2.667847, 1, 1, 1, 1, 1,
-1.766949, -0.7255381, -1.455387, 1, 1, 1, 1, 1,
-1.752262, -0.6057319, -3.224614, 1, 1, 1, 1, 1,
-1.752204, -1.024334, -2.706729, 1, 1, 1, 1, 1,
-1.720878, 0.7307888, -1.693741, 1, 1, 1, 1, 1,
-1.707045, -1.176432, -0.6732251, 1, 1, 1, 1, 1,
-1.703547, 0.656352, -2.308147, 1, 1, 1, 1, 1,
-1.69255, -0.9696931, -3.466075, 1, 1, 1, 1, 1,
-1.686726, -0.6235744, -0.6464367, 1, 1, 1, 1, 1,
-1.677516, 0.3559589, -1.697789, 0, 0, 1, 1, 1,
-1.666584, -0.354629, -1.277805, 1, 0, 0, 1, 1,
-1.640524, -0.9290439, -1.206034, 1, 0, 0, 1, 1,
-1.639834, -2.371255, -2.170988, 1, 0, 0, 1, 1,
-1.627208, -0.2879746, -2.755705, 1, 0, 0, 1, 1,
-1.624721, -0.8157345, 0.4548897, 1, 0, 0, 1, 1,
-1.616163, 0.294462, -2.691214, 0, 0, 0, 1, 1,
-1.606518, 1.708587, -1.062381, 0, 0, 0, 1, 1,
-1.604157, 0.8911774, -2.59923, 0, 0, 0, 1, 1,
-1.59523, -0.3853922, -0.2596261, 0, 0, 0, 1, 1,
-1.58546, -0.5993955, -2.741564, 0, 0, 0, 1, 1,
-1.584561, -0.7023316, -1.400126, 0, 0, 0, 1, 1,
-1.578092, 0.4776911, 0.3520131, 0, 0, 0, 1, 1,
-1.558376, 0.5488475, 0.01777475, 1, 1, 1, 1, 1,
-1.557714, -0.4818442, -1.841274, 1, 1, 1, 1, 1,
-1.556322, -0.4948118, -3.137037, 1, 1, 1, 1, 1,
-1.536551, -0.0501694, -2.130606, 1, 1, 1, 1, 1,
-1.530923, -1.032577, -2.925082, 1, 1, 1, 1, 1,
-1.525896, -0.1754398, -1.415673, 1, 1, 1, 1, 1,
-1.521894, 0.3506727, -1.832487, 1, 1, 1, 1, 1,
-1.459664, 0.842033, -0.9071543, 1, 1, 1, 1, 1,
-1.458849, -1.607652, -2.80658, 1, 1, 1, 1, 1,
-1.45593, 0.4136563, -2.115842, 1, 1, 1, 1, 1,
-1.452533, 1.105655, -0.04895157, 1, 1, 1, 1, 1,
-1.446111, -0.948509, -0.8243709, 1, 1, 1, 1, 1,
-1.435843, 2.095008, -0.1748713, 1, 1, 1, 1, 1,
-1.430596, 1.635476, -1.39019, 1, 1, 1, 1, 1,
-1.425725, 0.4645557, 1.064402, 1, 1, 1, 1, 1,
-1.425723, 0.399644, -2.527574, 0, 0, 1, 1, 1,
-1.422539, -0.7219529, -0.9283373, 1, 0, 0, 1, 1,
-1.4152, -1.427283, -2.567241, 1, 0, 0, 1, 1,
-1.400854, 0.845903, 0.019576, 1, 0, 0, 1, 1,
-1.397525, -0.7778146, -1.623441, 1, 0, 0, 1, 1,
-1.393877, -0.09070187, -0.6344016, 1, 0, 0, 1, 1,
-1.391668, 1.627517, 0.2404585, 0, 0, 0, 1, 1,
-1.381274, -0.6346425, -1.907469, 0, 0, 0, 1, 1,
-1.376676, -1.693825, -1.943404, 0, 0, 0, 1, 1,
-1.369016, 1.578009, -1.076459, 0, 0, 0, 1, 1,
-1.361139, 0.4563869, -0.3929215, 0, 0, 0, 1, 1,
-1.342752, 0.2525581, -2.529632, 0, 0, 0, 1, 1,
-1.332556, -0.2173224, -1.721029, 0, 0, 0, 1, 1,
-1.329193, 0.555207, -1.4147, 1, 1, 1, 1, 1,
-1.323402, 0.6979499, -1.008583, 1, 1, 1, 1, 1,
-1.320092, -0.1245654, -1.649015, 1, 1, 1, 1, 1,
-1.311386, 1.518439, -2.224389, 1, 1, 1, 1, 1,
-1.307576, -0.04640184, -1.558895, 1, 1, 1, 1, 1,
-1.305931, -0.875114, -1.417789, 1, 1, 1, 1, 1,
-1.301371, -0.9952798, -2.337811, 1, 1, 1, 1, 1,
-1.287006, 0.2518145, -0.6015075, 1, 1, 1, 1, 1,
-1.285746, 0.2057845, -1.556988, 1, 1, 1, 1, 1,
-1.281817, -0.4855797, -1.350937, 1, 1, 1, 1, 1,
-1.277389, 1.121379, -1.204554, 1, 1, 1, 1, 1,
-1.274927, 1.168509, -1.198849, 1, 1, 1, 1, 1,
-1.257463, -0.04683162, -0.9235084, 1, 1, 1, 1, 1,
-1.236423, -1.378852, -3.565748, 1, 1, 1, 1, 1,
-1.234096, 0.8155791, -2.040194, 1, 1, 1, 1, 1,
-1.228317, -0.2924582, -1.598157, 0, 0, 1, 1, 1,
-1.219956, -0.6740557, -2.243257, 1, 0, 0, 1, 1,
-1.219845, -0.7580809, -1.517812, 1, 0, 0, 1, 1,
-1.213916, -0.620787, -1.55812, 1, 0, 0, 1, 1,
-1.207868, -1.614132, -4.240958, 1, 0, 0, 1, 1,
-1.204299, -0.640732, -2.731424, 1, 0, 0, 1, 1,
-1.191279, -2.018006, -4.420977, 0, 0, 0, 1, 1,
-1.191227, -0.5471196, -1.019993, 0, 0, 0, 1, 1,
-1.190303, 1.9158, -2.976811, 0, 0, 0, 1, 1,
-1.178709, -0.6797423, -2.621146, 0, 0, 0, 1, 1,
-1.177119, -1.399909, -2.810864, 0, 0, 0, 1, 1,
-1.175808, -1.709673, -3.113688, 0, 0, 0, 1, 1,
-1.167272, -1.099105, -1.740035, 0, 0, 0, 1, 1,
-1.160836, 0.6155455, -1.022398, 1, 1, 1, 1, 1,
-1.158198, -0.5642682, -2.029242, 1, 1, 1, 1, 1,
-1.157035, 0.3444585, -1.4312, 1, 1, 1, 1, 1,
-1.148179, 0.8166611, 0.3294179, 1, 1, 1, 1, 1,
-1.144439, -0.2813588, -2.612049, 1, 1, 1, 1, 1,
-1.139114, 0.47907, -1.353128, 1, 1, 1, 1, 1,
-1.120319, -0.04184293, -1.671848, 1, 1, 1, 1, 1,
-1.111555, -0.6018802, -0.9181296, 1, 1, 1, 1, 1,
-1.110027, -1.171744, -2.587113, 1, 1, 1, 1, 1,
-1.102952, -0.3590733, -2.707261, 1, 1, 1, 1, 1,
-1.083914, 0.9168972, -0.4288127, 1, 1, 1, 1, 1,
-1.078923, 0.8923159, -0.5809062, 1, 1, 1, 1, 1,
-1.077059, -1.161391, -1.97643, 1, 1, 1, 1, 1,
-1.076606, 0.7599611, -0.794465, 1, 1, 1, 1, 1,
-1.075678, -1.208243, -3.162521, 1, 1, 1, 1, 1,
-1.071857, -0.2474843, -3.638748, 0, 0, 1, 1, 1,
-1.066225, -0.9855725, -1.94683, 1, 0, 0, 1, 1,
-1.064688, 0.5337602, -2.429493, 1, 0, 0, 1, 1,
-1.055369, 0.5320361, -0.6951752, 1, 0, 0, 1, 1,
-1.050343, 0.2562184, -2.306021, 1, 0, 0, 1, 1,
-1.045019, 0.3423193, -1.553051, 1, 0, 0, 1, 1,
-1.044995, -1.567981, -1.428398, 0, 0, 0, 1, 1,
-1.044494, 0.1716327, -1.044247, 0, 0, 0, 1, 1,
-1.037167, 0.3494624, -0.7166972, 0, 0, 0, 1, 1,
-1.036956, 1.318794, 0.3137842, 0, 0, 0, 1, 1,
-1.032735, 1.439278, -1.683482, 0, 0, 0, 1, 1,
-1.029095, 0.1478322, -1.087663, 0, 0, 0, 1, 1,
-1.023231, -0.6989794, -3.396469, 0, 0, 0, 1, 1,
-1.020989, -0.4800453, -1.876252, 1, 1, 1, 1, 1,
-1.020695, 0.6914214, -0.473928, 1, 1, 1, 1, 1,
-1.017164, 1.248762, -0.3314035, 1, 1, 1, 1, 1,
-1.015162, 0.3711028, -1.105057, 1, 1, 1, 1, 1,
-1.011548, -0.9428061, -3.120739, 1, 1, 1, 1, 1,
-1.010579, -2.428995, -3.790957, 1, 1, 1, 1, 1,
-1.010506, 0.2272664, -2.316848, 1, 1, 1, 1, 1,
-1.005568, 0.6941746, -2.881907, 1, 1, 1, 1, 1,
-1.004294, -0.4683009, -2.381046, 1, 1, 1, 1, 1,
-0.9880511, 1.046971, -2.419956, 1, 1, 1, 1, 1,
-0.9875198, 0.7776221, -0.1331637, 1, 1, 1, 1, 1,
-0.9830091, 0.4737244, -3.628766, 1, 1, 1, 1, 1,
-0.9801198, -0.3808047, -0.6495333, 1, 1, 1, 1, 1,
-0.9721268, 0.3623253, -3.577719, 1, 1, 1, 1, 1,
-0.9697153, -0.05382611, 0.2038559, 1, 1, 1, 1, 1,
-0.9678622, -0.7362884, -0.2595099, 0, 0, 1, 1, 1,
-0.9669167, 0.1951786, -1.069462, 1, 0, 0, 1, 1,
-0.9650452, 0.2155964, -2.618092, 1, 0, 0, 1, 1,
-0.9643291, 0.5686946, -1.78865, 1, 0, 0, 1, 1,
-0.9622111, -0.4989508, -1.10553, 1, 0, 0, 1, 1,
-0.9490185, 1.134617, -1.640252, 1, 0, 0, 1, 1,
-0.9484046, -0.04337506, -3.327231, 0, 0, 0, 1, 1,
-0.9454954, -1.281585, -3.432461, 0, 0, 0, 1, 1,
-0.9387751, 1.179501, -1.076876, 0, 0, 0, 1, 1,
-0.9366852, 0.427415, -2.150689, 0, 0, 0, 1, 1,
-0.9334924, -0.1959331, 0.3889035, 0, 0, 0, 1, 1,
-0.9328092, -0.8623013, -0.05987571, 0, 0, 0, 1, 1,
-0.9321471, -0.3549774, -1.009317, 0, 0, 0, 1, 1,
-0.931233, -0.8312019, -3.978073, 1, 1, 1, 1, 1,
-0.929426, 0.3622777, -2.669486, 1, 1, 1, 1, 1,
-0.9251208, 0.07830304, -1.495371, 1, 1, 1, 1, 1,
-0.9243631, 1.902486, -1.542281, 1, 1, 1, 1, 1,
-0.9219093, 0.8187699, -0.3632535, 1, 1, 1, 1, 1,
-0.91712, 1.616296, 0.251602, 1, 1, 1, 1, 1,
-0.9142272, 0.3237993, -1.892585, 1, 1, 1, 1, 1,
-0.9126239, 0.4868161, -2.881991, 1, 1, 1, 1, 1,
-0.9048101, 1.347264, -0.7521269, 1, 1, 1, 1, 1,
-0.9042954, -0.2405791, -1.587499, 1, 1, 1, 1, 1,
-0.8952326, -1.027608, -3.625719, 1, 1, 1, 1, 1,
-0.8923552, 0.1788168, -1.146858, 1, 1, 1, 1, 1,
-0.8788078, 2.273225, -1.83948, 1, 1, 1, 1, 1,
-0.8753322, 0.7921335, -0.4032156, 1, 1, 1, 1, 1,
-0.8745568, -0.05352438, -1.82322, 1, 1, 1, 1, 1,
-0.8708109, 1.081522, -0.8904312, 0, 0, 1, 1, 1,
-0.8593521, -2.18197, -4.062263, 1, 0, 0, 1, 1,
-0.8567065, -0.5075704, -0.08132745, 1, 0, 0, 1, 1,
-0.8544618, -1.6764, -3.610215, 1, 0, 0, 1, 1,
-0.8484725, -0.9504736, -3.332674, 1, 0, 0, 1, 1,
-0.8434008, -0.9804973, -2.95802, 1, 0, 0, 1, 1,
-0.8424086, -1.591926, -1.059847, 0, 0, 0, 1, 1,
-0.8417495, -0.09649512, -0.1442584, 0, 0, 0, 1, 1,
-0.8330668, 0.8858243, -0.09570087, 0, 0, 0, 1, 1,
-0.8317939, -0.9165993, -1.307562, 0, 0, 0, 1, 1,
-0.8304605, -0.004915106, -2.763808, 0, 0, 0, 1, 1,
-0.8263904, -0.2683451, -0.3753581, 0, 0, 0, 1, 1,
-0.8262596, -0.4598626, -3.315268, 0, 0, 0, 1, 1,
-0.8235026, -0.1411487, -2.624048, 1, 1, 1, 1, 1,
-0.8176775, 0.934591, -0.2992158, 1, 1, 1, 1, 1,
-0.8161648, -1.377573, -2.312249, 1, 1, 1, 1, 1,
-0.8107623, 1.801793, -2.009846, 1, 1, 1, 1, 1,
-0.8042596, 1.190625, -1.043152, 1, 1, 1, 1, 1,
-0.7983821, 0.3369009, -1.852073, 1, 1, 1, 1, 1,
-0.7940632, 1.268365, 1.150024, 1, 1, 1, 1, 1,
-0.7903776, 0.01561423, 0.1781432, 1, 1, 1, 1, 1,
-0.7813943, -0.7547113, -0.1134171, 1, 1, 1, 1, 1,
-0.7811197, -0.4617636, -0.6957752, 1, 1, 1, 1, 1,
-0.7787576, 0.9930468, -0.7046772, 1, 1, 1, 1, 1,
-0.7787225, 1.346063, -0.6561992, 1, 1, 1, 1, 1,
-0.7712246, -0.4959532, -1.45429, 1, 1, 1, 1, 1,
-0.7645277, -0.5167895, -0.5848614, 1, 1, 1, 1, 1,
-0.7621199, -0.8336924, -2.742115, 1, 1, 1, 1, 1,
-0.7522634, -1.43702, -2.101691, 0, 0, 1, 1, 1,
-0.751698, 1.447498, 1.085114, 1, 0, 0, 1, 1,
-0.7491125, 1.610671, -2.527508, 1, 0, 0, 1, 1,
-0.7456251, 1.039078, 0.7743865, 1, 0, 0, 1, 1,
-0.7425444, -0.7381276, -2.671396, 1, 0, 0, 1, 1,
-0.7414057, -0.3275225, -2.82463, 1, 0, 0, 1, 1,
-0.7398116, 0.8207053, -0.3604329, 0, 0, 0, 1, 1,
-0.7362933, 0.01519684, -1.694757, 0, 0, 0, 1, 1,
-0.7329979, -0.448238, -1.17412, 0, 0, 0, 1, 1,
-0.7300328, -2.231631, -4.158904, 0, 0, 0, 1, 1,
-0.7207271, -0.9768319, -3.018741, 0, 0, 0, 1, 1,
-0.7164573, 2.084633, -0.4495651, 0, 0, 0, 1, 1,
-0.709287, -1.428162, -3.325276, 0, 0, 0, 1, 1,
-0.7042446, -0.574354, -3.539994, 1, 1, 1, 1, 1,
-0.7036656, 0.4832532, 1.5198, 1, 1, 1, 1, 1,
-0.7032889, -1.493622, -1.979594, 1, 1, 1, 1, 1,
-0.7024061, 1.714283, 1.780309, 1, 1, 1, 1, 1,
-0.7021322, 1.384406, 0.2939737, 1, 1, 1, 1, 1,
-0.6976466, -2.059379, -3.693789, 1, 1, 1, 1, 1,
-0.6935582, 0.3711027, -2.201377, 1, 1, 1, 1, 1,
-0.6933627, 0.942921, -0.9779335, 1, 1, 1, 1, 1,
-0.6927754, -0.01592899, -2.178041, 1, 1, 1, 1, 1,
-0.6872974, -1.396769, -2.995564, 1, 1, 1, 1, 1,
-0.6866976, 2.380445, -0.143059, 1, 1, 1, 1, 1,
-0.6849713, 0.02295149, -1.560817, 1, 1, 1, 1, 1,
-0.6846131, 0.5178289, 0.9966254, 1, 1, 1, 1, 1,
-0.6825998, -2.20852, -3.509965, 1, 1, 1, 1, 1,
-0.6795183, -0.8277805, -2.080105, 1, 1, 1, 1, 1,
-0.6788825, -1.713502, -2.534149, 0, 0, 1, 1, 1,
-0.6773084, -2.150521, -3.901249, 1, 0, 0, 1, 1,
-0.6745064, -0.7355585, -2.846354, 1, 0, 0, 1, 1,
-0.6726751, -1.774972, -2.87418, 1, 0, 0, 1, 1,
-0.6720384, -0.007940901, -2.079874, 1, 0, 0, 1, 1,
-0.6688004, 1.99349, -0.7490231, 1, 0, 0, 1, 1,
-0.665965, 0.1969522, -1.247643, 0, 0, 0, 1, 1,
-0.6649496, -0.5791391, -0.425752, 0, 0, 0, 1, 1,
-0.661253, 2.160735, -0.8956379, 0, 0, 0, 1, 1,
-0.6599209, -0.08545154, -1.10974, 0, 0, 0, 1, 1,
-0.6585609, 2.526666, -0.7538221, 0, 0, 0, 1, 1,
-0.6542629, -0.2274329, -0.4749779, 0, 0, 0, 1, 1,
-0.6519309, -0.0078658, -1.805158, 0, 0, 0, 1, 1,
-0.6501592, -0.194296, -1.12454, 1, 1, 1, 1, 1,
-0.6492135, -0.155473, -2.785349, 1, 1, 1, 1, 1,
-0.6443071, 0.4823812, -1.595871, 1, 1, 1, 1, 1,
-0.6349527, 0.9919362, -0.7013437, 1, 1, 1, 1, 1,
-0.6312875, -1.408156, -2.554266, 1, 1, 1, 1, 1,
-0.6306223, -0.2465569, -2.210245, 1, 1, 1, 1, 1,
-0.6265742, -0.1322401, -2.945017, 1, 1, 1, 1, 1,
-0.6203476, 2.060307, 0.7907521, 1, 1, 1, 1, 1,
-0.6166516, -1.462539, -3.419762, 1, 1, 1, 1, 1,
-0.6068091, 1.461915, -0.7322171, 1, 1, 1, 1, 1,
-0.6058143, -0.3091443, -2.66276, 1, 1, 1, 1, 1,
-0.6057315, -1.6222, -3.215684, 1, 1, 1, 1, 1,
-0.6048511, 0.5139958, -0.5928829, 1, 1, 1, 1, 1,
-0.6037457, 0.05750154, -0.4237913, 1, 1, 1, 1, 1,
-0.602958, 1.95686, -0.1241444, 1, 1, 1, 1, 1,
-0.5983627, -1.54395, -1.416712, 0, 0, 1, 1, 1,
-0.5980949, 1.364873, -1.563239, 1, 0, 0, 1, 1,
-0.5953519, 1.344739, -0.1579324, 1, 0, 0, 1, 1,
-0.5934125, 0.7925662, -0.1483227, 1, 0, 0, 1, 1,
-0.5920898, -0.5322685, -2.752125, 1, 0, 0, 1, 1,
-0.5797714, 0.5448599, -2.408122, 1, 0, 0, 1, 1,
-0.5774122, 0.9775118, -2.548094, 0, 0, 0, 1, 1,
-0.5761705, -0.5893762, -1.669692, 0, 0, 0, 1, 1,
-0.5761118, -0.5536838, -2.470171, 0, 0, 0, 1, 1,
-0.5734809, -1.358776, -1.191103, 0, 0, 0, 1, 1,
-0.5717698, -0.2429914, -3.177946, 0, 0, 0, 1, 1,
-0.570515, 0.2601333, -2.111488, 0, 0, 0, 1, 1,
-0.5692046, 0.6379568, -2.149648, 0, 0, 0, 1, 1,
-0.5633571, -1.274072, -3.10843, 1, 1, 1, 1, 1,
-0.5593516, 0.2038601, -1.368152, 1, 1, 1, 1, 1,
-0.5582059, 0.661231, -2.786175, 1, 1, 1, 1, 1,
-0.5577098, -0.1238223, -3.008862, 1, 1, 1, 1, 1,
-0.5574982, -1.041858, -2.757902, 1, 1, 1, 1, 1,
-0.5494552, -0.1680562, -2.755584, 1, 1, 1, 1, 1,
-0.5399872, 0.546231, -1.221454, 1, 1, 1, 1, 1,
-0.5396028, 0.5061997, 0.8678629, 1, 1, 1, 1, 1,
-0.5393974, -1.340378, -4.550792, 1, 1, 1, 1, 1,
-0.5381748, -0.7936308, -2.892732, 1, 1, 1, 1, 1,
-0.5352755, -1.006425, -0.7622572, 1, 1, 1, 1, 1,
-0.5325283, 0.002610764, -2.1096, 1, 1, 1, 1, 1,
-0.5311109, 1.030217, -1.375821, 1, 1, 1, 1, 1,
-0.5262218, 0.1840474, -0.6523675, 1, 1, 1, 1, 1,
-0.5255932, 0.3284307, 0.1477928, 1, 1, 1, 1, 1,
-0.5156159, 0.08748565, -2.90108, 0, 0, 1, 1, 1,
-0.5135092, -0.1872453, -2.848782, 1, 0, 0, 1, 1,
-0.5108588, -0.9022499, -3.563827, 1, 0, 0, 1, 1,
-0.5079675, 1.299976, 0.3507897, 1, 0, 0, 1, 1,
-0.5055277, -1.260004, -3.451904, 1, 0, 0, 1, 1,
-0.4939452, -0.03970823, -1.88666, 1, 0, 0, 1, 1,
-0.4897126, -2.723317, -3.972531, 0, 0, 0, 1, 1,
-0.4833195, 0.61678, -1.20455, 0, 0, 0, 1, 1,
-0.4823771, 0.5884637, -0.6481056, 0, 0, 0, 1, 1,
-0.4820307, -0.7004944, -0.2917652, 0, 0, 0, 1, 1,
-0.4790698, -0.3918239, -2.411009, 0, 0, 0, 1, 1,
-0.4772147, 1.329286, -0.2019681, 0, 0, 0, 1, 1,
-0.4758105, -0.1469002, -2.028235, 0, 0, 0, 1, 1,
-0.4753668, -0.8284709, -3.519493, 1, 1, 1, 1, 1,
-0.4717507, 1.391574, -0.2174411, 1, 1, 1, 1, 1,
-0.4703216, -0.3326989, -2.182467, 1, 1, 1, 1, 1,
-0.4697501, 1.030026, 0.1286442, 1, 1, 1, 1, 1,
-0.4683224, 1.861353, 0.2078995, 1, 1, 1, 1, 1,
-0.467597, 0.5003785, 0.6286783, 1, 1, 1, 1, 1,
-0.464304, 1.019693, -1.060201, 1, 1, 1, 1, 1,
-0.4578796, 0.1599887, -0.8430053, 1, 1, 1, 1, 1,
-0.4578194, -0.5817011, -3.686629, 1, 1, 1, 1, 1,
-0.4564005, -0.482065, -2.899002, 1, 1, 1, 1, 1,
-0.455344, -1.411098, -1.306013, 1, 1, 1, 1, 1,
-0.4544253, 0.329017, 0.01413522, 1, 1, 1, 1, 1,
-0.4525859, 0.9603499, 1.192836, 1, 1, 1, 1, 1,
-0.4523446, -1.595253, -2.919168, 1, 1, 1, 1, 1,
-0.4509027, -0.2162889, -1.670263, 1, 1, 1, 1, 1,
-0.4490181, 1.335198, -1.196661, 0, 0, 1, 1, 1,
-0.4432268, -0.1352067, -1.690642, 1, 0, 0, 1, 1,
-0.4387527, -1.203091, -2.56577, 1, 0, 0, 1, 1,
-0.437415, 1.32023, 0.5234577, 1, 0, 0, 1, 1,
-0.4325786, -0.5914567, -3.418494, 1, 0, 0, 1, 1,
-0.4306677, 0.6900892, -1.134545, 1, 0, 0, 1, 1,
-0.4297257, 0.1853425, -0.6196859, 0, 0, 0, 1, 1,
-0.428623, 0.4824652, -1.712064, 0, 0, 0, 1, 1,
-0.4278717, 0.2015144, -0.509898, 0, 0, 0, 1, 1,
-0.4255961, -0.4371672, -1.537768, 0, 0, 0, 1, 1,
-0.415436, 0.4559121, -0.4941196, 0, 0, 0, 1, 1,
-0.4106593, 1.951779, -0.2252078, 0, 0, 0, 1, 1,
-0.4081287, -0.5964202, -2.311549, 0, 0, 0, 1, 1,
-0.4017738, 0.4337853, -0.1973648, 1, 1, 1, 1, 1,
-0.3890356, 0.07049889, -0.4033313, 1, 1, 1, 1, 1,
-0.3883341, 0.1648864, -2.285277, 1, 1, 1, 1, 1,
-0.388027, -0.5754653, -3.888254, 1, 1, 1, 1, 1,
-0.3877217, 0.7494096, -0.6071574, 1, 1, 1, 1, 1,
-0.3843571, 0.4440478, -0.4191429, 1, 1, 1, 1, 1,
-0.3838013, 0.7649456, 0.3888818, 1, 1, 1, 1, 1,
-0.3747425, 0.5340751, -0.2640086, 1, 1, 1, 1, 1,
-0.3677062, 0.3908662, -1.05093, 1, 1, 1, 1, 1,
-0.3585802, -1.092666, -1.410955, 1, 1, 1, 1, 1,
-0.3578252, 0.08802447, -1.06347, 1, 1, 1, 1, 1,
-0.3537964, -0.6439338, -3.700538, 1, 1, 1, 1, 1,
-0.3500592, -0.3643402, -2.887578, 1, 1, 1, 1, 1,
-0.349459, 0.2916162, -0.1613233, 1, 1, 1, 1, 1,
-0.3452139, -0.7659634, -3.746159, 1, 1, 1, 1, 1,
-0.3448898, -1.141735, -3.831184, 0, 0, 1, 1, 1,
-0.3426211, 0.5344197, -0.4582825, 1, 0, 0, 1, 1,
-0.3415459, 1.061438, 0.2109155, 1, 0, 0, 1, 1,
-0.3383153, -0.4888429, -2.369192, 1, 0, 0, 1, 1,
-0.3346204, 1.055623, -0.6118457, 1, 0, 0, 1, 1,
-0.3311986, -1.169667, -4.129215, 1, 0, 0, 1, 1,
-0.3268034, 2.691868, -2.065115, 0, 0, 0, 1, 1,
-0.3254934, 0.5583935, -0.148025, 0, 0, 0, 1, 1,
-0.3221756, -1.191496, -3.95602, 0, 0, 0, 1, 1,
-0.3219227, -0.2559156, -0.713578, 0, 0, 0, 1, 1,
-0.3158286, 0.1956132, -3.237241, 0, 0, 0, 1, 1,
-0.3127804, -1.055987, -2.92433, 0, 0, 0, 1, 1,
-0.3119836, -0.7414174, -3.191255, 0, 0, 0, 1, 1,
-0.3116855, -0.943101, -3.405882, 1, 1, 1, 1, 1,
-0.3063651, -0.08571284, -2.229453, 1, 1, 1, 1, 1,
-0.3053516, -0.3995368, -1.838325, 1, 1, 1, 1, 1,
-0.3052788, 0.1037255, -1.199718, 1, 1, 1, 1, 1,
-0.3042789, -0.2921809, -1.334843, 1, 1, 1, 1, 1,
-0.3003391, 0.1139095, -0.4030677, 1, 1, 1, 1, 1,
-0.2987286, -0.2020597, -1.491, 1, 1, 1, 1, 1,
-0.2982715, 0.541626, 0.4308481, 1, 1, 1, 1, 1,
-0.2885151, -0.6570398, -4.652585, 1, 1, 1, 1, 1,
-0.2875656, 0.3318264, -1.042925, 1, 1, 1, 1, 1,
-0.2820252, 0.3619592, 0.4649656, 1, 1, 1, 1, 1,
-0.2753306, -1.084744, -1.59435, 1, 1, 1, 1, 1,
-0.2751711, -1.351956, -3.42409, 1, 1, 1, 1, 1,
-0.2677221, 0.9843727, 0.1017659, 1, 1, 1, 1, 1,
-0.2664925, -0.4542885, -0.6785119, 1, 1, 1, 1, 1,
-0.2645489, -0.5235812, -1.526354, 0, 0, 1, 1, 1,
-0.2613732, -0.1405201, -0.1884632, 1, 0, 0, 1, 1,
-0.2569219, -0.6363925, -1.053926, 1, 0, 0, 1, 1,
-0.2553761, 1.815246, -0.4820448, 1, 0, 0, 1, 1,
-0.255018, 1.033185, -1.618613, 1, 0, 0, 1, 1,
-0.2405072, -0.8861483, -3.161929, 1, 0, 0, 1, 1,
-0.2382668, 1.012526, -2.490701, 0, 0, 0, 1, 1,
-0.2348235, 1.681105, -3.310088, 0, 0, 0, 1, 1,
-0.2338705, 0.9977474, 0.8055291, 0, 0, 0, 1, 1,
-0.2332423, -1.520075, -4.153921, 0, 0, 0, 1, 1,
-0.2315732, -0.4101024, -3.159659, 0, 0, 0, 1, 1,
-0.231093, 1.511901, 1.053761, 0, 0, 0, 1, 1,
-0.2303706, 0.3131634, -0.2443187, 0, 0, 0, 1, 1,
-0.2301066, -0.08620402, -2.723076, 1, 1, 1, 1, 1,
-0.2290587, -1.106497, -2.003928, 1, 1, 1, 1, 1,
-0.2284592, 1.720918, 0.7345793, 1, 1, 1, 1, 1,
-0.2235933, -0.1735593, -1.995182, 1, 1, 1, 1, 1,
-0.2230402, 0.5048418, 0.1261302, 1, 1, 1, 1, 1,
-0.2185352, 1.095837, -0.3927861, 1, 1, 1, 1, 1,
-0.2148428, -1.110447, -1.873755, 1, 1, 1, 1, 1,
-0.2129487, -0.733882, -0.9529654, 1, 1, 1, 1, 1,
-0.2128586, 0.4842272, -0.6795569, 1, 1, 1, 1, 1,
-0.2127112, 1.22141, 0.8406383, 1, 1, 1, 1, 1,
-0.2014506, 1.400952, -0.8533115, 1, 1, 1, 1, 1,
-0.1943813, -0.04246972, -1.543108, 1, 1, 1, 1, 1,
-0.1933101, -1.159567, -2.492962, 1, 1, 1, 1, 1,
-0.19234, 0.5600937, 1.058313, 1, 1, 1, 1, 1,
-0.1909787, 0.8331497, 0.611657, 1, 1, 1, 1, 1,
-0.1898987, -1.77513, -2.031003, 0, 0, 1, 1, 1,
-0.1897974, 1.838775, -1.256817, 1, 0, 0, 1, 1,
-0.1856258, 0.4232579, 0.2283705, 1, 0, 0, 1, 1,
-0.1842284, 0.6843738, -0.3205708, 1, 0, 0, 1, 1,
-0.1828313, 0.017033, 1.145463, 1, 0, 0, 1, 1,
-0.1827577, 1.312878, 2.039078, 1, 0, 0, 1, 1,
-0.1819915, -1.14531, -3.292896, 0, 0, 0, 1, 1,
-0.1780923, -2.03376, -2.495281, 0, 0, 0, 1, 1,
-0.1747644, -0.7013341, -3.431012, 0, 0, 0, 1, 1,
-0.1730445, -1.135418, -4.04298, 0, 0, 0, 1, 1,
-0.1722696, 0.3368773, 0.3924051, 0, 0, 0, 1, 1,
-0.1686735, -0.7189887, -3.140966, 0, 0, 0, 1, 1,
-0.1674504, 1.378319, 0.06801244, 0, 0, 0, 1, 1,
-0.1599228, -0.5986698, -4.240325, 1, 1, 1, 1, 1,
-0.1585394, 0.4153103, -0.7499807, 1, 1, 1, 1, 1,
-0.149347, -0.07241651, -1.69955, 1, 1, 1, 1, 1,
-0.1472998, -0.4425903, -4.246164, 1, 1, 1, 1, 1,
-0.141005, 0.3838348, 0.3824549, 1, 1, 1, 1, 1,
-0.1401273, -0.4202133, -3.518177, 1, 1, 1, 1, 1,
-0.138685, -1.212978, -4.300588, 1, 1, 1, 1, 1,
-0.1378859, 0.07084081, -1.278276, 1, 1, 1, 1, 1,
-0.1308707, -0.6393068, -3.173586, 1, 1, 1, 1, 1,
-0.1261451, -1.306037, -2.355903, 1, 1, 1, 1, 1,
-0.11341, -0.9811452, -1.016762, 1, 1, 1, 1, 1,
-0.1036212, 0.08348995, -1.979665, 1, 1, 1, 1, 1,
-0.1027089, 1.039315, -1.411729, 1, 1, 1, 1, 1,
-0.09677576, 1.52793, 1.741953, 1, 1, 1, 1, 1,
-0.09594374, 0.9062534, 1.013885, 1, 1, 1, 1, 1,
-0.09484549, 0.1098241, -1.665917, 0, 0, 1, 1, 1,
-0.09078185, 0.05381704, -1.58602, 1, 0, 0, 1, 1,
-0.08750706, -1.698182, -3.494646, 1, 0, 0, 1, 1,
-0.08646785, 0.8684848, 0.8943027, 1, 0, 0, 1, 1,
-0.08556396, 0.07630505, -1.811243, 1, 0, 0, 1, 1,
-0.08421656, 0.07716549, -2.442019, 1, 0, 0, 1, 1,
-0.08261213, 0.6525005, -0.0123386, 0, 0, 0, 1, 1,
-0.08238696, 0.07050133, 0.7634858, 0, 0, 0, 1, 1,
-0.08170991, -0.8032967, -3.220726, 0, 0, 0, 1, 1,
-0.07727831, -0.4183453, -3.482584, 0, 0, 0, 1, 1,
-0.07233011, 0.7927628, -0.5639092, 0, 0, 0, 1, 1,
-0.07005642, 0.5531306, 0.05357653, 0, 0, 0, 1, 1,
-0.06924957, -1.309104, -2.959026, 0, 0, 0, 1, 1,
-0.06752733, -0.3248473, -2.603741, 1, 1, 1, 1, 1,
-0.06748098, 1.895457, 2.239433, 1, 1, 1, 1, 1,
-0.06635765, 1.020904, 1.131452, 1, 1, 1, 1, 1,
-0.06354095, 0.6619227, 0.6948121, 1, 1, 1, 1, 1,
-0.06317668, 0.09485365, -0.5262481, 1, 1, 1, 1, 1,
-0.06141944, 0.3454552, -0.9667466, 1, 1, 1, 1, 1,
-0.06115104, -0.6343923, -2.588272, 1, 1, 1, 1, 1,
-0.05917382, 0.9411827, 0.9406186, 1, 1, 1, 1, 1,
-0.05855641, -1.324047, -2.730773, 1, 1, 1, 1, 1,
-0.0581045, -2.392137, -3.433354, 1, 1, 1, 1, 1,
-0.05775354, -0.0351884, -1.722242, 1, 1, 1, 1, 1,
-0.05539898, 1.825153, -0.2522582, 1, 1, 1, 1, 1,
-0.05002069, 0.07872744, -0.9424482, 1, 1, 1, 1, 1,
-0.04570465, 0.5568058, -0.3718851, 1, 1, 1, 1, 1,
-0.04551731, -1.747068, -3.13983, 1, 1, 1, 1, 1,
-0.0436409, -3.404273, -3.525199, 0, 0, 1, 1, 1,
-0.03883687, -0.04119695, -4.144665, 1, 0, 0, 1, 1,
-0.03669763, -0.3437625, -3.62113, 1, 0, 0, 1, 1,
-0.03603124, 0.5384022, 0.6260692, 1, 0, 0, 1, 1,
-0.03522028, -1.789226, -2.973067, 1, 0, 0, 1, 1,
-0.03319675, 0.21196, 0.6027147, 1, 0, 0, 1, 1,
-0.03159369, -0.6244216, -3.515559, 0, 0, 0, 1, 1,
-0.030914, -1.662266, -3.74336, 0, 0, 0, 1, 1,
-0.02959493, 0.116133, -0.5655012, 0, 0, 0, 1, 1,
-0.0253021, 1.398905, -1.313142, 0, 0, 0, 1, 1,
-0.01898393, -0.447359, -3.0164, 0, 0, 0, 1, 1,
-0.01598707, 0.003714524, -1.3679, 0, 0, 0, 1, 1,
-0.008998401, -0.5173103, -4.609793, 0, 0, 0, 1, 1,
-0.001344396, -0.7929124, -4.440744, 1, 1, 1, 1, 1,
-0.0008475088, -0.1121107, -4.099778, 1, 1, 1, 1, 1,
-0.0006018642, -0.1957126, -2.005192, 1, 1, 1, 1, 1,
-0.0005438954, -0.8119027, -2.144284, 1, 1, 1, 1, 1,
-0.0002466084, 0.1601093, -1.164767, 1, 1, 1, 1, 1,
0.0003243349, -0.5266906, 4.871376, 1, 1, 1, 1, 1,
0.001258372, -0.2727176, 3.030073, 1, 1, 1, 1, 1,
0.003706409, -0.1542847, 1.588465, 1, 1, 1, 1, 1,
0.009434231, -0.7746856, 2.694122, 1, 1, 1, 1, 1,
0.01083104, 0.0795658, -0.3902517, 1, 1, 1, 1, 1,
0.01307672, 0.4883322, -2.197695, 1, 1, 1, 1, 1,
0.01357541, 2.046248, 0.593703, 1, 1, 1, 1, 1,
0.01411403, 0.7251466, 0.5602638, 1, 1, 1, 1, 1,
0.01422649, -2.348877, 1.736344, 1, 1, 1, 1, 1,
0.01547406, 1.359534, -1.003728, 1, 1, 1, 1, 1,
0.02297005, -0.301414, 3.424896, 0, 0, 1, 1, 1,
0.02421512, 0.1364488, 1.365125, 1, 0, 0, 1, 1,
0.02609224, -0.3518341, 2.956012, 1, 0, 0, 1, 1,
0.02690738, 0.4417131, 1.031995, 1, 0, 0, 1, 1,
0.03149611, 0.7448227, -0.8250738, 1, 0, 0, 1, 1,
0.03247027, 0.2263746, 1.433456, 1, 0, 0, 1, 1,
0.03293272, -0.149953, 0.2218734, 0, 0, 0, 1, 1,
0.0339358, -0.2130813, 4.56777, 0, 0, 0, 1, 1,
0.03528585, -0.06830521, 1.899141, 0, 0, 0, 1, 1,
0.03630144, -0.03424806, 2.039857, 0, 0, 0, 1, 1,
0.0477364, 2.194655, -0.08854375, 0, 0, 0, 1, 1,
0.04829277, -0.7535051, 1.333759, 0, 0, 0, 1, 1,
0.05171181, 1.476068, -0.7592272, 0, 0, 0, 1, 1,
0.05626306, 0.1818686, 1.08268, 1, 1, 1, 1, 1,
0.05696761, 0.2602426, 0.6777401, 1, 1, 1, 1, 1,
0.05747756, 0.9467615, 2.671743, 1, 1, 1, 1, 1,
0.06067951, 0.1653329, -2.196016, 1, 1, 1, 1, 1,
0.06386639, -1.381447, 3.552507, 1, 1, 1, 1, 1,
0.06745984, -0.522734, 2.739469, 1, 1, 1, 1, 1,
0.06878955, 0.3184101, -0.4467582, 1, 1, 1, 1, 1,
0.07395604, 1.254513, -1.469291, 1, 1, 1, 1, 1,
0.07484521, 0.002062939, 1.393531, 1, 1, 1, 1, 1,
0.07514432, -1.483089, 4.371788, 1, 1, 1, 1, 1,
0.07989834, -0.4344047, 1.605036, 1, 1, 1, 1, 1,
0.08344937, -0.5910898, 2.881202, 1, 1, 1, 1, 1,
0.0895226, -0.4272681, 4.265812, 1, 1, 1, 1, 1,
0.09136098, -1.460954, 2.176368, 1, 1, 1, 1, 1,
0.09209389, -0.7564862, 2.257215, 1, 1, 1, 1, 1,
0.09780291, -2.001367, 4.067659, 0, 0, 1, 1, 1,
0.09864882, -1.593089, 3.381521, 1, 0, 0, 1, 1,
0.09876676, 0.6024651, 1.404477, 1, 0, 0, 1, 1,
0.1006691, -0.05421171, 4.117178, 1, 0, 0, 1, 1,
0.1018768, -0.0555122, 0.5951639, 1, 0, 0, 1, 1,
0.1036961, 0.1905907, 1.807842, 1, 0, 0, 1, 1,
0.1047427, -0.4981155, 2.738176, 0, 0, 0, 1, 1,
0.1089613, -1.246443, 3.343492, 0, 0, 0, 1, 1,
0.1096514, -0.9505029, 4.415838, 0, 0, 0, 1, 1,
0.1097964, -0.3993786, 2.322862, 0, 0, 0, 1, 1,
0.1101427, -0.1971191, 4.489943, 0, 0, 0, 1, 1,
0.112128, 0.749576, 0.8913524, 0, 0, 0, 1, 1,
0.1210716, 0.8313968, 0.7179756, 0, 0, 0, 1, 1,
0.1225206, -0.3993528, 1.300726, 1, 1, 1, 1, 1,
0.1240288, 0.3215032, 1.258629, 1, 1, 1, 1, 1,
0.1302962, 1.594207, -2.251851, 1, 1, 1, 1, 1,
0.132833, 0.6391038, -0.485159, 1, 1, 1, 1, 1,
0.1328529, -0.6672577, 2.980516, 1, 1, 1, 1, 1,
0.1374976, -0.4612521, 3.839837, 1, 1, 1, 1, 1,
0.1389352, 0.8057466, 1.117444, 1, 1, 1, 1, 1,
0.1446012, 0.4180258, -0.2648594, 1, 1, 1, 1, 1,
0.1447098, 1.20443, -0.1480707, 1, 1, 1, 1, 1,
0.1488124, -0.1194611, 3.567388, 1, 1, 1, 1, 1,
0.1490641, -0.885842, 2.191335, 1, 1, 1, 1, 1,
0.150558, -0.4248742, 2.492212, 1, 1, 1, 1, 1,
0.1552533, 0.7694921, 0.5936781, 1, 1, 1, 1, 1,
0.1595612, 0.0788428, -0.3575779, 1, 1, 1, 1, 1,
0.159609, -1.651758, 1.968234, 1, 1, 1, 1, 1,
0.1615605, 0.9042977, -0.515308, 0, 0, 1, 1, 1,
0.1686423, 0.2755809, 0.9748058, 1, 0, 0, 1, 1,
0.1695564, -0.3700711, 1.211558, 1, 0, 0, 1, 1,
0.177742, 0.7525537, 0.2127839, 1, 0, 0, 1, 1,
0.1830292, 0.7666491, 0.7613928, 1, 0, 0, 1, 1,
0.1853585, -0.4878969, 2.44341, 1, 0, 0, 1, 1,
0.1856086, -1.613143, 2.307759, 0, 0, 0, 1, 1,
0.1859377, 0.6916327, -0.5659782, 0, 0, 0, 1, 1,
0.1861561, -0.2311565, 3.221558, 0, 0, 0, 1, 1,
0.1884329, 0.3724909, 0.1343443, 0, 0, 0, 1, 1,
0.1900469, 2.265245, -0.7768376, 0, 0, 0, 1, 1,
0.1908844, -1.955804, 3.476239, 0, 0, 0, 1, 1,
0.1934102, -0.2716613, 2.103724, 0, 0, 0, 1, 1,
0.1967247, 2.538226, -0.4160959, 1, 1, 1, 1, 1,
0.1995133, 0.2365898, 0.3379084, 1, 1, 1, 1, 1,
0.2007975, 0.496451, 1.199979, 1, 1, 1, 1, 1,
0.2068471, 0.7250557, 0.3600127, 1, 1, 1, 1, 1,
0.2078373, -1.501591, 3.245384, 1, 1, 1, 1, 1,
0.208331, 0.3404902, 1.939775, 1, 1, 1, 1, 1,
0.2096719, 0.2551718, 0.1946097, 1, 1, 1, 1, 1,
0.2105669, -0.9403496, 4.036457, 1, 1, 1, 1, 1,
0.2112027, -0.4202781, 1.84797, 1, 1, 1, 1, 1,
0.2171431, -1.355931, 2.030946, 1, 1, 1, 1, 1,
0.2182302, 1.466602, -0.08709743, 1, 1, 1, 1, 1,
0.2184699, 0.9177203, -0.1653619, 1, 1, 1, 1, 1,
0.2186551, 0.2444156, 1.15306, 1, 1, 1, 1, 1,
0.2213698, -0.6977407, 1.402899, 1, 1, 1, 1, 1,
0.2228152, -0.6653294, 1.892384, 1, 1, 1, 1, 1,
0.2250972, -0.1646979, 3.002896, 0, 0, 1, 1, 1,
0.2270035, -0.5633886, 3.771209, 1, 0, 0, 1, 1,
0.2283047, -0.2588852, 3.408553, 1, 0, 0, 1, 1,
0.231744, -1.283417, 4.25552, 1, 0, 0, 1, 1,
0.2322674, 0.5931582, 0.4933604, 1, 0, 0, 1, 1,
0.2325179, 0.2041527, 1.237698, 1, 0, 0, 1, 1,
0.2362298, -1.529053, 3.326892, 0, 0, 0, 1, 1,
0.2378885, 0.6210539, 1.628253, 0, 0, 0, 1, 1,
0.2388409, -1.368219, 3.808946, 0, 0, 0, 1, 1,
0.2403157, -0.8326143, 3.47922, 0, 0, 0, 1, 1,
0.2418262, 0.5748569, 1.202725, 0, 0, 0, 1, 1,
0.2438015, 0.1380561, 1.295683, 0, 0, 0, 1, 1,
0.2511872, 1.64187, -0.2323041, 0, 0, 0, 1, 1,
0.2529999, 1.458188, -0.03131219, 1, 1, 1, 1, 1,
0.2551418, -1.209967, 1.619903, 1, 1, 1, 1, 1,
0.260728, 1.298043, 0.6931368, 1, 1, 1, 1, 1,
0.2621724, 0.9431748, 1.300626, 1, 1, 1, 1, 1,
0.2640767, 0.4562076, -0.7832844, 1, 1, 1, 1, 1,
0.2674962, -1.811804, 3.329866, 1, 1, 1, 1, 1,
0.268782, -1.309925, 4.709163, 1, 1, 1, 1, 1,
0.2716673, 0.5240597, -0.08689599, 1, 1, 1, 1, 1,
0.274002, 1.185732, 0.4061841, 1, 1, 1, 1, 1,
0.2740586, 0.4370873, -0.7086089, 1, 1, 1, 1, 1,
0.2741937, -0.6170948, 3.371579, 1, 1, 1, 1, 1,
0.2794366, 1.435557, -1.427088, 1, 1, 1, 1, 1,
0.280877, 0.4434527, -0.2135281, 1, 1, 1, 1, 1,
0.2867356, -0.117763, 1.62628, 1, 1, 1, 1, 1,
0.2943266, -1.707191, 4.329521, 1, 1, 1, 1, 1,
0.2983211, -0.2718921, 2.258059, 0, 0, 1, 1, 1,
0.3068341, 0.342639, -1.753449, 1, 0, 0, 1, 1,
0.3084093, -1.049816, 5.691998, 1, 0, 0, 1, 1,
0.3099367, 0.2431648, 1.242677, 1, 0, 0, 1, 1,
0.3105324, -0.8077525, 2.93602, 1, 0, 0, 1, 1,
0.3112284, 0.1817594, 2.050571, 1, 0, 0, 1, 1,
0.3126512, 0.2273808, -0.4355303, 0, 0, 0, 1, 1,
0.3142417, 1.015852, 1.097157, 0, 0, 0, 1, 1,
0.3169594, 1.710738, 1.262269, 0, 0, 0, 1, 1,
0.319762, -0.1189561, 1.96192, 0, 0, 0, 1, 1,
0.3222841, 0.6395625, 1.996695, 0, 0, 0, 1, 1,
0.3273713, 0.07763801, 1.192907, 0, 0, 0, 1, 1,
0.3314346, 1.013702, -0.6225447, 0, 0, 0, 1, 1,
0.333454, -0.2832423, 0.5340559, 1, 1, 1, 1, 1,
0.3351129, 0.2628437, 1.407788, 1, 1, 1, 1, 1,
0.3376784, -2.812222, 1.689754, 1, 1, 1, 1, 1,
0.3377811, -1.193247, 2.533372, 1, 1, 1, 1, 1,
0.3421987, 0.6491569, 0.3062612, 1, 1, 1, 1, 1,
0.3429376, -0.3763371, 2.579607, 1, 1, 1, 1, 1,
0.3455848, -2.043023, 3.981084, 1, 1, 1, 1, 1,
0.3457095, 0.8282521, -0.3425033, 1, 1, 1, 1, 1,
0.3472505, 0.9256003, 2.262596, 1, 1, 1, 1, 1,
0.3481071, -1.353328, 1.20224, 1, 1, 1, 1, 1,
0.3505154, 2.591854, -0.1662124, 1, 1, 1, 1, 1,
0.3512823, 0.8539584, 0.8263539, 1, 1, 1, 1, 1,
0.3536757, -0.06502815, 2.924749, 1, 1, 1, 1, 1,
0.3622749, 0.2309245, -0.8053793, 1, 1, 1, 1, 1,
0.3638344, 1.284851, 0.6122443, 1, 1, 1, 1, 1,
0.369205, -0.8551449, 3.486496, 0, 0, 1, 1, 1,
0.3697473, 0.0003422978, 2.052945, 1, 0, 0, 1, 1,
0.3699314, -0.4986746, 2.921512, 1, 0, 0, 1, 1,
0.3743398, -1.316484, 2.655621, 1, 0, 0, 1, 1,
0.3794967, 0.4901769, 0.07167099, 1, 0, 0, 1, 1,
0.3808479, 0.605395, 1.260552, 1, 0, 0, 1, 1,
0.3832988, -0.2482263, 1.758826, 0, 0, 0, 1, 1,
0.3855623, -1.959026, 5.298148, 0, 0, 0, 1, 1,
0.3858046, 0.5163423, -0.01955538, 0, 0, 0, 1, 1,
0.387097, 1.30589, 2.045574, 0, 0, 0, 1, 1,
0.3881038, 0.3481062, 1.379584, 0, 0, 0, 1, 1,
0.3891193, 0.08334257, 3.677861, 0, 0, 0, 1, 1,
0.3894074, 0.592605, 0.1694974, 0, 0, 0, 1, 1,
0.3903244, 1.003653, -1.625015, 1, 1, 1, 1, 1,
0.399043, 0.928199, -0.4724736, 1, 1, 1, 1, 1,
0.3994888, 2.127505, 1.531421, 1, 1, 1, 1, 1,
0.4026652, -0.8841001, 1.923386, 1, 1, 1, 1, 1,
0.413951, 1.0906, 0.9165351, 1, 1, 1, 1, 1,
0.4146174, 0.1244433, 1.94633, 1, 1, 1, 1, 1,
0.4187829, 1.083574, 0.1852172, 1, 1, 1, 1, 1,
0.4209878, -0.8397471, 3.187617, 1, 1, 1, 1, 1,
0.4210207, 1.240752, -0.541864, 1, 1, 1, 1, 1,
0.4255082, -1.053766, 2.251565, 1, 1, 1, 1, 1,
0.4259059, 0.1938414, 0.9918977, 1, 1, 1, 1, 1,
0.4267173, 0.7060987, 2.467558, 1, 1, 1, 1, 1,
0.4295762, -1.015355, 2.925723, 1, 1, 1, 1, 1,
0.4324839, -1.093241, 4.891241, 1, 1, 1, 1, 1,
0.4379486, 0.3971896, -0.7090427, 1, 1, 1, 1, 1,
0.4399827, -0.1390209, 2.009231, 0, 0, 1, 1, 1,
0.4455667, -0.7030863, 2.916497, 1, 0, 0, 1, 1,
0.4548393, 0.3019163, 0.5154663, 1, 0, 0, 1, 1,
0.4578963, 1.461218, 1.945733, 1, 0, 0, 1, 1,
0.4600516, -0.1307765, 0.6825577, 1, 0, 0, 1, 1,
0.4645452, -0.3516675, 4.673161, 1, 0, 0, 1, 1,
0.4654667, -0.3486758, 1.895511, 0, 0, 0, 1, 1,
0.4688706, 0.6624232, -1.898315, 0, 0, 0, 1, 1,
0.4689645, 1.770781, 0.736015, 0, 0, 0, 1, 1,
0.4691673, 0.5217752, 0.1256105, 0, 0, 0, 1, 1,
0.4734765, 1.54536, -0.06418329, 0, 0, 0, 1, 1,
0.4736567, 0.4181592, -1.564854, 0, 0, 0, 1, 1,
0.4753455, 0.3486978, 0.4513234, 0, 0, 0, 1, 1,
0.475492, 1.061851, 0.5097261, 1, 1, 1, 1, 1,
0.4758001, 0.6436074, 2.092088, 1, 1, 1, 1, 1,
0.4774431, -0.1292559, 2.19401, 1, 1, 1, 1, 1,
0.4791648, 0.9195687, 0.8218943, 1, 1, 1, 1, 1,
0.4818044, -0.5562633, 1.915499, 1, 1, 1, 1, 1,
0.4822123, -0.5154427, 1.583272, 1, 1, 1, 1, 1,
0.4939938, -0.6356884, 2.160776, 1, 1, 1, 1, 1,
0.4971412, -1.458831, 2.622914, 1, 1, 1, 1, 1,
0.5008524, 0.4507188, 2.467713, 1, 1, 1, 1, 1,
0.5032554, -0.6810375, 1.22032, 1, 1, 1, 1, 1,
0.5059581, -0.5358303, 0.6629936, 1, 1, 1, 1, 1,
0.5064449, -0.2568762, 3.044503, 1, 1, 1, 1, 1,
0.5072092, 1.22904, 2.201788, 1, 1, 1, 1, 1,
0.5092687, -0.5111714, 2.383046, 1, 1, 1, 1, 1,
0.5101808, -0.07393225, 1.195505, 1, 1, 1, 1, 1,
0.5112166, -0.5597628, 1.832094, 0, 0, 1, 1, 1,
0.512096, -0.59532, 1.045293, 1, 0, 0, 1, 1,
0.5148188, -0.02942912, 1.632339, 1, 0, 0, 1, 1,
0.5155181, -1.36921, 3.521069, 1, 0, 0, 1, 1,
0.5176379, 0.5042298, 1.142169, 1, 0, 0, 1, 1,
0.5192501, 0.1081103, 1.593053, 1, 0, 0, 1, 1,
0.5238409, -0.1482051, 0.631117, 0, 0, 0, 1, 1,
0.5289685, -0.3052426, 2.07258, 0, 0, 0, 1, 1,
0.5310362, 0.1697155, 1.091818, 0, 0, 0, 1, 1,
0.5343274, 1.403598, -0.2185984, 0, 0, 0, 1, 1,
0.5444765, -1.723017, 2.427718, 0, 0, 0, 1, 1,
0.5460677, -0.09440131, 1.940991, 0, 0, 0, 1, 1,
0.5537649, -0.0002189948, 3.777751, 0, 0, 0, 1, 1,
0.5571657, 0.396482, 1.07842, 1, 1, 1, 1, 1,
0.5622777, -0.5070461, 3.684028, 1, 1, 1, 1, 1,
0.5664081, 0.2343667, -0.08985118, 1, 1, 1, 1, 1,
0.5673301, -0.9052987, 2.622481, 1, 1, 1, 1, 1,
0.5748493, -0.001662749, 1.150924, 1, 1, 1, 1, 1,
0.5752036, -0.06234849, 1.893281, 1, 1, 1, 1, 1,
0.5759203, 0.1360836, -0.09208937, 1, 1, 1, 1, 1,
0.5870137, 2.769656, 1.212276, 1, 1, 1, 1, 1,
0.5873195, 0.8867753, -0.04251219, 1, 1, 1, 1, 1,
0.5874372, 0.7220005, 0.8773152, 1, 1, 1, 1, 1,
0.5915863, 0.7515488, 0.1837356, 1, 1, 1, 1, 1,
0.5920542, 0.1310847, 0.5777055, 1, 1, 1, 1, 1,
0.5924095, -0.06953406, 1.013713, 1, 1, 1, 1, 1,
0.5940552, 0.618686, 1.682323, 1, 1, 1, 1, 1,
0.594593, 1.164597, -0.3080558, 1, 1, 1, 1, 1,
0.59561, -0.2074753, 2.302846, 0, 0, 1, 1, 1,
0.5962419, -1.230427, 1.776814, 1, 0, 0, 1, 1,
0.5968134, 0.0357568, 0.04492895, 1, 0, 0, 1, 1,
0.5993767, 0.4520134, 1.807633, 1, 0, 0, 1, 1,
0.6016185, -0.05544025, 1.84988, 1, 0, 0, 1, 1,
0.6044553, -0.4036582, -0.5434368, 1, 0, 0, 1, 1,
0.6141019, 0.8843568, 0.9831614, 0, 0, 0, 1, 1,
0.6142852, -0.3864654, 1.300524, 0, 0, 0, 1, 1,
0.614806, 1.494859, -0.4968846, 0, 0, 0, 1, 1,
0.6191046, 0.7551473, 0.9954877, 0, 0, 0, 1, 1,
0.6221283, 0.121532, 2.686705, 0, 0, 0, 1, 1,
0.6312653, -0.270346, 2.422822, 0, 0, 0, 1, 1,
0.6316803, 0.9425997, 1.110694, 0, 0, 0, 1, 1,
0.6317932, 0.9769138, -0.6724864, 1, 1, 1, 1, 1,
0.6455651, 0.0917076, 1.793661, 1, 1, 1, 1, 1,
0.6483868, 1.258163, 2.199687, 1, 1, 1, 1, 1,
0.6492912, -0.3290193, 2.808722, 1, 1, 1, 1, 1,
0.6498133, -0.4628957, 2.578014, 1, 1, 1, 1, 1,
0.6517731, -1.097571, 3.449601, 1, 1, 1, 1, 1,
0.6520771, -2.226871, 2.650116, 1, 1, 1, 1, 1,
0.6546632, 0.6357136, 1.180026, 1, 1, 1, 1, 1,
0.6592911, -0.2420622, 2.474088, 1, 1, 1, 1, 1,
0.6595049, 1.684055, -0.7844077, 1, 1, 1, 1, 1,
0.6621256, -0.6496359, 2.450302, 1, 1, 1, 1, 1,
0.6678879, 0.9603292, 0.03305187, 1, 1, 1, 1, 1,
0.6694312, -0.2764429, 2.476824, 1, 1, 1, 1, 1,
0.6701307, 2.115589, 0.7648776, 1, 1, 1, 1, 1,
0.672758, 0.1499914, 1.340218, 1, 1, 1, 1, 1,
0.67289, 0.8456367, 2.368396, 0, 0, 1, 1, 1,
0.6743765, 0.9324669, -0.2447811, 1, 0, 0, 1, 1,
0.6753619, 1.156748, 0.7678292, 1, 0, 0, 1, 1,
0.6768937, -0.5723071, 0.3896576, 1, 0, 0, 1, 1,
0.677205, -0.3670278, 0.4540539, 1, 0, 0, 1, 1,
0.6775162, 0.743743, 1.48736, 1, 0, 0, 1, 1,
0.6781384, 0.05268624, 0.8966329, 0, 0, 0, 1, 1,
0.6812497, 0.855396, 2.49949, 0, 0, 0, 1, 1,
0.6826647, 0.5003305, -0.1509086, 0, 0, 0, 1, 1,
0.6899682, 0.5462107, 0.7466525, 0, 0, 0, 1, 1,
0.6906517, -0.05700302, 2.023398, 0, 0, 0, 1, 1,
0.6925136, 0.1466149, 0.04613263, 0, 0, 0, 1, 1,
0.6976468, -0.7182133, 0.8478686, 0, 0, 0, 1, 1,
0.6990599, 0.6619782, 1.852882, 1, 1, 1, 1, 1,
0.6995212, -0.02657454, -0.417583, 1, 1, 1, 1, 1,
0.7017508, -1.612298, 2.376202, 1, 1, 1, 1, 1,
0.7054684, -1.363071, 2.834158, 1, 1, 1, 1, 1,
0.7067542, 0.9854658, 0.5799661, 1, 1, 1, 1, 1,
0.7082919, -0.5158218, 2.219776, 1, 1, 1, 1, 1,
0.7087134, -1.981364, 1.766342, 1, 1, 1, 1, 1,
0.7100797, -0.7742584, 1.41448, 1, 1, 1, 1, 1,
0.7116654, 1.211957, 1.834258, 1, 1, 1, 1, 1,
0.7162724, 0.9385034, 1.198704, 1, 1, 1, 1, 1,
0.7174038, -0.3900421, 2.285952, 1, 1, 1, 1, 1,
0.7185937, 0.7178488, 0.8288924, 1, 1, 1, 1, 1,
0.7196901, 0.507764, 1.237131, 1, 1, 1, 1, 1,
0.72513, 1.058552, -0.9021359, 1, 1, 1, 1, 1,
0.7262637, 1.70354, -0.4245022, 1, 1, 1, 1, 1,
0.7262864, -0.2501889, 3.471322, 0, 0, 1, 1, 1,
0.7269018, 0.7018151, 1.940516, 1, 0, 0, 1, 1,
0.7319124, 1.407792, -0.02889551, 1, 0, 0, 1, 1,
0.7345514, 0.1708487, 2.372347, 1, 0, 0, 1, 1,
0.7433424, -0.3765291, 0.920841, 1, 0, 0, 1, 1,
0.7452571, 0.4419449, -0.04450688, 1, 0, 0, 1, 1,
0.7514557, 0.0438019, 1.924821, 0, 0, 0, 1, 1,
0.7522966, 0.01558977, 2.945392, 0, 0, 0, 1, 1,
0.7559019, -1.05053, 1.909259, 0, 0, 0, 1, 1,
0.7607261, -0.4479252, 1.696673, 0, 0, 0, 1, 1,
0.762816, -1.065532, 2.620049, 0, 0, 0, 1, 1,
0.7635396, 0.9225286, -0.02125322, 0, 0, 0, 1, 1,
0.7647132, -0.6197731, 1.56147, 0, 0, 0, 1, 1,
0.7652298, -0.6908237, 2.123196, 1, 1, 1, 1, 1,
0.7738966, -1.720252, 2.159315, 1, 1, 1, 1, 1,
0.7762865, 0.5579823, 0.5461214, 1, 1, 1, 1, 1,
0.7783757, 0.7054521, 2.540856, 1, 1, 1, 1, 1,
0.7793527, 1.316377, 2.460849, 1, 1, 1, 1, 1,
0.7820796, 1.697334, 1.120564, 1, 1, 1, 1, 1,
0.7824431, 0.36179, 2.385163, 1, 1, 1, 1, 1,
0.7824824, 0.7496656, -1.814311, 1, 1, 1, 1, 1,
0.7825304, 0.2885378, 0.5906562, 1, 1, 1, 1, 1,
0.7836662, 0.2628361, -0.4418859, 1, 1, 1, 1, 1,
0.7905294, -0.1038842, 1.574444, 1, 1, 1, 1, 1,
0.7911692, 0.2337101, 1.83046, 1, 1, 1, 1, 1,
0.7991091, -0.3715197, 2.462067, 1, 1, 1, 1, 1,
0.8040146, -0.5754968, 1.395916, 1, 1, 1, 1, 1,
0.8090882, -0.4798737, 1.349632, 1, 1, 1, 1, 1,
0.8096343, 0.5528075, 1.221949, 0, 0, 1, 1, 1,
0.8131576, -1.080745, 0.8956683, 1, 0, 0, 1, 1,
0.8223485, -1.597893, 1.963752, 1, 0, 0, 1, 1,
0.8326477, -0.05971187, 0.09325263, 1, 0, 0, 1, 1,
0.8343887, 1.398458, 1.788842, 1, 0, 0, 1, 1,
0.8345487, -0.285887, 1.760033, 1, 0, 0, 1, 1,
0.8377464, -0.8331631, 0.8606822, 0, 0, 0, 1, 1,
0.8411136, -0.6313919, 2.730719, 0, 0, 0, 1, 1,
0.844219, -0.8150731, 4.694374, 0, 0, 0, 1, 1,
0.8449047, 1.063428, 1.335368, 0, 0, 0, 1, 1,
0.8510756, -0.881278, 4.078685, 0, 0, 0, 1, 1,
0.8564553, 0.2579637, 2.22421, 0, 0, 0, 1, 1,
0.8589169, 2.514834, -2.314281, 0, 0, 0, 1, 1,
0.8649791, -1.238132, 1.91755, 1, 1, 1, 1, 1,
0.867819, 0.3681427, 0.948612, 1, 1, 1, 1, 1,
0.8716761, -1.171855, 2.338981, 1, 1, 1, 1, 1,
0.8818508, 2.046715, 0.9176606, 1, 1, 1, 1, 1,
0.8834317, -0.5972284, 1.910289, 1, 1, 1, 1, 1,
0.8843808, -0.1079837, 1.144878, 1, 1, 1, 1, 1,
0.8849237, 0.2326419, 0.775312, 1, 1, 1, 1, 1,
0.8870813, -0.9210111, 4.302777, 1, 1, 1, 1, 1,
0.8935688, 0.9185017, 0.03254914, 1, 1, 1, 1, 1,
0.8973981, -0.2046322, 2.45659, 1, 1, 1, 1, 1,
0.8997703, 1.699827, 0.4324028, 1, 1, 1, 1, 1,
0.900003, -1.048664, 3.643631, 1, 1, 1, 1, 1,
0.9005588, -0.102879, 1.670511, 1, 1, 1, 1, 1,
0.9021125, -2.405295, 2.129304, 1, 1, 1, 1, 1,
0.902204, -2.428808, 3.655523, 1, 1, 1, 1, 1,
0.9200966, -0.4175318, 4.045475, 0, 0, 1, 1, 1,
0.9261377, -0.1725924, 0.2185187, 1, 0, 0, 1, 1,
0.9293612, -1.984617, 2.139634, 1, 0, 0, 1, 1,
0.9299636, 0.1505603, 0.3682013, 1, 0, 0, 1, 1,
0.9337453, 0.5189791, -0.01760217, 1, 0, 0, 1, 1,
0.9360824, -0.0755548, 1.490978, 1, 0, 0, 1, 1,
0.9367406, -0.465627, 2.097306, 0, 0, 0, 1, 1,
0.9376057, 1.072293, 0.05461041, 0, 0, 0, 1, 1,
0.9462051, -1.056988, 2.750748, 0, 0, 0, 1, 1,
0.9537967, -0.2389887, 2.127218, 0, 0, 0, 1, 1,
0.9545609, 0.5804668, 1.611876, 0, 0, 0, 1, 1,
0.9567646, 1.667062, 1.942896, 0, 0, 0, 1, 1,
0.9606935, 1.276036, -0.8976203, 0, 0, 0, 1, 1,
0.967764, 0.407609, 2.147945, 1, 1, 1, 1, 1,
0.9710237, 2.139059, 1.042588, 1, 1, 1, 1, 1,
0.9779512, -1.027585, 4.098059, 1, 1, 1, 1, 1,
0.9962763, 0.4805854, -0.4299763, 1, 1, 1, 1, 1,
0.9966074, -1.211836, 1.259682, 1, 1, 1, 1, 1,
0.9979871, -1.257818, 1.961611, 1, 1, 1, 1, 1,
1.002824, 0.4037434, 1.861557, 1, 1, 1, 1, 1,
1.015814, 0.6206189, 1.006422, 1, 1, 1, 1, 1,
1.016589, -0.7335612, 2.381843, 1, 1, 1, 1, 1,
1.021818, 0.1812395, 1.847134, 1, 1, 1, 1, 1,
1.031335, -0.2714045, 2.230013, 1, 1, 1, 1, 1,
1.032671, 1.049178, 0.9106659, 1, 1, 1, 1, 1,
1.052518, -1.194846, 2.011627, 1, 1, 1, 1, 1,
1.056638, -2.28064, 2.233903, 1, 1, 1, 1, 1,
1.058887, -0.1958205, 2.274049, 1, 1, 1, 1, 1,
1.060671, -1.216225, 2.111306, 0, 0, 1, 1, 1,
1.064768, -0.7011532, 1.500204, 1, 0, 0, 1, 1,
1.071154, -0.1376218, 2.772004, 1, 0, 0, 1, 1,
1.071159, 0.1170884, 2.728674, 1, 0, 0, 1, 1,
1.073136, 0.2465321, 3.867755, 1, 0, 0, 1, 1,
1.076103, 0.5154371, 1.479537, 1, 0, 0, 1, 1,
1.080324, -1.065479, 0.9949948, 0, 0, 0, 1, 1,
1.080717, 1.512845, 1.891321, 0, 0, 0, 1, 1,
1.083963, 0.4645999, 0.8834096, 0, 0, 0, 1, 1,
1.08677, 0.8695653, 0.538, 0, 0, 0, 1, 1,
1.087154, -0.8370687, 3.016812, 0, 0, 0, 1, 1,
1.093881, -1.121702, 1.207097, 0, 0, 0, 1, 1,
1.10796, -1.218135, 1.794095, 0, 0, 0, 1, 1,
1.116334, 0.7970557, 0.7674764, 1, 1, 1, 1, 1,
1.11773, 0.3977692, 1.223689, 1, 1, 1, 1, 1,
1.11944, 0.1461104, 0.4284378, 1, 1, 1, 1, 1,
1.135051, 0.1003694, 2.213189, 1, 1, 1, 1, 1,
1.137211, 0.1056092, 2.761529, 1, 1, 1, 1, 1,
1.160206, -0.6608433, 2.388612, 1, 1, 1, 1, 1,
1.165931, 0.2209512, 1.377516, 1, 1, 1, 1, 1,
1.184968, -2.143288, 1.819798, 1, 1, 1, 1, 1,
1.186319, -0.1139651, 3.592153, 1, 1, 1, 1, 1,
1.195697, 2.171541, 1.693368, 1, 1, 1, 1, 1,
1.197177, -1.154436, 2.962338, 1, 1, 1, 1, 1,
1.199782, 0.1375089, 0.8984237, 1, 1, 1, 1, 1,
1.209489, -0.3919969, 1.241874, 1, 1, 1, 1, 1,
1.213785, 0.8699176, -0.07540934, 1, 1, 1, 1, 1,
1.219965, -1.659768, 2.106144, 1, 1, 1, 1, 1,
1.221312, 0.08432049, 2.649695, 0, 0, 1, 1, 1,
1.223044, -0.8199582, 2.652045, 1, 0, 0, 1, 1,
1.224552, -0.4416057, 1.950412, 1, 0, 0, 1, 1,
1.237959, 2.075541, 0.5920075, 1, 0, 0, 1, 1,
1.243101, 0.5545434, -0.2118827, 1, 0, 0, 1, 1,
1.243156, -0.2940635, 1.758668, 1, 0, 0, 1, 1,
1.244611, 1.073284, 0.4450826, 0, 0, 0, 1, 1,
1.245076, 1.276253, -0.1539216, 0, 0, 0, 1, 1,
1.267777, 0.1648029, 2.413239, 0, 0, 0, 1, 1,
1.292412, -0.5473756, 2.209386, 0, 0, 0, 1, 1,
1.299508, -0.6718106, 3.119411, 0, 0, 0, 1, 1,
1.307012, -0.04888889, 2.001778, 0, 0, 0, 1, 1,
1.309067, 1.450411, 2.59191, 0, 0, 0, 1, 1,
1.312237, -0.9994064, 0.260602, 1, 1, 1, 1, 1,
1.316393, 0.7539048, 0.3094022, 1, 1, 1, 1, 1,
1.324553, 0.6034531, 0.8337577, 1, 1, 1, 1, 1,
1.33537, -2.510406, 2.340722, 1, 1, 1, 1, 1,
1.348976, -0.2229994, 2.05604, 1, 1, 1, 1, 1,
1.349459, -1.66376, 2.471873, 1, 1, 1, 1, 1,
1.37532, -0.5411205, 0.600589, 1, 1, 1, 1, 1,
1.378477, 0.1308753, 1.582921, 1, 1, 1, 1, 1,
1.379537, -0.507462, 1.347074, 1, 1, 1, 1, 1,
1.383251, -0.4233895, 2.424445, 1, 1, 1, 1, 1,
1.396693, -0.9499274, 1.081462, 1, 1, 1, 1, 1,
1.398263, -1.798519, 3.702426, 1, 1, 1, 1, 1,
1.398329, 0.06319889, 1.444642, 1, 1, 1, 1, 1,
1.437907, 0.9526334, 1.173768, 1, 1, 1, 1, 1,
1.441638, 0.1655744, 3.026946, 1, 1, 1, 1, 1,
1.449131, 0.4416236, 0.8610389, 0, 0, 1, 1, 1,
1.450563, 0.803896, 0.5126986, 1, 0, 0, 1, 1,
1.456636, 0.2740742, 1.530892, 1, 0, 0, 1, 1,
1.475753, 0.6907368, 1.501065, 1, 0, 0, 1, 1,
1.477005, 2.625692, 0.09318268, 1, 0, 0, 1, 1,
1.479437, -0.5156553, 1.497682, 1, 0, 0, 1, 1,
1.486733, -0.662591, 2.759784, 0, 0, 0, 1, 1,
1.492071, -1.447131, 2.500901, 0, 0, 0, 1, 1,
1.494159, 0.872487, 1.348385, 0, 0, 0, 1, 1,
1.495826, 0.4767382, 0.690734, 0, 0, 0, 1, 1,
1.50337, 0.2069674, 0.817961, 0, 0, 0, 1, 1,
1.518242, 2.103625, -1.269776, 0, 0, 0, 1, 1,
1.532447, -0.2278901, 1.197166, 0, 0, 0, 1, 1,
1.55169, -0.650073, 1.666161, 1, 1, 1, 1, 1,
1.552448, -0.7156363, 1.395377, 1, 1, 1, 1, 1,
1.554427, -0.5319681, 1.721864, 1, 1, 1, 1, 1,
1.567912, -0.8031597, 2.675438, 1, 1, 1, 1, 1,
1.572805, -0.661906, 2.455111, 1, 1, 1, 1, 1,
1.576967, 1.648697, 1.408056, 1, 1, 1, 1, 1,
1.583472, -1.292639, 1.76148, 1, 1, 1, 1, 1,
1.606021, -0.074715, 1.691241, 1, 1, 1, 1, 1,
1.606764, 0.4461436, 2.651169, 1, 1, 1, 1, 1,
1.621143, -0.08700586, 0.6480712, 1, 1, 1, 1, 1,
1.623289, 0.3161299, 2.030956, 1, 1, 1, 1, 1,
1.623908, -0.3210786, 1.95663, 1, 1, 1, 1, 1,
1.640433, -1.871304, 3.559296, 1, 1, 1, 1, 1,
1.642035, -0.07066373, 0.6025187, 1, 1, 1, 1, 1,
1.642061, 1.150344, -0.02938608, 1, 1, 1, 1, 1,
1.642115, -0.06924777, 1.605157, 0, 0, 1, 1, 1,
1.642123, -1.445444, 0.048751, 1, 0, 0, 1, 1,
1.672039, 1.693673, 1.544367, 1, 0, 0, 1, 1,
1.67356, 0.6015944, 1.103958, 1, 0, 0, 1, 1,
1.677311, -0.1498215, 0.7829586, 1, 0, 0, 1, 1,
1.720307, -0.4593651, -0.02222848, 1, 0, 0, 1, 1,
1.724803, -0.1898983, 1.014442, 0, 0, 0, 1, 1,
1.73037, 0.235529, 0.9780394, 0, 0, 0, 1, 1,
1.754453, -0.98619, 1.307815, 0, 0, 0, 1, 1,
1.782558, -1.663878, 2.891404, 0, 0, 0, 1, 1,
1.805714, -0.6100991, -0.06293349, 0, 0, 0, 1, 1,
1.822779, 1.160166, -0.7512031, 0, 0, 0, 1, 1,
1.843585, 0.01993553, 2.733763, 0, 0, 0, 1, 1,
1.844277, -0.2374447, 2.062057, 1, 1, 1, 1, 1,
1.865686, -0.984291, 2.865279, 1, 1, 1, 1, 1,
1.873528, -0.7500789, 2.795204, 1, 1, 1, 1, 1,
1.894462, -0.6774961, 0.6893046, 1, 1, 1, 1, 1,
1.913937, -0.1827981, 2.366861, 1, 1, 1, 1, 1,
1.913983, -0.8287153, 2.914486, 1, 1, 1, 1, 1,
1.938033, 0.5779314, 2.201567, 1, 1, 1, 1, 1,
1.944762, 0.5862166, 2.135588, 1, 1, 1, 1, 1,
1.949979, -0.8550436, 0.4928151, 1, 1, 1, 1, 1,
1.951916, -1.618385, 1.475325, 1, 1, 1, 1, 1,
1.957035, 1.933052, -0.5622236, 1, 1, 1, 1, 1,
1.97714, -0.467599, 2.366758, 1, 1, 1, 1, 1,
1.985771, 0.1235863, 2.16744, 1, 1, 1, 1, 1,
1.9952, -1.284894, 2.165095, 1, 1, 1, 1, 1,
2.00532, -0.6549191, 1.163519, 1, 1, 1, 1, 1,
2.007406, 0.3380533, 2.424662, 0, 0, 1, 1, 1,
2.033975, 2.036822, 1.750022, 1, 0, 0, 1, 1,
2.05238, -0.4468031, 2.210035, 1, 0, 0, 1, 1,
2.09454, 0.1147541, 2.417051, 1, 0, 0, 1, 1,
2.096222, 0.6740311, -0.06866337, 1, 0, 0, 1, 1,
2.15354, 0.5012028, 1.438912, 1, 0, 0, 1, 1,
2.184183, -1.591575, 1.289562, 0, 0, 0, 1, 1,
2.189853, -0.7212358, -0.5061181, 0, 0, 0, 1, 1,
2.192698, 0.1939166, 0.9066882, 0, 0, 0, 1, 1,
2.248924, -0.7280495, 1.911308, 0, 0, 0, 1, 1,
2.341925, -0.5175177, 1.612797, 0, 0, 0, 1, 1,
2.359094, -0.5439544, 2.075858, 0, 0, 0, 1, 1,
2.383489, -1.57134, 4.444608, 0, 0, 0, 1, 1,
2.435844, -0.04332352, 0.9713061, 1, 1, 1, 1, 1,
2.467747, -1.359032, 1.303399, 1, 1, 1, 1, 1,
2.509732, -0.5362568, 2.313804, 1, 1, 1, 1, 1,
2.519962, -0.5372976, 1.343304, 1, 1, 1, 1, 1,
2.588917, -0.4644205, 3.200405, 1, 1, 1, 1, 1,
2.848799, 0.1948614, 2.932911, 1, 1, 1, 1, 1,
4.020007, 0.2243136, 1.380305, 1, 1, 1, 1, 1
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
var radius = 9.748957;
var distance = 34.2428;
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
mvMatrix.translate( -0.5335397, 0.7383002, -0.519707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2428);
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