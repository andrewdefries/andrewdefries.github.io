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
-2.727812, -0.1311491, -0.1642326, 1, 0, 0, 1,
-2.626815, 0.09768965, -2.419977, 1, 0.007843138, 0, 1,
-2.586007, 0.8273557, -2.718392, 1, 0.01176471, 0, 1,
-2.506114, -0.5092297, -2.035831, 1, 0.01960784, 0, 1,
-2.496445, 0.2444158, -1.614181, 1, 0.02352941, 0, 1,
-2.448546, 0.378848, -1.284577, 1, 0.03137255, 0, 1,
-2.357102, -1.415668, -1.875262, 1, 0.03529412, 0, 1,
-2.320929, -0.3456101, -3.003968, 1, 0.04313726, 0, 1,
-2.286667, 1.510625, -0.6971087, 1, 0.04705882, 0, 1,
-2.254683, -0.350078, -1.157968, 1, 0.05490196, 0, 1,
-2.244328, 0.04319949, -1.661962, 1, 0.05882353, 0, 1,
-2.205954, 2.270823, -0.8530653, 1, 0.06666667, 0, 1,
-2.186617, -2.285476, -1.5006, 1, 0.07058824, 0, 1,
-2.119989, -0.9669785, -2.115154, 1, 0.07843138, 0, 1,
-2.061255, 0.06903825, -2.300608, 1, 0.08235294, 0, 1,
-2.037683, 0.9416608, -0.5608394, 1, 0.09019608, 0, 1,
-2.033977, -0.3474976, -4.400581, 1, 0.09411765, 0, 1,
-2.017711, -0.9837221, -0.4443362, 1, 0.1019608, 0, 1,
-2.002546, -0.9334152, -3.07763, 1, 0.1098039, 0, 1,
-1.981433, -0.4107012, -2.23433, 1, 0.1137255, 0, 1,
-1.957395, 0.8661354, -0.4828525, 1, 0.1215686, 0, 1,
-1.946008, 1.960247, -0.720386, 1, 0.1254902, 0, 1,
-1.934377, 0.6437601, 0.6169562, 1, 0.1333333, 0, 1,
-1.917244, 1.113472, -1.997239, 1, 0.1372549, 0, 1,
-1.91717, 1.853816, 0.9085463, 1, 0.145098, 0, 1,
-1.911505, 1.428305, -1.58911, 1, 0.1490196, 0, 1,
-1.897761, -1.739559, -4.006565, 1, 0.1568628, 0, 1,
-1.889824, 0.8597245, -0.9293215, 1, 0.1607843, 0, 1,
-1.878268, 0.3232174, -0.6375831, 1, 0.1686275, 0, 1,
-1.868378, 0.8536206, -2.669514, 1, 0.172549, 0, 1,
-1.866821, 2.653229, 0.02713167, 1, 0.1803922, 0, 1,
-1.849083, -0.7953543, -3.368406, 1, 0.1843137, 0, 1,
-1.844028, 0.6224783, -1.195144, 1, 0.1921569, 0, 1,
-1.825737, -1.446313, -3.590534, 1, 0.1960784, 0, 1,
-1.809648, 0.8237191, -1.057767, 1, 0.2039216, 0, 1,
-1.800623, -1.181706, -2.428907, 1, 0.2117647, 0, 1,
-1.76521, -1.04421, -1.011696, 1, 0.2156863, 0, 1,
-1.761024, 0.01503283, -1.911655, 1, 0.2235294, 0, 1,
-1.751242, -0.6776193, -0.1732528, 1, 0.227451, 0, 1,
-1.745027, 1.474535, 0.908025, 1, 0.2352941, 0, 1,
-1.744969, -0.6094297, -1.787249, 1, 0.2392157, 0, 1,
-1.725993, 0.8281422, -0.2911012, 1, 0.2470588, 0, 1,
-1.721926, -1.538236, -2.181282, 1, 0.2509804, 0, 1,
-1.721713, -0.6358755, -2.420864, 1, 0.2588235, 0, 1,
-1.703976, -0.09179089, -1.66657, 1, 0.2627451, 0, 1,
-1.698399, 1.223115, -1.849023, 1, 0.2705882, 0, 1,
-1.693833, -0.1855868, -1.988272, 1, 0.2745098, 0, 1,
-1.692058, 0.6794254, -1.372353, 1, 0.282353, 0, 1,
-1.677214, -0.613446, -1.88736, 1, 0.2862745, 0, 1,
-1.671677, 0.2980459, -2.282832, 1, 0.2941177, 0, 1,
-1.668931, -0.7342243, -3.647536, 1, 0.3019608, 0, 1,
-1.625407, -1.083317, -2.168975, 1, 0.3058824, 0, 1,
-1.620379, 1.306451, -0.4257374, 1, 0.3137255, 0, 1,
-1.598755, 1.328133, 0.05419965, 1, 0.3176471, 0, 1,
-1.593948, -0.779381, -1.862753, 1, 0.3254902, 0, 1,
-1.593644, 1.545515, -1.698994, 1, 0.3294118, 0, 1,
-1.58592, -1.29822, -2.789364, 1, 0.3372549, 0, 1,
-1.573238, -1.124659, -0.08203533, 1, 0.3411765, 0, 1,
-1.563038, 2.012269, -0.951779, 1, 0.3490196, 0, 1,
-1.553811, 2.047527, -0.9262722, 1, 0.3529412, 0, 1,
-1.553531, -0.7431483, -2.948489, 1, 0.3607843, 0, 1,
-1.53109, 0.2952068, -0.06317971, 1, 0.3647059, 0, 1,
-1.529723, 2.417024, -0.05863571, 1, 0.372549, 0, 1,
-1.52913, 0.7695472, -1.841655, 1, 0.3764706, 0, 1,
-1.52663, 0.3592435, -2.921109, 1, 0.3843137, 0, 1,
-1.520781, 0.5998634, -1.055929, 1, 0.3882353, 0, 1,
-1.509303, -1.434467, -3.144207, 1, 0.3960784, 0, 1,
-1.507366, -0.1143009, -0.9982123, 1, 0.4039216, 0, 1,
-1.5015, -0.8797756, -1.93746, 1, 0.4078431, 0, 1,
-1.496384, 1.316769, -1.159765, 1, 0.4156863, 0, 1,
-1.488601, -0.1560145, -1.324878, 1, 0.4196078, 0, 1,
-1.487297, -0.8793191, -4.361494, 1, 0.427451, 0, 1,
-1.486901, 0.1249455, -1.731652, 1, 0.4313726, 0, 1,
-1.471283, 1.485855, -0.06610788, 1, 0.4392157, 0, 1,
-1.468114, -0.2908621, -0.9964585, 1, 0.4431373, 0, 1,
-1.460545, 0.006538763, -2.662827, 1, 0.4509804, 0, 1,
-1.456635, -1.901334, -1.887882, 1, 0.454902, 0, 1,
-1.454275, -0.2612582, 0.8096183, 1, 0.4627451, 0, 1,
-1.453878, 0.1940918, -1.308547, 1, 0.4666667, 0, 1,
-1.452843, -0.009122148, -2.35632, 1, 0.4745098, 0, 1,
-1.439815, 0.2331214, -0.7869667, 1, 0.4784314, 0, 1,
-1.439019, 0.2367845, -0.5624253, 1, 0.4862745, 0, 1,
-1.433708, 0.3210841, -1.910462, 1, 0.4901961, 0, 1,
-1.41919, -1.355907, -3.486106, 1, 0.4980392, 0, 1,
-1.416895, 1.829257, 0.3754307, 1, 0.5058824, 0, 1,
-1.395601, 1.870816, -0.5110897, 1, 0.509804, 0, 1,
-1.392692, 0.967181, -0.4037794, 1, 0.5176471, 0, 1,
-1.39007, 1.035038, -1.205595, 1, 0.5215687, 0, 1,
-1.388038, -1.708611, -2.011842, 1, 0.5294118, 0, 1,
-1.386847, -0.1016026, -0.4700948, 1, 0.5333334, 0, 1,
-1.384429, 0.2464153, -1.111946, 1, 0.5411765, 0, 1,
-1.378411, 0.2293845, -1.119164, 1, 0.5450981, 0, 1,
-1.363658, 0.5661129, -1.91621, 1, 0.5529412, 0, 1,
-1.358448, 0.07416735, -0.09372164, 1, 0.5568628, 0, 1,
-1.344824, 1.0759, 0.1671892, 1, 0.5647059, 0, 1,
-1.340512, 0.4401281, -1.79002, 1, 0.5686275, 0, 1,
-1.333866, -0.7245618, -2.093525, 1, 0.5764706, 0, 1,
-1.308306, 0.6072421, -1.608252, 1, 0.5803922, 0, 1,
-1.307701, -0.4979778, -1.124604, 1, 0.5882353, 0, 1,
-1.303466, -1.224307, -0.689944, 1, 0.5921569, 0, 1,
-1.284833, 0.289539, 0.09106211, 1, 0.6, 0, 1,
-1.284266, -0.4519083, -1.377409, 1, 0.6078432, 0, 1,
-1.276988, 2.114102, -1.228207, 1, 0.6117647, 0, 1,
-1.267663, 0.5899754, 0.2731378, 1, 0.6196079, 0, 1,
-1.260031, 0.3632832, -1.016153, 1, 0.6235294, 0, 1,
-1.245473, 0.4323815, -2.197536, 1, 0.6313726, 0, 1,
-1.229259, -0.7401989, -3.229034, 1, 0.6352941, 0, 1,
-1.215019, -0.524501, -2.226359, 1, 0.6431373, 0, 1,
-1.212418, 0.2788267, -1.408726, 1, 0.6470588, 0, 1,
-1.209055, 0.2646794, 0.01589935, 1, 0.654902, 0, 1,
-1.207995, -2.988931, -2.968839, 1, 0.6588235, 0, 1,
-1.202267, -0.01344027, -1.770581, 1, 0.6666667, 0, 1,
-1.201338, -0.1799805, -1.226012, 1, 0.6705883, 0, 1,
-1.199487, 0.3052755, -0.7285756, 1, 0.6784314, 0, 1,
-1.196622, 0.7198394, -0.5102534, 1, 0.682353, 0, 1,
-1.189156, -0.320285, -4.323565, 1, 0.6901961, 0, 1,
-1.186862, 0.9149161, 1.572133, 1, 0.6941177, 0, 1,
-1.183749, 0.8636785, -1.614718, 1, 0.7019608, 0, 1,
-1.183495, 1.531827, -0.1090494, 1, 0.7098039, 0, 1,
-1.175043, 0.2733734, -1.644349, 1, 0.7137255, 0, 1,
-1.174182, 1.963748, -1.001612, 1, 0.7215686, 0, 1,
-1.171464, -1.258952, -3.662953, 1, 0.7254902, 0, 1,
-1.171175, -1.010877, -1.577653, 1, 0.7333333, 0, 1,
-1.171014, -1.087977, -1.116559, 1, 0.7372549, 0, 1,
-1.168484, 0.5331244, -0.7630655, 1, 0.7450981, 0, 1,
-1.167836, -0.6121325, -2.041244, 1, 0.7490196, 0, 1,
-1.166303, 1.668364, 1.489868, 1, 0.7568628, 0, 1,
-1.160278, 0.07685746, -1.21997, 1, 0.7607843, 0, 1,
-1.148909, -0.6067295, -3.076838, 1, 0.7686275, 0, 1,
-1.143208, 0.35371, -1.969895, 1, 0.772549, 0, 1,
-1.142157, -0.2978528, -1.568643, 1, 0.7803922, 0, 1,
-1.131495, -2.352472, -4.723528, 1, 0.7843137, 0, 1,
-1.127429, 0.1272756, -2.071587, 1, 0.7921569, 0, 1,
-1.127078, -0.6067398, -2.896558, 1, 0.7960784, 0, 1,
-1.12665, 0.8967261, 0.1495515, 1, 0.8039216, 0, 1,
-1.126427, 0.3183004, -0.3094296, 1, 0.8117647, 0, 1,
-1.123084, 0.2893814, -1.457995, 1, 0.8156863, 0, 1,
-1.112558, -2.12701, -4.968323, 1, 0.8235294, 0, 1,
-1.105448, 2.018033, -0.3000095, 1, 0.827451, 0, 1,
-1.099311, 0.931108, 0.5982874, 1, 0.8352941, 0, 1,
-1.09679, -0.06364118, -1.500276, 1, 0.8392157, 0, 1,
-1.096404, -0.6599079, -0.3047335, 1, 0.8470588, 0, 1,
-1.093742, -0.4687182, -2.117772, 1, 0.8509804, 0, 1,
-1.089794, 0.5895283, -0.11547, 1, 0.8588235, 0, 1,
-1.080213, -1.422958, -2.218845, 1, 0.8627451, 0, 1,
-1.072336, -0.8254312, -0.7223176, 1, 0.8705882, 0, 1,
-1.054917, -0.2513719, -1.76287, 1, 0.8745098, 0, 1,
-1.051613, -1.093353, -2.995587, 1, 0.8823529, 0, 1,
-1.051044, -0.2657517, -0.3057812, 1, 0.8862745, 0, 1,
-1.047943, 0.7425813, -0.9942749, 1, 0.8941177, 0, 1,
-1.043305, 1.387134, -0.5910627, 1, 0.8980392, 0, 1,
-1.032992, -1.038265, -1.628253, 1, 0.9058824, 0, 1,
-1.026, -0.8545187, -2.742775, 1, 0.9137255, 0, 1,
-0.9996812, -0.5992936, -1.141599, 1, 0.9176471, 0, 1,
-0.9968295, 0.3758048, 0.1333006, 1, 0.9254902, 0, 1,
-0.9967498, 2.197994, -0.3895627, 1, 0.9294118, 0, 1,
-0.9926143, 0.8363646, -0.3518969, 1, 0.9372549, 0, 1,
-0.9905251, 0.009173269, -2.205804, 1, 0.9411765, 0, 1,
-0.9889049, -0.4771045, -3.375713, 1, 0.9490196, 0, 1,
-0.971309, -0.3376138, -2.589776, 1, 0.9529412, 0, 1,
-0.964538, 0.4459226, 0.3249615, 1, 0.9607843, 0, 1,
-0.9638527, 0.4102502, -2.282981, 1, 0.9647059, 0, 1,
-0.961511, 0.4044041, -1.47821, 1, 0.972549, 0, 1,
-0.9577653, 1.19847, -0.4954305, 1, 0.9764706, 0, 1,
-0.9542121, -0.6810873, -2.141408, 1, 0.9843137, 0, 1,
-0.9471092, -0.00015498, 0.06428896, 1, 0.9882353, 0, 1,
-0.9466962, 1.608643, -2.075817, 1, 0.9960784, 0, 1,
-0.9414935, 0.8682852, -1.821957, 0.9960784, 1, 0, 1,
-0.9362869, -0.2588962, -1.773382, 0.9921569, 1, 0, 1,
-0.9227199, -0.3211884, -0.2427935, 0.9843137, 1, 0, 1,
-0.9184645, 0.6600791, -1.566441, 0.9803922, 1, 0, 1,
-0.9172562, -0.5913084, -1.903232, 0.972549, 1, 0, 1,
-0.912177, 0.1354599, -2.033068, 0.9686275, 1, 0, 1,
-0.9114498, -0.6443042, -3.135528, 0.9607843, 1, 0, 1,
-0.910601, 0.872859, -0.06259774, 0.9568627, 1, 0, 1,
-0.9084494, 1.002274, 2.110453, 0.9490196, 1, 0, 1,
-0.9037057, 0.2502095, -2.747614, 0.945098, 1, 0, 1,
-0.9022757, -0.3413148, -1.413606, 0.9372549, 1, 0, 1,
-0.9016423, 0.4999051, -0.6397119, 0.9333333, 1, 0, 1,
-0.8992329, 0.1523457, 0.6529037, 0.9254902, 1, 0, 1,
-0.8951035, -0.7058179, -3.142123, 0.9215686, 1, 0, 1,
-0.8814929, 0.7440989, -0.2067387, 0.9137255, 1, 0, 1,
-0.8812153, -1.239014, -2.053471, 0.9098039, 1, 0, 1,
-0.8788571, 0.5507021, 0.9061708, 0.9019608, 1, 0, 1,
-0.8775368, 0.1518899, -2.052274, 0.8941177, 1, 0, 1,
-0.8740254, 0.5847069, -1.693148, 0.8901961, 1, 0, 1,
-0.870621, 0.3267841, -1.497113, 0.8823529, 1, 0, 1,
-0.8694071, -1.158046, -4.164896, 0.8784314, 1, 0, 1,
-0.8658951, 0.566004, -2.347272, 0.8705882, 1, 0, 1,
-0.8657594, 1.139167, -1.334606, 0.8666667, 1, 0, 1,
-0.8615161, -0.8651992, -1.904605, 0.8588235, 1, 0, 1,
-0.8580955, -1.141752, -3.039713, 0.854902, 1, 0, 1,
-0.8568945, -0.9814316, -3.730433, 0.8470588, 1, 0, 1,
-0.8542591, -0.7872503, -1.387092, 0.8431373, 1, 0, 1,
-0.851089, 0.3667823, 0.1383823, 0.8352941, 1, 0, 1,
-0.8502343, -2.804894, -3.940163, 0.8313726, 1, 0, 1,
-0.8501199, 0.3336759, -2.235507, 0.8235294, 1, 0, 1,
-0.8474534, -0.3854903, -3.833714, 0.8196079, 1, 0, 1,
-0.8470749, -1.049513, -2.070614, 0.8117647, 1, 0, 1,
-0.8333955, -0.3505396, -1.808727, 0.8078431, 1, 0, 1,
-0.8328509, -0.2984019, -3.459743, 0.8, 1, 0, 1,
-0.8322235, -0.8833903, -1.99618, 0.7921569, 1, 0, 1,
-0.8315793, 2.008336, -1.143435, 0.7882353, 1, 0, 1,
-0.8221821, -0.7989728, -2.88466, 0.7803922, 1, 0, 1,
-0.8218306, -0.2049569, -1.836738, 0.7764706, 1, 0, 1,
-0.8191167, -0.7671423, -1.617198, 0.7686275, 1, 0, 1,
-0.8186986, -0.1834265, -0.2893226, 0.7647059, 1, 0, 1,
-0.8178805, 0.5170912, -1.987543, 0.7568628, 1, 0, 1,
-0.8172696, -0.5806578, -2.158206, 0.7529412, 1, 0, 1,
-0.8069286, -0.7185549, -1.847566, 0.7450981, 1, 0, 1,
-0.8043872, -0.01019042, -1.746187, 0.7411765, 1, 0, 1,
-0.804085, 0.8968405, 0.2555209, 0.7333333, 1, 0, 1,
-0.8012211, -0.9074991, -2.133386, 0.7294118, 1, 0, 1,
-0.7935493, -0.1687749, -1.762793, 0.7215686, 1, 0, 1,
-0.7922878, 0.1571202, -1.068915, 0.7176471, 1, 0, 1,
-0.7902499, -0.1449496, -1.528625, 0.7098039, 1, 0, 1,
-0.7885697, -0.8086929, -2.053617, 0.7058824, 1, 0, 1,
-0.7879662, 2.096011, -1.248947, 0.6980392, 1, 0, 1,
-0.7788957, -0.2185139, -0.9899274, 0.6901961, 1, 0, 1,
-0.7753315, 0.08241117, -0.5816269, 0.6862745, 1, 0, 1,
-0.7733656, 0.1016462, -2.277697, 0.6784314, 1, 0, 1,
-0.7703293, 0.2050124, -0.2467329, 0.6745098, 1, 0, 1,
-0.769748, -1.467945, -1.109496, 0.6666667, 1, 0, 1,
-0.7672225, -0.5172548, -1.500998, 0.6627451, 1, 0, 1,
-0.7625206, -0.3854313, -2.594801, 0.654902, 1, 0, 1,
-0.7620813, -1.445351, -3.48065, 0.6509804, 1, 0, 1,
-0.75371, -1.20275, -2.598598, 0.6431373, 1, 0, 1,
-0.7489572, 0.86134, -1.898858, 0.6392157, 1, 0, 1,
-0.744696, -1.878423, -3.751445, 0.6313726, 1, 0, 1,
-0.7431378, 0.1147706, -1.650308, 0.627451, 1, 0, 1,
-0.7353215, 0.8403115, 0.3680274, 0.6196079, 1, 0, 1,
-0.7265905, -1.164985, -4.244383, 0.6156863, 1, 0, 1,
-0.7262163, 1.610795, -0.5622945, 0.6078432, 1, 0, 1,
-0.724512, -1.91475, -2.022644, 0.6039216, 1, 0, 1,
-0.718937, 0.3152686, -2.266364, 0.5960785, 1, 0, 1,
-0.7178972, 2.683582, -0.400627, 0.5882353, 1, 0, 1,
-0.7093645, -1.677885, -2.100974, 0.5843138, 1, 0, 1,
-0.7021669, -0.3238354, -3.320419, 0.5764706, 1, 0, 1,
-0.6906563, 0.6946143, -0.4110247, 0.572549, 1, 0, 1,
-0.6838241, -0.826789, -2.011326, 0.5647059, 1, 0, 1,
-0.6778366, 1.480252, -1.273868, 0.5607843, 1, 0, 1,
-0.6765525, -1.573395, -4.220344, 0.5529412, 1, 0, 1,
-0.6681256, -1.688983, -2.281224, 0.5490196, 1, 0, 1,
-0.6644464, -0.3958643, -2.36529, 0.5411765, 1, 0, 1,
-0.6643953, -0.5938362, -3.232019, 0.5372549, 1, 0, 1,
-0.6637327, -2.250159, -2.079746, 0.5294118, 1, 0, 1,
-0.6624312, 0.3377372, -1.947914, 0.5254902, 1, 0, 1,
-0.6623625, -2.493633, -3.800579, 0.5176471, 1, 0, 1,
-0.6613749, -0.2651652, -2.402869, 0.5137255, 1, 0, 1,
-0.6598125, -1.449986, -1.142894, 0.5058824, 1, 0, 1,
-0.6592746, 1.846151, 0.04854359, 0.5019608, 1, 0, 1,
-0.6584625, -0.005787035, -1.278139, 0.4941176, 1, 0, 1,
-0.6569183, -0.4081217, -1.615088, 0.4862745, 1, 0, 1,
-0.6557111, 2.323475, -1.493633, 0.4823529, 1, 0, 1,
-0.6420081, -0.7458088, -3.65757, 0.4745098, 1, 0, 1,
-0.6393214, 1.043207, -0.8381425, 0.4705882, 1, 0, 1,
-0.6382937, 0.7046865, -0.2039123, 0.4627451, 1, 0, 1,
-0.6363608, -0.1614452, -2.640351, 0.4588235, 1, 0, 1,
-0.6239653, 0.3072051, -3.07447, 0.4509804, 1, 0, 1,
-0.6222101, -0.4600283, -3.787643, 0.4470588, 1, 0, 1,
-0.6218176, -1.755226, -4.327964, 0.4392157, 1, 0, 1,
-0.6094255, -0.05259066, -0.9498566, 0.4352941, 1, 0, 1,
-0.6050349, -0.9486509, -2.370332, 0.427451, 1, 0, 1,
-0.6018167, 0.3458245, -2.797868, 0.4235294, 1, 0, 1,
-0.6006724, 0.086514, -1.662728, 0.4156863, 1, 0, 1,
-0.600422, 0.03792619, -2.274494, 0.4117647, 1, 0, 1,
-0.5993121, -0.06400091, -1.490935, 0.4039216, 1, 0, 1,
-0.5894518, 1.06755, 0.7976944, 0.3960784, 1, 0, 1,
-0.5873498, -0.5347684, -2.194587, 0.3921569, 1, 0, 1,
-0.5864087, -0.4726776, -1.943321, 0.3843137, 1, 0, 1,
-0.5832931, 1.892572, 0.5388527, 0.3803922, 1, 0, 1,
-0.5823632, 1.302246, 0.4361856, 0.372549, 1, 0, 1,
-0.5819385, -1.008049, -2.316831, 0.3686275, 1, 0, 1,
-0.580285, -0.18593, -2.684947, 0.3607843, 1, 0, 1,
-0.5658951, -0.1472563, -4.462673, 0.3568628, 1, 0, 1,
-0.5645472, 0.07599829, -1.145902, 0.3490196, 1, 0, 1,
-0.5626076, 0.6733899, -1.238838, 0.345098, 1, 0, 1,
-0.5594231, -1.151825, -2.057401, 0.3372549, 1, 0, 1,
-0.5588233, -1.304726, -3.372115, 0.3333333, 1, 0, 1,
-0.5574518, 1.337787, -0.7378611, 0.3254902, 1, 0, 1,
-0.5525636, -0.6985642, -1.674463, 0.3215686, 1, 0, 1,
-0.5494636, 1.128797, -0.7496901, 0.3137255, 1, 0, 1,
-0.5481361, -0.1755845, -0.5098918, 0.3098039, 1, 0, 1,
-0.5469208, -0.985829, -3.949912, 0.3019608, 1, 0, 1,
-0.5446485, 1.542022, 0.587554, 0.2941177, 1, 0, 1,
-0.5403033, 0.03664177, -0.7192858, 0.2901961, 1, 0, 1,
-0.5381336, -1.28378, -1.324797, 0.282353, 1, 0, 1,
-0.5377654, -0.5601285, -3.11372, 0.2784314, 1, 0, 1,
-0.5377436, 0.8139734, -0.6251695, 0.2705882, 1, 0, 1,
-0.5369423, 1.527986, -1.439764, 0.2666667, 1, 0, 1,
-0.5352808, 0.03622048, -3.274072, 0.2588235, 1, 0, 1,
-0.5231943, 0.604584, 0.2887779, 0.254902, 1, 0, 1,
-0.5221443, -0.612749, -2.067576, 0.2470588, 1, 0, 1,
-0.5213087, -0.5298302, -1.648827, 0.2431373, 1, 0, 1,
-0.5143695, 0.441452, 0.6887909, 0.2352941, 1, 0, 1,
-0.5141643, 0.7718129, -1.522522, 0.2313726, 1, 0, 1,
-0.5137084, -1.132829, -2.712425, 0.2235294, 1, 0, 1,
-0.5126864, 0.8193911, -0.3057463, 0.2196078, 1, 0, 1,
-0.5105001, -1.791584, -2.722841, 0.2117647, 1, 0, 1,
-0.4964915, 0.5091975, -0.6453742, 0.2078431, 1, 0, 1,
-0.492389, -1.483027, -4.198983, 0.2, 1, 0, 1,
-0.4900143, 0.01333886, -0.4262535, 0.1921569, 1, 0, 1,
-0.4854823, 0.3593954, -0.2867917, 0.1882353, 1, 0, 1,
-0.4838111, -0.001820293, -0.8844966, 0.1803922, 1, 0, 1,
-0.483284, 1.02044, 0.2075867, 0.1764706, 1, 0, 1,
-0.4734878, -0.5895347, -1.121594, 0.1686275, 1, 0, 1,
-0.4710933, -1.720621, -3.235999, 0.1647059, 1, 0, 1,
-0.47084, -0.5380498, -2.390306, 0.1568628, 1, 0, 1,
-0.4699599, -0.8639799, -2.936092, 0.1529412, 1, 0, 1,
-0.4648214, -0.008953512, -1.152838, 0.145098, 1, 0, 1,
-0.4625335, 0.1735315, -0.3499736, 0.1411765, 1, 0, 1,
-0.4590238, -0.5389933, -3.201643, 0.1333333, 1, 0, 1,
-0.457384, 0.5881447, -0.7955089, 0.1294118, 1, 0, 1,
-0.4494701, -0.4922647, -2.516361, 0.1215686, 1, 0, 1,
-0.4489588, 0.1681746, -1.750558, 0.1176471, 1, 0, 1,
-0.4488797, 0.834689, -3.220128, 0.1098039, 1, 0, 1,
-0.4444095, 0.4478768, 0.3442059, 0.1058824, 1, 0, 1,
-0.4383482, -0.9611212, -0.7748326, 0.09803922, 1, 0, 1,
-0.4349014, -0.6595347, -3.420707, 0.09019608, 1, 0, 1,
-0.434493, 0.1226858, -1.67001, 0.08627451, 1, 0, 1,
-0.4341191, -1.938773, -3.496798, 0.07843138, 1, 0, 1,
-0.4297937, -1.126062, -1.139163, 0.07450981, 1, 0, 1,
-0.4291219, 0.529198, -0.6837294, 0.06666667, 1, 0, 1,
-0.4254795, 0.1114388, 0.3662334, 0.0627451, 1, 0, 1,
-0.4218783, 1.838794, -0.7586257, 0.05490196, 1, 0, 1,
-0.4213324, -0.2095048, -1.469897, 0.05098039, 1, 0, 1,
-0.4049791, 1.408808, -0.3043763, 0.04313726, 1, 0, 1,
-0.404301, 0.6398129, -1.053061, 0.03921569, 1, 0, 1,
-0.4036487, -1.174648, -2.953166, 0.03137255, 1, 0, 1,
-0.4035038, -0.03694921, -2.498489, 0.02745098, 1, 0, 1,
-0.3998896, -0.7516521, -3.519881, 0.01960784, 1, 0, 1,
-0.3950268, 0.3519688, -1.409953, 0.01568628, 1, 0, 1,
-0.3938978, -1.774911, -3.92961, 0.007843138, 1, 0, 1,
-0.3845744, -1.090685, -2.558879, 0.003921569, 1, 0, 1,
-0.381062, 0.1156389, -2.008443, 0, 1, 0.003921569, 1,
-0.3792716, 1.269372, -2.442171, 0, 1, 0.01176471, 1,
-0.3768404, 1.941272, 0.9115769, 0, 1, 0.01568628, 1,
-0.3738407, 1.083137, 0.6715008, 0, 1, 0.02352941, 1,
-0.3695666, 2.051589, -0.245636, 0, 1, 0.02745098, 1,
-0.3670667, -0.7058775, -3.225092, 0, 1, 0.03529412, 1,
-0.3665996, -1.007404, -1.038098, 0, 1, 0.03921569, 1,
-0.3633825, -0.8475986, -2.600662, 0, 1, 0.04705882, 1,
-0.3613689, 0.08963572, -1.671491, 0, 1, 0.05098039, 1,
-0.3594078, 0.3088091, -1.471366, 0, 1, 0.05882353, 1,
-0.3569422, 1.217959, -1.197058, 0, 1, 0.0627451, 1,
-0.3539258, -1.77395, -2.598865, 0, 1, 0.07058824, 1,
-0.3520347, -0.8553232, -3.698517, 0, 1, 0.07450981, 1,
-0.3484635, 0.1860054, -1.702584, 0, 1, 0.08235294, 1,
-0.3434654, -1.404383, -3.146455, 0, 1, 0.08627451, 1,
-0.3432726, -0.8964461, -1.621337, 0, 1, 0.09411765, 1,
-0.3376642, 1.176168, 1.091137, 0, 1, 0.1019608, 1,
-0.33753, -0.6828752, -1.003727, 0, 1, 0.1058824, 1,
-0.335978, -0.1865479, -2.479865, 0, 1, 0.1137255, 1,
-0.3285113, -0.2326272, -0.02798883, 0, 1, 0.1176471, 1,
-0.3253025, -2.225682, -4.182547, 0, 1, 0.1254902, 1,
-0.324589, -2.359851, -3.203435, 0, 1, 0.1294118, 1,
-0.3156928, 0.9039903, -1.317704, 0, 1, 0.1372549, 1,
-0.3138985, -0.5580528, -2.626406, 0, 1, 0.1411765, 1,
-0.299326, -0.1690813, -4.019323, 0, 1, 0.1490196, 1,
-0.2984999, -1.575918, -2.451956, 0, 1, 0.1529412, 1,
-0.2948196, 0.05581119, -2.883623, 0, 1, 0.1607843, 1,
-0.2943158, -0.5292112, -4.63016, 0, 1, 0.1647059, 1,
-0.2940632, 0.06562702, -1.856761, 0, 1, 0.172549, 1,
-0.2896202, -0.06580072, -2.706019, 0, 1, 0.1764706, 1,
-0.2883209, -1.115656, -3.314593, 0, 1, 0.1843137, 1,
-0.2852049, -1.042966, -0.537972, 0, 1, 0.1882353, 1,
-0.2830791, 0.06789137, -1.943394, 0, 1, 0.1960784, 1,
-0.2814235, 0.6167853, -0.2031243, 0, 1, 0.2039216, 1,
-0.2754715, 1.356966, -0.04604106, 0, 1, 0.2078431, 1,
-0.273224, 0.6986794, 0.2718221, 0, 1, 0.2156863, 1,
-0.2635204, -0.9857159, -3.439927, 0, 1, 0.2196078, 1,
-0.2630495, 0.6565395, -0.1993548, 0, 1, 0.227451, 1,
-0.2608833, -2.244198, -3.226575, 0, 1, 0.2313726, 1,
-0.2533295, -0.354012, -2.772381, 0, 1, 0.2392157, 1,
-0.2501981, -0.6709217, -3.777944, 0, 1, 0.2431373, 1,
-0.2500912, 1.101551, -0.03763437, 0, 1, 0.2509804, 1,
-0.2461501, 1.31358, -1.416177, 0, 1, 0.254902, 1,
-0.2457354, 1.421266, -0.9521213, 0, 1, 0.2627451, 1,
-0.2440813, -0.6845625, -1.661558, 0, 1, 0.2666667, 1,
-0.2374659, -1.322256, -4.493419, 0, 1, 0.2745098, 1,
-0.2372464, 0.2481355, 0.1471761, 0, 1, 0.2784314, 1,
-0.233972, 0.02805484, -0.3252991, 0, 1, 0.2862745, 1,
-0.2318279, -0.0811707, -0.09656192, 0, 1, 0.2901961, 1,
-0.2295744, -1.06275, -4.045704, 0, 1, 0.2980392, 1,
-0.2282563, -0.5978003, -2.489528, 0, 1, 0.3058824, 1,
-0.2268532, -0.926892, -2.136882, 0, 1, 0.3098039, 1,
-0.2258789, 1.220328, -1.353604, 0, 1, 0.3176471, 1,
-0.2246575, 0.170282, 0.5776702, 0, 1, 0.3215686, 1,
-0.2142267, 1.467432, 0.632904, 0, 1, 0.3294118, 1,
-0.2133271, 1.182365, -0.2408432, 0, 1, 0.3333333, 1,
-0.2078389, -1.782313, -3.951458, 0, 1, 0.3411765, 1,
-0.2037205, -0.9274379, -4.123427, 0, 1, 0.345098, 1,
-0.2024322, -0.1998904, -3.54739, 0, 1, 0.3529412, 1,
-0.2016087, -0.07095174, -1.96708, 0, 1, 0.3568628, 1,
-0.1988086, -0.9525706, -2.716199, 0, 1, 0.3647059, 1,
-0.1975114, -0.6199418, -2.85315, 0, 1, 0.3686275, 1,
-0.197066, 1.025929, -1.379646, 0, 1, 0.3764706, 1,
-0.196168, 0.2422458, -1.721152, 0, 1, 0.3803922, 1,
-0.1943111, 1.290692, -0.248519, 0, 1, 0.3882353, 1,
-0.1942082, -1.354863, -3.719754, 0, 1, 0.3921569, 1,
-0.1924337, 0.3850532, -1.07719, 0, 1, 0.4, 1,
-0.1836587, -1.009764, -3.780157, 0, 1, 0.4078431, 1,
-0.1828771, 0.750336, -0.9429805, 0, 1, 0.4117647, 1,
-0.1818201, 0.7565275, -2.380905, 0, 1, 0.4196078, 1,
-0.181501, 1.138722, -0.4343775, 0, 1, 0.4235294, 1,
-0.1802152, 0.2427518, -1.162379, 0, 1, 0.4313726, 1,
-0.1759886, -0.78708, -3.256382, 0, 1, 0.4352941, 1,
-0.1753259, -0.3779493, -1.65366, 0, 1, 0.4431373, 1,
-0.1715154, 0.8795179, 0.7270526, 0, 1, 0.4470588, 1,
-0.1651047, 2.820008, 0.07041214, 0, 1, 0.454902, 1,
-0.1604355, 0.1280842, 0.08673157, 0, 1, 0.4588235, 1,
-0.1533814, -0.1856284, -3.247823, 0, 1, 0.4666667, 1,
-0.1529319, -0.9991229, -3.393848, 0, 1, 0.4705882, 1,
-0.1495268, -0.2663358, -3.594659, 0, 1, 0.4784314, 1,
-0.1482584, 1.818765, -0.5408734, 0, 1, 0.4823529, 1,
-0.1470419, -0.5622036, -4.020629, 0, 1, 0.4901961, 1,
-0.1458858, -0.608152, -2.943903, 0, 1, 0.4941176, 1,
-0.1453809, 0.1570108, 0.4423208, 0, 1, 0.5019608, 1,
-0.1430532, -0.05921013, -2.256533, 0, 1, 0.509804, 1,
-0.1428005, 1.363534, -0.5080894, 0, 1, 0.5137255, 1,
-0.1398993, 0.210796, -1.04668, 0, 1, 0.5215687, 1,
-0.1357095, -0.3727475, -2.111412, 0, 1, 0.5254902, 1,
-0.1287902, -1.062271, -2.912253, 0, 1, 0.5333334, 1,
-0.124435, 0.6833054, -0.1301206, 0, 1, 0.5372549, 1,
-0.1228728, 1.4768, 0.2846137, 0, 1, 0.5450981, 1,
-0.1208683, 0.555876, 0.1636938, 0, 1, 0.5490196, 1,
-0.1197169, 1.918768, 0.145676, 0, 1, 0.5568628, 1,
-0.1115486, -1.287279, -3.95506, 0, 1, 0.5607843, 1,
-0.1113588, 1.295169, 1.431607, 0, 1, 0.5686275, 1,
-0.106189, -0.05814464, -1.667059, 0, 1, 0.572549, 1,
-0.1054145, 0.710322, -0.4511868, 0, 1, 0.5803922, 1,
-0.1033334, -0.6044767, -5.444338, 0, 1, 0.5843138, 1,
-0.1016048, 1.10207, 0.4475898, 0, 1, 0.5921569, 1,
-0.09769052, -0.767687, -2.77014, 0, 1, 0.5960785, 1,
-0.09399109, -0.3991126, -0.7337694, 0, 1, 0.6039216, 1,
-0.09355734, 0.5367352, 0.4753784, 0, 1, 0.6117647, 1,
-0.09002661, 0.1980374, 0.4881529, 0, 1, 0.6156863, 1,
-0.08660792, -0.6170117, -4.041036, 0, 1, 0.6235294, 1,
-0.08621592, 0.3566973, 0.2304772, 0, 1, 0.627451, 1,
-0.08600667, -0.04570475, -1.371959, 0, 1, 0.6352941, 1,
-0.08173171, -0.4150087, -2.254214, 0, 1, 0.6392157, 1,
-0.08139125, -1.650963, -2.082868, 0, 1, 0.6470588, 1,
-0.07703563, 0.3211038, -0.5107771, 0, 1, 0.6509804, 1,
-0.07533424, -0.6983117, -2.953458, 0, 1, 0.6588235, 1,
-0.07288912, -0.9630276, -4.960968, 0, 1, 0.6627451, 1,
-0.07145164, -1.927879, -2.768371, 0, 1, 0.6705883, 1,
-0.06839772, -0.07341076, -2.470911, 0, 1, 0.6745098, 1,
-0.06737235, -1.528482, -2.495918, 0, 1, 0.682353, 1,
-0.06616394, 0.6871001, -0.4750911, 0, 1, 0.6862745, 1,
-0.06328703, 0.1850418, 0.01044947, 0, 1, 0.6941177, 1,
-0.06098307, -0.6423821, -3.614467, 0, 1, 0.7019608, 1,
-0.06095423, 0.3922893, -0.03996486, 0, 1, 0.7058824, 1,
-0.05988662, -0.4731192, -3.685415, 0, 1, 0.7137255, 1,
-0.05011571, -1.057607, -2.978277, 0, 1, 0.7176471, 1,
-0.04962846, -1.175469, -3.0487, 0, 1, 0.7254902, 1,
-0.0468282, -0.08575663, -2.276391, 0, 1, 0.7294118, 1,
-0.04339016, 0.7044082, -1.092782, 0, 1, 0.7372549, 1,
-0.03464321, -2.006613, -2.845327, 0, 1, 0.7411765, 1,
-0.03277089, -0.5622351, -3.492574, 0, 1, 0.7490196, 1,
-0.03085735, 0.06238171, 0.4863742, 0, 1, 0.7529412, 1,
-0.02946776, 2.143069, 0.7778348, 0, 1, 0.7607843, 1,
-0.0294677, 2.358894, 0.5895091, 0, 1, 0.7647059, 1,
-0.02639885, 2.71286, 1.609804, 0, 1, 0.772549, 1,
-0.02585206, -1.342654, -2.691825, 0, 1, 0.7764706, 1,
-0.01714201, -0.7246231, -2.389698, 0, 1, 0.7843137, 1,
-0.0156361, 0.2296016, 0.1798107, 0, 1, 0.7882353, 1,
-0.01469301, -0.4874, -2.295579, 0, 1, 0.7960784, 1,
-0.01285908, -0.2888484, -2.981628, 0, 1, 0.8039216, 1,
-0.01155475, 0.7130799, -0.7923037, 0, 1, 0.8078431, 1,
-0.01114843, -2.244464, -3.491321, 0, 1, 0.8156863, 1,
-0.003878074, 0.09739877, -1.143595, 0, 1, 0.8196079, 1,
-0.002813604, -0.2363356, -2.824684, 0, 1, 0.827451, 1,
-0.002775312, -0.3047062, -3.805284, 0, 1, 0.8313726, 1,
0.003938125, -2.531928, 3.640265, 0, 1, 0.8392157, 1,
0.006764788, -0.4315982, 5.368259, 0, 1, 0.8431373, 1,
0.01838487, -0.2037413, 2.754555, 0, 1, 0.8509804, 1,
0.02137091, -0.02832616, 1.885372, 0, 1, 0.854902, 1,
0.02227816, 0.1258924, 0.4995129, 0, 1, 0.8627451, 1,
0.02538865, -1.783646, 3.404114, 0, 1, 0.8666667, 1,
0.0280447, 2.137404, -0.4952796, 0, 1, 0.8745098, 1,
0.02900004, -0.3896748, 3.001801, 0, 1, 0.8784314, 1,
0.02923703, -0.8056821, 4.149529, 0, 1, 0.8862745, 1,
0.03339722, -0.2937109, 2.328693, 0, 1, 0.8901961, 1,
0.0346307, -0.6668196, 3.244299, 0, 1, 0.8980392, 1,
0.03766627, -0.6539867, 3.387039, 0, 1, 0.9058824, 1,
0.03995932, 0.4669397, 0.4497805, 0, 1, 0.9098039, 1,
0.03999158, -0.8891165, 4.103644, 0, 1, 0.9176471, 1,
0.04128652, 0.2434833, 1.958071, 0, 1, 0.9215686, 1,
0.04188007, -0.2176727, 5.082784, 0, 1, 0.9294118, 1,
0.04296412, -0.5055421, 2.440475, 0, 1, 0.9333333, 1,
0.04368094, -1.09534, 4.26038, 0, 1, 0.9411765, 1,
0.04450091, -0.6644287, 5.30502, 0, 1, 0.945098, 1,
0.04572947, 0.8187804, -0.762573, 0, 1, 0.9529412, 1,
0.05022295, -1.960984, 4.992537, 0, 1, 0.9568627, 1,
0.05372205, 2.689604, -0.003989265, 0, 1, 0.9647059, 1,
0.05842541, -0.2331052, 1.917213, 0, 1, 0.9686275, 1,
0.05848088, 0.473753, -0.1202081, 0, 1, 0.9764706, 1,
0.0652486, -0.1484443, 2.478145, 0, 1, 0.9803922, 1,
0.06632707, 0.01855915, 2.094249, 0, 1, 0.9882353, 1,
0.06879254, 0.2705604, -0.67844, 0, 1, 0.9921569, 1,
0.0689529, -0.04657354, 3.337989, 0, 1, 1, 1,
0.07236454, -1.38482, 2.826069, 0, 0.9921569, 1, 1,
0.07290564, 0.9590154, 1.448546, 0, 0.9882353, 1, 1,
0.07384264, 0.9249739, -0.1624817, 0, 0.9803922, 1, 1,
0.07586611, 1.887792, 0.1010809, 0, 0.9764706, 1, 1,
0.07707932, -0.7402653, 2.873975, 0, 0.9686275, 1, 1,
0.07762689, 2.006062, 1.564457, 0, 0.9647059, 1, 1,
0.0858677, -0.571341, 4.123443, 0, 0.9568627, 1, 1,
0.08914284, 0.4287757, 0.3603405, 0, 0.9529412, 1, 1,
0.09013368, -0.09868941, 2.696615, 0, 0.945098, 1, 1,
0.09061667, 0.6616249, 0.4451678, 0, 0.9411765, 1, 1,
0.0975092, -0.1125393, 1.879721, 0, 0.9333333, 1, 1,
0.1015236, 0.565055, -1.84122, 0, 0.9294118, 1, 1,
0.1058137, 0.6164119, -1.596842, 0, 0.9215686, 1, 1,
0.1059349, 1.272808, -1.529058, 0, 0.9176471, 1, 1,
0.1081529, 1.358112, -1.000922, 0, 0.9098039, 1, 1,
0.110333, 0.5651531, 1.394438, 0, 0.9058824, 1, 1,
0.1158434, -0.1424942, 2.563647, 0, 0.8980392, 1, 1,
0.1188186, -1.579643, 3.034448, 0, 0.8901961, 1, 1,
0.1193023, 0.2302761, 0.3026519, 0, 0.8862745, 1, 1,
0.1196921, -1.923684, 2.181658, 0, 0.8784314, 1, 1,
0.1211874, 0.5309268, -0.1958306, 0, 0.8745098, 1, 1,
0.1213438, -0.3889284, 4.159486, 0, 0.8666667, 1, 1,
0.1214051, 1.84771, -0.1682423, 0, 0.8627451, 1, 1,
0.1218781, -0.5459291, 2.15156, 0, 0.854902, 1, 1,
0.12391, 1.322838, 0.4624125, 0, 0.8509804, 1, 1,
0.123922, 0.4889784, 0.06349437, 0, 0.8431373, 1, 1,
0.1257523, -1.517238, 2.847742, 0, 0.8392157, 1, 1,
0.1257576, 2.543355, 1.13993, 0, 0.8313726, 1, 1,
0.1315197, -0.1509791, 2.943966, 0, 0.827451, 1, 1,
0.1416907, 1.254325, 0.4582627, 0, 0.8196079, 1, 1,
0.1418601, -0.463813, 2.290944, 0, 0.8156863, 1, 1,
0.1419257, -0.2999464, 2.755669, 0, 0.8078431, 1, 1,
0.143523, 0.7609125, -0.6341215, 0, 0.8039216, 1, 1,
0.1492617, 1.718717, 0.5314679, 0, 0.7960784, 1, 1,
0.1497124, -0.7590866, 3.822291, 0, 0.7882353, 1, 1,
0.1549255, 0.655764, 0.9983683, 0, 0.7843137, 1, 1,
0.156057, 0.6373923, -0.1931368, 0, 0.7764706, 1, 1,
0.1588205, 0.7819972, 1.895625, 0, 0.772549, 1, 1,
0.1591139, -0.2993101, 2.846089, 0, 0.7647059, 1, 1,
0.1654866, -1.191802, 2.596015, 0, 0.7607843, 1, 1,
0.1690775, 0.05472479, 3.134462, 0, 0.7529412, 1, 1,
0.1691632, -0.7426592, 3.059669, 0, 0.7490196, 1, 1,
0.1745998, 0.5668524, 0.7233538, 0, 0.7411765, 1, 1,
0.1833805, -0.2078698, 2.326669, 0, 0.7372549, 1, 1,
0.1836732, 0.4117845, 1.855804, 0, 0.7294118, 1, 1,
0.1838059, -0.7863687, 2.413019, 0, 0.7254902, 1, 1,
0.1838845, 1.230601, 1.125565, 0, 0.7176471, 1, 1,
0.1859378, 0.3579244, 2.219977, 0, 0.7137255, 1, 1,
0.1888256, 1.347622, 0.4151878, 0, 0.7058824, 1, 1,
0.189272, -0.360101, 0.9130164, 0, 0.6980392, 1, 1,
0.1934324, 0.8515635, 1.053279, 0, 0.6941177, 1, 1,
0.19661, -1.731098, 2.572969, 0, 0.6862745, 1, 1,
0.1976993, -1.268816, 2.115928, 0, 0.682353, 1, 1,
0.1978287, -0.1868671, 3.499867, 0, 0.6745098, 1, 1,
0.2008032, 1.032877, -0.2334342, 0, 0.6705883, 1, 1,
0.2014084, 1.377865, 0.1750318, 0, 0.6627451, 1, 1,
0.2040991, 0.3965811, 1.281022, 0, 0.6588235, 1, 1,
0.2041522, -0.02726905, 1.583438, 0, 0.6509804, 1, 1,
0.2046554, 0.9679349, 0.1687935, 0, 0.6470588, 1, 1,
0.2069891, -1.088238, 0.2921297, 0, 0.6392157, 1, 1,
0.2086798, -0.7866066, 3.071791, 0, 0.6352941, 1, 1,
0.2094609, -0.04149667, 1.367294, 0, 0.627451, 1, 1,
0.2107575, 0.6161353, -0.07085155, 0, 0.6235294, 1, 1,
0.2109597, -0.1071679, 2.34412, 0, 0.6156863, 1, 1,
0.2127725, -0.07823619, 1.136349, 0, 0.6117647, 1, 1,
0.2130952, 1.553236, -0.029643, 0, 0.6039216, 1, 1,
0.2142018, -1.171672, 4.086055, 0, 0.5960785, 1, 1,
0.2211128, -1.566713, 2.589943, 0, 0.5921569, 1, 1,
0.2212596, -0.573272, 4.110574, 0, 0.5843138, 1, 1,
0.2335061, -0.5891821, 2.174357, 0, 0.5803922, 1, 1,
0.2343373, -0.6858889, 2.955636, 0, 0.572549, 1, 1,
0.2343495, 0.3767882, 0.5439861, 0, 0.5686275, 1, 1,
0.2346558, 0.08967391, 1.948228, 0, 0.5607843, 1, 1,
0.2349772, -0.1901166, 3.073393, 0, 0.5568628, 1, 1,
0.2434625, -0.7063155, 1.194823, 0, 0.5490196, 1, 1,
0.2434629, 0.9210745, -0.6977535, 0, 0.5450981, 1, 1,
0.2452902, 0.4907248, 1.292794, 0, 0.5372549, 1, 1,
0.2496803, -1.187614, 2.666439, 0, 0.5333334, 1, 1,
0.2512265, 1.710977, -0.2531981, 0, 0.5254902, 1, 1,
0.253223, -1.556272, 2.887297, 0, 0.5215687, 1, 1,
0.2554351, 0.04666738, 1.047816, 0, 0.5137255, 1, 1,
0.2560801, -1.111022, 3.915117, 0, 0.509804, 1, 1,
0.2565471, 1.279488, 0.4391424, 0, 0.5019608, 1, 1,
0.2566337, -0.7057588, 1.626835, 0, 0.4941176, 1, 1,
0.2568682, 0.8152521, -2.079992, 0, 0.4901961, 1, 1,
0.2596727, 1.63419, 3.124148, 0, 0.4823529, 1, 1,
0.2714313, 0.1744797, 1.134671, 0, 0.4784314, 1, 1,
0.2732369, 0.6969215, 1.85696, 0, 0.4705882, 1, 1,
0.2784283, 0.1141553, 2.375579, 0, 0.4666667, 1, 1,
0.2854017, -0.4658502, 3.336715, 0, 0.4588235, 1, 1,
0.2858522, 2.422857, 0.1034145, 0, 0.454902, 1, 1,
0.2867385, -0.4384436, 2.476813, 0, 0.4470588, 1, 1,
0.289846, 1.588893, -1.692385, 0, 0.4431373, 1, 1,
0.2961515, 0.05577965, 0.001478468, 0, 0.4352941, 1, 1,
0.3004002, -0.304314, 2.135165, 0, 0.4313726, 1, 1,
0.3014054, 0.4603525, 1.53398, 0, 0.4235294, 1, 1,
0.3016337, 1.219632, 0.0149259, 0, 0.4196078, 1, 1,
0.3093728, -0.7476227, 2.503986, 0, 0.4117647, 1, 1,
0.3151837, -0.04247156, 1.390504, 0, 0.4078431, 1, 1,
0.3151929, 0.08702029, 2.626467, 0, 0.4, 1, 1,
0.3152501, -0.3454778, 2.873454, 0, 0.3921569, 1, 1,
0.3170906, -0.7487772, 2.513515, 0, 0.3882353, 1, 1,
0.3257395, -0.7234046, 4.544281, 0, 0.3803922, 1, 1,
0.3326797, 2.095717, 1.150886, 0, 0.3764706, 1, 1,
0.3333254, 0.431742, 0.6035627, 0, 0.3686275, 1, 1,
0.3362916, 1.702026, -0.5039925, 0, 0.3647059, 1, 1,
0.3410472, -0.05664586, 1.441876, 0, 0.3568628, 1, 1,
0.34228, -0.7925225, 2.244236, 0, 0.3529412, 1, 1,
0.3454716, 0.6127136, 0.3143612, 0, 0.345098, 1, 1,
0.3644509, 1.115206, -0.5562745, 0, 0.3411765, 1, 1,
0.3654397, -0.4770015, 2.119082, 0, 0.3333333, 1, 1,
0.3733422, -0.1281143, 2.187851, 0, 0.3294118, 1, 1,
0.3785184, -0.5307341, 2.423262, 0, 0.3215686, 1, 1,
0.3807503, -0.6333517, 2.967087, 0, 0.3176471, 1, 1,
0.3809725, -2.401026, 1.103125, 0, 0.3098039, 1, 1,
0.3839777, 0.920699, -0.1941656, 0, 0.3058824, 1, 1,
0.3840345, -0.7226629, 2.040376, 0, 0.2980392, 1, 1,
0.3852271, 1.717743, 1.144169, 0, 0.2901961, 1, 1,
0.3877479, -0.3651342, 2.317141, 0, 0.2862745, 1, 1,
0.3911667, 1.608277, 0.9835673, 0, 0.2784314, 1, 1,
0.3915709, 0.1688587, 1.354405, 0, 0.2745098, 1, 1,
0.3916124, 0.1913538, -0.08419212, 0, 0.2666667, 1, 1,
0.3917894, 1.067643, -0.1233329, 0, 0.2627451, 1, 1,
0.3930797, -0.6583818, 3.094292, 0, 0.254902, 1, 1,
0.3951686, 0.6676338, 2.098112, 0, 0.2509804, 1, 1,
0.3974433, -0.3765668, 1.503489, 0, 0.2431373, 1, 1,
0.4012056, -0.938916, 2.149335, 0, 0.2392157, 1, 1,
0.4027075, -1.095001, 3.605992, 0, 0.2313726, 1, 1,
0.4028389, 0.07262972, 2.546999, 0, 0.227451, 1, 1,
0.404977, -0.4980415, -0.1039934, 0, 0.2196078, 1, 1,
0.4059591, -1.874429, 3.57026, 0, 0.2156863, 1, 1,
0.4100626, -0.6173452, 2.390867, 0, 0.2078431, 1, 1,
0.4168348, 1.743903, -0.3477663, 0, 0.2039216, 1, 1,
0.4210615, 0.3685153, 0.8943332, 0, 0.1960784, 1, 1,
0.4213712, -0.5563117, 1.896241, 0, 0.1882353, 1, 1,
0.4249156, -0.7737544, 4.011083, 0, 0.1843137, 1, 1,
0.4256358, 0.3478844, 1.229118, 0, 0.1764706, 1, 1,
0.4283173, 0.128091, 2.214237, 0, 0.172549, 1, 1,
0.4310149, 0.0377754, 2.101113, 0, 0.1647059, 1, 1,
0.4313338, -0.3347704, 3.54798, 0, 0.1607843, 1, 1,
0.4315805, 1.738551, -0.611683, 0, 0.1529412, 1, 1,
0.4347246, 0.6601437, 2.98617, 0, 0.1490196, 1, 1,
0.4397453, -0.07508816, 0.4133152, 0, 0.1411765, 1, 1,
0.4427972, -1.924078, 3.269084, 0, 0.1372549, 1, 1,
0.4430495, -0.08761373, 1.883458, 0, 0.1294118, 1, 1,
0.4475503, 0.6282262, 0.1712354, 0, 0.1254902, 1, 1,
0.4488587, -0.1211711, 2.120127, 0, 0.1176471, 1, 1,
0.4502875, -0.6111534, 3.012436, 0, 0.1137255, 1, 1,
0.450395, -0.1925846, 1.066731, 0, 0.1058824, 1, 1,
0.4510042, 0.2768172, 0.06852089, 0, 0.09803922, 1, 1,
0.4537248, -0.5219218, 1.460202, 0, 0.09411765, 1, 1,
0.4543438, -0.009442116, 1.481763, 0, 0.08627451, 1, 1,
0.4569132, 1.058167, -0.5127569, 0, 0.08235294, 1, 1,
0.458572, 1.105125, -1.295209, 0, 0.07450981, 1, 1,
0.4593465, 0.6629226, 1.778017, 0, 0.07058824, 1, 1,
0.467533, -0.1074603, 2.651231, 0, 0.0627451, 1, 1,
0.4693237, -0.6273358, 3.3387, 0, 0.05882353, 1, 1,
0.4783398, -2.119588, 3.602045, 0, 0.05098039, 1, 1,
0.4839894, -2.608051, 3.976097, 0, 0.04705882, 1, 1,
0.4845994, 1.196187, -0.5783787, 0, 0.03921569, 1, 1,
0.48468, -0.3203455, 1.720413, 0, 0.03529412, 1, 1,
0.4856933, 0.511873, 0.002813851, 0, 0.02745098, 1, 1,
0.4859633, 0.2576841, 1.992972, 0, 0.02352941, 1, 1,
0.4886212, -1.564072, 2.364054, 0, 0.01568628, 1, 1,
0.4907634, 0.05772741, 1.256102, 0, 0.01176471, 1, 1,
0.4909661, 0.08295514, -0.3416369, 0, 0.003921569, 1, 1,
0.4916262, -1.205992, 4.352537, 0.003921569, 0, 1, 1,
0.4927629, 0.2261405, 2.059385, 0.007843138, 0, 1, 1,
0.4936526, -0.1877098, 1.001929, 0.01568628, 0, 1, 1,
0.4944222, 1.546859, 1.214734, 0.01960784, 0, 1, 1,
0.4947934, 0.880839, -0.2597092, 0.02745098, 0, 1, 1,
0.4955164, 0.6764954, -0.5361139, 0.03137255, 0, 1, 1,
0.4960972, -0.1962519, 2.86301, 0.03921569, 0, 1, 1,
0.5006418, -1.409076, 0.9874286, 0.04313726, 0, 1, 1,
0.5055285, 0.6146209, -0.07961337, 0.05098039, 0, 1, 1,
0.506178, -1.395671, 4.951346, 0.05490196, 0, 1, 1,
0.5077015, -0.13654, 0.8458466, 0.0627451, 0, 1, 1,
0.5079951, 0.8781734, 0.03500358, 0.06666667, 0, 1, 1,
0.5094311, 0.0467912, 1.717255, 0.07450981, 0, 1, 1,
0.5100119, 0.5412405, 1.371964, 0.07843138, 0, 1, 1,
0.5134016, -0.133124, 2.283646, 0.08627451, 0, 1, 1,
0.5259538, 0.8469505, 1.030819, 0.09019608, 0, 1, 1,
0.5283788, -0.3518198, 1.455738, 0.09803922, 0, 1, 1,
0.5286855, -0.8346344, 2.937564, 0.1058824, 0, 1, 1,
0.5294055, 0.4092003, 0.687671, 0.1098039, 0, 1, 1,
0.5307468, 0.9612579, 0.7401003, 0.1176471, 0, 1, 1,
0.5329126, 0.4311064, -0.5443559, 0.1215686, 0, 1, 1,
0.5342348, -1.229923, 3.658659, 0.1294118, 0, 1, 1,
0.5383977, 0.8466789, 1.268576, 0.1333333, 0, 1, 1,
0.5389492, -0.7639, 3.831861, 0.1411765, 0, 1, 1,
0.5390599, -0.6473994, 2.909509, 0.145098, 0, 1, 1,
0.5437044, -0.69203, 1.471184, 0.1529412, 0, 1, 1,
0.5454722, -1.390559, 3.97251, 0.1568628, 0, 1, 1,
0.5478202, 0.56851, 0.3644206, 0.1647059, 0, 1, 1,
0.552852, 0.9854895, -0.615466, 0.1686275, 0, 1, 1,
0.5538704, -1.900542, 2.993444, 0.1764706, 0, 1, 1,
0.5546961, -0.2164586, 3.346641, 0.1803922, 0, 1, 1,
0.5584975, 0.6077004, 0.4670775, 0.1882353, 0, 1, 1,
0.5593801, -0.2934441, 1.442239, 0.1921569, 0, 1, 1,
0.5611234, 0.04295963, 2.126937, 0.2, 0, 1, 1,
0.5612031, 1.744828, -1.47183, 0.2078431, 0, 1, 1,
0.5667902, -0.1991093, 3.576371, 0.2117647, 0, 1, 1,
0.5683799, -0.1750717, 2.380676, 0.2196078, 0, 1, 1,
0.5730847, 2.21909, -0.8624744, 0.2235294, 0, 1, 1,
0.5753535, 0.3134227, -0.5052277, 0.2313726, 0, 1, 1,
0.5775056, 1.070323, 0.2798367, 0.2352941, 0, 1, 1,
0.5785553, 1.192264, 0.02468704, 0.2431373, 0, 1, 1,
0.5933131, -1.77991, 3.240755, 0.2470588, 0, 1, 1,
0.5938329, 0.01616225, 1.666361, 0.254902, 0, 1, 1,
0.5999184, -0.5026208, 1.249377, 0.2588235, 0, 1, 1,
0.6096764, -0.02009005, 1.62782, 0.2666667, 0, 1, 1,
0.611295, 0.8211852, 0.2787758, 0.2705882, 0, 1, 1,
0.6113679, 0.2660826, 0.9872293, 0.2784314, 0, 1, 1,
0.6117978, -0.02631147, 1.364675, 0.282353, 0, 1, 1,
0.6122763, -1.646737, 2.504553, 0.2901961, 0, 1, 1,
0.6153046, -1.02339, 0.8081092, 0.2941177, 0, 1, 1,
0.6166053, 1.198646, 1.115786, 0.3019608, 0, 1, 1,
0.6183563, 0.463579, 0.6726427, 0.3098039, 0, 1, 1,
0.621157, 0.1073387, 1.431297, 0.3137255, 0, 1, 1,
0.6218887, 0.4400501, -0.4325148, 0.3215686, 0, 1, 1,
0.6235994, 0.3512352, 3.144511, 0.3254902, 0, 1, 1,
0.6240511, 0.8771055, 1.078757, 0.3333333, 0, 1, 1,
0.6265028, 0.4807675, 1.919341, 0.3372549, 0, 1, 1,
0.6265079, 1.851917, -1.630611, 0.345098, 0, 1, 1,
0.6330228, -1.210726, 2.699874, 0.3490196, 0, 1, 1,
0.6444967, 0.9154119, 1.972826, 0.3568628, 0, 1, 1,
0.6468765, 0.3283516, 1.985648, 0.3607843, 0, 1, 1,
0.6483847, 0.176566, 1.717826, 0.3686275, 0, 1, 1,
0.6494386, -1.131955, 2.249542, 0.372549, 0, 1, 1,
0.6495938, -1.478399, 3.273612, 0.3803922, 0, 1, 1,
0.6518927, 0.1518554, 2.032604, 0.3843137, 0, 1, 1,
0.6558048, 0.7372879, 1.650811, 0.3921569, 0, 1, 1,
0.6761358, -2.667632, 4.339162, 0.3960784, 0, 1, 1,
0.6764566, 0.6839294, 0.7617335, 0.4039216, 0, 1, 1,
0.6776288, -1.351736, 1.332828, 0.4117647, 0, 1, 1,
0.6791575, 0.8756169, 1.596538, 0.4156863, 0, 1, 1,
0.6811332, 1.286709, 2.141706, 0.4235294, 0, 1, 1,
0.6821893, 1.942542, 2.411093, 0.427451, 0, 1, 1,
0.6883003, 0.2022644, 3.127819, 0.4352941, 0, 1, 1,
0.6905062, 0.3006837, -0.3479653, 0.4392157, 0, 1, 1,
0.6910917, -1.231437, 3.047532, 0.4470588, 0, 1, 1,
0.6912991, 0.6612751, 1.014811, 0.4509804, 0, 1, 1,
0.6951248, -0.6926057, 1.6621, 0.4588235, 0, 1, 1,
0.6984766, 0.7967672, -0.1997674, 0.4627451, 0, 1, 1,
0.698922, -0.06936543, 0.3324031, 0.4705882, 0, 1, 1,
0.7005838, 0.5531985, -0.4852724, 0.4745098, 0, 1, 1,
0.7049893, 0.5452372, 2.09698, 0.4823529, 0, 1, 1,
0.7088249, -0.8811789, 1.857512, 0.4862745, 0, 1, 1,
0.7106537, -1.701873, 2.281718, 0.4941176, 0, 1, 1,
0.711317, 0.9988694, -0.654157, 0.5019608, 0, 1, 1,
0.7123592, -0.08881703, 3.251468, 0.5058824, 0, 1, 1,
0.7186118, -0.1465419, 1.545539, 0.5137255, 0, 1, 1,
0.7201334, 1.221065, 1.717389, 0.5176471, 0, 1, 1,
0.7248458, -0.1846405, 2.069723, 0.5254902, 0, 1, 1,
0.7267909, -0.2237223, -0.3191876, 0.5294118, 0, 1, 1,
0.7313277, -1.153079, 2.007319, 0.5372549, 0, 1, 1,
0.7338797, 0.9880732, 2.239677, 0.5411765, 0, 1, 1,
0.7342989, -0.4594223, 2.488796, 0.5490196, 0, 1, 1,
0.7347098, 1.929194, 1.592256, 0.5529412, 0, 1, 1,
0.7358172, -0.1364008, 3.117379, 0.5607843, 0, 1, 1,
0.7358411, 0.514469, 1.738333, 0.5647059, 0, 1, 1,
0.7391651, -0.1461082, 1.961246, 0.572549, 0, 1, 1,
0.7408727, -0.5728161, 3.535269, 0.5764706, 0, 1, 1,
0.741595, -1.189576, 4.296705, 0.5843138, 0, 1, 1,
0.7462071, 1.145796, -2.109949, 0.5882353, 0, 1, 1,
0.7477831, 1.537477, 1.412924, 0.5960785, 0, 1, 1,
0.7485012, 0.05274959, 2.128438, 0.6039216, 0, 1, 1,
0.7488595, 0.3745889, -1.233661, 0.6078432, 0, 1, 1,
0.7490573, -0.1832699, 1.585846, 0.6156863, 0, 1, 1,
0.7496904, -1.401687, 2.287649, 0.6196079, 0, 1, 1,
0.7541189, 0.6749494, 3.250366, 0.627451, 0, 1, 1,
0.7556329, -0.2947796, 2.038251, 0.6313726, 0, 1, 1,
0.7569706, 0.1548405, 1.873212, 0.6392157, 0, 1, 1,
0.7603059, 2.775403, 1.5236, 0.6431373, 0, 1, 1,
0.7603254, -0.8975706, 1.516343, 0.6509804, 0, 1, 1,
0.7658448, 1.051542, -0.2425386, 0.654902, 0, 1, 1,
0.7666781, 1.012028, 1.925586, 0.6627451, 0, 1, 1,
0.7714304, -0.9135745, 1.899522, 0.6666667, 0, 1, 1,
0.7719468, -0.6278384, 2.857741, 0.6745098, 0, 1, 1,
0.7740641, -0.28564, 3.940938, 0.6784314, 0, 1, 1,
0.7779327, 2.08773, 1.825318, 0.6862745, 0, 1, 1,
0.7782358, 0.9971907, 0.06782354, 0.6901961, 0, 1, 1,
0.7789103, -0.8135139, 2.299576, 0.6980392, 0, 1, 1,
0.7808527, -0.6225921, 1.889367, 0.7058824, 0, 1, 1,
0.7818883, 0.7882981, 0.8411385, 0.7098039, 0, 1, 1,
0.7881047, -0.6082116, 1.599712, 0.7176471, 0, 1, 1,
0.7952356, -0.4727009, 2.809368, 0.7215686, 0, 1, 1,
0.8010936, -0.1285331, 1.818866, 0.7294118, 0, 1, 1,
0.8043885, -0.1949186, 2.21484, 0.7333333, 0, 1, 1,
0.8045796, -0.820418, 3.813905, 0.7411765, 0, 1, 1,
0.8068687, -0.545171, 1.553583, 0.7450981, 0, 1, 1,
0.8089774, -1.060776, 2.653802, 0.7529412, 0, 1, 1,
0.8095615, 0.1727659, 3.375221, 0.7568628, 0, 1, 1,
0.8099593, 0.3651038, -0.6186549, 0.7647059, 0, 1, 1,
0.8125702, -3.220519, 2.048708, 0.7686275, 0, 1, 1,
0.8146364, -0.8241057, 3.770711, 0.7764706, 0, 1, 1,
0.8158014, 1.061612, 0.03759221, 0.7803922, 0, 1, 1,
0.8160316, -0.2543297, 1.986108, 0.7882353, 0, 1, 1,
0.8192221, -0.5487152, 3.041912, 0.7921569, 0, 1, 1,
0.8195341, -0.02776475, 0.828308, 0.8, 0, 1, 1,
0.8239292, -0.8552603, 2.250271, 0.8078431, 0, 1, 1,
0.8274042, 0.7538418, -1.696444, 0.8117647, 0, 1, 1,
0.835223, -0.9271957, 2.883241, 0.8196079, 0, 1, 1,
0.8377154, 1.074849, 0.7587739, 0.8235294, 0, 1, 1,
0.839919, 0.3576882, -0.1944671, 0.8313726, 0, 1, 1,
0.845719, -1.992761, 2.261652, 0.8352941, 0, 1, 1,
0.8478947, 1.122049, 0.1179334, 0.8431373, 0, 1, 1,
0.8498485, 0.8521672, -0.1562123, 0.8470588, 0, 1, 1,
0.8508738, -1.498491, 1.845073, 0.854902, 0, 1, 1,
0.8513956, -0.9900966, 2.69059, 0.8588235, 0, 1, 1,
0.8635096, 0.1171041, 1.675795, 0.8666667, 0, 1, 1,
0.8686149, -0.2943157, 1.5089, 0.8705882, 0, 1, 1,
0.8729282, -0.8607966, 2.347103, 0.8784314, 0, 1, 1,
0.8759869, -0.3673044, 1.716388, 0.8823529, 0, 1, 1,
0.8818368, 0.7968243, 0.5930243, 0.8901961, 0, 1, 1,
0.8826614, 0.02257751, 1.040471, 0.8941177, 0, 1, 1,
0.8860692, -0.7297133, 2.777694, 0.9019608, 0, 1, 1,
0.8882173, 1.148339, 0.7170485, 0.9098039, 0, 1, 1,
0.8892787, -0.3143606, 2.411769, 0.9137255, 0, 1, 1,
0.8894203, 1.349489, 0.2147848, 0.9215686, 0, 1, 1,
0.8913548, -1.433984, 3.171147, 0.9254902, 0, 1, 1,
0.8915635, -1.138018, 3.507439, 0.9333333, 0, 1, 1,
0.891966, 0.7926526, 1.726199, 0.9372549, 0, 1, 1,
0.8932918, 0.09840831, 2.52418, 0.945098, 0, 1, 1,
0.8936915, -0.3340599, 2.213363, 0.9490196, 0, 1, 1,
0.8955815, 0.8441812, 1.012095, 0.9568627, 0, 1, 1,
0.8975774, -0.3204759, 2.559189, 0.9607843, 0, 1, 1,
0.9006497, -0.4688877, 1.662301, 0.9686275, 0, 1, 1,
0.904373, 0.6562831, 1.8354, 0.972549, 0, 1, 1,
0.9083458, -0.9952877, 0.975834, 0.9803922, 0, 1, 1,
0.9118925, -0.7051226, 3.249792, 0.9843137, 0, 1, 1,
0.9214568, -0.6948128, 2.232635, 0.9921569, 0, 1, 1,
0.9233535, -0.1368523, 1.574718, 0.9960784, 0, 1, 1,
0.9236682, -1.676872, 2.820256, 1, 0, 0.9960784, 1,
0.9247547, 0.1807425, 1.031243, 1, 0, 0.9882353, 1,
0.9274916, 1.031361, 0.674218, 1, 0, 0.9843137, 1,
0.927938, -0.8354376, 1.038399, 1, 0, 0.9764706, 1,
0.9292951, 2.516597, 0.7161189, 1, 0, 0.972549, 1,
0.9312621, -0.1687856, 1.300224, 1, 0, 0.9647059, 1,
0.932067, 1.69972, -1.029796, 1, 0, 0.9607843, 1,
0.937396, -0.3122879, 1.217407, 1, 0, 0.9529412, 1,
0.9411752, -0.4725839, 2.090121, 1, 0, 0.9490196, 1,
0.9495702, -0.1976733, 1.932564, 1, 0, 0.9411765, 1,
0.9517631, 0.8255821, 1.062163, 1, 0, 0.9372549, 1,
0.957537, -2.072286, 4.63478, 1, 0, 0.9294118, 1,
0.9590049, 0.03917179, 1.887406, 1, 0, 0.9254902, 1,
0.9650399, -1.396222, 2.248603, 1, 0, 0.9176471, 1,
0.9724512, 0.6033206, 0.5149936, 1, 0, 0.9137255, 1,
0.9728345, 0.7424734, 0.3734694, 1, 0, 0.9058824, 1,
0.9757215, 1.660926, 1.466058, 1, 0, 0.9019608, 1,
0.9975539, 1.848633, 0.4022909, 1, 0, 0.8941177, 1,
0.9999256, -1.514169, 1.398941, 1, 0, 0.8862745, 1,
1.002861, 1.293651, 0.3227603, 1, 0, 0.8823529, 1,
1.003595, -0.1440573, 3.301012, 1, 0, 0.8745098, 1,
1.012206, -0.7729207, 0.9272234, 1, 0, 0.8705882, 1,
1.014579, -2.072332, 3.112592, 1, 0, 0.8627451, 1,
1.023086, -0.2233068, 1.93658, 1, 0, 0.8588235, 1,
1.026023, 0.1804062, 2.636769, 1, 0, 0.8509804, 1,
1.031111, -0.9715429, 1.782611, 1, 0, 0.8470588, 1,
1.034854, 0.2282486, 0.929587, 1, 0, 0.8392157, 1,
1.034906, 0.05801645, 1.357712, 1, 0, 0.8352941, 1,
1.035474, -1.940955, 3.251982, 1, 0, 0.827451, 1,
1.045118, -0.2117331, 2.879976, 1, 0, 0.8235294, 1,
1.046254, -0.5684437, 1.510621, 1, 0, 0.8156863, 1,
1.046761, 0.106823, 2.033353, 1, 0, 0.8117647, 1,
1.050099, 0.5317522, 1.65299, 1, 0, 0.8039216, 1,
1.053814, -0.6782175, 2.184785, 1, 0, 0.7960784, 1,
1.060344, 0.09001981, 1.37648, 1, 0, 0.7921569, 1,
1.062422, -1.226636, 2.020814, 1, 0, 0.7843137, 1,
1.06261, 0.8850107, 2.654503, 1, 0, 0.7803922, 1,
1.063329, -0.5028248, 2.353378, 1, 0, 0.772549, 1,
1.067506, -0.4738343, 2.415031, 1, 0, 0.7686275, 1,
1.072401, -0.05040272, 0.5110328, 1, 0, 0.7607843, 1,
1.077284, -0.7498809, 0.3943074, 1, 0, 0.7568628, 1,
1.083887, -2.21479, 2.71456, 1, 0, 0.7490196, 1,
1.087804, -1.695758, 1.873154, 1, 0, 0.7450981, 1,
1.095684, -1.644278, 1.446401, 1, 0, 0.7372549, 1,
1.09771, -0.02565954, 1.396813, 1, 0, 0.7333333, 1,
1.103061, -0.07471149, 2.258904, 1, 0, 0.7254902, 1,
1.115615, -0.1588579, 2.147202, 1, 0, 0.7215686, 1,
1.121355, -0.2778452, 1.696811, 1, 0, 0.7137255, 1,
1.121367, 1.309203, 0.8430125, 1, 0, 0.7098039, 1,
1.127561, -0.09034327, 2.691234, 1, 0, 0.7019608, 1,
1.129779, -2.06836, 4.023617, 1, 0, 0.6941177, 1,
1.135762, -0.8012681, 1.709148, 1, 0, 0.6901961, 1,
1.135933, 0.9105989, -0.8806122, 1, 0, 0.682353, 1,
1.141077, -0.09464218, 0.7780074, 1, 0, 0.6784314, 1,
1.150529, 1.249005, 0.08251517, 1, 0, 0.6705883, 1,
1.159555, 0.7507414, 1.339283, 1, 0, 0.6666667, 1,
1.167274, 0.6414474, 1.219719, 1, 0, 0.6588235, 1,
1.170082, 0.652811, 2.601103, 1, 0, 0.654902, 1,
1.184816, 0.1026768, 2.408742, 1, 0, 0.6470588, 1,
1.188966, 2.106858, 0.9830959, 1, 0, 0.6431373, 1,
1.198416, 0.277622, 2.080971, 1, 0, 0.6352941, 1,
1.201076, 0.8802858, -0.8742047, 1, 0, 0.6313726, 1,
1.203608, -0.1215315, 1.726519, 1, 0, 0.6235294, 1,
1.213683, 0.5617985, 0.8618324, 1, 0, 0.6196079, 1,
1.225175, 0.1725568, 1.606982, 1, 0, 0.6117647, 1,
1.225984, -0.1156302, 1.720039, 1, 0, 0.6078432, 1,
1.238035, 0.599049, 0.6138955, 1, 0, 0.6, 1,
1.24566, 0.270584, 1.560304, 1, 0, 0.5921569, 1,
1.250875, 1.238328, -0.4407478, 1, 0, 0.5882353, 1,
1.257292, -0.4635772, 0.5479892, 1, 0, 0.5803922, 1,
1.272218, 0.007256711, 0.5100877, 1, 0, 0.5764706, 1,
1.280315, -0.5766568, 1.284092, 1, 0, 0.5686275, 1,
1.28722, -0.9333266, 1.204268, 1, 0, 0.5647059, 1,
1.311813, 1.589906, 2.202313, 1, 0, 0.5568628, 1,
1.3257, 0.7387546, 1.862655, 1, 0, 0.5529412, 1,
1.332558, 1.399441, 0.4795916, 1, 0, 0.5450981, 1,
1.337963, -0.2744434, 1.011978, 1, 0, 0.5411765, 1,
1.353352, 0.9010659, -1.138082, 1, 0, 0.5333334, 1,
1.355426, -1.29049, 3.402963, 1, 0, 0.5294118, 1,
1.357175, -1.909832, 2.769127, 1, 0, 0.5215687, 1,
1.357948, 0.35187, 1.186725, 1, 0, 0.5176471, 1,
1.360333, -1.092574, 1.633976, 1, 0, 0.509804, 1,
1.375523, 0.577149, 1.413859, 1, 0, 0.5058824, 1,
1.376689, -0.825531, 3.982768, 1, 0, 0.4980392, 1,
1.411472, -1.870564, 2.856382, 1, 0, 0.4901961, 1,
1.419751, -1.090832, 2.031956, 1, 0, 0.4862745, 1,
1.420988, -0.1800696, 1.859168, 1, 0, 0.4784314, 1,
1.426443, 0.05360381, 2.841181, 1, 0, 0.4745098, 1,
1.428749, -0.3736102, 0.7473344, 1, 0, 0.4666667, 1,
1.429167, 1.154678, 1.874509, 1, 0, 0.4627451, 1,
1.438612, 1.72498, 0.6554489, 1, 0, 0.454902, 1,
1.444871, 0.1132808, 1.060443, 1, 0, 0.4509804, 1,
1.447546, -0.1925046, 2.31334, 1, 0, 0.4431373, 1,
1.454127, 0.4691451, 0.5841103, 1, 0, 0.4392157, 1,
1.460046, 1.338589, 1.411956, 1, 0, 0.4313726, 1,
1.464258, -2.835611, 1.363738, 1, 0, 0.427451, 1,
1.46605, 0.05785554, 0.787032, 1, 0, 0.4196078, 1,
1.477781, 1.749252, -0.7476308, 1, 0, 0.4156863, 1,
1.482934, -0.5176877, 0.01901581, 1, 0, 0.4078431, 1,
1.483368, -0.9260485, 3.786678, 1, 0, 0.4039216, 1,
1.493232, 0.07623809, 1.791381, 1, 0, 0.3960784, 1,
1.493359, 0.322295, 0.9546951, 1, 0, 0.3882353, 1,
1.49418, 0.1370516, 2.332337, 1, 0, 0.3843137, 1,
1.498223, -0.3680619, 2.167517, 1, 0, 0.3764706, 1,
1.512169, 0.8267609, 0.02274971, 1, 0, 0.372549, 1,
1.518208, -0.2921998, 2.055545, 1, 0, 0.3647059, 1,
1.519976, -0.1846092, 0.8563919, 1, 0, 0.3607843, 1,
1.524477, -1.48332, 3.720663, 1, 0, 0.3529412, 1,
1.528724, 1.171795, 0.1904259, 1, 0, 0.3490196, 1,
1.549008, -0.3396558, 2.287941, 1, 0, 0.3411765, 1,
1.554921, -1.849362, 1.100474, 1, 0, 0.3372549, 1,
1.573975, -1.63264, 2.091159, 1, 0, 0.3294118, 1,
1.580657, 0.1864359, 0.9747481, 1, 0, 0.3254902, 1,
1.582959, 0.9113317, 0.774648, 1, 0, 0.3176471, 1,
1.593334, 2.169987, 0.3687105, 1, 0, 0.3137255, 1,
1.604114, 0.4870678, -0.2226554, 1, 0, 0.3058824, 1,
1.609222, 0.7719864, 0.01195907, 1, 0, 0.2980392, 1,
1.627085, 0.7960354, 1.809195, 1, 0, 0.2941177, 1,
1.638665, 0.9720809, 1.651021, 1, 0, 0.2862745, 1,
1.643651, 0.2331205, -0.1622033, 1, 0, 0.282353, 1,
1.652897, 0.7106736, 1.984582, 1, 0, 0.2745098, 1,
1.661528, -1.291297, 2.434072, 1, 0, 0.2705882, 1,
1.663669, 1.113008, 1.398829, 1, 0, 0.2627451, 1,
1.675871, 0.538514, 0.5425909, 1, 0, 0.2588235, 1,
1.679296, 0.3620936, -0.1797007, 1, 0, 0.2509804, 1,
1.680062, 0.7793487, 0.4483664, 1, 0, 0.2470588, 1,
1.708272, 0.8209644, 0.7124576, 1, 0, 0.2392157, 1,
1.717582, -0.2730111, 0.7019967, 1, 0, 0.2352941, 1,
1.71963, 0.7909465, 0.4096685, 1, 0, 0.227451, 1,
1.72365, -0.001921016, 1.179619, 1, 0, 0.2235294, 1,
1.733867, 0.02396181, 1.688869, 1, 0, 0.2156863, 1,
1.735052, 1.053471, 0.001330839, 1, 0, 0.2117647, 1,
1.748934, -0.8653049, 1.74885, 1, 0, 0.2039216, 1,
1.763585, -0.9629307, 1.612566, 1, 0, 0.1960784, 1,
1.769476, 0.2782628, 2.090977, 1, 0, 0.1921569, 1,
1.79213, 1.856914, -0.1302226, 1, 0, 0.1843137, 1,
1.817977, -0.02796995, 1.756635, 1, 0, 0.1803922, 1,
1.843076, 0.5658982, 1.158035, 1, 0, 0.172549, 1,
1.85094, -0.3758527, 2.19656, 1, 0, 0.1686275, 1,
1.91686, -1.588588, 2.400725, 1, 0, 0.1607843, 1,
1.924221, -0.5558357, 4.135842, 1, 0, 0.1568628, 1,
1.966729, -0.3888611, -0.6238005, 1, 0, 0.1490196, 1,
1.96706, -0.2202662, 1.672284, 1, 0, 0.145098, 1,
1.975303, 0.6176601, 2.682081, 1, 0, 0.1372549, 1,
2.001736, 0.694412, 1.743823, 1, 0, 0.1333333, 1,
2.010825, -0.001034613, 0.971464, 1, 0, 0.1254902, 1,
2.04102, 0.7937446, -0.636955, 1, 0, 0.1215686, 1,
2.117186, 1.338943, -1.385344, 1, 0, 0.1137255, 1,
2.213119, 0.1309996, 1.49241, 1, 0, 0.1098039, 1,
2.228401, -1.031976, 2.189503, 1, 0, 0.1019608, 1,
2.23633, -0.6023383, 1.272259, 1, 0, 0.09411765, 1,
2.25073, 1.723528, 0.8935443, 1, 0, 0.09019608, 1,
2.282476, 2.437791, 0.3812476, 1, 0, 0.08235294, 1,
2.326296, 0.3053475, 2.060589, 1, 0, 0.07843138, 1,
2.389577, 0.6601624, 2.077556, 1, 0, 0.07058824, 1,
2.415167, -1.090268, 4.423703, 1, 0, 0.06666667, 1,
2.508451, 1.074791, 1.648221, 1, 0, 0.05882353, 1,
2.521106, -0.3061306, 0.2773898, 1, 0, 0.05490196, 1,
2.546534, 0.2643017, 1.583979, 1, 0, 0.04705882, 1,
2.573351, 1.576023, 0.5109188, 1, 0, 0.04313726, 1,
2.582098, -0.5501928, -0.06809045, 1, 0, 0.03529412, 1,
2.582829, -0.5722947, 2.771055, 1, 0, 0.03137255, 1,
2.614716, 0.9891399, 3.763719, 1, 0, 0.02352941, 1,
2.915878, 0.4714594, 0.8703138, 1, 0, 0.01960784, 1,
2.971518, 0.6481031, 0.6150479, 1, 0, 0.01176471, 1,
3.205294, -1.063717, 0.3936593, 1, 0, 0.007843138, 1
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
0.2387409, -4.244389, -7.277073, 0, -0.5, 0.5, 0.5,
0.2387409, -4.244389, -7.277073, 1, -0.5, 0.5, 0.5,
0.2387409, -4.244389, -7.277073, 1, 1.5, 0.5, 0.5,
0.2387409, -4.244389, -7.277073, 0, 1.5, 0.5, 0.5
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
-3.733474, -0.2002556, -7.277073, 0, -0.5, 0.5, 0.5,
-3.733474, -0.2002556, -7.277073, 1, -0.5, 0.5, 0.5,
-3.733474, -0.2002556, -7.277073, 1, 1.5, 0.5, 0.5,
-3.733474, -0.2002556, -7.277073, 0, 1.5, 0.5, 0.5
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
-3.733474, -4.244389, -0.03803968, 0, -0.5, 0.5, 0.5,
-3.733474, -4.244389, -0.03803968, 1, -0.5, 0.5, 0.5,
-3.733474, -4.244389, -0.03803968, 1, 1.5, 0.5, 0.5,
-3.733474, -4.244389, -0.03803968, 0, 1.5, 0.5, 0.5
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
-2, -3.311127, -5.606527,
3, -3.311127, -5.606527,
-2, -3.311127, -5.606527,
-2, -3.466671, -5.884952,
-1, -3.311127, -5.606527,
-1, -3.466671, -5.884952,
0, -3.311127, -5.606527,
0, -3.466671, -5.884952,
1, -3.311127, -5.606527,
1, -3.466671, -5.884952,
2, -3.311127, -5.606527,
2, -3.466671, -5.884952,
3, -3.311127, -5.606527,
3, -3.466671, -5.884952
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
-2, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
-2, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
-2, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
-2, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5,
-1, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
-1, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
-1, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
-1, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5,
0, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
0, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
0, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
0, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5,
1, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
1, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
1, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
1, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5,
2, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
2, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
2, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
2, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5,
3, -3.777758, -6.441801, 0, -0.5, 0.5, 0.5,
3, -3.777758, -6.441801, 1, -0.5, 0.5, 0.5,
3, -3.777758, -6.441801, 1, 1.5, 0.5, 0.5,
3, -3.777758, -6.441801, 0, 1.5, 0.5, 0.5
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
-2.816809, -3, -5.606527,
-2.816809, 2, -5.606527,
-2.816809, -3, -5.606527,
-2.969586, -3, -5.884952,
-2.816809, -2, -5.606527,
-2.969586, -2, -5.884952,
-2.816809, -1, -5.606527,
-2.969586, -1, -5.884952,
-2.816809, 0, -5.606527,
-2.969586, 0, -5.884952,
-2.816809, 1, -5.606527,
-2.969586, 1, -5.884952,
-2.816809, 2, -5.606527,
-2.969586, 2, -5.884952
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
-3.275141, -3, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, -3, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, -3, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, -3, -6.441801, 0, 1.5, 0.5, 0.5,
-3.275141, -2, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, -2, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, -2, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, -2, -6.441801, 0, 1.5, 0.5, 0.5,
-3.275141, -1, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, -1, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, -1, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, -1, -6.441801, 0, 1.5, 0.5, 0.5,
-3.275141, 0, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, 0, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, 0, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, 0, -6.441801, 0, 1.5, 0.5, 0.5,
-3.275141, 1, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, 1, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, 1, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, 1, -6.441801, 0, 1.5, 0.5, 0.5,
-3.275141, 2, -6.441801, 0, -0.5, 0.5, 0.5,
-3.275141, 2, -6.441801, 1, -0.5, 0.5, 0.5,
-3.275141, 2, -6.441801, 1, 1.5, 0.5, 0.5,
-3.275141, 2, -6.441801, 0, 1.5, 0.5, 0.5
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
-2.816809, -3.311127, -4,
-2.816809, -3.311127, 4,
-2.816809, -3.311127, -4,
-2.969586, -3.466671, -4,
-2.816809, -3.311127, -2,
-2.969586, -3.466671, -2,
-2.816809, -3.311127, 0,
-2.969586, -3.466671, 0,
-2.816809, -3.311127, 2,
-2.969586, -3.466671, 2,
-2.816809, -3.311127, 4,
-2.969586, -3.466671, 4
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
-3.275141, -3.777758, -4, 0, -0.5, 0.5, 0.5,
-3.275141, -3.777758, -4, 1, -0.5, 0.5, 0.5,
-3.275141, -3.777758, -4, 1, 1.5, 0.5, 0.5,
-3.275141, -3.777758, -4, 0, 1.5, 0.5, 0.5,
-3.275141, -3.777758, -2, 0, -0.5, 0.5, 0.5,
-3.275141, -3.777758, -2, 1, -0.5, 0.5, 0.5,
-3.275141, -3.777758, -2, 1, 1.5, 0.5, 0.5,
-3.275141, -3.777758, -2, 0, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 0, 0, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 0, 1, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 0, 1, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 0, 0, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 2, 0, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 2, 1, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 2, 1, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 2, 0, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 4, 0, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 4, 1, -0.5, 0.5, 0.5,
-3.275141, -3.777758, 4, 1, 1.5, 0.5, 0.5,
-3.275141, -3.777758, 4, 0, 1.5, 0.5, 0.5
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
-2.816809, -3.311127, -5.606527,
-2.816809, 2.910616, -5.606527,
-2.816809, -3.311127, 5.530448,
-2.816809, 2.910616, 5.530448,
-2.816809, -3.311127, -5.606527,
-2.816809, -3.311127, 5.530448,
-2.816809, 2.910616, -5.606527,
-2.816809, 2.910616, 5.530448,
-2.816809, -3.311127, -5.606527,
3.294291, -3.311127, -5.606527,
-2.816809, -3.311127, 5.530448,
3.294291, -3.311127, 5.530448,
-2.816809, 2.910616, -5.606527,
3.294291, 2.910616, -5.606527,
-2.816809, 2.910616, 5.530448,
3.294291, 2.910616, 5.530448,
3.294291, -3.311127, -5.606527,
3.294291, 2.910616, -5.606527,
3.294291, -3.311127, 5.530448,
3.294291, 2.910616, 5.530448,
3.294291, -3.311127, -5.606527,
3.294291, -3.311127, 5.530448,
3.294291, 2.910616, -5.606527,
3.294291, 2.910616, 5.530448
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
var radius = 7.553284;
var distance = 33.60542;
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
mvMatrix.translate( -0.2387409, 0.2002556, 0.03803968 );
mvMatrix.scale( 1.336381, 1.312616, 0.7333013 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.60542);
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
Coumaphos<-read.table("Coumaphos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Coumaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Coumaphos' not found
```

```r
y<-Coumaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Coumaphos' not found
```

```r
z<-Coumaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Coumaphos' not found
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
-2.727812, -0.1311491, -0.1642326, 0, 0, 1, 1, 1,
-2.626815, 0.09768965, -2.419977, 1, 0, 0, 1, 1,
-2.586007, 0.8273557, -2.718392, 1, 0, 0, 1, 1,
-2.506114, -0.5092297, -2.035831, 1, 0, 0, 1, 1,
-2.496445, 0.2444158, -1.614181, 1, 0, 0, 1, 1,
-2.448546, 0.378848, -1.284577, 1, 0, 0, 1, 1,
-2.357102, -1.415668, -1.875262, 0, 0, 0, 1, 1,
-2.320929, -0.3456101, -3.003968, 0, 0, 0, 1, 1,
-2.286667, 1.510625, -0.6971087, 0, 0, 0, 1, 1,
-2.254683, -0.350078, -1.157968, 0, 0, 0, 1, 1,
-2.244328, 0.04319949, -1.661962, 0, 0, 0, 1, 1,
-2.205954, 2.270823, -0.8530653, 0, 0, 0, 1, 1,
-2.186617, -2.285476, -1.5006, 0, 0, 0, 1, 1,
-2.119989, -0.9669785, -2.115154, 1, 1, 1, 1, 1,
-2.061255, 0.06903825, -2.300608, 1, 1, 1, 1, 1,
-2.037683, 0.9416608, -0.5608394, 1, 1, 1, 1, 1,
-2.033977, -0.3474976, -4.400581, 1, 1, 1, 1, 1,
-2.017711, -0.9837221, -0.4443362, 1, 1, 1, 1, 1,
-2.002546, -0.9334152, -3.07763, 1, 1, 1, 1, 1,
-1.981433, -0.4107012, -2.23433, 1, 1, 1, 1, 1,
-1.957395, 0.8661354, -0.4828525, 1, 1, 1, 1, 1,
-1.946008, 1.960247, -0.720386, 1, 1, 1, 1, 1,
-1.934377, 0.6437601, 0.6169562, 1, 1, 1, 1, 1,
-1.917244, 1.113472, -1.997239, 1, 1, 1, 1, 1,
-1.91717, 1.853816, 0.9085463, 1, 1, 1, 1, 1,
-1.911505, 1.428305, -1.58911, 1, 1, 1, 1, 1,
-1.897761, -1.739559, -4.006565, 1, 1, 1, 1, 1,
-1.889824, 0.8597245, -0.9293215, 1, 1, 1, 1, 1,
-1.878268, 0.3232174, -0.6375831, 0, 0, 1, 1, 1,
-1.868378, 0.8536206, -2.669514, 1, 0, 0, 1, 1,
-1.866821, 2.653229, 0.02713167, 1, 0, 0, 1, 1,
-1.849083, -0.7953543, -3.368406, 1, 0, 0, 1, 1,
-1.844028, 0.6224783, -1.195144, 1, 0, 0, 1, 1,
-1.825737, -1.446313, -3.590534, 1, 0, 0, 1, 1,
-1.809648, 0.8237191, -1.057767, 0, 0, 0, 1, 1,
-1.800623, -1.181706, -2.428907, 0, 0, 0, 1, 1,
-1.76521, -1.04421, -1.011696, 0, 0, 0, 1, 1,
-1.761024, 0.01503283, -1.911655, 0, 0, 0, 1, 1,
-1.751242, -0.6776193, -0.1732528, 0, 0, 0, 1, 1,
-1.745027, 1.474535, 0.908025, 0, 0, 0, 1, 1,
-1.744969, -0.6094297, -1.787249, 0, 0, 0, 1, 1,
-1.725993, 0.8281422, -0.2911012, 1, 1, 1, 1, 1,
-1.721926, -1.538236, -2.181282, 1, 1, 1, 1, 1,
-1.721713, -0.6358755, -2.420864, 1, 1, 1, 1, 1,
-1.703976, -0.09179089, -1.66657, 1, 1, 1, 1, 1,
-1.698399, 1.223115, -1.849023, 1, 1, 1, 1, 1,
-1.693833, -0.1855868, -1.988272, 1, 1, 1, 1, 1,
-1.692058, 0.6794254, -1.372353, 1, 1, 1, 1, 1,
-1.677214, -0.613446, -1.88736, 1, 1, 1, 1, 1,
-1.671677, 0.2980459, -2.282832, 1, 1, 1, 1, 1,
-1.668931, -0.7342243, -3.647536, 1, 1, 1, 1, 1,
-1.625407, -1.083317, -2.168975, 1, 1, 1, 1, 1,
-1.620379, 1.306451, -0.4257374, 1, 1, 1, 1, 1,
-1.598755, 1.328133, 0.05419965, 1, 1, 1, 1, 1,
-1.593948, -0.779381, -1.862753, 1, 1, 1, 1, 1,
-1.593644, 1.545515, -1.698994, 1, 1, 1, 1, 1,
-1.58592, -1.29822, -2.789364, 0, 0, 1, 1, 1,
-1.573238, -1.124659, -0.08203533, 1, 0, 0, 1, 1,
-1.563038, 2.012269, -0.951779, 1, 0, 0, 1, 1,
-1.553811, 2.047527, -0.9262722, 1, 0, 0, 1, 1,
-1.553531, -0.7431483, -2.948489, 1, 0, 0, 1, 1,
-1.53109, 0.2952068, -0.06317971, 1, 0, 0, 1, 1,
-1.529723, 2.417024, -0.05863571, 0, 0, 0, 1, 1,
-1.52913, 0.7695472, -1.841655, 0, 0, 0, 1, 1,
-1.52663, 0.3592435, -2.921109, 0, 0, 0, 1, 1,
-1.520781, 0.5998634, -1.055929, 0, 0, 0, 1, 1,
-1.509303, -1.434467, -3.144207, 0, 0, 0, 1, 1,
-1.507366, -0.1143009, -0.9982123, 0, 0, 0, 1, 1,
-1.5015, -0.8797756, -1.93746, 0, 0, 0, 1, 1,
-1.496384, 1.316769, -1.159765, 1, 1, 1, 1, 1,
-1.488601, -0.1560145, -1.324878, 1, 1, 1, 1, 1,
-1.487297, -0.8793191, -4.361494, 1, 1, 1, 1, 1,
-1.486901, 0.1249455, -1.731652, 1, 1, 1, 1, 1,
-1.471283, 1.485855, -0.06610788, 1, 1, 1, 1, 1,
-1.468114, -0.2908621, -0.9964585, 1, 1, 1, 1, 1,
-1.460545, 0.006538763, -2.662827, 1, 1, 1, 1, 1,
-1.456635, -1.901334, -1.887882, 1, 1, 1, 1, 1,
-1.454275, -0.2612582, 0.8096183, 1, 1, 1, 1, 1,
-1.453878, 0.1940918, -1.308547, 1, 1, 1, 1, 1,
-1.452843, -0.009122148, -2.35632, 1, 1, 1, 1, 1,
-1.439815, 0.2331214, -0.7869667, 1, 1, 1, 1, 1,
-1.439019, 0.2367845, -0.5624253, 1, 1, 1, 1, 1,
-1.433708, 0.3210841, -1.910462, 1, 1, 1, 1, 1,
-1.41919, -1.355907, -3.486106, 1, 1, 1, 1, 1,
-1.416895, 1.829257, 0.3754307, 0, 0, 1, 1, 1,
-1.395601, 1.870816, -0.5110897, 1, 0, 0, 1, 1,
-1.392692, 0.967181, -0.4037794, 1, 0, 0, 1, 1,
-1.39007, 1.035038, -1.205595, 1, 0, 0, 1, 1,
-1.388038, -1.708611, -2.011842, 1, 0, 0, 1, 1,
-1.386847, -0.1016026, -0.4700948, 1, 0, 0, 1, 1,
-1.384429, 0.2464153, -1.111946, 0, 0, 0, 1, 1,
-1.378411, 0.2293845, -1.119164, 0, 0, 0, 1, 1,
-1.363658, 0.5661129, -1.91621, 0, 0, 0, 1, 1,
-1.358448, 0.07416735, -0.09372164, 0, 0, 0, 1, 1,
-1.344824, 1.0759, 0.1671892, 0, 0, 0, 1, 1,
-1.340512, 0.4401281, -1.79002, 0, 0, 0, 1, 1,
-1.333866, -0.7245618, -2.093525, 0, 0, 0, 1, 1,
-1.308306, 0.6072421, -1.608252, 1, 1, 1, 1, 1,
-1.307701, -0.4979778, -1.124604, 1, 1, 1, 1, 1,
-1.303466, -1.224307, -0.689944, 1, 1, 1, 1, 1,
-1.284833, 0.289539, 0.09106211, 1, 1, 1, 1, 1,
-1.284266, -0.4519083, -1.377409, 1, 1, 1, 1, 1,
-1.276988, 2.114102, -1.228207, 1, 1, 1, 1, 1,
-1.267663, 0.5899754, 0.2731378, 1, 1, 1, 1, 1,
-1.260031, 0.3632832, -1.016153, 1, 1, 1, 1, 1,
-1.245473, 0.4323815, -2.197536, 1, 1, 1, 1, 1,
-1.229259, -0.7401989, -3.229034, 1, 1, 1, 1, 1,
-1.215019, -0.524501, -2.226359, 1, 1, 1, 1, 1,
-1.212418, 0.2788267, -1.408726, 1, 1, 1, 1, 1,
-1.209055, 0.2646794, 0.01589935, 1, 1, 1, 1, 1,
-1.207995, -2.988931, -2.968839, 1, 1, 1, 1, 1,
-1.202267, -0.01344027, -1.770581, 1, 1, 1, 1, 1,
-1.201338, -0.1799805, -1.226012, 0, 0, 1, 1, 1,
-1.199487, 0.3052755, -0.7285756, 1, 0, 0, 1, 1,
-1.196622, 0.7198394, -0.5102534, 1, 0, 0, 1, 1,
-1.189156, -0.320285, -4.323565, 1, 0, 0, 1, 1,
-1.186862, 0.9149161, 1.572133, 1, 0, 0, 1, 1,
-1.183749, 0.8636785, -1.614718, 1, 0, 0, 1, 1,
-1.183495, 1.531827, -0.1090494, 0, 0, 0, 1, 1,
-1.175043, 0.2733734, -1.644349, 0, 0, 0, 1, 1,
-1.174182, 1.963748, -1.001612, 0, 0, 0, 1, 1,
-1.171464, -1.258952, -3.662953, 0, 0, 0, 1, 1,
-1.171175, -1.010877, -1.577653, 0, 0, 0, 1, 1,
-1.171014, -1.087977, -1.116559, 0, 0, 0, 1, 1,
-1.168484, 0.5331244, -0.7630655, 0, 0, 0, 1, 1,
-1.167836, -0.6121325, -2.041244, 1, 1, 1, 1, 1,
-1.166303, 1.668364, 1.489868, 1, 1, 1, 1, 1,
-1.160278, 0.07685746, -1.21997, 1, 1, 1, 1, 1,
-1.148909, -0.6067295, -3.076838, 1, 1, 1, 1, 1,
-1.143208, 0.35371, -1.969895, 1, 1, 1, 1, 1,
-1.142157, -0.2978528, -1.568643, 1, 1, 1, 1, 1,
-1.131495, -2.352472, -4.723528, 1, 1, 1, 1, 1,
-1.127429, 0.1272756, -2.071587, 1, 1, 1, 1, 1,
-1.127078, -0.6067398, -2.896558, 1, 1, 1, 1, 1,
-1.12665, 0.8967261, 0.1495515, 1, 1, 1, 1, 1,
-1.126427, 0.3183004, -0.3094296, 1, 1, 1, 1, 1,
-1.123084, 0.2893814, -1.457995, 1, 1, 1, 1, 1,
-1.112558, -2.12701, -4.968323, 1, 1, 1, 1, 1,
-1.105448, 2.018033, -0.3000095, 1, 1, 1, 1, 1,
-1.099311, 0.931108, 0.5982874, 1, 1, 1, 1, 1,
-1.09679, -0.06364118, -1.500276, 0, 0, 1, 1, 1,
-1.096404, -0.6599079, -0.3047335, 1, 0, 0, 1, 1,
-1.093742, -0.4687182, -2.117772, 1, 0, 0, 1, 1,
-1.089794, 0.5895283, -0.11547, 1, 0, 0, 1, 1,
-1.080213, -1.422958, -2.218845, 1, 0, 0, 1, 1,
-1.072336, -0.8254312, -0.7223176, 1, 0, 0, 1, 1,
-1.054917, -0.2513719, -1.76287, 0, 0, 0, 1, 1,
-1.051613, -1.093353, -2.995587, 0, 0, 0, 1, 1,
-1.051044, -0.2657517, -0.3057812, 0, 0, 0, 1, 1,
-1.047943, 0.7425813, -0.9942749, 0, 0, 0, 1, 1,
-1.043305, 1.387134, -0.5910627, 0, 0, 0, 1, 1,
-1.032992, -1.038265, -1.628253, 0, 0, 0, 1, 1,
-1.026, -0.8545187, -2.742775, 0, 0, 0, 1, 1,
-0.9996812, -0.5992936, -1.141599, 1, 1, 1, 1, 1,
-0.9968295, 0.3758048, 0.1333006, 1, 1, 1, 1, 1,
-0.9967498, 2.197994, -0.3895627, 1, 1, 1, 1, 1,
-0.9926143, 0.8363646, -0.3518969, 1, 1, 1, 1, 1,
-0.9905251, 0.009173269, -2.205804, 1, 1, 1, 1, 1,
-0.9889049, -0.4771045, -3.375713, 1, 1, 1, 1, 1,
-0.971309, -0.3376138, -2.589776, 1, 1, 1, 1, 1,
-0.964538, 0.4459226, 0.3249615, 1, 1, 1, 1, 1,
-0.9638527, 0.4102502, -2.282981, 1, 1, 1, 1, 1,
-0.961511, 0.4044041, -1.47821, 1, 1, 1, 1, 1,
-0.9577653, 1.19847, -0.4954305, 1, 1, 1, 1, 1,
-0.9542121, -0.6810873, -2.141408, 1, 1, 1, 1, 1,
-0.9471092, -0.00015498, 0.06428896, 1, 1, 1, 1, 1,
-0.9466962, 1.608643, -2.075817, 1, 1, 1, 1, 1,
-0.9414935, 0.8682852, -1.821957, 1, 1, 1, 1, 1,
-0.9362869, -0.2588962, -1.773382, 0, 0, 1, 1, 1,
-0.9227199, -0.3211884, -0.2427935, 1, 0, 0, 1, 1,
-0.9184645, 0.6600791, -1.566441, 1, 0, 0, 1, 1,
-0.9172562, -0.5913084, -1.903232, 1, 0, 0, 1, 1,
-0.912177, 0.1354599, -2.033068, 1, 0, 0, 1, 1,
-0.9114498, -0.6443042, -3.135528, 1, 0, 0, 1, 1,
-0.910601, 0.872859, -0.06259774, 0, 0, 0, 1, 1,
-0.9084494, 1.002274, 2.110453, 0, 0, 0, 1, 1,
-0.9037057, 0.2502095, -2.747614, 0, 0, 0, 1, 1,
-0.9022757, -0.3413148, -1.413606, 0, 0, 0, 1, 1,
-0.9016423, 0.4999051, -0.6397119, 0, 0, 0, 1, 1,
-0.8992329, 0.1523457, 0.6529037, 0, 0, 0, 1, 1,
-0.8951035, -0.7058179, -3.142123, 0, 0, 0, 1, 1,
-0.8814929, 0.7440989, -0.2067387, 1, 1, 1, 1, 1,
-0.8812153, -1.239014, -2.053471, 1, 1, 1, 1, 1,
-0.8788571, 0.5507021, 0.9061708, 1, 1, 1, 1, 1,
-0.8775368, 0.1518899, -2.052274, 1, 1, 1, 1, 1,
-0.8740254, 0.5847069, -1.693148, 1, 1, 1, 1, 1,
-0.870621, 0.3267841, -1.497113, 1, 1, 1, 1, 1,
-0.8694071, -1.158046, -4.164896, 1, 1, 1, 1, 1,
-0.8658951, 0.566004, -2.347272, 1, 1, 1, 1, 1,
-0.8657594, 1.139167, -1.334606, 1, 1, 1, 1, 1,
-0.8615161, -0.8651992, -1.904605, 1, 1, 1, 1, 1,
-0.8580955, -1.141752, -3.039713, 1, 1, 1, 1, 1,
-0.8568945, -0.9814316, -3.730433, 1, 1, 1, 1, 1,
-0.8542591, -0.7872503, -1.387092, 1, 1, 1, 1, 1,
-0.851089, 0.3667823, 0.1383823, 1, 1, 1, 1, 1,
-0.8502343, -2.804894, -3.940163, 1, 1, 1, 1, 1,
-0.8501199, 0.3336759, -2.235507, 0, 0, 1, 1, 1,
-0.8474534, -0.3854903, -3.833714, 1, 0, 0, 1, 1,
-0.8470749, -1.049513, -2.070614, 1, 0, 0, 1, 1,
-0.8333955, -0.3505396, -1.808727, 1, 0, 0, 1, 1,
-0.8328509, -0.2984019, -3.459743, 1, 0, 0, 1, 1,
-0.8322235, -0.8833903, -1.99618, 1, 0, 0, 1, 1,
-0.8315793, 2.008336, -1.143435, 0, 0, 0, 1, 1,
-0.8221821, -0.7989728, -2.88466, 0, 0, 0, 1, 1,
-0.8218306, -0.2049569, -1.836738, 0, 0, 0, 1, 1,
-0.8191167, -0.7671423, -1.617198, 0, 0, 0, 1, 1,
-0.8186986, -0.1834265, -0.2893226, 0, 0, 0, 1, 1,
-0.8178805, 0.5170912, -1.987543, 0, 0, 0, 1, 1,
-0.8172696, -0.5806578, -2.158206, 0, 0, 0, 1, 1,
-0.8069286, -0.7185549, -1.847566, 1, 1, 1, 1, 1,
-0.8043872, -0.01019042, -1.746187, 1, 1, 1, 1, 1,
-0.804085, 0.8968405, 0.2555209, 1, 1, 1, 1, 1,
-0.8012211, -0.9074991, -2.133386, 1, 1, 1, 1, 1,
-0.7935493, -0.1687749, -1.762793, 1, 1, 1, 1, 1,
-0.7922878, 0.1571202, -1.068915, 1, 1, 1, 1, 1,
-0.7902499, -0.1449496, -1.528625, 1, 1, 1, 1, 1,
-0.7885697, -0.8086929, -2.053617, 1, 1, 1, 1, 1,
-0.7879662, 2.096011, -1.248947, 1, 1, 1, 1, 1,
-0.7788957, -0.2185139, -0.9899274, 1, 1, 1, 1, 1,
-0.7753315, 0.08241117, -0.5816269, 1, 1, 1, 1, 1,
-0.7733656, 0.1016462, -2.277697, 1, 1, 1, 1, 1,
-0.7703293, 0.2050124, -0.2467329, 1, 1, 1, 1, 1,
-0.769748, -1.467945, -1.109496, 1, 1, 1, 1, 1,
-0.7672225, -0.5172548, -1.500998, 1, 1, 1, 1, 1,
-0.7625206, -0.3854313, -2.594801, 0, 0, 1, 1, 1,
-0.7620813, -1.445351, -3.48065, 1, 0, 0, 1, 1,
-0.75371, -1.20275, -2.598598, 1, 0, 0, 1, 1,
-0.7489572, 0.86134, -1.898858, 1, 0, 0, 1, 1,
-0.744696, -1.878423, -3.751445, 1, 0, 0, 1, 1,
-0.7431378, 0.1147706, -1.650308, 1, 0, 0, 1, 1,
-0.7353215, 0.8403115, 0.3680274, 0, 0, 0, 1, 1,
-0.7265905, -1.164985, -4.244383, 0, 0, 0, 1, 1,
-0.7262163, 1.610795, -0.5622945, 0, 0, 0, 1, 1,
-0.724512, -1.91475, -2.022644, 0, 0, 0, 1, 1,
-0.718937, 0.3152686, -2.266364, 0, 0, 0, 1, 1,
-0.7178972, 2.683582, -0.400627, 0, 0, 0, 1, 1,
-0.7093645, -1.677885, -2.100974, 0, 0, 0, 1, 1,
-0.7021669, -0.3238354, -3.320419, 1, 1, 1, 1, 1,
-0.6906563, 0.6946143, -0.4110247, 1, 1, 1, 1, 1,
-0.6838241, -0.826789, -2.011326, 1, 1, 1, 1, 1,
-0.6778366, 1.480252, -1.273868, 1, 1, 1, 1, 1,
-0.6765525, -1.573395, -4.220344, 1, 1, 1, 1, 1,
-0.6681256, -1.688983, -2.281224, 1, 1, 1, 1, 1,
-0.6644464, -0.3958643, -2.36529, 1, 1, 1, 1, 1,
-0.6643953, -0.5938362, -3.232019, 1, 1, 1, 1, 1,
-0.6637327, -2.250159, -2.079746, 1, 1, 1, 1, 1,
-0.6624312, 0.3377372, -1.947914, 1, 1, 1, 1, 1,
-0.6623625, -2.493633, -3.800579, 1, 1, 1, 1, 1,
-0.6613749, -0.2651652, -2.402869, 1, 1, 1, 1, 1,
-0.6598125, -1.449986, -1.142894, 1, 1, 1, 1, 1,
-0.6592746, 1.846151, 0.04854359, 1, 1, 1, 1, 1,
-0.6584625, -0.005787035, -1.278139, 1, 1, 1, 1, 1,
-0.6569183, -0.4081217, -1.615088, 0, 0, 1, 1, 1,
-0.6557111, 2.323475, -1.493633, 1, 0, 0, 1, 1,
-0.6420081, -0.7458088, -3.65757, 1, 0, 0, 1, 1,
-0.6393214, 1.043207, -0.8381425, 1, 0, 0, 1, 1,
-0.6382937, 0.7046865, -0.2039123, 1, 0, 0, 1, 1,
-0.6363608, -0.1614452, -2.640351, 1, 0, 0, 1, 1,
-0.6239653, 0.3072051, -3.07447, 0, 0, 0, 1, 1,
-0.6222101, -0.4600283, -3.787643, 0, 0, 0, 1, 1,
-0.6218176, -1.755226, -4.327964, 0, 0, 0, 1, 1,
-0.6094255, -0.05259066, -0.9498566, 0, 0, 0, 1, 1,
-0.6050349, -0.9486509, -2.370332, 0, 0, 0, 1, 1,
-0.6018167, 0.3458245, -2.797868, 0, 0, 0, 1, 1,
-0.6006724, 0.086514, -1.662728, 0, 0, 0, 1, 1,
-0.600422, 0.03792619, -2.274494, 1, 1, 1, 1, 1,
-0.5993121, -0.06400091, -1.490935, 1, 1, 1, 1, 1,
-0.5894518, 1.06755, 0.7976944, 1, 1, 1, 1, 1,
-0.5873498, -0.5347684, -2.194587, 1, 1, 1, 1, 1,
-0.5864087, -0.4726776, -1.943321, 1, 1, 1, 1, 1,
-0.5832931, 1.892572, 0.5388527, 1, 1, 1, 1, 1,
-0.5823632, 1.302246, 0.4361856, 1, 1, 1, 1, 1,
-0.5819385, -1.008049, -2.316831, 1, 1, 1, 1, 1,
-0.580285, -0.18593, -2.684947, 1, 1, 1, 1, 1,
-0.5658951, -0.1472563, -4.462673, 1, 1, 1, 1, 1,
-0.5645472, 0.07599829, -1.145902, 1, 1, 1, 1, 1,
-0.5626076, 0.6733899, -1.238838, 1, 1, 1, 1, 1,
-0.5594231, -1.151825, -2.057401, 1, 1, 1, 1, 1,
-0.5588233, -1.304726, -3.372115, 1, 1, 1, 1, 1,
-0.5574518, 1.337787, -0.7378611, 1, 1, 1, 1, 1,
-0.5525636, -0.6985642, -1.674463, 0, 0, 1, 1, 1,
-0.5494636, 1.128797, -0.7496901, 1, 0, 0, 1, 1,
-0.5481361, -0.1755845, -0.5098918, 1, 0, 0, 1, 1,
-0.5469208, -0.985829, -3.949912, 1, 0, 0, 1, 1,
-0.5446485, 1.542022, 0.587554, 1, 0, 0, 1, 1,
-0.5403033, 0.03664177, -0.7192858, 1, 0, 0, 1, 1,
-0.5381336, -1.28378, -1.324797, 0, 0, 0, 1, 1,
-0.5377654, -0.5601285, -3.11372, 0, 0, 0, 1, 1,
-0.5377436, 0.8139734, -0.6251695, 0, 0, 0, 1, 1,
-0.5369423, 1.527986, -1.439764, 0, 0, 0, 1, 1,
-0.5352808, 0.03622048, -3.274072, 0, 0, 0, 1, 1,
-0.5231943, 0.604584, 0.2887779, 0, 0, 0, 1, 1,
-0.5221443, -0.612749, -2.067576, 0, 0, 0, 1, 1,
-0.5213087, -0.5298302, -1.648827, 1, 1, 1, 1, 1,
-0.5143695, 0.441452, 0.6887909, 1, 1, 1, 1, 1,
-0.5141643, 0.7718129, -1.522522, 1, 1, 1, 1, 1,
-0.5137084, -1.132829, -2.712425, 1, 1, 1, 1, 1,
-0.5126864, 0.8193911, -0.3057463, 1, 1, 1, 1, 1,
-0.5105001, -1.791584, -2.722841, 1, 1, 1, 1, 1,
-0.4964915, 0.5091975, -0.6453742, 1, 1, 1, 1, 1,
-0.492389, -1.483027, -4.198983, 1, 1, 1, 1, 1,
-0.4900143, 0.01333886, -0.4262535, 1, 1, 1, 1, 1,
-0.4854823, 0.3593954, -0.2867917, 1, 1, 1, 1, 1,
-0.4838111, -0.001820293, -0.8844966, 1, 1, 1, 1, 1,
-0.483284, 1.02044, 0.2075867, 1, 1, 1, 1, 1,
-0.4734878, -0.5895347, -1.121594, 1, 1, 1, 1, 1,
-0.4710933, -1.720621, -3.235999, 1, 1, 1, 1, 1,
-0.47084, -0.5380498, -2.390306, 1, 1, 1, 1, 1,
-0.4699599, -0.8639799, -2.936092, 0, 0, 1, 1, 1,
-0.4648214, -0.008953512, -1.152838, 1, 0, 0, 1, 1,
-0.4625335, 0.1735315, -0.3499736, 1, 0, 0, 1, 1,
-0.4590238, -0.5389933, -3.201643, 1, 0, 0, 1, 1,
-0.457384, 0.5881447, -0.7955089, 1, 0, 0, 1, 1,
-0.4494701, -0.4922647, -2.516361, 1, 0, 0, 1, 1,
-0.4489588, 0.1681746, -1.750558, 0, 0, 0, 1, 1,
-0.4488797, 0.834689, -3.220128, 0, 0, 0, 1, 1,
-0.4444095, 0.4478768, 0.3442059, 0, 0, 0, 1, 1,
-0.4383482, -0.9611212, -0.7748326, 0, 0, 0, 1, 1,
-0.4349014, -0.6595347, -3.420707, 0, 0, 0, 1, 1,
-0.434493, 0.1226858, -1.67001, 0, 0, 0, 1, 1,
-0.4341191, -1.938773, -3.496798, 0, 0, 0, 1, 1,
-0.4297937, -1.126062, -1.139163, 1, 1, 1, 1, 1,
-0.4291219, 0.529198, -0.6837294, 1, 1, 1, 1, 1,
-0.4254795, 0.1114388, 0.3662334, 1, 1, 1, 1, 1,
-0.4218783, 1.838794, -0.7586257, 1, 1, 1, 1, 1,
-0.4213324, -0.2095048, -1.469897, 1, 1, 1, 1, 1,
-0.4049791, 1.408808, -0.3043763, 1, 1, 1, 1, 1,
-0.404301, 0.6398129, -1.053061, 1, 1, 1, 1, 1,
-0.4036487, -1.174648, -2.953166, 1, 1, 1, 1, 1,
-0.4035038, -0.03694921, -2.498489, 1, 1, 1, 1, 1,
-0.3998896, -0.7516521, -3.519881, 1, 1, 1, 1, 1,
-0.3950268, 0.3519688, -1.409953, 1, 1, 1, 1, 1,
-0.3938978, -1.774911, -3.92961, 1, 1, 1, 1, 1,
-0.3845744, -1.090685, -2.558879, 1, 1, 1, 1, 1,
-0.381062, 0.1156389, -2.008443, 1, 1, 1, 1, 1,
-0.3792716, 1.269372, -2.442171, 1, 1, 1, 1, 1,
-0.3768404, 1.941272, 0.9115769, 0, 0, 1, 1, 1,
-0.3738407, 1.083137, 0.6715008, 1, 0, 0, 1, 1,
-0.3695666, 2.051589, -0.245636, 1, 0, 0, 1, 1,
-0.3670667, -0.7058775, -3.225092, 1, 0, 0, 1, 1,
-0.3665996, -1.007404, -1.038098, 1, 0, 0, 1, 1,
-0.3633825, -0.8475986, -2.600662, 1, 0, 0, 1, 1,
-0.3613689, 0.08963572, -1.671491, 0, 0, 0, 1, 1,
-0.3594078, 0.3088091, -1.471366, 0, 0, 0, 1, 1,
-0.3569422, 1.217959, -1.197058, 0, 0, 0, 1, 1,
-0.3539258, -1.77395, -2.598865, 0, 0, 0, 1, 1,
-0.3520347, -0.8553232, -3.698517, 0, 0, 0, 1, 1,
-0.3484635, 0.1860054, -1.702584, 0, 0, 0, 1, 1,
-0.3434654, -1.404383, -3.146455, 0, 0, 0, 1, 1,
-0.3432726, -0.8964461, -1.621337, 1, 1, 1, 1, 1,
-0.3376642, 1.176168, 1.091137, 1, 1, 1, 1, 1,
-0.33753, -0.6828752, -1.003727, 1, 1, 1, 1, 1,
-0.335978, -0.1865479, -2.479865, 1, 1, 1, 1, 1,
-0.3285113, -0.2326272, -0.02798883, 1, 1, 1, 1, 1,
-0.3253025, -2.225682, -4.182547, 1, 1, 1, 1, 1,
-0.324589, -2.359851, -3.203435, 1, 1, 1, 1, 1,
-0.3156928, 0.9039903, -1.317704, 1, 1, 1, 1, 1,
-0.3138985, -0.5580528, -2.626406, 1, 1, 1, 1, 1,
-0.299326, -0.1690813, -4.019323, 1, 1, 1, 1, 1,
-0.2984999, -1.575918, -2.451956, 1, 1, 1, 1, 1,
-0.2948196, 0.05581119, -2.883623, 1, 1, 1, 1, 1,
-0.2943158, -0.5292112, -4.63016, 1, 1, 1, 1, 1,
-0.2940632, 0.06562702, -1.856761, 1, 1, 1, 1, 1,
-0.2896202, -0.06580072, -2.706019, 1, 1, 1, 1, 1,
-0.2883209, -1.115656, -3.314593, 0, 0, 1, 1, 1,
-0.2852049, -1.042966, -0.537972, 1, 0, 0, 1, 1,
-0.2830791, 0.06789137, -1.943394, 1, 0, 0, 1, 1,
-0.2814235, 0.6167853, -0.2031243, 1, 0, 0, 1, 1,
-0.2754715, 1.356966, -0.04604106, 1, 0, 0, 1, 1,
-0.273224, 0.6986794, 0.2718221, 1, 0, 0, 1, 1,
-0.2635204, -0.9857159, -3.439927, 0, 0, 0, 1, 1,
-0.2630495, 0.6565395, -0.1993548, 0, 0, 0, 1, 1,
-0.2608833, -2.244198, -3.226575, 0, 0, 0, 1, 1,
-0.2533295, -0.354012, -2.772381, 0, 0, 0, 1, 1,
-0.2501981, -0.6709217, -3.777944, 0, 0, 0, 1, 1,
-0.2500912, 1.101551, -0.03763437, 0, 0, 0, 1, 1,
-0.2461501, 1.31358, -1.416177, 0, 0, 0, 1, 1,
-0.2457354, 1.421266, -0.9521213, 1, 1, 1, 1, 1,
-0.2440813, -0.6845625, -1.661558, 1, 1, 1, 1, 1,
-0.2374659, -1.322256, -4.493419, 1, 1, 1, 1, 1,
-0.2372464, 0.2481355, 0.1471761, 1, 1, 1, 1, 1,
-0.233972, 0.02805484, -0.3252991, 1, 1, 1, 1, 1,
-0.2318279, -0.0811707, -0.09656192, 1, 1, 1, 1, 1,
-0.2295744, -1.06275, -4.045704, 1, 1, 1, 1, 1,
-0.2282563, -0.5978003, -2.489528, 1, 1, 1, 1, 1,
-0.2268532, -0.926892, -2.136882, 1, 1, 1, 1, 1,
-0.2258789, 1.220328, -1.353604, 1, 1, 1, 1, 1,
-0.2246575, 0.170282, 0.5776702, 1, 1, 1, 1, 1,
-0.2142267, 1.467432, 0.632904, 1, 1, 1, 1, 1,
-0.2133271, 1.182365, -0.2408432, 1, 1, 1, 1, 1,
-0.2078389, -1.782313, -3.951458, 1, 1, 1, 1, 1,
-0.2037205, -0.9274379, -4.123427, 1, 1, 1, 1, 1,
-0.2024322, -0.1998904, -3.54739, 0, 0, 1, 1, 1,
-0.2016087, -0.07095174, -1.96708, 1, 0, 0, 1, 1,
-0.1988086, -0.9525706, -2.716199, 1, 0, 0, 1, 1,
-0.1975114, -0.6199418, -2.85315, 1, 0, 0, 1, 1,
-0.197066, 1.025929, -1.379646, 1, 0, 0, 1, 1,
-0.196168, 0.2422458, -1.721152, 1, 0, 0, 1, 1,
-0.1943111, 1.290692, -0.248519, 0, 0, 0, 1, 1,
-0.1942082, -1.354863, -3.719754, 0, 0, 0, 1, 1,
-0.1924337, 0.3850532, -1.07719, 0, 0, 0, 1, 1,
-0.1836587, -1.009764, -3.780157, 0, 0, 0, 1, 1,
-0.1828771, 0.750336, -0.9429805, 0, 0, 0, 1, 1,
-0.1818201, 0.7565275, -2.380905, 0, 0, 0, 1, 1,
-0.181501, 1.138722, -0.4343775, 0, 0, 0, 1, 1,
-0.1802152, 0.2427518, -1.162379, 1, 1, 1, 1, 1,
-0.1759886, -0.78708, -3.256382, 1, 1, 1, 1, 1,
-0.1753259, -0.3779493, -1.65366, 1, 1, 1, 1, 1,
-0.1715154, 0.8795179, 0.7270526, 1, 1, 1, 1, 1,
-0.1651047, 2.820008, 0.07041214, 1, 1, 1, 1, 1,
-0.1604355, 0.1280842, 0.08673157, 1, 1, 1, 1, 1,
-0.1533814, -0.1856284, -3.247823, 1, 1, 1, 1, 1,
-0.1529319, -0.9991229, -3.393848, 1, 1, 1, 1, 1,
-0.1495268, -0.2663358, -3.594659, 1, 1, 1, 1, 1,
-0.1482584, 1.818765, -0.5408734, 1, 1, 1, 1, 1,
-0.1470419, -0.5622036, -4.020629, 1, 1, 1, 1, 1,
-0.1458858, -0.608152, -2.943903, 1, 1, 1, 1, 1,
-0.1453809, 0.1570108, 0.4423208, 1, 1, 1, 1, 1,
-0.1430532, -0.05921013, -2.256533, 1, 1, 1, 1, 1,
-0.1428005, 1.363534, -0.5080894, 1, 1, 1, 1, 1,
-0.1398993, 0.210796, -1.04668, 0, 0, 1, 1, 1,
-0.1357095, -0.3727475, -2.111412, 1, 0, 0, 1, 1,
-0.1287902, -1.062271, -2.912253, 1, 0, 0, 1, 1,
-0.124435, 0.6833054, -0.1301206, 1, 0, 0, 1, 1,
-0.1228728, 1.4768, 0.2846137, 1, 0, 0, 1, 1,
-0.1208683, 0.555876, 0.1636938, 1, 0, 0, 1, 1,
-0.1197169, 1.918768, 0.145676, 0, 0, 0, 1, 1,
-0.1115486, -1.287279, -3.95506, 0, 0, 0, 1, 1,
-0.1113588, 1.295169, 1.431607, 0, 0, 0, 1, 1,
-0.106189, -0.05814464, -1.667059, 0, 0, 0, 1, 1,
-0.1054145, 0.710322, -0.4511868, 0, 0, 0, 1, 1,
-0.1033334, -0.6044767, -5.444338, 0, 0, 0, 1, 1,
-0.1016048, 1.10207, 0.4475898, 0, 0, 0, 1, 1,
-0.09769052, -0.767687, -2.77014, 1, 1, 1, 1, 1,
-0.09399109, -0.3991126, -0.7337694, 1, 1, 1, 1, 1,
-0.09355734, 0.5367352, 0.4753784, 1, 1, 1, 1, 1,
-0.09002661, 0.1980374, 0.4881529, 1, 1, 1, 1, 1,
-0.08660792, -0.6170117, -4.041036, 1, 1, 1, 1, 1,
-0.08621592, 0.3566973, 0.2304772, 1, 1, 1, 1, 1,
-0.08600667, -0.04570475, -1.371959, 1, 1, 1, 1, 1,
-0.08173171, -0.4150087, -2.254214, 1, 1, 1, 1, 1,
-0.08139125, -1.650963, -2.082868, 1, 1, 1, 1, 1,
-0.07703563, 0.3211038, -0.5107771, 1, 1, 1, 1, 1,
-0.07533424, -0.6983117, -2.953458, 1, 1, 1, 1, 1,
-0.07288912, -0.9630276, -4.960968, 1, 1, 1, 1, 1,
-0.07145164, -1.927879, -2.768371, 1, 1, 1, 1, 1,
-0.06839772, -0.07341076, -2.470911, 1, 1, 1, 1, 1,
-0.06737235, -1.528482, -2.495918, 1, 1, 1, 1, 1,
-0.06616394, 0.6871001, -0.4750911, 0, 0, 1, 1, 1,
-0.06328703, 0.1850418, 0.01044947, 1, 0, 0, 1, 1,
-0.06098307, -0.6423821, -3.614467, 1, 0, 0, 1, 1,
-0.06095423, 0.3922893, -0.03996486, 1, 0, 0, 1, 1,
-0.05988662, -0.4731192, -3.685415, 1, 0, 0, 1, 1,
-0.05011571, -1.057607, -2.978277, 1, 0, 0, 1, 1,
-0.04962846, -1.175469, -3.0487, 0, 0, 0, 1, 1,
-0.0468282, -0.08575663, -2.276391, 0, 0, 0, 1, 1,
-0.04339016, 0.7044082, -1.092782, 0, 0, 0, 1, 1,
-0.03464321, -2.006613, -2.845327, 0, 0, 0, 1, 1,
-0.03277089, -0.5622351, -3.492574, 0, 0, 0, 1, 1,
-0.03085735, 0.06238171, 0.4863742, 0, 0, 0, 1, 1,
-0.02946776, 2.143069, 0.7778348, 0, 0, 0, 1, 1,
-0.0294677, 2.358894, 0.5895091, 1, 1, 1, 1, 1,
-0.02639885, 2.71286, 1.609804, 1, 1, 1, 1, 1,
-0.02585206, -1.342654, -2.691825, 1, 1, 1, 1, 1,
-0.01714201, -0.7246231, -2.389698, 1, 1, 1, 1, 1,
-0.0156361, 0.2296016, 0.1798107, 1, 1, 1, 1, 1,
-0.01469301, -0.4874, -2.295579, 1, 1, 1, 1, 1,
-0.01285908, -0.2888484, -2.981628, 1, 1, 1, 1, 1,
-0.01155475, 0.7130799, -0.7923037, 1, 1, 1, 1, 1,
-0.01114843, -2.244464, -3.491321, 1, 1, 1, 1, 1,
-0.003878074, 0.09739877, -1.143595, 1, 1, 1, 1, 1,
-0.002813604, -0.2363356, -2.824684, 1, 1, 1, 1, 1,
-0.002775312, -0.3047062, -3.805284, 1, 1, 1, 1, 1,
0.003938125, -2.531928, 3.640265, 1, 1, 1, 1, 1,
0.006764788, -0.4315982, 5.368259, 1, 1, 1, 1, 1,
0.01838487, -0.2037413, 2.754555, 1, 1, 1, 1, 1,
0.02137091, -0.02832616, 1.885372, 0, 0, 1, 1, 1,
0.02227816, 0.1258924, 0.4995129, 1, 0, 0, 1, 1,
0.02538865, -1.783646, 3.404114, 1, 0, 0, 1, 1,
0.0280447, 2.137404, -0.4952796, 1, 0, 0, 1, 1,
0.02900004, -0.3896748, 3.001801, 1, 0, 0, 1, 1,
0.02923703, -0.8056821, 4.149529, 1, 0, 0, 1, 1,
0.03339722, -0.2937109, 2.328693, 0, 0, 0, 1, 1,
0.0346307, -0.6668196, 3.244299, 0, 0, 0, 1, 1,
0.03766627, -0.6539867, 3.387039, 0, 0, 0, 1, 1,
0.03995932, 0.4669397, 0.4497805, 0, 0, 0, 1, 1,
0.03999158, -0.8891165, 4.103644, 0, 0, 0, 1, 1,
0.04128652, 0.2434833, 1.958071, 0, 0, 0, 1, 1,
0.04188007, -0.2176727, 5.082784, 0, 0, 0, 1, 1,
0.04296412, -0.5055421, 2.440475, 1, 1, 1, 1, 1,
0.04368094, -1.09534, 4.26038, 1, 1, 1, 1, 1,
0.04450091, -0.6644287, 5.30502, 1, 1, 1, 1, 1,
0.04572947, 0.8187804, -0.762573, 1, 1, 1, 1, 1,
0.05022295, -1.960984, 4.992537, 1, 1, 1, 1, 1,
0.05372205, 2.689604, -0.003989265, 1, 1, 1, 1, 1,
0.05842541, -0.2331052, 1.917213, 1, 1, 1, 1, 1,
0.05848088, 0.473753, -0.1202081, 1, 1, 1, 1, 1,
0.0652486, -0.1484443, 2.478145, 1, 1, 1, 1, 1,
0.06632707, 0.01855915, 2.094249, 1, 1, 1, 1, 1,
0.06879254, 0.2705604, -0.67844, 1, 1, 1, 1, 1,
0.0689529, -0.04657354, 3.337989, 1, 1, 1, 1, 1,
0.07236454, -1.38482, 2.826069, 1, 1, 1, 1, 1,
0.07290564, 0.9590154, 1.448546, 1, 1, 1, 1, 1,
0.07384264, 0.9249739, -0.1624817, 1, 1, 1, 1, 1,
0.07586611, 1.887792, 0.1010809, 0, 0, 1, 1, 1,
0.07707932, -0.7402653, 2.873975, 1, 0, 0, 1, 1,
0.07762689, 2.006062, 1.564457, 1, 0, 0, 1, 1,
0.0858677, -0.571341, 4.123443, 1, 0, 0, 1, 1,
0.08914284, 0.4287757, 0.3603405, 1, 0, 0, 1, 1,
0.09013368, -0.09868941, 2.696615, 1, 0, 0, 1, 1,
0.09061667, 0.6616249, 0.4451678, 0, 0, 0, 1, 1,
0.0975092, -0.1125393, 1.879721, 0, 0, 0, 1, 1,
0.1015236, 0.565055, -1.84122, 0, 0, 0, 1, 1,
0.1058137, 0.6164119, -1.596842, 0, 0, 0, 1, 1,
0.1059349, 1.272808, -1.529058, 0, 0, 0, 1, 1,
0.1081529, 1.358112, -1.000922, 0, 0, 0, 1, 1,
0.110333, 0.5651531, 1.394438, 0, 0, 0, 1, 1,
0.1158434, -0.1424942, 2.563647, 1, 1, 1, 1, 1,
0.1188186, -1.579643, 3.034448, 1, 1, 1, 1, 1,
0.1193023, 0.2302761, 0.3026519, 1, 1, 1, 1, 1,
0.1196921, -1.923684, 2.181658, 1, 1, 1, 1, 1,
0.1211874, 0.5309268, -0.1958306, 1, 1, 1, 1, 1,
0.1213438, -0.3889284, 4.159486, 1, 1, 1, 1, 1,
0.1214051, 1.84771, -0.1682423, 1, 1, 1, 1, 1,
0.1218781, -0.5459291, 2.15156, 1, 1, 1, 1, 1,
0.12391, 1.322838, 0.4624125, 1, 1, 1, 1, 1,
0.123922, 0.4889784, 0.06349437, 1, 1, 1, 1, 1,
0.1257523, -1.517238, 2.847742, 1, 1, 1, 1, 1,
0.1257576, 2.543355, 1.13993, 1, 1, 1, 1, 1,
0.1315197, -0.1509791, 2.943966, 1, 1, 1, 1, 1,
0.1416907, 1.254325, 0.4582627, 1, 1, 1, 1, 1,
0.1418601, -0.463813, 2.290944, 1, 1, 1, 1, 1,
0.1419257, -0.2999464, 2.755669, 0, 0, 1, 1, 1,
0.143523, 0.7609125, -0.6341215, 1, 0, 0, 1, 1,
0.1492617, 1.718717, 0.5314679, 1, 0, 0, 1, 1,
0.1497124, -0.7590866, 3.822291, 1, 0, 0, 1, 1,
0.1549255, 0.655764, 0.9983683, 1, 0, 0, 1, 1,
0.156057, 0.6373923, -0.1931368, 1, 0, 0, 1, 1,
0.1588205, 0.7819972, 1.895625, 0, 0, 0, 1, 1,
0.1591139, -0.2993101, 2.846089, 0, 0, 0, 1, 1,
0.1654866, -1.191802, 2.596015, 0, 0, 0, 1, 1,
0.1690775, 0.05472479, 3.134462, 0, 0, 0, 1, 1,
0.1691632, -0.7426592, 3.059669, 0, 0, 0, 1, 1,
0.1745998, 0.5668524, 0.7233538, 0, 0, 0, 1, 1,
0.1833805, -0.2078698, 2.326669, 0, 0, 0, 1, 1,
0.1836732, 0.4117845, 1.855804, 1, 1, 1, 1, 1,
0.1838059, -0.7863687, 2.413019, 1, 1, 1, 1, 1,
0.1838845, 1.230601, 1.125565, 1, 1, 1, 1, 1,
0.1859378, 0.3579244, 2.219977, 1, 1, 1, 1, 1,
0.1888256, 1.347622, 0.4151878, 1, 1, 1, 1, 1,
0.189272, -0.360101, 0.9130164, 1, 1, 1, 1, 1,
0.1934324, 0.8515635, 1.053279, 1, 1, 1, 1, 1,
0.19661, -1.731098, 2.572969, 1, 1, 1, 1, 1,
0.1976993, -1.268816, 2.115928, 1, 1, 1, 1, 1,
0.1978287, -0.1868671, 3.499867, 1, 1, 1, 1, 1,
0.2008032, 1.032877, -0.2334342, 1, 1, 1, 1, 1,
0.2014084, 1.377865, 0.1750318, 1, 1, 1, 1, 1,
0.2040991, 0.3965811, 1.281022, 1, 1, 1, 1, 1,
0.2041522, -0.02726905, 1.583438, 1, 1, 1, 1, 1,
0.2046554, 0.9679349, 0.1687935, 1, 1, 1, 1, 1,
0.2069891, -1.088238, 0.2921297, 0, 0, 1, 1, 1,
0.2086798, -0.7866066, 3.071791, 1, 0, 0, 1, 1,
0.2094609, -0.04149667, 1.367294, 1, 0, 0, 1, 1,
0.2107575, 0.6161353, -0.07085155, 1, 0, 0, 1, 1,
0.2109597, -0.1071679, 2.34412, 1, 0, 0, 1, 1,
0.2127725, -0.07823619, 1.136349, 1, 0, 0, 1, 1,
0.2130952, 1.553236, -0.029643, 0, 0, 0, 1, 1,
0.2142018, -1.171672, 4.086055, 0, 0, 0, 1, 1,
0.2211128, -1.566713, 2.589943, 0, 0, 0, 1, 1,
0.2212596, -0.573272, 4.110574, 0, 0, 0, 1, 1,
0.2335061, -0.5891821, 2.174357, 0, 0, 0, 1, 1,
0.2343373, -0.6858889, 2.955636, 0, 0, 0, 1, 1,
0.2343495, 0.3767882, 0.5439861, 0, 0, 0, 1, 1,
0.2346558, 0.08967391, 1.948228, 1, 1, 1, 1, 1,
0.2349772, -0.1901166, 3.073393, 1, 1, 1, 1, 1,
0.2434625, -0.7063155, 1.194823, 1, 1, 1, 1, 1,
0.2434629, 0.9210745, -0.6977535, 1, 1, 1, 1, 1,
0.2452902, 0.4907248, 1.292794, 1, 1, 1, 1, 1,
0.2496803, -1.187614, 2.666439, 1, 1, 1, 1, 1,
0.2512265, 1.710977, -0.2531981, 1, 1, 1, 1, 1,
0.253223, -1.556272, 2.887297, 1, 1, 1, 1, 1,
0.2554351, 0.04666738, 1.047816, 1, 1, 1, 1, 1,
0.2560801, -1.111022, 3.915117, 1, 1, 1, 1, 1,
0.2565471, 1.279488, 0.4391424, 1, 1, 1, 1, 1,
0.2566337, -0.7057588, 1.626835, 1, 1, 1, 1, 1,
0.2568682, 0.8152521, -2.079992, 1, 1, 1, 1, 1,
0.2596727, 1.63419, 3.124148, 1, 1, 1, 1, 1,
0.2714313, 0.1744797, 1.134671, 1, 1, 1, 1, 1,
0.2732369, 0.6969215, 1.85696, 0, 0, 1, 1, 1,
0.2784283, 0.1141553, 2.375579, 1, 0, 0, 1, 1,
0.2854017, -0.4658502, 3.336715, 1, 0, 0, 1, 1,
0.2858522, 2.422857, 0.1034145, 1, 0, 0, 1, 1,
0.2867385, -0.4384436, 2.476813, 1, 0, 0, 1, 1,
0.289846, 1.588893, -1.692385, 1, 0, 0, 1, 1,
0.2961515, 0.05577965, 0.001478468, 0, 0, 0, 1, 1,
0.3004002, -0.304314, 2.135165, 0, 0, 0, 1, 1,
0.3014054, 0.4603525, 1.53398, 0, 0, 0, 1, 1,
0.3016337, 1.219632, 0.0149259, 0, 0, 0, 1, 1,
0.3093728, -0.7476227, 2.503986, 0, 0, 0, 1, 1,
0.3151837, -0.04247156, 1.390504, 0, 0, 0, 1, 1,
0.3151929, 0.08702029, 2.626467, 0, 0, 0, 1, 1,
0.3152501, -0.3454778, 2.873454, 1, 1, 1, 1, 1,
0.3170906, -0.7487772, 2.513515, 1, 1, 1, 1, 1,
0.3257395, -0.7234046, 4.544281, 1, 1, 1, 1, 1,
0.3326797, 2.095717, 1.150886, 1, 1, 1, 1, 1,
0.3333254, 0.431742, 0.6035627, 1, 1, 1, 1, 1,
0.3362916, 1.702026, -0.5039925, 1, 1, 1, 1, 1,
0.3410472, -0.05664586, 1.441876, 1, 1, 1, 1, 1,
0.34228, -0.7925225, 2.244236, 1, 1, 1, 1, 1,
0.3454716, 0.6127136, 0.3143612, 1, 1, 1, 1, 1,
0.3644509, 1.115206, -0.5562745, 1, 1, 1, 1, 1,
0.3654397, -0.4770015, 2.119082, 1, 1, 1, 1, 1,
0.3733422, -0.1281143, 2.187851, 1, 1, 1, 1, 1,
0.3785184, -0.5307341, 2.423262, 1, 1, 1, 1, 1,
0.3807503, -0.6333517, 2.967087, 1, 1, 1, 1, 1,
0.3809725, -2.401026, 1.103125, 1, 1, 1, 1, 1,
0.3839777, 0.920699, -0.1941656, 0, 0, 1, 1, 1,
0.3840345, -0.7226629, 2.040376, 1, 0, 0, 1, 1,
0.3852271, 1.717743, 1.144169, 1, 0, 0, 1, 1,
0.3877479, -0.3651342, 2.317141, 1, 0, 0, 1, 1,
0.3911667, 1.608277, 0.9835673, 1, 0, 0, 1, 1,
0.3915709, 0.1688587, 1.354405, 1, 0, 0, 1, 1,
0.3916124, 0.1913538, -0.08419212, 0, 0, 0, 1, 1,
0.3917894, 1.067643, -0.1233329, 0, 0, 0, 1, 1,
0.3930797, -0.6583818, 3.094292, 0, 0, 0, 1, 1,
0.3951686, 0.6676338, 2.098112, 0, 0, 0, 1, 1,
0.3974433, -0.3765668, 1.503489, 0, 0, 0, 1, 1,
0.4012056, -0.938916, 2.149335, 0, 0, 0, 1, 1,
0.4027075, -1.095001, 3.605992, 0, 0, 0, 1, 1,
0.4028389, 0.07262972, 2.546999, 1, 1, 1, 1, 1,
0.404977, -0.4980415, -0.1039934, 1, 1, 1, 1, 1,
0.4059591, -1.874429, 3.57026, 1, 1, 1, 1, 1,
0.4100626, -0.6173452, 2.390867, 1, 1, 1, 1, 1,
0.4168348, 1.743903, -0.3477663, 1, 1, 1, 1, 1,
0.4210615, 0.3685153, 0.8943332, 1, 1, 1, 1, 1,
0.4213712, -0.5563117, 1.896241, 1, 1, 1, 1, 1,
0.4249156, -0.7737544, 4.011083, 1, 1, 1, 1, 1,
0.4256358, 0.3478844, 1.229118, 1, 1, 1, 1, 1,
0.4283173, 0.128091, 2.214237, 1, 1, 1, 1, 1,
0.4310149, 0.0377754, 2.101113, 1, 1, 1, 1, 1,
0.4313338, -0.3347704, 3.54798, 1, 1, 1, 1, 1,
0.4315805, 1.738551, -0.611683, 1, 1, 1, 1, 1,
0.4347246, 0.6601437, 2.98617, 1, 1, 1, 1, 1,
0.4397453, -0.07508816, 0.4133152, 1, 1, 1, 1, 1,
0.4427972, -1.924078, 3.269084, 0, 0, 1, 1, 1,
0.4430495, -0.08761373, 1.883458, 1, 0, 0, 1, 1,
0.4475503, 0.6282262, 0.1712354, 1, 0, 0, 1, 1,
0.4488587, -0.1211711, 2.120127, 1, 0, 0, 1, 1,
0.4502875, -0.6111534, 3.012436, 1, 0, 0, 1, 1,
0.450395, -0.1925846, 1.066731, 1, 0, 0, 1, 1,
0.4510042, 0.2768172, 0.06852089, 0, 0, 0, 1, 1,
0.4537248, -0.5219218, 1.460202, 0, 0, 0, 1, 1,
0.4543438, -0.009442116, 1.481763, 0, 0, 0, 1, 1,
0.4569132, 1.058167, -0.5127569, 0, 0, 0, 1, 1,
0.458572, 1.105125, -1.295209, 0, 0, 0, 1, 1,
0.4593465, 0.6629226, 1.778017, 0, 0, 0, 1, 1,
0.467533, -0.1074603, 2.651231, 0, 0, 0, 1, 1,
0.4693237, -0.6273358, 3.3387, 1, 1, 1, 1, 1,
0.4783398, -2.119588, 3.602045, 1, 1, 1, 1, 1,
0.4839894, -2.608051, 3.976097, 1, 1, 1, 1, 1,
0.4845994, 1.196187, -0.5783787, 1, 1, 1, 1, 1,
0.48468, -0.3203455, 1.720413, 1, 1, 1, 1, 1,
0.4856933, 0.511873, 0.002813851, 1, 1, 1, 1, 1,
0.4859633, 0.2576841, 1.992972, 1, 1, 1, 1, 1,
0.4886212, -1.564072, 2.364054, 1, 1, 1, 1, 1,
0.4907634, 0.05772741, 1.256102, 1, 1, 1, 1, 1,
0.4909661, 0.08295514, -0.3416369, 1, 1, 1, 1, 1,
0.4916262, -1.205992, 4.352537, 1, 1, 1, 1, 1,
0.4927629, 0.2261405, 2.059385, 1, 1, 1, 1, 1,
0.4936526, -0.1877098, 1.001929, 1, 1, 1, 1, 1,
0.4944222, 1.546859, 1.214734, 1, 1, 1, 1, 1,
0.4947934, 0.880839, -0.2597092, 1, 1, 1, 1, 1,
0.4955164, 0.6764954, -0.5361139, 0, 0, 1, 1, 1,
0.4960972, -0.1962519, 2.86301, 1, 0, 0, 1, 1,
0.5006418, -1.409076, 0.9874286, 1, 0, 0, 1, 1,
0.5055285, 0.6146209, -0.07961337, 1, 0, 0, 1, 1,
0.506178, -1.395671, 4.951346, 1, 0, 0, 1, 1,
0.5077015, -0.13654, 0.8458466, 1, 0, 0, 1, 1,
0.5079951, 0.8781734, 0.03500358, 0, 0, 0, 1, 1,
0.5094311, 0.0467912, 1.717255, 0, 0, 0, 1, 1,
0.5100119, 0.5412405, 1.371964, 0, 0, 0, 1, 1,
0.5134016, -0.133124, 2.283646, 0, 0, 0, 1, 1,
0.5259538, 0.8469505, 1.030819, 0, 0, 0, 1, 1,
0.5283788, -0.3518198, 1.455738, 0, 0, 0, 1, 1,
0.5286855, -0.8346344, 2.937564, 0, 0, 0, 1, 1,
0.5294055, 0.4092003, 0.687671, 1, 1, 1, 1, 1,
0.5307468, 0.9612579, 0.7401003, 1, 1, 1, 1, 1,
0.5329126, 0.4311064, -0.5443559, 1, 1, 1, 1, 1,
0.5342348, -1.229923, 3.658659, 1, 1, 1, 1, 1,
0.5383977, 0.8466789, 1.268576, 1, 1, 1, 1, 1,
0.5389492, -0.7639, 3.831861, 1, 1, 1, 1, 1,
0.5390599, -0.6473994, 2.909509, 1, 1, 1, 1, 1,
0.5437044, -0.69203, 1.471184, 1, 1, 1, 1, 1,
0.5454722, -1.390559, 3.97251, 1, 1, 1, 1, 1,
0.5478202, 0.56851, 0.3644206, 1, 1, 1, 1, 1,
0.552852, 0.9854895, -0.615466, 1, 1, 1, 1, 1,
0.5538704, -1.900542, 2.993444, 1, 1, 1, 1, 1,
0.5546961, -0.2164586, 3.346641, 1, 1, 1, 1, 1,
0.5584975, 0.6077004, 0.4670775, 1, 1, 1, 1, 1,
0.5593801, -0.2934441, 1.442239, 1, 1, 1, 1, 1,
0.5611234, 0.04295963, 2.126937, 0, 0, 1, 1, 1,
0.5612031, 1.744828, -1.47183, 1, 0, 0, 1, 1,
0.5667902, -0.1991093, 3.576371, 1, 0, 0, 1, 1,
0.5683799, -0.1750717, 2.380676, 1, 0, 0, 1, 1,
0.5730847, 2.21909, -0.8624744, 1, 0, 0, 1, 1,
0.5753535, 0.3134227, -0.5052277, 1, 0, 0, 1, 1,
0.5775056, 1.070323, 0.2798367, 0, 0, 0, 1, 1,
0.5785553, 1.192264, 0.02468704, 0, 0, 0, 1, 1,
0.5933131, -1.77991, 3.240755, 0, 0, 0, 1, 1,
0.5938329, 0.01616225, 1.666361, 0, 0, 0, 1, 1,
0.5999184, -0.5026208, 1.249377, 0, 0, 0, 1, 1,
0.6096764, -0.02009005, 1.62782, 0, 0, 0, 1, 1,
0.611295, 0.8211852, 0.2787758, 0, 0, 0, 1, 1,
0.6113679, 0.2660826, 0.9872293, 1, 1, 1, 1, 1,
0.6117978, -0.02631147, 1.364675, 1, 1, 1, 1, 1,
0.6122763, -1.646737, 2.504553, 1, 1, 1, 1, 1,
0.6153046, -1.02339, 0.8081092, 1, 1, 1, 1, 1,
0.6166053, 1.198646, 1.115786, 1, 1, 1, 1, 1,
0.6183563, 0.463579, 0.6726427, 1, 1, 1, 1, 1,
0.621157, 0.1073387, 1.431297, 1, 1, 1, 1, 1,
0.6218887, 0.4400501, -0.4325148, 1, 1, 1, 1, 1,
0.6235994, 0.3512352, 3.144511, 1, 1, 1, 1, 1,
0.6240511, 0.8771055, 1.078757, 1, 1, 1, 1, 1,
0.6265028, 0.4807675, 1.919341, 1, 1, 1, 1, 1,
0.6265079, 1.851917, -1.630611, 1, 1, 1, 1, 1,
0.6330228, -1.210726, 2.699874, 1, 1, 1, 1, 1,
0.6444967, 0.9154119, 1.972826, 1, 1, 1, 1, 1,
0.6468765, 0.3283516, 1.985648, 1, 1, 1, 1, 1,
0.6483847, 0.176566, 1.717826, 0, 0, 1, 1, 1,
0.6494386, -1.131955, 2.249542, 1, 0, 0, 1, 1,
0.6495938, -1.478399, 3.273612, 1, 0, 0, 1, 1,
0.6518927, 0.1518554, 2.032604, 1, 0, 0, 1, 1,
0.6558048, 0.7372879, 1.650811, 1, 0, 0, 1, 1,
0.6761358, -2.667632, 4.339162, 1, 0, 0, 1, 1,
0.6764566, 0.6839294, 0.7617335, 0, 0, 0, 1, 1,
0.6776288, -1.351736, 1.332828, 0, 0, 0, 1, 1,
0.6791575, 0.8756169, 1.596538, 0, 0, 0, 1, 1,
0.6811332, 1.286709, 2.141706, 0, 0, 0, 1, 1,
0.6821893, 1.942542, 2.411093, 0, 0, 0, 1, 1,
0.6883003, 0.2022644, 3.127819, 0, 0, 0, 1, 1,
0.6905062, 0.3006837, -0.3479653, 0, 0, 0, 1, 1,
0.6910917, -1.231437, 3.047532, 1, 1, 1, 1, 1,
0.6912991, 0.6612751, 1.014811, 1, 1, 1, 1, 1,
0.6951248, -0.6926057, 1.6621, 1, 1, 1, 1, 1,
0.6984766, 0.7967672, -0.1997674, 1, 1, 1, 1, 1,
0.698922, -0.06936543, 0.3324031, 1, 1, 1, 1, 1,
0.7005838, 0.5531985, -0.4852724, 1, 1, 1, 1, 1,
0.7049893, 0.5452372, 2.09698, 1, 1, 1, 1, 1,
0.7088249, -0.8811789, 1.857512, 1, 1, 1, 1, 1,
0.7106537, -1.701873, 2.281718, 1, 1, 1, 1, 1,
0.711317, 0.9988694, -0.654157, 1, 1, 1, 1, 1,
0.7123592, -0.08881703, 3.251468, 1, 1, 1, 1, 1,
0.7186118, -0.1465419, 1.545539, 1, 1, 1, 1, 1,
0.7201334, 1.221065, 1.717389, 1, 1, 1, 1, 1,
0.7248458, -0.1846405, 2.069723, 1, 1, 1, 1, 1,
0.7267909, -0.2237223, -0.3191876, 1, 1, 1, 1, 1,
0.7313277, -1.153079, 2.007319, 0, 0, 1, 1, 1,
0.7338797, 0.9880732, 2.239677, 1, 0, 0, 1, 1,
0.7342989, -0.4594223, 2.488796, 1, 0, 0, 1, 1,
0.7347098, 1.929194, 1.592256, 1, 0, 0, 1, 1,
0.7358172, -0.1364008, 3.117379, 1, 0, 0, 1, 1,
0.7358411, 0.514469, 1.738333, 1, 0, 0, 1, 1,
0.7391651, -0.1461082, 1.961246, 0, 0, 0, 1, 1,
0.7408727, -0.5728161, 3.535269, 0, 0, 0, 1, 1,
0.741595, -1.189576, 4.296705, 0, 0, 0, 1, 1,
0.7462071, 1.145796, -2.109949, 0, 0, 0, 1, 1,
0.7477831, 1.537477, 1.412924, 0, 0, 0, 1, 1,
0.7485012, 0.05274959, 2.128438, 0, 0, 0, 1, 1,
0.7488595, 0.3745889, -1.233661, 0, 0, 0, 1, 1,
0.7490573, -0.1832699, 1.585846, 1, 1, 1, 1, 1,
0.7496904, -1.401687, 2.287649, 1, 1, 1, 1, 1,
0.7541189, 0.6749494, 3.250366, 1, 1, 1, 1, 1,
0.7556329, -0.2947796, 2.038251, 1, 1, 1, 1, 1,
0.7569706, 0.1548405, 1.873212, 1, 1, 1, 1, 1,
0.7603059, 2.775403, 1.5236, 1, 1, 1, 1, 1,
0.7603254, -0.8975706, 1.516343, 1, 1, 1, 1, 1,
0.7658448, 1.051542, -0.2425386, 1, 1, 1, 1, 1,
0.7666781, 1.012028, 1.925586, 1, 1, 1, 1, 1,
0.7714304, -0.9135745, 1.899522, 1, 1, 1, 1, 1,
0.7719468, -0.6278384, 2.857741, 1, 1, 1, 1, 1,
0.7740641, -0.28564, 3.940938, 1, 1, 1, 1, 1,
0.7779327, 2.08773, 1.825318, 1, 1, 1, 1, 1,
0.7782358, 0.9971907, 0.06782354, 1, 1, 1, 1, 1,
0.7789103, -0.8135139, 2.299576, 1, 1, 1, 1, 1,
0.7808527, -0.6225921, 1.889367, 0, 0, 1, 1, 1,
0.7818883, 0.7882981, 0.8411385, 1, 0, 0, 1, 1,
0.7881047, -0.6082116, 1.599712, 1, 0, 0, 1, 1,
0.7952356, -0.4727009, 2.809368, 1, 0, 0, 1, 1,
0.8010936, -0.1285331, 1.818866, 1, 0, 0, 1, 1,
0.8043885, -0.1949186, 2.21484, 1, 0, 0, 1, 1,
0.8045796, -0.820418, 3.813905, 0, 0, 0, 1, 1,
0.8068687, -0.545171, 1.553583, 0, 0, 0, 1, 1,
0.8089774, -1.060776, 2.653802, 0, 0, 0, 1, 1,
0.8095615, 0.1727659, 3.375221, 0, 0, 0, 1, 1,
0.8099593, 0.3651038, -0.6186549, 0, 0, 0, 1, 1,
0.8125702, -3.220519, 2.048708, 0, 0, 0, 1, 1,
0.8146364, -0.8241057, 3.770711, 0, 0, 0, 1, 1,
0.8158014, 1.061612, 0.03759221, 1, 1, 1, 1, 1,
0.8160316, -0.2543297, 1.986108, 1, 1, 1, 1, 1,
0.8192221, -0.5487152, 3.041912, 1, 1, 1, 1, 1,
0.8195341, -0.02776475, 0.828308, 1, 1, 1, 1, 1,
0.8239292, -0.8552603, 2.250271, 1, 1, 1, 1, 1,
0.8274042, 0.7538418, -1.696444, 1, 1, 1, 1, 1,
0.835223, -0.9271957, 2.883241, 1, 1, 1, 1, 1,
0.8377154, 1.074849, 0.7587739, 1, 1, 1, 1, 1,
0.839919, 0.3576882, -0.1944671, 1, 1, 1, 1, 1,
0.845719, -1.992761, 2.261652, 1, 1, 1, 1, 1,
0.8478947, 1.122049, 0.1179334, 1, 1, 1, 1, 1,
0.8498485, 0.8521672, -0.1562123, 1, 1, 1, 1, 1,
0.8508738, -1.498491, 1.845073, 1, 1, 1, 1, 1,
0.8513956, -0.9900966, 2.69059, 1, 1, 1, 1, 1,
0.8635096, 0.1171041, 1.675795, 1, 1, 1, 1, 1,
0.8686149, -0.2943157, 1.5089, 0, 0, 1, 1, 1,
0.8729282, -0.8607966, 2.347103, 1, 0, 0, 1, 1,
0.8759869, -0.3673044, 1.716388, 1, 0, 0, 1, 1,
0.8818368, 0.7968243, 0.5930243, 1, 0, 0, 1, 1,
0.8826614, 0.02257751, 1.040471, 1, 0, 0, 1, 1,
0.8860692, -0.7297133, 2.777694, 1, 0, 0, 1, 1,
0.8882173, 1.148339, 0.7170485, 0, 0, 0, 1, 1,
0.8892787, -0.3143606, 2.411769, 0, 0, 0, 1, 1,
0.8894203, 1.349489, 0.2147848, 0, 0, 0, 1, 1,
0.8913548, -1.433984, 3.171147, 0, 0, 0, 1, 1,
0.8915635, -1.138018, 3.507439, 0, 0, 0, 1, 1,
0.891966, 0.7926526, 1.726199, 0, 0, 0, 1, 1,
0.8932918, 0.09840831, 2.52418, 0, 0, 0, 1, 1,
0.8936915, -0.3340599, 2.213363, 1, 1, 1, 1, 1,
0.8955815, 0.8441812, 1.012095, 1, 1, 1, 1, 1,
0.8975774, -0.3204759, 2.559189, 1, 1, 1, 1, 1,
0.9006497, -0.4688877, 1.662301, 1, 1, 1, 1, 1,
0.904373, 0.6562831, 1.8354, 1, 1, 1, 1, 1,
0.9083458, -0.9952877, 0.975834, 1, 1, 1, 1, 1,
0.9118925, -0.7051226, 3.249792, 1, 1, 1, 1, 1,
0.9214568, -0.6948128, 2.232635, 1, 1, 1, 1, 1,
0.9233535, -0.1368523, 1.574718, 1, 1, 1, 1, 1,
0.9236682, -1.676872, 2.820256, 1, 1, 1, 1, 1,
0.9247547, 0.1807425, 1.031243, 1, 1, 1, 1, 1,
0.9274916, 1.031361, 0.674218, 1, 1, 1, 1, 1,
0.927938, -0.8354376, 1.038399, 1, 1, 1, 1, 1,
0.9292951, 2.516597, 0.7161189, 1, 1, 1, 1, 1,
0.9312621, -0.1687856, 1.300224, 1, 1, 1, 1, 1,
0.932067, 1.69972, -1.029796, 0, 0, 1, 1, 1,
0.937396, -0.3122879, 1.217407, 1, 0, 0, 1, 1,
0.9411752, -0.4725839, 2.090121, 1, 0, 0, 1, 1,
0.9495702, -0.1976733, 1.932564, 1, 0, 0, 1, 1,
0.9517631, 0.8255821, 1.062163, 1, 0, 0, 1, 1,
0.957537, -2.072286, 4.63478, 1, 0, 0, 1, 1,
0.9590049, 0.03917179, 1.887406, 0, 0, 0, 1, 1,
0.9650399, -1.396222, 2.248603, 0, 0, 0, 1, 1,
0.9724512, 0.6033206, 0.5149936, 0, 0, 0, 1, 1,
0.9728345, 0.7424734, 0.3734694, 0, 0, 0, 1, 1,
0.9757215, 1.660926, 1.466058, 0, 0, 0, 1, 1,
0.9975539, 1.848633, 0.4022909, 0, 0, 0, 1, 1,
0.9999256, -1.514169, 1.398941, 0, 0, 0, 1, 1,
1.002861, 1.293651, 0.3227603, 1, 1, 1, 1, 1,
1.003595, -0.1440573, 3.301012, 1, 1, 1, 1, 1,
1.012206, -0.7729207, 0.9272234, 1, 1, 1, 1, 1,
1.014579, -2.072332, 3.112592, 1, 1, 1, 1, 1,
1.023086, -0.2233068, 1.93658, 1, 1, 1, 1, 1,
1.026023, 0.1804062, 2.636769, 1, 1, 1, 1, 1,
1.031111, -0.9715429, 1.782611, 1, 1, 1, 1, 1,
1.034854, 0.2282486, 0.929587, 1, 1, 1, 1, 1,
1.034906, 0.05801645, 1.357712, 1, 1, 1, 1, 1,
1.035474, -1.940955, 3.251982, 1, 1, 1, 1, 1,
1.045118, -0.2117331, 2.879976, 1, 1, 1, 1, 1,
1.046254, -0.5684437, 1.510621, 1, 1, 1, 1, 1,
1.046761, 0.106823, 2.033353, 1, 1, 1, 1, 1,
1.050099, 0.5317522, 1.65299, 1, 1, 1, 1, 1,
1.053814, -0.6782175, 2.184785, 1, 1, 1, 1, 1,
1.060344, 0.09001981, 1.37648, 0, 0, 1, 1, 1,
1.062422, -1.226636, 2.020814, 1, 0, 0, 1, 1,
1.06261, 0.8850107, 2.654503, 1, 0, 0, 1, 1,
1.063329, -0.5028248, 2.353378, 1, 0, 0, 1, 1,
1.067506, -0.4738343, 2.415031, 1, 0, 0, 1, 1,
1.072401, -0.05040272, 0.5110328, 1, 0, 0, 1, 1,
1.077284, -0.7498809, 0.3943074, 0, 0, 0, 1, 1,
1.083887, -2.21479, 2.71456, 0, 0, 0, 1, 1,
1.087804, -1.695758, 1.873154, 0, 0, 0, 1, 1,
1.095684, -1.644278, 1.446401, 0, 0, 0, 1, 1,
1.09771, -0.02565954, 1.396813, 0, 0, 0, 1, 1,
1.103061, -0.07471149, 2.258904, 0, 0, 0, 1, 1,
1.115615, -0.1588579, 2.147202, 0, 0, 0, 1, 1,
1.121355, -0.2778452, 1.696811, 1, 1, 1, 1, 1,
1.121367, 1.309203, 0.8430125, 1, 1, 1, 1, 1,
1.127561, -0.09034327, 2.691234, 1, 1, 1, 1, 1,
1.129779, -2.06836, 4.023617, 1, 1, 1, 1, 1,
1.135762, -0.8012681, 1.709148, 1, 1, 1, 1, 1,
1.135933, 0.9105989, -0.8806122, 1, 1, 1, 1, 1,
1.141077, -0.09464218, 0.7780074, 1, 1, 1, 1, 1,
1.150529, 1.249005, 0.08251517, 1, 1, 1, 1, 1,
1.159555, 0.7507414, 1.339283, 1, 1, 1, 1, 1,
1.167274, 0.6414474, 1.219719, 1, 1, 1, 1, 1,
1.170082, 0.652811, 2.601103, 1, 1, 1, 1, 1,
1.184816, 0.1026768, 2.408742, 1, 1, 1, 1, 1,
1.188966, 2.106858, 0.9830959, 1, 1, 1, 1, 1,
1.198416, 0.277622, 2.080971, 1, 1, 1, 1, 1,
1.201076, 0.8802858, -0.8742047, 1, 1, 1, 1, 1,
1.203608, -0.1215315, 1.726519, 0, 0, 1, 1, 1,
1.213683, 0.5617985, 0.8618324, 1, 0, 0, 1, 1,
1.225175, 0.1725568, 1.606982, 1, 0, 0, 1, 1,
1.225984, -0.1156302, 1.720039, 1, 0, 0, 1, 1,
1.238035, 0.599049, 0.6138955, 1, 0, 0, 1, 1,
1.24566, 0.270584, 1.560304, 1, 0, 0, 1, 1,
1.250875, 1.238328, -0.4407478, 0, 0, 0, 1, 1,
1.257292, -0.4635772, 0.5479892, 0, 0, 0, 1, 1,
1.272218, 0.007256711, 0.5100877, 0, 0, 0, 1, 1,
1.280315, -0.5766568, 1.284092, 0, 0, 0, 1, 1,
1.28722, -0.9333266, 1.204268, 0, 0, 0, 1, 1,
1.311813, 1.589906, 2.202313, 0, 0, 0, 1, 1,
1.3257, 0.7387546, 1.862655, 0, 0, 0, 1, 1,
1.332558, 1.399441, 0.4795916, 1, 1, 1, 1, 1,
1.337963, -0.2744434, 1.011978, 1, 1, 1, 1, 1,
1.353352, 0.9010659, -1.138082, 1, 1, 1, 1, 1,
1.355426, -1.29049, 3.402963, 1, 1, 1, 1, 1,
1.357175, -1.909832, 2.769127, 1, 1, 1, 1, 1,
1.357948, 0.35187, 1.186725, 1, 1, 1, 1, 1,
1.360333, -1.092574, 1.633976, 1, 1, 1, 1, 1,
1.375523, 0.577149, 1.413859, 1, 1, 1, 1, 1,
1.376689, -0.825531, 3.982768, 1, 1, 1, 1, 1,
1.411472, -1.870564, 2.856382, 1, 1, 1, 1, 1,
1.419751, -1.090832, 2.031956, 1, 1, 1, 1, 1,
1.420988, -0.1800696, 1.859168, 1, 1, 1, 1, 1,
1.426443, 0.05360381, 2.841181, 1, 1, 1, 1, 1,
1.428749, -0.3736102, 0.7473344, 1, 1, 1, 1, 1,
1.429167, 1.154678, 1.874509, 1, 1, 1, 1, 1,
1.438612, 1.72498, 0.6554489, 0, 0, 1, 1, 1,
1.444871, 0.1132808, 1.060443, 1, 0, 0, 1, 1,
1.447546, -0.1925046, 2.31334, 1, 0, 0, 1, 1,
1.454127, 0.4691451, 0.5841103, 1, 0, 0, 1, 1,
1.460046, 1.338589, 1.411956, 1, 0, 0, 1, 1,
1.464258, -2.835611, 1.363738, 1, 0, 0, 1, 1,
1.46605, 0.05785554, 0.787032, 0, 0, 0, 1, 1,
1.477781, 1.749252, -0.7476308, 0, 0, 0, 1, 1,
1.482934, -0.5176877, 0.01901581, 0, 0, 0, 1, 1,
1.483368, -0.9260485, 3.786678, 0, 0, 0, 1, 1,
1.493232, 0.07623809, 1.791381, 0, 0, 0, 1, 1,
1.493359, 0.322295, 0.9546951, 0, 0, 0, 1, 1,
1.49418, 0.1370516, 2.332337, 0, 0, 0, 1, 1,
1.498223, -0.3680619, 2.167517, 1, 1, 1, 1, 1,
1.512169, 0.8267609, 0.02274971, 1, 1, 1, 1, 1,
1.518208, -0.2921998, 2.055545, 1, 1, 1, 1, 1,
1.519976, -0.1846092, 0.8563919, 1, 1, 1, 1, 1,
1.524477, -1.48332, 3.720663, 1, 1, 1, 1, 1,
1.528724, 1.171795, 0.1904259, 1, 1, 1, 1, 1,
1.549008, -0.3396558, 2.287941, 1, 1, 1, 1, 1,
1.554921, -1.849362, 1.100474, 1, 1, 1, 1, 1,
1.573975, -1.63264, 2.091159, 1, 1, 1, 1, 1,
1.580657, 0.1864359, 0.9747481, 1, 1, 1, 1, 1,
1.582959, 0.9113317, 0.774648, 1, 1, 1, 1, 1,
1.593334, 2.169987, 0.3687105, 1, 1, 1, 1, 1,
1.604114, 0.4870678, -0.2226554, 1, 1, 1, 1, 1,
1.609222, 0.7719864, 0.01195907, 1, 1, 1, 1, 1,
1.627085, 0.7960354, 1.809195, 1, 1, 1, 1, 1,
1.638665, 0.9720809, 1.651021, 0, 0, 1, 1, 1,
1.643651, 0.2331205, -0.1622033, 1, 0, 0, 1, 1,
1.652897, 0.7106736, 1.984582, 1, 0, 0, 1, 1,
1.661528, -1.291297, 2.434072, 1, 0, 0, 1, 1,
1.663669, 1.113008, 1.398829, 1, 0, 0, 1, 1,
1.675871, 0.538514, 0.5425909, 1, 0, 0, 1, 1,
1.679296, 0.3620936, -0.1797007, 0, 0, 0, 1, 1,
1.680062, 0.7793487, 0.4483664, 0, 0, 0, 1, 1,
1.708272, 0.8209644, 0.7124576, 0, 0, 0, 1, 1,
1.717582, -0.2730111, 0.7019967, 0, 0, 0, 1, 1,
1.71963, 0.7909465, 0.4096685, 0, 0, 0, 1, 1,
1.72365, -0.001921016, 1.179619, 0, 0, 0, 1, 1,
1.733867, 0.02396181, 1.688869, 0, 0, 0, 1, 1,
1.735052, 1.053471, 0.001330839, 1, 1, 1, 1, 1,
1.748934, -0.8653049, 1.74885, 1, 1, 1, 1, 1,
1.763585, -0.9629307, 1.612566, 1, 1, 1, 1, 1,
1.769476, 0.2782628, 2.090977, 1, 1, 1, 1, 1,
1.79213, 1.856914, -0.1302226, 1, 1, 1, 1, 1,
1.817977, -0.02796995, 1.756635, 1, 1, 1, 1, 1,
1.843076, 0.5658982, 1.158035, 1, 1, 1, 1, 1,
1.85094, -0.3758527, 2.19656, 1, 1, 1, 1, 1,
1.91686, -1.588588, 2.400725, 1, 1, 1, 1, 1,
1.924221, -0.5558357, 4.135842, 1, 1, 1, 1, 1,
1.966729, -0.3888611, -0.6238005, 1, 1, 1, 1, 1,
1.96706, -0.2202662, 1.672284, 1, 1, 1, 1, 1,
1.975303, 0.6176601, 2.682081, 1, 1, 1, 1, 1,
2.001736, 0.694412, 1.743823, 1, 1, 1, 1, 1,
2.010825, -0.001034613, 0.971464, 1, 1, 1, 1, 1,
2.04102, 0.7937446, -0.636955, 0, 0, 1, 1, 1,
2.117186, 1.338943, -1.385344, 1, 0, 0, 1, 1,
2.213119, 0.1309996, 1.49241, 1, 0, 0, 1, 1,
2.228401, -1.031976, 2.189503, 1, 0, 0, 1, 1,
2.23633, -0.6023383, 1.272259, 1, 0, 0, 1, 1,
2.25073, 1.723528, 0.8935443, 1, 0, 0, 1, 1,
2.282476, 2.437791, 0.3812476, 0, 0, 0, 1, 1,
2.326296, 0.3053475, 2.060589, 0, 0, 0, 1, 1,
2.389577, 0.6601624, 2.077556, 0, 0, 0, 1, 1,
2.415167, -1.090268, 4.423703, 0, 0, 0, 1, 1,
2.508451, 1.074791, 1.648221, 0, 0, 0, 1, 1,
2.521106, -0.3061306, 0.2773898, 0, 0, 0, 1, 1,
2.546534, 0.2643017, 1.583979, 0, 0, 0, 1, 1,
2.573351, 1.576023, 0.5109188, 1, 1, 1, 1, 1,
2.582098, -0.5501928, -0.06809045, 1, 1, 1, 1, 1,
2.582829, -0.5722947, 2.771055, 1, 1, 1, 1, 1,
2.614716, 0.9891399, 3.763719, 1, 1, 1, 1, 1,
2.915878, 0.4714594, 0.8703138, 1, 1, 1, 1, 1,
2.971518, 0.6481031, 0.6150479, 1, 1, 1, 1, 1,
3.205294, -1.063717, 0.3936593, 1, 1, 1, 1, 1
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
var radius = 9.39433;
var distance = 32.99718;
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
mvMatrix.translate( -0.2387409, 0.2002555, 0.03803968 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.99718);
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
