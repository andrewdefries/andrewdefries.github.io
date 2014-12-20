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
-3.665441, 0.06575791, 0.2449824, 1, 0, 0, 1,
-3.000244, 1.852506, -1.606872, 1, 0.007843138, 0, 1,
-2.9288, -0.7451806, -1.456907, 1, 0.01176471, 0, 1,
-2.693696, 0.4630129, -1.215221, 1, 0.01960784, 0, 1,
-2.679663, 1.18716, -1.403813, 1, 0.02352941, 0, 1,
-2.618075, -0.0789711, -2.921441, 1, 0.03137255, 0, 1,
-2.468018, 0.01985758, -0.5241213, 1, 0.03529412, 0, 1,
-2.444056, 1.557637, -1.359304, 1, 0.04313726, 0, 1,
-2.442331, -0.2672744, -0.9217306, 1, 0.04705882, 0, 1,
-2.398654, -1.497386, -2.824267, 1, 0.05490196, 0, 1,
-2.3911, 0.1027645, -1.840247, 1, 0.05882353, 0, 1,
-2.389642, 0.3179439, -0.7371541, 1, 0.06666667, 0, 1,
-2.377731, 0.567072, -2.920754, 1, 0.07058824, 0, 1,
-2.364918, -0.8578771, -1.24791, 1, 0.07843138, 0, 1,
-2.364542, 1.910004, -0.4541117, 1, 0.08235294, 0, 1,
-2.272352, 0.4379873, -1.770634, 1, 0.09019608, 0, 1,
-2.252872, 0.658862, -2.176563, 1, 0.09411765, 0, 1,
-2.231871, 0.8401367, -0.6498728, 1, 0.1019608, 0, 1,
-2.218445, -0.8217986, -1.547633, 1, 0.1098039, 0, 1,
-2.074459, 1.530011, -2.69459, 1, 0.1137255, 0, 1,
-2.06992, -0.3925466, -1.801726, 1, 0.1215686, 0, 1,
-2.032949, -1.758281, -1.919432, 1, 0.1254902, 0, 1,
-2.021612, -0.2257781, -2.975304, 1, 0.1333333, 0, 1,
-1.991046, -2.533648, -2.310348, 1, 0.1372549, 0, 1,
-1.987583, 0.4970442, -2.133096, 1, 0.145098, 0, 1,
-1.980519, 0.6614876, -1.932697, 1, 0.1490196, 0, 1,
-1.973945, -1.376969, -2.494779, 1, 0.1568628, 0, 1,
-1.968237, -0.664221, -2.533416, 1, 0.1607843, 0, 1,
-1.968215, -0.954805, -0.770602, 1, 0.1686275, 0, 1,
-1.9604, -0.9563153, -3.420352, 1, 0.172549, 0, 1,
-1.919679, 0.6932511, 0.1463487, 1, 0.1803922, 0, 1,
-1.893244, -0.3580825, -2.099942, 1, 0.1843137, 0, 1,
-1.891341, -1.437447, -1.167996, 1, 0.1921569, 0, 1,
-1.846854, 1.562428, -1.456612, 1, 0.1960784, 0, 1,
-1.833495, 0.0312924, -1.445546, 1, 0.2039216, 0, 1,
-1.821729, -0.0154008, -1.900993, 1, 0.2117647, 0, 1,
-1.818833, -0.3871618, -1.894678, 1, 0.2156863, 0, 1,
-1.814851, -0.19899, -0.7181441, 1, 0.2235294, 0, 1,
-1.812845, -0.07318966, -1.318888, 1, 0.227451, 0, 1,
-1.78942, -1.283263, -2.386852, 1, 0.2352941, 0, 1,
-1.789012, -0.2962266, -1.594401, 1, 0.2392157, 0, 1,
-1.766928, -0.3061771, -1.775481, 1, 0.2470588, 0, 1,
-1.758912, 0.1020564, -3.062943, 1, 0.2509804, 0, 1,
-1.754273, -1.513325, -3.432091, 1, 0.2588235, 0, 1,
-1.737039, 0.3584021, -1.866747, 1, 0.2627451, 0, 1,
-1.734156, -1.92856, -2.472186, 1, 0.2705882, 0, 1,
-1.723989, 0.6077825, -1.457375, 1, 0.2745098, 0, 1,
-1.723247, -0.1401047, -0.9925297, 1, 0.282353, 0, 1,
-1.688755, -1.26706, -2.18164, 1, 0.2862745, 0, 1,
-1.688734, 1.081981, -0.8365337, 1, 0.2941177, 0, 1,
-1.684494, -0.9104568, -1.668226, 1, 0.3019608, 0, 1,
-1.673925, 0.6783298, -1.515778, 1, 0.3058824, 0, 1,
-1.671682, -0.4232887, -1.938489, 1, 0.3137255, 0, 1,
-1.664481, 1.008257, -0.8361837, 1, 0.3176471, 0, 1,
-1.660625, 0.3069352, -1.834859, 1, 0.3254902, 0, 1,
-1.659011, 0.1177053, -1.93675, 1, 0.3294118, 0, 1,
-1.649757, 0.2460292, -0.7565765, 1, 0.3372549, 0, 1,
-1.643582, 0.5174384, -1.704077, 1, 0.3411765, 0, 1,
-1.638233, 1.410893, -1.001546, 1, 0.3490196, 0, 1,
-1.625105, 0.09779086, -1.556505, 1, 0.3529412, 0, 1,
-1.624943, 1.355772, -1.844352, 1, 0.3607843, 0, 1,
-1.62429, -1.006449, -2.186358, 1, 0.3647059, 0, 1,
-1.623713, -1.412476, -1.084733, 1, 0.372549, 0, 1,
-1.614659, 0.15806, -0.5652211, 1, 0.3764706, 0, 1,
-1.605101, -0.7217615, -1.46929, 1, 0.3843137, 0, 1,
-1.58817, 1.31636, -1.475774, 1, 0.3882353, 0, 1,
-1.586221, -0.5798879, -0.530619, 1, 0.3960784, 0, 1,
-1.576137, 0.08754045, -2.459002, 1, 0.4039216, 0, 1,
-1.552289, -0.1422987, -0.1360476, 1, 0.4078431, 0, 1,
-1.542624, 0.8896299, -1.02107, 1, 0.4156863, 0, 1,
-1.540696, -0.05837873, -0.3226614, 1, 0.4196078, 0, 1,
-1.522451, -1.672844, -2.359561, 1, 0.427451, 0, 1,
-1.520539, 0.2964798, -0.9401765, 1, 0.4313726, 0, 1,
-1.513005, -0.2741667, -2.330965, 1, 0.4392157, 0, 1,
-1.504933, -3.392748, -2.449463, 1, 0.4431373, 0, 1,
-1.504184, -0.9605235, -0.139113, 1, 0.4509804, 0, 1,
-1.500771, -1.369851, -1.90458, 1, 0.454902, 0, 1,
-1.50034, -2.390183, -1.0756, 1, 0.4627451, 0, 1,
-1.484641, -0.01980781, -2.662558, 1, 0.4666667, 0, 1,
-1.479335, 0.8687345, -1.410518, 1, 0.4745098, 0, 1,
-1.445765, -0.8477749, -1.516387, 1, 0.4784314, 0, 1,
-1.440867, 0.2036008, -0.4185056, 1, 0.4862745, 0, 1,
-1.439852, -1.497756, -2.587455, 1, 0.4901961, 0, 1,
-1.438926, 0.1880468, -0.04884186, 1, 0.4980392, 0, 1,
-1.437479, -0.408192, -0.1220262, 1, 0.5058824, 0, 1,
-1.43461, -0.4701417, -1.359415, 1, 0.509804, 0, 1,
-1.428692, 0.6112949, -0.8365632, 1, 0.5176471, 0, 1,
-1.428173, 0.9879553, -1.504989, 1, 0.5215687, 0, 1,
-1.414093, -0.284144, 0.5979863, 1, 0.5294118, 0, 1,
-1.408867, -0.8470051, -1.481444, 1, 0.5333334, 0, 1,
-1.397873, -1.268783, -2.500195, 1, 0.5411765, 0, 1,
-1.375098, -0.2360625, -1.818655, 1, 0.5450981, 0, 1,
-1.370956, 1.270886, -0.6526307, 1, 0.5529412, 0, 1,
-1.363843, 0.4623356, -3.202011, 1, 0.5568628, 0, 1,
-1.358206, -1.076108, -2.47075, 1, 0.5647059, 0, 1,
-1.346025, 0.4525117, -1.289802, 1, 0.5686275, 0, 1,
-1.345455, -0.3811091, -1.713189, 1, 0.5764706, 0, 1,
-1.333098, -0.9198506, -2.33961, 1, 0.5803922, 0, 1,
-1.330241, 0.8215324, -2.916783, 1, 0.5882353, 0, 1,
-1.318266, 0.1243661, 0.5075939, 1, 0.5921569, 0, 1,
-1.315218, -0.1324994, -3.03261, 1, 0.6, 0, 1,
-1.313093, 0.6552541, -2.829932, 1, 0.6078432, 0, 1,
-1.310934, -0.5167938, -1.781238, 1, 0.6117647, 0, 1,
-1.308136, -0.5427917, -2.458931, 1, 0.6196079, 0, 1,
-1.305774, -0.3031209, -2.803993, 1, 0.6235294, 0, 1,
-1.302966, -0.4724441, -2.586555, 1, 0.6313726, 0, 1,
-1.302144, 0.1217107, -1.034846, 1, 0.6352941, 0, 1,
-1.297195, -0.0258507, -0.3402196, 1, 0.6431373, 0, 1,
-1.294674, -1.18123, -1.764233, 1, 0.6470588, 0, 1,
-1.292359, 0.9178229, -1.93721, 1, 0.654902, 0, 1,
-1.283316, -1.181288, -2.591063, 1, 0.6588235, 0, 1,
-1.282064, -1.159137, -3.593757, 1, 0.6666667, 0, 1,
-1.28006, 0.2855004, -0.4565949, 1, 0.6705883, 0, 1,
-1.27097, -0.1462823, -0.9518262, 1, 0.6784314, 0, 1,
-1.270669, 0.4026402, -2.789181, 1, 0.682353, 0, 1,
-1.270429, 1.677571, -0.9908837, 1, 0.6901961, 0, 1,
-1.269702, 1.980942, -1.351335, 1, 0.6941177, 0, 1,
-1.268198, -0.6337809, -3.144518, 1, 0.7019608, 0, 1,
-1.264267, -0.998998, -0.8705222, 1, 0.7098039, 0, 1,
-1.263347, -0.161964, -1.687886, 1, 0.7137255, 0, 1,
-1.261933, -0.709675, -4.244966, 1, 0.7215686, 0, 1,
-1.256759, 0.3768368, -1.730864, 1, 0.7254902, 0, 1,
-1.254254, 0.111008, -1.230251, 1, 0.7333333, 0, 1,
-1.238337, 1.15144, -0.07880629, 1, 0.7372549, 0, 1,
-1.233202, 0.2941803, -1.739198, 1, 0.7450981, 0, 1,
-1.213867, -0.3005522, -2.020519, 1, 0.7490196, 0, 1,
-1.208352, 0.4700442, -1.067214, 1, 0.7568628, 0, 1,
-1.206256, -0.9714005, -0.7625583, 1, 0.7607843, 0, 1,
-1.200894, 0.6103079, -1.245766, 1, 0.7686275, 0, 1,
-1.198766, 1.722186, -1.40108, 1, 0.772549, 0, 1,
-1.190818, 0.8701026, -3.539615, 1, 0.7803922, 0, 1,
-1.179983, -0.8364723, -0.9194764, 1, 0.7843137, 0, 1,
-1.178606, -0.1961625, -2.600967, 1, 0.7921569, 0, 1,
-1.168616, -1.351083, -3.636901, 1, 0.7960784, 0, 1,
-1.16794, -0.4721228, -1.75737, 1, 0.8039216, 0, 1,
-1.160995, -0.2861264, -2.5581, 1, 0.8117647, 0, 1,
-1.156741, -0.7439768, -2.422586, 1, 0.8156863, 0, 1,
-1.154711, 0.3403646, -0.6424745, 1, 0.8235294, 0, 1,
-1.151076, -0.5926057, -1.952062, 1, 0.827451, 0, 1,
-1.132579, 0.4638155, -0.5356165, 1, 0.8352941, 0, 1,
-1.131174, -0.8774268, -1.506131, 1, 0.8392157, 0, 1,
-1.12509, -1.613687, -3.327738, 1, 0.8470588, 0, 1,
-1.116813, -0.4045931, -3.513664, 1, 0.8509804, 0, 1,
-1.114587, 0.1059713, -0.7186536, 1, 0.8588235, 0, 1,
-1.114144, 0.1595722, -2.302573, 1, 0.8627451, 0, 1,
-1.11164, -0.7346852, -2.032257, 1, 0.8705882, 0, 1,
-1.110922, 0.8253744, -0.2943284, 1, 0.8745098, 0, 1,
-1.107733, 1.172419, 0.5201738, 1, 0.8823529, 0, 1,
-1.107596, -0.8006411, -3.965536, 1, 0.8862745, 0, 1,
-1.105132, -0.0001758963, -2.930335, 1, 0.8941177, 0, 1,
-1.098989, 0.3076573, -0.9010219, 1, 0.8980392, 0, 1,
-1.09629, 1.650713, -1.431415, 1, 0.9058824, 0, 1,
-1.095707, -0.530253, 0.1194623, 1, 0.9137255, 0, 1,
-1.088546, -0.2596742, -1.67039, 1, 0.9176471, 0, 1,
-1.087303, -0.4353323, -2.255001, 1, 0.9254902, 0, 1,
-1.08154, -0.5710366, -2.147692, 1, 0.9294118, 0, 1,
-1.081207, -1.220805, -1.268571, 1, 0.9372549, 0, 1,
-1.079646, 0.0009961826, -2.21271, 1, 0.9411765, 0, 1,
-1.074808, 1.209399, -0.8809223, 1, 0.9490196, 0, 1,
-1.063046, 2.531016, -0.8966353, 1, 0.9529412, 0, 1,
-1.054438, -0.1047699, -1.31985, 1, 0.9607843, 0, 1,
-1.051635, -1.946944, -2.687502, 1, 0.9647059, 0, 1,
-1.046289, 1.132317, 0.2975441, 1, 0.972549, 0, 1,
-1.045594, -0.830752, -3.760132, 1, 0.9764706, 0, 1,
-1.028145, -1.531347, -3.601772, 1, 0.9843137, 0, 1,
-1.02459, 1.629475, -1.023754, 1, 0.9882353, 0, 1,
-1.019746, 0.3389137, -0.7000866, 1, 0.9960784, 0, 1,
-1.019114, -0.2542602, -2.773036, 0.9960784, 1, 0, 1,
-1.009547, -2.761806, -3.658674, 0.9921569, 1, 0, 1,
-1.008433, -0.1854688, -0.9121718, 0.9843137, 1, 0, 1,
-1.008329, -0.500274, -2.573737, 0.9803922, 1, 0, 1,
-1.001791, 0.09907317, -0.8477831, 0.972549, 1, 0, 1,
-0.9972363, 0.9428295, -0.1387105, 0.9686275, 1, 0, 1,
-0.994651, 0.1165803, 0.07896585, 0.9607843, 1, 0, 1,
-0.986338, -0.8434715, -1.612863, 0.9568627, 1, 0, 1,
-0.9843629, -0.08693593, -2.53679, 0.9490196, 1, 0, 1,
-0.9778746, -0.570466, -3.046332, 0.945098, 1, 0, 1,
-0.9768886, 1.390093, -1.194025, 0.9372549, 1, 0, 1,
-0.9753608, 1.690193, 0.7941024, 0.9333333, 1, 0, 1,
-0.9721866, -1.051067, -1.017799, 0.9254902, 1, 0, 1,
-0.9687241, 0.454185, 0.0775869, 0.9215686, 1, 0, 1,
-0.9627973, 0.2842088, 0.37581, 0.9137255, 1, 0, 1,
-0.961717, -1.1975, -0.7363578, 0.9098039, 1, 0, 1,
-0.9599116, 0.2334838, -2.25579, 0.9019608, 1, 0, 1,
-0.9572667, -0.04652233, -1.29887, 0.8941177, 1, 0, 1,
-0.9544933, -0.2590128, -1.865949, 0.8901961, 1, 0, 1,
-0.9438056, -0.6230628, -2.088345, 0.8823529, 1, 0, 1,
-0.9408138, -1.054475, -2.908571, 0.8784314, 1, 0, 1,
-0.9373081, 1.940261, 1.087743, 0.8705882, 1, 0, 1,
-0.9357871, -2.185813, -3.487258, 0.8666667, 1, 0, 1,
-0.9317142, 1.406183, 0.3559507, 0.8588235, 1, 0, 1,
-0.9297194, 1.437917, -1.743346, 0.854902, 1, 0, 1,
-0.9210788, 2.586332, -1.22783, 0.8470588, 1, 0, 1,
-0.9176409, 0.4977094, -1.334165, 0.8431373, 1, 0, 1,
-0.9175694, 0.7335941, 0.02812742, 0.8352941, 1, 0, 1,
-0.9110224, 0.6666666, -0.3112561, 0.8313726, 1, 0, 1,
-0.9079738, 1.053095, -0.09428294, 0.8235294, 1, 0, 1,
-0.9070219, -0.4281923, -3.008176, 0.8196079, 1, 0, 1,
-0.9050947, 1.635729, 0.08057419, 0.8117647, 1, 0, 1,
-0.9028647, 1.315927, -1.583795, 0.8078431, 1, 0, 1,
-0.8959057, 0.9519795, -1.175527, 0.8, 1, 0, 1,
-0.8940336, 0.891027, -1.514475, 0.7921569, 1, 0, 1,
-0.8920228, -0.07917174, -3.762958, 0.7882353, 1, 0, 1,
-0.8920069, 0.8325294, -0.261216, 0.7803922, 1, 0, 1,
-0.8918973, -0.2942317, -2.785782, 0.7764706, 1, 0, 1,
-0.8899143, -0.1232354, -3.318667, 0.7686275, 1, 0, 1,
-0.8877728, 0.5346679, 0.1956552, 0.7647059, 1, 0, 1,
-0.8868359, -0.7490729, -1.698051, 0.7568628, 1, 0, 1,
-0.8812003, -2.722826, -4.216389, 0.7529412, 1, 0, 1,
-0.8810126, -0.3285615, -1.433908, 0.7450981, 1, 0, 1,
-0.8809876, 0.2773352, 0.9580076, 0.7411765, 1, 0, 1,
-0.8725502, -1.39164, -2.319781, 0.7333333, 1, 0, 1,
-0.8709687, 0.2600891, 0.9105784, 0.7294118, 1, 0, 1,
-0.8696275, -0.3855718, -1.161724, 0.7215686, 1, 0, 1,
-0.8591437, -1.30739, -1.324394, 0.7176471, 1, 0, 1,
-0.8565305, -0.9416555, -0.2876396, 0.7098039, 1, 0, 1,
-0.8544636, 1.091675, -1.455285, 0.7058824, 1, 0, 1,
-0.8499799, -0.1422485, -1.043345, 0.6980392, 1, 0, 1,
-0.8454108, 0.09318223, -0.6438174, 0.6901961, 1, 0, 1,
-0.8389879, -0.914378, -1.989322, 0.6862745, 1, 0, 1,
-0.8386049, 0.07763077, -1.720809, 0.6784314, 1, 0, 1,
-0.8366201, -0.07201665, -1.056009, 0.6745098, 1, 0, 1,
-0.8336669, -0.3568992, -0.30435, 0.6666667, 1, 0, 1,
-0.8289485, -0.7782442, -3.575418, 0.6627451, 1, 0, 1,
-0.8247435, 1.785961, -0.7343603, 0.654902, 1, 0, 1,
-0.8222996, 0.769848, 0.1901713, 0.6509804, 1, 0, 1,
-0.820519, -0.6447563, -1.761553, 0.6431373, 1, 0, 1,
-0.8179158, 0.3803421, -0.6078625, 0.6392157, 1, 0, 1,
-0.8145182, 0.4773243, -1.636123, 0.6313726, 1, 0, 1,
-0.8141986, 0.4723119, -0.1430586, 0.627451, 1, 0, 1,
-0.8123506, 1.073442, -0.7050855, 0.6196079, 1, 0, 1,
-0.8121951, -0.1261965, -0.264857, 0.6156863, 1, 0, 1,
-0.811456, -0.6734568, -3.762655, 0.6078432, 1, 0, 1,
-0.8089486, -1.318302, -1.564721, 0.6039216, 1, 0, 1,
-0.794117, 0.005448429, -1.603677, 0.5960785, 1, 0, 1,
-0.7924113, 0.09799147, -0.06988019, 0.5882353, 1, 0, 1,
-0.7908996, -0.02156099, 0.7624776, 0.5843138, 1, 0, 1,
-0.7891777, 0.5531387, -0.8343617, 0.5764706, 1, 0, 1,
-0.7818292, -0.7406583, -0.6023808, 0.572549, 1, 0, 1,
-0.7729366, 0.003915855, -1.084313, 0.5647059, 1, 0, 1,
-0.7694892, 0.2384527, -0.7619335, 0.5607843, 1, 0, 1,
-0.7620288, 0.1258513, -2.257466, 0.5529412, 1, 0, 1,
-0.7617804, 0.444997, -1.188474, 0.5490196, 1, 0, 1,
-0.7605181, -0.1720178, -0.8618473, 0.5411765, 1, 0, 1,
-0.7555187, -0.4759272, -2.267423, 0.5372549, 1, 0, 1,
-0.7497172, 0.6099664, -1.422598, 0.5294118, 1, 0, 1,
-0.7442066, 0.5000857, -0.8502975, 0.5254902, 1, 0, 1,
-0.7402515, -1.746233, -1.328791, 0.5176471, 1, 0, 1,
-0.7353563, 1.165143, -0.1196306, 0.5137255, 1, 0, 1,
-0.730944, 0.4728361, 0.3010708, 0.5058824, 1, 0, 1,
-0.7286726, -1.856784, -3.093154, 0.5019608, 1, 0, 1,
-0.7235109, 0.9944853, -1.455787, 0.4941176, 1, 0, 1,
-0.716935, 1.044246, -0.4628878, 0.4862745, 1, 0, 1,
-0.7128478, -0.9917846, -2.186555, 0.4823529, 1, 0, 1,
-0.712288, 0.5765522, -0.07932527, 0.4745098, 1, 0, 1,
-0.7089236, -0.408997, -3.057921, 0.4705882, 1, 0, 1,
-0.7043613, -1.038521, -3.112451, 0.4627451, 1, 0, 1,
-0.6988409, -0.8742512, -2.25679, 0.4588235, 1, 0, 1,
-0.697807, 0.1060098, -1.049255, 0.4509804, 1, 0, 1,
-0.6899696, -1.501555, -2.303925, 0.4470588, 1, 0, 1,
-0.6881368, -0.2752624, -1.402858, 0.4392157, 1, 0, 1,
-0.6857306, 1.446349, 0.01113809, 0.4352941, 1, 0, 1,
-0.6817244, -2.305946, -2.358238, 0.427451, 1, 0, 1,
-0.6789398, -0.2784111, -2.578405, 0.4235294, 1, 0, 1,
-0.6766773, 0.1433024, -2.84362, 0.4156863, 1, 0, 1,
-0.673954, 0.331395, -0.7481807, 0.4117647, 1, 0, 1,
-0.6727011, 0.69361, -1.646634, 0.4039216, 1, 0, 1,
-0.6722771, 0.5785627, 0.1519254, 0.3960784, 1, 0, 1,
-0.6688781, 1.204553, -2.145134, 0.3921569, 1, 0, 1,
-0.6674839, -1.41594, -0.4529168, 0.3843137, 1, 0, 1,
-0.6654199, 0.2701914, -2.206532, 0.3803922, 1, 0, 1,
-0.6648123, 0.1518093, -2.23349, 0.372549, 1, 0, 1,
-0.6600682, 1.991644, -0.3348242, 0.3686275, 1, 0, 1,
-0.6561677, 0.1325233, -1.234282, 0.3607843, 1, 0, 1,
-0.6482908, 0.5492321, -0.9350916, 0.3568628, 1, 0, 1,
-0.6462792, 1.060142, 0.06252918, 0.3490196, 1, 0, 1,
-0.6460963, -1.369536, -2.214744, 0.345098, 1, 0, 1,
-0.6455269, -2.743854, -3.062435, 0.3372549, 1, 0, 1,
-0.6450511, 0.4573787, -0.5404358, 0.3333333, 1, 0, 1,
-0.6438082, -0.5825892, -3.111654, 0.3254902, 1, 0, 1,
-0.6425816, 0.6844122, -0.7373742, 0.3215686, 1, 0, 1,
-0.6420949, -0.8028196, -0.9012449, 0.3137255, 1, 0, 1,
-0.6417918, -1.233652, -3.159126, 0.3098039, 1, 0, 1,
-0.6410639, -1.674274, -2.293016, 0.3019608, 1, 0, 1,
-0.6359674, -1.586003, -1.106828, 0.2941177, 1, 0, 1,
-0.635259, -0.01950865, -2.634692, 0.2901961, 1, 0, 1,
-0.6294304, 0.8504771, -1.276645, 0.282353, 1, 0, 1,
-0.62284, -0.4158845, -1.353038, 0.2784314, 1, 0, 1,
-0.611456, -0.2698995, -3.134451, 0.2705882, 1, 0, 1,
-0.6103678, 0.6838871, -0.5926337, 0.2666667, 1, 0, 1,
-0.6064092, 0.4234957, -0.008273499, 0.2588235, 1, 0, 1,
-0.6060224, 1.344613, -0.1667584, 0.254902, 1, 0, 1,
-0.602705, 0.3166386, -1.597725, 0.2470588, 1, 0, 1,
-0.6025874, 0.2627592, -0.5823264, 0.2431373, 1, 0, 1,
-0.6005244, -0.1226225, -2.221456, 0.2352941, 1, 0, 1,
-0.5938056, 1.18623, -0.139076, 0.2313726, 1, 0, 1,
-0.5934219, 1.206295, 0.2814635, 0.2235294, 1, 0, 1,
-0.5931057, 0.827945, -0.8837481, 0.2196078, 1, 0, 1,
-0.5920013, 2.038385, -0.3899281, 0.2117647, 1, 0, 1,
-0.5881812, 0.5404851, -1.713736, 0.2078431, 1, 0, 1,
-0.5876258, 1.044719, -0.9223661, 0.2, 1, 0, 1,
-0.5831431, -0.09758079, -1.624993, 0.1921569, 1, 0, 1,
-0.583061, -0.3799209, -1.685994, 0.1882353, 1, 0, 1,
-0.5797684, 0.2386486, -2.484479, 0.1803922, 1, 0, 1,
-0.5788193, -0.3108137, -1.292422, 0.1764706, 1, 0, 1,
-0.577739, 0.0482463, -1.765654, 0.1686275, 1, 0, 1,
-0.5738515, 1.980412, -0.7080336, 0.1647059, 1, 0, 1,
-0.5667649, 2.344679, -1.234496, 0.1568628, 1, 0, 1,
-0.5656075, 0.02850344, -0.01770147, 0.1529412, 1, 0, 1,
-0.5617707, 0.1205394, -0.9516916, 0.145098, 1, 0, 1,
-0.5606745, 0.8446078, 0.3793894, 0.1411765, 1, 0, 1,
-0.560571, -0.701901, -3.490956, 0.1333333, 1, 0, 1,
-0.5581751, 0.7124046, 0.1433064, 0.1294118, 1, 0, 1,
-0.5529405, -0.8184102, -3.520086, 0.1215686, 1, 0, 1,
-0.5487025, -0.2592342, -1.137188, 0.1176471, 1, 0, 1,
-0.5439259, 0.5021355, -1.906261, 0.1098039, 1, 0, 1,
-0.5412582, 0.5584765, -0.3564993, 0.1058824, 1, 0, 1,
-0.5399733, 0.6322894, 0.1355681, 0.09803922, 1, 0, 1,
-0.538451, 1.341881, 0.2258539, 0.09019608, 1, 0, 1,
-0.5323911, 0.2395282, 0.09798811, 0.08627451, 1, 0, 1,
-0.5300671, 0.7448803, -0.07489143, 0.07843138, 1, 0, 1,
-0.5299723, 1.008745, 0.7778794, 0.07450981, 1, 0, 1,
-0.5264554, 0.3000889, -1.048996, 0.06666667, 1, 0, 1,
-0.5247968, 0.9208716, -1.124992, 0.0627451, 1, 0, 1,
-0.5222207, -1.143702, -3.971639, 0.05490196, 1, 0, 1,
-0.520362, 0.3827095, -0.7973428, 0.05098039, 1, 0, 1,
-0.5170357, -0.4006071, -1.774231, 0.04313726, 1, 0, 1,
-0.5117474, 0.6904727, -0.9996074, 0.03921569, 1, 0, 1,
-0.5117404, -0.3631268, -2.613093, 0.03137255, 1, 0, 1,
-0.5079701, 0.9972612, -0.3149805, 0.02745098, 1, 0, 1,
-0.5064195, -0.008576449, -0.8053267, 0.01960784, 1, 0, 1,
-0.5045925, -0.4418506, -2.849574, 0.01568628, 1, 0, 1,
-0.5042284, 1.579297, 0.6094908, 0.007843138, 1, 0, 1,
-0.5027028, 0.2772217, -1.117268, 0.003921569, 1, 0, 1,
-0.5006282, -0.9660234, -2.105999, 0, 1, 0.003921569, 1,
-0.4985251, 1.375539, -0.7237801, 0, 1, 0.01176471, 1,
-0.4880644, 0.4562872, -1.290187, 0, 1, 0.01568628, 1,
-0.4868244, -1.717805, -3.55377, 0, 1, 0.02352941, 1,
-0.4835682, -0.9438205, -3.195763, 0, 1, 0.02745098, 1,
-0.4794471, 0.5433957, -1.020007, 0, 1, 0.03529412, 1,
-0.472145, 0.09753384, -2.442055, 0, 1, 0.03921569, 1,
-0.4708042, -1.302515, -2.934253, 0, 1, 0.04705882, 1,
-0.4622394, -1.306269, -4.074715, 0, 1, 0.05098039, 1,
-0.458014, -0.6241871, -2.853426, 0, 1, 0.05882353, 1,
-0.4546006, -0.2765118, -2.527148, 0, 1, 0.0627451, 1,
-0.4501247, 0.7783808, -0.1195509, 0, 1, 0.07058824, 1,
-0.4475729, 1.11625, -0.31855, 0, 1, 0.07450981, 1,
-0.4457801, -0.7989801, -1.864094, 0, 1, 0.08235294, 1,
-0.44511, 0.1269796, -2.39838, 0, 1, 0.08627451, 1,
-0.4426322, 0.3665975, 0.06081356, 0, 1, 0.09411765, 1,
-0.439762, 0.6017352, 0.0788334, 0, 1, 0.1019608, 1,
-0.4394828, -0.2025911, -1.942131, 0, 1, 0.1058824, 1,
-0.4384492, 1.751207, -0.5910078, 0, 1, 0.1137255, 1,
-0.4353386, 1.599254, -1.37078, 0, 1, 0.1176471, 1,
-0.4330783, 0.5836574, -0.7098885, 0, 1, 0.1254902, 1,
-0.4319347, -0.3436679, -1.719136, 0, 1, 0.1294118, 1,
-0.4290842, 1.06053, -0.3900789, 0, 1, 0.1372549, 1,
-0.4279194, -2.226168, -2.026697, 0, 1, 0.1411765, 1,
-0.4218549, -0.3796429, -0.6422687, 0, 1, 0.1490196, 1,
-0.4156247, -0.09913733, -1.425098, 0, 1, 0.1529412, 1,
-0.4111293, -0.595941, -2.978261, 0, 1, 0.1607843, 1,
-0.403885, -0.2352141, -0.5766954, 0, 1, 0.1647059, 1,
-0.4022957, -0.3253267, -3.332974, 0, 1, 0.172549, 1,
-0.4018828, 0.5204617, 0.6786666, 0, 1, 0.1764706, 1,
-0.3993122, 1.303107, -0.5202937, 0, 1, 0.1843137, 1,
-0.3963616, 0.5589491, -1.614911, 0, 1, 0.1882353, 1,
-0.3884477, -0.04388352, -1.521349, 0, 1, 0.1960784, 1,
-0.3883905, 0.4898922, -2.768821, 0, 1, 0.2039216, 1,
-0.3833922, -0.5195224, -2.860774, 0, 1, 0.2078431, 1,
-0.3832174, -0.28579, -2.78236, 0, 1, 0.2156863, 1,
-0.3780586, 0.3371887, -1.33375, 0, 1, 0.2196078, 1,
-0.3744511, 1.306586, -1.626423, 0, 1, 0.227451, 1,
-0.3738244, -1.417277, -1.774505, 0, 1, 0.2313726, 1,
-0.3738111, -0.03044563, -0.1591902, 0, 1, 0.2392157, 1,
-0.3736025, -0.4531946, -2.553076, 0, 1, 0.2431373, 1,
-0.3711787, -1.008764, -3.5508, 0, 1, 0.2509804, 1,
-0.3676845, -0.2867013, -1.140925, 0, 1, 0.254902, 1,
-0.3664057, -0.1986286, -1.726102, 0, 1, 0.2627451, 1,
-0.361189, 0.1162242, -1.12823, 0, 1, 0.2666667, 1,
-0.3554911, 1.646982, -0.627313, 0, 1, 0.2745098, 1,
-0.346381, -2.030185, -1.91981, 0, 1, 0.2784314, 1,
-0.3456079, 1.689106, 0.6614909, 0, 1, 0.2862745, 1,
-0.3413722, 1.408038, 0.08955499, 0, 1, 0.2901961, 1,
-0.3366073, 1.218528, -1.700378, 0, 1, 0.2980392, 1,
-0.3363, -0.593675, -3.665507, 0, 1, 0.3058824, 1,
-0.3344743, 1.016195, -0.7083215, 0, 1, 0.3098039, 1,
-0.3326991, 1.340262, -0.7557572, 0, 1, 0.3176471, 1,
-0.3324479, 0.3855396, 0.4479898, 0, 1, 0.3215686, 1,
-0.3309222, -0.07031441, -1.832555, 0, 1, 0.3294118, 1,
-0.3299163, 0.2817719, -0.5790392, 0, 1, 0.3333333, 1,
-0.3285364, -0.05805081, -1.998466, 0, 1, 0.3411765, 1,
-0.3272461, 0.5114009, -1.032683, 0, 1, 0.345098, 1,
-0.3265823, -0.3066201, -1.652455, 0, 1, 0.3529412, 1,
-0.316146, 0.3663913, 0.3660133, 0, 1, 0.3568628, 1,
-0.3148725, 0.4084091, -1.162935, 0, 1, 0.3647059, 1,
-0.3147768, 0.3152865, -1.697184, 0, 1, 0.3686275, 1,
-0.3126737, 0.2048393, -0.6960098, 0, 1, 0.3764706, 1,
-0.3098961, -0.5012174, -1.919842, 0, 1, 0.3803922, 1,
-0.3098276, 0.5790147, 0.6781154, 0, 1, 0.3882353, 1,
-0.3092217, -0.3849957, -3.356736, 0, 1, 0.3921569, 1,
-0.3071369, 1.940781, 1.007206, 0, 1, 0.4, 1,
-0.2996031, 1.789865, 0.2648732, 0, 1, 0.4078431, 1,
-0.2880693, -0.5279758, -2.100705, 0, 1, 0.4117647, 1,
-0.2861536, 0.7358368, 0.8362626, 0, 1, 0.4196078, 1,
-0.2840302, -0.892206, -3.726391, 0, 1, 0.4235294, 1,
-0.2830971, 1.029613, -1.889721, 0, 1, 0.4313726, 1,
-0.2823785, 0.1153115, -2.993375, 0, 1, 0.4352941, 1,
-0.2774, -0.2049508, -2.01334, 0, 1, 0.4431373, 1,
-0.272357, 0.5185345, -0.9663199, 0, 1, 0.4470588, 1,
-0.2636032, 0.9122098, -0.7305263, 0, 1, 0.454902, 1,
-0.2561223, 1.679959, -0.2084903, 0, 1, 0.4588235, 1,
-0.2539846, -1.963982, -2.03002, 0, 1, 0.4666667, 1,
-0.2538704, -1.078122, -3.138958, 0, 1, 0.4705882, 1,
-0.2510848, -2.006796, -2.435832, 0, 1, 0.4784314, 1,
-0.2496665, 0.4630137, -1.198883, 0, 1, 0.4823529, 1,
-0.2462634, -1.225832, -3.112339, 0, 1, 0.4901961, 1,
-0.245327, -0.4246977, -3.211004, 0, 1, 0.4941176, 1,
-0.2413817, 1.042912, -1.470982, 0, 1, 0.5019608, 1,
-0.2408243, 0.3179058, 0.6054087, 0, 1, 0.509804, 1,
-0.2320368, 1.00978, -0.4082252, 0, 1, 0.5137255, 1,
-0.2278563, 0.6306523, -0.6346073, 0, 1, 0.5215687, 1,
-0.2275156, -0.5251308, 0.2220698, 0, 1, 0.5254902, 1,
-0.2269999, 0.183859, -1.490302, 0, 1, 0.5333334, 1,
-0.224849, 2.525741, -1.747424, 0, 1, 0.5372549, 1,
-0.2244766, -0.7765165, -4.72431, 0, 1, 0.5450981, 1,
-0.2200891, 0.09866713, -0.3165508, 0, 1, 0.5490196, 1,
-0.2198476, 0.4240769, -0.65672, 0, 1, 0.5568628, 1,
-0.2191242, -0.06837299, -0.1123134, 0, 1, 0.5607843, 1,
-0.2164852, -0.4376439, -2.967367, 0, 1, 0.5686275, 1,
-0.2120607, 0.7705497, -0.5519506, 0, 1, 0.572549, 1,
-0.2082759, 0.2644593, -2.229476, 0, 1, 0.5803922, 1,
-0.2079292, 0.3044792, -2.764985, 0, 1, 0.5843138, 1,
-0.2036337, 0.3006192, 0.6995552, 0, 1, 0.5921569, 1,
-0.2029579, -0.875244, -3.629941, 0, 1, 0.5960785, 1,
-0.1954991, -1.287647, -1.704237, 0, 1, 0.6039216, 1,
-0.1939779, -1.218429, -3.067274, 0, 1, 0.6117647, 1,
-0.190019, -0.9824175, -1.241924, 0, 1, 0.6156863, 1,
-0.1830701, -0.2444623, -1.726426, 0, 1, 0.6235294, 1,
-0.1815019, 0.3514695, -0.5799074, 0, 1, 0.627451, 1,
-0.177595, 0.2024471, -1.249712, 0, 1, 0.6352941, 1,
-0.17366, -0.0530557, -4.30199, 0, 1, 0.6392157, 1,
-0.1726843, -0.6513126, -2.336037, 0, 1, 0.6470588, 1,
-0.1705422, 0.6961178, -1.116742, 0, 1, 0.6509804, 1,
-0.1702283, -1.261749, -4.531457, 0, 1, 0.6588235, 1,
-0.1688177, -0.1449926, -1.239571, 0, 1, 0.6627451, 1,
-0.1684368, -0.1167284, -1.252997, 0, 1, 0.6705883, 1,
-0.1679944, -0.8820814, -1.939697, 0, 1, 0.6745098, 1,
-0.1641067, 1.414572, -0.456043, 0, 1, 0.682353, 1,
-0.1610413, 0.02629574, -1.536497, 0, 1, 0.6862745, 1,
-0.1603083, 0.2281236, 0.6340062, 0, 1, 0.6941177, 1,
-0.1582431, -0.6678923, -4.841927, 0, 1, 0.7019608, 1,
-0.1461898, 1.409608, 0.1068038, 0, 1, 0.7058824, 1,
-0.1367379, -0.3298419, -2.929964, 0, 1, 0.7137255, 1,
-0.1362011, 1.139485, -0.3537255, 0, 1, 0.7176471, 1,
-0.1342063, -0.1666055, -3.458981, 0, 1, 0.7254902, 1,
-0.1339631, 0.1388763, 0.3355013, 0, 1, 0.7294118, 1,
-0.132845, -0.8364406, -3.929214, 0, 1, 0.7372549, 1,
-0.1274289, 0.1760164, 0.9577931, 0, 1, 0.7411765, 1,
-0.1243095, 0.5845759, 0.6618609, 0, 1, 0.7490196, 1,
-0.1218929, -1.012737, -2.502094, 0, 1, 0.7529412, 1,
-0.1197601, 2.166641, -0.1491235, 0, 1, 0.7607843, 1,
-0.1171531, -0.48709, -1.019537, 0, 1, 0.7647059, 1,
-0.1160699, 0.1837507, -0.9782078, 0, 1, 0.772549, 1,
-0.1160219, 0.815925, 0.8590458, 0, 1, 0.7764706, 1,
-0.1158807, 0.06967533, -1.670552, 0, 1, 0.7843137, 1,
-0.1148731, -0.2778201, -2.007208, 0, 1, 0.7882353, 1,
-0.1115054, -1.182016, -3.227413, 0, 1, 0.7960784, 1,
-0.1114958, 0.9685152, -0.5155392, 0, 1, 0.8039216, 1,
-0.1102916, -0.2339282, -2.689405, 0, 1, 0.8078431, 1,
-0.09498992, -0.664703, -3.161449, 0, 1, 0.8156863, 1,
-0.09272698, -0.7376474, -4.988616, 0, 1, 0.8196079, 1,
-0.08763626, 1.277703, 2.176629, 0, 1, 0.827451, 1,
-0.08401187, 0.6313913, 2.069065, 0, 1, 0.8313726, 1,
-0.0826854, 0.9747216, 1.083754, 0, 1, 0.8392157, 1,
-0.08049703, 0.08890209, -0.03810694, 0, 1, 0.8431373, 1,
-0.07296883, 1.135331, -0.9105687, 0, 1, 0.8509804, 1,
-0.07157703, -0.1484184, -0.7302386, 0, 1, 0.854902, 1,
-0.0668792, -2.080685, -1.382822, 0, 1, 0.8627451, 1,
-0.0642055, -0.7348717, -2.24194, 0, 1, 0.8666667, 1,
-0.06224409, -0.2769254, -3.105179, 0, 1, 0.8745098, 1,
-0.06126837, -1.131893, -2.954592, 0, 1, 0.8784314, 1,
-0.05658305, 1.774985, -0.1490059, 0, 1, 0.8862745, 1,
-0.05039465, -2.460279, -5.079193, 0, 1, 0.8901961, 1,
-0.04928775, -1.23621, -2.523904, 0, 1, 0.8980392, 1,
-0.04134619, 0.5928848, 0.1369513, 0, 1, 0.9058824, 1,
-0.03998951, 1.599547, -4.034377, 0, 1, 0.9098039, 1,
-0.03180525, -0.03292907, -2.855315, 0, 1, 0.9176471, 1,
-0.02871716, 0.005952076, -0.3285811, 0, 1, 0.9215686, 1,
-0.01909155, 0.3733337, -0.2475324, 0, 1, 0.9294118, 1,
-0.01619541, 0.6731844, 1.360448, 0, 1, 0.9333333, 1,
-0.009844126, -1.719955, -4.043084, 0, 1, 0.9411765, 1,
-0.004465459, -0.4297823, -1.494384, 0, 1, 0.945098, 1,
-0.003957176, -0.2228625, -2.946044, 0, 1, 0.9529412, 1,
-0.003503493, 2.177105, -0.2639633, 0, 1, 0.9568627, 1,
-0.001202377, -1.428337, -3.196272, 0, 1, 0.9647059, 1,
-0.0008846346, -2.100336, -1.731788, 0, 1, 0.9686275, 1,
0.000809407, 0.5655995, 0.6701577, 0, 1, 0.9764706, 1,
0.000812251, -1.600635, 3.512193, 0, 1, 0.9803922, 1,
0.005196006, 0.4663167, -0.7717875, 0, 1, 0.9882353, 1,
0.007784666, 1.270052, -0.8898265, 0, 1, 0.9921569, 1,
0.008157673, 0.6316455, 0.5390823, 0, 1, 1, 1,
0.009245447, 0.8914348, -0.6359975, 0, 0.9921569, 1, 1,
0.01040423, -0.6075155, 3.746434, 0, 0.9882353, 1, 1,
0.01229677, -0.3457679, 1.234789, 0, 0.9803922, 1, 1,
0.01816922, -0.1331191, 3.588476, 0, 0.9764706, 1, 1,
0.01961767, -0.08206565, 2.758633, 0, 0.9686275, 1, 1,
0.01973436, 0.01706548, 2.742223, 0, 0.9647059, 1, 1,
0.02086517, -0.5723556, 1.296471, 0, 0.9568627, 1, 1,
0.02402176, 1.489267, 0.9394664, 0, 0.9529412, 1, 1,
0.02603474, -0.4501728, 2.432057, 0, 0.945098, 1, 1,
0.02668903, -2.250477, 2.872411, 0, 0.9411765, 1, 1,
0.02818461, 1.129944, -0.6488727, 0, 0.9333333, 1, 1,
0.02934157, 0.7165756, 1.574328, 0, 0.9294118, 1, 1,
0.03210173, -0.05982026, 3.138609, 0, 0.9215686, 1, 1,
0.0343854, 0.6122987, 1.381982, 0, 0.9176471, 1, 1,
0.03500245, -0.5736727, 2.610291, 0, 0.9098039, 1, 1,
0.03932075, 0.7093055, -0.6426063, 0, 0.9058824, 1, 1,
0.04072811, 1.317886, 0.1900863, 0, 0.8980392, 1, 1,
0.04344961, -0.4751473, 2.057448, 0, 0.8901961, 1, 1,
0.04522248, -0.4932438, 0.9902194, 0, 0.8862745, 1, 1,
0.04615717, -0.3440796, 1.327757, 0, 0.8784314, 1, 1,
0.04822442, 0.3929286, 1.205246, 0, 0.8745098, 1, 1,
0.05246309, 0.4313086, 1.514283, 0, 0.8666667, 1, 1,
0.05286279, -0.5343334, 3.83868, 0, 0.8627451, 1, 1,
0.05330536, -0.5117849, 3.310128, 0, 0.854902, 1, 1,
0.05703234, -0.1671123, 3.427131, 0, 0.8509804, 1, 1,
0.05940378, -1.038426, 1.514877, 0, 0.8431373, 1, 1,
0.06068121, -0.6316239, 5.160266, 0, 0.8392157, 1, 1,
0.06070586, -0.3240634, 2.246297, 0, 0.8313726, 1, 1,
0.06081179, 0.2705539, 0.410333, 0, 0.827451, 1, 1,
0.06200695, 0.2806407, 0.2985698, 0, 0.8196079, 1, 1,
0.06274027, -1.776408, 2.352468, 0, 0.8156863, 1, 1,
0.06663029, -2.470967, 3.247829, 0, 0.8078431, 1, 1,
0.06879647, -0.4748847, 3.103046, 0, 0.8039216, 1, 1,
0.0710928, -0.03903341, -0.1400879, 0, 0.7960784, 1, 1,
0.0744518, 1.081789, -2.549028, 0, 0.7882353, 1, 1,
0.07477946, 0.06584129, 2.566376, 0, 0.7843137, 1, 1,
0.07520703, 2.031638, 1.059165, 0, 0.7764706, 1, 1,
0.07522488, 0.3203428, 1.476762, 0, 0.772549, 1, 1,
0.0770403, -0.2041389, 4.481192, 0, 0.7647059, 1, 1,
0.07932628, 0.9175889, 0.4065346, 0, 0.7607843, 1, 1,
0.08253611, -1.049788, 3.018544, 0, 0.7529412, 1, 1,
0.08259317, -0.2781933, 3.046029, 0, 0.7490196, 1, 1,
0.0826425, 1.052879, -0.399467, 0, 0.7411765, 1, 1,
0.08443112, 0.6352168, 1.925884, 0, 0.7372549, 1, 1,
0.08531216, -0.4594798, 3.646984, 0, 0.7294118, 1, 1,
0.08901333, 1.234688, -0.1986583, 0, 0.7254902, 1, 1,
0.08978317, 0.05117298, 0.3662933, 0, 0.7176471, 1, 1,
0.09449875, 0.8306157, 0.004403054, 0, 0.7137255, 1, 1,
0.1019848, 1.249236, 0.3983065, 0, 0.7058824, 1, 1,
0.1048029, -1.053606, 4.228339, 0, 0.6980392, 1, 1,
0.1064029, -0.3152935, 2.219564, 0, 0.6941177, 1, 1,
0.1119167, -0.6340784, 4.268724, 0, 0.6862745, 1, 1,
0.1162258, 0.6305849, -0.07127657, 0, 0.682353, 1, 1,
0.1169012, 1.070186, 0.6528744, 0, 0.6745098, 1, 1,
0.118278, 1.183544, -0.1167574, 0, 0.6705883, 1, 1,
0.1188003, -1.507985, 4.749657, 0, 0.6627451, 1, 1,
0.12134, -0.675985, 3.997242, 0, 0.6588235, 1, 1,
0.1243916, -0.3724735, 0.9824461, 0, 0.6509804, 1, 1,
0.1250921, -0.1545264, 2.882849, 0, 0.6470588, 1, 1,
0.1288664, -0.4743853, 3.688837, 0, 0.6392157, 1, 1,
0.1288879, 0.6119006, -0.310936, 0, 0.6352941, 1, 1,
0.1319794, 0.3413191, 0.5834425, 0, 0.627451, 1, 1,
0.1349471, 0.8773562, 0.7809348, 0, 0.6235294, 1, 1,
0.1383042, -0.5853341, 1.521084, 0, 0.6156863, 1, 1,
0.1383523, -1.187914, 2.040724, 0, 0.6117647, 1, 1,
0.1439801, 1.155007, -1.346175, 0, 0.6039216, 1, 1,
0.1456643, 1.922822, -0.3735379, 0, 0.5960785, 1, 1,
0.1465904, 0.2063169, 0.01365506, 0, 0.5921569, 1, 1,
0.1596377, -0.7383941, 3.369393, 0, 0.5843138, 1, 1,
0.1630103, -0.8463383, 4.198206, 0, 0.5803922, 1, 1,
0.1683503, 0.9177048, -1.390861, 0, 0.572549, 1, 1,
0.1709642, 0.06571183, 1.560569, 0, 0.5686275, 1, 1,
0.1716967, 0.08637521, 1.978147, 0, 0.5607843, 1, 1,
0.1794851, -0.6251096, 1.07146, 0, 0.5568628, 1, 1,
0.1821388, 1.008523, 1.910687, 0, 0.5490196, 1, 1,
0.1833142, 1.109252, -1.491896, 0, 0.5450981, 1, 1,
0.1835453, 0.9655561, -0.09749173, 0, 0.5372549, 1, 1,
0.1910386, 1.356981, -1.856356, 0, 0.5333334, 1, 1,
0.1966273, -0.8217365, 4.507261, 0, 0.5254902, 1, 1,
0.1990931, 0.4011999, -1.88662, 0, 0.5215687, 1, 1,
0.2030376, -0.3083051, 1.702638, 0, 0.5137255, 1, 1,
0.2050396, 0.1580346, 0.4507996, 0, 0.509804, 1, 1,
0.2052127, -0.8697332, 2.430859, 0, 0.5019608, 1, 1,
0.2086825, 0.6346942, 1.76474, 0, 0.4941176, 1, 1,
0.2090555, -0.03723362, 1.578547, 0, 0.4901961, 1, 1,
0.2106024, 0.5058614, 0.9317811, 0, 0.4823529, 1, 1,
0.2143972, 0.1145922, 0.1661077, 0, 0.4784314, 1, 1,
0.2204395, -0.8443553, 2.942087, 0, 0.4705882, 1, 1,
0.2261437, -0.3459129, 3.539134, 0, 0.4666667, 1, 1,
0.2263507, 0.5271521, -0.6602634, 0, 0.4588235, 1, 1,
0.228362, -0.471474, 1.81433, 0, 0.454902, 1, 1,
0.2321817, 0.9841186, 0.5217314, 0, 0.4470588, 1, 1,
0.232803, -1.156065, 3.773329, 0, 0.4431373, 1, 1,
0.2355559, -0.08528361, 3.809346, 0, 0.4352941, 1, 1,
0.2465024, -0.6758264, 3.806269, 0, 0.4313726, 1, 1,
0.2485258, 1.384816, -1.251816, 0, 0.4235294, 1, 1,
0.249576, -0.1619072, 3.00865, 0, 0.4196078, 1, 1,
0.2531829, 0.1694505, 2.781163, 0, 0.4117647, 1, 1,
0.2544947, 1.462549, 0.4259997, 0, 0.4078431, 1, 1,
0.2555679, -0.8724712, 3.133276, 0, 0.4, 1, 1,
0.2561676, 2.033669, -0.986234, 0, 0.3921569, 1, 1,
0.258382, 1.498425, 1.392256, 0, 0.3882353, 1, 1,
0.2603205, 1.152149, -0.6284546, 0, 0.3803922, 1, 1,
0.2617779, 1.549197, 0.06301718, 0, 0.3764706, 1, 1,
0.269901, -0.6895242, 2.517977, 0, 0.3686275, 1, 1,
0.2730453, -0.446777, 1.569899, 0, 0.3647059, 1, 1,
0.2800696, 0.6746789, 0.1318397, 0, 0.3568628, 1, 1,
0.2808767, -1.15309, 0.4981452, 0, 0.3529412, 1, 1,
0.2820108, 0.1931223, 0.4940332, 0, 0.345098, 1, 1,
0.2858543, -0.006555184, 2.385144, 0, 0.3411765, 1, 1,
0.2865251, -0.7047181, -0.05557618, 0, 0.3333333, 1, 1,
0.2893687, 1.643634, 0.9552645, 0, 0.3294118, 1, 1,
0.2899051, -2.571615, 3.082256, 0, 0.3215686, 1, 1,
0.2902341, -0.202752, 0.7556219, 0, 0.3176471, 1, 1,
0.2909062, -0.7697157, 2.584344, 0, 0.3098039, 1, 1,
0.2944706, -1.592351, 4.345896, 0, 0.3058824, 1, 1,
0.2967592, 0.2494737, 1.253564, 0, 0.2980392, 1, 1,
0.2978998, 0.7860929, 1.513078, 0, 0.2901961, 1, 1,
0.2980354, -0.343457, 1.7167, 0, 0.2862745, 1, 1,
0.3001352, 0.9433285, 0.8272765, 0, 0.2784314, 1, 1,
0.3004656, -0.377922, 3.302788, 0, 0.2745098, 1, 1,
0.3026108, 0.2234551, 1.810724, 0, 0.2666667, 1, 1,
0.3079111, 0.5944713, 0.8319488, 0, 0.2627451, 1, 1,
0.3102936, -0.4760825, 2.667672, 0, 0.254902, 1, 1,
0.3114749, 0.272586, 0.5042621, 0, 0.2509804, 1, 1,
0.316508, -0.3169872, 1.471313, 0, 0.2431373, 1, 1,
0.3191584, 0.2732607, 1.307327, 0, 0.2392157, 1, 1,
0.3195076, -0.7889171, 2.973706, 0, 0.2313726, 1, 1,
0.3218106, 0.5620402, 1.372037, 0, 0.227451, 1, 1,
0.3231336, 1.743831, 1.149968, 0, 0.2196078, 1, 1,
0.3239025, 0.4583057, 1.699176, 0, 0.2156863, 1, 1,
0.3250181, 0.6270865, 0.8767683, 0, 0.2078431, 1, 1,
0.3273708, -0.2793954, 4.186176, 0, 0.2039216, 1, 1,
0.33106, 0.7839598, 1.624349, 0, 0.1960784, 1, 1,
0.3321985, -0.4253806, 0.7144556, 0, 0.1882353, 1, 1,
0.3334542, -0.7963844, 3.864307, 0, 0.1843137, 1, 1,
0.3345606, 0.2991533, 0.3691586, 0, 0.1764706, 1, 1,
0.3396818, 0.1749617, 1.905349, 0, 0.172549, 1, 1,
0.3432914, 0.6808016, 0.8124424, 0, 0.1647059, 1, 1,
0.3446355, 1.971385, -0.3950066, 0, 0.1607843, 1, 1,
0.3462684, 0.7748011, 0.3096109, 0, 0.1529412, 1, 1,
0.3467584, 2.111362, -1.032471, 0, 0.1490196, 1, 1,
0.3497514, 1.487573, 2.051289, 0, 0.1411765, 1, 1,
0.3515183, -1.346835, 2.497412, 0, 0.1372549, 1, 1,
0.3530063, -0.3396761, 2.280244, 0, 0.1294118, 1, 1,
0.3536062, -0.7937821, 3.452349, 0, 0.1254902, 1, 1,
0.3561454, 0.8426235, 2.691209, 0, 0.1176471, 1, 1,
0.3578486, 1.308735, 1.927162, 0, 0.1137255, 1, 1,
0.3598331, 0.1360876, -0.08242602, 0, 0.1058824, 1, 1,
0.3621784, -0.6832214, 3.833931, 0, 0.09803922, 1, 1,
0.3650074, 0.0125244, 1.676327, 0, 0.09411765, 1, 1,
0.3668254, -1.598643, 3.358803, 0, 0.08627451, 1, 1,
0.3670173, 0.1009038, 0.02441962, 0, 0.08235294, 1, 1,
0.36755, -0.7274235, 3.765396, 0, 0.07450981, 1, 1,
0.3738141, -1.13973, 2.111137, 0, 0.07058824, 1, 1,
0.3742694, -0.9390665, 3.098471, 0, 0.0627451, 1, 1,
0.3746399, 0.1686389, -1.481278, 0, 0.05882353, 1, 1,
0.3796989, -0.4836573, 2.235199, 0, 0.05098039, 1, 1,
0.3810323, 0.04804075, 2.016366, 0, 0.04705882, 1, 1,
0.3812312, 0.8541039, -0.1413923, 0, 0.03921569, 1, 1,
0.3906302, 0.9344877, 0.1872736, 0, 0.03529412, 1, 1,
0.4052969, -1.354515, 1.769156, 0, 0.02745098, 1, 1,
0.4075913, -1.24434, 3.430236, 0, 0.02352941, 1, 1,
0.4122176, -0.627888, 2.307414, 0, 0.01568628, 1, 1,
0.4122709, 1.361996, 0.3797524, 0, 0.01176471, 1, 1,
0.4133523, -2.327742, 3.626601, 0, 0.003921569, 1, 1,
0.4159714, 0.8073701, 0.6394873, 0.003921569, 0, 1, 1,
0.4162009, 1.381442, -0.4749479, 0.007843138, 0, 1, 1,
0.4184957, 0.7551083, -1.023481, 0.01568628, 0, 1, 1,
0.4239005, -0.3027148, 3.839504, 0.01960784, 0, 1, 1,
0.4253337, -0.8624415, 2.914652, 0.02745098, 0, 1, 1,
0.4292307, -0.8324775, 2.195937, 0.03137255, 0, 1, 1,
0.4304676, 1.061484, -0.3842324, 0.03921569, 0, 1, 1,
0.4330388, -0.7516441, 0.8912644, 0.04313726, 0, 1, 1,
0.434164, -1.465393, 2.978073, 0.05098039, 0, 1, 1,
0.4372162, 1.196215, -0.07973057, 0.05490196, 0, 1, 1,
0.4410832, 0.6391643, -1.53043, 0.0627451, 0, 1, 1,
0.4425289, 0.8879513, 0.1529648, 0.06666667, 0, 1, 1,
0.4473056, 0.4753261, 0.1029707, 0.07450981, 0, 1, 1,
0.4497811, 1.0362, 1.016304, 0.07843138, 0, 1, 1,
0.4500796, -1.06263, 2.219613, 0.08627451, 0, 1, 1,
0.4530542, -0.6267968, 4.970327, 0.09019608, 0, 1, 1,
0.4567131, 0.03796801, 1.402749, 0.09803922, 0, 1, 1,
0.4581484, -0.04607447, 1.723112, 0.1058824, 0, 1, 1,
0.4610763, 0.9649691, -0.01377057, 0.1098039, 0, 1, 1,
0.463766, 1.033492, -0.07693633, 0.1176471, 0, 1, 1,
0.4644436, 1.040448, -0.9195214, 0.1215686, 0, 1, 1,
0.4669479, -1.302324, 2.163072, 0.1294118, 0, 1, 1,
0.4709529, -2.569507, 5.334643, 0.1333333, 0, 1, 1,
0.4722023, -0.1640325, 4.349807, 0.1411765, 0, 1, 1,
0.4744565, 0.6631882, 1.201301, 0.145098, 0, 1, 1,
0.4754805, 0.697338, 1.023197, 0.1529412, 0, 1, 1,
0.4766006, -0.4964013, 3.769423, 0.1568628, 0, 1, 1,
0.4790543, -0.5565057, 1.260588, 0.1647059, 0, 1, 1,
0.4842609, -0.5310696, 1.676261, 0.1686275, 0, 1, 1,
0.4843699, -0.2119074, 2.287909, 0.1764706, 0, 1, 1,
0.4928198, -4.210619, 4.280851, 0.1803922, 0, 1, 1,
0.4937364, -0.7794215, 3.282472, 0.1882353, 0, 1, 1,
0.4950989, -1.162798, 2.83246, 0.1921569, 0, 1, 1,
0.500357, 1.638057, 0.6322265, 0.2, 0, 1, 1,
0.5027909, -0.2857611, 3.380799, 0.2078431, 0, 1, 1,
0.5043138, -1.717996, 1.823273, 0.2117647, 0, 1, 1,
0.508232, -0.4967133, 3.673718, 0.2196078, 0, 1, 1,
0.5098836, 0.5492882, 1.241912, 0.2235294, 0, 1, 1,
0.5198673, 0.7590334, 1.949615, 0.2313726, 0, 1, 1,
0.5290024, -0.1668882, 3.951977, 0.2352941, 0, 1, 1,
0.5306268, -1.357376, 1.455679, 0.2431373, 0, 1, 1,
0.5307686, 0.6454328, 1.570866, 0.2470588, 0, 1, 1,
0.5353777, 0.01810589, 3.615885, 0.254902, 0, 1, 1,
0.5460051, -0.9305889, 2.051711, 0.2588235, 0, 1, 1,
0.5488756, 1.061958, 1.433784, 0.2666667, 0, 1, 1,
0.549148, -0.6648365, 3.103374, 0.2705882, 0, 1, 1,
0.5494132, -0.7209837, 4.149311, 0.2784314, 0, 1, 1,
0.5500585, 1.292806, -0.4749588, 0.282353, 0, 1, 1,
0.5524897, 1.527044, 1.113834, 0.2901961, 0, 1, 1,
0.5583177, -0.2315388, 1.988892, 0.2941177, 0, 1, 1,
0.5623264, -0.8007684, 2.447356, 0.3019608, 0, 1, 1,
0.5631046, 1.024958, 1.601005, 0.3098039, 0, 1, 1,
0.5632656, 1.33275, 0.4325739, 0.3137255, 0, 1, 1,
0.5635213, -1.311413, 2.859031, 0.3215686, 0, 1, 1,
0.5691019, 0.02651132, 1.635827, 0.3254902, 0, 1, 1,
0.5718294, 0.1106266, 0.7362667, 0.3333333, 0, 1, 1,
0.5731346, 0.5664057, 0.8007298, 0.3372549, 0, 1, 1,
0.5791917, -0.5548286, 3.485323, 0.345098, 0, 1, 1,
0.5844542, -0.5451258, 2.069587, 0.3490196, 0, 1, 1,
0.5887086, 0.07636063, 1.72991, 0.3568628, 0, 1, 1,
0.59017, -1.338982, 1.300181, 0.3607843, 0, 1, 1,
0.5912875, 1.48419, 0.6001939, 0.3686275, 0, 1, 1,
0.59217, 0.2844277, 0.5519093, 0.372549, 0, 1, 1,
0.5956163, 0.1460024, 2.581743, 0.3803922, 0, 1, 1,
0.6009467, -0.8825101, 2.401628, 0.3843137, 0, 1, 1,
0.6037201, 0.4343035, 1.407741, 0.3921569, 0, 1, 1,
0.6054626, 2.036079, -0.03511906, 0.3960784, 0, 1, 1,
0.6094882, 0.2223947, 0.1167538, 0.4039216, 0, 1, 1,
0.6096923, 0.9084054, -0.6814303, 0.4117647, 0, 1, 1,
0.6097706, 0.2599678, 1.461418, 0.4156863, 0, 1, 1,
0.6159376, 0.4403221, 2.44418, 0.4235294, 0, 1, 1,
0.6210963, -1.212079, 3.68933, 0.427451, 0, 1, 1,
0.6225886, 0.492928, -0.1858928, 0.4352941, 0, 1, 1,
0.6227621, -0.01176614, 0.08306897, 0.4392157, 0, 1, 1,
0.6242211, 0.2651017, 2.193973, 0.4470588, 0, 1, 1,
0.6256493, 1.064562, 1.833135, 0.4509804, 0, 1, 1,
0.6293896, -0.7355092, 3.364027, 0.4588235, 0, 1, 1,
0.6305677, -0.3654956, 3.498401, 0.4627451, 0, 1, 1,
0.6309409, -0.04739341, 1.78002, 0.4705882, 0, 1, 1,
0.6315033, 2.269194, -1.713327, 0.4745098, 0, 1, 1,
0.6326387, 0.6518641, -0.756574, 0.4823529, 0, 1, 1,
0.6371689, 0.1146956, 1.167138, 0.4862745, 0, 1, 1,
0.6375598, -0.7625924, 3.771205, 0.4941176, 0, 1, 1,
0.6469042, 0.5196942, 0.9739313, 0.5019608, 0, 1, 1,
0.6482602, 1.105776, 0.1706865, 0.5058824, 0, 1, 1,
0.6495826, 0.2123129, 0.5220369, 0.5137255, 0, 1, 1,
0.6534762, 1.072543, 1.058021, 0.5176471, 0, 1, 1,
0.6535126, -2.068285, 2.532231, 0.5254902, 0, 1, 1,
0.6539363, -1.115909, 1.258335, 0.5294118, 0, 1, 1,
0.6553894, 1.196066, 0.0002000774, 0.5372549, 0, 1, 1,
0.6578221, -0.4343154, 2.357662, 0.5411765, 0, 1, 1,
0.6621433, -0.1038986, 2.290628, 0.5490196, 0, 1, 1,
0.6633425, -0.6269561, 2.216079, 0.5529412, 0, 1, 1,
0.6667785, -1.020728, 1.408221, 0.5607843, 0, 1, 1,
0.6682292, 0.08947123, 2.357764, 0.5647059, 0, 1, 1,
0.6687987, -1.299814, 2.542319, 0.572549, 0, 1, 1,
0.669543, 0.1659983, 0.2462773, 0.5764706, 0, 1, 1,
0.6741808, -1.033731, 0.7620623, 0.5843138, 0, 1, 1,
0.6779575, -0.4860058, 2.972436, 0.5882353, 0, 1, 1,
0.680886, 0.6658451, -0.8116742, 0.5960785, 0, 1, 1,
0.6850958, -0.8570968, 1.318638, 0.6039216, 0, 1, 1,
0.6892744, 0.1690211, 0.2637918, 0.6078432, 0, 1, 1,
0.691246, -1.613654, 2.43115, 0.6156863, 0, 1, 1,
0.6919168, -1.753538, 4.207208, 0.6196079, 0, 1, 1,
0.6928129, -0.4845472, 1.610507, 0.627451, 0, 1, 1,
0.6936382, -0.3534116, 2.968081, 0.6313726, 0, 1, 1,
0.696498, 2.047601, 0.4368347, 0.6392157, 0, 1, 1,
0.7000621, -1.393979, 3.875967, 0.6431373, 0, 1, 1,
0.7001675, 1.570106, -0.3161584, 0.6509804, 0, 1, 1,
0.7015644, -1.037651, 2.795166, 0.654902, 0, 1, 1,
0.7017174, -0.8778452, 3.112448, 0.6627451, 0, 1, 1,
0.7102011, 0.09576966, 1.926475, 0.6666667, 0, 1, 1,
0.7175369, 2.169077, 2.23195, 0.6745098, 0, 1, 1,
0.7209581, -0.3897063, 2.689197, 0.6784314, 0, 1, 1,
0.7234259, 0.2907012, 0.966505, 0.6862745, 0, 1, 1,
0.7293179, -0.4545709, 0.7374599, 0.6901961, 0, 1, 1,
0.7348747, 0.9193329, 0.1964284, 0.6980392, 0, 1, 1,
0.7366735, 0.7983313, 0.8774504, 0.7058824, 0, 1, 1,
0.7382089, 0.5804029, 0.1148634, 0.7098039, 0, 1, 1,
0.7396188, -1.009351, 3.736587, 0.7176471, 0, 1, 1,
0.7405396, -0.3830146, 1.639623, 0.7215686, 0, 1, 1,
0.74236, -0.8267765, 2.454326, 0.7294118, 0, 1, 1,
0.7445577, -1.004357, 1.349965, 0.7333333, 0, 1, 1,
0.7449201, -1.583426, 1.627146, 0.7411765, 0, 1, 1,
0.7537714, -0.1352966, 1.79892, 0.7450981, 0, 1, 1,
0.7600548, -0.02273013, 1.976367, 0.7529412, 0, 1, 1,
0.7602999, 0.5789756, 0.08556914, 0.7568628, 0, 1, 1,
0.7716224, -2.585753, 3.24314, 0.7647059, 0, 1, 1,
0.778266, -0.7573226, 2.202254, 0.7686275, 0, 1, 1,
0.7863293, -0.2590235, -0.3223061, 0.7764706, 0, 1, 1,
0.7877756, 1.146867, -0.5441535, 0.7803922, 0, 1, 1,
0.7974271, 0.3118262, 2.613023, 0.7882353, 0, 1, 1,
0.8011764, -0.02558303, 0.6012324, 0.7921569, 0, 1, 1,
0.8024288, -0.2148298, -1.544794, 0.8, 0, 1, 1,
0.8036445, 1.782052, -0.6429418, 0.8078431, 0, 1, 1,
0.8068242, 0.4115943, 1.226285, 0.8117647, 0, 1, 1,
0.8093464, -1.202674, 3.219954, 0.8196079, 0, 1, 1,
0.8104656, 3.008466, 1.060805, 0.8235294, 0, 1, 1,
0.8114381, 1.481683, -1.737304, 0.8313726, 0, 1, 1,
0.8150105, -0.9552108, 1.196659, 0.8352941, 0, 1, 1,
0.8238583, -2.836406, 3.669151, 0.8431373, 0, 1, 1,
0.8290923, 0.2970443, -0.1494147, 0.8470588, 0, 1, 1,
0.8391983, -0.027599, 0.5911984, 0.854902, 0, 1, 1,
0.844157, -0.6215439, 0.401297, 0.8588235, 0, 1, 1,
0.8485304, 1.665677, 1.870177, 0.8666667, 0, 1, 1,
0.8524575, 1.950852, 1.234171, 0.8705882, 0, 1, 1,
0.8539461, 0.5585395, 0.8489572, 0.8784314, 0, 1, 1,
0.8539596, 0.7732634, 0.8398436, 0.8823529, 0, 1, 1,
0.8549681, 0.2128066, 1.567394, 0.8901961, 0, 1, 1,
0.8673046, -0.3250524, 0.2734833, 0.8941177, 0, 1, 1,
0.87156, 0.02414302, 0.3261609, 0.9019608, 0, 1, 1,
0.8731171, -0.3790827, 3.53709, 0.9098039, 0, 1, 1,
0.8734907, 0.5653876, 1.365621, 0.9137255, 0, 1, 1,
0.8750192, 1.31256, -0.3701157, 0.9215686, 0, 1, 1,
0.8859593, -0.5910134, 3.20874, 0.9254902, 0, 1, 1,
0.8892066, 1.106365, 0.1065014, 0.9333333, 0, 1, 1,
0.8918649, -1.337759, 3.541363, 0.9372549, 0, 1, 1,
0.8952652, -1.203634, 0.9514087, 0.945098, 0, 1, 1,
0.9116349, 1.029591, -0.4401769, 0.9490196, 0, 1, 1,
0.9190685, 1.851647, 2.719829, 0.9568627, 0, 1, 1,
0.924541, -0.3386874, 0.4910142, 0.9607843, 0, 1, 1,
0.9423993, 0.9007426, -0.1574474, 0.9686275, 0, 1, 1,
0.9430426, -1.179117, 2.996688, 0.972549, 0, 1, 1,
0.9471818, 0.6097103, -0.4753428, 0.9803922, 0, 1, 1,
0.9480253, -1.694628, 1.614482, 0.9843137, 0, 1, 1,
0.9513977, -0.3979163, 2.205707, 0.9921569, 0, 1, 1,
0.9535605, 0.03758767, 0.1309524, 0.9960784, 0, 1, 1,
0.9608026, 0.3918028, 0.9357622, 1, 0, 0.9960784, 1,
0.9716533, -2.053088, 4.392053, 1, 0, 0.9882353, 1,
0.9781641, -1.508059, 3.01923, 1, 0, 0.9843137, 1,
0.9788052, 0.5763701, 1.688134, 1, 0, 0.9764706, 1,
0.9851549, 1.193148, 1.847599, 1, 0, 0.972549, 1,
0.9912072, -0.8390741, 2.215905, 1, 0, 0.9647059, 1,
0.9930062, -0.8105142, 3.150302, 1, 0, 0.9607843, 1,
0.9947506, -0.08484695, 2.207285, 1, 0, 0.9529412, 1,
1.004873, 0.4445862, 2.327509, 1, 0, 0.9490196, 1,
1.00825, -0.6063415, 3.210209, 1, 0, 0.9411765, 1,
1.010468, 0.1511394, 1.687111, 1, 0, 0.9372549, 1,
1.013044, 1.472713, -1.260662, 1, 0, 0.9294118, 1,
1.016407, -1.482252, 1.806747, 1, 0, 0.9254902, 1,
1.035733, 0.1755719, 1.278074, 1, 0, 0.9176471, 1,
1.043262, -1.540657, 1.893119, 1, 0, 0.9137255, 1,
1.046855, -0.1989392, 3.517668, 1, 0, 0.9058824, 1,
1.046916, 0.5927458, 2.340812, 1, 0, 0.9019608, 1,
1.050233, -0.5259126, 1.935936, 1, 0, 0.8941177, 1,
1.051934, 0.3940749, 1.80419, 1, 0, 0.8862745, 1,
1.05428, -0.5337577, 0.6453459, 1, 0, 0.8823529, 1,
1.059311, 1.263397, 0.1218643, 1, 0, 0.8745098, 1,
1.066602, -1.307254, 2.377361, 1, 0, 0.8705882, 1,
1.067154, -0.01474334, 2.289949, 1, 0, 0.8627451, 1,
1.0729, -0.8482219, 2.095909, 1, 0, 0.8588235, 1,
1.084978, -0.7977787, -0.1122291, 1, 0, 0.8509804, 1,
1.089259, -0.1145545, 1.589254, 1, 0, 0.8470588, 1,
1.091606, 0.1811826, 2.302142, 1, 0, 0.8392157, 1,
1.09756, 0.1354585, 2.341828, 1, 0, 0.8352941, 1,
1.10699, -0.5773932, 2.58889, 1, 0, 0.827451, 1,
1.111005, -1.74582, 2.292743, 1, 0, 0.8235294, 1,
1.117916, -0.3996066, 2.731057, 1, 0, 0.8156863, 1,
1.125998, -0.9521446, 0.8180832, 1, 0, 0.8117647, 1,
1.137756, -1.438535, 1.660209, 1, 0, 0.8039216, 1,
1.139745, -0.009545346, 1.32389, 1, 0, 0.7960784, 1,
1.142323, -0.4413546, 3.291784, 1, 0, 0.7921569, 1,
1.145643, 1.454609, 1.979616, 1, 0, 0.7843137, 1,
1.15072, -0.6810657, 0.5033574, 1, 0, 0.7803922, 1,
1.155186, 0.5972195, 2.942992, 1, 0, 0.772549, 1,
1.159307, -0.9090219, 1.287189, 1, 0, 0.7686275, 1,
1.161063, -0.9635141, 2.061299, 1, 0, 0.7607843, 1,
1.161621, -0.6230933, 1.582012, 1, 0, 0.7568628, 1,
1.162845, -1.51117, 3.095629, 1, 0, 0.7490196, 1,
1.163929, 0.6144671, 0.6521236, 1, 0, 0.7450981, 1,
1.164488, -0.7980995, 2.763632, 1, 0, 0.7372549, 1,
1.167471, -0.2299842, 5.205851, 1, 0, 0.7333333, 1,
1.173509, 1.069511, 0.3279281, 1, 0, 0.7254902, 1,
1.178922, 0.2826742, 2.715312, 1, 0, 0.7215686, 1,
1.180123, -0.09938712, -0.1875265, 1, 0, 0.7137255, 1,
1.182942, 0.05825741, 1.465464, 1, 0, 0.7098039, 1,
1.189196, 0.6767, 0.320208, 1, 0, 0.7019608, 1,
1.190309, -0.9160576, 0.8171112, 1, 0, 0.6941177, 1,
1.192439, 1.065084, -0.3955873, 1, 0, 0.6901961, 1,
1.192756, -0.9955071, 1.251024, 1, 0, 0.682353, 1,
1.194788, 1.038277, 2.06931, 1, 0, 0.6784314, 1,
1.20562, 0.1494604, 0.6878516, 1, 0, 0.6705883, 1,
1.212327, -0.1229107, 1.977866, 1, 0, 0.6666667, 1,
1.217108, -0.9709601, 2.931622, 1, 0, 0.6588235, 1,
1.21932, 0.1196906, 0.5898632, 1, 0, 0.654902, 1,
1.223359, -1.227863, 4.207245, 1, 0, 0.6470588, 1,
1.224081, -0.4114873, 2.083675, 1, 0, 0.6431373, 1,
1.226426, -0.09611082, 2.179328, 1, 0, 0.6352941, 1,
1.230171, -1.834598, 3.837703, 1, 0, 0.6313726, 1,
1.234489, -0.1864397, 2.397399, 1, 0, 0.6235294, 1,
1.248988, -1.42812, 3.678647, 1, 0, 0.6196079, 1,
1.259459, -0.3176517, 3.974396, 1, 0, 0.6117647, 1,
1.260402, 1.279761, 1.768136, 1, 0, 0.6078432, 1,
1.261536, 0.542343, 1.677519, 1, 0, 0.6, 1,
1.261813, 0.7670535, 0.06203461, 1, 0, 0.5921569, 1,
1.262903, 0.7345654, -0.1605249, 1, 0, 0.5882353, 1,
1.263159, 0.8659241, 3.708202, 1, 0, 0.5803922, 1,
1.267133, -1.178185, 1.447505, 1, 0, 0.5764706, 1,
1.268588, 0.3528282, 0.4676307, 1, 0, 0.5686275, 1,
1.282102, 1.961715, 1.038872, 1, 0, 0.5647059, 1,
1.3101, 1.745622, -2.666163, 1, 0, 0.5568628, 1,
1.310623, -0.1348924, 2.735816, 1, 0, 0.5529412, 1,
1.312153, 0.3607943, -0.553517, 1, 0, 0.5450981, 1,
1.312421, -2.54093, 3.537734, 1, 0, 0.5411765, 1,
1.321406, -0.3685781, 0.9991224, 1, 0, 0.5333334, 1,
1.329388, -2.051063, 2.175936, 1, 0, 0.5294118, 1,
1.342115, -0.9608621, 0.6561217, 1, 0, 0.5215687, 1,
1.343533, -0.3010423, 2.130023, 1, 0, 0.5176471, 1,
1.349961, -0.7095391, 0.4330095, 1, 0, 0.509804, 1,
1.350042, -0.06162714, 2.373948, 1, 0, 0.5058824, 1,
1.362536, -0.441477, 2.570575, 1, 0, 0.4980392, 1,
1.379052, -0.7821993, 2.008196, 1, 0, 0.4901961, 1,
1.391013, -1.003975, 2.832443, 1, 0, 0.4862745, 1,
1.395934, 0.239075, 1.837878, 1, 0, 0.4784314, 1,
1.405751, -0.5214838, 1.675765, 1, 0, 0.4745098, 1,
1.416742, -0.9159407, -0.810595, 1, 0, 0.4666667, 1,
1.436697, 2.100702, 2.073749, 1, 0, 0.4627451, 1,
1.437625, -0.3109373, 3.232828, 1, 0, 0.454902, 1,
1.446751, -0.9302557, 1.049686, 1, 0, 0.4509804, 1,
1.452566, -1.583794, 2.328486, 1, 0, 0.4431373, 1,
1.473625, 0.1217947, 1.012137, 1, 0, 0.4392157, 1,
1.473949, 0.3679213, 2.601448, 1, 0, 0.4313726, 1,
1.479046, -0.1153291, 1.053334, 1, 0, 0.427451, 1,
1.482631, -0.3554975, 1.310785, 1, 0, 0.4196078, 1,
1.501808, 0.3988428, 1.727829, 1, 0, 0.4156863, 1,
1.514946, -0.7980374, 2.223088, 1, 0, 0.4078431, 1,
1.516768, -0.7782113, 2.441707, 1, 0, 0.4039216, 1,
1.517727, -0.2147238, 1.537983, 1, 0, 0.3960784, 1,
1.517844, 0.1004432, 1.575042, 1, 0, 0.3882353, 1,
1.524867, -1.521445, 2.185243, 1, 0, 0.3843137, 1,
1.532045, 0.6566572, -0.444924, 1, 0, 0.3764706, 1,
1.550865, -0.2871971, 2.816478, 1, 0, 0.372549, 1,
1.552493, -0.7499112, 0.6734062, 1, 0, 0.3647059, 1,
1.554584, 1.017461, 1.550113, 1, 0, 0.3607843, 1,
1.588665, -0.3665177, 1.003966, 1, 0, 0.3529412, 1,
1.592332, -0.6716827, 2.575851, 1, 0, 0.3490196, 1,
1.610828, -0.471972, 2.973584, 1, 0, 0.3411765, 1,
1.625901, 0.2901042, 0.5248547, 1, 0, 0.3372549, 1,
1.63215, 1.753964, 0.4720791, 1, 0, 0.3294118, 1,
1.63975, 1.080075, 1.538438, 1, 0, 0.3254902, 1,
1.671009, 1.095047, -0.8727469, 1, 0, 0.3176471, 1,
1.691279, 0.9286129, 1.00194, 1, 0, 0.3137255, 1,
1.728381, -0.3574711, 1.064636, 1, 0, 0.3058824, 1,
1.729765, -0.03828823, 2.383185, 1, 0, 0.2980392, 1,
1.754813, -0.6920773, 0.8696845, 1, 0, 0.2941177, 1,
1.767069, 1.941284, 0.1704585, 1, 0, 0.2862745, 1,
1.793867, 0.5923074, -0.2078048, 1, 0, 0.282353, 1,
1.810784, 1.082253, 0.2015944, 1, 0, 0.2745098, 1,
1.810995, 0.7549157, 0.418544, 1, 0, 0.2705882, 1,
1.813519, 0.3098931, 1.839015, 1, 0, 0.2627451, 1,
1.813974, 0.3963681, 0.7200205, 1, 0, 0.2588235, 1,
1.816057, -1.735394, 3.27352, 1, 0, 0.2509804, 1,
1.826471, 0.3533572, 0.794718, 1, 0, 0.2470588, 1,
1.831247, -0.0996429, -0.1761206, 1, 0, 0.2392157, 1,
1.834474, -0.9968499, 3.111908, 1, 0, 0.2352941, 1,
1.841096, 0.2434525, 0.2718416, 1, 0, 0.227451, 1,
1.874045, -0.9405723, 2.556743, 1, 0, 0.2235294, 1,
1.880009, 0.429543, 0.6486536, 1, 0, 0.2156863, 1,
1.89513, -0.7525799, 2.561317, 1, 0, 0.2117647, 1,
1.905019, 2.001729, 0.9776223, 1, 0, 0.2039216, 1,
1.906819, 2.228332, 2.337158, 1, 0, 0.1960784, 1,
1.907763, -0.2790301, 2.00861, 1, 0, 0.1921569, 1,
1.909781, 0.8105876, 2.500776, 1, 0, 0.1843137, 1,
1.925751, 2.071553, 2.300429, 1, 0, 0.1803922, 1,
1.993442, 0.5871658, 2.42738, 1, 0, 0.172549, 1,
2.00105, 0.6618307, 0.162082, 1, 0, 0.1686275, 1,
2.001466, -0.7973063, 2.843259, 1, 0, 0.1607843, 1,
2.029863, -2.101894, 2.058369, 1, 0, 0.1568628, 1,
2.035, 1.016443, 0.3770467, 1, 0, 0.1490196, 1,
2.073247, -1.426288, 2.218101, 1, 0, 0.145098, 1,
2.077021, 0.094428, 1.375931, 1, 0, 0.1372549, 1,
2.079676, -0.633059, 1.615292, 1, 0, 0.1333333, 1,
2.088033, -0.8079488, 1.117327, 1, 0, 0.1254902, 1,
2.100383, 1.108359, 0.8323127, 1, 0, 0.1215686, 1,
2.134392, 0.2132056, 2.449893, 1, 0, 0.1137255, 1,
2.242829, 1.07006, 1.799269, 1, 0, 0.1098039, 1,
2.253454, 0.03740892, 1.766076, 1, 0, 0.1019608, 1,
2.261435, -0.02969291, 0.9948928, 1, 0, 0.09411765, 1,
2.328662, -0.7134396, 1.958363, 1, 0, 0.09019608, 1,
2.356376, -0.1425533, 1.906078, 1, 0, 0.08235294, 1,
2.36526, 0.57482, 1.893229, 1, 0, 0.07843138, 1,
2.440613, 1.29015, 1.770012, 1, 0, 0.07058824, 1,
2.462409, 1.09458, 0.7596973, 1, 0, 0.06666667, 1,
2.484948, 0.3109268, 0.2665176, 1, 0, 0.05882353, 1,
2.501872, 0.1003943, 2.455953, 1, 0, 0.05490196, 1,
2.563874, -0.03283986, 2.511615, 1, 0, 0.04705882, 1,
2.582495, 0.1469242, 1.498631, 1, 0, 0.04313726, 1,
2.586494, 0.283937, 2.736197, 1, 0, 0.03529412, 1,
2.64104, 0.09420048, 1.978547, 1, 0, 0.03137255, 1,
2.64546, 1.33762, 1.346306, 1, 0, 0.02352941, 1,
2.772352, -1.214065, 1.413131, 1, 0, 0.01960784, 1,
3.163923, 0.09989075, 1.096349, 1, 0, 0.01176471, 1,
3.49366, 1.40704, 1.616324, 1, 0, 0.007843138, 1
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
-0.08589041, -5.434255, -6.844338, 0, -0.5, 0.5, 0.5,
-0.08589041, -5.434255, -6.844338, 1, -0.5, 0.5, 0.5,
-0.08589041, -5.434255, -6.844338, 1, 1.5, 0.5, 0.5,
-0.08589041, -5.434255, -6.844338, 0, 1.5, 0.5, 0.5
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
-4.878908, -0.6010766, -6.844338, 0, -0.5, 0.5, 0.5,
-4.878908, -0.6010766, -6.844338, 1, -0.5, 0.5, 0.5,
-4.878908, -0.6010766, -6.844338, 1, 1.5, 0.5, 0.5,
-4.878908, -0.6010766, -6.844338, 0, 1.5, 0.5, 0.5
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
-4.878908, -5.434255, 0.1277251, 0, -0.5, 0.5, 0.5,
-4.878908, -5.434255, 0.1277251, 1, -0.5, 0.5, 0.5,
-4.878908, -5.434255, 0.1277251, 1, 1.5, 0.5, 0.5,
-4.878908, -5.434255, 0.1277251, 0, 1.5, 0.5, 0.5
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
-2, -4.318906, -5.235401,
2, -4.318906, -5.235401,
-2, -4.318906, -5.235401,
-2, -4.504797, -5.503557,
0, -4.318906, -5.235401,
0, -4.504797, -5.503557,
2, -4.318906, -5.235401,
2, -4.504797, -5.503557
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
-2, -4.87658, -6.039869, 0, -0.5, 0.5, 0.5,
-2, -4.87658, -6.039869, 1, -0.5, 0.5, 0.5,
-2, -4.87658, -6.039869, 1, 1.5, 0.5, 0.5,
-2, -4.87658, -6.039869, 0, 1.5, 0.5, 0.5,
0, -4.87658, -6.039869, 0, -0.5, 0.5, 0.5,
0, -4.87658, -6.039869, 1, -0.5, 0.5, 0.5,
0, -4.87658, -6.039869, 1, 1.5, 0.5, 0.5,
0, -4.87658, -6.039869, 0, 1.5, 0.5, 0.5,
2, -4.87658, -6.039869, 0, -0.5, 0.5, 0.5,
2, -4.87658, -6.039869, 1, -0.5, 0.5, 0.5,
2, -4.87658, -6.039869, 1, 1.5, 0.5, 0.5,
2, -4.87658, -6.039869, 0, 1.5, 0.5, 0.5
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
-3.772827, -4, -5.235401,
-3.772827, 2, -5.235401,
-3.772827, -4, -5.235401,
-3.957174, -4, -5.503557,
-3.772827, -2, -5.235401,
-3.957174, -2, -5.503557,
-3.772827, 0, -5.235401,
-3.957174, 0, -5.503557,
-3.772827, 2, -5.235401,
-3.957174, 2, -5.503557
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
-4.325868, -4, -6.039869, 0, -0.5, 0.5, 0.5,
-4.325868, -4, -6.039869, 1, -0.5, 0.5, 0.5,
-4.325868, -4, -6.039869, 1, 1.5, 0.5, 0.5,
-4.325868, -4, -6.039869, 0, 1.5, 0.5, 0.5,
-4.325868, -2, -6.039869, 0, -0.5, 0.5, 0.5,
-4.325868, -2, -6.039869, 1, -0.5, 0.5, 0.5,
-4.325868, -2, -6.039869, 1, 1.5, 0.5, 0.5,
-4.325868, -2, -6.039869, 0, 1.5, 0.5, 0.5,
-4.325868, 0, -6.039869, 0, -0.5, 0.5, 0.5,
-4.325868, 0, -6.039869, 1, -0.5, 0.5, 0.5,
-4.325868, 0, -6.039869, 1, 1.5, 0.5, 0.5,
-4.325868, 0, -6.039869, 0, 1.5, 0.5, 0.5,
-4.325868, 2, -6.039869, 0, -0.5, 0.5, 0.5,
-4.325868, 2, -6.039869, 1, -0.5, 0.5, 0.5,
-4.325868, 2, -6.039869, 1, 1.5, 0.5, 0.5,
-4.325868, 2, -6.039869, 0, 1.5, 0.5, 0.5
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
-3.772827, -4.318906, -4,
-3.772827, -4.318906, 4,
-3.772827, -4.318906, -4,
-3.957174, -4.504797, -4,
-3.772827, -4.318906, -2,
-3.957174, -4.504797, -2,
-3.772827, -4.318906, 0,
-3.957174, -4.504797, 0,
-3.772827, -4.318906, 2,
-3.957174, -4.504797, 2,
-3.772827, -4.318906, 4,
-3.957174, -4.504797, 4
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
-4.325868, -4.87658, -4, 0, -0.5, 0.5, 0.5,
-4.325868, -4.87658, -4, 1, -0.5, 0.5, 0.5,
-4.325868, -4.87658, -4, 1, 1.5, 0.5, 0.5,
-4.325868, -4.87658, -4, 0, 1.5, 0.5, 0.5,
-4.325868, -4.87658, -2, 0, -0.5, 0.5, 0.5,
-4.325868, -4.87658, -2, 1, -0.5, 0.5, 0.5,
-4.325868, -4.87658, -2, 1, 1.5, 0.5, 0.5,
-4.325868, -4.87658, -2, 0, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 0, 0, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 0, 1, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 0, 1, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 0, 0, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 2, 0, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 2, 1, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 2, 1, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 2, 0, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 4, 0, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 4, 1, -0.5, 0.5, 0.5,
-4.325868, -4.87658, 4, 1, 1.5, 0.5, 0.5,
-4.325868, -4.87658, 4, 0, 1.5, 0.5, 0.5
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
-3.772827, -4.318906, -5.235401,
-3.772827, 3.116753, -5.235401,
-3.772827, -4.318906, 5.490851,
-3.772827, 3.116753, 5.490851,
-3.772827, -4.318906, -5.235401,
-3.772827, -4.318906, 5.490851,
-3.772827, 3.116753, -5.235401,
-3.772827, 3.116753, 5.490851,
-3.772827, -4.318906, -5.235401,
3.601046, -4.318906, -5.235401,
-3.772827, -4.318906, 5.490851,
3.601046, -4.318906, 5.490851,
-3.772827, 3.116753, -5.235401,
3.601046, 3.116753, -5.235401,
-3.772827, 3.116753, 5.490851,
3.601046, 3.116753, 5.490851,
3.601046, -4.318906, -5.235401,
3.601046, 3.116753, -5.235401,
3.601046, -4.318906, 5.490851,
3.601046, 3.116753, 5.490851,
3.601046, -4.318906, -5.235401,
3.601046, -4.318906, 5.490851,
3.601046, 3.116753, -5.235401,
3.601046, 3.116753, 5.490851
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
var radius = 8.004643;
var distance = 35.61356;
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
mvMatrix.translate( 0.08589041, 0.6010766, -0.1277251 );
mvMatrix.scale( 1.173708, 1.163956, 0.806878 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.61356);
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
Coumaphos<-read.table("Coumaphos.xyz")
```

```
## Error in read.table("Coumaphos.xyz"): no lines available in input
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
-3.665441, 0.06575791, 0.2449824, 0, 0, 1, 1, 1,
-3.000244, 1.852506, -1.606872, 1, 0, 0, 1, 1,
-2.9288, -0.7451806, -1.456907, 1, 0, 0, 1, 1,
-2.693696, 0.4630129, -1.215221, 1, 0, 0, 1, 1,
-2.679663, 1.18716, -1.403813, 1, 0, 0, 1, 1,
-2.618075, -0.0789711, -2.921441, 1, 0, 0, 1, 1,
-2.468018, 0.01985758, -0.5241213, 0, 0, 0, 1, 1,
-2.444056, 1.557637, -1.359304, 0, 0, 0, 1, 1,
-2.442331, -0.2672744, -0.9217306, 0, 0, 0, 1, 1,
-2.398654, -1.497386, -2.824267, 0, 0, 0, 1, 1,
-2.3911, 0.1027645, -1.840247, 0, 0, 0, 1, 1,
-2.389642, 0.3179439, -0.7371541, 0, 0, 0, 1, 1,
-2.377731, 0.567072, -2.920754, 0, 0, 0, 1, 1,
-2.364918, -0.8578771, -1.24791, 1, 1, 1, 1, 1,
-2.364542, 1.910004, -0.4541117, 1, 1, 1, 1, 1,
-2.272352, 0.4379873, -1.770634, 1, 1, 1, 1, 1,
-2.252872, 0.658862, -2.176563, 1, 1, 1, 1, 1,
-2.231871, 0.8401367, -0.6498728, 1, 1, 1, 1, 1,
-2.218445, -0.8217986, -1.547633, 1, 1, 1, 1, 1,
-2.074459, 1.530011, -2.69459, 1, 1, 1, 1, 1,
-2.06992, -0.3925466, -1.801726, 1, 1, 1, 1, 1,
-2.032949, -1.758281, -1.919432, 1, 1, 1, 1, 1,
-2.021612, -0.2257781, -2.975304, 1, 1, 1, 1, 1,
-1.991046, -2.533648, -2.310348, 1, 1, 1, 1, 1,
-1.987583, 0.4970442, -2.133096, 1, 1, 1, 1, 1,
-1.980519, 0.6614876, -1.932697, 1, 1, 1, 1, 1,
-1.973945, -1.376969, -2.494779, 1, 1, 1, 1, 1,
-1.968237, -0.664221, -2.533416, 1, 1, 1, 1, 1,
-1.968215, -0.954805, -0.770602, 0, 0, 1, 1, 1,
-1.9604, -0.9563153, -3.420352, 1, 0, 0, 1, 1,
-1.919679, 0.6932511, 0.1463487, 1, 0, 0, 1, 1,
-1.893244, -0.3580825, -2.099942, 1, 0, 0, 1, 1,
-1.891341, -1.437447, -1.167996, 1, 0, 0, 1, 1,
-1.846854, 1.562428, -1.456612, 1, 0, 0, 1, 1,
-1.833495, 0.0312924, -1.445546, 0, 0, 0, 1, 1,
-1.821729, -0.0154008, -1.900993, 0, 0, 0, 1, 1,
-1.818833, -0.3871618, -1.894678, 0, 0, 0, 1, 1,
-1.814851, -0.19899, -0.7181441, 0, 0, 0, 1, 1,
-1.812845, -0.07318966, -1.318888, 0, 0, 0, 1, 1,
-1.78942, -1.283263, -2.386852, 0, 0, 0, 1, 1,
-1.789012, -0.2962266, -1.594401, 0, 0, 0, 1, 1,
-1.766928, -0.3061771, -1.775481, 1, 1, 1, 1, 1,
-1.758912, 0.1020564, -3.062943, 1, 1, 1, 1, 1,
-1.754273, -1.513325, -3.432091, 1, 1, 1, 1, 1,
-1.737039, 0.3584021, -1.866747, 1, 1, 1, 1, 1,
-1.734156, -1.92856, -2.472186, 1, 1, 1, 1, 1,
-1.723989, 0.6077825, -1.457375, 1, 1, 1, 1, 1,
-1.723247, -0.1401047, -0.9925297, 1, 1, 1, 1, 1,
-1.688755, -1.26706, -2.18164, 1, 1, 1, 1, 1,
-1.688734, 1.081981, -0.8365337, 1, 1, 1, 1, 1,
-1.684494, -0.9104568, -1.668226, 1, 1, 1, 1, 1,
-1.673925, 0.6783298, -1.515778, 1, 1, 1, 1, 1,
-1.671682, -0.4232887, -1.938489, 1, 1, 1, 1, 1,
-1.664481, 1.008257, -0.8361837, 1, 1, 1, 1, 1,
-1.660625, 0.3069352, -1.834859, 1, 1, 1, 1, 1,
-1.659011, 0.1177053, -1.93675, 1, 1, 1, 1, 1,
-1.649757, 0.2460292, -0.7565765, 0, 0, 1, 1, 1,
-1.643582, 0.5174384, -1.704077, 1, 0, 0, 1, 1,
-1.638233, 1.410893, -1.001546, 1, 0, 0, 1, 1,
-1.625105, 0.09779086, -1.556505, 1, 0, 0, 1, 1,
-1.624943, 1.355772, -1.844352, 1, 0, 0, 1, 1,
-1.62429, -1.006449, -2.186358, 1, 0, 0, 1, 1,
-1.623713, -1.412476, -1.084733, 0, 0, 0, 1, 1,
-1.614659, 0.15806, -0.5652211, 0, 0, 0, 1, 1,
-1.605101, -0.7217615, -1.46929, 0, 0, 0, 1, 1,
-1.58817, 1.31636, -1.475774, 0, 0, 0, 1, 1,
-1.586221, -0.5798879, -0.530619, 0, 0, 0, 1, 1,
-1.576137, 0.08754045, -2.459002, 0, 0, 0, 1, 1,
-1.552289, -0.1422987, -0.1360476, 0, 0, 0, 1, 1,
-1.542624, 0.8896299, -1.02107, 1, 1, 1, 1, 1,
-1.540696, -0.05837873, -0.3226614, 1, 1, 1, 1, 1,
-1.522451, -1.672844, -2.359561, 1, 1, 1, 1, 1,
-1.520539, 0.2964798, -0.9401765, 1, 1, 1, 1, 1,
-1.513005, -0.2741667, -2.330965, 1, 1, 1, 1, 1,
-1.504933, -3.392748, -2.449463, 1, 1, 1, 1, 1,
-1.504184, -0.9605235, -0.139113, 1, 1, 1, 1, 1,
-1.500771, -1.369851, -1.90458, 1, 1, 1, 1, 1,
-1.50034, -2.390183, -1.0756, 1, 1, 1, 1, 1,
-1.484641, -0.01980781, -2.662558, 1, 1, 1, 1, 1,
-1.479335, 0.8687345, -1.410518, 1, 1, 1, 1, 1,
-1.445765, -0.8477749, -1.516387, 1, 1, 1, 1, 1,
-1.440867, 0.2036008, -0.4185056, 1, 1, 1, 1, 1,
-1.439852, -1.497756, -2.587455, 1, 1, 1, 1, 1,
-1.438926, 0.1880468, -0.04884186, 1, 1, 1, 1, 1,
-1.437479, -0.408192, -0.1220262, 0, 0, 1, 1, 1,
-1.43461, -0.4701417, -1.359415, 1, 0, 0, 1, 1,
-1.428692, 0.6112949, -0.8365632, 1, 0, 0, 1, 1,
-1.428173, 0.9879553, -1.504989, 1, 0, 0, 1, 1,
-1.414093, -0.284144, 0.5979863, 1, 0, 0, 1, 1,
-1.408867, -0.8470051, -1.481444, 1, 0, 0, 1, 1,
-1.397873, -1.268783, -2.500195, 0, 0, 0, 1, 1,
-1.375098, -0.2360625, -1.818655, 0, 0, 0, 1, 1,
-1.370956, 1.270886, -0.6526307, 0, 0, 0, 1, 1,
-1.363843, 0.4623356, -3.202011, 0, 0, 0, 1, 1,
-1.358206, -1.076108, -2.47075, 0, 0, 0, 1, 1,
-1.346025, 0.4525117, -1.289802, 0, 0, 0, 1, 1,
-1.345455, -0.3811091, -1.713189, 0, 0, 0, 1, 1,
-1.333098, -0.9198506, -2.33961, 1, 1, 1, 1, 1,
-1.330241, 0.8215324, -2.916783, 1, 1, 1, 1, 1,
-1.318266, 0.1243661, 0.5075939, 1, 1, 1, 1, 1,
-1.315218, -0.1324994, -3.03261, 1, 1, 1, 1, 1,
-1.313093, 0.6552541, -2.829932, 1, 1, 1, 1, 1,
-1.310934, -0.5167938, -1.781238, 1, 1, 1, 1, 1,
-1.308136, -0.5427917, -2.458931, 1, 1, 1, 1, 1,
-1.305774, -0.3031209, -2.803993, 1, 1, 1, 1, 1,
-1.302966, -0.4724441, -2.586555, 1, 1, 1, 1, 1,
-1.302144, 0.1217107, -1.034846, 1, 1, 1, 1, 1,
-1.297195, -0.0258507, -0.3402196, 1, 1, 1, 1, 1,
-1.294674, -1.18123, -1.764233, 1, 1, 1, 1, 1,
-1.292359, 0.9178229, -1.93721, 1, 1, 1, 1, 1,
-1.283316, -1.181288, -2.591063, 1, 1, 1, 1, 1,
-1.282064, -1.159137, -3.593757, 1, 1, 1, 1, 1,
-1.28006, 0.2855004, -0.4565949, 0, 0, 1, 1, 1,
-1.27097, -0.1462823, -0.9518262, 1, 0, 0, 1, 1,
-1.270669, 0.4026402, -2.789181, 1, 0, 0, 1, 1,
-1.270429, 1.677571, -0.9908837, 1, 0, 0, 1, 1,
-1.269702, 1.980942, -1.351335, 1, 0, 0, 1, 1,
-1.268198, -0.6337809, -3.144518, 1, 0, 0, 1, 1,
-1.264267, -0.998998, -0.8705222, 0, 0, 0, 1, 1,
-1.263347, -0.161964, -1.687886, 0, 0, 0, 1, 1,
-1.261933, -0.709675, -4.244966, 0, 0, 0, 1, 1,
-1.256759, 0.3768368, -1.730864, 0, 0, 0, 1, 1,
-1.254254, 0.111008, -1.230251, 0, 0, 0, 1, 1,
-1.238337, 1.15144, -0.07880629, 0, 0, 0, 1, 1,
-1.233202, 0.2941803, -1.739198, 0, 0, 0, 1, 1,
-1.213867, -0.3005522, -2.020519, 1, 1, 1, 1, 1,
-1.208352, 0.4700442, -1.067214, 1, 1, 1, 1, 1,
-1.206256, -0.9714005, -0.7625583, 1, 1, 1, 1, 1,
-1.200894, 0.6103079, -1.245766, 1, 1, 1, 1, 1,
-1.198766, 1.722186, -1.40108, 1, 1, 1, 1, 1,
-1.190818, 0.8701026, -3.539615, 1, 1, 1, 1, 1,
-1.179983, -0.8364723, -0.9194764, 1, 1, 1, 1, 1,
-1.178606, -0.1961625, -2.600967, 1, 1, 1, 1, 1,
-1.168616, -1.351083, -3.636901, 1, 1, 1, 1, 1,
-1.16794, -0.4721228, -1.75737, 1, 1, 1, 1, 1,
-1.160995, -0.2861264, -2.5581, 1, 1, 1, 1, 1,
-1.156741, -0.7439768, -2.422586, 1, 1, 1, 1, 1,
-1.154711, 0.3403646, -0.6424745, 1, 1, 1, 1, 1,
-1.151076, -0.5926057, -1.952062, 1, 1, 1, 1, 1,
-1.132579, 0.4638155, -0.5356165, 1, 1, 1, 1, 1,
-1.131174, -0.8774268, -1.506131, 0, 0, 1, 1, 1,
-1.12509, -1.613687, -3.327738, 1, 0, 0, 1, 1,
-1.116813, -0.4045931, -3.513664, 1, 0, 0, 1, 1,
-1.114587, 0.1059713, -0.7186536, 1, 0, 0, 1, 1,
-1.114144, 0.1595722, -2.302573, 1, 0, 0, 1, 1,
-1.11164, -0.7346852, -2.032257, 1, 0, 0, 1, 1,
-1.110922, 0.8253744, -0.2943284, 0, 0, 0, 1, 1,
-1.107733, 1.172419, 0.5201738, 0, 0, 0, 1, 1,
-1.107596, -0.8006411, -3.965536, 0, 0, 0, 1, 1,
-1.105132, -0.0001758963, -2.930335, 0, 0, 0, 1, 1,
-1.098989, 0.3076573, -0.9010219, 0, 0, 0, 1, 1,
-1.09629, 1.650713, -1.431415, 0, 0, 0, 1, 1,
-1.095707, -0.530253, 0.1194623, 0, 0, 0, 1, 1,
-1.088546, -0.2596742, -1.67039, 1, 1, 1, 1, 1,
-1.087303, -0.4353323, -2.255001, 1, 1, 1, 1, 1,
-1.08154, -0.5710366, -2.147692, 1, 1, 1, 1, 1,
-1.081207, -1.220805, -1.268571, 1, 1, 1, 1, 1,
-1.079646, 0.0009961826, -2.21271, 1, 1, 1, 1, 1,
-1.074808, 1.209399, -0.8809223, 1, 1, 1, 1, 1,
-1.063046, 2.531016, -0.8966353, 1, 1, 1, 1, 1,
-1.054438, -0.1047699, -1.31985, 1, 1, 1, 1, 1,
-1.051635, -1.946944, -2.687502, 1, 1, 1, 1, 1,
-1.046289, 1.132317, 0.2975441, 1, 1, 1, 1, 1,
-1.045594, -0.830752, -3.760132, 1, 1, 1, 1, 1,
-1.028145, -1.531347, -3.601772, 1, 1, 1, 1, 1,
-1.02459, 1.629475, -1.023754, 1, 1, 1, 1, 1,
-1.019746, 0.3389137, -0.7000866, 1, 1, 1, 1, 1,
-1.019114, -0.2542602, -2.773036, 1, 1, 1, 1, 1,
-1.009547, -2.761806, -3.658674, 0, 0, 1, 1, 1,
-1.008433, -0.1854688, -0.9121718, 1, 0, 0, 1, 1,
-1.008329, -0.500274, -2.573737, 1, 0, 0, 1, 1,
-1.001791, 0.09907317, -0.8477831, 1, 0, 0, 1, 1,
-0.9972363, 0.9428295, -0.1387105, 1, 0, 0, 1, 1,
-0.994651, 0.1165803, 0.07896585, 1, 0, 0, 1, 1,
-0.986338, -0.8434715, -1.612863, 0, 0, 0, 1, 1,
-0.9843629, -0.08693593, -2.53679, 0, 0, 0, 1, 1,
-0.9778746, -0.570466, -3.046332, 0, 0, 0, 1, 1,
-0.9768886, 1.390093, -1.194025, 0, 0, 0, 1, 1,
-0.9753608, 1.690193, 0.7941024, 0, 0, 0, 1, 1,
-0.9721866, -1.051067, -1.017799, 0, 0, 0, 1, 1,
-0.9687241, 0.454185, 0.0775869, 0, 0, 0, 1, 1,
-0.9627973, 0.2842088, 0.37581, 1, 1, 1, 1, 1,
-0.961717, -1.1975, -0.7363578, 1, 1, 1, 1, 1,
-0.9599116, 0.2334838, -2.25579, 1, 1, 1, 1, 1,
-0.9572667, -0.04652233, -1.29887, 1, 1, 1, 1, 1,
-0.9544933, -0.2590128, -1.865949, 1, 1, 1, 1, 1,
-0.9438056, -0.6230628, -2.088345, 1, 1, 1, 1, 1,
-0.9408138, -1.054475, -2.908571, 1, 1, 1, 1, 1,
-0.9373081, 1.940261, 1.087743, 1, 1, 1, 1, 1,
-0.9357871, -2.185813, -3.487258, 1, 1, 1, 1, 1,
-0.9317142, 1.406183, 0.3559507, 1, 1, 1, 1, 1,
-0.9297194, 1.437917, -1.743346, 1, 1, 1, 1, 1,
-0.9210788, 2.586332, -1.22783, 1, 1, 1, 1, 1,
-0.9176409, 0.4977094, -1.334165, 1, 1, 1, 1, 1,
-0.9175694, 0.7335941, 0.02812742, 1, 1, 1, 1, 1,
-0.9110224, 0.6666666, -0.3112561, 1, 1, 1, 1, 1,
-0.9079738, 1.053095, -0.09428294, 0, 0, 1, 1, 1,
-0.9070219, -0.4281923, -3.008176, 1, 0, 0, 1, 1,
-0.9050947, 1.635729, 0.08057419, 1, 0, 0, 1, 1,
-0.9028647, 1.315927, -1.583795, 1, 0, 0, 1, 1,
-0.8959057, 0.9519795, -1.175527, 1, 0, 0, 1, 1,
-0.8940336, 0.891027, -1.514475, 1, 0, 0, 1, 1,
-0.8920228, -0.07917174, -3.762958, 0, 0, 0, 1, 1,
-0.8920069, 0.8325294, -0.261216, 0, 0, 0, 1, 1,
-0.8918973, -0.2942317, -2.785782, 0, 0, 0, 1, 1,
-0.8899143, -0.1232354, -3.318667, 0, 0, 0, 1, 1,
-0.8877728, 0.5346679, 0.1956552, 0, 0, 0, 1, 1,
-0.8868359, -0.7490729, -1.698051, 0, 0, 0, 1, 1,
-0.8812003, -2.722826, -4.216389, 0, 0, 0, 1, 1,
-0.8810126, -0.3285615, -1.433908, 1, 1, 1, 1, 1,
-0.8809876, 0.2773352, 0.9580076, 1, 1, 1, 1, 1,
-0.8725502, -1.39164, -2.319781, 1, 1, 1, 1, 1,
-0.8709687, 0.2600891, 0.9105784, 1, 1, 1, 1, 1,
-0.8696275, -0.3855718, -1.161724, 1, 1, 1, 1, 1,
-0.8591437, -1.30739, -1.324394, 1, 1, 1, 1, 1,
-0.8565305, -0.9416555, -0.2876396, 1, 1, 1, 1, 1,
-0.8544636, 1.091675, -1.455285, 1, 1, 1, 1, 1,
-0.8499799, -0.1422485, -1.043345, 1, 1, 1, 1, 1,
-0.8454108, 0.09318223, -0.6438174, 1, 1, 1, 1, 1,
-0.8389879, -0.914378, -1.989322, 1, 1, 1, 1, 1,
-0.8386049, 0.07763077, -1.720809, 1, 1, 1, 1, 1,
-0.8366201, -0.07201665, -1.056009, 1, 1, 1, 1, 1,
-0.8336669, -0.3568992, -0.30435, 1, 1, 1, 1, 1,
-0.8289485, -0.7782442, -3.575418, 1, 1, 1, 1, 1,
-0.8247435, 1.785961, -0.7343603, 0, 0, 1, 1, 1,
-0.8222996, 0.769848, 0.1901713, 1, 0, 0, 1, 1,
-0.820519, -0.6447563, -1.761553, 1, 0, 0, 1, 1,
-0.8179158, 0.3803421, -0.6078625, 1, 0, 0, 1, 1,
-0.8145182, 0.4773243, -1.636123, 1, 0, 0, 1, 1,
-0.8141986, 0.4723119, -0.1430586, 1, 0, 0, 1, 1,
-0.8123506, 1.073442, -0.7050855, 0, 0, 0, 1, 1,
-0.8121951, -0.1261965, -0.264857, 0, 0, 0, 1, 1,
-0.811456, -0.6734568, -3.762655, 0, 0, 0, 1, 1,
-0.8089486, -1.318302, -1.564721, 0, 0, 0, 1, 1,
-0.794117, 0.005448429, -1.603677, 0, 0, 0, 1, 1,
-0.7924113, 0.09799147, -0.06988019, 0, 0, 0, 1, 1,
-0.7908996, -0.02156099, 0.7624776, 0, 0, 0, 1, 1,
-0.7891777, 0.5531387, -0.8343617, 1, 1, 1, 1, 1,
-0.7818292, -0.7406583, -0.6023808, 1, 1, 1, 1, 1,
-0.7729366, 0.003915855, -1.084313, 1, 1, 1, 1, 1,
-0.7694892, 0.2384527, -0.7619335, 1, 1, 1, 1, 1,
-0.7620288, 0.1258513, -2.257466, 1, 1, 1, 1, 1,
-0.7617804, 0.444997, -1.188474, 1, 1, 1, 1, 1,
-0.7605181, -0.1720178, -0.8618473, 1, 1, 1, 1, 1,
-0.7555187, -0.4759272, -2.267423, 1, 1, 1, 1, 1,
-0.7497172, 0.6099664, -1.422598, 1, 1, 1, 1, 1,
-0.7442066, 0.5000857, -0.8502975, 1, 1, 1, 1, 1,
-0.7402515, -1.746233, -1.328791, 1, 1, 1, 1, 1,
-0.7353563, 1.165143, -0.1196306, 1, 1, 1, 1, 1,
-0.730944, 0.4728361, 0.3010708, 1, 1, 1, 1, 1,
-0.7286726, -1.856784, -3.093154, 1, 1, 1, 1, 1,
-0.7235109, 0.9944853, -1.455787, 1, 1, 1, 1, 1,
-0.716935, 1.044246, -0.4628878, 0, 0, 1, 1, 1,
-0.7128478, -0.9917846, -2.186555, 1, 0, 0, 1, 1,
-0.712288, 0.5765522, -0.07932527, 1, 0, 0, 1, 1,
-0.7089236, -0.408997, -3.057921, 1, 0, 0, 1, 1,
-0.7043613, -1.038521, -3.112451, 1, 0, 0, 1, 1,
-0.6988409, -0.8742512, -2.25679, 1, 0, 0, 1, 1,
-0.697807, 0.1060098, -1.049255, 0, 0, 0, 1, 1,
-0.6899696, -1.501555, -2.303925, 0, 0, 0, 1, 1,
-0.6881368, -0.2752624, -1.402858, 0, 0, 0, 1, 1,
-0.6857306, 1.446349, 0.01113809, 0, 0, 0, 1, 1,
-0.6817244, -2.305946, -2.358238, 0, 0, 0, 1, 1,
-0.6789398, -0.2784111, -2.578405, 0, 0, 0, 1, 1,
-0.6766773, 0.1433024, -2.84362, 0, 0, 0, 1, 1,
-0.673954, 0.331395, -0.7481807, 1, 1, 1, 1, 1,
-0.6727011, 0.69361, -1.646634, 1, 1, 1, 1, 1,
-0.6722771, 0.5785627, 0.1519254, 1, 1, 1, 1, 1,
-0.6688781, 1.204553, -2.145134, 1, 1, 1, 1, 1,
-0.6674839, -1.41594, -0.4529168, 1, 1, 1, 1, 1,
-0.6654199, 0.2701914, -2.206532, 1, 1, 1, 1, 1,
-0.6648123, 0.1518093, -2.23349, 1, 1, 1, 1, 1,
-0.6600682, 1.991644, -0.3348242, 1, 1, 1, 1, 1,
-0.6561677, 0.1325233, -1.234282, 1, 1, 1, 1, 1,
-0.6482908, 0.5492321, -0.9350916, 1, 1, 1, 1, 1,
-0.6462792, 1.060142, 0.06252918, 1, 1, 1, 1, 1,
-0.6460963, -1.369536, -2.214744, 1, 1, 1, 1, 1,
-0.6455269, -2.743854, -3.062435, 1, 1, 1, 1, 1,
-0.6450511, 0.4573787, -0.5404358, 1, 1, 1, 1, 1,
-0.6438082, -0.5825892, -3.111654, 1, 1, 1, 1, 1,
-0.6425816, 0.6844122, -0.7373742, 0, 0, 1, 1, 1,
-0.6420949, -0.8028196, -0.9012449, 1, 0, 0, 1, 1,
-0.6417918, -1.233652, -3.159126, 1, 0, 0, 1, 1,
-0.6410639, -1.674274, -2.293016, 1, 0, 0, 1, 1,
-0.6359674, -1.586003, -1.106828, 1, 0, 0, 1, 1,
-0.635259, -0.01950865, -2.634692, 1, 0, 0, 1, 1,
-0.6294304, 0.8504771, -1.276645, 0, 0, 0, 1, 1,
-0.62284, -0.4158845, -1.353038, 0, 0, 0, 1, 1,
-0.611456, -0.2698995, -3.134451, 0, 0, 0, 1, 1,
-0.6103678, 0.6838871, -0.5926337, 0, 0, 0, 1, 1,
-0.6064092, 0.4234957, -0.008273499, 0, 0, 0, 1, 1,
-0.6060224, 1.344613, -0.1667584, 0, 0, 0, 1, 1,
-0.602705, 0.3166386, -1.597725, 0, 0, 0, 1, 1,
-0.6025874, 0.2627592, -0.5823264, 1, 1, 1, 1, 1,
-0.6005244, -0.1226225, -2.221456, 1, 1, 1, 1, 1,
-0.5938056, 1.18623, -0.139076, 1, 1, 1, 1, 1,
-0.5934219, 1.206295, 0.2814635, 1, 1, 1, 1, 1,
-0.5931057, 0.827945, -0.8837481, 1, 1, 1, 1, 1,
-0.5920013, 2.038385, -0.3899281, 1, 1, 1, 1, 1,
-0.5881812, 0.5404851, -1.713736, 1, 1, 1, 1, 1,
-0.5876258, 1.044719, -0.9223661, 1, 1, 1, 1, 1,
-0.5831431, -0.09758079, -1.624993, 1, 1, 1, 1, 1,
-0.583061, -0.3799209, -1.685994, 1, 1, 1, 1, 1,
-0.5797684, 0.2386486, -2.484479, 1, 1, 1, 1, 1,
-0.5788193, -0.3108137, -1.292422, 1, 1, 1, 1, 1,
-0.577739, 0.0482463, -1.765654, 1, 1, 1, 1, 1,
-0.5738515, 1.980412, -0.7080336, 1, 1, 1, 1, 1,
-0.5667649, 2.344679, -1.234496, 1, 1, 1, 1, 1,
-0.5656075, 0.02850344, -0.01770147, 0, 0, 1, 1, 1,
-0.5617707, 0.1205394, -0.9516916, 1, 0, 0, 1, 1,
-0.5606745, 0.8446078, 0.3793894, 1, 0, 0, 1, 1,
-0.560571, -0.701901, -3.490956, 1, 0, 0, 1, 1,
-0.5581751, 0.7124046, 0.1433064, 1, 0, 0, 1, 1,
-0.5529405, -0.8184102, -3.520086, 1, 0, 0, 1, 1,
-0.5487025, -0.2592342, -1.137188, 0, 0, 0, 1, 1,
-0.5439259, 0.5021355, -1.906261, 0, 0, 0, 1, 1,
-0.5412582, 0.5584765, -0.3564993, 0, 0, 0, 1, 1,
-0.5399733, 0.6322894, 0.1355681, 0, 0, 0, 1, 1,
-0.538451, 1.341881, 0.2258539, 0, 0, 0, 1, 1,
-0.5323911, 0.2395282, 0.09798811, 0, 0, 0, 1, 1,
-0.5300671, 0.7448803, -0.07489143, 0, 0, 0, 1, 1,
-0.5299723, 1.008745, 0.7778794, 1, 1, 1, 1, 1,
-0.5264554, 0.3000889, -1.048996, 1, 1, 1, 1, 1,
-0.5247968, 0.9208716, -1.124992, 1, 1, 1, 1, 1,
-0.5222207, -1.143702, -3.971639, 1, 1, 1, 1, 1,
-0.520362, 0.3827095, -0.7973428, 1, 1, 1, 1, 1,
-0.5170357, -0.4006071, -1.774231, 1, 1, 1, 1, 1,
-0.5117474, 0.6904727, -0.9996074, 1, 1, 1, 1, 1,
-0.5117404, -0.3631268, -2.613093, 1, 1, 1, 1, 1,
-0.5079701, 0.9972612, -0.3149805, 1, 1, 1, 1, 1,
-0.5064195, -0.008576449, -0.8053267, 1, 1, 1, 1, 1,
-0.5045925, -0.4418506, -2.849574, 1, 1, 1, 1, 1,
-0.5042284, 1.579297, 0.6094908, 1, 1, 1, 1, 1,
-0.5027028, 0.2772217, -1.117268, 1, 1, 1, 1, 1,
-0.5006282, -0.9660234, -2.105999, 1, 1, 1, 1, 1,
-0.4985251, 1.375539, -0.7237801, 1, 1, 1, 1, 1,
-0.4880644, 0.4562872, -1.290187, 0, 0, 1, 1, 1,
-0.4868244, -1.717805, -3.55377, 1, 0, 0, 1, 1,
-0.4835682, -0.9438205, -3.195763, 1, 0, 0, 1, 1,
-0.4794471, 0.5433957, -1.020007, 1, 0, 0, 1, 1,
-0.472145, 0.09753384, -2.442055, 1, 0, 0, 1, 1,
-0.4708042, -1.302515, -2.934253, 1, 0, 0, 1, 1,
-0.4622394, -1.306269, -4.074715, 0, 0, 0, 1, 1,
-0.458014, -0.6241871, -2.853426, 0, 0, 0, 1, 1,
-0.4546006, -0.2765118, -2.527148, 0, 0, 0, 1, 1,
-0.4501247, 0.7783808, -0.1195509, 0, 0, 0, 1, 1,
-0.4475729, 1.11625, -0.31855, 0, 0, 0, 1, 1,
-0.4457801, -0.7989801, -1.864094, 0, 0, 0, 1, 1,
-0.44511, 0.1269796, -2.39838, 0, 0, 0, 1, 1,
-0.4426322, 0.3665975, 0.06081356, 1, 1, 1, 1, 1,
-0.439762, 0.6017352, 0.0788334, 1, 1, 1, 1, 1,
-0.4394828, -0.2025911, -1.942131, 1, 1, 1, 1, 1,
-0.4384492, 1.751207, -0.5910078, 1, 1, 1, 1, 1,
-0.4353386, 1.599254, -1.37078, 1, 1, 1, 1, 1,
-0.4330783, 0.5836574, -0.7098885, 1, 1, 1, 1, 1,
-0.4319347, -0.3436679, -1.719136, 1, 1, 1, 1, 1,
-0.4290842, 1.06053, -0.3900789, 1, 1, 1, 1, 1,
-0.4279194, -2.226168, -2.026697, 1, 1, 1, 1, 1,
-0.4218549, -0.3796429, -0.6422687, 1, 1, 1, 1, 1,
-0.4156247, -0.09913733, -1.425098, 1, 1, 1, 1, 1,
-0.4111293, -0.595941, -2.978261, 1, 1, 1, 1, 1,
-0.403885, -0.2352141, -0.5766954, 1, 1, 1, 1, 1,
-0.4022957, -0.3253267, -3.332974, 1, 1, 1, 1, 1,
-0.4018828, 0.5204617, 0.6786666, 1, 1, 1, 1, 1,
-0.3993122, 1.303107, -0.5202937, 0, 0, 1, 1, 1,
-0.3963616, 0.5589491, -1.614911, 1, 0, 0, 1, 1,
-0.3884477, -0.04388352, -1.521349, 1, 0, 0, 1, 1,
-0.3883905, 0.4898922, -2.768821, 1, 0, 0, 1, 1,
-0.3833922, -0.5195224, -2.860774, 1, 0, 0, 1, 1,
-0.3832174, -0.28579, -2.78236, 1, 0, 0, 1, 1,
-0.3780586, 0.3371887, -1.33375, 0, 0, 0, 1, 1,
-0.3744511, 1.306586, -1.626423, 0, 0, 0, 1, 1,
-0.3738244, -1.417277, -1.774505, 0, 0, 0, 1, 1,
-0.3738111, -0.03044563, -0.1591902, 0, 0, 0, 1, 1,
-0.3736025, -0.4531946, -2.553076, 0, 0, 0, 1, 1,
-0.3711787, -1.008764, -3.5508, 0, 0, 0, 1, 1,
-0.3676845, -0.2867013, -1.140925, 0, 0, 0, 1, 1,
-0.3664057, -0.1986286, -1.726102, 1, 1, 1, 1, 1,
-0.361189, 0.1162242, -1.12823, 1, 1, 1, 1, 1,
-0.3554911, 1.646982, -0.627313, 1, 1, 1, 1, 1,
-0.346381, -2.030185, -1.91981, 1, 1, 1, 1, 1,
-0.3456079, 1.689106, 0.6614909, 1, 1, 1, 1, 1,
-0.3413722, 1.408038, 0.08955499, 1, 1, 1, 1, 1,
-0.3366073, 1.218528, -1.700378, 1, 1, 1, 1, 1,
-0.3363, -0.593675, -3.665507, 1, 1, 1, 1, 1,
-0.3344743, 1.016195, -0.7083215, 1, 1, 1, 1, 1,
-0.3326991, 1.340262, -0.7557572, 1, 1, 1, 1, 1,
-0.3324479, 0.3855396, 0.4479898, 1, 1, 1, 1, 1,
-0.3309222, -0.07031441, -1.832555, 1, 1, 1, 1, 1,
-0.3299163, 0.2817719, -0.5790392, 1, 1, 1, 1, 1,
-0.3285364, -0.05805081, -1.998466, 1, 1, 1, 1, 1,
-0.3272461, 0.5114009, -1.032683, 1, 1, 1, 1, 1,
-0.3265823, -0.3066201, -1.652455, 0, 0, 1, 1, 1,
-0.316146, 0.3663913, 0.3660133, 1, 0, 0, 1, 1,
-0.3148725, 0.4084091, -1.162935, 1, 0, 0, 1, 1,
-0.3147768, 0.3152865, -1.697184, 1, 0, 0, 1, 1,
-0.3126737, 0.2048393, -0.6960098, 1, 0, 0, 1, 1,
-0.3098961, -0.5012174, -1.919842, 1, 0, 0, 1, 1,
-0.3098276, 0.5790147, 0.6781154, 0, 0, 0, 1, 1,
-0.3092217, -0.3849957, -3.356736, 0, 0, 0, 1, 1,
-0.3071369, 1.940781, 1.007206, 0, 0, 0, 1, 1,
-0.2996031, 1.789865, 0.2648732, 0, 0, 0, 1, 1,
-0.2880693, -0.5279758, -2.100705, 0, 0, 0, 1, 1,
-0.2861536, 0.7358368, 0.8362626, 0, 0, 0, 1, 1,
-0.2840302, -0.892206, -3.726391, 0, 0, 0, 1, 1,
-0.2830971, 1.029613, -1.889721, 1, 1, 1, 1, 1,
-0.2823785, 0.1153115, -2.993375, 1, 1, 1, 1, 1,
-0.2774, -0.2049508, -2.01334, 1, 1, 1, 1, 1,
-0.272357, 0.5185345, -0.9663199, 1, 1, 1, 1, 1,
-0.2636032, 0.9122098, -0.7305263, 1, 1, 1, 1, 1,
-0.2561223, 1.679959, -0.2084903, 1, 1, 1, 1, 1,
-0.2539846, -1.963982, -2.03002, 1, 1, 1, 1, 1,
-0.2538704, -1.078122, -3.138958, 1, 1, 1, 1, 1,
-0.2510848, -2.006796, -2.435832, 1, 1, 1, 1, 1,
-0.2496665, 0.4630137, -1.198883, 1, 1, 1, 1, 1,
-0.2462634, -1.225832, -3.112339, 1, 1, 1, 1, 1,
-0.245327, -0.4246977, -3.211004, 1, 1, 1, 1, 1,
-0.2413817, 1.042912, -1.470982, 1, 1, 1, 1, 1,
-0.2408243, 0.3179058, 0.6054087, 1, 1, 1, 1, 1,
-0.2320368, 1.00978, -0.4082252, 1, 1, 1, 1, 1,
-0.2278563, 0.6306523, -0.6346073, 0, 0, 1, 1, 1,
-0.2275156, -0.5251308, 0.2220698, 1, 0, 0, 1, 1,
-0.2269999, 0.183859, -1.490302, 1, 0, 0, 1, 1,
-0.224849, 2.525741, -1.747424, 1, 0, 0, 1, 1,
-0.2244766, -0.7765165, -4.72431, 1, 0, 0, 1, 1,
-0.2200891, 0.09866713, -0.3165508, 1, 0, 0, 1, 1,
-0.2198476, 0.4240769, -0.65672, 0, 0, 0, 1, 1,
-0.2191242, -0.06837299, -0.1123134, 0, 0, 0, 1, 1,
-0.2164852, -0.4376439, -2.967367, 0, 0, 0, 1, 1,
-0.2120607, 0.7705497, -0.5519506, 0, 0, 0, 1, 1,
-0.2082759, 0.2644593, -2.229476, 0, 0, 0, 1, 1,
-0.2079292, 0.3044792, -2.764985, 0, 0, 0, 1, 1,
-0.2036337, 0.3006192, 0.6995552, 0, 0, 0, 1, 1,
-0.2029579, -0.875244, -3.629941, 1, 1, 1, 1, 1,
-0.1954991, -1.287647, -1.704237, 1, 1, 1, 1, 1,
-0.1939779, -1.218429, -3.067274, 1, 1, 1, 1, 1,
-0.190019, -0.9824175, -1.241924, 1, 1, 1, 1, 1,
-0.1830701, -0.2444623, -1.726426, 1, 1, 1, 1, 1,
-0.1815019, 0.3514695, -0.5799074, 1, 1, 1, 1, 1,
-0.177595, 0.2024471, -1.249712, 1, 1, 1, 1, 1,
-0.17366, -0.0530557, -4.30199, 1, 1, 1, 1, 1,
-0.1726843, -0.6513126, -2.336037, 1, 1, 1, 1, 1,
-0.1705422, 0.6961178, -1.116742, 1, 1, 1, 1, 1,
-0.1702283, -1.261749, -4.531457, 1, 1, 1, 1, 1,
-0.1688177, -0.1449926, -1.239571, 1, 1, 1, 1, 1,
-0.1684368, -0.1167284, -1.252997, 1, 1, 1, 1, 1,
-0.1679944, -0.8820814, -1.939697, 1, 1, 1, 1, 1,
-0.1641067, 1.414572, -0.456043, 1, 1, 1, 1, 1,
-0.1610413, 0.02629574, -1.536497, 0, 0, 1, 1, 1,
-0.1603083, 0.2281236, 0.6340062, 1, 0, 0, 1, 1,
-0.1582431, -0.6678923, -4.841927, 1, 0, 0, 1, 1,
-0.1461898, 1.409608, 0.1068038, 1, 0, 0, 1, 1,
-0.1367379, -0.3298419, -2.929964, 1, 0, 0, 1, 1,
-0.1362011, 1.139485, -0.3537255, 1, 0, 0, 1, 1,
-0.1342063, -0.1666055, -3.458981, 0, 0, 0, 1, 1,
-0.1339631, 0.1388763, 0.3355013, 0, 0, 0, 1, 1,
-0.132845, -0.8364406, -3.929214, 0, 0, 0, 1, 1,
-0.1274289, 0.1760164, 0.9577931, 0, 0, 0, 1, 1,
-0.1243095, 0.5845759, 0.6618609, 0, 0, 0, 1, 1,
-0.1218929, -1.012737, -2.502094, 0, 0, 0, 1, 1,
-0.1197601, 2.166641, -0.1491235, 0, 0, 0, 1, 1,
-0.1171531, -0.48709, -1.019537, 1, 1, 1, 1, 1,
-0.1160699, 0.1837507, -0.9782078, 1, 1, 1, 1, 1,
-0.1160219, 0.815925, 0.8590458, 1, 1, 1, 1, 1,
-0.1158807, 0.06967533, -1.670552, 1, 1, 1, 1, 1,
-0.1148731, -0.2778201, -2.007208, 1, 1, 1, 1, 1,
-0.1115054, -1.182016, -3.227413, 1, 1, 1, 1, 1,
-0.1114958, 0.9685152, -0.5155392, 1, 1, 1, 1, 1,
-0.1102916, -0.2339282, -2.689405, 1, 1, 1, 1, 1,
-0.09498992, -0.664703, -3.161449, 1, 1, 1, 1, 1,
-0.09272698, -0.7376474, -4.988616, 1, 1, 1, 1, 1,
-0.08763626, 1.277703, 2.176629, 1, 1, 1, 1, 1,
-0.08401187, 0.6313913, 2.069065, 1, 1, 1, 1, 1,
-0.0826854, 0.9747216, 1.083754, 1, 1, 1, 1, 1,
-0.08049703, 0.08890209, -0.03810694, 1, 1, 1, 1, 1,
-0.07296883, 1.135331, -0.9105687, 1, 1, 1, 1, 1,
-0.07157703, -0.1484184, -0.7302386, 0, 0, 1, 1, 1,
-0.0668792, -2.080685, -1.382822, 1, 0, 0, 1, 1,
-0.0642055, -0.7348717, -2.24194, 1, 0, 0, 1, 1,
-0.06224409, -0.2769254, -3.105179, 1, 0, 0, 1, 1,
-0.06126837, -1.131893, -2.954592, 1, 0, 0, 1, 1,
-0.05658305, 1.774985, -0.1490059, 1, 0, 0, 1, 1,
-0.05039465, -2.460279, -5.079193, 0, 0, 0, 1, 1,
-0.04928775, -1.23621, -2.523904, 0, 0, 0, 1, 1,
-0.04134619, 0.5928848, 0.1369513, 0, 0, 0, 1, 1,
-0.03998951, 1.599547, -4.034377, 0, 0, 0, 1, 1,
-0.03180525, -0.03292907, -2.855315, 0, 0, 0, 1, 1,
-0.02871716, 0.005952076, -0.3285811, 0, 0, 0, 1, 1,
-0.01909155, 0.3733337, -0.2475324, 0, 0, 0, 1, 1,
-0.01619541, 0.6731844, 1.360448, 1, 1, 1, 1, 1,
-0.009844126, -1.719955, -4.043084, 1, 1, 1, 1, 1,
-0.004465459, -0.4297823, -1.494384, 1, 1, 1, 1, 1,
-0.003957176, -0.2228625, -2.946044, 1, 1, 1, 1, 1,
-0.003503493, 2.177105, -0.2639633, 1, 1, 1, 1, 1,
-0.001202377, -1.428337, -3.196272, 1, 1, 1, 1, 1,
-0.0008846346, -2.100336, -1.731788, 1, 1, 1, 1, 1,
0.000809407, 0.5655995, 0.6701577, 1, 1, 1, 1, 1,
0.000812251, -1.600635, 3.512193, 1, 1, 1, 1, 1,
0.005196006, 0.4663167, -0.7717875, 1, 1, 1, 1, 1,
0.007784666, 1.270052, -0.8898265, 1, 1, 1, 1, 1,
0.008157673, 0.6316455, 0.5390823, 1, 1, 1, 1, 1,
0.009245447, 0.8914348, -0.6359975, 1, 1, 1, 1, 1,
0.01040423, -0.6075155, 3.746434, 1, 1, 1, 1, 1,
0.01229677, -0.3457679, 1.234789, 1, 1, 1, 1, 1,
0.01816922, -0.1331191, 3.588476, 0, 0, 1, 1, 1,
0.01961767, -0.08206565, 2.758633, 1, 0, 0, 1, 1,
0.01973436, 0.01706548, 2.742223, 1, 0, 0, 1, 1,
0.02086517, -0.5723556, 1.296471, 1, 0, 0, 1, 1,
0.02402176, 1.489267, 0.9394664, 1, 0, 0, 1, 1,
0.02603474, -0.4501728, 2.432057, 1, 0, 0, 1, 1,
0.02668903, -2.250477, 2.872411, 0, 0, 0, 1, 1,
0.02818461, 1.129944, -0.6488727, 0, 0, 0, 1, 1,
0.02934157, 0.7165756, 1.574328, 0, 0, 0, 1, 1,
0.03210173, -0.05982026, 3.138609, 0, 0, 0, 1, 1,
0.0343854, 0.6122987, 1.381982, 0, 0, 0, 1, 1,
0.03500245, -0.5736727, 2.610291, 0, 0, 0, 1, 1,
0.03932075, 0.7093055, -0.6426063, 0, 0, 0, 1, 1,
0.04072811, 1.317886, 0.1900863, 1, 1, 1, 1, 1,
0.04344961, -0.4751473, 2.057448, 1, 1, 1, 1, 1,
0.04522248, -0.4932438, 0.9902194, 1, 1, 1, 1, 1,
0.04615717, -0.3440796, 1.327757, 1, 1, 1, 1, 1,
0.04822442, 0.3929286, 1.205246, 1, 1, 1, 1, 1,
0.05246309, 0.4313086, 1.514283, 1, 1, 1, 1, 1,
0.05286279, -0.5343334, 3.83868, 1, 1, 1, 1, 1,
0.05330536, -0.5117849, 3.310128, 1, 1, 1, 1, 1,
0.05703234, -0.1671123, 3.427131, 1, 1, 1, 1, 1,
0.05940378, -1.038426, 1.514877, 1, 1, 1, 1, 1,
0.06068121, -0.6316239, 5.160266, 1, 1, 1, 1, 1,
0.06070586, -0.3240634, 2.246297, 1, 1, 1, 1, 1,
0.06081179, 0.2705539, 0.410333, 1, 1, 1, 1, 1,
0.06200695, 0.2806407, 0.2985698, 1, 1, 1, 1, 1,
0.06274027, -1.776408, 2.352468, 1, 1, 1, 1, 1,
0.06663029, -2.470967, 3.247829, 0, 0, 1, 1, 1,
0.06879647, -0.4748847, 3.103046, 1, 0, 0, 1, 1,
0.0710928, -0.03903341, -0.1400879, 1, 0, 0, 1, 1,
0.0744518, 1.081789, -2.549028, 1, 0, 0, 1, 1,
0.07477946, 0.06584129, 2.566376, 1, 0, 0, 1, 1,
0.07520703, 2.031638, 1.059165, 1, 0, 0, 1, 1,
0.07522488, 0.3203428, 1.476762, 0, 0, 0, 1, 1,
0.0770403, -0.2041389, 4.481192, 0, 0, 0, 1, 1,
0.07932628, 0.9175889, 0.4065346, 0, 0, 0, 1, 1,
0.08253611, -1.049788, 3.018544, 0, 0, 0, 1, 1,
0.08259317, -0.2781933, 3.046029, 0, 0, 0, 1, 1,
0.0826425, 1.052879, -0.399467, 0, 0, 0, 1, 1,
0.08443112, 0.6352168, 1.925884, 0, 0, 0, 1, 1,
0.08531216, -0.4594798, 3.646984, 1, 1, 1, 1, 1,
0.08901333, 1.234688, -0.1986583, 1, 1, 1, 1, 1,
0.08978317, 0.05117298, 0.3662933, 1, 1, 1, 1, 1,
0.09449875, 0.8306157, 0.004403054, 1, 1, 1, 1, 1,
0.1019848, 1.249236, 0.3983065, 1, 1, 1, 1, 1,
0.1048029, -1.053606, 4.228339, 1, 1, 1, 1, 1,
0.1064029, -0.3152935, 2.219564, 1, 1, 1, 1, 1,
0.1119167, -0.6340784, 4.268724, 1, 1, 1, 1, 1,
0.1162258, 0.6305849, -0.07127657, 1, 1, 1, 1, 1,
0.1169012, 1.070186, 0.6528744, 1, 1, 1, 1, 1,
0.118278, 1.183544, -0.1167574, 1, 1, 1, 1, 1,
0.1188003, -1.507985, 4.749657, 1, 1, 1, 1, 1,
0.12134, -0.675985, 3.997242, 1, 1, 1, 1, 1,
0.1243916, -0.3724735, 0.9824461, 1, 1, 1, 1, 1,
0.1250921, -0.1545264, 2.882849, 1, 1, 1, 1, 1,
0.1288664, -0.4743853, 3.688837, 0, 0, 1, 1, 1,
0.1288879, 0.6119006, -0.310936, 1, 0, 0, 1, 1,
0.1319794, 0.3413191, 0.5834425, 1, 0, 0, 1, 1,
0.1349471, 0.8773562, 0.7809348, 1, 0, 0, 1, 1,
0.1383042, -0.5853341, 1.521084, 1, 0, 0, 1, 1,
0.1383523, -1.187914, 2.040724, 1, 0, 0, 1, 1,
0.1439801, 1.155007, -1.346175, 0, 0, 0, 1, 1,
0.1456643, 1.922822, -0.3735379, 0, 0, 0, 1, 1,
0.1465904, 0.2063169, 0.01365506, 0, 0, 0, 1, 1,
0.1596377, -0.7383941, 3.369393, 0, 0, 0, 1, 1,
0.1630103, -0.8463383, 4.198206, 0, 0, 0, 1, 1,
0.1683503, 0.9177048, -1.390861, 0, 0, 0, 1, 1,
0.1709642, 0.06571183, 1.560569, 0, 0, 0, 1, 1,
0.1716967, 0.08637521, 1.978147, 1, 1, 1, 1, 1,
0.1794851, -0.6251096, 1.07146, 1, 1, 1, 1, 1,
0.1821388, 1.008523, 1.910687, 1, 1, 1, 1, 1,
0.1833142, 1.109252, -1.491896, 1, 1, 1, 1, 1,
0.1835453, 0.9655561, -0.09749173, 1, 1, 1, 1, 1,
0.1910386, 1.356981, -1.856356, 1, 1, 1, 1, 1,
0.1966273, -0.8217365, 4.507261, 1, 1, 1, 1, 1,
0.1990931, 0.4011999, -1.88662, 1, 1, 1, 1, 1,
0.2030376, -0.3083051, 1.702638, 1, 1, 1, 1, 1,
0.2050396, 0.1580346, 0.4507996, 1, 1, 1, 1, 1,
0.2052127, -0.8697332, 2.430859, 1, 1, 1, 1, 1,
0.2086825, 0.6346942, 1.76474, 1, 1, 1, 1, 1,
0.2090555, -0.03723362, 1.578547, 1, 1, 1, 1, 1,
0.2106024, 0.5058614, 0.9317811, 1, 1, 1, 1, 1,
0.2143972, 0.1145922, 0.1661077, 1, 1, 1, 1, 1,
0.2204395, -0.8443553, 2.942087, 0, 0, 1, 1, 1,
0.2261437, -0.3459129, 3.539134, 1, 0, 0, 1, 1,
0.2263507, 0.5271521, -0.6602634, 1, 0, 0, 1, 1,
0.228362, -0.471474, 1.81433, 1, 0, 0, 1, 1,
0.2321817, 0.9841186, 0.5217314, 1, 0, 0, 1, 1,
0.232803, -1.156065, 3.773329, 1, 0, 0, 1, 1,
0.2355559, -0.08528361, 3.809346, 0, 0, 0, 1, 1,
0.2465024, -0.6758264, 3.806269, 0, 0, 0, 1, 1,
0.2485258, 1.384816, -1.251816, 0, 0, 0, 1, 1,
0.249576, -0.1619072, 3.00865, 0, 0, 0, 1, 1,
0.2531829, 0.1694505, 2.781163, 0, 0, 0, 1, 1,
0.2544947, 1.462549, 0.4259997, 0, 0, 0, 1, 1,
0.2555679, -0.8724712, 3.133276, 0, 0, 0, 1, 1,
0.2561676, 2.033669, -0.986234, 1, 1, 1, 1, 1,
0.258382, 1.498425, 1.392256, 1, 1, 1, 1, 1,
0.2603205, 1.152149, -0.6284546, 1, 1, 1, 1, 1,
0.2617779, 1.549197, 0.06301718, 1, 1, 1, 1, 1,
0.269901, -0.6895242, 2.517977, 1, 1, 1, 1, 1,
0.2730453, -0.446777, 1.569899, 1, 1, 1, 1, 1,
0.2800696, 0.6746789, 0.1318397, 1, 1, 1, 1, 1,
0.2808767, -1.15309, 0.4981452, 1, 1, 1, 1, 1,
0.2820108, 0.1931223, 0.4940332, 1, 1, 1, 1, 1,
0.2858543, -0.006555184, 2.385144, 1, 1, 1, 1, 1,
0.2865251, -0.7047181, -0.05557618, 1, 1, 1, 1, 1,
0.2893687, 1.643634, 0.9552645, 1, 1, 1, 1, 1,
0.2899051, -2.571615, 3.082256, 1, 1, 1, 1, 1,
0.2902341, -0.202752, 0.7556219, 1, 1, 1, 1, 1,
0.2909062, -0.7697157, 2.584344, 1, 1, 1, 1, 1,
0.2944706, -1.592351, 4.345896, 0, 0, 1, 1, 1,
0.2967592, 0.2494737, 1.253564, 1, 0, 0, 1, 1,
0.2978998, 0.7860929, 1.513078, 1, 0, 0, 1, 1,
0.2980354, -0.343457, 1.7167, 1, 0, 0, 1, 1,
0.3001352, 0.9433285, 0.8272765, 1, 0, 0, 1, 1,
0.3004656, -0.377922, 3.302788, 1, 0, 0, 1, 1,
0.3026108, 0.2234551, 1.810724, 0, 0, 0, 1, 1,
0.3079111, 0.5944713, 0.8319488, 0, 0, 0, 1, 1,
0.3102936, -0.4760825, 2.667672, 0, 0, 0, 1, 1,
0.3114749, 0.272586, 0.5042621, 0, 0, 0, 1, 1,
0.316508, -0.3169872, 1.471313, 0, 0, 0, 1, 1,
0.3191584, 0.2732607, 1.307327, 0, 0, 0, 1, 1,
0.3195076, -0.7889171, 2.973706, 0, 0, 0, 1, 1,
0.3218106, 0.5620402, 1.372037, 1, 1, 1, 1, 1,
0.3231336, 1.743831, 1.149968, 1, 1, 1, 1, 1,
0.3239025, 0.4583057, 1.699176, 1, 1, 1, 1, 1,
0.3250181, 0.6270865, 0.8767683, 1, 1, 1, 1, 1,
0.3273708, -0.2793954, 4.186176, 1, 1, 1, 1, 1,
0.33106, 0.7839598, 1.624349, 1, 1, 1, 1, 1,
0.3321985, -0.4253806, 0.7144556, 1, 1, 1, 1, 1,
0.3334542, -0.7963844, 3.864307, 1, 1, 1, 1, 1,
0.3345606, 0.2991533, 0.3691586, 1, 1, 1, 1, 1,
0.3396818, 0.1749617, 1.905349, 1, 1, 1, 1, 1,
0.3432914, 0.6808016, 0.8124424, 1, 1, 1, 1, 1,
0.3446355, 1.971385, -0.3950066, 1, 1, 1, 1, 1,
0.3462684, 0.7748011, 0.3096109, 1, 1, 1, 1, 1,
0.3467584, 2.111362, -1.032471, 1, 1, 1, 1, 1,
0.3497514, 1.487573, 2.051289, 1, 1, 1, 1, 1,
0.3515183, -1.346835, 2.497412, 0, 0, 1, 1, 1,
0.3530063, -0.3396761, 2.280244, 1, 0, 0, 1, 1,
0.3536062, -0.7937821, 3.452349, 1, 0, 0, 1, 1,
0.3561454, 0.8426235, 2.691209, 1, 0, 0, 1, 1,
0.3578486, 1.308735, 1.927162, 1, 0, 0, 1, 1,
0.3598331, 0.1360876, -0.08242602, 1, 0, 0, 1, 1,
0.3621784, -0.6832214, 3.833931, 0, 0, 0, 1, 1,
0.3650074, 0.0125244, 1.676327, 0, 0, 0, 1, 1,
0.3668254, -1.598643, 3.358803, 0, 0, 0, 1, 1,
0.3670173, 0.1009038, 0.02441962, 0, 0, 0, 1, 1,
0.36755, -0.7274235, 3.765396, 0, 0, 0, 1, 1,
0.3738141, -1.13973, 2.111137, 0, 0, 0, 1, 1,
0.3742694, -0.9390665, 3.098471, 0, 0, 0, 1, 1,
0.3746399, 0.1686389, -1.481278, 1, 1, 1, 1, 1,
0.3796989, -0.4836573, 2.235199, 1, 1, 1, 1, 1,
0.3810323, 0.04804075, 2.016366, 1, 1, 1, 1, 1,
0.3812312, 0.8541039, -0.1413923, 1, 1, 1, 1, 1,
0.3906302, 0.9344877, 0.1872736, 1, 1, 1, 1, 1,
0.4052969, -1.354515, 1.769156, 1, 1, 1, 1, 1,
0.4075913, -1.24434, 3.430236, 1, 1, 1, 1, 1,
0.4122176, -0.627888, 2.307414, 1, 1, 1, 1, 1,
0.4122709, 1.361996, 0.3797524, 1, 1, 1, 1, 1,
0.4133523, -2.327742, 3.626601, 1, 1, 1, 1, 1,
0.4159714, 0.8073701, 0.6394873, 1, 1, 1, 1, 1,
0.4162009, 1.381442, -0.4749479, 1, 1, 1, 1, 1,
0.4184957, 0.7551083, -1.023481, 1, 1, 1, 1, 1,
0.4239005, -0.3027148, 3.839504, 1, 1, 1, 1, 1,
0.4253337, -0.8624415, 2.914652, 1, 1, 1, 1, 1,
0.4292307, -0.8324775, 2.195937, 0, 0, 1, 1, 1,
0.4304676, 1.061484, -0.3842324, 1, 0, 0, 1, 1,
0.4330388, -0.7516441, 0.8912644, 1, 0, 0, 1, 1,
0.434164, -1.465393, 2.978073, 1, 0, 0, 1, 1,
0.4372162, 1.196215, -0.07973057, 1, 0, 0, 1, 1,
0.4410832, 0.6391643, -1.53043, 1, 0, 0, 1, 1,
0.4425289, 0.8879513, 0.1529648, 0, 0, 0, 1, 1,
0.4473056, 0.4753261, 0.1029707, 0, 0, 0, 1, 1,
0.4497811, 1.0362, 1.016304, 0, 0, 0, 1, 1,
0.4500796, -1.06263, 2.219613, 0, 0, 0, 1, 1,
0.4530542, -0.6267968, 4.970327, 0, 0, 0, 1, 1,
0.4567131, 0.03796801, 1.402749, 0, 0, 0, 1, 1,
0.4581484, -0.04607447, 1.723112, 0, 0, 0, 1, 1,
0.4610763, 0.9649691, -0.01377057, 1, 1, 1, 1, 1,
0.463766, 1.033492, -0.07693633, 1, 1, 1, 1, 1,
0.4644436, 1.040448, -0.9195214, 1, 1, 1, 1, 1,
0.4669479, -1.302324, 2.163072, 1, 1, 1, 1, 1,
0.4709529, -2.569507, 5.334643, 1, 1, 1, 1, 1,
0.4722023, -0.1640325, 4.349807, 1, 1, 1, 1, 1,
0.4744565, 0.6631882, 1.201301, 1, 1, 1, 1, 1,
0.4754805, 0.697338, 1.023197, 1, 1, 1, 1, 1,
0.4766006, -0.4964013, 3.769423, 1, 1, 1, 1, 1,
0.4790543, -0.5565057, 1.260588, 1, 1, 1, 1, 1,
0.4842609, -0.5310696, 1.676261, 1, 1, 1, 1, 1,
0.4843699, -0.2119074, 2.287909, 1, 1, 1, 1, 1,
0.4928198, -4.210619, 4.280851, 1, 1, 1, 1, 1,
0.4937364, -0.7794215, 3.282472, 1, 1, 1, 1, 1,
0.4950989, -1.162798, 2.83246, 1, 1, 1, 1, 1,
0.500357, 1.638057, 0.6322265, 0, 0, 1, 1, 1,
0.5027909, -0.2857611, 3.380799, 1, 0, 0, 1, 1,
0.5043138, -1.717996, 1.823273, 1, 0, 0, 1, 1,
0.508232, -0.4967133, 3.673718, 1, 0, 0, 1, 1,
0.5098836, 0.5492882, 1.241912, 1, 0, 0, 1, 1,
0.5198673, 0.7590334, 1.949615, 1, 0, 0, 1, 1,
0.5290024, -0.1668882, 3.951977, 0, 0, 0, 1, 1,
0.5306268, -1.357376, 1.455679, 0, 0, 0, 1, 1,
0.5307686, 0.6454328, 1.570866, 0, 0, 0, 1, 1,
0.5353777, 0.01810589, 3.615885, 0, 0, 0, 1, 1,
0.5460051, -0.9305889, 2.051711, 0, 0, 0, 1, 1,
0.5488756, 1.061958, 1.433784, 0, 0, 0, 1, 1,
0.549148, -0.6648365, 3.103374, 0, 0, 0, 1, 1,
0.5494132, -0.7209837, 4.149311, 1, 1, 1, 1, 1,
0.5500585, 1.292806, -0.4749588, 1, 1, 1, 1, 1,
0.5524897, 1.527044, 1.113834, 1, 1, 1, 1, 1,
0.5583177, -0.2315388, 1.988892, 1, 1, 1, 1, 1,
0.5623264, -0.8007684, 2.447356, 1, 1, 1, 1, 1,
0.5631046, 1.024958, 1.601005, 1, 1, 1, 1, 1,
0.5632656, 1.33275, 0.4325739, 1, 1, 1, 1, 1,
0.5635213, -1.311413, 2.859031, 1, 1, 1, 1, 1,
0.5691019, 0.02651132, 1.635827, 1, 1, 1, 1, 1,
0.5718294, 0.1106266, 0.7362667, 1, 1, 1, 1, 1,
0.5731346, 0.5664057, 0.8007298, 1, 1, 1, 1, 1,
0.5791917, -0.5548286, 3.485323, 1, 1, 1, 1, 1,
0.5844542, -0.5451258, 2.069587, 1, 1, 1, 1, 1,
0.5887086, 0.07636063, 1.72991, 1, 1, 1, 1, 1,
0.59017, -1.338982, 1.300181, 1, 1, 1, 1, 1,
0.5912875, 1.48419, 0.6001939, 0, 0, 1, 1, 1,
0.59217, 0.2844277, 0.5519093, 1, 0, 0, 1, 1,
0.5956163, 0.1460024, 2.581743, 1, 0, 0, 1, 1,
0.6009467, -0.8825101, 2.401628, 1, 0, 0, 1, 1,
0.6037201, 0.4343035, 1.407741, 1, 0, 0, 1, 1,
0.6054626, 2.036079, -0.03511906, 1, 0, 0, 1, 1,
0.6094882, 0.2223947, 0.1167538, 0, 0, 0, 1, 1,
0.6096923, 0.9084054, -0.6814303, 0, 0, 0, 1, 1,
0.6097706, 0.2599678, 1.461418, 0, 0, 0, 1, 1,
0.6159376, 0.4403221, 2.44418, 0, 0, 0, 1, 1,
0.6210963, -1.212079, 3.68933, 0, 0, 0, 1, 1,
0.6225886, 0.492928, -0.1858928, 0, 0, 0, 1, 1,
0.6227621, -0.01176614, 0.08306897, 0, 0, 0, 1, 1,
0.6242211, 0.2651017, 2.193973, 1, 1, 1, 1, 1,
0.6256493, 1.064562, 1.833135, 1, 1, 1, 1, 1,
0.6293896, -0.7355092, 3.364027, 1, 1, 1, 1, 1,
0.6305677, -0.3654956, 3.498401, 1, 1, 1, 1, 1,
0.6309409, -0.04739341, 1.78002, 1, 1, 1, 1, 1,
0.6315033, 2.269194, -1.713327, 1, 1, 1, 1, 1,
0.6326387, 0.6518641, -0.756574, 1, 1, 1, 1, 1,
0.6371689, 0.1146956, 1.167138, 1, 1, 1, 1, 1,
0.6375598, -0.7625924, 3.771205, 1, 1, 1, 1, 1,
0.6469042, 0.5196942, 0.9739313, 1, 1, 1, 1, 1,
0.6482602, 1.105776, 0.1706865, 1, 1, 1, 1, 1,
0.6495826, 0.2123129, 0.5220369, 1, 1, 1, 1, 1,
0.6534762, 1.072543, 1.058021, 1, 1, 1, 1, 1,
0.6535126, -2.068285, 2.532231, 1, 1, 1, 1, 1,
0.6539363, -1.115909, 1.258335, 1, 1, 1, 1, 1,
0.6553894, 1.196066, 0.0002000774, 0, 0, 1, 1, 1,
0.6578221, -0.4343154, 2.357662, 1, 0, 0, 1, 1,
0.6621433, -0.1038986, 2.290628, 1, 0, 0, 1, 1,
0.6633425, -0.6269561, 2.216079, 1, 0, 0, 1, 1,
0.6667785, -1.020728, 1.408221, 1, 0, 0, 1, 1,
0.6682292, 0.08947123, 2.357764, 1, 0, 0, 1, 1,
0.6687987, -1.299814, 2.542319, 0, 0, 0, 1, 1,
0.669543, 0.1659983, 0.2462773, 0, 0, 0, 1, 1,
0.6741808, -1.033731, 0.7620623, 0, 0, 0, 1, 1,
0.6779575, -0.4860058, 2.972436, 0, 0, 0, 1, 1,
0.680886, 0.6658451, -0.8116742, 0, 0, 0, 1, 1,
0.6850958, -0.8570968, 1.318638, 0, 0, 0, 1, 1,
0.6892744, 0.1690211, 0.2637918, 0, 0, 0, 1, 1,
0.691246, -1.613654, 2.43115, 1, 1, 1, 1, 1,
0.6919168, -1.753538, 4.207208, 1, 1, 1, 1, 1,
0.6928129, -0.4845472, 1.610507, 1, 1, 1, 1, 1,
0.6936382, -0.3534116, 2.968081, 1, 1, 1, 1, 1,
0.696498, 2.047601, 0.4368347, 1, 1, 1, 1, 1,
0.7000621, -1.393979, 3.875967, 1, 1, 1, 1, 1,
0.7001675, 1.570106, -0.3161584, 1, 1, 1, 1, 1,
0.7015644, -1.037651, 2.795166, 1, 1, 1, 1, 1,
0.7017174, -0.8778452, 3.112448, 1, 1, 1, 1, 1,
0.7102011, 0.09576966, 1.926475, 1, 1, 1, 1, 1,
0.7175369, 2.169077, 2.23195, 1, 1, 1, 1, 1,
0.7209581, -0.3897063, 2.689197, 1, 1, 1, 1, 1,
0.7234259, 0.2907012, 0.966505, 1, 1, 1, 1, 1,
0.7293179, -0.4545709, 0.7374599, 1, 1, 1, 1, 1,
0.7348747, 0.9193329, 0.1964284, 1, 1, 1, 1, 1,
0.7366735, 0.7983313, 0.8774504, 0, 0, 1, 1, 1,
0.7382089, 0.5804029, 0.1148634, 1, 0, 0, 1, 1,
0.7396188, -1.009351, 3.736587, 1, 0, 0, 1, 1,
0.7405396, -0.3830146, 1.639623, 1, 0, 0, 1, 1,
0.74236, -0.8267765, 2.454326, 1, 0, 0, 1, 1,
0.7445577, -1.004357, 1.349965, 1, 0, 0, 1, 1,
0.7449201, -1.583426, 1.627146, 0, 0, 0, 1, 1,
0.7537714, -0.1352966, 1.79892, 0, 0, 0, 1, 1,
0.7600548, -0.02273013, 1.976367, 0, 0, 0, 1, 1,
0.7602999, 0.5789756, 0.08556914, 0, 0, 0, 1, 1,
0.7716224, -2.585753, 3.24314, 0, 0, 0, 1, 1,
0.778266, -0.7573226, 2.202254, 0, 0, 0, 1, 1,
0.7863293, -0.2590235, -0.3223061, 0, 0, 0, 1, 1,
0.7877756, 1.146867, -0.5441535, 1, 1, 1, 1, 1,
0.7974271, 0.3118262, 2.613023, 1, 1, 1, 1, 1,
0.8011764, -0.02558303, 0.6012324, 1, 1, 1, 1, 1,
0.8024288, -0.2148298, -1.544794, 1, 1, 1, 1, 1,
0.8036445, 1.782052, -0.6429418, 1, 1, 1, 1, 1,
0.8068242, 0.4115943, 1.226285, 1, 1, 1, 1, 1,
0.8093464, -1.202674, 3.219954, 1, 1, 1, 1, 1,
0.8104656, 3.008466, 1.060805, 1, 1, 1, 1, 1,
0.8114381, 1.481683, -1.737304, 1, 1, 1, 1, 1,
0.8150105, -0.9552108, 1.196659, 1, 1, 1, 1, 1,
0.8238583, -2.836406, 3.669151, 1, 1, 1, 1, 1,
0.8290923, 0.2970443, -0.1494147, 1, 1, 1, 1, 1,
0.8391983, -0.027599, 0.5911984, 1, 1, 1, 1, 1,
0.844157, -0.6215439, 0.401297, 1, 1, 1, 1, 1,
0.8485304, 1.665677, 1.870177, 1, 1, 1, 1, 1,
0.8524575, 1.950852, 1.234171, 0, 0, 1, 1, 1,
0.8539461, 0.5585395, 0.8489572, 1, 0, 0, 1, 1,
0.8539596, 0.7732634, 0.8398436, 1, 0, 0, 1, 1,
0.8549681, 0.2128066, 1.567394, 1, 0, 0, 1, 1,
0.8673046, -0.3250524, 0.2734833, 1, 0, 0, 1, 1,
0.87156, 0.02414302, 0.3261609, 1, 0, 0, 1, 1,
0.8731171, -0.3790827, 3.53709, 0, 0, 0, 1, 1,
0.8734907, 0.5653876, 1.365621, 0, 0, 0, 1, 1,
0.8750192, 1.31256, -0.3701157, 0, 0, 0, 1, 1,
0.8859593, -0.5910134, 3.20874, 0, 0, 0, 1, 1,
0.8892066, 1.106365, 0.1065014, 0, 0, 0, 1, 1,
0.8918649, -1.337759, 3.541363, 0, 0, 0, 1, 1,
0.8952652, -1.203634, 0.9514087, 0, 0, 0, 1, 1,
0.9116349, 1.029591, -0.4401769, 1, 1, 1, 1, 1,
0.9190685, 1.851647, 2.719829, 1, 1, 1, 1, 1,
0.924541, -0.3386874, 0.4910142, 1, 1, 1, 1, 1,
0.9423993, 0.9007426, -0.1574474, 1, 1, 1, 1, 1,
0.9430426, -1.179117, 2.996688, 1, 1, 1, 1, 1,
0.9471818, 0.6097103, -0.4753428, 1, 1, 1, 1, 1,
0.9480253, -1.694628, 1.614482, 1, 1, 1, 1, 1,
0.9513977, -0.3979163, 2.205707, 1, 1, 1, 1, 1,
0.9535605, 0.03758767, 0.1309524, 1, 1, 1, 1, 1,
0.9608026, 0.3918028, 0.9357622, 1, 1, 1, 1, 1,
0.9716533, -2.053088, 4.392053, 1, 1, 1, 1, 1,
0.9781641, -1.508059, 3.01923, 1, 1, 1, 1, 1,
0.9788052, 0.5763701, 1.688134, 1, 1, 1, 1, 1,
0.9851549, 1.193148, 1.847599, 1, 1, 1, 1, 1,
0.9912072, -0.8390741, 2.215905, 1, 1, 1, 1, 1,
0.9930062, -0.8105142, 3.150302, 0, 0, 1, 1, 1,
0.9947506, -0.08484695, 2.207285, 1, 0, 0, 1, 1,
1.004873, 0.4445862, 2.327509, 1, 0, 0, 1, 1,
1.00825, -0.6063415, 3.210209, 1, 0, 0, 1, 1,
1.010468, 0.1511394, 1.687111, 1, 0, 0, 1, 1,
1.013044, 1.472713, -1.260662, 1, 0, 0, 1, 1,
1.016407, -1.482252, 1.806747, 0, 0, 0, 1, 1,
1.035733, 0.1755719, 1.278074, 0, 0, 0, 1, 1,
1.043262, -1.540657, 1.893119, 0, 0, 0, 1, 1,
1.046855, -0.1989392, 3.517668, 0, 0, 0, 1, 1,
1.046916, 0.5927458, 2.340812, 0, 0, 0, 1, 1,
1.050233, -0.5259126, 1.935936, 0, 0, 0, 1, 1,
1.051934, 0.3940749, 1.80419, 0, 0, 0, 1, 1,
1.05428, -0.5337577, 0.6453459, 1, 1, 1, 1, 1,
1.059311, 1.263397, 0.1218643, 1, 1, 1, 1, 1,
1.066602, -1.307254, 2.377361, 1, 1, 1, 1, 1,
1.067154, -0.01474334, 2.289949, 1, 1, 1, 1, 1,
1.0729, -0.8482219, 2.095909, 1, 1, 1, 1, 1,
1.084978, -0.7977787, -0.1122291, 1, 1, 1, 1, 1,
1.089259, -0.1145545, 1.589254, 1, 1, 1, 1, 1,
1.091606, 0.1811826, 2.302142, 1, 1, 1, 1, 1,
1.09756, 0.1354585, 2.341828, 1, 1, 1, 1, 1,
1.10699, -0.5773932, 2.58889, 1, 1, 1, 1, 1,
1.111005, -1.74582, 2.292743, 1, 1, 1, 1, 1,
1.117916, -0.3996066, 2.731057, 1, 1, 1, 1, 1,
1.125998, -0.9521446, 0.8180832, 1, 1, 1, 1, 1,
1.137756, -1.438535, 1.660209, 1, 1, 1, 1, 1,
1.139745, -0.009545346, 1.32389, 1, 1, 1, 1, 1,
1.142323, -0.4413546, 3.291784, 0, 0, 1, 1, 1,
1.145643, 1.454609, 1.979616, 1, 0, 0, 1, 1,
1.15072, -0.6810657, 0.5033574, 1, 0, 0, 1, 1,
1.155186, 0.5972195, 2.942992, 1, 0, 0, 1, 1,
1.159307, -0.9090219, 1.287189, 1, 0, 0, 1, 1,
1.161063, -0.9635141, 2.061299, 1, 0, 0, 1, 1,
1.161621, -0.6230933, 1.582012, 0, 0, 0, 1, 1,
1.162845, -1.51117, 3.095629, 0, 0, 0, 1, 1,
1.163929, 0.6144671, 0.6521236, 0, 0, 0, 1, 1,
1.164488, -0.7980995, 2.763632, 0, 0, 0, 1, 1,
1.167471, -0.2299842, 5.205851, 0, 0, 0, 1, 1,
1.173509, 1.069511, 0.3279281, 0, 0, 0, 1, 1,
1.178922, 0.2826742, 2.715312, 0, 0, 0, 1, 1,
1.180123, -0.09938712, -0.1875265, 1, 1, 1, 1, 1,
1.182942, 0.05825741, 1.465464, 1, 1, 1, 1, 1,
1.189196, 0.6767, 0.320208, 1, 1, 1, 1, 1,
1.190309, -0.9160576, 0.8171112, 1, 1, 1, 1, 1,
1.192439, 1.065084, -0.3955873, 1, 1, 1, 1, 1,
1.192756, -0.9955071, 1.251024, 1, 1, 1, 1, 1,
1.194788, 1.038277, 2.06931, 1, 1, 1, 1, 1,
1.20562, 0.1494604, 0.6878516, 1, 1, 1, 1, 1,
1.212327, -0.1229107, 1.977866, 1, 1, 1, 1, 1,
1.217108, -0.9709601, 2.931622, 1, 1, 1, 1, 1,
1.21932, 0.1196906, 0.5898632, 1, 1, 1, 1, 1,
1.223359, -1.227863, 4.207245, 1, 1, 1, 1, 1,
1.224081, -0.4114873, 2.083675, 1, 1, 1, 1, 1,
1.226426, -0.09611082, 2.179328, 1, 1, 1, 1, 1,
1.230171, -1.834598, 3.837703, 1, 1, 1, 1, 1,
1.234489, -0.1864397, 2.397399, 0, 0, 1, 1, 1,
1.248988, -1.42812, 3.678647, 1, 0, 0, 1, 1,
1.259459, -0.3176517, 3.974396, 1, 0, 0, 1, 1,
1.260402, 1.279761, 1.768136, 1, 0, 0, 1, 1,
1.261536, 0.542343, 1.677519, 1, 0, 0, 1, 1,
1.261813, 0.7670535, 0.06203461, 1, 0, 0, 1, 1,
1.262903, 0.7345654, -0.1605249, 0, 0, 0, 1, 1,
1.263159, 0.8659241, 3.708202, 0, 0, 0, 1, 1,
1.267133, -1.178185, 1.447505, 0, 0, 0, 1, 1,
1.268588, 0.3528282, 0.4676307, 0, 0, 0, 1, 1,
1.282102, 1.961715, 1.038872, 0, 0, 0, 1, 1,
1.3101, 1.745622, -2.666163, 0, 0, 0, 1, 1,
1.310623, -0.1348924, 2.735816, 0, 0, 0, 1, 1,
1.312153, 0.3607943, -0.553517, 1, 1, 1, 1, 1,
1.312421, -2.54093, 3.537734, 1, 1, 1, 1, 1,
1.321406, -0.3685781, 0.9991224, 1, 1, 1, 1, 1,
1.329388, -2.051063, 2.175936, 1, 1, 1, 1, 1,
1.342115, -0.9608621, 0.6561217, 1, 1, 1, 1, 1,
1.343533, -0.3010423, 2.130023, 1, 1, 1, 1, 1,
1.349961, -0.7095391, 0.4330095, 1, 1, 1, 1, 1,
1.350042, -0.06162714, 2.373948, 1, 1, 1, 1, 1,
1.362536, -0.441477, 2.570575, 1, 1, 1, 1, 1,
1.379052, -0.7821993, 2.008196, 1, 1, 1, 1, 1,
1.391013, -1.003975, 2.832443, 1, 1, 1, 1, 1,
1.395934, 0.239075, 1.837878, 1, 1, 1, 1, 1,
1.405751, -0.5214838, 1.675765, 1, 1, 1, 1, 1,
1.416742, -0.9159407, -0.810595, 1, 1, 1, 1, 1,
1.436697, 2.100702, 2.073749, 1, 1, 1, 1, 1,
1.437625, -0.3109373, 3.232828, 0, 0, 1, 1, 1,
1.446751, -0.9302557, 1.049686, 1, 0, 0, 1, 1,
1.452566, -1.583794, 2.328486, 1, 0, 0, 1, 1,
1.473625, 0.1217947, 1.012137, 1, 0, 0, 1, 1,
1.473949, 0.3679213, 2.601448, 1, 0, 0, 1, 1,
1.479046, -0.1153291, 1.053334, 1, 0, 0, 1, 1,
1.482631, -0.3554975, 1.310785, 0, 0, 0, 1, 1,
1.501808, 0.3988428, 1.727829, 0, 0, 0, 1, 1,
1.514946, -0.7980374, 2.223088, 0, 0, 0, 1, 1,
1.516768, -0.7782113, 2.441707, 0, 0, 0, 1, 1,
1.517727, -0.2147238, 1.537983, 0, 0, 0, 1, 1,
1.517844, 0.1004432, 1.575042, 0, 0, 0, 1, 1,
1.524867, -1.521445, 2.185243, 0, 0, 0, 1, 1,
1.532045, 0.6566572, -0.444924, 1, 1, 1, 1, 1,
1.550865, -0.2871971, 2.816478, 1, 1, 1, 1, 1,
1.552493, -0.7499112, 0.6734062, 1, 1, 1, 1, 1,
1.554584, 1.017461, 1.550113, 1, 1, 1, 1, 1,
1.588665, -0.3665177, 1.003966, 1, 1, 1, 1, 1,
1.592332, -0.6716827, 2.575851, 1, 1, 1, 1, 1,
1.610828, -0.471972, 2.973584, 1, 1, 1, 1, 1,
1.625901, 0.2901042, 0.5248547, 1, 1, 1, 1, 1,
1.63215, 1.753964, 0.4720791, 1, 1, 1, 1, 1,
1.63975, 1.080075, 1.538438, 1, 1, 1, 1, 1,
1.671009, 1.095047, -0.8727469, 1, 1, 1, 1, 1,
1.691279, 0.9286129, 1.00194, 1, 1, 1, 1, 1,
1.728381, -0.3574711, 1.064636, 1, 1, 1, 1, 1,
1.729765, -0.03828823, 2.383185, 1, 1, 1, 1, 1,
1.754813, -0.6920773, 0.8696845, 1, 1, 1, 1, 1,
1.767069, 1.941284, 0.1704585, 0, 0, 1, 1, 1,
1.793867, 0.5923074, -0.2078048, 1, 0, 0, 1, 1,
1.810784, 1.082253, 0.2015944, 1, 0, 0, 1, 1,
1.810995, 0.7549157, 0.418544, 1, 0, 0, 1, 1,
1.813519, 0.3098931, 1.839015, 1, 0, 0, 1, 1,
1.813974, 0.3963681, 0.7200205, 1, 0, 0, 1, 1,
1.816057, -1.735394, 3.27352, 0, 0, 0, 1, 1,
1.826471, 0.3533572, 0.794718, 0, 0, 0, 1, 1,
1.831247, -0.0996429, -0.1761206, 0, 0, 0, 1, 1,
1.834474, -0.9968499, 3.111908, 0, 0, 0, 1, 1,
1.841096, 0.2434525, 0.2718416, 0, 0, 0, 1, 1,
1.874045, -0.9405723, 2.556743, 0, 0, 0, 1, 1,
1.880009, 0.429543, 0.6486536, 0, 0, 0, 1, 1,
1.89513, -0.7525799, 2.561317, 1, 1, 1, 1, 1,
1.905019, 2.001729, 0.9776223, 1, 1, 1, 1, 1,
1.906819, 2.228332, 2.337158, 1, 1, 1, 1, 1,
1.907763, -0.2790301, 2.00861, 1, 1, 1, 1, 1,
1.909781, 0.8105876, 2.500776, 1, 1, 1, 1, 1,
1.925751, 2.071553, 2.300429, 1, 1, 1, 1, 1,
1.993442, 0.5871658, 2.42738, 1, 1, 1, 1, 1,
2.00105, 0.6618307, 0.162082, 1, 1, 1, 1, 1,
2.001466, -0.7973063, 2.843259, 1, 1, 1, 1, 1,
2.029863, -2.101894, 2.058369, 1, 1, 1, 1, 1,
2.035, 1.016443, 0.3770467, 1, 1, 1, 1, 1,
2.073247, -1.426288, 2.218101, 1, 1, 1, 1, 1,
2.077021, 0.094428, 1.375931, 1, 1, 1, 1, 1,
2.079676, -0.633059, 1.615292, 1, 1, 1, 1, 1,
2.088033, -0.8079488, 1.117327, 1, 1, 1, 1, 1,
2.100383, 1.108359, 0.8323127, 0, 0, 1, 1, 1,
2.134392, 0.2132056, 2.449893, 1, 0, 0, 1, 1,
2.242829, 1.07006, 1.799269, 1, 0, 0, 1, 1,
2.253454, 0.03740892, 1.766076, 1, 0, 0, 1, 1,
2.261435, -0.02969291, 0.9948928, 1, 0, 0, 1, 1,
2.328662, -0.7134396, 1.958363, 1, 0, 0, 1, 1,
2.356376, -0.1425533, 1.906078, 0, 0, 0, 1, 1,
2.36526, 0.57482, 1.893229, 0, 0, 0, 1, 1,
2.440613, 1.29015, 1.770012, 0, 0, 0, 1, 1,
2.462409, 1.09458, 0.7596973, 0, 0, 0, 1, 1,
2.484948, 0.3109268, 0.2665176, 0, 0, 0, 1, 1,
2.501872, 0.1003943, 2.455953, 0, 0, 0, 1, 1,
2.563874, -0.03283986, 2.511615, 0, 0, 0, 1, 1,
2.582495, 0.1469242, 1.498631, 1, 1, 1, 1, 1,
2.586494, 0.283937, 2.736197, 1, 1, 1, 1, 1,
2.64104, 0.09420048, 1.978547, 1, 1, 1, 1, 1,
2.64546, 1.33762, 1.346306, 1, 1, 1, 1, 1,
2.772352, -1.214065, 1.413131, 1, 1, 1, 1, 1,
3.163923, 0.09989075, 1.096349, 1, 1, 1, 1, 1,
3.49366, 1.40704, 1.616324, 1, 1, 1, 1, 1
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
var radius = 9.884466;
var distance = 34.71877;
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
mvMatrix.translate( 0.08589029, 0.6010766, -0.1277251 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.71877);
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
